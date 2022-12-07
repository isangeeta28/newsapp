import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/home_page_controller.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var estateRooms = [
    EstateRoom(isSelected:  false,name: "All news", ),
    EstateRoom(isSelected:  false,name: "Business"),
    EstateRoom(isSelected:  false,name: "Politics"),
    EstateRoom(isSelected:  false,name: "Tech"),
    EstateRoom(isSelected:  false,name: "Science"),
    EstateRoom(isSelected:  false,name: "Sports"),
    EstateRoom(isSelected:  false,name: "Movies"),
    EstateRoom(isSelected:  false,name: "Bollywood"),
    EstateRoom(isSelected:  false,name: "International"),
  ];
  bool isChecked = false;

  int _current = 0;
  final CarouselController _controller = CarouselController();
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetX<HomePageController>(
          init: Get.put(HomePageController()),
          builder: (homepageCon){
            return homepageCon.homepageresData.value.articles == null
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
              height: Get.height*0.99,
                  child: SingleChildScrollView(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    SizedBox(height: Get.height*0.02,),
                    Padding(
                      padding:  EdgeInsets.only(left: Get.width*0.045),
                      child: Container(
                        height: Get.height*0.038,
                        width: Get.width*0.19,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(begin: FractionalOffset.topLeft, end: FractionalOffset.bottomRight, colors: [
                            Colors.orangeAccent,
                            Colors.deepOrangeAccent,
                            Colors.deepOrangeAccent,
                            Colors.black,
                          ], stops: [
                            0.0,
                            0.2,
                            0.6,
                            0.5,
                          ]),
                        ),
                        child: Center(child: Text(' oxu az',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),)),
                      ),
                    ),
                    SizedBox(height: Get.height*0.02,),
                    Padding(
                      padding:  EdgeInsets.only(left: Get.width*0.045),
                      child: SizedBox(
                        width: Get.width*0.99,
                        height: Get.height*0.033,
                        child: ListView.separated(
                            itemCount: estateRooms.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (BuildContext context, int index)=> SizedBox(width: Get.width*0.035,),
                            itemBuilder: (BuildContext context, int index){
                              return GestureDetector(
                                onTap: (){
                                  setState(()
                                  {for (var element in estateRooms) {element.isSelected = false;}
                                  estateRooms[index].isSelected = !estateRooms[index].isSelected;
                                  });
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: estateRooms[index].isSelected?BorderSide(width: 3.0, color: Colors.orange.shade500):BorderSide(width: 3.0, color: Colors.white),
                                      ),
                                    ),
                                    child: Text(estateRooms[index].name)),
                              );
                            }
                        ),
                      ),
                    ),
                    Container(
                      //height: Get.height*0.7785,
                      width: Get.width*0.999,
                      color: Colors.grey.shade300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.height*0.02,),
                          CarouselSlider.builder(
                            options: CarouselOptions(
                              height: 180.0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              viewportFraction: 0.8,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }
                            ),
                            itemCount: homepageCon.homepageresData.value.articles?.length,
                            itemBuilder: (BuildContext context, int index, int realIndex) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(homepageCon.homepageresData.value.articles![index].urlToImage??""),
                                      fit: BoxFit.cover,
                                    ),
                                     // color: Colors.amber
                                  ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('2 hours ago',
                                          style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.w600
                                          ),),
                                          Icon(Icons.bookmark,color: Colors.white,)
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left: Get.width*0.03,top: Get.height*0.09),
                                      child: SizedBox(
                                          width: Get.width*0.6,
                                          child: Text(homepageCon.homepageresData.value.articles![index].title??"",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                              fontSize: 17,color: Colors.white
                                            ),)),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: homepageCon.homepageresData.value.articles!.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () => _controller.animateToPage(entry.key),
                                child: Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Theme.of(context).brightness == Brightness.dark
                                          ? Colors.orangeAccent
                                          : Colors.deepOrangeAccent)
                                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: Get.height*0.02,),
                          Padding(
                            padding:  EdgeInsets.only(left: Get.width*0.1),
                            child: Text('Latest News',
                            style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 26
                            ),),
                          ),
                          SizedBox(height: Get.height*0.02,),
                          Padding(
                            padding:  EdgeInsets.only(left: Get.width*0.1),
                            child: Container(
                              // width: Get.width*0.99,
                              // height: Get.height*0.4,
                              child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: homepageCon.homepageresData.value.articles!.length,
                                  separatorBuilder: (BuildContext context, int index)=> SizedBox(height: Get.height*0.019,),
                                  itemBuilder: (BuildContext context, int indexdata){
                                    var articledata = homepageCon.homepageresData.value.articles;
                                    final apidate = homepageCon.homepageresData.value.articles?[indexdata].publishedAt!.toString();
                                    var date =  apidate;
                                    var dateTime =  DateTime.parse("$date");
                                    var stdTime =  DateFormat('hh:mm').format(dateTime).toString();
                                    return GestureDetector(
                                      onTap: (){
                                        Get.to(()=>DetailsScreen(
                                          title: articledata?[indexdata].title,
                                          description : articledata?[indexdata].description,
                                          image : articledata?[indexdata].urlToImage,
                                        ));
                                      },
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.only(left: Get.width*0.1,top: Get.height*0.04),
                                            child: Container(
                                              height: Get.height*0.14,
                                              width: Get.width*0.84,
                                              padding: EdgeInsets.only(left: Get.width*0.18, top: Get.height*0.015),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    width: Get.width*0.6,
                                                      child: Text(articledata?[indexdata].title??"",
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w600
                                                      ),)),
                                                  SizedBox(height: Get.height*0.01,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("15 minutes ago"),
                                                      IconButton(
                                                          onPressed: (){
                                                            setState(() {
                                                              value = !value;
                                                              String isPin = "YES";
                                                              if (value == true){
                                                                print("klik true");
                                                                isPin = "YES";
                                                              }else{
                                                                print("klik false");
                                                                isPin = "NO";
                                                              }
                                                            });
                                                          },
                                                          icon: value == true?Icon(Icons.bookmark,size: 16,color: Colors.orangeAccent,):Icon(Icons.bookmark,size: 16,))

                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                         Container(
                                           height: Get.height*0.16,
                                           width: Get.width*0.26,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(10),
                                             color: Colors.orangeAccent,
                                             image: DecorationImage(
                                               image: NetworkImage(homepageCon.homepageresData.value.articles![indexdata].urlToImage??""),
                                               fit: BoxFit.cover,
                                             ),
                                           ),
                                         ),

                                        ],
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height*0.02,),
                        ],
                      ),
                    )
              ],
            ),
                  ),
                );
          }
        ),
      ),
    );
  }
}

class EstateRoom {
  bool isSelected;
  String name;

  EstateRoom({required this.isSelected,required this.name});
}
