import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knitwit/api/api.dart';
import 'package:knitwit/features/module/bloc/module_bloc.dart';
import '../../../common/common.dart';
import '../widgets/widgets.dart';

@RoutePage()
class ModuleScreen extends StatefulWidget {
  const ModuleScreen({
    super.key,
    required this.selectedSectionId,
    required this.selectedCourseId,
  });

  final int selectedSectionId;
  final int selectedCourseId;

  @override
  State<ModuleScreen> createState() => _ModuleScreenState();
}

class _ModuleScreenState extends State<ModuleScreen> {
  @override
  void initState() {
    BlocProvider.of<ModuleBloc>(context).add(FetchSectionByIdEvent(
      courseId: widget.selectedCourseId,
      sectionId: widget.selectedSectionId
    ));
    super.initState();
  }

  @override
Widget build(BuildContext context) {
  final theme = Theme.of(context);

  return BlocListener<ModuleBloc, ModuleState>(
    listener: (context, state) {
      if (state is ModuleFailureState) {
        _refreshToken(context);
      }
    },
    child: BlocBuilder<ModuleBloc, ModuleState>(
      builder: (context, state) {
        log('Current state: $state');

        if (state is ModuleLoadedState) {
          final section = state.blocSection;
          return _buildContext(section, theme);
        } else if (state is ModuleFailureState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Ошибка загрузки модуля',
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  'Детали ошибки: ${state.error}',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          );
        }
        return _buildLoading();
      },
    ),
  );
}

  Scaffold _buildContext(Section section, ThemeData theme) {
    return Scaffold(
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: const Color(0xFFFBE1257),
        onRefresh: () async {
          _refreshScreen(context);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: true,
              floating: true,
              elevation: 0,
              expandedHeight: 75,
              automaticallyImplyLeading: false,
              backgroundColor: theme.primaryColor,
              title: const KnitwitTitle(title:'Модуль 1, Раздел 1'),
              leading: IconButton(
                onPressed: () {
                  context.router.maybePop();
                },
                icon: SvgPicture.asset('./assets/icons/arrow_left_icon.svg'),
              ),
              actions: const [
                SizedBox(width: 50, height: 50)
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ModuleVideoBody(
                  videoUrl: 'https://youtu.be/U77eDuF11BU',
                  moduleTitle: section.title,
                  content: section.content,
                ),
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold _buildLoading() => const Scaffold(
    body: Center(
      child: CircularProgressIndicator(
        color: Color(0xFFFBE1257),
      ),
    ),
  );

  void _refreshToken(BuildContext context) {
    final moduleBloc = BlocProvider.of<ModuleBloc>(context);
    moduleBloc.add(FetchSectionByIdEvent(
      courseId: widget.selectedCourseId,
      sectionId: widget.selectedSectionId
    ));
  }

  Future<void> _refreshScreen(BuildContext context) async {
    final moduleBloc = BlocProvider.of<ModuleBloc>(context);
    final completer = Completer();
    moduleBloc.add(FetchSectionByIdEvent(
      courseId: widget.selectedCourseId,
      sectionId: widget.selectedSectionId,
      completer: completer,
    ));
    await completer.future;
  }
}
