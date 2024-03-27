import 'package:belajar_infite_list_with_bloc/model/post.dart';
import 'package:bloc/bloc.dart';

class PostEvent {}

abstract class PostState {}

class PostUninitialized extends PostState {}

class PostLoaded extends PostState {
  List<Post> posts;
  bool hasReachedMax;

  PostLoaded({this.posts, this.hasReachedMax});

  PostLoaded copyWith({List<Post> posts, bool hasReachedmax}) {
    return PostLoaded(
        posts: posts ?? this.posts,
        hasReachedMax: hasReachedmax ?? this.hasReachedMax);
  }
}

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  // TODO: implement initialState
  PostState get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    List<Post> posts;
    if (state is PostUninitialized) {
      posts = await Post.connectToAPI(0, 10);
      yield PostLoaded(posts: posts, hasReachedMax: false);
    } else {
      PostLoaded postLoaded = state as PostLoaded;
      posts = await Post.connectToAPI(postLoaded.posts.length, 10);

      yield (posts.isEmpty)
          ? postLoaded.copyWith(hasReachedmax: true)
          : PostLoaded(posts: postLoaded.posts + posts, hasReachedMax: false);
    }
  }
}
