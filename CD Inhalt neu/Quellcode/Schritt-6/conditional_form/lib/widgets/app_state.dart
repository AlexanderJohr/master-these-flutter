import 'package:conditional_form/data_access/massnahmen_model.dart';
import 'package:conditional_form/screens/massnahmen_detail/massnahmen_form_view_model.dart';
import 'package:flutter/widgets.dart';

class AppState extends InheritedWidget {
  const AppState({
    Key? key,
    required this.model,
    required this.viewModel,
    required Widget child
  }) : super(key: key, child: child);

  final MassnahmenFormViewModel viewModel;
  final MassnahmenModel model;

  static AppState of(BuildContext context) {
    final AppState? result = context.dependOnInheritedWidgetOfExactType<AppState>();
    assert(result != null, "Kein AppState im 'context' gefunden");
    return result!;
  }

  @override
  bool updateShouldNotify(covariant AppState oldWidget) => false;
}