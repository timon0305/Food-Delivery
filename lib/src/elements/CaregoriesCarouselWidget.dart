import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/elements/CategoriesCarouselItemWidget.dart';
import 'package:food_delivery_app/src/elements/CircularLoadingWidget.dart';
import 'package:food_delivery_app/src/models/category.dart';

class CategoriesCarouselWidget extends StatelessWidget {
  List<Category> categories;

  CategoriesCarouselWidget({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.categories.isEmpty
        ? CircularLoadingWidget(height: 150)
        : Container(
            height: 150,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              itemCount: this.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                double _marginLeft = 0;
                (index == 0) ? _marginLeft = 20 : _marginLeft = 0;
                return new CategoriesCarouselItemWidget(
                  marginLeft: _marginLeft,
                  category: this.categories.elementAt(index),
                );
              },
            ));
  }
}
