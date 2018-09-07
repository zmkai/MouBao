package com.autism.bean;

public class ZiClass extends FuClass {

	static{
		System.out.println("子类的静态代码块");
	}
	
	public ZiClass() {
		System.out.println("子类的构造方法");
	}
	
	public void print(){
		System.out.println("子类的打印方法");
	}
	
//	public static void main(String[] args) {
//		FuClass ziClass = new ZiClass();
//		ziClass.print();
//	}
	
	public static void main(String[] args) {
		String string = null;
		try {
			string.length();
			if("".equals(string)){
				System.out.println("jkj");
			}
			System.out.println("正常执行");
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			System.out.println("执行finally");
		}
		System.out.println("异常后");
	}
}
