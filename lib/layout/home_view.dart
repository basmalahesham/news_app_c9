import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/layout/widgets/drawer.dart';
import 'package:news_app/layout/widgets/grid_view_item_builder.dart';

import '../models/category_model.dart';

class HomeLayoutView extends StatefulWidget {
  HomeLayoutView({super.key});

  static const String routeName = "home";

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  List<CategoryModel> categoriesList = [
    CategoryModel(
      id: 'sports',
      title: 'Sports',
      image: 'assets/images/sports.png',
      backgroundColor: Color(0xFFC91C22),
    ),
    CategoryModel(
      id: 'politics',
      title: 'Politics',
      image: 'assets/images/politics.png',
      backgroundColor: Color(0xFF003E90),
    ),
    CategoryModel(
      id: 'health',
      title: 'Health',
      image: 'assets/images/health.png',
      backgroundColor: Color(0xFFED1E70),
    ),
    CategoryModel(
      id: 'business',
      title: 'Business',
      image: 'assets/images/bussines.png',
      backgroundColor: Color(0xFFCF7E48),
    ),
    CategoryModel(
      id: 'environment',
      title: 'Environment',
      image: 'assets/images/environment.png',
      backgroundColor: Color(0xFF4882CF),
    ),
    CategoryModel(
      id: 'science',
      title: 'Science',
      image: 'assets/images/science.png',
      backgroundColor: Color(0xFFF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            selectedCategory == null ? 'News App' : selectedCategory!.title,
            style: GoogleFonts.exo(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        drawer: DrawerWidget(
          selectedCategory: selectedCategory,
          onPressed: onPressed,
        ),
        body: selectedCategory == null
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pick your Category \n of interest',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color(0xFF4F5A69),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 7 / 8,
                        ),
                        itemBuilder: (context, index) => GridViewItemBuilder(
                          categoryModel: categoriesList[index],
                          index: index,
                          onClicked: onClicked,
                        ),
                        itemCount: categoriesList.length,
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }

  CategoryModel? selectedCategory;

  onClicked(CategoryModel categoryModel) {
    print(categoryModel.title);
    selectedCategory = categoryModel;
    setState(() {});
  }

  onPressed() {
    setState(() {
      selectedCategory = null;
      Navigator.pop(context);
    });
  }
}
