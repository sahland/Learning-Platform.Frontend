import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knitwit/api/api.dart';
import 'package:knitwit/common/common.dart';
import 'package:provider/provider.dart';
import '../bloc/bloc.dart';

class TagsDialog extends StatefulWidget {
  const TagsDialog({super.key});

  @override
  _TagsDialogState createState() => _TagsDialogState();
}

class _TagsDialogState extends State<TagsDialog> {
  @override
  void initState() {
    super.initState();
    final editorBloc = BlocProvider.of<EditorBloc>(context);
    editorBloc.add(const EditorInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      backgroundColor: const Color(0xFFF1C202A),
      title: const Center(
        child: Text(
          'Выберите теги',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFA4ACC3),
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      content: BlocBuilder<EditorBloc, EditorState>(
        builder: (context, state) {
          if (state is EditorLoaded) {
            final tags = state.blocAllTags.map((tag) => KnitwitTag(text: tag.tagName)).toList();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<KnitwitTagNotifier>().setTags(tags);
            });
            return ChangeNotifierProvider<KnitwitTagNotifier>(
              create: (context) => KnitwitTagNotifier()..setTags(tags),
              child: Consumer<KnitwitTagNotifier>(
                builder: (context, tagNotifier, child) {
                  return SingleChildScrollView(
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: tagNotifier.tags.map((tag) {
                        return ChoiceChip(
                          label: Text(
                            tag.text,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          selected: tag.isSelected,
                          selectedColor: const Color(0xFFFBE1257),
                          backgroundColor: const Color(0xFFF181818),
                          checkmarkColor: Colors.white,
                          onSelected: (selected) {
                            tagNotifier.toggleTagSelection(tag.text);
                          },
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFFBE1257),
            ),
          );
        },
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Отмена'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Применить'),
          onPressed: () {
            final selectedTags = context.read<KnitwitTagNotifier>().selectedTags;
            Navigator.of(context).pop(selectedTags);
          },
        ),
      ],
    );
  }
}