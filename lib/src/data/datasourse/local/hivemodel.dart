 import 'package:ploff_app/src/data/dto/hive_product_model.dart';
import 'package:ploff_app/src/presentation/bloc/bloc/orderproduct_bloc.dart';

HiveProductModel hiveModel(OrderState state,int count) {
    return HiveProductModel(
                                      id: state.postmen!.id,
                                      slug: state.postmen!.slug,
                                      title: state.postmen!.title.ru,
                                      code: state.postmen!.code,
                                      isDivisible: state.postmen!.isDivisible,
                                      count: count.toString(),
                                      tags: state.postmen!.tags,
                                      inPrice: state.postmen!.inPrice,
                                      outPrice: state.postmen!.outPrice,
                                      image: state.postmen!.image,
                                      gallery: state.postmen!.gallery,
                                      favourites: state.postmen!.favourites,
                                      active: state.postmen!.active,
                                      order: state.postmen!.order,
                                      createdAt: state.postmen!.createdAt,
                                      iikoId: state.postmen!.iikoId,
                                      jowiId: state.postmen!.jowiId,
                                      shipperId: state.postmen!.shipperId,
                                      priceChangers:
                                          state.postmen!.priceChangers,
                                      currency: state.postmen!.currency,
                                      type: state.postmen!.type,
                                      properties: state.postmen!.properties,
                                      productProperty:
                                          state.postmen!.productProperty,
                                      iikoSourceActionId:
                                          state.postmen!.iikoSourceActionId,
                                      iikoGroupId: state.postmen!.iikoGroupId,
                                      activeInMenu:
                                          state.postmen!.activeInMenu,
                                      offAlways: state.postmen!.offAlways,
                                      fromTime: state.postmen!.fromTime,
                                      toTime: state.postmen!.toTime,
                                      ikpu: state.postmen!.ikpu,
                                      packageCode: state.postmen!.packageCode,
                                      variantProducts:
                                          state.postmen!.variantProducts,
                                      parentId: state.postmen!.parentId,
                                      hasModifier: state.postmen!.hasModifier,
                                      rkeeperId: state.postmen!.rkeeperId,
                                      description:
                                          state.postmen!.description.ru,
                                      );
  }
