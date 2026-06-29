import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zupa/core/domain/entities/vehicle_type_entity.dart';

const List<VehicleTypeEntity> vehicleTypes = [
  .new(
    name: 'motorbike',
    value: 'motorbike',
    icon: Symbols.motorcycle_rounded,
    color: Colors.yellow,
  ),
  .new(
    name: 'bicycle',
    value: 'bicycle',
    icon: Icons.pedal_bike_rounded,
    color: Colors.blue,
  ),
  .new(
    name: 'car',
    value: 'car',
    icon: Icons.car_rental_rounded,
    color: Colors.pink,
  ),
];
