import 'package:coba_mvp/contract/detailFilmContract.dart';
import 'package:coba_mvp/models/CobaModel.dart';
import 'package:coba_mvp/presenters/cobaPresenter.dart';
import 'package:coba_mvp/views/edit_film.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class detail_film extends StatelessWidget implements DetailFilmContract{
  final String id;
  detail_film({required this.id, Key? key}) : super(key: key) {
    CobaPresenter _cobaPresenter = CobaPresenter();
    _cobaPresenter.setDetailContract = this;
    _cobaPresenter.loadDataDetail(id);
  }
  Rx<Coba>? _film;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Align(
      alignment: Alignment.topRight,
      child: Text('Detail Film')),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                         Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => edit_film(id: id.toString(),)));                           
                      },
                      child: Icon(Icons.edit, color: Colors.blue)),
                      GestureDetector(
                  onTap: () {
                                                
                  },
                  child: Icon(Icons.delete, color: Colors.blue,)),
                  ],
                ),
              ),
              // SizedBox(height: 10),
              // Image.network( ?? "https://www.minews.id/wp-content/uploads/2020/12/roll-film.jpg", 
              //                         width: 550,
              //                         height: 450,
              //                         fit:BoxFit.cover),
              // SizedBox(height: 10),
              // Text(, style: TextStyle(fontSize: 28)),
              // Container(
              //   padding: const EdgeInsets.all(16.0),
              //   width: MediaQuery.of(context).size.width*1.0,
              //   child: Column(
              //   children: [
              //     Text(?? "Sinopsis Belum Tersedia"),
              //   ],
              // )),
              
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onFetchFailed(String message) {
    // TODO: implement onFetchFailed
  }

  @override
  void onFetchSuccess(Coba coba) {
    // TODO: implement onFetchSucess
    _film!.value = coba;
  }

  @override
  void onFetchStart() {
    // TODO: implement onFetchStart
  }

  @override
  void onEditFailed(String message) {
    // TODO: implement onEditFailed
  }

  @override
  void onEditStart() {
    // TODO: implement onEditStart
  }

  @override
  void onEditSuccess(String message) {
    // TODO: implement onEditSuccess
  }
}