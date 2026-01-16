import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:zupa/features/home/presentation/bloc/filter/home_filter_cubit.dart' as filter;
import 'package:zupa/features/home/presentation/bloc/ticket/home_ticket_cubit.dart';
import 'package:zupa/widgets/state/app_state.dart';
import 'package:zupa/di/injection.dart';
import 'package:zupa/widgets/app_screen.dart';
import 'package:zupa/features/home/presentation/pages/widgets/home_search_bar.dart';
import 'package:zupa/features/home/presentation/pages/widgets/ticket_list_tab.dart';
import 'package:zupa/features/home/presentation/pages/widgets/vehicle_capacity_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  AppState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends AppState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Jiffy.setLocale('en_US');
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      formKey: formKey,
      isChildScrollable: true,
      hasParentView: true,
      title: context.tr('home'),
      hasAppBar: false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeTicketCubit>(
            create: (context) => getIt<HomeTicketCubit>()..init(context),
          ),
          BlocProvider<filter.HomeFilterCubit>(
            create: (context) =>
                filter.HomeFilterCubit()..load(context, getFormValues),
          ),
        ],
        child: BlocListener<HomeTicketCubit, HomeTicketState>(
          listener: (context, state) {
            state.whenOrNull(
              loaded: (tickets, pageIndex) =>
                  context.read<filter.HomeFilterCubit>().init(context),
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
