import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

// import 'APIView.dart';
// import 'InsertRecord.dart';
// import 'drawer_header.dart';
class imageupload extends StatefulWidget {
  // final String email;
  const imageupload({Key? key}) : super(key: key);

  @override
  State<imageupload> createState() => _imageuploadState();
}

class _imageuploadState extends State<imageupload> {
  String ImageURL = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                //code here
                ImagePicker imagepicker = ImagePicker();
                XFile? file =
                    await imagepicker.pickImage(source: ImageSource.gallery);

                if (file == null) {
                  print("In IF");
                  return;
                } else {
                  print("In else");
                  print("File Path: ");
                  print(file.path.toString());

                  Reference referenceRoot =
                      FirebaseStorage.instance.ref('images');
                  Reference referenceDIRImages = referenceRoot.child('images');

                  Reference referenceImagetoUpload =
                      referenceDIRImages.child(file.name);

                  try {
                    await referenceImagetoUpload.putFile(File(file.path));
                    ImageURL = await referenceImagetoUpload.getDownloadURL();
                  } catch (error) {
                    print("FIle not Uploaded: $error");
                  }
                }
              },
              child: Text("Upload Image"),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: GNav(
      //   backgroundColor: Colors.red.shade300,
      //   color: Colors.white,
      //   activeColor: Colors.white,
      //   selectedIndex: 1,
      //   tabBackgroundColor: Colors.redAccent.shade100,
      //   padding: EdgeInsets.all(16),
      //   gap: 6,
      //   onTabChange: (index){
      //     if(index==0){
      //       // AuthController.instance.logout();
      //       // Navigator.pushNamed(context, 'signin');
      //       Get.offAll(()=>(imageupload(email: widget.email,)));
      //     }
      //     if(index==2){
      //       Get.offAll(()=>drawerHeader(em: widget.email));
      //     }
      //     else if (index==1){
      //       Get.offAll(()=>APIView(email: widget.email));
      //     }
      //     else if (index==3){
      //       Get.offAll(()=>InsertRecord(email: widget.email));

      //     }
      //   },
      //   tabs: const[
      //     GButton(icon: Icons.home,
      //         text: 'Upload Image'),
      //     GButton(icon: Icons.favorite_border,
      //         text: 'View All'),
      //     GButton(icon: Icons.account_circle,
      //         text: 'Profile'),
      //     GButton(icon: Icons.add_circle_outline,
      //       text: 'Add',)
      //   ],
      // ),
    );
  }
}
