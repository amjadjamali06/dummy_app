import 'package:excise_e_auction/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:excise_e_auction/utils/app_colors.dart';

class GeneralButton extends StatelessWidget {


  final String text;
  final Color textColor;
  final void Function() onPressed;
  final double margin;
  final Color color;
  final double fontSize;
  final double radius;
  final double width;
  final double height;
  final BorderSide borderSide;

  const GeneralButton({super.key,this.borderSide=BorderSide.none, required this.onPressed, this.text='Submit',this.textColor=kPrimaryDarkColor, this.margin=0, this.color=kButtonColor, this.fontSize = 18.0, this.radius = kFieldRadius, this.width = 500, this.height = 60});

  @override
  Widget build(BuildContext context) {
    return _buildBodyGreen();
  }

  Widget _buildBodyGreen(){
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: margin, vertical: 10),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  side:borderSide,
                  borderRadius: BorderRadius.circular(radius)
              )
          ),
          child: Text(text,
            style: TextStyle(
                fontSize: fontSize,
                color:textColor,
                fontWeight: FontWeight.w400
            ),
          )
      ),
    );
  }

  Widget _buildBodyGradient(){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [kPrimaryColor,kPrimaryLightColor.withAlpha(220)]),
          borderRadius: BorderRadius.circular(radius)
      ),
      margin: EdgeInsets.symmetric(horizontal: margin, vertical: 10),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  side:borderSide,
                  borderRadius: BorderRadius.circular(radius)
              )
          ),
          child: Text(text,
            style: TextStyle(
                fontSize: fontSize,
                color:textColor,
                fontWeight: FontWeight.w400
            ),
          )
      ),
    );
  }
}
