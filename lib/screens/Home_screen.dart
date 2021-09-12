import 'package:flutter/material.dart';
import 'package:fluttertravelui/components/Destinations_Card.dart';
import 'package:fluttertravelui/components/Hotels_Card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// ignore: unused_element
int _selectedIndex = 0;
// ignore: unused_element
int _currrentTab = 0;

class _HomeScreenState extends State<HomeScreen> {
  List<IconData> _icons = [
    Icons.flight_outlined,
    Icons.bed_outlined,
    Icons.directions_walk_outlined,
    Icons.directions_bike_outlined,
  ];
  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print(_selectedIndex);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color:
              _selectedIndex == index ? Color(0xFFD8ECF1) : Color(0xFFE7ebee),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 30.0,
          color:
              _selectedIndex == index ? Color(0xFF3EBACE) : Color(0xFFb4c1c4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Destinations',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'See All ',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Destinationscard(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Exclusive Hotels',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'See All ',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            HotelsCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currrentTab,
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 20,
              child: CircleAvatar(
                radius: 19,
                backgroundImage: NetworkImage(
                    'https://scontent.fdad3-2.fna.fbcdn.net/v/t1.6435-9/178365630_907943059778049_5694045723792127237_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=174925&_nc_ohc=mCpk3-YMEyUAX87Yk4Y&_nc_oc=AQkv1H45JSykOfo5qHKeQfc4z3YiVEQzV7QE4f6f2n5KG-jSVFhFIEv_1ibOKJ92vpuGIEgdf86962hiG80A_Bl0&_nc_ht=scontent.fdad3-2.fna&oh=f4e130859aa7b19422ceb6fdcea19155&oe=61647A7D'),
              ),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
