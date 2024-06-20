import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/common.dart';
import '../bloc/bloc.dart';

class TagButton extends StatefulWidget {
  final KnitwitTag tag;

  const TagButton({super.key, required this.tag});

  @override
  State<TagButton> createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
  @override
  Widget build(BuildContext context) {
    final Color blackColor = Color(0xFF181818);
    final Color whiteColor = Color(0xFFFD9D9D9);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        backgroundColor: widget.tag.isSelected ? whiteColor : blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        final tagNotifier = context.read<KnitwitTagNotifier>();
        tagNotifier.toggleTagSelection(widget.tag.text);

        final exploreBloc = BlocProvider.of<ExploreBloc>(context);
        final selectedTags = tagNotifier.selectedTags;
        exploreBloc.add(FilterCoursesByTag(selectedTags));

        setState(() {
          widget.tag.isSelected = !widget.tag.isSelected;
        });
      },
      child: Text(
        widget.tag.text,
        style: TextStyle(
          color: widget.tag.isSelected ? blackColor : whiteColor,
          fontSize: 12,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
