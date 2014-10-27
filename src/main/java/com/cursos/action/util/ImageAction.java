package com.cursos.action.util;


import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.Map;

public class ImageAction extends ActionSupport implements ServletRequestAware, SessionAware {

    byte[] imageInByte=null;
    private String imageId;
    Map<String, Object> session;

    private HttpServletRequest servletRequest;

    public ImageAction() {
        System.out.println("ImageAction");
    }

    public String getImageId() {
        return imageId;
    }

    public void setImageId(String imageId) {
        this.imageId = imageId;
    }

    public String execute() {
        return SUCCESS;
    }

    public byte[] getCustomImageInBytes() {

        /*System.out.println("imageId" + imageId);*/
        /*BufferedImage originalImage;*/
        try {
            Map<Integer, byte[]> pictureMap = (Map<Integer, byte[]>) session.get("pictureMap");

/*            originalImage = ImageIO.read(getImageFile(this.imageId));
            // convert BufferedImage to byte array
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(originalImage, "jpg", baos);
            baos.flush();
            imageInByte = baos.toByteArray();
            baos.close();*/
            imageInByte = pictureMap.get(Integer.parseInt(imageId));

        } catch (Exception e) {

            e.printStackTrace();
        }

        return imageInByte;
    }

    private File getImageFile(String imageId) {
        String filePath = servletRequest.getSession().getServletContext().getRealPath("/");
        //File file = new File(filePath + "/resources/images/", "75627_499753643161_3584845_n.jpg");
        File file = new File("C:/Users/Cesar/Desktop/tumblr_mp2mc8Tzfu1qid1jko1_1280.jpg");
        System.out.println(file.toString());
        return file;
    }


    public String getCustomContentType() {
        return "image/jpeg";
    }

    public String getCustomContentDisposition() {
        return "anyname.jpg";
    }

    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.servletRequest = request;

    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}