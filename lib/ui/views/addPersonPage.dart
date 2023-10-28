import 'package:directoryappwithblock/ui/cubit/addPersonCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entity/personModel.dart';

class AddPersonPage extends StatefulWidget {

  const AddPersonPage({super.key});


  @override
  State<AddPersonPage> createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Person" , style: TextStyle(fontSize: 24),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0,right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: nameController,style:const  TextStyle(fontSize: 20),decoration:const InputDecoration(label: Text("Name")),),
              TextField(controller: phoneController,style:const  TextStyle(fontSize: 20),decoration:const InputDecoration(label: Text("Phone")),),
              ElevatedButton(onPressed: (){
                context.read<AddPersonCubit>().addPerson(nameController.text, phoneController.text);
              },style: ElevatedButton.styleFrom(minimumSize:const Size(30.0, 30.0)), child: const Text("Save" , style: TextStyle(fontSize: 24),))
            ],
          ),
        ),
      ),
    );
  }
}
