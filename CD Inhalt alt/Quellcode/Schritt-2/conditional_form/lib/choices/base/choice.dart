import 'dart:collection';

class Choice {
  final String description;
  final String abbreviation;

  const Choice(this.abbreviation, this.description);
}

class Choices<T extends Choice> extends UnmodifiableSetView<T> {
  final String name;
  final Map<String, T> choiceByAbbreviation;

  T? fromAbbreviation(String? abbreviation) => choiceByAbbreviation[abbreviation];

  Choices(Set<T> choices, {required this.name})
      : choiceByAbbreviation = {
          for (var choice in choices) choice.abbreviation: choice,
        },
        super(choices);
}
