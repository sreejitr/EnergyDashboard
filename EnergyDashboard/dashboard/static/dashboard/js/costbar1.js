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
            text: 'Cost of Energy Consumed Today (cents)'
        },
        plotOptions: {
            column: {
                depth: 25
            }
        },
        tooltip: {
            valueSuffix: ' cents',
            pointFormat: '<span style="color:{point.color}">\u25CF</span> {series.name}: <b>{point.y}</b><br/>'
        },
        xAxis: {
            categories: [' ']
        },
        yAxis: {
            title: {
                text: 'Cost (in Cents)'
            }
        },
        series: [{
            name: 'Your',
            data: [15]
        },{
            name: 'Median',
            data: [10]
        },{
            name: 'Best Candidate',
            data: [8]
        }]
    });
});
});