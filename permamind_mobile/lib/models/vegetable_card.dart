
/*
* This class allow us to represent a vegetable
* */

class VegetableCard {
  final int id;
  final String vegetableName;
  final String imagePath;
  final String overview;

  VegetableCard(this.id,  this.vegetableName, this.imagePath, this.overview);

  VegetableCard.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        vegetableName = json['name'],
        imagePath = json['image_url'],
        overview = json['description'];

  @override
  bool operator==(dynamic other) => identical(this, other) || this.id == other.id;

  @override
  int get hashCode => id;
}