import 'package:flutter/material.dart';
import 'package:networking_test/Album.dart';
import 'package:networking_test/Request.dart';

class APIController extends StatefulWidget {
  const APIController({super.key});

  @override
  State<StatefulWidget> createState() {
    return _APIController();
  }
}

class _APIController extends State<APIController> {
  late Future<Album> futureAlbum;
  late final MakeRquest api = MakeRquest();
  void initState() {
    super.initState();
    futureAlbum = api.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
