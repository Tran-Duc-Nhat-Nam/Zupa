import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../common/constants/vehicle_types.dart';
import '../../common/styles/icons.dart';
import 'widgets/camera_screen.dart';
import 'widgets/ticket_info_card.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'widgets/vehicle_info_card.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_screen.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/state/app_state.dart';

import '../../bloc/camera/check_in/check_in_cubit.dart';
import '../../widgets/popup/app_toast.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  AppState<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends AppState<CheckInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckInCubit>(
      create:
          (_) =>
              CheckInCubit()..init(
                context,
                GoRouterState.of(context).extra is bool
                    ? GoRouterState.of(context).extra! as bool
                    : false,
              ),
      child: BlocBuilder<CheckInCubit, CheckInState>(
        builder: (context, state) {
          return AppScreen(
            formKey: formKey,
            appBarColor: Colors.black,
            isClose: true,
            isChildScrollable: true,
            hasSafeTopArea: false,
            backgroundColor: Colors.black,
            child: switch (state) {
              Initial() => const SizedBox(),
              CheckIn(:final controller) => CameraScreen(
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
              CheckOut(:final controller) => CameraScreen(
                isOut: true,
                controller: controller,
                onTakePicture:
                    () => context.read<CheckInCubit>().check(
                      controller,
                      vehicleTypes[0],
                    ),
              ),
              Loading() => Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Theme.of(context).colorScheme.primary,
                  size: 48,
                ),
              ),
              TakingPicture() => Center(
                child: LoadingAnimationWidget.fallingDot(
                  color: Theme.of(context).colorScheme.primary,
                  size: 48,
                ),
              ),
              _ => Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 16,
                children: [
                  Expanded(
                    flex: 4,
                    child: switch (state) {
                      CheckedInSuccess(:final picture) => Image(
                        image: FileImage(File(picture.path)),
                        fit: BoxFit.fitWidth,
                        frameBuilder: (
                          context,
                          child,
                          frame,
                          wasSynchronouslyLoaded,
                        ) {
                          return frame != null
                              ? SizedBox(
                                width: double.infinity,
                                child: FittedBox(
                                  clipBehavior: Clip.antiAlias,
                                  fit: BoxFit.fitWidth,
                                  child: child,
                                ),
                              )
                              : LoadingAnimationWidget.beat(
                                color: Theme.of(context).colorScheme.primary,
                                size: 48,
                              );
                        },
                      ),
                      CheckedOutSuccess(:final picture) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 24,
                        ),
                        child: Column(
                          spacing: 16,
                          children: [
                            Expanded(
                              child: Image(
                                image: FileImage(File(picture.path)),
                                fit: BoxFit.fitWidth,
                                frameBuilder: (
                                  context,
                                  child,
                                  frame,
                                  wasSynchronouslyLoaded,
                                ) {
                                  return frame != null
                                      ? Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        width: double.infinity,
                                        child: FittedBox(
                                          clipBehavior: Clip.antiAlias,
                                          fit: BoxFit.fitWidth,
                                          child: child,
                                        ),
                                      )
                                      : LoadingAnimationWidget.beat(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                        size: 48,
                                      );
                                },
                              ),
                            ),
                            Expanded(
                              child: Image(
                                image: FileImage(File(picture.path)),
                                fit: BoxFit.fitWidth,
                                frameBuilder: (
                                  context,
                                  child,
                                  frame,
                                  wasSynchronouslyLoaded,
                                ) {
                                  return frame != null
                                      ? Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        width: double.infinity,
                                        child: FittedBox(
                                          clipBehavior: Clip.antiAlias,
                                          fit: BoxFit.fitWidth,
                                          child: child,
                                        ),
                                      )
                                      : LoadingAnimationWidget.beat(
                                        color:
                                            Theme.of(
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
                      _ => const SizedBox(),
                    },
                  ),
                  switch (state) {
                    CheckedInSuccess(:final vehicleType) => SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child:
                            vehicleType == vehicleTypes[1]
                                ? AppCard(
                                  child: Center(
                                    child: AppTextField(
                                      name: 'ticketNumber',
                                      hintText: context.tr('enterTicketNumber'),
                                      hasBorder: false,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                                : const VehicleInfoCard(
                                  ticketNumber: '01223',
                                  licenseNumber: '29AB90175',
                                ),
                      ),
                    ),
                    _ => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TicketInfoCard(
                          licenseNumber: '29AB90175',
                          price: 4000,
                          ticketType: 'guest',
                          timeIn: DateTime.now(),
                          timeOut: DateTime.now(),
                          totalTime: 120,
                        ),
                      ),
                    ),
                  },
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 12,
                            children: [
                              AppButton(
                                fitContent: true,
                                theme: AppButtonTheme.secondary,
                                onPressed:
                                    () => context.read<CheckInCubit>().reset(
                                      context,
                                    ),
                                shape: const CircleBorder(),
                                color: AppButtonColor.basic,
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
                                      context.go('/');
                                    }
                                  },
                                  text: context.tr(switch (state) {
                                    CheckedInSuccess() => 'allowIn',
                                    CheckedOutSuccess() => 'allowOut',
                                    _ => '',
                                  }),
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
            },
          );
        },
      ),
    );
  }
}
