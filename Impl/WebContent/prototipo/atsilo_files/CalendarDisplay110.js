
//
// Originally written by Keith Jenci
// www.mredkj.com
//
// June 08, 2002 - version 1.0.0
// November 14, 2002 - version 1.1.0
//

// Constants - v.1.1.0 - these were taken out of CalendarFormatter and made global.
var NO_DAY_CALENDAR = 99; // set to something other than a valid day (1-31). For example, 99
var NO_NAV_MONTH = -1;
var MONTHS_CALENDAR = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
var	DAYS_1_CALENDAR = new Array("S", "M", "T", "W", "T", "F", "S");
var DAYS_2_CALENDAR = new Array("Su", "Mo", "Tu", "We", "Th", "Fr", "Sa");
var DAYS_3_CALENDAR = new Array("SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT");
var DAYS_FULL_CALENDAR = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");

/*
 * Use this to construct a CalendarDisplay object.
 * There are other functions in this JavaScript file
 * that act as instance methods for CalendarDisplay.
 *
 * Example:
 * var calendarEx = new CalendarDisplay();
 *
 * Also refer to example in setNavigationOn
 *
 * v.1.1.0 - modified - Added link and open functionality.
 */
function CalendarDisplay()
{
	// Day Format constants. The actual number values aren't important.
	// setDayFormat uses these.
	this.ONE_LETTER = 1;
	this.TWO_LETTER = 2;
	this.THREE_LETTER = 3;
	this.FULL_LETTER = 4;
	
	// The name is used when constructing links for navigation
	this.name = "";
	
	// general settings and methods
	this.dayFormat = this.ONE_LETTER;
	this.setDayFormat = setDayFormatCD;
	this.createYear = createYearCD;
	this.createMonth = createMonthCD;
	this.createMonthInternal = createMonthInternalCD;
	this.formatter;
	this.monthValidated = "";
	this.dayValidated = "";
	this.yearValidated = "";
	this.errorThrown = false;
	
	// settings and methods for links
	this.linkIsOn = false;
	this.linkDayHandlerName = ""; // This is set by implementing logic when calling setLinkOn
	this.setLinkOn = setLinkOnCD;
	this.setLinkOff = setLinkOffCD;
	
	// settings and methods for open window
	this.openIsOn = false;
	this.setOpenOn = setOpenOnCD;
	this.setOpenOff = setOpenOffCD;
	this.autoCloseIsOn = false;
	this.setAutoCloseOn = setAutoCloseOnCD;
	this.setAutoCloseOff = setAutoCloseOffCD;
	this.windowWidth = 190; // This is adjusted in setDayFormat
	this.windowHeight = 235;
	this.windowWidthYear = 690; // This is adjusted in setDayFormat
	this.windowHeightYear = 600;
	
	// navigation settings and methods
	this.navigateMonth = navigateMonthCD;
	this.navigateYear = navigateYearCD;
	this.navigationIsOn = false;
	this.setNavigationOn = setNavigationOnCD;
	this.setNavigationOff = setNavigationOffCD;
}

/*
 * Set the day name format.
 * Once a CalendarDisplay object is created, can use the variables:
 * ONE_LETTER, TWO_LETTER, THREE_LETTER, FULL_LETTER
 *
 * Example:
 * var calendarEx = new CalendarDisplay();
 * calendarEx.setDayFormat(calendarEx.TWO_LETTER);
 *
 * v.1.1.0 - modified - Validate specifically for each format instead of using a range.
 * 
 */
function setDayFormatCD(dayF)
{
	this.dayFormat = dayF;
	if (dayF == this.ONE_LETTER || dayF == this.TWO_LETTER)
	{
		this.windowWidth = 190;
		this.windowWidthYear = 690;
	}
	else if (dayF == this.THREE_LETTER)
	{
		this.windowWidth = 280;
		this.windowWidthYear = 750;
	}
	else if (dayF == this.FULL_LETTER)
	{
		this.windowWidth = 430;

		// not recommended to use full letter with the year calendar
		this.windowWidthYear = 800;
	}
	else
	{
		// Could validate here, but let the formatter display #ERR
	}

}

