class UserModels {
  String? uid;
  String? Name;
  String? Email;
  String? Password;
  List<dynamic>? FriendsList = [];

  UserModels(
      {required this.uid,
      required this.Name,
      required this.Email,
      required this.Password,
      required this.FriendsList});

  UserModels.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    Name = json['Name'];
    Email = json['Email'];
    Password = json['Password'];
    FriendsList = json["FriendsList"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['Name'] = this.Name;
    data['Email'] = this.Email;
    data['Password'] = this.Password;
    data['FriendsList'] = this.FriendsList;
    return data;
  }
}
