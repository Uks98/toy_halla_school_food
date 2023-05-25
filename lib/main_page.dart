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
  List<String> morningFoodList = [];
  List<String> lunchFoodList = [];

  List<String> morningFoodInfo = ["월요일 조식","화요일 조식","수요일 조식","목요일 조식","금요일 조식"];
  List<String> lunchFoodInfo = ["월요일 정식","화요일 정식","수요일 정식","목요일 정식","금요일 정식"];
  FoodService _foodService = FoodService();

  void addListService() async {
    morningFoodList = await _foodService.parseMorningData();
    print("food list ${morningFoodList}");
  }
  void addLunchList() async {
    lunchFoodList = await _foodService.parseLunchData();

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addListService();
    addLunchList();
  }

  @override
  Widget build(BuildContext context) {
    print(morningFoodList.length);
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
                cardsCount: morningFoodList.length,
                cardsBuilder: (BuildContext context, int index) {
                  return swipeCardWidget(into: morningFoodInfo[index], menu:morningFoodList[index]);
                },
              ),
            ),
            SizedBox(
              width: 400,
              height: MediaQuery.of(context).size.height * 0.75,
              child: AppinioSwiper(
                loop: true,
                cardsCount: lunchFoodList.length,
                cardsBuilder: (BuildContext context, int index) {
                  return swipeCardWidget(into: lunchFoodInfo[index], menu:lunchFoodList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget swipeCardWidget({required String into, required String menu}){
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
              morningFoodList.contains(" 계란후라이") ? Text("aaaaaaaaa"):Container(
                child: Text(menu),
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
                child: Text(into),
                padding: const EdgeInsets.all(12),
              )
            ],
          ),
        )
      ],
    );
}
}

