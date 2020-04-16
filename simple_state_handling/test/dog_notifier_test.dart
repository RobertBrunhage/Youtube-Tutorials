import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_state_handling/models/dog.dart';

import 'package:simple_state_handling/providers/dog_notifier.dart';
import 'package:simple_state_handling/services/api.dart';

class MockDogApi extends Mock implements Api<Dog> {}

void main() {
  test('Given mockDog When fetchDog is called Then dog and mockDog should be the same', () async {
    final mockApi = MockDogApi();
    final dog = Dog(image: "", status: "");
    when(mockApi.fetch()).thenAnswer((_) => Future.value(dog));

    final dogNotifier = DogNotifier(mockApi);

    await dogNotifier.fetchDog();
    expect(dogNotifier.dog, dog);
  });
}
