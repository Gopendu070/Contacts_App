import 'package:contacts_app/model/ContactList.dart';
import 'package:contacts_app/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogBox extends StatelessWidget {
  int index;
  DialogBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: AssetImage("lib/asset/images/${index + 1}.jpeg"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 5),
            Text(
              ContactList.contacts[index]["name"].toString(),
              style: utils.nameStyle.copyWith(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Call button
          InkWell(
            onTap: () {
              Fluttertoast.showToast(
                  backgroundColor: Colors.green,
                  msg:
                      "Calling ${ContactList.contacts[index]["name"].toString()}");
              Navigator.pop(context);
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Icon(
                  Icons.call,
                  color: Colors.white70,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
          //Cancel Button
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  "X",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                      fontWeight: FontWeight.w600),
                )),
          ),
        ],
      ),
    );
  }
}
