import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';
import 'package:zupa/core/helper/converter/icon_converter.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_radio_group.dart';

class VehicleTypeRadioCards extends StatelessWidget {
  const VehicleTypeRadioCards({super.key, this.value});

  final VehicleTypeEntity? value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return AppRadioGroup<VehicleTypeEntity>(
      spacing: 16,
      items: vehicleTypes,
      value: value,
      itemBuilder: (context, item, isSelected, onSelect, radioButton) =>
          Expanded(
            child: Container(
              padding: const .only(top: 16, bottom: 8, left: 8, right: 8),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer,
                borderRadius: .circular(16),
              ),
              child: Column(
                mainAxisSize: .min,
                mainAxisAlignment: .center,
                children: [
                  Icon(
                    const IconConverter().fromJson(item.icon) ??
                        Symbols.globe_rounded,
                    color: item.color.harmonizeWith(colorScheme.primary),
                    size: 24,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    t['vehicles.${item.value}'] ?? item.value,
                    style: AppTextStyles.bodyMediumMedium.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  radioButton ?? const SizedBox.shrink(),
                ],
              ),
            ),
          ),
    );
  }
}
