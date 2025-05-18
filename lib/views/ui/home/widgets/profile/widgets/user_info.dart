import 'package:flutter/material.dart';
import 'package:mini_chat_app/controller/global_state.dart';
import 'package:mini_chat_app/core/constant/style.dart';
import 'package:mini_chat_app/views/ui/home/widgets/profile/state/profile_state.dart';
import 'package:provider/provider.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProfileState>(context);
    return Consumer<GlobalState>(
      builder: (context, _, __) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Name\n',
                style: styleMiniChat.text.bodyBold,
                children: <TextSpan>[
                  TextSpan(
                    text: state.authData?.name ?? 'name',
                    style: styleMiniChat.text.bodyRegular,
                  ),
                ],
              ),
            ),
            Divider(),
            RichText(
              text: TextSpan(
                text: 'Email\n',
                style: styleMiniChat.text.bodyBold,
                children: <TextSpan>[
                  TextSpan(
                    text: state.authData?.email ?? 'Email@gmail.com',
                    style: styleMiniChat.text.bodyRegular,
                  ),
                ],
              ),
            ),
            Divider(),
            RichText(
              text: TextSpan(
                text: 'Phone Number\n',
                style: styleMiniChat.text.bodyBold,
                children: <TextSpan>[
                  TextSpan(
                    text: '082216127560',
                    style: styleMiniChat.text.bodyRegular,
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
