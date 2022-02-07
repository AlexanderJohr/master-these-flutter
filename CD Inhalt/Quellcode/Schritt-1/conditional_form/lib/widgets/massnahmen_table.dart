import 'package:conditional_form/data_model/massnahme.dart';
import 'package:flutter/material.dart';

typedef OnSelectCallback = void Function(Massnahme selectedMassnahme);

class MassnahmenTable extends StatelessWidget {
  final Set<Massnahme> _massnahmenToDisplay;
  final OnSelectCallback? onSelect;

  const MassnahmenTable(this._massnahmenToDisplay, {this.onSelect, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 3),
      defaultColumnWidth: const IntrinsicColumnWidth(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          _buildColumnHeader(const Text("Zuletzt bearbeitet am")),
          _buildColumnHeader(const Text("Maßnahmentitel"))
        ]),
        ..._massnahmenToDisplay.map((m) {
          return TableRow(children: [
            _buildSelectableCell(m, Text(m.letzteBearbeitung.formattedDate)),
            _buildSelectableCell(m, Text(m.identifikatoren.massnahmenTitel)),
          ]);
        }).toList(),
      ],
    );
  }

  Widget _buildColumnHeader(Widget child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      );

  Widget _buildSelectableCell(Massnahme m, Widget child,
          {double padding = 8.0}) =>
      TableRowInkWell(
        onTap: () {
          if (onSelect != null) {
            onSelect!(m);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      );
}
