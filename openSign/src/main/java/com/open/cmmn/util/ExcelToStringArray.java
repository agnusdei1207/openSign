package com.open.cmmn.util;

import java.io.InputStream;
import java.util.ArrayList;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.eventusermodel.XSSFReader;
import org.apache.poi.xssf.model.SharedStringsTable;
import org.apache.poi.xssf.usermodel.XSSFRichTextString;
import org.xml.sax.Attributes;
import org.xml.sax.ContentHandler;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;
import org.xml.sax.helpers.XMLReaderFactory;

/**
 * <pre>
 * Class Name : ExcelToStringArray.java
 * Description: Eventusermodel사용 엑셀 업로드.
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2016. 11. 23.	 User		최초생성
 *
 * </pre>
 *
 * @author User
 * @since 2016. 11. 23.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
public class ExcelToStringArray implements Cloneable {
	/**
	 * Log4j Logger.
	 */
	private static final Logger LOGGER = LogManager.getLogger(ExcelToStringArray.class.getName());

	public static ArrayList<ArrayList<StringBuilder>> stringArrayToReturn = new ArrayList<ArrayList<StringBuilder>>();
	public static ArrayList<StringBuilder> retainedString;
	public static Integer lineCounter = 0;

	public ArrayList<ArrayList<StringBuilder>> GetSheetInStringArray() throws Exception {
		//ExcelToStringArray myParser = new ExcelToStringArray();
		//myParser.processFirstSheet(PathtoFilename);
		return stringArrayToReturn;
	}

	public void processFirstSheet(final InputStream fileStream) throws Exception {
		OPCPackage pkg = OPCPackage.open(fileStream);
		try {
			XSSFReader r = new XSSFReader(pkg);
			SharedStringsTable sst = r.getSharedStringsTable();

			XMLReader parser = XMLReaderFactory.createXMLReader("org.apache.xerces.parsers.SAXParser");
			ContentHandler handler = new SheetHandler(sst);
			parser.setContentHandler(handler);

			InputStream sheet = r.getSheetsData().next();
			InputSource sheetSource = new InputSource(sheet);
			parser.parse(sheetSource);
			sheet.close();
		} finally {
			pkg.close();
		}
	}

	private class SheetHandler extends DefaultHandler {
		private SharedStringsTable sst;
		private String lastContents;
		private boolean nextIsString;

		private SheetHandler(final SharedStringsTable sst) {
			this.sst = sst;
		}

		@Override
		public void startElement(final String uri, final String localName, final String name, final Attributes attributes) throws SAXException {

			if (name.equals("row")) {
				retainedString = new ArrayList<StringBuilder>();

				if (retainedString.isEmpty()) {
					stringArrayToReturn.add(retainedString);
					retainedString.clear();
				}

				LOGGER.debug("New row begins");

				retainedString.add(new StringBuilder(lineCounter.toString()));
				lineCounter++;
			}
			// c => cell
			if (name.equals("c")) {
				// Print the cell reference
				LOGGER.debug(attributes.getValue("r") + " - ");

				// LOGGER.debug(attributes.getValue("r") + " - ");
				// Figure out if the value is an index in the SST
				String cellType = attributes.getValue("t");
				if (cellType != null && cellType.equals("s")) {
					nextIsString = true;
				} else {
					nextIsString = false;
				}
			}
			// Clear contents cache
			lastContents = "";
		}

		@Override
		public void endElement(final String uri, final String localName, final String name) throws SAXException {
			// Process the last contents as required.
			// Do now, as characters() may be called more than once
			if (nextIsString) {
				int idx = Integer.parseInt(lastContents);
				lastContents = new XSSFRichTextString(sst.getEntryAt(idx)).toString();
				nextIsString = false;
			}

			// v => contents of a cell
			// Output after we've seen the string contents
			if (name.equals("v")) {
				LOGGER.debug(lastContents);
				// value of cell what it string or number
				retainedString.add(new StringBuilder(lastContents));
			}
		}

		@Override
		public void characters(final char[] ch, final int start, final int length) throws SAXException {
			lastContents += new String(ch, start, length);
		}
	}

}