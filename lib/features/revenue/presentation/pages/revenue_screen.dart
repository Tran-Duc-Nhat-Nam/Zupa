import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/features/revenue/presentation/bloc/filter/revenue_filter_cubit.dart';
import 'package:zupa/features/revenue/presentation/bloc/list/revenue_list_cubit.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/revenue/presentation/pages/widgets/revenue_list_tab.dart';
import 'package:zupa/gen/strings.g.dart';

@RoutePage()
class RevenueScreen extends StatefulWidget {
  const RevenueScreen({super.key});

  @override
  AppState<RevenueScreen> createState() => _RevenueScreenState();
}

class _RevenueScreenState extends AppState<RevenueScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<RevenueFilterCubit>()..init()),
        BlocProvider(create: (context) => getIt<RevenueListCubit>()..init()),
      ],
      child: AppScreen(
        isChildScrollable: true,
        hasParentView: true,
        title: t.revenue,
        hasAppBar: false,
        child: BlocListener<RevenueListCubit, RevenueListState>(
          listener: (context, state) {
            state.whenOrNull(
              unauthenticated: () => DialogHelper.showAuthDialog(context),
            );
          },
          child: const Column(
            children: [
              SizedBox(height: 16),
              Expanded(child: RevenueListTab()),
            ],
          ),
        ),
      ),
    );
  }
}
