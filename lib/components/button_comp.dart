import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonComp extends StatelessWidget {
  ButtonComp({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
    this.secondary = false,
    this.isLoading = false,
  });
  final VoidCallback onPressed;

  IconData? icon;
  bool secondary;
  bool? isLoading = false;

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 60,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              side: (!secondary)
                  ? BorderSide.none
                  : const BorderSide(color: Colors.black),
              backgroundColor: (!secondary) ? Colors.black : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (isLoading == true)
                  ? const SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : (icon != null)
                      ? Icon(
                          icon,
                          color: (!secondary) ? Colors.white : Colors.black,
                        )
                      : const SizedBox.shrink(),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: (!secondary) ? Colors.white : Colors.black),
              ),
            ],
          )),
    );
  }
}
