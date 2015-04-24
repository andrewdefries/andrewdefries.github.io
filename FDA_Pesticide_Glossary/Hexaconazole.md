---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.240076, 1.075986, -2.033988, 1, 0, 0, 1,
-3.063422, -1.597362, -1.013099, 1, 0.007843138, 0, 1,
-2.771507, 0.8884674, -1.57221, 1, 0.01176471, 0, 1,
-2.690878, -0.49348, -3.010255, 1, 0.01960784, 0, 1,
-2.627068, 0.5065086, -2.729477, 1, 0.02352941, 0, 1,
-2.604573, -1.361651, -1.639092, 1, 0.03137255, 0, 1,
-2.560738, -1.47405, -2.10694, 1, 0.03529412, 0, 1,
-2.428244, -1.05039, -2.818304, 1, 0.04313726, 0, 1,
-2.361981, -0.6346319, -0.847307, 1, 0.04705882, 0, 1,
-2.323062, 1.057496, 0.1259097, 1, 0.05490196, 0, 1,
-2.309353, -0.622209, 0.2520354, 1, 0.05882353, 0, 1,
-2.281734, -0.1226013, -1.908887, 1, 0.06666667, 0, 1,
-2.257824, -0.1815895, -0.3424178, 1, 0.07058824, 0, 1,
-2.224493, 0.1645205, -1.525726, 1, 0.07843138, 0, 1,
-2.2151, 0.06109352, -0.8010805, 1, 0.08235294, 0, 1,
-2.208391, -2.051313, -2.582079, 1, 0.09019608, 0, 1,
-2.191447, -1.345897, -4.317039, 1, 0.09411765, 0, 1,
-2.137329, 0.134655, -1.123292, 1, 0.1019608, 0, 1,
-2.098925, 1.197038, -0.1000259, 1, 0.1098039, 0, 1,
-2.076046, -0.02377461, -2.751287, 1, 0.1137255, 0, 1,
-2.037971, -0.8045538, -0.9191948, 1, 0.1215686, 0, 1,
-2.01484, -1.710946, -0.05952281, 1, 0.1254902, 0, 1,
-2.00511, 0.2552966, -2.778538, 1, 0.1333333, 0, 1,
-2.001734, 0.3253241, -2.095195, 1, 0.1372549, 0, 1,
-1.988193, 0.8357992, -2.235261, 1, 0.145098, 0, 1,
-1.987925, -0.1368433, -1.48481, 1, 0.1490196, 0, 1,
-1.982429, 0.4462976, -0.3055848, 1, 0.1568628, 0, 1,
-1.956374, 0.379097, 0.1572689, 1, 0.1607843, 0, 1,
-1.950395, 0.1964927, 1.789895, 1, 0.1686275, 0, 1,
-1.936565, 0.3265329, -1.642935, 1, 0.172549, 0, 1,
-1.924559, 2.44978, -2.463422, 1, 0.1803922, 0, 1,
-1.906774, -1.089796, -1.59576, 1, 0.1843137, 0, 1,
-1.905017, 0.9514892, -1.181438, 1, 0.1921569, 0, 1,
-1.901126, -1.780466, -1.038628, 1, 0.1960784, 0, 1,
-1.890744, 1.005446, -0.3457451, 1, 0.2039216, 0, 1,
-1.880792, 0.7293246, -1.058513, 1, 0.2117647, 0, 1,
-1.880646, 1.691998, 0.8095825, 1, 0.2156863, 0, 1,
-1.878904, -0.7766943, -1.57246, 1, 0.2235294, 0, 1,
-1.877529, -2.180038, -0.3678358, 1, 0.227451, 0, 1,
-1.845792, -1.269494, -1.693261, 1, 0.2352941, 0, 1,
-1.835106, 0.3031813, -1.851785, 1, 0.2392157, 0, 1,
-1.711366, 0.02696589, -1.885915, 1, 0.2470588, 0, 1,
-1.703209, -0.01607008, -0.5336411, 1, 0.2509804, 0, 1,
-1.701872, -0.47212, -2.377888, 1, 0.2588235, 0, 1,
-1.70181, 1.420925, -1.88717, 1, 0.2627451, 0, 1,
-1.69111, -0.2520752, -2.214218, 1, 0.2705882, 0, 1,
-1.688853, 0.149487, 0.4342124, 1, 0.2745098, 0, 1,
-1.679913, 1.053419, 0.5636128, 1, 0.282353, 0, 1,
-1.65334, 0.1954862, -2.005618, 1, 0.2862745, 0, 1,
-1.618406, -0.09574452, -1.843968, 1, 0.2941177, 0, 1,
-1.616483, 1.53468, -0.9613388, 1, 0.3019608, 0, 1,
-1.601009, -1.360213, -2.7132, 1, 0.3058824, 0, 1,
-1.585841, -1.059758, -2.80135, 1, 0.3137255, 0, 1,
-1.576785, 0.8442127, -0.9876536, 1, 0.3176471, 0, 1,
-1.576077, -1.223913, -1.718343, 1, 0.3254902, 0, 1,
-1.562498, 1.970928, -0.5794437, 1, 0.3294118, 0, 1,
-1.556714, -1.279482, -1.980538, 1, 0.3372549, 0, 1,
-1.545636, 1.180899, 1.453009, 1, 0.3411765, 0, 1,
-1.537135, -0.3689668, -3.817178, 1, 0.3490196, 0, 1,
-1.535479, 0.3421968, 0.790525, 1, 0.3529412, 0, 1,
-1.52226, 1.016367, -1.253253, 1, 0.3607843, 0, 1,
-1.521226, 0.0452249, -0.745265, 1, 0.3647059, 0, 1,
-1.517375, 0.8272447, -1.708375, 1, 0.372549, 0, 1,
-1.514102, 0.5723006, -0.6006956, 1, 0.3764706, 0, 1,
-1.497225, 0.2259788, -0.453438, 1, 0.3843137, 0, 1,
-1.474713, 0.8521675, -0.09004008, 1, 0.3882353, 0, 1,
-1.467287, 0.6115598, -1.634604, 1, 0.3960784, 0, 1,
-1.454115, 0.2875865, -1.382384, 1, 0.4039216, 0, 1,
-1.43467, 0.1261053, 0.1996994, 1, 0.4078431, 0, 1,
-1.434274, -0.3341907, -2.249491, 1, 0.4156863, 0, 1,
-1.433213, -0.006328373, -1.706333, 1, 0.4196078, 0, 1,
-1.431895, 1.988917, -0.1861982, 1, 0.427451, 0, 1,
-1.427959, -0.8776342, -3.210595, 1, 0.4313726, 0, 1,
-1.423459, -1.115607, -2.330798, 1, 0.4392157, 0, 1,
-1.422848, 0.05958284, -2.361012, 1, 0.4431373, 0, 1,
-1.421232, 1.198043, 0.4227705, 1, 0.4509804, 0, 1,
-1.40838, -1.089918, -3.193344, 1, 0.454902, 0, 1,
-1.390572, -1.578098, -2.546795, 1, 0.4627451, 0, 1,
-1.366982, 0.2163726, -1.094068, 1, 0.4666667, 0, 1,
-1.361527, 0.4353562, -0.3293838, 1, 0.4745098, 0, 1,
-1.35865, 0.1420835, -1.929826, 1, 0.4784314, 0, 1,
-1.340582, -2.442636, -2.675502, 1, 0.4862745, 0, 1,
-1.337361, -0.9873689, -4.326541, 1, 0.4901961, 0, 1,
-1.336984, 3.468588, -0.67463, 1, 0.4980392, 0, 1,
-1.335482, 1.293824, -1.277242, 1, 0.5058824, 0, 1,
-1.333973, -0.634677, -0.9667343, 1, 0.509804, 0, 1,
-1.327235, 2.275996, -1.640289, 1, 0.5176471, 0, 1,
-1.327161, -0.8780733, -2.455852, 1, 0.5215687, 0, 1,
-1.327059, -0.3621609, -3.104191, 1, 0.5294118, 0, 1,
-1.324873, 1.218457, 0.2375019, 1, 0.5333334, 0, 1,
-1.324223, -0.9803731, -2.473274, 1, 0.5411765, 0, 1,
-1.311598, -1.733071, -3.223178, 1, 0.5450981, 0, 1,
-1.311325, -0.7542406, -1.120205, 1, 0.5529412, 0, 1,
-1.301393, -1.38429, -4.031393, 1, 0.5568628, 0, 1,
-1.293443, -1.194194, -2.018631, 1, 0.5647059, 0, 1,
-1.288307, 0.5248263, 0.08668233, 1, 0.5686275, 0, 1,
-1.273375, 2.056944, -1.160885, 1, 0.5764706, 0, 1,
-1.272047, 0.2230336, 0.07603253, 1, 0.5803922, 0, 1,
-1.265047, 0.6077788, -0.09900476, 1, 0.5882353, 0, 1,
-1.261786, -2.067078, -1.823018, 1, 0.5921569, 0, 1,
-1.243677, 1.531846, -0.9346065, 1, 0.6, 0, 1,
-1.229881, -0.5185744, -2.298402, 1, 0.6078432, 0, 1,
-1.225713, 0.7320209, -0.09079321, 1, 0.6117647, 0, 1,
-1.223654, -0.9922872, -3.164033, 1, 0.6196079, 0, 1,
-1.222161, -2.528886, -2.980243, 1, 0.6235294, 0, 1,
-1.213859, -0.5374754, -0.6967643, 1, 0.6313726, 0, 1,
-1.201672, -0.3335907, -2.738626, 1, 0.6352941, 0, 1,
-1.197947, 1.307827, 0.1099267, 1, 0.6431373, 0, 1,
-1.185728, -0.8125545, -2.541842, 1, 0.6470588, 0, 1,
-1.183234, 1.420493, -1.602119, 1, 0.654902, 0, 1,
-1.167146, 0.8853669, 0.01631867, 1, 0.6588235, 0, 1,
-1.165472, -0.6660972, -0.8183897, 1, 0.6666667, 0, 1,
-1.160423, -0.653385, -3.49772, 1, 0.6705883, 0, 1,
-1.159345, 1.810923, -2.234274, 1, 0.6784314, 0, 1,
-1.159271, -0.7768157, -2.489539, 1, 0.682353, 0, 1,
-1.157844, -1.109264, -3.515421, 1, 0.6901961, 0, 1,
-1.151264, 0.08481705, -2.645572, 1, 0.6941177, 0, 1,
-1.144316, 0.3121302, -1.895616, 1, 0.7019608, 0, 1,
-1.142448, -0.5273935, -1.097918, 1, 0.7098039, 0, 1,
-1.141504, 0.9502254, 0.04797263, 1, 0.7137255, 0, 1,
-1.139583, 0.4418198, -3.088768, 1, 0.7215686, 0, 1,
-1.133688, -0.5810073, -3.047286, 1, 0.7254902, 0, 1,
-1.130819, -0.4625863, -1.136413, 1, 0.7333333, 0, 1,
-1.126424, 0.689569, -3.319233, 1, 0.7372549, 0, 1,
-1.124882, 0.7122741, -1.530297, 1, 0.7450981, 0, 1,
-1.124353, 0.8338349, -3.812625, 1, 0.7490196, 0, 1,
-1.122554, -1.934041, -4.76221, 1, 0.7568628, 0, 1,
-1.122399, 2.048247, -0.8551165, 1, 0.7607843, 0, 1,
-1.1192, -2.611617, -1.994833, 1, 0.7686275, 0, 1,
-1.118991, -0.9176038, -2.34666, 1, 0.772549, 0, 1,
-1.11737, 0.2293508, -1.720794, 1, 0.7803922, 0, 1,
-1.109505, -1.079331, -1.210086, 1, 0.7843137, 0, 1,
-1.105383, -0.107082, -0.09500871, 1, 0.7921569, 0, 1,
-1.100672, 0.9059229, -0.8069254, 1, 0.7960784, 0, 1,
-1.095904, -0.6927534, -1.778724, 1, 0.8039216, 0, 1,
-1.09381, 0.6142617, -0.3440584, 1, 0.8117647, 0, 1,
-1.085655, -0.6127623, -2.088505, 1, 0.8156863, 0, 1,
-1.082554, -2.423158, -3.310121, 1, 0.8235294, 0, 1,
-1.075553, -0.584278, -1.663219, 1, 0.827451, 0, 1,
-1.072529, 0.3445377, -0.7141793, 1, 0.8352941, 0, 1,
-1.051029, 0.3027861, -1.623981, 1, 0.8392157, 0, 1,
-1.048964, 0.8690203, 0.6106451, 1, 0.8470588, 0, 1,
-1.044832, 0.4517141, 0.0497233, 1, 0.8509804, 0, 1,
-1.04463, -1.812147, -3.453292, 1, 0.8588235, 0, 1,
-1.043728, -0.6417153, -0.6633475, 1, 0.8627451, 0, 1,
-1.042623, -0.4879196, -3.04733, 1, 0.8705882, 0, 1,
-1.02025, 0.1876094, -1.961693, 1, 0.8745098, 0, 1,
-1.017008, 0.5361666, -1.619233, 1, 0.8823529, 0, 1,
-1.0144, -0.02488331, -2.617027, 1, 0.8862745, 0, 1,
-1.011606, 0.04348538, -1.51581, 1, 0.8941177, 0, 1,
-1.003427, 1.781343, -4.772125, 1, 0.8980392, 0, 1,
-0.9999635, -1.218056, -2.532392, 1, 0.9058824, 0, 1,
-0.9984973, 0.2269587, -1.581279, 1, 0.9137255, 0, 1,
-0.9898572, -0.5861096, -2.47409, 1, 0.9176471, 0, 1,
-0.9866444, -0.8487968, -2.299681, 1, 0.9254902, 0, 1,
-0.9833841, 1.43148, -1.481155, 1, 0.9294118, 0, 1,
-0.9777889, -0.1216693, -2.341449, 1, 0.9372549, 0, 1,
-0.9774163, -0.4231381, -1.299273, 1, 0.9411765, 0, 1,
-0.9745964, -0.2043955, -2.096168, 1, 0.9490196, 0, 1,
-0.974052, 0.2957513, -1.928474, 1, 0.9529412, 0, 1,
-0.9586238, 0.8841432, -1.539358, 1, 0.9607843, 0, 1,
-0.9582954, 1.73963, 1.254446, 1, 0.9647059, 0, 1,
-0.9561075, 1.16854, -0.6423439, 1, 0.972549, 0, 1,
-0.9527122, 0.934146, -1.452587, 1, 0.9764706, 0, 1,
-0.9494097, 1.096579, -2.041669, 1, 0.9843137, 0, 1,
-0.945427, -0.5294895, -2.071955, 1, 0.9882353, 0, 1,
-0.9367111, 0.6292018, -0.9272724, 1, 0.9960784, 0, 1,
-0.9366589, 1.075243, -0.7127548, 0.9960784, 1, 0, 1,
-0.9297654, -0.401488, -4.011421, 0.9921569, 1, 0, 1,
-0.9295913, 0.4399143, -0.6642947, 0.9843137, 1, 0, 1,
-0.9279876, 0.1770748, -1.621905, 0.9803922, 1, 0, 1,
-0.9254317, -0.3908175, -2.02749, 0.972549, 1, 0, 1,
-0.9237374, 0.04015192, -1.829179, 0.9686275, 1, 0, 1,
-0.9230348, -1.971911, -1.70984, 0.9607843, 1, 0, 1,
-0.9216676, 0.812856, -0.5445542, 0.9568627, 1, 0, 1,
-0.9203788, 2.441962, 0.7219151, 0.9490196, 1, 0, 1,
-0.9178346, -0.899159, -2.820173, 0.945098, 1, 0, 1,
-0.9148867, -1.601332, -2.83072, 0.9372549, 1, 0, 1,
-0.9129927, -0.03636254, -3.286263, 0.9333333, 1, 0, 1,
-0.911786, -1.494316, -0.6186154, 0.9254902, 1, 0, 1,
-0.9072577, -1.081781, -0.8044893, 0.9215686, 1, 0, 1,
-0.8990077, -1.143765, -3.499121, 0.9137255, 1, 0, 1,
-0.8950109, -0.1974612, -1.922705, 0.9098039, 1, 0, 1,
-0.8927045, 0.0623347, -1.014091, 0.9019608, 1, 0, 1,
-0.8925295, -0.03226975, -2.591548, 0.8941177, 1, 0, 1,
-0.8901984, -0.8120549, -0.7722445, 0.8901961, 1, 0, 1,
-0.8885301, 0.1304193, -3.20948, 0.8823529, 1, 0, 1,
-0.8818641, -0.9645373, -4.352731, 0.8784314, 1, 0, 1,
-0.8785324, 0.2786304, -1.080367, 0.8705882, 1, 0, 1,
-0.8782062, 0.8170493, 0.1873977, 0.8666667, 1, 0, 1,
-0.8767661, 0.8440312, -1.444498, 0.8588235, 1, 0, 1,
-0.8759776, -1.856287, -1.499472, 0.854902, 1, 0, 1,
-0.8705558, 0.5552821, -0.6048406, 0.8470588, 1, 0, 1,
-0.8663651, 2.013262, -1.910332, 0.8431373, 1, 0, 1,
-0.8630507, -0.9896668, -2.92936, 0.8352941, 1, 0, 1,
-0.8629065, -0.06648648, -1.154141, 0.8313726, 1, 0, 1,
-0.8613493, 1.333644, -2.660081, 0.8235294, 1, 0, 1,
-0.8558429, 0.431864, -0.1150808, 0.8196079, 1, 0, 1,
-0.8514861, 1.425499, -1.505903, 0.8117647, 1, 0, 1,
-0.8471481, -0.2744972, -1.379282, 0.8078431, 1, 0, 1,
-0.8439549, 1.165927, -1.936991, 0.8, 1, 0, 1,
-0.8397462, 1.959767, 0.9914001, 0.7921569, 1, 0, 1,
-0.8348967, 0.01501229, -3.063302, 0.7882353, 1, 0, 1,
-0.8224056, 1.273436, 1.973015, 0.7803922, 1, 0, 1,
-0.8198965, -0.8630719, -1.47757, 0.7764706, 1, 0, 1,
-0.81792, -2.444158, -2.581315, 0.7686275, 1, 0, 1,
-0.8146107, 1.136077, -2.863306, 0.7647059, 1, 0, 1,
-0.8099473, 0.3667816, -0.4181139, 0.7568628, 1, 0, 1,
-0.8074836, -1.54274, -4.128442, 0.7529412, 1, 0, 1,
-0.8031642, 0.2727798, -2.613522, 0.7450981, 1, 0, 1,
-0.8006546, -0.1111182, -3.085827, 0.7411765, 1, 0, 1,
-0.7946312, 0.2762697, -0.8181626, 0.7333333, 1, 0, 1,
-0.7936565, -0.4595193, -2.359675, 0.7294118, 1, 0, 1,
-0.7868747, 0.8799432, -0.8565465, 0.7215686, 1, 0, 1,
-0.7811933, 0.8143413, -1.115065, 0.7176471, 1, 0, 1,
-0.7762527, -0.8433541, 0.1838652, 0.7098039, 1, 0, 1,
-0.7733899, -0.1887821, -2.296311, 0.7058824, 1, 0, 1,
-0.7730367, -0.2523476, -2.164166, 0.6980392, 1, 0, 1,
-0.7701783, -0.4168493, -1.260912, 0.6901961, 1, 0, 1,
-0.767944, -1.463762, -4.003018, 0.6862745, 1, 0, 1,
-0.7573608, 1.424562, 1.688634, 0.6784314, 1, 0, 1,
-0.7546734, 0.4716241, -3.699719, 0.6745098, 1, 0, 1,
-0.7539762, 0.6134795, -0.4019876, 0.6666667, 1, 0, 1,
-0.7539544, 0.05272959, -2.421302, 0.6627451, 1, 0, 1,
-0.7523042, -0.3104342, -2.341092, 0.654902, 1, 0, 1,
-0.7495424, -1.057497, -1.97921, 0.6509804, 1, 0, 1,
-0.7494414, 0.004783486, -1.400162, 0.6431373, 1, 0, 1,
-0.7465451, -0.980261, -2.883854, 0.6392157, 1, 0, 1,
-0.7425163, -0.4688488, -1.917589, 0.6313726, 1, 0, 1,
-0.7416787, -1.409125, -3.061725, 0.627451, 1, 0, 1,
-0.7352087, -1.39325, -2.688041, 0.6196079, 1, 0, 1,
-0.7252612, -0.6397922, -1.837956, 0.6156863, 1, 0, 1,
-0.7241098, -0.5454744, -3.984219, 0.6078432, 1, 0, 1,
-0.720397, -0.6931282, -4.203668, 0.6039216, 1, 0, 1,
-0.7144435, -0.03174634, -1.082589, 0.5960785, 1, 0, 1,
-0.708953, -0.8786294, -2.440196, 0.5882353, 1, 0, 1,
-0.704507, 0.8731552, -1.999074, 0.5843138, 1, 0, 1,
-0.7022344, 1.878028, 1.133686, 0.5764706, 1, 0, 1,
-0.7009224, 1.359535, -1.688071, 0.572549, 1, 0, 1,
-0.6916278, 0.4004629, -0.3553701, 0.5647059, 1, 0, 1,
-0.6902211, -0.4330961, -1.311099, 0.5607843, 1, 0, 1,
-0.6901991, 0.4492514, -0.7990088, 0.5529412, 1, 0, 1,
-0.689876, 1.047159, -1.057528, 0.5490196, 1, 0, 1,
-0.6886464, -0.4618694, -2.869841, 0.5411765, 1, 0, 1,
-0.6863251, -0.06376684, -1.904657, 0.5372549, 1, 0, 1,
-0.6824163, -1.45552, -3.01719, 0.5294118, 1, 0, 1,
-0.6798769, -0.08935642, -2.545184, 0.5254902, 1, 0, 1,
-0.6785431, 1.192646, -0.3813632, 0.5176471, 1, 0, 1,
-0.6769947, -0.6084761, -1.961021, 0.5137255, 1, 0, 1,
-0.6745895, -0.08308224, -0.2336176, 0.5058824, 1, 0, 1,
-0.6736165, 1.590463, -1.079642, 0.5019608, 1, 0, 1,
-0.6717116, 0.228682, -0.9625, 0.4941176, 1, 0, 1,
-0.6712359, -0.1292371, -1.20661, 0.4862745, 1, 0, 1,
-0.6702408, -0.3197632, -0.9492725, 0.4823529, 1, 0, 1,
-0.6698558, -0.407759, -0.6729223, 0.4745098, 1, 0, 1,
-0.6655063, -1.127108, -5.602934, 0.4705882, 1, 0, 1,
-0.660659, -0.857258, -2.329215, 0.4627451, 1, 0, 1,
-0.6561096, 1.934769, -1.159626, 0.4588235, 1, 0, 1,
-0.6528618, -0.6046781, -0.9307085, 0.4509804, 1, 0, 1,
-0.6519963, 0.6579623, 2.013184, 0.4470588, 1, 0, 1,
-0.6519854, 0.635905, -1.794909, 0.4392157, 1, 0, 1,
-0.6441215, 0.03054718, -1.724653, 0.4352941, 1, 0, 1,
-0.6439787, 0.3203341, -2.825002, 0.427451, 1, 0, 1,
-0.6434933, 0.1582915, -2.151923, 0.4235294, 1, 0, 1,
-0.6427572, 1.000974, -0.3071296, 0.4156863, 1, 0, 1,
-0.6419016, 0.8409203, -0.68854, 0.4117647, 1, 0, 1,
-0.6388138, -1.493074, -2.267046, 0.4039216, 1, 0, 1,
-0.6352682, 0.9862729, -0.3132084, 0.3960784, 1, 0, 1,
-0.6284611, 2.075679, -1.547519, 0.3921569, 1, 0, 1,
-0.6177877, 0.01152746, -1.571588, 0.3843137, 1, 0, 1,
-0.6174215, -0.0924255, -1.0195, 0.3803922, 1, 0, 1,
-0.6129084, -0.5970775, -3.101628, 0.372549, 1, 0, 1,
-0.6095354, 0.8038993, -1.47315, 0.3686275, 1, 0, 1,
-0.6000876, 0.006098093, -1.542373, 0.3607843, 1, 0, 1,
-0.5875108, -1.521949, -2.563753, 0.3568628, 1, 0, 1,
-0.5873615, -0.7520376, -2.768785, 0.3490196, 1, 0, 1,
-0.5812606, -1.216041, -2.038133, 0.345098, 1, 0, 1,
-0.5788602, 0.6602381, -1.641105, 0.3372549, 1, 0, 1,
-0.5718833, -0.2006979, -0.7999651, 0.3333333, 1, 0, 1,
-0.5704169, 1.294048, -1.392781, 0.3254902, 1, 0, 1,
-0.569126, -0.2189869, -2.732943, 0.3215686, 1, 0, 1,
-0.5651217, -0.3599523, -1.32736, 0.3137255, 1, 0, 1,
-0.5617142, 0.1595864, 0.3266094, 0.3098039, 1, 0, 1,
-0.5530094, -2.309881, -3.231301, 0.3019608, 1, 0, 1,
-0.5516977, -0.7535963, -2.256148, 0.2941177, 1, 0, 1,
-0.5505008, -1.527541, -3.090236, 0.2901961, 1, 0, 1,
-0.5500159, -0.9585531, -1.442645, 0.282353, 1, 0, 1,
-0.5488664, 1.633442, 0.3226607, 0.2784314, 1, 0, 1,
-0.5472372, 0.8417635, -2.666651, 0.2705882, 1, 0, 1,
-0.5433822, 0.5792626, -1.310117, 0.2666667, 1, 0, 1,
-0.5420583, -0.787158, -2.645742, 0.2588235, 1, 0, 1,
-0.5399283, 0.3965223, -1.611595, 0.254902, 1, 0, 1,
-0.5396591, 0.8281515, -0.3827578, 0.2470588, 1, 0, 1,
-0.527577, 1.716591, -0.09947141, 0.2431373, 1, 0, 1,
-0.5225578, -0.4219889, -2.268745, 0.2352941, 1, 0, 1,
-0.5190409, -0.8045443, -3.097874, 0.2313726, 1, 0, 1,
-0.5181396, -0.338991, -1.723912, 0.2235294, 1, 0, 1,
-0.516614, 0.4555082, 0.3418399, 0.2196078, 1, 0, 1,
-0.5105602, 0.8632306, 0.8134122, 0.2117647, 1, 0, 1,
-0.5036346, 1.74074, -0.09636121, 0.2078431, 1, 0, 1,
-0.5032106, 1.127585, 0.07830774, 0.2, 1, 0, 1,
-0.5027732, 0.6652692, -2.099971, 0.1921569, 1, 0, 1,
-0.5026391, 0.07198295, -1.053132, 0.1882353, 1, 0, 1,
-0.4971976, -0.152023, -2.667098, 0.1803922, 1, 0, 1,
-0.4955042, 0.5277599, -1.242113, 0.1764706, 1, 0, 1,
-0.4934418, -0.4126401, -1.341216, 0.1686275, 1, 0, 1,
-0.4913544, 0.9928429, -1.514464, 0.1647059, 1, 0, 1,
-0.4898445, 0.5137842, -1.240243, 0.1568628, 1, 0, 1,
-0.4872161, 0.369272, -1.485918, 0.1529412, 1, 0, 1,
-0.4868517, -1.460061, -3.123658, 0.145098, 1, 0, 1,
-0.4848621, -1.603137, -0.7738059, 0.1411765, 1, 0, 1,
-0.4808426, -3.018846, -4.270705, 0.1333333, 1, 0, 1,
-0.4801459, 0.2557236, -2.694465, 0.1294118, 1, 0, 1,
-0.4756185, 0.5316784, -1.003938, 0.1215686, 1, 0, 1,
-0.474664, 1.084234, -0.1390091, 0.1176471, 1, 0, 1,
-0.4736206, 1.057454, 0.2850126, 0.1098039, 1, 0, 1,
-0.4715711, -0.8135388, -1.093183, 0.1058824, 1, 0, 1,
-0.4700433, 0.7917969, 0.1273005, 0.09803922, 1, 0, 1,
-0.4699298, -0.6086345, -3.408724, 0.09019608, 1, 0, 1,
-0.4589137, 0.9088916, -0.8602008, 0.08627451, 1, 0, 1,
-0.4577094, -0.3944525, -0.2837782, 0.07843138, 1, 0, 1,
-0.4524642, -0.7924039, -1.821636, 0.07450981, 1, 0, 1,
-0.4462478, 0.8645189, -2.447851, 0.06666667, 1, 0, 1,
-0.445566, -0.5614975, -2.457887, 0.0627451, 1, 0, 1,
-0.4444124, 0.9748221, -0.4338142, 0.05490196, 1, 0, 1,
-0.4391224, 0.2290242, -0.6755553, 0.05098039, 1, 0, 1,
-0.4365176, -0.4941273, -2.883029, 0.04313726, 1, 0, 1,
-0.4364012, -1.133479, -1.125444, 0.03921569, 1, 0, 1,
-0.4345191, -1.117121, -2.028872, 0.03137255, 1, 0, 1,
-0.4311253, 1.280263, -1.283508, 0.02745098, 1, 0, 1,
-0.4260071, 0.05203, 0.06667462, 0.01960784, 1, 0, 1,
-0.4250815, 1.261137, -0.09386629, 0.01568628, 1, 0, 1,
-0.4210204, -0.08046689, -3.268819, 0.007843138, 1, 0, 1,
-0.4201688, -0.1797579, -3.334338, 0.003921569, 1, 0, 1,
-0.4192637, -0.3846807, -3.741086, 0, 1, 0.003921569, 1,
-0.4158888, -0.1501693, -1.797069, 0, 1, 0.01176471, 1,
-0.4158589, -1.219171, -3.746309, 0, 1, 0.01568628, 1,
-0.4132881, 0.7443817, -0.4635153, 0, 1, 0.02352941, 1,
-0.4109927, -0.3901575, -1.548259, 0, 1, 0.02745098, 1,
-0.410417, 0.6058469, 0.9945016, 0, 1, 0.03529412, 1,
-0.4089988, -0.04583663, -1.126447, 0, 1, 0.03921569, 1,
-0.4077155, -1.992603, -1.588667, 0, 1, 0.04705882, 1,
-0.4045047, -0.1333009, -0.8861659, 0, 1, 0.05098039, 1,
-0.4024206, 0.9169533, 0.03042316, 0, 1, 0.05882353, 1,
-0.3958578, 0.2966422, -1.38659, 0, 1, 0.0627451, 1,
-0.3910159, -0.2358395, -1.843701, 0, 1, 0.07058824, 1,
-0.383845, -0.5111325, -2.43253, 0, 1, 0.07450981, 1,
-0.3825159, -0.7284252, -4.913813, 0, 1, 0.08235294, 1,
-0.3817841, 0.04363015, -1.114897, 0, 1, 0.08627451, 1,
-0.3816372, 1.26636, -0.9219609, 0, 1, 0.09411765, 1,
-0.3735743, -1.22384, -3.607368, 0, 1, 0.1019608, 1,
-0.3728835, 0.5042769, -1.393956, 0, 1, 0.1058824, 1,
-0.3724364, -0.4134388, -2.092789, 0, 1, 0.1137255, 1,
-0.3686374, -0.9815652, -1.649713, 0, 1, 0.1176471, 1,
-0.3637023, -1.61665, -2.584197, 0, 1, 0.1254902, 1,
-0.3615404, -0.4737729, -2.441749, 0, 1, 0.1294118, 1,
-0.359961, 0.2594205, -0.21466, 0, 1, 0.1372549, 1,
-0.3569961, 0.5352519, -1.005537, 0, 1, 0.1411765, 1,
-0.3529149, 0.3239821, -0.3062609, 0, 1, 0.1490196, 1,
-0.3524646, -1.745612, -2.720937, 0, 1, 0.1529412, 1,
-0.3506199, 0.1393621, 0.7829067, 0, 1, 0.1607843, 1,
-0.3499627, 1.068141, 0.1160314, 0, 1, 0.1647059, 1,
-0.3439011, 1.782851, -2.088998, 0, 1, 0.172549, 1,
-0.3427487, -1.919521, -4.46319, 0, 1, 0.1764706, 1,
-0.3420572, -0.1001752, -2.358894, 0, 1, 0.1843137, 1,
-0.3369478, -1.912644, -3.919586, 0, 1, 0.1882353, 1,
-0.333527, 0.4528443, -0.8735234, 0, 1, 0.1960784, 1,
-0.3294965, -0.5736659, -2.450904, 0, 1, 0.2039216, 1,
-0.3224489, -0.4292036, -4.270225, 0, 1, 0.2078431, 1,
-0.3182268, 0.9832, 0.2457859, 0, 1, 0.2156863, 1,
-0.3150035, -0.8035981, -3.928206, 0, 1, 0.2196078, 1,
-0.3109432, 0.1293947, -1.138221, 0, 1, 0.227451, 1,
-0.3090156, -0.31122, -3.06858, 0, 1, 0.2313726, 1,
-0.3023275, -1.159744, -2.309857, 0, 1, 0.2392157, 1,
-0.3018539, 0.3302997, -2.345261, 0, 1, 0.2431373, 1,
-0.2965757, 0.4358734, 0.06706584, 0, 1, 0.2509804, 1,
-0.2920064, -1.344014, -2.453401, 0, 1, 0.254902, 1,
-0.288613, 1.355574, -1.719037, 0, 1, 0.2627451, 1,
-0.2884995, 1.766531, 0.1064151, 0, 1, 0.2666667, 1,
-0.2872413, 0.4762996, 0.961844, 0, 1, 0.2745098, 1,
-0.2867955, -1.079391, -2.921622, 0, 1, 0.2784314, 1,
-0.2866858, -0.3362206, -3.683085, 0, 1, 0.2862745, 1,
-0.2800319, 0.3384414, -1.311428, 0, 1, 0.2901961, 1,
-0.2797181, -0.1775287, -1.978214, 0, 1, 0.2980392, 1,
-0.2711647, -0.1278085, -1.975703, 0, 1, 0.3058824, 1,
-0.2632916, 0.2001402, -0.3716787, 0, 1, 0.3098039, 1,
-0.2618937, -0.9385458, -3.046354, 0, 1, 0.3176471, 1,
-0.2574862, -0.08373813, -1.112177, 0, 1, 0.3215686, 1,
-0.2572611, 1.097306, 0.1889561, 0, 1, 0.3294118, 1,
-0.2549399, -0.5725681, -3.099949, 0, 1, 0.3333333, 1,
-0.2482701, -0.004056638, -2.442237, 0, 1, 0.3411765, 1,
-0.2476899, -0.5141739, -2.715278, 0, 1, 0.345098, 1,
-0.245082, 0.2273115, -2.139835, 0, 1, 0.3529412, 1,
-0.2450299, -1.023933, -1.621989, 0, 1, 0.3568628, 1,
-0.2447336, 0.5925824, -0.9930733, 0, 1, 0.3647059, 1,
-0.2412309, 0.1842783, -0.2392391, 0, 1, 0.3686275, 1,
-0.2406879, -0.3107276, -2.932533, 0, 1, 0.3764706, 1,
-0.2366808, -0.9778891, -2.53808, 0, 1, 0.3803922, 1,
-0.2341198, -0.6687638, -3.943583, 0, 1, 0.3882353, 1,
-0.2338585, 0.4499924, -0.755895, 0, 1, 0.3921569, 1,
-0.2322502, -1.586513, -2.671171, 0, 1, 0.4, 1,
-0.223469, -0.4161798, -4.575151, 0, 1, 0.4078431, 1,
-0.2154658, 0.2159493, -1.25779, 0, 1, 0.4117647, 1,
-0.2152652, -1.074463, -2.590753, 0, 1, 0.4196078, 1,
-0.2143653, 0.7959539, -2.150552, 0, 1, 0.4235294, 1,
-0.2131853, -1.381142, -3.126343, 0, 1, 0.4313726, 1,
-0.2128047, 0.7696505, -0.03035874, 0, 1, 0.4352941, 1,
-0.2086629, 0.7936426, 0.3203015, 0, 1, 0.4431373, 1,
-0.2076258, 0.5913852, -0.6151405, 0, 1, 0.4470588, 1,
-0.2030634, -0.7788198, -3.154793, 0, 1, 0.454902, 1,
-0.2018826, -0.4227955, -2.384702, 0, 1, 0.4588235, 1,
-0.1929386, 1.005547, -0.8523731, 0, 1, 0.4666667, 1,
-0.1917094, 0.3449644, 0.3624899, 0, 1, 0.4705882, 1,
-0.1907537, -0.1191774, -3.735663, 0, 1, 0.4784314, 1,
-0.1904731, -0.0548848, -3.290634, 0, 1, 0.4823529, 1,
-0.1901498, -0.2481391, -1.946894, 0, 1, 0.4901961, 1,
-0.1850126, 0.9881059, -0.1354968, 0, 1, 0.4941176, 1,
-0.1813601, 1.27766, -0.5693983, 0, 1, 0.5019608, 1,
-0.1769835, -1.213056, -3.312633, 0, 1, 0.509804, 1,
-0.1749987, 0.6339122, -0.6668479, 0, 1, 0.5137255, 1,
-0.1723806, -0.3329318, -2.797529, 0, 1, 0.5215687, 1,
-0.1693044, -0.7142416, -1.619639, 0, 1, 0.5254902, 1,
-0.1641601, -0.4966054, -2.197074, 0, 1, 0.5333334, 1,
-0.1639273, -0.9903629, -3.380374, 0, 1, 0.5372549, 1,
-0.1607369, 1.393205, -0.9153669, 0, 1, 0.5450981, 1,
-0.1598292, 0.4830433, 0.3931048, 0, 1, 0.5490196, 1,
-0.1595969, -0.4087069, -3.459503, 0, 1, 0.5568628, 1,
-0.156256, 1.051903, -1.182781, 0, 1, 0.5607843, 1,
-0.1552404, 0.9966885, -0.2346624, 0, 1, 0.5686275, 1,
-0.1537144, -1.126059, -1.477322, 0, 1, 0.572549, 1,
-0.1480887, -2.131001, -0.7729157, 0, 1, 0.5803922, 1,
-0.143639, -1.009827, -2.464422, 0, 1, 0.5843138, 1,
-0.1430681, -0.1209979, -3.764887, 0, 1, 0.5921569, 1,
-0.1404252, -0.4667219, -3.071183, 0, 1, 0.5960785, 1,
-0.1384029, -0.8713219, -4.074416, 0, 1, 0.6039216, 1,
-0.1372996, -0.3031877, -1.694946, 0, 1, 0.6117647, 1,
-0.1351863, 0.978814, -1.202951, 0, 1, 0.6156863, 1,
-0.1351242, -0.4725505, -2.114468, 0, 1, 0.6235294, 1,
-0.1351002, -1.775041, -3.860158, 0, 1, 0.627451, 1,
-0.1336148, -0.2255485, -3.232472, 0, 1, 0.6352941, 1,
-0.1316917, -0.05455463, -2.288045, 0, 1, 0.6392157, 1,
-0.1283007, -0.07677377, -1.211074, 0, 1, 0.6470588, 1,
-0.128052, -0.165227, -2.498791, 0, 1, 0.6509804, 1,
-0.1236555, -1.150396, -1.641847, 0, 1, 0.6588235, 1,
-0.1218392, -0.07337456, -3.112179, 0, 1, 0.6627451, 1,
-0.1098857, -0.1444941, -3.283531, 0, 1, 0.6705883, 1,
-0.1098337, 0.6442127, -0.7081818, 0, 1, 0.6745098, 1,
-0.1094248, 0.005913069, -1.019827, 0, 1, 0.682353, 1,
-0.1091011, 0.06489183, -0.6793529, 0, 1, 0.6862745, 1,
-0.1090079, 1.919016, 0.1044673, 0, 1, 0.6941177, 1,
-0.1080282, 0.4238692, 0.3071907, 0, 1, 0.7019608, 1,
-0.1024409, 0.8910816, 0.949166, 0, 1, 0.7058824, 1,
-0.1023311, 1.720897, 0.8623087, 0, 1, 0.7137255, 1,
-0.09963463, 0.7334118, -0.2497783, 0, 1, 0.7176471, 1,
-0.09706383, -0.02431756, -2.422357, 0, 1, 0.7254902, 1,
-0.09565388, -1.707788, -2.855953, 0, 1, 0.7294118, 1,
-0.09215279, -0.3022808, -1.813668, 0, 1, 0.7372549, 1,
-0.09147172, -0.04960721, -3.359014, 0, 1, 0.7411765, 1,
-0.08826727, 0.01351987, 0.006175078, 0, 1, 0.7490196, 1,
-0.08808552, -1.379624, -3.725593, 0, 1, 0.7529412, 1,
-0.07751673, 1.329237, 1.586395, 0, 1, 0.7607843, 1,
-0.0751064, -1.159431, -2.159233, 0, 1, 0.7647059, 1,
-0.07297421, -0.5525222, -4.15619, 0, 1, 0.772549, 1,
-0.07209895, -0.5310057, -3.138508, 0, 1, 0.7764706, 1,
-0.07155946, 0.2220741, -1.068464, 0, 1, 0.7843137, 1,
-0.06955463, 0.7235897, 0.7660919, 0, 1, 0.7882353, 1,
-0.06858277, -1.42022, -1.676722, 0, 1, 0.7960784, 1,
-0.0672173, 0.8837015, -1.055616, 0, 1, 0.8039216, 1,
-0.05993526, -0.413223, -2.92217, 0, 1, 0.8078431, 1,
-0.05955766, 1.235533, 0.6084555, 0, 1, 0.8156863, 1,
-0.04951639, 0.6996656, -0.3560592, 0, 1, 0.8196079, 1,
-0.04558984, -1.418891, -3.673192, 0, 1, 0.827451, 1,
-0.04143504, 0.04038201, -0.1236599, 0, 1, 0.8313726, 1,
-0.03970411, 1.12795, -1.939879, 0, 1, 0.8392157, 1,
-0.03560453, -0.4829151, -2.518362, 0, 1, 0.8431373, 1,
-0.03559203, 0.5719636, -0.04074858, 0, 1, 0.8509804, 1,
-0.03520621, -0.1606613, -2.101915, 0, 1, 0.854902, 1,
-0.03461079, 1.017936, 2.567168, 0, 1, 0.8627451, 1,
-0.0335997, -0.1302017, -2.549414, 0, 1, 0.8666667, 1,
-0.03235451, -0.03424971, -1.863785, 0, 1, 0.8745098, 1,
-0.03126282, 0.003752256, 0.5171794, 0, 1, 0.8784314, 1,
-0.02771415, 1.416435, 1.16283, 0, 1, 0.8862745, 1,
-0.02730661, -2.060826, -3.697742, 0, 1, 0.8901961, 1,
-0.02454056, 0.2104011, 0.7941827, 0, 1, 0.8980392, 1,
-0.01967736, 0.43345, 1.017222, 0, 1, 0.9058824, 1,
-0.01873205, 1.875729, -2.679011, 0, 1, 0.9098039, 1,
-0.01140108, 0.4534851, -1.762103, 0, 1, 0.9176471, 1,
-0.01060522, -1.066319, -4.014742, 0, 1, 0.9215686, 1,
-0.00640336, 0.2174727, 0.04793941, 0, 1, 0.9294118, 1,
-0.005896015, -0.612311, -3.411219, 0, 1, 0.9333333, 1,
0.005445206, -1.947608, 3.157588, 0, 1, 0.9411765, 1,
0.008161479, 0.7043884, 2.040268, 0, 1, 0.945098, 1,
0.01064616, 0.9952783, -1.24498, 0, 1, 0.9529412, 1,
0.01150176, 0.3683632, 0.9703736, 0, 1, 0.9568627, 1,
0.01356549, -0.05527743, 2.972697, 0, 1, 0.9647059, 1,
0.01470567, 0.5754703, -0.6217187, 0, 1, 0.9686275, 1,
0.01897852, 0.6006621, -0.6658157, 0, 1, 0.9764706, 1,
0.02414431, -1.453408, 2.535614, 0, 1, 0.9803922, 1,
0.02447572, -0.7780209, 3.130001, 0, 1, 0.9882353, 1,
0.02475425, -0.08531587, 2.326427, 0, 1, 0.9921569, 1,
0.02754687, -0.5842618, 3.495312, 0, 1, 1, 1,
0.02864585, -0.633717, 2.854192, 0, 0.9921569, 1, 1,
0.031809, 0.1960308, -1.403744, 0, 0.9882353, 1, 1,
0.04095273, -0.6457283, 3.498581, 0, 0.9803922, 1, 1,
0.04343716, 0.5101412, 0.5160394, 0, 0.9764706, 1, 1,
0.04478198, -0.04063091, 1.620748, 0, 0.9686275, 1, 1,
0.04924897, 1.286409, 1.11024, 0, 0.9647059, 1, 1,
0.04936976, 1.410681, -0.8348228, 0, 0.9568627, 1, 1,
0.05381516, -2.412508, 3.420473, 0, 0.9529412, 1, 1,
0.05990859, 1.660499, 0.9336053, 0, 0.945098, 1, 1,
0.06393832, -0.9616899, 2.298985, 0, 0.9411765, 1, 1,
0.06510554, 0.104119, -0.04749893, 0, 0.9333333, 1, 1,
0.06985221, 1.456233, -0.08258999, 0, 0.9294118, 1, 1,
0.0735945, -0.325177, 3.465454, 0, 0.9215686, 1, 1,
0.07819278, -0.3528926, 2.464208, 0, 0.9176471, 1, 1,
0.086567, 0.752395, 0.3583129, 0, 0.9098039, 1, 1,
0.09225481, 0.7593412, -0.1046798, 0, 0.9058824, 1, 1,
0.0933516, -2.510094, 3.613268, 0, 0.8980392, 1, 1,
0.09339368, 0.7018661, 1.223588, 0, 0.8901961, 1, 1,
0.09347908, -0.2093305, 2.554969, 0, 0.8862745, 1, 1,
0.09374328, -0.1490544, 0.6142814, 0, 0.8784314, 1, 1,
0.09501015, -1.671068, 4.019187, 0, 0.8745098, 1, 1,
0.09680242, 0.2150954, 0.4039346, 0, 0.8666667, 1, 1,
0.1020624, 0.4229069, -0.09938397, 0, 0.8627451, 1, 1,
0.1038141, 0.2733714, 0.5308312, 0, 0.854902, 1, 1,
0.1069079, -0.4311482, 3.859496, 0, 0.8509804, 1, 1,
0.1083453, -1.321404, 1.615312, 0, 0.8431373, 1, 1,
0.1085368, -0.8125374, 3.223364, 0, 0.8392157, 1, 1,
0.108697, -1.82757, 4.190267, 0, 0.8313726, 1, 1,
0.1166505, 0.9820173, -0.5222619, 0, 0.827451, 1, 1,
0.1242477, 1.009729, 2.550015, 0, 0.8196079, 1, 1,
0.1251688, -2.450567, 3.568622, 0, 0.8156863, 1, 1,
0.1264798, 0.8075449, -0.3780319, 0, 0.8078431, 1, 1,
0.1278446, 0.4231434, -0.141266, 0, 0.8039216, 1, 1,
0.1297712, -0.9455603, 3.943528, 0, 0.7960784, 1, 1,
0.1356166, -1.128934, 3.903924, 0, 0.7882353, 1, 1,
0.1400352, -0.4850413, 1.417576, 0, 0.7843137, 1, 1,
0.1456534, 0.7626888, -0.6275894, 0, 0.7764706, 1, 1,
0.1470949, -0.2939411, 1.526345, 0, 0.772549, 1, 1,
0.1510276, -1.520581, 4.629199, 0, 0.7647059, 1, 1,
0.1511991, -2.250841, 2.372027, 0, 0.7607843, 1, 1,
0.1512688, -0.1871508, 2.382154, 0, 0.7529412, 1, 1,
0.1513961, -0.3266733, 4.262477, 0, 0.7490196, 1, 1,
0.1542501, -1.17247, 2.916257, 0, 0.7411765, 1, 1,
0.1543095, -1.221923, 1.629592, 0, 0.7372549, 1, 1,
0.1543233, -0.4177692, 2.725611, 0, 0.7294118, 1, 1,
0.1581235, -2.980762, 3.688013, 0, 0.7254902, 1, 1,
0.1598901, -2.100263, 2.261066, 0, 0.7176471, 1, 1,
0.1626123, 1.303106, -0.9708806, 0, 0.7137255, 1, 1,
0.1646544, -1.092146, 4.127521, 0, 0.7058824, 1, 1,
0.1720511, -1.27871, 2.997879, 0, 0.6980392, 1, 1,
0.1727105, 0.6296934, 0.7458686, 0, 0.6941177, 1, 1,
0.1750871, 0.2797378, -1.073699, 0, 0.6862745, 1, 1,
0.1765403, 1.54348, -0.2983045, 0, 0.682353, 1, 1,
0.1781434, -0.9176407, 2.987437, 0, 0.6745098, 1, 1,
0.1834431, -1.090552, 2.376679, 0, 0.6705883, 1, 1,
0.184603, 1.164848, 0.1156331, 0, 0.6627451, 1, 1,
0.1854419, -1.002763, 1.831917, 0, 0.6588235, 1, 1,
0.1859471, -0.9983109, 1.057885, 0, 0.6509804, 1, 1,
0.1878702, -0.5178418, 2.706368, 0, 0.6470588, 1, 1,
0.1903711, -0.2322863, 1.611307, 0, 0.6392157, 1, 1,
0.1948652, 0.06602849, 1.450069, 0, 0.6352941, 1, 1,
0.1948919, 1.8483, -2.009423, 0, 0.627451, 1, 1,
0.1969379, -1.267742, 2.235073, 0, 0.6235294, 1, 1,
0.1972135, 1.392748, 0.5066023, 0, 0.6156863, 1, 1,
0.2010789, -0.00799529, 0.7634473, 0, 0.6117647, 1, 1,
0.2022604, 1.224288, 0.6756474, 0, 0.6039216, 1, 1,
0.2079984, 0.9040856, -1.352736, 0, 0.5960785, 1, 1,
0.209033, -0.7598071, 2.05004, 0, 0.5921569, 1, 1,
0.2102718, -1.14243, 3.385797, 0, 0.5843138, 1, 1,
0.2119073, 0.1439699, 0.002240829, 0, 0.5803922, 1, 1,
0.2120331, 1.482182, -1.984223, 0, 0.572549, 1, 1,
0.2142197, -1.100407, 1.248145, 0, 0.5686275, 1, 1,
0.2210668, 1.327983, 0.8212402, 0, 0.5607843, 1, 1,
0.2247881, 0.575834, -1.379695, 0, 0.5568628, 1, 1,
0.2271148, -0.9228528, 1.75492, 0, 0.5490196, 1, 1,
0.2345988, 0.3520979, -1.386457, 0, 0.5450981, 1, 1,
0.2348558, -0.03770299, 3.311502, 0, 0.5372549, 1, 1,
0.236119, 0.6270556, -0.8737558, 0, 0.5333334, 1, 1,
0.2376941, -0.6523829, 2.129164, 0, 0.5254902, 1, 1,
0.2379956, -0.7434287, 1.398489, 0, 0.5215687, 1, 1,
0.2390794, -0.9204462, 3.017214, 0, 0.5137255, 1, 1,
0.2451923, -0.7984536, 2.711419, 0, 0.509804, 1, 1,
0.2475414, -1.586432, 2.721307, 0, 0.5019608, 1, 1,
0.2532795, -0.6992632, 5.196194, 0, 0.4941176, 1, 1,
0.2557378, -0.5637239, 2.568257, 0, 0.4901961, 1, 1,
0.2637753, -0.8534916, 3.362264, 0, 0.4823529, 1, 1,
0.2696129, 1.31964, -0.4001751, 0, 0.4784314, 1, 1,
0.2738751, 0.006312503, 2.081214, 0, 0.4705882, 1, 1,
0.274523, -1.385845, 1.431537, 0, 0.4666667, 1, 1,
0.2768495, -1.136963, 2.242497, 0, 0.4588235, 1, 1,
0.2806399, 1.034707, 0.09815761, 0, 0.454902, 1, 1,
0.2838209, -0.6133833, 2.818166, 0, 0.4470588, 1, 1,
0.2841568, -0.2628606, 2.914862, 0, 0.4431373, 1, 1,
0.2886733, 0.2226558, 0.3139107, 0, 0.4352941, 1, 1,
0.2913696, -0.1698348, 2.921474, 0, 0.4313726, 1, 1,
0.2914851, 1.233541, -0.1796352, 0, 0.4235294, 1, 1,
0.2920248, 1.348462, 1.333446, 0, 0.4196078, 1, 1,
0.2939992, -0.2967151, 2.365107, 0, 0.4117647, 1, 1,
0.2959474, 2.016312, -0.1759468, 0, 0.4078431, 1, 1,
0.297521, 0.9397221, -1.572208, 0, 0.4, 1, 1,
0.2998859, -0.5478349, 2.54795, 0, 0.3921569, 1, 1,
0.3014617, -0.5835249, 1.147579, 0, 0.3882353, 1, 1,
0.3024994, 0.4854922, -0.6389933, 0, 0.3803922, 1, 1,
0.3025975, -0.7401564, 2.924037, 0, 0.3764706, 1, 1,
0.308877, 0.2369681, 1.286676, 0, 0.3686275, 1, 1,
0.3136697, 0.09819461, -1.289443, 0, 0.3647059, 1, 1,
0.3164147, -0.1126124, 2.006346, 0, 0.3568628, 1, 1,
0.3208526, 0.4350992, 0.2085621, 0, 0.3529412, 1, 1,
0.3212411, 1.201946, -0.8532763, 0, 0.345098, 1, 1,
0.3241957, 0.8458826, 1.371688, 0, 0.3411765, 1, 1,
0.3292423, -0.01155344, 1.548693, 0, 0.3333333, 1, 1,
0.3304756, -0.3279815, 2.192524, 0, 0.3294118, 1, 1,
0.3307819, -0.08495586, 0.0740381, 0, 0.3215686, 1, 1,
0.331017, 1.239439, -0.08405264, 0, 0.3176471, 1, 1,
0.3343179, 1.444601, 0.6417618, 0, 0.3098039, 1, 1,
0.3354248, 0.5233801, 1.835769, 0, 0.3058824, 1, 1,
0.3393042, -0.3910184, 2.715202, 0, 0.2980392, 1, 1,
0.3426359, 0.7527243, 1.036996, 0, 0.2901961, 1, 1,
0.3450971, -0.1564955, 2.48515, 0, 0.2862745, 1, 1,
0.3468547, 0.05256267, 1.667295, 0, 0.2784314, 1, 1,
0.3472436, -1.927801, 1.415286, 0, 0.2745098, 1, 1,
0.3479911, 0.2233441, 0.3665901, 0, 0.2666667, 1, 1,
0.3480312, -0.9061914, 0.9290502, 0, 0.2627451, 1, 1,
0.3560921, 0.9013755, 0.01106559, 0, 0.254902, 1, 1,
0.3561383, -0.6641211, 2.456685, 0, 0.2509804, 1, 1,
0.3576368, -0.229023, 3.004783, 0, 0.2431373, 1, 1,
0.3584016, -0.1270735, 0.5569562, 0, 0.2392157, 1, 1,
0.3598469, -0.810455, 3.592985, 0, 0.2313726, 1, 1,
0.3651423, 0.5296779, 0.7363793, 0, 0.227451, 1, 1,
0.365384, 1.046273, -0.7276894, 0, 0.2196078, 1, 1,
0.3661407, -0.1260885, 1.820129, 0, 0.2156863, 1, 1,
0.3675115, -0.2109321, 1.437616, 0, 0.2078431, 1, 1,
0.3685907, 1.106634, 0.3539762, 0, 0.2039216, 1, 1,
0.3696578, -0.09659921, 0.8477055, 0, 0.1960784, 1, 1,
0.3706493, -0.1085691, 3.382543, 0, 0.1882353, 1, 1,
0.3714903, -1.366402, 3.19836, 0, 0.1843137, 1, 1,
0.375847, -0.7578802, 3.133535, 0, 0.1764706, 1, 1,
0.3782383, 1.114092, 0.9530917, 0, 0.172549, 1, 1,
0.3792097, 1.61513, 0.05097608, 0, 0.1647059, 1, 1,
0.3806207, -0.03059021, 0.9237752, 0, 0.1607843, 1, 1,
0.3821486, 1.248589, -0.289541, 0, 0.1529412, 1, 1,
0.3862892, -0.3047847, 2.418898, 0, 0.1490196, 1, 1,
0.3896205, -0.3661474, 2.36023, 0, 0.1411765, 1, 1,
0.3913385, -0.8087139, 4.366516, 0, 0.1372549, 1, 1,
0.3972761, 2.581968, 0.4716916, 0, 0.1294118, 1, 1,
0.3974735, 1.620489, 0.02602928, 0, 0.1254902, 1, 1,
0.3998284, 0.7509462, 0.2072536, 0, 0.1176471, 1, 1,
0.4024759, -0.7439931, 2.490455, 0, 0.1137255, 1, 1,
0.4076253, -1.164892, 1.362749, 0, 0.1058824, 1, 1,
0.4083641, -1.674116, 2.036788, 0, 0.09803922, 1, 1,
0.4085974, -1.35055, 3.728795, 0, 0.09411765, 1, 1,
0.4105083, 0.9367039, 0.680295, 0, 0.08627451, 1, 1,
0.4124022, 3.097506, 1.653399, 0, 0.08235294, 1, 1,
0.4162704, 0.9623589, -0.5697948, 0, 0.07450981, 1, 1,
0.4265659, 0.8965541, 1.44448, 0, 0.07058824, 1, 1,
0.4268281, -1.729394, 0.6900067, 0, 0.0627451, 1, 1,
0.4303484, 1.200698, 1.172114, 0, 0.05882353, 1, 1,
0.4317159, -0.8662301, 1.645542, 0, 0.05098039, 1, 1,
0.432045, 2.664325, 0.6245863, 0, 0.04705882, 1, 1,
0.4326015, 0.6849164, 0.2716505, 0, 0.03921569, 1, 1,
0.4367957, -0.3574908, 1.095137, 0, 0.03529412, 1, 1,
0.4448105, -0.2127041, 2.046852, 0, 0.02745098, 1, 1,
0.450415, 0.5046999, 1.125702, 0, 0.02352941, 1, 1,
0.4505816, -0.589438, 2.049849, 0, 0.01568628, 1, 1,
0.4512702, 0.7351628, 1.964435, 0, 0.01176471, 1, 1,
0.4522195, 0.5332494, 1.635038, 0, 0.003921569, 1, 1,
0.4535099, 0.2668947, 1.136736, 0.003921569, 0, 1, 1,
0.4560784, 1.201759, -0.07418879, 0.007843138, 0, 1, 1,
0.4563495, -1.170557, 4.661963, 0.01568628, 0, 1, 1,
0.4568288, -0.8200946, 3.552211, 0.01960784, 0, 1, 1,
0.4585268, -0.2321207, 3.723896, 0.02745098, 0, 1, 1,
0.4643661, 0.7007793, 0.6744069, 0.03137255, 0, 1, 1,
0.4655408, 0.4803872, 0.460712, 0.03921569, 0, 1, 1,
0.4661607, 1.111753, -1.535006, 0.04313726, 0, 1, 1,
0.4672148, 0.2747796, 0.9422246, 0.05098039, 0, 1, 1,
0.4692784, -1.521688, 3.902273, 0.05490196, 0, 1, 1,
0.472567, 0.4874519, 1.64084, 0.0627451, 0, 1, 1,
0.4746291, -0.2503968, 2.082357, 0.06666667, 0, 1, 1,
0.4764042, 1.395847, 1.195051, 0.07450981, 0, 1, 1,
0.4818022, 0.4638192, 0.1021776, 0.07843138, 0, 1, 1,
0.4829055, 0.8729843, 0.705667, 0.08627451, 0, 1, 1,
0.4845546, -0.2765624, 3.258919, 0.09019608, 0, 1, 1,
0.4878602, 0.7849314, 0.4502015, 0.09803922, 0, 1, 1,
0.4933878, -0.7884859, 1.296262, 0.1058824, 0, 1, 1,
0.5000826, -0.5397006, 3.623857, 0.1098039, 0, 1, 1,
0.5073044, -0.7731966, 3.025941, 0.1176471, 0, 1, 1,
0.511301, 1.230672, 1.74492, 0.1215686, 0, 1, 1,
0.5125141, -1.826714, 2.278583, 0.1294118, 0, 1, 1,
0.5135217, 0.6986849, 2.288418, 0.1333333, 0, 1, 1,
0.5180387, 1.648809, 0.5604926, 0.1411765, 0, 1, 1,
0.5280883, 0.9273973, 0.6741763, 0.145098, 0, 1, 1,
0.5323631, -0.8212897, 4.312061, 0.1529412, 0, 1, 1,
0.5344793, 0.9177703, 1.661716, 0.1568628, 0, 1, 1,
0.5356653, 0.4653828, 0.1447657, 0.1647059, 0, 1, 1,
0.5371378, 0.2738039, 2.68752, 0.1686275, 0, 1, 1,
0.5377232, -0.2714229, 0.590135, 0.1764706, 0, 1, 1,
0.5481582, 1.780385, 0.07635793, 0.1803922, 0, 1, 1,
0.5492328, 0.1372366, 1.989927, 0.1882353, 0, 1, 1,
0.5511007, 2.153151, -0.06723733, 0.1921569, 0, 1, 1,
0.5519898, 0.3928404, 1.525268, 0.2, 0, 1, 1,
0.5549943, -0.9285166, 2.551479, 0.2078431, 0, 1, 1,
0.555155, 1.266153, 0.6193587, 0.2117647, 0, 1, 1,
0.5556473, -0.3259342, 2.454664, 0.2196078, 0, 1, 1,
0.5577933, 0.3436817, 1.977126, 0.2235294, 0, 1, 1,
0.5580501, -0.4301891, 1.690899, 0.2313726, 0, 1, 1,
0.5590862, 0.773567, 1.481182, 0.2352941, 0, 1, 1,
0.5609161, -0.1879077, 0.5535642, 0.2431373, 0, 1, 1,
0.5617801, -0.6179765, 3.142882, 0.2470588, 0, 1, 1,
0.5677753, 1.701375, 0.1842227, 0.254902, 0, 1, 1,
0.5717141, 0.795894, 0.2491881, 0.2588235, 0, 1, 1,
0.5718571, -0.8006275, 2.460596, 0.2666667, 0, 1, 1,
0.5718694, -0.6100075, 2.972541, 0.2705882, 0, 1, 1,
0.5759646, 0.3789667, 0.2364828, 0.2784314, 0, 1, 1,
0.5766281, -0.3604122, 2.026009, 0.282353, 0, 1, 1,
0.5810885, -1.408165, 2.451021, 0.2901961, 0, 1, 1,
0.5911227, -1.246691, 3.206526, 0.2941177, 0, 1, 1,
0.596238, -1.435001, 0.8658184, 0.3019608, 0, 1, 1,
0.5975138, 0.2540814, 1.804881, 0.3098039, 0, 1, 1,
0.5987641, 0.7183912, 0.4768643, 0.3137255, 0, 1, 1,
0.6004362, 0.03712447, 2.242862, 0.3215686, 0, 1, 1,
0.6085253, 0.7868796, 1.466959, 0.3254902, 0, 1, 1,
0.6132852, -0.8708276, 2.317472, 0.3333333, 0, 1, 1,
0.6176115, 0.146591, -0.1448369, 0.3372549, 0, 1, 1,
0.6189786, 1.621379, -0.4406308, 0.345098, 0, 1, 1,
0.6204617, -0.7166976, 1.35353, 0.3490196, 0, 1, 1,
0.6228848, -0.4898308, 3.822304, 0.3568628, 0, 1, 1,
0.6242778, 0.1456691, 1.791771, 0.3607843, 0, 1, 1,
0.6254414, 0.3128483, 0.7972527, 0.3686275, 0, 1, 1,
0.6275554, -0.5028368, 2.13756, 0.372549, 0, 1, 1,
0.6294448, -1.606602, 0.7994462, 0.3803922, 0, 1, 1,
0.6392954, 0.4618534, 2.021977, 0.3843137, 0, 1, 1,
0.6436775, 1.706622, -0.2897671, 0.3921569, 0, 1, 1,
0.6539447, 0.1083068, 3.213806, 0.3960784, 0, 1, 1,
0.6580092, -0.9553688, 2.627662, 0.4039216, 0, 1, 1,
0.6630747, 0.823293, 2.082727, 0.4117647, 0, 1, 1,
0.6663959, -0.5283684, 0.1071627, 0.4156863, 0, 1, 1,
0.6683465, -1.217303, 1.894479, 0.4235294, 0, 1, 1,
0.6689751, -0.9716103, 3.418477, 0.427451, 0, 1, 1,
0.6714776, -0.5791488, 2.279783, 0.4352941, 0, 1, 1,
0.6722934, 0.05780603, 1.276678, 0.4392157, 0, 1, 1,
0.6765128, -0.6318917, 3.182805, 0.4470588, 0, 1, 1,
0.6765744, -0.536311, 2.839474, 0.4509804, 0, 1, 1,
0.6843697, 0.7249739, -0.9713418, 0.4588235, 0, 1, 1,
0.6865533, 0.8847578, -0.09658524, 0.4627451, 0, 1, 1,
0.6891013, 0.0607225, 0.008885759, 0.4705882, 0, 1, 1,
0.6930621, 0.4172296, 1.486616, 0.4745098, 0, 1, 1,
0.6942775, 0.6041819, -0.4579885, 0.4823529, 0, 1, 1,
0.6965464, -2.234838, 3.496703, 0.4862745, 0, 1, 1,
0.7014738, 0.2508684, 1.400123, 0.4941176, 0, 1, 1,
0.7029733, -0.01465678, 0.8033254, 0.5019608, 0, 1, 1,
0.7034094, 0.6081489, 0.1320132, 0.5058824, 0, 1, 1,
0.7048986, 0.3572114, 3.57477, 0.5137255, 0, 1, 1,
0.7124183, 0.01185688, 1.518146, 0.5176471, 0, 1, 1,
0.7126262, -0.5413473, 4.168785, 0.5254902, 0, 1, 1,
0.7162926, 0.3602774, 1.908459, 0.5294118, 0, 1, 1,
0.7202948, -0.9362155, 2.765721, 0.5372549, 0, 1, 1,
0.721324, 0.4886119, -0.5465977, 0.5411765, 0, 1, 1,
0.7236342, 0.3368822, 0.4532298, 0.5490196, 0, 1, 1,
0.7273723, -0.7811618, 1.93756, 0.5529412, 0, 1, 1,
0.7288731, 0.3229857, 1.561455, 0.5607843, 0, 1, 1,
0.73454, -0.7376226, 0.514574, 0.5647059, 0, 1, 1,
0.7386709, -1.408572, 1.908171, 0.572549, 0, 1, 1,
0.7415549, 0.482466, 0.4495275, 0.5764706, 0, 1, 1,
0.7486728, -0.09462605, 2.473482, 0.5843138, 0, 1, 1,
0.7499928, 0.8677337, 1.153056, 0.5882353, 0, 1, 1,
0.7514237, -0.4829684, 3.941618, 0.5960785, 0, 1, 1,
0.7515229, -1.012702, 2.855109, 0.6039216, 0, 1, 1,
0.761968, 0.551904, 1.087553, 0.6078432, 0, 1, 1,
0.7655565, -2.617144, 3.425083, 0.6156863, 0, 1, 1,
0.7656578, -0.3901899, 2.837126, 0.6196079, 0, 1, 1,
0.7658024, -1.117252, 1.693666, 0.627451, 0, 1, 1,
0.7662374, 0.2890752, -0.1574141, 0.6313726, 0, 1, 1,
0.7665558, 0.3437515, 0.3531465, 0.6392157, 0, 1, 1,
0.7674243, 0.4851819, 1.357731, 0.6431373, 0, 1, 1,
0.769553, -1.503623, 0.8673981, 0.6509804, 0, 1, 1,
0.769951, -0.1926503, 1.841715, 0.654902, 0, 1, 1,
0.7712164, -0.7918451, 4.01446, 0.6627451, 0, 1, 1,
0.7742441, 0.6681194, 0.9043723, 0.6666667, 0, 1, 1,
0.7745035, 1.294496, -0.8386764, 0.6745098, 0, 1, 1,
0.776437, 1.015671, 1.685654, 0.6784314, 0, 1, 1,
0.7778316, 0.0817927, 2.14187, 0.6862745, 0, 1, 1,
0.7827106, 1.044373, -0.1720816, 0.6901961, 0, 1, 1,
0.7863908, -0.654246, 2.506403, 0.6980392, 0, 1, 1,
0.7865964, 1.564797, 0.2042678, 0.7058824, 0, 1, 1,
0.7909174, -0.3753503, 1.160031, 0.7098039, 0, 1, 1,
0.7909244, 1.099869, 0.3915528, 0.7176471, 0, 1, 1,
0.7916275, 1.959601, 0.5425863, 0.7215686, 0, 1, 1,
0.7922819, -0.8049538, 2.204091, 0.7294118, 0, 1, 1,
0.7923604, -0.3816677, 2.192221, 0.7333333, 0, 1, 1,
0.7947296, 2.214879, -0.142243, 0.7411765, 0, 1, 1,
0.7977278, -0.9146846, 2.553212, 0.7450981, 0, 1, 1,
0.7989036, 0.3824859, 1.243717, 0.7529412, 0, 1, 1,
0.8000956, -0.1867765, 2.076027, 0.7568628, 0, 1, 1,
0.8024513, -0.7705033, 4.154773, 0.7647059, 0, 1, 1,
0.8078016, -0.2169246, -0.4747581, 0.7686275, 0, 1, 1,
0.8091121, -0.7424079, 2.184377, 0.7764706, 0, 1, 1,
0.8095522, 1.280779, 0.2352854, 0.7803922, 0, 1, 1,
0.8112118, 0.2288107, 0.9627234, 0.7882353, 0, 1, 1,
0.8198347, 0.4960238, 0.8575336, 0.7921569, 0, 1, 1,
0.8227184, -1.180528, 2.680147, 0.8, 0, 1, 1,
0.8261849, 0.3304677, 1.429616, 0.8078431, 0, 1, 1,
0.8335917, 1.023924, 0.2619191, 0.8117647, 0, 1, 1,
0.8336449, 2.580033, 0.7099333, 0.8196079, 0, 1, 1,
0.8401558, 0.3485538, 1.461082, 0.8235294, 0, 1, 1,
0.8438678, -0.403896, 1.692827, 0.8313726, 0, 1, 1,
0.8456283, 0.8909094, 1.68111, 0.8352941, 0, 1, 1,
0.8458208, 0.04822617, 1.915672, 0.8431373, 0, 1, 1,
0.850305, -0.0608211, 0.3026983, 0.8470588, 0, 1, 1,
0.8504372, -1.45928, 4.322801, 0.854902, 0, 1, 1,
0.8545389, -0.3679883, 2.937269, 0.8588235, 0, 1, 1,
0.8576268, 0.6551062, 1.199132, 0.8666667, 0, 1, 1,
0.859102, -1.278942, 4.058671, 0.8705882, 0, 1, 1,
0.8663909, 0.5215617, 1.749511, 0.8784314, 0, 1, 1,
0.8667808, -1.149418, 2.845194, 0.8823529, 0, 1, 1,
0.8733679, 0.03387797, 1.385835, 0.8901961, 0, 1, 1,
0.8888324, -0.04663397, 0.1472417, 0.8941177, 0, 1, 1,
0.8919061, -1.677399, 2.654671, 0.9019608, 0, 1, 1,
0.8982769, 0.4334288, 0.990167, 0.9098039, 0, 1, 1,
0.8998308, -0.6407469, 0.2027899, 0.9137255, 0, 1, 1,
0.9018646, -2.230798, 2.532245, 0.9215686, 0, 1, 1,
0.905728, 0.03615374, 0.05487083, 0.9254902, 0, 1, 1,
0.9065353, 0.3860399, 0.788449, 0.9333333, 0, 1, 1,
0.9136797, -0.4641761, 1.597978, 0.9372549, 0, 1, 1,
0.9139402, 0.6004642, -0.1205418, 0.945098, 0, 1, 1,
0.9153957, -0.1987089, -0.1310524, 0.9490196, 0, 1, 1,
0.917898, 0.1029917, 2.579806, 0.9568627, 0, 1, 1,
0.9184743, 0.9463021, -0.3810862, 0.9607843, 0, 1, 1,
0.9229792, -0.4463425, 1.86253, 0.9686275, 0, 1, 1,
0.9247432, 0.02437755, 1.558251, 0.972549, 0, 1, 1,
0.9273182, -1.037874, 2.495994, 0.9803922, 0, 1, 1,
0.9329318, -0.001843552, 1.612866, 0.9843137, 0, 1, 1,
0.9361445, 0.135153, 0.376933, 0.9921569, 0, 1, 1,
0.9412097, 0.2759625, 1.753025, 0.9960784, 0, 1, 1,
0.9470062, 0.5638909, 3.640578, 1, 0, 0.9960784, 1,
0.9530477, 2.878513, 0.7129473, 1, 0, 0.9882353, 1,
0.9614794, 1.756455, -0.553373, 1, 0, 0.9843137, 1,
0.9659967, -0.1311321, 0.9523035, 1, 0, 0.9764706, 1,
0.9670996, -0.3034066, -0.4212381, 1, 0, 0.972549, 1,
0.9677222, 1.732518, 0.2954424, 1, 0, 0.9647059, 1,
0.9702382, 1.506454, 3.027108, 1, 0, 0.9607843, 1,
0.9779277, 0.9554491, 1.523443, 1, 0, 0.9529412, 1,
0.9784684, -1.19227, 2.59328, 1, 0, 0.9490196, 1,
0.9792485, -0.6468081, 2.200776, 1, 0, 0.9411765, 1,
0.9870395, -0.7231486, 2.801358, 1, 0, 0.9372549, 1,
0.9952275, -0.1839489, 2.117918, 1, 0, 0.9294118, 1,
0.9969161, -0.2329458, 0.1215844, 1, 0, 0.9254902, 1,
1.003699, -0.3464144, 1.801932, 1, 0, 0.9176471, 1,
1.005119, -0.005802031, 2.352542, 1, 0, 0.9137255, 1,
1.010884, 0.5849409, 0.9986649, 1, 0, 0.9058824, 1,
1.011086, -1.938588, 3.19114, 1, 0, 0.9019608, 1,
1.024324, -2.028731, 2.014611, 1, 0, 0.8941177, 1,
1.028186, 0.09976804, 0.03251702, 1, 0, 0.8862745, 1,
1.029271, 0.09635185, 0.1477293, 1, 0, 0.8823529, 1,
1.030824, -1.624, 1.020538, 1, 0, 0.8745098, 1,
1.041313, -0.4522276, 2.338892, 1, 0, 0.8705882, 1,
1.047006, 0.428205, 2.607387, 1, 0, 0.8627451, 1,
1.04972, -0.05196925, 2.187185, 1, 0, 0.8588235, 1,
1.051849, -1.408458, 0.9096456, 1, 0, 0.8509804, 1,
1.051874, 0.599346, -0.6506135, 1, 0, 0.8470588, 1,
1.054552, -1.128714, 1.663494, 1, 0, 0.8392157, 1,
1.060737, -2.063662, 2.581047, 1, 0, 0.8352941, 1,
1.066504, 1.847779, 0.242672, 1, 0, 0.827451, 1,
1.074914, -0.2425538, 2.163117, 1, 0, 0.8235294, 1,
1.078127, 1.616261, -0.8140779, 1, 0, 0.8156863, 1,
1.080205, 0.1795399, 1.376406, 1, 0, 0.8117647, 1,
1.081234, 0.8863826, 1.788279, 1, 0, 0.8039216, 1,
1.084537, 0.4407324, 0.2975425, 1, 0, 0.7960784, 1,
1.091478, 1.812859, 1.182379, 1, 0, 0.7921569, 1,
1.091946, 0.8780333, 0.7216012, 1, 0, 0.7843137, 1,
1.097009, -1.217261, 1.837672, 1, 0, 0.7803922, 1,
1.098053, -0.477903, 1.304591, 1, 0, 0.772549, 1,
1.099803, -0.5202651, 2.847116, 1, 0, 0.7686275, 1,
1.099956, 1.005055, 2.823703, 1, 0, 0.7607843, 1,
1.106193, -0.01864656, 1.110749, 1, 0, 0.7568628, 1,
1.113577, 0.9519107, 1.075974, 1, 0, 0.7490196, 1,
1.118747, -2.17593, 2.597345, 1, 0, 0.7450981, 1,
1.119137, 0.2892976, 0.7164885, 1, 0, 0.7372549, 1,
1.119362, 2.23722, 0.3953212, 1, 0, 0.7333333, 1,
1.120104, 1.615993, -0.8876908, 1, 0, 0.7254902, 1,
1.12081, -0.3747275, 1.759515, 1, 0, 0.7215686, 1,
1.121414, 2.219719, 1.186998, 1, 0, 0.7137255, 1,
1.130781, -0.3820058, 0.7296759, 1, 0, 0.7098039, 1,
1.139377, 1.095618, 1.008546, 1, 0, 0.7019608, 1,
1.142436, 0.8644309, 0.2526295, 1, 0, 0.6941177, 1,
1.144918, 0.1041098, 0.8848662, 1, 0, 0.6901961, 1,
1.153581, -0.2329721, 3.055569, 1, 0, 0.682353, 1,
1.159073, 0.9671624, 1.329721, 1, 0, 0.6784314, 1,
1.166412, -0.3198856, 1.08789, 1, 0, 0.6705883, 1,
1.171425, -0.3475722, 2.240381, 1, 0, 0.6666667, 1,
1.171571, 0.7156626, -0.2650361, 1, 0, 0.6588235, 1,
1.175238, 1.237862, 0.6932402, 1, 0, 0.654902, 1,
1.176058, 1.474347, 1.743185, 1, 0, 0.6470588, 1,
1.183147, 0.3972856, 1.640227, 1, 0, 0.6431373, 1,
1.189719, -0.2149342, 3.06164, 1, 0, 0.6352941, 1,
1.194121, -0.159792, 1.200155, 1, 0, 0.6313726, 1,
1.195375, 0.3946785, 1.350211, 1, 0, 0.6235294, 1,
1.198295, 1.14033, 0.8629159, 1, 0, 0.6196079, 1,
1.203937, 1.000535, 1.852022, 1, 0, 0.6117647, 1,
1.205538, -0.5954288, 4.354016, 1, 0, 0.6078432, 1,
1.206079, 2.303598, 1.320823, 1, 0, 0.6, 1,
1.208671, 1.197275, 2.855928, 1, 0, 0.5921569, 1,
1.214328, -0.4170515, 1.455828, 1, 0, 0.5882353, 1,
1.228285, -0.7003585, -0.03329083, 1, 0, 0.5803922, 1,
1.230113, -1.773071, 3.703553, 1, 0, 0.5764706, 1,
1.232763, 0.5785503, 1.47104, 1, 0, 0.5686275, 1,
1.233753, -1.127566, 2.581583, 1, 0, 0.5647059, 1,
1.237884, 2.122456, 0.294588, 1, 0, 0.5568628, 1,
1.251502, -0.8818046, 1.47363, 1, 0, 0.5529412, 1,
1.26246, -1.081436, 2.037333, 1, 0, 0.5450981, 1,
1.263268, 2.883886, 0.4943648, 1, 0, 0.5411765, 1,
1.263772, 0.6626871, 1.775884, 1, 0, 0.5333334, 1,
1.268892, 0.5355326, 2.138585, 1, 0, 0.5294118, 1,
1.275486, -1.024434, 1.025751, 1, 0, 0.5215687, 1,
1.280591, -0.1634456, 0.5906609, 1, 0, 0.5176471, 1,
1.28398, 0.1548897, 1.309214, 1, 0, 0.509804, 1,
1.294361, -0.5013642, 1.303343, 1, 0, 0.5058824, 1,
1.294743, 0.6224827, 0.9197144, 1, 0, 0.4980392, 1,
1.296515, -0.8142321, 1.796151, 1, 0, 0.4901961, 1,
1.29743, 0.1234307, -0.01307073, 1, 0, 0.4862745, 1,
1.311722, 0.01357738, 0.5385915, 1, 0, 0.4784314, 1,
1.314213, 1.400716, 1.155975, 1, 0, 0.4745098, 1,
1.318258, 0.4478265, 0.1173079, 1, 0, 0.4666667, 1,
1.326179, 1.459716, 0.9129247, 1, 0, 0.4627451, 1,
1.330145, 0.4170977, 0.4812096, 1, 0, 0.454902, 1,
1.341249, -1.254418, 2.334021, 1, 0, 0.4509804, 1,
1.350009, 1.202997, -0.1683652, 1, 0, 0.4431373, 1,
1.360721, -0.07640887, -0.2332395, 1, 0, 0.4392157, 1,
1.364746, -1.249587, 0.9760695, 1, 0, 0.4313726, 1,
1.367325, 0.3430836, 1.076118, 1, 0, 0.427451, 1,
1.372736, -0.1359966, 3.464607, 1, 0, 0.4196078, 1,
1.376835, 0.4782002, 1.765779, 1, 0, 0.4156863, 1,
1.385175, -0.6697149, 0.6608468, 1, 0, 0.4078431, 1,
1.390213, -0.8897294, 4.065821, 1, 0, 0.4039216, 1,
1.390841, 0.4658462, 0.1832949, 1, 0, 0.3960784, 1,
1.395898, 1.181813, -1.059672, 1, 0, 0.3882353, 1,
1.398323, 0.3291065, 1.688524, 1, 0, 0.3843137, 1,
1.398637, 0.04417859, 1.840847, 1, 0, 0.3764706, 1,
1.399371, 0.8487561, 0.8335409, 1, 0, 0.372549, 1,
1.404938, -1.05135, 2.20656, 1, 0, 0.3647059, 1,
1.423765, -0.8112981, 1.316138, 1, 0, 0.3607843, 1,
1.429779, 0.7373253, 2.532003, 1, 0, 0.3529412, 1,
1.434132, 1.163673, 0.5992938, 1, 0, 0.3490196, 1,
1.443212, 1.209796, 2.34907, 1, 0, 0.3411765, 1,
1.443364, 0.9622859, -0.07433677, 1, 0, 0.3372549, 1,
1.453368, 0.4509127, 1.660669, 1, 0, 0.3294118, 1,
1.454089, 1.194883, -0.8946831, 1, 0, 0.3254902, 1,
1.45996, -0.342167, 0.7416532, 1, 0, 0.3176471, 1,
1.465693, -0.2896201, 2.228577, 1, 0, 0.3137255, 1,
1.471569, 1.332446, 3.101948, 1, 0, 0.3058824, 1,
1.47597, -0.03314043, 2.932612, 1, 0, 0.2980392, 1,
1.485998, 0.4608098, 0.7084562, 1, 0, 0.2941177, 1,
1.486926, -2.318739, 3.883144, 1, 0, 0.2862745, 1,
1.493698, 0.9810838, 0.7752907, 1, 0, 0.282353, 1,
1.500164, 2.913775, 1.388447, 1, 0, 0.2745098, 1,
1.507944, 1.969126, -0.123129, 1, 0, 0.2705882, 1,
1.525132, -1.293967, 4.09283, 1, 0, 0.2627451, 1,
1.560934, -0.9211497, 1.517986, 1, 0, 0.2588235, 1,
1.578263, 2.547179, 0.02657308, 1, 0, 0.2509804, 1,
1.582023, -1.636157, 0.5848882, 1, 0, 0.2470588, 1,
1.59298, -0.2627098, 0.9459951, 1, 0, 0.2392157, 1,
1.60594, 0.8374221, 2.934846, 1, 0, 0.2352941, 1,
1.610672, 0.05697981, 1.434128, 1, 0, 0.227451, 1,
1.615149, -0.1416398, 1.920412, 1, 0, 0.2235294, 1,
1.622697, 1.745415, 0.7012079, 1, 0, 0.2156863, 1,
1.624371, -0.3948609, 1.024604, 1, 0, 0.2117647, 1,
1.638345, -1.422143, 1.274852, 1, 0, 0.2039216, 1,
1.695746, -0.3828547, 2.543192, 1, 0, 0.1960784, 1,
1.732867, -0.2716286, 2.520178, 1, 0, 0.1921569, 1,
1.734619, -1.067972, 2.582827, 1, 0, 0.1843137, 1,
1.745362, 1.181669, 0.9402528, 1, 0, 0.1803922, 1,
1.770945, -1.532618, 3.214505, 1, 0, 0.172549, 1,
1.780774, -0.2785947, 1.614024, 1, 0, 0.1686275, 1,
1.791775, -0.4534436, 1.524931, 1, 0, 0.1607843, 1,
1.80295, -0.2362727, 1.398571, 1, 0, 0.1568628, 1,
1.808433, 0.4043651, 1.700689, 1, 0, 0.1490196, 1,
1.858548, 0.8888195, 2.899177, 1, 0, 0.145098, 1,
1.860751, 0.3470929, 0.3602602, 1, 0, 0.1372549, 1,
1.917088, 1.774084, 1.438702, 1, 0, 0.1333333, 1,
1.963218, -0.7916305, 2.043666, 1, 0, 0.1254902, 1,
1.974538, -1.5511, 1.483088, 1, 0, 0.1215686, 1,
2.051755, 0.5382482, 1.00728, 1, 0, 0.1137255, 1,
2.072937, -0.2033453, 1.108542, 1, 0, 0.1098039, 1,
2.092536, 0.268769, -0.119262, 1, 0, 0.1019608, 1,
2.137753, 2.365945, 0.8628894, 1, 0, 0.09411765, 1,
2.138423, 0.178047, 0.4880774, 1, 0, 0.09019608, 1,
2.220334, -1.006728, 2.413368, 1, 0, 0.08235294, 1,
2.408947, 0.2947024, 1.782865, 1, 0, 0.07843138, 1,
2.474194, -0.7812434, 2.702427, 1, 0, 0.07058824, 1,
2.484753, -0.56932, 1.829895, 1, 0, 0.06666667, 1,
2.488611, 0.3174852, 2.548378, 1, 0, 0.05882353, 1,
2.583821, -1.082569, 1.270463, 1, 0, 0.05490196, 1,
2.622763, -0.169575, 0.6347308, 1, 0, 0.04705882, 1,
2.664695, 0.9446841, 0.6894364, 1, 0, 0.04313726, 1,
2.666306, -0.6057859, 0.3923597, 1, 0, 0.03529412, 1,
2.687066, 0.551295, 3.133936, 1, 0, 0.03137255, 1,
2.708458, 1.471886, 1.753273, 1, 0, 0.02352941, 1,
2.724304, 0.1099164, 0.4549293, 1, 0, 0.01960784, 1,
2.91117, 1.188096, 2.73192, 1, 0, 0.01176471, 1,
3.138395, -0.07231838, 3.001351, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.05084026, -4.118466, -7.433386, 0, -0.5, 0.5, 0.5,
-0.05084026, -4.118466, -7.433386, 1, -0.5, 0.5, 0.5,
-0.05084026, -4.118466, -7.433386, 1, 1.5, 0.5, 0.5,
-0.05084026, -4.118466, -7.433386, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.321227, 0.2248712, -7.433386, 0, -0.5, 0.5, 0.5,
-4.321227, 0.2248712, -7.433386, 1, -0.5, 0.5, 0.5,
-4.321227, 0.2248712, -7.433386, 1, 1.5, 0.5, 0.5,
-4.321227, 0.2248712, -7.433386, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.321227, -4.118466, -0.2033699, 0, -0.5, 0.5, 0.5,
-4.321227, -4.118466, -0.2033699, 1, -0.5, 0.5, 0.5,
-4.321227, -4.118466, -0.2033699, 1, 1.5, 0.5, 0.5,
-4.321227, -4.118466, -0.2033699, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.116158, -5.764921,
3, -3.116158, -5.764921,
-3, -3.116158, -5.764921,
-3, -3.283209, -6.042998,
-2, -3.116158, -5.764921,
-2, -3.283209, -6.042998,
-1, -3.116158, -5.764921,
-1, -3.283209, -6.042998,
0, -3.116158, -5.764921,
0, -3.283209, -6.042998,
1, -3.116158, -5.764921,
1, -3.283209, -6.042998,
2, -3.116158, -5.764921,
2, -3.283209, -6.042998,
3, -3.116158, -5.764921,
3, -3.283209, -6.042998
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -3.617312, -6.599154, 0, -0.5, 0.5, 0.5,
-3, -3.617312, -6.599154, 1, -0.5, 0.5, 0.5,
-3, -3.617312, -6.599154, 1, 1.5, 0.5, 0.5,
-3, -3.617312, -6.599154, 0, 1.5, 0.5, 0.5,
-2, -3.617312, -6.599154, 0, -0.5, 0.5, 0.5,
-2, -3.617312, -6.599154, 1, -0.5, 0.5, 0.5,
-2, -3.617312, -6.599154, 1, 1.5, 0.5, 0.5,
-2, -3.617312, -6.599154, 0, 1.5, 0.5, 0.5,
-1, -3.617312, -6.599154, 0, -0.5, 0.5, 0.5,
-1, -3.617312, -6.599154, 1, -0.5, 0.5, 0.5,
-1, -3.617312, -6.599154, 1, 1.5, 0.5, 0.5,
-1, -3.617312, -6.599154, 0, 1.5, 0.5, 0.5,
0, -3.617312, -6.599154, 0, -0.5, 0.5, 0.5,
0, -3.617312, -6.599154, 1, -0.5, 0.5, 0.5,
0, -3.617312, -6.599154, 1, 1.5, 0.5, 0.5,
0, -3.617312, -6.599154, 0, 1.5, 0.5, 0.5,
1, -3.617312, -6.599154, 0, -0.5, 0.5, 0.5,
1, -3.617312, -6.599154, 1, -0.5, 0.5, 0.5,
1, -3.617312, -6.599154, 1, 1.5, 0.5, 0.5,
1, -3.617312, -6.599154, 0, 1.5, 0.5, 0.5,
2, -3.617312, -6.599154, 0, -0.5, 0.5, 0.5,
2, -3.617312, -6.599154, 1, -0.5, 0.5, 0.5,
2, -3.617312, -6.599154, 1, 1.5, 0.5, 0.5,
2, -3.617312, -6.599154, 0, 1.5, 0.5, 0.5,
3, -3.617312, -6.599154, 0, -0.5, 0.5, 0.5,
3, -3.617312, -6.599154, 1, -0.5, 0.5, 0.5,
3, -3.617312, -6.599154, 1, 1.5, 0.5, 0.5,
3, -3.617312, -6.599154, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.335753, -3, -5.764921,
-3.335753, 3, -5.764921,
-3.335753, -3, -5.764921,
-3.499998, -3, -6.042998,
-3.335753, -2, -5.764921,
-3.499998, -2, -6.042998,
-3.335753, -1, -5.764921,
-3.499998, -1, -6.042998,
-3.335753, 0, -5.764921,
-3.499998, 0, -6.042998,
-3.335753, 1, -5.764921,
-3.499998, 1, -6.042998,
-3.335753, 2, -5.764921,
-3.499998, 2, -6.042998,
-3.335753, 3, -5.764921,
-3.499998, 3, -6.042998
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.82849, -3, -6.599154, 0, -0.5, 0.5, 0.5,
-3.82849, -3, -6.599154, 1, -0.5, 0.5, 0.5,
-3.82849, -3, -6.599154, 1, 1.5, 0.5, 0.5,
-3.82849, -3, -6.599154, 0, 1.5, 0.5, 0.5,
-3.82849, -2, -6.599154, 0, -0.5, 0.5, 0.5,
-3.82849, -2, -6.599154, 1, -0.5, 0.5, 0.5,
-3.82849, -2, -6.599154, 1, 1.5, 0.5, 0.5,
-3.82849, -2, -6.599154, 0, 1.5, 0.5, 0.5,
-3.82849, -1, -6.599154, 0, -0.5, 0.5, 0.5,
-3.82849, -1, -6.599154, 1, -0.5, 0.5, 0.5,
-3.82849, -1, -6.599154, 1, 1.5, 0.5, 0.5,
-3.82849, -1, -6.599154, 0, 1.5, 0.5, 0.5,
-3.82849, 0, -6.599154, 0, -0.5, 0.5, 0.5,
-3.82849, 0, -6.599154, 1, -0.5, 0.5, 0.5,
-3.82849, 0, -6.599154, 1, 1.5, 0.5, 0.5,
-3.82849, 0, -6.599154, 0, 1.5, 0.5, 0.5,
-3.82849, 1, -6.599154, 0, -0.5, 0.5, 0.5,
-3.82849, 1, -6.599154, 1, -0.5, 0.5, 0.5,
-3.82849, 1, -6.599154, 1, 1.5, 0.5, 0.5,
-3.82849, 1, -6.599154, 0, 1.5, 0.5, 0.5,
-3.82849, 2, -6.599154, 0, -0.5, 0.5, 0.5,
-3.82849, 2, -6.599154, 1, -0.5, 0.5, 0.5,
-3.82849, 2, -6.599154, 1, 1.5, 0.5, 0.5,
-3.82849, 2, -6.599154, 0, 1.5, 0.5, 0.5,
-3.82849, 3, -6.599154, 0, -0.5, 0.5, 0.5,
-3.82849, 3, -6.599154, 1, -0.5, 0.5, 0.5,
-3.82849, 3, -6.599154, 1, 1.5, 0.5, 0.5,
-3.82849, 3, -6.599154, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.335753, -3.116158, -4,
-3.335753, -3.116158, 4,
-3.335753, -3.116158, -4,
-3.499998, -3.283209, -4,
-3.335753, -3.116158, -2,
-3.499998, -3.283209, -2,
-3.335753, -3.116158, 0,
-3.499998, -3.283209, 0,
-3.335753, -3.116158, 2,
-3.499998, -3.283209, 2,
-3.335753, -3.116158, 4,
-3.499998, -3.283209, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.82849, -3.617312, -4, 0, -0.5, 0.5, 0.5,
-3.82849, -3.617312, -4, 1, -0.5, 0.5, 0.5,
-3.82849, -3.617312, -4, 1, 1.5, 0.5, 0.5,
-3.82849, -3.617312, -4, 0, 1.5, 0.5, 0.5,
-3.82849, -3.617312, -2, 0, -0.5, 0.5, 0.5,
-3.82849, -3.617312, -2, 1, -0.5, 0.5, 0.5,
-3.82849, -3.617312, -2, 1, 1.5, 0.5, 0.5,
-3.82849, -3.617312, -2, 0, 1.5, 0.5, 0.5,
-3.82849, -3.617312, 0, 0, -0.5, 0.5, 0.5,
-3.82849, -3.617312, 0, 1, -0.5, 0.5, 0.5,
-3.82849, -3.617312, 0, 1, 1.5, 0.5, 0.5,
-3.82849, -3.617312, 0, 0, 1.5, 0.5, 0.5,
-3.82849, -3.617312, 2, 0, -0.5, 0.5, 0.5,
-3.82849, -3.617312, 2, 1, -0.5, 0.5, 0.5,
-3.82849, -3.617312, 2, 1, 1.5, 0.5, 0.5,
-3.82849, -3.617312, 2, 0, 1.5, 0.5, 0.5,
-3.82849, -3.617312, 4, 0, -0.5, 0.5, 0.5,
-3.82849, -3.617312, 4, 1, -0.5, 0.5, 0.5,
-3.82849, -3.617312, 4, 1, 1.5, 0.5, 0.5,
-3.82849, -3.617312, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.335753, -3.116158, -5.764921,
-3.335753, 3.5659, -5.764921,
-3.335753, -3.116158, 5.358181,
-3.335753, 3.5659, 5.358181,
-3.335753, -3.116158, -5.764921,
-3.335753, -3.116158, 5.358181,
-3.335753, 3.5659, -5.764921,
-3.335753, 3.5659, 5.358181,
-3.335753, -3.116158, -5.764921,
3.234072, -3.116158, -5.764921,
-3.335753, -3.116158, 5.358181,
3.234072, -3.116158, 5.358181,
-3.335753, 3.5659, -5.764921,
3.234072, 3.5659, -5.764921,
-3.335753, 3.5659, 5.358181,
3.234072, 3.5659, 5.358181,
3.234072, -3.116158, -5.764921,
3.234072, 3.5659, -5.764921,
3.234072, -3.116158, 5.358181,
3.234072, 3.5659, 5.358181,
3.234072, -3.116158, -5.764921,
3.234072, -3.116158, 5.358181,
3.234072, 3.5659, -5.764921,
3.234072, 3.5659, 5.358181
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.76636;
var distance = 34.55341;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.05084026, -0.2248712, 0.2033699 );
mvMatrix.scale( 1.278138, 1.25667, 0.7549279 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.55341);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Hexaconazole<-read.table("Hexaconazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Hexaconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'Hexaconazole' not found
```

```r
y<-Hexaconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'Hexaconazole' not found
```

```r
z<-Hexaconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'Hexaconazole' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.240076, 1.075986, -2.033988, 0, 0, 1, 1, 1,
-3.063422, -1.597362, -1.013099, 1, 0, 0, 1, 1,
-2.771507, 0.8884674, -1.57221, 1, 0, 0, 1, 1,
-2.690878, -0.49348, -3.010255, 1, 0, 0, 1, 1,
-2.627068, 0.5065086, -2.729477, 1, 0, 0, 1, 1,
-2.604573, -1.361651, -1.639092, 1, 0, 0, 1, 1,
-2.560738, -1.47405, -2.10694, 0, 0, 0, 1, 1,
-2.428244, -1.05039, -2.818304, 0, 0, 0, 1, 1,
-2.361981, -0.6346319, -0.847307, 0, 0, 0, 1, 1,
-2.323062, 1.057496, 0.1259097, 0, 0, 0, 1, 1,
-2.309353, -0.622209, 0.2520354, 0, 0, 0, 1, 1,
-2.281734, -0.1226013, -1.908887, 0, 0, 0, 1, 1,
-2.257824, -0.1815895, -0.3424178, 0, 0, 0, 1, 1,
-2.224493, 0.1645205, -1.525726, 1, 1, 1, 1, 1,
-2.2151, 0.06109352, -0.8010805, 1, 1, 1, 1, 1,
-2.208391, -2.051313, -2.582079, 1, 1, 1, 1, 1,
-2.191447, -1.345897, -4.317039, 1, 1, 1, 1, 1,
-2.137329, 0.134655, -1.123292, 1, 1, 1, 1, 1,
-2.098925, 1.197038, -0.1000259, 1, 1, 1, 1, 1,
-2.076046, -0.02377461, -2.751287, 1, 1, 1, 1, 1,
-2.037971, -0.8045538, -0.9191948, 1, 1, 1, 1, 1,
-2.01484, -1.710946, -0.05952281, 1, 1, 1, 1, 1,
-2.00511, 0.2552966, -2.778538, 1, 1, 1, 1, 1,
-2.001734, 0.3253241, -2.095195, 1, 1, 1, 1, 1,
-1.988193, 0.8357992, -2.235261, 1, 1, 1, 1, 1,
-1.987925, -0.1368433, -1.48481, 1, 1, 1, 1, 1,
-1.982429, 0.4462976, -0.3055848, 1, 1, 1, 1, 1,
-1.956374, 0.379097, 0.1572689, 1, 1, 1, 1, 1,
-1.950395, 0.1964927, 1.789895, 0, 0, 1, 1, 1,
-1.936565, 0.3265329, -1.642935, 1, 0, 0, 1, 1,
-1.924559, 2.44978, -2.463422, 1, 0, 0, 1, 1,
-1.906774, -1.089796, -1.59576, 1, 0, 0, 1, 1,
-1.905017, 0.9514892, -1.181438, 1, 0, 0, 1, 1,
-1.901126, -1.780466, -1.038628, 1, 0, 0, 1, 1,
-1.890744, 1.005446, -0.3457451, 0, 0, 0, 1, 1,
-1.880792, 0.7293246, -1.058513, 0, 0, 0, 1, 1,
-1.880646, 1.691998, 0.8095825, 0, 0, 0, 1, 1,
-1.878904, -0.7766943, -1.57246, 0, 0, 0, 1, 1,
-1.877529, -2.180038, -0.3678358, 0, 0, 0, 1, 1,
-1.845792, -1.269494, -1.693261, 0, 0, 0, 1, 1,
-1.835106, 0.3031813, -1.851785, 0, 0, 0, 1, 1,
-1.711366, 0.02696589, -1.885915, 1, 1, 1, 1, 1,
-1.703209, -0.01607008, -0.5336411, 1, 1, 1, 1, 1,
-1.701872, -0.47212, -2.377888, 1, 1, 1, 1, 1,
-1.70181, 1.420925, -1.88717, 1, 1, 1, 1, 1,
-1.69111, -0.2520752, -2.214218, 1, 1, 1, 1, 1,
-1.688853, 0.149487, 0.4342124, 1, 1, 1, 1, 1,
-1.679913, 1.053419, 0.5636128, 1, 1, 1, 1, 1,
-1.65334, 0.1954862, -2.005618, 1, 1, 1, 1, 1,
-1.618406, -0.09574452, -1.843968, 1, 1, 1, 1, 1,
-1.616483, 1.53468, -0.9613388, 1, 1, 1, 1, 1,
-1.601009, -1.360213, -2.7132, 1, 1, 1, 1, 1,
-1.585841, -1.059758, -2.80135, 1, 1, 1, 1, 1,
-1.576785, 0.8442127, -0.9876536, 1, 1, 1, 1, 1,
-1.576077, -1.223913, -1.718343, 1, 1, 1, 1, 1,
-1.562498, 1.970928, -0.5794437, 1, 1, 1, 1, 1,
-1.556714, -1.279482, -1.980538, 0, 0, 1, 1, 1,
-1.545636, 1.180899, 1.453009, 1, 0, 0, 1, 1,
-1.537135, -0.3689668, -3.817178, 1, 0, 0, 1, 1,
-1.535479, 0.3421968, 0.790525, 1, 0, 0, 1, 1,
-1.52226, 1.016367, -1.253253, 1, 0, 0, 1, 1,
-1.521226, 0.0452249, -0.745265, 1, 0, 0, 1, 1,
-1.517375, 0.8272447, -1.708375, 0, 0, 0, 1, 1,
-1.514102, 0.5723006, -0.6006956, 0, 0, 0, 1, 1,
-1.497225, 0.2259788, -0.453438, 0, 0, 0, 1, 1,
-1.474713, 0.8521675, -0.09004008, 0, 0, 0, 1, 1,
-1.467287, 0.6115598, -1.634604, 0, 0, 0, 1, 1,
-1.454115, 0.2875865, -1.382384, 0, 0, 0, 1, 1,
-1.43467, 0.1261053, 0.1996994, 0, 0, 0, 1, 1,
-1.434274, -0.3341907, -2.249491, 1, 1, 1, 1, 1,
-1.433213, -0.006328373, -1.706333, 1, 1, 1, 1, 1,
-1.431895, 1.988917, -0.1861982, 1, 1, 1, 1, 1,
-1.427959, -0.8776342, -3.210595, 1, 1, 1, 1, 1,
-1.423459, -1.115607, -2.330798, 1, 1, 1, 1, 1,
-1.422848, 0.05958284, -2.361012, 1, 1, 1, 1, 1,
-1.421232, 1.198043, 0.4227705, 1, 1, 1, 1, 1,
-1.40838, -1.089918, -3.193344, 1, 1, 1, 1, 1,
-1.390572, -1.578098, -2.546795, 1, 1, 1, 1, 1,
-1.366982, 0.2163726, -1.094068, 1, 1, 1, 1, 1,
-1.361527, 0.4353562, -0.3293838, 1, 1, 1, 1, 1,
-1.35865, 0.1420835, -1.929826, 1, 1, 1, 1, 1,
-1.340582, -2.442636, -2.675502, 1, 1, 1, 1, 1,
-1.337361, -0.9873689, -4.326541, 1, 1, 1, 1, 1,
-1.336984, 3.468588, -0.67463, 1, 1, 1, 1, 1,
-1.335482, 1.293824, -1.277242, 0, 0, 1, 1, 1,
-1.333973, -0.634677, -0.9667343, 1, 0, 0, 1, 1,
-1.327235, 2.275996, -1.640289, 1, 0, 0, 1, 1,
-1.327161, -0.8780733, -2.455852, 1, 0, 0, 1, 1,
-1.327059, -0.3621609, -3.104191, 1, 0, 0, 1, 1,
-1.324873, 1.218457, 0.2375019, 1, 0, 0, 1, 1,
-1.324223, -0.9803731, -2.473274, 0, 0, 0, 1, 1,
-1.311598, -1.733071, -3.223178, 0, 0, 0, 1, 1,
-1.311325, -0.7542406, -1.120205, 0, 0, 0, 1, 1,
-1.301393, -1.38429, -4.031393, 0, 0, 0, 1, 1,
-1.293443, -1.194194, -2.018631, 0, 0, 0, 1, 1,
-1.288307, 0.5248263, 0.08668233, 0, 0, 0, 1, 1,
-1.273375, 2.056944, -1.160885, 0, 0, 0, 1, 1,
-1.272047, 0.2230336, 0.07603253, 1, 1, 1, 1, 1,
-1.265047, 0.6077788, -0.09900476, 1, 1, 1, 1, 1,
-1.261786, -2.067078, -1.823018, 1, 1, 1, 1, 1,
-1.243677, 1.531846, -0.9346065, 1, 1, 1, 1, 1,
-1.229881, -0.5185744, -2.298402, 1, 1, 1, 1, 1,
-1.225713, 0.7320209, -0.09079321, 1, 1, 1, 1, 1,
-1.223654, -0.9922872, -3.164033, 1, 1, 1, 1, 1,
-1.222161, -2.528886, -2.980243, 1, 1, 1, 1, 1,
-1.213859, -0.5374754, -0.6967643, 1, 1, 1, 1, 1,
-1.201672, -0.3335907, -2.738626, 1, 1, 1, 1, 1,
-1.197947, 1.307827, 0.1099267, 1, 1, 1, 1, 1,
-1.185728, -0.8125545, -2.541842, 1, 1, 1, 1, 1,
-1.183234, 1.420493, -1.602119, 1, 1, 1, 1, 1,
-1.167146, 0.8853669, 0.01631867, 1, 1, 1, 1, 1,
-1.165472, -0.6660972, -0.8183897, 1, 1, 1, 1, 1,
-1.160423, -0.653385, -3.49772, 0, 0, 1, 1, 1,
-1.159345, 1.810923, -2.234274, 1, 0, 0, 1, 1,
-1.159271, -0.7768157, -2.489539, 1, 0, 0, 1, 1,
-1.157844, -1.109264, -3.515421, 1, 0, 0, 1, 1,
-1.151264, 0.08481705, -2.645572, 1, 0, 0, 1, 1,
-1.144316, 0.3121302, -1.895616, 1, 0, 0, 1, 1,
-1.142448, -0.5273935, -1.097918, 0, 0, 0, 1, 1,
-1.141504, 0.9502254, 0.04797263, 0, 0, 0, 1, 1,
-1.139583, 0.4418198, -3.088768, 0, 0, 0, 1, 1,
-1.133688, -0.5810073, -3.047286, 0, 0, 0, 1, 1,
-1.130819, -0.4625863, -1.136413, 0, 0, 0, 1, 1,
-1.126424, 0.689569, -3.319233, 0, 0, 0, 1, 1,
-1.124882, 0.7122741, -1.530297, 0, 0, 0, 1, 1,
-1.124353, 0.8338349, -3.812625, 1, 1, 1, 1, 1,
-1.122554, -1.934041, -4.76221, 1, 1, 1, 1, 1,
-1.122399, 2.048247, -0.8551165, 1, 1, 1, 1, 1,
-1.1192, -2.611617, -1.994833, 1, 1, 1, 1, 1,
-1.118991, -0.9176038, -2.34666, 1, 1, 1, 1, 1,
-1.11737, 0.2293508, -1.720794, 1, 1, 1, 1, 1,
-1.109505, -1.079331, -1.210086, 1, 1, 1, 1, 1,
-1.105383, -0.107082, -0.09500871, 1, 1, 1, 1, 1,
-1.100672, 0.9059229, -0.8069254, 1, 1, 1, 1, 1,
-1.095904, -0.6927534, -1.778724, 1, 1, 1, 1, 1,
-1.09381, 0.6142617, -0.3440584, 1, 1, 1, 1, 1,
-1.085655, -0.6127623, -2.088505, 1, 1, 1, 1, 1,
-1.082554, -2.423158, -3.310121, 1, 1, 1, 1, 1,
-1.075553, -0.584278, -1.663219, 1, 1, 1, 1, 1,
-1.072529, 0.3445377, -0.7141793, 1, 1, 1, 1, 1,
-1.051029, 0.3027861, -1.623981, 0, 0, 1, 1, 1,
-1.048964, 0.8690203, 0.6106451, 1, 0, 0, 1, 1,
-1.044832, 0.4517141, 0.0497233, 1, 0, 0, 1, 1,
-1.04463, -1.812147, -3.453292, 1, 0, 0, 1, 1,
-1.043728, -0.6417153, -0.6633475, 1, 0, 0, 1, 1,
-1.042623, -0.4879196, -3.04733, 1, 0, 0, 1, 1,
-1.02025, 0.1876094, -1.961693, 0, 0, 0, 1, 1,
-1.017008, 0.5361666, -1.619233, 0, 0, 0, 1, 1,
-1.0144, -0.02488331, -2.617027, 0, 0, 0, 1, 1,
-1.011606, 0.04348538, -1.51581, 0, 0, 0, 1, 1,
-1.003427, 1.781343, -4.772125, 0, 0, 0, 1, 1,
-0.9999635, -1.218056, -2.532392, 0, 0, 0, 1, 1,
-0.9984973, 0.2269587, -1.581279, 0, 0, 0, 1, 1,
-0.9898572, -0.5861096, -2.47409, 1, 1, 1, 1, 1,
-0.9866444, -0.8487968, -2.299681, 1, 1, 1, 1, 1,
-0.9833841, 1.43148, -1.481155, 1, 1, 1, 1, 1,
-0.9777889, -0.1216693, -2.341449, 1, 1, 1, 1, 1,
-0.9774163, -0.4231381, -1.299273, 1, 1, 1, 1, 1,
-0.9745964, -0.2043955, -2.096168, 1, 1, 1, 1, 1,
-0.974052, 0.2957513, -1.928474, 1, 1, 1, 1, 1,
-0.9586238, 0.8841432, -1.539358, 1, 1, 1, 1, 1,
-0.9582954, 1.73963, 1.254446, 1, 1, 1, 1, 1,
-0.9561075, 1.16854, -0.6423439, 1, 1, 1, 1, 1,
-0.9527122, 0.934146, -1.452587, 1, 1, 1, 1, 1,
-0.9494097, 1.096579, -2.041669, 1, 1, 1, 1, 1,
-0.945427, -0.5294895, -2.071955, 1, 1, 1, 1, 1,
-0.9367111, 0.6292018, -0.9272724, 1, 1, 1, 1, 1,
-0.9366589, 1.075243, -0.7127548, 1, 1, 1, 1, 1,
-0.9297654, -0.401488, -4.011421, 0, 0, 1, 1, 1,
-0.9295913, 0.4399143, -0.6642947, 1, 0, 0, 1, 1,
-0.9279876, 0.1770748, -1.621905, 1, 0, 0, 1, 1,
-0.9254317, -0.3908175, -2.02749, 1, 0, 0, 1, 1,
-0.9237374, 0.04015192, -1.829179, 1, 0, 0, 1, 1,
-0.9230348, -1.971911, -1.70984, 1, 0, 0, 1, 1,
-0.9216676, 0.812856, -0.5445542, 0, 0, 0, 1, 1,
-0.9203788, 2.441962, 0.7219151, 0, 0, 0, 1, 1,
-0.9178346, -0.899159, -2.820173, 0, 0, 0, 1, 1,
-0.9148867, -1.601332, -2.83072, 0, 0, 0, 1, 1,
-0.9129927, -0.03636254, -3.286263, 0, 0, 0, 1, 1,
-0.911786, -1.494316, -0.6186154, 0, 0, 0, 1, 1,
-0.9072577, -1.081781, -0.8044893, 0, 0, 0, 1, 1,
-0.8990077, -1.143765, -3.499121, 1, 1, 1, 1, 1,
-0.8950109, -0.1974612, -1.922705, 1, 1, 1, 1, 1,
-0.8927045, 0.0623347, -1.014091, 1, 1, 1, 1, 1,
-0.8925295, -0.03226975, -2.591548, 1, 1, 1, 1, 1,
-0.8901984, -0.8120549, -0.7722445, 1, 1, 1, 1, 1,
-0.8885301, 0.1304193, -3.20948, 1, 1, 1, 1, 1,
-0.8818641, -0.9645373, -4.352731, 1, 1, 1, 1, 1,
-0.8785324, 0.2786304, -1.080367, 1, 1, 1, 1, 1,
-0.8782062, 0.8170493, 0.1873977, 1, 1, 1, 1, 1,
-0.8767661, 0.8440312, -1.444498, 1, 1, 1, 1, 1,
-0.8759776, -1.856287, -1.499472, 1, 1, 1, 1, 1,
-0.8705558, 0.5552821, -0.6048406, 1, 1, 1, 1, 1,
-0.8663651, 2.013262, -1.910332, 1, 1, 1, 1, 1,
-0.8630507, -0.9896668, -2.92936, 1, 1, 1, 1, 1,
-0.8629065, -0.06648648, -1.154141, 1, 1, 1, 1, 1,
-0.8613493, 1.333644, -2.660081, 0, 0, 1, 1, 1,
-0.8558429, 0.431864, -0.1150808, 1, 0, 0, 1, 1,
-0.8514861, 1.425499, -1.505903, 1, 0, 0, 1, 1,
-0.8471481, -0.2744972, -1.379282, 1, 0, 0, 1, 1,
-0.8439549, 1.165927, -1.936991, 1, 0, 0, 1, 1,
-0.8397462, 1.959767, 0.9914001, 1, 0, 0, 1, 1,
-0.8348967, 0.01501229, -3.063302, 0, 0, 0, 1, 1,
-0.8224056, 1.273436, 1.973015, 0, 0, 0, 1, 1,
-0.8198965, -0.8630719, -1.47757, 0, 0, 0, 1, 1,
-0.81792, -2.444158, -2.581315, 0, 0, 0, 1, 1,
-0.8146107, 1.136077, -2.863306, 0, 0, 0, 1, 1,
-0.8099473, 0.3667816, -0.4181139, 0, 0, 0, 1, 1,
-0.8074836, -1.54274, -4.128442, 0, 0, 0, 1, 1,
-0.8031642, 0.2727798, -2.613522, 1, 1, 1, 1, 1,
-0.8006546, -0.1111182, -3.085827, 1, 1, 1, 1, 1,
-0.7946312, 0.2762697, -0.8181626, 1, 1, 1, 1, 1,
-0.7936565, -0.4595193, -2.359675, 1, 1, 1, 1, 1,
-0.7868747, 0.8799432, -0.8565465, 1, 1, 1, 1, 1,
-0.7811933, 0.8143413, -1.115065, 1, 1, 1, 1, 1,
-0.7762527, -0.8433541, 0.1838652, 1, 1, 1, 1, 1,
-0.7733899, -0.1887821, -2.296311, 1, 1, 1, 1, 1,
-0.7730367, -0.2523476, -2.164166, 1, 1, 1, 1, 1,
-0.7701783, -0.4168493, -1.260912, 1, 1, 1, 1, 1,
-0.767944, -1.463762, -4.003018, 1, 1, 1, 1, 1,
-0.7573608, 1.424562, 1.688634, 1, 1, 1, 1, 1,
-0.7546734, 0.4716241, -3.699719, 1, 1, 1, 1, 1,
-0.7539762, 0.6134795, -0.4019876, 1, 1, 1, 1, 1,
-0.7539544, 0.05272959, -2.421302, 1, 1, 1, 1, 1,
-0.7523042, -0.3104342, -2.341092, 0, 0, 1, 1, 1,
-0.7495424, -1.057497, -1.97921, 1, 0, 0, 1, 1,
-0.7494414, 0.004783486, -1.400162, 1, 0, 0, 1, 1,
-0.7465451, -0.980261, -2.883854, 1, 0, 0, 1, 1,
-0.7425163, -0.4688488, -1.917589, 1, 0, 0, 1, 1,
-0.7416787, -1.409125, -3.061725, 1, 0, 0, 1, 1,
-0.7352087, -1.39325, -2.688041, 0, 0, 0, 1, 1,
-0.7252612, -0.6397922, -1.837956, 0, 0, 0, 1, 1,
-0.7241098, -0.5454744, -3.984219, 0, 0, 0, 1, 1,
-0.720397, -0.6931282, -4.203668, 0, 0, 0, 1, 1,
-0.7144435, -0.03174634, -1.082589, 0, 0, 0, 1, 1,
-0.708953, -0.8786294, -2.440196, 0, 0, 0, 1, 1,
-0.704507, 0.8731552, -1.999074, 0, 0, 0, 1, 1,
-0.7022344, 1.878028, 1.133686, 1, 1, 1, 1, 1,
-0.7009224, 1.359535, -1.688071, 1, 1, 1, 1, 1,
-0.6916278, 0.4004629, -0.3553701, 1, 1, 1, 1, 1,
-0.6902211, -0.4330961, -1.311099, 1, 1, 1, 1, 1,
-0.6901991, 0.4492514, -0.7990088, 1, 1, 1, 1, 1,
-0.689876, 1.047159, -1.057528, 1, 1, 1, 1, 1,
-0.6886464, -0.4618694, -2.869841, 1, 1, 1, 1, 1,
-0.6863251, -0.06376684, -1.904657, 1, 1, 1, 1, 1,
-0.6824163, -1.45552, -3.01719, 1, 1, 1, 1, 1,
-0.6798769, -0.08935642, -2.545184, 1, 1, 1, 1, 1,
-0.6785431, 1.192646, -0.3813632, 1, 1, 1, 1, 1,
-0.6769947, -0.6084761, -1.961021, 1, 1, 1, 1, 1,
-0.6745895, -0.08308224, -0.2336176, 1, 1, 1, 1, 1,
-0.6736165, 1.590463, -1.079642, 1, 1, 1, 1, 1,
-0.6717116, 0.228682, -0.9625, 1, 1, 1, 1, 1,
-0.6712359, -0.1292371, -1.20661, 0, 0, 1, 1, 1,
-0.6702408, -0.3197632, -0.9492725, 1, 0, 0, 1, 1,
-0.6698558, -0.407759, -0.6729223, 1, 0, 0, 1, 1,
-0.6655063, -1.127108, -5.602934, 1, 0, 0, 1, 1,
-0.660659, -0.857258, -2.329215, 1, 0, 0, 1, 1,
-0.6561096, 1.934769, -1.159626, 1, 0, 0, 1, 1,
-0.6528618, -0.6046781, -0.9307085, 0, 0, 0, 1, 1,
-0.6519963, 0.6579623, 2.013184, 0, 0, 0, 1, 1,
-0.6519854, 0.635905, -1.794909, 0, 0, 0, 1, 1,
-0.6441215, 0.03054718, -1.724653, 0, 0, 0, 1, 1,
-0.6439787, 0.3203341, -2.825002, 0, 0, 0, 1, 1,
-0.6434933, 0.1582915, -2.151923, 0, 0, 0, 1, 1,
-0.6427572, 1.000974, -0.3071296, 0, 0, 0, 1, 1,
-0.6419016, 0.8409203, -0.68854, 1, 1, 1, 1, 1,
-0.6388138, -1.493074, -2.267046, 1, 1, 1, 1, 1,
-0.6352682, 0.9862729, -0.3132084, 1, 1, 1, 1, 1,
-0.6284611, 2.075679, -1.547519, 1, 1, 1, 1, 1,
-0.6177877, 0.01152746, -1.571588, 1, 1, 1, 1, 1,
-0.6174215, -0.0924255, -1.0195, 1, 1, 1, 1, 1,
-0.6129084, -0.5970775, -3.101628, 1, 1, 1, 1, 1,
-0.6095354, 0.8038993, -1.47315, 1, 1, 1, 1, 1,
-0.6000876, 0.006098093, -1.542373, 1, 1, 1, 1, 1,
-0.5875108, -1.521949, -2.563753, 1, 1, 1, 1, 1,
-0.5873615, -0.7520376, -2.768785, 1, 1, 1, 1, 1,
-0.5812606, -1.216041, -2.038133, 1, 1, 1, 1, 1,
-0.5788602, 0.6602381, -1.641105, 1, 1, 1, 1, 1,
-0.5718833, -0.2006979, -0.7999651, 1, 1, 1, 1, 1,
-0.5704169, 1.294048, -1.392781, 1, 1, 1, 1, 1,
-0.569126, -0.2189869, -2.732943, 0, 0, 1, 1, 1,
-0.5651217, -0.3599523, -1.32736, 1, 0, 0, 1, 1,
-0.5617142, 0.1595864, 0.3266094, 1, 0, 0, 1, 1,
-0.5530094, -2.309881, -3.231301, 1, 0, 0, 1, 1,
-0.5516977, -0.7535963, -2.256148, 1, 0, 0, 1, 1,
-0.5505008, -1.527541, -3.090236, 1, 0, 0, 1, 1,
-0.5500159, -0.9585531, -1.442645, 0, 0, 0, 1, 1,
-0.5488664, 1.633442, 0.3226607, 0, 0, 0, 1, 1,
-0.5472372, 0.8417635, -2.666651, 0, 0, 0, 1, 1,
-0.5433822, 0.5792626, -1.310117, 0, 0, 0, 1, 1,
-0.5420583, -0.787158, -2.645742, 0, 0, 0, 1, 1,
-0.5399283, 0.3965223, -1.611595, 0, 0, 0, 1, 1,
-0.5396591, 0.8281515, -0.3827578, 0, 0, 0, 1, 1,
-0.527577, 1.716591, -0.09947141, 1, 1, 1, 1, 1,
-0.5225578, -0.4219889, -2.268745, 1, 1, 1, 1, 1,
-0.5190409, -0.8045443, -3.097874, 1, 1, 1, 1, 1,
-0.5181396, -0.338991, -1.723912, 1, 1, 1, 1, 1,
-0.516614, 0.4555082, 0.3418399, 1, 1, 1, 1, 1,
-0.5105602, 0.8632306, 0.8134122, 1, 1, 1, 1, 1,
-0.5036346, 1.74074, -0.09636121, 1, 1, 1, 1, 1,
-0.5032106, 1.127585, 0.07830774, 1, 1, 1, 1, 1,
-0.5027732, 0.6652692, -2.099971, 1, 1, 1, 1, 1,
-0.5026391, 0.07198295, -1.053132, 1, 1, 1, 1, 1,
-0.4971976, -0.152023, -2.667098, 1, 1, 1, 1, 1,
-0.4955042, 0.5277599, -1.242113, 1, 1, 1, 1, 1,
-0.4934418, -0.4126401, -1.341216, 1, 1, 1, 1, 1,
-0.4913544, 0.9928429, -1.514464, 1, 1, 1, 1, 1,
-0.4898445, 0.5137842, -1.240243, 1, 1, 1, 1, 1,
-0.4872161, 0.369272, -1.485918, 0, 0, 1, 1, 1,
-0.4868517, -1.460061, -3.123658, 1, 0, 0, 1, 1,
-0.4848621, -1.603137, -0.7738059, 1, 0, 0, 1, 1,
-0.4808426, -3.018846, -4.270705, 1, 0, 0, 1, 1,
-0.4801459, 0.2557236, -2.694465, 1, 0, 0, 1, 1,
-0.4756185, 0.5316784, -1.003938, 1, 0, 0, 1, 1,
-0.474664, 1.084234, -0.1390091, 0, 0, 0, 1, 1,
-0.4736206, 1.057454, 0.2850126, 0, 0, 0, 1, 1,
-0.4715711, -0.8135388, -1.093183, 0, 0, 0, 1, 1,
-0.4700433, 0.7917969, 0.1273005, 0, 0, 0, 1, 1,
-0.4699298, -0.6086345, -3.408724, 0, 0, 0, 1, 1,
-0.4589137, 0.9088916, -0.8602008, 0, 0, 0, 1, 1,
-0.4577094, -0.3944525, -0.2837782, 0, 0, 0, 1, 1,
-0.4524642, -0.7924039, -1.821636, 1, 1, 1, 1, 1,
-0.4462478, 0.8645189, -2.447851, 1, 1, 1, 1, 1,
-0.445566, -0.5614975, -2.457887, 1, 1, 1, 1, 1,
-0.4444124, 0.9748221, -0.4338142, 1, 1, 1, 1, 1,
-0.4391224, 0.2290242, -0.6755553, 1, 1, 1, 1, 1,
-0.4365176, -0.4941273, -2.883029, 1, 1, 1, 1, 1,
-0.4364012, -1.133479, -1.125444, 1, 1, 1, 1, 1,
-0.4345191, -1.117121, -2.028872, 1, 1, 1, 1, 1,
-0.4311253, 1.280263, -1.283508, 1, 1, 1, 1, 1,
-0.4260071, 0.05203, 0.06667462, 1, 1, 1, 1, 1,
-0.4250815, 1.261137, -0.09386629, 1, 1, 1, 1, 1,
-0.4210204, -0.08046689, -3.268819, 1, 1, 1, 1, 1,
-0.4201688, -0.1797579, -3.334338, 1, 1, 1, 1, 1,
-0.4192637, -0.3846807, -3.741086, 1, 1, 1, 1, 1,
-0.4158888, -0.1501693, -1.797069, 1, 1, 1, 1, 1,
-0.4158589, -1.219171, -3.746309, 0, 0, 1, 1, 1,
-0.4132881, 0.7443817, -0.4635153, 1, 0, 0, 1, 1,
-0.4109927, -0.3901575, -1.548259, 1, 0, 0, 1, 1,
-0.410417, 0.6058469, 0.9945016, 1, 0, 0, 1, 1,
-0.4089988, -0.04583663, -1.126447, 1, 0, 0, 1, 1,
-0.4077155, -1.992603, -1.588667, 1, 0, 0, 1, 1,
-0.4045047, -0.1333009, -0.8861659, 0, 0, 0, 1, 1,
-0.4024206, 0.9169533, 0.03042316, 0, 0, 0, 1, 1,
-0.3958578, 0.2966422, -1.38659, 0, 0, 0, 1, 1,
-0.3910159, -0.2358395, -1.843701, 0, 0, 0, 1, 1,
-0.383845, -0.5111325, -2.43253, 0, 0, 0, 1, 1,
-0.3825159, -0.7284252, -4.913813, 0, 0, 0, 1, 1,
-0.3817841, 0.04363015, -1.114897, 0, 0, 0, 1, 1,
-0.3816372, 1.26636, -0.9219609, 1, 1, 1, 1, 1,
-0.3735743, -1.22384, -3.607368, 1, 1, 1, 1, 1,
-0.3728835, 0.5042769, -1.393956, 1, 1, 1, 1, 1,
-0.3724364, -0.4134388, -2.092789, 1, 1, 1, 1, 1,
-0.3686374, -0.9815652, -1.649713, 1, 1, 1, 1, 1,
-0.3637023, -1.61665, -2.584197, 1, 1, 1, 1, 1,
-0.3615404, -0.4737729, -2.441749, 1, 1, 1, 1, 1,
-0.359961, 0.2594205, -0.21466, 1, 1, 1, 1, 1,
-0.3569961, 0.5352519, -1.005537, 1, 1, 1, 1, 1,
-0.3529149, 0.3239821, -0.3062609, 1, 1, 1, 1, 1,
-0.3524646, -1.745612, -2.720937, 1, 1, 1, 1, 1,
-0.3506199, 0.1393621, 0.7829067, 1, 1, 1, 1, 1,
-0.3499627, 1.068141, 0.1160314, 1, 1, 1, 1, 1,
-0.3439011, 1.782851, -2.088998, 1, 1, 1, 1, 1,
-0.3427487, -1.919521, -4.46319, 1, 1, 1, 1, 1,
-0.3420572, -0.1001752, -2.358894, 0, 0, 1, 1, 1,
-0.3369478, -1.912644, -3.919586, 1, 0, 0, 1, 1,
-0.333527, 0.4528443, -0.8735234, 1, 0, 0, 1, 1,
-0.3294965, -0.5736659, -2.450904, 1, 0, 0, 1, 1,
-0.3224489, -0.4292036, -4.270225, 1, 0, 0, 1, 1,
-0.3182268, 0.9832, 0.2457859, 1, 0, 0, 1, 1,
-0.3150035, -0.8035981, -3.928206, 0, 0, 0, 1, 1,
-0.3109432, 0.1293947, -1.138221, 0, 0, 0, 1, 1,
-0.3090156, -0.31122, -3.06858, 0, 0, 0, 1, 1,
-0.3023275, -1.159744, -2.309857, 0, 0, 0, 1, 1,
-0.3018539, 0.3302997, -2.345261, 0, 0, 0, 1, 1,
-0.2965757, 0.4358734, 0.06706584, 0, 0, 0, 1, 1,
-0.2920064, -1.344014, -2.453401, 0, 0, 0, 1, 1,
-0.288613, 1.355574, -1.719037, 1, 1, 1, 1, 1,
-0.2884995, 1.766531, 0.1064151, 1, 1, 1, 1, 1,
-0.2872413, 0.4762996, 0.961844, 1, 1, 1, 1, 1,
-0.2867955, -1.079391, -2.921622, 1, 1, 1, 1, 1,
-0.2866858, -0.3362206, -3.683085, 1, 1, 1, 1, 1,
-0.2800319, 0.3384414, -1.311428, 1, 1, 1, 1, 1,
-0.2797181, -0.1775287, -1.978214, 1, 1, 1, 1, 1,
-0.2711647, -0.1278085, -1.975703, 1, 1, 1, 1, 1,
-0.2632916, 0.2001402, -0.3716787, 1, 1, 1, 1, 1,
-0.2618937, -0.9385458, -3.046354, 1, 1, 1, 1, 1,
-0.2574862, -0.08373813, -1.112177, 1, 1, 1, 1, 1,
-0.2572611, 1.097306, 0.1889561, 1, 1, 1, 1, 1,
-0.2549399, -0.5725681, -3.099949, 1, 1, 1, 1, 1,
-0.2482701, -0.004056638, -2.442237, 1, 1, 1, 1, 1,
-0.2476899, -0.5141739, -2.715278, 1, 1, 1, 1, 1,
-0.245082, 0.2273115, -2.139835, 0, 0, 1, 1, 1,
-0.2450299, -1.023933, -1.621989, 1, 0, 0, 1, 1,
-0.2447336, 0.5925824, -0.9930733, 1, 0, 0, 1, 1,
-0.2412309, 0.1842783, -0.2392391, 1, 0, 0, 1, 1,
-0.2406879, -0.3107276, -2.932533, 1, 0, 0, 1, 1,
-0.2366808, -0.9778891, -2.53808, 1, 0, 0, 1, 1,
-0.2341198, -0.6687638, -3.943583, 0, 0, 0, 1, 1,
-0.2338585, 0.4499924, -0.755895, 0, 0, 0, 1, 1,
-0.2322502, -1.586513, -2.671171, 0, 0, 0, 1, 1,
-0.223469, -0.4161798, -4.575151, 0, 0, 0, 1, 1,
-0.2154658, 0.2159493, -1.25779, 0, 0, 0, 1, 1,
-0.2152652, -1.074463, -2.590753, 0, 0, 0, 1, 1,
-0.2143653, 0.7959539, -2.150552, 0, 0, 0, 1, 1,
-0.2131853, -1.381142, -3.126343, 1, 1, 1, 1, 1,
-0.2128047, 0.7696505, -0.03035874, 1, 1, 1, 1, 1,
-0.2086629, 0.7936426, 0.3203015, 1, 1, 1, 1, 1,
-0.2076258, 0.5913852, -0.6151405, 1, 1, 1, 1, 1,
-0.2030634, -0.7788198, -3.154793, 1, 1, 1, 1, 1,
-0.2018826, -0.4227955, -2.384702, 1, 1, 1, 1, 1,
-0.1929386, 1.005547, -0.8523731, 1, 1, 1, 1, 1,
-0.1917094, 0.3449644, 0.3624899, 1, 1, 1, 1, 1,
-0.1907537, -0.1191774, -3.735663, 1, 1, 1, 1, 1,
-0.1904731, -0.0548848, -3.290634, 1, 1, 1, 1, 1,
-0.1901498, -0.2481391, -1.946894, 1, 1, 1, 1, 1,
-0.1850126, 0.9881059, -0.1354968, 1, 1, 1, 1, 1,
-0.1813601, 1.27766, -0.5693983, 1, 1, 1, 1, 1,
-0.1769835, -1.213056, -3.312633, 1, 1, 1, 1, 1,
-0.1749987, 0.6339122, -0.6668479, 1, 1, 1, 1, 1,
-0.1723806, -0.3329318, -2.797529, 0, 0, 1, 1, 1,
-0.1693044, -0.7142416, -1.619639, 1, 0, 0, 1, 1,
-0.1641601, -0.4966054, -2.197074, 1, 0, 0, 1, 1,
-0.1639273, -0.9903629, -3.380374, 1, 0, 0, 1, 1,
-0.1607369, 1.393205, -0.9153669, 1, 0, 0, 1, 1,
-0.1598292, 0.4830433, 0.3931048, 1, 0, 0, 1, 1,
-0.1595969, -0.4087069, -3.459503, 0, 0, 0, 1, 1,
-0.156256, 1.051903, -1.182781, 0, 0, 0, 1, 1,
-0.1552404, 0.9966885, -0.2346624, 0, 0, 0, 1, 1,
-0.1537144, -1.126059, -1.477322, 0, 0, 0, 1, 1,
-0.1480887, -2.131001, -0.7729157, 0, 0, 0, 1, 1,
-0.143639, -1.009827, -2.464422, 0, 0, 0, 1, 1,
-0.1430681, -0.1209979, -3.764887, 0, 0, 0, 1, 1,
-0.1404252, -0.4667219, -3.071183, 1, 1, 1, 1, 1,
-0.1384029, -0.8713219, -4.074416, 1, 1, 1, 1, 1,
-0.1372996, -0.3031877, -1.694946, 1, 1, 1, 1, 1,
-0.1351863, 0.978814, -1.202951, 1, 1, 1, 1, 1,
-0.1351242, -0.4725505, -2.114468, 1, 1, 1, 1, 1,
-0.1351002, -1.775041, -3.860158, 1, 1, 1, 1, 1,
-0.1336148, -0.2255485, -3.232472, 1, 1, 1, 1, 1,
-0.1316917, -0.05455463, -2.288045, 1, 1, 1, 1, 1,
-0.1283007, -0.07677377, -1.211074, 1, 1, 1, 1, 1,
-0.128052, -0.165227, -2.498791, 1, 1, 1, 1, 1,
-0.1236555, -1.150396, -1.641847, 1, 1, 1, 1, 1,
-0.1218392, -0.07337456, -3.112179, 1, 1, 1, 1, 1,
-0.1098857, -0.1444941, -3.283531, 1, 1, 1, 1, 1,
-0.1098337, 0.6442127, -0.7081818, 1, 1, 1, 1, 1,
-0.1094248, 0.005913069, -1.019827, 1, 1, 1, 1, 1,
-0.1091011, 0.06489183, -0.6793529, 0, 0, 1, 1, 1,
-0.1090079, 1.919016, 0.1044673, 1, 0, 0, 1, 1,
-0.1080282, 0.4238692, 0.3071907, 1, 0, 0, 1, 1,
-0.1024409, 0.8910816, 0.949166, 1, 0, 0, 1, 1,
-0.1023311, 1.720897, 0.8623087, 1, 0, 0, 1, 1,
-0.09963463, 0.7334118, -0.2497783, 1, 0, 0, 1, 1,
-0.09706383, -0.02431756, -2.422357, 0, 0, 0, 1, 1,
-0.09565388, -1.707788, -2.855953, 0, 0, 0, 1, 1,
-0.09215279, -0.3022808, -1.813668, 0, 0, 0, 1, 1,
-0.09147172, -0.04960721, -3.359014, 0, 0, 0, 1, 1,
-0.08826727, 0.01351987, 0.006175078, 0, 0, 0, 1, 1,
-0.08808552, -1.379624, -3.725593, 0, 0, 0, 1, 1,
-0.07751673, 1.329237, 1.586395, 0, 0, 0, 1, 1,
-0.0751064, -1.159431, -2.159233, 1, 1, 1, 1, 1,
-0.07297421, -0.5525222, -4.15619, 1, 1, 1, 1, 1,
-0.07209895, -0.5310057, -3.138508, 1, 1, 1, 1, 1,
-0.07155946, 0.2220741, -1.068464, 1, 1, 1, 1, 1,
-0.06955463, 0.7235897, 0.7660919, 1, 1, 1, 1, 1,
-0.06858277, -1.42022, -1.676722, 1, 1, 1, 1, 1,
-0.0672173, 0.8837015, -1.055616, 1, 1, 1, 1, 1,
-0.05993526, -0.413223, -2.92217, 1, 1, 1, 1, 1,
-0.05955766, 1.235533, 0.6084555, 1, 1, 1, 1, 1,
-0.04951639, 0.6996656, -0.3560592, 1, 1, 1, 1, 1,
-0.04558984, -1.418891, -3.673192, 1, 1, 1, 1, 1,
-0.04143504, 0.04038201, -0.1236599, 1, 1, 1, 1, 1,
-0.03970411, 1.12795, -1.939879, 1, 1, 1, 1, 1,
-0.03560453, -0.4829151, -2.518362, 1, 1, 1, 1, 1,
-0.03559203, 0.5719636, -0.04074858, 1, 1, 1, 1, 1,
-0.03520621, -0.1606613, -2.101915, 0, 0, 1, 1, 1,
-0.03461079, 1.017936, 2.567168, 1, 0, 0, 1, 1,
-0.0335997, -0.1302017, -2.549414, 1, 0, 0, 1, 1,
-0.03235451, -0.03424971, -1.863785, 1, 0, 0, 1, 1,
-0.03126282, 0.003752256, 0.5171794, 1, 0, 0, 1, 1,
-0.02771415, 1.416435, 1.16283, 1, 0, 0, 1, 1,
-0.02730661, -2.060826, -3.697742, 0, 0, 0, 1, 1,
-0.02454056, 0.2104011, 0.7941827, 0, 0, 0, 1, 1,
-0.01967736, 0.43345, 1.017222, 0, 0, 0, 1, 1,
-0.01873205, 1.875729, -2.679011, 0, 0, 0, 1, 1,
-0.01140108, 0.4534851, -1.762103, 0, 0, 0, 1, 1,
-0.01060522, -1.066319, -4.014742, 0, 0, 0, 1, 1,
-0.00640336, 0.2174727, 0.04793941, 0, 0, 0, 1, 1,
-0.005896015, -0.612311, -3.411219, 1, 1, 1, 1, 1,
0.005445206, -1.947608, 3.157588, 1, 1, 1, 1, 1,
0.008161479, 0.7043884, 2.040268, 1, 1, 1, 1, 1,
0.01064616, 0.9952783, -1.24498, 1, 1, 1, 1, 1,
0.01150176, 0.3683632, 0.9703736, 1, 1, 1, 1, 1,
0.01356549, -0.05527743, 2.972697, 1, 1, 1, 1, 1,
0.01470567, 0.5754703, -0.6217187, 1, 1, 1, 1, 1,
0.01897852, 0.6006621, -0.6658157, 1, 1, 1, 1, 1,
0.02414431, -1.453408, 2.535614, 1, 1, 1, 1, 1,
0.02447572, -0.7780209, 3.130001, 1, 1, 1, 1, 1,
0.02475425, -0.08531587, 2.326427, 1, 1, 1, 1, 1,
0.02754687, -0.5842618, 3.495312, 1, 1, 1, 1, 1,
0.02864585, -0.633717, 2.854192, 1, 1, 1, 1, 1,
0.031809, 0.1960308, -1.403744, 1, 1, 1, 1, 1,
0.04095273, -0.6457283, 3.498581, 1, 1, 1, 1, 1,
0.04343716, 0.5101412, 0.5160394, 0, 0, 1, 1, 1,
0.04478198, -0.04063091, 1.620748, 1, 0, 0, 1, 1,
0.04924897, 1.286409, 1.11024, 1, 0, 0, 1, 1,
0.04936976, 1.410681, -0.8348228, 1, 0, 0, 1, 1,
0.05381516, -2.412508, 3.420473, 1, 0, 0, 1, 1,
0.05990859, 1.660499, 0.9336053, 1, 0, 0, 1, 1,
0.06393832, -0.9616899, 2.298985, 0, 0, 0, 1, 1,
0.06510554, 0.104119, -0.04749893, 0, 0, 0, 1, 1,
0.06985221, 1.456233, -0.08258999, 0, 0, 0, 1, 1,
0.0735945, -0.325177, 3.465454, 0, 0, 0, 1, 1,
0.07819278, -0.3528926, 2.464208, 0, 0, 0, 1, 1,
0.086567, 0.752395, 0.3583129, 0, 0, 0, 1, 1,
0.09225481, 0.7593412, -0.1046798, 0, 0, 0, 1, 1,
0.0933516, -2.510094, 3.613268, 1, 1, 1, 1, 1,
0.09339368, 0.7018661, 1.223588, 1, 1, 1, 1, 1,
0.09347908, -0.2093305, 2.554969, 1, 1, 1, 1, 1,
0.09374328, -0.1490544, 0.6142814, 1, 1, 1, 1, 1,
0.09501015, -1.671068, 4.019187, 1, 1, 1, 1, 1,
0.09680242, 0.2150954, 0.4039346, 1, 1, 1, 1, 1,
0.1020624, 0.4229069, -0.09938397, 1, 1, 1, 1, 1,
0.1038141, 0.2733714, 0.5308312, 1, 1, 1, 1, 1,
0.1069079, -0.4311482, 3.859496, 1, 1, 1, 1, 1,
0.1083453, -1.321404, 1.615312, 1, 1, 1, 1, 1,
0.1085368, -0.8125374, 3.223364, 1, 1, 1, 1, 1,
0.108697, -1.82757, 4.190267, 1, 1, 1, 1, 1,
0.1166505, 0.9820173, -0.5222619, 1, 1, 1, 1, 1,
0.1242477, 1.009729, 2.550015, 1, 1, 1, 1, 1,
0.1251688, -2.450567, 3.568622, 1, 1, 1, 1, 1,
0.1264798, 0.8075449, -0.3780319, 0, 0, 1, 1, 1,
0.1278446, 0.4231434, -0.141266, 1, 0, 0, 1, 1,
0.1297712, -0.9455603, 3.943528, 1, 0, 0, 1, 1,
0.1356166, -1.128934, 3.903924, 1, 0, 0, 1, 1,
0.1400352, -0.4850413, 1.417576, 1, 0, 0, 1, 1,
0.1456534, 0.7626888, -0.6275894, 1, 0, 0, 1, 1,
0.1470949, -0.2939411, 1.526345, 0, 0, 0, 1, 1,
0.1510276, -1.520581, 4.629199, 0, 0, 0, 1, 1,
0.1511991, -2.250841, 2.372027, 0, 0, 0, 1, 1,
0.1512688, -0.1871508, 2.382154, 0, 0, 0, 1, 1,
0.1513961, -0.3266733, 4.262477, 0, 0, 0, 1, 1,
0.1542501, -1.17247, 2.916257, 0, 0, 0, 1, 1,
0.1543095, -1.221923, 1.629592, 0, 0, 0, 1, 1,
0.1543233, -0.4177692, 2.725611, 1, 1, 1, 1, 1,
0.1581235, -2.980762, 3.688013, 1, 1, 1, 1, 1,
0.1598901, -2.100263, 2.261066, 1, 1, 1, 1, 1,
0.1626123, 1.303106, -0.9708806, 1, 1, 1, 1, 1,
0.1646544, -1.092146, 4.127521, 1, 1, 1, 1, 1,
0.1720511, -1.27871, 2.997879, 1, 1, 1, 1, 1,
0.1727105, 0.6296934, 0.7458686, 1, 1, 1, 1, 1,
0.1750871, 0.2797378, -1.073699, 1, 1, 1, 1, 1,
0.1765403, 1.54348, -0.2983045, 1, 1, 1, 1, 1,
0.1781434, -0.9176407, 2.987437, 1, 1, 1, 1, 1,
0.1834431, -1.090552, 2.376679, 1, 1, 1, 1, 1,
0.184603, 1.164848, 0.1156331, 1, 1, 1, 1, 1,
0.1854419, -1.002763, 1.831917, 1, 1, 1, 1, 1,
0.1859471, -0.9983109, 1.057885, 1, 1, 1, 1, 1,
0.1878702, -0.5178418, 2.706368, 1, 1, 1, 1, 1,
0.1903711, -0.2322863, 1.611307, 0, 0, 1, 1, 1,
0.1948652, 0.06602849, 1.450069, 1, 0, 0, 1, 1,
0.1948919, 1.8483, -2.009423, 1, 0, 0, 1, 1,
0.1969379, -1.267742, 2.235073, 1, 0, 0, 1, 1,
0.1972135, 1.392748, 0.5066023, 1, 0, 0, 1, 1,
0.2010789, -0.00799529, 0.7634473, 1, 0, 0, 1, 1,
0.2022604, 1.224288, 0.6756474, 0, 0, 0, 1, 1,
0.2079984, 0.9040856, -1.352736, 0, 0, 0, 1, 1,
0.209033, -0.7598071, 2.05004, 0, 0, 0, 1, 1,
0.2102718, -1.14243, 3.385797, 0, 0, 0, 1, 1,
0.2119073, 0.1439699, 0.002240829, 0, 0, 0, 1, 1,
0.2120331, 1.482182, -1.984223, 0, 0, 0, 1, 1,
0.2142197, -1.100407, 1.248145, 0, 0, 0, 1, 1,
0.2210668, 1.327983, 0.8212402, 1, 1, 1, 1, 1,
0.2247881, 0.575834, -1.379695, 1, 1, 1, 1, 1,
0.2271148, -0.9228528, 1.75492, 1, 1, 1, 1, 1,
0.2345988, 0.3520979, -1.386457, 1, 1, 1, 1, 1,
0.2348558, -0.03770299, 3.311502, 1, 1, 1, 1, 1,
0.236119, 0.6270556, -0.8737558, 1, 1, 1, 1, 1,
0.2376941, -0.6523829, 2.129164, 1, 1, 1, 1, 1,
0.2379956, -0.7434287, 1.398489, 1, 1, 1, 1, 1,
0.2390794, -0.9204462, 3.017214, 1, 1, 1, 1, 1,
0.2451923, -0.7984536, 2.711419, 1, 1, 1, 1, 1,
0.2475414, -1.586432, 2.721307, 1, 1, 1, 1, 1,
0.2532795, -0.6992632, 5.196194, 1, 1, 1, 1, 1,
0.2557378, -0.5637239, 2.568257, 1, 1, 1, 1, 1,
0.2637753, -0.8534916, 3.362264, 1, 1, 1, 1, 1,
0.2696129, 1.31964, -0.4001751, 1, 1, 1, 1, 1,
0.2738751, 0.006312503, 2.081214, 0, 0, 1, 1, 1,
0.274523, -1.385845, 1.431537, 1, 0, 0, 1, 1,
0.2768495, -1.136963, 2.242497, 1, 0, 0, 1, 1,
0.2806399, 1.034707, 0.09815761, 1, 0, 0, 1, 1,
0.2838209, -0.6133833, 2.818166, 1, 0, 0, 1, 1,
0.2841568, -0.2628606, 2.914862, 1, 0, 0, 1, 1,
0.2886733, 0.2226558, 0.3139107, 0, 0, 0, 1, 1,
0.2913696, -0.1698348, 2.921474, 0, 0, 0, 1, 1,
0.2914851, 1.233541, -0.1796352, 0, 0, 0, 1, 1,
0.2920248, 1.348462, 1.333446, 0, 0, 0, 1, 1,
0.2939992, -0.2967151, 2.365107, 0, 0, 0, 1, 1,
0.2959474, 2.016312, -0.1759468, 0, 0, 0, 1, 1,
0.297521, 0.9397221, -1.572208, 0, 0, 0, 1, 1,
0.2998859, -0.5478349, 2.54795, 1, 1, 1, 1, 1,
0.3014617, -0.5835249, 1.147579, 1, 1, 1, 1, 1,
0.3024994, 0.4854922, -0.6389933, 1, 1, 1, 1, 1,
0.3025975, -0.7401564, 2.924037, 1, 1, 1, 1, 1,
0.308877, 0.2369681, 1.286676, 1, 1, 1, 1, 1,
0.3136697, 0.09819461, -1.289443, 1, 1, 1, 1, 1,
0.3164147, -0.1126124, 2.006346, 1, 1, 1, 1, 1,
0.3208526, 0.4350992, 0.2085621, 1, 1, 1, 1, 1,
0.3212411, 1.201946, -0.8532763, 1, 1, 1, 1, 1,
0.3241957, 0.8458826, 1.371688, 1, 1, 1, 1, 1,
0.3292423, -0.01155344, 1.548693, 1, 1, 1, 1, 1,
0.3304756, -0.3279815, 2.192524, 1, 1, 1, 1, 1,
0.3307819, -0.08495586, 0.0740381, 1, 1, 1, 1, 1,
0.331017, 1.239439, -0.08405264, 1, 1, 1, 1, 1,
0.3343179, 1.444601, 0.6417618, 1, 1, 1, 1, 1,
0.3354248, 0.5233801, 1.835769, 0, 0, 1, 1, 1,
0.3393042, -0.3910184, 2.715202, 1, 0, 0, 1, 1,
0.3426359, 0.7527243, 1.036996, 1, 0, 0, 1, 1,
0.3450971, -0.1564955, 2.48515, 1, 0, 0, 1, 1,
0.3468547, 0.05256267, 1.667295, 1, 0, 0, 1, 1,
0.3472436, -1.927801, 1.415286, 1, 0, 0, 1, 1,
0.3479911, 0.2233441, 0.3665901, 0, 0, 0, 1, 1,
0.3480312, -0.9061914, 0.9290502, 0, 0, 0, 1, 1,
0.3560921, 0.9013755, 0.01106559, 0, 0, 0, 1, 1,
0.3561383, -0.6641211, 2.456685, 0, 0, 0, 1, 1,
0.3576368, -0.229023, 3.004783, 0, 0, 0, 1, 1,
0.3584016, -0.1270735, 0.5569562, 0, 0, 0, 1, 1,
0.3598469, -0.810455, 3.592985, 0, 0, 0, 1, 1,
0.3651423, 0.5296779, 0.7363793, 1, 1, 1, 1, 1,
0.365384, 1.046273, -0.7276894, 1, 1, 1, 1, 1,
0.3661407, -0.1260885, 1.820129, 1, 1, 1, 1, 1,
0.3675115, -0.2109321, 1.437616, 1, 1, 1, 1, 1,
0.3685907, 1.106634, 0.3539762, 1, 1, 1, 1, 1,
0.3696578, -0.09659921, 0.8477055, 1, 1, 1, 1, 1,
0.3706493, -0.1085691, 3.382543, 1, 1, 1, 1, 1,
0.3714903, -1.366402, 3.19836, 1, 1, 1, 1, 1,
0.375847, -0.7578802, 3.133535, 1, 1, 1, 1, 1,
0.3782383, 1.114092, 0.9530917, 1, 1, 1, 1, 1,
0.3792097, 1.61513, 0.05097608, 1, 1, 1, 1, 1,
0.3806207, -0.03059021, 0.9237752, 1, 1, 1, 1, 1,
0.3821486, 1.248589, -0.289541, 1, 1, 1, 1, 1,
0.3862892, -0.3047847, 2.418898, 1, 1, 1, 1, 1,
0.3896205, -0.3661474, 2.36023, 1, 1, 1, 1, 1,
0.3913385, -0.8087139, 4.366516, 0, 0, 1, 1, 1,
0.3972761, 2.581968, 0.4716916, 1, 0, 0, 1, 1,
0.3974735, 1.620489, 0.02602928, 1, 0, 0, 1, 1,
0.3998284, 0.7509462, 0.2072536, 1, 0, 0, 1, 1,
0.4024759, -0.7439931, 2.490455, 1, 0, 0, 1, 1,
0.4076253, -1.164892, 1.362749, 1, 0, 0, 1, 1,
0.4083641, -1.674116, 2.036788, 0, 0, 0, 1, 1,
0.4085974, -1.35055, 3.728795, 0, 0, 0, 1, 1,
0.4105083, 0.9367039, 0.680295, 0, 0, 0, 1, 1,
0.4124022, 3.097506, 1.653399, 0, 0, 0, 1, 1,
0.4162704, 0.9623589, -0.5697948, 0, 0, 0, 1, 1,
0.4265659, 0.8965541, 1.44448, 0, 0, 0, 1, 1,
0.4268281, -1.729394, 0.6900067, 0, 0, 0, 1, 1,
0.4303484, 1.200698, 1.172114, 1, 1, 1, 1, 1,
0.4317159, -0.8662301, 1.645542, 1, 1, 1, 1, 1,
0.432045, 2.664325, 0.6245863, 1, 1, 1, 1, 1,
0.4326015, 0.6849164, 0.2716505, 1, 1, 1, 1, 1,
0.4367957, -0.3574908, 1.095137, 1, 1, 1, 1, 1,
0.4448105, -0.2127041, 2.046852, 1, 1, 1, 1, 1,
0.450415, 0.5046999, 1.125702, 1, 1, 1, 1, 1,
0.4505816, -0.589438, 2.049849, 1, 1, 1, 1, 1,
0.4512702, 0.7351628, 1.964435, 1, 1, 1, 1, 1,
0.4522195, 0.5332494, 1.635038, 1, 1, 1, 1, 1,
0.4535099, 0.2668947, 1.136736, 1, 1, 1, 1, 1,
0.4560784, 1.201759, -0.07418879, 1, 1, 1, 1, 1,
0.4563495, -1.170557, 4.661963, 1, 1, 1, 1, 1,
0.4568288, -0.8200946, 3.552211, 1, 1, 1, 1, 1,
0.4585268, -0.2321207, 3.723896, 1, 1, 1, 1, 1,
0.4643661, 0.7007793, 0.6744069, 0, 0, 1, 1, 1,
0.4655408, 0.4803872, 0.460712, 1, 0, 0, 1, 1,
0.4661607, 1.111753, -1.535006, 1, 0, 0, 1, 1,
0.4672148, 0.2747796, 0.9422246, 1, 0, 0, 1, 1,
0.4692784, -1.521688, 3.902273, 1, 0, 0, 1, 1,
0.472567, 0.4874519, 1.64084, 1, 0, 0, 1, 1,
0.4746291, -0.2503968, 2.082357, 0, 0, 0, 1, 1,
0.4764042, 1.395847, 1.195051, 0, 0, 0, 1, 1,
0.4818022, 0.4638192, 0.1021776, 0, 0, 0, 1, 1,
0.4829055, 0.8729843, 0.705667, 0, 0, 0, 1, 1,
0.4845546, -0.2765624, 3.258919, 0, 0, 0, 1, 1,
0.4878602, 0.7849314, 0.4502015, 0, 0, 0, 1, 1,
0.4933878, -0.7884859, 1.296262, 0, 0, 0, 1, 1,
0.5000826, -0.5397006, 3.623857, 1, 1, 1, 1, 1,
0.5073044, -0.7731966, 3.025941, 1, 1, 1, 1, 1,
0.511301, 1.230672, 1.74492, 1, 1, 1, 1, 1,
0.5125141, -1.826714, 2.278583, 1, 1, 1, 1, 1,
0.5135217, 0.6986849, 2.288418, 1, 1, 1, 1, 1,
0.5180387, 1.648809, 0.5604926, 1, 1, 1, 1, 1,
0.5280883, 0.9273973, 0.6741763, 1, 1, 1, 1, 1,
0.5323631, -0.8212897, 4.312061, 1, 1, 1, 1, 1,
0.5344793, 0.9177703, 1.661716, 1, 1, 1, 1, 1,
0.5356653, 0.4653828, 0.1447657, 1, 1, 1, 1, 1,
0.5371378, 0.2738039, 2.68752, 1, 1, 1, 1, 1,
0.5377232, -0.2714229, 0.590135, 1, 1, 1, 1, 1,
0.5481582, 1.780385, 0.07635793, 1, 1, 1, 1, 1,
0.5492328, 0.1372366, 1.989927, 1, 1, 1, 1, 1,
0.5511007, 2.153151, -0.06723733, 1, 1, 1, 1, 1,
0.5519898, 0.3928404, 1.525268, 0, 0, 1, 1, 1,
0.5549943, -0.9285166, 2.551479, 1, 0, 0, 1, 1,
0.555155, 1.266153, 0.6193587, 1, 0, 0, 1, 1,
0.5556473, -0.3259342, 2.454664, 1, 0, 0, 1, 1,
0.5577933, 0.3436817, 1.977126, 1, 0, 0, 1, 1,
0.5580501, -0.4301891, 1.690899, 1, 0, 0, 1, 1,
0.5590862, 0.773567, 1.481182, 0, 0, 0, 1, 1,
0.5609161, -0.1879077, 0.5535642, 0, 0, 0, 1, 1,
0.5617801, -0.6179765, 3.142882, 0, 0, 0, 1, 1,
0.5677753, 1.701375, 0.1842227, 0, 0, 0, 1, 1,
0.5717141, 0.795894, 0.2491881, 0, 0, 0, 1, 1,
0.5718571, -0.8006275, 2.460596, 0, 0, 0, 1, 1,
0.5718694, -0.6100075, 2.972541, 0, 0, 0, 1, 1,
0.5759646, 0.3789667, 0.2364828, 1, 1, 1, 1, 1,
0.5766281, -0.3604122, 2.026009, 1, 1, 1, 1, 1,
0.5810885, -1.408165, 2.451021, 1, 1, 1, 1, 1,
0.5911227, -1.246691, 3.206526, 1, 1, 1, 1, 1,
0.596238, -1.435001, 0.8658184, 1, 1, 1, 1, 1,
0.5975138, 0.2540814, 1.804881, 1, 1, 1, 1, 1,
0.5987641, 0.7183912, 0.4768643, 1, 1, 1, 1, 1,
0.6004362, 0.03712447, 2.242862, 1, 1, 1, 1, 1,
0.6085253, 0.7868796, 1.466959, 1, 1, 1, 1, 1,
0.6132852, -0.8708276, 2.317472, 1, 1, 1, 1, 1,
0.6176115, 0.146591, -0.1448369, 1, 1, 1, 1, 1,
0.6189786, 1.621379, -0.4406308, 1, 1, 1, 1, 1,
0.6204617, -0.7166976, 1.35353, 1, 1, 1, 1, 1,
0.6228848, -0.4898308, 3.822304, 1, 1, 1, 1, 1,
0.6242778, 0.1456691, 1.791771, 1, 1, 1, 1, 1,
0.6254414, 0.3128483, 0.7972527, 0, 0, 1, 1, 1,
0.6275554, -0.5028368, 2.13756, 1, 0, 0, 1, 1,
0.6294448, -1.606602, 0.7994462, 1, 0, 0, 1, 1,
0.6392954, 0.4618534, 2.021977, 1, 0, 0, 1, 1,
0.6436775, 1.706622, -0.2897671, 1, 0, 0, 1, 1,
0.6539447, 0.1083068, 3.213806, 1, 0, 0, 1, 1,
0.6580092, -0.9553688, 2.627662, 0, 0, 0, 1, 1,
0.6630747, 0.823293, 2.082727, 0, 0, 0, 1, 1,
0.6663959, -0.5283684, 0.1071627, 0, 0, 0, 1, 1,
0.6683465, -1.217303, 1.894479, 0, 0, 0, 1, 1,
0.6689751, -0.9716103, 3.418477, 0, 0, 0, 1, 1,
0.6714776, -0.5791488, 2.279783, 0, 0, 0, 1, 1,
0.6722934, 0.05780603, 1.276678, 0, 0, 0, 1, 1,
0.6765128, -0.6318917, 3.182805, 1, 1, 1, 1, 1,
0.6765744, -0.536311, 2.839474, 1, 1, 1, 1, 1,
0.6843697, 0.7249739, -0.9713418, 1, 1, 1, 1, 1,
0.6865533, 0.8847578, -0.09658524, 1, 1, 1, 1, 1,
0.6891013, 0.0607225, 0.008885759, 1, 1, 1, 1, 1,
0.6930621, 0.4172296, 1.486616, 1, 1, 1, 1, 1,
0.6942775, 0.6041819, -0.4579885, 1, 1, 1, 1, 1,
0.6965464, -2.234838, 3.496703, 1, 1, 1, 1, 1,
0.7014738, 0.2508684, 1.400123, 1, 1, 1, 1, 1,
0.7029733, -0.01465678, 0.8033254, 1, 1, 1, 1, 1,
0.7034094, 0.6081489, 0.1320132, 1, 1, 1, 1, 1,
0.7048986, 0.3572114, 3.57477, 1, 1, 1, 1, 1,
0.7124183, 0.01185688, 1.518146, 1, 1, 1, 1, 1,
0.7126262, -0.5413473, 4.168785, 1, 1, 1, 1, 1,
0.7162926, 0.3602774, 1.908459, 1, 1, 1, 1, 1,
0.7202948, -0.9362155, 2.765721, 0, 0, 1, 1, 1,
0.721324, 0.4886119, -0.5465977, 1, 0, 0, 1, 1,
0.7236342, 0.3368822, 0.4532298, 1, 0, 0, 1, 1,
0.7273723, -0.7811618, 1.93756, 1, 0, 0, 1, 1,
0.7288731, 0.3229857, 1.561455, 1, 0, 0, 1, 1,
0.73454, -0.7376226, 0.514574, 1, 0, 0, 1, 1,
0.7386709, -1.408572, 1.908171, 0, 0, 0, 1, 1,
0.7415549, 0.482466, 0.4495275, 0, 0, 0, 1, 1,
0.7486728, -0.09462605, 2.473482, 0, 0, 0, 1, 1,
0.7499928, 0.8677337, 1.153056, 0, 0, 0, 1, 1,
0.7514237, -0.4829684, 3.941618, 0, 0, 0, 1, 1,
0.7515229, -1.012702, 2.855109, 0, 0, 0, 1, 1,
0.761968, 0.551904, 1.087553, 0, 0, 0, 1, 1,
0.7655565, -2.617144, 3.425083, 1, 1, 1, 1, 1,
0.7656578, -0.3901899, 2.837126, 1, 1, 1, 1, 1,
0.7658024, -1.117252, 1.693666, 1, 1, 1, 1, 1,
0.7662374, 0.2890752, -0.1574141, 1, 1, 1, 1, 1,
0.7665558, 0.3437515, 0.3531465, 1, 1, 1, 1, 1,
0.7674243, 0.4851819, 1.357731, 1, 1, 1, 1, 1,
0.769553, -1.503623, 0.8673981, 1, 1, 1, 1, 1,
0.769951, -0.1926503, 1.841715, 1, 1, 1, 1, 1,
0.7712164, -0.7918451, 4.01446, 1, 1, 1, 1, 1,
0.7742441, 0.6681194, 0.9043723, 1, 1, 1, 1, 1,
0.7745035, 1.294496, -0.8386764, 1, 1, 1, 1, 1,
0.776437, 1.015671, 1.685654, 1, 1, 1, 1, 1,
0.7778316, 0.0817927, 2.14187, 1, 1, 1, 1, 1,
0.7827106, 1.044373, -0.1720816, 1, 1, 1, 1, 1,
0.7863908, -0.654246, 2.506403, 1, 1, 1, 1, 1,
0.7865964, 1.564797, 0.2042678, 0, 0, 1, 1, 1,
0.7909174, -0.3753503, 1.160031, 1, 0, 0, 1, 1,
0.7909244, 1.099869, 0.3915528, 1, 0, 0, 1, 1,
0.7916275, 1.959601, 0.5425863, 1, 0, 0, 1, 1,
0.7922819, -0.8049538, 2.204091, 1, 0, 0, 1, 1,
0.7923604, -0.3816677, 2.192221, 1, 0, 0, 1, 1,
0.7947296, 2.214879, -0.142243, 0, 0, 0, 1, 1,
0.7977278, -0.9146846, 2.553212, 0, 0, 0, 1, 1,
0.7989036, 0.3824859, 1.243717, 0, 0, 0, 1, 1,
0.8000956, -0.1867765, 2.076027, 0, 0, 0, 1, 1,
0.8024513, -0.7705033, 4.154773, 0, 0, 0, 1, 1,
0.8078016, -0.2169246, -0.4747581, 0, 0, 0, 1, 1,
0.8091121, -0.7424079, 2.184377, 0, 0, 0, 1, 1,
0.8095522, 1.280779, 0.2352854, 1, 1, 1, 1, 1,
0.8112118, 0.2288107, 0.9627234, 1, 1, 1, 1, 1,
0.8198347, 0.4960238, 0.8575336, 1, 1, 1, 1, 1,
0.8227184, -1.180528, 2.680147, 1, 1, 1, 1, 1,
0.8261849, 0.3304677, 1.429616, 1, 1, 1, 1, 1,
0.8335917, 1.023924, 0.2619191, 1, 1, 1, 1, 1,
0.8336449, 2.580033, 0.7099333, 1, 1, 1, 1, 1,
0.8401558, 0.3485538, 1.461082, 1, 1, 1, 1, 1,
0.8438678, -0.403896, 1.692827, 1, 1, 1, 1, 1,
0.8456283, 0.8909094, 1.68111, 1, 1, 1, 1, 1,
0.8458208, 0.04822617, 1.915672, 1, 1, 1, 1, 1,
0.850305, -0.0608211, 0.3026983, 1, 1, 1, 1, 1,
0.8504372, -1.45928, 4.322801, 1, 1, 1, 1, 1,
0.8545389, -0.3679883, 2.937269, 1, 1, 1, 1, 1,
0.8576268, 0.6551062, 1.199132, 1, 1, 1, 1, 1,
0.859102, -1.278942, 4.058671, 0, 0, 1, 1, 1,
0.8663909, 0.5215617, 1.749511, 1, 0, 0, 1, 1,
0.8667808, -1.149418, 2.845194, 1, 0, 0, 1, 1,
0.8733679, 0.03387797, 1.385835, 1, 0, 0, 1, 1,
0.8888324, -0.04663397, 0.1472417, 1, 0, 0, 1, 1,
0.8919061, -1.677399, 2.654671, 1, 0, 0, 1, 1,
0.8982769, 0.4334288, 0.990167, 0, 0, 0, 1, 1,
0.8998308, -0.6407469, 0.2027899, 0, 0, 0, 1, 1,
0.9018646, -2.230798, 2.532245, 0, 0, 0, 1, 1,
0.905728, 0.03615374, 0.05487083, 0, 0, 0, 1, 1,
0.9065353, 0.3860399, 0.788449, 0, 0, 0, 1, 1,
0.9136797, -0.4641761, 1.597978, 0, 0, 0, 1, 1,
0.9139402, 0.6004642, -0.1205418, 0, 0, 0, 1, 1,
0.9153957, -0.1987089, -0.1310524, 1, 1, 1, 1, 1,
0.917898, 0.1029917, 2.579806, 1, 1, 1, 1, 1,
0.9184743, 0.9463021, -0.3810862, 1, 1, 1, 1, 1,
0.9229792, -0.4463425, 1.86253, 1, 1, 1, 1, 1,
0.9247432, 0.02437755, 1.558251, 1, 1, 1, 1, 1,
0.9273182, -1.037874, 2.495994, 1, 1, 1, 1, 1,
0.9329318, -0.001843552, 1.612866, 1, 1, 1, 1, 1,
0.9361445, 0.135153, 0.376933, 1, 1, 1, 1, 1,
0.9412097, 0.2759625, 1.753025, 1, 1, 1, 1, 1,
0.9470062, 0.5638909, 3.640578, 1, 1, 1, 1, 1,
0.9530477, 2.878513, 0.7129473, 1, 1, 1, 1, 1,
0.9614794, 1.756455, -0.553373, 1, 1, 1, 1, 1,
0.9659967, -0.1311321, 0.9523035, 1, 1, 1, 1, 1,
0.9670996, -0.3034066, -0.4212381, 1, 1, 1, 1, 1,
0.9677222, 1.732518, 0.2954424, 1, 1, 1, 1, 1,
0.9702382, 1.506454, 3.027108, 0, 0, 1, 1, 1,
0.9779277, 0.9554491, 1.523443, 1, 0, 0, 1, 1,
0.9784684, -1.19227, 2.59328, 1, 0, 0, 1, 1,
0.9792485, -0.6468081, 2.200776, 1, 0, 0, 1, 1,
0.9870395, -0.7231486, 2.801358, 1, 0, 0, 1, 1,
0.9952275, -0.1839489, 2.117918, 1, 0, 0, 1, 1,
0.9969161, -0.2329458, 0.1215844, 0, 0, 0, 1, 1,
1.003699, -0.3464144, 1.801932, 0, 0, 0, 1, 1,
1.005119, -0.005802031, 2.352542, 0, 0, 0, 1, 1,
1.010884, 0.5849409, 0.9986649, 0, 0, 0, 1, 1,
1.011086, -1.938588, 3.19114, 0, 0, 0, 1, 1,
1.024324, -2.028731, 2.014611, 0, 0, 0, 1, 1,
1.028186, 0.09976804, 0.03251702, 0, 0, 0, 1, 1,
1.029271, 0.09635185, 0.1477293, 1, 1, 1, 1, 1,
1.030824, -1.624, 1.020538, 1, 1, 1, 1, 1,
1.041313, -0.4522276, 2.338892, 1, 1, 1, 1, 1,
1.047006, 0.428205, 2.607387, 1, 1, 1, 1, 1,
1.04972, -0.05196925, 2.187185, 1, 1, 1, 1, 1,
1.051849, -1.408458, 0.9096456, 1, 1, 1, 1, 1,
1.051874, 0.599346, -0.6506135, 1, 1, 1, 1, 1,
1.054552, -1.128714, 1.663494, 1, 1, 1, 1, 1,
1.060737, -2.063662, 2.581047, 1, 1, 1, 1, 1,
1.066504, 1.847779, 0.242672, 1, 1, 1, 1, 1,
1.074914, -0.2425538, 2.163117, 1, 1, 1, 1, 1,
1.078127, 1.616261, -0.8140779, 1, 1, 1, 1, 1,
1.080205, 0.1795399, 1.376406, 1, 1, 1, 1, 1,
1.081234, 0.8863826, 1.788279, 1, 1, 1, 1, 1,
1.084537, 0.4407324, 0.2975425, 1, 1, 1, 1, 1,
1.091478, 1.812859, 1.182379, 0, 0, 1, 1, 1,
1.091946, 0.8780333, 0.7216012, 1, 0, 0, 1, 1,
1.097009, -1.217261, 1.837672, 1, 0, 0, 1, 1,
1.098053, -0.477903, 1.304591, 1, 0, 0, 1, 1,
1.099803, -0.5202651, 2.847116, 1, 0, 0, 1, 1,
1.099956, 1.005055, 2.823703, 1, 0, 0, 1, 1,
1.106193, -0.01864656, 1.110749, 0, 0, 0, 1, 1,
1.113577, 0.9519107, 1.075974, 0, 0, 0, 1, 1,
1.118747, -2.17593, 2.597345, 0, 0, 0, 1, 1,
1.119137, 0.2892976, 0.7164885, 0, 0, 0, 1, 1,
1.119362, 2.23722, 0.3953212, 0, 0, 0, 1, 1,
1.120104, 1.615993, -0.8876908, 0, 0, 0, 1, 1,
1.12081, -0.3747275, 1.759515, 0, 0, 0, 1, 1,
1.121414, 2.219719, 1.186998, 1, 1, 1, 1, 1,
1.130781, -0.3820058, 0.7296759, 1, 1, 1, 1, 1,
1.139377, 1.095618, 1.008546, 1, 1, 1, 1, 1,
1.142436, 0.8644309, 0.2526295, 1, 1, 1, 1, 1,
1.144918, 0.1041098, 0.8848662, 1, 1, 1, 1, 1,
1.153581, -0.2329721, 3.055569, 1, 1, 1, 1, 1,
1.159073, 0.9671624, 1.329721, 1, 1, 1, 1, 1,
1.166412, -0.3198856, 1.08789, 1, 1, 1, 1, 1,
1.171425, -0.3475722, 2.240381, 1, 1, 1, 1, 1,
1.171571, 0.7156626, -0.2650361, 1, 1, 1, 1, 1,
1.175238, 1.237862, 0.6932402, 1, 1, 1, 1, 1,
1.176058, 1.474347, 1.743185, 1, 1, 1, 1, 1,
1.183147, 0.3972856, 1.640227, 1, 1, 1, 1, 1,
1.189719, -0.2149342, 3.06164, 1, 1, 1, 1, 1,
1.194121, -0.159792, 1.200155, 1, 1, 1, 1, 1,
1.195375, 0.3946785, 1.350211, 0, 0, 1, 1, 1,
1.198295, 1.14033, 0.8629159, 1, 0, 0, 1, 1,
1.203937, 1.000535, 1.852022, 1, 0, 0, 1, 1,
1.205538, -0.5954288, 4.354016, 1, 0, 0, 1, 1,
1.206079, 2.303598, 1.320823, 1, 0, 0, 1, 1,
1.208671, 1.197275, 2.855928, 1, 0, 0, 1, 1,
1.214328, -0.4170515, 1.455828, 0, 0, 0, 1, 1,
1.228285, -0.7003585, -0.03329083, 0, 0, 0, 1, 1,
1.230113, -1.773071, 3.703553, 0, 0, 0, 1, 1,
1.232763, 0.5785503, 1.47104, 0, 0, 0, 1, 1,
1.233753, -1.127566, 2.581583, 0, 0, 0, 1, 1,
1.237884, 2.122456, 0.294588, 0, 0, 0, 1, 1,
1.251502, -0.8818046, 1.47363, 0, 0, 0, 1, 1,
1.26246, -1.081436, 2.037333, 1, 1, 1, 1, 1,
1.263268, 2.883886, 0.4943648, 1, 1, 1, 1, 1,
1.263772, 0.6626871, 1.775884, 1, 1, 1, 1, 1,
1.268892, 0.5355326, 2.138585, 1, 1, 1, 1, 1,
1.275486, -1.024434, 1.025751, 1, 1, 1, 1, 1,
1.280591, -0.1634456, 0.5906609, 1, 1, 1, 1, 1,
1.28398, 0.1548897, 1.309214, 1, 1, 1, 1, 1,
1.294361, -0.5013642, 1.303343, 1, 1, 1, 1, 1,
1.294743, 0.6224827, 0.9197144, 1, 1, 1, 1, 1,
1.296515, -0.8142321, 1.796151, 1, 1, 1, 1, 1,
1.29743, 0.1234307, -0.01307073, 1, 1, 1, 1, 1,
1.311722, 0.01357738, 0.5385915, 1, 1, 1, 1, 1,
1.314213, 1.400716, 1.155975, 1, 1, 1, 1, 1,
1.318258, 0.4478265, 0.1173079, 1, 1, 1, 1, 1,
1.326179, 1.459716, 0.9129247, 1, 1, 1, 1, 1,
1.330145, 0.4170977, 0.4812096, 0, 0, 1, 1, 1,
1.341249, -1.254418, 2.334021, 1, 0, 0, 1, 1,
1.350009, 1.202997, -0.1683652, 1, 0, 0, 1, 1,
1.360721, -0.07640887, -0.2332395, 1, 0, 0, 1, 1,
1.364746, -1.249587, 0.9760695, 1, 0, 0, 1, 1,
1.367325, 0.3430836, 1.076118, 1, 0, 0, 1, 1,
1.372736, -0.1359966, 3.464607, 0, 0, 0, 1, 1,
1.376835, 0.4782002, 1.765779, 0, 0, 0, 1, 1,
1.385175, -0.6697149, 0.6608468, 0, 0, 0, 1, 1,
1.390213, -0.8897294, 4.065821, 0, 0, 0, 1, 1,
1.390841, 0.4658462, 0.1832949, 0, 0, 0, 1, 1,
1.395898, 1.181813, -1.059672, 0, 0, 0, 1, 1,
1.398323, 0.3291065, 1.688524, 0, 0, 0, 1, 1,
1.398637, 0.04417859, 1.840847, 1, 1, 1, 1, 1,
1.399371, 0.8487561, 0.8335409, 1, 1, 1, 1, 1,
1.404938, -1.05135, 2.20656, 1, 1, 1, 1, 1,
1.423765, -0.8112981, 1.316138, 1, 1, 1, 1, 1,
1.429779, 0.7373253, 2.532003, 1, 1, 1, 1, 1,
1.434132, 1.163673, 0.5992938, 1, 1, 1, 1, 1,
1.443212, 1.209796, 2.34907, 1, 1, 1, 1, 1,
1.443364, 0.9622859, -0.07433677, 1, 1, 1, 1, 1,
1.453368, 0.4509127, 1.660669, 1, 1, 1, 1, 1,
1.454089, 1.194883, -0.8946831, 1, 1, 1, 1, 1,
1.45996, -0.342167, 0.7416532, 1, 1, 1, 1, 1,
1.465693, -0.2896201, 2.228577, 1, 1, 1, 1, 1,
1.471569, 1.332446, 3.101948, 1, 1, 1, 1, 1,
1.47597, -0.03314043, 2.932612, 1, 1, 1, 1, 1,
1.485998, 0.4608098, 0.7084562, 1, 1, 1, 1, 1,
1.486926, -2.318739, 3.883144, 0, 0, 1, 1, 1,
1.493698, 0.9810838, 0.7752907, 1, 0, 0, 1, 1,
1.500164, 2.913775, 1.388447, 1, 0, 0, 1, 1,
1.507944, 1.969126, -0.123129, 1, 0, 0, 1, 1,
1.525132, -1.293967, 4.09283, 1, 0, 0, 1, 1,
1.560934, -0.9211497, 1.517986, 1, 0, 0, 1, 1,
1.578263, 2.547179, 0.02657308, 0, 0, 0, 1, 1,
1.582023, -1.636157, 0.5848882, 0, 0, 0, 1, 1,
1.59298, -0.2627098, 0.9459951, 0, 0, 0, 1, 1,
1.60594, 0.8374221, 2.934846, 0, 0, 0, 1, 1,
1.610672, 0.05697981, 1.434128, 0, 0, 0, 1, 1,
1.615149, -0.1416398, 1.920412, 0, 0, 0, 1, 1,
1.622697, 1.745415, 0.7012079, 0, 0, 0, 1, 1,
1.624371, -0.3948609, 1.024604, 1, 1, 1, 1, 1,
1.638345, -1.422143, 1.274852, 1, 1, 1, 1, 1,
1.695746, -0.3828547, 2.543192, 1, 1, 1, 1, 1,
1.732867, -0.2716286, 2.520178, 1, 1, 1, 1, 1,
1.734619, -1.067972, 2.582827, 1, 1, 1, 1, 1,
1.745362, 1.181669, 0.9402528, 1, 1, 1, 1, 1,
1.770945, -1.532618, 3.214505, 1, 1, 1, 1, 1,
1.780774, -0.2785947, 1.614024, 1, 1, 1, 1, 1,
1.791775, -0.4534436, 1.524931, 1, 1, 1, 1, 1,
1.80295, -0.2362727, 1.398571, 1, 1, 1, 1, 1,
1.808433, 0.4043651, 1.700689, 1, 1, 1, 1, 1,
1.858548, 0.8888195, 2.899177, 1, 1, 1, 1, 1,
1.860751, 0.3470929, 0.3602602, 1, 1, 1, 1, 1,
1.917088, 1.774084, 1.438702, 1, 1, 1, 1, 1,
1.963218, -0.7916305, 2.043666, 1, 1, 1, 1, 1,
1.974538, -1.5511, 1.483088, 0, 0, 1, 1, 1,
2.051755, 0.5382482, 1.00728, 1, 0, 0, 1, 1,
2.072937, -0.2033453, 1.108542, 1, 0, 0, 1, 1,
2.092536, 0.268769, -0.119262, 1, 0, 0, 1, 1,
2.137753, 2.365945, 0.8628894, 1, 0, 0, 1, 1,
2.138423, 0.178047, 0.4880774, 1, 0, 0, 1, 1,
2.220334, -1.006728, 2.413368, 0, 0, 0, 1, 1,
2.408947, 0.2947024, 1.782865, 0, 0, 0, 1, 1,
2.474194, -0.7812434, 2.702427, 0, 0, 0, 1, 1,
2.484753, -0.56932, 1.829895, 0, 0, 0, 1, 1,
2.488611, 0.3174852, 2.548378, 0, 0, 0, 1, 1,
2.583821, -1.082569, 1.270463, 0, 0, 0, 1, 1,
2.622763, -0.169575, 0.6347308, 0, 0, 0, 1, 1,
2.664695, 0.9446841, 0.6894364, 1, 1, 1, 1, 1,
2.666306, -0.6057859, 0.3923597, 1, 1, 1, 1, 1,
2.687066, 0.551295, 3.133936, 1, 1, 1, 1, 1,
2.708458, 1.471886, 1.753273, 1, 1, 1, 1, 1,
2.724304, 0.1099164, 0.4549293, 1, 1, 1, 1, 1,
2.91117, 1.188096, 2.73192, 1, 1, 1, 1, 1,
3.138395, -0.07231838, 3.001351, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.621904;
var distance = 33.79653;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.05084014, -0.2248712, 0.2033699 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.79653);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>