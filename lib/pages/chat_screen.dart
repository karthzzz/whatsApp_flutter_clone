import 'package:flutter/material.dart';
import 'package:samosa/models/chat_model.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, index) => Column(
        children: [
          Divider(
            height: 10.0,
          ),
          ListTile(
            leading: CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: Image.network(dummyData[index].avatarUrl).image,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(dummyData[index].name, style: TextStyle(fontWeight: FontWeight.bold),),
              Text(dummyData[index].time, style: TextStyle(color: Colors.grey, fontSize: 14.0),),
              ],
            ),
            subtitle: Container(padding: const EdgeInsets.only(top: 5.0),
            child: Text(dummyData[index].message, style: TextStyle(color: Colors.grey, fontSize: 15.0),),
            ),
            
          )
        ],
      ),

    );
  }
}