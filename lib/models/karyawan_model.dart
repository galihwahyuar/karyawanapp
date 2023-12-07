class KaryawanModel {
  final int? id;
  final String nama;
  final String tempatLahir;
  final String tanggalLahir;
  final String alamat;
  final String jabatan;
  final String gelarBelakang;

  KaryawanModel({
    this.id,
    required this.nama,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.alamat,
    required this.jabatan,
    required this.gelarBelakang,
  });

  factory KaryawanModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final nama = json['nama'];
    final tempatLahir = json['tempat_lahir'];
    final tanggalLahir = json['tanggal_lahir'];
    final alamat = json['alamat'];
    final jabatan = json['jabatan'];
    final gelarBelakang = json['gelar_belakang'];

    return KaryawanModel(
      id: id,
      nama: nama,
      tempatLahir: tempatLahir,
      tanggalLahir: tanggalLahir,
      alamat: alamat,
      jabatan: jabatan,
      gelarBelakang: gelarBelakang,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'tempat_lahir': tempatLahir,
      'tanggal_lahir': tanggalLahir,
      'alamat': alamat,
      'jabatan': jabatan,
      'gelar_belakang': gelarBelakang,
    };
  }
}
