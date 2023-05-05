class Product {
  int id;
  String title;
  String description;

  Product({required this.id, required this.title, required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'], description: json['description'], title: json['title']);
  }

  // static List<Product> servicesList() {
  //   return [
  //     Product(
  //         id: "1",
  //         service: "Hello World1",
  //         description:
  //             "Descriptiodaksjdksajdaskjdasdkjadjksjdaskjdaksdjksajdaskjdsakdsajdsjdksd  d sad as da d sad as d sad sa dsa d sa da sd s d a ds d sad  das dsad sa da sd as dn1"),
  //     Product(id: "2", service: "Hello World2", description: "Description1"),
  //   ];
  // }
}
