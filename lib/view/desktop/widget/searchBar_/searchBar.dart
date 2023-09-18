import 'package:flutter/material.dart';

import '../../../assets/constantUI.dart';
import 'searchBarCustom.dart';
import 'searchBarElements.dart';

class SearchBarApp extends StatefulWidget implements PreferredSizeWidget {
  const SearchBarApp({super.key});

  @override
  State<StatefulWidget> createState() => _SearchBarApp();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _SearchBarApp extends State<SearchBarApp> {
  List<String> listOfSearchedWord = ['batman'];
  SearchController searchedWord = SearchController();

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
        preferredSize: widget.preferredSize,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchAnchor(
              viewLeading: Padding(
                padding: const EdgeInsets.all(12),
                child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      print(searchedWord.text);
                      SearchBarFunctionsAndConstants.onPressedSearch(
                          context, listOfSearchedWord, searchedWord);
                      searchedWord.closeView(searchedWord.text);
                    }),
              ),
              viewElevation: 100,
              viewShape: const ContinuousRectangleBorder(
                borderRadius: ConstantUI.borderRadius,
              ),
              viewConstraints: const BoxConstraints(maxHeight: 300),
              builder: (BuildContext context, SearchController controller) {
                controller.addListener(() {
                  searchedWord = controller;
                });
                return SearchBarCustom(controller: controller);
              },
              suggestionsBuilder: (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(listOfSearchedWord.length, (int i) {
                  final String item = listOfSearchedWord[i];
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
              }),
        ));
  }
}
