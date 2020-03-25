import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/models/notification.dart' as model;
import 'package:intl/intl.dart' show DateFormat;

class NotificationItemWidget extends StatelessWidget {
  model.Notification notification;

  NotificationItemWidget({Key key, this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            image: DecorationImage(image: NetworkImage(this.notification.type.image.thumb), fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 15),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                this.notification.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.body2,
              ),
              Text(
                DateFormat('yyyy-MM-dd').format(notification.dateTime),
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        )
      ],
    );
  }
}
