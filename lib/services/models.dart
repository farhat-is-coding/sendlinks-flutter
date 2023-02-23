import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';


@JsonSerializable()
class User{
  late String name;
  String pfp_url;
  Map socials;
  User({this.name="", this.pfp_url="", this.socials= const {} }); //make sure name of variable is same that are in firestore

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}