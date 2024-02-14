class GetAllBookDataModel {
  List<Data>? data;

  GetAllBookDataModel({this.data});

  GetAllBookDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? bookId;
  String? bookName;
  String? firebaseUrl;
  Subcategory? subcategory;
  String? firebaseImage;
  dynamic description;
  Data({
    this.bookId,
    this.bookName,
    this.firebaseUrl,
    this.subcategory,
    this.firebaseImage,
    this.description,
  });

  Data.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    bookName = json['book_name'];
    firebaseUrl = json['firebase_url'];
    subcategory = json['subcategory'] != null
        ? new Subcategory.fromJson(json['subcategory'])
        : null;
    firebaseImage = json['firebase_image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['book_id'] = this.bookId;
    data['book_name'] = this.bookName;
    data['firebase_url'] = this.firebaseUrl;
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory!.toJson();
    }
    data['firebase_image'] = this.firebaseImage;
    data['description'] = this.description;
    return data;
  }
}

class Subcategory {
  int? sutid;
  String? name;
  Cats? cats;

  Subcategory({this.sutid, this.name, this.cats});

  Subcategory.fromJson(Map<String, dynamic> json) {
    sutid = json['sutid'];
    name = json['name'];
    cats = json['cats'] != null ? new Cats.fromJson(json['cats']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sutid'] = this.sutid;
    data['name'] = this.name;
    if (this.cats != null) {
      data['cats'] = this.cats!.toJson();
    }
    return data;
  }
}

class Cats {
  int? catid;
  String? name;

  Cats({this.catid, this.name});

  Cats.fromJson(Map<String, dynamic> json) {
    catid = json['catid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catid'] = this.catid;
    data['name'] = this.name;
    return data;
  }
}
