import 'package:coba_mvp/contract/detailFilmContract.dart';
import 'package:coba_mvp/models/CobaModel.dart';
import 'package:coba_mvp/presenters/cobaPresenter.dart';
import 'package:coba_mvp/presenters/editPresenter.dart';
import 'package:coba_mvp/views/cobaView.dart';
import 'package:flutter/material.dart';

class edit_film extends StatelessWidget implements detailFilmContract{
  String id;
  edit_film({required this.id}) {
    EditPresenter _cobaPresenter = EditPresenter();
    _cobaPresenter.DetailContract = this;
    _cobaPresenter.loadDataDetail(id);
  }
  EditPresenter _cobaPresenter = EditPresenter();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titCont = TextEditingController();
  TextEditingController _synCont = TextEditingController();
  TextEditingController _covCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Align(
      alignment: Alignment.topRight,
      child: Text('Edit Film')),
      ),
      body: Container(
            margin: const EdgeInsets.only(right: 25.0, left: 25.0, top: 25.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _titCont,
                  decoration: InputDecoration(labelText: "Title", border: OutlineInputBorder(
                  borderSide: BorderSide(
                  color: Colors.red, 
                  width: 5.0),
                  ) ),
                        maxLines: null,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insert Title !!!";
                        }
                      },
                ),
                SizedBox(
                      height: 20,
                    ),
                TextFormField(
                  controller: _synCont,
                  decoration: InputDecoration(labelText: "Synopsis", border: OutlineInputBorder(
                  borderSide: BorderSide(
                  color: Colors.red, 
                  width: 5.0),
                  ) ),
                        maxLines: null,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insert Film Synopsis !!!";
                        }
                      },
                ),
                SizedBox(
                      height: 20,
                    ),
                TextFormField(
                  controller: _covCont,
                  decoration: InputDecoration(labelText: "Cover URL", border: OutlineInputBorder(
                  borderSide: BorderSide(
                  color: Colors.red, 
                  width: 5.0),
                  ) ),
                        maxLines: null,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insert Film Cover URL !!!";
                        }
                      },
                ),
                SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          String idd = id;
                          String title = _titCont.text;
                          String synop = _synCont.text;
                          String cover = _covCont.text;
                          _cobaPresenter.edit(
                            idd,
                              title,
                              synop,
                              cover);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CobaView()));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Data berhasil Diperbarui"),
                            ));
                        }
                        // else {
        
                        // }
                      },
                      child: Text("Update")),
                      SizedBox(
                      height: 30,
                    ),
              ],
            ),
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
    // TODO: implement onFetchSuccess
    print(id);
    _titCont.text = coba.title ?? "rusak";
    _synCont.text = coba.syno ?? "rusak";
    _covCont.text = coba.cover ?? "rusak";
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