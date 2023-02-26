// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomMessage _$CustomMessageFromJson(Map<String, dynamic> json) {
  return _CustomMessage.fromJson(json);
}

/// @nodoc
mixin _$CustomMessage {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomMessageCopyWith<CustomMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomMessageCopyWith<$Res> {
  factory $CustomMessageCopyWith(
          CustomMessage value, $Res Function(CustomMessage) then) =
      _$CustomMessageCopyWithImpl<$Res, CustomMessage>;
  @useResult
  $Res call(
      {String? id, String name, String text, String uid, DateTime createdAt});
}

/// @nodoc
class _$CustomMessageCopyWithImpl<$Res, $Val extends CustomMessage>
    implements $CustomMessageCopyWith<$Res> {
  _$CustomMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? text = null,
    Object? uid = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomMessageCopyWith<$Res>
    implements $CustomMessageCopyWith<$Res> {
  factory _$$_CustomMessageCopyWith(
          _$_CustomMessage value, $Res Function(_$_CustomMessage) then) =
      __$$_CustomMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, String name, String text, String uid, DateTime createdAt});
}

/// @nodoc
class __$$_CustomMessageCopyWithImpl<$Res>
    extends _$CustomMessageCopyWithImpl<$Res, _$_CustomMessage>
    implements _$$_CustomMessageCopyWith<$Res> {
  __$$_CustomMessageCopyWithImpl(
      _$_CustomMessage _value, $Res Function(_$_CustomMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? text = null,
    Object? uid = null,
    Object? createdAt = null,
  }) {
    return _then(_$_CustomMessage(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomMessage extends _CustomMessage {
  const _$_CustomMessage(
      {this.id,
      required this.name,
      required this.text,
      required this.uid,
      required this.createdAt})
      : super._();

  factory _$_CustomMessage.fromJson(Map<String, dynamic> json) =>
      _$$_CustomMessageFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String text;
  @override
  final String uid;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'CustomMessage(id: $id, name: $name, text: $text, uid: $uid, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomMessage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, text, uid, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomMessageCopyWith<_$_CustomMessage> get copyWith =>
      __$$_CustomMessageCopyWithImpl<_$_CustomMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomMessageToJson(
      this,
    );
  }
}

abstract class _CustomMessage extends CustomMessage {
  const factory _CustomMessage(
      {final String? id,
      required final String name,
      required final String text,
      required final String uid,
      required final DateTime createdAt}) = _$_CustomMessage;
  const _CustomMessage._() : super._();

  factory _CustomMessage.fromJson(Map<String, dynamic> json) =
      _$_CustomMessage.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get text;
  @override
  String get uid;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_CustomMessageCopyWith<_$_CustomMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
