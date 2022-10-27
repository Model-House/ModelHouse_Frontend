class Prediction {
  String? placeId;
  String? description;

  Prediction(
    this.description,
    this.placeId,
  );

  Prediction.fromJson(Map<String, dynamic> json) {
    description = json["description"];
    placeId = json["place_id"];
  }
}
