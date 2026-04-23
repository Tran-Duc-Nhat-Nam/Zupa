import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/camera/presentation/bloc/check_in/check_in_cubit.dart';
import 'package:zupa/features/camera/presentation/pages/camera/widgets/camera_screen.dart';
import 'package:zupa/features/camera/presentation/pages/camera/widgets/ticket_info_card.dart';
import 'package:zupa/features/camera/presentation/pages/camera/widgets/vehicle_info_card.dart';

@RoutePage()
class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key, this.isCheckOut = false});

  final bool isCheckOut;

  @override
  AppState<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends AppState<CheckInScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return BlocProvider<CheckInCubit>(
      create: (_) => CheckInCubit()..init(widget.isCheckOut),
      child: BlocListener<CheckInCubit, CheckInState>(
        listener: (context, state) {
          state.whenOrNull(
            submitSuccess: () =>
                context.router.replaceAll([const LoginRoute()]),
          );
        },
        child: BlocBuilder<CheckInCubit, CheckInState>(
          builder: (context, state) {
            return AppScreen(
              appBarColor: colors.surface,
              isClose: true,
              isChildScrollable: true,
              hasSafeTopArea: false,
              backgroundColor: colors.surface,
              child: state.maybeWhen(
                initial: () => const SizedBox(),
                checkIn: (controller) => CameraScreen(
                  isOut: false,
                  controller: controller,
                  onTakePicture: () =>
                      context.read<CheckInCubit>().check(controller),
                ),
                checkOut: (controller) => CameraScreen(
                  isOut: true,
                  controller: controller,
                  onTakePicture: () =>
                      context.read<CheckInCubit>().check(controller),
                ),
                loading: () => Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: colors.primary,
                    size: 48,
                  ),
                ),
                submitting: () => Center(
                  child: LoadingAnimationWidget.beat(
                    color: colors.primary,
                    size: 48,
                  ),
                ),
                takingPicture: () => Center(
                  child: LoadingAnimationWidget.fallingDot(
                    color: colors.primary,
                    size: 48,
                  ),
                ),
                orElse: () => Column(
                  mainAxisSize: .min,
                  spacing: 16,
                  children: [
                    Expanded(
                      flex: 4,
                      child: state.maybeWhen(
                        checkedInSuccess: (picture, _) => Image(
                          image: FileImage(.new(picture.path)),
                          fit: .fitWidth,
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                                return frame != null
                                    ? SizedBox(
                                        width: .infinity,
                                        child: FittedBox(
                                          clipBehavior: .antiAlias,
                                          fit: .fitWidth,
                                          child: child,
                                        ),
                                      )
                                    : LoadingAnimationWidget.beat(
                                        color: colors.primary,
                                        size: 48,
                                      );
                              },
                        ),
                        checkedOutSuccess: (picture) => Padding(
                          padding: const .symmetric(
                            vertical: 16,
                            horizontal: 24,
                          ),
                          child: Column(
                            spacing: 16,
                            children: [
                              Expanded(
                                child: Image(
                                  image: FileImage(.new(picture.path)),
                                  fit: .fitWidth,
                                  frameBuilder:
                                      (
                                        context,
                                        child,
                                        frame,
                                        wasSynchronouslyLoaded,
                                      ) {
                                        return frame != null
                                            ? Container(
                                                clipBehavior: .antiAlias,
                                                decoration: BoxDecoration(
                                                  borderRadius: .circular(8),
                                                ),
                                                width: .infinity,
                                                child: FittedBox(
                                                  clipBehavior: .antiAlias,
                                                  fit: .fitWidth,
                                                  child: child,
                                                ),
                                              )
                                            : LoadingAnimationWidget.beat(
                                                color: colors.primary,
                                                size: 48,
                                              );
                                      },
                                ),
                              ),
                              Expanded(
                                child: Image(
                                  image: FileImage(.new(picture.path)),
                                  fit: .fitWidth,
                                  frameBuilder:
                                      (
                                        context,
                                        child,
                                        frame,
                                        wasSynchronouslyLoaded,
                                      ) {
                                        return frame != null
                                            ? Container(
                                                clipBehavior: .antiAlias,
                                                decoration: BoxDecoration(
                                                  borderRadius: .circular(8),
                                                ),
                                                width: .infinity,
                                                child: FittedBox(
                                                  clipBehavior: .antiAlias,
                                                  fit: .fitWidth,
                                                  child: child,
                                                ),
                                              )
                                            : LoadingAnimationWidget.beat(
                                                color: colors.primary,
                                                size: 48,
                                              );
                                      },
                                ),
                              ),
                            ],
                          ),
                        ),
                        orElse: () => const SizedBox(),
                      ),
                    ),
                    state.maybeWhen(
                      checkedInSuccess: (_, vehicleType) => SizedBox(
                        height: 100,
                        child: Padding(
                          padding: const .symmetric(horizontal: 24),
                          child: vehicleType == vehicleTypes[1]
                              ? AppCard(
                                  child: Center(
                                    child: ReactiveValueListenableBuilder<String>(
                                      formControl: context
                                          .read<CheckInCubit>()
                                          .formModel
                                          .ticketIDControl,
                                      builder: (context, control, child) => AppTextField(
                                        hintText: t.parking.enterTicketNumber,
                                        textAlign: .center,
                                      ),
                                    ),
                                  ),
                                )
                              : const VehicleInfoCard(
                                  ticketNumber: '01223',
                                  licenseNumber: '29AB90175',
                                ),
                        ),
                      ),
                      orElse: () => Expanded(
                        child: Padding(
                          padding: const .symmetric(horizontal: 24),
                          child: TicketInfoCard(
                            licenseNumber: '29AB90175',
                            price: 4000,
                            ticketType: 'guest',
                            timeIn: .now(),
                            timeOut: .now(),
                            totalTime: 120,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const .symmetric(vertical: 16, horizontal: 16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: .center,
                              spacing: 12,
                              children: [
                                AppButton(
                                  fitContent: true,
                                  theme: .secondary,
                                  onPressed: () =>
                                      context.read<CheckInCubit>().reset(),
                                  color: .basic,
                                  icon: Symbols.rotate_left_rounded,
                                ),
                                Expanded(
                                  child: AppButton(
                                    fitContent: true,
                                    onPressed: context
                                        .read<CheckInCubit>()
                                        .saveTicket,
                                    text:
                                        state.mapOrNull(
                                          checkedInSuccess: (_) =>
                                              t.parking.allowIn,
                                          checkedOutSuccess: (_) =>
                                              t.parking.allowOut,
                                        ) ??
                                        '',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
