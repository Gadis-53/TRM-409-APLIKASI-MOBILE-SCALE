import 'package:flutter/material.dart';
import 'package:pbl_lulu/home.dart';

class ViewDetail extends StatefulWidget {
  const ViewDetail({super.key});

  @override
  State<ViewDetail> createState() => _ViewDetailState();
}

class _ViewDetailState extends State<ViewDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/back.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
              child: Column(
                children: [
                  // Start Logo
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffD3EEF9).withOpacity(0.8),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/logo1.png',
                        height: 100,
                      ),
                    ),
                  ),
                  // End Logo
                  SizedBox(
                    height: 30,
                  ),
                  // Start Container Histori
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.5),
                      border: Border.all(),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 10),
                          child: Center(
                            child: Text(
                              'History',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // End Container Histori

                  const SizedBox(
                    height: 30,
                  ),

                  // Start Container Tabel Data Histori
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.5),
                      border: Border.all(),
                    ),
                    child: Table(
                      columnWidths: const {
                        0: FixedColumnWidth(0),
                        1: FixedColumnWidth(30.0),
                        2: FixedColumnWidth(30.0),
                        3: FixedColumnWidth(30.0),
                      },
                      children: [
                        TableRow(
                          children: [
                            tableCell('No.', isHeader: true),
                            tableCell('Material', isHeader: true),
                            tableCell('Date', isHeader: true),
                            tableCell('Scale', isHeader: true),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableCell('1'),
                            tableCell('Telor'),
                            tableCell('1-06-2024'),
                            tableCell('100 gr'),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableCell('2'),
                            tableCell('Beras'),
                            tableCell('2-06-2024'),
                            tableCell('200 gr'),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableCell('3'),
                            tableCell('Minyak'),
                            tableCell('3-06-2024'),
                            tableCell('300 gr'),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableCell('4'),
                            tableCell('Tepung'),
                            tableCell('4-06-2024'),
                            tableCell('400 gr'),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableCell('5'),
                            tableCell('Gula'),
                            tableCell('5-06-2024'),
                            tableCell('500 gr'),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableCell('6'),
                            tableCell('Teh'),
                            tableCell('7-06-2024'),
                            tableCell('700 gr'),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableCell('7'),
                            tableCell('Kopi'),
                            tableCell('8-06-2024'),
                            tableCell('800 gr'),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableCell('8'),
                            tableCell('Air Mineral'),
                            tableCell('6-06-2024'),
                            tableCell('600 gr'),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableCell('9'),
                            tableCell('Mie Instan'),
                            tableCell('9-06-2024'),
                            tableCell('900 gr'),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableCell('10'),
                            tableCell('Gas LPG'),
                            tableCell('10-06-2024'),
                            tableCell('1000 gr'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // End Container Data Histori

                  const SizedBox(
                    height: 40,
                  ),

                  // Start Button View
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffE12323).withOpacity(0.5),
                          border: Border.all(),
                        ),
                        child: Center(
                          child: Text(
                            'Back',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // End Button View
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget tableCell(String text, {bool isHeader = false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
