import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {

  final myKey = GlobalKey<DropdownSearchState<MultiLevelString>>();
  final List<MultiLevelString> myItems = [
    MultiLevelString(level1: "1"),
    MultiLevelString(level1: "2"),
    MultiLevelString(
      level1: "3",
      subLevel: [
        MultiLevelString(level1: "sub3-1"),
        MultiLevelString(level1: "sub3-2"),
      ],
    ),
    MultiLevelString(level1: "4")
  ];

   SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Page'),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(8),
        child: DropdownSearch<MultiLevelString>(
          key: myKey,
          items: myItems,
          compareFn: (i1, i2) => i1.level1 == i2.level1,
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            interceptCallBacks: true,
            itemBuilder: (ctx, item, isSelected) {
              return ListTile(
                selected: isSelected,
                title: Text(item.level1),
                trailing: item.subLevel.isEmpty
                    ? null
                    : (item.isExpanded
                    ? IconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    item.isExpanded = !item.isExpanded;
                    myKey.currentState?.updatePopupState();
                  },
                )
                    : IconButton(
                  icon: const Icon(Icons.arrow_right),
                  onPressed: () {
                    item.isExpanded = !item.isExpanded;
                    myKey.currentState?.updatePopupState();
                  },
                )),

                subtitle: item.subLevel.isNotEmpty && item.isExpanded
                    ? Container(
                  height: item.subLevel.length * 50,
                  child: ListView(
                    children: item.subLevel
                        .map(
                          (e) => ListTile(
                        selected: myKey.currentState?.getSelectedItem
                            ?.level1 ==
                            e.level1,
                        title: Text(e.level1),
                        onTap: () {
                          myKey.currentState?.popupValidate([e]);
                        },
                      ),
                    )
                        .toList(),
                  ),
                )
                    : null,
                onTap: () => myKey.currentState?.popupValidate([item]),
              );
            },
          ),

        ),
      ),
    );
  }
}

class MultiLevelString {
  final String level1;
  final List<MultiLevelString> subLevel;
  bool isExpanded;

  MultiLevelString({
    this.level1 = "",
    this.subLevel = const [],
    this.isExpanded = false,
  });

  MultiLevelString copy({
    String? level1,
    List<MultiLevelString>? subLevel,
    bool? isExpanded,
  }) =>
      MultiLevelString(
        level1: level1 ?? this.level1,
        subLevel: subLevel ?? this.subLevel,
        isExpanded: isExpanded ?? this.isExpanded,
      );

  @override
  String toString() => level1;
}


