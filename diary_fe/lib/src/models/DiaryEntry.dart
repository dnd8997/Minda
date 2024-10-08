// import 'package:diary_fe/src/models/diary_image.dart';

// class DiaryEntry {
//   final int diaryIndex;
//   final String diarySetDate;
//   final String diaryTitle;
//   final String diaryContent;
//   final double diaryHappiness, diarySadness, diaryFear, diaryAnger, diarySurprise;
//   final List<DiaryImage> imageList;
//   final List<String> hashtagList;

//   DiaryEntry.fromJson(Map<String, dynamic> json)
//       : diaryIndex = json['diaryIndex'] ?? 0,  // null 체크 및 기본값 제공
//         diarySetDate = json['diarySetDate'] ?? 'No Date',  // null 체크 및 기본값 제공
//         diaryTitle = json['diaryTitle'] ?? 'No Title',  // null 체크 및 기본값 제공
//         diaryContent = json['diaryContent'] ?? 'No Content',  // null 체크 및 기본값 제공
//         diaryHappiness = json['diaryHappiness'] ?? 0,  // null 체크 및 기본값 제공
//         diarySadness = json['diarySadness'] ?? 0,  // null 체크 및 기본값 제공
//         diaryFear = json['diaryFear'] ?? 0,  // null 체크 및 기본값 제공
//         diaryAnger = json['diaryAnger'] ?? 0,  // null 체크 및 기본값 제공
//         diarySurprise = json['diarySurprise'] ?? 0,  // null 체크 및 기본값 제공
//         imageList = (json['imageList'] as List?)?.map((i) => DiaryImage.fromJson(i as Map<String, dynamic>)).toList() ?? [],  // null 체크 및 기본값 제공
//         hashtagList = json['hashtagList'] != null ? List<String>.from(json['hashtagList'] as List<dynamic> ?? []):[];  // null 체크 및 기본값 제공
// }

import 'package:diary_fe/src/models/diary_image.dart';

class DiaryEntry {
  final int diaryIndex;
  final String diarySetDate;
  final String diaryTitle;
  final String diaryContent;
  final double diaryHappiness, diarySadness, diaryFear, diaryAnger, diarySurprise;
  final List<DiaryImage> imageList;
  final List<String> hashtagList;

  DiaryEntry.fromJson(Map<String, dynamic> json)
      : diaryIndex = json['diaryIndex'] ?? 0,
        diarySetDate = json['diarySetDate'] ?? 'No Date',
        diaryTitle = json['diaryTitle'] ?? 'No Title',
        diaryContent = json['diaryContent'] ?? 'No Content',
        diaryHappiness = json['diaryHappiness'] ?? 0,
        diarySadness = json['diarySadness'] ?? 0,
        diaryFear = json['diaryFear'] ?? 0,
        diaryAnger = json['diaryAnger'] ?? 0,
        diarySurprise = json['diarySurprise'] ?? 0,
        imageList = (json['imageList'] as List?)?.map((i) => DiaryImage.fromJson(i as Map<String, dynamic>)).toList() ?? [],
        hashtagList = json['hashtagList'] != null ? List<String>.from(json['hashtagList'] as List<dynamic>) : [];
}

class DiaryImage {
  final int imageIndex;
  final int diaryIndex;
  final String imageName;
  final String imageLink;

  DiaryImage.fromJson(Map<String, dynamic> json)
      : imageIndex = json['imageIndex'] ?? 0,
        diaryIndex = json['diaryIndex'] ?? 0,
        imageName = json['imageName'] ?? 'Unknown Image',
        imageLink = json['imageLink'] ?? '';
}
