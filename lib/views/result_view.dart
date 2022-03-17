import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MediaQuery.of(context).viewPadding,
        child: ListView(
          children: [
            CarouselSlider(
              options:
                  CarouselOptions(height: MediaQuery.of(context).size.width),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(color: Colors.amber),
                        child: Text(
                          'text $i',
                          style: const TextStyle(fontSize: 16.0),
                        ));
                  },
                );
              }).toList(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Planta top', style: TextStyle(fontSize: 40)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Voltar'),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc justo neque, dignissim et ligula at, maximus tristique lorem.'),
                ),
                SizedBox(height: 15),
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text(
                      'Vestibulum nulla sapien, aliquam in tellus faucibus, sollicitudin vestibulum mi. Sed eget porttitor tellus, non tincidunt tellus.'),
                ),
                SizedBox(height: 15),
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text(
                      'Sed pretium sodales metus et fermentum. Duis mattis neque erat, ac dignissim urna finibus sit amet.'),
                ),
                SizedBox(height: 15),
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text(
                      'Cras sed tellus tellus. Pellentesque tincidunt, risus sed sollicitudin pharetra, ligula felis tempus sapien, at dignissim dolor urna eget massa.'),
                ),
                SizedBox(height: 15),
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text('Phasellus suscipit in augue a blandit.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
