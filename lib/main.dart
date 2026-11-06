import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';
import 'cv.dart';
import 'menu.dart';

void main() => runApp(const CafeApp());

class CafeApp extends StatelessWidget {
  const CafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cafe Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        scaffoldBackgroundColor: const Color(0xFFFFF8F0),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  bool loggedIn = false;
  int selectedIndex = 0;

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (nameController.text.trim().isNotEmpty &&
        passwordController.text.isNotEmpty) {
      setState(() {
        loggedIn = true;
        selectedIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !loggedIn || selectedIndex == 0
          ? AppBar(title: Text(loggedIn ? 'Welcome' : 'Cafe Login'))
          : null,
      bottomNavigationBar: loggedIn
          ? BottomNavBar(
              selectedIndex: selectedIndex,
              onItemSelected: (index) {
                setState(() {
                  if (index == 3) {
                    loggedIn = false;
                    selectedIndex = 0;
                  } else {
                    selectedIndex = index;
                  }
                });
              },
            )
          : null,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        child: !loggedIn
            ? _centered(loginForm(), 'login')
            : selectedIndex == 0
            ? _centered(menuOptions(context), 'home')
            : selectedIndex == 1
            ? const MenuPage(key: ValueKey('menu'))
            : Scaffold(
                key: const ValueKey('cv'),
                body: CvPage(onBack: () => setState(() => selectedIndex = 0)),
              ),
      ),
    );
  }

  Widget _centered(Widget child, String key) {
    return Center(
      key: ValueKey(key),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: SizedBox(width: 360, child: child),
      ),
    );
  }

  Widget loginForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.local_cafe, size: 64, color: Colors.brown),
        const SizedBox(height: 20),
        const Text(
          'Welcome to our cafe',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
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
          child: ElevatedButton(onPressed: login, child: const Text('Log in')),
        ),
      ],
    );
  }

  Widget menuOptions(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Hello, ${nameController.text.trim()}!',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => setState(() => selectedIndex = 1),
            child: const Text('Cafe Menu'),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => setState(() => selectedIndex = 2),
            child: const Text('View CV'),
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () => setState(() {
            loggedIn = false;
            selectedIndex = 0;
          }),
          child: const Text('Log out'),
        ),
      ],
    );
  }
}
