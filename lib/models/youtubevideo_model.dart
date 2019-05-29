class YouTubeVideoModel {
  String videoId;
  String title;
  String description;
  String thumbnailPath;

  YouTubeVideoModel({
    this.videoId,
    this.title,
    this.description,
    this.thumbnailPath
  });

  factory YouTubeVideoModel.fromJson(Map<String, dynamic> json){
    return YouTubeVideoModel(
      videoId: json['id']['videoId'],
      title: json['snippet']['title'],
      description: json['snippet']['description'],
      thumbnailPath: json['snippet']['thumbnails']['high']['url']
    );
  }
}