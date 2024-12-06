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

class $AttachmentLocalModelTable extends AttachmentLocalModel
    with TableInfo<$AttachmentLocalModelTable, AttachmentLocal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttachmentLocalModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _attachmentIdMeta =
      const VerificationMeta('attachmentId');
  @override
  late final GeneratedColumn<int> attachmentId = GeneratedColumn<int>(
      'attachment_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<double> size = GeneratedColumn<double>(
      'size', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _attachmentMeta =
      const VerificationMeta('attachment');
  @override
  late final GeneratedColumn<Uint8List> attachment = GeneratedColumn<Uint8List>(
      'attachment', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, attachmentId, type, size, attachment];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attachment_local_model';
  @override
  VerificationContext validateIntegrity(Insertable<AttachmentLocal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('attachment_id')) {
      context.handle(
          _attachmentIdMeta,
          attachmentId.isAcceptableOrUnknown(
              data['attachment_id']!, _attachmentIdMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    }
    if (data.containsKey('attachment')) {
      context.handle(
          _attachmentMeta,
          attachment.isAcceptableOrUnknown(
              data['attachment']!, _attachmentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttachmentLocal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttachmentLocal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      attachmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attachment_id']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      size: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}size']),
      attachment: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}attachment']),
    );
  }

  @override
  $AttachmentLocalModelTable createAlias(String alias) {
    return $AttachmentLocalModelTable(attachedDatabase, alias);
  }
}

