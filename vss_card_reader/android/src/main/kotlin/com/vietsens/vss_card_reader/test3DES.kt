package com.vietsens.vss_card_reader

import javax.crypto.Cipher
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec

/**
 * Encrypt/Decrypt text2text by using Triple-DES
 *
 * @author Tom Misawa (riversun.org@gmail.com)
 */
class test3DES {
    /**
     * Encrypt text to encrypted-text
     *
     * @param data
     * @return
     */
    fun encryptECB(data: ByteArray?, key: ByteArray?): ByteArray? {
        val mode = "DESede/ECB/NoPadding"
        val keys = ByteArray(24)
        System.arraycopy(key, 0, keys, 0, 16)
        System.arraycopy(key, 0, keys, 16, 8)
        if (data == null) {
            return null
        }
        var encrypted: ByteArray? = null
        try {
            val secretKeySpec = SecretKeySpec(keys, CRYPT_ALGORITHM)
            val cipher: Cipher = Cipher.getInstance(mode)
            cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec)
            encrypted = cipher.doFinal(data)
        } catch (e: Exception) {
            e.printStackTrace()
        }
        return encrypted
    }

    fun decryptECB(cipher_data: ByteArray?, key: ByteArray?): ByteArray? {
        val mode = "DESede/ECB/NoPadding"
        val keys = ByteArray(24)
        System.arraycopy(key, 0, keys, 0, 16)
        System.arraycopy(key, 0, keys, 16, 8)
        if (cipher_data == null) {
            return null
        }
        var decrypted: ByteArray? = null
        try {
            val secretKeySpec = SecretKeySpec(keys, CRYPT_ALGORITHM)
            val cipher: Cipher = Cipher.getInstance(mode)
            cipher.init(Cipher.DECRYPT_MODE, secretKeySpec)
            decrypted = cipher.doFinal(cipher_data)
        } catch (e: Exception) {
            e.printStackTrace()
        }
        return decrypted
    }

    /**
     * Encrypt text to encrypted-text
     *
     * @param text
     * @return
     */
    fun encryptCBC(data: ByteArray?, key: ByteArray?): ByteArray? {
        val mode = "DESede/CBC/PKCS5Padding"
        val keys = ByteArray(24)
        System.arraycopy(key, 0, keys, 0, 16)
        System.arraycopy(key, 0, keys, 16, 8)
        if (data == null) {
            return null
        }
        var encrypted: ByteArray? = null
        try {
            val secretKeySpec = SecretKeySpec(keys, CRYPT_ALGORITHM)
            val iv = IvParameterSpec(MY_IV)
            val cipher: Cipher = Cipher.getInstance(mode)
            cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, iv)
            encrypted = cipher.doFinal(data)
        } catch (e: Exception) {
            e.printStackTrace()
        }
        return encrypted
    }

    /**
     * Decrypt encrypted-text
     *
     * @param text
     * @return
     */
    fun decryptCBC(data: ByteArray?, key: ByteArray?): ByteArray? {
        val mode = "DESede/CBC/PKCS5Padding"
        val keys = ByteArray(24)
        System.arraycopy(key, 0, keys, 0, 16)
        System.arraycopy(key, 0, keys, 16, 8)
        if (data == null) {
            return null
        }
        var decrypted: ByteArray? = null
        try {
            val secretKeySpec = SecretKeySpec(key, CRYPT_ALGORITHM)
            val iv = IvParameterSpec(MY_IV)
            val cipher: Cipher = Cipher.getInstance(mode)
            cipher.init(Cipher.DECRYPT_MODE, secretKeySpec, iv)
            decrypted = cipher.doFinal(data)
        } catch (e: Exception) {
            e.printStackTrace()
        }
        return decrypted
    }

    /**
     * Encrypt text to encrypted-text
     *
     * @param text
     * @return
     */
    fun encryptCBCOtp(data: ByteArray?, key: ByteArray?): ByteArray? {
        val mode = "DESede/CBC/PKCS7Padding"
        if (data == null) {
            return null
        }
        var encrypted: ByteArray? = null
        try {
            val MY_IV_PRI: ByteArray = "00000000".toByteArray()
            val secretKeySpec = SecretKeySpec(key, "DESede")
            val iv = IvParameterSpec(MY_IV_PRI)
            val cipher: Cipher = Cipher.getInstance(mode, "BC")
            cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, iv)
            encrypted = cipher.doFinal(data)
        } catch (e: Exception) {
            e.printStackTrace()
        }
        return encrypted
    }

    /**
     * Decrypt encrypted-text
     *
     * @param text
     * @return
     */
    fun decryptCBCOtp(data: ByteArray?, key: ByteArray?): ByteArray? {
        val mode = "DESede/CBC/PKCS7Padding"
        if (data == null) {
            return null
        }
        var decrypted: ByteArray? = null
        try {
            val MY_IV_PRI: ByteArray =  "00000000".toByteArray()
            val secretKeySpec = SecretKeySpec(key, "DESede")
            val iv = IvParameterSpec(MY_IV_PRI)
            val cipher: Cipher = Cipher.getInstance(mode, "BC")
            cipher.init(Cipher.DECRYPT_MODE, secretKeySpec, iv)
            decrypted = cipher.doFinal(data)
        } catch (e: Exception) {
            e.printStackTrace()
        }
        return decrypted
    }

    companion object {
        private const val CRYPT_ALGORITHM = "DESede"
        private val MY_IV = byteArrayOf(0, 0, 0, 0, 0, 0, 0, 0)
    }
}