
// import 'package:class_register/screens/personal_details.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Search extends SearchDelegate {

//   List data = [];
//   final CollectionReference std= FirebaseFirestore.instance.collection('students');

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//           },
//           icon: const Icon(Icons.clear_rounded))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: const Icon(Icons.arrow_back));
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return StreamBuilder(
//       stream: std.snapshots(), 
//       builder: (context,AsyncSnapshot snapshot){
//         final stdbox=snapshot.data.docs;
//         final filteredData =stdbox
//                 .where((data) =>
//                     data.name.toLowerCase().contains(query.toLowerCase()))
//                 .toList();
//         if(snapshot.hasData){
//           if(query.isEmpty){
//             return const SizedBox();
//           }
//           else if(filteredData.isEmpty){
//             return const  Column(
//               mainAxisAlignment: MainAxisAlignment.center ,
//             children: [
//               Center(child: Text('Sorry Searched Result Not Found',style: TextStyle(fontWeight: FontWeight.w500),)),
//             ],
//             );  
//           }
//           return ListView.builder(
//               itemBuilder: (ctx, index) {
//                 final data = filteredData[index];
//                 String namevalue = data['name'];
//                 if (namevalue.toLowerCase().contains(query.toLowerCase())) {
//                   return Column(
//                     children: [
//                       ListTile(
//                         onTap: () {                       
//                           Navigator.of(context).pushReplacement(MaterialPageRoute(
//                             builder: (ctx) => Details(details: data) 
//                           ));
//                         },
//                         leading: CircleAvatar(
//                           radius: 80,
//                           child: Icon(Icons.person),
//                         ),
//                         title: Text(
//                           data['name'],
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
                        
//                       ),
//                       const SizedBox(height: 12,),
//                     ],
//                   );
//                 } 
//                 else {
//                   return const SizedBox();
//                 }
//               },
//               itemCount: filteredData.length,
//             );
//         }
//         else{
//           return const SizedBox();
//         }
//       }
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//      return StreamBuilder(
//       stream: std.snapshots(), 
//       builder: (context,AsyncSnapshot snapshot){
//         final stdbox=snapshot.data.docs;
//         final filteredData =stdbox
//                 .where((data) =>
//                     data.name.toLowerCase().contains(query.toLowerCase()))
//                 .toList();
//         if(snapshot.hasData){
//           if(query.isEmpty){
//             return const SizedBox();
//           }
//           else if(filteredData.isEmpty){
//             return const  Column(
//               mainAxisAlignment: MainAxisAlignment.center ,
//             children: [
//               Center(child: Text('Sorry Searched Result Not Found',style: TextStyle(fontWeight: FontWeight.w500),)),
//             ],
//             );  
//           }
//           return ListView.builder(
//               itemBuilder: (ctx, index) {
//                 final data = filteredData[index];
//                 String namevalue = data['name'];
//                 if (namevalue.toLowerCase().contains(query.toLowerCase())) {
//                   return Column(
//                     children: [
//                       ListTile(
//                         onTap: () {                       
//                           Navigator.of(context).pushReplacement(MaterialPageRoute(
//                             builder: (ctx) => Details(details: data) 
//                           ));
//                         },
//                         leading: CircleAvatar(
//                           radius: 80,
//                           child: Icon(Icons.person),
//                         ),
//                         title: Text(
//                           data['name'],
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
                        
//                       ),
//                       const SizedBox(height: 12,),
//                     ],
//                   );
//                 } 
//                 else {
//                   return const SizedBox();
//                 }
//               },
//               itemCount: filteredData.length,
//             );
//         }
//         else{
//           return const SizedBox();
//         }
//       }
//     );
//   }
// }