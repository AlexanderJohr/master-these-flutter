// ignore_for_file: non_constant_identifier_names

import 'base/choice.dart';

class FoerderklasseChoice extends Choice {
  static final oelb = FoerderklasseChoice("oelb", "Ökolandbau");
  static final azl = FoerderklasseChoice("azl", "Ausgleichszulage");
  static final ea = FoerderklasseChoice("ea", "Erschwernisausgleich");
  static final aukm_nur_vns = FoerderklasseChoice("aukm_nur_vns",
      "Agrarumwelt-(und Klima)Maßnahme: nur Vertragsnaturschutz");
  static final aukm_ohne_vns = FoerderklasseChoice("aukm_ohne_vns",
      "Agrarumwelt-(und Klima)Maßnahmen, tw. auch mit Tierwohlaspekten, aber OHNE Vertragsnaturschutz");
  static final twm_ziel = FoerderklasseChoice(
      "twm_ziel", "Tierschutz/Tierwohlmaßnahmen mit diesem als Hauptziel");
  static final contact =
      FoerderklasseChoice("contact", "bitte um Unterstützung");

  FoerderklasseChoice(String abbreviation, String description,
      {bool Function(Set<Choice> choices)? condition})
      : super(abbreviation, description, condition: condition);
}

final foerderklasseChoices = Choices<FoerderklasseChoice>({
  FoerderklasseChoice.oelb,
  FoerderklasseChoice.azl,
  FoerderklasseChoice.ea,
  FoerderklasseChoice.aukm_nur_vns,
  FoerderklasseChoice.aukm_ohne_vns,
  FoerderklasseChoice.twm_ziel,
  FoerderklasseChoice.contact
}, name: "Förderklasse");

class KategorieChoice extends Choice {
  static final zf_us = KategorieChoice(
      "zf_us", "Anbau Zwischenfrucht/Untersaat",
      condition: (choices) =>
          choices.contains(FoerderklasseChoice.aukm_ohne_vns));
  static final anlage_pflege = KategorieChoice(
      "anlage_pflege", "Anlage/Pflege Struktur",
      condition: (choices) =>
          choices.contains(FoerderklasseChoice.aukm_nur_vns) ||
          choices.contains(FoerderklasseChoice.aukm_ohne_vns));
  static final dungmang = KategorieChoice("dungmang", "Düngemanagement",
      condition: (choices) =>
          choices.contains(FoerderklasseChoice.aukm_nur_vns) ||
          choices.contains(FoerderklasseChoice.aukm_ohne_vns));
  static final extens = KategorieChoice("extens", "Extensivierung");
  static final flst = KategorieChoice("flst", "Flächenstilllegung/Brache",
      condition: (choices) =>
          choices.contains(FoerderklasseChoice.aukm_nur_vns) ||
          choices.contains(FoerderklasseChoice.aukm_ohne_vns));
  static final umwandlg = KategorieChoice("umwandlg", "Nutzungsumwandlung",
      condition: (choices) =>
          choices.contains(FoerderklasseChoice.aukm_nur_vns) ||
          choices.contains(FoerderklasseChoice.aukm_ohne_vns));
  static final bes_kult_rass = KategorieChoice(
      "bes_kult_rass", "Förderung bestimmter Rassen / Sorten / Kulturen",
      condition: (choices) => !choices.contains(FoerderklasseChoice.ea));
  static final contact = KategorieChoice("contact", "bitte um Unterstützung");

  KategorieChoice(String abbreviation, String description,
      {bool Function(Set<Choice> choices)? condition})
      : super(abbreviation, description, condition: condition);
}

final kategorieChoices = Choices<KategorieChoice>({
  KategorieChoice.zf_us,
  KategorieChoice.anlage_pflege,
  KategorieChoice.dungmang,
  KategorieChoice.extens,
  KategorieChoice.flst,
  KategorieChoice.umwandlg,
  KategorieChoice.bes_kult_rass,
  KategorieChoice.contact
}, name: "Kategorie");

