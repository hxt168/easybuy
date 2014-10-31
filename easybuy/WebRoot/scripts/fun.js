function ckcpt(){
    var cpt = '';
	cpt += 'right.swf,2,1,-75,-100,2|';//右边开关灯，调整，分享按钮的插件
	cpt += 'adjustment.swf,1,1,-180,-100,3|';//调整大小和颜色的插件
	cpt += 'selected_view.swf,1,1,-180,-100,3|';//清晰度选着
	cpt += 'selected_btn.swf,2,2,-170,-24,2|';///清晰度按钮
	cpt += 'downloadspeeds.swf,2,2,-240,-24,2|';
    return cpt;
}
function ckstyle() { //定义总的风格
    var ck = new Object();
    ck.cpath='pl.swf';
	ck.flashvars='';
	ck.setup='1,1,1,1,0,2,0,1,2,0,0,1,200,0,2,1,0,1,1,1,2,10,3,0,1,0,5000,0,0,0,1,1,1,1,1,1,1';
	ck.dizhi='http://hdcloud.duapp.com/xml.php'; 
	ck.pm_bg='0x000000,100,230,180';
	ck.mylogo='loader.gif';
	ck.pm_mylogo='1,1,-200,-100';
	ck.logo='logo.gif';
	ck.pm_logo='2,0,-150,10';
	ck.control_rel='related.swf,ckplayer/related.xml,0';
	ck.control_pv='Preview.swf,105,2000';
	ck.pm_repc='';
	ck.pm_spac='|';
	ck.pm_advtime='2,0,-110,10,0,300,0';
	ck.pm_advstatus='1,2,2,-200,-40';
	ck.pm_advjp='1,1,2,2,-100,-40';
	ck.pm_padvc='2,0,-10,-10';
	ck.pm_advms='2,2,-46,-56';
	ck.pm_zip='1,1,-20,-8,1,0,0';
	ck.pm_advmarquee='1,2,50,-60,50,18,0,0x000000,50,0,20,1,15,2000';
	ck.advmarquee='';
	ck.pr_zip='{font color="#FFFFFF"}正在加载中[$prtage]%{/font}';
	ck.pr_load='{font color="#FFFFFF"}已加载[$prtage]%{/font}';
	ck.pr_noload='{font color="#FFFFFF"}视频加载失败, 刷新试试看！{/font}';
	ck.pr_buffer='{font color="#FFFFFF"}[$buffer]%{/font}';
	ck.pr_play='点击播放';
	ck.pr_pause='点击暂停';
	ck.pr_mute='点击静音';
	ck.pr_nomute='取消静音';
	ck.pr_full='点击全屏';
	ck.pr_nofull='退出全屏';
	ck.pr_fastf='快进';
	ck.pr_fastr='快退';
	ck.pr_time='[$Time]';
	ck.pr_volume='音量[$Volume]%';
	ck.pr_clockwait='点击播放';
	ck.pr_adv='{font color="#FFFFFF" size="12"}广告剩余：{font color="#FF0000" size="15"}{b}[$Second]{/b}{/font} 秒{/font}';
	ck.myweb='';
	ck.cpt_lights='1';
	ck.cpt_share='';
    ck.cpt_list = ckcpt();
    return ck;
}

