import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mendeleev_app/components/consts.dart';
import 'package:mendeleev_app/components/elements.dart';
import 'package:mendeleev_app/features/list/widgets/element_card.dart';
import 'package:mendeleev_app/features/model/element_model.dart';

@RoutePage()
class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  late final List<ElementModel> list= elementsList.map(
    (e) => ElementModel.jromJson(e)
  ).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey2,
      body: GridView.count(
        physics: const BouncingScrollPhysics(),
        //shrinkWrap: true,
        crossAxisCount: 2,
        children: List.generate(list.length, (index) {
          return ElementCard(element: list[index],);
        }),
      )
    );
  }
}