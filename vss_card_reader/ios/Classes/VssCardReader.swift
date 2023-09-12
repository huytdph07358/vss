import Flutter
import UIKit
import SwiftyRSA
import CommonCrypto

public class VssCardReader: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "vss_card_reader", binaryMessenger: registrar.messenger())
    let instance = VssCardReader()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
  switch call.method {
      case "VssCardReader#getUdExternalKey":
           let arguments = call.arguments as! Array<Dictionary<String, Any>>
           let uintInt8ListData =  arguments[0]["data"]! as! FlutterStandardTypedData
           let dataUInt8 = [UInt8](uintInt8ListData.data)
           let data = dataUInt8.map { Int8(bitPattern: $0) }
      
           let uintInt8ListKey =  arguments[0]["key"]! as! FlutterStandardTypedData
           let keyUInt8 = [UInt8](uintInt8ListKey.data)
           let key = keyUInt8.map { Int8(bitPattern: $0) }
      
           var bArr4: [Int8] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
           var bArr9: [Int8] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
           var i2 = 0;
           while (true) {
                if (i2 >= data.count) {
                    break;
                }
                if (data[i2] == 95 && data[i2 + 1] == 84) {
                    var i3 = 0;
                    let i4 = 8;
                    while(i3 < i4) {
                        bArr4[i3] = data[i2 + 3 + i3];
                        bArr4[i3 + 8] = Int8(truncatingIfNeeded: Int(bArr4[i3]) ^ 255)
                        i3 += 1;
                    }
                }
                i2 += 1;
           }

           bArr9[0...15] = key[16...31]
           let encryptECB: Data = self.encryptECB(bArr4, bArr9)
           let encryptECBData = FlutterStandardTypedData.init(bytes: encryptECB)
      
           result(encryptECBData)
      case "VssCardReader#encryptCBC":
         let arguments = call.arguments as! Array<Dictionary<String, Any>>
         //let dateTime = arguments["dateTime"] as! String;
     
         let uintInt8ListData =  arguments[0]["data"]! as! FlutterStandardTypedData
         let dataUInt8 = [UInt8](uintInt8ListData.data)
         let data = dataUInt8.map { Int8(bitPattern: $0) }
     
         let uintInt8ListKey =  arguments[0]["key"]! as! FlutterStandardTypedData
         let keyUInt8 = [UInt8](uintInt8ListKey.data)
         let key = keyUInt8.map { Int8(bitPattern: $0) }
         do {
             var dataEncrypted: Data = try self.encryptCBC(data, key);
             let dataEncryptedData = FlutterStandardTypedData.init(bytes: dataEncrypted)
             result(dataEncryptedData);
         } catch {
             result(nil)
         }

      case "VssCardReader#decryptKey":
      let encryptData = call.arguments as! String;
          var privateKeyBase64 = ""//TODO
      do {
          let privateKey = try PrivateKey(pemEncoded: privateKeyBase64)
          let encrypted = try EncryptedMessage(base64Encoded: encryptData)//TODO
          let clear = try encrypted.decrypted(with: privateKey, padding: .OAEP)
          let dataKey = try clear.string(encoding: .utf8)

          //return string.hexaBytes.map(Int8.init)
          result(dataKey)
      }
      catch {
         //print("Error: getPrivateSecKey: \(error)")
          result(nil)
          }
      default:
          result(nil)
      }
  }

  func encryptCBC(_ bArr: [Int8], _ bArr2: [Int8]) -> Data {
        var bArr3: [Int8] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        bArr3[0...15] = bArr2[0...15]
        bArr3[16...23] = bArr2[0...7]


        var data:Data = Data(bytes: bArr, count: bArr.count)
        var keyData:Data = Data(bytes: bArr3, count: bArr3.count)

        let cryptLength = size_t(data.count + kCCBlockSize3DES)
        var cryptData = Data(repeating:0, count:cryptLength)
        var numBytesEncrypted :size_t = 0

        let keyLength             = keyData.count
        let algoritm: CCAlgorithm = UInt32(kCCAlgorithm3DES)
        let options:  CCOptions   = UInt32(kCCOptionPKCS7Padding | kCCModeCBC)
        let ivData = Data.init(bytes: [0, 0, 0, 0, 0, 0, 0, 0], count: 8)

        let cryptStatus = cryptData.withUnsafeMutableBytes {cryptBytes in
            data.withUnsafeBytes {dataBytes in
                ivData.withUnsafeBytes {ivBytes in
                    keyData.withUnsafeBytes {keyBytes in
                        CCCrypt(CCOperation(kCCEncrypt),
                                algoritm,
                                options,
                                keyBytes, keyLength,
                                ivBytes,
                                dataBytes, data.count,
                                cryptBytes, cryptLength,
                                &numBytesEncrypted)
                    }
                }
            }
        }

        if UInt32(cryptStatus) == UInt32(kCCSuccess) {
            cryptData.count = numBytesEncrypted
        }
        else {
            //print("Error: \(cryptStatus)")
            return cryptData
        }
        return cryptData
  }

  func encryptECB(_ bArr: [Int8], _ bArr2: [Int8]) -> Data { // ->[Int8]
      var bArr3: [Int8] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
      bArr3[0...15] = bArr2[0...15]
      //logBytes("encryptECB bArr3", bArr3)
      bArr3[16...23] = bArr2[0...7]
      //logBytes("encryptECB bArr3", bArr3)
      let data:Data = Data(bytes: bArr, count: bArr.count)
      let keyData:Data = Data(bytes: bArr3, count: bArr3.count)

      let cryptLength = size_t(data.count + kCCBlockSize3DES)
      var cryptData = Data(repeating:0, count:cryptLength)
      var numBytesEncrypted :size_t = 0

      let keyLength             = keyData.count
      let algoritm: CCAlgorithm = UInt32(kCCAlgorithm3DES)
      let options:  CCOptions   = UInt32(kCCOptionECBMode)

      let cryptStatus = cryptData.withUnsafeMutableBytes {cryptBytes in
          data.withUnsafeBytes {dataBytes in
                  keyData.withUnsafeBytes {keyBytes in
                      CCCrypt(CCOperation(kCCEncrypt),
                              algoritm,
                              options,
                              keyBytes, keyLength,
                              nil,
                              dataBytes, data.count,
                              cryptBytes, cryptLength,
                              &numBytesEncrypted)
                  }
          }
      }

      if UInt32(cryptStatus) == UInt32(kCCSuccess) {
          cryptData.count = numBytesEncrypted
      }
      else {
          //print("Error: \(cryptStatus)")
          return cryptData
      }
      //let result = cryptData.map(Int8.init)
      //logBytes("encryptECB result", result)
      return cryptData
  }
}
