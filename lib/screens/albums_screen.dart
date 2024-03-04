// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:json_api/api/api.dart';
// import 'package:json_api/models/models.dart';

// class AlbumsScreen extends StatefulWidget {
//   const AlbumsScreen({Key? key}) : super(key: key);

//   @override
//   _AlbumsScreenState createState() => _AlbumsScreenState();
// }

// class _AlbumsScreenState extends State<AlbumsScreen> {
//   List<Albums> albums = [];
//   final dio = Dio();

//   void fetchAlbums() async {
//     try {
//       final res = await dio.get('${ApiConst.baseUrl}/albums');
//       if (res.statusCode == 200 || res.statusCode == 201) {
//         final data = res.data as List<dynamic>;

//         List<Albums> fetchedAlbums = data.map((albums) {
//           return Albums(id: albums['id'], title: albums['title']);
//         }).toList();

//         setState(() {
//           albums = fetchedAlbums;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   void initState() {
//     fetchAlbums();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Albums'),
//         centerTitle: true,
//       ),
//       body: albums.isEmpty
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemCount: albums.length,
//               itemBuilder: (context, index) {
//                 final album = albums[index];
//                 return ListTile(
//                   title: Text(album.id.toString()),
//                   subtitle: Text(album.title),
//                 );
//               }),
//     );
//   }
// }
