import 'package:coba_mvp/contract/cobaContract.dart';
import 'package:coba_mvp/models/CobaModel.dart';
import 'package:coba_mvp/presenters/cobaPresenter.dart';
import 'package:coba_mvp/presenters/deletePresenter.dart';
import 'package:coba_mvp/views/detailFilm.dart';
import 'package:coba_mvp/views/edit_film.dart';
import 'package:coba_mvp/views/tambahFilm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CobaView extends StatefulWidget {

  @override
  _CobaViewState createState() => _CobaViewState();
}

class _CobaViewState extends State<CobaView> implements CobaContract {
  CobaPresenter cobaPresenter = CobaPresenter();
  // final productPresenter = Get.find<deletePresenter>();
  // deletePresenter _deletePresenter = deletePresenter();

  _CobaViewState() {
    cobaPresenter.cobaContract = this;
    cobaPresenter.loadData();
  }

  List<Coba> data = [];                                   //Model [<Coba>]

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: 
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => tambah_film()));
                },
              ),
      appBar: AppBar(
          leading: IconButton(
    icon: Icon(Icons.door_front_door),
    onPressed: () => Navigator.of(context).pop(),
  ), 
          title: Align(
            alignment: Alignment.topRight,
            child: Text('Twilight Gallery')),
        ),

      body: Container(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (_, index) {
            var film = data[index];
            return Container(
              margin: const EdgeInsets.only(right: 25.0, left: 25.0, top: 10.0, bottom: 10.0),
              child: Card(color: Colors.blueGrey,
                  child: Column(
                    children: [Container(
                      margin: const EdgeInsets.only(right: 5.0, left: 5.0, top: 10.0),
                      child: GestureDetector(
                        onTap: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return detail_film(id: film.id.toString());

                          }));
                              },
                        child: Image.network(film.cover ?? "https://www.minews.id/wp-content/uploads/2020/12/roll-film.jpg", 
                                    width: 560,
                                    height: 320,
                                    fit:BoxFit.cover),
                      ),
                    ), 
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text(film.title.toString(), 
                      style: TextStyle(fontSize: 20.0,
                      fontWeight: FontWeight.bold),)),
                      Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          edit_film(id: film.id.toString())));
                                            },
                                            child: Icon(Icons.edit)),
                                            
                                        GestureDetector(
                                            // onTap: () {
                                            //   productPresenter.deleteFilm(film.id.toString())
                                            //       .then((value) => {
                                            //             setState(() {}),
                                            //             ScaffoldMessenger.of(
                                            //                     context)
                                            //                 .showSnackBar(
                                            //                     SnackBar(
                                            //               content: Text(
                                            //                   "Data berhasil Dihapus"),
                                            //             ))
                                            //           });
                                            // },
                                            child: Icon(Icons.delete)),
                                      ],
                                    ),SizedBox(height: 10)
                      ],
                  )),
            );
          },
        ),
      ),
    );
  }

  @override
  void onFetchFailed(String message) {
    // TODO: implement onFetchFailed
    print(message);
  }

  @override
  void onFetchSucess(List<Coba> coba) {
    // TODO: implement onFetchSucess
    setState(() {
      data = coba;
    });
  }

  @override
  void onDeleteError(String message) {
    // TODO: implement onDeleteError
  }

  @override
  void onDeleteSuccess(String message) {
    // TODO: implement onDeleteSuccess
  }
} 