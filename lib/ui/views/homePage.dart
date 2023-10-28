import 'package:directoryappwithblock/data/entity/personModel.dart';
import 'package:directoryappwithblock/data/repo/personRepo.dart';
import 'package:directoryappwithblock/ui/cubit/homeCubit.dart';
import 'package:directoryappwithblock/ui/views/addPersonPage.dart';
import 'package:directoryappwithblock/ui/views/personDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  @override
  void initState() {
    context.read<HomeCubit>().getPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: isSearch==false ?
         const Text("Contacts", style: TextStyle(fontSize: 24),):
          TextField(controller: searchController, focusNode: searchFocusNode, style:const TextStyle(fontSize: 24),decoration: const InputDecoration(hintText: "Search"),
            onChanged: (value){
              context.read<HomeCubit>().searchPerson(value);
            },),
          actions: [
            isSearch == false ?
                IconButton(onPressed: (){
                  setState(() {
                    isSearch = true;
                    searchFocusNode.requestFocus();
                  });
                  searchFocusNode.requestFocus();
                }, icon:const Icon(Icons.search_outlined))
                :
            IconButton(onPressed: (){
              setState(() {
                isSearch = false;
                searchFocusNode.unfocus();
              });
              context.read<HomeCubit>().getPerson();
            }, icon:const Icon(Icons.clear)),
          ],
        ),
        body: BlocBuilder<HomeCubit, List<Person>>(
            builder: (context,list) {
                    if (list.isNotEmpty) {
                      return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            var person = list[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) =>
                                        PersonDetail(person: person)));},
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(person.name,
                                            style: const TextStyle(
                                                fontSize: 20),),
                                          Text(person.phone,
                                            style: const TextStyle(
                                                fontSize: 20),),
                                        ],
                                      ),
                                      IconButton(onPressed: (){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                              content: Text("${list[index].name}  kişisi silinsin mi?"),
                                            action: SnackBarAction(label: "Evet", onPressed: (){
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                  content: Text("${list[index].name}  kişisi silindi."),));
                                              context.read<HomeCubit>().deletePerson(list[index].id);
                                            }),
                                          ),

                                        );
                                      }, icon:const  Icon(Icons.clear))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center();
                    }

            }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) =>
                 const AddPersonPage()));
        },
      ),
    );
  }
}
