package com.java.portal.utilities;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.springframework.stereotype.Component;

@Component
public class FileUtility {

	File propFileScanner = null;
	FileInputStream in = null;
	Properties pro = null;

	/**
	 * This method is used to load any property file.
	 * 
	 * @param filePath
	 * @return Properties
	 * 
	 */
	
	public static String getFileName(String filePath){
		try{
			File file=new File(filePath);
			return file.getName();
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
			
		
	}
	public Properties loadPropertyFile(String filePath) {
		try {
			propFileScanner = new File(filePath);
			if (propFileScanner.exists()) {
				pro = new Properties();
				in = new FileInputStream(propFileScanner);
				pro.load(in);
			}

		} catch (FileNotFoundException fne) {
			fne.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
		return pro;
	}

	/**
	 * This method is used to check the existence of files.
	 * 
	 * @param files
	 * @return ArrayList
	 * 
	 */
	public ArrayList checkFiles(ArrayList files) {
		ArrayList al = new ArrayList();
		for (int i = 0; i <= files.size() - 1; i++) {
			File file = new File(files.get(i).toString());
			if (file.exists() != true) {
				al.add(files.get(i).toString());
			}
		}
		return al;
	}

	/**
	 * This method is used to copy the file.
	 * 
	 * @param srcFile
	 *            , dstFile
	 * 
	 */

	public static void copyFile(String srcFile, String dstFile) {
		InputStream in = null;
		OutputStream out = null;
		try {
			File src = new File(srcFile);
			if (src.isFile()) {
				File dst = new File(dstFile);
				in = new FileInputStream(src);
				out = new FileOutputStream(dst);

				// Transfer bytes from in to out
				byte[] buf = new byte[1024];
				int len;
				while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
				in.close();
				out.close();
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
		}

	/**
	 * This method returns the string having the content of the file.
	 * 
	 * @param path
	 *            , filename
	 * @return String
	 */

	public String readTxtFile(String path, String filename) {
		File file = null;
		BufferedReader br = null;
		String fileName = null;
		String temp = null;
		StringBuffer line = null;
		File f1 = new File(path);
		String Filefound = "";

		if (f1.isDirectory()) {
			try {
				File[] files = f1.listFiles();
				file = null;
				for (int index = 0; index < files.length; index++) {
					file = files[index];
					fileName = file.getName();
					if (file.isFile() && fileName.startsWith(filename)
							&& fileName.endsWith(".txt")) {
						Filefound = "TRUE";
						br = new BufferedReader(new FileReader(file));
						while ((temp = br.readLine()) != null) {
							if (temp != null) {
								if (line == null) {
									line = new StringBuffer(500);
								}
								line.append(temp + "<br>");
							}
						}
						br.close();
					}
				}
			} catch (FileNotFoundException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (Filefound.equals("TRUE")) {
			return (line != null) ? line.toString() : "";
		} else {
			return "File not found";
		}
   
	}
	
	
	/**
	 * This method returns the string having the content of the file.
	 * 
	 * @param path
	 * @return String
	 */
	public String readFile(String path){

		File file = new File(path);
	    FileInputStream fis = null;
	    BufferedInputStream bis = null;
	    DataInputStream dis = null;
	    StringBuffer sb = new StringBuffer();
	    try {
	      fis = new FileInputStream(file);
	      bis = new BufferedInputStream(fis);
	      dis = new DataInputStream(bis);
	      while (dis.available() != 0) {
	        String s3 = dis.readLine();
	        sb.append(s3+"\n");
	        
	      }
	      fis.close();
	      bis.close();
	      dis.close();
	      }
	    
	    catch (FileNotFoundException e) {
	      e.printStackTrace();
	    } catch (IOException e) {
	      e.printStackTrace();
	    }
	    return sb.toString();
	}
	
	public static boolean writeFile(String filePath, String content){
		try {
			File file = new File(filePath);
			if (!file.exists()) {
				file.createNewFile();
			}
			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(content);
			bw.close();
			return true;

		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	

	public static void createZip(List<String> fileList, String outputZipPath) {
		System.out.println("Zip:"+outputZipPath);
		try {
			FileOutputStream fos = new FileOutputStream(outputZipPath);
			ZipOutputStream zos = new ZipOutputStream(fos);

			for(String fileName:fileList){
				addToZipFile(fileName, zos);
				File file=new File(fileName);
				file.delete();
			}
			
			zos.close();
			fos.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public static void addToZipFile(String fileName, ZipOutputStream zos) throws FileNotFoundException, IOException {

		System.out.println("Writing '" + fileName + "' to zip file");

		File file = new File(fileName);
		FileInputStream fis = new FileInputStream(file);
		ZipEntry zipEntry = new ZipEntry(file.getName());
		zos.putNextEntry(zipEntry);

		byte[] bytes = new byte[1024];
		int length;
		while ((length = fis.read(bytes)) >= 0) {
			zos.write(bytes, 0, length);
		}

		zos.closeEntry();
		fis.close();
	}

}
