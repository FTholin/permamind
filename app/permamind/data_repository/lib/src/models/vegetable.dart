import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/entities/entities.dart';
import 'package:intl/intl.dart';

class Vegetable {
  final String id;
  final String name;
  final DateTime seasonPeriodStartDate;
  final DateTime seasonPeriodEndDate;


  Vegetable(
      this.name,
      this.seasonPeriodStartDate,
      this.seasonPeriodEndDate,
      {String id})
      : this.id = id;

  Vegetable copyWith({String id,
    String name,
    seasonPeriodStartDate,
    seasonPeriodEndDate
  }) {
    return Vegetable(
        name ?? this.name,
        seasonPeriodStartDate ?? this.seasonPeriodStartDate,
        seasonPeriodEndDate ?? this.seasonPeriodEndDate,
        id: id ?? this.id
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Vegetable &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              seasonPeriodStartDate == other.seasonPeriodStartDate &&
              seasonPeriodEndDate == other.seasonPeriodEndDate;

  @override
  String toString() {
    return 'Vegetable { id: $id, name: $name,}';
  }

  VegetableEntity toEntity() {
    return VegetableEntity(
        id, name, seasonPeriodStartDate, seasonPeriodEndDate
    );
  }

  static Vegetable fromEntity(VegetableEntity entity) {
    return Vegetable(
      entity.name,
      entity.seasonPeriodStartDate,
      entity.seasonPeriodEndDate,
      id: entity.id,
    );
  }
}

