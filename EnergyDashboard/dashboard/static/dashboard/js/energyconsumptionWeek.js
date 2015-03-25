$(document).ready(function(){
$('#oneweekkwh').click(function () {
    $('#graph-container7').highcharts({
        title: {
            text: 'Energy Consumption in Kilo-watt hour (Last week)'
            // x: -20 //center
        },
        xAxis: {
            categories: ['Sun', 'Mon', 'Tues', 'Wed', 'Thurs', 'Fri',
                'Sat'],
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
            data: [0.62, 1.45, 1.82, 2.15, 2.32, 2.45, 0.93]
        }, {
            name: 'User12\'s consumption',
            color: "#ADFF2F",
            data: [0, 1.23, 1.70, 2.20, 2.48, 2.71, 0]
        }]
    });
});
});