import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FossilDetailScreen extends StatefulWidget {
  final fossil;

  FossilDetailScreen({this.fossil});

  @override
  _FossilDetailScreenState createState() => _FossilDetailScreenState();
}

class _FossilDetailScreenState extends State<FossilDetailScreen> {
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
                    'https://acnhapi.com/v1/images/fossils/${widget.fossil['file-name']}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          '${widget.fossil['name']['name-USen'].toString().toUpperCase()}',
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
                                  TextSpan(text: '${widget.fossil['price']}')
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
                      Flexible(
                          child: Text(
                        '\"${widget.fossil['museum-phrase']}\"',
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
