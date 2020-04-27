import 'package:flutter/material.dart';

import 'ServicesDetails.dart';
import 'widgets/AppDrawer.dart';

class ServicesList extends StatefulWidget {
  @override
  _ServicesListState createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  bool showSearchBox = false;
  final List<String> servicesList = <String>[
    'CoVID-19 Testing Lab',
    'Free Food',
    'Fundraisers',
    'Delivery [Vegetables, Fruits, Groceries, Medicines, etc.]',
    'Hospitals and Centers',
    'Police',
    'Government Helpline'
  ];

  final List<String> servicesDescription = <String>[
    'While laying out the list, visible children elements, states and render objects',
    'While laying out the list, visible children elements, states and render objects',
    'While laying out the list, visible children elements, states and render objects',
    'While laying out the list, visible children elements, states and render objects',
    'While laying out the list, visible children elements, states and render objects',
    'While laying out the list, visible children elements, states and render objects',
    'While laying out the list, visible children elements, states and render objects'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Essential Services India"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context : context,
                  delegate: ServicesSearch()
                );

              })
        ],
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: servicesList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    strutStyle: StrutStyle(fontSize: 12.0),
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                        text: this.servicesList[index]),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(this.servicesDescription[index],
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 16)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Text('View All',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15)),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ServicesDetails()),
                          );
                        })
                  ],
                )
              ],
            ));
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider()),
      drawer: AppDrawer(),
    );
  }
}

class ServicesSearch extends SearchDelegate<String> {
  final servicesList = [
    'CoVID-19 Testing Lab',
    'Free Food',
    'Fundraisers',
    'Delivery [Vegetables, Fruits, Groceries, Medicines, etc.]',
    'Hospitals and Centers',
    'Police',
    'Government Helpline'
  ];

  final recent = [
    'CoVID-19 Testing Lab',
    'Free Food',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = "";
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList =
        query.isEmpty ? this.recent : this.servicesList.where( (str) => str.startsWith(query)).toList();
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.accessibility),
              title: RichText(text: TextSpan(
                text : suggestionList[index].substring(0 , query.length),
                style : TextStyle(color : Colors.black , fontWeight :FontWeight.bold),children: [
                  TextSpan(
                    text : suggestionList[index].substring(query.length),
                  style:TextStyle(color : Colors.grey ))
                ],
              )),
            ),
        itemCount: suggestionList.length);
  }
}
