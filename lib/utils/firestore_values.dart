class Collection {
  static const communities = 'communities';
  static const users = 'users';
  static const ads = 'ads';
  static const notifications = 'notifications';
  static const bookings = 'bookings';
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
  static const booker = 'booker';
  static const status = 'status';
}

class AdStub {
  static const id = 'id';
  static const uploader = 'uploader';
  static const title = 'title';
  static const type = 'ad_type';
  static const image = 'image_urls';
}

class Notification {
  static const fromUser = 'from_user';
  static const image = 'image';
  static const time = 'time';
  static const type = 'type';
  static const userId = 'user_id';
}
