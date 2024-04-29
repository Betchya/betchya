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

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the NBAPregameOddsConnection type in your schema. */
class NBAPregameOddsConnection {
  final List<NBAPregameOdds>? _items;
  final String? _nextToken;

  List<NBAPregameOdds>? get items {
    return _items;
  }
  
  String? get nextToken {
    return _nextToken;
  }
  
  const NBAPregameOddsConnection._internal({items, nextToken}): _items = items, _nextToken = nextToken;
  
  factory NBAPregameOddsConnection({List<NBAPregameOdds>? items, String? nextToken}) {
    return NBAPregameOddsConnection._internal(
      items: items != null ? List<NBAPregameOdds>.unmodifiable(items) : items,
      nextToken: nextToken);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NBAPregameOddsConnection &&
      DeepCollectionEquality().equals(_items, other._items) &&
      _nextToken == other._nextToken;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("NBAPregameOddsConnection {");
    buffer.write("items=" + (_items != null ? _items!.toString() : "null") + ", ");
    buffer.write("nextToken=" + "$_nextToken");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  NBAPregameOddsConnection copyWith({List<NBAPregameOdds>? items, String? nextToken}) {
    return NBAPregameOddsConnection._internal(
      items: items ?? this.items,
      nextToken: nextToken ?? this.nextToken);
  }
  
  NBAPregameOddsConnection copyWithModelFieldValues({
    ModelFieldValue<List<NBAPregameOdds>?>? items,
    ModelFieldValue<String?>? nextToken
  }) {
    return NBAPregameOddsConnection._internal(
      items: items == null ? this.items : items.value,
      nextToken: nextToken == null ? this.nextToken : nextToken.value
    );
  }
  
  NBAPregameOddsConnection.fromJson(Map<String, dynamic> json)  
    : _items = json['items'] is List
        ? (json['items'] as List)
          .where((e) => e != null)
          .map((e) => NBAPregameOdds.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _nextToken = json['nextToken'];
  
  Map<String, dynamic> toJson() => {
    'items': _items?.map((NBAPregameOdds? e) => e?.toJson()).toList(), 'nextToken': _nextToken
  };
  
  Map<String, Object?> toMap() => {
    'items': _items,
    'nextToken': _nextToken
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "NBAPregameOddsConnection";
    modelSchemaDefinition.pluralName = "NBAPregameOddsConnections";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'items',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'NBAPregameOdds')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'nextToken',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}