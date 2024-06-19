import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/presentation/atomic/molecules/messages_molecule.dart';
import '../../../shared/presentation/atomic/template/error_template.dart';
import '../../../shared/presentation/atomic/template/loading_template.dart';
import '../../../shared/utils/status.dart';
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

class _PaymentPageState extends State<PaymentPage> with Messages {
  final cubit = Modular.get<PaymentCubit>();

  @override
  void initState() {
    super.initState();
    cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PaymentCubit, PaymentState>(
          bloc: cubit,
          listener: (context, state) {
            if (state.message != null) {
              showCustomMessage(state.message!);
            }
          },
          listenWhen: (previous, current) => previous.message != current.message,
        ),
        BlocListener<PaymentCubit, PaymentState>(
          bloc: cubit,
          listener: (context, state) {
            if (state.failure != null) {
              showError(state.failure!.getMessage());
            }
          },
          listenWhen: (previous, current) => previous.failure != current.failure,
        ),
      ],
      child: //
          BlocBuilder<PaymentCubit, PaymentState>(
        bloc: cubit,
        builder: (context, state) {
          if (state.isScreenLoading) {
            return const LoadingTemplate();
          }

          if (state.screenHasCriticalFailure) {
            return ErrorTemplate(
              retryButton: cubit.onInit,
            );
          }
          return PaymentTemplate(
            onPayTap: cubit.onPayTap,
            storeName: state.paymentDetails!.storeName,
            amount: state.paymentDetails!.amount,
            onChangeCardTap: cubit.onChangeCardTap,
            selectedCard: state.selectedCard,
            isPayButtonLoading: state.getUserHasFraudStatus.isLoading,
          );
        },
      ),
    );
  }
}
