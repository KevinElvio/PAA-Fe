import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/widgets/calender.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:emosque_mobile/models/models.dart';

class UpdatePengeluaranBendahara extends StatefulWidget {
  final int idKas;
  final String judul;
  final String tanggal;
  final int nominal;
  final String deskripsi;

  const UpdatePengeluaranBendahara({
    super.key,
    required this.idKas,
    required this.judul,
    required this.tanggal,
    required this.nominal,
    required this.deskripsi,
  });

  @override
  State<UpdatePengeluaranBendahara> createState() =>
      _UpdatePengeluaranBendaharaState();
}

class _UpdatePengeluaranBendaharaState
    extends State<UpdatePengeluaranBendahara> {
  late TextEditingController judulController;
  late TextEditingController nominalController;
  late TextEditingController deskripsiController;
  DateTime? selectedDate;

  void _handleDateSelection(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  void initState() {
    super.initState();
    judulController = TextEditingController(text: widget.judul);
    nominalController = TextEditingController(text: widget.nominal.toString());
    deskripsiController = TextEditingController(text: widget.deskripsi);
    if (widget.tanggal.isNotEmpty) {
          selectedDate = DateFormat('yyyy-MM-dd').parse(widget.tanggal);
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Pengeluaran",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.green[700],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              textField(
                "Judul Pengeluaran",
                "Masukan Judul Pengeluaran",
                judulController,
                context,
              ),
              textField(
                "Nominal",
                "Masukan Nominal",
                nominalController,
                context,
              ),
              textField(
                "Deskripsi",
                "Masukan Deskripsi",
                deskripsiController,
                context,
              ),
              Calender(onDateSelected: _handleDateSelection),
              const SizedBox(
                height: 80,
              ),
              const Text(".")
            ],
          ),
        ),
      ),
      bottomSheet: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            color: Colors.white,
          ),
          Positioned(
            top: 35,
            right: 20,
            left: 20,
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (judulController.text.isEmpty ||
                      nominalController.text.isEmpty ||
                      deskripsiController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Data tidak boleh kosong')),
                    );
                  }
                  final formattedDate =
                      DateFormat('yyyy-MM-dd').format(selectedDate!);
                  final updateKas = SaldoKas(
                      0,
                      judulController.text,
                      'pengeluaran',
                      formattedDate,
                      int.parse(nominalController.text),
                      deskripsiController.text);
                  Provider.of<KasProvider>(context, listen: false)
                      .updateKas(widget.idKas, updateKas)
                      .then((_) => Navigator.pushReplacementNamed(
                                  context, '/readpemasukanbendahara')
                              .catchError((error) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Error update kas'),
                            ));
                          }));

                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green[700]),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: Text(
                  "Simpan Perubahan",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            left: 20,
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<KasProvider>(context, listen: false)
                      .deleteKas(widget.idKas)
                      .then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data pengeluaran berhasil dihapus'),
                      ),
                    );
                    Navigator.pushReplacementNamed(context, "/readpengeluaranbendahara");
                  }).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Gagal menghapus data pengeluaran'),
                      ),
                    );
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 255, 255, 255)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      color: Colors.green, // Warna stroke
                      width: 1.0, // Ketebalan stroke
                      style: BorderStyle.solid, // Gaya stroke (solid, dashed, atau dotted)
                    ),
                  ),
                ),
                child: Text(
                  "Hapus Pengeluaran",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.green[700],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget textField(
    String text,
    String hint,
    TextEditingController controller,
    BuildContext context,
  ) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 55,
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
