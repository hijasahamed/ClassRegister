import 'dart:io';

import 'package:class_register/screens/fuctions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


String? image;
String? imageUrl;
Uint8List? imagebyte;
bool uploading=false; 

class AddStudent extends StatefulWidget {
 const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {

  @override
  void initState() {
    clearStudentProfile(); 
    setState(() {
      image=null;
    });
    super.initState();
  }

  
  

  clearStudentProfile() {
    namecontroller.text = '';
    agecontroller.text = '';
    addresscontroller.text = '';
    mobilecontroller.text = '';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Student Details',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:const Color.fromARGB(255, 248, 247, 247),                     
                ), 
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: validation,
                      child: Column(
                        children: [ 
                          Stack(
                            children: [
                              image != null
                              ? uploading
                                  ? const CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.black,
                                      child: CircularProgressIndicator(
                                          color:Colors.deepPurpleAccent,
                                          backgroundColor: Colors.transparent),
                                    )
                                  : CircleAvatar(
                                      radius: 70,
                                      backgroundImage: MemoryImage(imagebyte!))
                              : const CircleAvatar(
                                  radius: 70,
                                  backgroundImage:
                                      AssetImage('assets/images/circle avatar.png')
                                          as ImageProvider,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                      onPressed: () {
                                        fromgallery();
                                      },
                                      icon: const Icon(
                                        Icons.add_a_photo_outlined,
                                        color: Colors.deepPurple,
                                        size: 20,
                                      )),
                                ),
                              )
                            ],
                          ),
                          
                          
                          const SizedBox(height: 25),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please eneter the name';
                              }
                            },
                            controller: namecontroller,
                            inputFormatters: [LengthLimitingTextInputFormatter(25)],
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.abc),
                                border: OutlineInputBorder(),
                                labelText: 'Name'),
                            textCapitalization: TextCapitalization.words,    
                          ),
                          
                          
                          const SizedBox(height: 25),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please eneter the age';
                              }
                            },
                            controller: agecontroller,
                            keyboardType: TextInputType.number,
                            inputFormatters: [LengthLimitingTextInputFormatter(2)],
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.calendar_month),
                                border: OutlineInputBorder(),
                                labelText: 'Age'),
                          ),
                         
                          
                          const SizedBox(height: 25),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please eneter the Place';
                              }
                            },
                            controller: addresscontroller,
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.place),
                                border: OutlineInputBorder(),
                                labelText: 'Place'
                              ),
                              textCapitalization: TextCapitalization.words,
                          ),
                          
                          
                          const SizedBox(height: 25),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty||value.length!=10) { 
                                return 'Please eneter a valid phone number';
                              }
                            },
                            controller: mobilecontroller,
                            inputFormatters: [LengthLimitingTextInputFormatter(10)],
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              prefixText: '+91 ',
                              prefixStyle:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              suffixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(),
                              labelText: 'Mobile',
                            ),
                          ),
                          
                          
                        ],
                      )
                    ),
                ),
              ),
        
              const SizedBox(height: 25),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(minimumSize:const Size(360, 45 ),elevation: 10),
                  onPressed: () {
                    addDetails(context);                   
                  },                 
                  icon:const  Icon(Icons.check),
                  label:const  Text('Submit')
              ),

            ],
          ),
        ),
      )),
    );
  }

  Future<void> fromgallery() async {
    FilePickerResult? img1 = await FilePicker.platform.pickFiles();

    if (img1 != null) {
      setState(() {
        image = img1.files.first.name;
        imagebyte = img1.files.first.bytes;
      });
    }

    try {
      setState(() {
        uploading = true;
      });

      firebase_storage.UploadTask uploadTask;
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('Product')
          .child('/${image!}');
      final metadata =
          firebase_storage.SettableMetadata(contentType: 'image/jpeg');
      uploadTask = ref.putData(imagebyte!, metadata);

      await uploadTask.whenComplete(() => null);

      imageUrl = await ref.getDownloadURL();

      setState(() {
        uploading = false;
      });
    } catch (e) {
      print(e);

      setState(() {
        uploading = false;
      });
    }
  }

}
