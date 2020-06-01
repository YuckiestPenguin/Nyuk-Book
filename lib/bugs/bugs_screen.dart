import 'package:acnh_buddy/bugs/bug_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'bugs_repo.dart';

class BugsScreen extends StatefulWidget {
  @override
  _BugsScreenState createState() => _BugsScreenState();
}

class _BugsScreenState extends State<BugsScreen> {
  List bugs;

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
                                'https://acnhapi.com/v1/icons/bugs/${snapshot.data[index]['id']}',
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BugDetailScreen(
                                            bug: snapshot.data[index],
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
          future: BugsRepo().getAllBugs(),
          initialData: [],
        ),
      ),
    );
  }
}
