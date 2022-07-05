import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isObsecure;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final String? hintText;
  final IconData? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final bool? isRoundBordered;
  final bool? isEnable;

  const CustomTextField(
      {Key? key,
      this.controller,
      this.focusNode,
      this.isObsecure,
      this.validator,
      this.inputType,
      this.inputAction,
      this.hintText,
      this.suffixIcon,
      this.maxLength,
      this.maxLines,
      this.isRoundBordered, this.isEnable})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    widget.focusNode!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines ?? 1,
        enabled: widget.isEnable ?? true,
        decoration: InputDecoration(
          labelText: widget.hintText,
          suffixIcon: Icon(
            widget.suffixIcon,
            color: widget.focusNode!.hasFocus ? Colors.black : Colors.black38,
          ),
          border: (widget.isRoundBordered ?? false)
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38))
              : const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38)),
          focusedBorder: (widget.isRoundBordered ?? false)
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2))
              : const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2)),
          labelStyle: TextStyle(
            fontSize: 14,
            color: widget.focusNode!.hasFocus ? Colors.black : Colors.black38,
          ),
          counterText: "",
        ),
        validator: widget.validator,
        textInputAction: widget.inputAction,
        keyboardType: widget.inputType,
        obscureText: widget.isObsecure ?? false,
      ),
    );
  }
}
