import 'package:flutter/material.dart';

class Recomend extends StatelessWidget {
  const Recomend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(((context, index) {
      return Container(
          height: 204,
          margin: EdgeInsets.only(top: 16, bottom: 12),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(12)),
          child:PageView.builder(
            itemCount: 5,
            onPageChanged: (value) {
              
            },
            itemBuilder: (context,index){
            return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/home_/food.jpg"))),
                );
          })
              );
    }), childCount: 1));
  }
}