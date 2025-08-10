import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(const BottomNavChanged(2));

  int get currentIndex => (state as BottomNavChanged).index;

  void changeIndex(int newIndex) {
    emit(BottomNavChanged(newIndex));
  }
}
