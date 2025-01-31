class UserModel {
  final String? id;
  final String name;

  UserModel({this.id, required this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['name'],
    );
  }

  /// Converts this object to a JSON object.
  ///
  /// This method is used by the `jsonEncode` function to convert this object to a
  /// JSON object. It is also used by the `UserModel.fromJson` factory to create an
  /// instance of this class from a JSON object.
  ///
  /// The keys of the JSON object are the following:
  ///
  /// - `_id`: The id of the user.
  /// - `name`: The name of the user.
  ///
  /// The values of the JSON object are the corresponding values of the instance
  /// variables of this class.
  ///
  /// Returns the JSON object.
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}
