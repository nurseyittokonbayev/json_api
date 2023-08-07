import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:json_api/components/my_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              onPressed: () => context.go('/posts'),
              text: 'Go to posts',
            ),
            const SizedBox(
              height: 12,
            ),
            MyButton(
              onPressed: () => context.go('/comments'),
              text: 'Go to comments',
            ),
            const SizedBox(
              height: 12,
            ),
            MyButton(
              onPressed: () => context.go('/albums'),
              text: 'Go to albums',
            ),
            const SizedBox(
              height: 12,
            ),
            MyButton(
              onPressed: () => context.go('/photos'),
              text: 'Go to photos',
            ),
            const SizedBox(
              height: 12,
            ),
            MyButton(
              onPressed: () => context.go('/todos'),
              text: 'Go to todos',
            ),
            const SizedBox(
              height: 12,
            ),
            MyButton(
              onPressed: () => context.go('/users'),
              text: 'Go to users',
            ),
          ],
        ),
      ),
    );
  }
}
