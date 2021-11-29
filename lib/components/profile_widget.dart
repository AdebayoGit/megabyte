import 'package:flutter/material.dart';

import 'colors.dart';

class ProfileWidget extends StatelessWidget {
  final String? imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({Key? key, this.imagePath, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: Stack(
        children: [
          buildUserProfileImage(),
          Positioned(
            bottom: 0,
            right: 5,
            child: buildEditIconCircle(
              color: seaGreen,
              padding: 3.0,
              child: buildEditIconCircle(
                  color: yellow, padding: 4.0, child: buildEditIcon(color)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserProfileImage() {
    final image = imagePath != null
        ? AssetImage(imagePath!)
        : const AssetImage('images/games_image_01.png');

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => const Icon(
        Icons.edit,
        size: 24.0,
      );

  Widget buildEditIconCircle({
    required Color color,
    required double padding,
    required Widget child,
  }) =>
      ClipOval(
        child: Container(
          color: color,
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      );
}
