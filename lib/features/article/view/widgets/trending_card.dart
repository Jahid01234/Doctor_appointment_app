import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/article/model/trending_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TrendingCard extends StatelessWidget {

  final TrendingModel model;
  final VoidCallback onTap;

  const TrendingCard({
    super.key,
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: model.image,
                height: 130,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 130,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              model.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: globalTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}