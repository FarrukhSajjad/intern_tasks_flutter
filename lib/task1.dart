import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Task1 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Task1> {
  GoogleMapController mapController;

  final LatLng target = LatLng(30.3753, 69.3451);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Marker> myMarkers = [
    Marker(
        markerId: MarkerId("LatLng(30.886681711675287, 70.26585940271616)"),
        position: LatLng(30.886681711675287, 70.26585940271616)),
    Marker(
        markerId: MarkerId("LatLng(30.10774118909472, 68.09789087623358)"),
        position: LatLng(30.10774118909472, 68.09789087623358)),
    Marker(
        markerId: MarkerId("LatLng(29.037591178278042, 72.06552475690842)"),
        position: LatLng(29.037591178278042, 72.06552475690842)),
    Marker(
        markerId: MarkerId("LatLng(34.257596363044534, 71.88137266784906)"),
        position: LatLng(34.257596363044534, 71.88137266784906)),
  ];

  _handleTap(LatLng position) {
    print(position);

    setState(() {
      myMarkers.add(
        Marker(
            markerId: MarkerId(
              position.toString(),
            ),
            position: position),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              onTap: _handleTap,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: target,
                zoom: 6,
              ),
              markers: Set.from(myMarkers),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(
                  15,
                ),
                height: 300,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowGlow();
                  },
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Cards(
                        name: 'Fawad Ali',
                        company: 'DevTech',
                        reviews: "5.0",
                        designation: 'Full Stack Web Developer',
                        money: "4000",
                        img: 'assets/images/fawad.jpg',
                        distance: "4",
                      ),
                      Cards(
                        name: 'Farrukh Sajjad',
                        company: 'Fiverr',
                        reviews: "4.9",
                        designation: 'Flutter Developer',
                        money: "1000",
                        img: 'assets/images/farrukh.jpg',
                        distance: "3",
                      ),
                      Cards(
                        name: 'Usama Ahmed',
                        company: 'Fiverr',
                        reviews: "4.9",
                        designation: 'Shopify Expert',
                        money: "3000",
                        img: 'assets/images/usama.jpg',
                        distance: "2",
                      ),
                      Cards(
                        name: 'Obaid ur Rehman',
                        company: 'Aims Capital',
                        reviews: "5.0",
                        designation: 'Shopify Expert',
                        money: "3000",
                        img: 'assets/images/obaid.jpg',
                        distance: "5",
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final String name;
  final String designation;
  final String distance;
  final String reviews;
  final String company;
  final String img;
  final String money;

  const Cards({
    this.name,
    this.designation,
    this.distance,
    this.reviews,
    this.company,
    this.img,
    this.money,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.topLeft,
              width: 300,
              height: 200,
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '~$distance KM~',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.bookmark_outline,
                        color: Colors.purple,
                      ),
                    ],
                  ),
                  Text(
                    '$name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        '$designation | $reviews',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.thumb_up_alt,
                        color: Colors.blue,
                      )
                    ],
                  ),
                  Text(
                    '$company',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.chat_bubble, color: Colors.black),
                      Icon(Icons.videocam, color: Colors.black),
                      Icon(Icons.phone, color: Colors.black),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                        child: Text(
                          "₹ $money",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 12,
              child: FractionalTranslation(
                translation: Offset(0.0, -0.4),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 4),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage(img),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
