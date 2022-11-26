class AfishaModel {
  String? name;
  int? id;
  String? link;
  dynamic type_afisha;
  bool? vip;
  String? img;
  String? datatcevent;
  bool? datatctoken;
  bool? datatcmeta;
  String? short_desc;
  String? description;
  String? price;
  String? place;
  bool? pushkin_card;
  String? idCompany;
  String? phone;
  dynamic seanses;
  dynamic seanses2;
  dynamic gallery;

  AfishaModel({
    this.name,
    this.id,
    this.link,
    this.type_afisha,
    this.vip,
    this.img,
    this.datatcevent,
    this.datatctoken,
    this.datatcmeta,
    this.short_desc,
    this.description,
    this.price,
    this.place,
    this.pushkin_card,
    this.idCompany,
    this.phone,
    this.seanses,
    this.seanses2,
    this.gallery,
  });

  AfishaModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    link = json['link'];
    type_afisha = json['type_afisha'];
    vip = json['vip'];
    img = json['img'];
    datatcevent = json['data-tc-event'];
    datatctoken = json['data-tc-token'];
    datatcmeta = json['ddata-tc-meta'];
    short_desc = json['short_desc'];
    price = json['price'];
    description = json['description'];
    place = json['place'];
    pushkin_card = json['pushkin_card'];
    idCompany = json['idCompany'];
    phone = json['phone'];
    seanses = json['seanses'];
    seanses2 = json['seanses2'] ?? [];
    gallery = json['gallery'];
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

  TypeAfisha.fromJson(dynamic json) {
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
