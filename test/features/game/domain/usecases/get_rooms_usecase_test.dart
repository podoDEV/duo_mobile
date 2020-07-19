import 'package:Duo/features/game/domain/entities/game_category.dart';
import 'package:Duo/features/game/domain/entities/room.dart';
import 'package:Duo/features/game/domain/repositories/game_repository.dart';
import 'package:Duo/features/game/domain/usecases/get_rooms_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  GetRoomsUseCase usecase;
  MockGameRepository mockGameRepository;

  setUp(() {
    mockGameRepository = MockGameRepository();
    usecase = GetRoomsUseCase(mockGameRepository);
  });

  final rooms = [Room(id: '1'), Room(id: '2')];

  test(
    'should get all rooms from the repository',
    () async {
      // arrange
      final params =
          RoomsGetParams(category: GameCategory.overwatch, pageNumber: 0);
      final expected = rooms;
      when(mockGameRepository.rooms(params))
          .thenAnswer((_) async => Right(rooms));

      // act
      final actual = await usecase(params);

      // assert
      expect(actual, Right(expected));
      verify(mockGameRepository.rooms(params));
      verifyNoMoreInteractions(mockGameRepository);
    },
  );
}
