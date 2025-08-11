// payment_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_meal_project/core/helper/firebase_helper.dart';
import 'package:monkey_meal_project/src/models/payment_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final FirebaseServices _firebaseServices;

  PaymentCubit({FirebaseServices? firebaseServices})
      : _firebaseServices = firebaseServices ?? FirebaseServices(),
        super(PaymentInitial());

  static PaymentCubit get(context) => BlocProvider.of(context, listen: false);

  Future<void> fetchPaymentMethods() async {
    emit(PaymentLoading());
    try {
      final payments = await _firebaseServices.getPaymentMethods();
      emit(PaymentLoaded(payments));
    } catch (e) {
      emit(PaymentError(e.toString()));
    }
  }

  Future<void> addPaymentMethod(PaymentModel payment) async {
    try {
      await _firebaseServices.addPaymentMethod(payment);
      await fetchPaymentMethods();
    } catch (e) {
      emit(PaymentError(e.toString()));
    }
  }

  Future<void> updatePaymentMethod(PaymentModel payment) async {
    try {
      await _firebaseServices.updatePaymentMethod(payment);
      await fetchPaymentMethods();
    } catch (e) {
      emit(PaymentError(e.toString()));
    }
  }

  Future<void> deletePaymentMethod(String paymentId) async {
    try {
      await _firebaseServices.deletePaymentMethod(paymentId);
      await fetchPaymentMethods();
    } catch (e) {
      emit(PaymentError(e.toString()));
    }
  }

  Future<void> setDefaultPaymentMethod(String paymentId) async {
    try {
      await _firebaseServices.setDefaultPaymentMethod(paymentId);
      await fetchPaymentMethods();
    } catch (e) {
      emit(PaymentError(e.toString()));
    }
  }
}