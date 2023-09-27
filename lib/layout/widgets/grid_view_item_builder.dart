import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_model.dart';

class GridViewItemBuilder extends StatelessWidget {
  GridViewItemBuilder(
      {required this.categoryModel,
      required this.index,
      required this.onClicked});

  CategoryModel categoryModel;
  int index;
  Function onClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClicked(categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight:
                index % 2 == 0 ? Radius.circular(0) : Radius.circular(25),
            bottomLeft:
                index % 2 == 0 ? Radius.circular(25) : Radius.circular(0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categoryModel.image),
            const SizedBox(
              height: 6,
            ),
            Text(
              categoryModel.title,
              style: GoogleFonts.exo(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
