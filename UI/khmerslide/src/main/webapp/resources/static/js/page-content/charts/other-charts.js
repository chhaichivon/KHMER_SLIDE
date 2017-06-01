function drawMouseSpeedDemo() {
	var o, e = 500, i = -1, r = -1, t = 0, l = [], a = 30;
	$("html").mousemove(
			function(o) {
				var e = o.pageX, l = o.pageY;
				i > -1 && (t += Math.max(Math.abs(e - i), Math.abs(l - r))),
						i = e, r = l
			});
	var h = function() {
		var i = new Date, r = i.getTime();
		if (o && o != r) {
			var p = Math.round(t / (r - o) * 1e3);
			l.push(p), l.length > a && l.splice(0, 1), t = 0, $("#sp-live")
					.sparkline(l, {
						tooltipSuffix : " pixels per second",
						type : "line",
						width : "200",
						height : "200",
						chartRangeMax : 50,
						lineColor : "#0667D6",
						fillColor : "rgba(52, 152, 219, 0.2)",
						lineWidth : "2",
						spotColor : "#0667D6",
						minSpotColor : "#E5343D",
						maxSpotColor : "#17A88B",
						highlightLineColor : "#FFB61E",
						highlightSpotColor : "#FFB61E",
						spotRadius : 3
					})
		}
		o = r, setTimeout(h, e)
	};
	setTimeout(h, e)
}
$(document).ready(
		function() {
			$('#admin').easyPieChart({
			    barColor: function (percent) {
			       return (percent < 25 ? '#cb3935' : percent < 50 ? '#ffb6c1' : percent < 85 ? '#f0ad4e' : '#5cb85c');
			    },
			    trackColor : "#E6E6E6",
				scaleColor : !1,
				scaleLength : 0,
				lineCap : "round",
				lineWidth : 10,
				size : 140,

			    onStep: function (from, to, percent) {
			       $(this.el).find('.percent').text(Math.round(percent));
			    }
			}),
			$('#male-user').easyPieChart({
			    barColor: function (percent) {
			       return (percent < 25 ? '#cb3935' : percent < 50 ? '#ffb6c1' : percent < 85 ? '#f0ad4e' : '#5cb85c');
			    },
			    trackColor : "#E6E6E6",
				scaleColor : !1,
				scaleLength : 0,
				lineCap : "round",
				lineWidth : 10,
				size : 140,

			    onStep: function (from, to, percent) {
			       $(this.el).find('.percent').text(Math.round(percent));
			    }
			}),
			$('#female-user').easyPieChart({
			    barColor: function (percent) {
			       return (percent < 25 ? '#cb3935' : percent < 50 ? '#ffb6c1' : percent < 85 ? '#f0ad4e' : '#5cb85c');
			    },
			    trackColor : "#E6E6E6",
				scaleColor : !1,
				scaleLength : 0,
				lineCap : "round",
				lineWidth : 10,
				size : 140,

			    onStep: function (from, to, percent) {
			       $(this.el).find('.percent').text(Math.round(percent));
			    }
			}),
			$('#total-user').easyPieChart({
			    barColor: function (percent) {
			       return (percent < 25 ? '#cb3935' : percent < 50 ? '#ffb6c1' : percent < 85 ? '#f0ad4e' : '#5cb85c');
			    },
			    trackColor : "#E6E6E6",
				scaleColor : !1,
				scaleLength : 0,
				lineCap : "round",
				lineWidth : 10,
				size : 140,

			    onStep: function (from, to, percent) {
			       $(this.el).find('.percent').text(Math.round(percent));
			    }
			}),
			$('#total-doc').easyPieChart({
			    barColor: function (percent) {
			       return (percent < 25 ? '#cb3935' : percent < 50 ? '#ffb6c1' : percent < 85 ? '#f0ad4e' : '#5cb85c');
			    },
			    trackColor : "#E6E6E6",
				scaleColor : !1,
				scaleLength : 0,
				lineCap : "round",
				lineWidth : 10,
				size : 140,

			    onStep: function (from, to, percent) {
			       $(this.el).find('.percent').text(Math.round(percent));
			    }
			}),
			$("#esp-1").easyPieChart({
				barColor : "#0667D6",
				trackColor : "#E6E6E6",
				scaleColor : !1,
				scaleLength : 0,
				lineCap : "round",
				lineWidth : 10,
				size : 140
			}), $("#esp-2").easyPieChart({
				barColor : "#0667D6",
				trackColor : "#E6E6E6",
				scaleColor : !1,
				scaleLength : 0,
				lineCap : "round",
				lineWidth : 10,
				size : 140,
				onStep : function(o, e, i) {
					$(this.el).find(".percent").text(Math.round(i))
				}
			}), $("#esp-3").easyPieChart({
				barColor : "#0667D6",
				trackColor : "#E6E6E6",
				scaleColor : "#0667D6",
				scaleLength : 10,
				lineCap : "round",
				lineWidth : 10,
				size : 140
			})		
	});

var u = $("#user-table").DataTable({
	lengthChange : !1,
	pageLength : 5,
	colReorder : !0,
	buttons : [ "copy", "excel", "pdf", "print" ],
	language : {
		search : "",
		searchPlaceholder : "Search records"
	}
});
u.buttons().container().appendTo(
		"#user-table_wrapper .col-sm-6:eq(0)"), $(
		".draggable li").each(function() {
	$(this).data("event", {
		title : $.trim($(this).text()),
		stick : !0
	}), $(this).draggable({
		zIndex : 999,
		revert : !0,
		revertDuration : 0
	})
})