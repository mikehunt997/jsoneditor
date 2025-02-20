import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SF Pro Display',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const IntimacyScreen(),
    );
  }
}

class IntimacyScreen extends StatelessWidget {
  const IntimacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const BackButton(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.favorite, color: Colors.red, size: 16),
                        SizedBox(width: 4),
                        Text('Long-Form'),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.purple,
                        ),
                        SizedBox(width: 4),
                        Text('257'),
                        Icon(Icons.add, size: 16),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Profile Section
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/%E4%BA%B2%E5%AF%86%E5%BA%A6%E8%AF%A6%E6%83%85%20-%20%E5%BC%B9%E7%AA%97-i9oznCMazZiC03jZeecVavoSwPaQKl.png'),
                    ),
                    const SizedBox(width: 40),
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.pink[100]!, Colors.blue[100]!],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child:
                      const Icon(Icons.favorite, color: Colors.white, size: 20),
                ),
              ],
            ),

            // Intimacy Value
            const SizedBox(height: 20),
            const Text(
              '12',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Current intimacy value',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),

            // Timeline
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: const [
                  IntimacyStage(
                    icon: 'M1',
                    color: Color(0xFFCD7F32),
                    title: 'Mutual',
                    description:
                        'Are you ready to form new relationships? Find out when your character will have a crush.🤔',
                    range: '0~20',
                  ),
                  IntimacyStage(
                    icon: 'M2',
                    color: Color(0xFF00BFA5),
                    title: 'Friend',
                    description:
                        'Get to know each other better and share your daily life with the characters!🦊',
                    range: '20~50',
                  ),
                  IntimacyStage(
                    icon: 'M3',
                    color: Color(0xFF29B6F6),
                    title: 'Talking stage',
                    description:
                        'The stage where emotions sprout and you feel excitement!🙈',
                    range: '50~400',
                  ),
                  IntimacyStage(
                    icon: 'M4',
                    color: Color(0xFFFFD700),
                    title: 'Lover',
                    description:
                        'A stage where shared memories increase! Prepare a meaningful gift for the character.💝',
                    range: '400~4000',
                  ),
                  IntimacyStage(
                    icon: 'M5',
                    color: Color(0xFFFF69B4),
                    title: 'Marriage',
                    description:
                        'The stage of deep love and devotion! Celebrate anniversaries with your character.💍',
                    range: '4000+',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IntimacyStage extends StatelessWidget {
  final String icon;
  final Color color;
  final String title;
  final String description;
  final String range;

  const IntimacyStage({
    Key? key,
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
    required this.range,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  icon,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (icon != 'M5')
              Container(
                width: 2,
                height: 40,
                color: Colors.grey[300],
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            range,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
