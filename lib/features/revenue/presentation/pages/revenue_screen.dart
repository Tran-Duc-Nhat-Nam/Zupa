
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zupa/core/constants/routes.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/features/revenue/presentation/bloc/filter/revenue_filter_cubit.dart';
import 'package:zupa/features/revenue/presentation/bloc/list/revenue_list_cubit.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/revenue/presentation/pages/widgets/revenue_list_tab.dart';
import 'package:zupa/gen/strings.g.dart';

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
      title: Translations.of(context).revenue,
      hasAppBar: false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<RevenueFilterCubit>()..init(),
          ),
          BlocProvider(create: (context) => getIt<RevenueListCubit>()..init()),
        ],
        child: BlocListener<RevenueListCubit, RevenueListState>(
          listener: (context, state) {
            state.whenOrNull(
              unauthenticated: () => DialogHelper.showAuthDialog(context),
            );
          },
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
