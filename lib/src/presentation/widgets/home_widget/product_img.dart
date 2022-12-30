import 'package:flutter/material.dart';
import 'package:ploff_app/src/presentation/bloc/home_bloc/banner/bloc/home_banner_bloc.dart';

class PageBanner extends StatelessWidget {
  const PageBanner({
    Key? key,
    required this.homeBloc,
  }) : super(key: key);

  final HomeBannerBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
          child: Column(
            children: [
    Container(
        height: 204,
        margin: EdgeInsets.only(top: 16, bottom: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(12)),
        child: PageView.builder(
            itemCount: 5,
            onPageChanged: (value) {
              homeBloc.add(PageIndex(value));
            },
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/home_/food.jpg"))),
              );
            })),
            // const SizedBox(height: 8),
            // SizedBox(
            //   height: 4,
            //   child: ListView.builder(
            //     itemCount: 5,
            //     itemBuilder: (context,index){
            //     return InkWell(
            //       onLongPress: () {
            //         homeBloc.add(ActivePage(index));
            //       },
            //       child:,
            //     )
            //   }),
            // ),

            ],
          ),
        );
  }
}
