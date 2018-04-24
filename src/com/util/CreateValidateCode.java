package com.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * �����֤��ͼƬ
 */
public class CreateValidateCode{

	//����Random����
		 static Random random=new Random();
		 //�����ɰ���֤���ַ�
		 public static String random(int num){
			  //��ʼ������
			  String[] str={"1","2","3","4","5","6","7","8","9",
			       "a","b","c","d","e","f","g","h","i","j",
			       "k","m","n","p","q","r","s","t","u","v","w","x","y"};
			  int number=str.length;
			  //��������ַ�
			  String text = "";
			  //������4���ַ���ַ�
			  for(int i=0;i<num;i++){
				  text+=str[random.nextInt(number)];
			  }
			  return text;
		 }
		 /**
		  * �����������ɫ
		  * 
		  * @return
		  */
		 private static Color getRandColor() {
			  Random random = new Random();
			  Color color[] = new Color[10];
			  color[0] = new Color(32, 158, 25);
			  color[1] = new Color(218, 42, 19);
			  color[2] = new Color(31, 75, 208);
			  color[3] = new Color(0, 102, 182);
			  color[4] = new Color(171, 0, 85);
			  return color[random.nextInt(5)];
		 }
		 /**
		  * �����������
		  * 
		  * @return
		  */
		 private static Font getFont() {
			  Random random = new Random();
			  Font font[] = new Font[5];
			  font[0] = new Font("Ravie", Font.BOLD, 30);
			  font[1] = new Font("Antique Olive Compact", Font.BOLD, 30);
			  font[2] = new Font("Forte", Font.BOLD, 30);
			  font[3] = new Font("Wide Latin", Font.BOLD, 30);
			  font[4] = new Font("Gill Sans Ultra Bold", Font.BOLD, 30);
			  return font[random.nextInt(5)];
		 }
    
	public static void getValidatePic(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//���ò�����ͼƬ  
        response.setHeader("Pragma", "No-cache");  
        response.setHeader("Cache-Control", "No-cache");  
        response.setDateHeader("Expires", 0);  
        //ָ����ɵ���ӦͼƬ,һ������ȱ����仰,�������.  
        response.setContentType("image/jpeg"); 
        //���ò�����ͼƬ  
        response.setHeader("Pragma", "No-cache");  
        response.setHeader("Cache-Control", "No-cache");  
        response.setDateHeader("Expires", 0);  
        //ָ����ɵ���ӦͼƬ,һ������ȱ����仰,�������.  
        response.setContentType("image/jpeg"); 
        String randomStr=random(4);//��ȡ��֤��
        HttpSession session = request.getSession();
        session.setAttribute("strEnsure", randomStr);
        int width = 90;//��
        int height = 40;//��
        //���ڴ��д���ͼ��
		  BufferedImage bi=new BufferedImage(width, height, BufferedImage.TYPE_BYTE_INDEXED);
		  //��ȡͼ��������
		  Graphics2D g=(Graphics2D) bi.getGraphics();
		  //���߿�
		  g.setColor(Color.white);
		  g.fillRect(0, 0, width, height);
		  g.setFont(getFont());
		  g.setColor(Color.BLACK);
		  //����֤�룬ÿ����֤���ڲ�ͬ��ˮƽλ��
		  String str1[]=new String[randomStr.length()];
		  for(int i=0;i<str1.length;i++){
			   str1[i]=randomStr.substring(i,i+1);
			   int w=0;
			   int x=(i+1)%3;
			   //��������֤���ַ�ˮƽƫ����
			   if(x==random.nextInt(7)){
			    w=30-random.nextInt(7);
			   }else{
			    w=30+random.nextInt(7);
			   }
			   //��������ɫ
			   g.setColor(getRandColor());
			   g.drawString(str1[i], 20*i+10, w);
		  }
		  //��������ŵ㣬���ò�ͬ����ɫ��ʾ����ͼ�����֤�벻�ױ��������̽�⵽
		  for(int i=0;i<100;i++){
			   int x=random.nextInt(width);
			   int y=random.nextInt(height);
			   Color color=new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
			   //��������ɫ����
			   g.setColor(color);
			   g.drawOval(x, y, 0, 0);
		  }
		  //��������
		  for(int i=0;i<15;i++){
			   int x=random.nextInt(width);
			   int y=random.nextInt(height);
			   int x1=random.nextInt(width);
			   int y1=random.nextInt(height);
			   Color color=new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
			   //��������ɫ��
			   g.setColor(color);
			   g.drawLine(x, y, x1, y1);
		  }
		  //ͼ����Ч
		  g.dispose();
		  //���ҳ��
		  ServletOutputStream responseOutputStream = response.getOutputStream();
		  ImageIO.write(bi, "jpg", responseOutputStream);
	}
	
}
