class LearningTrack {
  String trackName;
  List<LearningResource> learningResources = List<LearningResource>();

  LearningTrack({this.trackName});
}

class LearningResource {

LearningResource({
  this.skill,
  this.tech,
  this.title,
  this.level,
  this.link,
  this.description,
  this.price,
  this.length,
  this.type,
  this.certificateBadge,
  this.source
});

  String skill;
  String tech;
  String title;
  String level;
  String link;
  String description;
  String price;
  String length;
  String type;
  bool certificateBadge;
  String source;

  factory LearningResource.fromJson(Map<String, dynamic> json){
    return LearningResource(
      skill: json['skill'],
      tech: json['tech'],
      title: json['title'],
      level: json['level'],
      link: json['link'],
      description: json['description'],
      price: json['price'],
      length: json['length'],
      type: json['type'],
      certificateBadge: json['certificateBadge'] == 'YES',
      source: json['source']
    );
  }
}