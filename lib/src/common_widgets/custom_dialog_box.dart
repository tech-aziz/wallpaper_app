import 'package:flutter/material.dart';
import 'package:galleryapp/src/utils/utils.dart';

class CustomDialogBox extends StatefulWidget {
  final String? title;
  final String? descriptions;
  final String img;

  const CustomDialogBox(
      {super.key, this.title, this.descriptions, required this.img});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Utils.defaultPadding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(Utils.defaultPadding),
          margin: const EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Utils.defaultPadding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.title!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                widget.descriptions!,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: null,
                      icon: Text(
                        'Ok',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Utils.defaultPadding,
          right: Utils.defaultPadding,
          child: CircleAvatar(
            // Image.network(widget.img,fit: BoxFit.cover,)
            backgroundImage: NetworkImage(widget.img),
            radius: 35,
          ),
        ),
      ],
    );
  }
}
