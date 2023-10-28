import 'package:directoryappwithblock/data/entity/personModel.dart';
import 'package:directoryappwithblock/data/repo/personRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPersonCubit extends Cubit<void>{
  AddPersonCubit(): super(0);

  var personRepo = PersonRepo();

  Future<void> addPerson(String name , String phone) async {
    await personRepo.addPerson(name, phone);
  }

}