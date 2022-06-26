package com.open.cmmn.util;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;

import org.apache.pdfbox.cos.COSDocument;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.poi.hslf.extractor.PowerPointExtractor;
import org.apache.poi.hssf.extractor.ExcelExtractor;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.xslf.extractor.XSLFPowerPointExtractor;
import org.apache.poi.xssf.extractor.XSSFExcelExtractor;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;

import com.open.cmmn.web.hwp.HwpTextExtractor;

public class FileReadUtil {
	
	/**
	 * 파일 읽어서 ArrayList 로 리턴
	 * 
	 * @param file
	 * @param encode
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	public static ArrayList<String> readFile(File file, String encode) throws IOException, Exception {
		if (file == null || !file.exists()) {
			return null;
		}

		ArrayList<String> resultList = null;

		FileInputStream fileInputStream = null;
		InputStreamReader inputStreamReader = null;
		BufferedReader bufferedReader = null;

		try {
			fileInputStream = new FileInputStream(file);
			inputStreamReader = new InputStreamReader(fileInputStream, encode);
			bufferedReader = new BufferedReader(inputStreamReader);

			String oneLine = null;
			while ((oneLine = bufferedReader.readLine()) != null) {
				if (resultList == null) {
					resultList = new ArrayList<String>();
				}

				resultList.add(oneLine);
			}

		} catch (IOException e) {
			throw e;

		} catch (Exception e) {
			throw e;

		} finally {
			try {
				if (bufferedReader != null) {
					bufferedReader.close();
				}
			} catch (Exception e) {
				bufferedReader = null;
			}

			try {
				if (inputStreamReader != null) {
					inputStreamReader.close();
				}
			} catch (Exception e) {
				inputStreamReader = null;
			}

			try {
				if (fileInputStream != null) {
					fileInputStream.close();
				}
			} catch (Exception e) {
				fileInputStream = null;
			}
		}

		return resultList;
	}
	
	
	/**
	 * 파일 읽어서 String 으로 리턴
	 * 
	 * @param file
	 * @param encode
	 * @param delimiter
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	public static String readFileToString(File file, String encode, String delimiter) throws IOException, Exception {
		StringBuffer buff = new StringBuffer();
		
		ArrayList<String> strList = readFile(file, encode);
		if (strList != null && strList.size() > 0) {
			int listCount = strList.size();
			for (int i=0; i<listCount; i++) {
				buff.append(strList.get(i));
				buff.append(delimiter);
			}
		}
		
		return buff.toString();
	}
	
	
	/**
	 * fileList 객체에 텍스트 파일을 담는다.
	 * fileObj 객체가 폴더일 경우 하위의 모든 텍스트 파일을 담는다.
	 * 
	 * @param fileList
	 * @param file
	 * @throws Exception
	 */
	public static void addAllTextFiles(ArrayList<String> fileList, File fileObj) throws Exception {
		if (fileList == null) {
			return;
		}
		
		if (fileObj == null) {
			return;
		}
		
		if (!fileObj.exists()) {
			return;
		}
		
		if (fileObj.isDirectory()) {
			File[] fileArr = fileObj.listFiles();
			if (fileArr != null && fileArr.length > 0) {
				int fileCount = fileArr.length;
				for (int i=0; i<fileCount; i++) {
					addAllTextFiles(fileList, fileArr[i]);
				}
			}
			
		} else if (fileObj.isFile()) {
			if(fileObj.getCanonicalPath() != null
				&&(fileObj.getCanonicalPath().toLowerCase().endsWith(".xlsx")
				|| fileObj.getCanonicalPath().toLowerCase().endsWith(".xls")
				|| fileObj.getCanonicalPath().toLowerCase().endsWith(".docx") 
				|| fileObj.getCanonicalPath().toLowerCase().endsWith(".doc") 
				|| fileObj.getCanonicalPath().toLowerCase().endsWith(".pptx")
				|| fileObj.getCanonicalPath().toLowerCase().endsWith(".ppt")
				|| fileObj.getCanonicalPath().toLowerCase().endsWith(".hwp")
				|| fileObj.getCanonicalPath().toLowerCase().endsWith(".pdf"))){
				
				fileList.add(fileObj.getCanonicalPath());
				
				}
			
		}
	}
	
   public static String pdfFileParser(String filePath, String fileExt) throws FileNotFoundException, IOException
    {
        String content;
        FileInputStream fi = new FileInputStream(new File(filePath));
        PDFParser parser = new PDFParser(fi);
        parser.parse();
        COSDocument cd = parser.getDocument();
        PDFTextStripper stripper = new PDFTextStripper();
        content = stripper.getText(new PDDocument(cd));
        cd.close();
        return content;
    }

   public static String docFileContentParser(String filePath, String fileExt) {
	      POIFSFileSystem fs = null;
	      try {
				
	          fs = new POIFSFileSystem(new File(filePath));
	           
	          if(fileExt.equals("doc")) {
	              HWPFDocument doc = new HWPFDocument(fs);
	              WordExtractor we = new WordExtractor(doc); 
	              return we.getText();
	          }else if(fileExt.equals("xls")) {
//	              HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(fileName));
	              ExcelExtractor ex = new ExcelExtractor(fs);
	              ex.setFormulasNotResults(true);
	              ex.setIncludeSheetNames(true);
	              return ex.getText();
	          } else if (fileExt.equals("ppt")) {
	              PowerPointExtractor extractor = new PowerPointExtractor(fs);
	              return extractor.getText();
	          }
	 
	      } catch (Exception e) {
	          System.out.println("document file cant be indexed");
	      }
	      return "";
	  }
   
   public static String docxFileContentParser(String filePath, String fileExt){
	   
       try{
    	   
           FileInputStream fs = new FileInputStream(new File(filePath));
           OPCPackage d = OPCPackage.open(fs);                                                                                                                          
           if(fileExt.equals("docx")){
               XWPFWordExtractor xw = new XWPFWordExtractor(d);
               return xw.getText();
           }else if(fileExt.equals("pptx")){
               XSLFPowerPointExtractor xp = new XSLFPowerPointExtractor(d);
               return xp.getText();
           }else if(fileExt.equals("xlsx")){
               XSSFExcelExtractor xe = new XSSFExcelExtractor(d);
               xe.setFormulasNotResults(true);
               xe.setIncludeSheetNames(true);
               return xe.getText();
           }
       }catch(Exception e){
           System.out.println("# DocxFileParser Error :"+e.getMessage());
       }
       return "";
   }
   
   public static String hwpFileParser(String filePath, String fileExt) throws FileNotFoundException, IOException{
       
       Writer writer = new StringWriter(); // 추출된 텍스트를 출력할 버퍼
       HwpTextExtractor.extract(new File(filePath), writer); // 파일로부터 텍스트 추출
       String text = writer.toString(); // 추출된 텍스트
       
       return text;
   }
}