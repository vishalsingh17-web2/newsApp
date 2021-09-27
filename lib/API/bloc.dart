import 'dart:async';
import 'dart:convert';
import 'package:news/API/api_manager.dart';
import 'package:http/http.dart' as http;
import 'package:news/API/constants.dart';

enum NewsAction {General,Entertainment,Sports,Technology,Science,Business,Health}

class NewsBloc {
  final _streamController = StreamController<List<Articles>>.broadcast();
  StreamSink<List<Articles>> get _newsSink => _streamController.sink;
  Stream<List<Articles>> get newsStream => _streamController.stream;

  final _eventStreamController = StreamController<NewsAction>();
  StreamSink<NewsAction> get eventSink => _eventStreamController.sink;
  Stream<NewsAction> get _eventStream => _eventStreamController.stream;

  NewsBloc() {
    _eventStream.listen((event) async {
      if (event == NewsAction.General) {
        try {
          var x = await getNews(Constants.general);
          _newsSink.add(x.articles);
        } catch (e) {
          _newsSink.addError("Something went wrong");
        }
      }if (event == NewsAction.Business) {
        try {
          var x = await getNews(Constants.business);
          _newsSink.add(x.articles);
        } catch (e) {
          _newsSink.addError("Something went wrong");
        }
      }
      if (event == NewsAction.Entertainment) {
        try {
          var x = await getNews(Constants.entertainment);
          _newsSink.add(x.articles);
        } catch (e) {
          _newsSink.addError("Something went wrong");
        }
      }if (event == NewsAction.Sports) {
        try {
          var x = await getNews(Constants.sports);
          _newsSink.add(x.articles);
        } catch (e) {
          _newsSink.addError("Something went wrong");
        }
      }if (event == NewsAction.Health) {
        try {
          var x = await getNews(Constants.health);
          _newsSink.add(x.articles);
        } catch (e) {
          _newsSink.addError("Something went wrong");
        }
      }if (event == NewsAction.Technology) {
        try {
          var x = await getNews(Constants.technology);
          _newsSink.add(x.articles);
        } catch (e) {
          _newsSink.addError("Something went wrong");
        }
      }if (event == NewsAction.Science) {
        try {
          var x = await getNews(Constants.science);
          _newsSink.add(x.articles);
        } catch (e) {
          _newsSink.addError("Something went wrong");
        }
      }
    });
  }
}

Future getNews(String url) async {
  var response = await http.get(Uri.parse(
      url));
  var json = jsonDecode(response.body);
  var data = Autogenerated.fromJson(json);
  return data;
}