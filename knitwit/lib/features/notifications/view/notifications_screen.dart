import 'dart:async';
import 'dart:developer';
import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/common.dart';
import '../bloc/bloc.dart';
import '../widgets/widgets.dart';
import 'package:intl/intl.dart';

@RoutePage()
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  @override
  void initState() {
    BlocProvider.of<NotificationBloc>(context).add(const NotificationsListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              elevation: 0,
              expandedHeight: 65,
              title: const KnitwitTitle(title: 'Уведомления'),
              leading: IconButton(
              onPressed: () {
                  context.router.maybePop();
                },
                icon: SvgPicture.asset('./assets/icons/arrow_left_icon.svg'),
              ),
              backgroundColor: theme.primaryColor,
              actions: const [
              SizedBox(width: 50, height: 50)
              ],
           ),
           BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              if(state is NotificationLoaded) {               
              return SliverList.builder(
                itemBuilder: (context, index) => NotificationsList(
                  title: state.blocNotifications[index].title,
                  imagePath: './assets/images/knitwit_image.png',
                  message: state.blocNotifications[index].message,
                  createAt: _dateProcessing(state.blocNotifications[index].createdAt),
                ),
                itemCount: state.blocNotifications.length,
              );
            } else if(state == 0) {
              return const Center(
                child:  Text(
                  'Что-то пошло не так...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }
            return const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFFBE1257),
                )
              ),
            );
            }
            ),
          ],
        ),
      ),
    );
  }

  String _dateProcessing(String date) {
    final DateFormat formatter = DateFormat('yyyy.MM.dd HH:mm');
    final formattedDate = DateTime.parse(date);
    String formattedCreatedAt = formatter.format(formattedDate).toString();
    return formattedCreatedAt;
  }

  Future<void> _refreshScreen(BuildContext context) async {
    final notificationsBloc = BlocProvider.of<NotificationBloc>(context);
    final completer = Completer();
    notificationsBloc.add(NotificationsListEvent(
      completer: completer
      )
    );
    await completer.future;
  }
}