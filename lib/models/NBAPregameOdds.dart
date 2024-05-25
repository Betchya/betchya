/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the NBAPregameOdds type in your schema. */
class NBAPregameOdds extends amplify_core.Model {
  static const classType = const _NBAPregameOddsModelType();
  final String id;
  final int? _GameId;
  final int? _Season;
  final int? _SeasonType;
  final String? _Day;
  final String? _DateTime;
  final String? _Status;
  final int? _AwayTeamId;
  final int? _HomeTeamId;
  final String? _AwayTeamName;
  final String? _HomeTeamName;
  final int? _GlobalGameId;
  final int? _GlobalAwayTeamId;
  final int? _GlobalHomeTeamId;
  final int? _HomeTeamScore;
  final int? _AwayTeamScore;
  final int? _TotalScore;
  final int? _HomeRotationNumber;
  final int? _AwayRotationNumber;
  final List<String>? _PregameOdds;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  NBAPregameOddsModelIdentifier get modelIdentifier {
      return NBAPregameOddsModelIdentifier(
        id: id
      );
  }
  
  int get GameId {
    try {
      return _GameId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int? get Season {
    return _Season;
  }
  
  int? get SeasonType {
    return _SeasonType;
  }
  
  String? get Day {
    return _Day;
  }
  
  String? get DateTime {
    return _DateTime;
  }
  
  String? get Status {
    return _Status;
  }
  
  int? get AwayTeamId {
    return _AwayTeamId;
  }
  
  int? get HomeTeamId {
    return _HomeTeamId;
  }
  
  String? get AwayTeamName {
    return _AwayTeamName;
  }
  
  String? get HomeTeamName {
    return _HomeTeamName;
  }
  
  int? get GlobalGameId {
    return _GlobalGameId;
  }
  
  int? get GlobalAwayTeamId {
    return _GlobalAwayTeamId;
  }
  
  int? get GlobalHomeTeamId {
    return _GlobalHomeTeamId;
  }
  
  int? get HomeTeamScore {
    return _HomeTeamScore;
  }
  
  int? get AwayTeamScore {
    return _AwayTeamScore;
  }
  
  int? get TotalScore {
    return _TotalScore;
  }
  
  int? get HomeRotationNumber {
    return _HomeRotationNumber;
  }
  
  int? get AwayRotationNumber {
    return _AwayRotationNumber;
  }
  
  List<String>? get PregameOdds {
    return _PregameOdds;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const NBAPregameOdds._internal({required this.id, required GameId, Season, SeasonType, Day, DateTime, Status, AwayTeamId, HomeTeamId, AwayTeamName, HomeTeamName, GlobalGameId, GlobalAwayTeamId, GlobalHomeTeamId, HomeTeamScore, AwayTeamScore, TotalScore, HomeRotationNumber, AwayRotationNumber, PregameOdds, createdAt, updatedAt}): _GameId = GameId, _Season = Season, _SeasonType = SeasonType, _Day = Day, _DateTime = DateTime, _Status = Status, _AwayTeamId = AwayTeamId, _HomeTeamId = HomeTeamId, _AwayTeamName = AwayTeamName, _HomeTeamName = HomeTeamName, _GlobalGameId = GlobalGameId, _GlobalAwayTeamId = GlobalAwayTeamId, _GlobalHomeTeamId = GlobalHomeTeamId, _HomeTeamScore = HomeTeamScore, _AwayTeamScore = AwayTeamScore, _TotalScore = TotalScore, _HomeRotationNumber = HomeRotationNumber, _AwayRotationNumber = AwayRotationNumber, _PregameOdds = PregameOdds, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory NBAPregameOdds({String? id, required int GameId, int? Season, int? SeasonType, String? Day, String? DateTime, String? Status, int? AwayTeamId, int? HomeTeamId, String? AwayTeamName, String? HomeTeamName, int? GlobalGameId, int? GlobalAwayTeamId, int? GlobalHomeTeamId, int? HomeTeamScore, int? AwayTeamScore, int? TotalScore, int? HomeRotationNumber, int? AwayRotationNumber, List<String>? PregameOdds}) {
    return NBAPregameOdds._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      GameId: GameId,
      Season: Season,
      SeasonType: SeasonType,
      Day: Day,
      DateTime: DateTime,
      Status: Status,
      AwayTeamId: AwayTeamId,
      HomeTeamId: HomeTeamId,
      AwayTeamName: AwayTeamName,
      HomeTeamName: HomeTeamName,
      GlobalGameId: GlobalGameId,
      GlobalAwayTeamId: GlobalAwayTeamId,
      GlobalHomeTeamId: GlobalHomeTeamId,
      HomeTeamScore: HomeTeamScore,
      AwayTeamScore: AwayTeamScore,
      TotalScore: TotalScore,
      HomeRotationNumber: HomeRotationNumber,
      AwayRotationNumber: AwayRotationNumber,
      PregameOdds: PregameOdds != null ? List<String>.unmodifiable(PregameOdds) : PregameOdds);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NBAPregameOdds &&
      id == other.id &&
      _GameId == other._GameId &&
      _Season == other._Season &&
      _SeasonType == other._SeasonType &&
      _Day == other._Day &&
      _DateTime == other._DateTime &&
      _Status == other._Status &&
      _AwayTeamId == other._AwayTeamId &&
      _HomeTeamId == other._HomeTeamId &&
      _AwayTeamName == other._AwayTeamName &&
      _HomeTeamName == other._HomeTeamName &&
      _GlobalGameId == other._GlobalGameId &&
      _GlobalAwayTeamId == other._GlobalAwayTeamId &&
      _GlobalHomeTeamId == other._GlobalHomeTeamId &&
      _HomeTeamScore == other._HomeTeamScore &&
      _AwayTeamScore == other._AwayTeamScore &&
      _TotalScore == other._TotalScore &&
      _HomeRotationNumber == other._HomeRotationNumber &&
      _AwayRotationNumber == other._AwayRotationNumber &&
      DeepCollectionEquality().equals(_PregameOdds, other._PregameOdds);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("NBAPregameOdds {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("GameId=" + (_GameId != null ? _GameId!.toString() : "null") + ", ");
    buffer.write("Season=" + (_Season != null ? _Season!.toString() : "null") + ", ");
    buffer.write("SeasonType=" + (_SeasonType != null ? _SeasonType!.toString() : "null") + ", ");
    buffer.write("Day=" + "$_Day" + ", ");
    buffer.write("DateTime=" + "$_DateTime" + ", ");
    buffer.write("Status=" + "$_Status" + ", ");
    buffer.write("AwayTeamId=" + (_AwayTeamId != null ? _AwayTeamId!.toString() : "null") + ", ");
    buffer.write("HomeTeamId=" + (_HomeTeamId != null ? _HomeTeamId!.toString() : "null") + ", ");
    buffer.write("AwayTeamName=" + "$_AwayTeamName" + ", ");
    buffer.write("HomeTeamName=" + "$_HomeTeamName" + ", ");
    buffer.write("GlobalGameId=" + (_GlobalGameId != null ? _GlobalGameId!.toString() : "null") + ", ");
    buffer.write("GlobalAwayTeamId=" + (_GlobalAwayTeamId != null ? _GlobalAwayTeamId!.toString() : "null") + ", ");
    buffer.write("GlobalHomeTeamId=" + (_GlobalHomeTeamId != null ? _GlobalHomeTeamId!.toString() : "null") + ", ");
    buffer.write("HomeTeamScore=" + (_HomeTeamScore != null ? _HomeTeamScore!.toString() : "null") + ", ");
    buffer.write("AwayTeamScore=" + (_AwayTeamScore != null ? _AwayTeamScore!.toString() : "null") + ", ");
    buffer.write("TotalScore=" + (_TotalScore != null ? _TotalScore!.toString() : "null") + ", ");
    buffer.write("HomeRotationNumber=" + (_HomeRotationNumber != null ? _HomeRotationNumber!.toString() : "null") + ", ");
    buffer.write("AwayRotationNumber=" + (_AwayRotationNumber != null ? _AwayRotationNumber!.toString() : "null") + ", ");
    buffer.write("PregameOdds=" + (_PregameOdds != null ? _PregameOdds!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  NBAPregameOdds copyWith({int? GameId, int? Season, int? SeasonType, String? Day, String? DateTime, String? Status, int? AwayTeamId, int? HomeTeamId, String? AwayTeamName, String? HomeTeamName, int? GlobalGameId, int? GlobalAwayTeamId, int? GlobalHomeTeamId, int? HomeTeamScore, int? AwayTeamScore, int? TotalScore, int? HomeRotationNumber, int? AwayRotationNumber, List<String>? PregameOdds}) {
    return NBAPregameOdds._internal(
      id: id,
      GameId: GameId ?? this.GameId,
      Season: Season ?? this.Season,
      SeasonType: SeasonType ?? this.SeasonType,
      Day: Day ?? this.Day,
      DateTime: DateTime ?? this.DateTime,
      Status: Status ?? this.Status,
      AwayTeamId: AwayTeamId ?? this.AwayTeamId,
      HomeTeamId: HomeTeamId ?? this.HomeTeamId,
      AwayTeamName: AwayTeamName ?? this.AwayTeamName,
      HomeTeamName: HomeTeamName ?? this.HomeTeamName,
      GlobalGameId: GlobalGameId ?? this.GlobalGameId,
      GlobalAwayTeamId: GlobalAwayTeamId ?? this.GlobalAwayTeamId,
      GlobalHomeTeamId: GlobalHomeTeamId ?? this.GlobalHomeTeamId,
      HomeTeamScore: HomeTeamScore ?? this.HomeTeamScore,
      AwayTeamScore: AwayTeamScore ?? this.AwayTeamScore,
      TotalScore: TotalScore ?? this.TotalScore,
      HomeRotationNumber: HomeRotationNumber ?? this.HomeRotationNumber,
      AwayRotationNumber: AwayRotationNumber ?? this.AwayRotationNumber,
      PregameOdds: PregameOdds ?? this.PregameOdds);
  }
  
  NBAPregameOdds copyWithModelFieldValues({
    ModelFieldValue<int>? GameId,
    ModelFieldValue<int?>? Season,
    ModelFieldValue<int?>? SeasonType,
    ModelFieldValue<String?>? Day,
    ModelFieldValue<String?>? DateTime,
    ModelFieldValue<String?>? Status,
    ModelFieldValue<int?>? AwayTeamId,
    ModelFieldValue<int?>? HomeTeamId,
    ModelFieldValue<String?>? AwayTeamName,
    ModelFieldValue<String?>? HomeTeamName,
    ModelFieldValue<int?>? GlobalGameId,
    ModelFieldValue<int?>? GlobalAwayTeamId,
    ModelFieldValue<int?>? GlobalHomeTeamId,
    ModelFieldValue<int?>? HomeTeamScore,
    ModelFieldValue<int?>? AwayTeamScore,
    ModelFieldValue<int?>? TotalScore,
    ModelFieldValue<int?>? HomeRotationNumber,
    ModelFieldValue<int?>? AwayRotationNumber,
    ModelFieldValue<List<String>?>? PregameOdds
  }) {
    return NBAPregameOdds._internal(
      id: id,
      GameId: GameId == null ? this.GameId : GameId.value,
      Season: Season == null ? this.Season : Season.value,
      SeasonType: SeasonType == null ? this.SeasonType : SeasonType.value,
      Day: Day == null ? this.Day : Day.value,
      DateTime: DateTime == null ? this.DateTime : DateTime.value,
      Status: Status == null ? this.Status : Status.value,
      AwayTeamId: AwayTeamId == null ? this.AwayTeamId : AwayTeamId.value,
      HomeTeamId: HomeTeamId == null ? this.HomeTeamId : HomeTeamId.value,
      AwayTeamName: AwayTeamName == null ? this.AwayTeamName : AwayTeamName.value,
      HomeTeamName: HomeTeamName == null ? this.HomeTeamName : HomeTeamName.value,
      GlobalGameId: GlobalGameId == null ? this.GlobalGameId : GlobalGameId.value,
      GlobalAwayTeamId: GlobalAwayTeamId == null ? this.GlobalAwayTeamId : GlobalAwayTeamId.value,
      GlobalHomeTeamId: GlobalHomeTeamId == null ? this.GlobalHomeTeamId : GlobalHomeTeamId.value,
      HomeTeamScore: HomeTeamScore == null ? this.HomeTeamScore : HomeTeamScore.value,
      AwayTeamScore: AwayTeamScore == null ? this.AwayTeamScore : AwayTeamScore.value,
      TotalScore: TotalScore == null ? this.TotalScore : TotalScore.value,
      HomeRotationNumber: HomeRotationNumber == null ? this.HomeRotationNumber : HomeRotationNumber.value,
      AwayRotationNumber: AwayRotationNumber == null ? this.AwayRotationNumber : AwayRotationNumber.value,
      PregameOdds: PregameOdds == null ? this.PregameOdds : PregameOdds.value
    );
  }
  
  NBAPregameOdds.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _GameId = (json['GameId'] as num?)?.toInt(),
      _Season = (json['Season'] as num?)?.toInt(),
      _SeasonType = (json['SeasonType'] as num?)?.toInt(),
      _Day = json['Day'],
      _DateTime = json['DateTime'],
      _Status = json['Status'],
      _AwayTeamId = (json['AwayTeamId'] as num?)?.toInt(),
      _HomeTeamId = (json['HomeTeamId'] as num?)?.toInt(),
      _AwayTeamName = json['AwayTeamName'],
      _HomeTeamName = json['HomeTeamName'],
      _GlobalGameId = (json['GlobalGameId'] as num?)?.toInt(),
      _GlobalAwayTeamId = (json['GlobalAwayTeamId'] as num?)?.toInt(),
      _GlobalHomeTeamId = (json['GlobalHomeTeamId'] as num?)?.toInt(),
      _HomeTeamScore = (json['HomeTeamScore'] as num?)?.toInt(),
      _AwayTeamScore = (json['AwayTeamScore'] as num?)?.toInt(),
      _TotalScore = (json['TotalScore'] as num?)?.toInt(),
      _HomeRotationNumber = (json['HomeRotationNumber'] as num?)?.toInt(),
      _AwayRotationNumber = (json['AwayRotationNumber'] as num?)?.toInt(),
      _PregameOdds = json['PregameOdds']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'GameId': _GameId, 'Season': _Season, 'SeasonType': _SeasonType, 'Day': _Day, 'DateTime': _DateTime, 'Status': _Status, 'AwayTeamId': _AwayTeamId, 'HomeTeamId': _HomeTeamId, 'AwayTeamName': _AwayTeamName, 'HomeTeamName': _HomeTeamName, 'GlobalGameId': _GlobalGameId, 'GlobalAwayTeamId': _GlobalAwayTeamId, 'GlobalHomeTeamId': _GlobalHomeTeamId, 'HomeTeamScore': _HomeTeamScore, 'AwayTeamScore': _AwayTeamScore, 'TotalScore': _TotalScore, 'HomeRotationNumber': _HomeRotationNumber, 'AwayRotationNumber': _AwayRotationNumber, 'PregameOdds': _PregameOdds, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'GameId': _GameId,
    'Season': _Season,
    'SeasonType': _SeasonType,
    'Day': _Day,
    'DateTime': _DateTime,
    'Status': _Status,
    'AwayTeamId': _AwayTeamId,
    'HomeTeamId': _HomeTeamId,
    'AwayTeamName': _AwayTeamName,
    'HomeTeamName': _HomeTeamName,
    'GlobalGameId': _GlobalGameId,
    'GlobalAwayTeamId': _GlobalAwayTeamId,
    'GlobalHomeTeamId': _GlobalHomeTeamId,
    'HomeTeamScore': _HomeTeamScore,
    'AwayTeamScore': _AwayTeamScore,
    'TotalScore': _TotalScore,
    'HomeRotationNumber': _HomeRotationNumber,
    'AwayRotationNumber': _AwayRotationNumber,
    'PregameOdds': _PregameOdds,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<NBAPregameOddsModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<NBAPregameOddsModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final GAMEID = amplify_core.QueryField(fieldName: "GameId");
  static final SEASON = amplify_core.QueryField(fieldName: "Season");
  static final SEASONTYPE = amplify_core.QueryField(fieldName: "SeasonType");
  static final DAY = amplify_core.QueryField(fieldName: "Day");
  static final DATETIME = amplify_core.QueryField(fieldName: "DateTime");
  static final STATUS = amplify_core.QueryField(fieldName: "Status");
  static final AWAYTEAMID = amplify_core.QueryField(fieldName: "AwayTeamId");
  static final HOMETEAMID = amplify_core.QueryField(fieldName: "HomeTeamId");
  static final AWAYTEAMNAME = amplify_core.QueryField(fieldName: "AwayTeamName");
  static final HOMETEAMNAME = amplify_core.QueryField(fieldName: "HomeTeamName");
  static final GLOBALGAMEID = amplify_core.QueryField(fieldName: "GlobalGameId");
  static final GLOBALAWAYTEAMID = amplify_core.QueryField(fieldName: "GlobalAwayTeamId");
  static final GLOBALHOMETEAMID = amplify_core.QueryField(fieldName: "GlobalHomeTeamId");
  static final HOMETEAMSCORE = amplify_core.QueryField(fieldName: "HomeTeamScore");
  static final AWAYTEAMSCORE = amplify_core.QueryField(fieldName: "AwayTeamScore");
  static final TOTALSCORE = amplify_core.QueryField(fieldName: "TotalScore");
  static final HOMEROTATIONNUMBER = amplify_core.QueryField(fieldName: "HomeRotationNumber");
  static final AWAYROTATIONNUMBER = amplify_core.QueryField(fieldName: "AwayRotationNumber");
  static final PREGAMEODDS = amplify_core.QueryField(fieldName: "PregameOdds");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "NBAPregameOdds";
    modelSchemaDefinition.pluralName = "NBAPregameOdds";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.GAMEID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.SEASON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.SEASONTYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.DAY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.DATETIME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.STATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.AWAYTEAMID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.HOMETEAMID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.AWAYTEAMNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.HOMETEAMNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.GLOBALGAMEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.GLOBALAWAYTEAMID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.GLOBALHOMETEAMID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.HOMETEAMSCORE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.AWAYTEAMSCORE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.TOTALSCORE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.HOMEROTATIONNUMBER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.AWAYROTATIONNUMBER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NBAPregameOdds.PREGAMEODDS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _NBAPregameOddsModelType extends amplify_core.ModelType<NBAPregameOdds> {
  const _NBAPregameOddsModelType();
  
  @override
  NBAPregameOdds fromJson(Map<String, dynamic> jsonData) {
    return NBAPregameOdds.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'NBAPregameOdds';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [NBAPregameOdds] in your schema.
 */
class NBAPregameOddsModelIdentifier implements amplify_core.ModelIdentifier<NBAPregameOdds> {
  final String id;

  /** Create an instance of NBAPregameOddsModelIdentifier using [id] the primary key. */
  const NBAPregameOddsModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'NBAPregameOddsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is NBAPregameOddsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}