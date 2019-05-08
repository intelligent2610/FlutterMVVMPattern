// GENERATED CODE - DO NOT MODIFY BY HAND

part of userProfile;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserProfile> _$userProfileSerializer = new _$UserProfileSerializer();

class _$UserProfileSerializer implements StructuredSerializer<UserProfile> {
  @override
  final Iterable<Type> types = const [UserProfile, _$UserProfile];
  @override
  final String wireName = 'UserProfile';

  @override
  Iterable serialize(Serializers serializers, UserProfile object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'access_token',
      serializers.serialize(object.access_token,
          specifiedType: const FullType(String)),
      'token_type',
      serializers.serialize(object.token_type,
          specifiedType: const FullType(String)),
      'refresh_token',
      serializers.serialize(object.refresh_token,
          specifiedType: const FullType(String)),
      'userData',
      serializers.serialize(object.userData,
          specifiedType: const FullType(UserData)),
    ];

    return result;
  }

  @override
  UserProfile deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserProfileBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'access_token':
          result.access_token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'token_type':
          result.token_type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'refresh_token':
          result.refresh_token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userData':
          result.userData.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserData)) as UserData);
          break;
      }
    }

    return result.build();
  }
}

class _$UserProfile extends UserProfile {
  @override
  final String access_token;
  @override
  final String token_type;
  @override
  final String refresh_token;
  @override
  final UserData userData;

  factory _$UserProfile([void Function(UserProfileBuilder) updates]) =>
      (new UserProfileBuilder()..update(updates)).build();

  _$UserProfile._(
      {this.access_token, this.token_type, this.refresh_token, this.userData})
      : super._() {
    if (access_token == null) {
      throw new BuiltValueNullFieldError('UserProfile', 'access_token');
    }
    if (token_type == null) {
      throw new BuiltValueNullFieldError('UserProfile', 'token_type');
    }
    if (refresh_token == null) {
      throw new BuiltValueNullFieldError('UserProfile', 'refresh_token');
    }
    if (userData == null) {
      throw new BuiltValueNullFieldError('UserProfile', 'userData');
    }
  }

  @override
  UserProfile rebuild(void Function(UserProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserProfileBuilder toBuilder() => new UserProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserProfile &&
        access_token == other.access_token &&
        token_type == other.token_type &&
        refresh_token == other.refresh_token &&
        userData == other.userData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, access_token.hashCode), token_type.hashCode),
            refresh_token.hashCode),
        userData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserProfile')
          ..add('access_token', access_token)
          ..add('token_type', token_type)
          ..add('refresh_token', refresh_token)
          ..add('userData', userData))
        .toString();
  }
}

class UserProfileBuilder implements Builder<UserProfile, UserProfileBuilder> {
  _$UserProfile _$v;

  String _access_token;
  String get access_token => _$this._access_token;
  set access_token(String access_token) => _$this._access_token = access_token;

  String _token_type;
  String get token_type => _$this._token_type;
  set token_type(String token_type) => _$this._token_type = token_type;

  String _refresh_token;
  String get refresh_token => _$this._refresh_token;
  set refresh_token(String refresh_token) =>
      _$this._refresh_token = refresh_token;

  UserDataBuilder _userData;
  UserDataBuilder get userData => _$this._userData ??= new UserDataBuilder();
  set userData(UserDataBuilder userData) => _$this._userData = userData;

  UserProfileBuilder();

  UserProfileBuilder get _$this {
    if (_$v != null) {
      _access_token = _$v.access_token;
      _token_type = _$v.token_type;
      _refresh_token = _$v.refresh_token;
      _userData = _$v.userData?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserProfile other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserProfile;
  }

  @override
  void update(void Function(UserProfileBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserProfile build() {
    _$UserProfile _$result;
    try {
      _$result = _$v ??
          new _$UserProfile._(
              access_token: access_token,
              token_type: token_type,
              refresh_token: refresh_token,
              userData: userData.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userData';
        userData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserProfile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
