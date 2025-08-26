import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/revenue/filter/revenue_filter_cubit.dart' as filter;
import '../../bloc/revenue/list/revenue_list_cubit.dart';
import '../../helper/theme/theme_helper.dart';
import '../../widgets/state/app_state.dart';
import '../../widgets/app_drop_down_search.dart';
import '../../widgets/app_screen.dart';
import 'widgets/revenue_list_tab.dart';

class RevenueScreen extends StatefulWidget {
  const RevenueScreen({super.key});

  @override
  AppState<RevenueScreen> createState() => _RevenueScreenState();
}

class _RevenueScreenState extends AppState<RevenueScreen> {
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
      title: context.tr('revenue'),
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
              border: Border.all(
                color: ThemeHelper.getColor(context).primary100,
              ),
            ),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RevenueListCubit>(
            create: (context) => RevenueListCubit()..init(context),
          ),
          BlocProvider<filter.RevenueFilterCubit>(
            create: (context) =>
                filter.RevenueFilterCubit()..load(context, getFormValues),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<RevenueListCubit, RevenueListState>(
              listener: (context, state) {
                state.whenOrNull(
                  loaded: (_, _) =>
                      context.read<filter.RevenueFilterCubit>().init(context),
                );
              },
            ),
          ],
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
