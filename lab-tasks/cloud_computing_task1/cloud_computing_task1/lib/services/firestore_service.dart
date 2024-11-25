import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/social_media_group.dart';

Class FirestoreService {
  final FirebaseFirestore _finalstore = FirebaseFirestore.instance;

  Future<void> addGroup(SocialMediaGroup group) async{
    awiat _firestore.collection('socail_media_groups').add(group.toMap());
  }

  Stream<List<SocialMediaGroup>> getGroups(){
    return _firestore.collection('socail_media_groups').snapshots().map(
      (snapshot) => snapshot.docs.map((doc)=>SocialMediaGroup.fromMap(doc.data())).toList());
    
  }

}