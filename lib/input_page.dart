import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_uygulamasi/const.dart';
import 'package:yasam_uygulamasi/userdata.dart';
import 'package:yasam_uygulamasi/result_page.dart';
import 'icon_cinsiyyet.dart';
import 'BoxWidget.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyyet;
  double sigaraSayi = 15;
  double sporSayi = 3;
  int boy = 170;
  int kilo = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'YAŞAM BEKLENTİSİ',
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: BoxWidget(
                      onPress: () {},
                      child: buildRow('BOY'),
                    ),
                  ),
                  Expanded(
                    child: BoxWidget(
                      onPress: () {},
                      child: buildRow('KILO'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BoxWidget(
                onPress: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Günde kaç sigara içiyorsunuz?', style: metinStili),
                    Text(sigaraSayi.round().toString(), style: rakamStili),
                    Slider(
                        min: 0,
                        max: 30,
                        value: sigaraSayi,
                        onChanged: (double newValue) {
                          setState(() {
                            sigaraSayi = newValue;
                          });
                        }),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BoxWidget(
                onPress: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Haftada kaç gün spor yapıyorsunuz?',
                        style: metinStili),
                    Text(sporSayi.round().toString(), style: rakamStili),
                    Slider(
                        min: 0,
                        max: 7,
                        value: sporSayi,
                        onChanged: (double newValue) {
                          setState(() {
                            sporSayi = newValue;
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: BoxWidget(
                      onPress: () {
                        setState(() {
                          seciliCinsiyyet = 'KADIN';
                        });
                      },
                      renk: seciliCinsiyyet == 'KADIN'
                          ? Colors.blue
                          : Colors.white,
                      child: IconCinsiyyet(
                        cinsiyyet: 'KADIN',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                  Expanded(
                    child: BoxWidget(
                      onPress: () {
                        setState(() {
                          seciliCinsiyyet = 'ERKEK';
                        });
                      },
                      renk: seciliCinsiyyet == 'ERKEK'
                          ? Colors.blue
                          : Colors.white,
                      child: IconCinsiyyet(
                        cinsiyyet: 'ERKEK',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size.fromHeight(70.0)),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(userData(
                                boy: boy,
                                kilo: kilo,
                                seciliCinsiyyet: seciliCinsiyyet!,
                                sigaraSayi: sigaraSayi,
                                sporSayi: sporSayi))));
                  });
                },
                child: Text(
                  'HESAPLA',
                  style: metinStili,
                ))
          ],
        ));
  }

  Row buildRow(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label,
            style: metinStili,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label == 'BOY' ? boy.toString() : kilo.toString(),
            style: rakamStili,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy++ : kilo++;
                  });
                },
                child: Icon(FontAwesomeIcons.plus)),
            SizedBox(
              height: 10,
            ),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy-- : kilo--;
                  });
                },
                child: Icon(FontAwesomeIcons.minus)),
          ],
        ),
      ],
    );
  }
}
