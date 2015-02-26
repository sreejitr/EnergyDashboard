$(function () {
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
            text: 'Current Average Energy Consumption of users compared with historical average for a particular time window'
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
            color: '#009ACD',
            data: [{
                y: 1.05
            }]
        }, {
            name: 'Historical average of consumption',
            color: "#9370DB",
            data: [{
                y: 0.95
            }]
        }]
    });
});