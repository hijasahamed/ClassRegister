import 'package:class_register/screens/add_student.dart';
import 'package:class_register/screens/list_student.dart';
import 'package:class_register/screens/search.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [           
            PopupMenuButton( 
              elevation: 20,
              shadowColor: Colors.grey,
              iconSize: 35,
              icon:const Icon(Icons.menu,color: Colors.white ,),
              itemBuilder: (context) => [
                PopupMenuItem(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){ return const ListStudent();}));
                },
                  value: 0,
                  child:const Row(
                    children: [
                      Icon(Icons.person,color: Colors.green,),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Students')
                    ],
                  ),
                ),
                const PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.star,color: Color.fromARGB(255, 247, 223, 3),),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Get The App')
                    ],
                  ),
                ),
                const PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.chrome_reader_mode,color: Colors.blue,),
                      SizedBox(
                        width: 10,
                      ),
                      Text('About')
                    ],
                  ),
                ),
                const PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.settings,color: Colors.grey,),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Settings')
                    ],
                  ),
                ),
              ]
            ),
            const Text('STUDENT REGISTER', style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),),
            IconButton(onPressed: () {
              showSearch(context: context, delegate: Search()); 
             }, icon:const  Icon(Icons.search,color: Colors.white,)
            ),
          ],
        ),
      ),
      body: Column( 
        children: [
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration:const BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(image: AssetImage('assets/images/class board.png'),fit: BoxFit.fill)
                ),
              ),
            ),
          ), 
          const Flexible(
            flex: 12 ,
            child: SizedBox(           
              child: Padding(
                padding: EdgeInsets.all(5),
                child: ListStudent(),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: SizedBox( 
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return const AddStudent();
                      }));
                    },                      
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 11, 11, 11),
                      minimumSize:const Size(200,60 )
                    ),
                    child:const Text('Add Student',style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w600,letterSpacing: 1),),
                  ),
              ),
            )
          ),
        ],
      ),
    );
  }
}