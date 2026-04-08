import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_site_selector.dart';
import 'package:zupa/features/home/presentation/bloc/filter/home_filter_cubit.dart';
import 'package:zupa/features/home/presentation/bloc/ticket/home_ticket_cubit.dart';
import 'package:zupa/features/home/presentation/pages/widgets/home_search_bar.dart';
import 'package:zupa/features/home/presentation/pages/widgets/ticket_list_tab.dart';
import 'package:zupa/features/home/presentation/pages/widgets/vehicle_capacity_tab.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeTicketCubit>(
          create: (context) => getIt<HomeTicketCubit>()..init(),
        ),
        BlocProvider<HomeFilterCubit>(
          create: (context) => getIt<HomeFilterCubit>()..init(),
        ),
      ],
      child: BlocListener<HomeFilterCubit, HomeFilterState>(
        listener: (context, state) {
          state.whenOrNull(
            filtering: (filter) {
              context.read<HomeTicketCubit>().refresh(filter);
            },
          );
        },
        child: Builder(
          builder: (context) {
            return AppScreen(
              formGroup: context.read<HomeFilterCubit>().formModel.form,
              isChildScrollable: true,
              hasParentView: true,
              title: t.home.title,
              hasAppBar: false,
              floatingActionButton: FloatingActionButton(
                backgroundColor: colorScheme.primaryContainer,
                foregroundColor: colorScheme.primary,
                onPressed: () => context.pushRoute(CheckInRoute()),
                shape: const CircleBorder(),
                child: const Icon(Symbols.camera_alt_rounded),
              ),
              child: const Column(
                spacing: 16,
                children: [
                  Padding(
                    padding: .symmetric(horizontal: 36),
                    child: Column(
                      spacing: 16,
                      children: [
                        SizedBox(height: 16),
                        AppSiteSelector(),
                        HomeSearchBar(),
                        VehicleCapacityTab(),
                      ],
                    ),
                  ),
                  Expanded(child: TicketListTab()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
