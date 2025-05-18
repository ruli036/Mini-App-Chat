import 'package:flutter/material.dart';
import 'package:mini_chat_app/views/ui/home/widgets/profile/state/profile_state.dart';
import 'package:provider/provider.dart';

class UserImgView extends StatelessWidget {
  const UserImgView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProfileState>(context);
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
          image: DecorationImage(
            image: NetworkImage(state.authData?.urlPhoto ?? ''),
            fit: BoxFit.contain,
          ),
        ),
        height: 100,
        width: 100,
      ),
    );
  }
}
