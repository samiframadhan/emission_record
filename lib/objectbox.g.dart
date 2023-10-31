// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'models/model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 1536435249195024182),
      name: 'Component',
      lastPropertyId: const IdUid(5, 1629191883910263409),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3451507303599015882),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3219571481630077250),
            name: 'componentName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6832134431919861750),
            name: 'status',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1543734897873812623),
            name: 'firstReportedLeak',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1629191883910263409),
            name: 'ownerId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 620513058735284204),
            relationTarget: 'Owner')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 3633541853833259564),
      name: 'Owner',
      lastPropertyId: const IdUid(2, 8608922729328637478),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4915546440195292139),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8608922729328637478),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Store openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) =>
    Store(getObjectBoxModel(),
        directory: directory,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 3633541853833259564),
      lastIndexId: const IdUid(1, 620513058735284204),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Component: EntityDefinition<Component>(
        model: _entities[0],
        toOneRelations: (Component object) => [object.owner],
        toManyRelations: (Component object) => {},
        getId: (Component object) => object.id,
        setId: (Component object, int id) {
          object.id = id;
        },
        objectToFB: (Component object, fb.Builder fbb) {
          final componentNameOffset = fbb.writeString(object.componentName);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, componentNameOffset);
          fbb.addBool(2, object.status);
          fbb.addInt64(3, object.firstReportedLeak?.millisecondsSinceEpoch);
          fbb.addInt64(4, object.owner.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final firstReportedLeakValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 10);
          final object = Component(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              status:
                  const fb.BoolReader().vTableGet(buffer, rootOffset, 8, false))
            ..firstReportedLeak = firstReportedLeakValue == null
                ? null
                : DateTime.fromMillisecondsSinceEpoch(firstReportedLeakValue);
          object.owner.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          object.owner.attach(store);
          return object;
        }),
    Owner: EntityDefinition<Owner>(
        model: _entities[1],
        toOneRelations: (Owner object) => [],
        toManyRelations: (Owner object) => {},
        getId: (Owner object) => object.id,
        setId: (Owner object, int id) {
          object.id = id;
        },
        objectToFB: (Owner object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Owner(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Component] entity fields to define ObjectBox queries.
class Component_ {
  /// see [Component.id]
  static final id = QueryIntegerProperty<Component>(_entities[0].properties[0]);

  /// see [Component.componentName]
  static final componentName =
      QueryStringProperty<Component>(_entities[0].properties[1]);

  /// see [Component.status]
  static final status =
      QueryBooleanProperty<Component>(_entities[0].properties[2]);

  /// see [Component.firstReportedLeak]
  static final firstReportedLeak =
      QueryIntegerProperty<Component>(_entities[0].properties[3]);

  /// see [Component.owner]
  static final owner =
      QueryRelationToOne<Component, Owner>(_entities[0].properties[4]);
}

/// [Owner] entity fields to define ObjectBox queries.
class Owner_ {
  /// see [Owner.id]
  static final id = QueryIntegerProperty<Owner>(_entities[1].properties[0]);

  /// see [Owner.name]
  static final name = QueryStringProperty<Owner>(_entities[1].properties[1]);
}