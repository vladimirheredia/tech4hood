
class Event extends Object{

  final id;
  final name;
  final localDate;
  final localTime;
  final venueName;
  final venueAddress;
  final groupLocaltion;
  final description;

  Event({
    this.id,
    this.name,
    this.localDate,
    this.localTime,
    this.venueName,
    this.venueAddress,
    this.groupLocaltion,
    this.description
  });

  factory Event.fromJson(Map<String, dynamic> json){
    return Event(
      id: json['id'],
      name: json['name'],
      localDate: json['local_date'],
      localTime: json['local_time'],
      venueName: json['venue']['name'],
      venueAddress: json['venue']['address_1'],
      groupLocaltion: json['group']['localized_location'],
      description: json['description']
    );
  }
}