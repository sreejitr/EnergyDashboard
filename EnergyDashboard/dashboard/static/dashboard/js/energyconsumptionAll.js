$(document).ready(function(){
$('#allkwh').click(function () {
    $('#graph-container7').highcharts({
        title: {
            text: 'Energy Consumption in Kilo-watt hour (All days)',
            style: {
                    color: '#aaaaaa'
            }
        },
        xAxis: {
            categories: ['1. Mar', '2. Mar', '3. Mar', '4. Mar', '5. Mar', '6. Mar',
                '7. Mar', '8. Mar', '9. Mar', '10. Mar', '11. Mar', '12. Mar', '13. Mar', '14. Mar', '15. Mar'],
                labels: {
                style: {
                    fontSize:'15px'
                }
            }
        },
        yAxis: {
            title: {
                text: 'Energy (kwh)'
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
            color: '#FF6600',
            data: [1.70, 1.69, 0.95, 1.45, 1.82, 2.15, 2.32, 2.45, 2.33, 2.43, 2.39, 2.40, 2.20, 2.12, 1.70]
        }, {
            name: 'User12\'s consumption',
            color: "#ADFF2F",
            data: [1.82, 1.88, 0.97, 1.13, 1.70, 2.20, 2.48, 2.71, 2.61, 2.51, 2.66, 2.50, 2.00, 2.20, 1.90]
        }]
    });
});
});