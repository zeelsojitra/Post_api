import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/Get_user_Model.dart';
import '../api_service/delete_service.dart';
import '../api_service/get_user_service.dart';

class Delete_Screen extends StatefulWidget {
  const Delete_Screen({Key? key}) : super(key: key);

  @override
  State<Delete_Screen> createState() => _Delete_ScreenState();
}

class _Delete_ScreenState extends State<Delete_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: GetData.GetUserData(),
        builder: (context, AsyncSnapshot<GetAllUser?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.users!.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data!.users![index];
                  return Dismissible(
                    key: ValueKey(data!.username),
                    background: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        Delete_service.Delete_user({"username": data.username});
                      }
                    },
                    secondaryBackground: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(data!.avatar.toString()),
                      ),
                      title: Text(
                        data.username.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        data.created.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        data.id.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(child: CupertinoActivityIndicator());
          }
        },
      ),
    );
  }
}
