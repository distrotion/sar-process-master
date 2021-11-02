import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';

import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/tabletap/tabletap2/datatap2/datatap2.dart';
import 'package:pick_edit_datatable/tabletap/tabletap2/tablestruc2.dart';
import 'package:pick_edit_datatable/widget/Advancedropdown.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComBtnImage.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComYNPopup.dart';
import 'package:pick_edit_datatable/widget/Easydropdown.dart';

import 'modelintable.dart';

int ListTable2Status_CPIU = 0;

class DataListTable2_CPIU extends StatefulWidget {
  DataListTable2_CPIU(
      {Key? key, required this.datainput, required this.dropdowndata})
      : super(key: key);
  final List<MainStrucTableTap2_CPIU> datainput;
  DropDownData_CPIU dropdowndata;
  @override
  _DataListTable2_CPIUState createState() => _DataListTable2_CPIUState();
}

class _DataListTable2_CPIUState extends State<DataListTable2_CPIU> {
  int nCurrentSortIndex = 0; //index from Header DataColumn
  bool isSortAscending = true;

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap2_CPIU> Listdata_Clone = widget.datainput;

    double nDataColumnWidth = 75;
    double nDataColumnWidthIcon = 100;
    double nDataWidthIcon = 50;
    double nMarginToMakeIconSmaller = 8;

    void tapSort(int nIndex, int columnIndex, bool ascending) {
      if (ascending) {
        print(nIndex);
        switch (nIndex) {
          case 1:
            Listdata_Clone.sort(
                (item1, item2) => item1.field01.compareTo(item2.field01));
            break;
          case 2:
            Listdata_Clone.sort(
                (item1, item2) => item1.field02.compareTo(item2.field02));
            break;
          case 3:
            Listdata_Clone.sort(
                (item1, item2) => item1.field03.compareTo(item2.field03));
            break;
          case 4:
            Listdata_Clone.sort(
                (item1, item2) => item1.field04.compareTo(item2.field04));
            break;
          case 5:
            Listdata_Clone.sort(
                (item1, item2) => item1.field05.compareTo(item2.field05));
            break;
          case 6:
            Listdata_Clone.sort(
                (item1, item2) => item1.field06.compareTo(item2.field06));
            break;
        }
      } else {
        switch (nIndex) {
          case 1:
            Listdata_Clone.sort(
                (item1, item2) => item2.field01.compareTo(item1.field01));
            break;
          case 2:
            Listdata_Clone.sort(
                (item1, item2) => item2.field02.compareTo(item1.field02));
            break;
          case 3:
            Listdata_Clone.sort(
                (item1, item2) => item2.field03.compareTo(item1.field03));
            break;
          case 4:
            Listdata_Clone.sort(
                (item1, item2) => item2.field04.compareTo(item1.field04));
            break;
          case 5:
            Listdata_Clone.sort(
                (item1, item2) => item2.field05.compareTo(item1.field05));
            break;
          case 6:
            Listdata_Clone.sort(
                (item1, item2) => item2.field06.compareTo(item1.field06));
            break;
        }
      }
      //BlocPatientList.sort();
      setState(() {
        nCurrentSortIndex = columnIndex;
        isSortAscending = ascending;
      });
    }

    //------------------------------------------------------------------------------------------------

    void _tapView(MainStrucTableTap2_CPIU s) {
      //click all
      // print("123");
      ListTable2Status_CPIU = 1;
      EditDataTable2_CPIU = s;
      EditDataTable2buffer_CPIU = s;
      undercontroltap2_CPIU = true;
      ITEMlist = [
        s.field02,
        s.field03,
        s.field04,
        s.field05,
        s.field06,
        s.field07,
        s.field08,
        s.field09,
        s.field10,
        s.field11,
        s.field12,
        s.field13,
        s.field14,
        s.field15,
        s.field16,
      ];

      context
          .read<FetchDataTable2Bloc_CPIU>()
          .add(DataSequncePage2_CPIU.select);
      _ConsoleBox(s, context, widget.dropdowndata);
    }

