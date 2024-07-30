import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_code/Features/Test/presentation/screens/my_home_page.dart';
import 'package:test_code/Features/Test/presentation/viewModels/products_cubit.dart';
import 'package:test_code/core/app/di/injection_container.dart';


class AppRoutes {
  static const String home = '/';


  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => sl<ProductsCubit>()..fetchProducts(),
              child: const MyHomePage(),
            ),);
    // case AppRoutes.signUp:
    //   return BaseRoute(page: MultiBlocProvider(
    //       providers: [
    //         BlocProvider(create: (context) => sl<FileCubit>()),
    //         BlocProvider(create: (context) => sl<AuthBloc>()),
    //       ],
    //       child: const SignUpScreen(),
    //     ),
    //   );
    // case AppRoutes.homeAdmin:
    //   return BaseRoute(
    //     page: const HomeAdminScreen(),
    //   );
    // case AppRoutes.homeCustomer:
    //   return BaseRoute(
    //     page: const HomeCustomerScreen(),
    //   );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) =>
      const Scaffold(
        body: Center(child: Text('No Route')),
      ),
    );
  }

}
