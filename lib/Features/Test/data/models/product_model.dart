class ProductModel {

  ProductModel({
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
    required this.id,
    required this.title,
    required this.category,
  });

  String image;
  num price;
  Rating rating;
  String description;
  num id;
  String title;
  String category;

  factory ProductModel.fromJson(Map<dynamic, dynamic> json) => ProductModel(
        image: json["image"] != null ? json["image"].toString() : '',
        price: json["price"] ?? 0.0,
        rating: json["rating"] != null
            ? Rating.fromJson(json["rating"])
            : Rating(rate: 0.0, count: 0),
        description:
            json["description"] != null ? json["description"].toString() : '',
        id: json["id"] ?? '',
        title: json["title"] != null ? json["title"].toString() : '',
        category: json["category"] != null ? json["category"].toString() : '',
      );
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  num rate;
  num count;

  factory Rating.fromJson(Map<dynamic, dynamic> json) => Rating(
        rate: json["rate"] ?? 0.0,
        count: json["count"],
      );
}
