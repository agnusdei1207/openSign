package com.open.cmmn.web.hwp;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Writer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public abstract class HwpTextExtractor {
	protected static Logger log = LoggerFactory.getLogger(HwpTextExtractor.class);

	public static boolean extract(File source, Writer writer)
			throws FileNotFoundException, IOException {
		if (source == null || writer == null)
			throw new IllegalArgumentException();
		if (!source.exists())
			throw new FileNotFoundException();

		// 먼저 V5 부터 시도
		boolean success = HwpTextExtractorV5.extractText(source, writer);

		// 아니라면 V3 시도
		if (!success)
			success = HwpTextExtractorV3.extractText(source, writer);

		return success;
	}
}