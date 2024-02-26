import 'package:flutter/material.dart';



class HomeMenuItems {
  List orderItemList = [
    {
      "title": "New Order",
      "icon": Icons.shopping_basket_rounded,
      //"page": SalesUnitScreen(),
    },
    {
      "title": "Saved Order",
      "icon": Icons.save_alt_rounded,
      //"page": "/",
    },
    {
      "title": "Order Report",
      "icon": Icons.record_voice_over_rounded,
      //"page": "/",
    },
  ];

  List tour = [
    {
      "title": "Tour plan",
      "icon": Icons.tour_rounded,
      //"page": "/",
    },
    {
      "title": "Tour Activity",
      "icon": Icons.local_activity_rounded,
      //"page": "/",
    },
    {
      "title": "Tour Report",
      "icon": Icons.report,
      //"page": "/",
    },
  ];
  List others = [
      {
      "title": "Sales Forecast",
      "icon": Icons.sell_rounded,
      // "page": AttendenceScreen(),
    },
      {
      "title": "Customer Visit",
      "icon": Icons.tour,
      // "page": AttendenceScreen(),
    },
    {
      "title": "Attendence",
      "icon": Icons.present_to_all_rounded,
     // "page": AttendenceScreen(),
    },
  ];
}
