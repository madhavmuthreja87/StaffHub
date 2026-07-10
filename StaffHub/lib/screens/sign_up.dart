import 'package:flutter/material.dart';
import 'package:staffhub/core/app_color.dart';
import 'package:staffhub/core/app_theme.dart';
import 'package:staffhub/widgets/custom_button.dart';
import 'package:staffhub/widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                      child: Text("Sign Up", style: theme.displayLarge),
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
            Column(
              children: [
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24.0),
                  child: CustomTextField(
                    title: 'Name',
                    controller: nameController,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24.0),
                  child: CustomTextField(
                    title: 'Email',
                    controller: emailController,
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24.0),
                  child: CustomButton(
                    title: 'Create Account',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
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
