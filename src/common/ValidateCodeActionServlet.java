package common;


import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class ValidateCodeActionServlet extends HttpServlet {
 private static int width = 40;
 private static int heigth = 25;
 private static int font_size = 20;
 private static Random random = new Random();

 @Override
 protected void service(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {
  response.setContentType("image/jpeg");
  String content = this.getRandomStr();
  request.getSession().setAttribute("correctCode", content);
  ServletOutputStream out = response.getOutputStream();
  //构建缓冲图像
  BufferedImage bi = new BufferedImage(60,25,BufferedImage.TYPE_INT_BGR);
  //设置绘图上下文
  Graphics2D g = bi.createGraphics();
  g.setColor(Color.white);
  g.fillRect(0, 0, width, heigth);
  //设置字体
  g.setFont(new Font("宋体",Font.BOLD,font_size));
  g.setColor(Color.black);
  
  for(int i = 0 ; i < 30 ; i ++){
   int x1 = random.nextInt(40);
   int y1 = random.nextInt(25);
   int x2 = random.nextInt(40);
   int y2 = random.nextInt(25);
   g.setColor(new Color(255,255,100));
   g.drawLine(x1, y1, x2, y2);
  }
  for(int i = 0 ; i < 500 ; i ++){
   g.setColor(this.getRandomColor());
   g.drawOval(random.nextInt(60), random.nextInt(25), 0, 0);
  }
  g.drawString(content, 10, 18);//----------------------------------------

  JPEGImageEncoder coder = JPEGCodec.createJPEGEncoder(out);
  coder.encode(bi);
  
  out.flush();
  out.close();
 }

 /**
  * get four numbers random
  * @return String
  */
 private String getRandomStr() {
  String str = "";
  for(int i = 0 ; i < 4 ; i ++){
   int temp = random.nextInt(10);
   str += temp;
  }
  return str;
 }
 
 /**
  * get a random color
  * @return Color
  */
 private Color getRandomColor(){
  int R = random.nextInt(255);
  int G = random.nextInt(255);
  int B = random.nextInt(255);
  Color color = new Color(R,G,B);
  return color;
 }

} 