import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_goals_pdm/src/app/app_colors.dart';
import 'package:life_goals_pdm/src/app/app_text_styles.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    this.isChecked,
    required this.onChange,
    this.label,
    Key? key,
  }) : super(key: key);

  final Function onChange;
  final bool? isChecked;
  final String? label;

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isChecked ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChange();
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            margin: const EdgeInsets.only(right: 10),
            duration: const Duration(milliseconds: 1600),
            curve: Curves.fastLinearToSlowEaseIn,
            decoration: BoxDecoration(
                color: _isSelected ? AppColors.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: AppColors.blue,
                  width: 1.5,
                )),
            width: 25,
            height: 25,
            child: _isSelected
                ? const Icon(
                    MaterialIcons.done,
                    color: Colors.white,
                    size: 14,
                  )
                : null,
          ),
          Visibility(
            visible: widget.label != null,
            child: Text(
              widget.label ?? "",
              style: AppTextStyles.message,
            ),
          )
        ],
      ),
    );
  }
}
