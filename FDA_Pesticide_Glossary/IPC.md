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
-3.263443, -0.5527717, -3.629057, 1, 0, 0, 1,
-3.258323, -0.7673554, -1.016781, 1, 0.007843138, 0, 1,
-3.156514, 0.1807815, -3.254055, 1, 0.01176471, 0, 1,
-2.98385, 0.02189708, -4.140974, 1, 0.01960784, 0, 1,
-2.763548, -1.743467, -2.880089, 1, 0.02352941, 0, 1,
-2.758946, 1.006053, 1.032883, 1, 0.03137255, 0, 1,
-2.650671, 0.3337277, -1.579389, 1, 0.03529412, 0, 1,
-2.637193, 0.3670729, -2.14375, 1, 0.04313726, 0, 1,
-2.575825, 0.04686773, -1.88961, 1, 0.04705882, 0, 1,
-2.445062, -0.8707733, -2.738441, 1, 0.05490196, 0, 1,
-2.414109, 1.230028, -1.730957, 1, 0.05882353, 0, 1,
-2.409454, -1.578801, -1.577513, 1, 0.06666667, 0, 1,
-2.408006, -0.7766507, -1.535446, 1, 0.07058824, 0, 1,
-2.375647, -0.9378493, -1.578246, 1, 0.07843138, 0, 1,
-2.233637, -0.9886955, -1.394636, 1, 0.08235294, 0, 1,
-2.22883, -0.07421238, -2.623529, 1, 0.09019608, 0, 1,
-2.186298, 0.9205207, -1.927285, 1, 0.09411765, 0, 1,
-2.175457, -0.04338346, -0.01495828, 1, 0.1019608, 0, 1,
-2.169428, -0.09659273, -3.041694, 1, 0.1098039, 0, 1,
-2.138116, 0.8537384, -2.36211, 1, 0.1137255, 0, 1,
-2.135267, 0.4990158, -0.5862239, 1, 0.1215686, 0, 1,
-2.125581, -1.828475, -2.785592, 1, 0.1254902, 0, 1,
-2.123839, -1.571497, -2.268743, 1, 0.1333333, 0, 1,
-2.119864, -1.607087, -2.384692, 1, 0.1372549, 0, 1,
-2.038638, -0.03742759, -1.982656, 1, 0.145098, 0, 1,
-2.030597, -0.2585966, -1.927308, 1, 0.1490196, 0, 1,
-2.024353, 0.3589498, -1.718906, 1, 0.1568628, 0, 1,
-1.972253, -0.1714114, -3.153365, 1, 0.1607843, 0, 1,
-1.95189, -2.237237, -2.500842, 1, 0.1686275, 0, 1,
-1.897466, 1.431899, -0.3875364, 1, 0.172549, 0, 1,
-1.875681, 0.3518319, 0.02447126, 1, 0.1803922, 0, 1,
-1.875239, -0.7552518, -2.660751, 1, 0.1843137, 0, 1,
-1.851203, -0.03807021, -0.6580749, 1, 0.1921569, 0, 1,
-1.842398, -0.9453782, -1.83071, 1, 0.1960784, 0, 1,
-1.841975, 1.285132, -0.2851608, 1, 0.2039216, 0, 1,
-1.835046, -0.1746295, -1.69166, 1, 0.2117647, 0, 1,
-1.809731, -1.048, -1.611619, 1, 0.2156863, 0, 1,
-1.803693, -0.492283, -1.706468, 1, 0.2235294, 0, 1,
-1.771054, -1.343859, -2.805012, 1, 0.227451, 0, 1,
-1.751718, 0.9632503, -1.738417, 1, 0.2352941, 0, 1,
-1.748345, 0.804639, -0.6978722, 1, 0.2392157, 0, 1,
-1.74236, 0.1708421, -2.756207, 1, 0.2470588, 0, 1,
-1.736369, -0.2050448, -2.315029, 1, 0.2509804, 0, 1,
-1.715918, 0.2908837, -2.28759, 1, 0.2588235, 0, 1,
-1.69171, -0.8199398, -1.616835, 1, 0.2627451, 0, 1,
-1.687884, 1.014552, -1.532791, 1, 0.2705882, 0, 1,
-1.675885, -0.4046817, -2.179852, 1, 0.2745098, 0, 1,
-1.670867, 1.020887, -0.3550371, 1, 0.282353, 0, 1,
-1.670245, -0.6359058, -3.150189, 1, 0.2862745, 0, 1,
-1.660925, 0.8774208, -1.786995, 1, 0.2941177, 0, 1,
-1.65274, -0.3427733, -1.247046, 1, 0.3019608, 0, 1,
-1.645511, -0.04671043, -0.7196811, 1, 0.3058824, 0, 1,
-1.64301, -1.864879, -1.868689, 1, 0.3137255, 0, 1,
-1.640032, 2.673244, -0.5329062, 1, 0.3176471, 0, 1,
-1.618273, -0.2678532, -0.8780575, 1, 0.3254902, 0, 1,
-1.614591, 1.569414, 1.206986, 1, 0.3294118, 0, 1,
-1.601175, 1.000505, 0.989091, 1, 0.3372549, 0, 1,
-1.574539, -0.3080895, -0.3141205, 1, 0.3411765, 0, 1,
-1.57002, -0.1721482, -1.920458, 1, 0.3490196, 0, 1,
-1.56613, -0.7192314, -3.150751, 1, 0.3529412, 0, 1,
-1.564723, 0.7052453, -2.447777, 1, 0.3607843, 0, 1,
-1.559058, -1.112875, -0.898907, 1, 0.3647059, 0, 1,
-1.55889, 0.01252344, -1.466225, 1, 0.372549, 0, 1,
-1.550754, -0.07899269, -1.481377, 1, 0.3764706, 0, 1,
-1.545529, 0.07892619, -2.033264, 1, 0.3843137, 0, 1,
-1.543215, 1.605685, -0.5221705, 1, 0.3882353, 0, 1,
-1.536394, 1.539257, -1.440195, 1, 0.3960784, 0, 1,
-1.531709, -1.651485, -3.798383, 1, 0.4039216, 0, 1,
-1.527001, 2.494238, -0.6060621, 1, 0.4078431, 0, 1,
-1.521007, -0.5369279, -2.201333, 1, 0.4156863, 0, 1,
-1.520163, -0.07967582, -1.97208, 1, 0.4196078, 0, 1,
-1.514171, 1.804057, -0.7743589, 1, 0.427451, 0, 1,
-1.50833, -0.6038412, -1.93912, 1, 0.4313726, 0, 1,
-1.501925, 1.866984, -0.6166057, 1, 0.4392157, 0, 1,
-1.468345, 0.2344866, -1.458088, 1, 0.4431373, 0, 1,
-1.463989, -0.6787229, -1.002693, 1, 0.4509804, 0, 1,
-1.452183, 0.1292428, -1.606136, 1, 0.454902, 0, 1,
-1.447976, 0.07022179, -2.080752, 1, 0.4627451, 0, 1,
-1.441501, -0.4147456, 0.7217006, 1, 0.4666667, 0, 1,
-1.436646, 0.1078516, -0.3139804, 1, 0.4745098, 0, 1,
-1.432219, 0.5454634, -1.48231, 1, 0.4784314, 0, 1,
-1.430345, -0.5940925, -0.1272036, 1, 0.4862745, 0, 1,
-1.410388, 0.2178233, -0.1049294, 1, 0.4901961, 0, 1,
-1.399112, 0.3781051, -4.188982, 1, 0.4980392, 0, 1,
-1.392675, 0.6548504, -2.092455, 1, 0.5058824, 0, 1,
-1.392111, -0.1675363, -2.524642, 1, 0.509804, 0, 1,
-1.391479, -1.172445, -2.891266, 1, 0.5176471, 0, 1,
-1.389385, 0.4205979, 0.7265249, 1, 0.5215687, 0, 1,
-1.377893, -0.04517815, -0.9851822, 1, 0.5294118, 0, 1,
-1.375861, -0.1641418, -1.254115, 1, 0.5333334, 0, 1,
-1.37581, -0.1012692, -0.4212704, 1, 0.5411765, 0, 1,
-1.374386, -1.029594, -2.398058, 1, 0.5450981, 0, 1,
-1.371482, -0.8213133, -2.029956, 1, 0.5529412, 0, 1,
-1.368385, 0.3849557, -0.2763491, 1, 0.5568628, 0, 1,
-1.368323, -0.7879106, -0.7516598, 1, 0.5647059, 0, 1,
-1.36219, 0.07450709, -2.300169, 1, 0.5686275, 0, 1,
-1.361893, 0.6810385, -0.3534744, 1, 0.5764706, 0, 1,
-1.360975, 1.374209, -1.623954, 1, 0.5803922, 0, 1,
-1.351066, 1.400406, -0.4383009, 1, 0.5882353, 0, 1,
-1.318218, -0.7195941, -3.50128, 1, 0.5921569, 0, 1,
-1.317294, -0.4004661, -1.982147, 1, 0.6, 0, 1,
-1.316318, -1.37559, -1.040265, 1, 0.6078432, 0, 1,
-1.30641, 1.552781, -1.381477, 1, 0.6117647, 0, 1,
-1.298495, 0.513311, 0.2299365, 1, 0.6196079, 0, 1,
-1.298197, 1.096182, -0.9364808, 1, 0.6235294, 0, 1,
-1.286601, -1.597555, -2.028298, 1, 0.6313726, 0, 1,
-1.269839, 0.01857432, -1.840719, 1, 0.6352941, 0, 1,
-1.267745, -1.417847, -1.834087, 1, 0.6431373, 0, 1,
-1.267587, 0.2425672, 0.2961786, 1, 0.6470588, 0, 1,
-1.259385, -0.5502126, -1.986794, 1, 0.654902, 0, 1,
-1.257148, -0.6583952, -2.168275, 1, 0.6588235, 0, 1,
-1.246157, 0.9187867, -1.444499, 1, 0.6666667, 0, 1,
-1.231483, -1.149632, -1.606114, 1, 0.6705883, 0, 1,
-1.222888, 0.1510665, -1.880752, 1, 0.6784314, 0, 1,
-1.215269, 0.4936684, 0.9660511, 1, 0.682353, 0, 1,
-1.20968, 0.2489548, -0.007211459, 1, 0.6901961, 0, 1,
-1.202835, -0.4005143, -2.470115, 1, 0.6941177, 0, 1,
-1.197306, 0.9104621, -1.043652, 1, 0.7019608, 0, 1,
-1.194511, -1.087949, -2.980032, 1, 0.7098039, 0, 1,
-1.187945, 0.7349017, -0.1302082, 1, 0.7137255, 0, 1,
-1.182454, 0.1045664, -2.356713, 1, 0.7215686, 0, 1,
-1.178727, -0.6632059, -3.067328, 1, 0.7254902, 0, 1,
-1.152096, 0.4460241, -2.202369, 1, 0.7333333, 0, 1,
-1.15199, 0.3534135, -2.495096, 1, 0.7372549, 0, 1,
-1.143132, -1.082958, -2.380837, 1, 0.7450981, 0, 1,
-1.140496, -1.327996, -4.754596, 1, 0.7490196, 0, 1,
-1.137846, 0.4753109, -1.365029, 1, 0.7568628, 0, 1,
-1.132586, -0.7779222, -2.621459, 1, 0.7607843, 0, 1,
-1.126746, 0.3369153, -2.346939, 1, 0.7686275, 0, 1,
-1.117849, 1.063347, 1.217775, 1, 0.772549, 0, 1,
-1.10346, -1.061241, -3.120566, 1, 0.7803922, 0, 1,
-1.0997, 0.0886941, -1.371206, 1, 0.7843137, 0, 1,
-1.096415, -0.7352518, -1.638396, 1, 0.7921569, 0, 1,
-1.095659, 0.9436622, -0.8066438, 1, 0.7960784, 0, 1,
-1.083219, -0.6452208, -1.905913, 1, 0.8039216, 0, 1,
-1.079377, 0.2976332, -3.252699, 1, 0.8117647, 0, 1,
-1.061018, 0.06051457, -2.003079, 1, 0.8156863, 0, 1,
-1.060384, -1.354994, -2.783884, 1, 0.8235294, 0, 1,
-1.056674, -1.408448, -3.088688, 1, 0.827451, 0, 1,
-1.041266, -0.4323294, -0.1941964, 1, 0.8352941, 0, 1,
-1.036475, -0.5337777, -3.897812, 1, 0.8392157, 0, 1,
-1.031854, 0.01722394, 0.5997385, 1, 0.8470588, 0, 1,
-1.028625, 1.349604, -0.8937844, 1, 0.8509804, 0, 1,
-1.024574, 0.7402983, -2.147539, 1, 0.8588235, 0, 1,
-1.024257, 1.749883, 0.2391646, 1, 0.8627451, 0, 1,
-1.022109, 1.33147, -0.9486427, 1, 0.8705882, 0, 1,
-1.020581, 1.755121, -0.9197597, 1, 0.8745098, 0, 1,
-1.018493, -0.7321951, -1.229523, 1, 0.8823529, 0, 1,
-0.9955822, -2.112128, -0.9683248, 1, 0.8862745, 0, 1,
-0.9899644, 0.1194574, -0.718247, 1, 0.8941177, 0, 1,
-0.9881935, 0.3531353, -1.190907, 1, 0.8980392, 0, 1,
-0.9870414, 0.09368797, -0.3450062, 1, 0.9058824, 0, 1,
-0.9824, -0.7868055, -3.696479, 1, 0.9137255, 0, 1,
-0.9814864, -1.36852, -2.341146, 1, 0.9176471, 0, 1,
-0.976855, 1.543907, -0.4419592, 1, 0.9254902, 0, 1,
-0.9682994, -1.198238, -2.8528, 1, 0.9294118, 0, 1,
-0.9624059, 1.315812, -1.151788, 1, 0.9372549, 0, 1,
-0.9623662, -1.003734, -2.966295, 1, 0.9411765, 0, 1,
-0.9617091, -0.858548, -2.417394, 1, 0.9490196, 0, 1,
-0.96, 1.346545, 0.4300241, 1, 0.9529412, 0, 1,
-0.955843, 0.1149947, -1.58866, 1, 0.9607843, 0, 1,
-0.9546846, 0.1804584, -2.094431, 1, 0.9647059, 0, 1,
-0.9546845, 0.3301779, -1.452371, 1, 0.972549, 0, 1,
-0.9521639, 0.4518165, 1.257047, 1, 0.9764706, 0, 1,
-0.9511336, -0.04242881, -1.01592, 1, 0.9843137, 0, 1,
-0.9431321, -1.02063, -3.697132, 1, 0.9882353, 0, 1,
-0.9417781, 0.1206368, -2.984921, 1, 0.9960784, 0, 1,
-0.9317448, -0.8168933, -2.433231, 0.9960784, 1, 0, 1,
-0.9316453, 0.9503745, -0.3671786, 0.9921569, 1, 0, 1,
-0.9306701, -2.001201, -2.608778, 0.9843137, 1, 0, 1,
-0.9229903, 1.037398, -0.6511809, 0.9803922, 1, 0, 1,
-0.9216819, 0.7494304, -0.4348858, 0.972549, 1, 0, 1,
-0.9096068, 1.780157, -1.557104, 0.9686275, 1, 0, 1,
-0.9042966, -0.04025586, -2.386815, 0.9607843, 1, 0, 1,
-0.902173, -0.8992892, -2.67328, 0.9568627, 1, 0, 1,
-0.8954218, 0.2296622, -1.34981, 0.9490196, 1, 0, 1,
-0.8897085, 0.005174614, -2.84608, 0.945098, 1, 0, 1,
-0.8896955, 0.3747819, -1.071818, 0.9372549, 1, 0, 1,
-0.8896582, -0.6765633, -4.508619, 0.9333333, 1, 0, 1,
-0.8746713, 0.1171456, -1.676363, 0.9254902, 1, 0, 1,
-0.8746567, -1.842138, -1.895032, 0.9215686, 1, 0, 1,
-0.8692043, 1.049117, -0.2441078, 0.9137255, 1, 0, 1,
-0.868357, -3.02167, -2.667475, 0.9098039, 1, 0, 1,
-0.8624324, 0.6928018, -0.4654098, 0.9019608, 1, 0, 1,
-0.8573857, -0.1815469, -2.702493, 0.8941177, 1, 0, 1,
-0.8548801, -0.4340678, -2.037441, 0.8901961, 1, 0, 1,
-0.8542899, -1.076999, -2.639516, 0.8823529, 1, 0, 1,
-0.8513073, -0.07264204, 0.01997438, 0.8784314, 1, 0, 1,
-0.8506197, -1.184536, -1.680551, 0.8705882, 1, 0, 1,
-0.8447831, 1.147636, -1.774586, 0.8666667, 1, 0, 1,
-0.8384182, 1.138412, -0.678145, 0.8588235, 1, 0, 1,
-0.8343139, 0.2424238, -0.3763951, 0.854902, 1, 0, 1,
-0.8215918, -0.9388453, -4.142374, 0.8470588, 1, 0, 1,
-0.8185803, -1.548775, -3.290747, 0.8431373, 1, 0, 1,
-0.8145711, 0.4623978, -0.7002125, 0.8352941, 1, 0, 1,
-0.8123903, -1.957715, -2.84811, 0.8313726, 1, 0, 1,
-0.8110017, 2.442034, 0.1676575, 0.8235294, 1, 0, 1,
-0.810214, 0.6921848, -2.573714, 0.8196079, 1, 0, 1,
-0.8058223, -0.073568, -1.163261, 0.8117647, 1, 0, 1,
-0.8043334, 0.2057756, 0.3747542, 0.8078431, 1, 0, 1,
-0.8035326, 0.6670735, -1.377899, 0.8, 1, 0, 1,
-0.7999415, -0.2384195, -0.6001325, 0.7921569, 1, 0, 1,
-0.7962824, -0.01473631, -0.8640654, 0.7882353, 1, 0, 1,
-0.7918307, 1.226084, -0.9415572, 0.7803922, 1, 0, 1,
-0.7895699, -0.2975863, -3.222318, 0.7764706, 1, 0, 1,
-0.7888144, -1.165742, -2.22786, 0.7686275, 1, 0, 1,
-0.7887711, 0.3345358, 0.3294632, 0.7647059, 1, 0, 1,
-0.7873564, 0.8565136, -1.831316, 0.7568628, 1, 0, 1,
-0.7843925, 0.7012212, -0.9161977, 0.7529412, 1, 0, 1,
-0.777828, -0.02362407, -0.6230748, 0.7450981, 1, 0, 1,
-0.7757803, 1.104479, -0.1838038, 0.7411765, 1, 0, 1,
-0.7734377, -0.8326359, -0.5749684, 0.7333333, 1, 0, 1,
-0.7732752, -0.2642027, -1.983356, 0.7294118, 1, 0, 1,
-0.7688944, 1.090728, -0.5530733, 0.7215686, 1, 0, 1,
-0.7652998, 0.1353292, -1.422588, 0.7176471, 1, 0, 1,
-0.7574996, -1.756617, -3.711668, 0.7098039, 1, 0, 1,
-0.7571705, 1.192081, -0.1827125, 0.7058824, 1, 0, 1,
-0.7562579, 0.07261509, -0.8179171, 0.6980392, 1, 0, 1,
-0.7560685, 1.221778, -0.6669453, 0.6901961, 1, 0, 1,
-0.7479939, 1.690933, 0.503974, 0.6862745, 1, 0, 1,
-0.7437885, 0.7456789, -2.779676, 0.6784314, 1, 0, 1,
-0.7416009, -1.298392, -2.962983, 0.6745098, 1, 0, 1,
-0.737803, 1.821749, 0.2791755, 0.6666667, 1, 0, 1,
-0.7366259, 0.4194828, -2.045494, 0.6627451, 1, 0, 1,
-0.7245726, 0.3404667, -2.907496, 0.654902, 1, 0, 1,
-0.7192934, 0.6440252, -1.351604, 0.6509804, 1, 0, 1,
-0.7189806, 0.7405691, -2.244846, 0.6431373, 1, 0, 1,
-0.7174208, 0.5293425, -2.502398, 0.6392157, 1, 0, 1,
-0.7164495, -0.2055649, -2.546904, 0.6313726, 1, 0, 1,
-0.7154307, -0.03580288, -1.863802, 0.627451, 1, 0, 1,
-0.7121621, -0.6837699, -4.107657, 0.6196079, 1, 0, 1,
-0.7094836, -0.6142188, -2.706782, 0.6156863, 1, 0, 1,
-0.7086151, 1.487711, -1.12487, 0.6078432, 1, 0, 1,
-0.6922624, -0.2874076, -2.52018, 0.6039216, 1, 0, 1,
-0.6885548, -1.077175, -3.19791, 0.5960785, 1, 0, 1,
-0.6880228, -0.2316779, -1.403501, 0.5882353, 1, 0, 1,
-0.6861856, 0.6550239, 1.055428, 0.5843138, 1, 0, 1,
-0.6794772, 0.2588567, -0.5306055, 0.5764706, 1, 0, 1,
-0.6792757, -0.4428116, -0.3804634, 0.572549, 1, 0, 1,
-0.6691036, 1.341396, -1.707358, 0.5647059, 1, 0, 1,
-0.6667767, 1.936822, -1.673223, 0.5607843, 1, 0, 1,
-0.6667579, 0.1243113, 0.003591526, 0.5529412, 1, 0, 1,
-0.66497, -0.8356326, -0.878868, 0.5490196, 1, 0, 1,
-0.6593162, 1.809946, -2.301598, 0.5411765, 1, 0, 1,
-0.6552638, 1.338645, -1.711855, 0.5372549, 1, 0, 1,
-0.650149, -0.08303542, -0.2787684, 0.5294118, 1, 0, 1,
-0.6404387, 0.1833122, -4.066453, 0.5254902, 1, 0, 1,
-0.6318663, 1.52434, -0.7174128, 0.5176471, 1, 0, 1,
-0.6282216, 0.7522257, -0.2139338, 0.5137255, 1, 0, 1,
-0.6252574, 1.130844, 0.108317, 0.5058824, 1, 0, 1,
-0.623257, 0.8398772, -1.657449, 0.5019608, 1, 0, 1,
-0.6196584, -1.597768, -3.509596, 0.4941176, 1, 0, 1,
-0.6153111, 0.1746247, -2.728351, 0.4862745, 1, 0, 1,
-0.6081208, 0.1480884, -0.08824298, 0.4823529, 1, 0, 1,
-0.6052068, -1.135281, -2.866985, 0.4745098, 1, 0, 1,
-0.6007794, -0.3172639, -1.623816, 0.4705882, 1, 0, 1,
-0.5993149, -1.418809, -4.422521, 0.4627451, 1, 0, 1,
-0.5985979, 0.1941672, -0.5543253, 0.4588235, 1, 0, 1,
-0.5927216, -0.5808623, -4.158935, 0.4509804, 1, 0, 1,
-0.5869346, -0.4117452, -2.461205, 0.4470588, 1, 0, 1,
-0.5840302, 0.954185, -1.505985, 0.4392157, 1, 0, 1,
-0.5795943, -0.1745949, -2.632378, 0.4352941, 1, 0, 1,
-0.579291, -0.2966017, -2.675048, 0.427451, 1, 0, 1,
-0.5762463, 0.3503025, -0.6236552, 0.4235294, 1, 0, 1,
-0.5758585, 0.4348309, -1.051137, 0.4156863, 1, 0, 1,
-0.5747221, -1.641224, -4.780701, 0.4117647, 1, 0, 1,
-0.5745408, 0.7142304, -0.2501608, 0.4039216, 1, 0, 1,
-0.573462, 0.4953981, -0.9276043, 0.3960784, 1, 0, 1,
-0.5596551, 2.193237, 0.6103012, 0.3921569, 1, 0, 1,
-0.535939, -0.3561733, -1.296113, 0.3843137, 1, 0, 1,
-0.5240905, 0.7476301, -0.2852894, 0.3803922, 1, 0, 1,
-0.5222334, -0.09251931, -0.5298509, 0.372549, 1, 0, 1,
-0.518297, -0.0799999, -0.8941981, 0.3686275, 1, 0, 1,
-0.516257, -0.8805685, -1.852095, 0.3607843, 1, 0, 1,
-0.5148307, 0.3163151, -1.094368, 0.3568628, 1, 0, 1,
-0.5117341, -0.9902378, -1.785049, 0.3490196, 1, 0, 1,
-0.509073, -0.05797681, -1.496865, 0.345098, 1, 0, 1,
-0.5070075, 0.4732728, 0.2351255, 0.3372549, 1, 0, 1,
-0.5058664, 1.314593, 0.2742948, 0.3333333, 1, 0, 1,
-0.5048542, -1.503971, -3.269065, 0.3254902, 1, 0, 1,
-0.5048295, 0.888756, -1.744921, 0.3215686, 1, 0, 1,
-0.5035247, 1.124241, 2.409415, 0.3137255, 1, 0, 1,
-0.499331, 0.5862978, -1.414912, 0.3098039, 1, 0, 1,
-0.498176, -0.1577411, -2.255488, 0.3019608, 1, 0, 1,
-0.4960261, -0.4283709, -1.55883, 0.2941177, 1, 0, 1,
-0.4903783, -0.04580415, -1.18573, 0.2901961, 1, 0, 1,
-0.4902793, 1.099174, -0.05230303, 0.282353, 1, 0, 1,
-0.4874326, 0.7725126, 1.295741, 0.2784314, 1, 0, 1,
-0.4862725, -0.460242, -2.918954, 0.2705882, 1, 0, 1,
-0.4843701, -0.4110286, -2.801659, 0.2666667, 1, 0, 1,
-0.4835552, 0.3425026, -0.8923441, 0.2588235, 1, 0, 1,
-0.4822707, 0.8266527, -0.5492057, 0.254902, 1, 0, 1,
-0.4793078, -0.1951842, 0.131382, 0.2470588, 1, 0, 1,
-0.4792858, -0.4747264, -2.658947, 0.2431373, 1, 0, 1,
-0.4719976, 0.07631163, -2.981879, 0.2352941, 1, 0, 1,
-0.4693896, -0.6535164, -0.489068, 0.2313726, 1, 0, 1,
-0.4688583, 0.6428929, -0.710816, 0.2235294, 1, 0, 1,
-0.4686407, -1.052689, -2.612033, 0.2196078, 1, 0, 1,
-0.4655822, 0.8659622, -0.6653274, 0.2117647, 1, 0, 1,
-0.4643668, -1.656581, -3.129695, 0.2078431, 1, 0, 1,
-0.464306, -0.3604012, -3.771571, 0.2, 1, 0, 1,
-0.4616221, -2.930719, -3.246087, 0.1921569, 1, 0, 1,
-0.4616068, -0.754814, -3.027068, 0.1882353, 1, 0, 1,
-0.4597597, -0.5934329, -4.863883, 0.1803922, 1, 0, 1,
-0.4522131, 0.421082, -1.187652, 0.1764706, 1, 0, 1,
-0.4470254, -0.6761647, -3.412188, 0.1686275, 1, 0, 1,
-0.4422034, -1.694539, -3.399452, 0.1647059, 1, 0, 1,
-0.4402786, 1.132815, -1.203015, 0.1568628, 1, 0, 1,
-0.4392199, 0.1746, -0.8156877, 0.1529412, 1, 0, 1,
-0.4382427, -0.9303923, -2.089782, 0.145098, 1, 0, 1,
-0.4371373, 1.859046, -0.6584136, 0.1411765, 1, 0, 1,
-0.4322214, -0.1461152, -1.873842, 0.1333333, 1, 0, 1,
-0.4280634, -1.183959, -2.711594, 0.1294118, 1, 0, 1,
-0.4275839, 0.9926506, -1.382833, 0.1215686, 1, 0, 1,
-0.4237583, -0.1654028, -2.762716, 0.1176471, 1, 0, 1,
-0.4221305, 0.2570648, -1.418885, 0.1098039, 1, 0, 1,
-0.4207435, 1.171839, 1.004899, 0.1058824, 1, 0, 1,
-0.418815, -0.02334396, -0.5461292, 0.09803922, 1, 0, 1,
-0.4164312, -1.360525, -3.425021, 0.09019608, 1, 0, 1,
-0.4157297, 0.7801958, -0.04881794, 0.08627451, 1, 0, 1,
-0.412564, -1.282292, -2.953276, 0.07843138, 1, 0, 1,
-0.4122843, 0.1300072, -1.146176, 0.07450981, 1, 0, 1,
-0.4104364, 0.4783409, 0.6620865, 0.06666667, 1, 0, 1,
-0.4046384, 0.06853387, -1.803662, 0.0627451, 1, 0, 1,
-0.4034775, 0.1252126, 0.6117494, 0.05490196, 1, 0, 1,
-0.4034324, -0.7177113, -0.7642209, 0.05098039, 1, 0, 1,
-0.3998017, -1.286753, -1.794271, 0.04313726, 1, 0, 1,
-0.3945914, 0.9728103, -0.1837987, 0.03921569, 1, 0, 1,
-0.3938334, 0.9583048, -1.050485, 0.03137255, 1, 0, 1,
-0.3902674, 0.6065271, 0.05576142, 0.02745098, 1, 0, 1,
-0.3850312, 0.7934379, -1.011889, 0.01960784, 1, 0, 1,
-0.3847438, -0.9933547, -3.698472, 0.01568628, 1, 0, 1,
-0.3800683, -2.235421, -1.277349, 0.007843138, 1, 0, 1,
-0.3795643, -0.8777539, -2.637975, 0.003921569, 1, 0, 1,
-0.3785432, -0.7416726, -1.601154, 0, 1, 0.003921569, 1,
-0.3683774, 0.1628081, -1.915273, 0, 1, 0.01176471, 1,
-0.3664371, 0.5420269, -0.3200919, 0, 1, 0.01568628, 1,
-0.3585351, -1.359813, -3.853428, 0, 1, 0.02352941, 1,
-0.3517494, -1.272838, -2.383568, 0, 1, 0.02745098, 1,
-0.3486843, -0.08825274, -2.653171, 0, 1, 0.03529412, 1,
-0.3482058, -1.830563, -4.306821, 0, 1, 0.03921569, 1,
-0.3473596, 0.3188172, -1.689064, 0, 1, 0.04705882, 1,
-0.3437553, 1.356494, 1.518444, 0, 1, 0.05098039, 1,
-0.3437453, -0.03380017, 0.8967226, 0, 1, 0.05882353, 1,
-0.3423587, 0.4727113, -0.9955014, 0, 1, 0.0627451, 1,
-0.3418259, -0.46557, -4.16179, 0, 1, 0.07058824, 1,
-0.3412144, 1.239129, -1.326463, 0, 1, 0.07450981, 1,
-0.3411935, 0.8790035, -1.152384, 0, 1, 0.08235294, 1,
-0.340745, 0.4491017, -0.9784912, 0, 1, 0.08627451, 1,
-0.3269179, -1.119624, -2.458498, 0, 1, 0.09411765, 1,
-0.3233421, 1.519438, -0.8074923, 0, 1, 0.1019608, 1,
-0.3203707, 0.2846575, -0.3890933, 0, 1, 0.1058824, 1,
-0.3199882, 0.3665525, -0.2563844, 0, 1, 0.1137255, 1,
-0.3196402, 0.4640874, -0.0685421, 0, 1, 0.1176471, 1,
-0.3195646, 0.3868622, 0.05878581, 0, 1, 0.1254902, 1,
-0.3191397, 0.08283965, -0.9444577, 0, 1, 0.1294118, 1,
-0.316794, -0.05203899, 1.427177, 0, 1, 0.1372549, 1,
-0.3149651, 1.176804, 0.4042696, 0, 1, 0.1411765, 1,
-0.3140646, -1.065844, -1.208562, 0, 1, 0.1490196, 1,
-0.3115189, -2.881526, -3.505868, 0, 1, 0.1529412, 1,
-0.3088312, -0.1709989, -1.978488, 0, 1, 0.1607843, 1,
-0.3083327, 0.1442781, -1.197911, 0, 1, 0.1647059, 1,
-0.3029501, 1.542396, 1.301482, 0, 1, 0.172549, 1,
-0.3029411, -0.3185821, -2.635057, 0, 1, 0.1764706, 1,
-0.3029255, -0.2530688, -3.935155, 0, 1, 0.1843137, 1,
-0.3003006, -1.531757, -1.687093, 0, 1, 0.1882353, 1,
-0.2998795, -0.2949167, -1.800378, 0, 1, 0.1960784, 1,
-0.2973126, -0.3781264, -2.086184, 0, 1, 0.2039216, 1,
-0.2942607, 0.1420965, -1.106944, 0, 1, 0.2078431, 1,
-0.29409, -1.079623, -2.627875, 0, 1, 0.2156863, 1,
-0.2927956, 0.4123191, -0.02804475, 0, 1, 0.2196078, 1,
-0.2854196, 1.048169, -1.42309, 0, 1, 0.227451, 1,
-0.2794764, -2.006906, -3.573683, 0, 1, 0.2313726, 1,
-0.2763357, 1.253482, -1.884867, 0, 1, 0.2392157, 1,
-0.2679472, 1.342548, 0.1481818, 0, 1, 0.2431373, 1,
-0.2660065, -1.445315, -2.715888, 0, 1, 0.2509804, 1,
-0.2654902, -0.05561389, -0.5533873, 0, 1, 0.254902, 1,
-0.2618293, 0.3085131, 0.485902, 0, 1, 0.2627451, 1,
-0.257435, 2.315026, -1.471517, 0, 1, 0.2666667, 1,
-0.2490458, -0.5286395, -3.222485, 0, 1, 0.2745098, 1,
-0.2466482, -0.04569398, -0.6179988, 0, 1, 0.2784314, 1,
-0.246582, 0.396313, -0.7689968, 0, 1, 0.2862745, 1,
-0.2447049, -0.03569998, -0.952718, 0, 1, 0.2901961, 1,
-0.2382216, -1.136687, -4.263388, 0, 1, 0.2980392, 1,
-0.2380678, -0.1603038, -1.688295, 0, 1, 0.3058824, 1,
-0.234619, 0.3001704, 0.09412634, 0, 1, 0.3098039, 1,
-0.2336641, -1.072405, -3.312526, 0, 1, 0.3176471, 1,
-0.233358, 2.204775, 0.9802365, 0, 1, 0.3215686, 1,
-0.230597, 0.5572132, -0.611961, 0, 1, 0.3294118, 1,
-0.2297897, 0.4004393, -1.329222, 0, 1, 0.3333333, 1,
-0.2297239, 0.5132964, -0.8052317, 0, 1, 0.3411765, 1,
-0.2261688, -1.428998, -3.550906, 0, 1, 0.345098, 1,
-0.2241924, 1.191095, -1.159564, 0, 1, 0.3529412, 1,
-0.2185237, -0.04596958, -1.676742, 0, 1, 0.3568628, 1,
-0.215656, -1.848291, -2.732645, 0, 1, 0.3647059, 1,
-0.2129815, -0.4193554, -3.193681, 0, 1, 0.3686275, 1,
-0.2095199, 1.444172, 0.4206356, 0, 1, 0.3764706, 1,
-0.2032756, -0.1546327, -2.161956, 0, 1, 0.3803922, 1,
-0.1996198, 1.527618, -0.1166235, 0, 1, 0.3882353, 1,
-0.1989327, 0.4627441, -1.462012, 0, 1, 0.3921569, 1,
-0.1987838, 0.8903123, -2.032331, 0, 1, 0.4, 1,
-0.1981706, 1.60733, -2.358379, 0, 1, 0.4078431, 1,
-0.192306, 1.896563, -0.4900244, 0, 1, 0.4117647, 1,
-0.1907658, 1.356574, 0.4398474, 0, 1, 0.4196078, 1,
-0.1823846, -0.4965369, -2.946694, 0, 1, 0.4235294, 1,
-0.1774125, -0.1171905, -2.405598, 0, 1, 0.4313726, 1,
-0.1761658, -0.03325287, -1.205754, 0, 1, 0.4352941, 1,
-0.1759441, 0.9762344, -0.2875424, 0, 1, 0.4431373, 1,
-0.1712965, -1.414816, -3.336174, 0, 1, 0.4470588, 1,
-0.1680164, -0.7089397, -2.396515, 0, 1, 0.454902, 1,
-0.1563426, -0.9844505, -3.214299, 0, 1, 0.4588235, 1,
-0.1562878, -0.4409445, -2.779643, 0, 1, 0.4666667, 1,
-0.1555929, 0.3477517, -1.153516, 0, 1, 0.4705882, 1,
-0.1545241, -1.678367, -2.229554, 0, 1, 0.4784314, 1,
-0.1525592, -0.3422478, -2.411587, 0, 1, 0.4823529, 1,
-0.1462307, 0.03980964, -1.735051, 0, 1, 0.4901961, 1,
-0.1460688, -0.6229253, -4.15832, 0, 1, 0.4941176, 1,
-0.143887, -0.8956404, -3.572938, 0, 1, 0.5019608, 1,
-0.1418189, -1.729408, -3.292008, 0, 1, 0.509804, 1,
-0.1417078, 1.527234, 2.223438, 0, 1, 0.5137255, 1,
-0.1402149, 0.2842959, -2.755163, 0, 1, 0.5215687, 1,
-0.1394356, 0.9938979, -2.279303, 0, 1, 0.5254902, 1,
-0.1357826, 0.5269001, -0.9396002, 0, 1, 0.5333334, 1,
-0.1344125, -0.7211077, -2.395776, 0, 1, 0.5372549, 1,
-0.1335597, -0.3489616, -2.214948, 0, 1, 0.5450981, 1,
-0.1318876, 0.04488647, -2.223879, 0, 1, 0.5490196, 1,
-0.127188, -0.8278025, -2.668184, 0, 1, 0.5568628, 1,
-0.1232847, -1.339646, -3.813456, 0, 1, 0.5607843, 1,
-0.1225853, 0.473552, 1.657858, 0, 1, 0.5686275, 1,
-0.1222391, -1.320276, -4.627366, 0, 1, 0.572549, 1,
-0.1206619, 0.08608799, -1.6778, 0, 1, 0.5803922, 1,
-0.1201829, -0.1245028, -2.379925, 0, 1, 0.5843138, 1,
-0.1183639, 0.6327045, -0.07946139, 0, 1, 0.5921569, 1,
-0.1181911, -1.355606, -1.900827, 0, 1, 0.5960785, 1,
-0.1138936, 0.6227705, -1.791094, 0, 1, 0.6039216, 1,
-0.1133841, -1.283499, -3.528234, 0, 1, 0.6117647, 1,
-0.1104473, -0.7554089, -2.800371, 0, 1, 0.6156863, 1,
-0.1023143, 1.36632, 0.4116231, 0, 1, 0.6235294, 1,
-0.1021521, 0.8938127, 0.9541475, 0, 1, 0.627451, 1,
-0.1010261, -0.2389838, -1.251271, 0, 1, 0.6352941, 1,
-0.09735203, -1.236463, -1.751447, 0, 1, 0.6392157, 1,
-0.09697734, -0.2812707, -2.573206, 0, 1, 0.6470588, 1,
-0.09655068, -0.5264669, -3.925379, 0, 1, 0.6509804, 1,
-0.08971382, -1.128542, -3.581244, 0, 1, 0.6588235, 1,
-0.08930096, 0.4802744, -1.455017, 0, 1, 0.6627451, 1,
-0.08877163, -0.1849027, -1.4783, 0, 1, 0.6705883, 1,
-0.08464498, 0.3212398, 0.9488131, 0, 1, 0.6745098, 1,
-0.07978167, 0.05601604, -0.08079212, 0, 1, 0.682353, 1,
-0.0784026, 0.7037693, -0.917698, 0, 1, 0.6862745, 1,
-0.07633453, -1.065848, -2.472151, 0, 1, 0.6941177, 1,
-0.07179523, -0.006992879, -2.007091, 0, 1, 0.7019608, 1,
-0.07108995, 0.7307763, -0.1024736, 0, 1, 0.7058824, 1,
-0.06908108, -0.256381, -3.04485, 0, 1, 0.7137255, 1,
-0.0686897, -0.4718015, -3.283549, 0, 1, 0.7176471, 1,
-0.06563442, 0.04176891, -0.8286077, 0, 1, 0.7254902, 1,
-0.06394812, 0.703284, 1.354647, 0, 1, 0.7294118, 1,
-0.06298117, -1.541607, -1.920392, 0, 1, 0.7372549, 1,
-0.06109635, -0.2993814, -3.69892, 0, 1, 0.7411765, 1,
-0.05971606, 0.3303272, -1.137926, 0, 1, 0.7490196, 1,
-0.05650013, 1.619461, -1.178084, 0, 1, 0.7529412, 1,
-0.05092242, -0.6346797, -4.930598, 0, 1, 0.7607843, 1,
-0.04879489, -1.936075, -4.87357, 0, 1, 0.7647059, 1,
-0.04862291, -0.9706283, -3.808165, 0, 1, 0.772549, 1,
-0.04763565, -0.1900849, -3.125219, 0, 1, 0.7764706, 1,
-0.04658368, 1.305656, 0.744784, 0, 1, 0.7843137, 1,
-0.04371447, 0.236837, 1.345802, 0, 1, 0.7882353, 1,
-0.04290098, 0.4172821, -0.4807017, 0, 1, 0.7960784, 1,
-0.04224546, -0.3351055, -4.501424, 0, 1, 0.8039216, 1,
-0.03566856, 0.2951104, -1.695964, 0, 1, 0.8078431, 1,
-0.03081358, 0.2192868, 0.5534807, 0, 1, 0.8156863, 1,
-0.03004822, 0.9089688, -1.807793, 0, 1, 0.8196079, 1,
-0.0291779, 0.196071, 1.289705, 0, 1, 0.827451, 1,
-0.02855125, -1.175703, -2.19347, 0, 1, 0.8313726, 1,
-0.01259215, 0.5181666, 0.3737378, 0, 1, 0.8392157, 1,
-0.01175202, -1.03407, -2.1812, 0, 1, 0.8431373, 1,
-0.01128142, -1.004689, -3.016432, 0, 1, 0.8509804, 1,
-0.008876882, -2.598226, -4.212256, 0, 1, 0.854902, 1,
-0.006215405, -0.06203345, -3.024848, 0, 1, 0.8627451, 1,
-0.004031677, -0.5568253, -4.061836, 0, 1, 0.8666667, 1,
-0.003669462, -0.3948361, -1.688495, 0, 1, 0.8745098, 1,
-0.0006731083, -0.7508741, -3.630522, 0, 1, 0.8784314, 1,
0.00252302, 0.8307177, 0.02788891, 0, 1, 0.8862745, 1,
0.004402207, -0.1529005, 3.163642, 0, 1, 0.8901961, 1,
0.006190046, 1.202632, 0.4679117, 0, 1, 0.8980392, 1,
0.007951766, -0.3765374, 2.594377, 0, 1, 0.9058824, 1,
0.01102223, -1.939655, 4.631346, 0, 1, 0.9098039, 1,
0.0143502, -0.9513581, 2.296391, 0, 1, 0.9176471, 1,
0.02758217, 0.6237658, 1.170092, 0, 1, 0.9215686, 1,
0.02823595, -1.442503, 3.639042, 0, 1, 0.9294118, 1,
0.03039329, -0.9870635, 4.329192, 0, 1, 0.9333333, 1,
0.03293128, -0.09504366, 2.393614, 0, 1, 0.9411765, 1,
0.03482121, 1.405063, 0.5865885, 0, 1, 0.945098, 1,
0.03735337, -0.3128274, 3.283725, 0, 1, 0.9529412, 1,
0.04003073, 1.60003, -0.5136488, 0, 1, 0.9568627, 1,
0.04054434, 0.2303398, -1.317136, 0, 1, 0.9647059, 1,
0.04406896, -0.9142075, 4.462419, 0, 1, 0.9686275, 1,
0.04425199, -0.6618699, 2.449001, 0, 1, 0.9764706, 1,
0.04463537, -0.6988568, 3.554971, 0, 1, 0.9803922, 1,
0.04549482, 0.4465645, -0.2174461, 0, 1, 0.9882353, 1,
0.04551522, -1.807346, 2.555095, 0, 1, 0.9921569, 1,
0.04615542, 0.6942402, -0.4168284, 0, 1, 1, 1,
0.04743273, 0.2431816, -1.230809, 0, 0.9921569, 1, 1,
0.0490121, 0.1782146, 0.4010222, 0, 0.9882353, 1, 1,
0.05176918, 2.085722, -1.010797, 0, 0.9803922, 1, 1,
0.05348631, -0.7401359, 1.513818, 0, 0.9764706, 1, 1,
0.05873926, -1.552303, 4.251538, 0, 0.9686275, 1, 1,
0.05934509, -0.499368, 2.755126, 0, 0.9647059, 1, 1,
0.06145457, 0.7777088, 0.8577756, 0, 0.9568627, 1, 1,
0.06289992, 2.246094, -0.2350833, 0, 0.9529412, 1, 1,
0.06322532, 0.9106142, 1.41752, 0, 0.945098, 1, 1,
0.06424004, 0.2512546, -0.2357408, 0, 0.9411765, 1, 1,
0.07229213, 0.3890903, -1.385155, 0, 0.9333333, 1, 1,
0.0730815, 0.873704, -1.010454, 0, 0.9294118, 1, 1,
0.07474273, 1.060789, 2.632007, 0, 0.9215686, 1, 1,
0.07488689, 0.8272528, -1.008866, 0, 0.9176471, 1, 1,
0.07622633, 1.866164, -1.6983, 0, 0.9098039, 1, 1,
0.07738712, -0.6232632, 3.532385, 0, 0.9058824, 1, 1,
0.07917796, 0.1556489, 0.8727794, 0, 0.8980392, 1, 1,
0.08208989, -0.5958526, 4.002588, 0, 0.8901961, 1, 1,
0.08446746, 0.413379, -0.0535208, 0, 0.8862745, 1, 1,
0.08460852, -0.2449039, 1.001166, 0, 0.8784314, 1, 1,
0.08835252, -1.382063, 1.985034, 0, 0.8745098, 1, 1,
0.09045018, -1.216801, 2.912791, 0, 0.8666667, 1, 1,
0.1045746, 0.1382722, 1.377253, 0, 0.8627451, 1, 1,
0.1046303, -0.1817086, 2.651588, 0, 0.854902, 1, 1,
0.1061877, -0.9817012, 2.536632, 0, 0.8509804, 1, 1,
0.1073206, 2.112615, -1.359311, 0, 0.8431373, 1, 1,
0.1080537, 2.535443, 0.9953602, 0, 0.8392157, 1, 1,
0.1094308, -0.9261423, 3.550051, 0, 0.8313726, 1, 1,
0.1104655, 0.7006262, 0.770849, 0, 0.827451, 1, 1,
0.1108575, -0.6478986, 2.832721, 0, 0.8196079, 1, 1,
0.1184649, 0.432515, -1.205983, 0, 0.8156863, 1, 1,
0.1278273, -0.8490493, 6.013443, 0, 0.8078431, 1, 1,
0.1288073, 0.5033284, 0.7972796, 0, 0.8039216, 1, 1,
0.1301811, 0.7209495, -0.5408837, 0, 0.7960784, 1, 1,
0.132856, 0.7293995, -0.5999704, 0, 0.7882353, 1, 1,
0.1337295, -0.1624896, 2.101114, 0, 0.7843137, 1, 1,
0.1343742, -0.8405852, 2.465592, 0, 0.7764706, 1, 1,
0.1353501, 0.1242701, -0.5103724, 0, 0.772549, 1, 1,
0.1373984, 1.361512, -0.4640508, 0, 0.7647059, 1, 1,
0.1406183, -0.1611115, 0.5932826, 0, 0.7607843, 1, 1,
0.1442558, -0.3542787, 2.539857, 0, 0.7529412, 1, 1,
0.1466806, 0.239826, -0.7388799, 0, 0.7490196, 1, 1,
0.1493372, -0.4387246, 2.097696, 0, 0.7411765, 1, 1,
0.1504318, -0.001101952, 1.405244, 0, 0.7372549, 1, 1,
0.1526914, -0.3203171, 2.936168, 0, 0.7294118, 1, 1,
0.1533912, 0.3114359, -0.5222158, 0, 0.7254902, 1, 1,
0.1534247, -0.2312305, 0.9183978, 0, 0.7176471, 1, 1,
0.1547724, 0.9090576, 0.9243988, 0, 0.7137255, 1, 1,
0.1561831, -0.3059624, 2.328061, 0, 0.7058824, 1, 1,
0.1584865, 0.3755691, -0.0212159, 0, 0.6980392, 1, 1,
0.16054, -2.298527, 2.134214, 0, 0.6941177, 1, 1,
0.1607399, 0.2118936, -0.232528, 0, 0.6862745, 1, 1,
0.1614338, -1.277857, 3.761971, 0, 0.682353, 1, 1,
0.1640058, -0.5556498, 3.927914, 0, 0.6745098, 1, 1,
0.1666904, -2.501925, 2.575058, 0, 0.6705883, 1, 1,
0.1714995, -1.470451, 2.836432, 0, 0.6627451, 1, 1,
0.1735736, 0.3459834, 1.036103, 0, 0.6588235, 1, 1,
0.1763253, 0.7632791, 0.798393, 0, 0.6509804, 1, 1,
0.1787731, 1.589351, 0.1542321, 0, 0.6470588, 1, 1,
0.1803195, -0.415186, 4.112207, 0, 0.6392157, 1, 1,
0.1814203, -2.611962, 3.490857, 0, 0.6352941, 1, 1,
0.1823481, -1.708959, 2.561955, 0, 0.627451, 1, 1,
0.189831, -0.3955587, -0.2706114, 0, 0.6235294, 1, 1,
0.1905719, -0.5377508, 2.743951, 0, 0.6156863, 1, 1,
0.1996303, 1.390155, 0.3371263, 0, 0.6117647, 1, 1,
0.2003734, -0.600357, 2.978081, 0, 0.6039216, 1, 1,
0.2004368, 1.98165, 1.108647, 0, 0.5960785, 1, 1,
0.2050811, -1.033516, 2.199298, 0, 0.5921569, 1, 1,
0.2071623, 0.3556494, 0.3466969, 0, 0.5843138, 1, 1,
0.2094467, 0.1436254, 0.2127719, 0, 0.5803922, 1, 1,
0.2094478, 2.014766, 0.4313912, 0, 0.572549, 1, 1,
0.2107272, 0.5888503, 2.413826, 0, 0.5686275, 1, 1,
0.2123728, -1.717273, 3.047001, 0, 0.5607843, 1, 1,
0.2124095, 0.8824015, -0.9263274, 0, 0.5568628, 1, 1,
0.2128596, -0.08514787, 0.8996763, 0, 0.5490196, 1, 1,
0.2131643, 1.081731, -0.1695231, 0, 0.5450981, 1, 1,
0.2144204, 1.415894, 0.09560072, 0, 0.5372549, 1, 1,
0.2219514, 0.9879429, 1.239679, 0, 0.5333334, 1, 1,
0.2243669, 1.075235, -0.5542154, 0, 0.5254902, 1, 1,
0.2243899, -0.8084952, 3.050404, 0, 0.5215687, 1, 1,
0.2249547, 0.4864278, -0.4195626, 0, 0.5137255, 1, 1,
0.2267298, -1.669285, 2.093811, 0, 0.509804, 1, 1,
0.2295964, 0.06729918, 1.709566, 0, 0.5019608, 1, 1,
0.2320041, 1.148994, -0.4963647, 0, 0.4941176, 1, 1,
0.2348827, -0.6427441, 3.742572, 0, 0.4901961, 1, 1,
0.2351639, 0.5904668, 0.832494, 0, 0.4823529, 1, 1,
0.2366462, -1.771294, 4.080839, 0, 0.4784314, 1, 1,
0.2368035, -0.369233, 0.5740047, 0, 0.4705882, 1, 1,
0.2381097, 0.7312451, -0.4001917, 0, 0.4666667, 1, 1,
0.2398311, 0.913224, -0.3762562, 0, 0.4588235, 1, 1,
0.239949, -0.08857886, 0.8388103, 0, 0.454902, 1, 1,
0.2487364, 1.0899, -0.6808178, 0, 0.4470588, 1, 1,
0.2516312, -1.464026, 3.437828, 0, 0.4431373, 1, 1,
0.2521854, -1.715857, 2.060272, 0, 0.4352941, 1, 1,
0.2545155, -0.4525971, 1.424039, 0, 0.4313726, 1, 1,
0.2558957, 1.300039, 2.300114, 0, 0.4235294, 1, 1,
0.25808, -1.935984, 3.779339, 0, 0.4196078, 1, 1,
0.2598612, -1.963708, 2.762128, 0, 0.4117647, 1, 1,
0.265119, 0.3745258, -0.6638686, 0, 0.4078431, 1, 1,
0.2651985, 1.59888, 1.447971, 0, 0.4, 1, 1,
0.2665785, 2.369506, -0.3900784, 0, 0.3921569, 1, 1,
0.2669632, -0.09110171, 2.39013, 0, 0.3882353, 1, 1,
0.2688244, 0.8690848, 0.6191721, 0, 0.3803922, 1, 1,
0.2694798, -1.365107, 3.405717, 0, 0.3764706, 1, 1,
0.2698991, -0.0876684, 3.088205, 0, 0.3686275, 1, 1,
0.2719734, -0.3538426, 0.3349076, 0, 0.3647059, 1, 1,
0.2744352, 0.3829956, 1.438342, 0, 0.3568628, 1, 1,
0.2787109, -0.6675954, 1.305731, 0, 0.3529412, 1, 1,
0.287356, 1.148423, 1.057758, 0, 0.345098, 1, 1,
0.288779, -0.671037, 2.794357, 0, 0.3411765, 1, 1,
0.3016414, 0.7773016, 1.354823, 0, 0.3333333, 1, 1,
0.3030479, -0.4123405, 3.465971, 0, 0.3294118, 1, 1,
0.3056918, 0.2391383, 1.388263, 0, 0.3215686, 1, 1,
0.3064462, 0.8318687, 0.3715933, 0, 0.3176471, 1, 1,
0.3084852, 1.378107, 0.9076611, 0, 0.3098039, 1, 1,
0.3096493, 1.174937, -0.6986783, 0, 0.3058824, 1, 1,
0.3107555, -1.812416, 3.367949, 0, 0.2980392, 1, 1,
0.3157829, -0.03960203, 2.248318, 0, 0.2901961, 1, 1,
0.3165136, -0.2080126, 0.1667963, 0, 0.2862745, 1, 1,
0.3191152, 1.834561, 0.1031997, 0, 0.2784314, 1, 1,
0.3230898, 1.112675, 0.5325162, 0, 0.2745098, 1, 1,
0.3236882, 0.5192231, 1.161388, 0, 0.2666667, 1, 1,
0.3245872, -0.382489, 2.397689, 0, 0.2627451, 1, 1,
0.3271788, -0.5314671, 4.136075, 0, 0.254902, 1, 1,
0.3320454, 0.005848389, 2.570041, 0, 0.2509804, 1, 1,
0.3320937, -1.564947, 4.424823, 0, 0.2431373, 1, 1,
0.334815, 0.6308421, 0.118746, 0, 0.2392157, 1, 1,
0.3399571, -0.372082, 3.808262, 0, 0.2313726, 1, 1,
0.341296, -0.506391, 1.462434, 0, 0.227451, 1, 1,
0.3423607, 1.585795, -0.02680586, 0, 0.2196078, 1, 1,
0.3430031, -0.06677818, 1.833418, 0, 0.2156863, 1, 1,
0.3432434, 1.53146, 0.372221, 0, 0.2078431, 1, 1,
0.34664, -0.2069362, -0.162616, 0, 0.2039216, 1, 1,
0.3510722, 0.9684115, 0.9242683, 0, 0.1960784, 1, 1,
0.3519273, 1.733514, 1.221568, 0, 0.1882353, 1, 1,
0.356189, 1.870091, 0.7325537, 0, 0.1843137, 1, 1,
0.3593497, 0.4237212, 0.4495888, 0, 0.1764706, 1, 1,
0.3652371, 0.2701096, -0.2896347, 0, 0.172549, 1, 1,
0.3679529, -0.0275769, 0.584915, 0, 0.1647059, 1, 1,
0.3747689, -0.3687485, 2.425485, 0, 0.1607843, 1, 1,
0.376385, 0.1794406, 0.9174691, 0, 0.1529412, 1, 1,
0.3772452, -0.213211, 2.130756, 0, 0.1490196, 1, 1,
0.3774877, -0.0451609, 2.252555, 0, 0.1411765, 1, 1,
0.3806741, 0.2398195, 1.834953, 0, 0.1372549, 1, 1,
0.3816335, -0.1748953, 2.071041, 0, 0.1294118, 1, 1,
0.3818432, -0.142569, 1.144668, 0, 0.1254902, 1, 1,
0.3857778, 1.96946, -0.5410184, 0, 0.1176471, 1, 1,
0.3874992, -1.885405, 3.181603, 0, 0.1137255, 1, 1,
0.3893554, 0.8260405, 1.11978, 0, 0.1058824, 1, 1,
0.3918416, -1.149755, 2.169819, 0, 0.09803922, 1, 1,
0.3921807, 0.7183523, -0.7782137, 0, 0.09411765, 1, 1,
0.4027664, -2.247966, 2.149374, 0, 0.08627451, 1, 1,
0.4043339, 1.773346, -1.240463, 0, 0.08235294, 1, 1,
0.409327, -0.4543251, 2.323283, 0, 0.07450981, 1, 1,
0.4101872, -0.78824, 2.802462, 0, 0.07058824, 1, 1,
0.4106405, -0.3470624, 2.860555, 0, 0.0627451, 1, 1,
0.4130708, 0.2422048, 1.331707, 0, 0.05882353, 1, 1,
0.4148079, 0.3094445, 0.389064, 0, 0.05098039, 1, 1,
0.4158745, -0.02126236, 1.805529, 0, 0.04705882, 1, 1,
0.4161331, 0.6437511, 0.4639024, 0, 0.03921569, 1, 1,
0.4170673, 1.104018, 0.1911517, 0, 0.03529412, 1, 1,
0.4210908, 0.3309141, 0.9503968, 0, 0.02745098, 1, 1,
0.4295271, -1.227289, 2.419982, 0, 0.02352941, 1, 1,
0.4328458, -0.003584289, 0.8739398, 0, 0.01568628, 1, 1,
0.4336211, 1.262829, -0.02590952, 0, 0.01176471, 1, 1,
0.4352134, 0.3413833, 3.128544, 0, 0.003921569, 1, 1,
0.4392347, -1.186907, 1.029905, 0.003921569, 0, 1, 1,
0.4462858, 1.461408, -2.1918, 0.007843138, 0, 1, 1,
0.4480269, -0.2010924, -0.2771583, 0.01568628, 0, 1, 1,
0.4504174, 1.175379, 2.276638, 0.01960784, 0, 1, 1,
0.4560057, -0.9631304, 3.767751, 0.02745098, 0, 1, 1,
0.4580095, -0.6034849, 2.820185, 0.03137255, 0, 1, 1,
0.4584168, -1.241588, 2.588132, 0.03921569, 0, 1, 1,
0.463706, -0.1384531, 3.301051, 0.04313726, 0, 1, 1,
0.4641634, 1.269908, -0.2062717, 0.05098039, 0, 1, 1,
0.4730228, -0.706814, 2.090635, 0.05490196, 0, 1, 1,
0.4735702, -0.5114318, 0.8114747, 0.0627451, 0, 1, 1,
0.4759621, 0.26454, 0.7650178, 0.06666667, 0, 1, 1,
0.4781519, 0.5569045, 1.619848, 0.07450981, 0, 1, 1,
0.4785122, -1.19131, 2.056118, 0.07843138, 0, 1, 1,
0.4796601, -1.485624, 1.770159, 0.08627451, 0, 1, 1,
0.4804786, -2.8547, 5.047398, 0.09019608, 0, 1, 1,
0.4820529, -0.8799461, 4.385868, 0.09803922, 0, 1, 1,
0.4830322, 0.9914829, 0.2342225, 0.1058824, 0, 1, 1,
0.4863595, -0.2582293, 3.670973, 0.1098039, 0, 1, 1,
0.4904724, 0.5797706, 0.3738863, 0.1176471, 0, 1, 1,
0.4932527, 0.001681429, -0.173039, 0.1215686, 0, 1, 1,
0.4937639, 0.3634301, 0.9453769, 0.1294118, 0, 1, 1,
0.4960512, 2.920665, 0.1371458, 0.1333333, 0, 1, 1,
0.501919, 0.5454007, 2.464997, 0.1411765, 0, 1, 1,
0.505859, 0.7876523, 0.236658, 0.145098, 0, 1, 1,
0.5082185, -0.2973215, 2.845397, 0.1529412, 0, 1, 1,
0.5088162, -1.35279, 1.311214, 0.1568628, 0, 1, 1,
0.5121424, -0.7623341, 1.684895, 0.1647059, 0, 1, 1,
0.5123457, -0.8548456, 2.098699, 0.1686275, 0, 1, 1,
0.5135018, 0.06989032, 1.102392, 0.1764706, 0, 1, 1,
0.51499, -1.137131, 3.607105, 0.1803922, 0, 1, 1,
0.5150412, 0.4291102, 0.02202415, 0.1882353, 0, 1, 1,
0.5156469, -1.261282, 0.551801, 0.1921569, 0, 1, 1,
0.5221831, 0.5097219, 1.029052, 0.2, 0, 1, 1,
0.5222682, -1.09633, 0.8613642, 0.2078431, 0, 1, 1,
0.5275491, 0.5550673, -0.07999423, 0.2117647, 0, 1, 1,
0.5280857, 0.4613619, 1.361359, 0.2196078, 0, 1, 1,
0.5319003, 2.146781, 0.5996758, 0.2235294, 0, 1, 1,
0.5347313, -1.170142, 2.462015, 0.2313726, 0, 1, 1,
0.5402312, 1.345504, 0.4957684, 0.2352941, 0, 1, 1,
0.5455828, -0.1091614, 2.293472, 0.2431373, 0, 1, 1,
0.5474256, 0.5252053, 0.8362032, 0.2470588, 0, 1, 1,
0.5500814, -0.09101021, 2.721791, 0.254902, 0, 1, 1,
0.5513243, 1.807002, -1.007435, 0.2588235, 0, 1, 1,
0.5538198, 0.8873366, -0.486285, 0.2666667, 0, 1, 1,
0.5543129, 0.1348908, 0.1129735, 0.2705882, 0, 1, 1,
0.5617602, -0.009252308, 1.263592, 0.2784314, 0, 1, 1,
0.5621936, 0.4288483, 1.574031, 0.282353, 0, 1, 1,
0.5668054, 1.287005, 0.510362, 0.2901961, 0, 1, 1,
0.568512, -0.9921784, 1.850159, 0.2941177, 0, 1, 1,
0.5692299, 1.137184, -0.1280686, 0.3019608, 0, 1, 1,
0.5707473, -0.105467, 2.696927, 0.3098039, 0, 1, 1,
0.5746935, -0.410256, 1.655592, 0.3137255, 0, 1, 1,
0.5880606, 0.669206, 0.551208, 0.3215686, 0, 1, 1,
0.590657, 0.09999757, 1.988194, 0.3254902, 0, 1, 1,
0.597464, -1.008693, 1.852804, 0.3333333, 0, 1, 1,
0.6002092, -0.4569767, 2.802465, 0.3372549, 0, 1, 1,
0.6003477, 0.5838902, 1.851326, 0.345098, 0, 1, 1,
0.6015393, -0.6359707, 3.468617, 0.3490196, 0, 1, 1,
0.6055469, -1.687484, 0.8189667, 0.3568628, 0, 1, 1,
0.6071084, 1.245204, 1.680609, 0.3607843, 0, 1, 1,
0.6088096, 0.8197278, 1.371136, 0.3686275, 0, 1, 1,
0.6095958, -0.1117649, 1.280503, 0.372549, 0, 1, 1,
0.6099558, -0.7629898, 3.275304, 0.3803922, 0, 1, 1,
0.6160427, -2.449371, 4.183323, 0.3843137, 0, 1, 1,
0.617175, 1.640608, 0.9167051, 0.3921569, 0, 1, 1,
0.6184208, -0.3431997, 2.945581, 0.3960784, 0, 1, 1,
0.6185961, -0.648023, 3.055579, 0.4039216, 0, 1, 1,
0.6255525, 0.8818786, 0.5999998, 0.4117647, 0, 1, 1,
0.6257278, 1.198162, -0.04196424, 0.4156863, 0, 1, 1,
0.6264564, -1.745875, 2.72312, 0.4235294, 0, 1, 1,
0.6284521, 0.3812716, -1.771269, 0.427451, 0, 1, 1,
0.6333339, 0.9987357, -0.3030949, 0.4352941, 0, 1, 1,
0.6367285, -0.07541237, 1.876233, 0.4392157, 0, 1, 1,
0.6371214, 1.701584, -1.304659, 0.4470588, 0, 1, 1,
0.6385303, -0.9331025, 2.874366, 0.4509804, 0, 1, 1,
0.6394306, -0.2127278, 1.961688, 0.4588235, 0, 1, 1,
0.6401706, -3.076585, 2.507843, 0.4627451, 0, 1, 1,
0.6423384, -0.6061797, 2.077047, 0.4705882, 0, 1, 1,
0.6437633, -0.3948866, 3.478389, 0.4745098, 0, 1, 1,
0.6482286, 0.5138391, 1.501385, 0.4823529, 0, 1, 1,
0.6531709, -0.1561703, 0.40159, 0.4862745, 0, 1, 1,
0.6564732, -0.304078, -0.4456803, 0.4941176, 0, 1, 1,
0.6577464, 0.3179063, 1.926715, 0.5019608, 0, 1, 1,
0.660167, 1.819061, -0.471991, 0.5058824, 0, 1, 1,
0.6641017, 0.8659741, 0.3296019, 0.5137255, 0, 1, 1,
0.6685085, -0.4467777, 0.5366337, 0.5176471, 0, 1, 1,
0.6725311, 1.250953, 1.218476, 0.5254902, 0, 1, 1,
0.6810263, -0.1351434, 0.5126987, 0.5294118, 0, 1, 1,
0.6821713, -1.955856, 3.320993, 0.5372549, 0, 1, 1,
0.6888738, 1.293179, -0.6185313, 0.5411765, 0, 1, 1,
0.6935012, -0.3720317, 2.272067, 0.5490196, 0, 1, 1,
0.6985487, -1.137868, 1.427258, 0.5529412, 0, 1, 1,
0.7008682, -0.1790539, 2.009174, 0.5607843, 0, 1, 1,
0.7017028, 1.168926, 1.234867, 0.5647059, 0, 1, 1,
0.7127976, 0.2000848, 2.497243, 0.572549, 0, 1, 1,
0.733277, 0.7558424, 1.863392, 0.5764706, 0, 1, 1,
0.7337883, 2.314174, -0.1537513, 0.5843138, 0, 1, 1,
0.7353179, -0.09673547, 0.200954, 0.5882353, 0, 1, 1,
0.7428803, 0.1794511, 1.240046, 0.5960785, 0, 1, 1,
0.7431214, -0.7387388, 4.385136, 0.6039216, 0, 1, 1,
0.7460426, 0.1284807, 2.331334, 0.6078432, 0, 1, 1,
0.7467254, 1.240548, -0.3513665, 0.6156863, 0, 1, 1,
0.7524493, 0.6651326, 2.477458, 0.6196079, 0, 1, 1,
0.7594141, 1.631006, 0.0568412, 0.627451, 0, 1, 1,
0.7646183, -0.3054581, 1.193528, 0.6313726, 0, 1, 1,
0.7673265, 0.44344, -0.04407657, 0.6392157, 0, 1, 1,
0.7723616, -0.02245882, 3.18834, 0.6431373, 0, 1, 1,
0.7744016, 0.8059675, 2.20594, 0.6509804, 0, 1, 1,
0.7784589, 0.7817348, 0.5999541, 0.654902, 0, 1, 1,
0.785477, 0.006270512, 0.8709053, 0.6627451, 0, 1, 1,
0.7887664, -0.1714827, 2.813369, 0.6666667, 0, 1, 1,
0.7940879, 0.800718, 0.1824328, 0.6745098, 0, 1, 1,
0.7941139, -0.6780542, 2.860846, 0.6784314, 0, 1, 1,
0.7951368, 0.8967331, 1.666533, 0.6862745, 0, 1, 1,
0.802703, 0.5834323, -0.2419478, 0.6901961, 0, 1, 1,
0.8043298, 0.9348237, 1.544256, 0.6980392, 0, 1, 1,
0.8060539, -0.3372509, 2.218572, 0.7058824, 0, 1, 1,
0.8068528, -0.07989004, 1.815635, 0.7098039, 0, 1, 1,
0.8072848, 1.164317, 1.152129, 0.7176471, 0, 1, 1,
0.8083603, -0.3793289, 0.8919537, 0.7215686, 0, 1, 1,
0.8104547, -0.4910727, 0.9876768, 0.7294118, 0, 1, 1,
0.8193004, -0.2950332, 2.381756, 0.7333333, 0, 1, 1,
0.8193656, -0.06021362, 1.222897, 0.7411765, 0, 1, 1,
0.820336, 0.4949006, -0.3100107, 0.7450981, 0, 1, 1,
0.8265589, 0.4012404, 1.417516, 0.7529412, 0, 1, 1,
0.8271133, -0.715472, 3.630727, 0.7568628, 0, 1, 1,
0.8286573, 0.290904, 0.6455685, 0.7647059, 0, 1, 1,
0.8369297, 0.2073976, 0.05663573, 0.7686275, 0, 1, 1,
0.8420444, 0.8736276, 1.611048, 0.7764706, 0, 1, 1,
0.8429573, 0.6501526, 1.46596, 0.7803922, 0, 1, 1,
0.8436982, 0.5805962, 1.982687, 0.7882353, 0, 1, 1,
0.8484169, 1.628999, 0.5976764, 0.7921569, 0, 1, 1,
0.8487105, 1.530292, 2.241617, 0.8, 0, 1, 1,
0.8567817, -0.04556505, 0.2171797, 0.8078431, 0, 1, 1,
0.8651479, 1.759687, -1.565551, 0.8117647, 0, 1, 1,
0.8686423, 0.8829018, -0.0806384, 0.8196079, 0, 1, 1,
0.8714202, -0.4004407, 2.387036, 0.8235294, 0, 1, 1,
0.8746177, -2.115521, 1.606115, 0.8313726, 0, 1, 1,
0.8904754, -1.024098, 2.518795, 0.8352941, 0, 1, 1,
0.8909066, -0.3785993, 2.693049, 0.8431373, 0, 1, 1,
0.8969827, -2.06573, 2.666526, 0.8470588, 0, 1, 1,
0.9016766, -0.978817, 0.7959729, 0.854902, 0, 1, 1,
0.9066556, 0.7878301, 0.3344059, 0.8588235, 0, 1, 1,
0.9073359, 0.9577837, -0.7787919, 0.8666667, 0, 1, 1,
0.9079518, 0.6925972, 1.323308, 0.8705882, 0, 1, 1,
0.9100464, 1.048571, 0.9805061, 0.8784314, 0, 1, 1,
0.9109461, 1.188599, 1.505673, 0.8823529, 0, 1, 1,
0.9118345, 1.149255, 1.680163, 0.8901961, 0, 1, 1,
0.913949, 0.4243935, 1.108401, 0.8941177, 0, 1, 1,
0.9153363, -1.471421, 3.193651, 0.9019608, 0, 1, 1,
0.9187287, -0.2856558, 1.943285, 0.9098039, 0, 1, 1,
0.9217032, -2.045449, 1.627625, 0.9137255, 0, 1, 1,
0.9222922, -0.4592148, 2.14521, 0.9215686, 0, 1, 1,
0.9226863, 0.08153313, 0.5343853, 0.9254902, 0, 1, 1,
0.9248761, -1.01932, 2.911031, 0.9333333, 0, 1, 1,
0.9270629, -0.773932, 2.261196, 0.9372549, 0, 1, 1,
0.9327089, -0.4296002, 2.364913, 0.945098, 0, 1, 1,
0.9336321, 0.1637858, 2.049124, 0.9490196, 0, 1, 1,
0.9353129, -0.05520868, 1.559254, 0.9568627, 0, 1, 1,
0.9380844, -0.2543479, 2.571119, 0.9607843, 0, 1, 1,
0.9396394, 1.006731, 0.02301298, 0.9686275, 0, 1, 1,
0.9409943, 0.06775151, 0.9485296, 0.972549, 0, 1, 1,
0.9421018, -1.091954, 2.17079, 0.9803922, 0, 1, 1,
0.9440901, -0.005432808, 2.623314, 0.9843137, 0, 1, 1,
0.9455492, -0.8521651, 1.895145, 0.9921569, 0, 1, 1,
0.945885, 1.008812, -0.6958742, 0.9960784, 0, 1, 1,
0.9460893, 1.360733, 0.7295795, 1, 0, 0.9960784, 1,
0.9551389, -0.2960189, 2.625657, 1, 0, 0.9882353, 1,
0.9605151, 0.5135078, -0.7012814, 1, 0, 0.9843137, 1,
0.9609411, -0.1040033, -0.1422484, 1, 0, 0.9764706, 1,
0.9689471, 1.179681, 1.084365, 1, 0, 0.972549, 1,
0.9697742, 0.04471625, 1.962728, 1, 0, 0.9647059, 1,
0.9765027, 1.099476, 0.5294771, 1, 0, 0.9607843, 1,
0.980233, 0.5193511, 1.814427, 1, 0, 0.9529412, 1,
0.9932108, -0.3335926, 2.358328, 1, 0, 0.9490196, 1,
0.9966548, -0.3655057, 0.3303653, 1, 0, 0.9411765, 1,
0.997791, 0.3775971, 1.473889, 1, 0, 0.9372549, 1,
1.000953, 1.001399, 1.219315, 1, 0, 0.9294118, 1,
1.001082, -0.8512956, 2.717997, 1, 0, 0.9254902, 1,
1.007228, 0.8761992, 0.1046117, 1, 0, 0.9176471, 1,
1.011275, 0.9955221, -0.2158652, 1, 0, 0.9137255, 1,
1.016403, 0.143876, 0.4582454, 1, 0, 0.9058824, 1,
1.018215, 0.06841323, 0.5342339, 1, 0, 0.9019608, 1,
1.023203, 0.3367997, 1.663114, 1, 0, 0.8941177, 1,
1.023475, -0.5508283, 1.951813, 1, 0, 0.8862745, 1,
1.033225, 0.9661776, 1.657055, 1, 0, 0.8823529, 1,
1.039159, 0.9913454, 0.3419296, 1, 0, 0.8745098, 1,
1.047111, 0.3569663, 0.02086043, 1, 0, 0.8705882, 1,
1.057091, -1.177751, 4.780591, 1, 0, 0.8627451, 1,
1.058887, 0.6152713, 0.760873, 1, 0, 0.8588235, 1,
1.061708, 0.2788, 0.4670382, 1, 0, 0.8509804, 1,
1.064036, 0.3646494, -0.885728, 1, 0, 0.8470588, 1,
1.067289, 0.8428801, 1.13939, 1, 0, 0.8392157, 1,
1.06925, 0.5210932, 0.1103524, 1, 0, 0.8352941, 1,
1.070199, -0.3535317, 1.159905, 1, 0, 0.827451, 1,
1.07142, -1.837965, 4.341215, 1, 0, 0.8235294, 1,
1.076396, 0.1425554, 0.5068935, 1, 0, 0.8156863, 1,
1.100589, -1.403729, 1.233228, 1, 0, 0.8117647, 1,
1.103673, -0.3947613, 3.513793, 1, 0, 0.8039216, 1,
1.109119, 0.5236131, 0.6725996, 1, 0, 0.7960784, 1,
1.109709, -0.2285217, 1.752328, 1, 0, 0.7921569, 1,
1.112018, 1.067536, 1.354011, 1, 0, 0.7843137, 1,
1.12197, 0.6741152, 1.490445, 1, 0, 0.7803922, 1,
1.122789, 0.4784003, -0.3468431, 1, 0, 0.772549, 1,
1.123037, -2.105439, 2.271658, 1, 0, 0.7686275, 1,
1.124957, -1.300177, 1.833271, 1, 0, 0.7607843, 1,
1.12894, 0.337249, 1.487245, 1, 0, 0.7568628, 1,
1.129686, 1.862767, -0.03440891, 1, 0, 0.7490196, 1,
1.132032, -0.1804618, 1.395213, 1, 0, 0.7450981, 1,
1.140441, 0.5797263, 2.374094, 1, 0, 0.7372549, 1,
1.145734, -0.003329583, 0.2582249, 1, 0, 0.7333333, 1,
1.148246, -0.05024479, 3.444275, 1, 0, 0.7254902, 1,
1.149189, 0.3851895, 0.376904, 1, 0, 0.7215686, 1,
1.165989, -0.4920625, 0.9540029, 1, 0, 0.7137255, 1,
1.167235, -0.3087071, 2.521917, 1, 0, 0.7098039, 1,
1.179372, 0.02051675, 3.61439, 1, 0, 0.7019608, 1,
1.189389, 0.1606635, 1.918926, 1, 0, 0.6941177, 1,
1.191535, 0.01905295, 0.4997127, 1, 0, 0.6901961, 1,
1.193231, -0.1080852, 3.057136, 1, 0, 0.682353, 1,
1.196265, 0.1463431, 2.133797, 1, 0, 0.6784314, 1,
1.213176, -1.162436, 2.147489, 1, 0, 0.6705883, 1,
1.214253, -0.5119426, 1.216729, 1, 0, 0.6666667, 1,
1.214327, -0.2842019, 1.946724, 1, 0, 0.6588235, 1,
1.216139, 0.1546227, 2.498886, 1, 0, 0.654902, 1,
1.217049, 0.3042741, 3.660215, 1, 0, 0.6470588, 1,
1.217124, 0.4573408, 0.2133659, 1, 0, 0.6431373, 1,
1.217342, 1.073592, 1.545233, 1, 0, 0.6352941, 1,
1.226215, -0.323229, 0.8850411, 1, 0, 0.6313726, 1,
1.226606, 1.07762, 2.523643, 1, 0, 0.6235294, 1,
1.228188, -0.6019914, 2.93173, 1, 0, 0.6196079, 1,
1.230673, 0.8358792, 0.5159313, 1, 0, 0.6117647, 1,
1.242655, -1.499445, 2.684386, 1, 0, 0.6078432, 1,
1.254617, 0.694554, 1.668868, 1, 0, 0.6, 1,
1.25758, 0.2029634, 0.2804362, 1, 0, 0.5921569, 1,
1.26318, 1.173743, 2.835095, 1, 0, 0.5882353, 1,
1.266458, -1.02125, 2.987124, 1, 0, 0.5803922, 1,
1.279006, -0.8780273, 2.990208, 1, 0, 0.5764706, 1,
1.298655, -0.196888, 4.019815, 1, 0, 0.5686275, 1,
1.30225, 0.8425335, 1.581576, 1, 0, 0.5647059, 1,
1.305904, -0.09620048, 1.617535, 1, 0, 0.5568628, 1,
1.312656, -1.053386, 0.9941226, 1, 0, 0.5529412, 1,
1.313846, -0.7078837, 2.970153, 1, 0, 0.5450981, 1,
1.321259, 1.314065, 1.078866, 1, 0, 0.5411765, 1,
1.330851, 0.7112176, 1.733321, 1, 0, 0.5333334, 1,
1.340319, 0.2046815, 0.5449918, 1, 0, 0.5294118, 1,
1.343684, 0.04296336, 2.166332, 1, 0, 0.5215687, 1,
1.350885, 1.68816, -0.2450966, 1, 0, 0.5176471, 1,
1.35568, -0.05401691, 0.8820025, 1, 0, 0.509804, 1,
1.361614, 0.5061161, 0.740676, 1, 0, 0.5058824, 1,
1.368555, 0.7377855, -0.6024736, 1, 0, 0.4980392, 1,
1.370868, -2.234664, 3.406983, 1, 0, 0.4901961, 1,
1.37954, 1.944608, 1.26234, 1, 0, 0.4862745, 1,
1.397798, -0.8106861, 0.8725131, 1, 0, 0.4784314, 1,
1.411207, 0.1542772, 2.845431, 1, 0, 0.4745098, 1,
1.425465, 0.1029094, 0.9869882, 1, 0, 0.4666667, 1,
1.431834, -1.096526, 0.1931601, 1, 0, 0.4627451, 1,
1.441086, -0.1437985, -0.03753157, 1, 0, 0.454902, 1,
1.442031, 0.3934753, 2.663508, 1, 0, 0.4509804, 1,
1.444341, -0.7801574, 1.195118, 1, 0, 0.4431373, 1,
1.454878, 1.761346, 1.005435, 1, 0, 0.4392157, 1,
1.455844, -0.6505402, 3.146712, 1, 0, 0.4313726, 1,
1.457741, 1.306723, 0.433235, 1, 0, 0.427451, 1,
1.46501, 1.779588, 0.06979536, 1, 0, 0.4196078, 1,
1.474599, -1.176831, 0.3503233, 1, 0, 0.4156863, 1,
1.492828, -1.90786, 0.09434701, 1, 0, 0.4078431, 1,
1.493503, -0.3066025, 2.1075, 1, 0, 0.4039216, 1,
1.507255, 1.994123, 0.5614903, 1, 0, 0.3960784, 1,
1.508209, -1.13098, 3.378653, 1, 0, 0.3882353, 1,
1.525625, 0.4631376, 2.112818, 1, 0, 0.3843137, 1,
1.531498, -1.135084, 3.868906, 1, 0, 0.3764706, 1,
1.538755, 0.5676444, 1.168187, 1, 0, 0.372549, 1,
1.548284, 0.8242017, 1.605421, 1, 0, 0.3647059, 1,
1.555267, 1.585497, 0.5564256, 1, 0, 0.3607843, 1,
1.562624, -0.556445, 1.117892, 1, 0, 0.3529412, 1,
1.562826, -1.092857, 1.03223, 1, 0, 0.3490196, 1,
1.574822, 0.4354078, 0.7443916, 1, 0, 0.3411765, 1,
1.5767, 1.351306, 2.765298, 1, 0, 0.3372549, 1,
1.580722, 0.1569837, 1.933352, 1, 0, 0.3294118, 1,
1.59462, -1.333452, 1.868823, 1, 0, 0.3254902, 1,
1.601533, -0.7109687, 2.427611, 1, 0, 0.3176471, 1,
1.637475, 0.561192, 2.410174, 1, 0, 0.3137255, 1,
1.641048, 0.1188755, 0.8147436, 1, 0, 0.3058824, 1,
1.647282, 0.1542173, 1.920103, 1, 0, 0.2980392, 1,
1.663568, -1.069153, 2.383578, 1, 0, 0.2941177, 1,
1.666066, 0.5274781, 2.946465, 1, 0, 0.2862745, 1,
1.683646, -0.1576797, 0.5313782, 1, 0, 0.282353, 1,
1.685083, -0.1002569, 0.7367802, 1, 0, 0.2745098, 1,
1.685092, -0.2110247, -0.5485916, 1, 0, 0.2705882, 1,
1.689082, -0.7105621, 3.905161, 1, 0, 0.2627451, 1,
1.713038, 1.147963, 0.4758362, 1, 0, 0.2588235, 1,
1.727837, 0.7888756, 0.8775128, 1, 0, 0.2509804, 1,
1.728642, 0.5537646, 1.703295, 1, 0, 0.2470588, 1,
1.737207, 0.2116214, 0.7037517, 1, 0, 0.2392157, 1,
1.740999, 0.7063336, 2.231491, 1, 0, 0.2352941, 1,
1.744376, 2.326675, 0.1684634, 1, 0, 0.227451, 1,
1.767927, 0.3718768, 2.694165, 1, 0, 0.2235294, 1,
1.776466, 1.357577, 0.6666139, 1, 0, 0.2156863, 1,
1.795947, 1.016544, 1.245237, 1, 0, 0.2117647, 1,
1.815621, 1.540462, 0.3205651, 1, 0, 0.2039216, 1,
1.831967, 2.186365, 0.2863684, 1, 0, 0.1960784, 1,
1.833064, 0.230986, 0.8789127, 1, 0, 0.1921569, 1,
1.843883, -1.98565, 2.37622, 1, 0, 0.1843137, 1,
1.852115, 0.3793032, 1.355019, 1, 0, 0.1803922, 1,
1.917715, 0.1405384, 2.302186, 1, 0, 0.172549, 1,
1.927513, -2.171643, 1.731466, 1, 0, 0.1686275, 1,
1.930726, -0.946153, 2.238321, 1, 0, 0.1607843, 1,
1.962754, 1.409556, -0.02315423, 1, 0, 0.1568628, 1,
1.997454, 0.8944716, 0.8119684, 1, 0, 0.1490196, 1,
2.00949, -0.5700489, 1.684863, 1, 0, 0.145098, 1,
2.033829, 0.5692754, 1.277018, 1, 0, 0.1372549, 1,
2.043848, -0.631769, 1.135225, 1, 0, 0.1333333, 1,
2.071042, 0.35942, 2.934438, 1, 0, 0.1254902, 1,
2.083032, -0.02628206, 2.504093, 1, 0, 0.1215686, 1,
2.139845, 1.304296, -0.68831, 1, 0, 0.1137255, 1,
2.163212, 0.1877547, 0.7527137, 1, 0, 0.1098039, 1,
2.199333, 0.0541563, 1.878667, 1, 0, 0.1019608, 1,
2.204564, 0.9056219, 2.3207, 1, 0, 0.09411765, 1,
2.259929, -0.6568188, 4.063991, 1, 0, 0.09019608, 1,
2.264444, 0.3231654, 1.270231, 1, 0, 0.08235294, 1,
2.338156, -1.151236, 1.035267, 1, 0, 0.07843138, 1,
2.354793, 1.221546, 1.792069, 1, 0, 0.07058824, 1,
2.364701, -2.089922, 2.020163, 1, 0, 0.06666667, 1,
2.399068, -1.158563, 1.125352, 1, 0, 0.05882353, 1,
2.404407, -1.718591, 0.6438204, 1, 0, 0.05490196, 1,
2.497022, -0.694563, 0.663879, 1, 0, 0.04705882, 1,
2.502017, -0.5766774, 1.813696, 1, 0, 0.04313726, 1,
2.524516, 0.3990277, 2.366724, 1, 0, 0.03529412, 1,
2.53598, -0.162619, 0.9060326, 1, 0, 0.03137255, 1,
2.724572, -0.2688854, 0.4432842, 1, 0, 0.02352941, 1,
2.926914, 0.05472945, 0.36482, 1, 0, 0.01960784, 1,
2.945103, 1.892198, -0.1481047, 1, 0, 0.01176471, 1,
3.216206, 0.08504057, 1.693544, 1, 0, 0.007843138, 1
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
-0.02361834, -4.093119, -6.785613, 0, -0.5, 0.5, 0.5,
-0.02361834, -4.093119, -6.785613, 1, -0.5, 0.5, 0.5,
-0.02361834, -4.093119, -6.785613, 1, 1.5, 0.5, 0.5,
-0.02361834, -4.093119, -6.785613, 0, 1.5, 0.5, 0.5
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
-4.361743, -0.07796001, -6.785613, 0, -0.5, 0.5, 0.5,
-4.361743, -0.07796001, -6.785613, 1, -0.5, 0.5, 0.5,
-4.361743, -0.07796001, -6.785613, 1, 1.5, 0.5, 0.5,
-4.361743, -0.07796001, -6.785613, 0, 1.5, 0.5, 0.5
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
-4.361743, -4.093119, 0.5414224, 0, -0.5, 0.5, 0.5,
-4.361743, -4.093119, 0.5414224, 1, -0.5, 0.5, 0.5,
-4.361743, -4.093119, 0.5414224, 1, 1.5, 0.5, 0.5,
-4.361743, -4.093119, 0.5414224, 0, 1.5, 0.5, 0.5
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
-3, -3.166544, -5.094759,
3, -3.166544, -5.094759,
-3, -3.166544, -5.094759,
-3, -3.320973, -5.376567,
-2, -3.166544, -5.094759,
-2, -3.320973, -5.376567,
-1, -3.166544, -5.094759,
-1, -3.320973, -5.376567,
0, -3.166544, -5.094759,
0, -3.320973, -5.376567,
1, -3.166544, -5.094759,
1, -3.320973, -5.376567,
2, -3.166544, -5.094759,
2, -3.320973, -5.376567,
3, -3.166544, -5.094759,
3, -3.320973, -5.376567
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
-3, -3.629832, -5.940186, 0, -0.5, 0.5, 0.5,
-3, -3.629832, -5.940186, 1, -0.5, 0.5, 0.5,
-3, -3.629832, -5.940186, 1, 1.5, 0.5, 0.5,
-3, -3.629832, -5.940186, 0, 1.5, 0.5, 0.5,
-2, -3.629832, -5.940186, 0, -0.5, 0.5, 0.5,
-2, -3.629832, -5.940186, 1, -0.5, 0.5, 0.5,
-2, -3.629832, -5.940186, 1, 1.5, 0.5, 0.5,
-2, -3.629832, -5.940186, 0, 1.5, 0.5, 0.5,
-1, -3.629832, -5.940186, 0, -0.5, 0.5, 0.5,
-1, -3.629832, -5.940186, 1, -0.5, 0.5, 0.5,
-1, -3.629832, -5.940186, 1, 1.5, 0.5, 0.5,
-1, -3.629832, -5.940186, 0, 1.5, 0.5, 0.5,
0, -3.629832, -5.940186, 0, -0.5, 0.5, 0.5,
0, -3.629832, -5.940186, 1, -0.5, 0.5, 0.5,
0, -3.629832, -5.940186, 1, 1.5, 0.5, 0.5,
0, -3.629832, -5.940186, 0, 1.5, 0.5, 0.5,
1, -3.629832, -5.940186, 0, -0.5, 0.5, 0.5,
1, -3.629832, -5.940186, 1, -0.5, 0.5, 0.5,
1, -3.629832, -5.940186, 1, 1.5, 0.5, 0.5,
1, -3.629832, -5.940186, 0, 1.5, 0.5, 0.5,
2, -3.629832, -5.940186, 0, -0.5, 0.5, 0.5,
2, -3.629832, -5.940186, 1, -0.5, 0.5, 0.5,
2, -3.629832, -5.940186, 1, 1.5, 0.5, 0.5,
2, -3.629832, -5.940186, 0, 1.5, 0.5, 0.5,
3, -3.629832, -5.940186, 0, -0.5, 0.5, 0.5,
3, -3.629832, -5.940186, 1, -0.5, 0.5, 0.5,
3, -3.629832, -5.940186, 1, 1.5, 0.5, 0.5,
3, -3.629832, -5.940186, 0, 1.5, 0.5, 0.5
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
-3.360637, -3, -5.094759,
-3.360637, 2, -5.094759,
-3.360637, -3, -5.094759,
-3.527488, -3, -5.376567,
-3.360637, -2, -5.094759,
-3.527488, -2, -5.376567,
-3.360637, -1, -5.094759,
-3.527488, -1, -5.376567,
-3.360637, 0, -5.094759,
-3.527488, 0, -5.376567,
-3.360637, 1, -5.094759,
-3.527488, 1, -5.376567,
-3.360637, 2, -5.094759,
-3.527488, 2, -5.376567
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
-3.86119, -3, -5.940186, 0, -0.5, 0.5, 0.5,
-3.86119, -3, -5.940186, 1, -0.5, 0.5, 0.5,
-3.86119, -3, -5.940186, 1, 1.5, 0.5, 0.5,
-3.86119, -3, -5.940186, 0, 1.5, 0.5, 0.5,
-3.86119, -2, -5.940186, 0, -0.5, 0.5, 0.5,
-3.86119, -2, -5.940186, 1, -0.5, 0.5, 0.5,
-3.86119, -2, -5.940186, 1, 1.5, 0.5, 0.5,
-3.86119, -2, -5.940186, 0, 1.5, 0.5, 0.5,
-3.86119, -1, -5.940186, 0, -0.5, 0.5, 0.5,
-3.86119, -1, -5.940186, 1, -0.5, 0.5, 0.5,
-3.86119, -1, -5.940186, 1, 1.5, 0.5, 0.5,
-3.86119, -1, -5.940186, 0, 1.5, 0.5, 0.5,
-3.86119, 0, -5.940186, 0, -0.5, 0.5, 0.5,
-3.86119, 0, -5.940186, 1, -0.5, 0.5, 0.5,
-3.86119, 0, -5.940186, 1, 1.5, 0.5, 0.5,
-3.86119, 0, -5.940186, 0, 1.5, 0.5, 0.5,
-3.86119, 1, -5.940186, 0, -0.5, 0.5, 0.5,
-3.86119, 1, -5.940186, 1, -0.5, 0.5, 0.5,
-3.86119, 1, -5.940186, 1, 1.5, 0.5, 0.5,
-3.86119, 1, -5.940186, 0, 1.5, 0.5, 0.5,
-3.86119, 2, -5.940186, 0, -0.5, 0.5, 0.5,
-3.86119, 2, -5.940186, 1, -0.5, 0.5, 0.5,
-3.86119, 2, -5.940186, 1, 1.5, 0.5, 0.5,
-3.86119, 2, -5.940186, 0, 1.5, 0.5, 0.5
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
-3.360637, -3.166544, -4,
-3.360637, -3.166544, 6,
-3.360637, -3.166544, -4,
-3.527488, -3.320973, -4,
-3.360637, -3.166544, -2,
-3.527488, -3.320973, -2,
-3.360637, -3.166544, 0,
-3.527488, -3.320973, 0,
-3.360637, -3.166544, 2,
-3.527488, -3.320973, 2,
-3.360637, -3.166544, 4,
-3.527488, -3.320973, 4,
-3.360637, -3.166544, 6,
-3.527488, -3.320973, 6
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
"4",
"6"
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
-3.86119, -3.629832, -4, 0, -0.5, 0.5, 0.5,
-3.86119, -3.629832, -4, 1, -0.5, 0.5, 0.5,
-3.86119, -3.629832, -4, 1, 1.5, 0.5, 0.5,
-3.86119, -3.629832, -4, 0, 1.5, 0.5, 0.5,
-3.86119, -3.629832, -2, 0, -0.5, 0.5, 0.5,
-3.86119, -3.629832, -2, 1, -0.5, 0.5, 0.5,
-3.86119, -3.629832, -2, 1, 1.5, 0.5, 0.5,
-3.86119, -3.629832, -2, 0, 1.5, 0.5, 0.5,
-3.86119, -3.629832, 0, 0, -0.5, 0.5, 0.5,
-3.86119, -3.629832, 0, 1, -0.5, 0.5, 0.5,
-3.86119, -3.629832, 0, 1, 1.5, 0.5, 0.5,
-3.86119, -3.629832, 0, 0, 1.5, 0.5, 0.5,
-3.86119, -3.629832, 2, 0, -0.5, 0.5, 0.5,
-3.86119, -3.629832, 2, 1, -0.5, 0.5, 0.5,
-3.86119, -3.629832, 2, 1, 1.5, 0.5, 0.5,
-3.86119, -3.629832, 2, 0, 1.5, 0.5, 0.5,
-3.86119, -3.629832, 4, 0, -0.5, 0.5, 0.5,
-3.86119, -3.629832, 4, 1, -0.5, 0.5, 0.5,
-3.86119, -3.629832, 4, 1, 1.5, 0.5, 0.5,
-3.86119, -3.629832, 4, 0, 1.5, 0.5, 0.5,
-3.86119, -3.629832, 6, 0, -0.5, 0.5, 0.5,
-3.86119, -3.629832, 6, 1, -0.5, 0.5, 0.5,
-3.86119, -3.629832, 6, 1, 1.5, 0.5, 0.5,
-3.86119, -3.629832, 6, 0, 1.5, 0.5, 0.5
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
-3.360637, -3.166544, -5.094759,
-3.360637, 3.010624, -5.094759,
-3.360637, -3.166544, 6.177603,
-3.360637, 3.010624, 6.177603,
-3.360637, -3.166544, -5.094759,
-3.360637, -3.166544, 6.177603,
-3.360637, 3.010624, -5.094759,
-3.360637, 3.010624, 6.177603,
-3.360637, -3.166544, -5.094759,
3.313401, -3.166544, -5.094759,
-3.360637, -3.166544, 6.177603,
3.313401, -3.166544, 6.177603,
-3.360637, 3.010624, -5.094759,
3.313401, 3.010624, -5.094759,
-3.360637, 3.010624, 6.177603,
3.313401, 3.010624, 6.177603,
3.313401, -3.166544, -5.094759,
3.313401, 3.010624, -5.094759,
3.313401, -3.166544, 6.177603,
3.313401, 3.010624, 6.177603,
3.313401, -3.166544, -5.094759,
3.313401, -3.166544, 6.177603,
3.313401, 3.010624, -5.094759,
3.313401, 3.010624, 6.177603
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
var radius = 7.733807;
var distance = 34.40858;
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
mvMatrix.translate( 0.02361834, 0.07796001, -0.5414224 );
mvMatrix.scale( 1.252906, 1.353686, 0.7418094 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.40858);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
IPC<-read.table("IPC.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-IPC$V2
```

```
## Error in eval(expr, envir, enclos): object 'IPC' not found
```

```r
y<-IPC$V3
```

```
## Error in eval(expr, envir, enclos): object 'IPC' not found
```

```r
z<-IPC$V4
```

```
## Error in eval(expr, envir, enclos): object 'IPC' not found
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
-3.263443, -0.5527717, -3.629057, 0, 0, 1, 1, 1,
-3.258323, -0.7673554, -1.016781, 1, 0, 0, 1, 1,
-3.156514, 0.1807815, -3.254055, 1, 0, 0, 1, 1,
-2.98385, 0.02189708, -4.140974, 1, 0, 0, 1, 1,
-2.763548, -1.743467, -2.880089, 1, 0, 0, 1, 1,
-2.758946, 1.006053, 1.032883, 1, 0, 0, 1, 1,
-2.650671, 0.3337277, -1.579389, 0, 0, 0, 1, 1,
-2.637193, 0.3670729, -2.14375, 0, 0, 0, 1, 1,
-2.575825, 0.04686773, -1.88961, 0, 0, 0, 1, 1,
-2.445062, -0.8707733, -2.738441, 0, 0, 0, 1, 1,
-2.414109, 1.230028, -1.730957, 0, 0, 0, 1, 1,
-2.409454, -1.578801, -1.577513, 0, 0, 0, 1, 1,
-2.408006, -0.7766507, -1.535446, 0, 0, 0, 1, 1,
-2.375647, -0.9378493, -1.578246, 1, 1, 1, 1, 1,
-2.233637, -0.9886955, -1.394636, 1, 1, 1, 1, 1,
-2.22883, -0.07421238, -2.623529, 1, 1, 1, 1, 1,
-2.186298, 0.9205207, -1.927285, 1, 1, 1, 1, 1,
-2.175457, -0.04338346, -0.01495828, 1, 1, 1, 1, 1,
-2.169428, -0.09659273, -3.041694, 1, 1, 1, 1, 1,
-2.138116, 0.8537384, -2.36211, 1, 1, 1, 1, 1,
-2.135267, 0.4990158, -0.5862239, 1, 1, 1, 1, 1,
-2.125581, -1.828475, -2.785592, 1, 1, 1, 1, 1,
-2.123839, -1.571497, -2.268743, 1, 1, 1, 1, 1,
-2.119864, -1.607087, -2.384692, 1, 1, 1, 1, 1,
-2.038638, -0.03742759, -1.982656, 1, 1, 1, 1, 1,
-2.030597, -0.2585966, -1.927308, 1, 1, 1, 1, 1,
-2.024353, 0.3589498, -1.718906, 1, 1, 1, 1, 1,
-1.972253, -0.1714114, -3.153365, 1, 1, 1, 1, 1,
-1.95189, -2.237237, -2.500842, 0, 0, 1, 1, 1,
-1.897466, 1.431899, -0.3875364, 1, 0, 0, 1, 1,
-1.875681, 0.3518319, 0.02447126, 1, 0, 0, 1, 1,
-1.875239, -0.7552518, -2.660751, 1, 0, 0, 1, 1,
-1.851203, -0.03807021, -0.6580749, 1, 0, 0, 1, 1,
-1.842398, -0.9453782, -1.83071, 1, 0, 0, 1, 1,
-1.841975, 1.285132, -0.2851608, 0, 0, 0, 1, 1,
-1.835046, -0.1746295, -1.69166, 0, 0, 0, 1, 1,
-1.809731, -1.048, -1.611619, 0, 0, 0, 1, 1,
-1.803693, -0.492283, -1.706468, 0, 0, 0, 1, 1,
-1.771054, -1.343859, -2.805012, 0, 0, 0, 1, 1,
-1.751718, 0.9632503, -1.738417, 0, 0, 0, 1, 1,
-1.748345, 0.804639, -0.6978722, 0, 0, 0, 1, 1,
-1.74236, 0.1708421, -2.756207, 1, 1, 1, 1, 1,
-1.736369, -0.2050448, -2.315029, 1, 1, 1, 1, 1,
-1.715918, 0.2908837, -2.28759, 1, 1, 1, 1, 1,
-1.69171, -0.8199398, -1.616835, 1, 1, 1, 1, 1,
-1.687884, 1.014552, -1.532791, 1, 1, 1, 1, 1,
-1.675885, -0.4046817, -2.179852, 1, 1, 1, 1, 1,
-1.670867, 1.020887, -0.3550371, 1, 1, 1, 1, 1,
-1.670245, -0.6359058, -3.150189, 1, 1, 1, 1, 1,
-1.660925, 0.8774208, -1.786995, 1, 1, 1, 1, 1,
-1.65274, -0.3427733, -1.247046, 1, 1, 1, 1, 1,
-1.645511, -0.04671043, -0.7196811, 1, 1, 1, 1, 1,
-1.64301, -1.864879, -1.868689, 1, 1, 1, 1, 1,
-1.640032, 2.673244, -0.5329062, 1, 1, 1, 1, 1,
-1.618273, -0.2678532, -0.8780575, 1, 1, 1, 1, 1,
-1.614591, 1.569414, 1.206986, 1, 1, 1, 1, 1,
-1.601175, 1.000505, 0.989091, 0, 0, 1, 1, 1,
-1.574539, -0.3080895, -0.3141205, 1, 0, 0, 1, 1,
-1.57002, -0.1721482, -1.920458, 1, 0, 0, 1, 1,
-1.56613, -0.7192314, -3.150751, 1, 0, 0, 1, 1,
-1.564723, 0.7052453, -2.447777, 1, 0, 0, 1, 1,
-1.559058, -1.112875, -0.898907, 1, 0, 0, 1, 1,
-1.55889, 0.01252344, -1.466225, 0, 0, 0, 1, 1,
-1.550754, -0.07899269, -1.481377, 0, 0, 0, 1, 1,
-1.545529, 0.07892619, -2.033264, 0, 0, 0, 1, 1,
-1.543215, 1.605685, -0.5221705, 0, 0, 0, 1, 1,
-1.536394, 1.539257, -1.440195, 0, 0, 0, 1, 1,
-1.531709, -1.651485, -3.798383, 0, 0, 0, 1, 1,
-1.527001, 2.494238, -0.6060621, 0, 0, 0, 1, 1,
-1.521007, -0.5369279, -2.201333, 1, 1, 1, 1, 1,
-1.520163, -0.07967582, -1.97208, 1, 1, 1, 1, 1,
-1.514171, 1.804057, -0.7743589, 1, 1, 1, 1, 1,
-1.50833, -0.6038412, -1.93912, 1, 1, 1, 1, 1,
-1.501925, 1.866984, -0.6166057, 1, 1, 1, 1, 1,
-1.468345, 0.2344866, -1.458088, 1, 1, 1, 1, 1,
-1.463989, -0.6787229, -1.002693, 1, 1, 1, 1, 1,
-1.452183, 0.1292428, -1.606136, 1, 1, 1, 1, 1,
-1.447976, 0.07022179, -2.080752, 1, 1, 1, 1, 1,
-1.441501, -0.4147456, 0.7217006, 1, 1, 1, 1, 1,
-1.436646, 0.1078516, -0.3139804, 1, 1, 1, 1, 1,
-1.432219, 0.5454634, -1.48231, 1, 1, 1, 1, 1,
-1.430345, -0.5940925, -0.1272036, 1, 1, 1, 1, 1,
-1.410388, 0.2178233, -0.1049294, 1, 1, 1, 1, 1,
-1.399112, 0.3781051, -4.188982, 1, 1, 1, 1, 1,
-1.392675, 0.6548504, -2.092455, 0, 0, 1, 1, 1,
-1.392111, -0.1675363, -2.524642, 1, 0, 0, 1, 1,
-1.391479, -1.172445, -2.891266, 1, 0, 0, 1, 1,
-1.389385, 0.4205979, 0.7265249, 1, 0, 0, 1, 1,
-1.377893, -0.04517815, -0.9851822, 1, 0, 0, 1, 1,
-1.375861, -0.1641418, -1.254115, 1, 0, 0, 1, 1,
-1.37581, -0.1012692, -0.4212704, 0, 0, 0, 1, 1,
-1.374386, -1.029594, -2.398058, 0, 0, 0, 1, 1,
-1.371482, -0.8213133, -2.029956, 0, 0, 0, 1, 1,
-1.368385, 0.3849557, -0.2763491, 0, 0, 0, 1, 1,
-1.368323, -0.7879106, -0.7516598, 0, 0, 0, 1, 1,
-1.36219, 0.07450709, -2.300169, 0, 0, 0, 1, 1,
-1.361893, 0.6810385, -0.3534744, 0, 0, 0, 1, 1,
-1.360975, 1.374209, -1.623954, 1, 1, 1, 1, 1,
-1.351066, 1.400406, -0.4383009, 1, 1, 1, 1, 1,
-1.318218, -0.7195941, -3.50128, 1, 1, 1, 1, 1,
-1.317294, -0.4004661, -1.982147, 1, 1, 1, 1, 1,
-1.316318, -1.37559, -1.040265, 1, 1, 1, 1, 1,
-1.30641, 1.552781, -1.381477, 1, 1, 1, 1, 1,
-1.298495, 0.513311, 0.2299365, 1, 1, 1, 1, 1,
-1.298197, 1.096182, -0.9364808, 1, 1, 1, 1, 1,
-1.286601, -1.597555, -2.028298, 1, 1, 1, 1, 1,
-1.269839, 0.01857432, -1.840719, 1, 1, 1, 1, 1,
-1.267745, -1.417847, -1.834087, 1, 1, 1, 1, 1,
-1.267587, 0.2425672, 0.2961786, 1, 1, 1, 1, 1,
-1.259385, -0.5502126, -1.986794, 1, 1, 1, 1, 1,
-1.257148, -0.6583952, -2.168275, 1, 1, 1, 1, 1,
-1.246157, 0.9187867, -1.444499, 1, 1, 1, 1, 1,
-1.231483, -1.149632, -1.606114, 0, 0, 1, 1, 1,
-1.222888, 0.1510665, -1.880752, 1, 0, 0, 1, 1,
-1.215269, 0.4936684, 0.9660511, 1, 0, 0, 1, 1,
-1.20968, 0.2489548, -0.007211459, 1, 0, 0, 1, 1,
-1.202835, -0.4005143, -2.470115, 1, 0, 0, 1, 1,
-1.197306, 0.9104621, -1.043652, 1, 0, 0, 1, 1,
-1.194511, -1.087949, -2.980032, 0, 0, 0, 1, 1,
-1.187945, 0.7349017, -0.1302082, 0, 0, 0, 1, 1,
-1.182454, 0.1045664, -2.356713, 0, 0, 0, 1, 1,
-1.178727, -0.6632059, -3.067328, 0, 0, 0, 1, 1,
-1.152096, 0.4460241, -2.202369, 0, 0, 0, 1, 1,
-1.15199, 0.3534135, -2.495096, 0, 0, 0, 1, 1,
-1.143132, -1.082958, -2.380837, 0, 0, 0, 1, 1,
-1.140496, -1.327996, -4.754596, 1, 1, 1, 1, 1,
-1.137846, 0.4753109, -1.365029, 1, 1, 1, 1, 1,
-1.132586, -0.7779222, -2.621459, 1, 1, 1, 1, 1,
-1.126746, 0.3369153, -2.346939, 1, 1, 1, 1, 1,
-1.117849, 1.063347, 1.217775, 1, 1, 1, 1, 1,
-1.10346, -1.061241, -3.120566, 1, 1, 1, 1, 1,
-1.0997, 0.0886941, -1.371206, 1, 1, 1, 1, 1,
-1.096415, -0.7352518, -1.638396, 1, 1, 1, 1, 1,
-1.095659, 0.9436622, -0.8066438, 1, 1, 1, 1, 1,
-1.083219, -0.6452208, -1.905913, 1, 1, 1, 1, 1,
-1.079377, 0.2976332, -3.252699, 1, 1, 1, 1, 1,
-1.061018, 0.06051457, -2.003079, 1, 1, 1, 1, 1,
-1.060384, -1.354994, -2.783884, 1, 1, 1, 1, 1,
-1.056674, -1.408448, -3.088688, 1, 1, 1, 1, 1,
-1.041266, -0.4323294, -0.1941964, 1, 1, 1, 1, 1,
-1.036475, -0.5337777, -3.897812, 0, 0, 1, 1, 1,
-1.031854, 0.01722394, 0.5997385, 1, 0, 0, 1, 1,
-1.028625, 1.349604, -0.8937844, 1, 0, 0, 1, 1,
-1.024574, 0.7402983, -2.147539, 1, 0, 0, 1, 1,
-1.024257, 1.749883, 0.2391646, 1, 0, 0, 1, 1,
-1.022109, 1.33147, -0.9486427, 1, 0, 0, 1, 1,
-1.020581, 1.755121, -0.9197597, 0, 0, 0, 1, 1,
-1.018493, -0.7321951, -1.229523, 0, 0, 0, 1, 1,
-0.9955822, -2.112128, -0.9683248, 0, 0, 0, 1, 1,
-0.9899644, 0.1194574, -0.718247, 0, 0, 0, 1, 1,
-0.9881935, 0.3531353, -1.190907, 0, 0, 0, 1, 1,
-0.9870414, 0.09368797, -0.3450062, 0, 0, 0, 1, 1,
-0.9824, -0.7868055, -3.696479, 0, 0, 0, 1, 1,
-0.9814864, -1.36852, -2.341146, 1, 1, 1, 1, 1,
-0.976855, 1.543907, -0.4419592, 1, 1, 1, 1, 1,
-0.9682994, -1.198238, -2.8528, 1, 1, 1, 1, 1,
-0.9624059, 1.315812, -1.151788, 1, 1, 1, 1, 1,
-0.9623662, -1.003734, -2.966295, 1, 1, 1, 1, 1,
-0.9617091, -0.858548, -2.417394, 1, 1, 1, 1, 1,
-0.96, 1.346545, 0.4300241, 1, 1, 1, 1, 1,
-0.955843, 0.1149947, -1.58866, 1, 1, 1, 1, 1,
-0.9546846, 0.1804584, -2.094431, 1, 1, 1, 1, 1,
-0.9546845, 0.3301779, -1.452371, 1, 1, 1, 1, 1,
-0.9521639, 0.4518165, 1.257047, 1, 1, 1, 1, 1,
-0.9511336, -0.04242881, -1.01592, 1, 1, 1, 1, 1,
-0.9431321, -1.02063, -3.697132, 1, 1, 1, 1, 1,
-0.9417781, 0.1206368, -2.984921, 1, 1, 1, 1, 1,
-0.9317448, -0.8168933, -2.433231, 1, 1, 1, 1, 1,
-0.9316453, 0.9503745, -0.3671786, 0, 0, 1, 1, 1,
-0.9306701, -2.001201, -2.608778, 1, 0, 0, 1, 1,
-0.9229903, 1.037398, -0.6511809, 1, 0, 0, 1, 1,
-0.9216819, 0.7494304, -0.4348858, 1, 0, 0, 1, 1,
-0.9096068, 1.780157, -1.557104, 1, 0, 0, 1, 1,
-0.9042966, -0.04025586, -2.386815, 1, 0, 0, 1, 1,
-0.902173, -0.8992892, -2.67328, 0, 0, 0, 1, 1,
-0.8954218, 0.2296622, -1.34981, 0, 0, 0, 1, 1,
-0.8897085, 0.005174614, -2.84608, 0, 0, 0, 1, 1,
-0.8896955, 0.3747819, -1.071818, 0, 0, 0, 1, 1,
-0.8896582, -0.6765633, -4.508619, 0, 0, 0, 1, 1,
-0.8746713, 0.1171456, -1.676363, 0, 0, 0, 1, 1,
-0.8746567, -1.842138, -1.895032, 0, 0, 0, 1, 1,
-0.8692043, 1.049117, -0.2441078, 1, 1, 1, 1, 1,
-0.868357, -3.02167, -2.667475, 1, 1, 1, 1, 1,
-0.8624324, 0.6928018, -0.4654098, 1, 1, 1, 1, 1,
-0.8573857, -0.1815469, -2.702493, 1, 1, 1, 1, 1,
-0.8548801, -0.4340678, -2.037441, 1, 1, 1, 1, 1,
-0.8542899, -1.076999, -2.639516, 1, 1, 1, 1, 1,
-0.8513073, -0.07264204, 0.01997438, 1, 1, 1, 1, 1,
-0.8506197, -1.184536, -1.680551, 1, 1, 1, 1, 1,
-0.8447831, 1.147636, -1.774586, 1, 1, 1, 1, 1,
-0.8384182, 1.138412, -0.678145, 1, 1, 1, 1, 1,
-0.8343139, 0.2424238, -0.3763951, 1, 1, 1, 1, 1,
-0.8215918, -0.9388453, -4.142374, 1, 1, 1, 1, 1,
-0.8185803, -1.548775, -3.290747, 1, 1, 1, 1, 1,
-0.8145711, 0.4623978, -0.7002125, 1, 1, 1, 1, 1,
-0.8123903, -1.957715, -2.84811, 1, 1, 1, 1, 1,
-0.8110017, 2.442034, 0.1676575, 0, 0, 1, 1, 1,
-0.810214, 0.6921848, -2.573714, 1, 0, 0, 1, 1,
-0.8058223, -0.073568, -1.163261, 1, 0, 0, 1, 1,
-0.8043334, 0.2057756, 0.3747542, 1, 0, 0, 1, 1,
-0.8035326, 0.6670735, -1.377899, 1, 0, 0, 1, 1,
-0.7999415, -0.2384195, -0.6001325, 1, 0, 0, 1, 1,
-0.7962824, -0.01473631, -0.8640654, 0, 0, 0, 1, 1,
-0.7918307, 1.226084, -0.9415572, 0, 0, 0, 1, 1,
-0.7895699, -0.2975863, -3.222318, 0, 0, 0, 1, 1,
-0.7888144, -1.165742, -2.22786, 0, 0, 0, 1, 1,
-0.7887711, 0.3345358, 0.3294632, 0, 0, 0, 1, 1,
-0.7873564, 0.8565136, -1.831316, 0, 0, 0, 1, 1,
-0.7843925, 0.7012212, -0.9161977, 0, 0, 0, 1, 1,
-0.777828, -0.02362407, -0.6230748, 1, 1, 1, 1, 1,
-0.7757803, 1.104479, -0.1838038, 1, 1, 1, 1, 1,
-0.7734377, -0.8326359, -0.5749684, 1, 1, 1, 1, 1,
-0.7732752, -0.2642027, -1.983356, 1, 1, 1, 1, 1,
-0.7688944, 1.090728, -0.5530733, 1, 1, 1, 1, 1,
-0.7652998, 0.1353292, -1.422588, 1, 1, 1, 1, 1,
-0.7574996, -1.756617, -3.711668, 1, 1, 1, 1, 1,
-0.7571705, 1.192081, -0.1827125, 1, 1, 1, 1, 1,
-0.7562579, 0.07261509, -0.8179171, 1, 1, 1, 1, 1,
-0.7560685, 1.221778, -0.6669453, 1, 1, 1, 1, 1,
-0.7479939, 1.690933, 0.503974, 1, 1, 1, 1, 1,
-0.7437885, 0.7456789, -2.779676, 1, 1, 1, 1, 1,
-0.7416009, -1.298392, -2.962983, 1, 1, 1, 1, 1,
-0.737803, 1.821749, 0.2791755, 1, 1, 1, 1, 1,
-0.7366259, 0.4194828, -2.045494, 1, 1, 1, 1, 1,
-0.7245726, 0.3404667, -2.907496, 0, 0, 1, 1, 1,
-0.7192934, 0.6440252, -1.351604, 1, 0, 0, 1, 1,
-0.7189806, 0.7405691, -2.244846, 1, 0, 0, 1, 1,
-0.7174208, 0.5293425, -2.502398, 1, 0, 0, 1, 1,
-0.7164495, -0.2055649, -2.546904, 1, 0, 0, 1, 1,
-0.7154307, -0.03580288, -1.863802, 1, 0, 0, 1, 1,
-0.7121621, -0.6837699, -4.107657, 0, 0, 0, 1, 1,
-0.7094836, -0.6142188, -2.706782, 0, 0, 0, 1, 1,
-0.7086151, 1.487711, -1.12487, 0, 0, 0, 1, 1,
-0.6922624, -0.2874076, -2.52018, 0, 0, 0, 1, 1,
-0.6885548, -1.077175, -3.19791, 0, 0, 0, 1, 1,
-0.6880228, -0.2316779, -1.403501, 0, 0, 0, 1, 1,
-0.6861856, 0.6550239, 1.055428, 0, 0, 0, 1, 1,
-0.6794772, 0.2588567, -0.5306055, 1, 1, 1, 1, 1,
-0.6792757, -0.4428116, -0.3804634, 1, 1, 1, 1, 1,
-0.6691036, 1.341396, -1.707358, 1, 1, 1, 1, 1,
-0.6667767, 1.936822, -1.673223, 1, 1, 1, 1, 1,
-0.6667579, 0.1243113, 0.003591526, 1, 1, 1, 1, 1,
-0.66497, -0.8356326, -0.878868, 1, 1, 1, 1, 1,
-0.6593162, 1.809946, -2.301598, 1, 1, 1, 1, 1,
-0.6552638, 1.338645, -1.711855, 1, 1, 1, 1, 1,
-0.650149, -0.08303542, -0.2787684, 1, 1, 1, 1, 1,
-0.6404387, 0.1833122, -4.066453, 1, 1, 1, 1, 1,
-0.6318663, 1.52434, -0.7174128, 1, 1, 1, 1, 1,
-0.6282216, 0.7522257, -0.2139338, 1, 1, 1, 1, 1,
-0.6252574, 1.130844, 0.108317, 1, 1, 1, 1, 1,
-0.623257, 0.8398772, -1.657449, 1, 1, 1, 1, 1,
-0.6196584, -1.597768, -3.509596, 1, 1, 1, 1, 1,
-0.6153111, 0.1746247, -2.728351, 0, 0, 1, 1, 1,
-0.6081208, 0.1480884, -0.08824298, 1, 0, 0, 1, 1,
-0.6052068, -1.135281, -2.866985, 1, 0, 0, 1, 1,
-0.6007794, -0.3172639, -1.623816, 1, 0, 0, 1, 1,
-0.5993149, -1.418809, -4.422521, 1, 0, 0, 1, 1,
-0.5985979, 0.1941672, -0.5543253, 1, 0, 0, 1, 1,
-0.5927216, -0.5808623, -4.158935, 0, 0, 0, 1, 1,
-0.5869346, -0.4117452, -2.461205, 0, 0, 0, 1, 1,
-0.5840302, 0.954185, -1.505985, 0, 0, 0, 1, 1,
-0.5795943, -0.1745949, -2.632378, 0, 0, 0, 1, 1,
-0.579291, -0.2966017, -2.675048, 0, 0, 0, 1, 1,
-0.5762463, 0.3503025, -0.6236552, 0, 0, 0, 1, 1,
-0.5758585, 0.4348309, -1.051137, 0, 0, 0, 1, 1,
-0.5747221, -1.641224, -4.780701, 1, 1, 1, 1, 1,
-0.5745408, 0.7142304, -0.2501608, 1, 1, 1, 1, 1,
-0.573462, 0.4953981, -0.9276043, 1, 1, 1, 1, 1,
-0.5596551, 2.193237, 0.6103012, 1, 1, 1, 1, 1,
-0.535939, -0.3561733, -1.296113, 1, 1, 1, 1, 1,
-0.5240905, 0.7476301, -0.2852894, 1, 1, 1, 1, 1,
-0.5222334, -0.09251931, -0.5298509, 1, 1, 1, 1, 1,
-0.518297, -0.0799999, -0.8941981, 1, 1, 1, 1, 1,
-0.516257, -0.8805685, -1.852095, 1, 1, 1, 1, 1,
-0.5148307, 0.3163151, -1.094368, 1, 1, 1, 1, 1,
-0.5117341, -0.9902378, -1.785049, 1, 1, 1, 1, 1,
-0.509073, -0.05797681, -1.496865, 1, 1, 1, 1, 1,
-0.5070075, 0.4732728, 0.2351255, 1, 1, 1, 1, 1,
-0.5058664, 1.314593, 0.2742948, 1, 1, 1, 1, 1,
-0.5048542, -1.503971, -3.269065, 1, 1, 1, 1, 1,
-0.5048295, 0.888756, -1.744921, 0, 0, 1, 1, 1,
-0.5035247, 1.124241, 2.409415, 1, 0, 0, 1, 1,
-0.499331, 0.5862978, -1.414912, 1, 0, 0, 1, 1,
-0.498176, -0.1577411, -2.255488, 1, 0, 0, 1, 1,
-0.4960261, -0.4283709, -1.55883, 1, 0, 0, 1, 1,
-0.4903783, -0.04580415, -1.18573, 1, 0, 0, 1, 1,
-0.4902793, 1.099174, -0.05230303, 0, 0, 0, 1, 1,
-0.4874326, 0.7725126, 1.295741, 0, 0, 0, 1, 1,
-0.4862725, -0.460242, -2.918954, 0, 0, 0, 1, 1,
-0.4843701, -0.4110286, -2.801659, 0, 0, 0, 1, 1,
-0.4835552, 0.3425026, -0.8923441, 0, 0, 0, 1, 1,
-0.4822707, 0.8266527, -0.5492057, 0, 0, 0, 1, 1,
-0.4793078, -0.1951842, 0.131382, 0, 0, 0, 1, 1,
-0.4792858, -0.4747264, -2.658947, 1, 1, 1, 1, 1,
-0.4719976, 0.07631163, -2.981879, 1, 1, 1, 1, 1,
-0.4693896, -0.6535164, -0.489068, 1, 1, 1, 1, 1,
-0.4688583, 0.6428929, -0.710816, 1, 1, 1, 1, 1,
-0.4686407, -1.052689, -2.612033, 1, 1, 1, 1, 1,
-0.4655822, 0.8659622, -0.6653274, 1, 1, 1, 1, 1,
-0.4643668, -1.656581, -3.129695, 1, 1, 1, 1, 1,
-0.464306, -0.3604012, -3.771571, 1, 1, 1, 1, 1,
-0.4616221, -2.930719, -3.246087, 1, 1, 1, 1, 1,
-0.4616068, -0.754814, -3.027068, 1, 1, 1, 1, 1,
-0.4597597, -0.5934329, -4.863883, 1, 1, 1, 1, 1,
-0.4522131, 0.421082, -1.187652, 1, 1, 1, 1, 1,
-0.4470254, -0.6761647, -3.412188, 1, 1, 1, 1, 1,
-0.4422034, -1.694539, -3.399452, 1, 1, 1, 1, 1,
-0.4402786, 1.132815, -1.203015, 1, 1, 1, 1, 1,
-0.4392199, 0.1746, -0.8156877, 0, 0, 1, 1, 1,
-0.4382427, -0.9303923, -2.089782, 1, 0, 0, 1, 1,
-0.4371373, 1.859046, -0.6584136, 1, 0, 0, 1, 1,
-0.4322214, -0.1461152, -1.873842, 1, 0, 0, 1, 1,
-0.4280634, -1.183959, -2.711594, 1, 0, 0, 1, 1,
-0.4275839, 0.9926506, -1.382833, 1, 0, 0, 1, 1,
-0.4237583, -0.1654028, -2.762716, 0, 0, 0, 1, 1,
-0.4221305, 0.2570648, -1.418885, 0, 0, 0, 1, 1,
-0.4207435, 1.171839, 1.004899, 0, 0, 0, 1, 1,
-0.418815, -0.02334396, -0.5461292, 0, 0, 0, 1, 1,
-0.4164312, -1.360525, -3.425021, 0, 0, 0, 1, 1,
-0.4157297, 0.7801958, -0.04881794, 0, 0, 0, 1, 1,
-0.412564, -1.282292, -2.953276, 0, 0, 0, 1, 1,
-0.4122843, 0.1300072, -1.146176, 1, 1, 1, 1, 1,
-0.4104364, 0.4783409, 0.6620865, 1, 1, 1, 1, 1,
-0.4046384, 0.06853387, -1.803662, 1, 1, 1, 1, 1,
-0.4034775, 0.1252126, 0.6117494, 1, 1, 1, 1, 1,
-0.4034324, -0.7177113, -0.7642209, 1, 1, 1, 1, 1,
-0.3998017, -1.286753, -1.794271, 1, 1, 1, 1, 1,
-0.3945914, 0.9728103, -0.1837987, 1, 1, 1, 1, 1,
-0.3938334, 0.9583048, -1.050485, 1, 1, 1, 1, 1,
-0.3902674, 0.6065271, 0.05576142, 1, 1, 1, 1, 1,
-0.3850312, 0.7934379, -1.011889, 1, 1, 1, 1, 1,
-0.3847438, -0.9933547, -3.698472, 1, 1, 1, 1, 1,
-0.3800683, -2.235421, -1.277349, 1, 1, 1, 1, 1,
-0.3795643, -0.8777539, -2.637975, 1, 1, 1, 1, 1,
-0.3785432, -0.7416726, -1.601154, 1, 1, 1, 1, 1,
-0.3683774, 0.1628081, -1.915273, 1, 1, 1, 1, 1,
-0.3664371, 0.5420269, -0.3200919, 0, 0, 1, 1, 1,
-0.3585351, -1.359813, -3.853428, 1, 0, 0, 1, 1,
-0.3517494, -1.272838, -2.383568, 1, 0, 0, 1, 1,
-0.3486843, -0.08825274, -2.653171, 1, 0, 0, 1, 1,
-0.3482058, -1.830563, -4.306821, 1, 0, 0, 1, 1,
-0.3473596, 0.3188172, -1.689064, 1, 0, 0, 1, 1,
-0.3437553, 1.356494, 1.518444, 0, 0, 0, 1, 1,
-0.3437453, -0.03380017, 0.8967226, 0, 0, 0, 1, 1,
-0.3423587, 0.4727113, -0.9955014, 0, 0, 0, 1, 1,
-0.3418259, -0.46557, -4.16179, 0, 0, 0, 1, 1,
-0.3412144, 1.239129, -1.326463, 0, 0, 0, 1, 1,
-0.3411935, 0.8790035, -1.152384, 0, 0, 0, 1, 1,
-0.340745, 0.4491017, -0.9784912, 0, 0, 0, 1, 1,
-0.3269179, -1.119624, -2.458498, 1, 1, 1, 1, 1,
-0.3233421, 1.519438, -0.8074923, 1, 1, 1, 1, 1,
-0.3203707, 0.2846575, -0.3890933, 1, 1, 1, 1, 1,
-0.3199882, 0.3665525, -0.2563844, 1, 1, 1, 1, 1,
-0.3196402, 0.4640874, -0.0685421, 1, 1, 1, 1, 1,
-0.3195646, 0.3868622, 0.05878581, 1, 1, 1, 1, 1,
-0.3191397, 0.08283965, -0.9444577, 1, 1, 1, 1, 1,
-0.316794, -0.05203899, 1.427177, 1, 1, 1, 1, 1,
-0.3149651, 1.176804, 0.4042696, 1, 1, 1, 1, 1,
-0.3140646, -1.065844, -1.208562, 1, 1, 1, 1, 1,
-0.3115189, -2.881526, -3.505868, 1, 1, 1, 1, 1,
-0.3088312, -0.1709989, -1.978488, 1, 1, 1, 1, 1,
-0.3083327, 0.1442781, -1.197911, 1, 1, 1, 1, 1,
-0.3029501, 1.542396, 1.301482, 1, 1, 1, 1, 1,
-0.3029411, -0.3185821, -2.635057, 1, 1, 1, 1, 1,
-0.3029255, -0.2530688, -3.935155, 0, 0, 1, 1, 1,
-0.3003006, -1.531757, -1.687093, 1, 0, 0, 1, 1,
-0.2998795, -0.2949167, -1.800378, 1, 0, 0, 1, 1,
-0.2973126, -0.3781264, -2.086184, 1, 0, 0, 1, 1,
-0.2942607, 0.1420965, -1.106944, 1, 0, 0, 1, 1,
-0.29409, -1.079623, -2.627875, 1, 0, 0, 1, 1,
-0.2927956, 0.4123191, -0.02804475, 0, 0, 0, 1, 1,
-0.2854196, 1.048169, -1.42309, 0, 0, 0, 1, 1,
-0.2794764, -2.006906, -3.573683, 0, 0, 0, 1, 1,
-0.2763357, 1.253482, -1.884867, 0, 0, 0, 1, 1,
-0.2679472, 1.342548, 0.1481818, 0, 0, 0, 1, 1,
-0.2660065, -1.445315, -2.715888, 0, 0, 0, 1, 1,
-0.2654902, -0.05561389, -0.5533873, 0, 0, 0, 1, 1,
-0.2618293, 0.3085131, 0.485902, 1, 1, 1, 1, 1,
-0.257435, 2.315026, -1.471517, 1, 1, 1, 1, 1,
-0.2490458, -0.5286395, -3.222485, 1, 1, 1, 1, 1,
-0.2466482, -0.04569398, -0.6179988, 1, 1, 1, 1, 1,
-0.246582, 0.396313, -0.7689968, 1, 1, 1, 1, 1,
-0.2447049, -0.03569998, -0.952718, 1, 1, 1, 1, 1,
-0.2382216, -1.136687, -4.263388, 1, 1, 1, 1, 1,
-0.2380678, -0.1603038, -1.688295, 1, 1, 1, 1, 1,
-0.234619, 0.3001704, 0.09412634, 1, 1, 1, 1, 1,
-0.2336641, -1.072405, -3.312526, 1, 1, 1, 1, 1,
-0.233358, 2.204775, 0.9802365, 1, 1, 1, 1, 1,
-0.230597, 0.5572132, -0.611961, 1, 1, 1, 1, 1,
-0.2297897, 0.4004393, -1.329222, 1, 1, 1, 1, 1,
-0.2297239, 0.5132964, -0.8052317, 1, 1, 1, 1, 1,
-0.2261688, -1.428998, -3.550906, 1, 1, 1, 1, 1,
-0.2241924, 1.191095, -1.159564, 0, 0, 1, 1, 1,
-0.2185237, -0.04596958, -1.676742, 1, 0, 0, 1, 1,
-0.215656, -1.848291, -2.732645, 1, 0, 0, 1, 1,
-0.2129815, -0.4193554, -3.193681, 1, 0, 0, 1, 1,
-0.2095199, 1.444172, 0.4206356, 1, 0, 0, 1, 1,
-0.2032756, -0.1546327, -2.161956, 1, 0, 0, 1, 1,
-0.1996198, 1.527618, -0.1166235, 0, 0, 0, 1, 1,
-0.1989327, 0.4627441, -1.462012, 0, 0, 0, 1, 1,
-0.1987838, 0.8903123, -2.032331, 0, 0, 0, 1, 1,
-0.1981706, 1.60733, -2.358379, 0, 0, 0, 1, 1,
-0.192306, 1.896563, -0.4900244, 0, 0, 0, 1, 1,
-0.1907658, 1.356574, 0.4398474, 0, 0, 0, 1, 1,
-0.1823846, -0.4965369, -2.946694, 0, 0, 0, 1, 1,
-0.1774125, -0.1171905, -2.405598, 1, 1, 1, 1, 1,
-0.1761658, -0.03325287, -1.205754, 1, 1, 1, 1, 1,
-0.1759441, 0.9762344, -0.2875424, 1, 1, 1, 1, 1,
-0.1712965, -1.414816, -3.336174, 1, 1, 1, 1, 1,
-0.1680164, -0.7089397, -2.396515, 1, 1, 1, 1, 1,
-0.1563426, -0.9844505, -3.214299, 1, 1, 1, 1, 1,
-0.1562878, -0.4409445, -2.779643, 1, 1, 1, 1, 1,
-0.1555929, 0.3477517, -1.153516, 1, 1, 1, 1, 1,
-0.1545241, -1.678367, -2.229554, 1, 1, 1, 1, 1,
-0.1525592, -0.3422478, -2.411587, 1, 1, 1, 1, 1,
-0.1462307, 0.03980964, -1.735051, 1, 1, 1, 1, 1,
-0.1460688, -0.6229253, -4.15832, 1, 1, 1, 1, 1,
-0.143887, -0.8956404, -3.572938, 1, 1, 1, 1, 1,
-0.1418189, -1.729408, -3.292008, 1, 1, 1, 1, 1,
-0.1417078, 1.527234, 2.223438, 1, 1, 1, 1, 1,
-0.1402149, 0.2842959, -2.755163, 0, 0, 1, 1, 1,
-0.1394356, 0.9938979, -2.279303, 1, 0, 0, 1, 1,
-0.1357826, 0.5269001, -0.9396002, 1, 0, 0, 1, 1,
-0.1344125, -0.7211077, -2.395776, 1, 0, 0, 1, 1,
-0.1335597, -0.3489616, -2.214948, 1, 0, 0, 1, 1,
-0.1318876, 0.04488647, -2.223879, 1, 0, 0, 1, 1,
-0.127188, -0.8278025, -2.668184, 0, 0, 0, 1, 1,
-0.1232847, -1.339646, -3.813456, 0, 0, 0, 1, 1,
-0.1225853, 0.473552, 1.657858, 0, 0, 0, 1, 1,
-0.1222391, -1.320276, -4.627366, 0, 0, 0, 1, 1,
-0.1206619, 0.08608799, -1.6778, 0, 0, 0, 1, 1,
-0.1201829, -0.1245028, -2.379925, 0, 0, 0, 1, 1,
-0.1183639, 0.6327045, -0.07946139, 0, 0, 0, 1, 1,
-0.1181911, -1.355606, -1.900827, 1, 1, 1, 1, 1,
-0.1138936, 0.6227705, -1.791094, 1, 1, 1, 1, 1,
-0.1133841, -1.283499, -3.528234, 1, 1, 1, 1, 1,
-0.1104473, -0.7554089, -2.800371, 1, 1, 1, 1, 1,
-0.1023143, 1.36632, 0.4116231, 1, 1, 1, 1, 1,
-0.1021521, 0.8938127, 0.9541475, 1, 1, 1, 1, 1,
-0.1010261, -0.2389838, -1.251271, 1, 1, 1, 1, 1,
-0.09735203, -1.236463, -1.751447, 1, 1, 1, 1, 1,
-0.09697734, -0.2812707, -2.573206, 1, 1, 1, 1, 1,
-0.09655068, -0.5264669, -3.925379, 1, 1, 1, 1, 1,
-0.08971382, -1.128542, -3.581244, 1, 1, 1, 1, 1,
-0.08930096, 0.4802744, -1.455017, 1, 1, 1, 1, 1,
-0.08877163, -0.1849027, -1.4783, 1, 1, 1, 1, 1,
-0.08464498, 0.3212398, 0.9488131, 1, 1, 1, 1, 1,
-0.07978167, 0.05601604, -0.08079212, 1, 1, 1, 1, 1,
-0.0784026, 0.7037693, -0.917698, 0, 0, 1, 1, 1,
-0.07633453, -1.065848, -2.472151, 1, 0, 0, 1, 1,
-0.07179523, -0.006992879, -2.007091, 1, 0, 0, 1, 1,
-0.07108995, 0.7307763, -0.1024736, 1, 0, 0, 1, 1,
-0.06908108, -0.256381, -3.04485, 1, 0, 0, 1, 1,
-0.0686897, -0.4718015, -3.283549, 1, 0, 0, 1, 1,
-0.06563442, 0.04176891, -0.8286077, 0, 0, 0, 1, 1,
-0.06394812, 0.703284, 1.354647, 0, 0, 0, 1, 1,
-0.06298117, -1.541607, -1.920392, 0, 0, 0, 1, 1,
-0.06109635, -0.2993814, -3.69892, 0, 0, 0, 1, 1,
-0.05971606, 0.3303272, -1.137926, 0, 0, 0, 1, 1,
-0.05650013, 1.619461, -1.178084, 0, 0, 0, 1, 1,
-0.05092242, -0.6346797, -4.930598, 0, 0, 0, 1, 1,
-0.04879489, -1.936075, -4.87357, 1, 1, 1, 1, 1,
-0.04862291, -0.9706283, -3.808165, 1, 1, 1, 1, 1,
-0.04763565, -0.1900849, -3.125219, 1, 1, 1, 1, 1,
-0.04658368, 1.305656, 0.744784, 1, 1, 1, 1, 1,
-0.04371447, 0.236837, 1.345802, 1, 1, 1, 1, 1,
-0.04290098, 0.4172821, -0.4807017, 1, 1, 1, 1, 1,
-0.04224546, -0.3351055, -4.501424, 1, 1, 1, 1, 1,
-0.03566856, 0.2951104, -1.695964, 1, 1, 1, 1, 1,
-0.03081358, 0.2192868, 0.5534807, 1, 1, 1, 1, 1,
-0.03004822, 0.9089688, -1.807793, 1, 1, 1, 1, 1,
-0.0291779, 0.196071, 1.289705, 1, 1, 1, 1, 1,
-0.02855125, -1.175703, -2.19347, 1, 1, 1, 1, 1,
-0.01259215, 0.5181666, 0.3737378, 1, 1, 1, 1, 1,
-0.01175202, -1.03407, -2.1812, 1, 1, 1, 1, 1,
-0.01128142, -1.004689, -3.016432, 1, 1, 1, 1, 1,
-0.008876882, -2.598226, -4.212256, 0, 0, 1, 1, 1,
-0.006215405, -0.06203345, -3.024848, 1, 0, 0, 1, 1,
-0.004031677, -0.5568253, -4.061836, 1, 0, 0, 1, 1,
-0.003669462, -0.3948361, -1.688495, 1, 0, 0, 1, 1,
-0.0006731083, -0.7508741, -3.630522, 1, 0, 0, 1, 1,
0.00252302, 0.8307177, 0.02788891, 1, 0, 0, 1, 1,
0.004402207, -0.1529005, 3.163642, 0, 0, 0, 1, 1,
0.006190046, 1.202632, 0.4679117, 0, 0, 0, 1, 1,
0.007951766, -0.3765374, 2.594377, 0, 0, 0, 1, 1,
0.01102223, -1.939655, 4.631346, 0, 0, 0, 1, 1,
0.0143502, -0.9513581, 2.296391, 0, 0, 0, 1, 1,
0.02758217, 0.6237658, 1.170092, 0, 0, 0, 1, 1,
0.02823595, -1.442503, 3.639042, 0, 0, 0, 1, 1,
0.03039329, -0.9870635, 4.329192, 1, 1, 1, 1, 1,
0.03293128, -0.09504366, 2.393614, 1, 1, 1, 1, 1,
0.03482121, 1.405063, 0.5865885, 1, 1, 1, 1, 1,
0.03735337, -0.3128274, 3.283725, 1, 1, 1, 1, 1,
0.04003073, 1.60003, -0.5136488, 1, 1, 1, 1, 1,
0.04054434, 0.2303398, -1.317136, 1, 1, 1, 1, 1,
0.04406896, -0.9142075, 4.462419, 1, 1, 1, 1, 1,
0.04425199, -0.6618699, 2.449001, 1, 1, 1, 1, 1,
0.04463537, -0.6988568, 3.554971, 1, 1, 1, 1, 1,
0.04549482, 0.4465645, -0.2174461, 1, 1, 1, 1, 1,
0.04551522, -1.807346, 2.555095, 1, 1, 1, 1, 1,
0.04615542, 0.6942402, -0.4168284, 1, 1, 1, 1, 1,
0.04743273, 0.2431816, -1.230809, 1, 1, 1, 1, 1,
0.0490121, 0.1782146, 0.4010222, 1, 1, 1, 1, 1,
0.05176918, 2.085722, -1.010797, 1, 1, 1, 1, 1,
0.05348631, -0.7401359, 1.513818, 0, 0, 1, 1, 1,
0.05873926, -1.552303, 4.251538, 1, 0, 0, 1, 1,
0.05934509, -0.499368, 2.755126, 1, 0, 0, 1, 1,
0.06145457, 0.7777088, 0.8577756, 1, 0, 0, 1, 1,
0.06289992, 2.246094, -0.2350833, 1, 0, 0, 1, 1,
0.06322532, 0.9106142, 1.41752, 1, 0, 0, 1, 1,
0.06424004, 0.2512546, -0.2357408, 0, 0, 0, 1, 1,
0.07229213, 0.3890903, -1.385155, 0, 0, 0, 1, 1,
0.0730815, 0.873704, -1.010454, 0, 0, 0, 1, 1,
0.07474273, 1.060789, 2.632007, 0, 0, 0, 1, 1,
0.07488689, 0.8272528, -1.008866, 0, 0, 0, 1, 1,
0.07622633, 1.866164, -1.6983, 0, 0, 0, 1, 1,
0.07738712, -0.6232632, 3.532385, 0, 0, 0, 1, 1,
0.07917796, 0.1556489, 0.8727794, 1, 1, 1, 1, 1,
0.08208989, -0.5958526, 4.002588, 1, 1, 1, 1, 1,
0.08446746, 0.413379, -0.0535208, 1, 1, 1, 1, 1,
0.08460852, -0.2449039, 1.001166, 1, 1, 1, 1, 1,
0.08835252, -1.382063, 1.985034, 1, 1, 1, 1, 1,
0.09045018, -1.216801, 2.912791, 1, 1, 1, 1, 1,
0.1045746, 0.1382722, 1.377253, 1, 1, 1, 1, 1,
0.1046303, -0.1817086, 2.651588, 1, 1, 1, 1, 1,
0.1061877, -0.9817012, 2.536632, 1, 1, 1, 1, 1,
0.1073206, 2.112615, -1.359311, 1, 1, 1, 1, 1,
0.1080537, 2.535443, 0.9953602, 1, 1, 1, 1, 1,
0.1094308, -0.9261423, 3.550051, 1, 1, 1, 1, 1,
0.1104655, 0.7006262, 0.770849, 1, 1, 1, 1, 1,
0.1108575, -0.6478986, 2.832721, 1, 1, 1, 1, 1,
0.1184649, 0.432515, -1.205983, 1, 1, 1, 1, 1,
0.1278273, -0.8490493, 6.013443, 0, 0, 1, 1, 1,
0.1288073, 0.5033284, 0.7972796, 1, 0, 0, 1, 1,
0.1301811, 0.7209495, -0.5408837, 1, 0, 0, 1, 1,
0.132856, 0.7293995, -0.5999704, 1, 0, 0, 1, 1,
0.1337295, -0.1624896, 2.101114, 1, 0, 0, 1, 1,
0.1343742, -0.8405852, 2.465592, 1, 0, 0, 1, 1,
0.1353501, 0.1242701, -0.5103724, 0, 0, 0, 1, 1,
0.1373984, 1.361512, -0.4640508, 0, 0, 0, 1, 1,
0.1406183, -0.1611115, 0.5932826, 0, 0, 0, 1, 1,
0.1442558, -0.3542787, 2.539857, 0, 0, 0, 1, 1,
0.1466806, 0.239826, -0.7388799, 0, 0, 0, 1, 1,
0.1493372, -0.4387246, 2.097696, 0, 0, 0, 1, 1,
0.1504318, -0.001101952, 1.405244, 0, 0, 0, 1, 1,
0.1526914, -0.3203171, 2.936168, 1, 1, 1, 1, 1,
0.1533912, 0.3114359, -0.5222158, 1, 1, 1, 1, 1,
0.1534247, -0.2312305, 0.9183978, 1, 1, 1, 1, 1,
0.1547724, 0.9090576, 0.9243988, 1, 1, 1, 1, 1,
0.1561831, -0.3059624, 2.328061, 1, 1, 1, 1, 1,
0.1584865, 0.3755691, -0.0212159, 1, 1, 1, 1, 1,
0.16054, -2.298527, 2.134214, 1, 1, 1, 1, 1,
0.1607399, 0.2118936, -0.232528, 1, 1, 1, 1, 1,
0.1614338, -1.277857, 3.761971, 1, 1, 1, 1, 1,
0.1640058, -0.5556498, 3.927914, 1, 1, 1, 1, 1,
0.1666904, -2.501925, 2.575058, 1, 1, 1, 1, 1,
0.1714995, -1.470451, 2.836432, 1, 1, 1, 1, 1,
0.1735736, 0.3459834, 1.036103, 1, 1, 1, 1, 1,
0.1763253, 0.7632791, 0.798393, 1, 1, 1, 1, 1,
0.1787731, 1.589351, 0.1542321, 1, 1, 1, 1, 1,
0.1803195, -0.415186, 4.112207, 0, 0, 1, 1, 1,
0.1814203, -2.611962, 3.490857, 1, 0, 0, 1, 1,
0.1823481, -1.708959, 2.561955, 1, 0, 0, 1, 1,
0.189831, -0.3955587, -0.2706114, 1, 0, 0, 1, 1,
0.1905719, -0.5377508, 2.743951, 1, 0, 0, 1, 1,
0.1996303, 1.390155, 0.3371263, 1, 0, 0, 1, 1,
0.2003734, -0.600357, 2.978081, 0, 0, 0, 1, 1,
0.2004368, 1.98165, 1.108647, 0, 0, 0, 1, 1,
0.2050811, -1.033516, 2.199298, 0, 0, 0, 1, 1,
0.2071623, 0.3556494, 0.3466969, 0, 0, 0, 1, 1,
0.2094467, 0.1436254, 0.2127719, 0, 0, 0, 1, 1,
0.2094478, 2.014766, 0.4313912, 0, 0, 0, 1, 1,
0.2107272, 0.5888503, 2.413826, 0, 0, 0, 1, 1,
0.2123728, -1.717273, 3.047001, 1, 1, 1, 1, 1,
0.2124095, 0.8824015, -0.9263274, 1, 1, 1, 1, 1,
0.2128596, -0.08514787, 0.8996763, 1, 1, 1, 1, 1,
0.2131643, 1.081731, -0.1695231, 1, 1, 1, 1, 1,
0.2144204, 1.415894, 0.09560072, 1, 1, 1, 1, 1,
0.2219514, 0.9879429, 1.239679, 1, 1, 1, 1, 1,
0.2243669, 1.075235, -0.5542154, 1, 1, 1, 1, 1,
0.2243899, -0.8084952, 3.050404, 1, 1, 1, 1, 1,
0.2249547, 0.4864278, -0.4195626, 1, 1, 1, 1, 1,
0.2267298, -1.669285, 2.093811, 1, 1, 1, 1, 1,
0.2295964, 0.06729918, 1.709566, 1, 1, 1, 1, 1,
0.2320041, 1.148994, -0.4963647, 1, 1, 1, 1, 1,
0.2348827, -0.6427441, 3.742572, 1, 1, 1, 1, 1,
0.2351639, 0.5904668, 0.832494, 1, 1, 1, 1, 1,
0.2366462, -1.771294, 4.080839, 1, 1, 1, 1, 1,
0.2368035, -0.369233, 0.5740047, 0, 0, 1, 1, 1,
0.2381097, 0.7312451, -0.4001917, 1, 0, 0, 1, 1,
0.2398311, 0.913224, -0.3762562, 1, 0, 0, 1, 1,
0.239949, -0.08857886, 0.8388103, 1, 0, 0, 1, 1,
0.2487364, 1.0899, -0.6808178, 1, 0, 0, 1, 1,
0.2516312, -1.464026, 3.437828, 1, 0, 0, 1, 1,
0.2521854, -1.715857, 2.060272, 0, 0, 0, 1, 1,
0.2545155, -0.4525971, 1.424039, 0, 0, 0, 1, 1,
0.2558957, 1.300039, 2.300114, 0, 0, 0, 1, 1,
0.25808, -1.935984, 3.779339, 0, 0, 0, 1, 1,
0.2598612, -1.963708, 2.762128, 0, 0, 0, 1, 1,
0.265119, 0.3745258, -0.6638686, 0, 0, 0, 1, 1,
0.2651985, 1.59888, 1.447971, 0, 0, 0, 1, 1,
0.2665785, 2.369506, -0.3900784, 1, 1, 1, 1, 1,
0.2669632, -0.09110171, 2.39013, 1, 1, 1, 1, 1,
0.2688244, 0.8690848, 0.6191721, 1, 1, 1, 1, 1,
0.2694798, -1.365107, 3.405717, 1, 1, 1, 1, 1,
0.2698991, -0.0876684, 3.088205, 1, 1, 1, 1, 1,
0.2719734, -0.3538426, 0.3349076, 1, 1, 1, 1, 1,
0.2744352, 0.3829956, 1.438342, 1, 1, 1, 1, 1,
0.2787109, -0.6675954, 1.305731, 1, 1, 1, 1, 1,
0.287356, 1.148423, 1.057758, 1, 1, 1, 1, 1,
0.288779, -0.671037, 2.794357, 1, 1, 1, 1, 1,
0.3016414, 0.7773016, 1.354823, 1, 1, 1, 1, 1,
0.3030479, -0.4123405, 3.465971, 1, 1, 1, 1, 1,
0.3056918, 0.2391383, 1.388263, 1, 1, 1, 1, 1,
0.3064462, 0.8318687, 0.3715933, 1, 1, 1, 1, 1,
0.3084852, 1.378107, 0.9076611, 1, 1, 1, 1, 1,
0.3096493, 1.174937, -0.6986783, 0, 0, 1, 1, 1,
0.3107555, -1.812416, 3.367949, 1, 0, 0, 1, 1,
0.3157829, -0.03960203, 2.248318, 1, 0, 0, 1, 1,
0.3165136, -0.2080126, 0.1667963, 1, 0, 0, 1, 1,
0.3191152, 1.834561, 0.1031997, 1, 0, 0, 1, 1,
0.3230898, 1.112675, 0.5325162, 1, 0, 0, 1, 1,
0.3236882, 0.5192231, 1.161388, 0, 0, 0, 1, 1,
0.3245872, -0.382489, 2.397689, 0, 0, 0, 1, 1,
0.3271788, -0.5314671, 4.136075, 0, 0, 0, 1, 1,
0.3320454, 0.005848389, 2.570041, 0, 0, 0, 1, 1,
0.3320937, -1.564947, 4.424823, 0, 0, 0, 1, 1,
0.334815, 0.6308421, 0.118746, 0, 0, 0, 1, 1,
0.3399571, -0.372082, 3.808262, 0, 0, 0, 1, 1,
0.341296, -0.506391, 1.462434, 1, 1, 1, 1, 1,
0.3423607, 1.585795, -0.02680586, 1, 1, 1, 1, 1,
0.3430031, -0.06677818, 1.833418, 1, 1, 1, 1, 1,
0.3432434, 1.53146, 0.372221, 1, 1, 1, 1, 1,
0.34664, -0.2069362, -0.162616, 1, 1, 1, 1, 1,
0.3510722, 0.9684115, 0.9242683, 1, 1, 1, 1, 1,
0.3519273, 1.733514, 1.221568, 1, 1, 1, 1, 1,
0.356189, 1.870091, 0.7325537, 1, 1, 1, 1, 1,
0.3593497, 0.4237212, 0.4495888, 1, 1, 1, 1, 1,
0.3652371, 0.2701096, -0.2896347, 1, 1, 1, 1, 1,
0.3679529, -0.0275769, 0.584915, 1, 1, 1, 1, 1,
0.3747689, -0.3687485, 2.425485, 1, 1, 1, 1, 1,
0.376385, 0.1794406, 0.9174691, 1, 1, 1, 1, 1,
0.3772452, -0.213211, 2.130756, 1, 1, 1, 1, 1,
0.3774877, -0.0451609, 2.252555, 1, 1, 1, 1, 1,
0.3806741, 0.2398195, 1.834953, 0, 0, 1, 1, 1,
0.3816335, -0.1748953, 2.071041, 1, 0, 0, 1, 1,
0.3818432, -0.142569, 1.144668, 1, 0, 0, 1, 1,
0.3857778, 1.96946, -0.5410184, 1, 0, 0, 1, 1,
0.3874992, -1.885405, 3.181603, 1, 0, 0, 1, 1,
0.3893554, 0.8260405, 1.11978, 1, 0, 0, 1, 1,
0.3918416, -1.149755, 2.169819, 0, 0, 0, 1, 1,
0.3921807, 0.7183523, -0.7782137, 0, 0, 0, 1, 1,
0.4027664, -2.247966, 2.149374, 0, 0, 0, 1, 1,
0.4043339, 1.773346, -1.240463, 0, 0, 0, 1, 1,
0.409327, -0.4543251, 2.323283, 0, 0, 0, 1, 1,
0.4101872, -0.78824, 2.802462, 0, 0, 0, 1, 1,
0.4106405, -0.3470624, 2.860555, 0, 0, 0, 1, 1,
0.4130708, 0.2422048, 1.331707, 1, 1, 1, 1, 1,
0.4148079, 0.3094445, 0.389064, 1, 1, 1, 1, 1,
0.4158745, -0.02126236, 1.805529, 1, 1, 1, 1, 1,
0.4161331, 0.6437511, 0.4639024, 1, 1, 1, 1, 1,
0.4170673, 1.104018, 0.1911517, 1, 1, 1, 1, 1,
0.4210908, 0.3309141, 0.9503968, 1, 1, 1, 1, 1,
0.4295271, -1.227289, 2.419982, 1, 1, 1, 1, 1,
0.4328458, -0.003584289, 0.8739398, 1, 1, 1, 1, 1,
0.4336211, 1.262829, -0.02590952, 1, 1, 1, 1, 1,
0.4352134, 0.3413833, 3.128544, 1, 1, 1, 1, 1,
0.4392347, -1.186907, 1.029905, 1, 1, 1, 1, 1,
0.4462858, 1.461408, -2.1918, 1, 1, 1, 1, 1,
0.4480269, -0.2010924, -0.2771583, 1, 1, 1, 1, 1,
0.4504174, 1.175379, 2.276638, 1, 1, 1, 1, 1,
0.4560057, -0.9631304, 3.767751, 1, 1, 1, 1, 1,
0.4580095, -0.6034849, 2.820185, 0, 0, 1, 1, 1,
0.4584168, -1.241588, 2.588132, 1, 0, 0, 1, 1,
0.463706, -0.1384531, 3.301051, 1, 0, 0, 1, 1,
0.4641634, 1.269908, -0.2062717, 1, 0, 0, 1, 1,
0.4730228, -0.706814, 2.090635, 1, 0, 0, 1, 1,
0.4735702, -0.5114318, 0.8114747, 1, 0, 0, 1, 1,
0.4759621, 0.26454, 0.7650178, 0, 0, 0, 1, 1,
0.4781519, 0.5569045, 1.619848, 0, 0, 0, 1, 1,
0.4785122, -1.19131, 2.056118, 0, 0, 0, 1, 1,
0.4796601, -1.485624, 1.770159, 0, 0, 0, 1, 1,
0.4804786, -2.8547, 5.047398, 0, 0, 0, 1, 1,
0.4820529, -0.8799461, 4.385868, 0, 0, 0, 1, 1,
0.4830322, 0.9914829, 0.2342225, 0, 0, 0, 1, 1,
0.4863595, -0.2582293, 3.670973, 1, 1, 1, 1, 1,
0.4904724, 0.5797706, 0.3738863, 1, 1, 1, 1, 1,
0.4932527, 0.001681429, -0.173039, 1, 1, 1, 1, 1,
0.4937639, 0.3634301, 0.9453769, 1, 1, 1, 1, 1,
0.4960512, 2.920665, 0.1371458, 1, 1, 1, 1, 1,
0.501919, 0.5454007, 2.464997, 1, 1, 1, 1, 1,
0.505859, 0.7876523, 0.236658, 1, 1, 1, 1, 1,
0.5082185, -0.2973215, 2.845397, 1, 1, 1, 1, 1,
0.5088162, -1.35279, 1.311214, 1, 1, 1, 1, 1,
0.5121424, -0.7623341, 1.684895, 1, 1, 1, 1, 1,
0.5123457, -0.8548456, 2.098699, 1, 1, 1, 1, 1,
0.5135018, 0.06989032, 1.102392, 1, 1, 1, 1, 1,
0.51499, -1.137131, 3.607105, 1, 1, 1, 1, 1,
0.5150412, 0.4291102, 0.02202415, 1, 1, 1, 1, 1,
0.5156469, -1.261282, 0.551801, 1, 1, 1, 1, 1,
0.5221831, 0.5097219, 1.029052, 0, 0, 1, 1, 1,
0.5222682, -1.09633, 0.8613642, 1, 0, 0, 1, 1,
0.5275491, 0.5550673, -0.07999423, 1, 0, 0, 1, 1,
0.5280857, 0.4613619, 1.361359, 1, 0, 0, 1, 1,
0.5319003, 2.146781, 0.5996758, 1, 0, 0, 1, 1,
0.5347313, -1.170142, 2.462015, 1, 0, 0, 1, 1,
0.5402312, 1.345504, 0.4957684, 0, 0, 0, 1, 1,
0.5455828, -0.1091614, 2.293472, 0, 0, 0, 1, 1,
0.5474256, 0.5252053, 0.8362032, 0, 0, 0, 1, 1,
0.5500814, -0.09101021, 2.721791, 0, 0, 0, 1, 1,
0.5513243, 1.807002, -1.007435, 0, 0, 0, 1, 1,
0.5538198, 0.8873366, -0.486285, 0, 0, 0, 1, 1,
0.5543129, 0.1348908, 0.1129735, 0, 0, 0, 1, 1,
0.5617602, -0.009252308, 1.263592, 1, 1, 1, 1, 1,
0.5621936, 0.4288483, 1.574031, 1, 1, 1, 1, 1,
0.5668054, 1.287005, 0.510362, 1, 1, 1, 1, 1,
0.568512, -0.9921784, 1.850159, 1, 1, 1, 1, 1,
0.5692299, 1.137184, -0.1280686, 1, 1, 1, 1, 1,
0.5707473, -0.105467, 2.696927, 1, 1, 1, 1, 1,
0.5746935, -0.410256, 1.655592, 1, 1, 1, 1, 1,
0.5880606, 0.669206, 0.551208, 1, 1, 1, 1, 1,
0.590657, 0.09999757, 1.988194, 1, 1, 1, 1, 1,
0.597464, -1.008693, 1.852804, 1, 1, 1, 1, 1,
0.6002092, -0.4569767, 2.802465, 1, 1, 1, 1, 1,
0.6003477, 0.5838902, 1.851326, 1, 1, 1, 1, 1,
0.6015393, -0.6359707, 3.468617, 1, 1, 1, 1, 1,
0.6055469, -1.687484, 0.8189667, 1, 1, 1, 1, 1,
0.6071084, 1.245204, 1.680609, 1, 1, 1, 1, 1,
0.6088096, 0.8197278, 1.371136, 0, 0, 1, 1, 1,
0.6095958, -0.1117649, 1.280503, 1, 0, 0, 1, 1,
0.6099558, -0.7629898, 3.275304, 1, 0, 0, 1, 1,
0.6160427, -2.449371, 4.183323, 1, 0, 0, 1, 1,
0.617175, 1.640608, 0.9167051, 1, 0, 0, 1, 1,
0.6184208, -0.3431997, 2.945581, 1, 0, 0, 1, 1,
0.6185961, -0.648023, 3.055579, 0, 0, 0, 1, 1,
0.6255525, 0.8818786, 0.5999998, 0, 0, 0, 1, 1,
0.6257278, 1.198162, -0.04196424, 0, 0, 0, 1, 1,
0.6264564, -1.745875, 2.72312, 0, 0, 0, 1, 1,
0.6284521, 0.3812716, -1.771269, 0, 0, 0, 1, 1,
0.6333339, 0.9987357, -0.3030949, 0, 0, 0, 1, 1,
0.6367285, -0.07541237, 1.876233, 0, 0, 0, 1, 1,
0.6371214, 1.701584, -1.304659, 1, 1, 1, 1, 1,
0.6385303, -0.9331025, 2.874366, 1, 1, 1, 1, 1,
0.6394306, -0.2127278, 1.961688, 1, 1, 1, 1, 1,
0.6401706, -3.076585, 2.507843, 1, 1, 1, 1, 1,
0.6423384, -0.6061797, 2.077047, 1, 1, 1, 1, 1,
0.6437633, -0.3948866, 3.478389, 1, 1, 1, 1, 1,
0.6482286, 0.5138391, 1.501385, 1, 1, 1, 1, 1,
0.6531709, -0.1561703, 0.40159, 1, 1, 1, 1, 1,
0.6564732, -0.304078, -0.4456803, 1, 1, 1, 1, 1,
0.6577464, 0.3179063, 1.926715, 1, 1, 1, 1, 1,
0.660167, 1.819061, -0.471991, 1, 1, 1, 1, 1,
0.6641017, 0.8659741, 0.3296019, 1, 1, 1, 1, 1,
0.6685085, -0.4467777, 0.5366337, 1, 1, 1, 1, 1,
0.6725311, 1.250953, 1.218476, 1, 1, 1, 1, 1,
0.6810263, -0.1351434, 0.5126987, 1, 1, 1, 1, 1,
0.6821713, -1.955856, 3.320993, 0, 0, 1, 1, 1,
0.6888738, 1.293179, -0.6185313, 1, 0, 0, 1, 1,
0.6935012, -0.3720317, 2.272067, 1, 0, 0, 1, 1,
0.6985487, -1.137868, 1.427258, 1, 0, 0, 1, 1,
0.7008682, -0.1790539, 2.009174, 1, 0, 0, 1, 1,
0.7017028, 1.168926, 1.234867, 1, 0, 0, 1, 1,
0.7127976, 0.2000848, 2.497243, 0, 0, 0, 1, 1,
0.733277, 0.7558424, 1.863392, 0, 0, 0, 1, 1,
0.7337883, 2.314174, -0.1537513, 0, 0, 0, 1, 1,
0.7353179, -0.09673547, 0.200954, 0, 0, 0, 1, 1,
0.7428803, 0.1794511, 1.240046, 0, 0, 0, 1, 1,
0.7431214, -0.7387388, 4.385136, 0, 0, 0, 1, 1,
0.7460426, 0.1284807, 2.331334, 0, 0, 0, 1, 1,
0.7467254, 1.240548, -0.3513665, 1, 1, 1, 1, 1,
0.7524493, 0.6651326, 2.477458, 1, 1, 1, 1, 1,
0.7594141, 1.631006, 0.0568412, 1, 1, 1, 1, 1,
0.7646183, -0.3054581, 1.193528, 1, 1, 1, 1, 1,
0.7673265, 0.44344, -0.04407657, 1, 1, 1, 1, 1,
0.7723616, -0.02245882, 3.18834, 1, 1, 1, 1, 1,
0.7744016, 0.8059675, 2.20594, 1, 1, 1, 1, 1,
0.7784589, 0.7817348, 0.5999541, 1, 1, 1, 1, 1,
0.785477, 0.006270512, 0.8709053, 1, 1, 1, 1, 1,
0.7887664, -0.1714827, 2.813369, 1, 1, 1, 1, 1,
0.7940879, 0.800718, 0.1824328, 1, 1, 1, 1, 1,
0.7941139, -0.6780542, 2.860846, 1, 1, 1, 1, 1,
0.7951368, 0.8967331, 1.666533, 1, 1, 1, 1, 1,
0.802703, 0.5834323, -0.2419478, 1, 1, 1, 1, 1,
0.8043298, 0.9348237, 1.544256, 1, 1, 1, 1, 1,
0.8060539, -0.3372509, 2.218572, 0, 0, 1, 1, 1,
0.8068528, -0.07989004, 1.815635, 1, 0, 0, 1, 1,
0.8072848, 1.164317, 1.152129, 1, 0, 0, 1, 1,
0.8083603, -0.3793289, 0.8919537, 1, 0, 0, 1, 1,
0.8104547, -0.4910727, 0.9876768, 1, 0, 0, 1, 1,
0.8193004, -0.2950332, 2.381756, 1, 0, 0, 1, 1,
0.8193656, -0.06021362, 1.222897, 0, 0, 0, 1, 1,
0.820336, 0.4949006, -0.3100107, 0, 0, 0, 1, 1,
0.8265589, 0.4012404, 1.417516, 0, 0, 0, 1, 1,
0.8271133, -0.715472, 3.630727, 0, 0, 0, 1, 1,
0.8286573, 0.290904, 0.6455685, 0, 0, 0, 1, 1,
0.8369297, 0.2073976, 0.05663573, 0, 0, 0, 1, 1,
0.8420444, 0.8736276, 1.611048, 0, 0, 0, 1, 1,
0.8429573, 0.6501526, 1.46596, 1, 1, 1, 1, 1,
0.8436982, 0.5805962, 1.982687, 1, 1, 1, 1, 1,
0.8484169, 1.628999, 0.5976764, 1, 1, 1, 1, 1,
0.8487105, 1.530292, 2.241617, 1, 1, 1, 1, 1,
0.8567817, -0.04556505, 0.2171797, 1, 1, 1, 1, 1,
0.8651479, 1.759687, -1.565551, 1, 1, 1, 1, 1,
0.8686423, 0.8829018, -0.0806384, 1, 1, 1, 1, 1,
0.8714202, -0.4004407, 2.387036, 1, 1, 1, 1, 1,
0.8746177, -2.115521, 1.606115, 1, 1, 1, 1, 1,
0.8904754, -1.024098, 2.518795, 1, 1, 1, 1, 1,
0.8909066, -0.3785993, 2.693049, 1, 1, 1, 1, 1,
0.8969827, -2.06573, 2.666526, 1, 1, 1, 1, 1,
0.9016766, -0.978817, 0.7959729, 1, 1, 1, 1, 1,
0.9066556, 0.7878301, 0.3344059, 1, 1, 1, 1, 1,
0.9073359, 0.9577837, -0.7787919, 1, 1, 1, 1, 1,
0.9079518, 0.6925972, 1.323308, 0, 0, 1, 1, 1,
0.9100464, 1.048571, 0.9805061, 1, 0, 0, 1, 1,
0.9109461, 1.188599, 1.505673, 1, 0, 0, 1, 1,
0.9118345, 1.149255, 1.680163, 1, 0, 0, 1, 1,
0.913949, 0.4243935, 1.108401, 1, 0, 0, 1, 1,
0.9153363, -1.471421, 3.193651, 1, 0, 0, 1, 1,
0.9187287, -0.2856558, 1.943285, 0, 0, 0, 1, 1,
0.9217032, -2.045449, 1.627625, 0, 0, 0, 1, 1,
0.9222922, -0.4592148, 2.14521, 0, 0, 0, 1, 1,
0.9226863, 0.08153313, 0.5343853, 0, 0, 0, 1, 1,
0.9248761, -1.01932, 2.911031, 0, 0, 0, 1, 1,
0.9270629, -0.773932, 2.261196, 0, 0, 0, 1, 1,
0.9327089, -0.4296002, 2.364913, 0, 0, 0, 1, 1,
0.9336321, 0.1637858, 2.049124, 1, 1, 1, 1, 1,
0.9353129, -0.05520868, 1.559254, 1, 1, 1, 1, 1,
0.9380844, -0.2543479, 2.571119, 1, 1, 1, 1, 1,
0.9396394, 1.006731, 0.02301298, 1, 1, 1, 1, 1,
0.9409943, 0.06775151, 0.9485296, 1, 1, 1, 1, 1,
0.9421018, -1.091954, 2.17079, 1, 1, 1, 1, 1,
0.9440901, -0.005432808, 2.623314, 1, 1, 1, 1, 1,
0.9455492, -0.8521651, 1.895145, 1, 1, 1, 1, 1,
0.945885, 1.008812, -0.6958742, 1, 1, 1, 1, 1,
0.9460893, 1.360733, 0.7295795, 1, 1, 1, 1, 1,
0.9551389, -0.2960189, 2.625657, 1, 1, 1, 1, 1,
0.9605151, 0.5135078, -0.7012814, 1, 1, 1, 1, 1,
0.9609411, -0.1040033, -0.1422484, 1, 1, 1, 1, 1,
0.9689471, 1.179681, 1.084365, 1, 1, 1, 1, 1,
0.9697742, 0.04471625, 1.962728, 1, 1, 1, 1, 1,
0.9765027, 1.099476, 0.5294771, 0, 0, 1, 1, 1,
0.980233, 0.5193511, 1.814427, 1, 0, 0, 1, 1,
0.9932108, -0.3335926, 2.358328, 1, 0, 0, 1, 1,
0.9966548, -0.3655057, 0.3303653, 1, 0, 0, 1, 1,
0.997791, 0.3775971, 1.473889, 1, 0, 0, 1, 1,
1.000953, 1.001399, 1.219315, 1, 0, 0, 1, 1,
1.001082, -0.8512956, 2.717997, 0, 0, 0, 1, 1,
1.007228, 0.8761992, 0.1046117, 0, 0, 0, 1, 1,
1.011275, 0.9955221, -0.2158652, 0, 0, 0, 1, 1,
1.016403, 0.143876, 0.4582454, 0, 0, 0, 1, 1,
1.018215, 0.06841323, 0.5342339, 0, 0, 0, 1, 1,
1.023203, 0.3367997, 1.663114, 0, 0, 0, 1, 1,
1.023475, -0.5508283, 1.951813, 0, 0, 0, 1, 1,
1.033225, 0.9661776, 1.657055, 1, 1, 1, 1, 1,
1.039159, 0.9913454, 0.3419296, 1, 1, 1, 1, 1,
1.047111, 0.3569663, 0.02086043, 1, 1, 1, 1, 1,
1.057091, -1.177751, 4.780591, 1, 1, 1, 1, 1,
1.058887, 0.6152713, 0.760873, 1, 1, 1, 1, 1,
1.061708, 0.2788, 0.4670382, 1, 1, 1, 1, 1,
1.064036, 0.3646494, -0.885728, 1, 1, 1, 1, 1,
1.067289, 0.8428801, 1.13939, 1, 1, 1, 1, 1,
1.06925, 0.5210932, 0.1103524, 1, 1, 1, 1, 1,
1.070199, -0.3535317, 1.159905, 1, 1, 1, 1, 1,
1.07142, -1.837965, 4.341215, 1, 1, 1, 1, 1,
1.076396, 0.1425554, 0.5068935, 1, 1, 1, 1, 1,
1.100589, -1.403729, 1.233228, 1, 1, 1, 1, 1,
1.103673, -0.3947613, 3.513793, 1, 1, 1, 1, 1,
1.109119, 0.5236131, 0.6725996, 1, 1, 1, 1, 1,
1.109709, -0.2285217, 1.752328, 0, 0, 1, 1, 1,
1.112018, 1.067536, 1.354011, 1, 0, 0, 1, 1,
1.12197, 0.6741152, 1.490445, 1, 0, 0, 1, 1,
1.122789, 0.4784003, -0.3468431, 1, 0, 0, 1, 1,
1.123037, -2.105439, 2.271658, 1, 0, 0, 1, 1,
1.124957, -1.300177, 1.833271, 1, 0, 0, 1, 1,
1.12894, 0.337249, 1.487245, 0, 0, 0, 1, 1,
1.129686, 1.862767, -0.03440891, 0, 0, 0, 1, 1,
1.132032, -0.1804618, 1.395213, 0, 0, 0, 1, 1,
1.140441, 0.5797263, 2.374094, 0, 0, 0, 1, 1,
1.145734, -0.003329583, 0.2582249, 0, 0, 0, 1, 1,
1.148246, -0.05024479, 3.444275, 0, 0, 0, 1, 1,
1.149189, 0.3851895, 0.376904, 0, 0, 0, 1, 1,
1.165989, -0.4920625, 0.9540029, 1, 1, 1, 1, 1,
1.167235, -0.3087071, 2.521917, 1, 1, 1, 1, 1,
1.179372, 0.02051675, 3.61439, 1, 1, 1, 1, 1,
1.189389, 0.1606635, 1.918926, 1, 1, 1, 1, 1,
1.191535, 0.01905295, 0.4997127, 1, 1, 1, 1, 1,
1.193231, -0.1080852, 3.057136, 1, 1, 1, 1, 1,
1.196265, 0.1463431, 2.133797, 1, 1, 1, 1, 1,
1.213176, -1.162436, 2.147489, 1, 1, 1, 1, 1,
1.214253, -0.5119426, 1.216729, 1, 1, 1, 1, 1,
1.214327, -0.2842019, 1.946724, 1, 1, 1, 1, 1,
1.216139, 0.1546227, 2.498886, 1, 1, 1, 1, 1,
1.217049, 0.3042741, 3.660215, 1, 1, 1, 1, 1,
1.217124, 0.4573408, 0.2133659, 1, 1, 1, 1, 1,
1.217342, 1.073592, 1.545233, 1, 1, 1, 1, 1,
1.226215, -0.323229, 0.8850411, 1, 1, 1, 1, 1,
1.226606, 1.07762, 2.523643, 0, 0, 1, 1, 1,
1.228188, -0.6019914, 2.93173, 1, 0, 0, 1, 1,
1.230673, 0.8358792, 0.5159313, 1, 0, 0, 1, 1,
1.242655, -1.499445, 2.684386, 1, 0, 0, 1, 1,
1.254617, 0.694554, 1.668868, 1, 0, 0, 1, 1,
1.25758, 0.2029634, 0.2804362, 1, 0, 0, 1, 1,
1.26318, 1.173743, 2.835095, 0, 0, 0, 1, 1,
1.266458, -1.02125, 2.987124, 0, 0, 0, 1, 1,
1.279006, -0.8780273, 2.990208, 0, 0, 0, 1, 1,
1.298655, -0.196888, 4.019815, 0, 0, 0, 1, 1,
1.30225, 0.8425335, 1.581576, 0, 0, 0, 1, 1,
1.305904, -0.09620048, 1.617535, 0, 0, 0, 1, 1,
1.312656, -1.053386, 0.9941226, 0, 0, 0, 1, 1,
1.313846, -0.7078837, 2.970153, 1, 1, 1, 1, 1,
1.321259, 1.314065, 1.078866, 1, 1, 1, 1, 1,
1.330851, 0.7112176, 1.733321, 1, 1, 1, 1, 1,
1.340319, 0.2046815, 0.5449918, 1, 1, 1, 1, 1,
1.343684, 0.04296336, 2.166332, 1, 1, 1, 1, 1,
1.350885, 1.68816, -0.2450966, 1, 1, 1, 1, 1,
1.35568, -0.05401691, 0.8820025, 1, 1, 1, 1, 1,
1.361614, 0.5061161, 0.740676, 1, 1, 1, 1, 1,
1.368555, 0.7377855, -0.6024736, 1, 1, 1, 1, 1,
1.370868, -2.234664, 3.406983, 1, 1, 1, 1, 1,
1.37954, 1.944608, 1.26234, 1, 1, 1, 1, 1,
1.397798, -0.8106861, 0.8725131, 1, 1, 1, 1, 1,
1.411207, 0.1542772, 2.845431, 1, 1, 1, 1, 1,
1.425465, 0.1029094, 0.9869882, 1, 1, 1, 1, 1,
1.431834, -1.096526, 0.1931601, 1, 1, 1, 1, 1,
1.441086, -0.1437985, -0.03753157, 0, 0, 1, 1, 1,
1.442031, 0.3934753, 2.663508, 1, 0, 0, 1, 1,
1.444341, -0.7801574, 1.195118, 1, 0, 0, 1, 1,
1.454878, 1.761346, 1.005435, 1, 0, 0, 1, 1,
1.455844, -0.6505402, 3.146712, 1, 0, 0, 1, 1,
1.457741, 1.306723, 0.433235, 1, 0, 0, 1, 1,
1.46501, 1.779588, 0.06979536, 0, 0, 0, 1, 1,
1.474599, -1.176831, 0.3503233, 0, 0, 0, 1, 1,
1.492828, -1.90786, 0.09434701, 0, 0, 0, 1, 1,
1.493503, -0.3066025, 2.1075, 0, 0, 0, 1, 1,
1.507255, 1.994123, 0.5614903, 0, 0, 0, 1, 1,
1.508209, -1.13098, 3.378653, 0, 0, 0, 1, 1,
1.525625, 0.4631376, 2.112818, 0, 0, 0, 1, 1,
1.531498, -1.135084, 3.868906, 1, 1, 1, 1, 1,
1.538755, 0.5676444, 1.168187, 1, 1, 1, 1, 1,
1.548284, 0.8242017, 1.605421, 1, 1, 1, 1, 1,
1.555267, 1.585497, 0.5564256, 1, 1, 1, 1, 1,
1.562624, -0.556445, 1.117892, 1, 1, 1, 1, 1,
1.562826, -1.092857, 1.03223, 1, 1, 1, 1, 1,
1.574822, 0.4354078, 0.7443916, 1, 1, 1, 1, 1,
1.5767, 1.351306, 2.765298, 1, 1, 1, 1, 1,
1.580722, 0.1569837, 1.933352, 1, 1, 1, 1, 1,
1.59462, -1.333452, 1.868823, 1, 1, 1, 1, 1,
1.601533, -0.7109687, 2.427611, 1, 1, 1, 1, 1,
1.637475, 0.561192, 2.410174, 1, 1, 1, 1, 1,
1.641048, 0.1188755, 0.8147436, 1, 1, 1, 1, 1,
1.647282, 0.1542173, 1.920103, 1, 1, 1, 1, 1,
1.663568, -1.069153, 2.383578, 1, 1, 1, 1, 1,
1.666066, 0.5274781, 2.946465, 0, 0, 1, 1, 1,
1.683646, -0.1576797, 0.5313782, 1, 0, 0, 1, 1,
1.685083, -0.1002569, 0.7367802, 1, 0, 0, 1, 1,
1.685092, -0.2110247, -0.5485916, 1, 0, 0, 1, 1,
1.689082, -0.7105621, 3.905161, 1, 0, 0, 1, 1,
1.713038, 1.147963, 0.4758362, 1, 0, 0, 1, 1,
1.727837, 0.7888756, 0.8775128, 0, 0, 0, 1, 1,
1.728642, 0.5537646, 1.703295, 0, 0, 0, 1, 1,
1.737207, 0.2116214, 0.7037517, 0, 0, 0, 1, 1,
1.740999, 0.7063336, 2.231491, 0, 0, 0, 1, 1,
1.744376, 2.326675, 0.1684634, 0, 0, 0, 1, 1,
1.767927, 0.3718768, 2.694165, 0, 0, 0, 1, 1,
1.776466, 1.357577, 0.6666139, 0, 0, 0, 1, 1,
1.795947, 1.016544, 1.245237, 1, 1, 1, 1, 1,
1.815621, 1.540462, 0.3205651, 1, 1, 1, 1, 1,
1.831967, 2.186365, 0.2863684, 1, 1, 1, 1, 1,
1.833064, 0.230986, 0.8789127, 1, 1, 1, 1, 1,
1.843883, -1.98565, 2.37622, 1, 1, 1, 1, 1,
1.852115, 0.3793032, 1.355019, 1, 1, 1, 1, 1,
1.917715, 0.1405384, 2.302186, 1, 1, 1, 1, 1,
1.927513, -2.171643, 1.731466, 1, 1, 1, 1, 1,
1.930726, -0.946153, 2.238321, 1, 1, 1, 1, 1,
1.962754, 1.409556, -0.02315423, 1, 1, 1, 1, 1,
1.997454, 0.8944716, 0.8119684, 1, 1, 1, 1, 1,
2.00949, -0.5700489, 1.684863, 1, 1, 1, 1, 1,
2.033829, 0.5692754, 1.277018, 1, 1, 1, 1, 1,
2.043848, -0.631769, 1.135225, 1, 1, 1, 1, 1,
2.071042, 0.35942, 2.934438, 1, 1, 1, 1, 1,
2.083032, -0.02628206, 2.504093, 0, 0, 1, 1, 1,
2.139845, 1.304296, -0.68831, 1, 0, 0, 1, 1,
2.163212, 0.1877547, 0.7527137, 1, 0, 0, 1, 1,
2.199333, 0.0541563, 1.878667, 1, 0, 0, 1, 1,
2.204564, 0.9056219, 2.3207, 1, 0, 0, 1, 1,
2.259929, -0.6568188, 4.063991, 1, 0, 0, 1, 1,
2.264444, 0.3231654, 1.270231, 0, 0, 0, 1, 1,
2.338156, -1.151236, 1.035267, 0, 0, 0, 1, 1,
2.354793, 1.221546, 1.792069, 0, 0, 0, 1, 1,
2.364701, -2.089922, 2.020163, 0, 0, 0, 1, 1,
2.399068, -1.158563, 1.125352, 0, 0, 0, 1, 1,
2.404407, -1.718591, 0.6438204, 0, 0, 0, 1, 1,
2.497022, -0.694563, 0.663879, 0, 0, 0, 1, 1,
2.502017, -0.5766774, 1.813696, 1, 1, 1, 1, 1,
2.524516, 0.3990277, 2.366724, 1, 1, 1, 1, 1,
2.53598, -0.162619, 0.9060326, 1, 1, 1, 1, 1,
2.724572, -0.2688854, 0.4432842, 1, 1, 1, 1, 1,
2.926914, 0.05472945, 0.36482, 1, 1, 1, 1, 1,
2.945103, 1.892198, -0.1481047, 1, 1, 1, 1, 1,
3.216206, 0.08504057, 1.693544, 1, 1, 1, 1, 1
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
var radius = 9.580246;
var distance = 33.65021;
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
mvMatrix.translate( 0.02361846, 0.07796001, -0.5414224 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.65021);
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
