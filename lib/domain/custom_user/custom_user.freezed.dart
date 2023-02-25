// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomUser _$CustomUserFromJson(Map<String, dynamic> json) {
  return _CustomUser.fromJson(json);
}

/// @nodoc
mixin _$CustomUser {
  String? get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomUserCopyWith<CustomUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomUserCopyWith<$Res> {
  factory $CustomUserCopyWith(
          CustomUser value, $Res Function(CustomUser) then) =
      _$CustomUserCopyWithImpl<$Res, CustomUser>;
  @useResult
  $Res call({String? id, String email, String password, int point});
}

/// @nodoc
class _$CustomUserCopyWithImpl<$Res, $Val extends CustomUser>
    implements $CustomUserCopyWith<$Res> {
  _$CustomUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = null,
    Object? password = null,
    Object? point = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomUserCopyWith<$Res>
    implements $CustomUserCopyWith<$Res> {
  factory _$$_CustomUserCopyWith(
          _$_CustomUser value, $Res Function(_$_CustomUser) then) =
      __$$_CustomUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String email, String password, int point});
}

/// @nodoc
class __$$_CustomUserCopyWithImpl<$Res>
    extends _$CustomUserCopyWithImpl<$Res, _$_CustomUser>
    implements _$$_CustomUserCopyWith<$Res> {
  __$$_CustomUserCopyWithImpl(
      _$_CustomUser _value, $Res Function(_$_CustomUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = null,
    Object? password = null,
    Object? point = null,
  }) {
    return _then(_$_CustomUser(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomUser extends _CustomUser {
  const _$_CustomUser(
      {this.id,
      required this.email,
      required this.password,
      required this.point})
      : super._();

  factory _$_CustomUser.fromJson(Map<String, dynamic> json) =>
      _$$_CustomUserFromJson(json);

  @override
  final String? id;
  @override
  final String email;
  @override
  final String password;
  @override
  final int point;

  @override
  String toString() {
    return 'CustomUser(id: $id, email: $email, password: $password, point: $point)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.point, point) || other.point == point));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, password, point);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomUserCopyWith<_$_CustomUser> get copyWith =>
      __$$_CustomUserCopyWithImpl<_$_CustomUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomUserToJson(
      this,
    );
  }
}

abstract class _CustomUser extends CustomUser {
  const factory _CustomUser(
      {final String? id,
      required final String email,
      required final String password,
      required final int point}) = _$_CustomUser;
  const _CustomUser._() : super._();

  factory _CustomUser.fromJson(Map<String, dynamic> json) =
      _$_CustomUser.fromJson;

  @override
  String? get id;
  @override
  String get email;
  @override
  String get password;
  @override
  int get point;
  @override
  @JsonKey(ignore: true)
  _$$_CustomUserCopyWith<_$_CustomUser> get copyWith =>
      throw _privateConstructorUsedError;
}
