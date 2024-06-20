import 'package:flutter/material.dart';

class AppBar extends StatefulWidget {
  const AppBar({
    super.key,
    this.buttonBack = false
    });

    final bool buttonBack;

  @override
  State<AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if(widget.buttonBack) {
      return _buildWithBack(context);
    } else {
      return _buildDefault(theme);
    }
  }

  SliverAppBar _buildDefault(ThemeData theme) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: theme.primaryColor,
      automaticallyImplyLeading: false,
      elevation: 0,
    );
  }

  SliverAppBar _buildWithBack(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Color(0xFFF1C202B),
      automaticallyImplyLeading: false,
      elevation: 0,
    );
  }
}