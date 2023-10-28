import 'package:directoryappwithblock/data/entity/personModel.dart';
import 'package:directoryappwithblock/data/repo/personRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonDetailCubit extends Cubit<void>{
  PersonDetailCubit(): super(0);

  var personRepo = PersonRepo();

  Future<void> updatePerson (String id ,String name , String phone) async {
     await personRepo.updatePerson(id, name, phone);
  }
}