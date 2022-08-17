import 'package:flutter/material.dart';
import 'package:gastra_soft/domen/news_item.dart';
import 'package:sizer/sizer.dart';

Future dialogAddAccount(NewsData newsItem, BuildContext context) async {
  TextStyle style1 = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500);
  TextStyle style2 = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700);
  TextStyle style3 = TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400);

  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
      builder: (context) {
        return Stack(
          children: [
            SizedBox(
              height: 80.h,
              child: Column(children: [
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white
                        ),
                        child: const Icon(Icons.close)),
                    ),
                    const SizedBox(width: 15)
                  ]
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(9.w), topRight: Radius.circular(9.w)),
                      color: Colors.white
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.h, left: 15, right: 15),
                      child: Column(
                        children: [
                          Row(children: [Text('${newsItem.title.toUpperCase()} —  ${newsItem.description.toUpperCase()}', style: style1)],),
                          image(),
                          SizedBox(height: 2.h),
                          Text('Самое большое количество времени и сил человек тратит на принятие решений', style: style2),
                          const SizedBox(height: 15),
                          Text('Решительность и смелость идут  за руку с друг другом и помогают  нам в реализации своих целей', style: style3)
                        ],
                      ),
                    ),
                  ),
                )
              ]
            )),
          ],
        );
      }
  );
}

Widget image() {
  TextStyle style1 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, letterSpacing: 4);
  TextStyle style2 = TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w300, letterSpacing: 4, color: Colors.brown[100]);

  return Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: [
      Row(),
      Image.asset('assets/images/spaceX2.png'),
      Image.asset('assets/images/elipse.png'),
      Image.asset('assets/images/spaceX1.png'),
      Positioned(
        top: 10.w,
        left: 2.w,
        child: Text('09', style: style2)),
      Positioned(
        top: 20.w,
        left: 15.w,
        child: Text('РЕШИТЕЛЬНОСТЬ', style: style1))
    ],
  );
}
