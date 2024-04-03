import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
// scaffold
// appbar

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? imageFile;

  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        // image picker button and image box
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // pick image
                pickImage();
              },
              child: const Text("Pick Image"),
            ),
            // clear button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  imageFile = null;
                });
              },
              child: const Text("Clear Image"),
            ),
            const SizedBox(height: 20),
            imageFile?.path == null
                ? Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey,
                  )
                : Image.file(
                    File(imageFile!.path),
                  ),
          ],
        ),
      ),
    );
  }
}
