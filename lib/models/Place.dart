class Place {
  String? id;
  String? name;
  String? province;
  String? address;
  String? amount;
  String? youthAmount;
  String? adultAmount;
  String? childAmount;
  String? wifi;
  String? smoke;
  String? maxGuests;
  String? rating;
  String? image;
  String? about;
  String? famous;

  Place(
      {this.id,
        this.name,
        this.province,
        this.address,
        this.amount,
        this.youthAmount,
        this.adultAmount,
        this.childAmount,
        this.wifi,
        this.smoke,
        this.maxGuests,
        this.rating,
        this.image,
        this.about,
        this.famous});

  Place.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['name'];
    province = json['province'];
    address = json['address'];
    amount = json['amount'];
    youthAmount = json['youthAmount'];
    adultAmount = json['adultAmount'];
    childAmount = json['childAmount'];
    wifi = json['wifi'];
    smoke = json['smoke'];
    maxGuests = json['maxGuests'];
    rating = json['rating'];
    image = json['image'];
    about = json['about'];
    famous = json['famous'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['name'] = this.name;
    data['province'] = this.province;
    data['address'] = this.address;
    data['amount'] = this.amount;
    data['youthAmount'] = this.youthAmount;
    data['adultAmount'] = this.adultAmount;
    data['childAmount'] = this.childAmount;
    data['wifi'] = this.wifi;
    data['smoke'] = this.smoke;
    data['maxGuests'] = this.maxGuests;
    data['rating'] = this.rating;
    data['image'] = this.image;
    data['about'] = this.about;
    data['famous'] = this.famous;
    return data;
  }
}