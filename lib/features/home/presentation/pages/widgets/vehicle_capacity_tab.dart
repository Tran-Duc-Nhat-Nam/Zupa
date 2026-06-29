import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/domain/entities/vehicle_type_entity.dart';
import 'package:zupa/core/widgets/app_input_wrapper.dart';
import 'package:zupa/features/home/presentation/bloc/home_cubit.dart';
import 'package:zupa/features/home/presentation/form/home_form.dart';
import 'package:zupa/features/home/presentation/pages/widgets/vehicle_capacity_card.dart';

class VehicleCapacityTab extends StatelessWidget {
  const VehicleCapacityTab({super.key});

  @override
  Widget build(BuildContext context) {
    final form = ReactiveHomeForm.of(context);
    return AppInputWrapper<VehicleTypeEntity?>(
      control: form?.typeControl,
      builder: (value, onChanged, errorText) =>
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => Padding(
              key: ValueKey(state.runtimeType),
              padding: const .symmetric(vertical: 8),
              child: Skeletonizer(
                enabled: state.isLoading,
                child: Row(
                  children: List.generate(
                    vehicleTypes.length,
                    (index) => Expanded(
                      child: Padding(
                        padding: .only(
                          right: index == vehicleTypes.length - 1 ? 0 : 12,
                        ),
                        child: VehicleCapacityCard(
                          icon: vehicleTypes[index].icon,
                          color: vehicleTypes[index].color,
                          name: vehicleTypes[index].value,
                          current: 65 + index * 20,
                          capacity: 120,
                          isWarning: (65 + index * 20) / 120 >= 0.8,
                          isDisabled: state.isFiltering,
                          isSelected: value == vehicleTypes[index],
                          onPressed: () => state.isFiltering
                              ? null
                              : () {
                                  onChanged?.call(vehicleTypes[index]);
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
            ),
          ),
    );
  }
}
