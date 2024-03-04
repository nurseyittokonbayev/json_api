// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:json_api/api/api.dart';
// import 'package:json_api/models/models.dart';

// class UsersScreen extends StatefulWidget {
//   const UsersScreen({Key? key}) : super(key: key);

//   @override
//   _UsersScreenState createState() => _UsersScreenState();
// }

// class _UsersScreenState extends State<UsersScreen> {
//   List<Users> users = [];
//   final dio = Dio();

//   void fetchUsers() async {
//     try {
//       final res = await dio.get('${ApiConst.baseUrl}/users');
//       if (res.statusCode == 200 || res.statusCode == 201) {
//         final data = res.data as List<dynamic>;

//         List<Users> fetchedUsers = data.map((users) {
//           return Users(
//             name: users['name'],
//             username: users['username'],
//             email: users['email'],
//             city: users['address']['city'],
//             phone: users['phone'],
//             website: users['website'],
//             companyName: users['company']['name'],
//           );
//         }).toList();

//         setState(() {
//           users = fetchedUsers;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   void initState() {
//     fetchUsers();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Users'),
//         centerTitle: true,
//       ),
//       body: users.isEmpty
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index) {
//                 final user = users[index];
//                 return ListTile(
//                   title: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         user.name,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   // titleAlignment: ListTileTitleAlignment.center,
//                   subtitle: Column(
//                     children: [
//                       Text(
//                         user.username,
//                       ),
//                       Text(
//                         user.email,
//                       ),
//                       Text(
//                         user.city,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         user.phone,
//                       ),
//                       Text(
//                         user.companyName,
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
