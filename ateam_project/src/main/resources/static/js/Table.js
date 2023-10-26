/**
 * 
 */
function Table(id) {
	this.id = id;
}

Table.prototype.view = function(jQuery, appendTo) {
	let tableHtml = ""
	tableHtml += `<table id="${this.id}" class="code-grid">`
	tableHtml += `<thead>`
	tableHtml += `<tr>`
	tableHtml += `<th><input type="text" class="title" data-index="0" /></th>`
	tableHtml += `<th class="result">result</th>`
	tableHtml += `</tr>`
	tableHtml += `</thead>`
	tableHtml += `<tbody>`
	tableHtml += `<tr>`
	tableHtml += `<td><input type="text" class="value" data-index="0" /></td>`
	tableHtml += `<td class="result"><input type="text" name="result" /></td>`
	tableHtml += `</tr>`
	tableHtml += `</tbody>`
	tableHtml += `</table>`
	var table = jQuery(tableHtml);
	table.find("input.title").keyup(function() {
		var index = jQuery(this).data("index")
		var name = jQuery(this).val()
		
		jQuery(`input.value[data-index=${index}]`).attr("name", name)
	})
	jQuery(appendTo).append(table)
}

Table.prototype.addRow = function(jQuery, tableElement) {
	let cols = jQuery(tableElement).find(".title").length
	let tableHtml = `<tr>`
	for (let c = 0; c < cols; c++) {
		tableHtml += `<td><input type="text" class="value" data-index="${c}" name="${jQuery(tableElement).find("thead").find("input.title").eq(c).val()}" /></td>`
	}
	tableHtml += `<td class="result"><input type="text" name="result" /></td>`
	tableHtml += `</tr>`
	
	jQuery(tableElement).append(jQuery(tableHtml))
}

Table.prototype.addColumn = function(jQuery, tableElement) {
	let nextIndex = jQuery(tableElement).find(".title").length;
	console.log(nextIndex);
	let newTitle = `<th><input type="text" class="title" data-index="${nextIndex}" /></th>`
	let column = `<td><input type="text" class="value" data-index="${nextIndex}"/></td>`
	
	jQuery(tableElement).find("thead").find("tr").each(function() {
		console.log(jQuery(this))
		console.log(jQuery(this).find(".result"))
		jQuery(this).find(".result").before( jQuery(newTitle) )
	})
	
	jQuery(tableElement).find("tbody").find("tr").each(function() {
		jQuery(this).find(".result").before( jQuery(column) )
	})
	
	jQuery(tableElement).find(`input.title[data-index=${nextIndex}]`).keyup(function() {
		var name = jQuery(this).val()
		jQuery(`input.value[data-index=${nextIndex}]`).attr("name", name)
	})
	
}

Table.prototype.toJson = function(jQuery, tableElement) {
	let json = [];
	jQuery(tableElement).find("tbody").find("tr").each(function() {
		let row = {}
		jQuery(this).find("td").each(function() {
			let input = jQuery(this).find("input");
			let name = input.attr("name");
			let val = input.val();

			if (isArray(val)) {
				row[name] = toArray(val);
			}
			else if (isNumber(val)) {
				row[name] = parseInt(val);
			}
			else if (isBool(val)) {
				row[name] = parseBool(val);
			}
			else {
				row[name] = val;
			}

		});
		json.push(row);
	})

	function isNumber(str) {
		let num = parseInt(str);
		return !isNaN(num);
	}

	function isArray(str) {
		return str.indexOf(",") >= 0;
	}

	function isBool(str) {
		return str == "true" || str == "false";
	}

	function parseBool(str) {
		return str == "true";
	}

	function toArray(str) {
		let arr = str.split(",");
		for (let i = 0; i < arr.length; i++) {
			if (isNumber(arr[i])) {
				arr[i] = parseInt(arr[i]);
			}
			else if (isBool(val)) {
				arr[i] = parseBool(arr[i]);
			}
		}
		return arr
	}
	return json;
}