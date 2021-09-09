import 'dart:collection';

typedef Condition = bool Function(Set<Choice> choices);

class Choice {
  final String description;
  final String abbreviation;
  final Condition condition;

  bool conditionMatches(Set<Choice> choices) => condition.call(choices);

  const Choice(this.abbreviation, this.description, {Condition? condition})
      : condition = condition ?? _conditionIsAlwaysMet;

  static bool _conditionIsAlwaysMet(Set<Choice> choices) => true;
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