/*
 * Create and return the HTML for all the months in a calendar year,
 * given the month, day, and year.
 * Month is zero based, which means January is 0, February is 1, etc.
 *
 * The year should be valid, but month and day are not required,
 * so they can be set to any value out of range.
 * It's recommended to use "" or NO_DAY_CALENDAR.
 * If a valid month and day are passed in, then that day will be highlighted.
 *
 * If setOpenOn() has been called, then the year is also opened in a separate window.
 *
 * Example (for December 21, 2002):
 * var calendarEx = new CalendarDisplay();
 * document.writeln(calendarEx.createYear(11, 21, 2002));
 *
 * v.1.1.0 - modified - Added open window logic.
 */
function createYearCD(cdMonth, cdDay, cdYear)
{
	this.formatter = new CalendarFormatter();
	
	var r;
	var c;
	var incr = 0;
	
	this.formatter.setupCalendarYear();
	
	for (r=0; r<3; r++)
	{
		this.formatter.startRow();
		
		for (c=0; c<4; c++)
		{
			this.formatter.startColumn();
			var dd = (cdMonth == incr) ? cdDay : NO_DAY_CALENDAR;
			this.createMonthInternal(incr, dd, cdYear);
			this.formatter.endColumn();
			incr++;
		}
		
		this.formatter.endRow();
	}
	
	this.formatter.concludeCalendarYear();
	
	if (this.openIsOn)
	{
		// setup navigation
		var prefixFormatter = new CalendarFormatter();
		if (this.navigationIsOn && !this.errorThrown)
		{
			var aYear = this.yearValidated;
			prefixFormatter.addNavigationYear(aYear, this.name);
		}
	
		var settings = "scrollbars=yes,menubar=yes,resizable=yes,width=" + this.windowWidthYear + ",height=" + this.windowHeightYear;
		var calendarWindowYear = window.open("","CalendarWindowYear", settings);
		calendarWindowYear.document.open();
		calendarWindowYear.document.writeln("<HTML><HEAD><TITLE>Calendar</TITLE></HEAD>");
		calendarWindowYear.document.writeln("<BODY onLoad='self.focus()'>");
		calendarWindowYear.document.writeln(prefixFormatter.results);	
		calendarWindowYear.document.writeln(this.formatter.results);
		calendarWindowYear.document.writeln("</BODY></HTML>");
		calendarWindowYear.document.close();
	}

	return this.formatter.results;
}

/*
 * Create a month and return the HTML for a month,
 * given a month, day, and year.
 * Month is zero based, which means January is 0, February is 1, etc.
 *
 * The year and month should be valid, but day is not required,
 * so it can be set to any value out of range.
 * It's recommended to use "" or NO_DAY_CALENDAR.
 * If a day is passed in, then that day will be highlighted.
 *
 * If setOpenOn() has been called, then the month is also opened in a separate window.
 *
 * Example (for December 21, 2002):
 * var calendarEx = new CalendarDisplay();
 * document.writeln(calendarEx.createMonth(11, 21, 2002));
 *
 * v.1.1.0 - modified - Added open window logic.
 */
function createMonthCD(cdMonth, cdDay, cdYear)
{
	// this formatter is used in createMonthInternal
	this.formatter = new CalendarFormatter();

	// createMonthInternal does validation, so call it first
	var	calendarWindowInternal = this.createMonthInternal(cdMonth, cdDay, cdYear);
	
	if (this.openIsOn)
	{
		// setup navigation
		var prefixFormatter = new CalendarFormatter();
		if (this.navigationIsOn && !this.errorThrown)
		{
			var aMonth = this.monthValidated;
			var aYear = this.yearValidated;
			prefixFormatter.addNavigation(aMonth, aYear, this.name);
		}
	
		// open window
		var settings = "scrollbars=yes,menubar=yes,resizable=yes,width=" + this.windowWidth + ",height=" + this.windowHeight;
		var calendarWindow = window.open("","CalendarWindowMonth", settings);
		calendarWindow.document.open();
		calendarWindow.document.writeln("<HTML><HEAD><TITLE>Calendar</TITLE></HEAD>");
		calendarWindow.document.writeln("<BODY onLoad='self.focus()'>");
	  calendarWindow.document.writeln(prefixFormatter.results);		
		calendarWindow.document.writeln(calendarWindowInternal);
		calendarWindow.document.writeln("</BODY></HTML>");
		calendarWindow.document.close();
	}
	
	return calendarWindowInternal;
}

