class ModelingActivity {
  String name;
  bool complete;

  ModelingActivity.fromMap(Map<dynamic, dynamic> data)
      : name = data['name'],
        complete = data['complete'];

  Map<String, Object> toJson() {
    return {
      'name': name,
      'complete': complete,
    };
  }

  @override
  String toString() {
    return name;
  }
}

class ModelingSchedule {
  List<ModelingActivity> dayActivities = new List<ModelingActivity>();

  ModelingSchedule.fromMap(Map<dynamic, dynamic> data)
      :
        dayActivities = data['activities'].map<ModelingActivity>((item) {
          return ModelingActivity.fromMap(item);
        }).toList();

  Map<String, Object> toJson() {
    return {
      'activities': dayActivities.map((item) {
        return item.toJson();
      }).toList()
    };
  }
}