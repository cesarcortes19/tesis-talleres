package com.cursos.excepciones;

/**
 * Created by Cesar on 07/09/2014.
 */
public class NotFoundException extends Exception {

    private static final long serialVersionUID = 8122656025145342051L;
    private final String elem;
    private String messages;


    public NotFoundException(String elem) {
        super("exception.taller.maxima.capacidad", null);
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

