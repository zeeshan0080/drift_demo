// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// ignore_for_file: type=lint
class $UserLocalModelTable extends UserLocalModel
    with TableInfo<$UserLocalModelTable, UserLocal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserLocalModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isVerifiedMeta =
      const VerificationMeta('isVerified');
  @override
  late final GeneratedColumn<bool> isVerified = GeneratedColumn<bool>(
      'is_verified', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_verified" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, firstName, lastName, email, age, isVerified];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_local_model';
  @override
  VerificationContext validateIntegrity(Insertable<UserLocal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    }
    if (data.containsKey('is_verified')) {
      context.handle(
          _isVerifiedMeta,
          isVerified.isAcceptableOrUnknown(
              data['is_verified']!, _isVerifiedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserLocal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserLocal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age']),
      isVerified: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_verified'])!,
    );
  }

  @override
  $UserLocalModelTable createAlias(String alias) {
    return $UserLocalModelTable(attachedDatabase, alias);
  }
}

class UserLocal extends DataClass implements Insertable<UserLocal> {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? age;
  final bool isVerified;
  const UserLocal(
      {required this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.age,
      required this.isVerified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    map['is_verified'] = Variable<bool>(isVerified);
    return map;
  }

  UserLocalModelCompanion toCompanion(bool nullToAbsent) {
    return UserLocalModelCompanion(
      id: Value(id),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      isVerified: Value(isVerified),
    );
  }

  factory UserLocal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserLocal(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      email: serializer.fromJson<String?>(json['email']),
      age: serializer.fromJson<int?>(json['age']),
      isVerified: serializer.fromJson<bool>(json['isVerified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'email': serializer.toJson<String?>(email),
      'age': serializer.toJson<int?>(age),
      'isVerified': serializer.toJson<bool>(isVerified),
    };
  }

  UserLocal copyWith(
          {int? id,
          Value<String?> firstName = const Value.absent(),
          Value<String?> lastName = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<int?> age = const Value.absent(),
          bool? isVerified}) =>
      UserLocal(
        id: id ?? this.id,
        firstName: firstName.present ? firstName.value : this.firstName,
        lastName: lastName.present ? lastName.value : this.lastName,
        email: email.present ? email.value : this.email,
        age: age.present ? age.value : this.age,
        isVerified: isVerified ?? this.isVerified,
      );
  UserLocal copyWithCompanion(UserLocalModelCompanion data) {
    return UserLocal(
      id: data.id.present ? data.id.value : this.id,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      email: data.email.present ? data.email.value : this.email,
      age: data.age.present ? data.age.value : this.age,
      isVerified:
          data.isVerified.present ? data.isVerified.value : this.isVerified,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserLocal(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('age: $age, ')
          ..write('isVerified: $isVerified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, firstName, lastName, email, age, isVerified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserLocal &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.email == this.email &&
          other.age == this.age &&
          other.isVerified == this.isVerified);
}

class UserLocalModelCompanion extends UpdateCompanion<UserLocal> {
  final Value<int> id;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> email;
  final Value<int?> age;
  final Value<bool> isVerified;
  const UserLocalModelCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.age = const Value.absent(),
    this.isVerified = const Value.absent(),
  });
  UserLocalModelCompanion.insert({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.age = const Value.absent(),
    this.isVerified = const Value.absent(),
  });
  static Insertable<UserLocal> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? email,
    Expression<int>? age,
    Expression<bool>? isVerified,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (age != null) 'age': age,
      if (isVerified != null) 'is_verified': isVerified,
    });
  }

  UserLocalModelCompanion copyWith(
      {Value<int>? id,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? email,
      Value<int?>? age,
      Value<bool>? isVerified}) {
    return UserLocalModelCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      age: age ?? this.age,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (isVerified.present) {
      map['is_verified'] = Variable<bool>(isVerified.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserLocalModelCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('age: $age, ')
          ..write('isVerified: $isVerified')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $UserLocalModelTable userLocalModel = $UserLocalModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userLocalModel];
}

typedef $$UserLocalModelTableCreateCompanionBuilder = UserLocalModelCompanion
    Function({
  Value<int> id,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> email,
  Value<int?> age,
  Value<bool> isVerified,
});
typedef $$UserLocalModelTableUpdateCompanionBuilder = UserLocalModelCompanion
    Function({
  Value<int> id,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> email,
  Value<int?> age,
  Value<bool> isVerified,
});

class $$UserLocalModelTableFilterComposer
    extends Composer<_$LocalDatabase, $UserLocalModelTable> {
  $$UserLocalModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => ColumnFilters(column));
}

class $$UserLocalModelTableOrderingComposer
    extends Composer<_$LocalDatabase, $UserLocalModelTable> {
  $$UserLocalModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => ColumnOrderings(column));
}

class $$UserLocalModelTableAnnotationComposer
    extends Composer<_$LocalDatabase, $UserLocalModelTable> {
  $$UserLocalModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => column);
}

class $$UserLocalModelTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $UserLocalModelTable,
    UserLocal,
    $$UserLocalModelTableFilterComposer,
    $$UserLocalModelTableOrderingComposer,
    $$UserLocalModelTableAnnotationComposer,
    $$UserLocalModelTableCreateCompanionBuilder,
    $$UserLocalModelTableUpdateCompanionBuilder,
    (
      UserLocal,
      BaseReferences<_$LocalDatabase, $UserLocalModelTable, UserLocal>
    ),
    UserLocal,
    PrefetchHooks Function()> {
  $$UserLocalModelTableTableManager(
      _$LocalDatabase db, $UserLocalModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserLocalModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserLocalModelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserLocalModelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<int?> age = const Value.absent(),
            Value<bool> isVerified = const Value.absent(),
          }) =>
              UserLocalModelCompanion(
            id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            age: age,
            isVerified: isVerified,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<int?> age = const Value.absent(),
            Value<bool> isVerified = const Value.absent(),
          }) =>
              UserLocalModelCompanion.insert(
            id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            age: age,
            isVerified: isVerified,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserLocalModelTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $UserLocalModelTable,
    UserLocal,
    $$UserLocalModelTableFilterComposer,
    $$UserLocalModelTableOrderingComposer,
    $$UserLocalModelTableAnnotationComposer,
    $$UserLocalModelTableCreateCompanionBuilder,
    $$UserLocalModelTableUpdateCompanionBuilder,
    (
      UserLocal,
      BaseReferences<_$LocalDatabase, $UserLocalModelTable, UserLocal>
    ),
    UserLocal,
    PrefetchHooks Function()>;

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$UserLocalModelTableTableManager get userLocalModel =>
      $$UserLocalModelTableTableManager(_db, _db.userLocalModel);
}
