import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/bloc/global.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/tabletap/tabletap4/tablebodytap4.dart';
import 'package:pick_edit_datatable/widget/Advancedropdown.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComPageNumBtnGroup.dart';
import 'package:pick_edit_datatable/widget/Easydropdown.dart';

import 'datatap4/datatap4.dart';
import 'modelintable.dart';

class TableTap4Struc extends StatelessWidget {
  const TableTap4Struc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TableStrucBuffer();
  }
}

class _TableStrucBuffer extends StatelessWidget {
  const _TableStrucBuffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FetchDataTable4Bloc_CPIU(),
      child:
          BlocBuilder<FetchDataTable4Bloc_CPIU, List<MainStrucTableTap4_CPIU>>(
        builder: (_, State) {
          return _TableStrucBuffer2(
            State: State,
          );
          // return _TableStrucMain4(
          //     datainput: State,
          //     datadropdown: DropDownData(list01: [], list02: [], list03: []));
        },
      ),
    );
  }
}

class _TableStrucBuffer2 extends StatelessWidget {
  _TableStrucBuffer2({Key? key, required this.State}) : super(key: key);
  final List<MainStrucTableTap4_CPIU> State;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Dropdowndata_CPIU(),
      child: BlocBuilder<Dropdowndata_CPIU, DropDownData_CPIU>(
        builder: (_, Statedrop) {
          return _TableStrucBufferCalldrop(
              State: State, datadropdown: Statedrop);
        },
      ),
    );
  }
}

class _TableStrucBufferCalldrop extends StatelessWidget {
  _TableStrucBufferCalldrop(
      {Key? key, required this.State, required this.datadropdown})
      : super(key: key);
  final List<MainStrucTableTap4_CPIU> State;
  final DropDownData_CPIU datadropdown;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CallDropdowndata(),
      child: BlocBuilder<CallDropdowndata, CallDropDownDataS_CPIU>(
        builder: (_, State2) {
          return _TableStrucMain4(datainput: State, datadropdown: datadropdown);
        },
      ),
    );
  }
}

class _TableStrucMain4 extends StatefulWidget {
  _TableStrucMain4({Key? key, this.datainput, required this.datadropdown})
      : super(key: key);

  final List<MainStrucTableTap4_CPIU>? datainput;
  DropDownData_CPIU datadropdown;

  @override
  __TableStrucMain4State createState() => __TableStrucMain4State();
}

class __TableStrucMain4State extends State<_TableStrucMain4> {
  @override
  void initState() {
    super.initState();
    context.read<FetchDataTable4Bloc_CPIU>().add(DataSequncePage4_CPIU.select);
    // context.read<Dropdowndata>().add(dropdownrequrst_CPIU.set04);
  }

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap4_CPIU> _datainput = widget.datainput ?? [];
    void tapChangeTablePage(int n) {
      setState(() {
        // print(n);
        TableTap4nPage_CPIU = n;
      });
    }

    DropDownData_CPIU _datadropdown = widget.datadropdown;

    // List<String> _list1 = _datadropdown.list01;
    // List<String> _list2 = _datadropdown.list02;
    // List<String> _list3 = _datadropdown.list03;
    // List<String> _list4 = _datadropdown.list04;
    // List<String> _list5 = _datadropdown.list05;
    // List<String> _list6 = _datadropdown.list06;
    // List<String> _list7 = _datadropdown.list07;

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: SingleChildScrollView(
          child: Wrap(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 20, end: 20),
            child: Container(
              // color: Colors.red,
              width: 500,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: CustomTheme.colorGreyBg,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                            color: CustomTheme.colorShadowBgStrong,
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                    ),
                    child: DataListTable4(
                        datainput: _datainput, dropdowndata: _datadropdown),
                  ),
                  _BottomPageNum(
                    func: tapChangeTablePage,
                    datainput: _datainput,
                  )
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsetsDirectional.only(start: 20, end: 20),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: CustomTheme.colorGreyBg,
          //       borderRadius: BorderRadius.all(Radius.circular(24)),
          //       boxShadow: [
          //         BoxShadow(
          //             color: CustomTheme.colorShadowBgStrong,
          //             offset: Offset(0, 0),
          //             blurRadius: 10,
          //             spreadRadius: 0)
          //       ],
          //     ),
          //     width: 1000,
          //     height: 420,
          //     child: Padding(
          //       padding: EdgeInsetsDirectional.only(start: 20, end: 20),
          //       child: Column(
          //         // mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Row(
          //             children: [
          //               Column(
          //                 children: [
          //                   Align(
          //                     alignment: Alignment.topCenter,
          //                     child: Container(
          //                       width: 460,
          //                       height: 30,
          //                       // color: Colors.blue,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 10,
          //                   ),
          //                   Container(
          //                     width: 400,
          //                     height: 40,
          //                     // color: Colors.red,
          //                     child: ComInputText(
          //                       isContr: undercontroltap4,
          //                       fnContr: (input) {
          //                         undercontroltap4 = input;
          //                       },
          //                       sValue: EditDataTable4.number,
          //                       returnfunc: () {},
          //                       isEnabled: false,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 5,
          //                   ),
          //                   Container(
          //                     width: 400,
          //                     height: 40,
          //                     // color: Colors.red,
          //                     child: ComInputText(
          //                         isEnabled: false,
          //                         isContr: undercontroltap4,
          //                         fnContr: (input) {
          //                           undercontroltap4 = input;
          //                         },
          //                         sValue: EditDataTable4.field01,
          //                         returnfunc: (String s) {
          //                           EditDataTable4buffer.field01 = s;
          //                         }),
          //                   ),
          //                   SizedBox(
          //                     height: 5,
          //                   ),
          //                   AdvanceDropDown(
          //                     width: 400,
          //                     height: 40,
          //                     value: CustFull,
          //                     onChangeinside: (newValue) {
          //                       CustFull = newValue!;

