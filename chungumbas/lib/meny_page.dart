import 'package:chungumbas/game_pages.dart';
import 'package:chungumbas/sozdat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenyPage extends StatefulWidget {
  const MenyPage({super.key});

  @override
  State<MenyPage> createState() => _MenyPageState();
}

class _MenyPageState extends State<MenyPage> {
  bool ikonka = false;
  bool zabon = false;
  String dropdown = 'tj';

List text=[
  'ty',
  'yu',
  'ty',
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.blue],
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DropdownButton<String>(
                    value: dropdown,
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    style: TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (String? newvalue) {
                      setState(() {
                        dropdown = newvalue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'tj',
                        child: Text(
                          '🇹🇯',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'ru',
                        child: Text(
                          '🇷🇺',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'en',
                        child: Text(
                          '🇺🇲',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 250.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GameScreen()),
                      (route) => false);
                },
                child: const Sozdat(
                  text1: 'бозии нав',
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SozdatPage()));
                  },
                  child: const Sozdat(text1: 'бозӣ эҷод кунед')),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(color: Colors.blue.shade500),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      ikonka = !ikonka;
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: Column(
                              children: [
                                Text(
                                  'шумо мутмаин ҳастед, ки мехоҳед берун равед?',
                                  style: TextStyle(fontSize: 20.sp),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        SystemNavigator.pop();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 100.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 1,
                                                color: Colors.black),
                                          ],
                                        ),
                                        child: Text(
                                          'Бале',
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30.w,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 100.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 1,
                                                color: Colors.black),
                                          ],
                                        ),
                                        child: Text(
                                          'не',
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ));
                          });
                    });
                  },
                  child: Text(
                    'баромад',
                    style: TextStyle(
                        fontSize: 23.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Sozdat extends StatefulWidget {
  final String text1;
  const Sozdat({super.key, required this.text1});

  @override
  State<Sozdat> createState() => _SozdatState();
}

class _SozdatState extends State<Sozdat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
          color: Colors.blue.shade500,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Text(
        widget.text1,
        style: const TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
