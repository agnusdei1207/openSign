package com.open.cmmn.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class CableUtil {

	public static void cableTest() {
		
		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		
		try{
	    	
	    	fis = new FileInputStream("D:\\PROJECT_OPENNOTE\\workspace\\defaultproject\\src\\main\\webapp\\excel\\realtest.xlsx");
	    	workbook = new XSSFWorkbook(fis);
	    	FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();	
	    	DataFormatter formatter = new DataFormatter();
	    	XSSFSheet curSheet;
	    	XSSFRow	curRow;
	    	XSSFCell curCell;
    		// 현재 sheet 반환 (첫번째시트 : 0)
    		curSheet = workbook.getSheetAt(2);
    		
    		// row 길이
    		int rowLength = curSheet.getPhysicalNumberOfRows();

    		// row(세로데이터) 탐색 for문 (row 0은 헤더정보이기 때문에 1부터 시작)
    		for(int rowIndex=1; rowIndex < rowLength; rowIndex++){
			
				// 현재 row 반환
				curRow = curSheet.getRow(rowIndex);
				String value;
				
				// cell 길이
				int cellLength = curRow.getPhysicalNumberOfCells();
				
				// cell(가로데이터) 탐색 for문
				for(int cellIndex = 0; cellIndex <= cellLength; cellIndex++){
					curCell = curRow.getCell(cellIndex);
					// cell 스타일이 다르더라도 String으로 변환 받음
					if(curCell != null){
						switch (curCell.getCellType()){
						case HSSFCell.CELL_TYPE_FORMULA :
							value = curCell.getCellFormula();
							break;
						case HSSFCell.CELL_TYPE_NUMERIC :
							value = (int)curCell.getNumericCellValue()+"";
							break;
						case HSSFCell.CELL_TYPE_STRING :
							value = curCell.getStringCellValue()+"";
							break;
						case HSSFCell.CELL_TYPE_BLANK :
							value = curCell.getBooleanCellValue()+"";
							value = "";
							break;
						case HSSFCell.CELL_TYPE_ERROR :
							value = curCell.getErrorCellValue()+"";
							break;
						default :
							value = new String();
							break;
						}
					}else{
						value = "";
					}
				}
				System.out.println("셀데이터(연산) : "+formatter.formatCellValue(curRow.getCell(3), evaluator));
    		}
	    	
	    }catch(FileNotFoundException e){
	    	e.printStackTrace();
	    }catch(IOException e){
	    	e.printStackTrace();
	    }finally{
	    	try{
	    		if(workbook != null) {
	    			workbook = null;
	    		}
	    		if(fis != null){
	    			fis.close();
	    		}
	    	}catch(IOException e){
	    		e.printStackTrace();
	    	}
	    }
		
	}
}
