class CardsResponse {
  List<SingleCard> cards;
  CardsResponse(this.cards);

  int get length => cards.length;

  SingleCard operator [](int i) => cards[i];

  factory CardsResponse.fromJson(Map<String, dynamic> json) {
    var mcards = json["cards"];
    return CardsResponse(
        List.generate(mcards.length, (i) => SingleCard.fromJson(mcards[i])));
  }
}

class SingleCard {
  final String name;
  // final String manaCost;
  // final int cmc;
  // final List<String> colors;
  // final List<String> colorIdentity;
  final String type;
  // final List<String> types;
  // final List<String> subtypes;
  // final String rarity;
  // final String set;
  // final String setName;
  final String text;
  // final String artist;
  // final String number;
  // final int? power;
  // final int? toughness;
  // final String layout;
  // final int? multiverseid;
  final String imageUrl;
  // final List<String> variations;
  // final List<ForeignName> foreignNames;
  // final List<String> printings;
  // final String originalText;
  // final String originalType;
  // final List<Legality> legalities;
  // final String id;
  // final String flavor;
  // final List<Ruling> rulings;
  // final List<String> supertypes;

  SingleCard(
    this.name,
    // this.manaCost,
    // this.cmc,
    // this.colors,
    // this.colorIdentity,
    this.type,
    // this.types,
    // this.subtypes,
    // this.rarity,
    // this.set,
    // this.setName,
    this.text,
    // this.artist,
    // this.number,
    // this.power,
    // this.toughness,
    // this.layout,
    // this.multiverseid,
    this.imageUrl,
    // this.variations,
    // this.foreignNames,
    // this.printings,
    // this.originalText,
    // this.originalType,
    // this.legalities,
    // this.id,
    // this.flavor,
    // this.rulings,
    // this.supertypes
  );
  factory SingleCard.fromJson(Map<String, dynamic> json) => SingleCard(
        json["name"],
        json["type"],
        json["text"],
        json["imageUrl"] ?? "",
      );
}

// class ForeignName {
//   final String name;
//   final String text;
//   final String type;
//   final String flavor;
//   final String imageUrl;
//   final String language;
//   final int multiverseid;

//   ForeignName(this.name, this.text, this.type, this.flavor, this.imageUrl,
//       this.language, this.multiverseid);
// }

// class Legality {
//   final String format;
//   final String legalityLegality;

//   Legality(this.format, this.legalityLegality);
// }

// class Ruling {
//   final String date;
//   final String text;

//   Ruling(this.date, this.text);
// }
