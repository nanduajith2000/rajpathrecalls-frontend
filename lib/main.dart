import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'my_flutter_app_icons.dart';


void main()=>runApp( const MaterialApp(
  home:Radio(),
));

class Radio extends StatefulWidget {
  const Radio({super.key});
  @override
  State<Radio> createState() => _RadioState();
}

class _RadioState extends State<Radio> {
  int _selectedIndex=0;

  static const List<Widget> _widgets=<Widget>[
    Home(),
    AboutUs()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Center(
      child: _widgets.elementAt(_selectedIndex)
    ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.short_text),
              label: 'About Us',
            ),
          ],
          backgroundColor: Colors.white70,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.lightBlue,
          onTap: _onItemTapped,
        ),);
  }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isPressed=false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191931),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 32.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  const [
            Text('\nRajpath',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,color: Color(0xFFFA3232),fontFamily: 'OpenSans')),
            Text('\nRecalls',style: TextStyle(fontSize: 24.0,color: Colors.white,fontFamily: 'OpenSans')),
          ],
        )),
          Padding(padding: const EdgeInsets.fromLTRB(0, 32.0, 0, 32.0),
            child: Container(
            width: 190.0,
            height: 190.0,
            decoration: const BoxDecoration(
                color: Color.fromARGB(51, 250, 58, 58),
                shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Container(
              width: 160.0,
              height: 160.0,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(58, 250, 58, 58),
                  shape: BoxShape.circle),
              alignment: Alignment.center,
              child: Container(
                width: 130.0,
                height: 130.0,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(64, 250, 58, 58),
                    shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Container(
                    width: 100.0,
                    height: 100.0,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(70, 250, 58, 58),
                        shape: BoxShape.circle),
                    child:Container(
                      width: 70.0,
                      height: 70.0,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 250, 50, 50),
                                Color.fromARGB(255, 209, 16, 122),
                              ]),
                          shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4.0, // soften the shadow
                            spreadRadius: 4.0, //extend the shadow

                          )
                        ],),
                      child: FittedBox(

                      child: IconButton(
                        alignment: Alignment.center,
                        icon:(isPressed)? const Icon(Icons.pause_outlined):const Icon(Icons.play_arrow_outlined),
                        iconSize: 35.0,

                        color: const Color(0xFFE8E7E3),
                        onPressed: () {
                          if(isPressed==false) {
                            setState(() {
                             isPressed=true;
                            });
                          }
                          else {
                            setState(() {
                              isPressed=false;
                            });
                          }
                        },))
                    )
                ),
              ),
            ),
          ),),
          Padding(padding: const EdgeInsets.fromLTRB(0, 32.0, 0, 32.0),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  const [
              Text('MusicCloud',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'OpenSans')),
              Text(' 1000+ Songs',style: TextStyle(fontSize: 14.0,color: Colors.white70,fontFamily: 'OpenSans')),
            ],
          )),
        const Text('Pausing causes lagging\n\n',style: TextStyle(color: Colors.white38,fontSize: 10.0,fontFamily: 'OpenSans'),)
        ],
      ),

          Container(
            alignment: Alignment.center,
            width:280,
            child: Padding(padding:const EdgeInsets.fromLTRB(20, 32, 20, 32),child:Column(
              children: [
                const Text('Recall & Request\n',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white70,fontFamily: 'OpenSans')),
                RichText(
                    text: TextSpan(
                        children: [
                          const TextSpan(
                              style: TextStyle(fontSize: 13,color: Colors.white70,fontFamily: 'OpenSans'),
                              text: "A radio without its listeners is like food without salt and spices. We would love to be able to connect with all of our listeners and help improve your experience. Here you will find a "
                          ),
                          TextSpan(
                              style: const TextStyle(fontSize: 13,color: Colors.lightBlue,fontFamily: 'OpenSans'),
                              text: "google form",
                              recognizer: TapGestureRecognizer()..onTap =  () async{
                                var url = "https://docs.google.com/forms/d/e/1FAIpQLSfCzrqHG-wZ9ebhvSJ6wzwa8Xj4wqsE-vAb_lYs-2E46CXVtA/viewform";
                                if (await canLaunchUrlString(url)) {
                                  await launchUrlString(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }
                          ),
                          const TextSpan(
                              style: TextStyle(fontSize: 13,color: Colors.white70,fontFamily: 'OpenSans'),
                              text: " where you can make song requests, song dedications for Serenade, share stories for our Chai Un-Cut or give topics to be discussed in Unfiltered."
                          ),
                        ]
                    ))
              ],
            ))
          ),
          Container(
              alignment: Alignment.center,
              width:280,
              child: Padding(padding:const EdgeInsets.fromLTRB(20, 64, 20, 64),child:Column(
                children:  [
                  const Text('Contact Us\n',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white70,fontFamily: 'OpenSans')),
                  const Text('Any new venture can grow only with the help of constant feedback. Feel free to contact us\n',style: TextStyle(fontSize: 13,color:Colors.white70,fontFamily: 'OpenSans')),
                  RichText(text: TextSpan(style:const TextStyle(fontSize: 13,color:Colors.lightBlue,fontFamily: 'OpenSans'),
                      text:"rajpathrecalls@gmail.com\n\n",
                      recognizer: TapGestureRecognizer()..onTap =  () async{
                        var url = "rajpathrecalls@gmail.com";
                        if (await canLaunchUrlString(url)) {
                          await launchUrlString(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    IconButton(onPressed:()=>launchUrlString('https://www.facebook.com/rajpath.recalls'), icon: const Icon(Icons.facebook),iconSize: 35,color: Colors.white70,),
                    IconButton(onPressed:()=>launchUrlString('https://www.linkedin.com/in/rajpath-recalls-radio-976757200/?originalSubdomain=in'), icon: const Icon(MyFlutterApp.linkedin),iconSize: 35,color: Colors.white70,),
                    IconButton(onPressed:()=>launchUrlString('https://github.com/rajpathrecalls'), icon: const Icon(MyFlutterApp.github),iconSize: 35,color: Colors.white70,),
                    IconButton(onPressed:()=>launchUrlString('https://www.instagram.com/rajpath.recalls_nitc/'), icon: const Icon(MyFlutterApp.instagram),iconSize: 35,color: Colors.white70,),
                  ],)
                ],
              ))
          )])),
    );
  }}

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191931),
        body:Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child:SingleChildScrollView(scrollDirection: Axis.vertical, child:Column(
                children:  [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  const [
                      Text('About',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,color: Color(0xFFFA3232),fontFamily: 'OpenSans')),
                      Text('Us',style: TextStyle(fontSize: 24.0,color: Colors.white,fontFamily: 'OpenSans')),
                    ],
                  ),
                  const Text('\nThe Rajpath RECalls Web App is for radio broadcasting events happening in and related to NIT Calicut, which is conducted for and by the students. This is a broadcasting open-source web app, with multiple features including:\n',style: TextStyle(color:Colors.white70,fontSize: 13,fontFamily: 'OpenSans'),),
                  Row(
                      children:const [
                        Text("\u2022", style: TextStyle(fontSize: 13,color:Colors.white70,fontFamily: 'OpenSans'),), //bullet text
                        SizedBox(width: 10,), //space between bullet and text
                        Expanded(
                          child:Text("Real-time update of events and its schedule", style: TextStyle(fontSize: 13,color:Colors.white70,fontFamily: 'OpenSans'),), //text
                        )
                      ]
                  ),
                  Row(
                      children:const [
                        Text("\u2022", style: TextStyle(fontSize: 13,color:Colors.white70,fontFamily: 'OpenSans'),), //bullet text
                        SizedBox(width: 10,), //space between bullet and text
                        Expanded(
                          child:Text("Live comment section", style: TextStyle(fontSize: 13,color:Colors.white70,fontFamily: 'OpenSans'),), //text
                        )
                      ]
                  ),
                  Row(
                      children:const [
                        Text("\u2022", style: TextStyle(fontSize: 13,color:Colors.white70),), //bullet text
                        SizedBox(width: 10,), //space between bullet and text
                        Expanded(
                          child:Text("Play-in background set-up", style: TextStyle(fontSize: 13,color:Colors.white70,fontFamily: 'OpenSans'),), //text
                        )
                      ]
                  ),
                  Row(
                      children:const [
                        Text("\u2022", style: TextStyle(fontSize: 13,color:Colors.white70),), //bullet text
                        SizedBox(width: 10,), //space between bullet and text
                        Expanded(
                          child:Text("Accessible from the notification bar", style: TextStyle(fontSize: 13,color:Colors.white70,fontFamily: 'OpenSans'),), //text
                        )
                      ]
                  ),
                  Row(
                      children:const [
                        Text("\u2022", style: TextStyle(fontSize: 13,color:Colors.white70),), //bullet text
                        SizedBox(width: 10,), //space between bullet and text
                        Expanded(
                          child:Text("Ad-free", style: TextStyle(fontSize: 13,color:Colors.white70,fontFamily: 'OpenSans'),), //text
                        )
                      ]
                  ),
                  Row(
                      children:const [
                        Text("\u2022", style: TextStyle(fontSize: 13,color:Colors.white70),), //bullet text
                        SizedBox(width: 10,), //space between bullet and text
                        Expanded(
                          child:Text("Responsive to all devices", style: TextStyle(fontSize: 13,color:Colors.white70,fontFamily: 'OpenSans'),), //text
                        )
                      ]
                  ),
                ],
              ))),));

  }
}

