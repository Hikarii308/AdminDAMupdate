import 'package:admin/profile/personaldetails.dart';
import 'package:admin/profile/profile.dart';
import 'package:admin/screens/dashboard/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
   //MATNSSAYCH TBDLI LHOME PATH
      home: AdminDashboard(),
  //home: PersonalDetails(),
    );
  }
}

