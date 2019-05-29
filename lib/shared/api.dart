import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = 'https://us-central1-tech4hood.cloudfunctions.net';

class API {
  //gets all events from meetup api
  static Future getAllEvents() async {
    var url = baseUrl + '/getEvents';
    return await http.get(url);
  }

  //gets all the members from meetup api
  static Future getAllMembers() async {
    var url = baseUrl + '/getMembers';
    return await http.get(url);
  }

  //gets all the members from meetup api
  static Future getLearningTrack({skill: String, level: String}) async {
    var url = baseUrl + '/getLearningTrack?skill=' + skill + '&level=' + level;
    return await http.get(url);
  }

  //gets all the tweets from Twitter api
  static Future getAllTweets() async {
    var url = baseUrl + '/getTweets';
    return await http.get(url);
  }

  //gets all instagram feeds
  static Future getInstagramFeed() async {
    var url = baseUrl + '/getInstagramFeed';
    return await http.get(url);
  }

  static Future getT4HShop() async {
    var url = baseUrl + '/getT4HShop';
    return await http.get(url);
  }

  //gets all resources
  static Future getResources() async {
    var url = baseUrl + '/getResources';
    return await http.get(url);
  }

  //gets all contact info for tech4hood
  static Future getContactInfo() async {
    var url = baseUrl + '/getContactInfo';
    return await http.get(url);
  }

  //gets all team members
  static Future getTech4HoodTeam() async {
    var url = baseUrl + '/getTech4HoodTeam';
    return await http.get(url);
  }

  //get youtube videos
  static Future getYoutubeVideos() async {
    var url = baseUrl + '/getYouTubeVideos';
    return await http.get(url);
  }
}
