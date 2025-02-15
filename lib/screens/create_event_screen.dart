import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/firebase_functions.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:evently_app/provider/create_events_provider.dart';
import 'package:evently_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateEventScreen extends StatelessWidget {
  static const String routeName = "CreateEvent";

  CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();

    return ChangeNotifierProvider(
      create: (context) => CreateEventsProvider(),
      builder: (context, child) {
        var provider = Provider.of<CreateEventsProvider>(context);
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
                        "assets/images/${provider.categories[provider.currentcatigor]}.png",
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
                          provider.changeEventType(index);
                        },
                        child: Container(
                          height: 40,
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                              color: provider.currentcatigor == index
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(46),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 1)),
                          child: Row(
                            children: [
                              // ImageIcon(
                              //     AssetImage(
                              //         "assets/images/${provider.categories[index]}_icon.png"),
                              //     color: provider.currentcatigor == index
                              //         ? Colors.white
                              //         : Theme.of(context).primaryColor),
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
                                          )
                                      : Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Theme.of(context)
                                                  .primaryColor)),
                            ],
                          ),
                        ),
                      ),
                      itemCount: provider.categories.length,
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
                      controller: titleController,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Theme.of(context).cardColor),
                      decoration: _inputDecoration("Event Title", context)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 16),
                    child: Text(
                      "Description",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  TextField(
                      controller: descriptionController,
                      maxLines: 5,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Theme.of(context).cardColor),
                      decoration:
                          _inputDecoration("Event Description", context)),
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
                            onPressed: () async {
                              var Date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate:
                                      DateTime.now().add(Duration(days: 365)));
                              if (Date != null) {
                                provider.changeSelectedDay(Date);
                              }
                            },
                            child: Text(
                              provider.selectedDate.toString().substring(0, 10),
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
                          onPressed: () async {
                            var time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              provider.changeSelectedTime(time);
                            }
                          },
                          child: Text(
                            provider.selectedTime.format(context).toString(),
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
                  _chooseEventItem(context),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ElevatedButton(
                        onPressed: () {
                          FirebaseFunctions.addEvent(TaskModel(
                            userId: FirebaseAuth.instance.currentUser!.uid,
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  imageName: provider
                                      .categories[provider.currentcatigor],
                                  date: provider
                                      .selectedDate.millisecondsSinceEpoch,
                                  time: provider.selectedTime.format(context)))
                              .then(
                            (value) {
                              Navigator.pop(context);
                            },
                          );
                        },
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
      },
    );
  }

  InputDecoration _inputDecoration(String lable, context) {
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

  Widget _chooseEventItem(context) {
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
