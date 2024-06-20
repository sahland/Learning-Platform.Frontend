import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knitwit/features/explore/bloc/bloc.dart';
import '../../../common/common.dart';


class SearchButton extends StatefulWidget {
  const SearchButton({
    super.key,
  });

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color textColor = Color(0xFFFC3C3C3);
    return BaseBottomSheet(
      child: Row(
        children: [
          const SizedBox(width: 10),
          Icon(
            Icons.search_rounded,
            color: textColor,
          ),
          Expanded(
            child: TextField(
              onSubmitted: _onSearch,
              decoration: InputDecoration(
                hintText: 'Поиск...',
                hintStyle: TextStyle(color: textColor),
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onSearch(String value) async {
    final exploreBloc = BlocProvider.of<ExploreBloc>(context);
    final completer = Completer();
    exploreBloc.add(SearchCourses(keyword: value, completer: completer));
    await completer.future;
  }
}
