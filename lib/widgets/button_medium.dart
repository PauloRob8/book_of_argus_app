import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ButtonMedium extends StatelessWidget {
  const ButtonMedium({
    required this.width,
    required this.text,
    required this.isLoading,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final double width;
  final String text;
  final bool isLoading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        child: Card(
          color: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextButton(
            onPressed: onTap,
            child: isLoading
                ? const SpinKitThreeBounce(
                    size: 18.0,
                    color: Colors.white,
                  )
                : Text(
                    text,
                    style: const TextStyle(
                      fontFamily: 'MedievalSharp',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      );
}
