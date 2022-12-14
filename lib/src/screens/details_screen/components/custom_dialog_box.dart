
import 'package:flutter/material.dart';
import '../../../../constant/constant.dart';
import 'input_field.dart';

class CustomDialogBox extends StatelessWidget {
  final String? title, descriptions, image, buttonText, buttonText2;
  final VoidCallback? press1, press2;
  final TextEditingController? controller;
  const CustomDialogBox(
      {Key? key,
      this.title,
      this.descriptions,
      this.press1,
      this.press2,
      this.image,
      this.controller,
      this.buttonText,
      this.buttonText2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: Constants.padding,
            top: Constants.avatarRadius + Constants.padding,
            right: Constants.padding,
            bottom: Constants.padding,
          ),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title!,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,color: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                descriptions!,
                style: TextStyle(fontSize: 14,color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              controller != null
                  ? inputField(context, controller!)
                  : SizedBox(),
              SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: press2 != null
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: [
                  press2 != null
                      ? OutlinedButton(
                          onPressed: press2,
                          child: Text(
                            'Cancel',
                            style: TextStyle(

                              fontSize: 20,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                          ),
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  ElevatedButton(
                    onPressed: press1,
                    child: Text(
                      buttonText!,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Image.asset(
                image!,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
