// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.dart';

// ignore_for_file: type=lint
class $WalletsTable extends Wallets
    with TableInfo<$WalletsTable, TransactionWallet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WalletsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _walletPkMeta =
      const VerificationMeta('walletPk');
  @override
  late final GeneratedColumn<String> walletPk = GeneratedColumn<String>(
      'wallet_pk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _colourMeta = const VerificationMeta('colour');
  @override
  late final GeneratedColumn<String> colour = GeneratedColumn<String>(
      'colour', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _iconNameMeta =
      const VerificationMeta('iconName');
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
      'icon_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => new DateTime.now());
  static const VerificationMeta _dateTimeModifiedMeta =
      const VerificationMeta('dateTimeModified');
  @override
  late final GeneratedColumn<DateTime> dateTimeModified =
      GeneratedColumn<DateTime>('date_time_modified', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _currencyFormatMeta =
      const VerificationMeta('currencyFormat');
  @override
  late final GeneratedColumn<String> currencyFormat = GeneratedColumn<String>(
      'currency_format', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _decimalsMeta =
      const VerificationMeta('decimals');
  @override
  late final GeneratedColumn<int> decimals = GeneratedColumn<int>(
      'decimals', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(2));
  @override
  late final GeneratedColumnWithTypeConverter<List<HomePageWidgetDisplay>?,
      String> homePageWidgetDisplay = GeneratedColumn<String>(
          'home_page_widget_display', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant(null))
      .withConverter<List<HomePageWidgetDisplay>?>(
          $WalletsTable.$converterhomePageWidgetDisplayn);
  @override
  List<GeneratedColumn> get $columns => [
        walletPk,
        name,
        colour,
        iconName,
        dateCreated,
        dateTimeModified,
        order,
        currency,
        currencyFormat,
        decimals,
        homePageWidgetDisplay
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wallets';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionWallet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('wallet_pk')) {
      context.handle(_walletPkMeta,
          walletPk.isAcceptableOrUnknown(data['wallet_pk']!, _walletPkMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('colour')) {
      context.handle(_colourMeta,
          colour.isAcceptableOrUnknown(data['colour']!, _colourMeta));
    }
    if (data.containsKey('icon_name')) {
      context.handle(_iconNameMeta,
          iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta));
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_time_modified')) {
      context.handle(
          _dateTimeModifiedMeta,
          dateTimeModified.isAcceptableOrUnknown(
              data['date_time_modified']!, _dateTimeModifiedMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    }
    if (data.containsKey('currency_format')) {
      context.handle(
          _currencyFormatMeta,
          currencyFormat.isAcceptableOrUnknown(
              data['currency_format']!, _currencyFormatMeta));
    }
    if (data.containsKey('decimals')) {
      context.handle(_decimalsMeta,
          decimals.isAcceptableOrUnknown(data['decimals']!, _decimalsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {walletPk};
  @override
  TransactionWallet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionWallet(
      walletPk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wallet_pk'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      colour: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}colour']),
      iconName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_name']),
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateTimeModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_modified']),
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency']),
      currencyFormat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency_format']),
      decimals: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}decimals'])!,
      homePageWidgetDisplay: $WalletsTable.$converterhomePageWidgetDisplayn
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}home_page_widget_display'])),
    );
  }

  @override
  $WalletsTable createAlias(String alias) {
    return $WalletsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<HomePageWidgetDisplay>, String>
      $converterhomePageWidgetDisplay =
      const HomePageWidgetDisplayListInColumnConverter();
  static TypeConverter<List<HomePageWidgetDisplay>?, String?>
      $converterhomePageWidgetDisplayn =
      NullAwareTypeConverter.wrap($converterhomePageWidgetDisplay);
}

class TransactionWallet extends DataClass
    implements Insertable<TransactionWallet> {
  final String walletPk;
  final String name;
  final String? colour;
  final String? iconName;
  final DateTime dateCreated;
  final DateTime? dateTimeModified;
  final int order;
  final String? currency;
  final String? currencyFormat;
  final int decimals;
  final List<HomePageWidgetDisplay>? homePageWidgetDisplay;
  const TransactionWallet(
      {required this.walletPk,
      required this.name,
      this.colour,
      this.iconName,
      required this.dateCreated,
      this.dateTimeModified,
      required this.order,
      this.currency,
      this.currencyFormat,
      required this.decimals,
      this.homePageWidgetDisplay});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['wallet_pk'] = Variable<String>(walletPk);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || colour != null) {
      map['colour'] = Variable<String>(colour);
    }
    if (!nullToAbsent || iconName != null) {
      map['icon_name'] = Variable<String>(iconName);
    }
    map['date_created'] = Variable<DateTime>(dateCreated);
    if (!nullToAbsent || dateTimeModified != null) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified);
    }
    map['order'] = Variable<int>(order);
    if (!nullToAbsent || currency != null) {
      map['currency'] = Variable<String>(currency);
    }
    if (!nullToAbsent || currencyFormat != null) {
      map['currency_format'] = Variable<String>(currencyFormat);
    }
    map['decimals'] = Variable<int>(decimals);
    if (!nullToAbsent || homePageWidgetDisplay != null) {
      map['home_page_widget_display'] = Variable<String>($WalletsTable
          .$converterhomePageWidgetDisplayn
          .toSql(homePageWidgetDisplay));
    }
    return map;
  }

  WalletsCompanion toCompanion(bool nullToAbsent) {
    return WalletsCompanion(
      walletPk: Value(walletPk),
      name: Value(name),
      colour:
          colour == null && nullToAbsent ? const Value.absent() : Value(colour),
      iconName: iconName == null && nullToAbsent
          ? const Value.absent()
          : Value(iconName),
      dateCreated: Value(dateCreated),
      dateTimeModified: dateTimeModified == null && nullToAbsent
          ? const Value.absent()
          : Value(dateTimeModified),
      order: Value(order),
      currency: currency == null && nullToAbsent
          ? const Value.absent()
          : Value(currency),
      currencyFormat: currencyFormat == null && nullToAbsent
          ? const Value.absent()
          : Value(currencyFormat),
      decimals: Value(decimals),
      homePageWidgetDisplay: homePageWidgetDisplay == null && nullToAbsent
          ? const Value.absent()
          : Value(homePageWidgetDisplay),
    );
  }

  factory TransactionWallet.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionWallet(
      walletPk: serializer.fromJson<String>(json['walletPk']),
      name: serializer.fromJson<String>(json['name']),
      colour: serializer.fromJson<String?>(json['colour']),
      iconName: serializer.fromJson<String?>(json['iconName']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateTimeModified:
          serializer.fromJson<DateTime?>(json['dateTimeModified']),
      order: serializer.fromJson<int>(json['order']),
      currency: serializer.fromJson<String?>(json['currency']),
      currencyFormat: serializer.fromJson<String?>(json['currencyFormat']),
      decimals: serializer.fromJson<int>(json['decimals']),
      homePageWidgetDisplay: serializer.fromJson<List<HomePageWidgetDisplay>?>(
          json['homePageWidgetDisplay']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'walletPk': serializer.toJson<String>(walletPk),
      'name': serializer.toJson<String>(name),
      'colour': serializer.toJson<String?>(colour),
      'iconName': serializer.toJson<String?>(iconName),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateTimeModified': serializer.toJson<DateTime?>(dateTimeModified),
      'order': serializer.toJson<int>(order),
      'currency': serializer.toJson<String?>(currency),
      'currencyFormat': serializer.toJson<String?>(currencyFormat),
      'decimals': serializer.toJson<int>(decimals),
      'homePageWidgetDisplay': serializer
          .toJson<List<HomePageWidgetDisplay>?>(homePageWidgetDisplay),
    };
  }

  TransactionWallet copyWith(
          {String? walletPk,
          String? name,
          Value<String?> colour = const Value.absent(),
          Value<String?> iconName = const Value.absent(),
          DateTime? dateCreated,
          Value<DateTime?> dateTimeModified = const Value.absent(),
          int? order,
          Value<String?> currency = const Value.absent(),
          Value<String?> currencyFormat = const Value.absent(),
          int? decimals,
          Value<List<HomePageWidgetDisplay>?> homePageWidgetDisplay =
              const Value.absent()}) =>
      TransactionWallet(
        walletPk: walletPk ?? this.walletPk,
        name: name ?? this.name,
        colour: colour.present ? colour.value : this.colour,
        iconName: iconName.present ? iconName.value : this.iconName,
        dateCreated: dateCreated ?? this.dateCreated,
        dateTimeModified: dateTimeModified.present
            ? dateTimeModified.value
            : this.dateTimeModified,
        order: order ?? this.order,
        currency: currency.present ? currency.value : this.currency,
        currencyFormat:
            currencyFormat.present ? currencyFormat.value : this.currencyFormat,
        decimals: decimals ?? this.decimals,
        homePageWidgetDisplay: homePageWidgetDisplay.present
            ? homePageWidgetDisplay.value
            : this.homePageWidgetDisplay,
      );
  TransactionWallet copyWithCompanion(WalletsCompanion data) {
    return TransactionWallet(
      walletPk: data.walletPk.present ? data.walletPk.value : this.walletPk,
      name: data.name.present ? data.name.value : this.name,
      colour: data.colour.present ? data.colour.value : this.colour,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateTimeModified: data.dateTimeModified.present
          ? data.dateTimeModified.value
          : this.dateTimeModified,
      order: data.order.present ? data.order.value : this.order,
      currency: data.currency.present ? data.currency.value : this.currency,
      currencyFormat: data.currencyFormat.present
          ? data.currencyFormat.value
          : this.currencyFormat,
      decimals: data.decimals.present ? data.decimals.value : this.decimals,
      homePageWidgetDisplay: data.homePageWidgetDisplay.present
          ? data.homePageWidgetDisplay.value
          : this.homePageWidgetDisplay,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionWallet(')
          ..write('walletPk: $walletPk, ')
          ..write('name: $name, ')
          ..write('colour: $colour, ')
          ..write('iconName: $iconName, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('order: $order, ')
          ..write('currency: $currency, ')
          ..write('currencyFormat: $currencyFormat, ')
          ..write('decimals: $decimals, ')
          ..write('homePageWidgetDisplay: $homePageWidgetDisplay')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      walletPk,
      name,
      colour,
      iconName,
      dateCreated,
      dateTimeModified,
      order,
      currency,
      currencyFormat,
      decimals,
      homePageWidgetDisplay);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionWallet &&
          other.walletPk == this.walletPk &&
          other.name == this.name &&
          other.colour == this.colour &&
          other.iconName == this.iconName &&
          other.dateCreated == this.dateCreated &&
          other.dateTimeModified == this.dateTimeModified &&
          other.order == this.order &&
          other.currency == this.currency &&
          other.currencyFormat == this.currencyFormat &&
          other.decimals == this.decimals &&
          other.homePageWidgetDisplay == this.homePageWidgetDisplay);
}

class WalletsCompanion extends UpdateCompanion<TransactionWallet> {
  final Value<String> walletPk;
  final Value<String> name;
  final Value<String?> colour;
  final Value<String?> iconName;
  final Value<DateTime> dateCreated;
  final Value<DateTime?> dateTimeModified;
  final Value<int> order;
  final Value<String?> currency;
  final Value<String?> currencyFormat;
  final Value<int> decimals;
  final Value<List<HomePageWidgetDisplay>?> homePageWidgetDisplay;
  final Value<int> rowid;
  const WalletsCompanion({
    this.walletPk = const Value.absent(),
    this.name = const Value.absent(),
    this.colour = const Value.absent(),
    this.iconName = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.order = const Value.absent(),
    this.currency = const Value.absent(),
    this.currencyFormat = const Value.absent(),
    this.decimals = const Value.absent(),
    this.homePageWidgetDisplay = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WalletsCompanion.insert({
    this.walletPk = const Value.absent(),
    required String name,
    this.colour = const Value.absent(),
    this.iconName = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    required int order,
    this.currency = const Value.absent(),
    this.currencyFormat = const Value.absent(),
    this.decimals = const Value.absent(),
    this.homePageWidgetDisplay = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        order = Value(order);
  static Insertable<TransactionWallet> custom({
    Expression<String>? walletPk,
    Expression<String>? name,
    Expression<String>? colour,
    Expression<String>? iconName,
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateTimeModified,
    Expression<int>? order,
    Expression<String>? currency,
    Expression<String>? currencyFormat,
    Expression<int>? decimals,
    Expression<String>? homePageWidgetDisplay,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (walletPk != null) 'wallet_pk': walletPk,
      if (name != null) 'name': name,
      if (colour != null) 'colour': colour,
      if (iconName != null) 'icon_name': iconName,
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateTimeModified != null) 'date_time_modified': dateTimeModified,
      if (order != null) 'order': order,
      if (currency != null) 'currency': currency,
      if (currencyFormat != null) 'currency_format': currencyFormat,
      if (decimals != null) 'decimals': decimals,
      if (homePageWidgetDisplay != null)
        'home_page_widget_display': homePageWidgetDisplay,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WalletsCompanion copyWith(
      {Value<String>? walletPk,
      Value<String>? name,
      Value<String?>? colour,
      Value<String?>? iconName,
      Value<DateTime>? dateCreated,
      Value<DateTime?>? dateTimeModified,
      Value<int>? order,
      Value<String?>? currency,
      Value<String?>? currencyFormat,
      Value<int>? decimals,
      Value<List<HomePageWidgetDisplay>?>? homePageWidgetDisplay,
      Value<int>? rowid}) {
    return WalletsCompanion(
      walletPk: walletPk ?? this.walletPk,
      name: name ?? this.name,
      colour: colour ?? this.colour,
      iconName: iconName ?? this.iconName,
      dateCreated: dateCreated ?? this.dateCreated,
      dateTimeModified: dateTimeModified ?? this.dateTimeModified,
      order: order ?? this.order,
      currency: currency ?? this.currency,
      currencyFormat: currencyFormat ?? this.currencyFormat,
      decimals: decimals ?? this.decimals,
      homePageWidgetDisplay:
          homePageWidgetDisplay ?? this.homePageWidgetDisplay,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (walletPk.present) {
      map['wallet_pk'] = Variable<String>(walletPk.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colour.present) {
      map['colour'] = Variable<String>(colour.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateTimeModified.present) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (currencyFormat.present) {
      map['currency_format'] = Variable<String>(currencyFormat.value);
    }
    if (decimals.present) {
      map['decimals'] = Variable<int>(decimals.value);
    }
    if (homePageWidgetDisplay.present) {
      map['home_page_widget_display'] = Variable<String>($WalletsTable
          .$converterhomePageWidgetDisplayn
          .toSql(homePageWidgetDisplay.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WalletsCompanion(')
          ..write('walletPk: $walletPk, ')
          ..write('name: $name, ')
          ..write('colour: $colour, ')
          ..write('iconName: $iconName, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('order: $order, ')
          ..write('currency: $currency, ')
          ..write('currencyFormat: $currencyFormat, ')
          ..write('decimals: $decimals, ')
          ..write('homePageWidgetDisplay: $homePageWidgetDisplay, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, TransactionCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _categoryPkMeta =
      const VerificationMeta('categoryPk');
  @override
  late final GeneratedColumn<String> categoryPk = GeneratedColumn<String>(
      'category_pk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _colourMeta = const VerificationMeta('colour');
  @override
  late final GeneratedColumn<String> colour = GeneratedColumn<String>(
      'colour', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _iconNameMeta =
      const VerificationMeta('iconName');
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
      'icon_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emojiIconNameMeta =
      const VerificationMeta('emojiIconName');
  @override
  late final GeneratedColumn<String> emojiIconName = GeneratedColumn<String>(
      'emoji_icon_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => new DateTime.now());
  static const VerificationMeta _dateTimeModifiedMeta =
      const VerificationMeta('dateTimeModified');
  @override
  late final GeneratedColumn<DateTime> dateTimeModified =
      GeneratedColumn<DateTime>('date_time_modified', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _incomeMeta = const VerificationMeta('income');
  @override
  late final GeneratedColumn<bool> income = GeneratedColumn<bool>(
      'income', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("income" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  late final GeneratedColumnWithTypeConverter<MethodAdded?, int> methodAdded =
      GeneratedColumn<int>('method_added', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<MethodAdded?>($CategoriesTable.$convertermethodAddedn);
  static const VerificationMeta _mainCategoryPkMeta =
      const VerificationMeta('mainCategoryPk');
  @override
  late final GeneratedColumn<String> mainCategoryPk = GeneratedColumn<String>(
      'main_category_pk', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories (category_pk)'),
      defaultValue: const Constant(null));
  @override
  List<GeneratedColumn> get $columns => [
        categoryPk,
        name,
        colour,
        iconName,
        emojiIconName,
        dateCreated,
        dateTimeModified,
        order,
        income,
        methodAdded,
        mainCategoryPk
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
      Insertable<TransactionCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category_pk')) {
      context.handle(
          _categoryPkMeta,
          categoryPk.isAcceptableOrUnknown(
              data['category_pk']!, _categoryPkMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('colour')) {
      context.handle(_colourMeta,
          colour.isAcceptableOrUnknown(data['colour']!, _colourMeta));
    }
    if (data.containsKey('icon_name')) {
      context.handle(_iconNameMeta,
          iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta));
    }
    if (data.containsKey('emoji_icon_name')) {
      context.handle(
          _emojiIconNameMeta,
          emojiIconName.isAcceptableOrUnknown(
              data['emoji_icon_name']!, _emojiIconNameMeta));
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_time_modified')) {
      context.handle(
          _dateTimeModifiedMeta,
          dateTimeModified.isAcceptableOrUnknown(
              data['date_time_modified']!, _dateTimeModifiedMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('income')) {
      context.handle(_incomeMeta,
          income.isAcceptableOrUnknown(data['income']!, _incomeMeta));
    }
    if (data.containsKey('main_category_pk')) {
      context.handle(
          _mainCategoryPkMeta,
          mainCategoryPk.isAcceptableOrUnknown(
              data['main_category_pk']!, _mainCategoryPkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {categoryPk};
  @override
  TransactionCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionCategory(
      categoryPk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_pk'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      colour: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}colour']),
      iconName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_name']),
      emojiIconName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}emoji_icon_name']),
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateTimeModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_modified']),
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      income: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}income'])!,
      methodAdded: $CategoriesTable.$convertermethodAddedn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}method_added'])),
      mainCategoryPk: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}main_category_pk']),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MethodAdded, int, int> $convertermethodAdded =
      const EnumIndexConverter<MethodAdded>(MethodAdded.values);
  static JsonTypeConverter2<MethodAdded?, int?, int?> $convertermethodAddedn =
      JsonTypeConverter2.asNullable($convertermethodAdded);
}

class TransactionCategory extends DataClass
    implements Insertable<TransactionCategory> {
  final String categoryPk;
  final String name;
  final String? colour;
  final String? iconName;
  final String? emojiIconName;
  final DateTime dateCreated;
  final DateTime? dateTimeModified;
  final int order;
  final bool income;
  final MethodAdded? methodAdded;
  final String? mainCategoryPk;
  const TransactionCategory(
      {required this.categoryPk,
      required this.name,
      this.colour,
      this.iconName,
      this.emojiIconName,
      required this.dateCreated,
      this.dateTimeModified,
      required this.order,
      required this.income,
      this.methodAdded,
      this.mainCategoryPk});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['category_pk'] = Variable<String>(categoryPk);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || colour != null) {
      map['colour'] = Variable<String>(colour);
    }
    if (!nullToAbsent || iconName != null) {
      map['icon_name'] = Variable<String>(iconName);
    }
    if (!nullToAbsent || emojiIconName != null) {
      map['emoji_icon_name'] = Variable<String>(emojiIconName);
    }
    map['date_created'] = Variable<DateTime>(dateCreated);
    if (!nullToAbsent || dateTimeModified != null) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified);
    }
    map['order'] = Variable<int>(order);
    map['income'] = Variable<bool>(income);
    if (!nullToAbsent || methodAdded != null) {
      map['method_added'] = Variable<int>(
          $CategoriesTable.$convertermethodAddedn.toSql(methodAdded));
    }
    if (!nullToAbsent || mainCategoryPk != null) {
      map['main_category_pk'] = Variable<String>(mainCategoryPk);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      categoryPk: Value(categoryPk),
      name: Value(name),
      colour:
          colour == null && nullToAbsent ? const Value.absent() : Value(colour),
      iconName: iconName == null && nullToAbsent
          ? const Value.absent()
          : Value(iconName),
      emojiIconName: emojiIconName == null && nullToAbsent
          ? const Value.absent()
          : Value(emojiIconName),
      dateCreated: Value(dateCreated),
      dateTimeModified: dateTimeModified == null && nullToAbsent
          ? const Value.absent()
          : Value(dateTimeModified),
      order: Value(order),
      income: Value(income),
      methodAdded: methodAdded == null && nullToAbsent
          ? const Value.absent()
          : Value(methodAdded),
      mainCategoryPk: mainCategoryPk == null && nullToAbsent
          ? const Value.absent()
          : Value(mainCategoryPk),
    );
  }

  factory TransactionCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionCategory(
      categoryPk: serializer.fromJson<String>(json['categoryPk']),
      name: serializer.fromJson<String>(json['name']),
      colour: serializer.fromJson<String?>(json['colour']),
      iconName: serializer.fromJson<String?>(json['iconName']),
      emojiIconName: serializer.fromJson<String?>(json['emojiIconName']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateTimeModified:
          serializer.fromJson<DateTime?>(json['dateTimeModified']),
      order: serializer.fromJson<int>(json['order']),
      income: serializer.fromJson<bool>(json['income']),
      methodAdded: $CategoriesTable.$convertermethodAddedn
          .fromJson(serializer.fromJson<int?>(json['methodAdded'])),
      mainCategoryPk: serializer.fromJson<String?>(json['mainCategoryPk']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'categoryPk': serializer.toJson<String>(categoryPk),
      'name': serializer.toJson<String>(name),
      'colour': serializer.toJson<String?>(colour),
      'iconName': serializer.toJson<String?>(iconName),
      'emojiIconName': serializer.toJson<String?>(emojiIconName),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateTimeModified': serializer.toJson<DateTime?>(dateTimeModified),
      'order': serializer.toJson<int>(order),
      'income': serializer.toJson<bool>(income),
      'methodAdded': serializer.toJson<int?>(
          $CategoriesTable.$convertermethodAddedn.toJson(methodAdded)),
      'mainCategoryPk': serializer.toJson<String?>(mainCategoryPk),
    };
  }

  TransactionCategory copyWith(
          {String? categoryPk,
          String? name,
          Value<String?> colour = const Value.absent(),
          Value<String?> iconName = const Value.absent(),
          Value<String?> emojiIconName = const Value.absent(),
          DateTime? dateCreated,
          Value<DateTime?> dateTimeModified = const Value.absent(),
          int? order,
          bool? income,
          Value<MethodAdded?> methodAdded = const Value.absent(),
          Value<String?> mainCategoryPk = const Value.absent()}) =>
      TransactionCategory(
        categoryPk: categoryPk ?? this.categoryPk,
        name: name ?? this.name,
        colour: colour.present ? colour.value : this.colour,
        iconName: iconName.present ? iconName.value : this.iconName,
        emojiIconName:
            emojiIconName.present ? emojiIconName.value : this.emojiIconName,
        dateCreated: dateCreated ?? this.dateCreated,
        dateTimeModified: dateTimeModified.present
            ? dateTimeModified.value
            : this.dateTimeModified,
        order: order ?? this.order,
        income: income ?? this.income,
        methodAdded: methodAdded.present ? methodAdded.value : this.methodAdded,
        mainCategoryPk:
            mainCategoryPk.present ? mainCategoryPk.value : this.mainCategoryPk,
      );
  TransactionCategory copyWithCompanion(CategoriesCompanion data) {
    return TransactionCategory(
      categoryPk:
          data.categoryPk.present ? data.categoryPk.value : this.categoryPk,
      name: data.name.present ? data.name.value : this.name,
      colour: data.colour.present ? data.colour.value : this.colour,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
      emojiIconName: data.emojiIconName.present
          ? data.emojiIconName.value
          : this.emojiIconName,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateTimeModified: data.dateTimeModified.present
          ? data.dateTimeModified.value
          : this.dateTimeModified,
      order: data.order.present ? data.order.value : this.order,
      income: data.income.present ? data.income.value : this.income,
      methodAdded:
          data.methodAdded.present ? data.methodAdded.value : this.methodAdded,
      mainCategoryPk: data.mainCategoryPk.present
          ? data.mainCategoryPk.value
          : this.mainCategoryPk,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionCategory(')
          ..write('categoryPk: $categoryPk, ')
          ..write('name: $name, ')
          ..write('colour: $colour, ')
          ..write('iconName: $iconName, ')
          ..write('emojiIconName: $emojiIconName, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('order: $order, ')
          ..write('income: $income, ')
          ..write('methodAdded: $methodAdded, ')
          ..write('mainCategoryPk: $mainCategoryPk')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      categoryPk,
      name,
      colour,
      iconName,
      emojiIconName,
      dateCreated,
      dateTimeModified,
      order,
      income,
      methodAdded,
      mainCategoryPk);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionCategory &&
          other.categoryPk == this.categoryPk &&
          other.name == this.name &&
          other.colour == this.colour &&
          other.iconName == this.iconName &&
          other.emojiIconName == this.emojiIconName &&
          other.dateCreated == this.dateCreated &&
          other.dateTimeModified == this.dateTimeModified &&
          other.order == this.order &&
          other.income == this.income &&
          other.methodAdded == this.methodAdded &&
          other.mainCategoryPk == this.mainCategoryPk);
}

class CategoriesCompanion extends UpdateCompanion<TransactionCategory> {
  final Value<String> categoryPk;
  final Value<String> name;
  final Value<String?> colour;
  final Value<String?> iconName;
  final Value<String?> emojiIconName;
  final Value<DateTime> dateCreated;
  final Value<DateTime?> dateTimeModified;
  final Value<int> order;
  final Value<bool> income;
  final Value<MethodAdded?> methodAdded;
  final Value<String?> mainCategoryPk;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.categoryPk = const Value.absent(),
    this.name = const Value.absent(),
    this.colour = const Value.absent(),
    this.iconName = const Value.absent(),
    this.emojiIconName = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.order = const Value.absent(),
    this.income = const Value.absent(),
    this.methodAdded = const Value.absent(),
    this.mainCategoryPk = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.categoryPk = const Value.absent(),
    required String name,
    this.colour = const Value.absent(),
    this.iconName = const Value.absent(),
    this.emojiIconName = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    required int order,
    this.income = const Value.absent(),
    this.methodAdded = const Value.absent(),
    this.mainCategoryPk = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        order = Value(order);
  static Insertable<TransactionCategory> custom({
    Expression<String>? categoryPk,
    Expression<String>? name,
    Expression<String>? colour,
    Expression<String>? iconName,
    Expression<String>? emojiIconName,
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateTimeModified,
    Expression<int>? order,
    Expression<bool>? income,
    Expression<int>? methodAdded,
    Expression<String>? mainCategoryPk,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (categoryPk != null) 'category_pk': categoryPk,
      if (name != null) 'name': name,
      if (colour != null) 'colour': colour,
      if (iconName != null) 'icon_name': iconName,
      if (emojiIconName != null) 'emoji_icon_name': emojiIconName,
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateTimeModified != null) 'date_time_modified': dateTimeModified,
      if (order != null) 'order': order,
      if (income != null) 'income': income,
      if (methodAdded != null) 'method_added': methodAdded,
      if (mainCategoryPk != null) 'main_category_pk': mainCategoryPk,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith(
      {Value<String>? categoryPk,
      Value<String>? name,
      Value<String?>? colour,
      Value<String?>? iconName,
      Value<String?>? emojiIconName,
      Value<DateTime>? dateCreated,
      Value<DateTime?>? dateTimeModified,
      Value<int>? order,
      Value<bool>? income,
      Value<MethodAdded?>? methodAdded,
      Value<String?>? mainCategoryPk,
      Value<int>? rowid}) {
    return CategoriesCompanion(
      categoryPk: categoryPk ?? this.categoryPk,
      name: name ?? this.name,
      colour: colour ?? this.colour,
      iconName: iconName ?? this.iconName,
      emojiIconName: emojiIconName ?? this.emojiIconName,
      dateCreated: dateCreated ?? this.dateCreated,
      dateTimeModified: dateTimeModified ?? this.dateTimeModified,
      order: order ?? this.order,
      income: income ?? this.income,
      methodAdded: methodAdded ?? this.methodAdded,
      mainCategoryPk: mainCategoryPk ?? this.mainCategoryPk,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (categoryPk.present) {
      map['category_pk'] = Variable<String>(categoryPk.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colour.present) {
      map['colour'] = Variable<String>(colour.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (emojiIconName.present) {
      map['emoji_icon_name'] = Variable<String>(emojiIconName.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateTimeModified.present) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (income.present) {
      map['income'] = Variable<bool>(income.value);
    }
    if (methodAdded.present) {
      map['method_added'] = Variable<int>(
          $CategoriesTable.$convertermethodAddedn.toSql(methodAdded.value));
    }
    if (mainCategoryPk.present) {
      map['main_category_pk'] = Variable<String>(mainCategoryPk.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('categoryPk: $categoryPk, ')
          ..write('name: $name, ')
          ..write('colour: $colour, ')
          ..write('iconName: $iconName, ')
          ..write('emojiIconName: $emojiIconName, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('order: $order, ')
          ..write('income: $income, ')
          ..write('methodAdded: $methodAdded, ')
          ..write('mainCategoryPk: $mainCategoryPk, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ObjectivesTable extends Objectives
    with TableInfo<$ObjectivesTable, Objective> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ObjectivesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _objectivePkMeta =
      const VerificationMeta('objectivePk');
  @override
  late final GeneratedColumn<String> objectivePk = GeneratedColumn<String>(
      'objective_pk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  @override
  late final GeneratedColumnWithTypeConverter<ObjectiveType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: Constant(0))
          .withConverter<ObjectiveType>($ObjectivesTable.$convertertype);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _colourMeta = const VerificationMeta('colour');
  @override
  late final GeneratedColumn<String> colour = GeneratedColumn<String>(
      'colour', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => new DateTime.now());
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _dateTimeModifiedMeta =
      const VerificationMeta('dateTimeModified');
  @override
  late final GeneratedColumn<DateTime> dateTimeModified =
      GeneratedColumn<DateTime>('date_time_modified', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _iconNameMeta =
      const VerificationMeta('iconName');
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
      'icon_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emojiIconNameMeta =
      const VerificationMeta('emojiIconName');
  @override
  late final GeneratedColumn<String> emojiIconName = GeneratedColumn<String>(
      'emoji_icon_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _incomeMeta = const VerificationMeta('income');
  @override
  late final GeneratedColumn<bool> income = GeneratedColumn<bool>(
      'income', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("income" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _pinnedMeta = const VerificationMeta('pinned');
  @override
  late final GeneratedColumn<bool> pinned = GeneratedColumn<bool>(
      'pinned', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("pinned" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _archivedMeta =
      const VerificationMeta('archived');
  @override
  late final GeneratedColumn<bool> archived = GeneratedColumn<bool>(
      'archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _walletFkMeta =
      const VerificationMeta('walletFk');
  @override
  late final GeneratedColumn<String> walletFk = GeneratedColumn<String>(
      'wallet_fk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES wallets (wallet_pk)'),
      defaultValue: const Constant("0"));
  @override
  List<GeneratedColumn> get $columns => [
        objectivePk,
        type,
        name,
        amount,
        order,
        colour,
        dateCreated,
        endDate,
        dateTimeModified,
        iconName,
        emojiIconName,
        income,
        pinned,
        archived,
        walletFk
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'objectives';
  @override
  VerificationContext validateIntegrity(Insertable<Objective> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('objective_pk')) {
      context.handle(
          _objectivePkMeta,
          objectivePk.isAcceptableOrUnknown(
              data['objective_pk']!, _objectivePkMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('colour')) {
      context.handle(_colourMeta,
          colour.isAcceptableOrUnknown(data['colour']!, _colourMeta));
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('date_time_modified')) {
      context.handle(
          _dateTimeModifiedMeta,
          dateTimeModified.isAcceptableOrUnknown(
              data['date_time_modified']!, _dateTimeModifiedMeta));
    }
    if (data.containsKey('icon_name')) {
      context.handle(_iconNameMeta,
          iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta));
    }
    if (data.containsKey('emoji_icon_name')) {
      context.handle(
          _emojiIconNameMeta,
          emojiIconName.isAcceptableOrUnknown(
              data['emoji_icon_name']!, _emojiIconNameMeta));
    }
    if (data.containsKey('income')) {
      context.handle(_incomeMeta,
          income.isAcceptableOrUnknown(data['income']!, _incomeMeta));
    }
    if (data.containsKey('pinned')) {
      context.handle(_pinnedMeta,
          pinned.isAcceptableOrUnknown(data['pinned']!, _pinnedMeta));
    }
    if (data.containsKey('archived')) {
      context.handle(_archivedMeta,
          archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta));
    }
    if (data.containsKey('wallet_fk')) {
      context.handle(_walletFkMeta,
          walletFk.isAcceptableOrUnknown(data['wallet_fk']!, _walletFkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {objectivePk};
  @override
  Objective map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Objective(
      objectivePk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}objective_pk'])!,
      type: $ObjectivesTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      colour: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}colour']),
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      dateTimeModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_modified']),
      iconName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_name']),
      emojiIconName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}emoji_icon_name']),
      income: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}income'])!,
      pinned: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}pinned'])!,
      archived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}archived'])!,
      walletFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wallet_fk'])!,
    );
  }

  @override
  $ObjectivesTable createAlias(String alias) {
    return $ObjectivesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ObjectiveType, int, int> $convertertype =
      const EnumIndexConverter<ObjectiveType>(ObjectiveType.values);
}

class Objective extends DataClass implements Insertable<Objective> {
  final String objectivePk;
  final ObjectiveType type;
  final String name;
  final double amount;
  final int order;
  final String? colour;
  final DateTime dateCreated;
  final DateTime? endDate;
  final DateTime? dateTimeModified;
  final String? iconName;
  final String? emojiIconName;
  final bool income;
  final bool pinned;
  final bool archived;
  final String walletFk;
  const Objective(
      {required this.objectivePk,
      required this.type,
      required this.name,
      required this.amount,
      required this.order,
      this.colour,
      required this.dateCreated,
      this.endDate,
      this.dateTimeModified,
      this.iconName,
      this.emojiIconName,
      required this.income,
      required this.pinned,
      required this.archived,
      required this.walletFk});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['objective_pk'] = Variable<String>(objectivePk);
    {
      map['type'] = Variable<int>($ObjectivesTable.$convertertype.toSql(type));
    }
    map['name'] = Variable<String>(name);
    map['amount'] = Variable<double>(amount);
    map['order'] = Variable<int>(order);
    if (!nullToAbsent || colour != null) {
      map['colour'] = Variable<String>(colour);
    }
    map['date_created'] = Variable<DateTime>(dateCreated);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || dateTimeModified != null) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified);
    }
    if (!nullToAbsent || iconName != null) {
      map['icon_name'] = Variable<String>(iconName);
    }
    if (!nullToAbsent || emojiIconName != null) {
      map['emoji_icon_name'] = Variable<String>(emojiIconName);
    }
    map['income'] = Variable<bool>(income);
    map['pinned'] = Variable<bool>(pinned);
    map['archived'] = Variable<bool>(archived);
    map['wallet_fk'] = Variable<String>(walletFk);
    return map;
  }

  ObjectivesCompanion toCompanion(bool nullToAbsent) {
    return ObjectivesCompanion(
      objectivePk: Value(objectivePk),
      type: Value(type),
      name: Value(name),
      amount: Value(amount),
      order: Value(order),
      colour:
          colour == null && nullToAbsent ? const Value.absent() : Value(colour),
      dateCreated: Value(dateCreated),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      dateTimeModified: dateTimeModified == null && nullToAbsent
          ? const Value.absent()
          : Value(dateTimeModified),
      iconName: iconName == null && nullToAbsent
          ? const Value.absent()
          : Value(iconName),
      emojiIconName: emojiIconName == null && nullToAbsent
          ? const Value.absent()
          : Value(emojiIconName),
      income: Value(income),
      pinned: Value(pinned),
      archived: Value(archived),
      walletFk: Value(walletFk),
    );
  }

  factory Objective.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Objective(
      objectivePk: serializer.fromJson<String>(json['objectivePk']),
      type: $ObjectivesTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      name: serializer.fromJson<String>(json['name']),
      amount: serializer.fromJson<double>(json['amount']),
      order: serializer.fromJson<int>(json['order']),
      colour: serializer.fromJson<String?>(json['colour']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      dateTimeModified:
          serializer.fromJson<DateTime?>(json['dateTimeModified']),
      iconName: serializer.fromJson<String?>(json['iconName']),
      emojiIconName: serializer.fromJson<String?>(json['emojiIconName']),
      income: serializer.fromJson<bool>(json['income']),
      pinned: serializer.fromJson<bool>(json['pinned']),
      archived: serializer.fromJson<bool>(json['archived']),
      walletFk: serializer.fromJson<String>(json['walletFk']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'objectivePk': serializer.toJson<String>(objectivePk),
      'type':
          serializer.toJson<int>($ObjectivesTable.$convertertype.toJson(type)),
      'name': serializer.toJson<String>(name),
      'amount': serializer.toJson<double>(amount),
      'order': serializer.toJson<int>(order),
      'colour': serializer.toJson<String?>(colour),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'dateTimeModified': serializer.toJson<DateTime?>(dateTimeModified),
      'iconName': serializer.toJson<String?>(iconName),
      'emojiIconName': serializer.toJson<String?>(emojiIconName),
      'income': serializer.toJson<bool>(income),
      'pinned': serializer.toJson<bool>(pinned),
      'archived': serializer.toJson<bool>(archived),
      'walletFk': serializer.toJson<String>(walletFk),
    };
  }

  Objective copyWith(
          {String? objectivePk,
          ObjectiveType? type,
          String? name,
          double? amount,
          int? order,
          Value<String?> colour = const Value.absent(),
          DateTime? dateCreated,
          Value<DateTime?> endDate = const Value.absent(),
          Value<DateTime?> dateTimeModified = const Value.absent(),
          Value<String?> iconName = const Value.absent(),
          Value<String?> emojiIconName = const Value.absent(),
          bool? income,
          bool? pinned,
          bool? archived,
          String? walletFk}) =>
      Objective(
        objectivePk: objectivePk ?? this.objectivePk,
        type: type ?? this.type,
        name: name ?? this.name,
        amount: amount ?? this.amount,
        order: order ?? this.order,
        colour: colour.present ? colour.value : this.colour,
        dateCreated: dateCreated ?? this.dateCreated,
        endDate: endDate.present ? endDate.value : this.endDate,
        dateTimeModified: dateTimeModified.present
            ? dateTimeModified.value
            : this.dateTimeModified,
        iconName: iconName.present ? iconName.value : this.iconName,
        emojiIconName:
            emojiIconName.present ? emojiIconName.value : this.emojiIconName,
        income: income ?? this.income,
        pinned: pinned ?? this.pinned,
        archived: archived ?? this.archived,
        walletFk: walletFk ?? this.walletFk,
      );
  Objective copyWithCompanion(ObjectivesCompanion data) {
    return Objective(
      objectivePk:
          data.objectivePk.present ? data.objectivePk.value : this.objectivePk,
      type: data.type.present ? data.type.value : this.type,
      name: data.name.present ? data.name.value : this.name,
      amount: data.amount.present ? data.amount.value : this.amount,
      order: data.order.present ? data.order.value : this.order,
      colour: data.colour.present ? data.colour.value : this.colour,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      dateTimeModified: data.dateTimeModified.present
          ? data.dateTimeModified.value
          : this.dateTimeModified,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
      emojiIconName: data.emojiIconName.present
          ? data.emojiIconName.value
          : this.emojiIconName,
      income: data.income.present ? data.income.value : this.income,
      pinned: data.pinned.present ? data.pinned.value : this.pinned,
      archived: data.archived.present ? data.archived.value : this.archived,
      walletFk: data.walletFk.present ? data.walletFk.value : this.walletFk,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Objective(')
          ..write('objectivePk: $objectivePk, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('order: $order, ')
          ..write('colour: $colour, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('endDate: $endDate, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('iconName: $iconName, ')
          ..write('emojiIconName: $emojiIconName, ')
          ..write('income: $income, ')
          ..write('pinned: $pinned, ')
          ..write('archived: $archived, ')
          ..write('walletFk: $walletFk')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      objectivePk,
      type,
      name,
      amount,
      order,
      colour,
      dateCreated,
      endDate,
      dateTimeModified,
      iconName,
      emojiIconName,
      income,
      pinned,
      archived,
      walletFk);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Objective &&
          other.objectivePk == this.objectivePk &&
          other.type == this.type &&
          other.name == this.name &&
          other.amount == this.amount &&
          other.order == this.order &&
          other.colour == this.colour &&
          other.dateCreated == this.dateCreated &&
          other.endDate == this.endDate &&
          other.dateTimeModified == this.dateTimeModified &&
          other.iconName == this.iconName &&
          other.emojiIconName == this.emojiIconName &&
          other.income == this.income &&
          other.pinned == this.pinned &&
          other.archived == this.archived &&
          other.walletFk == this.walletFk);
}

class ObjectivesCompanion extends UpdateCompanion<Objective> {
  final Value<String> objectivePk;
  final Value<ObjectiveType> type;
  final Value<String> name;
  final Value<double> amount;
  final Value<int> order;
  final Value<String?> colour;
  final Value<DateTime> dateCreated;
  final Value<DateTime?> endDate;
  final Value<DateTime?> dateTimeModified;
  final Value<String?> iconName;
  final Value<String?> emojiIconName;
  final Value<bool> income;
  final Value<bool> pinned;
  final Value<bool> archived;
  final Value<String> walletFk;
  final Value<int> rowid;
  const ObjectivesCompanion({
    this.objectivePk = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.amount = const Value.absent(),
    this.order = const Value.absent(),
    this.colour = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.endDate = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.iconName = const Value.absent(),
    this.emojiIconName = const Value.absent(),
    this.income = const Value.absent(),
    this.pinned = const Value.absent(),
    this.archived = const Value.absent(),
    this.walletFk = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ObjectivesCompanion.insert({
    this.objectivePk = const Value.absent(),
    this.type = const Value.absent(),
    required String name,
    required double amount,
    required int order,
    this.colour = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.endDate = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.iconName = const Value.absent(),
    this.emojiIconName = const Value.absent(),
    this.income = const Value.absent(),
    this.pinned = const Value.absent(),
    this.archived = const Value.absent(),
    this.walletFk = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        amount = Value(amount),
        order = Value(order);
  static Insertable<Objective> custom({
    Expression<String>? objectivePk,
    Expression<int>? type,
    Expression<String>? name,
    Expression<double>? amount,
    Expression<int>? order,
    Expression<String>? colour,
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? endDate,
    Expression<DateTime>? dateTimeModified,
    Expression<String>? iconName,
    Expression<String>? emojiIconName,
    Expression<bool>? income,
    Expression<bool>? pinned,
    Expression<bool>? archived,
    Expression<String>? walletFk,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (objectivePk != null) 'objective_pk': objectivePk,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (amount != null) 'amount': amount,
      if (order != null) 'order': order,
      if (colour != null) 'colour': colour,
      if (dateCreated != null) 'date_created': dateCreated,
      if (endDate != null) 'end_date': endDate,
      if (dateTimeModified != null) 'date_time_modified': dateTimeModified,
      if (iconName != null) 'icon_name': iconName,
      if (emojiIconName != null) 'emoji_icon_name': emojiIconName,
      if (income != null) 'income': income,
      if (pinned != null) 'pinned': pinned,
      if (archived != null) 'archived': archived,
      if (walletFk != null) 'wallet_fk': walletFk,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ObjectivesCompanion copyWith(
      {Value<String>? objectivePk,
      Value<ObjectiveType>? type,
      Value<String>? name,
      Value<double>? amount,
      Value<int>? order,
      Value<String?>? colour,
      Value<DateTime>? dateCreated,
      Value<DateTime?>? endDate,
      Value<DateTime?>? dateTimeModified,
      Value<String?>? iconName,
      Value<String?>? emojiIconName,
      Value<bool>? income,
      Value<bool>? pinned,
      Value<bool>? archived,
      Value<String>? walletFk,
      Value<int>? rowid}) {
    return ObjectivesCompanion(
      objectivePk: objectivePk ?? this.objectivePk,
      type: type ?? this.type,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      order: order ?? this.order,
      colour: colour ?? this.colour,
      dateCreated: dateCreated ?? this.dateCreated,
      endDate: endDate ?? this.endDate,
      dateTimeModified: dateTimeModified ?? this.dateTimeModified,
      iconName: iconName ?? this.iconName,
      emojiIconName: emojiIconName ?? this.emojiIconName,
      income: income ?? this.income,
      pinned: pinned ?? this.pinned,
      archived: archived ?? this.archived,
      walletFk: walletFk ?? this.walletFk,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (objectivePk.present) {
      map['objective_pk'] = Variable<String>(objectivePk.value);
    }
    if (type.present) {
      map['type'] =
          Variable<int>($ObjectivesTable.$convertertype.toSql(type.value));
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (colour.present) {
      map['colour'] = Variable<String>(colour.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (dateTimeModified.present) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (emojiIconName.present) {
      map['emoji_icon_name'] = Variable<String>(emojiIconName.value);
    }
    if (income.present) {
      map['income'] = Variable<bool>(income.value);
    }
    if (pinned.present) {
      map['pinned'] = Variable<bool>(pinned.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (walletFk.present) {
      map['wallet_fk'] = Variable<String>(walletFk.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObjectivesCompanion(')
          ..write('objectivePk: $objectivePk, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('order: $order, ')
          ..write('colour: $colour, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('endDate: $endDate, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('iconName: $iconName, ')
          ..write('emojiIconName: $emojiIconName, ')
          ..write('income: $income, ')
          ..write('pinned: $pinned, ')
          ..write('archived: $archived, ')
          ..write('walletFk: $walletFk, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _transactionPkMeta =
      const VerificationMeta('transactionPk');
  @override
  late final GeneratedColumn<String> transactionPk = GeneratedColumn<String>(
      'transaction_pk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _pairedTransactionFkMeta =
      const VerificationMeta('pairedTransactionFk');
  @override
  late final GeneratedColumn<String> pairedTransactionFk =
      GeneratedColumn<String>('paired_transaction_fk', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES transactions (transaction_pk)'),
          defaultValue: const Constant(null));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryFkMeta =
      const VerificationMeta('categoryFk');
  @override
  late final GeneratedColumn<String> categoryFk = GeneratedColumn<String>(
      'category_fk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories (category_pk)'));
  static const VerificationMeta _subCategoryFkMeta =
      const VerificationMeta('subCategoryFk');
  @override
  late final GeneratedColumn<String> subCategoryFk = GeneratedColumn<String>(
      'sub_category_fk', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories (category_pk)'),
      defaultValue: const Constant(null));
  static const VerificationMeta _walletFkMeta =
      const VerificationMeta('walletFk');
  @override
  late final GeneratedColumn<String> walletFk = GeneratedColumn<String>(
      'wallet_fk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES wallets (wallet_pk)'),
      defaultValue: const Constant("0"));
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => new DateTime.now());
  static const VerificationMeta _dateTimeModifiedMeta =
      const VerificationMeta('dateTimeModified');
  @override
  late final GeneratedColumn<DateTime> dateTimeModified =
      GeneratedColumn<DateTime>('date_time_modified', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _originalDateDueMeta =
      const VerificationMeta('originalDateDue');
  @override
  late final GeneratedColumn<DateTime> originalDateDue =
      GeneratedColumn<DateTime>('original_date_due', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _incomeMeta = const VerificationMeta('income');
  @override
  late final GeneratedColumn<bool> income = GeneratedColumn<bool>(
      'income', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("income" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _periodLengthMeta =
      const VerificationMeta('periodLength');
  @override
  late final GeneratedColumn<int> periodLength = GeneratedColumn<int>(
      'period_length', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<BudgetReoccurence?, int>
      reoccurrence = GeneratedColumn<int>('reoccurrence', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<BudgetReoccurence?>(
              $TransactionsTable.$converterreoccurrencen);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _upcomingTransactionNotificationMeta =
      const VerificationMeta('upcomingTransactionNotification');
  @override
  late final GeneratedColumn<bool> upcomingTransactionNotification =
      GeneratedColumn<bool>(
          'upcoming_transaction_notification', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("upcoming_transaction_notification" IN (0, 1))'),
          defaultValue: const Constant(true));
  @override
  late final GeneratedColumnWithTypeConverter<TransactionSpecialType?, int>
      type = GeneratedColumn<int>('type', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<TransactionSpecialType?>(
              $TransactionsTable.$convertertypen);
  static const VerificationMeta _paidMeta = const VerificationMeta('paid');
  @override
  late final GeneratedColumn<bool> paid = GeneratedColumn<bool>(
      'paid', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("paid" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAnotherFutureTransactionMeta =
      const VerificationMeta('createdAnotherFutureTransaction');
  @override
  late final GeneratedColumn<bool> createdAnotherFutureTransaction =
      GeneratedColumn<bool>(
          'created_another_future_transaction', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("created_another_future_transaction" IN (0, 1))'),
          defaultValue: const Constant(false));
  static const VerificationMeta _skipPaidMeta =
      const VerificationMeta('skipPaid');
  @override
  late final GeneratedColumn<bool> skipPaid = GeneratedColumn<bool>(
      'skip_paid', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("skip_paid" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  late final GeneratedColumnWithTypeConverter<MethodAdded?, int> methodAdded =
      GeneratedColumn<int>('method_added', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<MethodAdded?>(
              $TransactionsTable.$convertermethodAddedn);
  static const VerificationMeta _transactionOwnerEmailMeta =
      const VerificationMeta('transactionOwnerEmail');
  @override
  late final GeneratedColumn<String> transactionOwnerEmail =
      GeneratedColumn<String>('transaction_owner_email', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _transactionOriginalOwnerEmailMeta =
      const VerificationMeta('transactionOriginalOwnerEmail');
  @override
  late final GeneratedColumn<String> transactionOriginalOwnerEmail =
      GeneratedColumn<String>(
          'transaction_original_owner_email', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sharedKeyMeta =
      const VerificationMeta('sharedKey');
  @override
  late final GeneratedColumn<String> sharedKey = GeneratedColumn<String>(
      'shared_key', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sharedOldKeyMeta =
      const VerificationMeta('sharedOldKey');
  @override
  late final GeneratedColumn<String> sharedOldKey = GeneratedColumn<String>(
      'shared_old_key', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<SharedStatus?, int> sharedStatus =
      GeneratedColumn<int>('shared_status', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<SharedStatus?>(
              $TransactionsTable.$convertersharedStatusn);
  static const VerificationMeta _sharedDateUpdatedMeta =
      const VerificationMeta('sharedDateUpdated');
  @override
  late final GeneratedColumn<DateTime> sharedDateUpdated =
      GeneratedColumn<DateTime>('shared_date_updated', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _sharedReferenceBudgetPkMeta =
      const VerificationMeta('sharedReferenceBudgetPk');
  @override
  late final GeneratedColumn<String> sharedReferenceBudgetPk =
      GeneratedColumn<String>('shared_reference_budget_pk', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _objectiveFkMeta =
      const VerificationMeta('objectiveFk');
  @override
  late final GeneratedColumn<String> objectiveFk = GeneratedColumn<String>(
      'objective_fk', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES objectives (objective_pk)'));
  static const VerificationMeta _objectiveLoanFkMeta =
      const VerificationMeta('objectiveLoanFk');
  @override
  late final GeneratedColumn<String> objectiveLoanFk = GeneratedColumn<String>(
      'objective_loan_fk', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES objectives (objective_pk)'));
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      budgetFksExclude = GeneratedColumn<String>(
              'budget_fks_exclude', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(
              $TransactionsTable.$converterbudgetFksExcluden);
  @override
  List<GeneratedColumn> get $columns => [
        transactionPk,
        pairedTransactionFk,
        name,
        amount,
        note,
        categoryFk,
        subCategoryFk,
        walletFk,
        dateCreated,
        dateTimeModified,
        originalDateDue,
        income,
        periodLength,
        reoccurrence,
        endDate,
        upcomingTransactionNotification,
        type,
        paid,
        createdAnotherFutureTransaction,
        skipPaid,
        methodAdded,
        transactionOwnerEmail,
        transactionOriginalOwnerEmail,
        sharedKey,
        sharedOldKey,
        sharedStatus,
        sharedDateUpdated,
        sharedReferenceBudgetPk,
        objectiveFk,
        objectiveLoanFk,
        budgetFksExclude
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('transaction_pk')) {
      context.handle(
          _transactionPkMeta,
          transactionPk.isAcceptableOrUnknown(
              data['transaction_pk']!, _transactionPkMeta));
    }
    if (data.containsKey('paired_transaction_fk')) {
      context.handle(
          _pairedTransactionFkMeta,
          pairedTransactionFk.isAcceptableOrUnknown(
              data['paired_transaction_fk']!, _pairedTransactionFkMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('category_fk')) {
      context.handle(
          _categoryFkMeta,
          categoryFk.isAcceptableOrUnknown(
              data['category_fk']!, _categoryFkMeta));
    } else if (isInserting) {
      context.missing(_categoryFkMeta);
    }
    if (data.containsKey('sub_category_fk')) {
      context.handle(
          _subCategoryFkMeta,
          subCategoryFk.isAcceptableOrUnknown(
              data['sub_category_fk']!, _subCategoryFkMeta));
    }
    if (data.containsKey('wallet_fk')) {
      context.handle(_walletFkMeta,
          walletFk.isAcceptableOrUnknown(data['wallet_fk']!, _walletFkMeta));
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_time_modified')) {
      context.handle(
          _dateTimeModifiedMeta,
          dateTimeModified.isAcceptableOrUnknown(
              data['date_time_modified']!, _dateTimeModifiedMeta));
    }
    if (data.containsKey('original_date_due')) {
      context.handle(
          _originalDateDueMeta,
          originalDateDue.isAcceptableOrUnknown(
              data['original_date_due']!, _originalDateDueMeta));
    }
    if (data.containsKey('income')) {
      context.handle(_incomeMeta,
          income.isAcceptableOrUnknown(data['income']!, _incomeMeta));
    }
    if (data.containsKey('period_length')) {
      context.handle(
          _periodLengthMeta,
          periodLength.isAcceptableOrUnknown(
              data['period_length']!, _periodLengthMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('upcoming_transaction_notification')) {
      context.handle(
          _upcomingTransactionNotificationMeta,
          upcomingTransactionNotification.isAcceptableOrUnknown(
              data['upcoming_transaction_notification']!,
              _upcomingTransactionNotificationMeta));
    }
    if (data.containsKey('paid')) {
      context.handle(
          _paidMeta, paid.isAcceptableOrUnknown(data['paid']!, _paidMeta));
    }
    if (data.containsKey('created_another_future_transaction')) {
      context.handle(
          _createdAnotherFutureTransactionMeta,
          createdAnotherFutureTransaction.isAcceptableOrUnknown(
              data['created_another_future_transaction']!,
              _createdAnotherFutureTransactionMeta));
    }
    if (data.containsKey('skip_paid')) {
      context.handle(_skipPaidMeta,
          skipPaid.isAcceptableOrUnknown(data['skip_paid']!, _skipPaidMeta));
    }
    if (data.containsKey('transaction_owner_email')) {
      context.handle(
          _transactionOwnerEmailMeta,
          transactionOwnerEmail.isAcceptableOrUnknown(
              data['transaction_owner_email']!, _transactionOwnerEmailMeta));
    }
    if (data.containsKey('transaction_original_owner_email')) {
      context.handle(
          _transactionOriginalOwnerEmailMeta,
          transactionOriginalOwnerEmail.isAcceptableOrUnknown(
              data['transaction_original_owner_email']!,
              _transactionOriginalOwnerEmailMeta));
    }
    if (data.containsKey('shared_key')) {
      context.handle(_sharedKeyMeta,
          sharedKey.isAcceptableOrUnknown(data['shared_key']!, _sharedKeyMeta));
    }
    if (data.containsKey('shared_old_key')) {
      context.handle(
          _sharedOldKeyMeta,
          sharedOldKey.isAcceptableOrUnknown(
              data['shared_old_key']!, _sharedOldKeyMeta));
    }
    if (data.containsKey('shared_date_updated')) {
      context.handle(
          _sharedDateUpdatedMeta,
          sharedDateUpdated.isAcceptableOrUnknown(
              data['shared_date_updated']!, _sharedDateUpdatedMeta));
    }
    if (data.containsKey('shared_reference_budget_pk')) {
      context.handle(
          _sharedReferenceBudgetPkMeta,
          sharedReferenceBudgetPk.isAcceptableOrUnknown(
              data['shared_reference_budget_pk']!,
              _sharedReferenceBudgetPkMeta));
    }
    if (data.containsKey('objective_fk')) {
      context.handle(
          _objectiveFkMeta,
          objectiveFk.isAcceptableOrUnknown(
              data['objective_fk']!, _objectiveFkMeta));
    }
    if (data.containsKey('objective_loan_fk')) {
      context.handle(
          _objectiveLoanFkMeta,
          objectiveLoanFk.isAcceptableOrUnknown(
              data['objective_loan_fk']!, _objectiveLoanFkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {transactionPk};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      transactionPk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transaction_pk'])!,
      pairedTransactionFk: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}paired_transaction_fk']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      categoryFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_fk'])!,
      subCategoryFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sub_category_fk']),
      walletFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wallet_fk'])!,
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateTimeModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_modified']),
      originalDateDue: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}original_date_due']),
      income: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}income'])!,
      periodLength: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}period_length']),
      reoccurrence: $TransactionsTable.$converterreoccurrencen.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}reoccurrence'])),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      upcomingTransactionNotification: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}upcoming_transaction_notification']),
      type: $TransactionsTable.$convertertypen.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])),
      paid: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}paid'])!,
      createdAnotherFutureTransaction: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}created_another_future_transaction']),
      skipPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}skip_paid'])!,
      methodAdded: $TransactionsTable.$convertermethodAddedn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}method_added'])),
      transactionOwnerEmail: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}transaction_owner_email']),
      transactionOriginalOwnerEmail: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}transaction_original_owner_email']),
      sharedKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shared_key']),
      sharedOldKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shared_old_key']),
      sharedStatus: $TransactionsTable.$convertersharedStatusn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}shared_status'])),
      sharedDateUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}shared_date_updated']),
      sharedReferenceBudgetPk: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}shared_reference_budget_pk']),
      objectiveFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}objective_fk']),
      objectiveLoanFk: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}objective_loan_fk']),
      budgetFksExclude: $TransactionsTable.$converterbudgetFksExcluden.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}budget_fks_exclude'])),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<BudgetReoccurence, int, int>
      $converterreoccurrence =
      const EnumIndexConverter<BudgetReoccurence>(BudgetReoccurence.values);
  static JsonTypeConverter2<BudgetReoccurence?, int?, int?>
      $converterreoccurrencen =
      JsonTypeConverter2.asNullable($converterreoccurrence);
  static JsonTypeConverter2<TransactionSpecialType, int, int> $convertertype =
      const EnumIndexConverter<TransactionSpecialType>(
          TransactionSpecialType.values);
  static JsonTypeConverter2<TransactionSpecialType?, int?, int?>
      $convertertypen = JsonTypeConverter2.asNullable($convertertype);
  static JsonTypeConverter2<MethodAdded, int, int> $convertermethodAdded =
      const EnumIndexConverter<MethodAdded>(MethodAdded.values);
  static JsonTypeConverter2<MethodAdded?, int?, int?> $convertermethodAddedn =
      JsonTypeConverter2.asNullable($convertermethodAdded);
  static JsonTypeConverter2<SharedStatus, int, int> $convertersharedStatus =
      const EnumIndexConverter<SharedStatus>(SharedStatus.values);
  static JsonTypeConverter2<SharedStatus?, int?, int?> $convertersharedStatusn =
      JsonTypeConverter2.asNullable($convertersharedStatus);
  static TypeConverter<List<String>, String> $converterbudgetFksExclude =
      const StringListInColumnConverter();
  static TypeConverter<List<String>?, String?> $converterbudgetFksExcluden =
      NullAwareTypeConverter.wrap($converterbudgetFksExclude);
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final String transactionPk;
  final String? pairedTransactionFk;
  final String name;
  final double amount;
  final String note;
  final String categoryFk;
  final String? subCategoryFk;
  final String walletFk;
  final DateTime dateCreated;
  final DateTime? dateTimeModified;
  final DateTime? originalDateDue;
  final bool income;
  final int? periodLength;
  final BudgetReoccurence? reoccurrence;
  final DateTime? endDate;
  final bool? upcomingTransactionNotification;
  final TransactionSpecialType? type;
  final bool paid;
  final bool? createdAnotherFutureTransaction;
  final bool skipPaid;
  final MethodAdded? methodAdded;
  final String? transactionOwnerEmail;
  final String? transactionOriginalOwnerEmail;
  final String? sharedKey;
  final String? sharedOldKey;
  final SharedStatus? sharedStatus;
  final DateTime? sharedDateUpdated;
  final String? sharedReferenceBudgetPk;
  final String? objectiveFk;
  final String? objectiveLoanFk;
  final List<String>? budgetFksExclude;
  const Transaction(
      {required this.transactionPk,
      this.pairedTransactionFk,
      required this.name,
      required this.amount,
      required this.note,
      required this.categoryFk,
      this.subCategoryFk,
      required this.walletFk,
      required this.dateCreated,
      this.dateTimeModified,
      this.originalDateDue,
      required this.income,
      this.periodLength,
      this.reoccurrence,
      this.endDate,
      this.upcomingTransactionNotification,
      this.type,
      required this.paid,
      this.createdAnotherFutureTransaction,
      required this.skipPaid,
      this.methodAdded,
      this.transactionOwnerEmail,
      this.transactionOriginalOwnerEmail,
      this.sharedKey,
      this.sharedOldKey,
      this.sharedStatus,
      this.sharedDateUpdated,
      this.sharedReferenceBudgetPk,
      this.objectiveFk,
      this.objectiveLoanFk,
      this.budgetFksExclude});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['transaction_pk'] = Variable<String>(transactionPk);
    if (!nullToAbsent || pairedTransactionFk != null) {
      map['paired_transaction_fk'] = Variable<String>(pairedTransactionFk);
    }
    map['name'] = Variable<String>(name);
    map['amount'] = Variable<double>(amount);
    map['note'] = Variable<String>(note);
    map['category_fk'] = Variable<String>(categoryFk);
    if (!nullToAbsent || subCategoryFk != null) {
      map['sub_category_fk'] = Variable<String>(subCategoryFk);
    }
    map['wallet_fk'] = Variable<String>(walletFk);
    map['date_created'] = Variable<DateTime>(dateCreated);
    if (!nullToAbsent || dateTimeModified != null) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified);
    }
    if (!nullToAbsent || originalDateDue != null) {
      map['original_date_due'] = Variable<DateTime>(originalDateDue);
    }
    map['income'] = Variable<bool>(income);
    if (!nullToAbsent || periodLength != null) {
      map['period_length'] = Variable<int>(periodLength);
    }
    if (!nullToAbsent || reoccurrence != null) {
      map['reoccurrence'] = Variable<int>(
          $TransactionsTable.$converterreoccurrencen.toSql(reoccurrence));
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || upcomingTransactionNotification != null) {
      map['upcoming_transaction_notification'] =
          Variable<bool>(upcomingTransactionNotification);
    }
    if (!nullToAbsent || type != null) {
      map['type'] =
          Variable<int>($TransactionsTable.$convertertypen.toSql(type));
    }
    map['paid'] = Variable<bool>(paid);
    if (!nullToAbsent || createdAnotherFutureTransaction != null) {
      map['created_another_future_transaction'] =
          Variable<bool>(createdAnotherFutureTransaction);
    }
    map['skip_paid'] = Variable<bool>(skipPaid);
    if (!nullToAbsent || methodAdded != null) {
      map['method_added'] = Variable<int>(
          $TransactionsTable.$convertermethodAddedn.toSql(methodAdded));
    }
    if (!nullToAbsent || transactionOwnerEmail != null) {
      map['transaction_owner_email'] = Variable<String>(transactionOwnerEmail);
    }
    if (!nullToAbsent || transactionOriginalOwnerEmail != null) {
      map['transaction_original_owner_email'] =
          Variable<String>(transactionOriginalOwnerEmail);
    }
    if (!nullToAbsent || sharedKey != null) {
      map['shared_key'] = Variable<String>(sharedKey);
    }
    if (!nullToAbsent || sharedOldKey != null) {
      map['shared_old_key'] = Variable<String>(sharedOldKey);
    }
    if (!nullToAbsent || sharedStatus != null) {
      map['shared_status'] = Variable<int>(
          $TransactionsTable.$convertersharedStatusn.toSql(sharedStatus));
    }
    if (!nullToAbsent || sharedDateUpdated != null) {
      map['shared_date_updated'] = Variable<DateTime>(sharedDateUpdated);
    }
    if (!nullToAbsent || sharedReferenceBudgetPk != null) {
      map['shared_reference_budget_pk'] =
          Variable<String>(sharedReferenceBudgetPk);
    }
    if (!nullToAbsent || objectiveFk != null) {
      map['objective_fk'] = Variable<String>(objectiveFk);
    }
    if (!nullToAbsent || objectiveLoanFk != null) {
      map['objective_loan_fk'] = Variable<String>(objectiveLoanFk);
    }
    if (!nullToAbsent || budgetFksExclude != null) {
      map['budget_fks_exclude'] = Variable<String>($TransactionsTable
          .$converterbudgetFksExcluden
          .toSql(budgetFksExclude));
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      transactionPk: Value(transactionPk),
      pairedTransactionFk: pairedTransactionFk == null && nullToAbsent
          ? const Value.absent()
          : Value(pairedTransactionFk),
      name: Value(name),
      amount: Value(amount),
      note: Value(note),
      categoryFk: Value(categoryFk),
      subCategoryFk: subCategoryFk == null && nullToAbsent
          ? const Value.absent()
          : Value(subCategoryFk),
      walletFk: Value(walletFk),
      dateCreated: Value(dateCreated),
      dateTimeModified: dateTimeModified == null && nullToAbsent
          ? const Value.absent()
          : Value(dateTimeModified),
      originalDateDue: originalDateDue == null && nullToAbsent
          ? const Value.absent()
          : Value(originalDateDue),
      income: Value(income),
      periodLength: periodLength == null && nullToAbsent
          ? const Value.absent()
          : Value(periodLength),
      reoccurrence: reoccurrence == null && nullToAbsent
          ? const Value.absent()
          : Value(reoccurrence),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      upcomingTransactionNotification:
          upcomingTransactionNotification == null && nullToAbsent
              ? const Value.absent()
              : Value(upcomingTransactionNotification),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      paid: Value(paid),
      createdAnotherFutureTransaction:
          createdAnotherFutureTransaction == null && nullToAbsent
              ? const Value.absent()
              : Value(createdAnotherFutureTransaction),
      skipPaid: Value(skipPaid),
      methodAdded: methodAdded == null && nullToAbsent
          ? const Value.absent()
          : Value(methodAdded),
      transactionOwnerEmail: transactionOwnerEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionOwnerEmail),
      transactionOriginalOwnerEmail:
          transactionOriginalOwnerEmail == null && nullToAbsent
              ? const Value.absent()
              : Value(transactionOriginalOwnerEmail),
      sharedKey: sharedKey == null && nullToAbsent
          ? const Value.absent()
          : Value(sharedKey),
      sharedOldKey: sharedOldKey == null && nullToAbsent
          ? const Value.absent()
          : Value(sharedOldKey),
      sharedStatus: sharedStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(sharedStatus),
      sharedDateUpdated: sharedDateUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(sharedDateUpdated),
      sharedReferenceBudgetPk: sharedReferenceBudgetPk == null && nullToAbsent
          ? const Value.absent()
          : Value(sharedReferenceBudgetPk),
      objectiveFk: objectiveFk == null && nullToAbsent
          ? const Value.absent()
          : Value(objectiveFk),
      objectiveLoanFk: objectiveLoanFk == null && nullToAbsent
          ? const Value.absent()
          : Value(objectiveLoanFk),
      budgetFksExclude: budgetFksExclude == null && nullToAbsent
          ? const Value.absent()
          : Value(budgetFksExclude),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      transactionPk: serializer.fromJson<String>(json['transactionPk']),
      pairedTransactionFk:
          serializer.fromJson<String?>(json['pairedTransactionFk']),
      name: serializer.fromJson<String>(json['name']),
      amount: serializer.fromJson<double>(json['amount']),
      note: serializer.fromJson<String>(json['note']),
      categoryFk: serializer.fromJson<String>(json['categoryFk']),
      subCategoryFk: serializer.fromJson<String?>(json['subCategoryFk']),
      walletFk: serializer.fromJson<String>(json['walletFk']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateTimeModified:
          serializer.fromJson<DateTime?>(json['dateTimeModified']),
      originalDateDue: serializer.fromJson<DateTime?>(json['originalDateDue']),
      income: serializer.fromJson<bool>(json['income']),
      periodLength: serializer.fromJson<int?>(json['periodLength']),
      reoccurrence: $TransactionsTable.$converterreoccurrencen
          .fromJson(serializer.fromJson<int?>(json['reoccurrence'])),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      upcomingTransactionNotification:
          serializer.fromJson<bool?>(json['upcomingTransactionNotification']),
      type: $TransactionsTable.$convertertypen
          .fromJson(serializer.fromJson<int?>(json['type'])),
      paid: serializer.fromJson<bool>(json['paid']),
      createdAnotherFutureTransaction:
          serializer.fromJson<bool?>(json['createdAnotherFutureTransaction']),
      skipPaid: serializer.fromJson<bool>(json['skipPaid']),
      methodAdded: $TransactionsTable.$convertermethodAddedn
          .fromJson(serializer.fromJson<int?>(json['methodAdded'])),
      transactionOwnerEmail:
          serializer.fromJson<String?>(json['transactionOwnerEmail']),
      transactionOriginalOwnerEmail:
          serializer.fromJson<String?>(json['transactionOriginalOwnerEmail']),
      sharedKey: serializer.fromJson<String?>(json['sharedKey']),
      sharedOldKey: serializer.fromJson<String?>(json['sharedOldKey']),
      sharedStatus: $TransactionsTable.$convertersharedStatusn
          .fromJson(serializer.fromJson<int?>(json['sharedStatus'])),
      sharedDateUpdated:
          serializer.fromJson<DateTime?>(json['sharedDateUpdated']),
      sharedReferenceBudgetPk:
          serializer.fromJson<String?>(json['sharedReferenceBudgetPk']),
      objectiveFk: serializer.fromJson<String?>(json['objectiveFk']),
      objectiveLoanFk: serializer.fromJson<String?>(json['objectiveLoanFk']),
      budgetFksExclude:
          serializer.fromJson<List<String>?>(json['budgetFksExclude']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'transactionPk': serializer.toJson<String>(transactionPk),
      'pairedTransactionFk': serializer.toJson<String?>(pairedTransactionFk),
      'name': serializer.toJson<String>(name),
      'amount': serializer.toJson<double>(amount),
      'note': serializer.toJson<String>(note),
      'categoryFk': serializer.toJson<String>(categoryFk),
      'subCategoryFk': serializer.toJson<String?>(subCategoryFk),
      'walletFk': serializer.toJson<String>(walletFk),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateTimeModified': serializer.toJson<DateTime?>(dateTimeModified),
      'originalDateDue': serializer.toJson<DateTime?>(originalDateDue),
      'income': serializer.toJson<bool>(income),
      'periodLength': serializer.toJson<int?>(periodLength),
      'reoccurrence': serializer.toJson<int?>(
          $TransactionsTable.$converterreoccurrencen.toJson(reoccurrence)),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'upcomingTransactionNotification':
          serializer.toJson<bool?>(upcomingTransactionNotification),
      'type': serializer
          .toJson<int?>($TransactionsTable.$convertertypen.toJson(type)),
      'paid': serializer.toJson<bool>(paid),
      'createdAnotherFutureTransaction':
          serializer.toJson<bool?>(createdAnotherFutureTransaction),
      'skipPaid': serializer.toJson<bool>(skipPaid),
      'methodAdded': serializer.toJson<int?>(
          $TransactionsTable.$convertermethodAddedn.toJson(methodAdded)),
      'transactionOwnerEmail':
          serializer.toJson<String?>(transactionOwnerEmail),
      'transactionOriginalOwnerEmail':
          serializer.toJson<String?>(transactionOriginalOwnerEmail),
      'sharedKey': serializer.toJson<String?>(sharedKey),
      'sharedOldKey': serializer.toJson<String?>(sharedOldKey),
      'sharedStatus': serializer.toJson<int?>(
          $TransactionsTable.$convertersharedStatusn.toJson(sharedStatus)),
      'sharedDateUpdated': serializer.toJson<DateTime?>(sharedDateUpdated),
      'sharedReferenceBudgetPk':
          serializer.toJson<String?>(sharedReferenceBudgetPk),
      'objectiveFk': serializer.toJson<String?>(objectiveFk),
      'objectiveLoanFk': serializer.toJson<String?>(objectiveLoanFk),
      'budgetFksExclude': serializer.toJson<List<String>?>(budgetFksExclude),
    };
  }

  Transaction copyWith(
          {String? transactionPk,
          Value<String?> pairedTransactionFk = const Value.absent(),
          String? name,
          double? amount,
          String? note,
          String? categoryFk,
          Value<String?> subCategoryFk = const Value.absent(),
          String? walletFk,
          DateTime? dateCreated,
          Value<DateTime?> dateTimeModified = const Value.absent(),
          Value<DateTime?> originalDateDue = const Value.absent(),
          bool? income,
          Value<int?> periodLength = const Value.absent(),
          Value<BudgetReoccurence?> reoccurrence = const Value.absent(),
          Value<DateTime?> endDate = const Value.absent(),
          Value<bool?> upcomingTransactionNotification = const Value.absent(),
          Value<TransactionSpecialType?> type = const Value.absent(),
          bool? paid,
          Value<bool?> createdAnotherFutureTransaction = const Value.absent(),
          bool? skipPaid,
          Value<MethodAdded?> methodAdded = const Value.absent(),
          Value<String?> transactionOwnerEmail = const Value.absent(),
          Value<String?> transactionOriginalOwnerEmail = const Value.absent(),
          Value<String?> sharedKey = const Value.absent(),
          Value<String?> sharedOldKey = const Value.absent(),
          Value<SharedStatus?> sharedStatus = const Value.absent(),
          Value<DateTime?> sharedDateUpdated = const Value.absent(),
          Value<String?> sharedReferenceBudgetPk = const Value.absent(),
          Value<String?> objectiveFk = const Value.absent(),
          Value<String?> objectiveLoanFk = const Value.absent(),
          Value<List<String>?> budgetFksExclude = const Value.absent()}) =>
      Transaction(
        transactionPk: transactionPk ?? this.transactionPk,
        pairedTransactionFk: pairedTransactionFk.present
            ? pairedTransactionFk.value
            : this.pairedTransactionFk,
        name: name ?? this.name,
        amount: amount ?? this.amount,
        note: note ?? this.note,
        categoryFk: categoryFk ?? this.categoryFk,
        subCategoryFk:
            subCategoryFk.present ? subCategoryFk.value : this.subCategoryFk,
        walletFk: walletFk ?? this.walletFk,
        dateCreated: dateCreated ?? this.dateCreated,
        dateTimeModified: dateTimeModified.present
            ? dateTimeModified.value
            : this.dateTimeModified,
        originalDateDue: originalDateDue.present
            ? originalDateDue.value
            : this.originalDateDue,
        income: income ?? this.income,
        periodLength:
            periodLength.present ? periodLength.value : this.periodLength,
        reoccurrence:
            reoccurrence.present ? reoccurrence.value : this.reoccurrence,
        endDate: endDate.present ? endDate.value : this.endDate,
        upcomingTransactionNotification: upcomingTransactionNotification.present
            ? upcomingTransactionNotification.value
            : this.upcomingTransactionNotification,
        type: type.present ? type.value : this.type,
        paid: paid ?? this.paid,
        createdAnotherFutureTransaction: createdAnotherFutureTransaction.present
            ? createdAnotherFutureTransaction.value
            : this.createdAnotherFutureTransaction,
        skipPaid: skipPaid ?? this.skipPaid,
        methodAdded: methodAdded.present ? methodAdded.value : this.methodAdded,
        transactionOwnerEmail: transactionOwnerEmail.present
            ? transactionOwnerEmail.value
            : this.transactionOwnerEmail,
        transactionOriginalOwnerEmail: transactionOriginalOwnerEmail.present
            ? transactionOriginalOwnerEmail.value
            : this.transactionOriginalOwnerEmail,
        sharedKey: sharedKey.present ? sharedKey.value : this.sharedKey,
        sharedOldKey:
            sharedOldKey.present ? sharedOldKey.value : this.sharedOldKey,
        sharedStatus:
            sharedStatus.present ? sharedStatus.value : this.sharedStatus,
        sharedDateUpdated: sharedDateUpdated.present
            ? sharedDateUpdated.value
            : this.sharedDateUpdated,
        sharedReferenceBudgetPk: sharedReferenceBudgetPk.present
            ? sharedReferenceBudgetPk.value
            : this.sharedReferenceBudgetPk,
        objectiveFk: objectiveFk.present ? objectiveFk.value : this.objectiveFk,
        objectiveLoanFk: objectiveLoanFk.present
            ? objectiveLoanFk.value
            : this.objectiveLoanFk,
        budgetFksExclude: budgetFksExclude.present
            ? budgetFksExclude.value
            : this.budgetFksExclude,
      );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      transactionPk: data.transactionPk.present
          ? data.transactionPk.value
          : this.transactionPk,
      pairedTransactionFk: data.pairedTransactionFk.present
          ? data.pairedTransactionFk.value
          : this.pairedTransactionFk,
      name: data.name.present ? data.name.value : this.name,
      amount: data.amount.present ? data.amount.value : this.amount,
      note: data.note.present ? data.note.value : this.note,
      categoryFk:
          data.categoryFk.present ? data.categoryFk.value : this.categoryFk,
      subCategoryFk: data.subCategoryFk.present
          ? data.subCategoryFk.value
          : this.subCategoryFk,
      walletFk: data.walletFk.present ? data.walletFk.value : this.walletFk,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateTimeModified: data.dateTimeModified.present
          ? data.dateTimeModified.value
          : this.dateTimeModified,
      originalDateDue: data.originalDateDue.present
          ? data.originalDateDue.value
          : this.originalDateDue,
      income: data.income.present ? data.income.value : this.income,
      periodLength: data.periodLength.present
          ? data.periodLength.value
          : this.periodLength,
      reoccurrence: data.reoccurrence.present
          ? data.reoccurrence.value
          : this.reoccurrence,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      upcomingTransactionNotification:
          data.upcomingTransactionNotification.present
              ? data.upcomingTransactionNotification.value
              : this.upcomingTransactionNotification,
      type: data.type.present ? data.type.value : this.type,
      paid: data.paid.present ? data.paid.value : this.paid,
      createdAnotherFutureTransaction:
          data.createdAnotherFutureTransaction.present
              ? data.createdAnotherFutureTransaction.value
              : this.createdAnotherFutureTransaction,
      skipPaid: data.skipPaid.present ? data.skipPaid.value : this.skipPaid,
      methodAdded:
          data.methodAdded.present ? data.methodAdded.value : this.methodAdded,
      transactionOwnerEmail: data.transactionOwnerEmail.present
          ? data.transactionOwnerEmail.value
          : this.transactionOwnerEmail,
      transactionOriginalOwnerEmail: data.transactionOriginalOwnerEmail.present
          ? data.transactionOriginalOwnerEmail.value
          : this.transactionOriginalOwnerEmail,
      sharedKey: data.sharedKey.present ? data.sharedKey.value : this.sharedKey,
      sharedOldKey: data.sharedOldKey.present
          ? data.sharedOldKey.value
          : this.sharedOldKey,
      sharedStatus: data.sharedStatus.present
          ? data.sharedStatus.value
          : this.sharedStatus,
      sharedDateUpdated: data.sharedDateUpdated.present
          ? data.sharedDateUpdated.value
          : this.sharedDateUpdated,
      sharedReferenceBudgetPk: data.sharedReferenceBudgetPk.present
          ? data.sharedReferenceBudgetPk.value
          : this.sharedReferenceBudgetPk,
      objectiveFk:
          data.objectiveFk.present ? data.objectiveFk.value : this.objectiveFk,
      objectiveLoanFk: data.objectiveLoanFk.present
          ? data.objectiveLoanFk.value
          : this.objectiveLoanFk,
      budgetFksExclude: data.budgetFksExclude.present
          ? data.budgetFksExclude.value
          : this.budgetFksExclude,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('transactionPk: $transactionPk, ')
          ..write('pairedTransactionFk: $pairedTransactionFk, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('categoryFk: $categoryFk, ')
          ..write('subCategoryFk: $subCategoryFk, ')
          ..write('walletFk: $walletFk, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('originalDateDue: $originalDateDue, ')
          ..write('income: $income, ')
          ..write('periodLength: $periodLength, ')
          ..write('reoccurrence: $reoccurrence, ')
          ..write('endDate: $endDate, ')
          ..write(
              'upcomingTransactionNotification: $upcomingTransactionNotification, ')
          ..write('type: $type, ')
          ..write('paid: $paid, ')
          ..write(
              'createdAnotherFutureTransaction: $createdAnotherFutureTransaction, ')
          ..write('skipPaid: $skipPaid, ')
          ..write('methodAdded: $methodAdded, ')
          ..write('transactionOwnerEmail: $transactionOwnerEmail, ')
          ..write(
              'transactionOriginalOwnerEmail: $transactionOriginalOwnerEmail, ')
          ..write('sharedKey: $sharedKey, ')
          ..write('sharedOldKey: $sharedOldKey, ')
          ..write('sharedStatus: $sharedStatus, ')
          ..write('sharedDateUpdated: $sharedDateUpdated, ')
          ..write('sharedReferenceBudgetPk: $sharedReferenceBudgetPk, ')
          ..write('objectiveFk: $objectiveFk, ')
          ..write('objectiveLoanFk: $objectiveLoanFk, ')
          ..write('budgetFksExclude: $budgetFksExclude')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        transactionPk,
        pairedTransactionFk,
        name,
        amount,
        note,
        categoryFk,
        subCategoryFk,
        walletFk,
        dateCreated,
        dateTimeModified,
        originalDateDue,
        income,
        periodLength,
        reoccurrence,
        endDate,
        upcomingTransactionNotification,
        type,
        paid,
        createdAnotherFutureTransaction,
        skipPaid,
        methodAdded,
        transactionOwnerEmail,
        transactionOriginalOwnerEmail,
        sharedKey,
        sharedOldKey,
        sharedStatus,
        sharedDateUpdated,
        sharedReferenceBudgetPk,
        objectiveFk,
        objectiveLoanFk,
        budgetFksExclude
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.transactionPk == this.transactionPk &&
          other.pairedTransactionFk == this.pairedTransactionFk &&
          other.name == this.name &&
          other.amount == this.amount &&
          other.note == this.note &&
          other.categoryFk == this.categoryFk &&
          other.subCategoryFk == this.subCategoryFk &&
          other.walletFk == this.walletFk &&
          other.dateCreated == this.dateCreated &&
          other.dateTimeModified == this.dateTimeModified &&
          other.originalDateDue == this.originalDateDue &&
          other.income == this.income &&
          other.periodLength == this.periodLength &&
          other.reoccurrence == this.reoccurrence &&
          other.endDate == this.endDate &&
          other.upcomingTransactionNotification ==
              this.upcomingTransactionNotification &&
          other.type == this.type &&
          other.paid == this.paid &&
          other.createdAnotherFutureTransaction ==
              this.createdAnotherFutureTransaction &&
          other.skipPaid == this.skipPaid &&
          other.methodAdded == this.methodAdded &&
          other.transactionOwnerEmail == this.transactionOwnerEmail &&
          other.transactionOriginalOwnerEmail ==
              this.transactionOriginalOwnerEmail &&
          other.sharedKey == this.sharedKey &&
          other.sharedOldKey == this.sharedOldKey &&
          other.sharedStatus == this.sharedStatus &&
          other.sharedDateUpdated == this.sharedDateUpdated &&
          other.sharedReferenceBudgetPk == this.sharedReferenceBudgetPk &&
          other.objectiveFk == this.objectiveFk &&
          other.objectiveLoanFk == this.objectiveLoanFk &&
          other.budgetFksExclude == this.budgetFksExclude);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<String> transactionPk;
  final Value<String?> pairedTransactionFk;
  final Value<String> name;
  final Value<double> amount;
  final Value<String> note;
  final Value<String> categoryFk;
  final Value<String?> subCategoryFk;
  final Value<String> walletFk;
  final Value<DateTime> dateCreated;
  final Value<DateTime?> dateTimeModified;
  final Value<DateTime?> originalDateDue;
  final Value<bool> income;
  final Value<int?> periodLength;
  final Value<BudgetReoccurence?> reoccurrence;
  final Value<DateTime?> endDate;
  final Value<bool?> upcomingTransactionNotification;
  final Value<TransactionSpecialType?> type;
  final Value<bool> paid;
  final Value<bool?> createdAnotherFutureTransaction;
  final Value<bool> skipPaid;
  final Value<MethodAdded?> methodAdded;
  final Value<String?> transactionOwnerEmail;
  final Value<String?> transactionOriginalOwnerEmail;
  final Value<String?> sharedKey;
  final Value<String?> sharedOldKey;
  final Value<SharedStatus?> sharedStatus;
  final Value<DateTime?> sharedDateUpdated;
  final Value<String?> sharedReferenceBudgetPk;
  final Value<String?> objectiveFk;
  final Value<String?> objectiveLoanFk;
  final Value<List<String>?> budgetFksExclude;
  final Value<int> rowid;
  const TransactionsCompanion({
    this.transactionPk = const Value.absent(),
    this.pairedTransactionFk = const Value.absent(),
    this.name = const Value.absent(),
    this.amount = const Value.absent(),
    this.note = const Value.absent(),
    this.categoryFk = const Value.absent(),
    this.subCategoryFk = const Value.absent(),
    this.walletFk = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.originalDateDue = const Value.absent(),
    this.income = const Value.absent(),
    this.periodLength = const Value.absent(),
    this.reoccurrence = const Value.absent(),
    this.endDate = const Value.absent(),
    this.upcomingTransactionNotification = const Value.absent(),
    this.type = const Value.absent(),
    this.paid = const Value.absent(),
    this.createdAnotherFutureTransaction = const Value.absent(),
    this.skipPaid = const Value.absent(),
    this.methodAdded = const Value.absent(),
    this.transactionOwnerEmail = const Value.absent(),
    this.transactionOriginalOwnerEmail = const Value.absent(),
    this.sharedKey = const Value.absent(),
    this.sharedOldKey = const Value.absent(),
    this.sharedStatus = const Value.absent(),
    this.sharedDateUpdated = const Value.absent(),
    this.sharedReferenceBudgetPk = const Value.absent(),
    this.objectiveFk = const Value.absent(),
    this.objectiveLoanFk = const Value.absent(),
    this.budgetFksExclude = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.transactionPk = const Value.absent(),
    this.pairedTransactionFk = const Value.absent(),
    required String name,
    required double amount,
    required String note,
    required String categoryFk,
    this.subCategoryFk = const Value.absent(),
    this.walletFk = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.originalDateDue = const Value.absent(),
    this.income = const Value.absent(),
    this.periodLength = const Value.absent(),
    this.reoccurrence = const Value.absent(),
    this.endDate = const Value.absent(),
    this.upcomingTransactionNotification = const Value.absent(),
    this.type = const Value.absent(),
    this.paid = const Value.absent(),
    this.createdAnotherFutureTransaction = const Value.absent(),
    this.skipPaid = const Value.absent(),
    this.methodAdded = const Value.absent(),
    this.transactionOwnerEmail = const Value.absent(),
    this.transactionOriginalOwnerEmail = const Value.absent(),
    this.sharedKey = const Value.absent(),
    this.sharedOldKey = const Value.absent(),
    this.sharedStatus = const Value.absent(),
    this.sharedDateUpdated = const Value.absent(),
    this.sharedReferenceBudgetPk = const Value.absent(),
    this.objectiveFk = const Value.absent(),
    this.objectiveLoanFk = const Value.absent(),
    this.budgetFksExclude = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        amount = Value(amount),
        note = Value(note),
        categoryFk = Value(categoryFk);
  static Insertable<Transaction> custom({
    Expression<String>? transactionPk,
    Expression<String>? pairedTransactionFk,
    Expression<String>? name,
    Expression<double>? amount,
    Expression<String>? note,
    Expression<String>? categoryFk,
    Expression<String>? subCategoryFk,
    Expression<String>? walletFk,
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateTimeModified,
    Expression<DateTime>? originalDateDue,
    Expression<bool>? income,
    Expression<int>? periodLength,
    Expression<int>? reoccurrence,
    Expression<DateTime>? endDate,
    Expression<bool>? upcomingTransactionNotification,
    Expression<int>? type,
    Expression<bool>? paid,
    Expression<bool>? createdAnotherFutureTransaction,
    Expression<bool>? skipPaid,
    Expression<int>? methodAdded,
    Expression<String>? transactionOwnerEmail,
    Expression<String>? transactionOriginalOwnerEmail,
    Expression<String>? sharedKey,
    Expression<String>? sharedOldKey,
    Expression<int>? sharedStatus,
    Expression<DateTime>? sharedDateUpdated,
    Expression<String>? sharedReferenceBudgetPk,
    Expression<String>? objectiveFk,
    Expression<String>? objectiveLoanFk,
    Expression<String>? budgetFksExclude,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (transactionPk != null) 'transaction_pk': transactionPk,
      if (pairedTransactionFk != null)
        'paired_transaction_fk': pairedTransactionFk,
      if (name != null) 'name': name,
      if (amount != null) 'amount': amount,
      if (note != null) 'note': note,
      if (categoryFk != null) 'category_fk': categoryFk,
      if (subCategoryFk != null) 'sub_category_fk': subCategoryFk,
      if (walletFk != null) 'wallet_fk': walletFk,
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateTimeModified != null) 'date_time_modified': dateTimeModified,
      if (originalDateDue != null) 'original_date_due': originalDateDue,
      if (income != null) 'income': income,
      if (periodLength != null) 'period_length': periodLength,
      if (reoccurrence != null) 'reoccurrence': reoccurrence,
      if (endDate != null) 'end_date': endDate,
      if (upcomingTransactionNotification != null)
        'upcoming_transaction_notification': upcomingTransactionNotification,
      if (type != null) 'type': type,
      if (paid != null) 'paid': paid,
      if (createdAnotherFutureTransaction != null)
        'created_another_future_transaction': createdAnotherFutureTransaction,
      if (skipPaid != null) 'skip_paid': skipPaid,
      if (methodAdded != null) 'method_added': methodAdded,
      if (transactionOwnerEmail != null)
        'transaction_owner_email': transactionOwnerEmail,
      if (transactionOriginalOwnerEmail != null)
        'transaction_original_owner_email': transactionOriginalOwnerEmail,
      if (sharedKey != null) 'shared_key': sharedKey,
      if (sharedOldKey != null) 'shared_old_key': sharedOldKey,
      if (sharedStatus != null) 'shared_status': sharedStatus,
      if (sharedDateUpdated != null) 'shared_date_updated': sharedDateUpdated,
      if (sharedReferenceBudgetPk != null)
        'shared_reference_budget_pk': sharedReferenceBudgetPk,
      if (objectiveFk != null) 'objective_fk': objectiveFk,
      if (objectiveLoanFk != null) 'objective_loan_fk': objectiveLoanFk,
      if (budgetFksExclude != null) 'budget_fks_exclude': budgetFksExclude,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsCompanion copyWith(
      {Value<String>? transactionPk,
      Value<String?>? pairedTransactionFk,
      Value<String>? name,
      Value<double>? amount,
      Value<String>? note,
      Value<String>? categoryFk,
      Value<String?>? subCategoryFk,
      Value<String>? walletFk,
      Value<DateTime>? dateCreated,
      Value<DateTime?>? dateTimeModified,
      Value<DateTime?>? originalDateDue,
      Value<bool>? income,
      Value<int?>? periodLength,
      Value<BudgetReoccurence?>? reoccurrence,
      Value<DateTime?>? endDate,
      Value<bool?>? upcomingTransactionNotification,
      Value<TransactionSpecialType?>? type,
      Value<bool>? paid,
      Value<bool?>? createdAnotherFutureTransaction,
      Value<bool>? skipPaid,
      Value<MethodAdded?>? methodAdded,
      Value<String?>? transactionOwnerEmail,
      Value<String?>? transactionOriginalOwnerEmail,
      Value<String?>? sharedKey,
      Value<String?>? sharedOldKey,
      Value<SharedStatus?>? sharedStatus,
      Value<DateTime?>? sharedDateUpdated,
      Value<String?>? sharedReferenceBudgetPk,
      Value<String?>? objectiveFk,
      Value<String?>? objectiveLoanFk,
      Value<List<String>?>? budgetFksExclude,
      Value<int>? rowid}) {
    return TransactionsCompanion(
      transactionPk: transactionPk ?? this.transactionPk,
      pairedTransactionFk: pairedTransactionFk ?? this.pairedTransactionFk,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      categoryFk: categoryFk ?? this.categoryFk,
      subCategoryFk: subCategoryFk ?? this.subCategoryFk,
      walletFk: walletFk ?? this.walletFk,
      dateCreated: dateCreated ?? this.dateCreated,
      dateTimeModified: dateTimeModified ?? this.dateTimeModified,
      originalDateDue: originalDateDue ?? this.originalDateDue,
      income: income ?? this.income,
      periodLength: periodLength ?? this.periodLength,
      reoccurrence: reoccurrence ?? this.reoccurrence,
      endDate: endDate ?? this.endDate,
      upcomingTransactionNotification: upcomingTransactionNotification ??
          this.upcomingTransactionNotification,
      type: type ?? this.type,
      paid: paid ?? this.paid,
      createdAnotherFutureTransaction: createdAnotherFutureTransaction ??
          this.createdAnotherFutureTransaction,
      skipPaid: skipPaid ?? this.skipPaid,
      methodAdded: methodAdded ?? this.methodAdded,
      transactionOwnerEmail:
          transactionOwnerEmail ?? this.transactionOwnerEmail,
      transactionOriginalOwnerEmail:
          transactionOriginalOwnerEmail ?? this.transactionOriginalOwnerEmail,
      sharedKey: sharedKey ?? this.sharedKey,
      sharedOldKey: sharedOldKey ?? this.sharedOldKey,
      sharedStatus: sharedStatus ?? this.sharedStatus,
      sharedDateUpdated: sharedDateUpdated ?? this.sharedDateUpdated,
      sharedReferenceBudgetPk:
          sharedReferenceBudgetPk ?? this.sharedReferenceBudgetPk,
      objectiveFk: objectiveFk ?? this.objectiveFk,
      objectiveLoanFk: objectiveLoanFk ?? this.objectiveLoanFk,
      budgetFksExclude: budgetFksExclude ?? this.budgetFksExclude,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (transactionPk.present) {
      map['transaction_pk'] = Variable<String>(transactionPk.value);
    }
    if (pairedTransactionFk.present) {
      map['paired_transaction_fk'] =
          Variable<String>(pairedTransactionFk.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (categoryFk.present) {
      map['category_fk'] = Variable<String>(categoryFk.value);
    }
    if (subCategoryFk.present) {
      map['sub_category_fk'] = Variable<String>(subCategoryFk.value);
    }
    if (walletFk.present) {
      map['wallet_fk'] = Variable<String>(walletFk.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateTimeModified.present) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified.value);
    }
    if (originalDateDue.present) {
      map['original_date_due'] = Variable<DateTime>(originalDateDue.value);
    }
    if (income.present) {
      map['income'] = Variable<bool>(income.value);
    }
    if (periodLength.present) {
      map['period_length'] = Variable<int>(periodLength.value);
    }
    if (reoccurrence.present) {
      map['reoccurrence'] = Variable<int>(
          $TransactionsTable.$converterreoccurrencen.toSql(reoccurrence.value));
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (upcomingTransactionNotification.present) {
      map['upcoming_transaction_notification'] =
          Variable<bool>(upcomingTransactionNotification.value);
    }
    if (type.present) {
      map['type'] =
          Variable<int>($TransactionsTable.$convertertypen.toSql(type.value));
    }
    if (paid.present) {
      map['paid'] = Variable<bool>(paid.value);
    }
    if (createdAnotherFutureTransaction.present) {
      map['created_another_future_transaction'] =
          Variable<bool>(createdAnotherFutureTransaction.value);
    }
    if (skipPaid.present) {
      map['skip_paid'] = Variable<bool>(skipPaid.value);
    }
    if (methodAdded.present) {
      map['method_added'] = Variable<int>(
          $TransactionsTable.$convertermethodAddedn.toSql(methodAdded.value));
    }
    if (transactionOwnerEmail.present) {
      map['transaction_owner_email'] =
          Variable<String>(transactionOwnerEmail.value);
    }
    if (transactionOriginalOwnerEmail.present) {
      map['transaction_original_owner_email'] =
          Variable<String>(transactionOriginalOwnerEmail.value);
    }
    if (sharedKey.present) {
      map['shared_key'] = Variable<String>(sharedKey.value);
    }
    if (sharedOldKey.present) {
      map['shared_old_key'] = Variable<String>(sharedOldKey.value);
    }
    if (sharedStatus.present) {
      map['shared_status'] = Variable<int>(
          $TransactionsTable.$convertersharedStatusn.toSql(sharedStatus.value));
    }
    if (sharedDateUpdated.present) {
      map['shared_date_updated'] = Variable<DateTime>(sharedDateUpdated.value);
    }
    if (sharedReferenceBudgetPk.present) {
      map['shared_reference_budget_pk'] =
          Variable<String>(sharedReferenceBudgetPk.value);
    }
    if (objectiveFk.present) {
      map['objective_fk'] = Variable<String>(objectiveFk.value);
    }
    if (objectiveLoanFk.present) {
      map['objective_loan_fk'] = Variable<String>(objectiveLoanFk.value);
    }
    if (budgetFksExclude.present) {
      map['budget_fks_exclude'] = Variable<String>($TransactionsTable
          .$converterbudgetFksExcluden
          .toSql(budgetFksExclude.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('transactionPk: $transactionPk, ')
          ..write('pairedTransactionFk: $pairedTransactionFk, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('categoryFk: $categoryFk, ')
          ..write('subCategoryFk: $subCategoryFk, ')
          ..write('walletFk: $walletFk, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('originalDateDue: $originalDateDue, ')
          ..write('income: $income, ')
          ..write('periodLength: $periodLength, ')
          ..write('reoccurrence: $reoccurrence, ')
          ..write('endDate: $endDate, ')
          ..write(
              'upcomingTransactionNotification: $upcomingTransactionNotification, ')
          ..write('type: $type, ')
          ..write('paid: $paid, ')
          ..write(
              'createdAnotherFutureTransaction: $createdAnotherFutureTransaction, ')
          ..write('skipPaid: $skipPaid, ')
          ..write('methodAdded: $methodAdded, ')
          ..write('transactionOwnerEmail: $transactionOwnerEmail, ')
          ..write(
              'transactionOriginalOwnerEmail: $transactionOriginalOwnerEmail, ')
          ..write('sharedKey: $sharedKey, ')
          ..write('sharedOldKey: $sharedOldKey, ')
          ..write('sharedStatus: $sharedStatus, ')
          ..write('sharedDateUpdated: $sharedDateUpdated, ')
          ..write('sharedReferenceBudgetPk: $sharedReferenceBudgetPk, ')
          ..write('objectiveFk: $objectiveFk, ')
          ..write('objectiveLoanFk: $objectiveLoanFk, ')
          ..write('budgetFksExclude: $budgetFksExclude, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BudgetsTable extends Budgets with TableInfo<$BudgetsTable, Budget> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _budgetPkMeta =
      const VerificationMeta('budgetPk');
  @override
  late final GeneratedColumn<String> budgetPk = GeneratedColumn<String>(
      'budget_pk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _colourMeta = const VerificationMeta('colour');
  @override
  late final GeneratedColumn<String> colour = GeneratedColumn<String>(
      'colour', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> walletFks =
      GeneratedColumn<String>('wallet_fks', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($BudgetsTable.$converterwalletFksn);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      categoryFks = GeneratedColumn<String>('category_fks', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($BudgetsTable.$convertercategoryFksn);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      categoryFksExclude = GeneratedColumn<String>(
              'category_fks_exclude', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(
              $BudgetsTable.$convertercategoryFksExcluden);
  static const VerificationMeta _incomeMeta = const VerificationMeta('income');
  @override
  late final GeneratedColumn<bool> income = GeneratedColumn<bool>(
      'income', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("income" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _archivedMeta =
      const VerificationMeta('archived');
  @override
  late final GeneratedColumn<bool> archived = GeneratedColumn<bool>(
      'archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _addedTransactionsOnlyMeta =
      const VerificationMeta('addedTransactionsOnly');
  @override
  late final GeneratedColumn<bool> addedTransactionsOnly =
      GeneratedColumn<bool>('added_transactions_only', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("added_transactions_only" IN (0, 1))'),
          defaultValue: const Constant(false));
  static const VerificationMeta _periodLengthMeta =
      const VerificationMeta('periodLength');
  @override
  late final GeneratedColumn<int> periodLength = GeneratedColumn<int>(
      'period_length', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<BudgetReoccurence?, int>
      reoccurrence = GeneratedColumn<int>('reoccurrence', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<BudgetReoccurence?>(
              $BudgetsTable.$converterreoccurrencen);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => new DateTime.now());
  static const VerificationMeta _dateTimeModifiedMeta =
      const VerificationMeta('dateTimeModified');
  @override
  late final GeneratedColumn<DateTime> dateTimeModified =
      GeneratedColumn<DateTime>('date_time_modified', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _pinnedMeta = const VerificationMeta('pinned');
  @override
  late final GeneratedColumn<bool> pinned = GeneratedColumn<bool>(
      'pinned', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("pinned" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _walletFkMeta =
      const VerificationMeta('walletFk');
  @override
  late final GeneratedColumn<String> walletFk = GeneratedColumn<String>(
      'wallet_fk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES wallets (wallet_pk)'),
      defaultValue: const Constant("0"));
  @override
  late final GeneratedColumnWithTypeConverter<List<BudgetTransactionFilters>?,
      String> budgetTransactionFilters = GeneratedColumn<String>(
          'budget_transaction_filters', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant(null))
      .withConverter<List<BudgetTransactionFilters>?>(
          $BudgetsTable.$converterbudgetTransactionFiltersn);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      memberTransactionFilters = GeneratedColumn<String>(
              'member_transaction_filters', aliasedName, true,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant(null))
          .withConverter<List<String>?>(
              $BudgetsTable.$convertermemberTransactionFiltersn);
  static const VerificationMeta _sharedKeyMeta =
      const VerificationMeta('sharedKey');
  @override
  late final GeneratedColumn<String> sharedKey = GeneratedColumn<String>(
      'shared_key', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<SharedOwnerMember?, int>
      sharedOwnerMember = GeneratedColumn<int>(
              'shared_owner_member', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<SharedOwnerMember?>(
              $BudgetsTable.$convertersharedOwnerMembern);
  static const VerificationMeta _sharedDateUpdatedMeta =
      const VerificationMeta('sharedDateUpdated');
  @override
  late final GeneratedColumn<DateTime> sharedDateUpdated =
      GeneratedColumn<DateTime>('shared_date_updated', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      sharedMembers = GeneratedColumn<String>(
              'shared_members', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($BudgetsTable.$convertersharedMembersn);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      sharedAllMembersEver = GeneratedColumn<String>(
              'shared_all_members_ever', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(
              $BudgetsTable.$convertersharedAllMembersEvern);
  static const VerificationMeta _isAbsoluteSpendingLimitMeta =
      const VerificationMeta('isAbsoluteSpendingLimit');
  @override
  late final GeneratedColumn<bool> isAbsoluteSpendingLimit =
      GeneratedColumn<bool>('is_absolute_spending_limit', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_absolute_spending_limit" IN (0, 1))'),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        budgetPk,
        name,
        amount,
        colour,
        startDate,
        endDate,
        walletFks,
        categoryFks,
        categoryFksExclude,
        income,
        archived,
        addedTransactionsOnly,
        periodLength,
        reoccurrence,
        dateCreated,
        dateTimeModified,
        pinned,
        order,
        walletFk,
        budgetTransactionFilters,
        memberTransactionFilters,
        sharedKey,
        sharedOwnerMember,
        sharedDateUpdated,
        sharedMembers,
        sharedAllMembersEver,
        isAbsoluteSpendingLimit
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budgets';
  @override
  VerificationContext validateIntegrity(Insertable<Budget> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('budget_pk')) {
      context.handle(_budgetPkMeta,
          budgetPk.isAcceptableOrUnknown(data['budget_pk']!, _budgetPkMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('colour')) {
      context.handle(_colourMeta,
          colour.isAcceptableOrUnknown(data['colour']!, _colourMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('income')) {
      context.handle(_incomeMeta,
          income.isAcceptableOrUnknown(data['income']!, _incomeMeta));
    }
    if (data.containsKey('archived')) {
      context.handle(_archivedMeta,
          archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta));
    }
    if (data.containsKey('added_transactions_only')) {
      context.handle(
          _addedTransactionsOnlyMeta,
          addedTransactionsOnly.isAcceptableOrUnknown(
              data['added_transactions_only']!, _addedTransactionsOnlyMeta));
    }
    if (data.containsKey('period_length')) {
      context.handle(
          _periodLengthMeta,
          periodLength.isAcceptableOrUnknown(
              data['period_length']!, _periodLengthMeta));
    } else if (isInserting) {
      context.missing(_periodLengthMeta);
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_time_modified')) {
      context.handle(
          _dateTimeModifiedMeta,
          dateTimeModified.isAcceptableOrUnknown(
              data['date_time_modified']!, _dateTimeModifiedMeta));
    }
    if (data.containsKey('pinned')) {
      context.handle(_pinnedMeta,
          pinned.isAcceptableOrUnknown(data['pinned']!, _pinnedMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('wallet_fk')) {
      context.handle(_walletFkMeta,
          walletFk.isAcceptableOrUnknown(data['wallet_fk']!, _walletFkMeta));
    }
    if (data.containsKey('shared_key')) {
      context.handle(_sharedKeyMeta,
          sharedKey.isAcceptableOrUnknown(data['shared_key']!, _sharedKeyMeta));
    }
    if (data.containsKey('shared_date_updated')) {
      context.handle(
          _sharedDateUpdatedMeta,
          sharedDateUpdated.isAcceptableOrUnknown(
              data['shared_date_updated']!, _sharedDateUpdatedMeta));
    }
    if (data.containsKey('is_absolute_spending_limit')) {
      context.handle(
          _isAbsoluteSpendingLimitMeta,
          isAbsoluteSpendingLimit.isAcceptableOrUnknown(
              data['is_absolute_spending_limit']!,
              _isAbsoluteSpendingLimitMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {budgetPk};
  @override
  Budget map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Budget(
      budgetPk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}budget_pk'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      colour: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}colour']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
      walletFks: $BudgetsTable.$converterwalletFksn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wallet_fks'])),
      categoryFks: $BudgetsTable.$convertercategoryFksn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_fks'])),
      categoryFksExclude: $BudgetsTable.$convertercategoryFksExcluden.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}category_fks_exclude'])),
      income: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}income'])!,
      archived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}archived'])!,
      addedTransactionsOnly: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}added_transactions_only'])!,
      periodLength: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}period_length'])!,
      reoccurrence: $BudgetsTable.$converterreoccurrencen.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}reoccurrence'])),
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateTimeModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_modified']),
      pinned: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}pinned'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      walletFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wallet_fk'])!,
      budgetTransactionFilters: $BudgetsTable
          .$converterbudgetTransactionFiltersn
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}budget_transaction_filters'])),
      memberTransactionFilters: $BudgetsTable
          .$convertermemberTransactionFiltersn
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}member_transaction_filters'])),
      sharedKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shared_key']),
      sharedOwnerMember: $BudgetsTable.$convertersharedOwnerMembern.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}shared_owner_member'])),
      sharedDateUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}shared_date_updated']),
      sharedMembers: $BudgetsTable.$convertersharedMembersn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}shared_members'])),
      sharedAllMembersEver: $BudgetsTable.$convertersharedAllMembersEvern
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}shared_all_members_ever'])),
      isAbsoluteSpendingLimit: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}is_absolute_spending_limit'])!,
    );
  }

  @override
  $BudgetsTable createAlias(String alias) {
    return $BudgetsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterwalletFks =
      const StringListInColumnConverter();
  static TypeConverter<List<String>?, String?> $converterwalletFksn =
      NullAwareTypeConverter.wrap($converterwalletFks);
  static TypeConverter<List<String>, String> $convertercategoryFks =
      const StringListInColumnConverter();
  static TypeConverter<List<String>?, String?> $convertercategoryFksn =
      NullAwareTypeConverter.wrap($convertercategoryFks);
  static TypeConverter<List<String>, String> $convertercategoryFksExclude =
      const StringListInColumnConverter();
  static TypeConverter<List<String>?, String?> $convertercategoryFksExcluden =
      NullAwareTypeConverter.wrap($convertercategoryFksExclude);
  static JsonTypeConverter2<BudgetReoccurence, int, int>
      $converterreoccurrence =
      const EnumIndexConverter<BudgetReoccurence>(BudgetReoccurence.values);
  static JsonTypeConverter2<BudgetReoccurence?, int?, int?>
      $converterreoccurrencen =
      JsonTypeConverter2.asNullable($converterreoccurrence);
  static TypeConverter<List<BudgetTransactionFilters>, String>
      $converterbudgetTransactionFilters =
      const BudgetTransactionFiltersListInColumnConverter();
  static TypeConverter<List<BudgetTransactionFilters>?, String?>
      $converterbudgetTransactionFiltersn =
      NullAwareTypeConverter.wrap($converterbudgetTransactionFilters);
  static TypeConverter<List<String>, String>
      $convertermemberTransactionFilters = const StringListInColumnConverter();
  static TypeConverter<List<String>?, String?>
      $convertermemberTransactionFiltersn =
      NullAwareTypeConverter.wrap($convertermemberTransactionFilters);
  static JsonTypeConverter2<SharedOwnerMember, int, int>
      $convertersharedOwnerMember =
      const EnumIndexConverter<SharedOwnerMember>(SharedOwnerMember.values);
  static JsonTypeConverter2<SharedOwnerMember?, int?, int?>
      $convertersharedOwnerMembern =
      JsonTypeConverter2.asNullable($convertersharedOwnerMember);
  static TypeConverter<List<String>, String> $convertersharedMembers =
      const StringListInColumnConverter();
  static TypeConverter<List<String>?, String?> $convertersharedMembersn =
      NullAwareTypeConverter.wrap($convertersharedMembers);
  static TypeConverter<List<String>, String> $convertersharedAllMembersEver =
      const StringListInColumnConverter();
  static TypeConverter<List<String>?, String?> $convertersharedAllMembersEvern =
      NullAwareTypeConverter.wrap($convertersharedAllMembersEver);
}

class Budget extends DataClass implements Insertable<Budget> {
  final String budgetPk;
  final String name;
  final double amount;
  final String? colour;
  final DateTime startDate;
  final DateTime endDate;
  final List<String>? walletFks;
  final List<String>? categoryFks;
  final List<String>? categoryFksExclude;
  final bool income;
  final bool archived;
  final bool addedTransactionsOnly;
  final int periodLength;
  final BudgetReoccurence? reoccurrence;
  final DateTime dateCreated;
  final DateTime? dateTimeModified;
  final bool pinned;
  final int order;
  final String walletFk;
  final List<BudgetTransactionFilters>? budgetTransactionFilters;
  final List<String>? memberTransactionFilters;
  final String? sharedKey;
  final SharedOwnerMember? sharedOwnerMember;
  final DateTime? sharedDateUpdated;
  final List<String>? sharedMembers;
  final List<String>? sharedAllMembersEver;
  final bool isAbsoluteSpendingLimit;
  const Budget(
      {required this.budgetPk,
      required this.name,
      required this.amount,
      this.colour,
      required this.startDate,
      required this.endDate,
      this.walletFks,
      this.categoryFks,
      this.categoryFksExclude,
      required this.income,
      required this.archived,
      required this.addedTransactionsOnly,
      required this.periodLength,
      this.reoccurrence,
      required this.dateCreated,
      this.dateTimeModified,
      required this.pinned,
      required this.order,
      required this.walletFk,
      this.budgetTransactionFilters,
      this.memberTransactionFilters,
      this.sharedKey,
      this.sharedOwnerMember,
      this.sharedDateUpdated,
      this.sharedMembers,
      this.sharedAllMembersEver,
      required this.isAbsoluteSpendingLimit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['budget_pk'] = Variable<String>(budgetPk);
    map['name'] = Variable<String>(name);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || colour != null) {
      map['colour'] = Variable<String>(colour);
    }
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    if (!nullToAbsent || walletFks != null) {
      map['wallet_fks'] =
          Variable<String>($BudgetsTable.$converterwalletFksn.toSql(walletFks));
    }
    if (!nullToAbsent || categoryFks != null) {
      map['category_fks'] = Variable<String>(
          $BudgetsTable.$convertercategoryFksn.toSql(categoryFks));
    }
    if (!nullToAbsent || categoryFksExclude != null) {
      map['category_fks_exclude'] = Variable<String>($BudgetsTable
          .$convertercategoryFksExcluden
          .toSql(categoryFksExclude));
    }
    map['income'] = Variable<bool>(income);
    map['archived'] = Variable<bool>(archived);
    map['added_transactions_only'] = Variable<bool>(addedTransactionsOnly);
    map['period_length'] = Variable<int>(periodLength);
    if (!nullToAbsent || reoccurrence != null) {
      map['reoccurrence'] = Variable<int>(
          $BudgetsTable.$converterreoccurrencen.toSql(reoccurrence));
    }
    map['date_created'] = Variable<DateTime>(dateCreated);
    if (!nullToAbsent || dateTimeModified != null) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified);
    }
    map['pinned'] = Variable<bool>(pinned);
    map['order'] = Variable<int>(order);
    map['wallet_fk'] = Variable<String>(walletFk);
    if (!nullToAbsent || budgetTransactionFilters != null) {
      map['budget_transaction_filters'] = Variable<String>($BudgetsTable
          .$converterbudgetTransactionFiltersn
          .toSql(budgetTransactionFilters));
    }
    if (!nullToAbsent || memberTransactionFilters != null) {
      map['member_transaction_filters'] = Variable<String>($BudgetsTable
          .$convertermemberTransactionFiltersn
          .toSql(memberTransactionFilters));
    }
    if (!nullToAbsent || sharedKey != null) {
      map['shared_key'] = Variable<String>(sharedKey);
    }
    if (!nullToAbsent || sharedOwnerMember != null) {
      map['shared_owner_member'] = Variable<int>(
          $BudgetsTable.$convertersharedOwnerMembern.toSql(sharedOwnerMember));
    }
    if (!nullToAbsent || sharedDateUpdated != null) {
      map['shared_date_updated'] = Variable<DateTime>(sharedDateUpdated);
    }
    if (!nullToAbsent || sharedMembers != null) {
      map['shared_members'] = Variable<String>(
          $BudgetsTable.$convertersharedMembersn.toSql(sharedMembers));
    }
    if (!nullToAbsent || sharedAllMembersEver != null) {
      map['shared_all_members_ever'] = Variable<String>($BudgetsTable
          .$convertersharedAllMembersEvern
          .toSql(sharedAllMembersEver));
    }
    map['is_absolute_spending_limit'] = Variable<bool>(isAbsoluteSpendingLimit);
    return map;
  }

  BudgetsCompanion toCompanion(bool nullToAbsent) {
    return BudgetsCompanion(
      budgetPk: Value(budgetPk),
      name: Value(name),
      amount: Value(amount),
      colour:
          colour == null && nullToAbsent ? const Value.absent() : Value(colour),
      startDate: Value(startDate),
      endDate: Value(endDate),
      walletFks: walletFks == null && nullToAbsent
          ? const Value.absent()
          : Value(walletFks),
      categoryFks: categoryFks == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryFks),
      categoryFksExclude: categoryFksExclude == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryFksExclude),
      income: Value(income),
      archived: Value(archived),
      addedTransactionsOnly: Value(addedTransactionsOnly),
      periodLength: Value(periodLength),
      reoccurrence: reoccurrence == null && nullToAbsent
          ? const Value.absent()
          : Value(reoccurrence),
      dateCreated: Value(dateCreated),
      dateTimeModified: dateTimeModified == null && nullToAbsent
          ? const Value.absent()
          : Value(dateTimeModified),
      pinned: Value(pinned),
      order: Value(order),
      walletFk: Value(walletFk),
      budgetTransactionFilters: budgetTransactionFilters == null && nullToAbsent
          ? const Value.absent()
          : Value(budgetTransactionFilters),
      memberTransactionFilters: memberTransactionFilters == null && nullToAbsent
          ? const Value.absent()
          : Value(memberTransactionFilters),
      sharedKey: sharedKey == null && nullToAbsent
          ? const Value.absent()
          : Value(sharedKey),
      sharedOwnerMember: sharedOwnerMember == null && nullToAbsent
          ? const Value.absent()
          : Value(sharedOwnerMember),
      sharedDateUpdated: sharedDateUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(sharedDateUpdated),
      sharedMembers: sharedMembers == null && nullToAbsent
          ? const Value.absent()
          : Value(sharedMembers),
      sharedAllMembersEver: sharedAllMembersEver == null && nullToAbsent
          ? const Value.absent()
          : Value(sharedAllMembersEver),
      isAbsoluteSpendingLimit: Value(isAbsoluteSpendingLimit),
    );
  }

  factory Budget.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Budget(
      budgetPk: serializer.fromJson<String>(json['budgetPk']),
      name: serializer.fromJson<String>(json['name']),
      amount: serializer.fromJson<double>(json['amount']),
      colour: serializer.fromJson<String?>(json['colour']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      walletFks: serializer.fromJson<List<String>?>(json['walletFks']),
      categoryFks: serializer.fromJson<List<String>?>(json['categoryFks']),
      categoryFksExclude:
          serializer.fromJson<List<String>?>(json['categoryFksExclude']),
      income: serializer.fromJson<bool>(json['income']),
      archived: serializer.fromJson<bool>(json['archived']),
      addedTransactionsOnly:
          serializer.fromJson<bool>(json['addedTransactionsOnly']),
      periodLength: serializer.fromJson<int>(json['periodLength']),
      reoccurrence: $BudgetsTable.$converterreoccurrencen
          .fromJson(serializer.fromJson<int?>(json['reoccurrence'])),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateTimeModified:
          serializer.fromJson<DateTime?>(json['dateTimeModified']),
      pinned: serializer.fromJson<bool>(json['pinned']),
      order: serializer.fromJson<int>(json['order']),
      walletFk: serializer.fromJson<String>(json['walletFk']),
      budgetTransactionFilters:
          serializer.fromJson<List<BudgetTransactionFilters>?>(
              json['budgetTransactionFilters']),
      memberTransactionFilters:
          serializer.fromJson<List<String>?>(json['memberTransactionFilters']),
      sharedKey: serializer.fromJson<String?>(json['sharedKey']),
      sharedOwnerMember: $BudgetsTable.$convertersharedOwnerMembern
          .fromJson(serializer.fromJson<int?>(json['sharedOwnerMember'])),
      sharedDateUpdated:
          serializer.fromJson<DateTime?>(json['sharedDateUpdated']),
      sharedMembers: serializer.fromJson<List<String>?>(json['sharedMembers']),
      sharedAllMembersEver:
          serializer.fromJson<List<String>?>(json['sharedAllMembersEver']),
      isAbsoluteSpendingLimit:
          serializer.fromJson<bool>(json['isAbsoluteSpendingLimit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'budgetPk': serializer.toJson<String>(budgetPk),
      'name': serializer.toJson<String>(name),
      'amount': serializer.toJson<double>(amount),
      'colour': serializer.toJson<String?>(colour),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'walletFks': serializer.toJson<List<String>?>(walletFks),
      'categoryFks': serializer.toJson<List<String>?>(categoryFks),
      'categoryFksExclude':
          serializer.toJson<List<String>?>(categoryFksExclude),
      'income': serializer.toJson<bool>(income),
      'archived': serializer.toJson<bool>(archived),
      'addedTransactionsOnly': serializer.toJson<bool>(addedTransactionsOnly),
      'periodLength': serializer.toJson<int>(periodLength),
      'reoccurrence': serializer.toJson<int?>(
          $BudgetsTable.$converterreoccurrencen.toJson(reoccurrence)),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateTimeModified': serializer.toJson<DateTime?>(dateTimeModified),
      'pinned': serializer.toJson<bool>(pinned),
      'order': serializer.toJson<int>(order),
      'walletFk': serializer.toJson<String>(walletFk),
      'budgetTransactionFilters': serializer
          .toJson<List<BudgetTransactionFilters>?>(budgetTransactionFilters),
      'memberTransactionFilters':
          serializer.toJson<List<String>?>(memberTransactionFilters),
      'sharedKey': serializer.toJson<String?>(sharedKey),
      'sharedOwnerMember': serializer.toJson<int?>(
          $BudgetsTable.$convertersharedOwnerMembern.toJson(sharedOwnerMember)),
      'sharedDateUpdated': serializer.toJson<DateTime?>(sharedDateUpdated),
      'sharedMembers': serializer.toJson<List<String>?>(sharedMembers),
      'sharedAllMembersEver':
          serializer.toJson<List<String>?>(sharedAllMembersEver),
      'isAbsoluteSpendingLimit':
          serializer.toJson<bool>(isAbsoluteSpendingLimit),
    };
  }

  Budget copyWith(
          {String? budgetPk,
          String? name,
          double? amount,
          Value<String?> colour = const Value.absent(),
          DateTime? startDate,
          DateTime? endDate,
          Value<List<String>?> walletFks = const Value.absent(),
          Value<List<String>?> categoryFks = const Value.absent(),
          Value<List<String>?> categoryFksExclude = const Value.absent(),
          bool? income,
          bool? archived,
          bool? addedTransactionsOnly,
          int? periodLength,
          Value<BudgetReoccurence?> reoccurrence = const Value.absent(),
          DateTime? dateCreated,
          Value<DateTime?> dateTimeModified = const Value.absent(),
          bool? pinned,
          int? order,
          String? walletFk,
          Value<List<BudgetTransactionFilters>?> budgetTransactionFilters =
              const Value.absent(),
          Value<List<String>?> memberTransactionFilters = const Value.absent(),
          Value<String?> sharedKey = const Value.absent(),
          Value<SharedOwnerMember?> sharedOwnerMember = const Value.absent(),
          Value<DateTime?> sharedDateUpdated = const Value.absent(),
          Value<List<String>?> sharedMembers = const Value.absent(),
          Value<List<String>?> sharedAllMembersEver = const Value.absent(),
          bool? isAbsoluteSpendingLimit}) =>
      Budget(
        budgetPk: budgetPk ?? this.budgetPk,
        name: name ?? this.name,
        amount: amount ?? this.amount,
        colour: colour.present ? colour.value : this.colour,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        walletFks: walletFks.present ? walletFks.value : this.walletFks,
        categoryFks: categoryFks.present ? categoryFks.value : this.categoryFks,
        categoryFksExclude: categoryFksExclude.present
            ? categoryFksExclude.value
            : this.categoryFksExclude,
        income: income ?? this.income,
        archived: archived ?? this.archived,
        addedTransactionsOnly:
            addedTransactionsOnly ?? this.addedTransactionsOnly,
        periodLength: periodLength ?? this.periodLength,
        reoccurrence:
            reoccurrence.present ? reoccurrence.value : this.reoccurrence,
        dateCreated: dateCreated ?? this.dateCreated,
        dateTimeModified: dateTimeModified.present
            ? dateTimeModified.value
            : this.dateTimeModified,
        pinned: pinned ?? this.pinned,
        order: order ?? this.order,
        walletFk: walletFk ?? this.walletFk,
        budgetTransactionFilters: budgetTransactionFilters.present
            ? budgetTransactionFilters.value
            : this.budgetTransactionFilters,
        memberTransactionFilters: memberTransactionFilters.present
            ? memberTransactionFilters.value
            : this.memberTransactionFilters,
        sharedKey: sharedKey.present ? sharedKey.value : this.sharedKey,
        sharedOwnerMember: sharedOwnerMember.present
            ? sharedOwnerMember.value
            : this.sharedOwnerMember,
        sharedDateUpdated: sharedDateUpdated.present
            ? sharedDateUpdated.value
            : this.sharedDateUpdated,
        sharedMembers:
            sharedMembers.present ? sharedMembers.value : this.sharedMembers,
        sharedAllMembersEver: sharedAllMembersEver.present
            ? sharedAllMembersEver.value
            : this.sharedAllMembersEver,
        isAbsoluteSpendingLimit:
            isAbsoluteSpendingLimit ?? this.isAbsoluteSpendingLimit,
      );
  Budget copyWithCompanion(BudgetsCompanion data) {
    return Budget(
      budgetPk: data.budgetPk.present ? data.budgetPk.value : this.budgetPk,
      name: data.name.present ? data.name.value : this.name,
      amount: data.amount.present ? data.amount.value : this.amount,
      colour: data.colour.present ? data.colour.value : this.colour,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      walletFks: data.walletFks.present ? data.walletFks.value : this.walletFks,
      categoryFks:
          data.categoryFks.present ? data.categoryFks.value : this.categoryFks,
      categoryFksExclude: data.categoryFksExclude.present
          ? data.categoryFksExclude.value
          : this.categoryFksExclude,
      income: data.income.present ? data.income.value : this.income,
      archived: data.archived.present ? data.archived.value : this.archived,
      addedTransactionsOnly: data.addedTransactionsOnly.present
          ? data.addedTransactionsOnly.value
          : this.addedTransactionsOnly,
      periodLength: data.periodLength.present
          ? data.periodLength.value
          : this.periodLength,
      reoccurrence: data.reoccurrence.present
          ? data.reoccurrence.value
          : this.reoccurrence,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateTimeModified: data.dateTimeModified.present
          ? data.dateTimeModified.value
          : this.dateTimeModified,
      pinned: data.pinned.present ? data.pinned.value : this.pinned,
      order: data.order.present ? data.order.value : this.order,
      walletFk: data.walletFk.present ? data.walletFk.value : this.walletFk,
      budgetTransactionFilters: data.budgetTransactionFilters.present
          ? data.budgetTransactionFilters.value
          : this.budgetTransactionFilters,
      memberTransactionFilters: data.memberTransactionFilters.present
          ? data.memberTransactionFilters.value
          : this.memberTransactionFilters,
      sharedKey: data.sharedKey.present ? data.sharedKey.value : this.sharedKey,
      sharedOwnerMember: data.sharedOwnerMember.present
          ? data.sharedOwnerMember.value
          : this.sharedOwnerMember,
      sharedDateUpdated: data.sharedDateUpdated.present
          ? data.sharedDateUpdated.value
          : this.sharedDateUpdated,
      sharedMembers: data.sharedMembers.present
          ? data.sharedMembers.value
          : this.sharedMembers,
      sharedAllMembersEver: data.sharedAllMembersEver.present
          ? data.sharedAllMembersEver.value
          : this.sharedAllMembersEver,
      isAbsoluteSpendingLimit: data.isAbsoluteSpendingLimit.present
          ? data.isAbsoluteSpendingLimit.value
          : this.isAbsoluteSpendingLimit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Budget(')
          ..write('budgetPk: $budgetPk, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('colour: $colour, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('walletFks: $walletFks, ')
          ..write('categoryFks: $categoryFks, ')
          ..write('categoryFksExclude: $categoryFksExclude, ')
          ..write('income: $income, ')
          ..write('archived: $archived, ')
          ..write('addedTransactionsOnly: $addedTransactionsOnly, ')
          ..write('periodLength: $periodLength, ')
          ..write('reoccurrence: $reoccurrence, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('pinned: $pinned, ')
          ..write('order: $order, ')
          ..write('walletFk: $walletFk, ')
          ..write('budgetTransactionFilters: $budgetTransactionFilters, ')
          ..write('memberTransactionFilters: $memberTransactionFilters, ')
          ..write('sharedKey: $sharedKey, ')
          ..write('sharedOwnerMember: $sharedOwnerMember, ')
          ..write('sharedDateUpdated: $sharedDateUpdated, ')
          ..write('sharedMembers: $sharedMembers, ')
          ..write('sharedAllMembersEver: $sharedAllMembersEver, ')
          ..write('isAbsoluteSpendingLimit: $isAbsoluteSpendingLimit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        budgetPk,
        name,
        amount,
        colour,
        startDate,
        endDate,
        walletFks,
        categoryFks,
        categoryFksExclude,
        income,
        archived,
        addedTransactionsOnly,
        periodLength,
        reoccurrence,
        dateCreated,
        dateTimeModified,
        pinned,
        order,
        walletFk,
        budgetTransactionFilters,
        memberTransactionFilters,
        sharedKey,
        sharedOwnerMember,
        sharedDateUpdated,
        sharedMembers,
        sharedAllMembersEver,
        isAbsoluteSpendingLimit
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Budget &&
          other.budgetPk == this.budgetPk &&
          other.name == this.name &&
          other.amount == this.amount &&
          other.colour == this.colour &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.walletFks == this.walletFks &&
          other.categoryFks == this.categoryFks &&
          other.categoryFksExclude == this.categoryFksExclude &&
          other.income == this.income &&
          other.archived == this.archived &&
          other.addedTransactionsOnly == this.addedTransactionsOnly &&
          other.periodLength == this.periodLength &&
          other.reoccurrence == this.reoccurrence &&
          other.dateCreated == this.dateCreated &&
          other.dateTimeModified == this.dateTimeModified &&
          other.pinned == this.pinned &&
          other.order == this.order &&
          other.walletFk == this.walletFk &&
          other.budgetTransactionFilters == this.budgetTransactionFilters &&
          other.memberTransactionFilters == this.memberTransactionFilters &&
          other.sharedKey == this.sharedKey &&
          other.sharedOwnerMember == this.sharedOwnerMember &&
          other.sharedDateUpdated == this.sharedDateUpdated &&
          other.sharedMembers == this.sharedMembers &&
          other.sharedAllMembersEver == this.sharedAllMembersEver &&
          other.isAbsoluteSpendingLimit == this.isAbsoluteSpendingLimit);
}

class BudgetsCompanion extends UpdateCompanion<Budget> {
  final Value<String> budgetPk;
  final Value<String> name;
  final Value<double> amount;
  final Value<String?> colour;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<List<String>?> walletFks;
  final Value<List<String>?> categoryFks;
  final Value<List<String>?> categoryFksExclude;
  final Value<bool> income;
  final Value<bool> archived;
  final Value<bool> addedTransactionsOnly;
  final Value<int> periodLength;
  final Value<BudgetReoccurence?> reoccurrence;
  final Value<DateTime> dateCreated;
  final Value<DateTime?> dateTimeModified;
  final Value<bool> pinned;
  final Value<int> order;
  final Value<String> walletFk;
  final Value<List<BudgetTransactionFilters>?> budgetTransactionFilters;
  final Value<List<String>?> memberTransactionFilters;
  final Value<String?> sharedKey;
  final Value<SharedOwnerMember?> sharedOwnerMember;
  final Value<DateTime?> sharedDateUpdated;
  final Value<List<String>?> sharedMembers;
  final Value<List<String>?> sharedAllMembersEver;
  final Value<bool> isAbsoluteSpendingLimit;
  final Value<int> rowid;
  const BudgetsCompanion({
    this.budgetPk = const Value.absent(),
    this.name = const Value.absent(),
    this.amount = const Value.absent(),
    this.colour = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.walletFks = const Value.absent(),
    this.categoryFks = const Value.absent(),
    this.categoryFksExclude = const Value.absent(),
    this.income = const Value.absent(),
    this.archived = const Value.absent(),
    this.addedTransactionsOnly = const Value.absent(),
    this.periodLength = const Value.absent(),
    this.reoccurrence = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.pinned = const Value.absent(),
    this.order = const Value.absent(),
    this.walletFk = const Value.absent(),
    this.budgetTransactionFilters = const Value.absent(),
    this.memberTransactionFilters = const Value.absent(),
    this.sharedKey = const Value.absent(),
    this.sharedOwnerMember = const Value.absent(),
    this.sharedDateUpdated = const Value.absent(),
    this.sharedMembers = const Value.absent(),
    this.sharedAllMembersEver = const Value.absent(),
    this.isAbsoluteSpendingLimit = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BudgetsCompanion.insert({
    this.budgetPk = const Value.absent(),
    required String name,
    required double amount,
    this.colour = const Value.absent(),
    required DateTime startDate,
    required DateTime endDate,
    this.walletFks = const Value.absent(),
    this.categoryFks = const Value.absent(),
    this.categoryFksExclude = const Value.absent(),
    this.income = const Value.absent(),
    this.archived = const Value.absent(),
    this.addedTransactionsOnly = const Value.absent(),
    required int periodLength,
    this.reoccurrence = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.pinned = const Value.absent(),
    required int order,
    this.walletFk = const Value.absent(),
    this.budgetTransactionFilters = const Value.absent(),
    this.memberTransactionFilters = const Value.absent(),
    this.sharedKey = const Value.absent(),
    this.sharedOwnerMember = const Value.absent(),
    this.sharedDateUpdated = const Value.absent(),
    this.sharedMembers = const Value.absent(),
    this.sharedAllMembersEver = const Value.absent(),
    this.isAbsoluteSpendingLimit = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        amount = Value(amount),
        startDate = Value(startDate),
        endDate = Value(endDate),
        periodLength = Value(periodLength),
        order = Value(order);
  static Insertable<Budget> custom({
    Expression<String>? budgetPk,
    Expression<String>? name,
    Expression<double>? amount,
    Expression<String>? colour,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? walletFks,
    Expression<String>? categoryFks,
    Expression<String>? categoryFksExclude,
    Expression<bool>? income,
    Expression<bool>? archived,
    Expression<bool>? addedTransactionsOnly,
    Expression<int>? periodLength,
    Expression<int>? reoccurrence,
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateTimeModified,
    Expression<bool>? pinned,
    Expression<int>? order,
    Expression<String>? walletFk,
    Expression<String>? budgetTransactionFilters,
    Expression<String>? memberTransactionFilters,
    Expression<String>? sharedKey,
    Expression<int>? sharedOwnerMember,
    Expression<DateTime>? sharedDateUpdated,
    Expression<String>? sharedMembers,
    Expression<String>? sharedAllMembersEver,
    Expression<bool>? isAbsoluteSpendingLimit,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (budgetPk != null) 'budget_pk': budgetPk,
      if (name != null) 'name': name,
      if (amount != null) 'amount': amount,
      if (colour != null) 'colour': colour,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (walletFks != null) 'wallet_fks': walletFks,
      if (categoryFks != null) 'category_fks': categoryFks,
      if (categoryFksExclude != null)
        'category_fks_exclude': categoryFksExclude,
      if (income != null) 'income': income,
      if (archived != null) 'archived': archived,
      if (addedTransactionsOnly != null)
        'added_transactions_only': addedTransactionsOnly,
      if (periodLength != null) 'period_length': periodLength,
      if (reoccurrence != null) 'reoccurrence': reoccurrence,
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateTimeModified != null) 'date_time_modified': dateTimeModified,
      if (pinned != null) 'pinned': pinned,
      if (order != null) 'order': order,
      if (walletFk != null) 'wallet_fk': walletFk,
      if (budgetTransactionFilters != null)
        'budget_transaction_filters': budgetTransactionFilters,
      if (memberTransactionFilters != null)
        'member_transaction_filters': memberTransactionFilters,
      if (sharedKey != null) 'shared_key': sharedKey,
      if (sharedOwnerMember != null) 'shared_owner_member': sharedOwnerMember,
      if (sharedDateUpdated != null) 'shared_date_updated': sharedDateUpdated,
      if (sharedMembers != null) 'shared_members': sharedMembers,
      if (sharedAllMembersEver != null)
        'shared_all_members_ever': sharedAllMembersEver,
      if (isAbsoluteSpendingLimit != null)
        'is_absolute_spending_limit': isAbsoluteSpendingLimit,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BudgetsCompanion copyWith(
      {Value<String>? budgetPk,
      Value<String>? name,
      Value<double>? amount,
      Value<String?>? colour,
      Value<DateTime>? startDate,
      Value<DateTime>? endDate,
      Value<List<String>?>? walletFks,
      Value<List<String>?>? categoryFks,
      Value<List<String>?>? categoryFksExclude,
      Value<bool>? income,
      Value<bool>? archived,
      Value<bool>? addedTransactionsOnly,
      Value<int>? periodLength,
      Value<BudgetReoccurence?>? reoccurrence,
      Value<DateTime>? dateCreated,
      Value<DateTime?>? dateTimeModified,
      Value<bool>? pinned,
      Value<int>? order,
      Value<String>? walletFk,
      Value<List<BudgetTransactionFilters>?>? budgetTransactionFilters,
      Value<List<String>?>? memberTransactionFilters,
      Value<String?>? sharedKey,
      Value<SharedOwnerMember?>? sharedOwnerMember,
      Value<DateTime?>? sharedDateUpdated,
      Value<List<String>?>? sharedMembers,
      Value<List<String>?>? sharedAllMembersEver,
      Value<bool>? isAbsoluteSpendingLimit,
      Value<int>? rowid}) {
    return BudgetsCompanion(
      budgetPk: budgetPk ?? this.budgetPk,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      colour: colour ?? this.colour,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      walletFks: walletFks ?? this.walletFks,
      categoryFks: categoryFks ?? this.categoryFks,
      categoryFksExclude: categoryFksExclude ?? this.categoryFksExclude,
      income: income ?? this.income,
      archived: archived ?? this.archived,
      addedTransactionsOnly:
          addedTransactionsOnly ?? this.addedTransactionsOnly,
      periodLength: periodLength ?? this.periodLength,
      reoccurrence: reoccurrence ?? this.reoccurrence,
      dateCreated: dateCreated ?? this.dateCreated,
      dateTimeModified: dateTimeModified ?? this.dateTimeModified,
      pinned: pinned ?? this.pinned,
      order: order ?? this.order,
      walletFk: walletFk ?? this.walletFk,
      budgetTransactionFilters:
          budgetTransactionFilters ?? this.budgetTransactionFilters,
      memberTransactionFilters:
          memberTransactionFilters ?? this.memberTransactionFilters,
      sharedKey: sharedKey ?? this.sharedKey,
      sharedOwnerMember: sharedOwnerMember ?? this.sharedOwnerMember,
      sharedDateUpdated: sharedDateUpdated ?? this.sharedDateUpdated,
      sharedMembers: sharedMembers ?? this.sharedMembers,
      sharedAllMembersEver: sharedAllMembersEver ?? this.sharedAllMembersEver,
      isAbsoluteSpendingLimit:
          isAbsoluteSpendingLimit ?? this.isAbsoluteSpendingLimit,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (budgetPk.present) {
      map['budget_pk'] = Variable<String>(budgetPk.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (colour.present) {
      map['colour'] = Variable<String>(colour.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (walletFks.present) {
      map['wallet_fks'] = Variable<String>(
          $BudgetsTable.$converterwalletFksn.toSql(walletFks.value));
    }
    if (categoryFks.present) {
      map['category_fks'] = Variable<String>(
          $BudgetsTable.$convertercategoryFksn.toSql(categoryFks.value));
    }
    if (categoryFksExclude.present) {
      map['category_fks_exclude'] = Variable<String>($BudgetsTable
          .$convertercategoryFksExcluden
          .toSql(categoryFksExclude.value));
    }
    if (income.present) {
      map['income'] = Variable<bool>(income.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (addedTransactionsOnly.present) {
      map['added_transactions_only'] =
          Variable<bool>(addedTransactionsOnly.value);
    }
    if (periodLength.present) {
      map['period_length'] = Variable<int>(periodLength.value);
    }
    if (reoccurrence.present) {
      map['reoccurrence'] = Variable<int>(
          $BudgetsTable.$converterreoccurrencen.toSql(reoccurrence.value));
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateTimeModified.present) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified.value);
    }
    if (pinned.present) {
      map['pinned'] = Variable<bool>(pinned.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (walletFk.present) {
      map['wallet_fk'] = Variable<String>(walletFk.value);
    }
    if (budgetTransactionFilters.present) {
      map['budget_transaction_filters'] = Variable<String>($BudgetsTable
          .$converterbudgetTransactionFiltersn
          .toSql(budgetTransactionFilters.value));
    }
    if (memberTransactionFilters.present) {
      map['member_transaction_filters'] = Variable<String>($BudgetsTable
          .$convertermemberTransactionFiltersn
          .toSql(memberTransactionFilters.value));
    }
    if (sharedKey.present) {
      map['shared_key'] = Variable<String>(sharedKey.value);
    }
    if (sharedOwnerMember.present) {
      map['shared_owner_member'] = Variable<int>($BudgetsTable
          .$convertersharedOwnerMembern
          .toSql(sharedOwnerMember.value));
    }
    if (sharedDateUpdated.present) {
      map['shared_date_updated'] = Variable<DateTime>(sharedDateUpdated.value);
    }
    if (sharedMembers.present) {
      map['shared_members'] = Variable<String>(
          $BudgetsTable.$convertersharedMembersn.toSql(sharedMembers.value));
    }
    if (sharedAllMembersEver.present) {
      map['shared_all_members_ever'] = Variable<String>($BudgetsTable
          .$convertersharedAllMembersEvern
          .toSql(sharedAllMembersEver.value));
    }
    if (isAbsoluteSpendingLimit.present) {
      map['is_absolute_spending_limit'] =
          Variable<bool>(isAbsoluteSpendingLimit.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetsCompanion(')
          ..write('budgetPk: $budgetPk, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('colour: $colour, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('walletFks: $walletFks, ')
          ..write('categoryFks: $categoryFks, ')
          ..write('categoryFksExclude: $categoryFksExclude, ')
          ..write('income: $income, ')
          ..write('archived: $archived, ')
          ..write('addedTransactionsOnly: $addedTransactionsOnly, ')
          ..write('periodLength: $periodLength, ')
          ..write('reoccurrence: $reoccurrence, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('pinned: $pinned, ')
          ..write('order: $order, ')
          ..write('walletFk: $walletFk, ')
          ..write('budgetTransactionFilters: $budgetTransactionFilters, ')
          ..write('memberTransactionFilters: $memberTransactionFilters, ')
          ..write('sharedKey: $sharedKey, ')
          ..write('sharedOwnerMember: $sharedOwnerMember, ')
          ..write('sharedDateUpdated: $sharedDateUpdated, ')
          ..write('sharedMembers: $sharedMembers, ')
          ..write('sharedAllMembersEver: $sharedAllMembersEver, ')
          ..write('isAbsoluteSpendingLimit: $isAbsoluteSpendingLimit, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoryBudgetLimitsTable extends CategoryBudgetLimits
    with TableInfo<$CategoryBudgetLimitsTable, CategoryBudgetLimit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryBudgetLimitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _categoryLimitPkMeta =
      const VerificationMeta('categoryLimitPk');
  @override
  late final GeneratedColumn<String> categoryLimitPk = GeneratedColumn<String>(
      'category_limit_pk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _categoryFkMeta =
      const VerificationMeta('categoryFk');
  @override
  late final GeneratedColumn<String> categoryFk = GeneratedColumn<String>(
      'category_fk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories (category_pk)'));
  static const VerificationMeta _budgetFkMeta =
      const VerificationMeta('budgetFk');
  @override
  late final GeneratedColumn<String> budgetFk = GeneratedColumn<String>(
      'budget_fk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES budgets (budget_pk)'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dateTimeModifiedMeta =
      const VerificationMeta('dateTimeModified');
  @override
  late final GeneratedColumn<DateTime> dateTimeModified =
      GeneratedColumn<DateTime>('date_time_modified', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _walletFkMeta =
      const VerificationMeta('walletFk');
  @override
  late final GeneratedColumn<String> walletFk = GeneratedColumn<String>(
      'wallet_fk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES wallets (wallet_pk)'),
      defaultValue: const Constant("0"));
  @override
  List<GeneratedColumn> get $columns => [
        categoryLimitPk,
        categoryFk,
        budgetFk,
        amount,
        dateTimeModified,
        walletFk
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_budget_limits';
  @override
  VerificationContext validateIntegrity(
      Insertable<CategoryBudgetLimit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category_limit_pk')) {
      context.handle(
          _categoryLimitPkMeta,
          categoryLimitPk.isAcceptableOrUnknown(
              data['category_limit_pk']!, _categoryLimitPkMeta));
    }
    if (data.containsKey('category_fk')) {
      context.handle(
          _categoryFkMeta,
          categoryFk.isAcceptableOrUnknown(
              data['category_fk']!, _categoryFkMeta));
    } else if (isInserting) {
      context.missing(_categoryFkMeta);
    }
    if (data.containsKey('budget_fk')) {
      context.handle(_budgetFkMeta,
          budgetFk.isAcceptableOrUnknown(data['budget_fk']!, _budgetFkMeta));
    } else if (isInserting) {
      context.missing(_budgetFkMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date_time_modified')) {
      context.handle(
          _dateTimeModifiedMeta,
          dateTimeModified.isAcceptableOrUnknown(
              data['date_time_modified']!, _dateTimeModifiedMeta));
    }
    if (data.containsKey('wallet_fk')) {
      context.handle(_walletFkMeta,
          walletFk.isAcceptableOrUnknown(data['wallet_fk']!, _walletFkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {categoryLimitPk};
  @override
  CategoryBudgetLimit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryBudgetLimit(
      categoryLimitPk: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}category_limit_pk'])!,
      categoryFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_fk'])!,
      budgetFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}budget_fk'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      dateTimeModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_modified']),
      walletFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wallet_fk'])!,
    );
  }

  @override
  $CategoryBudgetLimitsTable createAlias(String alias) {
    return $CategoryBudgetLimitsTable(attachedDatabase, alias);
  }
}

class CategoryBudgetLimit extends DataClass
    implements Insertable<CategoryBudgetLimit> {
  final String categoryLimitPk;
  final String categoryFk;
  final String budgetFk;
  final double amount;
  final DateTime? dateTimeModified;
  final String walletFk;
  const CategoryBudgetLimit(
      {required this.categoryLimitPk,
      required this.categoryFk,
      required this.budgetFk,
      required this.amount,
      this.dateTimeModified,
      required this.walletFk});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['category_limit_pk'] = Variable<String>(categoryLimitPk);
    map['category_fk'] = Variable<String>(categoryFk);
    map['budget_fk'] = Variable<String>(budgetFk);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || dateTimeModified != null) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified);
    }
    map['wallet_fk'] = Variable<String>(walletFk);
    return map;
  }

  CategoryBudgetLimitsCompanion toCompanion(bool nullToAbsent) {
    return CategoryBudgetLimitsCompanion(
      categoryLimitPk: Value(categoryLimitPk),
      categoryFk: Value(categoryFk),
      budgetFk: Value(budgetFk),
      amount: Value(amount),
      dateTimeModified: dateTimeModified == null && nullToAbsent
          ? const Value.absent()
          : Value(dateTimeModified),
      walletFk: Value(walletFk),
    );
  }

  factory CategoryBudgetLimit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryBudgetLimit(
      categoryLimitPk: serializer.fromJson<String>(json['categoryLimitPk']),
      categoryFk: serializer.fromJson<String>(json['categoryFk']),
      budgetFk: serializer.fromJson<String>(json['budgetFk']),
      amount: serializer.fromJson<double>(json['amount']),
      dateTimeModified:
          serializer.fromJson<DateTime?>(json['dateTimeModified']),
      walletFk: serializer.fromJson<String>(json['walletFk']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'categoryLimitPk': serializer.toJson<String>(categoryLimitPk),
      'categoryFk': serializer.toJson<String>(categoryFk),
      'budgetFk': serializer.toJson<String>(budgetFk),
      'amount': serializer.toJson<double>(amount),
      'dateTimeModified': serializer.toJson<DateTime?>(dateTimeModified),
      'walletFk': serializer.toJson<String>(walletFk),
    };
  }

  CategoryBudgetLimit copyWith(
          {String? categoryLimitPk,
          String? categoryFk,
          String? budgetFk,
          double? amount,
          Value<DateTime?> dateTimeModified = const Value.absent(),
          String? walletFk}) =>
      CategoryBudgetLimit(
        categoryLimitPk: categoryLimitPk ?? this.categoryLimitPk,
        categoryFk: categoryFk ?? this.categoryFk,
        budgetFk: budgetFk ?? this.budgetFk,
        amount: amount ?? this.amount,
        dateTimeModified: dateTimeModified.present
            ? dateTimeModified.value
            : this.dateTimeModified,
        walletFk: walletFk ?? this.walletFk,
      );
  CategoryBudgetLimit copyWithCompanion(CategoryBudgetLimitsCompanion data) {
    return CategoryBudgetLimit(
      categoryLimitPk: data.categoryLimitPk.present
          ? data.categoryLimitPk.value
          : this.categoryLimitPk,
      categoryFk:
          data.categoryFk.present ? data.categoryFk.value : this.categoryFk,
      budgetFk: data.budgetFk.present ? data.budgetFk.value : this.budgetFk,
      amount: data.amount.present ? data.amount.value : this.amount,
      dateTimeModified: data.dateTimeModified.present
          ? data.dateTimeModified.value
          : this.dateTimeModified,
      walletFk: data.walletFk.present ? data.walletFk.value : this.walletFk,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryBudgetLimit(')
          ..write('categoryLimitPk: $categoryLimitPk, ')
          ..write('categoryFk: $categoryFk, ')
          ..write('budgetFk: $budgetFk, ')
          ..write('amount: $amount, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('walletFk: $walletFk')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(categoryLimitPk, categoryFk, budgetFk, amount,
      dateTimeModified, walletFk);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryBudgetLimit &&
          other.categoryLimitPk == this.categoryLimitPk &&
          other.categoryFk == this.categoryFk &&
          other.budgetFk == this.budgetFk &&
          other.amount == this.amount &&
          other.dateTimeModified == this.dateTimeModified &&
          other.walletFk == this.walletFk);
}

class CategoryBudgetLimitsCompanion
    extends UpdateCompanion<CategoryBudgetLimit> {
  final Value<String> categoryLimitPk;
  final Value<String> categoryFk;
  final Value<String> budgetFk;
  final Value<double> amount;
  final Value<DateTime?> dateTimeModified;
  final Value<String> walletFk;
  final Value<int> rowid;
  const CategoryBudgetLimitsCompanion({
    this.categoryLimitPk = const Value.absent(),
    this.categoryFk = const Value.absent(),
    this.budgetFk = const Value.absent(),
    this.amount = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.walletFk = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryBudgetLimitsCompanion.insert({
    this.categoryLimitPk = const Value.absent(),
    required String categoryFk,
    required String budgetFk,
    required double amount,
    this.dateTimeModified = const Value.absent(),
    this.walletFk = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : categoryFk = Value(categoryFk),
        budgetFk = Value(budgetFk),
        amount = Value(amount);
  static Insertable<CategoryBudgetLimit> custom({
    Expression<String>? categoryLimitPk,
    Expression<String>? categoryFk,
    Expression<String>? budgetFk,
    Expression<double>? amount,
    Expression<DateTime>? dateTimeModified,
    Expression<String>? walletFk,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (categoryLimitPk != null) 'category_limit_pk': categoryLimitPk,
      if (categoryFk != null) 'category_fk': categoryFk,
      if (budgetFk != null) 'budget_fk': budgetFk,
      if (amount != null) 'amount': amount,
      if (dateTimeModified != null) 'date_time_modified': dateTimeModified,
      if (walletFk != null) 'wallet_fk': walletFk,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoryBudgetLimitsCompanion copyWith(
      {Value<String>? categoryLimitPk,
      Value<String>? categoryFk,
      Value<String>? budgetFk,
      Value<double>? amount,
      Value<DateTime?>? dateTimeModified,
      Value<String>? walletFk,
      Value<int>? rowid}) {
    return CategoryBudgetLimitsCompanion(
      categoryLimitPk: categoryLimitPk ?? this.categoryLimitPk,
      categoryFk: categoryFk ?? this.categoryFk,
      budgetFk: budgetFk ?? this.budgetFk,
      amount: amount ?? this.amount,
      dateTimeModified: dateTimeModified ?? this.dateTimeModified,
      walletFk: walletFk ?? this.walletFk,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (categoryLimitPk.present) {
      map['category_limit_pk'] = Variable<String>(categoryLimitPk.value);
    }
    if (categoryFk.present) {
      map['category_fk'] = Variable<String>(categoryFk.value);
    }
    if (budgetFk.present) {
      map['budget_fk'] = Variable<String>(budgetFk.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (dateTimeModified.present) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified.value);
    }
    if (walletFk.present) {
      map['wallet_fk'] = Variable<String>(walletFk.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryBudgetLimitsCompanion(')
          ..write('categoryLimitPk: $categoryLimitPk, ')
          ..write('categoryFk: $categoryFk, ')
          ..write('budgetFk: $budgetFk, ')
          ..write('amount: $amount, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('walletFk: $walletFk, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssociatedTitlesTable extends AssociatedTitles
    with TableInfo<$AssociatedTitlesTable, TransactionAssociatedTitle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssociatedTitlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _associatedTitlePkMeta =
      const VerificationMeta('associatedTitlePk');
  @override
  late final GeneratedColumn<String> associatedTitlePk =
      GeneratedColumn<String>('associated_title_pk', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          clientDefault: () => uuid.v4());
  static const VerificationMeta _categoryFkMeta =
      const VerificationMeta('categoryFk');
  @override
  late final GeneratedColumn<String> categoryFk = GeneratedColumn<String>(
      'category_fk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories (category_pk)'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => new DateTime.now());
  static const VerificationMeta _dateTimeModifiedMeta =
      const VerificationMeta('dateTimeModified');
  @override
  late final GeneratedColumn<DateTime> dateTimeModified =
      GeneratedColumn<DateTime>('date_time_modified', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isExactMatchMeta =
      const VerificationMeta('isExactMatch');
  @override
  late final GeneratedColumn<bool> isExactMatch = GeneratedColumn<bool>(
      'is_exact_match', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_exact_match" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        associatedTitlePk,
        categoryFk,
        title,
        dateCreated,
        dateTimeModified,
        order,
        isExactMatch
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'associated_titles';
  @override
  VerificationContext validateIntegrity(
      Insertable<TransactionAssociatedTitle> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('associated_title_pk')) {
      context.handle(
          _associatedTitlePkMeta,
          associatedTitlePk.isAcceptableOrUnknown(
              data['associated_title_pk']!, _associatedTitlePkMeta));
    }
    if (data.containsKey('category_fk')) {
      context.handle(
          _categoryFkMeta,
          categoryFk.isAcceptableOrUnknown(
              data['category_fk']!, _categoryFkMeta));
    } else if (isInserting) {
      context.missing(_categoryFkMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_time_modified')) {
      context.handle(
          _dateTimeModifiedMeta,
          dateTimeModified.isAcceptableOrUnknown(
              data['date_time_modified']!, _dateTimeModifiedMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('is_exact_match')) {
      context.handle(
          _isExactMatchMeta,
          isExactMatch.isAcceptableOrUnknown(
              data['is_exact_match']!, _isExactMatchMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {associatedTitlePk};
  @override
  TransactionAssociatedTitle map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionAssociatedTitle(
      associatedTitlePk: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}associated_title_pk'])!,
      categoryFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_fk'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateTimeModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_modified']),
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      isExactMatch: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_exact_match'])!,
    );
  }

  @override
  $AssociatedTitlesTable createAlias(String alias) {
    return $AssociatedTitlesTable(attachedDatabase, alias);
  }
}

class TransactionAssociatedTitle extends DataClass
    implements Insertable<TransactionAssociatedTitle> {
  final String associatedTitlePk;
  final String categoryFk;
  final String title;
  final DateTime dateCreated;
  final DateTime? dateTimeModified;
  final int order;
  final bool isExactMatch;
  const TransactionAssociatedTitle(
      {required this.associatedTitlePk,
      required this.categoryFk,
      required this.title,
      required this.dateCreated,
      this.dateTimeModified,
      required this.order,
      required this.isExactMatch});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['associated_title_pk'] = Variable<String>(associatedTitlePk);
    map['category_fk'] = Variable<String>(categoryFk);
    map['title'] = Variable<String>(title);
    map['date_created'] = Variable<DateTime>(dateCreated);
    if (!nullToAbsent || dateTimeModified != null) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified);
    }
    map['order'] = Variable<int>(order);
    map['is_exact_match'] = Variable<bool>(isExactMatch);
    return map;
  }

  AssociatedTitlesCompanion toCompanion(bool nullToAbsent) {
    return AssociatedTitlesCompanion(
      associatedTitlePk: Value(associatedTitlePk),
      categoryFk: Value(categoryFk),
      title: Value(title),
      dateCreated: Value(dateCreated),
      dateTimeModified: dateTimeModified == null && nullToAbsent
          ? const Value.absent()
          : Value(dateTimeModified),
      order: Value(order),
      isExactMatch: Value(isExactMatch),
    );
  }

  factory TransactionAssociatedTitle.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionAssociatedTitle(
      associatedTitlePk: serializer.fromJson<String>(json['associatedTitlePk']),
      categoryFk: serializer.fromJson<String>(json['categoryFk']),
      title: serializer.fromJson<String>(json['title']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateTimeModified:
          serializer.fromJson<DateTime?>(json['dateTimeModified']),
      order: serializer.fromJson<int>(json['order']),
      isExactMatch: serializer.fromJson<bool>(json['isExactMatch']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'associatedTitlePk': serializer.toJson<String>(associatedTitlePk),
      'categoryFk': serializer.toJson<String>(categoryFk),
      'title': serializer.toJson<String>(title),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateTimeModified': serializer.toJson<DateTime?>(dateTimeModified),
      'order': serializer.toJson<int>(order),
      'isExactMatch': serializer.toJson<bool>(isExactMatch),
    };
  }

  TransactionAssociatedTitle copyWith(
          {String? associatedTitlePk,
          String? categoryFk,
          String? title,
          DateTime? dateCreated,
          Value<DateTime?> dateTimeModified = const Value.absent(),
          int? order,
          bool? isExactMatch}) =>
      TransactionAssociatedTitle(
        associatedTitlePk: associatedTitlePk ?? this.associatedTitlePk,
        categoryFk: categoryFk ?? this.categoryFk,
        title: title ?? this.title,
        dateCreated: dateCreated ?? this.dateCreated,
        dateTimeModified: dateTimeModified.present
            ? dateTimeModified.value
            : this.dateTimeModified,
        order: order ?? this.order,
        isExactMatch: isExactMatch ?? this.isExactMatch,
      );
  TransactionAssociatedTitle copyWithCompanion(AssociatedTitlesCompanion data) {
    return TransactionAssociatedTitle(
      associatedTitlePk: data.associatedTitlePk.present
          ? data.associatedTitlePk.value
          : this.associatedTitlePk,
      categoryFk:
          data.categoryFk.present ? data.categoryFk.value : this.categoryFk,
      title: data.title.present ? data.title.value : this.title,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateTimeModified: data.dateTimeModified.present
          ? data.dateTimeModified.value
          : this.dateTimeModified,
      order: data.order.present ? data.order.value : this.order,
      isExactMatch: data.isExactMatch.present
          ? data.isExactMatch.value
          : this.isExactMatch,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionAssociatedTitle(')
          ..write('associatedTitlePk: $associatedTitlePk, ')
          ..write('categoryFk: $categoryFk, ')
          ..write('title: $title, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('order: $order, ')
          ..write('isExactMatch: $isExactMatch')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(associatedTitlePk, categoryFk, title,
      dateCreated, dateTimeModified, order, isExactMatch);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionAssociatedTitle &&
          other.associatedTitlePk == this.associatedTitlePk &&
          other.categoryFk == this.categoryFk &&
          other.title == this.title &&
          other.dateCreated == this.dateCreated &&
          other.dateTimeModified == this.dateTimeModified &&
          other.order == this.order &&
          other.isExactMatch == this.isExactMatch);
}

class AssociatedTitlesCompanion
    extends UpdateCompanion<TransactionAssociatedTitle> {
  final Value<String> associatedTitlePk;
  final Value<String> categoryFk;
  final Value<String> title;
  final Value<DateTime> dateCreated;
  final Value<DateTime?> dateTimeModified;
  final Value<int> order;
  final Value<bool> isExactMatch;
  final Value<int> rowid;
  const AssociatedTitlesCompanion({
    this.associatedTitlePk = const Value.absent(),
    this.categoryFk = const Value.absent(),
    this.title = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.order = const Value.absent(),
    this.isExactMatch = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssociatedTitlesCompanion.insert({
    this.associatedTitlePk = const Value.absent(),
    required String categoryFk,
    required String title,
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    required int order,
    this.isExactMatch = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : categoryFk = Value(categoryFk),
        title = Value(title),
        order = Value(order);
  static Insertable<TransactionAssociatedTitle> custom({
    Expression<String>? associatedTitlePk,
    Expression<String>? categoryFk,
    Expression<String>? title,
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateTimeModified,
    Expression<int>? order,
    Expression<bool>? isExactMatch,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (associatedTitlePk != null) 'associated_title_pk': associatedTitlePk,
      if (categoryFk != null) 'category_fk': categoryFk,
      if (title != null) 'title': title,
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateTimeModified != null) 'date_time_modified': dateTimeModified,
      if (order != null) 'order': order,
      if (isExactMatch != null) 'is_exact_match': isExactMatch,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssociatedTitlesCompanion copyWith(
      {Value<String>? associatedTitlePk,
      Value<String>? categoryFk,
      Value<String>? title,
      Value<DateTime>? dateCreated,
      Value<DateTime?>? dateTimeModified,
      Value<int>? order,
      Value<bool>? isExactMatch,
      Value<int>? rowid}) {
    return AssociatedTitlesCompanion(
      associatedTitlePk: associatedTitlePk ?? this.associatedTitlePk,
      categoryFk: categoryFk ?? this.categoryFk,
      title: title ?? this.title,
      dateCreated: dateCreated ?? this.dateCreated,
      dateTimeModified: dateTimeModified ?? this.dateTimeModified,
      order: order ?? this.order,
      isExactMatch: isExactMatch ?? this.isExactMatch,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (associatedTitlePk.present) {
      map['associated_title_pk'] = Variable<String>(associatedTitlePk.value);
    }
    if (categoryFk.present) {
      map['category_fk'] = Variable<String>(categoryFk.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateTimeModified.present) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (isExactMatch.present) {
      map['is_exact_match'] = Variable<bool>(isExactMatch.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssociatedTitlesCompanion(')
          ..write('associatedTitlePk: $associatedTitlePk, ')
          ..write('categoryFk: $categoryFk, ')
          ..write('title: $title, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('order: $order, ')
          ..write('isExactMatch: $isExactMatch, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _settingsPkMeta =
      const VerificationMeta('settingsPk');
  @override
  late final GeneratedColumn<int> settingsPk = GeneratedColumn<int>(
      'settings_pk', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _settingsJSONMeta =
      const VerificationMeta('settingsJSON');
  @override
  late final GeneratedColumn<String> settingsJSON = GeneratedColumn<String>(
      'settings_j_s_o_n', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateUpdatedMeta =
      const VerificationMeta('dateUpdated');
  @override
  late final GeneratedColumn<DateTime> dateUpdated = GeneratedColumn<DateTime>(
      'date_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => new DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [settingsPk, settingsJSON, dateUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<AppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('settings_pk')) {
      context.handle(
          _settingsPkMeta,
          settingsPk.isAcceptableOrUnknown(
              data['settings_pk']!, _settingsPkMeta));
    }
    if (data.containsKey('settings_j_s_o_n')) {
      context.handle(
          _settingsJSONMeta,
          settingsJSON.isAcceptableOrUnknown(
              data['settings_j_s_o_n']!, _settingsJSONMeta));
    } else if (isInserting) {
      context.missing(_settingsJSONMeta);
    }
    if (data.containsKey('date_updated')) {
      context.handle(
          _dateUpdatedMeta,
          dateUpdated.isAcceptableOrUnknown(
              data['date_updated']!, _dateUpdatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {settingsPk};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      settingsPk: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}settings_pk'])!,
      settingsJSON: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}settings_j_s_o_n'])!,
      dateUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_updated'])!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final int settingsPk;
  final String settingsJSON;
  final DateTime dateUpdated;
  const AppSetting(
      {required this.settingsPk,
      required this.settingsJSON,
      required this.dateUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['settings_pk'] = Variable<int>(settingsPk);
    map['settings_j_s_o_n'] = Variable<String>(settingsJSON);
    map['date_updated'] = Variable<DateTime>(dateUpdated);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      settingsPk: Value(settingsPk),
      settingsJSON: Value(settingsJSON),
      dateUpdated: Value(dateUpdated),
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      settingsPk: serializer.fromJson<int>(json['settingsPk']),
      settingsJSON: serializer.fromJson<String>(json['settingsJSON']),
      dateUpdated: serializer.fromJson<DateTime>(json['dateUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'settingsPk': serializer.toJson<int>(settingsPk),
      'settingsJSON': serializer.toJson<String>(settingsJSON),
      'dateUpdated': serializer.toJson<DateTime>(dateUpdated),
    };
  }

  AppSetting copyWith(
          {int? settingsPk, String? settingsJSON, DateTime? dateUpdated}) =>
      AppSetting(
        settingsPk: settingsPk ?? this.settingsPk,
        settingsJSON: settingsJSON ?? this.settingsJSON,
        dateUpdated: dateUpdated ?? this.dateUpdated,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      settingsPk:
          data.settingsPk.present ? data.settingsPk.value : this.settingsPk,
      settingsJSON: data.settingsJSON.present
          ? data.settingsJSON.value
          : this.settingsJSON,
      dateUpdated:
          data.dateUpdated.present ? data.dateUpdated.value : this.dateUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('settingsPk: $settingsPk, ')
          ..write('settingsJSON: $settingsJSON, ')
          ..write('dateUpdated: $dateUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(settingsPk, settingsJSON, dateUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.settingsPk == this.settingsPk &&
          other.settingsJSON == this.settingsJSON &&
          other.dateUpdated == this.dateUpdated);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> settingsPk;
  final Value<String> settingsJSON;
  final Value<DateTime> dateUpdated;
  const AppSettingsCompanion({
    this.settingsPk = const Value.absent(),
    this.settingsJSON = const Value.absent(),
    this.dateUpdated = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.settingsPk = const Value.absent(),
    required String settingsJSON,
    this.dateUpdated = const Value.absent(),
  }) : settingsJSON = Value(settingsJSON);
  static Insertable<AppSetting> custom({
    Expression<int>? settingsPk,
    Expression<String>? settingsJSON,
    Expression<DateTime>? dateUpdated,
  }) {
    return RawValuesInsertable({
      if (settingsPk != null) 'settings_pk': settingsPk,
      if (settingsJSON != null) 'settings_j_s_o_n': settingsJSON,
      if (dateUpdated != null) 'date_updated': dateUpdated,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<int>? settingsPk,
      Value<String>? settingsJSON,
      Value<DateTime>? dateUpdated}) {
    return AppSettingsCompanion(
      settingsPk: settingsPk ?? this.settingsPk,
      settingsJSON: settingsJSON ?? this.settingsJSON,
      dateUpdated: dateUpdated ?? this.dateUpdated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (settingsPk.present) {
      map['settings_pk'] = Variable<int>(settingsPk.value);
    }
    if (settingsJSON.present) {
      map['settings_j_s_o_n'] = Variable<String>(settingsJSON.value);
    }
    if (dateUpdated.present) {
      map['date_updated'] = Variable<DateTime>(dateUpdated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('settingsPk: $settingsPk, ')
          ..write('settingsJSON: $settingsJSON, ')
          ..write('dateUpdated: $dateUpdated')
          ..write(')'))
        .toString();
  }
}

class $ScannerTemplatesTable extends ScannerTemplates
    with TableInfo<$ScannerTemplatesTable, ScannerTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScannerTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _scannerTemplatePkMeta =
      const VerificationMeta('scannerTemplatePk');
  @override
  late final GeneratedColumn<String> scannerTemplatePk =
      GeneratedColumn<String>('scanner_template_pk', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          clientDefault: () => uuid.v4());
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => new DateTime.now());
  static const VerificationMeta _dateTimeModifiedMeta =
      const VerificationMeta('dateTimeModified');
  @override
  late final GeneratedColumn<DateTime> dateTimeModified =
      GeneratedColumn<DateTime>('date_time_modified', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _templateNameMeta =
      const VerificationMeta('templateName');
  @override
  late final GeneratedColumn<String> templateName = GeneratedColumn<String>(
      'template_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _containsMeta =
      const VerificationMeta('contains');
  @override
  late final GeneratedColumn<String> contains = GeneratedColumn<String>(
      'contains', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _titleTransactionBeforeMeta =
      const VerificationMeta('titleTransactionBefore');
  @override
  late final GeneratedColumn<String> titleTransactionBefore =
      GeneratedColumn<String>('title_transaction_before', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _titleTransactionAfterMeta =
      const VerificationMeta('titleTransactionAfter');
  @override
  late final GeneratedColumn<String> titleTransactionAfter =
      GeneratedColumn<String>('title_transaction_after', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _amountTransactionBeforeMeta =
      const VerificationMeta('amountTransactionBefore');
  @override
  late final GeneratedColumn<String> amountTransactionBefore =
      GeneratedColumn<String>('amount_transaction_before', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _amountTransactionAfterMeta =
      const VerificationMeta('amountTransactionAfter');
  @override
  late final GeneratedColumn<String> amountTransactionAfter =
      GeneratedColumn<String>('amount_transaction_after', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _defaultCategoryFkMeta =
      const VerificationMeta('defaultCategoryFk');
  @override
  late final GeneratedColumn<String> defaultCategoryFk =
      GeneratedColumn<String>('default_category_fk', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES categories (category_pk)'));
  static const VerificationMeta _walletFkMeta =
      const VerificationMeta('walletFk');
  @override
  late final GeneratedColumn<String> walletFk = GeneratedColumn<String>(
      'wallet_fk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES wallets (wallet_pk)'),
      defaultValue: const Constant("0"));
  static const VerificationMeta _ignoreMeta = const VerificationMeta('ignore');
  @override
  late final GeneratedColumn<bool> ignore = GeneratedColumn<bool>(
      'ignore', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("ignore" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        scannerTemplatePk,
        dateCreated,
        dateTimeModified,
        templateName,
        contains,
        titleTransactionBefore,
        titleTransactionAfter,
        amountTransactionBefore,
        amountTransactionAfter,
        defaultCategoryFk,
        walletFk,
        ignore
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scanner_templates';
  @override
  VerificationContext validateIntegrity(Insertable<ScannerTemplate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('scanner_template_pk')) {
      context.handle(
          _scannerTemplatePkMeta,
          scannerTemplatePk.isAcceptableOrUnknown(
              data['scanner_template_pk']!, _scannerTemplatePkMeta));
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_time_modified')) {
      context.handle(
          _dateTimeModifiedMeta,
          dateTimeModified.isAcceptableOrUnknown(
              data['date_time_modified']!, _dateTimeModifiedMeta));
    }
    if (data.containsKey('template_name')) {
      context.handle(
          _templateNameMeta,
          templateName.isAcceptableOrUnknown(
              data['template_name']!, _templateNameMeta));
    } else if (isInserting) {
      context.missing(_templateNameMeta);
    }
    if (data.containsKey('contains')) {
      context.handle(_containsMeta,
          contains.isAcceptableOrUnknown(data['contains']!, _containsMeta));
    } else if (isInserting) {
      context.missing(_containsMeta);
    }
    if (data.containsKey('title_transaction_before')) {
      context.handle(
          _titleTransactionBeforeMeta,
          titleTransactionBefore.isAcceptableOrUnknown(
              data['title_transaction_before']!, _titleTransactionBeforeMeta));
    } else if (isInserting) {
      context.missing(_titleTransactionBeforeMeta);
    }
    if (data.containsKey('title_transaction_after')) {
      context.handle(
          _titleTransactionAfterMeta,
          titleTransactionAfter.isAcceptableOrUnknown(
              data['title_transaction_after']!, _titleTransactionAfterMeta));
    } else if (isInserting) {
      context.missing(_titleTransactionAfterMeta);
    }
    if (data.containsKey('amount_transaction_before')) {
      context.handle(
          _amountTransactionBeforeMeta,
          amountTransactionBefore.isAcceptableOrUnknown(
              data['amount_transaction_before']!,
              _amountTransactionBeforeMeta));
    } else if (isInserting) {
      context.missing(_amountTransactionBeforeMeta);
    }
    if (data.containsKey('amount_transaction_after')) {
      context.handle(
          _amountTransactionAfterMeta,
          amountTransactionAfter.isAcceptableOrUnknown(
              data['amount_transaction_after']!, _amountTransactionAfterMeta));
    } else if (isInserting) {
      context.missing(_amountTransactionAfterMeta);
    }
    if (data.containsKey('default_category_fk')) {
      context.handle(
          _defaultCategoryFkMeta,
          defaultCategoryFk.isAcceptableOrUnknown(
              data['default_category_fk']!, _defaultCategoryFkMeta));
    } else if (isInserting) {
      context.missing(_defaultCategoryFkMeta);
    }
    if (data.containsKey('wallet_fk')) {
      context.handle(_walletFkMeta,
          walletFk.isAcceptableOrUnknown(data['wallet_fk']!, _walletFkMeta));
    }
    if (data.containsKey('ignore')) {
      context.handle(_ignoreMeta,
          ignore.isAcceptableOrUnknown(data['ignore']!, _ignoreMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {scannerTemplatePk};
  @override
  ScannerTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScannerTemplate(
      scannerTemplatePk: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}scanner_template_pk'])!,
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateTimeModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_modified']),
      templateName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}template_name'])!,
      contains: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contains'])!,
      titleTransactionBefore: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}title_transaction_before'])!,
      titleTransactionAfter: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}title_transaction_after'])!,
      amountTransactionBefore: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}amount_transaction_before'])!,
      amountTransactionAfter: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}amount_transaction_after'])!,
      defaultCategoryFk: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}default_category_fk'])!,
      walletFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wallet_fk'])!,
      ignore: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}ignore'])!,
    );
  }

  @override
  $ScannerTemplatesTable createAlias(String alias) {
    return $ScannerTemplatesTable(attachedDatabase, alias);
  }
}

class ScannerTemplate extends DataClass implements Insertable<ScannerTemplate> {
  final String scannerTemplatePk;
  final DateTime dateCreated;
  final DateTime? dateTimeModified;
  final String templateName;
  final String contains;
  final String titleTransactionBefore;
  final String titleTransactionAfter;
  final String amountTransactionBefore;
  final String amountTransactionAfter;
  final String defaultCategoryFk;
  final String walletFk;
  final bool ignore;
  const ScannerTemplate(
      {required this.scannerTemplatePk,
      required this.dateCreated,
      this.dateTimeModified,
      required this.templateName,
      required this.contains,
      required this.titleTransactionBefore,
      required this.titleTransactionAfter,
      required this.amountTransactionBefore,
      required this.amountTransactionAfter,
      required this.defaultCategoryFk,
      required this.walletFk,
      required this.ignore});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['scanner_template_pk'] = Variable<String>(scannerTemplatePk);
    map['date_created'] = Variable<DateTime>(dateCreated);
    if (!nullToAbsent || dateTimeModified != null) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified);
    }
    map['template_name'] = Variable<String>(templateName);
    map['contains'] = Variable<String>(contains);
    map['title_transaction_before'] = Variable<String>(titleTransactionBefore);
    map['title_transaction_after'] = Variable<String>(titleTransactionAfter);
    map['amount_transaction_before'] =
        Variable<String>(amountTransactionBefore);
    map['amount_transaction_after'] = Variable<String>(amountTransactionAfter);
    map['default_category_fk'] = Variable<String>(defaultCategoryFk);
    map['wallet_fk'] = Variable<String>(walletFk);
    map['ignore'] = Variable<bool>(ignore);
    return map;
  }

  ScannerTemplatesCompanion toCompanion(bool nullToAbsent) {
    return ScannerTemplatesCompanion(
      scannerTemplatePk: Value(scannerTemplatePk),
      dateCreated: Value(dateCreated),
      dateTimeModified: dateTimeModified == null && nullToAbsent
          ? const Value.absent()
          : Value(dateTimeModified),
      templateName: Value(templateName),
      contains: Value(contains),
      titleTransactionBefore: Value(titleTransactionBefore),
      titleTransactionAfter: Value(titleTransactionAfter),
      amountTransactionBefore: Value(amountTransactionBefore),
      amountTransactionAfter: Value(amountTransactionAfter),
      defaultCategoryFk: Value(defaultCategoryFk),
      walletFk: Value(walletFk),
      ignore: Value(ignore),
    );
  }

  factory ScannerTemplate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScannerTemplate(
      scannerTemplatePk: serializer.fromJson<String>(json['scannerTemplatePk']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateTimeModified:
          serializer.fromJson<DateTime?>(json['dateTimeModified']),
      templateName: serializer.fromJson<String>(json['templateName']),
      contains: serializer.fromJson<String>(json['contains']),
      titleTransactionBefore:
          serializer.fromJson<String>(json['titleTransactionBefore']),
      titleTransactionAfter:
          serializer.fromJson<String>(json['titleTransactionAfter']),
      amountTransactionBefore:
          serializer.fromJson<String>(json['amountTransactionBefore']),
      amountTransactionAfter:
          serializer.fromJson<String>(json['amountTransactionAfter']),
      defaultCategoryFk: serializer.fromJson<String>(json['defaultCategoryFk']),
      walletFk: serializer.fromJson<String>(json['walletFk']),
      ignore: serializer.fromJson<bool>(json['ignore']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'scannerTemplatePk': serializer.toJson<String>(scannerTemplatePk),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateTimeModified': serializer.toJson<DateTime?>(dateTimeModified),
      'templateName': serializer.toJson<String>(templateName),
      'contains': serializer.toJson<String>(contains),
      'titleTransactionBefore':
          serializer.toJson<String>(titleTransactionBefore),
      'titleTransactionAfter': serializer.toJson<String>(titleTransactionAfter),
      'amountTransactionBefore':
          serializer.toJson<String>(amountTransactionBefore),
      'amountTransactionAfter':
          serializer.toJson<String>(amountTransactionAfter),
      'defaultCategoryFk': serializer.toJson<String>(defaultCategoryFk),
      'walletFk': serializer.toJson<String>(walletFk),
      'ignore': serializer.toJson<bool>(ignore),
    };
  }

  ScannerTemplate copyWith(
          {String? scannerTemplatePk,
          DateTime? dateCreated,
          Value<DateTime?> dateTimeModified = const Value.absent(),
          String? templateName,
          String? contains,
          String? titleTransactionBefore,
          String? titleTransactionAfter,
          String? amountTransactionBefore,
          String? amountTransactionAfter,
          String? defaultCategoryFk,
          String? walletFk,
          bool? ignore}) =>
      ScannerTemplate(
        scannerTemplatePk: scannerTemplatePk ?? this.scannerTemplatePk,
        dateCreated: dateCreated ?? this.dateCreated,
        dateTimeModified: dateTimeModified.present
            ? dateTimeModified.value
            : this.dateTimeModified,
        templateName: templateName ?? this.templateName,
        contains: contains ?? this.contains,
        titleTransactionBefore:
            titleTransactionBefore ?? this.titleTransactionBefore,
        titleTransactionAfter:
            titleTransactionAfter ?? this.titleTransactionAfter,
        amountTransactionBefore:
            amountTransactionBefore ?? this.amountTransactionBefore,
        amountTransactionAfter:
            amountTransactionAfter ?? this.amountTransactionAfter,
        defaultCategoryFk: defaultCategoryFk ?? this.defaultCategoryFk,
        walletFk: walletFk ?? this.walletFk,
        ignore: ignore ?? this.ignore,
      );
  ScannerTemplate copyWithCompanion(ScannerTemplatesCompanion data) {
    return ScannerTemplate(
      scannerTemplatePk: data.scannerTemplatePk.present
          ? data.scannerTemplatePk.value
          : this.scannerTemplatePk,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateTimeModified: data.dateTimeModified.present
          ? data.dateTimeModified.value
          : this.dateTimeModified,
      templateName: data.templateName.present
          ? data.templateName.value
          : this.templateName,
      contains: data.contains.present ? data.contains.value : this.contains,
      titleTransactionBefore: data.titleTransactionBefore.present
          ? data.titleTransactionBefore.value
          : this.titleTransactionBefore,
      titleTransactionAfter: data.titleTransactionAfter.present
          ? data.titleTransactionAfter.value
          : this.titleTransactionAfter,
      amountTransactionBefore: data.amountTransactionBefore.present
          ? data.amountTransactionBefore.value
          : this.amountTransactionBefore,
      amountTransactionAfter: data.amountTransactionAfter.present
          ? data.amountTransactionAfter.value
          : this.amountTransactionAfter,
      defaultCategoryFk: data.defaultCategoryFk.present
          ? data.defaultCategoryFk.value
          : this.defaultCategoryFk,
      walletFk: data.walletFk.present ? data.walletFk.value : this.walletFk,
      ignore: data.ignore.present ? data.ignore.value : this.ignore,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScannerTemplate(')
          ..write('scannerTemplatePk: $scannerTemplatePk, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('templateName: $templateName, ')
          ..write('contains: $contains, ')
          ..write('titleTransactionBefore: $titleTransactionBefore, ')
          ..write('titleTransactionAfter: $titleTransactionAfter, ')
          ..write('amountTransactionBefore: $amountTransactionBefore, ')
          ..write('amountTransactionAfter: $amountTransactionAfter, ')
          ..write('defaultCategoryFk: $defaultCategoryFk, ')
          ..write('walletFk: $walletFk, ')
          ..write('ignore: $ignore')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      scannerTemplatePk,
      dateCreated,
      dateTimeModified,
      templateName,
      contains,
      titleTransactionBefore,
      titleTransactionAfter,
      amountTransactionBefore,
      amountTransactionAfter,
      defaultCategoryFk,
      walletFk,
      ignore);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScannerTemplate &&
          other.scannerTemplatePk == this.scannerTemplatePk &&
          other.dateCreated == this.dateCreated &&
          other.dateTimeModified == this.dateTimeModified &&
          other.templateName == this.templateName &&
          other.contains == this.contains &&
          other.titleTransactionBefore == this.titleTransactionBefore &&
          other.titleTransactionAfter == this.titleTransactionAfter &&
          other.amountTransactionBefore == this.amountTransactionBefore &&
          other.amountTransactionAfter == this.amountTransactionAfter &&
          other.defaultCategoryFk == this.defaultCategoryFk &&
          other.walletFk == this.walletFk &&
          other.ignore == this.ignore);
}

class ScannerTemplatesCompanion extends UpdateCompanion<ScannerTemplate> {
  final Value<String> scannerTemplatePk;
  final Value<DateTime> dateCreated;
  final Value<DateTime?> dateTimeModified;
  final Value<String> templateName;
  final Value<String> contains;
  final Value<String> titleTransactionBefore;
  final Value<String> titleTransactionAfter;
  final Value<String> amountTransactionBefore;
  final Value<String> amountTransactionAfter;
  final Value<String> defaultCategoryFk;
  final Value<String> walletFk;
  final Value<bool> ignore;
  final Value<int> rowid;
  const ScannerTemplatesCompanion({
    this.scannerTemplatePk = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.templateName = const Value.absent(),
    this.contains = const Value.absent(),
    this.titleTransactionBefore = const Value.absent(),
    this.titleTransactionAfter = const Value.absent(),
    this.amountTransactionBefore = const Value.absent(),
    this.amountTransactionAfter = const Value.absent(),
    this.defaultCategoryFk = const Value.absent(),
    this.walletFk = const Value.absent(),
    this.ignore = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScannerTemplatesCompanion.insert({
    this.scannerTemplatePk = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    required String templateName,
    required String contains,
    required String titleTransactionBefore,
    required String titleTransactionAfter,
    required String amountTransactionBefore,
    required String amountTransactionAfter,
    required String defaultCategoryFk,
    this.walletFk = const Value.absent(),
    this.ignore = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : templateName = Value(templateName),
        contains = Value(contains),
        titleTransactionBefore = Value(titleTransactionBefore),
        titleTransactionAfter = Value(titleTransactionAfter),
        amountTransactionBefore = Value(amountTransactionBefore),
        amountTransactionAfter = Value(amountTransactionAfter),
        defaultCategoryFk = Value(defaultCategoryFk);
  static Insertable<ScannerTemplate> custom({
    Expression<String>? scannerTemplatePk,
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateTimeModified,
    Expression<String>? templateName,
    Expression<String>? contains,
    Expression<String>? titleTransactionBefore,
    Expression<String>? titleTransactionAfter,
    Expression<String>? amountTransactionBefore,
    Expression<String>? amountTransactionAfter,
    Expression<String>? defaultCategoryFk,
    Expression<String>? walletFk,
    Expression<bool>? ignore,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (scannerTemplatePk != null) 'scanner_template_pk': scannerTemplatePk,
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateTimeModified != null) 'date_time_modified': dateTimeModified,
      if (templateName != null) 'template_name': templateName,
      if (contains != null) 'contains': contains,
      if (titleTransactionBefore != null)
        'title_transaction_before': titleTransactionBefore,
      if (titleTransactionAfter != null)
        'title_transaction_after': titleTransactionAfter,
      if (amountTransactionBefore != null)
        'amount_transaction_before': amountTransactionBefore,
      if (amountTransactionAfter != null)
        'amount_transaction_after': amountTransactionAfter,
      if (defaultCategoryFk != null) 'default_category_fk': defaultCategoryFk,
      if (walletFk != null) 'wallet_fk': walletFk,
      if (ignore != null) 'ignore': ignore,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScannerTemplatesCompanion copyWith(
      {Value<String>? scannerTemplatePk,
      Value<DateTime>? dateCreated,
      Value<DateTime?>? dateTimeModified,
      Value<String>? templateName,
      Value<String>? contains,
      Value<String>? titleTransactionBefore,
      Value<String>? titleTransactionAfter,
      Value<String>? amountTransactionBefore,
      Value<String>? amountTransactionAfter,
      Value<String>? defaultCategoryFk,
      Value<String>? walletFk,
      Value<bool>? ignore,
      Value<int>? rowid}) {
    return ScannerTemplatesCompanion(
      scannerTemplatePk: scannerTemplatePk ?? this.scannerTemplatePk,
      dateCreated: dateCreated ?? this.dateCreated,
      dateTimeModified: dateTimeModified ?? this.dateTimeModified,
      templateName: templateName ?? this.templateName,
      contains: contains ?? this.contains,
      titleTransactionBefore:
          titleTransactionBefore ?? this.titleTransactionBefore,
      titleTransactionAfter:
          titleTransactionAfter ?? this.titleTransactionAfter,
      amountTransactionBefore:
          amountTransactionBefore ?? this.amountTransactionBefore,
      amountTransactionAfter:
          amountTransactionAfter ?? this.amountTransactionAfter,
      defaultCategoryFk: defaultCategoryFk ?? this.defaultCategoryFk,
      walletFk: walletFk ?? this.walletFk,
      ignore: ignore ?? this.ignore,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (scannerTemplatePk.present) {
      map['scanner_template_pk'] = Variable<String>(scannerTemplatePk.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateTimeModified.present) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified.value);
    }
    if (templateName.present) {
      map['template_name'] = Variable<String>(templateName.value);
    }
    if (contains.present) {
      map['contains'] = Variable<String>(contains.value);
    }
    if (titleTransactionBefore.present) {
      map['title_transaction_before'] =
          Variable<String>(titleTransactionBefore.value);
    }
    if (titleTransactionAfter.present) {
      map['title_transaction_after'] =
          Variable<String>(titleTransactionAfter.value);
    }
    if (amountTransactionBefore.present) {
      map['amount_transaction_before'] =
          Variable<String>(amountTransactionBefore.value);
    }
    if (amountTransactionAfter.present) {
      map['amount_transaction_after'] =
          Variable<String>(amountTransactionAfter.value);
    }
    if (defaultCategoryFk.present) {
      map['default_category_fk'] = Variable<String>(defaultCategoryFk.value);
    }
    if (walletFk.present) {
      map['wallet_fk'] = Variable<String>(walletFk.value);
    }
    if (ignore.present) {
      map['ignore'] = Variable<bool>(ignore.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScannerTemplatesCompanion(')
          ..write('scannerTemplatePk: $scannerTemplatePk, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('templateName: $templateName, ')
          ..write('contains: $contains, ')
          ..write('titleTransactionBefore: $titleTransactionBefore, ')
          ..write('titleTransactionAfter: $titleTransactionAfter, ')
          ..write('amountTransactionBefore: $amountTransactionBefore, ')
          ..write('amountTransactionAfter: $amountTransactionAfter, ')
          ..write('defaultCategoryFk: $defaultCategoryFk, ')
          ..write('walletFk: $walletFk, ')
          ..write('ignore: $ignore, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DeleteLogsTable extends DeleteLogs
    with TableInfo<$DeleteLogsTable, DeleteLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeleteLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _deleteLogPkMeta =
      const VerificationMeta('deleteLogPk');
  @override
  late final GeneratedColumn<String> deleteLogPk = GeneratedColumn<String>(
      'delete_log_pk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _entryPkMeta =
      const VerificationMeta('entryPk');
  @override
  late final GeneratedColumn<String> entryPk = GeneratedColumn<String>(
      'entry_pk', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<DeleteLogType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<DeleteLogType>($DeleteLogsTable.$convertertype);
  static const VerificationMeta _dateTimeModifiedMeta =
      const VerificationMeta('dateTimeModified');
  @override
  late final GeneratedColumn<DateTime> dateTimeModified =
      GeneratedColumn<DateTime>('date_time_modified', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns =>
      [deleteLogPk, entryPk, type, dateTimeModified];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'delete_logs';
  @override
  VerificationContext validateIntegrity(Insertable<DeleteLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('delete_log_pk')) {
      context.handle(
          _deleteLogPkMeta,
          deleteLogPk.isAcceptableOrUnknown(
              data['delete_log_pk']!, _deleteLogPkMeta));
    }
    if (data.containsKey('entry_pk')) {
      context.handle(_entryPkMeta,
          entryPk.isAcceptableOrUnknown(data['entry_pk']!, _entryPkMeta));
    } else if (isInserting) {
      context.missing(_entryPkMeta);
    }
    if (data.containsKey('date_time_modified')) {
      context.handle(
          _dateTimeModifiedMeta,
          dateTimeModified.isAcceptableOrUnknown(
              data['date_time_modified']!, _dateTimeModifiedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {deleteLogPk};
  @override
  DeleteLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeleteLog(
      deleteLogPk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}delete_log_pk'])!,
      entryPk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entry_pk'])!,
      type: $DeleteLogsTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      dateTimeModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_modified'])!,
    );
  }

  @override
  $DeleteLogsTable createAlias(String alias) {
    return $DeleteLogsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DeleteLogType, int, int> $convertertype =
      const EnumIndexConverter<DeleteLogType>(DeleteLogType.values);
}

class DeleteLog extends DataClass implements Insertable<DeleteLog> {
  final String deleteLogPk;
  final String entryPk;
  final DeleteLogType type;
  final DateTime dateTimeModified;
  const DeleteLog(
      {required this.deleteLogPk,
      required this.entryPk,
      required this.type,
      required this.dateTimeModified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['delete_log_pk'] = Variable<String>(deleteLogPk);
    map['entry_pk'] = Variable<String>(entryPk);
    {
      map['type'] = Variable<int>($DeleteLogsTable.$convertertype.toSql(type));
    }
    map['date_time_modified'] = Variable<DateTime>(dateTimeModified);
    return map;
  }

  DeleteLogsCompanion toCompanion(bool nullToAbsent) {
    return DeleteLogsCompanion(
      deleteLogPk: Value(deleteLogPk),
      entryPk: Value(entryPk),
      type: Value(type),
      dateTimeModified: Value(dateTimeModified),
    );
  }

  factory DeleteLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeleteLog(
      deleteLogPk: serializer.fromJson<String>(json['deleteLogPk']),
      entryPk: serializer.fromJson<String>(json['entryPk']),
      type: $DeleteLogsTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      dateTimeModified: serializer.fromJson<DateTime>(json['dateTimeModified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'deleteLogPk': serializer.toJson<String>(deleteLogPk),
      'entryPk': serializer.toJson<String>(entryPk),
      'type':
          serializer.toJson<int>($DeleteLogsTable.$convertertype.toJson(type)),
      'dateTimeModified': serializer.toJson<DateTime>(dateTimeModified),
    };
  }

  DeleteLog copyWith(
          {String? deleteLogPk,
          String? entryPk,
          DeleteLogType? type,
          DateTime? dateTimeModified}) =>
      DeleteLog(
        deleteLogPk: deleteLogPk ?? this.deleteLogPk,
        entryPk: entryPk ?? this.entryPk,
        type: type ?? this.type,
        dateTimeModified: dateTimeModified ?? this.dateTimeModified,
      );
  DeleteLog copyWithCompanion(DeleteLogsCompanion data) {
    return DeleteLog(
      deleteLogPk:
          data.deleteLogPk.present ? data.deleteLogPk.value : this.deleteLogPk,
      entryPk: data.entryPk.present ? data.entryPk.value : this.entryPk,
      type: data.type.present ? data.type.value : this.type,
      dateTimeModified: data.dateTimeModified.present
          ? data.dateTimeModified.value
          : this.dateTimeModified,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeleteLog(')
          ..write('deleteLogPk: $deleteLogPk, ')
          ..write('entryPk: $entryPk, ')
          ..write('type: $type, ')
          ..write('dateTimeModified: $dateTimeModified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(deleteLogPk, entryPk, type, dateTimeModified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeleteLog &&
          other.deleteLogPk == this.deleteLogPk &&
          other.entryPk == this.entryPk &&
          other.type == this.type &&
          other.dateTimeModified == this.dateTimeModified);
}

class DeleteLogsCompanion extends UpdateCompanion<DeleteLog> {
  final Value<String> deleteLogPk;
  final Value<String> entryPk;
  final Value<DeleteLogType> type;
  final Value<DateTime> dateTimeModified;
  final Value<int> rowid;
  const DeleteLogsCompanion({
    this.deleteLogPk = const Value.absent(),
    this.entryPk = const Value.absent(),
    this.type = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DeleteLogsCompanion.insert({
    this.deleteLogPk = const Value.absent(),
    required String entryPk,
    required DeleteLogType type,
    this.dateTimeModified = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : entryPk = Value(entryPk),
        type = Value(type);
  static Insertable<DeleteLog> custom({
    Expression<String>? deleteLogPk,
    Expression<String>? entryPk,
    Expression<int>? type,
    Expression<DateTime>? dateTimeModified,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (deleteLogPk != null) 'delete_log_pk': deleteLogPk,
      if (entryPk != null) 'entry_pk': entryPk,
      if (type != null) 'type': type,
      if (dateTimeModified != null) 'date_time_modified': dateTimeModified,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DeleteLogsCompanion copyWith(
      {Value<String>? deleteLogPk,
      Value<String>? entryPk,
      Value<DeleteLogType>? type,
      Value<DateTime>? dateTimeModified,
      Value<int>? rowid}) {
    return DeleteLogsCompanion(
      deleteLogPk: deleteLogPk ?? this.deleteLogPk,
      entryPk: entryPk ?? this.entryPk,
      type: type ?? this.type,
      dateTimeModified: dateTimeModified ?? this.dateTimeModified,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (deleteLogPk.present) {
      map['delete_log_pk'] = Variable<String>(deleteLogPk.value);
    }
    if (entryPk.present) {
      map['entry_pk'] = Variable<String>(entryPk.value);
    }
    if (type.present) {
      map['type'] =
          Variable<int>($DeleteLogsTable.$convertertype.toSql(type.value));
    }
    if (dateTimeModified.present) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeleteLogsCompanion(')
          ..write('deleteLogPk: $deleteLogPk, ')
          ..write('entryPk: $entryPk, ')
          ..write('type: $type, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GroupsTable extends Groups with TableInfo<$GroupsTable, GroupEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _groupPkMeta =
      const VerificationMeta('groupPk');
  @override
  late final GeneratedColumn<String> groupPk = GeneratedColumn<String>(
      'group_pk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _dateTimeModifiedMeta =
      const VerificationMeta('dateTimeModified');
  @override
  late final GeneratedColumn<DateTime> dateTimeModified =
      GeneratedColumn<DateTime>('date_time_modified', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _archivedMeta =
      const VerificationMeta('archived');
  @override
  late final GeneratedColumn<bool> archived = GeneratedColumn<bool>(
      'archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        groupPk,
        name,
        description,
        imageUrl,
        createdBy,
        dateCreated,
        dateTimeModified,
        archived
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'groups';
  @override
  VerificationContext validateIntegrity(Insertable<GroupEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('group_pk')) {
      context.handle(_groupPkMeta,
          groupPk.isAcceptableOrUnknown(data['group_pk']!, _groupPkMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    } else if (isInserting) {
      context.missing(_createdByMeta);
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_time_modified')) {
      context.handle(
          _dateTimeModifiedMeta,
          dateTimeModified.isAcceptableOrUnknown(
              data['date_time_modified']!, _dateTimeModifiedMeta));
    }
    if (data.containsKey('archived')) {
      context.handle(_archivedMeta,
          archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {groupPk};
  @override
  GroupEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupEntry(
      groupPk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_pk'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by'])!,
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateTimeModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_modified']),
      archived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}archived'])!,
    );
  }

  @override
  $GroupsTable createAlias(String alias) {
    return $GroupsTable(attachedDatabase, alias);
  }
}

class GroupEntry extends DataClass implements Insertable<GroupEntry> {
  final String groupPk;
  final String name;
  final String? description;
  final String? imageUrl;
  final String createdBy;
  final DateTime dateCreated;
  final DateTime? dateTimeModified;
  final bool archived;
  const GroupEntry(
      {required this.groupPk,
      required this.name,
      this.description,
      this.imageUrl,
      required this.createdBy,
      required this.dateCreated,
      this.dateTimeModified,
      required this.archived});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['group_pk'] = Variable<String>(groupPk);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['created_by'] = Variable<String>(createdBy);
    map['date_created'] = Variable<DateTime>(dateCreated);
    if (!nullToAbsent || dateTimeModified != null) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified);
    }
    map['archived'] = Variable<bool>(archived);
    return map;
  }

  GroupsCompanion toCompanion(bool nullToAbsent) {
    return GroupsCompanion(
      groupPk: Value(groupPk),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      createdBy: Value(createdBy),
      dateCreated: Value(dateCreated),
      dateTimeModified: dateTimeModified == null && nullToAbsent
          ? const Value.absent()
          : Value(dateTimeModified),
      archived: Value(archived),
    );
  }

  factory GroupEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupEntry(
      groupPk: serializer.fromJson<String>(json['groupPk']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateTimeModified:
          serializer.fromJson<DateTime?>(json['dateTimeModified']),
      archived: serializer.fromJson<bool>(json['archived']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'groupPk': serializer.toJson<String>(groupPk),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'createdBy': serializer.toJson<String>(createdBy),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateTimeModified': serializer.toJson<DateTime?>(dateTimeModified),
      'archived': serializer.toJson<bool>(archived),
    };
  }

  GroupEntry copyWith(
          {String? groupPk,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> imageUrl = const Value.absent(),
          String? createdBy,
          DateTime? dateCreated,
          Value<DateTime?> dateTimeModified = const Value.absent(),
          bool? archived}) =>
      GroupEntry(
        groupPk: groupPk ?? this.groupPk,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        createdBy: createdBy ?? this.createdBy,
        dateCreated: dateCreated ?? this.dateCreated,
        dateTimeModified: dateTimeModified.present
            ? dateTimeModified.value
            : this.dateTimeModified,
        archived: archived ?? this.archived,
      );
  GroupEntry copyWithCompanion(GroupsCompanion data) {
    return GroupEntry(
      groupPk: data.groupPk.present ? data.groupPk.value : this.groupPk,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateTimeModified: data.dateTimeModified.present
          ? data.dateTimeModified.value
          : this.dateTimeModified,
      archived: data.archived.present ? data.archived.value : this.archived,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupEntry(')
          ..write('groupPk: $groupPk, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('createdBy: $createdBy, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('archived: $archived')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(groupPk, name, description, imageUrl,
      createdBy, dateCreated, dateTimeModified, archived);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupEntry &&
          other.groupPk == this.groupPk &&
          other.name == this.name &&
          other.description == this.description &&
          other.imageUrl == this.imageUrl &&
          other.createdBy == this.createdBy &&
          other.dateCreated == this.dateCreated &&
          other.dateTimeModified == this.dateTimeModified &&
          other.archived == this.archived);
}

class GroupsCompanion extends UpdateCompanion<GroupEntry> {
  final Value<String> groupPk;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> imageUrl;
  final Value<String> createdBy;
  final Value<DateTime> dateCreated;
  final Value<DateTime?> dateTimeModified;
  final Value<bool> archived;
  final Value<int> rowid;
  const GroupsCompanion({
    this.groupPk = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.archived = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupsCompanion.insert({
    this.groupPk = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
    required String createdBy,
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.archived = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        createdBy = Value(createdBy);
  static Insertable<GroupEntry> custom({
    Expression<String>? groupPk,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? imageUrl,
    Expression<String>? createdBy,
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateTimeModified,
    Expression<bool>? archived,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (groupPk != null) 'group_pk': groupPk,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (imageUrl != null) 'image_url': imageUrl,
      if (createdBy != null) 'created_by': createdBy,
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateTimeModified != null) 'date_time_modified': dateTimeModified,
      if (archived != null) 'archived': archived,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupsCompanion copyWith(
      {Value<String>? groupPk,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? imageUrl,
      Value<String>? createdBy,
      Value<DateTime>? dateCreated,
      Value<DateTime?>? dateTimeModified,
      Value<bool>? archived,
      Value<int>? rowid}) {
    return GroupsCompanion(
      groupPk: groupPk ?? this.groupPk,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      createdBy: createdBy ?? this.createdBy,
      dateCreated: dateCreated ?? this.dateCreated,
      dateTimeModified: dateTimeModified ?? this.dateTimeModified,
      archived: archived ?? this.archived,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (groupPk.present) {
      map['group_pk'] = Variable<String>(groupPk.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateTimeModified.present) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupsCompanion(')
          ..write('groupPk: $groupPk, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('createdBy: $createdBy, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('archived: $archived, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GroupMembersTable extends GroupMembers
    with TableInfo<$GroupMembersTable, GroupMemberEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupMembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _memberPkMeta =
      const VerificationMeta('memberPk');
  @override
  late final GeneratedColumn<String> memberPk = GeneratedColumn<String>(
      'member_pk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _groupFkMeta =
      const VerificationMeta('groupFk');
  @override
  late final GeneratedColumn<String> groupFk = GeneratedColumn<String>(
      'group_fk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES "groups" (group_pk)'));
  static const VerificationMeta _userEmailMeta =
      const VerificationMeta('userEmail');
  @override
  late final GeneratedColumn<String> userEmail = GeneratedColumn<String>(
      'user_email', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _userPhotoUrlMeta =
      const VerificationMeta('userPhotoUrl');
  @override
  late final GeneratedColumn<String> userPhotoUrl = GeneratedColumn<String>(
      'user_photo_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateJoinedMeta =
      const VerificationMeta('dateJoined');
  @override
  late final GeneratedColumn<DateTime> dateJoined = GeneratedColumn<DateTime>(
      'date_joined', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [
        memberPk,
        groupFk,
        userEmail,
        userName,
        userPhotoUrl,
        dateJoined,
        isActive
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'group_members';
  @override
  VerificationContext validateIntegrity(Insertable<GroupMemberEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('member_pk')) {
      context.handle(_memberPkMeta,
          memberPk.isAcceptableOrUnknown(data['member_pk']!, _memberPkMeta));
    }
    if (data.containsKey('group_fk')) {
      context.handle(_groupFkMeta,
          groupFk.isAcceptableOrUnknown(data['group_fk']!, _groupFkMeta));
    } else if (isInserting) {
      context.missing(_groupFkMeta);
    }
    if (data.containsKey('user_email')) {
      context.handle(_userEmailMeta,
          userEmail.isAcceptableOrUnknown(data['user_email']!, _userEmailMeta));
    } else if (isInserting) {
      context.missing(_userEmailMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('user_photo_url')) {
      context.handle(
          _userPhotoUrlMeta,
          userPhotoUrl.isAcceptableOrUnknown(
              data['user_photo_url']!, _userPhotoUrlMeta));
    }
    if (data.containsKey('date_joined')) {
      context.handle(
          _dateJoinedMeta,
          dateJoined.isAcceptableOrUnknown(
              data['date_joined']!, _dateJoinedMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {memberPk};
  @override
  GroupMemberEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupMemberEntry(
      memberPk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}member_pk'])!,
      groupFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_fk'])!,
      userEmail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_email'])!,
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      userPhotoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_photo_url']),
      dateJoined: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_joined'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $GroupMembersTable createAlias(String alias) {
    return $GroupMembersTable(attachedDatabase, alias);
  }
}

class GroupMemberEntry extends DataClass
    implements Insertable<GroupMemberEntry> {
  final String memberPk;
  final String groupFk;
  final String userEmail;
  final String userName;
  final String? userPhotoUrl;
  final DateTime dateJoined;
  final bool isActive;
  const GroupMemberEntry(
      {required this.memberPk,
      required this.groupFk,
      required this.userEmail,
      required this.userName,
      this.userPhotoUrl,
      required this.dateJoined,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['member_pk'] = Variable<String>(memberPk);
    map['group_fk'] = Variable<String>(groupFk);
    map['user_email'] = Variable<String>(userEmail);
    map['user_name'] = Variable<String>(userName);
    if (!nullToAbsent || userPhotoUrl != null) {
      map['user_photo_url'] = Variable<String>(userPhotoUrl);
    }
    map['date_joined'] = Variable<DateTime>(dateJoined);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  GroupMembersCompanion toCompanion(bool nullToAbsent) {
    return GroupMembersCompanion(
      memberPk: Value(memberPk),
      groupFk: Value(groupFk),
      userEmail: Value(userEmail),
      userName: Value(userName),
      userPhotoUrl: userPhotoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(userPhotoUrl),
      dateJoined: Value(dateJoined),
      isActive: Value(isActive),
    );
  }

  factory GroupMemberEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupMemberEntry(
      memberPk: serializer.fromJson<String>(json['memberPk']),
      groupFk: serializer.fromJson<String>(json['groupFk']),
      userEmail: serializer.fromJson<String>(json['userEmail']),
      userName: serializer.fromJson<String>(json['userName']),
      userPhotoUrl: serializer.fromJson<String?>(json['userPhotoUrl']),
      dateJoined: serializer.fromJson<DateTime>(json['dateJoined']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'memberPk': serializer.toJson<String>(memberPk),
      'groupFk': serializer.toJson<String>(groupFk),
      'userEmail': serializer.toJson<String>(userEmail),
      'userName': serializer.toJson<String>(userName),
      'userPhotoUrl': serializer.toJson<String?>(userPhotoUrl),
      'dateJoined': serializer.toJson<DateTime>(dateJoined),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  GroupMemberEntry copyWith(
          {String? memberPk,
          String? groupFk,
          String? userEmail,
          String? userName,
          Value<String?> userPhotoUrl = const Value.absent(),
          DateTime? dateJoined,
          bool? isActive}) =>
      GroupMemberEntry(
        memberPk: memberPk ?? this.memberPk,
        groupFk: groupFk ?? this.groupFk,
        userEmail: userEmail ?? this.userEmail,
        userName: userName ?? this.userName,
        userPhotoUrl:
            userPhotoUrl.present ? userPhotoUrl.value : this.userPhotoUrl,
        dateJoined: dateJoined ?? this.dateJoined,
        isActive: isActive ?? this.isActive,
      );
  GroupMemberEntry copyWithCompanion(GroupMembersCompanion data) {
    return GroupMemberEntry(
      memberPk: data.memberPk.present ? data.memberPk.value : this.memberPk,
      groupFk: data.groupFk.present ? data.groupFk.value : this.groupFk,
      userEmail: data.userEmail.present ? data.userEmail.value : this.userEmail,
      userName: data.userName.present ? data.userName.value : this.userName,
      userPhotoUrl: data.userPhotoUrl.present
          ? data.userPhotoUrl.value
          : this.userPhotoUrl,
      dateJoined:
          data.dateJoined.present ? data.dateJoined.value : this.dateJoined,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupMemberEntry(')
          ..write('memberPk: $memberPk, ')
          ..write('groupFk: $groupFk, ')
          ..write('userEmail: $userEmail, ')
          ..write('userName: $userName, ')
          ..write('userPhotoUrl: $userPhotoUrl, ')
          ..write('dateJoined: $dateJoined, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(memberPk, groupFk, userEmail, userName,
      userPhotoUrl, dateJoined, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupMemberEntry &&
          other.memberPk == this.memberPk &&
          other.groupFk == this.groupFk &&
          other.userEmail == this.userEmail &&
          other.userName == this.userName &&
          other.userPhotoUrl == this.userPhotoUrl &&
          other.dateJoined == this.dateJoined &&
          other.isActive == this.isActive);
}

class GroupMembersCompanion extends UpdateCompanion<GroupMemberEntry> {
  final Value<String> memberPk;
  final Value<String> groupFk;
  final Value<String> userEmail;
  final Value<String> userName;
  final Value<String?> userPhotoUrl;
  final Value<DateTime> dateJoined;
  final Value<bool> isActive;
  final Value<int> rowid;
  const GroupMembersCompanion({
    this.memberPk = const Value.absent(),
    this.groupFk = const Value.absent(),
    this.userEmail = const Value.absent(),
    this.userName = const Value.absent(),
    this.userPhotoUrl = const Value.absent(),
    this.dateJoined = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupMembersCompanion.insert({
    this.memberPk = const Value.absent(),
    required String groupFk,
    required String userEmail,
    required String userName,
    this.userPhotoUrl = const Value.absent(),
    this.dateJoined = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : groupFk = Value(groupFk),
        userEmail = Value(userEmail),
        userName = Value(userName);
  static Insertable<GroupMemberEntry> custom({
    Expression<String>? memberPk,
    Expression<String>? groupFk,
    Expression<String>? userEmail,
    Expression<String>? userName,
    Expression<String>? userPhotoUrl,
    Expression<DateTime>? dateJoined,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (memberPk != null) 'member_pk': memberPk,
      if (groupFk != null) 'group_fk': groupFk,
      if (userEmail != null) 'user_email': userEmail,
      if (userName != null) 'user_name': userName,
      if (userPhotoUrl != null) 'user_photo_url': userPhotoUrl,
      if (dateJoined != null) 'date_joined': dateJoined,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupMembersCompanion copyWith(
      {Value<String>? memberPk,
      Value<String>? groupFk,
      Value<String>? userEmail,
      Value<String>? userName,
      Value<String?>? userPhotoUrl,
      Value<DateTime>? dateJoined,
      Value<bool>? isActive,
      Value<int>? rowid}) {
    return GroupMembersCompanion(
      memberPk: memberPk ?? this.memberPk,
      groupFk: groupFk ?? this.groupFk,
      userEmail: userEmail ?? this.userEmail,
      userName: userName ?? this.userName,
      userPhotoUrl: userPhotoUrl ?? this.userPhotoUrl,
      dateJoined: dateJoined ?? this.dateJoined,
      isActive: isActive ?? this.isActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (memberPk.present) {
      map['member_pk'] = Variable<String>(memberPk.value);
    }
    if (groupFk.present) {
      map['group_fk'] = Variable<String>(groupFk.value);
    }
    if (userEmail.present) {
      map['user_email'] = Variable<String>(userEmail.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (userPhotoUrl.present) {
      map['user_photo_url'] = Variable<String>(userPhotoUrl.value);
    }
    if (dateJoined.present) {
      map['date_joined'] = Variable<DateTime>(dateJoined.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupMembersCompanion(')
          ..write('memberPk: $memberPk, ')
          ..write('groupFk: $groupFk, ')
          ..write('userEmail: $userEmail, ')
          ..write('userName: $userName, ')
          ..write('userPhotoUrl: $userPhotoUrl, ')
          ..write('dateJoined: $dateJoined, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SharedExpensesTable extends SharedExpenses
    with TableInfo<$SharedExpensesTable, SharedExpenseEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SharedExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _expensePkMeta =
      const VerificationMeta('expensePk');
  @override
  late final GeneratedColumn<String> expensePk = GeneratedColumn<String>(
      'expense_pk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _groupFkMeta =
      const VerificationMeta('groupFk');
  @override
  late final GeneratedColumn<String> groupFk = GeneratedColumn<String>(
      'group_fk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES "groups" (group_pk)'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryFkMeta =
      const VerificationMeta('categoryFk');
  @override
  late final GeneratedColumn<String> categoryFk = GeneratedColumn<String>(
      'category_fk', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories (category_pk)'));
  static const VerificationMeta _paidByMeta = const VerificationMeta('paidBy');
  @override
  late final GeneratedColumn<String> paidBy = GeneratedColumn<String>(
      'paid_by', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _dateTimeModifiedMeta =
      const VerificationMeta('dateTimeModified');
  @override
  late final GeneratedColumn<DateTime> dateTimeModified =
      GeneratedColumn<DateTime>('date_time_modified', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isSettledMeta =
      const VerificationMeta('isSettled');
  @override
  late final GeneratedColumn<bool> isSettled = GeneratedColumn<bool>(
      'is_settled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_settled" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        expensePk,
        groupFk,
        title,
        description,
        amount,
        currency,
        categoryFk,
        paidBy,
        dateCreated,
        dateTimeModified,
        imageUrl,
        isSettled
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shared_expenses';
  @override
  VerificationContext validateIntegrity(Insertable<SharedExpenseEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('expense_pk')) {
      context.handle(_expensePkMeta,
          expensePk.isAcceptableOrUnknown(data['expense_pk']!, _expensePkMeta));
    }
    if (data.containsKey('group_fk')) {
      context.handle(_groupFkMeta,
          groupFk.isAcceptableOrUnknown(data['group_fk']!, _groupFkMeta));
    } else if (isInserting) {
      context.missing(_groupFkMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('category_fk')) {
      context.handle(
          _categoryFkMeta,
          categoryFk.isAcceptableOrUnknown(
              data['category_fk']!, _categoryFkMeta));
    }
    if (data.containsKey('paid_by')) {
      context.handle(_paidByMeta,
          paidBy.isAcceptableOrUnknown(data['paid_by']!, _paidByMeta));
    } else if (isInserting) {
      context.missing(_paidByMeta);
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('date_time_modified')) {
      context.handle(
          _dateTimeModifiedMeta,
          dateTimeModified.isAcceptableOrUnknown(
              data['date_time_modified']!, _dateTimeModifiedMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('is_settled')) {
      context.handle(_isSettledMeta,
          isSettled.isAcceptableOrUnknown(data['is_settled']!, _isSettledMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {expensePk};
  @override
  SharedExpenseEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SharedExpenseEntry(
      expensePk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}expense_pk'])!,
      groupFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_fk'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      categoryFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_fk']),
      paidBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}paid_by'])!,
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      dateTimeModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_modified']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      isSettled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_settled'])!,
    );
  }

  @override
  $SharedExpensesTable createAlias(String alias) {
    return $SharedExpensesTable(attachedDatabase, alias);
  }
}

class SharedExpenseEntry extends DataClass
    implements Insertable<SharedExpenseEntry> {
  final String expensePk;
  final String groupFk;
  final String title;
  final String? description;
  final double amount;
  final String currency;
  final String? categoryFk;
  final String paidBy;
  final DateTime dateCreated;
  final DateTime? dateTimeModified;
  final String? imageUrl;
  final bool isSettled;
  const SharedExpenseEntry(
      {required this.expensePk,
      required this.groupFk,
      required this.title,
      this.description,
      required this.amount,
      required this.currency,
      this.categoryFk,
      required this.paidBy,
      required this.dateCreated,
      this.dateTimeModified,
      this.imageUrl,
      required this.isSettled});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['expense_pk'] = Variable<String>(expensePk);
    map['group_fk'] = Variable<String>(groupFk);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['amount'] = Variable<double>(amount);
    map['currency'] = Variable<String>(currency);
    if (!nullToAbsent || categoryFk != null) {
      map['category_fk'] = Variable<String>(categoryFk);
    }
    map['paid_by'] = Variable<String>(paidBy);
    map['date_created'] = Variable<DateTime>(dateCreated);
    if (!nullToAbsent || dateTimeModified != null) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['is_settled'] = Variable<bool>(isSettled);
    return map;
  }

  SharedExpensesCompanion toCompanion(bool nullToAbsent) {
    return SharedExpensesCompanion(
      expensePk: Value(expensePk),
      groupFk: Value(groupFk),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      amount: Value(amount),
      currency: Value(currency),
      categoryFk: categoryFk == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryFk),
      paidBy: Value(paidBy),
      dateCreated: Value(dateCreated),
      dateTimeModified: dateTimeModified == null && nullToAbsent
          ? const Value.absent()
          : Value(dateTimeModified),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      isSettled: Value(isSettled),
    );
  }

  factory SharedExpenseEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SharedExpenseEntry(
      expensePk: serializer.fromJson<String>(json['expensePk']),
      groupFk: serializer.fromJson<String>(json['groupFk']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      amount: serializer.fromJson<double>(json['amount']),
      currency: serializer.fromJson<String>(json['currency']),
      categoryFk: serializer.fromJson<String?>(json['categoryFk']),
      paidBy: serializer.fromJson<String>(json['paidBy']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateTimeModified:
          serializer.fromJson<DateTime?>(json['dateTimeModified']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      isSettled: serializer.fromJson<bool>(json['isSettled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'expensePk': serializer.toJson<String>(expensePk),
      'groupFk': serializer.toJson<String>(groupFk),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'amount': serializer.toJson<double>(amount),
      'currency': serializer.toJson<String>(currency),
      'categoryFk': serializer.toJson<String?>(categoryFk),
      'paidBy': serializer.toJson<String>(paidBy),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateTimeModified': serializer.toJson<DateTime?>(dateTimeModified),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'isSettled': serializer.toJson<bool>(isSettled),
    };
  }

  SharedExpenseEntry copyWith(
          {String? expensePk,
          String? groupFk,
          String? title,
          Value<String?> description = const Value.absent(),
          double? amount,
          String? currency,
          Value<String?> categoryFk = const Value.absent(),
          String? paidBy,
          DateTime? dateCreated,
          Value<DateTime?> dateTimeModified = const Value.absent(),
          Value<String?> imageUrl = const Value.absent(),
          bool? isSettled}) =>
      SharedExpenseEntry(
        expensePk: expensePk ?? this.expensePk,
        groupFk: groupFk ?? this.groupFk,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        categoryFk: categoryFk.present ? categoryFk.value : this.categoryFk,
        paidBy: paidBy ?? this.paidBy,
        dateCreated: dateCreated ?? this.dateCreated,
        dateTimeModified: dateTimeModified.present
            ? dateTimeModified.value
            : this.dateTimeModified,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        isSettled: isSettled ?? this.isSettled,
      );
  SharedExpenseEntry copyWithCompanion(SharedExpensesCompanion data) {
    return SharedExpenseEntry(
      expensePk: data.expensePk.present ? data.expensePk.value : this.expensePk,
      groupFk: data.groupFk.present ? data.groupFk.value : this.groupFk,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      amount: data.amount.present ? data.amount.value : this.amount,
      currency: data.currency.present ? data.currency.value : this.currency,
      categoryFk:
          data.categoryFk.present ? data.categoryFk.value : this.categoryFk,
      paidBy: data.paidBy.present ? data.paidBy.value : this.paidBy,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      dateTimeModified: data.dateTimeModified.present
          ? data.dateTimeModified.value
          : this.dateTimeModified,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      isSettled: data.isSettled.present ? data.isSettled.value : this.isSettled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SharedExpenseEntry(')
          ..write('expensePk: $expensePk, ')
          ..write('groupFk: $groupFk, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('categoryFk: $categoryFk, ')
          ..write('paidBy: $paidBy, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isSettled: $isSettled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      expensePk,
      groupFk,
      title,
      description,
      amount,
      currency,
      categoryFk,
      paidBy,
      dateCreated,
      dateTimeModified,
      imageUrl,
      isSettled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SharedExpenseEntry &&
          other.expensePk == this.expensePk &&
          other.groupFk == this.groupFk &&
          other.title == this.title &&
          other.description == this.description &&
          other.amount == this.amount &&
          other.currency == this.currency &&
          other.categoryFk == this.categoryFk &&
          other.paidBy == this.paidBy &&
          other.dateCreated == this.dateCreated &&
          other.dateTimeModified == this.dateTimeModified &&
          other.imageUrl == this.imageUrl &&
          other.isSettled == this.isSettled);
}

class SharedExpensesCompanion extends UpdateCompanion<SharedExpenseEntry> {
  final Value<String> expensePk;
  final Value<String> groupFk;
  final Value<String> title;
  final Value<String?> description;
  final Value<double> amount;
  final Value<String> currency;
  final Value<String?> categoryFk;
  final Value<String> paidBy;
  final Value<DateTime> dateCreated;
  final Value<DateTime?> dateTimeModified;
  final Value<String?> imageUrl;
  final Value<bool> isSettled;
  final Value<int> rowid;
  const SharedExpensesCompanion({
    this.expensePk = const Value.absent(),
    this.groupFk = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.amount = const Value.absent(),
    this.currency = const Value.absent(),
    this.categoryFk = const Value.absent(),
    this.paidBy = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isSettled = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SharedExpensesCompanion.insert({
    this.expensePk = const Value.absent(),
    required String groupFk,
    required String title,
    this.description = const Value.absent(),
    required double amount,
    required String currency,
    this.categoryFk = const Value.absent(),
    required String paidBy,
    this.dateCreated = const Value.absent(),
    this.dateTimeModified = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isSettled = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : groupFk = Value(groupFk),
        title = Value(title),
        amount = Value(amount),
        currency = Value(currency),
        paidBy = Value(paidBy);
  static Insertable<SharedExpenseEntry> custom({
    Expression<String>? expensePk,
    Expression<String>? groupFk,
    Expression<String>? title,
    Expression<String>? description,
    Expression<double>? amount,
    Expression<String>? currency,
    Expression<String>? categoryFk,
    Expression<String>? paidBy,
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? dateTimeModified,
    Expression<String>? imageUrl,
    Expression<bool>? isSettled,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (expensePk != null) 'expense_pk': expensePk,
      if (groupFk != null) 'group_fk': groupFk,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (amount != null) 'amount': amount,
      if (currency != null) 'currency': currency,
      if (categoryFk != null) 'category_fk': categoryFk,
      if (paidBy != null) 'paid_by': paidBy,
      if (dateCreated != null) 'date_created': dateCreated,
      if (dateTimeModified != null) 'date_time_modified': dateTimeModified,
      if (imageUrl != null) 'image_url': imageUrl,
      if (isSettled != null) 'is_settled': isSettled,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SharedExpensesCompanion copyWith(
      {Value<String>? expensePk,
      Value<String>? groupFk,
      Value<String>? title,
      Value<String?>? description,
      Value<double>? amount,
      Value<String>? currency,
      Value<String?>? categoryFk,
      Value<String>? paidBy,
      Value<DateTime>? dateCreated,
      Value<DateTime?>? dateTimeModified,
      Value<String?>? imageUrl,
      Value<bool>? isSettled,
      Value<int>? rowid}) {
    return SharedExpensesCompanion(
      expensePk: expensePk ?? this.expensePk,
      groupFk: groupFk ?? this.groupFk,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      categoryFk: categoryFk ?? this.categoryFk,
      paidBy: paidBy ?? this.paidBy,
      dateCreated: dateCreated ?? this.dateCreated,
      dateTimeModified: dateTimeModified ?? this.dateTimeModified,
      imageUrl: imageUrl ?? this.imageUrl,
      isSettled: isSettled ?? this.isSettled,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (expensePk.present) {
      map['expense_pk'] = Variable<String>(expensePk.value);
    }
    if (groupFk.present) {
      map['group_fk'] = Variable<String>(groupFk.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (categoryFk.present) {
      map['category_fk'] = Variable<String>(categoryFk.value);
    }
    if (paidBy.present) {
      map['paid_by'] = Variable<String>(paidBy.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateTimeModified.present) {
      map['date_time_modified'] = Variable<DateTime>(dateTimeModified.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (isSettled.present) {
      map['is_settled'] = Variable<bool>(isSettled.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SharedExpensesCompanion(')
          ..write('expensePk: $expensePk, ')
          ..write('groupFk: $groupFk, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('categoryFk: $categoryFk, ')
          ..write('paidBy: $paidBy, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateTimeModified: $dateTimeModified, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isSettled: $isSettled, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpenseSplitsTable extends ExpenseSplits
    with TableInfo<$ExpenseSplitsTable, ExpenseSplitEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpenseSplitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _splitPkMeta =
      const VerificationMeta('splitPk');
  @override
  late final GeneratedColumn<String> splitPk = GeneratedColumn<String>(
      'split_pk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _expenseFkMeta =
      const VerificationMeta('expenseFk');
  @override
  late final GeneratedColumn<String> expenseFk = GeneratedColumn<String>(
      'expense_fk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES shared_expenses (expense_pk)'));
  static const VerificationMeta _userEmailMeta =
      const VerificationMeta('userEmail');
  @override
  late final GeneratedColumn<String> userEmail = GeneratedColumn<String>(
      'user_email', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _shareAmountMeta =
      const VerificationMeta('shareAmount');
  @override
  late final GeneratedColumn<double> shareAmount = GeneratedColumn<double>(
      'share_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paidAmountMeta =
      const VerificationMeta('paidAmount');
  @override
  late final GeneratedColumn<double> paidAmount = GeneratedColumn<double>(
      'paid_amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _isPaidMeta = const VerificationMeta('isPaid');
  @override
  late final GeneratedColumn<bool> isPaid = GeneratedColumn<bool>(
      'is_paid', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_paid" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [splitPk, expenseFk, userEmail, shareAmount, paidAmount, isPaid];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expense_splits';
  @override
  VerificationContext validateIntegrity(Insertable<ExpenseSplitEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('split_pk')) {
      context.handle(_splitPkMeta,
          splitPk.isAcceptableOrUnknown(data['split_pk']!, _splitPkMeta));
    }
    if (data.containsKey('expense_fk')) {
      context.handle(_expenseFkMeta,
          expenseFk.isAcceptableOrUnknown(data['expense_fk']!, _expenseFkMeta));
    } else if (isInserting) {
      context.missing(_expenseFkMeta);
    }
    if (data.containsKey('user_email')) {
      context.handle(_userEmailMeta,
          userEmail.isAcceptableOrUnknown(data['user_email']!, _userEmailMeta));
    } else if (isInserting) {
      context.missing(_userEmailMeta);
    }
    if (data.containsKey('share_amount')) {
      context.handle(
          _shareAmountMeta,
          shareAmount.isAcceptableOrUnknown(
              data['share_amount']!, _shareAmountMeta));
    } else if (isInserting) {
      context.missing(_shareAmountMeta);
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
          _paidAmountMeta,
          paidAmount.isAcceptableOrUnknown(
              data['paid_amount']!, _paidAmountMeta));
    }
    if (data.containsKey('is_paid')) {
      context.handle(_isPaidMeta,
          isPaid.isAcceptableOrUnknown(data['is_paid']!, _isPaidMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {splitPk};
  @override
  ExpenseSplitEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseSplitEntry(
      splitPk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}split_pk'])!,
      expenseFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}expense_fk'])!,
      userEmail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_email'])!,
      shareAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}share_amount'])!,
      paidAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}paid_amount'])!,
      isPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_paid'])!,
    );
  }

  @override
  $ExpenseSplitsTable createAlias(String alias) {
    return $ExpenseSplitsTable(attachedDatabase, alias);
  }
}

class ExpenseSplitEntry extends DataClass
    implements Insertable<ExpenseSplitEntry> {
  final String splitPk;
  final String expenseFk;
  final String userEmail;
  final double shareAmount;
  final double paidAmount;
  final bool isPaid;
  const ExpenseSplitEntry(
      {required this.splitPk,
      required this.expenseFk,
      required this.userEmail,
      required this.shareAmount,
      required this.paidAmount,
      required this.isPaid});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['split_pk'] = Variable<String>(splitPk);
    map['expense_fk'] = Variable<String>(expenseFk);
    map['user_email'] = Variable<String>(userEmail);
    map['share_amount'] = Variable<double>(shareAmount);
    map['paid_amount'] = Variable<double>(paidAmount);
    map['is_paid'] = Variable<bool>(isPaid);
    return map;
  }

  ExpenseSplitsCompanion toCompanion(bool nullToAbsent) {
    return ExpenseSplitsCompanion(
      splitPk: Value(splitPk),
      expenseFk: Value(expenseFk),
      userEmail: Value(userEmail),
      shareAmount: Value(shareAmount),
      paidAmount: Value(paidAmount),
      isPaid: Value(isPaid),
    );
  }

  factory ExpenseSplitEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseSplitEntry(
      splitPk: serializer.fromJson<String>(json['splitPk']),
      expenseFk: serializer.fromJson<String>(json['expenseFk']),
      userEmail: serializer.fromJson<String>(json['userEmail']),
      shareAmount: serializer.fromJson<double>(json['shareAmount']),
      paidAmount: serializer.fromJson<double>(json['paidAmount']),
      isPaid: serializer.fromJson<bool>(json['isPaid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'splitPk': serializer.toJson<String>(splitPk),
      'expenseFk': serializer.toJson<String>(expenseFk),
      'userEmail': serializer.toJson<String>(userEmail),
      'shareAmount': serializer.toJson<double>(shareAmount),
      'paidAmount': serializer.toJson<double>(paidAmount),
      'isPaid': serializer.toJson<bool>(isPaid),
    };
  }

  ExpenseSplitEntry copyWith(
          {String? splitPk,
          String? expenseFk,
          String? userEmail,
          double? shareAmount,
          double? paidAmount,
          bool? isPaid}) =>
      ExpenseSplitEntry(
        splitPk: splitPk ?? this.splitPk,
        expenseFk: expenseFk ?? this.expenseFk,
        userEmail: userEmail ?? this.userEmail,
        shareAmount: shareAmount ?? this.shareAmount,
        paidAmount: paidAmount ?? this.paidAmount,
        isPaid: isPaid ?? this.isPaid,
      );
  ExpenseSplitEntry copyWithCompanion(ExpenseSplitsCompanion data) {
    return ExpenseSplitEntry(
      splitPk: data.splitPk.present ? data.splitPk.value : this.splitPk,
      expenseFk: data.expenseFk.present ? data.expenseFk.value : this.expenseFk,
      userEmail: data.userEmail.present ? data.userEmail.value : this.userEmail,
      shareAmount:
          data.shareAmount.present ? data.shareAmount.value : this.shareAmount,
      paidAmount:
          data.paidAmount.present ? data.paidAmount.value : this.paidAmount,
      isPaid: data.isPaid.present ? data.isPaid.value : this.isPaid,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseSplitEntry(')
          ..write('splitPk: $splitPk, ')
          ..write('expenseFk: $expenseFk, ')
          ..write('userEmail: $userEmail, ')
          ..write('shareAmount: $shareAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('isPaid: $isPaid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      splitPk, expenseFk, userEmail, shareAmount, paidAmount, isPaid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseSplitEntry &&
          other.splitPk == this.splitPk &&
          other.expenseFk == this.expenseFk &&
          other.userEmail == this.userEmail &&
          other.shareAmount == this.shareAmount &&
          other.paidAmount == this.paidAmount &&
          other.isPaid == this.isPaid);
}

class ExpenseSplitsCompanion extends UpdateCompanion<ExpenseSplitEntry> {
  final Value<String> splitPk;
  final Value<String> expenseFk;
  final Value<String> userEmail;
  final Value<double> shareAmount;
  final Value<double> paidAmount;
  final Value<bool> isPaid;
  final Value<int> rowid;
  const ExpenseSplitsCompanion({
    this.splitPk = const Value.absent(),
    this.expenseFk = const Value.absent(),
    this.userEmail = const Value.absent(),
    this.shareAmount = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.isPaid = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpenseSplitsCompanion.insert({
    this.splitPk = const Value.absent(),
    required String expenseFk,
    required String userEmail,
    required double shareAmount,
    this.paidAmount = const Value.absent(),
    this.isPaid = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : expenseFk = Value(expenseFk),
        userEmail = Value(userEmail),
        shareAmount = Value(shareAmount);
  static Insertable<ExpenseSplitEntry> custom({
    Expression<String>? splitPk,
    Expression<String>? expenseFk,
    Expression<String>? userEmail,
    Expression<double>? shareAmount,
    Expression<double>? paidAmount,
    Expression<bool>? isPaid,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (splitPk != null) 'split_pk': splitPk,
      if (expenseFk != null) 'expense_fk': expenseFk,
      if (userEmail != null) 'user_email': userEmail,
      if (shareAmount != null) 'share_amount': shareAmount,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (isPaid != null) 'is_paid': isPaid,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpenseSplitsCompanion copyWith(
      {Value<String>? splitPk,
      Value<String>? expenseFk,
      Value<String>? userEmail,
      Value<double>? shareAmount,
      Value<double>? paidAmount,
      Value<bool>? isPaid,
      Value<int>? rowid}) {
    return ExpenseSplitsCompanion(
      splitPk: splitPk ?? this.splitPk,
      expenseFk: expenseFk ?? this.expenseFk,
      userEmail: userEmail ?? this.userEmail,
      shareAmount: shareAmount ?? this.shareAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      isPaid: isPaid ?? this.isPaid,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (splitPk.present) {
      map['split_pk'] = Variable<String>(splitPk.value);
    }
    if (expenseFk.present) {
      map['expense_fk'] = Variable<String>(expenseFk.value);
    }
    if (userEmail.present) {
      map['user_email'] = Variable<String>(userEmail.value);
    }
    if (shareAmount.present) {
      map['share_amount'] = Variable<double>(shareAmount.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<double>(paidAmount.value);
    }
    if (isPaid.present) {
      map['is_paid'] = Variable<bool>(isPaid.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseSplitsCompanion(')
          ..write('splitPk: $splitPk, ')
          ..write('expenseFk: $expenseFk, ')
          ..write('userEmail: $userEmail, ')
          ..write('shareAmount: $shareAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('isPaid: $isPaid, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GroupBalancesTable extends GroupBalances
    with TableInfo<$GroupBalancesTable, GroupBalanceEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupBalancesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _balancePkMeta =
      const VerificationMeta('balancePk');
  @override
  late final GeneratedColumn<String> balancePk = GeneratedColumn<String>(
      'balance_pk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _groupFkMeta =
      const VerificationMeta('groupFk');
  @override
  late final GeneratedColumn<String> groupFk = GeneratedColumn<String>(
      'group_fk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES "groups" (group_pk)'));
  static const VerificationMeta _fromUserEmailMeta =
      const VerificationMeta('fromUserEmail');
  @override
  late final GeneratedColumn<String> fromUserEmail = GeneratedColumn<String>(
      'from_user_email', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _toUserEmailMeta =
      const VerificationMeta('toUserEmail');
  @override
  late final GeneratedColumn<String> toUserEmail = GeneratedColumn<String>(
      'to_user_email', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [
        balancePk,
        groupFk,
        fromUserEmail,
        toUserEmail,
        amount,
        currency,
        lastUpdated
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'group_balances';
  @override
  VerificationContext validateIntegrity(Insertable<GroupBalanceEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('balance_pk')) {
      context.handle(_balancePkMeta,
          balancePk.isAcceptableOrUnknown(data['balance_pk']!, _balancePkMeta));
    }
    if (data.containsKey('group_fk')) {
      context.handle(_groupFkMeta,
          groupFk.isAcceptableOrUnknown(data['group_fk']!, _groupFkMeta));
    } else if (isInserting) {
      context.missing(_groupFkMeta);
    }
    if (data.containsKey('from_user_email')) {
      context.handle(
          _fromUserEmailMeta,
          fromUserEmail.isAcceptableOrUnknown(
              data['from_user_email']!, _fromUserEmailMeta));
    } else if (isInserting) {
      context.missing(_fromUserEmailMeta);
    }
    if (data.containsKey('to_user_email')) {
      context.handle(
          _toUserEmailMeta,
          toUserEmail.isAcceptableOrUnknown(
              data['to_user_email']!, _toUserEmailMeta));
    } else if (isInserting) {
      context.missing(_toUserEmailMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {balancePk};
  @override
  GroupBalanceEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupBalanceEntry(
      balancePk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}balance_pk'])!,
      groupFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_fk'])!,
      fromUserEmail: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}from_user_email'])!,
      toUserEmail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}to_user_email'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $GroupBalancesTable createAlias(String alias) {
    return $GroupBalancesTable(attachedDatabase, alias);
  }
}

class GroupBalanceEntry extends DataClass
    implements Insertable<GroupBalanceEntry> {
  final String balancePk;
  final String groupFk;
  final String fromUserEmail;
  final String toUserEmail;
  final double amount;
  final String currency;
  final DateTime lastUpdated;
  const GroupBalanceEntry(
      {required this.balancePk,
      required this.groupFk,
      required this.fromUserEmail,
      required this.toUserEmail,
      required this.amount,
      required this.currency,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['balance_pk'] = Variable<String>(balancePk);
    map['group_fk'] = Variable<String>(groupFk);
    map['from_user_email'] = Variable<String>(fromUserEmail);
    map['to_user_email'] = Variable<String>(toUserEmail);
    map['amount'] = Variable<double>(amount);
    map['currency'] = Variable<String>(currency);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  GroupBalancesCompanion toCompanion(bool nullToAbsent) {
    return GroupBalancesCompanion(
      balancePk: Value(balancePk),
      groupFk: Value(groupFk),
      fromUserEmail: Value(fromUserEmail),
      toUserEmail: Value(toUserEmail),
      amount: Value(amount),
      currency: Value(currency),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory GroupBalanceEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupBalanceEntry(
      balancePk: serializer.fromJson<String>(json['balancePk']),
      groupFk: serializer.fromJson<String>(json['groupFk']),
      fromUserEmail: serializer.fromJson<String>(json['fromUserEmail']),
      toUserEmail: serializer.fromJson<String>(json['toUserEmail']),
      amount: serializer.fromJson<double>(json['amount']),
      currency: serializer.fromJson<String>(json['currency']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'balancePk': serializer.toJson<String>(balancePk),
      'groupFk': serializer.toJson<String>(groupFk),
      'fromUserEmail': serializer.toJson<String>(fromUserEmail),
      'toUserEmail': serializer.toJson<String>(toUserEmail),
      'amount': serializer.toJson<double>(amount),
      'currency': serializer.toJson<String>(currency),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  GroupBalanceEntry copyWith(
          {String? balancePk,
          String? groupFk,
          String? fromUserEmail,
          String? toUserEmail,
          double? amount,
          String? currency,
          DateTime? lastUpdated}) =>
      GroupBalanceEntry(
        balancePk: balancePk ?? this.balancePk,
        groupFk: groupFk ?? this.groupFk,
        fromUserEmail: fromUserEmail ?? this.fromUserEmail,
        toUserEmail: toUserEmail ?? this.toUserEmail,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  GroupBalanceEntry copyWithCompanion(GroupBalancesCompanion data) {
    return GroupBalanceEntry(
      balancePk: data.balancePk.present ? data.balancePk.value : this.balancePk,
      groupFk: data.groupFk.present ? data.groupFk.value : this.groupFk,
      fromUserEmail: data.fromUserEmail.present
          ? data.fromUserEmail.value
          : this.fromUserEmail,
      toUserEmail:
          data.toUserEmail.present ? data.toUserEmail.value : this.toUserEmail,
      amount: data.amount.present ? data.amount.value : this.amount,
      currency: data.currency.present ? data.currency.value : this.currency,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupBalanceEntry(')
          ..write('balancePk: $balancePk, ')
          ..write('groupFk: $groupFk, ')
          ..write('fromUserEmail: $fromUserEmail, ')
          ..write('toUserEmail: $toUserEmail, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(balancePk, groupFk, fromUserEmail,
      toUserEmail, amount, currency, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupBalanceEntry &&
          other.balancePk == this.balancePk &&
          other.groupFk == this.groupFk &&
          other.fromUserEmail == this.fromUserEmail &&
          other.toUserEmail == this.toUserEmail &&
          other.amount == this.amount &&
          other.currency == this.currency &&
          other.lastUpdated == this.lastUpdated);
}

class GroupBalancesCompanion extends UpdateCompanion<GroupBalanceEntry> {
  final Value<String> balancePk;
  final Value<String> groupFk;
  final Value<String> fromUserEmail;
  final Value<String> toUserEmail;
  final Value<double> amount;
  final Value<String> currency;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const GroupBalancesCompanion({
    this.balancePk = const Value.absent(),
    this.groupFk = const Value.absent(),
    this.fromUserEmail = const Value.absent(),
    this.toUserEmail = const Value.absent(),
    this.amount = const Value.absent(),
    this.currency = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupBalancesCompanion.insert({
    this.balancePk = const Value.absent(),
    required String groupFk,
    required String fromUserEmail,
    required String toUserEmail,
    required double amount,
    required String currency,
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : groupFk = Value(groupFk),
        fromUserEmail = Value(fromUserEmail),
        toUserEmail = Value(toUserEmail),
        amount = Value(amount),
        currency = Value(currency);
  static Insertable<GroupBalanceEntry> custom({
    Expression<String>? balancePk,
    Expression<String>? groupFk,
    Expression<String>? fromUserEmail,
    Expression<String>? toUserEmail,
    Expression<double>? amount,
    Expression<String>? currency,
    Expression<DateTime>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (balancePk != null) 'balance_pk': balancePk,
      if (groupFk != null) 'group_fk': groupFk,
      if (fromUserEmail != null) 'from_user_email': fromUserEmail,
      if (toUserEmail != null) 'to_user_email': toUserEmail,
      if (amount != null) 'amount': amount,
      if (currency != null) 'currency': currency,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupBalancesCompanion copyWith(
      {Value<String>? balancePk,
      Value<String>? groupFk,
      Value<String>? fromUserEmail,
      Value<String>? toUserEmail,
      Value<double>? amount,
      Value<String>? currency,
      Value<DateTime>? lastUpdated,
      Value<int>? rowid}) {
    return GroupBalancesCompanion(
      balancePk: balancePk ?? this.balancePk,
      groupFk: groupFk ?? this.groupFk,
      fromUserEmail: fromUserEmail ?? this.fromUserEmail,
      toUserEmail: toUserEmail ?? this.toUserEmail,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (balancePk.present) {
      map['balance_pk'] = Variable<String>(balancePk.value);
    }
    if (groupFk.present) {
      map['group_fk'] = Variable<String>(groupFk.value);
    }
    if (fromUserEmail.present) {
      map['from_user_email'] = Variable<String>(fromUserEmail.value);
    }
    if (toUserEmail.present) {
      map['to_user_email'] = Variable<String>(toUserEmail.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupBalancesCompanion(')
          ..write('balancePk: $balancePk, ')
          ..write('groupFk: $groupFk, ')
          ..write('fromUserEmail: $fromUserEmail, ')
          ..write('toUserEmail: $toUserEmail, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettlementsTable extends Settlements
    with TableInfo<$SettlementsTable, SettlementEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettlementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _settlementPkMeta =
      const VerificationMeta('settlementPk');
  @override
  late final GeneratedColumn<String> settlementPk = GeneratedColumn<String>(
      'settlement_pk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _groupFkMeta =
      const VerificationMeta('groupFk');
  @override
  late final GeneratedColumn<String> groupFk = GeneratedColumn<String>(
      'group_fk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES "groups" (group_pk)'));
  static const VerificationMeta _fromUserEmailMeta =
      const VerificationMeta('fromUserEmail');
  @override
  late final GeneratedColumn<String> fromUserEmail = GeneratedColumn<String>(
      'from_user_email', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _toUserEmailMeta =
      const VerificationMeta('toUserEmail');
  @override
  late final GeneratedColumn<String> toUserEmail = GeneratedColumn<String>(
      'to_user_email', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [
        settlementPk,
        groupFk,
        fromUserEmail,
        toUserEmail,
        amount,
        currency,
        paymentMethod,
        notes,
        dateCreated
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settlements';
  @override
  VerificationContext validateIntegrity(Insertable<SettlementEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('settlement_pk')) {
      context.handle(
          _settlementPkMeta,
          settlementPk.isAcceptableOrUnknown(
              data['settlement_pk']!, _settlementPkMeta));
    }
    if (data.containsKey('group_fk')) {
      context.handle(_groupFkMeta,
          groupFk.isAcceptableOrUnknown(data['group_fk']!, _groupFkMeta));
    } else if (isInserting) {
      context.missing(_groupFkMeta);
    }
    if (data.containsKey('from_user_email')) {
      context.handle(
          _fromUserEmailMeta,
          fromUserEmail.isAcceptableOrUnknown(
              data['from_user_email']!, _fromUserEmailMeta));
    } else if (isInserting) {
      context.missing(_fromUserEmailMeta);
    }
    if (data.containsKey('to_user_email')) {
      context.handle(
          _toUserEmailMeta,
          toUserEmail.isAcceptableOrUnknown(
              data['to_user_email']!, _toUserEmailMeta));
    } else if (isInserting) {
      context.missing(_toUserEmailMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {settlementPk};
  @override
  SettlementEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettlementEntry(
      settlementPk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}settlement_pk'])!,
      groupFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_fk'])!,
      fromUserEmail: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}from_user_email'])!,
      toUserEmail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}to_user_email'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
    );
  }

  @override
  $SettlementsTable createAlias(String alias) {
    return $SettlementsTable(attachedDatabase, alias);
  }
}

class SettlementEntry extends DataClass implements Insertable<SettlementEntry> {
  final String settlementPk;
  final String groupFk;
  final String fromUserEmail;
  final String toUserEmail;
  final double amount;
  final String currency;
  final String? paymentMethod;
  final String? notes;
  final DateTime dateCreated;
  const SettlementEntry(
      {required this.settlementPk,
      required this.groupFk,
      required this.fromUserEmail,
      required this.toUserEmail,
      required this.amount,
      required this.currency,
      this.paymentMethod,
      this.notes,
      required this.dateCreated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['settlement_pk'] = Variable<String>(settlementPk);
    map['group_fk'] = Variable<String>(groupFk);
    map['from_user_email'] = Variable<String>(fromUserEmail);
    map['to_user_email'] = Variable<String>(toUserEmail);
    map['amount'] = Variable<double>(amount);
    map['currency'] = Variable<String>(currency);
    if (!nullToAbsent || paymentMethod != null) {
      map['payment_method'] = Variable<String>(paymentMethod);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['date_created'] = Variable<DateTime>(dateCreated);
    return map;
  }

  SettlementsCompanion toCompanion(bool nullToAbsent) {
    return SettlementsCompanion(
      settlementPk: Value(settlementPk),
      groupFk: Value(groupFk),
      fromUserEmail: Value(fromUserEmail),
      toUserEmail: Value(toUserEmail),
      amount: Value(amount),
      currency: Value(currency),
      paymentMethod: paymentMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethod),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      dateCreated: Value(dateCreated),
    );
  }

  factory SettlementEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettlementEntry(
      settlementPk: serializer.fromJson<String>(json['settlementPk']),
      groupFk: serializer.fromJson<String>(json['groupFk']),
      fromUserEmail: serializer.fromJson<String>(json['fromUserEmail']),
      toUserEmail: serializer.fromJson<String>(json['toUserEmail']),
      amount: serializer.fromJson<double>(json['amount']),
      currency: serializer.fromJson<String>(json['currency']),
      paymentMethod: serializer.fromJson<String?>(json['paymentMethod']),
      notes: serializer.fromJson<String?>(json['notes']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'settlementPk': serializer.toJson<String>(settlementPk),
      'groupFk': serializer.toJson<String>(groupFk),
      'fromUserEmail': serializer.toJson<String>(fromUserEmail),
      'toUserEmail': serializer.toJson<String>(toUserEmail),
      'amount': serializer.toJson<double>(amount),
      'currency': serializer.toJson<String>(currency),
      'paymentMethod': serializer.toJson<String?>(paymentMethod),
      'notes': serializer.toJson<String?>(notes),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
    };
  }

  SettlementEntry copyWith(
          {String? settlementPk,
          String? groupFk,
          String? fromUserEmail,
          String? toUserEmail,
          double? amount,
          String? currency,
          Value<String?> paymentMethod = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? dateCreated}) =>
      SettlementEntry(
        settlementPk: settlementPk ?? this.settlementPk,
        groupFk: groupFk ?? this.groupFk,
        fromUserEmail: fromUserEmail ?? this.fromUserEmail,
        toUserEmail: toUserEmail ?? this.toUserEmail,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        paymentMethod:
            paymentMethod.present ? paymentMethod.value : this.paymentMethod,
        notes: notes.present ? notes.value : this.notes,
        dateCreated: dateCreated ?? this.dateCreated,
      );
  SettlementEntry copyWithCompanion(SettlementsCompanion data) {
    return SettlementEntry(
      settlementPk: data.settlementPk.present
          ? data.settlementPk.value
          : this.settlementPk,
      groupFk: data.groupFk.present ? data.groupFk.value : this.groupFk,
      fromUserEmail: data.fromUserEmail.present
          ? data.fromUserEmail.value
          : this.fromUserEmail,
      toUserEmail:
          data.toUserEmail.present ? data.toUserEmail.value : this.toUserEmail,
      amount: data.amount.present ? data.amount.value : this.amount,
      currency: data.currency.present ? data.currency.value : this.currency,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      notes: data.notes.present ? data.notes.value : this.notes,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettlementEntry(')
          ..write('settlementPk: $settlementPk, ')
          ..write('groupFk: $groupFk, ')
          ..write('fromUserEmail: $fromUserEmail, ')
          ..write('toUserEmail: $toUserEmail, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('notes: $notes, ')
          ..write('dateCreated: $dateCreated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(settlementPk, groupFk, fromUserEmail,
      toUserEmail, amount, currency, paymentMethod, notes, dateCreated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettlementEntry &&
          other.settlementPk == this.settlementPk &&
          other.groupFk == this.groupFk &&
          other.fromUserEmail == this.fromUserEmail &&
          other.toUserEmail == this.toUserEmail &&
          other.amount == this.amount &&
          other.currency == this.currency &&
          other.paymentMethod == this.paymentMethod &&
          other.notes == this.notes &&
          other.dateCreated == this.dateCreated);
}

class SettlementsCompanion extends UpdateCompanion<SettlementEntry> {
  final Value<String> settlementPk;
  final Value<String> groupFk;
  final Value<String> fromUserEmail;
  final Value<String> toUserEmail;
  final Value<double> amount;
  final Value<String> currency;
  final Value<String?> paymentMethod;
  final Value<String?> notes;
  final Value<DateTime> dateCreated;
  final Value<int> rowid;
  const SettlementsCompanion({
    this.settlementPk = const Value.absent(),
    this.groupFk = const Value.absent(),
    this.fromUserEmail = const Value.absent(),
    this.toUserEmail = const Value.absent(),
    this.amount = const Value.absent(),
    this.currency = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.notes = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettlementsCompanion.insert({
    this.settlementPk = const Value.absent(),
    required String groupFk,
    required String fromUserEmail,
    required String toUserEmail,
    required double amount,
    required String currency,
    this.paymentMethod = const Value.absent(),
    this.notes = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : groupFk = Value(groupFk),
        fromUserEmail = Value(fromUserEmail),
        toUserEmail = Value(toUserEmail),
        amount = Value(amount),
        currency = Value(currency);
  static Insertable<SettlementEntry> custom({
    Expression<String>? settlementPk,
    Expression<String>? groupFk,
    Expression<String>? fromUserEmail,
    Expression<String>? toUserEmail,
    Expression<double>? amount,
    Expression<String>? currency,
    Expression<String>? paymentMethod,
    Expression<String>? notes,
    Expression<DateTime>? dateCreated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (settlementPk != null) 'settlement_pk': settlementPk,
      if (groupFk != null) 'group_fk': groupFk,
      if (fromUserEmail != null) 'from_user_email': fromUserEmail,
      if (toUserEmail != null) 'to_user_email': toUserEmail,
      if (amount != null) 'amount': amount,
      if (currency != null) 'currency': currency,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (notes != null) 'notes': notes,
      if (dateCreated != null) 'date_created': dateCreated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettlementsCompanion copyWith(
      {Value<String>? settlementPk,
      Value<String>? groupFk,
      Value<String>? fromUserEmail,
      Value<String>? toUserEmail,
      Value<double>? amount,
      Value<String>? currency,
      Value<String?>? paymentMethod,
      Value<String?>? notes,
      Value<DateTime>? dateCreated,
      Value<int>? rowid}) {
    return SettlementsCompanion(
      settlementPk: settlementPk ?? this.settlementPk,
      groupFk: groupFk ?? this.groupFk,
      fromUserEmail: fromUserEmail ?? this.fromUserEmail,
      toUserEmail: toUserEmail ?? this.toUserEmail,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      notes: notes ?? this.notes,
      dateCreated: dateCreated ?? this.dateCreated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (settlementPk.present) {
      map['settlement_pk'] = Variable<String>(settlementPk.value);
    }
    if (groupFk.present) {
      map['group_fk'] = Variable<String>(groupFk.value);
    }
    if (fromUserEmail.present) {
      map['from_user_email'] = Variable<String>(fromUserEmail.value);
    }
    if (toUserEmail.present) {
      map['to_user_email'] = Variable<String>(toUserEmail.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettlementsCompanion(')
          ..write('settlementPk: $settlementPk, ')
          ..write('groupFk: $groupFk, ')
          ..write('fromUserEmail: $fromUserEmail, ')
          ..write('toUserEmail: $toUserEmail, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('notes: $notes, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GroupActivityTable extends GroupActivity
    with TableInfo<$GroupActivityTable, GroupActivityEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupActivityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _activityPkMeta =
      const VerificationMeta('activityPk');
  @override
  late final GeneratedColumn<String> activityPk = GeneratedColumn<String>(
      'activity_pk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _groupFkMeta =
      const VerificationMeta('groupFk');
  @override
  late final GeneratedColumn<String> groupFk = GeneratedColumn<String>(
      'group_fk', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES "groups" (group_pk)'));
  static const VerificationMeta _activityTypeMeta =
      const VerificationMeta('activityType');
  @override
  late final GeneratedColumn<String> activityType = GeneratedColumn<String>(
      'activity_type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _performedByMeta =
      const VerificationMeta('performedBy');
  @override
  late final GeneratedColumn<String> performedBy = GeneratedColumn<String>(
      'performed_by', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _relatedExpenseFkMeta =
      const VerificationMeta('relatedExpenseFk');
  @override
  late final GeneratedColumn<String> relatedExpenseFk = GeneratedColumn<String>(
      'related_expense_fk', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES shared_expenses (expense_pk)'));
  static const VerificationMeta _relatedSettlementFkMeta =
      const VerificationMeta('relatedSettlementFk');
  @override
  late final GeneratedColumn<String> relatedSettlementFk =
      GeneratedColumn<String>('related_settlement_fk', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES settlements (settlement_pk)'));
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [
        activityPk,
        groupFk,
        activityType,
        performedBy,
        description,
        relatedExpenseFk,
        relatedSettlementFk,
        dateCreated
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'group_activity';
  @override
  VerificationContext validateIntegrity(Insertable<GroupActivityEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('activity_pk')) {
      context.handle(
          _activityPkMeta,
          activityPk.isAcceptableOrUnknown(
              data['activity_pk']!, _activityPkMeta));
    }
    if (data.containsKey('group_fk')) {
      context.handle(_groupFkMeta,
          groupFk.isAcceptableOrUnknown(data['group_fk']!, _groupFkMeta));
    } else if (isInserting) {
      context.missing(_groupFkMeta);
    }
    if (data.containsKey('activity_type')) {
      context.handle(
          _activityTypeMeta,
          activityType.isAcceptableOrUnknown(
              data['activity_type']!, _activityTypeMeta));
    } else if (isInserting) {
      context.missing(_activityTypeMeta);
    }
    if (data.containsKey('performed_by')) {
      context.handle(
          _performedByMeta,
          performedBy.isAcceptableOrUnknown(
              data['performed_by']!, _performedByMeta));
    } else if (isInserting) {
      context.missing(_performedByMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('related_expense_fk')) {
      context.handle(
          _relatedExpenseFkMeta,
          relatedExpenseFk.isAcceptableOrUnknown(
              data['related_expense_fk']!, _relatedExpenseFkMeta));
    }
    if (data.containsKey('related_settlement_fk')) {
      context.handle(
          _relatedSettlementFkMeta,
          relatedSettlementFk.isAcceptableOrUnknown(
              data['related_settlement_fk']!, _relatedSettlementFkMeta));
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {activityPk};
  @override
  GroupActivityEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupActivityEntry(
      activityPk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}activity_pk'])!,
      groupFk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_fk'])!,
      activityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}activity_type'])!,
      performedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}performed_by'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      relatedExpenseFk: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}related_expense_fk']),
      relatedSettlementFk: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}related_settlement_fk']),
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
    );
  }

  @override
  $GroupActivityTable createAlias(String alias) {
    return $GroupActivityTable(attachedDatabase, alias);
  }
}

class GroupActivityEntry extends DataClass
    implements Insertable<GroupActivityEntry> {
  final String activityPk;
  final String groupFk;
  final String activityType;
  final String performedBy;
  final String description;
  final String? relatedExpenseFk;
  final String? relatedSettlementFk;
  final DateTime dateCreated;
  const GroupActivityEntry(
      {required this.activityPk,
      required this.groupFk,
      required this.activityType,
      required this.performedBy,
      required this.description,
      this.relatedExpenseFk,
      this.relatedSettlementFk,
      required this.dateCreated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['activity_pk'] = Variable<String>(activityPk);
    map['group_fk'] = Variable<String>(groupFk);
    map['activity_type'] = Variable<String>(activityType);
    map['performed_by'] = Variable<String>(performedBy);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || relatedExpenseFk != null) {
      map['related_expense_fk'] = Variable<String>(relatedExpenseFk);
    }
    if (!nullToAbsent || relatedSettlementFk != null) {
      map['related_settlement_fk'] = Variable<String>(relatedSettlementFk);
    }
    map['date_created'] = Variable<DateTime>(dateCreated);
    return map;
  }

  GroupActivityCompanion toCompanion(bool nullToAbsent) {
    return GroupActivityCompanion(
      activityPk: Value(activityPk),
      groupFk: Value(groupFk),
      activityType: Value(activityType),
      performedBy: Value(performedBy),
      description: Value(description),
      relatedExpenseFk: relatedExpenseFk == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedExpenseFk),
      relatedSettlementFk: relatedSettlementFk == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedSettlementFk),
      dateCreated: Value(dateCreated),
    );
  }

  factory GroupActivityEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupActivityEntry(
      activityPk: serializer.fromJson<String>(json['activityPk']),
      groupFk: serializer.fromJson<String>(json['groupFk']),
      activityType: serializer.fromJson<String>(json['activityType']),
      performedBy: serializer.fromJson<String>(json['performedBy']),
      description: serializer.fromJson<String>(json['description']),
      relatedExpenseFk: serializer.fromJson<String?>(json['relatedExpenseFk']),
      relatedSettlementFk:
          serializer.fromJson<String?>(json['relatedSettlementFk']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'activityPk': serializer.toJson<String>(activityPk),
      'groupFk': serializer.toJson<String>(groupFk),
      'activityType': serializer.toJson<String>(activityType),
      'performedBy': serializer.toJson<String>(performedBy),
      'description': serializer.toJson<String>(description),
      'relatedExpenseFk': serializer.toJson<String?>(relatedExpenseFk),
      'relatedSettlementFk': serializer.toJson<String?>(relatedSettlementFk),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
    };
  }

  GroupActivityEntry copyWith(
          {String? activityPk,
          String? groupFk,
          String? activityType,
          String? performedBy,
          String? description,
          Value<String?> relatedExpenseFk = const Value.absent(),
          Value<String?> relatedSettlementFk = const Value.absent(),
          DateTime? dateCreated}) =>
      GroupActivityEntry(
        activityPk: activityPk ?? this.activityPk,
        groupFk: groupFk ?? this.groupFk,
        activityType: activityType ?? this.activityType,
        performedBy: performedBy ?? this.performedBy,
        description: description ?? this.description,
        relatedExpenseFk: relatedExpenseFk.present
            ? relatedExpenseFk.value
            : this.relatedExpenseFk,
        relatedSettlementFk: relatedSettlementFk.present
            ? relatedSettlementFk.value
            : this.relatedSettlementFk,
        dateCreated: dateCreated ?? this.dateCreated,
      );
  GroupActivityEntry copyWithCompanion(GroupActivityCompanion data) {
    return GroupActivityEntry(
      activityPk:
          data.activityPk.present ? data.activityPk.value : this.activityPk,
      groupFk: data.groupFk.present ? data.groupFk.value : this.groupFk,
      activityType: data.activityType.present
          ? data.activityType.value
          : this.activityType,
      performedBy:
          data.performedBy.present ? data.performedBy.value : this.performedBy,
      description:
          data.description.present ? data.description.value : this.description,
      relatedExpenseFk: data.relatedExpenseFk.present
          ? data.relatedExpenseFk.value
          : this.relatedExpenseFk,
      relatedSettlementFk: data.relatedSettlementFk.present
          ? data.relatedSettlementFk.value
          : this.relatedSettlementFk,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupActivityEntry(')
          ..write('activityPk: $activityPk, ')
          ..write('groupFk: $groupFk, ')
          ..write('activityType: $activityType, ')
          ..write('performedBy: $performedBy, ')
          ..write('description: $description, ')
          ..write('relatedExpenseFk: $relatedExpenseFk, ')
          ..write('relatedSettlementFk: $relatedSettlementFk, ')
          ..write('dateCreated: $dateCreated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      activityPk,
      groupFk,
      activityType,
      performedBy,
      description,
      relatedExpenseFk,
      relatedSettlementFk,
      dateCreated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupActivityEntry &&
          other.activityPk == this.activityPk &&
          other.groupFk == this.groupFk &&
          other.activityType == this.activityType &&
          other.performedBy == this.performedBy &&
          other.description == this.description &&
          other.relatedExpenseFk == this.relatedExpenseFk &&
          other.relatedSettlementFk == this.relatedSettlementFk &&
          other.dateCreated == this.dateCreated);
}

class GroupActivityCompanion extends UpdateCompanion<GroupActivityEntry> {
  final Value<String> activityPk;
  final Value<String> groupFk;
  final Value<String> activityType;
  final Value<String> performedBy;
  final Value<String> description;
  final Value<String?> relatedExpenseFk;
  final Value<String?> relatedSettlementFk;
  final Value<DateTime> dateCreated;
  final Value<int> rowid;
  const GroupActivityCompanion({
    this.activityPk = const Value.absent(),
    this.groupFk = const Value.absent(),
    this.activityType = const Value.absent(),
    this.performedBy = const Value.absent(),
    this.description = const Value.absent(),
    this.relatedExpenseFk = const Value.absent(),
    this.relatedSettlementFk = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupActivityCompanion.insert({
    this.activityPk = const Value.absent(),
    required String groupFk,
    required String activityType,
    required String performedBy,
    required String description,
    this.relatedExpenseFk = const Value.absent(),
    this.relatedSettlementFk = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : groupFk = Value(groupFk),
        activityType = Value(activityType),
        performedBy = Value(performedBy),
        description = Value(description);
  static Insertable<GroupActivityEntry> custom({
    Expression<String>? activityPk,
    Expression<String>? groupFk,
    Expression<String>? activityType,
    Expression<String>? performedBy,
    Expression<String>? description,
    Expression<String>? relatedExpenseFk,
    Expression<String>? relatedSettlementFk,
    Expression<DateTime>? dateCreated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (activityPk != null) 'activity_pk': activityPk,
      if (groupFk != null) 'group_fk': groupFk,
      if (activityType != null) 'activity_type': activityType,
      if (performedBy != null) 'performed_by': performedBy,
      if (description != null) 'description': description,
      if (relatedExpenseFk != null) 'related_expense_fk': relatedExpenseFk,
      if (relatedSettlementFk != null)
        'related_settlement_fk': relatedSettlementFk,
      if (dateCreated != null) 'date_created': dateCreated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupActivityCompanion copyWith(
      {Value<String>? activityPk,
      Value<String>? groupFk,
      Value<String>? activityType,
      Value<String>? performedBy,
      Value<String>? description,
      Value<String?>? relatedExpenseFk,
      Value<String?>? relatedSettlementFk,
      Value<DateTime>? dateCreated,
      Value<int>? rowid}) {
    return GroupActivityCompanion(
      activityPk: activityPk ?? this.activityPk,
      groupFk: groupFk ?? this.groupFk,
      activityType: activityType ?? this.activityType,
      performedBy: performedBy ?? this.performedBy,
      description: description ?? this.description,
      relatedExpenseFk: relatedExpenseFk ?? this.relatedExpenseFk,
      relatedSettlementFk: relatedSettlementFk ?? this.relatedSettlementFk,
      dateCreated: dateCreated ?? this.dateCreated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (activityPk.present) {
      map['activity_pk'] = Variable<String>(activityPk.value);
    }
    if (groupFk.present) {
      map['group_fk'] = Variable<String>(groupFk.value);
    }
    if (activityType.present) {
      map['activity_type'] = Variable<String>(activityType.value);
    }
    if (performedBy.present) {
      map['performed_by'] = Variable<String>(performedBy.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (relatedExpenseFk.present) {
      map['related_expense_fk'] = Variable<String>(relatedExpenseFk.value);
    }
    if (relatedSettlementFk.present) {
      map['related_settlement_fk'] =
          Variable<String>(relatedSettlementFk.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupActivityCompanion(')
          ..write('activityPk: $activityPk, ')
          ..write('groupFk: $groupFk, ')
          ..write('activityType: $activityType, ')
          ..write('performedBy: $performedBy, ')
          ..write('description: $description, ')
          ..write('relatedExpenseFk: $relatedExpenseFk, ')
          ..write('relatedSettlementFk: $relatedSettlementFk, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$FinanceDatabase extends GeneratedDatabase {
  _$FinanceDatabase(QueryExecutor e) : super(e);
  $FinanceDatabaseManager get managers => $FinanceDatabaseManager(this);
  late final $WalletsTable wallets = $WalletsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ObjectivesTable objectives = $ObjectivesTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $BudgetsTable budgets = $BudgetsTable(this);
  late final $CategoryBudgetLimitsTable categoryBudgetLimits =
      $CategoryBudgetLimitsTable(this);
  late final $AssociatedTitlesTable associatedTitles =
      $AssociatedTitlesTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $ScannerTemplatesTable scannerTemplates =
      $ScannerTemplatesTable(this);
  late final $DeleteLogsTable deleteLogs = $DeleteLogsTable(this);
  late final $GroupsTable groups = $GroupsTable(this);
  late final $GroupMembersTable groupMembers = $GroupMembersTable(this);
  late final $SharedExpensesTable sharedExpenses = $SharedExpensesTable(this);
  late final $ExpenseSplitsTable expenseSplits = $ExpenseSplitsTable(this);
  late final $GroupBalancesTable groupBalances = $GroupBalancesTable(this);
  late final $SettlementsTable settlements = $SettlementsTable(this);
  late final $GroupActivityTable groupActivity = $GroupActivityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        wallets,
        categories,
        objectives,
        transactions,
        budgets,
        categoryBudgetLimits,
        associatedTitles,
        appSettings,
        scannerTemplates,
        deleteLogs,
        groups,
        groupMembers,
        sharedExpenses,
        expenseSplits,
        groupBalances,
        settlements,
        groupActivity
      ];
}

typedef $$WalletsTableCreateCompanionBuilder = WalletsCompanion Function({
  Value<String> walletPk,
  required String name,
  Value<String?> colour,
  Value<String?> iconName,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  required int order,
  Value<String?> currency,
  Value<String?> currencyFormat,
  Value<int> decimals,
  Value<List<HomePageWidgetDisplay>?> homePageWidgetDisplay,
  Value<int> rowid,
});
typedef $$WalletsTableUpdateCompanionBuilder = WalletsCompanion Function({
  Value<String> walletPk,
  Value<String> name,
  Value<String?> colour,
  Value<String?> iconName,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  Value<int> order,
  Value<String?> currency,
  Value<String?> currencyFormat,
  Value<int> decimals,
  Value<List<HomePageWidgetDisplay>?> homePageWidgetDisplay,
  Value<int> rowid,
});

final class $$WalletsTableReferences extends BaseReferences<_$FinanceDatabase,
    $WalletsTable, TransactionWallet> {
  $$WalletsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ObjectivesTable, List<Objective>>
      _objectivesRefsTable(_$FinanceDatabase db) =>
          MultiTypedResultKey.fromTable(db.objectives,
              aliasName: $_aliasNameGenerator(
                  db.wallets.walletPk, db.objectives.walletFk));

  $$ObjectivesTableProcessedTableManager get objectivesRefs {
    final manager = $$ObjectivesTableTableManager($_db, $_db.objectives).filter(
        (f) =>
            f.walletFk.walletPk.sqlEquals($_itemColumn<String>('wallet_pk')!));

    final cache = $_typedResult.readTableOrNull(_objectivesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
      _transactionsRefsTable(_$FinanceDatabase db) =>
          MultiTypedResultKey.fromTable(db.transactions,
              aliasName: $_aliasNameGenerator(
                  db.wallets.walletPk, db.transactions.walletFk));

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) =>
            f.walletFk.walletPk.sqlEquals($_itemColumn<String>('wallet_pk')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$BudgetsTable, List<Budget>> _budgetsRefsTable(
          _$FinanceDatabase db) =>
      MultiTypedResultKey.fromTable(db.budgets,
          aliasName:
              $_aliasNameGenerator(db.wallets.walletPk, db.budgets.walletFk));

  $$BudgetsTableProcessedTableManager get budgetsRefs {
    final manager = $$BudgetsTableTableManager($_db, $_db.budgets).filter((f) =>
        f.walletFk.walletPk.sqlEquals($_itemColumn<String>('wallet_pk')!));

    final cache = $_typedResult.readTableOrNull(_budgetsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$CategoryBudgetLimitsTable,
      List<CategoryBudgetLimit>> _categoryBudgetLimitsRefsTable(
          _$FinanceDatabase db) =>
      MultiTypedResultKey.fromTable(db.categoryBudgetLimits,
          aliasName: $_aliasNameGenerator(
              db.wallets.walletPk, db.categoryBudgetLimits.walletFk));

  $$CategoryBudgetLimitsTableProcessedTableManager
      get categoryBudgetLimitsRefs {
    final manager = $$CategoryBudgetLimitsTableTableManager(
            $_db, $_db.categoryBudgetLimits)
        .filter((f) =>
            f.walletFk.walletPk.sqlEquals($_itemColumn<String>('wallet_pk')!));

    final cache =
        $_typedResult.readTableOrNull(_categoryBudgetLimitsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ScannerTemplatesTable, List<ScannerTemplate>>
      _scannerTemplatesRefsTable(_$FinanceDatabase db) =>
          MultiTypedResultKey.fromTable(db.scannerTemplates,
              aliasName: $_aliasNameGenerator(
                  db.wallets.walletPk, db.scannerTemplates.walletFk));

  $$ScannerTemplatesTableProcessedTableManager get scannerTemplatesRefs {
    final manager = $$ScannerTemplatesTableTableManager(
            $_db, $_db.scannerTemplates)
        .filter((f) =>
            f.walletFk.walletPk.sqlEquals($_itemColumn<String>('wallet_pk')!));

    final cache =
        $_typedResult.readTableOrNull(_scannerTemplatesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$WalletsTableFilterComposer
    extends Composer<_$FinanceDatabase, $WalletsTable> {
  $$WalletsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get walletPk => $composableBuilder(
      column: $table.walletPk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colour => $composableBuilder(
      column: $table.colour, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currencyFormat => $composableBuilder(
      column: $table.currencyFormat,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get decimals => $composableBuilder(
      column: $table.decimals, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<HomePageWidgetDisplay>?,
          List<HomePageWidgetDisplay>, String>
      get homePageWidgetDisplay => $composableBuilder(
          column: $table.homePageWidgetDisplay,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  Expression<bool> objectivesRefs(
      Expression<bool> Function($$ObjectivesTableFilterComposer f) f) {
    final $$ObjectivesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletPk,
        referencedTable: $db.objectives,
        getReferencedColumn: (t) => t.walletFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObjectivesTableFilterComposer(
              $db: $db,
              $table: $db.objectives,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> transactionsRefs(
      Expression<bool> Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletPk,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.walletFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> budgetsRefs(
      Expression<bool> Function($$BudgetsTableFilterComposer f) f) {
    final $$BudgetsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletPk,
        referencedTable: $db.budgets,
        getReferencedColumn: (t) => t.walletFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BudgetsTableFilterComposer(
              $db: $db,
              $table: $db.budgets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> categoryBudgetLimitsRefs(
      Expression<bool> Function($$CategoryBudgetLimitsTableFilterComposer f)
          f) {
    final $$CategoryBudgetLimitsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletPk,
        referencedTable: $db.categoryBudgetLimits,
        getReferencedColumn: (t) => t.walletFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryBudgetLimitsTableFilterComposer(
              $db: $db,
              $table: $db.categoryBudgetLimits,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> scannerTemplatesRefs(
      Expression<bool> Function($$ScannerTemplatesTableFilterComposer f) f) {
    final $$ScannerTemplatesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletPk,
        referencedTable: $db.scannerTemplates,
        getReferencedColumn: (t) => t.walletFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ScannerTemplatesTableFilterComposer(
              $db: $db,
              $table: $db.scannerTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WalletsTableOrderingComposer
    extends Composer<_$FinanceDatabase, $WalletsTable> {
  $$WalletsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get walletPk => $composableBuilder(
      column: $table.walletPk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colour => $composableBuilder(
      column: $table.colour, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currencyFormat => $composableBuilder(
      column: $table.currencyFormat,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get decimals => $composableBuilder(
      column: $table.decimals, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get homePageWidgetDisplay => $composableBuilder(
      column: $table.homePageWidgetDisplay,
      builder: (column) => ColumnOrderings(column));
}

class $$WalletsTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $WalletsTable> {
  $$WalletsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get walletPk =>
      $composableBuilder(column: $table.walletPk, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get colour =>
      $composableBuilder(column: $table.colour, builder: (column) => column);

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get currencyFormat => $composableBuilder(
      column: $table.currencyFormat, builder: (column) => column);

  GeneratedColumn<int> get decimals =>
      $composableBuilder(column: $table.decimals, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<HomePageWidgetDisplay>?, String>
      get homePageWidgetDisplay => $composableBuilder(
          column: $table.homePageWidgetDisplay, builder: (column) => column);

  Expression<T> objectivesRefs<T extends Object>(
      Expression<T> Function($$ObjectivesTableAnnotationComposer a) f) {
    final $$ObjectivesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletPk,
        referencedTable: $db.objectives,
        getReferencedColumn: (t) => t.walletFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObjectivesTableAnnotationComposer(
              $db: $db,
              $table: $db.objectives,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> transactionsRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableAnnotationComposer a) f) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletPk,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.walletFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> budgetsRefs<T extends Object>(
      Expression<T> Function($$BudgetsTableAnnotationComposer a) f) {
    final $$BudgetsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletPk,
        referencedTable: $db.budgets,
        getReferencedColumn: (t) => t.walletFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BudgetsTableAnnotationComposer(
              $db: $db,
              $table: $db.budgets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> categoryBudgetLimitsRefs<T extends Object>(
      Expression<T> Function($$CategoryBudgetLimitsTableAnnotationComposer a)
          f) {
    final $$CategoryBudgetLimitsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.walletPk,
            referencedTable: $db.categoryBudgetLimits,
            getReferencedColumn: (t) => t.walletFk,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CategoryBudgetLimitsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.categoryBudgetLimits,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> scannerTemplatesRefs<T extends Object>(
      Expression<T> Function($$ScannerTemplatesTableAnnotationComposer a) f) {
    final $$ScannerTemplatesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletPk,
        referencedTable: $db.scannerTemplates,
        getReferencedColumn: (t) => t.walletFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ScannerTemplatesTableAnnotationComposer(
              $db: $db,
              $table: $db.scannerTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WalletsTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $WalletsTable,
    TransactionWallet,
    $$WalletsTableFilterComposer,
    $$WalletsTableOrderingComposer,
    $$WalletsTableAnnotationComposer,
    $$WalletsTableCreateCompanionBuilder,
    $$WalletsTableUpdateCompanionBuilder,
    (TransactionWallet, $$WalletsTableReferences),
    TransactionWallet,
    PrefetchHooks Function(
        {bool objectivesRefs,
        bool transactionsRefs,
        bool budgetsRefs,
        bool categoryBudgetLimitsRefs,
        bool scannerTemplatesRefs})> {
  $$WalletsTableTableManager(_$FinanceDatabase db, $WalletsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WalletsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WalletsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WalletsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> walletPk = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> colour = const Value.absent(),
            Value<String?> iconName = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<String?> currency = const Value.absent(),
            Value<String?> currencyFormat = const Value.absent(),
            Value<int> decimals = const Value.absent(),
            Value<List<HomePageWidgetDisplay>?> homePageWidgetDisplay =
                const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WalletsCompanion(
            walletPk: walletPk,
            name: name,
            colour: colour,
            iconName: iconName,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            order: order,
            currency: currency,
            currencyFormat: currencyFormat,
            decimals: decimals,
            homePageWidgetDisplay: homePageWidgetDisplay,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> walletPk = const Value.absent(),
            required String name,
            Value<String?> colour = const Value.absent(),
            Value<String?> iconName = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            required int order,
            Value<String?> currency = const Value.absent(),
            Value<String?> currencyFormat = const Value.absent(),
            Value<int> decimals = const Value.absent(),
            Value<List<HomePageWidgetDisplay>?> homePageWidgetDisplay =
                const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WalletsCompanion.insert(
            walletPk: walletPk,
            name: name,
            colour: colour,
            iconName: iconName,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            order: order,
            currency: currency,
            currencyFormat: currencyFormat,
            decimals: decimals,
            homePageWidgetDisplay: homePageWidgetDisplay,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$WalletsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {objectivesRefs = false,
              transactionsRefs = false,
              budgetsRefs = false,
              categoryBudgetLimitsRefs = false,
              scannerTemplatesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (objectivesRefs) db.objectives,
                if (transactionsRefs) db.transactions,
                if (budgetsRefs) db.budgets,
                if (categoryBudgetLimitsRefs) db.categoryBudgetLimits,
                if (scannerTemplatesRefs) db.scannerTemplates
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (objectivesRefs)
                    await $_getPrefetchedData<TransactionWallet, $WalletsTable,
                            Objective>(
                        currentTable: table,
                        referencedTable:
                            $$WalletsTableReferences._objectivesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WalletsTableReferences(db, table, p0)
                                .objectivesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.walletFk == item.walletPk),
                        typedResults: items),
                  if (transactionsRefs)
                    await $_getPrefetchedData<TransactionWallet, $WalletsTable,
                            Transaction>(
                        currentTable: table,
                        referencedTable:
                            $$WalletsTableReferences._transactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WalletsTableReferences(db, table, p0)
                                .transactionsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.walletFk == item.walletPk),
                        typedResults: items),
                  if (budgetsRefs)
                    await $_getPrefetchedData<TransactionWallet, $WalletsTable,
                            Budget>(
                        currentTable: table,
                        referencedTable:
                            $$WalletsTableReferences._budgetsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WalletsTableReferences(db, table, p0).budgetsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.walletFk == item.walletPk),
                        typedResults: items),
                  if (categoryBudgetLimitsRefs)
                    await $_getPrefetchedData<TransactionWallet, $WalletsTable,
                            CategoryBudgetLimit>(
                        currentTable: table,
                        referencedTable: $$WalletsTableReferences
                            ._categoryBudgetLimitsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WalletsTableReferences(db, table, p0)
                                .categoryBudgetLimitsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.walletFk == item.walletPk),
                        typedResults: items),
                  if (scannerTemplatesRefs)
                    await $_getPrefetchedData<TransactionWallet, $WalletsTable, ScannerTemplate>(
                        currentTable: table,
                        referencedTable: $$WalletsTableReferences
                            ._scannerTemplatesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WalletsTableReferences(db, table, p0)
                                .scannerTemplatesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.walletFk == item.walletPk),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$WalletsTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $WalletsTable,
    TransactionWallet,
    $$WalletsTableFilterComposer,
    $$WalletsTableOrderingComposer,
    $$WalletsTableAnnotationComposer,
    $$WalletsTableCreateCompanionBuilder,
    $$WalletsTableUpdateCompanionBuilder,
    (TransactionWallet, $$WalletsTableReferences),
    TransactionWallet,
    PrefetchHooks Function(
        {bool objectivesRefs,
        bool transactionsRefs,
        bool budgetsRefs,
        bool categoryBudgetLimitsRefs,
        bool scannerTemplatesRefs})>;
typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  Value<String> categoryPk,
  required String name,
  Value<String?> colour,
  Value<String?> iconName,
  Value<String?> emojiIconName,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  required int order,
  Value<bool> income,
  Value<MethodAdded?> methodAdded,
  Value<String?> mainCategoryPk,
  Value<int> rowid,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<String> categoryPk,
  Value<String> name,
  Value<String?> colour,
  Value<String?> iconName,
  Value<String?> emojiIconName,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  Value<int> order,
  Value<bool> income,
  Value<MethodAdded?> methodAdded,
  Value<String?> mainCategoryPk,
  Value<int> rowid,
});

final class $$CategoriesTableReferences extends BaseReferences<
    _$FinanceDatabase, $CategoriesTable, TransactionCategory> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _mainCategoryPkTable(_$FinanceDatabase db) =>
      db.categories.createAlias($_aliasNameGenerator(
          db.categories.mainCategoryPk, db.categories.categoryPk));

  $$CategoriesTableProcessedTableManager? get mainCategoryPk {
    final $_column = $_itemColumn<String>('main_category_pk');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.categoryPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mainCategoryPkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$CategoryBudgetLimitsTable,
      List<CategoryBudgetLimit>> _categoryBudgetLimitsRefsTable(
          _$FinanceDatabase db) =>
      MultiTypedResultKey.fromTable(db.categoryBudgetLimits,
          aliasName: $_aliasNameGenerator(
              db.categories.categoryPk, db.categoryBudgetLimits.categoryFk));

  $$CategoryBudgetLimitsTableProcessedTableManager
      get categoryBudgetLimitsRefs {
    final manager =
        $$CategoryBudgetLimitsTableTableManager($_db, $_db.categoryBudgetLimits)
            .filter((f) => f.categoryFk.categoryPk
                .sqlEquals($_itemColumn<String>('category_pk')!));

    final cache =
        $_typedResult.readTableOrNull(_categoryBudgetLimitsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AssociatedTitlesTable,
      List<TransactionAssociatedTitle>> _associatedTitlesRefsTable(
          _$FinanceDatabase db) =>
      MultiTypedResultKey.fromTable(db.associatedTitles,
          aliasName: $_aliasNameGenerator(
              db.categories.categoryPk, db.associatedTitles.categoryFk));

  $$AssociatedTitlesTableProcessedTableManager get associatedTitlesRefs {
    final manager =
        $$AssociatedTitlesTableTableManager($_db, $_db.associatedTitles).filter(
            (f) => f.categoryFk.categoryPk
                .sqlEquals($_itemColumn<String>('category_pk')!));

    final cache =
        $_typedResult.readTableOrNull(_associatedTitlesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ScannerTemplatesTable, List<ScannerTemplate>>
      _scannerTemplatesRefsTable(_$FinanceDatabase db) =>
          MultiTypedResultKey.fromTable(db.scannerTemplates,
              aliasName: $_aliasNameGenerator(db.categories.categoryPk,
                  db.scannerTemplates.defaultCategoryFk));

  $$ScannerTemplatesTableProcessedTableManager get scannerTemplatesRefs {
    final manager =
        $$ScannerTemplatesTableTableManager($_db, $_db.scannerTemplates).filter(
            (f) => f.defaultCategoryFk.categoryPk
                .sqlEquals($_itemColumn<String>('category_pk')!));

    final cache =
        $_typedResult.readTableOrNull(_scannerTemplatesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$SharedExpensesTable, List<SharedExpenseEntry>>
      _sharedExpensesRefsTable(_$FinanceDatabase db) =>
          MultiTypedResultKey.fromTable(db.sharedExpenses,
              aliasName: $_aliasNameGenerator(
                  db.categories.categoryPk, db.sharedExpenses.categoryFk));

  $$SharedExpensesTableProcessedTableManager get sharedExpensesRefs {
    final manager = $$SharedExpensesTableTableManager($_db, $_db.sharedExpenses)
        .filter((f) => f.categoryFk.categoryPk
            .sqlEquals($_itemColumn<String>('category_pk')!));

    final cache = $_typedResult.readTableOrNull(_sharedExpensesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$FinanceDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get categoryPk => $composableBuilder(
      column: $table.categoryPk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colour => $composableBuilder(
      column: $table.colour, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get emojiIconName => $composableBuilder(
      column: $table.emojiIconName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get income => $composableBuilder(
      column: $table.income, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<MethodAdded?, MethodAdded, int>
      get methodAdded => $composableBuilder(
          column: $table.methodAdded,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  $$CategoriesTableFilterComposer get mainCategoryPk {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.mainCategoryPk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> categoryBudgetLimitsRefs(
      Expression<bool> Function($$CategoryBudgetLimitsTableFilterComposer f)
          f) {
    final $$CategoryBudgetLimitsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryPk,
        referencedTable: $db.categoryBudgetLimits,
        getReferencedColumn: (t) => t.categoryFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryBudgetLimitsTableFilterComposer(
              $db: $db,
              $table: $db.categoryBudgetLimits,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> associatedTitlesRefs(
      Expression<bool> Function($$AssociatedTitlesTableFilterComposer f) f) {
    final $$AssociatedTitlesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryPk,
        referencedTable: $db.associatedTitles,
        getReferencedColumn: (t) => t.categoryFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssociatedTitlesTableFilterComposer(
              $db: $db,
              $table: $db.associatedTitles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> scannerTemplatesRefs(
      Expression<bool> Function($$ScannerTemplatesTableFilterComposer f) f) {
    final $$ScannerTemplatesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryPk,
        referencedTable: $db.scannerTemplates,
        getReferencedColumn: (t) => t.defaultCategoryFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ScannerTemplatesTableFilterComposer(
              $db: $db,
              $table: $db.scannerTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> sharedExpensesRefs(
      Expression<bool> Function($$SharedExpensesTableFilterComposer f) f) {
    final $$SharedExpensesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryPk,
        referencedTable: $db.sharedExpenses,
        getReferencedColumn: (t) => t.categoryFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SharedExpensesTableFilterComposer(
              $db: $db,
              $table: $db.sharedExpenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$FinanceDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get categoryPk => $composableBuilder(
      column: $table.categoryPk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colour => $composableBuilder(
      column: $table.colour, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get emojiIconName => $composableBuilder(
      column: $table.emojiIconName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get income => $composableBuilder(
      column: $table.income, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get methodAdded => $composableBuilder(
      column: $table.methodAdded, builder: (column) => ColumnOrderings(column));

  $$CategoriesTableOrderingComposer get mainCategoryPk {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.mainCategoryPk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get categoryPk => $composableBuilder(
      column: $table.categoryPk, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get colour =>
      $composableBuilder(column: $table.colour, builder: (column) => column);

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  GeneratedColumn<String> get emojiIconName => $composableBuilder(
      column: $table.emojiIconName, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<bool> get income =>
      $composableBuilder(column: $table.income, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MethodAdded?, int> get methodAdded =>
      $composableBuilder(
          column: $table.methodAdded, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get mainCategoryPk {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.mainCategoryPk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> categoryBudgetLimitsRefs<T extends Object>(
      Expression<T> Function($$CategoryBudgetLimitsTableAnnotationComposer a)
          f) {
    final $$CategoryBudgetLimitsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryPk,
            referencedTable: $db.categoryBudgetLimits,
            getReferencedColumn: (t) => t.categoryFk,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CategoryBudgetLimitsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.categoryBudgetLimits,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> associatedTitlesRefs<T extends Object>(
      Expression<T> Function($$AssociatedTitlesTableAnnotationComposer a) f) {
    final $$AssociatedTitlesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryPk,
        referencedTable: $db.associatedTitles,
        getReferencedColumn: (t) => t.categoryFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssociatedTitlesTableAnnotationComposer(
              $db: $db,
              $table: $db.associatedTitles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> scannerTemplatesRefs<T extends Object>(
      Expression<T> Function($$ScannerTemplatesTableAnnotationComposer a) f) {
    final $$ScannerTemplatesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryPk,
        referencedTable: $db.scannerTemplates,
        getReferencedColumn: (t) => t.defaultCategoryFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ScannerTemplatesTableAnnotationComposer(
              $db: $db,
              $table: $db.scannerTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> sharedExpensesRefs<T extends Object>(
      Expression<T> Function($$SharedExpensesTableAnnotationComposer a) f) {
    final $$SharedExpensesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryPk,
        referencedTable: $db.sharedExpenses,
        getReferencedColumn: (t) => t.categoryFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SharedExpensesTableAnnotationComposer(
              $db: $db,
              $table: $db.sharedExpenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $CategoriesTable,
    TransactionCategory,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (TransactionCategory, $$CategoriesTableReferences),
    TransactionCategory,
    PrefetchHooks Function(
        {bool mainCategoryPk,
        bool categoryBudgetLimitsRefs,
        bool associatedTitlesRefs,
        bool scannerTemplatesRefs,
        bool sharedExpensesRefs})> {
  $$CategoriesTableTableManager(_$FinanceDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> categoryPk = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> colour = const Value.absent(),
            Value<String?> iconName = const Value.absent(),
            Value<String?> emojiIconName = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<bool> income = const Value.absent(),
            Value<MethodAdded?> methodAdded = const Value.absent(),
            Value<String?> mainCategoryPk = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesCompanion(
            categoryPk: categoryPk,
            name: name,
            colour: colour,
            iconName: iconName,
            emojiIconName: emojiIconName,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            order: order,
            income: income,
            methodAdded: methodAdded,
            mainCategoryPk: mainCategoryPk,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> categoryPk = const Value.absent(),
            required String name,
            Value<String?> colour = const Value.absent(),
            Value<String?> iconName = const Value.absent(),
            Value<String?> emojiIconName = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            required int order,
            Value<bool> income = const Value.absent(),
            Value<MethodAdded?> methodAdded = const Value.absent(),
            Value<String?> mainCategoryPk = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            categoryPk: categoryPk,
            name: name,
            colour: colour,
            iconName: iconName,
            emojiIconName: emojiIconName,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            order: order,
            income: income,
            methodAdded: methodAdded,
            mainCategoryPk: mainCategoryPk,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CategoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {mainCategoryPk = false,
              categoryBudgetLimitsRefs = false,
              associatedTitlesRefs = false,
              scannerTemplatesRefs = false,
              sharedExpensesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (categoryBudgetLimitsRefs) db.categoryBudgetLimits,
                if (associatedTitlesRefs) db.associatedTitles,
                if (scannerTemplatesRefs) db.scannerTemplates,
                if (sharedExpensesRefs) db.sharedExpenses
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (mainCategoryPk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.mainCategoryPk,
                    referencedTable:
                        $$CategoriesTableReferences._mainCategoryPkTable(db),
                    referencedColumn: $$CategoriesTableReferences
                        ._mainCategoryPkTable(db)
                        .categoryPk,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (categoryBudgetLimitsRefs)
                    await $_getPrefetchedData<TransactionCategory,
                            $CategoriesTable, CategoryBudgetLimit>(
                        currentTable: table,
                        referencedTable: $$CategoriesTableReferences
                            ._categoryBudgetLimitsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableReferences(db, table, p0)
                                .categoryBudgetLimitsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryFk == item.categoryPk),
                        typedResults: items),
                  if (associatedTitlesRefs)
                    await $_getPrefetchedData<TransactionCategory,
                            $CategoriesTable, TransactionAssociatedTitle>(
                        currentTable: table,
                        referencedTable: $$CategoriesTableReferences
                            ._associatedTitlesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableReferences(db, table, p0)
                                .associatedTitlesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryFk == item.categoryPk),
                        typedResults: items),
                  if (scannerTemplatesRefs)
                    await $_getPrefetchedData<TransactionCategory,
                            $CategoriesTable, ScannerTemplate>(
                        currentTable: table,
                        referencedTable: $$CategoriesTableReferences
                            ._scannerTemplatesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableReferences(db, table, p0)
                                .scannerTemplatesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.defaultCategoryFk == item.categoryPk),
                        typedResults: items),
                  if (sharedExpensesRefs)
                    await $_getPrefetchedData<TransactionCategory,
                            $CategoriesTable, SharedExpenseEntry>(
                        currentTable: table,
                        referencedTable: $$CategoriesTableReferences
                            ._sharedExpensesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableReferences(db, table, p0)
                                .sharedExpensesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryFk == item.categoryPk),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $CategoriesTable,
    TransactionCategory,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (TransactionCategory, $$CategoriesTableReferences),
    TransactionCategory,
    PrefetchHooks Function(
        {bool mainCategoryPk,
        bool categoryBudgetLimitsRefs,
        bool associatedTitlesRefs,
        bool scannerTemplatesRefs,
        bool sharedExpensesRefs})>;
typedef $$ObjectivesTableCreateCompanionBuilder = ObjectivesCompanion Function({
  Value<String> objectivePk,
  Value<ObjectiveType> type,
  required String name,
  required double amount,
  required int order,
  Value<String?> colour,
  Value<DateTime> dateCreated,
  Value<DateTime?> endDate,
  Value<DateTime?> dateTimeModified,
  Value<String?> iconName,
  Value<String?> emojiIconName,
  Value<bool> income,
  Value<bool> pinned,
  Value<bool> archived,
  Value<String> walletFk,
  Value<int> rowid,
});
typedef $$ObjectivesTableUpdateCompanionBuilder = ObjectivesCompanion Function({
  Value<String> objectivePk,
  Value<ObjectiveType> type,
  Value<String> name,
  Value<double> amount,
  Value<int> order,
  Value<String?> colour,
  Value<DateTime> dateCreated,
  Value<DateTime?> endDate,
  Value<DateTime?> dateTimeModified,
  Value<String?> iconName,
  Value<String?> emojiIconName,
  Value<bool> income,
  Value<bool> pinned,
  Value<bool> archived,
  Value<String> walletFk,
  Value<int> rowid,
});

final class $$ObjectivesTableReferences
    extends BaseReferences<_$FinanceDatabase, $ObjectivesTable, Objective> {
  $$ObjectivesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WalletsTable _walletFkTable(_$FinanceDatabase db) =>
      db.wallets.createAlias(
          $_aliasNameGenerator(db.objectives.walletFk, db.wallets.walletPk));

  $$WalletsTableProcessedTableManager get walletFk {
    final $_column = $_itemColumn<String>('wallet_fk')!;

    final manager = $$WalletsTableTableManager($_db, $_db.wallets)
        .filter((f) => f.walletPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_walletFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ObjectivesTableFilterComposer
    extends Composer<_$FinanceDatabase, $ObjectivesTable> {
  $$ObjectivesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get objectivePk => $composableBuilder(
      column: $table.objectivePk, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ObjectiveType, ObjectiveType, int> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colour => $composableBuilder(
      column: $table.colour, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get emojiIconName => $composableBuilder(
      column: $table.emojiIconName, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get income => $composableBuilder(
      column: $table.income, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get pinned => $composableBuilder(
      column: $table.pinned, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnFilters(column));

  $$WalletsTableFilterComposer get walletFk {
    final $$WalletsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletFk,
        referencedTable: $db.wallets,
        getReferencedColumn: (t) => t.walletPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WalletsTableFilterComposer(
              $db: $db,
              $table: $db.wallets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ObjectivesTableOrderingComposer
    extends Composer<_$FinanceDatabase, $ObjectivesTable> {
  $$ObjectivesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get objectivePk => $composableBuilder(
      column: $table.objectivePk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colour => $composableBuilder(
      column: $table.colour, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get emojiIconName => $composableBuilder(
      column: $table.emojiIconName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get income => $composableBuilder(
      column: $table.income, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get pinned => $composableBuilder(
      column: $table.pinned, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnOrderings(column));

  $$WalletsTableOrderingComposer get walletFk {
    final $$WalletsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletFk,
        referencedTable: $db.wallets,
        getReferencedColumn: (t) => t.walletPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WalletsTableOrderingComposer(
              $db: $db,
              $table: $db.wallets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ObjectivesTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $ObjectivesTable> {
  $$ObjectivesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get objectivePk => $composableBuilder(
      column: $table.objectivePk, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ObjectiveType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<String> get colour =>
      $composableBuilder(column: $table.colour, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified, builder: (column) => column);

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  GeneratedColumn<String> get emojiIconName => $composableBuilder(
      column: $table.emojiIconName, builder: (column) => column);

  GeneratedColumn<bool> get income =>
      $composableBuilder(column: $table.income, builder: (column) => column);

  GeneratedColumn<bool> get pinned =>
      $composableBuilder(column: $table.pinned, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  $$WalletsTableAnnotationComposer get walletFk {
    final $$WalletsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletFk,
        referencedTable: $db.wallets,
        getReferencedColumn: (t) => t.walletPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WalletsTableAnnotationComposer(
              $db: $db,
              $table: $db.wallets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ObjectivesTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $ObjectivesTable,
    Objective,
    $$ObjectivesTableFilterComposer,
    $$ObjectivesTableOrderingComposer,
    $$ObjectivesTableAnnotationComposer,
    $$ObjectivesTableCreateCompanionBuilder,
    $$ObjectivesTableUpdateCompanionBuilder,
    (Objective, $$ObjectivesTableReferences),
    Objective,
    PrefetchHooks Function({bool walletFk})> {
  $$ObjectivesTableTableManager(_$FinanceDatabase db, $ObjectivesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ObjectivesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ObjectivesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ObjectivesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> objectivePk = const Value.absent(),
            Value<ObjectiveType> type = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<String?> colour = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<String?> iconName = const Value.absent(),
            Value<String?> emojiIconName = const Value.absent(),
            Value<bool> income = const Value.absent(),
            Value<bool> pinned = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            Value<String> walletFk = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ObjectivesCompanion(
            objectivePk: objectivePk,
            type: type,
            name: name,
            amount: amount,
            order: order,
            colour: colour,
            dateCreated: dateCreated,
            endDate: endDate,
            dateTimeModified: dateTimeModified,
            iconName: iconName,
            emojiIconName: emojiIconName,
            income: income,
            pinned: pinned,
            archived: archived,
            walletFk: walletFk,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> objectivePk = const Value.absent(),
            Value<ObjectiveType> type = const Value.absent(),
            required String name,
            required double amount,
            required int order,
            Value<String?> colour = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<String?> iconName = const Value.absent(),
            Value<String?> emojiIconName = const Value.absent(),
            Value<bool> income = const Value.absent(),
            Value<bool> pinned = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            Value<String> walletFk = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ObjectivesCompanion.insert(
            objectivePk: objectivePk,
            type: type,
            name: name,
            amount: amount,
            order: order,
            colour: colour,
            dateCreated: dateCreated,
            endDate: endDate,
            dateTimeModified: dateTimeModified,
            iconName: iconName,
            emojiIconName: emojiIconName,
            income: income,
            pinned: pinned,
            archived: archived,
            walletFk: walletFk,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ObjectivesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({walletFk = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (walletFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.walletFk,
                    referencedTable:
                        $$ObjectivesTableReferences._walletFkTable(db),
                    referencedColumn:
                        $$ObjectivesTableReferences._walletFkTable(db).walletPk,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ObjectivesTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $ObjectivesTable,
    Objective,
    $$ObjectivesTableFilterComposer,
    $$ObjectivesTableOrderingComposer,
    $$ObjectivesTableAnnotationComposer,
    $$ObjectivesTableCreateCompanionBuilder,
    $$ObjectivesTableUpdateCompanionBuilder,
    (Objective, $$ObjectivesTableReferences),
    Objective,
    PrefetchHooks Function({bool walletFk})>;
typedef $$TransactionsTableCreateCompanionBuilder = TransactionsCompanion
    Function({
  Value<String> transactionPk,
  Value<String?> pairedTransactionFk,
  required String name,
  required double amount,
  required String note,
  required String categoryFk,
  Value<String?> subCategoryFk,
  Value<String> walletFk,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  Value<DateTime?> originalDateDue,
  Value<bool> income,
  Value<int?> periodLength,
  Value<BudgetReoccurence?> reoccurrence,
  Value<DateTime?> endDate,
  Value<bool?> upcomingTransactionNotification,
  Value<TransactionSpecialType?> type,
  Value<bool> paid,
  Value<bool?> createdAnotherFutureTransaction,
  Value<bool> skipPaid,
  Value<MethodAdded?> methodAdded,
  Value<String?> transactionOwnerEmail,
  Value<String?> transactionOriginalOwnerEmail,
  Value<String?> sharedKey,
  Value<String?> sharedOldKey,
  Value<SharedStatus?> sharedStatus,
  Value<DateTime?> sharedDateUpdated,
  Value<String?> sharedReferenceBudgetPk,
  Value<String?> objectiveFk,
  Value<String?> objectiveLoanFk,
  Value<List<String>?> budgetFksExclude,
  Value<int> rowid,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<String> transactionPk,
  Value<String?> pairedTransactionFk,
  Value<String> name,
  Value<double> amount,
  Value<String> note,
  Value<String> categoryFk,
  Value<String?> subCategoryFk,
  Value<String> walletFk,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  Value<DateTime?> originalDateDue,
  Value<bool> income,
  Value<int?> periodLength,
  Value<BudgetReoccurence?> reoccurrence,
  Value<DateTime?> endDate,
  Value<bool?> upcomingTransactionNotification,
  Value<TransactionSpecialType?> type,
  Value<bool> paid,
  Value<bool?> createdAnotherFutureTransaction,
  Value<bool> skipPaid,
  Value<MethodAdded?> methodAdded,
  Value<String?> transactionOwnerEmail,
  Value<String?> transactionOriginalOwnerEmail,
  Value<String?> sharedKey,
  Value<String?> sharedOldKey,
  Value<SharedStatus?> sharedStatus,
  Value<DateTime?> sharedDateUpdated,
  Value<String?> sharedReferenceBudgetPk,
  Value<String?> objectiveFk,
  Value<String?> objectiveLoanFk,
  Value<List<String>?> budgetFksExclude,
  Value<int> rowid,
});

final class $$TransactionsTableReferences
    extends BaseReferences<_$FinanceDatabase, $TransactionsTable, Transaction> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TransactionsTable _pairedTransactionFkTable(_$FinanceDatabase db) =>
      db.transactions.createAlias($_aliasNameGenerator(
          db.transactions.pairedTransactionFk, db.transactions.transactionPk));

  $$TransactionsTableProcessedTableManager? get pairedTransactionFk {
    final $_column = $_itemColumn<String>('paired_transaction_fk');
    if ($_column == null) return null;
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.transactionPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pairedTransactionFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CategoriesTable _categoryFkTable(_$FinanceDatabase db) =>
      db.categories.createAlias($_aliasNameGenerator(
          db.transactions.categoryFk, db.categories.categoryPk));

  $$CategoriesTableProcessedTableManager get categoryFk {
    final $_column = $_itemColumn<String>('category_fk')!;

    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.categoryPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CategoriesTable _subCategoryFkTable(_$FinanceDatabase db) =>
      db.categories.createAlias($_aliasNameGenerator(
          db.transactions.subCategoryFk, db.categories.categoryPk));

  $$CategoriesTableProcessedTableManager? get subCategoryFk {
    final $_column = $_itemColumn<String>('sub_category_fk');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.categoryPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subCategoryFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $WalletsTable _walletFkTable(_$FinanceDatabase db) =>
      db.wallets.createAlias(
          $_aliasNameGenerator(db.transactions.walletFk, db.wallets.walletPk));

  $$WalletsTableProcessedTableManager get walletFk {
    final $_column = $_itemColumn<String>('wallet_fk')!;

    final manager = $$WalletsTableTableManager($_db, $_db.wallets)
        .filter((f) => f.walletPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_walletFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ObjectivesTable _objectiveFkTable(_$FinanceDatabase db) =>
      db.objectives.createAlias($_aliasNameGenerator(
          db.transactions.objectiveFk, db.objectives.objectivePk));

  $$ObjectivesTableProcessedTableManager? get objectiveFk {
    final $_column = $_itemColumn<String>('objective_fk');
    if ($_column == null) return null;
    final manager = $$ObjectivesTableTableManager($_db, $_db.objectives)
        .filter((f) => f.objectivePk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_objectiveFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ObjectivesTable _objectiveLoanFkTable(_$FinanceDatabase db) =>
      db.objectives.createAlias($_aliasNameGenerator(
          db.transactions.objectiveLoanFk, db.objectives.objectivePk));

  $$ObjectivesTableProcessedTableManager? get objectiveLoanFk {
    final $_column = $_itemColumn<String>('objective_loan_fk');
    if ($_column == null) return null;
    final manager = $$ObjectivesTableTableManager($_db, $_db.objectives)
        .filter((f) => f.objectivePk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_objectiveLoanFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TransactionsTableFilterComposer
    extends Composer<_$FinanceDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get transactionPk => $composableBuilder(
      column: $table.transactionPk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get originalDateDue => $composableBuilder(
      column: $table.originalDateDue,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get income => $composableBuilder(
      column: $table.income, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get periodLength => $composableBuilder(
      column: $table.periodLength, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<BudgetReoccurence?, BudgetReoccurence, int>
      get reoccurrence => $composableBuilder(
          column: $table.reoccurrence,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get upcomingTransactionNotification => $composableBuilder(
      column: $table.upcomingTransactionNotification,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<TransactionSpecialType?,
          TransactionSpecialType, int>
      get type => $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get paid => $composableBuilder(
      column: $table.paid, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get createdAnotherFutureTransaction => $composableBuilder(
      column: $table.createdAnotherFutureTransaction,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get skipPaid => $composableBuilder(
      column: $table.skipPaid, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<MethodAdded?, MethodAdded, int>
      get methodAdded => $composableBuilder(
          column: $table.methodAdded,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get transactionOwnerEmail => $composableBuilder(
      column: $table.transactionOwnerEmail,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transactionOriginalOwnerEmail => $composableBuilder(
      column: $table.transactionOriginalOwnerEmail,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sharedKey => $composableBuilder(
      column: $table.sharedKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sharedOldKey => $composableBuilder(
      column: $table.sharedOldKey, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<SharedStatus?, SharedStatus, int>
      get sharedStatus => $composableBuilder(
          column: $table.sharedStatus,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get sharedDateUpdated => $composableBuilder(
      column: $table.sharedDateUpdated,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sharedReferenceBudgetPk => $composableBuilder(
      column: $table.sharedReferenceBudgetPk,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get budgetFksExclude => $composableBuilder(
          column: $table.budgetFksExclude,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  $$TransactionsTableFilterComposer get pairedTransactionFk {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pairedTransactionFk,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.transactionPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryFk {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableFilterComposer get subCategoryFk {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.subCategoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WalletsTableFilterComposer get walletFk {
    final $$WalletsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletFk,
        referencedTable: $db.wallets,
        getReferencedColumn: (t) => t.walletPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WalletsTableFilterComposer(
              $db: $db,
              $table: $db.wallets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ObjectivesTableFilterComposer get objectiveFk {
    final $$ObjectivesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.objectiveFk,
        referencedTable: $db.objectives,
        getReferencedColumn: (t) => t.objectivePk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObjectivesTableFilterComposer(
              $db: $db,
              $table: $db.objectives,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ObjectivesTableFilterComposer get objectiveLoanFk {
    final $$ObjectivesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.objectiveLoanFk,
        referencedTable: $db.objectives,
        getReferencedColumn: (t) => t.objectivePk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObjectivesTableFilterComposer(
              $db: $db,
              $table: $db.objectives,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$FinanceDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get transactionPk => $composableBuilder(
      column: $table.transactionPk,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get originalDateDue => $composableBuilder(
      column: $table.originalDateDue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get income => $composableBuilder(
      column: $table.income, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get periodLength => $composableBuilder(
      column: $table.periodLength,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reoccurrence => $composableBuilder(
      column: $table.reoccurrence,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get upcomingTransactionNotification =>
      $composableBuilder(
          column: $table.upcomingTransactionNotification,
          builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get paid => $composableBuilder(
      column: $table.paid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get createdAnotherFutureTransaction =>
      $composableBuilder(
          column: $table.createdAnotherFutureTransaction,
          builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get skipPaid => $composableBuilder(
      column: $table.skipPaid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get methodAdded => $composableBuilder(
      column: $table.methodAdded, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transactionOwnerEmail => $composableBuilder(
      column: $table.transactionOwnerEmail,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transactionOriginalOwnerEmail =>
      $composableBuilder(
          column: $table.transactionOriginalOwnerEmail,
          builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sharedKey => $composableBuilder(
      column: $table.sharedKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sharedOldKey => $composableBuilder(
      column: $table.sharedOldKey,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sharedStatus => $composableBuilder(
      column: $table.sharedStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get sharedDateUpdated => $composableBuilder(
      column: $table.sharedDateUpdated,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sharedReferenceBudgetPk => $composableBuilder(
      column: $table.sharedReferenceBudgetPk,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get budgetFksExclude => $composableBuilder(
      column: $table.budgetFksExclude,
      builder: (column) => ColumnOrderings(column));

  $$TransactionsTableOrderingComposer get pairedTransactionFk {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pairedTransactionFk,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.transactionPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableOrderingComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryFk {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableOrderingComposer get subCategoryFk {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.subCategoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WalletsTableOrderingComposer get walletFk {
    final $$WalletsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletFk,
        referencedTable: $db.wallets,
        getReferencedColumn: (t) => t.walletPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WalletsTableOrderingComposer(
              $db: $db,
              $table: $db.wallets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ObjectivesTableOrderingComposer get objectiveFk {
    final $$ObjectivesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.objectiveFk,
        referencedTable: $db.objectives,
        getReferencedColumn: (t) => t.objectivePk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObjectivesTableOrderingComposer(
              $db: $db,
              $table: $db.objectives,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ObjectivesTableOrderingComposer get objectiveLoanFk {
    final $$ObjectivesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.objectiveLoanFk,
        referencedTable: $db.objectives,
        getReferencedColumn: (t) => t.objectivePk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObjectivesTableOrderingComposer(
              $db: $db,
              $table: $db.objectives,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get transactionPk => $composableBuilder(
      column: $table.transactionPk, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified, builder: (column) => column);

  GeneratedColumn<DateTime> get originalDateDue => $composableBuilder(
      column: $table.originalDateDue, builder: (column) => column);

  GeneratedColumn<bool> get income =>
      $composableBuilder(column: $table.income, builder: (column) => column);

  GeneratedColumn<int> get periodLength => $composableBuilder(
      column: $table.periodLength, builder: (column) => column);

  GeneratedColumnWithTypeConverter<BudgetReoccurence?, int> get reoccurrence =>
      $composableBuilder(
          column: $table.reoccurrence, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get upcomingTransactionNotification =>
      $composableBuilder(
          column: $table.upcomingTransactionNotification,
          builder: (column) => column);

  GeneratedColumnWithTypeConverter<TransactionSpecialType?, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get paid =>
      $composableBuilder(column: $table.paid, builder: (column) => column);

  GeneratedColumn<bool> get createdAnotherFutureTransaction =>
      $composableBuilder(
          column: $table.createdAnotherFutureTransaction,
          builder: (column) => column);

  GeneratedColumn<bool> get skipPaid =>
      $composableBuilder(column: $table.skipPaid, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MethodAdded?, int> get methodAdded =>
      $composableBuilder(
          column: $table.methodAdded, builder: (column) => column);

  GeneratedColumn<String> get transactionOwnerEmail => $composableBuilder(
      column: $table.transactionOwnerEmail, builder: (column) => column);

  GeneratedColumn<String> get transactionOriginalOwnerEmail =>
      $composableBuilder(
          column: $table.transactionOriginalOwnerEmail,
          builder: (column) => column);

  GeneratedColumn<String> get sharedKey =>
      $composableBuilder(column: $table.sharedKey, builder: (column) => column);

  GeneratedColumn<String> get sharedOldKey => $composableBuilder(
      column: $table.sharedOldKey, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SharedStatus?, int> get sharedStatus =>
      $composableBuilder(
          column: $table.sharedStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get sharedDateUpdated => $composableBuilder(
      column: $table.sharedDateUpdated, builder: (column) => column);

  GeneratedColumn<String> get sharedReferenceBudgetPk => $composableBuilder(
      column: $table.sharedReferenceBudgetPk, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String>
      get budgetFksExclude => $composableBuilder(
          column: $table.budgetFksExclude, builder: (column) => column);

  $$TransactionsTableAnnotationComposer get pairedTransactionFk {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pairedTransactionFk,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.transactionPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categoryFk {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableAnnotationComposer get subCategoryFk {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.subCategoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WalletsTableAnnotationComposer get walletFk {
    final $$WalletsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletFk,
        referencedTable: $db.wallets,
        getReferencedColumn: (t) => t.walletPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WalletsTableAnnotationComposer(
              $db: $db,
              $table: $db.wallets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ObjectivesTableAnnotationComposer get objectiveFk {
    final $$ObjectivesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.objectiveFk,
        referencedTable: $db.objectives,
        getReferencedColumn: (t) => t.objectivePk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObjectivesTableAnnotationComposer(
              $db: $db,
              $table: $db.objectives,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ObjectivesTableAnnotationComposer get objectiveLoanFk {
    final $$ObjectivesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.objectiveLoanFk,
        referencedTable: $db.objectives,
        getReferencedColumn: (t) => t.objectivePk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ObjectivesTableAnnotationComposer(
              $db: $db,
              $table: $db.objectives,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionsTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (Transaction, $$TransactionsTableReferences),
    Transaction,
    PrefetchHooks Function(
        {bool pairedTransactionFk,
        bool categoryFk,
        bool subCategoryFk,
        bool walletFk,
        bool objectiveFk,
        bool objectiveLoanFk})> {
  $$TransactionsTableTableManager(
      _$FinanceDatabase db, $TransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> transactionPk = const Value.absent(),
            Value<String?> pairedTransactionFk = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> note = const Value.absent(),
            Value<String> categoryFk = const Value.absent(),
            Value<String?> subCategoryFk = const Value.absent(),
            Value<String> walletFk = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<DateTime?> originalDateDue = const Value.absent(),
            Value<bool> income = const Value.absent(),
            Value<int?> periodLength = const Value.absent(),
            Value<BudgetReoccurence?> reoccurrence = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<bool?> upcomingTransactionNotification = const Value.absent(),
            Value<TransactionSpecialType?> type = const Value.absent(),
            Value<bool> paid = const Value.absent(),
            Value<bool?> createdAnotherFutureTransaction = const Value.absent(),
            Value<bool> skipPaid = const Value.absent(),
            Value<MethodAdded?> methodAdded = const Value.absent(),
            Value<String?> transactionOwnerEmail = const Value.absent(),
            Value<String?> transactionOriginalOwnerEmail = const Value.absent(),
            Value<String?> sharedKey = const Value.absent(),
            Value<String?> sharedOldKey = const Value.absent(),
            Value<SharedStatus?> sharedStatus = const Value.absent(),
            Value<DateTime?> sharedDateUpdated = const Value.absent(),
            Value<String?> sharedReferenceBudgetPk = const Value.absent(),
            Value<String?> objectiveFk = const Value.absent(),
            Value<String?> objectiveLoanFk = const Value.absent(),
            Value<List<String>?> budgetFksExclude = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionsCompanion(
            transactionPk: transactionPk,
            pairedTransactionFk: pairedTransactionFk,
            name: name,
            amount: amount,
            note: note,
            categoryFk: categoryFk,
            subCategoryFk: subCategoryFk,
            walletFk: walletFk,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            originalDateDue: originalDateDue,
            income: income,
            periodLength: periodLength,
            reoccurrence: reoccurrence,
            endDate: endDate,
            upcomingTransactionNotification: upcomingTransactionNotification,
            type: type,
            paid: paid,
            createdAnotherFutureTransaction: createdAnotherFutureTransaction,
            skipPaid: skipPaid,
            methodAdded: methodAdded,
            transactionOwnerEmail: transactionOwnerEmail,
            transactionOriginalOwnerEmail: transactionOriginalOwnerEmail,
            sharedKey: sharedKey,
            sharedOldKey: sharedOldKey,
            sharedStatus: sharedStatus,
            sharedDateUpdated: sharedDateUpdated,
            sharedReferenceBudgetPk: sharedReferenceBudgetPk,
            objectiveFk: objectiveFk,
            objectiveLoanFk: objectiveLoanFk,
            budgetFksExclude: budgetFksExclude,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> transactionPk = const Value.absent(),
            Value<String?> pairedTransactionFk = const Value.absent(),
            required String name,
            required double amount,
            required String note,
            required String categoryFk,
            Value<String?> subCategoryFk = const Value.absent(),
            Value<String> walletFk = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<DateTime?> originalDateDue = const Value.absent(),
            Value<bool> income = const Value.absent(),
            Value<int?> periodLength = const Value.absent(),
            Value<BudgetReoccurence?> reoccurrence = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<bool?> upcomingTransactionNotification = const Value.absent(),
            Value<TransactionSpecialType?> type = const Value.absent(),
            Value<bool> paid = const Value.absent(),
            Value<bool?> createdAnotherFutureTransaction = const Value.absent(),
            Value<bool> skipPaid = const Value.absent(),
            Value<MethodAdded?> methodAdded = const Value.absent(),
            Value<String?> transactionOwnerEmail = const Value.absent(),
            Value<String?> transactionOriginalOwnerEmail = const Value.absent(),
            Value<String?> sharedKey = const Value.absent(),
            Value<String?> sharedOldKey = const Value.absent(),
            Value<SharedStatus?> sharedStatus = const Value.absent(),
            Value<DateTime?> sharedDateUpdated = const Value.absent(),
            Value<String?> sharedReferenceBudgetPk = const Value.absent(),
            Value<String?> objectiveFk = const Value.absent(),
            Value<String?> objectiveLoanFk = const Value.absent(),
            Value<List<String>?> budgetFksExclude = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionsCompanion.insert(
            transactionPk: transactionPk,
            pairedTransactionFk: pairedTransactionFk,
            name: name,
            amount: amount,
            note: note,
            categoryFk: categoryFk,
            subCategoryFk: subCategoryFk,
            walletFk: walletFk,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            originalDateDue: originalDateDue,
            income: income,
            periodLength: periodLength,
            reoccurrence: reoccurrence,
            endDate: endDate,
            upcomingTransactionNotification: upcomingTransactionNotification,
            type: type,
            paid: paid,
            createdAnotherFutureTransaction: createdAnotherFutureTransaction,
            skipPaid: skipPaid,
            methodAdded: methodAdded,
            transactionOwnerEmail: transactionOwnerEmail,
            transactionOriginalOwnerEmail: transactionOriginalOwnerEmail,
            sharedKey: sharedKey,
            sharedOldKey: sharedOldKey,
            sharedStatus: sharedStatus,
            sharedDateUpdated: sharedDateUpdated,
            sharedReferenceBudgetPk: sharedReferenceBudgetPk,
            objectiveFk: objectiveFk,
            objectiveLoanFk: objectiveLoanFk,
            budgetFksExclude: budgetFksExclude,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TransactionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {pairedTransactionFk = false,
              categoryFk = false,
              subCategoryFk = false,
              walletFk = false,
              objectiveFk = false,
              objectiveLoanFk = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (pairedTransactionFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.pairedTransactionFk,
                    referencedTable: $$TransactionsTableReferences
                        ._pairedTransactionFkTable(db),
                    referencedColumn: $$TransactionsTableReferences
                        ._pairedTransactionFkTable(db)
                        .transactionPk,
                  ) as T;
                }
                if (categoryFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryFk,
                    referencedTable:
                        $$TransactionsTableReferences._categoryFkTable(db),
                    referencedColumn: $$TransactionsTableReferences
                        ._categoryFkTable(db)
                        .categoryPk,
                  ) as T;
                }
                if (subCategoryFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.subCategoryFk,
                    referencedTable:
                        $$TransactionsTableReferences._subCategoryFkTable(db),
                    referencedColumn: $$TransactionsTableReferences
                        ._subCategoryFkTable(db)
                        .categoryPk,
                  ) as T;
                }
                if (walletFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.walletFk,
                    referencedTable:
                        $$TransactionsTableReferences._walletFkTable(db),
                    referencedColumn: $$TransactionsTableReferences
                        ._walletFkTable(db)
                        .walletPk,
                  ) as T;
                }
                if (objectiveFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.objectiveFk,
                    referencedTable:
                        $$TransactionsTableReferences._objectiveFkTable(db),
                    referencedColumn: $$TransactionsTableReferences
                        ._objectiveFkTable(db)
                        .objectivePk,
                  ) as T;
                }
                if (objectiveLoanFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.objectiveLoanFk,
                    referencedTable:
                        $$TransactionsTableReferences._objectiveLoanFkTable(db),
                    referencedColumn: $$TransactionsTableReferences
                        ._objectiveLoanFkTable(db)
                        .objectivePk,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TransactionsTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (Transaction, $$TransactionsTableReferences),
    Transaction,
    PrefetchHooks Function(
        {bool pairedTransactionFk,
        bool categoryFk,
        bool subCategoryFk,
        bool walletFk,
        bool objectiveFk,
        bool objectiveLoanFk})>;
typedef $$BudgetsTableCreateCompanionBuilder = BudgetsCompanion Function({
  Value<String> budgetPk,
  required String name,
  required double amount,
  Value<String?> colour,
  required DateTime startDate,
  required DateTime endDate,
  Value<List<String>?> walletFks,
  Value<List<String>?> categoryFks,
  Value<List<String>?> categoryFksExclude,
  Value<bool> income,
  Value<bool> archived,
  Value<bool> addedTransactionsOnly,
  required int periodLength,
  Value<BudgetReoccurence?> reoccurrence,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  Value<bool> pinned,
  required int order,
  Value<String> walletFk,
  Value<List<BudgetTransactionFilters>?> budgetTransactionFilters,
  Value<List<String>?> memberTransactionFilters,
  Value<String?> sharedKey,
  Value<SharedOwnerMember?> sharedOwnerMember,
  Value<DateTime?> sharedDateUpdated,
  Value<List<String>?> sharedMembers,
  Value<List<String>?> sharedAllMembersEver,
  Value<bool> isAbsoluteSpendingLimit,
  Value<int> rowid,
});
typedef $$BudgetsTableUpdateCompanionBuilder = BudgetsCompanion Function({
  Value<String> budgetPk,
  Value<String> name,
  Value<double> amount,
  Value<String?> colour,
  Value<DateTime> startDate,
  Value<DateTime> endDate,
  Value<List<String>?> walletFks,
  Value<List<String>?> categoryFks,
  Value<List<String>?> categoryFksExclude,
  Value<bool> income,
  Value<bool> archived,
  Value<bool> addedTransactionsOnly,
  Value<int> periodLength,
  Value<BudgetReoccurence?> reoccurrence,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  Value<bool> pinned,
  Value<int> order,
  Value<String> walletFk,
  Value<List<BudgetTransactionFilters>?> budgetTransactionFilters,
  Value<List<String>?> memberTransactionFilters,
  Value<String?> sharedKey,
  Value<SharedOwnerMember?> sharedOwnerMember,
  Value<DateTime?> sharedDateUpdated,
  Value<List<String>?> sharedMembers,
  Value<List<String>?> sharedAllMembersEver,
  Value<bool> isAbsoluteSpendingLimit,
  Value<int> rowid,
});

final class $$BudgetsTableReferences
    extends BaseReferences<_$FinanceDatabase, $BudgetsTable, Budget> {
  $$BudgetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WalletsTable _walletFkTable(_$FinanceDatabase db) =>
      db.wallets.createAlias(
          $_aliasNameGenerator(db.budgets.walletFk, db.wallets.walletPk));

  $$WalletsTableProcessedTableManager get walletFk {
    final $_column = $_itemColumn<String>('wallet_fk')!;

    final manager = $$WalletsTableTableManager($_db, $_db.wallets)
        .filter((f) => f.walletPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_walletFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$CategoryBudgetLimitsTable,
      List<CategoryBudgetLimit>> _categoryBudgetLimitsRefsTable(
          _$FinanceDatabase db) =>
      MultiTypedResultKey.fromTable(db.categoryBudgetLimits,
          aliasName: $_aliasNameGenerator(
              db.budgets.budgetPk, db.categoryBudgetLimits.budgetFk));

  $$CategoryBudgetLimitsTableProcessedTableManager
      get categoryBudgetLimitsRefs {
    final manager = $$CategoryBudgetLimitsTableTableManager(
            $_db, $_db.categoryBudgetLimits)
        .filter((f) =>
            f.budgetFk.budgetPk.sqlEquals($_itemColumn<String>('budget_pk')!));

    final cache =
        $_typedResult.readTableOrNull(_categoryBudgetLimitsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$BudgetsTableFilterComposer
    extends Composer<_$FinanceDatabase, $BudgetsTable> {
  $$BudgetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get budgetPk => $composableBuilder(
      column: $table.budgetPk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colour => $composableBuilder(
      column: $table.colour, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get walletFks => $composableBuilder(
          column: $table.walletFks,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get categoryFks => $composableBuilder(
          column: $table.categoryFks,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get categoryFksExclude => $composableBuilder(
          column: $table.categoryFksExclude,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get income => $composableBuilder(
      column: $table.income, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get addedTransactionsOnly => $composableBuilder(
      column: $table.addedTransactionsOnly,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get periodLength => $composableBuilder(
      column: $table.periodLength, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<BudgetReoccurence?, BudgetReoccurence, int>
      get reoccurrence => $composableBuilder(
          column: $table.reoccurrence,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get pinned => $composableBuilder(
      column: $table.pinned, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<BudgetTransactionFilters>?,
          List<BudgetTransactionFilters>, String>
      get budgetTransactionFilters => $composableBuilder(
          column: $table.budgetTransactionFilters,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get memberTransactionFilters => $composableBuilder(
          column: $table.memberTransactionFilters,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get sharedKey => $composableBuilder(
      column: $table.sharedKey, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<SharedOwnerMember?, SharedOwnerMember, int>
      get sharedOwnerMember => $composableBuilder(
          column: $table.sharedOwnerMember,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get sharedDateUpdated => $composableBuilder(
      column: $table.sharedDateUpdated,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get sharedMembers => $composableBuilder(
          column: $table.sharedMembers,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get sharedAllMembersEver => $composableBuilder(
          column: $table.sharedAllMembersEver,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get isAbsoluteSpendingLimit => $composableBuilder(
      column: $table.isAbsoluteSpendingLimit,
      builder: (column) => ColumnFilters(column));

  $$WalletsTableFilterComposer get walletFk {
    final $$WalletsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletFk,
        referencedTable: $db.wallets,
        getReferencedColumn: (t) => t.walletPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WalletsTableFilterComposer(
              $db: $db,
              $table: $db.wallets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> categoryBudgetLimitsRefs(
      Expression<bool> Function($$CategoryBudgetLimitsTableFilterComposer f)
          f) {
    final $$CategoryBudgetLimitsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.budgetPk,
        referencedTable: $db.categoryBudgetLimits,
        getReferencedColumn: (t) => t.budgetFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryBudgetLimitsTableFilterComposer(
              $db: $db,
              $table: $db.categoryBudgetLimits,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$BudgetsTableOrderingComposer
    extends Composer<_$FinanceDatabase, $BudgetsTable> {
  $$BudgetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get budgetPk => $composableBuilder(
      column: $table.budgetPk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colour => $composableBuilder(
      column: $table.colour, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get walletFks => $composableBuilder(
      column: $table.walletFks, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryFks => $composableBuilder(
      column: $table.categoryFks, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryFksExclude => $composableBuilder(
      column: $table.categoryFksExclude,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get income => $composableBuilder(
      column: $table.income, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get addedTransactionsOnly => $composableBuilder(
      column: $table.addedTransactionsOnly,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get periodLength => $composableBuilder(
      column: $table.periodLength,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reoccurrence => $composableBuilder(
      column: $table.reoccurrence,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get pinned => $composableBuilder(
      column: $table.pinned, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get budgetTransactionFilters => $composableBuilder(
      column: $table.budgetTransactionFilters,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memberTransactionFilters => $composableBuilder(
      column: $table.memberTransactionFilters,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sharedKey => $composableBuilder(
      column: $table.sharedKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sharedOwnerMember => $composableBuilder(
      column: $table.sharedOwnerMember,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get sharedDateUpdated => $composableBuilder(
      column: $table.sharedDateUpdated,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sharedMembers => $composableBuilder(
      column: $table.sharedMembers,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sharedAllMembersEver => $composableBuilder(
      column: $table.sharedAllMembersEver,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isAbsoluteSpendingLimit => $composableBuilder(
      column: $table.isAbsoluteSpendingLimit,
      builder: (column) => ColumnOrderings(column));

  $$WalletsTableOrderingComposer get walletFk {
    final $$WalletsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletFk,
        referencedTable: $db.wallets,
        getReferencedColumn: (t) => t.walletPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WalletsTableOrderingComposer(
              $db: $db,
              $table: $db.wallets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BudgetsTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $BudgetsTable> {
  $$BudgetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get budgetPk =>
      $composableBuilder(column: $table.budgetPk, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get colour =>
      $composableBuilder(column: $table.colour, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get walletFks =>
      $composableBuilder(column: $table.walletFks, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get categoryFks =>
      $composableBuilder(
          column: $table.categoryFks, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String>
      get categoryFksExclude => $composableBuilder(
          column: $table.categoryFksExclude, builder: (column) => column);

  GeneratedColumn<bool> get income =>
      $composableBuilder(column: $table.income, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  GeneratedColumn<bool> get addedTransactionsOnly => $composableBuilder(
      column: $table.addedTransactionsOnly, builder: (column) => column);

  GeneratedColumn<int> get periodLength => $composableBuilder(
      column: $table.periodLength, builder: (column) => column);

  GeneratedColumnWithTypeConverter<BudgetReoccurence?, int> get reoccurrence =>
      $composableBuilder(
          column: $table.reoccurrence, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified, builder: (column) => column);

  GeneratedColumn<bool> get pinned =>
      $composableBuilder(column: $table.pinned, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<BudgetTransactionFilters>?, String>
      get budgetTransactionFilters => $composableBuilder(
          column: $table.budgetTransactionFilters, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String>
      get memberTransactionFilters => $composableBuilder(
          column: $table.memberTransactionFilters, builder: (column) => column);

  GeneratedColumn<String> get sharedKey =>
      $composableBuilder(column: $table.sharedKey, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SharedOwnerMember?, int>
      get sharedOwnerMember => $composableBuilder(
          column: $table.sharedOwnerMember, builder: (column) => column);

  GeneratedColumn<DateTime> get sharedDateUpdated => $composableBuilder(
      column: $table.sharedDateUpdated, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get sharedMembers =>
      $composableBuilder(
          column: $table.sharedMembers, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String>
      get sharedAllMembersEver => $composableBuilder(
          column: $table.sharedAllMembersEver, builder: (column) => column);

  GeneratedColumn<bool> get isAbsoluteSpendingLimit => $composableBuilder(
      column: $table.isAbsoluteSpendingLimit, builder: (column) => column);

  $$WalletsTableAnnotationComposer get walletFk {
    final $$WalletsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletFk,
        referencedTable: $db.wallets,
        getReferencedColumn: (t) => t.walletPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WalletsTableAnnotationComposer(
              $db: $db,
              $table: $db.wallets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> categoryBudgetLimitsRefs<T extends Object>(
      Expression<T> Function($$CategoryBudgetLimitsTableAnnotationComposer a)
          f) {
    final $$CategoryBudgetLimitsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.budgetPk,
            referencedTable: $db.categoryBudgetLimits,
            getReferencedColumn: (t) => t.budgetFk,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CategoryBudgetLimitsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.categoryBudgetLimits,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$BudgetsTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $BudgetsTable,
    Budget,
    $$BudgetsTableFilterComposer,
    $$BudgetsTableOrderingComposer,
    $$BudgetsTableAnnotationComposer,
    $$BudgetsTableCreateCompanionBuilder,
    $$BudgetsTableUpdateCompanionBuilder,
    (Budget, $$BudgetsTableReferences),
    Budget,
    PrefetchHooks Function({bool walletFk, bool categoryBudgetLimitsRefs})> {
  $$BudgetsTableTableManager(_$FinanceDatabase db, $BudgetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BudgetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BudgetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BudgetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> budgetPk = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String?> colour = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime> endDate = const Value.absent(),
            Value<List<String>?> walletFks = const Value.absent(),
            Value<List<String>?> categoryFks = const Value.absent(),
            Value<List<String>?> categoryFksExclude = const Value.absent(),
            Value<bool> income = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            Value<bool> addedTransactionsOnly = const Value.absent(),
            Value<int> periodLength = const Value.absent(),
            Value<BudgetReoccurence?> reoccurrence = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<bool> pinned = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<String> walletFk = const Value.absent(),
            Value<List<BudgetTransactionFilters>?> budgetTransactionFilters =
                const Value.absent(),
            Value<List<String>?> memberTransactionFilters =
                const Value.absent(),
            Value<String?> sharedKey = const Value.absent(),
            Value<SharedOwnerMember?> sharedOwnerMember = const Value.absent(),
            Value<DateTime?> sharedDateUpdated = const Value.absent(),
            Value<List<String>?> sharedMembers = const Value.absent(),
            Value<List<String>?> sharedAllMembersEver = const Value.absent(),
            Value<bool> isAbsoluteSpendingLimit = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BudgetsCompanion(
            budgetPk: budgetPk,
            name: name,
            amount: amount,
            colour: colour,
            startDate: startDate,
            endDate: endDate,
            walletFks: walletFks,
            categoryFks: categoryFks,
            categoryFksExclude: categoryFksExclude,
            income: income,
            archived: archived,
            addedTransactionsOnly: addedTransactionsOnly,
            periodLength: periodLength,
            reoccurrence: reoccurrence,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            pinned: pinned,
            order: order,
            walletFk: walletFk,
            budgetTransactionFilters: budgetTransactionFilters,
            memberTransactionFilters: memberTransactionFilters,
            sharedKey: sharedKey,
            sharedOwnerMember: sharedOwnerMember,
            sharedDateUpdated: sharedDateUpdated,
            sharedMembers: sharedMembers,
            sharedAllMembersEver: sharedAllMembersEver,
            isAbsoluteSpendingLimit: isAbsoluteSpendingLimit,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> budgetPk = const Value.absent(),
            required String name,
            required double amount,
            Value<String?> colour = const Value.absent(),
            required DateTime startDate,
            required DateTime endDate,
            Value<List<String>?> walletFks = const Value.absent(),
            Value<List<String>?> categoryFks = const Value.absent(),
            Value<List<String>?> categoryFksExclude = const Value.absent(),
            Value<bool> income = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            Value<bool> addedTransactionsOnly = const Value.absent(),
            required int periodLength,
            Value<BudgetReoccurence?> reoccurrence = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<bool> pinned = const Value.absent(),
            required int order,
            Value<String> walletFk = const Value.absent(),
            Value<List<BudgetTransactionFilters>?> budgetTransactionFilters =
                const Value.absent(),
            Value<List<String>?> memberTransactionFilters =
                const Value.absent(),
            Value<String?> sharedKey = const Value.absent(),
            Value<SharedOwnerMember?> sharedOwnerMember = const Value.absent(),
            Value<DateTime?> sharedDateUpdated = const Value.absent(),
            Value<List<String>?> sharedMembers = const Value.absent(),
            Value<List<String>?> sharedAllMembersEver = const Value.absent(),
            Value<bool> isAbsoluteSpendingLimit = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BudgetsCompanion.insert(
            budgetPk: budgetPk,
            name: name,
            amount: amount,
            colour: colour,
            startDate: startDate,
            endDate: endDate,
            walletFks: walletFks,
            categoryFks: categoryFks,
            categoryFksExclude: categoryFksExclude,
            income: income,
            archived: archived,
            addedTransactionsOnly: addedTransactionsOnly,
            periodLength: periodLength,
            reoccurrence: reoccurrence,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            pinned: pinned,
            order: order,
            walletFk: walletFk,
            budgetTransactionFilters: budgetTransactionFilters,
            memberTransactionFilters: memberTransactionFilters,
            sharedKey: sharedKey,
            sharedOwnerMember: sharedOwnerMember,
            sharedDateUpdated: sharedDateUpdated,
            sharedMembers: sharedMembers,
            sharedAllMembersEver: sharedAllMembersEver,
            isAbsoluteSpendingLimit: isAbsoluteSpendingLimit,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$BudgetsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {walletFk = false, categoryBudgetLimitsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (categoryBudgetLimitsRefs) db.categoryBudgetLimits
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (walletFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.walletFk,
                    referencedTable:
                        $$BudgetsTableReferences._walletFkTable(db),
                    referencedColumn:
                        $$BudgetsTableReferences._walletFkTable(db).walletPk,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (categoryBudgetLimitsRefs)
                    await $_getPrefetchedData<Budget, $BudgetsTable,
                            CategoryBudgetLimit>(
                        currentTable: table,
                        referencedTable: $$BudgetsTableReferences
                            ._categoryBudgetLimitsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BudgetsTableReferences(db, table, p0)
                                .categoryBudgetLimitsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.budgetFk == item.budgetPk),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$BudgetsTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $BudgetsTable,
    Budget,
    $$BudgetsTableFilterComposer,
    $$BudgetsTableOrderingComposer,
    $$BudgetsTableAnnotationComposer,
    $$BudgetsTableCreateCompanionBuilder,
    $$BudgetsTableUpdateCompanionBuilder,
    (Budget, $$BudgetsTableReferences),
    Budget,
    PrefetchHooks Function({bool walletFk, bool categoryBudgetLimitsRefs})>;
typedef $$CategoryBudgetLimitsTableCreateCompanionBuilder
    = CategoryBudgetLimitsCompanion Function({
  Value<String> categoryLimitPk,
  required String categoryFk,
  required String budgetFk,
  required double amount,
  Value<DateTime?> dateTimeModified,
  Value<String> walletFk,
  Value<int> rowid,
});
typedef $$CategoryBudgetLimitsTableUpdateCompanionBuilder
    = CategoryBudgetLimitsCompanion Function({
  Value<String> categoryLimitPk,
  Value<String> categoryFk,
  Value<String> budgetFk,
  Value<double> amount,
  Value<DateTime?> dateTimeModified,
  Value<String> walletFk,
  Value<int> rowid,
});

final class $$CategoryBudgetLimitsTableReferences extends BaseReferences<
    _$FinanceDatabase, $CategoryBudgetLimitsTable, CategoryBudgetLimit> {
  $$CategoryBudgetLimitsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryFkTable(_$FinanceDatabase db) =>
      db.categories.createAlias($_aliasNameGenerator(
          db.categoryBudgetLimits.categoryFk, db.categories.categoryPk));

  $$CategoriesTableProcessedTableManager get categoryFk {
    final $_column = $_itemColumn<String>('category_fk')!;

    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.categoryPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $BudgetsTable _budgetFkTable(_$FinanceDatabase db) =>
      db.budgets.createAlias($_aliasNameGenerator(
          db.categoryBudgetLimits.budgetFk, db.budgets.budgetPk));

  $$BudgetsTableProcessedTableManager get budgetFk {
    final $_column = $_itemColumn<String>('budget_fk')!;

    final manager = $$BudgetsTableTableManager($_db, $_db.budgets)
        .filter((f) => f.budgetPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_budgetFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $WalletsTable _walletFkTable(_$FinanceDatabase db) =>
      db.wallets.createAlias($_aliasNameGenerator(
          db.categoryBudgetLimits.walletFk, db.wallets.walletPk));

  $$WalletsTableProcessedTableManager get walletFk {
    final $_column = $_itemColumn<String>('wallet_fk')!;

    final manager = $$WalletsTableTableManager($_db, $_db.wallets)
        .filter((f) => f.walletPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_walletFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CategoryBudgetLimitsTableFilterComposer
    extends Composer<_$FinanceDatabase, $CategoryBudgetLimitsTable> {
  $$CategoryBudgetLimitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get categoryLimitPk => $composableBuilder(
      column: $table.categoryLimitPk,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnFilters(column));

  $$CategoriesTableFilterComposer get categoryFk {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$BudgetsTableFilterComposer get budgetFk {
    final $$BudgetsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.budgetFk,
        referencedTable: $db.budgets,
        getReferencedColumn: (t) => t.budgetPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BudgetsTableFilterComposer(
              $db: $db,
              $table: $db.budgets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WalletsTableFilterComposer get walletFk {
    final $$WalletsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletFk,
        referencedTable: $db.wallets,
        getReferencedColumn: (t) => t.walletPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WalletsTableFilterComposer(
              $db: $db,
              $table: $db.wallets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CategoryBudgetLimitsTableOrderingComposer
    extends Composer<_$FinanceDatabase, $CategoryBudgetLimitsTable> {
  $$CategoryBudgetLimitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get categoryLimitPk => $composableBuilder(
      column: $table.categoryLimitPk,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnOrderings(column));

  $$CategoriesTableOrderingComposer get categoryFk {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$BudgetsTableOrderingComposer get budgetFk {
    final $$BudgetsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.budgetFk,
        referencedTable: $db.budgets,
        getReferencedColumn: (t) => t.budgetPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BudgetsTableOrderingComposer(
              $db: $db,
              $table: $db.budgets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WalletsTableOrderingComposer get walletFk {
    final $$WalletsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletFk,
        referencedTable: $db.wallets,
        getReferencedColumn: (t) => t.walletPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WalletsTableOrderingComposer(
              $db: $db,
              $table: $db.wallets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CategoryBudgetLimitsTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $CategoryBudgetLimitsTable> {
  $$CategoryBudgetLimitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get categoryLimitPk => $composableBuilder(
      column: $table.categoryLimitPk, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get categoryFk {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$BudgetsTableAnnotationComposer get budgetFk {
    final $$BudgetsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.budgetFk,
        referencedTable: $db.budgets,
        getReferencedColumn: (t) => t.budgetPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BudgetsTableAnnotationComposer(
              $db: $db,
              $table: $db.budgets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WalletsTableAnnotationComposer get walletFk {
    final $$WalletsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletFk,
        referencedTable: $db.wallets,
        getReferencedColumn: (t) => t.walletPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WalletsTableAnnotationComposer(
              $db: $db,
              $table: $db.wallets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CategoryBudgetLimitsTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $CategoryBudgetLimitsTable,
    CategoryBudgetLimit,
    $$CategoryBudgetLimitsTableFilterComposer,
    $$CategoryBudgetLimitsTableOrderingComposer,
    $$CategoryBudgetLimitsTableAnnotationComposer,
    $$CategoryBudgetLimitsTableCreateCompanionBuilder,
    $$CategoryBudgetLimitsTableUpdateCompanionBuilder,
    (CategoryBudgetLimit, $$CategoryBudgetLimitsTableReferences),
    CategoryBudgetLimit,
    PrefetchHooks Function({bool categoryFk, bool budgetFk, bool walletFk})> {
  $$CategoryBudgetLimitsTableTableManager(
      _$FinanceDatabase db, $CategoryBudgetLimitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryBudgetLimitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryBudgetLimitsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryBudgetLimitsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> categoryLimitPk = const Value.absent(),
            Value<String> categoryFk = const Value.absent(),
            Value<String> budgetFk = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<String> walletFk = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryBudgetLimitsCompanion(
            categoryLimitPk: categoryLimitPk,
            categoryFk: categoryFk,
            budgetFk: budgetFk,
            amount: amount,
            dateTimeModified: dateTimeModified,
            walletFk: walletFk,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> categoryLimitPk = const Value.absent(),
            required String categoryFk,
            required String budgetFk,
            required double amount,
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<String> walletFk = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryBudgetLimitsCompanion.insert(
            categoryLimitPk: categoryLimitPk,
            categoryFk: categoryFk,
            budgetFk: budgetFk,
            amount: amount,
            dateTimeModified: dateTimeModified,
            walletFk: walletFk,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CategoryBudgetLimitsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {categoryFk = false, budgetFk = false, walletFk = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryFk,
                    referencedTable: $$CategoryBudgetLimitsTableReferences
                        ._categoryFkTable(db),
                    referencedColumn: $$CategoryBudgetLimitsTableReferences
                        ._categoryFkTable(db)
                        .categoryPk,
                  ) as T;
                }
                if (budgetFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.budgetFk,
                    referencedTable: $$CategoryBudgetLimitsTableReferences
                        ._budgetFkTable(db),
                    referencedColumn: $$CategoryBudgetLimitsTableReferences
                        ._budgetFkTable(db)
                        .budgetPk,
                  ) as T;
                }
                if (walletFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.walletFk,
                    referencedTable: $$CategoryBudgetLimitsTableReferences
                        ._walletFkTable(db),
                    referencedColumn: $$CategoryBudgetLimitsTableReferences
                        ._walletFkTable(db)
                        .walletPk,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CategoryBudgetLimitsTableProcessedTableManager
    = ProcessedTableManager<
        _$FinanceDatabase,
        $CategoryBudgetLimitsTable,
        CategoryBudgetLimit,
        $$CategoryBudgetLimitsTableFilterComposer,
        $$CategoryBudgetLimitsTableOrderingComposer,
        $$CategoryBudgetLimitsTableAnnotationComposer,
        $$CategoryBudgetLimitsTableCreateCompanionBuilder,
        $$CategoryBudgetLimitsTableUpdateCompanionBuilder,
        (CategoryBudgetLimit, $$CategoryBudgetLimitsTableReferences),
        CategoryBudgetLimit,
        PrefetchHooks Function(
            {bool categoryFk, bool budgetFk, bool walletFk})>;
typedef $$AssociatedTitlesTableCreateCompanionBuilder
    = AssociatedTitlesCompanion Function({
  Value<String> associatedTitlePk,
  required String categoryFk,
  required String title,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  required int order,
  Value<bool> isExactMatch,
  Value<int> rowid,
});
typedef $$AssociatedTitlesTableUpdateCompanionBuilder
    = AssociatedTitlesCompanion Function({
  Value<String> associatedTitlePk,
  Value<String> categoryFk,
  Value<String> title,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  Value<int> order,
  Value<bool> isExactMatch,
  Value<int> rowid,
});

final class $$AssociatedTitlesTableReferences extends BaseReferences<
    _$FinanceDatabase, $AssociatedTitlesTable, TransactionAssociatedTitle> {
  $$AssociatedTitlesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryFkTable(_$FinanceDatabase db) =>
      db.categories.createAlias($_aliasNameGenerator(
          db.associatedTitles.categoryFk, db.categories.categoryPk));

  $$CategoriesTableProcessedTableManager get categoryFk {
    final $_column = $_itemColumn<String>('category_fk')!;

    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.categoryPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AssociatedTitlesTableFilterComposer
    extends Composer<_$FinanceDatabase, $AssociatedTitlesTable> {
  $$AssociatedTitlesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get associatedTitlePk => $composableBuilder(
      column: $table.associatedTitlePk,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isExactMatch => $composableBuilder(
      column: $table.isExactMatch, builder: (column) => ColumnFilters(column));

  $$CategoriesTableFilterComposer get categoryFk {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AssociatedTitlesTableOrderingComposer
    extends Composer<_$FinanceDatabase, $AssociatedTitlesTable> {
  $$AssociatedTitlesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get associatedTitlePk => $composableBuilder(
      column: $table.associatedTitlePk,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isExactMatch => $composableBuilder(
      column: $table.isExactMatch,
      builder: (column) => ColumnOrderings(column));

  $$CategoriesTableOrderingComposer get categoryFk {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AssociatedTitlesTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $AssociatedTitlesTable> {
  $$AssociatedTitlesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get associatedTitlePk => $composableBuilder(
      column: $table.associatedTitlePk, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<bool> get isExactMatch => $composableBuilder(
      column: $table.isExactMatch, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get categoryFk {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AssociatedTitlesTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $AssociatedTitlesTable,
    TransactionAssociatedTitle,
    $$AssociatedTitlesTableFilterComposer,
    $$AssociatedTitlesTableOrderingComposer,
    $$AssociatedTitlesTableAnnotationComposer,
    $$AssociatedTitlesTableCreateCompanionBuilder,
    $$AssociatedTitlesTableUpdateCompanionBuilder,
    (TransactionAssociatedTitle, $$AssociatedTitlesTableReferences),
    TransactionAssociatedTitle,
    PrefetchHooks Function({bool categoryFk})> {
  $$AssociatedTitlesTableTableManager(
      _$FinanceDatabase db, $AssociatedTitlesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssociatedTitlesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssociatedTitlesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssociatedTitlesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> associatedTitlePk = const Value.absent(),
            Value<String> categoryFk = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<bool> isExactMatch = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssociatedTitlesCompanion(
            associatedTitlePk: associatedTitlePk,
            categoryFk: categoryFk,
            title: title,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            order: order,
            isExactMatch: isExactMatch,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> associatedTitlePk = const Value.absent(),
            required String categoryFk,
            required String title,
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            required int order,
            Value<bool> isExactMatch = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssociatedTitlesCompanion.insert(
            associatedTitlePk: associatedTitlePk,
            categoryFk: categoryFk,
            title: title,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            order: order,
            isExactMatch: isExactMatch,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AssociatedTitlesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({categoryFk = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryFk,
                    referencedTable:
                        $$AssociatedTitlesTableReferences._categoryFkTable(db),
                    referencedColumn: $$AssociatedTitlesTableReferences
                        ._categoryFkTable(db)
                        .categoryPk,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AssociatedTitlesTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $AssociatedTitlesTable,
    TransactionAssociatedTitle,
    $$AssociatedTitlesTableFilterComposer,
    $$AssociatedTitlesTableOrderingComposer,
    $$AssociatedTitlesTableAnnotationComposer,
    $$AssociatedTitlesTableCreateCompanionBuilder,
    $$AssociatedTitlesTableUpdateCompanionBuilder,
    (TransactionAssociatedTitle, $$AssociatedTitlesTableReferences),
    TransactionAssociatedTitle,
    PrefetchHooks Function({bool categoryFk})>;
typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<int> settingsPk,
  required String settingsJSON,
  Value<DateTime> dateUpdated,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<int> settingsPk,
  Value<String> settingsJSON,
  Value<DateTime> dateUpdated,
});

class $$AppSettingsTableFilterComposer
    extends Composer<_$FinanceDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get settingsPk => $composableBuilder(
      column: $table.settingsPk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get settingsJSON => $composableBuilder(
      column: $table.settingsJSON, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$FinanceDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get settingsPk => $composableBuilder(
      column: $table.settingsPk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get settingsJSON => $composableBuilder(
      column: $table.settingsJSON,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get settingsPk => $composableBuilder(
      column: $table.settingsPk, builder: (column) => column);

  GeneratedColumn<String> get settingsJSON => $composableBuilder(
      column: $table.settingsJSON, builder: (column) => column);

  GeneratedColumn<DateTime> get dateUpdated => $composableBuilder(
      column: $table.dateUpdated, builder: (column) => column);
}

class $$AppSettingsTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (
      AppSetting,
      BaseReferences<_$FinanceDatabase, $AppSettingsTable, AppSetting>
    ),
    AppSetting,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableManager(_$FinanceDatabase db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> settingsPk = const Value.absent(),
            Value<String> settingsJSON = const Value.absent(),
            Value<DateTime> dateUpdated = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            settingsPk: settingsPk,
            settingsJSON: settingsJSON,
            dateUpdated: dateUpdated,
          ),
          createCompanionCallback: ({
            Value<int> settingsPk = const Value.absent(),
            required String settingsJSON,
            Value<DateTime> dateUpdated = const Value.absent(),
          }) =>
              AppSettingsCompanion.insert(
            settingsPk: settingsPk,
            settingsJSON: settingsJSON,
            dateUpdated: dateUpdated,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (
      AppSetting,
      BaseReferences<_$FinanceDatabase, $AppSettingsTable, AppSetting>
    ),
    AppSetting,
    PrefetchHooks Function()>;
typedef $$ScannerTemplatesTableCreateCompanionBuilder
    = ScannerTemplatesCompanion Function({
  Value<String> scannerTemplatePk,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  required String templateName,
  required String contains,
  required String titleTransactionBefore,
  required String titleTransactionAfter,
  required String amountTransactionBefore,
  required String amountTransactionAfter,
  required String defaultCategoryFk,
  Value<String> walletFk,
  Value<bool> ignore,
  Value<int> rowid,
});
typedef $$ScannerTemplatesTableUpdateCompanionBuilder
    = ScannerTemplatesCompanion Function({
  Value<String> scannerTemplatePk,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  Value<String> templateName,
  Value<String> contains,
  Value<String> titleTransactionBefore,
  Value<String> titleTransactionAfter,
  Value<String> amountTransactionBefore,
  Value<String> amountTransactionAfter,
  Value<String> defaultCategoryFk,
  Value<String> walletFk,
  Value<bool> ignore,
  Value<int> rowid,
});

final class $$ScannerTemplatesTableReferences extends BaseReferences<
    _$FinanceDatabase, $ScannerTemplatesTable, ScannerTemplate> {
  $$ScannerTemplatesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _defaultCategoryFkTable(_$FinanceDatabase db) =>
      db.categories.createAlias($_aliasNameGenerator(
          db.scannerTemplates.defaultCategoryFk, db.categories.categoryPk));

  $$CategoriesTableProcessedTableManager get defaultCategoryFk {
    final $_column = $_itemColumn<String>('default_category_fk')!;

    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.categoryPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_defaultCategoryFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $WalletsTable _walletFkTable(_$FinanceDatabase db) =>
      db.wallets.createAlias($_aliasNameGenerator(
          db.scannerTemplates.walletFk, db.wallets.walletPk));

  $$WalletsTableProcessedTableManager get walletFk {
    final $_column = $_itemColumn<String>('wallet_fk')!;

    final manager = $$WalletsTableTableManager($_db, $_db.wallets)
        .filter((f) => f.walletPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_walletFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ScannerTemplatesTableFilterComposer
    extends Composer<_$FinanceDatabase, $ScannerTemplatesTable> {
  $$ScannerTemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get scannerTemplatePk => $composableBuilder(
      column: $table.scannerTemplatePk,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get templateName => $composableBuilder(
      column: $table.templateName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contains => $composableBuilder(
      column: $table.contains, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get titleTransactionBefore => $composableBuilder(
      column: $table.titleTransactionBefore,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get titleTransactionAfter => $composableBuilder(
      column: $table.titleTransactionAfter,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get amountTransactionBefore => $composableBuilder(
      column: $table.amountTransactionBefore,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get amountTransactionAfter => $composableBuilder(
      column: $table.amountTransactionAfter,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get ignore => $composableBuilder(
      column: $table.ignore, builder: (column) => ColumnFilters(column));

  $$CategoriesTableFilterComposer get defaultCategoryFk {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.defaultCategoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WalletsTableFilterComposer get walletFk {
    final $$WalletsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletFk,
        referencedTable: $db.wallets,
        getReferencedColumn: (t) => t.walletPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WalletsTableFilterComposer(
              $db: $db,
              $table: $db.wallets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ScannerTemplatesTableOrderingComposer
    extends Composer<_$FinanceDatabase, $ScannerTemplatesTable> {
  $$ScannerTemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get scannerTemplatePk => $composableBuilder(
      column: $table.scannerTemplatePk,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get templateName => $composableBuilder(
      column: $table.templateName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contains => $composableBuilder(
      column: $table.contains, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get titleTransactionBefore => $composableBuilder(
      column: $table.titleTransactionBefore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get titleTransactionAfter => $composableBuilder(
      column: $table.titleTransactionAfter,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get amountTransactionBefore => $composableBuilder(
      column: $table.amountTransactionBefore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get amountTransactionAfter => $composableBuilder(
      column: $table.amountTransactionAfter,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get ignore => $composableBuilder(
      column: $table.ignore, builder: (column) => ColumnOrderings(column));

  $$CategoriesTableOrderingComposer get defaultCategoryFk {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.defaultCategoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WalletsTableOrderingComposer get walletFk {
    final $$WalletsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletFk,
        referencedTable: $db.wallets,
        getReferencedColumn: (t) => t.walletPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WalletsTableOrderingComposer(
              $db: $db,
              $table: $db.wallets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ScannerTemplatesTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $ScannerTemplatesTable> {
  $$ScannerTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get scannerTemplatePk => $composableBuilder(
      column: $table.scannerTemplatePk, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified, builder: (column) => column);

  GeneratedColumn<String> get templateName => $composableBuilder(
      column: $table.templateName, builder: (column) => column);

  GeneratedColumn<String> get contains =>
      $composableBuilder(column: $table.contains, builder: (column) => column);

  GeneratedColumn<String> get titleTransactionBefore => $composableBuilder(
      column: $table.titleTransactionBefore, builder: (column) => column);

  GeneratedColumn<String> get titleTransactionAfter => $composableBuilder(
      column: $table.titleTransactionAfter, builder: (column) => column);

  GeneratedColumn<String> get amountTransactionBefore => $composableBuilder(
      column: $table.amountTransactionBefore, builder: (column) => column);

  GeneratedColumn<String> get amountTransactionAfter => $composableBuilder(
      column: $table.amountTransactionAfter, builder: (column) => column);

  GeneratedColumn<bool> get ignore =>
      $composableBuilder(column: $table.ignore, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get defaultCategoryFk {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.defaultCategoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WalletsTableAnnotationComposer get walletFk {
    final $$WalletsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletFk,
        referencedTable: $db.wallets,
        getReferencedColumn: (t) => t.walletPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WalletsTableAnnotationComposer(
              $db: $db,
              $table: $db.wallets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ScannerTemplatesTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $ScannerTemplatesTable,
    ScannerTemplate,
    $$ScannerTemplatesTableFilterComposer,
    $$ScannerTemplatesTableOrderingComposer,
    $$ScannerTemplatesTableAnnotationComposer,
    $$ScannerTemplatesTableCreateCompanionBuilder,
    $$ScannerTemplatesTableUpdateCompanionBuilder,
    (ScannerTemplate, $$ScannerTemplatesTableReferences),
    ScannerTemplate,
    PrefetchHooks Function({bool defaultCategoryFk, bool walletFk})> {
  $$ScannerTemplatesTableTableManager(
      _$FinanceDatabase db, $ScannerTemplatesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScannerTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScannerTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScannerTemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> scannerTemplatePk = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<String> templateName = const Value.absent(),
            Value<String> contains = const Value.absent(),
            Value<String> titleTransactionBefore = const Value.absent(),
            Value<String> titleTransactionAfter = const Value.absent(),
            Value<String> amountTransactionBefore = const Value.absent(),
            Value<String> amountTransactionAfter = const Value.absent(),
            Value<String> defaultCategoryFk = const Value.absent(),
            Value<String> walletFk = const Value.absent(),
            Value<bool> ignore = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ScannerTemplatesCompanion(
            scannerTemplatePk: scannerTemplatePk,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            templateName: templateName,
            contains: contains,
            titleTransactionBefore: titleTransactionBefore,
            titleTransactionAfter: titleTransactionAfter,
            amountTransactionBefore: amountTransactionBefore,
            amountTransactionAfter: amountTransactionAfter,
            defaultCategoryFk: defaultCategoryFk,
            walletFk: walletFk,
            ignore: ignore,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> scannerTemplatePk = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            required String templateName,
            required String contains,
            required String titleTransactionBefore,
            required String titleTransactionAfter,
            required String amountTransactionBefore,
            required String amountTransactionAfter,
            required String defaultCategoryFk,
            Value<String> walletFk = const Value.absent(),
            Value<bool> ignore = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ScannerTemplatesCompanion.insert(
            scannerTemplatePk: scannerTemplatePk,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            templateName: templateName,
            contains: contains,
            titleTransactionBefore: titleTransactionBefore,
            titleTransactionAfter: titleTransactionAfter,
            amountTransactionBefore: amountTransactionBefore,
            amountTransactionAfter: amountTransactionAfter,
            defaultCategoryFk: defaultCategoryFk,
            walletFk: walletFk,
            ignore: ignore,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ScannerTemplatesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {defaultCategoryFk = false, walletFk = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (defaultCategoryFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.defaultCategoryFk,
                    referencedTable: $$ScannerTemplatesTableReferences
                        ._defaultCategoryFkTable(db),
                    referencedColumn: $$ScannerTemplatesTableReferences
                        ._defaultCategoryFkTable(db)
                        .categoryPk,
                  ) as T;
                }
                if (walletFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.walletFk,
                    referencedTable:
                        $$ScannerTemplatesTableReferences._walletFkTable(db),
                    referencedColumn: $$ScannerTemplatesTableReferences
                        ._walletFkTable(db)
                        .walletPk,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ScannerTemplatesTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $ScannerTemplatesTable,
    ScannerTemplate,
    $$ScannerTemplatesTableFilterComposer,
    $$ScannerTemplatesTableOrderingComposer,
    $$ScannerTemplatesTableAnnotationComposer,
    $$ScannerTemplatesTableCreateCompanionBuilder,
    $$ScannerTemplatesTableUpdateCompanionBuilder,
    (ScannerTemplate, $$ScannerTemplatesTableReferences),
    ScannerTemplate,
    PrefetchHooks Function({bool defaultCategoryFk, bool walletFk})>;
typedef $$DeleteLogsTableCreateCompanionBuilder = DeleteLogsCompanion Function({
  Value<String> deleteLogPk,
  required String entryPk,
  required DeleteLogType type,
  Value<DateTime> dateTimeModified,
  Value<int> rowid,
});
typedef $$DeleteLogsTableUpdateCompanionBuilder = DeleteLogsCompanion Function({
  Value<String> deleteLogPk,
  Value<String> entryPk,
  Value<DeleteLogType> type,
  Value<DateTime> dateTimeModified,
  Value<int> rowid,
});

class $$DeleteLogsTableFilterComposer
    extends Composer<_$FinanceDatabase, $DeleteLogsTable> {
  $$DeleteLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get deleteLogPk => $composableBuilder(
      column: $table.deleteLogPk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entryPk => $composableBuilder(
      column: $table.entryPk, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<DeleteLogType, DeleteLogType, int> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnFilters(column));
}

class $$DeleteLogsTableOrderingComposer
    extends Composer<_$FinanceDatabase, $DeleteLogsTable> {
  $$DeleteLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get deleteLogPk => $composableBuilder(
      column: $table.deleteLogPk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entryPk => $composableBuilder(
      column: $table.entryPk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnOrderings(column));
}

class $$DeleteLogsTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $DeleteLogsTable> {
  $$DeleteLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get deleteLogPk => $composableBuilder(
      column: $table.deleteLogPk, builder: (column) => column);

  GeneratedColumn<String> get entryPk =>
      $composableBuilder(column: $table.entryPk, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DeleteLogType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified, builder: (column) => column);
}

class $$DeleteLogsTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $DeleteLogsTable,
    DeleteLog,
    $$DeleteLogsTableFilterComposer,
    $$DeleteLogsTableOrderingComposer,
    $$DeleteLogsTableAnnotationComposer,
    $$DeleteLogsTableCreateCompanionBuilder,
    $$DeleteLogsTableUpdateCompanionBuilder,
    (DeleteLog, BaseReferences<_$FinanceDatabase, $DeleteLogsTable, DeleteLog>),
    DeleteLog,
    PrefetchHooks Function()> {
  $$DeleteLogsTableTableManager(_$FinanceDatabase db, $DeleteLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DeleteLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DeleteLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DeleteLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> deleteLogPk = const Value.absent(),
            Value<String> entryPk = const Value.absent(),
            Value<DeleteLogType> type = const Value.absent(),
            Value<DateTime> dateTimeModified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DeleteLogsCompanion(
            deleteLogPk: deleteLogPk,
            entryPk: entryPk,
            type: type,
            dateTimeModified: dateTimeModified,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> deleteLogPk = const Value.absent(),
            required String entryPk,
            required DeleteLogType type,
            Value<DateTime> dateTimeModified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DeleteLogsCompanion.insert(
            deleteLogPk: deleteLogPk,
            entryPk: entryPk,
            type: type,
            dateTimeModified: dateTimeModified,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DeleteLogsTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $DeleteLogsTable,
    DeleteLog,
    $$DeleteLogsTableFilterComposer,
    $$DeleteLogsTableOrderingComposer,
    $$DeleteLogsTableAnnotationComposer,
    $$DeleteLogsTableCreateCompanionBuilder,
    $$DeleteLogsTableUpdateCompanionBuilder,
    (DeleteLog, BaseReferences<_$FinanceDatabase, $DeleteLogsTable, DeleteLog>),
    DeleteLog,
    PrefetchHooks Function()>;
typedef $$GroupsTableCreateCompanionBuilder = GroupsCompanion Function({
  Value<String> groupPk,
  required String name,
  Value<String?> description,
  Value<String?> imageUrl,
  required String createdBy,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  Value<bool> archived,
  Value<int> rowid,
});
typedef $$GroupsTableUpdateCompanionBuilder = GroupsCompanion Function({
  Value<String> groupPk,
  Value<String> name,
  Value<String?> description,
  Value<String?> imageUrl,
  Value<String> createdBy,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  Value<bool> archived,
  Value<int> rowid,
});

final class $$GroupsTableReferences
    extends BaseReferences<_$FinanceDatabase, $GroupsTable, GroupEntry> {
  $$GroupsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GroupMembersTable, List<GroupMemberEntry>>
      _groupMembersRefsTable(_$FinanceDatabase db) =>
          MultiTypedResultKey.fromTable(db.groupMembers,
              aliasName: $_aliasNameGenerator(
                  db.groups.groupPk, db.groupMembers.groupFk));

  $$GroupMembersTableProcessedTableManager get groupMembersRefs {
    final manager = $$GroupMembersTableTableManager($_db, $_db.groupMembers)
        .filter((f) =>
            f.groupFk.groupPk.sqlEquals($_itemColumn<String>('group_pk')!));

    final cache = $_typedResult.readTableOrNull(_groupMembersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$SharedExpensesTable, List<SharedExpenseEntry>>
      _sharedExpensesRefsTable(_$FinanceDatabase db) =>
          MultiTypedResultKey.fromTable(db.sharedExpenses,
              aliasName: $_aliasNameGenerator(
                  db.groups.groupPk, db.sharedExpenses.groupFk));

  $$SharedExpensesTableProcessedTableManager get sharedExpensesRefs {
    final manager = $$SharedExpensesTableTableManager($_db, $_db.sharedExpenses)
        .filter((f) =>
            f.groupFk.groupPk.sqlEquals($_itemColumn<String>('group_pk')!));

    final cache = $_typedResult.readTableOrNull(_sharedExpensesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$GroupBalancesTable, List<GroupBalanceEntry>>
      _groupBalancesRefsTable(_$FinanceDatabase db) =>
          MultiTypedResultKey.fromTable(db.groupBalances,
              aliasName: $_aliasNameGenerator(
                  db.groups.groupPk, db.groupBalances.groupFk));

  $$GroupBalancesTableProcessedTableManager get groupBalancesRefs {
    final manager = $$GroupBalancesTableTableManager($_db, $_db.groupBalances)
        .filter((f) =>
            f.groupFk.groupPk.sqlEquals($_itemColumn<String>('group_pk')!));

    final cache = $_typedResult.readTableOrNull(_groupBalancesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$SettlementsTable, List<SettlementEntry>>
      _settlementsRefsTable(_$FinanceDatabase db) =>
          MultiTypedResultKey.fromTable(db.settlements,
              aliasName: $_aliasNameGenerator(
                  db.groups.groupPk, db.settlements.groupFk));

  $$SettlementsTableProcessedTableManager get settlementsRefs {
    final manager = $$SettlementsTableTableManager($_db, $_db.settlements)
        .filter((f) =>
            f.groupFk.groupPk.sqlEquals($_itemColumn<String>('group_pk')!));

    final cache = $_typedResult.readTableOrNull(_settlementsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$GroupActivityTable, List<GroupActivityEntry>>
      _groupActivityRefsTable(_$FinanceDatabase db) =>
          MultiTypedResultKey.fromTable(db.groupActivity,
              aliasName: $_aliasNameGenerator(
                  db.groups.groupPk, db.groupActivity.groupFk));

  $$GroupActivityTableProcessedTableManager get groupActivityRefs {
    final manager = $$GroupActivityTableTableManager($_db, $_db.groupActivity)
        .filter((f) =>
            f.groupFk.groupPk.sqlEquals($_itemColumn<String>('group_pk')!));

    final cache = $_typedResult.readTableOrNull(_groupActivityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GroupsTableFilterComposer
    extends Composer<_$FinanceDatabase, $GroupsTable> {
  $$GroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get groupPk => $composableBuilder(
      column: $table.groupPk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnFilters(column));

  Expression<bool> groupMembersRefs(
      Expression<bool> Function($$GroupMembersTableFilterComposer f) f) {
    final $$GroupMembersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupPk,
        referencedTable: $db.groupMembers,
        getReferencedColumn: (t) => t.groupFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupMembersTableFilterComposer(
              $db: $db,
              $table: $db.groupMembers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> sharedExpensesRefs(
      Expression<bool> Function($$SharedExpensesTableFilterComposer f) f) {
    final $$SharedExpensesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupPk,
        referencedTable: $db.sharedExpenses,
        getReferencedColumn: (t) => t.groupFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SharedExpensesTableFilterComposer(
              $db: $db,
              $table: $db.sharedExpenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> groupBalancesRefs(
      Expression<bool> Function($$GroupBalancesTableFilterComposer f) f) {
    final $$GroupBalancesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupPk,
        referencedTable: $db.groupBalances,
        getReferencedColumn: (t) => t.groupFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupBalancesTableFilterComposer(
              $db: $db,
              $table: $db.groupBalances,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> settlementsRefs(
      Expression<bool> Function($$SettlementsTableFilterComposer f) f) {
    final $$SettlementsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupPk,
        referencedTable: $db.settlements,
        getReferencedColumn: (t) => t.groupFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SettlementsTableFilterComposer(
              $db: $db,
              $table: $db.settlements,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> groupActivityRefs(
      Expression<bool> Function($$GroupActivityTableFilterComposer f) f) {
    final $$GroupActivityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupPk,
        referencedTable: $db.groupActivity,
        getReferencedColumn: (t) => t.groupFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupActivityTableFilterComposer(
              $db: $db,
              $table: $db.groupActivity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GroupsTableOrderingComposer
    extends Composer<_$FinanceDatabase, $GroupsTable> {
  $$GroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get groupPk => $composableBuilder(
      column: $table.groupPk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnOrderings(column));
}

class $$GroupsTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $GroupsTable> {
  $$GroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get groupPk =>
      $composableBuilder(column: $table.groupPk, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  Expression<T> groupMembersRefs<T extends Object>(
      Expression<T> Function($$GroupMembersTableAnnotationComposer a) f) {
    final $$GroupMembersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupPk,
        referencedTable: $db.groupMembers,
        getReferencedColumn: (t) => t.groupFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupMembersTableAnnotationComposer(
              $db: $db,
              $table: $db.groupMembers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> sharedExpensesRefs<T extends Object>(
      Expression<T> Function($$SharedExpensesTableAnnotationComposer a) f) {
    final $$SharedExpensesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupPk,
        referencedTable: $db.sharedExpenses,
        getReferencedColumn: (t) => t.groupFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SharedExpensesTableAnnotationComposer(
              $db: $db,
              $table: $db.sharedExpenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> groupBalancesRefs<T extends Object>(
      Expression<T> Function($$GroupBalancesTableAnnotationComposer a) f) {
    final $$GroupBalancesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupPk,
        referencedTable: $db.groupBalances,
        getReferencedColumn: (t) => t.groupFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupBalancesTableAnnotationComposer(
              $db: $db,
              $table: $db.groupBalances,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> settlementsRefs<T extends Object>(
      Expression<T> Function($$SettlementsTableAnnotationComposer a) f) {
    final $$SettlementsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupPk,
        referencedTable: $db.settlements,
        getReferencedColumn: (t) => t.groupFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SettlementsTableAnnotationComposer(
              $db: $db,
              $table: $db.settlements,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> groupActivityRefs<T extends Object>(
      Expression<T> Function($$GroupActivityTableAnnotationComposer a) f) {
    final $$GroupActivityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupPk,
        referencedTable: $db.groupActivity,
        getReferencedColumn: (t) => t.groupFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupActivityTableAnnotationComposer(
              $db: $db,
              $table: $db.groupActivity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GroupsTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $GroupsTable,
    GroupEntry,
    $$GroupsTableFilterComposer,
    $$GroupsTableOrderingComposer,
    $$GroupsTableAnnotationComposer,
    $$GroupsTableCreateCompanionBuilder,
    $$GroupsTableUpdateCompanionBuilder,
    (GroupEntry, $$GroupsTableReferences),
    GroupEntry,
    PrefetchHooks Function(
        {bool groupMembersRefs,
        bool sharedExpensesRefs,
        bool groupBalancesRefs,
        bool settlementsRefs,
        bool groupActivityRefs})> {
  $$GroupsTableTableManager(_$FinanceDatabase db, $GroupsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> groupPk = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<String> createdBy = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupsCompanion(
            groupPk: groupPk,
            name: name,
            description: description,
            imageUrl: imageUrl,
            createdBy: createdBy,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            archived: archived,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> groupPk = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            required String createdBy,
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupsCompanion.insert(
            groupPk: groupPk,
            name: name,
            description: description,
            imageUrl: imageUrl,
            createdBy: createdBy,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            archived: archived,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$GroupsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {groupMembersRefs = false,
              sharedExpensesRefs = false,
              groupBalancesRefs = false,
              settlementsRefs = false,
              groupActivityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (groupMembersRefs) db.groupMembers,
                if (sharedExpensesRefs) db.sharedExpenses,
                if (groupBalancesRefs) db.groupBalances,
                if (settlementsRefs) db.settlements,
                if (groupActivityRefs) db.groupActivity
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (groupMembersRefs)
                    await $_getPrefetchedData<GroupEntry, $GroupsTable,
                            GroupMemberEntry>(
                        currentTable: table,
                        referencedTable:
                            $$GroupsTableReferences._groupMembersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GroupsTableReferences(db, table, p0)
                                .groupMembersRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.groupFk == item.groupPk),
                        typedResults: items),
                  if (sharedExpensesRefs)
                    await $_getPrefetchedData<GroupEntry, $GroupsTable,
                            SharedExpenseEntry>(
                        currentTable: table,
                        referencedTable: $$GroupsTableReferences
                            ._sharedExpensesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GroupsTableReferences(db, table, p0)
                                .sharedExpensesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.groupFk == item.groupPk),
                        typedResults: items),
                  if (groupBalancesRefs)
                    await $_getPrefetchedData<GroupEntry, $GroupsTable,
                            GroupBalanceEntry>(
                        currentTable: table,
                        referencedTable:
                            $$GroupsTableReferences._groupBalancesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GroupsTableReferences(db, table, p0)
                                .groupBalancesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.groupFk == item.groupPk),
                        typedResults: items),
                  if (settlementsRefs)
                    await $_getPrefetchedData<GroupEntry, $GroupsTable,
                            SettlementEntry>(
                        currentTable: table,
                        referencedTable:
                            $$GroupsTableReferences._settlementsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GroupsTableReferences(db, table, p0)
                                .settlementsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.groupFk == item.groupPk),
                        typedResults: items),
                  if (groupActivityRefs)
                    await $_getPrefetchedData<GroupEntry, $GroupsTable,
                            GroupActivityEntry>(
                        currentTable: table,
                        referencedTable:
                            $$GroupsTableReferences._groupActivityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GroupsTableReferences(db, table, p0)
                                .groupActivityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.groupFk == item.groupPk),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GroupsTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $GroupsTable,
    GroupEntry,
    $$GroupsTableFilterComposer,
    $$GroupsTableOrderingComposer,
    $$GroupsTableAnnotationComposer,
    $$GroupsTableCreateCompanionBuilder,
    $$GroupsTableUpdateCompanionBuilder,
    (GroupEntry, $$GroupsTableReferences),
    GroupEntry,
    PrefetchHooks Function(
        {bool groupMembersRefs,
        bool sharedExpensesRefs,
        bool groupBalancesRefs,
        bool settlementsRefs,
        bool groupActivityRefs})>;
typedef $$GroupMembersTableCreateCompanionBuilder = GroupMembersCompanion
    Function({
  Value<String> memberPk,
  required String groupFk,
  required String userEmail,
  required String userName,
  Value<String?> userPhotoUrl,
  Value<DateTime> dateJoined,
  Value<bool> isActive,
  Value<int> rowid,
});
typedef $$GroupMembersTableUpdateCompanionBuilder = GroupMembersCompanion
    Function({
  Value<String> memberPk,
  Value<String> groupFk,
  Value<String> userEmail,
  Value<String> userName,
  Value<String?> userPhotoUrl,
  Value<DateTime> dateJoined,
  Value<bool> isActive,
  Value<int> rowid,
});

final class $$GroupMembersTableReferences extends BaseReferences<
    _$FinanceDatabase, $GroupMembersTable, GroupMemberEntry> {
  $$GroupMembersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GroupsTable _groupFkTable(_$FinanceDatabase db) =>
      db.groups.createAlias(
          $_aliasNameGenerator(db.groupMembers.groupFk, db.groups.groupPk));

  $$GroupsTableProcessedTableManager get groupFk {
    final $_column = $_itemColumn<String>('group_fk')!;

    final manager = $$GroupsTableTableManager($_db, $_db.groups)
        .filter((f) => f.groupPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$GroupMembersTableFilterComposer
    extends Composer<_$FinanceDatabase, $GroupMembersTable> {
  $$GroupMembersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get memberPk => $composableBuilder(
      column: $table.memberPk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userEmail => $composableBuilder(
      column: $table.userEmail, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userName => $composableBuilder(
      column: $table.userName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userPhotoUrl => $composableBuilder(
      column: $table.userPhotoUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateJoined => $composableBuilder(
      column: $table.dateJoined, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  $$GroupsTableFilterComposer get groupFk {
    final $$GroupsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupFk,
        referencedTable: $db.groups,
        getReferencedColumn: (t) => t.groupPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupsTableFilterComposer(
              $db: $db,
              $table: $db.groups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GroupMembersTableOrderingComposer
    extends Composer<_$FinanceDatabase, $GroupMembersTable> {
  $$GroupMembersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get memberPk => $composableBuilder(
      column: $table.memberPk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userEmail => $composableBuilder(
      column: $table.userEmail, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userName => $composableBuilder(
      column: $table.userName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userPhotoUrl => $composableBuilder(
      column: $table.userPhotoUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateJoined => $composableBuilder(
      column: $table.dateJoined, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  $$GroupsTableOrderingComposer get groupFk {
    final $$GroupsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupFk,
        referencedTable: $db.groups,
        getReferencedColumn: (t) => t.groupPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupsTableOrderingComposer(
              $db: $db,
              $table: $db.groups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GroupMembersTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $GroupMembersTable> {
  $$GroupMembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get memberPk =>
      $composableBuilder(column: $table.memberPk, builder: (column) => column);

  GeneratedColumn<String> get userEmail =>
      $composableBuilder(column: $table.userEmail, builder: (column) => column);

  GeneratedColumn<String> get userName =>
      $composableBuilder(column: $table.userName, builder: (column) => column);

  GeneratedColumn<String> get userPhotoUrl => $composableBuilder(
      column: $table.userPhotoUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get dateJoined => $composableBuilder(
      column: $table.dateJoined, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$GroupsTableAnnotationComposer get groupFk {
    final $$GroupsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupFk,
        referencedTable: $db.groups,
        getReferencedColumn: (t) => t.groupPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupsTableAnnotationComposer(
              $db: $db,
              $table: $db.groups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GroupMembersTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $GroupMembersTable,
    GroupMemberEntry,
    $$GroupMembersTableFilterComposer,
    $$GroupMembersTableOrderingComposer,
    $$GroupMembersTableAnnotationComposer,
    $$GroupMembersTableCreateCompanionBuilder,
    $$GroupMembersTableUpdateCompanionBuilder,
    (GroupMemberEntry, $$GroupMembersTableReferences),
    GroupMemberEntry,
    PrefetchHooks Function({bool groupFk})> {
  $$GroupMembersTableTableManager(
      _$FinanceDatabase db, $GroupMembersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupMembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupMembersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupMembersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> memberPk = const Value.absent(),
            Value<String> groupFk = const Value.absent(),
            Value<String> userEmail = const Value.absent(),
            Value<String> userName = const Value.absent(),
            Value<String?> userPhotoUrl = const Value.absent(),
            Value<DateTime> dateJoined = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupMembersCompanion(
            memberPk: memberPk,
            groupFk: groupFk,
            userEmail: userEmail,
            userName: userName,
            userPhotoUrl: userPhotoUrl,
            dateJoined: dateJoined,
            isActive: isActive,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> memberPk = const Value.absent(),
            required String groupFk,
            required String userEmail,
            required String userName,
            Value<String?> userPhotoUrl = const Value.absent(),
            Value<DateTime> dateJoined = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupMembersCompanion.insert(
            memberPk: memberPk,
            groupFk: groupFk,
            userEmail: userEmail,
            userName: userName,
            userPhotoUrl: userPhotoUrl,
            dateJoined: dateJoined,
            isActive: isActive,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GroupMembersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({groupFk = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (groupFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.groupFk,
                    referencedTable:
                        $$GroupMembersTableReferences._groupFkTable(db),
                    referencedColumn:
                        $$GroupMembersTableReferences._groupFkTable(db).groupPk,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$GroupMembersTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $GroupMembersTable,
    GroupMemberEntry,
    $$GroupMembersTableFilterComposer,
    $$GroupMembersTableOrderingComposer,
    $$GroupMembersTableAnnotationComposer,
    $$GroupMembersTableCreateCompanionBuilder,
    $$GroupMembersTableUpdateCompanionBuilder,
    (GroupMemberEntry, $$GroupMembersTableReferences),
    GroupMemberEntry,
    PrefetchHooks Function({bool groupFk})>;
typedef $$SharedExpensesTableCreateCompanionBuilder = SharedExpensesCompanion
    Function({
  Value<String> expensePk,
  required String groupFk,
  required String title,
  Value<String?> description,
  required double amount,
  required String currency,
  Value<String?> categoryFk,
  required String paidBy,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  Value<String?> imageUrl,
  Value<bool> isSettled,
  Value<int> rowid,
});
typedef $$SharedExpensesTableUpdateCompanionBuilder = SharedExpensesCompanion
    Function({
  Value<String> expensePk,
  Value<String> groupFk,
  Value<String> title,
  Value<String?> description,
  Value<double> amount,
  Value<String> currency,
  Value<String?> categoryFk,
  Value<String> paidBy,
  Value<DateTime> dateCreated,
  Value<DateTime?> dateTimeModified,
  Value<String?> imageUrl,
  Value<bool> isSettled,
  Value<int> rowid,
});

final class $$SharedExpensesTableReferences extends BaseReferences<
    _$FinanceDatabase, $SharedExpensesTable, SharedExpenseEntry> {
  $$SharedExpensesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $GroupsTable _groupFkTable(_$FinanceDatabase db) =>
      db.groups.createAlias(
          $_aliasNameGenerator(db.sharedExpenses.groupFk, db.groups.groupPk));

  $$GroupsTableProcessedTableManager get groupFk {
    final $_column = $_itemColumn<String>('group_fk')!;

    final manager = $$GroupsTableTableManager($_db, $_db.groups)
        .filter((f) => f.groupPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CategoriesTable _categoryFkTable(_$FinanceDatabase db) =>
      db.categories.createAlias($_aliasNameGenerator(
          db.sharedExpenses.categoryFk, db.categories.categoryPk));

  $$CategoriesTableProcessedTableManager? get categoryFk {
    final $_column = $_itemColumn<String>('category_fk');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.categoryPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ExpenseSplitsTable, List<ExpenseSplitEntry>>
      _expenseSplitsRefsTable(_$FinanceDatabase db) =>
          MultiTypedResultKey.fromTable(db.expenseSplits,
              aliasName: $_aliasNameGenerator(
                  db.sharedExpenses.expensePk, db.expenseSplits.expenseFk));

  $$ExpenseSplitsTableProcessedTableManager get expenseSplitsRefs {
    final manager = $$ExpenseSplitsTableTableManager($_db, $_db.expenseSplits)
        .filter((f) => f.expenseFk.expensePk
            .sqlEquals($_itemColumn<String>('expense_pk')!));

    final cache = $_typedResult.readTableOrNull(_expenseSplitsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$GroupActivityTable, List<GroupActivityEntry>>
      _groupActivityRefsTable(_$FinanceDatabase db) =>
          MultiTypedResultKey.fromTable(db.groupActivity,
              aliasName: $_aliasNameGenerator(db.sharedExpenses.expensePk,
                  db.groupActivity.relatedExpenseFk));

  $$GroupActivityTableProcessedTableManager get groupActivityRefs {
    final manager = $$GroupActivityTableTableManager($_db, $_db.groupActivity)
        .filter((f) => f.relatedExpenseFk.expensePk
            .sqlEquals($_itemColumn<String>('expense_pk')!));

    final cache = $_typedResult.readTableOrNull(_groupActivityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SharedExpensesTableFilterComposer
    extends Composer<_$FinanceDatabase, $SharedExpensesTable> {
  $$SharedExpensesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get expensePk => $composableBuilder(
      column: $table.expensePk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paidBy => $composableBuilder(
      column: $table.paidBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSettled => $composableBuilder(
      column: $table.isSettled, builder: (column) => ColumnFilters(column));

  $$GroupsTableFilterComposer get groupFk {
    final $$GroupsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupFk,
        referencedTable: $db.groups,
        getReferencedColumn: (t) => t.groupPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupsTableFilterComposer(
              $db: $db,
              $table: $db.groups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryFk {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> expenseSplitsRefs(
      Expression<bool> Function($$ExpenseSplitsTableFilterComposer f) f) {
    final $$ExpenseSplitsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.expensePk,
        referencedTable: $db.expenseSplits,
        getReferencedColumn: (t) => t.expenseFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpenseSplitsTableFilterComposer(
              $db: $db,
              $table: $db.expenseSplits,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> groupActivityRefs(
      Expression<bool> Function($$GroupActivityTableFilterComposer f) f) {
    final $$GroupActivityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.expensePk,
        referencedTable: $db.groupActivity,
        getReferencedColumn: (t) => t.relatedExpenseFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupActivityTableFilterComposer(
              $db: $db,
              $table: $db.groupActivity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SharedExpensesTableOrderingComposer
    extends Composer<_$FinanceDatabase, $SharedExpensesTable> {
  $$SharedExpensesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get expensePk => $composableBuilder(
      column: $table.expensePk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paidBy => $composableBuilder(
      column: $table.paidBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSettled => $composableBuilder(
      column: $table.isSettled, builder: (column) => ColumnOrderings(column));

  $$GroupsTableOrderingComposer get groupFk {
    final $$GroupsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupFk,
        referencedTable: $db.groups,
        getReferencedColumn: (t) => t.groupPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupsTableOrderingComposer(
              $db: $db,
              $table: $db.groups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryFk {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SharedExpensesTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $SharedExpensesTable> {
  $$SharedExpensesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get expensePk =>
      $composableBuilder(column: $table.expensePk, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get paidBy =>
      $composableBuilder(column: $table.paidBy, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get dateTimeModified => $composableBuilder(
      column: $table.dateTimeModified, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<bool> get isSettled =>
      $composableBuilder(column: $table.isSettled, builder: (column) => column);

  $$GroupsTableAnnotationComposer get groupFk {
    final $$GroupsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupFk,
        referencedTable: $db.groups,
        getReferencedColumn: (t) => t.groupPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupsTableAnnotationComposer(
              $db: $db,
              $table: $db.groups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categoryFk {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryFk,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.categoryPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> expenseSplitsRefs<T extends Object>(
      Expression<T> Function($$ExpenseSplitsTableAnnotationComposer a) f) {
    final $$ExpenseSplitsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.expensePk,
        referencedTable: $db.expenseSplits,
        getReferencedColumn: (t) => t.expenseFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpenseSplitsTableAnnotationComposer(
              $db: $db,
              $table: $db.expenseSplits,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> groupActivityRefs<T extends Object>(
      Expression<T> Function($$GroupActivityTableAnnotationComposer a) f) {
    final $$GroupActivityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.expensePk,
        referencedTable: $db.groupActivity,
        getReferencedColumn: (t) => t.relatedExpenseFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupActivityTableAnnotationComposer(
              $db: $db,
              $table: $db.groupActivity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SharedExpensesTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $SharedExpensesTable,
    SharedExpenseEntry,
    $$SharedExpensesTableFilterComposer,
    $$SharedExpensesTableOrderingComposer,
    $$SharedExpensesTableAnnotationComposer,
    $$SharedExpensesTableCreateCompanionBuilder,
    $$SharedExpensesTableUpdateCompanionBuilder,
    (SharedExpenseEntry, $$SharedExpensesTableReferences),
    SharedExpenseEntry,
    PrefetchHooks Function(
        {bool groupFk,
        bool categoryFk,
        bool expenseSplitsRefs,
        bool groupActivityRefs})> {
  $$SharedExpensesTableTableManager(
      _$FinanceDatabase db, $SharedExpensesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SharedExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SharedExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SharedExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> expensePk = const Value.absent(),
            Value<String> groupFk = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<String?> categoryFk = const Value.absent(),
            Value<String> paidBy = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<bool> isSettled = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SharedExpensesCompanion(
            expensePk: expensePk,
            groupFk: groupFk,
            title: title,
            description: description,
            amount: amount,
            currency: currency,
            categoryFk: categoryFk,
            paidBy: paidBy,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            imageUrl: imageUrl,
            isSettled: isSettled,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> expensePk = const Value.absent(),
            required String groupFk,
            required String title,
            Value<String?> description = const Value.absent(),
            required double amount,
            required String currency,
            Value<String?> categoryFk = const Value.absent(),
            required String paidBy,
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime?> dateTimeModified = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<bool> isSettled = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SharedExpensesCompanion.insert(
            expensePk: expensePk,
            groupFk: groupFk,
            title: title,
            description: description,
            amount: amount,
            currency: currency,
            categoryFk: categoryFk,
            paidBy: paidBy,
            dateCreated: dateCreated,
            dateTimeModified: dateTimeModified,
            imageUrl: imageUrl,
            isSettled: isSettled,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SharedExpensesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {groupFk = false,
              categoryFk = false,
              expenseSplitsRefs = false,
              groupActivityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (expenseSplitsRefs) db.expenseSplits,
                if (groupActivityRefs) db.groupActivity
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (groupFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.groupFk,
                    referencedTable:
                        $$SharedExpensesTableReferences._groupFkTable(db),
                    referencedColumn: $$SharedExpensesTableReferences
                        ._groupFkTable(db)
                        .groupPk,
                  ) as T;
                }
                if (categoryFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryFk,
                    referencedTable:
                        $$SharedExpensesTableReferences._categoryFkTable(db),
                    referencedColumn: $$SharedExpensesTableReferences
                        ._categoryFkTable(db)
                        .categoryPk,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (expenseSplitsRefs)
                    await $_getPrefetchedData<SharedExpenseEntry,
                            $SharedExpensesTable, ExpenseSplitEntry>(
                        currentTable: table,
                        referencedTable: $$SharedExpensesTableReferences
                            ._expenseSplitsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SharedExpensesTableReferences(db, table, p0)
                                .expenseSplitsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.expenseFk == item.expensePk),
                        typedResults: items),
                  if (groupActivityRefs)
                    await $_getPrefetchedData<SharedExpenseEntry,
                            $SharedExpensesTable, GroupActivityEntry>(
                        currentTable: table,
                        referencedTable: $$SharedExpensesTableReferences
                            ._groupActivityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SharedExpensesTableReferences(db, table, p0)
                                .groupActivityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.relatedExpenseFk == item.expensePk),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SharedExpensesTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $SharedExpensesTable,
    SharedExpenseEntry,
    $$SharedExpensesTableFilterComposer,
    $$SharedExpensesTableOrderingComposer,
    $$SharedExpensesTableAnnotationComposer,
    $$SharedExpensesTableCreateCompanionBuilder,
    $$SharedExpensesTableUpdateCompanionBuilder,
    (SharedExpenseEntry, $$SharedExpensesTableReferences),
    SharedExpenseEntry,
    PrefetchHooks Function(
        {bool groupFk,
        bool categoryFk,
        bool expenseSplitsRefs,
        bool groupActivityRefs})>;
typedef $$ExpenseSplitsTableCreateCompanionBuilder = ExpenseSplitsCompanion
    Function({
  Value<String> splitPk,
  required String expenseFk,
  required String userEmail,
  required double shareAmount,
  Value<double> paidAmount,
  Value<bool> isPaid,
  Value<int> rowid,
});
typedef $$ExpenseSplitsTableUpdateCompanionBuilder = ExpenseSplitsCompanion
    Function({
  Value<String> splitPk,
  Value<String> expenseFk,
  Value<String> userEmail,
  Value<double> shareAmount,
  Value<double> paidAmount,
  Value<bool> isPaid,
  Value<int> rowid,
});

final class $$ExpenseSplitsTableReferences extends BaseReferences<
    _$FinanceDatabase, $ExpenseSplitsTable, ExpenseSplitEntry> {
  $$ExpenseSplitsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $SharedExpensesTable _expenseFkTable(_$FinanceDatabase db) =>
      db.sharedExpenses.createAlias($_aliasNameGenerator(
          db.expenseSplits.expenseFk, db.sharedExpenses.expensePk));

  $$SharedExpensesTableProcessedTableManager get expenseFk {
    final $_column = $_itemColumn<String>('expense_fk')!;

    final manager = $$SharedExpensesTableTableManager($_db, $_db.sharedExpenses)
        .filter((f) => f.expensePk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_expenseFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ExpenseSplitsTableFilterComposer
    extends Composer<_$FinanceDatabase, $ExpenseSplitsTable> {
  $$ExpenseSplitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get splitPk => $composableBuilder(
      column: $table.splitPk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userEmail => $composableBuilder(
      column: $table.userEmail, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get shareAmount => $composableBuilder(
      column: $table.shareAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPaid => $composableBuilder(
      column: $table.isPaid, builder: (column) => ColumnFilters(column));

  $$SharedExpensesTableFilterComposer get expenseFk {
    final $$SharedExpensesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.expenseFk,
        referencedTable: $db.sharedExpenses,
        getReferencedColumn: (t) => t.expensePk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SharedExpensesTableFilterComposer(
              $db: $db,
              $table: $db.sharedExpenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpenseSplitsTableOrderingComposer
    extends Composer<_$FinanceDatabase, $ExpenseSplitsTable> {
  $$ExpenseSplitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get splitPk => $composableBuilder(
      column: $table.splitPk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userEmail => $composableBuilder(
      column: $table.userEmail, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get shareAmount => $composableBuilder(
      column: $table.shareAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPaid => $composableBuilder(
      column: $table.isPaid, builder: (column) => ColumnOrderings(column));

  $$SharedExpensesTableOrderingComposer get expenseFk {
    final $$SharedExpensesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.expenseFk,
        referencedTable: $db.sharedExpenses,
        getReferencedColumn: (t) => t.expensePk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SharedExpensesTableOrderingComposer(
              $db: $db,
              $table: $db.sharedExpenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpenseSplitsTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $ExpenseSplitsTable> {
  $$ExpenseSplitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get splitPk =>
      $composableBuilder(column: $table.splitPk, builder: (column) => column);

  GeneratedColumn<String> get userEmail =>
      $composableBuilder(column: $table.userEmail, builder: (column) => column);

  GeneratedColumn<double> get shareAmount => $composableBuilder(
      column: $table.shareAmount, builder: (column) => column);

  GeneratedColumn<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => column);

  GeneratedColumn<bool> get isPaid =>
      $composableBuilder(column: $table.isPaid, builder: (column) => column);

  $$SharedExpensesTableAnnotationComposer get expenseFk {
    final $$SharedExpensesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.expenseFk,
        referencedTable: $db.sharedExpenses,
        getReferencedColumn: (t) => t.expensePk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SharedExpensesTableAnnotationComposer(
              $db: $db,
              $table: $db.sharedExpenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpenseSplitsTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $ExpenseSplitsTable,
    ExpenseSplitEntry,
    $$ExpenseSplitsTableFilterComposer,
    $$ExpenseSplitsTableOrderingComposer,
    $$ExpenseSplitsTableAnnotationComposer,
    $$ExpenseSplitsTableCreateCompanionBuilder,
    $$ExpenseSplitsTableUpdateCompanionBuilder,
    (ExpenseSplitEntry, $$ExpenseSplitsTableReferences),
    ExpenseSplitEntry,
    PrefetchHooks Function({bool expenseFk})> {
  $$ExpenseSplitsTableTableManager(
      _$FinanceDatabase db, $ExpenseSplitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpenseSplitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpenseSplitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpenseSplitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> splitPk = const Value.absent(),
            Value<String> expenseFk = const Value.absent(),
            Value<String> userEmail = const Value.absent(),
            Value<double> shareAmount = const Value.absent(),
            Value<double> paidAmount = const Value.absent(),
            Value<bool> isPaid = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExpenseSplitsCompanion(
            splitPk: splitPk,
            expenseFk: expenseFk,
            userEmail: userEmail,
            shareAmount: shareAmount,
            paidAmount: paidAmount,
            isPaid: isPaid,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> splitPk = const Value.absent(),
            required String expenseFk,
            required String userEmail,
            required double shareAmount,
            Value<double> paidAmount = const Value.absent(),
            Value<bool> isPaid = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExpenseSplitsCompanion.insert(
            splitPk: splitPk,
            expenseFk: expenseFk,
            userEmail: userEmail,
            shareAmount: shareAmount,
            paidAmount: paidAmount,
            isPaid: isPaid,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExpenseSplitsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({expenseFk = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (expenseFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.expenseFk,
                    referencedTable:
                        $$ExpenseSplitsTableReferences._expenseFkTable(db),
                    referencedColumn: $$ExpenseSplitsTableReferences
                        ._expenseFkTable(db)
                        .expensePk,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ExpenseSplitsTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $ExpenseSplitsTable,
    ExpenseSplitEntry,
    $$ExpenseSplitsTableFilterComposer,
    $$ExpenseSplitsTableOrderingComposer,
    $$ExpenseSplitsTableAnnotationComposer,
    $$ExpenseSplitsTableCreateCompanionBuilder,
    $$ExpenseSplitsTableUpdateCompanionBuilder,
    (ExpenseSplitEntry, $$ExpenseSplitsTableReferences),
    ExpenseSplitEntry,
    PrefetchHooks Function({bool expenseFk})>;
typedef $$GroupBalancesTableCreateCompanionBuilder = GroupBalancesCompanion
    Function({
  Value<String> balancePk,
  required String groupFk,
  required String fromUserEmail,
  required String toUserEmail,
  required double amount,
  required String currency,
  Value<DateTime> lastUpdated,
  Value<int> rowid,
});
typedef $$GroupBalancesTableUpdateCompanionBuilder = GroupBalancesCompanion
    Function({
  Value<String> balancePk,
  Value<String> groupFk,
  Value<String> fromUserEmail,
  Value<String> toUserEmail,
  Value<double> amount,
  Value<String> currency,
  Value<DateTime> lastUpdated,
  Value<int> rowid,
});

final class $$GroupBalancesTableReferences extends BaseReferences<
    _$FinanceDatabase, $GroupBalancesTable, GroupBalanceEntry> {
  $$GroupBalancesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $GroupsTable _groupFkTable(_$FinanceDatabase db) =>
      db.groups.createAlias(
          $_aliasNameGenerator(db.groupBalances.groupFk, db.groups.groupPk));

  $$GroupsTableProcessedTableManager get groupFk {
    final $_column = $_itemColumn<String>('group_fk')!;

    final manager = $$GroupsTableTableManager($_db, $_db.groups)
        .filter((f) => f.groupPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$GroupBalancesTableFilterComposer
    extends Composer<_$FinanceDatabase, $GroupBalancesTable> {
  $$GroupBalancesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get balancePk => $composableBuilder(
      column: $table.balancePk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fromUserEmail => $composableBuilder(
      column: $table.fromUserEmail, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get toUserEmail => $composableBuilder(
      column: $table.toUserEmail, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));

  $$GroupsTableFilterComposer get groupFk {
    final $$GroupsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupFk,
        referencedTable: $db.groups,
        getReferencedColumn: (t) => t.groupPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupsTableFilterComposer(
              $db: $db,
              $table: $db.groups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GroupBalancesTableOrderingComposer
    extends Composer<_$FinanceDatabase, $GroupBalancesTable> {
  $$GroupBalancesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get balancePk => $composableBuilder(
      column: $table.balancePk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fromUserEmail => $composableBuilder(
      column: $table.fromUserEmail,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get toUserEmail => $composableBuilder(
      column: $table.toUserEmail, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));

  $$GroupsTableOrderingComposer get groupFk {
    final $$GroupsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupFk,
        referencedTable: $db.groups,
        getReferencedColumn: (t) => t.groupPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupsTableOrderingComposer(
              $db: $db,
              $table: $db.groups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GroupBalancesTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $GroupBalancesTable> {
  $$GroupBalancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get balancePk =>
      $composableBuilder(column: $table.balancePk, builder: (column) => column);

  GeneratedColumn<String> get fromUserEmail => $composableBuilder(
      column: $table.fromUserEmail, builder: (column) => column);

  GeneratedColumn<String> get toUserEmail => $composableBuilder(
      column: $table.toUserEmail, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);

  $$GroupsTableAnnotationComposer get groupFk {
    final $$GroupsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupFk,
        referencedTable: $db.groups,
        getReferencedColumn: (t) => t.groupPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupsTableAnnotationComposer(
              $db: $db,
              $table: $db.groups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GroupBalancesTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $GroupBalancesTable,
    GroupBalanceEntry,
    $$GroupBalancesTableFilterComposer,
    $$GroupBalancesTableOrderingComposer,
    $$GroupBalancesTableAnnotationComposer,
    $$GroupBalancesTableCreateCompanionBuilder,
    $$GroupBalancesTableUpdateCompanionBuilder,
    (GroupBalanceEntry, $$GroupBalancesTableReferences),
    GroupBalanceEntry,
    PrefetchHooks Function({bool groupFk})> {
  $$GroupBalancesTableTableManager(
      _$FinanceDatabase db, $GroupBalancesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupBalancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupBalancesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupBalancesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> balancePk = const Value.absent(),
            Value<String> groupFk = const Value.absent(),
            Value<String> fromUserEmail = const Value.absent(),
            Value<String> toUserEmail = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupBalancesCompanion(
            balancePk: balancePk,
            groupFk: groupFk,
            fromUserEmail: fromUserEmail,
            toUserEmail: toUserEmail,
            amount: amount,
            currency: currency,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> balancePk = const Value.absent(),
            required String groupFk,
            required String fromUserEmail,
            required String toUserEmail,
            required double amount,
            required String currency,
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupBalancesCompanion.insert(
            balancePk: balancePk,
            groupFk: groupFk,
            fromUserEmail: fromUserEmail,
            toUserEmail: toUserEmail,
            amount: amount,
            currency: currency,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GroupBalancesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({groupFk = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (groupFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.groupFk,
                    referencedTable:
                        $$GroupBalancesTableReferences._groupFkTable(db),
                    referencedColumn: $$GroupBalancesTableReferences
                        ._groupFkTable(db)
                        .groupPk,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$GroupBalancesTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $GroupBalancesTable,
    GroupBalanceEntry,
    $$GroupBalancesTableFilterComposer,
    $$GroupBalancesTableOrderingComposer,
    $$GroupBalancesTableAnnotationComposer,
    $$GroupBalancesTableCreateCompanionBuilder,
    $$GroupBalancesTableUpdateCompanionBuilder,
    (GroupBalanceEntry, $$GroupBalancesTableReferences),
    GroupBalanceEntry,
    PrefetchHooks Function({bool groupFk})>;
typedef $$SettlementsTableCreateCompanionBuilder = SettlementsCompanion
    Function({
  Value<String> settlementPk,
  required String groupFk,
  required String fromUserEmail,
  required String toUserEmail,
  required double amount,
  required String currency,
  Value<String?> paymentMethod,
  Value<String?> notes,
  Value<DateTime> dateCreated,
  Value<int> rowid,
});
typedef $$SettlementsTableUpdateCompanionBuilder = SettlementsCompanion
    Function({
  Value<String> settlementPk,
  Value<String> groupFk,
  Value<String> fromUserEmail,
  Value<String> toUserEmail,
  Value<double> amount,
  Value<String> currency,
  Value<String?> paymentMethod,
  Value<String?> notes,
  Value<DateTime> dateCreated,
  Value<int> rowid,
});

final class $$SettlementsTableReferences extends BaseReferences<
    _$FinanceDatabase, $SettlementsTable, SettlementEntry> {
  $$SettlementsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GroupsTable _groupFkTable(_$FinanceDatabase db) =>
      db.groups.createAlias(
          $_aliasNameGenerator(db.settlements.groupFk, db.groups.groupPk));

  $$GroupsTableProcessedTableManager get groupFk {
    final $_column = $_itemColumn<String>('group_fk')!;

    final manager = $$GroupsTableTableManager($_db, $_db.groups)
        .filter((f) => f.groupPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$GroupActivityTable, List<GroupActivityEntry>>
      _groupActivityRefsTable(_$FinanceDatabase db) =>
          MultiTypedResultKey.fromTable(db.groupActivity,
              aliasName: $_aliasNameGenerator(db.settlements.settlementPk,
                  db.groupActivity.relatedSettlementFk));

  $$GroupActivityTableProcessedTableManager get groupActivityRefs {
    final manager = $$GroupActivityTableTableManager($_db, $_db.groupActivity)
        .filter((f) => f.relatedSettlementFk.settlementPk
            .sqlEquals($_itemColumn<String>('settlement_pk')!));

    final cache = $_typedResult.readTableOrNull(_groupActivityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SettlementsTableFilterComposer
    extends Composer<_$FinanceDatabase, $SettlementsTable> {
  $$SettlementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get settlementPk => $composableBuilder(
      column: $table.settlementPk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fromUserEmail => $composableBuilder(
      column: $table.fromUserEmail, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get toUserEmail => $composableBuilder(
      column: $table.toUserEmail, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  $$GroupsTableFilterComposer get groupFk {
    final $$GroupsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupFk,
        referencedTable: $db.groups,
        getReferencedColumn: (t) => t.groupPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupsTableFilterComposer(
              $db: $db,
              $table: $db.groups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> groupActivityRefs(
      Expression<bool> Function($$GroupActivityTableFilterComposer f) f) {
    final $$GroupActivityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.settlementPk,
        referencedTable: $db.groupActivity,
        getReferencedColumn: (t) => t.relatedSettlementFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupActivityTableFilterComposer(
              $db: $db,
              $table: $db.groupActivity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SettlementsTableOrderingComposer
    extends Composer<_$FinanceDatabase, $SettlementsTable> {
  $$SettlementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get settlementPk => $composableBuilder(
      column: $table.settlementPk,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fromUserEmail => $composableBuilder(
      column: $table.fromUserEmail,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get toUserEmail => $composableBuilder(
      column: $table.toUserEmail, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  $$GroupsTableOrderingComposer get groupFk {
    final $$GroupsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupFk,
        referencedTable: $db.groups,
        getReferencedColumn: (t) => t.groupPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupsTableOrderingComposer(
              $db: $db,
              $table: $db.groups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SettlementsTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $SettlementsTable> {
  $$SettlementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get settlementPk => $composableBuilder(
      column: $table.settlementPk, builder: (column) => column);

  GeneratedColumn<String> get fromUserEmail => $composableBuilder(
      column: $table.fromUserEmail, builder: (column) => column);

  GeneratedColumn<String> get toUserEmail => $composableBuilder(
      column: $table.toUserEmail, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  $$GroupsTableAnnotationComposer get groupFk {
    final $$GroupsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupFk,
        referencedTable: $db.groups,
        getReferencedColumn: (t) => t.groupPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupsTableAnnotationComposer(
              $db: $db,
              $table: $db.groups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> groupActivityRefs<T extends Object>(
      Expression<T> Function($$GroupActivityTableAnnotationComposer a) f) {
    final $$GroupActivityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.settlementPk,
        referencedTable: $db.groupActivity,
        getReferencedColumn: (t) => t.relatedSettlementFk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupActivityTableAnnotationComposer(
              $db: $db,
              $table: $db.groupActivity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SettlementsTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $SettlementsTable,
    SettlementEntry,
    $$SettlementsTableFilterComposer,
    $$SettlementsTableOrderingComposer,
    $$SettlementsTableAnnotationComposer,
    $$SettlementsTableCreateCompanionBuilder,
    $$SettlementsTableUpdateCompanionBuilder,
    (SettlementEntry, $$SettlementsTableReferences),
    SettlementEntry,
    PrefetchHooks Function({bool groupFk, bool groupActivityRefs})> {
  $$SettlementsTableTableManager(_$FinanceDatabase db, $SettlementsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettlementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettlementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettlementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> settlementPk = const Value.absent(),
            Value<String> groupFk = const Value.absent(),
            Value<String> fromUserEmail = const Value.absent(),
            Value<String> toUserEmail = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<String?> paymentMethod = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SettlementsCompanion(
            settlementPk: settlementPk,
            groupFk: groupFk,
            fromUserEmail: fromUserEmail,
            toUserEmail: toUserEmail,
            amount: amount,
            currency: currency,
            paymentMethod: paymentMethod,
            notes: notes,
            dateCreated: dateCreated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> settlementPk = const Value.absent(),
            required String groupFk,
            required String fromUserEmail,
            required String toUserEmail,
            required double amount,
            required String currency,
            Value<String?> paymentMethod = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SettlementsCompanion.insert(
            settlementPk: settlementPk,
            groupFk: groupFk,
            fromUserEmail: fromUserEmail,
            toUserEmail: toUserEmail,
            amount: amount,
            currency: currency,
            paymentMethod: paymentMethod,
            notes: notes,
            dateCreated: dateCreated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SettlementsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {groupFk = false, groupActivityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (groupActivityRefs) db.groupActivity
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (groupFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.groupFk,
                    referencedTable:
                        $$SettlementsTableReferences._groupFkTable(db),
                    referencedColumn:
                        $$SettlementsTableReferences._groupFkTable(db).groupPk,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (groupActivityRefs)
                    await $_getPrefetchedData<SettlementEntry,
                            $SettlementsTable, GroupActivityEntry>(
                        currentTable: table,
                        referencedTable: $$SettlementsTableReferences
                            ._groupActivityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SettlementsTableReferences(db, table, p0)
                                .groupActivityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) =>
                                    e.relatedSettlementFk == item.settlementPk),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SettlementsTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $SettlementsTable,
    SettlementEntry,
    $$SettlementsTableFilterComposer,
    $$SettlementsTableOrderingComposer,
    $$SettlementsTableAnnotationComposer,
    $$SettlementsTableCreateCompanionBuilder,
    $$SettlementsTableUpdateCompanionBuilder,
    (SettlementEntry, $$SettlementsTableReferences),
    SettlementEntry,
    PrefetchHooks Function({bool groupFk, bool groupActivityRefs})>;
typedef $$GroupActivityTableCreateCompanionBuilder = GroupActivityCompanion
    Function({
  Value<String> activityPk,
  required String groupFk,
  required String activityType,
  required String performedBy,
  required String description,
  Value<String?> relatedExpenseFk,
  Value<String?> relatedSettlementFk,
  Value<DateTime> dateCreated,
  Value<int> rowid,
});
typedef $$GroupActivityTableUpdateCompanionBuilder = GroupActivityCompanion
    Function({
  Value<String> activityPk,
  Value<String> groupFk,
  Value<String> activityType,
  Value<String> performedBy,
  Value<String> description,
  Value<String?> relatedExpenseFk,
  Value<String?> relatedSettlementFk,
  Value<DateTime> dateCreated,
  Value<int> rowid,
});

final class $$GroupActivityTableReferences extends BaseReferences<
    _$FinanceDatabase, $GroupActivityTable, GroupActivityEntry> {
  $$GroupActivityTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $GroupsTable _groupFkTable(_$FinanceDatabase db) =>
      db.groups.createAlias(
          $_aliasNameGenerator(db.groupActivity.groupFk, db.groups.groupPk));

  $$GroupsTableProcessedTableManager get groupFk {
    final $_column = $_itemColumn<String>('group_fk')!;

    final manager = $$GroupsTableTableManager($_db, $_db.groups)
        .filter((f) => f.groupPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SharedExpensesTable _relatedExpenseFkTable(_$FinanceDatabase db) =>
      db.sharedExpenses.createAlias($_aliasNameGenerator(
          db.groupActivity.relatedExpenseFk, db.sharedExpenses.expensePk));

  $$SharedExpensesTableProcessedTableManager? get relatedExpenseFk {
    final $_column = $_itemColumn<String>('related_expense_fk');
    if ($_column == null) return null;
    final manager = $$SharedExpensesTableTableManager($_db, $_db.sharedExpenses)
        .filter((f) => f.expensePk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_relatedExpenseFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SettlementsTable _relatedSettlementFkTable(_$FinanceDatabase db) =>
      db.settlements.createAlias($_aliasNameGenerator(
          db.groupActivity.relatedSettlementFk, db.settlements.settlementPk));

  $$SettlementsTableProcessedTableManager? get relatedSettlementFk {
    final $_column = $_itemColumn<String>('related_settlement_fk');
    if ($_column == null) return null;
    final manager = $$SettlementsTableTableManager($_db, $_db.settlements)
        .filter((f) => f.settlementPk.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_relatedSettlementFkTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$GroupActivityTableFilterComposer
    extends Composer<_$FinanceDatabase, $GroupActivityTable> {
  $$GroupActivityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get activityPk => $composableBuilder(
      column: $table.activityPk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get activityType => $composableBuilder(
      column: $table.activityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get performedBy => $composableBuilder(
      column: $table.performedBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  $$GroupsTableFilterComposer get groupFk {
    final $$GroupsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupFk,
        referencedTable: $db.groups,
        getReferencedColumn: (t) => t.groupPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupsTableFilterComposer(
              $db: $db,
              $table: $db.groups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SharedExpensesTableFilterComposer get relatedExpenseFk {
    final $$SharedExpensesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.relatedExpenseFk,
        referencedTable: $db.sharedExpenses,
        getReferencedColumn: (t) => t.expensePk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SharedExpensesTableFilterComposer(
              $db: $db,
              $table: $db.sharedExpenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SettlementsTableFilterComposer get relatedSettlementFk {
    final $$SettlementsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.relatedSettlementFk,
        referencedTable: $db.settlements,
        getReferencedColumn: (t) => t.settlementPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SettlementsTableFilterComposer(
              $db: $db,
              $table: $db.settlements,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GroupActivityTableOrderingComposer
    extends Composer<_$FinanceDatabase, $GroupActivityTable> {
  $$GroupActivityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get activityPk => $composableBuilder(
      column: $table.activityPk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activityType => $composableBuilder(
      column: $table.activityType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get performedBy => $composableBuilder(
      column: $table.performedBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  $$GroupsTableOrderingComposer get groupFk {
    final $$GroupsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupFk,
        referencedTable: $db.groups,
        getReferencedColumn: (t) => t.groupPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupsTableOrderingComposer(
              $db: $db,
              $table: $db.groups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SharedExpensesTableOrderingComposer get relatedExpenseFk {
    final $$SharedExpensesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.relatedExpenseFk,
        referencedTable: $db.sharedExpenses,
        getReferencedColumn: (t) => t.expensePk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SharedExpensesTableOrderingComposer(
              $db: $db,
              $table: $db.sharedExpenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SettlementsTableOrderingComposer get relatedSettlementFk {
    final $$SettlementsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.relatedSettlementFk,
        referencedTable: $db.settlements,
        getReferencedColumn: (t) => t.settlementPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SettlementsTableOrderingComposer(
              $db: $db,
              $table: $db.settlements,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GroupActivityTableAnnotationComposer
    extends Composer<_$FinanceDatabase, $GroupActivityTable> {
  $$GroupActivityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get activityPk => $composableBuilder(
      column: $table.activityPk, builder: (column) => column);

  GeneratedColumn<String> get activityType => $composableBuilder(
      column: $table.activityType, builder: (column) => column);

  GeneratedColumn<String> get performedBy => $composableBuilder(
      column: $table.performedBy, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  $$GroupsTableAnnotationComposer get groupFk {
    final $$GroupsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupFk,
        referencedTable: $db.groups,
        getReferencedColumn: (t) => t.groupPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupsTableAnnotationComposer(
              $db: $db,
              $table: $db.groups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SharedExpensesTableAnnotationComposer get relatedExpenseFk {
    final $$SharedExpensesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.relatedExpenseFk,
        referencedTable: $db.sharedExpenses,
        getReferencedColumn: (t) => t.expensePk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SharedExpensesTableAnnotationComposer(
              $db: $db,
              $table: $db.sharedExpenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SettlementsTableAnnotationComposer get relatedSettlementFk {
    final $$SettlementsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.relatedSettlementFk,
        referencedTable: $db.settlements,
        getReferencedColumn: (t) => t.settlementPk,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SettlementsTableAnnotationComposer(
              $db: $db,
              $table: $db.settlements,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GroupActivityTableTableManager extends RootTableManager<
    _$FinanceDatabase,
    $GroupActivityTable,
    GroupActivityEntry,
    $$GroupActivityTableFilterComposer,
    $$GroupActivityTableOrderingComposer,
    $$GroupActivityTableAnnotationComposer,
    $$GroupActivityTableCreateCompanionBuilder,
    $$GroupActivityTableUpdateCompanionBuilder,
    (GroupActivityEntry, $$GroupActivityTableReferences),
    GroupActivityEntry,
    PrefetchHooks Function(
        {bool groupFk, bool relatedExpenseFk, bool relatedSettlementFk})> {
  $$GroupActivityTableTableManager(
      _$FinanceDatabase db, $GroupActivityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupActivityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupActivityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupActivityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> activityPk = const Value.absent(),
            Value<String> groupFk = const Value.absent(),
            Value<String> activityType = const Value.absent(),
            Value<String> performedBy = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String?> relatedExpenseFk = const Value.absent(),
            Value<String?> relatedSettlementFk = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupActivityCompanion(
            activityPk: activityPk,
            groupFk: groupFk,
            activityType: activityType,
            performedBy: performedBy,
            description: description,
            relatedExpenseFk: relatedExpenseFk,
            relatedSettlementFk: relatedSettlementFk,
            dateCreated: dateCreated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> activityPk = const Value.absent(),
            required String groupFk,
            required String activityType,
            required String performedBy,
            required String description,
            Value<String?> relatedExpenseFk = const Value.absent(),
            Value<String?> relatedSettlementFk = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupActivityCompanion.insert(
            activityPk: activityPk,
            groupFk: groupFk,
            activityType: activityType,
            performedBy: performedBy,
            description: description,
            relatedExpenseFk: relatedExpenseFk,
            relatedSettlementFk: relatedSettlementFk,
            dateCreated: dateCreated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GroupActivityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {groupFk = false,
              relatedExpenseFk = false,
              relatedSettlementFk = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (groupFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.groupFk,
                    referencedTable:
                        $$GroupActivityTableReferences._groupFkTable(db),
                    referencedColumn: $$GroupActivityTableReferences
                        ._groupFkTable(db)
                        .groupPk,
                  ) as T;
                }
                if (relatedExpenseFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.relatedExpenseFk,
                    referencedTable: $$GroupActivityTableReferences
                        ._relatedExpenseFkTable(db),
                    referencedColumn: $$GroupActivityTableReferences
                        ._relatedExpenseFkTable(db)
                        .expensePk,
                  ) as T;
                }
                if (relatedSettlementFk) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.relatedSettlementFk,
                    referencedTable: $$GroupActivityTableReferences
                        ._relatedSettlementFkTable(db),
                    referencedColumn: $$GroupActivityTableReferences
                        ._relatedSettlementFkTable(db)
                        .settlementPk,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$GroupActivityTableProcessedTableManager = ProcessedTableManager<
    _$FinanceDatabase,
    $GroupActivityTable,
    GroupActivityEntry,
    $$GroupActivityTableFilterComposer,
    $$GroupActivityTableOrderingComposer,
    $$GroupActivityTableAnnotationComposer,
    $$GroupActivityTableCreateCompanionBuilder,
    $$GroupActivityTableUpdateCompanionBuilder,
    (GroupActivityEntry, $$GroupActivityTableReferences),
    GroupActivityEntry,
    PrefetchHooks Function(
        {bool groupFk, bool relatedExpenseFk, bool relatedSettlementFk})>;

class $FinanceDatabaseManager {
  final _$FinanceDatabase _db;
  $FinanceDatabaseManager(this._db);
  $$WalletsTableTableManager get wallets =>
      $$WalletsTableTableManager(_db, _db.wallets);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$ObjectivesTableTableManager get objectives =>
      $$ObjectivesTableTableManager(_db, _db.objectives);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$BudgetsTableTableManager get budgets =>
      $$BudgetsTableTableManager(_db, _db.budgets);
  $$CategoryBudgetLimitsTableTableManager get categoryBudgetLimits =>
      $$CategoryBudgetLimitsTableTableManager(_db, _db.categoryBudgetLimits);
  $$AssociatedTitlesTableTableManager get associatedTitles =>
      $$AssociatedTitlesTableTableManager(_db, _db.associatedTitles);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$ScannerTemplatesTableTableManager get scannerTemplates =>
      $$ScannerTemplatesTableTableManager(_db, _db.scannerTemplates);
  $$DeleteLogsTableTableManager get deleteLogs =>
      $$DeleteLogsTableTableManager(_db, _db.deleteLogs);
  $$GroupsTableTableManager get groups =>
      $$GroupsTableTableManager(_db, _db.groups);
  $$GroupMembersTableTableManager get groupMembers =>
      $$GroupMembersTableTableManager(_db, _db.groupMembers);
  $$SharedExpensesTableTableManager get sharedExpenses =>
      $$SharedExpensesTableTableManager(_db, _db.sharedExpenses);
  $$ExpenseSplitsTableTableManager get expenseSplits =>
      $$ExpenseSplitsTableTableManager(_db, _db.expenseSplits);
  $$GroupBalancesTableTableManager get groupBalances =>
      $$GroupBalancesTableTableManager(_db, _db.groupBalances);
  $$SettlementsTableTableManager get settlements =>
      $$SettlementsTableTableManager(_db, _db.settlements);
  $$GroupActivityTableTableManager get groupActivity =>
      $$GroupActivityTableTableManager(_db, _db.groupActivity);
}
