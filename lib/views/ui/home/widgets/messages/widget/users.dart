import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_chat_app/core/constant/style.dart';
import 'package:mini_chat_app/routes.dart';
import 'package:mini_chat_app/views/ui/home/widgets/messages/state/messages_state.dart';
import 'package:provider/provider.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Consumer<MessagesState>(
        builder: (context, state, child) {
          return ListView(
            children:
                state.mockUsers.map((e) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: styleMiniChat.colors.background.grey,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        e.unreadMessage <= 0
                            ? SizedBox()
                            : Positioned(
                              right: 0,
                              top: 0,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 30,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color:
                                        styleMiniChat.colors.background.base,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    e.unreadMessage.toString(),
                                    style: styleMiniChat.text.bodyRegular
                                        .copyWith(
                                          fontSize: 12,
                                          color:
                                              styleMiniChat.colors.text.error, fontWeight: FontWeight.bold
                                        ),
                                  ),
                                ),
                              ),
                            ),
                        ListTile(
                          onTap: () {
                            context.pushNamed(Routes.message,extra: state);
                            state.chatting = e;
                            state.getReceiveMessage();
                          },
                          title: Text(
                            e.name,
                            style: styleMiniChat.text.bodyBold,
                          ),
                          subtitle: Row(
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      e.isOnline
                                          ? styleMiniChat.colors.text.success
                                          : styleMiniChat.colors.border.error,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                e.isOnline ? 'Online' : 'Offline',
                                style: styleMiniChat.text.bodyRegular,
                              ),
                            ],
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(e.photoUrl),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          );
        },
      ),
    );
  }
}
