import 'package:flutter/material.dart';
import 'package:test_jti/core/btn.dart';
import 'package:test_jti/core/color.dart';
import 'package:test_jti/core/href.dart';
import 'package:test_jti/core/input.dart';
import 'package:test_jti/core/loading.dart';
import 'package:test_jti/core/txt.dart';
import 'package:test_jti/view/home.dart';
import 'package:test_jti/core/size.dart';
import 'package:test_jti/viewmodel/pengguna-vm.dart';

class CreatePenggunaScreen extends StatefulWidget {
  @override
  _CreatePenggunaScreenState createState() => _CreatePenggunaScreenState();
}

class _CreatePenggunaScreenState extends State<CreatePenggunaScreen> {
  TextEditingController nama = new TextEditingController();
  TextEditingController usia = new TextEditingController();
  TextEditingController kota = new TextEditingController();
  void submit() {
    if (nama.text == '' || usia.text == '' || kota.text == '') {
      Loading.fFails(msg: "Silahkan lengkapi inputan yang disediakan");
    } else {
      PenggunaVM.store(kota: kota.text, usia: usia.text, nama: nama.text)
          .then((value) {
        Loading.fSuccess(msg: "Berhasil membuat data pengguna !");
        Routes.stfR(context, HomeScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Clr.container,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Clr.white,
          ),
          onPressed: () {
            Routes.stfR(context, HomeScreen());
          },
        ),
        backgroundColor: Clr.primary,
        title: PopinText(
          isi: "Tambah Pengguna",
          color: Clr.white,
          weight: FontWeight.w400,
          size: 16,
        ),
        centerTitle: true,
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: PopinText(
                isi: "Lengkapilah data di bawah ini !",
              ),
            ),
            SizedBox(
              height: 40,
            ),
            PopinText(
              isi: "Nama Lengkap",
              size: 12,
              color: Clr.black,
            ),
            Input(
              controller: nama,
              placeholder: "Nama lengkap",
              input: TextInputType.name,
            ),
            SizedBox(
              height: 7.5,
            ),
            PopinText(
              isi: "Usia",
              size: 12,
              color: Clr.black,
            ),
            Input(
              controller: usia,
              placeholder: "Usia",
              input: TextInputType.text,
            ),
            SizedBox(
              height: 7.5,
            ),
            PopinText(
              isi: "Kota",
              size: 12,
              color: Clr.black,
            ),
            Input(
              controller: kota,
              placeholder: "Kota",
              input: TextInputType.name,
            ),
            SizedBox(
              height: 35,
            ),
            InkWell(
              onTap: () {
                submit();
              },
              child: Button(
                isi: "Submit",
                colorButton: Clr.primary,
                colorText: Clr.white,
                size: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
