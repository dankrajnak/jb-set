// https://d3js.org/d3-geo/ Version 1.4.0. Copyright 2016 Mike Bostock.
(function(n,t){"object"==typeof exports&&"undefined"!=typeof module?t(exports,require("d3-array")):"function"==typeof define&&define.amd?define(["exports","d3-array"],t):t(n.d3=n.d3||{},n.d3)})(this,function(n,t){"use strict";function r(){this.reset()}function i(n,t,r){var i=n.s=t+r,e=i-t,o=i-e;n.t=t-o+(r-e)}function e(n){return n>1?0:n<-1?Ot:Math.acos(n)}function o(n){return n>1?Tt:n<-1?-Tt:Math.asin(n)}function u(n){return(n=Kt(n/2))*n}function c(){}function a(n,t){n&&nr.hasOwnProperty(n.type)&&nr[n.type](n,t)}function l(n,t,r){var i,e=-1,o=n.length-r;for(t.lineStart();++e<o;)i=n[e],t.point(i[0],i[1],i[2]);t.lineEnd()}function f(n,t){var r=-1,i=n.length;for(t.polygonStart();++r<i;)l(n[r],t,1);t.polygonEnd()}function p(){er.point=h}function s(){g(tt,rt)}function h(n,t){er.point=g,tt=n,rt=t,n*=Ft,t*=Ft,it=n,et=Xt(t=t/2+Gt),ot=Kt(t)}function g(n,t){n*=Ft,t*=Ft,t=t/2+Gt;var r=n-it,i=r>=0?1:-1,e=i*r,o=Xt(t),u=Kt(t),c=ot*u,a=et*o+c*Xt(e),l=c*i*Kt(e);rr.add(Ut(l,a)),it=n,et=o,ot=u}function v(n){return[Ut(n[1],n[0]),o(n[2])]}function d(n){var t=n[0],r=n[1],i=Xt(r);return[i*Xt(t),i*Kt(t),Kt(r)]}function E(n,t){return n[0]*t[0]+n[1]*t[1]+n[2]*t[2]}function S(n,t){return[n[1]*t[2]-n[2]*t[1],n[2]*t[0]-n[0]*t[2],n[0]*t[1]-n[1]*t[0]]}function y(n,t){n[0]+=t[0],n[1]+=t[1],n[2]+=t[2]}function m(n,t){return[n[0]*t,n[1]*t,n[2]*t]}function x(n){var t=Vt(n[0]*n[0]+n[1]*n[1]+n[2]*n[2]);n[0]/=t,n[1]/=t,n[2]/=t}function M(n,t){gt.push(vt=[ut=n,at=n]),t<ct&&(ct=t),t>lt&&(lt=t)}function _(n,t){var r=d([n*Ft,t*Ft]);if(ht){var i=S(ht,r),e=[i[1],-i[0],0],o=S(e,i);x(o),o=v(o);var u,c=n-ft,a=c>0?1:-1,l=o[0]*It*a,f=Bt(c)>180;f^(a*ft<l&&l<a*n)?(u=o[1]*It,u>lt&&(lt=u)):(l=(l+360)%360-180,f^(a*ft<l&&l<a*n)?(u=-o[1]*It,u<ct&&(ct=u)):(t<ct&&(ct=t),t>lt&&(lt=t))),f?n<ft?P(ut,n)>P(ut,at)&&(at=n):P(n,at)>P(ut,at)&&(ut=n):at>=ut?(n<ut&&(ut=n),n>at&&(at=n)):n>ft?P(ut,n)>P(ut,at)&&(at=n):P(n,at)>P(ut,at)&&(ut=n)}else M(n,t);ht=r,ft=n}function N(){cr.point=_}function w(){vt[0]=ut,vt[1]=at,cr.point=M,ht=null}function R(n,t){if(ht){var r=n-ft;ur.add(Bt(r)>180?r+(r>0?360:-360):r)}else pt=n,st=t;er.point(n,t),_(n,t)}function A(){er.lineStart()}function j(){R(pt,st),er.lineEnd(),Bt(ur)>bt&&(ut=-(at=180)),vt[0]=ut,vt[1]=at,ht=null}function P(n,t){return(t-=n)<0?t+360:t}function C(n,t){return n[0]-t[0]}function q(n,t){return n[0]<=n[1]?n[0]<=t&&t<=n[1]:t<n[0]||n[1]<t}function z(n,t){n*=Ft,t*=Ft;var r=Xt(t);b(r*Xt(n),r*Kt(n),Kt(t))}function b(n,t,r){++dt,St+=(n-St)/dt,yt+=(t-yt)/dt,mt+=(r-mt)/dt}function L(){lr.point=O}function O(n,t){n*=Ft,t*=Ft;var r=Xt(t);Pt=r*Xt(n),Ct=r*Kt(n),qt=Kt(t),lr.point=T,b(Pt,Ct,qt)}function T(n,t){n*=Ft,t*=Ft;var r=Xt(t),i=r*Xt(n),e=r*Kt(n),o=Kt(t),u=Ut(Vt((u=Ct*o-qt*e)*u+(u=qt*i-Pt*o)*u+(u=Pt*e-Ct*i)*u),Pt*i+Ct*e+qt*o);Et+=u,xt+=u*(Pt+(Pt=i)),Mt+=u*(Ct+(Ct=e)),_t+=u*(qt+(qt=o)),b(Pt,Ct,qt)}function G(){lr.point=z}function k(){lr.point=F}function I(){B(At,jt),lr.point=z}function F(n,t){At=n,jt=t,n*=Ft,t*=Ft,lr.point=B;var r=Xt(t);Pt=r*Xt(n),Ct=r*Kt(n),qt=Kt(t),b(Pt,Ct,qt)}function B(n,t){n*=Ft,t*=Ft;var r=Xt(t),i=r*Xt(n),o=r*Kt(n),u=Kt(t),c=Ct*u-qt*o,a=qt*i-Pt*u,l=Pt*o-Ct*i,f=Vt(c*c+a*a+l*l),p=Pt*i+Ct*o+qt*u,s=f&&-e(p)/f,h=Ut(f,p);Nt+=s*c,wt+=s*a,Rt+=s*l,Et+=h,xt+=h*(Pt+(Pt=i)),Mt+=h*(Ct+(Ct=o)),_t+=h*(qt+(qt=u)),b(Pt,Ct,qt)}function D(n,t){return[n>Ot?n-kt:n<-Ot?n+kt:n,t]}function U(n,t,r){return(n%=kt)?t||r?sr(Y(n),Z(t,r)):Y(n):t||r?Z(t,r):D}function X(n){return function(t,r){return t+=n,[t>Ot?t-kt:t<-Ot?t+kt:t,r]}}function Y(n){var t=X(n);return t.invert=X(-n),t}function Z(n,t){function r(n,t){var r=Xt(t),a=Xt(n)*r,l=Kt(n)*r,f=Kt(t),p=f*i+a*e;return[Ut(l*u-p*c,a*i-f*e),o(p*u+l*c)]}var i=Xt(n),e=Kt(n),u=Xt(t),c=Kt(t);return r.invert=function(n,t){var r=Xt(t),a=Xt(n)*r,l=Kt(n)*r,f=Kt(t),p=f*u-l*c;return[Ut(l*u+f*c,a*i+p*e),o(p*i-a*e)]},r}function H(n,t,r,i,e,o){if(r){var u=Xt(t),c=Kt(t),a=i*r;null==e?(e=t+i*kt,o=t-a/2):(e=J(u,e),o=J(u,o),(i>0?e<o:e>o)&&(e+=i*kt));for(var l,f=e;i>0?f>o:f<o;f-=a)l=v([u,-c*Xt(f),-c*Kt(f)]),n.point(l[0],l[1])}}function J(n,t){t=d(t),t[0]-=n,x(t);var r=e(-t[1]);return((-t[2]<0?-r:r)+kt-bt)%kt}function K(n,t,r,i){this.x=n,this.z=t,this.o=r,this.e=i,this.v=!1,this.n=this.p=null}function Q(n){if(t=n.length){for(var t,r,i=0,e=n[0];++i<t;)e.n=r=n[i],r.p=e,e=r;e.n=r=n[0],r.p=e}}function V(n,r,i,e){function o(t,o){return n<=t&&t<=i&&r<=o&&o<=e}function u(t,o,u,a){var f=0,p=0;if(null==t||(f=c(t,u))!==(p=c(o,u))||l(t,o)<0^u>0){do a.point(0===f||3===f?n:i,f>1?e:r);while((f=(f+u+4)%4)!==p)}else a.point(o[0],o[1])}function c(t,e){return Bt(t[0]-n)<bt?e>0?0:3:Bt(t[0]-i)<bt?e>0?2:1:Bt(t[1]-r)<bt?e>0?1:0:e>0?3:2}function a(n,t){return l(n.x,t.x)}function l(n,t){var r=c(n,1),i=c(t,1);return r!==i?r-i:0===r?t[1]-n[1]:1===r?n[0]-t[0]:2===r?n[1]-t[1]:t[0]-n[0]}return function(c){function l(n,t){o(n,t)&&A.point(n,t)}function f(){for(var t=0,r=0,i=E.length;r<i;++r)for(var o,u,c=E[r],a=1,l=c.length,f=c[0],p=f[0],s=f[1];a<l;++a)o=p,u=s,f=c[a],p=f[0],s=f[1],u<=e?s>e&&(p-o)*(e-u)>(s-u)*(n-o)&&++t:s<=e&&(p-o)*(e-u)<(s-u)*(n-o)&&--t;return t}function p(){A=j,d=[],E=[],R=!0}function s(){var n=f(),r=R&&n,i=(d=t.merge(d)).length;(r||i)&&(c.polygonStart(),r&&(c.lineStart(),u(null,null,1,c),c.lineEnd()),i&&Pr(d,a,n,u,c),c.polygonEnd()),A=c,d=E=S=null}function h(){P.point=v,E&&E.push(S=[]),w=!0,N=!1,M=_=NaN}function g(){d&&(v(y,m),x&&N&&j.rejoin(),d.push(j.result())),P.point=l,N&&A.lineEnd()}function v(t,u){var c=o(t,u);if(E&&S.push([t,u]),w)y=t,m=u,x=c,w=!1,c&&(A.lineStart(),A.point(t,u));else if(c&&N)A.point(t,u);else{var a=[M=Math.max(qr,Math.min(Cr,M)),_=Math.max(qr,Math.min(Cr,_))],l=[t=Math.max(qr,Math.min(Cr,t)),u=Math.max(qr,Math.min(Cr,u))];Ar(a,l,n,r,i,e)?(N||(A.lineStart(),A.point(a[0],a[1])),A.point(l[0],l[1]),c||A.lineEnd(),R=!1):c&&(A.lineStart(),A.point(t,u),R=!1)}M=t,_=u,N=c}var d,E,S,y,m,x,M,_,N,w,R,A=c,j=Rr(),P={point:l,lineStart:h,lineEnd:g,polygonStart:p,polygonEnd:s};return P}}function W(){Lr.point=nn,Lr.lineEnd=$}function $(){Lr.point=Lr.lineEnd=c}function nn(n,t){n*=Ft,t*=Ft,hr=n,gr=Kt(t),vr=Xt(t),Lr.point=tn}function tn(n,t){n*=Ft,t*=Ft;var r=Kt(t),i=Xt(t),e=Bt(n-hr),o=Xt(e),u=Kt(e),c=i*u,a=vr*r-gr*i*o,l=gr*r+vr*i*o;br.add(Ut(Vt(c*c+a*a),l)),hr=n,gr=r,vr=i}function rn(n,r,i){var e=t.range(n,r-bt,i).concat(r);return function(n){return e.map(function(t){return[n,t]})}}function en(n,r,i){var e=t.range(n,r-bt,i).concat(r);return function(n){return e.map(function(t){return[t,n]})}}function on(){function n(){return{type:"MultiLineString",coordinates:r()}}function r(){return t.range(Yt(u/E)*E,o,E).map(h).concat(t.range(Yt(f/S)*S,l,S).map(g)).concat(t.range(Yt(e/v)*v,i,v).filter(function(n){return Bt(n%E)>bt}).map(p)).concat(t.range(Yt(a/d)*d,c,d).filter(function(n){return Bt(n%S)>bt}).map(s))}var i,e,o,u,c,a,l,f,p,s,h,g,v=10,d=v,E=90,S=360,y=2.5;return n.lines=function(){return r().map(function(n){return{type:"LineString",coordinates:n}})},n.outline=function(){return{type:"Polygon",coordinates:[h(u).concat(g(l).slice(1),h(o).reverse().slice(1),g(f).reverse().slice(1))]}},n.extent=function(t){return arguments.length?n.extentMajor(t).extentMinor(t):n.extentMinor()},n.extentMajor=function(t){return arguments.length?(u=+t[0][0],o=+t[1][0],f=+t[0][1],l=+t[1][1],u>o&&(t=u,u=o,o=t),f>l&&(t=f,f=l,l=t),n.precision(y)):[[u,f],[o,l]]},n.extentMinor=function(t){return arguments.length?(e=+t[0][0],i=+t[1][0],a=+t[0][1],c=+t[1][1],e>i&&(t=e,e=i,i=t),a>c&&(t=a,a=c,c=t),n.precision(y)):[[e,a],[i,c]]},n.step=function(t){return arguments.length?n.stepMajor(t).stepMinor(t):n.stepMinor()},n.stepMajor=function(t){return arguments.length?(E=+t[0],S=+t[1],n):[E,S]},n.stepMinor=function(t){return arguments.length?(v=+t[0],d=+t[1],n):[v,d]},n.precision=function(t){return arguments.length?(y=+t,p=rn(a,c,90),s=en(e,i,y),h=rn(f,l,90),g=en(u,o,y),n):y},n.extentMajor([[-180,-90+bt],[180,90-bt]]).extentMinor([[-180,-80-bt],[180,80+bt]])}function un(){return on()()}function cn(){Ur.point=an}function an(n,t){Ur.point=ln,dr=Sr=n,Er=yr=t}function ln(n,t){Dr.add(yr*n-Sr*t),Sr=n,yr=t}function fn(){ln(dr,Er)}function pn(n,t){n<Xr&&(Xr=n),n>Zr&&(Zr=n),t<Yr&&(Yr=t),t>Hr&&(Hr=t)}function sn(n,t){Kr+=n,Qr+=t,++Vr}function hn(){ei.point=gn}function gn(n,t){ei.point=vn,sn(Mr=n,_r=t)}function vn(n,t){var r=n-Mr,i=t-_r,e=Vt(r*r+i*i);Wr+=e*(Mr+n)/2,$r+=e*(_r+t)/2,ni+=e,sn(Mr=n,_r=t)}function dn(){ei.point=sn}function En(){ei.point=yn}function Sn(){mn(mr,xr)}function yn(n,t){ei.point=mn,sn(mr=Mr=n,xr=_r=t)}function mn(n,t){var r=n-Mr,i=t-_r,e=Vt(r*r+i*i);Wr+=e*(Mr+n)/2,$r+=e*(_r+t)/2,ni+=e,e=_r*n-Mr*t,ti+=e*(Mr+n),ri+=e*(_r+t),ii+=3*e,sn(Mr=n,_r=t)}function xn(n){this._context=n}function Mn(){this._string=[]}function _n(n){return"m0,"+n+"a"+n+","+n+" 0 1,1 0,"+-2*n+"a"+n+","+n+" 0 1,1 0,"+2*n+"z"}function Nn(n){return n.length>1}function wn(n,t){return((n=n.x)[0]<0?n[1]-Tt-bt:Tt-n[1])-((t=t.x)[0]<0?t[1]-Tt-bt:Tt-t[1])}function Rn(n){var t,r=NaN,i=NaN,e=NaN;return{lineStart:function(){n.lineStart(),t=1},point:function(o,u){var c=o>0?Ot:-Ot,a=Bt(o-r);Bt(a-Ot)<bt?(n.point(r,i=(i+u)/2>0?Tt:-Tt),n.point(e,i),n.lineEnd(),n.lineStart(),n.point(c,i),n.point(o,i),t=0):e!==c&&a>=Ot&&(Bt(r-e)<bt&&(r-=e*bt),Bt(o-c)<bt&&(o-=c*bt),i=An(r,i,o,u),n.point(e,i),n.lineEnd(),n.lineStart(),n.point(c,i),t=0),n.point(r=o,i=u),e=c},lineEnd:function(){n.lineEnd(),r=i=NaN},clean:function(){return 2-t}}}function An(n,t,r,i){var e,o,u=Kt(n-r);return Bt(u)>bt?Dt((Kt(t)*(o=Xt(i))*Kt(r)-Kt(i)*(e=Xt(t))*Kt(n))/(e*o*u)):(t+i)/2}function jn(n,t,r,i){var e;if(null==n)e=r*Tt,i.point(-Ot,e),i.point(0,e),i.point(Ot,e),i.point(Ot,0),i.point(Ot,-e),i.point(0,-e),i.point(-Ot,-e),i.point(-Ot,0),i.point(-Ot,e);else if(Bt(n[0]-t[0])>bt){var o=n[0]<t[0]?Ot:-Ot;e=r*o/2,i.point(-o,e),i.point(0,e),i.point(o,e)}else i.point(t[0],t[1])}function Pn(n){return function(t){var r=new Cn;for(var i in n)r[i]=n[i];return r.stream=t,r}}function Cn(){}function qn(n,t,r){var i=t[1][0]-t[0][0],e=t[1][1]-t[0][1],o=n.clipExtent&&n.clipExtent();n.scale(150).translate([0,0]),null!=o&&n.clipExtent(null),tr(r,n.stream(Jr));var u=Jr.result(),c=Math.min(i/(u[1][0]-u[0][0]),e/(u[1][1]-u[0][1])),a=+t[0][0]+(i-c*(u[1][0]+u[0][0]))/2,l=+t[0][1]+(e-c*(u[1][1]+u[0][1]))/2;return null!=o&&n.clipExtent(o),n.scale(150*c).translate([a,l])}function zn(n,t,r){return qn(n,[[0,0],t],r)}function bn(n){return Pn({point:function(t,r){t=n(t,r),this.stream.point(t[0],t[1])}})}function Ln(n,t){function r(i,e,u,c,a,l,f,p,s,h,g,v,d,E){var S=f-i,y=p-e,m=S*S+y*y;if(m>4*t&&d--){var x=c+h,M=a+g,_=l+v,N=Vt(x*x+M*M+_*_),w=o(_/=N),R=Bt(Bt(_)-1)<bt||Bt(u-s)<bt?(u+s)/2:Ut(M,x),A=n(R,w),j=A[0],P=A[1],C=j-i,q=P-e,z=y*C-S*q;(z*z/m>t||Bt((S*C+y*q)/m-.5)>.3||c*h+a*g+l*v<hi)&&(r(i,e,u,c,a,l,j,P,R,x/=N,M/=N,_,d,E),E.point(j,P),r(j,P,R,x,M,_,f,p,s,h,g,v,d,E))}}return function(t){function i(r,i){r=n(r,i),t.point(r[0],r[1])}function e(){S=NaN,_.point=o,t.lineStart()}function o(i,e){var o=d([i,e]),u=n(i,e);r(S,y,E,m,x,M,S=u[0],y=u[1],E=i,m=o[0],x=o[1],M=o[2],si,t),t.point(S,y)}function u(){_.point=i,t.lineEnd()}function c(){e(),_.point=a,_.lineEnd=l}function a(n,t){o(f=n,t),p=S,s=y,h=m,g=x,v=M,_.point=o}function l(){r(S,y,E,m,x,M,p,s,f,h,g,v,si,t),_.lineEnd=u,u()}var f,p,s,h,g,v,E,S,y,m,x,M,_={point:i,lineStart:e,lineEnd:u,polygonStart:function(){t.polygonStart(),_.lineStart=c},polygonEnd:function(){t.polygonEnd(),_.lineStart=e}};return _}}function On(n){return Tn(function(){return n})()}function Tn(n){function t(n){return n=f(n[0]*Ft,n[1]*Ft),[n[0]*d+c,a-n[1]*d]}function r(n){return n=f.invert((n[0]-c)/d,(a-n[1])/d),n&&[n[0]*It,n[1]*It]}function i(n,t){return n=u(n,t),[n[0]*d+c,a-n[1]*d]}function e(){f=sr(l=U(x,M,_),u);var n=u(y,m);return c=E-n[0]*d,a=S+n[1]*d,o()}function o(){return g=v=null,t}var u,c,a,l,f,p,s,h,g,v,d=150,E=480,S=250,y=0,m=0,x=0,M=0,_=0,N=null,w=li,R=null,A=Fr,j=.5,P=gi(i,j);return t.stream=function(n){return g&&v===n?g:g=vi(w(l,P(A(v=n))))},t.clipAngle=function(n){return arguments.length?(w=+n?fi(N=n*Ft,6*Ft):(N=null,li),o()):N*It},t.clipExtent=function(n){return arguments.length?(A=null==n?(R=p=s=h=null,Fr):V(R=+n[0][0],p=+n[0][1],s=+n[1][0],h=+n[1][1]),o()):null==R?null:[[R,p],[s,h]]},t.scale=function(n){return arguments.length?(d=+n,e()):d},t.translate=function(n){return arguments.length?(E=+n[0],S=+n[1],e()):[E,S]},t.center=function(n){return arguments.length?(y=n[0]%360*Ft,m=n[1]%360*Ft,e()):[y*It,m*It]},t.rotate=function(n){return arguments.length?(x=n[0]%360*Ft,M=n[1]%360*Ft,_=n.length>2?n[2]%360*Ft:0,e()):[x*It,M*It,_*It]},t.precision=function(n){return arguments.length?(P=gi(i,j=n*n),o()):Vt(j)},t.fitExtent=function(n,r){return qn(t,n,r)},t.fitSize=function(n,r){return zn(t,n,r)},function(){return u=n.apply(this,arguments),t.invert=u.invert&&r,e()}}function Gn(n){var t=0,r=Ot/3,i=Tn(n),e=i(t,r);return e.parallels=function(n){return arguments.length?i(t=n[0]*Ft,r=n[1]*Ft):[t*It,r*It]},e}function kn(n){function t(n,t){return[n*r,Kt(t)/r]}var r=Xt(n);return t.invert=function(n,t){return[n/r,o(t*r)]},t}function In(n,t){function r(n,t){var r=Vt(u-2*e*Kt(t))/e;return[r*Kt(n*=e),c-r*Xt(n)]}var i=Kt(n),e=(i+Kt(t))/2;if(Bt(e)<bt)return kn(n);var u=1+i*(2*e-i),c=Vt(u)/e;return r.invert=function(n,t){var r=c-t;return[Ut(n,Bt(r))/e*Qt(r),o((u-(n*n+r*r)*e*e)/(2*e))]},r}function Fn(n){var t=n.length;return{point:function(r,i){for(var e=-1;++e<t;)n[e].point(r,i)},sphere:function(){for(var r=-1;++r<t;)n[r].sphere()},lineStart:function(){for(var r=-1;++r<t;)n[r].lineStart()},lineEnd:function(){for(var r=-1;++r<t;)n[r].lineEnd()},polygonStart:function(){for(var r=-1;++r<t;)n[r].polygonStart()},polygonEnd:function(){for(var r=-1;++r<t;)n[r].polygonEnd()}}}function Bn(n){return function(t,r){var i=Xt(t),e=Xt(r),o=n(i*e);return[o*e*Kt(t),o*Kt(r)]}}function Dn(n){return function(t,r){var i=Vt(t*t+r*r),e=n(i),u=Kt(e),c=Xt(e);return[Ut(t*u,i*c),o(i&&r*u/i)]}}function Un(n,t){return[n,Ht(Wt((Tt+t)/2))]}function Xn(n){var t,r=On(n),i=r.scale,e=r.translate,o=r.clipExtent;return r.scale=function(n){return arguments.length?(i(n),t&&r.clipExtent(null),r):i()},r.translate=function(n){return arguments.length?(e(n),t&&r.clipExtent(null),r):e()},r.clipExtent=function(n){if(!arguments.length)return t?null:o();if(t=null==n){var u=Ot*i(),c=e();n=[[c[0]-u,c[1]-u],[c[0]+u,c[1]+u]]}return o(n),r},r.clipExtent(null)}function Yn(n){return Wt((Tt+n)/2)}function Zn(n,t){function r(n,t){o>0?t<-Tt+bt&&(t=-Tt+bt):t>Tt-bt&&(t=Tt-bt);var r=o/Jt(Yn(t),e);return[r*Kt(e*n),o-r*Xt(e*n)]}var i=Xt(n),e=n===t?Kt(n):Ht(i/Xt(t))/Ht(Yn(t)/Yn(n)),o=i*Jt(Yn(n),e)/e;return e?(r.invert=function(n,t){var r=o-t,i=Qt(e)*Vt(n*n+r*r);return[Ut(n,Bt(r))/e*Qt(r),2*Dt(Jt(o/i,1/e))-Tt]},r):Un}function Hn(n,t){return[n,t]}function Jn(n,t){function r(n,t){var r=o-t,i=e*n;return[r*Kt(i),o-r*Xt(i)]}var i=Xt(n),e=n===t?Kt(n):(i-Xt(t))/(t-n),o=i/e+n;return Bt(e)<bt?Hn:(r.invert=function(n,t){var r=o-t;return[Ut(n,Bt(r))/e*Qt(r),o-Qt(e)*Vt(n*n+r*r)]},r)}function Kn(n,t){var r=Xt(t),i=Xt(n)*r;return[r*Kt(n)/i,Kt(t)/i]}function Qn(n,t,r,i){return 1===n&&1===t&&0===r&&0===i?Fr:Pn({point:function(e,o){this.stream.point(e*n+r,o*t+i)}})}function Vn(n,t){return[Xt(t)*Kt(n),Kt(t)]}function Wn(n,t){var r=Xt(t),i=1+Xt(n)*r;return[r*Kt(n)/i,Kt(t)/i]}function $n(n,t){return[Ht(Wt((Tt+t)/2)),-n]}var nt=function(){return new r};r.prototype={constructor:r,reset:function(){this.s=this.t=0},add:function(n){i(zt,n,this.t),i(this,zt.s,this.s),this.s?this.t+=zt.t:this.s=zt.t},valueOf:function(){return this.s}};var tt,rt,it,et,ot,ut,ct,at,lt,ft,pt,st,ht,gt,vt,dt,Et,St,yt,mt,xt,Mt,_t,Nt,wt,Rt,At,jt,Pt,Ct,qt,zt=new r,bt=1e-6,Lt=1e-12,Ot=Math.PI,Tt=Ot/2,Gt=Ot/4,kt=2*Ot,It=180/Ot,Ft=Ot/180,Bt=Math.abs,Dt=Math.atan,Ut=Math.atan2,Xt=Math.cos,Yt=Math.ceil,Zt=Math.exp,Ht=Math.log,Jt=Math.pow,Kt=Math.sin,Qt=Math.sign||function(n){return n>0?1:n<0?-1:0},Vt=Math.sqrt,Wt=Math.tan,$t={Feature:function(n,t){a(n.geometry,t)},FeatureCollection:function(n,t){for(var r=n.features,i=-1,e=r.length;++i<e;)a(r[i].geometry,t)}},nr={Sphere:function(n,t){t.sphere()},Point:function(n,t){n=n.coordinates,t.point(n[0],n[1],n[2])},MultiPoint:function(n,t){for(var r=n.coordinates,i=-1,e=r.length;++i<e;)n=r[i],t.point(n[0],n[1],n[2])},LineString:function(n,t){l(n.coordinates,t,0)},MultiLineString:function(n,t){for(var r=n.coordinates,i=-1,e=r.length;++i<e;)l(r[i],t,0)},Polygon:function(n,t){f(n.coordinates,t)},MultiPolygon:function(n,t){for(var r=n.coordinates,i=-1,e=r.length;++i<e;)f(r[i],t)},GeometryCollection:function(n,t){for(var r=n.geometries,i=-1,e=r.length;++i<e;)a(r[i],t)}},tr=function(n,t){n&&$t.hasOwnProperty(n.type)?$t[n.type](n,t):a(n,t)},rr=nt(),ir=nt(),er={point:c,lineStart:c,lineEnd:c,polygonStart:function(){rr.reset(),er.lineStart=p,er.lineEnd=s},polygonEnd:function(){var n=+rr;ir.add(n<0?kt+n:n),this.lineStart=this.lineEnd=this.point=c},sphere:function(){ir.add(kt)}},or=function(n){return ir.reset(),tr(n,er),2*ir},ur=nt(),cr={point:M,lineStart:N,lineEnd:w,polygonStart:function(){cr.point=R,cr.lineStart=A,cr.lineEnd=j,ur.reset(),er.polygonStart()},polygonEnd:function(){er.polygonEnd(),cr.point=M,cr.lineStart=N,cr.lineEnd=w,rr<0?(ut=-(at=180),ct=-(lt=90)):ur>bt?lt=90:ur<-bt&&(ct=-90),vt[0]=ut,vt[1]=at}},ar=function(n){var t,r,i,e,o,u,c;if(lt=at=-(ut=ct=1/0),gt=[],tr(n,cr),r=gt.length){for(gt.sort(C),t=1,i=gt[0],o=[i];t<r;++t)e=gt[t],q(i,e[0])||q(i,e[1])?(P(i[0],e[1])>P(i[0],i[1])&&(i[1]=e[1]),P(e[0],i[1])>P(i[0],i[1])&&(i[0]=e[0])):o.push(i=e);for(u=-(1/0),r=o.length-1,t=0,i=o[r];t<=r;i=e,++t)e=o[t],(c=P(i[1],e[0]))>u&&(u=c,ut=e[0],at=i[1])}return gt=vt=null,ut===1/0||ct===1/0?[[NaN,NaN],[NaN,NaN]]:[[ut,ct],[at,lt]]},lr={sphere:c,point:z,lineStart:L,lineEnd:G,polygonStart:function(){lr.lineStart=k,lr.lineEnd=I},polygonEnd:function(){lr.lineStart=L,lr.lineEnd=G}},fr=function(n){dt=Et=St=yt=mt=xt=Mt=_t=Nt=wt=Rt=0,tr(n,lr);var t=Nt,r=wt,i=Rt,e=t*t+r*r+i*i;return e<Lt&&(t=xt,r=Mt,i=_t,Et<bt&&(t=St,r=yt,i=mt),e=t*t+r*r+i*i,e<Lt)?[NaN,NaN]:[Ut(r,t)*It,o(i/Vt(e))*It]},pr=function(n){return function(){return n}},sr=function(n,t){function r(r,i){return r=n(r,i),t(r[0],r[1])}return n.invert&&t.invert&&(r.invert=function(r,i){return r=t.invert(r,i),r&&n.invert(r[0],r[1])}),r};D.invert=D;var hr,gr,vr,dr,Er,Sr,yr,mr,xr,Mr,_r,Nr=function(n){function t(t){return t=n(t[0]*Ft,t[1]*Ft),t[0]*=It,t[1]*=It,t}return n=U(n[0]*Ft,n[1]*Ft,n.length>2?n[2]*Ft:0),t.invert=function(t){return t=n.invert(t[0]*Ft,t[1]*Ft),t[0]*=It,t[1]*=It,t},t},wr=function(){function n(n,t){r.push(n=i(n,t)),n[0]*=It,n[1]*=It}function t(){var n=e.apply(this,arguments),t=o.apply(this,arguments)*Ft,a=u.apply(this,arguments)*Ft;return r=[],i=U(-n[0]*Ft,-n[1]*Ft,0).invert,H(c,t,a,1),n={type:"Polygon",coordinates:[r]},r=i=null,n}var r,i,e=pr([0,0]),o=pr(90),u=pr(6),c={point:n};return t.center=function(n){return arguments.length?(e="function"==typeof n?n:pr([+n[0],+n[1]]),t):e},t.radius=function(n){return arguments.length?(o="function"==typeof n?n:pr(+n),t):o},t.precision=function(n){return arguments.length?(u="function"==typeof n?n:pr(+n),t):u},t},Rr=function(){var n,t=[];return{point:function(t,r){n.push([t,r])},lineStart:function(){t.push(n=[])},lineEnd:c,rejoin:function(){t.length>1&&t.push(t.pop().concat(t.shift()))},result:function(){var r=t;return t=[],n=null,r}}},Ar=function(n,t,r,i,e,o){var u,c=n[0],a=n[1],l=t[0],f=t[1],p=0,s=1,h=l-c,g=f-a;if(u=r-c,h||!(u>0)){if(u/=h,h<0){if(u<p)return;u<s&&(s=u)}else if(h>0){if(u>s)return;u>p&&(p=u)}if(u=e-c,h||!(u<0)){if(u/=h,h<0){if(u>s)return;u>p&&(p=u)}else if(h>0){if(u<p)return;u<s&&(s=u)}if(u=i-a,g||!(u>0)){if(u/=g,g<0){if(u<p)return;u<s&&(s=u)}else if(g>0){if(u>s)return;u>p&&(p=u)}if(u=o-a,g||!(u<0)){if(u/=g,g<0){if(u>s)return;u>p&&(p=u)}else if(g>0){if(u<p)return;u<s&&(s=u)}return p>0&&(n[0]=c+p*h,n[1]=a+p*g),s<1&&(t[0]=c+s*h,t[1]=a+s*g),!0}}}}},jr=function(n,t){return Bt(n[0]-t[0])<bt&&Bt(n[1]-t[1])<bt},Pr=function(n,t,r,i,e){var o,u,c=[],a=[];if(n.forEach(function(n){if(!((t=n.length-1)<=0)){var t,r,i=n[0],u=n[t];if(jr(i,u)){for(e.lineStart(),o=0;o<t;++o)e.point((i=n[o])[0],i[1]);return void e.lineEnd()}c.push(r=new K(i,n,null,!0)),a.push(r.o=new K(i,null,r,!1)),c.push(r=new K(u,n,null,!1)),a.push(r.o=new K(u,null,r,!0))}}),c.length){for(a.sort(t),Q(c),Q(a),o=0,u=a.length;o<u;++o)a[o].e=r=!r;for(var l,f,p=c[0];;){for(var s=p,h=!0;s.v;)if((s=s.n)===p)return;l=s.z,e.lineStart();do{if(s.v=s.o.v=!0,s.e){if(h)for(o=0,u=l.length;o<u;++o)e.point((f=l[o])[0],f[1]);else i(s.x,s.n.x,1,e);s=s.n}else{if(h)for(l=s.p.z,o=l.length-1;o>=0;--o)e.point((f=l[o])[0],f[1]);else i(s.x,s.p.x,-1,e);s=s.p}s=s.o,l=s.z,h=!h}while(!s.v);e.lineEnd()}}},Cr=1e9,qr=-Cr,zr=function(){var n,t,r,i=0,e=0,o=960,u=500;return r={stream:function(r){return n&&t===r?n:n=V(i,e,o,u)(t=r)},extent:function(c){return arguments.length?(i=+c[0][0],e=+c[0][1],o=+c[1][0],u=+c[1][1],n=t=null,r):[[i,e],[o,u]]}}},br=nt(),Lr={sphere:c,point:c,lineStart:W,lineEnd:c,polygonStart:c,polygonEnd:c},Or=function(n){return br.reset(),tr(n,Lr),+br},Tr=[null,null],Gr={type:"LineString",coordinates:Tr},kr=function(n,t){return Tr[0]=n,Tr[1]=t,Or(Gr)},Ir=function(n,t){var r=n[0]*Ft,i=n[1]*Ft,e=t[0]*Ft,c=t[1]*Ft,a=Xt(i),l=Kt(i),f=Xt(c),p=Kt(c),s=a*Xt(r),h=a*Kt(r),g=f*Xt(e),v=f*Kt(e),d=2*o(Vt(u(c-i)+a*f*u(e-r))),E=Kt(d),S=d?function(n){var t=Kt(n*=d)/E,r=Kt(d-n)/E,i=r*s+t*g,e=r*h+t*v,o=r*l+t*p;return[Ut(e,i)*It,Ut(o,Vt(i*i+e*e))*It]}:function(){return[r*It,i*It]};return S.distance=d,S},Fr=function(n){return n},Br=nt(),Dr=nt(),Ur={point:c,lineStart:c,lineEnd:c,polygonStart:function(){Ur.lineStart=cn,Ur.lineEnd=fn},polygonEnd:function(){Ur.lineStart=Ur.lineEnd=Ur.point=c,Br.add(Bt(Dr)),Dr.reset()},result:function(){var n=Br/2;return Br.reset(),n}},Xr=1/0,Yr=Xr,Zr=-Xr,Hr=Zr,Jr={point:pn,lineStart:c,lineEnd:c,polygonStart:c,polygonEnd:c,result:function(){var n=[[Xr,Yr],[Zr,Hr]];return Zr=Hr=-(Yr=Xr=1/0),n}},Kr=0,Qr=0,Vr=0,Wr=0,$r=0,ni=0,ti=0,ri=0,ii=0,ei={point:sn,lineStart:hn,lineEnd:dn,polygonStart:function(){ei.lineStart=En,ei.lineEnd=Sn},polygonEnd:function(){ei.point=sn,ei.lineStart=hn,ei.lineEnd=dn},result:function(){var n=ii?[ti/ii,ri/ii]:ni?[Wr/ni,$r/ni]:Vr?[Kr/Vr,Qr/Vr]:[NaN,NaN];return Kr=Qr=Vr=Wr=$r=ni=ti=ri=ii=0,n}};xn.prototype={_radius:4.5,pointRadius:function(n){return this._radius=n,this},polygonStart:function(){this._line=0},polygonEnd:function(){this._line=NaN},lineStart:function(){this._point=0},lineEnd:function(){0===this._line&&this._context.closePath(),this._point=NaN},point:function(n,t){switch(this._point){case 0:this._context.moveTo(n,t),this._point=1;break;case 1:this._context.lineTo(n,t);break;default:this._context.moveTo(n+this._radius,t),this._context.arc(n,t,this._radius,0,kt)}},result:c},Mn.prototype={_circle:_n(4.5),pointRadius:function(n){return this._circle=_n(n),this},polygonStart:function(){this._line=0},polygonEnd:function(){this._line=NaN},lineStart:function(){this._point=0},lineEnd:function(){0===this._line&&this._string.push("Z"),this._point=NaN},point:function(n,t){switch(this._point){case 0:this._string.push("M",n,",",t),this._point=1;break;case 1:this._string.push("L",n,",",t);break;default:this._string.push("M",n,",",t,this._circle)}},result:function(){if(this._string.length){var n=this._string.join("");return this._string=[],n}}};var oi=function(n,t){function r(n){return n&&("function"==typeof o&&e.pointRadius(+o.apply(this,arguments)),tr(n,i(e))),e.result()}var i,e,o=4.5;return r.area=function(n){return tr(n,i(Ur)),Ur.result()},r.bounds=function(n){return tr(n,i(Jr)),Jr.result()},r.centroid=function(n){return tr(n,i(ei)),ei.result()},r.projection=function(t){return arguments.length?(i=null==t?(n=null,Fr):(n=t).stream,r):n},r.context=function(n){return arguments.length?(e=null==n?(t=null,new Mn):new xn(t=n),"function"!=typeof o&&e.pointRadius(o),r):t},r.pointRadius=function(n){return arguments.length?(o="function"==typeof n?n:(e.pointRadius(+n),+n),r):o},r.projection(n).context(t)},ui=nt(),ci=function(n,t){var r=t[0],i=t[1],e=[Kt(r),-Xt(r),0],u=0,c=0;ui.reset();for(var a=0,l=n.length;a<l;++a)if(p=(f=n[a]).length)for(var f,p,s=f[p-1],h=s[0],g=s[1]/2+Gt,v=Kt(g),E=Xt(g),y=0;y<p;++y,h=M,v=N,E=w,s=m){var m=f[y],M=m[0],_=m[1]/2+Gt,N=Kt(_),w=Xt(_),R=M-h,A=R>=0?1:-1,j=A*R,P=j>Ot,C=v*N;if(ui.add(Ut(C*A*Kt(j),E*w+C*Xt(j))),u+=P?R+A*kt:R,P^h>=r^M>=r){var q=S(d(s),d(m));x(q);var z=S(e,q);x(z);var b=(P^R>=0?-1:1)*o(z[2]);(i>b||i===b&&(q[0]||q[1]))&&(c+=P^R>=0?1:-1)}}return(u<-bt||u<bt&&ui<-bt)^1&c},ai=function(n,r,i,e){return function(o,u){function c(t,r){var i=o(t,r);n(t=i[0],r=i[1])&&u.point(t,r)}function a(n,t){var r=o(n,t);E.point(r[0],r[1])}function l(){M.point=a,E.lineStart()}function f(){M.point=c,E.lineEnd()}function p(n,t){d.push([n,t]);var r=o(n,t);m.point(r[0],r[1])}function s(){m.lineStart(),d=[]}function h(){p(d[0][0],d[0][1]),m.lineEnd();var n,t,r,i,e=m.clean(),o=y.result(),c=o.length;if(d.pop(),g.push(d),d=null,c)if(1&e){if(r=o[0],(t=r.length-1)>0){for(x||(u.polygonStart(),x=!0),u.lineStart(),n=0;n<t;++n)u.point((i=r[n])[0],i[1]);u.lineEnd()}}else c>1&&2&e&&o.push(o.pop().concat(o.shift())),v.push(o.filter(Nn))}var g,v,d,E=r(u),S=o.invert(e[0],e[1]),y=Rr(),m=r(y),x=!1,M={point:c,lineStart:l,lineEnd:f,polygonStart:function(){M.point=p,M.lineStart=s,M.lineEnd=h,v=[],g=[]},polygonEnd:function(){M.point=c,M.lineStart=l,M.lineEnd=f,v=t.merge(v);var n=ci(g,S);v.length?(x||(u.polygonStart(),x=!0),Pr(v,wn,n,i,u)):n&&(x||(u.polygonStart(),x=!0),u.lineStart(),i(null,null,1,u),u.lineEnd()),x&&(u.polygonEnd(),x=!1),v=g=null},sphere:function(){u.polygonStart(),u.lineStart(),i(null,null,1,u),u.lineEnd(),u.polygonEnd()}};return M}},li=ai(function(){return!0},Rn,jn,[-Ot,-Tt]),fi=function(n,t){function r(r,i,e,o){H(o,n,t,e,r,i)}function i(n,t){return Xt(n)*Xt(t)>c}function e(n){var t,r,e,c,f;return{lineStart:function(){c=e=!1,f=1},point:function(p,s){var h,g=[p,s],v=i(p,s),d=a?v?0:u(p,s):v?u(p+(p<0?Ot:-Ot),s):0;if(!t&&(c=e=v)&&n.lineStart(),v!==e&&(h=o(t,g),(jr(t,h)||jr(g,h))&&(g[0]+=bt,g[1]+=bt,v=i(g[0],g[1]))),v!==e)f=0,v?(n.lineStart(),h=o(g,t),n.point(h[0],h[1])):(h=o(t,g),n.point(h[0],h[1]),n.lineEnd()),t=h;else if(l&&t&&a^v){var E;d&r||!(E=o(g,t,!0))||(f=0,a?(n.lineStart(),n.point(E[0][0],E[0][1]),n.point(E[1][0],E[1][1]),n.lineEnd()):(n.point(E[1][0],E[1][1]),n.lineEnd(),n.lineStart(),n.point(E[0][0],E[0][1])))}!v||t&&jr(t,g)||n.point(g[0],g[1]),t=g,e=v,r=d},lineEnd:function(){e&&n.lineEnd(),t=null},clean:function(){return f|(c&&e)<<1}}}function o(n,t,r){var i=d(n),e=d(t),o=[1,0,0],u=S(i,e),a=E(u,u),l=u[0],f=a-l*l;if(!f)return!r&&n;var p=c*a/f,s=-c*l/f,h=S(o,u),g=m(o,p),x=m(u,s);y(g,x);var M=h,_=E(g,M),N=E(M,M),w=_*_-N*(E(g,g)-1);if(!(w<0)){var R=Vt(w),A=m(M,(-_-R)/N);if(y(A,g),A=v(A),!r)return A;var j,P=n[0],C=t[0],q=n[1],z=t[1];C<P&&(j=P,P=C,C=j);var b=C-P,L=Bt(b-Ot)<bt,O=L||b<bt;if(!L&&z<q&&(j=q,q=z,z=j),O?L?q+z>0^A[1]<(Bt(A[0]-P)<bt?q:z):q<=A[1]&&A[1]<=z:b>Ot^(P<=A[0]&&A[0]<=C)){var T=m(M,(-_+R)/N);return y(T,g),[A,v(T)]}}}function u(t,r){var i=a?n:Ot-n,e=0;return t<-i?e|=1:t>i&&(e|=2),r<-i?e|=4:r>i&&(e|=8),e}var c=Xt(n),a=c>0,l=Bt(c)>bt;return ai(i,e,r,a?[0,-n]:[-Ot,n-Ot])},pi=function(n){return{stream:Pn(n)}};Cn.prototype={constructor:Cn,point:function(n,t){this.stream.point(n,t)},sphere:function(){this.stream.sphere()},lineStart:function(){this.stream.lineStart()},lineEnd:function(){this.stream.lineEnd()},polygonStart:function(){this.stream.polygonStart()},polygonEnd:function(){this.stream.polygonEnd()}};var si=16,hi=Xt(30*Ft),gi=function(n,t){return+t?Ln(n,t):bn(n)},vi=Pn({point:function(n,t){this.stream.point(n*Ft,t*Ft)}}),di=function(){return Gn(In).scale(155.424).center([0,33.6442])},Ei=function(){return di().parallels([29.5,45.5]).scale(1070).translate([480,250]).rotate([96,0]).center([-.6,38.7])},Si=function(){function n(n){var t=n[0],r=n[1];return c=null,e.point(t,r),c||(o.point(t,r),c)||(u.point(t,r),c)}function t(){return r=i=null,n}var r,i,e,o,u,c,a=Ei(),l=di().rotate([154,0]).center([-2,58.5]).parallels([55,65]),f=di().rotate([157,0]).center([-3,19.9]).parallels([8,18]),p={point:function(n,t){c=[n,t]}};return n.invert=function(n){var t=a.scale(),r=a.translate(),i=(n[0]-r[0])/t,e=(n[1]-r[1])/t;return(e>=.12&&e<.234&&i>=-.425&&i<-.214?l:e>=.166&&e<.234&&i>=-.214&&i<-.115?f:a).invert(n)},n.stream=function(n){return r&&i===n?r:r=Fn([a.stream(i=n),l.stream(n),f.stream(n)])},n.precision=function(n){return arguments.length?(a.precision(n),l.precision(n),f.precision(n),t()):a.precision()},n.scale=function(t){return arguments.length?(a.scale(t),l.scale(.35*t),f.scale(t),n.translate(a.translate())):a.scale()},n.translate=function(n){if(!arguments.length)return a.translate();var r=a.scale(),i=+n[0],c=+n[1];return e=a.translate(n).clipExtent([[i-.455*r,c-.238*r],[i+.455*r,c+.238*r]]).stream(p),o=l.translate([i-.307*r,c+.201*r]).clipExtent([[i-.425*r+bt,c+.12*r+bt],[i-.214*r-bt,c+.234*r-bt]]).stream(p),u=f.translate([i-.205*r,c+.212*r]).clipExtent([[i-.214*r+bt,c+.166*r+bt],[i-.115*r-bt,c+.234*r-bt]]).stream(p),t()},n.fitExtent=function(t,r){return qn(n,t,r)},n.fitSize=function(t,r){return zn(n,t,r)},n.scale(1070)},yi=Bn(function(n){return Vt(2/(1+n))});yi.invert=Dn(function(n){return 2*o(n/2)});var mi=function(){return On(yi).scale(124.75).clipAngle(179.999)},xi=Bn(function(n){return(n=e(n))&&n/Kt(n)});xi.invert=Dn(function(n){return n});var Mi=function(){return On(xi).scale(79.4188).clipAngle(179.999)};Un.invert=function(n,t){return[n,2*Dt(Zt(t))-Tt]};var _i=function(){return Xn(Un).scale(961/kt)},Ni=function(){return Gn(Zn).scale(109.5).parallels([30,30])};Hn.invert=Hn;var wi=function(){return On(Hn).scale(152.63)},Ri=function(){return Gn(Jn).scale(131.154).center([0,13.9389])};Kn.invert=Dn(Dt);var Ai=function(){return On(Kn).scale(144.049).clipAngle(60)},ji=function(){function n(){return e=o=null,u}var t,r,i,e,o,u,c=1,a=0,l=0,f=1,p=1,s=Fr,h=null,g=Fr;return u={stream:function(n){return e&&o===n?e:e=s(g(o=n))},clipExtent:function(e){return arguments.length?(g=null==e?(h=t=r=i=null,Fr):V(h=+e[0][0],t=+e[0][1],r=+e[1][0],i=+e[1][1]),n()):null==h?null:[[h,t],[r,i]]},scale:function(t){return arguments.length?(s=Qn((c=+t)*f,c*p,a,l),n()):c},translate:function(t){return arguments.length?(s=Qn(c*f,c*p,a=+t[0],l=+t[1]),n()):[a,l]},reflectX:function(t){return arguments.length?(s=Qn(c*(f=t?-1:1),c*p,a,l),n()):f<0},reflectY:function(t){return arguments.length?(s=Qn(c*f,c*(p=t?-1:1),a,l),n()):p<0},fitExtent:function(n,t){return qn(u,n,t)},fitSize:function(n,t){return zn(u,n,t)}}};Vn.invert=Dn(o);var Pi=function(){return On(Vn).scale(249.5).clipAngle(90+bt)};Wn.invert=Dn(function(n){return 2*Dt(n)});var Ci=function(){return On(Wn).scale(250).clipAngle(142)};$n.invert=function(n,t){return[-t,2*Dt(Zt(n))-Tt]};var qi=function(){var n=Xn($n),t=n.center,r=n.rotate;return n.center=function(n){return arguments.length?t([-n[1],n[0]]):(n=t(),[n[1],-n[0]])},n.rotate=function(n){return arguments.length?r([n[0],n[1],n.length>2?n[2]+90:90]):(n=r(),[n[0],n[1],n[2]-90])},r([0,0,90]).scale(159.155)};n.geoArea=or,n.geoBounds=ar,n.geoCentroid=fr,n.geoCircle=wr,n.geoClipExtent=zr,n.geoDistance=kr,n.geoGraticule=on,n.geoGraticule10=un,n.geoInterpolate=Ir,n.geoLength=Or,n.geoPath=oi,n.geoAlbers=Ei,n.geoAlbersUsa=Si,n.geoAzimuthalEqualArea=mi,n.geoAzimuthalEqualAreaRaw=yi,n.geoAzimuthalEquidistant=Mi,n.geoAzimuthalEquidistantRaw=xi,n.geoConicConformal=Ni,n.geoConicConformalRaw=Zn,n.geoConicEqualArea=di,n.geoConicEqualAreaRaw=In,n.geoConicEquidistant=Ri,n.geoConicEquidistantRaw=Jn,n.geoEquirectangular=wi,n.geoEquirectangularRaw=Hn,n.geoGnomonic=Ai,n.geoGnomonicRaw=Kn,n.geoIdentity=ji,n.geoProjection=On,n.geoProjectionMutator=Tn,n.geoMercator=_i,n.geoMercatorRaw=Un,n.geoOrthographic=Pi,n.geoOrthographicRaw=Vn,n.geoStereographic=Ci,n.geoStereographicRaw=Wn,n.geoTransverseMercator=qi,n.geoTransverseMercatorRaw=$n,n.geoRotation=Nr,n.geoStream=tr,n.geoTransform=pi,Object.defineProperty(n,"__esModule",{value:!0})});