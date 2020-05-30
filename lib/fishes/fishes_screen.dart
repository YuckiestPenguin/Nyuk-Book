import 'package:acnh_buddy/fishes/fish_detail_screen.dart';
import 'package:acnh_buddy/fishes/fishes_repo.dart';
import 'package:flutter/material.dart';

class FishesScreen extends StatefulWidget {
  @override
  _FishesScreenState createState() => _FishesScreenState();
}

class _FishesScreenState extends State<FishesScreen> {
  List fishes;

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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  FishDetailScreen(
                                    fish: snapshot.data[index],)),
                            );
                          },
                          title: Text(
                              '${snapshot.data[index]['name']['name-USen']}'),
                          subtitle: Text('Price: ${snapshot
                              .data[index]['price']} / CJ Price: ${snapshot
                              .data[index]['price-cj']}'),
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
