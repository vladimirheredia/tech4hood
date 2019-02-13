
class Tweet{
  final id;
  final created;
  final description;
  // final url;

  Tweet({
    this.id, this.created, this.description
  });

  factory Tweet.fromJson(Map<String, dynamic> json){
    return Tweet(
      id: json['id'],
      created: json['created_at'],
      description: json['text'],
      // url: json['entities']['urls']['url']
    );
  }
}