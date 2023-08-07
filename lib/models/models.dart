class Post {
  final String title;
  final String body;

  Post({required this.title, required this.body});
}

class Comments {
  final String name;
  final String email;
  final String body;

  Comments({
    required this.name,
    required this.email,
    required this.body,
  });
}

class Albums {
  final int id;
  final String title;

  Albums({required this.id, required this.title});
}

class Photos {
  final String title;
  final String url;
  final String thumbnailUrl;

  Photos({
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
}

class Todos {
  final String title;
  final bool completed;

  Todos({
    required this.title,
    required this.completed,
  });
}

class Users {
  final String name;
  final String username;
  final String email;
  final String city;
  final String phone;
  final String website;
  final String companyName;

  Users({
    required this.name,
    required this.username,
    required this.email,
    required this.city,
    required this.phone,
    required this.website,
    required this.companyName,
  });
}
