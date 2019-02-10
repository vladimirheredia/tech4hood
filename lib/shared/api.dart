import 'package:http/http.dart' as http;

const baseUrl = 'https://us-central1-tech4hood.cloudfunctions.net';

class API{

  //gets all events from meetup api
  static Future  getAllEvents(){
    var url = baseUrl + '/getEvents';
    return http.get(url);
  }

  //gets all the members from meetup api
  static Future getAllMembers(){
    var url = baseUrl + '/getMembers';
    return http.get(url);
  }
  
}