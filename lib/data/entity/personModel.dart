class Person {

  final String id;
  final String name;
  final String phone;

  Person({required this.id, required this.name, required this.phone});

  factory Person.fromJson(Map<dynamic,dynamic> json ,String key){
    return Person(id: key, name: json["name"] as String, phone: json["phone"] as String);
  }
}