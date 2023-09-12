import 'dart:core' show int;

enum CommandEnum {

  /// Select command (0,164,4,0)
  select(0x00, 0xA4, 0x04, 0x00),

  /// Read record command
  readRecode(0x00, 0xB2, 0x01, 0x1C),

  /// GPO Command
  gpo(0x80, 0xA8, 0x00, 0x00),

  /// GPO Command
  getData(0x80, 0xCA, 0x00, 0x00);

  /// Class byte
  final int cla;

  /// Instruction byte
  final int ins;

  /// Parameter 1 byte
  final int p1;

  /// Parameter 2 byte
  final int p2;

  /// Constructor using field
  ///
  /// @param cla class
  /// @param ins instruction
  /// @param p1  parameter 1
  /// @param p2  parameter 2
  const CommandEnum(this.cla, this.ins, this.p1, this.p2);  

  /// Method used to get the field cla
  ///
  /// @return the cla
  int getCla() {
    return cla;
  }

  /// Method used to get the field ins
  ///
  /// @return the ins
  int getIns() {
    return ins;
  }

  /// Method used to get the field p1
  ///
  /// @return the p1
  int getP1() {
    return p1;
  }

  /// Method used to get the field p2
  ///
  /// @return the p2
  int getP2() {
    return p2;
  }

}