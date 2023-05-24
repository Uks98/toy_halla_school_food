import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halla_food/foodService.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> foodList = [];

  List<String> morningFoodInfo = ["월요일 조식","화요일 조식","수요일 조식","목요일 조식","금요일 조식"];
  FoodService _foodService = FoodService();

  void addListService() async {
    foodList = await _foodService.parseData();
    print("food list ${foodList}");
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addListService();
  }

  @override
  Widget build(BuildContext context) {
    print(foodList.length);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 400,
              height: MediaQuery.of(context).size.height * 0.75,
              child: AppinioSwiper(
                loop: true,
                cardsCount: foodList.length + 5,
                cardsBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        width: 300,
                        height: 400,
                        child: Column(
                          children: [
                            Container(
                              child: Text(foodList[index]),
                              padding: const EdgeInsets.all(12),
                              width: 300,
                              height: 300,
                              alignment: Alignment.center,
                            ),
                            Container(
                              width: 300,
                              height:100,
                              decoration: const BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                              ),
                              child: Text(morningFoodInfo[index].toString()),
                              padding: const EdgeInsets.all(12),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _onEnd(int index) {
    foodList.length = 0;
  }
}

