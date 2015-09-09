<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>

<script src="<%=path%>/js-lib/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=path%>/js-lib/amcharts/serial.js" type="text/javascript"></script>

<script type="text/javascript">
	AmCharts.ready(function() {
		AmCharts.baseHref = true;
		
	});
	
	/** 创建 3d 圆柱状图标 **/
	function createCylinderChart(chartData, renderId, fieldName, valueName, colorName){
		if(chartData == null || chartData.length <= 0){//无数据
			var noDataHtml = "<div style='font-weight: bold; font-size: 15px; text-align: center;'>无数据</div>";
			document.getElementById(renderId).innerHTML = noDataHtml;
		}else{
			if(fieldName == null){
				fieldName = "fieldName";
			}
			if(valueName == null){
				valueName = "value";
			}
			if(colorName == null){
				colorName = "color"
			}
			
			// SERIAL CHART
			var chart = new AmCharts.AmSerialChart();
			chart.dataProvider = chartData;
			chart.categoryField = fieldName;
			chart.startDuration = 1;
			chart.depth3D = 10;
			chart.angle = 30;
	
			// AXES
			// category
			var categoryAxis = chart.categoryAxis;
			categoryAxis.gridAlpha = 0;
			categoryAxis.axisAlpha = 0;
			categoryAxis.gridPosition = "start";
			categoryAxis.labelRotation = 45;
			
			// value
			var valueAxis = new AmCharts.ValueAxis();
			valueAxis.axisAlpha = 0;
			valueAxis.gridAlpha = 0;
			chart.addValueAxis(valueAxis);
			
			// GRAPH
			var graph = new AmCharts.AmGraph();
			graph.valueField = valueName;
			graph.colorField = colorName;
			graph.fillColors = "#FF0000";
			graph.balloonText = "<b>[[category]]: [[value]]</b>";
			graph.type = "column";
			graph.lineAlpha = 0.5;
			graph.lineColor = "#FFFFFF";
			graph.topRadius = 1;
			graph.fillAlphas = 0.9;
			if(chartData.length < 8){
				graph.fixedColumnWidth = 40;
			}
			chart.addGraph(graph);
	
			// CURSOR
			var chartCursor = new AmCharts.ChartCursor();
			chartCursor.cursorAlpha = 0;
			chartCursor.zoomable = false;
			chartCursor.categoryBalloonEnabled = false;
			chartCursor.valueLineEnabled = true;
			chartCursor.valueLineBalloonEnabled = true;
			chartCursor.valueLineAlpha = 1;
			chart.addChartCursor(chartCursor);
			
			chart.creditsPosition = "top-right";
			
			// WRITE
			chart.write(renderId);
		}
	}
	
</script>