// import 'package:flutter/material.dart';
// import '45_bloc_stateManagement_flutterBlocPackage.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MainPage(),
//     );
//   }
// }

// FLutter 44 BLoC (Bussiness Logic Component) State State mangment (Stream controller & Strea, Builder)
import 'package:flutter/material.dart';
import '44_color_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_amber);
              },
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.lightBlue,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_light_blue);
              },
            )
          ],
        ),
        appBar: AppBar(
          title: Text("Bloc Tanpa Lbrary"),
        ),
        body: Center(
            child: StreamBuilder(
          stream: bloc.stateStream,
          initialData: Colors.amber,
          builder: (context, snapshot) {
            return AnimatedContainer(
              duration: Duration(seconds: 500),
              width: 100,
              height: 100,
              color: snapshot.data,
            );
          },
        )),
      ),
    );
  }
}

// // FLutter 44 BLoC (Bussiness Logic Component) State State mangment (Stream controller & Strea, Builder)
// import 'package:flutter/material.dart';
// import 'package:flutter37_tu_up/44_color_bloc.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   ColorBloc bloc = ColorBloc();

//   @override
//   void dispose() {
//     bloc.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         floatingActionButton: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             FloatingActionButton(
//               backgroundColor: Colors.amber,
//               onPressed: () {
//                 bloc.eventSink.add(ColorEvent.to_amber);
//               },
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             FloatingActionButton(
//               backgroundColor: Colors.lightBlue,
//               onPressed: () {
//                 bloc.eventSink.add(ColorEvent.to_light_blue);
//               },
//             )
//           ],
//         ),
//         appBar: AppBar(
//           title: Text("Bloc Tanpa Lbrary"),
//         ),
//         body: Center(
//             child: StreamBuilder(
//           stream: bloc.stateStream,
//           initialData: Colors.amber,
//           builder: (context, snapshot) {
//             return AnimatedContainer(
//               duration: Duration(seconds: 500),
//               width: 100,
//               height: 100,
//               color: snapshot.data,
//             );
//           },
//         )),
//       ),
//     );
//   }
// }

// // Belajar State Management Provider
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'belajar_provider/pages/HomePage.dart';
// import 'belajar_provider/provider/BlocUser.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Buatlah return nya ke ChangeNotifier agar data di keseluruhan page
//     // Selalu diupdate
//     // Yang mana valuenya kita arahkan ke pada file BlocUser
//     return ChangeNotifierProvider<BlocUser>.value(
//       value: BlocUser(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: HomePage(),
//         debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }

// // Fllutter 43 Provide State MAnegement (Multi provider)
// // // tambahkan provider pada pubscey caml
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '43_1_cart.dart';
// import '43_2_money.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MultiProvider(
//         providers: [
//           // ChangeNotifierProvider<Money>(
//           //   builder: (context) => Money(),
//           // ),
//           ChangeNotifierProvider<Money>(
//             create: (context) => Money(),
//           ),
//           // ChangeNotifierProvider<Cart>(
//           //   builder: (context) => Cart(),
//           // )
//           ChangeNotifierProvider<Cart>(
//             create: (context) => Cart(),
//           )
//         ],
//         child: Scaffold(
//           floatingActionButton: Consumer<Money>(
//             builder: (context, money, _) => Consumer<Cart>(
//               builder: (context, cart, _) => FloatingActionButton(
//                 onPressed: () {
//                   if (money.balance >= 500) {
//                     cart.quantity += 1;
//                     money.balance -= 500;
//                   }
//                 },
//                 child: Icon(Icons.add_shopping_cart),
//                 backgroundColor: Colors.purple,
//               ),
//             ),
//           ),
//           appBar: AppBar(
//             title: Text("Multi Provider"),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text("Balance"),
//                     Container(
//                       child: Align(
//                         alignment: Alignment.centerRight,
//                         child: Consumer<Money>(
//                           builder: (context, money, _) => Text(
//                             money.balance.toString(),
//                             style: TextStyle(
//                                 color: Colors.purple,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                         ),
//                       ),
//                       height: 30,
//                       width: 150,
//                       margin: EdgeInsets.all(5),
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.purple[100],
//                         border: Border.all(color: Colors.purple, width: 2),
//                       ),
//                     )
//                   ],
//                 ),
//                 Container(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Consumer<Cart>(
//                       builder: (context, cart, _) => Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Apple (500) x " + cart.quantity.toString(),
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                           Text(
//                             (500 * cart.quantity).toString(),
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   height: 30,
//                   margin: EdgeInsets.all(5),
//                   padding: EdgeInsets.all(5),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     border: Border.all(color: Colors.black, width: 2),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Flutter 42 Provider State Managemenet
// // tambahkan provider pada pubscey caml
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '42_application_color.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ChangeNotifierProvider<ApplicatioColor>(
//         //tambahkan <ApplicationColor> untuk menuggu perubahan
//         create: (context) => ApplicatioColor(), //gunakan create bukan builder
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.black,
//             title: Consumer<ApplicatioColor>(
//               builder: (context, applicationColor, _) => Text(
//                 "Provider State Management",
//                 style: TextStyle(color: applicationColor.color),
//               ),
//             ),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Consumer<ApplicatioColor>(
//                   builder: (context, applicatinColor, _) => AnimatedContainer(
//                     //di dalam builder memiliki 3 parameter, parameter kedua isi nama objek class applicationColor yang telah di buat
//                     width: 100,
//                     height: 100,
//                     color: applicatinColor.color,
//                     duration: Duration(milliseconds: 500),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.all(5),
//                       child: Text("AB"),
//                     ),
//                     Consumer<ApplicatioColor>(
//                       builder: (context, applicationColor, _) => Switch(
//                           value: applicationColor.isLightBlue,
//                           onChanged: (newValue) {
//                             applicationColor.isLightBlue = newValue;
//                           }),
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(5),
//                       child: Text("UB"),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Flutter 41 Shared Preferences_Double Question Mark Oeprator(__)
// // Tambahkan shared_preferences pada pubscec.yaml
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   TextEditingController controller = TextEditingController(text: "No Name");
//   bool isOn = false;

// // void dengan async await
//   void saveData() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.setString("nama", controller.text);
//     pref.setBool("ison", isOn);
//   }

//   Future<String> getNama() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     return pref.get("nama") ?? "No Name";
//   }

//   Future<bool> getOn() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     return pref.getBool("ison") ?? false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Shared Preferred Example"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               TextField(
//                 controller: controller,
//               ),
//               Switch(
//                 value: isOn,
//                 onChanged: (newvalue) {
//                   setState(() {
//                     isOn = newvalue;
//                   });
//                 },
//               ),
//               RaisedButton(
//                   child: Text("Simpan"),
//                   onPressed: () {
//                     saveData();
//                   }),
//               RaisedButton(
//                   child: Text("Proses"),
//                   onPressed: () {
//                     getNama().then((s) {
//                       controller.text = s;
//                       setState(() {});
//                     });
//                     getOn().then((b) {
//                       isOn = b;
//                       setState(() {});
//                     });
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Flutter 40 Shared Preferences_Double Question Mark Oeprator(__)
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   TextEditingController controller = TextEditingController(text: "No Name");
//   bool isOn = false;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Shared Preferred Example"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               TextField(
//                 controller: controller,
//               ),
//               Switch(
//                   value: isOn,
//                   onChanged: (newvalue) {
//                     isOn = newvalue;
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Flutter 40 Animated Padding Widget
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   double myPadding = 5;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Animated Padding"),
//         ),
//         body: Column(
//           children: <Widget>[
//             Flexible(
//               flex: 1,
//               child: Row(
//                 children: <Widget>[
//                   Flexible(
//                     flex: 1,
//                     child: AnimatedPadding(
//                       duration: Duration(seconds: 1),
//                       padding: EdgeInsets.all(myPadding),
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             myPadding = 20;
//                           });
//                         },
//                         child: Container(
//                           color: Colors.red,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: AnimatedPadding(
//                       duration: Duration(seconds: 1),
//                       padding: EdgeInsets.all(myPadding),
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             myPadding = 40;
//                           });
//                         },
//                         child: Container(
//                           color: Colors.green,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Flexible(
//               flex: 1,
//               child: Row(
//                 children: <Widget>[
//                   Flexible(
//                     flex: 1,
//                     child: AnimatedPadding(
//                       duration: Duration(seconds: 1),
//                       padding: EdgeInsets.all(myPadding),
//                       child: Container(
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: AnimatedPadding(
//                       duration: Duration(seconds: 1),
//                       padding: EdgeInsets.all(myPadding),
//                       child: Container(
//                         color: Colors.yellow,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // FLutter 39_switch_and_animated_switcher Widget
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool isOn = false;
//   Widget myWidget = Container(
//     width: 200,
//     height: 100,
//     decoration: BoxDecoration(
//         color: Colors.red, border: Border.all(color: Colors.black, width: 3)),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Animated Switcher"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               AnimatedSwitcher(
//                 child: myWidget,
//                 duration: Duration(seconds: 1),
//                 // transitionBuilder: (child, animation) => ScaleTransition( //menggunakan Scale
//                 //   scale: animation,
//                 //   child: child,
//                 transitionBuilder: (child, animation) => RotationTransition(
//                   //dengan gaya rotasi
//                   turns: animation,
//                   child: child,
//                 ),
//               ),
//               Switch(
//                   activeColor: Colors.green[900],
//                   inactiveThumbColor: Colors.red[900],
//                   inactiveTrackColor: Colors.red,
//                   value: isOn,
//                   onChanged: (newValue) {
//                     isOn = newValue;
//                     setState(() {
//                       if (isOn) //disini isOn == true
//                         myWidget = Container(
//                           key: ValueKey(1),
//                           width: 200,
//                           height: 100,
//                           decoration: BoxDecoration(
//                               color: Colors.green,
//                               border:
//                                   Border.all(color: Colors.black, width: 3)),
//                         );
//                       // myWidget = SizedBox(
//                       //   width: 200,
//                       //   height: 100,
//                       //   child: Center(
//                       //     child: Text(
//                       //       "Switch : On",
//                       //       style: TextStyle(
//                       //           color: Colors.green,
//                       //           fontWeight: FontWeight.w700,
//                       //           fontSize: 20),
//                       //     ),
//                       //   ),
//                       // );
//                       else
//                         myWidget = Container(
//                           key: ValueKey(2),
//                           width: 200,
//                           height: 100,
//                           decoration: BoxDecoration(
//                               color: Colors.red,
//                               border:
//                                   Border.all(color: Colors.black, width: 3)),
//                         );
//                     });
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Flutter 38 HTTP request koneksi ke API(Kumpulan data)
// import 'package:flutter/material.dart';
// import '38_user_model.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String output = "no data";

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("API Demo"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Text(output),
//               RaisedButton(
//                 onPressed: () {
//                   User.getUsers("2").then((users) {
//                     output = "";
//                     for (int i = 0; i < users.length; i++)
//                       output = output + "[ " + users[i].name + " ]";
//                     setState(() {});
//                   });
//                 },
//                 child: Text("GET"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // FLutter 37.  HTTP Request / Koneksi ke API (Get Method)
// import 'package:flutter/material.dart';
// import 'user_model.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   User user = null;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("API Demo"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Text((user != null)
//                   ? user.id +
//                       " |  " +
//                       user.name +
//                       " \n " +
//                       user.mail +
//                       "\n " +
//                       user.vatar
//                   : "Tidak ada Data"),
//               RaisedButton(
//                 onPressed: () {
//                   User.connectToApi("5").then((value) {
//                     user = value;
//                     setState(() {});
//                   });
//                 },
//                 child: Text("GET"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// FLUTTER 36. HTTP Request / Koneksi ke API (Post Method)
// import 'package:flutter/material.dart';
// import 'post_result_model.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   PostResult postResult = null;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("API Demo"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Text((postResult != null)
//                   ? postResult.id +
//                       " |  " +
//                       postResult.name +
//                       " | " +
//                       postResult.job +
//                       " | " +
//                       postResult.created
//                   : "Tidak ada Data"),
//               RaisedButton(
//                 onPressed: () {
//                   PostResult.connectToAPI("Ibnu", "Mahasiswa").then((value) {
//                     postResult = value;
//                     setState(() {});
//                   });
//                 },
//                 child: Text("POST"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'belajar_async_await.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   PostResult postResult = new PostResult();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Pelajari async await Dart"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Text((PostResult != null)
//                   ? "${postResult.data} "
//                   : "Tidak ada Data"),
//               RaisedButton(
//                 onPressed: () {
//                   PostResult.connectToAPI("2").then((value) {
//                     setState(() {
//                       postResult = value;
//                     });
//                   });
//                 },
//                 child: Text("Kirim"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
