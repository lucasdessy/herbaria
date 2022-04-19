import 'dart:ui';

import 'package:flutter/material.dart';

import 'choose_button.dart';

class AddImageBottomSheet extends StatefulWidget {
  final VoidCallback openCameraCallBack;
  final VoidCallback openGalleryCallBack;

  const AddImageBottomSheet(
      {Key? key,
      required this.openCameraCallBack,
      required this.openGalleryCallBack})
      : super(key: key);

  @override
  State<AddImageBottomSheet> createState() => _AddImageBottomSheetState();
}

class _AddImageBottomSheetState extends State<AddImageBottomSheet> {
  bool _open = false;
  static const blurIntensity = 10.0;
  static const animationDuration = Duration(milliseconds: 330);
  static const animationCurve = Curves.easeInOutCubic;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.transparent,
      child: TweenAnimationBuilder<double>(
        tween: Tween(
            begin: _open ? 0 : blurIntensity, end: _open ? blurIntensity : 0),
        duration: animationDuration,
        builder: (context, value, child) {
          return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
              child: child);
        },
        child: Stack(
          children: [
            Positioned(
              bottom: 234,
              child: AnimatedContainer(
                duration: animationDuration,
                curve: animationCurve,
                padding: EdgeInsets.only(
                    top: _open ? 0 : 16, bottom: _open ? 16 : 0),
                width: MediaQuery.of(context).size.width,
                child: AnimatedOpacity(
                  duration: animationDuration,
                  curve: animationCurve,
                  opacity: _open ? 1 : 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ChooseButton(
                          icon: Icons.camera_alt,
                          text: 'Câmera',
                          onClick: widget.openCameraCallBack),
                      const SizedBox(
                        height: 23,
                      ),
                      ChooseButton(
                          icon: Icons.photo_size_select_actual_outlined,
                          text: 'Fotos',
                          onClick: widget.openGalleryCallBack),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 92,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(61),
                    topRight: Radius.circular(61),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 92 - (75 / 2),
              left: MediaQuery.of(context).size.width / 2 - (75 / 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Material(
                  child: InkWell(
                    onTap: () => setState(() => _open = !_open),
                    child: AnimatedContainer(
                      width: 75,
                      height: 75,
                      color: _open ? Colors.grey : Colors.amber,
                      duration: animationDuration,
                      curve: animationCurve,
                      child: AnimatedRotation(
                        turns: _open ? 1 / 8 : 0,
                        duration: animationDuration,
                        curve: animationCurve,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
