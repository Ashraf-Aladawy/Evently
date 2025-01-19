import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  static const String routeName = "CreateEvent";

  CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  List<String> categories = [
    "Birthday",
    "Sports",
    "Sports",
    "Sports",
  ];

  int currentcatigor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Event",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/images/Holiday.png",
                    height: 203,
                  )),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                          color: currentcatigor == index
                              ? Theme.of(context).primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(46),
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 1)),
                      child: Row(
                        children: [
                          ImageIcon(
                              AssetImage(
                                  "assets/images/${categories[index]}_icon.png"),
                              color: currentcatigor == index
                                  ? Colors.white
                                  : Theme.of(context).primaryColor),
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
                                      )
                                  : Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontSize: 16,
                                          color:
                                              Theme.of(context).primaryColor)),
                        ],
                      ),
                    ),
                  ),
                  itemCount: categories.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 16),
                child: Text(
                  "Title",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              TextField(
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).cardColor),
                  decoration: _inputDecoration("Event Title")),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 16),
                child: Text(
                  "Description",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              TextField(
                  maxLines: 5,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).cardColor),
                  decoration: _inputDecoration("Event Description")),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Icon(Icons.calendar_month_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Event Date",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Choose Date",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 16),
                        ))
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.watch_later_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Event Time",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Choose Date",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 16),
                      ))
                ],
              ),
              Text(
                "Location",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              _chooseEventItem(),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Add Event",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String lable) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Theme.of(context).cardColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Theme.of(context).cardColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Theme.of(context).cardColor),
      ),
      hintText: "$lable",
      hintStyle: Theme.of(context).textTheme.labelSmall,
      prefixIcon: lable == "Event Description"
          ? null
          : ImageIcon(AssetImage("assets/images/Note_Edit.png")),
    );
  }

  Widget _chooseEventItem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 8),
      child: TextField(
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: Theme.of(context).cardColor),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            hintText: "Choose Event Location",
            hintStyle:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16),
            suffixIcon: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Theme.of(context).primaryColor,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, bottom: 8, top: 8, right: 14),
              child: Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).primaryColor,
                ),
                child: Icon(
                  Icons.my_location_sharp,
                  color: Colors.white,
                ),
              ),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 21)),
      ),
    );
  }
}
