import 'package:directoryappwithblock/data/entity/personModel.dart';
import 'package:directoryappwithblock/ui/cubit/personDetailCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonDetail extends StatefulWidget {
 final Person person;

  const PersonDetail({super.key, required this.person});

  @override
  State<PersonDetail> createState() => _PersonDetailState();
}

class _PersonDetailState extends State<PersonDetail> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  void initState() {
    nameController.text =widget.person.name;
    phoneController.text =widget.person.phone;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Person Detail" , style: TextStyle(fontSize: 24),),
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
                context.read<PersonDetailCubit>().updatePerson(widget.person.id ,nameController.text, phoneController.text);
              },style: ElevatedButton.styleFrom(minimumSize:const Size(30.0, 30.0)), child: const Text("Update" , style: TextStyle(fontSize: 24),))
            ],
          ),
        ),
      ),
    );
  }
}
