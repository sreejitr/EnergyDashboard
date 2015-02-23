$(document).ready(function(){
$('#percentileday').click(function () {
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
            text: 'Energy consumption, in Percentile (Today)'
        },
        subtitle: {
            text: 'Percentile of consumption: With respect to all users'
        },
        plotOptions: {
            column: {
                depth: 25
            }
        },
        tooltip: {
            valueSuffix: ' %',
            pointFormat: '<span style="color:{point.color}">\u25CF</span> {series.name}: <b>{point.y}</b><br/>'
        },
        xAxis: {
            categories: ["Percentile Values"]
        },
        yAxis: {
            title: {
                text: null
            }
        },
        series: [{
            name: 'Your Overall (%-ile)',
            color: '#f45b5b',
            data: [{
                y: 50
            }]
        }, {
            name: 'Median (%-ile)',
            color: "#90ee7e",
            data: [{
                y: 95
            }]
        }, {
            name: 'Your highest %-ile',
            color: '#FFFF66',
            data: [{
                y: 80
            }]
        }]
    });
});
});