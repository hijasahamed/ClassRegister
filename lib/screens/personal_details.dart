import 'package:class_register/screens/update_student.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {  
    Details({super.key,required this.details});

    var details;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.details['name'],style:const TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);}, 
          icon:const  Icon(Icons.arrow_back,color: Colors.white,)
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding:const  EdgeInsets.all(8.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child:  Column(
              children: [
                 Card(
                  elevation: 10,              
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [
                         SizedBox(
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                                 CircleAvatar(
                                  radius: 80,
                                  backgroundImage: NetworkImage(widget.details['image']),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: (){                                    
                                        Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                            builder: (ctx) {
                                              return UpdateStudent(
                                                stdDetails: widget.details,
                                              );
                                            },
                                          ),
                                        );                           
                                      }, icon:const Icon(Icons.edit,color: Colors.green,)
                                    ),
                                  ],
                                )
                             ],
                           ),
                         ),
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('NAME: ${widget.details['name']}',style:const TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              Text('AGE: ${widget.details['age']}',style:const TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              Text('ADDRESS: ${widget.details['place']}',style:const TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              Text('MOBILE: ${widget.details['mobile']}',style:const TextStyle(fontSize: 18,fontWeight: FontWeight.w900),), 
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}