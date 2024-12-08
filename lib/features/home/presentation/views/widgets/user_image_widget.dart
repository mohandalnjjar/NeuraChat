import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neura_chat/core/constants/app_images.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipOval(
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:
                'https://scontent.fcai11-1.fna.fbcdn.net/v/t39.30808-1/465782720_480464578351337_5654340206188988225_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=104&ccb=1-7&_nc_sid=f4b9fd&_nc_eui2=AeE5VowHSw9KdPoEYpWmxBvmTiaFNVb26vhOJoU1Vvbq-Af60Ssl8aO4kvIO93wdZDWLVdelX7HFjeEKDtKViZH6&_nc_ohc=I8zkSAl9Zt4Q7kNvgFSuKXH&_nc_zt=24&_nc_ht=scontent.fcai11-1.fna&_nc_gid=A-nkZ7OmkD5dIk-9WFAUSTc&oh=00_AYASjQ7DwN7gFosP0dRpxn5Giayf9ye27COl1eANZn70zw&oe=67596D8A',
            placeholder: (context, url) {
              return const AspectRatio(
                aspectRatio: 1,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Image.asset(Assets.imagesUnknownUser);
            },
          ),
        ),
      ),
    );
  }
}
