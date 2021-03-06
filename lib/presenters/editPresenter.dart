import 'package:coba_mvp/contract/cobaContract.dart';
import 'package:coba_mvp/contract/detailFilmContract.dart';
import 'package:coba_mvp/contract/addFilmContract.dart';
import 'package:coba_mvp/models/CobaModel.dart';
import 'package:coba_mvp/services/cobaService.dart';

class EditPresenter {
  CobaService _cobaService = CobaService();
  late DetailFilmContract _detailFilmContract;

  void loadDataDetail(String id) {
    _detailFilmContract.onFetchStart();
    _cobaService
        .findProduct(id)
        .then(
          (value) => _detailFilmContract.onFetchSuccess(value),
        )
        .catchError(
          (message) => _detailFilmContract
              .onFetchFailed(message.toString()),
        );
  }

  void edit(String id, String? title, String? cover,
      String? synop) {
    _detailFilmContract.onEditStart();
    _cobaService
        .editFilm(id, title, cover, synop)
        .then(
          (value) =>
              _detailFilmContract.onEditSuccess(value["message"]),
        )
        .catchError(
      (message) {
        _detailFilmContract.onEditFailed(message.toString());
      },
    );
  }
  
  set DetailContract(DetailFilmContract detailFilmContract) {
    _detailFilmContract = detailFilmContract;
  }

}
