// ignore_for_file: file_names

import '../models/Deposit.dart';
import 'package:flutter/material.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/safe_area_values.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UseAdminDeposit {
  Future<List<Deposit>> getAdminDeposit(request) async {
    var response = await request.get('http://10.0.2.2:8000/admin/deposit/get/');

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

  addDeposit(context, request, username, jenisSampah, beratSampah) async {
    var response = await request.post(
        'http://10.0.2.2:8000/admin/deposit/add/', {
      "user": username,
      "jenisSampah": jenisSampah,
      "beratSampah": beratSampah
    }).then((value) => {
          if (value.status == 200)
            {
              showTopSnackBar(
                context,
                const CustomSnackBar.success(
                  message:
                      "Good job, your release is successful. Have a nice day",
                ),
              ),
              Navigator.pop(context)
            }
          else
            {
              showTopSnackBar(
                context,
                const CustomSnackBar.error(
                  message:
                      "Something went wrong. Please check your credentials and try again",
                ),
              )
            }
        });
  }

  accDeposit(context, pk) async {
    final request = context.watch<CookieRequest>();
    var url = Uri.parse('http://10.0.2.2:8000/admin/deposit/acc/');
    var response = await request.post(url, {"id": pk}).then((value) => {
          if (value.status == 200)
            {
              showTopSnackBar(
                context,
                const CustomSnackBar.success(
                  message:
                      "Good job, your release is successful. Have a nice day",
                ),
              ),
              Navigator.pop(context)
            }
          else
            {
              showTopSnackBar(
                context,
                const CustomSnackBar.error(
                  message:
                      "Something went wrong. Please check your credentials and try again",
                ),
              )
            }
        });
  }

  delDeposit(context, pk) async {
    final request = context.watch<CookieRequest>();
    var url = Uri.parse('http://10.0.2.2:8000/admin/deposit/del/');
    var response = await request.post(url, {"id": pk}).then((value) => {
          if (value.status == 200)
            {
              showTopSnackBar(
                context,
                const CustomSnackBar.success(
                  message:
                      "Good job, your release is successful. Have a nice day",
                ),
              ),
              Navigator.pop(context)
            }
          else
            {
              showTopSnackBar(
                context,
                const CustomSnackBar.error(
                  message:
                      "Something went wrong. Please check your credentials and try again",
                ),
              )
            }
        });
  }
}
