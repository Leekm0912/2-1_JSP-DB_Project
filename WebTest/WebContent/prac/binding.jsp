<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>여기에 제목을 입력하십시오</title>
</head>
<body>
	<c:set var="v1" value="JSP" />
	<c:set var="d" value="#{ v1 }" />
	<c:set var="s" value="${ v1 }" />
	<c:set var="v1" value="DB" />
	${ d }
	${ s }
	
	${ a=10 }
	${ a }
</body>
</html>