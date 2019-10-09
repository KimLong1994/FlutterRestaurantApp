import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/data_chef.dart';

class IntroMembersDetailScreen extends StatefulWidget {
  static const routeName = "/Intro-Members-Detail-Screen";

  @override
  _IntroMembersDetailScreenState createState() =>
      _IntroMembersDetailScreenState();
}

class _IntroMembersDetailScreenState extends State<IntroMembersDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final receivedRouteArgsFromChefItem =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final chefId = receivedRouteArgsFromChefItem["id"];
    final selectChef = DUMMY_CHEFS.firstWhere((chef) => chef.id == chefId);
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectChef.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: screenHeight / 3.5,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(150),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(25),
                  child: Center(
                    child: Text(
                      "Profile Famous Chef",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 120,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      child: Image.asset(
                        "${selectChef.image}",
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

              ],
            ),
          ],
        ),
      ),
    );
  }
}
