import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF101116),
          colorScheme: ThemeData.dark().colorScheme.copyWith(
                primary: const Color(0xFF9B8CFF),
              ),
        ),
        home: const LoginPage(),
      );
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  String? userName;

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: userName == null
              ? Center(
                  key: const ValueKey('login'),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(28),
                    child: SizedBox(
                      width: 360,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.nightlight_round,
                              size: 64, color: Color(0xFF9B8CFF)),
                          const SizedBox(height: 20),
                          const Text('Welcome back',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 28),
                          TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: 'Your name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Your password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () {
                                if (nameController.text.trim().isNotEmpty &&
                                    passwordController.text.isNotEmpty) {
                                  setState(() {
                                    userName = nameController.text.trim();
                                  });
                                }
                              },
                              child: const Text('Log in'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Center(
                  key: const ValueKey('welcome'),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.nightlight_round,
                          size: 64, color: Color(0xFF9B8CFF)),
                      const SizedBox(height: 20),
                      Text('Welcome, $userName!',
                          style: const TextStyle(fontSize: 26)),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () => setState(() => userName = null),
                        child: const Text('Log out'),
                      ),
                    ],
                  ),
                ),
        ),
      );
}
