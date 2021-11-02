import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/tabletap/tabletap3/tablebodytap3.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComPageNumBtnGroup.dart';

import 'datatap3/datatap3.dart';
import 'modelintable.dart';

class TableTap3Struc extends StatelessWidget {
  const TableTap3Struc({Key? key}) : super(key: key);

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
      create: (_) => FetchDataTable3Bloc_CPIU(),
      child:
          BlocBuilder<FetchDataTable3Bloc_CPIU, List<MainStrucTableTap3_CPIU>>(
        builder: (_, State) {
          return _TableStrucBuffer2(
            State: State,
          );
        },
      ),
    );
  }
}

class _TableStrucBuffer2 extends StatelessWidget {
  _TableStrucBuffer2({Key? key, required this.State}) : super(key: key);
  final List<MainStrucTableTap3_CPIU> State;

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
  final List<MainStrucTableTap3_CPIU> State;
  final DropDownData_CPIU datadropdown;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CallDropdowndata(),
      child: BlocBuilder<CallDropdowndata, CallDropDownDataS_CPIU>(
        builder: (_, State2) {
          return _TableStrucMain3(datainput: State, datadropdown: datadropdown);
        },
      ),
    );
  }
}

class _TableStrucMain3 extends StatefulWidget {
  _TableStrucMain3({Key? key, this.datainput, required this.datadropdown})
      : super(key: key);

  final List<MainStrucTableTap3_CPIU>? datainput;
  DropDownData_CPIU datadropdown;

  @override
  __TableStrucMain3State createState() => __TableStrucMain3State();
}

class __TableStrucMain3State extends State<_TableStrucMain3> {
  @override
  void initState() {
    super.initState();
    context.read<FetchDataTable3Bloc_CPIU>().add(DataSequncePage3_CPIU.select);
    context.read<Dropdowndata_CPIU>().add(dropdownrequrst_CPIU.set03);
  }

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap3_CPIU> _datainput = widget.datainput ?? [];
    void tapChangeTablePage(int n) {
      setState(() {
        // print(n);
        TableTap3nPage_CPIU = n;
      });
    }

    DropDownData_CPIU _datadropdown = widget.datadropdown;

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
          Container(
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
                  child: DataListTable3(
                      datainput: _datainput, dropdowndata: _datadropdown),
                ),
                _BottomPageNum(
                  func: tapChangeTablePage,
                  datainput: _datainput,
                )
              ],
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
          //     width: 500,
          //     height: 300,
          //     child: Column(
          //       // mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Align(
          //           alignment: Alignment.topCenter,
          //           child: Container(
          //             width: 460,
          //             height: 50,
          //             // color: Colors.blue,
          //           ),
          //         ),
          //         SizedBox(
          //           height: 10,
          //         ),
          //         Container(
          //           width: 400,
          //           height: 40,
          //           // color: Colors.red,
          //           child: ComInputText(
          //             isContr: undercontroltap3,
          //             fnContr: (input) {
          //               undercontroltap3 = input;
          //             },
          //             sValue: EditDataTable3.number,
          //             returnfunc: () {},
          //             isEnabled: false,
          //           ),
          //         ),
          //         SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           width: 400,
          //           height: 40,
          //           // color: Colors.red,
          //           child: ComInputText(
          //               isContr: undercontroltap3,
          //               fnContr: (input) {
          //                 undercontroltap3 = input;
          //               },
          //               sValue: EditDataTable3.field01,
          //               returnfunc: (String s) {
          //                 EditDataTable3buffer.field01 = s;
          //               }),
          //         ),
          //         SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           width: 400,
          //           height: 40,
          //           // color: Colors.red,
          //           child: ComInputText(
          //             isContr: undercontroltap3,
          //             fnContr: (input) {
          //               undercontroltap3 = input;
          //             },
          //             sValue: EditDataTable3.field02,
          //             returnfunc: (String s) {
          //               EditDataTable3buffer.field02 = s;
          //             },
          //           ),
          //         ),
          //         SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           width: 400,
          //           height: 40,
          //           // color: Colors.red,
          //           child: ComInputText(
          //             isContr: undercontroltap3,
          //             fnContr: (input) {
          //               undercontroltap3 = input;
          //             },
          //             sValue: EditDataTable3.field03,
          //             returnfunc: (String s) {
          //               EditDataTable3buffer.field03 = s;
          //             },
          //           ),
          //         ),
          //         // SizedBox(
          //         //   height: 5,
          //         // ),
          //         // Container(
          //         //   width: 400,
          //         //   height: 40,
          //         //   // color: Colors.red,
          //         //   child: ComInputText(
          //         //     isContr: undercontroltap3,
          //         //     fnContr: (input) {
          //         //       undercontroltap3 = input;
          //         //     },
          //         //     sValue: EditDataTable3.field04,
          //         //     returnfunc: (String s) {
          //         //       EditDataTable3buffer.field04 = s;
          //         //     },
          //         //   ),
          //         // ),
          //         SizedBox(
          //           height: 10,
          //         ),
          //         Align(
          //           alignment: Alignment.bottomCenter,
          //           child: Container(
          //             width: 460,
          //             height: 40,
          //             // color: Colors.blue,
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 ComBtnBlack(
          //                     sLabel: "Save",
          //                     func: () {
          //                       // EditDataTable3buffer = EditDataTable3;
          //                       context.read<FetchDataTable3Bloc>().add(
          //                           DataSequncePage3
          //                               .update); //<------------------
          //                     },
          //                     nWidth: 134),
          //                 SizedBox(
          //                   width: 10,
          //                 ),
          //                 ComBtnBlackBorder(
          //                     sLabel: "Cancle",
          //                     cBg: Colors.red,
          //                     func: () {
          //                       undercontroltap3 = true;
          //                       EditDataTable3 = MainStrucTableTap3(
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
          //                           field10: "");
          //                       BlocProvider.of<BlocPageRebuild>(context)
          //                           .rebuildPage();
          //                     },
          //                     nWidth: 134),
          //                 SizedBox(
          //                   width: 10,
          //                 ),
          //                 ComBtnBlackBorder(
          //                     sLabel: "New",
          //                     func: () {
          //                       context
          //                           .read<FetchDataTable3Bloc>()
          //                           .add(DataSequncePage3.insert);
          //                     },
          //                     nWidth: 134),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
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
  List<MainStrucTableTap3_CPIU>? datainput;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;
    List<MainStrucTableTap3_CPIU> _datainput = datainput ?? [];

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
          nPageSelects: TableTap3nPage_CPIU,
          func: func,
          nNumToShowArrowAtPage: nNumToShowArrowAtPageTable3_CPIU,
          nTableCellPerEachPage: nTableCellPerEachPageTable3_CPIU,
        )
      ],
    );
  }
}
