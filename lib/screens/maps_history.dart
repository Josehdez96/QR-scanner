import 'package:flutter/material.dart';

class MapsHistoryScreen extends StatelessWidget {
  const MapsHistoryScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: ( _, i ) => ListTile(
        leading: Icon(Icons.map_outlined, color: Theme.of(context).primaryColor),
        title: Text('http://agshyags.com'),
        subtitle: Text('ID: 12'),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        onTap: () {},
      )
    );
  }
}