(function() {	
	var CKobject= {
		_K_:function(d){return document.getElementById(d);},
		getVideo:function(s){
			var v='';
			if(s){
				for(var i=0;i<s.length;i++){
					var a=s[i].split('->');
					if(a && a[0]){
						v+='<source src="'+a[0]+'"';
					}
					if(a.length==2 && a[1]){
						v+=' type="'+a[1]+'">';
					}
				}
			}
			return v;
		},
		getVars:function(v,k){
			if(v[k]){
				return v[k];
			}
		},
		getParams:function(v){
			var p='';
			if(v){
				if(this.getVars(v,'p')==1 && this.getVars(v,'m')!=1){
					p+=' autoplay="autoplay"';
				}
				if(this.getVars(v,'e')==1){
					p+=' loop="loop"';
				}
				if(this.getVars(v,'m')==1){
					p+=' preload="meta"';
				}
				if(this.getVars(v,'i')){
					p+=' poster="'+this.getVars(v,'i')+'"';
				}
			}
			return p;
		},
		browser:function(){
			var m = (function(ua){
				var a=new Object();
				var b = {
					msie: /msie/.test(ua) && !/opera/.test(ua),
					opera: /opera/.test(ua),
					safari: /webkit/.test(ua) && !/chrome/.test(ua),
					firefox: /firefox/.test(ua),
					chrome: /chrome/.test(ua)
				};
				var vMark = "";
				for (var i in b) {
					if (b[i]) { vMark = "safari" == i ? "version" : i; break; }
				}
				b.version = vMark && RegExp("(?:" + vMark + ")[\\/: ]([\\d.]+)").test(ua) ? RegExp.$1 : "0";
				b.ie = b.msie;
				b.ie6 = b.msie && parseInt(b.version, 10) == 6;
				b.ie7 = b.msie && parseInt(b.version, 10) == 7;
				b.ie8 = b.msie && parseInt(b.version, 10) == 8;
				a.B=vMark;
				a.V=b.version;
				return a;
			})(window.navigator.userAgent.toLowerCase());
			return m;
		},
		Platform:function(){
			var w=''; 
			var u = navigator.userAgent, app = navigator.appVersion;              
			var b={                  
				iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1,
				iPad: u.indexOf('iPad') > -1,
				ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/),
				android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1,
				webKit: u.indexOf('AppleWebKit') > -1,
				gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1,
				presto: u.indexOf('Presto') > -1,
				trident: u.indexOf('Trident') > -1,       
				mobile: !!u.match(/AppleWebKit.*Mobile.*/)||!!u.match(/AppleWebKit/),
				webApp: u.indexOf('Safari') == -1
			}; 
			for (var k in b){
				if(b[k]){
					w=k;
					break;
				}
			}
			return w;
		},
		getpath:function(s) {
			var _d = unescape(window.location.href).replace("file:///", "");
			var _u = document.location.protocol + '//' + document.location.hostname;
			var _l = '',_e = '',_t = '';
			var _s = 0;
			var _r = s.split('//');
			if (_r.length > 0) {
				_l = _r[0] + '//'
			}
			var _h = "http|https|ftp|rtsp|mms|ftp|rtmp";
			var _a = _h.split('|');
			for (i = 0; i < _a.length; i++){
				if ((_a[i] + '://') == _l){
					_s = 1;
					break;
				}
			}
			if (_s == 0) {
				if (s.substr(0, 1) == '/'){
					_t = _u + str;
				}
				else {
					_e = _d.substring(0, _d.lastIndexOf("/") + 1).replace("\\", "/");
					var _w = s.replace('../', './');
					var _u = _w.split('./');
					var _n = _u.length;
					var _r = _w.replace('./', '');
					var _q = _e.split('/');
					var _j = _q.length - _n;
					for (i = 0; i < (_j); i++) {
						_t += _q[i] + '/';
					}
					_t += _r;
				}
			}
			else {
				_t = s;
			}
			return _t;
		},
		Flash:function(){
			var f=false,v=0;
			if(document.all){
				try { 
					var s=new ActiveXObject("ShockwaveFlash.ShockwaveFlash"); 
					f=true;
					var vs=s.GetVariable("$version");
					v=parseInt(vs.split(" ")[1].split(",")[0]);
				} 
				catch(e){} 
			}
			else{
				if (navigator.plugins && navigator.plugins.length > 0){
					var s=navigator.plugins["Shockwave Flash"];
					if (s){
						f=true;
						var w = s.description.split(" ");
						for (var i = 0; i < w.length; ++i){
							if (isNaN(parseInt(w[i]))) continue;
								v = parseInt(w[i]);
							}
						}
				}
			}
			return {f:f,v:v};
		},
		embedHTML5:function(C,P,W,H,V,A,S){
			var v='',
			b=this.browser()['B'],
			v=this.browser()['V'],
			x=v.split('.'),
			t=x[0],
			m=b+v,
			n=b+t,
			w='',
			s=false,
			f=this.Flash()['f'],
			a=false;
			if(!S){
				S=['iPad','iPhone','ios'];
			}
			for(var i=0;i<S.length;i++){
				w=S[i];
				if (w.indexOf('+')>-1){
					w=w.split('+')[0];
					a=true;
				}
				else{
					a=false;
				}
				if(this.Platform()==w|| m==w || n==w || b==w){
					if(a){
						if(!f){
							s=true;
							break;
						}
					}
					else{
						s=true;
						break;
					}
				}
			}
			if(s){
				v='<video controls id="'+P+'" width="'+W+'" height="'+H+'"'+this.getParams(A)+'>'+this.getVideo(V)+'</video>';
				this._K_(C).innerHTML=v;
				this._K_(C).style.width=W+'px';
				this._K_(C).style.height=H+'px';
				this._K_(C).style.backgroundColor='#000';
			}
		},
		getflashvars:function(s){
			var v='',i=0;
			if(s){
				for(var k in s){
					if(i>0){
						v+='&';
					}
					if(k=='f' && s[k]){
						s[k]=this.getpath(s[k]);
					}
					if(k=='y' && s[k]){
						s[k]=this.getpath(s[k]);
					}
					v+=k+'='+s[k];
					i++;
				}
			}
			return v;
		},
		getparam:function(s){
			var w='',v='',
			o={
				allowScriptAccess:'always',
				allowFullScreen:true,
				quality:'high',
				bgcolor:'#000'
			};
			if(s){
				for(var k in s){
					o[k]=s[k];
				}
			}
			for(var e in o){
				w+=e+'="'+o[e]+'" ';
				v+='<param name="'+e+'" value="'+o[e]+'" />';
			}
			w=w.replace('movie=','src=');
			return {w:w,v:v};
		},
		getObjectById:function (s){
			var X = null,
			Y = this._K_(s),
			r = "embed";
			if (Y && Y.nodeName == "OBJECT") {
				if (typeof Y.SetVariable != 'undefined') {
					X = Y;
				} else {
					var Z = Y.getElementsByTagName(r)[0];
					if (Z) {
						X = Z;
					}
				}
			}
			return X;
		},
		embedSWF:function(C,D,N,W,H,V,P){
			if(!N){N='ckplayer_a1'}
			if(!P){P={};}
			var u='undefined',
			j=document,
			r='http://www.macromedia.com/go/getflashplayer',
			t='<a href="'+r+'" target="_blank">请点击此处下载安装最新的flash插件</a>',
			error={
				w:'您的网页不符合w3c标准，无法显示播放器',
				f:'您没有安装flash插件，无法播放视频，'+t,
				v:'您的flash插件版本过低，无法播放视频，'+t
			},
			w3c=typeof j.getElementById != u && typeof j.getElementsByTagName != u && typeof j.createElement != u,
			i='id="'+N+'" name="'+N+'" ',
			s='',
			l='';
			P['movie']=C;
			P['flashvars']=this.getflashvars(V);
			s+='<object  pluginspage="http://www.macromedia.com/go/getflashplayer" ';
			s+='classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
			s+='codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0" ';
			s+='width="'+W+'" ';
			s+='height="'+H+'" ';
			s+=i;
			s+='align="middle">';
			s+=this.getparam(P)['v'];
			s+='<embed ';
			s+=this.getparam(P)['w'];
			s+=' width="'+W+'" height="'+H+'" name="'+N+'" id="'+N+'" align="middle" '+i;
			s+='type="application/x-shockwave-flash" pluginspage="'+r+'" />';
			s+='</object>';
			if(!w3c){
				l=error['w'];
			}
			else{
				if(!this.Flash()['f']){
					l=error['f'];
				}
				else{
					if(this.Flash()['v']<10){
						l=error['f'];
					}
					else{
						l=s;
					}
				}
			}
			if(l){
				this._K_(D).innerHTML=l;
				this._K_(D).style.color='#FFDD00';
			}
		}
	}
	window.CKobject = CKobject;
})();
				
				
 function play_style(s){
	$.cookie('sp', s, {expires: 3600*24*30*1000}); 
	//setCookie("sp",s,3600*24*30*1000);
	setCookie("an",s,1000*8); 
	//var a=window.location.hash;
	//if(a.indexOf("URL=")!=-1){
	location.reload()
//	}
}

