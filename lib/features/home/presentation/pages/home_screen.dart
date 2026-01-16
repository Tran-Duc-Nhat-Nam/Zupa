import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import '../bloc/filter/home_filter_cubit.dart' as filter;
import '../bloc/ticket/home_ticket_cubit.dart';
import '../../../../widgets/state/app_state.dart';
import '../../../../di/injection.dart';
import '../../../../widgets/app_screen.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/ticket_list_tab.dart';
import 'widgets/vehicle_capacity_tab.dart';

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
