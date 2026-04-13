import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/features/history/presentation/bloc/list/history_list_cubit.dart';
import 'package:zupa/features/history/presentation/pages/widgets/history_list_tab.dart';
import 'package:zupa/features/history/presentation/pages/widgets/history_search_bar.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryListCubit>(
      create: (listContext) => getIt<HistoryListCubit>()..init(),
      child: Builder(
        builder: (context) {
          return AppScreen(
            isChildScrollable: true,
            hasParentView: true,
            title: t.parking.history,
            hasAppBar: false,
            child: BlocBuilder<HistoryListCubit, HistoryListState>(
              builder: (listContext, listState) {
                return const Padding(
                  padding: .symmetric(horizontal: 36),
                  child: Column(
                    children: [
                      HistorySearchBar(),
                      Expanded(child: HistoryListTab()),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
