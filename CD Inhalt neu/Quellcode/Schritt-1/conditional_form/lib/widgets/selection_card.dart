import 'package:built_collection/built_collection.dart';
import 'package:conditional_form/choices/base/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

typedef OnSelect<ChoiceType extends Choice> = void Function(
    ChoiceType selectedChoice);

typedef OnDeselect<ChoiceType extends Choice> = void Function(
    ChoiceType selectedChoice);

const confirmButtonTooltip = 'Auswahl übernehmen';

class SelectionCard<ChoiceType extends Choice> extends StatelessWidget {
  final String title;
  final BehaviorSubject<BuiltSet<ChoiceType>> selectionViewModel;
  final Choices<ChoiceType> allChoices;
  final OnSelect<ChoiceType> onSelect;
  final OnDeselect<ChoiceType> onDeselect;

  SelectionCard(
      {required this.title,
      required Iterable<ChoiceType> initialValue,
      required this.allChoices,
      required this.onSelect,
      required this.onDeselect,
      Key? key})
      : selectionViewModel = BehaviorSubject<BuiltSet<ChoiceType>>.seeded(
            BuiltSet.from(initialValue)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();

    navigateToSelectionScreen() async {
      focusNode.requestFocus();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  createMultipleChoiceSelectionScreen(context)));
    }

    return StreamBuilder(
        stream: selectionViewModel,
        builder: (context, snapshot) {
          final selectedChoices = selectionViewModel.value;
          return Card(
            child: ListTile(
              focusNode: focusNode,
              title: Text(title),
              subtitle:
                  Text(selectedChoices.map((c) => c.description).join(", ")),
              trailing: const Icon(Icons.edit),
              onTap: navigateToSelectionScreen,
            ),
          );
        });
  }

  Widget createMultipleChoiceSelectionScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder(
          stream: selectionViewModel,
          builder: (context, snapshot) {
            final selectedChoices = selectionViewModel.value;
            return ListView(children: [
              ...allChoices.map((ChoiceType c) {
                bool isSelected = selectedChoices.contains(c);

                return CheckboxListTile(
                    key: Key(
                        "valid choice ${allChoices.name} - ${c.abbreviation}"),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(c.description),
                    value: isSelected,
                    onChanged: (bool? selected) {
                      if (selected != null) {
                        selectionViewModel.value =
                            selectionViewModel.value.rebuild((b) {
                          b.replace(isSelected ? [] : [c]);
                        });
                        if (selected) {
                          onSelect(c);
                        } else {
                          onDeselect(c);
                        }
                      }
                    });
              }).toList(),
            ]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        tooltip: confirmButtonTooltip,
        child: const Icon(Icons.check),
      ),
    );
  }
}
