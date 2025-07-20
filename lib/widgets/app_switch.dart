import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../helper/theme/theme_helper.dart';

class AppSwitch extends StatefulWidget {
  const AppSwitch({super.key, required this.name, this.onToggle});
  final String name;
  final void Function(bool value, void Function(bool value) toggle)? onToggle;

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  bool isChecked = false;
  var controller = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    try {
      isLoading = Skeletonizer.of(context).enabled;
    } catch (e) {
      isLoading = false;
    }
    return FormBuilderField<bool>(
      name: widget.name,
      builder: (field) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius:
                isLoading
                    ? BorderRadius.circular(15)
                    : BorderRadius.circular(0),
          ),
          child: Skeleton.replace(
            width: 50,
            height: 30,
            child: AdvancedSwitch(
              controller: controller,
              activeColor: ThemeHelper.getColor(context).primary500,
              inactiveColor: ThemeHelper.getColor(context).grey500,
              initialValue: isChecked,
              onToggle: (value, toggle) {
                if (widget.onToggle != null) {
                  widget.onToggle!(value, toggle);
                } else {
                  toggle(!value);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
