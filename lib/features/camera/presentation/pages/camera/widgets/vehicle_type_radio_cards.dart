import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_radio_group.dart';
import 'package:zupa/core/models/vehicle_type.dart';
import 'package:zupa/features/camera/presentation/bloc/check_in/check_in_cubit.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';

class VehicleTypeRadioCards extends StatelessWidget {
  const VehicleTypeRadioCards({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRadioGroup<VehicleType>(
      formControl: context.read<CheckInCubit>().formModel.vehicleTypeControl,
      items: vehicleTypes,
      itemBuilder: (context, item, isSelected, onSelect, radioButton) =>
          Expanded(
            child: InkWell(
              onTap: onSelect,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: .all(isSelected ? 5 : 8),
                  decoration: BoxDecoration(
                    color: ThemeHelper.getColor(context).white,
                    borderRadius: .circular(4),
                    border: isSelected
                        ? .all(
                            color: ThemeHelper.getColor(context).primary500,
                            width: 3,
                          )
                        : null,
                  ),
                  child: Column(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Expanded(
                        child: Icon(
                          item.icon ?? Symbols.globe,
                          color: ThemeHelper.getColor(context).grey700,
                          size: 24,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          t[item.value],
                          style: AppTextStyles.bodyMediumMedium.copyWith(
                            color: ThemeHelper.getColor(context).grey700,
                          ),
                        ),
                      ),
                      Expanded(child: radioButton ?? const SizedBox()),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
