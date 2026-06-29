import 'package:flutter/material.dart';

class VehicleTypeEntity {
  const VehicleTypeEntity({
    required this.value,
    required this.name,
    required this.icon,
    required this.color,
  });

  final String value;
  final String name;
  final IconData icon;
  final Color color;
}
