import 'dart:async';
import 'dart:convert';

//----------------------------------------------------------------
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pick_edit_datatable/bloc/global.dart';
import 'package:pick_edit_datatable/tabletap/tabletap1/datatap1/datatap1.dart';
import 'package:pick_edit_datatable/tabletap/tabletap1/modelintable.dart';

import 'package:pick_edit_datatable/tabletap/tabletap2/datatap2/datatap2.dart';
import 'package:pick_edit_datatable/tabletap/tabletap2/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap3/datatap3/datatap3.dart';
import 'package:pick_edit_datatable/tabletap/tabletap3/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap4/datatap4/datatap4.dart';
import 'package:pick_edit_datatable/tabletap/tabletap4/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap4/tablestruc4.dart';

import 'datasequnce_event.dart';
import 'datatest.dart';
//----------------------------------------------------------------

// String server = "http://172.20.30.46:9200/";
String server = "http://127.0.0.1:9205/";

//------------------------------------------------------- First

class FetchDataTable1Bloc_CPIU
    extends Bloc<DataSequncePage1_CPIU, List<MainStrucTableTap1_CPIU>> {
  FetchDataTable1Bloc_CPIU() : super([]);

  @override
  Stream<List<MainStrucTableTap1_CPIU>> mapEventToState(
      DataSequncePage1_CPIU event) async* {
    if (event == DataSequncePage1_CPIU.select) {
      yield* selectData_fn_CPIU(state);
    } else if (event == DataSequncePage1_CPIU.update) {
      yield* updateData_fn_CPIU(state);
    } else if (event == DataSequncePage1_CPIU.delete) {
      yield* deleteData_fn_CPIU(state);
    } else if (event == DataSequncePage1_CPIU.insert) {
      yield* InsertData_fn_CPIU(state);
    }
  }
}

