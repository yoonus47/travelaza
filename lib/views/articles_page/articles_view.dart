import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:travelaza/models/Article.dart';
import 'package:travelaza/views/indev.dart';

import 'package:travelaza/views/articles_page/add_articles_view.dart';
import 'package:travelaza/widgets/loading_cube.dart';
import 'package:travelaza/models/Article.dart';

class ArticlesView extends StatelessWidget {
  Widget _cardUI(BuildContext context, DocumentSnapshot article) {
    return Card(
      color: Color.fromARGB(255, 246, 235, 244),
      margin: EdgeInsets.all(16),
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article['date'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  article['date'],
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            SizedBox(height: 10),
            Image.network(
              article['imageUrl'],
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              article['description'],
              style: TextStyle(color: Colors.black, fontSize: 20),
            )
          ],
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