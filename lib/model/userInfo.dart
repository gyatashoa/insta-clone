class UserProfile {
  String username;
  String name;
  int post;
  int followers;
  int following;
  String bio;
  String imgUrl;
  String accountType;

  UserProfile(
      {this.accountType,
      this.followers,
      this.following,
      this.name,
      this.username,
      this.post});

  UserProfile.fromMap(Map<String, dynamic> data)
      : username = data['username'],
        bio = data['bio'],
        name = data['name'],
        post = data['post'],
        following = data['following'],
        accountType = data['accountType'],
        followers = data['followers'];
}
