import 'package:blogapp/src/business_logic/blocs/signup_event.dart';
import 'package:blogapp/src/business_logic/blocs/signup_states.dart';
import 'package:blogapp/src/services/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState>{
  Repository _repository = Repository();
  SignUpBloc(SignUpState initialState) : super(initialState);

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async*{
    if (event is OnSignUpEvent){
      yield SignUpLoadingState();
      try {
        var _response = await _repository.userSignUp(event.name, event.email, event.password);
        if (_response['error']){
          yield SignUpFailedState(
            message: _response['status']
          );
        } else {
          yield SignUpSuccessState();
        }
      } catch(_){
        yield SignUpErrorState();
      }
    }
  }

}