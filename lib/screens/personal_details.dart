import 'package:cached_network_image/cached_network_image.dart';
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
                                widget.details['image'] != null 
                                ? CircleAvatar(
                                    radius: 60,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(60),
                                      child: CachedNetworkImage( 
                                        imageUrl: widget.details['image'],                                      
                                        fit: BoxFit.cover,
                                        height: 120,
                                        width: 120,
                                        placeholder: (context, url) => const Padding(
                                          padding: EdgeInsets.all(5),
                                          child: CircularProgressIndicator(
                                              color: Colors.deepPurpleAccent,
                                              backgroundColor: Colors.transparent),
                                        ),
                                        errorWidget: (context, url, error) => const Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  )
                                : const CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Colors.black,
                                    backgroundImage: AssetImage('assets/images/circle avatar.png'),
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