    void _CallYNPopup(
        String sTxtHead,
        String sTxtBody,
        String sTxtBtnYes,
        String sTxtBtnNo,
        Function funcYes,
        Function funcNo,
        String sFuncData,
        bool isSwitchYNBtnPos) {
      showDialog<String>(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => ComYNPopup(
          sTxtHead: sTxtHead,
          sTxtBody: sTxtBody,
          sTxtBtnYes: sTxtBtnYes,
          sTxtBtnNo: sTxtBtnNo,
          funcYes: funcYes,
          funcNo: funcNo,
          sFuncData: sFuncData,
          isSwitchYNBtnPos: isSwitchYNBtnPos,
        ),
      );
    }

    void _CloseYNPopup() {
      Navigator.pop(context, '');
    }

    // void GoToTele(String s) {
    //   CloseYNPopup();
    //   BlocProvider.of<BlocChangePage>(context).changePage(enumPageList.Tele);
    // }
    void _Edit(MainStrucTableTap2_CPIU s) {
      _CloseYNPopup();
      BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
    }

    void _Delete(String s) {
      _CloseYNPopup();
      context
          .read<FetchDataTable2Bloc_CPIU>()
          .add(DataSequncePage2_CPIU.delete);
    }

    void _tapEdit(MainStrucTableTap2_CPIU s) {
      // _CallYNPopup('Edit ${s}', 'Do you want to Edit ${s} now?', 'Yes', 'No',
      //     _Edit, _CloseYNPopup, s, false);
      EditDataTable2_CPIU = s;
      EditDataTable2buffer_CPIU = s;
      undercontroltap2_CPIU = true;
      context
          .read<FetchDataTable2Bloc_CPIU>()
          .add(DataSequncePage2_CPIU.select);
      // BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
    }

    void _tapDelete(MainStrucTableTap2_CPIU s) {
      DeleteDataTable2buffer_CPIU.number = s.number;
      DeleteDataTable2buffer_CPIU.field01 = s.field01;
      DeleteDataTable2buffer_CPIU.field02 = s.field02;
      DeleteDataTable2buffer_CPIU.field03 = s.field03;
      DeleteDataTable2buffer_CPIU.field04 = s.field04;
      DeleteDataTable2buffer_CPIU.field05 = s.field05;
      DeleteDataTable2buffer_CPIU.field06 = s.field06;
      _CallYNPopup(
          'Delete ${s.number}',
          'Are you sure you want to delete ${s.number}?',
          'Delete',
          'Cancel',
          _Delete,
          _CloseYNPopup,
          s.number,
          true);
    }

    //all cells data for this page.
    List<DataRow> RowDataInput = _getDataRowList(
      Listdata_Clone,
      nDataColumnWidth,
      nDataColumnWidthIcon,
      nDataWidthIcon,
      nMarginToMakeIconSmaller,
      _tapView,
      _tapEdit,
      _tapDelete,
      TableTap2nPage_CPIU, //data
    );

