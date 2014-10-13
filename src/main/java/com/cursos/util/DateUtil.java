package com.cursos.util;

import java.sql.Date;

/**
 * Created by Cesar on 13/10/2014.
 */
public class DateUtil {

    public static Date getCurrentDate(){
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        return sqlDate;
    }
}
