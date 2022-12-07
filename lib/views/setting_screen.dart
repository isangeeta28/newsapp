import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controller/themeNotifier.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _values = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height*0.3,
                width: Get.width*0.999,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: Get.height*0.03),
                    Text('Settings',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),),
                    SizedBox(height: Get.height*0.02),
                    Padding(
                      padding:  EdgeInsets.only(left: Get.width*0.1, right: Get.width*0.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 53,
                          ),
                          SizedBox(width: Get.width*0.055,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Michael Faradey',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black, fontSize: 18
                                ),),
                              SizedBox(height: Get.height*0.005,),
                              Text('michaelfaradey@gmail.com',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey, fontSize: 16
                              ),),
                              SizedBox(height: Get.height*0.02,),
                              Text('Sign Out',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.orangeAccent, fontSize: 18
                              ),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: Get.width*0.06, right: Get.width*0.06, top: Get.height*0.02),
                child: Column(
                  children: [
                    Container(
                      height: Get.height*0.15,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: Get.width*0.05, right: Get.width*0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Dark Mood',
                                style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                                Switch(
                                  // thumb color (round icon)
                                  activeColor: Colors.amber,
                                  activeTrackColor: Colors.deepOrange,
                                  inactiveThumbColor: Colors.blueGrey.shade600,
                                  inactiveTrackColor: Colors.grey.shade400,
                                  splashRadius: 70.0,
                                  // boolean variable value
                                  value: _values,
                                  // changes the state of the switch
                                  onChanged: (value) => setState(() => _values = value),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: Get.width*0.05, right: Get.width*0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Notifications',
                                  style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                                Switch(
                                  // thumb color (round icon)
                                  activeColor: Colors.amber,
                                  activeTrackColor: Colors.deepOrange,
                                  inactiveThumbColor: Colors.blueGrey.shade600,
                                  inactiveTrackColor: Colors.grey.shade400,
                                  splashRadius: 70.0,
                                  // boolean variable value
                                  value: _values,
                                  // changes the state of the switch
                                  onChanged: (value) => setState(() => _values = value),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: Get.width*0.06, right: Get.width*0.06, top: Get.height*0.03),
                child: Text("Account",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),),
              ),
              Padding(
                padding:  EdgeInsets.only(left: Get.width*0.06, right: Get.width*0.06, top: Get.height*0.02),
                child: Column(
                  children: [
                    Container(
                      height: Get.height*0.2,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: Get.width*0.05, right: Get.width*0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Edit Account',
                                  style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                                IconButton(
                                    onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,size: 18,))
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: Get.width*0.05, right: Get.width*0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Change Password',
                                  style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                                IconButton(
                                    onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,size: 18,))
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: Get.width*0.05, right: Get.width*0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Language',
                                  style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                                IconButton(
                                    onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,size: 18,))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: Get.width*0.06, right: Get.width*0.06, top: Get.height*0.032),
                child: Text("Privacy and Security",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),),
              ),
              Padding(
                padding:  EdgeInsets.only(left: Get.width*0.06, right: Get.width*0.06, top: Get.height*0.02),
                child: Column(
                  children: [
                    Container(
                      height: Get.height*0.15,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: Get.width*0.05, right: Get.width*0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Private Account',
                                  style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                                Switch(
                                  // thumb color (round icon)
                                  activeColor: Colors.amber,
                                  activeTrackColor: Colors.deepOrange,
                                  inactiveThumbColor: Colors.blueGrey.shade600,
                                  inactiveTrackColor: Colors.grey.shade400,
                                  splashRadius: 70.0,
                                  // boolean variable value
                                  value: _values,
                                  // changes the state of the switch
                                  onChanged: (value) => setState(() => _values = value),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: Get.width*0.05, right: Get.width*0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Privacy and Security Help',
                                  style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.w600),),
                                IconButton(
                                    onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,size: 18,))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height*0.02,)
            ],
          ),
        ),
      ),
    );
  }
}
