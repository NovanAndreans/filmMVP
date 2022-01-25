import 'package:coba_mvp/contract/cobaContract.dart';
import 'package:coba_mvp/services/cobaService.dart';

class deletePresenter{
  CobaService _cobaService = CobaService();
  late CobaContract _cobaContract;
  
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




































  
}