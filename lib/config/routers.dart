import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ultra_market_admin/pages/pages.dart';
import 'package:ultra_market_admin/repository/image_repository.dart';

class NamedRoutes {
  static const String home = 'home';
  static const String product = 'product';
  static const String category = 'category';
}

GoRouter router = GoRouter(
  routes: [
    GoRoute(
        name: NamedRoutes.home,
        path: '/',
        builder: (context, state) => const HomePage()),
    // GoRoute(
    //     name: NamedRoutes.product,
    //     path: '/product',
    //     builder: (context, state) => const ProductPage()),
    GoRoute(
      name: NamedRoutes.category,
      path: '/category',
      builder: (context, state) => RepositoryProvider<ImageRepository>(
        create: (_) => ImageRepository(),
        child: const CategoryPage(),
      ),
    ),
  ],
);
