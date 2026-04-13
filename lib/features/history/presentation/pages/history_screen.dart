import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/features/history/presentation/bloc/history_cubit.dart';
import 'package:zupa/features/history/presentation/models/form/history_form.dart';
import 'package:zupa/features/history/presentation/pages/widgets/history_list_tab.dart';
import 'package:zupa/features/history/presentation/pages/widgets/history_search_bar.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryCubit>(
      create: (listContext) => getIt<HistoryCubit>()..init(),
      child: Builder(
        builder: (context) {
          return HistoryFormBuilder(
            model: History.fromParams(.initial()),
            builder: (context, formModel, child) {
              return AppScreen(
                isChildScrollable: true,
                hasParentView: true,
                title: t.parking.history,
                hasAppBar: false,
                child: BlocBuilder<HistoryCubit, HistoryState>(
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
          );
        },
      ),
    );
  }
}
