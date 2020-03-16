import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BusFilter extends StatefulWidget {
  @override
  _BusFilterState createState() => _BusFilterState();
}

class _BusFilterState extends State<BusFilter> {
  final db = Firestore.instance;

  String searchText;

  // Container for searched

  Container searcedItem(DocumentSnapshot a, BuildContext ctx) {

   return  Container(
      color: Colors.blueAccent,
      height: 160.0,
      width: MediaQuery.of(ctx).size.width * 1,
      margin: EdgeInsets.only(
        left: 5.0,
        right: 5.0,
        top: 10.0,
      ),
      child: Card(
        elevation: 20.0,
        child: Container(
          color: Color.fromRGBO(26, 27, 45, 1),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  a.data['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  a.data['route'],
                  style: TextStyle(
                    color: Colors.amberAccent,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  "Departure: ${a.data['depart']}",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Coach No: ${a.data['coach']}",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.amberAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  // Container for main display list
  Container buildItem(DocumentSnapshot doc, BuildContext ctx) {
    return Container(
      color: Colors.blueAccent,
      height: 160.0,
      width: MediaQuery.of(ctx).size.width * 1,
      margin: EdgeInsets.only(
        left: 5.0,
        right: 5.0,
        top: 10.0,
      ),
      child: Card(
        elevation: 20.0,
        child: Container(
          color: Color.fromRGBO(26, 27, 45, 1),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  doc.data['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  doc.data['route'],
                  style: TextStyle(
                    color: Colors.amberAccent,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  "Departure: ${doc.data['depart']}",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Coach No: ${doc.data['coach']}",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.amberAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus app'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                hintText: '  Search with Coach Number...',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              onChanged: (text){

                text = text.toUpperCase();

                setState(() {
                  searchText = text; 
                });

              },
            ),
            searchText == null ? StreamBuilder<QuerySnapshot>(
              stream: db.collection('BUSES').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {

                  return Column(
                    children: snapshot.data.documents
                        .map((doc) => buildItem(doc, context))
                        .toList(),
                  );
                } else {
                  return SizedBox();
                }
              },
            ) : StreamBuilder<QuerySnapshot>(
              stream: db.collection('BUSES').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                final results =
                snapshot.data.documents.where((DocumentSnapshot a)
                 => a.data['coach'].toString().contains(searchText));
                  return Column(
                    children: results.map<Widget>((a) => 
                    searcedItem(a, context)).toList(),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
