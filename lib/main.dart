import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_api/feature/posts/presentation/cubit/post_cubit.dart';
import 'package:json_api/feature/users/presentation/cubit/user_cubit.dart';
import 'package:json_api/router/go_router_config.dart';
import 'server_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = goRouter;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<PostCubit>()..fetchPosts(),
        ),
        BlocProvider(
          create: (context) => di.sl<UserCubit>()..fetchUsers(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
