import 'package:coba_mvp/contract/addFilmContract.dart';
import 'package:coba_mvp/presenters/addPresenter.dart';
import 'package:coba_mvp/presenters/cobaPresenter.dart';
import 'package:coba_mvp/views/cobaView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class tambah_film extends StatelessWidget implements addFilmContract{
  final _addPresenter = Get.put(addPresenter());
  final _formKey = GlobalKey<FormState>();
  TextEditingController titCont = TextEditingController();
  TextEditingController synCont = TextEditingController();
  TextEditingController covCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Align(
      alignment: Alignment.topRight,
      child: Text('Add Film')),
      ),
      body: Container(
            margin: const EdgeInsets.only(right: 25.0, left: 25.0, top: 25.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: titCont,
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
                  controller: synCont,
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
                  controller: covCont,
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
                          _addPresenter.addfilmContract = this;
                          String title = titCont.text;
                          String synop = synCont.text;
                          String cover = covCont.text;
                          _addPresenter.save(
                              title,
                              synop,
                              cover);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CobaView()));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Data berhasil Ditambahkan")
                            ));
                        }
                        // else {
        
                        // }
                      },
                      child: Text("Save")),
              ],
            ),
          ),
        ),
        ),
    );
  }

  @override
  void onSaveFailed(String message) {
    // TODO: implement onSaveFailed
  }

  @override
  void onSaveSuccess(String message) {
    // TODO: implement onSaveSuccess
  }
}