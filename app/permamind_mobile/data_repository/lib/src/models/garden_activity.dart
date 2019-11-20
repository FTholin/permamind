class Activity {
  String name;
  bool isDone;

  Activity.fromMap(Map<dynamic, dynamic> data)
      : name = data['name'],
        isDone = data['isDone'];

  Map<String, Object> toJson() {
    return {
      'name': name,
      'isDone': isDone,
    };
  }
}

class PlanningDay {
  String dayValue;
  List<Activity> dayActivities = new List<Activity>();

  PlanningDay.fromMap(Map<dynamic, dynamic> data)
      : dayValue = data['dayValue'],
        dayActivities = data['activities'].map<Activity>((item) {
          return Activity.fromMap(item);
        }).toList();

  Map<String, Object> toJson() {
    return {
      'dayValue': dayValue,
      'activities': dayActivities.map((item) {
        return item.toJson();
    }).toList()
    };
  }
}