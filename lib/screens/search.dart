import 'package:cached_network_image/cached_network_image.dart';
import 'package:class_register/screens/fuctions.dart';
import 'package:class_register/screens/personal_details.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear_rounded))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override 
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: std.snapshots(), 
      builder: (context,AsyncSnapshot snapshot){
        if(query.isEmpty){
          return const Center(child: Text('Search for Students',style: TextStyle(fontWeight: FontWeight.w700),));
        }       
        if(snapshot.hasData && snapshot.data.docs.isNotEmpty){
          List  stdbox=snapshot.data.docs.toList();
          final filteredData =stdbox
                  .where((data) =>
                      data['name'].toLowerCase().contains(query.toLowerCase()))
                  .toList();
          if(query.isEmpty){
            return const SizedBox();
          }
          else if(filteredData.isEmpty){
            return const  Column(
              mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Center(child: Text('No Searching Matches Found',style: TextStyle(fontWeight: FontWeight.w500),)),
            ],
            );  
          }
          return ListView.builder(
              itemBuilder: (ctx, index) {
                final data = filteredData[index];
                String namevalue = data['name'];
                if (namevalue.toLowerCase().contains(query.toLowerCase())) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {                       
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => Details(details: data) 
                          ));
                        },
                        leading: 
                        data['image'] != null 
                        ? CircleAvatar(
                            radius: 30,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage( 
                                imageUrl: data['image'],                                      
                                fit: BoxFit.cover,
                                height: 50,
                                width: 50,
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
                            radius: 30,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage('assets/images/circle avatar.png'),
                        ),
                        title: Text(
                          data['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        
                      ),
                      const SizedBox(height: 12,),
                    ],
                  );
                } 
                else {
                  return const SizedBox();
                }
              },              
              itemCount: filteredData.length,
            );
        }
        else{
          return const SizedBox();
        }
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
     return StreamBuilder(
      stream: std.snapshots(), 
      builder: (context,AsyncSnapshot snapshot){       
        if(snapshot.hasData && snapshot.data.docs.isNotEmpty){
          List  stdbox=snapshot.data.docs.toList();
          final filteredData =stdbox
                  .where((data) =>
                      data['name'].toLowerCase().contains(query.toLowerCase()))
                  .toList();
          if(query.isEmpty){
            return const SizedBox();
          }
          else if(filteredData.isEmpty){
            return const  Column(
              mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Center(child: Text('Sorry Searched Result Not Found',style: TextStyle(fontWeight: FontWeight.w500),)),
            ],
            );  
          }
          return ListView.builder(
              itemBuilder: (ctx, index) {
                final data = filteredData[index];
                String namevalue = data['name'];
                if (namevalue.toLowerCase().contains(query.toLowerCase())) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {                       
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => Details(details: data) 
                          ));
                        },
                        leading: 
                        data['image'] != null 
                        ? CircleAvatar(
                            radius: 30,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage( 
                                imageUrl: data['image'],                                      
                                fit: BoxFit.cover,
                                height: 50,
                                width: 50,
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
                            radius: 30,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage('assets/images/circle avatar.png'),
                        ),
                        title: Text(
                          data['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        
                      ),
                      const SizedBox(height: 12,),
                    ],
                  );
                } 
                else {
                  return const SizedBox();
                }
              },
              itemCount: filteredData.length,
            );
        }
        else{
          return const SizedBox();
        }
      }
    );
  }
}