import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyAppUI());
}

class MyAppUI extends StatelessWidget {
  const MyAppUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "UI Lessons",
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
          backgroundColor: Colors.white,
        ),
        body: BodyListView(),
      ),
    );
  }
}

class BodyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  final List<ListItem> items = List<ListItem>.generate(
      10000,
      (i) => i % 6 == 0
          ? HeadingItem('Heading $i')
          : MassageItem('Sender$i', 'Message body $i'));

  return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is HeadingItem) {
          return ListTile(
            title: Text(
              item.heading,
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        } else if (item is MassageItem) {
          return ListTile(
            title: Text(item.sender, style: TextStyle(fontSize: 10)),
            subtitle: Text(
              item.body,
              style: TextStyle(fontSize: 10),
            ),
            leading: Icon(
              Icons.insert_photo,
              color: Colors.red,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          );
        }
        return Text('');
      });
}

// return Card(
//   child: ListTile(
//     title: Text('${items[index]}'),
//     leading: Icon(
//       Icons.insert_photo,
//       color: Colors.red,
//     ),
//     trailing: Icon(Icons.keyboard_arrow_right),
//   ),
// );

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
}

class MassageItem implements ListItem {
  final String sender;
  final String body;
  MassageItem(this.sender, this.body);
}


// 1 - 4 lessons
//
// body: Container(
//   decoration: BoxDecoration(color: Colors.indigo, border: Border.all()),
//   width: 200,
//   height: 100,
//   padding: EdgeInsets.all(15),
//   margin: EdgeInsets.all(50),
//   alignment: Alignment.center,
//   child: Text(
//     "Test",
//     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//   ),
// ),

// lesson 5 Container
//
// body: Container(
//   decoration: BoxDecoration(color: Colors.grey, border: Border.all()),
//   child: Row(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: <Widget>[
//       Icon(
//         Icons.adjust,
//         size: 50,
//         color: Colors.white,
//       ),
//       Icon(
//         Icons.adjust,
//         size: 200,
//         color: Colors.red,
//       ),
//       Icon(
//         Icons.adjust,
//         size: 50,
//         color: Colors.green,
//       ),
//     ],
//   ),
// ),

