package com.vietsens.vss_card_reader

import android.app.Activity
import android.nfc.NfcAdapter
import android.nfc.Tag
import android.nfc.tech.*
import android.os.Build
import android.util.Log
import com.vietsens.vss_card_reader.emvnfccard.model.EmvCard
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.io.IOException
import java.util.*

class VssCardReader: FlutterPlugin, MethodCallHandler, ActivityAware {
  private lateinit var channel : MethodChannel
  private lateinit var activity: Activity
  private lateinit var tags: MutableMap<String, Tag>
  private var adapter: NfcAdapter? = null
  private var connectedTech: TagTechnology? = null
//  init {
//    System.loadLibrary("datastore-jni")
//  }
//  external fun getEncryptKey(): String

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(binding.binaryMessenger, "vss_card_reader")
    channel.setMethodCallHandler(this)
    adapter = NfcAdapter.getDefaultAdapter(binding.applicationContext)
    tags = mutableMapOf()
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivity() {
    // no op
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    // no op
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      "Nfc#isAvailable" -> handleNfcIsAvailable(call, result)
      "Nfc#startSession" -> handleNfcStartSession(call, result)
      "Nfc#stopSession" -> handleNfcStopSession(call, result)
      "Nfc#disposeTag" -> handleNfcDisposeTag(call, result)
      "Ndef#read" -> handleNdefRead(call, result)
      "Ndef#write" -> handleNdefWrite(call, result)
      "Ndef#writeLock" -> handleNdefWriteLock(call, result)
      "NfcA#transceive" -> handleNfcATransceive(call, result)
      "NfcB#transceive" -> handleNfcBTransceive(call, result)
      "NfcF#transceive" -> handleNfcFTransceive(call, result)
      "NfcV#transceive" -> handleNfcVTransceive(call, result)
      "IsoDep#transceive" -> handleIsoDepTransceive(call, result)
      "MifareClassic#authenticateSectorWithKeyA" -> handleMifareClassicAuthenticateSectorWithKeyA(call, result)
      "MifareClassic#authenticateSectorWithKeyB" -> handleMifareClassicAuthenticateSectorWithKeyB(call, result)
      "MifareClassic#increment" -> handleMifareClassicIncrement(call, result)
      "MifareClassic#decrement" -> handleMifareClassicDecrement(call, result)
      "MifareClassic#readBlock" -> handleMifareClassicReadBlock(call, result)
      "MifareClassic#writeBlock" -> handleMifareClassicWriteBlock(call, result)
      "MifareClassic#restore" -> handleMifareClassicRestore(call, result)
      "MifareClassic#transfer" -> handleMifareClassicTransfer(call, result)
      "MifareClassic#transceive" -> handleMifareClassicTransceive(call, result)
      "MifareUltralight#readPages" -> handleMifareUltralightReadPages(call, result)
      "MifareUltralight#writePage" -> handleMifareUltralightWritePage(call, result)
      "MifareUltralight#transceive" -> handleMifareUltralightTransceive(call, result)
      "NdefFormatable#format" -> handleNdefFormatableFormat(call, result)
      "NdefFormatable#formatReadOnly" -> handleNdefFormatableFormatReadOnly(call, result)
      "VssCardReader#getUdExternalKey" -> handleVssCardReadergetUdExternalKey(call, result)
      "VssCardReader#encryptCBC" -> handleVssCardReaderencryptCBC(call, result)
      "VssCardReader#decryptKey" -> handleVssCardReaderdecryptKey(call, result)
      "VssCardReader#mirfareReader" -> handleVssMirfareCardReader(call, result)
      "VssCardReader#othercardReader" -> handleVssOthercardReader(call, result)
      else -> result.notImplemented()
    }
  }

  private fun handleNfcIsAvailable(call: MethodCall, result: MethodChannel.Result) {
    result.success(adapter?.isEnabled == true)
  }

  private fun handleNfcStartSession(call: MethodCall, result: MethodChannel.Result) {
    val adapter = adapter ?: run {
      result.error("unavailable", "NFC is not available for device.", null)
      return
    }
    adapter.enableReaderMode(activity, {
      val handle = UUID.randomUUID().toString()
      tags[handle] = it
      activity.runOnUiThread { channel.invokeMethod("onDiscovered", getTagMap(it).toMutableMap().apply { put("handle", handle) }) }
    }, getFlags(call.argument<List<String>>("pollingOptions")!!), null)
    result.success(null)
  }

  private fun handleNfcStopSession(call: MethodCall, result: MethodChannel.Result) {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.KITKAT) {
      result.error("unavailable", "Requires API level 19.", null)
    } else {
      val adapter = adapter ?: run {
        result.error("unavailable", "NFC is not available for device.", null)
        return
      }
      adapter.disableReaderMode(activity)
      result.success(null)
    }
  }

  private fun handleNfcDisposeTag(call: MethodCall, result: MethodChannel.Result) {
    val tag = tags.remove(call.argument<String>("handle")!!) ?: run {
      result.success(null)
      return
    }

    val tech = connectedTech ?: run {
      result.success(null)
      return
    }

    if (tech.tag == tag && tech.isConnected)
      try { tech.close() } catch (e: IOException) { /* no op */ }

    connectedTech = null

    result.success(null)
  }

  private fun handleNdefRead(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { Ndef.get(it) }) {
      val message = it.ndefMessage
      result.success(if (message == null) null else getNdefMessageMap(message))
    }
  }

  private fun handleNdefWrite(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { Ndef.get(it) }) {
      val message = getNdefMessage(call.argument<Map<String, Any?>>("message")!!)
      it.writeNdefMessage(message)
      result.success(null)
    }
  }

  private fun handleNdefWriteLock(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { Ndef.get(it) }) {
      it.makeReadOnly()
      result.success(null)
    }
  }

  private fun handleNfcATransceive(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { NfcA.get(it) }) {
      val data = call.argument<ByteArray>("data")!!
      result.success(it.transceive(data))
    }
  }

  private fun handleNfcBTransceive(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { NfcB.get(it) }) {
      val data = call.argument<ByteArray>("data")!!
      result.success(it.transceive(data))
    }
  }

  private fun handleNfcFTransceive(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { NfcF.get(it) }) {
      val data = call.argument<ByteArray>("data")!!
      result.success(it.transceive(data))
    }
  }

  private fun handleNfcVTransceive(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { NfcV.get(it) }) {
      val data = call.argument<ByteArray>("data")!!
      result.success(it.transceive(data))
    }
  }

  private fun handleIsoDepTransceive(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { IsoDep.get(it) }) {
      val data = call.argument<ByteArray>("data")!!
      result.success(it.transceive(data))
    }
  }

  private fun handleMifareClassicAuthenticateSectorWithKeyA(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { MifareClassic.get(it) }) {
      val sectorIndex = call.argument<Int>("sectorIndex")!!
      val key = call.argument<ByteArray>("key")!!
      result.success(it.authenticateSectorWithKeyA(sectorIndex, key))
    }
  }

  private fun handleMifareClassicAuthenticateSectorWithKeyB(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { MifareClassic.get(it) }) {
      val sectorIndex = call.argument<Int>("sectorIndex")!!
      val key = call.argument<ByteArray>("key")!!
      result.success(it.authenticateSectorWithKeyB(sectorIndex, key))
    }
  }

  private fun handleMifareClassicIncrement(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { MifareClassic.get(it) }) {
      val blockIndex = call.argument<Int>("blockIndex")!!
      val value = call.argument<Int>("value")!!
      it.increment(blockIndex, value)
      result.success(null)
    }
  }

  private fun handleMifareClassicDecrement(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { MifareClassic.get(it) }) {
      val blockIndex = call.argument<Int>("blockIndex")!!
      val value = call.argument<Int>("value")!!
      it.decrement(blockIndex, value)
      result.success(null)
    }
  }

  private fun handleMifareClassicReadBlock(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { MifareClassic.get(it) }) {
      val blockIndex = call.argument<Int>("blockIndex")!!
      result.success(it.readBlock(blockIndex))
    }
  }

  private fun handleMifareClassicWriteBlock(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { MifareClassic.get(it) }) {
      val blockIndex = call.argument<Int>("blockIndex")!!
      val data = call.argument<ByteArray>("data")!!
      it.writeBlock(blockIndex, data)
      result.success(null)
    }
  }

  private fun handleMifareClassicRestore(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { MifareClassic.get(it) }) {
      val blockIndex = call.argument<Int>("blockIndex")!!
      it.restore(blockIndex)
      result.success(null)
    }
  }

  private fun handleMifareClassicTransfer(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { MifareClassic.get(it) }) {
      val blockIndex = call.argument<Int>("blockIndex")!!
      it.transfer(blockIndex)
      result.success(null)
    }
  }

  private fun handleMifareClassicTransceive(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { MifareClassic.get(it) }) {
      val data = call.argument<ByteArray>("data")!!
      result.success(it.transceive(data))
    }
  }

  private fun handleMifareUltralightReadPages(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { MifareUltralight.get(it) }) {
      val pageOffset = call.argument<Int>("pageOffset")!!
      result.success(it.readPages(pageOffset))
    }
  }

  private fun handleMifareUltralightWritePage(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { MifareUltralight.get(it) }) {
      val pageOffset = call.argument<Int>("pageOffset")!!
      val data = call.argument<ByteArray>("data")!!
      it.writePage(pageOffset, data)
      result.success(null)
    }
  }

  private fun handleMifareUltralightTransceive(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { MifareUltralight.get(it) }) {
      val data = call.argument<ByteArray>("data")!!
      result.success(it.transceive(data))
    }
  }

  private fun handleVssMirfareCardReader(call: MethodCall, result: MethodChannel.Result) {
    val list: List<Map<String, Any>>? = call.arguments()
    var key : ByteArray? = null
    if(list?.get(0)?.containsKey("key")==true){
      key = list?.get(0)?.get("key") as ByteArray?
    }

    try {
      tagHandler(call, result, { NfcA.get(it) }) {
        Common.treatAsNewTag(activity.intent, activity.applicationContext);

        Common.setTag(it.tag);
        val reader: MCReader? = MCReader(it.tag);
        try {
          it.close();
          reader?.connect()
        } catch (e: java.lang.Exception) {
          android.util.Log.d("MirfareCardReader", "tagLost = true")
        }
        //val reader: MCReader? = Common.checkForTagAndCreateReader(activity.applicationContext);

        //val reader: MCReader? = Common.checkForTagAndCreateReader(activity.applicationContext);
        val results = arrayOfNulls<Array<String?>?>(2)
        var resultData: Array<String?>? = null
        if (key != null) {
          if (reader == null)
            android.util.Log.d("MirfareCardReader", "reader ==null")
          else
            android.util.Log.d("MirfareCardReader", "reader !=null")
          resultData = reader!!.readSector(
            1,
            key!!, false
          )
        } else {
          resultData = reader!!.readSector(
            1,
            Common.hex2Bytes("FFFFFFFFFFFF"), true
          )
        }
        reader.close()
        if ((resultData != null) && resultData.isNotEmpty()) {
          val serviceCode: String = Common.hex2Ascii(resultData[0]) + Common.hex2Ascii(resultData[1]) + Common.hex2Ascii(
            resultData[2]?.substring(0, 16)
          );
          result.success(serviceCode)
        } else {
          result.success("")
        }
      }
    } catch (e: Exception) {
      android.util.Log.d("MirfareCardReader", e.toString())
    }
  }

  private fun handleVssOthercardReader(call: MethodCall, result: MethodChannel.Result) {
    //val list: List<Map<String, Any>>? = call.arguments()
    //val key = list?.get(0)?.get("key") as ByteArray
    try {
      tagHandler(call, result, { IsoDep.get(it) }) {
        var mReadCard: EmvCard? = null;
        val mProvider = com.vietsens.vss_card_reader.emvnfccard.EmvProvider()
        Log.d("handleVssOthercardReader", "1")
        mProvider.setmTagCom(it);
        Log.d("handleVssOthercardReader", "2")
        val parser = com.vietsens.vss_card_reader.emvnfccard.parser.EmvParser(mProvider, true)
        Log.d("handleVssOthercardReader", "3")
        mReadCard = parser.readEmvCard()
        it.close();
        Log.d("handleVssOthercardReader", "4")
        if (mReadCard != null && mReadCard.cardNumber != null) {
          Log.d("getCardNumber()", mReadCard.cardNumber)
          //Log.d("getExpireDate()", mReadCard.expireDateString)
          val serviceCodeRawString: String =
            mReadCard.cardNumber + ':' + mReadCard.expireDateString + ':' + if (mReadCard.type != null) "VISA" else "NAPAS"
          Log.d("serviceCodeRawString", serviceCodeRawString)
          val trac2Data: String = Common.bytes2Hex(mReadCard.bCardData);

          result.success(serviceCodeRawString+":"+trac2Data)
          //TODO TEST TOTP
          //Totp totp;
          //String sharedSecret = "VSOTPacb";
          //Clock customClock = new Clock(60);
          //totp = new Totp(sharedSecret, customClock);
          //String otp = totp.now() + "00000000";
          //test3DES crypter = new test3DES();
          //byte[] dataEn = crypter.encryptCBCOtp(BitConverter.getUTF8Bytes(serviceCodeRawString), BitConverter.getUTF8Bytes(otp));
          //Base64 codec = new Base64();
          //serviceCode = codec.encodeBase64String(dataEn).replace("\r\n","");
          //Log.d("encryptDataString", serviceCodeRawString + "")
          //Log.d("otp", otp+"");
          //Log.d("serviceCode", serviceCode + "")
        }
      }
    } catch (e: Exception) {
      android.util.Log.d("MirfareCardReader", e.toString())
    }
  }

  private fun handleNdefFormatableFormat(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { NdefFormatable.get(it) }) {
      val firstMessage = getNdefMessage(call.argument<Map<String, Any?>>("firstMessage")!!)
      it.format(firstMessage)
      result.success(null)
    }
  }

  private fun handleNdefFormatableFormatReadOnly(call: MethodCall, result: MethodChannel.Result) {
    tagHandler(call, result, { NdefFormatable.get(it) }) {
      val firstMessage = getNdefMessage(call.argument<Map<String, Any?>>("firstMessage")!!)
      it.formatReadOnly(firstMessage)
      result.success(null)
    }
  }

  private fun handleVssCardReadergetUdExternalKey(call: MethodCall, result: MethodChannel.Result) {
    val list: List<Map<String, ByteArray>>? = call.arguments()
    val data = list?.get(0)?.get("data")
    val key = list?.get(0)?.get("key")
    try {
      val crypter = test3DES()
      val data_tmp = ByteArray(16)
      for (i in data!!.indices) {
        if (data[i].toInt() == 0x5F && data[i + 1].toInt() == 0x54) {
          for (j in 0..7) {
            data_tmp[j] = data[i + 3 + j]
            data_tmp[8 + j] = (data_tmp[j].toInt() xor 0xff).toByte()
          }
        }
      }
      val key_udk = ByteArray(16)
      if (key != null) {
        System.arraycopy(key, 0, key_udk, 0, 16)
      }
      //udk_key_internal = crypter.encryptECB(data_tmp, key_udk);
      if (key != null) {
        System.arraycopy(key, 16, key_udk, 0, 16)
      }
      val dataEncrypted: ByteArray? = crypter.encryptECB(data_tmp, key_udk)
      result.success(dataEncrypted)
    } catch (e: Exception) {
      //TODO
    }
  }

  private fun handleVssCardReaderencryptCBC(call: MethodCall, result: MethodChannel.Result) {
    val list: List<Map<String, ByteArray>>? = call.arguments()
    val data = list?.get(0)?.get("data")
    val key = list?.get(0)?.get("key")
    try {
      val crypter = test3DES()
      val dataEncrypted: ByteArray? = crypter.encryptCBC(data, key)
      result.success(dataEncrypted)
    } catch (e: Exception) {
      //TODO
    }
  }

  private fun handleVssCardReaderdecryptKey(call: MethodCall, result: MethodChannel.Result) {
    val encryptData: String = call.arguments.toString()
    try {
      val rSACipher = RSACipher()
      rSACipher.generateKeyPair("".trimIndent()) //TODO
      val dataKey: String = rSACipher.decrypt(encryptData)
      result.success(dataKey)
    } catch (e: Exception) {
      android.util.Log.d("VssCardReaderdecryptKey", e.toString())
    }
  }

  private fun <T: TagTechnology> tagHandler(call: MethodCall, result: MethodChannel.Result, getMethod: (Tag) -> T?, callback: (T) -> Unit) {
    var handle: String?  = ""
    try {
      handle = call.argument<String>("handle");
    }catch (e: Exception) {
    }
    if(handle ==null || handle == ""){
      val list: List<Map<String, Any>>? = call.arguments()
      handle = list?.get(0)?.get("handle") as String?;
    }

    val tag = tags[handle!!] ?: run {
      result.error("invalid_parameter", "Tag is not found", null)
      android.util.Log.d("invalid_parameter", "Tag is not found")
      return
    }
    android.util.Log.d("tagHandler", "1")
    val tech = getMethod(tag) ?: run {
      result.error("invalid_parameter", "Tech is not supported" , null)
      android.util.Log.d("invalid_parameter", "Tech is not supported")
      return
    }
    try {
      forceConnect(tech)
      callback(tech)
    } catch (e: Exception) {
      result.error("io_exception", e.localizedMessage, null)
      android.util.Log.d("tagHandler.exception", e.toString())
    }
  }

  @Throws(IOException::class)
  private fun forceConnect(tech: TagTechnology) {
    connectedTech?.let {
      if (it.tag == tech.tag && it::class.java.name == tech::class.java.name) return
      try { tech.close() } catch (e: IOException) { /* no op */ }
      tech.connect()
      connectedTech = tech
    } ?: run {
      tech.connect()
      connectedTech = tech
    }
  }
}
