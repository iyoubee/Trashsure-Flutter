// ignore_for_file: file_names

import 'package:trashsure/models/UserData.dart';
import '../models/Withdraw.dart';

class UseUserWithdraw {
  Future<List<Withdraw>> getWithdraw(request) async {
    var response = await request.get('http://10.0.2.2:8000/withdraw/get/');

    var data = response;

    List<Withdraw> withdrawList = [];
    for (var d in data) {
      if (d != null) {
        withdrawList.add(Withdraw.fromJson(d));
      }
    }
    return withdrawList;
  }

  Future<List<UserData>> getBalance(request) async {
    var response =
        await request.get('http://10.0.2.2:8000/dashboard/userData/');

    var data = response;

    List<UserData> balanceList = [];
    for (var d in data) {
      if (d != null) {
        balanceList.add(UserData.fromJson(d));
      }
    }

    return balanceList;
  }

  addWithdraw(context, request, jumlah) async {
    var response = await request.post('http://10.0.2.2:8000/withdraw/add/', {
      "jumlah": jumlah,
    });

    return response['status'];
  }
}
