import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final String? labelText;
  final ValueChanged<String>? onChanged;

  const CustomSearchField({super.key, this.labelText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: labelText,
          hintStyle: const TextStyle(
            color: Color(0xffA7A8B3),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(0),
          isDense: true,
        ),
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
