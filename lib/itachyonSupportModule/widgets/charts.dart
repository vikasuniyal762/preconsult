import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/chartController.dart';import 'package:medongosupport/itachyonSupportModule/widgets/widgetsCharts/indicator.dart';
import 'package:mrx_charts/mrx_charts.dart';


///PIE CHART FOR LAST THIRTY DAYS
class PieChartForLastThirtyDaysData extends StatefulWidget {
  const PieChartForLastThirtyDaysData({super.key});

  @override
  State<StatefulWidget> createState() => PieChartForLastThirtyDaysDataState();
}

class PieChartForLastThirtyDaysDataState extends State {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AspectRatio(
        aspectRatio: 1.6,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const Row(
              children:  [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Latest month tickets',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: PieChart(
                      PieChartData(
                        borderData: FlBorderData(
                          show: true,
                        ),
                        sectionsSpace: 3,
                        centerSpaceRadius: 35,
                        sections: showingSections(),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Indicator(
                      color: AppColor.primaryColor,
                      text: 'Pending',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: AppColor.secondaryColorAlt,
                      text: 'In-Progress',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: AppColor.tertiaryColor,
                      text: 'Closed',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(chartController.allTicketsCharts!.length , (i) {
      final isTouched = i == chartController.touchedIndex.value;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];




      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColor.primaryColor,
            value: chartController.pendingTickets?.length.toDouble() ?? 0.0,
            title: '${chartController.pendingTickets?.length ?? 0}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );

        case 1:
          return PieChartSectionData(
            color: AppColor.secondaryColorAlt,
            value: chartController.inProgressTickets?.length.toDouble() ??
                0.0,
            title: '${chartController.inProgressTickets?.length ?? 0}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );

        case 2:
          return PieChartSectionData(
            color: AppColor.tertiaryColor,
            value:
                chartController.closedTickets?.length.toDouble() ?? 0.0,
            title: '${chartController.closedTickets?.length ?? 0}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        default:
          return PieChartSectionData(
            color: AppColor.tertiaryColor,
            value: 0,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
      }
    });
  }
}


///BAR CHART LATEST WEEK
class BarChartLatestWeek extends StatefulWidget {
  BarChartLatestWeek({super.key});

  List<Color> get availableColors => const <Color>[
        AppColors.contentColorPurple,
        AppColors.contentColorYellow,
        AppColors.contentColorBlue,
        AppColors.contentColorOrange,
        AppColors.contentColorPink,
        AppColors.contentColorRed,
      ];

  final Color barBackgroundColor = AppColors.contentColorWhite.withOpacity(0.3);
  final Color barColor = AppColors.contentColorWhite;
  final Color touchedBarColor = AppColor.primaryColorAccent;

  @override
  State<StatefulWidget> createState() => BarChartLatestWeekState();
}

class BarChartLatestWeekState extends State<BarChartLatestWeek> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Latest week tickets',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: BarChart(
                      mainBarData(),
                      swapAnimationDuration: animDuration,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    barColor ??= AppColor.primaryColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: widget.touchedBarColor)
              : const BorderSide(color: Colors.black, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
              show: true, toY: 20, color: AppColor.tertiaryColor),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: AppColor.secondaryColorAlt,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case DateTime.monday:
                weekDay = 'Monday';
                break;
              case DateTime.tuesday:
                weekDay = 'Tuesday';
                break;
              case DateTime.wednesday:
                weekDay = 'Wednesday';
                break;
              case DateTime.thursday:
                weekDay = 'Thursday';
                break;
              case DateTime.friday:
                weekDay = 'Friday';
                break;
              case DateTime.saturday:
                weekDay = 'Saturday';
                break;
              case DateTime.sunday:
                weekDay = 'Sunday';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: const TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
                1, chartController.ticketsMonday?.length.toDouble() ?? 0.0,
                isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(
                2, chartController.ticketsTuesday?.length.toDouble() ?? 0.0,
                isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(
                3, chartController.ticketsWednesday?.length.toDouble() ?? 0.0,
                isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(
                4, chartController.ticketsThursday?.length.toDouble() ?? 0.0,
                isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(
                5, chartController.ticketsFriday?.length.toDouble() ?? 0.0,
                isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(
                6, chartController.ticketsSaturday?.length.toDouble() ?? 0.0,
                isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(
                7, chartController.ticketsSunday?.length.toDouble() ?? 0.0,
                isTouched: i == touchedIndex);

          default:
            return throw Error();
        }
      });

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColor.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    Widget text;

    switch (value.toInt()) {
      case DateTime.monday:
        text = const Text('Mo', style: style);
        break;
      case DateTime.tuesday:
        text = const Text('Tu', style: style);
        break;
      case DateTime.wednesday:
        text = const Text('We', style: style);
        break;
      case DateTime.thursday:
        text = const Text('Th', style: style);
        break;
      case DateTime.friday:
        text = const Text('Fr', style: style);
        break;
      case DateTime.saturday:
        text = const Text('Sa', style: style);
        break;
      case DateTime.sunday:
        text = const Text('Su', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}
