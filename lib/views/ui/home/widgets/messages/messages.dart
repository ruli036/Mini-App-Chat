import 'package:flutter/material.dart';
import 'package:mini_chat_app/core/constant/style.dart';
import 'package:mini_chat_app/views/ui/home/widgets/messages/state/messages_state.dart';
import 'package:mini_chat_app/views/ui/home/widgets/messages/widget/users.dart';
import 'package:mini_chat_app/views/ui/home/widgets/profile/widgets/wave.dart';
import 'package:provider/provider.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: styleMiniChat.colors.background.base,
        title: Text(
          "Messages",
          style: styleMiniChat.text.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => MessagesState()..init(),
        child: Consumer<MessagesState>(
          builder: (context, state, child) {
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
                UsersListView(),
              ],
            );
          },
        ),
      ),
    );
  }
}
