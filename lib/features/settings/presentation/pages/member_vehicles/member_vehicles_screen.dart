import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/features/settings/presentation/bloc/member_vehicles/filter/member_vehicles_filter_cubit.dart'
    as filter;
import 'package:zupa/features/settings/presentation/bloc/member_vehicles/list/member_vehicles_list_cubit.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/features/settings/presentation/pages/member_vehicles/widgets/member_vehicles_list_tab.dart';
import 'package:zupa/features/settings/presentation/pages/member_vehicles/widgets/member_vehicles_search_bar.dart';
import 'package:zupa/features/settings/presentation/pages/member_vehicles/widgets/member_vehicles_tab_bar.dart';
import 'package:zupa/gen/strings.g.dart';

@RoutePage()
class MemberVehiclesScreen extends StatefulWidget {
  const MemberVehiclesScreen({super.key});

  @override
  AppState<MemberVehiclesScreen> createState() => _MemberVehiclesScreenState();
}

class _MemberVehiclesScreenState extends AppState<MemberVehiclesScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberVehiclesListCubit>(
          create: (context) => getIt<MemberVehiclesListCubit>()..init(),
        ),
        BlocProvider<filter.MemberVehiclesFilterCubit>(
          create: (context) =>
              getIt<filter.MemberVehiclesFilterCubit>()
                ..init(),
        ),
      ],
      child: AppScreen(
        formGroup: context.read<filter.MemberVehiclesFilterCubit>().form,
        isChildScrollable: true,
        noBackground: true,
        title: t.memberVehicles,
        appBarTrailing: [
          Padding(
            padding: const .only(right: 24),
            child: InkWell(
              child: const Icon(
                Symbols.add_circle_outline_rounded,
              ),
              onTap: () => context.pushRoute(const MemberVehiclesRoute()),
            ),
          ),
        ],
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const Padding(
                padding: .symmetric(horizontal: 24),
                child: MemberVehiclesTabBar(),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: .symmetric(horizontal: 24),
                child: MemberVehiclesSearchBar(),
              ),
              Expanded(
                child: TabBarView(
                  children: List.generate(
                    3,
                    (index) => const MemberVehiclesListTab(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

