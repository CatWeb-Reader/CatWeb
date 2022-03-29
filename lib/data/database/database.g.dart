// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class WebTableData extends DataClass implements Insertable<WebTableData> {
  final int id;
  final String uuid;
  final Uint8List blueprint;
  final Uint8List env;
  final Uint8List favicon;
  final int lastOpen;
  WebTableData(
      {required this.id,
      required this.uuid,
      required this.blueprint,
      required this.env,
      required this.favicon,
      required this.lastOpen});
  factory WebTableData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return WebTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      blueprint: const BlobType()
          .mapFromDatabaseResponse(data['${effectivePrefix}blueprint'])!,
      env: const BlobType()
          .mapFromDatabaseResponse(data['${effectivePrefix}env'])!,
      favicon: const BlobType()
          .mapFromDatabaseResponse(data['${effectivePrefix}favicon'])!,
      lastOpen: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_open'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['blueprint'] = Variable<Uint8List>(blueprint);
    map['env'] = Variable<Uint8List>(env);
    map['favicon'] = Variable<Uint8List>(favicon);
    map['last_open'] = Variable<int>(lastOpen);
    return map;
  }

  WebTableCompanion toCompanion(bool nullToAbsent) {
    return WebTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      blueprint: Value(blueprint),
      env: Value(env),
      favicon: Value(favicon),
      lastOpen: Value(lastOpen),
    );
  }

  factory WebTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WebTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      blueprint: serializer.fromJson<Uint8List>(json['blueprint']),
      env: serializer.fromJson<Uint8List>(json['env']),
      favicon: serializer.fromJson<Uint8List>(json['favicon']),
      lastOpen: serializer.fromJson<int>(json['lastOpen']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'blueprint': serializer.toJson<Uint8List>(blueprint),
      'env': serializer.toJson<Uint8List>(env),
      'favicon': serializer.toJson<Uint8List>(favicon),
      'lastOpen': serializer.toJson<int>(lastOpen),
    };
  }

  WebTableData copyWith(
          {int? id,
          String? uuid,
          Uint8List? blueprint,
          Uint8List? env,
          Uint8List? favicon,
          int? lastOpen}) =>
      WebTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        blueprint: blueprint ?? this.blueprint,
        env: env ?? this.env,
        favicon: favicon ?? this.favicon,
        lastOpen: lastOpen ?? this.lastOpen,
      );
  @override
  String toString() {
    return (StringBuffer('WebTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('blueprint: $blueprint, ')
          ..write('env: $env, ')
          ..write('favicon: $favicon, ')
          ..write('lastOpen: $lastOpen')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, blueprint, env, favicon, lastOpen);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WebTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.blueprint == this.blueprint &&
          other.env == this.env &&
          other.favicon == this.favicon &&
          other.lastOpen == this.lastOpen);
}

class WebTableCompanion extends UpdateCompanion<WebTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<Uint8List> blueprint;
  final Value<Uint8List> env;
  final Value<Uint8List> favicon;
  final Value<int> lastOpen;
  const WebTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.blueprint = const Value.absent(),
    this.env = const Value.absent(),
    this.favicon = const Value.absent(),
    this.lastOpen = const Value.absent(),
  });
  WebTableCompanion.insert({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    required Uint8List blueprint,
    required Uint8List env,
    this.favicon = const Value.absent(),
    this.lastOpen = const Value.absent(),
  })  : blueprint = Value(blueprint),
        env = Value(env);
  static Insertable<WebTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<Uint8List>? blueprint,
    Expression<Uint8List>? env,
    Expression<Uint8List>? favicon,
    Expression<int>? lastOpen,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (blueprint != null) 'blueprint': blueprint,
      if (env != null) 'env': env,
      if (favicon != null) 'favicon': favicon,
      if (lastOpen != null) 'last_open': lastOpen,
    });
  }

  WebTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<Uint8List>? blueprint,
      Value<Uint8List>? env,
      Value<Uint8List>? favicon,
      Value<int>? lastOpen}) {
    return WebTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      blueprint: blueprint ?? this.blueprint,
      env: env ?? this.env,
      favicon: favicon ?? this.favicon,
      lastOpen: lastOpen ?? this.lastOpen,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (blueprint.present) {
      map['blueprint'] = Variable<Uint8List>(blueprint.value);
    }
    if (env.present) {
      map['env'] = Variable<Uint8List>(env.value);
    }
    if (favicon.present) {
      map['favicon'] = Variable<Uint8List>(favicon.value);
    }
    if (lastOpen.present) {
      map['last_open'] = Variable<int>(lastOpen.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WebTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('blueprint: $blueprint, ')
          ..write('env: $env, ')
          ..write('favicon: $favicon, ')
          ..write('lastOpen: $lastOpen')
          ..write(')'))
        .toString();
  }
}

