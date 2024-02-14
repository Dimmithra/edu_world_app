class GetAllCategorModel {
  List<GetAllCategorModelData>? data;

  GetAllCategorModel({this.data});

  GetAllCategorModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetAllCategorModelData>[];
      json['data'].forEach((v) {
        data!.add(new GetAllCategorModelData.fromJson(v));
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

class GetAllCategorModelData {
  int? catid;
  String? name;

  GetAllCategorModelData({this.catid, this.name});

  GetAllCategorModelData.fromJson(Map<String, dynamic> json) {
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
