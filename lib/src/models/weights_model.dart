import 'dart:convert';

WeightsModel weightsModelFromJson(Map<String, dynamic>? data) =>
    WeightsModel.fromJson(data!);

String weightsModelToJson(WeightsModel data) => json.encode(data.toJson());

class WeightsModel {
  WeightsModel({
    required this.time,
    required this.value,
  });

  final int time;
  final String value;

  factory WeightsModel.fromJson(Map<String, dynamic> json) => WeightsModel(
        time: json["time"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "value": value,
      };
}
