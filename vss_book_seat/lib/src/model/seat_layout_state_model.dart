import 'package:vss_book_seat/src/utils/seat_state.dart';
import 'package:equatable/equatable.dart';

import '../../vss_book_seat.dart';

class SeatLayoutStateModel extends Equatable {
  final int cols;
  final List<SeatModel> currentSeatsState;
  final int seatSvgSize;
  final String pathSelectedSeat;
  final String pathUnSelectedSeat;
  final String pathSoldSeat;
  final String pathDisabledSeat;
  String pathEmptySeat;
  final bool isDisplayWithGroup;

  SeatLayoutStateModel({
    required this.cols,
    required this.currentSeatsState,
    this.seatSvgSize = 50,
    required this.pathSelectedSeat,
    required this.pathDisabledSeat,
    required this.pathSoldSeat,
    required this.pathUnSelectedSeat,
    this.pathEmptySeat = '',
    this.isDisplayWithGroup = false,
  });

  @override
  List<Object?> get props => [
        cols,
        seatSvgSize,
        currentSeatsState,
        pathUnSelectedSeat,
        pathSelectedSeat,
        pathSoldSeat,
        pathDisabledSeat,
        pathEmptySeat,
        isDisplayWithGroup
      ];
}
