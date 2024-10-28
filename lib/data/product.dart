class Product {
  String name;
  int qty;
  double price;
  double discount;
  String image;

  Product({
    required this.name,
    required this.qty,
    required this.price,
    required this.discount,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "qty": qty,
        "price": price,
        "discount": discount,
        "image": image,
      };

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        qty: json["qty"],
        price: (json["price"] is int)
            ? (json["price"] as int).toDouble()
            : json["price"] as double,
        discount: (json["discount"] is int)
            ? (json["discount"] as int).toDouble()
            : json["discount"] as double,
        image: json["image"],
      );
}
