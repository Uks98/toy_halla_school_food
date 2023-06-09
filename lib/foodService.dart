import 'package:html/parser.dart' show parse;

class FoodService {
  String hallaFoodData = """<div class="food">
    <table summary="월요일 조식, 중식, 석식 음식내용"><caption>월요일 식단표 </caption><colgroup>
			<col width="60">
			<col width="85">
			<col width="*">
        </colgroup>
        <tbody>
        <tr>
        <th rowspan="5" scope="row" class=""><p class="week">
						<img src="/mbs/kr/images/food_01.gif" alt="월요일">
					</p>
					<p>5/22</p>
				</th>
				<td class="bg01 blLine" scope="row">
					조식
				</td>
				<td colspan="2" class=""><p class="al10">- 쇠고기두부탕국, 계란후라이, 도토리묵무침, 김치 &lt;천원의 아침밥 8시-9시50분까지 제공&gt;</p>
				</td>
				</tr>
				<tr>
				<td class="bg01 blLine" rowspan="2" scope="row">
					중식
				</td><td width="50px" class="">
					정식
				</td><td class=""><p class="al10">- 참치생야채비빔밥</p>
				</td></tr><tr><td class="">
					즉석
				</td><td class=""><p class="al10">- 냉모밀</p>
				</td></tr><tr><td class="bg01 blLine" scope="row">석식
				</td>
				<td colspan="2" class="">
				<p class="al10">- 제육간장볶음, 돈육강정, 샐러드, 미역국, 김치&lt;석식은 5시-6시30분까지 제공&gt;</p>
				</td>
				</tr>
				</tbody>
				</table>




	<table summary="화요일 조식, 중식, 석식 음식내용"><caption>화요일 식단표 </caption><colgroup>
			<col width="60">
			<col width="85">
			<col width="*">
        </colgroup>
        <tbody><tr><th rowspan="5" scope="row" class=""><p class="week">
						<img src="/mbs/kr/images/food_02.gif" alt="화요일">
					</p>
					<p>5/23</p>
				</th><td class="bg01 blLine" scope="row">
					조식
				</td><td colspan="2" class=""><p class="al10">- 순두부참치떡찌개. 동그랑땡, 명엽채볶음, 김치&nbsp;<span style="font-size: 10pt;">&lt;천원의 아침밥 8시-9시50분까지 제공&gt;</span><span style="font-size: 10pt;">&nbsp;</span></p>
				</td></tr><tr><td class="bg01 blLine" rowspan="2" scope="row">
					중식
				</td><td width="50px" class="">
					정식
				</td><td class=""><p class="al10">- 카레라이스+치킨가스</p>
				</td></tr><tr><td class="">
					즉석
				</td><td class=""><p class="al10">- 치즈불닭</p>
				</td></tr><tr><td class="bg01 blLine" scope="row">
					석식
				</td><td colspan="2" class=""><p class="al10">- 치킨마요덮밥, 두부조림, 어묵매운탕, 요구르트&nbsp;<span style="font-size: 10pt;">&lt;석식은 5시-6시30분까지 제공&gt;</span></p>
				</td></tr></tbody></table>


	<table summary="수요일 조식, 중식, 석식 음식내용"><caption>수요일 식단표 </caption><colgroup>
			<col width="60">
			<col width="85">
			<col width="*">
        </colgroup>
        <tbody><tr><th rowspan="5" scope="row" class=""><p class="week">
						<img src="/mbs/kr/images/food_03.gif" alt="수요일">
					</p>
					<p>5/24</p>
				</th><td class="bg01 blLine" scope="row">
					조식
				</td><td colspan="2" class=""><p class="al10">- 쇠고기야채비빔밥, 어묵볶음, 콩나물국, 김치<span style="font-size: 10pt;">&lt;천원의 아침밥 8시-9시50분까지 제공&gt;</span></p>
				</td></tr><tr><td class="bg01 blLine" rowspan="2" scope="row">
					중식
				</td><td width="50px" class="">
					정식
				</td><td class=""><p class="al10">- 비빔국수</p>
				</td></tr><tr><td class="">
					즉석
				</td><td class=""><p class="al10">- 왕등심돈가스</p>
				</td></tr><tr><td class="bg01 blLine" scope="row">
					석식
				</td><td colspan="2" class=""><p class="al10">- 햄김치덮밥, 계란후라이, 고구마맛탕, 콩나물국&nbsp;<span style="font-size: 10pt;">&lt;석식은 5시-6시30분까지 제공&gt;</span></p>
				</td></tr></tbody></table>


	<table summary="목요일 조식, 중식, 석식 음식내용"><caption>목요일 식단표 </caption><colgroup>
			<col width="60">
			<col width="85">
			<col width="*">
        </colgroup>
        <tbody><tr><th rowspan="5" scope="row" class=""><p class="week">
						<img src="/mbs/kr/images/food_04.gif" alt="목요일">
					</p>
					<p>5/25</p>
				</th><td class="bg01 blLine" scope="row">
					조식
				</td><td colspan="2" class=""><p class="al10">- 마파두부덮밥, 오징어가스, 미역국, 김치&nbsp;<span style="font-size: 10pt;">&lt;천원의 아침밥 8시-9시50분까지 제공&gt;</span></p>
				</td></tr><tr><td class="bg01 blLine" rowspan="2" scope="row">중식
				</td><td width="50px" class="">
					정식
				</td><td class=""><p class="al10">- 제육콩나물비빔밥</p>
				</td></tr><tr><td class="">
					즉석
				</td><td class=""><p class="al10">- 부대덮밥 (신메뉴)</p>
				</td></tr><tr><td class="bg01 blLine" scope="row">
					석식
				</td><td colspan="2" class=""><p class="al10">- 돈육두부김치찌개, 생선가스, 무생채, 김치&nbsp;<span style="font-size: 10pt;">&lt;석식은 5시-6시30분까지 제공&gt;</span></p>
				</td></tr></tbody></table>


	<table summary="금요일 조식, 중식, 석식 음식내용"><caption>금요일 식단표 </caption><colgroup>
			<col width="60">
			<col width="85">
			<col width="*">
        </colgroup>
        <tbody><tr><th rowspan="5" scope="row" class=""><p class="week">
						<img src="/mbs/kr/images/food_05.gif" alt="금요일">
					</p>
					<p>5/26</p>
				</th><td class="bg01 blLine" scope="row">
					조식
				</td><td colspan="2" class=""><p class="al10">- 닭갈비야채덮밥, 맛살채무침, 유부국, 김치&nbsp;<span style="font-size: 10pt;">&lt;천원의 아침밥 8시-9시50분까지 제공&gt;</span></p>
				</td></tr><tr><td class="bg01 blLine" rowspan="2" scope="row">
					중식
				</td><td width="50px" class="">
					정식
				</td><td class=""><p class="al10">- 어묵우동</p>
				</td></tr><tr><td class=""> 즉석
				</td><td class=""><p class="al10">- 고구마치즈돈가스</p>
				</td></tr><tr><td class="bg01 blLine" scope="row">
					석식
				</td><td colspan="2" class=""><p class="al10">- 너비아니야채볶음, 연두부, 어묵볶음, 김치국, 김치&nbsp;<span style="font-size: 10pt;">&lt;석식은 5시-6시30분까지 제공&gt;</span></p>
				</td></tr></tbody></table>
	<table summary="토요일 조식, 중식, 석식 음식내용"><caption>토요일 식단표 </caption><colgroup>
			<col width="60">
			<col width="85">
			<col width="*">
        </colgroup>
        <tbody><tr><th rowspan="5" scope="row" class=""><p class="week">
						<img src="/mbs/kr/images/food_06.gif" alt="토요일">
					</p>
					<p>5/27</p>
				</th><td class="bg01 blLine" scope="row">
					조식
				</td><td colspan="2" class=""><p class="al10">-&nbsp;</p>
				</td></tr><tr><td class="bg01 blLine" rowspan="2" scope="row">
					중식
				</td><td width="50px" class="">
					정식
				</td><td class=""><p class="al10">- 토요일.일요일:미운영</p>
				</td></tr><tr><td class="">
					즉석
				</td><td class=""><p class="al10">- &nbsp; </p>
				</td></tr><tr><td class="bg01 blLine" scope="row">
					석식
				</td><td colspan="2" class=""><p class="al10">- &nbsp;</p>
				</td></tr>
</tbody>
</table>
    </div>""";

