import '../../../domain/models/mtg_card_model.dart';
import 'package:dio/dio.dart';

import 'mtg_api_card.dart';

class ApiReader {
  String get url => "https://api.magicthegathering.io/v1/cards";

  Future<List<MtgCardModel>> getCards({int? page, int? pageSize}) async {
    var lpage = page ?? 0;
    var lpageSize = pageSize ?? 10;
    var queryurl = '$url?page=$lpage&pageSize=$lpageSize';
    try {
      var response = await Dio().get(queryurl);
      var cardsRoot = CardsResponse.fromJson(response.data);
      var lista = List.generate(
        cardsRoot.length,
        (i) => MtgCardModel(
          cardsRoot[i].name,
          cardsRoot[i].imageUrl,
          cardsRoot[i].text,
        ),
      );
      return lista;
    } on Exception {
      return [];
    }
  }
}
