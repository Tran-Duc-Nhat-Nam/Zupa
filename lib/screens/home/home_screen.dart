import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import '../../bloc/home/filter/home_filter_cubit.dart' as filter;
import '../../bloc/home/ticket/home_ticket_cubit.dart';
import '../../common/constants/debugger.dart';
import '../../helper/theme/theme_helper.dart';
import '../../widgets/state/app_state.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/ticket_list_tab.dart';
import 'widgets/vehicle_capacity_tab.dart';
import '../../widgets/app_drop_down_search.dart';
import '../../widgets/app_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  AppState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends AppState<HomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await Jiffy.setLocale('en_US');
      super.initState();
    });
  }

  @override
  Map<String, dynamic> getFormValues() {
    formKey.currentState?.saveAndValidate();
    if (formKey.currentState?.validate() == true) {
      return formKey.currentState!.value;
    }
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      formKey: formKey,
      isChildScrollable: true,
      title: context.tr('home'),
      appBarTrailing: [
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: AppDropDownSearch(
            name: 'parkingLot',
            dropdownItems: const ['Bãi xe 1', 'Bãi xe 2', 'Bãi xe 3'],
            initialValue: 'Bãi xe 2',
            buttonWidth: 140,
            buttonDecoration: BoxDecoration(
              color: ThemeHelper.getColor(context).primary50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ThemeHelper.getColor(context).primary100),
            ),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeTicketCubit>(
            create: (context) => HomeTicketCubit()..init(context),
          ),
          BlocProvider<filter.HomeFilterCubit>(
            create: (context) =>
                filter.HomeFilterCubit()..load(context, getFormValues),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<HomeTicketCubit, HomeTicketState>(
              listener: (context, state) {
                state.whenOrNull(
                  loaded: (tickets, pageIndex) =>
                      context.read<filter.HomeFilterCubit>().init(context),
                );
              },
            ),
          ],
          child: const Column(
            spacing: 10,
            children: [
              SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: HomeSearchBar(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
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
