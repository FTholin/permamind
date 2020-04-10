import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/entities/entities.dart';
import 'package:intl/intl.dart';

class Vegetable {
  final String id;
  final String imageName;
  final String nameFr;
  final String nameEn;
  final DateTime seasonPeriodStartDate;
  final DateTime seasonPeriodEndDate;


  Vegetable(
      this.nameFr,
      this.nameEn,
      this.imageName,
      this.seasonPeriodStartDate,
      this.seasonPeriodEndDate,
      {String id})
      : this.id = id;

  Vegetable copyWith({String id,
    String imageName,
    seasonPeriodStartDate,
    seasonPeriodEndDate
  }) {
    return Vegetable(
        imageName ?? this.imageName,
        nameFr ?? this.nameFr,
        nameEn ?? this.nameEn,
        seasonPeriodStartDate ?? this.seasonPeriodStartDate,
        seasonPeriodEndDate ?? this.seasonPeriodEndDate,
        id: id ?? this.id
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ imageName.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Vegetable &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              imageName == other.imageName &&
              nameFr == other.nameFr &&
              nameEn == other.nameEn &&
              seasonPeriodStartDate == other.seasonPeriodStartDate &&
              seasonPeriodEndDate == other.seasonPeriodEndDate;

  @override
  String toString() {
    return 'Vegetable { id: $id, imageName: $imageName,}';
  }

  VegetableEntity toEntity() {
    return VegetableEntity(
        id, nameFr, nameEn, imageName, seasonPeriodStartDate, seasonPeriodEndDate
    );
  }

  static Vegetable fromEntity(VegetableEntity entity) {
    return Vegetable(
      entity.nameFr,
      entity.nameEn,
      entity.imageName,
      entity.seasonPeriodStartDate,
      entity.seasonPeriodEndDate,
      id: entity.id,
    );
  }
}

