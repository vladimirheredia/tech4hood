
class Event extends Object{

  final id;
  final name;
  final localDate;
  final localTime;
  final venueName;
  final venueAddress;
  final groupLocation;
  final description;
  final link;

  Event({
    this.id,
    this.name,
    this.localDate,
    this.localTime,
    this.venueName,
    this.venueAddress,
    this.groupLocation,
    this.description,
    this.link
  });

  factory Event.fromJson(Map<String, dynamic> json){
    return Event(
      id: json['id'],
      name: json['name'],
      localDate: json['local_date'],
      localTime: json['local_time'],
      venueName: json['venue'] != null ? json['venue']['name'] : '',
      venueAddress: json['venue'] != null ? json['venue']['address_1']: '',
      groupLocation: json['group']['localized_location'],
      description: json['description'],
      link: json['link']
    );
  }
}