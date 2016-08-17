package org.egret.egretruntimelauncher.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.MessageDigest;

/**
 * 渠道接入Runtime.请勿修改此类.
 * @author imathliu
 *
 */
public class Md5Util {

    public static boolean checkMd5(File file, String md5String) {
        if (file == null || md5String == null) {
            return false;
        }
        String hash = md5(file);
        return hash != null && hash.equals(md5String);
    }

    public static String md5(File file) {
        if (!file.exists()) {
            return null;
        }
        FileInputStream in = null;
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            in = new FileInputStream(file);
            int b;
            byte[] buffer = new byte[1024];
            while ((b = in.read(buffer)) > 0) {
                md5.update(buffer, 0, b);
            }
            return getMd5String(md5.digest());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private static String getMd5String(byte[] md) {
        char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f'};
        int j = md.length;
        char[] str = new char[j * 2];
        for (int i = 0; i < j; i++) {
            byte hex = md[i];
            str[2 * i] = hexDigits[hex >>> 4 & 0xf];
            str[i * 2 + 1] = hexDigits[hex & 0xf];
        }
        return new String(str);
    }

}
