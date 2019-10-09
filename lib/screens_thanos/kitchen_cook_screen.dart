import 'package:flutter/material.dart';
import '../data/data_thanos.dart';

class KitchenCookScreen extends StatelessWidget {
  static const routeName = "/Kitchen-Cook-Screen";

  Widget buildTitle(String title, BuildContext ctx) {
    return Text(
      title,
      style: Theme.of(ctx).textTheme.title,
    );
  }

  Widget buildSubtitle(String subtitle) {
    return Text(
      subtitle,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.grey,
      ),
    );
  }

  Widget buildContainerTitle(String text, String buttonText, BuildContext ctx) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                buildTitle(text, ctx),
              ],
            ),
            Material(
              elevation: 20,
              shadowColor: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                splashColor: Theme.of(ctx).primaryColor,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      fontFamily: "Raleway",
                      color: Colors.pink,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello ! Thanos Is Cooking"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).accentColor,
              child: Image.asset(
                "assets/images/c1.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: <Widget>[
                  buildContainerTitle("Material Involved", "MORE", context),
                  Container(
                    height: 300,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: DUMMY_MATERIAL_INVOLVED_KITCHEN.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            child: Image.asset(
                              DUMMY_MATERIAL_INVOLVED_KITCHEN[index].image,
                              height: 150,
                              width: 75,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            DUMMY_MATERIAL_INVOLVED_KITCHEN[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          subtitle: Text(
                              DUMMY_MATERIAL_INVOLVED_KITCHEN[index].subtitle),
                        );
                      },
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      buildContainerTitle("Recent Visitors", "INFO", context),
                      Container(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listVisitors.length,
                          itemBuilder: (ctx, index) {
                            return Card(
                              elevation: 0,
                              color: Colors.yellow[100],
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                                child: Image.asset(
                                  listVisitors[index]["image"],
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
