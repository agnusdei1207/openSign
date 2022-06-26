package com.open.cmmn.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * <pre>
 * Class Name : PoiExcelUtil.java
 * Description: POI Excel Util.
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2016. 11. 20.	 User		최초생성
 *
 * </pre>
 *
 * @author User
 * @since 2016. 11. 20.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
public final class PoiExcelUtil {
	/**
	 * Log4j Logger.
	 */
	private static final Logger LOGGER = LogManager.getLogger(PoiExcelUtil.class.getName());

	/**
	 * Constructor of PoiExcelUtil.java class.
	 */
	private PoiExcelUtil() {
		// Throw an exception if this ever *is* called
		throw new AssertionError("Instantiating utility class");
	}

	/**
	 * TITLE_FONT_SIZE.
	 */
	private static final int TITLE_FONT_SIZE = 24;

	/**
	 * Amplifying the SXSSF Width.
	 */
	private static final int COLUMN_WIDTH_AMP = 384;
	/**
	 * Adjusting the SXSSF Width.
	 */
	private static final int COLUMN_WIDTH_ADJ = 512;
	/**
	 * Default SXSSF Width.
	 */
	private static final int COLUMN_WIDTH_DFT = 16;

	/**
	 * <pre>
	 * Description : 엑셀 다운로드 구현.
	 * </pre>
	 *
	 * @param response HttpServletResponse
	 * @param excelFileNm 엑셀 파일 이름
	 * @param title 제목
	 * @param resultList 데이터
	 */
	public static void exportExcel(final HttpServletResponse response, final String excelFileNm, final String title,
			final List<LinkedHashMap<String, Object>> resultList) {

		SXSSFWorkbook workbook = null;
		OutputStream responseOut = null;

		long startTime = System.currentTimeMillis();
		try {
			response.reset();
			response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
			response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode(excelFileNm, "UTF-8").replace("+", "%20")
					+ ".xlsx");

			workbook = new SXSSFWorkbook();

			SXSSFSheet sheet = workbook.createSheet();

			CellStyle titleStyle = createTitleStyle(workbook);
			CellStyle headerStyle = createHeaderStyle(workbook);
			CellStyle dataStyle = createCommonStyle(workbook);

			// Create title cell.(idxRow = 0)
			int idxRow = 0;
			Row row = sheet.createRow(idxRow++);
			createCell(row, 0, title, titleStyle);
			sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, resultList.get(0).keySet().size() - 1));

			// For setting column width.
			int[] cellWidth = new int[resultList.get(0).keySet().size()];

			// Create header cell.(idxRow = 1)
			int idxColumn = 0;
			row = sheet.createRow(idxRow++);
			for (String key : resultList.get(0).keySet()) {
				if (cellWidth[idxColumn] < key.length()) {
					cellWidth[idxColumn] = key.length();
				}
				createCell(row, idxColumn++, key, headerStyle);
			}

			// Create data cell.(idxRow =< 2)
			for (LinkedHashMap<String, Object> rowData : resultList) {
				idxColumn = 0;
				row = sheet.createRow(idxRow++);
				for (String key : rowData.keySet()) {

					// null값을 제외하고 가져오던 현상 처리는 sql-map-config.xml에서 <setting name="callSettersOnNulls" value="true"/>을 추가하여 해결
					if (null != rowData.get(key)) {
						if (cellWidth[idxColumn] < rowData.get(key).toString().length()) {
							cellWidth[idxColumn] = rowData.get(key).toString().length();
						}
						createCell(row, idxColumn++, rowData.get(key), dataStyle);
						//LOGGER.debug("rowData.get(" + key + "):::::[" + rowData.get(key) + "]");
					} else {
						createCell(row, idxColumn++, "", dataStyle);
						//LOGGER.debug("rowData.get(" + key + "):::::null:::::[" + rowData.get(key) + "]");
					}

					//LOGGER.debug("rowData.get(" + key + "):::::[" + rowData.get(key) + "]");
				}
			}
			idxColumn = 0;
			for (int cell : cellWidth) {
				if (0 == cell) {
					sheet.setColumnWidth(idxColumn++, (COLUMN_WIDTH_DFT * COLUMN_WIDTH_AMP) + COLUMN_WIDTH_ADJ);
				} else {
					sheet.setColumnWidth(idxColumn++, (cell * COLUMN_WIDTH_AMP) + COLUMN_WIDTH_ADJ);
				}

			}

			responseOut = response.getOutputStream();
			workbook.write(responseOut);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (responseOut != null) {
				try {
					responseOut.close();
				} catch (IOException ex) {
				}
			}
			if (workbook != null) {
				try {
					workbook.close();
				} catch (IOException ex) {
				}
			}
		}
		LOGGER.debug("Excel Download Elapsed Time : " + (System.currentTimeMillis() - startTime) + "ms");
	}

	/**
	 * <pre>
	 * Description : 제목 셀 양식.
	 * </pre>
	 *
	 * @param workbook Workbook
	 * @return CellStyle
	 */
	private static CellStyle createTitleStyle(final Workbook workbook) {
		CellStyle style = workbook.createCellStyle();
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setBorderTop(BorderStyle.THIN);
		style.setBorderLeft(BorderStyle.THIN);
		style.setBorderRight(BorderStyle.THIN);
		style.setBorderBottom(BorderStyle.THIN);
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setFillForegroundColor(HSSFColor.WHITE.index);
		style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		Font font = workbook.createFont();
		font.setBold(true);
		font.setFontHeightInPoints((short) TITLE_FONT_SIZE);
		style.setFont(font);
		return style;
	}

	/**
	 * <pre>
	 * Description : 헤더 셀 양식.
	 * </pre>
	 *
	 * @param workbook Workbook
	 * @return CellStyle
	 */
	private static CellStyle createHeaderStyle(final Workbook workbook) {
		CellStyle style = workbook.createCellStyle();
		style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
		style.setFillBackgroundColor(HSSFColor.GREY_40_PERCENT.index); // 셀 색상
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setBorderTop(BorderStyle.THIN); //테두리 설정
		style.setBorderLeft(BorderStyle.THIN);
		style.setBorderRight(BorderStyle.THIN);
		style.setBorderBottom(BorderStyle.THIN);
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		return style;
	}

	/**
	 * <pre>
	 * Description : 일반적인 셀 양식.
	 * </pre>
	 *
	 * @param workbook Workbook
	 * @return CellStyle
	 */
	private static CellStyle createCommonStyle(final Workbook workbook) {
		CellStyle style = workbook.createCellStyle();
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setBorderTop(BorderStyle.THIN);
		style.setBorderLeft(BorderStyle.THIN);
		style.setBorderRight(BorderStyle.THIN);
		style.setBorderBottom(BorderStyle.THIN);
		style.setWrapText(true);
		return style;
	}

	/**
	 * <pre>
	 * Description : 셀에 문자열 값 설정.
	 * </pre>
	 *
	 * @param row 행
	 * @param inx 열
	 * @param value 문자열값
	 * @param style 셀 스타일
	 */
	private static void createCell(final Row row, final int inx, final Object value, final CellStyle style) {
		Cell cell = row.createCell(inx);
		cell.setCellValue(StringUtils.defaultString(value.toString()));
		cell.setCellStyle(style);

	}

	@SuppressWarnings({ "resource", "unused" })
	public static ArrayList<ArrayList<Map<String, Object>>> getXlsxData(final String filePath) throws Exception {

		ArrayList<ArrayList<Map<String, Object>>> paramMap = new ArrayList<ArrayList<Map<String, Object>>>();
		ArrayList<Map<String, Object>> paramList = null;
		NumberFormat nf = NumberFormat.getInstance();

		//소수점 아래 최소 자리수
		nf.setMinimumFractionDigits(0);
		//소수점 아래 최대자리수
		nf.setMaximumFractionDigits(0);

		XSSFWorkbook workbook = null;
		XSSFSheet sheet = null;
		XSSFRow row = null;
		XSSFCell cell = null;

		LOGGER.debug(filePath);
		FileInputStream excelFile = new FileInputStream(filePath);
		File isExcelFile = new File(filePath);

		//파일이 존재하지 않을경우 EXCEPTION

		if (!isExcelFile.isFile()) {
			excelFile.close();
			throw new Exception("notFile");
		}

		workbook = new XSSFWorkbook(excelFile);
		FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator(); // 수식 계산 시 필요!!!!!!

		//workBook 이 존재하지 않을경우 EXCEPTION
		if (workbook == null) {
			throw new Exception("workbookIsNull");
		}

		for (int sheetNum = 0; sheetNum < workbook.getNumberOfSheets(); sheetNum++) {
			sheet = workbook.getSheetAt(sheetNum); //멀티 시트에 순서대로 시트에 입힌다.

			if (sheet == null) {
				continue; //시트가 존재하지 않을경우 continue
			}

			int nRowStartIndex = 0; //기록물철의 경우 실제 데이터가 시작되는 Row지정
			String sheetNm = sheet.getSheetName();
			int nRowEndIndex = sheet.getLastRowNum(); //기록물철의 경우 실제 데이터가 끝 Row지정
			int nColumnStartIndex = 0; //기록물철의 경우 실제 데이터가 시작되는 Column지정
			String szValue = ""; //시트에 값이 들어갈 부분.

			if (nRowEndIndex > 0) {

				paramList = new ArrayList<Map<String, Object>>();
				for (int i = nRowStartIndex; i <= nRowEndIndex; i++) {
					int nColumnEndIndex = 0; //기록물철의 경우 실제 데이터가 끝나는 Column지정

					if (nColumnEndIndex == sheet.getRow(0).getLastCellNum()) {
						nColumnEndIndex = sheet.getRow(i).getLastCellNum();
					} else {
						nColumnEndIndex = sheet.getRow(0).getLastCellNum();
					}

					row = sheet.getRow(i);
					String[] colData = new String[nColumnEndIndex];

					for (int nColumn = nColumnStartIndex; nColumn < nColumnEndIndex; nColumn++) {
						cell = row.getCell((short) nColumn);
						if (cell == null) {
							colData[nColumn] = "";
							continue;
						}

						switch (cell.getCellType()) {
							case XSSFCell.CELL_TYPE_NUMERIC: //0  number type
								szValue = String.valueOf(nf.format(Math.round(cell.getNumericCellValue())));
								break;
							case XSSFCell.CELL_TYPE_STRING: //1   string type
								szValue = cell.getStringCellValue();
								break;
							case XSSFCell.CELL_TYPE_FORMULA: //2
								if (!"".equals(cell.toString())) {
									if (evaluator.evaluateFormulaCell(cell) == 0) {
										double fddata = cell.getNumericCellValue();
										szValue = String.valueOf(nf.format(fddata));
									} else if (evaluator.evaluateFormulaCell(cell) == 1) {
										szValue = cell.getStringCellValue();
									} else if (evaluator.evaluateFormulaCell(cell) == 4) {
										boolean fbdata = cell.getBooleanCellValue();
										szValue = String.valueOf(fbdata);
									}
								}
								break;
							case XSSFCell.CELL_TYPE_BOOLEAN: //4
								cell.getBooleanCellValue();
								break;
							default:
								szValue = "";
								break;
						}
						colData[nColumn] = szValue;
					}

					Map<String, Object> map = new HashMap<String, Object>();
					//갯수가져와서 컬럼 만들어준다.

					for (int j = 0; j < colData.length; j++) {
						map.put("colNo" + j, "".equals(colData[j].trim()) ? sheetNm : colData[j]);
					}
					paramList.add(map);
				}
				paramMap.add(paramList);
			}
		}
		workbook.close();
		excelFile.close();
		return paramMap;
	}

	@SuppressWarnings("unused")
	public static ArrayList<ArrayList<Map<String, Object>>> getXlsData(final String filePath) throws Exception {

		ArrayList<ArrayList<Map<String, Object>>> paramMap = new ArrayList<ArrayList<Map<String, Object>>>();
		ArrayList<Map<String, Object>> paramList = null;
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumFractionDigits(0);//소수점 아래 최소 자리수
		nf.setMaximumFractionDigits(0);//소수점 아래 최대자리수

		HSSFWorkbook workBook = null; // xls 버전
		HSSFSheet sheet = null;
		HSSFRow row = null;
		HSSFCell cell = null;

		File isExcelFile = new File(filePath);
		if (!isExcelFile.isFile()) {
			throw new Exception("notFile");//파일이 존재하지 않을경우 EXCEPTION
		}

		FileInputStream excelFile = new FileInputStream(filePath);
		workBook = new HSSFWorkbook(excelFile); // xls 버전
		if (workBook == null) {
			throw new Exception("workbookIsNull");//workBook 이 존재하지 않을경우 EXCEPTION
		}

		FormulaEvaluator evaluator = workBook.getCreationHelper().createFormulaEvaluator(); // 수식 계산 시 필요!!!!!!

		for (int sheetNum = 0; sheetNum < workBook.getNumberOfSheets(); sheetNum++) {
			String szValue = "";
			sheet = workBook.getSheetAt(sheetNum);
			String sheetNm = sheet.getSheetName();
			paramList = new ArrayList<Map<String, Object>>();

			int rows = sheet.getPhysicalNumberOfRows();
			for (int r = 0; r <= rows; r++) {// 생성된 시트를 이용하여 그 행의 수만큼 돌면서 행을 하나씩 생성합니다.
				row = sheet.getRow(r);
				if (row != null) {
					int cells = row.getLastCellNum();

					if (cells == sheet.getRow(0).getLastCellNum()) {
						cells = row.getLastCellNum();
					} else {
						cells = sheet.getRow(0).getLastCellNum();
					}
					String[] colData = new String[cells];
					for (int c = 0; c < cells; c++) {
						cell = row.getCell(c);
						if (cell != null) {
							switch (cell.getCellType()) { // 셀타입에 따라 출력 메소드 다름.
								case 0:
									szValue = String.valueOf(nf.format(Math.round(cell.getNumericCellValue())));
									break;
								case 1:
									szValue = cell.getStringCellValue();
									break;
								case Cell.CELL_TYPE_FORMULA:
									if (!"".equals(cell.toString())) {
										if (evaluator != null) {
											if (evaluator.evaluateFormulaCell(cell) == 0) {
												double fddata = cell.getNumericCellValue();
												szValue = String.valueOf(nf.format(fddata));
											} else if (evaluator.evaluateFormulaCell(cell) == 1) {
												szValue = cell.getStringCellValue();
											} else if (evaluator.evaluateFormulaCell(cell) == 4) {
												boolean fbdata = cell.getBooleanCellValue();
												szValue = String.valueOf(fbdata);
											}
										} else {
											szValue = "";
										}
									}
									break;
								default:
									szValue = "";
									break;
							}
						} else {
							szValue = "";
						}
						colData[c] = szValue;
					}
					Map<String, Object> map = new HashMap<String, Object>(); //갯수가져와서 컬럼 만들어준다.
					for (int j = 0; j < colData.length; j++) {
						map.put("colNo" + j, "".equals(colData[j].trim()) ? sheetNm : colData[j]);
					}
					paramList.add(map);
				}
			}
			paramMap.add(paramList);
		}
		excelFile.close();
		return paramMap;
	}

}
