
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/gen/strings.g.dart';

@RoutePage()
class ParkingPriceSettingScreen extends StatefulWidget {
  const ParkingPriceSettingScreen({super.key});

  @override
  State<ParkingPriceSettingScreen> createState() => _ParkingPriceSettingScreenState();
}

class _ParkingPriceSettingScreenState extends State<ParkingPriceSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: t.parkingPrice,
      child: Center(child: Text(t.parkingPrice)),
    );
  }
}
