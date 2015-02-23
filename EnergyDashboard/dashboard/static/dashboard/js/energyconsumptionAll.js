$(document).ready(function(){
$('#allkwh').click(function () {
    $('#graph-container7').highcharts({
        title: {
            text: 'Energy Consumption, KWH',
            x: -20 //center
        },
        
        xAxis: {
            categories: ['1. Mar', '2. Mar', '3. Mar', '4. Mar', '5. Mar', '6. Mar',
                '7. Mar', '8. Mar', '9. Mar', '10. Mar', '11. Mar', '12. Mar', '13. Mar', '14. Mar', '15. Mar']
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
            data: [170, 169, 95, 145, 182, 215, 232, 245, 233, 243, 239, 240, 220, 212, 170]
        }, {
            name: 'User1\'s consumption',
            data: [182, 188, 97, 113, 170, 220, 248, 271, 261, 251, 266, 250, 200, 220, 190]
        }]
    });
});
});