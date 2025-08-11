import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_meal_project/core/helper/firebase_helper.dart';
import 'package:monkey_meal_project/src/models/item_model.dart';
import 'package:monkey_meal_project/src/models/order_model.dart';

part 'foods_state.dart';

class FoodsCubit extends Cubit<FoodsState> {
  FoodsCubit() : super(FoodsInitial());

  static FoodsCubit get(context) => BlocProvider.of(context, listen: false);

  Future<void> fetchFoods() async {
    emit(LoadFoodLoading());
    try {
      final foods = await FirebaseServices().getFoods();
      emit(SuccessLoadFood(foods));
    } catch (e, s) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $s");
      emit(FailedLoadFood(e.toString()));
    }
  }

  Future<void> toggleFavorite(String userId, ItemModel item) async {
    try {
      final isFav = await FirebaseServices().isFavorite(userId, item.itemName);
      if (isFav) {
        await FirebaseServices().removeFromFavorites(userId, item.itemName);
      } else {
        await FirebaseServices().addToFavorites(userId, item);
      }
    } catch (e, s) {
      debugPrint("Error toggling favorite: $e");
      debugPrint("Error toggling favorite: $s");
      rethrow;
    }
  }

  Future<void> addItemToOrder(String userId, ItemModel item, int quantity) async {
    try {
      await FirebaseServices().addToOrder(userId, item, quantity);
    } catch (e, s) {
      debugPrint("Error adding to order: $e");
      debugPrint("Error adding to order: $s");
      rethrow;
    }
  }

  Future<void> fetchUserOrders(String userId) async {
    emit(OrdersLoading());
    try {
      final orders = await FirebaseServices().getUserOrders(userId);
      emit(OrdersLoaded(orders));
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }

  Future<void> updateOrderStatus(String userId, String orderId, String status) async {
    try {
      await FirebaseServices().updateOrderStatus(userId, orderId, status);
      final currentState = state;
      if (currentState is OrdersLoaded) {
        final updatedOrders =
            currentState.orders.map((order) {
              if (order.id == orderId) {
                return order.copyWith(status: status);
              }
              return order;
            }).toList();
        emit(OrdersLoaded(updatedOrders));
      }
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }
}
