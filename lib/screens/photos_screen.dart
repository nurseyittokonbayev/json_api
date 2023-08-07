import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_api/api/api.dart';
import 'package:json_api/models/models.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  _PhotosScreenState createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  List<Photos> photos = [];
  final dio = Dio();

  void fetchPhoto() async {
    try {
      final res = await dio.get('${ApiConst.baseUrl}/photos');

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = res.data as List<dynamic>;

        List<Photos> fetchedPhotos = data.map((photos) {
          return Photos(
              title: photos['title'],
              url: photos['url'],
              thumbnailUrl: photos['thumbnailUrl']);
        }).toList();

        setState(() {
          photos = fetchedPhotos;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchPhoto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
        centerTitle: true,
      ),
      body: photos.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final photo = photos[index];
                return ListTile(
                  title: Text(photo.title),
                  leading: Image.network(photo.thumbnailUrl),
                );
              }),
    );
  }
}
