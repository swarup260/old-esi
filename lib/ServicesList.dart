import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';

import 'api/apiEndpoint.dart';
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
      ),
      body: ListView.builder(
          itemCount: servicesList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 2.0,
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ServicesDetails()),
                  );
                },
                leading: Icon(Icons.satellite),
                title: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(servicesList[index],
                        style: TextStyle(fontWeight: FontWeight.bold))),
                subtitle: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(servicesDescription[index],
                        style: TextStyle(fontWeight: FontWeight.w300))),
                isThreeLine: true,
                trailing: Container(child: Icon(Icons.arrow_forward_ios)),
              ),
            );
          }),
      drawer: AppDrawer(),
      bottomNavigationBar: new Container(
        height: 60.0,
        child: AdmobBanner(
          adUnitId: getBannerAdUnitId(bannerAdType.BANNER),
          adSize: AdmobBannerSize.BANNER,
        ),
      ),
    );
  }
}
