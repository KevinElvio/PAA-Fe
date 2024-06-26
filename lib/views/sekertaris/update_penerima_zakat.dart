import 'package:emosque_mobile/views/sekertaris/input_form.dart';
import 'package:emosque_mobile/widgets/calender.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatePenerimaZakatSekertaris extends StatefulWidget {
  const UpdatePenerimaZakatSekertaris({super.key});

  @override
  State<UpdatePenerimaZakatSekertaris> createState() =>
      _UpdatePenerimaZakatSekertaris();
}

class _UpdatePenerimaZakatSekertaris
    extends State<UpdatePenerimaZakatSekertaris> {
  DateTime? selectedDate;
  void _handleDateSelection(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Penyaluran Zakat",
          style: GoogleFonts.poppins(
              color: Colors.green[700],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InputForm(judul: "Nama Yayasan", hint: "YPM Blablabla"),
              InputForm(judul: "Rekapan Total Beras", hint: "500 Kilogram"),
              Container(
                margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rekapan Total Uang",
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: Row(
                        children: [
                          Container(
                            height: 52,
                            width: 52,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromRGBO(172, 172, 172, 1),
                                  width: 0.7),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                                topRight: Radius.circular(
                                    0), // Tidak ada radius di sudut kanan atas
                                bottomRight: Radius.circular(
                                    0), // Tidak ada radius di sudut kanan bawah
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Rp",
                                textAlign: TextAlign
                                    .center, // Mengatur penempatan horizontal
                                style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(136, 136, 136, 1),
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          // Memberikan jarak antara kedua Container
                          Expanded(
                            // Menggunakan Expanded untuk Container kedua
                            child: Container(
                              height: 52,
                              // Mengatur lebar Container kedua menjadi maksimal
                              width: double.infinity,
                              padding: const EdgeInsets.only(left: 12),
                              decoration: const BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                      color: Color.fromRGBO(172, 172, 172, 1),
                                      width: 0.7,
                                    ),
                                    top: BorderSide(
                                      color: Color.fromRGBO(172, 172, 172, 1),
                                      width: 0.7,
                                    ),
                                    bottom: BorderSide(
                                      color: Color.fromRGBO(172, 172, 172, 1),
                                      width: 0.7,
                                    ),
                                    left: BorderSide.none),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  bottomLeft: Radius.circular(0),
                                  topRight: Radius.circular(
                                      8), // Tidak ada radius di sudut kanan atas
                                  bottomRight: Radius.circular(
                                      8), // Tidak ada radius di sudut kanan bawah
                                ),
                              ),

                              child: TextFormField(
                                autofocus: false,
                                cursorColor:
                                    const Color.fromRGBO(172, 172, 172, 1),
                                style: const TextStyle(
                                    color: Color.fromRGBO(136, 136, 136, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                    hintText: "500.000",
                                    hintStyle: GoogleFonts.poppins(
                                        color: const Color.fromRGBO(
                                            136, 136, 136, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                    focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide.none),
                                    border: const UnderlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tanggal Rekapan",
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Calender(onDateSelected: _handleDateSelection),
              Container(
                margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Penyaluran",
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      height: 52,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(172, 172, 172, 1),
                              width: 0.7),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text("Rp 50.000, Beras 10 Kilogram",
                                style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromRGBO(172, 172, 172, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upload Bukti Surat",
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      height: 86,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(172, 172, 172, 1),
                              width: 0.7),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.file_upload_outlined,
                            size: 30,
                            color: Color.fromRGBO(172, 172, 172, 1),
                          ),
                          Text("fotopangan.jpg",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        height: 40,
        width: 125,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: const Color.fromRGBO(55, 163, 165, 1),
          ),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) => zakatFitrah(),
            //   ));
          },
          child: const Center(
            child: Row(
              children: [
                Icon(
                  Icons.update,
                  color: Colors.white,
                  size: 17,
                ),
                SizedBox(width: 10),
                Text(
                  'Update',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
