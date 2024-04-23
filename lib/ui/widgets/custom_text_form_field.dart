import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seafood_shop/ui/ui.dart';

enum TypeSuffix { initial, password }

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.filledColor = light1BlueColor,
    this.marginBottom = 15.0,
    this.typeSuffix = TypeSuffix.initial,
    this.suffixFunction,
    this.isSuffixActive = false,
    this.isOnlyRead = false,
    this.onSubmit,
    this.autoFocus = false,
    this.minLines = 1,
    this.maxLines = 5,
    this.expands = false,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final Color filledColor;
  final double marginBottom;
  final TypeSuffix typeSuffix;
  final Function? suffixFunction;
  final bool isSuffixActive;
  final bool isOnlyRead;
  final Function? onSubmit;
  final bool autoFocus;
  final int? minLines;
  final int? maxLines;
  final bool expands;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscureText = widget.typeSuffix == TypeSuffix.password;
  List<TextInputFormatter> listTextInputFormatters = [];

  @override
  void initState() {
    if (widget.keyboardType == TextInputType.phone ||
        widget.keyboardType == TextInputType.name) {
      listTextInputFormatters = [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
        if (widget.keyboardType == TextInputType.phone)
          TextInputFormatter.withFunction((oldValue, newValue) {
            if (newValue.text.isEmpty) {
              return const TextEditingValue(text: '+');
            }
            return newValue;
          }),
      ];
      return;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: widget.marginBottom),
      alignment: Alignment.center,
      child: TextFormField(
        controller: widget.controller,
        obscureText: isObscureText,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        inputFormatters: listTextInputFormatters,
        validator: widget.validator,
        enabled: !widget.isOnlyRead,
        textAlignVertical: TextAlignVertical.top,
        style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
        minLines: widget.minLines,
        maxLines: widget.keyboardType == TextInputType.multiline
            ? widget.maxLines
            : 1,
        expands: widget.expands,
        autofocus: widget.autoFocus,
        onFieldSubmitted: widget.onSubmit != null
            ? (val) {
          widget.onSubmit!();
        }
            : null,
        // expands: widget.keyboardType == TextInputType.multiline ? true : false,
        decoration: InputDecoration(
          counterStyle: const TextStyle(height: double.minPositive),
          counterText: '',
          errorMaxLines: 2,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
          ),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white.withOpacity(.7), fontWeight: FontWeight.w300),
          filled: true,
          fillColor: widget.filledColor,
          contentPadding: const EdgeInsets.only(
            top: 10.0,
            bottom: 10.0,
            left: 13.0,
            right: 13.0,
          ),
          suffixIcon: _buildSuffixButton(),
        ),
      ),
    );
  }

  Widget? _buildSuffixButton() {
    switch (widget.typeSuffix) {
      case TypeSuffix.initial:
        return null;
      case TypeSuffix.password:
        return IconButton(
          onPressed: () {
            setState(() {
              isObscureText = !isObscureText;
            });
          },
          icon: Icon(
            isObscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: light2BlueColor,
          ),
        );
    }
  }
}
