//=============================================================================
// definitions - define like so:
//      #define foo = lightpurple;
// then reference like so:
//      background-color: $foo;
// NSS will expand it out as if you had written:
//      background-color: lightpurple;
//
// definitions must be at the top of the NSS file!
//
// gotcha: there can be no space between a function and the opening (
//=============================================================================
    
#define buttonVertical = 
  lineargradient(
    stop(0%, #b0cbf5) stop(100%, #d9e8ff) 
    angle(90) );
    
#define menuBar = 
  lineargradient(
    stop(0%, #f7f7f7) stop(100%, #f4f5eb) 
    angle(90) );

#define tab = 
  lineargradient(
    stop(0%, #cdcfbe) stop(100%, #cdcfbe) 
    angle(90) );
    
#define tabSelected = 
  lineargradient(
    stop(0%, #f7f7f7) stop(100%, #f7f7f7) 
    angle(90) );    

#define sideBarHeader = 
  lineargradient(
    stop(0%, #b0cbf5) stop(33%, #bfdcff) stop(66%, #bfdcff) stop(100%, #b0cbf5) );
    

//=============================================================================
// General theme attributes (required)
//=============================================================================

#define mainBackground = #696f79; //Workbench pane background color

#define button = lineargradient(stop(0%, #cfcfcf) stop(100%, #d4d4d4) angle(135) ); //button background
#define buttonSelectedBackground = #c1c1c1;
#define buttonText = #3d3d3d;
#define buttonBorder = #f9f9f9;
#define buttonShadow = #000;
#define buttonHighlight = #f9f9f9;
#define buttonFont = bold 12pt sansserif;

#define textEditorBorder = #c4c4c4;
#define textEditorBackground = #f9f9f9;
#define textEditorTextColor = #3d3d3d;
#define textEditorDisabledBackground = #e8e8e8;
#define textEditorDisabledTextColor = #a9a9a9;

#define spinnerButtonArrows = #000;
#define spinnerButtonBackground = #e6e6e6;

#define scrollBarButtonForeground = #c4c4c4; //scroll bar arrow color
#define scrollBarButtonBackground = #fafafa; 
#define scrollBarThumb = #c4c4c4; //thumb color
#define scrollBarTrack = #fafafa; //track color

#define treeBackground = #f9f9f9;
#define treeNodeFont = 12.5pt sansserif;
#define treeNodeText = #3d3d3d; //tree node text color
#define treeNodeConnector = #727272;
#define treeNodeExpander = #727272;
#define treeNodeSelectedText = #000000;
#define treeNodeSelectedBackground = #c2d8ff;

#define splitPaneDividerBackground = #f9f9f9;
#define splitPaneDividerIndentation = #f9f9f9; //indentation dots color

#define titlePaneTitleText = #3d3d3d;
#define titlePaneTitleBackground = #fff;
#define titlePaneTitleUnderline = #6193dd;
#define titlePaneHeaderBackground = #f9f9f9;
#define titlePaneHeaderTitleSeparator = #e6e6e6;
#define titlePaneTitleFont = 17pt sansserif;

#define tableBackground = #fff;
#define tableHeaderBackground = #ebebeb;
#define tableHeaderFont = 13pt sansserif;
#define tableHeaderText = #4d4d4d;
#define tableCellSelectedBackground = #c2d8ff;
#define tableCellSelectedText = #000000;
#define tableCellBackground = #f7f7f7;
#define tableCellText = #3d3d3d;
#define tableCellFont = 12pt sansserif;
#define tableCellHeightOffset = 10; //adds additional height to tableCellFont height value
#define tableGrid = #e6e6e6;
#define tableBorder = #fff;

#define dropDownOutline = #c4c4c4;
#define dropDownBackground = #fff;
#define dropDownButtonBackground = #c4c4c4;
#define dropDownButtonForeground = #fff; //arrow color

#define listTextFont = 12pt sansserif; 
#define listText = #3d3d3d;
#define listSelectedText = #fff;
#define listBackground = #fff;
#define listBorder = #c4c4c4;
#define listSelectedBackground = #696f79;
#define checkBoxBackground = #eaeaea;
#define checkBoxCheckMark = #000; //check mark color and box outline

#define tabBackground = #d9d9d9;
#define tabSelectedBackground = #f9f9f9;
#define tabBorder = #c4c4c4;
#define tabSelectedBorder = #c4c4c4;
#define tabInsets = 8;
#define tabContentSeparator = #e6e6e6;
#define tabSelectedUnderline = #f9f9f9;

#define gridPaneBand = #c4c4c4;

//=============================================================================
// PathBar theme attributes
//=============================================================================

//main pathbar (non-edit mode)
#define pathBarBackground = #696f79; //default pathbar background color. Note: keep this value in sync with $mainBackground for pathbar to blend correctly into background
#define pathBarProgress = lineargradient(stop(0%, #b8b0cbf5) stop(100%, #b8bfdcff) );

//pathbar text field (edit mode)
#define pathBarTextFieldText = #fff; //normal text color
#define pathBarTextFieldSelectedText = #000; //selected text foreground color
#define pathBarTextFieldBackground = #3d3d3d; //normal text background color
#define pathBarTextFieldSelectedBackground = #F3F3EC; //selected text background color

//pathbar suggestion dropdown list
#define pathBarListText = #ebebeb;  //unselected item text color
#define pathBarListSelectedText = #fff; //selected item text color
#define pathBarListBackground = #6b727c; //unselected item background color
#define pathBarListSelectedBackground = #3d3d3d; //selected item background color

//=============================================================================
// ToolPane/Sidebar theme attributes
//=============================================================================

#define toolPaneBorder = none;
#define toolPaneHeaderLabelBackground = #fff;
#define toolPaneHeaderLabelUnderline = #6193dd;
#define toolPaneHeaderLabelSeparator = #e6e6e6;
#define toolPaneHeaderFont = 17pt sansserif;
#define toolPaneHeaderArmedForeground = #3d3d3d;
#define toolPaneHeaderArmedBackground = #f9f9f9;
#define toolPaneHeaderDisarmedForeground = #3d3d3d;
#define toolPaneHeaderDisarmedBackground = #f9f9f9;
#define toolPaneHeaderDropShadow = #50808080;

//=============================================================================
// Property Sheet attributes
//=============================================================================
#define propertySheetBackground = #fff;
#define propertySheetText = #3d3d3d;
#define propertySheetHeaderBackground = #fff;
#define propertySheetHeaderText = #3d3d3d;
#define propertySheetDivider = #e6e6e6;
#define propertySheetFont = 14pt sansserif;
#define propertySheetExpanderWidth = 9;
#define propertySheetExpanderHeight = 9;

//=============================================================================
// Console attributes
//=============================================================================
#define consoleBackground = #f9f9f9;

//=============================================================================
// common attributes (required)
//=============================================================================

font-families {
  sansserif: Source Sans Pro, Tahoma, DejaVu Sans Condensed, DejaVu Sans, Nimbus Sans L, Arial;
  monospaced: Courier New, DejaVu Sans Mono;
}

javafx {
  enabled: true;
  hide-nonessential-icons: true;
}

font: 12pt sansserif;
bold-font: bold 12pt sansserif;
large-font: 14pt sansserif;
large-bold-font: bold 14pt sansserif;
fixed-font: 12pt monospaced;
fixed-bold-font: bold 12pt monospaced;

color: #000;
background-color: #f9f9f9;
outline: #3e402f; 
auxiliary-color: $pathBarBackground;
highlight: #faf7e8; 
shadow: #bdbaaa;
header-color: #ebebeb;


focus-color: #0a246a;

selection-color: #fff;
selection-background-color: #306bc2;

border-radius: 10; //default border radius for anything that might use it


.themeTextForeground {
  color: $treeNodeText;
}

.disabled {
  color: #3e402f;
  background-color: #f7f7f7;
  outline: #a4a098;
  highlight: none; 
  shadow: $pathBarBackground;
}

.readonly {
  background-color: $textEditorDisabledBackground;
  outline: none;
  shadow: $textEditorBorder;
  highlight: $textEditorBorder;
}

//window-color and window-background-color included to keep legacy widgets happy
//wherever possible, please use color and background-color instead
window-color: #000;
window-background-color: #fff;

drop-ok-color: #fff;
drop-ok-background-color: #306bc2;

label {
  
  font: 12pt sansserif;

  .strong {
    font: bold 12pt sansserif;
  }
  
  .large {
    font: 13pt sansserif;
  }
  
  .error {
    color: #a00;
  }
  
  .warning {
    color: #ce5e04;
  }
  
  .message {
    color: #090;
  }
  
  .trace {
    color: #666;
  }
  
  .emphasized {
    font: italic 12pt sansserif;
  }
  
  .hyperlink {
    color: #00f;
    font: underline 12pt sansserif;
  }
  
  .disabled {
    color: #848687;
  }
  
  .statusBar {
    color: #f9f9f9;
  }
}

list {
  font: $listTextFont; //list font
  color: $listText; //list text color
  selection-color: $listSelectedText; // selected item forground color
  background-color: $listBackground; //list background color
  selection-background-color: $listSelectedBackground; //selected item background color
  
  outline: $listBackground; //list border
  shadow: $listBorder;  //list border
  highlight: $listBorder; //list border

  #pathbar-list {
    outline: none;
    shadow: none;
    highlight: none;
    color: $pathBarListText;
    selection-color: $pathBarListSelectedText; 
    background-color: $pathBarListBackground; 
    selection-background-color: $pathBarListSelectedBackground;
  }
}

drop-down {

  //drop-down border attributes (corresponds to BListDropDownDisplay)
  //this just styles the collapsed version of the drop down (NOT the drop down list)
  background-color: $dropDownBackground;
  outline: $dropDownOutline;
  shadow: none;
  highlight: none;
  
  button {
    outline: none;
    shadow: none;
    highlight: none;
    color: $dropDownButtonForeground; 
    background-color: $dropDownButtonBackground;
  }

  .disabled {
    background-color: #f7f7f7;
  }
}

progress-bar {
  background-color: #fff;
  color: $buttonVertical;
}


//=============================================================================
// widget-specific attributes
//=============================================================================


//================================
//   TOOLBAR - buttons / icons
//
//   NOTE: Use JavaFX to format main Workbench Toolbar related elements by editing fx\theme.css
//================================
button {

  color: $buttonText;
  font: $buttonFont;
  outline: $buttonBorder;
  highlight: $buttonHighlight;
  shadow: $buttonShadow;
  background-color: $button;
  selection-background-color: $buttonSelectedBackground;
  toolbar-padding: 5 8 5 8;
  
  .disabled {
    highlight: #f9fae8; 
    shadow: none;
    color:#848687;
  }
    
  .toolbar {
    background-color: none;
    selection-background-color: $buttonSelectedBackground;
    outline: #9c9e95;
    highlight: #f7f7f7; 
    shadow: #f7f7f7;
  }
  
  //override the bold font applied to regular buttons
  checkbox {
    font: 12pt sansserif;
    outline: $checkBoxCheckMark;
    background-color: $checkBoxBackground;
    .disabled { outline: #848687; }
  }
  
  radio {
    font: 12pt sansserif;
    .disabled { outline: #848687; }
    outline: #000;
    highlight: none;
    shadow: none;
  }
  
  #tableOptionsButton {
    background-color: $tableHeaderBackground;
    outline: none;
    highlight: none; 
    shadow: none;
  }
  
  spinner {
    shadow: none;
    highlight: none;
    outline: $spinnerButtonArrows;
    background-color: $spinnerButtonBackground;
  }
}
//=============== end ============


//================================
//   MENU (including right-click menu)
//
//   NOTE: Use JavaFX to format main workbench Menu Bar (File, Edit, etc. ) elements by editing fx\theme.css
//================================
menu {
  background-color: #333333;
  outline: #333333;
  highlight: #333333; 
  shadow: #393939;
  padding: 0;
  opacity: 1;
}

menu-bar {
  font: 14pt sansserif;
  item-padding: 0 0 0 0;         //default: 2 7
  bar-padding: 0 0 0 0;          //default: 1
  
  color: #333;
  background-color: $menuBar;
  outline: none;
  highlight: none;
  shadow: #393939;
  
  .selected {
    color: #fff;
    background-color: #ebebeb;
    outline: #306bc2;
    highlight: #306bc2;
    shadow: #306bc2;
   }  
}

menu-item {
  font: 14pt sansserif;
  color: #ffffff;
  background-color: #333333;
  padding:  4 14 4 12;         //default: 2 14 2 22
  icon-indent: 0;           //default: 2
  outline: #ffffff; //checkbox color
  
  .disabled {
    opacity: 0.3;
  }

  selection-color: #333333;
  selection-background-color: #ebebeb;
  selection-font: bold 14pt sansserif

  // divider in right click menus
  accelerator {
    font: 1pt sansserif;       //default: menu-item font -1 point
    color: #a9a9a9;
    padding: 4 0 4 0;
  }
}

recent-ords menu-item accelerator { color: #000000; }
//=============== end ============


//================================
//   PATHBAR - ORD path below Menu Bar
//================================
path-bar {
  color: #fff;
  font: 12pt sansserif;
  outline: none;
  highlight: none; 
  shadow: none;
  background-color: $pathBarBackground;
  progress-color: $pathBarProgress;
}
//=============== end ============

console {
  background-color #f9f9f9;
  outline: none;
}

pane {

  outline: none;
  shadow: none;
  highlight: none;
  
    grid-pane {
  
    #platform-admin-grid { background-color: #fff; }
        band-color: $gridPaneBand;
        .scrolled {
          band-color: #e2e2e2;
        }
  }

  background-color: none;

  .errorPanel { background-color: white; }
  
  border-pane {
    width: 0;
    color: #000;
    font: 18pt sansserif;
  }
  
  #main-background-pane { background-color: $mainBackground; }
  #alarm-title-pane { background-color: $dropDownButtonBackground; }
  
  //================================
  //   SCROLL PANE
  //================================
  scroll-pane {
    padding: 0;            //default: 0 (and you want it that way)
    background-color: #fff;
    outline: none; //remove scroll pane border
    .sidebar-body { background-color: $treeBackground; }
    .sidebar-scroll-pane 
    { 
      background-color: $treeBackground;
    } 
  }
  
  //================================
  //   SPLIT PANE
  //================================
  split-pane {
    shadow: none;
    highlight: none;
    width: 4;
    divider {
      background-color: $splitPaneDividerBackground;
      highlight: $splitPaneDividerIndentation; //indentation dot color
      outline: none; 
      shadow: none;
    }
    
    .console-top {
      width: 10;
      background-color: lineargradient(stop(0%, #d3d3d3) stop(50%, #f0f0f0) stop(100%, #f9f9f9) angle(270) );
    }
  }
  
  tabbed-pane {
    background-color: $tabBackground;
    shadow: none;
    highlight: $tabContentSeparator;
    outline: $tabBorder;
    tab-insets: $tabInsets;
    
    .selected {
      background-color: $tabSelectedBackground;
      highlight: $tabSelectedUnderline;
      shadow: none;
      outline: $tabSelectedBorder;
    }
  }
  
  //================================
  //   TITLE-PANE
  //================================
  .title {
    color: $titlePaneTitleText;
    font: $titlePaneTitleFont;
    background-color: $titlePaneTitleBackground;
    outline: $titlePaneHeaderBackground;
    shadow: $titlePaneHeaderTitleSeparator;
    highlight: $titlePaneTitleUnderline;
  }
  
  //================================
  //   TOOL-PANE - nav, palette, etc.
  //================================
  tool-pane {
    outline: none; //toolpane border color
    highlight: $toolPaneHeaderLabelUnderline;
    shadow: $toolPaneHeaderLabelSeparator;
    background-color: $toolPaneHeaderLabelBackground;
    drop-shadow: $toolPaneHeaderDropShadow;
    drop-shadow-width: 10;
    
    header { //header attributes for a single sidebar in toolpane
      font: $toolPaneHeaderFont;
      selection-color: $toolPaneHeaderArmedForeground;
      selection-background-color: $toolPaneHeaderArmedBackground;
      color: $toolPaneHeaderDisarmedForeground;
      background-color: $toolPaneHeaderDisarmedBackground;
      padding: 3 0 3 6;
    }
  }
}
//=============== end ============


//================================
//   SCROLL BAR
//================================
scroll-bar {
  width: 17;             //default: 15
  button {
    outline: none;
    highlight: none;
    shadow: none;
    color: $scrollBarButtonForeground;
    background-color: $scrollBarButtonBackground;
     
    .disabled {
      color: #707070;
      background-color: #d4d0c8;
      outline: #9d9e95; 
      highlight: #fff; 
      shadow: #a4a098;
    }
  }
  thumb {
    outline: none; 
    highlight: none; 
    shadow: none;
    background-color: $scrollBarThumb;
  }
  track {
    outline: none; 
    highlight: none; 
    shadow: none;
    background-color: $scrollBarTrack;
    
  }
}

//=============== end ============

separator {
  width:2;              //default: 2
  width-menu:8;          //default: 8
  width-toolbar:8;          //default: 8

  highlight: #9d9e95;
  shadow: none;
}

table {

  outline: $tableBorder;
  background-color: $tableBackground;
  grid-color: $tableGrid;
  selection-background-color: $tableCellSelectedBackground;
  selection-color: $tableCellSelectedText;
  band-color: $tableCellBackground;
  color: $tableCellText; 
  font: $tableCellFont;
  cell-height-offset: $tableCellHeightOffset;
  
  .sidebar-table { 
    background-color: $treeBackground; 
  }
  
  header {
    highlight: none;
    shadow: none;
    outline: none;
    background-color: $tableHeaderBackground;
    font: $tableHeaderFont;
    color: $tableHeaderText;
  }
  
  .cell-table { 
    selection-color: #000;
    selection-background-color: #bfdcff; 
  }

  tree-table {
    connector-color: #000;
    expander {
      color: #000;
    }
    .category-browser { band-color: #ffffff; }
  }
}

text-editor {

  background-color: $textEditorBackground;
  outline: none;
  shadow: $textEditorBorder;
  highlight: $textEditorBorder;
  font: $tableCellFont;
  color: $textEditorTextColor;
  
  .disabled {
    background-color: $textEditorDisabledBackground;
    color: $textEditorDisabledTextColor;
  }  
  selection-color: white;
  selection-background-color: #306bc2;
  
  #pathbar-text-field {    
    outline: $pathBarTextFieldText;
    background-color: $pathBarTextFieldBackground;
    selection-color: $pathBarTextFieldSelectedText;
    selection-background-color: $pathBarTextFieldSelectedBackground;
  }
}

//================================
//   TREE
//================================
tree {
  highlight: none;
  shadow: none;
  font: $treeNodeFont;
  color: $treeNodeText; //tree node text color
  background-color: $treeBackground;
  connector-color: $treeNodeConnector;
  padding: 6 10;          //default: 2 4
  
  expander {
    color: $treeNodeExpander;
    width: 11;          //default: 9, looks goofy with even nums
  }
  
  selection-color: $treeNodeSelectedText;
  selection-background-color: $treeNodeSelectedBackground;
  
  property-sheet {
    background-color: $propertySheetBackground;
    color: $propertySheetText;
    font: $propertySheetFont;
    
    header {  
      color: $propertySheetHeaderText;
      background-color: $propertySheetHeaderBackground;
    }
    
    divider {
      color: $propertySheetDivider;
    }
  }
}

toolbar {
  scroll-speed: 120;
}

wire-sheet {
  color: #ddd;
  background-color: #fff;
  outline: #3e402f;
  
  glyph {
    background-color: white;
    outline: #3e402f;
    font: 9pt sansserif; 
    
    title {
      title { font: bold 9pt sansserif; }
      subtitle { font: 9pt sansserif; }
      color: #000;
      background-color: $button;
      .cut {
        color: #6e6e6e; 
        background-color: #32969696;
      }
    }
    
    selection-color: #eaebd8;
    selection-background-color: #000;
    
    .cut {
      background-color: #32969696;
    }
  }
  
  thumbnail {
    color: #7fb0cdf5;
    background-color: #7feaebd8;
    outline: #3e402f;
  }
}
//=============== end ============
