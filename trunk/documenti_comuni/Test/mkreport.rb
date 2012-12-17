#####################################################
# ARGV[0] = input tcs
# ARGV[1] = input tr
# ARGV[2] = output
#####################################################
require 'rexml/document'

def ignore_upto(input, exp, &block)
	return nil if input.eof?
	l = nil
	until (l = input.readline.chomp).match(exp)
		if block
			block.yield l
		else
			$stderr.puts("Ignoring line #{l}")
		end
		return nil if input.eof?
	end
	
	return l
end

class TestCase
	attr_reader :tc_name, :tested_uc, :version_date, :version_no, :version_author, :test_matter, :references
	
	def initialize(tc_name, tested_uc, version_date, version_no, version_author, test_matter, references)
		@tc_name = tc_name
		@tested_uc = tested_uc
		@version_date = version_date
		@version_no = version_no
		@version_author = version_author
		@test_matter = test_matter
		@references = references
	end
	
	def self.parse(input)
		#Skip uninteresting lines
		l = ignore_upto(input, /\w+/)
		l.strip!
		
		#First line shall not be xml
		if l[/^<\?xml/]
			raise "XML file given. Input shall be in plain text"
		end
		
		#First line is header
		tc_name = l
		
		#Search line beginning with 1.
		l = ignore_upto(input, /^\s*1\./)
		
		#This is the test case name.
		#TODO check consistency
		
		#Search line beginning with 2.
		ignore_upto(input, /^\s*2\./)	
		ignore_upto(input, /da testare/)
		tested_uc = input.readline.chomp.strip
		
		ignore_upto(input, /version date/i)
		version_date = input.readline.chomp.strip
		
		ignore_upto(input, /Version number/i)
		version_no = input.readline.chomp.strip
		
		ignore_upto(input, /Version author/i)
		version_author = input.readline.chomp.strip
		
		#Search line beginning with 3.
		ignore_upto(input, /^\s*3\./)
		
		test_matter = nil
		ignore_upto(input, /Riferimenti$/i) do |l|
			if test_matter
				test_matter += "\n" + l.strip
			else
				test_matter = l.strip
			end
		end
		
		references = []
		ignore_upto(input, /^s*4\./) do |l|
			references.push(l.strip) if l.strip.length > 0
		end
		references.freeze
		
		#Don't give a fuck about the rest
		return new(tc_name, tested_uc, version_date, version_no, version_author, test_matter, references)
	end
	
	private_class_method :new
end

def escape(s)
	return REXML::Text.new(s).to_s
end

f = File.new(ARGV[1], "r")
l = ignore_upto(f, /\w+/)

unless l[/\[\s*[Xx]\s*\]/]
	#Skip on
	$stderr.puts("Test '#{ARGV[1]}' not performed yet")
	exit 0
end

ignore_upto(f, 'Eventuali anomalie rilevate:')
l = ignore_upto(f, /\w+/)
begin
	if l
		anom = [l.strip]
		ignore_upto(f, /^/) {|l| anom.push(l.strip) if l.strip.length > 0}
	else
		#Skip on
		$stderr.puts("Test '#{ARGV[1]}' succeeded")
		exit 0
	end
ensure
	f.close
end

f = File.new(ARGV[0], "r")
tcs = TestCase.parse(f)
f.close

if ARGV[2] and File.exists? (ARGV[2])
	$stderr.puts("Il file \"#{ARGV[2]}\" esiste gia'.")
end

if ARGV[2]
	f = File.new(ARGV[2], "w")
else
	f = $stdout
end

###################OUTPUT BEGIN############################
f.print <<FODT_HEREDOC_MARKER
<?xml version="1.0" encoding="UTF-8"?>

