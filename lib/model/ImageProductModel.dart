class ImageProductModel {
  String? imageurl;
  String? productId;

  ImageProductModel(this.imageurl, this.productId);

  factory ImageProductModel.fromMapJson(Map<String, dynamic> JsonObject) {
    return ImageProductModel(
        'https://startflutter.ir/api/files/${JsonObject['collectionId']}/${JsonObject['id']}/${JsonObject['image']}',
        JsonObject['product_id']);
  }
}
