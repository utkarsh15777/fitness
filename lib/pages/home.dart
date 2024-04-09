import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:fitness/models/popular_diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diets=[];
  List<PopularDietModel> popularDiets=[];

  void _getCategories(){
    categories = CategoryModel.getCategories();
  }

  void _getDiets(){
    diets = DietModel.getDiets();
  }

  void _getPopularDiets(){
    popularDiets = PopularDietModel.getDiets();
  }

  void _getInititalInfo(){
    _getCategories();
    _getDiets();
    _getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInititalInfo();
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        // scrollDirection: Axis.vertical,
        children: [
          _searchField(),
          const SizedBox(
            height: 50,
          ),
          _categoriesSection(),
          const SizedBox(
            height: 50,
          ),
          _dietSection(),
          const SizedBox(
            height: 50,
          ),
          _popularSection(),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Column _popularSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Popular",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 240,
              child: ListView.separated(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20
                  ),
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => const SizedBox(height: 25,),
                  itemCount: popularDiets.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: popularDiets[index].viewIsSelected ? const Color.fromARGB(255, 234, 230, 230):const Color.fromARGB(255, 249, 226, 226),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: popularDiets[index].viewIsSelected ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.07),
                            offset: const Offset(0,10),
                            blurRadius: 40,
                            spreadRadius: 0
                          )
                        ] : []
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            popularDiets[index].iconPath,
                            height: 65,
                            width: 65,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                popularDiets[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 20
                                ),
                              ),
                              Text(
                                '${popularDiets[index].level}|${popularDiets[index].duration}|${popularDiets[index].calorie}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 98, 97, 97),
                                  fontSize: 16
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              
                            },
                            child: SvgPicture.asset(
                              "assets/icons/buttonIcon.svg",
                              width: 40,
                              height: 40
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
            ),
          ],
        );
  }

  Column _dietSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'Recommendation\nfor Diet',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 240,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return Container(
                    width: 210,
                    decoration: BoxDecoration(
                      color: diets[index].color.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          diets[index].iconPath,
                          width: 50,
                          height: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              diets[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 20
                              ),
                            ),
                            Text(
                              '${diets[index].level}|${diets[index].duration}|${diets[index].calorie}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 98, 97, 97),
                                fontSize: 15
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 45,
                          width: 130,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                diets[index].viewIsSelected?const Color.fromARGB(255, 125, 183, 231):Colors.transparent,
                                diets[index].viewIsSelected? const Color.fromARGB(20, 21, 22, 23):Colors.transparent
                              ]
                            ),
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Center(
                            child: Text(
                              "View",
                              style: TextStyle(
                                color: diets[index].viewIsSelected?Colors.white:const Color.fromARGB(255, 214, 85, 237),
                                fontWeight: FontWeight.w600,
                                fontSize: 20
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                  );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 25,),
              itemCount: diets.length,
              padding: const EdgeInsets.only(left: 20,right: 20),
              ),
          )
          ],
        );
  }

  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 120,
              child: ListView.separated(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 25),
                itemBuilder: (context, index){
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              categories[index].iconPath
                            ),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14
                          ),
                        )
                      ],
                    ),
                  );
                }
              ),
            )
          ],
        );
  }

  Container _searchField() {
    return Container(
          margin: const EdgeInsets.only(top: 40,left: 20,right: 20),
          decoration: BoxDecoration(
            boxShadow: [
                BoxShadow(
                color: Colors.black.withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              contentPadding: const EdgeInsets.all(15),
              fillColor: Colors.white,
              hintText: 'Search PanCake',
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 220, 214, 214),
                fontSize: 14
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset('assets/icons/searchIcon.svg'),
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const VerticalDivider(
                        color: Colors.black,
                        thickness: 0.1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/menuIcon.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none
              )
            )
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('BreakFast',style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold 
      ),),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset('assets/icons/leftArrow.svg',height: 20,width: 20),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            
          },
          child:
            Container(
            width: 37,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/icons/leftArrow.svg',height: 20,width: 20),
          ),
        ),
      ],
    );
  }
}