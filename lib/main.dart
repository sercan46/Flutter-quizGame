import 'package:flutter/material.dart';
import 'package:quiz_f/soruHavuzu.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> sonucList = [];
  SoruHavuzu soruHavuzu = SoruHavuzu();

  void SoruCevapla(bool kullaniciCevap) {
    setState(() {
      bool dogruCevap = soruHavuzu.soruCevapGetir();
      if (soruHavuzu.sorularBittiMi() == true) {
        if (dogruCevap == kullaniciCevap) {
          dogruCevapSayisi++;
          sonucList.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          sonucList.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBitir();
      } else {
        if (dogruCevap == kullaniciCevap) {
          dogruCevapSayisi++;

          sonucList.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          sonucList.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
              soruHavuzu.sonrakiSoruGetir();

      }

    });
  }

  int dogruCevapSayisi = 0;
  void quizBitir() {
    Alert(
        context: context,
        type: AlertType.info,
        title: "Quiz Tamamlandı",
        desc: 'Doğru sayısı $dogruCevapSayisi',
        buttons: [
          DialogButton(
            child: Text(
              'Tamam',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ]).show();
    soruHavuzu.reset();
    sonucList = [];
    dogruCevapSayisi = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
                child: Text(
              soruHavuzu.soruTextGetir(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25),
            )),
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.lightGreen,
                child: Text('DOĞRU', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  SoruCevapla(true);
                },
              )),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.red,
                child: Text('YANLIŞ', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  SoruCevapla(false);
                },
              )),
        ),
        Row(
          children: sonucList,
        )
      ],
    );
  }
}
