import 'package:flutter/material.dart';
import 'package:karyawanapp/data/employee_data.dart';
import 'package:karyawanapp/models/karyawan_model.dart';
import 'package:karyawanapp/page/edit_page.dart';

class EmployeeCard extends StatelessWidget {
  final KaryawanModel employee;
  final void Function() onDelete;
  const EmployeeCard({super.key, required this.employee, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: AssetImage("assets/images/profile-black.png"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${employee.tempatLahir}, ${employee.tanggalLahir}",
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 200,
                  height: 34,
                  child: Text(
                    "${employee.nama}.${employee.gelarBelakang}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  )),
              Text(
                employee.jabatan,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8)),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditPage(employee: employee)));
                    },
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(8)),
                child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Apakah anda yakin?",
                                    style: TextStyle(
                                      fontSize: 20
                                    ),),
                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.grey,
                                                shape: const StadiumBorder(),
                                                minimumSize:
                                                    const Size(100, 40)),
                                            child: const Text("Tidak")),
                                        ElevatedButton(
                                            onPressed: (){
                                              onDelete();
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                shape: const StadiumBorder(),
                                                minimumSize:
                                                const Size(100, 40)),
                                            child: const Text("Ya")),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
