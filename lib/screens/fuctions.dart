import 'package:class_register/screens/add_student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


final GlobalKey<FormState> validation = GlobalKey<FormState>();

  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final mobilecontroller = TextEditingController();

  final CollectionReference std= FirebaseFirestore.instance.collection('students');

  void addDetails(context){
    final data={
      'image':imageUrl,
      'name':namecontroller.text,
      'age':agecontroller.text,
      'place':addresscontroller.text,
      'mobile':mobilecontroller.text,
     };
     if(validation.currentState!.validate()){
      std.add(data).then((value) => Navigator.pop(context)).then((value) => submitbuttondetailsok(context));   
     }
     else if(validation.currentState!.validate()){
      submitbuttondetailnotok(context); 
    }  
  }

  submitbuttondetailsok(context){
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor:  Color.fromARGB(255, 30, 189, 22),
          margin:  EdgeInsets.all(75),
          content: Text(
            'Student Details Submitted',
            textAlign: TextAlign.center,
            style:  TextStyle(color: Colors.black),
          ),
        ),
      );
  }

  submitbuttondetailnotok(context){
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          backgroundColor:  Color.fromARGB(255, 244, 70, 70),
          margin:  EdgeInsets.all(75),
          content: Text(
            'Please Add Student Identity Photo',
            textAlign: TextAlign.center,
            style:  TextStyle(color: Colors.black),
          ),
        ),
      );
  }

  deleteStdData(docid){
    std.doc(docid).delete();
  }

  Future<void> deletebuttonclicked(data,context) async{ 
    showDialog(
      context: context, 
      builder: (ctx){ 
        return AlertDialog(
          content: Text('Do You Want To Delete Student ${data['name']} ?',style:const TextStyle(fontWeight: FontWeight.w600),),  
          actions: [
            TextButton(
              onPressed: (){ 
                deleteStdData(data.id);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor:  Color.fromARGB(255, 219, 14, 14),
                    margin: EdgeInsets.all(75),
                    content: Text(
                      'Student Details Deleted',
                      textAlign: TextAlign.center,
 
                    ),
                  ),
                );                
              }, 
              child:const Text('YES'),
            ),
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child:const Text('NO')
            )
          ],
        );
      }
    );
  }

  void updateStudent(docid,context){
    final data={
      'name':namecontroller.text,
      'age':agecontroller.text,
      'place':addresscontroller.text,
      'mobile':mobilecontroller.text
    };
    std.doc(docid).update(data).then((value) => Navigator.pop(context)).then((value) => updatebuttondetailsok(context));
  }

  updatebuttondetailsok(context){
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor:  Color.fromARGB(255, 30, 189, 22),
          margin:  EdgeInsets.all(75),
          content: Text(
            'Student Details Updated',
            textAlign: TextAlign.center,
            style:  TextStyle(color: Colors.black),
          ),
        ),
      );
  }