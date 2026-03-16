import 'package:flutter/material.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';

const List<VehicleTypeEntity> vehicleTypes = [
  .new(
    name: 'motorbike',
    value: 'motorbike',
    icon: 'motorcycle_rounded',
    color: Colors.yellow,
  ),
  .new(
    name: 'bicycle',
    value: 'bicycle',
    icon: 'pedal_bike_rounded',
    color: Colors.blue,
  ),
  .new(
    name: 'car',
    value: 'car',
    icon: 'directions_car_rounded',
    color: Colors.pink,
  ),
];