class $WebTableTable extends WebTable
    with TableInfo<$WebTableTable, WebTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WebTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String?> uuid = GeneratedColumn<String?>(
      'uuid', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4().toString());
  final VerificationMeta _blueprintMeta = const VerificationMeta('blueprint');
  @override
  late final GeneratedColumn<Uint8List?> blueprint =
      GeneratedColumn<Uint8List?>('blueprint', aliasedName, false,
          type: const BlobType(), requiredDuringInsert: true);
  final VerificationMeta _envMeta = const VerificationMeta('env');
  @override
  late final GeneratedColumn<Uint8List?> env = GeneratedColumn<Uint8List?>(
      'env', aliasedName, false,
      type: const BlobType(), requiredDuringInsert: true);
  final VerificationMeta _faviconMeta = const VerificationMeta('favicon');
  @override
  late final GeneratedColumn<Uint8List?> favicon = GeneratedColumn<Uint8List?>(
      'favicon', aliasedName, false,
      type: const BlobType(),
      requiredDuringInsert: false,
      clientDefault: () => Uint8List.fromList([]));
  final VerificationMeta _lastOpenMeta = const VerificationMeta('lastOpen');
  @override
  late final GeneratedColumn<int?> lastOpen = GeneratedColumn<int?>(
      'last_open', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now().millisecond);
  @override
  List<GeneratedColumn> get $columns =>
      [id, uuid, blueprint, env, favicon, lastOpen];
  @override
  String get aliasedName => _alias ?? 'web_table';
  @override
  String get actualTableName => 'web_table';
  @override
  VerificationContext validateIntegrity(Insertable<WebTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    }
    if (data.containsKey('blueprint')) {
      context.handle(_blueprintMeta,
          blueprint.isAcceptableOrUnknown(data['blueprint']!, _blueprintMeta));
    } else if (isInserting) {
      context.missing(_blueprintMeta);
    }
    if (data.containsKey('env')) {
      context.handle(
          _envMeta, env.isAcceptableOrUnknown(data['env']!, _envMeta));
    } else if (isInserting) {
      context.missing(_envMeta);
    }
    if (data.containsKey('favicon')) {
      context.handle(_faviconMeta,
          favicon.isAcceptableOrUnknown(data['favicon']!, _faviconMeta));
    }
    if (data.containsKey('last_open')) {
      context.handle(_lastOpenMeta,
          lastOpen.isAcceptableOrUnknown(data['last_open']!, _lastOpenMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WebTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return WebTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $WebTableTable createAlias(String alias) {
    return $WebTableTable(attachedDatabase, alias);
  }
}

class ReaderHistoryTableData extends DataClass
    implements Insertable<ReaderHistoryTableData> {
  final int id;
  final String uuid;
  final String idCode;
  final int pageIndex;
  ReaderHistoryTableData(
      {required this.id,
      required this.uuid,
      required this.idCode,
      required this.pageIndex});
  factory ReaderHistoryTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ReaderHistoryTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      idCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_code'])!,
      pageIndex: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}page_index'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['id_code'] = Variable<String>(idCode);
    map['page_index'] = Variable<int>(pageIndex);
    return map;
  }

  ReaderHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return ReaderHistoryTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      idCode: Value(idCode),
      pageIndex: Value(pageIndex),
    );
  }

  factory ReaderHistoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReaderHistoryTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      idCode: serializer.fromJson<String>(json['idCode']),
      pageIndex: serializer.fromJson<int>(json['pageIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'idCode': serializer.toJson<String>(idCode),
      'pageIndex': serializer.toJson<int>(pageIndex),
    };
  }

  ReaderHistoryTableData copyWith(
          {int? id, String? uuid, String? idCode, int? pageIndex}) =>
      ReaderHistoryTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        idCode: idCode ?? this.idCode,
        pageIndex: pageIndex ?? this.pageIndex,
      );
  @override
  String toString() {
    return (StringBuffer('ReaderHistoryTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('idCode: $idCode, ')
          ..write('pageIndex: $pageIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, idCode, pageIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReaderHistoryTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.idCode == this.idCode &&
          other.pageIndex == this.pageIndex);
}

class ReaderHistoryTableCompanion
    extends UpdateCompanion<ReaderHistoryTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> idCode;
  final Value<int> pageIndex;
  const ReaderHistoryTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.idCode = const Value.absent(),
    this.pageIndex = const Value.absent(),
  });
  ReaderHistoryTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String idCode,
    required int pageIndex,
  })  : uuid = Value(uuid),
        idCode = Value(idCode),
        pageIndex = Value(pageIndex);
  static Insertable<ReaderHistoryTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? idCode,
    Expression<int>? pageIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (idCode != null) 'id_code': idCode,
      if (pageIndex != null) 'page_index': pageIndex,
    });
  }

  ReaderHistoryTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? idCode,
      Value<int>? pageIndex}) {
    return ReaderHistoryTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      idCode: idCode ?? this.idCode,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (idCode.present) {
      map['id_code'] = Variable<String>(idCode.value);
    }
    if (pageIndex.present) {
      map['page_index'] = Variable<int>(pageIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReaderHistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('idCode: $idCode, ')
          ..write('pageIndex: $pageIndex')
          ..write(')'))
        .toString();
  }
}

