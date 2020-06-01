import 'package:acnh_buddy/fishes/fish_detail_screen.dart';
import 'package:acnh_buddy/fossils/fossils_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FossilsScreen extends StatefulWidget {
  @override
  _FossilsScreenState createState() => _FossilsScreenState();
}

class _FossilsScreenState extends State<FossilsScreen> {
  List fossils;

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
                      return Column(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            child: ListTile(
                              leading: Image.network(
                                'https://acnhapi.com/v1/images/fossils/${snapshot.data[index]['file-name']}',
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FishDetailScreen(
                                            fish: snapshot.data[index],
                                          )),
                                );
                              },
                              title: Text(
                                '${snapshot.data[index]['name']['name-USen'].toString().toUpperCase()}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              subtitle: Text(
                                  'Price: ${snapshot.data[index]['price']}'),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
          future: FossilsRepo().getAllFossils(),
          initialData: [],
        ),
      ),
    );
  }
}
