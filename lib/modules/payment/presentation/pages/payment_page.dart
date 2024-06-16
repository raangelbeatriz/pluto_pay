import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/presentation/atomic/template/loading_template.dart';
import '../../domain/entities/simple_card.dart';
import '../../payment_module.dart';
import '../atomic/templates/payment_template.dart';
import '../cubits/payment_cubit.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  static const String routeName = '/payment-page';
  static const String routePath = PaymentModule.moduleName + routeName;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final cubit = Modular.get<PaymentCubit>();

  @override
  void initState() {
    super.initState();
    cubit.onInit();
  }

  void showBottomSheet(List<SimpleCard> cards) {
    print('To aqui');
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      builder: (context) {
        return CustomBottomSheet(
          cards: cards,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      bloc: cubit,
      builder: (context, state) {
        if (state.isScreenLoading) {
          return const LoadingTemplate();
        }
        return PaymentTemplate(
          onPayTap: cubit.onTapPay,
          storeName: state.paymentDetails!.storeName,
          amount: state.paymentDetails!.amount,
          onChangeCardTap: () {
            print('teste');
            showBottomSheet(
              state.registeredCards,
            );
          },
        );
      },
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.cards,
  });

  final List<SimpleCard> cards;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cartões Cadastrados',
              style: AppTextStyles.montserratBold16,
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                  ),
                  child: Text(
                    cards[index].cardNumber,
                    style: AppTextStyles.montserratRegular16,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
