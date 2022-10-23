import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String? dropDownValue;

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    return dropDownButton();
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> dropDownButton() {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("allCategory").snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return DropdownButtonFormField(
              hint: dropDownValue == null
                  ? const Text("select category")
                  : Text(dropDownValue!),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
              ),
              items: snapshot.data!.docs.map(
                (val) {
                  return DropdownMenuItem(
                    value: val["CategoryName"],
                    child: Text(val["CategoryName"]),
                  );
                },
              ).toList(),
              onChanged: (val) {
                setState(
                  () {
                    dropDownValue = val.toString();
                  },
                );
              },
            );
          }
          return const SizedBox(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