/*
 * This function is a middle man to call createMonth for the navigation in createMonth.
 *
 * Original purpose: If the navigation buttons are recoded to be href links,
 * then will need this so the return value doesn't attempt to load an invalid page.
 * The href navigation links were slow in Netscape 4.
 *
 * Now this method is used so the buttons don't have to include a dummy day.
 *
 * v.1.1.0 - new
 */
function navigateMonthCD(cdMonth, cdYear)
{
	var cdDay = NO_DAY_CALENDAR;
	this.createMonth(cdMonth, cdDay, cdYear);
}

function navigateYearCD(cdYear)
{
	var cdMonth = NO_NAV_MONTH;
	var cdDay = NO_DAY_CALENDAR;
	this.createYear(cdMonth, cdDay, cdYear);
}

/*
 * Create a month and return it.
 * Used internally by createMonth and createYear.
 *
 * v.1.1.0 - modified - Using addFormattedLinkDay now instead of addFormattedDay.
 */
function createMonthInternalCD(cdMonth, cdDay, cdYear)
{
	if (isNaN(cdDay) || cdDay == "")
	{
		cdDay = NO_DAY_CALENDAR;
	}

	this.dayValidated = cdDay;
	this.formatter.dayChosen = cdDay;
	
	if (isNaN(cdMonth) || cdMonth < 0 || cdMonth >= MONTHS_CALENDAR.length)
	{
		this.errorThrown = true;
		this.monthValidated = 0; // monthValidated is set to 0 to limit JavaScript errors
		return "Not a valid month.";
	}
	this.errorThrown = false;
	this.monthValidated = cdMonth;
	
	if (isNaN(cdYear) || cdYear == "")
	{
		this.errorThrown = true;
		this.yearValidated = 0; // yearValidated is set to 0 to limit JavaScript errors
		return "Not a valid year.";
	}
	this.errorThrown = false;
	this.yearValidated = cdYear;
	
	var startingDay = 1;
	var aDate = new Date(cdYear, cdMonth, startingDay);
		
	var DAY_ROW = 0;
	var SPACE_BEFORE = 1;
	var DAYS_BETWEEN = 2;
	var SPACE_AFTER = 3;
	var phase = DAY_ROW;

	this.formatter.setupCalendarMonth(cdMonth, cdYear);

	var rows;
	for (rows = 0; rows < 7; rows++)
	{
		this.formatter.startRow();

		var cols;
		for (cols = 0; cols < 7; cols++)
		{
			if (phase == DAY_ROW)
			{
				this.formatter.addFormattedDayName(this, cols);
				if (cols >= 6) phase = SPACE_BEFORE;
			}
			else if (phase == SPACE_BEFORE)
			{
				var tempDay = aDate.getDay();
				if (cols == tempDay)
				{
					var autoCloseReallyOn = (this.autoCloseIsOn && this.openIsOn);
					this.formatter.addFormattedLinkDay(1, this.linkIsOn, this.linkDayHandlerName, this.openIsOn, autoCloseReallyOn, this.objectName, aDate);
					aDate.setDate(2);
					phase = DAYS_BETWEEN;
				}
				else
				{
					this.formatter.addFormattedDayBlank();
				}
			}
			else if (phase == DAYS_BETWEEN)
			{
				// After using setDate, calling getMonth will
				// verify we're still in the current month
				if (aDate.getMonth() == cdMonth)
				{
					var dayOfMonth = aDate.getDate();
					var autoCloseReallyOn = (this.autoCloseIsOn && this.openIsOn);
					this.formatter.addFormattedLinkDay(dayOfMonth, this.linkIsOn, this.linkDayHandlerName, this.openIsOn, autoCloseReallyOn, this.objectName, aDate);
					aDate.setDate(dayOfMonth + 1);
				}
				else
				{
					this.formatter.addFormattedDayBlank();
					phase = SPACE_AFTER;
				}
			}
			else if (phase == SPACE_AFTER)
			{
				this.formatter.addFormattedDayBlank();
			}
		} // end for cols
		
		this.formatter.endRow();
		
	} // end for rows
	
	this.formatter.concludeCalendarMonth();
	
	return this.formatter.results;

}

