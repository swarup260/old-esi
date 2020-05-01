// To parse this JSON data, do
//
//     final resources = resourcesFromJson(jsonString);

import 'dart:convert';

Resources resourcesFromJson(String str) => Resources.fromJson(json.decode(str));

String resourcesToJson(Resources data) => json.encode(data.toJson());

class Resources {
    List<Resource> resources;

    Resources({
        this.resources,
    });

    factory Resources.fromJson(Map<String, dynamic> json) => Resources(
        resources: List<Resource>.from(json["resources"].map((x) => Resource.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resources": List<dynamic>.from(resources.map((x) => x.toJson())),
    };
}

class Resource {
    String category;
    String city;
    String contact;
    String descriptionandorserviceprovided;
    String nameoftheorganisation;
    String phonenumber;
    String state;

    Resource({
        this.category,
        this.city,
        this.contact,
        this.descriptionandorserviceprovided,
        this.nameoftheorganisation,
        this.phonenumber,
        this.state,
    });

    factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        category: json["category"],
        city: json["city"],
        contact: json["contact"],
        descriptionandorserviceprovided: json["descriptionandorserviceprovided"],
        nameoftheorganisation: json["nameoftheorganisation"],
        phonenumber: json["phonenumber"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "city": city,
        "contact": contact,
        "descriptionandorserviceprovided": descriptionandorserviceprovided,
        "nameoftheorganisation": nameoftheorganisation,
        "phonenumber": phonenumber,
        "state": state,
    };

}
