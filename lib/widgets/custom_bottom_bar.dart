import 'package:flutter/material.dart';


import '../common/app_color.dart';





class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
      this.leftOnTap, this.rightOnTap, this.leftText, this.rightText, this.leftIcon, this.rightIcon, this.middleOnTap, this.midleText, this.middleIcon,
  });
 
  final VoidCallback? leftOnTap;
  final VoidCallback? rightOnTap;
  final String? leftText;
  final String? rightText;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final VoidCallback? middleOnTap;
  final String ? midleText;
  final IconData? middleIcon;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            // spreadRadius: 10,
            blurRadius: 10,
            offset: const Offset(0.8, 0.8), // changes position of shadow
          ),
        ],
        // borderRadius: BorderRadius.vertical(top: Radius.circular(5.0))
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap:leftOnTap,
              child:
               SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                     leftIcon,size: 18.0,color: Colors.white,
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      "$leftText",
                      style:  TextStyle(
                        color: Colors.white,
                        
                        fontWeight: FontWeight.w500,fontSize: 18.0
                      ),
                    )
                  ],
                ),
              ),
          
          
            ),
          ),
          Container(width: 2, color: Colors.white),
          Expanded(
            child: InkWell(
              onTap: rightOnTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                   rightIcon,size: 18.0,color: Colors.white,
                  ),
                   const SizedBox(
                    width: 6.0,
                  ),
                 
                  Text(
                    "$rightText",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,fontSize: 18.0
                    ),
                  ),
                  
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
