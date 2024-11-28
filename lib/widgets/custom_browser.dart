import 'package:flutter/material.dart';
import 'package:movies_app/app_theme.dart';

class CustomBrowser extends StatelessWidget {
  const CustomBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          15,
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/action.png',
              fit: BoxFit.cover,
              width: 158,
              height: 90,
            ),
            Container(
              width: 158,
              height: 90,
              color: Colors.black.withOpacity(
                0.25,
              ),
              child: Center(
                child: Text(
                  'Action',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppTheme.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
