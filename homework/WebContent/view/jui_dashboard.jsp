<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<!-- jui_chart library -->
<script src="../src/jui_chart/lib/jquery-1.8.0.min.js"></script>
<script src="../src/jui_chart/dist/chart.js"></script>

<body>
<div style="width:2000px; height:500px;">
	<div id="scatter_result" style="width:50%; height:100%; float:left;"></div>
	<div id="bubble_result" style="width:50%; height:100%; float:left;"></div>
</div>
<div style="wdith:500px; height:500px;">
	<div id="bar_result" style="width:50%; height:100%; float:left;"></div>
	<div id="pie_result" style="width:50%; height:100%; float:left;"></div>
</div>
</body>

<script id="scatter">
var chart = jui.include("chart.builder");
var time = jui.include("util.time");

function getNumber() {
    return Math.round(Math.random() * 30  % 20);
}

var start = new Date(),
    end = time.add(start, time.hours, 5),
    data = [];

for(var i = 0; i < 30; i++) {
    data.push({
        time : time.add(start, time.minutes, i*10),
        sales : getNumber(),
        profit : getNumber() * 0.75,
        total : getNumber() * 1.5
    });
}

chart("#scatter_result", {
    padding : {
        left : 70
    },
    axis : {
        x : {
            type : "date",
            domain : [ start, end ],
            interval : 1000 * 60 * 60, // 1hours
            format : "hh:mm",
            key: "time",
            line : true
        },
        y : {
            type : "range",
            domain : "total",
            step : 10,
            line : true
        },
        data : data
    },
    brush : {
        type : "scatter",
        size : 7,
        target : [ "sales", "profit", "total" ]
    },
    widget : [{
        type : "title",
        text : "Scatter Sample"
    }, {
        type : "cross",
        xFormat : function(d) {
            return time.format(d, "hh:mm");
        },
        yFormat : function(d) {
            return Math.round(d);
        }
    }, {
        type : "tooltip"
    }]
});

</script>
<script id="bubble">
var chart = jui.include("chart.builder");

chart("#bubble_result", {
    axis : {
        x : {
            type : "block",
            domain : "quarter",
            line : true
        },
        y : {
            type : "range",
            domain : [ 0, 50 ],
            step : 10,
            line : true
        },
        data : [
            { quarter : "1Q", sales : 40, profit : 35 },
            { quarter : "2Q", sales : 10, profit : 5 },
            { quarter : "3Q", sales : 15, profit : 10 },
            { quarter : "4Q", sales : 30, profit : 25 }
        ]
    },
    brush : {
        type : "bubble",
        min : 30,
        max : 50,
        active : 1,
        activeEvent : "click",
        scaleKey : "profit",
        target : "sales",
        showText : true,
        colors : [ "#ff0000" ]
    },
    event : {
        click : function(data) {
            console.log(data);
        }
    }
});

</script>
<script id="bar">
var chart = jui.include("chart.builder");
var activeIndex = 0,
    data = [
        { quarter : "1Q", samsung : 50, lg : 35, sony: 10 },
        { quarter : "2Q", samsung : 20, lg : 30, sony: 5 },
        { quarter : "3Q", samsung : 20, lg : 5, sony: 10 },
        { quarter : "4Q", samsung : 30, lg : 25, sony: 15 }
    ];

chart("#bar_result", {
    axis : {
        x : {
            type : "range",
            domain : function(data) {
                return data.samsung + data.lg + data.sony;
            },
            line : true,
            orient: "top"
        },
        y : {
            type : "block",
            domain : "quarter",
            line : true
        },
        data : data
    },
    brush : {
        type : "stackbar",
        active : activeIndex,
        activeEvent : "click",
        target : [ "samsung", "lg", "sony" ]
    },
    widget : [{
        type : "title",
        text : "Bar Sample",
        orient : "bottom",
        align : "end"
    }, {
        type : "legend",
        filter : true
    }],
    event : {
        "mousedown" : function(d) {
            activeIndex = d.dataIndex;
        },
        "legend.filter" : function(target) {
            this.updateBrush(0, { active: activeIndex });
        }
    }
});

</script>
<script id="pie">
var chart = jui.include("chart.builder");
var names = {
    ie: "IE",
    ff: "Fire Fox",
    chrome: "Chrome",
    safari: "Safari",
    other: "Others"
};

chart("#pie_result", {
    padding : 150,
    axis : {
        data : [
            { ie : 70, ff : 11, chrome : 9, safari : 6, other : 4 }
        ]
    },
    brush : {
        type : "pie",
        showText : "outer",
        active : "ie",
        activeEvent : "click",
        format : function(k, v) {
            return names[k] + ": " + v;
        }
    },
    widget : [{
        type : "title",
        text : "Pie Sample"
    }, {
        type : "tooltip",
        orient : "left",
        format : function(data, k) {
            return {
                key: names[k],
                value: data[k]
            }
        }
    }, {
        type : "legend",
        format : function(k) {
            return names[k];
        }
    }]
});

</script>
</html>