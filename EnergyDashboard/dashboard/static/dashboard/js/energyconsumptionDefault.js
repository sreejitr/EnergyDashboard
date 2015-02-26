$(function () {
    $('#graph-container7').highcharts({
        title: {
            text: 'Total energy Consumption in Kilo-watt hour at different points in time (Today)'
            // x: -20 //center
        },
        xAxis: {
            categories: ['12:00', '12:10', '12:20', '12:30', '12:40', '12:50',
                '13:00', '13:10', '13:20', '13:30', '13:40', '13:50'],
                labels: {
                style: {
                    fontSize:'15px'
                }
            }
        },
        yAxis: {
            title: {
                text: 'Energy (kwh)',
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }],
            labels: {
                style: {
                    fontSize:'15px'
                }
            }
        },
        tooltip: {
            valueSuffix: ' kwh',
            pointFormat: '<span style="color:{point.color}">\u25CF</span> {series.name}: <b>{point.y}</b><br/>'
        },
        legend: {
            //layout: 'vertical',
            //align: 'right',
            //verticalAlign: 'middle',
            borderWidth: 0,
            itemStyle: {
                 fontSize:'15px',
                 font: '15px UNICA ONE, sans-serif',
                 color: '#A0A0A0'
              }
        },
        series: [{
            name: 'Median',
            data: [0.10, 0.09, 0.05, 0.15, 0.2, 0.055, 0.08, 0.07, 0.03, 0.03, 0.039, 0.040]
        }, {
            name: 'User1\'s consumption',
            data: [0.12, 0.18, 0.07, 0.03, 0.27, 0.06, 0.18, 0.08, 0.06, 0.051, 0.066, 0.050]
        }]
    });
});
