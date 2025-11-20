import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/api/ticket/ticket_api.dart';
import '../../../data/model/member_vehicle/member_vehicle.dart';
import '../../../helper/api/api_helper.dart';
import '../../../helper/auth/auth_helper.dart';

part 'member_vehicle_detail_state.dart';
part 'member_vehicle_detail_cubit.freezed.dart';

class MemberVehicleDetailCubit extends Cubit<MemberVehicleDetailState> {
  MemberVehicleDetailCubit() : super(const .initial());

  Future<void> init(BuildContext context, {String? code}) async {
    if (code == null) {
      emit(const .empty());
    } else {
      emit(const .loading());
      await Future.delayed(const .new(seconds: 2));
      if (context.mounted) {
        await ApiHelper.callAPI(
          context: context,
          apiFunction: (dio) => StaffAPI(dio).getList(const .new()),
          onSuccess: (response) {
            final item = response.data.data as MemberVehicle;
            emit(.loaded(item));
          },
          onFailed: (response) => emit(.failed(response.message)),
        );
      } else {
        emit(const .initial());
      }
    }
  }

  void create(BuildContext context, Map<String, dynamic> data) {
    emit(const .loading());
    ApiHelper.callAPI(
      context: context,
      apiFunction: (dio) => StaffAPI(dio).create(
        .new(
          name: data['name'],
          phoneNumber: data['phoneNumber'],
          licenseNumber: data['licenseNumber'],
          cardID: data['cardID'],
          branchID: data['branchID'],
          vehicleTypeID: data['vehicleTypeID'],
          expiredIn: data['expiredIn'],
        ),
      ),
      onSuccess: (response) async {
        await AuthHelper.setAuth(response.data['accessToken']);
        emit(const .failed('Hehe'));
      },
      onFailed: (response) => emit(.failed(response.message)),
      onError: (response) => emit(.failed(response.toString())),
    );
  }

  void delete(BuildContext context, String id) {
    emit(const .loading());
    ApiHelper.callAPI(
      context: context,
      apiFunction: (dio) => StaffAPI(dio).delete(id),
      onSuccess: (response) async {
        await AuthHelper.setAuth(response.data['accessToken']);
        emit(const .failed('Hehe'));
      },
      onFailed: (response) => emit(.failed(response.message)),
      onError: (response) => emit(.failed(response.toString())),
    );
  }
}
