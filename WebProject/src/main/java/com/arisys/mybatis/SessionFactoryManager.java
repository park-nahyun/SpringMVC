package com.arisys.mybatis;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;

public class SessionFactoryManager {

    private static SqlSessionFactory factory;

    public static SqlSessionFactory getSqlSessionFactory() {
        InputStream is = null;
        InputStream decryptedInputStream = null;
        try {
            String resource = "mybatis-config.xml";
            is = SessionFactoryManager.class.getResourceAsStream("/" + resource); // 설정 파일
            SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder(); // 설정 파일을 읽기 위한 객체
            // System.out.println("readInputStream : " + readInputStream(is));
            // is.reset();
            decryptedInputStream = getDecryptedConfig(is);
            factory = builder.build(decryptedInputStream);

        } catch (Exception e) {
            System.out.println("IOException : " + e);
        }
        return factory;
    }

    public static InputStream getDecryptedConfig(InputStream inputStream) {
        InputStream dis = null;
        try {
            String content = readInputStream(inputStream);
            System.out.println("content : " + content);
            dis = new ByteArrayInputStream(content.getBytes());
            dis.reset();
            return dis;
        }
        catch (Exception e) {
            System.out.println("Exception : " + e);
        }
        return dis;
    }

    // InputStream을 문자열로 변환하는 메서드
    private static String readInputStream(InputStream inputStream) throws IOException {
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
            StringBuilder stringBuilder = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                stringBuilder.append(line);
            }
            return stringBuilder.toString();
        } catch (Exception e) {
            System.out.println("readInputStream");
            e.printStackTrace();
            return null;
        }
    }

}
