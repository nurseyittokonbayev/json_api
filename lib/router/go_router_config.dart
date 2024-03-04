import 'package:go_router/go_router.dart';
import 'package:json_api/feature/users/presentation/pages/users.screen.dart';
import 'package:json_api/screens/home_screen.dart';
import 'package:json_api/feature/posts/presentation/pages/posts_screen.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            name: 'posts',
            path: 'posts',
            builder: (context, state) => const PostsScreen(),
          ),
          // GoRoute(
          //   name: 'comments',
          //   path: 'comments',
          //   builder: (context, state) => const CommentsScreen(),
          // ),
          // GoRoute(
          //   name: 'albums',
          //   path: 'albums',
          //   builder: (context, state) => const AlbumsScreen(),
          // ),
          // GoRoute(
          //   name: 'photos',
          //   path: 'photos',
          //   builder: (context, state) => const PhotosScreen(),
          // ),
          // GoRoute(
          //   name: 'todos',
          //   path: 'todos',
          //   builder: (context, state) => const TodosScreen(),
          // ),
          GoRoute(
            name: 'users',
            path: 'users',
            builder: (context, state) => const UsersScreen(),
          ),
        ]),
  ],
);
