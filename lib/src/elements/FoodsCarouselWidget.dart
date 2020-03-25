import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/elements/CircularLoadingWidget.dart';
import 'package:food_delivery_app/src/elements/FoodsCarouselItemWidget.dart';
import 'package:food_delivery_app/src/models/food.dart';

class FoodsCarouselWidget extends StatelessWidget {
  List<Food> foodsList;
  String heroTag;

  FoodsCarouselWidget({Key key, this.foodsList, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return foodsList.isEmpty
        ? CircularLoadingWidget(height: 210)
        : Container(
            height: 210,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              itemCount: foodsList.length,
              itemBuilder: (context, index) {
                double _marginLeft = 0;
                (index == 0) ? _marginLeft = 20 : _marginLeft = 0;
                return FoodsCarouselItemWidget(
                  heroTag: heroTag,
                  marginLeft: _marginLeft,
                  food: foodsList.elementAt(index),
                );
              },
              scrollDirection: Axis.horizontal,
            ));
  }
}
