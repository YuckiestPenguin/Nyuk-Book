import 'package:acnh_buddy/fishes/fishes_repo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FishesScreen extends StatefulWidget {
  @override
  _FishesScreenState createState() => _FishesScreenState();
}

class _FishesScreenState extends State<FishesScreen> {
  List fishes;

  @override
  void initState() {
    FishesRepo().getAllFishes().then((res) {
      setState(() {
        fishes = res;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData == null) {
              //print('project snapshot data is: ${projectSnap.data}');
              return Container();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('loading');
            }

            if (snapshot.connectionState == ConnectionState.done &&
                !snapshot.hasData) {
              return Text('no data');
            }
            return Column(
              children: <Widget>[
                Text(
                  'Total: ${snapshot.data.length}',
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 55),
                    itemCount: snapshot.data.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        child: ListTile(
                          onTap: () {},
                          leading: FaIcon(
                            FontAwesomeIcons.mapMarker,
                            size: 10,
                          ),
                          title: Text(
                              '${snapshot.data[index]['name']['name-USen']}'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
          future: FishesRepo().getAllFishes(),
          initialData: [],
        ),
      ),
    );
  }
}
