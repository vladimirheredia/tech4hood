/// Class for member object

class Member{
  String name;
  String bio;
  String status;
  String photo;
  String city;
  String state;
  String country;

  Member({
    this.name, this.bio, this.status, this.photo, this.city, this.state, this.country
  });

  ///factory method to create a member object
  factory Member.fromJson(Map<String, dynamic> json){
    return Member(
      name: json['name'],
      bio: json['bio'],
      status: json['status'],
      photo: json['photo']['photo_link'],
      city: json['city'],
      state: json['state'],
      country: json['country']
    );
  }
 
}