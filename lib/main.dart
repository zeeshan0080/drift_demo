import 'package:drift_demo/providers/authentication_provider.dart';
import 'package:drift_demo/source/models/user_model.dart';
import 'package:flutter/material.dart';
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
    Future.microtask(()=> _authProvider.getAllAttachments());
    super.initState();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'attachments: ${authState.localAttachments.length}',
                    style: TextStyle(
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
          await _authProvider.addAttachments();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
