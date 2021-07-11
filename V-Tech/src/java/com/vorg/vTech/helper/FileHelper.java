/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vorg.vTech.helper;

import java.io.File;
import java.io.FileOutputStream;

import java.io.InputStream;

/**
 *
 * @author vishnu
 */
public class FileHelper {

    public static void deleteFile(String path) {

        try {

            File file = new File(path);
            file.delete();
        } catch (Exception e) {
            e.printStackTrace();

        }

    }

    public static boolean save(InputStream is, String path) {
        boolean status = false;
        try {
            byte[] f = new byte[is.available()];
            is.read(f);

            FileOutputStream fos = new FileOutputStream(path);
            fos.write(f);
            fos.flush();
            fos.close();
            status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

}
