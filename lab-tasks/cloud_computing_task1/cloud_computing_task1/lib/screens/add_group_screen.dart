import 'package:flutter/material.dart';
import '../models/social_media_group.dart';
import '../services/firestore_service.dart';

Class AddGroupScreen extends StatefulWidget {
  @override
  _AddGroupScreenState createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  fianl FirestoreService _firestoreService = FirestoreService();

  void _handleSubmit() async {
    final String name = _nameController.text.trim();
    final String type = _typeController.text.trim();

    if (name.isNotEmpty && type.isNotEmpty) {
      await _firestoreService.addGroup(SocailMediaGroup(name: name, type: type));
      _nameController.clear();
      _typeController.clear();
    }else {
      ScaffoldMessenger.of(context).showSnackBar(snackBar(context: Text('Please fill in both fields.')),);

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Socail Media Group')),
      body: Padding(padding: EdgeInsets.all(16.0),
      child: Column(children: [TextField(controller: _nameController,
      decoration: InputDecoration(labelText: 'Group Name'),),
      TextField(controller: _typeController,decoration: InputDecoration(labelText: 'Group Type'),),
      SizedBox(height: 20),
      ElevatedButton(onPressed: _handleSubmit, child: Text('Submit'),),
      ElevatedButton(onPressed: (){Navigator.pushNamed(context,'/list');},child: Text('View Groups'),),],),),

    );
  }
}