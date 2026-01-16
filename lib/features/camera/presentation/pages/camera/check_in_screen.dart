import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zupa/features/camera/presentation/pages/camera/widgets/camera_screen.dart';
import 'package:zupa/features/camera/presentation/pages/camera/widgets/ticket_info_card.dart';
import 'package:zupa/features/camera/presentation/pages/camera/widgets/vehicle_info_card.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/camera/presentation/bloc/check_in/check_in_cubit.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  AppState<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends AppState<CheckInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckInCubit>(
      create: (_) => CheckInCubit()
        ..init(
          context,
          GoRouterState.of(context).extra is bool
              ? GoRouterState.of(context).extra! as bool
              : false,
        ),
      child: BlocListener<CheckInCubit, CheckInState>(
        listener: (context, state) {
          state.whenOrNull(submitSuccess: () => context.go('/'));
        },
        child: BlocBuilder<CheckInCubit, CheckInState>(
          builder: (context, state) {
            return AppScreen(
              formKey: formKey,
              appBarColor: Colors.black,
              isClose: true,
              isChildScrollable: true,
              hasSafeTopArea: false,
              backgroundColor: Colors.black,
              child: state.maybeWhen(
                initial: () => const SizedBox(),
                checkIn: (controller) => CameraScreen(
                  isOut: false,
                  controller: controller,
                  onTakePicture: () {
                    formKey.currentState?.saveAndValidate();
                    if (formKey.currentState?.validate() == true) {
                      context.read<CheckInCubit>().check(
                        controller,
                        formKey.currentState!.value['type'],
                      );
                    } else {
                      AppToast.showErrorToast(context.tr('error'));
                    }
                  },
                ),
                checkOut: (controller) => CameraScreen(
                  isOut: true,
                  controller: controller,
                  onTakePicture: () => context.read<CheckInCubit>().check(
                    controller,
                    vehicleTypes[0],
                  ),
                ),
                loading: () => Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Theme.of(context).colorScheme.primary,
                    size: 48,
                  ),
                ),
                submitting: () => Center(
                  child: LoadingAnimationWidget.beat(
                    color: Theme.of(context).colorScheme.primary,
                    size: 48,
                  ),
                ),
                takingPicture: () => Center(
                  child: LoadingAnimationWidget.fallingDot(
                    color: Theme.of(context).colorScheme.primary,
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
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
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
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.primary,
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
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.primary,
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
                                    child: AppTextField(
                                      name: 'ticketNumber',
                                      hintText: context.tr('enterTicketNumber'),
                                      hasBorder: false,
                                      textAlign: .center,
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
                                  onPressed: () => context
                                      .read<CheckInCubit>()
                                      .reset(context),
                                  shape: const CircleBorder(),
                                  color: .basic,
                                  iconPath: AppIcons.rotateLeft,
                                ),
                                Expanded(
                                  child: AppButton(
                                    fitContent: true,
                                    onPressed: () {
                                      formKey.currentState?.saveAndValidate();
                                      if (formKey.currentState?.validate() ==
                                          true) {
                                        context.read<CheckInCubit>().saveTicket(
                                          context,
                                          formKey.currentState?.value,
                                        );
                                      }
                                    },
                                    text: context.tr(
                                      state.maybeWhen(
                                        checkedInSuccess: (_, _) => 'allowIn',
                                        checkedOutSuccess: (_) => 'allowOut',
                                        orElse: () => '',
                                      ),
                                    ),
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
