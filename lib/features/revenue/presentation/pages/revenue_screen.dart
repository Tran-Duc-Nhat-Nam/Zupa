import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupa/di/injection.dart';
import '../bloc/filter/revenue_filter_cubit.dart' as filter;
import '../bloc/list/revenue_list_cubit.dart';
import 'package:zupa/widgets/app_screen.dart';
import 'package:zupa/widgets/state/app_state.dart';
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
      hasParentView: true,
      title: context.tr('revenue'),
      hasAppBar: false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<filter.RevenueFilterCubit>()..init(context),
          ),
          BlocProvider(
            create: (context) => getIt<RevenueListCubit>()..init(context),
          ),
        ],
        child: const Column(
          children: [
            SizedBox(height: 16),
            Expanded(child: RevenueListTab()),
          ],
        ),
      ),
    );
  }
}
