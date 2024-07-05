import '../../core/exceptions/auth_exceptions.dart';
import '../../core/fp/either.dart';

abstract interface class UserRepository {
  Future<Either<AuthException, String>> login(String email, String password);
}
