import 'package:flutter/material.dart';
import 'package:model_house/services/http_helper.dart';

class SearchPlaceDelegate extends SearchDelegate<String> {
  // List<Prediction?> places = List.empty();
  // late final HttpHelper googlePlacesHttp;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (() {
        close(context, query);
      }),
      icon: const Icon(Icons.arrow_back_outlined),
    );
  }

  @override
  void showResults(BuildContext context) {
    close(context, query);
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final HttpHelper googlePlacesHttp = HttpHelper();
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: FutureBuilder<List?>(
        future:
            query == '' ? null : googlePlacesHttp.getGoogleAutocomplete(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  child: ListTile(
                    title: Text(snapshot.data?[index].description),
                    onTap: (() {
                      // query = snapshot.data?[index].description;
                      query = snapshot.data?[index].description;
                    }),
                  ),
                );
              }));
        },
      ),
    );
  }
}
