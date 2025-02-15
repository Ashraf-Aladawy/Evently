import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/firebase_functions.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  TaskModel model;
  EventItem({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Container(
        height: 230,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "assets/images/${model.imageName}.png",
                      height: 230,
                      fit: BoxFit.fill,
                    )),
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
                        DateTime.fromMillisecondsSinceEpoch(model.date)
                            .toString()
                            .substring(8, 10),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        milliSecondToMonth(model.date),
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
                    model.title,
                    textAlign: TextAlign.justify,
                    maxLines: 2,
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      FirebaseFunctions.deleteEvent(model.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  ImageIcon(
                    AssetImage("assets/images/fav_icon.png"),
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String milliSecondToMonth(int milliSec) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(milliSec);
    return DateFormat("MMM").format(date);
  }
}
