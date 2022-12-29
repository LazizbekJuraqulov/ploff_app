import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 3,
        (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Со скидкой",
                  style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff2B2A28),
                      fontWeight: FontWeight.w600),
                ),
                Container(
                    padding: EdgeInsets.only(top: 16),
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 120,
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Чайханский плов",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xff2B2A28),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                          padding:
                                              EdgeInsets.only(right: 16),
                                          width: 239,
                                          child: Text(
                                            "Своим именем чайханский плов обязан старой ташкентской традиции «ош»...",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff858585)),
                                          )),
                                      Text("35 000 сум",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff000000),
                                              fontWeight:
                                                  FontWeight.w600)),
                                    ],
                                  ),
                                  Container(
                                    width: 88,
                                    height: 88,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/home_/123.jpg")),
                                        borderRadius:
                                            BorderRadius.circular(8)),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: ((context, index) {
                          return Divider();
                        }),
                        itemCount: 5)),
              ],
            ),
          );
        },
      ),
    );
  }
}