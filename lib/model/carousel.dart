// To parse this JSON data, do
//
//     final carousel = carouselFromJson(jsonString);

import 'dart:convert';

List<Carousel> carouselFromJson(String str) => List<Carousel>.from(
    json.decode(str)['data'].map((x) => Carousel.fromJson(x)));

String carouselToJson(List<Carousel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Carousel {
  Carousel({
    this.id,
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
    this.updatedAt,
  });

  final int id;
  final String name;
  final String pageUrl;
  final String originalPageUrl;
  final String media;
  final bool isActive;
  final int orders;
  final int bannerVariantId;
  final Variant variant;
  final int createdBy;
  final int updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Carousel.fromJson(Map<String, dynamic> json) => Carousel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        pageUrl: json["page_url"] == null ? null : json["page_url"],
        originalPageUrl: json["original_page_url"] == null
            ? null
            : json["original_page_url"],
        media: json["media"] == null ? null : json["media"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        orders: json["orders"] == null ? null : json["orders"],
        bannerVariantId: json["banner_variant_id"] == null
            ? null
            : json["banner_variant_id"],
        variant:
            json["variant"] == null ? null : Variant.fromJson(json["variant"]),
        createdBy: json["created_by"] == null ? null : json["created_by"],
        updatedBy: json["updated_by"] == null ? null : json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "page_url": pageUrl == null ? null : pageUrl,
        "original_page_url": originalPageUrl == null ? null : originalPageUrl,
        "media": media == null ? null : media,
        "is_active": isActive == null ? null : isActive,
        "orders": orders == null ? null : orders,
        "banner_variant_id": bannerVariantId == null ? null : bannerVariantId,
        "variant": variant == null ? null : variant.toJson(),
        "created_by": createdBy == null ? null : createdBy,
        "updated_by": updatedBy == null ? null : updatedBy,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class Variant {
  Variant({
    this.id,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String name;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
