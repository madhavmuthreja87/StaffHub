import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staffhub/core/app_color.dart';
import 'package:staffhub/core/app_theme.dart';
import 'package:staffhub/main.dart';
import 'package:staffhub/models/owner_model.dart';
import 'package:staffhub/providers/owner_provider.dart';
import 'package:staffhub/screens/admin_panels/admin_home_screen.dart';
import 'package:staffhub/screens/log_in.dart';
import 'package:staffhub/screens/sign_up.dart';
import 'package:staffhub/widgets/custom_button.dart';
import 'package:staffhub/widgets/custom_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isLoading = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  String email = "", password = "";
  Future<void> forgotpassword() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );

      print(
        "!!!!!!!!!!!              forgot password mail sent         !!!!!!!!!!!!!!!",
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Mail sent to user mail, kindly check your mail box"),
        ),
      );
    } on FirebaseAuthException catch (e) {
      print("Error while sign up : $e.code");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.code)));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Row(
                        children: [
                          Text("Staff ", style: theme.headlineLarge),
                          Text(
                            "Hub",
                            style: theme.headlineLarge?.copyWith(
                              color: AppColor.greyish,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text(
                        "Forgot\npassword",
                        style: theme.displayLarge,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width / 3,
                  height: 200,

                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: const Color.fromARGB(255, 190, 189, 189),
                        width: 14,
                      ),
                    ),
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(300),
                      topLeft: Radius.circular(0),
                    ),
                  ),
                ),
              ],
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24.0),
                    child: CustomTextFormField(
                      title: 'Email',

                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter an email";
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 30),

                  const SizedBox(height: 50),
                  isLoading == true
                      ? CircularProgressIndicator()
                      : Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24.0),
                          child: CustomButton(
                            title: 'Continue',
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                await forgotpassword();
                              }
                            },
                          ),
                        ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 175),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                  );
                },
                child: Text(
                  "Want to login account ?",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width / 3.9,
              height: 150,

              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.orange, width: 9),
                ),
                color: const Color.fromARGB(255, 190, 189, 189),
                borderRadius: BorderRadius.only(
                  // bottomRight: Radius.circular(200),
                  topRight: Radius.circular(115),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
