import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:directoryappwithblock/data/entity/personModel.dart';
import 'package:directoryappwithblock/data/repo/personRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<List<Person>>{
  HomeCubit(): super(<Person>[]);


  var personRepo = PersonRepo();
  var collectionperson = FirebaseFirestore.instance.collection("person");

  Future<void> getPerson () async {
    collectionperson.snapshots().listen((event) {
      var list = <Person> [];
      var documents = event.docs;
      for(var doc in documents){
        var key = doc.id;
        list.add(Person.fromJson(doc.data(), key));
      }
      emit(list);
    });
  }


  Future<void> searchPerson (String name) async{
    collectionperson.snapshots().listen((event) {
      var list = <Person> [];
      var documents = event.docs;
      for(var doc in documents){
        var key = doc.id;
       var person =(Person.fromJson(doc.data(), key));
       if(person.name.toLowerCase().contains(name.toLowerCase())){
         list.add(person);
       }
      }
      emit(list);
    });
  }

  Future<void> deletePerson (String id) async{
    await personRepo.deletePerson(id);
  }
}