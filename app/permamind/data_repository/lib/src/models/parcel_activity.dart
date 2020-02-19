import 'package:data_repository/src/entities/entities.dart';
import 'package:equatable/equatable.dart';

class Activity extends Equatable {

  final String id;
  final String gardenId;
  final String parcelId;
  final String title;
  final bool complete;
  final DateTime expectedDate;
  final String category;
  final String completeActivityUserId;

  Activity(
      this.title,
      this.gardenId,
      this.parcelId,
      this.complete,
      this.expectedDate,
      this.category,
      this.completeActivityUserId,
      {String id})
      : this.id = id;

  Activity copyWith({
    String id,
    String title,
    String gardenId,
    String parcelId,
    bool complete,
    DateTime expectedDate,
    String category,
    String completeActivityUserId
  }) {
    return Activity(
      title ?? this.title,
      gardenId ?? this.gardenId,
      parcelId ?? this.parcelId,
      complete ?? this.complete,
      expectedDate ?? this.expectedDate,
      category ?? this.category,
      completeActivityUserId ?? this.completeActivityUserId,
      id: id ?? this.id,
    );
  }


  @override
  int get hashCode =>
      id.hashCode ^ gardenId.hashCode ^ complete.hashCode ^ expectedDate.hashCode ^ title.hashCode ^ parcelId.hashCode;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Activity &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title &&
              gardenId == other.gardenId &&
              parcelId == other.parcelId &&
              complete == other.complete &&
              category == other.category &&
              expectedDate == other.expectedDate;


  ActivityEntity toEntity() {
    return ActivityEntity(
        id,
        title,
        gardenId,
        parcelId,
        complete,
        expectedDate,
        category,
        completeActivityUserId
    );
  }

  static Activity fromEntity(ActivityEntity entity) {

    return Activity(
      entity.title,
      entity.gardenId,
      entity.parcelId,
      entity.complete,
      entity.expectedDate,
      entity.category,
      entity.completeActivityUserId,
      id: entity.id,
    );
  }

  @override
  String toString() {
    return "Activity {parcelId: $parcelId, title: $title, complete: $complete}";
  }
}

//class PlanningDay {
//  List<Activity> dayActivities = new List<Activity>();
//
//  PlanningDay.fromMap(Map<dynamic, dynamic> data)
//      :
//        dayActivities = data['activities'].map<Activity>((item) {
//          return Activity.fromMap(item);
//        }).toList();
//
//  Map<String, Object> toJson() {
//    return {
//      'activities': dayActivities.map((item) {
//        return item.toJson();
//    }).toList()
//    };
//  }
//}