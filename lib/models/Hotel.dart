class Hotel {
  String? id;
  String? name;
  String? address;
  String? language;
  String? phone;
  String? email;
  String? place;
  String? placeId;
  String? image;

  Hotel(
      {this.id,
        this.name,
        this.address,
        this.language,
        this.phone,
        this.email,
        this.place,
        this.placeId,
        this.image});

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['name'];
    address = json['address'];
    language = json['language'];
    phone = json['phone'];
    email = json['email'];
    place = json['place'];
    placeId = json['placeId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['language'] = this.language;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['place'] = this.place;
    data['placeId'] = this.placeId;
    data['image'] = this.image;
    return data;
  }
}