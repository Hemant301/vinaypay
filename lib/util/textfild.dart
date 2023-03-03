import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTTextFild extends StatelessWidget {
  FormTTextFild(
      {Key? key,
      this.hinttext,
      this.icon,
      this.maxLength,
      this.controller,
      this.keyboardType,
      this.maxLines,
      this.onChanged,
      this.num})
      : super(key: key);

  final String? hinttext;
  final IconData? icon;
  final int? num;
  final int? maxLines;
  final int? maxLength;
  TextEditingController? controller;
  TextInputType? keyboardType;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: TextField(
        inputFormatters: [LengthLimitingTextInputFormatter(num)],
        keyboardType: keyboardType,
        maxLines: maxLines,
        maxLength: maxLength,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: "",
          filled: true,

          fillColor: const Color.fromARGB(255, 240, 240, 240),
          hintStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
          hintText: hinttext,
          // icon: Icon(
          //   icon,
          //   color: Colors.black,
          // ),
        ),
      ),
    );
  }
}