// lesson 6 Row/Column
//
//  body: Row(
//           children: <Widget>[
//             Expanded(
//               flex: 3,
//               child: Image.network(
//                   'https://glimmernet.com/wp-content/uploads/2019/02/clip-path-example-bg.jpg'),
//             ),
//             Expanded(
//               flex: 3,
//               child: Container(
//                 padding: EdgeInsets.all(30),
//                 color: Colors.red,
//                 child: Text('1'),
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Container(
//                 padding: EdgeInsets.all(30),
//                 color: Colors.green,
//                 child: Text('2'),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(30),
//                 color: Colors.blue,
//                 child: Text('3'),
//               ),
//             ),
//           ],
//         ),

// lesson 7 Stack
//
//  body: Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             Icon(
//               Icons.airplay,
//               color: Colors.red,
//               size: 200,
//             ),
//             Positioned(
//               top: 40,
//               left: 30,
//               child: Text(
//                 'TV',
//                 style: TextStyle(fontSize: 30),
//               ),
//             ),
//           ],
//         ),

// lesson 8 UI App

// AppBar code == > 

// leading: IconButton(
//             icon: Icon(Icons.menu),
//             onPressed: () {},
//           ),
//           iconTheme: IconThemeData(color: Colors.black87),
//           // brightness: Brightness.light,
//           systemOverlayStyle:
//               SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(Icons.settings),
//               onPressed: () {},
//             )
//           ],

// StatelessWidget Code =>

// class MyAppUI extends StatelessWidget {
//   const MyAppUI({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             "Weather",
//             style: TextStyle(fontSize: 20, color: Colors.black87),
//           ),
//           backgroundColor: Colors.white,
//           leading: IconButton(
//             icon: Icon(Icons.menu),
//             onPressed: () {},
//           ),
//           iconTheme: IconThemeData(color: Colors.black87),
//           // brightness: Brightness.light,
//           systemOverlayStyle:
//               SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(Icons.settings),
//               onPressed: () {},
//             )
//           ],
//         ),
//         body: _buildBody(),
//       ),
//     );
//   }
// }

// Widget _buildBody() {
//   return SingleChildScrollView(
//     child: Column(
//       children: <Widget>[
//         _headerImage(),
//         SafeArea(
//           child: Padding(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 _weatherDescription(),
//                 Divider(),
//                 _temperature(),
//                 Divider(),
//                 _temperatureForecast(),
//                 Divider(),
//                 _footerRatings(),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Image _headerImage() {
//   return Image(
//     image: AssetImage('images/Sunny.jpeg'),
//     fit: BoxFit.cover,
//   );
// }

// Column _weatherDescription() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: <Widget>[
//       Text(
//         'Tuesday - Aug 16',
//         style: TextStyle(
//           fontSize: 30,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       Divider(),
//       Text(
//         'Bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla',
//         style: TextStyle(color: Colors.black54),
//       ),
//     ],
//   );
// }

// Row _temperature() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       Column(
//         children: <Widget>[
//           Icon(
//             Icons.wb_sunny,
//             color: Colors.amber,
//           ),
//         ],
//       ),
//       SizedBox(
//         width: 16,
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Text(
//                 "15° Clear",
//                 style: TextStyle(color: Colors.deepPurple),
//               ),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               Text(
//                 "Moscow",
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ],
//   );
// }

// Wrap _temperatureForecast() {
//   return Wrap(
//     spacing: 10.0,
//     children: List.generate(
//       8,
//       (int index) {
//         return Chip(
//           label: Text(
//             '${index + 8} C°',
//             style: TextStyle(fontSize: 15.0),
//           ),
//           avatar: Icon(
//             Icons.cloud,
//             color: Colors.blue[300],
//           ),
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//               side: BorderSide(color: Colors.grey)),
//           backgroundColor: Colors.grey[100],
//         );
//       },
//     ),
//   );
// }

// Row _footerRatings() {
//   var stars = Row(
//     mainAxisSize: MainAxisSize.min,
//     children: <Widget>[
//       Icon(
//         Icons.star,
//         size: 15,
//         color: Colors.yellow[600],
//       ),
//       Icon(
//         Icons.star,
//         size: 15,
//         color: Colors.yellow[600],
//       ),
//       Icon(
//         Icons.star,
//         size: 15,
//         color: Colors.yellow[600],
//       ),
//       Icon(
//         Icons.star,
//         size: 15,
//         color: Colors.grey,
//       ),
//       Icon(
//         Icons.star,
//         size: 15,
//         color: Colors.grey,
//       ),
//     ],
//   );
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: <Widget>[
//       Text(
//         "Info with openweathermap.com",
//         style: TextStyle(
//           color: Colors.grey,
//           fontSize: 15,
//         ),
//       ),
//       stars,
//     ],
//   );

// lesson 9 ListView

// Widget _myListView() {
//   return ListView(
//     padding: EdgeInsets.all(8),
//     // shrinkWrap: true,
//     // itemExtent: 300,
//     // scrollDirection: Axis.horizontal,
//     reverse: true,
//     children: <Widget>[
//       ListTile(
//         title: Text('Sun'),
//         subtitle: Text('Today Clear'),
//         leading: Icon(Icons.wb_sunny),
//         trailing: Icon(Icons.keyboard_arrow_right),
//       ),
//       ListTile(
//         title: Text('Cloudy'),
//         subtitle: Text('Today Cloudly'),
//         leading: Icon(Icons.wb_cloudy),
//         trailing: Icon(Icons.keyboard_arrow_right),
//       ),
//       ListTile(
//         title: Text('Snow'),
//         subtitle: Text('Today Snowly'),
//         leading: Icon(Icons.ac_unit),
//         trailing: Icon(Icons.keyboard_arrow_right),
//       ),
//     ],
//   );
// }

// lesson 10 Dynamic ListView

// class BodyListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return _myListView();
//   }
// }

// Widget _myListView() {
//   final List<String> items =
//       List<String>.generate(1000, (i) => 'Item ${i + 1}');

//   return ListView.builder(
//     itemCount: items.length,
//     itemBuilder: (context, index) {
//       return Card(
//         child: ListTile(
//           title: Text('${items[index]}'),
//           leading: Icon(
//             Icons.insert_photo,
//             color: Colors.red,
//           ),
//           trailing: Icon(Icons.keyboard_arrow_right),
//         ),
//       );
//     },
//   );
// }