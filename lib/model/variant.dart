class Variant {
  String? id;
  String? name;
  String? typeId;
  String? value;
  int? priceChange;

  Variant(this.id, this.name, this.priceChange, this.typeId, this.value);

  factory Variant.fromMapJson(Map<String, dynamic> JsonObject) {
    return Variant(JsonObject['id'], JsonObject['name'], JsonObject['type_id'],
        JsonObject['value'], JsonObject['price_change']);
  }
}
