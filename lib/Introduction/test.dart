import 'dart:async';
class test{

  String _hasil = "";

  String get hasil => _hasil;

  StreamController _inputController = StreamController();
  StreamSink get inputan => _inputController.sink;

  StreamController _outputController = StreamController();
  StreamSink get _sinkout => _outputController.sink;

  Stream get ouput => _outputController.stream;

  test(){
    _inputController.stream.listen(
            (event) {
              if (event == 'not much'){
                _hasil = 'not much';
              }
              else if (event == '1-2'){
                _hasil = '1-2';
              }
              else if (event == '3-4'){
                _hasil = '3-4';
              }
              else if (event == '5++'){
                _hasil = '5++';
              }
              else{
                _hasil = "";
              }
              _sinkout.add(_hasil);
            });
  }

}