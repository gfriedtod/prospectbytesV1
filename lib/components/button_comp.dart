import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonComp extends StatelessWidget {
  ButtonComp({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
    this.secondary = false,
  });
  final VoidCallback onPressed;

  IconData? icon;
  bool secondary;

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 60,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor:  (!secondary) ? Colors.black : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (icon != null)
                  ?  Icon(
                      icon,
                      color: Colors.white,
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          )),
    );
  }
}
