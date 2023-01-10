class ExhibitionsModel {
  String? name;
  String? link;
  TypeAfisha? type_afisha;
  String? img;
  String? description;
  dynamic gallery;
  String? inform;

  ExhibitionsModel({
    this.name,
    this.type_afisha,
    this.link,
    this.img,
    this.description,
    this.gallery,
    this.inform,
  });

  ExhibitionsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type_afisha = TypeAfisha.fromJson(json['type_afisha']);
    link = json['link'];
    img = json['img'];
    description = json['description'];
    gallery = json['gallery'] == false ? null : json['gallery'];
    inform = json['inform'];
  }
}

class TypeAfisha {
  int? term_id;
  String? name;
  String? slug;
  int? term_group;
  int? term_taxonomy_id;
  String? taxonomy;
  String? description;
  int? parent;
  int? count;
  String? filter;
  String? term_order;

  TypeAfisha({
    this.term_id,
    this.name,
    this.slug,
    this.term_group,
    this.description,
    this.term_taxonomy_id,
    this.taxonomy,
    this.parent,
    this.count,
    this.filter,
    this.term_order,
  });

  TypeAfisha.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    term_id = json['term_id'];
    slug = json['slug'];
    term_group = json['term_group'];
    term_taxonomy_id = json['term_taxonomy_id'];
    taxonomy = json['taxonomy'];
    description = json['description'];
    parent = json['parent'];
    count = json['count'];
    filter = json['filter'];
    term_order = json['term_order'];
  }
}
