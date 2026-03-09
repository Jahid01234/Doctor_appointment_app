import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/article/model/article_model.dart';
import 'package:flutter/material.dart';

class ArticlesCard extends StatelessWidget {
  final ArticleModel article;
  final VoidCallback? onTap;

  const ArticlesCard({
    super.key,
    this.onTap,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            //  Doctor Image................
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                article.image,
                width: 90,
                height: 90,
                fit: BoxFit.fill,
                errorBuilder: (_, __, ___) => Container(
                  width: 90,
                  height: 90,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.person, size: 35, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Replace the Column with:
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: globalTextStyle(
                      fontSize: 18,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.lightGreenColor.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(
                          article.tag,
                          style: globalTextStyle(
                            fontSize: 12,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ),

                      const SizedBox(width: 4),
                      Text(
                        article.dateTime,
                        style: globalTextStyle(
                          fontSize: 12,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
