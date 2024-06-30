class CategoryModel {
  String? collectionId;
  String? collectionName;
  String? color;
  String? created;
  String? icon;
  String? id;
  String? thumbnail;
  String? title;

  CategoryModel(
    this.collectionId,
    this.collectionName,
    this.color,
    this.created,
    this.icon,
    this.id,
    this.thumbnail,
    this.title,
  );

  factory CategoryModel.fromMapJson(Map<String, dynamic> jsonObject) {
    return CategoryModel(
      jsonObject['collectionId'],
      jsonObject['collectionName'],
      jsonObject['color'],
      jsonObject['created'],
      jsonObject['icon'],
      jsonObject['id'],
      'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
      jsonObject['title'],
    );
  }
}
