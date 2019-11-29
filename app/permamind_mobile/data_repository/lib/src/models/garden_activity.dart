class Activity {
  String name;
  bool complete;

  Activity.fromMap(Map<dynamic, dynamic> data)
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

class PlanningDay {
  List<Activity> dayActivities = new List<Activity>();

  PlanningDay.fromMap(Map<dynamic, dynamic> data)
      :
        dayActivities = data['activities'].map<Activity>((item) {
          return Activity.fromMap(item);
        }).toList();

  Map<String, Object> toJson() {
    return {
      'activities': dayActivities.map((item) {
        return item.toJson();
    }).toList()
    };
  }
}