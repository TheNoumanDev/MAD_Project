import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/re-usable-widgets/resuable.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../utilities/services.dart';
import '../../../Mainfile/screens/profileScreen.dart';
import 'login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp_screen extends StatefulWidget {
  SignUp_screen({super.key});

  @override
  State<SignUp_screen> createState() => _SignUp_screenState();
}

class _SignUp_screenState extends State<SignUp_screen> {
  bool _rememberMe = false;

  late final TextEditingController _email;

  late final TextEditingController _password;

  late final TextEditingController _Cpassword;

  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _Cpassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _Cpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: backgroundColorGradient,
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 70.0,
                  ),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Email", style: rLabelStyle),
                            const SizedBox(height: 10.0),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: rBoxDecorationStyle,
                              height: 60.0,
                              child: TextFormField(
                                controller: _email,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.white,
                                    ),
                                    hintText: "Enter your Email",
                                    hintStyle: rHintTextStyle),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Password", style: rLabelStyle),
                            const SizedBox(height: 10.0),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: rBoxDecorationStyle,
                              height: 60.0,
                              child: TextFormField(
                                controller: _password,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: const Icon(Icons.lock,
                                        color: Colors.white),
                                    suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.remove_red_eye_rounded),
                                        color: Colors.white),
                                    hintText: "Enter your Password",
                                    hintStyle: rHintTextStyle),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Confirm Password", style: rLabelStyle),
                            const SizedBox(height: 10.0),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: rBoxDecorationStyle,
                              height: 60.0,
                              child: TextFormField(
                                controller: _Cpassword,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: const Icon(Icons.lock,
                                        color: Colors.white),
                                    suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.remove_red_eye_rounded),
                                        color: Colors.white),
                                    hintText: "Confirm your Password",
                                    hintStyle: rHintTextStyle),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        _buildSignUpBtn(context),
                        _buildSignUpnWithText(),
                        _buildSocialBtnRow(),
                        _buildSigninBtn(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpBtn(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 5.0,
        ),
        onPressed: () async {
          signup(_email, _password, _Cpassword, context);
        },
        child: const Text(
          'SIGN UP',
          style: TextStyle(
            color: Color.fromRGBO(37, 24, 78, 1),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpnWithText() {
    return const Text(
      '- OR -',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              // Authservice.signInWithFacebook().then((result) {
              //   Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => const ProfileView()),
              //   );
              // });
            },
            child: Container(
              height: 60.0,
              width: 60.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(
                    rFacebookLogo,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              signInWithGoogle().then(
                (result) {
                  if (result == false) {
                    ShowDialogGeneric(
                        context, "Something went wrong. Login failed.");
                  } else {
                    Get.to(() => const home_screen());
                  }
                },
              );
            },
            child: Container(
              height: 60.0,
              width: 60.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(
                    rGoogleLogo,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSigninBtn() {
    return GestureDetector(
      onTap: () => Get.to(() => LoginScreen()),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Already have an Account?  ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
