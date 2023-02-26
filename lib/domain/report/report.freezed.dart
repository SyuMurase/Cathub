// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
mixin _$Report {
  String? get id => throw _privateConstructorUsedError;
  String get reportUserEmail => throw _privateConstructorUsedError;
  String get accusedUserEmail => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportCopyWith<Report> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res, Report>;
  @useResult
  $Res call(
      {String? id,
      String reportUserEmail,
      String accusedUserEmail,
      String content});
}

/// @nodoc
class _$ReportCopyWithImpl<$Res, $Val extends Report>
    implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? reportUserEmail = null,
    Object? accusedUserEmail = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      reportUserEmail: null == reportUserEmail
          ? _value.reportUserEmail
          : reportUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
      accusedUserEmail: null == accusedUserEmail
          ? _value.accusedUserEmail
          : accusedUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$$_ReportCopyWith(_$_Report value, $Res Function(_$_Report) then) =
      __$$_ReportCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String reportUserEmail,
      String accusedUserEmail,
      String content});
}

/// @nodoc
class __$$_ReportCopyWithImpl<$Res>
    extends _$ReportCopyWithImpl<$Res, _$_Report>
    implements _$$_ReportCopyWith<$Res> {
  __$$_ReportCopyWithImpl(_$_Report _value, $Res Function(_$_Report) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? reportUserEmail = null,
    Object? accusedUserEmail = null,
    Object? content = null,
  }) {
    return _then(_$_Report(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      reportUserEmail: null == reportUserEmail
          ? _value.reportUserEmail
          : reportUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
      accusedUserEmail: null == accusedUserEmail
          ? _value.accusedUserEmail
          : accusedUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Report extends _Report {
  const _$_Report(
      {this.id,
      required this.reportUserEmail,
      required this.accusedUserEmail,
      required this.content})
      : super._();

  factory _$_Report.fromJson(Map<String, dynamic> json) =>
      _$$_ReportFromJson(json);

  @override
  final String? id;
  @override
  final String reportUserEmail;
  @override
  final String accusedUserEmail;
  @override
  final String content;

  @override
  String toString() {
    return 'Report(id: $id, reportUserEmail: $reportUserEmail, accusedUserEmail: $accusedUserEmail, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Report &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reportUserEmail, reportUserEmail) ||
                other.reportUserEmail == reportUserEmail) &&
            (identical(other.accusedUserEmail, accusedUserEmail) ||
                other.accusedUserEmail == accusedUserEmail) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, reportUserEmail, accusedUserEmail, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportCopyWith<_$_Report> get copyWith =>
      __$$_ReportCopyWithImpl<_$_Report>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportToJson(
      this,
    );
  }
}

abstract class _Report extends Report {
  const factory _Report(
      {final String? id,
      required final String reportUserEmail,
      required final String accusedUserEmail,
      required final String content}) = _$_Report;
  const _Report._() : super._();

  factory _Report.fromJson(Map<String, dynamic> json) = _$_Report.fromJson;

  @override
  String? get id;
  @override
  String get reportUserEmail;
  @override
  String get accusedUserEmail;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_ReportCopyWith<_$_Report> get copyWith =>
      throw _privateConstructorUsedError;
}
