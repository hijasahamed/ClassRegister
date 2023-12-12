import 'package:class_register/screens/fuctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdateStudent extends StatefulWidget {
 const UpdateStudent({super.key,required this.stdDetails});

 final stdDetails;

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {

  @override
  void initState() {
    namecontroller.text=widget.stdDetails['name'];
    agecontroller.text=widget.stdDetails['age'];
    addresscontroller.text=widget.stdDetails['place'];
    mobilecontroller.text=widget.stdDetails['mobile'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Update Student Details',style: TextStyle(color: Colors.white),),
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
                  color: Color.fromARGB(255, 248, 247, 247),                     
                ), 
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: validation,
                      child: Column(
                        children: [        
                          Stack(
                            children: [
                              const CircleAvatar(
                                // backgroundImage:image1 != null
                                // ? FileImage(image1!)
                                // :  AssetImage('images/circle avatar.png')
                                // as ImageProvider,
                                radius: 70,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                      onPressed: () {
                                        // fromgallery();
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
                    updateStudent(widget.stdDetails.id,context);                   
                  },                 
                  icon:const  Icon(Icons.check),
                  label:const  Text('Update')
              ),

            ],
          ),
        ),
      )),
    );
  }
}