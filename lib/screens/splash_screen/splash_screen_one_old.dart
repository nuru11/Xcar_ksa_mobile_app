import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maanstore/const/constants.dart';
import 'package:maanstore/generated/l10n.dart' as lang;
// import 'package:maanstore/language_screen_starting.dart';
import 'package:maanstore/screens/home_screens/home.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../Providers/all_repo_providers.dart';
// import '../../const/hardcoded_text.dart';
import '../../models/purchase_model.dart';

class SplashScreenOne extends StatefulWidget {
  const SplashScreenOne({Key? key}) : super(key: key);

  @override
  State<SplashScreenOne> createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
  Future<void> pageNavigation() async {
    final prefs = await SharedPreferences.getInstance();
    final int? customerId = prefs.getInt('customerId');
    isRtl = prefs.getBool('isRtl') ?? false;
    await Future.delayed(
      const Duration(seconds: 1),
    );
    bool isValid = await PurchaseModel().isActiveBuyer();
    if(isValid){
      if (customerId != null) {
        if (!mounted) return;
        const Home().launch(context, isNewTask: true);
      } else {
        if (!mounted) return;
        // const LanguageScreenTwo().launch(context, isNewTask: true);
        const Home().launch(context, isNewTask: true);
      }
    } else{
      showLicense(context: context);
    }

  }

  @override
  void initState() {
    pageNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Color(0xFFF7F7F7),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: size.height / 3),
          Container(
  height: 310,
  width: 510,
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
                    // lang.S.of(context).splashScreenOneAppName,
                    "Welcome to Xcars_KSA",
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(color: Color(0xFFF57328), fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Text(
                  // lang.S.of(context).PoweredBYAddisway,
                  //   style: GoogleFonts.dmSans(
                  //     textStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                  //   ),
                  // ),
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
