import 'package:vss_book_seat/src/model/seat_layout_state_model.dart';
import 'package:vss_book_seat/src/model/seat_model.dart';
import 'package:vss_book_seat/src/utils/seat_state.dart';
import 'package:vss_book_seat/src/widgets/seat_design_widget.dart';
import 'package:flutter/material.dart';
import "package:collection/collection.dart";
import 'package:vss_global_constant/global_constant.dart';
import 'package:intl/intl.dart';
import 'package:vss_locale/language_store.dart';

class SeatDesignLayoutWidget extends StatelessWidget {
  final SeatLayoutStateModel stateModel;
  final void Function(SeatModel currentSeat) onSeatStateChanged;

  const SeatDesignLayoutWidget({
    Key? key,
    required this.stateModel,
    required this.onSeatStateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 5,
      minScale: 0.8,
      boundaryMargin: const EdgeInsets.all(8),
      constrained: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: generateAllChildren(),
      ),
    );
  }

  List<Widget> generateAllChildren() {
    List<Widget> seatWidgets = <Widget>[];
    int colCount = stateModel.cols;
    if (stateModel.currentSeatsState.isNotEmpty) {
      if (stateModel.isDisplayWithGroup) {
        processWithDisplayGroup(seatWidgets, colCount);
      } else {
        processWithoutDisplayGroup(seatWidgets, colCount);
      }
    }

    return seatWidgets;
  }

  void processWithDisplayGroup(List<Widget> seatWidgets, int colCount) {
    final NumberFormat currencyFormat = NumberFormat.currency(
        locale: LanguageStore.localeSelected.languageCode,
        symbol: 'đ',
        decimalDigits: 0);
    stateModel.currentSeatsState.sort((SeatModel a, SeatModel b) =>
        a.seatGroupName!.compareTo(b.seatGroupName!));

    var newSeatGroupById = groupBy(
        stateModel.currentSeatsState, (SeatModel obj) => obj.seatGroupId);
    if (newSeatGroupById.isNotEmpty) {
      newSeatGroupById.forEach((key, value) {
        seatWidgets.add(Row(children: [
          GestureDetector(
            child: Text(
              value.first.seatGroupName == ''
                  ? 'Khác'
                  : '${value.first.seatGroupName}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              //style: textTheme.bodySmall,
            ),
          )
        ]));

        int rowCount = 0;
        int dem = 0;
        int du = value.length % colCount;
        int itemCountEmpty = (du == 0) ? 0 : (colCount - du);
        List<List<SeatModel>> seatsModelInsert = <List<SeatModel>>[];
        List<SeatModel> seatStateItem = <SeatModel>[];
        rowCount = (value.length) ~/ colCount;
        if (rowCount == 0)
          rowCount = 1;
        else if (itemCountEmpty > 0) rowCount += 1;

        value.sort((SeatModel a, SeatModel b) =>
            a.displayNameSeat!.compareTo(b.displayNameSeat!));
        value.forEach((element) {
          dem++;
          if (seatStateItem.length == colCount - 1 || dem == value.length) {
            seatStateItem.add(SeatModel(
              seatState: element.seatState,
              displayNameSeat: element.displayNameSeat,
              valueMemberSeat: element.valueMemberSeat,
              seatGroupFare: element.seatGroupFare,
              seatGroupName: element.seatGroupName,
              seatGroupId: element.seatGroupId,
            ));

            if (dem == value.length && itemCountEmpty > 0) {
              for (int i = 0; i < itemCountEmpty; i++) {
                seatStateItem.add(SeatModel(
                    seatState: SeatState.empty,
                    displayNameSeat: '',
                    valueMemberSeat: ''));
              }
            }
            seatsModelInsert.add(seatStateItem);
            seatStateItem = <SeatModel>[];
          } else {
            seatStateItem.add(SeatModel(
              seatState: element.seatState,
              displayNameSeat: element.displayNameSeat,
              valueMemberSeat: element.valueMemberSeat,
              seatGroupFare: element.seatGroupFare,
              seatGroupName: element.seatGroupName,
              seatGroupId: element.seatGroupId,
            ));
          }
        });

        seatWidgets.addAll(createRowInGroup(rowCount, seatsModelInsert));
      });
    }
  }

  void processWithoutDisplayGroup(List<Widget> seatWidgets, int colCount) {
    stateModel.currentSeatsState.sort((SeatModel a, SeatModel b) =>
        a.valueMemberSeat!.compareTo(b.valueMemberSeat!));
    seatWidgets.addAll(
        createRowInGroupWithoutDisplayGroup(stateModel.currentSeatsState));
  }

  List<Widget> createRowInGroup(
      int rowI, List<List<SeatModel>> seatsModelGroup) {
    return [
      ...List<int>.generate(rowI, (rowI) => rowI)
          .map<Row>(
            (rowI) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List<int>.generate(stateModel.cols, (colI) => colI)
                    .map<SeatDesignWidget>((colI) => SeatDesignWidget(
                          model: SeatModel(
                            seatState: seatsModelGroup[rowI][colI].seatState,
                            rowI: rowI,
                            colI: colI,
                            seatSvgSize: stateModel.seatSvgSize,
                            pathSelectedSeat: stateModel.pathSelectedSeat,
                            pathDisabledSeat: stateModel.pathDisabledSeat,
                            pathSoldSeat: stateModel.pathSoldSeat,
                            pathUnSelectedSeat: stateModel.pathUnSelectedSeat,
                            pathEmptySeat: stateModel.pathEmptySeat,
                            displayNameSeat:
                                seatsModelGroup[rowI][colI].displayNameSeat,
                            valueMemberSeat:
                                seatsModelGroup[rowI][colI].valueMemberSeat,
                            seatGroupId:
                                seatsModelGroup[rowI][colI].seatGroupId,
                            seatGroupName:
                                seatsModelGroup[rowI][colI].seatGroupName,
                            seatGroupFare:
                                seatsModelGroup[rowI][colI].seatGroupFare,
                          ),
                          onSeatStateChanged: onSeatStateChanged,
                        ))
                    .toList()
              ],
            ),
          )
          .toList()
    ];
  }

  List<Widget> createRowInGroupWithoutDisplayGroup(
      List<SeatModel> seatsModelGroup) {
    return [
      GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: stateModel.cols,
        crossAxisSpacing: GlobalConstant.paddingMarginLength,
        childAspectRatio: 0.7,
        children: [
          ...seatsModelGroup
              .map<SeatDesignWidget>((seat) => SeatDesignWidget(
                    model: SeatModel(
                      seatState: seat.seatState,
                      seatSvgSize: stateModel.seatSvgSize,
                      pathSelectedSeat: stateModel.pathSelectedSeat,
                      pathDisabledSeat: stateModel.pathDisabledSeat,
                      pathSoldSeat: stateModel.pathSoldSeat,
                      pathUnSelectedSeat: stateModel.pathUnSelectedSeat,
                      displayNameSeat: seat.displayNameSeat,
                      valueMemberSeat: seat.valueMemberSeat,
                      seatGroupId: seat.seatGroupId,
                      seatGroupName: seat.seatGroupName,
                      seatGroupFare: seat.seatGroupFare,
                    ),
                    onSeatStateChanged: onSeatStateChanged,
                  ))
              .toList()
        ].toList(),
      )
    ];
  }
}
