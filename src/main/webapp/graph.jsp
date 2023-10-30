<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title> M A M Billing</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/homepage/graph.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.min.js"></script>

</head>

<body>
	<h2>Profit Chart</h2>
	<div>

		<a
			href="<%=request.getContextPath()%>/getrecentbills"><span class="arr-right"> &#10095;</span></a> <a
			href="<%=request.getContextPath()%>/getrecentbills"><span
			class="arr-left">&#10094;</span></a> <br>
	</div>
	<div class="chart_div">

		<canvas id="chart" style="width: 70%; max-width: 100%; height: 400px;"></canvas>

	</div>

	<script>
        // Make an API call to your servlet when the page loads
        document.addEventListener("DOMContentLoaded", function () {
        	
        	 const url = "<%=request.getContextPath()%>/getAmountDetails";
            fetch(url)
                .then(response => response.json())
                .then(res => {
                	
                	
                	const data = JSON.parse(res.data);
                	
                    const dates = Object.keys(data);
                    const sumOfPrices = Object.values(data);
            

                    dates.sort((a, b) => new Date(a) - new Date(b));


                    const chartData = {
                        labels: dates,
                        datasets: [
                            {
                                label: 'Total Sales Amount',
                                data: sumOfPrices,
                                
                                fill: false,
                          lineTension:0,
                          backgroundColor: "lightblue",
                          borderColor: "rgba(0,0,255,0.1)",
                            }                            
                        ]
                    };


                    const ctx = document.getElementById('chart').getContext('2d');
                    new Chart(ctx, {
                        type: 'line',
                        data: chartData,
                        options: {
                            scales: {
                                x: {
                                    max: 15,
                                    title: 'Price' 
                                   
                                         
                                  },
                                y: {
                                    
                                    label: {
                                        display: true,
                                        text: 'date'
                                        // Label for y-axis
                                    }
                                }
                            }
                        }
                    });
                });
        });
    </script>

</body>
</html>
