import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:livingmaples_news/helper/data.dart';
import 'package:livingmaples_news/helper/news.dart';
import 'package:livingmaples_news/models/article_model.dart';
import 'package:livingmaples_news/models/category_model.dart';
import 'article_view.dart';

class CategoryNews extends StatefulWidget {

  final String category ;
  const CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass categoryNewsClass = CategoryNewsClass();
    await categoryNewsClass.getNews(widget.category);
    articles = categoryNewsClass.news;
    setState(() {
      _loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 40,
            ),
            Text(
              'News ',
              style: TextStyle(color: Colors.black, fontSize: 10),
            )
          ],
        ),
      ),
      body: _loading
          ? Center(child: Container(child: CircularProgressIndicator()))
          : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: <Widget>[

              ///BLOG
              Container(
                  child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Blog(
                        title: articles[index].title,
                        desc: articles[index].description,
                        imageURL: articles[index].urlToImage,
                        url: articles[index].url,
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class Blog extends StatelessWidget {
  final String imageURL, title, desc , url;

  Blog({this.imageURL, this.title, this.desc , this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              blogUrl: url,
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(imageURL)),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 17 , fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: TextStyle(color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
