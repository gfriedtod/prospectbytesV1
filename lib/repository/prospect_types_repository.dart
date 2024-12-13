import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled6/model/prospect_types.dart';

class ProspectTypesRepository {
  final FirebaseFirestore store;

  ProspectTypesRepository(this.store);

  Future<List<ProspectTypes>> getProspectTypes() async {
    var response = await store.collection('prospect_types').get();
    if (response.docs.isEmpty) {
      return [];
    } else {
      return response.docs
          .map((e) => ProspectTypes.fromJson(e.data()))
          .toList();
    }
  }
}
