import 'package:yasam_uygulamasi/userdata.dart';

class Hesap {
  userData _userData;
  Hesap(this._userData);

  double? hesablama() {
    double sonuc;
    sonuc = 90 + _userData.sporSayi - _userData.sigaraSayi;
    sonuc = sonuc + (_userData.boy / _userData.kilo);
    return _userData.seciliCinsiyyet == 'KADIN' ? sonuc + 3 : sonuc++;
  }
}
