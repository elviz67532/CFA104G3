package core.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;

import javax.sql.DataSource;

public class CommonUtil {
	private static DataSource DATASOURCE;

	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];
		fis.read(buffer);
		fis.close();
		return buffer;
	}
	
	public static String jsonParse(BufferedReader reader) throws IOException {
		String input = null;
        StringBuilder requestBody = new StringBuilder();
        while((input = reader.readLine()) != null) {
            requestBody.append(URLDecoder.decode(input,"UTF-8"));
        }
        return requestBody.toString();
	}
}
