import 'package:coba_mvp/contract/cobaContract.dart';
import 'package:coba_mvp/contract/detailFilmContract.dart';
import 'package:coba_mvp/contract/addFilmContract.dart';
import 'package:coba_mvp/models/CobaModel.dart';
import 'package:coba_mvp/services/cobaService.dart';
import 'package:get/get.dart';

class CobaPresenter extends GetxController {
  CobaService _cobaService = CobaService();
  late CobaContract _cobaContract;
  late DetailFilmContract _detailFilmContract;

  void loadData() async {
    _cobaService
        .loadData()
        .then((value) => _cobaContract.onFetchSucess(value))
        .catchError((message) {
      _cobaContract.onFetchFailed(message.toString());
    });
  }

  void loadDataDetail(String id) {
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

void deleteFilm(String id) async {
    _cobaService
        .deleteFilm(id)
        .then(
          (value) => _cobaContract.onDeleteSuccess(value),
        )
        .catchError(
      (message) {
        _cobaContract.onDeleteError(message.toString());
      },
    );
  }

  set cobaContract(CobaContract cobaContract) {
    _cobaContract = cobaContract;
  }

  set setDetailContract(DetailFilmContract detailFilmContract) {
    _detailFilmContract = detailFilmContract;
  }
}
