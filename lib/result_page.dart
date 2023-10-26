import 'package:flutter/material.dart';
import 'userdata.dart';
import 'const.dart';
import 'hesap.dart';

class ResultPage extends StatelessWidget {
  final userData _userData;
  ResultPage(this._userData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SONUC SAYFASI'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                    Hesap(_userData).hesablama().toString(),
                style: metinStili,
              ))),
          Expanded(
            flex: 1,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'BAŞA DÖN',
                style: metinStili,
              ),
            ),
          )
        ],
      ),
    );
  }
}
