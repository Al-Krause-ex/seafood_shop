part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpLoaded extends SignUpState {}

final class SignUpFailure extends SignUpState {
  const SignUpFailure({required this.error});

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}
