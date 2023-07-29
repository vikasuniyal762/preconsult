import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medongosupport/preConsultModule/consts/appColors.dart';
import 'package:medongosupport/preConsultModule/controllers/questionsController.dart';
import 'package:medongosupport/preConsultModule/widgets/appBars.dart';

class MultiOptionsBottomSheet extends StatefulWidget {
  final List<String> items;
  final List<String> selectedItems;
  final Function(List<String>) onSave;

  MultiOptionsBottomSheet({
    required this.items,
    required this.selectedItems,
    required this.onSave,
  });

  @override
  _MultiOptionsBottomSheetState createState() => _MultiOptionsBottomSheetState();
}

class _MultiOptionsBottomSheetState extends State<MultiOptionsBottomSheet> {
  late List<bool> isClicked;

  @override
  void initState() {
    super.initState();
    isClicked = List<bool>.filled(widget.items.length, false);

    for (String selectedItem in widget.selectedItems) {
      int index = widget.items.indexOf(selectedItem);
      if (index != -1) {
        isClicked[index] = true;
      }
    }
  }

  void saveSelectedItems() {
    List<String> selectedItems = [];
    for (int i = 0; i < widget.items.length; i++) {
      if (isClicked[i]) {
        selectedItems.add(widget.items[i]);
      }
    }
    widget.onSave(selectedItems);
    //questionsController.updateListToStringForMultiOptions(selectedOptions: selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: titleAppBar(
        context: context,
        title: "SELECT OPTIONS",
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.cancel,
            color: AppColor.white,
            size: 24,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {
                saveSelectedItems(); // Save selected items
                Get.back();
              },
              icon: const Icon(
                Icons.check_circle,
                color: AppColor.white,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60.0),
              ),
              title: Text(widget.items[index]),
              tileColor: isClicked[index] ? AppColor.primaryColor.withOpacity(0.4) : AppColor.white,
              onTap: () {
                setState(() {
                  isClicked[index] = !isClicked[index];
                });
              },
              trailing: Checkbox(
                checkColor: AppColor.white,
                focusColor: AppColor.primaryColor,
                splashRadius: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.0),
                ),
                value: isClicked[index],
                onChanged: (value) {
                  setState(() {
                    isClicked[index] = value!;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}