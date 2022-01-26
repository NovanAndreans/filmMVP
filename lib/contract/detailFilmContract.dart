import 'package:coba_mvp/models/CobaModel.dart';

abstract class DetailFilmContract {
  void onFetchStart();
  void onFetchSuccess(Coba coba);
  void onFetchFailed(String message);
  void onEditStart();
  void onEditSuccess(String message);
  void onEditFailed(String message);
}
