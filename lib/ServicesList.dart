import 'package:esi_essential_services_india/SearchLocation.dart';
import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';

import 'api/networkManager.dart';
import 'models/resources.dart';
import 'api/apiEndpoint.dart';
import 'ServicesDetails.dart';
import 'widgets/AppDrawer.dart';

class ServicesList extends StatelessWidget {
  ServicesList({Key key, @required this.city}) : super(key: key);
  final String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Essential Services in " + city),
      ),
      body: FutureBuilder(
          future: getResources(),
          // initialData: <Resource>[],
          builder:
              (BuildContext context, AsyncSnapshot<List<Resource>> snapshot) {
            if (snapshot.hasData) {
              return ServicesListView(servicesList: snapshot.data);
            } else if (snapshot.hasError) {
              return ErrorWidget();
            }
            return Center(
                child: SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ));
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

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(padding: const EdgeInsets.all(20) , child: Card(
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.warning),
              title: Text('Network Error'),
              subtitle: Text('Error While Processing the Request'),
            ),
            FlatButton(
              child: const Text('Try Again..'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchLocation()),
                );
              },
            ),
          ],
        ),
      ),),
    );
  }
}

class ServicesListView extends StatelessWidget {
  const ServicesListView({
    Key key,
    @required this.servicesList,
  }) : super(key: key);

  final List<Resource> servicesList;

  @override
  Widget build(BuildContext context) {
    var uniqueCategory = getUniqueCategory(servicesList);
    return uniqueCategory.length == 0
        ? Center(child: Text('No Services Found'))
        : ListView.builder(
            itemCount: uniqueCategory.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 2.0,
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ServicesDetails(
                                category: uniqueCategory[index].category,
                                servicesList: servicesList,
                              )),
                    );
                  },
                  leading: categoryInformation[uniqueCategory[index].category]
                      ["icon"],
                  title: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(uniqueCategory[index].category,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  subtitle: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text('More Info',
                          style: TextStyle(fontWeight: FontWeight.w300))),
                  isThreeLine: true,
                  trailing: Container(child: Icon(Icons.arrow_forward_ios)),
                ),
              );
            });
  }

  List<Resource> getUniqueCategory(List<Resource> servicesList) {
    List<Resource> uniqueCategory = [];
    Map<String, bool> seem = {};
    servicesList.forEach((Resource f) {
      if (!seem.containsKey(f.category)) {
        uniqueCategory.add(f);
        seem[f.category] = true;
      }
    });
    return uniqueCategory;
  }
}
