import 'package:vss_book_seat/src/model/seat_model.dart';
import 'package:vss_book_seat/src/utils/seat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vss_global_constant/global_constant.dart';

class SeatDesignWidget extends StatefulWidget {
  final SeatModel model;
  final void Function(SeatModel currentSeat) onSeatStateChanged;

  const SeatDesignWidget({
    Key? key,
    required this.model,
    required this.onSeatStateChanged,
  }) : super(key: key);

  @override
  State<SeatDesignWidget> createState() => _SeatDesignWidgetState();
}

class _SeatDesignWidgetState extends State<SeatDesignWidget> {
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
        onTapUp: (_) async {
          SeatState? seatStateResult = await showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return bottomSheet(widget.model);
            },
          );
          if (seatStateResult == null) return;

          setState(() {
            seatState = seatStateResult;
            widget.onSeatStateChanged(SeatModel(
              seatState: seatStateResult,
              colI: colI,
              displayNameSeat: widget.model.displayNameSeat,
              valueMemberSeat: widget.model.valueMemberSeat,
              seatGroupId: widget.model.seatGroupId,
              seatGroupName: widget.model.seatGroupName,
              seatGroupFare: widget.model.seatGroupFare,
            ));
          });
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: widget.model.seatSvgSize.toDouble(),
                  width: widget.model.seatSvgSize.toDouble(),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(_getSvgPath(safeCheckedSeatState)),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                    child: Text(
                      '$displayName',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: textTheme.bodySmall,
                    ),
                  ) // Foreground widget here
                  ),
              GlobalConstant.colDivider,
            ]),
      );
    }
    return const SizedBox();
  }

  Widget bottomSheet(SeatModel model) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    // final Translate translate = lookupTranslate(LanguageStore.localeSelected);
    // final List<TvbScreenModel> favouriteScreen =
    // FavouriteScreenStore.getFavouriteScreen();

    return Container(
      height: 150,
      // TODO(team): nghiên cứu vấn đề độ cao động trong các trường hợp dùng grid - hoặc giải pháp khác tương đương thay thế
      padding: const EdgeInsets.all(GlobalConstant.paddingMarginLength),
      child: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              crossAxisCount: 6,
              crossAxisSpacing: GlobalConstant.paddingMarginLength,
              childAspectRatio: 0.6,
              children: [
                GestureDetector(
                    onTapUp: (_) async {
                      Navigator.pop(context, SeatState.empty);
                    },
                    child: Container(
                        height: widget.model.seatSvgSize.toDouble(),
                        width: widget.model.seatSvgSize.toDouble(),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(_getSvgPath(SeatState.empty)),
                              fit: BoxFit.scaleDown),
                        ),
                        child: Center(
                          child: Text(
                            '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: textTheme.bodySmall,
                          ),
                        ) // Foreground widget here
                        )),
                GestureDetector(
                    onTapUp: (_) async {
                      Navigator.pop(context, SeatState.unselected);
                    },
                    child: Container(
                        height: widget.model.seatSvgSize.toDouble(),
                        width: widget.model.seatSvgSize.toDouble(),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage(_getSvgPath(SeatState.unselected)),
                              fit: BoxFit.scaleDown),
                        ),
                        child: Center(
                          child: Text(
                            '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: textTheme.bodySmall,
                          ),
                        ) // Foreground widget here
                        )),
                GestureDetector(
                    onTapUp: (_) async {
                      Navigator.pop(context, SeatState.selected);
                    },
                    child: Container(
                        height: widget.model.seatSvgSize.toDouble(),
                        width: widget.model.seatSvgSize.toDouble(),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage(_getSvgPath(SeatState.selected)),
                              fit: BoxFit.scaleDown),
                        ),
                        child: Center(
                          child: Text(
                            '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: textTheme.bodySmall,
                          ),
                        ) // Foreground widget here
                        )),
                GestureDetector(
                    onTapUp: (_) async {
                      Navigator.pop(context, SeatState.sold);
                    },
                    child: Container(
                        height: widget.model.seatSvgSize.toDouble(),
                        width: widget.model.seatSvgSize.toDouble(),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(_getSvgPath(SeatState.sold)),
                              fit: BoxFit.scaleDown),
                        ),
                        child: Center(
                          child: Text(
                            '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: textTheme.bodySmall,
                          ),
                        ) // Foreground widget here
                        )),
                GestureDetector(
                    onTapUp: (_) async {
                      Navigator.pop(context, SeatState.disabled);
                    },
                    child: Container(
                        height: widget.model.seatSvgSize.toDouble(),
                        width: widget.model.seatSvgSize.toDouble(),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage(_getSvgPath(SeatState.disabled)),
                              fit: BoxFit.scaleDown),
                        ),
                        child: Center(
                          child: Text(
                            '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: textTheme.bodySmall,
                          ),
                        ) // Foreground widget here
                        ))
              ],
            ),
          ),
        ],
      ),
    );
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
        {
          return widget.model.pathEmptySeat;
        }
      default:
        {
          return widget.model.pathDisabledSeat;
        }
    }
  }
}
