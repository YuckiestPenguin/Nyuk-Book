import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VillagerDetailScreen extends StatefulWidget {
  final villager;

  VillagerDetailScreen({this.villager});

  @override
  _VillagerDetailScreenState createState() => _VillagerDetailScreenState();
}

class _VillagerDetailScreenState extends State<VillagerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.angleDoubleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.network(
                    'https://acnhapi.com/v1/icons/villagers/${widget.villager['id']}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          '${widget.villager['name']['name-USen'].toString().toUpperCase()}',
                          style: Theme.of(context).textTheme.headline3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '\"${widget.villager['catch-phrase']}\"',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Info',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(
                            height: 1.50,
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                    color: Colors.black, height: 1.5),
                                children: [
                                  TextSpan(
                                    text: 'Birthday: ',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  TextSpan(
                                      text:
                                          '${widget.villager['birthday-string']}')
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                    color: Colors.black, height: 1.5),
                                children: [
                                  TextSpan(
                                    text: 'Personality: ',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  TextSpan(
                                      text: '${widget.villager['personality']}')
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                    color: Colors.black, height: 1.5),
                                children: [
                                  TextSpan(
                                    text: 'Gender: ',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  TextSpan(text: '${widget.villager['gender']}')
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                    color: Colors.black, height: 1.5),
                                children: [
                                  TextSpan(
                                    text: 'Species: ',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  TextSpan(
                                      text: '${widget.villager['species']}')
                                ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Image.network(
                          '${widget.villager['image_uri']}',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
