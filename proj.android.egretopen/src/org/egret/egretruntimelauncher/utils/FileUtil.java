package org.egret.egretruntimelauncher.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/**
 * 渠道接入Runtime.请勿修改此类.
 * @author imathliu
 *
 */
public class FileUtil {
    private static final int BUFFER_SIZE = 1024;

    public static boolean copy(File src, File dst) {
        if (src == null || dst == null) {
            return false;
        }
        FileInputStream in = null;
        FileOutputStream out = null;
        try {
            in = new FileInputStream(src);
            out = new FileOutputStream(dst);
            byte[] buffer = new byte[BUFFER_SIZE];
            int read;
            while ((read = in.read(buffer, 0, BUFFER_SIZE)) > 0) {
                out.write(buffer, 0, read);
            }
            return true;
        } catch (IOException ioe) {
            ioe.printStackTrace();
            return false;
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
                if (out != null) {
                    out.close();
                }
            } catch (IOException ioe) {
                ioe.printStackTrace();
            }
        }
    }

    public static boolean copyToRoot(File src, File dstRoot) {
        if (src == null || dstRoot == null) {
            return false;
        }
        File dst = new File(dstRoot, src.getName());
        return copy(src, dst);
    }

    public static boolean move(File src, File dst) {
        return !(src == null || dst == null) && src.renameTo(dst);
    }

    public static boolean moveToRoot(File src, File dstRoot) {
        if (src == null || dstRoot == null) {
            return false;
        }
        File dst = new File(dstRoot, src.getName());
        return move(src, dst);
    }

    public static boolean writeFile(File dst, String content) {
        FileWriter out = null;
        BufferedWriter bufferedWriter = null;
        try {
            out = new FileWriter(dst);
            bufferedWriter = new BufferedWriter(out);
            bufferedWriter.write(content);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (bufferedWriter != null) {
                    bufferedWriter.close();
                }
                if (out != null) {
                    out.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static String readFile(File file) {
        FileReader fileReader = null;
        BufferedReader bufferedReader = null;
        try {
            fileReader = new FileReader(file);
            bufferedReader = new BufferedReader(fileReader);

            String line;
            StringBuilder strBuffer = new StringBuilder();

            while ((line = bufferedReader.readLine()) != null) {
                strBuffer.append(line);
            }
            return strBuffer.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (bufferedReader != null) {
                    bufferedReader.close();
                }
                if (fileReader != null) {
                    fileReader.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
