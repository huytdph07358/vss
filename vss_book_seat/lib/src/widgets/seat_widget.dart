import 'package:vss_book_seat/src/model/seat_model.dart';
import 'package:vss_book_seat/src/utils/seat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vss_global_constant/global_constant.dart';

class SeatWidget extends StatefulWidget {
  final SeatModel model;
  final void Function(SeatModel currentSeat) onSeatStateChanged;

  const SeatWidget({
    Key? key,
    required this.model,
    required this.onSeatStateChanged,
  }) : super(key: key);

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  SeatState? seatState;
  int rowI = 0;
  int colI = 0;
  String displayName = '';
  int seatGroupFare = 0;

  @override
  void initState() {
    super.initState();
    seatState = widget.model.seatState;
    colI = widget.model.colI;
    displayName = widget.model.displayNameSeat;
    seatGroupFare = widget.model.seatGroupFare;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final safeCheckedSeatState = seatState;

    if (safeCheckedSeatState != null) {
      return GestureDetector(
        onTapUp: (_) {
          switch (seatState) {
            case SeatState.selected:
              {
                setState(() {
                  seatState = SeatState.unselected;
                  widget.onSeatStateChanged(SeatModel(
                    seatState: SeatState.unselected,
                    colI: colI,
                    displayNameSeat: widget.model.displayNameSeat,
                    valueMemberSeat: widget.model.valueMemberSeat,
                    seatGroupId: widget.model.seatGroupId,
                    seatGroupName: widget.model.seatGroupName,
                    seatGroupFare: widget.model.seatGroupFare,
                  ));
                });
              }
              break;
            case SeatState.unselected:
              {
                setState(() {
                  seatState = SeatState.selected;
                  widget.onSeatStateChanged(SeatModel(
                      seatState: SeatState.selected,
                      colI: colI,
                      displayNameSeat: widget.model.displayNameSeat,
                      valueMemberSeat: widget.model.valueMemberSeat,
                      seatGroupId: widget.model.seatGroupId,
                      seatGroupName: widget.model.seatGroupName,
                      seatGroupFare: widget.model.seatGroupFare));
                });
              }
              break;
            case SeatState.disabled:
            case SeatState.sold:
            case SeatState.empty:
            default:
              {}
              break;
          }
        },
        child: seatState != SeatState.empty
            ? Container(
                height: widget.model.seatSvgSize.toDouble(),
                width: widget.model.seatSvgSize.toDouble(),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(_getSvgPath(safeCheckedSeatState)),
                      fit: BoxFit.cover),
                ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$displayName',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: textTheme.bodySmall,
                    ),
                  ],
                )) // Foreground widget here
                )
            : SizedBox(
                height: widget.model.seatSvgSize.toDouble(),
                width: widget.model.seatSvgSize.toDouble(),
              ),
      );
    }
    return const SizedBox();
  }

  String _getSvgPath(SeatState state) {
    switch (state) {
      case SeatState.unselected:
        {
          return widget.model.pathUnSelectedSeat;
        }
      case SeatState.selected:
        {
          return widget.model.pathSelectedSeat;
        }
      case SeatState.disabled:
        {
          return widget.model.pathDisabledSeat;
        }
      case SeatState.sold:
        {
          return widget.model.pathSoldSeat;
        }
      case SeatState.empty:
      default:
        {
          return widget.model.pathDisabledSeat;
        }
    }
  }
}
