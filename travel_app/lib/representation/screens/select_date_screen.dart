import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app/core/constant/color_palatte.dart';
import 'package:travel_app/core/constant/dimension_constants.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';

class SelectDateScreen extends StatefulWidget {
 const SelectDateScreen({super.key});

  static const String routeName = '/select_date_screen';

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  DateTime? rangeStartDate;

  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Select date',
      paddingContent: EdgeInsets.all(kMediumPadding),
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding,
          ),

          // Picker Date
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings:
                DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: ColorPalette.yellowColor,
            startRangeSelectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor,
            rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
            todayHighlightColor: ColorPalette.yellowColor,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
              }
            },
          ),

          // Button Select
          ButtonWidget(
              title: 'Select',
              onTap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
              }),

          // height
          SizedBox(
            height: kDefaultPadding,
          ),

          // Button Cancel
          ButtonWidget(
              title: 'Cancel',
              color: ColorPalette.primaryColor.withOpacity(0.1),
              onTap: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}
