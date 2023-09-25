import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tournament_client/home.dart';
import 'package:tournament_client/lib/screens/result_page.dart';
import 'package:tournament_client/manage.dart';
import 'package:tournament_client/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Feedback Car Client',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: false,
          fontFamily: GoogleFonts.lato().fontFamily,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        // home: MyHomePage2(title: 'text',),
        // home: BarCharRace(),
        // home:ManagePage()
        home:WelcomePage()
        // home:ManagePage()
        // home: MyHomePage(title: 'homepage',selectedIndex: 2,),
        // home: const MyHomePage2(title: 'Tournament Client'),
        
        // home:ResultPage(rating: 4,driver:"Steven",id_feedback: '1416d441',)
        // home:WelcomePage()
        );
  }
}
