import 'dart:io';

import 'package:drift_demo/providers/authentication_provider.dart';
import 'package:drift_demo/source/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'dependency_inject.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  final imageCache = PaintingBinding.instance.imageCache;
  imageCache.maximumSize = 200; // Maximum number of images
  imageCache.maximumSizeBytes = 500 * 1024 * 1024;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _authProvider = sl<AuthProvider>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _authProvider),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Drift Demo'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _authProvider = sl<AuthProvider>();
  dynamic _uploadImage;

  Future<void> addUser() async {
    final user = UserModel(
      firstName: 'Test',
      lastName: "1",
      email: "test5@gmail.com",
      age: 20,
      isVerified: false
    );
    await _authProvider.adduser(context, userDetails: user);
    _authProvider.getAllUsers(context);
  }

  @override
  void initState() {
    //Future.microtask(()=> _authProvider.getAllAttachments());
    super.initState();
  }

  getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image != null){
      if(kIsWeb){
        _uploadImage = image;
      }else{
        _uploadImage = File(image.path);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authState, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(_uploadImage != null && kIsWeb)
                Image.network(_uploadImage.path)
              else if(_uploadImage != null)
                Image.file(_uploadImage),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'attachments: ${authState.localAttachments.length}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: authState.localAttachments.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns
                    crossAxisSpacing: 8.0, // Space between columns
                    mainAxisSpacing: 8.0, // Space between rows
                    childAspectRatio: 0.9
                  ),
                  itemBuilder: (_, index){
                    final details = authState.localAttachments[index];
                    return Image.memory(details.attachment!,filterQuality: FilterQuality.low,);
                  }
                ),
              ),
              if(false)
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(authState.localAttachments.length, (index){
                  final details = authState.localAttachments[index];
                  return Column(
                    children: [
                      Image.memory(details.attachment!, height: 100, width: 100),
                      Text("size: ${(details.size!.toStringAsFixed(2))}kb"),
                      Text("t ID: ${details.type}"),
                      Text("t ID: ${details.id}"),
                      Text("a ID: ${details.attachmentId}"),
                    ],
                  );
                }),
              )
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //await _authProvider.addAttachments();
          //getImage();
          //_authProvider.downloadFile("https://dummyjson.com/image/400x400?type=png&text=I+am+a+png+image", "test1.png");
          //_authProvider.downloadFile("https://www.wisdomaxis.com/technology/software/data/for-reports/Orders-With-Nulls.xlsx", "export.xlsx");
          //_authProvider.downloadFile("https://www.sample-videos.com/xls/Sample-Spreadsheet-100-rows.xls", "export.xls");
          _authProvider.downloadFile("https://filesamples.com/samples/document/xlsx/sample3.xlsx", "export.xlsx");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
