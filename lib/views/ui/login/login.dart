import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_chat_app/core/asset/asset.dart';
import 'package:mini_chat_app/core/constant/style.dart';
import 'package:mini_chat_app/views/ui/login/state/login_state.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => LoginState(),
        child: Consumer<LoginState>(
          builder: (context, state, _) {
            return SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: Text(
                        "Wellcome to mini chat app",
                        textAlign: TextAlign.center,
                        style: styleMiniChat.text.titleLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SvgPicture.asset(AssetMiniChatApp.userChatting),
                    ElevatedButton(
                      onPressed: () => state.signInWithGoogle(),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.blue,
                        ),
                      ),
                      child: Text(
                        "Login With Google",
                        style: styleMiniChat.text.bodyRegular.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
