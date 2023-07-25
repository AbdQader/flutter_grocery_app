import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/theme/my_fonts.dart';
import '../../config/theme/my_styles.dart';

class CustomFormField extends StatefulWidget {
  final String? hint;
  final String? label;
  final double? labelSize;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onFieldSubmit;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final Color? textColor;
  final double? textSize;
  final Color? backgroundColor;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final double? borderRound;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final int? minLines;
  final int? maxLines;
  final String? initialValue;
  final bool? enabled;
  final bool? readOnly;
  final Function(String?)? onChanged;
  final bool? expands;
  final bool? isDense;
  final Color? hintColor;
  final double? hintFontSize;
  final FontWeight? hintFontWeight;
  final bool isDatePicker;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final void Function(String)? onDateChanged;
  final Color? iconColor;
  final bool isSearchField; // will show cancel prefix icon to cancel search
  final Function? onCanceled; // callback for cancel (if its search field)


  const CustomFormField({
    Key? key,
    this.hint,
    this.label,
    this.labelSize,
    this.controller,
    this.validator,
    this.onFieldSubmit,
    this.onEditingComplete,
    this.onTap,
    this.keyboardType,
    this.focusNode,
    this.autoFocus,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.contentPadding,
    this.backgroundColor,
    this.textInputAction,
    this.textAlign,
    this.textColor,
    this.textSize,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.borderRound,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.minLines,
    this.maxLines,
    this.initialValue,
    this.enabled,
    this.readOnly,
    this.onChanged,
    this.expands,
    this.isDense,
    this.hintColor,
    this.hintFontSize,
    this.hintFontWeight,
    this.isDatePicker = false,
    this.firstDate,
    this.lastDate,
    this.onDateChanged,
    this.iconColor,
    this.isSearchField = false,
    this.onCanceled,
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {

  String text = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Theme(
        data: Get.theme.copyWith(
          primaryColor: widget.iconColor ?? Get.theme.primaryColor,
          colorScheme: Get.theme.colorScheme.copyWith(
            primary: widget.iconColor ?? Get.theme.primaryColor,
          )
        ),
        child: TextFormField(
          textAlign: widget.textAlign ?? TextAlign.start,
          enabled: widget.enabled,
          readOnly: widget.readOnly ?? false,
          onTap: widget.onTap,
          autofocus: widget.autoFocus ?? false,
          //cursorHeight: 15,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: widget.initialValue,
          style: MyStyles.getTextTheme(isLightTheme: Get.isDarkMode).bodyText2!.copyWith(
            fontSize: widget.textSize ?? 14.sp,
            color: widget.textColor ?? Colors.black.withOpacity(0.8),
          ),
          onSaved: widget.onFieldSubmit,
          onEditingComplete: widget.onEditingComplete,
          onChanged: (value){
            setState(() {
              text = value;
            });
            widget.onChanged?.call(value);
          },
          minLines: widget.minLines,
          maxLines: widget.obscureText == true ? 1 : widget.maxLines,
          expands: widget.expands ?? false,
          decoration: InputDecoration(
            label: widget.label == null ? null : Text(widget.label ?? '', style: TextStyle(fontSize: widget.labelSize),),
            suffixIcon: widget.isSearchField ? text.isEmpty ? null : GestureDetector(onTap: (){
              setState(() {
                widget.controller?.clear();
                text = '';
                widget.onCanceled?.call();
                FocusScope.of(context).unfocus();
              });
            },child: Icon(Icons.close,color: Get.theme.iconTheme.color,)) :  widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
            isDense: widget.isDense,
            filled: true,
            fillColor: widget.backgroundColor ?? const Color(0xFFF9F9F9),
            hintStyle:  MyFonts.getAppFontType.copyWith(
              fontSize: widget.hintFontSize ?? 14.sp,
              fontWeight: widget.hintFontWeight ?? FontWeight.normal,
              color: widget.hintColor ?? Colors.black.withOpacity(0.4)
            ),
            hintText: widget.hint,
            focusedErrorBorder: widget.errorBorder ?? OutlineInputBorder(borderSide: const BorderSide(color: Colors.redAccent, width: 0.0), borderRadius: BorderRadius.circular(widget.borderRound ?? 10)),
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0), width: 0.0), borderRadius: BorderRadius.circular(widget.borderRound ?? 10)),
            errorBorder: widget.errorBorder ?? OutlineInputBorder(borderSide: const BorderSide(color: Colors.redAccent, width: 0.0), borderRadius: BorderRadius.circular(widget.borderRound ?? 10)),
            enabledBorder: widget.enabledBorder ?? OutlineInputBorder(borderSide: BorderSide(color: widget.enabledBorder == null ? Colors.transparent :  Colors.grey[300]!, width: 0.0), borderRadius: BorderRadius.circular(widget.borderRound ?? 10)),
            focusedBorder: widget.focusedBorder ?? OutlineInputBorder(
              borderSide: BorderSide(color: widget.focusedBorderColor ?? Theme.of(context).primaryColor, width: 1.0),
              borderRadius: BorderRadius.circular(widget.borderRound ?? 10),
            ),
          ),
          validator: widget.validator,
          controller: widget.controller,
          onFieldSubmitted: widget.onFieldSubmit,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText ?? false,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
        ),
      ),
    );
  }
}
