// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Mob_State on _Mob_StateBase, Store {
  final _$toAtom = Atom(name: '_Mob_StateBase.to');

  @override
  double get to {
    _$toAtom.reportRead();
    return super.to;
  }

  @override
  set to(double value) {
    _$toAtom.reportWrite(value, super.to, () {
      super.to = value;
    });
  }

  final _$list_grafAtom = Atom(name: '_Mob_StateBase.list_graf');

  @override
  ObservableList<dynamic> get list_graf {
    _$list_grafAtom.reportRead();
    return super.list_graf;
  }

  @override
  set list_graf(ObservableList<dynamic> value) {
    _$list_grafAtom.reportWrite(value, super.list_graf, () {
      super.list_graf = value;
    });
  }

  final _$Lista_data_climaAtom = Atom(name: '_Mob_StateBase.Lista_data_clima');

  @override
  ObservableList<dynamic> get Lista_data_clima {
    _$Lista_data_climaAtom.reportRead();
    return super.Lista_data_clima;
  }

  @override
  set Lista_data_clima(ObservableList<dynamic> value) {
    _$Lista_data_climaAtom.reportWrite(value, super.Lista_data_clima, () {
      super.Lista_data_clima = value;
    });
  }

  final _$Lista_data_clima_mediaAtom =
      Atom(name: '_Mob_StateBase.Lista_data_clima_media');

  @override
  ObservableList<dynamic> get Lista_data_clima_media {
    _$Lista_data_clima_mediaAtom.reportRead();
    return super.Lista_data_clima_media;
  }

  @override
  set Lista_data_clima_media(ObservableList<dynamic> value) {
    _$Lista_data_clima_mediaAtom
        .reportWrite(value, super.Lista_data_clima_media, () {
      super.Lista_data_clima_media = value;
    });
  }

  final _$isLoadAtom = Atom(name: '_Mob_StateBase.isLoad');

  @override
  bool get isLoad {
    _$isLoadAtom.reportRead();
    return super.isLoad;
  }

  @override
  set isLoad(bool value) {
    _$isLoadAtom.reportWrite(value, super.isLoad, () {
      super.isLoad = value;
    });
  }

  final _$estadoAtom = Atom(name: '_Mob_StateBase.estado');

  @override
  String get estado {
    _$estadoAtom.reportRead();
    return super.estado;
  }

  @override
  set estado(String value) {
    _$estadoAtom.reportWrite(value, super.estado, () {
      super.estado = value;
    });
  }

  final _$cadAtom = Atom(name: '_Mob_StateBase.cad');

  @override
  String get cad {
    _$cadAtom.reportRead();
    return super.cad;
  }

  @override
  set cad(String value) {
    _$cadAtom.reportWrite(value, super.cad, () {
      super.cad = value;
    });
  }

  final _$nda_inicialAtom = Atom(name: '_Mob_StateBase.nda_inicial');

  @override
  String get nda_inicial {
    _$nda_inicialAtom.reportRead();
    return super.nda_inicial;
  }

  @override
  set nda_inicial(String value) {
    _$nda_inicialAtom.reportWrite(value, super.nda_inicial, () {
      super.nda_inicial = value;
    });
  }

  final _$sincronizar_dadosAsyncAction =
      AsyncAction('_Mob_StateBase.sincronizar_dados');

  @override
  Future<bool> sincronizar_dados() {
    return _$sincronizar_dadosAsyncAction.run(() => super.sincronizar_dados());
  }

  final _$_Mob_StateBaseActionController =
      ActionController(name: '_Mob_StateBase');

  @override
  void gera() {
    final _$actionInfo = _$_Mob_StateBaseActionController.startAction(
        name: '_Mob_StateBase.gera');
    try {
      return super.gera();
    } finally {
      _$_Mob_StateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String def_mes(int valor) {
    final _$actionInfo = _$_Mob_StateBaseActionController.startAction(
        name: '_Mob_StateBase.def_mes');
    try {
      return super.def_mes(valor);
    } finally {
      _$_Mob_StateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsload(dynamic valor) {
    final _$actionInfo = _$_Mob_StateBaseActionController.startAction(
        name: '_Mob_StateBase.setIsload');
    try {
      return super.setIsload(valor);
    } finally {
      _$_Mob_StateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEstado(dynamic valor) {
    final _$actionInfo = _$_Mob_StateBaseActionController.startAction(
        name: '_Mob_StateBase.setEstado');
    try {
      return super.setEstado(valor);
    } finally {
      _$_Mob_StateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
to: ${to},
list_graf: ${list_graf},
Lista_data_clima: ${Lista_data_clima},
Lista_data_clima_media: ${Lista_data_clima_media},
isLoad: ${isLoad},
estado: ${estado},
cad: ${cad},
nda_inicial: ${nda_inicial}
    ''';
  }
}
