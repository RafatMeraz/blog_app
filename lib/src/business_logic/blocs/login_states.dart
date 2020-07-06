abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoggedInState extends LoginState {}

class LoginLoginFailedState extends LoginState {}

class LoginPasswordErrorState extends LoginState {}

class LoginEmailNotValidState extends LoginState {}

class LoginSuccessState extends LoginState {}