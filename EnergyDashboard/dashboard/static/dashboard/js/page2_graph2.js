$(function () {
    $('#graph-container2').highcharts({
        title: {
            text: 'Combination chart'
        },
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'April', 'May']
        },
        yAxis: {
            title: {
                text: 'kWh'
            }
        },
        labels: {
            items: [{
                html: 'Total energy consumption',
                style: {
                    left: '50px',
                    top: '18px',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                }
            }]
        },
        tooltip: {
            shared: true,
            valueSuffix: ' kWh'
        },
        
        series: [{
            type: 'column',
            name: 'Jane',
            data: [300, 200, 100, 300, 400]
        }, {
            type: 'column',
            name: 'John',
            data: [200, 300, 500, 700, 600]
        }, {
            type: 'column',
            name: 'Joe',
            data: [400, 300, 300, 900, 10]
        }, {
            type: 'spline',
            name: 'Average',
            data: [300, 267, 300, 633, 333],
            marker: {
                lineWidth: 2,
                lineColor: Highcharts.getOptions().colors[3],
                fillColor: 'white'
            }
        }, {
            type: 'pie',
            name: 'Total consumption',
            data: [{
                name: 'Jane',
                y: 400,
                color: Highcharts.getOptions().colors[0] // Jane's color
            }, {
                name: 'John',
                y: 730,
                color: Highcharts.getOptions().colors[1] // John's color
            }, {
                name: 'Joe',
                y: 519,
                color: Highcharts.getOptions().colors[2] // Joe's color
            }],
            center: [100, 80],
            size: 100,
            showInLegend: false,
            dataLabels: {
                enabled: false
            }
        }]
    });
});

