import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mendeleev_app/components/consts.dart';
import 'package:mendeleev_app/components/elements.dart';
import 'package:mendeleev_app/components/window_props.dart';
import 'package:mendeleev_app/core/providers/score_provider.dart';
import 'package:mendeleev_app/features/logic_test/widgets/back_card.dart';
import 'package:mendeleev_app/features/logic_test/widgets/front_card.dart';
import 'package:mendeleev_app/features/logic_test/widgets/info_dialog.dart';
import 'package:mendeleev_app/features/model/element_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LogicScreen extends StatefulWidget {
  const LogicScreen({super.key});

  @override
  State<LogicScreen> createState() => _LogicScreenState();
}

class _LogicScreenState extends State<LogicScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ElementModel element;
  Timer? _timer;

  bool rotated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    initElement();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initElement() {
    setState(() {
      element = ElementModel.jromJson(
        elementsList[Random().nextInt(elementsList.length)]
      );
    });
  }

  void onGuess() {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 100), () async {
      Provider.of<ScoreProvider>(context, listen: false).onGuess();
      await onNext();
    });
  }

  void onNoGuess() {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 100), () async {
      Provider.of<ScoreProvider>(context, listen: false).onNoGuess();
      await onNext();
    });
  }

  Future<void> onNext() async {
    rotate();
    await Future.delayed(const Duration(milliseconds: 300)).then(
      (_) async {
        initElement();
        setState(() {
          rotated = false;
        });
      }
    );
    
  }

  void rotate() {
    rotated
      ? _controller.reverse()
      : _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: deviceHeight*0.08,
            right: deviceWidth*0.1,
            child: GestureDetector(
              onTap: () {
                showAdaptiveDialog(
                  context: context, 
                  builder:(context) {
                    return const Dialog(
                      child: InfoDialog(),
                    );
                  },
                );
              },
              child: const Icon(Icons.info_outline, color: Colors.white, size: 28,)
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                double angle = _controller.value * pi;
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(angle),
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: _controller.value,
                        child: BackCard(
                          element: element,
                        ),
                      ),
                      Visibility(
                        visible: 1 - _controller.value != 0,
                        child: Opacity(
                          opacity: 1 - _controller.value,
                          child: FrontCard(
                            element: element,
                            onTap: () {
                              if (1 - _controller.value == 0) return;
                              if (!rotated) {
                                rotate();
                                setState(() {
                                  rotated = true;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Visibility(
            visible: rotated,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: onGuess,
                    child: Container(
                      height: 100,
                      width: deviceWidth*0.45,
                      margin: const EdgeInsets.only(
                        bottom: 20
                      ),
                      // padding: const EdgeInsets.symmetric(
                      //   horizontal: 40,
                      //   //vertical: 0
                      // ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kGreen,
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
                        child: Text(AppLocalizations.of(context)!.guess, 
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onNoGuess,
                    child: Container(
                      height: 100,
                      width: deviceWidth*0.45,
                      margin: const EdgeInsets.only(
                        bottom: 20
                      ),
                      // padding: const EdgeInsets.symmetric(
                      //   horizontal: 0,
                      //   //vertical: 0
                      // ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
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
                        child: Text(AppLocalizations.of(context)!.no_guess, 
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: onGuess,
                  //   child: Text(AppLocalizations.of(context)!.guess),
                  // ),
                  // ElevatedButton(
                  //   onPressed: onNoGuess,
                  //   child: Text(AppLocalizations.of(context)!.no_guess),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