/*
 * Set a switch on so days in the calendar will show up as links.
 *
 * The handlerName should be the name of a method that is available
 * from any link that has javascript: in it.
 *
 * It should expect the arguments in the order: month, day, year.
 * Month is the zero based month (from 0 to 11).
 * Day is the number day (from 1 to 31)
 * Year is the full year (example 2002).
 *
 * Right now, it is not set up to call a method within CalendarDisplay,
 * so CalendarDisplay does not know which date link was clicked.
 * That information must be maintained in the implementing logic.
 *
 * v.1.1.0 - new
 */
function setLinkOnCD(handlerName)
{
	this.linkIsOn = true;
	this.linkDayHandlerName = handlerName;
}

/*
 * Set a switch off so days in the calendar will not show up as links.
 *
 * v.1.1.0 - new
 */
function setLinkOffCD()
{
	this.linkIsOn = false;
}

/*
 * Turn navigation on for the month or year calendar.
 *
 * For a month calendar, there will be buttons like << < > >>
 * For a year calendar, there will buttons like << >>
 * which are:
 * << previous year
 * <  previous month
 * >  next month
 * >> next year
 *
 * To include navigation buttons, provide the name of the object that was instantiated.
 *
 * Make sure the calendar object is global by constructing it without a var if it is inside a function.
 * If the object is declared outside a function, then it will be global either way.
 * It needs to be global so the navigation button's onclick event will be able to reference the object.
 *
 * Example:
 * calendarWithNavEx = new CalendarDisplay();
 * calendarWithNavEx.setNavigationOn("calendarWithNavEx");
 *
 * v.1.1.0 - new
 */
function setNavigationOnCD(objectName)
{
	this.navigationIsOn = true;
	this.name = objectName;
	if (this.name == null) this.name = "";
}

/*
 * Turn navigation off.
 *
 * v.1.1.0 - new
 */
function setNavigationOffCD()
{
	this.navigationIsOn = false;
}

/*
 * Set a switch on so the calendar will open in a new window.
 * It will still return the calendar result.
 *
 * v.1.1.0 - new
 */
function setOpenOnCD()
{
	this.openIsOn = true;
}

/*
 * Set a switch off so the calendar will not open in a new window.
 * It will just return the calendar result.
 *
 * v.1.1.0 - new
 */
function setOpenOffCD()
{
	this.openIsOn = false;
}

/*
 * Set that the opened window should be closed when a date is selected.
 *
 * v.1.1.0 - new
 */
function setAutoCloseOnCD()
{
	this.autoCloseIsOn = true;
}

/*
 * Set that the opened window should not be closed when a date is selected.
 *
 * v.1.1.0 - new
 */
function setAutoCloseOffCD()
{
	this.autoCloseIsOn = false;
}

/*
 * CalendarDisplay uses this to construct a CalendarFormatter object
 * which it uses to form the HTML for the calendar.
 *
 * There are other functions in this JavaScript file
 * that act as instance methods for CalendarFormatter.
 */
