$(function () {
    $('#graph-container7').highcharts({
        title: {
            text: 'Energy Consumption, KWH',
            x: -20 //center
        },
        subtitle: {
            text: 'Total Consumption in Kilo-watt hour at different points in time'
        },
        xAxis: {
            categories: ['12:00', '12:10', '12:20', '12:30', '12:40', '12:50',
                '13:00', '13:10', '13:20', '13:30', '13:40', '13:50']
        },
        yAxis: {
            title: {
                text: 'Energy (kwh)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: 'kwh'
        },
        legend: {
            //layout: 'vertical',
            //align: 'right',
            //verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Median',
            data: [70, 69, 95, 145, 182, 215, 232, 245, 233, 243, 239, 240]
        }, {
            name: 'User1\'s consumption',
            data: [82, 88, 97, 113, 170, 220, 248, 271, 261, 251, 266, 250]
        }]
    });
});
