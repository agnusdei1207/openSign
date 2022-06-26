package com.open.cmmn.web.hwp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

class Hnc2String {
	static Logger log = LoggerFactory.getLogger(Hnc2String.class);
	static final String[] map = new String[65536]; // max : 0xFFFF

	static {
		Pattern P = Pattern
				.compile("0x([0-9a-f]{4})\\s*=>\\s*\\[" + "0x([0-9a-f]{4})"
						+ "(?:,\\s*0x([0-9a-f]{4}))?"
						+ "(?:,\\s*0x([0-9a-f]{4}))?" + "\\]",
						Pattern.CASE_INSENSITIVE);

		InputStream resource = Hnc2String.class.getClassLoader()
				.getResourceAsStream("hnc2unicode.rb");
		int lineNumber = 0;
		char[] chars = new char[3];

		try {
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					resource, "UTF-8"));

			for (;;) {
				String line = reader.readLine();
				if (line == null)
					break;

				lineNumber++;
				line = line.trim();
				if (line.length() == 0)
					continue;
				if (line.startsWith("#"))
					continue;

				Matcher matcher = P.matcher(line);
				if (matcher.find()) {
					int code = Integer.parseInt(matcher.group(1), 16);
					int len;

					for (len = 1; len < matcher.groupCount(); len++) {
						String hex = matcher.group(len + 1);
						if (hex == null)
							break;

						chars[len - 1] = (char) Integer.parseInt(hex, 16);
					}

					map[code] = new String(chars, 0, len - 1);
				} else {
					System.out.println("[" + lineNumber + "]>>>" + line);
				}
			}
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		} catch (IOException e) {
			throw new RuntimeException(e);
		} finally {
			try {
				resource.close();
			} catch (IOException e) {
				// ignore ?
			}
		}
	}

	static String convert(int c) {
		assert c >= 0 && c < 0xFFFF;

		return map[c];
	}
}