// To parse this JSON data, do
//
//     final dataModel2 = dataModel2FromJson(jsonString);

import 'dart:convert';

DataModel2 dataModel2FromJson(String str) => DataModel2.fromJson(json.decode(str));

String dataModel2ToJson(DataModel2 data) => json.encode(data.toJson());

class DataModel2 {
    DataModel2({
        required this.items,
        required this.title,
        required this.description,
        required this.link,
        required this.category,
        required this.image,
    });

    List<Item>? items;
    String title;
    String description;
    String link;
    List<dynamic>? category;
    String image;

    factory DataModel2.fromJson(Map<String, dynamic> json) => DataModel2(
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        link: json["link"] == null ? null : json["link"],
        category: json["category"] == null ? null : List<dynamic>.from(json["category"].map((x) => x)),
        image: json["image"] == null ? null : json["image"],
    );

    Map<String, dynamic> toJson() => {
        "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "link": link == null ? null : link,
        "category": category == null ? null : List<dynamic>.from(category!.map((x) => x)),
        "image": image == null ? null : image,
    };
}

class Item {
    Item({
        required this.title,
        required this.description,
        required this.url,
        required this.link,
        this.published,
        this.created,
        required this.category,
        this.content,
        required this.enclosures,
    });

    String title;
    dynamic description;
    String url;
    String link;
    dynamic published;
    dynamic created;
    List<dynamic>? category;
    dynamic content;
    List<dynamic>? enclosures;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json["title"] == null ? null : json["title"],
        description: json["description"],
        url: json["url"] == null ? null : json["url"],
        link: json["link"] == null ? null : json["link"],
        published: json["published"],
        created: json["created"],
        category: json["category"] == null ? null : List<dynamic>.from(json["category"].map((x) => x)),
        content: json["content"],
        enclosures: json["enclosures"] == null ? null : List<dynamic>.from(json["enclosures"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "description": description,
        "url": url == null ? null : url,
        "link": link == null ? null : link,
        "published": published,
        "created": created,
        "category": category == null ? null : List<dynamic>.from(category!.map((x) => x)),
        "content": content,
        "enclosures": enclosures == null ? null : List<dynamic>.from(enclosures!.map((x) => x)),
    };
}

class DescriptionClass {
    DescriptionClass();

    factory DescriptionClass.fromJson(Map<String, dynamic> json) => DescriptionClass(
    );

    Map<String, dynamic> toJson() => {
    };
}
