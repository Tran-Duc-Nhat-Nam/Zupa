import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:zupa/features/home/presentation/bloc/filter/home_filter_cubit.dart';
import 'package:zupa/features/home/presentation/bloc/ticket/home_ticket_cubit.dart' as ticket;
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/features/home/presentation/pages/widgets/vehicle_capacity_card.dart';

class VehicleCapacityTab extends StatelessWidget {
  const VehicleCapacityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: 'vehicleType',
      builder: (field) {
        return BlocBuilder<HomeFilterCubit, HomeFilterState>(
          builder: (context, state) {
            final types = context.read<HomeFilterCubit>().types;
            return Skeletonizer(
              enabled: state is Loading,
              child: AppCard(
                padding: const .all(16),
                child: Row(
                  spacing: 16,
                  children: .generate(
                    types.length,
                    (index) => Expanded(
                      child: VehicleCapacityCard(
                        iconPath: types[index].iconPath,
                        name: types[index].value,
                        current: 65 + index * 20,
                        capacity: 120,
                        isWarning: (65 + index * 20) / 120 >= 0.8,
                        isDisabled: state is Loading || state is Filtering,
                        isSelected: state.maybeWhen(
                          loaded: (filter) =>
                              filter.type?.value == types[index].value,
                          filtering: (filter) =>
                              filter.type?.value == types[index].value,
                          orElse: () => false,
                        ),
                        onPressed: () {
                          field.value == types[index]
                              ? field.didChange(null)
                              : field.didChange(types[index]);
                          context.read<HomeFilterCubit>().filter(
                            (filter) => context
                                .read<ticket.HomeTicketCubit>()
                                .init(context, filter: filter),
                          );
                        },
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
