import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api_service/api_endpoint.dart';
import 'package:movies_app/core/api_service/api_service.dart';
import 'package:movies_app/core/di/app_di.dart';
import 'package:movies_app/core/routes/pages_routes_name.dart';
import 'package:movies_app/modules/auth/domain/use_cases/login_use_case.dart';
import 'package:movies_app/modules/auth/domain/use_cases/register_use_case.dart';
import 'package:movies_app/modules/auth/presentaion/manger/login_bloc/bloc/login_bloc.dart';
import 'package:movies_app/modules/auth/presentaion/manger/register_bloc/register_bloc.dart';
import 'package:movies_app/modules/auth/presentaion/view/forget_password_screen.dart';
import 'package:movies_app/modules/auth/presentaion/view/login_screen.dart';
import 'package:movies_app/modules/auth/presentaion/view/register_view.dart';
import 'package:movies_app/modules/layout/details/data/data_source/remote_movie_details.dart';
import 'package:movies_app/modules/layout/details/data/repository/movie_detail_repo_imp.dart';
import 'package:movies_app/modules/layout/details/presentaion/view/details_view.dart';
import 'package:movies_app/modules/layout/details/domin/use_cases/fetch_movie_details.dart';
import 'package:movies_app/modules/layout/home/domin/use_cases/fetch_available_use_case.dart';
import 'package:movies_app/modules/layout/home/presentation/manger/bloc/available_now_bloc.dart';
import 'package:movies_app/modules/layout/home/presentation/view/home_view.dart';
import 'package:movies_app/modules/layout/layout_view.dart';
import 'package:movies_app/modules/layout/details/presentaion/manger/movie_details_bloc.dart';
import 'package:movies_app/modules/layout/details/presentaion/manger/movie_details_event.dart';
import 'package:movies_app/modules/onBoarding_view/on_boarding_screen_view.dart';
import 'package:movies_app/modules/splash/splash_view.dart';

abstract class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    PagesRoutesName.splash: (context) => const SplashView(),
    PagesRoutesName.onBoarding: (context) => const OnBoardingScreenView(),

    PagesRoutesName.login: (context) => BlocProvider(
      create: (context) => LoginBloc(sl.get<LoginUseCase>()),
      child: const LoginScreen(),
    ),

    PagesRoutesName.register: (context) => BlocProvider(
      create: (context) => RegisterBloc(sl.get<RegisterUseCase>()),
      child: const RegisterView(),
    ),

    PagesRoutesName.forget: (context) => const ForgetPasswordScreen(),

    PagesRoutesName.layout: (context) => BlocProvider(
      create: (context) =>
          AvailableNowBloc(sl.get<FetchAvailableUseCase>())
            ..add(FetchAvailableNowEvent()),

      child: const LayoutView(),
    ),
    PagesRoutesName.home: (context) => const HomeView(),
    PagesRoutesName.details: (context) => BlocProvider(
      lazy: false,
      create: (context) =>
          MovieDetailsBloc(
            FetchMovieDetailsUseCase(
              movieDetailsRepo: MovieDetailRepoImp(
                remoteMovieDetails: RemoteMovieDetailsImpl(
                  apiService: ApiService(),
                ),
              ),
            ),
          )..add(
            FetchMovieDetailsEvent(
              endPont: ApiEndpoint.movieDetails,
              movieId: 2000.toString(),
            ),
          ),
      child: const DetailsView(),
    ),
  };
}
