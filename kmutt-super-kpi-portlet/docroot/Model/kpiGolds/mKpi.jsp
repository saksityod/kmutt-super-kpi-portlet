
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.test.*" %>   
<%
SupperKPIs jndi = new SupperKPIs();
String month_id = request.getParameter("month_id");
String org_id = request.getParameter("org_id");
String query="";
query+="select kpi_group_id, kpi_group_name, kpi_structure_id, concat(kpi_structure_name,' ',kpi_weight) as SK,"; 
query+=" (sum(percent_wavg)/sum(kpi_weight))*100 as result";
query+=" from kpi_result";
query+=" where fiscal_month_no = "+month_id+"";
query+=" and org_id = "+org_id+"";
query+=" and parent_kpi_id is null";

query+=" group by  kpi_group_id, kpi_group_name, kpi_structure_id, kpi_structure_name";

String culumn="1,2,3,4,5";

jndi.selectByIndexDwh(query, culumn);
out.print(jndi.getData());
//http://localhost:8082/kmutt-super-kpi-portlet/Model/kpiGolds/mKpiSKData.jsp?month_id=59&org_id=1
%>