class ZielflaecheChoice extends Choice {
  static final ka = ZielflaecheChoice("ka", "keine Angabe/Vorgabe");
  static final al = ZielflaecheChoice("al", "AL",
      condition: (choices) => !choices.contains(KategorieChoice.zf_us));
  static final gl = ZielflaecheChoice("gl", "GL");
  static final lf = ZielflaecheChoice("lf", "LF");
  static final dk_sk = ZielflaecheChoice("dk_sk", "DK/SK",
      condition: (choices) => !choices.contains(FoerderklasseChoice.twm_ziel));
  static final hff = ZielflaecheChoice("hff", "HFF");
  static final biotop_le = ZielflaecheChoice(
      "biotop_le", "Landschaftselement/Biotop o.Ä.",
      condition: (choices) =>
          (choices.contains(FoerderklasseChoice.azl) ||
              choices.contains(FoerderklasseChoice.ea) ||
              choices.contains(FoerderklasseChoice.aukm_nur_vns) ||
              choices.contains(FoerderklasseChoice.aukm_ohne_vns)) &&
          (!choices.contains(KategorieChoice.zf_us) ||
              !choices.contains(KategorieChoice.bes_kult_rass)));
  static final wald = ZielflaecheChoice("wald", "Wald/Forst",
      condition: (choices) =>
          (choices.contains(FoerderklasseChoice.ea) ||
              choices.contains(FoerderklasseChoice.aukm_nur_vns) ||
              choices.contains(FoerderklasseChoice.aukm_ohne_vns)) &&
          (!choices.contains(KategorieChoice.zf_us) ||
              !choices.contains(KategorieChoice.bes_kult_rass)));
  static final contact = ZielflaecheChoice("contact", "bitte um Unterstützung");

  ZielflaecheChoice(String abbreviation, String description,
      {bool Function(Set<Choice> choices)? condition})
      : super(abbreviation, description, condition: condition);
}

final zielflaecheChoices = Choices<ZielflaecheChoice>({
  ZielflaecheChoice.ka,
  ZielflaecheChoice.al,
  ZielflaecheChoice.gl,
  ZielflaecheChoice.lf,
  ZielflaecheChoice.dk_sk,
  ZielflaecheChoice.hff,
  ZielflaecheChoice.biotop_le,
  ZielflaecheChoice.wald,
  ZielflaecheChoice.contact
}, name: "Zielfläche");

class ZieleinheitChoice extends Choice {
  static final ka = ZieleinheitChoice("ka", "keine Angabe/Vorgabe");
  static final m3 = ZieleinheitChoice("m3", "m³ (z.B. Gülle)",
      condition: (choices) =>
          (choices.contains(FoerderklasseChoice.aukm_nur_vns) ||
              choices.contains(FoerderklasseChoice.aukm_ohne_vns)) &&
          (choices.contains(KategorieChoice.dungmang) ||
              choices.contains(KategorieChoice.extens)) &&
          (!choices.contains(ZielflaecheChoice.ka) &&
              !choices.contains(ZielflaecheChoice.contact)));
  static final pieces = ZieleinheitChoice(
      "pieces", "Kopf/Stück (z.B. Tiere oder Bäume)",
      condition: (choices) =>
          (choices.contains(FoerderklasseChoice.aukm_nur_vns) ||
              choices.contains(FoerderklasseChoice.aukm_ohne_vns) ||
              choices.contains(FoerderklasseChoice.twm_ziel)) &&
          (!choices.contains(KategorieChoice.zf_us) ||
              !choices.contains(KategorieChoice.flst) ||
              !choices.contains(KategorieChoice.umwandlg)) &&
          (!choices.contains(ZielflaecheChoice.ka) &&
              !choices.contains(ZielflaecheChoice.contact)));
  static final gve = ZieleinheitChoice("gve", "GV/GVE",
      condition: (choices) =>
          (choices.contains(FoerderklasseChoice.aukm_nur_vns) ||
              choices.contains(FoerderklasseChoice.aukm_ohne_vns) ||
              choices.contains(FoerderklasseChoice.twm_ziel)) &&
          (!choices.contains(KategorieChoice.zf_us) ||
              !choices.contains(KategorieChoice.anlage_pflege) ||
              !choices.contains(KategorieChoice.flst) ||
              !choices.contains(KategorieChoice.umwandlg)) &&
          (!choices.contains(ZielflaecheChoice.ka) &&
              !choices.contains(ZielflaecheChoice.contact)));
  static final rgve = ZieleinheitChoice("rgve", "RGV",
      condition: (choices) =>
          (choices.contains(FoerderklasseChoice.aukm_nur_vns) ||
              choices.contains(FoerderklasseChoice.aukm_ohne_vns) ||
              choices.contains(FoerderklasseChoice.twm_ziel)) &&
          (!choices.contains(KategorieChoice.zf_us) ||
              !choices.contains(KategorieChoice.anlage_pflege) ||
              !choices.contains(KategorieChoice.flst) ||
              !choices.contains(KategorieChoice.umwandlg)) &&
          (!choices.contains(ZielflaecheChoice.ka) &&
              !choices.contains(ZielflaecheChoice.contact)));
  static final ha = ZieleinheitChoice("ha", "ha",
      condition: (choices) =>
          !choices.contains(ZielflaecheChoice.ka) &&
          !choices.contains(ZielflaecheChoice.contact));
  static final contact = ZieleinheitChoice("contact", "bitte um Unterstützung");

