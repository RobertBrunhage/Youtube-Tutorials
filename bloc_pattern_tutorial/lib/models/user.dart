class User{
  User(this.name, this.age, this.height);
  User.empty(){
    this.name = "";
    this.age = 0;
    this.height = 0.0;
  }

  String name;
  int age;
  double height;
}