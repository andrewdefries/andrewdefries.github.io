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
-3.136066, -0.7899083, -2.58081, 1, 0, 0, 1,
-3.12028, -0.6603823, -3.766423, 1, 0.007843138, 0, 1,
-2.77969, 0.2480864, -2.370998, 1, 0.01176471, 0, 1,
-2.690254, 1.24209, -2.883526, 1, 0.01960784, 0, 1,
-2.621313, -1.488875, -0.7082158, 1, 0.02352941, 0, 1,
-2.532869, -0.05451149, 0.5967097, 1, 0.03137255, 0, 1,
-2.476425, -0.3021382, -0.8052146, 1, 0.03529412, 0, 1,
-2.407326, -0.1647353, -2.183744, 1, 0.04313726, 0, 1,
-2.398441, 1.523279, -1.299388, 1, 0.04705882, 0, 1,
-2.254481, 0.0349355, -3.055762, 1, 0.05490196, 0, 1,
-2.242193, -0.7547109, -0.8882838, 1, 0.05882353, 0, 1,
-2.222448, -1.733834, -1.694767, 1, 0.06666667, 0, 1,
-2.164529, -0.2462618, -2.547722, 1, 0.07058824, 0, 1,
-2.107846, 0.4514532, -1.964287, 1, 0.07843138, 0, 1,
-2.090537, 1.238386, -1.152249, 1, 0.08235294, 0, 1,
-2.061984, 0.7728108, -1.068304, 1, 0.09019608, 0, 1,
-2.042227, -0.3494698, -3.670157, 1, 0.09411765, 0, 1,
-2.034371, -0.009938444, -2.217856, 1, 0.1019608, 0, 1,
-2.013661, 3.09224, -1.997911, 1, 0.1098039, 0, 1,
-2.006539, -0.2560745, -1.433442, 1, 0.1137255, 0, 1,
-1.963463, -0.8106688, -1.958581, 1, 0.1215686, 0, 1,
-1.953994, 0.1268717, -1.096563, 1, 0.1254902, 0, 1,
-1.952035, -0.6827747, -1.568113, 1, 0.1333333, 0, 1,
-1.951056, 1.116839, -1.594901, 1, 0.1372549, 0, 1,
-1.938479, -0.7358037, -1.659256, 1, 0.145098, 0, 1,
-1.925836, 0.9343136, -0.4562966, 1, 0.1490196, 0, 1,
-1.910057, -0.6776302, -2.075019, 1, 0.1568628, 0, 1,
-1.906209, 0.8562414, -2.432964, 1, 0.1607843, 0, 1,
-1.879557, 0.3836308, 0.5501229, 1, 0.1686275, 0, 1,
-1.871076, 0.01150069, -1.954973, 1, 0.172549, 0, 1,
-1.867731, 2.658688, -0.0931412, 1, 0.1803922, 0, 1,
-1.866771, 1.492639, 0.7744952, 1, 0.1843137, 0, 1,
-1.861853, 0.2660654, -2.856377, 1, 0.1921569, 0, 1,
-1.860854, -1.983031, -1.721393, 1, 0.1960784, 0, 1,
-1.860738, -0.8188481, -4.411311, 1, 0.2039216, 0, 1,
-1.854103, -0.8493939, -2.860421, 1, 0.2117647, 0, 1,
-1.839128, -0.06201142, 0.09968031, 1, 0.2156863, 0, 1,
-1.834306, 0.02371516, -0.2086785, 1, 0.2235294, 0, 1,
-1.805974, 1.474796, 0.02702402, 1, 0.227451, 0, 1,
-1.749999, 0.7036957, -2.543177, 1, 0.2352941, 0, 1,
-1.743832, -0.6080146, -1.771972, 1, 0.2392157, 0, 1,
-1.73005, 1.270503, -0.9023229, 1, 0.2470588, 0, 1,
-1.729507, 0.4067402, -1.490707, 1, 0.2509804, 0, 1,
-1.722066, -1.239558, -2.988603, 1, 0.2588235, 0, 1,
-1.700453, 0.8969068, -1.070227, 1, 0.2627451, 0, 1,
-1.686717, -1.356019, -2.289313, 1, 0.2705882, 0, 1,
-1.682391, -1.237301, -2.968454, 1, 0.2745098, 0, 1,
-1.680978, -0.1195448, -1.914253, 1, 0.282353, 0, 1,
-1.673527, 2.179619, -1.833209, 1, 0.2862745, 0, 1,
-1.643716, -0.7092173, -0.806244, 1, 0.2941177, 0, 1,
-1.628543, -0.9187216, -0.9743165, 1, 0.3019608, 0, 1,
-1.623451, 2.391165, -1.910318, 1, 0.3058824, 0, 1,
-1.61124, -1.052003, -1.901825, 1, 0.3137255, 0, 1,
-1.593209, 0.1249728, -3.369729, 1, 0.3176471, 0, 1,
-1.591362, -0.5808365, 0.8904779, 1, 0.3254902, 0, 1,
-1.576692, 0.1047091, -2.604533, 1, 0.3294118, 0, 1,
-1.574272, 0.4541272, -3.267355, 1, 0.3372549, 0, 1,
-1.573909, 1.426685, 0.1861985, 1, 0.3411765, 0, 1,
-1.571909, 3.164584, 0.5930959, 1, 0.3490196, 0, 1,
-1.568617, 0.08932957, -0.2455897, 1, 0.3529412, 0, 1,
-1.52848, -0.5470622, -1.322182, 1, 0.3607843, 0, 1,
-1.523155, -1.094893, -2.370821, 1, 0.3647059, 0, 1,
-1.519878, -0.2841977, 0.1760843, 1, 0.372549, 0, 1,
-1.518128, 1.314303, 0.3272951, 1, 0.3764706, 0, 1,
-1.499423, -0.7761297, -3.23046, 1, 0.3843137, 0, 1,
-1.478387, 0.6979346, -3.036957, 1, 0.3882353, 0, 1,
-1.45922, -0.6380793, -1.487563, 1, 0.3960784, 0, 1,
-1.455492, 0.5463121, -0.4562429, 1, 0.4039216, 0, 1,
-1.454352, -0.9621723, -3.029939, 1, 0.4078431, 0, 1,
-1.445976, -0.197078, -1.580916, 1, 0.4156863, 0, 1,
-1.435065, 1.019502, -1.464416, 1, 0.4196078, 0, 1,
-1.420305, 0.81565, -2.657119, 1, 0.427451, 0, 1,
-1.41508, -0.4792313, -0.6473346, 1, 0.4313726, 0, 1,
-1.413909, 0.6111942, -2.039178, 1, 0.4392157, 0, 1,
-1.410478, 0.6975583, -2.805728, 1, 0.4431373, 0, 1,
-1.410146, 2.59048, -0.8723214, 1, 0.4509804, 0, 1,
-1.404238, -1.322419, -1.02833, 1, 0.454902, 0, 1,
-1.399072, -1.445328, -0.9468966, 1, 0.4627451, 0, 1,
-1.398648, -0.5947394, -1.398701, 1, 0.4666667, 0, 1,
-1.375664, 1.49139, -1.484597, 1, 0.4745098, 0, 1,
-1.369911, -0.417493, -0.9339204, 1, 0.4784314, 0, 1,
-1.361849, 0.2670314, -3.045866, 1, 0.4862745, 0, 1,
-1.359622, 1.177156, -0.5264469, 1, 0.4901961, 0, 1,
-1.349169, 0.4024839, -1.340424, 1, 0.4980392, 0, 1,
-1.348206, 0.1420875, -0.7708437, 1, 0.5058824, 0, 1,
-1.343083, 2.26468, -1.199345, 1, 0.509804, 0, 1,
-1.329561, -0.2090768, 0.1966536, 1, 0.5176471, 0, 1,
-1.320648, -0.4213627, -2.459554, 1, 0.5215687, 0, 1,
-1.318172, 0.7309884, -1.028008, 1, 0.5294118, 0, 1,
-1.305841, -0.7234665, -1.43111, 1, 0.5333334, 0, 1,
-1.302637, 1.611307, 0.02975512, 1, 0.5411765, 0, 1,
-1.295153, -0.7104084, -3.464636, 1, 0.5450981, 0, 1,
-1.289111, 1.130988, 0.4287348, 1, 0.5529412, 0, 1,
-1.284018, -2.78793, -2.555373, 1, 0.5568628, 0, 1,
-1.277359, -0.8863322, -2.001372, 1, 0.5647059, 0, 1,
-1.276251, 0.1217121, -1.74225, 1, 0.5686275, 0, 1,
-1.272493, -0.6097263, -2.455866, 1, 0.5764706, 0, 1,
-1.269283, 1.133777, -1.836168, 1, 0.5803922, 0, 1,
-1.266512, -0.2515988, -3.430527, 1, 0.5882353, 0, 1,
-1.26622, -2.047184, -3.823215, 1, 0.5921569, 0, 1,
-1.255639, -1.629332, -2.781401, 1, 0.6, 0, 1,
-1.237532, -1.732512, -2.357846, 1, 0.6078432, 0, 1,
-1.232878, -0.4390045, -0.04644751, 1, 0.6117647, 0, 1,
-1.222993, -0.6616558, -1.304931, 1, 0.6196079, 0, 1,
-1.219692, -0.7720397, -1.024949, 1, 0.6235294, 0, 1,
-1.217802, -1.642251, -1.266432, 1, 0.6313726, 0, 1,
-1.217137, 0.4155643, -1.500337, 1, 0.6352941, 0, 1,
-1.214087, 1.187233, 0.585734, 1, 0.6431373, 0, 1,
-1.212242, 1.150372, 0.2671577, 1, 0.6470588, 0, 1,
-1.211779, -0.4331674, -2.604165, 1, 0.654902, 0, 1,
-1.211156, 0.3986346, -0.5978476, 1, 0.6588235, 0, 1,
-1.205208, 1.461116, 1.080887, 1, 0.6666667, 0, 1,
-1.19393, 1.17474, -1.207996, 1, 0.6705883, 0, 1,
-1.188416, -0.01250011, 0.8546137, 1, 0.6784314, 0, 1,
-1.186444, -1.784823, -1.733256, 1, 0.682353, 0, 1,
-1.185882, 0.5232792, -1.910235, 1, 0.6901961, 0, 1,
-1.18079, -1.9781, -3.064343, 1, 0.6941177, 0, 1,
-1.176676, -0.5583994, -1.125216, 1, 0.7019608, 0, 1,
-1.176352, -0.8119749, -3.953755, 1, 0.7098039, 0, 1,
-1.16276, 0.2864882, -0.2857354, 1, 0.7137255, 0, 1,
-1.149646, 1.493592, -0.4282593, 1, 0.7215686, 0, 1,
-1.149376, -1.646101, -2.67893, 1, 0.7254902, 0, 1,
-1.143451, 0.4625496, -2.567556, 1, 0.7333333, 0, 1,
-1.14105, 2.018875, -2.644574, 1, 0.7372549, 0, 1,
-1.138386, -0.2298458, -0.1181192, 1, 0.7450981, 0, 1,
-1.136109, -1.486385, -1.549702, 1, 0.7490196, 0, 1,
-1.135367, 1.022672, -1.343365, 1, 0.7568628, 0, 1,
-1.133885, -0.3706864, -1.27994, 1, 0.7607843, 0, 1,
-1.126681, -0.1167955, -1.12086, 1, 0.7686275, 0, 1,
-1.121307, -0.5152355, -3.217536, 1, 0.772549, 0, 1,
-1.105363, 1.49606, -0.8452929, 1, 0.7803922, 0, 1,
-1.10313, 0.5192658, -3.038956, 1, 0.7843137, 0, 1,
-1.102265, -0.5512483, -1.631115, 1, 0.7921569, 0, 1,
-1.09453, 0.1405469, -0.6105839, 1, 0.7960784, 0, 1,
-1.089718, -1.058915, -0.06533293, 1, 0.8039216, 0, 1,
-1.082675, 0.5230848, -0.08399889, 1, 0.8117647, 0, 1,
-1.081815, -2.358431, -2.618428, 1, 0.8156863, 0, 1,
-1.081015, 0.537403, -0.3439127, 1, 0.8235294, 0, 1,
-1.080839, 1.067624, -0.09794189, 1, 0.827451, 0, 1,
-1.080191, -0.6414186, -2.208253, 1, 0.8352941, 0, 1,
-1.077784, -1.550859, -1.862497, 1, 0.8392157, 0, 1,
-1.074802, 1.949806, 0.6845262, 1, 0.8470588, 0, 1,
-1.068444, 1.320759, -0.3415628, 1, 0.8509804, 0, 1,
-1.054448, 0.6139621, -1.34208, 1, 0.8588235, 0, 1,
-1.05033, 1.117278, -0.3061788, 1, 0.8627451, 0, 1,
-1.05029, 1.422144, -1.476475, 1, 0.8705882, 0, 1,
-1.043851, -0.2322782, -1.79491, 1, 0.8745098, 0, 1,
-1.040277, 1.29438, -0.1675154, 1, 0.8823529, 0, 1,
-1.037199, 0.1875906, -1.587455, 1, 0.8862745, 0, 1,
-1.032381, -0.7825115, -1.439365, 1, 0.8941177, 0, 1,
-1.0215, -0.9162308, -2.540878, 1, 0.8980392, 0, 1,
-1.021368, 1.074139, -0.0429753, 1, 0.9058824, 0, 1,
-1.01911, 0.3207042, -0.123728, 1, 0.9137255, 0, 1,
-1.006854, 0.4425934, -1.709921, 1, 0.9176471, 0, 1,
-1.004638, -0.215964, -1.695661, 1, 0.9254902, 0, 1,
-0.9992982, -1.239043, -3.570007, 1, 0.9294118, 0, 1,
-0.997559, -0.2258832, -2.759868, 1, 0.9372549, 0, 1,
-0.9930095, -0.1551579, -2.747441, 1, 0.9411765, 0, 1,
-0.9902719, -0.05760276, -1.886766, 1, 0.9490196, 0, 1,
-0.9887289, -0.1018919, -1.190306, 1, 0.9529412, 0, 1,
-0.9853727, -0.9107844, -2.838856, 1, 0.9607843, 0, 1,
-0.980419, 0.06545427, -0.8010327, 1, 0.9647059, 0, 1,
-0.974543, -0.8471282, -1.950855, 1, 0.972549, 0, 1,
-0.9638689, 1.622774, -0.0466393, 1, 0.9764706, 0, 1,
-0.9625393, 0.7688385, -2.267102, 1, 0.9843137, 0, 1,
-0.9489253, -0.3942029, -1.027908, 1, 0.9882353, 0, 1,
-0.9415821, -0.5330325, -1.703167, 1, 0.9960784, 0, 1,
-0.9410223, -0.5115821, -2.268048, 0.9960784, 1, 0, 1,
-0.9390479, -0.3046463, -2.977957, 0.9921569, 1, 0, 1,
-0.9365352, 0.3502411, 0.009029679, 0.9843137, 1, 0, 1,
-0.9361671, 0.2801497, -1.666006, 0.9803922, 1, 0, 1,
-0.9346971, -0.579541, -1.548876, 0.972549, 1, 0, 1,
-0.9228802, -0.1374831, -2.281214, 0.9686275, 1, 0, 1,
-0.9203299, -1.042539, -2.604254, 0.9607843, 1, 0, 1,
-0.9171598, -1.781721, -1.471065, 0.9568627, 1, 0, 1,
-0.9156551, 0.4900126, -1.535676, 0.9490196, 1, 0, 1,
-0.9019894, -1.175295, -3.806682, 0.945098, 1, 0, 1,
-0.9017521, 0.8710696, -1.549529, 0.9372549, 1, 0, 1,
-0.9014928, -0.4586105, -2.5994, 0.9333333, 1, 0, 1,
-0.8981023, -0.6627424, -1.803614, 0.9254902, 1, 0, 1,
-0.8859795, -1.972497, -2.089618, 0.9215686, 1, 0, 1,
-0.8857501, 0.6135741, -2.042812, 0.9137255, 1, 0, 1,
-0.880309, 0.1339225, -1.475006, 0.9098039, 1, 0, 1,
-0.8792475, 1.618103, 0.6817834, 0.9019608, 1, 0, 1,
-0.8734093, 0.1243388, -2.816938, 0.8941177, 1, 0, 1,
-0.8706468, -1.44113, -3.750864, 0.8901961, 1, 0, 1,
-0.8665021, -0.2358667, -2.523382, 0.8823529, 1, 0, 1,
-0.8660198, -0.5192024, -3.100244, 0.8784314, 1, 0, 1,
-0.863871, -0.5680057, -1.95329, 0.8705882, 1, 0, 1,
-0.8610601, 0.291571, -1.211676, 0.8666667, 1, 0, 1,
-0.8594533, -0.7240511, -2.548977, 0.8588235, 1, 0, 1,
-0.8589927, -1.848717, -2.229571, 0.854902, 1, 0, 1,
-0.8585135, -0.9070398, -2.558941, 0.8470588, 1, 0, 1,
-0.8536415, -0.9932541, -3.239197, 0.8431373, 1, 0, 1,
-0.842972, 0.9403822, -0.7821627, 0.8352941, 1, 0, 1,
-0.8427279, 1.179488, -1.240002, 0.8313726, 1, 0, 1,
-0.8418945, 0.5105755, -1.730453, 0.8235294, 1, 0, 1,
-0.8391719, -0.2410093, -1.792179, 0.8196079, 1, 0, 1,
-0.8143472, 0.3589034, -3.642432, 0.8117647, 1, 0, 1,
-0.8063892, -0.5404766, -4.62876, 0.8078431, 1, 0, 1,
-0.8035126, -0.1036396, -1.494477, 0.8, 1, 0, 1,
-0.8007262, -0.6273953, -2.012067, 0.7921569, 1, 0, 1,
-0.798853, -1.066971, -1.595578, 0.7882353, 1, 0, 1,
-0.7958867, -0.4268601, -2.088019, 0.7803922, 1, 0, 1,
-0.7949359, -0.4745145, -2.532151, 0.7764706, 1, 0, 1,
-0.7944728, -2.134866, -3.238226, 0.7686275, 1, 0, 1,
-0.7919728, -0.4430336, -1.727698, 0.7647059, 1, 0, 1,
-0.7893866, -0.7224013, -1.427942, 0.7568628, 1, 0, 1,
-0.7863151, -0.1516634, -3.341667, 0.7529412, 1, 0, 1,
-0.7834285, -1.574226, -2.944868, 0.7450981, 1, 0, 1,
-0.7787018, 0.7089018, -1.15074, 0.7411765, 1, 0, 1,
-0.7752646, -0.7160165, -2.629197, 0.7333333, 1, 0, 1,
-0.772408, 0.6732644, -1.606687, 0.7294118, 1, 0, 1,
-0.7723125, -0.4344694, -1.689238, 0.7215686, 1, 0, 1,
-0.7710001, -1.880289, -1.376475, 0.7176471, 1, 0, 1,
-0.7672735, 0.8737434, 0.3984271, 0.7098039, 1, 0, 1,
-0.7638476, -1.248982, -3.752721, 0.7058824, 1, 0, 1,
-0.756948, 1.1158, 0.4683097, 0.6980392, 1, 0, 1,
-0.7523872, -0.4994893, -1.107981, 0.6901961, 1, 0, 1,
-0.7516056, -0.0927014, 0.01870395, 0.6862745, 1, 0, 1,
-0.7463295, -0.178554, -1.708745, 0.6784314, 1, 0, 1,
-0.7443544, 2.180062, 1.567165, 0.6745098, 1, 0, 1,
-0.7377247, -0.7726717, -1.742303, 0.6666667, 1, 0, 1,
-0.7347998, -0.2123025, -2.511845, 0.6627451, 1, 0, 1,
-0.7321766, -0.7173775, -3.011727, 0.654902, 1, 0, 1,
-0.7318828, 0.4213465, 0.3333798, 0.6509804, 1, 0, 1,
-0.7279392, -0.8412816, -2.716037, 0.6431373, 1, 0, 1,
-0.7265084, 0.01017022, -1.777279, 0.6392157, 1, 0, 1,
-0.7238507, 0.4238516, -0.3221933, 0.6313726, 1, 0, 1,
-0.72066, -0.2948337, -1.220374, 0.627451, 1, 0, 1,
-0.7150682, -1.06941, -3.553921, 0.6196079, 1, 0, 1,
-0.7140561, 1.65654, -1.08396, 0.6156863, 1, 0, 1,
-0.7139086, -1.379501, -3.633351, 0.6078432, 1, 0, 1,
-0.7064337, -0.617943, -0.2919518, 0.6039216, 1, 0, 1,
-0.7026402, -0.2877437, -1.972294, 0.5960785, 1, 0, 1,
-0.6991191, -0.08752725, -2.178622, 0.5882353, 1, 0, 1,
-0.6983277, 1.227084, -0.9664723, 0.5843138, 1, 0, 1,
-0.6979119, 1.181351, -0.638572, 0.5764706, 1, 0, 1,
-0.6908879, 0.270466, -2.950232, 0.572549, 1, 0, 1,
-0.6903898, -0.9827542, -3.42427, 0.5647059, 1, 0, 1,
-0.6852195, -0.7687222, -1.866567, 0.5607843, 1, 0, 1,
-0.684621, -0.7240682, -2.642072, 0.5529412, 1, 0, 1,
-0.6791999, -0.678628, -2.623938, 0.5490196, 1, 0, 1,
-0.6767083, -0.9093468, -1.768418, 0.5411765, 1, 0, 1,
-0.6695739, 0.7094069, 0.7995077, 0.5372549, 1, 0, 1,
-0.6679725, 0.7063007, -0.2213742, 0.5294118, 1, 0, 1,
-0.6620625, 0.1233053, -1.569194, 0.5254902, 1, 0, 1,
-0.6572127, 0.9777014, 0.4546563, 0.5176471, 1, 0, 1,
-0.6520691, 1.402135, 0.4674052, 0.5137255, 1, 0, 1,
-0.6517672, -0.05294012, -1.984457, 0.5058824, 1, 0, 1,
-0.649459, -1.181097, -5.950924, 0.5019608, 1, 0, 1,
-0.6454391, 0.2941401, 0.6723582, 0.4941176, 1, 0, 1,
-0.6444221, -0.8859763, -1.972652, 0.4862745, 1, 0, 1,
-0.6410891, 0.5990241, -0.6502672, 0.4823529, 1, 0, 1,
-0.6386049, 0.3328778, -0.9169884, 0.4745098, 1, 0, 1,
-0.6376723, -1.657908, -3.945882, 0.4705882, 1, 0, 1,
-0.6372091, -0.9129655, -1.975986, 0.4627451, 1, 0, 1,
-0.6363431, 0.2164002, 0.1366314, 0.4588235, 1, 0, 1,
-0.6344734, -0.1973462, -1.118642, 0.4509804, 1, 0, 1,
-0.6329327, 0.5884424, -2.098043, 0.4470588, 1, 0, 1,
-0.6283802, 0.08381107, -1.331653, 0.4392157, 1, 0, 1,
-0.6266396, 0.007532048, -2.393076, 0.4352941, 1, 0, 1,
-0.6261587, 0.8102475, -2.033242, 0.427451, 1, 0, 1,
-0.6237736, 1.895344, 0.8188241, 0.4235294, 1, 0, 1,
-0.6227955, 0.4020572, -1.552764, 0.4156863, 1, 0, 1,
-0.6082833, 0.6703501, -1.379575, 0.4117647, 1, 0, 1,
-0.6007786, -0.3127488, -0.7893499, 0.4039216, 1, 0, 1,
-0.5998977, -0.5823252, -2.740793, 0.3960784, 1, 0, 1,
-0.5986267, -1.375466, -5.633367, 0.3921569, 1, 0, 1,
-0.5910492, 1.243042, -0.2100827, 0.3843137, 1, 0, 1,
-0.5855708, -2.1799, -3.025075, 0.3803922, 1, 0, 1,
-0.5832672, -2.605185, -1.805433, 0.372549, 1, 0, 1,
-0.5830269, 1.184189, -0.3523896, 0.3686275, 1, 0, 1,
-0.5816321, 0.7136402, 0.7595158, 0.3607843, 1, 0, 1,
-0.581036, 1.783816, -0.2202045, 0.3568628, 1, 0, 1,
-0.5797721, 0.06276336, -1.418638, 0.3490196, 1, 0, 1,
-0.5781261, 0.7374057, 0.3634574, 0.345098, 1, 0, 1,
-0.5722747, -1.377154, -3.104958, 0.3372549, 1, 0, 1,
-0.5712143, 1.628523, -0.4040386, 0.3333333, 1, 0, 1,
-0.568549, 1.372545, 0.4214374, 0.3254902, 1, 0, 1,
-0.5676466, 0.293552, 0.209747, 0.3215686, 1, 0, 1,
-0.5656086, -1.3625, -1.310057, 0.3137255, 1, 0, 1,
-0.5646228, 0.4422439, -1.292722, 0.3098039, 1, 0, 1,
-0.5619995, -0.4485387, -2.589672, 0.3019608, 1, 0, 1,
-0.5526462, 0.1352525, 0.2431681, 0.2941177, 1, 0, 1,
-0.5502228, 0.5047966, -0.6098579, 0.2901961, 1, 0, 1,
-0.5484548, 0.2019662, -0.6479016, 0.282353, 1, 0, 1,
-0.5440214, 1.076457, -0.2670442, 0.2784314, 1, 0, 1,
-0.5434651, 1.431293, 0.05216213, 0.2705882, 1, 0, 1,
-0.5374601, 0.2718869, -1.508218, 0.2666667, 1, 0, 1,
-0.5309183, -0.6920166, -0.5065281, 0.2588235, 1, 0, 1,
-0.5262387, 0.9261823, 0.5034235, 0.254902, 1, 0, 1,
-0.5208701, -1.144843, -1.994328, 0.2470588, 1, 0, 1,
-0.5199114, -0.02634556, -2.714436, 0.2431373, 1, 0, 1,
-0.5197607, 2.12655, -0.2262706, 0.2352941, 1, 0, 1,
-0.5184686, -1.057277, -2.839958, 0.2313726, 1, 0, 1,
-0.5136728, -0.6050408, -2.895316, 0.2235294, 1, 0, 1,
-0.5125467, 1.033452, -2.442885, 0.2196078, 1, 0, 1,
-0.5115005, -0.4585216, -2.222523, 0.2117647, 1, 0, 1,
-0.5092521, -1.927612, -3.276913, 0.2078431, 1, 0, 1,
-0.5042719, -0.915149, -2.440642, 0.2, 1, 0, 1,
-0.5015515, 0.7423623, 0.9349319, 0.1921569, 1, 0, 1,
-0.5010872, 1.578493, 0.1094094, 0.1882353, 1, 0, 1,
-0.500002, 0.2689271, -2.616335, 0.1803922, 1, 0, 1,
-0.4988211, -1.683193, -1.02375, 0.1764706, 1, 0, 1,
-0.4954614, -1.057573, -1.940881, 0.1686275, 1, 0, 1,
-0.491611, 0.2714138, -1.149303, 0.1647059, 1, 0, 1,
-0.4897086, 0.8208402, -1.098423, 0.1568628, 1, 0, 1,
-0.4857767, 0.1684239, -0.8064094, 0.1529412, 1, 0, 1,
-0.4823801, 0.413993, -0.1494316, 0.145098, 1, 0, 1,
-0.4818949, -1.117809, -1.752773, 0.1411765, 1, 0, 1,
-0.4743519, 0.4648315, 0.7577693, 0.1333333, 1, 0, 1,
-0.4711222, -1.594936, -2.386122, 0.1294118, 1, 0, 1,
-0.4556062, 0.3448946, -0.8926532, 0.1215686, 1, 0, 1,
-0.452445, -0.5634005, -3.182051, 0.1176471, 1, 0, 1,
-0.4458157, 1.283535, 0.3942897, 0.1098039, 1, 0, 1,
-0.4443326, 0.9528856, -1.654322, 0.1058824, 1, 0, 1,
-0.4398683, 0.06964121, -2.105278, 0.09803922, 1, 0, 1,
-0.4220654, 0.0259888, -2.374399, 0.09019608, 1, 0, 1,
-0.4211583, 0.1181203, -3.702914, 0.08627451, 1, 0, 1,
-0.4181923, -0.0371194, -1.1865, 0.07843138, 1, 0, 1,
-0.4099865, -0.05577808, -1.489302, 0.07450981, 1, 0, 1,
-0.4059635, 1.313136, -0.3613052, 0.06666667, 1, 0, 1,
-0.4029323, 0.04989177, -2.208748, 0.0627451, 1, 0, 1,
-0.3977607, -0.1282614, -1.958973, 0.05490196, 1, 0, 1,
-0.3961962, 1.291827, -0.4824414, 0.05098039, 1, 0, 1,
-0.3942442, 0.484967, -2.89804, 0.04313726, 1, 0, 1,
-0.3899531, 1.821651, -0.6622656, 0.03921569, 1, 0, 1,
-0.3883242, 1.022081, 0.4033156, 0.03137255, 1, 0, 1,
-0.3880984, -1.364641, -2.681717, 0.02745098, 1, 0, 1,
-0.3876771, 0.2056812, -0.7646399, 0.01960784, 1, 0, 1,
-0.3870192, 0.02959586, -1.452794, 0.01568628, 1, 0, 1,
-0.3868815, -0.3818959, -1.522798, 0.007843138, 1, 0, 1,
-0.3818768, -1.003517, -1.786051, 0.003921569, 1, 0, 1,
-0.3818156, -1.205683, -3.346867, 0, 1, 0.003921569, 1,
-0.3806882, -0.3751812, -3.344101, 0, 1, 0.01176471, 1,
-0.3799941, -1.266255, -2.58937, 0, 1, 0.01568628, 1,
-0.3776002, 0.6183939, -0.7722405, 0, 1, 0.02352941, 1,
-0.3764948, 1.162336, -0.4635099, 0, 1, 0.02745098, 1,
-0.3725229, 0.425421, -1.635304, 0, 1, 0.03529412, 1,
-0.3705445, 0.04256254, -1.362874, 0, 1, 0.03921569, 1,
-0.3654913, 0.5099707, -0.5595444, 0, 1, 0.04705882, 1,
-0.3631302, 1.006214, -2.313867, 0, 1, 0.05098039, 1,
-0.3626525, 0.5185804, -0.6553987, 0, 1, 0.05882353, 1,
-0.3620592, -0.006329047, -1.501254, 0, 1, 0.0627451, 1,
-0.3608627, 3.045228, 0.09320127, 0, 1, 0.07058824, 1,
-0.3581639, -0.4117154, -3.091676, 0, 1, 0.07450981, 1,
-0.3550713, 0.131827, -1.370491, 0, 1, 0.08235294, 1,
-0.3519848, -0.584352, -0.2657248, 0, 1, 0.08627451, 1,
-0.3514351, -1.941661, -3.490012, 0, 1, 0.09411765, 1,
-0.3467946, -0.3595906, -1.913076, 0, 1, 0.1019608, 1,
-0.3455808, -0.3465342, -2.676717, 0, 1, 0.1058824, 1,
-0.3407695, 0.1528977, -0.4630912, 0, 1, 0.1137255, 1,
-0.3372982, -1.336948, -3.019866, 0, 1, 0.1176471, 1,
-0.3362379, -0.513252, -3.078574, 0, 1, 0.1254902, 1,
-0.3340923, 0.04315986, -2.263219, 0, 1, 0.1294118, 1,
-0.3336738, 0.0196007, -3.609821, 0, 1, 0.1372549, 1,
-0.3297405, 0.9364107, 0.09046698, 0, 1, 0.1411765, 1,
-0.3254973, 0.4345924, -1.201142, 0, 1, 0.1490196, 1,
-0.3226432, 0.1243867, -1.801778, 0, 1, 0.1529412, 1,
-0.3223795, 0.2532989, -1.38786, 0, 1, 0.1607843, 1,
-0.321842, 0.3628739, -0.6750624, 0, 1, 0.1647059, 1,
-0.3142642, -0.1031389, -0.8340494, 0, 1, 0.172549, 1,
-0.308301, 0.1921714, -0.2946116, 0, 1, 0.1764706, 1,
-0.3075109, 0.3758402, 0.02608703, 0, 1, 0.1843137, 1,
-0.3068545, 1.458378, 0.3596044, 0, 1, 0.1882353, 1,
-0.3064705, 1.033057, -0.5515924, 0, 1, 0.1960784, 1,
-0.3024882, 0.634431, -1.554235, 0, 1, 0.2039216, 1,
-0.2941294, 1.222348, -1.512969, 0, 1, 0.2078431, 1,
-0.2913041, -0.7304463, -2.171444, 0, 1, 0.2156863, 1,
-0.2892003, -0.524545, -1.434827, 0, 1, 0.2196078, 1,
-0.2869792, 0.8763474, -2.739884, 0, 1, 0.227451, 1,
-0.2842624, -0.2815498, -2.566741, 0, 1, 0.2313726, 1,
-0.2842102, 0.2005032, -0.7072241, 0, 1, 0.2392157, 1,
-0.280366, 0.8333867, -0.01660466, 0, 1, 0.2431373, 1,
-0.2800964, 0.3325627, -1.924048, 0, 1, 0.2509804, 1,
-0.279955, 0.4830167, 0.5672383, 0, 1, 0.254902, 1,
-0.273995, -0.5906837, -1.421273, 0, 1, 0.2627451, 1,
-0.2691385, -1.532584, -2.494163, 0, 1, 0.2666667, 1,
-0.2684255, 0.02764043, -2.061347, 0, 1, 0.2745098, 1,
-0.268411, 0.3040104, -0.03292999, 0, 1, 0.2784314, 1,
-0.2680361, -0.9412675, -2.722667, 0, 1, 0.2862745, 1,
-0.2667229, -0.7503991, -2.261177, 0, 1, 0.2901961, 1,
-0.2591286, -2.236034, -1.872133, 0, 1, 0.2980392, 1,
-0.2586294, 0.06919384, -1.071906, 0, 1, 0.3058824, 1,
-0.2579564, 1.236835, -1.001642, 0, 1, 0.3098039, 1,
-0.2571388, -0.798813, -1.46092, 0, 1, 0.3176471, 1,
-0.2569145, -0.6907957, -3.654084, 0, 1, 0.3215686, 1,
-0.2536104, -0.3844241, -3.468204, 0, 1, 0.3294118, 1,
-0.2529933, -0.1676039, -1.219316, 0, 1, 0.3333333, 1,
-0.2513736, 1.022395, -0.2617656, 0, 1, 0.3411765, 1,
-0.2444744, -0.2150508, -1.366419, 0, 1, 0.345098, 1,
-0.2401226, 0.02468678, -1.97242, 0, 1, 0.3529412, 1,
-0.2332335, 0.6571441, -0.2805581, 0, 1, 0.3568628, 1,
-0.2328977, 0.7071419, 0.1262088, 0, 1, 0.3647059, 1,
-0.2265676, -0.2183057, -1.928389, 0, 1, 0.3686275, 1,
-0.2226766, 0.3759158, -0.1414902, 0, 1, 0.3764706, 1,
-0.2211889, -0.7089711, -3.049936, 0, 1, 0.3803922, 1,
-0.2183332, 0.7235672, -1.878612, 0, 1, 0.3882353, 1,
-0.2174895, -0.3355888, -4.033791, 0, 1, 0.3921569, 1,
-0.2150247, 0.410033, -0.1709585, 0, 1, 0.4, 1,
-0.2098317, 0.3986846, -0.09466096, 0, 1, 0.4078431, 1,
-0.2094714, 0.3518173, -1.889072, 0, 1, 0.4117647, 1,
-0.2053841, -0.6150456, -1.256581, 0, 1, 0.4196078, 1,
-0.2048381, 0.2441476, -1.854475, 0, 1, 0.4235294, 1,
-0.2039286, -0.4556296, -2.312757, 0, 1, 0.4313726, 1,
-0.2008688, -2.016867, -2.330559, 0, 1, 0.4352941, 1,
-0.1964674, -1.623473, -3.320167, 0, 1, 0.4431373, 1,
-0.1964318, 0.9448231, 0.4474404, 0, 1, 0.4470588, 1,
-0.1869108, -1.413628, -3.816452, 0, 1, 0.454902, 1,
-0.186122, -0.2205867, -1.964025, 0, 1, 0.4588235, 1,
-0.1860354, 0.7988076, -1.009796, 0, 1, 0.4666667, 1,
-0.1848175, 0.2077323, -1.059176, 0, 1, 0.4705882, 1,
-0.1812959, 0.1316358, -1.3649, 0, 1, 0.4784314, 1,
-0.1810014, -0.3615584, -1.791212, 0, 1, 0.4823529, 1,
-0.1770622, 1.889857, 1.38145, 0, 1, 0.4901961, 1,
-0.1760475, 0.4091659, -0.1300157, 0, 1, 0.4941176, 1,
-0.1745226, 1.178153, 0.3367641, 0, 1, 0.5019608, 1,
-0.1719603, -1.555465, -4.521975, 0, 1, 0.509804, 1,
-0.1693461, 1.461913, -2.892187, 0, 1, 0.5137255, 1,
-0.1634198, 0.08199057, -1.693798, 0, 1, 0.5215687, 1,
-0.1613329, 0.429501, 0.9568476, 0, 1, 0.5254902, 1,
-0.159743, -0.21743, -2.620362, 0, 1, 0.5333334, 1,
-0.1545125, 0.04277551, -1.612745, 0, 1, 0.5372549, 1,
-0.153752, -0.7480705, -2.265374, 0, 1, 0.5450981, 1,
-0.1506725, 1.139379, 0.8929394, 0, 1, 0.5490196, 1,
-0.1480962, -0.03206135, -2.579544, 0, 1, 0.5568628, 1,
-0.146836, 0.335679, -1.117885, 0, 1, 0.5607843, 1,
-0.1465987, 1.21558, -1.285976, 0, 1, 0.5686275, 1,
-0.1454891, 0.4622767, -1.594047, 0, 1, 0.572549, 1,
-0.1449563, 1.589601, -1.36966, 0, 1, 0.5803922, 1,
-0.1407387, -0.1130997, -1.734939, 0, 1, 0.5843138, 1,
-0.1354654, -0.9505202, -3.029893, 0, 1, 0.5921569, 1,
-0.1342609, 1.116481, -0.281307, 0, 1, 0.5960785, 1,
-0.1317042, 3.066117, 2.32392, 0, 1, 0.6039216, 1,
-0.1310174, 0.469178, 1.325706, 0, 1, 0.6117647, 1,
-0.1300391, 0.539658, 0.6536759, 0, 1, 0.6156863, 1,
-0.1284317, -1.299941, -1.573787, 0, 1, 0.6235294, 1,
-0.1282439, 1.476197, 1.379492, 0, 1, 0.627451, 1,
-0.1279967, 2.432243, 0.002273682, 0, 1, 0.6352941, 1,
-0.1273911, -0.08291547, -3.83246, 0, 1, 0.6392157, 1,
-0.1246717, -0.9252931, -2.460404, 0, 1, 0.6470588, 1,
-0.1243269, 0.6602519, -0.4840069, 0, 1, 0.6509804, 1,
-0.124308, 0.800806, -1.21799, 0, 1, 0.6588235, 1,
-0.1214892, 0.04317287, -0.1641945, 0, 1, 0.6627451, 1,
-0.1201, 0.3435197, 0.2731553, 0, 1, 0.6705883, 1,
-0.1190254, 1.440686, -1.654941, 0, 1, 0.6745098, 1,
-0.1164796, -0.02747236, -1.937385, 0, 1, 0.682353, 1,
-0.1153146, 1.121151, 0.5853688, 0, 1, 0.6862745, 1,
-0.1140924, -0.474217, -2.498709, 0, 1, 0.6941177, 1,
-0.1096854, 0.4503533, -0.5613258, 0, 1, 0.7019608, 1,
-0.1001502, -0.6214276, -3.775581, 0, 1, 0.7058824, 1,
-0.09595763, 0.8549054, -1.184526, 0, 1, 0.7137255, 1,
-0.08911177, -1.903769, -4.214857, 0, 1, 0.7176471, 1,
-0.08625631, 1.150032, -0.6763619, 0, 1, 0.7254902, 1,
-0.08548754, 0.7496284, 0.6577655, 0, 1, 0.7294118, 1,
-0.0830342, -1.120033, -2.952947, 0, 1, 0.7372549, 1,
-0.0820268, 1.328493, -1.25164, 0, 1, 0.7411765, 1,
-0.07917329, 0.145748, -1.257972, 0, 1, 0.7490196, 1,
-0.07902749, -1.063916, -1.685257, 0, 1, 0.7529412, 1,
-0.07829648, 1.292446, -0.2810235, 0, 1, 0.7607843, 1,
-0.07708401, 1.022236, 1.564425, 0, 1, 0.7647059, 1,
-0.0761396, 0.6199155, -0.2232972, 0, 1, 0.772549, 1,
-0.07222187, -1.327314, -4.358949, 0, 1, 0.7764706, 1,
-0.07114259, 0.5192057, 1.065431, 0, 1, 0.7843137, 1,
-0.07036545, -0.2331639, -2.62281, 0, 1, 0.7882353, 1,
-0.06615841, 0.2730728, -1.311399, 0, 1, 0.7960784, 1,
-0.06442297, 1.500459, -1.092191, 0, 1, 0.8039216, 1,
-0.06188978, 1.037205, -0.1631793, 0, 1, 0.8078431, 1,
-0.06109758, -1.417065, -1.430997, 0, 1, 0.8156863, 1,
-0.06013079, -1.229673, -4.495824, 0, 1, 0.8196079, 1,
-0.0531318, 0.08289068, -2.507744, 0, 1, 0.827451, 1,
-0.05248113, 0.08266594, -0.4375485, 0, 1, 0.8313726, 1,
-0.05220463, -0.7749941, 0.03831663, 0, 1, 0.8392157, 1,
-0.04964809, -1.495787, -3.839286, 0, 1, 0.8431373, 1,
-0.04853209, 0.5575981, 1.244301, 0, 1, 0.8509804, 1,
-0.04727825, 0.8918509, -0.9636255, 0, 1, 0.854902, 1,
-0.04450018, 0.775504, -2.31261, 0, 1, 0.8627451, 1,
-0.04020255, -0.3548864, -0.804402, 0, 1, 0.8666667, 1,
-0.03284488, -1.89537, -2.505243, 0, 1, 0.8745098, 1,
-0.02945542, -0.5224024, -1.304734, 0, 1, 0.8784314, 1,
-0.02493312, 0.9299267, -0.1361407, 0, 1, 0.8862745, 1,
-0.02301493, -0.719209, -2.219403, 0, 1, 0.8901961, 1,
-0.02178312, -1.546163, -2.097043, 0, 1, 0.8980392, 1,
-0.02094956, -0.6697423, -3.635789, 0, 1, 0.9058824, 1,
-0.02085375, 0.1748463, 0.8338973, 0, 1, 0.9098039, 1,
-0.01911973, -0.1780032, -3.161258, 0, 1, 0.9176471, 1,
-0.01788409, 0.6443546, -1.59212, 0, 1, 0.9215686, 1,
-0.01577176, 0.08571953, -1.194456, 0, 1, 0.9294118, 1,
-0.01247825, 1.163204, 0.3701367, 0, 1, 0.9333333, 1,
-0.01088361, -0.7200301, -2.48921, 0, 1, 0.9411765, 1,
-0.01044005, 0.2876326, 0.3099625, 0, 1, 0.945098, 1,
-0.008529945, 1.501941, -1.179851, 0, 1, 0.9529412, 1,
-0.006263683, -1.011779, -0.8799455, 0, 1, 0.9568627, 1,
-0.005921503, -0.1032526, -1.559393, 0, 1, 0.9647059, 1,
-0.004148218, -0.9454155, -3.262794, 0, 1, 0.9686275, 1,
-0.002400432, -0.1844065, -2.232371, 0, 1, 0.9764706, 1,
0.002480536, -0.5402932, 3.073601, 0, 1, 0.9803922, 1,
0.00355853, 0.8520948, -0.1656847, 0, 1, 0.9882353, 1,
0.005064569, 0.1989697, -0.2971924, 0, 1, 0.9921569, 1,
0.005723896, 0.4109199, 1.626631, 0, 1, 1, 1,
0.01207067, -0.6702949, 2.427321, 0, 0.9921569, 1, 1,
0.01281172, -0.7506381, 2.652901, 0, 0.9882353, 1, 1,
0.01366926, 0.3301918, 0.4960054, 0, 0.9803922, 1, 1,
0.02289822, 0.58007, 0.2949868, 0, 0.9764706, 1, 1,
0.02596614, 1.402233, -1.119644, 0, 0.9686275, 1, 1,
0.02789592, 0.2963421, -0.179538, 0, 0.9647059, 1, 1,
0.02836252, -1.038068, 2.719965, 0, 0.9568627, 1, 1,
0.0302754, 1.354492, 0.6779245, 0, 0.9529412, 1, 1,
0.03100396, -1.142433, 3.341181, 0, 0.945098, 1, 1,
0.0354713, 0.3053212, -1.104388, 0, 0.9411765, 1, 1,
0.0427247, -0.09870269, 1.697352, 0, 0.9333333, 1, 1,
0.04493809, -0.5526611, 2.351341, 0, 0.9294118, 1, 1,
0.04623105, -0.2823775, 1.886231, 0, 0.9215686, 1, 1,
0.04924395, 0.9822356, -1.179193, 0, 0.9176471, 1, 1,
0.04927075, 0.9937036, -0.03275203, 0, 0.9098039, 1, 1,
0.05291159, -0.2015209, 3.26702, 0, 0.9058824, 1, 1,
0.05430404, 1.264846, -0.3478547, 0, 0.8980392, 1, 1,
0.05766097, 0.3094525, 0.2832523, 0, 0.8901961, 1, 1,
0.05803619, 1.309951, 0.5342671, 0, 0.8862745, 1, 1,
0.05808099, -3.192079, 3.146509, 0, 0.8784314, 1, 1,
0.06715874, 0.1575255, 0.4493845, 0, 0.8745098, 1, 1,
0.07010338, 0.6727789, 0.4042049, 0, 0.8666667, 1, 1,
0.0723663, -2.565365, 3.131998, 0, 0.8627451, 1, 1,
0.07746822, 0.02382285, -1.003362, 0, 0.854902, 1, 1,
0.07747428, 1.113742, 1.56806, 0, 0.8509804, 1, 1,
0.07849797, 0.6853338, 1.235565, 0, 0.8431373, 1, 1,
0.07925812, -0.6804753, 4.234595, 0, 0.8392157, 1, 1,
0.08434049, 1.182925, -0.8322581, 0, 0.8313726, 1, 1,
0.086454, 0.09074301, 1.353466, 0, 0.827451, 1, 1,
0.0884954, -0.8253883, 2.847508, 0, 0.8196079, 1, 1,
0.08884472, 0.1887551, 1.32871, 0, 0.8156863, 1, 1,
0.09280252, -0.2497114, 3.02493, 0, 0.8078431, 1, 1,
0.09441715, -0.2267285, 2.393026, 0, 0.8039216, 1, 1,
0.09805225, 0.5269151, 1.316344, 0, 0.7960784, 1, 1,
0.09881466, 0.3451833, 2.361332, 0, 0.7882353, 1, 1,
0.1019967, 1.292203, -1.350078, 0, 0.7843137, 1, 1,
0.1053446, 0.3739294, 0.739836, 0, 0.7764706, 1, 1,
0.1084675, 1.961832, -0.6775241, 0, 0.772549, 1, 1,
0.1087109, 0.4767328, 0.9686038, 0, 0.7647059, 1, 1,
0.1103111, 0.4539644, 1.029583, 0, 0.7607843, 1, 1,
0.1109508, -0.7479586, 2.045868, 0, 0.7529412, 1, 1,
0.1143526, -1.23667, 3.497937, 0, 0.7490196, 1, 1,
0.116296, -0.06119231, 2.31586, 0, 0.7411765, 1, 1,
0.1193537, 0.6256862, -0.4728725, 0, 0.7372549, 1, 1,
0.1200924, -0.9409457, 1.461463, 0, 0.7294118, 1, 1,
0.1244648, 1.557548, -0.04790502, 0, 0.7254902, 1, 1,
0.1252491, -1.602768, 2.583141, 0, 0.7176471, 1, 1,
0.1257221, 1.031065, -0.6361345, 0, 0.7137255, 1, 1,
0.1285086, -0.8621283, 3.504454, 0, 0.7058824, 1, 1,
0.1292235, -0.1954198, 3.477107, 0, 0.6980392, 1, 1,
0.1345648, 2.500422, 0.9453108, 0, 0.6941177, 1, 1,
0.1398901, -1.247261, 3.724032, 0, 0.6862745, 1, 1,
0.1402127, -0.2684599, 4.105814, 0, 0.682353, 1, 1,
0.1413952, -0.1656189, 2.601822, 0, 0.6745098, 1, 1,
0.1418273, 1.921591, 1.22598, 0, 0.6705883, 1, 1,
0.1467367, -0.08493023, 1.582667, 0, 0.6627451, 1, 1,
0.1518806, -0.09497303, 2.166071, 0, 0.6588235, 1, 1,
0.1545015, -1.16816, 3.088082, 0, 0.6509804, 1, 1,
0.1559917, 1.88915, -0.2186145, 0, 0.6470588, 1, 1,
0.1566246, -1.577765, 4.783674, 0, 0.6392157, 1, 1,
0.1575515, 1.120632, -0.05576085, 0, 0.6352941, 1, 1,
0.1584231, -0.1507862, 1.748563, 0, 0.627451, 1, 1,
0.1643415, 0.06150524, 0.8735198, 0, 0.6235294, 1, 1,
0.1695504, -0.1661189, 2.940823, 0, 0.6156863, 1, 1,
0.171129, -0.9737285, 1.100917, 0, 0.6117647, 1, 1,
0.174872, 0.1326438, 0.1920284, 0, 0.6039216, 1, 1,
0.1767183, 0.3101634, 0.8997349, 0, 0.5960785, 1, 1,
0.1808961, -2.326914, 2.906089, 0, 0.5921569, 1, 1,
0.1814194, -0.2837801, 2.79808, 0, 0.5843138, 1, 1,
0.1818726, 0.05642481, 1.189634, 0, 0.5803922, 1, 1,
0.1838741, 1.122346, -1.281609, 0, 0.572549, 1, 1,
0.1851818, -2.591317, 1.932702, 0, 0.5686275, 1, 1,
0.1861954, 0.2593893, 0.1737034, 0, 0.5607843, 1, 1,
0.1896701, 0.3616639, 0.3432232, 0, 0.5568628, 1, 1,
0.1927373, -0.6502363, 2.45652, 0, 0.5490196, 1, 1,
0.1927389, -1.761352, 2.739702, 0, 0.5450981, 1, 1,
0.193024, 0.5395409, -0.2538818, 0, 0.5372549, 1, 1,
0.1938874, 0.9450026, -0.1239027, 0, 0.5333334, 1, 1,
0.1955065, 1.302083, -0.4916693, 0, 0.5254902, 1, 1,
0.1971933, 0.8295606, 0.1534848, 0, 0.5215687, 1, 1,
0.1978034, 0.5902264, 1.50549, 0, 0.5137255, 1, 1,
0.2020618, 1.984422, 0.3623676, 0, 0.509804, 1, 1,
0.2084115, 0.04280463, 0.9445779, 0, 0.5019608, 1, 1,
0.2139268, -0.6416953, 2.161978, 0, 0.4941176, 1, 1,
0.2164413, -1.117554, 3.075483, 0, 0.4901961, 1, 1,
0.2169089, 0.5132049, 0.6238141, 0, 0.4823529, 1, 1,
0.2175589, 0.6659012, 0.7936319, 0, 0.4784314, 1, 1,
0.2190536, -1.624139, 1.616806, 0, 0.4705882, 1, 1,
0.2193662, -0.7188962, 2.319472, 0, 0.4666667, 1, 1,
0.2228707, -0.807263, 2.835447, 0, 0.4588235, 1, 1,
0.2349875, -1.351293, 1.30418, 0, 0.454902, 1, 1,
0.2362879, 0.50529, 2.503581, 0, 0.4470588, 1, 1,
0.2366208, 1.225228, -0.5312784, 0, 0.4431373, 1, 1,
0.2413883, -0.1221083, 1.749622, 0, 0.4352941, 1, 1,
0.243016, 0.3839912, -0.6454706, 0, 0.4313726, 1, 1,
0.2461717, -0.9527299, 1.6957, 0, 0.4235294, 1, 1,
0.2469185, 0.3282086, -0.05141789, 0, 0.4196078, 1, 1,
0.25045, 0.1630445, -0.7523159, 0, 0.4117647, 1, 1,
0.2532238, -1.253912, 1.106717, 0, 0.4078431, 1, 1,
0.2552767, 1.449025, 1.14366, 0, 0.4, 1, 1,
0.2563143, -0.1846716, 2.39715, 0, 0.3921569, 1, 1,
0.2587821, -0.3069099, 3.028965, 0, 0.3882353, 1, 1,
0.2631985, -0.08704816, 2.186636, 0, 0.3803922, 1, 1,
0.2654375, -0.9446084, 3.316978, 0, 0.3764706, 1, 1,
0.2662481, -2.500249, 3.441702, 0, 0.3686275, 1, 1,
0.2681233, 2.156526, 0.7399402, 0, 0.3647059, 1, 1,
0.2707748, 1.623297, 1.947609, 0, 0.3568628, 1, 1,
0.2782615, -0.4898415, 0.5613994, 0, 0.3529412, 1, 1,
0.278978, -0.3025525, 4.924021, 0, 0.345098, 1, 1,
0.2800141, 1.340015, 0.6627735, 0, 0.3411765, 1, 1,
0.2831959, -0.06983768, 1.559488, 0, 0.3333333, 1, 1,
0.2851872, -1.725844, 1.886804, 0, 0.3294118, 1, 1,
0.2863972, 0.4513593, 1.241707, 0, 0.3215686, 1, 1,
0.2939358, 0.5562175, -0.2487635, 0, 0.3176471, 1, 1,
0.2972981, -0.08867037, 2.590203, 0, 0.3098039, 1, 1,
0.2979766, -2.15132, 2.219803, 0, 0.3058824, 1, 1,
0.2989126, 0.2961612, 1.614547, 0, 0.2980392, 1, 1,
0.3015011, 0.5476521, 0.9705808, 0, 0.2901961, 1, 1,
0.3061993, -0.7382741, 1.780961, 0, 0.2862745, 1, 1,
0.3151557, -0.3773492, 2.953756, 0, 0.2784314, 1, 1,
0.3163044, 0.8186129, 1.164581, 0, 0.2745098, 1, 1,
0.3192332, -1.02948, 4.600983, 0, 0.2666667, 1, 1,
0.3200403, 1.744256, 1.450132, 0, 0.2627451, 1, 1,
0.3207718, 1.036131, 0.1422878, 0, 0.254902, 1, 1,
0.3238342, -0.4947199, 2.933588, 0, 0.2509804, 1, 1,
0.3244644, -0.4009193, 1.517112, 0, 0.2431373, 1, 1,
0.3248454, 0.4221934, 0.5452715, 0, 0.2392157, 1, 1,
0.3373642, 0.7287192, 1.447489, 0, 0.2313726, 1, 1,
0.3422236, 0.8987759, 0.6847264, 0, 0.227451, 1, 1,
0.3488966, -0.155384, 1.98067, 0, 0.2196078, 1, 1,
0.3516642, -0.04734239, 1.991862, 0, 0.2156863, 1, 1,
0.3624959, 1.184621, 0.9706, 0, 0.2078431, 1, 1,
0.3640965, -1.038472, 0.386, 0, 0.2039216, 1, 1,
0.3645881, -1.406847, 2.166915, 0, 0.1960784, 1, 1,
0.3679068, -0.0968186, 1.022656, 0, 0.1882353, 1, 1,
0.3687811, -0.56429, 2.350188, 0, 0.1843137, 1, 1,
0.3695437, 1.068268, 1.00407, 0, 0.1764706, 1, 1,
0.3705929, 0.960034, 1.015327, 0, 0.172549, 1, 1,
0.3721361, -0.5053734, 3.881464, 0, 0.1647059, 1, 1,
0.3725172, -0.4635395, 1.363205, 0, 0.1607843, 1, 1,
0.3732359, 0.592555, -0.3657146, 0, 0.1529412, 1, 1,
0.3816794, -1.127667, 2.943298, 0, 0.1490196, 1, 1,
0.3828873, -1.811767, 2.650843, 0, 0.1411765, 1, 1,
0.3876329, -1.66411, 2.266183, 0, 0.1372549, 1, 1,
0.3942208, 0.9425711, -1.558418, 0, 0.1294118, 1, 1,
0.3954128, 0.05445455, -0.7497298, 0, 0.1254902, 1, 1,
0.3955798, 0.6473159, 2.297561, 0, 0.1176471, 1, 1,
0.3983105, 0.4983924, 1.158165, 0, 0.1137255, 1, 1,
0.3984883, -0.716297, 3.408198, 0, 0.1058824, 1, 1,
0.3993371, 0.03278907, 0.4864285, 0, 0.09803922, 1, 1,
0.4003077, -1.09692, 2.505151, 0, 0.09411765, 1, 1,
0.4004005, 1.578167, -0.7697434, 0, 0.08627451, 1, 1,
0.4059032, -1.141859, 3.29502, 0, 0.08235294, 1, 1,
0.4085616, -0.1441569, 0.5446643, 0, 0.07450981, 1, 1,
0.4089321, 0.6365391, 1.51148, 0, 0.07058824, 1, 1,
0.415966, -1.952788, 4.790741, 0, 0.0627451, 1, 1,
0.4171593, 0.2358517, 1.669917, 0, 0.05882353, 1, 1,
0.4185756, -0.4182244, 2.152876, 0, 0.05098039, 1, 1,
0.4200083, -0.590373, 3.607399, 0, 0.04705882, 1, 1,
0.4212681, -0.961714, 4.517192, 0, 0.03921569, 1, 1,
0.4235471, -0.5899689, 1.402211, 0, 0.03529412, 1, 1,
0.4243605, -1.001958, 2.469804, 0, 0.02745098, 1, 1,
0.4250844, -0.6889824, 2.576957, 0, 0.02352941, 1, 1,
0.4365346, -0.8128034, 3.445123, 0, 0.01568628, 1, 1,
0.4384199, -1.052437, 3.640889, 0, 0.01176471, 1, 1,
0.448, 0.357596, 0.2149049, 0, 0.003921569, 1, 1,
0.4573561, 0.4976557, 2.493442, 0.003921569, 0, 1, 1,
0.4624689, -2.241247, 1.133843, 0.007843138, 0, 1, 1,
0.462759, -1.094642, 2.805944, 0.01568628, 0, 1, 1,
0.4647216, 0.8787786, 0.4552044, 0.01960784, 0, 1, 1,
0.4651539, -0.3149183, 2.54409, 0.02745098, 0, 1, 1,
0.466006, 1.965392, 0.5689144, 0.03137255, 0, 1, 1,
0.4667574, -0.4634086, 0.7190879, 0.03921569, 0, 1, 1,
0.4677265, -0.9194289, 2.461231, 0.04313726, 0, 1, 1,
0.4681548, 0.9982899, -1.157983, 0.05098039, 0, 1, 1,
0.470846, 2.566818, -0.3350584, 0.05490196, 0, 1, 1,
0.4714705, 1.238151, 1.190731, 0.0627451, 0, 1, 1,
0.4728146, -0.0676475, 2.160399, 0.06666667, 0, 1, 1,
0.4750915, 0.8399646, 0.5095477, 0.07450981, 0, 1, 1,
0.477139, -1.699472, 1.544339, 0.07843138, 0, 1, 1,
0.4832194, -0.004616288, 0.934571, 0.08627451, 0, 1, 1,
0.4862779, 0.9635144, -0.09327453, 0.09019608, 0, 1, 1,
0.4881302, -1.220783, 2.348855, 0.09803922, 0, 1, 1,
0.4898408, 2.675762, 1.544495, 0.1058824, 0, 1, 1,
0.5002908, -0.4576314, 2.680871, 0.1098039, 0, 1, 1,
0.5008752, 0.209039, 2.432979, 0.1176471, 0, 1, 1,
0.5017492, 0.7082486, 0.975907, 0.1215686, 0, 1, 1,
0.5047861, 0.5153515, 0.8050787, 0.1294118, 0, 1, 1,
0.5081012, -1.735063, 2.314243, 0.1333333, 0, 1, 1,
0.5081236, -1.430107, 2.112281, 0.1411765, 0, 1, 1,
0.5119423, -2.0139, 2.976767, 0.145098, 0, 1, 1,
0.5129394, 0.132115, 1.524315, 0.1529412, 0, 1, 1,
0.5201443, 0.5907587, -1.098929, 0.1568628, 0, 1, 1,
0.5210077, 0.3457126, 0.5561321, 0.1647059, 0, 1, 1,
0.522813, 0.4439047, 1.41078, 0.1686275, 0, 1, 1,
0.5236049, -0.8856003, 2.372082, 0.1764706, 0, 1, 1,
0.5262858, -0.1866427, 0.07318533, 0.1803922, 0, 1, 1,
0.5325561, 0.6207141, 0.2755039, 0.1882353, 0, 1, 1,
0.53908, -0.7445605, 2.829352, 0.1921569, 0, 1, 1,
0.5422747, 0.6166326, 1.129618, 0.2, 0, 1, 1,
0.5481662, 0.04770021, 2.596923, 0.2078431, 0, 1, 1,
0.5500305, 0.6446071, 0.01478025, 0.2117647, 0, 1, 1,
0.5510623, -1.678633, 2.265737, 0.2196078, 0, 1, 1,
0.55424, 0.9490823, -2.299678, 0.2235294, 0, 1, 1,
0.5550669, -2.412055, 3.938892, 0.2313726, 0, 1, 1,
0.5585598, -0.9195424, 2.507954, 0.2352941, 0, 1, 1,
0.5615143, 0.3044742, 2.507372, 0.2431373, 0, 1, 1,
0.5630044, 0.09741746, 1.554388, 0.2470588, 0, 1, 1,
0.56669, -0.1371119, 1.779567, 0.254902, 0, 1, 1,
0.569488, -1.634713, 2.322028, 0.2588235, 0, 1, 1,
0.570985, -0.5581719, 1.775279, 0.2666667, 0, 1, 1,
0.5804631, -1.127261, 2.411204, 0.2705882, 0, 1, 1,
0.5840244, 0.9723687, 0.3868417, 0.2784314, 0, 1, 1,
0.5881602, -1.262389, 2.968736, 0.282353, 0, 1, 1,
0.5888261, -1.157728, 2.980292, 0.2901961, 0, 1, 1,
0.5946892, 1.055749, 0.7209492, 0.2941177, 0, 1, 1,
0.5964522, 0.5942789, 1.88541, 0.3019608, 0, 1, 1,
0.6021349, 0.5579607, 0.3226679, 0.3098039, 0, 1, 1,
0.60913, 0.5410808, 1.094572, 0.3137255, 0, 1, 1,
0.6106454, 0.4675844, 0.8380833, 0.3215686, 0, 1, 1,
0.613375, -0.6182415, 2.173733, 0.3254902, 0, 1, 1,
0.6155369, -0.05640064, 1.050583, 0.3333333, 0, 1, 1,
0.6196453, 0.120678, 0.7806944, 0.3372549, 0, 1, 1,
0.6202118, -0.8136978, 2.787529, 0.345098, 0, 1, 1,
0.6205121, 0.8753755, 0.6238914, 0.3490196, 0, 1, 1,
0.6276615, 0.6021163, -0.2173635, 0.3568628, 0, 1, 1,
0.6302099, -0.2540174, 1.943386, 0.3607843, 0, 1, 1,
0.6314315, -0.5289394, 3.044655, 0.3686275, 0, 1, 1,
0.6370064, 0.0009958252, 0.5756799, 0.372549, 0, 1, 1,
0.6444138, -0.2025566, 3.991131, 0.3803922, 0, 1, 1,
0.6450815, 0.8035008, 1.451409, 0.3843137, 0, 1, 1,
0.647728, 0.8343481, 3.017532, 0.3921569, 0, 1, 1,
0.6515929, 0.07214171, 0.8794674, 0.3960784, 0, 1, 1,
0.6546732, 0.4686227, -0.2470182, 0.4039216, 0, 1, 1,
0.6586457, -2.88525, 2.499544, 0.4117647, 0, 1, 1,
0.6640436, 0.01428292, 0.3858016, 0.4156863, 0, 1, 1,
0.6640816, -0.7000448, 2.29209, 0.4235294, 0, 1, 1,
0.6706597, 1.111605, -1.100553, 0.427451, 0, 1, 1,
0.6708412, 1.467409, -0.6154883, 0.4352941, 0, 1, 1,
0.6720945, 0.1640074, 0.8631243, 0.4392157, 0, 1, 1,
0.6765359, -0.8260958, 2.202513, 0.4470588, 0, 1, 1,
0.6775627, -1.089409, 4.440125, 0.4509804, 0, 1, 1,
0.6798839, -0.3811286, 2.117988, 0.4588235, 0, 1, 1,
0.6843619, 1.110155, 0.09876721, 0.4627451, 0, 1, 1,
0.6864725, 1.300694, 0.6431566, 0.4705882, 0, 1, 1,
0.6909023, 0.09982634, 0.1578198, 0.4745098, 0, 1, 1,
0.6958385, -0.2254119, 0.4146864, 0.4823529, 0, 1, 1,
0.6972373, -2.117697, 4.014094, 0.4862745, 0, 1, 1,
0.7036051, -0.7606581, 0.8011007, 0.4941176, 0, 1, 1,
0.7098713, 0.6910835, 0.7573203, 0.5019608, 0, 1, 1,
0.7132561, -0.7629235, 3.115674, 0.5058824, 0, 1, 1,
0.7138771, -0.3679561, 3.356199, 0.5137255, 0, 1, 1,
0.7163993, -0.1970064, 2.205608, 0.5176471, 0, 1, 1,
0.7164825, 0.1349554, 2.066304, 0.5254902, 0, 1, 1,
0.7193674, -0.3218131, 2.984173, 0.5294118, 0, 1, 1,
0.7262034, -0.6380962, 3.362709, 0.5372549, 0, 1, 1,
0.7268696, 0.8111243, 0.6674874, 0.5411765, 0, 1, 1,
0.7293798, -0.6772175, 2.966384, 0.5490196, 0, 1, 1,
0.7335745, 0.8419105, -0.4726825, 0.5529412, 0, 1, 1,
0.7342836, 0.6105726, 1.28201, 0.5607843, 0, 1, 1,
0.7358268, 1.520554, 1.168654, 0.5647059, 0, 1, 1,
0.7377895, 1.631003, 1.955548, 0.572549, 0, 1, 1,
0.7402741, -0.3380527, 1.744489, 0.5764706, 0, 1, 1,
0.7419865, 0.3278516, 0.3763543, 0.5843138, 0, 1, 1,
0.7420394, -1.1904, 4.283863, 0.5882353, 0, 1, 1,
0.7449871, -0.90065, 2.034932, 0.5960785, 0, 1, 1,
0.7527324, -0.9661808, 2.821013, 0.6039216, 0, 1, 1,
0.7552457, -2.188039, 0.7252482, 0.6078432, 0, 1, 1,
0.755739, -0.7509472, 2.092649, 0.6156863, 0, 1, 1,
0.7676074, 0.7717034, 1.707815, 0.6196079, 0, 1, 1,
0.7698222, -1.65171, 3.697474, 0.627451, 0, 1, 1,
0.7800892, -0.3735723, 1.467025, 0.6313726, 0, 1, 1,
0.7805998, 0.5829508, 1.820432, 0.6392157, 0, 1, 1,
0.7813125, -2.148931, 2.162327, 0.6431373, 0, 1, 1,
0.785973, 0.1112673, 3.181019, 0.6509804, 0, 1, 1,
0.786679, -0.06774922, 0.9952424, 0.654902, 0, 1, 1,
0.7881505, -0.168665, 0.7032528, 0.6627451, 0, 1, 1,
0.7906254, 0.4552314, 1.533598, 0.6666667, 0, 1, 1,
0.7909738, -1.647129, 2.605011, 0.6745098, 0, 1, 1,
0.7933089, 0.8663598, -1.409755, 0.6784314, 0, 1, 1,
0.793542, 0.09261044, 3.271126, 0.6862745, 0, 1, 1,
0.7936714, 1.296289, 0.4467642, 0.6901961, 0, 1, 1,
0.7966238, 2.216523, 2.063648, 0.6980392, 0, 1, 1,
0.7999822, 0.6592791, 2.37839, 0.7058824, 0, 1, 1,
0.8035322, 1.540806, 0.01839289, 0.7098039, 0, 1, 1,
0.8038649, 0.6814521, 0.2195158, 0.7176471, 0, 1, 1,
0.8104877, 0.5983198, 1.3086, 0.7215686, 0, 1, 1,
0.8147141, -2.405458, 4.700619, 0.7294118, 0, 1, 1,
0.8168001, 0.7477642, -1.397527, 0.7333333, 0, 1, 1,
0.8261334, -1.017324, 0.3960123, 0.7411765, 0, 1, 1,
0.8265035, -0.2154426, -0.03989237, 0.7450981, 0, 1, 1,
0.8276291, -0.3458417, 2.761857, 0.7529412, 0, 1, 1,
0.8287165, -0.9653386, 1.704002, 0.7568628, 0, 1, 1,
0.8322157, 0.283288, 1.721574, 0.7647059, 0, 1, 1,
0.8345667, -0.1449703, 0.2360238, 0.7686275, 0, 1, 1,
0.8347571, 0.522094, 0.5578932, 0.7764706, 0, 1, 1,
0.8401523, -0.2494481, 2.166715, 0.7803922, 0, 1, 1,
0.8440225, -0.7639947, 1.695328, 0.7882353, 0, 1, 1,
0.8451101, 0.9035608, -0.2755302, 0.7921569, 0, 1, 1,
0.8510208, -0.8632318, 2.152858, 0.8, 0, 1, 1,
0.8526075, -3.044564, 2.838888, 0.8078431, 0, 1, 1,
0.8556066, -0.102328, 1.250154, 0.8117647, 0, 1, 1,
0.857806, -1.579148, 2.238986, 0.8196079, 0, 1, 1,
0.8596435, 1.802605, 0.4472947, 0.8235294, 0, 1, 1,
0.8606803, -1.95086, 3.069937, 0.8313726, 0, 1, 1,
0.8634714, -0.6455817, 1.130468, 0.8352941, 0, 1, 1,
0.866326, 0.2808083, 1.20143, 0.8431373, 0, 1, 1,
0.8670248, 0.2533813, 2.232009, 0.8470588, 0, 1, 1,
0.8691017, -0.5430653, 1.725315, 0.854902, 0, 1, 1,
0.8720526, 0.6417897, 0.7288904, 0.8588235, 0, 1, 1,
0.8721545, -0.1079506, 1.259532, 0.8666667, 0, 1, 1,
0.8730892, 0.01259127, 1.797585, 0.8705882, 0, 1, 1,
0.8755612, -1.942631, 2.677779, 0.8784314, 0, 1, 1,
0.8780534, -1.794434, 2.183789, 0.8823529, 0, 1, 1,
0.8845667, 0.6247659, 0.6419122, 0.8901961, 0, 1, 1,
0.8847626, -1.247791, 1.484429, 0.8941177, 0, 1, 1,
0.8904536, -1.496647, 0.9203474, 0.9019608, 0, 1, 1,
0.8904955, 0.9514143, 1.127695, 0.9098039, 0, 1, 1,
0.8918318, 0.9804052, 1.938015, 0.9137255, 0, 1, 1,
0.9015769, 0.1820294, -0.002493134, 0.9215686, 0, 1, 1,
0.9122684, 0.5119641, 1.578193, 0.9254902, 0, 1, 1,
0.9129117, -1.57622, 2.714172, 0.9333333, 0, 1, 1,
0.9181951, -1.840616, 2.11578, 0.9372549, 0, 1, 1,
0.9252662, -0.8907927, 1.240785, 0.945098, 0, 1, 1,
0.9273516, -0.7573385, 2.205365, 0.9490196, 0, 1, 1,
0.9285293, -1.451395, 2.814677, 0.9568627, 0, 1, 1,
0.931571, -0.4727972, 0.5662971, 0.9607843, 0, 1, 1,
0.9318572, 0.0161245, 0.9331113, 0.9686275, 0, 1, 1,
0.9320626, -0.5960351, 1.031996, 0.972549, 0, 1, 1,
0.9340975, 0.1649147, 1.451531, 0.9803922, 0, 1, 1,
0.9358599, -1.491205, 0.1994092, 0.9843137, 0, 1, 1,
0.9381033, -0.1869982, 2.152508, 0.9921569, 0, 1, 1,
0.940347, -0.6305973, 1.454084, 0.9960784, 0, 1, 1,
0.9481574, -0.02102754, 1.692083, 1, 0, 0.9960784, 1,
0.9574018, 0.6196193, -0.0828646, 1, 0, 0.9882353, 1,
0.9610057, 0.04994122, 2.284302, 1, 0, 0.9843137, 1,
0.9794595, -1.389197, 1.297897, 1, 0, 0.9764706, 1,
0.9857731, -0.6917291, 3.762572, 1, 0, 0.972549, 1,
0.990375, 0.7566914, 2.195412, 1, 0, 0.9647059, 1,
0.9945598, 0.372192, 2.289589, 1, 0, 0.9607843, 1,
0.9980846, 0.3359838, 0.4099737, 1, 0, 0.9529412, 1,
1.000622, -0.08646924, 1.541191, 1, 0, 0.9490196, 1,
1.002208, -0.2439733, 1.171586, 1, 0, 0.9411765, 1,
1.004277, -0.1688603, 2.042267, 1, 0, 0.9372549, 1,
1.004983, 0.1931806, 2.16034, 1, 0, 0.9294118, 1,
1.005473, -0.4136182, -0.3780504, 1, 0, 0.9254902, 1,
1.005964, 0.3352111, 0.5043004, 1, 0, 0.9176471, 1,
1.011552, 0.323922, 4.698387, 1, 0, 0.9137255, 1,
1.013233, 0.9341607, 1.106876, 1, 0, 0.9058824, 1,
1.013823, -1.033431, 1.673782, 1, 0, 0.9019608, 1,
1.01635, -0.1230001, 2.489469, 1, 0, 0.8941177, 1,
1.017052, 0.7144594, 0.7194518, 1, 0, 0.8862745, 1,
1.017446, -0.362977, 1.091579, 1, 0, 0.8823529, 1,
1.01847, -2.339433, 3.502833, 1, 0, 0.8745098, 1,
1.020037, -2.153879, 1.515857, 1, 0, 0.8705882, 1,
1.020777, -0.4084026, 3.138859, 1, 0, 0.8627451, 1,
1.02623, -1.465688, 2.654006, 1, 0, 0.8588235, 1,
1.03094, -0.6092153, 2.890361, 1, 0, 0.8509804, 1,
1.035059, -2.15914, 2.081203, 1, 0, 0.8470588, 1,
1.039857, 0.7657945, 1.002765, 1, 0, 0.8392157, 1,
1.041511, 1.472082, -0.5460666, 1, 0, 0.8352941, 1,
1.052576, -1.591604, 3.021381, 1, 0, 0.827451, 1,
1.05441, -0.6844828, 0.4757879, 1, 0, 0.8235294, 1,
1.059944, -0.3284701, 1.038311, 1, 0, 0.8156863, 1,
1.066897, -0.6284539, 4.04965, 1, 0, 0.8117647, 1,
1.075524, -0.7925984, 1.531079, 1, 0, 0.8039216, 1,
1.075728, -0.455819, 4.131051, 1, 0, 0.7960784, 1,
1.077716, -0.554467, 3.893512, 1, 0, 0.7921569, 1,
1.088811, 0.06736092, 1.878348, 1, 0, 0.7843137, 1,
1.090701, -0.3421582, 4.140372, 1, 0, 0.7803922, 1,
1.104726, -0.1370988, 0.8554255, 1, 0, 0.772549, 1,
1.106976, 0.6843008, -0.3228604, 1, 0, 0.7686275, 1,
1.11103, 1.433508, 1.358105, 1, 0, 0.7607843, 1,
1.113025, 1.314808, -0.3828087, 1, 0, 0.7568628, 1,
1.116657, -0.2683174, 0.8553173, 1, 0, 0.7490196, 1,
1.11969, 0.7929187, 1.822791, 1, 0, 0.7450981, 1,
1.120955, -0.8618367, 3.156161, 1, 0, 0.7372549, 1,
1.121909, -0.10362, 0.8280377, 1, 0, 0.7333333, 1,
1.126909, 0.7655634, 0.2882904, 1, 0, 0.7254902, 1,
1.148168, -0.006113124, 3.610305, 1, 0, 0.7215686, 1,
1.16587, -0.8178881, 0.7390781, 1, 0, 0.7137255, 1,
1.170622, -1.776344, 3.898582, 1, 0, 0.7098039, 1,
1.17146, -0.1723004, 1.925442, 1, 0, 0.7019608, 1,
1.176608, 1.360879, 1.378653, 1, 0, 0.6941177, 1,
1.180567, 0.6884984, 1.60738, 1, 0, 0.6901961, 1,
1.181622, 0.2510772, 2.588473, 1, 0, 0.682353, 1,
1.183932, 0.5535534, 1.614181, 1, 0, 0.6784314, 1,
1.194265, 1.126882, 0.97352, 1, 0, 0.6705883, 1,
1.197775, -0.4411543, 3.080198, 1, 0, 0.6666667, 1,
1.218109, 0.9062452, 1.247603, 1, 0, 0.6588235, 1,
1.22476, 1.41407, -0.5268118, 1, 0, 0.654902, 1,
1.230846, -0.3004662, -0.0696563, 1, 0, 0.6470588, 1,
1.232324, -0.9704782, 2.907812, 1, 0, 0.6431373, 1,
1.243604, 2.516774, -0.1351157, 1, 0, 0.6352941, 1,
1.254722, -0.6738083, 2.513805, 1, 0, 0.6313726, 1,
1.256913, 1.497976, 3.050529, 1, 0, 0.6235294, 1,
1.263222, 0.9392394, -0.5321449, 1, 0, 0.6196079, 1,
1.274733, 0.7401193, 2.053815, 1, 0, 0.6117647, 1,
1.284737, 0.8038764, 0.587968, 1, 0, 0.6078432, 1,
1.296597, -0.9122458, 3.808438, 1, 0, 0.6, 1,
1.29893, -0.01389884, 1.182319, 1, 0, 0.5921569, 1,
1.305812, 0.8120375, 2.096573, 1, 0, 0.5882353, 1,
1.309533, -1.255264, 2.608523, 1, 0, 0.5803922, 1,
1.310379, 0.6709903, 2.487199, 1, 0, 0.5764706, 1,
1.312243, 0.36391, 1.398008, 1, 0, 0.5686275, 1,
1.321219, -0.1241409, 2.037899, 1, 0, 0.5647059, 1,
1.325117, 1.095728, 1.332275, 1, 0, 0.5568628, 1,
1.329412, -0.1077318, 0.8577686, 1, 0, 0.5529412, 1,
1.339139, 1.29139, 1.363668, 1, 0, 0.5450981, 1,
1.357563, 0.05077979, -0.2127318, 1, 0, 0.5411765, 1,
1.357825, 2.350284, 1.957779, 1, 0, 0.5333334, 1,
1.377779, -0.7609414, 2.694094, 1, 0, 0.5294118, 1,
1.382223, -0.1925589, 2.846072, 1, 0, 0.5215687, 1,
1.383077, 0.3388166, 1.089147, 1, 0, 0.5176471, 1,
1.386672, -0.1945544, 3.095917, 1, 0, 0.509804, 1,
1.390894, 0.4291394, 2.382634, 1, 0, 0.5058824, 1,
1.391093, 1.229653, -1.012841, 1, 0, 0.4980392, 1,
1.395241, -0.03737787, 0.6335486, 1, 0, 0.4901961, 1,
1.397996, 0.4695073, -0.2774398, 1, 0, 0.4862745, 1,
1.403359, -0.4156026, 2.793674, 1, 0, 0.4784314, 1,
1.415478, 0.5146317, 0.5398375, 1, 0, 0.4745098, 1,
1.416331, -0.2439841, 1.366446, 1, 0, 0.4666667, 1,
1.426401, -0.6667142, 2.324247, 1, 0, 0.4627451, 1,
1.431555, -0.1816568, 3.367932, 1, 0, 0.454902, 1,
1.439337, -0.3066873, 2.117882, 1, 0, 0.4509804, 1,
1.462258, 0.4711753, -0.5720042, 1, 0, 0.4431373, 1,
1.467952, -0.4694625, 1.632822, 1, 0, 0.4392157, 1,
1.474825, -0.4528424, 1.803669, 1, 0, 0.4313726, 1,
1.478686, -0.0476873, 2.552767, 1, 0, 0.427451, 1,
1.486377, 0.5618436, 1.769518, 1, 0, 0.4196078, 1,
1.505418, 2.346491, -0.513392, 1, 0, 0.4156863, 1,
1.530963, -0.5123453, 2.022537, 1, 0, 0.4078431, 1,
1.538857, 0.5435675, 1.349951, 1, 0, 0.4039216, 1,
1.538963, 0.5730926, 1.31762, 1, 0, 0.3960784, 1,
1.539713, -0.8660083, 2.773444, 1, 0, 0.3882353, 1,
1.540875, -0.861025, 2.618059, 1, 0, 0.3843137, 1,
1.554305, -0.6664686, 0.1813112, 1, 0, 0.3764706, 1,
1.565397, 0.1896071, 0.3258129, 1, 0, 0.372549, 1,
1.574933, 0.4453011, 0.3525636, 1, 0, 0.3647059, 1,
1.578043, 1.628363, -1.450479, 1, 0, 0.3607843, 1,
1.5822, 1.429636, 0.9849927, 1, 0, 0.3529412, 1,
1.604725, 0.6741797, 1.075027, 1, 0, 0.3490196, 1,
1.613101, 0.6522732, 1.384205, 1, 0, 0.3411765, 1,
1.630409, -0.4884713, 1.518939, 1, 0, 0.3372549, 1,
1.630834, -0.3113556, 2.083546, 1, 0, 0.3294118, 1,
1.640749, -0.08772878, 1.782846, 1, 0, 0.3254902, 1,
1.65566, -0.1289831, 2.379199, 1, 0, 0.3176471, 1,
1.659359, 0.3220723, 0.2442623, 1, 0, 0.3137255, 1,
1.660034, 0.009758676, 1.74205, 1, 0, 0.3058824, 1,
1.670955, 0.4048912, 2.730673, 1, 0, 0.2980392, 1,
1.673215, 1.675412, 1.075206, 1, 0, 0.2941177, 1,
1.685918, -0.9580886, 1.89303, 1, 0, 0.2862745, 1,
1.714692, 0.385462, 2.740874, 1, 0, 0.282353, 1,
1.715753, 0.01536568, 0.6800376, 1, 0, 0.2745098, 1,
1.721512, 1.250359, 1.647452, 1, 0, 0.2705882, 1,
1.731869, 0.251882, 1.147061, 1, 0, 0.2627451, 1,
1.733671, -1.256872, 1.772163, 1, 0, 0.2588235, 1,
1.737396, 1.148915, 1.61028, 1, 0, 0.2509804, 1,
1.746834, -0.2290913, 2.826586, 1, 0, 0.2470588, 1,
1.748131, -1.611924, 0.7807106, 1, 0, 0.2392157, 1,
1.751761, 0.8914834, 0.3817603, 1, 0, 0.2352941, 1,
1.764913, 1.084246, -1.054661, 1, 0, 0.227451, 1,
1.782162, 0.1441959, 0.6103826, 1, 0, 0.2235294, 1,
1.790778, 1.225961, 1.671494, 1, 0, 0.2156863, 1,
1.821454, 1.098511, 1.328397, 1, 0, 0.2117647, 1,
1.830189, -1.733941, 2.657572, 1, 0, 0.2039216, 1,
1.831748, -0.3596769, 0.9562011, 1, 0, 0.1960784, 1,
1.832827, 0.8065292, 1.249735, 1, 0, 0.1921569, 1,
1.840223, 0.6986319, 1.196065, 1, 0, 0.1843137, 1,
1.854329, 0.8058372, 0.8645092, 1, 0, 0.1803922, 1,
1.863474, -1.798181, 2.068341, 1, 0, 0.172549, 1,
1.869888, 1.107405, 0.6413159, 1, 0, 0.1686275, 1,
1.881767, 0.3504423, 3.075037, 1, 0, 0.1607843, 1,
1.938546, 0.2578583, 0.4419771, 1, 0, 0.1568628, 1,
1.940939, -1.013489, 1.453349, 1, 0, 0.1490196, 1,
1.983697, 0.2096068, 1.552912, 1, 0, 0.145098, 1,
2.003429, -0.02199871, 1.599714, 1, 0, 0.1372549, 1,
2.004117, 1.405534, 1.822942, 1, 0, 0.1333333, 1,
2.017167, -1.695398, 2.113806, 1, 0, 0.1254902, 1,
2.03378, 0.1791793, 2.231768, 1, 0, 0.1215686, 1,
2.045816, 0.1842601, 3.57895, 1, 0, 0.1137255, 1,
2.049083, -0.5463182, 1.990194, 1, 0, 0.1098039, 1,
2.099226, 0.5912409, 1.419268, 1, 0, 0.1019608, 1,
2.126484, -0.007001421, 1.227156, 1, 0, 0.09411765, 1,
2.139102, -0.4885948, 0.7666461, 1, 0, 0.09019608, 1,
2.141256, 0.1409184, 1.346059, 1, 0, 0.08235294, 1,
2.147085, -0.7697459, 3.964775, 1, 0, 0.07843138, 1,
2.14983, -0.8052738, 3.394894, 1, 0, 0.07058824, 1,
2.17303, -1.127678, 3.794111, 1, 0, 0.06666667, 1,
2.284798, 0.1793861, -0.03473021, 1, 0, 0.05882353, 1,
2.310096, -0.7086233, 1.162025, 1, 0, 0.05490196, 1,
2.38798, 1.026795, 1.164728, 1, 0, 0.04705882, 1,
2.394906, -0.2977887, 0.870946, 1, 0, 0.04313726, 1,
2.39872, 2.371974, 0.4549307, 1, 0, 0.03529412, 1,
2.518488, -2.599827, 2.269782, 1, 0, 0.03137255, 1,
2.845494, -0.06738546, -0.2541729, 1, 0, 0.02352941, 1,
2.916108, -0.6761506, 1.466283, 1, 0, 0.01960784, 1,
2.963821, 0.5984433, 1.510041, 1, 0, 0.01176471, 1,
3.006741, 0.7322944, 2.333454, 1, 0, 0.007843138, 1
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
-0.06466246, -4.269533, -7.794227, 0, -0.5, 0.5, 0.5,
-0.06466246, -4.269533, -7.794227, 1, -0.5, 0.5, 0.5,
-0.06466246, -4.269533, -7.794227, 1, 1.5, 0.5, 0.5,
-0.06466246, -4.269533, -7.794227, 0, 1.5, 0.5, 0.5
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
-4.177272, -0.01374757, -7.794227, 0, -0.5, 0.5, 0.5,
-4.177272, -0.01374757, -7.794227, 1, -0.5, 0.5, 0.5,
-4.177272, -0.01374757, -7.794227, 1, 1.5, 0.5, 0.5,
-4.177272, -0.01374757, -7.794227, 0, 1.5, 0.5, 0.5
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
-4.177272, -4.269533, -0.5134516, 0, -0.5, 0.5, 0.5,
-4.177272, -4.269533, -0.5134516, 1, -0.5, 0.5, 0.5,
-4.177272, -4.269533, -0.5134516, 1, 1.5, 0.5, 0.5,
-4.177272, -4.269533, -0.5134516, 0, 1.5, 0.5, 0.5
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
-3, -3.287429, -6.114048,
3, -3.287429, -6.114048,
-3, -3.287429, -6.114048,
-3, -3.451113, -6.394078,
-2, -3.287429, -6.114048,
-2, -3.451113, -6.394078,
-1, -3.287429, -6.114048,
-1, -3.451113, -6.394078,
0, -3.287429, -6.114048,
0, -3.451113, -6.394078,
1, -3.287429, -6.114048,
1, -3.451113, -6.394078,
2, -3.287429, -6.114048,
2, -3.451113, -6.394078,
3, -3.287429, -6.114048,
3, -3.451113, -6.394078
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
-3, -3.778481, -6.954138, 0, -0.5, 0.5, 0.5,
-3, -3.778481, -6.954138, 1, -0.5, 0.5, 0.5,
-3, -3.778481, -6.954138, 1, 1.5, 0.5, 0.5,
-3, -3.778481, -6.954138, 0, 1.5, 0.5, 0.5,
-2, -3.778481, -6.954138, 0, -0.5, 0.5, 0.5,
-2, -3.778481, -6.954138, 1, -0.5, 0.5, 0.5,
-2, -3.778481, -6.954138, 1, 1.5, 0.5, 0.5,
-2, -3.778481, -6.954138, 0, 1.5, 0.5, 0.5,
-1, -3.778481, -6.954138, 0, -0.5, 0.5, 0.5,
-1, -3.778481, -6.954138, 1, -0.5, 0.5, 0.5,
-1, -3.778481, -6.954138, 1, 1.5, 0.5, 0.5,
-1, -3.778481, -6.954138, 0, 1.5, 0.5, 0.5,
0, -3.778481, -6.954138, 0, -0.5, 0.5, 0.5,
0, -3.778481, -6.954138, 1, -0.5, 0.5, 0.5,
0, -3.778481, -6.954138, 1, 1.5, 0.5, 0.5,
0, -3.778481, -6.954138, 0, 1.5, 0.5, 0.5,
1, -3.778481, -6.954138, 0, -0.5, 0.5, 0.5,
1, -3.778481, -6.954138, 1, -0.5, 0.5, 0.5,
1, -3.778481, -6.954138, 1, 1.5, 0.5, 0.5,
1, -3.778481, -6.954138, 0, 1.5, 0.5, 0.5,
2, -3.778481, -6.954138, 0, -0.5, 0.5, 0.5,
2, -3.778481, -6.954138, 1, -0.5, 0.5, 0.5,
2, -3.778481, -6.954138, 1, 1.5, 0.5, 0.5,
2, -3.778481, -6.954138, 0, 1.5, 0.5, 0.5,
3, -3.778481, -6.954138, 0, -0.5, 0.5, 0.5,
3, -3.778481, -6.954138, 1, -0.5, 0.5, 0.5,
3, -3.778481, -6.954138, 1, 1.5, 0.5, 0.5,
3, -3.778481, -6.954138, 0, 1.5, 0.5, 0.5
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
-3.228208, -3, -6.114048,
-3.228208, 3, -6.114048,
-3.228208, -3, -6.114048,
-3.386385, -3, -6.394078,
-3.228208, -2, -6.114048,
-3.386385, -2, -6.394078,
-3.228208, -1, -6.114048,
-3.386385, -1, -6.394078,
-3.228208, 0, -6.114048,
-3.386385, 0, -6.394078,
-3.228208, 1, -6.114048,
-3.386385, 1, -6.394078,
-3.228208, 2, -6.114048,
-3.386385, 2, -6.394078,
-3.228208, 3, -6.114048,
-3.386385, 3, -6.394078
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
-3.70274, -3, -6.954138, 0, -0.5, 0.5, 0.5,
-3.70274, -3, -6.954138, 1, -0.5, 0.5, 0.5,
-3.70274, -3, -6.954138, 1, 1.5, 0.5, 0.5,
-3.70274, -3, -6.954138, 0, 1.5, 0.5, 0.5,
-3.70274, -2, -6.954138, 0, -0.5, 0.5, 0.5,
-3.70274, -2, -6.954138, 1, -0.5, 0.5, 0.5,
-3.70274, -2, -6.954138, 1, 1.5, 0.5, 0.5,
-3.70274, -2, -6.954138, 0, 1.5, 0.5, 0.5,
-3.70274, -1, -6.954138, 0, -0.5, 0.5, 0.5,
-3.70274, -1, -6.954138, 1, -0.5, 0.5, 0.5,
-3.70274, -1, -6.954138, 1, 1.5, 0.5, 0.5,
-3.70274, -1, -6.954138, 0, 1.5, 0.5, 0.5,
-3.70274, 0, -6.954138, 0, -0.5, 0.5, 0.5,
-3.70274, 0, -6.954138, 1, -0.5, 0.5, 0.5,
-3.70274, 0, -6.954138, 1, 1.5, 0.5, 0.5,
-3.70274, 0, -6.954138, 0, 1.5, 0.5, 0.5,
-3.70274, 1, -6.954138, 0, -0.5, 0.5, 0.5,
-3.70274, 1, -6.954138, 1, -0.5, 0.5, 0.5,
-3.70274, 1, -6.954138, 1, 1.5, 0.5, 0.5,
-3.70274, 1, -6.954138, 0, 1.5, 0.5, 0.5,
-3.70274, 2, -6.954138, 0, -0.5, 0.5, 0.5,
-3.70274, 2, -6.954138, 1, -0.5, 0.5, 0.5,
-3.70274, 2, -6.954138, 1, 1.5, 0.5, 0.5,
-3.70274, 2, -6.954138, 0, 1.5, 0.5, 0.5,
-3.70274, 3, -6.954138, 0, -0.5, 0.5, 0.5,
-3.70274, 3, -6.954138, 1, -0.5, 0.5, 0.5,
-3.70274, 3, -6.954138, 1, 1.5, 0.5, 0.5,
-3.70274, 3, -6.954138, 0, 1.5, 0.5, 0.5
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
-3.228208, -3.287429, -4,
-3.228208, -3.287429, 4,
-3.228208, -3.287429, -4,
-3.386385, -3.451113, -4,
-3.228208, -3.287429, -2,
-3.386385, -3.451113, -2,
-3.228208, -3.287429, 0,
-3.386385, -3.451113, 0,
-3.228208, -3.287429, 2,
-3.386385, -3.451113, 2,
-3.228208, -3.287429, 4,
-3.386385, -3.451113, 4
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
-3.70274, -3.778481, -4, 0, -0.5, 0.5, 0.5,
-3.70274, -3.778481, -4, 1, -0.5, 0.5, 0.5,
-3.70274, -3.778481, -4, 1, 1.5, 0.5, 0.5,
-3.70274, -3.778481, -4, 0, 1.5, 0.5, 0.5,
-3.70274, -3.778481, -2, 0, -0.5, 0.5, 0.5,
-3.70274, -3.778481, -2, 1, -0.5, 0.5, 0.5,
-3.70274, -3.778481, -2, 1, 1.5, 0.5, 0.5,
-3.70274, -3.778481, -2, 0, 1.5, 0.5, 0.5,
-3.70274, -3.778481, 0, 0, -0.5, 0.5, 0.5,
-3.70274, -3.778481, 0, 1, -0.5, 0.5, 0.5,
-3.70274, -3.778481, 0, 1, 1.5, 0.5, 0.5,
-3.70274, -3.778481, 0, 0, 1.5, 0.5, 0.5,
-3.70274, -3.778481, 2, 0, -0.5, 0.5, 0.5,
-3.70274, -3.778481, 2, 1, -0.5, 0.5, 0.5,
-3.70274, -3.778481, 2, 1, 1.5, 0.5, 0.5,
-3.70274, -3.778481, 2, 0, 1.5, 0.5, 0.5,
-3.70274, -3.778481, 4, 0, -0.5, 0.5, 0.5,
-3.70274, -3.778481, 4, 1, -0.5, 0.5, 0.5,
-3.70274, -3.778481, 4, 1, 1.5, 0.5, 0.5,
-3.70274, -3.778481, 4, 0, 1.5, 0.5, 0.5
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
-3.228208, -3.287429, -6.114048,
-3.228208, 3.259934, -6.114048,
-3.228208, -3.287429, 5.087145,
-3.228208, 3.259934, 5.087145,
-3.228208, -3.287429, -6.114048,
-3.228208, -3.287429, 5.087145,
-3.228208, 3.259934, -6.114048,
-3.228208, 3.259934, 5.087145,
-3.228208, -3.287429, -6.114048,
3.098883, -3.287429, -6.114048,
-3.228208, -3.287429, 5.087145,
3.098883, -3.287429, 5.087145,
-3.228208, 3.259934, -6.114048,
3.098883, 3.259934, -6.114048,
-3.228208, 3.259934, 5.087145,
3.098883, 3.259934, 5.087145,
3.098883, -3.287429, -6.114048,
3.098883, 3.259934, -6.114048,
3.098883, -3.287429, 5.087145,
3.098883, 3.259934, 5.087145,
3.098883, -3.287429, -6.114048,
3.098883, -3.287429, 5.087145,
3.098883, 3.259934, -6.114048,
3.098883, 3.259934, 5.087145
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
var radius = 7.707964;
var distance = 34.2936;
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
mvMatrix.translate( 0.06466246, 0.01374757, 0.5134516 );
mvMatrix.scale( 1.317193, 1.272879, 0.744028 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.2936);
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
Hox<-read.table("Hox.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Hox$V2
```

```
## Error in eval(expr, envir, enclos): object 'Hox' not found
```

```r
y<-Hox$V3
```

```
## Error in eval(expr, envir, enclos): object 'Hox' not found
```

```r
z<-Hox$V4
```

```
## Error in eval(expr, envir, enclos): object 'Hox' not found
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
-3.136066, -0.7899083, -2.58081, 0, 0, 1, 1, 1,
-3.12028, -0.6603823, -3.766423, 1, 0, 0, 1, 1,
-2.77969, 0.2480864, -2.370998, 1, 0, 0, 1, 1,
-2.690254, 1.24209, -2.883526, 1, 0, 0, 1, 1,
-2.621313, -1.488875, -0.7082158, 1, 0, 0, 1, 1,
-2.532869, -0.05451149, 0.5967097, 1, 0, 0, 1, 1,
-2.476425, -0.3021382, -0.8052146, 0, 0, 0, 1, 1,
-2.407326, -0.1647353, -2.183744, 0, 0, 0, 1, 1,
-2.398441, 1.523279, -1.299388, 0, 0, 0, 1, 1,
-2.254481, 0.0349355, -3.055762, 0, 0, 0, 1, 1,
-2.242193, -0.7547109, -0.8882838, 0, 0, 0, 1, 1,
-2.222448, -1.733834, -1.694767, 0, 0, 0, 1, 1,
-2.164529, -0.2462618, -2.547722, 0, 0, 0, 1, 1,
-2.107846, 0.4514532, -1.964287, 1, 1, 1, 1, 1,
-2.090537, 1.238386, -1.152249, 1, 1, 1, 1, 1,
-2.061984, 0.7728108, -1.068304, 1, 1, 1, 1, 1,
-2.042227, -0.3494698, -3.670157, 1, 1, 1, 1, 1,
-2.034371, -0.009938444, -2.217856, 1, 1, 1, 1, 1,
-2.013661, 3.09224, -1.997911, 1, 1, 1, 1, 1,
-2.006539, -0.2560745, -1.433442, 1, 1, 1, 1, 1,
-1.963463, -0.8106688, -1.958581, 1, 1, 1, 1, 1,
-1.953994, 0.1268717, -1.096563, 1, 1, 1, 1, 1,
-1.952035, -0.6827747, -1.568113, 1, 1, 1, 1, 1,
-1.951056, 1.116839, -1.594901, 1, 1, 1, 1, 1,
-1.938479, -0.7358037, -1.659256, 1, 1, 1, 1, 1,
-1.925836, 0.9343136, -0.4562966, 1, 1, 1, 1, 1,
-1.910057, -0.6776302, -2.075019, 1, 1, 1, 1, 1,
-1.906209, 0.8562414, -2.432964, 1, 1, 1, 1, 1,
-1.879557, 0.3836308, 0.5501229, 0, 0, 1, 1, 1,
-1.871076, 0.01150069, -1.954973, 1, 0, 0, 1, 1,
-1.867731, 2.658688, -0.0931412, 1, 0, 0, 1, 1,
-1.866771, 1.492639, 0.7744952, 1, 0, 0, 1, 1,
-1.861853, 0.2660654, -2.856377, 1, 0, 0, 1, 1,
-1.860854, -1.983031, -1.721393, 1, 0, 0, 1, 1,
-1.860738, -0.8188481, -4.411311, 0, 0, 0, 1, 1,
-1.854103, -0.8493939, -2.860421, 0, 0, 0, 1, 1,
-1.839128, -0.06201142, 0.09968031, 0, 0, 0, 1, 1,
-1.834306, 0.02371516, -0.2086785, 0, 0, 0, 1, 1,
-1.805974, 1.474796, 0.02702402, 0, 0, 0, 1, 1,
-1.749999, 0.7036957, -2.543177, 0, 0, 0, 1, 1,
-1.743832, -0.6080146, -1.771972, 0, 0, 0, 1, 1,
-1.73005, 1.270503, -0.9023229, 1, 1, 1, 1, 1,
-1.729507, 0.4067402, -1.490707, 1, 1, 1, 1, 1,
-1.722066, -1.239558, -2.988603, 1, 1, 1, 1, 1,
-1.700453, 0.8969068, -1.070227, 1, 1, 1, 1, 1,
-1.686717, -1.356019, -2.289313, 1, 1, 1, 1, 1,
-1.682391, -1.237301, -2.968454, 1, 1, 1, 1, 1,
-1.680978, -0.1195448, -1.914253, 1, 1, 1, 1, 1,
-1.673527, 2.179619, -1.833209, 1, 1, 1, 1, 1,
-1.643716, -0.7092173, -0.806244, 1, 1, 1, 1, 1,
-1.628543, -0.9187216, -0.9743165, 1, 1, 1, 1, 1,
-1.623451, 2.391165, -1.910318, 1, 1, 1, 1, 1,
-1.61124, -1.052003, -1.901825, 1, 1, 1, 1, 1,
-1.593209, 0.1249728, -3.369729, 1, 1, 1, 1, 1,
-1.591362, -0.5808365, 0.8904779, 1, 1, 1, 1, 1,
-1.576692, 0.1047091, -2.604533, 1, 1, 1, 1, 1,
-1.574272, 0.4541272, -3.267355, 0, 0, 1, 1, 1,
-1.573909, 1.426685, 0.1861985, 1, 0, 0, 1, 1,
-1.571909, 3.164584, 0.5930959, 1, 0, 0, 1, 1,
-1.568617, 0.08932957, -0.2455897, 1, 0, 0, 1, 1,
-1.52848, -0.5470622, -1.322182, 1, 0, 0, 1, 1,
-1.523155, -1.094893, -2.370821, 1, 0, 0, 1, 1,
-1.519878, -0.2841977, 0.1760843, 0, 0, 0, 1, 1,
-1.518128, 1.314303, 0.3272951, 0, 0, 0, 1, 1,
-1.499423, -0.7761297, -3.23046, 0, 0, 0, 1, 1,
-1.478387, 0.6979346, -3.036957, 0, 0, 0, 1, 1,
-1.45922, -0.6380793, -1.487563, 0, 0, 0, 1, 1,
-1.455492, 0.5463121, -0.4562429, 0, 0, 0, 1, 1,
-1.454352, -0.9621723, -3.029939, 0, 0, 0, 1, 1,
-1.445976, -0.197078, -1.580916, 1, 1, 1, 1, 1,
-1.435065, 1.019502, -1.464416, 1, 1, 1, 1, 1,
-1.420305, 0.81565, -2.657119, 1, 1, 1, 1, 1,
-1.41508, -0.4792313, -0.6473346, 1, 1, 1, 1, 1,
-1.413909, 0.6111942, -2.039178, 1, 1, 1, 1, 1,
-1.410478, 0.6975583, -2.805728, 1, 1, 1, 1, 1,
-1.410146, 2.59048, -0.8723214, 1, 1, 1, 1, 1,
-1.404238, -1.322419, -1.02833, 1, 1, 1, 1, 1,
-1.399072, -1.445328, -0.9468966, 1, 1, 1, 1, 1,
-1.398648, -0.5947394, -1.398701, 1, 1, 1, 1, 1,
-1.375664, 1.49139, -1.484597, 1, 1, 1, 1, 1,
-1.369911, -0.417493, -0.9339204, 1, 1, 1, 1, 1,
-1.361849, 0.2670314, -3.045866, 1, 1, 1, 1, 1,
-1.359622, 1.177156, -0.5264469, 1, 1, 1, 1, 1,
-1.349169, 0.4024839, -1.340424, 1, 1, 1, 1, 1,
-1.348206, 0.1420875, -0.7708437, 0, 0, 1, 1, 1,
-1.343083, 2.26468, -1.199345, 1, 0, 0, 1, 1,
-1.329561, -0.2090768, 0.1966536, 1, 0, 0, 1, 1,
-1.320648, -0.4213627, -2.459554, 1, 0, 0, 1, 1,
-1.318172, 0.7309884, -1.028008, 1, 0, 0, 1, 1,
-1.305841, -0.7234665, -1.43111, 1, 0, 0, 1, 1,
-1.302637, 1.611307, 0.02975512, 0, 0, 0, 1, 1,
-1.295153, -0.7104084, -3.464636, 0, 0, 0, 1, 1,
-1.289111, 1.130988, 0.4287348, 0, 0, 0, 1, 1,
-1.284018, -2.78793, -2.555373, 0, 0, 0, 1, 1,
-1.277359, -0.8863322, -2.001372, 0, 0, 0, 1, 1,
-1.276251, 0.1217121, -1.74225, 0, 0, 0, 1, 1,
-1.272493, -0.6097263, -2.455866, 0, 0, 0, 1, 1,
-1.269283, 1.133777, -1.836168, 1, 1, 1, 1, 1,
-1.266512, -0.2515988, -3.430527, 1, 1, 1, 1, 1,
-1.26622, -2.047184, -3.823215, 1, 1, 1, 1, 1,
-1.255639, -1.629332, -2.781401, 1, 1, 1, 1, 1,
-1.237532, -1.732512, -2.357846, 1, 1, 1, 1, 1,
-1.232878, -0.4390045, -0.04644751, 1, 1, 1, 1, 1,
-1.222993, -0.6616558, -1.304931, 1, 1, 1, 1, 1,
-1.219692, -0.7720397, -1.024949, 1, 1, 1, 1, 1,
-1.217802, -1.642251, -1.266432, 1, 1, 1, 1, 1,
-1.217137, 0.4155643, -1.500337, 1, 1, 1, 1, 1,
-1.214087, 1.187233, 0.585734, 1, 1, 1, 1, 1,
-1.212242, 1.150372, 0.2671577, 1, 1, 1, 1, 1,
-1.211779, -0.4331674, -2.604165, 1, 1, 1, 1, 1,
-1.211156, 0.3986346, -0.5978476, 1, 1, 1, 1, 1,
-1.205208, 1.461116, 1.080887, 1, 1, 1, 1, 1,
-1.19393, 1.17474, -1.207996, 0, 0, 1, 1, 1,
-1.188416, -0.01250011, 0.8546137, 1, 0, 0, 1, 1,
-1.186444, -1.784823, -1.733256, 1, 0, 0, 1, 1,
-1.185882, 0.5232792, -1.910235, 1, 0, 0, 1, 1,
-1.18079, -1.9781, -3.064343, 1, 0, 0, 1, 1,
-1.176676, -0.5583994, -1.125216, 1, 0, 0, 1, 1,
-1.176352, -0.8119749, -3.953755, 0, 0, 0, 1, 1,
-1.16276, 0.2864882, -0.2857354, 0, 0, 0, 1, 1,
-1.149646, 1.493592, -0.4282593, 0, 0, 0, 1, 1,
-1.149376, -1.646101, -2.67893, 0, 0, 0, 1, 1,
-1.143451, 0.4625496, -2.567556, 0, 0, 0, 1, 1,
-1.14105, 2.018875, -2.644574, 0, 0, 0, 1, 1,
-1.138386, -0.2298458, -0.1181192, 0, 0, 0, 1, 1,
-1.136109, -1.486385, -1.549702, 1, 1, 1, 1, 1,
-1.135367, 1.022672, -1.343365, 1, 1, 1, 1, 1,
-1.133885, -0.3706864, -1.27994, 1, 1, 1, 1, 1,
-1.126681, -0.1167955, -1.12086, 1, 1, 1, 1, 1,
-1.121307, -0.5152355, -3.217536, 1, 1, 1, 1, 1,
-1.105363, 1.49606, -0.8452929, 1, 1, 1, 1, 1,
-1.10313, 0.5192658, -3.038956, 1, 1, 1, 1, 1,
-1.102265, -0.5512483, -1.631115, 1, 1, 1, 1, 1,
-1.09453, 0.1405469, -0.6105839, 1, 1, 1, 1, 1,
-1.089718, -1.058915, -0.06533293, 1, 1, 1, 1, 1,
-1.082675, 0.5230848, -0.08399889, 1, 1, 1, 1, 1,
-1.081815, -2.358431, -2.618428, 1, 1, 1, 1, 1,
-1.081015, 0.537403, -0.3439127, 1, 1, 1, 1, 1,
-1.080839, 1.067624, -0.09794189, 1, 1, 1, 1, 1,
-1.080191, -0.6414186, -2.208253, 1, 1, 1, 1, 1,
-1.077784, -1.550859, -1.862497, 0, 0, 1, 1, 1,
-1.074802, 1.949806, 0.6845262, 1, 0, 0, 1, 1,
-1.068444, 1.320759, -0.3415628, 1, 0, 0, 1, 1,
-1.054448, 0.6139621, -1.34208, 1, 0, 0, 1, 1,
-1.05033, 1.117278, -0.3061788, 1, 0, 0, 1, 1,
-1.05029, 1.422144, -1.476475, 1, 0, 0, 1, 1,
-1.043851, -0.2322782, -1.79491, 0, 0, 0, 1, 1,
-1.040277, 1.29438, -0.1675154, 0, 0, 0, 1, 1,
-1.037199, 0.1875906, -1.587455, 0, 0, 0, 1, 1,
-1.032381, -0.7825115, -1.439365, 0, 0, 0, 1, 1,
-1.0215, -0.9162308, -2.540878, 0, 0, 0, 1, 1,
-1.021368, 1.074139, -0.0429753, 0, 0, 0, 1, 1,
-1.01911, 0.3207042, -0.123728, 0, 0, 0, 1, 1,
-1.006854, 0.4425934, -1.709921, 1, 1, 1, 1, 1,
-1.004638, -0.215964, -1.695661, 1, 1, 1, 1, 1,
-0.9992982, -1.239043, -3.570007, 1, 1, 1, 1, 1,
-0.997559, -0.2258832, -2.759868, 1, 1, 1, 1, 1,
-0.9930095, -0.1551579, -2.747441, 1, 1, 1, 1, 1,
-0.9902719, -0.05760276, -1.886766, 1, 1, 1, 1, 1,
-0.9887289, -0.1018919, -1.190306, 1, 1, 1, 1, 1,
-0.9853727, -0.9107844, -2.838856, 1, 1, 1, 1, 1,
-0.980419, 0.06545427, -0.8010327, 1, 1, 1, 1, 1,
-0.974543, -0.8471282, -1.950855, 1, 1, 1, 1, 1,
-0.9638689, 1.622774, -0.0466393, 1, 1, 1, 1, 1,
-0.9625393, 0.7688385, -2.267102, 1, 1, 1, 1, 1,
-0.9489253, -0.3942029, -1.027908, 1, 1, 1, 1, 1,
-0.9415821, -0.5330325, -1.703167, 1, 1, 1, 1, 1,
-0.9410223, -0.5115821, -2.268048, 1, 1, 1, 1, 1,
-0.9390479, -0.3046463, -2.977957, 0, 0, 1, 1, 1,
-0.9365352, 0.3502411, 0.009029679, 1, 0, 0, 1, 1,
-0.9361671, 0.2801497, -1.666006, 1, 0, 0, 1, 1,
-0.9346971, -0.579541, -1.548876, 1, 0, 0, 1, 1,
-0.9228802, -0.1374831, -2.281214, 1, 0, 0, 1, 1,
-0.9203299, -1.042539, -2.604254, 1, 0, 0, 1, 1,
-0.9171598, -1.781721, -1.471065, 0, 0, 0, 1, 1,
-0.9156551, 0.4900126, -1.535676, 0, 0, 0, 1, 1,
-0.9019894, -1.175295, -3.806682, 0, 0, 0, 1, 1,
-0.9017521, 0.8710696, -1.549529, 0, 0, 0, 1, 1,
-0.9014928, -0.4586105, -2.5994, 0, 0, 0, 1, 1,
-0.8981023, -0.6627424, -1.803614, 0, 0, 0, 1, 1,
-0.8859795, -1.972497, -2.089618, 0, 0, 0, 1, 1,
-0.8857501, 0.6135741, -2.042812, 1, 1, 1, 1, 1,
-0.880309, 0.1339225, -1.475006, 1, 1, 1, 1, 1,
-0.8792475, 1.618103, 0.6817834, 1, 1, 1, 1, 1,
-0.8734093, 0.1243388, -2.816938, 1, 1, 1, 1, 1,
-0.8706468, -1.44113, -3.750864, 1, 1, 1, 1, 1,
-0.8665021, -0.2358667, -2.523382, 1, 1, 1, 1, 1,
-0.8660198, -0.5192024, -3.100244, 1, 1, 1, 1, 1,
-0.863871, -0.5680057, -1.95329, 1, 1, 1, 1, 1,
-0.8610601, 0.291571, -1.211676, 1, 1, 1, 1, 1,
-0.8594533, -0.7240511, -2.548977, 1, 1, 1, 1, 1,
-0.8589927, -1.848717, -2.229571, 1, 1, 1, 1, 1,
-0.8585135, -0.9070398, -2.558941, 1, 1, 1, 1, 1,
-0.8536415, -0.9932541, -3.239197, 1, 1, 1, 1, 1,
-0.842972, 0.9403822, -0.7821627, 1, 1, 1, 1, 1,
-0.8427279, 1.179488, -1.240002, 1, 1, 1, 1, 1,
-0.8418945, 0.5105755, -1.730453, 0, 0, 1, 1, 1,
-0.8391719, -0.2410093, -1.792179, 1, 0, 0, 1, 1,
-0.8143472, 0.3589034, -3.642432, 1, 0, 0, 1, 1,
-0.8063892, -0.5404766, -4.62876, 1, 0, 0, 1, 1,
-0.8035126, -0.1036396, -1.494477, 1, 0, 0, 1, 1,
-0.8007262, -0.6273953, -2.012067, 1, 0, 0, 1, 1,
-0.798853, -1.066971, -1.595578, 0, 0, 0, 1, 1,
-0.7958867, -0.4268601, -2.088019, 0, 0, 0, 1, 1,
-0.7949359, -0.4745145, -2.532151, 0, 0, 0, 1, 1,
-0.7944728, -2.134866, -3.238226, 0, 0, 0, 1, 1,
-0.7919728, -0.4430336, -1.727698, 0, 0, 0, 1, 1,
-0.7893866, -0.7224013, -1.427942, 0, 0, 0, 1, 1,
-0.7863151, -0.1516634, -3.341667, 0, 0, 0, 1, 1,
-0.7834285, -1.574226, -2.944868, 1, 1, 1, 1, 1,
-0.7787018, 0.7089018, -1.15074, 1, 1, 1, 1, 1,
-0.7752646, -0.7160165, -2.629197, 1, 1, 1, 1, 1,
-0.772408, 0.6732644, -1.606687, 1, 1, 1, 1, 1,
-0.7723125, -0.4344694, -1.689238, 1, 1, 1, 1, 1,
-0.7710001, -1.880289, -1.376475, 1, 1, 1, 1, 1,
-0.7672735, 0.8737434, 0.3984271, 1, 1, 1, 1, 1,
-0.7638476, -1.248982, -3.752721, 1, 1, 1, 1, 1,
-0.756948, 1.1158, 0.4683097, 1, 1, 1, 1, 1,
-0.7523872, -0.4994893, -1.107981, 1, 1, 1, 1, 1,
-0.7516056, -0.0927014, 0.01870395, 1, 1, 1, 1, 1,
-0.7463295, -0.178554, -1.708745, 1, 1, 1, 1, 1,
-0.7443544, 2.180062, 1.567165, 1, 1, 1, 1, 1,
-0.7377247, -0.7726717, -1.742303, 1, 1, 1, 1, 1,
-0.7347998, -0.2123025, -2.511845, 1, 1, 1, 1, 1,
-0.7321766, -0.7173775, -3.011727, 0, 0, 1, 1, 1,
-0.7318828, 0.4213465, 0.3333798, 1, 0, 0, 1, 1,
-0.7279392, -0.8412816, -2.716037, 1, 0, 0, 1, 1,
-0.7265084, 0.01017022, -1.777279, 1, 0, 0, 1, 1,
-0.7238507, 0.4238516, -0.3221933, 1, 0, 0, 1, 1,
-0.72066, -0.2948337, -1.220374, 1, 0, 0, 1, 1,
-0.7150682, -1.06941, -3.553921, 0, 0, 0, 1, 1,
-0.7140561, 1.65654, -1.08396, 0, 0, 0, 1, 1,
-0.7139086, -1.379501, -3.633351, 0, 0, 0, 1, 1,
-0.7064337, -0.617943, -0.2919518, 0, 0, 0, 1, 1,
-0.7026402, -0.2877437, -1.972294, 0, 0, 0, 1, 1,
-0.6991191, -0.08752725, -2.178622, 0, 0, 0, 1, 1,
-0.6983277, 1.227084, -0.9664723, 0, 0, 0, 1, 1,
-0.6979119, 1.181351, -0.638572, 1, 1, 1, 1, 1,
-0.6908879, 0.270466, -2.950232, 1, 1, 1, 1, 1,
-0.6903898, -0.9827542, -3.42427, 1, 1, 1, 1, 1,
-0.6852195, -0.7687222, -1.866567, 1, 1, 1, 1, 1,
-0.684621, -0.7240682, -2.642072, 1, 1, 1, 1, 1,
-0.6791999, -0.678628, -2.623938, 1, 1, 1, 1, 1,
-0.6767083, -0.9093468, -1.768418, 1, 1, 1, 1, 1,
-0.6695739, 0.7094069, 0.7995077, 1, 1, 1, 1, 1,
-0.6679725, 0.7063007, -0.2213742, 1, 1, 1, 1, 1,
-0.6620625, 0.1233053, -1.569194, 1, 1, 1, 1, 1,
-0.6572127, 0.9777014, 0.4546563, 1, 1, 1, 1, 1,
-0.6520691, 1.402135, 0.4674052, 1, 1, 1, 1, 1,
-0.6517672, -0.05294012, -1.984457, 1, 1, 1, 1, 1,
-0.649459, -1.181097, -5.950924, 1, 1, 1, 1, 1,
-0.6454391, 0.2941401, 0.6723582, 1, 1, 1, 1, 1,
-0.6444221, -0.8859763, -1.972652, 0, 0, 1, 1, 1,
-0.6410891, 0.5990241, -0.6502672, 1, 0, 0, 1, 1,
-0.6386049, 0.3328778, -0.9169884, 1, 0, 0, 1, 1,
-0.6376723, -1.657908, -3.945882, 1, 0, 0, 1, 1,
-0.6372091, -0.9129655, -1.975986, 1, 0, 0, 1, 1,
-0.6363431, 0.2164002, 0.1366314, 1, 0, 0, 1, 1,
-0.6344734, -0.1973462, -1.118642, 0, 0, 0, 1, 1,
-0.6329327, 0.5884424, -2.098043, 0, 0, 0, 1, 1,
-0.6283802, 0.08381107, -1.331653, 0, 0, 0, 1, 1,
-0.6266396, 0.007532048, -2.393076, 0, 0, 0, 1, 1,
-0.6261587, 0.8102475, -2.033242, 0, 0, 0, 1, 1,
-0.6237736, 1.895344, 0.8188241, 0, 0, 0, 1, 1,
-0.6227955, 0.4020572, -1.552764, 0, 0, 0, 1, 1,
-0.6082833, 0.6703501, -1.379575, 1, 1, 1, 1, 1,
-0.6007786, -0.3127488, -0.7893499, 1, 1, 1, 1, 1,
-0.5998977, -0.5823252, -2.740793, 1, 1, 1, 1, 1,
-0.5986267, -1.375466, -5.633367, 1, 1, 1, 1, 1,
-0.5910492, 1.243042, -0.2100827, 1, 1, 1, 1, 1,
-0.5855708, -2.1799, -3.025075, 1, 1, 1, 1, 1,
-0.5832672, -2.605185, -1.805433, 1, 1, 1, 1, 1,
-0.5830269, 1.184189, -0.3523896, 1, 1, 1, 1, 1,
-0.5816321, 0.7136402, 0.7595158, 1, 1, 1, 1, 1,
-0.581036, 1.783816, -0.2202045, 1, 1, 1, 1, 1,
-0.5797721, 0.06276336, -1.418638, 1, 1, 1, 1, 1,
-0.5781261, 0.7374057, 0.3634574, 1, 1, 1, 1, 1,
-0.5722747, -1.377154, -3.104958, 1, 1, 1, 1, 1,
-0.5712143, 1.628523, -0.4040386, 1, 1, 1, 1, 1,
-0.568549, 1.372545, 0.4214374, 1, 1, 1, 1, 1,
-0.5676466, 0.293552, 0.209747, 0, 0, 1, 1, 1,
-0.5656086, -1.3625, -1.310057, 1, 0, 0, 1, 1,
-0.5646228, 0.4422439, -1.292722, 1, 0, 0, 1, 1,
-0.5619995, -0.4485387, -2.589672, 1, 0, 0, 1, 1,
-0.5526462, 0.1352525, 0.2431681, 1, 0, 0, 1, 1,
-0.5502228, 0.5047966, -0.6098579, 1, 0, 0, 1, 1,
-0.5484548, 0.2019662, -0.6479016, 0, 0, 0, 1, 1,
-0.5440214, 1.076457, -0.2670442, 0, 0, 0, 1, 1,
-0.5434651, 1.431293, 0.05216213, 0, 0, 0, 1, 1,
-0.5374601, 0.2718869, -1.508218, 0, 0, 0, 1, 1,
-0.5309183, -0.6920166, -0.5065281, 0, 0, 0, 1, 1,
-0.5262387, 0.9261823, 0.5034235, 0, 0, 0, 1, 1,
-0.5208701, -1.144843, -1.994328, 0, 0, 0, 1, 1,
-0.5199114, -0.02634556, -2.714436, 1, 1, 1, 1, 1,
-0.5197607, 2.12655, -0.2262706, 1, 1, 1, 1, 1,
-0.5184686, -1.057277, -2.839958, 1, 1, 1, 1, 1,
-0.5136728, -0.6050408, -2.895316, 1, 1, 1, 1, 1,
-0.5125467, 1.033452, -2.442885, 1, 1, 1, 1, 1,
-0.5115005, -0.4585216, -2.222523, 1, 1, 1, 1, 1,
-0.5092521, -1.927612, -3.276913, 1, 1, 1, 1, 1,
-0.5042719, -0.915149, -2.440642, 1, 1, 1, 1, 1,
-0.5015515, 0.7423623, 0.9349319, 1, 1, 1, 1, 1,
-0.5010872, 1.578493, 0.1094094, 1, 1, 1, 1, 1,
-0.500002, 0.2689271, -2.616335, 1, 1, 1, 1, 1,
-0.4988211, -1.683193, -1.02375, 1, 1, 1, 1, 1,
-0.4954614, -1.057573, -1.940881, 1, 1, 1, 1, 1,
-0.491611, 0.2714138, -1.149303, 1, 1, 1, 1, 1,
-0.4897086, 0.8208402, -1.098423, 1, 1, 1, 1, 1,
-0.4857767, 0.1684239, -0.8064094, 0, 0, 1, 1, 1,
-0.4823801, 0.413993, -0.1494316, 1, 0, 0, 1, 1,
-0.4818949, -1.117809, -1.752773, 1, 0, 0, 1, 1,
-0.4743519, 0.4648315, 0.7577693, 1, 0, 0, 1, 1,
-0.4711222, -1.594936, -2.386122, 1, 0, 0, 1, 1,
-0.4556062, 0.3448946, -0.8926532, 1, 0, 0, 1, 1,
-0.452445, -0.5634005, -3.182051, 0, 0, 0, 1, 1,
-0.4458157, 1.283535, 0.3942897, 0, 0, 0, 1, 1,
-0.4443326, 0.9528856, -1.654322, 0, 0, 0, 1, 1,
-0.4398683, 0.06964121, -2.105278, 0, 0, 0, 1, 1,
-0.4220654, 0.0259888, -2.374399, 0, 0, 0, 1, 1,
-0.4211583, 0.1181203, -3.702914, 0, 0, 0, 1, 1,
-0.4181923, -0.0371194, -1.1865, 0, 0, 0, 1, 1,
-0.4099865, -0.05577808, -1.489302, 1, 1, 1, 1, 1,
-0.4059635, 1.313136, -0.3613052, 1, 1, 1, 1, 1,
-0.4029323, 0.04989177, -2.208748, 1, 1, 1, 1, 1,
-0.3977607, -0.1282614, -1.958973, 1, 1, 1, 1, 1,
-0.3961962, 1.291827, -0.4824414, 1, 1, 1, 1, 1,
-0.3942442, 0.484967, -2.89804, 1, 1, 1, 1, 1,
-0.3899531, 1.821651, -0.6622656, 1, 1, 1, 1, 1,
-0.3883242, 1.022081, 0.4033156, 1, 1, 1, 1, 1,
-0.3880984, -1.364641, -2.681717, 1, 1, 1, 1, 1,
-0.3876771, 0.2056812, -0.7646399, 1, 1, 1, 1, 1,
-0.3870192, 0.02959586, -1.452794, 1, 1, 1, 1, 1,
-0.3868815, -0.3818959, -1.522798, 1, 1, 1, 1, 1,
-0.3818768, -1.003517, -1.786051, 1, 1, 1, 1, 1,
-0.3818156, -1.205683, -3.346867, 1, 1, 1, 1, 1,
-0.3806882, -0.3751812, -3.344101, 1, 1, 1, 1, 1,
-0.3799941, -1.266255, -2.58937, 0, 0, 1, 1, 1,
-0.3776002, 0.6183939, -0.7722405, 1, 0, 0, 1, 1,
-0.3764948, 1.162336, -0.4635099, 1, 0, 0, 1, 1,
-0.3725229, 0.425421, -1.635304, 1, 0, 0, 1, 1,
-0.3705445, 0.04256254, -1.362874, 1, 0, 0, 1, 1,
-0.3654913, 0.5099707, -0.5595444, 1, 0, 0, 1, 1,
-0.3631302, 1.006214, -2.313867, 0, 0, 0, 1, 1,
-0.3626525, 0.5185804, -0.6553987, 0, 0, 0, 1, 1,
-0.3620592, -0.006329047, -1.501254, 0, 0, 0, 1, 1,
-0.3608627, 3.045228, 0.09320127, 0, 0, 0, 1, 1,
-0.3581639, -0.4117154, -3.091676, 0, 0, 0, 1, 1,
-0.3550713, 0.131827, -1.370491, 0, 0, 0, 1, 1,
-0.3519848, -0.584352, -0.2657248, 0, 0, 0, 1, 1,
-0.3514351, -1.941661, -3.490012, 1, 1, 1, 1, 1,
-0.3467946, -0.3595906, -1.913076, 1, 1, 1, 1, 1,
-0.3455808, -0.3465342, -2.676717, 1, 1, 1, 1, 1,
-0.3407695, 0.1528977, -0.4630912, 1, 1, 1, 1, 1,
-0.3372982, -1.336948, -3.019866, 1, 1, 1, 1, 1,
-0.3362379, -0.513252, -3.078574, 1, 1, 1, 1, 1,
-0.3340923, 0.04315986, -2.263219, 1, 1, 1, 1, 1,
-0.3336738, 0.0196007, -3.609821, 1, 1, 1, 1, 1,
-0.3297405, 0.9364107, 0.09046698, 1, 1, 1, 1, 1,
-0.3254973, 0.4345924, -1.201142, 1, 1, 1, 1, 1,
-0.3226432, 0.1243867, -1.801778, 1, 1, 1, 1, 1,
-0.3223795, 0.2532989, -1.38786, 1, 1, 1, 1, 1,
-0.321842, 0.3628739, -0.6750624, 1, 1, 1, 1, 1,
-0.3142642, -0.1031389, -0.8340494, 1, 1, 1, 1, 1,
-0.308301, 0.1921714, -0.2946116, 1, 1, 1, 1, 1,
-0.3075109, 0.3758402, 0.02608703, 0, 0, 1, 1, 1,
-0.3068545, 1.458378, 0.3596044, 1, 0, 0, 1, 1,
-0.3064705, 1.033057, -0.5515924, 1, 0, 0, 1, 1,
-0.3024882, 0.634431, -1.554235, 1, 0, 0, 1, 1,
-0.2941294, 1.222348, -1.512969, 1, 0, 0, 1, 1,
-0.2913041, -0.7304463, -2.171444, 1, 0, 0, 1, 1,
-0.2892003, -0.524545, -1.434827, 0, 0, 0, 1, 1,
-0.2869792, 0.8763474, -2.739884, 0, 0, 0, 1, 1,
-0.2842624, -0.2815498, -2.566741, 0, 0, 0, 1, 1,
-0.2842102, 0.2005032, -0.7072241, 0, 0, 0, 1, 1,
-0.280366, 0.8333867, -0.01660466, 0, 0, 0, 1, 1,
-0.2800964, 0.3325627, -1.924048, 0, 0, 0, 1, 1,
-0.279955, 0.4830167, 0.5672383, 0, 0, 0, 1, 1,
-0.273995, -0.5906837, -1.421273, 1, 1, 1, 1, 1,
-0.2691385, -1.532584, -2.494163, 1, 1, 1, 1, 1,
-0.2684255, 0.02764043, -2.061347, 1, 1, 1, 1, 1,
-0.268411, 0.3040104, -0.03292999, 1, 1, 1, 1, 1,
-0.2680361, -0.9412675, -2.722667, 1, 1, 1, 1, 1,
-0.2667229, -0.7503991, -2.261177, 1, 1, 1, 1, 1,
-0.2591286, -2.236034, -1.872133, 1, 1, 1, 1, 1,
-0.2586294, 0.06919384, -1.071906, 1, 1, 1, 1, 1,
-0.2579564, 1.236835, -1.001642, 1, 1, 1, 1, 1,
-0.2571388, -0.798813, -1.46092, 1, 1, 1, 1, 1,
-0.2569145, -0.6907957, -3.654084, 1, 1, 1, 1, 1,
-0.2536104, -0.3844241, -3.468204, 1, 1, 1, 1, 1,
-0.2529933, -0.1676039, -1.219316, 1, 1, 1, 1, 1,
-0.2513736, 1.022395, -0.2617656, 1, 1, 1, 1, 1,
-0.2444744, -0.2150508, -1.366419, 1, 1, 1, 1, 1,
-0.2401226, 0.02468678, -1.97242, 0, 0, 1, 1, 1,
-0.2332335, 0.6571441, -0.2805581, 1, 0, 0, 1, 1,
-0.2328977, 0.7071419, 0.1262088, 1, 0, 0, 1, 1,
-0.2265676, -0.2183057, -1.928389, 1, 0, 0, 1, 1,
-0.2226766, 0.3759158, -0.1414902, 1, 0, 0, 1, 1,
-0.2211889, -0.7089711, -3.049936, 1, 0, 0, 1, 1,
-0.2183332, 0.7235672, -1.878612, 0, 0, 0, 1, 1,
-0.2174895, -0.3355888, -4.033791, 0, 0, 0, 1, 1,
-0.2150247, 0.410033, -0.1709585, 0, 0, 0, 1, 1,
-0.2098317, 0.3986846, -0.09466096, 0, 0, 0, 1, 1,
-0.2094714, 0.3518173, -1.889072, 0, 0, 0, 1, 1,
-0.2053841, -0.6150456, -1.256581, 0, 0, 0, 1, 1,
-0.2048381, 0.2441476, -1.854475, 0, 0, 0, 1, 1,
-0.2039286, -0.4556296, -2.312757, 1, 1, 1, 1, 1,
-0.2008688, -2.016867, -2.330559, 1, 1, 1, 1, 1,
-0.1964674, -1.623473, -3.320167, 1, 1, 1, 1, 1,
-0.1964318, 0.9448231, 0.4474404, 1, 1, 1, 1, 1,
-0.1869108, -1.413628, -3.816452, 1, 1, 1, 1, 1,
-0.186122, -0.2205867, -1.964025, 1, 1, 1, 1, 1,
-0.1860354, 0.7988076, -1.009796, 1, 1, 1, 1, 1,
-0.1848175, 0.2077323, -1.059176, 1, 1, 1, 1, 1,
-0.1812959, 0.1316358, -1.3649, 1, 1, 1, 1, 1,
-0.1810014, -0.3615584, -1.791212, 1, 1, 1, 1, 1,
-0.1770622, 1.889857, 1.38145, 1, 1, 1, 1, 1,
-0.1760475, 0.4091659, -0.1300157, 1, 1, 1, 1, 1,
-0.1745226, 1.178153, 0.3367641, 1, 1, 1, 1, 1,
-0.1719603, -1.555465, -4.521975, 1, 1, 1, 1, 1,
-0.1693461, 1.461913, -2.892187, 1, 1, 1, 1, 1,
-0.1634198, 0.08199057, -1.693798, 0, 0, 1, 1, 1,
-0.1613329, 0.429501, 0.9568476, 1, 0, 0, 1, 1,
-0.159743, -0.21743, -2.620362, 1, 0, 0, 1, 1,
-0.1545125, 0.04277551, -1.612745, 1, 0, 0, 1, 1,
-0.153752, -0.7480705, -2.265374, 1, 0, 0, 1, 1,
-0.1506725, 1.139379, 0.8929394, 1, 0, 0, 1, 1,
-0.1480962, -0.03206135, -2.579544, 0, 0, 0, 1, 1,
-0.146836, 0.335679, -1.117885, 0, 0, 0, 1, 1,
-0.1465987, 1.21558, -1.285976, 0, 0, 0, 1, 1,
-0.1454891, 0.4622767, -1.594047, 0, 0, 0, 1, 1,
-0.1449563, 1.589601, -1.36966, 0, 0, 0, 1, 1,
-0.1407387, -0.1130997, -1.734939, 0, 0, 0, 1, 1,
-0.1354654, -0.9505202, -3.029893, 0, 0, 0, 1, 1,
-0.1342609, 1.116481, -0.281307, 1, 1, 1, 1, 1,
-0.1317042, 3.066117, 2.32392, 1, 1, 1, 1, 1,
-0.1310174, 0.469178, 1.325706, 1, 1, 1, 1, 1,
-0.1300391, 0.539658, 0.6536759, 1, 1, 1, 1, 1,
-0.1284317, -1.299941, -1.573787, 1, 1, 1, 1, 1,
-0.1282439, 1.476197, 1.379492, 1, 1, 1, 1, 1,
-0.1279967, 2.432243, 0.002273682, 1, 1, 1, 1, 1,
-0.1273911, -0.08291547, -3.83246, 1, 1, 1, 1, 1,
-0.1246717, -0.9252931, -2.460404, 1, 1, 1, 1, 1,
-0.1243269, 0.6602519, -0.4840069, 1, 1, 1, 1, 1,
-0.124308, 0.800806, -1.21799, 1, 1, 1, 1, 1,
-0.1214892, 0.04317287, -0.1641945, 1, 1, 1, 1, 1,
-0.1201, 0.3435197, 0.2731553, 1, 1, 1, 1, 1,
-0.1190254, 1.440686, -1.654941, 1, 1, 1, 1, 1,
-0.1164796, -0.02747236, -1.937385, 1, 1, 1, 1, 1,
-0.1153146, 1.121151, 0.5853688, 0, 0, 1, 1, 1,
-0.1140924, -0.474217, -2.498709, 1, 0, 0, 1, 1,
-0.1096854, 0.4503533, -0.5613258, 1, 0, 0, 1, 1,
-0.1001502, -0.6214276, -3.775581, 1, 0, 0, 1, 1,
-0.09595763, 0.8549054, -1.184526, 1, 0, 0, 1, 1,
-0.08911177, -1.903769, -4.214857, 1, 0, 0, 1, 1,
-0.08625631, 1.150032, -0.6763619, 0, 0, 0, 1, 1,
-0.08548754, 0.7496284, 0.6577655, 0, 0, 0, 1, 1,
-0.0830342, -1.120033, -2.952947, 0, 0, 0, 1, 1,
-0.0820268, 1.328493, -1.25164, 0, 0, 0, 1, 1,
-0.07917329, 0.145748, -1.257972, 0, 0, 0, 1, 1,
-0.07902749, -1.063916, -1.685257, 0, 0, 0, 1, 1,
-0.07829648, 1.292446, -0.2810235, 0, 0, 0, 1, 1,
-0.07708401, 1.022236, 1.564425, 1, 1, 1, 1, 1,
-0.0761396, 0.6199155, -0.2232972, 1, 1, 1, 1, 1,
-0.07222187, -1.327314, -4.358949, 1, 1, 1, 1, 1,
-0.07114259, 0.5192057, 1.065431, 1, 1, 1, 1, 1,
-0.07036545, -0.2331639, -2.62281, 1, 1, 1, 1, 1,
-0.06615841, 0.2730728, -1.311399, 1, 1, 1, 1, 1,
-0.06442297, 1.500459, -1.092191, 1, 1, 1, 1, 1,
-0.06188978, 1.037205, -0.1631793, 1, 1, 1, 1, 1,
-0.06109758, -1.417065, -1.430997, 1, 1, 1, 1, 1,
-0.06013079, -1.229673, -4.495824, 1, 1, 1, 1, 1,
-0.0531318, 0.08289068, -2.507744, 1, 1, 1, 1, 1,
-0.05248113, 0.08266594, -0.4375485, 1, 1, 1, 1, 1,
-0.05220463, -0.7749941, 0.03831663, 1, 1, 1, 1, 1,
-0.04964809, -1.495787, -3.839286, 1, 1, 1, 1, 1,
-0.04853209, 0.5575981, 1.244301, 1, 1, 1, 1, 1,
-0.04727825, 0.8918509, -0.9636255, 0, 0, 1, 1, 1,
-0.04450018, 0.775504, -2.31261, 1, 0, 0, 1, 1,
-0.04020255, -0.3548864, -0.804402, 1, 0, 0, 1, 1,
-0.03284488, -1.89537, -2.505243, 1, 0, 0, 1, 1,
-0.02945542, -0.5224024, -1.304734, 1, 0, 0, 1, 1,
-0.02493312, 0.9299267, -0.1361407, 1, 0, 0, 1, 1,
-0.02301493, -0.719209, -2.219403, 0, 0, 0, 1, 1,
-0.02178312, -1.546163, -2.097043, 0, 0, 0, 1, 1,
-0.02094956, -0.6697423, -3.635789, 0, 0, 0, 1, 1,
-0.02085375, 0.1748463, 0.8338973, 0, 0, 0, 1, 1,
-0.01911973, -0.1780032, -3.161258, 0, 0, 0, 1, 1,
-0.01788409, 0.6443546, -1.59212, 0, 0, 0, 1, 1,
-0.01577176, 0.08571953, -1.194456, 0, 0, 0, 1, 1,
-0.01247825, 1.163204, 0.3701367, 1, 1, 1, 1, 1,
-0.01088361, -0.7200301, -2.48921, 1, 1, 1, 1, 1,
-0.01044005, 0.2876326, 0.3099625, 1, 1, 1, 1, 1,
-0.008529945, 1.501941, -1.179851, 1, 1, 1, 1, 1,
-0.006263683, -1.011779, -0.8799455, 1, 1, 1, 1, 1,
-0.005921503, -0.1032526, -1.559393, 1, 1, 1, 1, 1,
-0.004148218, -0.9454155, -3.262794, 1, 1, 1, 1, 1,
-0.002400432, -0.1844065, -2.232371, 1, 1, 1, 1, 1,
0.002480536, -0.5402932, 3.073601, 1, 1, 1, 1, 1,
0.00355853, 0.8520948, -0.1656847, 1, 1, 1, 1, 1,
0.005064569, 0.1989697, -0.2971924, 1, 1, 1, 1, 1,
0.005723896, 0.4109199, 1.626631, 1, 1, 1, 1, 1,
0.01207067, -0.6702949, 2.427321, 1, 1, 1, 1, 1,
0.01281172, -0.7506381, 2.652901, 1, 1, 1, 1, 1,
0.01366926, 0.3301918, 0.4960054, 1, 1, 1, 1, 1,
0.02289822, 0.58007, 0.2949868, 0, 0, 1, 1, 1,
0.02596614, 1.402233, -1.119644, 1, 0, 0, 1, 1,
0.02789592, 0.2963421, -0.179538, 1, 0, 0, 1, 1,
0.02836252, -1.038068, 2.719965, 1, 0, 0, 1, 1,
0.0302754, 1.354492, 0.6779245, 1, 0, 0, 1, 1,
0.03100396, -1.142433, 3.341181, 1, 0, 0, 1, 1,
0.0354713, 0.3053212, -1.104388, 0, 0, 0, 1, 1,
0.0427247, -0.09870269, 1.697352, 0, 0, 0, 1, 1,
0.04493809, -0.5526611, 2.351341, 0, 0, 0, 1, 1,
0.04623105, -0.2823775, 1.886231, 0, 0, 0, 1, 1,
0.04924395, 0.9822356, -1.179193, 0, 0, 0, 1, 1,
0.04927075, 0.9937036, -0.03275203, 0, 0, 0, 1, 1,
0.05291159, -0.2015209, 3.26702, 0, 0, 0, 1, 1,
0.05430404, 1.264846, -0.3478547, 1, 1, 1, 1, 1,
0.05766097, 0.3094525, 0.2832523, 1, 1, 1, 1, 1,
0.05803619, 1.309951, 0.5342671, 1, 1, 1, 1, 1,
0.05808099, -3.192079, 3.146509, 1, 1, 1, 1, 1,
0.06715874, 0.1575255, 0.4493845, 1, 1, 1, 1, 1,
0.07010338, 0.6727789, 0.4042049, 1, 1, 1, 1, 1,
0.0723663, -2.565365, 3.131998, 1, 1, 1, 1, 1,
0.07746822, 0.02382285, -1.003362, 1, 1, 1, 1, 1,
0.07747428, 1.113742, 1.56806, 1, 1, 1, 1, 1,
0.07849797, 0.6853338, 1.235565, 1, 1, 1, 1, 1,
0.07925812, -0.6804753, 4.234595, 1, 1, 1, 1, 1,
0.08434049, 1.182925, -0.8322581, 1, 1, 1, 1, 1,
0.086454, 0.09074301, 1.353466, 1, 1, 1, 1, 1,
0.0884954, -0.8253883, 2.847508, 1, 1, 1, 1, 1,
0.08884472, 0.1887551, 1.32871, 1, 1, 1, 1, 1,
0.09280252, -0.2497114, 3.02493, 0, 0, 1, 1, 1,
0.09441715, -0.2267285, 2.393026, 1, 0, 0, 1, 1,
0.09805225, 0.5269151, 1.316344, 1, 0, 0, 1, 1,
0.09881466, 0.3451833, 2.361332, 1, 0, 0, 1, 1,
0.1019967, 1.292203, -1.350078, 1, 0, 0, 1, 1,
0.1053446, 0.3739294, 0.739836, 1, 0, 0, 1, 1,
0.1084675, 1.961832, -0.6775241, 0, 0, 0, 1, 1,
0.1087109, 0.4767328, 0.9686038, 0, 0, 0, 1, 1,
0.1103111, 0.4539644, 1.029583, 0, 0, 0, 1, 1,
0.1109508, -0.7479586, 2.045868, 0, 0, 0, 1, 1,
0.1143526, -1.23667, 3.497937, 0, 0, 0, 1, 1,
0.116296, -0.06119231, 2.31586, 0, 0, 0, 1, 1,
0.1193537, 0.6256862, -0.4728725, 0, 0, 0, 1, 1,
0.1200924, -0.9409457, 1.461463, 1, 1, 1, 1, 1,
0.1244648, 1.557548, -0.04790502, 1, 1, 1, 1, 1,
0.1252491, -1.602768, 2.583141, 1, 1, 1, 1, 1,
0.1257221, 1.031065, -0.6361345, 1, 1, 1, 1, 1,
0.1285086, -0.8621283, 3.504454, 1, 1, 1, 1, 1,
0.1292235, -0.1954198, 3.477107, 1, 1, 1, 1, 1,
0.1345648, 2.500422, 0.9453108, 1, 1, 1, 1, 1,
0.1398901, -1.247261, 3.724032, 1, 1, 1, 1, 1,
0.1402127, -0.2684599, 4.105814, 1, 1, 1, 1, 1,
0.1413952, -0.1656189, 2.601822, 1, 1, 1, 1, 1,
0.1418273, 1.921591, 1.22598, 1, 1, 1, 1, 1,
0.1467367, -0.08493023, 1.582667, 1, 1, 1, 1, 1,
0.1518806, -0.09497303, 2.166071, 1, 1, 1, 1, 1,
0.1545015, -1.16816, 3.088082, 1, 1, 1, 1, 1,
0.1559917, 1.88915, -0.2186145, 1, 1, 1, 1, 1,
0.1566246, -1.577765, 4.783674, 0, 0, 1, 1, 1,
0.1575515, 1.120632, -0.05576085, 1, 0, 0, 1, 1,
0.1584231, -0.1507862, 1.748563, 1, 0, 0, 1, 1,
0.1643415, 0.06150524, 0.8735198, 1, 0, 0, 1, 1,
0.1695504, -0.1661189, 2.940823, 1, 0, 0, 1, 1,
0.171129, -0.9737285, 1.100917, 1, 0, 0, 1, 1,
0.174872, 0.1326438, 0.1920284, 0, 0, 0, 1, 1,
0.1767183, 0.3101634, 0.8997349, 0, 0, 0, 1, 1,
0.1808961, -2.326914, 2.906089, 0, 0, 0, 1, 1,
0.1814194, -0.2837801, 2.79808, 0, 0, 0, 1, 1,
0.1818726, 0.05642481, 1.189634, 0, 0, 0, 1, 1,
0.1838741, 1.122346, -1.281609, 0, 0, 0, 1, 1,
0.1851818, -2.591317, 1.932702, 0, 0, 0, 1, 1,
0.1861954, 0.2593893, 0.1737034, 1, 1, 1, 1, 1,
0.1896701, 0.3616639, 0.3432232, 1, 1, 1, 1, 1,
0.1927373, -0.6502363, 2.45652, 1, 1, 1, 1, 1,
0.1927389, -1.761352, 2.739702, 1, 1, 1, 1, 1,
0.193024, 0.5395409, -0.2538818, 1, 1, 1, 1, 1,
0.1938874, 0.9450026, -0.1239027, 1, 1, 1, 1, 1,
0.1955065, 1.302083, -0.4916693, 1, 1, 1, 1, 1,
0.1971933, 0.8295606, 0.1534848, 1, 1, 1, 1, 1,
0.1978034, 0.5902264, 1.50549, 1, 1, 1, 1, 1,
0.2020618, 1.984422, 0.3623676, 1, 1, 1, 1, 1,
0.2084115, 0.04280463, 0.9445779, 1, 1, 1, 1, 1,
0.2139268, -0.6416953, 2.161978, 1, 1, 1, 1, 1,
0.2164413, -1.117554, 3.075483, 1, 1, 1, 1, 1,
0.2169089, 0.5132049, 0.6238141, 1, 1, 1, 1, 1,
0.2175589, 0.6659012, 0.7936319, 1, 1, 1, 1, 1,
0.2190536, -1.624139, 1.616806, 0, 0, 1, 1, 1,
0.2193662, -0.7188962, 2.319472, 1, 0, 0, 1, 1,
0.2228707, -0.807263, 2.835447, 1, 0, 0, 1, 1,
0.2349875, -1.351293, 1.30418, 1, 0, 0, 1, 1,
0.2362879, 0.50529, 2.503581, 1, 0, 0, 1, 1,
0.2366208, 1.225228, -0.5312784, 1, 0, 0, 1, 1,
0.2413883, -0.1221083, 1.749622, 0, 0, 0, 1, 1,
0.243016, 0.3839912, -0.6454706, 0, 0, 0, 1, 1,
0.2461717, -0.9527299, 1.6957, 0, 0, 0, 1, 1,
0.2469185, 0.3282086, -0.05141789, 0, 0, 0, 1, 1,
0.25045, 0.1630445, -0.7523159, 0, 0, 0, 1, 1,
0.2532238, -1.253912, 1.106717, 0, 0, 0, 1, 1,
0.2552767, 1.449025, 1.14366, 0, 0, 0, 1, 1,
0.2563143, -0.1846716, 2.39715, 1, 1, 1, 1, 1,
0.2587821, -0.3069099, 3.028965, 1, 1, 1, 1, 1,
0.2631985, -0.08704816, 2.186636, 1, 1, 1, 1, 1,
0.2654375, -0.9446084, 3.316978, 1, 1, 1, 1, 1,
0.2662481, -2.500249, 3.441702, 1, 1, 1, 1, 1,
0.2681233, 2.156526, 0.7399402, 1, 1, 1, 1, 1,
0.2707748, 1.623297, 1.947609, 1, 1, 1, 1, 1,
0.2782615, -0.4898415, 0.5613994, 1, 1, 1, 1, 1,
0.278978, -0.3025525, 4.924021, 1, 1, 1, 1, 1,
0.2800141, 1.340015, 0.6627735, 1, 1, 1, 1, 1,
0.2831959, -0.06983768, 1.559488, 1, 1, 1, 1, 1,
0.2851872, -1.725844, 1.886804, 1, 1, 1, 1, 1,
0.2863972, 0.4513593, 1.241707, 1, 1, 1, 1, 1,
0.2939358, 0.5562175, -0.2487635, 1, 1, 1, 1, 1,
0.2972981, -0.08867037, 2.590203, 1, 1, 1, 1, 1,
0.2979766, -2.15132, 2.219803, 0, 0, 1, 1, 1,
0.2989126, 0.2961612, 1.614547, 1, 0, 0, 1, 1,
0.3015011, 0.5476521, 0.9705808, 1, 0, 0, 1, 1,
0.3061993, -0.7382741, 1.780961, 1, 0, 0, 1, 1,
0.3151557, -0.3773492, 2.953756, 1, 0, 0, 1, 1,
0.3163044, 0.8186129, 1.164581, 1, 0, 0, 1, 1,
0.3192332, -1.02948, 4.600983, 0, 0, 0, 1, 1,
0.3200403, 1.744256, 1.450132, 0, 0, 0, 1, 1,
0.3207718, 1.036131, 0.1422878, 0, 0, 0, 1, 1,
0.3238342, -0.4947199, 2.933588, 0, 0, 0, 1, 1,
0.3244644, -0.4009193, 1.517112, 0, 0, 0, 1, 1,
0.3248454, 0.4221934, 0.5452715, 0, 0, 0, 1, 1,
0.3373642, 0.7287192, 1.447489, 0, 0, 0, 1, 1,
0.3422236, 0.8987759, 0.6847264, 1, 1, 1, 1, 1,
0.3488966, -0.155384, 1.98067, 1, 1, 1, 1, 1,
0.3516642, -0.04734239, 1.991862, 1, 1, 1, 1, 1,
0.3624959, 1.184621, 0.9706, 1, 1, 1, 1, 1,
0.3640965, -1.038472, 0.386, 1, 1, 1, 1, 1,
0.3645881, -1.406847, 2.166915, 1, 1, 1, 1, 1,
0.3679068, -0.0968186, 1.022656, 1, 1, 1, 1, 1,
0.3687811, -0.56429, 2.350188, 1, 1, 1, 1, 1,
0.3695437, 1.068268, 1.00407, 1, 1, 1, 1, 1,
0.3705929, 0.960034, 1.015327, 1, 1, 1, 1, 1,
0.3721361, -0.5053734, 3.881464, 1, 1, 1, 1, 1,
0.3725172, -0.4635395, 1.363205, 1, 1, 1, 1, 1,
0.3732359, 0.592555, -0.3657146, 1, 1, 1, 1, 1,
0.3816794, -1.127667, 2.943298, 1, 1, 1, 1, 1,
0.3828873, -1.811767, 2.650843, 1, 1, 1, 1, 1,
0.3876329, -1.66411, 2.266183, 0, 0, 1, 1, 1,
0.3942208, 0.9425711, -1.558418, 1, 0, 0, 1, 1,
0.3954128, 0.05445455, -0.7497298, 1, 0, 0, 1, 1,
0.3955798, 0.6473159, 2.297561, 1, 0, 0, 1, 1,
0.3983105, 0.4983924, 1.158165, 1, 0, 0, 1, 1,
0.3984883, -0.716297, 3.408198, 1, 0, 0, 1, 1,
0.3993371, 0.03278907, 0.4864285, 0, 0, 0, 1, 1,
0.4003077, -1.09692, 2.505151, 0, 0, 0, 1, 1,
0.4004005, 1.578167, -0.7697434, 0, 0, 0, 1, 1,
0.4059032, -1.141859, 3.29502, 0, 0, 0, 1, 1,
0.4085616, -0.1441569, 0.5446643, 0, 0, 0, 1, 1,
0.4089321, 0.6365391, 1.51148, 0, 0, 0, 1, 1,
0.415966, -1.952788, 4.790741, 0, 0, 0, 1, 1,
0.4171593, 0.2358517, 1.669917, 1, 1, 1, 1, 1,
0.4185756, -0.4182244, 2.152876, 1, 1, 1, 1, 1,
0.4200083, -0.590373, 3.607399, 1, 1, 1, 1, 1,
0.4212681, -0.961714, 4.517192, 1, 1, 1, 1, 1,
0.4235471, -0.5899689, 1.402211, 1, 1, 1, 1, 1,
0.4243605, -1.001958, 2.469804, 1, 1, 1, 1, 1,
0.4250844, -0.6889824, 2.576957, 1, 1, 1, 1, 1,
0.4365346, -0.8128034, 3.445123, 1, 1, 1, 1, 1,
0.4384199, -1.052437, 3.640889, 1, 1, 1, 1, 1,
0.448, 0.357596, 0.2149049, 1, 1, 1, 1, 1,
0.4573561, 0.4976557, 2.493442, 1, 1, 1, 1, 1,
0.4624689, -2.241247, 1.133843, 1, 1, 1, 1, 1,
0.462759, -1.094642, 2.805944, 1, 1, 1, 1, 1,
0.4647216, 0.8787786, 0.4552044, 1, 1, 1, 1, 1,
0.4651539, -0.3149183, 2.54409, 1, 1, 1, 1, 1,
0.466006, 1.965392, 0.5689144, 0, 0, 1, 1, 1,
0.4667574, -0.4634086, 0.7190879, 1, 0, 0, 1, 1,
0.4677265, -0.9194289, 2.461231, 1, 0, 0, 1, 1,
0.4681548, 0.9982899, -1.157983, 1, 0, 0, 1, 1,
0.470846, 2.566818, -0.3350584, 1, 0, 0, 1, 1,
0.4714705, 1.238151, 1.190731, 1, 0, 0, 1, 1,
0.4728146, -0.0676475, 2.160399, 0, 0, 0, 1, 1,
0.4750915, 0.8399646, 0.5095477, 0, 0, 0, 1, 1,
0.477139, -1.699472, 1.544339, 0, 0, 0, 1, 1,
0.4832194, -0.004616288, 0.934571, 0, 0, 0, 1, 1,
0.4862779, 0.9635144, -0.09327453, 0, 0, 0, 1, 1,
0.4881302, -1.220783, 2.348855, 0, 0, 0, 1, 1,
0.4898408, 2.675762, 1.544495, 0, 0, 0, 1, 1,
0.5002908, -0.4576314, 2.680871, 1, 1, 1, 1, 1,
0.5008752, 0.209039, 2.432979, 1, 1, 1, 1, 1,
0.5017492, 0.7082486, 0.975907, 1, 1, 1, 1, 1,
0.5047861, 0.5153515, 0.8050787, 1, 1, 1, 1, 1,
0.5081012, -1.735063, 2.314243, 1, 1, 1, 1, 1,
0.5081236, -1.430107, 2.112281, 1, 1, 1, 1, 1,
0.5119423, -2.0139, 2.976767, 1, 1, 1, 1, 1,
0.5129394, 0.132115, 1.524315, 1, 1, 1, 1, 1,
0.5201443, 0.5907587, -1.098929, 1, 1, 1, 1, 1,
0.5210077, 0.3457126, 0.5561321, 1, 1, 1, 1, 1,
0.522813, 0.4439047, 1.41078, 1, 1, 1, 1, 1,
0.5236049, -0.8856003, 2.372082, 1, 1, 1, 1, 1,
0.5262858, -0.1866427, 0.07318533, 1, 1, 1, 1, 1,
0.5325561, 0.6207141, 0.2755039, 1, 1, 1, 1, 1,
0.53908, -0.7445605, 2.829352, 1, 1, 1, 1, 1,
0.5422747, 0.6166326, 1.129618, 0, 0, 1, 1, 1,
0.5481662, 0.04770021, 2.596923, 1, 0, 0, 1, 1,
0.5500305, 0.6446071, 0.01478025, 1, 0, 0, 1, 1,
0.5510623, -1.678633, 2.265737, 1, 0, 0, 1, 1,
0.55424, 0.9490823, -2.299678, 1, 0, 0, 1, 1,
0.5550669, -2.412055, 3.938892, 1, 0, 0, 1, 1,
0.5585598, -0.9195424, 2.507954, 0, 0, 0, 1, 1,
0.5615143, 0.3044742, 2.507372, 0, 0, 0, 1, 1,
0.5630044, 0.09741746, 1.554388, 0, 0, 0, 1, 1,
0.56669, -0.1371119, 1.779567, 0, 0, 0, 1, 1,
0.569488, -1.634713, 2.322028, 0, 0, 0, 1, 1,
0.570985, -0.5581719, 1.775279, 0, 0, 0, 1, 1,
0.5804631, -1.127261, 2.411204, 0, 0, 0, 1, 1,
0.5840244, 0.9723687, 0.3868417, 1, 1, 1, 1, 1,
0.5881602, -1.262389, 2.968736, 1, 1, 1, 1, 1,
0.5888261, -1.157728, 2.980292, 1, 1, 1, 1, 1,
0.5946892, 1.055749, 0.7209492, 1, 1, 1, 1, 1,
0.5964522, 0.5942789, 1.88541, 1, 1, 1, 1, 1,
0.6021349, 0.5579607, 0.3226679, 1, 1, 1, 1, 1,
0.60913, 0.5410808, 1.094572, 1, 1, 1, 1, 1,
0.6106454, 0.4675844, 0.8380833, 1, 1, 1, 1, 1,
0.613375, -0.6182415, 2.173733, 1, 1, 1, 1, 1,
0.6155369, -0.05640064, 1.050583, 1, 1, 1, 1, 1,
0.6196453, 0.120678, 0.7806944, 1, 1, 1, 1, 1,
0.6202118, -0.8136978, 2.787529, 1, 1, 1, 1, 1,
0.6205121, 0.8753755, 0.6238914, 1, 1, 1, 1, 1,
0.6276615, 0.6021163, -0.2173635, 1, 1, 1, 1, 1,
0.6302099, -0.2540174, 1.943386, 1, 1, 1, 1, 1,
0.6314315, -0.5289394, 3.044655, 0, 0, 1, 1, 1,
0.6370064, 0.0009958252, 0.5756799, 1, 0, 0, 1, 1,
0.6444138, -0.2025566, 3.991131, 1, 0, 0, 1, 1,
0.6450815, 0.8035008, 1.451409, 1, 0, 0, 1, 1,
0.647728, 0.8343481, 3.017532, 1, 0, 0, 1, 1,
0.6515929, 0.07214171, 0.8794674, 1, 0, 0, 1, 1,
0.6546732, 0.4686227, -0.2470182, 0, 0, 0, 1, 1,
0.6586457, -2.88525, 2.499544, 0, 0, 0, 1, 1,
0.6640436, 0.01428292, 0.3858016, 0, 0, 0, 1, 1,
0.6640816, -0.7000448, 2.29209, 0, 0, 0, 1, 1,
0.6706597, 1.111605, -1.100553, 0, 0, 0, 1, 1,
0.6708412, 1.467409, -0.6154883, 0, 0, 0, 1, 1,
0.6720945, 0.1640074, 0.8631243, 0, 0, 0, 1, 1,
0.6765359, -0.8260958, 2.202513, 1, 1, 1, 1, 1,
0.6775627, -1.089409, 4.440125, 1, 1, 1, 1, 1,
0.6798839, -0.3811286, 2.117988, 1, 1, 1, 1, 1,
0.6843619, 1.110155, 0.09876721, 1, 1, 1, 1, 1,
0.6864725, 1.300694, 0.6431566, 1, 1, 1, 1, 1,
0.6909023, 0.09982634, 0.1578198, 1, 1, 1, 1, 1,
0.6958385, -0.2254119, 0.4146864, 1, 1, 1, 1, 1,
0.6972373, -2.117697, 4.014094, 1, 1, 1, 1, 1,
0.7036051, -0.7606581, 0.8011007, 1, 1, 1, 1, 1,
0.7098713, 0.6910835, 0.7573203, 1, 1, 1, 1, 1,
0.7132561, -0.7629235, 3.115674, 1, 1, 1, 1, 1,
0.7138771, -0.3679561, 3.356199, 1, 1, 1, 1, 1,
0.7163993, -0.1970064, 2.205608, 1, 1, 1, 1, 1,
0.7164825, 0.1349554, 2.066304, 1, 1, 1, 1, 1,
0.7193674, -0.3218131, 2.984173, 1, 1, 1, 1, 1,
0.7262034, -0.6380962, 3.362709, 0, 0, 1, 1, 1,
0.7268696, 0.8111243, 0.6674874, 1, 0, 0, 1, 1,
0.7293798, -0.6772175, 2.966384, 1, 0, 0, 1, 1,
0.7335745, 0.8419105, -0.4726825, 1, 0, 0, 1, 1,
0.7342836, 0.6105726, 1.28201, 1, 0, 0, 1, 1,
0.7358268, 1.520554, 1.168654, 1, 0, 0, 1, 1,
0.7377895, 1.631003, 1.955548, 0, 0, 0, 1, 1,
0.7402741, -0.3380527, 1.744489, 0, 0, 0, 1, 1,
0.7419865, 0.3278516, 0.3763543, 0, 0, 0, 1, 1,
0.7420394, -1.1904, 4.283863, 0, 0, 0, 1, 1,
0.7449871, -0.90065, 2.034932, 0, 0, 0, 1, 1,
0.7527324, -0.9661808, 2.821013, 0, 0, 0, 1, 1,
0.7552457, -2.188039, 0.7252482, 0, 0, 0, 1, 1,
0.755739, -0.7509472, 2.092649, 1, 1, 1, 1, 1,
0.7676074, 0.7717034, 1.707815, 1, 1, 1, 1, 1,
0.7698222, -1.65171, 3.697474, 1, 1, 1, 1, 1,
0.7800892, -0.3735723, 1.467025, 1, 1, 1, 1, 1,
0.7805998, 0.5829508, 1.820432, 1, 1, 1, 1, 1,
0.7813125, -2.148931, 2.162327, 1, 1, 1, 1, 1,
0.785973, 0.1112673, 3.181019, 1, 1, 1, 1, 1,
0.786679, -0.06774922, 0.9952424, 1, 1, 1, 1, 1,
0.7881505, -0.168665, 0.7032528, 1, 1, 1, 1, 1,
0.7906254, 0.4552314, 1.533598, 1, 1, 1, 1, 1,
0.7909738, -1.647129, 2.605011, 1, 1, 1, 1, 1,
0.7933089, 0.8663598, -1.409755, 1, 1, 1, 1, 1,
0.793542, 0.09261044, 3.271126, 1, 1, 1, 1, 1,
0.7936714, 1.296289, 0.4467642, 1, 1, 1, 1, 1,
0.7966238, 2.216523, 2.063648, 1, 1, 1, 1, 1,
0.7999822, 0.6592791, 2.37839, 0, 0, 1, 1, 1,
0.8035322, 1.540806, 0.01839289, 1, 0, 0, 1, 1,
0.8038649, 0.6814521, 0.2195158, 1, 0, 0, 1, 1,
0.8104877, 0.5983198, 1.3086, 1, 0, 0, 1, 1,
0.8147141, -2.405458, 4.700619, 1, 0, 0, 1, 1,
0.8168001, 0.7477642, -1.397527, 1, 0, 0, 1, 1,
0.8261334, -1.017324, 0.3960123, 0, 0, 0, 1, 1,
0.8265035, -0.2154426, -0.03989237, 0, 0, 0, 1, 1,
0.8276291, -0.3458417, 2.761857, 0, 0, 0, 1, 1,
0.8287165, -0.9653386, 1.704002, 0, 0, 0, 1, 1,
0.8322157, 0.283288, 1.721574, 0, 0, 0, 1, 1,
0.8345667, -0.1449703, 0.2360238, 0, 0, 0, 1, 1,
0.8347571, 0.522094, 0.5578932, 0, 0, 0, 1, 1,
0.8401523, -0.2494481, 2.166715, 1, 1, 1, 1, 1,
0.8440225, -0.7639947, 1.695328, 1, 1, 1, 1, 1,
0.8451101, 0.9035608, -0.2755302, 1, 1, 1, 1, 1,
0.8510208, -0.8632318, 2.152858, 1, 1, 1, 1, 1,
0.8526075, -3.044564, 2.838888, 1, 1, 1, 1, 1,
0.8556066, -0.102328, 1.250154, 1, 1, 1, 1, 1,
0.857806, -1.579148, 2.238986, 1, 1, 1, 1, 1,
0.8596435, 1.802605, 0.4472947, 1, 1, 1, 1, 1,
0.8606803, -1.95086, 3.069937, 1, 1, 1, 1, 1,
0.8634714, -0.6455817, 1.130468, 1, 1, 1, 1, 1,
0.866326, 0.2808083, 1.20143, 1, 1, 1, 1, 1,
0.8670248, 0.2533813, 2.232009, 1, 1, 1, 1, 1,
0.8691017, -0.5430653, 1.725315, 1, 1, 1, 1, 1,
0.8720526, 0.6417897, 0.7288904, 1, 1, 1, 1, 1,
0.8721545, -0.1079506, 1.259532, 1, 1, 1, 1, 1,
0.8730892, 0.01259127, 1.797585, 0, 0, 1, 1, 1,
0.8755612, -1.942631, 2.677779, 1, 0, 0, 1, 1,
0.8780534, -1.794434, 2.183789, 1, 0, 0, 1, 1,
0.8845667, 0.6247659, 0.6419122, 1, 0, 0, 1, 1,
0.8847626, -1.247791, 1.484429, 1, 0, 0, 1, 1,
0.8904536, -1.496647, 0.9203474, 1, 0, 0, 1, 1,
0.8904955, 0.9514143, 1.127695, 0, 0, 0, 1, 1,
0.8918318, 0.9804052, 1.938015, 0, 0, 0, 1, 1,
0.9015769, 0.1820294, -0.002493134, 0, 0, 0, 1, 1,
0.9122684, 0.5119641, 1.578193, 0, 0, 0, 1, 1,
0.9129117, -1.57622, 2.714172, 0, 0, 0, 1, 1,
0.9181951, -1.840616, 2.11578, 0, 0, 0, 1, 1,
0.9252662, -0.8907927, 1.240785, 0, 0, 0, 1, 1,
0.9273516, -0.7573385, 2.205365, 1, 1, 1, 1, 1,
0.9285293, -1.451395, 2.814677, 1, 1, 1, 1, 1,
0.931571, -0.4727972, 0.5662971, 1, 1, 1, 1, 1,
0.9318572, 0.0161245, 0.9331113, 1, 1, 1, 1, 1,
0.9320626, -0.5960351, 1.031996, 1, 1, 1, 1, 1,
0.9340975, 0.1649147, 1.451531, 1, 1, 1, 1, 1,
0.9358599, -1.491205, 0.1994092, 1, 1, 1, 1, 1,
0.9381033, -0.1869982, 2.152508, 1, 1, 1, 1, 1,
0.940347, -0.6305973, 1.454084, 1, 1, 1, 1, 1,
0.9481574, -0.02102754, 1.692083, 1, 1, 1, 1, 1,
0.9574018, 0.6196193, -0.0828646, 1, 1, 1, 1, 1,
0.9610057, 0.04994122, 2.284302, 1, 1, 1, 1, 1,
0.9794595, -1.389197, 1.297897, 1, 1, 1, 1, 1,
0.9857731, -0.6917291, 3.762572, 1, 1, 1, 1, 1,
0.990375, 0.7566914, 2.195412, 1, 1, 1, 1, 1,
0.9945598, 0.372192, 2.289589, 0, 0, 1, 1, 1,
0.9980846, 0.3359838, 0.4099737, 1, 0, 0, 1, 1,
1.000622, -0.08646924, 1.541191, 1, 0, 0, 1, 1,
1.002208, -0.2439733, 1.171586, 1, 0, 0, 1, 1,
1.004277, -0.1688603, 2.042267, 1, 0, 0, 1, 1,
1.004983, 0.1931806, 2.16034, 1, 0, 0, 1, 1,
1.005473, -0.4136182, -0.3780504, 0, 0, 0, 1, 1,
1.005964, 0.3352111, 0.5043004, 0, 0, 0, 1, 1,
1.011552, 0.323922, 4.698387, 0, 0, 0, 1, 1,
1.013233, 0.9341607, 1.106876, 0, 0, 0, 1, 1,
1.013823, -1.033431, 1.673782, 0, 0, 0, 1, 1,
1.01635, -0.1230001, 2.489469, 0, 0, 0, 1, 1,
1.017052, 0.7144594, 0.7194518, 0, 0, 0, 1, 1,
1.017446, -0.362977, 1.091579, 1, 1, 1, 1, 1,
1.01847, -2.339433, 3.502833, 1, 1, 1, 1, 1,
1.020037, -2.153879, 1.515857, 1, 1, 1, 1, 1,
1.020777, -0.4084026, 3.138859, 1, 1, 1, 1, 1,
1.02623, -1.465688, 2.654006, 1, 1, 1, 1, 1,
1.03094, -0.6092153, 2.890361, 1, 1, 1, 1, 1,
1.035059, -2.15914, 2.081203, 1, 1, 1, 1, 1,
1.039857, 0.7657945, 1.002765, 1, 1, 1, 1, 1,
1.041511, 1.472082, -0.5460666, 1, 1, 1, 1, 1,
1.052576, -1.591604, 3.021381, 1, 1, 1, 1, 1,
1.05441, -0.6844828, 0.4757879, 1, 1, 1, 1, 1,
1.059944, -0.3284701, 1.038311, 1, 1, 1, 1, 1,
1.066897, -0.6284539, 4.04965, 1, 1, 1, 1, 1,
1.075524, -0.7925984, 1.531079, 1, 1, 1, 1, 1,
1.075728, -0.455819, 4.131051, 1, 1, 1, 1, 1,
1.077716, -0.554467, 3.893512, 0, 0, 1, 1, 1,
1.088811, 0.06736092, 1.878348, 1, 0, 0, 1, 1,
1.090701, -0.3421582, 4.140372, 1, 0, 0, 1, 1,
1.104726, -0.1370988, 0.8554255, 1, 0, 0, 1, 1,
1.106976, 0.6843008, -0.3228604, 1, 0, 0, 1, 1,
1.11103, 1.433508, 1.358105, 1, 0, 0, 1, 1,
1.113025, 1.314808, -0.3828087, 0, 0, 0, 1, 1,
1.116657, -0.2683174, 0.8553173, 0, 0, 0, 1, 1,
1.11969, 0.7929187, 1.822791, 0, 0, 0, 1, 1,
1.120955, -0.8618367, 3.156161, 0, 0, 0, 1, 1,
1.121909, -0.10362, 0.8280377, 0, 0, 0, 1, 1,
1.126909, 0.7655634, 0.2882904, 0, 0, 0, 1, 1,
1.148168, -0.006113124, 3.610305, 0, 0, 0, 1, 1,
1.16587, -0.8178881, 0.7390781, 1, 1, 1, 1, 1,
1.170622, -1.776344, 3.898582, 1, 1, 1, 1, 1,
1.17146, -0.1723004, 1.925442, 1, 1, 1, 1, 1,
1.176608, 1.360879, 1.378653, 1, 1, 1, 1, 1,
1.180567, 0.6884984, 1.60738, 1, 1, 1, 1, 1,
1.181622, 0.2510772, 2.588473, 1, 1, 1, 1, 1,
1.183932, 0.5535534, 1.614181, 1, 1, 1, 1, 1,
1.194265, 1.126882, 0.97352, 1, 1, 1, 1, 1,
1.197775, -0.4411543, 3.080198, 1, 1, 1, 1, 1,
1.218109, 0.9062452, 1.247603, 1, 1, 1, 1, 1,
1.22476, 1.41407, -0.5268118, 1, 1, 1, 1, 1,
1.230846, -0.3004662, -0.0696563, 1, 1, 1, 1, 1,
1.232324, -0.9704782, 2.907812, 1, 1, 1, 1, 1,
1.243604, 2.516774, -0.1351157, 1, 1, 1, 1, 1,
1.254722, -0.6738083, 2.513805, 1, 1, 1, 1, 1,
1.256913, 1.497976, 3.050529, 0, 0, 1, 1, 1,
1.263222, 0.9392394, -0.5321449, 1, 0, 0, 1, 1,
1.274733, 0.7401193, 2.053815, 1, 0, 0, 1, 1,
1.284737, 0.8038764, 0.587968, 1, 0, 0, 1, 1,
1.296597, -0.9122458, 3.808438, 1, 0, 0, 1, 1,
1.29893, -0.01389884, 1.182319, 1, 0, 0, 1, 1,
1.305812, 0.8120375, 2.096573, 0, 0, 0, 1, 1,
1.309533, -1.255264, 2.608523, 0, 0, 0, 1, 1,
1.310379, 0.6709903, 2.487199, 0, 0, 0, 1, 1,
1.312243, 0.36391, 1.398008, 0, 0, 0, 1, 1,
1.321219, -0.1241409, 2.037899, 0, 0, 0, 1, 1,
1.325117, 1.095728, 1.332275, 0, 0, 0, 1, 1,
1.329412, -0.1077318, 0.8577686, 0, 0, 0, 1, 1,
1.339139, 1.29139, 1.363668, 1, 1, 1, 1, 1,
1.357563, 0.05077979, -0.2127318, 1, 1, 1, 1, 1,
1.357825, 2.350284, 1.957779, 1, 1, 1, 1, 1,
1.377779, -0.7609414, 2.694094, 1, 1, 1, 1, 1,
1.382223, -0.1925589, 2.846072, 1, 1, 1, 1, 1,
1.383077, 0.3388166, 1.089147, 1, 1, 1, 1, 1,
1.386672, -0.1945544, 3.095917, 1, 1, 1, 1, 1,
1.390894, 0.4291394, 2.382634, 1, 1, 1, 1, 1,
1.391093, 1.229653, -1.012841, 1, 1, 1, 1, 1,
1.395241, -0.03737787, 0.6335486, 1, 1, 1, 1, 1,
1.397996, 0.4695073, -0.2774398, 1, 1, 1, 1, 1,
1.403359, -0.4156026, 2.793674, 1, 1, 1, 1, 1,
1.415478, 0.5146317, 0.5398375, 1, 1, 1, 1, 1,
1.416331, -0.2439841, 1.366446, 1, 1, 1, 1, 1,
1.426401, -0.6667142, 2.324247, 1, 1, 1, 1, 1,
1.431555, -0.1816568, 3.367932, 0, 0, 1, 1, 1,
1.439337, -0.3066873, 2.117882, 1, 0, 0, 1, 1,
1.462258, 0.4711753, -0.5720042, 1, 0, 0, 1, 1,
1.467952, -0.4694625, 1.632822, 1, 0, 0, 1, 1,
1.474825, -0.4528424, 1.803669, 1, 0, 0, 1, 1,
1.478686, -0.0476873, 2.552767, 1, 0, 0, 1, 1,
1.486377, 0.5618436, 1.769518, 0, 0, 0, 1, 1,
1.505418, 2.346491, -0.513392, 0, 0, 0, 1, 1,
1.530963, -0.5123453, 2.022537, 0, 0, 0, 1, 1,
1.538857, 0.5435675, 1.349951, 0, 0, 0, 1, 1,
1.538963, 0.5730926, 1.31762, 0, 0, 0, 1, 1,
1.539713, -0.8660083, 2.773444, 0, 0, 0, 1, 1,
1.540875, -0.861025, 2.618059, 0, 0, 0, 1, 1,
1.554305, -0.6664686, 0.1813112, 1, 1, 1, 1, 1,
1.565397, 0.1896071, 0.3258129, 1, 1, 1, 1, 1,
1.574933, 0.4453011, 0.3525636, 1, 1, 1, 1, 1,
1.578043, 1.628363, -1.450479, 1, 1, 1, 1, 1,
1.5822, 1.429636, 0.9849927, 1, 1, 1, 1, 1,
1.604725, 0.6741797, 1.075027, 1, 1, 1, 1, 1,
1.613101, 0.6522732, 1.384205, 1, 1, 1, 1, 1,
1.630409, -0.4884713, 1.518939, 1, 1, 1, 1, 1,
1.630834, -0.3113556, 2.083546, 1, 1, 1, 1, 1,
1.640749, -0.08772878, 1.782846, 1, 1, 1, 1, 1,
1.65566, -0.1289831, 2.379199, 1, 1, 1, 1, 1,
1.659359, 0.3220723, 0.2442623, 1, 1, 1, 1, 1,
1.660034, 0.009758676, 1.74205, 1, 1, 1, 1, 1,
1.670955, 0.4048912, 2.730673, 1, 1, 1, 1, 1,
1.673215, 1.675412, 1.075206, 1, 1, 1, 1, 1,
1.685918, -0.9580886, 1.89303, 0, 0, 1, 1, 1,
1.714692, 0.385462, 2.740874, 1, 0, 0, 1, 1,
1.715753, 0.01536568, 0.6800376, 1, 0, 0, 1, 1,
1.721512, 1.250359, 1.647452, 1, 0, 0, 1, 1,
1.731869, 0.251882, 1.147061, 1, 0, 0, 1, 1,
1.733671, -1.256872, 1.772163, 1, 0, 0, 1, 1,
1.737396, 1.148915, 1.61028, 0, 0, 0, 1, 1,
1.746834, -0.2290913, 2.826586, 0, 0, 0, 1, 1,
1.748131, -1.611924, 0.7807106, 0, 0, 0, 1, 1,
1.751761, 0.8914834, 0.3817603, 0, 0, 0, 1, 1,
1.764913, 1.084246, -1.054661, 0, 0, 0, 1, 1,
1.782162, 0.1441959, 0.6103826, 0, 0, 0, 1, 1,
1.790778, 1.225961, 1.671494, 0, 0, 0, 1, 1,
1.821454, 1.098511, 1.328397, 1, 1, 1, 1, 1,
1.830189, -1.733941, 2.657572, 1, 1, 1, 1, 1,
1.831748, -0.3596769, 0.9562011, 1, 1, 1, 1, 1,
1.832827, 0.8065292, 1.249735, 1, 1, 1, 1, 1,
1.840223, 0.6986319, 1.196065, 1, 1, 1, 1, 1,
1.854329, 0.8058372, 0.8645092, 1, 1, 1, 1, 1,
1.863474, -1.798181, 2.068341, 1, 1, 1, 1, 1,
1.869888, 1.107405, 0.6413159, 1, 1, 1, 1, 1,
1.881767, 0.3504423, 3.075037, 1, 1, 1, 1, 1,
1.938546, 0.2578583, 0.4419771, 1, 1, 1, 1, 1,
1.940939, -1.013489, 1.453349, 1, 1, 1, 1, 1,
1.983697, 0.2096068, 1.552912, 1, 1, 1, 1, 1,
2.003429, -0.02199871, 1.599714, 1, 1, 1, 1, 1,
2.004117, 1.405534, 1.822942, 1, 1, 1, 1, 1,
2.017167, -1.695398, 2.113806, 1, 1, 1, 1, 1,
2.03378, 0.1791793, 2.231768, 0, 0, 1, 1, 1,
2.045816, 0.1842601, 3.57895, 1, 0, 0, 1, 1,
2.049083, -0.5463182, 1.990194, 1, 0, 0, 1, 1,
2.099226, 0.5912409, 1.419268, 1, 0, 0, 1, 1,
2.126484, -0.007001421, 1.227156, 1, 0, 0, 1, 1,
2.139102, -0.4885948, 0.7666461, 1, 0, 0, 1, 1,
2.141256, 0.1409184, 1.346059, 0, 0, 0, 1, 1,
2.147085, -0.7697459, 3.964775, 0, 0, 0, 1, 1,
2.14983, -0.8052738, 3.394894, 0, 0, 0, 1, 1,
2.17303, -1.127678, 3.794111, 0, 0, 0, 1, 1,
2.284798, 0.1793861, -0.03473021, 0, 0, 0, 1, 1,
2.310096, -0.7086233, 1.162025, 0, 0, 0, 1, 1,
2.38798, 1.026795, 1.164728, 0, 0, 0, 1, 1,
2.394906, -0.2977887, 0.870946, 1, 1, 1, 1, 1,
2.39872, 2.371974, 0.4549307, 1, 1, 1, 1, 1,
2.518488, -2.599827, 2.269782, 1, 1, 1, 1, 1,
2.845494, -0.06738546, -0.2541729, 1, 1, 1, 1, 1,
2.916108, -0.6761506, 1.466283, 1, 1, 1, 1, 1,
2.963821, 0.5984433, 1.510041, 1, 1, 1, 1, 1,
3.006741, 0.7322944, 2.333454, 1, 1, 1, 1, 1
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
var radius = 9.556451;
var distance = 33.56663;
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
mvMatrix.translate( 0.06466246, 0.01374745, 0.5134516 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.56663);
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