Stream<List<MainStrucTableTap1_CPIU>> selectData_fn_CPIU(
    List<MainStrucTableTap1_CPIU> state) async* {
  print("SELECT FUNCTION BLOC");
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "customer_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap1_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap1_CPIU(
      number: data_input[i]['CP'].toString(),
      field01: data_input[i]['NAME'].toString(),
      field02: data_input[i]['PROCESS01'].toString(),
      field03: data_input[i]['PROCESS02'].toString(),
      field04: data_input[i]['PROCESS03'].toString(),
      field05: data_input[i]['PROCESS04'].toString(),
      field06: data_input[i]['PROCESS05'].toString(),
      field07: data_input[i]['PROCESS06'].toString(),
      field08: data_input[i]['PROCESS07'].toString(),
      field09: data_input[i]['PROCESS08'].toString(),
      field10: data_input[i]['PROCESS09'].toString(),
      field11: data_input[i]['PROCESS10'].toString(),
      field12: data_input[i]['PROCESS11'].toString(),
      field13: data_input[i]['PROCESS12'].toString(),
      field14: data_input[i]['PROCESS13'].toString(),
      field15: data_input[i]['PROCESS14'].toString(),
      field16: data_input[i]['PROCESS15'].toString(),
      field17: "",
      field18: "",
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap1_CPIU>> updateData_fn_CPIU(
    List<MainStrucTableTap1_CPIU> state) async* {
  print("UPDATE FUNCTION BLOC");

  var input_init = {
    "CP": EditDataTable1buffer_CPIU.number,
    "NAME": EditDataTable1buffer_CPIU.field01,
    "PROCESS01": EditDataTable1buffer_CPIU.field02,
    "PROCESS02": EditDataTable1buffer_CPIU.field03,
    "PROCESS03": EditDataTable1buffer_CPIU.field04,
    "PROCESS04": EditDataTable1buffer_CPIU.field05,
    "PROCESS05": EditDataTable1buffer_CPIU.field06,
    "PROCESS06": EditDataTable1buffer_CPIU.field07,
    "PROCESS07": EditDataTable1buffer_CPIU.field08,
    "PROCESS08": EditDataTable1buffer_CPIU.field09,
    "PROCESS09": EditDataTable1buffer_CPIU.field10,
    "PROCESS10": EditDataTable1buffer_CPIU.field11,
    "PROCESS11": EditDataTable1buffer_CPIU.field12,
    "PROCESS12": EditDataTable1buffer_CPIU.field13,
    "PROCESS13": EditDataTable1buffer_CPIU.field14,
    "PROCESS14": EditDataTable1buffer_CPIU.field15,
    "PROCESS15": EditDataTable1buffer_CPIU.field16,
  };

  final response_init =
      await http.post(Uri.parse(server + "customer_update"), body: input_init);
  //-------------------------------------------------------------------------
  print("SELECT FUNCTION BLOC");
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "customer_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap1_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap1_CPIU(
      number: data_input[i]['CP'].toString(),
      field01: data_input[i]['NAME'].toString(),
      field02: data_input[i]['PROCESS01'].toString(),
      field03: data_input[i]['PROCESS02'].toString(),
      field04: data_input[i]['PROCESS03'].toString(),
      field05: data_input[i]['PROCESS04'].toString(),
      field06: data_input[i]['PROCESS05'].toString(),
      field07: data_input[i]['PROCESS06'].toString(),
      field08: data_input[i]['PROCESS07'].toString(),
      field09: data_input[i]['PROCESS08'].toString(),
      field10: data_input[i]['PROCESS09'].toString(),
      field11: data_input[i]['PROCESS10'].toString(),
      field12: data_input[i]['PROCESS11'].toString(),
      field13: data_input[i]['PROCESS12'].toString(),
      field14: data_input[i]['PROCESS13'].toString(),
      field15: data_input[i]['PROCESS14'].toString(),
      field16: data_input[i]['PROCESS15'].toString(),
      field17: "",
      field18: "",
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap1_CPIU>> deleteData_fn_CPIU(
    List<MainStrucTableTap1_CPIU> state) async* {
  print("DELETE FUNCTION BLOC");
  var input_init = {
    "CP": DeleteDataTable1buffer_CPIU.number,
    "NAME": DeleteDataTable1buffer_CPIU.field01,
    "PROCESS01": DeleteDataTable1buffer_CPIU.field02,
    "PROCESS02": DeleteDataTable1buffer_CPIU.field03,
    "PROCESS03": DeleteDataTable1buffer_CPIU.field04,
    "PROCESS04": DeleteDataTable1buffer_CPIU.field05,
    "PROCESS05": DeleteDataTable1buffer_CPIU.field06,
    "PROCESS06": DeleteDataTable1buffer_CPIU.field07,
    "PROCESS07": DeleteDataTable1buffer_CPIU.field08,
    "PROCESS08": DeleteDataTable1buffer_CPIU.field09,
    "PROCESS09": DeleteDataTable1buffer_CPIU.field10,
    "PROCESS10": DeleteDataTable1buffer_CPIU.field11,
    "PROCESS11": DeleteDataTable1buffer_CPIU.field12,
    "PROCESS12": DeleteDataTable1buffer_CPIU.field13,
    "PROCESS13": DeleteDataTable1buffer_CPIU.field14,
    "PROCESS14": DeleteDataTable1buffer_CPIU.field15,
    "PROCESS15": DeleteDataTable1buffer_CPIU.field16,
  };

  final response_init =
      await http.post(Uri.parse(server + "customer_delete"), body: input_init);
  //-------------------------------------------------------------------------
  String input = "hi data";
  print("SELECT FUNCTION BLOC");
  final response =
      await http.post(Uri.parse(server + "customer_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap1_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap1_CPIU(
      number: data_input[i]['CP'].toString(),
      field01: data_input[i]['NAME'].toString(),
      field02: data_input[i]['PROCESS01'].toString(),
      field03: data_input[i]['PROCESS02'].toString(),
      field04: data_input[i]['PROCESS03'].toString(),
      field05: data_input[i]['PROCESS04'].toString(),
      field06: data_input[i]['PROCESS05'].toString(),
      field07: data_input[i]['PROCESS06'].toString(),
      field08: data_input[i]['PROCESS07'].toString(),
      field09: data_input[i]['PROCESS08'].toString(),
      field10: data_input[i]['PROCESS09'].toString(),
      field11: data_input[i]['PROCESS10'].toString(),
      field12: data_input[i]['PROCESS11'].toString(),
      field13: data_input[i]['PROCESS12'].toString(),
      field14: data_input[i]['PROCESS13'].toString(),
      field15: data_input[i]['PROCESS14'].toString(),
      field16: data_input[i]['PROCESS15'].toString(),
      field17: "",
      field18: "",
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap1_CPIU>> InsertData_fn_CPIU(
    List<MainStrucTableTap1_CPIU> state) async* {
  print("INSERT FUNCTION BLOC");
  var input_init = {
    "CP": EditDataTable1buffer_CPIU.number,
    "NAME": EditDataTable1buffer_CPIU.field01,
    "PROCESS01": EditDataTable1buffer_CPIU.field02,
    "PROCESS02": EditDataTable1buffer_CPIU.field03,
    "PROCESS03": EditDataTable1buffer_CPIU.field04,
    "PROCESS04": EditDataTable1buffer_CPIU.field05,
    "PROCESS05": EditDataTable1buffer_CPIU.field06,
    "PROCESS06": EditDataTable1buffer_CPIU.field07,
    "PROCESS07": EditDataTable1buffer_CPIU.field08,
    "PROCESS08": EditDataTable1buffer_CPIU.field09,
    "PROCESS09": EditDataTable1buffer_CPIU.field10,
    "PROCESS10": EditDataTable1buffer_CPIU.field11,
    "PROCESS11": EditDataTable1buffer_CPIU.field12,
    "PROCESS12": EditDataTable1buffer_CPIU.field13,
    "PROCESS13": EditDataTable1buffer_CPIU.field14,
    "PROCESS14": EditDataTable1buffer_CPIU.field15,
    "PROCESS15": EditDataTable1buffer_CPIU.field16,
  };

  final response_init =
      await http.post(Uri.parse(server + "customer_insert"), body: input_init);
  //-------------------------------------------------------------------------
  String input = "hi data";
  print("SELECT FUNCTION BLOC");
  final response =
      await http.post(Uri.parse(server + "customer_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap1_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap1_CPIU(
      number: data_input[i]['CP'].toString(),
      field01: data_input[i]['NAME'].toString(),
      field02: data_input[i]['PROCESS01'].toString(),
      field03: data_input[i]['PROCESS02'].toString(),
      field04: data_input[i]['PROCESS03'].toString(),
      field05: data_input[i]['PROCESS04'].toString(),
      field06: data_input[i]['PROCESS05'].toString(),
      field07: data_input[i]['PROCESS06'].toString(),
      field08: data_input[i]['PROCESS07'].toString(),
      field09: data_input[i]['PROCESS08'].toString(),
      field10: data_input[i]['PROCESS09'].toString(),
      field11: data_input[i]['PROCESS10'].toString(),
      field12: data_input[i]['PROCESS11'].toString(),
      field13: data_input[i]['PROCESS12'].toString(),
      field14: data_input[i]['PROCESS13'].toString(),
      field15: data_input[i]['PROCESS14'].toString(),
      field16: data_input[i]['PROCESS15'].toString(),
      field17: "",
      field18: "",
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;

  yield state;
}

//------------------------------------------------------------------------------

class FetchDataTable2Bloc_CPIU
    extends Bloc<DataSequncePage2_CPIU, List<MainStrucTableTap2_CPIU>> {
  FetchDataTable2Bloc_CPIU() : super([]);

  @override
  Stream<List<MainStrucTableTap2_CPIU>> mapEventToState(
      DataSequncePage2_CPIU event) async* {
    if (event == DataSequncePage2_CPIU.select) {
      yield* selectData2_fn_CPIU(state);
    } else if (event == DataSequncePage2_CPIU.update) {
      yield* updateData2_fn_CPIU(state);
    } else if (event == DataSequncePage2_CPIU.delete) {
      yield* deleteData2_fn_CPIU(state);
    } else if (event == DataSequncePage2_CPIU.insert) {
      yield* InsertData2_fn_CPIU(state);
    }
  }
}

Stream<List<MainStrucTableTap2_CPIU>> selectData2_fn_CPIU(
    List<MainStrucTableTap2_CPIU> state) async* {
  print("SELECT FUNCTION BLOC 2");
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "process_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2_CPIU(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['PROCESS'].toString(),
      field02: data_input[i]['ITEM01'].toString(),
      field03: data_input[i]['ITEM02'].toString(),
      field04: data_input[i]['ITEM03'].toString(),
      field05: data_input[i]['ITEM04'].toString(),
      field06: data_input[i]['ITEM05'].toString(),
      field07: data_input[i]['ITEM06'].toString(),
      field08: data_input[i]['ITEM07'].toString(),
      field09: data_input[i]['ITEM08'].toString(),
      field10: data_input[i]['ITEM09'].toString(),
      field11: data_input[i]['ITEM10'].toString(),
      field12: data_input[i]['ITEM11'].toString(),
      field13: data_input[i]['ITEM12'].toString(),
      field14: data_input[i]['ITEM13'].toString(),
      field15: data_input[i]['ITEM14'].toString(),
      field16: data_input[i]['ITEM15'].toString(),
      field17: "",
      field18: "",
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap2_CPIU>> updateData2_fn_CPIU(
    List<MainStrucTableTap2_CPIU> state) async* {
  print("UPDATE FUNCTION BLOC 2");

  var input_init = {
    "NO": EditDataTable2buffer_CPIU.number,
    "PROCESS": EditDataTable2buffer_CPIU.field01,
    "ITEM01": EditDataTable2buffer_CPIU.field02,
    "ITEM02": EditDataTable2buffer_CPIU.field03,
    "ITEM03": EditDataTable2buffer_CPIU.field04,
    "ITEM04": EditDataTable2buffer_CPIU.field05,
    "ITEM05": EditDataTable2buffer_CPIU.field06,
    "ITEM06": EditDataTable2buffer_CPIU.field07,
    "ITEM07": EditDataTable2buffer_CPIU.field08,
    "ITEM08": EditDataTable2buffer_CPIU.field09,
    "ITEM09": EditDataTable2buffer_CPIU.field10,
    "ITEM10": EditDataTable2buffer_CPIU.field11,
    "ITEM11": EditDataTable2buffer_CPIU.field12,
    "ITEM12": EditDataTable2buffer_CPIU.field13,
    "ITEM13": EditDataTable2buffer_CPIU.field14,
    "ITEM14": EditDataTable2buffer_CPIU.field15,
    "ITEM15": EditDataTable2buffer_CPIU.field16,
  };

  final response_init =
      await http.post(Uri.parse(server + "process_update"), body: input_init);

  //------------------------------------------------------------------------------

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "process_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2_CPIU(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['PROCESS'].toString(),
      field02: data_input[i]['ITEM01'].toString(),
      field03: data_input[i]['ITEM02'].toString(),
      field04: data_input[i]['ITEM03'].toString(),
      field05: data_input[i]['ITEM04'].toString(),
      field06: data_input[i]['ITEM05'].toString(),
      field07: data_input[i]['ITEM06'].toString(),
      field08: data_input[i]['ITEM07'].toString(),
      field09: data_input[i]['ITEM08'].toString(),
      field10: data_input[i]['ITEM09'].toString(),
      field11: data_input[i]['ITEM10'].toString(),
      field12: data_input[i]['ITEM11'].toString(),
      field13: data_input[i]['ITEM12'].toString(),
      field14: data_input[i]['ITEM13'].toString(),
      field15: data_input[i]['ITEM14'].toString(),
      field16: data_input[i]['ITEM15'].toString(),
      field17: "",
      field18: "",
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap2_CPIU>> deleteData2_fn_CPIU(
    List<MainStrucTableTap2_CPIU> state) async* {
  print("DELETE FUNCTION BLOC 2");
  var input_init = {
    "NO": DeleteDataTable2buffer_CPIU.number,
    "PROCESS": DeleteDataTable2buffer_CPIU.field01,
    "ITEM01": DeleteDataTable2buffer_CPIU.field02,
    "ITEM02": DeleteDataTable2buffer_CPIU.field03,
    "ITEM03": DeleteDataTable2buffer_CPIU.field04,
    "ITEM04": DeleteDataTable2buffer_CPIU.field05,
    "ITEM05": DeleteDataTable2buffer_CPIU.field06,
    "ITEM06": DeleteDataTable2buffer_CPIU.field07,
    "ITEM07": DeleteDataTable2buffer_CPIU.field08,
    "ITEM08": DeleteDataTable2buffer_CPIU.field09,
    "ITEM09": DeleteDataTable2buffer_CPIU.field10,
    "ITEM10": DeleteDataTable2buffer_CPIU.field11,
    "ITEM11": DeleteDataTable2buffer_CPIU.field12,
    "ITEM12": DeleteDataTable2buffer_CPIU.field13,
    "ITEM13": DeleteDataTable2buffer_CPIU.field14,
    "ITEM14": DeleteDataTable2buffer_CPIU.field15,
    "ITEM15": DeleteDataTable2buffer_CPIU.field16,
  };

  final response_init =
      await http.post(Uri.parse(server + "process_delete"), body: input_init);
  //------------------------------------------------------------------------------

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "process_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2_CPIU(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['PROCESS'].toString(),
      field02: data_input[i]['ITEM01'].toString(),
      field03: data_input[i]['ITEM02'].toString(),
      field04: data_input[i]['ITEM03'].toString(),
      field05: data_input[i]['ITEM04'].toString(),
      field06: data_input[i]['ITEM05'].toString(),
      field07: data_input[i]['ITEM06'].toString(),
      field08: data_input[i]['ITEM07'].toString(),
      field09: data_input[i]['ITEM08'].toString(),
      field10: data_input[i]['ITEM09'].toString(),
      field11: data_input[i]['ITEM10'].toString(),
      field12: data_input[i]['ITEM11'].toString(),
      field13: data_input[i]['ITEM12'].toString(),
      field14: data_input[i]['ITEM13'].toString(),
      field15: data_input[i]['ITEM14'].toString(),
      field16: data_input[i]['ITEM15'].toString(),
      field17: "",
      field18: "",
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap2_CPIU>> InsertData2_fn_CPIU(
    List<MainStrucTableTap2_CPIU> state) async* {
  print("INSERT FUNCTION BLOC 2");
  var input_init = {
    "NO": EditDataTable2buffer_CPIU.number,
    "PROCESS": EditDataTable2buffer_CPIU.field01,
    "ITEM01": EditDataTable2buffer_CPIU.field02,
    "ITEM02": EditDataTable2buffer_CPIU.field03,
    "ITEM03": EditDataTable2buffer_CPIU.field04,
    "ITEM04": EditDataTable2buffer_CPIU.field05,
    "ITEM05": EditDataTable2buffer_CPIU.field06,
    "ITEM06": EditDataTable2buffer_CPIU.field07,
    "ITEM07": EditDataTable2buffer_CPIU.field08,
    "ITEM08": EditDataTable2buffer_CPIU.field09,
    "ITEM09": EditDataTable2buffer_CPIU.field10,
    "ITEM10": EditDataTable2buffer_CPIU.field11,
    "ITEM11": EditDataTable2buffer_CPIU.field12,
    "ITEM12": EditDataTable2buffer_CPIU.field13,
    "ITEM13": EditDataTable2buffer_CPIU.field14,
    "ITEM14": EditDataTable2buffer_CPIU.field15,
    "ITEM15": EditDataTable2buffer_CPIU.field16,
  };

  final response_init =
      await http.post(Uri.parse(server + "process_insert"), body: input_init);

  //------------------------------------------------------------------------------

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "process_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2_CPIU(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['PROCESS'].toString(),
      field02: data_input[i]['ITEM01'].toString(),
      field03: data_input[i]['ITEM02'].toString(),
      field04: data_input[i]['ITEM03'].toString(),
      field05: data_input[i]['ITEM04'].toString(),
      field06: data_input[i]['ITEM05'].toString(),
      field07: data_input[i]['ITEM06'].toString(),
      field08: data_input[i]['ITEM07'].toString(),
      field09: data_input[i]['ITEM08'].toString(),
      field10: data_input[i]['ITEM09'].toString(),
      field11: data_input[i]['ITEM10'].toString(),
      field12: data_input[i]['ITEM11'].toString(),
      field13: data_input[i]['ITEM12'].toString(),
      field14: data_input[i]['ITEM13'].toString(),
      field15: data_input[i]['ITEM14'].toString(),
      field16: data_input[i]['ITEM15'].toString(),
      field17: "",
      field18: "",
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;
  yield state;
}

//------------------------------------------------------------------------------ 3

class FetchDataTable3Bloc_CPIU
    extends Bloc<DataSequncePage3_CPIU, List<MainStrucTableTap3_CPIU>> {
  FetchDataTable3Bloc_CPIU() : super([]);

  @override
  Stream<List<MainStrucTableTap3_CPIU>> mapEventToState(
      DataSequncePage3_CPIU event) async* {
    if (event == DataSequncePage3_CPIU.select) {
      yield* selectData3_fn_CPIU(state);
    } else if (event == DataSequncePage3_CPIU.update) {
      yield* updateData3_fn_CPIU(state);
    } else if (event == DataSequncePage3_CPIU.delete) {
      yield* deleteData3_fn_CPIU(state);
    } else if (event == DataSequncePage3_CPIU.insert) {
      yield* InsertData3_fn_CPIU(state);
    }
  }
}

Stream<List<MainStrucTableTap3_CPIU>> selectData3_fn_CPIU(
    List<MainStrucTableTap3_CPIU> state) async* {
  print("SELECT FUNCTION BLOC 3");
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "item_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap3_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap3_CPIU(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['ITEM'].toString(),
      field02: data_input[i]['RANGE'].toString(),
      field03: data_input[i]['UNIT'].toString(),
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap3_CPIU>> updateData3_fn_CPIU(
    List<MainStrucTableTap3_CPIU> state) async* {
  print("UPDATE FUNCTION BLOC 3");
  var input_init = {
    "NO": EditDataTable3buffer_CPIU.number,
    "ITEM": EditDataTable3buffer_CPIU.field01,
    "RANGE": EditDataTable3buffer_CPIU.field02,
    "UNIT": EditDataTable3buffer_CPIU.field03,
  };

  final response_init =
      await http.post(Uri.parse(server + "item_update"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "item_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap3_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap3_CPIU(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['ITEM'].toString(),
      field02: data_input[i]['RANGE'].toString(),
      field03: data_input[i]['UNIT'].toString(),
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap3_CPIU>> deleteData3_fn_CPIU(
    List<MainStrucTableTap3_CPIU> state) async* {
  print("DELETE FUNCTION BLOC 3");
  var input_init = {
    "NO": DeleteDataTable3buffer_CPIU.number,
    "ITEM": DeleteDataTable3buffer_CPIU.field01,
    "RANGE": DeleteDataTable3buffer_CPIU.field02,
    "UNIT": DeleteDataTable3buffer_CPIU.field03,
  };

  final response_init =
      await http.post(Uri.parse(server + "item_delete"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "item_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap3_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap3_CPIU(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['ITEM'].toString(),
      field02: data_input[i]['RANGE'].toString(),
      field03: data_input[i]['UNIT'].toString(),
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap3_CPIU>> InsertData3_fn_CPIU(
    List<MainStrucTableTap3_CPIU> state) async* {
  print("INSERT FUNCTION BLOC 3");
  var input_init = {
    "NO": EditDataTable3buffer_CPIU.number,
    "ITEM": EditDataTable3buffer_CPIU.field01,
    "RANGE": EditDataTable3buffer_CPIU.field02,
    "UNIT": EditDataTable3buffer_CPIU.field03,
  };

  final response_init =
      await http.post(Uri.parse(server + "item_insert"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "item_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap3_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap3_CPIU(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['ITEM'].toString(),
      field02: data_input[i]['RANGE'].toString(),
      field03: data_input[i]['UNIT'].toString(),
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

//------------------------------------------------------------------------------ 4

class FetchDataTable4Bloc_CPIU
    extends Bloc<DataSequncePage4_CPIU, List<MainStrucTableTap4_CPIU>> {
  FetchDataTable4Bloc_CPIU() : super([]);

  @override
  Stream<List<MainStrucTableTap4_CPIU>> mapEventToState(
      DataSequncePage4_CPIU event) async* {
    if (event == DataSequncePage4_CPIU.select) {
      yield* selectData4_fn_CPIU(state);
    } else if (event == DataSequncePage4_CPIU.update) {
      yield* updateData4_fn_CPIU(state);
    } else if (event == DataSequncePage4_CPIU.delete) {
      yield* deleteData4_fn_CPIU(state);
    } else if (event == DataSequncePage4_CPIU.insert) {
      yield* InsertData4_fn_CPIU(state);
    }
  }
}

Stream<List<MainStrucTableTap4_CPIU>> selectData4_fn_CPIU(
    List<MainStrucTableTap4_CPIU> state) async* {
  print("SELECT FUNCTION BLOC 4");
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "unit_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap4_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap4_CPIU(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['UNIT'].toString(),
      field02: "",
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
      field11: "",
      field12: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap4_CPIU>> updateData4_fn_CPIU(
    List<MainStrucTableTap4_CPIU> state) async* {
  print("UPDATE FUNCTION BLOC 4");
  var input_init = {
    "NO": EditDataTable4buffer_CPIU.number,
    "UNIT": EditDataTable4buffer_CPIU.field01,
  };

  final response_init =
      await http.post(Uri.parse(server + "unit_update"), body: input_init);

  //------------------------------------------------------------------------------

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "unit_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap4_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap4_CPIU(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['UNIT'].toString(),
      field02: "",
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
      field11: "",
      field12: "",
    ));
  }
  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap4_CPIU>> deleteData4_fn_CPIU(
    List<MainStrucTableTap4_CPIU> state) async* {
  print("DELETE FUNCTION BLOC 4");
  var input_init = {
    "NO": DeleteDataTable4buffer_CPIU.number,
    "UNIT": DeleteDataTable4buffer_CPIU.field01,
  };

  final response_init =
      await http.post(Uri.parse(server + "unit_delete"), body: input_init);

  //------------------------------------------------------------------------------

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "unit_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap4_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap4_CPIU(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['UNIT'].toString(),
      field02: "",
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
      field11: "",
      field12: "",
    ));
  }
  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap4_CPIU>> InsertData4_fn_CPIU(
    List<MainStrucTableTap4_CPIU> state) async* {
  print("INSERT FUNCTION BLOC 4");

  var input_init = {
    "NO": EditDataTable4buffer_CPIU.number,
    "UNIT": EditDataTable4buffer_CPIU.field01,
  };

  final response_init =
      await http.post(Uri.parse(server + "unit_insert"), body: input_init);

  //------------------------------------------------------------------------------

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "unit_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap4_CPIU> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap4_CPIU(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['UNIT'].toString(),
      field02: "",
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
      field11: "",
      field12: "",
    ));
  }
  state = stateoutput;

  yield state;
}

//------------------------------------------------------------------------------ dropdowndata

class DropDownData_CPIU {
  List<String> list01 = [""];
  List<String> list02 = [""];
  List<String> list03 = [""];
  List<String> list04 = [""];
  List<String> list05 = [""];
  List<String> list06 = [""];
  List<String> list07 = [""];
  List<String> list08 = [""];
  List<String> list09 = [""];
  List<String> list10 = [""];

  DropDownData_CPIU({
    required this.list01,
    required this.list02,
    required this.list03,
    required this.list04,
    required this.list05,
    required this.list06,
    required this.list07,
    required this.list08,
    required this.list09,
    required this.list10,
  });
}

DropDownData_CPIU zeroDropDownData_CPIU = DropDownData_CPIU(
  list01: [],
  list02: [],
  list03: [],
  list04: [],
  list05: [],
  list06: [],
  list07: [],
  list08: [],
  list09: [],
  list10: [],
);

class Dropdowndata_CPIU extends Bloc<dropdownrequrst_CPIU, DropDownData_CPIU> {
  Dropdowndata_CPIU() : super(zeroDropDownData_CPIU);

  @override
  Stream<DropDownData_CPIU> mapEventToState(dropdownrequrst_CPIU event) async* {
    if (event == dropdownrequrst_CPIU.set01) {
      yield* set_01_CPIU(state);
    } else if (event == dropdownrequrst_CPIU.set02) {
      yield* set_02_CPIU(state);
    } else if (event == dropdownrequrst_CPIU.set03) {
      yield* set_03_CPIU(state);
    } else if (event == dropdownrequrst_CPIU.set04) {
      yield* set_04_CPIU(state);
    }
  }
}

Stream<DropDownData_CPIU> set_01_CPIU(DropDownData_CPIU state) async* {
  final response =
      await http.post(Uri.parse(server + "set_01_CPIU"), body: {"Qurey": ""});

  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
  } else {
    data_input = '';
    print("where is my server");
  }

  if (data_input != '') {
    state.list01.clear();
    state.list02.clear();
    state.list03.clear();
    state.list04.clear();
    state.list05.clear();
    state.list06.clear();
    state.list07.clear();
    state.list08.clear();
    state.list09.clear();
    state.list10.clear();

    for (var i = 0; i < data_input['list01'].length; i++) {
      // print(data_input['list01'][i].toString());
      state.list01.add(data_input['list01'][i].toString());
    }

    state.list02 = [""];
    state.list03 = [""];
    state.list04 = [""];
    state.list05 = [""];
    state.list06 = [""];
    state.list07 = [""];
    state.list08 = [""];
    state.list09 = [""];
    state.list10 = [""];
  } else {
    state.list01 = [""];
    state.list02 = [""];
    state.list03 = [""];
    state.list04 = [""];
    state.list05 = [""];
    state.list06 = [""];
    state.list07 = [""];
    state.list08 = [""];
    state.list09 = [""];
    state.list10 = [""];
  }

  // print(state.list01);
  // print(state.list02);
  // print(state.list03);

  yield state;
}

Stream<DropDownData_CPIU> set_02_CPIU(DropDownData_CPIU state) async* {
  final response =
      await http.post(Uri.parse(server + "set_02_CPIU"), body: {"Qurey": ""});

  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    data_input = '';
    print("where is my server");
  }

  if (data_input != '') {
    state.list01.clear();
    state.list02.clear();
    state.list03.clear();
    state.list04.clear();
    state.list05.clear();
    state.list06.clear();
    state.list07.clear();
    state.list08.clear();
    state.list09.clear();
    state.list10.clear();

    for (var i = 0; i < data_input['list01'].length; i++) {
      state.list01.add(data_input['list01'][i].toString());
    }

    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  } else {
    state.list01 = [];
    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  }
  yield state;
}

Stream<DropDownData_CPIU> set_03_CPIU(DropDownData_CPIU state) async* {
  final response =
      await http.post(Uri.parse(server + "set_03_CPIU"), body: {"Qurey": ""});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    data_input = '';
    print("where is my server");
  }

  if (data_input != '') {
    state.list01.clear();
    state.list02.clear();
    state.list03.clear();
    state.list04.clear();
    state.list05.clear();
    state.list06.clear();
    state.list07.clear();
    state.list08.clear();
    state.list09.clear();
    state.list10.clear();

    for (var i = 0; i < data_input['list01'].length; i++) {
      state.list01.add(data_input['list01'][i]);
    }

    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  } else {
    state.list01 = [];
    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  }
  yield state;
}

Stream<DropDownData_CPIU> set_04_CPIU(DropDownData_CPIU state) async* {
  final response =
      await http.post(Uri.parse(server + "set_04_CPIU"), body: {"Qurey": ""});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    data_input = '';
    print("where is my server");
  }

  if (data_input != '') {
    state.list01.clear();
    state.list02.clear();
    state.list03.clear();
    state.list04.clear();
    state.list05.clear();
    state.list06.clear();
    state.list07.clear();
    state.list08.clear();
    state.list09.clear();
    state.list10.clear();

    for (var i = 0; i < data_input['list01'].length; i++) {
      state.list01.add(data_input['list01'][i]);
    }

    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  } else {
    state.list01 = [];
    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  }
  yield state;
}

//--------------------------------

class CallDropDownDataS_CPIU {
  String data01 = '';
  String data02 = '';
  String data03 = '';
  String data04 = '';
  String data05 = '';
  String data06 = '';
  String data07 = '';
  String data08 = '';
  String data09 = '';
  String data10 = '';

  CallDropDownDataS_CPIU({
    required this.data01,
    required this.data02,
    required this.data03,
    required this.data04,
    required this.data05,
    required this.data06,
    required this.data07,
    required this.data08,
    required this.data09,
    required this.data10,
  });
}

CallDropDownDataS_CPIU ZeCallDropdowndata_CPIU = CallDropDownDataS_CPIU(
    data01: '',
    data02: '',
    data03: '',
    data04: '',
    data05: '',
    data06: '',
    data07: '',
    data08: '',
    data09: '',
    data10: '');

class CallDropdowndata
    extends Bloc<calldropdownrequrst_CPIU, CallDropDownDataS_CPIU> {
  CallDropdowndata() : super(ZeCallDropdowndata_CPIU);

  @override
  Stream<CallDropDownDataS_CPIU> mapEventToState(
      calldropdownrequrst_CPIU event) async* {
    if (event == calldropdownrequrst_CPIU.set01_1) {
      yield* set_01_1_CPIU(state);
    } else if (event == calldropdownrequrst_CPIU.set02_1) {
      yield* set_02_1_CPIU(state);
    } else if (event == calldropdownrequrst_CPIU.set03_1) {
      yield* set_03_1_CPIU(state);
    } else if (event == calldropdownrequrst_CPIU.set04_1) {
      yield* set_04_2_CPIU(state);
    }
  }
}

Stream<CallDropDownDataS_CPIU> set_01_1_CPIU(
    CallDropDownDataS_CPIU state) async* {
  final response = await http.post(Uri.parse(server + "set_01_1call_CPIU"),
      body: {"Qurey": EditDataTable4buffer_CPIU.field02});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    EditDataTable4_CPIU.field01 = data_input['data01'];
    EditDataTable4_CPIU.field03 = data_input['data02'];
    EditDataTable4_CPIU.field04 = data_input['data03'];
    EditDataTable4_CPIU.field05 = data_input['data04'];
    EditDataTable4buffer_CPIU.field01 = data_input['data01'];
    EditDataTable4buffer_CPIU.field03 = data_input['data02'];
    EditDataTable4buffer_CPIU.field04 = data_input['data03'];
    EditDataTable4buffer_CPIU.field05 = data_input['data04'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS_CPIU> set_02_1_CPIU(
    CallDropDownDataS_CPIU state) async* {
  final response = await http
      .post(Uri.parse(server + "set_02_1call_CPIU"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable6.field01 = data_input['data02'];
    // EditDataTable6buffer.field01 = data_input['data02'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS_CPIU> set_03_1_CPIU(
    CallDropDownDataS_CPIU state) async* {
  final response = await http
      .post(Uri.parse(server + "set_03_1call_CPIU"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable7.field01 = data_input['data02'];
    // EditDataTable7buffer.field01 = data_input['data02'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS_CPIU> set_04_2_CPIU(
    CallDropDownDataS_CPIU state) async* {
  final response = await http
      .post(Uri.parse(server + "set_04_1call_CPIU"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable7.field03 = data_input['data04'];
    // EditDataTable7buffer.field03 = data_input['data04'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}
