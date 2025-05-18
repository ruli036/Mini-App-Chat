import 'package:flutter/material.dart';
import 'package:mini_chat_app/core/constant/style.dart';
import 'package:mini_chat_app/views/ui/home/widgets/profile/state/profile_state.dart';
import 'package:mini_chat_app/views/ui/home/widgets/profile/widgets/buttons.dart';
import 'package:mini_chat_app/views/ui/home/widgets/profile/widgets/user_img.dart';
import 'package:mini_chat_app/views/ui/home/widgets/profile/widgets/user_info.dart';
import 'package:mini_chat_app/views/ui/home/widgets/profile/widgets/wave.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: styleMiniChat.colors.background.base,
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: styleMiniChat.text.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          SwitchThemeButton()
        ],
      ),
      body: ChangeNotifierProvider(
        create: (context) => ProfileState()..getAuthUser(),
        child: Consumer<ProfileState>(
          builder: (context, state, _) {
            return Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: WaveBackgroundPainter(
                      baseColor: styleMiniChat.colors.background.base,
                      waveColor: Colors.blue.shade200.withValues(alpha: 0.3),
                      circleColor: Colors.blue.shade100.withValues(alpha: 0.2),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    children: const [
                      UserImgView(),
                      SizedBox(height: 20),
                      UserInfoView(),
                      Expanded(child: SizedBox()),
                      SignOutButton(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
