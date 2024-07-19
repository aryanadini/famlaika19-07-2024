import 'package:famlaika1/constants/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../constants/colors.dart';

class Addmember extends StatefulWidget {
  final bool defaultMale;
  final bool isGenderFixed;
  const Addmember({super.key, required this.defaultMale, this.isGenderFixed = false});

  @override
  State<Addmember> createState() => _AddmemberState();
}

class _AddmemberState extends State<Addmember> {
  bool male = true;
  late Color mcolor;
  Color fcolor = Colors.grey;

  TextEditingController dateinput = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String name = "";
  final TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController FullNameController = TextEditingController();
  TextEditingController RelationController = TextEditingController();

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    male = widget.defaultMale;
    mcolor = male ? Colors.amber : Colors.grey;
    fcolor = male ? Colors.grey : Colors.amber;
    dateinput.text = ""; // set the initial value of text field
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFFFFFFFF)),
        ),
        title: Text(
          "Add Member",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 22.sp,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: SizedBox(
            height: 850.h,
            child: Container(
              width: double.maxFinite,
              child: Column(
                children: [
                  Container(
                    height: 40.h,
                    width: 285.w,
                    margin: EdgeInsets.only(right: 51.w),
                    child: Text(
                      "Let's start by adding a new family member to your family tree.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        height: 1.33.h,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.r),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          backgroundColor: Color(0xFF2B2B2B),
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.person, color: Color(0xFF737272)),
                                alignment: Alignment.center,
                                iconSize: 75.sp,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 70.h,
                          right: -35.w,
                          child: Container(
                            height: 30.h,
                            width: 100.w,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 322.w,
                    color: Color(0xFF2B2B2B),
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Gender",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Figtree',
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10.r),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          if (!widget.isGenderFixed) {
                                            male = true;
                                            setState(() {});
                                          }
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(20.r),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.circular(10.r),
                                            color: Colors.black54,
                                          ),
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.person,
                                                size: 60.sp,
                                                color: male ? Colors.amber : Colors.grey,
                                              ),
                                              Text(
                                                'Male',
                                                textScaleFactor: 1.2.sp,
                                                style: TextStyle(
                                                  fontFamily: 'Figtree',
                                                  fontSize: 14.sp,
                                                  color: male ? Colors.white : Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          if (!widget.isGenderFixed) {
                                            male = false;
                                            setState(() {});
                                          }
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(20.r),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.circular(10.r),
                                            color: Colors.black54,
                                          ),
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.person_2,
                                                size: 60.sp,
                                                color: male ? Colors.grey : Colors.amber,
                                              ),
                                              Text(
                                                'Female',
                                                textScaleFactor: 1.2.sp,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Figtree',
                                                  color: male ? Colors.grey : Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.r),
                                    child: Text(
                                      "Full Name",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFFFFFFF),
                                        fontFamily: 'Figtree',
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 45.h,
                                  width: 290.w,
                                  child: TextField(
                                    controller: FullNameController,
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontFamily: 'Figtree',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.r),
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor: Colors.black.withOpacity(0.1),
                                      filled: true,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.r),
                                    child: Text(
                                      "Relation",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFFFFFFF),
                                        fontFamily: 'Figtree',
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 45.h,
                                  width: 290.w,
                                  child: TextField(
                                    controller: RelationController,
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontFamily: 'Figtree',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.r),
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor: Colors.black.withOpacity(0.1),
                                      filled: true,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.r),
                                    child: Text(
                                      "Phone Number",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFFFFFFF),
                                        fontFamily: 'Figtree',
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 65.h,
                                  width: 290.w,
                                  child: Container(
                                    child: IntlPhoneField(
                                      controller: _phoneNumberController,
                                      focusNode: focusNode,
                                      style: TextStyle(color: Color(0xFFFFFFFF)),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.r),
                                          borderSide: BorderSide.none,
                                        ),
                                        fillColor: Colors.black.withOpacity(0.1),
                                        filled: true,
                                      ),
                                      languageCode: "en",
                                      initialCountryCode: "IN",
                                      onChanged: (phone) {
                                        print(phone.completeNumber);
                                      },
                                      onCountryChanged: (country) {
                                        print('Country changed to: ' + country.name);
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.r),
                                    child: Text(
                                      "Date of Birth",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'figtree',
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 45.h,
                                  width: 290.w,
                                  child: TextField(
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                      fontFamily: 'Figtree',
                                    ),
                                    controller: dateController,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.calendar_month, color: Color(0xFFFFFFFF)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.r),
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor: Colors.black.withOpacity(0.1),
                                      filled: true,
                                    ),
                                    readOnly: true,
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2124),
                                      );
                                      if (pickedDate != null) {
                                        String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                                        setState(() {
                                          dateController.text = formattedDate;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    height: 50.h,
                    width: 322.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: MaterialButton(
                      color: Color(0xFFF7B52C),
                      onPressed: () {
                        if (FullNameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter your Name.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                        if (RelationController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter your Relation.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                        if (_phoneNumberController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter your phone number.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                        if (dateController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter your Date of Birth.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Bottom()));
                      },
                      child: Text(
                        'Add Member',
                        style: TextStyle(
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Color(0xFF1E1E1E),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
