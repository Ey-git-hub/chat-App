
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImage extends StatefulWidget{
  const UserImage({super.key,required this.onPickedImage});
  final void Function(File image) onPickedImage; 
  @override
  State<UserImage> createState() {
    return _UserImageState();
  }

}
class _UserImageState extends State<UserImage>{
  File? _pickedImageFile;
  
  void _pickImage() async{
    final pickedImage=await ImagePicker().pickImage(source: ImageSource.camera,maxHeight: 150,imageQuality: 50);
    if(pickedImage==null){
      return;
    }
    setState(() {
      _pickedImageFile=File(pickedImage.path);
    });
    widget.onPickedImage(
      _pickedImageFile!);
  }
  @override
  Widget build(BuildContext context) {
   return Column(children: [
    CircleAvatar(
      radius: 40,
      backgroundColor: Colors.grey,
      foregroundImage: _pickedImageFile !=null ? FileImage(_pickedImageFile!):null,
    ),
    TextButton.icon(onPressed: _pickImage,icon: Icon(Icons.image) , label: Text("Add Image",style: TextStyle(
      color:Theme.of(context).colorScheme.primary
    ),))
   ],);
  }

}