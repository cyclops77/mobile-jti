import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_jti/core/color.dart';
import 'package:test_jti/core/href.dart';
import 'package:test_jti/core/txt.dart';
import 'package:test_jti/core/size.dart';
import 'package:test_jti/model/pengguna-m.dart';
import 'package:test_jti/view/create.dart';
import 'package:test_jti/viewmodel/pengguna-vm.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PenggunaModel> data = new List();
  List<PenggunaModel> tmpdata = new List();

  fetch() {
    PenggunaVM.getData().then((value) {
      setState(() {
        data = value;
        tmpdata = value;
      });
    });
  }

  void cariData(String val) {
    List<PenggunaModel> tempData = [];
    for (var item in tmpdata) {
      if (item.nama.toString().contains(val.toString())) {
        setState(() {
          tempData.add(item);
        });
      }
    }
    setState(() {
      data = tempData;
    });
  }

  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Clr.container,
      appBar: AppBar(
        backgroundColor: Clr.primary,
        title: PopinText(
          isi: "Pengguna",
          color: Clr.white,
          weight: FontWeight.w400,
          size: 16,
        ),
        centerTitle: true,
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        padding: EdgeInsets.fromLTRB(
            displayWidth(context) * 0.06, 20, displayWidth(context) * 0.06, 20),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: displayWidth(context) * 0.05),
              width: displayWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: displayWidth(context) * 0.75,
                    child: TextFormField(
                      onChanged: (x) {
                        cariData(x);
                      },
                      decoration: InputDecoration(
                          labelText: "Cari Data Pengguna",
                          labelStyle: TextStyle(
                            fontFamily: "popin",
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          suffixIcon: Icon(
                            Icons.search,
                            size: 16,
                            color: Colors.black54,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (data.length == 0) ...{
              PopinText(
                isi: "Belum ada data pengguna",
                color: Clr.black,
                arah: TextAlign.center,
                line: 3,
              ),
            } else ...{
              for (var item in data) ...{
                Container(
                    margin: EdgeInsets.only(bottom: 7.5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Clr.primary),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    width: displayWidth(context),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        t("Nama", item.nama),
                        t("Usia", "22"),
                        t("Kota", "Jember"),
                      ],
                    ))
              }
            }
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Routes.stfR(context, CreatePenggunaScreen());
        },
        backgroundColor: Clr.primary,
        child: Icon(
          Icons.add,
          color: Clr.white,
        ),
      ),
    );
  }

  Widget t(l, r) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: displayWidth(context) * 0.3,
          child: PopinText(
            isi: l,
            color: Clr.black,
            line: 3,
          ),
        ),
        Container(
          width: displayWidth(context) * 0.05,
          child: PopinText(
            isi: ":",
            color: Clr.black,
            line: 3,
          ),
        ),
        Container(
          width: displayWidth(context) * 0.4,
          child: PopinText(
            isi: r,
            color: Clr.black,
            line: 3,
          ),
        )
      ],
    );
  }
}
