package com.aixuexiao.filter;
/**
 * 一些常量备份
 * 
 * @author Liubao
 * @2015年7月26日
 *
 */
public class WXconstant {

    private WXconstant() {
    }

    public static String APPID = "";
    public static String APPSECRET = "";
    
    public final static String WXACOUNT = "gh_72fe40f76a52";
    public final static String TEMP_PIC_MAP = "TEMP_PIC_MAP";
    public final static String REDIS_WX_TOKEN_KEY = "REDIS_WX_TOKEN_KEY";

    static {
//        String appIdtemp = getProperty("saic.ebiz.lemonmember.url.appid");
//        String appsecrettemp = getProperty("saic.ebiz.lemonmember.url.appsecret");
//        if (null != appIdtemp && null != appsecrettemp) {
//            APPID = appIdtemp;
//            APPSECRET = appsecrettemp;
//        } else {
//        }
        // chexiang
        // APPID = "wx0db3d3db0507573c";
        // APPSECRET = "fcf00815652be435cd920cb9cc29a298";
        // ＰＲＥ　环境
        APPID = "wx11171b264f347e84";
        APPSECRET = "b1dbeb044767a2808e79943530714066";
        // 　ＳＩＴ　环境
        // APPID = "wxf7c1f4815cf01592";
        // APPSECRET = "85910aba00998554633e97973b9aa913";
        // APPID = "wx50532a3a86aab9fd";
        // APPSECRET = "7de8b49a3a8b7e845d233c27edecdf30";
        
        /**
         * 车享购服务号 wxc2c9c0c1d5115808 
         * 车享购服务号 bdf9bedfd1e36dc2797cddc02847cb88 
         * 测试账号 wx38a0b3a7cc7761f9
         * 测试账号  04a4ea410735b9a134d41ed29ce64699
         */
    }



}
