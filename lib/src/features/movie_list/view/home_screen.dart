import 'package:coolmovies/src/constants/app_sizes.dart';
import 'package:coolmovies/src/features/movie_list/view/components/movie_grid_view/movie_grid_view.dart';
import 'package:coolmovies/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _HomeScreenAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: Center(child: MovieGridView()),
      ),
    );
  }
}

class _HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeScreenAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(context.l10n.homeScreenTitle));
  }
}
