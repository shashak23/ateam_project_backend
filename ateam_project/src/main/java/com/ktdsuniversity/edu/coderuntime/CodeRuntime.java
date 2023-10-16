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

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class CodeRuntime {

	@Value("${app.multipart.base-dir:C:/uploadFiles}")
	private String baseDir;

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
	
	public CodeRuntime(String code, String fileName) {
		this.baseDir += "\\" + UUID.randomUUID().toString();
		this.code = new StringBuffer();
		
		String[] codeLine = code.split("\n");
		for (String line: codeLine) {
			this.code.append(line.replace("\r", "") + "\n");
		}
		
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
		makeFile(this.code.toString());
//		makeFile(CodeRuntime.runFileCode.toString());
	}
	
	public void makeRunFile(String code, String testCode) {
		
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
		StringBuilder builder = new StringBuilder();
		String line = null;
		try {
			while ((line = reader.readLine()) != null) {
				builder.append(line);
				builder.append(System.getProperty("line.separator"));
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
		String command = this.runFile.getParentFile().getAbsolutePath() + " " + this.runFile.getAbsolutePath();
		
		if (params != null) {
			for (String args: params) {
				command += " " + args;
			}
		}
		
		
		ProcessBuilder pb = new ProcessBuilder("cmd", "/c", "java -cp " + command);
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
				runResult.add(line);
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

	public static void main(String[] args) {
		CodeRuntime cr = new CodeRuntime(
				// 일반회원이 작성한 코드
				"public class A {\n    public void solution(String hello) {\n        System.out.println(hello);}\n}", "A.java");
		cr.makeFile();
		                                                   // #codeHear#
		cr.makeRunFile(CodeRuntime.runFileCode.toString(), "A a = new A(); a.solution(args[0]);");
		cr.doCompileJava();
		cr.doCompileRun();
		                                    // 파라미터
		List<String> processResult = cr.run("2341231", "Hello~~RunJava~~~~");
		System.out.println("결과: " + processResult);
	}

}
