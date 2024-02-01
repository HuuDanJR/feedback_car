import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feedback_driver/classes/language_constant.dart';
import 'package:feedback_driver/welcome.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
      debugPrint(locale.languageCode);
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      {
        setLocale(locale);
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: Locale(),
      locale: _locale,
      // localeListResolutionCallback: (locales, supportedLocales) {
      //   print('device locales=$locales supported locales=$supportedLocales');
      //   for (Locale locale in locales!) {
      //     if (supportedLocales.contains(locale)) {
      //       return locale;
      //     }
      //   }
      //   return Locale('id', 'ID');
      // },
      //localization
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Feedback Driver',
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
      home: const WelcomePage(),

      // home:Scaffold(
      //   body:Container(
      //     child: Text(
      //         translation(context).personalInformation,
      //         textAlign: TextAlign.center,
      //         style: const TextStyle(
      //           fontSize: 30,
      //           fontWeight: FontWeight.bold,
      //         ),
      //   )
      // ))
      // home:ManagePage()
      // home: MyHomePage(title: 'homepage',selectedIndex: 2,),
      // home: const MyHomePage2(title: 'Tournament Client'),

      // home:ResultPage(rating: 4,driver:"Steven",id_feedback: '1416d441',)
      // home:WelcomePage()
    );
  }
}
