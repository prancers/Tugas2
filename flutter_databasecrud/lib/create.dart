import 'package:flutter/material.dart';
import 'package:flutter_databasecrud/database_instance.dart';
import 'package:sqflite/sqflite.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  TextEditingController namaController = TextEditingController();
  TextEditingController kategoriController = TextEditingController();

  @override
  void initState() {
    super.initState();
    databaseInstance.database;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Produk'),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Nama Produk',
              ),
              controller: namaController,
            ),
            SizedBox(
              height: 20,
            ),
            Text('kategori'),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Kategori',
              ),
              controller: kategoriController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await databaseInstance.insert({
                  'name': namaController.text,
                  'category': kategoriController.text,
                  'createdAt': DateTime.now().toString(),
                  'updatedAt': DateTime.now().toString(),
                });
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            )
          ],
        ),
      ),
    );
  }
}
