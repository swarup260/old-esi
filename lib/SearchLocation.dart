import 'package:flutter/material.dart';

import 'ServicesList.dart';
import 'resources/StateCityList.dart';

class SearchLocation extends StatefulWidget {
  @override
  _SearchLocationState createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  StateCityList repo = StateCityList();

  List<String> _states = ["Choose a state"];
  List<String> _lgas = ["Choose .."];
  String _selectedState = "Choose a state";
  String _selectedLGA = "Choose ..";

  @override
  void initState() {
    _states = List.from(_states)..addAll(repo.getStates());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ESI : Location'),
        elevation: 0.1,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            children: <Widget>[
              Text("ESI",
                  style: TextStyle(
                      fontSize: 80,
                      color: Colors.green,
                      fontWeight: FontWeight.bold)),
              Text("Essential Services India"),
              SizedBox(height: 30),
              Image.asset('assets/images/india-flag.png'),
              SizedBox(height: 20),
              DropdownButton<String>(
                isExpanded: true,
                items: _states.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (value) => _onSelectedState(value),
                value: _selectedState,
              ),
              SizedBox(height: 5),
              DropdownButton<String>(
                isExpanded: true,
                items: _lgas.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                // onChanged: (value) => print(value),
                onChanged: (value) => _onSelectedLGA(value),
                value: _selectedLGA,
              ),
              Center(
                child: RaisedButton(
                  color: Colors.green,
                  shape: StadiumBorder(),
                  child: Text('Search'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ServicesList()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSelectedState(String value) {
    setState(() {
      _selectedLGA = "Choose ..";
      _lgas = ["Choose .."];
      _selectedState = value;
      _lgas = List.from(_lgas)..addAll(repo.getLocalByState(value));
    });
  }

  void _onSelectedLGA(String value) {
    setState(() => _selectedLGA = value);
  }
}
