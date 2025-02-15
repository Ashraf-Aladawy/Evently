import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/firebase_functions.dart';
import 'package:evently_app/items/event_item.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:evently_app/provider/my_provider.dart';
import 'package:evently_app/screens/create_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  var provider;
  bool langMood = false;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: _AppBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateEventScreen.routeName);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75),
            side: BorderSide(
              color: Colors.white,
              width: 5,
            )),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        onTap: (value) {
          provider.changeBarItems(value);
        },
        items: [
          _bottomBarItem("Home", 0),
          _bottomBarItem("Map", 1),
          _bottomBarItem("Love", 2),
          _bottomBarItem("Profile", 3),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<TaskModel>>(
        stream: FirebaseFunctions.getEvents(provider.category),
        builder: (context, snapshot) {
          return ListView.builder(
            itemBuilder: (context, index) =>
                EventItem(model: snapshot.data!.docs[index].data()),
            itemCount: snapshot.data?.docs.length ?? 0,
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _bottomBarItem(String lable, int index) {
    return provider.currentIndex == index
        ? BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/${lable}_filled.png")),
            label: "$lable")
        : BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/${lable}.png")),
            label: "$lable");
  }

  PreferredSizeWidget _AppBar(context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      toolbarHeight: 174,
      centerTitle: false,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Welcome Back ✨",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Row(
            children: [
              Text(
                "John Safwat",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 24),
              ),
              Spacer(),
              InkWell(
                  onTap: () {
                    provider.changeTheme();
                  },
                  child: Image.asset("assets/images/Sun.png")),
              InkWell(
                onTap: () {
                  langMood = !langMood;
                  if (langMood == false) {
                    context.setLocale(Locale("en"));
                  } else {
                    context.setLocale(Locale("ar"));
                  }
                },
                child: Container(
                  width: 35,
                  height: 33,
                  margin: EdgeInsets.only(left: 10, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                      child: Text(
                    langMood == false ? "EN" : "ع",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14),
                  )),
                ),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
              Text(
                "Cairo , Egypt",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          Container(
            height: 48,
            margin: EdgeInsets.only(top: 25),
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  provider.changeCategory(index);
                },
                child: Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      color: provider.currentcatigor == index
                          ? Colors.white
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(46),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Row(
                    children: [
                      // ImageIcon(
                      //     AssetImage(
                      //         "assets/images/${provider.categories[index]}_icon.png"),
                      //     color: provider.currentcatigor == index
                      //         ? Theme.of(context).primaryColor
                      //         : Colors.white),
                      // SizedBox(
                      //   width: 8,
                      // ),
                      Text("${provider.categories[index]}",
                          style: provider.currentcatigor == index
                              ? Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor)
                              : Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 16)),
                    ],
                  ),
                ),
              ),
              itemCount: provider.categories.length,
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24))),
    );
  }
}
