import 'package:flutter/material.dart';

import '../../../../shared/presentation/atomic/molecules/filled_button_molecule.dart';
import '../../../domain/entities/simple_card.dart';
import '../molecules/card_item_molecule.dart';

class SelectCardTemplate extends StatelessWidget {
  const SelectCardTemplate({
    super.key,
    required this.card,
    required this.onAddNewCardTap,
    required this.onSelected,
    required this.selectedCardId,
  });

  final List<SimpleCard> card;
  final VoidCallback onAddNewCardTap;
  final Function(SimpleCard) onSelected;
  final String selectedCardId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartão'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => onSelected(card[index]),
                    child: CardItemMolecule(
                      card: card[index],
                      isSelectedCard: card[index].id == selectedCardId,
                    ),
                  );
                },
                childCount: card.length,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButtonMolecule(
                    onTap: onAddNewCardTap,
                    text: 'Adicionar novo cartão',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