  ZieleinheitChoice(String abbreviation, String description,
      {bool Function(Set<Choice> choices)? condition})
      : super(abbreviation, description, condition: condition);
}

final zieleinheitChoices = Choices<ZieleinheitChoice>({
  ZieleinheitChoice.ka,
  ZieleinheitChoice.m3,
  ZieleinheitChoice.pieces,
  ZieleinheitChoice.gve,
  ZieleinheitChoice.rgve,
  ZieleinheitChoice.ha,
  ZieleinheitChoice.contact
}, name: "Zieleinheit");

class ZielsetzungLandChoice extends Choice {
  static final ka = ZielsetzungLandChoice("ka", "keine Angabe/Vorgabe");
  static final bsch = ZielsetzungLandChoice("bsch", "Bodenschutz");
  static final wsch = ZielsetzungLandChoice("wsch", "Gewässerschutz");
  static final asch = ZielsetzungLandChoice("asch", "Spezieller Artenschutz");
  static final biodiv = ZielsetzungLandChoice("biodiv", "Biodiversität");
  static final strutktviel =
      ZielsetzungLandChoice("strutktviel", "Erhöhung der Strukturvielfalt");
  static final genet_res = ZielsetzungLandChoice("genet_res",
      "Erhaltung genetischer Ressourcen (Pflanzen, z. B. im Grünland, und Tiere, z. B. bedrohte Rassen)");
  static final tsch = ZielsetzungLandChoice(
      "tsch", "Tierschutz/Maßnahmen zum Tierwohl im Betrieb");
  static final klima = ZielsetzungLandChoice("klima", "Klima");
  static final contact =
      ZielsetzungLandChoice("contact", "bitte um Unterstützung");

  ZielsetzungLandChoice(String abbreviation, String description,
      {bool Function(Set<Choice> choices)? condition})
      : super(abbreviation, description, condition: condition);
}

final _zielsetzungLandChoices = {
  ZielsetzungLandChoice.ka,
  ZielsetzungLandChoice.bsch,
  ZielsetzungLandChoice.wsch,
  ZielsetzungLandChoice.asch,
  ZielsetzungLandChoice.biodiv,
  ZielsetzungLandChoice.strutktviel,
  ZielsetzungLandChoice.genet_res,
  ZielsetzungLandChoice.tsch,
  ZielsetzungLandChoice.klima,
  ZielsetzungLandChoice.contact
};

final hauptzielsetzungLandChoices = Choices<ZielsetzungLandChoice>(
    _zielsetzungLandChoices,
    name: "Hauptzielsetzung Land");

class LetzterStatus extends Choice {
  static final bearb = LetzterStatus("bearb", "in Bearbeitung");
  static final fertig = LetzterStatus("fertig", "abgeschlossen");

  LetzterStatus(String abbreviation, String description,
      {bool Function(Set<Choice> choices)? condition})
      : super(abbreviation, description, condition: condition);
}

final letzterStatusChoices = Choices<LetzterStatus>(
    {LetzterStatus.bearb, LetzterStatus.fertig},
    name: "Status");
