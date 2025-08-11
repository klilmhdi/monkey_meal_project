part of 'foods_cubit.dart';

abstract class FoodsState extends Equatable {
  const FoodsState();

  @override
  List<Object> get props => [];
}

final class FoodsInitial extends FoodsState {}

class LoadFoodLoading extends FoodsState {}

class SuccessLoadFood extends FoodsState {
  final List<ItemModel> foods;

  const SuccessLoadFood(this.foods);

  @override
  List<Object> get props => [foods];
}

class FailedLoadFood extends FoodsState {
  final String message;

  const FailedLoadFood(this.message);

  @override
  List<Object> get props => [message];
}

class OrdersLoading extends FoodsState {}

class OrdersLoaded extends FoodsState {
  final List<OrderModel> orders;

  const OrdersLoaded(this.orders);

  @override
  List<Object> get props => [orders];
}

class OrdersError extends FoodsState {
  final String message;

  const OrdersError(this.message);

  @override
  List<Object> get props => [message];
}
