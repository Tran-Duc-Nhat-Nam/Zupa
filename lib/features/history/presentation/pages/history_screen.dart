import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/features/history/presentation/bloc/filter/history_filter_cubit.dart'
    hide Loading;
import 'package:zupa/features/history/presentation/bloc/list/history_list_cubit.dart';
import 'package:zupa/features/history/presentation/pages/widgets/history_list_tab.dart';
import 'package:zupa/features/history/presentation/pages/widgets/history_search_bar.dart';
import 'package:zupa/gen/strings.g.dart';

@RoutePage()
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _isScrolledNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isScrolledNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HistoryFilterCubit>(
          create: (filterContext) =>
              getIt<HistoryFilterCubit>()..init(),
        ),
        BlocProvider<HistoryListCubit>(
          create: (listContext) => getIt<HistoryListCubit>()..init(),
        ),
      ],
      child: AppScreen(
        isChildScrollable: true,
        hasParentView: true,
        title: t.history,
        hasAppBar: false,
        child: BlocListener<HistoryListCubit, HistoryListState>(
          listener: (context, state) {
            state.whenOrNull(
              unauthenticated: () => DialogHelper.showAuthDialog(context),
            );
          },
          child: BlocBuilder<HistoryListCubit, HistoryListState>(
            builder: (listContext, listState) {
              return Column(
                children: [
                  HistorySearchBar(isScrolledNotifier: _isScrolledNotifier),
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollUpdateNotification) {
                          final isScrolled =
                              notification.metrics.pixels > 20;
                          _isScrolledNotifier.value = isScrolled;
                        }
                        return false;
                      },
                      child: const HistoryListTab(),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
