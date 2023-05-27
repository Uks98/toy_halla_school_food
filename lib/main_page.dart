import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halla_food/foodService.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> morningFoodList = [];
  List<String> lunchFoodList = [];
  List<String> fastLunchFoodList = [];

  List<String> morningFoodInfo = [
    "월요일 조식",
    "화요일 조식",
    "수요일 조식",
    "목요일 조식",
    "금요일 조식"
  ];
  List<String> lunchFoodInfo = [
    "월요일 정식",
    "화요일 정식",
    "수요일 정식",
    "목요일 정식",
    "금요일 정식"
  ];
  List<String> fastLunchFoodInfo = [
    "월요일 즉석",
    "화요일 즉석",
    "수요일 즉석",
    "목요일 즉석",
    "금요일 즉석"
  ];
  FoodService _foodService = FoodService();
  ScreenUtil _screenUtil = ScreenUtil();

  void addListService() async {
    morningFoodList = await _foodService.parseMorningData();
  }

  void addLunchList() async {
    lunchFoodList = await _foodService.parseLunchData();
  }
  void addFastLunchList() async {
    fastLunchFoodList = await _foodService.parseFastLunchData();
    print("food list ${fastLunchFoodList}");

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addListService();
    addLunchList();
    addFastLunchList();
  }

  @override
  Widget build(BuildContext context) {
    print(morningFoodList.length);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        centerTitle: true,
        title: Text(
          "한라대 주간 식단표",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _screenUtil.setHeight(20),
            ),
            //아침 식단 카드
            SizedBox(
              width: _screenUtil.setWidth(400),
              height: _screenUtil.setHeight(500),
              child: morningFoodList.isEmpty ? Center(child: CircularProgressIndicator(),):AppinioSwiper(
                loop: true,
                cardsCount: morningFoodList.length,
                cardsBuilder: (BuildContext context, int index) {
                  return swipeCardWidget(
                      into: morningFoodInfo[index],
                      menu: morningFoodList[index],
                      cardColor: Color(0xffF2E3DB)
                  );
                },
              ),
            ),
            //점심 식단 카드
            SizedBox(
              width: _screenUtil.setWidth(400),
              height: _screenUtil.setHeight(500),
              child: lunchFoodList.isEmpty ? Center(child: CircularProgressIndicator(),):AppinioSwiper(
                loop: true,
                cardsCount: lunchFoodList.length,
                cardsBuilder: (BuildContext context, int index) {
                  return swipeCardWidget(
                      into: lunchFoodInfo[index], menu: lunchFoodList[index],cardColor: Color(0xffEFFE5CA));
                },
              ),
            ),
            //즉석 식단 카드
            SizedBox(
              width: _screenUtil.setWidth(400),
              height: _screenUtil.setHeight(500),
              child: fastLunchFoodList.isEmpty ? Center(child: CircularProgressIndicator(),):AppinioSwiper(
                loop: true,
                cardsCount: fastLunchFoodList.length,
                cardsBuilder: (BuildContext context, int index) {
                  return swipeCardWidget(
                      into: fastLunchFoodInfo[index], menu: fastLunchFoodList[index],cardColor: Color(0xffF3DEBA));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget swipeCardWidget({required String into, required String menu,required Color cardColor}) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).w,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2.w,
                blurRadius: 4.w,
                offset: Offset(0, 1),
              ),
            ],
          ),
          width: 300.r,
          height: 400.r,
          child: Column(
            children: [
              Container(
                child: Text(
                  menu,
                  style: TextStyle(fontSize: 20.sp),
                ),
                padding: const EdgeInsets.all(12),
                width: _screenUtil.setWidth(300),
                height: _screenUtil.setHeight(300),
                alignment: Alignment.center,
              ),
              Expanded(
                child: Container(
                  width: 300.w, //이렇게 표현도 가능
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    into,
                    style: TextStyle(fontSize: 18.sp, color: Colors.grey[8000],),
                  ),
                  padding: const EdgeInsets.all(12).r,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
