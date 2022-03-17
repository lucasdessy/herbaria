import 'package:flutter/material.dart';
import 'package:herbaria/views/result_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Wrap(
                    children: const [
                      ListTile(
                        title: Text(
                          'Escolher da: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        title: Text('Camera'),
                        leading: Icon(Icons.camera),
                      ),
                      ListTile(
                        title: Text('Galeria'),
                        leading: Icon(Icons.photo),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: const Icon(Icons.photo, color: Colors.white, size: 80),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ResultView(),
                  ),
                );
              },
              child: const Text('Próxima tela'),
            ),
          ],
        ),
      ),
    );
  }
}
