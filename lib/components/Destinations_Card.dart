import 'package:flutter/material.dart';
import 'package:fluttertravelui/models/destination_model.dart';
import 'package:fluttertravelui/screens/Details_Screen.dart';

class Destinationscard extends StatelessWidget {
  const Destinationscard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: destinations.length,
          itemBuilder: (BuildContext context, int index) {
            Destination destination = destinations[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(description: destination),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                width: 210,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 5,
                      color: Colors.black.withAlpha(90),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Hero(
                        tag: destination.imageUrl,
                        child: Container(
                          width: 190,
                          height: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(destination.imageUrl),
                              fit: BoxFit.fill,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${destination.activities.length} activities',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            destination.description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destination.city,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                                letterSpacing: 1.5),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.near_me, color: Colors.white),
                              Text(
                                destination.country,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.white,
                                    letterSpacing: 1.2),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