    //fixed error when sort the hide column on mobile
    // nCurrentSortIndex = 0;

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 30,
                // color: Colors.red,
                child: ComBtnBlackBorder(
                    sLabel: "New",
                    func: () {
                      ListTable2Status_CPIU = 0;
                      MainStrucTableTap2_CPIU Zerodata_CPIU =
                          MainStrucTableTap2_CPIU(
                        number: "",
                        field01: "",
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
                        field13: "",
                        field14: "",
                        field15: "",
                        field16: "",
                        field17: "",
                        field18: "",
                        field19: "",
                        field20: "",
                      );
                      // CustFull = '';
                      // FrequencyRequest = '';
                      // Incharge = '';
                      // SubLeader = '';
                      // GL = '';
                      // JP = '';
                      // DMG = '';
                      BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                      _ConsoleBox(Zerodata_CPIU, context, widget.dropdowndata);
                    },
                    nWidth: 134),
              ),
              // SizedBox(
              //   width: 100,
              // ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              sortColumnIndex: nCurrentSortIndex,
              sortAscending: isSortAscending,
              showCheckboxColumn:
                  false, //Hide checkbox that come from tap row 'onselectchanged'
              columnSpacing: 10,
              dataRowHeight: 56,
              // Header Column -----------------------------------------------------------
              columns: [
                _getDataColumn(
                    1, "No", 'Sort Field 1', nDataColumnWidth, tapSort),
                _getDataColumn(
                    2, "PROCESS", 'Sort Field 2', nDataColumnWidth, tapSort),
                _getDataColumn(
                    3, "ITEM01", 'Sort Field 3', nDataColumnWidth, tapSort),
                _getDataColumn(
                    4, "ITEM02", 'Sort Field 4', nDataColumnWidth, tapSort),
                _getDataColumn(
                    5, "ITEM03", 'Sort Field 5', nDataColumnWidth, tapSort),
                _getDataColumn(
                    6, "ITEM04", 'Sort Field 6', nDataColumnWidth, tapSort),
                _getDataColumn(
                    7, "ITEM05", 'Sort Field 6', nDataColumnWidth, tapSort),
                _getDataColumn(
                    8, "ITEM06", 'Sort Field 6', nDataColumnWidth, tapSort),
                _getDataColumn(
                    9, "ITEM07", 'Sort Field 6', nDataColumnWidth, tapSort),
                _getDataColumn(
                    10, "ITEM08", 'Sort Field 6', nDataColumnWidth, tapSort),
                _getDataColumn(
                    11, "ITEM09", 'Sort Field 6', nDataColumnWidth, tapSort),
                _getDataColumn(
                    12, "ITEM10", 'Sort Field 6', nDataColumnWidth, tapSort),
                _getDataColumn(
                    13, "ITEM11", 'Sort Field 6', nDataColumnWidth, tapSort),
                _getDataColumn(
                    14, "ITEM12", 'Sort Field 6', nDataColumnWidth, tapSort),
                _getDataColumn(
                    15, "ITEM13", 'Sort Field 6', nDataColumnWidth, tapSort),
                _getDataColumn(
                    16, "ITEM14", 'Sort Field 6', nDataColumnWidth, tapSort),
                _getDataColumn(
                    17, "ITEM15", 'Sort Field 6', nDataColumnWidth, tapSort),
                _getBlankDataColumn(nDataColumnWidthIcon),
              ],
              // Cell Row  -----------------------------------------------------------
              rows: [
                for (DataRow dataRow in RowDataInput) dataRow,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Header Column --------------------------------------------------------------

DataColumn _getDataColumn(int nIndex, String sLabel, String sTooltip,
    double nDataColumnWidth, Function func) {
  return DataColumn(
    label: Container(
      width: nDataColumnWidth,
      child: Text(sLabel),
      //color: Colors.red,
    ),
    numeric: false,
    tooltip: sTooltip,
    onSort: (int columnIndex, bool ascending) {
      func(nIndex, columnIndex, ascending);
    },
  );
}

// blank for call icon
DataColumn _getBlankDataColumn(double nDataColumnWidthIcon) {
  return DataColumn(
    label: Expanded(
      child: Container(
          // color: Colors.red,
          ),
    ),
  );
}

// Cell Row -------------------------------------------------------------------
List<DataRow> _getDataRowList(
  List<MainStrucTableTap2_CPIU> Listdata_Clone,
  double nDataColumnWidth,
  double nDataColumnWidthIcon,
  double nDataWidthIcon,
  double nMarginToMakeIconSmaller,
  // enumScreenResponsiveList screenResponsive,
  Function funcView,
  Function funcEdit,
  Function funcDelete,
  int currentPage,
) {
  int nStartCell = (currentPage - 1) * nTableCellPerEachPageTable2_CPIU;

  List<DataRow> dataRowList = [];
  for (int n = nStartCell;
      n < (nStartCell + nTableCellPerEachPageTable2_CPIU);
      n++) {
    if (n < Listdata_Clone.length) {
      dataRowList.add(_getDataRow(
        Listdata_Clone[n].number,
        Listdata_Clone[n].field01,
        Listdata_Clone[n].field02,
        Listdata_Clone[n].field03,
        Listdata_Clone[n].field04,
        Listdata_Clone[n].field05,
        Listdata_Clone[n].field06,
        Listdata_Clone[n].field07,
        Listdata_Clone[n].field08,
        Listdata_Clone[n].field09,
        Listdata_Clone[n].field10,
        Listdata_Clone[n].field11,
        Listdata_Clone[n].field12,
        Listdata_Clone[n].field13,
        Listdata_Clone[n].field14,
        Listdata_Clone[n].field15,
        Listdata_Clone[n].field16,
        nDataColumnWidth,
        nDataColumnWidthIcon,
        nDataWidthIcon,
        nMarginToMakeIconSmaller,
        // screenResponsive,
        funcView,
        funcEdit,
        funcDelete,
        Listdata_Clone[n],
      ));
    }
  }
  return dataRowList;
}

DataRow _getDataRow(
    String number,
    String field01,
    String field02,
    String field03,
    String field04,
    String field05,
    String field06,
    String field07,
    String field08,
    String field09,
    String field10,
    String field11,
    String field12,
    String field13,
    String field14,
    String field15,
    String field16,
    double nDataColumnWidth,
    double nDataColumnWidthIcon,
    double nDataWidthIcon,
    double nMarginToMakeIconSmaller,
    // enumScreenResponsiveList screenResponsive,
    Function funcView,
    Function funcEdit,
    Function funcDelete,
    MainStrucTableTap2_CPIU getData) {
  //cells num must be match header column num

  return DataRow(
      cells: [
        _getDataCell_Label(number, nDataColumnWidth),
        _getDataCell_Label(field01, nDataColumnWidth),
        _getDataCell_Label(field02, nDataColumnWidth),
        _getDataCell_Label(field03, nDataColumnWidth),
        _getDataCell_Label(field04, nDataColumnWidth),
        _getDataCell_Label(field05, nDataColumnWidth),
        _getDataCell_Label(field06, nDataColumnWidth),
        _getDataCell_Label(field07, nDataColumnWidth),
        _getDataCell_Label(field08, nDataColumnWidth),
        _getDataCell_Label(field09, nDataColumnWidth),
        _getDataCell_Label(field10, nDataColumnWidth),
        _getDataCell_Label(field11, nDataColumnWidth),
        _getDataCell_Label(field12, nDataColumnWidth),
        _getDataCell_Label(field13, nDataColumnWidth),
        _getDataCell_Label(field14, nDataColumnWidth),
        _getDataCell_Label(field15, nDataColumnWidth),
        _getDataCell_Label(field16, nDataColumnWidth),
        _getDataCell_Icon(number, funcEdit, funcDelete, nDataColumnWidthIcon,
            nDataWidthIcon, nMarginToMakeIconSmaller, getData),
      ],
      onSelectChanged: (value) {
        // funcView(number);
        // print(value);
        // print(number);
        funcView(getData);
      });
}

DataCell _getDataCell_ImgName(
    String sName, double nDataColumnWidth, int nGender) {
  return DataCell(InkWell(
      child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              // ComProfileImg(
              //   profileImg: enumProfileImgList.Patient_Default,
              //   nGender: nGender,
              //   nWidthHeight: 40,
              // ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Text(sName,
                      overflow: TextOverflow.fade, softWrap: false)),
            ],
          ))));
}

