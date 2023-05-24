
import 'package:flutter/material.dart';
import 'package:halla_food/foodService.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> foodList = [];
  FoodService _foodService = FoodService();
  void addListService()async{
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
    return Scaffold(
      appBar: AppBar(
        title: Text("한라 급식"),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.separated(itemBuilder: (context,index){
            return Column(
              children: [
                Text("조식"),
                ListTile(
                  title: Text(foodList[index].toString()),
                ),
              ],
            );
          }, separatorBuilder: (context,index){
            return SizedBox(height: 10,);
          }, itemCount: foodList.length))
        ],
      ),
    );
  }
}
