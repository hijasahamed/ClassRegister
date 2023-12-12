import 'package:class_register/screens/personal_details.dart';
import 'package:class_register/screens/update_student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class ListStudent extends StatefulWidget {
  const ListStudent({super.key,});
  @override
  State<ListStudent> createState() => _ListStudentState();
}

class _ListStudentState extends State<ListStudent> {

  final CollectionReference std= FirebaseFirestore.instance.collection('students');


  @override
  Widget build(BuildContext context) {
    return Scaffold(        
      body: Container(      
        decoration:const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Color.fromARGB(255, 232, 227, 227),),
        child:  Padding(
          padding: const EdgeInsets.all(5),
          child :StreamBuilder(
          stream: std.orderBy('name').snapshots(),  
          builder: (context,AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemBuilder: (ctx,index){
                    final DocumentSnapshot data=snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx){ return Details(details: data,);}));
                      },
                      child: Card(
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 241, 237, 237),                     
                          ),
                          height: 125,                    
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: Icon(Icons.person)
                                  ),
                                ),
                                SizedBox(
                                  height: double.infinity,
                                  width: 140,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Name:${data['name']}',style:const TextStyle(fontWeight: FontWeight.w500),),
                                      Text('Age:${data['age'].toString()}',style:const TextStyle(fontWeight: FontWeight.w500),),
                                      Text('Place:${data['place']}',style:const TextStyle(fontWeight: FontWeight.w500),),
                                      Text('Mobile:${data['mobile'].toString()}',style:const TextStyle(fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx){
                                          return  UpdateStudent(stdDetails:data);
                                        }
                                      )
                                    );
                                  }, 
                                  icon:const Icon(Icons.edit,color: Colors.green,)
                                ),
                                IconButton(
                                  onPressed: (){}, 
                                  icon:const Icon(Icons.delete,color: Colors.red,)
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }, 
                  separatorBuilder: (ctx,index){
                    return const  SizedBox(height: 10,);
                  }, 
                  itemCount: snapshot.data!.docs.length, 
                ),
              );
            }
            return const SizedBox(
              child: Center(
                child: Text('No Data Available'),
              ),
            );
          },
        ),
        ),
      ),
    );
  }


  // Future<void> deletebuttonclicked(id) async{ 
  //   showDialog(
  //     context: context, 
  //     builder: (ctx){
  //       return AlertDialog(
  //         content:const Text('Do You Want To Delete Details?'),
  //         actions: [
  //           TextButton(
  //             onPressed: (){
                
  //               Navigator.of(context).pop();
  //               ScaffoldMessenger.of(context).showSnackBar(
  //                 const SnackBar(
  //                   duration: Duration(seconds: 2),
  //                   behavior: SnackBarBehavior.floating,
  //                   backgroundColor:  Color.fromARGB(255, 219, 14, 14),
  //                   margin: EdgeInsets.all(75),
  //                   content: Text(
  //                     'Student Details Deleted',
  //                     textAlign: TextAlign.center,
 
  //                   ),
  //                 ),
  //               );                
  //             }, 
  //             child:const Text('YES'),
  //           ),
  //           TextButton(
  //             onPressed: (){
  //               Navigator.of(context).pop();
  //             }, 
  //             child:const Text('NO')
  //           )
  //         ],
  //       );
  //     }
  //   );
  // }

}

