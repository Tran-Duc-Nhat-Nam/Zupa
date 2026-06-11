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
import 'package:zupa/features/revenue/presentation/bloc/revenue_cubit.dart';
import 'package:zupa/features/revenue/presentation/models/revenue_form.dart';

@RoutePage()
class RevenueScreen extends StatelessWidget {
  const RevenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return BlocProvider(
      create: (context) => getIt<RevenueCubit>(),
      child: AppScreen(
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
        child: BlocBuilder<RevenueCubit, RevenueState>(
          builder: (context, state) => RevenueFormBuilder(
            model: .fromParams(.initial()),
            builder: (context, _, _) => Skeletonizer(
              enabled: state.isLoading,
              child: Padding(
                padding: const .symmetric(horizontal: 36),
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
                      animate: state.isLoading,
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
                            ).format(state.items.totalRevenue),
                            icon: Symbols.account_balance_wallet_rounded,
                            color: colorScheme.primary,
                          ),
                        ),
                        Expanded(
                          child: _SummaryCard(
                            title: t.vehicles.type,
                            value: state.items.totalPass.toString(),
                            icon: Symbols.directions_car_rounded,
                            color: colorScheme.secondary,
                          ),
                        ),
                      ],
                    ).animateIn(
                      key: const ValueKey('revenue_summary'),
                      animate: state.isLoading,
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
                      animate: state.isLoading,
                      index: 2,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 300,
                      child: state.items.isEmpty && !state.isLoading
                          ? const _EmptyRevenueState()
                          : _RevenueChart(items: state.items),
                    ).animateIn(
                      key: const ValueKey('revenue_chart'),
                      animate: state.isLoading,
                      index: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyRevenueState extends StatelessWidget {
  const _EmptyRevenueState();

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

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
              context.read<RevenueCubit>().init(
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
    final colorScheme = context.colorScheme;
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
    final colorScheme = context.colorScheme;

    if (items.isEmpty) return const SizedBox.shrink();

    final chartItems = items.reversed.take(7).toList().reversed.toList();

    return RepaintBoundary(
      child: BarChart(
        .new(
          alignment: .spaceAround,
          maxY:
              chartItems.fold(
                0.0,
                (max, e) =>
                    e.totalRevenue > max ? e.totalRevenue.toDouble() : max,
              ) *
              1.2,
          barTouchData: .new(
            enabled: true,
            touchTooltipData: .new(
              getTooltipColor: (group) => colorScheme.secondaryContainer,
              getTooltipItem: (group, groupIndex, rod, rodIndex) => .new(
                NumberFormat.compact().format(rod.toY),
                TextStyle(
                  color: colorScheme.onSecondaryContainer,
                  fontWeight: .bold,
                ),
              ),
            ),
          ),
          titlesData: .new(
            bottomTitles: .new(
              sideTitles: .new(
                showTitles: true,
                getTitlesWidget: (value, meta) =>
                    value.toInt() >= 0 && value.toInt() < chartItems.length
                    ? Padding(
                        padding: const .only(top: 8.0),
                        child: Text(
                          DateFormat(
                            'dd/MM',
                          ).format(chartItems[value.toInt()].date),
                          style: AppTextStyles.bodyLarge,
                        ),
                      )
                    : const SizedBox.shrink(),
                reservedSize: 30,
              ),
            ),
            leftTitles: .new(
              sideTitles: .new(
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
            topTitles: const .new(),
            rightTitles: const .new(),
          ),
          gridData: const .new(show: false),
          borderData: .new(show: false),
          barGroups: List.generate(chartItems.length, (i) {
            return .new(
              x: i,
              barRods: [
                .new(
                  toY: chartItems[i].totalRevenue.toDouble(),
                  color: colorScheme.primary,
                  width: 16,
                  borderRadius: const .vertical(top: .circular(4)),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
