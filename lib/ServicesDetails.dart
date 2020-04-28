import 'package:flutter/material.dart';

import 'widgets/AppDrawer.dart';

class ServicesDetails extends StatefulWidget {
  @override
  _ServicesDetailsState createState() => _ServicesDetailsState();
}

class _ServicesDetailsState extends State<ServicesDetails> {
  final List<String> servicesList = <String>[
    'Regional Medical Research Centre (ICMR)',
    'Rangaraya Medical College',
    'Amrutha Hastam Charitable Trust',
    'Sidhartha Medical College',
    'The Integrated Rural Development of Weaker Sections in India',
    'Govt General Hospital Kurnool',
    'Tirupati municipal Corporation'
  ];

  final List<String> servicesListDes = <String>[
    "Government approved and supported Testing labs by ICMR",
    "Government Approved and Supported Testing Lab by ICMR",
    "Government Approved and Supported Testing Lab by ICMR",
    "Government Approved and Supported Testing Lab by ICMR",
    'We are providing free food service to the needy from more than 2 years, now during lockdown we are distributing more than 10000 people daily during lockdown',
    'We are providing free food service to the needy from more than 2 years, now during lockdown we are distributing more than 10000 people daily during lockdown',
    'We are providing free food service to the needy from more than 2 years, now during lockdown we are distributing more than 10000 people daily during lockdown'
  ];

  List<String> filteredList = <String>[];

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
      filteredList =
          filteredList.where((f) => f.startsWith(myController.text)).toList();
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
                      child: Text(this.filteredList[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0)),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                              Icon(Icons.call),
                              Padding(
                                  padding: const EdgeInsets.only( left: 5.0,bottom: 10.0),
                                  child: Text('8689886323'))
                            ])),
                        SizedBox(
                          width: 15.0,
                        ),
                        InkWell(
                            onTap: () {},
                            child: Row(children: <Widget>[
                              Icon(Icons.call),
                              Padding(
                                  padding: const EdgeInsets.only( left: 5.0,bottom: 10.0),
                                  child: Text('8689886323'))
                            ]))
                      ],
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 10.0),
                            child: Text(this.servicesListDes[index])),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, bottom: 5.0, top: 10.0),
                          child: Row(children: <Widget>[
                            Icon(Icons.web),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('https://web.whatsapp.com/')
                          ]),
                        ),
                      )
                    ]));
          }),
      drawer: AppDrawer(),
    );
  }
}