function CalendarFormatter()
{
	this.results = "";
	
	this.dayChosen = NO_DAY_CALENDAR;

	this.setupCalendarYear = setupCalendarYearCF;
	this.setupCalendarMonth = setupCalendarMonthCF;
	this.concludeCalendarYear = concludeCalendarYearCF;
	this.concludeCalendarMonth = concludeCalendarMonthCF;
	this.addFormattedDay = addFormattedDayCF;
	this.addFormattedLinkDay = addFormattedLinkDayCF;
	this.addFormattedNonDay = addFormattedNonDayCF;
	this.addFormattedDayName = addFormattedDayNameCF;
	this.addFormattedDayBlank = addFormattedDayBlankCF;
	this.startRow = startRowCF;
	this.endRow = endRowCF;
	this.startColumn = startColumnCF;
	this.endColumn = endColumnCF;
	
	this.addNavigation = addNavigationCF;
	this.addNavigationYear = addNavigationYearCF;
	this.getPreviousYearLink = getPreviousYearLinkCF;
	this.getPreviousMonthLink = getPreviousMonthLinkCF;
	this.getNextMonthLink = getNextMonthLinkCF;
	this.getNextYearLink = getNextYearLinkCF;

}

function setupCalendarYearCF(month, year)
{
	this.results = this.results + '<table border="1" cellpadding="5" cellspacing="0">';
}

function setupCalendarMonthCF(month, year)
{
	this.results = this.results + '<table><tr><td colspan="7" align="center">' + MONTHS_CALENDAR[month] + ', ' + year + '</td></tr>';
}

function concludeCalendarYearCF()
{
	this.results = this.results + "</table>";
}

function concludeCalendarMonthCF()
{
	this.results = this.results + "</table>";
}

/*
 * Add a formatted day to the results with no link.
 *
 * This function isn't used internally in CalendarDisplay in v.1.1.0.
 * The code has been moved to addFormattedLinkDay.
 *
 * v.1.1.0 - modified
 */
function addFormattedDayCF(num)
{
	var isLinkOn = false;
	var objectName = ""; // ignored when link is off
	var month; // ignored when link is off
	var day; // ignored when link is off
	var year; // ignored when link is off
	this.addFormattedLinkDay(num, isLinkOn);
}

/*
 * Add a formatted day to the results with a link, if isLinkOn is true.
 * The way the link is constructed, the function specified by handlerName is referenced
 * with the zero based month, day, and full year.
 * Keep in mind the handlerName needs to be referenced globally.
 *
 * Also, it will refer to the opener if isWindowOpen is true,
 * which means the calendar is in an opened window.
 *
 * v.1.1.0 - added
 */
function addFormattedLinkDayCF(num, isLinkOn, handlerName, isWindowOpen, autoCloseIsOn, objectName, aDate)
{
	var linkStart = "";
	var linkEnd = "";
	if (isLinkOn)
	{
		var aYear = aDate.getFullYear();
		var aMonth = aDate.getMonth();
		var aDay = aDate.getDate();
		linkStart = "<a href=\"javascript:"
			+ ((isWindowOpen) ? "window.opener." : "")
			+ handlerName + "("
			+ aMonth + ","
			+ aDay + ","
			+ aYear + ");"
			+ ((autoCloseIsOn) ? "window.close();" : "")
			+ "\">";
		linkEnd = "</a>";
	}
	
	if (num == this.dayChosen)
	{
		this.results = this.results + '<td align="center" bgcolor="yellow"><b>' + linkStart + num + linkEnd + '</b></td>';
	}
	else
	{
		this.results = this.results + '<td align="center">' + linkStart + num + linkEnd + '</td>';
	}
}

function addFormattedNonDayCF(contents)
{
	this.results = this.results + '<td align="center">' + contents + '</td>';
}

function addFormattedDayNameCF(cal, num)
{
	if (cal.dayFormat == cal.ONE_LETTER)
	{
		this.addFormattedNonDay(DAYS_1_CALENDAR[num]);
	}
	else if (cal.dayFormat == cal.TWO_LETTER)
	{
		this.addFormattedNonDay(DAYS_2_CALENDAR[num]);
	}
	else if (cal.dayFormat == cal.THREE_LETTER)
	{
		this.addFormattedNonDay(DAYS_3_CALENDAR[num]);
	}
	else if (cal.dayFormat == cal.FULL_LETTER)
	{
		this.addFormattedNonDay(DAYS_FULL_CALENDAR[num]);
	}
	else
	{
		this.addFormattedNonDay("#ERR");
	}
}

