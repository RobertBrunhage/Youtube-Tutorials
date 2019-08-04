enum Category { Games, Food }

class AppVariables {
  static String getCategoryString(Category category) {
    switch (category) {
      case Category.Food:
        return 'Food';
      case Category.Games:
        return 'Games';
      default:
        return 'Error, no category';
    }
  }
}
