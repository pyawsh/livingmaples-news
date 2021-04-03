import 'dart:convert';

import 'package:livingmaples_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {

  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2cd4883ed827450dba342ba2fc3a2ad0";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            content: element['content'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
            publishedAt: element['publishedAt'],
          );
          news.add(articleModel);
        }
      });
    }
    return news;
  }
}

class CategoryNewsClass {

  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=2cd4883ed827450dba342ba2fc3a2ad0";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            content: element['content'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
            publishedAt: element['publishedAt'],
          );
          news.add(articleModel);
        }
      });
    }
    return news;
  }
}