package com.autism.bean;

public class StudentCourseDetailBean {
	private String peiYangFangXiang;
	private String courseId;
	private String courseName;
	private String courseNumber;
	private String credit;
	private String courseAttribute;
	private String testType;
	private String teacherName;
	private String studyType;
	private String selectState;
	private String week;
	private String xingQi;
	private String jieCi;
	private String jieShu;
	private String district;
	private String building;
	private String classroom;

	public String getPeiYangFangXiang() {
		return this.peiYangFangXiang;
	}

	public void setPeiYangFangXiang(String peiYangFangXiang) {
		if ((peiYangFangXiang != null) && (peiYangFangXiang.contains("&nbsp;")))
			peiYangFangXiang = peiYangFangXiang.replaceAll("&nbsp;", "").trim();
		this.peiYangFangXiang = peiYangFangXiang;
	}

	public String getCourseId() {
		return this.courseId;
	}

	public void setCourseId(String courseId) {
		if ((courseId != null) && (courseId.contains("&nbsp;")))
			courseId = courseId.replaceAll("&nbsp;", "").trim();
		this.courseId = courseId;
	}

	public String getCourseName() {
		return this.courseName;
	}

	public void setCourseName(String courseName) {
		if ((courseName != null) && (courseName.contains("&nbsp;")))
			courseName = courseName.replaceAll("&nbsp;", "").trim();
		this.courseName = courseName;
	}

	public String getCourseNumber() {
		return this.courseNumber;
	}

	public void setCourseNumber(String courseNumber) {
		if ((courseNumber != null) && (courseNumber.contains("&nbsp;")))
			courseNumber = courseNumber.replaceAll("&nbsp;", "").trim();
		this.courseNumber = courseNumber;
	}

	public String getCredit() {
		return this.credit;
	}

	public void setCredit(String credit) {
		if ((credit != null) && (credit.contains("&nbsp;")))
			credit = credit.replaceAll("&nbsp;", "").trim();
		this.credit = credit;
	}

	public String getCourseAttribute() {
		return this.courseAttribute;
	}

	public void setCourseAttribute(String courseAttribute) {
		if ((courseAttribute != null) && (courseAttribute.contains("&nbsp;")))
			courseAttribute = courseAttribute.replaceAll("&nbsp;", "").trim();
		this.courseAttribute = courseAttribute;
	}

	public String getTestType() {
		return this.testType;
	}

	public void setTestType(String testType) {
		if ((testType != null) && (testType.contains("&nbsp;")))
			testType = testType.replaceAll("&nbsp;", "").trim();
		this.testType = testType;
	}

	public String getTeacherName() {
		return this.teacherName;
	}

	public void setTeacherName(String teacherName) {
		if ((teacherName != null) && (teacherName.contains("&nbsp;")))
			teacherName = teacherName.replaceAll("&nbsp;", "").trim();
		this.teacherName = teacherName;
	}

	public String getStudyType() {
		return this.studyType;
	}

	public void setStudyType(String studyType) {
		if ((studyType != null) && (studyType.contains("&nbsp;")))
			studyType = studyType.replaceAll("&nbsp;", "").trim();
		this.studyType = studyType;
	}

	public String getSelectState() {
		return this.selectState;
	}

	public void setSelectState(String selectState) {
		if ((selectState != null) && (selectState.contains("&nbsp;")))
			selectState = selectState.replaceAll("&nbsp;", "").trim();
		this.selectState = selectState;
	}

	public String getWeek() {
		return this.week;
	}

	public void setWeek(String week) {
		if (week != null) {
			if (week.contains("&nbsp;"))
				week = week.replaceAll("&nbsp;", "").trim();
			if (week.contains("、"))
				week = week.replaceAll("、", ",");
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

	public String getXingQi() {
		return this.xingQi;
	}

	public void setXingQi(String xingQi) {
		if ((xingQi != null) && (xingQi.contains("&nbsp;")))
			xingQi = xingQi.replaceAll("&nbsp;", "").trim();
		this.xingQi = xingQi;
	}

	public String getJieCi() {
		return this.jieCi;
	}

	public void setJieCi(String jieCi) {
		if ((jieCi != null) && (jieCi.contains("&nbsp;")))
			jieCi = jieCi.replaceAll("&nbsp;", "").trim();
		this.jieCi = jieCi;
	}

	public String getJieShu() {
		return this.jieShu;
	}

	public void setJieShu(String jieShu) {
		if ((jieShu != null) && (jieShu.contains("&nbsp;")))
			jieShu = jieShu.replaceAll("&nbsp;", "").trim();
		this.jieShu = jieShu;
	}

	public String getDistrict() {
		return this.district;
	}

	public void setDistrict(String district) {
		if ((district != null) && (district.contains("&nbsp;")))
			district = district.replaceAll("&nbsp;", "").trim();
		this.district = district;
	}

	public String getBuilding() {
		return this.building;
	}

	public void setBuilding(String building) {
		if ((building != null) && (building.contains("&nbsp;")))
			building = building.replaceAll("&nbsp;", "").trim();
		this.building = building;
	}

	public String getClassroom() {
		return this.classroom;
	}

	public void setClassroom(String classroom) {
		if ((classroom != null) && (classroom.contains("&nbsp;")))
			classroom = classroom.replaceAll("&nbsp;", "").trim();
		this.classroom = classroom;
	}

	public String toString() {
		return "StudentCourseDetailBean [peiYangFangXiang="
				+ this.peiYangFangXiang + ", courseId=" + this.courseId
				+ ", courseName=" + this.courseName + ", courseNumber="
				+ this.courseNumber + ", credit=" + this.credit
				+ ", courseAttribute=" + this.courseAttribute + ", testType="
				+ this.testType + ", teacherName=" + this.teacherName
				+ ", studyType=" + this.studyType + ", selectState="
				+ this.selectState + ", week=" + this.week + ", xingQi="
				+ this.xingQi + ", jieCi=" + this.jieCi + ", jieShu="
				+ this.jieShu + ", district=" + this.district + ", building="
				+ this.building + ", classroom=" + this.classroom + "]";
	}

	public static void main(String[] args) {

	}
}
