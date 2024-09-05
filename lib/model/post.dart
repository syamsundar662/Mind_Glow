class Posts {
    Posts({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    final int? userId;
    final int? id;
    final String? title;
    final String? body;

    factory Posts.fromJson(Map<String, dynamic> json){ 
        return Posts(
            userId: json["userId"],
            id: json["id"],
            title: json["title"],
            body: json["body"],
        );
    }

}






class Comments {
    Comments({
        required this.postId,
        required this.id,
        required this.name,
        required this.email,
        required this.body,
    });

    final int? postId;
    final int? id;
    final String? name;
    final String? email;
    final String? body;

    factory Comments.fromJson(Map<String, dynamic> json){ 
        return Comments(
            postId: json["postId"],
            id: json["id"],
            name: json["name"],
            email: json["email"],
            body: json["body"],
        );
    }

}







class CommunityUsers {
    CommunityUsers({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.address,
        required this.phone,
        required this.website,
        required this.company,
    });

    final int? id;
    final String? name;
    final String? username;
    final String? email;
    final Address? address;
    final String? phone;
    final String? website;
    final Company? company;

    factory CommunityUsers.fromJson(Map<String, dynamic> json){ 
        return CommunityUsers(
            id: json["id"],
            name: json["name"],
            username: json["username"],
            email: json["email"],
            address: json["address"] == null ? null : Address.fromJson(json["address"]),
            phone: json["phone"],
            website: json["website"],
            company: json["company"] == null ? null : Company.fromJson(json["company"]),
        );
    }

}

class Address {
    Address({
        required this.street,
        required this.suite,
        required this.city,
        required this.zipcode,
        required this.geo,
    });

    final String? street;
    final String? suite;
    final String? city;
    final String? zipcode;
    final Geo? geo;

    factory Address.fromJson(Map<String, dynamic> json){ 
        return Address(
            street: json["street"],
            suite: json["suite"],
            city: json["city"],
            zipcode: json["zipcode"],
            geo: json["geo"] == null ? null : Geo.fromJson(json["geo"]),
        );
    }

}

class Geo {
    Geo({
        required this.lat,
        required this.lng,
    });

    final String? lat;
    final String? lng;

    factory Geo.fromJson(Map<String, dynamic> json){ 
        return Geo(
            lat: json["lat"],
            lng: json["lng"],
        );
    }

}

class Company {
    Company({
        required this.name,
        required this.catchPhrase,
        required this.bs,
    });

    final String? name;
    final String? catchPhrase;
    final String? bs;

    factory Company.fromJson(Map<String, dynamic> json){ 
        return Company(
            name: json["name"],
            catchPhrase: json["catchPhrase"],
            bs: json["bs"],
        );
    }

}
