import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:travelaza/models/Article.dart';
import 'package:travelaza/views/indev.dart';

import 'package:travelaza/views/articles_page/add_articles_view.dart';
import 'package:travelaza/widgets/loading_cube.dart';
import 'package:travelaza/views/articles_page/article_detail_view.dart';

class ArticlesView extends StatelessWidget {
  Widget _cardUI(BuildContext context, DocumentSnapshot article) {
    return Card(
      color: Color.fromARGB(255, 246, 235, 244),
      margin: EdgeInsets.all(16),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleDetailView(
                    article: Article(
                        article['imageUrl'],
                        article['title'],
                        article['description'],
                        article['date'],
                        article['time']))),
          );
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  article['imageUrl'],
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
                    // Text(
                    //   article['time'],
                    //   style: TextStyle(
                    //       color: Colors.grey,
                    //       fontSize: 16,
                    //       fontStyle: FontStyle.italic),
                    // ),
                    Text(
                      article['date'],
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
                  article['title'],
                  style: TextStyle(
                      color: Color.fromARGB(255, 2, 59, 89),
                      fontSize: 27,
                      fontWeight: FontWeight.w600),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(14.0, 7, 14.0, 7),
              //   child: Text(
              //     article['description'],
              //     style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 17,
              //         fontWeight: FontWeight.w200),
              //   ),
              // ),
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 235, 244),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 246, 235, 244),
        elevation: 0.0,
        centerTitle: false,
        title: Text(
          'Articles',
          style: TextStyle(
              color: Color.fromARGB(255, 2, 59, 89),
              fontSize: 28,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('articles').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return loadingScreen();
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) =>
                        _cardUI(context, snapshot.data!.docs[index])
                    // {
                    //   Map<String, dynamic> articleMap = snapshot.data!.docs[index].data();
                    //   Article article = Article(
                    //       articleMap['imageUrl'],
                    //       articleMap['description'],
                    //       articleMap['date'],
                    //       articleMap['time']);
                    //   return _cardUI(article);
                    // },
                    );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Icon(Icons.add),
          backgroundColor: Color(0xFF1A395A),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddArticlesView()),
            );
          }),
    );
  }
}




// SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               // trip.getLocationImage()
//               height: 350,
//               padding: EdgeInsets.fromLTRB(6, 8, 6, 8),
//               child: Card(
//                 color: Color.fromARGB(255, 246, 235, 244),
//                 elevation: 10,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: InkWell(
//                   child: Container(
//                     color: Color.fromARGB(255, 234, 232, 236),
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
//                       child: Column(
//                         children: <Widget>[
//                           Padding(
//                             padding:
//                                 const EdgeInsets.fromLTRB(0, 40.0, 0, 10.0),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: AutoSizeText(
//                                     'Why Its the Perfect Time to visit Ladakh',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 25.0,
//                                       color: Color.fromARGB(255, 2, 59, 89),
//                                     ),
//                                     maxLines: 3,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 15.0),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   "Unni Kuttan",
//                                   textAlign: TextAlign.right,
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 22.0,
//                                     color: Color.fromARGB(255, 2, 59, 89),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 5.0),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: AutoSizeText(
//                                     'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been since the 1500s ...',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w200,
//                                       fontSize: 20.0,
//                                       color: Color.fromARGB(255, 2, 59, 89),
//                                     ),
//                                     maxLines: 4,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => InDev()),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),