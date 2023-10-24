/*
 * 작성자: 장보늬
 * 작성날짜: 2023-10-16
 * 내용: 알고리즘문제에서 코드실행 후 도출되는 결과 조회한다.
 */

package com.ktdsuniversity.edu.coderuntime;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.ktdsuniversity.edu.util.XssIgnoreUtil;

@Component
@Scope("prototype")
public class CodeRuntime {

	@Value("${app.multipart.base-dir:C:/uploadFiles}")
	private String baseDir = "C:/uploadFiles";

	private StringBuffer code;
	
	private String fileName;
	private File javaFile;
	
	private File runFile;
	public static StringBuffer runFileCode;
	
	static {
		runFileCode = new StringBuffer();
		runFileCode.append("public class Run {\n");
		runFileCode.append("");
		runFileCode.append("    public static void main(String[] args) {");
		runFileCode.append("        #codeHear#");
		runFileCode.append("    }");
		runFileCode.append("");
		runFileCode.append("}");
	}
	
	public void setCode(String code) {
		this.code = new StringBuffer();
		
		String[] codeLine = code.split("\n");
		for (String line: codeLine) {
			this.code.append(line.replace("\r", "") + "\n");
		}
		
		fileName = code.substring(code.indexOf("class") + 5, code.indexOf("{"));
		fileName = fileName.trim() + ".java";
		setFileName(fileName);
	}
	
	public void setFileName(String fileName) {
		this.baseDir += "\\" + UUID.randomUUID().toString();
		this.fileName = fileName;

		javaFile = new File(baseDir, this.fileName);
		if (!javaFile.getParentFile().exists()) {
			javaFile.getParentFile().mkdirs();
		}
		
		runFile = new File(baseDir, "Run.java");
		if (!runFile.getParentFile().exists()) {
			runFile.getParentFile().mkdirs();
		}
	}

	public void makeFile() {
		String code = this.code.toString();
		code = XssIgnoreUtil.ignoreText(code);
		code = Jsoup.parse(code).text();
		makeFile(code);
//		makeFile(CodeRuntime.runFileCode.toString());
	}
	
	public void makeRunFile(String testCode) {
		String code = CodeRuntime.runFileCode.toString();
		if (testCode != null) {
			code = code.replace("#codeHear#", testCode);
		}
		
		BufferedWriter bw = null;
		try {
			bw = new BufferedWriter(new FileWriter(runFile));
			bw.write(code);
			bw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (bw != null) {
				try {
					bw.close();
				} catch (IOException e) {
				}
			}
		}
	}
	
	public void makeFile(String code) {
		BufferedWriter bw = null;
		try {
			bw = new BufferedWriter(new FileWriter(javaFile));
			bw.write(code);
			bw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (bw != null) {
				try {
					bw.close();
				} catch (IOException e) {
				}
			}
		}
	}
	
	public void doCompileJava() {
		doCompile(this.javaFile);
	}
	
	public void doCompileRun() {
		doCompile(this.runFile);
	}
	
	private synchronized void doCompile(File file) {
		ProcessBuilder pb = new ProcessBuilder("cmd", "/c", "javac -cp " + file.getParentFile().getAbsolutePath() + " " + file.getAbsolutePath());
		Process process = null;
		try {
			process = pb.start();
		} catch (IOException e) {
			e.printStackTrace();
			return;
		}
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
		StringBuffer buffer = new StringBuffer();
		String line = null;
		try {
			
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
				buffer.append(System.getProperty("line.separator"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {}
			}
		}
	}

	public List<String> run(String ... params) {
		String classFile = this.runFile.getAbsolutePath();
//		classFile = classFile.replace(".java", "");
		String command = "java -cp " + this.runFile.getParentFile().getAbsolutePath() + " " + classFile;
		
		if (params != null) {
			for (String args: params) {
				command += " " + args;
			}
		}
		
		ProcessBuilder pb = new ProcessBuilder("cmd", "/c", command);
		Process process = null;
		try {
			process = pb.start();
		} catch (IOException e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
		List<String> runResult = new ArrayList<>();
		String line = null;
		try {
			while ((line = reader.readLine()) != null) {
				if (line.trim().length() > 0) {
					runResult.add(line);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {}
			}
		}
		return runResult;
	}

}
