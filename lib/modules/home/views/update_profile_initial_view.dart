import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:kmcapp/modules/home/service/custom_app_bar.dart';
import 'package:kmcapp/modules/home/service/custom_dropdown_for_update_profile.dart';
import 'package:kmcapp/modules/home/service/custom_textfield_for_update_view.dart';
import 'package:kmcapp/modules/home/service/user_data_service.dart';
import 'package:kmcapp/modules/home/views/home_view.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/res/fonts/appfonts.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UpdateProfileView extends StatefulWidget {
  final String userId;
  const UpdateProfileView({super.key, required this.userId});

  @override
  UpdateProfileViewState createState() => UpdateProfileViewState();
}

class UpdateProfileViewState extends State<UpdateProfileView> {
  late TextEditingController usernameController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController mobileNumberController;
  late TextEditingController dobController;
  late String userId;

  File? _image;
  final picker = ImagePicker();
  String? _profileImageUrl;
  bool isUploading = false;
  bool isFetching = true;

  @override
  void initState() {
    super.initState();
    userId = widget.userId;
    usernameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    mobileNumberController = TextEditingController();
    dobController = TextEditingController();
    isFetching = true; //showing spinner
    // Fetch user data and populate controllers
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    setState(() {
      isFetching = true; // Start fetching
    });

    UserDataService userDataService = UserDataService();
    final userData = await userDataService.fetchUserData();

    if (userData != null) {
      setState(() {
        usernameController.text = userData['email'] ?? '';
        firstNameController.text = userData['firstName'] ?? '';
        lastNameController.text = userData['lastName'] ?? '';
        emailController.text = userData['email'] ?? '';
        mobileNumberController.text = userData['mobileNumber'] ?? '';
        dobController.text = userData['dateOfBirth'] ?? '';
        _profileImageUrl = userData['profileImageUrl'];
      });
    }

    setState(() {
      isUploading = false; // stop showing spinner
    });
  }

  Future<void> getGalleryImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> getCameraImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<String?> _uploadImageToFirebase() async {
    if (_image == null) return null;
    try {
      setState(() {
        isUploading = true; // Start uploading
      });
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('profile_images/${DateTime.now().millisecondsSinceEpoch}');
      firebase_storage.UploadTask uploadTask = ref.putFile(_image!);
      await uploadTask;
      String downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    } finally {
      setState(() {
        isUploading = false; // End uploading
      });
    }
  }

  Future<void> _updateUserProfile() async {
    String? imageUrl = await _uploadImageToFirebase();

    GenderController genderController = Get.find<GenderController>();

    UserDataService userDataService = UserDataService();
    await userDataService.updateUserProfile(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      gender: genderController.selectedGender.value,
      mobileNumber: mobileNumberController.text,
      dateOfBirth: dobController.text,
      profileImageUrl: imageUrl ?? _profileImageUrl ?? '',
    );

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Update Profile",
        onNotificationPressed: () {},
        badgeCount: counter,
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              ImageAssets.registerScreenBottomImage,
              height: 100,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: ClipOval(
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: isUploading
                          ? const SpinKitFadingCircle(
                              color: AppColors.greyDarksTextColor,
                              size: 30,
                            )
                          : _image != null
                              ? Image.file(
                                  _image!.absolute,
                                  fit: BoxFit.cover,
                                )
                              : _profileImageUrl != null
                                  ? Image.network(
                                      _profileImageUrl!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      ImageAssets.kmcLogoGrey,
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.contain,
                                    ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            title: const Text(
                              "Select Image!",
                              style: TextStyle(
                                fontFamily: AppFonts.appFont,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            children: <Widget>[
                              SimpleDialogOption(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  await getGalleryImage();
                                  if (_image != null) {
                                    await _uploadImageToFirebase();
                                  }
                                },
                                child: const Text(
                                  'Choose from Gallery',
                                  style: TextStyle(
                                    fontFamily: AppFonts.appFont,
                                  ),
                                ),
                              ),
                              SimpleDialogOption(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  await getCameraImage();
                                  if (_image != null) {
                                    await _uploadImageToFirebase();
                                  }
                                },
                                child: const Text(
                                  'Camera',
                                  style: TextStyle(
                                    fontFamily: AppFonts.appFont,
                                  ),
                                ),
                              ),
                              SimpleDialogOption(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontFamily: AppFonts.appFont,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Edit Photo",
                      style: TextStyle(color: Color.fromARGB(178, 3, 93, 211)),
                    )),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    child: upDateProfileViewGendarDropDown(userId),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextFormFieldForUpdateView(
                  controller: usernameController,
                  hintText: "Username",
                  labelText: "Username",
                  prefixIcon: Icons.person,
                  suffixIcon: Icons.edit,
                  isEditable: false,
                  isBold: true,
                ),
                const SizedBox(height: 10),
                CustomTextFormFieldForUpdateView(
                  controller: firstNameController,
                  hintText: "First Name",
                  labelText: "First Name",
                  prefixIcon: Icons.person,
                  suffixIcon: Icons.edit,
                ),
                const SizedBox(height: 10),
                CustomTextFormFieldForUpdateView(
                  controller: lastNameController,
                  hintText: "Last Name",
                  labelText: "Last Name",
                  prefixIcon: Icons.person,
                  suffixIcon: Icons.edit,
                ),
                const SizedBox(height: 10),
                CustomTextFormFieldForUpdateView(
                  controller: emailController,
                  hintText: "E-Mail Address",
                  labelText: "E-Mail Address",
                  prefixIcon: Icons.email_rounded,
                  suffixIcon: Icons.edit,
                ),
                const SizedBox(height: 10),
                CustomTextFormFieldForUpdateView(
                  controller: mobileNumberController,
                  hintText: "Mobile Number",
                  labelText: "Mobile Number",
                  prefixIcon: Icons.phone_android_rounded,
                  suffixIcon: Icons.edit,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    DateTime? datepicked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1974),
                        lastDate: DateTime(2147));

                    if (datepicked != null && datepicked != DateTime.now()) {
                      String formattedDate =
                          DateFormat('dd MMM yyyy').format(datepicked);

                      dobController.text = formattedDate;
                      print(dobController);
                    }
                  },
                  child: AbsorbPointer(
                    child: CustomTextFormFieldForUpdateView(
                      controller: dobController,
                      hintText: "Date of Birth",
                      labelText: "Date of Birth",
                      prefixIcon: Icons.calendar_month_rounded,
                      suffixIcon: Icons.edit,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () async {
                      await _updateUserProfile();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.greenDarkColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Text(
                      'UPDATE',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
