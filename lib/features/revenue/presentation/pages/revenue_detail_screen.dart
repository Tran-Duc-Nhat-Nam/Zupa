import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/features/revenue/presentation/bloc/revenue_cubit.dart';
import 'package:zupa/features/revenue/presentation/pages/widgets/revenue_list_tab.dart';

@RoutePage()
class RevenueDetailScreen extends StatelessWidget {
  const RevenueDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<RevenueCubit>())],
      child: Builder(
        builder: (context) {
          return AppScreen(
            isChildScrollable: true,
            title: t.parking.revenue,
            subtitle: t.common.actions.viewDetails,
            child: const Padding(
              padding: .symmetric(horizontal: 36),
              child: RevenueListTab(),
            ),
          );
        },
      ),
    );
  }
}
