import 'package:coba_mvp/models/CobaModel.dart';

abstract class CobaContract {
  void onFetchSucess(List<Coba> coba);
  void onFetchFailed(String message);
  void onDeleteSuccess(String message);
  void onDeleteError(String message);
}
