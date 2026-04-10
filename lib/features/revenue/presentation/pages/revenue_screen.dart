import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_animation.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';
import 'package:zupa/features/revenue/presentation/bloc/list/revenue_list_cubit.dart';
import 'package:zupa/features/revenue/presentation/models/revenue_form.dart';

@RoutePage()
class RevenueScreen extends StatelessWidget {
  const RevenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RevenueListCubit>(),
      child: const RevenueView(),
    );
  }
}

class RevenueView extends StatelessWidget {
  const RevenueView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);

    return AppScreen(
      isChildScrollable: true,
      hasParentView: true,
      title: t.parking.revenue,
      appBarTrailing: [
        IconButton(
          onPressed: () => context.pushRoute(const RevenueDetailRoute()),
          icon: const Icon(Symbols.list_alt_rounded),
          tooltip: t.common.actions.viewDetails,
        ),
      ],
      child: BlocBuilder<RevenueListCubit, RevenueListState>(
        builder: (context, state) {
          final items = state.maybeWhen(
            loaded: (tickets, _) => tickets,
            refreshing: (tickets, _) => tickets,
            loadingMore: (tickets, _) => tickets,
            orElse: () => <DailyRevenueEntity>[],
          );

          final bool isLoading = state is Loading;
          final int totalRevenue = items.fold(
            0,
            (sum, item) => sum + item.totalRevenue,
          );
          final int totalPass = items.fold(
            0,
            (sum, item) => sum + item.totalPass,
          );

          return RevenueFormBuilder(
            builder: (context, formModel, _) {
              return Skeletonizer(
                enabled: isLoading,
                child: Padding(
                  padding: const .symmetric(vertical: 24, horizontal: 36),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            t.parking.revenue,
                            style: AppTextStyles.titleLargeBold.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          IconButton.filledTonal(
                            color: colorScheme.primary,
                            onPressed: () =>
                                context.pushRoute(const RevenueDetailRoute()),
                            icon: const Icon(Icons.arrow_forward_rounded),
                          ),
                        ],
                      ).animateIn(
                        key: const ValueKey('revenue_header'),
                        animate: isLoading,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        spacing: 16,
                        children: [
                          Expanded(
                            child: _SummaryCard(
                              title: t.parking.revenue,
                              value: NumberFormat.currency(
                                locale: 'vi_VN',
                                symbol: 'đ',
                                decimalDigits: 0,
                              ).format(totalRevenue),
                              icon: Symbols.account_balance_wallet_rounded,
                              color: colorScheme.primary,
                            ),
                          ),
                          Expanded(
                            child: _SummaryCard(
                              title: t.vehicles.type,
                              value: totalPass.toString(),
                              icon: Symbols.directions_car_rounded,
                              color: colorScheme.secondary,
                            ),
                          ),
                        ],
                      ).animateIn(
                        key: const ValueKey('revenue_summary'),
                        animate: isLoading,
                        index: 1,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        t.home.statistic,
                        style: AppTextStyles.titleLargeBold.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ).animateIn(
                        key: const ValueKey('revenue_statistic'),
                        animate: isLoading,
                        index: 2,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 300,
                        child: items.isEmpty && !isLoading
                            ? const _EmptyRevenueState()
                            : _RevenueChart(items: items),
                      ).animateIn(
                        key: const ValueKey('revenue_chart'),
                        animate: isLoading,
                        index: 3,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _EmptyRevenueState extends StatelessWidget {
  const _EmptyRevenueState();

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Container(
            padding: const .all(24),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHigh,
              shape: .circle,
            ),
            child: Icon(
              Symbols.analytics_rounded,
              size: 64,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            t.common.errors.noData_search,
            style: AppTextStyles.bodyLargeBold.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            t.common.refresh.dragText,
            style: AppTextStyles.bodyMedium.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              context.read<RevenueListCubit>().init(
                filter:
                    ReactiveRevenueForm.of(context)?.model.toParams() ??
                    .initial(),
              );
            },
            icon: const Icon(Symbols.refresh_rounded),

            label: Text(t.common.actions.reload),
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.secondaryContainer,
              foregroundColor: colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    return Container(
      padding: const .all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: .circular(28),
        border: .all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.titleLargeBold.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}

class _RevenueChart extends StatelessWidget {
  final List<DailyRevenueEntity> items;

  const _RevenueChart({required this.items});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);

    if (items.isEmpty) return const SizedBox.shrink();

    final chartItems = items.reversed.take(7).toList().reversed.toList();

    return BarChart(
      BarChartData(
        alignment: .spaceAround,
        maxY:
            chartItems.fold(
              0.0,
              (max, e) =>
                  e.totalRevenue > max ? e.totalRevenue.toDouble() : max,
            ) *
            1.2,
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (group) => colorScheme.secondaryContainer,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                NumberFormat.compact().format(rod.toY),
                TextStyle(
                  color: colorScheme.onSecondaryContainer,
                  fontWeight: .bold,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= 0 && value.toInt() < chartItems.length) {
                  return Padding(
                    padding: const .only(top: 8.0),
                    child: Text(
                      DateFormat(
                        'dd/MM',
                      ).format(chartItems[value.toInt()].date),
                      style: AppTextStyles.bodyLarge,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
              reservedSize: 30,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  NumberFormat.compact().format(value),
                  style: AppTextStyles.bodyLarge,
                );
              },
            ),
          ),
          topTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(chartItems.length, (i) {
          return BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: chartItems[i].totalRevenue.toDouble(),
                color: colorScheme.primary,
                width: 16,
                borderRadius: const .vertical(top: .circular(4)),
              ),
            ],
          );
        }),
      ),
    );
  }
}
