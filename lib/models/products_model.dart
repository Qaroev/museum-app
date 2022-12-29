class Products {
  int? id;
  String? name;
  String? slug;
  String? permalink;
  String? description;
  String? shortDescription;
  String? price;
  dynamic images;
  dynamic categories;

  Products({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.description,
    this.shortDescription,
    this.price,
    this.images,
    this.categories,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    permalink = json['permalink'];
    description = json['description'];
    shortDescription = json['short_description'];
    price = json['price'];
    images = json['images'];
    categories = json['categories'];
  }
}