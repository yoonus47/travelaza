import 'package:flutter/material.dart';
import 'package:travelaza/models/Article.dart';

class ArticleDetailView extends StatelessWidget {
  final Article article;
  const ArticleDetailView({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 235, 244),
      appBar: AppBar(
        title: Text('Article'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: new Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            // borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.network(
              article.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 7, 14.0, 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.time,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  article.date,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 7, 14.0, 7),
            child: Text(
              article.title,
              style: TextStyle(
                  color: Color.fromARGB(255, 2, 59, 89),
                  fontSize: 27,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 7, 14.0, 7),
            child: Text(
              article.description,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w200),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 20, 14.0, 7),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: CircleAvatar(
                    radius: 19,
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/03/03/20/42/man-657869_1280.jpg'), //image url
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Column(
                    children: [
                      Text(
                        'KK Rogan',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      // Text(
                      //   article['date'],
                      //   style: TextStyle(
                      //     color: Colors.grey,
                      //     fontSize: 15,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
