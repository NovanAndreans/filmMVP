import 'package:coba_mvp/contract/cobaContract.dart';
import 'package:coba_mvp/contract/detailFilmContract.dart';
import 'package:coba_mvp/contract/addFilmContract.dart';
import 'package:coba_mvp/models/CobaModel.dart';
import 'package:coba_mvp/services/cobaService.dart';

class EditPresenter {
  CobaService _cobaService = CobaService();
  late detailFilmContract _detailFilmContract;

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

  void edit(id, title, cover, synop) {
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

  set DetailContract(detailFilmContract detailFilmContract) {
    _detailFilmContract = detailFilmContract;
  }

}
