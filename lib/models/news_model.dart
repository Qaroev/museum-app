class NewsModel {
  String? name;
  String? date;
  String? link;
  String? img;
  String? description;
  String? video;

  NewsModel({
    this.name,
    this.date,
    this.link,
    this.img,
    this.description,
    this.video,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
    link = json['link'];
    img = json['img'];
    description = json['description'];
    video = json['video'];
  }
}