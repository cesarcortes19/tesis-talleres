package com.cursos.excepciones;

/**
 * Created by Cesar on 11/09/2014.
 */
public class TallerMaximaCapacidadException extends Exception {

    private final String elem;
    private String messages;


    public TallerMaximaCapacidadException(String elem) {
        super(elem + "exception.not.found ", null);
        this.elem = elem;
    }
    /*throw new NonUniqueException(barcodeDefinition.getName());*/
    public String getElem() {
        return elem;
    }

    public String getMessages() {
        return messages;
    }
}
