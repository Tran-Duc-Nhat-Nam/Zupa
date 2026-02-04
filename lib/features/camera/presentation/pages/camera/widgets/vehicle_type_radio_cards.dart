import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_radio_group.dart';
import 'package:zupa/core/models/vehicle_type.dart';
import 'package:zupa/gen/strings.g.dart';

class VehicleTypeRadioCards extends StatelessWidget {
  const VehicleTypeRadioCards({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRadioGroup<VehicleType>(
      name: 'type',
      items: vehicleTypes,
      required: true,
      itemBuilder: (radioButton, vehicle, isSelected, select) => Expanded(
        child: InkWell(
          onTap: select,
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
                      vehicle.icon ?? Symbols.globe,
                      color: ThemeHelper.getColor(context).grey700,
                      size: 24,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      t[vehicle.value],
                      style: AppTextStyles.bodyMediumMedium.copyWith(
                        color: ThemeHelper.getColor(context).grey700,
                      ),
                    ),
                  ),
                  Expanded(child: radioButton),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
