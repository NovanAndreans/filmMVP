import 'package:coba_mvp/contract/detailFilmContract.dart';
import 'package:coba_mvp/services/cobaService.dart';

class DetailPresenter {
  CobaService _cobaService = CobaService();
  late detailFilmContract _detailFilmContract;

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

  set setDetailContract(detailFilmContract detailFilmContract) {
    _detailFilmContract = detailFilmContract;
  }
}
