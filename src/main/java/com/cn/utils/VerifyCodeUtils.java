package com.cn.utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

/**
 * Created by ddning on 2018/1/22.
 */
public class VerifyCodeUtils {
    private static final String VERIFY_CODES="23456789ABCDEFGHJKLMNPQRSTUVWXYZ";
    private static Random random = new Random();

    /**
     * 用指定字母生成验证码
     * @param verifySize
     * @return
     */
    public static String genVerifyCodes(int verifySize){
        return genVerifyCodes(verifySize,VERIFY_CODES);
    }

    public static String genVerifyCodes(int verifySize,String source){
        if(source == null || source.length() == 0)
            source = VERIFY_CODES;
        int sourceLen = source.length();
        Random rand = new Random(System.currentTimeMillis());
        StringBuilder verifyCode = new StringBuilder(verifySize);
        for(int i = 0; i < verifySize; i++){
            verifyCode.append(source.charAt(rand.nextInt(sourceLen)));
        }
        return verifyCode.toString();
    }

    /**
     * 生成验证码图片
     * @param w
     * @param h
     * @param outputFile
     * @param verifyCode
     * @throws IOException
     */
    public static void outputImage(int w, int h, File outputFile,String verifyCode) throws IOException{
        if(outputFile == null){
            return;
        }
        File dir = outputFile.getParentFile();
        if(!dir.exists()){
            dir.mkdirs();
        }
        try{
            outputFile.createNewFile();
            FileOutputStream fos = new FileOutputStream(outputFile);
            outputImage(w,h,fos,verifyCode);
            fos.close();
        }catch (IOException e){
            throw e;
        }
    }

    /**
     * 输出验证码图片流
     * @param w
     * @param h
     * @param os
     * @param verifyCode
     * @throws IOException
     */
    public static void outputImage(int w, int h, OutputStream os,String verifyCode) throws IOException{
        int verifySize = verifyCode.length();
        BufferedImage image = new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB);
        Graphics2D graph = image.createGraphics();
        graph.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);

        //定义颜色空间，随机生成颜色
        Random random = new Random();
        Color[] colorSpace = new Color[]{Color.black,Color.white,
                Color.BLUE,Color.GREEN,Color.red,
                Color.CYAN,Color.yellow};
        Color[] color = new Color[5];
        float[] franction = new float[color.length];
        for(int i = 0; i < color.length; i++){
            color[i] = colorSpace[random.nextInt(color.length)];
            franction[i] = random.nextFloat();
        }

        graph.setColor(Color.gray); //设置底色
        graph.fillRect(0,0,w,h);

        Color c = randomColor(200,250);
        graph.setColor(c);
        graph.fillRect(0,2,w,h-4);

        //绘制干扰线
        graph.setColor(randomColor(160,200));
        for(int i = 0; i < 20; i++){
            int x = random.nextInt(w - 1);
            int y = random.nextInt(h - 1);
            int x1 = random.nextInt(6) +1;
            int y1 = random.nextInt(12)+1;
            graph.drawLine(x,y,x+x1+40,y+y1+20);
        }

        //添加噪点
        float yawpRate = 0.05f;
        int area = (int) yawpRate * w * h;
        for(int i = 0; i < area; i++){
            int x = random.nextInt(w);
            int y = random.nextInt(h);

            int rgb = getRandomIntColor();
            image.setRGB(x,y,rgb);
        }

        //图片扭曲
        shear(graph,w,h,c);

        //设置验证码字体、颜色
        graph.setColor(randomColor(100,160));
        int fontSize = h-4;
        Font font = new Font("Algerian",Font.ITALIC,fontSize);
        graph.setFont(font);
        char[] chars = verifyCode.toCharArray();
        for(int i = 0; i < verifySize; i++){
            AffineTransform affine = new AffineTransform();
            affine.setToRotation(Math.PI / 4 * random.nextDouble() * (random.nextBoolean() ? 1 : -1), (w / verifySize) * i + fontSize/2, h/2);
            graph.setTransform(affine);
            graph.drawChars(chars,i,1,((w-10) / verifySize) * i + 5, h/2 + fontSize/2 - 10);
        }

        graph.dispose();
        ImageIO.write(image,"jpg",os);

    }

    private static Color randomColor(int fc, int bc) {
        if (fc > 255)
            fc = 255;
        if (bc > 255)
            bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }

    private static int getRandomIntColor() {
        int[] rgb = getRandomRgb();
        int color = 0;
        for (int c : rgb) {
            color = color << 8;
            color = color | c;
        }
        return color;
    }

    private static int[] getRandomRgb() {
        int[] rgb = new int[3];
        for (int i = 0; i < 3; i++) {
            rgb[i] = random.nextInt(255);
        }
        return rgb;
    }

    private static void shear(Graphics g, int w1, int h1, Color color) {
        shearX(g, w1, h1, color);
        shearY(g, w1, h1, color);
    }

    private static void shearX(Graphics g, int w1, int h1, Color color) {

        int period = random.nextInt(2);

        boolean borderGap = true;
        int frames = 1;
        int phase = random.nextInt(2);

        for (int i = 0; i < h1; i++) {
            double d = (double) (period >> 1)
                    * Math.sin((double) i / (double) period
                    + (6.2831853071795862D * (double) phase)
                    / (double) frames);
            g.copyArea(0, i, w1, 1, (int) d, 0);
            if (borderGap) {
                g.setColor(color);
                g.drawLine((int) d, i, 0, i);
                g.drawLine((int) d + w1, i, w1, i);
            }
        }
    }

    private static void shearY(Graphics g, int w1, int h1, Color color) {
        int period = random.nextInt(40) + 10; // 50;
        boolean borderGap = true;
        int frames = 20;
        int phase = 7;
        for (int i = 0; i < w1; i++) {
            double d = (double) (period >> 1)
                    * Math.sin((double) i / (double) period
                    + (6.2831853071795862D * (double) phase)
                    / (double) frames);
            g.copyArea(i, 0, 1, h1, 0, (int) d);
            if (borderGap) {
                g.setColor(color);
                g.drawLine(i, (int) d, i, 0);
                g.drawLine(i, (int) d + h1, i, h1);
            }
        }
    }

//    public static void main(String[] args) throws IOException{
//        File out = new File("valid");
//        int w = 200;
//        int h = 80;
//        for(int i = 0; i < 20; i++){
//            String verifyCode = genVerifyCodes(4);
//            File verifyFile = new File(out,verifyCode+".jpg");
//            outputImage(w,h,verifyFile,verifyCode);
//
//        }
//    }




}
