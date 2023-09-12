import 'package:vss_book_seat/src/utils/seat_state.dart';
import 'package:equatable/equatable.dart';

class SeatModel extends Equatable {
  final SeatState seatState;
  int rowI;
  int colI;
  final int seatSvgSize;
  String pathSelectedSeat;
  String pathUnSelectedSeat;
  String pathSoldSeat;
  String pathDisabledSeat;
  String pathEmptySeat;
  String displayNameSeat;
  dynamic valueMemberSeat;
  dynamic seatGroupId;
  String seatGroupName;
  int seatGroupFare;

  SeatModel({
    required this.seatState,
    this.rowI = 1,
    this.colI = 1,
    this.seatSvgSize = 50,
    this.pathSelectedSeat = '',
    this.pathDisabledSeat = '',
    this.pathSoldSeat = '',
    this.pathUnSelectedSeat = '',
    this.pathEmptySeat = '',
    this.displayNameSeat = '',
    this.valueMemberSeat,
    this.seatGroupId,
    this.seatGroupName = '',
    this.seatGroupFare = 0,
  });

  @override
  List<Object?> get props => [
        seatState,
        rowI,
        colI,
        seatSvgSize,
        pathSelectedSeat,
        pathDisabledSeat,
        pathSoldSeat,
        pathUnSelectedSeat,
        pathEmptySeat,
        displayNameSeat,
        valueMemberSeat,
        seatGroupId,
        seatGroupName,
        seatGroupFare,
      ];
}
