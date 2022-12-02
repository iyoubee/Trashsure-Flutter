// ignore_for_file: file_names

import 'package:trashsure/models/Prize.dart';

class UseAdminPrize {
  Future<List<Prize>> getAdminPrize(request) async {
    var response = await request.get('http://10.0.2.2:8000/admin/prize/get/');

    var data = response;

    List<Prize> prizeList = [];
    for (var d in data) {
      if (d != null) {
        prizeList.add(Prize.fromJson(d));
      }
    }
    return prizeList;
  }

  addPrize(context, request, nama, poin, stok, desc) async {
    var response = await request.post('http://10.0.2.2:8000/admin/prize/add/',
        {"nama": nama, "poin": poin, "stok": stok, "desc": desc});

    return response['status'];
  }

  delPrize(context, pk, request) async {
    var response =
        await request.post('http://10.0.2.2:8000/admin/prize/del/', {"id": pk});

    return response['status'];
  }
}
