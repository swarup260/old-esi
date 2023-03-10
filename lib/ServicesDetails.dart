import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'api/apiEndpoint.dart';
import 'models/resources.dart';
import 'widgets/AppDrawer.dart';
import 'api/networkManager.dart';

class ServicesDetails extends StatelessWidget {
  ServicesDetails(
      {Key key, @required this.category, @required this.servicesList})
      : super(key: key);

  final String category;
  final List<Resource> servicesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.category),
      ),
      body: FutureBuilder(
        future: this._filteredCategoryList(this.servicesList),
        initialData: servicesList,
        builder:
            (BuildContext context, AsyncSnapshot<List<Resource>> snapshot) {
          if (snapshot.hasData) {
            return ServiceListTile(
              filteredList: snapshot.data,
              category: this.category,
            );
          } else {
            return Center(
                child: SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ));
          }
        },
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: new Container(
        height: 60.0,
        color: Colors.white,
        child: AdmobBanner(
          adUnitId: getBannerAdUnitId(bannerAdType.BANNER),
          adSize: AdmobBannerSize.BANNER,
        ),
      ),
    );
  }

  Future<List<Resource>> _filteredCategoryList(List<Resource> list) async {
    /* Return Only the select State & City Data */
    Map<String, dynamic> stateCityMap = await getPersistedStateCity();
    // Map <String,String> stateCityMap = {"state" : "Maharashtra" , "city" : "Mumbai"};
    String state = stateCityMap['state'];
    String city = stateCityMap['city'];
    RegExp regExpState = new RegExp(state, caseSensitive: false);
    RegExp regExpCity = new RegExp(city, caseSensitive: false);
    return list
        .where((Resource f) =>
            regExpCity.hasMatch(f.city) &&
            regExpState.hasMatch(f.state) &&
            f.category == this.category)
        .toList();
  }
}

class ServiceListTile extends StatelessWidget {
  const ServiceListTile({
    Key key,
    @required this.filteredList,
    @required this.category,
  }) : super(key: key);

  final List<Resource> filteredList;
  final String category;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.filteredList.length,
        itemBuilder: (BuildContext context, int index) {
          List contact = this.filteredList[index].phonenumber.split(',');
          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0),
              ),
              elevation: 3.0,
              child: ExpansionTile(
                  leading: categoryInformation[this.category]["icon"],
                  title: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                    child: Text(this.filteredList[index].nameoftheorganisation,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0)),
                  ),
                  subtitle: ContactWidget(contact: contact),
                  children: <Widget>[
                    ServiceDescription(filteredList: filteredList, index: index)
                  ]));
        });
  }
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    Key key,
    @required this.contact,
  }) : super(key: key);

  final List<String> contact;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (var i = 0; i < this.contact.length && i < 2; i++)
          InkWell(
              onTap: () {
                launch("tel://" + contact[i]);
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.call),
                    Text(contact[i].trim()+" "),
                    // Padding(
                    //     padding: const EdgeInsets.only(left: 5.0, bottom: 10.0 , right: 10.0),
                    //     child: Text(contact[i].trim() ))
                  ])),
      ],
    );
  }
}

class ServiceDescription extends StatelessWidget {
  const ServiceDescription({
    Key key,
    @required this.filteredList,
    @required this.index,
  }) : super(key: key);

  final List<Resource> filteredList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
          child:
              Text(this.filteredList[index].descriptionandorserviceprovided)),
      subtitle: this.filteredList[index].contact.length > 0
          ? Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, bottom: 5.0, top: 10.0),
              child: Row(children: <Widget>[
                InkWell(
                  onTap: () {
                    _launchURL(this.filteredList[index].contact);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.insert_link),
                      SizedBox(
                        width: 5.0,
                      ),
                      SizedBox(width: 300 ,child: Text(this.filteredList[index].contact,overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.blue),),)
                    ],
                  ),
                )
              ]),
            )
          : Text(''),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
