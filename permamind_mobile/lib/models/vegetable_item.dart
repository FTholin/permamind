
/*
* This class allow us to represent a vegetable
* */

class VegetableItem {
  final int id;
  final String vegetableName;
  final String imagePath;
  final String overview;

  VegetableItem({this.id,  this.vegetableName, this.imagePath, this.overview});

  factory VegetableItem.fromJSON(Map<String, dynamic> json) {
    return VegetableItem(
        id: json['id'],
        vegetableName: json['name'],
        imagePath: json['image_url'],
        overview: json['description']
    );
  }

  @override
  bool operator==(dynamic other) => identical(this, other) || this.id == other.id;

  @override
  int get hashCode => id;
}