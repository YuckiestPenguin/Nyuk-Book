import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BugDetailScreen extends StatefulWidget {
  final bug;

  BugDetailScreen({this.bug});

  @override
  _BugDetailScreenState createState() => _BugDetailScreenState();
}

class _BugDetailScreenState extends State<BugDetailScreen> {
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
                    'https://acnhapi.com/v1/icons/bug/${widget.bug['id']}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          '${widget.bug['name']['name-USen'].toString().toUpperCase()}',
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
                          '\"${widget.bug['catch-phrase']}\"',
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
                            'Availability',
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
                                    text: 'Location: ',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  TextSpan(
                                      text:
                                          '${widget.bug['availability']['location']}')
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                    color: Colors.black, height: 1.5),
                                children: [
                                  TextSpan(
                                    text: 'Rarity: ',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  TextSpan(
                                      text:
                                          '${widget.bug['availability']['rarity']}')
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                    color: Colors.black, height: 1.5),
                                children: [
                                  TextSpan(
                                    text: 'Northern Season Months: ',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  TextSpan(
                                      text:
                                          '${widget.bug['availability']['isAllYear'] ? 'All Year day' : widget.bug['availability']['month-northern']}')
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                    color: Colors.black, height: 1.5),
                                children: [
                                  TextSpan(
                                    text: 'Southern Season Months: ',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  TextSpan(
                                      text:
                                          '${widget.bug['availability']['isAllYear'] ? 'All Year day' : widget.bug['availability']['month-southern']}')
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                    color: Colors.black, height: 1.5),
                                children: [
                                  TextSpan(
                                    text: 'Time of Day: ',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  TextSpan(
                                      text:
                                          '${widget.bug['availability']['isAllDay'] ? 'All Day' : widget.bug['availability']['time']}')
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Pricing',
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
                                    text: 'Price: ',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  TextSpan(text: '${widget.bug['price']}')
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                    color: Colors.black, height: 1.5),
                                children: [
                                  TextSpan(
                                    text: 'CJ Price: ',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  TextSpan(text: '${widget.bug['price-cj']}')
                                ]),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      widget.bug['shadow'].toString().contains('1')
                          ? FaIcon(
                              FontAwesomeIcons.mapMarker,
                              color: Theme.of(context).primaryColor,
                              size: 10,
                            )
                          : FaIcon(
                              FontAwesomeIcons.mapMarker,
                              size: 10,
                              color: Colors.grey,
                            ),
                      widget.bug['shadow'].toString().contains('2')
                          ? FaIcon(
                              FontAwesomeIcons.mapMarker,
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            )
                          : FaIcon(
                              FontAwesomeIcons.mapMarker,
                              size: 20,
                              color: Colors.grey,
                            ),
                      widget.bug['shadow'].toString().contains('3')
                          ? FaIcon(
                              FontAwesomeIcons.mapMarker,
                              color: Theme.of(context).primaryColor,
                              size: 30,
                            )
                          : FaIcon(
                              FontAwesomeIcons.mapMarker,
                              size: 30,
                              color: Colors.grey,
                            ),
                      widget.bug['shadow'].toString().contains('4')
                          ? FaIcon(
                              FontAwesomeIcons.mapMarker,
                              color: Theme.of(context).primaryColor,
                              size: 40,
                            )
                          : FaIcon(
                              FontAwesomeIcons.mapMarker,
                              size: 40,
                              color: Colors.grey,
                            ),
                      widget.bug['shadow'].toString().contains('5')
                          ? FaIcon(
                              FontAwesomeIcons.mapMarker,
                              color: Theme.of(context).primaryColor,
                              size: 50,
                            )
                          : FaIcon(
                              FontAwesomeIcons.mapMarker,
                              size: 50,
                              color: Colors.grey,
                            ),
                      widget.bug['shadow'].toString().contains('6')
                          ? FaIcon(
                              FontAwesomeIcons.mapMarker,
                              color: Theme.of(context).primaryColor,
                              size: 60,
                            )
                          : FaIcon(
                              FontAwesomeIcons.mapMarker,
                              size: 60,
                              color: Colors.grey,
                            ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Image.network(
                          'https://acnhapi.com/v1/images/bug/${widget.bug['id']}',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                          child: Text(
                        '\"${widget.bug['museum-phrase']}\"',
                        style: Theme.of(context).textTheme.subtitle1,
                      ))
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
