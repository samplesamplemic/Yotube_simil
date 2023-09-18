import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quack_pics/view/assets/constantUI.dart';
import 'package:quack_pics/view/desktop/widget/searchBar_/searchBarElements.dart';

import '../../../assets/ThemeModel.dart';

class SearchBarCustom extends StatefulWidget {
  final SearchController controller;

  const SearchBarCustom({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _SearchBarCustom();
}

class _SearchBarCustom extends State<SearchBarCustom> {
  List<String> listOfSearchedWord = ['batman'];

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: widget.controller,
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: ConstantUI.borderRadius,
        ),
      ),
      padding:
          const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
      onTap: () {
        widget.controller.openView();
        print(widget.controller.text);
      },
      onChanged: (_) {},
      leading: IconButton(
          icon: SearchBarFunctionsAndConstants.iconSearch,
          onPressed: () {
            SearchBarFunctionsAndConstants.onPressedSearch(
                context, listOfSearchedWord, widget.controller);
          }),
      trailing: <Widget>[
        Tooltip(
          message: 'Change brightness mode',
          child: IconButton(
            onPressed: () {
              Provider.of<ThemeModel>(context, listen: false).toggleTheme();
            },
            icon: Provider.of<ThemeModel>(context, listen: false).currentTheme ==
                    ThemeData.light()
                ? const Icon(Icons.wb_sunny_outlined)
                : const Icon(Icons.brightness_2_outlined),
          ),
        )
      ],
    );
  }
}
