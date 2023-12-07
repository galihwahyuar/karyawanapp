import 'package:flutter/material.dart';
import 'package:karyawanapp/config/diohttp.dart';
import 'package:karyawanapp/models/karyawan_model.dart';
import 'package:karyawanapp/page/add_page.dart';
import 'package:karyawanapp/widgets/employee_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<KaryawanModel> karyawans = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    diohttp.get('/karyawan').then((value) {
      final data = value.data as List<dynamic>;
      final karyawan = data.map((e) => KaryawanModel.fromJson(e)).toList();
      setState(() {
        karyawans = karyawan;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Data Karyawan"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddPage()));
              },
              icon: Icon(Icons.add_box))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...karyawans.map((e) {
              return EmployeeCard(
                employee: e,
                onDelete: () {
                  setState(() {
                    karyawans.removeWhere((element) => element.id == e.id);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Berhasil hapus")));
                  });
                },
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