// each cell inside 1 row
DataCell _getDataCell_Label(String sLabel, double nDataColumnWidth) {
  return DataCell(InkWell(
      child: Container(
    // color: Colors.red,
    width: nDataColumnWidth,
    child: Text(sLabel, overflow: TextOverflow.fade, softWrap: false),
  )));
}

DataCell _getDataCell_Icon(
    String sId,
    Function funcEdit,
    Function funcDelete,
    double nDataColumnWidthIcon,
    double nDataWidthIcon,
    double nMarginToMakeIconSmaller,
    MainStrucTableTap2_CPIU GetData) {
  void _tapEdit() {
    funcEdit(GetData);
  }

  void _tapDelete() {
    funcDelete(GetData);
  }

  return DataCell(
    Container(
      width: nDataColumnWidthIcon,
      // color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Container(
          //   width: nDataWidthIcon,
          //   height: 100,
          //   // color: Colors.blue,
          //   child: ComBtnImage(
          //     sImgPath: Icons.edit,
          //     func: _tapEdit,
          //     nMarginToMakeIconSmaller: nMarginToMakeIconSmaller,
          //   ),
          // ),
          Container(
            width: nDataWidthIcon,
            height: 100,
            child: ComBtnImage(
              sImgPath: Icons.delete,
              func: _tapDelete,
              nMarginToMakeIconSmaller: nMarginToMakeIconSmaller,
            ),
          ),
        ],
      ),
    ),
  );
}

