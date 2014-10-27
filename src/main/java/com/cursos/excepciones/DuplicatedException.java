package com.cursos.excepciones;

/**
 * Created by Cesar on 07/09/2014.
 */
public class DuplicatedException extends Exception {

    private static final long serialVersionUID = 8122656025145342051L;
    private final String elem;
    private String messages;


    public DuplicatedException(String elem) {
        super("exception.usuario.duplicado", null);
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

