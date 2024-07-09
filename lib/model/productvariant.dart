import 'package:apple_shop/model/VariantType.dart';
import 'package:apple_shop/model/variant.dart';

class Productvariant {
  VariantType variantType;
  List<Variant> variantList;

  Productvariant(this.variantType, this.variantList);
}
