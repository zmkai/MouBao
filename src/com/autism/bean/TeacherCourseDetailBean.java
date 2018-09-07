package com.autism.bean;

import java.io.PrintStream;

public class TeacherCourseDetailBean
{
  private String courseId;
  private String courseName;
  private String courseNumber;
  private String restNumber;
  private String currentNumber;
  private String week;
  private String xingQi;
  private String jieCi;
  private String district;
  private String building;
  private String classroom;

  public String getCourseId()
  {
    return this.courseId;
  }
  public void setCourseId(String courseId) {
    if ((courseId != null) && (courseId.contains("&nbsp;"))) {
      courseId = courseId.replace("&nbsp;", "").trim();
    }
    this.courseId = courseId;
  }
  public String getCourseName() {
    return this.courseName;
  }
  public void setCourseName(String courseName) {
    if (courseName != null) {
      if (courseName.contains("&nbsp;")) {
        courseName = courseName.replace("&nbsp;", "").trim();
      }
      if (courseName.length() > 0) {
        courseName = courseName.substring(1, courseName.length()).trim();
      }
    }
    this.courseName = courseName;
  }
  public String getCourseNumber() {
    return this.courseNumber;
  }
  public void setCourseNumber(String courseNumber) {
    if ((courseNumber != null) && (courseNumber.contains("&nbsp;"))) {
      courseNumber = courseNumber.replace("&nbsp;", "").trim();
    }
    this.courseNumber = courseNumber;
  }
  public String getRestNumber() {
    return this.restNumber;
  }
  public void setRestNumber(String restNumber) {
    if ((restNumber != null) && (restNumber.contains("&nbsp;"))) {
      restNumber = restNumber.replace("&nbsp;", "").trim();
    }
    this.restNumber = restNumber;
  }
  public String getCurrentNumber() {
    return this.currentNumber;
  }
  public void setCurrentNumber(String currentNumber) {
    if ((currentNumber != null) && (currentNumber.contains("&nbsp;"))) {
      currentNumber = currentNumber.replace("&nbsp;", "").trim();
    }
    this.currentNumber = currentNumber;
  }
  public String getWeek() {
    return this.week;
  }
  public void setWeek(String week) {
    if (week != null) {
      if (week.contains("&nbsp;"))
        week = week.replaceAll("&nbsp;", "").trim();
      if (week.contains("_")) {
        String[] array = week.split("_");
        if (array.length > 1) {
          StringBuilder sb = new StringBuilder();
          for (String item : array) {
            item = item.trim();
            if (item.startsWith("第")) {
              item = item.substring(1) + "上";
            }
            if (item.endsWith("周")) {
              item = item + "上";
            }
            if (item.endsWith("课")) {
              item = item.replace("课", "");
            }
            sb.append(item).append("_");
          }
          week = sb.toString();
        }
      }
	week = week.contains("、") ? week.replaceAll("、", ",") : week; 
    }
    this.week = week;
  }
  public static void main(String[] args) {
    System.out.println("haha");
  }
  public String getXingQi() {
    return this.xingQi;
  }
  public void setXingQi(String xingQi) {
    if ((xingQi != null) && (xingQi.contains("&nbsp;"))) {
      xingQi = xingQi.replace("&nbsp;", "").trim();
    }
    this.xingQi = xingQi;
  }
  public String getJieCi() {
    return this.jieCi;
  }
  public void setJieCi(String jieCi) {
    if ((jieCi != null) && (jieCi.contains("&nbsp;"))) {
      jieCi = jieCi.replace("&nbsp;", "").trim();
    }
    this.jieCi = jieCi;
  }
  public String getDistrict() {
    return this.district;
  }
  public void setDistrict(String district) {
    if ((district != null) && (district.contains("&nbsp;"))) {
      district = district.replace("&nbsp;", "").trim();
    }
    this.district = district;
  }
  public String getBuilding() {
    return this.building;
  }
  public void setBuilding(String building) {
    if ((building != null) && (building.contains("&nbsp;"))) {
      building = building.replace("&nbsp;", "").trim();
    }
    this.building = building;
  }
  public String getClassroom() {
    return this.classroom;
  }
  public void setClassroom(String classroom) {
    if ((classroom != null) && (classroom.contains("&nbsp;"))) {
      classroom = classroom.replace("&nbsp;", "").trim();
    }
    this.classroom = classroom;
  }
}
