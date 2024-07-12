import 'dart:ffi';

import 'package:contacts_app/model/ContactList.dart';
import 'package:contacts_app/utils/Utils.dart';
import 'package:contacts_app/view/widgets/DialogBox.dart';
import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  ContactTile({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    void _showDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogBox(index: index);
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.5),
      child: InkWell(
        onTap: () {
          _showDialog(context);
        },
        child: Container(
          height: (Width < 650 ? (Width * 0.25) : (Width * 0.189)),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Color.fromARGB(142, 244, 243, 243)],
            ),
            //border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            children: [
              Container(
                width: Width < 650 ? (Width * 0.25) : (Width * 0.18),
                // height: Width * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(270),
                  image: DecorationImage(
                    image: AssetImage(
                      "lib/asset/images/${index + 1}.jpeg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ContactList.contacts[index]["name"].toString(),
                              style: utils.nameStyle,
                            ),
                            Text(
                              ContactList.contacts[index]["phone"].toString(),
                              style: utils.phoneStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ContactList.contacts[index]["status"].toString() ==
                                    "in"
                                ? Icon(
                                    Icons.call_received,
                                    color: Colors.greenAccent,
                                  )
                                : Icon(
                                    Icons.call_made_rounded,
                                    color: Colors.redAccent,
                                  ),
                            SizedBox(width: 4),
                            Text(
                              ContactList.contacts[index]["time"].toString(),
                              style: utils.statusStyle,
                            ),
                            SizedBox(width: 5),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
