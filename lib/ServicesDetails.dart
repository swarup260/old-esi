import 'package:flutter/material.dart';

import 'models/resources.dart';
import 'widgets/AppDrawer.dart';

class ServicesDetails extends StatefulWidget {
  ServicesDetails({Key key, @required this.servicesList}) : super(key: key);

  final List<Resource> servicesList;
  @override
  _ServicesDetailsState createState() =>
      _ServicesDetailsState(servicesList: servicesList);
}

class _ServicesDetailsState extends State<ServicesDetails> {
  _ServicesDetailsState({List<Resource> this.servicesList});

  final List<Resource> servicesList;
  List<Resource> filteredList = [];

  bool isExpanded = false;

  bool showSearchBox = false;

  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      filteredList = servicesList;
      myController.addListener(_printLatestValue);
    });
  }

  void _printLatestValue() {
    setState(() {
      filteredList = filteredList
          .where((Resource f) => f.category.startsWith(myController.text))
          .toList();
    });
    print(filteredList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !showSearchBox
            ? Text('ESI : LAB')
            : TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter a search term'),
                controller: myController,
              ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  showSearchBox = !showSearchBox;
                });
              }),
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: ListView.builder(
          itemCount: this.filteredList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                elevation: 3.0,
                child: ExpansionTile(
                    leading: Icon(Icons.hourglass_full),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                      child: Text(this.filteredList[index].category,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0)),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        
                      ],
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 10.0),
                            child: Text(this
                                .servicesList[index]
                                .descriptionandorserviceprovided)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, bottom: 5.0, top: 10.0),
                          child: Row(children: <Widget>[
                            Icon(Icons.web),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(this.servicesList[index].contact)
                          ]),
                        ),
                      )
                    ]));
          }),
      drawer: AppDrawer(),
    );
  }
}