  List<String> parseMorningData() {
    var document = parse(hallaFoodData);
    List<String> data = [];
    //data.add(document.getElementsByClassName("food")[0].innerHtml);
    //declaring variable for temp since we will be using it multiple places
    ///조식 0 정식 1 즉석 2 석식 3 다음날 조식 4
    var morning =
        document.getElementsByClassName("al10")[0].text.replaceAll("-", "");
    var morning1 =
        document.getElementsByClassName("al10")[4].text.replaceAll("-", "");
    var morning2 =
        document.getElementsByClassName("al10")[8].text.replaceAll("-", "");
    var morning3 =
        document.getElementsByClassName("al10")[12].text.replaceAll("-", "");
    var morning4 =
        document.getElementsByClassName("al10")[16].text.replaceAll("-", "");

    ///화요일 조식은 순두부 참치떡 찌개
    var temp3 = document.getElementsByClassName("al10")[4].text;

    ///정식은 카레라이스
    var temp4 = document.getElementsByClassName("al10")[5].text;

    ///즉석은 치즈불닭
    var rows =
        document.getElementsByTagName("table")[0].getElementsByTagName("td");
    data.addAll([morning, morning1, morning2, morning3, morning4]);
    return data;
  }

  List<String> parseLunchData() {
    var document = parse(hallaFoodData);
    List<String> data = [];
    //data.add(document.getElementsByClassName("food")[0].innerHtml);
    //declaring variable for temp since we will be using it multiple places
    ///조식 0 정식 1 즉석 2 석식 3 다음날 조식 4
    var lunch =
        document.getElementsByClassName("al10")[1].text.replaceAll("-", "");
    var lunch1 =
        document.getElementsByClassName("al10")[5].text.replaceAll("-", "");
    var lunch2 =
        document.getElementsByClassName("al10")[9].text.replaceAll("-", "");
    var lunch3 =
        document.getElementsByClassName("al10")[13].text.replaceAll("-", "");
    var lunch4 =
        document.getElementsByClassName("al10")[17].text.replaceAll("-", "");

    data.addAll([
      lunch,
      lunch1,
      lunch2,
      lunch3,
      lunch4,
    ]);

    return data;
  }

  List<String> parseFastLunchData() {
    var document = parse(hallaFoodData);
    List<String> data = [];
    //data.add(document.getElementsByClassName("food")[0].innerHtml);
    //declaring variable for temp since we will be using it multiple places
    ///즉석 2 6 10 14 18
    var fastLunch =
    document.getElementsByClassName("al10")[2].text.replaceAll("-", "");
    var fastLunch1 =
    document.getElementsByClassName("al10")[6].text.replaceAll("-", "");
    var fastLunch2 =
    document.getElementsByClassName("al10")[10].text.replaceAll("-", "");
    var fastLunch3 =
    document.getElementsByClassName("al10")[14].text.replaceAll("-", "");
    var fastLunch4 =
    document.getElementsByClassName("al10")[18].text.replaceAll("-", "");

    data.addAll([
      fastLunch,
      fastLunch1,
      fastLunch2,
      fastLunch3,
      fastLunch4,
    ]);
    return data;
  }
}
