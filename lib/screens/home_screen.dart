import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  int currentcatigor = 0;
  List<String> categories = [
    "All",
    "Birthday",
    "Sports",
    "Sports",
    "Sports",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
          currentIndex = value;
          setState(() {});
        },
        items: [
          _bottomBarItem("Home", 0),
          _bottomBarItem("Map", 1),
          _bottomBarItem("Love", 2),
          _bottomBarItem("Profile", 3),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
          child: Container(
            height: 204,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset("assets/images/Holiday.png")),
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(left: 8, top: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "21",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Nov",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 345,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "This is a Birthday Party ",
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      Spacer(),
                      ImageIcon(
                        AssetImage("assets/images/fav_icon.png"),
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        itemCount: 5,
      ),
    );
  }

  BottomNavigationBarItem _bottomBarItem(String lable, int index) {
    return currentIndex == index
        ? BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/${lable}_filled.png")),
            label: "$lable")
        : BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/${lable}.png")),
            label: "$lable");
  }

  PreferredSizeWidget _AppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      toolbarHeight: 225,
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
              Image.asset("assets/images/Sun.png"),
              Container(
                width: 35,
                height: 33,
                margin: EdgeInsets.only(left: 10, right: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: Text(
                  "EN",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14),
                )),
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
                  currentcatigor = index;
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      color: currentcatigor == index
                          ? Colors.white
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(46),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Row(
                    children: [
                      ImageIcon(
                          AssetImage(
                              "assets/images/${categories[index]}_icon.png"),
                          color: currentcatigor == index
                              ? Theme.of(context).primaryColor
                              : Colors.white),
                      SizedBox(
                        width: 8,
                      ),
                      Text("${categories[index]}",
                          style: currentcatigor == index
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
              itemCount: categories.length,
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
