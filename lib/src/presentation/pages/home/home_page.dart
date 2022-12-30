
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_app/src/presentation/bloc/home_bloc/banner/bloc/home_banner_bloc.dart';
import 'package:ploff_app/src/presentation/widgets/home_widget/product1_widget.dart';
import 'package:ploff_app/src/presentation/widgets/home_widget/product_img.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBannerBloc>();
    return BlocBuilder<HomeBannerBloc, HomeBannerState>(
      builder: (context, state) {
       if (state is Loading) {
         return   Scaffold(
          backgroundColor: const Color(0xffDBDBDB),
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.2,
            backgroundColor: const Color(0xffffffff),
            title: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/home_/maps.svg"),
                          const SizedBox(
                            width: 9,
                          ),
                          const Text(
                            "Добавить адрес",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff2B2A28),
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset("assets/home_/icon.svg"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 44,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 10, top: 10, right: 10),
                          child: SvgPicture.asset(
                            "assets/home_/search.svg",
                            width: 20,
                            height: 20,
                          ),
                        ),
                        hintText: "Поиск по всей еде",
                        hintStyle: const TextStyle(
                            fontSize: 15,
                            color: Color(0xff858585),
                            fontWeight: FontWeight.w400),
                        fillColor: const Color(0xffF5F5F5),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 56,
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,


itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 16, right: 8),
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xffF5F5F5)),
                            child: const Text(
                              "adasdkkkka",
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xff2B2A28)),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              PageBanner(homeBloc: homeBloc),
             //Product(),
             SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: state.posts.length,
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
                  state.posts[index].categories![index].title!.en!,
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
    )

            ],
          ),
        );
       }else{
        return CircularProgressIndicator();
       }
      },
    );
  }
}

