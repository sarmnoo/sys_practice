package com.cn.utils;

import org.hibernate.internal.util.BytesHelper;

import java.io.Serializable;
import java.net.Inet4Address;
import java.net.InetAddress;

/**
 * Created by ddning on 2018/2/1.
 */
public class UUIDGenerator {
    private String sep = "";
    private static final int IP;
    static{
        int ipadd;
        try{
            ipadd = BytesHelper.toInt(InetAddress.getLocalHost().getAddress());
        }catch (Exception e){
            ipadd = 0;
        }
        IP = ipadd;
    }
    private static short counter = (short) 0;
    private static final int JVM = (int)(System.currentTimeMillis() >>> 8);

    private int getJVM(){
        return JVM;
    }

    private short getCounter(){
        synchronized (UUIDGenerator.class){
            if(counter < 0)
                counter = 0;
            return counter ++;
        }
    }

    private int getIP(){
        return IP;
    }

    private short getHiTime(){
        return (short)(System.currentTimeMillis() >>> 32);
    }

    private int getLoTime(){
        return (int)System.currentTimeMillis();
    }

    private String format(int intval){
        String formatted = Integer.toHexString(intval);
        StringBuffer buf = new StringBuffer("00000000");
        buf.replace(8 - formatted.length(),8,formatted);
        return buf.toString();
    }

    private String format(short shortval){
        String formatted = Integer.toHexString(shortval);
        StringBuffer buf = new StringBuffer("00000000");
        buf.replace(4 - formatted.length(),4,formatted);
        return buf.toString();
    }

    public Serializable generate(){
        return new StringBuffer(36)
                .append(format(getIP()))
                .append(sep)
                .append(format(getJVM()))
                .append(sep)
                .append(format(getHiTime()))
                .append(sep)
                .append(format(getLoTime()))
                .append(sep)
                .append(format(getCounter()))
                .toString();
    }
}
