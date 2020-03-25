import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/helpers/helper.dart';
import 'package:food_delivery_app/src/models/restaurant.dart';
import 'package:food_delivery_app/src/models/route_argument.dart';

class GridItemWidget extends StatelessWidget {
  Restaurant restaurant;
  String heroTag;

  GridItemWidget({Key key, this.restaurant, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      onTap: () {
        Navigator.of(context).pushNamed('/Details', arguments: RouteArgument(id: restaurant.id, heroTag: heroTag));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.05), offset: Offset(0, 5), blurRadius: 5)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Hero(
                tag: heroTag + restaurant.id,
                child: CachedNetworkImage(
                  height: 82,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: restaurant.image.thumb,
                  placeholder: (context, url) => Image.asset(
                    'assets/img/loading.gif',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 82,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              restaurant.name,
              style: Theme.of(context).textTheme.body1,
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
            SizedBox(height: 2),
            Row(
              children: Helper.getStarsList(double.parse(restaurant.rate)),
            ),
          ],
        ),
      ),
    );
  }
}
