import 'package:flutter/material.dart';
import 'package:frontend/home_screen_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeScreenProvider(),
      child: MaterialApp(
        title: 'AI Vibe Check',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Vibe Check')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },

                    decoration: const InputDecoration(
                      labelText: 'Enter your name',
                      border: OutlineInputBorder(),
                      hintText: 'e.g. My boss yelled at me today',
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<HomeScreenProvider>().vibeCheck(
                          nameController.text,
                        );
                      }
                    },
                    child: Text("Vibe Check"),
                  ),
                ],
              ),
            ),

            // show result
            Consumer<HomeScreenProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const CircularProgressIndicator();
                }
                return Text(provider.result);
              },
            ),
          ],
        ),
      ),
    );
  }
}
