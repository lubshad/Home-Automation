class SwitchModel {
  String value;
  String status;

  SwitchModel({this.value, this.status});

  SwitchModel.fromJson(dynamic json) {
    this.value = json["Value"];
    this.status = json["Status"];
  }
}
