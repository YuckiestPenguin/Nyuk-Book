import 'package:acnh_buddy/villagers/villager_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'villagers_repo.dart';

class VillagersScreen extends StatefulWidget {
  @override
  _VillagersScreenState createState() => _VillagersScreenState();
}

class _VillagersScreenState extends State<VillagersScreen> {
  List villagers;

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
              return Center(
                child: SpinKitRipple(
                  size: 75,
                  color: Theme.of(context).primaryColor,
                ),
              );
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        child: ListTile(
                          leading: Image.network(
                            'https://acnhapi.com/v1/icons/villagers/${snapshot
                                .data[index]['id']}',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      VillagerDetailScreen(
                                        villager: snapshot.data[index],
                                      )),
                            );
                          },
                          title: Text(
                            '${snapshot.data[index]['name']['name-USen']
                                .toString()
                                .toUpperCase()}',
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline6,
                          ),
                          subtitle: Text(
                              '${snapshot
                                  .data[index]['personality']} ${snapshot
                                  .data[index]['gender']} ${snapshot
                                  .data[index]['species']}'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
          future: VillagersRepo().getAllVillagers(),
          initialData: [],
        ),
      ),
    );
  }
}
