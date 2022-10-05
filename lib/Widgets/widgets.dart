// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:pet_app/Model/BottombarModel.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    List<BottomBarModel> bottomBar = [
      BottomBarModel(icon: const Icon(Icons.home), isSelected: false, id: 1),
      BottomBarModel(icon: const Icon(Icons.home), isSelected: false, id: 2),
      BottomBarModel(icon: const Icon(Icons.home), isSelected: false, id: 3),
      BottomBarModel(icon: const Icon(Icons.home), isSelected: false, id: 4),
    ];

    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.085,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: bottomBar.length,
          itemBuilder: ((context, index) {
            return Card(
              elevation: 2,
              child: Container(
                width: bottomBar[index].isSelected ? 100 : 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Builder(builder: (context) {
                  return IconButton(
                    onPressed: () {
                      print("i am pressed");
                      bottomBar.where((element) => !element.isSelected);
                      setState(() {});
                    },
                    icon: bottomBar[index].icon,
                    color: bottomBar[index].isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.black38,
                  );
                }),
              ),
            );
          })),
    );
  }
}

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 14),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 4),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
      ),
    ),
  );
}
