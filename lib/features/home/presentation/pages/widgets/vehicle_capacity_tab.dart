import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';
import 'package:zupa/core/helper/converter/icon_converter.dart';
import 'package:zupa/features/home/presentation/bloc/home_cubit.dart';
import 'package:zupa/features/home/presentation/models/home_form.dart';
import 'package:zupa/features/home/presentation/pages/widgets/vehicle_capacity_card.dart';

class VehicleCapacityTab extends StatelessWidget {
  const VehicleCapacityTab({super.key});

  @override
  Widget build(BuildContext context) {
    final form = ReactiveHomeForm.of(context);
    return ReactiveFormField<VehicleTypeEntity?, VehicleTypeEntity?>(
      formControlName: 'type',
      builder: (field) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Padding(
              key: ValueKey(state.runtimeType),
              padding: const .symmetric(vertical: 8),
              child: Skeletonizer(
                enabled: state is Loading,
                child: Row(
                  children: List.generate(
                    vehicleTypes.length,
                    (index) => Expanded(
                      child: Padding(
                        padding: .only(
                          right: index == vehicleTypes.length - 1 ? 0 : 12,
                        ),
                        child: VehicleCapacityCard(
                          icon:
                              const IconConverter().fromJson(
                                vehicleTypes[index].icon,
                              ) ??
                              Symbols.globe_rounded,
                          color: vehicleTypes[index].color,
                          name: vehicleTypes[index].value,
                          current: 65 + index * 20,
                          capacity: 120,
                          isWarning: (65 + index * 20) / 120 >= 0.8,
                          isDisabled:
                              state is Loading ||
                              state is Refreshing ||
                              state is LoadingMore,
                          isSelected:
                              form?.typeControl.value == vehicleTypes[index],
                          onPressed: () {
                            if (state is Loading ||
                                state is Refreshing ||
                                state is LoadingMore) {
                              return;
                            }
                            context.read<HomeCubit>().refresh(
                              filter:
                                  form?.model.toParams() ??
                                  .initial(type: vehicleTypes[index]),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
