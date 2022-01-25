 import 'package:coba_mvp/contract/addFilmContract.dart';
import 'package:coba_mvp/services/cobaService.dart';

class addPresenter{
  CobaService _cobaService = CobaService();
  late addFilmContract _addFilmContract;
 void save(String title, String synop, String cover) {
    _cobaService
        .save(
            title, synop, cover)
        .then(
      (value) {
        _addFilmContract.onSaveSuccess(value['message']);
        print(value['message']);
      },
    ).catchError((message) {
      _addFilmContract.onSaveFailed(message.toString());
    });
  }

  set addfilmContract(addFilmContract addfilmContract) {
    _addFilmContract = addfilmContract;
  }
}