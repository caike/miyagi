// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).observe('dom:loaded', function(){ 
	Event.addBehavior({ 		
		'#run': function(){
			this.hide();
		}		     	
	});	
});


// counter

CountActive = true;
CountStepper = -1;
LeadingZero = true;
DisplayFormat = "%%M%% Minutes, %%S%% Seconds.";
FinishMessage = "One of the pairs now change!";

function startCounter(){
		
	CountStepper = Math.ceil(-1);    
	
	SetTimeOutPeriod = (Math.abs(CountStepper)-1)*1000 + 990;   

	var dthen = new Date();
	dthen.setMinutes(dthen.getMinutes() + 10);

	var dnow = new Date();
	if(CountStepper>0)
	ddiff = new Date(dnow-dthen);
	else
	ddiff = new Date(dthen-dnow);
	gsecs = Math.floor(ddiff.valueOf()/1000);
	
	CountBack(gsecs);  
}

function CountBack(secs) {
	
	if (secs < 0) {
 		$('coding_timer').innerHTML = FinishMessage;
		return;
	}
	          
	DisplayStr = DisplayFormat.replace(/%%D%%/g, calcage(secs,86400,100000));
	DisplayStr = DisplayStr.replace(/%%M%%/g, calcage(secs,60,60));
	DisplayStr = DisplayStr.replace(/%%S%%/g, calcage(secs,1,60));

	$('coding_timer').innerHTML = DisplayStr;
	
	if (CountActive)
	setTimeout("CountBack(" + (secs+CountStepper) + ")", SetTimeOutPeriod);
}

function calcage(secs, num1, num2) {
	s = ((Math.floor(secs/num1))%num2).toString();
	if (LeadingZero && s.length < 2)
	s = "0" + s;
	return "<b>" + s + "</b>";
}

// tabs

function tabselect(tab) {
  var tablist = $('tabcontrol1').getElementsByTagName('li');
  var nodes = $A(tablist);
  var lClassType = tab.className.substring(0, tab.className.indexOf('-') );

  nodes.each(function(node){
    if (node.id == tab.id) {
      tab.className=lClassType+'-selected';
    } else {
      node.className=lClassType+'-unselected';
    };
  });
}

function paneselect(pane) {
  var panelist = $('panecontrol1').getElementsByTagName('li');
  var nodes = $A(panelist);

  nodes.each(function(node){
    if (node.id == pane.id) {
      pane.className='pane-selected';
    } else {
      node.className='pane-unselected';
    };
  });
}

function loadPane(pane, src) {
  if (pane.innerHTML=='' || pane.innerHTML=='<img alt="Wait" src="/images/spinner.gif" style="vertical-align:-3px" /> Loading...') {
    reloadPane(pane, src);
  }
}

function reloadPane(pane, src) {
  new Ajax.Updater(pane, src, {asynchronous:1, evalScripts:true, onLoading:function(request){pane.innerHTML='<img alt="Wait" src="/images/spinner.gif" style="vertical-align:-3px" /> Loading...'}})
}