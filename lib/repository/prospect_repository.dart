import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled6/model/prospect.dart';

class ProspectRepository {
  final FirebaseFirestore store;

  ProspectRepository(this.store);

  Future<List<Prospect>> getProspectList() async {
    var response = await store.collection('prospect').get();
    if (response.docs.isEmpty) {
      return [];
    } else {
      return response.docs.map((e) => Prospect.fromJson(e.data(), e.id)).toList();
    }
  }

  saveProspect(Prospect prospect) async {
    await store.collection('prospect').add(prospect.toJson());
  }

  updateProspect(Prospect prospect) async {
     (await store.collection('prospect').doc(prospect.id).update(prospect.toJson()));
  }

  deleteProspect(Prospect prospect){
    store.collection('prospect').doc(prospect.id).delete();
  }
}
