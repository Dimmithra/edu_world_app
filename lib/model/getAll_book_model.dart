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

  Data(
      {this.bookId,
      this.bookName,
      this.firebaseUrl,
      this.subcategory,
      this.firebaseImage});

  Data.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    bookName = json['book_name'];
    firebaseUrl = json['firebase_url'];
    subcategory = json['subcategory'] != null
        ? new Subcategory.fromJson(json['subcategory'])
        : null;
    firebaseImage = json['firebase_image'];
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
// import 'dart:convert';

// class GetAllBookDataModel {
//   List<Datum>? data;

//   GetAllBookDataModel({
//     this.data,
//   });

//   factory GetAllBookDataModel.fromRawJson(String str) =>
//       GetAllBookDataModel.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory GetAllBookDataModel.fromJson(Map<String, dynamic> json) =>
//       GetAllBookDataModel(
//         data: json["data"] == null
//             ? []
//             : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class Datum {
//   int? bookId;
//   String? bookName;
//   String? firebaseUrl;
//   Subcategory? subcategory;
//   String? firebaseImage;

//   Datum({
//     this.bookId,
//     this.bookName,
//     this.firebaseUrl,
//     this.subcategory,
//     this.firebaseImage,
//   });

//   factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         bookId: json["book_id"],
//         bookName: json["book_name"],
//         firebaseUrl: json["firebase_url"],
//         subcategory: json["subcategory"] == null
//             ? null
//             : Subcategory.fromJson(json["subcategory"]),
//         firebaseImage: json["firebase_image"],
//       );

//   Map<String, dynamic> toJson() => {
//         "book_id": bookId,
//         "book_name": bookName,
//         "firebase_url": firebaseUrl,
//         "subcategory": subcategory?.toJson(),
//         "firebase_image": firebaseImage,
//       };
// }

// class Subcategory {
//   int? sutid;
//   String? name;
//   Cats? cats;

//   Subcategory({
//     this.sutid,
//     this.name,
//     this.cats,
//   });

//   factory Subcategory.fromRawJson(String str) =>
//       Subcategory.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
//         sutid: json["sutid"],
//         name: json["name"],
//         cats: json["cats"] == null ? null : Cats.fromJson(json["cats"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "sutid": sutid,
//         "name": name,
//         "cats": cats?.toJson(),
//       };
// }

// class Cats {
//   int? catid;
//   String? name;
//   // Remove HibernateLazyInitializer field from here

//   Cats({
//     this.catid,
//     this.name,
//   });

//   factory Cats.fromRawJson(String str) => Cats.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Cats.fromJson(Map<String, dynamic> json) => Cats(
//         catid: json["catid"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "catid": catid,
//         "name": name,
//       };
// }
