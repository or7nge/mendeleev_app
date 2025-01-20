import 'package:flutter/material.dart';
import 'package:mendeleev_app/components/consts.dart';
import 'package:mendeleev_app/components/window_props.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth*0.8,
      height: deviceHeight*0.5,
      decoration: BoxDecoration(
        color: kGrey1,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.white,
          width: 1
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Column(
              children: [
                Text(AppLocalizations.of(context)!.logic_info,
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}