class $ReaderHistoryTableTable extends ReaderHistoryTable
    with TableInfo<$ReaderHistoryTableTable, ReaderHistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReaderHistoryTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String?> uuid = GeneratedColumn<String?>(
      'uuid', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _idCodeMeta = const VerificationMeta('idCode');
  @override
  late final GeneratedColumn<String?> idCode = GeneratedColumn<String?>(
      'id_code', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _pageIndexMeta = const VerificationMeta('pageIndex');
  @override
  late final GeneratedColumn<int?> pageIndex = GeneratedColumn<int?>(
      'page_index', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, uuid, idCode, pageIndex];
  @override
  String get aliasedName => _alias ?? 'reader_history_table';
  @override
  String get actualTableName => 'reader_history_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReaderHistoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('id_code')) {
      context.handle(_idCodeMeta,
          idCode.isAcceptableOrUnknown(data['id_code']!, _idCodeMeta));
    } else if (isInserting) {
      context.missing(_idCodeMeta);
    }
    if (data.containsKey('page_index')) {
      context.handle(_pageIndexMeta,
          pageIndex.isAcceptableOrUnknown(data['page_index']!, _pageIndexMeta));
    } else if (isInserting) {
      context.missing(_pageIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReaderHistoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ReaderHistoryTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ReaderHistoryTableTable createAlias(String alias) {
    return $ReaderHistoryTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDataBase extends GeneratedDatabase {
  _$AppDataBase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $WebTableTable webTable = $WebTableTable(this);
  late final $ReaderHistoryTableTable readerHistoryTable =
      $ReaderHistoryTableTable(this);
  late final WebDao webDao = WebDao(this as AppDataBase);
  late final ReaderHistoryDao readerHistoryDao =
      ReaderHistoryDao(this as AppDataBase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [webTable, readerHistoryTable];
}
