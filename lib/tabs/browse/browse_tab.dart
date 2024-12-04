import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/app_theme.dart';
import 'package:movies_app/tabs/browse/movie_list_screen.dart';
import 'package:movies_app/widgets/custom_browser.dart';

class BrowserTab extends StatelessWidget {
  const BrowserTab({super.key});
  static const String routeName = 'browser';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
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
            const SizedBox(height: 30),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchGenres(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No categories available'));
                }

                final genres = snapshot.data!;
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      final genre = genres[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoviesListScreen(
                                genreId: genre['id'],
                                genreName: genre['name'],
                              ),
                            ),
                          );
                        },
                        child: CustomBrowser(
                          title: genre['name'] ?? 'Unknown',
                          imageUrl: 'assets/images/action.png',
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
