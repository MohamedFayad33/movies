import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api_service/api_service.dart';
import 'package:movies_app/core/routes/pages_routes_name.dart';
import 'package:movies_app/core/routes/route.dart';
import 'package:movies_app/core/theme/theme_manager.dart';
import 'package:movies_app/modules/auth/data/data_source/local_data_source.dart';
import 'package:movies_app/modules/auth/data/data_source/remote_data_source.dart';
import 'package:movies_app/modules/auth/data/repository/repository.dart';
import 'package:movies_app/modules/auth/domain/use_cases/login_use_case.dart';
import 'package:movies_app/modules/auth/domain/use_cases/register_use_case.dart';
import 'package:movies_app/modules/auth/presentaion/manger/login_bloc/bloc/login_bloc.dart';
import 'package:movies_app/modules/auth/presentaion/manger/register_bloc/register_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthLocalDataSource.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(
            RegisterUseCase(
              authRepo: AuthRepoImpl(
                authRemoteDataSource: AuthRemoteDataSourceImpl(ApiService()),
                authLocalDataSource: AuthLocalDataSource(),
              ),
            ),
          ),
        ),

        BlocProvider(
          create: (context) => LoginBloc(
            LoginUseCase(
              authRepo: AuthRepoImpl(
                authRemoteDataSource: AuthRemoteDataSourceImpl(ApiService()),
                authLocalDataSource: AuthLocalDataSource(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Movies',
        theme: ThemeManager.theme,
        initialRoute: PagesRoutesName.login,
        routes: Routes.routes,
      ),
    );
  }
}
