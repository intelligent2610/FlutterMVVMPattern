// GENERATED CODE - DO NOT MODIFY BY HAND

part of config;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Config> _$configSerializer = new _$ConfigSerializer();

class _$ConfigSerializer implements StructuredSerializer<Config> {
  @override
  final Iterable<Type> types = const [Config, _$Config];
  @override
  final String wireName = 'Config';

  @override
  Iterable serialize(Serializers serializers, Config object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'lang',
      serializers.serialize(object.lang, specifiedType: const FullType(String)),
      'langIcon',
      serializers.serialize(object.langIcon,
          specifiedType: const FullType(String)),
      'domain',
      serializers.serialize(object.domain,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Config deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'lang':
          result.lang = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'langIcon':
          result.langIcon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'domain':
          result.domain = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Config extends Config {
  @override
  final String lang;
  @override
  final String langIcon;
  @override
  final String domain;

  factory _$Config([void Function(ConfigBuilder) updates]) =>
      (new ConfigBuilder()..update(updates)).build();

  _$Config._({this.lang, this.langIcon, this.domain}) : super._() {
    if (lang == null) {
      throw new BuiltValueNullFieldError('Config', 'lang');
    }
    if (langIcon == null) {
      throw new BuiltValueNullFieldError('Config', 'langIcon');
    }
    if (domain == null) {
      throw new BuiltValueNullFieldError('Config', 'domain');
    }
  }

  @override
  Config rebuild(void Function(ConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigBuilder toBuilder() => new ConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Config &&
        lang == other.lang &&
        langIcon == other.langIcon &&
        domain == other.domain;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, lang.hashCode), langIcon.hashCode), domain.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Config')
          ..add('lang', lang)
          ..add('langIcon', langIcon)
          ..add('domain', domain))
        .toString();
  }
}

class ConfigBuilder implements Builder<Config, ConfigBuilder> {
  _$Config _$v;

  String _lang;
  String get lang => _$this._lang;
  set lang(String lang) => _$this._lang = lang;

  String _langIcon;
  String get langIcon => _$this._langIcon;
  set langIcon(String langIcon) => _$this._langIcon = langIcon;

  String _domain;
  String get domain => _$this._domain;
  set domain(String domain) => _$this._domain = domain;

  ConfigBuilder();

  ConfigBuilder get _$this {
    if (_$v != null) {
      _lang = _$v.lang;
      _langIcon = _$v.langIcon;
      _domain = _$v.domain;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Config other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Config;
  }

  @override
  void update(void Function(ConfigBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Config build() {
    final _$result =
        _$v ?? new _$Config._(lang: lang, langIcon: langIcon, domain: domain);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
