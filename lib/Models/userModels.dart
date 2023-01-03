class UserModels {
  String? uid;
  String? Name;
  String? Email;
  String? Password;
  UserModels({this.uid, this.Name, this.Email, this.Password});

  UserModels.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    Name = map["Name"];
    Email = map["Email"];
    Password = map["Password"];
  }
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "Name": Name,
      "Email": Email,
      "Password": Password,
    };
  }
}
