// ignore_for_file: file_names

import 'package:trashsure/models/UserData.dart';
import '../models/Withdraw.dart';

class UseUserWithdraw {
  Future<List<Withdraw>> getWithdraw(request) async {
    var response = await request
        .get('http://trashsure.iyoubee.xyz/flutter/user/withdraw/get/');

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
    var response = await request
        .get('http://trashsure.iyoubee.xyz/flutter/user/data/get/');

    var data = response;

    List<UserData> balanceList = [];
    for (var d in data) {
      if (d != null) {
        balanceList.add(UserData.fromJson(d));
      }
    }

    return balanceList;
  }

  Future<dynamic> addWithdraw(context, request, jumlah) async {
    var response = await request
        .post('http://trashsure.iyoubee.xyz/flutter/user/withdraw/add/', {
      "jumlah": jumlah,
    });

    return response;
  }
}
