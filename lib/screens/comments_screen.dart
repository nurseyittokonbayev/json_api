// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:json_api/api/api.dart';
// import 'package:json_api/models/models.dart';

// class CommentsScreen extends StatefulWidget {
//   const CommentsScreen({Key? key}) : super(key: key);

//   @override
//   _CommentsScreenState createState() => _CommentsScreenState();
// }

// class _CommentsScreenState extends State<CommentsScreen> {
//   List<Comments> comments = [];
//   final dio = Dio();

//   void commentsData() async {
//     try {
//       final res = await dio.get('${ApiConst.baseUrl}/comments');
//       if (res.statusCode == 200 || res.statusCode == 201) {
//         final data = res.data as List<dynamic>;

//         List<Comments> fetchedComments = data.map((comments) {
//           return Comments(
//               name: comments['name'],
//               email: comments['email'],
//               body: comments['body']);
//         }).toList();
//         setState(() {
//           comments = fetchedComments;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   void initState() {
//     commentsData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Comments'),
//         centerTitle: true,
//       ),
//       body: comments.isEmpty
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemCount: comments.length,
//               itemBuilder: (context, index) {
//                 final comment = comments[index];
//                 return ListTile(
//                   title: Text(
//                     comment.name,
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         comment.email,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text(comment.body),
//                     ],
//                   ),
//                 );
//               }),
//     );
//   }
// }
