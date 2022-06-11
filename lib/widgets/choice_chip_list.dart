import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

class ChoiceChipList extends StatefulWidget {
  final List<String> list;
  ChoiceChipList(this.list, {Key? key}) : super(key: key);

  @override
  State<ChoiceChipList> createState() => _ChoiceChipListState();
}

class _ChoiceChipListState extends State<ChoiceChipList> {
  late Map<String, bool> choices;
  @override
  void initState() {
    choices = Map.fromIterable(widget.list,
        key: (element) => element, value: (element) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: choices.entries
              .map<Widget>((entry) => Container(
                  margin: EdgeInsets.only(left: 4, right: 4),
                  child: ChoiceChip(
                    avatarBorder: CircleBorder(
                        side: BorderSide(
                            width: 2.0,
                            color: Colors
                                .red)), // TODO: mudar a borda, parece não tá funcionando
                    backgroundColor:
                        entry.value ? Colors.white : Color(0xFF1a1a1a),
                    key: Key(entry.key),
                    label: Text(
                      entry.key,
                      style: TextStyle(
                          color: entry.value ? Colors.black : Colors.white),
                    ),
                    selected: entry.value,
                    onSelected: (isSelected) {
                      choices.forEach((key, value) {
                        choices[key] = false;
                      });

                      choices[entry.key] = isSelected;
                      setState(() {});
                    },
                  )))
              .toList()),
    );
  }
}