function setCookie(c_name,value,expiredays)
{
	var exdate=new Date(new Date().getTime()+expiredays);
	document.cookie=c_name+"="+escape(value)+((expiredays==null)?"":";expires="+exdate.toGMTString())+";path=/;domain=hdp4p.com"; 
}
var getCookie = function(name){return (document.cookie.match(new RegExp("(^"+name+"| "+name+")=([^;]*)"))==null)?"":RegExp.$2;}  
  
  function P(ah){
			this.fullUrl=ah;
			this.noCacheIE="&noCacheIE="+(new Date()).getTime();
			this.headLoc=document.getElementsByTagName("head").item(0);
			this.scriptId="JscriptId"+P.scriptCounter++
		}
		P.scriptCounter=1;
		P.prototype.buildScriptTag=function(){
			this.scriptObj=document.createElement("script");
			this.scriptObj.setAttribute("type","text/javascript");
			this.scriptObj.setAttribute("src",this.fullUrl)
		};
		P.prototype.removeScriptTag=function(){
			this.headLoc.removeChild(this.scriptObj)
		};
		P.prototype.addScriptTag=function(){
			this.headLoc.appendChild(this.scriptObj)
		};
		
function J(ah, aj, al) {
            var ai = ah;
            if (aj) {
                window[aj] = al
            }
            if (ai.indexOf("?") != -1) {
                ai += "&jsonp=" + aj
            } else {
                ai += "?jsonp=" + aj
            }
            var ak = new P(ai);
            ak.buildScriptTag();
            ak.addScriptTag()
        }
		
