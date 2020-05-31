import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FishDetailScreen extends StatefulWidget {
  final fish;

  FishDetailScreen({this.fish});

  @override
  _FishDetailScreenState createState() => _FishDetailScreenState();
}

class _FishDetailScreenState extends State<FishDetailScreen> {
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
                    'https://acnhapi.com/v1/icons/fish/${widget.fish['id']}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          '${widget.fish['name']['name-USen']}',
                          style: Theme.of(context).textTheme.headline2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          '\"${widget.fish['catch-phrase']}\"',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
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
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline4,
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Location: ',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                      '${widget
                                          .fish['availability']['location']}')
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Rarity: ',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                      '${widget
                                          .fish['availability']['rarity']}')
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Northern Season Months: ',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                      '${widget
                                          .fish['availability']['isAllYear']
                                          ? 'All Year day'
                                          : widget
                                          .fish['availability']['month-northern']}')
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Southern Season Months: ',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                      '${widget
                                          .fish['availability']['isAllYear']
                                          ? 'All Year day'
                                          : widget
                                          .fish['availability']['month-southern']}')
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Time of Day: ',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                      '${widget.fish['availability']['isAllDay']
                                          ? 'All Day'
                                          : widget
                                          .fish['availability']['time']}')
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
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline4,
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Price: ',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: '${widget.fish['price']}')
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'CJ Price: ',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: '${widget.fish['price-cj']}')
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
                    children: <Widget>[
                      Expanded(
                        child: Image.network(
                          'https://acnhapi.com/v1/images/fish/${widget
                              .fish['id']}',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                          child: Text(
                            '\"${widget.fish['museum-phrase']}\"',
                            style: TextStyle(fontStyle: FontStyle.italic),
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
