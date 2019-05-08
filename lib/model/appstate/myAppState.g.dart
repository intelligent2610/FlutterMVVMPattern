// GENERATED CODE - DO NOT MODIFY BY HAND

part of myAppState;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MyAppState> _$myAppStateSerializer = new _$MyAppStateSerializer();

class _$MyAppStateSerializer implements StructuredSerializer<MyAppState> {
  @override
  final Iterable<Type> types = const [MyAppState, _$MyAppState];
  @override
  final String wireName = 'MyAppState';

  @override
  Iterable serialize(Serializers serializers, MyAppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
      'userProfile',
      serializers.serialize(object.userProfile,
          specifiedType: const FullType(UserProfile)),
      'config',
      serializers.serialize(object.config,
          specifiedType: const FullType(Config)),
    ];

    return result;
  }

  @override
  MyAppState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MyAppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'userProfile':
          result.userProfile.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserProfile)) as UserProfile);
          break;
        case 'config':
          result.config.replace(serializers.deserialize(value,
              specifiedType: const FullType(Config)) as Config);
          break;
      }
    }

    return result.build();
  }
}

class _$MyAppState extends MyAppState {
  @override
  final bool isLoading;
  @override
  final UserProfile userProfile;
  @override
  final Config config;

  factory _$MyAppState([void Function(MyAppStateBuilder) updates]) =>
      (new MyAppStateBuilder()..update(updates)).build();

  _$MyAppState._({this.isLoading, this.userProfile, this.config}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('MyAppState', 'isLoading');
    }
    if (userProfile == null) {
      throw new BuiltValueNullFieldError('MyAppState', 'userProfile');
    }
    if (config == null) {
      throw new BuiltValueNullFieldError('MyAppState', 'config');
    }
  }

  @override
  MyAppState rebuild(void Function(MyAppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyAppStateBuilder toBuilder() => new MyAppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyAppState &&
        isLoading == other.isLoading &&
        userProfile == other.userProfile &&
        config == other.config;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, isLoading.hashCode), userProfile.hashCode),
        config.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MyAppState')
          ..add('isLoading', isLoading)
          ..add('userProfile', userProfile)
          ..add('config', config))
        .toString();
  }
}

class MyAppStateBuilder implements Builder<MyAppState, MyAppStateBuilder> {
  _$MyAppState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  UserProfileBuilder _userProfile;
  UserProfileBuilder get userProfile =>
      _$this._userProfile ??= new UserProfileBuilder();
  set userProfile(UserProfileBuilder userProfile) =>
      _$this._userProfile = userProfile;

  ConfigBuilder _config;
  ConfigBuilder get config => _$this._config ??= new ConfigBuilder();
  set config(ConfigBuilder config) => _$this._config = config;

  MyAppStateBuilder();

  MyAppStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _userProfile = _$v.userProfile?.toBuilder();
      _config = _$v.config?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyAppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MyAppState;
  }

  @override
  void update(void Function(MyAppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MyAppState build() {
    _$MyAppState _$result;
    try {
      _$result = _$v ??
          new _$MyAppState._(
              isLoading: isLoading,
              userProfile: userProfile.build(),
              config: config.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userProfile';
        userProfile.build();
        _$failedField = 'config';
        config.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MyAppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
