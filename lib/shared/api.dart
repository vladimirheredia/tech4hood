import 'package:http/http.dart' as http;

const baseUrl = 'https://us-central1-tech4hood.cloudfunctions.net';

class API{

  //gets all events from meetup api
  static Future getAllEvents() async{
    var url = baseUrl + '/getEvents';
    return await http.get(url);
  }

  //gets all the members from meetup api
  static Future getAllMembers() async{
    var url = baseUrl + '/getMembers';
    return await http.get(url);
  }

  //gets all the tweets from Twitter api
  static Future getAllTweets() async{
    var url = baseUrl + '/getTweets';
    return await http.get(url);
  }
  
}