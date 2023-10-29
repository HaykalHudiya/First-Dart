// import 'package:dart_application_1/employee.dart';

// void main(List<String> arguments) {
//   Employee staff1 = Employee("116007", "Usman");
//   Employee staff2 = Employee("116116", "Basir", tahunMasuk: 2016);
//   Employee staff3 = Employee("116221", "Bagas", tahunMasuk: 2020);

//   staff1.presensi(DateTime.parse('2023-10-15 09:58:30'));
//   staff2.presensi(DateTime.parse('2023-10-15 08:02:30'));
//   staff3.presensi(DateTime.parse('2023-10-15 08:58:30'));

//   staff1.gaji = 500000;
//   staff2.gaji = 4500000;

//   staff1.address = "Bandung Timur, Jawa Barat Indonesia";
//   staff2.address = "j1. Sukamenak no. 111b Kab. Bandung";

//   print(staff1.deskripsi());
//   print(staff2.deskripsi());
//   print(staff3.deskripsi());
// }

// void main(List<String> arguments) {
//   List<Employee> dataEmployee = [];
//   dataEmployee.add(Pejabat("D33617", 'Umar Ahab', TipeJabatan.direktur));
//   dataEmployee.add(Pejabat("K90112", 'Umar Ahab', TipeJabatan.kabag));
//   dataEmployee[1].tahunMasuk = 2016;
//   dataEmployee.add(StafBiasa("M89182", 'Basith', tahunMasuk: 2020));

//   dataEmployee[0].presensi(DateTime.parse('2023-10-15 09:58:30'));
//   dataEmployee[1].presensi(DateTime.parse('2023-10-15 08:02:30'));
//   dataEmployee[2].presensi(DateTime.parse('2023-10-15 09:01:30'));

//   dataEmployee[1].gaji = 500000;
//   dataEmployee[2].gaji = 4500000;

//   dataEmployee[1].address = "Bandung Timur, Jawa Barat Indonesia";
//   dataEmployee[2].address = "jl. Sukamenak no. 111b Kab. Bandung";

//   for (var staff in dataEmployee) {
//     print(staff.deskripsi());
//   }
// }

import 'package:dart_application_1/employee.dart';
import 'package:dart_application_1/dummy_data.dart';

void main(List<String> arguments) {
  List<Employee> dataEmployee = genData(dummyData());

  dataEmployee[0].presensi(DateTime.parse('2023-10-15 09:58:30'));
  dataEmployee[1].presensi(DateTime.parse('2023-10-15 08:02:30'));
  dataEmployee[2].presensi(DateTime.parse('2023-10-15 09:01:30'));

  dataEmployee[0].gaji = 1500000;
  dataEmployee[1].gaji = 500000;
  dataEmployee[2].gaji = 4500000;

  dataEmployee[1].address = "Bandung Timur, Jawa Barat Indonesia";
  dataEmployee[2].address = "j1. Sukamenak no. 111b Kab. Bandung";

  for (var staff in dataEmployee) {
    print(staff.deskripsi());
  }
}

List<Employee> genData(var listData) {
  List<Employee> data = [];
  for (var dataPegawai in listData) {
    Employee employee;
    if (dataPegawai.containsKey('jabatan')) {
      employee = Pejabat(
          dataPegawai['nip'], dataPegawai['name'], dataPegawai['jabatan']);
    } else {
      employee = StafBiasa(dataPegawai['nip'], dataPegawai['name']);
    }

    if (dataPegawai.containsKey('tahun_masuk')) {
      employee.tahunMasuk = dataPegawai['tahun_masuk'];
    }

    if (dataPegawai.containsKey('address')) {
      employee.address = dataPegawai['address'];
    }
    data.add(employee);
  }
  return data;
}
