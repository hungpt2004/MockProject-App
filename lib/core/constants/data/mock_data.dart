import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:vdiary_internship/data/models/post/post_model.dart';
import 'package:vdiary_internship/data/models/story/story_model.dart';
import 'package:vdiary_internship/data/models/tab/tab.model.dart';
import 'package:vdiary_internship/data/models/user/user_model.dart';

class MockData {
  // List User
  static final List<UserModel> users = [
    UserModel(
      '1',
      "a@gmail.com",
      "Nguyễn Văn An",
      "https://i.pinimg.com/736x/4e/88/fa/4e88fa005a298f14bb0f7d989c23cde2.jpg",
      150,
      "https://i.pinimg.com/736x/7d/46/e8/7d46e88122352086a2b59e600202792a.jpg",
    ),
    UserModel(
      '3',
      "b@gmail.com",
      "Trần Thị Bình",
      "https://i.pinimg.com/736x/54/6e/31/546e31ae68e9a34ff072321e495b703c.jpg",
      203,
      "https://i.pinimg.com/736x/b5/1e/9b/b51e9bbf6721037665fa15038f038b61.jpg",
    ),
    UserModel(
      '2',
      "c@gmail.com",
      "Lê Minh Cường",
      "https://i.pinimg.com/736x/6a/9d/9d/6a9d9d28137be97147a827dddf3437d9.jpg",
      89,
      "https://i.pinimg.com/736x/a7/be/0b/a7be0b77edd5aff8ea05de1f9c20ed8a.jpg",
    ),
  ];

  // Type Button
  static final List<String> typeAction = [
    'All',
    'Suggestions',
    'Friend requests',
    'Follows',
  ];

  static final List<TabModel> tabs = [
    TabModel(text: 'Quick share', icon: FluentIcons.document_add_16_regular),
    TabModel(
      text: 'Create new post',
      icon: FluentIcons.document_data_link_16_regular,
    ),
    TabModel(text: 'Share with friends', icon: FluentIcons.share_16_regular),
    TabModel(text: 'Share to page', icon: FluentIcons.page_fit_16_regular),
    TabModel(text: 'Share to group', icon: FluentIcons.group_20_regular),
    TabModel(text: 'Send via message', icon: FluentIcons.send_16_regular),
    TabModel(text: 'Switch to another app', icon: FluentIcons.apps_20_regular),
    TabModel(text: 'Copy link', icon: FluentIcons.copy_16_regular),
    TabModel(text: 'Add to folder', icon: FluentIcons.folder_add_16_regular),
    TabModel(text: 'Rename', icon: FluentIcons.rename_16_regular),
    TabModel(text: 'Pairing', icon: FluentIcons.heart_12_regular),
    TabModel(text: 'Unfriend', icon: FluentIcons.people_subtract_20_regular),
  ];

  // Data for story model
  static final List<StoryModel> stories = [
    StoryModel(
      imageStory:
          'https://i.pinimg.com/736x/e5/72/c7/e572c7320c4719578c10855b8f846a50.jpg',
      avatarUser:
          'https://i.pinimg.com/736x/cb/4e/64/cb4e645d958ad62a7a2aed5209d56487.jpg',
      nameUser: 'Diễm Ngọc',
    ),
    StoryModel(
      imageStory:
          'https://i.pinimg.com/736x/c5/c7/a1/c5c7a1bf1287352cea00944a82b81944.jpg',
      avatarUser:
          'https://i.pinimg.com/736x/7a/ea/08/7aea08c5323513c0a4c28ff5cb4d5d14.jpg',
      nameUser: 'Thảo Vi',
    ),
    StoryModel(
      imageStory:
          'https://i.pinimg.com/736x/e1/9f/89/e19f89b408b30b6f2294367c84ebbb75.jpg',
      avatarUser:
          'https://i.pinimg.com/736x/b7/72/e1/b772e17585259ff760886ead3c4ae099.jpg',
      nameUser: 'Anh Quốc',
    ),
    StoryModel(
      imageStory:
          'https://i.pinimg.com/736x/c8/96/1a/c8961a7e88a8f6d1e45226f27e4cfd3f.jpg',
      avatarUser:
          'https://i.pinimg.com/736x/e7/14/d3/e714d385eac4878dd1b5af4716335009.jpg',
      nameUser: 'Louis Nguyễn',
    ),
    StoryModel(
      imageStory:
          'https://i.pinimg.com/736x/a3/1d/1a/a31d1acdd7930cf3b159a09717054230.jpg',
      avatarUser:
          'https://i.pinimg.com/736x/e9/3a/09/e93a0996a2d838b7a5dac7eada0117f5.jpg',
      nameUser: 'Lê Quang Bách',
    ),
  ];

  static final List<PostModel> posts = [
    PostModel(
      avatarUser:
          'https://i.pinimg.com/736x/4e/88/fa/4e88fa005a298f14bb0f7d989c23cde2.jpg',
      content: 'Xin chào mọi người, đã bao giờ mọi người nghĩ rằng',
      image:
          'https://i.pinimg.com/736x/af/d2/b5/afd2b5cb269dba9b0d799be94ba64068.jpg',
      nameUser: 'Nguyễn Văn A',
      likeNumber: 122,
      commentNumber: 15,
      shareNumber: 1,
    ),
    PostModel(
      avatarUser:
          'https://i.pinimg.com/736x/54/6e/31/546e31ae68e9a34ff072321e495b703c.jpg',
      content: 'Bình chào các bạn !',
      image:
          'https://i.pinimg.com/736x/03/1b/3d/031b3d1646facd390f9ac856af3632c2.jpg',
      nameUser: 'Trần Thị Bình',
      likeNumber: 454,
      commentNumber: 22,
      shareNumber: 1,
    ),
    PostModel(
      avatarUser:
          'https://i.pinimg.com/736x/6a/9d/9d/6a9d9d28137be97147a827dddf3437d9.jpg',
      content: 'Quê hương ta đẹp lắm',
      image:
          'https://i.pinimg.com/736x/88/6d/8e/886d8e6752361e51033dd071a5280ae1.jpg',
      nameUser: 'Lê Minh Cường',
      likeNumber: 234,
      commentNumber: 234,
      shareNumber: 1,
    ),
  ];
}
