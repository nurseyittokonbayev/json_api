// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:json_api/presentation/cubit/post_cubit.dart';

// class PostScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Posts'),
//       ),
//       body: BlocProvider(
//         create: (context) => PostBloc(context.read())..fetchPosts(),
//         child: BlocBuilder<PostBloc, List<Map<String, dynamic>>>(
//           builder: (context, posts) {
//             return ListView.builder(
//               itemCount: posts.length,
//               itemBuilder: (context, index) {
//                 final post = posts[index];
//                 return ListTile(
//                   title: Text(post['title']),
//                   subtitle: Text(post['body']),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
