// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task {
 int? id;
 String? name;
 String? note;
 int? isCompleted;
 String? date;
 String? startTime;
 String? endTime;
 int? color;
 int? remind;
 String? repeat;


  Task({
    this.id,
    this.name,
    this.note,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.remind,
    this.repeat,
 });

 Map <String,dynamic> tojson(){
  return <String,dynamic>{
      'id': id,
      'name': name,
      'note': note,
      'isCompleted': isCompleted,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'color': color,
      'remind': remind,
      'repeat': repeat,
  };
 }

 Task.fromjson(
  Map <String,dynamic> json
 ){
      id = json['id'] ;
      name= json['name'];
      note = json['note'] ;
      isCompleted=  json['isCompleted'] ;
      date= json['date'] ;
      startTime= json['startTime'] ;
      endTime= json['endTime'] ;
      color= json['color'] ;
      remind= json['remind'] ;
      repeat= json['repeat'];
 }
}

