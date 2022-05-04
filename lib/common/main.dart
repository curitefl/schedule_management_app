import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/view/constants/calendar_constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:schedule_management_app/view/view/carendar_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale(CalendarConstants.calendarLocale),
      ],
      title: 'Schedule Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalendarView(),
    );
  }
}
