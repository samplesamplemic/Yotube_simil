import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../api/FetchAPI.dart';

class SearchBarFunctionsAndConstants {
  static const iconSearch = Icon(Icons.search);

  static _removeSameWordAndAddNewWordToAList(
      List<String> listOfSearchedWord, SearchController controller) {
    listOfSearchedWord.removeWhere((element) => element.compareTo(controller.text) == 0);
    listOfSearchedWord.add(controller.text);
  }

  static _ifTextNotEmptyCallFetchAPIAndGetData(BuildContext context,
      List<String> listOfSearchedWord, SearchController controller) async {
    if (controller.text != '') {
      await Provider.of<FetchAPI>(context, listen: false).getVideoList(controller.text);
    }
  }

  static onPressedSearch(
      BuildContext context, List<String> listOfSearchedWord, SearchController controller) {
    _removeSameWordAndAddNewWordToAList(listOfSearchedWord, controller);
    _ifTextNotEmptyCallFetchAPIAndGetData(context, listOfSearchedWord, controller);
  }
}
