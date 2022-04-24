
import 'package:food_id_me/model/variant.dart';

class Data {
  int? id;
  String? name;
  String? pageUrl;
  String? originalPageUrl;
  String? media;
  bool? isActive;
  int? orders;
  int? bannerVariantId;
  Variant? variant;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.pageUrl,
        this.originalPageUrl,
        this.media,
        this.isActive,
        this.orders,
        this.bannerVariantId,
        this.variant,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pageUrl = json['page_url'];
    originalPageUrl = json['original_page_url'];
    media = json['media'];
    isActive = json['is_active'];
    orders = json['orders'];
    bannerVariantId = json['banner_variant_id'];
    variant =
    json['variant'] != null ? Variant.fromJson(json['variant']) : null;
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['page_url'] = pageUrl;
    data['original_page_url'] = originalPageUrl;
    data['media'] = media;
    data['is_active'] = isActive;
    data['orders'] = orders;
    data['banner_variant_id'] = bannerVariantId;
    if (variant != null) {
      data['variant'] = variant!.toJson();
    }
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
