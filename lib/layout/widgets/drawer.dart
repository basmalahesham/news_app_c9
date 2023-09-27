import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/models/category_model.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget(
      {super.key, required this.selectedCategory, required this.onPressed});

  CategoryModel? selectedCategory;
  Function? onPressed;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: media.width * 0.8,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: media.height * 0.2,
              color: AppTheme.primaryColor,
              child: Text(
                'News App!',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            //SizedBox(height: 30,),
            GestureDetector(
              onTap: () {
                if (onPressed != null) {
                  onPressed!();
                }
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 18),
                child: Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 40,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Categories',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 40,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Settings',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
