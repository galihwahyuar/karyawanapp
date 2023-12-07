import 'package:flutter/material.dart';

import '../data/employee_data.dart';
import '../models/karyawan_model.dart';
import 'home_page.dart';

class EditPage extends StatefulWidget {
  final KaryawanModel employee;
  const EditPage({Key? key, required this.employee}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController idC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController jabatanC = TextEditingController();
  TextEditingController tempatLahirC = TextEditingController();
  TextEditingController tanggalLahirC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController gelarBelakangC = TextEditingController();

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
        content: Text('Alamat tidak boleh kosong'),
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
    try {
      var cekId = employeeList
          .indexWhere((element) => element.id.toString() == idC.text);
      print(cekId);
      if (cekId == -1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Data dengan id ${idC.text} tidak ditemukan'),
        ));
      } else {
        employeeList[cekId] = KaryawanModel(
          id: int.parse(idC.text),
          nama: namaC.text,
          jabatan: jabatanC.text,
          tempatLahir: tempatLahirC.text,
          tanggalLahir: tanggalLahirC.text,
          alamat: alamatC.text,
          gelarBelakang: gelarBelakangC.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Berhasil'),
        ));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Data dengan id ${idC.text} tidak ditemukan'),
      ));
    }
  }

  @override
  void initState() {
    idC.text = widget.employee.id.toString();
    namaC.text = widget.employee.nama;
    jabatanC.text = widget.employee.jabatan;
    tempatLahirC.text = widget.employee.tempatLahir;
    tanggalLahirC.text = widget.employee.tanggalLahir;
    alamatC.text = widget.employee.alamat;
    gelarBelakangC.text = widget.employee.gelarBelakang;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Ubah Karyawan",
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
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("TANGGAL LAHIR"),
                    hintText: "Masukin Tanggal Lahir (yyyy/mm/dd)",
                    suffixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder()),
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
