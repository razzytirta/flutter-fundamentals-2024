import 'package:belajar_infite_list_with_bloc/bloc/post_bloc.dart';
import 'package:belajar_infite_list_with_bloc/ui/post_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController controller = ScrollController();
  PostBloc bloc;

  void onScroll() {
    double maxScroll = controller.position.maxScrollExtent;
    double currentScroll = controller.position.pixels;

    if (currentScroll == maxScroll) bloc.add(PostEvent());
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<PostBloc>(context);
    controller.addListener(onScroll);
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Infinite List with BLoC"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostUninitialized)
              return Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              );
            else {
              PostLoaded postLoaded = state as PostLoaded;
              return ListView.builder(
                controller: controller,
                itemCount: (postLoaded.hasReachedMax)
                    ? postLoaded.posts.length
                    : postLoaded.posts.length + 1,
                itemBuilder: (context, index) =>
                    (index < postLoaded.posts.length)
                        ? PostItem(postLoaded.posts[index])
                        : Container(
                            child: Center(
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
              );
            }
          },
        ),
      ),
    );
  }
}
