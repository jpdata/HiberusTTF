import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../../domain/models/mtg_card_model.dart';
//import 'package:dio/dio.dart'; ya no se usa al usar flutter_cache_manager 3.3.0

import 'mtg_api_card.dart';

class ApiReader {
  String get urlBase => "https://api.magicthegathering.io/v1/cards";

  Future<List<MtgCardModel>> getCards({int? page, int? pageSize}) async {
    var lpage = page ?? 0;
    var lpageSize = pageSize ?? 10;
    var queryurl = '$urlBase?page=$lpage&pageSize=$lpageSize';
    try {
      //cache handling
      final File file = await DefaultCacheManager().getSingleFile(queryurl);
      final response = json.decode(file.readAsStringSync());

      //var response = await Dio().get(queryurl);
      var cardsRoot = CardsResponse.fromJson(response);
      var lista = List.generate(
        cardsRoot.length,
        (i) => MtgCardModel(
          cardsRoot[i].name,
          cardsRoot[i].imageUrl,
          cardsRoot[i].text,
        ),
      );
      return lista;
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }

  Image getImage(String? url) {
    url = url ?? "";
    return url.isNotEmpty
        ? Image.network(url)
        : Image.asset("assets/images/mtgBack.jpg");
  }
}
