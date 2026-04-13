import 'package:flutter/material.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';

const List<VehicleTypeEntity> vehicleTypes = [
  .new(
    name: 'motorbike',
    value: 'motorbike',
    icon: 'motorbike',
    color: Colors.yellow,
  ),
  .new(name: 'bicycle', value: 'bicycle', icon: 'bicycle', color: Colors.blue),
  .new(name: 'car', value: 'car', icon: 'car', color: Colors.pink),
];
