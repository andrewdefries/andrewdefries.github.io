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
-2.917634, 0.4663704, -1.782115, 1, 0, 0, 1,
-2.891616, 0.4991292, -1.380218, 1, 0.007843138, 0, 1,
-2.832697, -0.5747988, -2.650269, 1, 0.01176471, 0, 1,
-2.664755, 0.1431063, -0.4960993, 1, 0.01960784, 0, 1,
-2.631475, -1.086805, -0.801398, 1, 0.02352941, 0, 1,
-2.469825, -0.2644236, -0.4225282, 1, 0.03137255, 0, 1,
-2.466922, 0.03895367, -1.898528, 1, 0.03529412, 0, 1,
-2.401813, -0.9333928, 0.1411881, 1, 0.04313726, 0, 1,
-2.399569, -2.32477, -2.071282, 1, 0.04705882, 0, 1,
-2.363736, 0.8608925, -2.000052, 1, 0.05490196, 0, 1,
-2.311471, -0.4667371, -1.564961, 1, 0.05882353, 0, 1,
-2.283972, 0.3095544, -2.790706, 1, 0.06666667, 0, 1,
-2.282194, 0.5120017, -2.87498, 1, 0.07058824, 0, 1,
-2.258503, 0.0441029, -0.659615, 1, 0.07843138, 0, 1,
-2.109963, 1.101015, -2.033094, 1, 0.08235294, 0, 1,
-2.065713, 1.048682, -2.060578, 1, 0.09019608, 0, 1,
-2.049203, 2.410477, -1.079262, 1, 0.09411765, 0, 1,
-2.044309, 1.087638, 0.6572966, 1, 0.1019608, 0, 1,
-2.027931, -0.7098852, -2.54355, 1, 0.1098039, 0, 1,
-2.017004, 1.219326, -1.693809, 1, 0.1137255, 0, 1,
-1.992863, 1.375916, -0.3929782, 1, 0.1215686, 0, 1,
-1.93906, 0.3787329, -2.105607, 1, 0.1254902, 0, 1,
-1.937672, -1.476152, -1.121178, 1, 0.1333333, 0, 1,
-1.932475, -0.4816377, -2.590439, 1, 0.1372549, 0, 1,
-1.929076, 0.8909513, -0.6319443, 1, 0.145098, 0, 1,
-1.918002, -0.4536008, -0.03954826, 1, 0.1490196, 0, 1,
-1.912805, 0.3611237, -1.017904, 1, 0.1568628, 0, 1,
-1.903534, 2.380798, -1.242487, 1, 0.1607843, 0, 1,
-1.864558, 1.592498, -2.494316, 1, 0.1686275, 0, 1,
-1.848913, 0.152861, -1.556195, 1, 0.172549, 0, 1,
-1.843896, -0.1981656, -1.046151, 1, 0.1803922, 0, 1,
-1.813161, -0.2467907, -1.988731, 1, 0.1843137, 0, 1,
-1.812139, -0.08765729, -2.174212, 1, 0.1921569, 0, 1,
-1.801062, 1.736347, -0.9248772, 1, 0.1960784, 0, 1,
-1.791775, 0.5360115, -1.376494, 1, 0.2039216, 0, 1,
-1.788231, -1.128394, -2.010167, 1, 0.2117647, 0, 1,
-1.782689, 0.6538082, -1.597932, 1, 0.2156863, 0, 1,
-1.763601, 0.6355727, -0.7498545, 1, 0.2235294, 0, 1,
-1.759043, -1.276193, -1.149961, 1, 0.227451, 0, 1,
-1.752071, -0.485009, -2.730699, 1, 0.2352941, 0, 1,
-1.744135, -0.8562787, -2.387609, 1, 0.2392157, 0, 1,
-1.722887, 0.6270307, -1.428142, 1, 0.2470588, 0, 1,
-1.721254, 2.132049, -0.1486668, 1, 0.2509804, 0, 1,
-1.720114, -0.4345718, -2.215209, 1, 0.2588235, 0, 1,
-1.718678, -0.6804572, -0.9719829, 1, 0.2627451, 0, 1,
-1.697721, 0.6555735, 0.386815, 1, 0.2705882, 0, 1,
-1.690492, 0.05489995, -0.4513976, 1, 0.2745098, 0, 1,
-1.690489, 1.557957, -0.3848096, 1, 0.282353, 0, 1,
-1.670388, -1.976808, -0.6577492, 1, 0.2862745, 0, 1,
-1.664658, -1.157734, -1.513911, 1, 0.2941177, 0, 1,
-1.661656, 0.1203604, -0.4204256, 1, 0.3019608, 0, 1,
-1.64193, 1.849865, 0.2226972, 1, 0.3058824, 0, 1,
-1.630822, 0.9796781, -1.061291, 1, 0.3137255, 0, 1,
-1.625178, 0.04088107, -1.237669, 1, 0.3176471, 0, 1,
-1.589907, 0.2036583, -1.059389, 1, 0.3254902, 0, 1,
-1.588535, 1.112584, -2.878981, 1, 0.3294118, 0, 1,
-1.582633, -2.210274, -3.2141, 1, 0.3372549, 0, 1,
-1.581507, 0.9943066, -1.729332, 1, 0.3411765, 0, 1,
-1.577342, 0.7130472, 0.08729748, 1, 0.3490196, 0, 1,
-1.570558, -1.479238, -2.514584, 1, 0.3529412, 0, 1,
-1.564143, -0.7716874, -1.745729, 1, 0.3607843, 0, 1,
-1.560044, 1.8671, -0.6949687, 1, 0.3647059, 0, 1,
-1.55823, 0.2308409, -1.57007, 1, 0.372549, 0, 1,
-1.556975, 1.299107, -1.741016, 1, 0.3764706, 0, 1,
-1.549381, -0.3644732, -1.366422, 1, 0.3843137, 0, 1,
-1.538891, 1.178392, -0.1388485, 1, 0.3882353, 0, 1,
-1.528815, 0.9801778, -0.9201202, 1, 0.3960784, 0, 1,
-1.522829, 1.06315, -1.10266, 1, 0.4039216, 0, 1,
-1.519084, 1.259574, -0.1693474, 1, 0.4078431, 0, 1,
-1.502989, 0.497149, -1.207966, 1, 0.4156863, 0, 1,
-1.487577, -0.5598197, -1.19854, 1, 0.4196078, 0, 1,
-1.487028, -1.48785, -3.984851, 1, 0.427451, 0, 1,
-1.474249, 1.517569, -1.151573, 1, 0.4313726, 0, 1,
-1.470499, 1.105282, -2.93395, 1, 0.4392157, 0, 1,
-1.457851, -0.1503227, -1.624774, 1, 0.4431373, 0, 1,
-1.453922, -2.150179, -2.134131, 1, 0.4509804, 0, 1,
-1.439407, -0.8654002, -1.844677, 1, 0.454902, 0, 1,
-1.430215, 1.170158, -1.169657, 1, 0.4627451, 0, 1,
-1.425921, 1.271816, -0.1034166, 1, 0.4666667, 0, 1,
-1.421811, 0.2043829, -0.616643, 1, 0.4745098, 0, 1,
-1.404635, 1.294995, -0.0664883, 1, 0.4784314, 0, 1,
-1.403502, 0.5596361, -1.206693, 1, 0.4862745, 0, 1,
-1.388432, 1.251428, -0.1935544, 1, 0.4901961, 0, 1,
-1.38681, 0.2993291, -1.068386, 1, 0.4980392, 0, 1,
-1.383436, 0.8451529, -2.108664, 1, 0.5058824, 0, 1,
-1.381157, 1.187664, 1.835192, 1, 0.509804, 0, 1,
-1.366886, 0.5865637, -2.844151, 1, 0.5176471, 0, 1,
-1.364451, -0.3002517, -1.86912, 1, 0.5215687, 0, 1,
-1.356094, -1.336232, -2.914975, 1, 0.5294118, 0, 1,
-1.354363, -0.9630775, -2.035841, 1, 0.5333334, 0, 1,
-1.350684, -1.136954, -2.288815, 1, 0.5411765, 0, 1,
-1.347026, -0.336288, -3.164958, 1, 0.5450981, 0, 1,
-1.344599, 2.258502, -1.019596, 1, 0.5529412, 0, 1,
-1.34056, 1.532955, 1.220771, 1, 0.5568628, 0, 1,
-1.339274, -3.332309, -1.517501, 1, 0.5647059, 0, 1,
-1.330184, -2.716045, -1.567042, 1, 0.5686275, 0, 1,
-1.327521, -0.08257635, -0.5999745, 1, 0.5764706, 0, 1,
-1.312697, -0.0214936, -1.898392, 1, 0.5803922, 0, 1,
-1.311536, -0.1510283, -2.578123, 1, 0.5882353, 0, 1,
-1.305704, -1.131971, -3.210382, 1, 0.5921569, 0, 1,
-1.302351, -2.287827, -4.276902, 1, 0.6, 0, 1,
-1.294384, 0.6104362, -1.799047, 1, 0.6078432, 0, 1,
-1.2829, 0.6074768, -2.715733, 1, 0.6117647, 0, 1,
-1.265802, 0.1930388, -0.5840625, 1, 0.6196079, 0, 1,
-1.263749, -1.56975, -4.256909, 1, 0.6235294, 0, 1,
-1.262242, 1.338711, -1.553544, 1, 0.6313726, 0, 1,
-1.257011, 0.1446662, -1.194883, 1, 0.6352941, 0, 1,
-1.25615, -0.4756288, -0.8874509, 1, 0.6431373, 0, 1,
-1.243382, 1.183034, -2.627859, 1, 0.6470588, 0, 1,
-1.242532, 0.29829, -3.342614, 1, 0.654902, 0, 1,
-1.236525, -0.2677325, -1.348088, 1, 0.6588235, 0, 1,
-1.234734, 1.115144, -0.9331533, 1, 0.6666667, 0, 1,
-1.231058, 0.1182226, -0.8099631, 1, 0.6705883, 0, 1,
-1.221172, 0.5815201, -1.715911, 1, 0.6784314, 0, 1,
-1.204557, 0.08350369, -2.349948, 1, 0.682353, 0, 1,
-1.197089, 0.6835523, -1.73398, 1, 0.6901961, 0, 1,
-1.192884, -1.948625, -3.244662, 1, 0.6941177, 0, 1,
-1.190595, -1.108994, -1.826783, 1, 0.7019608, 0, 1,
-1.190067, -0.4283943, -3.062314, 1, 0.7098039, 0, 1,
-1.189935, -0.5005841, -0.6693216, 1, 0.7137255, 0, 1,
-1.187589, 0.8044914, -1.152031, 1, 0.7215686, 0, 1,
-1.183586, 1.611797, -1.511013, 1, 0.7254902, 0, 1,
-1.183342, 0.5408662, -0.38232, 1, 0.7333333, 0, 1,
-1.176942, 0.9106167, -0.8516501, 1, 0.7372549, 0, 1,
-1.176065, 1.120185, -0.6651821, 1, 0.7450981, 0, 1,
-1.172172, -0.3799226, -0.7668831, 1, 0.7490196, 0, 1,
-1.17119, 1.380019, -0.9572628, 1, 0.7568628, 0, 1,
-1.163341, -1.841872, -1.804015, 1, 0.7607843, 0, 1,
-1.161812, 0.3880249, -1.227263, 1, 0.7686275, 0, 1,
-1.15441, -1.620463, -3.9806, 1, 0.772549, 0, 1,
-1.147963, 0.6950563, 1.368369, 1, 0.7803922, 0, 1,
-1.140557, -0.2570894, -1.621277, 1, 0.7843137, 0, 1,
-1.134984, 1.026456, -0.344112, 1, 0.7921569, 0, 1,
-1.134788, -0.7930614, -2.712649, 1, 0.7960784, 0, 1,
-1.129974, -0.2057282, -1.000087, 1, 0.8039216, 0, 1,
-1.129596, -0.1367884, -3.122238, 1, 0.8117647, 0, 1,
-1.120797, -1.902272, -2.124846, 1, 0.8156863, 0, 1,
-1.11792, -0.04359569, -1.99901, 1, 0.8235294, 0, 1,
-1.109925, -0.6529508, -1.030173, 1, 0.827451, 0, 1,
-1.103735, -0.3532, -1.483771, 1, 0.8352941, 0, 1,
-1.101617, -0.5466201, -1.4942, 1, 0.8392157, 0, 1,
-1.100597, 0.3600191, -2.883263, 1, 0.8470588, 0, 1,
-1.099544, -1.735838, -2.705949, 1, 0.8509804, 0, 1,
-1.097947, -0.07494831, -2.434618, 1, 0.8588235, 0, 1,
-1.096263, 0.6668549, 0.2019705, 1, 0.8627451, 0, 1,
-1.09277, 0.2167299, -0.4809793, 1, 0.8705882, 0, 1,
-1.091589, 0.506007, -1.036349, 1, 0.8745098, 0, 1,
-1.070177, 0.3793639, -0.5182428, 1, 0.8823529, 0, 1,
-1.06891, -0.7860972, -2.040748, 1, 0.8862745, 0, 1,
-1.067308, 0.1470216, -2.61461, 1, 0.8941177, 0, 1,
-1.062673, -0.1439336, -1.100967, 1, 0.8980392, 0, 1,
-1.057862, -0.2979811, -3.158986, 1, 0.9058824, 0, 1,
-1.057603, -0.1207379, -2.442036, 1, 0.9137255, 0, 1,
-1.056822, -1.054837, -3.058043, 1, 0.9176471, 0, 1,
-1.054467, 1.007881, -1.62135, 1, 0.9254902, 0, 1,
-1.046154, -0.6472297, -1.446064, 1, 0.9294118, 0, 1,
-1.042474, -0.266053, -1.309649, 1, 0.9372549, 0, 1,
-1.041647, -0.366471, -2.920337, 1, 0.9411765, 0, 1,
-1.027288, 1.145351, -1.936247, 1, 0.9490196, 0, 1,
-1.025051, 0.1063936, -3.093983, 1, 0.9529412, 0, 1,
-1.022184, -0.9188771, -2.652355, 1, 0.9607843, 0, 1,
-1.021398, -1.445862, -3.100441, 1, 0.9647059, 0, 1,
-1.015888, 0.105372, -2.685866, 1, 0.972549, 0, 1,
-1.006784, 1.146075, -0.8580772, 1, 0.9764706, 0, 1,
-0.998168, 0.3798961, -2.67763, 1, 0.9843137, 0, 1,
-0.9967843, 0.7378142, -0.1727586, 1, 0.9882353, 0, 1,
-0.9919633, 0.3248901, -2.468874, 1, 0.9960784, 0, 1,
-0.9839005, 0.4140302, -1.333393, 0.9960784, 1, 0, 1,
-0.9767734, 0.8006258, 1.1031, 0.9921569, 1, 0, 1,
-0.9705451, 0.4784849, -2.058146, 0.9843137, 1, 0, 1,
-0.9698758, -0.009016157, -3.399858, 0.9803922, 1, 0, 1,
-0.9695796, 1.171877, -0.4110299, 0.972549, 1, 0, 1,
-0.9687415, -0.8205616, -0.5991459, 0.9686275, 1, 0, 1,
-0.9640079, 0.1595943, -2.35736, 0.9607843, 1, 0, 1,
-0.9636622, 0.396029, -2.195848, 0.9568627, 1, 0, 1,
-0.9568357, 1.113174, 0.7770171, 0.9490196, 1, 0, 1,
-0.950097, 2.023022, 0.8847428, 0.945098, 1, 0, 1,
-0.9461311, -0.2507825, -0.6932424, 0.9372549, 1, 0, 1,
-0.9441921, 0.6241983, -2.399774, 0.9333333, 1, 0, 1,
-0.9420736, 0.428485, -2.195724, 0.9254902, 1, 0, 1,
-0.9420674, -1.775927, -1.872704, 0.9215686, 1, 0, 1,
-0.9405456, -1.025591, -2.147378, 0.9137255, 1, 0, 1,
-0.9354038, -0.5254424, -1.936953, 0.9098039, 1, 0, 1,
-0.926927, -1.468662, -0.6424345, 0.9019608, 1, 0, 1,
-0.9253466, 0.4862194, 1.420889, 0.8941177, 1, 0, 1,
-0.9235015, 0.05204006, -0.7986784, 0.8901961, 1, 0, 1,
-0.9186543, 1.386361, -1.783658, 0.8823529, 1, 0, 1,
-0.9136996, -1.179848, -0.9079794, 0.8784314, 1, 0, 1,
-0.9131907, -0.1879454, -1.804572, 0.8705882, 1, 0, 1,
-0.9086843, -0.4350433, -2.390697, 0.8666667, 1, 0, 1,
-0.9051569, 0.6963615, 0.7644961, 0.8588235, 1, 0, 1,
-0.9050778, -0.05761366, -2.427951, 0.854902, 1, 0, 1,
-0.890393, -1.211377, -1.089724, 0.8470588, 1, 0, 1,
-0.8901454, 0.8755353, -0.3138444, 0.8431373, 1, 0, 1,
-0.887799, -2.262051, -2.090401, 0.8352941, 1, 0, 1,
-0.8863621, -1.797357, -3.979798, 0.8313726, 1, 0, 1,
-0.8858114, -1.398554, -1.995268, 0.8235294, 1, 0, 1,
-0.8855323, -0.5584286, -2.388273, 0.8196079, 1, 0, 1,
-0.8840209, 0.6349554, -2.226722, 0.8117647, 1, 0, 1,
-0.8777025, -0.4707547, -0.686752, 0.8078431, 1, 0, 1,
-0.8713483, -1.105516, -3.23934, 0.8, 1, 0, 1,
-0.869997, 0.5511413, 0.3226011, 0.7921569, 1, 0, 1,
-0.8644689, 0.08347771, -1.041888, 0.7882353, 1, 0, 1,
-0.8572629, 1.093183, -0.07631441, 0.7803922, 1, 0, 1,
-0.8569816, 0.2565743, -0.8627626, 0.7764706, 1, 0, 1,
-0.8563047, -1.339044, -1.595219, 0.7686275, 1, 0, 1,
-0.8458508, -0.3110259, -1.533028, 0.7647059, 1, 0, 1,
-0.8406864, -0.7233972, -0.7364836, 0.7568628, 1, 0, 1,
-0.8402635, 1.625215, -0.1362913, 0.7529412, 1, 0, 1,
-0.8397917, -0.1463381, -2.823557, 0.7450981, 1, 0, 1,
-0.8368625, -0.9901186, -3.405424, 0.7411765, 1, 0, 1,
-0.8348579, 0.9773144, -0.9651861, 0.7333333, 1, 0, 1,
-0.8334356, -0.5608305, -2.777272, 0.7294118, 1, 0, 1,
-0.830247, 0.2442241, -0.9363533, 0.7215686, 1, 0, 1,
-0.8297545, 1.776689, 0.5176625, 0.7176471, 1, 0, 1,
-0.8251972, 1.86659, 0.6550667, 0.7098039, 1, 0, 1,
-0.8197299, 1.131186, -2.19102, 0.7058824, 1, 0, 1,
-0.8195201, -0.4719631, -1.611699, 0.6980392, 1, 0, 1,
-0.8038862, -0.8160776, -2.254181, 0.6901961, 1, 0, 1,
-0.8036858, -1.1631, -3.140007, 0.6862745, 1, 0, 1,
-0.7980538, 0.7437336, -2.776838, 0.6784314, 1, 0, 1,
-0.7963737, 0.3886513, 0.7977712, 0.6745098, 1, 0, 1,
-0.7893209, -1.184314, -2.466172, 0.6666667, 1, 0, 1,
-0.7857025, 0.4008936, -0.2910247, 0.6627451, 1, 0, 1,
-0.7818535, -0.8315912, -1.569076, 0.654902, 1, 0, 1,
-0.7799727, -0.1070812, -3.023265, 0.6509804, 1, 0, 1,
-0.7757011, 0.5412834, -1.072408, 0.6431373, 1, 0, 1,
-0.7743905, 0.3804836, 0.2511881, 0.6392157, 1, 0, 1,
-0.7716673, 0.3168286, -0.6276718, 0.6313726, 1, 0, 1,
-0.7697216, 0.8392619, -1.379197, 0.627451, 1, 0, 1,
-0.7654464, -0.5548467, -1.836397, 0.6196079, 1, 0, 1,
-0.7646442, -1.656766, -1.740847, 0.6156863, 1, 0, 1,
-0.7640296, 0.4528794, -2.232926, 0.6078432, 1, 0, 1,
-0.7584252, 1.133204, -1.04669, 0.6039216, 1, 0, 1,
-0.7471556, -0.6185272, -1.638211, 0.5960785, 1, 0, 1,
-0.7469003, 0.4056198, -2.752705, 0.5882353, 1, 0, 1,
-0.7465392, 0.5167655, -1.472586, 0.5843138, 1, 0, 1,
-0.7418368, -1.143411, -3.12565, 0.5764706, 1, 0, 1,
-0.7416751, 0.8977218, -0.2032089, 0.572549, 1, 0, 1,
-0.7415963, -1.280605, -2.754889, 0.5647059, 1, 0, 1,
-0.7390913, -0.3968153, -2.395287, 0.5607843, 1, 0, 1,
-0.7348909, 0.561476, -0.2237926, 0.5529412, 1, 0, 1,
-0.7251521, -0.4524511, -2.98401, 0.5490196, 1, 0, 1,
-0.716809, -1.196868, -2.590469, 0.5411765, 1, 0, 1,
-0.7162877, -1.011313, -2.021039, 0.5372549, 1, 0, 1,
-0.7058676, 0.5422551, 0.1708333, 0.5294118, 1, 0, 1,
-0.7022111, -0.6467494, -3.9837, 0.5254902, 1, 0, 1,
-0.6975571, -0.2181899, -0.6712315, 0.5176471, 1, 0, 1,
-0.6971247, 0.5168694, -0.9191465, 0.5137255, 1, 0, 1,
-0.6963585, -1.386954, -3.00216, 0.5058824, 1, 0, 1,
-0.6962166, -0.3490492, -2.075017, 0.5019608, 1, 0, 1,
-0.691345, -0.7383866, -2.146173, 0.4941176, 1, 0, 1,
-0.6853108, -0.4560716, -1.906165, 0.4862745, 1, 0, 1,
-0.6849158, -1.930619, -2.350057, 0.4823529, 1, 0, 1,
-0.68325, 0.2884447, -2.102259, 0.4745098, 1, 0, 1,
-0.6804147, -0.1747557, -1.468349, 0.4705882, 1, 0, 1,
-0.6786283, 1.671009, -0.03232094, 0.4627451, 1, 0, 1,
-0.6752678, -0.06010291, -3.318871, 0.4588235, 1, 0, 1,
-0.6748292, 0.2824756, -2.459187, 0.4509804, 1, 0, 1,
-0.6708372, 1.328792, -1.196259, 0.4470588, 1, 0, 1,
-0.670723, 0.1402658, -0.4001419, 0.4392157, 1, 0, 1,
-0.6706811, 1.747884, -2.627662, 0.4352941, 1, 0, 1,
-0.670023, 1.65356, -1.031613, 0.427451, 1, 0, 1,
-0.6674061, -0.07356197, -1.625677, 0.4235294, 1, 0, 1,
-0.6624915, 0.804731, -0.2805999, 0.4156863, 1, 0, 1,
-0.6624183, 0.4035461, -1.46943, 0.4117647, 1, 0, 1,
-0.6605347, -1.239388, -2.812008, 0.4039216, 1, 0, 1,
-0.6581679, -0.1264936, -2.401661, 0.3960784, 1, 0, 1,
-0.6570216, -0.3657293, -2.19212, 0.3921569, 1, 0, 1,
-0.653321, 0.535772, -0.7855464, 0.3843137, 1, 0, 1,
-0.6529723, -0.5622945, -0.1526469, 0.3803922, 1, 0, 1,
-0.6495463, 0.374752, -1.769583, 0.372549, 1, 0, 1,
-0.6456552, 0.2479568, -1.956537, 0.3686275, 1, 0, 1,
-0.645403, -1.215746, -4.4538, 0.3607843, 1, 0, 1,
-0.644341, -0.5518085, -1.671795, 0.3568628, 1, 0, 1,
-0.6390891, -0.4205048, -0.3397291, 0.3490196, 1, 0, 1,
-0.6320745, 1.364679, 0.145736, 0.345098, 1, 0, 1,
-0.6288127, 0.8217977, -1.397537, 0.3372549, 1, 0, 1,
-0.6267747, -0.9120049, -2.492, 0.3333333, 1, 0, 1,
-0.6235582, 0.1019718, -1.090807, 0.3254902, 1, 0, 1,
-0.6137971, 0.08669814, -1.079514, 0.3215686, 1, 0, 1,
-0.6128012, 0.7081726, -2.402947, 0.3137255, 1, 0, 1,
-0.6103869, 0.3779069, -0.2296268, 0.3098039, 1, 0, 1,
-0.6075387, -0.3545485, -2.730057, 0.3019608, 1, 0, 1,
-0.6044579, -1.681726, -1.649273, 0.2941177, 1, 0, 1,
-0.604258, 0.6487562, -0.9296594, 0.2901961, 1, 0, 1,
-0.5972559, 1.240551, 1.891994, 0.282353, 1, 0, 1,
-0.5965524, -0.1958267, -0.08596589, 0.2784314, 1, 0, 1,
-0.5858465, -0.08108672, -1.630419, 0.2705882, 1, 0, 1,
-0.580431, 0.1950911, -1.263187, 0.2666667, 1, 0, 1,
-0.5799652, 0.8417857, -1.746516, 0.2588235, 1, 0, 1,
-0.5643802, 1.73325, -0.7449536, 0.254902, 1, 0, 1,
-0.5623801, 0.08773167, -1.819883, 0.2470588, 1, 0, 1,
-0.5579703, 1.19106, -0.9540353, 0.2431373, 1, 0, 1,
-0.5534704, 1.532356, -1.183358, 0.2352941, 1, 0, 1,
-0.5497366, -1.215799, -3.182379, 0.2313726, 1, 0, 1,
-0.5496156, 0.7741126, -2.106058, 0.2235294, 1, 0, 1,
-0.5429798, -0.3129862, -2.375645, 0.2196078, 1, 0, 1,
-0.5388799, -0.1898501, -3.214807, 0.2117647, 1, 0, 1,
-0.5384931, 0.217911, -1.959204, 0.2078431, 1, 0, 1,
-0.5365748, 0.5914732, -0.1265332, 0.2, 1, 0, 1,
-0.5365186, 0.4405261, -0.8212193, 0.1921569, 1, 0, 1,
-0.5361855, 0.386286, -1.024204, 0.1882353, 1, 0, 1,
-0.5267372, -0.8306661, -0.887813, 0.1803922, 1, 0, 1,
-0.525113, -0.61795, -3.268666, 0.1764706, 1, 0, 1,
-0.5230086, -0.7979515, -2.902916, 0.1686275, 1, 0, 1,
-0.518461, 0.6509643, -1.304321, 0.1647059, 1, 0, 1,
-0.5109452, -0.02225332, -2.379268, 0.1568628, 1, 0, 1,
-0.5077176, 0.3319174, -0.6894287, 0.1529412, 1, 0, 1,
-0.5077128, 0.2930212, -1.570469, 0.145098, 1, 0, 1,
-0.5041499, -0.8157167, -3.044986, 0.1411765, 1, 0, 1,
-0.5028318, 1.133036, -1.796864, 0.1333333, 1, 0, 1,
-0.5020304, 0.2294385, -0.4235546, 0.1294118, 1, 0, 1,
-0.4992309, -1.777548, -3.630027, 0.1215686, 1, 0, 1,
-0.496477, -0.3686293, -0.9025862, 0.1176471, 1, 0, 1,
-0.4961931, -0.4870184, -1.894688, 0.1098039, 1, 0, 1,
-0.4959172, -1.771404, -3.131303, 0.1058824, 1, 0, 1,
-0.4955017, 1.071621, -1.687789, 0.09803922, 1, 0, 1,
-0.4920974, -0.9470519, -2.326542, 0.09019608, 1, 0, 1,
-0.4893391, -0.8927795, -2.732344, 0.08627451, 1, 0, 1,
-0.4864999, -0.884379, -2.900999, 0.07843138, 1, 0, 1,
-0.4859952, 0.1486997, -2.935206, 0.07450981, 1, 0, 1,
-0.4827318, 1.928861, 1.177855, 0.06666667, 1, 0, 1,
-0.4804263, -0.8237314, -4.7659, 0.0627451, 1, 0, 1,
-0.4786668, -0.8602374, -2.99067, 0.05490196, 1, 0, 1,
-0.4783784, -0.6491877, -2.609838, 0.05098039, 1, 0, 1,
-0.4783573, -1.196832, -3.681006, 0.04313726, 1, 0, 1,
-0.4778609, -0.1728996, -2.008079, 0.03921569, 1, 0, 1,
-0.4770311, 0.04077583, -1.807253, 0.03137255, 1, 0, 1,
-0.4723462, 0.2064946, -1.575785, 0.02745098, 1, 0, 1,
-0.4646994, -2.053849, -4.711968, 0.01960784, 1, 0, 1,
-0.4593943, 0.2553875, -1.252008, 0.01568628, 1, 0, 1,
-0.458864, 1.38944, 0.7437558, 0.007843138, 1, 0, 1,
-0.4564245, 0.3483639, -3.574163, 0.003921569, 1, 0, 1,
-0.4464205, 0.3040621, -1.416951, 0, 1, 0.003921569, 1,
-0.4414625, 0.6343926, -1.732357, 0, 1, 0.01176471, 1,
-0.4378439, 1.803, 0.6023829, 0, 1, 0.01568628, 1,
-0.4375415, -0.4686013, -3.56467, 0, 1, 0.02352941, 1,
-0.4328464, 0.7435101, -1.614431, 0, 1, 0.02745098, 1,
-0.4266151, 0.398625, -1.264771, 0, 1, 0.03529412, 1,
-0.4258468, 0.4819307, -0.6986262, 0, 1, 0.03921569, 1,
-0.4240063, 0.01835283, -1.29123, 0, 1, 0.04705882, 1,
-0.4217049, 0.3909485, -1.934612, 0, 1, 0.05098039, 1,
-0.4203813, -0.4699925, -2.334096, 0, 1, 0.05882353, 1,
-0.4202538, 1.838839, 1.159755, 0, 1, 0.0627451, 1,
-0.4040742, 0.3821597, 1.081003, 0, 1, 0.07058824, 1,
-0.401665, 0.2737025, -0.1722988, 0, 1, 0.07450981, 1,
-0.3992243, 0.607924, -0.6661326, 0, 1, 0.08235294, 1,
-0.3893427, 0.7691265, -1.42541, 0, 1, 0.08627451, 1,
-0.384521, -0.07269424, -2.377701, 0, 1, 0.09411765, 1,
-0.3818985, -0.8974769, -2.71968, 0, 1, 0.1019608, 1,
-0.3711248, -1.230889, -1.606831, 0, 1, 0.1058824, 1,
-0.3659129, -1.885688, -1.425359, 0, 1, 0.1137255, 1,
-0.3615572, 0.390493, -1.010477, 0, 1, 0.1176471, 1,
-0.3596892, 0.2835481, -1.695558, 0, 1, 0.1254902, 1,
-0.3596321, 0.7347144, -1.067291, 0, 1, 0.1294118, 1,
-0.3576613, 0.8638631, 0.7388917, 0, 1, 0.1372549, 1,
-0.3553495, -0.552167, -3.369943, 0, 1, 0.1411765, 1,
-0.3549907, 1.443582, -0.8587278, 0, 1, 0.1490196, 1,
-0.3545046, -0.8772794, -2.747618, 0, 1, 0.1529412, 1,
-0.3537764, -1.098874, -2.152647, 0, 1, 0.1607843, 1,
-0.3533859, 0.2392951, 0.4394208, 0, 1, 0.1647059, 1,
-0.3532966, -0.448361, -2.015556, 0, 1, 0.172549, 1,
-0.3514673, 1.293461, -1.158207, 0, 1, 0.1764706, 1,
-0.3455725, 0.8201891, -0.9459965, 0, 1, 0.1843137, 1,
-0.3408578, 0.1809955, -1.964312, 0, 1, 0.1882353, 1,
-0.3396301, 0.4309222, -0.8991896, 0, 1, 0.1960784, 1,
-0.3391062, 0.5219991, -0.7690052, 0, 1, 0.2039216, 1,
-0.3369822, -0.1208744, -4.265923, 0, 1, 0.2078431, 1,
-0.3364168, 0.6466262, -0.5064576, 0, 1, 0.2156863, 1,
-0.3318978, -1.335901, -1.55118, 0, 1, 0.2196078, 1,
-0.3287247, 1.744377, -0.6164836, 0, 1, 0.227451, 1,
-0.3258874, -0.4092385, -3.925884, 0, 1, 0.2313726, 1,
-0.3202514, 0.1069693, -1.801064, 0, 1, 0.2392157, 1,
-0.313894, -0.06303731, -0.8862622, 0, 1, 0.2431373, 1,
-0.3134723, 0.2894866, -2.588749, 0, 1, 0.2509804, 1,
-0.3133838, 0.6686718, -1.432728, 0, 1, 0.254902, 1,
-0.3132005, -1.111827, -3.165075, 0, 1, 0.2627451, 1,
-0.3127736, -1.081173, -3.240862, 0, 1, 0.2666667, 1,
-0.3115137, -0.8951609, -1.404954, 0, 1, 0.2745098, 1,
-0.3085199, 0.8223988, -2.103786, 0, 1, 0.2784314, 1,
-0.3078733, -0.4526197, -4.24784, 0, 1, 0.2862745, 1,
-0.3066462, -0.3968444, -3.265669, 0, 1, 0.2901961, 1,
-0.3064175, -1.07238, -2.296627, 0, 1, 0.2980392, 1,
-0.305653, -1.609212, -2.062907, 0, 1, 0.3058824, 1,
-0.3047475, 0.362535, 0.4231225, 0, 1, 0.3098039, 1,
-0.3017398, -1.337468, -3.923909, 0, 1, 0.3176471, 1,
-0.2969276, 1.14455, 0.2491161, 0, 1, 0.3215686, 1,
-0.2952034, 0.8040667, -1.71792, 0, 1, 0.3294118, 1,
-0.2933396, -0.07662714, -1.057992, 0, 1, 0.3333333, 1,
-0.2925073, 0.4983144, 0.2582015, 0, 1, 0.3411765, 1,
-0.2837982, -0.4282674, -2.452868, 0, 1, 0.345098, 1,
-0.2827681, 0.6807994, 0.3521492, 0, 1, 0.3529412, 1,
-0.2792526, 2.503521, -0.7829301, 0, 1, 0.3568628, 1,
-0.2791704, -0.1142747, -1.805988, 0, 1, 0.3647059, 1,
-0.2786137, 0.4005497, -1.348028, 0, 1, 0.3686275, 1,
-0.2786095, 0.1456862, -1.022306, 0, 1, 0.3764706, 1,
-0.2784303, -1.331947, -2.510107, 0, 1, 0.3803922, 1,
-0.2781382, -0.3728865, -3.089168, 0, 1, 0.3882353, 1,
-0.2778037, -0.2827365, -3.651397, 0, 1, 0.3921569, 1,
-0.2772894, 0.9796112, 0.7621617, 0, 1, 0.4, 1,
-0.2764468, -0.9318355, -2.817683, 0, 1, 0.4078431, 1,
-0.2702487, 1.166673, -0.2769454, 0, 1, 0.4117647, 1,
-0.2677227, 0.1599473, -1.676594, 0, 1, 0.4196078, 1,
-0.2670352, 0.03683682, -0.8710109, 0, 1, 0.4235294, 1,
-0.2645868, 0.09522286, -2.156025, 0, 1, 0.4313726, 1,
-0.2628212, -0.1100432, -1.440798, 0, 1, 0.4352941, 1,
-0.2607359, 0.8815605, -1.164226, 0, 1, 0.4431373, 1,
-0.2588754, -0.1594886, -3.406741, 0, 1, 0.4470588, 1,
-0.2586829, -0.550741, -3.534141, 0, 1, 0.454902, 1,
-0.2577444, -0.6447359, -1.506559, 0, 1, 0.4588235, 1,
-0.2548543, -0.7152443, -2.275536, 0, 1, 0.4666667, 1,
-0.2547257, 1.319529, 0.002107047, 0, 1, 0.4705882, 1,
-0.2522725, -0.7422375, -2.619021, 0, 1, 0.4784314, 1,
-0.2512505, 0.1051765, -0.2247834, 0, 1, 0.4823529, 1,
-0.2480675, -0.1833063, -2.131655, 0, 1, 0.4901961, 1,
-0.2453527, 1.34613, -2.773427, 0, 1, 0.4941176, 1,
-0.2395573, -0.07792488, -1.943076, 0, 1, 0.5019608, 1,
-0.2395459, 0.3871811, -0.7419421, 0, 1, 0.509804, 1,
-0.2372361, 0.2184497, 0.002803764, 0, 1, 0.5137255, 1,
-0.2365366, -0.4753262, -2.360791, 0, 1, 0.5215687, 1,
-0.2347462, 0.7912377, 0.02753607, 0, 1, 0.5254902, 1,
-0.2346266, -0.05612311, -2.506866, 0, 1, 0.5333334, 1,
-0.2283646, -1.134802, -1.313242, 0, 1, 0.5372549, 1,
-0.228043, -0.04556569, -2.029269, 0, 1, 0.5450981, 1,
-0.228016, 1.238178, -0.8382875, 0, 1, 0.5490196, 1,
-0.2254154, -0.8697333, -2.15431, 0, 1, 0.5568628, 1,
-0.2232115, 0.5461867, 0.9073673, 0, 1, 0.5607843, 1,
-0.2229366, 0.465345, -0.9736615, 0, 1, 0.5686275, 1,
-0.2203711, -1.558432, -4.140904, 0, 1, 0.572549, 1,
-0.220093, -0.3515287, -4.533089, 0, 1, 0.5803922, 1,
-0.218889, -0.5940886, -2.422685, 0, 1, 0.5843138, 1,
-0.208903, 0.5871225, -0.8971077, 0, 1, 0.5921569, 1,
-0.2038588, -1.083825, -2.519807, 0, 1, 0.5960785, 1,
-0.2023125, -0.1114966, -1.389578, 0, 1, 0.6039216, 1,
-0.2000918, 1.974083, 0.1783038, 0, 1, 0.6117647, 1,
-0.1976511, -2.164979, -3.570964, 0, 1, 0.6156863, 1,
-0.1957964, -0.3842171, -0.04207486, 0, 1, 0.6235294, 1,
-0.194542, -0.5648398, -3.733283, 0, 1, 0.627451, 1,
-0.1843498, 1.303412, -1.316163, 0, 1, 0.6352941, 1,
-0.182103, 0.8676907, 0.3050255, 0, 1, 0.6392157, 1,
-0.1802613, 0.364475, -2.056973, 0, 1, 0.6470588, 1,
-0.1793621, -0.8592557, -3.268441, 0, 1, 0.6509804, 1,
-0.1754754, -0.7927497, -5.06531, 0, 1, 0.6588235, 1,
-0.1737597, 0.3232122, 0.7416616, 0, 1, 0.6627451, 1,
-0.17325, 1.564077, -0.1611229, 0, 1, 0.6705883, 1,
-0.1710594, 0.1342798, -0.3477433, 0, 1, 0.6745098, 1,
-0.1652983, -1.144831, -4.703681, 0, 1, 0.682353, 1,
-0.1644365, 1.730582, -0.5728678, 0, 1, 0.6862745, 1,
-0.1618453, -1.929505, -2.150964, 0, 1, 0.6941177, 1,
-0.1613657, 0.03672794, -2.13292, 0, 1, 0.7019608, 1,
-0.1608888, -0.1195029, -2.764494, 0, 1, 0.7058824, 1,
-0.1593946, -2.015732, -4.192619, 0, 1, 0.7137255, 1,
-0.1583466, -0.07890934, -1.036958, 0, 1, 0.7176471, 1,
-0.1485981, -0.8766319, -4.023867, 0, 1, 0.7254902, 1,
-0.1478353, -0.6911265, -2.743973, 0, 1, 0.7294118, 1,
-0.1458842, 0.4870152, -1.097688, 0, 1, 0.7372549, 1,
-0.1433762, -0.9439446, -2.0892, 0, 1, 0.7411765, 1,
-0.1418721, -0.7298328, -3.130678, 0, 1, 0.7490196, 1,
-0.1415508, -2.049632, -3.564819, 0, 1, 0.7529412, 1,
-0.1383903, -0.8537169, -2.865588, 0, 1, 0.7607843, 1,
-0.1381604, 0.6289249, -1.052034, 0, 1, 0.7647059, 1,
-0.1371973, -0.08257891, -2.33787, 0, 1, 0.772549, 1,
-0.1363307, -0.515007, -3.022207, 0, 1, 0.7764706, 1,
-0.135115, -0.8403435, -1.874526, 0, 1, 0.7843137, 1,
-0.1207512, -0.521731, -3.894071, 0, 1, 0.7882353, 1,
-0.1178702, -0.3679053, -4.302355, 0, 1, 0.7960784, 1,
-0.1174175, 1.255147, 0.549154, 0, 1, 0.8039216, 1,
-0.1173342, -1.200206, -2.81267, 0, 1, 0.8078431, 1,
-0.1123165, -1.296054, -1.250527, 0, 1, 0.8156863, 1,
-0.1090334, 0.07146135, -1.63808, 0, 1, 0.8196079, 1,
-0.1074409, 0.2625608, -0.5881972, 0, 1, 0.827451, 1,
-0.1049935, 0.140824, -0.7836031, 0, 1, 0.8313726, 1,
-0.1040049, 1.979352, -1.250768, 0, 1, 0.8392157, 1,
-0.1015105, 1.122965, 0.3027006, 0, 1, 0.8431373, 1,
-0.09756753, 0.5952861, -2.661234, 0, 1, 0.8509804, 1,
-0.09529203, -0.4696289, -3.277698, 0, 1, 0.854902, 1,
-0.09514873, -1.344223, -2.051771, 0, 1, 0.8627451, 1,
-0.09493861, -0.8472669, -4.132061, 0, 1, 0.8666667, 1,
-0.09176653, 0.6595131, -0.8106655, 0, 1, 0.8745098, 1,
-0.09140387, -0.6572815, -3.495932, 0, 1, 0.8784314, 1,
-0.08555946, 0.1617775, 0.1012324, 0, 1, 0.8862745, 1,
-0.08343742, -1.274222, -3.486737, 0, 1, 0.8901961, 1,
-0.07921498, -0.5520181, -2.962357, 0, 1, 0.8980392, 1,
-0.07832979, 0.1351577, -0.5235801, 0, 1, 0.9058824, 1,
-0.07346107, 1.382364, 0.6904939, 0, 1, 0.9098039, 1,
-0.06563477, -0.2765597, -2.44255, 0, 1, 0.9176471, 1,
-0.06041861, 0.925349, -1.704268, 0, 1, 0.9215686, 1,
-0.06011667, -0.005342956, -1.555324, 0, 1, 0.9294118, 1,
-0.05923994, 0.3841108, 1.319391, 0, 1, 0.9333333, 1,
-0.05901691, 0.4380171, 0.7862789, 0, 1, 0.9411765, 1,
-0.05880821, -1.447627, -4.81367, 0, 1, 0.945098, 1,
-0.05704042, -0.4296319, -2.044091, 0, 1, 0.9529412, 1,
-0.05521033, 2.183683, 0.8907329, 0, 1, 0.9568627, 1,
-0.05433292, -0.02733959, -1.816182, 0, 1, 0.9647059, 1,
-0.05034835, -0.4974375, -2.808954, 0, 1, 0.9686275, 1,
-0.03720226, -1.060615, -2.992138, 0, 1, 0.9764706, 1,
-0.03476662, -1.851059, -4.131759, 0, 1, 0.9803922, 1,
-0.02746228, -0.2534754, -5.510648, 0, 1, 0.9882353, 1,
-0.02618578, -1.15223, -2.32193, 0, 1, 0.9921569, 1,
-0.02499979, -0.5063873, -4.346296, 0, 1, 1, 1,
-0.01893493, 0.3501202, -0.4448174, 0, 0.9921569, 1, 1,
-0.01822932, -0.2895723, -0.614058, 0, 0.9882353, 1, 1,
-0.0165179, -1.11714, -3.524942, 0, 0.9803922, 1, 1,
-0.01336216, -1.2268, -3.087882, 0, 0.9764706, 1, 1,
-0.01333608, 0.7487202, -0.6367545, 0, 0.9686275, 1, 1,
-0.00540078, -0.6744207, -1.542627, 0, 0.9647059, 1, 1,
-0.003822527, 0.5853522, -1.847824, 0, 0.9568627, 1, 1,
-0.0032197, -1.499318, -4.008509, 0, 0.9529412, 1, 1,
0.001340442, -0.0877038, 4.359427, 0, 0.945098, 1, 1,
0.004923861, -0.5718048, 4.121026, 0, 0.9411765, 1, 1,
0.01250329, 0.5887201, -0.7664167, 0, 0.9333333, 1, 1,
0.01561943, -0.44776, 2.089391, 0, 0.9294118, 1, 1,
0.02149519, -1.434271, 2.477776, 0, 0.9215686, 1, 1,
0.03075303, -0.3961645, 3.607619, 0, 0.9176471, 1, 1,
0.03440482, 1.284972, 0.7238342, 0, 0.9098039, 1, 1,
0.03481456, -0.8128312, 2.044908, 0, 0.9058824, 1, 1,
0.03894902, -0.649013, 3.981206, 0, 0.8980392, 1, 1,
0.03959414, 0.8584723, -0.5691447, 0, 0.8901961, 1, 1,
0.04274569, -1.236597, 2.066645, 0, 0.8862745, 1, 1,
0.04831666, 0.228053, 0.4251817, 0, 0.8784314, 1, 1,
0.04841758, 1.889926, 0.2602315, 0, 0.8745098, 1, 1,
0.04872939, -0.4005636, 1.601054, 0, 0.8666667, 1, 1,
0.05351438, -3.036196, 4.283189, 0, 0.8627451, 1, 1,
0.05712479, -0.6097947, 4.28453, 0, 0.854902, 1, 1,
0.05794868, 2.418515, -1.002946, 0, 0.8509804, 1, 1,
0.06231303, -1.581486, 1.559153, 0, 0.8431373, 1, 1,
0.06338875, 0.8877, -1.455646, 0, 0.8392157, 1, 1,
0.06856948, -1.303483, 0.7770002, 0, 0.8313726, 1, 1,
0.06954733, -0.2983529, 2.614037, 0, 0.827451, 1, 1,
0.07117745, 1.102138, -0.3005368, 0, 0.8196079, 1, 1,
0.07305474, 1.461494, -0.6055791, 0, 0.8156863, 1, 1,
0.08183651, 0.7649059, -0.0713312, 0, 0.8078431, 1, 1,
0.08191492, 0.3021311, -1.203526, 0, 0.8039216, 1, 1,
0.08829764, -0.2076487, 1.939031, 0, 0.7960784, 1, 1,
0.08984171, -1.692206, 1.815297, 0, 0.7882353, 1, 1,
0.09122606, -0.4303022, 2.384376, 0, 0.7843137, 1, 1,
0.09718488, 1.159807, 0.9177342, 0, 0.7764706, 1, 1,
0.09997891, -2.246459, 4.884741, 0, 0.772549, 1, 1,
0.1001489, -0.7100121, 2.75543, 0, 0.7647059, 1, 1,
0.100256, -1.87948, 3.189492, 0, 0.7607843, 1, 1,
0.1011367, -0.5271059, 2.695692, 0, 0.7529412, 1, 1,
0.1022582, 0.0485131, 0.4748958, 0, 0.7490196, 1, 1,
0.1041942, -1.868301, 5.553977, 0, 0.7411765, 1, 1,
0.1062915, 0.5871825, -0.388667, 0, 0.7372549, 1, 1,
0.1064092, 0.7713599, 0.3572973, 0, 0.7294118, 1, 1,
0.1095631, -0.3907243, 1.130755, 0, 0.7254902, 1, 1,
0.1108319, -0.08540046, 0.7451677, 0, 0.7176471, 1, 1,
0.1140124, 0.1653451, 0.4405657, 0, 0.7137255, 1, 1,
0.1145376, 0.8547409, -0.9378465, 0, 0.7058824, 1, 1,
0.1178342, -0.4140398, 4.825884, 0, 0.6980392, 1, 1,
0.1217671, 0.2839969, -0.2844843, 0, 0.6941177, 1, 1,
0.1240057, -1.15015, 4.789948, 0, 0.6862745, 1, 1,
0.1247486, 1.741196, 0.237288, 0, 0.682353, 1, 1,
0.1259591, -0.118821, 2.50939, 0, 0.6745098, 1, 1,
0.1272237, -0.7080439, 3.327604, 0, 0.6705883, 1, 1,
0.1272615, -0.4532975, 0.4722207, 0, 0.6627451, 1, 1,
0.1310487, -0.03915633, 1.895884, 0, 0.6588235, 1, 1,
0.131782, 1.370856, 0.7624676, 0, 0.6509804, 1, 1,
0.131821, -0.3929508, 2.693254, 0, 0.6470588, 1, 1,
0.1444075, -2.181134, 1.134368, 0, 0.6392157, 1, 1,
0.1480333, 0.1734044, 0.7830631, 0, 0.6352941, 1, 1,
0.1508401, -1.941791, 4.80107, 0, 0.627451, 1, 1,
0.1555168, -1.583617, 4.745047, 0, 0.6235294, 1, 1,
0.1601314, 0.8259867, 0.4192339, 0, 0.6156863, 1, 1,
0.164778, -0.07866731, 0.6901872, 0, 0.6117647, 1, 1,
0.1654514, -0.2266439, 3.188667, 0, 0.6039216, 1, 1,
0.1666718, 0.3864295, 0.7010012, 0, 0.5960785, 1, 1,
0.1678411, -0.6507594, 3.002114, 0, 0.5921569, 1, 1,
0.1699792, 0.08787944, 1.140776, 0, 0.5843138, 1, 1,
0.1703917, 0.5048313, 0.1494592, 0, 0.5803922, 1, 1,
0.1735813, 1.178134, -0.3123743, 0, 0.572549, 1, 1,
0.174737, 1.580582, -0.6280287, 0, 0.5686275, 1, 1,
0.1793728, -0.423915, 3.120222, 0, 0.5607843, 1, 1,
0.1794229, -0.1518261, 3.134505, 0, 0.5568628, 1, 1,
0.1827828, -0.4705266, 4.023117, 0, 0.5490196, 1, 1,
0.1867099, 0.4002005, 0.536392, 0, 0.5450981, 1, 1,
0.1867452, -1.420174, 3.874822, 0, 0.5372549, 1, 1,
0.1871806, -0.04821045, 0.8220474, 0, 0.5333334, 1, 1,
0.1887821, -0.4918171, 2.556781, 0, 0.5254902, 1, 1,
0.1895986, -1.121989, 2.857288, 0, 0.5215687, 1, 1,
0.1945031, 1.325138, -1.183969, 0, 0.5137255, 1, 1,
0.1969776, -1.176902, 2.29433, 0, 0.509804, 1, 1,
0.197801, 0.2579757, -0.292725, 0, 0.5019608, 1, 1,
0.1997673, 1.000583, -0.189081, 0, 0.4941176, 1, 1,
0.2002012, -0.5489234, 2.959267, 0, 0.4901961, 1, 1,
0.2021364, -0.1953159, 0.3829342, 0, 0.4823529, 1, 1,
0.2027184, 0.02744344, 1.135874, 0, 0.4784314, 1, 1,
0.2040417, -2.123215, 3.158638, 0, 0.4705882, 1, 1,
0.2094155, 1.160756, -0.2535002, 0, 0.4666667, 1, 1,
0.2100724, -0.6340193, 3.983861, 0, 0.4588235, 1, 1,
0.2125963, -2.006708, 1.517848, 0, 0.454902, 1, 1,
0.2148921, 2.091081, 1.306034, 0, 0.4470588, 1, 1,
0.2174433, -0.2758728, 2.146104, 0, 0.4431373, 1, 1,
0.221495, 1.003443, 2.153234, 0, 0.4352941, 1, 1,
0.2283988, -1.62674, 3.575629, 0, 0.4313726, 1, 1,
0.2289794, 0.1793258, -0.08443133, 0, 0.4235294, 1, 1,
0.2333789, -0.857233, 1.800579, 0, 0.4196078, 1, 1,
0.2360325, -1.565027, 1.238963, 0, 0.4117647, 1, 1,
0.2366024, 1.070401, 0.9936748, 0, 0.4078431, 1, 1,
0.2447674, 0.2285569, 0.5905793, 0, 0.4, 1, 1,
0.2474025, -1.218791, 2.250171, 0, 0.3921569, 1, 1,
0.2477658, 0.346758, 0.3556816, 0, 0.3882353, 1, 1,
0.25318, 0.3999521, 1.041621, 0, 0.3803922, 1, 1,
0.2547827, 0.08450549, 0.05598493, 0, 0.3764706, 1, 1,
0.2556028, -0.4444548, 3.779825, 0, 0.3686275, 1, 1,
0.2644087, -0.1871786, 1.966127, 0, 0.3647059, 1, 1,
0.27627, 1.376853, 0.7955113, 0, 0.3568628, 1, 1,
0.2779176, 0.2861426, 0.3920145, 0, 0.3529412, 1, 1,
0.2902148, 0.3051535, 1.687345, 0, 0.345098, 1, 1,
0.2933911, -0.3215531, 1.717862, 0, 0.3411765, 1, 1,
0.2945196, -0.3340106, 3.045237, 0, 0.3333333, 1, 1,
0.2968588, 1.095362, -0.04544167, 0, 0.3294118, 1, 1,
0.3015889, -1.050784, 3.830031, 0, 0.3215686, 1, 1,
0.3044478, 0.7826309, 1.134725, 0, 0.3176471, 1, 1,
0.3060222, 1.283901, 3.665355, 0, 0.3098039, 1, 1,
0.3073447, 0.246702, 0.5077612, 0, 0.3058824, 1, 1,
0.3092727, -1.707538, 4.433374, 0, 0.2980392, 1, 1,
0.3113354, -0.8462254, 4.565361, 0, 0.2901961, 1, 1,
0.3133312, 1.092943, -1.476234, 0, 0.2862745, 1, 1,
0.3146445, 0.1355522, -0.1481883, 0, 0.2784314, 1, 1,
0.3176479, -1.375455, 1.893375, 0, 0.2745098, 1, 1,
0.3182383, 0.6038235, 0.1399477, 0, 0.2666667, 1, 1,
0.3203032, 0.538921, 2.024255, 0, 0.2627451, 1, 1,
0.3205762, 0.7450369, 1.883986, 0, 0.254902, 1, 1,
0.3238076, 0.3274609, -0.2375686, 0, 0.2509804, 1, 1,
0.328662, -1.383694, 2.973972, 0, 0.2431373, 1, 1,
0.3354159, 1.07036, -1.072563, 0, 0.2392157, 1, 1,
0.3370547, -1.025155, 2.84702, 0, 0.2313726, 1, 1,
0.337245, -0.4129103, 2.334069, 0, 0.227451, 1, 1,
0.3497708, -0.5672694, 0.9543544, 0, 0.2196078, 1, 1,
0.3506896, -0.1357534, 1.100463, 0, 0.2156863, 1, 1,
0.3507752, 0.4283988, 0.9734849, 0, 0.2078431, 1, 1,
0.3516359, 1.609891, 1.29643, 0, 0.2039216, 1, 1,
0.3522227, -0.7198535, 4.143398, 0, 0.1960784, 1, 1,
0.3537346, -1.349764, 3.834592, 0, 0.1882353, 1, 1,
0.3576555, -0.1712908, 2.228372, 0, 0.1843137, 1, 1,
0.3611608, 1.048074, 0.5731114, 0, 0.1764706, 1, 1,
0.3623723, -0.6620024, 4.001142, 0, 0.172549, 1, 1,
0.3643143, 0.2498412, 0.839491, 0, 0.1647059, 1, 1,
0.3649722, 1.298552, -0.6628733, 0, 0.1607843, 1, 1,
0.3661809, 1.028908, 0.7570916, 0, 0.1529412, 1, 1,
0.3669392, -0.3226648, 2.759495, 0, 0.1490196, 1, 1,
0.3691513, 1.046763, 1.51654, 0, 0.1411765, 1, 1,
0.3798137, 0.7186881, 0.2472453, 0, 0.1372549, 1, 1,
0.381032, 1.870267, 0.3655353, 0, 0.1294118, 1, 1,
0.3813157, 0.2899806, 1.167605, 0, 0.1254902, 1, 1,
0.382077, 0.1279124, 1.505439, 0, 0.1176471, 1, 1,
0.3860649, -0.1472178, 2.615049, 0, 0.1137255, 1, 1,
0.3903528, 0.8244932, 0.3041552, 0, 0.1058824, 1, 1,
0.3904511, 1.797703, -1.357682, 0, 0.09803922, 1, 1,
0.3939243, 1.063071, 0.2779681, 0, 0.09411765, 1, 1,
0.3947675, 1.426506, 0.9467734, 0, 0.08627451, 1, 1,
0.396826, 1.666329, -0.461313, 0, 0.08235294, 1, 1,
0.4046591, -0.9202003, 2.018645, 0, 0.07450981, 1, 1,
0.4093188, -1.511062, 1.089063, 0, 0.07058824, 1, 1,
0.4096863, 0.1130322, 0.1182224, 0, 0.0627451, 1, 1,
0.4116178, 0.5190387, 0.9461684, 0, 0.05882353, 1, 1,
0.4182151, -1.12919, 3.040343, 0, 0.05098039, 1, 1,
0.418631, 1.266268, -1.136059, 0, 0.04705882, 1, 1,
0.4222225, 0.9420489, 0.9932957, 0, 0.03921569, 1, 1,
0.4300319, -0.4718582, 0.9427105, 0, 0.03529412, 1, 1,
0.4301327, -1.65976, 3.773208, 0, 0.02745098, 1, 1,
0.4312763, 0.009375311, 1.15139, 0, 0.02352941, 1, 1,
0.4316529, 0.2241845, -0.2017156, 0, 0.01568628, 1, 1,
0.4333774, 0.9789179, 0.5687863, 0, 0.01176471, 1, 1,
0.4481139, 0.001912052, 0.4222298, 0, 0.003921569, 1, 1,
0.4487891, 0.7911502, 1.760717, 0.003921569, 0, 1, 1,
0.4522405, -1.755667, 3.084044, 0.007843138, 0, 1, 1,
0.4524526, -0.4443374, 0.9769657, 0.01568628, 0, 1, 1,
0.4530791, -0.252433, 2.293442, 0.01960784, 0, 1, 1,
0.4530801, -0.6943413, 2.209652, 0.02745098, 0, 1, 1,
0.4535835, 0.964889, -0.6995963, 0.03137255, 0, 1, 1,
0.4545157, -0.1277663, 1.623975, 0.03921569, 0, 1, 1,
0.4548594, 0.8242742, 1.887571, 0.04313726, 0, 1, 1,
0.45595, -0.1372103, 1.056679, 0.05098039, 0, 1, 1,
0.4574749, 0.1154801, 2.428562, 0.05490196, 0, 1, 1,
0.4591072, 0.8115891, 0.4956651, 0.0627451, 0, 1, 1,
0.4596548, -0.6684477, 4.481667, 0.06666667, 0, 1, 1,
0.4605822, 0.3521824, -0.1185176, 0.07450981, 0, 1, 1,
0.4606024, -0.8570261, 0.9783163, 0.07843138, 0, 1, 1,
0.4685781, -0.2639415, 3.36269, 0.08627451, 0, 1, 1,
0.4696181, 1.20347, 0.9014806, 0.09019608, 0, 1, 1,
0.4739459, -0.3610561, 1.741031, 0.09803922, 0, 1, 1,
0.4758677, -0.9375874, 1.931529, 0.1058824, 0, 1, 1,
0.4783918, -0.4435132, 2.00444, 0.1098039, 0, 1, 1,
0.4791869, 0.4578516, -0.3684018, 0.1176471, 0, 1, 1,
0.4845332, -1.530954, 1.64647, 0.1215686, 0, 1, 1,
0.4887633, -0.02778921, -0.3054648, 0.1294118, 0, 1, 1,
0.4890381, -1.216057, 3.698726, 0.1333333, 0, 1, 1,
0.4905962, -0.1166904, 1.675094, 0.1411765, 0, 1, 1,
0.5047473, 0.2604524, 0.4836771, 0.145098, 0, 1, 1,
0.5065342, 1.951133, -1.149041, 0.1529412, 0, 1, 1,
0.5078987, 0.5160611, 0.6153563, 0.1568628, 0, 1, 1,
0.5094556, 0.3469189, 1.100554, 0.1647059, 0, 1, 1,
0.5118899, -0.345306, 2.472117, 0.1686275, 0, 1, 1,
0.512594, -0.3026096, 1.958388, 0.1764706, 0, 1, 1,
0.5147334, 0.6685941, 2.766152, 0.1803922, 0, 1, 1,
0.5213294, -0.706787, 1.812089, 0.1882353, 0, 1, 1,
0.5275298, -2.037281, 3.373039, 0.1921569, 0, 1, 1,
0.5280808, -0.1627203, 3.708414, 0.2, 0, 1, 1,
0.5339262, -0.8755291, 0.9906825, 0.2078431, 0, 1, 1,
0.5402373, -0.2616479, 1.292609, 0.2117647, 0, 1, 1,
0.5439491, 1.019753, 0.7215889, 0.2196078, 0, 1, 1,
0.5440598, 0.3162824, 1.374687, 0.2235294, 0, 1, 1,
0.5472957, -0.0658819, 2.402789, 0.2313726, 0, 1, 1,
0.5488266, 0.8031849, -0.4182127, 0.2352941, 0, 1, 1,
0.5554513, -0.451542, 2.111423, 0.2431373, 0, 1, 1,
0.5554961, -1.663024, 3.003747, 0.2470588, 0, 1, 1,
0.5564042, 0.5282052, 0.8783123, 0.254902, 0, 1, 1,
0.5597206, 1.39287, 0.6290732, 0.2588235, 0, 1, 1,
0.5600281, -0.6706181, 2.781438, 0.2666667, 0, 1, 1,
0.566468, 0.7588655, -0.6896641, 0.2705882, 0, 1, 1,
0.5691641, 0.6485144, 0.4002469, 0.2784314, 0, 1, 1,
0.5707206, -0.542708, 1.566018, 0.282353, 0, 1, 1,
0.5754378, -1.789273, 2.791204, 0.2901961, 0, 1, 1,
0.5766449, 1.463452, -0.8592998, 0.2941177, 0, 1, 1,
0.5905805, -1.121767, 2.694977, 0.3019608, 0, 1, 1,
0.5917677, -0.2573628, 2.761925, 0.3098039, 0, 1, 1,
0.5923913, -0.5836868, 2.523156, 0.3137255, 0, 1, 1,
0.6008667, -2.750471, 3.358019, 0.3215686, 0, 1, 1,
0.6142884, 1.486094, -0.7000028, 0.3254902, 0, 1, 1,
0.6303495, 0.1514078, 0.8740934, 0.3333333, 0, 1, 1,
0.630614, -0.6028054, 5.046021, 0.3372549, 0, 1, 1,
0.6408936, -1.185906, 1.14047, 0.345098, 0, 1, 1,
0.641193, 0.8393867, 0.1122742, 0.3490196, 0, 1, 1,
0.6413571, -0.1220806, 2.835223, 0.3568628, 0, 1, 1,
0.64476, 0.3767472, 1.030833, 0.3607843, 0, 1, 1,
0.644968, -1.130304, 3.862609, 0.3686275, 0, 1, 1,
0.6452039, 0.9660366, 0.7661524, 0.372549, 0, 1, 1,
0.6535043, 0.9091413, 1.529978, 0.3803922, 0, 1, 1,
0.6565875, 2.294845, -0.885671, 0.3843137, 0, 1, 1,
0.6578767, 0.01637465, 1.093503, 0.3921569, 0, 1, 1,
0.659218, -0.6367901, 4.399873, 0.3960784, 0, 1, 1,
0.660244, -0.257605, 2.322934, 0.4039216, 0, 1, 1,
0.6610326, -0.2547571, 3.524756, 0.4117647, 0, 1, 1,
0.6616978, 0.4294785, 1.987375, 0.4156863, 0, 1, 1,
0.6683754, -0.3245221, 1.522042, 0.4235294, 0, 1, 1,
0.6693177, 0.3659794, 1.211722, 0.427451, 0, 1, 1,
0.6747286, 0.5366139, 2.148388, 0.4352941, 0, 1, 1,
0.6766399, 0.9809318, -0.7309858, 0.4392157, 0, 1, 1,
0.6774775, -0.03679339, 2.273692, 0.4470588, 0, 1, 1,
0.6806026, 0.8815659, -0.7275771, 0.4509804, 0, 1, 1,
0.6806319, -1.282282, 4.398995, 0.4588235, 0, 1, 1,
0.6816263, -0.5044767, 1.541643, 0.4627451, 0, 1, 1,
0.6818644, -1.946981, 1.990214, 0.4705882, 0, 1, 1,
0.6847475, -1.714964, 3.671485, 0.4745098, 0, 1, 1,
0.6896651, 0.2855112, 1.811519, 0.4823529, 0, 1, 1,
0.6918895, -0.7944896, 3.460316, 0.4862745, 0, 1, 1,
0.6936481, 1.149344, 0.9038242, 0.4941176, 0, 1, 1,
0.6962899, 0.5267043, 1.079554, 0.5019608, 0, 1, 1,
0.6984621, 0.247623, 1.714485, 0.5058824, 0, 1, 1,
0.7040449, 0.3809685, 1.958489, 0.5137255, 0, 1, 1,
0.7084345, -1.002996, 3.17142, 0.5176471, 0, 1, 1,
0.7107654, 1.398894, -0.3385258, 0.5254902, 0, 1, 1,
0.7148404, 1.855363, 0.5191405, 0.5294118, 0, 1, 1,
0.7177717, 0.7791272, 1.201862, 0.5372549, 0, 1, 1,
0.7181625, 0.2989846, 1.996642, 0.5411765, 0, 1, 1,
0.7187836, 0.6706274, 2.047524, 0.5490196, 0, 1, 1,
0.7207431, -2.408822, 2.2146, 0.5529412, 0, 1, 1,
0.7226726, 0.9861413, 0.6536285, 0.5607843, 0, 1, 1,
0.7273456, -1.349979, 2.887367, 0.5647059, 0, 1, 1,
0.7274832, -1.725124, 2.699006, 0.572549, 0, 1, 1,
0.7370067, -0.9988617, 4.403267, 0.5764706, 0, 1, 1,
0.7401836, -0.1333311, -0.2759863, 0.5843138, 0, 1, 1,
0.7490442, -1.215322, 2.94892, 0.5882353, 0, 1, 1,
0.7505363, 0.4367327, 2.136382, 0.5960785, 0, 1, 1,
0.7518938, 0.7393361, 1.132921, 0.6039216, 0, 1, 1,
0.7548445, 0.09574974, -0.5380869, 0.6078432, 0, 1, 1,
0.759695, -0.201195, 0.8653732, 0.6156863, 0, 1, 1,
0.7599252, -0.09973262, 3.025412, 0.6196079, 0, 1, 1,
0.7605607, -0.3045161, 0.4133708, 0.627451, 0, 1, 1,
0.7644346, -1.087408, 2.721135, 0.6313726, 0, 1, 1,
0.7645973, -1.195713, 1.975084, 0.6392157, 0, 1, 1,
0.7657868, -1.93729, 2.876058, 0.6431373, 0, 1, 1,
0.771139, 1.631179, 1.677835, 0.6509804, 0, 1, 1,
0.7757973, -0.3465124, 4.425426, 0.654902, 0, 1, 1,
0.7758476, 0.8013771, 0.3223723, 0.6627451, 0, 1, 1,
0.779938, 1.353662, 1.522169, 0.6666667, 0, 1, 1,
0.7853119, 0.6862821, 2.374792, 0.6745098, 0, 1, 1,
0.7881966, 2.050817, -1.147605, 0.6784314, 0, 1, 1,
0.7926152, 1.087844, 0.4686363, 0.6862745, 0, 1, 1,
0.8074235, 0.4184983, 1.850542, 0.6901961, 0, 1, 1,
0.8093109, 1.161033, -0.1594212, 0.6980392, 0, 1, 1,
0.8094991, -0.1108729, 0.5099279, 0.7058824, 0, 1, 1,
0.8115851, -0.5414354, 2.415078, 0.7098039, 0, 1, 1,
0.8133816, -1.319273, 2.199373, 0.7176471, 0, 1, 1,
0.8135702, -0.5890521, 2.109816, 0.7215686, 0, 1, 1,
0.8159609, 0.1903806, 1.994383, 0.7294118, 0, 1, 1,
0.8160635, -0.548295, 1.514959, 0.7333333, 0, 1, 1,
0.8184596, 0.478223, 1.041424, 0.7411765, 0, 1, 1,
0.8230234, -0.07422119, 2.994779, 0.7450981, 0, 1, 1,
0.8335108, -0.1298732, 3.790148, 0.7529412, 0, 1, 1,
0.8344808, 1.822839, 0.7166805, 0.7568628, 0, 1, 1,
0.8364522, -0.1792155, 2.221529, 0.7647059, 0, 1, 1,
0.8380417, 1.019788, -2.262353, 0.7686275, 0, 1, 1,
0.8453735, -1.903728, 0.9531473, 0.7764706, 0, 1, 1,
0.8471867, 2.648583, 0.2448786, 0.7803922, 0, 1, 1,
0.8475851, 0.4712537, 2.428088, 0.7882353, 0, 1, 1,
0.8508301, -0.3797045, 1.34227, 0.7921569, 0, 1, 1,
0.8598139, -0.5123739, 1.752962, 0.8, 0, 1, 1,
0.8616355, -0.08380444, 1.819868, 0.8078431, 0, 1, 1,
0.8633176, -0.8325592, 1.652788, 0.8117647, 0, 1, 1,
0.8633777, -1.264703, 2.040415, 0.8196079, 0, 1, 1,
0.8646895, 0.01533744, 0.6271528, 0.8235294, 0, 1, 1,
0.8650013, 0.02865089, 1.691043, 0.8313726, 0, 1, 1,
0.8706117, 0.7539211, -0.9053245, 0.8352941, 0, 1, 1,
0.870709, 0.878831, 1.804422, 0.8431373, 0, 1, 1,
0.8733751, 2.775979, -0.2419579, 0.8470588, 0, 1, 1,
0.874244, 1.183237, 0.02036618, 0.854902, 0, 1, 1,
0.8784384, -0.6099899, 2.391871, 0.8588235, 0, 1, 1,
0.8788152, 0.08341896, 1.642193, 0.8666667, 0, 1, 1,
0.8798483, -0.09586001, 2.034544, 0.8705882, 0, 1, 1,
0.8814471, -3.119068, 2.555576, 0.8784314, 0, 1, 1,
0.8942987, 0.901687, 0.6459297, 0.8823529, 0, 1, 1,
0.8982933, 1.308661, 0.3942783, 0.8901961, 0, 1, 1,
0.901022, 2.14008, 0.6653981, 0.8941177, 0, 1, 1,
0.9062591, -0.474067, -0.04555776, 0.9019608, 0, 1, 1,
0.9126735, 0.3149703, 0.9280472, 0.9098039, 0, 1, 1,
0.915616, 0.0357857, -0.01114715, 0.9137255, 0, 1, 1,
0.9209905, 0.8218241, 1.457968, 0.9215686, 0, 1, 1,
0.9363795, 1.19746, 1.377096, 0.9254902, 0, 1, 1,
0.9403639, 0.6112799, 0.7949082, 0.9333333, 0, 1, 1,
0.9546771, -1.337307, 3.884663, 0.9372549, 0, 1, 1,
0.9636871, 0.04168642, 1.581065, 0.945098, 0, 1, 1,
0.9662037, -1.493573, 3.451218, 0.9490196, 0, 1, 1,
0.9674531, 0.786015, 0.001700593, 0.9568627, 0, 1, 1,
0.9727647, -0.6588967, 3.891039, 0.9607843, 0, 1, 1,
0.9762802, 0.997534, 1.155717, 0.9686275, 0, 1, 1,
0.9801406, 1.550297, 0.7371814, 0.972549, 0, 1, 1,
0.9851975, -1.082641, 2.153279, 0.9803922, 0, 1, 1,
0.9912732, -0.2932405, 3.564155, 0.9843137, 0, 1, 1,
0.9980383, 0.4911114, 1.341338, 0.9921569, 0, 1, 1,
1.006021, 0.7400086, -1.176766, 0.9960784, 0, 1, 1,
1.018226, -1.106769, 2.360208, 1, 0, 0.9960784, 1,
1.019865, -0.6035677, 3.323145, 1, 0, 0.9882353, 1,
1.020838, 0.2850007, 1.462487, 1, 0, 0.9843137, 1,
1.026318, 0.08489352, 2.868888, 1, 0, 0.9764706, 1,
1.026415, -0.263663, 0.5424013, 1, 0, 0.972549, 1,
1.028252, 1.198579, 1.475188, 1, 0, 0.9647059, 1,
1.029717, 0.140886, 0.1642027, 1, 0, 0.9607843, 1,
1.030177, 0.7966794, 0.1301516, 1, 0, 0.9529412, 1,
1.035424, 0.7732328, 0.2338369, 1, 0, 0.9490196, 1,
1.037276, 1.222182, 0.7833161, 1, 0, 0.9411765, 1,
1.038569, 0.9484185, -1.48601, 1, 0, 0.9372549, 1,
1.040213, -0.1368564, 0.8598905, 1, 0, 0.9294118, 1,
1.045879, -0.1941113, 3.769934, 1, 0, 0.9254902, 1,
1.045908, 0.5368367, 0.3447375, 1, 0, 0.9176471, 1,
1.046119, 0.8605126, 0.6359287, 1, 0, 0.9137255, 1,
1.047077, 0.315349, 1.513631, 1, 0, 0.9058824, 1,
1.053556, 0.1066238, 0.02799617, 1, 0, 0.9019608, 1,
1.05479, -0.2563427, 2.729662, 1, 0, 0.8941177, 1,
1.05686, -0.8206788, 1.497839, 1, 0, 0.8862745, 1,
1.066927, 0.2407836, 1.742276, 1, 0, 0.8823529, 1,
1.067014, -1.126471, 1.980392, 1, 0, 0.8745098, 1,
1.06993, -0.9648371, 2.838747, 1, 0, 0.8705882, 1,
1.073409, -1.600753, 0.7925071, 1, 0, 0.8627451, 1,
1.074735, -1.419111, 1.906414, 1, 0, 0.8588235, 1,
1.075788, 2.198318, -1.589314, 1, 0, 0.8509804, 1,
1.076727, -1.101897, 2.434262, 1, 0, 0.8470588, 1,
1.084115, 0.8186482, 0.3116781, 1, 0, 0.8392157, 1,
1.0849, 2.309228, 1.339244, 1, 0, 0.8352941, 1,
1.085634, 0.461012, 0.3138568, 1, 0, 0.827451, 1,
1.090527, -1.315425, 1.12065, 1, 0, 0.8235294, 1,
1.090982, -0.5367889, 1.371833, 1, 0, 0.8156863, 1,
1.113034, 0.1371112, 1.297558, 1, 0, 0.8117647, 1,
1.129861, -0.600015, 1.911457, 1, 0, 0.8039216, 1,
1.135515, 0.2217641, 0.4325511, 1, 0, 0.7960784, 1,
1.150092, -0.8332527, 2.878685, 1, 0, 0.7921569, 1,
1.167107, -0.9399133, 3.373584, 1, 0, 0.7843137, 1,
1.17075, 0.3753479, 1.357831, 1, 0, 0.7803922, 1,
1.172701, -0.2015469, 2.18671, 1, 0, 0.772549, 1,
1.179667, -1.393092, 1.424263, 1, 0, 0.7686275, 1,
1.182423, 0.08642284, 0.5631175, 1, 0, 0.7607843, 1,
1.185404, 0.300471, 3.999965, 1, 0, 0.7568628, 1,
1.186637, 0.5781054, 1.135549, 1, 0, 0.7490196, 1,
1.196551, -0.2010037, 2.352526, 1, 0, 0.7450981, 1,
1.196626, 0.195151, 2.412796, 1, 0, 0.7372549, 1,
1.198265, 0.3789377, 2.280149, 1, 0, 0.7333333, 1,
1.198356, -0.4964334, 0.6893134, 1, 0, 0.7254902, 1,
1.204873, 0.9138218, 1.204455, 1, 0, 0.7215686, 1,
1.206008, 0.6608287, 2.811971, 1, 0, 0.7137255, 1,
1.207426, -1.259325, 3.633523, 1, 0, 0.7098039, 1,
1.208255, 0.09608217, 1.548608, 1, 0, 0.7019608, 1,
1.217447, -0.443745, 2.906029, 1, 0, 0.6941177, 1,
1.217898, 2.52111, -1.13385, 1, 0, 0.6901961, 1,
1.220181, 0.3238214, 2.021976, 1, 0, 0.682353, 1,
1.234448, -0.8088108, 2.793757, 1, 0, 0.6784314, 1,
1.236021, 0.06961484, 1.892891, 1, 0, 0.6705883, 1,
1.236532, 0.04593414, 0.3203787, 1, 0, 0.6666667, 1,
1.248108, -0.4651075, 1.388954, 1, 0, 0.6588235, 1,
1.254441, -0.3046523, 0.946385, 1, 0, 0.654902, 1,
1.256706, -0.3656101, 1.269678, 1, 0, 0.6470588, 1,
1.263118, 0.1106561, -0.36713, 1, 0, 0.6431373, 1,
1.263795, 1.542073, 0.8334277, 1, 0, 0.6352941, 1,
1.268305, 1.010821, 1.85705, 1, 0, 0.6313726, 1,
1.269203, 0.6410929, 1.695744, 1, 0, 0.6235294, 1,
1.273318, 0.5161201, -0.008705568, 1, 0, 0.6196079, 1,
1.273938, 1.770576, 0.5532218, 1, 0, 0.6117647, 1,
1.280494, -0.3338622, 0.6034172, 1, 0, 0.6078432, 1,
1.282259, 0.08870787, 1.531474, 1, 0, 0.6, 1,
1.285166, -0.9132113, 3.465884, 1, 0, 0.5921569, 1,
1.285181, -0.6500543, 0.658159, 1, 0, 0.5882353, 1,
1.288786, -0.9739064, 3.281542, 1, 0, 0.5803922, 1,
1.297269, 0.8563307, 2.326154, 1, 0, 0.5764706, 1,
1.302423, 0.6024149, 1.090871, 1, 0, 0.5686275, 1,
1.316034, -0.2770272, 1.162911, 1, 0, 0.5647059, 1,
1.316554, 0.2653618, 1.003181, 1, 0, 0.5568628, 1,
1.316937, 0.2709065, 1.359829, 1, 0, 0.5529412, 1,
1.326037, 0.8981197, 0.8711631, 1, 0, 0.5450981, 1,
1.327537, -0.5069752, 3.675893, 1, 0, 0.5411765, 1,
1.33593, 1.531318, 0.895291, 1, 0, 0.5333334, 1,
1.354846, 0.3553041, 0.1319993, 1, 0, 0.5294118, 1,
1.359794, -0.4614291, 1.853803, 1, 0, 0.5215687, 1,
1.364418, 0.6005405, 0.3675669, 1, 0, 0.5176471, 1,
1.367034, -0.8995057, 1.98977, 1, 0, 0.509804, 1,
1.368647, -0.3064964, 2.775519, 1, 0, 0.5058824, 1,
1.379252, 0.1685706, 1.50102, 1, 0, 0.4980392, 1,
1.385215, 0.5601287, 0.8035899, 1, 0, 0.4901961, 1,
1.393906, 1.417273, 1.299822, 1, 0, 0.4862745, 1,
1.405002, 0.7540724, 0.4730799, 1, 0, 0.4784314, 1,
1.409913, -0.4745198, 1.932782, 1, 0, 0.4745098, 1,
1.411083, -1.477811, 1.464916, 1, 0, 0.4666667, 1,
1.412026, 0.8015288, 1.608865, 1, 0, 0.4627451, 1,
1.416412, 0.3342029, 1.525802, 1, 0, 0.454902, 1,
1.420344, 1.200119, 1.506829, 1, 0, 0.4509804, 1,
1.438002, -0.3167887, 2.886949, 1, 0, 0.4431373, 1,
1.446241, 0.05511739, 0.2321007, 1, 0, 0.4392157, 1,
1.451403, 1.418428, 0.3608578, 1, 0, 0.4313726, 1,
1.457702, 0.04939976, 0.1047471, 1, 0, 0.427451, 1,
1.460862, 0.02673094, 0.8512809, 1, 0, 0.4196078, 1,
1.467705, 0.6903926, 2.917077, 1, 0, 0.4156863, 1,
1.468462, 0.4996568, 0.8706919, 1, 0, 0.4078431, 1,
1.469432, 0.9878232, 2.801926, 1, 0, 0.4039216, 1,
1.490294, -1.792733, 2.434435, 1, 0, 0.3960784, 1,
1.490377, 0.3015892, -0.0964978, 1, 0, 0.3882353, 1,
1.495735, -0.06156391, 0.6649634, 1, 0, 0.3843137, 1,
1.505684, -1.459195, 2.04855, 1, 0, 0.3764706, 1,
1.511899, -0.267742, 1.159435, 1, 0, 0.372549, 1,
1.520918, 0.6082754, -0.1909623, 1, 0, 0.3647059, 1,
1.540285, 0.4886364, 3.78164, 1, 0, 0.3607843, 1,
1.591885, 2.415668, 0.7709017, 1, 0, 0.3529412, 1,
1.607687, 0.439687, 2.718727, 1, 0, 0.3490196, 1,
1.611589, -0.03709123, 2.897445, 1, 0, 0.3411765, 1,
1.614748, 1.149425, -0.2599386, 1, 0, 0.3372549, 1,
1.630112, -0.1553864, 1.972261, 1, 0, 0.3294118, 1,
1.630227, 0.5294412, 1.268505, 1, 0, 0.3254902, 1,
1.638494, 0.2132771, 2.499235, 1, 0, 0.3176471, 1,
1.6401, -0.1705584, 1.682466, 1, 0, 0.3137255, 1,
1.649251, 0.8532175, 2.202895, 1, 0, 0.3058824, 1,
1.651817, 0.4045905, 2.920344, 1, 0, 0.2980392, 1,
1.673653, -0.841515, 2.805335, 1, 0, 0.2941177, 1,
1.683267, 0.1982752, 1.681581, 1, 0, 0.2862745, 1,
1.701002, 0.570296, 0.7518108, 1, 0, 0.282353, 1,
1.703072, 1.715137, 2.560648, 1, 0, 0.2745098, 1,
1.703795, 0.6423734, 0.7459908, 1, 0, 0.2705882, 1,
1.710183, 0.3422877, 2.835507, 1, 0, 0.2627451, 1,
1.738323, -0.8722643, 1.220697, 1, 0, 0.2588235, 1,
1.743695, -0.5215915, 1.784159, 1, 0, 0.2509804, 1,
1.769295, -0.2514961, 2.475108, 1, 0, 0.2470588, 1,
1.813733, -0.3454236, 0.9842091, 1, 0, 0.2392157, 1,
1.817715, -1.463782, 2.638947, 1, 0, 0.2352941, 1,
1.822211, -0.1253795, 2.845625, 1, 0, 0.227451, 1,
1.843409, 1.315671, 1.732271, 1, 0, 0.2235294, 1,
1.851947, 2.638258, 1.960358, 1, 0, 0.2156863, 1,
1.853906, 0.8937753, 2.192168, 1, 0, 0.2117647, 1,
1.855551, 0.9152755, 0.8378958, 1, 0, 0.2039216, 1,
1.879808, -0.0726112, -0.3551772, 1, 0, 0.1960784, 1,
1.894316, -0.9828522, 0.9807205, 1, 0, 0.1921569, 1,
1.895143, 0.5753202, 2.191445, 1, 0, 0.1843137, 1,
1.90062, -0.2117197, 0.9794643, 1, 0, 0.1803922, 1,
1.910502, -0.06031118, 2.107198, 1, 0, 0.172549, 1,
1.915685, 1.142596, -1.715943, 1, 0, 0.1686275, 1,
1.930406, 0.9984682, 0.2356652, 1, 0, 0.1607843, 1,
1.965018, -2.590899, 4.277629, 1, 0, 0.1568628, 1,
1.969747, -0.5578548, 2.236138, 1, 0, 0.1490196, 1,
1.973155, -0.6249255, 1.545568, 1, 0, 0.145098, 1,
2.006866, 0.1876758, 0.08968262, 1, 0, 0.1372549, 1,
2.040514, -0.7516792, 3.276231, 1, 0, 0.1333333, 1,
2.041039, 0.008509221, 1.251463, 1, 0, 0.1254902, 1,
2.043236, 0.8499665, 0.2933532, 1, 0, 0.1215686, 1,
2.045182, -1.423196, 2.252934, 1, 0, 0.1137255, 1,
2.057046, -0.3092669, 0.9620275, 1, 0, 0.1098039, 1,
2.065652, 1.034898, 2.343091, 1, 0, 0.1019608, 1,
2.091806, 0.1877215, 1.988322, 1, 0, 0.09411765, 1,
2.116577, -2.156614, 0.3931123, 1, 0, 0.09019608, 1,
2.131793, 0.8191713, 0.3643913, 1, 0, 0.08235294, 1,
2.191899, -1.429867, 5.11315, 1, 0, 0.07843138, 1,
2.214681, -0.9415264, 1.566679, 1, 0, 0.07058824, 1,
2.291642, -0.305136, 1.96179, 1, 0, 0.06666667, 1,
2.306695, 0.41655, 0.8662702, 1, 0, 0.05882353, 1,
2.330194, -0.4130749, 0.9189292, 1, 0, 0.05490196, 1,
2.363631, 0.3404553, 1.988198, 1, 0, 0.04705882, 1,
2.370969, -1.829442, 3.965675, 1, 0, 0.04313726, 1,
2.423473, 0.3691474, 1.910777, 1, 0, 0.03529412, 1,
2.497558, 0.2375639, 0.275213, 1, 0, 0.03137255, 1,
2.594618, 1.323541, 0.5174849, 1, 0, 0.02352941, 1,
2.658161, -0.8633052, 4.406435, 1, 0, 0.01960784, 1,
2.75757, 0.6278279, 2.55953, 1, 0, 0.01176471, 1,
2.88217, 1.629344, -0.5386839, 1, 0, 0.007843138, 1
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
-0.01773214, -4.367663, -7.386102, 0, -0.5, 0.5, 0.5,
-0.01773214, -4.367663, -7.386102, 1, -0.5, 0.5, 0.5,
-0.01773214, -4.367663, -7.386102, 1, 1.5, 0.5, 0.5,
-0.01773214, -4.367663, -7.386102, 0, 1.5, 0.5, 0.5
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
-3.900701, -0.278165, -7.386102, 0, -0.5, 0.5, 0.5,
-3.900701, -0.278165, -7.386102, 1, -0.5, 0.5, 0.5,
-3.900701, -0.278165, -7.386102, 1, 1.5, 0.5, 0.5,
-3.900701, -0.278165, -7.386102, 0, 1.5, 0.5, 0.5
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
-3.900701, -4.367663, 0.02166486, 0, -0.5, 0.5, 0.5,
-3.900701, -4.367663, 0.02166486, 1, -0.5, 0.5, 0.5,
-3.900701, -4.367663, 0.02166486, 1, 1.5, 0.5, 0.5,
-3.900701, -4.367663, 0.02166486, 0, 1.5, 0.5, 0.5
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
-2, -3.423933, -5.676617,
2, -3.423933, -5.676617,
-2, -3.423933, -5.676617,
-2, -3.581222, -5.961531,
-1, -3.423933, -5.676617,
-1, -3.581222, -5.961531,
0, -3.423933, -5.676617,
0, -3.581222, -5.961531,
1, -3.423933, -5.676617,
1, -3.581222, -5.961531,
2, -3.423933, -5.676617,
2, -3.581222, -5.961531
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
"-2",
"-1",
"0",
"1",
"2"
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
-2, -3.895798, -6.53136, 0, -0.5, 0.5, 0.5,
-2, -3.895798, -6.53136, 1, -0.5, 0.5, 0.5,
-2, -3.895798, -6.53136, 1, 1.5, 0.5, 0.5,
-2, -3.895798, -6.53136, 0, 1.5, 0.5, 0.5,
-1, -3.895798, -6.53136, 0, -0.5, 0.5, 0.5,
-1, -3.895798, -6.53136, 1, -0.5, 0.5, 0.5,
-1, -3.895798, -6.53136, 1, 1.5, 0.5, 0.5,
-1, -3.895798, -6.53136, 0, 1.5, 0.5, 0.5,
0, -3.895798, -6.53136, 0, -0.5, 0.5, 0.5,
0, -3.895798, -6.53136, 1, -0.5, 0.5, 0.5,
0, -3.895798, -6.53136, 1, 1.5, 0.5, 0.5,
0, -3.895798, -6.53136, 0, 1.5, 0.5, 0.5,
1, -3.895798, -6.53136, 0, -0.5, 0.5, 0.5,
1, -3.895798, -6.53136, 1, -0.5, 0.5, 0.5,
1, -3.895798, -6.53136, 1, 1.5, 0.5, 0.5,
1, -3.895798, -6.53136, 0, 1.5, 0.5, 0.5,
2, -3.895798, -6.53136, 0, -0.5, 0.5, 0.5,
2, -3.895798, -6.53136, 1, -0.5, 0.5, 0.5,
2, -3.895798, -6.53136, 1, 1.5, 0.5, 0.5,
2, -3.895798, -6.53136, 0, 1.5, 0.5, 0.5
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
-3.004631, -3, -5.676617,
-3.004631, 2, -5.676617,
-3.004631, -3, -5.676617,
-3.153976, -3, -5.961531,
-3.004631, -2, -5.676617,
-3.153976, -2, -5.961531,
-3.004631, -1, -5.676617,
-3.153976, -1, -5.961531,
-3.004631, 0, -5.676617,
-3.153976, 0, -5.961531,
-3.004631, 1, -5.676617,
-3.153976, 1, -5.961531,
-3.004631, 2, -5.676617,
-3.153976, 2, -5.961531
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
"2"
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
-3.452666, -3, -6.53136, 0, -0.5, 0.5, 0.5,
-3.452666, -3, -6.53136, 1, -0.5, 0.5, 0.5,
-3.452666, -3, -6.53136, 1, 1.5, 0.5, 0.5,
-3.452666, -3, -6.53136, 0, 1.5, 0.5, 0.5,
-3.452666, -2, -6.53136, 0, -0.5, 0.5, 0.5,
-3.452666, -2, -6.53136, 1, -0.5, 0.5, 0.5,
-3.452666, -2, -6.53136, 1, 1.5, 0.5, 0.5,
-3.452666, -2, -6.53136, 0, 1.5, 0.5, 0.5,
-3.452666, -1, -6.53136, 0, -0.5, 0.5, 0.5,
-3.452666, -1, -6.53136, 1, -0.5, 0.5, 0.5,
-3.452666, -1, -6.53136, 1, 1.5, 0.5, 0.5,
-3.452666, -1, -6.53136, 0, 1.5, 0.5, 0.5,
-3.452666, 0, -6.53136, 0, -0.5, 0.5, 0.5,
-3.452666, 0, -6.53136, 1, -0.5, 0.5, 0.5,
-3.452666, 0, -6.53136, 1, 1.5, 0.5, 0.5,
-3.452666, 0, -6.53136, 0, 1.5, 0.5, 0.5,
-3.452666, 1, -6.53136, 0, -0.5, 0.5, 0.5,
-3.452666, 1, -6.53136, 1, -0.5, 0.5, 0.5,
-3.452666, 1, -6.53136, 1, 1.5, 0.5, 0.5,
-3.452666, 1, -6.53136, 0, 1.5, 0.5, 0.5,
-3.452666, 2, -6.53136, 0, -0.5, 0.5, 0.5,
-3.452666, 2, -6.53136, 1, -0.5, 0.5, 0.5,
-3.452666, 2, -6.53136, 1, 1.5, 0.5, 0.5,
-3.452666, 2, -6.53136, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.004631, -3.423933, -4,
-3.004631, -3.423933, 4,
-3.004631, -3.423933, -4,
-3.153976, -3.581222, -4,
-3.004631, -3.423933, -2,
-3.153976, -3.581222, -2,
-3.004631, -3.423933, 0,
-3.153976, -3.581222, 0,
-3.004631, -3.423933, 2,
-3.153976, -3.581222, 2,
-3.004631, -3.423933, 4,
-3.153976, -3.581222, 4
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
-3.452666, -3.895798, -4, 0, -0.5, 0.5, 0.5,
-3.452666, -3.895798, -4, 1, -0.5, 0.5, 0.5,
-3.452666, -3.895798, -4, 1, 1.5, 0.5, 0.5,
-3.452666, -3.895798, -4, 0, 1.5, 0.5, 0.5,
-3.452666, -3.895798, -2, 0, -0.5, 0.5, 0.5,
-3.452666, -3.895798, -2, 1, -0.5, 0.5, 0.5,
-3.452666, -3.895798, -2, 1, 1.5, 0.5, 0.5,
-3.452666, -3.895798, -2, 0, 1.5, 0.5, 0.5,
-3.452666, -3.895798, 0, 0, -0.5, 0.5, 0.5,
-3.452666, -3.895798, 0, 1, -0.5, 0.5, 0.5,
-3.452666, -3.895798, 0, 1, 1.5, 0.5, 0.5,
-3.452666, -3.895798, 0, 0, 1.5, 0.5, 0.5,
-3.452666, -3.895798, 2, 0, -0.5, 0.5, 0.5,
-3.452666, -3.895798, 2, 1, -0.5, 0.5, 0.5,
-3.452666, -3.895798, 2, 1, 1.5, 0.5, 0.5,
-3.452666, -3.895798, 2, 0, 1.5, 0.5, 0.5,
-3.452666, -3.895798, 4, 0, -0.5, 0.5, 0.5,
-3.452666, -3.895798, 4, 1, -0.5, 0.5, 0.5,
-3.452666, -3.895798, 4, 1, 1.5, 0.5, 0.5,
-3.452666, -3.895798, 4, 0, 1.5, 0.5, 0.5
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
-3.004631, -3.423933, -5.676617,
-3.004631, 2.867603, -5.676617,
-3.004631, -3.423933, 5.719947,
-3.004631, 2.867603, 5.719947,
-3.004631, -3.423933, -5.676617,
-3.004631, -3.423933, 5.719947,
-3.004631, 2.867603, -5.676617,
-3.004631, 2.867603, 5.719947,
-3.004631, -3.423933, -5.676617,
2.969167, -3.423933, -5.676617,
-3.004631, -3.423933, 5.719947,
2.969167, -3.423933, 5.719947,
-3.004631, 2.867603, -5.676617,
2.969167, 2.867603, -5.676617,
-3.004631, 2.867603, 5.719947,
2.969167, 2.867603, 5.719947,
2.969167, -3.423933, -5.676617,
2.969167, 2.867603, -5.676617,
2.969167, -3.423933, 5.719947,
2.969167, 2.867603, 5.719947,
2.969167, -3.423933, -5.676617,
2.969167, -3.423933, 5.719947,
2.969167, 2.867603, -5.676617,
2.969167, 2.867603, 5.719947
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
var radius = 7.64826;
var distance = 34.02797;
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
mvMatrix.translate( 0.01773214, 0.278165, -0.02166486 );
mvMatrix.scale( 1.384287, 1.314377, 0.7256089 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.02797);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Hexadecyl_cyclopropa<-read.table("Hexadecyl_cyclopropa.xyz")
```

```
## Error in read.table("Hexadecyl_cyclopropa.xyz"): no lines available in input
```

```r
x<-Hexadecyl_cyclopropa$V2
```

```
## Error in eval(expr, envir, enclos): object 'Hexadecyl_cyclopropa' not found
```

```r
y<-Hexadecyl_cyclopropa$V3
```

```
## Error in eval(expr, envir, enclos): object 'Hexadecyl_cyclopropa' not found
```

```r
z<-Hexadecyl_cyclopropa$V4
```

```
## Error in eval(expr, envir, enclos): object 'Hexadecyl_cyclopropa' not found
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
-2.917634, 0.4663704, -1.782115, 0, 0, 1, 1, 1,
-2.891616, 0.4991292, -1.380218, 1, 0, 0, 1, 1,
-2.832697, -0.5747988, -2.650269, 1, 0, 0, 1, 1,
-2.664755, 0.1431063, -0.4960993, 1, 0, 0, 1, 1,
-2.631475, -1.086805, -0.801398, 1, 0, 0, 1, 1,
-2.469825, -0.2644236, -0.4225282, 1, 0, 0, 1, 1,
-2.466922, 0.03895367, -1.898528, 0, 0, 0, 1, 1,
-2.401813, -0.9333928, 0.1411881, 0, 0, 0, 1, 1,
-2.399569, -2.32477, -2.071282, 0, 0, 0, 1, 1,
-2.363736, 0.8608925, -2.000052, 0, 0, 0, 1, 1,
-2.311471, -0.4667371, -1.564961, 0, 0, 0, 1, 1,
-2.283972, 0.3095544, -2.790706, 0, 0, 0, 1, 1,
-2.282194, 0.5120017, -2.87498, 0, 0, 0, 1, 1,
-2.258503, 0.0441029, -0.659615, 1, 1, 1, 1, 1,
-2.109963, 1.101015, -2.033094, 1, 1, 1, 1, 1,
-2.065713, 1.048682, -2.060578, 1, 1, 1, 1, 1,
-2.049203, 2.410477, -1.079262, 1, 1, 1, 1, 1,
-2.044309, 1.087638, 0.6572966, 1, 1, 1, 1, 1,
-2.027931, -0.7098852, -2.54355, 1, 1, 1, 1, 1,
-2.017004, 1.219326, -1.693809, 1, 1, 1, 1, 1,
-1.992863, 1.375916, -0.3929782, 1, 1, 1, 1, 1,
-1.93906, 0.3787329, -2.105607, 1, 1, 1, 1, 1,
-1.937672, -1.476152, -1.121178, 1, 1, 1, 1, 1,
-1.932475, -0.4816377, -2.590439, 1, 1, 1, 1, 1,
-1.929076, 0.8909513, -0.6319443, 1, 1, 1, 1, 1,
-1.918002, -0.4536008, -0.03954826, 1, 1, 1, 1, 1,
-1.912805, 0.3611237, -1.017904, 1, 1, 1, 1, 1,
-1.903534, 2.380798, -1.242487, 1, 1, 1, 1, 1,
-1.864558, 1.592498, -2.494316, 0, 0, 1, 1, 1,
-1.848913, 0.152861, -1.556195, 1, 0, 0, 1, 1,
-1.843896, -0.1981656, -1.046151, 1, 0, 0, 1, 1,
-1.813161, -0.2467907, -1.988731, 1, 0, 0, 1, 1,
-1.812139, -0.08765729, -2.174212, 1, 0, 0, 1, 1,
-1.801062, 1.736347, -0.9248772, 1, 0, 0, 1, 1,
-1.791775, 0.5360115, -1.376494, 0, 0, 0, 1, 1,
-1.788231, -1.128394, -2.010167, 0, 0, 0, 1, 1,
-1.782689, 0.6538082, -1.597932, 0, 0, 0, 1, 1,
-1.763601, 0.6355727, -0.7498545, 0, 0, 0, 1, 1,
-1.759043, -1.276193, -1.149961, 0, 0, 0, 1, 1,
-1.752071, -0.485009, -2.730699, 0, 0, 0, 1, 1,
-1.744135, -0.8562787, -2.387609, 0, 0, 0, 1, 1,
-1.722887, 0.6270307, -1.428142, 1, 1, 1, 1, 1,
-1.721254, 2.132049, -0.1486668, 1, 1, 1, 1, 1,
-1.720114, -0.4345718, -2.215209, 1, 1, 1, 1, 1,
-1.718678, -0.6804572, -0.9719829, 1, 1, 1, 1, 1,
-1.697721, 0.6555735, 0.386815, 1, 1, 1, 1, 1,
-1.690492, 0.05489995, -0.4513976, 1, 1, 1, 1, 1,
-1.690489, 1.557957, -0.3848096, 1, 1, 1, 1, 1,
-1.670388, -1.976808, -0.6577492, 1, 1, 1, 1, 1,
-1.664658, -1.157734, -1.513911, 1, 1, 1, 1, 1,
-1.661656, 0.1203604, -0.4204256, 1, 1, 1, 1, 1,
-1.64193, 1.849865, 0.2226972, 1, 1, 1, 1, 1,
-1.630822, 0.9796781, -1.061291, 1, 1, 1, 1, 1,
-1.625178, 0.04088107, -1.237669, 1, 1, 1, 1, 1,
-1.589907, 0.2036583, -1.059389, 1, 1, 1, 1, 1,
-1.588535, 1.112584, -2.878981, 1, 1, 1, 1, 1,
-1.582633, -2.210274, -3.2141, 0, 0, 1, 1, 1,
-1.581507, 0.9943066, -1.729332, 1, 0, 0, 1, 1,
-1.577342, 0.7130472, 0.08729748, 1, 0, 0, 1, 1,
-1.570558, -1.479238, -2.514584, 1, 0, 0, 1, 1,
-1.564143, -0.7716874, -1.745729, 1, 0, 0, 1, 1,
-1.560044, 1.8671, -0.6949687, 1, 0, 0, 1, 1,
-1.55823, 0.2308409, -1.57007, 0, 0, 0, 1, 1,
-1.556975, 1.299107, -1.741016, 0, 0, 0, 1, 1,
-1.549381, -0.3644732, -1.366422, 0, 0, 0, 1, 1,
-1.538891, 1.178392, -0.1388485, 0, 0, 0, 1, 1,
-1.528815, 0.9801778, -0.9201202, 0, 0, 0, 1, 1,
-1.522829, 1.06315, -1.10266, 0, 0, 0, 1, 1,
-1.519084, 1.259574, -0.1693474, 0, 0, 0, 1, 1,
-1.502989, 0.497149, -1.207966, 1, 1, 1, 1, 1,
-1.487577, -0.5598197, -1.19854, 1, 1, 1, 1, 1,
-1.487028, -1.48785, -3.984851, 1, 1, 1, 1, 1,
-1.474249, 1.517569, -1.151573, 1, 1, 1, 1, 1,
-1.470499, 1.105282, -2.93395, 1, 1, 1, 1, 1,
-1.457851, -0.1503227, -1.624774, 1, 1, 1, 1, 1,
-1.453922, -2.150179, -2.134131, 1, 1, 1, 1, 1,
-1.439407, -0.8654002, -1.844677, 1, 1, 1, 1, 1,
-1.430215, 1.170158, -1.169657, 1, 1, 1, 1, 1,
-1.425921, 1.271816, -0.1034166, 1, 1, 1, 1, 1,
-1.421811, 0.2043829, -0.616643, 1, 1, 1, 1, 1,
-1.404635, 1.294995, -0.0664883, 1, 1, 1, 1, 1,
-1.403502, 0.5596361, -1.206693, 1, 1, 1, 1, 1,
-1.388432, 1.251428, -0.1935544, 1, 1, 1, 1, 1,
-1.38681, 0.2993291, -1.068386, 1, 1, 1, 1, 1,
-1.383436, 0.8451529, -2.108664, 0, 0, 1, 1, 1,
-1.381157, 1.187664, 1.835192, 1, 0, 0, 1, 1,
-1.366886, 0.5865637, -2.844151, 1, 0, 0, 1, 1,
-1.364451, -0.3002517, -1.86912, 1, 0, 0, 1, 1,
-1.356094, -1.336232, -2.914975, 1, 0, 0, 1, 1,
-1.354363, -0.9630775, -2.035841, 1, 0, 0, 1, 1,
-1.350684, -1.136954, -2.288815, 0, 0, 0, 1, 1,
-1.347026, -0.336288, -3.164958, 0, 0, 0, 1, 1,
-1.344599, 2.258502, -1.019596, 0, 0, 0, 1, 1,
-1.34056, 1.532955, 1.220771, 0, 0, 0, 1, 1,
-1.339274, -3.332309, -1.517501, 0, 0, 0, 1, 1,
-1.330184, -2.716045, -1.567042, 0, 0, 0, 1, 1,
-1.327521, -0.08257635, -0.5999745, 0, 0, 0, 1, 1,
-1.312697, -0.0214936, -1.898392, 1, 1, 1, 1, 1,
-1.311536, -0.1510283, -2.578123, 1, 1, 1, 1, 1,
-1.305704, -1.131971, -3.210382, 1, 1, 1, 1, 1,
-1.302351, -2.287827, -4.276902, 1, 1, 1, 1, 1,
-1.294384, 0.6104362, -1.799047, 1, 1, 1, 1, 1,
-1.2829, 0.6074768, -2.715733, 1, 1, 1, 1, 1,
-1.265802, 0.1930388, -0.5840625, 1, 1, 1, 1, 1,
-1.263749, -1.56975, -4.256909, 1, 1, 1, 1, 1,
-1.262242, 1.338711, -1.553544, 1, 1, 1, 1, 1,
-1.257011, 0.1446662, -1.194883, 1, 1, 1, 1, 1,
-1.25615, -0.4756288, -0.8874509, 1, 1, 1, 1, 1,
-1.243382, 1.183034, -2.627859, 1, 1, 1, 1, 1,
-1.242532, 0.29829, -3.342614, 1, 1, 1, 1, 1,
-1.236525, -0.2677325, -1.348088, 1, 1, 1, 1, 1,
-1.234734, 1.115144, -0.9331533, 1, 1, 1, 1, 1,
-1.231058, 0.1182226, -0.8099631, 0, 0, 1, 1, 1,
-1.221172, 0.5815201, -1.715911, 1, 0, 0, 1, 1,
-1.204557, 0.08350369, -2.349948, 1, 0, 0, 1, 1,
-1.197089, 0.6835523, -1.73398, 1, 0, 0, 1, 1,
-1.192884, -1.948625, -3.244662, 1, 0, 0, 1, 1,
-1.190595, -1.108994, -1.826783, 1, 0, 0, 1, 1,
-1.190067, -0.4283943, -3.062314, 0, 0, 0, 1, 1,
-1.189935, -0.5005841, -0.6693216, 0, 0, 0, 1, 1,
-1.187589, 0.8044914, -1.152031, 0, 0, 0, 1, 1,
-1.183586, 1.611797, -1.511013, 0, 0, 0, 1, 1,
-1.183342, 0.5408662, -0.38232, 0, 0, 0, 1, 1,
-1.176942, 0.9106167, -0.8516501, 0, 0, 0, 1, 1,
-1.176065, 1.120185, -0.6651821, 0, 0, 0, 1, 1,
-1.172172, -0.3799226, -0.7668831, 1, 1, 1, 1, 1,
-1.17119, 1.380019, -0.9572628, 1, 1, 1, 1, 1,
-1.163341, -1.841872, -1.804015, 1, 1, 1, 1, 1,
-1.161812, 0.3880249, -1.227263, 1, 1, 1, 1, 1,
-1.15441, -1.620463, -3.9806, 1, 1, 1, 1, 1,
-1.147963, 0.6950563, 1.368369, 1, 1, 1, 1, 1,
-1.140557, -0.2570894, -1.621277, 1, 1, 1, 1, 1,
-1.134984, 1.026456, -0.344112, 1, 1, 1, 1, 1,
-1.134788, -0.7930614, -2.712649, 1, 1, 1, 1, 1,
-1.129974, -0.2057282, -1.000087, 1, 1, 1, 1, 1,
-1.129596, -0.1367884, -3.122238, 1, 1, 1, 1, 1,
-1.120797, -1.902272, -2.124846, 1, 1, 1, 1, 1,
-1.11792, -0.04359569, -1.99901, 1, 1, 1, 1, 1,
-1.109925, -0.6529508, -1.030173, 1, 1, 1, 1, 1,
-1.103735, -0.3532, -1.483771, 1, 1, 1, 1, 1,
-1.101617, -0.5466201, -1.4942, 0, 0, 1, 1, 1,
-1.100597, 0.3600191, -2.883263, 1, 0, 0, 1, 1,
-1.099544, -1.735838, -2.705949, 1, 0, 0, 1, 1,
-1.097947, -0.07494831, -2.434618, 1, 0, 0, 1, 1,
-1.096263, 0.6668549, 0.2019705, 1, 0, 0, 1, 1,
-1.09277, 0.2167299, -0.4809793, 1, 0, 0, 1, 1,
-1.091589, 0.506007, -1.036349, 0, 0, 0, 1, 1,
-1.070177, 0.3793639, -0.5182428, 0, 0, 0, 1, 1,
-1.06891, -0.7860972, -2.040748, 0, 0, 0, 1, 1,
-1.067308, 0.1470216, -2.61461, 0, 0, 0, 1, 1,
-1.062673, -0.1439336, -1.100967, 0, 0, 0, 1, 1,
-1.057862, -0.2979811, -3.158986, 0, 0, 0, 1, 1,
-1.057603, -0.1207379, -2.442036, 0, 0, 0, 1, 1,
-1.056822, -1.054837, -3.058043, 1, 1, 1, 1, 1,
-1.054467, 1.007881, -1.62135, 1, 1, 1, 1, 1,
-1.046154, -0.6472297, -1.446064, 1, 1, 1, 1, 1,
-1.042474, -0.266053, -1.309649, 1, 1, 1, 1, 1,
-1.041647, -0.366471, -2.920337, 1, 1, 1, 1, 1,
-1.027288, 1.145351, -1.936247, 1, 1, 1, 1, 1,
-1.025051, 0.1063936, -3.093983, 1, 1, 1, 1, 1,
-1.022184, -0.9188771, -2.652355, 1, 1, 1, 1, 1,
-1.021398, -1.445862, -3.100441, 1, 1, 1, 1, 1,
-1.015888, 0.105372, -2.685866, 1, 1, 1, 1, 1,
-1.006784, 1.146075, -0.8580772, 1, 1, 1, 1, 1,
-0.998168, 0.3798961, -2.67763, 1, 1, 1, 1, 1,
-0.9967843, 0.7378142, -0.1727586, 1, 1, 1, 1, 1,
-0.9919633, 0.3248901, -2.468874, 1, 1, 1, 1, 1,
-0.9839005, 0.4140302, -1.333393, 1, 1, 1, 1, 1,
-0.9767734, 0.8006258, 1.1031, 0, 0, 1, 1, 1,
-0.9705451, 0.4784849, -2.058146, 1, 0, 0, 1, 1,
-0.9698758, -0.009016157, -3.399858, 1, 0, 0, 1, 1,
-0.9695796, 1.171877, -0.4110299, 1, 0, 0, 1, 1,
-0.9687415, -0.8205616, -0.5991459, 1, 0, 0, 1, 1,
-0.9640079, 0.1595943, -2.35736, 1, 0, 0, 1, 1,
-0.9636622, 0.396029, -2.195848, 0, 0, 0, 1, 1,
-0.9568357, 1.113174, 0.7770171, 0, 0, 0, 1, 1,
-0.950097, 2.023022, 0.8847428, 0, 0, 0, 1, 1,
-0.9461311, -0.2507825, -0.6932424, 0, 0, 0, 1, 1,
-0.9441921, 0.6241983, -2.399774, 0, 0, 0, 1, 1,
-0.9420736, 0.428485, -2.195724, 0, 0, 0, 1, 1,
-0.9420674, -1.775927, -1.872704, 0, 0, 0, 1, 1,
-0.9405456, -1.025591, -2.147378, 1, 1, 1, 1, 1,
-0.9354038, -0.5254424, -1.936953, 1, 1, 1, 1, 1,
-0.926927, -1.468662, -0.6424345, 1, 1, 1, 1, 1,
-0.9253466, 0.4862194, 1.420889, 1, 1, 1, 1, 1,
-0.9235015, 0.05204006, -0.7986784, 1, 1, 1, 1, 1,
-0.9186543, 1.386361, -1.783658, 1, 1, 1, 1, 1,
-0.9136996, -1.179848, -0.9079794, 1, 1, 1, 1, 1,
-0.9131907, -0.1879454, -1.804572, 1, 1, 1, 1, 1,
-0.9086843, -0.4350433, -2.390697, 1, 1, 1, 1, 1,
-0.9051569, 0.6963615, 0.7644961, 1, 1, 1, 1, 1,
-0.9050778, -0.05761366, -2.427951, 1, 1, 1, 1, 1,
-0.890393, -1.211377, -1.089724, 1, 1, 1, 1, 1,
-0.8901454, 0.8755353, -0.3138444, 1, 1, 1, 1, 1,
-0.887799, -2.262051, -2.090401, 1, 1, 1, 1, 1,
-0.8863621, -1.797357, -3.979798, 1, 1, 1, 1, 1,
-0.8858114, -1.398554, -1.995268, 0, 0, 1, 1, 1,
-0.8855323, -0.5584286, -2.388273, 1, 0, 0, 1, 1,
-0.8840209, 0.6349554, -2.226722, 1, 0, 0, 1, 1,
-0.8777025, -0.4707547, -0.686752, 1, 0, 0, 1, 1,
-0.8713483, -1.105516, -3.23934, 1, 0, 0, 1, 1,
-0.869997, 0.5511413, 0.3226011, 1, 0, 0, 1, 1,
-0.8644689, 0.08347771, -1.041888, 0, 0, 0, 1, 1,
-0.8572629, 1.093183, -0.07631441, 0, 0, 0, 1, 1,
-0.8569816, 0.2565743, -0.8627626, 0, 0, 0, 1, 1,
-0.8563047, -1.339044, -1.595219, 0, 0, 0, 1, 1,
-0.8458508, -0.3110259, -1.533028, 0, 0, 0, 1, 1,
-0.8406864, -0.7233972, -0.7364836, 0, 0, 0, 1, 1,
-0.8402635, 1.625215, -0.1362913, 0, 0, 0, 1, 1,
-0.8397917, -0.1463381, -2.823557, 1, 1, 1, 1, 1,
-0.8368625, -0.9901186, -3.405424, 1, 1, 1, 1, 1,
-0.8348579, 0.9773144, -0.9651861, 1, 1, 1, 1, 1,
-0.8334356, -0.5608305, -2.777272, 1, 1, 1, 1, 1,
-0.830247, 0.2442241, -0.9363533, 1, 1, 1, 1, 1,
-0.8297545, 1.776689, 0.5176625, 1, 1, 1, 1, 1,
-0.8251972, 1.86659, 0.6550667, 1, 1, 1, 1, 1,
-0.8197299, 1.131186, -2.19102, 1, 1, 1, 1, 1,
-0.8195201, -0.4719631, -1.611699, 1, 1, 1, 1, 1,
-0.8038862, -0.8160776, -2.254181, 1, 1, 1, 1, 1,
-0.8036858, -1.1631, -3.140007, 1, 1, 1, 1, 1,
-0.7980538, 0.7437336, -2.776838, 1, 1, 1, 1, 1,
-0.7963737, 0.3886513, 0.7977712, 1, 1, 1, 1, 1,
-0.7893209, -1.184314, -2.466172, 1, 1, 1, 1, 1,
-0.7857025, 0.4008936, -0.2910247, 1, 1, 1, 1, 1,
-0.7818535, -0.8315912, -1.569076, 0, 0, 1, 1, 1,
-0.7799727, -0.1070812, -3.023265, 1, 0, 0, 1, 1,
-0.7757011, 0.5412834, -1.072408, 1, 0, 0, 1, 1,
-0.7743905, 0.3804836, 0.2511881, 1, 0, 0, 1, 1,
-0.7716673, 0.3168286, -0.6276718, 1, 0, 0, 1, 1,
-0.7697216, 0.8392619, -1.379197, 1, 0, 0, 1, 1,
-0.7654464, -0.5548467, -1.836397, 0, 0, 0, 1, 1,
-0.7646442, -1.656766, -1.740847, 0, 0, 0, 1, 1,
-0.7640296, 0.4528794, -2.232926, 0, 0, 0, 1, 1,
-0.7584252, 1.133204, -1.04669, 0, 0, 0, 1, 1,
-0.7471556, -0.6185272, -1.638211, 0, 0, 0, 1, 1,
-0.7469003, 0.4056198, -2.752705, 0, 0, 0, 1, 1,
-0.7465392, 0.5167655, -1.472586, 0, 0, 0, 1, 1,
-0.7418368, -1.143411, -3.12565, 1, 1, 1, 1, 1,
-0.7416751, 0.8977218, -0.2032089, 1, 1, 1, 1, 1,
-0.7415963, -1.280605, -2.754889, 1, 1, 1, 1, 1,
-0.7390913, -0.3968153, -2.395287, 1, 1, 1, 1, 1,
-0.7348909, 0.561476, -0.2237926, 1, 1, 1, 1, 1,
-0.7251521, -0.4524511, -2.98401, 1, 1, 1, 1, 1,
-0.716809, -1.196868, -2.590469, 1, 1, 1, 1, 1,
-0.7162877, -1.011313, -2.021039, 1, 1, 1, 1, 1,
-0.7058676, 0.5422551, 0.1708333, 1, 1, 1, 1, 1,
-0.7022111, -0.6467494, -3.9837, 1, 1, 1, 1, 1,
-0.6975571, -0.2181899, -0.6712315, 1, 1, 1, 1, 1,
-0.6971247, 0.5168694, -0.9191465, 1, 1, 1, 1, 1,
-0.6963585, -1.386954, -3.00216, 1, 1, 1, 1, 1,
-0.6962166, -0.3490492, -2.075017, 1, 1, 1, 1, 1,
-0.691345, -0.7383866, -2.146173, 1, 1, 1, 1, 1,
-0.6853108, -0.4560716, -1.906165, 0, 0, 1, 1, 1,
-0.6849158, -1.930619, -2.350057, 1, 0, 0, 1, 1,
-0.68325, 0.2884447, -2.102259, 1, 0, 0, 1, 1,
-0.6804147, -0.1747557, -1.468349, 1, 0, 0, 1, 1,
-0.6786283, 1.671009, -0.03232094, 1, 0, 0, 1, 1,
-0.6752678, -0.06010291, -3.318871, 1, 0, 0, 1, 1,
-0.6748292, 0.2824756, -2.459187, 0, 0, 0, 1, 1,
-0.6708372, 1.328792, -1.196259, 0, 0, 0, 1, 1,
-0.670723, 0.1402658, -0.4001419, 0, 0, 0, 1, 1,
-0.6706811, 1.747884, -2.627662, 0, 0, 0, 1, 1,
-0.670023, 1.65356, -1.031613, 0, 0, 0, 1, 1,
-0.6674061, -0.07356197, -1.625677, 0, 0, 0, 1, 1,
-0.6624915, 0.804731, -0.2805999, 0, 0, 0, 1, 1,
-0.6624183, 0.4035461, -1.46943, 1, 1, 1, 1, 1,
-0.6605347, -1.239388, -2.812008, 1, 1, 1, 1, 1,
-0.6581679, -0.1264936, -2.401661, 1, 1, 1, 1, 1,
-0.6570216, -0.3657293, -2.19212, 1, 1, 1, 1, 1,
-0.653321, 0.535772, -0.7855464, 1, 1, 1, 1, 1,
-0.6529723, -0.5622945, -0.1526469, 1, 1, 1, 1, 1,
-0.6495463, 0.374752, -1.769583, 1, 1, 1, 1, 1,
-0.6456552, 0.2479568, -1.956537, 1, 1, 1, 1, 1,
-0.645403, -1.215746, -4.4538, 1, 1, 1, 1, 1,
-0.644341, -0.5518085, -1.671795, 1, 1, 1, 1, 1,
-0.6390891, -0.4205048, -0.3397291, 1, 1, 1, 1, 1,
-0.6320745, 1.364679, 0.145736, 1, 1, 1, 1, 1,
-0.6288127, 0.8217977, -1.397537, 1, 1, 1, 1, 1,
-0.6267747, -0.9120049, -2.492, 1, 1, 1, 1, 1,
-0.6235582, 0.1019718, -1.090807, 1, 1, 1, 1, 1,
-0.6137971, 0.08669814, -1.079514, 0, 0, 1, 1, 1,
-0.6128012, 0.7081726, -2.402947, 1, 0, 0, 1, 1,
-0.6103869, 0.3779069, -0.2296268, 1, 0, 0, 1, 1,
-0.6075387, -0.3545485, -2.730057, 1, 0, 0, 1, 1,
-0.6044579, -1.681726, -1.649273, 1, 0, 0, 1, 1,
-0.604258, 0.6487562, -0.9296594, 1, 0, 0, 1, 1,
-0.5972559, 1.240551, 1.891994, 0, 0, 0, 1, 1,
-0.5965524, -0.1958267, -0.08596589, 0, 0, 0, 1, 1,
-0.5858465, -0.08108672, -1.630419, 0, 0, 0, 1, 1,
-0.580431, 0.1950911, -1.263187, 0, 0, 0, 1, 1,
-0.5799652, 0.8417857, -1.746516, 0, 0, 0, 1, 1,
-0.5643802, 1.73325, -0.7449536, 0, 0, 0, 1, 1,
-0.5623801, 0.08773167, -1.819883, 0, 0, 0, 1, 1,
-0.5579703, 1.19106, -0.9540353, 1, 1, 1, 1, 1,
-0.5534704, 1.532356, -1.183358, 1, 1, 1, 1, 1,
-0.5497366, -1.215799, -3.182379, 1, 1, 1, 1, 1,
-0.5496156, 0.7741126, -2.106058, 1, 1, 1, 1, 1,
-0.5429798, -0.3129862, -2.375645, 1, 1, 1, 1, 1,
-0.5388799, -0.1898501, -3.214807, 1, 1, 1, 1, 1,
-0.5384931, 0.217911, -1.959204, 1, 1, 1, 1, 1,
-0.5365748, 0.5914732, -0.1265332, 1, 1, 1, 1, 1,
-0.5365186, 0.4405261, -0.8212193, 1, 1, 1, 1, 1,
-0.5361855, 0.386286, -1.024204, 1, 1, 1, 1, 1,
-0.5267372, -0.8306661, -0.887813, 1, 1, 1, 1, 1,
-0.525113, -0.61795, -3.268666, 1, 1, 1, 1, 1,
-0.5230086, -0.7979515, -2.902916, 1, 1, 1, 1, 1,
-0.518461, 0.6509643, -1.304321, 1, 1, 1, 1, 1,
-0.5109452, -0.02225332, -2.379268, 1, 1, 1, 1, 1,
-0.5077176, 0.3319174, -0.6894287, 0, 0, 1, 1, 1,
-0.5077128, 0.2930212, -1.570469, 1, 0, 0, 1, 1,
-0.5041499, -0.8157167, -3.044986, 1, 0, 0, 1, 1,
-0.5028318, 1.133036, -1.796864, 1, 0, 0, 1, 1,
-0.5020304, 0.2294385, -0.4235546, 1, 0, 0, 1, 1,
-0.4992309, -1.777548, -3.630027, 1, 0, 0, 1, 1,
-0.496477, -0.3686293, -0.9025862, 0, 0, 0, 1, 1,
-0.4961931, -0.4870184, -1.894688, 0, 0, 0, 1, 1,
-0.4959172, -1.771404, -3.131303, 0, 0, 0, 1, 1,
-0.4955017, 1.071621, -1.687789, 0, 0, 0, 1, 1,
-0.4920974, -0.9470519, -2.326542, 0, 0, 0, 1, 1,
-0.4893391, -0.8927795, -2.732344, 0, 0, 0, 1, 1,
-0.4864999, -0.884379, -2.900999, 0, 0, 0, 1, 1,
-0.4859952, 0.1486997, -2.935206, 1, 1, 1, 1, 1,
-0.4827318, 1.928861, 1.177855, 1, 1, 1, 1, 1,
-0.4804263, -0.8237314, -4.7659, 1, 1, 1, 1, 1,
-0.4786668, -0.8602374, -2.99067, 1, 1, 1, 1, 1,
-0.4783784, -0.6491877, -2.609838, 1, 1, 1, 1, 1,
-0.4783573, -1.196832, -3.681006, 1, 1, 1, 1, 1,
-0.4778609, -0.1728996, -2.008079, 1, 1, 1, 1, 1,
-0.4770311, 0.04077583, -1.807253, 1, 1, 1, 1, 1,
-0.4723462, 0.2064946, -1.575785, 1, 1, 1, 1, 1,
-0.4646994, -2.053849, -4.711968, 1, 1, 1, 1, 1,
-0.4593943, 0.2553875, -1.252008, 1, 1, 1, 1, 1,
-0.458864, 1.38944, 0.7437558, 1, 1, 1, 1, 1,
-0.4564245, 0.3483639, -3.574163, 1, 1, 1, 1, 1,
-0.4464205, 0.3040621, -1.416951, 1, 1, 1, 1, 1,
-0.4414625, 0.6343926, -1.732357, 1, 1, 1, 1, 1,
-0.4378439, 1.803, 0.6023829, 0, 0, 1, 1, 1,
-0.4375415, -0.4686013, -3.56467, 1, 0, 0, 1, 1,
-0.4328464, 0.7435101, -1.614431, 1, 0, 0, 1, 1,
-0.4266151, 0.398625, -1.264771, 1, 0, 0, 1, 1,
-0.4258468, 0.4819307, -0.6986262, 1, 0, 0, 1, 1,
-0.4240063, 0.01835283, -1.29123, 1, 0, 0, 1, 1,
-0.4217049, 0.3909485, -1.934612, 0, 0, 0, 1, 1,
-0.4203813, -0.4699925, -2.334096, 0, 0, 0, 1, 1,
-0.4202538, 1.838839, 1.159755, 0, 0, 0, 1, 1,
-0.4040742, 0.3821597, 1.081003, 0, 0, 0, 1, 1,
-0.401665, 0.2737025, -0.1722988, 0, 0, 0, 1, 1,
-0.3992243, 0.607924, -0.6661326, 0, 0, 0, 1, 1,
-0.3893427, 0.7691265, -1.42541, 0, 0, 0, 1, 1,
-0.384521, -0.07269424, -2.377701, 1, 1, 1, 1, 1,
-0.3818985, -0.8974769, -2.71968, 1, 1, 1, 1, 1,
-0.3711248, -1.230889, -1.606831, 1, 1, 1, 1, 1,
-0.3659129, -1.885688, -1.425359, 1, 1, 1, 1, 1,
-0.3615572, 0.390493, -1.010477, 1, 1, 1, 1, 1,
-0.3596892, 0.2835481, -1.695558, 1, 1, 1, 1, 1,
-0.3596321, 0.7347144, -1.067291, 1, 1, 1, 1, 1,
-0.3576613, 0.8638631, 0.7388917, 1, 1, 1, 1, 1,
-0.3553495, -0.552167, -3.369943, 1, 1, 1, 1, 1,
-0.3549907, 1.443582, -0.8587278, 1, 1, 1, 1, 1,
-0.3545046, -0.8772794, -2.747618, 1, 1, 1, 1, 1,
-0.3537764, -1.098874, -2.152647, 1, 1, 1, 1, 1,
-0.3533859, 0.2392951, 0.4394208, 1, 1, 1, 1, 1,
-0.3532966, -0.448361, -2.015556, 1, 1, 1, 1, 1,
-0.3514673, 1.293461, -1.158207, 1, 1, 1, 1, 1,
-0.3455725, 0.8201891, -0.9459965, 0, 0, 1, 1, 1,
-0.3408578, 0.1809955, -1.964312, 1, 0, 0, 1, 1,
-0.3396301, 0.4309222, -0.8991896, 1, 0, 0, 1, 1,
-0.3391062, 0.5219991, -0.7690052, 1, 0, 0, 1, 1,
-0.3369822, -0.1208744, -4.265923, 1, 0, 0, 1, 1,
-0.3364168, 0.6466262, -0.5064576, 1, 0, 0, 1, 1,
-0.3318978, -1.335901, -1.55118, 0, 0, 0, 1, 1,
-0.3287247, 1.744377, -0.6164836, 0, 0, 0, 1, 1,
-0.3258874, -0.4092385, -3.925884, 0, 0, 0, 1, 1,
-0.3202514, 0.1069693, -1.801064, 0, 0, 0, 1, 1,
-0.313894, -0.06303731, -0.8862622, 0, 0, 0, 1, 1,
-0.3134723, 0.2894866, -2.588749, 0, 0, 0, 1, 1,
-0.3133838, 0.6686718, -1.432728, 0, 0, 0, 1, 1,
-0.3132005, -1.111827, -3.165075, 1, 1, 1, 1, 1,
-0.3127736, -1.081173, -3.240862, 1, 1, 1, 1, 1,
-0.3115137, -0.8951609, -1.404954, 1, 1, 1, 1, 1,
-0.3085199, 0.8223988, -2.103786, 1, 1, 1, 1, 1,
-0.3078733, -0.4526197, -4.24784, 1, 1, 1, 1, 1,
-0.3066462, -0.3968444, -3.265669, 1, 1, 1, 1, 1,
-0.3064175, -1.07238, -2.296627, 1, 1, 1, 1, 1,
-0.305653, -1.609212, -2.062907, 1, 1, 1, 1, 1,
-0.3047475, 0.362535, 0.4231225, 1, 1, 1, 1, 1,
-0.3017398, -1.337468, -3.923909, 1, 1, 1, 1, 1,
-0.2969276, 1.14455, 0.2491161, 1, 1, 1, 1, 1,
-0.2952034, 0.8040667, -1.71792, 1, 1, 1, 1, 1,
-0.2933396, -0.07662714, -1.057992, 1, 1, 1, 1, 1,
-0.2925073, 0.4983144, 0.2582015, 1, 1, 1, 1, 1,
-0.2837982, -0.4282674, -2.452868, 1, 1, 1, 1, 1,
-0.2827681, 0.6807994, 0.3521492, 0, 0, 1, 1, 1,
-0.2792526, 2.503521, -0.7829301, 1, 0, 0, 1, 1,
-0.2791704, -0.1142747, -1.805988, 1, 0, 0, 1, 1,
-0.2786137, 0.4005497, -1.348028, 1, 0, 0, 1, 1,
-0.2786095, 0.1456862, -1.022306, 1, 0, 0, 1, 1,
-0.2784303, -1.331947, -2.510107, 1, 0, 0, 1, 1,
-0.2781382, -0.3728865, -3.089168, 0, 0, 0, 1, 1,
-0.2778037, -0.2827365, -3.651397, 0, 0, 0, 1, 1,
-0.2772894, 0.9796112, 0.7621617, 0, 0, 0, 1, 1,
-0.2764468, -0.9318355, -2.817683, 0, 0, 0, 1, 1,
-0.2702487, 1.166673, -0.2769454, 0, 0, 0, 1, 1,
-0.2677227, 0.1599473, -1.676594, 0, 0, 0, 1, 1,
-0.2670352, 0.03683682, -0.8710109, 0, 0, 0, 1, 1,
-0.2645868, 0.09522286, -2.156025, 1, 1, 1, 1, 1,
-0.2628212, -0.1100432, -1.440798, 1, 1, 1, 1, 1,
-0.2607359, 0.8815605, -1.164226, 1, 1, 1, 1, 1,
-0.2588754, -0.1594886, -3.406741, 1, 1, 1, 1, 1,
-0.2586829, -0.550741, -3.534141, 1, 1, 1, 1, 1,
-0.2577444, -0.6447359, -1.506559, 1, 1, 1, 1, 1,
-0.2548543, -0.7152443, -2.275536, 1, 1, 1, 1, 1,
-0.2547257, 1.319529, 0.002107047, 1, 1, 1, 1, 1,
-0.2522725, -0.7422375, -2.619021, 1, 1, 1, 1, 1,
-0.2512505, 0.1051765, -0.2247834, 1, 1, 1, 1, 1,
-0.2480675, -0.1833063, -2.131655, 1, 1, 1, 1, 1,
-0.2453527, 1.34613, -2.773427, 1, 1, 1, 1, 1,
-0.2395573, -0.07792488, -1.943076, 1, 1, 1, 1, 1,
-0.2395459, 0.3871811, -0.7419421, 1, 1, 1, 1, 1,
-0.2372361, 0.2184497, 0.002803764, 1, 1, 1, 1, 1,
-0.2365366, -0.4753262, -2.360791, 0, 0, 1, 1, 1,
-0.2347462, 0.7912377, 0.02753607, 1, 0, 0, 1, 1,
-0.2346266, -0.05612311, -2.506866, 1, 0, 0, 1, 1,
-0.2283646, -1.134802, -1.313242, 1, 0, 0, 1, 1,
-0.228043, -0.04556569, -2.029269, 1, 0, 0, 1, 1,
-0.228016, 1.238178, -0.8382875, 1, 0, 0, 1, 1,
-0.2254154, -0.8697333, -2.15431, 0, 0, 0, 1, 1,
-0.2232115, 0.5461867, 0.9073673, 0, 0, 0, 1, 1,
-0.2229366, 0.465345, -0.9736615, 0, 0, 0, 1, 1,
-0.2203711, -1.558432, -4.140904, 0, 0, 0, 1, 1,
-0.220093, -0.3515287, -4.533089, 0, 0, 0, 1, 1,
-0.218889, -0.5940886, -2.422685, 0, 0, 0, 1, 1,
-0.208903, 0.5871225, -0.8971077, 0, 0, 0, 1, 1,
-0.2038588, -1.083825, -2.519807, 1, 1, 1, 1, 1,
-0.2023125, -0.1114966, -1.389578, 1, 1, 1, 1, 1,
-0.2000918, 1.974083, 0.1783038, 1, 1, 1, 1, 1,
-0.1976511, -2.164979, -3.570964, 1, 1, 1, 1, 1,
-0.1957964, -0.3842171, -0.04207486, 1, 1, 1, 1, 1,
-0.194542, -0.5648398, -3.733283, 1, 1, 1, 1, 1,
-0.1843498, 1.303412, -1.316163, 1, 1, 1, 1, 1,
-0.182103, 0.8676907, 0.3050255, 1, 1, 1, 1, 1,
-0.1802613, 0.364475, -2.056973, 1, 1, 1, 1, 1,
-0.1793621, -0.8592557, -3.268441, 1, 1, 1, 1, 1,
-0.1754754, -0.7927497, -5.06531, 1, 1, 1, 1, 1,
-0.1737597, 0.3232122, 0.7416616, 1, 1, 1, 1, 1,
-0.17325, 1.564077, -0.1611229, 1, 1, 1, 1, 1,
-0.1710594, 0.1342798, -0.3477433, 1, 1, 1, 1, 1,
-0.1652983, -1.144831, -4.703681, 1, 1, 1, 1, 1,
-0.1644365, 1.730582, -0.5728678, 0, 0, 1, 1, 1,
-0.1618453, -1.929505, -2.150964, 1, 0, 0, 1, 1,
-0.1613657, 0.03672794, -2.13292, 1, 0, 0, 1, 1,
-0.1608888, -0.1195029, -2.764494, 1, 0, 0, 1, 1,
-0.1593946, -2.015732, -4.192619, 1, 0, 0, 1, 1,
-0.1583466, -0.07890934, -1.036958, 1, 0, 0, 1, 1,
-0.1485981, -0.8766319, -4.023867, 0, 0, 0, 1, 1,
-0.1478353, -0.6911265, -2.743973, 0, 0, 0, 1, 1,
-0.1458842, 0.4870152, -1.097688, 0, 0, 0, 1, 1,
-0.1433762, -0.9439446, -2.0892, 0, 0, 0, 1, 1,
-0.1418721, -0.7298328, -3.130678, 0, 0, 0, 1, 1,
-0.1415508, -2.049632, -3.564819, 0, 0, 0, 1, 1,
-0.1383903, -0.8537169, -2.865588, 0, 0, 0, 1, 1,
-0.1381604, 0.6289249, -1.052034, 1, 1, 1, 1, 1,
-0.1371973, -0.08257891, -2.33787, 1, 1, 1, 1, 1,
-0.1363307, -0.515007, -3.022207, 1, 1, 1, 1, 1,
-0.135115, -0.8403435, -1.874526, 1, 1, 1, 1, 1,
-0.1207512, -0.521731, -3.894071, 1, 1, 1, 1, 1,
-0.1178702, -0.3679053, -4.302355, 1, 1, 1, 1, 1,
-0.1174175, 1.255147, 0.549154, 1, 1, 1, 1, 1,
-0.1173342, -1.200206, -2.81267, 1, 1, 1, 1, 1,
-0.1123165, -1.296054, -1.250527, 1, 1, 1, 1, 1,
-0.1090334, 0.07146135, -1.63808, 1, 1, 1, 1, 1,
-0.1074409, 0.2625608, -0.5881972, 1, 1, 1, 1, 1,
-0.1049935, 0.140824, -0.7836031, 1, 1, 1, 1, 1,
-0.1040049, 1.979352, -1.250768, 1, 1, 1, 1, 1,
-0.1015105, 1.122965, 0.3027006, 1, 1, 1, 1, 1,
-0.09756753, 0.5952861, -2.661234, 1, 1, 1, 1, 1,
-0.09529203, -0.4696289, -3.277698, 0, 0, 1, 1, 1,
-0.09514873, -1.344223, -2.051771, 1, 0, 0, 1, 1,
-0.09493861, -0.8472669, -4.132061, 1, 0, 0, 1, 1,
-0.09176653, 0.6595131, -0.8106655, 1, 0, 0, 1, 1,
-0.09140387, -0.6572815, -3.495932, 1, 0, 0, 1, 1,
-0.08555946, 0.1617775, 0.1012324, 1, 0, 0, 1, 1,
-0.08343742, -1.274222, -3.486737, 0, 0, 0, 1, 1,
-0.07921498, -0.5520181, -2.962357, 0, 0, 0, 1, 1,
-0.07832979, 0.1351577, -0.5235801, 0, 0, 0, 1, 1,
-0.07346107, 1.382364, 0.6904939, 0, 0, 0, 1, 1,
-0.06563477, -0.2765597, -2.44255, 0, 0, 0, 1, 1,
-0.06041861, 0.925349, -1.704268, 0, 0, 0, 1, 1,
-0.06011667, -0.005342956, -1.555324, 0, 0, 0, 1, 1,
-0.05923994, 0.3841108, 1.319391, 1, 1, 1, 1, 1,
-0.05901691, 0.4380171, 0.7862789, 1, 1, 1, 1, 1,
-0.05880821, -1.447627, -4.81367, 1, 1, 1, 1, 1,
-0.05704042, -0.4296319, -2.044091, 1, 1, 1, 1, 1,
-0.05521033, 2.183683, 0.8907329, 1, 1, 1, 1, 1,
-0.05433292, -0.02733959, -1.816182, 1, 1, 1, 1, 1,
-0.05034835, -0.4974375, -2.808954, 1, 1, 1, 1, 1,
-0.03720226, -1.060615, -2.992138, 1, 1, 1, 1, 1,
-0.03476662, -1.851059, -4.131759, 1, 1, 1, 1, 1,
-0.02746228, -0.2534754, -5.510648, 1, 1, 1, 1, 1,
-0.02618578, -1.15223, -2.32193, 1, 1, 1, 1, 1,
-0.02499979, -0.5063873, -4.346296, 1, 1, 1, 1, 1,
-0.01893493, 0.3501202, -0.4448174, 1, 1, 1, 1, 1,
-0.01822932, -0.2895723, -0.614058, 1, 1, 1, 1, 1,
-0.0165179, -1.11714, -3.524942, 1, 1, 1, 1, 1,
-0.01336216, -1.2268, -3.087882, 0, 0, 1, 1, 1,
-0.01333608, 0.7487202, -0.6367545, 1, 0, 0, 1, 1,
-0.00540078, -0.6744207, -1.542627, 1, 0, 0, 1, 1,
-0.003822527, 0.5853522, -1.847824, 1, 0, 0, 1, 1,
-0.0032197, -1.499318, -4.008509, 1, 0, 0, 1, 1,
0.001340442, -0.0877038, 4.359427, 1, 0, 0, 1, 1,
0.004923861, -0.5718048, 4.121026, 0, 0, 0, 1, 1,
0.01250329, 0.5887201, -0.7664167, 0, 0, 0, 1, 1,
0.01561943, -0.44776, 2.089391, 0, 0, 0, 1, 1,
0.02149519, -1.434271, 2.477776, 0, 0, 0, 1, 1,
0.03075303, -0.3961645, 3.607619, 0, 0, 0, 1, 1,
0.03440482, 1.284972, 0.7238342, 0, 0, 0, 1, 1,
0.03481456, -0.8128312, 2.044908, 0, 0, 0, 1, 1,
0.03894902, -0.649013, 3.981206, 1, 1, 1, 1, 1,
0.03959414, 0.8584723, -0.5691447, 1, 1, 1, 1, 1,
0.04274569, -1.236597, 2.066645, 1, 1, 1, 1, 1,
0.04831666, 0.228053, 0.4251817, 1, 1, 1, 1, 1,
0.04841758, 1.889926, 0.2602315, 1, 1, 1, 1, 1,
0.04872939, -0.4005636, 1.601054, 1, 1, 1, 1, 1,
0.05351438, -3.036196, 4.283189, 1, 1, 1, 1, 1,
0.05712479, -0.6097947, 4.28453, 1, 1, 1, 1, 1,
0.05794868, 2.418515, -1.002946, 1, 1, 1, 1, 1,
0.06231303, -1.581486, 1.559153, 1, 1, 1, 1, 1,
0.06338875, 0.8877, -1.455646, 1, 1, 1, 1, 1,
0.06856948, -1.303483, 0.7770002, 1, 1, 1, 1, 1,
0.06954733, -0.2983529, 2.614037, 1, 1, 1, 1, 1,
0.07117745, 1.102138, -0.3005368, 1, 1, 1, 1, 1,
0.07305474, 1.461494, -0.6055791, 1, 1, 1, 1, 1,
0.08183651, 0.7649059, -0.0713312, 0, 0, 1, 1, 1,
0.08191492, 0.3021311, -1.203526, 1, 0, 0, 1, 1,
0.08829764, -0.2076487, 1.939031, 1, 0, 0, 1, 1,
0.08984171, -1.692206, 1.815297, 1, 0, 0, 1, 1,
0.09122606, -0.4303022, 2.384376, 1, 0, 0, 1, 1,
0.09718488, 1.159807, 0.9177342, 1, 0, 0, 1, 1,
0.09997891, -2.246459, 4.884741, 0, 0, 0, 1, 1,
0.1001489, -0.7100121, 2.75543, 0, 0, 0, 1, 1,
0.100256, -1.87948, 3.189492, 0, 0, 0, 1, 1,
0.1011367, -0.5271059, 2.695692, 0, 0, 0, 1, 1,
0.1022582, 0.0485131, 0.4748958, 0, 0, 0, 1, 1,
0.1041942, -1.868301, 5.553977, 0, 0, 0, 1, 1,
0.1062915, 0.5871825, -0.388667, 0, 0, 0, 1, 1,
0.1064092, 0.7713599, 0.3572973, 1, 1, 1, 1, 1,
0.1095631, -0.3907243, 1.130755, 1, 1, 1, 1, 1,
0.1108319, -0.08540046, 0.7451677, 1, 1, 1, 1, 1,
0.1140124, 0.1653451, 0.4405657, 1, 1, 1, 1, 1,
0.1145376, 0.8547409, -0.9378465, 1, 1, 1, 1, 1,
0.1178342, -0.4140398, 4.825884, 1, 1, 1, 1, 1,
0.1217671, 0.2839969, -0.2844843, 1, 1, 1, 1, 1,
0.1240057, -1.15015, 4.789948, 1, 1, 1, 1, 1,
0.1247486, 1.741196, 0.237288, 1, 1, 1, 1, 1,
0.1259591, -0.118821, 2.50939, 1, 1, 1, 1, 1,
0.1272237, -0.7080439, 3.327604, 1, 1, 1, 1, 1,
0.1272615, -0.4532975, 0.4722207, 1, 1, 1, 1, 1,
0.1310487, -0.03915633, 1.895884, 1, 1, 1, 1, 1,
0.131782, 1.370856, 0.7624676, 1, 1, 1, 1, 1,
0.131821, -0.3929508, 2.693254, 1, 1, 1, 1, 1,
0.1444075, -2.181134, 1.134368, 0, 0, 1, 1, 1,
0.1480333, 0.1734044, 0.7830631, 1, 0, 0, 1, 1,
0.1508401, -1.941791, 4.80107, 1, 0, 0, 1, 1,
0.1555168, -1.583617, 4.745047, 1, 0, 0, 1, 1,
0.1601314, 0.8259867, 0.4192339, 1, 0, 0, 1, 1,
0.164778, -0.07866731, 0.6901872, 1, 0, 0, 1, 1,
0.1654514, -0.2266439, 3.188667, 0, 0, 0, 1, 1,
0.1666718, 0.3864295, 0.7010012, 0, 0, 0, 1, 1,
0.1678411, -0.6507594, 3.002114, 0, 0, 0, 1, 1,
0.1699792, 0.08787944, 1.140776, 0, 0, 0, 1, 1,
0.1703917, 0.5048313, 0.1494592, 0, 0, 0, 1, 1,
0.1735813, 1.178134, -0.3123743, 0, 0, 0, 1, 1,
0.174737, 1.580582, -0.6280287, 0, 0, 0, 1, 1,
0.1793728, -0.423915, 3.120222, 1, 1, 1, 1, 1,
0.1794229, -0.1518261, 3.134505, 1, 1, 1, 1, 1,
0.1827828, -0.4705266, 4.023117, 1, 1, 1, 1, 1,
0.1867099, 0.4002005, 0.536392, 1, 1, 1, 1, 1,
0.1867452, -1.420174, 3.874822, 1, 1, 1, 1, 1,
0.1871806, -0.04821045, 0.8220474, 1, 1, 1, 1, 1,
0.1887821, -0.4918171, 2.556781, 1, 1, 1, 1, 1,
0.1895986, -1.121989, 2.857288, 1, 1, 1, 1, 1,
0.1945031, 1.325138, -1.183969, 1, 1, 1, 1, 1,
0.1969776, -1.176902, 2.29433, 1, 1, 1, 1, 1,
0.197801, 0.2579757, -0.292725, 1, 1, 1, 1, 1,
0.1997673, 1.000583, -0.189081, 1, 1, 1, 1, 1,
0.2002012, -0.5489234, 2.959267, 1, 1, 1, 1, 1,
0.2021364, -0.1953159, 0.3829342, 1, 1, 1, 1, 1,
0.2027184, 0.02744344, 1.135874, 1, 1, 1, 1, 1,
0.2040417, -2.123215, 3.158638, 0, 0, 1, 1, 1,
0.2094155, 1.160756, -0.2535002, 1, 0, 0, 1, 1,
0.2100724, -0.6340193, 3.983861, 1, 0, 0, 1, 1,
0.2125963, -2.006708, 1.517848, 1, 0, 0, 1, 1,
0.2148921, 2.091081, 1.306034, 1, 0, 0, 1, 1,
0.2174433, -0.2758728, 2.146104, 1, 0, 0, 1, 1,
0.221495, 1.003443, 2.153234, 0, 0, 0, 1, 1,
0.2283988, -1.62674, 3.575629, 0, 0, 0, 1, 1,
0.2289794, 0.1793258, -0.08443133, 0, 0, 0, 1, 1,
0.2333789, -0.857233, 1.800579, 0, 0, 0, 1, 1,
0.2360325, -1.565027, 1.238963, 0, 0, 0, 1, 1,
0.2366024, 1.070401, 0.9936748, 0, 0, 0, 1, 1,
0.2447674, 0.2285569, 0.5905793, 0, 0, 0, 1, 1,
0.2474025, -1.218791, 2.250171, 1, 1, 1, 1, 1,
0.2477658, 0.346758, 0.3556816, 1, 1, 1, 1, 1,
0.25318, 0.3999521, 1.041621, 1, 1, 1, 1, 1,
0.2547827, 0.08450549, 0.05598493, 1, 1, 1, 1, 1,
0.2556028, -0.4444548, 3.779825, 1, 1, 1, 1, 1,
0.2644087, -0.1871786, 1.966127, 1, 1, 1, 1, 1,
0.27627, 1.376853, 0.7955113, 1, 1, 1, 1, 1,
0.2779176, 0.2861426, 0.3920145, 1, 1, 1, 1, 1,
0.2902148, 0.3051535, 1.687345, 1, 1, 1, 1, 1,
0.2933911, -0.3215531, 1.717862, 1, 1, 1, 1, 1,
0.2945196, -0.3340106, 3.045237, 1, 1, 1, 1, 1,
0.2968588, 1.095362, -0.04544167, 1, 1, 1, 1, 1,
0.3015889, -1.050784, 3.830031, 1, 1, 1, 1, 1,
0.3044478, 0.7826309, 1.134725, 1, 1, 1, 1, 1,
0.3060222, 1.283901, 3.665355, 1, 1, 1, 1, 1,
0.3073447, 0.246702, 0.5077612, 0, 0, 1, 1, 1,
0.3092727, -1.707538, 4.433374, 1, 0, 0, 1, 1,
0.3113354, -0.8462254, 4.565361, 1, 0, 0, 1, 1,
0.3133312, 1.092943, -1.476234, 1, 0, 0, 1, 1,
0.3146445, 0.1355522, -0.1481883, 1, 0, 0, 1, 1,
0.3176479, -1.375455, 1.893375, 1, 0, 0, 1, 1,
0.3182383, 0.6038235, 0.1399477, 0, 0, 0, 1, 1,
0.3203032, 0.538921, 2.024255, 0, 0, 0, 1, 1,
0.3205762, 0.7450369, 1.883986, 0, 0, 0, 1, 1,
0.3238076, 0.3274609, -0.2375686, 0, 0, 0, 1, 1,
0.328662, -1.383694, 2.973972, 0, 0, 0, 1, 1,
0.3354159, 1.07036, -1.072563, 0, 0, 0, 1, 1,
0.3370547, -1.025155, 2.84702, 0, 0, 0, 1, 1,
0.337245, -0.4129103, 2.334069, 1, 1, 1, 1, 1,
0.3497708, -0.5672694, 0.9543544, 1, 1, 1, 1, 1,
0.3506896, -0.1357534, 1.100463, 1, 1, 1, 1, 1,
0.3507752, 0.4283988, 0.9734849, 1, 1, 1, 1, 1,
0.3516359, 1.609891, 1.29643, 1, 1, 1, 1, 1,
0.3522227, -0.7198535, 4.143398, 1, 1, 1, 1, 1,
0.3537346, -1.349764, 3.834592, 1, 1, 1, 1, 1,
0.3576555, -0.1712908, 2.228372, 1, 1, 1, 1, 1,
0.3611608, 1.048074, 0.5731114, 1, 1, 1, 1, 1,
0.3623723, -0.6620024, 4.001142, 1, 1, 1, 1, 1,
0.3643143, 0.2498412, 0.839491, 1, 1, 1, 1, 1,
0.3649722, 1.298552, -0.6628733, 1, 1, 1, 1, 1,
0.3661809, 1.028908, 0.7570916, 1, 1, 1, 1, 1,
0.3669392, -0.3226648, 2.759495, 1, 1, 1, 1, 1,
0.3691513, 1.046763, 1.51654, 1, 1, 1, 1, 1,
0.3798137, 0.7186881, 0.2472453, 0, 0, 1, 1, 1,
0.381032, 1.870267, 0.3655353, 1, 0, 0, 1, 1,
0.3813157, 0.2899806, 1.167605, 1, 0, 0, 1, 1,
0.382077, 0.1279124, 1.505439, 1, 0, 0, 1, 1,
0.3860649, -0.1472178, 2.615049, 1, 0, 0, 1, 1,
0.3903528, 0.8244932, 0.3041552, 1, 0, 0, 1, 1,
0.3904511, 1.797703, -1.357682, 0, 0, 0, 1, 1,
0.3939243, 1.063071, 0.2779681, 0, 0, 0, 1, 1,
0.3947675, 1.426506, 0.9467734, 0, 0, 0, 1, 1,
0.396826, 1.666329, -0.461313, 0, 0, 0, 1, 1,
0.4046591, -0.9202003, 2.018645, 0, 0, 0, 1, 1,
0.4093188, -1.511062, 1.089063, 0, 0, 0, 1, 1,
0.4096863, 0.1130322, 0.1182224, 0, 0, 0, 1, 1,
0.4116178, 0.5190387, 0.9461684, 1, 1, 1, 1, 1,
0.4182151, -1.12919, 3.040343, 1, 1, 1, 1, 1,
0.418631, 1.266268, -1.136059, 1, 1, 1, 1, 1,
0.4222225, 0.9420489, 0.9932957, 1, 1, 1, 1, 1,
0.4300319, -0.4718582, 0.9427105, 1, 1, 1, 1, 1,
0.4301327, -1.65976, 3.773208, 1, 1, 1, 1, 1,
0.4312763, 0.009375311, 1.15139, 1, 1, 1, 1, 1,
0.4316529, 0.2241845, -0.2017156, 1, 1, 1, 1, 1,
0.4333774, 0.9789179, 0.5687863, 1, 1, 1, 1, 1,
0.4481139, 0.001912052, 0.4222298, 1, 1, 1, 1, 1,
0.4487891, 0.7911502, 1.760717, 1, 1, 1, 1, 1,
0.4522405, -1.755667, 3.084044, 1, 1, 1, 1, 1,
0.4524526, -0.4443374, 0.9769657, 1, 1, 1, 1, 1,
0.4530791, -0.252433, 2.293442, 1, 1, 1, 1, 1,
0.4530801, -0.6943413, 2.209652, 1, 1, 1, 1, 1,
0.4535835, 0.964889, -0.6995963, 0, 0, 1, 1, 1,
0.4545157, -0.1277663, 1.623975, 1, 0, 0, 1, 1,
0.4548594, 0.8242742, 1.887571, 1, 0, 0, 1, 1,
0.45595, -0.1372103, 1.056679, 1, 0, 0, 1, 1,
0.4574749, 0.1154801, 2.428562, 1, 0, 0, 1, 1,
0.4591072, 0.8115891, 0.4956651, 1, 0, 0, 1, 1,
0.4596548, -0.6684477, 4.481667, 0, 0, 0, 1, 1,
0.4605822, 0.3521824, -0.1185176, 0, 0, 0, 1, 1,
0.4606024, -0.8570261, 0.9783163, 0, 0, 0, 1, 1,
0.4685781, -0.2639415, 3.36269, 0, 0, 0, 1, 1,
0.4696181, 1.20347, 0.9014806, 0, 0, 0, 1, 1,
0.4739459, -0.3610561, 1.741031, 0, 0, 0, 1, 1,
0.4758677, -0.9375874, 1.931529, 0, 0, 0, 1, 1,
0.4783918, -0.4435132, 2.00444, 1, 1, 1, 1, 1,
0.4791869, 0.4578516, -0.3684018, 1, 1, 1, 1, 1,
0.4845332, -1.530954, 1.64647, 1, 1, 1, 1, 1,
0.4887633, -0.02778921, -0.3054648, 1, 1, 1, 1, 1,
0.4890381, -1.216057, 3.698726, 1, 1, 1, 1, 1,
0.4905962, -0.1166904, 1.675094, 1, 1, 1, 1, 1,
0.5047473, 0.2604524, 0.4836771, 1, 1, 1, 1, 1,
0.5065342, 1.951133, -1.149041, 1, 1, 1, 1, 1,
0.5078987, 0.5160611, 0.6153563, 1, 1, 1, 1, 1,
0.5094556, 0.3469189, 1.100554, 1, 1, 1, 1, 1,
0.5118899, -0.345306, 2.472117, 1, 1, 1, 1, 1,
0.512594, -0.3026096, 1.958388, 1, 1, 1, 1, 1,
0.5147334, 0.6685941, 2.766152, 1, 1, 1, 1, 1,
0.5213294, -0.706787, 1.812089, 1, 1, 1, 1, 1,
0.5275298, -2.037281, 3.373039, 1, 1, 1, 1, 1,
0.5280808, -0.1627203, 3.708414, 0, 0, 1, 1, 1,
0.5339262, -0.8755291, 0.9906825, 1, 0, 0, 1, 1,
0.5402373, -0.2616479, 1.292609, 1, 0, 0, 1, 1,
0.5439491, 1.019753, 0.7215889, 1, 0, 0, 1, 1,
0.5440598, 0.3162824, 1.374687, 1, 0, 0, 1, 1,
0.5472957, -0.0658819, 2.402789, 1, 0, 0, 1, 1,
0.5488266, 0.8031849, -0.4182127, 0, 0, 0, 1, 1,
0.5554513, -0.451542, 2.111423, 0, 0, 0, 1, 1,
0.5554961, -1.663024, 3.003747, 0, 0, 0, 1, 1,
0.5564042, 0.5282052, 0.8783123, 0, 0, 0, 1, 1,
0.5597206, 1.39287, 0.6290732, 0, 0, 0, 1, 1,
0.5600281, -0.6706181, 2.781438, 0, 0, 0, 1, 1,
0.566468, 0.7588655, -0.6896641, 0, 0, 0, 1, 1,
0.5691641, 0.6485144, 0.4002469, 1, 1, 1, 1, 1,
0.5707206, -0.542708, 1.566018, 1, 1, 1, 1, 1,
0.5754378, -1.789273, 2.791204, 1, 1, 1, 1, 1,
0.5766449, 1.463452, -0.8592998, 1, 1, 1, 1, 1,
0.5905805, -1.121767, 2.694977, 1, 1, 1, 1, 1,
0.5917677, -0.2573628, 2.761925, 1, 1, 1, 1, 1,
0.5923913, -0.5836868, 2.523156, 1, 1, 1, 1, 1,
0.6008667, -2.750471, 3.358019, 1, 1, 1, 1, 1,
0.6142884, 1.486094, -0.7000028, 1, 1, 1, 1, 1,
0.6303495, 0.1514078, 0.8740934, 1, 1, 1, 1, 1,
0.630614, -0.6028054, 5.046021, 1, 1, 1, 1, 1,
0.6408936, -1.185906, 1.14047, 1, 1, 1, 1, 1,
0.641193, 0.8393867, 0.1122742, 1, 1, 1, 1, 1,
0.6413571, -0.1220806, 2.835223, 1, 1, 1, 1, 1,
0.64476, 0.3767472, 1.030833, 1, 1, 1, 1, 1,
0.644968, -1.130304, 3.862609, 0, 0, 1, 1, 1,
0.6452039, 0.9660366, 0.7661524, 1, 0, 0, 1, 1,
0.6535043, 0.9091413, 1.529978, 1, 0, 0, 1, 1,
0.6565875, 2.294845, -0.885671, 1, 0, 0, 1, 1,
0.6578767, 0.01637465, 1.093503, 1, 0, 0, 1, 1,
0.659218, -0.6367901, 4.399873, 1, 0, 0, 1, 1,
0.660244, -0.257605, 2.322934, 0, 0, 0, 1, 1,
0.6610326, -0.2547571, 3.524756, 0, 0, 0, 1, 1,
0.6616978, 0.4294785, 1.987375, 0, 0, 0, 1, 1,
0.6683754, -0.3245221, 1.522042, 0, 0, 0, 1, 1,
0.6693177, 0.3659794, 1.211722, 0, 0, 0, 1, 1,
0.6747286, 0.5366139, 2.148388, 0, 0, 0, 1, 1,
0.6766399, 0.9809318, -0.7309858, 0, 0, 0, 1, 1,
0.6774775, -0.03679339, 2.273692, 1, 1, 1, 1, 1,
0.6806026, 0.8815659, -0.7275771, 1, 1, 1, 1, 1,
0.6806319, -1.282282, 4.398995, 1, 1, 1, 1, 1,
0.6816263, -0.5044767, 1.541643, 1, 1, 1, 1, 1,
0.6818644, -1.946981, 1.990214, 1, 1, 1, 1, 1,
0.6847475, -1.714964, 3.671485, 1, 1, 1, 1, 1,
0.6896651, 0.2855112, 1.811519, 1, 1, 1, 1, 1,
0.6918895, -0.7944896, 3.460316, 1, 1, 1, 1, 1,
0.6936481, 1.149344, 0.9038242, 1, 1, 1, 1, 1,
0.6962899, 0.5267043, 1.079554, 1, 1, 1, 1, 1,
0.6984621, 0.247623, 1.714485, 1, 1, 1, 1, 1,
0.7040449, 0.3809685, 1.958489, 1, 1, 1, 1, 1,
0.7084345, -1.002996, 3.17142, 1, 1, 1, 1, 1,
0.7107654, 1.398894, -0.3385258, 1, 1, 1, 1, 1,
0.7148404, 1.855363, 0.5191405, 1, 1, 1, 1, 1,
0.7177717, 0.7791272, 1.201862, 0, 0, 1, 1, 1,
0.7181625, 0.2989846, 1.996642, 1, 0, 0, 1, 1,
0.7187836, 0.6706274, 2.047524, 1, 0, 0, 1, 1,
0.7207431, -2.408822, 2.2146, 1, 0, 0, 1, 1,
0.7226726, 0.9861413, 0.6536285, 1, 0, 0, 1, 1,
0.7273456, -1.349979, 2.887367, 1, 0, 0, 1, 1,
0.7274832, -1.725124, 2.699006, 0, 0, 0, 1, 1,
0.7370067, -0.9988617, 4.403267, 0, 0, 0, 1, 1,
0.7401836, -0.1333311, -0.2759863, 0, 0, 0, 1, 1,
0.7490442, -1.215322, 2.94892, 0, 0, 0, 1, 1,
0.7505363, 0.4367327, 2.136382, 0, 0, 0, 1, 1,
0.7518938, 0.7393361, 1.132921, 0, 0, 0, 1, 1,
0.7548445, 0.09574974, -0.5380869, 0, 0, 0, 1, 1,
0.759695, -0.201195, 0.8653732, 1, 1, 1, 1, 1,
0.7599252, -0.09973262, 3.025412, 1, 1, 1, 1, 1,
0.7605607, -0.3045161, 0.4133708, 1, 1, 1, 1, 1,
0.7644346, -1.087408, 2.721135, 1, 1, 1, 1, 1,
0.7645973, -1.195713, 1.975084, 1, 1, 1, 1, 1,
0.7657868, -1.93729, 2.876058, 1, 1, 1, 1, 1,
0.771139, 1.631179, 1.677835, 1, 1, 1, 1, 1,
0.7757973, -0.3465124, 4.425426, 1, 1, 1, 1, 1,
0.7758476, 0.8013771, 0.3223723, 1, 1, 1, 1, 1,
0.779938, 1.353662, 1.522169, 1, 1, 1, 1, 1,
0.7853119, 0.6862821, 2.374792, 1, 1, 1, 1, 1,
0.7881966, 2.050817, -1.147605, 1, 1, 1, 1, 1,
0.7926152, 1.087844, 0.4686363, 1, 1, 1, 1, 1,
0.8074235, 0.4184983, 1.850542, 1, 1, 1, 1, 1,
0.8093109, 1.161033, -0.1594212, 1, 1, 1, 1, 1,
0.8094991, -0.1108729, 0.5099279, 0, 0, 1, 1, 1,
0.8115851, -0.5414354, 2.415078, 1, 0, 0, 1, 1,
0.8133816, -1.319273, 2.199373, 1, 0, 0, 1, 1,
0.8135702, -0.5890521, 2.109816, 1, 0, 0, 1, 1,
0.8159609, 0.1903806, 1.994383, 1, 0, 0, 1, 1,
0.8160635, -0.548295, 1.514959, 1, 0, 0, 1, 1,
0.8184596, 0.478223, 1.041424, 0, 0, 0, 1, 1,
0.8230234, -0.07422119, 2.994779, 0, 0, 0, 1, 1,
0.8335108, -0.1298732, 3.790148, 0, 0, 0, 1, 1,
0.8344808, 1.822839, 0.7166805, 0, 0, 0, 1, 1,
0.8364522, -0.1792155, 2.221529, 0, 0, 0, 1, 1,
0.8380417, 1.019788, -2.262353, 0, 0, 0, 1, 1,
0.8453735, -1.903728, 0.9531473, 0, 0, 0, 1, 1,
0.8471867, 2.648583, 0.2448786, 1, 1, 1, 1, 1,
0.8475851, 0.4712537, 2.428088, 1, 1, 1, 1, 1,
0.8508301, -0.3797045, 1.34227, 1, 1, 1, 1, 1,
0.8598139, -0.5123739, 1.752962, 1, 1, 1, 1, 1,
0.8616355, -0.08380444, 1.819868, 1, 1, 1, 1, 1,
0.8633176, -0.8325592, 1.652788, 1, 1, 1, 1, 1,
0.8633777, -1.264703, 2.040415, 1, 1, 1, 1, 1,
0.8646895, 0.01533744, 0.6271528, 1, 1, 1, 1, 1,
0.8650013, 0.02865089, 1.691043, 1, 1, 1, 1, 1,
0.8706117, 0.7539211, -0.9053245, 1, 1, 1, 1, 1,
0.870709, 0.878831, 1.804422, 1, 1, 1, 1, 1,
0.8733751, 2.775979, -0.2419579, 1, 1, 1, 1, 1,
0.874244, 1.183237, 0.02036618, 1, 1, 1, 1, 1,
0.8784384, -0.6099899, 2.391871, 1, 1, 1, 1, 1,
0.8788152, 0.08341896, 1.642193, 1, 1, 1, 1, 1,
0.8798483, -0.09586001, 2.034544, 0, 0, 1, 1, 1,
0.8814471, -3.119068, 2.555576, 1, 0, 0, 1, 1,
0.8942987, 0.901687, 0.6459297, 1, 0, 0, 1, 1,
0.8982933, 1.308661, 0.3942783, 1, 0, 0, 1, 1,
0.901022, 2.14008, 0.6653981, 1, 0, 0, 1, 1,
0.9062591, -0.474067, -0.04555776, 1, 0, 0, 1, 1,
0.9126735, 0.3149703, 0.9280472, 0, 0, 0, 1, 1,
0.915616, 0.0357857, -0.01114715, 0, 0, 0, 1, 1,
0.9209905, 0.8218241, 1.457968, 0, 0, 0, 1, 1,
0.9363795, 1.19746, 1.377096, 0, 0, 0, 1, 1,
0.9403639, 0.6112799, 0.7949082, 0, 0, 0, 1, 1,
0.9546771, -1.337307, 3.884663, 0, 0, 0, 1, 1,
0.9636871, 0.04168642, 1.581065, 0, 0, 0, 1, 1,
0.9662037, -1.493573, 3.451218, 1, 1, 1, 1, 1,
0.9674531, 0.786015, 0.001700593, 1, 1, 1, 1, 1,
0.9727647, -0.6588967, 3.891039, 1, 1, 1, 1, 1,
0.9762802, 0.997534, 1.155717, 1, 1, 1, 1, 1,
0.9801406, 1.550297, 0.7371814, 1, 1, 1, 1, 1,
0.9851975, -1.082641, 2.153279, 1, 1, 1, 1, 1,
0.9912732, -0.2932405, 3.564155, 1, 1, 1, 1, 1,
0.9980383, 0.4911114, 1.341338, 1, 1, 1, 1, 1,
1.006021, 0.7400086, -1.176766, 1, 1, 1, 1, 1,
1.018226, -1.106769, 2.360208, 1, 1, 1, 1, 1,
1.019865, -0.6035677, 3.323145, 1, 1, 1, 1, 1,
1.020838, 0.2850007, 1.462487, 1, 1, 1, 1, 1,
1.026318, 0.08489352, 2.868888, 1, 1, 1, 1, 1,
1.026415, -0.263663, 0.5424013, 1, 1, 1, 1, 1,
1.028252, 1.198579, 1.475188, 1, 1, 1, 1, 1,
1.029717, 0.140886, 0.1642027, 0, 0, 1, 1, 1,
1.030177, 0.7966794, 0.1301516, 1, 0, 0, 1, 1,
1.035424, 0.7732328, 0.2338369, 1, 0, 0, 1, 1,
1.037276, 1.222182, 0.7833161, 1, 0, 0, 1, 1,
1.038569, 0.9484185, -1.48601, 1, 0, 0, 1, 1,
1.040213, -0.1368564, 0.8598905, 1, 0, 0, 1, 1,
1.045879, -0.1941113, 3.769934, 0, 0, 0, 1, 1,
1.045908, 0.5368367, 0.3447375, 0, 0, 0, 1, 1,
1.046119, 0.8605126, 0.6359287, 0, 0, 0, 1, 1,
1.047077, 0.315349, 1.513631, 0, 0, 0, 1, 1,
1.053556, 0.1066238, 0.02799617, 0, 0, 0, 1, 1,
1.05479, -0.2563427, 2.729662, 0, 0, 0, 1, 1,
1.05686, -0.8206788, 1.497839, 0, 0, 0, 1, 1,
1.066927, 0.2407836, 1.742276, 1, 1, 1, 1, 1,
1.067014, -1.126471, 1.980392, 1, 1, 1, 1, 1,
1.06993, -0.9648371, 2.838747, 1, 1, 1, 1, 1,
1.073409, -1.600753, 0.7925071, 1, 1, 1, 1, 1,
1.074735, -1.419111, 1.906414, 1, 1, 1, 1, 1,
1.075788, 2.198318, -1.589314, 1, 1, 1, 1, 1,
1.076727, -1.101897, 2.434262, 1, 1, 1, 1, 1,
1.084115, 0.8186482, 0.3116781, 1, 1, 1, 1, 1,
1.0849, 2.309228, 1.339244, 1, 1, 1, 1, 1,
1.085634, 0.461012, 0.3138568, 1, 1, 1, 1, 1,
1.090527, -1.315425, 1.12065, 1, 1, 1, 1, 1,
1.090982, -0.5367889, 1.371833, 1, 1, 1, 1, 1,
1.113034, 0.1371112, 1.297558, 1, 1, 1, 1, 1,
1.129861, -0.600015, 1.911457, 1, 1, 1, 1, 1,
1.135515, 0.2217641, 0.4325511, 1, 1, 1, 1, 1,
1.150092, -0.8332527, 2.878685, 0, 0, 1, 1, 1,
1.167107, -0.9399133, 3.373584, 1, 0, 0, 1, 1,
1.17075, 0.3753479, 1.357831, 1, 0, 0, 1, 1,
1.172701, -0.2015469, 2.18671, 1, 0, 0, 1, 1,
1.179667, -1.393092, 1.424263, 1, 0, 0, 1, 1,
1.182423, 0.08642284, 0.5631175, 1, 0, 0, 1, 1,
1.185404, 0.300471, 3.999965, 0, 0, 0, 1, 1,
1.186637, 0.5781054, 1.135549, 0, 0, 0, 1, 1,
1.196551, -0.2010037, 2.352526, 0, 0, 0, 1, 1,
1.196626, 0.195151, 2.412796, 0, 0, 0, 1, 1,
1.198265, 0.3789377, 2.280149, 0, 0, 0, 1, 1,
1.198356, -0.4964334, 0.6893134, 0, 0, 0, 1, 1,
1.204873, 0.9138218, 1.204455, 0, 0, 0, 1, 1,
1.206008, 0.6608287, 2.811971, 1, 1, 1, 1, 1,
1.207426, -1.259325, 3.633523, 1, 1, 1, 1, 1,
1.208255, 0.09608217, 1.548608, 1, 1, 1, 1, 1,
1.217447, -0.443745, 2.906029, 1, 1, 1, 1, 1,
1.217898, 2.52111, -1.13385, 1, 1, 1, 1, 1,
1.220181, 0.3238214, 2.021976, 1, 1, 1, 1, 1,
1.234448, -0.8088108, 2.793757, 1, 1, 1, 1, 1,
1.236021, 0.06961484, 1.892891, 1, 1, 1, 1, 1,
1.236532, 0.04593414, 0.3203787, 1, 1, 1, 1, 1,
1.248108, -0.4651075, 1.388954, 1, 1, 1, 1, 1,
1.254441, -0.3046523, 0.946385, 1, 1, 1, 1, 1,
1.256706, -0.3656101, 1.269678, 1, 1, 1, 1, 1,
1.263118, 0.1106561, -0.36713, 1, 1, 1, 1, 1,
1.263795, 1.542073, 0.8334277, 1, 1, 1, 1, 1,
1.268305, 1.010821, 1.85705, 1, 1, 1, 1, 1,
1.269203, 0.6410929, 1.695744, 0, 0, 1, 1, 1,
1.273318, 0.5161201, -0.008705568, 1, 0, 0, 1, 1,
1.273938, 1.770576, 0.5532218, 1, 0, 0, 1, 1,
1.280494, -0.3338622, 0.6034172, 1, 0, 0, 1, 1,
1.282259, 0.08870787, 1.531474, 1, 0, 0, 1, 1,
1.285166, -0.9132113, 3.465884, 1, 0, 0, 1, 1,
1.285181, -0.6500543, 0.658159, 0, 0, 0, 1, 1,
1.288786, -0.9739064, 3.281542, 0, 0, 0, 1, 1,
1.297269, 0.8563307, 2.326154, 0, 0, 0, 1, 1,
1.302423, 0.6024149, 1.090871, 0, 0, 0, 1, 1,
1.316034, -0.2770272, 1.162911, 0, 0, 0, 1, 1,
1.316554, 0.2653618, 1.003181, 0, 0, 0, 1, 1,
1.316937, 0.2709065, 1.359829, 0, 0, 0, 1, 1,
1.326037, 0.8981197, 0.8711631, 1, 1, 1, 1, 1,
1.327537, -0.5069752, 3.675893, 1, 1, 1, 1, 1,
1.33593, 1.531318, 0.895291, 1, 1, 1, 1, 1,
1.354846, 0.3553041, 0.1319993, 1, 1, 1, 1, 1,
1.359794, -0.4614291, 1.853803, 1, 1, 1, 1, 1,
1.364418, 0.6005405, 0.3675669, 1, 1, 1, 1, 1,
1.367034, -0.8995057, 1.98977, 1, 1, 1, 1, 1,
1.368647, -0.3064964, 2.775519, 1, 1, 1, 1, 1,
1.379252, 0.1685706, 1.50102, 1, 1, 1, 1, 1,
1.385215, 0.5601287, 0.8035899, 1, 1, 1, 1, 1,
1.393906, 1.417273, 1.299822, 1, 1, 1, 1, 1,
1.405002, 0.7540724, 0.4730799, 1, 1, 1, 1, 1,
1.409913, -0.4745198, 1.932782, 1, 1, 1, 1, 1,
1.411083, -1.477811, 1.464916, 1, 1, 1, 1, 1,
1.412026, 0.8015288, 1.608865, 1, 1, 1, 1, 1,
1.416412, 0.3342029, 1.525802, 0, 0, 1, 1, 1,
1.420344, 1.200119, 1.506829, 1, 0, 0, 1, 1,
1.438002, -0.3167887, 2.886949, 1, 0, 0, 1, 1,
1.446241, 0.05511739, 0.2321007, 1, 0, 0, 1, 1,
1.451403, 1.418428, 0.3608578, 1, 0, 0, 1, 1,
1.457702, 0.04939976, 0.1047471, 1, 0, 0, 1, 1,
1.460862, 0.02673094, 0.8512809, 0, 0, 0, 1, 1,
1.467705, 0.6903926, 2.917077, 0, 0, 0, 1, 1,
1.468462, 0.4996568, 0.8706919, 0, 0, 0, 1, 1,
1.469432, 0.9878232, 2.801926, 0, 0, 0, 1, 1,
1.490294, -1.792733, 2.434435, 0, 0, 0, 1, 1,
1.490377, 0.3015892, -0.0964978, 0, 0, 0, 1, 1,
1.495735, -0.06156391, 0.6649634, 0, 0, 0, 1, 1,
1.505684, -1.459195, 2.04855, 1, 1, 1, 1, 1,
1.511899, -0.267742, 1.159435, 1, 1, 1, 1, 1,
1.520918, 0.6082754, -0.1909623, 1, 1, 1, 1, 1,
1.540285, 0.4886364, 3.78164, 1, 1, 1, 1, 1,
1.591885, 2.415668, 0.7709017, 1, 1, 1, 1, 1,
1.607687, 0.439687, 2.718727, 1, 1, 1, 1, 1,
1.611589, -0.03709123, 2.897445, 1, 1, 1, 1, 1,
1.614748, 1.149425, -0.2599386, 1, 1, 1, 1, 1,
1.630112, -0.1553864, 1.972261, 1, 1, 1, 1, 1,
1.630227, 0.5294412, 1.268505, 1, 1, 1, 1, 1,
1.638494, 0.2132771, 2.499235, 1, 1, 1, 1, 1,
1.6401, -0.1705584, 1.682466, 1, 1, 1, 1, 1,
1.649251, 0.8532175, 2.202895, 1, 1, 1, 1, 1,
1.651817, 0.4045905, 2.920344, 1, 1, 1, 1, 1,
1.673653, -0.841515, 2.805335, 1, 1, 1, 1, 1,
1.683267, 0.1982752, 1.681581, 0, 0, 1, 1, 1,
1.701002, 0.570296, 0.7518108, 1, 0, 0, 1, 1,
1.703072, 1.715137, 2.560648, 1, 0, 0, 1, 1,
1.703795, 0.6423734, 0.7459908, 1, 0, 0, 1, 1,
1.710183, 0.3422877, 2.835507, 1, 0, 0, 1, 1,
1.738323, -0.8722643, 1.220697, 1, 0, 0, 1, 1,
1.743695, -0.5215915, 1.784159, 0, 0, 0, 1, 1,
1.769295, -0.2514961, 2.475108, 0, 0, 0, 1, 1,
1.813733, -0.3454236, 0.9842091, 0, 0, 0, 1, 1,
1.817715, -1.463782, 2.638947, 0, 0, 0, 1, 1,
1.822211, -0.1253795, 2.845625, 0, 0, 0, 1, 1,
1.843409, 1.315671, 1.732271, 0, 0, 0, 1, 1,
1.851947, 2.638258, 1.960358, 0, 0, 0, 1, 1,
1.853906, 0.8937753, 2.192168, 1, 1, 1, 1, 1,
1.855551, 0.9152755, 0.8378958, 1, 1, 1, 1, 1,
1.879808, -0.0726112, -0.3551772, 1, 1, 1, 1, 1,
1.894316, -0.9828522, 0.9807205, 1, 1, 1, 1, 1,
1.895143, 0.5753202, 2.191445, 1, 1, 1, 1, 1,
1.90062, -0.2117197, 0.9794643, 1, 1, 1, 1, 1,
1.910502, -0.06031118, 2.107198, 1, 1, 1, 1, 1,
1.915685, 1.142596, -1.715943, 1, 1, 1, 1, 1,
1.930406, 0.9984682, 0.2356652, 1, 1, 1, 1, 1,
1.965018, -2.590899, 4.277629, 1, 1, 1, 1, 1,
1.969747, -0.5578548, 2.236138, 1, 1, 1, 1, 1,
1.973155, -0.6249255, 1.545568, 1, 1, 1, 1, 1,
2.006866, 0.1876758, 0.08968262, 1, 1, 1, 1, 1,
2.040514, -0.7516792, 3.276231, 1, 1, 1, 1, 1,
2.041039, 0.008509221, 1.251463, 1, 1, 1, 1, 1,
2.043236, 0.8499665, 0.2933532, 0, 0, 1, 1, 1,
2.045182, -1.423196, 2.252934, 1, 0, 0, 1, 1,
2.057046, -0.3092669, 0.9620275, 1, 0, 0, 1, 1,
2.065652, 1.034898, 2.343091, 1, 0, 0, 1, 1,
2.091806, 0.1877215, 1.988322, 1, 0, 0, 1, 1,
2.116577, -2.156614, 0.3931123, 1, 0, 0, 1, 1,
2.131793, 0.8191713, 0.3643913, 0, 0, 0, 1, 1,
2.191899, -1.429867, 5.11315, 0, 0, 0, 1, 1,
2.214681, -0.9415264, 1.566679, 0, 0, 0, 1, 1,
2.291642, -0.305136, 1.96179, 0, 0, 0, 1, 1,
2.306695, 0.41655, 0.8662702, 0, 0, 0, 1, 1,
2.330194, -0.4130749, 0.9189292, 0, 0, 0, 1, 1,
2.363631, 0.3404553, 1.988198, 0, 0, 0, 1, 1,
2.370969, -1.829442, 3.965675, 1, 1, 1, 1, 1,
2.423473, 0.3691474, 1.910777, 1, 1, 1, 1, 1,
2.497558, 0.2375639, 0.275213, 1, 1, 1, 1, 1,
2.594618, 1.323541, 0.5174849, 1, 1, 1, 1, 1,
2.658161, -0.8633052, 4.406435, 1, 1, 1, 1, 1,
2.75757, 0.6278279, 2.55953, 1, 1, 1, 1, 1,
2.88217, 1.629344, -0.5386839, 1, 1, 1, 1, 1
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
var radius = 9.482767;
var distance = 33.30782;
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
mvMatrix.translate( 0.01773214, 0.278165, -0.02166486 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.30782);
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
