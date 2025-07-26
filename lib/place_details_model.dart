class PlaceDetailsModel {
  final List<AddressComponent> addressComponents;
  final String adrAddress;
  final String businessStatus;
  final String formattedAddress;
  final String formattedPhoneNumber;
  final Geometry geometry;
  final String icon;
  final String iconBackgroundColor;
  final String iconMaskBaseUri;
  final String internationalPhoneNumber;
  final String name;
  final OpeningHours openingHours;
  final List<Photo> photos;
  final String placeId;
  final PlusCode plusCode;
  final double rating;
  final String reference;
  final List<Review> reviews;
  final List<String> types;
  final String url;
  final int userRatingsTotal;
  final int utcOffset;
  final String vicinity;
  final String website;

  PlaceDetailsModel({
    required this.addressComponents,
    required this.adrAddress,
    required this.businessStatus,
    required this.formattedAddress,
    required this.formattedPhoneNumber,
    required this.geometry,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconMaskBaseUri,
    required this.internationalPhoneNumber,
    required this.name,
    required this.openingHours,
    required this.photos,
    required this.placeId,
    required this.plusCode,
    required this.rating,
    required this.reference,
    required this.reviews,
    required this.types,
    required this.url,
    required this.userRatingsTotal,
    required this.utcOffset,
    required this.vicinity,
    required this.website,
  });

  factory PlaceDetailsModel.fromJson(Map<String, dynamic> json) {
    return PlaceDetailsModel(
      addressComponents: (json['address_components'] as List)
          .map((e) => AddressComponent.fromJson(e))
          .toList(),
      adrAddress: json['adr_address'],
      businessStatus: json['business_status'],
      formattedAddress: json['formatted_address'],
      formattedPhoneNumber: json['formatted_phone_number'],
      geometry: Geometry.fromJson(json['geometry']),
      icon: json['icon'],
      iconBackgroundColor: json['icon_background_color'],
      iconMaskBaseUri: json['icon_mask_base_uri'],
      internationalPhoneNumber: json['international_phone_number'],
      name: json['name'],
      openingHours: OpeningHours.fromJson(json['opening_hours']),
      photos: (json['photos'] as List).map((e) => Photo.fromJson(e)).toList(),
      placeId: json['place_id'],
      plusCode: PlusCode.fromJson(json['plus_code']),
      rating: (json['rating'] as num).toDouble(),
      reference: json['reference'],
      reviews: (json['reviews'] as List).map((e) => Review.fromJson(e)).toList(),
      types: List<String>.from(json['types']),
      url: json['url'],
      userRatingsTotal: json['user_ratings_total'],
      utcOffset: json['utc_offset'],
      vicinity: json['vicinity'],
      website: json['website'],
    );
  }
}

class AddressComponent {
  final String longName;
  final String shortName;
  final List<String> types;

  AddressComponent({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  factory AddressComponent.fromJson(Map<String, dynamic> json) {
    return AddressComponent(
      longName: json['long_name'],
      shortName: json['short_name'],
      types: List<String>.from(json['types']),
    );
  }
}

class Geometry {
  final Location location;
  final Viewport viewport;

  Geometry({required this.location, required this.viewport});

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      location: Location.fromJson(json['location']),
      viewport: Viewport.fromJson(json['viewport']),
    );
  }
}

class Location {
  final double lat;
  final double lng;

  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}

class Viewport {
  final Location northeast;
  final Location southwest;

  Viewport({required this.northeast, required this.southwest});

  factory Viewport.fromJson(Map<String, dynamic> json) {
    return Viewport(
      northeast: Location.fromJson(json['northeast']),
      southwest: Location.fromJson(json['southwest']),
    );
  }
}

class OpeningHours {
  final bool openNow;
  final List<Period> periods;
  final List<String> weekdayText;

  OpeningHours({
    required this.openNow,
    required this.periods,
    required this.weekdayText,
  });

  factory OpeningHours.fromJson(Map<String, dynamic> json) {
    return OpeningHours(
      openNow: json['open_now'],
      periods: (json['periods'] as List).map((e) => Period.fromJson(e)).toList(),
      weekdayText: List<String>.from(json['weekday_text']),
    );
  }
}

class Period {
  final TimeDetail open;
  final TimeDetail close;

  Period({required this.open, required this.close});

  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(
      open: TimeDetail.fromJson(json['open']),
      close: TimeDetail.fromJson(json['close']),
    );
  }
}

class TimeDetail {
  final int day;
  final String time;

  TimeDetail({required this.day, required this.time});

  factory TimeDetail.fromJson(Map<String, dynamic> json) {
    return TimeDetail(
      day: json['day'],
      time: json['time'],
    );
  }
}

class Photo {
  final int height;
  final List<String> htmlAttributions;
  final String photoReference;
  final int width;

  Photo({
    required this.height,
    required this.htmlAttributions,
    required this.photoReference,
    required this.width,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      height: json['height'],
      htmlAttributions: List<String>.from(json['html_attributions']),
      photoReference: json['photo_reference'],
      width: json['width'],
    );
  }
}

class PlusCode {
  final String compoundCode;
  final String globalCode;

  PlusCode({required this.compoundCode, required this.globalCode});

  factory PlusCode.fromJson(Map<String, dynamic> json) {
    return PlusCode(
      compoundCode: json['compound_code'],
      globalCode: json['global_code'],
    );
  }
}

class Review {
  final String authorName;
  final String authorUrl;
  final String language;
  final String profilePhotoUrl;
  final int rating;
  final String relativeTimeDescription;
  final String text;
  final int time;

  Review({
    required this.authorName,
    required this.authorUrl,
    required this.language,
    required this.profilePhotoUrl,
    required this.rating,
    required this.relativeTimeDescription,
    required this.text,
    required this.time,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      authorName: json['author_name'],
      authorUrl: json['author_url'],
      language: json['language'],
      profilePhotoUrl: json['profile_photo_url'],
      rating: json['rating'],
      relativeTimeDescription: json['relative_time_description'],
      text: json['text'],
      time: json['time'],
    );
  }
}
