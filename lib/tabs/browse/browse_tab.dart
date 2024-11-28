import 'package:flutter/material.dart';
import 'package:movies_app/app_theme.dart';
import 'package:movies_app/widgets/custom_browser.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Browse Category',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppTheme.white,
                  ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const CustomBrowser();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
