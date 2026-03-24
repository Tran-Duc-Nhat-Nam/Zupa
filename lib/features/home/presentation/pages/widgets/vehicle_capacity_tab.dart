import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';
import 'package:zupa/core/helper/converter/icon_converter.dart';

import 'package:zupa/features/home/presentation/bloc/filter/home_filter_cubit.dart';
import 'package:zupa/features/home/presentation/pages/widgets/vehicle_capacity_card.dart';

class VehicleCapacityTab extends StatelessWidget {
  const VehicleCapacityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<VehicleTypeEntity?, VehicleTypeEntity?>(
      formControlName: 'type',
      builder: (field) {
        return BlocBuilder<HomeFilterCubit, HomeFilterState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Skeletonizer(
                enabled: state is Loading,
                child: Row(
                  spacing: 16,
                  children: List.generate(
                    vehicleTypes.length,
                    (index) => Expanded(
                      child: VehicleCapacityCard(
                        icon:
                            const IconConverter().fromJson(
                                  vehicleTypes[index].icon,
                                ) ??
                            Symbols.globe_rounded,
                        name: vehicleTypes[index].value,
                        current: 65 + index * 20,
                        capacity: 120,
                        isWarning: (65 + index * 20) / 120 >= 0.8,
                        isDisabled: state is Loading || state is Filtering,
                        isSelected: state.maybeWhen(
                          loaded: (filter) =>
                              filter.type?.value == vehicleTypes[index].value,
                          filtering: (filter) =>
                              filter.type?.value == vehicleTypes[index].value,
                          orElse: () => false,
                        ),
                        onPressed: () {
                          field.value == vehicleTypes[index]
                              ? field.didChange(null)
                              : field.didChange(vehicleTypes[index]);
                          context.read<HomeFilterCubit>().filter();
                        },
                      )
                          .animate(delay: (index * 100).ms)
                          .fadeIn(duration: 400.ms)
                          .slideY(begin: 0.2, end: 0, curve: Curves.easeOutBack),
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
