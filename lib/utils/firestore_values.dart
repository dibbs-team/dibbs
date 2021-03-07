class Collection {
  static const communities = 'communities';
  static const users = 'users';
  static const ads = 'ads';
}

class Storage {
  static const adImages = 'ad_images';
}

class Communities {
  static const name = 'name';
}

class User {
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

class Ad {
  static const title = 'title';
  static const description = 'descrition';
  static const price = 'price';
  static const type = 'ad_type';
  static const uploader = 'uploader';
  static const images = 'image_urls';
  static const dates = 'date_range';
  static const complete = 'complete';
}

class UserStub {
  static const id = 'id';
  static const name = 'name';
  static const image = 'profile_image_url';
}

class DateRange {
  static const startDate = 'start_date';
  static const endDate = 'end_date';
}

class Booking {
  static const id = 'id';
  static const ad = 'ad';
  static const dates = 'date_range';
  static const uploader = 'uploader';
  static const status = 'status';
}

class AdStub {
  static const id = 'id';
  static const uploader = 'uploader';
  static const title = 'title';
  static const type = 'ad_type';
  static const image = 'image_urls';
}
