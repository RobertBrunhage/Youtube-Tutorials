class Dog {
  String image;
  String status;

  Dog({this.image, this.status});

  Dog.initial() {
    image = "https://images.dog.ceo/breeds/pembroke/n02113023_6383.jpg";
    status = "success";
  }

  Dog.fromJson(Map<String, dynamic> json) {
    image = json['message'] as String;
    status = json['status'] as String;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': image,
        'status': status,
      };
}
