class ResourceModel {
  String title;
  String description;
  String link;
  String resourceType;
  String id;

  ResourceModel({
    this.title,
    this.description,
    this.link,
    this.resourceType
  });

  factory ResourceModel.fromJson(Map<String, dynamic> json){
    return ResourceModel(
      title: json['title'],
      description: json['description'],
      link: json['link'],
      resourceType: json['resourceType']
    );
  }
}