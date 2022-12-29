import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/home_bloc/banner/bloc/home_banner_bloc.dart';
import 'package:flutter/src/widgets/framework.dart';

class Recomend extends StatelessWidget {
  const Recomend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBannerBloc>();
    return BlocBuilder(builder: (context, state) {
      if (state is Loading) {
        return SliverToBoxAdapter(
          child: Container(
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
        );
      } else {
        return CircularProgressIndicator();
      }
    });
  }
}
