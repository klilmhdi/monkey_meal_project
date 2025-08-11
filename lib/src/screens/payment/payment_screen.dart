import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_meal_project/core/consts/functions/animations.dart';
import 'package:monkey_meal_project/src/manage/payment/payment_cubit.dart';
import 'package:monkey_meal_project/src/models/payment_model.dart';
import 'package:monkey_meal_project/src/widgets/custom_button/build_custom_button.dart';
import 'package:uuid/uuid.dart';

class PaymentListScreen extends StatelessWidget {
  const PaymentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => NavAndAnimationsFunctions.navTo(context, AddPaymentScreen()),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => PaymentCubit()..fetchPaymentMethods(),
        child: BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            if (state is PaymentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PaymentError) {
              return Center(child: Text(state.message));
            } else if (state is PaymentLoaded) {
              return _buildPaymentList(context, state.paymentMethods);
            }
            return const Center(child: Text('No payment methods found'));
          },
        ),
      ),
    );
  }

  Widget _buildPaymentList(BuildContext context, List<PaymentModel> payments) {
    if (payments.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No payment methods added yet'),
            const SizedBox(height: 20),
            customButton(
              press: () => NavAndAnimationsFunctions.navTo(context, AddPaymentScreen()),
              title: "Add payment method",
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: payments.length,
      itemBuilder: (context, index) {
        final payment = payments[index];
        return _buildPaymentCard(context, payment);
      },
    );
  }

  Widget _buildPaymentCard(BuildContext context, PaymentModel payment) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const Icon(Icons.credit_card, size: 40),
        title: Text(payment.maskedCardNumber),
        subtitle: Text('Expires ${payment.expiryDate}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (payment.isDefault)
              const Icon(Icons.check_circle, color: Colors.green)
            else
              IconButton(
                icon: const Icon(Icons.check_circle_outline),
                onPressed: () => PaymentCubit.get(context).setDefaultPaymentMethod(payment.id),
              ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _showDeleteDialog(context, payment.id),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, String paymentId) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Delete Payment Method'),
            content: const Text('Are you sure you want to delete this payment method?'),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  PaymentCubit.get(context).deletePaymentMethod(paymentId);
                },
                child: const Text('Delete', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }
}

class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({super.key});

  @override
  State<AddPaymentScreen> createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final FlipCardController _flipCardController = FlipCardController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Payment Method')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Credit Card Preview
                FlipCard(
                  controller: _flipCardController,
                  direction: FlipDirection.HORIZONTAL,
                  front: _buildFrontCard(),
                  back: _buildBackCard(),
                ),
                const SizedBox(height: 32),
                // Form Fields
                _buildCardNumberField(),
                const SizedBox(height: 16),
                _buildCardHolderField(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildExpiryDateField()),
                    const SizedBox(width: 16),
                    Expanded(child: _buildCvvField()),
                  ],
                ),
                const SizedBox(height: 32),
                customButton(press: _submitForm, title: 'Add Payment Method')
                // ElevatedButton(onPressed: _submitForm, child: const Text()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFrontCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF3F51B5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.credit_card, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              _cardNumberController.text.isEmpty ? '•••• •••• •••• ••••' : _cardNumberController.text,
              style: const TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 2),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('CARD HOLDER', style: TextStyle(color: Colors.white70, fontSize: 10)),
                    Text(
                      _cardHolderController.text.isEmpty ? 'YOUR NAME' : _cardHolderController.text.toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('EXPIRES', style: TextStyle(color: Colors.white70, fontSize: 10)),
                    Text(
                      _expiryDateController.text.isEmpty ? '••/••' : _expiryDateController.text,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF3F51B5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(height: 40, color: Colors.black),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _cvvController.text.isEmpty ? '•••' : _cvvController.text,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'This card is issued by your bank and is subject to terms and conditions',
              style: TextStyle(color: Colors.white70, fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardNumberField() {
    return TextFormField(
      controller: _cardNumberController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Card Number',
        prefixIcon: Icon(Icons.credit_card),
        border: OutlineInputBorder(),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(16),
        CardNumberFormatter(),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter card number';
        }
        if (value.length < 16) {
          return 'Card number must be 16 digits';
        }
        return null;
      },
      onChanged: (value) => setState(() {}),
    );
  }

  Widget _buildCardHolderField() {
    return TextFormField(
      controller: _cardHolderController,
      decoration: const InputDecoration(
        labelText: 'Card Holder Name',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter card holder name';
        }
        return null;
      },
      onChanged: (value) => setState(() {}),
    );
  }

  Widget _buildExpiryDateField() {
    return TextFormField(
      controller: _expiryDateController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Expiry Date (MM/YY)',
        prefixIcon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
        CardExpiryFormatter(),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter expiry date';
        }
        if (value.length < 5) {
          return 'Please enter full date (MM/YY)';
        }
        return null;
      },
      onChanged: (value) => setState(() {}),
    );
  }

  Widget _buildCvvField() {
    return TextFormField(
      controller: _cvvController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'CVV', prefixIcon: Icon(Icons.lock), border: OutlineInputBorder()),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(3)],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter CVV';
        }
        if (value.length < 3) {
          return 'CVV must be 3 digits';
        }
        return null;
      },
      onTap: () => _flipCardController.toggleCard(),
      onChanged: (value) => setState(() {}),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    final payment = PaymentModel(
      id: Uuid().v4(),
      cardNumber: _cardNumberController.text.replaceAll(' ', ''),
      cardHolderName: _cardHolderController.text,
      expiryDate: _expiryDateController.text,
      cvv: _cvvController.text,
      createdAt: DateTime.now(),
    );

    BlocProvider.of<PaymentCubit>(context).addPaymentMethod(payment).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Payment method added successfully')));
      Navigator.pop(context);
    });
  }
}

// Formatters
class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) return newValue;

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' ');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(text: string, selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardExpiryFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) return newValue;

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex == 2 && nonZeroIndex != text.length) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(text: string, selection: TextSelection.collapsed(offset: string.length));
  }
}
