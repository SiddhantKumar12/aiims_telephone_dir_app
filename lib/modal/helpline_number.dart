class HelplineNumberModal {
  String name;
  String phone;
  String image;

  HelplineNumberModal({
    required this.name,
    required this.phone,
    required this.image,
  });

  factory HelplineNumberModal.fromJson(Map<String, dynamic> json) {
    return HelplineNumberModal(
      name: json['name'],
      phone: json['phone'],
      image: json['image'],
    );
  }
}
