import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halla_food/card_page.dart';
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
  //내가 좋아하는 음식 리스트 ..
  List<String> targetList = ["돈가스","냉면","오징어가스"];
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
              child: morningFoodList.isEmpty
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : AppinioSwiper(
                loop: true,
                cardsCount: morningFoodList.length,
                cardsBuilder: (BuildContext context, int index) {
                  return TextHighlightWidget(
                    textList: morningFoodList,
                    dayList: morningFoodInfo,
                    targetWords: targetList,
                    cardColor: Color(0xffFA9884),
                  );
                },
              ),
            ),
            //점심 식단 카드
            SizedBox(
              width: _screenUtil.setWidth(400),
              height: _screenUtil.setHeight(500),
              child: lunchFoodInfo.isEmpty
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : AppinioSwiper(
                loop: true,
                cardsCount: lunchFoodList.length,
                cardsBuilder: (BuildContext context, int index) {
                  return TextHighlightWidget(
                    textList: lunchFoodList,
                    dayList: lunchFoodInfo,
                    targetWords: targetList,
                    cardColor: Color(0xffF9E2AF),
                  );
                },
              ),
            ),
            //즉석 식단 카드
            SizedBox(
              width: _screenUtil.setWidth(400),
              height: _screenUtil.setHeight(500),
              child: fastLunchFoodList.isEmpty
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : AppinioSwiper(
                loop: true,
                cardsCount: fastLunchFoodList.length,
                cardsBuilder: (BuildContext context, int index) {
                  return TextHighlightWidget(
                    textList: fastLunchFoodList,
                    dayList: fastLunchFoodInfo,
                    targetWords: targetList,
                    cardColor: Color(0xffF9E2AF),
                  );
                },
              ),
            ),
            //져녁 식단 카드
            SizedBox(
              width: _screenUtil.setWidth(400),
              height: _screenUtil.setHeight(500),
              child: lunchFoodList.isEmpty
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : AppinioSwiper(
                loop: true,
                cardsCount: lunchFoodList.length,
                cardsBuilder: (BuildContext context, int index) {
                  return TextHighlightWidget(
                    textList: lunchFoodList,
                    dayList: lunchFoodInfo,
                    targetWords: targetList,
                    cardColor: Color(0xffE3CCAE),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}