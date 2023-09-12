package com.vietsens.vss_card_reader

import android.os.Build
import android.util.Base64
//import androidx.annotation.RequiresApi

import java.io.BufferedReader
import java.io.IOException
import java.io.StringReader
import java.nio.charset.StandardCharsets
import java.security.InvalidKeyException
import java.security.KeyFactory
import java.security.KeyPair
import java.security.KeyPairGenerator
import java.security.NoSuchAlgorithmException
import java.security.PrivateKey
import java.security.PublicKey
import java.security.spec.InvalidKeySpecException
import java.security.spec.PKCS8EncodedKeySpec
import java.security.spec.X509EncodedKeySpec

import javax.crypto.BadPaddingException
import javax.crypto.Cipher
import javax.crypto.IllegalBlockSizeException
import javax.crypto.NoSuchPaddingException

class RSACipher {
    var kpg: KeyPairGenerator? = null
    var kp: KeyPair? = null
    var publicKey: PublicKey? = null
    var privateKey: PrivateKey? = null
    lateinit var encryptedBytes: ByteArray
    lateinit var decryptedBytes: ByteArray
    var cipher: Cipher? = null
    var cipher1: Cipher? = null
    var encrypted: String? = null
    var decrypted: String? = null
    @Throws(NoSuchAlgorithmException::class, NoSuchPaddingException::class, InvalidKeyException::class, IllegalBlockSizeException::class, BadPaddingException::class)
    fun generateKeyPair(prk1: String?) {

        //String puk1 = "";
        privateKey = stringToPrivate(prk1)
        //publicKey = stringToPublicKey(puk1);
    }

    /**
     * Encrypt plain text to RSA encrypted and Base64 encoded string
     *
     * @param args
     * args[0] should be plain text that will be encrypted
     * If args[1] is be, it should be RSA public key to be used as encrypt public key
     * @return a encrypted string that Base64 encoded
     * @throws NoSuchAlgorithmException
     * @throws NoSuchPaddingException
     * @throws InvalidKeyException
     * @throws IllegalBlockSizeException
     * @throws BadPaddingException
     */
//    @RequiresApi(Build.VERSION_CODES.KITKAT)
    @Throws(NoSuchAlgorithmException::class, NoSuchPaddingException::class, InvalidKeyException::class, IllegalBlockSizeException::class, BadPaddingException::class)
    fun encrypt(vararg args: Object): String {
        val plain = args[0] as String
        val rsaPublicKey: PublicKey
        if (args.size == 1) {
            rsaPublicKey = publicKey!!
        } else {
            rsaPublicKey = args[1] as PublicKey
        }
        cipher = Cipher.getInstance("RSA/ECB/OAEPWithSHA1AndMGF1Padding")
        cipher!!.init(Cipher.ENCRYPT_MODE, rsaPublicKey)
        encryptedBytes = cipher!!.doFinal(plain.toByteArray(StandardCharsets.UTF_8))
        return Base64.encodeToString(encryptedBytes, Base64.DEFAULT)
    }

    @Throws(NoSuchAlgorithmException::class, NoSuchPaddingException::class, InvalidKeyException::class, IllegalBlockSizeException::class, BadPaddingException::class)
    fun decrypt(result: String?): String {
        cipher1 = Cipher.getInstance("RSA/ECB/OAEPWithSHA1AndMGF1Padding")
        cipher1!!.init(Cipher.DECRYPT_MODE, privateKey)
        decryptedBytes = cipher1!!.doFinal(Base64.decode(result, Base64.DEFAULT))
        decrypted = String(decryptedBytes)
        return decrypted as String
    }

    @Throws(NoSuchAlgorithmException::class, NoSuchPaddingException::class, InvalidKeyException::class, IllegalBlockSizeException::class, BadPaddingException::class)
    fun getPublicKey(option: String?): String? {
        return when (option) {
            "pkcs1-pem" -> {
                var pkcs1pem = "-----BEGIN RSA PUBLIC KEY-----\n"
                pkcs1pem += Base64.encodeToString(publicKey!!.getEncoded(), Base64.DEFAULT)
                pkcs1pem += "-----END RSA PUBLIC KEY-----"
                pkcs1pem
            }
            "pkcs8-pem" -> {
                var pkcs8pem = "-----BEGIN PUBLIC KEY-----\n"
                pkcs8pem += Base64.encodeToString(publicKey!!.getEncoded(), Base64.DEFAULT)
                pkcs8pem += "-----END PUBLIC KEY-----"
                pkcs8pem
            }
            "base64" -> Base64.encodeToString(publicKey!!.getEncoded(), Base64.DEFAULT)
            else -> null
        }
    }

