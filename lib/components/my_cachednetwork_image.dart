import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCachedNetworkImage extends StatefulWidget {
  final String? imgUrl;
  final double? height;
  final double? width;
  final bool isProfile;
  final bool withCover;
  const MyCachedNetworkImage(
      {Key? key,
      this.imgUrl,
      this.height,
      this.withCover = true,
      this.width,
      this.isProfile = false})
      : super(key: key);

  @override
  State<MyCachedNetworkImage> createState() => _MyCachedNetworkImageState();
}

class _MyCachedNetworkImageState extends State<MyCachedNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => FullPhotoPage(
        //       url: widget.imgUrl!,
        //     ),
        //   ),
        // );
      },
      child: Container(
        width: widget.width ?? 120,
        height: widget.height ?? 100,
        child: CachedNetworkImage(
          fit: widget.withCover ? BoxFit.cover : null,
          imageUrl: widget.imgUrl ??
              "https://res.cloudinary.com/djsk1t9zp/image/upload/v1666397804/Books/haqv1lanbute2lb55w69.png",
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              SizedBox(
            width: 10,
            height: 10,
            child: CircularProgressIndicator(
                strokeWidth: 5,
                color: Color(0xFFFF016B),
                value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) => Container(
            color: widget.isProfile ? Colors.black.withOpacity(0.04) : null,
            child: Icon(
              Icons.error,
              size: 50,
              color: Color(0xFFFF016B),
            ),
          ),
        ),
      ),
    );
  }
}
