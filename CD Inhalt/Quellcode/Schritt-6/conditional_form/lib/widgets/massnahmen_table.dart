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
          _buildColumnHeader(const Text("Maßnahmentitel")),
          _buildColumnHeader(const Text("Förderklasse")),
          _buildColumnHeader(const Text("Kategorie")),
          _buildColumnHeader(const Text("Zielfläche")),
          _buildColumnHeader(const Text("Zieleinheit")),
          _buildColumnHeader(const Text("Hauptzielsetzung Land")),
          _buildColumnHeader(const Text("Nebenziele")),
        ]),
        ..._massnahmenToDisplay.map((m) {
          return TableRow(children: [
            _buildSelectableCell(m, Text(m.letzteBearbeitung.formattedDate)),
            _buildSelectableCell(m, Text(m.identifikatoren.massnahmenTitel)),
            _buildSelectableCell(
                m, Text(m.massnahmenCharakteristika.foerderklasse ?? "")),
            _buildSelectableCell(
                m, Text(m.massnahmenCharakteristika.kategorie ?? "")),
            _buildSelectableCell(
                m, Text(m.massnahmenCharakteristika.zielflaeche ?? "")),
            _buildSelectableCell(
                m, Text(m.massnahmenCharakteristika.zieleinheit ?? "")),
            _buildSelectableCell(m,
                Text(m.massnahmenCharakteristika.hauptzielsetzungLand ?? "")),
            _buildSelectableCell(
                m,
                Column(
                  children: m.massnahmenCharakteristika.nebenziele
                      .map((n) => Text(n))
                      .toList(),
                )),
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
