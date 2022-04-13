import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CommonButton extends StatelessWidget  {
  final String label;
  final Function()? onTap;
  final Color? bgColor;
  final Color? labelColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final double? textSize;
  final bool isEnable;
  final double? padding;
  final FontWeight? fontWeight;

  CommonButton(
      {Key? key,
        required this.label,
        required this.onTap,
        this.bgColor,
        this.labelColor,
        this.borderColor,
        this.borderRadius,
        this.height,
        this.width,
        this.padding,
        this.isEnable = true,
        this.fontWeight,
        this.textSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??48.h,
      width: width??double.infinity,
      child: ElevatedButton(
        onPressed: isEnable?onTap:null,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0.0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius??15.r),
                side: BorderSide(color: !isEnable ? Colors.grey: borderColor ?? bgColor ?? Colors.blue)),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(!isEnable ? Colors.grey:bgColor ?? Colors.blue),
        ),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r)),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal:padding??0),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //  fontFamily: fontFamily,
                          fontSize:16.sp,
                          color: labelColor ?? Colors.white,
                          fontWeight: fontWeight ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}