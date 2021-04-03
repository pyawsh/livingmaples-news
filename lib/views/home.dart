import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:livingmaples_news/helper/data.dart';
import 'package:livingmaples_news/helper/news.dart';
import 'package:livingmaples_news/models/article_model.dart';
import 'package:livingmaples_news/models/category_model.dart';
import 'article_view.dart';
import 'category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
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
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: <Widget>[
                    ///Categories
                    Container(
                      height: 70,
                      child: ListView.builder(
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTitle(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      ),
                    ),

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

class CategoryTitle extends StatelessWidget {
  final String imageUrl, categoryName;

  CategoryTitle({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryNews(
          category : categoryName.toLowerCase())
        )
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  imageUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
                )),
            Container(
                alignment: Alignment.center,
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // color: Colors.black
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2 , vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3)
                  ),
                  child: Text(
                    categoryName,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500, ),
                  ),
                ))
          ],
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
