class Collection {
  static const communities = 'communities';
  static const users = 'users';
  static const ads = 'ads';
}

class Communities {
  static const name = 'name';
}

class Users {
  static const name = 'name';
  static const email = 'email';
  static const phone = 'phone_number';
  static const image = 'profile_image_url';
  static const communities = 'communities';
}

class UserCommunities {
  static const id = 'id';
  static const name = 'name';
}

class Ads {
  static const title = 'title';
  static const description = 'descrition';
  static const price = 'price';
  static const images = 'image_urls';
  static const uploader = 'uploader';
  static const type = 'ad_type';
}

class AdUploader {
  static const id = 'id';
  static const name = 'name';
  static const image = 'profile_image_url';
}
