$(document).ready(function(){
$('#comfMap').click(function () {

    // Initiate the chart
    $('#tempMapContainer').highcharts('Map', {
        title : {
            text : 'NASA SUSTAINABILITY BASE COMFORT HEAT MAP',
            style: {
            	'fontSize': '32px'
            }
        },
        subtitle : {
            text : 'Second Floor North Wing C',
            style: {
            	'fontSize': '20px'
            }
        },
        mapNavigation: {
            enabled: true,
            buttonOptions: {
                verticalAlign: 'bottom'
            }
        },

        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            itemStyle: {
                 fontSize:'15px',
                 font: 'CENTURY GOTHIC',
                 color: '#A0A0A0'
              }
        },

        tooltip: {
            formatter: function () {
                    return '<b>' + this.series.name + '</b><br/>' +
                        this.point.name + ': ' +
                        this.point.value + ' °F';
                }
        },

        colorAxis: {
            // min: 60,
            // minColor: '#7f7fff',
            // maxColor: '#ff3232',
            dataClasses: [{
                            from: 50,
                            to: 57.5,
                            color: '#00BFFF',
                            name: 'Cold'
                        }, {
                            from: 57.6,
                            to: 72.5,
                            color: '#93DB70',
                            name: 'Just Right'
                        }, {
                            from: 72.6,
                            to: 80,
                            color: '#FF6A6A',
                            name: 'Hot'
                        }]
        },

        series: [
	{
		"type": "map",
        "name": "Room Temperature",
        "data": [
			{
				"name": "Area 1",
                "value": 53.5,
                "dataLabels": {enabled: true,
                format: '{point.name}', style: {"fontSize": "18px"}, align:"right"},
				"path": "M0,-492,16,-499,81,-523,117,-440,151,-362,180,-375,180,-368,154,-354,182,-338,206,-346,219,-342,228,-331,201,-319,206,-313,269,-334,271,-337,308,-265,251,-241,267,-203,231,-185L108,-165,5,-428Z"
			},
			{
				"name": "Area 3",
                "value": 79.5,
                "dataLabels": {enabled: true,
                format: '{point.name}', style: {"fontSize": "18px"}},
				"path": "M176,-540,268,-345,267,-346,270,-340,265,-350,266,-347,267,-346,270,-340,464,-434,351,-628,340,-622,333,-634L179,-568L175,-541z"
			},
			{
				"name": "Area 4",
                "value": 55.5,
                "dataLabels": {enabled: true,
                format: '{point.name}', style: {"fontSize": "18px"}},
				"path": "M351,-627,351,-628,351,-627,435,-484,530,-537,431,-689,357,-653,351,-628,351,-628,435,-483,435,-484z"
			},
			{
				"name": "Area 5",
                "value": 80,
                "dataLabels": {enabled: true,
                format: '{point.name}', style: {"fontSize": "18px"}},
				"path": "M529,-539,620,-592,523,-730L511,-721,506,-730,431,-689z"
			},
			{
				"name": "Area 6",
                "value": 78.6,
                "dataLabels": {enabled: true,
                format: '{point.name}', style: {"fontSize": "18px"}},
				"path": "M524,-730,620,-592,702,-652,600,-793,523,-730,620,-592Z"
			},
			{
				"name": "Area 7",
                "value": 67.5,
                "dataLabels": {enabled: true,
                format: '{point.name}', style: {"fontSize": "18px"}},
				"path": "M346,-206,467,-266,483,-227L497,-235L547,-261,569,-217,473,-173,362,-173z"
			},
			{
				"name": "Area 9",
                "value": 65.5,
                "dataLabels": {enabled: true,
                format: '{point.name}', style: {"fontSize": "18px"}},
				"path": "M464,-434,492,-449,653,-536,699,-454,700,-447,565,-370,545,-399,507,-375,464,-434,491,-450Z"
			},
			{
				"name": "Area 10",
                "value": 51.5,
                "dataLabels": {enabled: true,
                format: '{point.name}', style: {"fontSize": "18px"}},
				"path": "M559,-294,600,-318,580,-348,715,-426,735,-394,750,-396,779,-348,686,-291,593,-240Z"
			},
			{
				"name": "Area 2",
                "value": 63.5,
                "dataLabels": {enabled: true,
                format: '{point.name}', style: {"fontSize": "18px"}},
				"path": "M81,-523,153,-363,180,-375,180,-368,176,-366,157,-356,156,-353,181,-339,206,-345,217,-342,228,-331,206,-322,210,-314,261,-332,269,-340,176,-543,175,-542,177,-553,179,-565z"
			},
			{
				"name": "Area 11",
                "value": 72.5,
                "dataLabels": {enabled: true,
                format: '{point.name}', style: {"fontSize": "18px"}},
				"path": "M436,-485,464,-435,653,-536,665,-515,671,-515L875,-648,808,-730,620,-592,440,-487Z"
			},
			{
				"name": "Area 8",
                "value": 79.5,
                "dataLabels": {enabled: true,
                format: '{point.name}', style: {"fontSize": "18px"}},
				"path": "M600,-793,702,-652,808,-730,701,-866,627,-815z"
			},
			{
				"name": "Area 12",
                "value": 58.5,
                "dataLabels": {enabled: true,
                format: '{point.name}', style: {"fontSize": "18px"}},
				"path": "M666,-513,681,-485,707,-503,760,-425,752,-423,728,-406,738,-394,752,-394,779,-348,779,-348,779,-348,779,-348,967,-474,962,-482,979,-494,986,-488,1000,-497,875,-649z"
			}
		]
	},
	{
		"type": "mapline",
		"data": [
			{
				"name": "path4225",
				"path": "M175,-541,175,-541,175,-541,175,-541,175,-541z"
			},
			{
				"name": "path4227",
				"path": "M176,-540,175,-541,175,-541z"
			},
			{
				"name": "path4231",
				"path": "M351,-628Z"
			},
			{
				"name": "path4247",
				"path": "M569,-372Z"
			}
		]
	}
],
  
    });
});
});