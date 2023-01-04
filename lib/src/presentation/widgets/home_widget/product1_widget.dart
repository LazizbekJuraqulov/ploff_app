import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/home_bloc/banner/bloc/home_banner_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBannerBloc>();
    return BlocBuilder<HomeBannerBloc, HomeBannerState>(
        builder: (context, state) {
      if (state is Looading) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: state.data.categories!.length,
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
                      state.data.categories![index].title!.ru.toString(),
                      style: const TextStyle(
                          fontSize: 22,
                          color: Color(0xff2B2A28),
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 16),
                        child: ListView.separated(
                          itemCount: state.data.categories!.length,
                          physics: const NeverScrollableScrollPhysics(),
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
                                          state
                                              .data.categories![index].title!.ru
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff2B2A28),
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(right: 16),
                                            width: 239,
                                            child: Text(
                                              state.data.categories![index]
                                                  .description!.ru
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xff858585)),
                                            )),
                                        Text(
                                            state.data.categories![index]
                                                .products![1].outPrice
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff000000),
                                                fontWeight: FontWeight.w600)),
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
                        )),
                  ],
                ),
              );
            },
          ),
        );
      } else {
        return Scaffold(
          body: Container(),
        );
      }
    });
  }
}
