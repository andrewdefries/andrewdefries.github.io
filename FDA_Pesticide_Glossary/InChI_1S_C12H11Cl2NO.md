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
-3.189509, -1.495614, -1.532071, 1, 0, 0, 1,
-2.994988, 0.4945514, -2.674816, 1, 0.007843138, 0, 1,
-2.764693, 0.6422074, -2.008518, 1, 0.01176471, 0, 1,
-2.737973, -0.381221, -2.249686, 1, 0.01960784, 0, 1,
-2.619289, 2.010204, -0.4009047, 1, 0.02352941, 0, 1,
-2.563403, -0.4021299, -2.388912, 1, 0.03137255, 0, 1,
-2.521868, -1.688314, -2.605106, 1, 0.03529412, 0, 1,
-2.463032, -0.05123781, -2.756296, 1, 0.04313726, 0, 1,
-2.437274, 0.6888767, 0.2446371, 1, 0.04705882, 0, 1,
-2.386468, 0.2133779, -2.313772, 1, 0.05490196, 0, 1,
-2.354393, -0.7407095, -3.699832, 1, 0.05882353, 0, 1,
-2.338514, -0.9437122, -3.005302, 1, 0.06666667, 0, 1,
-2.323637, 1.361266, -0.5086257, 1, 0.07058824, 0, 1,
-2.240751, -0.6079899, -0.715162, 1, 0.07843138, 0, 1,
-2.218378, 0.8062046, -1.787947, 1, 0.08235294, 0, 1,
-2.165401, -0.3219626, -1.58971, 1, 0.09019608, 0, 1,
-2.159329, 0.002209592, -1.017929, 1, 0.09411765, 0, 1,
-2.089526, -1.425789, -2.940166, 1, 0.1019608, 0, 1,
-2.044232, -0.105063, -3.28968, 1, 0.1098039, 0, 1,
-2.02651, 0.3959548, -0.7296522, 1, 0.1137255, 0, 1,
-1.988621, 1.083409, 1.149426, 1, 0.1215686, 0, 1,
-1.935755, -0.2866576, -1.766655, 1, 0.1254902, 0, 1,
-1.934802, 1.742239, -0.7393469, 1, 0.1333333, 0, 1,
-1.914689, -0.9171212, -2.206693, 1, 0.1372549, 0, 1,
-1.892603, -0.8917823, -3.835942, 1, 0.145098, 0, 1,
-1.891905, -0.2539856, -0.7826186, 1, 0.1490196, 0, 1,
-1.875938, 0.1457333, -0.244058, 1, 0.1568628, 0, 1,
-1.875254, -0.6384027, 0.4081244, 1, 0.1607843, 0, 1,
-1.849798, 0.3083502, -0.6319838, 1, 0.1686275, 0, 1,
-1.830894, 0.1706989, -1.925196, 1, 0.172549, 0, 1,
-1.829577, -1.27352, -2.901394, 1, 0.1803922, 0, 1,
-1.826197, -0.4830996, -2.024546, 1, 0.1843137, 0, 1,
-1.820416, 0.2808973, -1.698728, 1, 0.1921569, 0, 1,
-1.809874, -0.4653844, -2.072101, 1, 0.1960784, 0, 1,
-1.807098, 0.1960173, -3.624064, 1, 0.2039216, 0, 1,
-1.805992, -0.8371802, -2.197139, 1, 0.2117647, 0, 1,
-1.793826, -0.4064704, -2.613593, 1, 0.2156863, 0, 1,
-1.788733, -1.587683, -2.615317, 1, 0.2235294, 0, 1,
-1.781036, -1.143366, -2.333793, 1, 0.227451, 0, 1,
-1.779767, 2.396158, -0.9860981, 1, 0.2352941, 0, 1,
-1.7509, -0.629106, -2.962255, 1, 0.2392157, 0, 1,
-1.747134, -0.6996775, -2.140588, 1, 0.2470588, 0, 1,
-1.741716, -0.3559051, -0.4145619, 1, 0.2509804, 0, 1,
-1.734728, -0.9459389, -3.54387, 1, 0.2588235, 0, 1,
-1.717546, 0.1409775, 0.3290337, 1, 0.2627451, 0, 1,
-1.710676, -0.2790933, -1.39642, 1, 0.2705882, 0, 1,
-1.708843, -1.075356, -1.799419, 1, 0.2745098, 0, 1,
-1.699394, 0.7269686, -0.4329366, 1, 0.282353, 0, 1,
-1.695406, -0.4251981, -0.9839759, 1, 0.2862745, 0, 1,
-1.687993, -2.518835, -2.775583, 1, 0.2941177, 0, 1,
-1.680804, 0.4157504, -1.002129, 1, 0.3019608, 0, 1,
-1.678749, 0.1048346, -1.078822, 1, 0.3058824, 0, 1,
-1.677611, -0.2957242, -1.201082, 1, 0.3137255, 0, 1,
-1.672232, -0.1128596, -1.281765, 1, 0.3176471, 0, 1,
-1.672175, 0.3616541, -2.862632, 1, 0.3254902, 0, 1,
-1.6521, 1.294171, -1.168853, 1, 0.3294118, 0, 1,
-1.652076, 1.812793, -0.8573461, 1, 0.3372549, 0, 1,
-1.650433, 1.107459, -0.3461306, 1, 0.3411765, 0, 1,
-1.646403, 1.62965, 0.1325181, 1, 0.3490196, 0, 1,
-1.632165, 0.6416543, -2.690506, 1, 0.3529412, 0, 1,
-1.605706, 0.1326181, -0.4746696, 1, 0.3607843, 0, 1,
-1.605186, 0.1256506, -0.4136578, 1, 0.3647059, 0, 1,
-1.600677, 1.685634, -0.2440159, 1, 0.372549, 0, 1,
-1.578462, -1.722147, -3.41095, 1, 0.3764706, 0, 1,
-1.578099, 0.7464151, -1.11925, 1, 0.3843137, 0, 1,
-1.544174, 1.01364, 1.32003, 1, 0.3882353, 0, 1,
-1.537255, 0.556026, -1.955214, 1, 0.3960784, 0, 1,
-1.535178, -1.303404, -2.626354, 1, 0.4039216, 0, 1,
-1.531143, -0.7984498, -3.56317, 1, 0.4078431, 0, 1,
-1.524532, 0.1469643, -0.3231899, 1, 0.4156863, 0, 1,
-1.519918, 1.095185, -2.832578, 1, 0.4196078, 0, 1,
-1.500081, -0.474447, -2.55943, 1, 0.427451, 0, 1,
-1.496484, 1.252509, -1.074464, 1, 0.4313726, 0, 1,
-1.489898, -0.1695274, -1.3593, 1, 0.4392157, 0, 1,
-1.489079, 0.1809426, 0.7053046, 1, 0.4431373, 0, 1,
-1.485792, -0.3150706, -2.223689, 1, 0.4509804, 0, 1,
-1.475425, -1.677376, -3.253463, 1, 0.454902, 0, 1,
-1.464975, -0.3014202, -0.4868393, 1, 0.4627451, 0, 1,
-1.461666, -0.09281996, -1.765069, 1, 0.4666667, 0, 1,
-1.460758, -0.5181051, -2.847709, 1, 0.4745098, 0, 1,
-1.436344, 1.075039, -2.1359, 1, 0.4784314, 0, 1,
-1.422699, 0.4828151, -1.001766, 1, 0.4862745, 0, 1,
-1.41872, -0.06078598, -0.5779606, 1, 0.4901961, 0, 1,
-1.415246, 0.6844704, -0.5440664, 1, 0.4980392, 0, 1,
-1.412304, -0.4696502, -3.34101, 1, 0.5058824, 0, 1,
-1.410301, -0.5864876, -0.8964387, 1, 0.509804, 0, 1,
-1.405217, -0.01821499, -1.227021, 1, 0.5176471, 0, 1,
-1.379665, -0.320192, -1.874241, 1, 0.5215687, 0, 1,
-1.371433, 0.5191154, -0.3731239, 1, 0.5294118, 0, 1,
-1.364699, 1.43259, -1.157936, 1, 0.5333334, 0, 1,
-1.362705, -0.8147398, -2.204669, 1, 0.5411765, 0, 1,
-1.360243, 0.2367416, -0.6450969, 1, 0.5450981, 0, 1,
-1.348225, -0.4694871, -1.913086, 1, 0.5529412, 0, 1,
-1.346672, -1.641634, -1.153148, 1, 0.5568628, 0, 1,
-1.340379, -0.01125914, -0.1651541, 1, 0.5647059, 0, 1,
-1.3335, 2.451529, 0.235433, 1, 0.5686275, 0, 1,
-1.332696, -0.02463995, -0.9193607, 1, 0.5764706, 0, 1,
-1.331413, 0.3302335, -1.99108, 1, 0.5803922, 0, 1,
-1.320985, -2.222091, -2.574118, 1, 0.5882353, 0, 1,
-1.319714, 0.6807065, -0.2416955, 1, 0.5921569, 0, 1,
-1.319132, -0.01183435, -1.642572, 1, 0.6, 0, 1,
-1.31479, 0.4053614, -0.378216, 1, 0.6078432, 0, 1,
-1.31247, 0.5363995, -1.201501, 1, 0.6117647, 0, 1,
-1.305501, -0.04560807, -1.795286, 1, 0.6196079, 0, 1,
-1.304492, -1.330335, -3.337582, 1, 0.6235294, 0, 1,
-1.28849, -1.25674, -2.869973, 1, 0.6313726, 0, 1,
-1.287619, 1.312624, -0.7109219, 1, 0.6352941, 0, 1,
-1.287435, 0.02973929, -0.7712504, 1, 0.6431373, 0, 1,
-1.284059, 1.203975, 0.1799827, 1, 0.6470588, 0, 1,
-1.281483, -0.8460681, -1.349703, 1, 0.654902, 0, 1,
-1.274695, -0.8437696, -1.863426, 1, 0.6588235, 0, 1,
-1.259069, 1.00784, -1.327737, 1, 0.6666667, 0, 1,
-1.248817, -0.8918343, -1.205373, 1, 0.6705883, 0, 1,
-1.246821, 0.1341434, -0.5391037, 1, 0.6784314, 0, 1,
-1.245689, 0.2365605, -0.6863764, 1, 0.682353, 0, 1,
-1.242292, -0.3996813, -1.181541, 1, 0.6901961, 0, 1,
-1.24214, 0.0332393, -0.2772873, 1, 0.6941177, 0, 1,
-1.223695, 0.1268112, -1.411012, 1, 0.7019608, 0, 1,
-1.218374, -0.4167784, -2.164824, 1, 0.7098039, 0, 1,
-1.212397, 0.2155176, -1.597912, 1, 0.7137255, 0, 1,
-1.200201, 0.2106437, -2.553232, 1, 0.7215686, 0, 1,
-1.194095, 0.06111214, -0.8909351, 1, 0.7254902, 0, 1,
-1.189839, -0.7576976, -2.595626, 1, 0.7333333, 0, 1,
-1.186731, -1.430841, -2.657168, 1, 0.7372549, 0, 1,
-1.183786, -0.3249933, -1.361068, 1, 0.7450981, 0, 1,
-1.180197, 0.2856437, -1.302446, 1, 0.7490196, 0, 1,
-1.174331, -2.088271, -1.990403, 1, 0.7568628, 0, 1,
-1.166397, -0.9527714, -1.764414, 1, 0.7607843, 0, 1,
-1.165636, -1.259345, -2.498825, 1, 0.7686275, 0, 1,
-1.164742, 1.500241, -1.240925, 1, 0.772549, 0, 1,
-1.161231, 0.1757599, -1.369622, 1, 0.7803922, 0, 1,
-1.156878, -0.9493565, -1.51238, 1, 0.7843137, 0, 1,
-1.154811, 0.1055449, -1.759888, 1, 0.7921569, 0, 1,
-1.153238, -2.081589, -0.04806139, 1, 0.7960784, 0, 1,
-1.151081, -0.9200004, -2.241392, 1, 0.8039216, 0, 1,
-1.151052, -0.1219349, -1.171435, 1, 0.8117647, 0, 1,
-1.141829, -1.682863, -1.779918, 1, 0.8156863, 0, 1,
-1.139784, 2.319529, -1.091699, 1, 0.8235294, 0, 1,
-1.138687, -0.9245269, -2.109411, 1, 0.827451, 0, 1,
-1.131861, -0.9745731, -2.520391, 1, 0.8352941, 0, 1,
-1.129392, 1.704297, -0.8714848, 1, 0.8392157, 0, 1,
-1.125959, 1.115061, -2.781901, 1, 0.8470588, 0, 1,
-1.121151, 0.7064095, -0.9591282, 1, 0.8509804, 0, 1,
-1.112427, 0.5548399, -2.25426, 1, 0.8588235, 0, 1,
-1.110689, -0.9042637, -2.319644, 1, 0.8627451, 0, 1,
-1.1083, -0.5944992, -1.925914, 1, 0.8705882, 0, 1,
-1.102158, 0.2968276, -0.9838497, 1, 0.8745098, 0, 1,
-1.098306, -0.9890646, -1.775528, 1, 0.8823529, 0, 1,
-1.093329, 0.1323039, -0.975874, 1, 0.8862745, 0, 1,
-1.07869, 0.4139126, -2.205898, 1, 0.8941177, 0, 1,
-1.078068, 0.5283848, -1.115316, 1, 0.8980392, 0, 1,
-1.077614, -1.721221, -1.243678, 1, 0.9058824, 0, 1,
-1.077332, 0.4994814, -1.224011, 1, 0.9137255, 0, 1,
-1.075539, -0.6403551, -4.493456, 1, 0.9176471, 0, 1,
-1.075408, 0.1875666, -2.732248, 1, 0.9254902, 0, 1,
-1.070826, 0.1759651, 0.4661593, 1, 0.9294118, 0, 1,
-1.068729, -0.3764026, -1.04318, 1, 0.9372549, 0, 1,
-1.056519, 0.3714658, -1.533447, 1, 0.9411765, 0, 1,
-1.051246, -0.1593784, -0.9396448, 1, 0.9490196, 0, 1,
-1.048044, 0.09169509, -0.9499291, 1, 0.9529412, 0, 1,
-1.04455, -0.3296039, -1.877576, 1, 0.9607843, 0, 1,
-1.033407, 0.4237288, -1.831925, 1, 0.9647059, 0, 1,
-1.017676, -1.187714, -2.489742, 1, 0.972549, 0, 1,
-1.014903, -0.1101146, -1.78366, 1, 0.9764706, 0, 1,
-1.009318, -0.8402874, -2.116774, 1, 0.9843137, 0, 1,
-1.005641, 0.615704, -1.810063, 1, 0.9882353, 0, 1,
-0.9807513, 0.06107003, -0.7270513, 1, 0.9960784, 0, 1,
-0.979291, -1.329115, -3.764184, 0.9960784, 1, 0, 1,
-0.9730265, 0.6393259, 0.1671819, 0.9921569, 1, 0, 1,
-0.9680396, -0.03465373, -1.462777, 0.9843137, 1, 0, 1,
-0.9651907, -3.104457, -1.667561, 0.9803922, 1, 0, 1,
-0.9638154, -1.274094, -1.276505, 0.972549, 1, 0, 1,
-0.9622351, -0.6687984, -3.505049, 0.9686275, 1, 0, 1,
-0.9608554, -0.7929673, -2.016011, 0.9607843, 1, 0, 1,
-0.9543536, 2.487195, -0.4456802, 0.9568627, 1, 0, 1,
-0.9477541, -0.9301939, -3.23983, 0.9490196, 1, 0, 1,
-0.9434041, 0.3070923, -0.1108821, 0.945098, 1, 0, 1,
-0.9394047, -2.087451, -1.674621, 0.9372549, 1, 0, 1,
-0.931754, 0.9322464, -1.049181, 0.9333333, 1, 0, 1,
-0.9183793, 0.8461703, -0.5997257, 0.9254902, 1, 0, 1,
-0.9044169, -1.052706, -1.624503, 0.9215686, 1, 0, 1,
-0.9015353, 0.2749954, -1.571606, 0.9137255, 1, 0, 1,
-0.8973585, -0.4462333, -2.619143, 0.9098039, 1, 0, 1,
-0.8952438, -2.185142, -2.464967, 0.9019608, 1, 0, 1,
-0.8881493, 1.326218, 0.3895959, 0.8941177, 1, 0, 1,
-0.8857905, 1.328969, -0.1447283, 0.8901961, 1, 0, 1,
-0.8828503, 0.4589949, -1.638816, 0.8823529, 1, 0, 1,
-0.8733139, 1.426997, -0.2925331, 0.8784314, 1, 0, 1,
-0.8700935, -0.573668, -1.188144, 0.8705882, 1, 0, 1,
-0.8640582, -1.722065, -2.695556, 0.8666667, 1, 0, 1,
-0.8640012, -0.240256, -1.476619, 0.8588235, 1, 0, 1,
-0.8618115, -1.306515, -2.75959, 0.854902, 1, 0, 1,
-0.8585665, -1.000845, -1.658315, 0.8470588, 1, 0, 1,
-0.8580705, -1.767504, -3.296703, 0.8431373, 1, 0, 1,
-0.8568044, 0.2839826, -1.996137, 0.8352941, 1, 0, 1,
-0.850861, -1.371582, -4.213594, 0.8313726, 1, 0, 1,
-0.8484275, -1.291792, -2.138987, 0.8235294, 1, 0, 1,
-0.8423656, -0.9464772, -2.87841, 0.8196079, 1, 0, 1,
-0.8417531, 0.7461693, 0.3682344, 0.8117647, 1, 0, 1,
-0.8406726, -0.2713675, -3.019997, 0.8078431, 1, 0, 1,
-0.8324275, 0.2860598, -2.030653, 0.8, 1, 0, 1,
-0.8322493, 0.02249794, -2.545461, 0.7921569, 1, 0, 1,
-0.8312579, 0.3088168, -1.675442, 0.7882353, 1, 0, 1,
-0.8305902, -0.2146672, -1.882857, 0.7803922, 1, 0, 1,
-0.8304573, -0.8735644, -1.549326, 0.7764706, 1, 0, 1,
-0.8229926, -0.7311296, -2.233621, 0.7686275, 1, 0, 1,
-0.8226336, 0.2465867, -1.961206, 0.7647059, 1, 0, 1,
-0.8204913, -0.3998162, -4.023385, 0.7568628, 1, 0, 1,
-0.8183082, -1.143506, -2.36826, 0.7529412, 1, 0, 1,
-0.8172997, -1.740978, -2.218852, 0.7450981, 1, 0, 1,
-0.8099042, 0.9853448, -0.9009228, 0.7411765, 1, 0, 1,
-0.809396, 0.01350696, -2.057825, 0.7333333, 1, 0, 1,
-0.8091906, -0.8891811, -1.317519, 0.7294118, 1, 0, 1,
-0.8058257, -0.3932075, 0.3076611, 0.7215686, 1, 0, 1,
-0.7937328, 1.659337, -0.2023707, 0.7176471, 1, 0, 1,
-0.7931628, 0.9398391, -1.071558, 0.7098039, 1, 0, 1,
-0.7882874, 0.2391222, -1.954812, 0.7058824, 1, 0, 1,
-0.7878755, 1.766319, 1.679001, 0.6980392, 1, 0, 1,
-0.7776635, -0.2294372, -2.748516, 0.6901961, 1, 0, 1,
-0.7759081, -0.8937992, -3.404601, 0.6862745, 1, 0, 1,
-0.7666623, 0.5066046, -1.675305, 0.6784314, 1, 0, 1,
-0.7665952, 0.08836575, -2.906208, 0.6745098, 1, 0, 1,
-0.7649168, 0.2176615, 0.1024334, 0.6666667, 1, 0, 1,
-0.7647849, 2.34151, -0.6610907, 0.6627451, 1, 0, 1,
-0.7635413, 0.01512775, -2.494301, 0.654902, 1, 0, 1,
-0.7599905, 0.9884421, -0.2932348, 0.6509804, 1, 0, 1,
-0.7594367, -0.4846169, -2.790048, 0.6431373, 1, 0, 1,
-0.7594078, 0.8079202, -0.9482257, 0.6392157, 1, 0, 1,
-0.7585483, 2.338644, 1.171827, 0.6313726, 1, 0, 1,
-0.757112, 0.5052727, -0.6059444, 0.627451, 1, 0, 1,
-0.7570665, -0.08331783, -2.482347, 0.6196079, 1, 0, 1,
-0.7526157, -0.02065242, -1.792093, 0.6156863, 1, 0, 1,
-0.743579, 0.07455321, -0.7197264, 0.6078432, 1, 0, 1,
-0.7411141, -1.816953, -4.403218, 0.6039216, 1, 0, 1,
-0.7405825, 0.8322449, -1.248877, 0.5960785, 1, 0, 1,
-0.7385899, 0.2339951, -2.658498, 0.5882353, 1, 0, 1,
-0.737316, -0.1688838, -2.339353, 0.5843138, 1, 0, 1,
-0.7301016, -0.9844874, -1.638613, 0.5764706, 1, 0, 1,
-0.7268717, 0.5282899, -0.6799942, 0.572549, 1, 0, 1,
-0.7233412, 1.044888, -0.9514476, 0.5647059, 1, 0, 1,
-0.7091705, -0.2532396, 0.04133172, 0.5607843, 1, 0, 1,
-0.7065812, 0.002674184, -1.939829, 0.5529412, 1, 0, 1,
-0.7030687, -1.315661, -3.29761, 0.5490196, 1, 0, 1,
-0.7027026, 0.6295128, -0.4394184, 0.5411765, 1, 0, 1,
-0.7010766, 0.6433525, -2.079767, 0.5372549, 1, 0, 1,
-0.6988953, -0.7083785, -2.688326, 0.5294118, 1, 0, 1,
-0.6984981, 0.9858142, -1.745434, 0.5254902, 1, 0, 1,
-0.6976891, -1.062045, -3.068545, 0.5176471, 1, 0, 1,
-0.6863994, 0.5307477, -1.258942, 0.5137255, 1, 0, 1,
-0.6836658, -0.0912233, -1.580938, 0.5058824, 1, 0, 1,
-0.6766681, -0.6744834, -1.833287, 0.5019608, 1, 0, 1,
-0.6737275, -0.5030152, -4.202435, 0.4941176, 1, 0, 1,
-0.673659, -0.7944791, -3.036771, 0.4862745, 1, 0, 1,
-0.6520605, 0.1416542, -1.530285, 0.4823529, 1, 0, 1,
-0.6505611, -0.04775989, -2.839693, 0.4745098, 1, 0, 1,
-0.6503034, -0.4764259, -2.779319, 0.4705882, 1, 0, 1,
-0.6474559, 1.732659, 0.5318055, 0.4627451, 1, 0, 1,
-0.6443927, -0.01139757, -1.586976, 0.4588235, 1, 0, 1,
-0.6416973, -0.1852676, -0.4050846, 0.4509804, 1, 0, 1,
-0.6404572, 0.8277372, -0.8843139, 0.4470588, 1, 0, 1,
-0.6339334, -0.7234084, -3.893695, 0.4392157, 1, 0, 1,
-0.6329402, 1.167887, 0.06605787, 0.4352941, 1, 0, 1,
-0.6325193, 1.425951, -0.9348314, 0.427451, 1, 0, 1,
-0.6307511, 1.076346, 0.4856474, 0.4235294, 1, 0, 1,
-0.6295146, 1.746738, 0.9507872, 0.4156863, 1, 0, 1,
-0.6268679, 0.7477852, -0.009711192, 0.4117647, 1, 0, 1,
-0.6211105, -0.1570344, -1.266621, 0.4039216, 1, 0, 1,
-0.6199224, 0.5955843, -1.5309, 0.3960784, 1, 0, 1,
-0.6186541, -1.384105, -2.670427, 0.3921569, 1, 0, 1,
-0.6181803, -2.243433, -2.415222, 0.3843137, 1, 0, 1,
-0.6138117, 0.3976559, -0.2195651, 0.3803922, 1, 0, 1,
-0.6090102, -0.9222226, -3.224016, 0.372549, 1, 0, 1,
-0.6070137, -0.1036075, -1.687774, 0.3686275, 1, 0, 1,
-0.6022294, -2.684662, -3.405, 0.3607843, 1, 0, 1,
-0.5994219, -0.5490541, -1.978596, 0.3568628, 1, 0, 1,
-0.5970479, -0.2568617, -2.107168, 0.3490196, 1, 0, 1,
-0.5948985, 0.8035801, -0.6990393, 0.345098, 1, 0, 1,
-0.5901176, 1.349398, 0.2159818, 0.3372549, 1, 0, 1,
-0.5899292, 0.07256843, -3.017506, 0.3333333, 1, 0, 1,
-0.5876033, -0.545642, -2.091143, 0.3254902, 1, 0, 1,
-0.5805721, 0.2146601, -0.9655492, 0.3215686, 1, 0, 1,
-0.5802624, -0.5642957, -1.961489, 0.3137255, 1, 0, 1,
-0.5771998, -0.6705308, -3.055252, 0.3098039, 1, 0, 1,
-0.574589, -0.8947107, -3.835958, 0.3019608, 1, 0, 1,
-0.5721201, -0.3033109, -4.195814, 0.2941177, 1, 0, 1,
-0.5677387, -0.2182448, -3.11043, 0.2901961, 1, 0, 1,
-0.5663649, 1.298247, -0.3507873, 0.282353, 1, 0, 1,
-0.5623854, -0.1007481, -2.332228, 0.2784314, 1, 0, 1,
-0.561196, 1.490145, 1.320341, 0.2705882, 1, 0, 1,
-0.5602974, 0.6324115, 1.423951, 0.2666667, 1, 0, 1,
-0.5586042, -0.291828, -1.125436, 0.2588235, 1, 0, 1,
-0.5580965, 0.923797, 0.9379817, 0.254902, 1, 0, 1,
-0.5551642, -0.7269796, -3.847025, 0.2470588, 1, 0, 1,
-0.553708, 1.553655, -0.365915, 0.2431373, 1, 0, 1,
-0.5518823, -1.346029, -4.49394, 0.2352941, 1, 0, 1,
-0.5499411, 0.9299009, 0.6614156, 0.2313726, 1, 0, 1,
-0.5494825, 0.6345426, -0.9672738, 0.2235294, 1, 0, 1,
-0.5473487, -1.212348, -1.820958, 0.2196078, 1, 0, 1,
-0.5428183, 0.8502586, 0.05342153, 0.2117647, 1, 0, 1,
-0.5389743, 0.4422093, -3.550707, 0.2078431, 1, 0, 1,
-0.5357374, -0.002290447, -2.568475, 0.2, 1, 0, 1,
-0.5355498, 0.7541872, 0.711445, 0.1921569, 1, 0, 1,
-0.5334382, -1.36247, -2.027914, 0.1882353, 1, 0, 1,
-0.5323094, -0.2797969, -1.957298, 0.1803922, 1, 0, 1,
-0.5322449, -0.7314849, -1.678946, 0.1764706, 1, 0, 1,
-0.5287184, 0.7042759, 0.4492229, 0.1686275, 1, 0, 1,
-0.5280835, 0.2889077, 0.2701988, 0.1647059, 1, 0, 1,
-0.5277836, 0.01143333, -1.671492, 0.1568628, 1, 0, 1,
-0.5264126, -1.11285, -3.321124, 0.1529412, 1, 0, 1,
-0.5230914, -0.3312752, -0.310586, 0.145098, 1, 0, 1,
-0.5224048, 0.4816458, 0.5741179, 0.1411765, 1, 0, 1,
-0.5197088, -1.504789, -2.552711, 0.1333333, 1, 0, 1,
-0.5192133, 0.9933125, -0.9660809, 0.1294118, 1, 0, 1,
-0.518961, 1.52357, 0.5322659, 0.1215686, 1, 0, 1,
-0.5161006, -0.6429743, -3.157977, 0.1176471, 1, 0, 1,
-0.5100045, -1.068002, -2.584627, 0.1098039, 1, 0, 1,
-0.5092151, 1.474269, -0.8685499, 0.1058824, 1, 0, 1,
-0.5075709, -1.071164, -1.529521, 0.09803922, 1, 0, 1,
-0.5065389, -0.7000772, -3.419785, 0.09019608, 1, 0, 1,
-0.5050173, 1.357787, -0.4501899, 0.08627451, 1, 0, 1,
-0.4994753, -1.386581, -5.539893, 0.07843138, 1, 0, 1,
-0.4961383, -1.037262, -3.259911, 0.07450981, 1, 0, 1,
-0.4960121, 0.5074751, -2.433091, 0.06666667, 1, 0, 1,
-0.4865197, 0.3733786, -0.8111154, 0.0627451, 1, 0, 1,
-0.4854034, -1.105674, -2.583011, 0.05490196, 1, 0, 1,
-0.4848257, -1.305058, -3.951515, 0.05098039, 1, 0, 1,
-0.4836329, 0.1739279, -3.257688, 0.04313726, 1, 0, 1,
-0.4805193, 0.6901892, -2.224305, 0.03921569, 1, 0, 1,
-0.4792726, -0.7361185, -3.905453, 0.03137255, 1, 0, 1,
-0.4720843, 1.41608, -0.4419929, 0.02745098, 1, 0, 1,
-0.4716816, -0.6825355, -1.103083, 0.01960784, 1, 0, 1,
-0.4711601, 0.5752752, 0.4030865, 0.01568628, 1, 0, 1,
-0.4688035, -1.384392, -2.911103, 0.007843138, 1, 0, 1,
-0.4673348, -0.6886351, -1.99837, 0.003921569, 1, 0, 1,
-0.4666865, 2.065997, 0.1438314, 0, 1, 0.003921569, 1,
-0.4632073, 1.154148, -2.980283, 0, 1, 0.01176471, 1,
-0.4619145, -0.9369295, -4.963667, 0, 1, 0.01568628, 1,
-0.4611072, -0.01616902, -2.006708, 0, 1, 0.02352941, 1,
-0.4586953, -0.1528221, -2.438019, 0, 1, 0.02745098, 1,
-0.458287, -0.1779156, -3.315531, 0, 1, 0.03529412, 1,
-0.458078, -1.060328, -2.404624, 0, 1, 0.03921569, 1,
-0.4567565, 0.2696781, -0.7500764, 0, 1, 0.04705882, 1,
-0.456752, 0.955851, 0.9420208, 0, 1, 0.05098039, 1,
-0.455115, 1.779605, 0.7425393, 0, 1, 0.05882353, 1,
-0.4528773, 0.1986989, -0.05593747, 0, 1, 0.0627451, 1,
-0.452688, 1.145636, -1.141109, 0, 1, 0.07058824, 1,
-0.4525139, 1.181962, 0.70944, 0, 1, 0.07450981, 1,
-0.4509882, -0.5841147, -1.429063, 0, 1, 0.08235294, 1,
-0.4498324, 0.7974283, -2.835876, 0, 1, 0.08627451, 1,
-0.4490185, 0.1169071, -1.602045, 0, 1, 0.09411765, 1,
-0.446151, -0.2175806, -3.685414, 0, 1, 0.1019608, 1,
-0.4435975, -1.309672, -2.486346, 0, 1, 0.1058824, 1,
-0.4382368, 2.281836, 1.242288, 0, 1, 0.1137255, 1,
-0.437647, -1.284447, -2.785359, 0, 1, 0.1176471, 1,
-0.4358566, 1.103609, -1.795554, 0, 1, 0.1254902, 1,
-0.4353167, -2.359991, -3.821233, 0, 1, 0.1294118, 1,
-0.4334589, -1.113395, -2.556679, 0, 1, 0.1372549, 1,
-0.4299501, 1.423909, -0.9817565, 0, 1, 0.1411765, 1,
-0.4283844, -0.9264878, -4.35661, 0, 1, 0.1490196, 1,
-0.4218512, -1.235205, -1.89984, 0, 1, 0.1529412, 1,
-0.4185835, 1.263451, -0.2266037, 0, 1, 0.1607843, 1,
-0.4176589, 1.483321, 1.405748, 0, 1, 0.1647059, 1,
-0.4141556, -1.039358, -4.320062, 0, 1, 0.172549, 1,
-0.4131782, 0.8130537, -0.155797, 0, 1, 0.1764706, 1,
-0.4113975, -0.7943675, -1.052259, 0, 1, 0.1843137, 1,
-0.4086254, 1.05643, -1.223028, 0, 1, 0.1882353, 1,
-0.4086247, 1.565418, -1.099641, 0, 1, 0.1960784, 1,
-0.4069326, 0.1608466, -0.7008077, 0, 1, 0.2039216, 1,
-0.3994722, 0.716865, -0.6147697, 0, 1, 0.2078431, 1,
-0.3978071, -0.04008166, -2.457187, 0, 1, 0.2156863, 1,
-0.3954912, -0.4349804, -2.432481, 0, 1, 0.2196078, 1,
-0.3949433, 0.7121631, -0.7133909, 0, 1, 0.227451, 1,
-0.3924185, -0.1650583, -3.144362, 0, 1, 0.2313726, 1,
-0.389755, -1.32674, -2.758387, 0, 1, 0.2392157, 1,
-0.3887364, -1.979883, -2.653567, 0, 1, 0.2431373, 1,
-0.3810639, 0.3817477, -1.112342, 0, 1, 0.2509804, 1,
-0.3793487, -0.36514, -2.552832, 0, 1, 0.254902, 1,
-0.3779967, 0.06973755, -2.10943, 0, 1, 0.2627451, 1,
-0.3732119, 0.09954777, -1.151418, 0, 1, 0.2666667, 1,
-0.3715424, 0.9117877, -1.074587, 0, 1, 0.2745098, 1,
-0.3700178, 1.03389, -0.5888104, 0, 1, 0.2784314, 1,
-0.3691534, -1.410554, -4.393778, 0, 1, 0.2862745, 1,
-0.3663085, 0.2121505, 0.06167456, 0, 1, 0.2901961, 1,
-0.3602617, 0.4651204, -2.586441, 0, 1, 0.2980392, 1,
-0.3599004, -1.771369, -2.342232, 0, 1, 0.3058824, 1,
-0.3571768, 1.170788, 0.7151459, 0, 1, 0.3098039, 1,
-0.3570611, -0.6641537, -1.614094, 0, 1, 0.3176471, 1,
-0.3563863, -0.3693095, -0.8297542, 0, 1, 0.3215686, 1,
-0.3540724, -0.9701094, 0.09133804, 0, 1, 0.3294118, 1,
-0.3516876, -0.5843406, -3.97161, 0, 1, 0.3333333, 1,
-0.3489052, -1.252789, -2.960256, 0, 1, 0.3411765, 1,
-0.3463303, -0.01847959, -1.290303, 0, 1, 0.345098, 1,
-0.3437422, -0.5424278, -2.393312, 0, 1, 0.3529412, 1,
-0.34267, 1.375534, 1.90362, 0, 1, 0.3568628, 1,
-0.33788, -0.4867265, -2.454005, 0, 1, 0.3647059, 1,
-0.3370934, 0.2513454, -2.773257, 0, 1, 0.3686275, 1,
-0.3342031, -0.6471388, -1.642324, 0, 1, 0.3764706, 1,
-0.3305577, 0.2226358, -1.715671, 0, 1, 0.3803922, 1,
-0.3208269, -1.72369, -3.803571, 0, 1, 0.3882353, 1,
-0.3200292, 0.9005978, -1.248974, 0, 1, 0.3921569, 1,
-0.3190799, 0.337149, -0.8116655, 0, 1, 0.4, 1,
-0.3176607, 1.143007, -0.4866215, 0, 1, 0.4078431, 1,
-0.3175073, 1.129464, -0.1061814, 0, 1, 0.4117647, 1,
-0.3082862, -1.663791, -2.920216, 0, 1, 0.4196078, 1,
-0.3044241, -1.664042, -1.833972, 0, 1, 0.4235294, 1,
-0.3034846, 1.17668, -0.7242082, 0, 1, 0.4313726, 1,
-0.301504, 1.84597, -0.1486563, 0, 1, 0.4352941, 1,
-0.2995871, 1.821035, -1.500954, 0, 1, 0.4431373, 1,
-0.2972315, -0.7985561, -3.432839, 0, 1, 0.4470588, 1,
-0.2969789, 0.1917907, -1.593223, 0, 1, 0.454902, 1,
-0.2955949, -0.05628362, -3.027346, 0, 1, 0.4588235, 1,
-0.2921022, -0.4525358, -2.537225, 0, 1, 0.4666667, 1,
-0.2899062, 0.770923, 0.991634, 0, 1, 0.4705882, 1,
-0.2840236, -0.07790872, -3.142945, 0, 1, 0.4784314, 1,
-0.281506, 1.13519, 0.6666849, 0, 1, 0.4823529, 1,
-0.281191, 0.3543552, 1.871207, 0, 1, 0.4901961, 1,
-0.2808754, -1.366246, -3.64147, 0, 1, 0.4941176, 1,
-0.2779055, 0.1261095, -1.152038, 0, 1, 0.5019608, 1,
-0.2751656, -0.804647, -4.704109, 0, 1, 0.509804, 1,
-0.2746048, 0.7539278, -2.132199, 0, 1, 0.5137255, 1,
-0.2595272, -0.3356428, -2.784355, 0, 1, 0.5215687, 1,
-0.2581709, 0.2308894, 0.1881383, 0, 1, 0.5254902, 1,
-0.25511, 1.749533, -0.8647457, 0, 1, 0.5333334, 1,
-0.2525282, -1.972951, -1.162287, 0, 1, 0.5372549, 1,
-0.2523791, -1.43084, -3.700369, 0, 1, 0.5450981, 1,
-0.246348, 0.1628447, -0.4887287, 0, 1, 0.5490196, 1,
-0.2407967, 0.6003417, 0.3769848, 0, 1, 0.5568628, 1,
-0.2372693, 0.9809405, -0.9478851, 0, 1, 0.5607843, 1,
-0.2359771, -0.5813746, -4.080642, 0, 1, 0.5686275, 1,
-0.2343164, 2.632244, -0.9136127, 0, 1, 0.572549, 1,
-0.2331346, -1.838596, -5.079141, 0, 1, 0.5803922, 1,
-0.2266637, 0.7213846, -0.4650854, 0, 1, 0.5843138, 1,
-0.2227643, 1.27646, -0.9998692, 0, 1, 0.5921569, 1,
-0.2179632, 0.06591874, 0.4832694, 0, 1, 0.5960785, 1,
-0.2174757, 1.110359, -1.929716, 0, 1, 0.6039216, 1,
-0.2145327, -0.138836, -1.860447, 0, 1, 0.6117647, 1,
-0.2138598, -0.3624693, -4.123421, 0, 1, 0.6156863, 1,
-0.2137763, 0.5785024, -0.4017564, 0, 1, 0.6235294, 1,
-0.2122186, 0.9821664, -0.657749, 0, 1, 0.627451, 1,
-0.2073661, 0.3421182, -1.686725, 0, 1, 0.6352941, 1,
-0.2041296, -1.513592, -4.255944, 0, 1, 0.6392157, 1,
-0.1975048, -0.7366894, -2.626666, 0, 1, 0.6470588, 1,
-0.1942712, -0.5048483, -3.427689, 0, 1, 0.6509804, 1,
-0.1895256, -1.935149, -3.248673, 0, 1, 0.6588235, 1,
-0.1875541, 1.119128, -1.041736, 0, 1, 0.6627451, 1,
-0.1732497, 0.1272214, 0.9638145, 0, 1, 0.6705883, 1,
-0.165474, 1.702577, -0.2459518, 0, 1, 0.6745098, 1,
-0.1627582, -0.720976, -2.677408, 0, 1, 0.682353, 1,
-0.1626909, 0.473729, -1.214417, 0, 1, 0.6862745, 1,
-0.1606011, -0.3835303, -2.978114, 0, 1, 0.6941177, 1,
-0.1539627, -0.07292724, -2.000291, 0, 1, 0.7019608, 1,
-0.1536371, -0.01672596, -1.338719, 0, 1, 0.7058824, 1,
-0.1492051, 1.355588, -1.176113, 0, 1, 0.7137255, 1,
-0.1454503, 0.02323076, -1.915666, 0, 1, 0.7176471, 1,
-0.1444384, -0.9637997, -3.080977, 0, 1, 0.7254902, 1,
-0.1389675, 0.1229166, -1.097371, 0, 1, 0.7294118, 1,
-0.1381214, -1.682644, -3.609465, 0, 1, 0.7372549, 1,
-0.1267303, 0.4037545, 0.03351421, 0, 1, 0.7411765, 1,
-0.1256494, 0.7235109, 2.633265, 0, 1, 0.7490196, 1,
-0.1239734, -0.0825939, -1.552894, 0, 1, 0.7529412, 1,
-0.1191587, 0.5404999, -1.396916, 0, 1, 0.7607843, 1,
-0.1130062, 0.3447331, 0.07178024, 0, 1, 0.7647059, 1,
-0.1121201, 0.644437, 1.210137, 0, 1, 0.772549, 1,
-0.112046, -0.4072449, -0.941295, 0, 1, 0.7764706, 1,
-0.1067451, 0.8417597, 0.3189587, 0, 1, 0.7843137, 1,
-0.1059493, 0.1873814, -1.495976, 0, 1, 0.7882353, 1,
-0.1025413, -0.307795, -2.266381, 0, 1, 0.7960784, 1,
-0.09997204, 0.1791533, -1.748191, 0, 1, 0.8039216, 1,
-0.09984098, 0.8180203, 1.600223, 0, 1, 0.8078431, 1,
-0.09803022, -0.399345, -0.7891104, 0, 1, 0.8156863, 1,
-0.09792401, -0.3965798, -0.326362, 0, 1, 0.8196079, 1,
-0.0975217, 0.1892499, -0.1116793, 0, 1, 0.827451, 1,
-0.09511039, 1.935714, -0.854592, 0, 1, 0.8313726, 1,
-0.09281093, 0.3855982, 0.7427583, 0, 1, 0.8392157, 1,
-0.09258592, 0.7551232, 0.2464486, 0, 1, 0.8431373, 1,
-0.09189136, -0.502848, -3.293585, 0, 1, 0.8509804, 1,
-0.08935246, 0.8664693, 0.3976047, 0, 1, 0.854902, 1,
-0.08256448, 1.513367, 0.6108754, 0, 1, 0.8627451, 1,
-0.07977054, -0.5721143, -2.441305, 0, 1, 0.8666667, 1,
-0.07808496, -0.08954268, -2.159897, 0, 1, 0.8745098, 1,
-0.07568652, 1.104699, -0.2829798, 0, 1, 0.8784314, 1,
-0.07488544, 0.5908398, 0.242145, 0, 1, 0.8862745, 1,
-0.07408209, 1.174004, 1.277466, 0, 1, 0.8901961, 1,
-0.0691569, 0.01485488, -1.558775, 0, 1, 0.8980392, 1,
-0.0689818, 0.2087119, 0.9168751, 0, 1, 0.9058824, 1,
-0.06838745, 0.372258, 0.1996663, 0, 1, 0.9098039, 1,
-0.06542995, 0.8779804, -0.2346178, 0, 1, 0.9176471, 1,
-0.06141783, -0.9213994, -3.544345, 0, 1, 0.9215686, 1,
-0.05776012, -0.6389414, -2.860883, 0, 1, 0.9294118, 1,
-0.05227127, -0.7400725, -3.854929, 0, 1, 0.9333333, 1,
-0.05096732, -1.531691, -4.421545, 0, 1, 0.9411765, 1,
-0.05059797, -0.3848909, -4.136531, 0, 1, 0.945098, 1,
-0.04957368, 0.7125944, 0.9588081, 0, 1, 0.9529412, 1,
-0.04777832, -1.519634, -3.004799, 0, 1, 0.9568627, 1,
-0.04682624, -1.441845, -3.751125, 0, 1, 0.9647059, 1,
-0.04454461, 0.9577326, -0.3679296, 0, 1, 0.9686275, 1,
-0.04420464, -0.278818, -2.140054, 0, 1, 0.9764706, 1,
-0.03998407, 0.02412525, -2.097938, 0, 1, 0.9803922, 1,
-0.03822006, 0.4649266, -0.1366375, 0, 1, 0.9882353, 1,
-0.03642246, -3.104225, -4.473364, 0, 1, 0.9921569, 1,
-0.03014741, -0.8860177, -3.352734, 0, 1, 1, 1,
-0.02980584, 1.11681, -0.2522297, 0, 0.9921569, 1, 1,
-0.0280989, 0.4333473, -0.4232029, 0, 0.9882353, 1, 1,
-0.02785719, -1.266321, -3.281237, 0, 0.9803922, 1, 1,
-0.02678698, 1.383643, 0.9762409, 0, 0.9764706, 1, 1,
-0.02134886, -0.973585, -3.37638, 0, 0.9686275, 1, 1,
-0.01853344, -1.035989, -2.693553, 0, 0.9647059, 1, 1,
-0.01406489, -0.2758127, -1.67593, 0, 0.9568627, 1, 1,
-0.01379635, -0.47586, -4.042336, 0, 0.9529412, 1, 1,
-0.01341777, -1.387107, -3.715231, 0, 0.945098, 1, 1,
-0.01286096, -1.110873, -4.807082, 0, 0.9411765, 1, 1,
-0.01057648, -0.4424616, -3.052347, 0, 0.9333333, 1, 1,
-0.009114528, -1.66174, -4.094957, 0, 0.9294118, 1, 1,
-0.007199867, -0.1394185, -2.669681, 0, 0.9215686, 1, 1,
0.0005286953, -0.02481719, 2.787643, 0, 0.9176471, 1, 1,
0.001113521, 1.003459, -1.022326, 0, 0.9098039, 1, 1,
0.001787096, -0.2166497, 4.73087, 0, 0.9058824, 1, 1,
0.008627591, 0.2015568, 1.117759, 0, 0.8980392, 1, 1,
0.01937312, 2.19943, 0.2441418, 0, 0.8901961, 1, 1,
0.02498601, 0.5374215, 0.5197078, 0, 0.8862745, 1, 1,
0.02950734, -0.3219468, 1.925715, 0, 0.8784314, 1, 1,
0.03343763, 0.5064809, 0.8548739, 0, 0.8745098, 1, 1,
0.03532628, -0.6481991, 3.719696, 0, 0.8666667, 1, 1,
0.03765712, 0.3611497, 0.3137637, 0, 0.8627451, 1, 1,
0.03857261, -0.3681371, 4.351743, 0, 0.854902, 1, 1,
0.04116058, 0.4920676, 0.5476589, 0, 0.8509804, 1, 1,
0.04119462, -0.05003058, 2.817497, 0, 0.8431373, 1, 1,
0.04125516, 1.274861, -0.08477036, 0, 0.8392157, 1, 1,
0.04338685, 1.26396, 1.028496, 0, 0.8313726, 1, 1,
0.04649161, -1.040563, 2.158091, 0, 0.827451, 1, 1,
0.04877291, 1.183461, 0.4475395, 0, 0.8196079, 1, 1,
0.05082254, -0.8593079, 2.076241, 0, 0.8156863, 1, 1,
0.05906351, -0.06482872, 1.791254, 0, 0.8078431, 1, 1,
0.06130235, 0.4836242, -0.0594427, 0, 0.8039216, 1, 1,
0.0615868, 0.8327616, -0.7881747, 0, 0.7960784, 1, 1,
0.06232811, -0.8411394, 2.648671, 0, 0.7882353, 1, 1,
0.06791107, -0.04303508, 1.192693, 0, 0.7843137, 1, 1,
0.07206751, 0.6032547, 1.100931, 0, 0.7764706, 1, 1,
0.07461302, -1.978647, 3.303451, 0, 0.772549, 1, 1,
0.07815346, -1.028637, 4.841278, 0, 0.7647059, 1, 1,
0.07939136, 0.7255274, -0.2707149, 0, 0.7607843, 1, 1,
0.08566334, 1.005251, 1.366963, 0, 0.7529412, 1, 1,
0.09016905, 0.5242097, 0.2338767, 0, 0.7490196, 1, 1,
0.09555548, 1.96165, -0.8594792, 0, 0.7411765, 1, 1,
0.09634557, -0.4639219, 2.459223, 0, 0.7372549, 1, 1,
0.1024365, 0.3428832, 2.333682, 0, 0.7294118, 1, 1,
0.1026552, -1.396236, 0.5509622, 0, 0.7254902, 1, 1,
0.1031276, -0.2750292, 3.480195, 0, 0.7176471, 1, 1,
0.1073915, 1.40334, -0.44945, 0, 0.7137255, 1, 1,
0.1103934, -1.262762, 4.552785, 0, 0.7058824, 1, 1,
0.1131501, -0.4381257, 3.060327, 0, 0.6980392, 1, 1,
0.1195997, -0.6799607, 0.7705966, 0, 0.6941177, 1, 1,
0.1238193, 0.3641035, 1.610983, 0, 0.6862745, 1, 1,
0.1242956, -0.8905901, 2.163318, 0, 0.682353, 1, 1,
0.1270534, 0.1435493, -0.9054805, 0, 0.6745098, 1, 1,
0.1286412, -0.4248673, 2.430074, 0, 0.6705883, 1, 1,
0.1306997, 0.4419393, 1.696386, 0, 0.6627451, 1, 1,
0.1339495, 0.8281131, -1.767516, 0, 0.6588235, 1, 1,
0.1388942, -0.9343808, 4.190354, 0, 0.6509804, 1, 1,
0.1509749, 1.300912, 0.2499838, 0, 0.6470588, 1, 1,
0.1567558, -1.026892, 3.803863, 0, 0.6392157, 1, 1,
0.1569619, -0.1339957, 2.573815, 0, 0.6352941, 1, 1,
0.1571283, 0.1258561, 1.915195, 0, 0.627451, 1, 1,
0.1588951, 1.115369, 1.134581, 0, 0.6235294, 1, 1,
0.1615258, 1.518797, -1.3946, 0, 0.6156863, 1, 1,
0.1631974, 0.09462562, 0.5673583, 0, 0.6117647, 1, 1,
0.1634541, -0.09000724, 2.508586, 0, 0.6039216, 1, 1,
0.1649712, -0.3074613, 3.787241, 0, 0.5960785, 1, 1,
0.1709035, 0.8329869, -0.7413362, 0, 0.5921569, 1, 1,
0.1741357, 1.107356, 2.777798, 0, 0.5843138, 1, 1,
0.1741879, -1.562394, 1.640817, 0, 0.5803922, 1, 1,
0.17431, -0.6137245, 2.695046, 0, 0.572549, 1, 1,
0.174768, -0.928674, 2.9618, 0, 0.5686275, 1, 1,
0.1815553, 0.4852614, -0.1130441, 0, 0.5607843, 1, 1,
0.1824826, -0.7624534, 2.33385, 0, 0.5568628, 1, 1,
0.1841374, 0.03652287, 0.5521976, 0, 0.5490196, 1, 1,
0.1843019, -0.2742161, 2.481968, 0, 0.5450981, 1, 1,
0.1844473, 0.8479588, 0.4724098, 0, 0.5372549, 1, 1,
0.1867485, 0.05815342, 1.485683, 0, 0.5333334, 1, 1,
0.1886626, -0.8639665, 4.776872, 0, 0.5254902, 1, 1,
0.1892504, 1.052205, 0.6835181, 0, 0.5215687, 1, 1,
0.1936212, 0.9672771, 0.8731247, 0, 0.5137255, 1, 1,
0.1949509, -0.7793639, 1.222325, 0, 0.509804, 1, 1,
0.1981496, 1.180791, 1.310931, 0, 0.5019608, 1, 1,
0.2017984, -0.02809353, -0.4126279, 0, 0.4941176, 1, 1,
0.2029599, 1.212878, 0.2378196, 0, 0.4901961, 1, 1,
0.2046363, 0.2690815, 1.31954, 0, 0.4823529, 1, 1,
0.2065862, 0.0471895, 3.346902, 0, 0.4784314, 1, 1,
0.2093883, 0.2443027, -0.003939799, 0, 0.4705882, 1, 1,
0.2104123, 0.4578869, 0.3104251, 0, 0.4666667, 1, 1,
0.2127119, 1.179686, -0.02675899, 0, 0.4588235, 1, 1,
0.2169773, 0.2431514, 0.04367721, 0, 0.454902, 1, 1,
0.2173083, 0.3433383, 1.58453, 0, 0.4470588, 1, 1,
0.2196166, 0.7043526, -1.269493, 0, 0.4431373, 1, 1,
0.2203012, 0.2217629, 2.140352, 0, 0.4352941, 1, 1,
0.2229649, -0.3273883, 1.738086, 0, 0.4313726, 1, 1,
0.2238064, -0.9481896, 2.407465, 0, 0.4235294, 1, 1,
0.2239221, 0.1596241, 1.851668, 0, 0.4196078, 1, 1,
0.2262795, -0.8386027, 2.228624, 0, 0.4117647, 1, 1,
0.2313163, -0.9103537, 3.576069, 0, 0.4078431, 1, 1,
0.2321918, -1.033844, 1.529522, 0, 0.4, 1, 1,
0.2323779, 0.1607419, 1.789089, 0, 0.3921569, 1, 1,
0.2325391, 0.9163076, -0.6552467, 0, 0.3882353, 1, 1,
0.2336228, 1.14114, 0.1296621, 0, 0.3803922, 1, 1,
0.2359199, 0.04165575, 0.799996, 0, 0.3764706, 1, 1,
0.2359885, 0.491545, 2.185227, 0, 0.3686275, 1, 1,
0.2360644, -0.293316, 1.661744, 0, 0.3647059, 1, 1,
0.2388774, -0.0343304, 2.595557, 0, 0.3568628, 1, 1,
0.2391889, 0.81117, 0.5191389, 0, 0.3529412, 1, 1,
0.2407624, 0.2849328, 0.3380286, 0, 0.345098, 1, 1,
0.2473265, 0.3965497, 0.05369375, 0, 0.3411765, 1, 1,
0.2520609, -0.3065163, 1.189893, 0, 0.3333333, 1, 1,
0.2529008, 0.1164384, 2.206213, 0, 0.3294118, 1, 1,
0.2540606, 0.7756752, 1.700464, 0, 0.3215686, 1, 1,
0.2596006, 0.7606496, 0.1952922, 0, 0.3176471, 1, 1,
0.260435, -0.6198844, 2.994481, 0, 0.3098039, 1, 1,
0.2636052, -0.3223225, 2.372926, 0, 0.3058824, 1, 1,
0.2645353, -0.6306681, 3.949763, 0, 0.2980392, 1, 1,
0.2694317, -0.4783065, 2.924674, 0, 0.2901961, 1, 1,
0.2758566, -0.4964148, 3.567925, 0, 0.2862745, 1, 1,
0.2768041, 0.6783242, 1.439437, 0, 0.2784314, 1, 1,
0.2799645, -0.4733695, 2.698529, 0, 0.2745098, 1, 1,
0.2904995, 0.1381501, 1.627593, 0, 0.2666667, 1, 1,
0.2945973, -0.4928011, 1.753231, 0, 0.2627451, 1, 1,
0.2961353, 0.662791, -0.661472, 0, 0.254902, 1, 1,
0.3065904, 1.249733, 0.1838874, 0, 0.2509804, 1, 1,
0.3138738, -0.1508479, 2.579873, 0, 0.2431373, 1, 1,
0.3153771, -0.02189703, 1.149596, 0, 0.2392157, 1, 1,
0.3169121, -1.147424, 2.87414, 0, 0.2313726, 1, 1,
0.3181378, -1.327764, 4.369657, 0, 0.227451, 1, 1,
0.3181469, -0.9822483, 3.466259, 0, 0.2196078, 1, 1,
0.3231125, -1.347981, 3.819165, 0, 0.2156863, 1, 1,
0.3240055, 0.4967966, -0.7886292, 0, 0.2078431, 1, 1,
0.3257544, -0.5578523, 3.872072, 0, 0.2039216, 1, 1,
0.3361613, -0.2937113, 1.86367, 0, 0.1960784, 1, 1,
0.3399369, 0.5283551, 0.3426923, 0, 0.1882353, 1, 1,
0.3405024, -0.9233776, 3.443249, 0, 0.1843137, 1, 1,
0.3437706, -0.5727102, 3.660687, 0, 0.1764706, 1, 1,
0.3483911, 1.693737, -0.9372801, 0, 0.172549, 1, 1,
0.3508144, -0.05235885, 1.255491, 0, 0.1647059, 1, 1,
0.3556836, -0.6622658, 4.833023, 0, 0.1607843, 1, 1,
0.3559771, 0.3732167, 2.513666, 0, 0.1529412, 1, 1,
0.3645261, 0.4179915, 1.347757, 0, 0.1490196, 1, 1,
0.3645456, -0.00560612, 3.540471, 0, 0.1411765, 1, 1,
0.3704301, 0.5558256, 2.08541, 0, 0.1372549, 1, 1,
0.3715421, -1.058237, 2.878663, 0, 0.1294118, 1, 1,
0.3718713, 0.006882567, 2.817804, 0, 0.1254902, 1, 1,
0.3739034, -1.434736, 3.373351, 0, 0.1176471, 1, 1,
0.37821, -0.03120538, 2.610803, 0, 0.1137255, 1, 1,
0.3786196, 0.7550472, 1.691285, 0, 0.1058824, 1, 1,
0.3815036, -0.3413079, 3.838261, 0, 0.09803922, 1, 1,
0.3841135, 0.7277642, 1.302599, 0, 0.09411765, 1, 1,
0.3869876, 0.3592144, 0.2978256, 0, 0.08627451, 1, 1,
0.3874601, -0.3143398, 1.56135, 0, 0.08235294, 1, 1,
0.3902615, -2.377466, 3.52038, 0, 0.07450981, 1, 1,
0.3941171, 1.075088, 0.5864115, 0, 0.07058824, 1, 1,
0.3944288, 0.8445859, 0.5869399, 0, 0.0627451, 1, 1,
0.3957345, -0.3040614, 2.069741, 0, 0.05882353, 1, 1,
0.3965003, -3.178825, 3.248584, 0, 0.05098039, 1, 1,
0.3995289, -0.07477654, 2.689972, 0, 0.04705882, 1, 1,
0.4038467, 0.5247653, 1.550471, 0, 0.03921569, 1, 1,
0.4149396, 0.3224137, 0.7091007, 0, 0.03529412, 1, 1,
0.4205052, -2.013698, 0.8963003, 0, 0.02745098, 1, 1,
0.4240161, 0.3022152, -0.1476634, 0, 0.02352941, 1, 1,
0.4284325, 0.5833998, 1.888676, 0, 0.01568628, 1, 1,
0.4331619, 2.346472, 0.6120889, 0, 0.01176471, 1, 1,
0.4332427, 0.2043172, -0.3306515, 0, 0.003921569, 1, 1,
0.4354824, -1.735906, 3.082597, 0.003921569, 0, 1, 1,
0.4390906, -0.428327, 2.770624, 0.007843138, 0, 1, 1,
0.4479058, 1.202141, -0.2556482, 0.01568628, 0, 1, 1,
0.4500773, 0.2784624, -0.1336644, 0.01960784, 0, 1, 1,
0.4556112, 0.7248315, 3.432447, 0.02745098, 0, 1, 1,
0.4560822, 0.2759911, 1.906154, 0.03137255, 0, 1, 1,
0.457894, 0.9911478, 0.1181908, 0.03921569, 0, 1, 1,
0.4581955, 0.4303917, 0.7643451, 0.04313726, 0, 1, 1,
0.4590376, -1.394317, 4.062538, 0.05098039, 0, 1, 1,
0.4660447, 0.2607209, 0.5281151, 0.05490196, 0, 1, 1,
0.4668886, -2.117009, 2.584388, 0.0627451, 0, 1, 1,
0.4700386, 0.6617272, 1.23182, 0.06666667, 0, 1, 1,
0.4733109, -1.477438, 3.592682, 0.07450981, 0, 1, 1,
0.4771781, -0.01936568, 3.791449, 0.07843138, 0, 1, 1,
0.4829927, -1.756724, 3.055604, 0.08627451, 0, 1, 1,
0.4844762, 0.5681068, -1.073413, 0.09019608, 0, 1, 1,
0.4881664, 1.077248, -0.5854216, 0.09803922, 0, 1, 1,
0.4882125, 0.8103864, -1.048874, 0.1058824, 0, 1, 1,
0.4884937, -1.72767, 4.910963, 0.1098039, 0, 1, 1,
0.4902936, -0.989143, 3.801187, 0.1176471, 0, 1, 1,
0.4941409, -1.455514, 1.973396, 0.1215686, 0, 1, 1,
0.4947109, -0.3683633, 2.167385, 0.1294118, 0, 1, 1,
0.4994791, -1.278777, 3.408353, 0.1333333, 0, 1, 1,
0.500632, 1.426225, -1.698398, 0.1411765, 0, 1, 1,
0.500659, 0.8301962, 0.3804465, 0.145098, 0, 1, 1,
0.5033112, -1.002281, 3.917007, 0.1529412, 0, 1, 1,
0.503571, -0.4514436, 1.377289, 0.1568628, 0, 1, 1,
0.5063476, 0.06683888, 2.563994, 0.1647059, 0, 1, 1,
0.5108367, -0.525759, 3.400439, 0.1686275, 0, 1, 1,
0.5118527, 0.3359949, 1.070467, 0.1764706, 0, 1, 1,
0.5122348, -1.908862, 1.90192, 0.1803922, 0, 1, 1,
0.5154353, -0.02508356, 1.143374, 0.1882353, 0, 1, 1,
0.5162135, -0.3973, 4.08548, 0.1921569, 0, 1, 1,
0.517529, -0.2638333, 1.215516, 0.2, 0, 1, 1,
0.5185549, -2.129992, 0.4764439, 0.2078431, 0, 1, 1,
0.5210568, -1.959622, 3.070251, 0.2117647, 0, 1, 1,
0.52267, -0.377903, 1.48578, 0.2196078, 0, 1, 1,
0.5230062, -0.3936608, 3.031229, 0.2235294, 0, 1, 1,
0.5240652, -0.878714, 2.242542, 0.2313726, 0, 1, 1,
0.5254717, -0.5020484, 2.155197, 0.2352941, 0, 1, 1,
0.5350438, -1.029425, 2.226181, 0.2431373, 0, 1, 1,
0.5351464, 1.030722, -0.4229335, 0.2470588, 0, 1, 1,
0.5351734, -1.96128, 3.733865, 0.254902, 0, 1, 1,
0.5357646, -1.913307, 3.558889, 0.2588235, 0, 1, 1,
0.5408064, 0.6072634, 1.040842, 0.2666667, 0, 1, 1,
0.5411471, 0.9562256, 0.9883614, 0.2705882, 0, 1, 1,
0.5420756, -0.6322349, 4.032259, 0.2784314, 0, 1, 1,
0.5421332, 0.7259344, -0.0161694, 0.282353, 0, 1, 1,
0.5462982, -0.3295348, 2.436312, 0.2901961, 0, 1, 1,
0.5535795, 1.481469, 0.1092958, 0.2941177, 0, 1, 1,
0.5565768, -1.487583, 3.844407, 0.3019608, 0, 1, 1,
0.5588852, 0.2990345, 1.43301, 0.3098039, 0, 1, 1,
0.5610821, -0.2207075, 1.428311, 0.3137255, 0, 1, 1,
0.5622994, -1.5768, 3.514145, 0.3215686, 0, 1, 1,
0.5638569, -1.308361, 2.863244, 0.3254902, 0, 1, 1,
0.5668694, -0.2130834, 2.162868, 0.3333333, 0, 1, 1,
0.5679563, -0.3124444, 3.041269, 0.3372549, 0, 1, 1,
0.5706185, -1.564517, 3.658581, 0.345098, 0, 1, 1,
0.5721841, -0.09939834, 1.379625, 0.3490196, 0, 1, 1,
0.573575, 0.3147703, -1.489824, 0.3568628, 0, 1, 1,
0.5739003, -1.325339, 2.95568, 0.3607843, 0, 1, 1,
0.5837301, -0.696752, 3.174508, 0.3686275, 0, 1, 1,
0.5843166, -1.149773, 1.978669, 0.372549, 0, 1, 1,
0.5869788, 1.548181, 0.257358, 0.3803922, 0, 1, 1,
0.5871265, 0.2422475, 2.604104, 0.3843137, 0, 1, 1,
0.5876794, 0.5710219, 1.559097, 0.3921569, 0, 1, 1,
0.5946719, -0.2078415, 0.2097004, 0.3960784, 0, 1, 1,
0.596566, 0.5539225, 0.5992513, 0.4039216, 0, 1, 1,
0.6039587, -2.153936, 2.385163, 0.4117647, 0, 1, 1,
0.6054901, -0.8060411, 2.06709, 0.4156863, 0, 1, 1,
0.6057565, 1.11734, 0.630072, 0.4235294, 0, 1, 1,
0.6091727, 0.6026737, 2.786185, 0.427451, 0, 1, 1,
0.6093973, -0.5872804, 2.688698, 0.4352941, 0, 1, 1,
0.6237386, 0.1350398, 2.683672, 0.4392157, 0, 1, 1,
0.6256072, 0.9398248, 0.08326832, 0.4470588, 0, 1, 1,
0.6297799, -0.2513363, 2.044236, 0.4509804, 0, 1, 1,
0.6402471, 1.46273, 0.3186867, 0.4588235, 0, 1, 1,
0.644802, 0.7608091, -0.3390404, 0.4627451, 0, 1, 1,
0.6473005, 0.4446155, 0.417333, 0.4705882, 0, 1, 1,
0.6473377, 0.131501, 2.209642, 0.4745098, 0, 1, 1,
0.6494672, 0.02064347, 2.623542, 0.4823529, 0, 1, 1,
0.6511376, 0.08356833, 2.840243, 0.4862745, 0, 1, 1,
0.6527156, 0.7261102, 0.1141471, 0.4941176, 0, 1, 1,
0.6573505, 0.1637573, 2.801096, 0.5019608, 0, 1, 1,
0.666371, 0.06503084, 3.415321, 0.5058824, 0, 1, 1,
0.6792886, -0.6276675, 2.329832, 0.5137255, 0, 1, 1,
0.6825818, 0.7224383, 1.065978, 0.5176471, 0, 1, 1,
0.6868399, 1.37107, 1.358645, 0.5254902, 0, 1, 1,
0.6883343, -1.508099, 1.637594, 0.5294118, 0, 1, 1,
0.6900885, -1.167999, 4.035186, 0.5372549, 0, 1, 1,
0.6918884, 0.4973176, 1.990836, 0.5411765, 0, 1, 1,
0.6927148, 0.2484199, -0.94647, 0.5490196, 0, 1, 1,
0.7044671, 0.354643, 0.4398882, 0.5529412, 0, 1, 1,
0.7067987, 0.4286707, 1.562643, 0.5607843, 0, 1, 1,
0.7077885, -1.077438, 2.629069, 0.5647059, 0, 1, 1,
0.7106792, -0.9703572, 2.728777, 0.572549, 0, 1, 1,
0.7126455, 0.1502042, 2.616949, 0.5764706, 0, 1, 1,
0.7160231, -1.276236, 2.81285, 0.5843138, 0, 1, 1,
0.7234789, -0.2671977, 0.07735208, 0.5882353, 0, 1, 1,
0.7238358, -1.798884, 2.994547, 0.5960785, 0, 1, 1,
0.7356387, 0.6359847, 2.367127, 0.6039216, 0, 1, 1,
0.7362577, 1.348549, 2.687606, 0.6078432, 0, 1, 1,
0.7380572, -0.145959, 0.3970301, 0.6156863, 0, 1, 1,
0.7398387, -0.6857762, 2.528986, 0.6196079, 0, 1, 1,
0.7420447, 0.9372864, 2.17717, 0.627451, 0, 1, 1,
0.7516072, 0.6063501, 0.7331706, 0.6313726, 0, 1, 1,
0.755478, -0.4749816, 2.042337, 0.6392157, 0, 1, 1,
0.7632679, -0.4377731, 1.754588, 0.6431373, 0, 1, 1,
0.771594, -0.3902971, 0.7038754, 0.6509804, 0, 1, 1,
0.7787083, 2.013255, -1.598803, 0.654902, 0, 1, 1,
0.7832332, 1.606154, -0.01147213, 0.6627451, 0, 1, 1,
0.7839746, 0.4940788, 0.6151139, 0.6666667, 0, 1, 1,
0.7859015, -0.1434567, 0.883506, 0.6745098, 0, 1, 1,
0.7859764, 0.03677949, 0.5589549, 0.6784314, 0, 1, 1,
0.7869841, 0.4184635, 1.442325, 0.6862745, 0, 1, 1,
0.7874808, 1.458746, 2.037667, 0.6901961, 0, 1, 1,
0.7890059, -0.6602712, 0.9746388, 0.6980392, 0, 1, 1,
0.7890782, -0.2790806, 0.9141576, 0.7058824, 0, 1, 1,
0.7956775, -0.4218106, 2.560924, 0.7098039, 0, 1, 1,
0.8086589, 0.2855961, 1.901764, 0.7176471, 0, 1, 1,
0.8107394, -1.479411, 4.272152, 0.7215686, 0, 1, 1,
0.8168955, 0.5451602, 0.636982, 0.7294118, 0, 1, 1,
0.8256248, -0.03340319, 1.854405, 0.7333333, 0, 1, 1,
0.8260316, -0.3056095, 2.3868, 0.7411765, 0, 1, 1,
0.8265183, -0.8229619, 1.561719, 0.7450981, 0, 1, 1,
0.8282571, -0.9189077, 3.01999, 0.7529412, 0, 1, 1,
0.8290185, -0.7370191, 0.2552954, 0.7568628, 0, 1, 1,
0.8329639, 0.3338704, 1.697115, 0.7647059, 0, 1, 1,
0.834953, 0.4403705, 1.927256, 0.7686275, 0, 1, 1,
0.8372939, 0.1386451, 1.016792, 0.7764706, 0, 1, 1,
0.8404189, -1.67694, 3.711047, 0.7803922, 0, 1, 1,
0.841446, 1.699352, 0.497233, 0.7882353, 0, 1, 1,
0.8430812, 2.519461, 1.762872, 0.7921569, 0, 1, 1,
0.8458489, -0.0461017, 1.673905, 0.8, 0, 1, 1,
0.8465616, 1.608035, 0.9254715, 0.8078431, 0, 1, 1,
0.8495011, -0.5319965, 3.187436, 0.8117647, 0, 1, 1,
0.8733696, 1.475385, 1.40127, 0.8196079, 0, 1, 1,
0.8734359, -1.670061, 1.395233, 0.8235294, 0, 1, 1,
0.8790286, 0.2299244, -0.7829001, 0.8313726, 0, 1, 1,
0.8825067, -0.899416, 0.3968872, 0.8352941, 0, 1, 1,
0.8903032, 1.386744, -0.9772331, 0.8431373, 0, 1, 1,
0.890631, -0.06497069, 4.159276, 0.8470588, 0, 1, 1,
0.8925862, 0.6863789, -1.357604, 0.854902, 0, 1, 1,
0.8955649, 0.6999712, -0.8456559, 0.8588235, 0, 1, 1,
0.9037405, 0.07090549, 1.818455, 0.8666667, 0, 1, 1,
0.9116795, 0.1135608, 1.845647, 0.8705882, 0, 1, 1,
0.9143671, -1.805278, 4.480002, 0.8784314, 0, 1, 1,
0.9187447, 0.4451282, 1.847726, 0.8823529, 0, 1, 1,
0.9338661, -0.05385206, 2.560668, 0.8901961, 0, 1, 1,
0.9391463, -1.128016, 3.048452, 0.8941177, 0, 1, 1,
0.9431188, 0.2962877, 1.581743, 0.9019608, 0, 1, 1,
0.9486222, -0.9641837, 2.182523, 0.9098039, 0, 1, 1,
0.949465, 0.2337401, 0.8571748, 0.9137255, 0, 1, 1,
0.951525, 2.159071, -1.113645, 0.9215686, 0, 1, 1,
0.9563145, -0.19076, 2.992971, 0.9254902, 0, 1, 1,
0.9657468, -0.8988637, 2.005898, 0.9333333, 0, 1, 1,
0.9675868, 1.807087, 1.615557, 0.9372549, 0, 1, 1,
0.9678181, -1.173673, 1.509289, 0.945098, 0, 1, 1,
0.9689847, 0.2643744, 1.339044, 0.9490196, 0, 1, 1,
0.9717327, 0.8826439, 2.013003, 0.9568627, 0, 1, 1,
0.9781008, 1.096033, 1.064254, 0.9607843, 0, 1, 1,
0.9818072, 1.281825, 2.09127, 0.9686275, 0, 1, 1,
0.9825177, 0.3465785, 1.503328, 0.972549, 0, 1, 1,
0.9859737, -0.4336043, 2.715696, 0.9803922, 0, 1, 1,
0.9913221, 1.012648, 2.355801, 0.9843137, 0, 1, 1,
0.9913906, -0.3107454, 2.704915, 0.9921569, 0, 1, 1,
0.9929606, 0.6718613, 2.151277, 0.9960784, 0, 1, 1,
1.001012, 0.04665997, 1.817378, 1, 0, 0.9960784, 1,
1.004492, 0.1389115, 1.300954, 1, 0, 0.9882353, 1,
1.007386, -0.5014782, 1.21145, 1, 0, 0.9843137, 1,
1.00892, -1.320708, 3.443111, 1, 0, 0.9764706, 1,
1.009408, -0.3256734, 0.2478312, 1, 0, 0.972549, 1,
1.018699, 1.163213, 0.8917241, 1, 0, 0.9647059, 1,
1.02167, 0.4043418, -0.07563844, 1, 0, 0.9607843, 1,
1.02193, 0.5331773, 1.327494, 1, 0, 0.9529412, 1,
1.028632, -1.084914, 2.069999, 1, 0, 0.9490196, 1,
1.029564, -1.167361, 1.683723, 1, 0, 0.9411765, 1,
1.031346, -0.648641, 1.828273, 1, 0, 0.9372549, 1,
1.042218, 1.099769, 2.762912, 1, 0, 0.9294118, 1,
1.044101, 1.380604, 1.395001, 1, 0, 0.9254902, 1,
1.044644, -0.004051804, 1.319884, 1, 0, 0.9176471, 1,
1.053783, -0.650919, 3.225114, 1, 0, 0.9137255, 1,
1.059561, 0.6483107, 0.9121936, 1, 0, 0.9058824, 1,
1.061041, -0.8429098, 3.535973, 1, 0, 0.9019608, 1,
1.06813, 0.9880204, -0.7462863, 1, 0, 0.8941177, 1,
1.081111, 0.6065013, 2.814128, 1, 0, 0.8862745, 1,
1.083208, -1.603264, 2.175841, 1, 0, 0.8823529, 1,
1.084351, -0.8931791, 2.801583, 1, 0, 0.8745098, 1,
1.084709, 0.2773613, 0.07607055, 1, 0, 0.8705882, 1,
1.0888, -0.9956414, 1.663757, 1, 0, 0.8627451, 1,
1.100857, -0.5993135, 1.096373, 1, 0, 0.8588235, 1,
1.102373, 2.064173, 1.650357, 1, 0, 0.8509804, 1,
1.11286, 0.5041859, 1.078136, 1, 0, 0.8470588, 1,
1.113661, 1.855474, 1.192624, 1, 0, 0.8392157, 1,
1.117726, -1.173384, 3.496245, 1, 0, 0.8352941, 1,
1.119029, 1.406538, 1.072158, 1, 0, 0.827451, 1,
1.124078, -0.8097149, 1.33733, 1, 0, 0.8235294, 1,
1.126159, 1.10019, -0.5904531, 1, 0, 0.8156863, 1,
1.126604, -1.587335, 1.173616, 1, 0, 0.8117647, 1,
1.12872, -0.5710143, 1.746036, 1, 0, 0.8039216, 1,
1.129826, 0.01741686, 0.6542926, 1, 0, 0.7960784, 1,
1.130655, 0.2643737, 1.373174, 1, 0, 0.7921569, 1,
1.132475, -0.2916386, 2.086168, 1, 0, 0.7843137, 1,
1.138258, -0.9397025, 2.741743, 1, 0, 0.7803922, 1,
1.141963, -1.107932, 0.887118, 1, 0, 0.772549, 1,
1.143593, -0.0287494, 2.55809, 1, 0, 0.7686275, 1,
1.146411, -0.1943687, 1.455415, 1, 0, 0.7607843, 1,
1.146764, -0.07971858, 2.033069, 1, 0, 0.7568628, 1,
1.147449, -0.3313985, 1.684103, 1, 0, 0.7490196, 1,
1.159826, -0.1046842, 3.173522, 1, 0, 0.7450981, 1,
1.160038, 0.3616681, 2.385106, 1, 0, 0.7372549, 1,
1.17019, 0.1790078, 2.290197, 1, 0, 0.7333333, 1,
1.170321, -0.9874924, 1.872617, 1, 0, 0.7254902, 1,
1.17617, -0.6428136, 2.227646, 1, 0, 0.7215686, 1,
1.17875, 0.9786531, 1.723975, 1, 0, 0.7137255, 1,
1.180089, -1.2195, 3.091931, 1, 0, 0.7098039, 1,
1.18409, 1.633129, 1.08335, 1, 0, 0.7019608, 1,
1.191028, 0.8209904, 1.209203, 1, 0, 0.6941177, 1,
1.192939, 0.5886188, 0.9097945, 1, 0, 0.6901961, 1,
1.194855, 0.7377068, 1.678172, 1, 0, 0.682353, 1,
1.196543, 0.01005406, 0.2845016, 1, 0, 0.6784314, 1,
1.199572, -1.432473, 2.971401, 1, 0, 0.6705883, 1,
1.201289, 0.7143495, 1.085369, 1, 0, 0.6666667, 1,
1.214445, -1.397274, 4.203103, 1, 0, 0.6588235, 1,
1.214685, -1.758108, 1.134363, 1, 0, 0.654902, 1,
1.227483, -0.1432349, 0.6841691, 1, 0, 0.6470588, 1,
1.235906, -0.5767589, 4.39135, 1, 0, 0.6431373, 1,
1.24309, 1.048441, -0.05691281, 1, 0, 0.6352941, 1,
1.244359, -1.213798, 2.359397, 1, 0, 0.6313726, 1,
1.250176, 0.5166036, 3.069033, 1, 0, 0.6235294, 1,
1.25809, -1.443561, 2.306948, 1, 0, 0.6196079, 1,
1.271603, 0.2845514, 0.3786658, 1, 0, 0.6117647, 1,
1.283231, 0.6810243, -0.4944516, 1, 0, 0.6078432, 1,
1.287156, -1.380992, 1.51673, 1, 0, 0.6, 1,
1.288023, 0.5823468, 2.555528, 1, 0, 0.5921569, 1,
1.289201, -0.837342, 2.150689, 1, 0, 0.5882353, 1,
1.304305, 0.2823994, -0.08028807, 1, 0, 0.5803922, 1,
1.304484, 0.7525336, 0.476962, 1, 0, 0.5764706, 1,
1.305135, 0.7506915, 0.1911031, 1, 0, 0.5686275, 1,
1.307921, -1.222492, 1.484858, 1, 0, 0.5647059, 1,
1.311204, 1.110477, 0.5645847, 1, 0, 0.5568628, 1,
1.317617, -1.3167, 3.46366, 1, 0, 0.5529412, 1,
1.342445, 0.3049438, 1.74485, 1, 0, 0.5450981, 1,
1.348797, 1.314312, 0.3959542, 1, 0, 0.5411765, 1,
1.351889, -1.651727, 0.7488307, 1, 0, 0.5333334, 1,
1.35681, -1.483179, 2.445219, 1, 0, 0.5294118, 1,
1.361569, 1.430487, -0.3410488, 1, 0, 0.5215687, 1,
1.363728, -0.5653226, 1.804051, 1, 0, 0.5176471, 1,
1.364893, 0.3111818, 1.30835, 1, 0, 0.509804, 1,
1.366006, 0.9239265, 0.5955251, 1, 0, 0.5058824, 1,
1.374237, -1.707967, 3.045336, 1, 0, 0.4980392, 1,
1.37429, 1.614431, -0.1813408, 1, 0, 0.4901961, 1,
1.379502, 0.5009803, 1.370181, 1, 0, 0.4862745, 1,
1.387067, -0.7539755, 1.261222, 1, 0, 0.4784314, 1,
1.398183, 0.8975269, 1.068115, 1, 0, 0.4745098, 1,
1.398446, 1.049265, -0.8663719, 1, 0, 0.4666667, 1,
1.406938, 0.06243731, 1.09037, 1, 0, 0.4627451, 1,
1.41503, -0.1958223, 1.496919, 1, 0, 0.454902, 1,
1.415431, -0.5239057, 1.89287, 1, 0, 0.4509804, 1,
1.438643, 2.304535, -0.2393042, 1, 0, 0.4431373, 1,
1.44669, -0.5577999, 1.942981, 1, 0, 0.4392157, 1,
1.459871, 1.582417, -0.2480154, 1, 0, 0.4313726, 1,
1.463444, 0.4048316, 2.509604, 1, 0, 0.427451, 1,
1.498309, 1.18125, 1.445807, 1, 0, 0.4196078, 1,
1.500437, 1.108069, 2.229085, 1, 0, 0.4156863, 1,
1.504254, -1.148521, 3.149084, 1, 0, 0.4078431, 1,
1.513332, 1.516584, 1.698031, 1, 0, 0.4039216, 1,
1.515068, -1.335855, 1.292145, 1, 0, 0.3960784, 1,
1.521813, 0.9754147, 1.923756, 1, 0, 0.3882353, 1,
1.536273, 1.297301, 0.9752661, 1, 0, 0.3843137, 1,
1.545318, -0.450467, 2.7928, 1, 0, 0.3764706, 1,
1.552302, 0.6982643, 0.6591624, 1, 0, 0.372549, 1,
1.55648, 1.966061, -0.2910523, 1, 0, 0.3647059, 1,
1.563251, -0.9805873, 1.253685, 1, 0, 0.3607843, 1,
1.570741, -1.521451, 1.121896, 1, 0, 0.3529412, 1,
1.585025, 0.8588951, -0.05351086, 1, 0, 0.3490196, 1,
1.587104, 1.216781, 0.3016951, 1, 0, 0.3411765, 1,
1.591296, -1.411963, 1.408329, 1, 0, 0.3372549, 1,
1.628149, 0.1092899, 1.217107, 1, 0, 0.3294118, 1,
1.642122, 1.728926, 2.102616, 1, 0, 0.3254902, 1,
1.643326, -1.701291, 2.585858, 1, 0, 0.3176471, 1,
1.650037, -1.171088, 2.814112, 1, 0, 0.3137255, 1,
1.659783, -1.066813, 1.301501, 1, 0, 0.3058824, 1,
1.659855, 1.796183, 0.02476777, 1, 0, 0.2980392, 1,
1.672969, 0.571357, 0.4256443, 1, 0, 0.2941177, 1,
1.686537, -0.6981063, 2.590022, 1, 0, 0.2862745, 1,
1.696665, 0.5024837, 1.262681, 1, 0, 0.282353, 1,
1.708532, -1.078735, 3.706906, 1, 0, 0.2745098, 1,
1.732201, -1.562611, 3.138617, 1, 0, 0.2705882, 1,
1.732312, 1.730969, 0.15894, 1, 0, 0.2627451, 1,
1.741088, 0.6097769, 2.363501, 1, 0, 0.2588235, 1,
1.753655, 0.7824438, 0.01651564, 1, 0, 0.2509804, 1,
1.763048, 0.126643, 3.198159, 1, 0, 0.2470588, 1,
1.778885, 0.9240589, 0.8028058, 1, 0, 0.2392157, 1,
1.792926, 0.4306771, 1.16576, 1, 0, 0.2352941, 1,
1.799598, -0.6828859, 2.429643, 1, 0, 0.227451, 1,
1.810034, 0.4482766, 0.5324932, 1, 0, 0.2235294, 1,
1.810304, 0.7639032, -0.1791449, 1, 0, 0.2156863, 1,
1.8434, -1.082025, 3.2498, 1, 0, 0.2117647, 1,
1.863398, -1.725601, 3.133517, 1, 0, 0.2039216, 1,
1.87955, 0.7294181, -0.1965109, 1, 0, 0.1960784, 1,
1.889905, 1.182191, -0.5837696, 1, 0, 0.1921569, 1,
1.89086, -0.3528575, 1.929625, 1, 0, 0.1843137, 1,
1.921258, -0.3211649, 1.766079, 1, 0, 0.1803922, 1,
1.936509, 0.4129969, 1.135194, 1, 0, 0.172549, 1,
1.974887, 2.128311, 1.166061, 1, 0, 0.1686275, 1,
1.980604, 2.092366, 0.6957974, 1, 0, 0.1607843, 1,
1.990471, 0.418439, 2.061346, 1, 0, 0.1568628, 1,
1.997356, 0.6392733, 0.1404938, 1, 0, 0.1490196, 1,
2.022621, 0.5112743, -0.348342, 1, 0, 0.145098, 1,
2.061062, -1.92821, 2.844495, 1, 0, 0.1372549, 1,
2.082258, -1.917534, 2.721342, 1, 0, 0.1333333, 1,
2.100957, -0.3864329, 3.05288, 1, 0, 0.1254902, 1,
2.129242, 0.1925258, 0.8189074, 1, 0, 0.1215686, 1,
2.175638, 0.3770603, 1.232023, 1, 0, 0.1137255, 1,
2.176958, 1.342462, 2.963716, 1, 0, 0.1098039, 1,
2.196953, -0.4492724, 1.028587, 1, 0, 0.1019608, 1,
2.204055, -1.511267, 1.440698, 1, 0, 0.09411765, 1,
2.217222, 0.4770531, 1.465789, 1, 0, 0.09019608, 1,
2.237188, 0.8789131, 1.536685, 1, 0, 0.08235294, 1,
2.263087, 0.5967565, 2.40092, 1, 0, 0.07843138, 1,
2.348488, -0.1285759, 1.181611, 1, 0, 0.07058824, 1,
2.369111, -0.8054471, 1.992755, 1, 0, 0.06666667, 1,
2.490337, -1.355052, 2.43426, 1, 0, 0.05882353, 1,
2.519902, 0.3640669, 1.635111, 1, 0, 0.05490196, 1,
2.53226, 0.7803946, 2.525991, 1, 0, 0.04705882, 1,
2.562841, -2.973173, 1.116651, 1, 0, 0.04313726, 1,
2.566246, 0.7396644, 2.499419, 1, 0, 0.03529412, 1,
2.712188, 0.9744981, 0.9664654, 1, 0, 0.03137255, 1,
2.738611, -0.419248, 1.951124, 1, 0, 0.02352941, 1,
2.833019, 2.389433, 1.262517, 1, 0, 0.01960784, 1,
2.916014, -0.04233634, 3.576571, 1, 0, 0.01176471, 1,
2.932703, -1.087994, 1.056282, 1, 0, 0.007843138, 1
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
-0.1284032, -4.163801, -7.311313, 0, -0.5, 0.5, 0.5,
-0.1284032, -4.163801, -7.311313, 1, -0.5, 0.5, 0.5,
-0.1284032, -4.163801, -7.311313, 1, 1.5, 0.5, 0.5,
-0.1284032, -4.163801, -7.311313, 0, 1.5, 0.5, 0.5
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
-4.227224, -0.2732904, -7.311313, 0, -0.5, 0.5, 0.5,
-4.227224, -0.2732904, -7.311313, 1, -0.5, 0.5, 0.5,
-4.227224, -0.2732904, -7.311313, 1, 1.5, 0.5, 0.5,
-4.227224, -0.2732904, -7.311313, 0, 1.5, 0.5, 0.5
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
-4.227224, -4.163801, -0.314465, 0, -0.5, 0.5, 0.5,
-4.227224, -4.163801, -0.314465, 1, -0.5, 0.5, 0.5,
-4.227224, -4.163801, -0.314465, 1, 1.5, 0.5, 0.5,
-4.227224, -4.163801, -0.314465, 0, 1.5, 0.5, 0.5
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
-3, -3.265991, -5.696655,
2, -3.265991, -5.696655,
-3, -3.265991, -5.696655,
-3, -3.415626, -5.965765,
-2, -3.265991, -5.696655,
-2, -3.415626, -5.965765,
-1, -3.265991, -5.696655,
-1, -3.415626, -5.965765,
0, -3.265991, -5.696655,
0, -3.415626, -5.965765,
1, -3.265991, -5.696655,
1, -3.415626, -5.965765,
2, -3.265991, -5.696655,
2, -3.415626, -5.965765
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
-3, -3.714896, -6.503984, 0, -0.5, 0.5, 0.5,
-3, -3.714896, -6.503984, 1, -0.5, 0.5, 0.5,
-3, -3.714896, -6.503984, 1, 1.5, 0.5, 0.5,
-3, -3.714896, -6.503984, 0, 1.5, 0.5, 0.5,
-2, -3.714896, -6.503984, 0, -0.5, 0.5, 0.5,
-2, -3.714896, -6.503984, 1, -0.5, 0.5, 0.5,
-2, -3.714896, -6.503984, 1, 1.5, 0.5, 0.5,
-2, -3.714896, -6.503984, 0, 1.5, 0.5, 0.5,
-1, -3.714896, -6.503984, 0, -0.5, 0.5, 0.5,
-1, -3.714896, -6.503984, 1, -0.5, 0.5, 0.5,
-1, -3.714896, -6.503984, 1, 1.5, 0.5, 0.5,
-1, -3.714896, -6.503984, 0, 1.5, 0.5, 0.5,
0, -3.714896, -6.503984, 0, -0.5, 0.5, 0.5,
0, -3.714896, -6.503984, 1, -0.5, 0.5, 0.5,
0, -3.714896, -6.503984, 1, 1.5, 0.5, 0.5,
0, -3.714896, -6.503984, 0, 1.5, 0.5, 0.5,
1, -3.714896, -6.503984, 0, -0.5, 0.5, 0.5,
1, -3.714896, -6.503984, 1, -0.5, 0.5, 0.5,
1, -3.714896, -6.503984, 1, 1.5, 0.5, 0.5,
1, -3.714896, -6.503984, 0, 1.5, 0.5, 0.5,
2, -3.714896, -6.503984, 0, -0.5, 0.5, 0.5,
2, -3.714896, -6.503984, 1, -0.5, 0.5, 0.5,
2, -3.714896, -6.503984, 1, 1.5, 0.5, 0.5,
2, -3.714896, -6.503984, 0, 1.5, 0.5, 0.5
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
-3.281342, -3, -5.696655,
-3.281342, 2, -5.696655,
-3.281342, -3, -5.696655,
-3.438989, -3, -5.965765,
-3.281342, -2, -5.696655,
-3.438989, -2, -5.965765,
-3.281342, -1, -5.696655,
-3.438989, -1, -5.965765,
-3.281342, 0, -5.696655,
-3.438989, 0, -5.965765,
-3.281342, 1, -5.696655,
-3.438989, 1, -5.965765,
-3.281342, 2, -5.696655,
-3.438989, 2, -5.965765
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
-3.754283, -3, -6.503984, 0, -0.5, 0.5, 0.5,
-3.754283, -3, -6.503984, 1, -0.5, 0.5, 0.5,
-3.754283, -3, -6.503984, 1, 1.5, 0.5, 0.5,
-3.754283, -3, -6.503984, 0, 1.5, 0.5, 0.5,
-3.754283, -2, -6.503984, 0, -0.5, 0.5, 0.5,
-3.754283, -2, -6.503984, 1, -0.5, 0.5, 0.5,
-3.754283, -2, -6.503984, 1, 1.5, 0.5, 0.5,
-3.754283, -2, -6.503984, 0, 1.5, 0.5, 0.5,
-3.754283, -1, -6.503984, 0, -0.5, 0.5, 0.5,
-3.754283, -1, -6.503984, 1, -0.5, 0.5, 0.5,
-3.754283, -1, -6.503984, 1, 1.5, 0.5, 0.5,
-3.754283, -1, -6.503984, 0, 1.5, 0.5, 0.5,
-3.754283, 0, -6.503984, 0, -0.5, 0.5, 0.5,
-3.754283, 0, -6.503984, 1, -0.5, 0.5, 0.5,
-3.754283, 0, -6.503984, 1, 1.5, 0.5, 0.5,
-3.754283, 0, -6.503984, 0, 1.5, 0.5, 0.5,
-3.754283, 1, -6.503984, 0, -0.5, 0.5, 0.5,
-3.754283, 1, -6.503984, 1, -0.5, 0.5, 0.5,
-3.754283, 1, -6.503984, 1, 1.5, 0.5, 0.5,
-3.754283, 1, -6.503984, 0, 1.5, 0.5, 0.5,
-3.754283, 2, -6.503984, 0, -0.5, 0.5, 0.5,
-3.754283, 2, -6.503984, 1, -0.5, 0.5, 0.5,
-3.754283, 2, -6.503984, 1, 1.5, 0.5, 0.5,
-3.754283, 2, -6.503984, 0, 1.5, 0.5, 0.5
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
-3.281342, -3.265991, -4,
-3.281342, -3.265991, 4,
-3.281342, -3.265991, -4,
-3.438989, -3.415626, -4,
-3.281342, -3.265991, -2,
-3.438989, -3.415626, -2,
-3.281342, -3.265991, 0,
-3.438989, -3.415626, 0,
-3.281342, -3.265991, 2,
-3.438989, -3.415626, 2,
-3.281342, -3.265991, 4,
-3.438989, -3.415626, 4
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
-3.754283, -3.714896, -4, 0, -0.5, 0.5, 0.5,
-3.754283, -3.714896, -4, 1, -0.5, 0.5, 0.5,
-3.754283, -3.714896, -4, 1, 1.5, 0.5, 0.5,
-3.754283, -3.714896, -4, 0, 1.5, 0.5, 0.5,
-3.754283, -3.714896, -2, 0, -0.5, 0.5, 0.5,
-3.754283, -3.714896, -2, 1, -0.5, 0.5, 0.5,
-3.754283, -3.714896, -2, 1, 1.5, 0.5, 0.5,
-3.754283, -3.714896, -2, 0, 1.5, 0.5, 0.5,
-3.754283, -3.714896, 0, 0, -0.5, 0.5, 0.5,
-3.754283, -3.714896, 0, 1, -0.5, 0.5, 0.5,
-3.754283, -3.714896, 0, 1, 1.5, 0.5, 0.5,
-3.754283, -3.714896, 0, 0, 1.5, 0.5, 0.5,
-3.754283, -3.714896, 2, 0, -0.5, 0.5, 0.5,
-3.754283, -3.714896, 2, 1, -0.5, 0.5, 0.5,
-3.754283, -3.714896, 2, 1, 1.5, 0.5, 0.5,
-3.754283, -3.714896, 2, 0, 1.5, 0.5, 0.5,
-3.754283, -3.714896, 4, 0, -0.5, 0.5, 0.5,
-3.754283, -3.714896, 4, 1, -0.5, 0.5, 0.5,
-3.754283, -3.714896, 4, 1, 1.5, 0.5, 0.5,
-3.754283, -3.714896, 4, 0, 1.5, 0.5, 0.5
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
-3.281342, -3.265991, -5.696655,
-3.281342, 2.71941, -5.696655,
-3.281342, -3.265991, 5.067725,
-3.281342, 2.71941, 5.067725,
-3.281342, -3.265991, -5.696655,
-3.281342, -3.265991, 5.067725,
-3.281342, 2.71941, -5.696655,
-3.281342, 2.71941, 5.067725,
-3.281342, -3.265991, -5.696655,
3.024536, -3.265991, -5.696655,
-3.281342, -3.265991, 5.067725,
3.024536, -3.265991, 5.067725,
-3.281342, 2.71941, -5.696655,
3.024536, 2.71941, -5.696655,
-3.281342, 2.71941, 5.067725,
3.024536, 2.71941, 5.067725,
3.024536, -3.265991, -5.696655,
3.024536, 2.71941, -5.696655,
3.024536, -3.265991, 5.067725,
3.024536, 2.71941, 5.067725,
3.024536, -3.265991, -5.696655,
3.024536, -3.265991, 5.067725,
3.024536, 2.71941, -5.696655,
3.024536, 2.71941, 5.067725
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
var radius = 7.38866;
var distance = 32.87298;
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
mvMatrix.translate( 0.1284032, 0.2732904, 0.314465 );
mvMatrix.scale( 1.266876, 1.334708, 0.742148 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.87298);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
InChI_1S_C12H11Cl2NO<-read.table("InChI_1S_C12H11Cl2NO.xyz")
```

```
## Error in read.table("InChI_1S_C12H11Cl2NO.xyz"): no lines available in input
```

```r
x<-InChI_1S_C12H11Cl2NO$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C12H11Cl2NO' not found
```

```r
y<-InChI_1S_C12H11Cl2NO$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C12H11Cl2NO' not found
```

```r
z<-InChI_1S_C12H11Cl2NO$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C12H11Cl2NO' not found
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
-3.189509, -1.495614, -1.532071, 0, 0, 1, 1, 1,
-2.994988, 0.4945514, -2.674816, 1, 0, 0, 1, 1,
-2.764693, 0.6422074, -2.008518, 1, 0, 0, 1, 1,
-2.737973, -0.381221, -2.249686, 1, 0, 0, 1, 1,
-2.619289, 2.010204, -0.4009047, 1, 0, 0, 1, 1,
-2.563403, -0.4021299, -2.388912, 1, 0, 0, 1, 1,
-2.521868, -1.688314, -2.605106, 0, 0, 0, 1, 1,
-2.463032, -0.05123781, -2.756296, 0, 0, 0, 1, 1,
-2.437274, 0.6888767, 0.2446371, 0, 0, 0, 1, 1,
-2.386468, 0.2133779, -2.313772, 0, 0, 0, 1, 1,
-2.354393, -0.7407095, -3.699832, 0, 0, 0, 1, 1,
-2.338514, -0.9437122, -3.005302, 0, 0, 0, 1, 1,
-2.323637, 1.361266, -0.5086257, 0, 0, 0, 1, 1,
-2.240751, -0.6079899, -0.715162, 1, 1, 1, 1, 1,
-2.218378, 0.8062046, -1.787947, 1, 1, 1, 1, 1,
-2.165401, -0.3219626, -1.58971, 1, 1, 1, 1, 1,
-2.159329, 0.002209592, -1.017929, 1, 1, 1, 1, 1,
-2.089526, -1.425789, -2.940166, 1, 1, 1, 1, 1,
-2.044232, -0.105063, -3.28968, 1, 1, 1, 1, 1,
-2.02651, 0.3959548, -0.7296522, 1, 1, 1, 1, 1,
-1.988621, 1.083409, 1.149426, 1, 1, 1, 1, 1,
-1.935755, -0.2866576, -1.766655, 1, 1, 1, 1, 1,
-1.934802, 1.742239, -0.7393469, 1, 1, 1, 1, 1,
-1.914689, -0.9171212, -2.206693, 1, 1, 1, 1, 1,
-1.892603, -0.8917823, -3.835942, 1, 1, 1, 1, 1,
-1.891905, -0.2539856, -0.7826186, 1, 1, 1, 1, 1,
-1.875938, 0.1457333, -0.244058, 1, 1, 1, 1, 1,
-1.875254, -0.6384027, 0.4081244, 1, 1, 1, 1, 1,
-1.849798, 0.3083502, -0.6319838, 0, 0, 1, 1, 1,
-1.830894, 0.1706989, -1.925196, 1, 0, 0, 1, 1,
-1.829577, -1.27352, -2.901394, 1, 0, 0, 1, 1,
-1.826197, -0.4830996, -2.024546, 1, 0, 0, 1, 1,
-1.820416, 0.2808973, -1.698728, 1, 0, 0, 1, 1,
-1.809874, -0.4653844, -2.072101, 1, 0, 0, 1, 1,
-1.807098, 0.1960173, -3.624064, 0, 0, 0, 1, 1,
-1.805992, -0.8371802, -2.197139, 0, 0, 0, 1, 1,
-1.793826, -0.4064704, -2.613593, 0, 0, 0, 1, 1,
-1.788733, -1.587683, -2.615317, 0, 0, 0, 1, 1,
-1.781036, -1.143366, -2.333793, 0, 0, 0, 1, 1,
-1.779767, 2.396158, -0.9860981, 0, 0, 0, 1, 1,
-1.7509, -0.629106, -2.962255, 0, 0, 0, 1, 1,
-1.747134, -0.6996775, -2.140588, 1, 1, 1, 1, 1,
-1.741716, -0.3559051, -0.4145619, 1, 1, 1, 1, 1,
-1.734728, -0.9459389, -3.54387, 1, 1, 1, 1, 1,
-1.717546, 0.1409775, 0.3290337, 1, 1, 1, 1, 1,
-1.710676, -0.2790933, -1.39642, 1, 1, 1, 1, 1,
-1.708843, -1.075356, -1.799419, 1, 1, 1, 1, 1,
-1.699394, 0.7269686, -0.4329366, 1, 1, 1, 1, 1,
-1.695406, -0.4251981, -0.9839759, 1, 1, 1, 1, 1,
-1.687993, -2.518835, -2.775583, 1, 1, 1, 1, 1,
-1.680804, 0.4157504, -1.002129, 1, 1, 1, 1, 1,
-1.678749, 0.1048346, -1.078822, 1, 1, 1, 1, 1,
-1.677611, -0.2957242, -1.201082, 1, 1, 1, 1, 1,
-1.672232, -0.1128596, -1.281765, 1, 1, 1, 1, 1,
-1.672175, 0.3616541, -2.862632, 1, 1, 1, 1, 1,
-1.6521, 1.294171, -1.168853, 1, 1, 1, 1, 1,
-1.652076, 1.812793, -0.8573461, 0, 0, 1, 1, 1,
-1.650433, 1.107459, -0.3461306, 1, 0, 0, 1, 1,
-1.646403, 1.62965, 0.1325181, 1, 0, 0, 1, 1,
-1.632165, 0.6416543, -2.690506, 1, 0, 0, 1, 1,
-1.605706, 0.1326181, -0.4746696, 1, 0, 0, 1, 1,
-1.605186, 0.1256506, -0.4136578, 1, 0, 0, 1, 1,
-1.600677, 1.685634, -0.2440159, 0, 0, 0, 1, 1,
-1.578462, -1.722147, -3.41095, 0, 0, 0, 1, 1,
-1.578099, 0.7464151, -1.11925, 0, 0, 0, 1, 1,
-1.544174, 1.01364, 1.32003, 0, 0, 0, 1, 1,
-1.537255, 0.556026, -1.955214, 0, 0, 0, 1, 1,
-1.535178, -1.303404, -2.626354, 0, 0, 0, 1, 1,
-1.531143, -0.7984498, -3.56317, 0, 0, 0, 1, 1,
-1.524532, 0.1469643, -0.3231899, 1, 1, 1, 1, 1,
-1.519918, 1.095185, -2.832578, 1, 1, 1, 1, 1,
-1.500081, -0.474447, -2.55943, 1, 1, 1, 1, 1,
-1.496484, 1.252509, -1.074464, 1, 1, 1, 1, 1,
-1.489898, -0.1695274, -1.3593, 1, 1, 1, 1, 1,
-1.489079, 0.1809426, 0.7053046, 1, 1, 1, 1, 1,
-1.485792, -0.3150706, -2.223689, 1, 1, 1, 1, 1,
-1.475425, -1.677376, -3.253463, 1, 1, 1, 1, 1,
-1.464975, -0.3014202, -0.4868393, 1, 1, 1, 1, 1,
-1.461666, -0.09281996, -1.765069, 1, 1, 1, 1, 1,
-1.460758, -0.5181051, -2.847709, 1, 1, 1, 1, 1,
-1.436344, 1.075039, -2.1359, 1, 1, 1, 1, 1,
-1.422699, 0.4828151, -1.001766, 1, 1, 1, 1, 1,
-1.41872, -0.06078598, -0.5779606, 1, 1, 1, 1, 1,
-1.415246, 0.6844704, -0.5440664, 1, 1, 1, 1, 1,
-1.412304, -0.4696502, -3.34101, 0, 0, 1, 1, 1,
-1.410301, -0.5864876, -0.8964387, 1, 0, 0, 1, 1,
-1.405217, -0.01821499, -1.227021, 1, 0, 0, 1, 1,
-1.379665, -0.320192, -1.874241, 1, 0, 0, 1, 1,
-1.371433, 0.5191154, -0.3731239, 1, 0, 0, 1, 1,
-1.364699, 1.43259, -1.157936, 1, 0, 0, 1, 1,
-1.362705, -0.8147398, -2.204669, 0, 0, 0, 1, 1,
-1.360243, 0.2367416, -0.6450969, 0, 0, 0, 1, 1,
-1.348225, -0.4694871, -1.913086, 0, 0, 0, 1, 1,
-1.346672, -1.641634, -1.153148, 0, 0, 0, 1, 1,
-1.340379, -0.01125914, -0.1651541, 0, 0, 0, 1, 1,
-1.3335, 2.451529, 0.235433, 0, 0, 0, 1, 1,
-1.332696, -0.02463995, -0.9193607, 0, 0, 0, 1, 1,
-1.331413, 0.3302335, -1.99108, 1, 1, 1, 1, 1,
-1.320985, -2.222091, -2.574118, 1, 1, 1, 1, 1,
-1.319714, 0.6807065, -0.2416955, 1, 1, 1, 1, 1,
-1.319132, -0.01183435, -1.642572, 1, 1, 1, 1, 1,
-1.31479, 0.4053614, -0.378216, 1, 1, 1, 1, 1,
-1.31247, 0.5363995, -1.201501, 1, 1, 1, 1, 1,
-1.305501, -0.04560807, -1.795286, 1, 1, 1, 1, 1,
-1.304492, -1.330335, -3.337582, 1, 1, 1, 1, 1,
-1.28849, -1.25674, -2.869973, 1, 1, 1, 1, 1,
-1.287619, 1.312624, -0.7109219, 1, 1, 1, 1, 1,
-1.287435, 0.02973929, -0.7712504, 1, 1, 1, 1, 1,
-1.284059, 1.203975, 0.1799827, 1, 1, 1, 1, 1,
-1.281483, -0.8460681, -1.349703, 1, 1, 1, 1, 1,
-1.274695, -0.8437696, -1.863426, 1, 1, 1, 1, 1,
-1.259069, 1.00784, -1.327737, 1, 1, 1, 1, 1,
-1.248817, -0.8918343, -1.205373, 0, 0, 1, 1, 1,
-1.246821, 0.1341434, -0.5391037, 1, 0, 0, 1, 1,
-1.245689, 0.2365605, -0.6863764, 1, 0, 0, 1, 1,
-1.242292, -0.3996813, -1.181541, 1, 0, 0, 1, 1,
-1.24214, 0.0332393, -0.2772873, 1, 0, 0, 1, 1,
-1.223695, 0.1268112, -1.411012, 1, 0, 0, 1, 1,
-1.218374, -0.4167784, -2.164824, 0, 0, 0, 1, 1,
-1.212397, 0.2155176, -1.597912, 0, 0, 0, 1, 1,
-1.200201, 0.2106437, -2.553232, 0, 0, 0, 1, 1,
-1.194095, 0.06111214, -0.8909351, 0, 0, 0, 1, 1,
-1.189839, -0.7576976, -2.595626, 0, 0, 0, 1, 1,
-1.186731, -1.430841, -2.657168, 0, 0, 0, 1, 1,
-1.183786, -0.3249933, -1.361068, 0, 0, 0, 1, 1,
-1.180197, 0.2856437, -1.302446, 1, 1, 1, 1, 1,
-1.174331, -2.088271, -1.990403, 1, 1, 1, 1, 1,
-1.166397, -0.9527714, -1.764414, 1, 1, 1, 1, 1,
-1.165636, -1.259345, -2.498825, 1, 1, 1, 1, 1,
-1.164742, 1.500241, -1.240925, 1, 1, 1, 1, 1,
-1.161231, 0.1757599, -1.369622, 1, 1, 1, 1, 1,
-1.156878, -0.9493565, -1.51238, 1, 1, 1, 1, 1,
-1.154811, 0.1055449, -1.759888, 1, 1, 1, 1, 1,
-1.153238, -2.081589, -0.04806139, 1, 1, 1, 1, 1,
-1.151081, -0.9200004, -2.241392, 1, 1, 1, 1, 1,
-1.151052, -0.1219349, -1.171435, 1, 1, 1, 1, 1,
-1.141829, -1.682863, -1.779918, 1, 1, 1, 1, 1,
-1.139784, 2.319529, -1.091699, 1, 1, 1, 1, 1,
-1.138687, -0.9245269, -2.109411, 1, 1, 1, 1, 1,
-1.131861, -0.9745731, -2.520391, 1, 1, 1, 1, 1,
-1.129392, 1.704297, -0.8714848, 0, 0, 1, 1, 1,
-1.125959, 1.115061, -2.781901, 1, 0, 0, 1, 1,
-1.121151, 0.7064095, -0.9591282, 1, 0, 0, 1, 1,
-1.112427, 0.5548399, -2.25426, 1, 0, 0, 1, 1,
-1.110689, -0.9042637, -2.319644, 1, 0, 0, 1, 1,
-1.1083, -0.5944992, -1.925914, 1, 0, 0, 1, 1,
-1.102158, 0.2968276, -0.9838497, 0, 0, 0, 1, 1,
-1.098306, -0.9890646, -1.775528, 0, 0, 0, 1, 1,
-1.093329, 0.1323039, -0.975874, 0, 0, 0, 1, 1,
-1.07869, 0.4139126, -2.205898, 0, 0, 0, 1, 1,
-1.078068, 0.5283848, -1.115316, 0, 0, 0, 1, 1,
-1.077614, -1.721221, -1.243678, 0, 0, 0, 1, 1,
-1.077332, 0.4994814, -1.224011, 0, 0, 0, 1, 1,
-1.075539, -0.6403551, -4.493456, 1, 1, 1, 1, 1,
-1.075408, 0.1875666, -2.732248, 1, 1, 1, 1, 1,
-1.070826, 0.1759651, 0.4661593, 1, 1, 1, 1, 1,
-1.068729, -0.3764026, -1.04318, 1, 1, 1, 1, 1,
-1.056519, 0.3714658, -1.533447, 1, 1, 1, 1, 1,
-1.051246, -0.1593784, -0.9396448, 1, 1, 1, 1, 1,
-1.048044, 0.09169509, -0.9499291, 1, 1, 1, 1, 1,
-1.04455, -0.3296039, -1.877576, 1, 1, 1, 1, 1,
-1.033407, 0.4237288, -1.831925, 1, 1, 1, 1, 1,
-1.017676, -1.187714, -2.489742, 1, 1, 1, 1, 1,
-1.014903, -0.1101146, -1.78366, 1, 1, 1, 1, 1,
-1.009318, -0.8402874, -2.116774, 1, 1, 1, 1, 1,
-1.005641, 0.615704, -1.810063, 1, 1, 1, 1, 1,
-0.9807513, 0.06107003, -0.7270513, 1, 1, 1, 1, 1,
-0.979291, -1.329115, -3.764184, 1, 1, 1, 1, 1,
-0.9730265, 0.6393259, 0.1671819, 0, 0, 1, 1, 1,
-0.9680396, -0.03465373, -1.462777, 1, 0, 0, 1, 1,
-0.9651907, -3.104457, -1.667561, 1, 0, 0, 1, 1,
-0.9638154, -1.274094, -1.276505, 1, 0, 0, 1, 1,
-0.9622351, -0.6687984, -3.505049, 1, 0, 0, 1, 1,
-0.9608554, -0.7929673, -2.016011, 1, 0, 0, 1, 1,
-0.9543536, 2.487195, -0.4456802, 0, 0, 0, 1, 1,
-0.9477541, -0.9301939, -3.23983, 0, 0, 0, 1, 1,
-0.9434041, 0.3070923, -0.1108821, 0, 0, 0, 1, 1,
-0.9394047, -2.087451, -1.674621, 0, 0, 0, 1, 1,
-0.931754, 0.9322464, -1.049181, 0, 0, 0, 1, 1,
-0.9183793, 0.8461703, -0.5997257, 0, 0, 0, 1, 1,
-0.9044169, -1.052706, -1.624503, 0, 0, 0, 1, 1,
-0.9015353, 0.2749954, -1.571606, 1, 1, 1, 1, 1,
-0.8973585, -0.4462333, -2.619143, 1, 1, 1, 1, 1,
-0.8952438, -2.185142, -2.464967, 1, 1, 1, 1, 1,
-0.8881493, 1.326218, 0.3895959, 1, 1, 1, 1, 1,
-0.8857905, 1.328969, -0.1447283, 1, 1, 1, 1, 1,
-0.8828503, 0.4589949, -1.638816, 1, 1, 1, 1, 1,
-0.8733139, 1.426997, -0.2925331, 1, 1, 1, 1, 1,
-0.8700935, -0.573668, -1.188144, 1, 1, 1, 1, 1,
-0.8640582, -1.722065, -2.695556, 1, 1, 1, 1, 1,
-0.8640012, -0.240256, -1.476619, 1, 1, 1, 1, 1,
-0.8618115, -1.306515, -2.75959, 1, 1, 1, 1, 1,
-0.8585665, -1.000845, -1.658315, 1, 1, 1, 1, 1,
-0.8580705, -1.767504, -3.296703, 1, 1, 1, 1, 1,
-0.8568044, 0.2839826, -1.996137, 1, 1, 1, 1, 1,
-0.850861, -1.371582, -4.213594, 1, 1, 1, 1, 1,
-0.8484275, -1.291792, -2.138987, 0, 0, 1, 1, 1,
-0.8423656, -0.9464772, -2.87841, 1, 0, 0, 1, 1,
-0.8417531, 0.7461693, 0.3682344, 1, 0, 0, 1, 1,
-0.8406726, -0.2713675, -3.019997, 1, 0, 0, 1, 1,
-0.8324275, 0.2860598, -2.030653, 1, 0, 0, 1, 1,
-0.8322493, 0.02249794, -2.545461, 1, 0, 0, 1, 1,
-0.8312579, 0.3088168, -1.675442, 0, 0, 0, 1, 1,
-0.8305902, -0.2146672, -1.882857, 0, 0, 0, 1, 1,
-0.8304573, -0.8735644, -1.549326, 0, 0, 0, 1, 1,
-0.8229926, -0.7311296, -2.233621, 0, 0, 0, 1, 1,
-0.8226336, 0.2465867, -1.961206, 0, 0, 0, 1, 1,
-0.8204913, -0.3998162, -4.023385, 0, 0, 0, 1, 1,
-0.8183082, -1.143506, -2.36826, 0, 0, 0, 1, 1,
-0.8172997, -1.740978, -2.218852, 1, 1, 1, 1, 1,
-0.8099042, 0.9853448, -0.9009228, 1, 1, 1, 1, 1,
-0.809396, 0.01350696, -2.057825, 1, 1, 1, 1, 1,
-0.8091906, -0.8891811, -1.317519, 1, 1, 1, 1, 1,
-0.8058257, -0.3932075, 0.3076611, 1, 1, 1, 1, 1,
-0.7937328, 1.659337, -0.2023707, 1, 1, 1, 1, 1,
-0.7931628, 0.9398391, -1.071558, 1, 1, 1, 1, 1,
-0.7882874, 0.2391222, -1.954812, 1, 1, 1, 1, 1,
-0.7878755, 1.766319, 1.679001, 1, 1, 1, 1, 1,
-0.7776635, -0.2294372, -2.748516, 1, 1, 1, 1, 1,
-0.7759081, -0.8937992, -3.404601, 1, 1, 1, 1, 1,
-0.7666623, 0.5066046, -1.675305, 1, 1, 1, 1, 1,
-0.7665952, 0.08836575, -2.906208, 1, 1, 1, 1, 1,
-0.7649168, 0.2176615, 0.1024334, 1, 1, 1, 1, 1,
-0.7647849, 2.34151, -0.6610907, 1, 1, 1, 1, 1,
-0.7635413, 0.01512775, -2.494301, 0, 0, 1, 1, 1,
-0.7599905, 0.9884421, -0.2932348, 1, 0, 0, 1, 1,
-0.7594367, -0.4846169, -2.790048, 1, 0, 0, 1, 1,
-0.7594078, 0.8079202, -0.9482257, 1, 0, 0, 1, 1,
-0.7585483, 2.338644, 1.171827, 1, 0, 0, 1, 1,
-0.757112, 0.5052727, -0.6059444, 1, 0, 0, 1, 1,
-0.7570665, -0.08331783, -2.482347, 0, 0, 0, 1, 1,
-0.7526157, -0.02065242, -1.792093, 0, 0, 0, 1, 1,
-0.743579, 0.07455321, -0.7197264, 0, 0, 0, 1, 1,
-0.7411141, -1.816953, -4.403218, 0, 0, 0, 1, 1,
-0.7405825, 0.8322449, -1.248877, 0, 0, 0, 1, 1,
-0.7385899, 0.2339951, -2.658498, 0, 0, 0, 1, 1,
-0.737316, -0.1688838, -2.339353, 0, 0, 0, 1, 1,
-0.7301016, -0.9844874, -1.638613, 1, 1, 1, 1, 1,
-0.7268717, 0.5282899, -0.6799942, 1, 1, 1, 1, 1,
-0.7233412, 1.044888, -0.9514476, 1, 1, 1, 1, 1,
-0.7091705, -0.2532396, 0.04133172, 1, 1, 1, 1, 1,
-0.7065812, 0.002674184, -1.939829, 1, 1, 1, 1, 1,
-0.7030687, -1.315661, -3.29761, 1, 1, 1, 1, 1,
-0.7027026, 0.6295128, -0.4394184, 1, 1, 1, 1, 1,
-0.7010766, 0.6433525, -2.079767, 1, 1, 1, 1, 1,
-0.6988953, -0.7083785, -2.688326, 1, 1, 1, 1, 1,
-0.6984981, 0.9858142, -1.745434, 1, 1, 1, 1, 1,
-0.6976891, -1.062045, -3.068545, 1, 1, 1, 1, 1,
-0.6863994, 0.5307477, -1.258942, 1, 1, 1, 1, 1,
-0.6836658, -0.0912233, -1.580938, 1, 1, 1, 1, 1,
-0.6766681, -0.6744834, -1.833287, 1, 1, 1, 1, 1,
-0.6737275, -0.5030152, -4.202435, 1, 1, 1, 1, 1,
-0.673659, -0.7944791, -3.036771, 0, 0, 1, 1, 1,
-0.6520605, 0.1416542, -1.530285, 1, 0, 0, 1, 1,
-0.6505611, -0.04775989, -2.839693, 1, 0, 0, 1, 1,
-0.6503034, -0.4764259, -2.779319, 1, 0, 0, 1, 1,
-0.6474559, 1.732659, 0.5318055, 1, 0, 0, 1, 1,
-0.6443927, -0.01139757, -1.586976, 1, 0, 0, 1, 1,
-0.6416973, -0.1852676, -0.4050846, 0, 0, 0, 1, 1,
-0.6404572, 0.8277372, -0.8843139, 0, 0, 0, 1, 1,
-0.6339334, -0.7234084, -3.893695, 0, 0, 0, 1, 1,
-0.6329402, 1.167887, 0.06605787, 0, 0, 0, 1, 1,
-0.6325193, 1.425951, -0.9348314, 0, 0, 0, 1, 1,
-0.6307511, 1.076346, 0.4856474, 0, 0, 0, 1, 1,
-0.6295146, 1.746738, 0.9507872, 0, 0, 0, 1, 1,
-0.6268679, 0.7477852, -0.009711192, 1, 1, 1, 1, 1,
-0.6211105, -0.1570344, -1.266621, 1, 1, 1, 1, 1,
-0.6199224, 0.5955843, -1.5309, 1, 1, 1, 1, 1,
-0.6186541, -1.384105, -2.670427, 1, 1, 1, 1, 1,
-0.6181803, -2.243433, -2.415222, 1, 1, 1, 1, 1,
-0.6138117, 0.3976559, -0.2195651, 1, 1, 1, 1, 1,
-0.6090102, -0.9222226, -3.224016, 1, 1, 1, 1, 1,
-0.6070137, -0.1036075, -1.687774, 1, 1, 1, 1, 1,
-0.6022294, -2.684662, -3.405, 1, 1, 1, 1, 1,
-0.5994219, -0.5490541, -1.978596, 1, 1, 1, 1, 1,
-0.5970479, -0.2568617, -2.107168, 1, 1, 1, 1, 1,
-0.5948985, 0.8035801, -0.6990393, 1, 1, 1, 1, 1,
-0.5901176, 1.349398, 0.2159818, 1, 1, 1, 1, 1,
-0.5899292, 0.07256843, -3.017506, 1, 1, 1, 1, 1,
-0.5876033, -0.545642, -2.091143, 1, 1, 1, 1, 1,
-0.5805721, 0.2146601, -0.9655492, 0, 0, 1, 1, 1,
-0.5802624, -0.5642957, -1.961489, 1, 0, 0, 1, 1,
-0.5771998, -0.6705308, -3.055252, 1, 0, 0, 1, 1,
-0.574589, -0.8947107, -3.835958, 1, 0, 0, 1, 1,
-0.5721201, -0.3033109, -4.195814, 1, 0, 0, 1, 1,
-0.5677387, -0.2182448, -3.11043, 1, 0, 0, 1, 1,
-0.5663649, 1.298247, -0.3507873, 0, 0, 0, 1, 1,
-0.5623854, -0.1007481, -2.332228, 0, 0, 0, 1, 1,
-0.561196, 1.490145, 1.320341, 0, 0, 0, 1, 1,
-0.5602974, 0.6324115, 1.423951, 0, 0, 0, 1, 1,
-0.5586042, -0.291828, -1.125436, 0, 0, 0, 1, 1,
-0.5580965, 0.923797, 0.9379817, 0, 0, 0, 1, 1,
-0.5551642, -0.7269796, -3.847025, 0, 0, 0, 1, 1,
-0.553708, 1.553655, -0.365915, 1, 1, 1, 1, 1,
-0.5518823, -1.346029, -4.49394, 1, 1, 1, 1, 1,
-0.5499411, 0.9299009, 0.6614156, 1, 1, 1, 1, 1,
-0.5494825, 0.6345426, -0.9672738, 1, 1, 1, 1, 1,
-0.5473487, -1.212348, -1.820958, 1, 1, 1, 1, 1,
-0.5428183, 0.8502586, 0.05342153, 1, 1, 1, 1, 1,
-0.5389743, 0.4422093, -3.550707, 1, 1, 1, 1, 1,
-0.5357374, -0.002290447, -2.568475, 1, 1, 1, 1, 1,
-0.5355498, 0.7541872, 0.711445, 1, 1, 1, 1, 1,
-0.5334382, -1.36247, -2.027914, 1, 1, 1, 1, 1,
-0.5323094, -0.2797969, -1.957298, 1, 1, 1, 1, 1,
-0.5322449, -0.7314849, -1.678946, 1, 1, 1, 1, 1,
-0.5287184, 0.7042759, 0.4492229, 1, 1, 1, 1, 1,
-0.5280835, 0.2889077, 0.2701988, 1, 1, 1, 1, 1,
-0.5277836, 0.01143333, -1.671492, 1, 1, 1, 1, 1,
-0.5264126, -1.11285, -3.321124, 0, 0, 1, 1, 1,
-0.5230914, -0.3312752, -0.310586, 1, 0, 0, 1, 1,
-0.5224048, 0.4816458, 0.5741179, 1, 0, 0, 1, 1,
-0.5197088, -1.504789, -2.552711, 1, 0, 0, 1, 1,
-0.5192133, 0.9933125, -0.9660809, 1, 0, 0, 1, 1,
-0.518961, 1.52357, 0.5322659, 1, 0, 0, 1, 1,
-0.5161006, -0.6429743, -3.157977, 0, 0, 0, 1, 1,
-0.5100045, -1.068002, -2.584627, 0, 0, 0, 1, 1,
-0.5092151, 1.474269, -0.8685499, 0, 0, 0, 1, 1,
-0.5075709, -1.071164, -1.529521, 0, 0, 0, 1, 1,
-0.5065389, -0.7000772, -3.419785, 0, 0, 0, 1, 1,
-0.5050173, 1.357787, -0.4501899, 0, 0, 0, 1, 1,
-0.4994753, -1.386581, -5.539893, 0, 0, 0, 1, 1,
-0.4961383, -1.037262, -3.259911, 1, 1, 1, 1, 1,
-0.4960121, 0.5074751, -2.433091, 1, 1, 1, 1, 1,
-0.4865197, 0.3733786, -0.8111154, 1, 1, 1, 1, 1,
-0.4854034, -1.105674, -2.583011, 1, 1, 1, 1, 1,
-0.4848257, -1.305058, -3.951515, 1, 1, 1, 1, 1,
-0.4836329, 0.1739279, -3.257688, 1, 1, 1, 1, 1,
-0.4805193, 0.6901892, -2.224305, 1, 1, 1, 1, 1,
-0.4792726, -0.7361185, -3.905453, 1, 1, 1, 1, 1,
-0.4720843, 1.41608, -0.4419929, 1, 1, 1, 1, 1,
-0.4716816, -0.6825355, -1.103083, 1, 1, 1, 1, 1,
-0.4711601, 0.5752752, 0.4030865, 1, 1, 1, 1, 1,
-0.4688035, -1.384392, -2.911103, 1, 1, 1, 1, 1,
-0.4673348, -0.6886351, -1.99837, 1, 1, 1, 1, 1,
-0.4666865, 2.065997, 0.1438314, 1, 1, 1, 1, 1,
-0.4632073, 1.154148, -2.980283, 1, 1, 1, 1, 1,
-0.4619145, -0.9369295, -4.963667, 0, 0, 1, 1, 1,
-0.4611072, -0.01616902, -2.006708, 1, 0, 0, 1, 1,
-0.4586953, -0.1528221, -2.438019, 1, 0, 0, 1, 1,
-0.458287, -0.1779156, -3.315531, 1, 0, 0, 1, 1,
-0.458078, -1.060328, -2.404624, 1, 0, 0, 1, 1,
-0.4567565, 0.2696781, -0.7500764, 1, 0, 0, 1, 1,
-0.456752, 0.955851, 0.9420208, 0, 0, 0, 1, 1,
-0.455115, 1.779605, 0.7425393, 0, 0, 0, 1, 1,
-0.4528773, 0.1986989, -0.05593747, 0, 0, 0, 1, 1,
-0.452688, 1.145636, -1.141109, 0, 0, 0, 1, 1,
-0.4525139, 1.181962, 0.70944, 0, 0, 0, 1, 1,
-0.4509882, -0.5841147, -1.429063, 0, 0, 0, 1, 1,
-0.4498324, 0.7974283, -2.835876, 0, 0, 0, 1, 1,
-0.4490185, 0.1169071, -1.602045, 1, 1, 1, 1, 1,
-0.446151, -0.2175806, -3.685414, 1, 1, 1, 1, 1,
-0.4435975, -1.309672, -2.486346, 1, 1, 1, 1, 1,
-0.4382368, 2.281836, 1.242288, 1, 1, 1, 1, 1,
-0.437647, -1.284447, -2.785359, 1, 1, 1, 1, 1,
-0.4358566, 1.103609, -1.795554, 1, 1, 1, 1, 1,
-0.4353167, -2.359991, -3.821233, 1, 1, 1, 1, 1,
-0.4334589, -1.113395, -2.556679, 1, 1, 1, 1, 1,
-0.4299501, 1.423909, -0.9817565, 1, 1, 1, 1, 1,
-0.4283844, -0.9264878, -4.35661, 1, 1, 1, 1, 1,
-0.4218512, -1.235205, -1.89984, 1, 1, 1, 1, 1,
-0.4185835, 1.263451, -0.2266037, 1, 1, 1, 1, 1,
-0.4176589, 1.483321, 1.405748, 1, 1, 1, 1, 1,
-0.4141556, -1.039358, -4.320062, 1, 1, 1, 1, 1,
-0.4131782, 0.8130537, -0.155797, 1, 1, 1, 1, 1,
-0.4113975, -0.7943675, -1.052259, 0, 0, 1, 1, 1,
-0.4086254, 1.05643, -1.223028, 1, 0, 0, 1, 1,
-0.4086247, 1.565418, -1.099641, 1, 0, 0, 1, 1,
-0.4069326, 0.1608466, -0.7008077, 1, 0, 0, 1, 1,
-0.3994722, 0.716865, -0.6147697, 1, 0, 0, 1, 1,
-0.3978071, -0.04008166, -2.457187, 1, 0, 0, 1, 1,
-0.3954912, -0.4349804, -2.432481, 0, 0, 0, 1, 1,
-0.3949433, 0.7121631, -0.7133909, 0, 0, 0, 1, 1,
-0.3924185, -0.1650583, -3.144362, 0, 0, 0, 1, 1,
-0.389755, -1.32674, -2.758387, 0, 0, 0, 1, 1,
-0.3887364, -1.979883, -2.653567, 0, 0, 0, 1, 1,
-0.3810639, 0.3817477, -1.112342, 0, 0, 0, 1, 1,
-0.3793487, -0.36514, -2.552832, 0, 0, 0, 1, 1,
-0.3779967, 0.06973755, -2.10943, 1, 1, 1, 1, 1,
-0.3732119, 0.09954777, -1.151418, 1, 1, 1, 1, 1,
-0.3715424, 0.9117877, -1.074587, 1, 1, 1, 1, 1,
-0.3700178, 1.03389, -0.5888104, 1, 1, 1, 1, 1,
-0.3691534, -1.410554, -4.393778, 1, 1, 1, 1, 1,
-0.3663085, 0.2121505, 0.06167456, 1, 1, 1, 1, 1,
-0.3602617, 0.4651204, -2.586441, 1, 1, 1, 1, 1,
-0.3599004, -1.771369, -2.342232, 1, 1, 1, 1, 1,
-0.3571768, 1.170788, 0.7151459, 1, 1, 1, 1, 1,
-0.3570611, -0.6641537, -1.614094, 1, 1, 1, 1, 1,
-0.3563863, -0.3693095, -0.8297542, 1, 1, 1, 1, 1,
-0.3540724, -0.9701094, 0.09133804, 1, 1, 1, 1, 1,
-0.3516876, -0.5843406, -3.97161, 1, 1, 1, 1, 1,
-0.3489052, -1.252789, -2.960256, 1, 1, 1, 1, 1,
-0.3463303, -0.01847959, -1.290303, 1, 1, 1, 1, 1,
-0.3437422, -0.5424278, -2.393312, 0, 0, 1, 1, 1,
-0.34267, 1.375534, 1.90362, 1, 0, 0, 1, 1,
-0.33788, -0.4867265, -2.454005, 1, 0, 0, 1, 1,
-0.3370934, 0.2513454, -2.773257, 1, 0, 0, 1, 1,
-0.3342031, -0.6471388, -1.642324, 1, 0, 0, 1, 1,
-0.3305577, 0.2226358, -1.715671, 1, 0, 0, 1, 1,
-0.3208269, -1.72369, -3.803571, 0, 0, 0, 1, 1,
-0.3200292, 0.9005978, -1.248974, 0, 0, 0, 1, 1,
-0.3190799, 0.337149, -0.8116655, 0, 0, 0, 1, 1,
-0.3176607, 1.143007, -0.4866215, 0, 0, 0, 1, 1,
-0.3175073, 1.129464, -0.1061814, 0, 0, 0, 1, 1,
-0.3082862, -1.663791, -2.920216, 0, 0, 0, 1, 1,
-0.3044241, -1.664042, -1.833972, 0, 0, 0, 1, 1,
-0.3034846, 1.17668, -0.7242082, 1, 1, 1, 1, 1,
-0.301504, 1.84597, -0.1486563, 1, 1, 1, 1, 1,
-0.2995871, 1.821035, -1.500954, 1, 1, 1, 1, 1,
-0.2972315, -0.7985561, -3.432839, 1, 1, 1, 1, 1,
-0.2969789, 0.1917907, -1.593223, 1, 1, 1, 1, 1,
-0.2955949, -0.05628362, -3.027346, 1, 1, 1, 1, 1,
-0.2921022, -0.4525358, -2.537225, 1, 1, 1, 1, 1,
-0.2899062, 0.770923, 0.991634, 1, 1, 1, 1, 1,
-0.2840236, -0.07790872, -3.142945, 1, 1, 1, 1, 1,
-0.281506, 1.13519, 0.6666849, 1, 1, 1, 1, 1,
-0.281191, 0.3543552, 1.871207, 1, 1, 1, 1, 1,
-0.2808754, -1.366246, -3.64147, 1, 1, 1, 1, 1,
-0.2779055, 0.1261095, -1.152038, 1, 1, 1, 1, 1,
-0.2751656, -0.804647, -4.704109, 1, 1, 1, 1, 1,
-0.2746048, 0.7539278, -2.132199, 1, 1, 1, 1, 1,
-0.2595272, -0.3356428, -2.784355, 0, 0, 1, 1, 1,
-0.2581709, 0.2308894, 0.1881383, 1, 0, 0, 1, 1,
-0.25511, 1.749533, -0.8647457, 1, 0, 0, 1, 1,
-0.2525282, -1.972951, -1.162287, 1, 0, 0, 1, 1,
-0.2523791, -1.43084, -3.700369, 1, 0, 0, 1, 1,
-0.246348, 0.1628447, -0.4887287, 1, 0, 0, 1, 1,
-0.2407967, 0.6003417, 0.3769848, 0, 0, 0, 1, 1,
-0.2372693, 0.9809405, -0.9478851, 0, 0, 0, 1, 1,
-0.2359771, -0.5813746, -4.080642, 0, 0, 0, 1, 1,
-0.2343164, 2.632244, -0.9136127, 0, 0, 0, 1, 1,
-0.2331346, -1.838596, -5.079141, 0, 0, 0, 1, 1,
-0.2266637, 0.7213846, -0.4650854, 0, 0, 0, 1, 1,
-0.2227643, 1.27646, -0.9998692, 0, 0, 0, 1, 1,
-0.2179632, 0.06591874, 0.4832694, 1, 1, 1, 1, 1,
-0.2174757, 1.110359, -1.929716, 1, 1, 1, 1, 1,
-0.2145327, -0.138836, -1.860447, 1, 1, 1, 1, 1,
-0.2138598, -0.3624693, -4.123421, 1, 1, 1, 1, 1,
-0.2137763, 0.5785024, -0.4017564, 1, 1, 1, 1, 1,
-0.2122186, 0.9821664, -0.657749, 1, 1, 1, 1, 1,
-0.2073661, 0.3421182, -1.686725, 1, 1, 1, 1, 1,
-0.2041296, -1.513592, -4.255944, 1, 1, 1, 1, 1,
-0.1975048, -0.7366894, -2.626666, 1, 1, 1, 1, 1,
-0.1942712, -0.5048483, -3.427689, 1, 1, 1, 1, 1,
-0.1895256, -1.935149, -3.248673, 1, 1, 1, 1, 1,
-0.1875541, 1.119128, -1.041736, 1, 1, 1, 1, 1,
-0.1732497, 0.1272214, 0.9638145, 1, 1, 1, 1, 1,
-0.165474, 1.702577, -0.2459518, 1, 1, 1, 1, 1,
-0.1627582, -0.720976, -2.677408, 1, 1, 1, 1, 1,
-0.1626909, 0.473729, -1.214417, 0, 0, 1, 1, 1,
-0.1606011, -0.3835303, -2.978114, 1, 0, 0, 1, 1,
-0.1539627, -0.07292724, -2.000291, 1, 0, 0, 1, 1,
-0.1536371, -0.01672596, -1.338719, 1, 0, 0, 1, 1,
-0.1492051, 1.355588, -1.176113, 1, 0, 0, 1, 1,
-0.1454503, 0.02323076, -1.915666, 1, 0, 0, 1, 1,
-0.1444384, -0.9637997, -3.080977, 0, 0, 0, 1, 1,
-0.1389675, 0.1229166, -1.097371, 0, 0, 0, 1, 1,
-0.1381214, -1.682644, -3.609465, 0, 0, 0, 1, 1,
-0.1267303, 0.4037545, 0.03351421, 0, 0, 0, 1, 1,
-0.1256494, 0.7235109, 2.633265, 0, 0, 0, 1, 1,
-0.1239734, -0.0825939, -1.552894, 0, 0, 0, 1, 1,
-0.1191587, 0.5404999, -1.396916, 0, 0, 0, 1, 1,
-0.1130062, 0.3447331, 0.07178024, 1, 1, 1, 1, 1,
-0.1121201, 0.644437, 1.210137, 1, 1, 1, 1, 1,
-0.112046, -0.4072449, -0.941295, 1, 1, 1, 1, 1,
-0.1067451, 0.8417597, 0.3189587, 1, 1, 1, 1, 1,
-0.1059493, 0.1873814, -1.495976, 1, 1, 1, 1, 1,
-0.1025413, -0.307795, -2.266381, 1, 1, 1, 1, 1,
-0.09997204, 0.1791533, -1.748191, 1, 1, 1, 1, 1,
-0.09984098, 0.8180203, 1.600223, 1, 1, 1, 1, 1,
-0.09803022, -0.399345, -0.7891104, 1, 1, 1, 1, 1,
-0.09792401, -0.3965798, -0.326362, 1, 1, 1, 1, 1,
-0.0975217, 0.1892499, -0.1116793, 1, 1, 1, 1, 1,
-0.09511039, 1.935714, -0.854592, 1, 1, 1, 1, 1,
-0.09281093, 0.3855982, 0.7427583, 1, 1, 1, 1, 1,
-0.09258592, 0.7551232, 0.2464486, 1, 1, 1, 1, 1,
-0.09189136, -0.502848, -3.293585, 1, 1, 1, 1, 1,
-0.08935246, 0.8664693, 0.3976047, 0, 0, 1, 1, 1,
-0.08256448, 1.513367, 0.6108754, 1, 0, 0, 1, 1,
-0.07977054, -0.5721143, -2.441305, 1, 0, 0, 1, 1,
-0.07808496, -0.08954268, -2.159897, 1, 0, 0, 1, 1,
-0.07568652, 1.104699, -0.2829798, 1, 0, 0, 1, 1,
-0.07488544, 0.5908398, 0.242145, 1, 0, 0, 1, 1,
-0.07408209, 1.174004, 1.277466, 0, 0, 0, 1, 1,
-0.0691569, 0.01485488, -1.558775, 0, 0, 0, 1, 1,
-0.0689818, 0.2087119, 0.9168751, 0, 0, 0, 1, 1,
-0.06838745, 0.372258, 0.1996663, 0, 0, 0, 1, 1,
-0.06542995, 0.8779804, -0.2346178, 0, 0, 0, 1, 1,
-0.06141783, -0.9213994, -3.544345, 0, 0, 0, 1, 1,
-0.05776012, -0.6389414, -2.860883, 0, 0, 0, 1, 1,
-0.05227127, -0.7400725, -3.854929, 1, 1, 1, 1, 1,
-0.05096732, -1.531691, -4.421545, 1, 1, 1, 1, 1,
-0.05059797, -0.3848909, -4.136531, 1, 1, 1, 1, 1,
-0.04957368, 0.7125944, 0.9588081, 1, 1, 1, 1, 1,
-0.04777832, -1.519634, -3.004799, 1, 1, 1, 1, 1,
-0.04682624, -1.441845, -3.751125, 1, 1, 1, 1, 1,
-0.04454461, 0.9577326, -0.3679296, 1, 1, 1, 1, 1,
-0.04420464, -0.278818, -2.140054, 1, 1, 1, 1, 1,
-0.03998407, 0.02412525, -2.097938, 1, 1, 1, 1, 1,
-0.03822006, 0.4649266, -0.1366375, 1, 1, 1, 1, 1,
-0.03642246, -3.104225, -4.473364, 1, 1, 1, 1, 1,
-0.03014741, -0.8860177, -3.352734, 1, 1, 1, 1, 1,
-0.02980584, 1.11681, -0.2522297, 1, 1, 1, 1, 1,
-0.0280989, 0.4333473, -0.4232029, 1, 1, 1, 1, 1,
-0.02785719, -1.266321, -3.281237, 1, 1, 1, 1, 1,
-0.02678698, 1.383643, 0.9762409, 0, 0, 1, 1, 1,
-0.02134886, -0.973585, -3.37638, 1, 0, 0, 1, 1,
-0.01853344, -1.035989, -2.693553, 1, 0, 0, 1, 1,
-0.01406489, -0.2758127, -1.67593, 1, 0, 0, 1, 1,
-0.01379635, -0.47586, -4.042336, 1, 0, 0, 1, 1,
-0.01341777, -1.387107, -3.715231, 1, 0, 0, 1, 1,
-0.01286096, -1.110873, -4.807082, 0, 0, 0, 1, 1,
-0.01057648, -0.4424616, -3.052347, 0, 0, 0, 1, 1,
-0.009114528, -1.66174, -4.094957, 0, 0, 0, 1, 1,
-0.007199867, -0.1394185, -2.669681, 0, 0, 0, 1, 1,
0.0005286953, -0.02481719, 2.787643, 0, 0, 0, 1, 1,
0.001113521, 1.003459, -1.022326, 0, 0, 0, 1, 1,
0.001787096, -0.2166497, 4.73087, 0, 0, 0, 1, 1,
0.008627591, 0.2015568, 1.117759, 1, 1, 1, 1, 1,
0.01937312, 2.19943, 0.2441418, 1, 1, 1, 1, 1,
0.02498601, 0.5374215, 0.5197078, 1, 1, 1, 1, 1,
0.02950734, -0.3219468, 1.925715, 1, 1, 1, 1, 1,
0.03343763, 0.5064809, 0.8548739, 1, 1, 1, 1, 1,
0.03532628, -0.6481991, 3.719696, 1, 1, 1, 1, 1,
0.03765712, 0.3611497, 0.3137637, 1, 1, 1, 1, 1,
0.03857261, -0.3681371, 4.351743, 1, 1, 1, 1, 1,
0.04116058, 0.4920676, 0.5476589, 1, 1, 1, 1, 1,
0.04119462, -0.05003058, 2.817497, 1, 1, 1, 1, 1,
0.04125516, 1.274861, -0.08477036, 1, 1, 1, 1, 1,
0.04338685, 1.26396, 1.028496, 1, 1, 1, 1, 1,
0.04649161, -1.040563, 2.158091, 1, 1, 1, 1, 1,
0.04877291, 1.183461, 0.4475395, 1, 1, 1, 1, 1,
0.05082254, -0.8593079, 2.076241, 1, 1, 1, 1, 1,
0.05906351, -0.06482872, 1.791254, 0, 0, 1, 1, 1,
0.06130235, 0.4836242, -0.0594427, 1, 0, 0, 1, 1,
0.0615868, 0.8327616, -0.7881747, 1, 0, 0, 1, 1,
0.06232811, -0.8411394, 2.648671, 1, 0, 0, 1, 1,
0.06791107, -0.04303508, 1.192693, 1, 0, 0, 1, 1,
0.07206751, 0.6032547, 1.100931, 1, 0, 0, 1, 1,
0.07461302, -1.978647, 3.303451, 0, 0, 0, 1, 1,
0.07815346, -1.028637, 4.841278, 0, 0, 0, 1, 1,
0.07939136, 0.7255274, -0.2707149, 0, 0, 0, 1, 1,
0.08566334, 1.005251, 1.366963, 0, 0, 0, 1, 1,
0.09016905, 0.5242097, 0.2338767, 0, 0, 0, 1, 1,
0.09555548, 1.96165, -0.8594792, 0, 0, 0, 1, 1,
0.09634557, -0.4639219, 2.459223, 0, 0, 0, 1, 1,
0.1024365, 0.3428832, 2.333682, 1, 1, 1, 1, 1,
0.1026552, -1.396236, 0.5509622, 1, 1, 1, 1, 1,
0.1031276, -0.2750292, 3.480195, 1, 1, 1, 1, 1,
0.1073915, 1.40334, -0.44945, 1, 1, 1, 1, 1,
0.1103934, -1.262762, 4.552785, 1, 1, 1, 1, 1,
0.1131501, -0.4381257, 3.060327, 1, 1, 1, 1, 1,
0.1195997, -0.6799607, 0.7705966, 1, 1, 1, 1, 1,
0.1238193, 0.3641035, 1.610983, 1, 1, 1, 1, 1,
0.1242956, -0.8905901, 2.163318, 1, 1, 1, 1, 1,
0.1270534, 0.1435493, -0.9054805, 1, 1, 1, 1, 1,
0.1286412, -0.4248673, 2.430074, 1, 1, 1, 1, 1,
0.1306997, 0.4419393, 1.696386, 1, 1, 1, 1, 1,
0.1339495, 0.8281131, -1.767516, 1, 1, 1, 1, 1,
0.1388942, -0.9343808, 4.190354, 1, 1, 1, 1, 1,
0.1509749, 1.300912, 0.2499838, 1, 1, 1, 1, 1,
0.1567558, -1.026892, 3.803863, 0, 0, 1, 1, 1,
0.1569619, -0.1339957, 2.573815, 1, 0, 0, 1, 1,
0.1571283, 0.1258561, 1.915195, 1, 0, 0, 1, 1,
0.1588951, 1.115369, 1.134581, 1, 0, 0, 1, 1,
0.1615258, 1.518797, -1.3946, 1, 0, 0, 1, 1,
0.1631974, 0.09462562, 0.5673583, 1, 0, 0, 1, 1,
0.1634541, -0.09000724, 2.508586, 0, 0, 0, 1, 1,
0.1649712, -0.3074613, 3.787241, 0, 0, 0, 1, 1,
0.1709035, 0.8329869, -0.7413362, 0, 0, 0, 1, 1,
0.1741357, 1.107356, 2.777798, 0, 0, 0, 1, 1,
0.1741879, -1.562394, 1.640817, 0, 0, 0, 1, 1,
0.17431, -0.6137245, 2.695046, 0, 0, 0, 1, 1,
0.174768, -0.928674, 2.9618, 0, 0, 0, 1, 1,
0.1815553, 0.4852614, -0.1130441, 1, 1, 1, 1, 1,
0.1824826, -0.7624534, 2.33385, 1, 1, 1, 1, 1,
0.1841374, 0.03652287, 0.5521976, 1, 1, 1, 1, 1,
0.1843019, -0.2742161, 2.481968, 1, 1, 1, 1, 1,
0.1844473, 0.8479588, 0.4724098, 1, 1, 1, 1, 1,
0.1867485, 0.05815342, 1.485683, 1, 1, 1, 1, 1,
0.1886626, -0.8639665, 4.776872, 1, 1, 1, 1, 1,
0.1892504, 1.052205, 0.6835181, 1, 1, 1, 1, 1,
0.1936212, 0.9672771, 0.8731247, 1, 1, 1, 1, 1,
0.1949509, -0.7793639, 1.222325, 1, 1, 1, 1, 1,
0.1981496, 1.180791, 1.310931, 1, 1, 1, 1, 1,
0.2017984, -0.02809353, -0.4126279, 1, 1, 1, 1, 1,
0.2029599, 1.212878, 0.2378196, 1, 1, 1, 1, 1,
0.2046363, 0.2690815, 1.31954, 1, 1, 1, 1, 1,
0.2065862, 0.0471895, 3.346902, 1, 1, 1, 1, 1,
0.2093883, 0.2443027, -0.003939799, 0, 0, 1, 1, 1,
0.2104123, 0.4578869, 0.3104251, 1, 0, 0, 1, 1,
0.2127119, 1.179686, -0.02675899, 1, 0, 0, 1, 1,
0.2169773, 0.2431514, 0.04367721, 1, 0, 0, 1, 1,
0.2173083, 0.3433383, 1.58453, 1, 0, 0, 1, 1,
0.2196166, 0.7043526, -1.269493, 1, 0, 0, 1, 1,
0.2203012, 0.2217629, 2.140352, 0, 0, 0, 1, 1,
0.2229649, -0.3273883, 1.738086, 0, 0, 0, 1, 1,
0.2238064, -0.9481896, 2.407465, 0, 0, 0, 1, 1,
0.2239221, 0.1596241, 1.851668, 0, 0, 0, 1, 1,
0.2262795, -0.8386027, 2.228624, 0, 0, 0, 1, 1,
0.2313163, -0.9103537, 3.576069, 0, 0, 0, 1, 1,
0.2321918, -1.033844, 1.529522, 0, 0, 0, 1, 1,
0.2323779, 0.1607419, 1.789089, 1, 1, 1, 1, 1,
0.2325391, 0.9163076, -0.6552467, 1, 1, 1, 1, 1,
0.2336228, 1.14114, 0.1296621, 1, 1, 1, 1, 1,
0.2359199, 0.04165575, 0.799996, 1, 1, 1, 1, 1,
0.2359885, 0.491545, 2.185227, 1, 1, 1, 1, 1,
0.2360644, -0.293316, 1.661744, 1, 1, 1, 1, 1,
0.2388774, -0.0343304, 2.595557, 1, 1, 1, 1, 1,
0.2391889, 0.81117, 0.5191389, 1, 1, 1, 1, 1,
0.2407624, 0.2849328, 0.3380286, 1, 1, 1, 1, 1,
0.2473265, 0.3965497, 0.05369375, 1, 1, 1, 1, 1,
0.2520609, -0.3065163, 1.189893, 1, 1, 1, 1, 1,
0.2529008, 0.1164384, 2.206213, 1, 1, 1, 1, 1,
0.2540606, 0.7756752, 1.700464, 1, 1, 1, 1, 1,
0.2596006, 0.7606496, 0.1952922, 1, 1, 1, 1, 1,
0.260435, -0.6198844, 2.994481, 1, 1, 1, 1, 1,
0.2636052, -0.3223225, 2.372926, 0, 0, 1, 1, 1,
0.2645353, -0.6306681, 3.949763, 1, 0, 0, 1, 1,
0.2694317, -0.4783065, 2.924674, 1, 0, 0, 1, 1,
0.2758566, -0.4964148, 3.567925, 1, 0, 0, 1, 1,
0.2768041, 0.6783242, 1.439437, 1, 0, 0, 1, 1,
0.2799645, -0.4733695, 2.698529, 1, 0, 0, 1, 1,
0.2904995, 0.1381501, 1.627593, 0, 0, 0, 1, 1,
0.2945973, -0.4928011, 1.753231, 0, 0, 0, 1, 1,
0.2961353, 0.662791, -0.661472, 0, 0, 0, 1, 1,
0.3065904, 1.249733, 0.1838874, 0, 0, 0, 1, 1,
0.3138738, -0.1508479, 2.579873, 0, 0, 0, 1, 1,
0.3153771, -0.02189703, 1.149596, 0, 0, 0, 1, 1,
0.3169121, -1.147424, 2.87414, 0, 0, 0, 1, 1,
0.3181378, -1.327764, 4.369657, 1, 1, 1, 1, 1,
0.3181469, -0.9822483, 3.466259, 1, 1, 1, 1, 1,
0.3231125, -1.347981, 3.819165, 1, 1, 1, 1, 1,
0.3240055, 0.4967966, -0.7886292, 1, 1, 1, 1, 1,
0.3257544, -0.5578523, 3.872072, 1, 1, 1, 1, 1,
0.3361613, -0.2937113, 1.86367, 1, 1, 1, 1, 1,
0.3399369, 0.5283551, 0.3426923, 1, 1, 1, 1, 1,
0.3405024, -0.9233776, 3.443249, 1, 1, 1, 1, 1,
0.3437706, -0.5727102, 3.660687, 1, 1, 1, 1, 1,
0.3483911, 1.693737, -0.9372801, 1, 1, 1, 1, 1,
0.3508144, -0.05235885, 1.255491, 1, 1, 1, 1, 1,
0.3556836, -0.6622658, 4.833023, 1, 1, 1, 1, 1,
0.3559771, 0.3732167, 2.513666, 1, 1, 1, 1, 1,
0.3645261, 0.4179915, 1.347757, 1, 1, 1, 1, 1,
0.3645456, -0.00560612, 3.540471, 1, 1, 1, 1, 1,
0.3704301, 0.5558256, 2.08541, 0, 0, 1, 1, 1,
0.3715421, -1.058237, 2.878663, 1, 0, 0, 1, 1,
0.3718713, 0.006882567, 2.817804, 1, 0, 0, 1, 1,
0.3739034, -1.434736, 3.373351, 1, 0, 0, 1, 1,
0.37821, -0.03120538, 2.610803, 1, 0, 0, 1, 1,
0.3786196, 0.7550472, 1.691285, 1, 0, 0, 1, 1,
0.3815036, -0.3413079, 3.838261, 0, 0, 0, 1, 1,
0.3841135, 0.7277642, 1.302599, 0, 0, 0, 1, 1,
0.3869876, 0.3592144, 0.2978256, 0, 0, 0, 1, 1,
0.3874601, -0.3143398, 1.56135, 0, 0, 0, 1, 1,
0.3902615, -2.377466, 3.52038, 0, 0, 0, 1, 1,
0.3941171, 1.075088, 0.5864115, 0, 0, 0, 1, 1,
0.3944288, 0.8445859, 0.5869399, 0, 0, 0, 1, 1,
0.3957345, -0.3040614, 2.069741, 1, 1, 1, 1, 1,
0.3965003, -3.178825, 3.248584, 1, 1, 1, 1, 1,
0.3995289, -0.07477654, 2.689972, 1, 1, 1, 1, 1,
0.4038467, 0.5247653, 1.550471, 1, 1, 1, 1, 1,
0.4149396, 0.3224137, 0.7091007, 1, 1, 1, 1, 1,
0.4205052, -2.013698, 0.8963003, 1, 1, 1, 1, 1,
0.4240161, 0.3022152, -0.1476634, 1, 1, 1, 1, 1,
0.4284325, 0.5833998, 1.888676, 1, 1, 1, 1, 1,
0.4331619, 2.346472, 0.6120889, 1, 1, 1, 1, 1,
0.4332427, 0.2043172, -0.3306515, 1, 1, 1, 1, 1,
0.4354824, -1.735906, 3.082597, 1, 1, 1, 1, 1,
0.4390906, -0.428327, 2.770624, 1, 1, 1, 1, 1,
0.4479058, 1.202141, -0.2556482, 1, 1, 1, 1, 1,
0.4500773, 0.2784624, -0.1336644, 1, 1, 1, 1, 1,
0.4556112, 0.7248315, 3.432447, 1, 1, 1, 1, 1,
0.4560822, 0.2759911, 1.906154, 0, 0, 1, 1, 1,
0.457894, 0.9911478, 0.1181908, 1, 0, 0, 1, 1,
0.4581955, 0.4303917, 0.7643451, 1, 0, 0, 1, 1,
0.4590376, -1.394317, 4.062538, 1, 0, 0, 1, 1,
0.4660447, 0.2607209, 0.5281151, 1, 0, 0, 1, 1,
0.4668886, -2.117009, 2.584388, 1, 0, 0, 1, 1,
0.4700386, 0.6617272, 1.23182, 0, 0, 0, 1, 1,
0.4733109, -1.477438, 3.592682, 0, 0, 0, 1, 1,
0.4771781, -0.01936568, 3.791449, 0, 0, 0, 1, 1,
0.4829927, -1.756724, 3.055604, 0, 0, 0, 1, 1,
0.4844762, 0.5681068, -1.073413, 0, 0, 0, 1, 1,
0.4881664, 1.077248, -0.5854216, 0, 0, 0, 1, 1,
0.4882125, 0.8103864, -1.048874, 0, 0, 0, 1, 1,
0.4884937, -1.72767, 4.910963, 1, 1, 1, 1, 1,
0.4902936, -0.989143, 3.801187, 1, 1, 1, 1, 1,
0.4941409, -1.455514, 1.973396, 1, 1, 1, 1, 1,
0.4947109, -0.3683633, 2.167385, 1, 1, 1, 1, 1,
0.4994791, -1.278777, 3.408353, 1, 1, 1, 1, 1,
0.500632, 1.426225, -1.698398, 1, 1, 1, 1, 1,
0.500659, 0.8301962, 0.3804465, 1, 1, 1, 1, 1,
0.5033112, -1.002281, 3.917007, 1, 1, 1, 1, 1,
0.503571, -0.4514436, 1.377289, 1, 1, 1, 1, 1,
0.5063476, 0.06683888, 2.563994, 1, 1, 1, 1, 1,
0.5108367, -0.525759, 3.400439, 1, 1, 1, 1, 1,
0.5118527, 0.3359949, 1.070467, 1, 1, 1, 1, 1,
0.5122348, -1.908862, 1.90192, 1, 1, 1, 1, 1,
0.5154353, -0.02508356, 1.143374, 1, 1, 1, 1, 1,
0.5162135, -0.3973, 4.08548, 1, 1, 1, 1, 1,
0.517529, -0.2638333, 1.215516, 0, 0, 1, 1, 1,
0.5185549, -2.129992, 0.4764439, 1, 0, 0, 1, 1,
0.5210568, -1.959622, 3.070251, 1, 0, 0, 1, 1,
0.52267, -0.377903, 1.48578, 1, 0, 0, 1, 1,
0.5230062, -0.3936608, 3.031229, 1, 0, 0, 1, 1,
0.5240652, -0.878714, 2.242542, 1, 0, 0, 1, 1,
0.5254717, -0.5020484, 2.155197, 0, 0, 0, 1, 1,
0.5350438, -1.029425, 2.226181, 0, 0, 0, 1, 1,
0.5351464, 1.030722, -0.4229335, 0, 0, 0, 1, 1,
0.5351734, -1.96128, 3.733865, 0, 0, 0, 1, 1,
0.5357646, -1.913307, 3.558889, 0, 0, 0, 1, 1,
0.5408064, 0.6072634, 1.040842, 0, 0, 0, 1, 1,
0.5411471, 0.9562256, 0.9883614, 0, 0, 0, 1, 1,
0.5420756, -0.6322349, 4.032259, 1, 1, 1, 1, 1,
0.5421332, 0.7259344, -0.0161694, 1, 1, 1, 1, 1,
0.5462982, -0.3295348, 2.436312, 1, 1, 1, 1, 1,
0.5535795, 1.481469, 0.1092958, 1, 1, 1, 1, 1,
0.5565768, -1.487583, 3.844407, 1, 1, 1, 1, 1,
0.5588852, 0.2990345, 1.43301, 1, 1, 1, 1, 1,
0.5610821, -0.2207075, 1.428311, 1, 1, 1, 1, 1,
0.5622994, -1.5768, 3.514145, 1, 1, 1, 1, 1,
0.5638569, -1.308361, 2.863244, 1, 1, 1, 1, 1,
0.5668694, -0.2130834, 2.162868, 1, 1, 1, 1, 1,
0.5679563, -0.3124444, 3.041269, 1, 1, 1, 1, 1,
0.5706185, -1.564517, 3.658581, 1, 1, 1, 1, 1,
0.5721841, -0.09939834, 1.379625, 1, 1, 1, 1, 1,
0.573575, 0.3147703, -1.489824, 1, 1, 1, 1, 1,
0.5739003, -1.325339, 2.95568, 1, 1, 1, 1, 1,
0.5837301, -0.696752, 3.174508, 0, 0, 1, 1, 1,
0.5843166, -1.149773, 1.978669, 1, 0, 0, 1, 1,
0.5869788, 1.548181, 0.257358, 1, 0, 0, 1, 1,
0.5871265, 0.2422475, 2.604104, 1, 0, 0, 1, 1,
0.5876794, 0.5710219, 1.559097, 1, 0, 0, 1, 1,
0.5946719, -0.2078415, 0.2097004, 1, 0, 0, 1, 1,
0.596566, 0.5539225, 0.5992513, 0, 0, 0, 1, 1,
0.6039587, -2.153936, 2.385163, 0, 0, 0, 1, 1,
0.6054901, -0.8060411, 2.06709, 0, 0, 0, 1, 1,
0.6057565, 1.11734, 0.630072, 0, 0, 0, 1, 1,
0.6091727, 0.6026737, 2.786185, 0, 0, 0, 1, 1,
0.6093973, -0.5872804, 2.688698, 0, 0, 0, 1, 1,
0.6237386, 0.1350398, 2.683672, 0, 0, 0, 1, 1,
0.6256072, 0.9398248, 0.08326832, 1, 1, 1, 1, 1,
0.6297799, -0.2513363, 2.044236, 1, 1, 1, 1, 1,
0.6402471, 1.46273, 0.3186867, 1, 1, 1, 1, 1,
0.644802, 0.7608091, -0.3390404, 1, 1, 1, 1, 1,
0.6473005, 0.4446155, 0.417333, 1, 1, 1, 1, 1,
0.6473377, 0.131501, 2.209642, 1, 1, 1, 1, 1,
0.6494672, 0.02064347, 2.623542, 1, 1, 1, 1, 1,
0.6511376, 0.08356833, 2.840243, 1, 1, 1, 1, 1,
0.6527156, 0.7261102, 0.1141471, 1, 1, 1, 1, 1,
0.6573505, 0.1637573, 2.801096, 1, 1, 1, 1, 1,
0.666371, 0.06503084, 3.415321, 1, 1, 1, 1, 1,
0.6792886, -0.6276675, 2.329832, 1, 1, 1, 1, 1,
0.6825818, 0.7224383, 1.065978, 1, 1, 1, 1, 1,
0.6868399, 1.37107, 1.358645, 1, 1, 1, 1, 1,
0.6883343, -1.508099, 1.637594, 1, 1, 1, 1, 1,
0.6900885, -1.167999, 4.035186, 0, 0, 1, 1, 1,
0.6918884, 0.4973176, 1.990836, 1, 0, 0, 1, 1,
0.6927148, 0.2484199, -0.94647, 1, 0, 0, 1, 1,
0.7044671, 0.354643, 0.4398882, 1, 0, 0, 1, 1,
0.7067987, 0.4286707, 1.562643, 1, 0, 0, 1, 1,
0.7077885, -1.077438, 2.629069, 1, 0, 0, 1, 1,
0.7106792, -0.9703572, 2.728777, 0, 0, 0, 1, 1,
0.7126455, 0.1502042, 2.616949, 0, 0, 0, 1, 1,
0.7160231, -1.276236, 2.81285, 0, 0, 0, 1, 1,
0.7234789, -0.2671977, 0.07735208, 0, 0, 0, 1, 1,
0.7238358, -1.798884, 2.994547, 0, 0, 0, 1, 1,
0.7356387, 0.6359847, 2.367127, 0, 0, 0, 1, 1,
0.7362577, 1.348549, 2.687606, 0, 0, 0, 1, 1,
0.7380572, -0.145959, 0.3970301, 1, 1, 1, 1, 1,
0.7398387, -0.6857762, 2.528986, 1, 1, 1, 1, 1,
0.7420447, 0.9372864, 2.17717, 1, 1, 1, 1, 1,
0.7516072, 0.6063501, 0.7331706, 1, 1, 1, 1, 1,
0.755478, -0.4749816, 2.042337, 1, 1, 1, 1, 1,
0.7632679, -0.4377731, 1.754588, 1, 1, 1, 1, 1,
0.771594, -0.3902971, 0.7038754, 1, 1, 1, 1, 1,
0.7787083, 2.013255, -1.598803, 1, 1, 1, 1, 1,
0.7832332, 1.606154, -0.01147213, 1, 1, 1, 1, 1,
0.7839746, 0.4940788, 0.6151139, 1, 1, 1, 1, 1,
0.7859015, -0.1434567, 0.883506, 1, 1, 1, 1, 1,
0.7859764, 0.03677949, 0.5589549, 1, 1, 1, 1, 1,
0.7869841, 0.4184635, 1.442325, 1, 1, 1, 1, 1,
0.7874808, 1.458746, 2.037667, 1, 1, 1, 1, 1,
0.7890059, -0.6602712, 0.9746388, 1, 1, 1, 1, 1,
0.7890782, -0.2790806, 0.9141576, 0, 0, 1, 1, 1,
0.7956775, -0.4218106, 2.560924, 1, 0, 0, 1, 1,
0.8086589, 0.2855961, 1.901764, 1, 0, 0, 1, 1,
0.8107394, -1.479411, 4.272152, 1, 0, 0, 1, 1,
0.8168955, 0.5451602, 0.636982, 1, 0, 0, 1, 1,
0.8256248, -0.03340319, 1.854405, 1, 0, 0, 1, 1,
0.8260316, -0.3056095, 2.3868, 0, 0, 0, 1, 1,
0.8265183, -0.8229619, 1.561719, 0, 0, 0, 1, 1,
0.8282571, -0.9189077, 3.01999, 0, 0, 0, 1, 1,
0.8290185, -0.7370191, 0.2552954, 0, 0, 0, 1, 1,
0.8329639, 0.3338704, 1.697115, 0, 0, 0, 1, 1,
0.834953, 0.4403705, 1.927256, 0, 0, 0, 1, 1,
0.8372939, 0.1386451, 1.016792, 0, 0, 0, 1, 1,
0.8404189, -1.67694, 3.711047, 1, 1, 1, 1, 1,
0.841446, 1.699352, 0.497233, 1, 1, 1, 1, 1,
0.8430812, 2.519461, 1.762872, 1, 1, 1, 1, 1,
0.8458489, -0.0461017, 1.673905, 1, 1, 1, 1, 1,
0.8465616, 1.608035, 0.9254715, 1, 1, 1, 1, 1,
0.8495011, -0.5319965, 3.187436, 1, 1, 1, 1, 1,
0.8733696, 1.475385, 1.40127, 1, 1, 1, 1, 1,
0.8734359, -1.670061, 1.395233, 1, 1, 1, 1, 1,
0.8790286, 0.2299244, -0.7829001, 1, 1, 1, 1, 1,
0.8825067, -0.899416, 0.3968872, 1, 1, 1, 1, 1,
0.8903032, 1.386744, -0.9772331, 1, 1, 1, 1, 1,
0.890631, -0.06497069, 4.159276, 1, 1, 1, 1, 1,
0.8925862, 0.6863789, -1.357604, 1, 1, 1, 1, 1,
0.8955649, 0.6999712, -0.8456559, 1, 1, 1, 1, 1,
0.9037405, 0.07090549, 1.818455, 1, 1, 1, 1, 1,
0.9116795, 0.1135608, 1.845647, 0, 0, 1, 1, 1,
0.9143671, -1.805278, 4.480002, 1, 0, 0, 1, 1,
0.9187447, 0.4451282, 1.847726, 1, 0, 0, 1, 1,
0.9338661, -0.05385206, 2.560668, 1, 0, 0, 1, 1,
0.9391463, -1.128016, 3.048452, 1, 0, 0, 1, 1,
0.9431188, 0.2962877, 1.581743, 1, 0, 0, 1, 1,
0.9486222, -0.9641837, 2.182523, 0, 0, 0, 1, 1,
0.949465, 0.2337401, 0.8571748, 0, 0, 0, 1, 1,
0.951525, 2.159071, -1.113645, 0, 0, 0, 1, 1,
0.9563145, -0.19076, 2.992971, 0, 0, 0, 1, 1,
0.9657468, -0.8988637, 2.005898, 0, 0, 0, 1, 1,
0.9675868, 1.807087, 1.615557, 0, 0, 0, 1, 1,
0.9678181, -1.173673, 1.509289, 0, 0, 0, 1, 1,
0.9689847, 0.2643744, 1.339044, 1, 1, 1, 1, 1,
0.9717327, 0.8826439, 2.013003, 1, 1, 1, 1, 1,
0.9781008, 1.096033, 1.064254, 1, 1, 1, 1, 1,
0.9818072, 1.281825, 2.09127, 1, 1, 1, 1, 1,
0.9825177, 0.3465785, 1.503328, 1, 1, 1, 1, 1,
0.9859737, -0.4336043, 2.715696, 1, 1, 1, 1, 1,
0.9913221, 1.012648, 2.355801, 1, 1, 1, 1, 1,
0.9913906, -0.3107454, 2.704915, 1, 1, 1, 1, 1,
0.9929606, 0.6718613, 2.151277, 1, 1, 1, 1, 1,
1.001012, 0.04665997, 1.817378, 1, 1, 1, 1, 1,
1.004492, 0.1389115, 1.300954, 1, 1, 1, 1, 1,
1.007386, -0.5014782, 1.21145, 1, 1, 1, 1, 1,
1.00892, -1.320708, 3.443111, 1, 1, 1, 1, 1,
1.009408, -0.3256734, 0.2478312, 1, 1, 1, 1, 1,
1.018699, 1.163213, 0.8917241, 1, 1, 1, 1, 1,
1.02167, 0.4043418, -0.07563844, 0, 0, 1, 1, 1,
1.02193, 0.5331773, 1.327494, 1, 0, 0, 1, 1,
1.028632, -1.084914, 2.069999, 1, 0, 0, 1, 1,
1.029564, -1.167361, 1.683723, 1, 0, 0, 1, 1,
1.031346, -0.648641, 1.828273, 1, 0, 0, 1, 1,
1.042218, 1.099769, 2.762912, 1, 0, 0, 1, 1,
1.044101, 1.380604, 1.395001, 0, 0, 0, 1, 1,
1.044644, -0.004051804, 1.319884, 0, 0, 0, 1, 1,
1.053783, -0.650919, 3.225114, 0, 0, 0, 1, 1,
1.059561, 0.6483107, 0.9121936, 0, 0, 0, 1, 1,
1.061041, -0.8429098, 3.535973, 0, 0, 0, 1, 1,
1.06813, 0.9880204, -0.7462863, 0, 0, 0, 1, 1,
1.081111, 0.6065013, 2.814128, 0, 0, 0, 1, 1,
1.083208, -1.603264, 2.175841, 1, 1, 1, 1, 1,
1.084351, -0.8931791, 2.801583, 1, 1, 1, 1, 1,
1.084709, 0.2773613, 0.07607055, 1, 1, 1, 1, 1,
1.0888, -0.9956414, 1.663757, 1, 1, 1, 1, 1,
1.100857, -0.5993135, 1.096373, 1, 1, 1, 1, 1,
1.102373, 2.064173, 1.650357, 1, 1, 1, 1, 1,
1.11286, 0.5041859, 1.078136, 1, 1, 1, 1, 1,
1.113661, 1.855474, 1.192624, 1, 1, 1, 1, 1,
1.117726, -1.173384, 3.496245, 1, 1, 1, 1, 1,
1.119029, 1.406538, 1.072158, 1, 1, 1, 1, 1,
1.124078, -0.8097149, 1.33733, 1, 1, 1, 1, 1,
1.126159, 1.10019, -0.5904531, 1, 1, 1, 1, 1,
1.126604, -1.587335, 1.173616, 1, 1, 1, 1, 1,
1.12872, -0.5710143, 1.746036, 1, 1, 1, 1, 1,
1.129826, 0.01741686, 0.6542926, 1, 1, 1, 1, 1,
1.130655, 0.2643737, 1.373174, 0, 0, 1, 1, 1,
1.132475, -0.2916386, 2.086168, 1, 0, 0, 1, 1,
1.138258, -0.9397025, 2.741743, 1, 0, 0, 1, 1,
1.141963, -1.107932, 0.887118, 1, 0, 0, 1, 1,
1.143593, -0.0287494, 2.55809, 1, 0, 0, 1, 1,
1.146411, -0.1943687, 1.455415, 1, 0, 0, 1, 1,
1.146764, -0.07971858, 2.033069, 0, 0, 0, 1, 1,
1.147449, -0.3313985, 1.684103, 0, 0, 0, 1, 1,
1.159826, -0.1046842, 3.173522, 0, 0, 0, 1, 1,
1.160038, 0.3616681, 2.385106, 0, 0, 0, 1, 1,
1.17019, 0.1790078, 2.290197, 0, 0, 0, 1, 1,
1.170321, -0.9874924, 1.872617, 0, 0, 0, 1, 1,
1.17617, -0.6428136, 2.227646, 0, 0, 0, 1, 1,
1.17875, 0.9786531, 1.723975, 1, 1, 1, 1, 1,
1.180089, -1.2195, 3.091931, 1, 1, 1, 1, 1,
1.18409, 1.633129, 1.08335, 1, 1, 1, 1, 1,
1.191028, 0.8209904, 1.209203, 1, 1, 1, 1, 1,
1.192939, 0.5886188, 0.9097945, 1, 1, 1, 1, 1,
1.194855, 0.7377068, 1.678172, 1, 1, 1, 1, 1,
1.196543, 0.01005406, 0.2845016, 1, 1, 1, 1, 1,
1.199572, -1.432473, 2.971401, 1, 1, 1, 1, 1,
1.201289, 0.7143495, 1.085369, 1, 1, 1, 1, 1,
1.214445, -1.397274, 4.203103, 1, 1, 1, 1, 1,
1.214685, -1.758108, 1.134363, 1, 1, 1, 1, 1,
1.227483, -0.1432349, 0.6841691, 1, 1, 1, 1, 1,
1.235906, -0.5767589, 4.39135, 1, 1, 1, 1, 1,
1.24309, 1.048441, -0.05691281, 1, 1, 1, 1, 1,
1.244359, -1.213798, 2.359397, 1, 1, 1, 1, 1,
1.250176, 0.5166036, 3.069033, 0, 0, 1, 1, 1,
1.25809, -1.443561, 2.306948, 1, 0, 0, 1, 1,
1.271603, 0.2845514, 0.3786658, 1, 0, 0, 1, 1,
1.283231, 0.6810243, -0.4944516, 1, 0, 0, 1, 1,
1.287156, -1.380992, 1.51673, 1, 0, 0, 1, 1,
1.288023, 0.5823468, 2.555528, 1, 0, 0, 1, 1,
1.289201, -0.837342, 2.150689, 0, 0, 0, 1, 1,
1.304305, 0.2823994, -0.08028807, 0, 0, 0, 1, 1,
1.304484, 0.7525336, 0.476962, 0, 0, 0, 1, 1,
1.305135, 0.7506915, 0.1911031, 0, 0, 0, 1, 1,
1.307921, -1.222492, 1.484858, 0, 0, 0, 1, 1,
1.311204, 1.110477, 0.5645847, 0, 0, 0, 1, 1,
1.317617, -1.3167, 3.46366, 0, 0, 0, 1, 1,
1.342445, 0.3049438, 1.74485, 1, 1, 1, 1, 1,
1.348797, 1.314312, 0.3959542, 1, 1, 1, 1, 1,
1.351889, -1.651727, 0.7488307, 1, 1, 1, 1, 1,
1.35681, -1.483179, 2.445219, 1, 1, 1, 1, 1,
1.361569, 1.430487, -0.3410488, 1, 1, 1, 1, 1,
1.363728, -0.5653226, 1.804051, 1, 1, 1, 1, 1,
1.364893, 0.3111818, 1.30835, 1, 1, 1, 1, 1,
1.366006, 0.9239265, 0.5955251, 1, 1, 1, 1, 1,
1.374237, -1.707967, 3.045336, 1, 1, 1, 1, 1,
1.37429, 1.614431, -0.1813408, 1, 1, 1, 1, 1,
1.379502, 0.5009803, 1.370181, 1, 1, 1, 1, 1,
1.387067, -0.7539755, 1.261222, 1, 1, 1, 1, 1,
1.398183, 0.8975269, 1.068115, 1, 1, 1, 1, 1,
1.398446, 1.049265, -0.8663719, 1, 1, 1, 1, 1,
1.406938, 0.06243731, 1.09037, 1, 1, 1, 1, 1,
1.41503, -0.1958223, 1.496919, 0, 0, 1, 1, 1,
1.415431, -0.5239057, 1.89287, 1, 0, 0, 1, 1,
1.438643, 2.304535, -0.2393042, 1, 0, 0, 1, 1,
1.44669, -0.5577999, 1.942981, 1, 0, 0, 1, 1,
1.459871, 1.582417, -0.2480154, 1, 0, 0, 1, 1,
1.463444, 0.4048316, 2.509604, 1, 0, 0, 1, 1,
1.498309, 1.18125, 1.445807, 0, 0, 0, 1, 1,
1.500437, 1.108069, 2.229085, 0, 0, 0, 1, 1,
1.504254, -1.148521, 3.149084, 0, 0, 0, 1, 1,
1.513332, 1.516584, 1.698031, 0, 0, 0, 1, 1,
1.515068, -1.335855, 1.292145, 0, 0, 0, 1, 1,
1.521813, 0.9754147, 1.923756, 0, 0, 0, 1, 1,
1.536273, 1.297301, 0.9752661, 0, 0, 0, 1, 1,
1.545318, -0.450467, 2.7928, 1, 1, 1, 1, 1,
1.552302, 0.6982643, 0.6591624, 1, 1, 1, 1, 1,
1.55648, 1.966061, -0.2910523, 1, 1, 1, 1, 1,
1.563251, -0.9805873, 1.253685, 1, 1, 1, 1, 1,
1.570741, -1.521451, 1.121896, 1, 1, 1, 1, 1,
1.585025, 0.8588951, -0.05351086, 1, 1, 1, 1, 1,
1.587104, 1.216781, 0.3016951, 1, 1, 1, 1, 1,
1.591296, -1.411963, 1.408329, 1, 1, 1, 1, 1,
1.628149, 0.1092899, 1.217107, 1, 1, 1, 1, 1,
1.642122, 1.728926, 2.102616, 1, 1, 1, 1, 1,
1.643326, -1.701291, 2.585858, 1, 1, 1, 1, 1,
1.650037, -1.171088, 2.814112, 1, 1, 1, 1, 1,
1.659783, -1.066813, 1.301501, 1, 1, 1, 1, 1,
1.659855, 1.796183, 0.02476777, 1, 1, 1, 1, 1,
1.672969, 0.571357, 0.4256443, 1, 1, 1, 1, 1,
1.686537, -0.6981063, 2.590022, 0, 0, 1, 1, 1,
1.696665, 0.5024837, 1.262681, 1, 0, 0, 1, 1,
1.708532, -1.078735, 3.706906, 1, 0, 0, 1, 1,
1.732201, -1.562611, 3.138617, 1, 0, 0, 1, 1,
1.732312, 1.730969, 0.15894, 1, 0, 0, 1, 1,
1.741088, 0.6097769, 2.363501, 1, 0, 0, 1, 1,
1.753655, 0.7824438, 0.01651564, 0, 0, 0, 1, 1,
1.763048, 0.126643, 3.198159, 0, 0, 0, 1, 1,
1.778885, 0.9240589, 0.8028058, 0, 0, 0, 1, 1,
1.792926, 0.4306771, 1.16576, 0, 0, 0, 1, 1,
1.799598, -0.6828859, 2.429643, 0, 0, 0, 1, 1,
1.810034, 0.4482766, 0.5324932, 0, 0, 0, 1, 1,
1.810304, 0.7639032, -0.1791449, 0, 0, 0, 1, 1,
1.8434, -1.082025, 3.2498, 1, 1, 1, 1, 1,
1.863398, -1.725601, 3.133517, 1, 1, 1, 1, 1,
1.87955, 0.7294181, -0.1965109, 1, 1, 1, 1, 1,
1.889905, 1.182191, -0.5837696, 1, 1, 1, 1, 1,
1.89086, -0.3528575, 1.929625, 1, 1, 1, 1, 1,
1.921258, -0.3211649, 1.766079, 1, 1, 1, 1, 1,
1.936509, 0.4129969, 1.135194, 1, 1, 1, 1, 1,
1.974887, 2.128311, 1.166061, 1, 1, 1, 1, 1,
1.980604, 2.092366, 0.6957974, 1, 1, 1, 1, 1,
1.990471, 0.418439, 2.061346, 1, 1, 1, 1, 1,
1.997356, 0.6392733, 0.1404938, 1, 1, 1, 1, 1,
2.022621, 0.5112743, -0.348342, 1, 1, 1, 1, 1,
2.061062, -1.92821, 2.844495, 1, 1, 1, 1, 1,
2.082258, -1.917534, 2.721342, 1, 1, 1, 1, 1,
2.100957, -0.3864329, 3.05288, 1, 1, 1, 1, 1,
2.129242, 0.1925258, 0.8189074, 0, 0, 1, 1, 1,
2.175638, 0.3770603, 1.232023, 1, 0, 0, 1, 1,
2.176958, 1.342462, 2.963716, 1, 0, 0, 1, 1,
2.196953, -0.4492724, 1.028587, 1, 0, 0, 1, 1,
2.204055, -1.511267, 1.440698, 1, 0, 0, 1, 1,
2.217222, 0.4770531, 1.465789, 1, 0, 0, 1, 1,
2.237188, 0.8789131, 1.536685, 0, 0, 0, 1, 1,
2.263087, 0.5967565, 2.40092, 0, 0, 0, 1, 1,
2.348488, -0.1285759, 1.181611, 0, 0, 0, 1, 1,
2.369111, -0.8054471, 1.992755, 0, 0, 0, 1, 1,
2.490337, -1.355052, 2.43426, 0, 0, 0, 1, 1,
2.519902, 0.3640669, 1.635111, 0, 0, 0, 1, 1,
2.53226, 0.7803946, 2.525991, 0, 0, 0, 1, 1,
2.562841, -2.973173, 1.116651, 1, 1, 1, 1, 1,
2.566246, 0.7396644, 2.499419, 1, 1, 1, 1, 1,
2.712188, 0.9744981, 0.9664654, 1, 1, 1, 1, 1,
2.738611, -0.419248, 1.951124, 1, 1, 1, 1, 1,
2.833019, 2.389433, 1.262517, 1, 1, 1, 1, 1,
2.916014, -0.04233634, 3.576571, 1, 1, 1, 1, 1,
2.932703, -1.087994, 1.056282, 1, 1, 1, 1, 1
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
var radius = 9.236184;
var distance = 32.4417;
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
mvMatrix.translate( 0.1284032, 0.2732905, 0.314465 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.4417);
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
