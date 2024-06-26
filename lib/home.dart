import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final WebSocketChannel channel = WebSocketChannel.connect(
    Uri.parse('ws://192.168.88.56:81'),
  );

  String weight = '00000000';

  @override
  void initState() {
    super.initState();
    channel.stream.listen((data) {
      setState(() {
        weight = data;
      });
    });
  }

  @override
  void dispose() {
    channel.sink.close(status.goingAway);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/back.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
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
                  color: const Color(0xffD3EEF9).withOpacity(0.8),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/logo1.png',
                    height: 100,
                  ),
                ),
              ),
              // End Logo
              const SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Mobile Scale',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'The Mobile Scale appplication is a digital-based '
                      'application which has the function of measuring the'
                      'weight of an object of certain size.',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // Start Container Timbangan
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: Column(
                  children: [
                    // Start Decoration Circle Atas
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 10),
                      child: Row(
                        children: [
                          const Spacer(),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffE12525),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffD3EEF9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // End Decoration Circle Atas

                    // Start Container Timbangan
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            child: Container(
                              height: 45,
                              color: const Color(0xffE12525).withOpacity(0.3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    weight,
                                  ),
                                  const Text(
                                    '/GR',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/timbangan.png',
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                    // End Container Timbangan

                    // Start Decoration Circle Bawah
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffE12525),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffD3EEF9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // End Decoration Circle Bawah
                  ],
                ),
              ),
              // End Container Timbangan
            ],
          ),
        ),
      ),
    );
  }
}