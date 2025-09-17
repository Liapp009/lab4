import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/second': (_) => const SecondScreen()},
      home: const Lab4Home(),
    );
  }
}

class Lab4Home extends StatefulWidget {
  const Lab4Home({super.key});
  @override
  State<Lab4Home> createState() => _Lab4HomeState();
}

class _Lab4HomeState extends State<Lab4Home> {
  bool showFirst = true;

  @override
  Widget build(BuildContext context) {
    final imgPath = showFirst ? 'assets/flg' : 'assets/image2.jpg';

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Lab 4',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            demoFitCard(Image.asset('assets/image1.jpg', fit: BoxFit.cover),
                'BoxFit.cover'),
            const SizedBox(height: 12),
            demoFitCard(Image.asset('assets/image1.jpg', fit: BoxFit.fill),
                'BoxFit.fill'),
            const SizedBox(height: 12),
            demoFitCard(Image.asset('assets/image1.jpg', fit: BoxFit.contain),
                'BoxFit.contain'),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(imgPath, fit: BoxFit.cover),
                  Container(color: Colors.black.withOpacity(0.35)),
                  const Center(
                    child: Text('Welcome to Flutter',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Show SnackBar'))),
                child:
                    const Text('Show SnackBar', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.green),
                onPressed: () => Navigator.pushNamed(context, '/second'),
                child: const Text('Go to Second Screen',
                    style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black, width: 1),
                  foregroundColor: Colors.black,
                ),
                onPressed: () => setState(() => showFirst = !showFirst),
                child:
                    const Text('Toggle Image', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget demoFitCard(Widget image, String label) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(children: [
        Positioned.fill(child: image),
        Positioned(
          left: 12,
          bottom: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(label,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600)),
          ),
        ),
      ]),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Second Screen'), backgroundColor: Colors.teal),
      body: const Center(child: Text('This is the second screen.')),
    );
  }
}
