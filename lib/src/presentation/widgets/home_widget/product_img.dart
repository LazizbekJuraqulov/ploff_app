import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ploff_app/src/presentation/bloc/home_bloc/banner/bloc/home_banner_bloc.dart';

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBannerBloc>();
    return BlocBuilder<HomeBannerBloc, HomeBannerState>(
        builder: (context, state) {
      if (state is Looading) {
        if (state.banners.banners!.isEmpty) {
          return SliverGap(0);
        }
        else{
          return SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 16, bottom: 12),
                  padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 160,
                        child: PageView.builder(
                            itemCount: state.banners.banners!.length,
                            onPageChanged: (value) {
                              homeBloc.add(PageIndex(value));
                            },
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(state
                                            .banners.banners![index].image
                                            .toString()))),
                              );
                            }),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 140),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 4,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.banners.banners!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 1),
                                      height: 4,
                                      width: state.activIndex != index ? 8 : 16,
                                      decoration: BoxDecoration(
                                        color: state.activIndex != index
                                          ? Color(0xffF0F0F0)
                                          : Color(0xffF4C009),
                                          borderRadius: BorderRadius.circular(55),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        );
        }
      } else {
        return Scaffold(
          body: Container(),
        );
      }
    });
  }
}
