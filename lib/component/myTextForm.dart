import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextForm extends StatefulWidget {
  final String? initialValue;
  final void Function(String)? onChanged;
  final String label;
  final double? labelFontSize;
  final dynamic validatorLabel;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscured;
  final bool? validator;
  final dynamic prefixIcon;
  final dynamic validatorFunc;
  final dynamic maxline;
  final TextInputAction? textInputAction;

  const MyTextForm(
      {super.key,
      required this.label,
      this.inputFormatters,
      this.validatorLabel,
      this.initialValue,
      this.onChanged,
      this.controller,
      this.obscured = false,
      this.prefixIcon,
      this.keyboardType,
      this.maxline,
      this.validator,
      this.validatorFunc,
      this.labelFontSize,
      this.textInputAction});

  @override
  @override
  State<MyTextForm> createState() {
    return _MyTextForm();
  }
}

class _MyTextForm extends State<MyTextForm> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = widget.initialValue ?? '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: widget.maxline,
      // style: TextStyle(fontSize: 20.sp, color: ColorsData.darkGrayColor),
      inputFormatters: widget.inputFormatters,
      validator: widget.validatorFunc ??
          (val) {
            if (widget.validator != false) {
              if (val == null || val.isEmpty) {
                return "Enter valid ${widget.validatorLabel}";
              }
            }
            return null;
          },
      controller: widget.controller ?? _controller,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType, cursorColor: Colors.green.shade600,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          labelText: widget.label.toUpperCase(),
          labelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          errorMaxLines: 2,
          hintStyle: TextStyle(fontSize: 10.sp),
          errorStyle: TextStyle(fontSize: 16.sp),
          filled: false,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade600, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          )),
      obscureText: widget.obscured,
    );
  }
}
