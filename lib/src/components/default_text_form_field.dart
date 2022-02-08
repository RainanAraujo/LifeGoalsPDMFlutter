import 'package:flutter/material.dart';
import 'package:life_goals_pdm/src/app/app_colors.dart';
import 'package:life_goals_pdm/src/app/app_text_styles.dart';

class DefaultTextFormField extends StatefulWidget {
  const DefaultTextFormField({
    Key? key,
    required this.label,
    required this.hintText,
    this.keyboardType,
    this.controller,
    this.obscureText = false,
    this.autoFocus = false,
    this.textInputAction,
    this.textCapitalization,
    this.onEditingComplete,
    this.onChanged,
  }) : super(key: key);
  final bool? autoFocus;
  final TextEditingController? controller;
  final String label;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final void Function()? onEditingComplete;
  final Function(String)? onChanged;
  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundItem,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.label,
              style: AppTextStyles.label,
            ),
            TextFormField(
              onChanged: widget.onChanged,
              controller: widget.controller,
              textCapitalization:
                  widget.textCapitalization ?? TextCapitalization.none,
              textInputAction: widget.textInputAction,
              autofocus: widget.autoFocus!,
              onEditingComplete: widget.onEditingComplete,
              obscureText: widget.obscureText!,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                hintText: widget.hintText,
              ),
              style: AppTextStyles.message,
            ),
          ],
        ),
      ),
    );
  }
}
