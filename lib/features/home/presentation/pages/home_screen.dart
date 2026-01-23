import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zupa/core/constants/routes.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/features/home/presentation/bloc/filter/home_filter_cubit.dart';
import 'package:zupa/features/home/presentation/bloc/ticket/home_ticket_cubit.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/features/home/presentation/pages/widgets/home_search_bar.dart';
import 'package:zupa/features/home/presentation/pages/widgets/ticket_list_tab.dart';
import 'package:zupa/features/home/presentation/pages/widgets/vehicle_capacity_tab.dart';
import 'package:zupa/gen/strings.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  AppState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends AppState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      formKey: formKey,
      isChildScrollable: true,
      hasParentView: true,
      title: t.home,
      hasAppBar: false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeTicketCubit>(
            create: (context) => getIt<HomeTicketCubit>()..init(),
          ),
          BlocProvider<HomeFilterCubit>(
            create: (context) => getIt<HomeFilterCubit>()..init(),
          ),
        ],
        child: BlocListener<HomeTicketCubit, HomeTicketState>(
          listener: (context, state) {
            state.whenOrNull(
              unauthenticated: () => DialogHelper.showAuthDialog(context),
            );
          },
          child: const Column(
          spacing: 10,
          children: [
            SizedBox(height: 6),
            Padding(
              padding: .symmetric(horizontal: 12),
              child: HomeSearchBar(),
            ),
            Padding(
              padding: .symmetric(horizontal: 24),
              child: VehicleCapacityTab(),
            ),
            Expanded(child: TicketListTab()),
          ],
        ),
      ),
      ),
    );
  }
}
