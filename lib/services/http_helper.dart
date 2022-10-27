import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:model_house/models/prediction.dart';

class HttpHelper {
  final String urlBase = 'maps.googleapis.com';
  final String urlSearch = '/maps/api/place/autocomplete/json';

  final String language = 'es-419';
  final String component = 'country:pe';
  final String keyApi = 'AIzaSyAq_T5F3g6ol0UBLR2B6r9--qugZMg0MiE';
  Future<List?> getGoogleAutocomplete(
    String input,
  ) async {
    var uri = Uri.https(urlBase, urlSearch, {
      'input': input,
      'language': language,
      'components': component,
      'key': keyApi
    });
    // const String url =
    //     'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=UPC&language=es-419&components=country:pe&key=AIzaSyAq_T5F3g6ol0UBLR2B6r9--qugZMg0MiE';
    http.Response result = await http.get(uri);
    if (result.statusCode == HttpStatus.ok) {
      final jsonReponse = json.decode(result.body);
      final placesApi = jsonReponse['predictions'];
      List places = placesApi.map((i) => Prediction.fromJson(i)).toList();
      return places;
    }
    return null;
  }
}
