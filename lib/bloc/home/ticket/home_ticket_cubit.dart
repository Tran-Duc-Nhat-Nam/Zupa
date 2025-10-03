import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../common/constants/vehicle_types.dart';
import '../../../data/api/ticket/ticket_api.dart';
import '../../../data/model/ticket/ticket.dart';
import '../../../data/request/request.dart';
import '../../../helper/api/api_helper.dart';
import '../filter/model/home_filter.dart';

part 'home_ticket_state.dart';
part 'home_ticket_cubit.freezed.dart';

class HomeTicketCubit extends Cubit<HomeTicketState> {
  HomeTicketCubit() : super(const HomeTicketState.initial());

  Future<void> init(
    BuildContext context, {
    HomeFilter filter = const HomeFilter(),
  }) async {
    emit(const HomeTicketState.loading());
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      await ApiHelper.callAPI(
        context: context,
        apiFunction: (dio) => StaffAPI(dio).getList(const Request()),
        onSuccess: (response) {
          final items = (response.data.data as List<dynamic>)
              .map(
                (item) => Ticket(
                  id: item['code'],
                  timeIn: DateTime.now(),
                  siteId: 'EBST',
                  type: vehicleTypes.first,
                ),
              )
              .toList();
          emit(
            items.isEmpty
                ? const HomeTicketState.empty()
                : HomeTicketState.loaded(items, 0),
          );
        },
        onFailed: (response) => emit(HomeTicketState.failed(response.message)),
      );
    } else {
      emit(const HomeTicketState.initial());
    }
  }

  void refresh(
    BuildContext context,
    void Function() onSuccess,
    void Function() onFailed,
  ) async {
    final List<Ticket> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    emit(HomeTicketState.refreshing(items));
    await ApiHelper.callAPI(
      context: context,
      apiFunction: (dio) => StaffAPI(dio).getList(const Request()),
      onSuccess: (response) {
        final items = (response.data.data as List<dynamic>)
            .map(
              (item) => Ticket(
                id: item['code'],
                timeIn: DateTime.now(),
                siteId: 'EBST',
                type: vehicleTypes.first,
              ),
            )
            .toList();
        onSuccess();
        emit(
          items.isEmpty
              ? const HomeTicketState.empty()
              : HomeTicketState.loaded(items, 0),
        );
      },
      onFailed: (response) {
        onFailed();
        emit(HomeTicketState.failed(response.message));
      },
    );
  }

  void loadMore(
    BuildContext context,
    void Function() onSuccess,
    void Function() onFailed,
    void Function() onEmpty,
  ) async {
    final List<Ticket> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex,
      orElse: () => 1,
    );
    emit(HomeTicketState.loadingMore(items));
    await ApiHelper.callAPI(
      context: context,
      apiFunction: (dio) => StaffAPI(dio).getList(Request(page: pageIndex)),
      onSuccess: (response) {
        final List<Ticket> newItems = (response.data.data as List<dynamic>)
            .map(
              (item) => Ticket(
                id: item['code'],
                timeIn: DateTime.now(),
                siteId: 'EBST',
                type: vehicleTypes.first,
              ),
            )
            .toList();
        items.addAll(newItems);
        if (newItems.isEmpty) {
          onEmpty();
        } else {
          onSuccess();
        }
        emit(HomeTicketState.loaded(items, pageIndex));
      },
      onFailed: (response) {
        onFailed();
        emit(HomeTicketState.failed(response.message));
      },
    );
  }
}
