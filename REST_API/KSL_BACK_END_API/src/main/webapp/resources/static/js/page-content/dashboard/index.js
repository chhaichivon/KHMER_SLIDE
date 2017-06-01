$(document).ready(
		function() {
			// function e() {
			// $("#addNewEvent").modal("hide"), $("#fullcalendar")
			// .fullCalendar("renderEvent", {
			// title : $("#inputTitleEvent").val(),
			// start : new Date($("#start").val()),
			// end : new Date($("#end").val()),
			// color : $("#inputBackgroundEvent").val()
			// }, !0)
			// }
			// toastr.options = {
			// closeButton : !0,
			// progressBar : !0,
			// showMethod : "fadeIn",
			// hideMethod : "fadeOut",
			// timeOut : 5e3
			// }, toastr.info("You have 6 notifications",
			// "Welcome to Umega"), $(".counter").counterUp({
			// delay : 10,
			// time : 1e3
			// });
			$("#esp-comment").easyPieChart({
				barColor : "#8E23E0",
				trackColor : "#E6E6E6",
				scaleColor : !1,
				scaleLength : 0,
				lineCap : "round",
				lineWidth : 10,
				size : 140,
				animate : {
					duration : 2e3,
					enabled : !0
				}
			}), $("#esp-photo").easyPieChart({
				barColor : "#0667D6",
				trackColor : "#E6E6E6",
				scaleColor : !1,
				scaleLength : 0,
				lineCap : "round",
				lineWidth : 10,
				size : 140,
				animate : {
					duration : 2e3,
					enabled : !0
				}
			}), $("#esp-user").easyPieChart({
				barColor : "#17A88B",
				trackColor : "#E6E6E6",
				scaleColor : !1,
				scaleLength : 0,
				lineCap : "round",
				lineWidth : 10,
				size : 140,
				animate : {
					duration : 2e3,
					enabled : !0
				}
			}), $("#esp-feedback").easyPieChart({
				barColor : "#E5343D",
				trackColor : "#E6E6E6",
				scaleColor : !1,
				scaleLength : 0,
				lineCap : "round",
				lineWidth : 10,
				size : 140,
				animate : {
					duration : 2e3,
					enabled : !0
				}
			});
			var u = $("#user-list-table").DataTable({
				language : {
					lengthChange : !1,
					pageLength : 5,
					colReorder : !0,
					lengthMenu : "បង្ហាញ _MENU_ ស្ថិតិក្នុងមួយទំព័រ",
					paginate : {
						"previous" : "ថយក្រោយ",
						"next" : "បន្ទាប់",
						"first" : "ដំបូង",
						"last" : "ចុងក្រោយ"
					},
					search : "",
					searchPlaceholder : "ស្វែងរក..."
				}
			});
			u.buttons().container().appendTo(
					"#user-list-table_wrapper .col-sm-6:eq(0)"), $(
					".draggable li").each(function() {
				$(this).data("event", {
					title : $.trim($(this).text()),
					stick : !0
				}), $(this).draggable({
					zIndex : 999,
					revert : !0,
					revertDuration : 0
				})
			});
			var s = $("#slide-list-table").DataTable({
				language : {
					lengthChange : !1,
					pageLength : 5,
					colReorder : !0,
					lengthMenu : "បង្ហាញ _MENU_ ស្ថិតិក្នុងមួយទំព័រ",
					paginate : {
						"previous" : "ថយក្រោយ",
						"next" : "បន្ទាប់",
						"first" : "ដំបូង",
						"last" : "ចុងក្រោយ"
					},
					search : "",
					searchPlaceholder : "ស្វែងរក..."
				}
			});
			s.buttons().container().appendTo(
					"#slide-list-table_wrapper .col-sm-6:eq(0)"), $(
					".draggable li").each(function() {
				$(this).data("event", {
					title : $.trim($(this).text()),
					stick : !0
				}), $(this).draggable({
					zIndex : 999,
					revert : !0,
					revertDuration : 0
				})
			});
			var m = $("#my-doc-table").DataTable({
				language : {
					lengthChange : !1,
					pageLength : 5,
					colReorder : !0,
					lengthMenu : "បង្ហាញ _MENU_ ស្ថិតិក្នុងមួយទំព័រ",
					paginate : {
						"previous" : "ថយក្រោយ",
						"next" : "បន្ទាប់",
						"first" : "ដំបូង",
						"last" : "ចុងក្រោយ"
					},
					info : "បង្ហាញទំព័រទី _PAGE_ នៃ _PAGES_ ដែលជាទំព័រសរុប",
					search : "",
					searchPlaceholder : "ស្វែងរក..."
				}
			});
			m.buttons().container().appendTo(
					"#my-doc-table_wrapper .col-sm-6:eq(0)"), $(
					".draggable li").each(function() {
				$(this).data("event", {
					title : $.trim($(this).text()),
					stick : !0
				}), $(this).draggable({
					zIndex : 999,
					revert : !0,
					revertDuration : 0
				})
			});
			var d = $("#doc-list-table").DataTable({
				language : {
					lengthChange : !1,
					pageLength : 5,
					colReorder : !0,
					lengthMenu : "បង្ហាញ _MENU_ ស្ថិតិក្នុងមួយទំព័រ",
					paginate : {
						"previous" : "ថយក្រោយ",
						"next" : "បន្ទាប់",
						"first" : "ដំបូង",
						"last" : "ចុងក្រោយ"
					},
					info : "បង្ហាញទំព័រទី _PAGE_ នៃ _PAGES_ ដែលជាទំព័រសរុប",
					search : "",
					searchPlaceholder : "ស្វែងរក..."
				}
			});
			d.buttons().container().appendTo(
					"#doc-list-table_wrapper .col-sm-6:eq(0)"), $(
					".draggable li").each(function() {
				$(this).data("event", {
					title : $.trim($(this).text()),
					stick : !0
				}), $(this).draggable({
					zIndex : 999,
					revert : !0,
					revertDuration : 0
				})
			});
			var c = $("#cat-list-table").DataTable({
				language : {
					lengthChange : !1,
					pageLength : 5,
					colReorder : !0,
					lengthMenu : "បង្ហាញ _MENU_ ស្ថិតិក្នុងមួយទំព័រ",
					paginate : {
						"previous" : "ថយក្រោយ",
						"next" : "បន្ទាប់",
						"first" : "ដំបូង",
						"last" : "ចុងក្រោយ"
					},
					info : "បង្ហាញទំព័រទី _PAGE_ នៃ _PAGES_ ដែលជាទំព័រសរុប",
					search : "",
					searchPlaceholder : "ស្វែងរក..."
				}
			});
			c.buttons().container().appendTo(
					"#cat-list-table_wrapper .col-sm-6:eq(0)"), $(
					".draggable li").each(function() {
				$(this).data("event", {
					title : $.trim($(this).text()),
					stick : !0
				}), $(this).draggable({
					zIndex : 999,
					revert : !0,
					revertDuration : 0
				})
			});
			var sl = $("#save-list-table").DataTable({
				language : {
					lengthChange : !1,
					pageLength : 5,
					colReorder : !0,
					lengthMenu : "បង្ហាញ _MENU_ ស្ថិតិក្នុងមួយទំព័រ",
					paginate : {
						"previous" : "ថយក្រោយ",
						"next" : "បន្ទាប់",
						"first" : "ដំបូង",
						"last" : "ចុងក្រោយ"
					},
					info : "បង្ហាញទំព័រទី _PAGE_ នៃ _PAGES_ ដែលជាទំព័រសរុប",
					search : "",
					searchPlaceholder : "ស្វែងរក..."
				}
			});
			sl.buttons().container().appendTo(
					"#save-list-table_wrapper .col-sm-6:eq(0)"), $(
					".draggable li").each(function() {
				$(this).data("event", {
					title : $.trim($(this).text()),
					stick : !0
				}), $(this).draggable({
					zIndex : 999,
					revert : !0,
					revertDuration : 0
				})
			});

			var r = $("#role-table").DataTable({
				lengthChange : !1,
				pageLength : 5,
				paging : false,
				bFilter : false,
				ordering : false,
				colReorder : !0,
				language : {
					search : "",
					searchPlaceholder : "Search records"
				}
			});

			var d = $("#doc-table").DataTable({
				lengthChange : !1,
				pageLength : 5,
				paging : false,
				bFilter : false,
				ordering : false,
				colReorder : !0,
				language : {
					search : "",
					searchPlaceholder : "Search records"
				}
			});

			var d = $("#accept-table").DataTable({
				language : {
					lengthChange : !1,
					lengthMenu : "បង្ហាញ _MENU_ ស្ថិតិក្នុងមួយទំព័រ",
					pageLength : 5,
					pagingType : "full_numbers",
					bFilter : false,
					ordering : false,
					colReorder : !0,
					paginate : {
						"previous" : "ថយក្រោយ",
						"next" : "បន្ទាប់",
						"first" : "ដំបូង",
						"last" : "ចុងក្រោយ"
					},
					info : "បង្ហាញទំព័រទី _PAGE_ នៃ _PAGES_ ដែលជាទំព័រសរុប",
					search : "",
					searchPlaceholder : "ស្វែងរក..."

				}
			});

		});