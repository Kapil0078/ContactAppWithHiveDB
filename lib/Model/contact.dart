import 'package:hive/hive.dart';
part 'contact.g.dart';

@HiveType(typeId: 1)
class Contact {
  @HiveField(0)
  final dynamic key;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String mobile;
  @HiveField(3)
  final String? email;
  @HiveField(4)
  final String? dob;
  @HiveField(5)
  final List<String> group;
  @HiveField(6)
  final String? profile;

  Contact({
    this.key,
    required this.name,
    required this.mobile,
    this.email,
    this.dob,
    required this.group,
    this.profile,
  });

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "mobile": mobile,
        "email": email,
        "dob": dob,
        "group": group,
        "profile": profile,
      };

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        key: json["key"],
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        dob: json["dob"],
        group: List<String>.from(json["group"].map((e) => e)),
        profile: json["profile"],
      );
}
