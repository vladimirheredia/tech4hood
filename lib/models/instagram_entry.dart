
class InstagramEntry {

  String thumbnail;
  int likes;
  int comments;
  String link;
  String caption;
  String videolink;
  String type; // image, video, carousel
  String createdTime;
  String userProfilePic;

  InstagramEntry({
    this.thumbnail,
    this.likes,
    this.comments,
    this.link,
    this.caption,
    this.type,
    this.videolink,
    this.createdTime,
    this.userProfilePic
  });

  factory InstagramEntry.fromJson(Map<String, dynamic> json){
    return InstagramEntry(
      thumbnail: json['images']["low_resolution"]["url"],
      likes: json['likes'] != null ? json['likes']['count'] : 0,
      comments: json['comments'] != null ? json['comments']['count'] : 0,
      type: json['type'],
      link: json['link'],
      caption: json['caption'] != null ? json['caption']['text'] : '',
      videolink: json['type'] == 'video' ? json['videos']['standard_resolution']['url']: '',
      createdTime: json['created_time'],
      userProfilePic: json['user']['profile_picture']
    );
  }
}