function addFormattedDayBlankCF()
{
	this.addFormattedNonDay("&nbsp;");
}

function startRowCF()
{
	this.results = this.results + "<tr>";
}

function endRowCF()
{
	this.results = this.results + "</tr>";
}

function startColumnCF()
{
	this.results = this.results + "<td>";
}

function endColumnCF()
{
	this.results = this.results + "</td>";
}

function addNavigationCF(aMonth, aYear, aName)
{
	this.results = this.results
		+ "<p><form name=\"navigationCalendar\">"
		+ this.getPreviousYearLink(aMonth, aYear, aName)
		+ "&nbsp;&nbsp;" + this.getPreviousMonthLink(aMonth, aYear, aName)
		+ "&nbsp;&nbsp;" + this.getNextMonthLink(aMonth, aYear, aName)
		+ "&nbsp;&nbsp;" + this.getNextYearLink(aMonth, aYear, aName)
		+ "</form></p>";
}

function addNavigationYearCF(aYear, aName)
{
	var aMonth = NO_NAV_MONTH;
	this.results = this.results
		+ "<p><form name=\"navigationCalendar\">"
		+ this.getPreviousYearLink(aMonth, aYear, aName)
		+ "&nbsp;&nbsp;" + this.getNextYearLink(aMonth, aYear, aName)
		+ "</form></p>";
}

function getPreviousYearLinkCF(aMonth, aYear, aName)
{
	var previousYear = aYear;
	previousYear--;
	var previousYearLink = "<input type=\"button\" value=\"&lt;&lt;\" onclick=\"javascript:window.opener.";
	if (aMonth == NO_NAV_MONTH)
	{
		previousYearLink += aName + ".navigateYear(";
	}
	else
	{
		previousYearLink += aName + ".navigateMonth(" + aMonth + ",";
	}
	previousYearLink += previousYear + ")\" />";
		
	return previousYearLink;
}

function getPreviousMonthLinkCF(aMonth, aYear, aName)
{
	var previousMonth = aMonth;
	var previousYear = aYear;
	previousMonth--;
	if (previousMonth < 0)
	{
		previousMonth = 11;
		previousYear--;
	}
	var previousMonthLink = "<input type=\"button\" value=\"&lt;&nbsp;\" onclick=\"javascript:window.opener."
		+ aName + ".navigateMonth("
		+ previousMonth + ","
		+ previousYear + ")\" />";
		
	return previousMonthLink;
}

function getNextMonthLinkCF(aMonth, aYear, aName)
{
	var nextMonth = aMonth;
	var nextYear = aYear;
	
	// note: use nextMonth++ instead of nextMouth = nextMonth + 1,
	// because the second one treats nextMonth as a string.
	nextMonth++;
	if (nextMonth > 11)
	{
		nextMonth = 0;
		nextYear++;
	}
	var nextMonthLink = "<input type=\"button\" value=\"&nbsp;&gt;\" onclick=\"javascript:window.opener."
		+ aName + ".navigateMonth("
		+ nextMonth + ","
		+ nextYear + ")\" />";
	
	return nextMonthLink;
}

function getNextYearLinkCF(aMonth, aYear, aName)
{
	var nextYear = aYear;
	nextYear++;
	
	var nextYearLink = "<input type=\"button\" value=\"&gt;&gt;\" onclick=\"javascript:window.opener."
	if (aMonth == NO_NAV_MONTH)
	{
		nextYearLink += aName + ".navigateYear(";
	}
	else
	{
		nextYearLink += aName + ".navigateMonth(" + aMonth + ",";
	}
	nextYearLink += nextYear + ")\" />";
		
	return nextYearLink;
}

