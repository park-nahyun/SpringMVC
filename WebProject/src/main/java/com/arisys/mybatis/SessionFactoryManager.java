package com.arisys.mybatis;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;

public class SessionFactoryManager {

    private static SqlSessionFactory factory;

    public static SqlSessionFactory getSqlSessionFactory() {
        if (factory != null) {
            // 페이지가 변경될때마다 설정파일을 불러오는 작업을 하지않기 위해 선언
            return factory;
        }

        InputStream is = null;

        try {
            String resource = "mybatis-config.xml";
            is = Resources.getUrlAsStream(resource); // 설정파일 불러오기

            SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder(); // 설정파일을 읽기 위한 객체

            InputStream decryptedConfig = getDecryptedConfig(is);

            factory = builder.build(decryptedConfig);

        } catch (IOException e) {
            System.out.println("IOException");
        }

        return factory;
    }


    public static InputStream getDecryptedConfig(InputStream inputStream) {

        String content = readInputStream(inputStream);

        System.out.println("content : " + content);

        inputStream = new ByteArrayInputStream(content.getBytes());

        return inputStream;

    }

    // InputStream을 문자열로 변환하는 메서드
    private static String readInputStream(InputStream inputStream) {
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
            StringBuilder stringBuilder = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                stringBuilder.append(line);
            }
            return stringBuilder.toString();
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

}