class AttachmentLocal extends DataClass implements Insertable<AttachmentLocal> {
  final int id;
  final int? attachmentId;
  final String? type;
  final double? size;
  final Uint8List? attachment;
  const AttachmentLocal(
      {required this.id,
      this.attachmentId,
      this.type,
      this.size,
      this.attachment});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || attachmentId != null) {
      map['attachment_id'] = Variable<int>(attachmentId);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || size != null) {
      map['size'] = Variable<double>(size);
    }
    if (!nullToAbsent || attachment != null) {
      map['attachment'] = Variable<Uint8List>(attachment);
    }
    return map;
  }

  AttachmentLocalModelCompanion toCompanion(bool nullToAbsent) {
    return AttachmentLocalModelCompanion(
      id: Value(id),
      attachmentId: attachmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(attachmentId),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
      attachment: attachment == null && nullToAbsent
          ? const Value.absent()
          : Value(attachment),
    );
  }

  factory AttachmentLocal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttachmentLocal(
      id: serializer.fromJson<int>(json['id']),
      attachmentId: serializer.fromJson<int?>(json['attachmentId']),
      type: serializer.fromJson<String?>(json['type']),
      size: serializer.fromJson<double?>(json['size']),
      attachment: serializer.fromJson<Uint8List?>(json['attachment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'attachmentId': serializer.toJson<int?>(attachmentId),
      'type': serializer.toJson<String?>(type),
      'size': serializer.toJson<double?>(size),
      'attachment': serializer.toJson<Uint8List?>(attachment),
    };
  }

  AttachmentLocal copyWith(
          {int? id,
          Value<int?> attachmentId = const Value.absent(),
          Value<String?> type = const Value.absent(),
          Value<double?> size = const Value.absent(),
          Value<Uint8List?> attachment = const Value.absent()}) =>
      AttachmentLocal(
        id: id ?? this.id,
        attachmentId:
            attachmentId.present ? attachmentId.value : this.attachmentId,
        type: type.present ? type.value : this.type,
        size: size.present ? size.value : this.size,
        attachment: attachment.present ? attachment.value : this.attachment,
      );
  AttachmentLocal copyWithCompanion(AttachmentLocalModelCompanion data) {
    return AttachmentLocal(
      id: data.id.present ? data.id.value : this.id,
      attachmentId: data.attachmentId.present
          ? data.attachmentId.value
          : this.attachmentId,
      type: data.type.present ? data.type.value : this.type,
      size: data.size.present ? data.size.value : this.size,
      attachment:
          data.attachment.present ? data.attachment.value : this.attachment,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentLocal(')
          ..write('id: $id, ')
          ..write('attachmentId: $attachmentId, ')
          ..write('type: $type, ')
          ..write('size: $size, ')
          ..write('attachment: $attachment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, attachmentId, type, size, $driftBlobEquality.hash(attachment));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttachmentLocal &&
          other.id == this.id &&
          other.attachmentId == this.attachmentId &&
          other.type == this.type &&
          other.size == this.size &&
          $driftBlobEquality.equals(other.attachment, this.attachment));
}

class AttachmentLocalModelCompanion extends UpdateCompanion<AttachmentLocal> {
  final Value<int> id;
  final Value<int?> attachmentId;
  final Value<String?> type;
  final Value<double?> size;
  final Value<Uint8List?> attachment;
  const AttachmentLocalModelCompanion({
    this.id = const Value.absent(),
    this.attachmentId = const Value.absent(),
    this.type = const Value.absent(),
    this.size = const Value.absent(),
    this.attachment = const Value.absent(),
  });
  AttachmentLocalModelCompanion.insert({
    this.id = const Value.absent(),
    this.attachmentId = const Value.absent(),
    this.type = const Value.absent(),
    this.size = const Value.absent(),
    this.attachment = const Value.absent(),
  });
  static Insertable<AttachmentLocal> custom({
    Expression<int>? id,
    Expression<int>? attachmentId,
    Expression<String>? type,
    Expression<double>? size,
    Expression<Uint8List>? attachment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (attachmentId != null) 'attachment_id': attachmentId,
      if (type != null) 'type': type,
      if (size != null) 'size': size,
      if (attachment != null) 'attachment': attachment,
    });
  }

  AttachmentLocalModelCompanion copyWith(
      {Value<int>? id,
      Value<int?>? attachmentId,
      Value<String?>? type,
      Value<double?>? size,
      Value<Uint8List?>? attachment}) {
    return AttachmentLocalModelCompanion(
      id: id ?? this.id,
      attachmentId: attachmentId ?? this.attachmentId,
      type: type ?? this.type,
      size: size ?? this.size,
      attachment: attachment ?? this.attachment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (attachmentId.present) {
      map['attachment_id'] = Variable<int>(attachmentId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (size.present) {
      map['size'] = Variable<double>(size.value);
    }
    if (attachment.present) {
      map['attachment'] = Variable<Uint8List>(attachment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentLocalModelCompanion(')
          ..write('id: $id, ')
          ..write('attachmentId: $attachmentId, ')
          ..write('type: $type, ')
          ..write('size: $size, ')
          ..write('attachment: $attachment')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $UserLocalModelTable userLocalModel = $UserLocalModelTable(this);
  late final $AttachmentLocalModelTable attachmentLocalModel =
      $AttachmentLocalModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userLocalModel, attachmentLocalModel];
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
typedef $$AttachmentLocalModelTableCreateCompanionBuilder
    = AttachmentLocalModelCompanion Function({
  Value<int> id,
  Value<int?> attachmentId,
  Value<String?> type,
  Value<double?> size,
  Value<Uint8List?> attachment,
});
typedef $$AttachmentLocalModelTableUpdateCompanionBuilder
    = AttachmentLocalModelCompanion Function({
  Value<int> id,
  Value<int?> attachmentId,
  Value<String?> type,
  Value<double?> size,
  Value<Uint8List?> attachment,
});

class $$AttachmentLocalModelTableFilterComposer
    extends Composer<_$LocalDatabase, $AttachmentLocalModelTable> {
  $$AttachmentLocalModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attachmentId => $composableBuilder(
      column: $table.attachmentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get size => $composableBuilder(
      column: $table.size, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get attachment => $composableBuilder(
      column: $table.attachment, builder: (column) => ColumnFilters(column));
}

class $$AttachmentLocalModelTableOrderingComposer
    extends Composer<_$LocalDatabase, $AttachmentLocalModelTable> {
  $$AttachmentLocalModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attachmentId => $composableBuilder(
      column: $table.attachmentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get size => $composableBuilder(
      column: $table.size, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get attachment => $composableBuilder(
      column: $table.attachment, builder: (column) => ColumnOrderings(column));
}

class $$AttachmentLocalModelTableAnnotationComposer
    extends Composer<_$LocalDatabase, $AttachmentLocalModelTable> {
  $$AttachmentLocalModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get attachmentId => $composableBuilder(
      column: $table.attachmentId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<Uint8List> get attachment => $composableBuilder(
      column: $table.attachment, builder: (column) => column);
}

class $$AttachmentLocalModelTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $AttachmentLocalModelTable,
    AttachmentLocal,
    $$AttachmentLocalModelTableFilterComposer,
    $$AttachmentLocalModelTableOrderingComposer,
    $$AttachmentLocalModelTableAnnotationComposer,
    $$AttachmentLocalModelTableCreateCompanionBuilder,
    $$AttachmentLocalModelTableUpdateCompanionBuilder,
    (
      AttachmentLocal,
      BaseReferences<_$LocalDatabase, $AttachmentLocalModelTable,
          AttachmentLocal>
    ),
    AttachmentLocal,
    PrefetchHooks Function()> {
  $$AttachmentLocalModelTableTableManager(
      _$LocalDatabase db, $AttachmentLocalModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttachmentLocalModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttachmentLocalModelTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttachmentLocalModelTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> attachmentId = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<double?> size = const Value.absent(),
            Value<Uint8List?> attachment = const Value.absent(),
          }) =>
              AttachmentLocalModelCompanion(
            id: id,
            attachmentId: attachmentId,
            type: type,
            size: size,
            attachment: attachment,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> attachmentId = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<double?> size = const Value.absent(),
            Value<Uint8List?> attachment = const Value.absent(),
          }) =>
              AttachmentLocalModelCompanion.insert(
            id: id,
            attachmentId: attachmentId,
            type: type,
            size: size,
            attachment: attachment,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AttachmentLocalModelTableProcessedTableManager
    = ProcessedTableManager<
        _$LocalDatabase,
        $AttachmentLocalModelTable,
        AttachmentLocal,
        $$AttachmentLocalModelTableFilterComposer,
        $$AttachmentLocalModelTableOrderingComposer,
        $$AttachmentLocalModelTableAnnotationComposer,
        $$AttachmentLocalModelTableCreateCompanionBuilder,
        $$AttachmentLocalModelTableUpdateCompanionBuilder,
        (
          AttachmentLocal,
          BaseReferences<_$LocalDatabase, $AttachmentLocalModelTable,
              AttachmentLocal>
        ),
        AttachmentLocal,
        PrefetchHooks Function()>;

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$UserLocalModelTableTableManager get userLocalModel =>
      $$UserLocalModelTableTableManager(_db, _db.userLocalModel);
  $$AttachmentLocalModelTableTableManager get attachmentLocalModel =>
      $$AttachmentLocalModelTableTableManager(_db, _db.attachmentLocalModel);
}
