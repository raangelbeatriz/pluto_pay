import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/presentation/atomic/molecules/messages_molecule.dart';
import '../../../shared/utils/status.dart';
import '../../payment_module.dart';
import '../atomic/templates/register_card_template.dart';
import '../cubits/register_card_cubit.dart';

class RegisterCardPage extends StatefulWidget {
  const RegisterCardPage({super.key});

  static const String routeName = '/register-card-page';
  static const String routePath = PaymentModule.moduleName + routeName;

  @override
  State<RegisterCardPage> createState() => _RegisterCardPageState();
}

class _RegisterCardPageState extends State<RegisterCardPage> with Messages {
  final cubit = Modular.get<RegisterCardCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCardCubit, RegisterCardState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          showError(
            'Erro ao cadastrar cartão, por favor tente novamente mais tarde',
          );
        }
      },
      bloc: cubit,
      builder: (context, state) {
        return RegisterCardTemplate(
          onCardDataChanged: cubit.onCardDataChanged,
          isButtonEnabled: state.isButtonEnable,
          onSaveCardTap: cubit.onSaveButtonTap,
          isButtonLoading: state.status.isLoading,
        );
      },
    );
  }
}
