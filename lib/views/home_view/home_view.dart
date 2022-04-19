import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:herbaria/views/constants/herbaria_padding.dart';
import 'package:herbaria/views/home_view/components/add_image_bottomsheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            HerbariaPadding(
              child: Center(
                child: Text('Faça uma análise',
                    style: Theme.of(context).textTheme.headline4),
              ),
            ),
            AddImageBottomSheet(openCameraCallBack: () {
              print('open camera');
            }, openGalleryCallBack: () {
              print('open gallery');
            }),
          ],
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Wrap(
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
      ),
    );
  }
}
