// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_vehicle;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const VehicleType _$car = const VehicleType._('car');
const VehicleType _$motorbike = const VehicleType._('motorbike');
const VehicleType _$train = const VehicleType._('train');
const VehicleType _$plane = const VehicleType._('plane');

VehicleType _$valueOf(String name) {
  switch (name) {
    case 'car':
      return _$car;
    case 'motorbike':
      return _$motorbike;
    case 'train':
      return _$train;
    case 'plane':
      return _$plane;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<VehicleType> _$values =
    new BuiltSet<VehicleType>(const <VehicleType>[
  _$car,
  _$motorbike,
  _$train,
  _$plane,
]);

Serializer<BuiltVehicle> _$builtVehicleSerializer =
    new _$BuiltVehicleSerializer();
Serializer<VehicleType> _$vehicleTypeSerializer = new _$VehicleTypeSerializer();

class _$BuiltVehicleSerializer implements StructuredSerializer<BuiltVehicle> {
  @override
  final Iterable<Type> types = const [BuiltVehicle, _$BuiltVehicle];
  @override
  final String wireName = 'BuiltVehicle';

  @override
  Iterable serialize(Serializers serializers, BuiltVehicle object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'brand',
      serializers.serialize(object.brand,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(VehicleType)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(double)),
      'passengerNames',
      serializers.serialize(object.passengerNames,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    if (object.somNullableValue != null) {
      result
        ..add('somNullableValue')
        ..add(serializers.serialize(object.somNullableValue,
            specifiedType: const FullType(bool)));
    }

    return result;
  }

  @override
  BuiltVehicle deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltVehicleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'brand':
          result.brand = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(VehicleType)) as VehicleType;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'somNullableValue':
          result.somNullableValue = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'passengerNames':
          result.passengerNames.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$VehicleTypeSerializer implements PrimitiveSerializer<VehicleType> {
  @override
  final Iterable<Type> types = const <Type>[VehicleType];
  @override
  final String wireName = 'VehicleType';

  @override
  Object serialize(Serializers serializers, VehicleType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  VehicleType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      VehicleType.valueOf(serialized as String);
}

class _$BuiltVehicle extends BuiltVehicle {
  @override
  final String brand;
  @override
  final VehicleType type;
  @override
  final double price;
  @override
  final bool somNullableValue;
  @override
  final BuiltList<String> passengerNames;

  factory _$BuiltVehicle([void Function(BuiltVehicleBuilder) updates]) =>
      (new BuiltVehicleBuilder()..update(updates)).build();

  _$BuiltVehicle._(
      {this.brand,
      this.type,
      this.price,
      this.somNullableValue,
      this.passengerNames})
      : super._() {
    if (brand == null) {
      throw new BuiltValueNullFieldError('BuiltVehicle', 'brand');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('BuiltVehicle', 'type');
    }
    if (price == null) {
      throw new BuiltValueNullFieldError('BuiltVehicle', 'price');
    }
    if (passengerNames == null) {
      throw new BuiltValueNullFieldError('BuiltVehicle', 'passengerNames');
    }
  }

  @override
  BuiltVehicle rebuild(void Function(BuiltVehicleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltVehicleBuilder toBuilder() => new BuiltVehicleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltVehicle &&
        brand == other.brand &&
        type == other.type &&
        price == other.price &&
        somNullableValue == other.somNullableValue &&
        passengerNames == other.passengerNames;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, brand.hashCode), type.hashCode), price.hashCode),
            somNullableValue.hashCode),
        passengerNames.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltVehicle')
          ..add('brand', brand)
          ..add('type', type)
          ..add('price', price)
          ..add('somNullableValue', somNullableValue)
          ..add('passengerNames', passengerNames))
        .toString();
  }
}

class BuiltVehicleBuilder
    implements Builder<BuiltVehicle, BuiltVehicleBuilder> {
  _$BuiltVehicle _$v;

  String _brand;
  String get brand => _$this._brand;
  set brand(String brand) => _$this._brand = brand;

  VehicleType _type;
  VehicleType get type => _$this._type;
  set type(VehicleType type) => _$this._type = type;

  double _price;
  double get price => _$this._price;
  set price(double price) => _$this._price = price;

  bool _somNullableValue;
  bool get somNullableValue => _$this._somNullableValue;
  set somNullableValue(bool somNullableValue) =>
      _$this._somNullableValue = somNullableValue;

  ListBuilder<String> _passengerNames;
  ListBuilder<String> get passengerNames =>
      _$this._passengerNames ??= new ListBuilder<String>();
  set passengerNames(ListBuilder<String> passengerNames) =>
      _$this._passengerNames = passengerNames;

  BuiltVehicleBuilder();

  BuiltVehicleBuilder get _$this {
    if (_$v != null) {
      _brand = _$v.brand;
      _type = _$v.type;
      _price = _$v.price;
      _somNullableValue = _$v.somNullableValue;
      _passengerNames = _$v.passengerNames?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltVehicle other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltVehicle;
  }

  @override
  void update(void Function(BuiltVehicleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltVehicle build() {
    _$BuiltVehicle _$result;
    try {
      _$result = _$v ??
          new _$BuiltVehicle._(
              brand: brand,
              type: type,
              price: price,
              somNullableValue: somNullableValue,
              passengerNames: passengerNames.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'passengerNames';
        passengerNames.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BuiltVehicle', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
