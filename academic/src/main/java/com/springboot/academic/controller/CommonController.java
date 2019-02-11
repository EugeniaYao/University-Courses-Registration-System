package com.springboot.academic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class CommonController {

	/**
	 * 图片上传
	 *
	 * @param file
	 * @param response
	 */
	@RequestMapping("/uploadFile")
	public void uploadFile(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletResponse response) {

		String fileName = null;
		if (!file.isEmpty()) {
			try {
				String[] type = file.getOriginalFilename().split("\\.");
				fileName = new Date().getTime() + "." + type[1];

				byte[] bytes = file.getBytes();
				//BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(new File("D:\\IdeaProjects\\academic\\src\\main\\resources\\static\\file\\" + fileName)));
				BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(new File("/Users/yuanjingyao/Desktop/files/" + fileName)));
				buffStream.write(bytes);
				buffStream.close();
			} catch (Exception e) {
			}

		} else {

		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.write(fileName);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}
	}

}