          //                       EditDataTable4buffer.field02 = newValue;
          //                       undercontroltap4 = true;
          //                       _onLoading(
          //                           context,
          //                           context
          //                               .read<CallDropdowndata>()
          //                               .add(calldropdownrequrst.set04_1));
          //                       // context
          //                       //     .read<CallDropdowndata>()
          //                       //     .add(calldropdownrequrst.set04_1);
          //                       BlocProvider.of<BlocPageRebuild>(context)
          //                           .rebuildPage();
          //                     },
          //                     listdropdown: _list1,
          //                   ),
          //                   SizedBox(
          //                     height: 5,
          //                   ),
          //                   Container(
          //                     width: 400,
          //                     height: 40,
          //                     // color: Colors.red,
          //                     child: ComInputText(
          //                       isEnabled: false,
          //                       isContr: undercontroltap4,
          //                       fnContr: (input) {
          //                         undercontroltap4 = input;
          //                       },
          //                       sValue: EditDataTable4.field03,
          //                       returnfunc: (String s) {
          //                         EditDataTable4buffer.field03 = s;
          //                       },
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 5,
          //                   ),
          //                   Container(
          //                     width: 400,
          //                     height: 40,
          //                     // color: Colors.red,
          //                     child: ComInputText(
          //                       isEnabled: false,
          //                       isContr: undercontroltap4,
          //                       fnContr: (input) {
          //                         undercontroltap4 = input;
          //                       },
          //                       sValue: EditDataTable4.field04,
          //                       returnfunc: (String s) {
          //                         EditDataTable4buffer.field04 = s;
          //                       },
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 5,
          //                   ),
          //                   Container(
          //                     width: 400,
          //                     height: 40,
          //                     // color: Colors.red,
          //                     child: ComInputText(
          //                       isEnabled: false,
          //                       isContr: undercontroltap4,
          //                       fnContr: (input) {
          //                         undercontroltap4 = input;
          //                       },
          //                       sValue: EditDataTable4.field05,
          //                       returnfunc: (String s) {
          //                         EditDataTable4buffer.field05 = s;
          //                       },
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 5,
          //                   ),
          //                   AdvanceDropDown(
          //                     width: 400,
          //                     height: 40,
          //                     value: FrequencyRequest,
          //                     onChangeinside: (newValue) {
          //                       FrequencyRequest = newValue!;
          //                       EditDataTable4buffer.field06 = newValue;
          //                       BlocProvider.of<BlocPageRebuild>(context)
          //                           .rebuildPage();
          //                     },
          //                     listdropdown: _list2,
          //                   ),
          //                 ],
          //               ),
          //               Column(
          //                 children: [
          //                   Align(
          //                     alignment: Alignment.topCenter,
          //                     child: Container(
          //                       width: 460,
          //                       height: 30,
          //                       // color: Colors.blue,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 10,
          //                   ),
          //                   AdvanceDropDown(
          //                     width: 400,
          //                     height: 40,
          //                     value: Incharge,
          //                     onChangeinside: (newValue) {
          //                       Incharge = newValue!;
          //                       EditDataTable4buffer.field07 = newValue;
          //                       BlocProvider.of<BlocPageRebuild>(context)
          //                           .rebuildPage();
          //                     },
          //                     listdropdown: _list3,
          //                   ),
          //                   SizedBox(
          //                     height: 5,
          //                   ),
          //                   AdvanceDropDown(
          //                     width: 400,
          //                     height: 40,
          //                     value: SubLeader,
          //                     onChangeinside: (newValue) {
          //                       SubLeader = newValue!;
          //                       EditDataTable4buffer.field08 = newValue;
          //                       BlocProvider.of<BlocPageRebuild>(context)
          //                           .rebuildPage();
          //                     },
          //                     listdropdown: _list4,
          //                   ),
          //                   SizedBox(
          //                     height: 5,
          //                   ),
          //                   AdvanceDropDown(
          //                     width: 400,
          //                     height: 40,
          //                     value: GL,
          //                     onChangeinside: (newValue) {
          //                       GL = newValue!;
          //                       EditDataTable4buffer.field09 = newValue;
          //                       BlocProvider.of<BlocPageRebuild>(context)
          //                           .rebuildPage();
          //                     },
          //                     listdropdown: _list5,
          //                   ),
          //                   SizedBox(
          //                     height: 5,
          //                   ),
          //                   AdvanceDropDown(
          //                     width: 400,
          //                     height: 40,
          //                     value: JP,
          //                     onChangeinside: (newValue) {
          //                       JP = newValue!;
          //                       EditDataTable4buffer.field10 = newValue;
          //                       BlocProvider.of<BlocPageRebuild>(context)
          //                           .rebuildPage();
          //                     },
          //                     listdropdown: _list6,
          //                   ),
          //                   SizedBox(
          //                     height: 5,
          //                   ),
          //                   AdvanceDropDown(
          //                     width: 400,
          //                     height: 40,
          //                     value: DMG,
          //                     onChangeinside: (newValue) {
          //                       DMG = newValue!;
          //                       EditDataTable4buffer.field11 = newValue;
          //                       BlocProvider.of<BlocPageRebuild>(context)
          //                           .rebuildPage();
          //                     },
          //                     listdropdown: _list7,
          //                   ),
          //                   Container(
          //                     width: 400,
          //                     height: 40,
          //                     // color: Colors.red,
          //                   ),
          //                   SizedBox(
          //                     height: 10,
          //                   ),
          //                   Container(
          //                     width: 400,
          //                     height: 40,
          //                     // color: Colors.red,
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           Align(
          //             alignment: Alignment.bottomCenter,
          //             child: Container(
          //               width: 460,
          //               height: 40,
          //               // color: Colors.blue,
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   ComBtnBlack(
          //                       sLabel: "Save",
          //                       func: () {
          //                         // EditDataTable4buffer = EditDataTable4;
          //                         context.read<FetchDataTable4Bloc>().add(
          //                             DataSequncePage4
          //                                 .update); //<------------------
          //                       },
          //                       nWidth: 134),
          //                   SizedBox(
          //                     width: 10,
          //                   ),
          //                   ComBtnBlackBorder(
          //                       sLabel: "Cancle",
          //                       cBg: Colors.red,
          //                       func: () {
          //                         undercontroltap4 = true;
          //                         EditDataTable4 = MainStrucTableTap4(
          //                           number: "",
          //                           field01: "",
          //                           field02: "",
          //                           field03: "",
          //                           field04: "",
          //                           field05: "",
          //                           field06: "",
          //                           field07: "",
          //                           field08: "",
          //                           field09: "",
          //                           field10: "",
          //                           field11: "",
          //                           field12: "",
          //                         );
          //                         BlocProvider.of<BlocPageRebuild>(context)
          //                             .rebuildPage();
          //                       },
          //                       nWidth: 134),
          //                   SizedBox(
          //                     width: 10,
          //                   ),
          //                   ComBtnBlackBorder(
          //                       sLabel: "New",
          //                       func: () {
          //                         context
          //                             .read<FetchDataTable4Bloc>()
          //                             .add(DataSequncePage4.insert);
          //                       },
          //                       nWidth: 134),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      )),
    );
  }
}

