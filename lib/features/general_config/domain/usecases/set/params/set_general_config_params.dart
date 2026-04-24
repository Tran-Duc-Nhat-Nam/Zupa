class SetGeneralConfigParams {
  const SetGeneralConfigParams({
    required this.isWarningCapacity,
    required this.warningCapacityThreshold,
  });

  factory SetGeneralConfigParams.initial({
    bool? isWarning,
    int? warningThreshold,
  }) => .new(
    isWarningCapacity: isWarning ?? false,
    warningCapacityThreshold: warningThreshold ?? 0,
  );

  final bool isWarningCapacity;
  final int warningCapacityThreshold;
}
