import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _builAppbar(),
      body: _buildBody(),
    );
  }

  _builAppbar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        if (state is RemnoteArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is RemoteArticlesError) {
          return const Center(child: Icon(Icons.refresh));
        } else if (state is RemoteArticlesDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile();
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
