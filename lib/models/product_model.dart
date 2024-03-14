class ProductModels {
  List<ProductModel>? data;

  ProductModels({
    this.data,
  });

  factory ProductModels.fromJson(Map<String, dynamic> json) => ProductModels(
        data: json["data"] == null
            ? []
            : List<ProductModel>.from(
                json["data"]!.map((x) => ProductModel.fromJson(x))),
      );
}

class ProductModel {
  String? id;
  String? name;
  String? imgUrl;
  String? firstPrice;
  String? currentPrice;
  int? quantity;
  int? categoryId;
  String? description;
  String? createdAt;
  String? updatedAt;
  int quantityCart;
  String? totalPrice;

  ProductModel(
      {this.id,
      this.name,
      this.imgUrl,
      this.firstPrice,
      this.currentPrice,
      this.quantity,
      this.categoryId,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.quantityCart = 0,
      this.totalPrice = ''});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["_id"],
      name: json["name"],
      imgUrl: json["imgUrl"],
      firstPrice: json["firstPrice"],
      currentPrice: json["currentPrice"],
      quantity: json["quantity"],
      categoryId: json["categoryId"],
      description: json["description"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "imgUrl": imgUrl,
        "firstPrice": firstPrice,
        "currentPrice": currentPrice,
        "quantity": quantity,
        "categoryId": categoryId,
        "description": description,
        "createdAt": createdAt?.toString(),
        "updatedAt": updatedAt?.toString(),
      };
}
