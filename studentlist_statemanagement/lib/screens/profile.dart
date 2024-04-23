

import 'dart:io';

 import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';

class ScreenProfile extends StatelessWidget {
  final Map<String, dynamic> studentData;

  ScreenProfile({required this.studentData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.blue[200]),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 75, 120),
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          
          child: Center(
            
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: studentData['images'] != null
                            ? FileImage(File(studentData['images'])) as ImageProvider<Object>
                            : AssetImage('assets/default_image.jpg'),
                            radius: 70, // Default image if image path is null
                  
                  ),
                   SizedBox(
                    height: 30,
                  ),
                  Material(
                     elevation: 8,
                     borderRadius: BorderRadius.circular(10),
                  child: 
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                     color: Colors.blue[400],
                    ),
                     height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.height * 0.3,
                        child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:  Colors.white54,
                          borderRadius: BorderRadius.circular(8)),
                                      width: double.infinity,
                                      child: Text('Name: ${studentData['name']}'),
                        
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(8)),
                                      width: double.infinity,
                                      child: Text('Age: ${studentData['age']}'),
                        
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(8)),
                                      width: double.infinity,
                                      child: Text('Contact Number: ${studentData['contact']}'),
                        
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(8)),
                                      width: double.infinity,
                                      child: Text('Roll Number: ${studentData['rollnumber']}'),
                        
                      ),
                 ],
                 
                  ),
                
                  ),
                 
                
               ) ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
