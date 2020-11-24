package com.etc.lol.controller;
//文件上传


import com.etc.lol.entity.Hero;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.PrintWriter;

@Controller
public class FileController {
    @RequestMapping(value ="/upload",method = RequestMethod.POST)
    public void  upload(@RequestParam(value = "myfiles",required = false)  MultipartFile[] myfiles, HttpServletRequest request,
                        HttpServletResponse response)
            throws Exception{
        //  request.getRealPath()
        String path=  request.getSession().getServletContext().getRealPath("/upload");
        System.out.println("上传的地址:"+path);
        //执行文件上传
        boolean flag = false;
        for(MultipartFile myfile:myfiles) {

            File file = new File(path + "/" + myfile.getOriginalFilename());

            try {
                //实现上传
                FileUtils.copyInputStreamToFile(myfile.getInputStream(), file);
                flag = true;
                System.out.println("上传成功");
            } catch (Exception e) {
                e.printStackTrace();
                flag=false;
            }
        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        if(flag){
            out.print("<script>alert('上传成功');location.href='index.jsp';</script>");
        }else{
            out.print("<script>alert('上传失败');history.go(-1);</script>");
        }
        out.flush();
        out.close();


    }
}
