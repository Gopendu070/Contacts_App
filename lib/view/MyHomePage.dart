import 'package:contacts_app/model/ContactList.dart';
import 'package:contacts_app/view/widgets/ContactTileWidget.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSearchTapped = false;
  String query = "";
  TextEditingController searchController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        width: 210,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              // ignore: sort_child_properties_last
              child: Center(
                child: Icon(
                  Icons.account_circle,
                  color: Colors.grey[800],
                  size: 100,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            _listOfDrawerItems()
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.sort));
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey[100],
        onPressed: () {
          print(ContactList.contacts.length);
          print(Width);
        },
        child: const Icon(
          Icons.dialpad,
          color: Color.fromARGB(245, 80, 80, 80),
          size: 40,
        ),
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        height: 55,
        elevation: 2,
        backgroundColor: Colors.blueGrey[400],
        initialActiveIndex: 1,
        {},
        items: [
          TabItem(icon: Icons.message, title: ''),
          TabItem(icon: Icons.home, title: ''),
          TabItem(icon: Icons.call, title: ''),
        ],
        onTap: (int i) => print('click index=$i'),
      ),
      body: Padding(
        padding: EdgeInsets.all(7),
        child: Column(
          children: [
            Container(
              width: Width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 55,
                    child: isSearchTapped
                        ? TextFormField(
                            onChanged: (value) {
                              query = value;
                              setState(() {});
                              print(searchController.text);
                            },
                            controller: searchController,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        searchController.clear();
                                        query = "";
                                      });
                                    },
                                    icon: Icon(Icons.clear)),
                                hintText: "  Search Contacts",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50))),
                          )
                        : query == ""
                            ? Padding(
                                padding: EdgeInsets.only(top: 7),
                                child: Text(
                                  " Recent Calls",
                                  style: TextStyle(fontSize: 23),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(top: 7),
                                child: Text(
                                  "Search result for '$query'",
                                  style: TextStyle(fontSize: 23),
                                ),
                              ),
                  )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isSearchTapped = !isSearchTapped;
                        });
                      },
                      icon: isSearchTapped
                          ? Icon(Icons.cancel_outlined)
                          : Icon(Icons.search))
                ],
              ),
            ),
            isSearchTapped
                ? SizedBox(
                    height: 2,
                  )
                : Container(),
            Divider(thickness: 1),
            Expanded(
              child: ListView.builder(
                itemCount: ContactList.contacts.length,
                itemBuilder: (context, index) {
                  if (query == "") {
                    return ContactTile(index: index);
                  } else if (query != "" &&
                      ContactList.contacts[index]["name"]!
                          .toLowerCase()
                          .contains(query.toLowerCase())) {
                    return ContactTile(index: index);
                  } else {
                    return Container();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _listOfDrawerItems() {
    return Column(
      children: [
        ListTile(
          tileColor: Color.fromARGB(45, 113, 136, 148),
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.contact_mail),
          title: Text('Contact'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
