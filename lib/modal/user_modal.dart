class UserModal {
  int? id;
  String? username;
  String? password;
  String? firstName;
  String? lastName;
  String? email;
  String? phone; // Changed type from Null? to String?
  bool? enabled;
  String? profile;
  // List<Authorities>? authorities;
  // List<Userroles>? userroles;
  bool? accountNonLocked;
  bool? credentialsNonExpired;
  bool? accountNonExpired;

  UserModal({
    this.id,
    this.username,
    this.password,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.enabled,
    this.profile,
    // this.authorities,
    // this.userroles,
    this.accountNonLocked,
    this.credentialsNonExpired,
    this.accountNonExpired,
  });

  UserModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    enabled = json['enabled'];
    profile = json['profile'];
    // if (json['authorities'] != null) {
    //   authorities = <Authorities>[];
    //   json['authorities'].forEach((v) {
    //     authorities!.add(Authorities.fromJson(v));
    //   });
    // }
    // if (json['userroles'] != null) {
    //   userroles = <Userroles>[];
    //   json['userroles'].forEach((v) {
    //     userroles!.add(Userroles.fromJson(v));
    //   });
    // }
    accountNonLocked = json['accountNonLocked'];
    credentialsNonExpired = json['credentialsNonExpired'];
    accountNonExpired = json['accountNonExpired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] =
        phone; // Ensure phone is added to JSON with its current value (String or null)
    data['enabled'] = enabled;
    data['profile'] = profile;
    // if (authorities != null) {
    //   data['authorities'] = authorities!.map((v) => v.toJson()).toList();
    // }
    // if (userroles != null) {
    //   data['userroles'] = userroles!.map((v) => v.toJson()).toList();
    // }
    data['accountNonLocked'] = accountNonLocked;
    data['credentialsNonExpired'] = credentialsNonExpired;
    data['accountNonExpired'] = accountNonExpired;
    return data;
  }
}
