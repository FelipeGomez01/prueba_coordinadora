import '../data/repositories/home_repository.dart';
import '../domain/use_cases/home_use_case.dart';

class HomeUseCaseDI{
  HomeUseCaseDI();

  HomeUseCase get homeUseCase {
    return HomeUseCase(HomeRepository());
  }
}

final HomeUseCaseDI homeDI = HomeUseCaseDI();