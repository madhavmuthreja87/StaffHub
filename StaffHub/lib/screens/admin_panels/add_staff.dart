import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:staffhub/core/app_color.dart';
import 'package:staffhub/models/staff_model.dart';
import 'package:staffhub/providers/staff_provider.dart';
import 'package:staffhub/widgets/custom_button.dart';
import 'package:staffhub/widgets/custom_text_field.dart';

class AddStaff extends StatefulWidget {
  const AddStaff({super.key});

  @override
  State<AddStaff> createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController dateofjoiningController = TextEditingController();
  File? selectedfile;
  final ImagePicker _picker = ImagePicker();
  Future<void> imagePicker() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    selectedfile = image.path as File?;
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
        appBar: AppBar(
          backgroundColor: AppColor.background,
          centerTitle: true,
          title: Text.rich(
            TextSpan(
              text: 'Staff ',
              style: theme.titleMedium,
              children: [
                TextSpan(
                  text: "Hub",
                  style: theme.titleMedium?.copyWith(color: AppColor.greyish),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24,
            top: 0,
            bottom: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Add Staff",
                style: theme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
              ),

              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        imagePicker();
                      },
                      child: Container(
                        height: 70,
                        width: 70,

                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: AppColor.greyish),

                          color: const Color.fromARGB(120, 255, 153, 0),

                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: Icon(Icons.add_a_photo_rounded),
                      ),
                    ),
                    const SizedBox(height: 18),
                    CustomTextField(title: 'Name', controller: nameController),
                    const SizedBox(height: 18),
                    CustomTextField(
                      title: 'Adress',
                      controller: addressController,
                    ),
                    // const SizedBox(height: 18),

                    // CustomTextField(title: 'Role'),
                    const SizedBox(height: 18),
                    CustomTextField(
                      title: 'Salary',
                      controller: salaryController,
                    ),
                    const SizedBox(height: 18),
                    CustomTextField(
                      title: 'Date of joining',
                      controller: dateofjoiningController,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              // CustomTextField(title: ''),
              CustomButton(
                title: 'Add',
                onPressed: () {
                  StaffModel staff = StaffModel(
                    name: nameController.text,
                    address: addressController.text,
                    joiningDate: DateTime.now(),
                    salary: double.parse(salaryController.text),
                    staffid: '',
                    ownerid: '',
                    email: '',
                    role: '',
                    profileImage: '',
                    todayPresent: true,
                  );
                  context.read<StaffProvider>().AddStaff(staff);
                  print("staff saved");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
