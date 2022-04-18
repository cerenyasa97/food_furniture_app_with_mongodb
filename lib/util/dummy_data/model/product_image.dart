class ProductImage{
  ProductImage(this.id, this.image, this.imageType);

  final String id;
  final String image;
  final String imageType;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
      json["id"],
      json["image"],
      json["image_type"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "image_type": imageType
  };
}