    @Throws(NoSuchAlgorithmException::class, NoSuchPaddingException::class, InvalidKeyException::class, IllegalBlockSizeException::class, BadPaddingException::class)
    fun getPrivateKey(option: String?): String? {
        return when (option) {
            "pkcs1-pem" -> {
                var pkcs1pem = "-----BEGIN RSA PRIVATE KEY-----\n"
                pkcs1pem += Base64.encodeToString(privateKey!!.getEncoded(), Base64.DEFAULT)
                pkcs1pem += "-----END RSA PUBLIC KEY-----"
                pkcs1pem
            }
            "pkcs8-pem" -> {
                var pkcs8pem = "-----BEGIN PRIVATE KEY-----\n"
                pkcs8pem += Base64.encodeToString(privateKey!!.getEncoded(), Base64.DEFAULT)
                pkcs8pem += "-----END PRIVATE KEY-----"
                pkcs8pem
            }
            "base64" -> Base64.encodeToString(privateKey!!.getEncoded(), Base64.DEFAULT)
            else -> null
        }
    }

    companion object {
        private const val CRYPTO_METHOD = "RSA"
        private const val CRYPTO_BITS = 2048
        @Throws(NoSuchAlgorithmException::class, NoSuchPaddingException::class, InvalidKeyException::class, IllegalBlockSizeException::class, BadPaddingException::class)
        fun stringToPublicKey(publicKeyString: String): PublicKey? {
            var publicKeyString = publicKeyString
            return try {
                if (publicKeyString.contains("-----BEGIN PUBLIC KEY-----") || publicKeyString.contains("-----END PUBLIC KEY-----")) publicKeyString = publicKeyString.replace("-----BEGIN PUBLIC KEY-----", "").replace("-----END PUBLIC KEY-----", "")
                val keyBytes: ByteArray = Base64.decode(publicKeyString, Base64.DEFAULT)
                val spec = X509EncodedKeySpec(keyBytes)
                val keyFactory: KeyFactory = KeyFactory.getInstance("RSA")
                keyFactory.generatePublic(spec)
            } catch (e: NoSuchAlgorithmException) {
                e.printStackTrace()
                null
            } catch (e: InvalidKeySpecException) {
                e.printStackTrace()
                null
            }
        }

        @Throws(NoSuchAlgorithmException::class, NoSuchPaddingException::class, InvalidKeyException::class, IllegalBlockSizeException::class, BadPaddingException::class)
        fun stringToPrivate(private_key: String?): PrivateKey? {
            try {
                // Read in the key into a String
                val pkcs8Lines = StringBuilder()
                val rdr = BufferedReader(StringReader(private_key))
                var line: String?
                while (rdr.readLine().also { line = it } != null) {
                    pkcs8Lines.append(line)
                }

                // Remove the "BEGIN" and "END" lines, as well as any whitespace
                var pkcs8Pem: String = pkcs8Lines.toString()
                pkcs8Pem = pkcs8Pem.replace("-----BEGIN PRIVATE KEY-----", "")
                pkcs8Pem = pkcs8Pem.replace("-----END PRIVATE KEY-----", "")
                pkcs8Pem = pkcs8Pem.replace("\\s+", "")

                // Base64 decode the result
                val pkcs8EncodedBytes: ByteArray = Base64.decode(pkcs8Pem, Base64.DEFAULT)

                // extract the private key
                val keySpec = PKCS8EncodedKeySpec(pkcs8EncodedBytes)
                val kf: KeyFactory = KeyFactory.getInstance("RSA")
                return kf.generatePrivate(keySpec)
            } catch (e: NoSuchAlgorithmException) {
                e.printStackTrace()
                return null
            } catch (e: InvalidKeySpecException) {
                e.printStackTrace()
                return null
            } catch (e: IOException) {
                e.printStackTrace()
            }
            return null
        }
    }
}