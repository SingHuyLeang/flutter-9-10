class Product {
  int? id;
  String name;
  int qty;
  double price;
  double discount;
  String image;

  Product({
    this.id,
    required this.name,
    required this.qty,
    required this.price,
    required this.discount,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "qty": qty,
        "price": price,
        "discount": discount,
        "image": image,
      };

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] as int?,
        name: json["name"] as String,
        qty: json["qty"] as int,
        price: json["price"] as double,
        discount: json["discount"] as double,
        image: json["image"] as String,
      );
}
