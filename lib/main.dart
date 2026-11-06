import 'package:flutter/material.dart';

import 'cv.dart';

void main() => runApp(const MyApp());

const purple = Color(0xFF9B8CFF);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xFF101116),
      colorScheme: ThemeData.dark().colorScheme.copyWith(primary: purple),
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
  String page = 'login';

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: AnimatedSwitcher(
      duration: const Duration(milliseconds: 450),
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: page == 'login'
          ? _login()
          : page == 'options'
          ? _options()
          : page == 'cv'
          ? CvPage(
              key: const ValueKey('cv'),
              onBack: () => setState(() => page = 'options'),
            )
          : _menu(),
    ),
  );

  Widget _login() => Center(
    key: const ValueKey('login'),
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: SizedBox(
        width: 360,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.nightlight_round, size: 64, color: purple),
            const SizedBox(height: 20),
            const Text(
              'Welcome back',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
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
                      page = 'options';
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
  );

  Widget _options() => Center(
    key: const ValueKey('options'),
    child: Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.nightlight_round, size: 64, color: purple),
          const SizedBox(height: 20),
          Text(
            'Hello, $userName!',
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: 280,
            child: FilledButton.icon(
              onPressed: () => setState(() => page = 'cv'),
              icon: const Icon(Icons.person_outline),
              label: const Text('View CV'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 280,
            child: OutlinedButton.icon(
              onPressed: () => setState(() => page = 'menu'),
              icon: const Icon(Icons.menu),
              label: const Text('Menu'),
            ),
          ),
          TextButton(
            onPressed: () => setState(() {
              userName = null;
              page = 'login';
            }),
            child: const Text('Log out'),
          ),
        ],
      ),
    ),
  );

  Widget _menu() => Center(
    key: const ValueKey('menu'),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.menu, size: 54, color: purple),
        const SizedBox(height: 16),
        const Text('Menu', style: TextStyle(fontSize: 26)),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () => setState(() => page = 'cv'),
          child: const Text('View CV'),
        ),
        TextButton(
          onPressed: () => setState(() => page = 'options'),
          child: const Text('Back'),
        ),
        TextButton(
          onPressed: () => setState(() {
            userName = null;
            page = 'login';
          }),
          child: const Text('Log out'),
        ),
      ],
    ),
  );
}
