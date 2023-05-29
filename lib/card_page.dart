import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextHighlightWidget extends StatelessWidget {
  final List<String> textList;
  final List<String> targetWords;
  final List<String> dayList;
  final Color cardColor;
  const TextHighlightWidget({
    Key? key,
    required this.textList,
    required this.dayList,
    required this.targetWords,
    required this.cardColor

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppinioSwiper(
      loop: true,
      cardsCount: textList.length,
      cardsBuilder: (BuildContext context, int index) {
        return swipeCardWidget(into: dayList[index], menu: textList[index],cardColor: cardColor);
      },
    );
  }


Widget swipeCardWidget({required String into, required String menu, required Color cardColor,}) {
  final textColor = _checkWordOccurrences(menu) ? Colors.white : Colors.black;
ScreenUtil _screenUtil = ScreenUtil();
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12).w,
          color: _checkWordOccurrences(menu) ? Color(0xff454545) : Colors.white,
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
                style: TextStyle(fontSize: 20.sp,color: textColor),
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
                  color: _checkWordOccurrences(menu) ? Color(0xffC0DBEA) : cardColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Text(
                  into,
                  style: TextStyle(fontSize: 18.sp, color: Colors.grey[800]),
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
//리스트 돌면서 해당 단어가 있을시 true , 없을경우 false
  bool _checkWordOccurrences(String text) {
    for (final word in targetWords) {
      if (text.contains(word)) {
        return true;
      }
    }
    return false;
  }
}