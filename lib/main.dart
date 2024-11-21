import 'package:drift_demo/providers/authentication_provider.dart';
import 'package:drift_demo/source/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dependency_inject.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
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
    Future.microtask(()=> _authProvider.getAllUsers(context));
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
                    'Users: ${authState.users.length}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                    ),
                  ),
                ],
              )
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addUser,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
