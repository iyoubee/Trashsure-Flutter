import 'package:http/http.dart';
import 'package:trashsure/models/Prize.dart';
import 'package:trashsure/models/RedeemedPrize.dart';
import 'package:trashsure/models/UserData.dart';

class UseUserPrize {
  // To fetch prize data from admin
  Future<List<Prize>> getPrize(request) async {
    var response = await request.get('http://10.0.2.2:8000/prize/get/');

    // melakukan decode response menjadi bentuk json
    var data = response;

    // melakukan konversi data json menjadi object ToDo
    List<Prize> prizeList = [];
    for (var d in data) {
      if (d != null) {
        prizeList.add(Prize.fromJson(d));
      }
    }
    return prizeList;
  }

  // To fetch redeemed prize data from certain user
  Future<List<RedeemedPrize>> getRedeemedPrize(request) async {
    var response = await request.get('http://10.0.2.2:8000/prize/get-redeem/');

    // melakukan decode response menjadi bentuk json
    var data = response;

    // melakukan konversi data json menjadi object ToDo
    List<RedeemedPrize> prizeList = [];
    for (var d in data) {
      if (d != null) {
        prizeList.add(RedeemedPrize.fromJson(d));
      }
    }
    return prizeList;
  }

  // Method to redeem the prize
  redeemPrize(context, pk, request) async {
    var response =
        await request.post('http://10.0.2.2:8000/prize/redeem/', {"id": pk});

    return response['message'];
  }

  // Method to use the prize
  usePrize(context, pk, request) async {
    var response = await request.post('http://10.0.2.2:8000/prize/use/', {"id": pk});

    return response['message'];
  }

  // Method to get user points
  Future<int> getPoints(request) async {
    var response =
        await request.get('http://10.0.2.2:8000/dashboard/userData/');

    var data = response;

    List<UserData> balanceList = [];
    for (var d in data) {
      if (d != null) {
        balanceList.add(UserData.fromJson(d));
      }
    }

    return balanceList[0].fields.poin;
  }
}
