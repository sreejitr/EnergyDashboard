$(document).ready(function(){
$('#oneweekkwh').click(function () {
    $('#graph-container7').highcharts({
        title: {
            text: 'Energy Consumption, KWH (Last Week)',
            x: -20 //center
        },
        subtitle: {
            text: 'Total Consumption in Kilo-watt hour at different points in time'
        },
        xAxis: {
            categories: ['Sun', 'Mon', 'Tues', 'Wed', 'Thurs', 'Fri',
                'Sat']
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
            valueSuffix: ' kwh',
            pointFormat: '<span style="color:{point.color}">\u25CF</span> {series.name}: <b>{point.y}</b><br/>'
        },
        legend: {
            //layout: 'vertical',
            //align: 'right',
            //verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Median',
            data: [62, 145, 182, 215, 232, 245, 93]
        }, {
            name: 'User1\'s consumption',
            data: [0, 123, 170, 220, 248, 271, 0]
        }]
    });
});
});