class ShopEntry {
  String imgPath;
  String name;
  String id;
  String price;

  ShopEntry({this.id, this.name, this.price, this.imgPath});

  factory ShopEntry.fromJson(Map<String, dynamic> json){
    return ShopEntry(
      id: json['id'],
      name: json['name'],
      imgPath: json['resources']['resource'][0]['xlink:href'] + '?width=300,height=300'
    );
  }
}