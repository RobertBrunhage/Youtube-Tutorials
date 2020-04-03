class Todo {
  static const idField = 'id';
  static const nameField = 'name';
  static const infoField = 'info';
  static const isDeletedField = 'isDeleted';

  int id;
  String name;
  String info;
  bool isDeleted;

  Todo(this.name, this.info, this.isDeleted);

  Todo.fromJson(Map<String, dynamic> json) {
    this.id = json[idField];
    this.name = json[nameField];
    this.info = json[infoField];
    this.isDeleted = json[isDeletedField] == 1;
  }

  Map<String, dynamic> toJson() => {
        idField: this.id,
        idField: this.name,
        infoField: this.info,
        isDeletedField: this.isDeleted ? 1 : 0,
      };
}
