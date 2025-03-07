import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/asset_image_path.dart';

class AnimatedCard extends StatefulWidget {
  final String title;
  final String imageUrl;


  AnimatedCard({required this.title, required this.imageUrl});

  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return
      /*Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => widget.onDelete(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: */
      GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(2, 2)),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child:  Image(
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                    image: AssetImage(
                        AssetImgPath
                            .userProfile))),
                /*Image.network(
                  widget.imageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),*/
              SizedBox(height: 10),
              Text(
                widget.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              /*SizedBox(height: 5),
              AnimatedOpacity(
                opacity: isExpanded ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: Text(
                  'Tap to toggle description.',
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),*/
            ],
          ),
        ),
      );
    // );
  }
}