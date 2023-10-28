import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:directoryappwithblock/data/entity/personModel.dart';
import 'package:firebase_core/firebase_core.dart';

class PersonRepo {

  var collectionperson = FirebaseFirestore.instance.collection("person");


  Future<void> addPerson(String name , String phone) async {
    var newperson = { "id" : "","name" :name,"phone": phone};
    collectionperson.add(newperson);
  }

  Future<void> updatePerson (String id ,String name , String phone) async {
    var updateperson = {"name" :name,"phone": phone};
    collectionperson.doc(id).update(updateperson);
  }

  Future<void> deletePerson (String id) async {
    collectionperson.doc(id).delete();
  }
}