<office:document xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0" xmlns:ooo="http://openoffice.org/2004/office" xmlns:ooow="http://openoffice.org/2004/writer" xmlns:oooc="http://openoffice.org/2004/calc" xmlns:dom="http://www.w3.org/2001/xml-events" xmlns:xforms="http://www.w3.org/2002/xforms" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rpt="http://openoffice.org/2005/report" xmlns:of="urn:oasis:names:tc:opendocument:xmlns:of:1.2" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:grddl="http://www.w3.org/2003/g/data-view#" xmlns:tableooo="http://openoffice.org/2009/table" xmlns:field="urn:openoffice:names:experimental:ooo-ms-interop:xmlns:field:1.0" xmlns:formx="urn:openoffice:names:experimental:ooxml-odf-interop:xmlns:form:1.0" xmlns:css3t="http://www.w3.org/TR/css3-text/" office:version="1.2" office:mimetype="application/vnd.oasis.opendocument.text">
 <office:meta><meta:creation-date>2012-12-17T20:38:26</meta:creation-date><meta:document-statistic meta:table-count="1" meta:image-count="0" meta:object-count="0" meta:page-count="1" meta:paragraph-count="16" meta:word-count="26" meta:character-count="226" meta:non-whitespace-character-count="216"/><dc:date>2012-12-17T21:23:36</dc:date><meta:editing-duration>PT29M5S</meta:editing-duration><meta:editing-cycles>1</meta:editing-cycles><meta:generator>LibreOffice/3.5$Linux_X86_64 LibreOffice_project/350m1$Build-2</meta:generator></office:meta>
 <office:settings>
  <config:config-item-set config:name="ooo:view-settings">
   <config:config-item config:name="ViewAreaTop" config:type="long">1319</config:config-item>
   <config:config-item config:name="ViewAreaLeft" config:type="long">1693</config:config-item>
   <config:config-item config:name="ViewAreaWidth" config:type="long">21239</config:config-item>
   <config:config-item config:name="ViewAreaHeight" config:type="long">14584</config:config-item>
   <config:config-item config:name="ShowRedlineChanges" config:type="boolean">true</config:config-item>
   <config:config-item config:name="InBrowseMode" config:type="boolean">false</config:config-item>
   <config:config-item-map-indexed config:name="Views">
    <config:config-item-map-entry>
     <config:config-item config:name="ViewId" config:type="string">view2</config:config-item>
     <config:config-item config:name="ViewLeft" config:type="long">5406</config:config-item>
     <config:config-item config:name="ViewTop" config:type="long">14912</config:config-item>
     <config:config-item config:name="VisibleLeft" config:type="long">1693</config:config-item>
     <config:config-item config:name="VisibleTop" config:type="long">1319</config:config-item>
     <config:config-item config:name="VisibleRight" config:type="long">22931</config:config-item>
     <config:config-item config:name="VisibleBottom" config:type="long">15901</config:config-item>
     <config:config-item config:name="ZoomType" config:type="short">0</config:config-item>
     <config:config-item config:name="ViewLayoutColumns" config:type="short">1</config:config-item>
     <config:config-item config:name="ViewLayoutBookMode" config:type="boolean">false</config:config-item>
     <config:config-item config:name="ZoomFactor" config:type="short">80</config:config-item>
     <config:config-item config:name="IsSelectedFrame" config:type="boolean">false</config:config-item>
    </config:config-item-map-entry>
   </config:config-item-map-indexed>
  </config:config-item-set>
  <config:config-item-set config:name="ooo:configuration-settings">
   <config:config-item config:name="PrintTables" config:type="boolean">true</config:config-item>
   <config:config-item config:name="AddParaTableSpacingAtStart" config:type="boolean">true</config:config-item>
   <config:config-item config:name="ChartAutoUpdate" config:type="boolean">true</config:config-item>
   <config:config-item config:name="IsLabelDocument" config:type="boolean">false</config:config-item>
   <config:config-item config:name="MathBaselineAlignment" config:type="boolean">true</config:config-item>
   <config:config-item config:name="OutlineLevelYieldsNumbering" config:type="boolean">false</config:config-item>
   <config:config-item config:name="PrintLeftPages" config:type="boolean">true</config:config-item>
   <config:config-item config:name="AlignTabStopPosition" config:type="boolean">true</config:config-item>
   <config:config-item config:name="DoNotJustifyLinesWithManualBreak" config:type="boolean">false</config:config-item>
   <config:config-item config:name="PrintTextPlaceholder" config:type="boolean">false</config:config-item>
   <config:config-item config:name="UseOldNumbering" config:type="boolean">false</config:config-item>
   <config:config-item config:name="PrintProspectRTL" config:type="boolean">false</config:config-item>
   <config:config-item config:name="ProtectForm" config:type="boolean">false</config:config-item>
   <config:config-item config:name="CurrentDatabaseCommand" config:type="string"/>
   <config:config-item config:name="PrintBlackFonts" config:type="boolean">false</config:config-item>
   <config:config-item config:name="SmallCapsPercentage66" config:type="boolean">false</config:config-item>
   <config:config-item config:name="CharacterCompressionType" config:type="short">0</config:config-item>
   <config:config-item config:name="PrintControls" config:type="boolean">true</config:config-item>
   <config:config-item config:name="PrintHiddenText" config:type="boolean">false</config:config-item>
   <config:config-item config:name="IsKernAsianPunctuation" config:type="boolean">false</config:config-item>
   <config:config-item config:name="UseFormerTextWrapping" config:type="boolean">false</config:config-item>
   <config:config-item config:name="PrintProspect" config:type="boolean">false</config:config-item>
   <config:config-item config:name="PrintEmptyPages" config:type="boolean">true</config:config-item>
   <config:config-item config:name="UnbreakableNumberings" config:type="boolean">false</config:config-item>
   <config:config-item config:name="UseFormerObjectPositioning" config:type="boolean">false</config:config-item>
   <config:config-item config:name="PrintReversed" config:type="boolean">false</config:config-item>
   <config:config-item config:name="TabsRelativeToIndent" config:type="boolean">true</config:config-item>
   <config:config-item config:name="TableRowKeep" config:type="boolean">false</config:config-item>
   <config:config-item config:name="ConsiderTextWrapOnObjPos" config:type="boolean">false</config:config-item>
   <config:config-item config:name="PrintRightPages" config:type="boolean">true</config:config-item>
   <config:config-item config:name="PrintPaperFromSetup" config:type="boolean">false</config:config-item>
   <config:config-item config:name="AddFrameOffsets" config:type="boolean">false</config:config-item>
   <config:config-item config:name="UpdateFromTemplate" config:type="boolean">true</config:config-item>
   <config:config-item config:name="AddParaSpacingToTableCells" config:type="boolean">true</config:config-item>
   <config:config-item config:name="PrintSingleJobs" config:type="boolean">false</config:config-item>
   <config:config-item config:name="AddExternalLeading" config:type="boolean">true</config:config-item>
   <config:config-item config:name="PrinterIndependentLayout" config:type="string">high-resolution</config:config-item>
   <config:config-item config:name="LinkUpdateMode" config:type="short">1</config:config-item>
   <config:config-item config:name="PrintAnnotationMode" config:type="short">0</config:config-item>
   <config:config-item config:name="UseOldPrinterMetrics" config:type="boolean">false</config:config-item>
   <config:config-item config:name="RedlineProtectionKey" config:type="base64Binary"/>
   <config:config-item config:name="PrinterName" config:type="string"/>
   <config:config-item config:name="CollapseEmptyCellPara" config:type="boolean">true</config:config-item>
   <config:config-item config:name="PrinterSetup" config:type="base64Binary"/>
   <config:config-item config:name="IgnoreFirstLineIndentInNumbering" config:type="boolean">false</config:config-item>
   <config:config-item config:name="InvertBorderSpacing" config:type="boolean">false</config:config-item>
   <config:config-item config:name="PrintPageBackground" config:type="boolean">true</config:config-item>
   <config:config-item config:name="DoNotCaptureDrawObjsOnPage" config:type="boolean">false</config:config-item>
   <config:config-item config:name="TabOverflow" config:type="boolean">true</config:config-item>
   <config:config-item config:name="ApplyUserData" config:type="boolean">true</config:config-item>
   <config:config-item config:name="TabAtLeftIndentForParagraphsInList" config:type="boolean">false</config:config-item>
   <config:config-item config:name="UnxForceZeroExtLeading" config:type="boolean">false</config:config-item>
   <config:config-item config:name="SaveVersionOnClose" config:type="boolean">false</config:config-item>
   <config:config-item config:name="PrintFaxName" config:type="string"/>
   <config:config-item config:name="PrintDrawings" config:type="boolean">true</config:config-item>
   <config:config-item config:name="AddParaTableSpacing" config:type="boolean">true</config:config-item>
   <config:config-item config:name="LoadReadonly" config:type="boolean">false</config:config-item>
   <config:config-item config:name="PrintGraphics" config:type="boolean">true</config:config-item>
   <config:config-item config:name="FieldAutoUpdate" config:type="boolean">true</config:config-item>
   <config:config-item config:name="AllowPrintJobCancel" config:type="boolean">true</config:config-item>
   <config:config-item config:name="SaveGlobalDocumentLinks" config:type="boolean">false</config:config-item>
   <config:config-item config:name="CurrentDatabaseDataSource" config:type="string"/>
   <config:config-item config:name="UseFormerLineSpacing" config:type="boolean">false</config:config-item>
   <config:config-item config:name="IgnoreTabsAndBlanksForLineCalculation" config:type="boolean">false</config:config-item>
   <config:config-item config:name="CurrentDatabaseCommandType" config:type="int">0</config:config-item>
   <config:config-item config:name="DoNotResetParaAttrsForNumFont" config:type="boolean">false</config:config-item>
   <config:config-item config:name="ClipAsCharacterAnchoredWriterFlyFrames" config:type="boolean">false</config:config-item>
  </config:config-item-set>
 </office:settings>
 <office:scripts>
  <office:script script:language="ooo:Basic">
   <ooo:libraries xmlns:ooo="http://openoffice.org/2004/office" xmlns:xlink="http://www.w3.org/1999/xlink">
    <ooo:library-embedded ooo:name="Standard"/>
   </ooo:libraries>
  </office:script>
 </office:scripts>
 <office:font-face-decls>
  <style:font-face style:name="Lohit Hindi1" svg:font-family="&apos;Lohit Hindi&apos;"/>
  <style:font-face style:name="OpenSymbol" svg:font-family="OpenSymbol"/>
  <style:font-face style:name="Courier 10 Pitch" svg:font-family="&apos;Courier 10 Pitch&apos;" style:font-adornments="Standard" style:font-pitch="fixed"/>
  <style:font-face style:name="Courier New" svg:font-family="&apos;Courier New&apos;" style:font-adornments="Normale" style:font-family-generic="modern" style:font-pitch="fixed"/>
  <style:font-face style:name="Droid Sans Fallback1" svg:font-family="&apos;Droid Sans Fallback&apos;" style:font-family-generic="modern" style:font-pitch="fixed"/>
  <style:font-face style:name="Droid Sans Mono" svg:font-family="&apos;Droid Sans Mono&apos;" style:font-family-generic="modern" style:font-pitch="fixed"/>
  <style:font-face style:name="Lohit Hindi2" svg:font-family="&apos;Lohit Hindi&apos;" style:font-family-generic="modern" style:font-pitch="fixed"/>
  <style:font-face style:name="Times New Roman" svg:font-family="&apos;Times New Roman&apos;" style:font-family-generic="roman" style:font-pitch="variable"/>
  <style:font-face style:name="Times New Roman2" svg:font-family="&apos;Times New Roman&apos;" style:font-adornments="Grassetto" style:font-family-generic="roman" style:font-pitch="variable"/>
  <style:font-face style:name="Times New Roman3" svg:font-family="&apos;Times New Roman&apos;" style:font-adornments="Grassetto Corsivo" style:font-family-generic="roman" style:font-pitch="variable"/>
  <style:font-face style:name="Times New Roman1" svg:font-family="&apos;Times New Roman&apos;" style:font-adornments="Normale" style:font-family-generic="roman" style:font-pitch="variable"/>
  <style:font-face style:name="Droid Sans Fallback" svg:font-family="&apos;Droid Sans Fallback&apos;" style:font-family-generic="system" style:font-pitch="variable"/>
  <style:font-face style:name="Lohit Hindi" svg:font-family="&apos;Lohit Hindi&apos;" style:font-family-generic="system" style:font-pitch="variable"/>
 </office:font-face-decls>
 <office:styles>
  <style:default-style style:family="graphic">
   <style:graphic-properties svg:stroke-color="#808080" draw:fill-color="#cfe7f5" fo:wrap-option="no-wrap" draw:shadow-offset-x="0.3cm" draw:shadow-offset-y="0.3cm" draw:start-line-spacing-horizontal="0.283cm" draw:start-line-spacing-vertical="0.283cm" draw:end-line-spacing-horizontal="0.283cm" draw:end-line-spacing-vertical="0.283cm" style:flow-with-text="false"/>
   <style:paragraph-properties style:text-autospace="ideograph-alpha" style:line-break="strict" style:writing-mode="lr-tb" style:font-independent-line-spacing="false">
    <style:tab-stops/>
   </style:paragraph-properties>
   <style:text-properties style:use-window-font-color="true" fo:font-size="12pt" fo:language="it" fo:country="IT" style:letter-kerning="true" style:font-size-asian="10.5pt" style:language-asian="zh" style:country-asian="CN" style:font-size-complex="12pt" style:language-complex="hi" style:country-complex="IN"/>
  </style:default-style>
  <style:default-style style:family="paragraph">
   <style:paragraph-properties fo:hyphenation-ladder-count="no-limit" style:text-autospace="ideograph-alpha" style:punctuation-wrap="hanging" style:line-break="strict" style:tab-stop-distance="1.251cm" style:writing-mode="page"/>
   <style:text-properties style:use-window-font-color="true" style:font-name="Times New Roman" fo:font-size="12pt" fo:language="it" fo:country="IT" style:letter-kerning="true" style:font-name-asian="Droid Sans Fallback" style:font-size-asian="10.5pt" style:language-asian="zh" style:country-asian="CN" style:font-name-complex="Lohit Hindi" style:font-size-complex="12pt" style:language-complex="hi" style:country-complex="IN" fo:hyphenate="false" fo:hyphenation-remain-char-count="2" fo:hyphenation-push-char-count="2"/>
  </style:default-style>
  <style:default-style style:family="table">
   <style:table-properties table:border-model="collapsing"/>
  </style:default-style>
  <style:default-style style:family="table-row">
   <style:table-row-properties fo:keep-together="auto"/>
  </style:default-style>
  <style:style style:name="Standard" style:family="paragraph" style:class="text"/>
  <style:style style:name="Heading" style:family="paragraph" style:parent-style-name="Standard" style:next-style-name="Text_20_body" style:class="text">
   <style:paragraph-properties fo:margin-top="0.423cm" fo:margin-bottom="0.212cm" fo:keep-with-next="always"/>
   <style:text-properties style:font-name="Times New Roman1" fo:font-size="14pt" style:font-name-asian="Droid Sans Fallback" style:font-size-asian="14pt" style:font-name-complex="Lohit Hindi" style:font-size-complex="14pt"/>
  </style:style>
  <style:style style:name="Text_20_body" style:display-name="Text body" style:family="paragraph" style:parent-style-name="Standard" style:class="text" style:master-page-name="">
   <style:paragraph-properties fo:margin="100%" fo:margin-left="0cm" fo:margin-right="0cm" fo:margin-top="0cm" fo:margin-bottom="0.212cm" fo:text-align="justify" style:justify-single-word="true" fo:orphans="2" fo:widows="2" fo:hyphenation-ladder-count="1" fo:text-indent="0.499cm" style:auto-text-indent="false" style:page-number="auto" fo:background-color="transparent" style:shadow="none">
    <style:tab-stops/>
    <style:background-image/>
   </style:paragraph-properties>
   <style:text-properties fo:hyphenate="false" fo:hyphenation-remain-char-count="3" fo:hyphenation-push-char-count="3"/>
  </style:style>
  <style:style style:name="List" style:family="paragraph" style:parent-style-name="Text_20_body" style:class="list">
   <style:text-properties style:font-size-asian="12pt" style:font-name-complex="Lohit Hindi1"/>
  </style:style>
  <style:style style:name="Caption" style:family="paragraph" style:parent-style-name="Standard" style:class="extra">
   <style:paragraph-properties fo:margin-top="0.212cm" fo:margin-bottom="0.212cm" text:number-lines="false" text:line-number="0"/>
   <style:text-properties fo:font-size="12pt" fo:font-style="italic" style:font-size-asian="12pt" style:font-style-asian="italic" style:font-name-complex="Lohit Hindi1" style:font-size-complex="12pt" style:font-style-complex="italic"/>
  </style:style>
  <style:style style:name="Index" style:family="paragraph" style:parent-style-name="Standard" style:class="index">
   <style:paragraph-properties text:number-lines="false" text:line-number="0"/>
   <style:text-properties style:font-size-asian="12pt" style:font-name-complex="Lohit Hindi1"/>
  </style:style>
  <style:style style:name="Intestazioni_20_prima_20_pagina" style:display-name="Intestazioni prima pagina" style:family="paragraph" style:parent-style-name="Standard" style:master-page-name="">
   <style:paragraph-properties fo:margin-top="0.3cm" fo:margin-bottom="0cm" fo:line-height="150%" fo:text-align="end" style:justify-single-word="false" style:page-number="auto"/>
   <style:text-properties fo:letter-spacing="0.035cm" style:font-size-asian="10.5pt"/>
  </style:style>
  <style:style style:name="Table_20_Contents" style:display-name="Table Contents" style:family="paragraph" style:parent-style-name="Standard" style:class="extra">
   <style:paragraph-properties text:number-lines="false" text:line-number="0"/>
  </style:style>
  <style:style style:name="Table_20_Heading" style:display-name="Table Heading" style:family="paragraph" style:parent-style-name="Table_20_Contents" style:class="extra">
   <style:paragraph-properties fo:text-align="center" style:justify-single-word="false" text:number-lines="false" text:line-number="0"/>
   <style:text-properties fo:font-weight="bold" style:font-weight-asian="bold" style:font-weight-complex="bold"/>
  </style:style>
  <style:style style:name="Title" style:family="paragraph" style:parent-style-name="Heading" style:next-style-name="Subtitle" style:class="chapter" style:master-page-name="">
   <style:paragraph-properties fo:margin-top="0.621cm" fo:margin-bottom="0.21cm" fo:text-align="center" style:justify-single-word="false" style:page-number="auto" fo:break-before="auto" fo:break-after="auto"/>
   <style:text-properties style:font-name="Times New Roman2" fo:font-size="48pt" fo:font-weight="bold" style:font-size-asian="18pt" style:font-weight-asian="bold" style:font-size-complex="18pt" style:font-weight-complex="bold"/>
  </style:style>
  <style:style style:name="Subtitle" style:family="paragraph" style:parent-style-name="Heading" style:next-style-name="Text_20_body" style:class="chapter">
   <style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
   <style:text-properties fo:font-size="14pt" fo:font-style="italic" style:font-size-asian="14pt" style:font-style-asian="italic" style:font-size-complex="14pt" style:font-style-complex="italic"/>
  </style:style>
  <style:style style:name="Footer" style:family="paragraph" style:parent-style-name="Standard" style:class="extra">
   <style:paragraph-properties text:number-lines="false" text:line-number="0">
    <style:tab-stops>
     <style:tab-stop style:position="8.5cm" style:type="center"/>
     <style:tab-stop style:position="17cm" style:type="right"/>
    </style:tab-stops>
   </style:paragraph-properties>
  </style:style>
  <style:style style:name="Contents_20_Heading" style:display-name="Contents Heading" style:family="paragraph" style:parent-style-name="Heading" style:class="index" style:master-page-name="">
   <style:paragraph-properties fo:margin="100%" fo:margin-left="0cm" fo:margin-right="0cm" fo:margin-top="0cm" fo:margin-bottom="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false" style:page-number="auto" text:number-lines="false" text:line-number="0">
    <style:tab-stops/>
   </style:paragraph-properties>
   <style:text-properties fo:font-size="16pt" fo:font-weight="bold" style:font-size-asian="16pt" style:font-weight-asian="bold" style:font-size-complex="16pt" style:font-weight-complex="bold"/>
  </style:style>
  <style:style style:name="Heading_20_1" style:display-name="Heading 1" style:family="paragraph" style:parent-style-name="Heading" style:next-style-name="Text_20_body" style:default-outline-level="1" style:class="text" style:master-page-name="">
   <style:paragraph-properties fo:orphans="0" fo:widows="0" style:page-number="auto" fo:break-before="page" fo:background-color="transparent" style:shadow="none">
    <style:tab-stops/>
    <style:background-image/>
   </style:paragraph-properties>
   <style:text-properties style:font-name="Times New Roman2" fo:font-size="115%" fo:font-weight="bold" style:font-size-asian="115%" style:font-weight-asian="bold" style:font-size-complex="115%" style:font-weight-complex="bold"/>
  </style:style>
  <style:style style:name="Heading_20_2" style:display-name="Heading 2" style:family="paragraph" style:parent-style-name="Heading" style:next-style-name="Text_20_body" style:default-outline-level="2" style:class="text" style:master-page-name="">
   <style:paragraph-properties fo:margin="100%" fo:margin-left="0.76cm" fo:margin-right="0cm" fo:margin-top="0.42cm" fo:margin-bottom="0.21cm" fo:text-indent="-0.66cm" style:auto-text-indent="false" style:page-number="auto">
    <style:tab-stops/>
   </style:paragraph-properties>
   <style:text-properties style:font-name="Times New Roman3" fo:font-size="14pt" fo:font-style="normal" fo:font-weight="bold" style:font-size-asian="14pt" style:font-style-asian="italic" style:font-weight-asian="bold" style:font-size-complex="14pt" style:font-style-complex="italic" style:font-weight-complex="bold"/>
  </style:style>
  <style:style style:name="Heading_20_3" style:display-name="Heading 3" style:family="paragraph" style:parent-style-name="Heading" style:next-style-name="Text_20_body" style:default-outline-level="3" style:class="text">
   <style:paragraph-properties fo:margin="100%" fo:margin-left="0.76cm" fo:margin-right="0cm" fo:margin-top="0.319cm" fo:margin-bottom="0.21cm" fo:text-indent="-0.559cm" style:auto-text-indent="false">
    <style:tab-stops/>
   </style:paragraph-properties>
   <style:text-properties style:font-name="Times New Roman2" fo:font-size="14pt" fo:font-weight="bold" style:font-size-asian="14pt" style:font-weight-asian="bold" style:font-size-complex="14pt" style:font-weight-complex="bold"/>
  </style:style>
  <style:style style:name="Heading_20_4" style:display-name="Heading 4" style:family="paragraph" style:parent-style-name="Heading" style:next-style-name="Text_20_body" style:default-outline-level="4" style:class="text">
   <style:paragraph-properties fo:margin="100%" fo:margin-left="0.76cm" fo:margin-right="0cm" fo:margin-top="0.21cm" fo:margin-bottom="0.21cm" fo:text-indent="-0.46cm" style:auto-text-indent="false">
    <style:tab-stops/>
   </style:paragraph-properties>
   <style:text-properties fo:font-size="85%" fo:font-style="italic" fo:font-weight="bold" style:font-size-asian="85%" style:font-style-asian="italic" style:font-weight-asian="bold" style:font-size-complex="85%" style:font-style-complex="italic" style:font-weight-complex="bold"/>
  </style:style>
  <style:style style:name="Intestazione_20_Fuori_20_Indice" style:display-name="Intestazione Fuori Indice" style:family="paragraph" style:parent-style-name="Heading_20_1" style:next-style-name="Text_20_body" style:default-outline-level="" style:list-style-name="">
   <style:paragraph-properties fo:text-align="center" style:justify-single-word="false">
    <style:tab-stops/>
   </style:paragraph-properties>
  </style:style>
  <style:style style:name="Contents_20_1" style:display-name="Contents 1" style:family="paragraph" style:parent-style-name="Index" style:class="index">
   <style:paragraph-properties fo:margin="100%" fo:margin-left="0cm" fo:margin-right="0cm" fo:margin-top="0cm" fo:margin-bottom="0cm" fo:text-indent="0cm" style:auto-text-indent="false">
    <style:tab-stops>
     <style:tab-stop style:position="17cm" style:type="right" style:leader-style="dotted" style:leader-text="."/>
    </style:tab-stops>
   </style:paragraph-properties>
  </style:style>
  <style:style style:name="Contenuto_20_allineato" style:display-name="Contenuto allineato" style:family="paragraph" style:parent-style-name="Table_20_Contents" style:master-page-name="">
   <style:paragraph-properties fo:margin-top="0.049cm" fo:margin-bottom="0cm" fo:text-align="start" style:justify-single-word="false" style:page-number="auto" style:vertical-align="baseline"/>
   <style:text-properties style:font-name="Courier New" fo:font-weight="normal" style:font-size-asian="10.5pt"/>
  </style:style>
  <style:style style:name="Numero_20_di_20_versione" style:display-name="Numero di versione" style:family="paragraph" style:parent-style-name="Contenuto_20_allineato">
   <style:paragraph-properties fo:text-align="end" style:justify-single-word="false"/>
   <style:text-properties fo:font-weight="bold" style:font-size-asian="10.5pt"/>
  </style:style>
  <style:style style:name="Table" style:family="paragraph" style:parent-style-name="Caption" style:class="extra"/>
  <style:style style:name="Bibliography_20_Heading" style:display-name="Bibliography Heading" style:family="paragraph" style:parent-style-name="Heading" style:class="index">
   <style:paragraph-properties fo:margin="100%" fo:margin-left="0cm" fo:margin-right="0cm" fo:margin-top="0cm" fo:margin-bottom="0cm" fo:text-indent="0cm" style:auto-text-indent="false" text:number-lines="false" text:line-number="0"/>
   <style:text-properties fo:font-size="16pt" fo:font-weight="bold" style:font-size-asian="16pt" style:font-weight-asian="bold" style:font-size-complex="16pt" style:font-weight-complex="bold"/>
  </style:style>
  <style:style style:name="Bibliography_20_1" style:display-name="Bibliography 1" style:family="paragraph" style:parent-style-name="Index" style:class="index">
   <style:paragraph-properties fo:margin="100%" fo:margin-left="0.3cm" fo:margin-right="0cm" fo:margin-top="0cm" fo:margin-bottom="0.101cm" fo:text-indent="-0.3cm" style:auto-text-indent="false">
    <style:tab-stops>
     <style:tab-stop style:position="17cm" style:type="right" style:leader-style="dotted" style:leader-text="."/>
    </style:tab-stops>
   </style:paragraph-properties>
  </style:style>
  <style:style style:name="Definizione_20_Nome" style:display-name="Definizione Nome" style:family="paragraph" style:parent-style-name="Table_20_Contents" style:next-style-name="Definizione_20_Valore">
   <style:paragraph-properties fo:margin="100%" fo:margin-left="0cm" fo:margin-right="0cm" fo:margin-top="0cm" fo:margin-bottom="0cm" fo:text-indent="0.3cm" style:auto-text-indent="false">
    <style:tab-stops/>
   </style:paragraph-properties>
   <style:text-properties fo:font-style="italic" fo:font-weight="bold" style:font-size-asian="10.5pt"/>
  </style:style>
  <style:style style:name="Definizione_20_Valore" style:display-name="Definizione Valore" style:family="paragraph" style:parent-style-name="Table_20_Contents" style:next-style-name="Table_20_Contents" style:master-page-name="">
   <style:paragraph-properties fo:margin="100%" fo:margin-left="0.6cm" fo:margin-right="0cm" fo:margin-top="0cm" fo:margin-bottom="0.31cm" fo:widows="2" fo:text-indent="0cm" style:auto-text-indent="false" style:page-number="auto"/>
   <style:text-properties style:font-size-asian="10.5pt"/>
  </style:style>
  <style:style style:name="Header" style:family="paragraph" style:parent-style-name="Standard" style:class="extra">
   <style:paragraph-properties text:number-lines="false" text:line-number="0">
    <style:tab-stops>
     <style:tab-stop style:position="8.5cm" style:type="center"/>
     <style:tab-stop style:position="17cm" style:type="right"/>
    </style:tab-stops>
   </style:paragraph-properties>
  </style:style>
  <style:style style:name="Contents_20_2" style:display-name="Contents 2" style:family="paragraph" style:parent-style-name="Index" style:class="index">
   <style:paragraph-properties fo:margin="100%" fo:margin-left="0.499cm" fo:margin-right="0cm" fo:margin-top="0cm" fo:margin-bottom="0cm" fo:text-indent="0cm" style:auto-text-indent="false">
    <style:tab-stops>
     <style:tab-stop style:position="16.501cm" style:type="right" style:leader-style="dotted" style:leader-text="."/>
    </style:tab-stops>
   </style:paragraph-properties>
  </style:style>
  <style:style style:name="Contents_20_3" style:display-name="Contents 3" style:family="paragraph" style:parent-style-name="Index" style:class="index">
   <style:paragraph-properties fo:margin="100%" fo:margin-left="0.998cm" fo:margin-right="0cm" fo:margin-top="0cm" fo:margin-bottom="0cm" fo:text-indent="0cm" style:auto-text-indent="false">
    <style:tab-stops>
     <style:tab-stop style:position="16.002cm" style:type="right" style:leader-style="dotted" style:leader-text="."/>
    </style:tab-stops>
   </style:paragraph-properties>
  </style:style>
  <style:style style:name="Heading_20_5" style:display-name="Heading 5" style:family="paragraph" style:parent-style-name="Heading" style:next-style-name="Text_20_body" style:default-outline-level="5" style:class="text">
   <style:paragraph-properties fo:margin="100%" fo:margin-left="0.76cm" fo:margin-right="0cm" fo:margin-top="0.101cm" fo:margin-bottom="0.21cm" fo:text-indent="-0.259cm" style:auto-text-indent="false">
    <style:tab-stops/>
   </style:paragraph-properties>
   <style:text-properties fo:font-size="85%" fo:font-weight="bold" style:font-size-asian="85%" style:font-weight-asian="bold" style:font-size-complex="85%" style:font-weight-complex="bold"/>
  </style:style>
  <style:style style:name="Contents_20_4" style:display-name="Contents 4" style:family="paragraph" style:parent-style-name="Index" style:class="index">
   <style:paragraph-properties fo:margin="100%" fo:margin-left="1.498cm" fo:margin-right="0cm" fo:margin-top="0cm" fo:margin-bottom="0cm" fo:text-indent="0cm" style:auto-text-indent="false">
    <style:tab-stops>
     <style:tab-stop style:position="15.503cm" style:type="right" style:leader-style="dotted" style:leader-text="."/>
    </style:tab-stops>
   </style:paragraph-properties>
  </style:style>
  <style:style style:name="Spacer" style:family="paragraph" style:parent-style-name="Text_20_body">
   <style:paragraph-properties fo:margin="100%" fo:margin-left="0cm" fo:margin-right="0cm" fo:margin-top="0cm" fo:margin-bottom="0cm" fo:line-height="0.3cm" fo:text-indent="0cm" style:auto-text-indent="false"/>
  </style:style>
  <style:style style:name="Heading_20_6" style:display-name="Heading 6" style:family="paragraph" style:parent-style-name="Heading" style:next-style-name="Text_20_body" style:default-outline-level="6" style:class="text">
   <style:text-properties fo:font-size="75%" fo:font-weight="bold" style:font-size-asian="75%" style:font-weight-asian="bold" style:font-size-complex="75%" style:font-weight-complex="bold"/>
  </style:style>
  <style:style style:name="Heading_20_7" style:display-name="Heading 7" style:family="paragraph" style:parent-style-name="Heading" style:next-style-name="Text_20_body" style:default-outline-level="7" style:class="text">
   <style:text-properties fo:font-size="75%" fo:font-weight="bold" style:font-size-asian="75%" style:font-weight-asian="bold" style:font-size-complex="75%" style:font-weight-complex="bold"/>
  </style:style>
  <style:style style:name="Heading_20_8" style:display-name="Heading 8" style:family="paragraph" style:parent-style-name="Heading" style:next-style-name="Text_20_body" style:default-outline-level="8" style:class="text">
   <style:text-properties fo:font-size="75%" fo:font-weight="bold" style:font-size-asian="75%" style:font-weight-asian="bold" style:font-size-complex="75%" style:font-weight-complex="bold"/>
  </style:style>
  <style:style style:name="Heading_20_9" style:display-name="Heading 9" style:family="paragraph" style:parent-style-name="Heading" style:next-style-name="Text_20_body" style:default-outline-level="9" style:class="text">
   <style:text-properties fo:font-size="75%" fo:font-weight="bold" style:font-size-asian="75%" style:font-weight-asian="bold" style:font-size-complex="75%" style:font-weight-complex="bold"/>
  </style:style>
  <style:style style:name="Heading_20_10" style:display-name="Heading 10" style:family="paragraph" style:parent-style-name="Heading" style:next-style-name="Text_20_body" style:default-outline-level="10" style:class="text">
   <style:text-properties fo:font-size="75%" fo:font-weight="bold" style:font-size-asian="75%" style:font-weight-asian="bold" style:font-size-complex="75%" style:font-weight-complex="bold"/>
  </style:style>
  <style:style style:name="Intestazione_20_1_20_non_20_numerata" style:display-name="Intestazione 1 non numerata" style:family="paragraph" style:parent-style-name="Heading_20_1" style:default-outline-level="1" style:list-style-name=""/>
  <style:style style:name="Internet_20_link" style:display-name="Internet link" style:family="text">
   <style:text-properties fo:color="#000080" fo:language="zxx" fo:country="none" style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" style:language-asian="zxx" style:country-asian="none" style:language-complex="zxx" style:country-complex="none"/>
  </style:style>
  <style:style style:name="Index_20_Link" style:display-name="Index Link" style:family="text"/>
  <style:style style:name="Bullet_20_Symbols" style:display-name="Bullet Symbols" style:family="text">
   <style:text-properties style:font-name="OpenSymbol" style:font-name-asian="OpenSymbol" style:font-name-complex="OpenSymbol"/>
  </style:style>
  <style:style style:name="Numbering_20_Symbols" style:display-name="Numbering Symbols" style:family="text"/>
  <style:style style:name="Emphasis" style:family="text">
   <style:text-properties fo:font-style="italic" style:font-style-asian="italic" style:font-style-complex="italic"/>
  </style:style>
  <style:style style:name="Strong_20_Emphasis" style:display-name="Strong Emphasis" style:family="text">
   <style:text-properties fo:font-weight="bold" style:font-weight-asian="bold" style:font-weight-complex="bold"/>
  </style:style>
  <style:style style:name="Monospace" style:family="text">
   <style:text-properties style:font-name="Courier 10 Pitch" style:font-size-asian="10.5pt"/>
  </style:style>
  <style:style style:name="Example" style:family="text">
   <style:text-properties style:font-name="Droid Sans Mono" style:font-name-asian="Droid Sans Fallback1" style:font-name-complex="Lohit Hindi2"/>
  </style:style>
  <text:outline-style style:name="Outline">
   <text:outline-level-style text:level="1" style:num-format="">
    <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
     <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="0.762cm" fo:text-indent="-0.762cm" fo:margin-left="0.762cm"/>
    </style:list-level-properties>
   </text:outline-level-style>
   <text:outline-level-style text:level="2" style:num-format="">
    <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
     <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="1.016cm" fo:text-indent="-1.016cm" fo:margin-left="1.016cm"/>
    </style:list-level-properties>
   </text:outline-level-style>
   <text:outline-level-style text:level="3" style:num-format="">
    <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
     <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="1.27cm" fo:text-indent="-1.27cm" fo:margin-left="1.27cm"/>
    </style:list-level-properties>
   </text:outline-level-style>
   <text:outline-level-style text:level="4" style:num-format="">
    <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
     <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="1.524cm" fo:text-indent="-1.524cm" fo:margin-left="1.524cm"/>
    </style:list-level-properties>
   </text:outline-level-style>
   <text:outline-level-style text:level="5" style:num-format="">
    <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
     <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="1.778cm" fo:text-indent="-1.778cm" fo:margin-left="1.778cm"/>
    </style:list-level-properties>
   </text:outline-level-style>
   <text:outline-level-style text:level="6" style:num-format="">
    <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
     <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="2.032cm" fo:text-indent="-2.032cm" fo:margin-left="2.032cm"/>
    </style:list-level-properties>
   </text:outline-level-style>
   <text:outline-level-style text:level="7" style:num-format="">
    <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
     <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="2.286cm" fo:text-indent="-2.286cm" fo:margin-left="2.286cm"/>
    </style:list-level-properties>
   </text:outline-level-style>
   <text:outline-level-style text:level="8" style:num-format="">
    <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
     <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="2.54cm" fo:text-indent="-2.54cm" fo:margin-left="2.54cm"/>
    </style:list-level-properties>
   </text:outline-level-style>
   <text:outline-level-style text:level="9" style:num-format="">
    <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
     <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="2.794cm" fo:text-indent="-2.794cm" fo:margin-left="2.794cm"/>
    </style:list-level-properties>
   </text:outline-level-style>
   <text:outline-level-style text:level="10" style:num-format="">
    <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
     <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="3.048cm" fo:text-indent="-3.048cm" fo:margin-left="3.048cm"/>
    </style:list-level-properties>
   </text:outline-level-style>
  </text:outline-style>
  <text:notes-configuration text:note-class="footnote" style:num-format="1" text:start-value="0" text:footnotes-position="page" text:start-numbering-at="document"/>
  <text:notes-configuration text:note-class="endnote" style:num-format="i" text:start-value="0"/>
  <text:linenumbering-configuration text:number-lines="false" text:offset="0.499cm" style:num-format="1" text:number-position="left" text:increment="5"/>
 </office:styles>
 <office:automatic-styles>
  <style:style style:name="Tabella1" style:family="table">
   <style:table-properties style:width="17cm" table:align="margins"/>
  </style:style>
  <style:style style:name="Tabella1.A" style:family="table-column">
   <style:table-column-properties style:column-width="17cm" style:rel-column-width="9638*"/>
  </style:style>
  <style:style style:name="Tabella1.A1" style:family="table-cell">
   <style:table-cell-properties fo:padding="0.097cm" fo:border="none"/>
  </style:style>
  <style:page-layout style:name="pm1">
   <style:page-layout-properties fo:page-width="21.001cm" fo:page-height="29.7cm" style:num-format="1" style:print-orientation="portrait" fo:margin="2cm" fo:margin-top="2cm" fo:margin-bottom="2cm" fo:margin-left="2cm" fo:margin-right="2cm" style:writing-mode="lr-tb" style:footnote-max-height="0cm">
    <style:footnote-sep style:width="0.018cm" style:distance-before-sep="0.101cm" style:distance-after-sep="0.101cm" style:line-style="solid" style:adjustment="left" style:rel-width="25%" style:color="#000000"/>
   </style:page-layout-properties>
   <style:header-style/>
   <style:footer-style/>
  </style:page-layout>
 </office:automatic-styles>
 <office:master-styles>
  <style:master-page style:name="Standard" style:page-layout-name="pm1"/>
 </office:master-styles>
 <office:body>
  <office:text>
   <text:sequence-decls>
    <text:sequence-decl text:display-outline-level="0" text:name="Illustration"/>
    <text:sequence-decl text:display-outline-level="0" text:name="Table"/>
    <text:sequence-decl text:display-outline-level="0" text:name="Text"/>
    <text:sequence-decl text:display-outline-level="0" text:name="Drawing"/>
   </text:sequence-decls>
   <text:h text:style-name="Heading_20_3" text:outline-level="3">#{escape(tcs.tc_name)}</text:h>
   <text:h text:style-name="Heading_20_4" text:outline-level="4">Test Case Specification Identifier</text:h>
   <table:table table:name="Tabella1" table:style-name="Tabella1">
    <table:table-column table:style-name="Tabella1.A"/>
    <table:table-row>
     <table:table-cell table:style-name="Tabella1.A1" office:value-type="string">
      <text:p text:style-name="Definizione_20_Nome">Caso d&apos;uso da testare</text:p>
      <text:p text:style-name="Definizione_20_Valore">#{escape(tcs.tested_uc)}</text:p>
     </table:table-cell>
    </table:table-row>
    <table:table-row>
     <table:table-cell table:style-name="Tabella1.A1" office:value-type="string">
      <text:p text:style-name="Definizione_20_Nome">Version date</text:p>
      <text:p text:style-name="Definizione_20_Valore">#{escape(tcs.version_date)}</text:p>
     </table:table-cell>
    </table:table-row>
    <table:table-row>
     <table:table-cell table:style-name="Tabella1.A1" office:value-type="string">
      <text:p text:style-name="Definizione_20_Nome">Version number</text:p>
      <text:p text:style-name="Definizione_20_Valore">#{escape(tcs.version_no)}</text:p>
     </table:table-cell>
    </table:table-row>
    <table:table-row>
     <table:table-cell table:style-name="Tabella1.A1" office:value-type="string">
      <text:p text:style-name="Definizione_20_Nome">Version author</text:p>
      <text:p text:style-name="Definizione_20_Valore">#{escape(tcs.version_author)}</text:p>
     </table:table-cell>
    </table:table-row>
   </table:table>
   <text:h text:style-name="Heading_20_4" text:outline-level="4">Elementi testati</text:h>
   <text:p text:style-name="Text_20_body">#{escape(tcs.test_matter)}</text:p>
   <text:h text:style-name="Heading_20_5" text:outline-level="5">Riferimenti</text:h>
#{tcs.references.map{|ref| <<REF_DELIM
   <text:p text:style-name="Text_20_body">#{escape(ref)}</text:p>
REF_DELIM
}.join}   <text:h text:style-name="Heading_20_4" text:outline-level="4">Anomalie</text:h>
#{anom.map{|an| <<ANOM_DELIM
   <text:p text:style-name="Text_20_body">#{escape(an)}</text:p>
ANOM_DELIM
}.join}  </office:text>
 </office:body>
</office:document>
FODT_HEREDOC_MARKER
####################OUTPUT END#############################

unless ARGV[2]
	f.close
end