$(document).ready(function(){
$('#oneweekavgkwh').click(function () {
    $('#graph-container8').highcharts({
        chart: {
            type: 'column',
            margin: 75,
            options3d: {
                enabled: true,
                alpha: 10,
                beta: 25,
                depth: 70
            }
        },
        title: {
            text: 'Average Energy Consumption of all users compared with User12\'s (Last Week)'
        },
        
        plotOptions: {
            column: {
                depth: 25
            }
        },
        tooltip: {
            valueSuffix: ' kwh',
            pointFormat: '<span style="color:{point.color}">\u25CF</span> {series.name}: <b>{point.y}</b><br/>'
        },
        xAxis: {
            categories: ["Energy consumed in kilo-watt hour"],
            labels: {
                style: {
                    fontSize:'15px'
                }
            }
        },
        yAxis: {
            title: {
                text: null
            },
            labels: {
                style: {
                    fontSize:'15px'
                }
            }
        },legend: {
            borderWidth: 0,
            itemStyle: {
                 fontSize:'15px',
                 font: '15px UNICA ONE, sans-serif',
                 color: '#A0A0A0'
              }
        },
        series: [{
            name: 'Average energy consumption of users',
            color: '#82CFFD',
            data: [{
                y: 0.85
            }]
        }, {
            name: 'User12\'s Energy Consumption',
            color: "#AAAAFF",
            data: [{
                y: 1.25
            }]
        }]
    });
});
});