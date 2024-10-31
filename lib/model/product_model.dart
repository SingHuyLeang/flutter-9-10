class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Map<String, dynamic>? rating;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating,
      };
}
