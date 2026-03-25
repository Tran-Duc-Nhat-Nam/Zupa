import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/features/revenue/presentation/bloc/filter/revenue_filter_cubit.dart';
import 'package:zupa/features/revenue/presentation/bloc/list/revenue_list_cubit.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/features/revenue/presentation/pages/widgets/revenue_list_tab.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';

@RoutePage()
class RevenueScreen extends StatelessWidget {
  const RevenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<RevenueFilterCubit>()..init()),
        BlocProvider(create: (context) => getIt<RevenueListCubit>()..init()),
      ],
      child: Builder(
        builder: (context) {
          return AppScreen(
            formGroup: context.read<RevenueFilterCubit>().formModel.form,
            isChildScrollable: true,
            hasParentView: true,
            title: t.parking.revenue,
            hasAppBar: false,
            child: const Column(
              children: [
                SizedBox(height: 16),
                Expanded(child: RevenueListTab()),
              ],
            ),
          );
        }
      ),
    );
  }
}
