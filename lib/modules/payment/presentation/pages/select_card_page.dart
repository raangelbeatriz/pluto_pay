import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/presentation/atomic/template/error_template.dart';
import '../../../shared/presentation/atomic/template/loading_template.dart';
import '../../../shared/utils/status.dart';
import '../../payment_module.dart';
import '../atomic/templates/select_card_template.dart';
import '../cubits/select_card_cubit.dart';

class SelectCardPage extends StatefulWidget {
  const SelectCardPage({super.key});

  static const String routeName = '/select-card-page';
  static const String routePath = PaymentModule.moduleName + routeName;

  @override
  State<SelectCardPage> createState() => _SelectCardPageState();
}

class _SelectCardPageState extends State<SelectCardPage> {
  final cubit = Modular.get<SelectCardCubit>();

  @override
  void initState() {
    super.initState();
    cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectCardCubit, SelectCardState>(
      bloc: cubit,
      builder: (context, state) {
        if (state.status.isLoading) return const LoadingTemplate();

        if (state.failure != null) return ErrorTemplate(retryButton: cubit.onInit);

        return SelectCardTemplate(
          card: state.cards,
          onAddNewCardTap: cubit.onRegisterNewCardTap,
          onSelected: cubit.selectNewCard,
          selectedCardId: state.selectedCard.id,
        );
      },
    );
  }
}
