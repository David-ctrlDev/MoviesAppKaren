// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:movies_app/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Movie Reactions"),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Wrap(children: [
          Container(
            width: size.width,
            height: size.height/15,
            decoration:BoxDecoration(
              color: kPrimaryColor
            ),
            child: Center(child: Text("Valora tus Pelis",style: TextStyle(color:Colors.white, fontWeight:FontWeight.bold,fontSize: 25),)),
          ),
          Center(
            child: Container(
            child: Container(
              margin: EdgeInsets.fromLTRB(10,20,10,20),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  child: Stack(
                    children: <Widget>[
                   
                      Image.network('https://i.ytimg.com/vi/bmgHuY-NnvA/maxresdefault.jpg',fit: BoxFit.cover,),
                      Text("Lo más nuevo"),
                    ]))))),
          Center(
            child: Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                height: size.height/2,
                width: size.width,
                
                child:ComplicatedImageDemo(),
                ),
          ),
    
        
          ]),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
        TabData(iconData: Icons.home, title: "Home"),
        TabData(iconData: Icons.search, title: "Search"),
        TabData(iconData: Icons.shopping_cart, title: "Basket")
    ],
    onTabChangedListener: (position) {
        setState(() {
        currentPage = position;
        });
    },
));
      
  
  }
}
class ComplicatedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 1,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
          ),
          items: imageSliders,
       );}
}


final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item['image'], fit: BoxFit.cover, width: 1000, ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5.0),
                        
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

    final List<dynamic> imgList = [
  {'image':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNtHK5JMh3SsPJbea3Bj6vpFRIXfTvRTS3GQ&usqp=CAU','text':"Gestionamos tus eventos de formación"},
  {'image':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNtHK5JMh3SsPJbea3Bj6vpFRIXfTvRTS3GQ&usqp=CAU','text':"Crece profesional mente, solicita tú auxilio educativo! "},
  {'image':'https://imgs.search.brave.com/9SrpmMpBHBBOqNN78mLhz558QFBDfvAAxbxZBVGtK5Q/rs:fit:320:225:1/g:ce/aHR0cHM6Ly90c2Ux/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5D/R2s2aDBvWXNFNWg2/WW1lNzJXaDFnSGFL/LSZwaWQ9QXBp','text':"Legaliza ágilmente los gastos de tú viaje"},
  {'image':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNtHK5JMh3SsPJbea3Bj6vpFRIXfTvRTS3GQ&usqp=CAU','text':"Materializa tus sueños, pide tú crédito"},
  {'image':'https://imgs.search.brave.com/WVPNMCzDVcYtp_UbBGwqIDZdEDwmGoy1AFJZnlsGUMc/rs:fit:320:225:1/g:ce/aHR0cHM6Ly90c2Ux/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5H/RUlQelRiUS1obUlH/NEFxTjNib1RBSGFL/LSZwaWQ9QXBp','text':"Tramita tus incapacidades"},
];

