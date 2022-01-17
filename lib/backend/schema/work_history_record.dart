import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'work_history_record.g.dart';

abstract class WorkHistoryRecord
    implements Built<WorkHistoryRecord, WorkHistoryRecordBuilder> {
  static Serializer<WorkHistoryRecord> get serializer =>
      _$workHistoryRecordSerializer;

  @nullable
  String get jobTitle;

  @nullable
  String get companyName;

  @nullable
  DateTime get startDate;

  @nullable
  DateTime get endDate;

  @nullable
  String get jobDescription;

  @nullable
  DocumentReference get user;

  @nullable
  String get companyLogo;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(WorkHistoryRecordBuilder builder) => builder
    ..jobTitle = ''
    ..companyName = ''
    ..jobDescription = ''
    ..companyLogo = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workHistory');

  static Stream<WorkHistoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<WorkHistoryRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  WorkHistoryRecord._();
  factory WorkHistoryRecord([void Function(WorkHistoryRecordBuilder) updates]) =
      _$WorkHistoryRecord;

  static WorkHistoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createWorkHistoryRecordData({
  String jobTitle,
  String companyName,
  DateTime startDate,
  DateTime endDate,
  String jobDescription,
  DocumentReference user,
  String companyLogo,
}) =>
    serializers.toFirestore(
        WorkHistoryRecord.serializer,
        WorkHistoryRecord((w) => w
          ..jobTitle = jobTitle
          ..companyName = companyName
          ..startDate = startDate
          ..endDate = endDate
          ..jobDescription = jobDescription
          ..user = user
          ..companyLogo = companyLogo));
