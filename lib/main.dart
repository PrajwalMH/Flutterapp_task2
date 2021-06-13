import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: page1(),
    );
  }
}

class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> {
  String bicon = 'Welcome to Task 2';
  final myController = TextEditingController();
  String msg = "Task 2";

  void changeText() {
    setState(() {
      if (msg.startsWith('T')) {
        msg = 'Flutter';
      } else {
        msg = 'Task 2';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text('Drawer Header'),
              ),
            ),
            ListTile(
              title: Text("Profile"),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text("Update Profile"),
              leading: Icon(Icons.person_outline),
              onTap: () {
                print("Profile Updated");
              },
            ),
            ListTile(
              title: Text("Photo"),
              leading: Icon(Icons.add_a_photo),
              onTap: () {
                print("Photo added");
              },
            ),
            ListTile(
              title: Text("Log out"),
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Text('Task2'),
        ),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.developer_mode),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text('Welcome to Task 2\n'
                      'It is the CyberWorld',
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Image(image: AssetImage('images/pic1.jpg')),


              ElevatedButton(
                child: Text(
                  msg,
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  changeText();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Icon(Icons.flash_on, size: 60),
                  SizedBox(
                    width: 50,
                  ),
                  Icon(Icons.phonelink, size: 60),
                  SizedBox(
                    width: 50,
                  ),
                  Icon(Icons.security, size: 60),
                  SizedBox(
                    width: 50,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter it here',
                    labelText: 'Enter Your Name',
                  ),
                ),
              ),
              ListTile(
                title: new ElevatedButton(
                  child: new Text("SUBMIT"),
                  onPressed: () {
                    var route = new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new NextPage(value: myController.text),
                    );
                    Navigator.of(context).push(route);
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Image(
                image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png'),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'PRAJWAL M HULAMANI',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.teal[50],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.teal[50],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  final value;

  const NextPage({Key? key, this.value}) : super(key: key);

  @override
  _NextPageState createState() => new _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Page 2"),
      ),
      body: Center(
        child: Text(
          "Thank You ${widget.value} for submitting.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
