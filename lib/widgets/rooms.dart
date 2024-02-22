import 'package:facebookclone/config/palette.dart';
import 'package:facebookclone/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({super.key, required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop? 5.0: 0.0),
      elevation: isDesktop? 1.0: 0.0,
      shape: isDesktop? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)) : null,
      child: SizedBox(
        height: 60.0,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 4.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: _createRooms(),
              );
            }
      
            final User user = onlineUsers[index - 1];
      
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _createRooms extends StatelessWidget {
  const _createRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print("You have clicked Rooms button"),
      style: ButtonStyle(
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (Set<MaterialState> states) {
            return BorderSide(
              color: Colors.blueAccent.shade100, // Adjust color as needed
              width: 3.0, // Adjust border width as needed
            );
          },
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            );
          },
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          const Text("Create\nRoom")
        ],
      ),
    );
  }
}
