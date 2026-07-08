import 'package:flutter/material.dart';
import 'package:staffhub/core/app_color.dart';
import 'package:staffhub/core/app_theme.dart';
import 'package:staffhub/widgets/custom_text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
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
                width: MediaQuery.sizeOf(context).width / 2,
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
                    bottomLeft: Radius.circular(200),
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
                child: CustomTextField(title: 'Name'),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24.0),
                child: CustomTextField(title: 'Email'),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,

                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Create Account", style: theme.titleLarge),
                    style: ElevatedButton.styleFrom(
                      shadowColor: AppColor.textDark,
                      backgroundColor: AppColor.orange,
                      elevation: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Container(
            width: MediaQuery.sizeOf(context).width / 3.9,
            height: 112,

            decoration: BoxDecoration(
              border: Border(right: BorderSide(color: Colors.orange, width: 9)),
              color: const Color.fromARGB(255, 190, 189, 189),
              borderRadius: BorderRadius.only(
                // bottomRight: Radius.circular(200),
                topRight: Radius.circular(115),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
