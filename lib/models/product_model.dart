class ProductModel {
  String? id;
  String? name;
  String? image;
  String? price;
  String? quantity;
  String? categoryId;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductModel({
    this.id,
    this.name,
    this.image,
    this.price,
    this.quantity,
    this.categoryId,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        quantity: json["quantity"],
        categoryId: json["category_id"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "quantity": quantity,
        "category_id": categoryId,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": createdAt?.toIso8601String(),
      };
}
