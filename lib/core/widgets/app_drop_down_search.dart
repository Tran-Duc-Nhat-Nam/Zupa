import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/widgets/app_form_field.dart';

class AppDropDownSearchExtraItem<T> {
  const AppDropDownSearchExtraItem({this.value, required this.label});

  final T? value;
  final dynamic label;
}

class AppDropDownSearch<T> extends StatefulWidget {
  const AppDropDownSearch({
    required this.name,
    required this.dropdownItems,
    this.hint = '',
    this.valueListenable,
    this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemWidth,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.initialValue,
    this.defaultValue,
    this.itemLabelGetter,
    this.extraDropdownItems = const [],
    this.offset = Offset.zero,
    super.key,
  });
  final String name;
  final String hint;
  final ValueListenable<T?>? valueListenable;
  final List<T> dropdownItems;
  final List<AppDropDownSearchExtraItem<T>> extraDropdownItems;
  final T? initialValue;
  final T? defaultValue;
  final String Function(T?)? itemLabelGetter;
  final ValueChanged<T?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final double? itemWidth;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;

  @override
  State<AppDropDownSearch<T>> createState() => _AppDropDownSearchState<T>();
}

class _AppDropDownSearchState<T> extends State<AppDropDownSearch<T>> {
  bool isOpen = false;
  late ValueNotifier<T?> valueListenable;
  @override
  void initState() {
    valueListenable = ValueNotifier<T?>(
      widget.initialValue ?? widget.defaultValue,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppFormField<T>(
      name: widget.name,
      builder: (field) => DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          onMenuStateChange: (value) => setState(() {
            isOpen = value;
          }),
          isExpanded: true,
          hint: Container(
            alignment: widget.hintAlignment,
            child: Text(
              widget.hint,
              overflow: .ellipsis,
              maxLines: 1,
              style: .new(fontSize: 14, color: Theme.of(context).hintColor),
            ),
          ),
          valueListenable: valueListenable,
          items: widget.extraDropdownItems.isEmpty
              ? widget.dropdownItems
                    .map(
                      (item) => DropdownItem<T>(
                        value: item,
                        height: widget.itemHeight ?? 40,
                        child: Container(
                          alignment: widget.valueAlignment,
                          width: widget.itemWidth ?? 140,
                          child: Text(
                            widget.itemLabelGetter != null
                                ? widget.itemLabelGetter!(item)
                                : item.toString(),
                            overflow: .ellipsis,
                            maxLines: 1,
                            style: const .new(fontSize: 14),
                          ),
                        ),
                      ),
                    )
                    .toList()
              : [...widget.dropdownItems, ...widget.extraDropdownItems]
                    .map(
                      (item) => DropdownItem<T>(
                        value: item is T
                            ? item
                            : (item! as AppDropDownSearchExtraItem<T>).value,
                        height: widget.itemHeight ?? 40,
                        child: Container(
                          width: widget.itemWidth ?? 140,
                          alignment: widget.valueAlignment,
                          child: Text(
                            item is T
                                ? widget.itemLabelGetter != null
                                      ? widget.itemLabelGetter!(item)
                                      : item.toString()
                                : (item! as AppDropDownSearchExtraItem<T>)
                                      .label,
                            overflow: .ellipsis,
                            maxLines: 1,
                            style: const .new(fontSize: 14),
                          ),
                        ),
                      ),
                    )
                    .toList(),
          onChanged: (value) => {
            widget.onChanged?.call(value),
            field.didChange(value ?? widget.defaultValue),
            valueListenable.value = value ?? widget.defaultValue,
          },
          selectedItemBuilder: widget.selectedItemBuilder,
          buttonStyleData: ButtonStyleData(
            height: widget.buttonHeight ?? 40,
            width: widget.buttonWidth,
            padding: widget.buttonPadding ?? const .only(left: 14, right: 14),
            decoration:
                widget.buttonDecoration ??
                .new(
                  borderRadius: .circular(8),
                  border: .all(color: ThemeHelper.getColor(context).grey100),
                ),
            elevation: widget.buttonElevation,
          ),
          iconStyleData: IconStyleData(
            icon: AnimatedRotation(
              turns: isOpen ? 0.5 : 0,
              duration: const .new(milliseconds: 200),
              child: widget.icon ?? const Icon(Icons.keyboard_arrow_down),
            ),
            iconSize: widget.iconSize ?? 24,
            iconEnabledColor: widget.iconEnabledColor,
            iconDisabledColor: widget.iconDisabledColor,
          ),
          dropdownStyleData: DropdownStyleData(
            //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
            maxHeight: widget.dropdownHeight ?? 200,
            width: widget.dropdownWidth ?? 140,
            padding: widget.dropdownPadding,
            decoration:
                widget.dropdownDecoration ??
                BoxDecoration(borderRadius: .circular(14)),
            elevation: widget.dropdownElevation ?? 8,
            //Null or Offset(0, 0) will open just under the button. You can edit as you want.
            offset: widget.offset,
            scrollbarTheme: ScrollbarThemeData(
              radius: widget.scrollbarRadius ?? const .circular(40),
              thickness: widget.scrollbarThickness != null
                  ? .all<double>(widget.scrollbarThickness!)
                  : null,
              thumbVisibility: widget.scrollbarAlwaysShow != null
                  ? .all<bool>(widget.scrollbarAlwaysShow!)
                  : null,
            ),
          ),
          menuItemStyleData: .new(
            padding: widget.itemPadding ?? const .only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }
}
