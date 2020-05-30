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
                  ClipOval(
                    child: Image.network(
                      'https://acnhapi.com/v1/icons/fish/${widget.fish['id']}',
                      height: 75,
                      width: 75,
                      fit: BoxFit.cover,
                    ),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(text: 'Northern Season Months: '),
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
                                  TextSpan(text: 'Southern Season Months: '),
                                  TextSpan(
                                      text:
                                      '${widget
                                          .fish['availability']['isAllYear']
                                          ? 'All Year day'
                                          : widget
                                          .fish['availability']['month-southern']}')
                                ]),
                          ),
                          Text(
                              'Availability: ${widget
                                  .fish['availability']['isAllDay']
                                  ? 'All Day'
                                  : widget.fish['availability']['time']}'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
