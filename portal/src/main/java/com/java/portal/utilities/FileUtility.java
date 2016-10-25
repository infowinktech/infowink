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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;

import com.java.portal.entity.ContactMessage;
import com.java.portal.entity.JobApplication;
import com.java.portal.entity.Jobs;
import com.java.portal.entity.User;

@Component
public class FileUtility {
	private static final Logger log = Logger.getLogger(FileUtility.class);

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

	public static String getFileName(String filePath) {
		try {
			File file = new File(filePath);
			return file.getName();

		} catch (Exception e) {
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
					if (file.isFile() && fileName.startsWith(filename) && fileName.endsWith(".txt")) {
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
	public String readFile(String path) {

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
				sb.append(s3 + "\n");

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

	public static boolean writeFile(String filePath, String content) {
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
		System.out.println("Zip:" + outputZipPath);
		try {
			FileOutputStream fos = new FileOutputStream(outputZipPath);
			ZipOutputStream zos = new ZipOutputStream(fos);

			for (String fileName : fileList) {
				addToZipFile(fileName, zos);
				File file = new File(fileName);
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

	public static String getTimeStamp() {
		// WebLogger.info(" In StringOps: Inside the getTimeStamp() method");
		Date date = new Date();
		String dateFormat = "yyyyMMddHHmmss";
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
		String timeStamp = sdf.format(date);
		// WebLogger.info("In StringOps: Completed getTimeStamp() Exiting
		// method");
		return timeStamp;
	}

	public void writeJobs(List<Jobs> jobsList, String excelFilePath) throws IOException {
		try {
			Workbook workbook = new XSSFWorkbook();
			org.apache.poi.xssf.usermodel.XSSFSheet sheet = (org.apache.poi.xssf.usermodel.XSSFSheet) workbook
					.createSheet();
			int rowCount = 1;
			Row headerRow = sheet.createRow(0);
			XSSFFont font = (XSSFFont) workbook.createFont();
			font.setColor(new XSSFColor(new java.awt.Color(255, 255, 255)));
			font.setBold(true);

			XSSFCellStyle style = (XSSFCellStyle) workbook.createCellStyle();
			style.setFillForegroundColor(new XSSFColor(new java.awt.Color(44, 62, 80)));
			style.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
			style.setFont(font);

			sheet.setColumnWidth(0, 4000);
			sheet.setColumnWidth(1, 12000);
			sheet.setColumnWidth(2, 5000);
			sheet.setColumnWidth(3, 4000);
			sheet.setColumnWidth(4, 4000);

			XSSFCell cell = (XSSFCell) headerRow.createCell(0);
			cell.setCellValue("Job Code");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(1);
			cell.setCellValue("Title");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(2);
			cell.setCellValue("Location");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(3);
			cell.setCellValue("Job Type");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(4);
			cell.setCellValue("Job Status");
			cell.setCellStyle(style);

			for (Jobs jobs : jobsList) {
				Row row = sheet.createRow(rowCount);
				writeJobsRows(jobs, row);
				rowCount++;
			}

			FileOutputStream outputStream = new FileOutputStream(excelFilePath);
			workbook.write(outputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void writeJobsRows(Jobs job, Row row) {
		Cell cell = row.createCell(0);
		cell.setCellValue(job.getJobCode());

		cell = row.createCell(1);
		cell.setCellValue(job.getJobTitle());

		cell = row.createCell(2);
		cell.setCellValue(job.getJobLocation());

		cell = row.createCell(3);
		cell.setCellValue(job.getJobType());

		cell = row.createCell(4);
		cell.setCellValue(job.getJobStatus());
	}

	public void writeApplications(List<JobApplication> jpaList, String excelFilePath) throws IOException {
		try {
			Workbook workbook = new XSSFWorkbook();
			org.apache.poi.xssf.usermodel.XSSFSheet sheet = (org.apache.poi.xssf.usermodel.XSSFSheet) workbook
					.createSheet();
			int rowCount = 1;
			Row headerRow = sheet.createRow(0);
			XSSFFont font = (XSSFFont) workbook.createFont();
			font.setColor(new XSSFColor(new java.awt.Color(255, 255, 255)));
			font.setBold(true);

			XSSFCellStyle style = (XSSFCellStyle) workbook.createCellStyle();
			style.setFillForegroundColor(new XSSFColor(new java.awt.Color(44, 62, 80)));
			style.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
			style.setFont(font);

			sheet.setColumnWidth(0, 4000);
			sheet.setColumnWidth(1, 9000);
			sheet.setColumnWidth(2, 5000);
			sheet.setColumnWidth(3, 5000);
			sheet.setColumnWidth(4, 5000);
			sheet.setColumnWidth(5, 5000);

			XSSFCell cell = (XSSFCell) headerRow.createCell(0);
			cell.setCellValue("Name");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(1);
			cell.setCellValue("Email");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(2);
			cell.setCellValue("Job Code");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(3);
			cell.setCellValue("Job Location");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(4);
			cell.setCellValue("Application Status");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(5);
			cell.setCellValue("Date Submitted");
			cell.setCellStyle(style);

			for (JobApplication jpa : jpaList) {
				Row row = sheet.createRow(rowCount);
				writeApplicationRows(jpa, row);
				rowCount++;
			}

			FileOutputStream outputStream = new FileOutputStream(excelFilePath);
			workbook.write(outputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void writeApplicationRows(JobApplication jpa, Row row) {
		Cell cell = row.createCell(0);
		cell.setCellValue(jpa.getUser().getFirstName());

		cell = row.createCell(1);
		cell.setCellValue(jpa.getUser().getEmail());

		cell = row.createCell(2);
		cell.setCellValue(jpa.getJobs().getJobCode());

		cell = row.createCell(3);
		cell.setCellValue(jpa.getJobs().getJobLocation());

		cell = row.createCell(4);
		cell.setCellValue(jpa.getApplicationStatus());

		String dateString = null;
		SimpleDateFormat sdfr = new SimpleDateFormat("YYYY-MM-dd");
		dateString = sdfr.format(jpa.getApplicationDate());

		cell = row.createCell(5);
		cell.setCellValue(dateString);
	}

	public void writeUsers(List<User> userList, String excelFilePath) throws IOException {
		try {
			Workbook workbook = new XSSFWorkbook();
			org.apache.poi.xssf.usermodel.XSSFSheet sheet = (org.apache.poi.xssf.usermodel.XSSFSheet) workbook
					.createSheet();
			int rowCount = 1;
			Row headerRow = sheet.createRow(0);
			XSSFFont font = (XSSFFont) workbook.createFont();
			font.setColor(new XSSFColor(new java.awt.Color(255, 255, 255)));
			font.setBold(true);

			XSSFCellStyle style = (XSSFCellStyle) workbook.createCellStyle();
			style.setFillForegroundColor(new XSSFColor(new java.awt.Color(44, 62, 80)));
			style.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
			style.setFont(font);

			sheet.setColumnWidth(0, 5000);
			sheet.setColumnWidth(1, 5000);
			sheet.setColumnWidth(2, 9000);
			sheet.setColumnWidth(3, 5000);
			sheet.setColumnWidth(4, 9000);

			XSSFCell cell = (XSSFCell) headerRow.createCell(0);
			cell.setCellValue("First Name");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(1);
			cell.setCellValue("Last Name");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(2);
			cell.setCellValue("Email");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(3);
			cell.setCellValue("Role");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(4);
			cell.setCellValue("Application Submitted");
			cell.setCellStyle(style);

			for (User user : userList) {
				Row row = sheet.createRow(rowCount);
				writeUserRows(user, row);
				rowCount++;
			}

			FileOutputStream outputStream = new FileOutputStream(excelFilePath);
			workbook.write(outputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void writeUserRows(User user, Row row) {
		Cell cell = row.createCell(0);
		cell.setCellValue(user.getFirstName());

		cell = row.createCell(1);
		cell.setCellValue(user.getLastName());

		cell = row.createCell(2);
		cell.setCellValue(user.getEmail());

		cell = row.createCell(3);
		cell.setCellValue(user.getRole().getRole());

		cell = row.createCell(4);
		cell.setCellValue(user.getJobApplications().size());

	}

	public void writeMsgs(List<ContactMessage> msgList, String excelFilePath) throws IOException {
		try {
			Workbook workbook = new XSSFWorkbook();
			org.apache.poi.xssf.usermodel.XSSFSheet sheet = (org.apache.poi.xssf.usermodel.XSSFSheet) workbook
					.createSheet();
			int rowCount = 1;
			Row headerRow = sheet.createRow(0);
			XSSFFont font = (XSSFFont) workbook.createFont();
			font.setColor(new XSSFColor(new java.awt.Color(255, 255, 255)));
			font.setBold(true);

			XSSFCellStyle style = (XSSFCellStyle) workbook.createCellStyle();
			style.setFillForegroundColor(new XSSFColor(new java.awt.Color(44, 62, 80)));
			style.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
			style.setFont(font);

			sheet.setColumnWidth(0, 5000);
			sheet.setColumnWidth(1, 5000);
			sheet.setColumnWidth(2, 5000);
			sheet.setColumnWidth(3, 5000);
			sheet.setColumnWidth(4, 5000);
			sheet.setColumnWidth(5, 5000);
			sheet.setColumnWidth(6, 5000);

			XSSFCell cell = (XSSFCell) headerRow.createCell(0);
			cell.setCellValue("Name");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(1);
			cell.setCellValue("Comapny");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(2);
			cell.setCellValue("Email");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(3);
			cell.setCellValue("Mobile");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(4);
			cell.setCellValue("City");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(5);
			cell.setCellValue("State");
			cell.setCellStyle(style);

			cell = (XSSFCell) headerRow.createCell(6);
			cell.setCellValue("Date");
			cell.setCellStyle(style);

			for (ContactMessage msg : msgList) {
				Row row = sheet.createRow(rowCount);
				writeMsgRows(msg, row);
				rowCount++;
			}

			FileOutputStream outputStream = new FileOutputStream(excelFilePath);
			workbook.write(outputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void writeMsgRows(ContactMessage msg, Row row) {
		Cell cell = row.createCell(0);
		cell.setCellValue(msg.getFirstName() + " " + msg.getLastName());

		cell = row.createCell(1);
		cell.setCellValue(msg.getCompany());

		cell = row.createCell(2);
		cell.setCellValue(msg.getEmail());

		cell = row.createCell(3);
		cell.setCellValue(msg.getMobile());

		cell = row.createCell(4);
		cell.setCellValue(msg.getCity());

		cell = row.createCell(5);
		cell.setCellValue(msg.getState());

		String dateString = null;
		SimpleDateFormat sdfr = new SimpleDateFormat("YYYY-MM-dd");
		dateString = sdfr.format(msg.getSubmittedDate());

		cell = row.createCell(6);
		cell.setCellValue(dateString);

	}

	private Object getCellValue(Cell cell) {
		switch (cell.getCellType()) {
		case Cell.CELL_TYPE_STRING:
			return cell.getStringCellValue();

		case Cell.CELL_TYPE_BOOLEAN:
			return cell.getBooleanCellValue();

		case Cell.CELL_TYPE_NUMERIC:
			return cell.getNumericCellValue();
		}

		return null;
	}

	public List<Jobs> readBooksFromExcelFile(String excelFilePath) throws IOException {
		List<Jobs> listBooks = new ArrayList<Jobs>();
		FileInputStream inputStream = new FileInputStream(new File(excelFilePath));

		Workbook workbook = new XSSFWorkbook(inputStream);
		org.apache.poi.xssf.usermodel.XSSFSheet firstSheet = (org.apache.poi.xssf.usermodel.XSSFSheet) workbook
				.getSheetAt(0);
		Iterator<Row> iterator = firstSheet.iterator();

		while (iterator.hasNext()) {
			Row nextRow = iterator.next();
			Iterator<Cell> cellIterator = nextRow.cellIterator();
			Jobs job = new Jobs();

			while (cellIterator.hasNext()) {
				Cell nextCell = cellIterator.next();
				int columnIndex = nextCell.getColumnIndex();
				nextCell.setCellType(Cell.CELL_TYPE_STRING);
				switch (columnIndex) {
				case 1:
					job.setJobCategory(getCellValue(nextCell).toString());
					break;
				case 2:
					job.setJobCode(getCellValue(nextCell).toString());
					break;
				case 3:
					job.setJobTitle((String) getCellValue(nextCell));
					break;
				case 4:
					job.setJobLocation((String) getCellValue(nextCell));
					break;
				case 5:
					job.setJobType((String) getCellValue(nextCell));
					break;
				case 6:
					job.setHours((String) getCellValue(nextCell));
					break;
				case 7:
					job.setRate((String) getCellValue(nextCell));
					break;
				case 8:
					job.setJobRequirements((String) getCellValue(nextCell));
					break;
				case 9:
					job.setJobDescription((String) getCellValue(nextCell));
					break;
				}
				job.setJobStatus("OPEN");
				job.setActive("true");
			}
			listBooks.add(job);
		}

		workbook.close();
		inputStream.close();

		return listBooks;
	}
}
