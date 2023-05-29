import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_picks/consts/firebase_const.dart';

class Firestoreservices {
  static getUser(uid){
    return firestore.collection(usersCollection).where('id',isEqualTo: uid).snapshots();
    
  }

   final FirebaseFirestore _db = FirebaseFirestore.instance;

  
  }

