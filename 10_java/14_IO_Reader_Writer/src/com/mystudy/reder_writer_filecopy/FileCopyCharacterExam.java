package com.mystudy.reder_writer_filecopy;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileCopyCharacterExam {

	public static void main(String[] args) {
		// (실습) FileReader, FileWriter 사용해서 파일 복사
		// 원본파일 : file/test_char.txt
		// 대상파일 : file/test_char.copy.txt
		// 처리 : 원본 파일을 읽어서 대상 파일에 쓰기/ 저장(문자단위 처리)
		// ------------------------------------------

		// 0. 사용할 파일객체 생성
		File fileIn = new File("file/test_char.txt");
		File fileOut = new File("file/test_char_copy.txt");

		// 1. 파일로부터 읽어들이고, 쓸 객체를 저장할 변수 선언

		FileReader fr = null;
		FileWriter fw = null;

		// 2. 읽기 위한 객체 생성, 쓰기 위한 객체 생성
		try {

			fr = new FileReader(fileIn);
			fw = new FileWriter(fileOut);

			int readValue = fr.read(); // 읽고
			while (readValue != -1) {

				System.out.print((char) readValue); // 화면(콘솔)에 출력
				fw.write(readValue);
				readValue = fr.read();

			}

		} catch (IOException e) {
			e.printStackTrace();

		} finally {
			// 4. 사용객체 close
			if (fw != null) {
				try {
					fw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			if (fr != null) {
				try {
					fr.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

	}

}
