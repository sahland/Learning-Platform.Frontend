import 'dart:async';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knitwit/features/explore/bloc/bloc.dart';
import '../widgets/widgets.dart';


@RoutePage()
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void initState() {
    super.initState();
    final exploreBloc = BlocProvider.of<ExploreBloc>(context);
    exploreBloc.add(const ExploreInit());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    //AppMetrica.reportEvent('Viewing the catalog');

    return Scaffold(
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Color(0xFFFBE1257),
        onRefresh: () async {
          _refreshScreen(context);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: true,
              floating: true,
              centerTitle: true,
              elevation: 0,
              expandedHeight: 75,
              backgroundColor: theme.primaryColor,
              bottom: const PreferredSize(
                child: SearchButton(),
                preferredSize: Size.fromHeight(60),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              sliver: BlocBuilder<ExploreBloc, ExploreState>(
                builder: (context, state) {
                  if (state is ExploreLoaded) {
                    return SliverToBoxAdapter(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: state.blocTags.map((tag) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: TagButton(
                                tag: KnitwitTag(text: tag.tagName),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  }
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFFBE1257),
                      ),
                    ),
                  );
                },
              ),
            ),
            BlocBuilder<ExploreBloc, ExploreState>(
              builder: (context, state) {
                if (state is ExploreLoaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => KnitwitCoursesList(
                        nameCourse: state.blocAllCourses[index].title,
                        //imagePath: state.blocAllCourses[index].courseAvatarKey,
                        imagePath: './assets/images/test_image_mini.jpg',
                      ),
                      childCount: state.blocAllCourses.length,
                    ),
                  );
                }
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFFBE1257),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refreshScreen(BuildContext context) async {
    final exploreBloc = BlocProvider.of<ExploreBloc>(context);
    final completer = Completer();
    exploreBloc.add(ExploreInit(completer: completer));
    await completer.future;
  }
}


