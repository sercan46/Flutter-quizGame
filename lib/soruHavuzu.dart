import 'package:quiz_f/soru.dart';

class SoruHavuzu{
    int _soruIndex=0;

    List<Soru> _soruBankasi=[
    Soru(soruText: 'Fatih Sultan Mehmet ilk padişahtır', soruCevap: false),
    Soru(
        soruText: 'Apple firmasının geliştirdiği web tarayıcı safaridir',
        soruCevap: true),
    Soru(
        soruText: 'Flutter Facebook tarafından geliştiriliyor',
        soruCevap: false),
            Soru(
        soruText: '-1 doğal sayıdır',
        soruCevap: true),
                 Soru(
        soruText: 'Hz.Ali Peygamberdir',
        soruCevap: false),
               Soru(
        soruText: 'Fransa bayrağında 4 renk vardır',
        soruCevap: false),
    ];
    String soruTextGetir(){
      return _soruBankasi[_soruIndex].soruText;
    }
    bool soruCevapGetir(){
      return _soruBankasi[_soruIndex].soruCevap;
    }
    void sonrakiSoruGetir(){
      if(_soruIndex<_soruBankasi.length-1){
        _soruIndex++;
      }
    }
    bool sorularBittiMi(){
      if(_soruIndex>=_soruBankasi.length-1){
        return true;
      }
      else{
        return false;
      }
    }
    void reset(){
      _soruIndex=0;
    }

}