class _BottomPageNum extends StatelessWidget {
  _BottomPageNum({Key? key, required this.func, this.datainput})
      : super(key: key);
  final Function func;
  List<MainStrucTableTap4_CPIU>? datainput;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;
    List<MainStrucTableTap4_CPIU> _datainput = datainput ?? [];

    //print("build BottomPageNum " + BlocPatientList.state.patientTableData.length.toString());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Pages",
          style: TxtStyle(fontSize: 12),
        ),
        ComPageNumBtnGroup(
          nItemNum: _datainput.length,
          nPageSelects: TableTap4nPage_CPIU,
          func: func,
          nNumToShowArrowAtPage: nNumToShowArrowAtPageTable4_CPIU,
          nTableCellPerEachPage: nTableCellPerEachPageTable4_CPIU,
        )
      ],
    );
  }
}

void _onLoading(BuildContext contextin, void newValue) {
  showDialog(
    context: contextin,
    barrierDismissible: false,
    builder: (BuildContext context) {
      newValue;
      return Container(
        // color: Colors.red,

        child: Dialog(
          child: Container(
              height: 75,
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 30),
                  new CircularProgressIndicator(),
                  SizedBox(width: 20),
                  new Text("Loading"),
                ],
              )),
        ),
      );
    },
  );

  Timer(Duration(seconds: 1), () {
    BlocProvider.of<BlocPageRebuild>(contextin).rebuildPage();
    Navigator.pop(contextin);
  });
}
