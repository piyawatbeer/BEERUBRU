import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  // Explicit
  // List<String> names = ['aa', 'bb', 'cc'];
  List<DocumentSnapshot> snapshots;
  //Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('Product');
    StreamSubscription<QuerySnapshot> subscription =
        await collectionReference.snapshots().listen((dataSnapshot) {
      snapshots = dataSnapshot.documents;
      for (var mySnapshot in snapshots) {
        String name = mySnapshot.data['Name'];
        print('name = $name');
        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('This is ListProduct');
  }
}
