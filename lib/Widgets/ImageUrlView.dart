import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageUrlView extends StatelessWidget {
  final String imgUrl;
  ImageUrlView(this.imgUrl);
  Widget _imageWidget(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      imageUrl: imgUrl ??
          'http://drums71.ru/wp-content/uploads/2018/02/%d0%9f%d0%98%d0%9b%d0%9e%d0%a2%d0%ab.jpg',
      imageBuilder: (context, imageProvider) {
        return _imageWidget(imageProvider);
      },
      placeholder: (context, url) {
        return Center(child: CircularProgressIndicator());
      },
      errorWidget: (context, url, error) {
        return _imageWidget(
          AssetImage(
            'assets/images/img.jfif',
          ),
        );
      },
    );
  }
}
