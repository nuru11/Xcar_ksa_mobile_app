import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maanstore/const/constants.dart';
import 'package:maanstore/generated/l10n.dart' as lang;
import 'package:maanstore/language_screen_starting.dart';
import 'package:maanstore/screens/home_screens/home.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import '../../models/purchase_model.dart';
import '../../Providers/all_repo_providers.dart';


class SplashScreenOne extends StatefulWidget {
  const SplashScreenOne({Key? key}) : super(key: key);

  @override
  State<SplashScreenOne> createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
  bool isRtl = false; // Initialize isRtl

  Future<void> pageNavigation() async {
    final prefs = await SharedPreferences.getInstance();
    final int? customerId = prefs.getInt('customerId');
    isRtl = prefs.getBool('isRtl') ?? false;

    await Future.delayed(const Duration(seconds: 3));

    bool isValid = await PurchaseModel().isActiveBuyer();
    if (isValid) {
      // Check if it's the first visit
      bool isFirstVisit = prefs.getBool('isFirstVisit') ?? true;

      if (isFirstVisit) {
        print(" ${prefs.getBool('isFirstVisit')}  not visit");
        // First visit: navigate to LanguageScreenTwo
        prefs.setBool('isFirstVisit', false); // Set flag for future visits
        // if (!mounted) return;
        const LanguageScreenTwo().launch(context, isNewTask: true);
      } else {
        print(" ${prefs.getBool('isFirstVisit')}   visited");
        // Not first visit: navigate to Home
        if (customerId != null) {
          // if (!mounted) return;
          const Home().launch(context, isNewTask: true);
        } else {
          if (!mounted) return;
          const Home().launch(context, isNewTask: true);
        }
      }
    } else {
      showLicense(context: context);
    }
  }

  @override
  void initState() {
    super.initState();
    pageNavigation();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: size.height / 3),
              Container(
                height: 210,
                width: 210,
                decoration: BoxDecoration(
                  color: Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(180),
                ),
                child: Center(
                  child: ClipOval(
                    child: Image(
                      image: AssetImage('images/xcars.png'),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    lang.S.of(context).splashScreenOneAppName,
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Text(
                    lang.S.of(context).splashScreenOneAppVersion,
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}