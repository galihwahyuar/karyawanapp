import 'package:flutter/material.dart';
import 'package:karyawanapp/config/config.dart';
import 'package:karyawanapp/config/diohttp.dart';
import '../models/karyawan_model.dart';
import 'home_page.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController idC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController jabatanC = TextEditingController();
  TextEditingController tempatLahirC = TextEditingController();
  TextEditingController tanggalLahirC = TextEditingController();
  TextEditingController gelarBelakangC = TextEditingController();
  TextEditingController alamatC = TextEditingController();

  _validationForm() {
    if (namaC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Nama tidak boleh kosong'),
      ));
    } else if (jabatanC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Jabatan tidak boleh kosong'),
      ));
    } else if (tempatLahirC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Tempat lahir tidak boleh kosong'),
      ));
    } else if (tanggalLahirC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Tanggal lahir tidak boleh kosong'),
      ));
    } else if (alamatC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Alamat depan tidak boleh kosong'),
      ));
    } else if (gelarBelakangC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Gelar belakang tidak boleh kosong'),
      ));
    } else {
      _saveEmployee();
    }
  }

  _saveEmployee() async {
    final karyawan = KaryawanModel(
      nama: namaC.text,
      jabatan: jabatanC.text,
      alamat: alamatC.text,
      tempatLahir: tempatLahirC.text,
      tanggalLahir: tanggalLahirC.text,
      gelarBelakang: gelarBelakangC.text,
    );

    diohttp.post('/karyawan', data: karyawan.toJson()).then(
      (value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      },
    );

    // var cekId =
    //     employeeList.indexWhere((element) => element.id.toString() == idC.text);
    // print(cekId);
    // if (cekId != -1) {
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text('ID Sudah terdaftar'),
    //   ));
    // } else {

    //   employeeList.add(KaryawanModel(
    //       id: employeeList.length+1,
    //       nama: namaC.text,
    //       jabatan: jabatanC.text,
    //       alamat: alamatC.text,
    //       tempatLahir: tempatLahirC.text,
    //       tanggalLahir: tanggalLahirC.text,
    //       gelarBelakang: gelarBelakangC.text,
    //   ));
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text('Berhasil'),
    //   ));

    //   Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(builder: (context) => const HomePage()),
    //       (route) => false);
    // }
  }

  void _showDatePicker() async {
    final date = await showDatePicker(
        context: context, firstDate: DateTime(1900), lastDate: DateTime.now());
    tanggalLahirC.text = date.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Tambah Karyawan",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    border: Border.all(color: Colors.black),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/profile-black.png"),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(200, 50)),
                child: const Text(
                  "PILIH FOTO",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: namaC,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("NAMA"),
                    hintText: "Masukin Nama",
                    suffixIcon: Icon(Icons.person),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: jabatanC,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("JABATAN"),
                    hintText: "Masukin Jabatan",
                    suffixIcon: Icon(Icons.credit_card),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: tempatLahirC,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("TEMPAT LAHIR"),
                    hintText: "Masukin Tempat Lahir",
                    suffixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: tanggalLahirC,
                enabled: false,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("TANGGAL LAHIR"),
                    hintText: "Masukin Tanggal Lahir (yyyy/mm/dd)",
                    border: OutlineInputBorder()),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.location_on),
                label: const Text('Pilih Tanggal'),
                onPressed: _showDatePicker,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: alamatC,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("Alamat"),
                    hintText: "Masukin Alamat",
                    suffixIcon: Icon(Icons.text_snippet),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: gelarBelakangC,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("GELAR BELAKANG"),
                    hintText: "Masukin Gelar Belakang",
                    suffixIcon: Icon(Icons.text_snippet),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  _validationForm();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(200, 50)),
                child: const Text(
                  "SIMPAN",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
