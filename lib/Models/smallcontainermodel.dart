class DistInfo {
  final String name;
  final String name2;
  final String image;
  final String description;
  final String price;
  String ratting;
  DistInfo({
    required this.name,
    required this.price,
    required this.description,
    required this.name2,
    required this.image,
    required this.ratting,
  });
}

List smallcon = [
  DistInfo(
      description:
          "A veggie burger is a hamburger patty that does not contain meat. It may be made from ingredients like beans.",
      name: "Scholarship",
      price: "\$${10}",
      name2: " Vegetarian Burger",
      ratting: " 9.1 Perfect (125)",
      image:
      "https://media.istockphoto.com/id/1366851749/vector/scholarship-banner.jpg?s=612x612&w=0&k=20&c=qFKJiZGmD97vYxqi0qiTolbHV3fDgjYuhNtTbj7cndM="),  DistInfo(
      description:
          "A veggie pizza  roasted red peppers, baby spinach, onions, mushrooms, tomatoes, and black olives.",
      price: "\$${12}",
      name: "Students",
      name2: " Vegetarian Pizaa",
      ratting: " 8.1 Good (122)",
      image:
      "https://t4.ftcdn.net/jpg/05/39/10/47/360_F_539104776_BchIZKRhIUXDY0ZaVHxaoIDvRa2eAG3d.jpg"),
  // DistInfo(
  //     description:
  //         "sushi, a staple rice dish of Japanese cuisine, consisting of cooked rice flavoured with vinegar.",
  //     price: "\$${11}",
  //     name: "Portfolio",
  //     name2: "Sushii",
  //     ratting: " 8.3 Good (123)",
  //     image:
  //     "https://i.ytimg.com/vi/TwYKwaEjJd4/maxresdefault.jpg"),
  DistInfo(
      description:
      "sushi, a staple rice dish of Japanese cuisine, consisting of cooked rice flavoured with vinegar.",
      price: "\$${11}",
      name: "My Interest ",
      name2: "Sushii",
      ratting: " 8.3 Good (123)",
      image:
      "https://i.ytimg.com/vi/TwYKwaEjJd4/maxresdefault.jpg"),  //     name: "Salad",
  //     description:
  //         "Try starting with romaine lettuce, a cheese they like, then move to their favorite vegetable, and dressing. ",
  //     price: "\$${10}",
  //     name2: " Vegetarian Salaad",
  //     ratting: " 8.1 Good (122)",
  //     image:
  //         "https://www.momontimeout.com/wp-content/uploads/2021/08/snickers-apple-salad-square.jpeg"),
];
