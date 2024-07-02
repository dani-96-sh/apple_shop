class ProductModel {
  String category;
  String collectionId;
  String description;
  int discountPrice;
  String id;
  String name;
  String popularity;
  int price;
  int quantity;
  String thumbnail;
  int? realprice;
  num? persent;
  int? realpricediscount;

  ProductModel(
    this.category,
    this.collectionId,
    this.description,
    this.discountPrice,
    this.id,
    this.name,
    this.popularity,
    this.price,
    this.quantity,
    this.thumbnail,
  ) {
    realprice = price + discountPrice;
    realpricediscount = price - discountPrice;
    persent = ((price - realpricediscount!) / price) * 100;
  }

  factory ProductModel.fromJson(Map<String, dynamic> JsonObject) {
    return ProductModel(
        JsonObject['category'],
        JsonObject['collectionId'],
        JsonObject['description'],
        JsonObject['discount_price'],
        JsonObject['id'],
        JsonObject['name'],
        JsonObject['popularity'],
        JsonObject['price'],
        JsonObject['quantity'],
        'https://startflutter.ir/api/files/${JsonObject['collectionId']}/${JsonObject['id']}/${JsonObject['thumbnail']}');
  }
}
