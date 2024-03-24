import 'package:advanced_project/core/networking/api_service.dart';
import 'package:advanced_project/core/networking/dio_factory.dart';
import 'package:advanced_project/features/login/data/repos/login_repo.dart';
import 'package:advanced_project/features/login/logic/cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {

 Dio dio = await DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(()=>ApiService(dio));


  getIt.registerLazySingleton<LoginRepo>(()=>LoginRepo(getIt()));

  getIt.registerLazySingleton<LoginCubit>(()=>LoginCubit(getIt()));


}