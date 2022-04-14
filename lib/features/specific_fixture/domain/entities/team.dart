import 'package:freezed_annotation/freezed_annotation.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  factory Team({required final int id, required final String name, required final String logo}) = _Team;
  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}