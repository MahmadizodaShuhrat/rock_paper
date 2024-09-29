import 'dart:math';
// import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int burd = 0;
  int bokht = 0;
  bool ikonka = false;
  String dropdown = 'tj';
  String userChoiceImage = '';
  String compyterChoiceImage = '';
  String _result = "Натичаи бозиро интизор шав!";
  final List<String> _options = ["Mushт", "Kaychi", "Shapalak"];

  

  void _playGame(String userChoice) {
    var random = Random();
    String computerChoice = _options[random.nextInt(3)];

    setState(() {
      userChoiceImage = choiceImage(userChoice);
      compyterChoiceImage = choiceImage(computerChoice);
    });

    String result;
    if (userChoice == computerChoice) {
      result = "Мусови!";
    } else if ((userChoice == "Mushт" && computerChoice == "Kaychi") ||
               (userChoice == "Kaychi" && computerChoice == "Shapalak") ||
               (userChoice == "Shapalak" && computerChoice == "Mushт")) {
      result = "Шумо ғолиб шудед!";
      burd++;
      // FlameAudio.play('audio/point.wav'); // Овози ғалаба
    } else {
      result = "Компютер ғолиб шуд!";
      bokht++;
    }

    setState(() {
      _result = result;
    });
  }

  String choiceImage(String choice) {
    switch (choice) {
      case "Mushт":
        return 'asset/images/OIP.jpg';
      case "Kaychi":
        return 'asset/images/OIP (2).jpg';
      case "Shapalak":
        return 'asset/images/OIP (1).jpg';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          'Мушт, кайчи, коғаз',
          style: TextStyle(fontSize: 25.sp),
        ),
        actions: [

          
          IconButton(
              onPressed: () {
                setState(() {
                  burd = 0;
                  bokht = 0;
                  userChoiceImage = '';
                  compyterChoiceImage = '';
                  _result = "Натичаи бозиро интизор шав!";
                });
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.lightBlue[100]!],
              begin: Alignment.center,
              end: Alignment.bottomRight,
            ),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'галаба $burd',
                  style: const TextStyle(fontSize: 24),
                ),
                SizedBox(width: 50.w),
                Text(
                  'бохт $bokht',
                  style: const TextStyle(fontSize: 24, color: Colors.red),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Text(
              _result,
              style: const TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (userChoiceImage.isNotEmpty)
                  Image.asset(userChoiceImage, height: 100.h),
                userChoiceImage.isNotEmpty
                    ? Text('VS', style: TextStyle(fontSize: 24.sp))
                    : SizedBox.shrink(),
                if (compyterChoiceImage.isNotEmpty)
                  Image.asset(compyterChoiceImage, height: 100.h)
              ],
            ),
            SizedBox(height: 250.h),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _playGame("Mushт"),
                    child: Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 1,
                                blurStyle: BlurStyle.normal,
                                color: Colors.white)
                          ],
                          image: const DecorationImage(
                            image: AssetImage('asset/images/OIP.jpg'),
                          ),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _playGame("Kaychi"),
                    child: Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 1,
                                blurStyle: BlurStyle.normal,
                                color: Colors.white)
                          ],
                          image: const DecorationImage(
                            image: AssetImage('asset/images/OIP (2).jpg'),
                          ),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _playGame("Shapalak"),
                    child: Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 1,
                                blurStyle: BlurStyle.normal,
                                color: Colors.white)
                          ],
                          image: const DecorationImage(
                            image: AssetImage('asset/images/OIP (1).jpg'),
                          ),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