function getQueryString(name) {   
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");   
 	var r = window.location.search.substr(1).match(reg);   
 	 if (r != null) 
	 	return unescape(r[2]); 
	 return null;   
}


var reindex=5;
function show_bt_list(hash,index)
{
    
    myhash=hash;
    myindex=index;

		hash=hash.toUpperCase();
		var aq="http://i.vod.xunlei.com/req_subBT/info_hash/"+hash+"/req_num/30/req_offset/0?cache="+new Date().getTime()+"&jsonp=callback";
	/*	J(aq, "XL_CLOUD_FX_INSTANCEqueryFileListBack", 
                function(acc) 
				{
				
					if(acc)
					{
					  getBtInfo(acc,hash,index)
					}else{
					  reindex--;
					  if(reindex>0)
					  {
						 show_bt_list(hash,index);
					  }
					  
					
					}				
				
		});*/
		
		
		$.jsonp({
			//async:false,
             url : aq,
            // dataType : "jsonp",
             jsonp: "callback",
          
			success: function (acc) {
			  
					//  getBtInfo(acc,hash,index)
				
			
			
			},
			error: function (xOptions, textStatus) {
			//console.log(textStatus);
			  reindex--;
					  if(reindex>0)
					  {
						 show_bt_list(hash,index);
					  }
		}    
});
	
}  

var myhash,myindex;
function callback(acc)
{
getBtInfo(acc,myhash,myindex)

}

function getBtInfo(acc,hash,index)
{

	reindex=-1;
  var bt_list="<select id=\"btselect\" onchange=\"btgo('"+hash+"')\" style=\"width:300px\" >";
	for (var i=0; i<acc.resp.subfile_list.length; i++)
	 { 
		var is_selected="";
		if(i==index)
		{
				is_selected=' selected="selected"';
		}
		var bt_name=decodeURIComponent(acc.resp.subfile_list[i].name);
		bt_list+='<option'+is_selected+' value="'+acc.resp.subfile_list[i].index+'">'+bt_name+'['+parseInt(acc.resp.subfile_list[i].file_size/1024/1024)+'MB]</option>';
	
	}
	
	bt_list+="</select>";
//	alert(bt_list);
	document.getElementById("bt_title").innerHTML=bt_list;	



}



function btgo(hash){
	var select_index=document.getElementById("btselect").value;
	location.href="?str=bt://"+hash+"/"+select_index;


}

function showbtlist()
{
	var playurl2=getQueryString("str");
	if(playurl2!="")
	{
		playurl2=decodeURIComponent(playurl2);
		if(playurl2.indexOf("magnet")!=-1)
		{
			var hash=playurl2.substr(20,40);
			if(hash.length==40)
			{
				show_bt_list(hash,0);
			}
		
		}else if(playurl2.indexOf("bt://")!=-1){
			var hash=playurl2.substr(5,40);
			var bt_lists=playurl2.split("/");
			var pindex=bt_lists[bt_lists.length-1];
			
			if(hash.length==40)
			{
				show_bt_list(hash,pindex);
			}
		
		}
	}

}
jQuery.cookie = function(name, value, options) { 
if (typeof value != 'undefined') { // name and value given, set cookie 
options = options || {}; 
if (value === null) { 
value = ''; 
options.expires = -1; 
} 
var expires = ''; 
if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) { 
var date; 
if (typeof options.expires == 'number') { 
date = new Date(); 
date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000)); 
} else { 
date = options.expires; 
} 
expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE 
} 
var path = options.path ? '; path=' + options.path : ''; 
var domain = options.domain ? '; domain=' + options.domain : ''; 
var secure = options.secure ? '; secure' : ''; 
document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join(''); 
} else { // only name given, get cookie 
var cookieValue = null; 
if (document.cookie && document.cookie != '') { 
var cookies = document.cookie.split(';'); 
for (var i = 0; i < cookies.length; i++) { 
var cookie = jQuery.trim(cookies[i]); 
// Does this cookie string begin with the name we want? 
if (cookie.substring(0, name.length + 1) == (name + '=')) { 
cookieValue = decodeURIComponent(cookie.substring(name.length + 1)); 
break; 
} 
} 
} 
return cookieValue; 
} 
}; 
