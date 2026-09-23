import 'package:aurastate/core/services/firebase_auth_services.dart';
import 'package:aurastate/features/Auth/Data/Auth_repo_imple.dart';
import 'package:aurastate/features/Auth/Domain/Auth_repo.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;
void setupGetIt() {
  getit.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getit.registerSingleton<AuthRepo>(
    getit.registerSingleton<AuthRepoImple>(
      AuthRepoImple(getit<FirebaseAuthServices>()),
    ),
  );
}
