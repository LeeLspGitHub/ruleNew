package com.lee;

import com.lee.util.CalculateExpression;
import com.lee.util.Calculator;
import com.sun.jmx.snmp.tasks.ThreadService;

import java.util.Base64;


/**
 * @ClassName Demo
 * @Description TODO
 * @Author Lee
 * @Date 2020/3/10 17:42
 */
public class Demo {
      public static void main(String[] args) {
          final long timeInterval = 30000;// 两分钟运行一次
          //final ThreadService threadService = new ThreadService(1);
          Runnable runnable = new Runnable() {
              public void run() {
                  while (true) {
                      // ------- code for task to run
                      System.out.println("========"+System.currentTimeMillis());//你要运行的程序
                      // ------- ends here
                      try {
                          Thread.sleep(timeInterval);
                      } catch (InterruptedException e) {
                          e.printStackTrace();
                      }
                  }
              }
          };
          Thread thread = new Thread(runnable);
          thread.start();
      }




}
