import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_streaming_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_streaming_app/common/widgets/app_bar.dart';
import 'package:movie_streaming_app/core/configs/assets/app_images.dart';
import 'package:movie_streaming_app/presentation/home/widgets/category_text.dart';
import 'package:movie_streaming_app/presentation/home/widgets/now_playing_movies.dart';
import 'package:movie_streaming_app/presentation/home/widgets/pupular_tv.dart';
import 'package:movie_streaming_app/presentation/home/widgets/trending_movies.dart';
import 'package:movie_streaming_app/presentation/search/pages/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(AppImages.logo),
        actions: [
          IconButton(
            onPressed: () {
              AppNavigator.push(context, SearchPage());
            },
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.logout,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CategoryText(title: 'Trendings 🔥'),
            TrendingMovies(),
            SizedBox(height: 15),
            CategoryText(title: 'Now Playing'),
            SizedBox(height: 15),
            NowPlayingMovies(),
            SizedBox(height: 15),
            CategoryText(title: 'Popular TV'),
            PopularTV(),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
