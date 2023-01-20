import 'package:ploff_app/src/data/dto/home_product_model.dart';
class ProductEntity {
    ProductEntity(
        this.id,
        this.outPrice,
        this.currency,
        this.string,
        this.type,
        this.categories,
        this.brandId,
        this.rateId,
        this.image,
        this.activeInMenu,
        this.hasModifier,
        this.fromTime,
        this.toTime,
        this.offAlways,
        this.gallery,
        this.title,
        this.description,
        this.active,
        this.iikoId,
        this.jowiId,
    );

    String ?id;
    int ?outPrice;
    String? currency;
    String? string;
    String? type;
    List<String>? categories;
    String? brandId;
    String ?rateId;
    String ?image;
    bool ?activeInMenu;
    bool ?hasModifier;
    String ?fromTime;
    String ?toTime;
    bool ?offAlways;
    dynamic gallery;
    Description ?title;
    Description ?description;
    bool ?active;
    String ?iikoId;
    String ?jowiId;

    
}