void _ConsoleBox(MainStrucTableTap2_CPIU input, BuildContext contextinput,
    DropDownData_CPIU dropdowndata) {
  showDialog(
    context: contextinput,
    barrierDismissible: true,
    builder: (BuildContext context) {
      DropDownData_CPIU _datadropdown = dropdowndata;
      List<String> _list1 = _datadropdown.list01;

      return Dialog(
        child: Container(
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
          width: 1350,
          height: 450,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 350,
                          height: 20,
                          // color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft, child: Text("ID")),
                      ),
                      Container(
                        width: 350,
                        height: 40,
                        // color: Colors.red,
                        child: ComInputText(
                          isContr: undercontroltap2_CPIU,
                          fnContr: (input) {
                            undercontroltap2_CPIU = input;
                          },
                          sValue: EditDataTable2_CPIU.number,
                          returnfunc: () {},
                          isEnabled: false,
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("PRCESS NAME")),
                      ),
                      Container(
                        width: 350,
                        height: 40,
                        // color: Colors.red,
                        child: ComInputText(
                            isContr: undercontroltap2_CPIU,
                            fnContr: (input) {
                              undercontroltap2_CPIU = input;
                            },
                            sValue: EditDataTable2_CPIU.field01,
                            returnfunc: (String s) {
                              EditDataTable2buffer_CPIU.field01 = s;
                            }),
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ITEM01")),
                      ),
                      AdvanceDropDown(
                        width: 350,
                        height: 40,
                        value: ITEMlist[0],
                        onChangeinside: (newValue) {
                          ITEMlist[0] = newValue!;
                          EditDataTable2buffer_CPIU.field02 = newValue;
                          BlocProvider.of<BlocPageRebuild>(contextinput)
                              .rebuildPage();
                        },
                        listdropdown: _list1,
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ITEM02")),
                      ),
                      AdvanceDropDown(
                        width: 350,
                        height: 40,
                        value: ITEMlist[1],
                        onChangeinside: (newValue) {
                          ITEMlist[1] = newValue!;
                          EditDataTable2buffer_CPIU.field03 = newValue;
                          BlocProvider.of<BlocPageRebuild>(contextinput)
                              .rebuildPage();
                        },
                        listdropdown: _list1,
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ITEM03")),
                      ),
                      AdvanceDropDown(
                        width: 350,
                        height: 40,
                        value: ITEMlist[2],
                        onChangeinside: (newValue) {
                          ITEMlist[2] = newValue!;
                          EditDataTable2buffer_CPIU.field04 = newValue;
                          BlocProvider.of<BlocPageRebuild>(contextinput)
                              .rebuildPage();
                        },
                        listdropdown: _list1,
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ITEM04")),
                      ),
                      AdvanceDropDown(
                        width: 350,
                        height: 40,
                        value: ITEMlist[3],
                        onChangeinside: (newValue) {
                          ITEMlist[3] = newValue!;
                          EditDataTable2buffer_CPIU.field05 = newValue;
                          BlocProvider.of<BlocPageRebuild>(contextinput)
                              .rebuildPage();
                        },
                        listdropdown: _list1,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 350,
                          height: 20,
                          // color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ITEM05")),
                      ),
                      AdvanceDropDown(
                        width: 350,
                        height: 40,
                        value: ITEMlist[4],
                        onChangeinside: (newValue) {
                          ITEMlist[4] = newValue!;
                          EditDataTable2buffer_CPIU.field06 = newValue;
                          BlocProvider.of<BlocPageRebuild>(contextinput)
                              .rebuildPage();
                        },
                        listdropdown: _list1,
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ITEM06")),
                      ),
                      AdvanceDropDown(
                        width: 350,
                        height: 40,
                        value: ITEMlist[5],
                        onChangeinside: (newValue) {
                          ITEMlist[5] = newValue!;
                          EditDataTable2buffer_CPIU.field07 = newValue;
                          BlocProvider.of<BlocPageRebuild>(contextinput)
                              .rebuildPage();
                        },
                        listdropdown: _list1,
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ITEM07")),
                      ),
                      AdvanceDropDown(
                        width: 350,
                        height: 40,
                        value: ITEMlist[6],
                        onChangeinside: (newValue) {
                          ITEMlist[6] = newValue!;
                          EditDataTable2buffer_CPIU.field08 = newValue;
                          BlocProvider.of<BlocPageRebuild>(contextinput)
                              .rebuildPage();
                        },
                        listdropdown: _list1,
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ITEM08")),
                      ),
                      AdvanceDropDown(
                        width: 350,
                        height: 40,
                        value: ITEMlist[7],
                        onChangeinside: (newValue) {
                          ITEMlist[7] = newValue!;
                          EditDataTable2buffer_CPIU.field09 = newValue;
                          BlocProvider.of<BlocPageRebuild>(contextinput)
                              .rebuildPage();
                        },
                        listdropdown: _list1,
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ITEM09")),
                      ),
                      AdvanceDropDown(
                        width: 350,
                        height: 40,
                        value: ITEMlist[8],
                        onChangeinside: (newValue) {
                          ITEMlist[8] = newValue!;
                          EditDataTable2buffer_CPIU.field10 = newValue;
                          BlocProvider.of<BlocPageRebuild>(contextinput)
                              .rebuildPage();
                        },
                        listdropdown: _list1,
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ITEM10")),
                      ),
                      AdvanceDropDown(
                        width: 350,
                        height: 40,
                        value: ITEMlist[9],
                        onChangeinside: (newValue) {
                          ITEMlist[9] = newValue!;
                          EditDataTable2buffer_CPIU.field11 = newValue;
                          BlocProvider.of<BlocPageRebuild>(contextinput)
                              .rebuildPage();
                        },
                        listdropdown: _list1,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 350,
                          height: 20,
                          // color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ITEM11")),
                      ),
                      AdvanceDropDown(
                        width: 350,
                        height: 40,
                        value: ITEMlist[10],
                        onChangeinside: (newValue) {
                          ITEMlist[10] = newValue!;
                          EditDataTable2buffer_CPIU.field12 = newValue;
                          BlocProvider.of<BlocPageRebuild>(contextinput)
                              .rebuildPage();
                        },
                        listdropdown: _list1,
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ITEM12")),
                      ),
                      AdvanceDropDown(
                        width: 350,
                        height: 40,
                        value: ITEMlist[11],
                        onChangeinside: (newValue) {
                          ITEMlist[11] = newValue!;
                          EditDataTable2buffer_CPIU.field13 = newValue;
                          BlocProvider.of<BlocPageRebuild>(contextinput)
                              .rebuildPage();
                        },
                        listdropdown: _list1,
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ITEM13")),
                      ),
                      AdvanceDropDown(
                        width: 350,
                        height: 40,
                        value: ITEMlist[12],
                        onChangeinside: (newValue) {
                          ITEMlist[12] = newValue!;
                          EditDataTable2buffer_CPIU.field14 = newValue;
                          BlocProvider.of<BlocPageRebuild>(contextinput)
                              .rebuildPage();
                        },
                        listdropdown: _list1,
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ITEM14")),
                      ),
                      AdvanceDropDown(
                        width: 350,
                        height: 40,
                        value: ITEMlist[13],
                        onChangeinside: (newValue) {
                          ITEMlist[13] = newValue!;
                          EditDataTable2buffer_CPIU.field15 = newValue;
                          BlocProvider.of<BlocPageRebuild>(contextinput)
                              .rebuildPage();
                        },
                        listdropdown: _list1,
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ITEM15")),
                      ),
                      AdvanceDropDown(
                        width: 350,
                        height: 40,
                        value: ITEMlist[14],
                        onChangeinside: (newValue) {
                          ITEMlist[14] = newValue!;
                          EditDataTable2buffer_CPIU.field16 = newValue;
                          BlocProvider.of<BlocPageRebuild>(contextinput)
                              .rebuildPage();
                        },
                        listdropdown: _list1,
                      ),
                      SizedBox(
                        width: 350,
                        height: 15,
                        // child: Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Text("Branch")),
                      ),
                      Container(
                        width: 350,
                        height: 40,
                        // color: Colors.red,
                        // child: ComInputText(
                        //   isContr: undercontroltap2_CPIU,
                        //   fnContr: (input) {
                        //     undercontroltap2_CPIU = input;
                        //   },
                        //   sValue: EditDataTable2_CPIU.field05,
                        //   returnfunc: (String s) {
                        //     EditDataTable2buffer_CPIU.field05 = s;
                        //   },
                        // ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 460,
                  height: 40,
                  // color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ComBtnBlack(
                          sLabel: "Update",
                          func: () {
                            // print(EditDataTable2buffer.field04);
                            // EditDataTable2buffer = EditDataTable2;
                            contextinput.read<FetchDataTable2Bloc_CPIU>().add(
                                DataSequncePage2_CPIU
                                    .update); //<------------------
                            Navigator.pop(contextinput);
                          },
                          nWidth: 80),
                      SizedBox(
                        width: 10,
                      ),
                      ComBtnBlackBorder(
                          sLabel: "Clear",
                          cBg: Colors.red,
                          func: () {
                            undercontroltap2_CPIU = true;
                            EditDataTable2_CPIU = MainStrucTableTap2_CPIU(
                              number: "",
                              field01: "",
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
                              field13: "",
                              field14: "",
                              field15: "",
                              field16: "",
                              field17: "",
                              field18: "",
                              field19: "",
                              field20: "",
                            );

                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          nWidth: 80),
                      SizedBox(
                        width: 10,
                      ),
                      ComBtnBlackBorder(
                          sLabel: "Insert",
                          func: () {
                            contextinput
                                .read<FetchDataTable2Bloc_CPIU>()
                                .add(DataSequncePage2_CPIU.insert);
                            Navigator.pop(contextinput);
                          },
                          nWidth: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class TxtStylePOP extends TextStyle {
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily = 'Mitr';
  final FontStyle fontStyle = FontStyle.normal;

  const TxtStylePOP(
      {this.fontSize = 12,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal})
      : super();
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
