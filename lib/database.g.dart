// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DocumentsTable extends Documents
    with TableInfo<$DocumentsTable, Document> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
      'number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _signerMeta = const VerificationMeta('signer');
  @override
  late final GeneratedColumn<String> signer = GeneratedColumn<String>(
      'signer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _receiverMeta =
      const VerificationMeta('receiver');
  @override
  late final GeneratedColumn<String> receiver = GeneratedColumn<String>(
      'receiver', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<String> quantity = GeneratedColumn<String>(
      'quantity', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _keywordMeta =
      const VerificationMeta('keyword');
  @override
  late final GeneratedColumn<String> keyword = GeneratedColumn<String>(
      'keyword', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _boxIdMeta = const VerificationMeta('boxId');
  @override
  late final GeneratedColumn<String> boxId = GeneratedColumn<String>(
      'box_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _warehouseIdMeta =
      const VerificationMeta('warehouseId');
  @override
  late final GeneratedColumn<String> warehouseId = GeneratedColumn<String>(
      'warehouse_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        number,
        date,
        name,
        signer,
        receiver,
        quantity,
        note,
        keyword,
        boxId,
        warehouseId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'documents';
  @override
  VerificationContext validateIntegrity(Insertable<Document> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('signer')) {
      context.handle(_signerMeta,
          signer.isAcceptableOrUnknown(data['signer']!, _signerMeta));
    }
    if (data.containsKey('receiver')) {
      context.handle(_receiverMeta,
          receiver.isAcceptableOrUnknown(data['receiver']!, _receiverMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('keyword')) {
      context.handle(_keywordMeta,
          keyword.isAcceptableOrUnknown(data['keyword']!, _keywordMeta));
    }
    if (data.containsKey('box_id')) {
      context.handle(
          _boxIdMeta, boxId.isAcceptableOrUnknown(data['box_id']!, _boxIdMeta));
    }
    if (data.containsKey('warehouse_id')) {
      context.handle(
          _warehouseIdMeta,
          warehouseId.isAcceptableOrUnknown(
              data['warehouse_id']!, _warehouseIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Document map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Document(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      signer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}signer']),
      receiver: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receiver']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      keyword: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}keyword']),
      boxId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}box_id']),
      warehouseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}warehouse_id']),
    );
  }

  @override
  $DocumentsTable createAlias(String alias) {
    return $DocumentsTable(attachedDatabase, alias);
  }
}

class Document extends DataClass implements Insertable<Document> {
  final int id;
  final String number;
  final String? date;
  final String? name;
  final String? signer;
  final String? receiver;
  final int? quantity;
  final String? note;
  final String? keyword;
  final String? boxId;
  final String? warehouseId;
  const Document(
      {required this.id,
      required this.number,
      this.date,
      this.name,
      this.signer,
      this.receiver,
      this.quantity,
      this.note,
      this.keyword,
      this.boxId,
      this.warehouseId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['number'] = Variable<String>(number);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || signer != null) {
      map['signer'] = Variable<String>(signer);
    }
    if (!nullToAbsent || receiver != null) {
      map['receiver'] = Variable<String>(receiver);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || keyword != null) {
      map['keyword'] = Variable<String>(keyword);
    }
    if (!nullToAbsent || boxId != null) {
      map['box_id'] = Variable<String>(boxId);
    }
    if (!nullToAbsent || warehouseId != null) {
      map['warehouse_id'] = Variable<String>(warehouseId);
    }
    return map;
  }

  DocumentsCompanion toCompanion(bool nullToAbsent) {
    return DocumentsCompanion(
      id: Value(id),
      number: Value(number),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      signer:
          signer == null && nullToAbsent ? const Value.absent() : Value(signer),
      receiver: receiver == null && nullToAbsent
          ? const Value.absent()
          : Value(receiver),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      keyword: keyword == null && nullToAbsent
          ? const Value.absent()
          : Value(keyword),
      boxId:
          boxId == null && nullToAbsent ? const Value.absent() : Value(boxId),
      warehouseId: warehouseId == null && nullToAbsent
          ? const Value.absent()
          : Value(warehouseId),
    );
  }

  factory Document.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Document(
      id: serializer.fromJson<int>(json['id']),
      number: serializer.fromJson<String>(json['number']),
      date: serializer.fromJson<String?>(json['date']),
      name: serializer.fromJson<String?>(json['name']),
      signer: serializer.fromJson<String?>(json['signer']),
      receiver: serializer.fromJson<String?>(json['receiver']),
      quantity: serializer.fromJson<int?>(json['quantity']),
      note: serializer.fromJson<String?>(json['note']),
      keyword: serializer.fromJson<String?>(json['keyword']),
      boxId: serializer.fromJson<String?>(json['boxId']),
      warehouseId: serializer.fromJson<String?>(json['warehouseId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'number': serializer.toJson<String>(number),
      'date': serializer.toJson<String?>(date),
      'name': serializer.toJson<String?>(name),
      'signer': serializer.toJson<String?>(signer),
      'receiver': serializer.toJson<String?>(receiver),
      'quantity': serializer.toJson<int?>(quantity),
      'note': serializer.toJson<String?>(note),
      'keyword': serializer.toJson<String?>(keyword),
      'boxId': serializer.toJson<String?>(boxId),
      'warehouseId': serializer.toJson<String?>(warehouseId),
    };
  }

  Document copyWith(
          {int? id,
          String? number,
          Value<String?> date = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> signer = const Value.absent(),
          Value<String?> receiver = const Value.absent(),
          Value<int?> quantity = const Value.absent(),
          Value<String?> note = const Value.absent(),
          Value<String?> keyword = const Value.absent(),
          Value<String?> boxId = const Value.absent(),
          Value<String?> warehouseId = const Value.absent()}) =>
      Document(
        id: id ?? this.id,
        number: number ?? this.number,
        date: date.present ? date.value : this.date,
        name: name.present ? name.value : this.name,
        signer: signer.present ? signer.value : this.signer,
        receiver: receiver.present ? receiver.value : this.receiver,
        quantity: quantity.present ? quantity.value : this.quantity,
        note: note.present ? note.value : this.note,
        keyword: keyword.present ? keyword.value : this.keyword,
        boxId: boxId.present ? boxId.value : this.boxId,
        warehouseId: warehouseId.present ? warehouseId.value : this.warehouseId,
      );
  Document copyWithCompanion(DocumentsCompanion data) {
    return Document(
      id: data.id.present ? data.id.value : this.id,
      number: data.number.present ? data.number.value : this.number,
      date: data.date.present ? data.date.value : this.date,
      name: data.name.present ? data.name.value : this.name,
      signer: data.signer.present ? data.signer.value : this.signer,
      receiver: data.receiver.present ? data.receiver.value : this.receiver,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      note: data.note.present ? data.note.value : this.note,
      keyword: data.keyword.present ? data.keyword.value : this.keyword,
      boxId: data.boxId.present ? data.boxId.value : this.boxId,
      warehouseId:
          data.warehouseId.present ? data.warehouseId.value : this.warehouseId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Document(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('date: $date, ')
          ..write('name: $name, ')
          ..write('signer: $signer, ')
          ..write('receiver: $receiver, ')
          ..write('quantity: $quantity, ')
          ..write('note: $note, ')
          ..write('keyword: $keyword, ')
          ..write('boxId: $boxId, ')
          ..write('warehouseId: $warehouseId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, number, date, name, signer, receiver,
      quantity, note, keyword, boxId, warehouseId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Document &&
          other.id == this.id &&
          other.number == this.number &&
          other.date == this.date &&
          other.name == this.name &&
          other.signer == this.signer &&
          other.receiver == this.receiver &&
          other.quantity == this.quantity &&
          other.note == this.note &&
          other.keyword == this.keyword &&
          other.boxId == this.boxId &&
          other.warehouseId == this.warehouseId);
}

class DocumentsCompanion extends UpdateCompanion<Document> {
  final Value<int> id;
  final Value<String> number;
  final Value<String?> date;
  final Value<String?> name;
  final Value<String?> signer;
  final Value<String?> receiver;
  final Value<int?> quantity;
  final Value<String?> note;
  final Value<String?> keyword;
  final Value<String?> boxId;
  final Value<String?> warehouseId;
  const DocumentsCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.date = const Value.absent(),
    this.name = const Value.absent(),
    this.signer = const Value.absent(),
    this.receiver = const Value.absent(),
    this.quantity = const Value.absent(),
    this.note = const Value.absent(),
    this.keyword = const Value.absent(),
    this.boxId = const Value.absent(),
    this.warehouseId = const Value.absent(),
  });
  DocumentsCompanion.insert({
    this.id = const Value.absent(),
    required String number,
    this.date = const Value.absent(),
    this.name = const Value.absent(),
    this.signer = const Value.absent(),
    this.receiver = const Value.absent(),
    this.quantity = const Value.absent(),
    this.note = const Value.absent(),
    this.keyword = const Value.absent(),
    this.boxId = const Value.absent(),
    this.warehouseId = const Value.absent(),
  }) : number = Value(number);
  static Insertable<Document> custom({
    Expression<int>? id,
    Expression<String>? number,
    Expression<String>? date,
    Expression<String>? name,
    Expression<String>? signer,
    Expression<String>? receiver,
    Expression<int>? quantity,
    Expression<String>? note,
    Expression<String>? keyword,
    Expression<String>? boxId,
    Expression<String>? warehouseId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (number != null) 'number': number,
      if (date != null) 'date': date,
      if (name != null) 'name': name,
      if (signer != null) 'signer': signer,
      if (receiver != null) 'receiver': receiver,
      if (quantity != null) 'quantity': quantity,
      if (note != null) 'note': note,
      if (keyword != null) 'keyword': keyword,
      if (boxId != null) 'box_id': boxId,
      if (warehouseId != null) 'warehouse_id': warehouseId,
    });
  }

  DocumentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? number,
      Value<String?>? date,
      Value<String?>? name,
      Value<String?>? signer,
      Value<String?>? receiver,
      Value<int?>? quantity,
      Value<String?>? note,
      Value<String?>? keyword,
      Value<String?>? boxId,
      Value<String?>? warehouseId}) {
    return DocumentsCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
      date: date ?? this.date,
      name: name ?? this.name,
      signer: signer ?? this.signer,
      receiver: receiver ?? this.receiver,
      quantity: quantity ?? this.quantity,
      note: note ?? this.note,
      keyword: keyword ?? this.keyword,
      boxId: boxId ?? this.boxId,
      warehouseId: warehouseId ?? this.warehouseId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (signer.present) {
      map['signer'] = Variable<String>(signer.value);
    }
    if (receiver.present) {
      map['receiver'] = Variable<String>(receiver.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (keyword.present) {
      map['keyword'] = Variable<String>(keyword.value);
    }
    if (boxId.present) {
      map['box_id'] = Variable<String>(boxId.value);
    }
    if (warehouseId.present) {
      map['warehouse_id'] = Variable<String>(warehouseId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsCompanion(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('date: $date, ')
          ..write('name: $name, ')
          ..write('signer: $signer, ')
          ..write('receiver: $receiver, ')
          ..write('quantity: $quantity, ')
          ..write('note: $note, ')
          ..write('keyword: $keyword, ')
          ..write('boxId: $boxId, ')
          ..write('warehouseId: $warehouseId')
          ..write(')'))
        .toString();
  }
}

class $IncomingDispatchsTable extends IncomingDispatchs
    with TableInfo<$IncomingDispatchsTable, IncomingDispatch> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncomingDispatchsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _receiveDateMeta =
      const VerificationMeta('receiveDate');
  @override
  late final GeneratedColumn<String> receiveDate = GeneratedColumn<String>(
      'receive_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
      'number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _senderMeta = const VerificationMeta('sender');
  @override
  late final GeneratedColumn<String> sender = GeneratedColumn<String>(
      'sender', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _symNumberMeta =
      const VerificationMeta('symNumber');
  @override
  late final GeneratedColumn<String> symNumber = GeneratedColumn<String>(
      'sym_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _docDateMeta =
      const VerificationMeta('docDate');
  @override
  late final GeneratedColumn<String> docDate = GeneratedColumn<String>(
      'doc_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _receiverMeta =
      const VerificationMeta('receiver');
  @override
  late final GeneratedColumn<String> receiver = GeneratedColumn<String>(
      'receiver', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _boxIdMeta = const VerificationMeta('boxId');
  @override
  late final GeneratedColumn<String> boxId = GeneratedColumn<String>(
      'box_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _warehouseIdMeta =
      const VerificationMeta('warehouseId');
  @override
  late final GeneratedColumn<String> warehouseId = GeneratedColumn<String>(
      'warehouse_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        receiveDate,
        number,
        sender,
        symNumber,
        docDate,
        name,
        receiver,
        note,
        boxId,
        warehouseId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'incoming_dispatchs';
  @override
  VerificationContext validateIntegrity(Insertable<IncomingDispatch> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('receive_date')) {
      context.handle(
          _receiveDateMeta,
          receiveDate.isAcceptableOrUnknown(
              data['receive_date']!, _receiveDateMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    }
    if (data.containsKey('sender')) {
      context.handle(_senderMeta,
          sender.isAcceptableOrUnknown(data['sender']!, _senderMeta));
    }
    if (data.containsKey('sym_number')) {
      context.handle(_symNumberMeta,
          symNumber.isAcceptableOrUnknown(data['sym_number']!, _symNumberMeta));
    }
    if (data.containsKey('doc_date')) {
      context.handle(_docDateMeta,
          docDate.isAcceptableOrUnknown(data['doc_date']!, _docDateMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('receiver')) {
      context.handle(_receiverMeta,
          receiver.isAcceptableOrUnknown(data['receiver']!, _receiverMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('box_id')) {
      context.handle(
          _boxIdMeta, boxId.isAcceptableOrUnknown(data['box_id']!, _boxIdMeta));
    }
    if (data.containsKey('warehouse_id')) {
      context.handle(
          _warehouseIdMeta,
          warehouseId.isAcceptableOrUnknown(
              data['warehouse_id']!, _warehouseIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IncomingDispatch map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncomingDispatch(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      receiveDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receive_date']),
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number']),
      sender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sender']),
      symNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sym_number']),
      docDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doc_date']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      receiver: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receiver']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      boxId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}box_id']),
      warehouseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}warehouse_id']),
    );
  }

  @override
  $IncomingDispatchsTable createAlias(String alias) {
    return $IncomingDispatchsTable(attachedDatabase, alias);
  }
}

class IncomingDispatch extends DataClass
    implements Insertable<IncomingDispatch> {
  final int id;
  final String? receiveDate;
  final String? number;
  final String? sender;
  final String? symNumber;
  final String? docDate;
  final String? name;
  final String? receiver;
  final String? note;
  final String? boxId;
  final String? warehouseId;
  const IncomingDispatch(
      {required this.id,
      this.receiveDate,
      this.number,
      this.sender,
      this.symNumber,
      this.docDate,
      this.name,
      this.receiver,
      this.note,
      this.boxId,
      this.warehouseId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || receiveDate != null) {
      map['receive_date'] = Variable<String>(receiveDate);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<String>(number);
    }
    if (!nullToAbsent || sender != null) {
      map['sender'] = Variable<String>(sender);
    }
    if (!nullToAbsent || symNumber != null) {
      map['sym_number'] = Variable<String>(symNumber);
    }
    if (!nullToAbsent || docDate != null) {
      map['doc_date'] = Variable<String>(docDate);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || receiver != null) {
      map['receiver'] = Variable<String>(receiver);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || boxId != null) {
      map['box_id'] = Variable<String>(boxId);
    }
    if (!nullToAbsent || warehouseId != null) {
      map['warehouse_id'] = Variable<String>(warehouseId);
    }
    return map;
  }

  IncomingDispatchsCompanion toCompanion(bool nullToAbsent) {
    return IncomingDispatchsCompanion(
      id: Value(id),
      receiveDate: receiveDate == null && nullToAbsent
          ? const Value.absent()
          : Value(receiveDate),
      number:
          number == null && nullToAbsent ? const Value.absent() : Value(number),
      sender:
          sender == null && nullToAbsent ? const Value.absent() : Value(sender),
      symNumber: symNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(symNumber),
      docDate: docDate == null && nullToAbsent
          ? const Value.absent()
          : Value(docDate),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      receiver: receiver == null && nullToAbsent
          ? const Value.absent()
          : Value(receiver),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      boxId:
          boxId == null && nullToAbsent ? const Value.absent() : Value(boxId),
      warehouseId: warehouseId == null && nullToAbsent
          ? const Value.absent()
          : Value(warehouseId),
    );
  }

  factory IncomingDispatch.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncomingDispatch(
      id: serializer.fromJson<int>(json['id']),
      receiveDate: serializer.fromJson<String?>(json['receiveDate']),
      number: serializer.fromJson<String?>(json['number']),
      sender: serializer.fromJson<String?>(json['sender']),
      symNumber: serializer.fromJson<String?>(json['symNumber']),
      docDate: serializer.fromJson<String?>(json['docDate']),
      name: serializer.fromJson<String?>(json['name']),
      receiver: serializer.fromJson<String?>(json['receiver']),
      note: serializer.fromJson<String?>(json['note']),
      boxId: serializer.fromJson<String?>(json['boxId']),
      warehouseId: serializer.fromJson<String?>(json['warehouseId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'receiveDate': serializer.toJson<String?>(receiveDate),
      'number': serializer.toJson<String?>(number),
      'sender': serializer.toJson<String?>(sender),
      'symNumber': serializer.toJson<String?>(symNumber),
      'docDate': serializer.toJson<String?>(docDate),
      'name': serializer.toJson<String?>(name),
      'receiver': serializer.toJson<String?>(receiver),
      'note': serializer.toJson<String?>(note),
      'boxId': serializer.toJson<String?>(boxId),
      'warehouseId': serializer.toJson<String?>(warehouseId),
    };
  }

  IncomingDispatch copyWith(
          {int? id,
          Value<String?> receiveDate = const Value.absent(),
          Value<String?> number = const Value.absent(),
          Value<String?> sender = const Value.absent(),
          Value<String?> symNumber = const Value.absent(),
          Value<String?> docDate = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> receiver = const Value.absent(),
          Value<String?> note = const Value.absent(),
          Value<String?> boxId = const Value.absent(),
          Value<String?> warehouseId = const Value.absent()}) =>
      IncomingDispatch(
        id: id ?? this.id,
        receiveDate: receiveDate.present ? receiveDate.value : this.receiveDate,
        number: number.present ? number.value : this.number,
        sender: sender.present ? sender.value : this.sender,
        symNumber: symNumber.present ? symNumber.value : this.symNumber,
        docDate: docDate.present ? docDate.value : this.docDate,
        name: name.present ? name.value : this.name,
        receiver: receiver.present ? receiver.value : this.receiver,
        note: note.present ? note.value : this.note,
        boxId: boxId.present ? boxId.value : this.boxId,
        warehouseId: warehouseId.present ? warehouseId.value : this.warehouseId,
      );
  IncomingDispatch copyWithCompanion(IncomingDispatchsCompanion data) {
    return IncomingDispatch(
      id: data.id.present ? data.id.value : this.id,
      receiveDate:
          data.receiveDate.present ? data.receiveDate.value : this.receiveDate,
      number: data.number.present ? data.number.value : this.number,
      sender: data.sender.present ? data.sender.value : this.sender,
      symNumber: data.symNumber.present ? data.symNumber.value : this.symNumber,
      docDate: data.docDate.present ? data.docDate.value : this.docDate,
      name: data.name.present ? data.name.value : this.name,
      receiver: data.receiver.present ? data.receiver.value : this.receiver,
      note: data.note.present ? data.note.value : this.note,
      boxId: data.boxId.present ? data.boxId.value : this.boxId,
      warehouseId:
          data.warehouseId.present ? data.warehouseId.value : this.warehouseId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IncomingDispatch(')
          ..write('id: $id, ')
          ..write('receiveDate: $receiveDate, ')
          ..write('number: $number, ')
          ..write('sender: $sender, ')
          ..write('symNumber: $symNumber, ')
          ..write('docDate: $docDate, ')
          ..write('name: $name, ')
          ..write('receiver: $receiver, ')
          ..write('note: $note, ')
          ..write('boxId: $boxId, ')
          ..write('warehouseId: $warehouseId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, receiveDate, number, sender, symNumber,
      docDate, name, receiver, note, boxId, warehouseId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomingDispatch &&
          other.id == this.id &&
          other.receiveDate == this.receiveDate &&
          other.number == this.number &&
          other.sender == this.sender &&
          other.symNumber == this.symNumber &&
          other.docDate == this.docDate &&
          other.name == this.name &&
          other.receiver == this.receiver &&
          other.note == this.note &&
          other.boxId == this.boxId &&
          other.warehouseId == this.warehouseId);
}

class IncomingDispatchsCompanion extends UpdateCompanion<IncomingDispatch> {
  final Value<int> id;
  final Value<String?> receiveDate;
  final Value<String?> number;
  final Value<String?> sender;
  final Value<String?> symNumber;
  final Value<String?> docDate;
  final Value<String?> name;
  final Value<String?> receiver;
  final Value<String?> note;
  final Value<String?> boxId;
  final Value<String?> warehouseId;
  const IncomingDispatchsCompanion({
    this.id = const Value.absent(),
    this.receiveDate = const Value.absent(),
    this.number = const Value.absent(),
    this.sender = const Value.absent(),
    this.symNumber = const Value.absent(),
    this.docDate = const Value.absent(),
    this.name = const Value.absent(),
    this.receiver = const Value.absent(),
    this.note = const Value.absent(),
    this.boxId = const Value.absent(),
    this.warehouseId = const Value.absent(),
  });
  IncomingDispatchsCompanion.insert({
    this.id = const Value.absent(),
    this.receiveDate = const Value.absent(),
    this.number = const Value.absent(),
    this.sender = const Value.absent(),
    this.symNumber = const Value.absent(),
    this.docDate = const Value.absent(),
    this.name = const Value.absent(),
    this.receiver = const Value.absent(),
    this.note = const Value.absent(),
    this.boxId = const Value.absent(),
    this.warehouseId = const Value.absent(),
  });
  static Insertable<IncomingDispatch> custom({
    Expression<int>? id,
    Expression<String>? receiveDate,
    Expression<String>? number,
    Expression<String>? sender,
    Expression<String>? symNumber,
    Expression<String>? docDate,
    Expression<String>? name,
    Expression<String>? receiver,
    Expression<String>? note,
    Expression<String>? boxId,
    Expression<String>? warehouseId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (receiveDate != null) 'receive_date': receiveDate,
      if (number != null) 'number': number,
      if (sender != null) 'sender': sender,
      if (symNumber != null) 'sym_number': symNumber,
      if (docDate != null) 'doc_date': docDate,
      if (name != null) 'name': name,
      if (receiver != null) 'receiver': receiver,
      if (note != null) 'note': note,
      if (boxId != null) 'box_id': boxId,
      if (warehouseId != null) 'warehouse_id': warehouseId,
    });
  }

  IncomingDispatchsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? receiveDate,
      Value<String?>? number,
      Value<String?>? sender,
      Value<String?>? symNumber,
      Value<String?>? docDate,
      Value<String?>? name,
      Value<String?>? receiver,
      Value<String?>? note,
      Value<String?>? boxId,
      Value<String?>? warehouseId}) {
    return IncomingDispatchsCompanion(
      id: id ?? this.id,
      receiveDate: receiveDate ?? this.receiveDate,
      number: number ?? this.number,
      sender: sender ?? this.sender,
      symNumber: symNumber ?? this.symNumber,
      docDate: docDate ?? this.docDate,
      name: name ?? this.name,
      receiver: receiver ?? this.receiver,
      note: note ?? this.note,
      boxId: boxId ?? this.boxId,
      warehouseId: warehouseId ?? this.warehouseId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (receiveDate.present) {
      map['receive_date'] = Variable<String>(receiveDate.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (sender.present) {
      map['sender'] = Variable<String>(sender.value);
    }
    if (symNumber.present) {
      map['sym_number'] = Variable<String>(symNumber.value);
    }
    if (docDate.present) {
      map['doc_date'] = Variable<String>(docDate.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (receiver.present) {
      map['receiver'] = Variable<String>(receiver.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (boxId.present) {
      map['box_id'] = Variable<String>(boxId.value);
    }
    if (warehouseId.present) {
      map['warehouse_id'] = Variable<String>(warehouseId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomingDispatchsCompanion(')
          ..write('id: $id, ')
          ..write('receiveDate: $receiveDate, ')
          ..write('number: $number, ')
          ..write('sender: $sender, ')
          ..write('symNumber: $symNumber, ')
          ..write('docDate: $docDate, ')
          ..write('name: $name, ')
          ..write('receiver: $receiver, ')
          ..write('note: $note, ')
          ..write('boxId: $boxId, ')
          ..write('warehouseId: $warehouseId')
          ..write(')'))
        .toString();
  }
}

class $OutcomingDispatchsTable extends OutcomingDispatchs
    with TableInfo<$OutcomingDispatchsTable, OutcomingDispatch> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OutcomingDispatchsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
      'number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _docDateMeta =
      const VerificationMeta('docDate');
  @override
  late final GeneratedColumn<String> docDate = GeneratedColumn<String>(
      'doc_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _signerMeta = const VerificationMeta('signer');
  @override
  late final GeneratedColumn<String> signer = GeneratedColumn<String>(
      'signer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _receiverMeta =
      const VerificationMeta('receiver');
  @override
  late final GeneratedColumn<String> receiver = GeneratedColumn<String>(
      'receiver', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _boxIdMeta = const VerificationMeta('boxId');
  @override
  late final GeneratedColumn<String> boxId = GeneratedColumn<String>(
      'box_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _warehouseIdMeta =
      const VerificationMeta('warehouseId');
  @override
  late final GeneratedColumn<String> warehouseId = GeneratedColumn<String>(
      'warehouse_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        number,
        docDate,
        name,
        signer,
        receiver,
        quantity,
        boxId,
        warehouseId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'outcoming_dispatchs';
  @override
  VerificationContext validateIntegrity(Insertable<OutcomingDispatch> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    }
    if (data.containsKey('doc_date')) {
      context.handle(_docDateMeta,
          docDate.isAcceptableOrUnknown(data['doc_date']!, _docDateMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('signer')) {
      context.handle(_signerMeta,
          signer.isAcceptableOrUnknown(data['signer']!, _signerMeta));
    }
    if (data.containsKey('receiver')) {
      context.handle(_receiverMeta,
          receiver.isAcceptableOrUnknown(data['receiver']!, _receiverMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('box_id')) {
      context.handle(
          _boxIdMeta, boxId.isAcceptableOrUnknown(data['box_id']!, _boxIdMeta));
    }
    if (data.containsKey('warehouse_id')) {
      context.handle(
          _warehouseIdMeta,
          warehouseId.isAcceptableOrUnknown(
              data['warehouse_id']!, _warehouseIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OutcomingDispatch map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutcomingDispatch(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number']),
      docDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doc_date']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      signer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}signer']),
      receiver: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receiver']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity']),
      boxId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}box_id']),
      warehouseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}warehouse_id']),
    );
  }

  @override
  $OutcomingDispatchsTable createAlias(String alias) {
    return $OutcomingDispatchsTable(attachedDatabase, alias);
  }
}

class OutcomingDispatch extends DataClass
    implements Insertable<OutcomingDispatch> {
  final int id;
  final String? number;
  final String? docDate;
  final String? name;
  final String? signer;
  final String? receiver;
  final int? quantity;
  final String? boxId;
  final String? warehouseId;
  const OutcomingDispatch(
      {required this.id,
      this.number,
      this.docDate,
      this.name,
      this.signer,
      this.receiver,
      this.quantity,
      this.boxId,
      this.warehouseId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<String>(number);
    }
    if (!nullToAbsent || docDate != null) {
      map['doc_date'] = Variable<String>(docDate);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || signer != null) {
      map['signer'] = Variable<String>(signer);
    }
    if (!nullToAbsent || receiver != null) {
      map['receiver'] = Variable<String>(receiver);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || boxId != null) {
      map['box_id'] = Variable<String>(boxId);
    }
    if (!nullToAbsent || warehouseId != null) {
      map['warehouse_id'] = Variable<String>(warehouseId);
    }
    return map;
  }

  OutcomingDispatchsCompanion toCompanion(bool nullToAbsent) {
    return OutcomingDispatchsCompanion(
      id: Value(id),
      number:
          number == null && nullToAbsent ? const Value.absent() : Value(number),
      docDate: docDate == null && nullToAbsent
          ? const Value.absent()
          : Value(docDate),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      signer:
          signer == null && nullToAbsent ? const Value.absent() : Value(signer),
      receiver: receiver == null && nullToAbsent
          ? const Value.absent()
          : Value(receiver),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      boxId:
          boxId == null && nullToAbsent ? const Value.absent() : Value(boxId),
      warehouseId: warehouseId == null && nullToAbsent
          ? const Value.absent()
          : Value(warehouseId),
    );
  }

  factory OutcomingDispatch.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OutcomingDispatch(
      id: serializer.fromJson<int>(json['id']),
      number: serializer.fromJson<String?>(json['number']),
      docDate: serializer.fromJson<String?>(json['docDate']),
      name: serializer.fromJson<String?>(json['name']),
      signer: serializer.fromJson<String?>(json['signer']),
      receiver: serializer.fromJson<String?>(json['receiver']),
      quantity: serializer.fromJson<int?>(json['quantity']),
      boxId: serializer.fromJson<String?>(json['boxId']),
      warehouseId: serializer.fromJson<String?>(json['warehouseId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'number': serializer.toJson<String?>(number),
      'docDate': serializer.toJson<String?>(docDate),
      'name': serializer.toJson<String?>(name),
      'signer': serializer.toJson<String?>(signer),
      'receiver': serializer.toJson<String?>(receiver),
      'quantity': serializer.toJson<int?>(quantity),
      'boxId': serializer.toJson<String?>(boxId),
      'warehouseId': serializer.toJson<String?>(warehouseId),
    };
  }

  OutcomingDispatch copyWith(
          {int? id,
          Value<String?> number = const Value.absent(),
          Value<String?> docDate = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> signer = const Value.absent(),
          Value<String?> receiver = const Value.absent(),
          Value<int?> quantity = const Value.absent(),
          Value<String?> boxId = const Value.absent(),
          Value<String?> warehouseId = const Value.absent()}) =>
      OutcomingDispatch(
        id: id ?? this.id,
        number: number.present ? number.value : this.number,
        docDate: docDate.present ? docDate.value : this.docDate,
        name: name.present ? name.value : this.name,
        signer: signer.present ? signer.value : this.signer,
        receiver: receiver.present ? receiver.value : this.receiver,
        quantity: quantity.present ? quantity.value : this.quantity,
        boxId: boxId.present ? boxId.value : this.boxId,
        warehouseId: warehouseId.present ? warehouseId.value : this.warehouseId,
      );
  OutcomingDispatch copyWithCompanion(OutcomingDispatchsCompanion data) {
    return OutcomingDispatch(
      id: data.id.present ? data.id.value : this.id,
      number: data.number.present ? data.number.value : this.number,
      docDate: data.docDate.present ? data.docDate.value : this.docDate,
      name: data.name.present ? data.name.value : this.name,
      signer: data.signer.present ? data.signer.value : this.signer,
      receiver: data.receiver.present ? data.receiver.value : this.receiver,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      boxId: data.boxId.present ? data.boxId.value : this.boxId,
      warehouseId:
          data.warehouseId.present ? data.warehouseId.value : this.warehouseId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OutcomingDispatch(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('docDate: $docDate, ')
          ..write('name: $name, ')
          ..write('signer: $signer, ')
          ..write('receiver: $receiver, ')
          ..write('quantity: $quantity, ')
          ..write('boxId: $boxId, ')
          ..write('warehouseId: $warehouseId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, number, docDate, name, signer, receiver,
      quantity, boxId, warehouseId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OutcomingDispatch &&
          other.id == this.id &&
          other.number == this.number &&
          other.docDate == this.docDate &&
          other.name == this.name &&
          other.signer == this.signer &&
          other.receiver == this.receiver &&
          other.quantity == this.quantity &&
          other.boxId == this.boxId &&
          other.warehouseId == this.warehouseId);
}

class OutcomingDispatchsCompanion extends UpdateCompanion<OutcomingDispatch> {
  final Value<int> id;
  final Value<String?> number;
  final Value<String?> docDate;
  final Value<String?> name;
  final Value<String?> signer;
  final Value<String?> receiver;
  final Value<int?> quantity;
  final Value<String?> boxId;
  final Value<String?> warehouseId;
  const OutcomingDispatchsCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.docDate = const Value.absent(),
    this.name = const Value.absent(),
    this.signer = const Value.absent(),
    this.receiver = const Value.absent(),
    this.quantity = const Value.absent(),
    this.boxId = const Value.absent(),
    this.warehouseId = const Value.absent(),
  });
  OutcomingDispatchsCompanion.insert({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.docDate = const Value.absent(),
    this.name = const Value.absent(),
    this.signer = const Value.absent(),
    this.receiver = const Value.absent(),
    this.quantity = const Value.absent(),
    this.boxId = const Value.absent(),
    this.warehouseId = const Value.absent(),
  });
  static Insertable<OutcomingDispatch> custom({
    Expression<int>? id,
    Expression<String>? number,
    Expression<String>? docDate,
    Expression<String>? name,
    Expression<String>? signer,
    Expression<String>? receiver,
    Expression<int>? quantity,
    Expression<String>? boxId,
    Expression<String>? warehouseId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (number != null) 'number': number,
      if (docDate != null) 'doc_date': docDate,
      if (name != null) 'name': name,
      if (signer != null) 'signer': signer,
      if (receiver != null) 'receiver': receiver,
      if (quantity != null) 'quantity': quantity,
      if (boxId != null) 'box_id': boxId,
      if (warehouseId != null) 'warehouse_id': warehouseId,
    });
  }

  OutcomingDispatchsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? number,
      Value<String?>? docDate,
      Value<String?>? name,
      Value<String?>? signer,
      Value<String?>? receiver,
      Value<int?>? quantity,
      Value<String?>? boxId,
      Value<String?>? warehouseId}) {
    return OutcomingDispatchsCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
      docDate: docDate ?? this.docDate,
      name: name ?? this.name,
      signer: signer ?? this.signer,
      receiver: receiver ?? this.receiver,
      quantity: quantity ?? this.quantity,
      boxId: boxId ?? this.boxId,
      warehouseId: warehouseId ?? this.warehouseId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (docDate.present) {
      map['doc_date'] = Variable<String>(docDate.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (signer.present) {
      map['signer'] = Variable<String>(signer.value);
    }
    if (receiver.present) {
      map['receiver'] = Variable<String>(receiver.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (boxId.present) {
      map['box_id'] = Variable<String>(boxId.value);
    }
    if (warehouseId.present) {
      map['warehouse_id'] = Variable<String>(warehouseId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutcomingDispatchsCompanion(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('docDate: $docDate, ')
          ..write('name: $name, ')
          ..write('signer: $signer, ')
          ..write('receiver: $receiver, ')
          ..write('quantity: $quantity, ')
          ..write('boxId: $boxId, ')
          ..write('warehouseId: $warehouseId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DocumentsTable documents = $DocumentsTable(this);
  late final $IncomingDispatchsTable incomingDispatchs =
      $IncomingDispatchsTable(this);
  late final $OutcomingDispatchsTable outcomingDispatchs =
      $OutcomingDispatchsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [documents, incomingDispatchs, outcomingDispatchs];
}

typedef $$DocumentsTableCreateCompanionBuilder = DocumentsCompanion Function({
  Value<int> id,
  required String number,
  Value<String?> date,
  Value<String?> name,
  Value<String?> signer,
  Value<String?> receiver,
  Value<int?> quantity,
  Value<String?> note,
  Value<String?> keyword,
  Value<String?> boxId,
  Value<String?> warehouseId,
});
typedef $$DocumentsTableUpdateCompanionBuilder = DocumentsCompanion Function({
  Value<int> id,
  Value<String> number,
  Value<String?> date,
  Value<String?> name,
  Value<String?> signer,
  Value<String?> receiver,
  Value<int?> quantity,
  Value<String?> note,
  Value<String?> keyword,
  Value<String?> boxId,
  Value<String?> warehouseId,
});

class $$DocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get signer => $composableBuilder(
      column: $table.signer, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receiver => $composableBuilder(
      column: $table.receiver, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get keyword => $composableBuilder(
      column: $table.keyword, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get boxId => $composableBuilder(
      column: $table.boxId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get warehouseId => $composableBuilder(
      column: $table.warehouseId, builder: (column) => ColumnFilters(column));
}

class $$DocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get signer => $composableBuilder(
      column: $table.signer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receiver => $composableBuilder(
      column: $table.receiver, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get keyword => $composableBuilder(
      column: $table.keyword, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get boxId => $composableBuilder(
      column: $table.boxId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get warehouseId => $composableBuilder(
      column: $table.warehouseId, builder: (column) => ColumnOrderings(column));
}

class $$DocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get signer =>
      $composableBuilder(column: $table.signer, builder: (column) => column);

  GeneratedColumn<String> get receiver =>
      $composableBuilder(column: $table.receiver, builder: (column) => column);

  GeneratedColumn<String> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get keyword =>
      $composableBuilder(column: $table.keyword, builder: (column) => column);

  GeneratedColumn<String> get boxId =>
      $composableBuilder(column: $table.boxId, builder: (column) => column);

  GeneratedColumn<String> get warehouseId => $composableBuilder(
      column: $table.warehouseId, builder: (column) => column);
}

class $$DocumentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DocumentsTable,
    Document,
    $$DocumentsTableFilterComposer,
    $$DocumentsTableOrderingComposer,
    $$DocumentsTableAnnotationComposer,
    $$DocumentsTableCreateCompanionBuilder,
    $$DocumentsTableUpdateCompanionBuilder,
    (Document, BaseReferences<_$AppDatabase, $DocumentsTable, Document>),
    Document,
    PrefetchHooks Function()> {
  $$DocumentsTableTableManager(_$AppDatabase db, $DocumentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> number = const Value.absent(),
            Value<String?> date = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> signer = const Value.absent(),
            Value<String?> receiver = const Value.absent(),
            Value<int?> quantity = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<String?> keyword = const Value.absent(),
            Value<String?> boxId = const Value.absent(),
            Value<String?> warehouseId = const Value.absent(),
          }) =>
              DocumentsCompanion(
            id: id,
            number: number,
            date: date,
            name: name,
            signer: signer,
            receiver: receiver,
            quantity: quantity,
            note: note,
            keyword: keyword,
            boxId: boxId,
            warehouseId: warehouseId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String number,
            Value<String?> date = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> signer = const Value.absent(),
            Value<String?> receiver = const Value.absent(),
            Value<int?> quantity = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<String?> keyword = const Value.absent(),
            Value<String?> boxId = const Value.absent(),
            Value<String?> warehouseId = const Value.absent(),
          }) =>
              DocumentsCompanion.insert(
            id: id,
            number: number,
            date: date,
            name: name,
            signer: signer,
            receiver: receiver,
            quantity: quantity,
            note: note,
            keyword: keyword,
            boxId: boxId,
            warehouseId: warehouseId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DocumentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DocumentsTable,
    Document,
    $$DocumentsTableFilterComposer,
    $$DocumentsTableOrderingComposer,
    $$DocumentsTableAnnotationComposer,
    $$DocumentsTableCreateCompanionBuilder,
    $$DocumentsTableUpdateCompanionBuilder,
    (Document, BaseReferences<_$AppDatabase, $DocumentsTable, Document>),
    Document,
    PrefetchHooks Function()>;
typedef $$IncomingDispatchsTableCreateCompanionBuilder
    = IncomingDispatchsCompanion Function({
  Value<int> id,
  Value<String?> receiveDate,
  Value<String?> number,
  Value<String?> sender,
  Value<String?> symNumber,
  Value<String?> docDate,
  Value<String?> name,
  Value<String?> receiver,
  Value<String?> note,
  Value<String?> boxId,
  Value<String?> warehouseId,
});
typedef $$IncomingDispatchsTableUpdateCompanionBuilder
    = IncomingDispatchsCompanion Function({
  Value<int> id,
  Value<String?> receiveDate,
  Value<String?> number,
  Value<String?> sender,
  Value<String?> symNumber,
  Value<String?> docDate,
  Value<String?> name,
  Value<String?> receiver,
  Value<String?> note,
  Value<String?> boxId,
  Value<String?> warehouseId,
});

class $$IncomingDispatchsTableFilterComposer
    extends Composer<_$AppDatabase, $IncomingDispatchsTable> {
  $$IncomingDispatchsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receiveDate => $composableBuilder(
      column: $table.receiveDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sender => $composableBuilder(
      column: $table.sender, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get symNumber => $composableBuilder(
      column: $table.symNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get docDate => $composableBuilder(
      column: $table.docDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receiver => $composableBuilder(
      column: $table.receiver, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get boxId => $composableBuilder(
      column: $table.boxId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get warehouseId => $composableBuilder(
      column: $table.warehouseId, builder: (column) => ColumnFilters(column));
}

class $$IncomingDispatchsTableOrderingComposer
    extends Composer<_$AppDatabase, $IncomingDispatchsTable> {
  $$IncomingDispatchsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receiveDate => $composableBuilder(
      column: $table.receiveDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sender => $composableBuilder(
      column: $table.sender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get symNumber => $composableBuilder(
      column: $table.symNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get docDate => $composableBuilder(
      column: $table.docDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receiver => $composableBuilder(
      column: $table.receiver, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get boxId => $composableBuilder(
      column: $table.boxId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get warehouseId => $composableBuilder(
      column: $table.warehouseId, builder: (column) => ColumnOrderings(column));
}

class $$IncomingDispatchsTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncomingDispatchsTable> {
  $$IncomingDispatchsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get receiveDate => $composableBuilder(
      column: $table.receiveDate, builder: (column) => column);

  GeneratedColumn<String> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get sender =>
      $composableBuilder(column: $table.sender, builder: (column) => column);

  GeneratedColumn<String> get symNumber =>
      $composableBuilder(column: $table.symNumber, builder: (column) => column);

  GeneratedColumn<String> get docDate =>
      $composableBuilder(column: $table.docDate, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get receiver =>
      $composableBuilder(column: $table.receiver, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get boxId =>
      $composableBuilder(column: $table.boxId, builder: (column) => column);

  GeneratedColumn<String> get warehouseId => $composableBuilder(
      column: $table.warehouseId, builder: (column) => column);
}

class $$IncomingDispatchsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IncomingDispatchsTable,
    IncomingDispatch,
    $$IncomingDispatchsTableFilterComposer,
    $$IncomingDispatchsTableOrderingComposer,
    $$IncomingDispatchsTableAnnotationComposer,
    $$IncomingDispatchsTableCreateCompanionBuilder,
    $$IncomingDispatchsTableUpdateCompanionBuilder,
    (
      IncomingDispatch,
      BaseReferences<_$AppDatabase, $IncomingDispatchsTable, IncomingDispatch>
    ),
    IncomingDispatch,
    PrefetchHooks Function()> {
  $$IncomingDispatchsTableTableManager(
      _$AppDatabase db, $IncomingDispatchsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncomingDispatchsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IncomingDispatchsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IncomingDispatchsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> receiveDate = const Value.absent(),
            Value<String?> number = const Value.absent(),
            Value<String?> sender = const Value.absent(),
            Value<String?> symNumber = const Value.absent(),
            Value<String?> docDate = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> receiver = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<String?> boxId = const Value.absent(),
            Value<String?> warehouseId = const Value.absent(),
          }) =>
              IncomingDispatchsCompanion(
            id: id,
            receiveDate: receiveDate,
            number: number,
            sender: sender,
            symNumber: symNumber,
            docDate: docDate,
            name: name,
            receiver: receiver,
            note: note,
            boxId: boxId,
            warehouseId: warehouseId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> receiveDate = const Value.absent(),
            Value<String?> number = const Value.absent(),
            Value<String?> sender = const Value.absent(),
            Value<String?> symNumber = const Value.absent(),
            Value<String?> docDate = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> receiver = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<String?> boxId = const Value.absent(),
            Value<String?> warehouseId = const Value.absent(),
          }) =>
              IncomingDispatchsCompanion.insert(
            id: id,
            receiveDate: receiveDate,
            number: number,
            sender: sender,
            symNumber: symNumber,
            docDate: docDate,
            name: name,
            receiver: receiver,
            note: note,
            boxId: boxId,
            warehouseId: warehouseId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$IncomingDispatchsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $IncomingDispatchsTable,
    IncomingDispatch,
    $$IncomingDispatchsTableFilterComposer,
    $$IncomingDispatchsTableOrderingComposer,
    $$IncomingDispatchsTableAnnotationComposer,
    $$IncomingDispatchsTableCreateCompanionBuilder,
    $$IncomingDispatchsTableUpdateCompanionBuilder,
    (
      IncomingDispatch,
      BaseReferences<_$AppDatabase, $IncomingDispatchsTable, IncomingDispatch>
    ),
    IncomingDispatch,
    PrefetchHooks Function()>;
typedef $$OutcomingDispatchsTableCreateCompanionBuilder
    = OutcomingDispatchsCompanion Function({
  Value<int> id,
  Value<String?> number,
  Value<String?> docDate,
  Value<String?> name,
  Value<String?> signer,
  Value<String?> receiver,
  Value<int?> quantity,
  Value<String?> boxId,
  Value<String?> warehouseId,
});
typedef $$OutcomingDispatchsTableUpdateCompanionBuilder
    = OutcomingDispatchsCompanion Function({
  Value<int> id,
  Value<String?> number,
  Value<String?> docDate,
  Value<String?> name,
  Value<String?> signer,
  Value<String?> receiver,
  Value<int?> quantity,
  Value<String?> boxId,
  Value<String?> warehouseId,
});

class $$OutcomingDispatchsTableFilterComposer
    extends Composer<_$AppDatabase, $OutcomingDispatchsTable> {
  $$OutcomingDispatchsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get docDate => $composableBuilder(
      column: $table.docDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get signer => $composableBuilder(
      column: $table.signer, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receiver => $composableBuilder(
      column: $table.receiver, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get boxId => $composableBuilder(
      column: $table.boxId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get warehouseId => $composableBuilder(
      column: $table.warehouseId, builder: (column) => ColumnFilters(column));
}

class $$OutcomingDispatchsTableOrderingComposer
    extends Composer<_$AppDatabase, $OutcomingDispatchsTable> {
  $$OutcomingDispatchsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get docDate => $composableBuilder(
      column: $table.docDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get signer => $composableBuilder(
      column: $table.signer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receiver => $composableBuilder(
      column: $table.receiver, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get boxId => $composableBuilder(
      column: $table.boxId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get warehouseId => $composableBuilder(
      column: $table.warehouseId, builder: (column) => ColumnOrderings(column));
}

class $$OutcomingDispatchsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OutcomingDispatchsTable> {
  $$OutcomingDispatchsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get docDate =>
      $composableBuilder(column: $table.docDate, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get signer =>
      $composableBuilder(column: $table.signer, builder: (column) => column);

  GeneratedColumn<String> get receiver =>
      $composableBuilder(column: $table.receiver, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get boxId =>
      $composableBuilder(column: $table.boxId, builder: (column) => column);

  GeneratedColumn<String> get warehouseId => $composableBuilder(
      column: $table.warehouseId, builder: (column) => column);
}

class $$OutcomingDispatchsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OutcomingDispatchsTable,
    OutcomingDispatch,
    $$OutcomingDispatchsTableFilterComposer,
    $$OutcomingDispatchsTableOrderingComposer,
    $$OutcomingDispatchsTableAnnotationComposer,
    $$OutcomingDispatchsTableCreateCompanionBuilder,
    $$OutcomingDispatchsTableUpdateCompanionBuilder,
    (
      OutcomingDispatch,
      BaseReferences<_$AppDatabase, $OutcomingDispatchsTable, OutcomingDispatch>
    ),
    OutcomingDispatch,
    PrefetchHooks Function()> {
  $$OutcomingDispatchsTableTableManager(
      _$AppDatabase db, $OutcomingDispatchsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OutcomingDispatchsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OutcomingDispatchsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OutcomingDispatchsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> number = const Value.absent(),
            Value<String?> docDate = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> signer = const Value.absent(),
            Value<String?> receiver = const Value.absent(),
            Value<int?> quantity = const Value.absent(),
            Value<String?> boxId = const Value.absent(),
            Value<String?> warehouseId = const Value.absent(),
          }) =>
              OutcomingDispatchsCompanion(
            id: id,
            number: number,
            docDate: docDate,
            name: name,
            signer: signer,
            receiver: receiver,
            quantity: quantity,
            boxId: boxId,
            warehouseId: warehouseId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> number = const Value.absent(),
            Value<String?> docDate = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> signer = const Value.absent(),
            Value<String?> receiver = const Value.absent(),
            Value<int?> quantity = const Value.absent(),
            Value<String?> boxId = const Value.absent(),
            Value<String?> warehouseId = const Value.absent(),
          }) =>
              OutcomingDispatchsCompanion.insert(
            id: id,
            number: number,
            docDate: docDate,
            name: name,
            signer: signer,
            receiver: receiver,
            quantity: quantity,
            boxId: boxId,
            warehouseId: warehouseId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OutcomingDispatchsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OutcomingDispatchsTable,
    OutcomingDispatch,
    $$OutcomingDispatchsTableFilterComposer,
    $$OutcomingDispatchsTableOrderingComposer,
    $$OutcomingDispatchsTableAnnotationComposer,
    $$OutcomingDispatchsTableCreateCompanionBuilder,
    $$OutcomingDispatchsTableUpdateCompanionBuilder,
    (
      OutcomingDispatch,
      BaseReferences<_$AppDatabase, $OutcomingDispatchsTable, OutcomingDispatch>
    ),
    OutcomingDispatch,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DocumentsTableTableManager get documents =>
      $$DocumentsTableTableManager(_db, _db.documents);
  $$IncomingDispatchsTableTableManager get incomingDispatchs =>
      $$IncomingDispatchsTableTableManager(_db, _db.incomingDispatchs);
  $$OutcomingDispatchsTableTableManager get outcomingDispatchs =>
      $$OutcomingDispatchsTableTableManager(_db, _db.outcomingDispatchs);
}
