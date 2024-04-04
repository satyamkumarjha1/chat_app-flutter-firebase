import "package:chat_app/Components/my_drawer.dart";
import "package:chat_app/Components/user_tile.dart";
import "package:chat_app/auth/auth_service.dart";
import "package:chat_app/chat/chat_service.dart";
import "package:chat_app/page/chat_page.dart";
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  final ChatService _chatservice = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home Page")),
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatservice.getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("loading..");
          }
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ChatPage(receiverEmail: userData["email"], receiverID: userData["uid"],)));
        },
      );
    } else {
      return Container();
    }
  }
}
