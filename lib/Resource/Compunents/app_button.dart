import 'package:flutter/material.dart';

enum IconPosition { left, right }

class RoundedButton extends StatelessWidget {
  RoundedButton({
    Key? key,
    this.gradientColors,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
    required this.title,
    required this.onPress,
    this.width = 60,
    this.height = 50,
    this.loading = false,
    this.loadingText = 'Please wait...',
    this.showLoader = false,
    this.showLoadingText = false,
    this.icon,
    this.iconSpacing = 8.0,
    this.iconPosition = IconPosition.left,
  }) : super(key: key);

  final bool loading;
  final String title;
  final String loadingText;
  final bool showLoader;
  final bool showLoadingText;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;
  final List<Color>? gradientColors;
  final IconData? icon;
  final double iconSpacing;
  final IconPosition iconPosition;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: gradientColors != null
              ? LinearGradient(
            colors: gradientColors!,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          color: gradientColors == null ? buttonColor : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: loading
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showLoader)
                const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              if (showLoader && showLoadingText)
                const SizedBox(width: 10),
              if (showLoadingText)
                Text(
                  loadingText,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: textColor),
                ),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon left side e thakle
              if (icon != null && iconPosition == IconPosition.left)
                Icon(icon, color: textColor, size: 20),
              if (icon != null && iconPosition == IconPosition.left)
                SizedBox(width: iconSpacing),

              // Text
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: textColor),
              ),

              // Icon right side e thakle
              if (icon != null && iconPosition == IconPosition.right)
                SizedBox(width: iconSpacing),
              if (icon != null && iconPosition == IconPosition.right)
                Icon(icon, color: textColor, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
