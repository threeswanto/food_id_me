import 'package:flutter/material.dart';
import 'package:food_id_me/model/response.dart';
import 'package:food_id_me/repository/response_repository.dart';

import '../../model/data.dart';

class HomeNotifier extends ChangeNotifier {

  Response? _response;

  Response? get response => _response;

  List<Data> topData = [];

  List<Data> bottomData = [];

  onInit() {
    ResponseRepository().doGetBanner(onSuccess, onError);
  }

  onSuccess(Response response) {
    _response = response;
    for (var element in _response!.data!) {
      if(element.variant?.name == "Top") {
        topData.add(element);
      } else {
        bottomData.add(element);
      }
    }notifyListeners();
  }

  onError(String e) {
    print(e);
  }
}