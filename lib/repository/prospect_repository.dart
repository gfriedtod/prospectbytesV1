import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:untitled6/model/prospect.dart';

class ProspectRepository {
  final FirebaseFirestore store;

  ProspectRepository(this.store);

  Future<List<Prospect>> getProspectList() async {
    var response = await store.collection('prospect').get();
    if (response.docs.isEmpty) {
      return [];
    } else {
      print(response.docs);
     return response.docs.map((e) => Prospect.fromJson(e.data())).toList();
    }
  }

  saveProspect(Prospect prospect) async {
    await store
        .collection('prospect')
        .add(prospect.toJson() as Map<String, dynamic>);
  }
}
