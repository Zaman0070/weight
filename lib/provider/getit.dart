
import 'package:get_it/get_it.dart';

import '../service/navigation_service.dart';
import '../view/auth_screen_view_model.dart';
import '../view/details_screen_view_model.dart';
import '../view/home_screen_view_model.dart';
import '../view/user_profile_view_model.dart';


GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerFactory(() => DetailsScreenViewModel());
  getIt.registerFactory(() => HomeScreenViewModel());
  getIt.registerFactory(() => UserProfileViewModel());
  getIt.registerFactory(() => AuthScreenViewModel());
}
