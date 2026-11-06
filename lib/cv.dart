import 'package:flutter/material.dart';

class CvPage extends StatelessWidget {
  const CvPage({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Column(
      key: key,
      children: [
        Row(
          children: [
            IconButton(onPressed: onBack, icon: const Icon(Icons.arrow_back)),
            const Text(
              'My CV',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
            children: const [
              Center(
                child: CircleAvatar(
                  radius: 58,
                  backgroundImage: AssetImage('assets/asad_ali.png'),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'ASAD ALI',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'BS Software Engineering Student',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 16),
              Text(
                'Phone: 03124456919\nEmail: asadali4036a@gmail.com\nLocation: Pakistan',
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.6),
              ),
              SizedBox(height: 24),
              _Section(
                title: 'PROFESSIONAL SUMMARY',
                body: 'Motivated BS Software Engineering student with knowledge of programming languages, web development, application development, and database management. Interested in learning new technologies and developing software solutions.',
              ),
              _Section(
                title: 'PROGRAMMING LANGUAGES',
                body: 'C • C++ • Python • JavaScript • Dart\nHTML • CSS • PHP • SQL • Node',
              ),
              _Section(
                title: 'TECHNICAL SKILLS',
                body: 'Web Development • Application Development\nFront-End Development • Back-End Development\nDatabase Management • Software Development',
              ),
              _Section(
                title: 'WORK EXPERIENCE',
                body: 'Data Entry Operator — 6 months\n• Entering and managing data accurately.\n• Organizing and maintaining digital records.\n• Handling computer-based data entry tasks.',
              ),
              _Section(
                title: 'EDUCATION',
                body: 'BS Software Engineering\nRiphah International University\nCurrently in 5th Semester',
              ),
              _Section(
                title: 'SOFT SKILLS',
                body: 'Problem Solving • Communication • Quick Learning\nTime Management • Teamwork • Attention to Detail',
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFFB4A9FF),
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const Divider(),
        Text(body, style: const TextStyle(height: 1.6)),
      ],
    ),
  );
}
