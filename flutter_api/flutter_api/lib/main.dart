import 'package:flutter/material.dart';
import 'package:flutter_api/model/user.dart';
import 'package:flutter_api/services/user_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user.email;
            // final color = user.gender == 'male'
            //     ? const Color.fromARGB(255, 33, 89, 134)
            //     : const Color.fromARGB(255, 18, 97, 20);

            return ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: (Image.network(user.picture.thumbnail))),
              title: Text(email),
              //tileColor: color,
              subtitle: Text('${user.name.first} ${user.name.last}'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
