import 'package:Duo/core/error/failures.dart';
import 'package:Duo/core/usecases/usecase.dart';
import 'package:Duo/features/account/domain/repositories/auth_repository.dart';
import 'package:Duo/features/account/domain/usecases/authorized_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  AuthorizedUseCase usecase;
  MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = AuthorizedUseCase(mockAuthRepository);
  });

  test(
    'should return unauthorized failure when the call to repository is unsuccessful',
    () async {
      // arrange
      when(mockAuthRepository.load())
          .thenAnswer((_) async => Left(CacheFailure()));

      // act
      final actual = await usecase(NoParams());

      // assert
      expect(actual, Left(Unauthorized()));
      verify(mockAuthRepository.load());
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
