import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common_widgets/re-usable-widgets/resuable.dart';
import '../features/Mainfile/models/product.dart';
import '../features/Mainfile/screens/profileScreen.dart';
import 'package:http/http.dart' as http;

Future<bool> signInWithGoogle() async {
  final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication gAuth = await gUser!.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: gAuth.accessToken,
    idToken: gAuth.idToken,
  );
  UserCredential cre =
      await FirebaseAuth.instance.signInWithCredential(credential);
  User? user = cre.user;

  if (user != null) {
    return true;
  } else {
    return false;
  }
}

signup(TextEditingController emailAddress, TextEditingController password,
    TextEditingController Cpassword, BuildContext context) async {
  try {
    final email = emailAddress.text;
    final passwordd = password.text;
    final confirmPass = Cpassword.text;
    if (passwordd != confirmPass) {
      ShowDialogGeneric(context, "Passwords do not match.");
      return;
    }
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: passwordd,
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', passwordd);
    Get.to(() => home_screen());
  } on FirebaseAuthException catch (e) {
    if (e.code == "weak-password") {
      ShowDialogGeneric(context, "The password provided is too weak.");
    } else if (e.code == "email-already-in-use") {
      ShowDialogGeneric(context, "The account already exists for that email.");
    } else if (e.code == "invalid-email") {
      ShowDialogGeneric(context, "The email is invalid.");
    } else {
      ShowDialogGeneric(context, "Something went wrong.");
    }
  } catch (e) {
    ShowDialogGeneric(context, "Error: ${e.toString()}");
  }
}

signIn(TextEditingController emailAddress, TextEditingController password,
    BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress.text, password: password.text);
    Get.to(() => home_screen());
  } on FirebaseAuthException catch (e) {
    if (e.code == "user-not-found") {
      ShowDialogGeneric(context, "User Not Found");
    } else if (e.code == "wrong-password") {
      ShowDialogGeneric(context, "Wrong Password");
    } else {
      ShowDialogGeneric(context, "Error: ${e.code}");
    }
  } catch (e) {
    ShowDialogGeneric(context, e.toString());
  }
}

Future<List<Product>> fetchProduct() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var responseData = json.decode(response.body);
    responseData = responseData['products'];
    //Creating a list to store input data;
    List<Product> products = [];
    for (var singleService in responseData) {
      // print(singleService);
      // print("****************************");
      Product product = Product(
          id: singleService["id"],
          title: singleService["title"],
          description: singleService["description"]);

      //Adding product to the list.
      products.add(product);
    }
    return products.reversed.toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load products');
  }
}

Future<http.Response> createProduct(String title, String description) {
  return http.post(
    Uri.parse('https://dummyjson.com/products/add'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'description': description,
      // 'status': 'Active'
    }),
  );
}

deleteProduct(String id) async {
  final http.Response response = await http.delete(
      Uri.parse('https://dummyjson.com/products/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
  if (response.statusCode == 200) {
    print(response.body);
    return 'Deleted';
  } else {
    throw Exception('Failed to delete Product.');
  }
}

Future<Product> updateProduct(
    String id, String title, String description) async {
  final response = await http.put(
    Uri.parse('https://dummyjson.com/products/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{'title': title, 'description': description}),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Product.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update Product.');
  }
}
