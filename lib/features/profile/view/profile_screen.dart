

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mendeleev_app/components/consts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mendeleev_app/components/window_props.dart';
import 'package:mendeleev_app/core/providers/l10n_provider.dart';
import 'package:mendeleev_app/core/providers/score_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final locations = ['RU', 'EN'];

  late final provider = Provider.of<ScoreProvider>(context, listen: true);

  // late final int guessPercent;
  // late final int viewedCount;
  //late final int lvl;

  // @override
  // void initState() {
  //   super.initState();
  //   initStatisctic();
  // }

  // void initStatisctic() {
  //   final p = Provider.of<ScoreProvider>(context, listen: false);
  //   viewedCount = p.viewed;
  //   guessPercent = 0;
  //   print("${p.guessed}  ${p.viewed}");
  //   guessPercent = ((100*p.guessed)/viewedCount).round();

  //   // if (viewedCount) {

  //   // }
  // }

  int getLvl() {
    final percent = getPercent();

    if (provider.viewed < 20) {
      return 0;
    }

    switch (percent) {
      case <=20:
        return 1;
      case <=40:
        return 2;
      case <=60:
        return 3;
      case <=80:
        return 4;
      case <100:
        return 5;
      default:
        return 6;
    }
  }

  int getPercent() {
    final viewedCount = provider.viewed;
    try {
      final guessPercent = ((100*provider.guessed)~/viewedCount).round();
      return guessPercent;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    String selectedLocale = Provider.of<LocaleProvider>(context).locale.toUpperCase();
    return SafeArea(
      child: Scaffold(
        backgroundColor: kGrey2,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Provider.of<LocaleProvider>(context, listen: false).changeLocale();
                    setState(() {
                      selectedLocale = Provider.of<LocaleProvider>(context, listen: false).locale.toUpperCase();
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(
                      right: 20,
                      top: 20
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black54,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color.fromARGB(255, 81, 96, 88)
                        )
                      ]
                    ),
                    child: Center(
                      child: Text(
                        selectedLocale == 'RU' 
                        ? '🇷🇺'
                        : '🇺🇸',
                        style: const TextStyle(fontSize: 20),),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: deviceWidth*0.45,
              width: deviceWidth*0.45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kGreen,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    //color: kGreen,
                    blurRadius: 20
                  )
                ],
                image: DecorationImage(
                  image: Image.asset("assets/mendeleev.jpg").image
                )
              ),
            ),
            const SizedBox(height: 25,),
            Text(
              AppLocalizations.of(context)!.mendeleev,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            Visibility(
              visible: provider.viewed >=20,
              child: Text(
                "lvl ${getLvl()}",
                style: const TextStyle(fontSize: 26),
              ),
            ),
            Visibility(
              visible: provider.viewed <20,
              child: Text(
                "${AppLocalizations.of(context)!.kalibrovka} ${provider.viewed}/20",
                style: const TextStyle(fontSize: 16, color: Colors.amber),
              ),
            ),
            const Spacer(),
            Text(
              "${AppLocalizations.of(context)!.percents} ${getPercent()}%",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Provider.of<ScoreProvider>(context, listen: false).clear();
              },
              // style: const ButtonStyle(
              //   textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white))
              // ),
              child: Container(
                width: deviceWidth*0.8,
                height: 70,
                margin: const EdgeInsets.only(
                  bottom: 35
                ),
                decoration: BoxDecoration(
                  color: kGrey1,
                  borderRadius: BorderRadius.circular(90),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(205, 0, 0, 0),
                      offset: Offset(0, 5),
                      blurRadius: 5,
                      //blurStyle: BlurStyle.outer
                    )
                  ],
                ),
                child: Center(
                  child: Text(AppLocalizations.of(context)!.reset, style: const TextStyle(fontSize: 20,),)
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}