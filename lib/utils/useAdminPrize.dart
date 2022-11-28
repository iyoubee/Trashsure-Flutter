// ignore_for_file: file_names

import 'package:trashsure/models/UserData.dart';
import '../models/Deposit.dart';
import 'package:trashsure/utils/auth.dart';

class UseAdminPrize {
  Future<List<Deposit>> getAdminDeposit(request) async {
    var response = await request.get('http://10.0.2.2:8000/admin/prize/get/');

    // melakukan decode response menjadi bentuk json
    var data = response;

    // melakukan konversi data json menjadi object ToDo
    List<Deposit> depositList = [];
    for (var d in data) {
      if (d != null) {
        depositList.add(Deposit.fromJson(d));
      }
    }
    return depositList;
  }

  addPrize(context, request, nama, poin, stok, desc) async {
    var response = await request.post('http://10.0.2.2:8000/admin/prize/add/',
        {"nama": nama, "poin": poin, "stok": stok, "desc": desc});

    return response['status'];
  }

  delPrize(context, pk) async {
    final request = context.watch<CookieRequest>();
    var url = Uri.parse('http://10.0.2.2:8000/admin/prize/del/');
    var response = await request.post(url, {"id": pk});
  }
}
