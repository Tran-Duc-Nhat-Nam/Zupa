import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/parking/presentation/bloc/parking_lot_cubit.dart';

@RoutePage()
class ParkingLotScreen extends StatefulWidget {
  const ParkingLotScreen({super.key});

  @override
  AppState<ParkingLotScreen> createState() => _ParkingLotScreenState();
}

class _ParkingLotScreenState extends AppState<ParkingLotScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return AppScreen(
      title: t.parking.areaConfig,
      isChildScrollable: true,
      child: BlocProvider<ParkingLotCubit>(
        create: (context) => getIt<ParkingLotCubit>()..init(),
        child: BlocBuilder<ParkingLotCubit, ParkingLotState>(
          builder: (context, state) {
            return Skeletonizer(
              enabled: state is Loading,
              child: Padding(
                padding: const .symmetric(vertical: 16, horizontal: 24),
                child: state.maybeMap(
                  loaded: (params) => AppList(
                    items: params.parkingLots.map((lot) {
                      return AppListItem(
                        leadingIcon: Symbols.settings_rounded,
                        content: Row(
                          spacing: 8,
                          children: [
                            Text(
                              lot.name,
                              style: AppTextStyles.bodyMediumMedium.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                            ),
                            Icon(
                              Symbols.lock_rounded,
                              color: colors.error,
                              size: 16,
                            ),
                          ],
                        ),
                        trailingIcon: Symbols.chevron_right_rounded,
                        onTap: () =>
                            context.pushRoute(ParkingDetailsRoute(id: lot.id)),
                      );
                    }).toList(),
                  ),
                  loading: (_) => AppList(
                    items: List.generate(
                      3,
                      (index) => const AppListItem(
                        leadingIcon: Symbols.settings_rounded,
                        text: 'Placeholder name',
                        trailingIcon: Symbols.chevron_right_rounded,
                      ),
                    ),
                  ),
                  orElse: () => const SizedBox.shrink(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
