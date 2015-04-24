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
-3.193987, 0.423476, -1.538706, 1, 0, 0, 1,
-2.965141, -1.113931, -3.244542, 1, 0.007843138, 0, 1,
-2.944691, -0.2601183, -2.115161, 1, 0.01176471, 0, 1,
-2.829452, -0.2624231, -1.078783, 1, 0.01960784, 0, 1,
-2.688575, 0.07532092, -1.523784, 1, 0.02352941, 0, 1,
-2.673033, 0.2700242, -1.349363, 1, 0.03137255, 0, 1,
-2.604723, 1.028818, -0.5364874, 1, 0.03529412, 0, 1,
-2.597623, -1.123518, -1.393009, 1, 0.04313726, 0, 1,
-2.570565, 0.6198238, -1.573632, 1, 0.04705882, 0, 1,
-2.518914, -0.05920343, -1.87068, 1, 0.05490196, 0, 1,
-2.456172, -1.020107, -3.489534, 1, 0.05882353, 0, 1,
-2.451237, 0.007407652, -0.1808914, 1, 0.06666667, 0, 1,
-2.418586, 1.078491, -1.141232, 1, 0.07058824, 0, 1,
-2.376129, 1.511046, 0.7597281, 1, 0.07843138, 0, 1,
-2.340275, -1.175466, -0.9573438, 1, 0.08235294, 0, 1,
-2.335793, -0.8298864, -2.577565, 1, 0.09019608, 0, 1,
-2.32902, 1.323577, -1.773922, 1, 0.09411765, 0, 1,
-2.232336, 0.4661028, -0.6634588, 1, 0.1019608, 0, 1,
-2.184242, 0.365625, -2.803817, 1, 0.1098039, 0, 1,
-2.167765, 1.762645, -0.7179869, 1, 0.1137255, 0, 1,
-2.160328, 0.4478078, -1.411577, 1, 0.1215686, 0, 1,
-2.160057, 0.8811617, 0.3384056, 1, 0.1254902, 0, 1,
-2.103608, 0.9406426, -2.379153, 1, 0.1333333, 0, 1,
-2.093744, 0.6113933, -0.5659962, 1, 0.1372549, 0, 1,
-2.069786, -0.9550987, -1.432755, 1, 0.145098, 0, 1,
-2.056284, 0.4196261, 0.1392935, 1, 0.1490196, 0, 1,
-2.047183, 1.109997, -1.542981, 1, 0.1568628, 0, 1,
-2.019619, -0.02748293, -1.439111, 1, 0.1607843, 0, 1,
-1.945507, 0.6968601, -2.641236, 1, 0.1686275, 0, 1,
-1.926115, 0.3371214, -0.9658778, 1, 0.172549, 0, 1,
-1.923981, -0.2372396, -2.902149, 1, 0.1803922, 0, 1,
-1.897776, 0.2123876, -0.00530782, 1, 0.1843137, 0, 1,
-1.89752, -0.8072979, -1.735403, 1, 0.1921569, 0, 1,
-1.896132, -1.539252, -0.5053967, 1, 0.1960784, 0, 1,
-1.887492, 0.7451434, -0.2163616, 1, 0.2039216, 0, 1,
-1.834241, 0.5680562, 0.8367426, 1, 0.2117647, 0, 1,
-1.813929, 1.234393, -1.528447, 1, 0.2156863, 0, 1,
-1.803945, 2.154291, 0.008536754, 1, 0.2235294, 0, 1,
-1.801748, -1.674227, -1.932561, 1, 0.227451, 0, 1,
-1.78998, 1.028123, 0.8661188, 1, 0.2352941, 0, 1,
-1.775544, 1.102816, -0.530188, 1, 0.2392157, 0, 1,
-1.77372, 0.1852849, -3.735453, 1, 0.2470588, 0, 1,
-1.753923, 0.447671, -1.727644, 1, 0.2509804, 0, 1,
-1.741449, -0.9324856, -1.197644, 1, 0.2588235, 0, 1,
-1.736109, 0.9402629, -1.529745, 1, 0.2627451, 0, 1,
-1.697438, 1.133654, 0.3687921, 1, 0.2705882, 0, 1,
-1.690293, -1.255334, -1.374248, 1, 0.2745098, 0, 1,
-1.664331, 0.1922751, -0.8683129, 1, 0.282353, 0, 1,
-1.657937, -0.2395903, -0.8109871, 1, 0.2862745, 0, 1,
-1.653446, 0.5275857, -2.20395, 1, 0.2941177, 0, 1,
-1.634665, 1.562746, 1.132489, 1, 0.3019608, 0, 1,
-1.609073, 0.3978242, -2.55841, 1, 0.3058824, 0, 1,
-1.608101, -0.8593031, -1.930991, 1, 0.3137255, 0, 1,
-1.600968, 0.475601, -0.3176213, 1, 0.3176471, 0, 1,
-1.600555, -0.585044, -2.106645, 1, 0.3254902, 0, 1,
-1.586933, -0.9212446, -0.8935732, 1, 0.3294118, 0, 1,
-1.575999, -0.3887147, -1.842823, 1, 0.3372549, 0, 1,
-1.566338, 0.08204985, -2.264266, 1, 0.3411765, 0, 1,
-1.560815, -0.5674514, -2.259394, 1, 0.3490196, 0, 1,
-1.542541, -0.06907281, -1.885479, 1, 0.3529412, 0, 1,
-1.53124, 0.01194919, -3.24852, 1, 0.3607843, 0, 1,
-1.521078, -1.364875, -3.114989, 1, 0.3647059, 0, 1,
-1.515812, -0.7580532, -3.794755, 1, 0.372549, 0, 1,
-1.508367, -0.791706, -0.9508262, 1, 0.3764706, 0, 1,
-1.504216, 0.03976363, -3.781825, 1, 0.3843137, 0, 1,
-1.493642, -0.3475284, -2.250947, 1, 0.3882353, 0, 1,
-1.484859, -0.7877494, -0.8977143, 1, 0.3960784, 0, 1,
-1.469326, 0.3094057, -2.255491, 1, 0.4039216, 0, 1,
-1.457466, -0.3944327, -1.092043, 1, 0.4078431, 0, 1,
-1.455449, -2.37097, -2.54214, 1, 0.4156863, 0, 1,
-1.453016, -1.727699, -3.36533, 1, 0.4196078, 0, 1,
-1.452343, 0.8155997, 0.5468564, 1, 0.427451, 0, 1,
-1.450372, -0.03830624, -1.252192, 1, 0.4313726, 0, 1,
-1.449171, -1.148524, -1.471166, 1, 0.4392157, 0, 1,
-1.445639, 0.7468082, 0.3856331, 1, 0.4431373, 0, 1,
-1.437224, -0.2662877, -0.6312463, 1, 0.4509804, 0, 1,
-1.431977, 0.8301976, -1.943664, 1, 0.454902, 0, 1,
-1.43009, 1.583252, 0.661532, 1, 0.4627451, 0, 1,
-1.426169, -0.004725279, -1.534266, 1, 0.4666667, 0, 1,
-1.421458, -0.02696307, -1.873368, 1, 0.4745098, 0, 1,
-1.417865, 0.4739965, -1.500414, 1, 0.4784314, 0, 1,
-1.417279, -0.9551068, -2.969836, 1, 0.4862745, 0, 1,
-1.408643, -0.03577634, -0.7142891, 1, 0.4901961, 0, 1,
-1.40795, 0.3926001, -0.7712657, 1, 0.4980392, 0, 1,
-1.404007, -1.240427, -1.340018, 1, 0.5058824, 0, 1,
-1.399975, 1.410941, -1.454754, 1, 0.509804, 0, 1,
-1.370055, -2.04734, -2.346077, 1, 0.5176471, 0, 1,
-1.354897, -1.171826, -2.010055, 1, 0.5215687, 0, 1,
-1.34567, 0.2218972, -0.6598941, 1, 0.5294118, 0, 1,
-1.337391, -0.6943557, -1.70593, 1, 0.5333334, 0, 1,
-1.317039, -0.9503039, -1.181977, 1, 0.5411765, 0, 1,
-1.293914, -0.4143228, -3.725834, 1, 0.5450981, 0, 1,
-1.28879, -1.994931, -0.9557221, 1, 0.5529412, 0, 1,
-1.287765, 1.591712, -0.4840227, 1, 0.5568628, 0, 1,
-1.272247, 0.1223481, -1.447316, 1, 0.5647059, 0, 1,
-1.269284, 0.4144008, -0.5515956, 1, 0.5686275, 0, 1,
-1.264003, -0.5942748, -1.410038, 1, 0.5764706, 0, 1,
-1.256479, 1.419203, -0.6481296, 1, 0.5803922, 0, 1,
-1.242733, 1.449993, -0.5403873, 1, 0.5882353, 0, 1,
-1.241582, 1.8443, -1.784679, 1, 0.5921569, 0, 1,
-1.240841, 0.608451, 0.1510626, 1, 0.6, 0, 1,
-1.240219, -0.02400386, -1.177259, 1, 0.6078432, 0, 1,
-1.233712, -1.226758, -2.997038, 1, 0.6117647, 0, 1,
-1.230289, 0.4207296, 0.02691071, 1, 0.6196079, 0, 1,
-1.214698, 0.2286583, -0.6806921, 1, 0.6235294, 0, 1,
-1.211235, -2.257936, -3.867168, 1, 0.6313726, 0, 1,
-1.205402, 0.555174, -3.51667, 1, 0.6352941, 0, 1,
-1.193297, 0.6935726, -1.516795, 1, 0.6431373, 0, 1,
-1.192182, 0.4180306, 2.174397, 1, 0.6470588, 0, 1,
-1.188972, -1.067258, -1.239988, 1, 0.654902, 0, 1,
-1.184892, -0.5852241, 0.04035609, 1, 0.6588235, 0, 1,
-1.172668, 0.849403, -2.987286, 1, 0.6666667, 0, 1,
-1.168523, -0.4004676, -1.697424, 1, 0.6705883, 0, 1,
-1.164726, 1.694014, -2.637744, 1, 0.6784314, 0, 1,
-1.164631, -0.4359062, -2.655399, 1, 0.682353, 0, 1,
-1.162435, -0.2624863, -2.768195, 1, 0.6901961, 0, 1,
-1.159757, 0.171072, -1.399391, 1, 0.6941177, 0, 1,
-1.159647, 0.3996617, -1.338023, 1, 0.7019608, 0, 1,
-1.15811, -0.3384973, -2.046825, 1, 0.7098039, 0, 1,
-1.152595, 1.337713, -2.221, 1, 0.7137255, 0, 1,
-1.149913, 0.9877864, -1.438415, 1, 0.7215686, 0, 1,
-1.148854, -0.007810036, -1.608403, 1, 0.7254902, 0, 1,
-1.134528, 0.995952, -0.7569942, 1, 0.7333333, 0, 1,
-1.1293, -0.7148336, -1.753238, 1, 0.7372549, 0, 1,
-1.128408, -1.257502, -2.941274, 1, 0.7450981, 0, 1,
-1.126163, 0.742088, -1.677646, 1, 0.7490196, 0, 1,
-1.123943, -0.8149743, -1.551157, 1, 0.7568628, 0, 1,
-1.12049, -0.9879199, -2.591773, 1, 0.7607843, 0, 1,
-1.111407, 0.3929834, -0.7844643, 1, 0.7686275, 0, 1,
-1.098354, -0.467555, -3.595948, 1, 0.772549, 0, 1,
-1.097024, 0.3534661, -0.3204643, 1, 0.7803922, 0, 1,
-1.09655, -0.04989305, -0.6771119, 1, 0.7843137, 0, 1,
-1.089053, 0.5359029, 0.02565947, 1, 0.7921569, 0, 1,
-1.086561, 0.7082943, -0.5624965, 1, 0.7960784, 0, 1,
-1.082997, -1.045214, -0.7912809, 1, 0.8039216, 0, 1,
-1.079295, 0.7899324, 0.7027048, 1, 0.8117647, 0, 1,
-1.078265, -1.038594, -2.733058, 1, 0.8156863, 0, 1,
-1.075358, -2.551416, -3.381541, 1, 0.8235294, 0, 1,
-1.075033, -0.3064713, -1.990656, 1, 0.827451, 0, 1,
-1.064035, -0.7933409, -2.078662, 1, 0.8352941, 0, 1,
-1.062315, -2.31658, -0.8022031, 1, 0.8392157, 0, 1,
-1.06138, -0.7656099, -2.139269, 1, 0.8470588, 0, 1,
-1.058812, 1.328365, -0.8113339, 1, 0.8509804, 0, 1,
-1.053142, -0.1945537, -0.5797628, 1, 0.8588235, 0, 1,
-1.05307, 0.6853611, 0.2589169, 1, 0.8627451, 0, 1,
-1.045146, -0.5969754, -1.359755, 1, 0.8705882, 0, 1,
-1.043148, -0.686358, -3.441235, 1, 0.8745098, 0, 1,
-1.03601, -0.3752755, -0.5994897, 1, 0.8823529, 0, 1,
-1.033149, -2.052822, -3.330341, 1, 0.8862745, 0, 1,
-1.028192, -0.1492137, -1.611655, 1, 0.8941177, 0, 1,
-1.027559, -0.7818491, -3.051035, 1, 0.8980392, 0, 1,
-1.027111, -1.275507, -3.570963, 1, 0.9058824, 0, 1,
-1.017115, -0.1621271, -1.848944, 1, 0.9137255, 0, 1,
-1.014935, 0.4388546, -0.9309119, 1, 0.9176471, 0, 1,
-1.012895, 0.6417187, 1.323102, 1, 0.9254902, 0, 1,
-1.007853, -0.2441474, -2.538125, 1, 0.9294118, 0, 1,
-1.00478, -0.526647, -1.591904, 1, 0.9372549, 0, 1,
-1.000504, 0.4811645, -0.4838627, 1, 0.9411765, 0, 1,
-0.9969941, -0.1958992, -1.867011, 1, 0.9490196, 0, 1,
-0.9937675, -1.656658, -2.535536, 1, 0.9529412, 0, 1,
-0.9908845, 0.04452127, -1.542659, 1, 0.9607843, 0, 1,
-0.9836787, 0.02642681, -1.246942, 1, 0.9647059, 0, 1,
-0.9812863, 0.9853259, -1.506988, 1, 0.972549, 0, 1,
-0.9777356, -0.2135119, -0.2784045, 1, 0.9764706, 0, 1,
-0.9775054, -1.528826, -2.799332, 1, 0.9843137, 0, 1,
-0.9758698, -1.085823, -3.911605, 1, 0.9882353, 0, 1,
-0.9628374, -0.1699981, -1.695225, 1, 0.9960784, 0, 1,
-0.9528288, 2.276524, 0.1804375, 0.9960784, 1, 0, 1,
-0.9522334, -0.09852912, -1.163899, 0.9921569, 1, 0, 1,
-0.9520493, -1.534126, -2.620698, 0.9843137, 1, 0, 1,
-0.9506074, -0.07079071, -0.8843797, 0.9803922, 1, 0, 1,
-0.9483244, -1.297897, -2.425537, 0.972549, 1, 0, 1,
-0.9482707, -1.731122, -2.108072, 0.9686275, 1, 0, 1,
-0.9469834, 0.8482573, 0.7984121, 0.9607843, 1, 0, 1,
-0.9432256, -0.7786889, -2.54864, 0.9568627, 1, 0, 1,
-0.9429314, 1.950842, -0.3415759, 0.9490196, 1, 0, 1,
-0.93866, 0.6659576, -0.5262288, 0.945098, 1, 0, 1,
-0.9371641, -0.09999991, -1.722802, 0.9372549, 1, 0, 1,
-0.9295869, -0.44897, -2.477952, 0.9333333, 1, 0, 1,
-0.9289701, 2.664551, 1.686477, 0.9254902, 1, 0, 1,
-0.9278818, 0.3749615, -3.287334, 0.9215686, 1, 0, 1,
-0.9232877, 0.7551547, -0.4110149, 0.9137255, 1, 0, 1,
-0.9222747, -0.4886102, -3.376894, 0.9098039, 1, 0, 1,
-0.9217128, 0.6152912, 0.02712531, 0.9019608, 1, 0, 1,
-0.9195426, 0.5494573, -1.515994, 0.8941177, 1, 0, 1,
-0.9181328, 0.8395926, -1.10769, 0.8901961, 1, 0, 1,
-0.9178143, -0.5430686, -2.447511, 0.8823529, 1, 0, 1,
-0.9167123, 0.01842418, -1.534993, 0.8784314, 1, 0, 1,
-0.9088025, 0.530035, -2.639005, 0.8705882, 1, 0, 1,
-0.9072979, 0.6524781, -1.054589, 0.8666667, 1, 0, 1,
-0.906071, 0.01348624, -0.5203438, 0.8588235, 1, 0, 1,
-0.9055812, 0.4532297, -1.771367, 0.854902, 1, 0, 1,
-0.900944, 0.3311968, -1.947133, 0.8470588, 1, 0, 1,
-0.9001374, -2.135269, -3.506517, 0.8431373, 1, 0, 1,
-0.8989465, -0.2519906, -0.9590149, 0.8352941, 1, 0, 1,
-0.8947464, -0.6038753, -2.373592, 0.8313726, 1, 0, 1,
-0.8924997, 1.104259, -1.158611, 0.8235294, 1, 0, 1,
-0.8916589, -0.3105741, -2.376565, 0.8196079, 1, 0, 1,
-0.8870103, 1.642928, 0.9540371, 0.8117647, 1, 0, 1,
-0.8861555, -2.220327, -1.94126, 0.8078431, 1, 0, 1,
-0.8836583, -0.1135385, -0.09163257, 0.8, 1, 0, 1,
-0.8807607, -0.5509676, -2.145111, 0.7921569, 1, 0, 1,
-0.8807589, 1.005602, 0.4664271, 0.7882353, 1, 0, 1,
-0.8709403, 1.454982, 0.3457421, 0.7803922, 1, 0, 1,
-0.870289, -0.1560234, -2.460343, 0.7764706, 1, 0, 1,
-0.8667316, 1.305961, -0.78259, 0.7686275, 1, 0, 1,
-0.8558585, 0.5808406, -1.014836, 0.7647059, 1, 0, 1,
-0.8549983, -0.6140814, -2.310122, 0.7568628, 1, 0, 1,
-0.8491585, 0.1121163, -2.43656, 0.7529412, 1, 0, 1,
-0.8400292, -0.4421785, -1.891798, 0.7450981, 1, 0, 1,
-0.8378402, -1.092512, -2.25012, 0.7411765, 1, 0, 1,
-0.8377833, -0.3649525, -1.716126, 0.7333333, 1, 0, 1,
-0.8357456, -0.9268274, -1.504867, 0.7294118, 1, 0, 1,
-0.8350556, 0.373446, 0.3911996, 0.7215686, 1, 0, 1,
-0.8349745, -0.5275004, -2.252848, 0.7176471, 1, 0, 1,
-0.8323157, 1.273345, 0.8398552, 0.7098039, 1, 0, 1,
-0.8287218, 1.507665, 0.1374709, 0.7058824, 1, 0, 1,
-0.8273525, 1.113113, 1.081368, 0.6980392, 1, 0, 1,
-0.8217561, -1.851296, -2.52551, 0.6901961, 1, 0, 1,
-0.8196772, -1.709245, -4.517423, 0.6862745, 1, 0, 1,
-0.8188349, -1.525528, -2.700791, 0.6784314, 1, 0, 1,
-0.8174187, -1.354212, -4.53177, 0.6745098, 1, 0, 1,
-0.8116401, 0.4083634, -1.812293, 0.6666667, 1, 0, 1,
-0.8076754, 1.941521, -0.4790375, 0.6627451, 1, 0, 1,
-0.7981953, -0.3468831, -1.87792, 0.654902, 1, 0, 1,
-0.7959862, 1.32852, -1.542302, 0.6509804, 1, 0, 1,
-0.7926517, -1.456985, -3.795389, 0.6431373, 1, 0, 1,
-0.7925158, -0.2120618, -2.587371, 0.6392157, 1, 0, 1,
-0.7903131, -1.252039, -2.312742, 0.6313726, 1, 0, 1,
-0.7889491, 0.4150526, -3.157195, 0.627451, 1, 0, 1,
-0.7867455, -0.8959091, -4.140133, 0.6196079, 1, 0, 1,
-0.7864196, 0.983785, -0.8316187, 0.6156863, 1, 0, 1,
-0.7821061, -0.3135598, -0.6989654, 0.6078432, 1, 0, 1,
-0.7801859, -0.3494059, 0.04015641, 0.6039216, 1, 0, 1,
-0.7738532, -1.058695, -3.175237, 0.5960785, 1, 0, 1,
-0.7723475, 0.1558964, -0.4515227, 0.5882353, 1, 0, 1,
-0.7722149, 0.05300823, -2.579985, 0.5843138, 1, 0, 1,
-0.7677313, 0.3090499, -2.45195, 0.5764706, 1, 0, 1,
-0.7675717, -1.148809, -3.556865, 0.572549, 1, 0, 1,
-0.7674285, 0.5112009, -1.88285, 0.5647059, 1, 0, 1,
-0.7524123, -0.3513864, -0.9689654, 0.5607843, 1, 0, 1,
-0.747217, 0.1195385, -1.91584, 0.5529412, 1, 0, 1,
-0.7373523, 0.4821766, -1.159656, 0.5490196, 1, 0, 1,
-0.7289135, -1.603734, -1.981779, 0.5411765, 1, 0, 1,
-0.7265111, -0.7990018, -2.229787, 0.5372549, 1, 0, 1,
-0.7223541, 2.524262, -1.229556, 0.5294118, 1, 0, 1,
-0.7185029, 0.730608, -0.09533193, 0.5254902, 1, 0, 1,
-0.7124031, 0.2799819, -0.7043762, 0.5176471, 1, 0, 1,
-0.7071246, 0.4757642, -1.832252, 0.5137255, 1, 0, 1,
-0.7061267, 1.028137, -0.7927885, 0.5058824, 1, 0, 1,
-0.6966335, 0.5748802, -2.252833, 0.5019608, 1, 0, 1,
-0.6933293, -0.3249662, -1.200578, 0.4941176, 1, 0, 1,
-0.6931834, -0.5237855, -2.526663, 0.4862745, 1, 0, 1,
-0.69274, -0.51949, -2.248585, 0.4823529, 1, 0, 1,
-0.6922324, -0.4844324, -2.693457, 0.4745098, 1, 0, 1,
-0.6920202, 0.1177697, -1.389916, 0.4705882, 1, 0, 1,
-0.6914226, -1.003247, -3.165144, 0.4627451, 1, 0, 1,
-0.6904883, 0.964146, -1.419782, 0.4588235, 1, 0, 1,
-0.6903538, 0.8919791, 0.1966585, 0.4509804, 1, 0, 1,
-0.6898079, -0.277219, -2.196362, 0.4470588, 1, 0, 1,
-0.686111, 2.205762, -0.7350942, 0.4392157, 1, 0, 1,
-0.6845211, 0.7405791, -0.1324372, 0.4352941, 1, 0, 1,
-0.6787001, 0.04364484, -2.968294, 0.427451, 1, 0, 1,
-0.6780645, 0.6783431, -2.288511, 0.4235294, 1, 0, 1,
-0.6751513, 0.5368326, 0.3977334, 0.4156863, 1, 0, 1,
-0.6747476, 1.938212, -1.581645, 0.4117647, 1, 0, 1,
-0.6727377, 1.357167, -0.5791818, 0.4039216, 1, 0, 1,
-0.6669551, -0.08305847, -0.4351192, 0.3960784, 1, 0, 1,
-0.6654904, -1.367975, -2.644708, 0.3921569, 1, 0, 1,
-0.6616287, 0.989532, -0.1238196, 0.3843137, 1, 0, 1,
-0.6585708, 0.4281829, -1.48296, 0.3803922, 1, 0, 1,
-0.6583216, -0.9120103, -1.880157, 0.372549, 1, 0, 1,
-0.6576314, 0.8404279, -1.700659, 0.3686275, 1, 0, 1,
-0.6546789, -2.165807, -2.508801, 0.3607843, 1, 0, 1,
-0.6465015, -2.117302, -3.804192, 0.3568628, 1, 0, 1,
-0.6388376, 0.2105083, -1.21791, 0.3490196, 1, 0, 1,
-0.6375096, -1.476293, -3.206629, 0.345098, 1, 0, 1,
-0.6373057, -0.4148704, -0.1253638, 0.3372549, 1, 0, 1,
-0.6342855, 1.338363, -0.9759879, 0.3333333, 1, 0, 1,
-0.6329839, 0.03104836, -1.954995, 0.3254902, 1, 0, 1,
-0.6231958, 1.333985, -1.116292, 0.3215686, 1, 0, 1,
-0.6179558, 0.5614429, -1.024748, 0.3137255, 1, 0, 1,
-0.6177245, -0.8723844, -3.29531, 0.3098039, 1, 0, 1,
-0.6169336, -1.076268, -2.695733, 0.3019608, 1, 0, 1,
-0.6156501, -1.95686, -3.531881, 0.2941177, 1, 0, 1,
-0.6129841, 1.444809, -0.5743373, 0.2901961, 1, 0, 1,
-0.6097948, 0.6639384, -0.926287, 0.282353, 1, 0, 1,
-0.6082289, 1.182485, 0.1422726, 0.2784314, 1, 0, 1,
-0.6067068, 0.1640034, -0.7881692, 0.2705882, 1, 0, 1,
-0.6058401, -0.7625715, -1.672269, 0.2666667, 1, 0, 1,
-0.6006771, -0.004940238, -2.26308, 0.2588235, 1, 0, 1,
-0.5947071, -0.8244581, -3.089572, 0.254902, 1, 0, 1,
-0.5938698, 1.26381, -1.26079, 0.2470588, 1, 0, 1,
-0.5918191, 1.111621, 0.4134425, 0.2431373, 1, 0, 1,
-0.5909627, 3.185694, -0.1519836, 0.2352941, 1, 0, 1,
-0.5893768, 0.1714527, 0.1579505, 0.2313726, 1, 0, 1,
-0.5890936, 0.1459271, -0.1926042, 0.2235294, 1, 0, 1,
-0.5882689, 1.164363, -1.895398, 0.2196078, 1, 0, 1,
-0.5849561, -1.584149, -0.9603483, 0.2117647, 1, 0, 1,
-0.5783505, -1.866195, -4.390249, 0.2078431, 1, 0, 1,
-0.5755103, -0.75942, -3.382461, 0.2, 1, 0, 1,
-0.5752271, -1.01948, -3.519507, 0.1921569, 1, 0, 1,
-0.564772, 1.199271, -0.3130936, 0.1882353, 1, 0, 1,
-0.5605682, 0.06255832, -2.491612, 0.1803922, 1, 0, 1,
-0.5603505, 1.188668, 1.18975, 0.1764706, 1, 0, 1,
-0.5560614, 0.726535, -0.9566026, 0.1686275, 1, 0, 1,
-0.5544133, 0.3604853, -0.4450459, 0.1647059, 1, 0, 1,
-0.5540929, 0.3621304, -2.403371, 0.1568628, 1, 0, 1,
-0.5536766, 0.4967163, -1.541601, 0.1529412, 1, 0, 1,
-0.5525198, 0.5196463, -0.6379459, 0.145098, 1, 0, 1,
-0.5492808, -0.5622048, -1.347007, 0.1411765, 1, 0, 1,
-0.5478501, 0.2493135, 0.0609008, 0.1333333, 1, 0, 1,
-0.5438414, 0.2381214, 0.4730901, 0.1294118, 1, 0, 1,
-0.5435891, -0.864746, -4.396309, 0.1215686, 1, 0, 1,
-0.5419026, 0.2872529, -1.644952, 0.1176471, 1, 0, 1,
-0.5321548, 0.2806252, -2.287147, 0.1098039, 1, 0, 1,
-0.5295014, -0.2443837, -2.886986, 0.1058824, 1, 0, 1,
-0.5223579, -0.4807807, -2.510098, 0.09803922, 1, 0, 1,
-0.5217716, -1.113504, -2.63499, 0.09019608, 1, 0, 1,
-0.5195921, -1.9415, -2.664665, 0.08627451, 1, 0, 1,
-0.5147403, 1.286946, 0.7607929, 0.07843138, 1, 0, 1,
-0.5121601, 0.8510514, 0.4775623, 0.07450981, 1, 0, 1,
-0.5116071, 1.116118, -0.267731, 0.06666667, 1, 0, 1,
-0.5091059, 0.6795004, -1.756375, 0.0627451, 1, 0, 1,
-0.504904, -0.170495, -2.916053, 0.05490196, 1, 0, 1,
-0.5043038, -0.5708019, -2.305266, 0.05098039, 1, 0, 1,
-0.5010297, 1.258957, -1.374646, 0.04313726, 1, 0, 1,
-0.4997647, -0.5292598, -1.496741, 0.03921569, 1, 0, 1,
-0.4980738, -1.241987, -3.292452, 0.03137255, 1, 0, 1,
-0.4919659, -1.051067, -2.47399, 0.02745098, 1, 0, 1,
-0.4851054, -0.08609878, -2.933001, 0.01960784, 1, 0, 1,
-0.4781872, -1.552449, -2.087584, 0.01568628, 1, 0, 1,
-0.4767264, 0.3047922, -2.662412, 0.007843138, 1, 0, 1,
-0.473696, 0.1671749, -0.0581057, 0.003921569, 1, 0, 1,
-0.4725854, 1.669192, 0.1772963, 0, 1, 0.003921569, 1,
-0.4671311, 0.1536027, -3.212836, 0, 1, 0.01176471, 1,
-0.4652428, 1.329238, 0.6224751, 0, 1, 0.01568628, 1,
-0.4621247, -0.855895, -3.019486, 0, 1, 0.02352941, 1,
-0.4617302, -0.8837107, -5.011055, 0, 1, 0.02745098, 1,
-0.4588929, -0.02069838, 0.4687118, 0, 1, 0.03529412, 1,
-0.4585533, -0.4693691, -1.876501, 0, 1, 0.03921569, 1,
-0.4526272, -0.8268069, -1.859563, 0, 1, 0.04705882, 1,
-0.4524063, 0.2392847, -1.042498, 0, 1, 0.05098039, 1,
-0.4483652, 2.145448, -1.535945, 0, 1, 0.05882353, 1,
-0.4442564, -0.3475883, -3.219676, 0, 1, 0.0627451, 1,
-0.4391373, -0.439204, -0.8310016, 0, 1, 0.07058824, 1,
-0.4363775, 0.9436949, 1.974003, 0, 1, 0.07450981, 1,
-0.423481, 1.507486, 1.219287, 0, 1, 0.08235294, 1,
-0.4165253, 0.7549059, -0.898551, 0, 1, 0.08627451, 1,
-0.4080417, 0.8675938, -0.7509267, 0, 1, 0.09411765, 1,
-0.4037895, -0.3992064, -1.507632, 0, 1, 0.1019608, 1,
-0.3965179, -0.4440803, -3.006337, 0, 1, 0.1058824, 1,
-0.387516, -0.6406326, -3.392372, 0, 1, 0.1137255, 1,
-0.3872767, -0.1784316, -1.643816, 0, 1, 0.1176471, 1,
-0.381775, -1.231256, -2.631284, 0, 1, 0.1254902, 1,
-0.3740821, 0.1687211, -0.7023765, 0, 1, 0.1294118, 1,
-0.3734542, -0.3652052, -0.1240201, 0, 1, 0.1372549, 1,
-0.3659541, -0.9645367, -3.876211, 0, 1, 0.1411765, 1,
-0.3644119, 1.150607, 1.159077, 0, 1, 0.1490196, 1,
-0.3619602, 1.512286, -2.474262, 0, 1, 0.1529412, 1,
-0.3605793, 0.5615119, -0.8239319, 0, 1, 0.1607843, 1,
-0.3561848, -1.063785, -3.474108, 0, 1, 0.1647059, 1,
-0.3560341, -0.6025476, -2.067851, 0, 1, 0.172549, 1,
-0.3538528, -1.248735, -3.615973, 0, 1, 0.1764706, 1,
-0.3496642, -0.6603117, -2.701102, 0, 1, 0.1843137, 1,
-0.3472439, 0.5694601, -0.173639, 0, 1, 0.1882353, 1,
-0.346629, 1.169566, -0.5794266, 0, 1, 0.1960784, 1,
-0.3413075, 0.4955083, -2.395048, 0, 1, 0.2039216, 1,
-0.3409466, 0.1494136, -3.356819, 0, 1, 0.2078431, 1,
-0.3405226, -0.5146987, -1.893491, 0, 1, 0.2156863, 1,
-0.336508, 0.9715191, -0.6432609, 0, 1, 0.2196078, 1,
-0.3326431, 0.9641891, -1.668287, 0, 1, 0.227451, 1,
-0.3303521, -0.6449379, -1.928488, 0, 1, 0.2313726, 1,
-0.3296342, -1.183787, -3.616649, 0, 1, 0.2392157, 1,
-0.3285106, -2.02868, -2.460364, 0, 1, 0.2431373, 1,
-0.3259566, -2.322788, -4.04102, 0, 1, 0.2509804, 1,
-0.3244912, -0.01863261, -2.204258, 0, 1, 0.254902, 1,
-0.3216382, 0.5793854, 0.1541847, 0, 1, 0.2627451, 1,
-0.3140952, -0.9798597, -2.967295, 0, 1, 0.2666667, 1,
-0.3139579, -0.238684, -0.7672181, 0, 1, 0.2745098, 1,
-0.3127937, -0.7928841, -3.211629, 0, 1, 0.2784314, 1,
-0.3120478, 0.6715438, -0.7285203, 0, 1, 0.2862745, 1,
-0.3120021, 0.7550228, -2.506929, 0, 1, 0.2901961, 1,
-0.3115032, -0.2811004, -2.497336, 0, 1, 0.2980392, 1,
-0.3083199, -2.504354, -3.572617, 0, 1, 0.3058824, 1,
-0.3015134, -0.004235662, -1.474774, 0, 1, 0.3098039, 1,
-0.3005114, 0.3000931, 0.4033969, 0, 1, 0.3176471, 1,
-0.3002605, -0.8901439, -2.276362, 0, 1, 0.3215686, 1,
-0.2996686, 1.674801, -0.07135493, 0, 1, 0.3294118, 1,
-0.2988791, 0.7537941, 0.1193722, 0, 1, 0.3333333, 1,
-0.2978607, 2.036656, 0.5341061, 0, 1, 0.3411765, 1,
-0.2977775, -0.4393413, -1.941464, 0, 1, 0.345098, 1,
-0.2960934, -0.4365786, -2.854625, 0, 1, 0.3529412, 1,
-0.2955985, 0.3920513, -0.547716, 0, 1, 0.3568628, 1,
-0.2873572, -0.3968457, -0.04891941, 0, 1, 0.3647059, 1,
-0.2846733, 0.2164353, -1.99311, 0, 1, 0.3686275, 1,
-0.2834886, 1.948465, 0.1049803, 0, 1, 0.3764706, 1,
-0.274165, 0.6004882, -0.5206591, 0, 1, 0.3803922, 1,
-0.2725731, -0.7793202, -1.272447, 0, 1, 0.3882353, 1,
-0.2696845, 1.083205, 0.218353, 0, 1, 0.3921569, 1,
-0.2630303, -1.22127, -3.362878, 0, 1, 0.4, 1,
-0.2596423, 1.039147, 0.8131337, 0, 1, 0.4078431, 1,
-0.2593032, -0.2961185, -0.6538776, 0, 1, 0.4117647, 1,
-0.2561769, -2.168432, -2.633802, 0, 1, 0.4196078, 1,
-0.2551285, -0.1687873, -2.384192, 0, 1, 0.4235294, 1,
-0.2542088, -1.199007, -1.001836, 0, 1, 0.4313726, 1,
-0.2505644, -0.6963322, -3.012527, 0, 1, 0.4352941, 1,
-0.2500227, 1.439799, -0.3082774, 0, 1, 0.4431373, 1,
-0.2442747, 1.318058, -0.02381026, 0, 1, 0.4470588, 1,
-0.2415567, 0.2746629, 0.3676791, 0, 1, 0.454902, 1,
-0.2406206, -0.5469751, -4.212949, 0, 1, 0.4588235, 1,
-0.2338454, 0.4335918, 0.3258759, 0, 1, 0.4666667, 1,
-0.2298187, 0.7093465, -1.060195, 0, 1, 0.4705882, 1,
-0.2280065, -0.4591326, -2.022753, 0, 1, 0.4784314, 1,
-0.2253883, 0.02666844, -1.821235, 0, 1, 0.4823529, 1,
-0.2215391, -0.3425328, -1.946577, 0, 1, 0.4901961, 1,
-0.2200132, -1.447507, -0.5448502, 0, 1, 0.4941176, 1,
-0.2189609, 1.01297, 0.5235742, 0, 1, 0.5019608, 1,
-0.2188405, -0.09831988, -2.225615, 0, 1, 0.509804, 1,
-0.2153738, -0.4909494, -4.436953, 0, 1, 0.5137255, 1,
-0.2096063, -0.08448346, -1.93215, 0, 1, 0.5215687, 1,
-0.2063254, -0.3066228, -4.597279, 0, 1, 0.5254902, 1,
-0.2062155, 0.04653184, -0.1722512, 0, 1, 0.5333334, 1,
-0.2060558, 0.2258806, 0.2571572, 0, 1, 0.5372549, 1,
-0.2058478, -0.2250232, -2.741445, 0, 1, 0.5450981, 1,
-0.2056684, -0.3177556, -3.002184, 0, 1, 0.5490196, 1,
-0.2042687, -1.649381, -3.229408, 0, 1, 0.5568628, 1,
-0.2015844, 1.197786, 1.885712, 0, 1, 0.5607843, 1,
-0.2008602, 1.056815, -0.01849038, 0, 1, 0.5686275, 1,
-0.1925776, 0.3967483, 0.2327194, 0, 1, 0.572549, 1,
-0.1911893, 0.3675497, 0.04360142, 0, 1, 0.5803922, 1,
-0.1909847, -1.124203, -3.125535, 0, 1, 0.5843138, 1,
-0.1847425, 2.755537, -0.3847913, 0, 1, 0.5921569, 1,
-0.1804895, -1.000735, -1.341498, 0, 1, 0.5960785, 1,
-0.1800361, -1.177727, -3.45018, 0, 1, 0.6039216, 1,
-0.178111, -0.4378635, -3.218704, 0, 1, 0.6117647, 1,
-0.1745229, 2.274319, -0.9470224, 0, 1, 0.6156863, 1,
-0.1653928, -0.1099266, -2.111958, 0, 1, 0.6235294, 1,
-0.1653561, -0.3114416, -4.749238, 0, 1, 0.627451, 1,
-0.1641303, 0.6112921, 0.3214569, 0, 1, 0.6352941, 1,
-0.1611929, 0.2441838, 0.6153494, 0, 1, 0.6392157, 1,
-0.1604328, -1.873766, -3.55573, 0, 1, 0.6470588, 1,
-0.1526527, -1.160525, -3.575255, 0, 1, 0.6509804, 1,
-0.1501814, 0.9508767, 2.000207, 0, 1, 0.6588235, 1,
-0.1475366, 0.5402225, 1.793627, 0, 1, 0.6627451, 1,
-0.1473574, -0.133812, -2.48419, 0, 1, 0.6705883, 1,
-0.1462186, 0.6378964, -0.4448026, 0, 1, 0.6745098, 1,
-0.1452185, 0.8348655, 0.3818226, 0, 1, 0.682353, 1,
-0.1350159, -1.819074, -3.56946, 0, 1, 0.6862745, 1,
-0.131744, -0.5988872, -3.196695, 0, 1, 0.6941177, 1,
-0.131257, -0.05938968, -2.647307, 0, 1, 0.7019608, 1,
-0.1201677, 0.9201324, -0.7823232, 0, 1, 0.7058824, 1,
-0.1196797, 0.3964054, 0.2725915, 0, 1, 0.7137255, 1,
-0.1190021, -2.022286, -3.719293, 0, 1, 0.7176471, 1,
-0.1185136, -1.890206, -3.859382, 0, 1, 0.7254902, 1,
-0.1173455, 1.086572, 0.1608264, 0, 1, 0.7294118, 1,
-0.1143865, 0.2790622, -0.1581073, 0, 1, 0.7372549, 1,
-0.107267, -0.6070413, -4.706004, 0, 1, 0.7411765, 1,
-0.09986484, -0.7513292, -3.015159, 0, 1, 0.7490196, 1,
-0.09967627, -0.3025771, -3.836887, 0, 1, 0.7529412, 1,
-0.09966388, 0.3076095, -0.8969229, 0, 1, 0.7607843, 1,
-0.09867182, -2.777559, -1.242756, 0, 1, 0.7647059, 1,
-0.09753929, 0.1263601, -1.63221, 0, 1, 0.772549, 1,
-0.09740505, -0.736743, -3.747889, 0, 1, 0.7764706, 1,
-0.09576268, 0.6137245, -0.5730448, 0, 1, 0.7843137, 1,
-0.09466856, -0.6698619, -2.301046, 0, 1, 0.7882353, 1,
-0.08918209, 0.1591093, -0.2343595, 0, 1, 0.7960784, 1,
-0.08460441, -0.8929096, -2.471372, 0, 1, 0.8039216, 1,
-0.0824042, 0.617358, 0.3050787, 0, 1, 0.8078431, 1,
-0.08005556, -3.029993, -3.668156, 0, 1, 0.8156863, 1,
-0.07027712, 1.982866, -0.1304019, 0, 1, 0.8196079, 1,
-0.06985274, 0.08907303, -1.428728, 0, 1, 0.827451, 1,
-0.06449711, 1.097155, 0.7893007, 0, 1, 0.8313726, 1,
-0.06434584, -2.048018, -4.295031, 0, 1, 0.8392157, 1,
-0.06095085, -1.027306, -3.200225, 0, 1, 0.8431373, 1,
-0.05758791, -0.03047995, -1.242713, 0, 1, 0.8509804, 1,
-0.05248914, 0.4619269, -1.57132, 0, 1, 0.854902, 1,
-0.04803964, -1.721778, -3.263536, 0, 1, 0.8627451, 1,
-0.04538654, 0.1303665, -1.597467, 0, 1, 0.8666667, 1,
-0.04450556, -0.9548222, -3.452122, 0, 1, 0.8745098, 1,
-0.04364002, -0.6391307, -1.375787, 0, 1, 0.8784314, 1,
-0.04159856, 1.07136, 0.03095917, 0, 1, 0.8862745, 1,
-0.03919058, -1.588602, -3.320277, 0, 1, 0.8901961, 1,
-0.0386527, -0.4155343, -3.564801, 0, 1, 0.8980392, 1,
-0.03476081, 0.6090427, 0.5119869, 0, 1, 0.9058824, 1,
-0.03346415, -0.06083422, -3.615604, 0, 1, 0.9098039, 1,
-0.03288924, -0.2936211, -5.371837, 0, 1, 0.9176471, 1,
-0.03014095, -0.4074511, -1.616098, 0, 1, 0.9215686, 1,
-0.02553953, 0.5490104, -0.5812186, 0, 1, 0.9294118, 1,
-0.02545398, -0.9070426, -3.226181, 0, 1, 0.9333333, 1,
-0.02473561, -0.3627124, -3.518605, 0, 1, 0.9411765, 1,
-0.02456647, 0.1671813, -0.2652889, 0, 1, 0.945098, 1,
-0.02280364, -0.417628, -4.176326, 0, 1, 0.9529412, 1,
-0.02081407, 0.6547614, 0.1861113, 0, 1, 0.9568627, 1,
-0.02001816, -0.7399592, -1.794973, 0, 1, 0.9647059, 1,
-0.01822289, 1.342572, 0.1209204, 0, 1, 0.9686275, 1,
-0.01777351, -1.683189, -4.325393, 0, 1, 0.9764706, 1,
-0.01553751, -0.6529613, -3.344091, 0, 1, 0.9803922, 1,
-0.01150043, 0.5240279, -0.5659311, 0, 1, 0.9882353, 1,
-0.008469982, -0.8662935, -1.969853, 0, 1, 0.9921569, 1,
-0.003187386, 2.036441, 0.2976227, 0, 1, 1, 1,
-0.001869752, 0.1445453, 1.546618, 0, 0.9921569, 1, 1,
0.006333681, 1.667992, 0.7111052, 0, 0.9882353, 1, 1,
0.006532577, 0.8431346, -0.00643105, 0, 0.9803922, 1, 1,
0.009416895, -1.505638, 4.518759, 0, 0.9764706, 1, 1,
0.01225985, 0.6403415, -0.8795643, 0, 0.9686275, 1, 1,
0.01243995, 0.004018291, 0.7884999, 0, 0.9647059, 1, 1,
0.01268774, -0.1651399, 3.093726, 0, 0.9568627, 1, 1,
0.01277029, -1.139177, 4.402425, 0, 0.9529412, 1, 1,
0.01368248, -0.4755176, 2.042919, 0, 0.945098, 1, 1,
0.01619142, 0.4810888, -2.11863, 0, 0.9411765, 1, 1,
0.02004908, -0.5925606, 3.130612, 0, 0.9333333, 1, 1,
0.02270986, 0.7978653, -0.5632315, 0, 0.9294118, 1, 1,
0.02476158, 0.2989144, -0.166323, 0, 0.9215686, 1, 1,
0.02785675, -0.5121434, 2.490292, 0, 0.9176471, 1, 1,
0.03147151, 0.4797593, -0.1778666, 0, 0.9098039, 1, 1,
0.03434772, -1.683352, 5.677171, 0, 0.9058824, 1, 1,
0.03670608, 0.08620783, 1.661886, 0, 0.8980392, 1, 1,
0.03979215, -1.392749, 4.118332, 0, 0.8901961, 1, 1,
0.04462367, 0.1180114, 1.849775, 0, 0.8862745, 1, 1,
0.04744315, 0.7251212, 0.6598348, 0, 0.8784314, 1, 1,
0.05210143, 0.4978416, 0.773115, 0, 0.8745098, 1, 1,
0.05291771, -0.333081, 2.324799, 0, 0.8666667, 1, 1,
0.05603472, -1.124322, 1.500976, 0, 0.8627451, 1, 1,
0.06509352, 0.09344813, 2.124404, 0, 0.854902, 1, 1,
0.07022841, -0.1614289, 3.460254, 0, 0.8509804, 1, 1,
0.07184014, -0.9329436, 5.948698, 0, 0.8431373, 1, 1,
0.07324795, -0.8615301, 0.7879863, 0, 0.8392157, 1, 1,
0.07364518, -0.1174752, 3.446255, 0, 0.8313726, 1, 1,
0.0748046, 0.1204907, 1.072738, 0, 0.827451, 1, 1,
0.07845082, 1.351593, -1.278355, 0, 0.8196079, 1, 1,
0.07962862, -0.152317, 3.340445, 0, 0.8156863, 1, 1,
0.08663055, 0.9252691, -0.4256794, 0, 0.8078431, 1, 1,
0.09225623, -1.53598, 5.66725, 0, 0.8039216, 1, 1,
0.09355841, -1.433514, 5.426114, 0, 0.7960784, 1, 1,
0.09395897, -1.296161, 3.456834, 0, 0.7882353, 1, 1,
0.09897352, 1.068578, 0.7603502, 0, 0.7843137, 1, 1,
0.09994724, -1.893802, 2.871866, 0, 0.7764706, 1, 1,
0.1014022, -0.8860217, 3.142087, 0, 0.772549, 1, 1,
0.1046939, -0.6133942, 1.628368, 0, 0.7647059, 1, 1,
0.1055933, -1.727323, 3.554205, 0, 0.7607843, 1, 1,
0.1056738, 1.44522, -0.7944016, 0, 0.7529412, 1, 1,
0.1089697, -0.2992828, 3.824015, 0, 0.7490196, 1, 1,
0.1094795, 0.4741653, 0.09440178, 0, 0.7411765, 1, 1,
0.1103693, 0.2866291, 1.460554, 0, 0.7372549, 1, 1,
0.112931, 1.389545, -0.8475031, 0, 0.7294118, 1, 1,
0.1132008, -1.161182, 3.359134, 0, 0.7254902, 1, 1,
0.1140428, -0.8097669, 3.606602, 0, 0.7176471, 1, 1,
0.1190636, -0.4145066, 3.683801, 0, 0.7137255, 1, 1,
0.1235412, -0.5463962, 4.125985, 0, 0.7058824, 1, 1,
0.1248831, 1.071769, -1.343928, 0, 0.6980392, 1, 1,
0.1357108, 1.256848, -0.5877488, 0, 0.6941177, 1, 1,
0.1388693, 0.8796149, -0.3424558, 0, 0.6862745, 1, 1,
0.1453163, -0.6757547, 1.818381, 0, 0.682353, 1, 1,
0.145519, -0.2310701, 1.875175, 0, 0.6745098, 1, 1,
0.1503735, 0.3306494, -0.01288725, 0, 0.6705883, 1, 1,
0.1569564, -0.9158929, 3.037656, 0, 0.6627451, 1, 1,
0.1644606, 0.2553746, -0.6233391, 0, 0.6588235, 1, 1,
0.1651862, 0.01158075, 1.955245, 0, 0.6509804, 1, 1,
0.1655645, 0.340764, 0.4181044, 0, 0.6470588, 1, 1,
0.1692393, 0.03205327, 0.9638489, 0, 0.6392157, 1, 1,
0.1693442, 2.084007, 1.692707, 0, 0.6352941, 1, 1,
0.1705028, -0.6839275, 4.392139, 0, 0.627451, 1, 1,
0.1761197, 0.1342631, 1.19154, 0, 0.6235294, 1, 1,
0.1787125, -0.4786026, 2.219207, 0, 0.6156863, 1, 1,
0.1830393, -0.6177362, 2.617482, 0, 0.6117647, 1, 1,
0.1834856, -0.02925587, 1.962194, 0, 0.6039216, 1, 1,
0.184406, 1.808956, 0.3129838, 0, 0.5960785, 1, 1,
0.1847192, -1.760745, 3.294441, 0, 0.5921569, 1, 1,
0.1849583, 0.6416248, 0.01727532, 0, 0.5843138, 1, 1,
0.1862326, 0.5265605, -0.2556199, 0, 0.5803922, 1, 1,
0.1875049, -1.120108, 3.873082, 0, 0.572549, 1, 1,
0.1893244, -1.234393, 3.892985, 0, 0.5686275, 1, 1,
0.1894014, 0.7066417, 0.5534706, 0, 0.5607843, 1, 1,
0.1901659, 0.4166705, 0.08636386, 0, 0.5568628, 1, 1,
0.1904159, -0.8085237, 2.645671, 0, 0.5490196, 1, 1,
0.1940336, 0.065621, 1.623501, 0, 0.5450981, 1, 1,
0.1943199, -0.402254, 2.761664, 0, 0.5372549, 1, 1,
0.2021339, 2.267695, -0.4757098, 0, 0.5333334, 1, 1,
0.204774, -1.242484, 2.872604, 0, 0.5254902, 1, 1,
0.2063915, -1.416182, 0.2944806, 0, 0.5215687, 1, 1,
0.2119797, -0.0835639, 1.25465, 0, 0.5137255, 1, 1,
0.2130676, 1.509878, 0.2692451, 0, 0.509804, 1, 1,
0.2133638, 1.207972, 0.5959098, 0, 0.5019608, 1, 1,
0.2146166, 0.6503391, 0.7097019, 0, 0.4941176, 1, 1,
0.2169383, -0.06130622, 2.963206, 0, 0.4901961, 1, 1,
0.2180256, -1.396319, 4.812541, 0, 0.4823529, 1, 1,
0.2213029, -0.9794555, 4.855485, 0, 0.4784314, 1, 1,
0.2213514, -0.4917965, 2.842693, 0, 0.4705882, 1, 1,
0.2219944, -0.0170138, 1.956812, 0, 0.4666667, 1, 1,
0.2227229, -0.1050249, 0.6610797, 0, 0.4588235, 1, 1,
0.223488, 0.09553514, 2.676093, 0, 0.454902, 1, 1,
0.2242621, 1.875315, 0.224918, 0, 0.4470588, 1, 1,
0.2288896, 0.5127512, -1.06966, 0, 0.4431373, 1, 1,
0.2292635, 0.9287407, -0.07527431, 0, 0.4352941, 1, 1,
0.234443, 0.3689997, 0.5778747, 0, 0.4313726, 1, 1,
0.2404513, 0.7290981, 1.451253, 0, 0.4235294, 1, 1,
0.2438435, -1.200229, 4.231349, 0, 0.4196078, 1, 1,
0.244447, 1.517488, -0.2216565, 0, 0.4117647, 1, 1,
0.2447269, -1.031756, 3.180148, 0, 0.4078431, 1, 1,
0.2455508, -1.337115, 1.743528, 0, 0.4, 1, 1,
0.2459302, -0.9216168, 2.213504, 0, 0.3921569, 1, 1,
0.2478215, -0.1808986, 1.733786, 0, 0.3882353, 1, 1,
0.254322, 0.6947746, -0.7165996, 0, 0.3803922, 1, 1,
0.2677879, 1.781214, 0.6794867, 0, 0.3764706, 1, 1,
0.2739655, -0.7485647, 2.301386, 0, 0.3686275, 1, 1,
0.2753203, 0.5290334, 2.608762, 0, 0.3647059, 1, 1,
0.2759821, -0.6160911, 2.165243, 0, 0.3568628, 1, 1,
0.2768846, -0.2618168, 1.009016, 0, 0.3529412, 1, 1,
0.2781594, 0.02896298, 0.7639002, 0, 0.345098, 1, 1,
0.2785116, 0.4439999, 1.208075, 0, 0.3411765, 1, 1,
0.2807638, 0.2398803, 0.8886682, 0, 0.3333333, 1, 1,
0.2855463, -0.2666213, 2.429353, 0, 0.3294118, 1, 1,
0.288088, 0.3604403, 0.9433058, 0, 0.3215686, 1, 1,
0.2932476, 2.080794, -0.3424031, 0, 0.3176471, 1, 1,
0.2937418, -0.5608156, 2.237035, 0, 0.3098039, 1, 1,
0.2949302, -0.750447, 1.848845, 0, 0.3058824, 1, 1,
0.2954689, -0.4138251, 1.841863, 0, 0.2980392, 1, 1,
0.3020438, 0.5654728, 1.084533, 0, 0.2901961, 1, 1,
0.3036047, 0.6913465, 0.1657087, 0, 0.2862745, 1, 1,
0.305437, -0.3934653, 4.513992, 0, 0.2784314, 1, 1,
0.3119235, -0.5866423, 3.6728, 0, 0.2745098, 1, 1,
0.312415, 1.290117, -0.4742568, 0, 0.2666667, 1, 1,
0.3128011, -0.8440591, 2.846534, 0, 0.2627451, 1, 1,
0.312843, -0.04279494, 3.27204, 0, 0.254902, 1, 1,
0.3135382, 1.317303, 1.049999, 0, 0.2509804, 1, 1,
0.3143081, -0.06452182, 0.06182806, 0, 0.2431373, 1, 1,
0.3163899, -0.0006153015, 2.412371, 0, 0.2392157, 1, 1,
0.3193389, -1.317977, 3.566999, 0, 0.2313726, 1, 1,
0.3231846, -0.6252009, 2.884912, 0, 0.227451, 1, 1,
0.3264672, 0.2631484, 1.779726, 0, 0.2196078, 1, 1,
0.3305244, -2.468777, 3.347296, 0, 0.2156863, 1, 1,
0.3385038, -1.275833, 1.807383, 0, 0.2078431, 1, 1,
0.339694, 0.4942972, 0.785882, 0, 0.2039216, 1, 1,
0.340651, -0.653765, 3.54768, 0, 0.1960784, 1, 1,
0.3418351, 0.3582664, 0.3053769, 0, 0.1882353, 1, 1,
0.3457605, 0.6281543, -0.08451962, 0, 0.1843137, 1, 1,
0.3473802, -0.07817708, 0.3639174, 0, 0.1764706, 1, 1,
0.3493918, 0.8401378, 1.272455, 0, 0.172549, 1, 1,
0.3522198, 0.4322602, 0.6850946, 0, 0.1647059, 1, 1,
0.3545624, -0.8030174, 3.639844, 0, 0.1607843, 1, 1,
0.3552658, -0.6775934, 1.398835, 0, 0.1529412, 1, 1,
0.3566926, -0.5117828, 2.688407, 0, 0.1490196, 1, 1,
0.3716605, -1.02262, 2.644691, 0, 0.1411765, 1, 1,
0.3775651, -0.2768846, 3.000679, 0, 0.1372549, 1, 1,
0.3787545, -0.0472623, 1.784159, 0, 0.1294118, 1, 1,
0.3825824, 0.1612176, 1.427969, 0, 0.1254902, 1, 1,
0.3842619, 0.1819942, 0.5945846, 0, 0.1176471, 1, 1,
0.3884274, -0.4879964, 2.926494, 0, 0.1137255, 1, 1,
0.3924438, -0.6528637, 3.011063, 0, 0.1058824, 1, 1,
0.39299, -0.2126318, 3.186784, 0, 0.09803922, 1, 1,
0.4046829, 0.314596, 0.7525467, 0, 0.09411765, 1, 1,
0.4074162, -0.7738876, 3.335694, 0, 0.08627451, 1, 1,
0.4076501, 0.8321023, 0.09133586, 0, 0.08235294, 1, 1,
0.4090326, 0.4962513, 1.076602, 0, 0.07450981, 1, 1,
0.4093139, 0.1922699, 1.66351, 0, 0.07058824, 1, 1,
0.4127271, -0.5387428, 2.914808, 0, 0.0627451, 1, 1,
0.412792, 0.237435, 0.7326606, 0, 0.05882353, 1, 1,
0.4130718, 0.5559883, 1.002494, 0, 0.05098039, 1, 1,
0.4132635, 2.266578, 0.2400234, 0, 0.04705882, 1, 1,
0.4193696, 0.0673044, 2.45716, 0, 0.03921569, 1, 1,
0.4197315, 1.140402, -0.6607377, 0, 0.03529412, 1, 1,
0.4199783, 1.368734, -1.053714, 0, 0.02745098, 1, 1,
0.420309, 2.43024, 0.5842659, 0, 0.02352941, 1, 1,
0.4215256, 0.2700317, -0.4527815, 0, 0.01568628, 1, 1,
0.4227231, -1.227975, 1.915837, 0, 0.01176471, 1, 1,
0.4238143, 0.3825711, 0.1796432, 0, 0.003921569, 1, 1,
0.4262276, 0.1436807, -1.060235, 0.003921569, 0, 1, 1,
0.426927, -0.6539809, 3.370681, 0.007843138, 0, 1, 1,
0.4269902, 0.2645125, 1.345074, 0.01568628, 0, 1, 1,
0.4277562, -1.17786, 3.094814, 0.01960784, 0, 1, 1,
0.4277911, 0.1567661, 1.826105, 0.02745098, 0, 1, 1,
0.4299316, 0.1359453, 1.080142, 0.03137255, 0, 1, 1,
0.4413166, 1.569324, -1.568264, 0.03921569, 0, 1, 1,
0.4518009, -0.5826022, 0.4920546, 0.04313726, 0, 1, 1,
0.4532424, 0.4592269, 1.336301, 0.05098039, 0, 1, 1,
0.460798, 1.398229, 0.5989226, 0.05490196, 0, 1, 1,
0.4642997, -0.0943129, 0.02938782, 0.0627451, 0, 1, 1,
0.4645491, 0.07382383, 0.4354181, 0.06666667, 0, 1, 1,
0.4652187, 0.4753254, 1.342396, 0.07450981, 0, 1, 1,
0.4658339, -0.3774489, -0.7305384, 0.07843138, 0, 1, 1,
0.4671508, -1.147045, 2.12968, 0.08627451, 0, 1, 1,
0.4736153, 0.07404466, 2.473948, 0.09019608, 0, 1, 1,
0.4761306, -0.3939196, 2.220661, 0.09803922, 0, 1, 1,
0.477475, 0.3404811, -0.7862306, 0.1058824, 0, 1, 1,
0.4823187, 1.555245, -0.3455158, 0.1098039, 0, 1, 1,
0.4829319, 0.1973931, 1.33594, 0.1176471, 0, 1, 1,
0.4834334, 0.003314049, 2.461787, 0.1215686, 0, 1, 1,
0.4849546, 0.4332097, 0.7297117, 0.1294118, 0, 1, 1,
0.4865653, -0.4318775, 1.569541, 0.1333333, 0, 1, 1,
0.4890518, 0.7319569, 0.4173576, 0.1411765, 0, 1, 1,
0.490026, 1.446859, 0.737073, 0.145098, 0, 1, 1,
0.4920793, 2.01386, -1.748845, 0.1529412, 0, 1, 1,
0.4926379, 0.4679036, -0.03135294, 0.1568628, 0, 1, 1,
0.4945538, 0.4582161, 2.465555, 0.1647059, 0, 1, 1,
0.4975193, -0.3129438, 2.886968, 0.1686275, 0, 1, 1,
0.4985945, -1.15153, 4.464801, 0.1764706, 0, 1, 1,
0.500553, 0.4174018, 0.5997518, 0.1803922, 0, 1, 1,
0.5056571, 0.645759, 0.2959472, 0.1882353, 0, 1, 1,
0.5088039, 0.1762379, -0.1342096, 0.1921569, 0, 1, 1,
0.5129312, -0.5523754, 3.484407, 0.2, 0, 1, 1,
0.5139165, 0.04430481, -0.02603301, 0.2078431, 0, 1, 1,
0.5155007, -0.1062152, 0.6423211, 0.2117647, 0, 1, 1,
0.5174275, -1.55064, 3.832349, 0.2196078, 0, 1, 1,
0.5189062, 0.0311633, 1.649823, 0.2235294, 0, 1, 1,
0.5245399, 1.319941, -0.9692096, 0.2313726, 0, 1, 1,
0.5254214, -0.4601158, 2.20605, 0.2352941, 0, 1, 1,
0.5260214, -0.02485037, 2.568842, 0.2431373, 0, 1, 1,
0.5278839, 0.2022869, 2.516883, 0.2470588, 0, 1, 1,
0.5307876, -0.2122274, 1.103851, 0.254902, 0, 1, 1,
0.5343913, -1.371874, 2.499729, 0.2588235, 0, 1, 1,
0.5348092, -0.7414982, 3.132622, 0.2666667, 0, 1, 1,
0.5362345, 2.126978, -0.6828231, 0.2705882, 0, 1, 1,
0.537259, 0.1128167, 0.1129504, 0.2784314, 0, 1, 1,
0.5372972, 0.5576611, 0.2666669, 0.282353, 0, 1, 1,
0.5400663, 0.9299845, 0.2625232, 0.2901961, 0, 1, 1,
0.5419272, 0.4557673, 1.801676, 0.2941177, 0, 1, 1,
0.5442768, -1.255862, 2.562056, 0.3019608, 0, 1, 1,
0.5475503, -0.4884721, 0.5103553, 0.3098039, 0, 1, 1,
0.5500249, -0.2646497, 0.6406748, 0.3137255, 0, 1, 1,
0.554549, 0.5003125, 2.219224, 0.3215686, 0, 1, 1,
0.560636, -0.6852904, 0.09047171, 0.3254902, 0, 1, 1,
0.5647795, -0.6765788, 2.40426, 0.3333333, 0, 1, 1,
0.5658055, 0.7869979, 0.3592034, 0.3372549, 0, 1, 1,
0.5659341, 0.3035743, 1.996414, 0.345098, 0, 1, 1,
0.5661823, -0.3905588, 3.252039, 0.3490196, 0, 1, 1,
0.5690919, -0.3526986, 0.978699, 0.3568628, 0, 1, 1,
0.570585, -0.4846573, 1.584491, 0.3607843, 0, 1, 1,
0.5727216, 0.199885, 3.277872, 0.3686275, 0, 1, 1,
0.5732561, 0.04268197, 0.8694327, 0.372549, 0, 1, 1,
0.5873486, 2.301641, 0.08194487, 0.3803922, 0, 1, 1,
0.5879725, -0.7053129, 1.967862, 0.3843137, 0, 1, 1,
0.5913365, 0.5187652, 1.301921, 0.3921569, 0, 1, 1,
0.5968909, 0.1410535, -0.7631958, 0.3960784, 0, 1, 1,
0.6010451, -1.137425, 1.259513, 0.4039216, 0, 1, 1,
0.6026697, 0.8800791, 0.03333644, 0.4117647, 0, 1, 1,
0.6102481, -0.4647849, 0.4216541, 0.4156863, 0, 1, 1,
0.6113889, -0.1692138, 1.004525, 0.4235294, 0, 1, 1,
0.6227837, 0.2444623, 2.959376, 0.427451, 0, 1, 1,
0.624455, 0.06052187, 0.2915988, 0.4352941, 0, 1, 1,
0.6312988, 0.6704001, 0.7258856, 0.4392157, 0, 1, 1,
0.6402902, 0.3309114, 1.081074, 0.4470588, 0, 1, 1,
0.6403497, 1.197809, 0.09086975, 0.4509804, 0, 1, 1,
0.6424647, 1.584474, 2.270672, 0.4588235, 0, 1, 1,
0.6452287, -0.1507189, 1.924353, 0.4627451, 0, 1, 1,
0.645834, -0.03025094, 0.2096718, 0.4705882, 0, 1, 1,
0.6463258, 0.0857759, -0.5480472, 0.4745098, 0, 1, 1,
0.6477519, 1.114955, 1.494649, 0.4823529, 0, 1, 1,
0.6499822, -3.323339, 3.133553, 0.4862745, 0, 1, 1,
0.6509526, -0.09099266, 1.351985, 0.4941176, 0, 1, 1,
0.6539774, 0.03521691, 1.718316, 0.5019608, 0, 1, 1,
0.65948, 0.1896257, 1.207562, 0.5058824, 0, 1, 1,
0.6648615, 1.347565, 0.8999524, 0.5137255, 0, 1, 1,
0.6648872, 0.07113883, 1.8207, 0.5176471, 0, 1, 1,
0.665415, -0.976943, 0.6587093, 0.5254902, 0, 1, 1,
0.6660299, -0.8344262, 2.315539, 0.5294118, 0, 1, 1,
0.6677898, 1.198176, -1.319195, 0.5372549, 0, 1, 1,
0.6699086, 0.5748255, 1.036595, 0.5411765, 0, 1, 1,
0.6711504, -1.006401, 2.621175, 0.5490196, 0, 1, 1,
0.6713592, 0.8232207, 0.6143491, 0.5529412, 0, 1, 1,
0.6724012, -0.1635716, 3.827398, 0.5607843, 0, 1, 1,
0.6735244, 0.3976231, -0.1236788, 0.5647059, 0, 1, 1,
0.6744187, -1.039748, 3.811427, 0.572549, 0, 1, 1,
0.6813855, -0.9670188, 1.384443, 0.5764706, 0, 1, 1,
0.6862214, 1.088085, 0.9851715, 0.5843138, 0, 1, 1,
0.6874428, 0.9094123, 1.25961, 0.5882353, 0, 1, 1,
0.6881788, -0.8724462, -0.2459583, 0.5960785, 0, 1, 1,
0.6927738, -0.1282349, 1.956543, 0.6039216, 0, 1, 1,
0.6942697, -0.3374866, 3.628681, 0.6078432, 0, 1, 1,
0.6982628, -1.139388, 2.255321, 0.6156863, 0, 1, 1,
0.7043886, -1.056111, 2.600646, 0.6196079, 0, 1, 1,
0.7231659, 0.3301266, 0.06210539, 0.627451, 0, 1, 1,
0.7237298, -2.190266, 2.680295, 0.6313726, 0, 1, 1,
0.7270646, 0.2621697, 2.157621, 0.6392157, 0, 1, 1,
0.7282395, 1.387402, 0.9030487, 0.6431373, 0, 1, 1,
0.7343768, -0.9860989, 2.938321, 0.6509804, 0, 1, 1,
0.7346756, 0.9830165, 0.4458546, 0.654902, 0, 1, 1,
0.742493, 2.440946, -0.3305573, 0.6627451, 0, 1, 1,
0.7467778, 0.9814341, 0.2602129, 0.6666667, 0, 1, 1,
0.7499836, -0.5209853, 0.04465173, 0.6745098, 0, 1, 1,
0.7537788, -0.9685494, 1.330103, 0.6784314, 0, 1, 1,
0.7575665, 1.009714, 0.7104902, 0.6862745, 0, 1, 1,
0.7711321, -0.2522491, 0.7613071, 0.6901961, 0, 1, 1,
0.7741933, 0.1328386, 1.812137, 0.6980392, 0, 1, 1,
0.7848963, 0.200581, 1.899765, 0.7058824, 0, 1, 1,
0.7852294, 0.990014, 1.573926, 0.7098039, 0, 1, 1,
0.7867401, 0.2691107, 0.6950075, 0.7176471, 0, 1, 1,
0.7944998, 0.782644, 1.982155, 0.7215686, 0, 1, 1,
0.7985957, -0.3993489, 1.456352, 0.7294118, 0, 1, 1,
0.8006301, 0.4701911, 1.529107, 0.7333333, 0, 1, 1,
0.8046064, 0.4059673, 1.825686, 0.7411765, 0, 1, 1,
0.8050594, -0.06108575, 0.6108417, 0.7450981, 0, 1, 1,
0.8081964, -0.9620255, 3.060722, 0.7529412, 0, 1, 1,
0.8109761, -0.669834, 2.876097, 0.7568628, 0, 1, 1,
0.8151874, 0.543252, 2.606707, 0.7647059, 0, 1, 1,
0.8166119, 0.9975629, 1.864218, 0.7686275, 0, 1, 1,
0.8170018, 0.6322819, 0.6315421, 0.7764706, 0, 1, 1,
0.8187503, 1.299608, -0.1607813, 0.7803922, 0, 1, 1,
0.8212771, -0.7089099, 1.976938, 0.7882353, 0, 1, 1,
0.8225788, -2.0424, 3.662997, 0.7921569, 0, 1, 1,
0.8246844, 0.2941636, 2.322011, 0.8, 0, 1, 1,
0.8250456, 0.9682795, 0.8927505, 0.8078431, 0, 1, 1,
0.8261181, 0.6408596, 1.497473, 0.8117647, 0, 1, 1,
0.8267882, 0.4948836, 1.224843, 0.8196079, 0, 1, 1,
0.8285469, -0.4051763, 0.7811652, 0.8235294, 0, 1, 1,
0.8443425, -1.595875, 1.801582, 0.8313726, 0, 1, 1,
0.8464915, -1.56001, 2.836266, 0.8352941, 0, 1, 1,
0.8510894, -0.270662, 1.840366, 0.8431373, 0, 1, 1,
0.8550568, 0.8659496, 1.264089, 0.8470588, 0, 1, 1,
0.8591191, -1.207796, 0.2972025, 0.854902, 0, 1, 1,
0.8596235, 1.021811, 0.9060827, 0.8588235, 0, 1, 1,
0.8649017, -0.2198874, 1.821364, 0.8666667, 0, 1, 1,
0.8815482, -0.7085119, 1.978384, 0.8705882, 0, 1, 1,
0.8834862, 0.2741314, 2.082615, 0.8784314, 0, 1, 1,
0.8851876, -1.088136, 3.69687, 0.8823529, 0, 1, 1,
0.8870082, -1.518945, 3.212296, 0.8901961, 0, 1, 1,
0.891143, 0.1905777, 2.455559, 0.8941177, 0, 1, 1,
0.8936832, -0.4967319, 3.148149, 0.9019608, 0, 1, 1,
0.8952116, 0.5804573, 1.356718, 0.9098039, 0, 1, 1,
0.8959355, 0.007685632, 3.426805, 0.9137255, 0, 1, 1,
0.8981354, -1.339001, 2.81757, 0.9215686, 0, 1, 1,
0.9041154, 0.4033271, 1.083159, 0.9254902, 0, 1, 1,
0.9060823, 1.288075, 0.660549, 0.9333333, 0, 1, 1,
0.9102861, 0.433804, -0.4496316, 0.9372549, 0, 1, 1,
0.9112925, 1.637483, 1.4275, 0.945098, 0, 1, 1,
0.9233591, -0.2351801, 2.714264, 0.9490196, 0, 1, 1,
0.9245015, 0.6116478, 2.885218, 0.9568627, 0, 1, 1,
0.9288964, -0.2812551, 2.948664, 0.9607843, 0, 1, 1,
0.9303929, 0.8349921, -0.3984203, 0.9686275, 0, 1, 1,
0.9371951, -0.2723328, 0.326316, 0.972549, 0, 1, 1,
0.9389004, 1.248719, 0.2040751, 0.9803922, 0, 1, 1,
0.940708, -0.2456388, 2.401016, 0.9843137, 0, 1, 1,
0.9429696, 0.9291151, 0.8618401, 0.9921569, 0, 1, 1,
0.9443117, -0.7045387, 1.540638, 0.9960784, 0, 1, 1,
0.9468545, 0.8018964, 1.930364, 1, 0, 0.9960784, 1,
0.95584, 0.3501204, 1.461949, 1, 0, 0.9882353, 1,
0.9608039, -0.7704153, 2.375637, 1, 0, 0.9843137, 1,
0.9609268, -0.1908381, 0.0004555447, 1, 0, 0.9764706, 1,
0.9668391, -0.298821, 3.272262, 1, 0, 0.972549, 1,
0.9730731, -1.108587, 2.903502, 1, 0, 0.9647059, 1,
0.9773183, -0.04054402, 2.092188, 1, 0, 0.9607843, 1,
0.982879, -3.090338, 3.885486, 1, 0, 0.9529412, 1,
0.98429, -0.2724527, 2.640212, 1, 0, 0.9490196, 1,
0.9860638, 0.2123685, 1.388363, 1, 0, 0.9411765, 1,
0.9896519, 0.3645808, 1.004089, 1, 0, 0.9372549, 1,
0.9934223, -0.2951493, 1.938748, 1, 0, 0.9294118, 1,
0.9976779, 0.7636493, 1.030772, 1, 0, 0.9254902, 1,
1.001423, -0.707453, 1.860459, 1, 0, 0.9176471, 1,
1.010909, 0.7205364, 1.89022, 1, 0, 0.9137255, 1,
1.016619, 2.367123, -1.460733, 1, 0, 0.9058824, 1,
1.016973, -0.9502807, 1.119864, 1, 0, 0.9019608, 1,
1.026739, 1.429414, 2.922438, 1, 0, 0.8941177, 1,
1.028808, -1.063512, 1.755933, 1, 0, 0.8862745, 1,
1.035351, -0.48267, 2.021553, 1, 0, 0.8823529, 1,
1.043666, -0.3938875, 1.04222, 1, 0, 0.8745098, 1,
1.047548, 0.4667917, 0.1560546, 1, 0, 0.8705882, 1,
1.04839, 0.1364996, 1.75293, 1, 0, 0.8627451, 1,
1.049876, -0.5207286, 2.587419, 1, 0, 0.8588235, 1,
1.062431, 0.1756319, 0.7034998, 1, 0, 0.8509804, 1,
1.062547, 0.1534176, 1.556755, 1, 0, 0.8470588, 1,
1.06694, -1.10948, 1.156237, 1, 0, 0.8392157, 1,
1.080159, -0.5916871, -0.1351431, 1, 0, 0.8352941, 1,
1.085911, -1.572003, 1.910109, 1, 0, 0.827451, 1,
1.089613, -0.8881557, 2.427342, 1, 0, 0.8235294, 1,
1.093131, 0.3273209, 1.928988, 1, 0, 0.8156863, 1,
1.093345, -0.9293447, 2.014126, 1, 0, 0.8117647, 1,
1.101232, -1.355068, 2.641487, 1, 0, 0.8039216, 1,
1.108521, -1.240055, 2.761231, 1, 0, 0.7960784, 1,
1.115227, 0.2448724, 1.214159, 1, 0, 0.7921569, 1,
1.116531, -0.9829025, 2.83917, 1, 0, 0.7843137, 1,
1.123008, 1.308921, 0.5625168, 1, 0, 0.7803922, 1,
1.126683, -0.4342992, 2.907609, 1, 0, 0.772549, 1,
1.12856, 0.2355376, 3.563518, 1, 0, 0.7686275, 1,
1.129566, 0.483489, 3.225558, 1, 0, 0.7607843, 1,
1.132032, -0.3289368, 1.280113, 1, 0, 0.7568628, 1,
1.136827, 0.871006, 0.6452091, 1, 0, 0.7490196, 1,
1.140216, 1.535845, 2.277669, 1, 0, 0.7450981, 1,
1.140699, 1.559263, 0.12553, 1, 0, 0.7372549, 1,
1.148962, -0.519648, 1.393645, 1, 0, 0.7333333, 1,
1.152161, 0.7431118, -0.04343391, 1, 0, 0.7254902, 1,
1.153267, -0.5381393, 2.395022, 1, 0, 0.7215686, 1,
1.176356, -0.7863528, 1.184445, 1, 0, 0.7137255, 1,
1.180076, 0.1140901, 1.776335, 1, 0, 0.7098039, 1,
1.180289, -0.4274421, 2.14933, 1, 0, 0.7019608, 1,
1.193403, 1.64095, -0.4369306, 1, 0, 0.6941177, 1,
1.194743, -0.308818, -0.1653418, 1, 0, 0.6901961, 1,
1.202647, -0.416074, 2.645793, 1, 0, 0.682353, 1,
1.204691, 2.010685, -0.1353772, 1, 0, 0.6784314, 1,
1.205443, -0.295985, 2.631713, 1, 0, 0.6705883, 1,
1.207563, 1.221094, 0.03092264, 1, 0, 0.6666667, 1,
1.219818, -0.6159835, 2.412202, 1, 0, 0.6588235, 1,
1.2255, -0.493398, 2.558873, 1, 0, 0.654902, 1,
1.225905, 0.1334076, 0.1220492, 1, 0, 0.6470588, 1,
1.228819, -0.2755983, 2.261093, 1, 0, 0.6431373, 1,
1.232273, -0.3467214, 1.989453, 1, 0, 0.6352941, 1,
1.23874, -0.5073875, 3.382015, 1, 0, 0.6313726, 1,
1.24362, -0.002698679, 0.5242037, 1, 0, 0.6235294, 1,
1.244321, 0.0234935, 1.15913, 1, 0, 0.6196079, 1,
1.24762, -1.691356, 2.903513, 1, 0, 0.6117647, 1,
1.251716, -1.268169, 3.158105, 1, 0, 0.6078432, 1,
1.253473, -0.1450904, 1.106333, 1, 0, 0.6, 1,
1.253615, -0.1556552, 1.057497, 1, 0, 0.5921569, 1,
1.268855, 0.08621792, 1.633515, 1, 0, 0.5882353, 1,
1.272066, -0.8701114, 3.738218, 1, 0, 0.5803922, 1,
1.282697, 0.501112, 2.376216, 1, 0, 0.5764706, 1,
1.289099, 1.590787, -0.8752585, 1, 0, 0.5686275, 1,
1.300274, -0.5310152, 1.519667, 1, 0, 0.5647059, 1,
1.306499, 1.417198, 0.414417, 1, 0, 0.5568628, 1,
1.30843, 1.438927, 0.8637599, 1, 0, 0.5529412, 1,
1.308967, 0.05123506, 1.356418, 1, 0, 0.5450981, 1,
1.310099, 0.63618, 1.046103, 1, 0, 0.5411765, 1,
1.318826, 0.479358, 3.314516, 1, 0, 0.5333334, 1,
1.327124, -0.3847404, 0.2205173, 1, 0, 0.5294118, 1,
1.335146, -1.005379, 3.136165, 1, 0, 0.5215687, 1,
1.350711, -0.6018988, 1.937876, 1, 0, 0.5176471, 1,
1.354288, -1.051306, 2.804797, 1, 0, 0.509804, 1,
1.356259, -0.1454124, 1.509589, 1, 0, 0.5058824, 1,
1.363664, -1.439971, 2.414951, 1, 0, 0.4980392, 1,
1.369967, -1.175452, 2.469861, 1, 0, 0.4901961, 1,
1.385489, -1.265497, 3.228482, 1, 0, 0.4862745, 1,
1.392168, -0.9593244, 3.217303, 1, 0, 0.4784314, 1,
1.393315, -0.3564893, 1.450979, 1, 0, 0.4745098, 1,
1.396417, -0.8440115, 0.355662, 1, 0, 0.4666667, 1,
1.402773, -0.0757827, -1.4656, 1, 0, 0.4627451, 1,
1.407687, -0.15079, 3.648337, 1, 0, 0.454902, 1,
1.412695, -0.7343734, 2.585622, 1, 0, 0.4509804, 1,
1.423402, 0.5819716, 0.422769, 1, 0, 0.4431373, 1,
1.430528, 0.3008235, 1.203302, 1, 0, 0.4392157, 1,
1.438684, -1.538729, 2.318659, 1, 0, 0.4313726, 1,
1.446621, 0.8469992, 0.5988534, 1, 0, 0.427451, 1,
1.446946, -0.1130006, 2.203096, 1, 0, 0.4196078, 1,
1.449448, -0.1166193, 0.7750259, 1, 0, 0.4156863, 1,
1.455474, 0.5986161, 2.358317, 1, 0, 0.4078431, 1,
1.462266, 1.351706, 0.3529385, 1, 0, 0.4039216, 1,
1.471764, 1.140873, 1.541003, 1, 0, 0.3960784, 1,
1.478568, 0.9186085, 2.399081, 1, 0, 0.3882353, 1,
1.495029, -1.467608, 2.453606, 1, 0, 0.3843137, 1,
1.499679, 1.131145, 0.2004719, 1, 0, 0.3764706, 1,
1.503739, -1.367432, -0.2915897, 1, 0, 0.372549, 1,
1.520443, 1.032812, -0.1144175, 1, 0, 0.3647059, 1,
1.522891, 0.26834, 1.249258, 1, 0, 0.3607843, 1,
1.52824, 0.6246471, 2.589421, 1, 0, 0.3529412, 1,
1.530122, -1.283968, 2.398466, 1, 0, 0.3490196, 1,
1.531622, -0.575815, 0.8018345, 1, 0, 0.3411765, 1,
1.538589, 0.4603868, 0.4245782, 1, 0, 0.3372549, 1,
1.54222, -0.6314539, -0.1995539, 1, 0, 0.3294118, 1,
1.58251, -1.490684, 1.643257, 1, 0, 0.3254902, 1,
1.588213, 1.082765, -0.2372649, 1, 0, 0.3176471, 1,
1.589876, 0.7203308, 1.669228, 1, 0, 0.3137255, 1,
1.594374, 0.6732805, 1.591224, 1, 0, 0.3058824, 1,
1.6023, 0.1477135, -1.016065, 1, 0, 0.2980392, 1,
1.610718, 0.2030464, -0.03939658, 1, 0, 0.2941177, 1,
1.615363, 0.2092972, 0.8159814, 1, 0, 0.2862745, 1,
1.630722, -0.8310788, 1.518407, 1, 0, 0.282353, 1,
1.67065, 1.223757, 2.857801, 1, 0, 0.2745098, 1,
1.677938, 0.4216068, -0.7069961, 1, 0, 0.2705882, 1,
1.689625, 0.07679743, 2.827647, 1, 0, 0.2627451, 1,
1.691495, 1.589627, 0.3401466, 1, 0, 0.2588235, 1,
1.695529, -0.4387029, 0.7026139, 1, 0, 0.2509804, 1,
1.700328, -0.7488112, 2.694931, 1, 0, 0.2470588, 1,
1.725964, -0.4465474, 2.078339, 1, 0, 0.2392157, 1,
1.726893, 0.8995666, 2.177951, 1, 0, 0.2352941, 1,
1.730015, 0.2662227, 1.502108, 1, 0, 0.227451, 1,
1.738904, -1.094484, 4.129792, 1, 0, 0.2235294, 1,
1.769598, 0.2572526, 1.724829, 1, 0, 0.2156863, 1,
1.770569, -0.2813234, 2.91514, 1, 0, 0.2117647, 1,
1.773267, -0.192849, 1.821322, 1, 0, 0.2039216, 1,
1.800381, -0.4573043, 2.059303, 1, 0, 0.1960784, 1,
1.807033, 1.655484, -0.09274129, 1, 0, 0.1921569, 1,
1.823137, 1.008354, 1.408538, 1, 0, 0.1843137, 1,
1.839141, 0.6103836, 0.8079753, 1, 0, 0.1803922, 1,
1.842275, 0.8443184, 1.323914, 1, 0, 0.172549, 1,
1.853894, -1.316812, 1.47103, 1, 0, 0.1686275, 1,
1.88457, 0.5282044, 2.134882, 1, 0, 0.1607843, 1,
1.8925, -0.3078506, 3.488005, 1, 0, 0.1568628, 1,
1.895082, 0.3452125, 0.2604082, 1, 0, 0.1490196, 1,
1.899415, -0.3411396, 1.208628, 1, 0, 0.145098, 1,
1.920718, 0.1879405, 1.968041, 1, 0, 0.1372549, 1,
1.961323, -1.951182, 1.175383, 1, 0, 0.1333333, 1,
1.961436, 0.0916184, 1.473742, 1, 0, 0.1254902, 1,
1.969232, 0.2040522, 0.396086, 1, 0, 0.1215686, 1,
2.012889, -1.211932, 1.095281, 1, 0, 0.1137255, 1,
2.016655, 0.08453312, 2.42474, 1, 0, 0.1098039, 1,
2.023995, -0.01631562, 1.703763, 1, 0, 0.1019608, 1,
2.026068, 0.7195818, 1.078813, 1, 0, 0.09411765, 1,
2.058478, 1.110066, 2.187497, 1, 0, 0.09019608, 1,
2.087523, 0.2315019, 1.769727, 1, 0, 0.08235294, 1,
2.126888, -2.012717, 3.812538, 1, 0, 0.07843138, 1,
2.216665, -1.454832, 0.8479323, 1, 0, 0.07058824, 1,
2.228485, 0.9229051, 2.54073, 1, 0, 0.06666667, 1,
2.280736, -0.7321874, 1.359547, 1, 0, 0.05882353, 1,
2.299185, -0.5281446, 1.406358, 1, 0, 0.05490196, 1,
2.431535, 0.6710892, 0.5419215, 1, 0, 0.04705882, 1,
2.543267, -1.612029, 0.2083749, 1, 0, 0.04313726, 1,
2.543571, -0.5243389, 1.04476, 1, 0, 0.03529412, 1,
2.546211, 1.005309, 0.7562014, 1, 0, 0.03137255, 1,
2.558954, -0.8678809, 1.358523, 1, 0, 0.02352941, 1,
2.650932, 0.6371853, -0.5234147, 1, 0, 0.01960784, 1,
2.667731, -0.7207453, 2.707128, 1, 0, 0.01176471, 1,
2.91146, -1.25854, 1.68605, 1, 0, 0.007843138, 1
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
-0.1412635, -4.42662, -7.290668, 0, -0.5, 0.5, 0.5,
-0.1412635, -4.42662, -7.290668, 1, -0.5, 0.5, 0.5,
-0.1412635, -4.42662, -7.290668, 1, 1.5, 0.5, 0.5,
-0.1412635, -4.42662, -7.290668, 0, 1.5, 0.5, 0.5
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
-4.22886, -0.06882262, -7.290668, 0, -0.5, 0.5, 0.5,
-4.22886, -0.06882262, -7.290668, 1, -0.5, 0.5, 0.5,
-4.22886, -0.06882262, -7.290668, 1, 1.5, 0.5, 0.5,
-4.22886, -0.06882262, -7.290668, 0, 1.5, 0.5, 0.5
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
-4.22886, -4.42662, 0.2884302, 0, -0.5, 0.5, 0.5,
-4.22886, -4.42662, 0.2884302, 1, -0.5, 0.5, 0.5,
-4.22886, -4.42662, 0.2884302, 1, 1.5, 0.5, 0.5,
-4.22886, -4.42662, 0.2884302, 0, 1.5, 0.5, 0.5
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
-3, -3.420975, -5.541645,
2, -3.420975, -5.541645,
-3, -3.420975, -5.541645,
-3, -3.588583, -5.833149,
-2, -3.420975, -5.541645,
-2, -3.588583, -5.833149,
-1, -3.420975, -5.541645,
-1, -3.588583, -5.833149,
0, -3.420975, -5.541645,
0, -3.588583, -5.833149,
1, -3.420975, -5.541645,
1, -3.588583, -5.833149,
2, -3.420975, -5.541645,
2, -3.588583, -5.833149
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
-3, -3.923798, -6.416156, 0, -0.5, 0.5, 0.5,
-3, -3.923798, -6.416156, 1, -0.5, 0.5, 0.5,
-3, -3.923798, -6.416156, 1, 1.5, 0.5, 0.5,
-3, -3.923798, -6.416156, 0, 1.5, 0.5, 0.5,
-2, -3.923798, -6.416156, 0, -0.5, 0.5, 0.5,
-2, -3.923798, -6.416156, 1, -0.5, 0.5, 0.5,
-2, -3.923798, -6.416156, 1, 1.5, 0.5, 0.5,
-2, -3.923798, -6.416156, 0, 1.5, 0.5, 0.5,
-1, -3.923798, -6.416156, 0, -0.5, 0.5, 0.5,
-1, -3.923798, -6.416156, 1, -0.5, 0.5, 0.5,
-1, -3.923798, -6.416156, 1, 1.5, 0.5, 0.5,
-1, -3.923798, -6.416156, 0, 1.5, 0.5, 0.5,
0, -3.923798, -6.416156, 0, -0.5, 0.5, 0.5,
0, -3.923798, -6.416156, 1, -0.5, 0.5, 0.5,
0, -3.923798, -6.416156, 1, 1.5, 0.5, 0.5,
0, -3.923798, -6.416156, 0, 1.5, 0.5, 0.5,
1, -3.923798, -6.416156, 0, -0.5, 0.5, 0.5,
1, -3.923798, -6.416156, 1, -0.5, 0.5, 0.5,
1, -3.923798, -6.416156, 1, 1.5, 0.5, 0.5,
1, -3.923798, -6.416156, 0, 1.5, 0.5, 0.5,
2, -3.923798, -6.416156, 0, -0.5, 0.5, 0.5,
2, -3.923798, -6.416156, 1, -0.5, 0.5, 0.5,
2, -3.923798, -6.416156, 1, 1.5, 0.5, 0.5,
2, -3.923798, -6.416156, 0, 1.5, 0.5, 0.5
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
-3.285569, -3, -5.541645,
-3.285569, 3, -5.541645,
-3.285569, -3, -5.541645,
-3.442784, -3, -5.833149,
-3.285569, -2, -5.541645,
-3.442784, -2, -5.833149,
-3.285569, -1, -5.541645,
-3.442784, -1, -5.833149,
-3.285569, 0, -5.541645,
-3.442784, 0, -5.833149,
-3.285569, 1, -5.541645,
-3.442784, 1, -5.833149,
-3.285569, 2, -5.541645,
-3.442784, 2, -5.833149,
-3.285569, 3, -5.541645,
-3.442784, 3, -5.833149
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
-3.757215, -3, -6.416156, 0, -0.5, 0.5, 0.5,
-3.757215, -3, -6.416156, 1, -0.5, 0.5, 0.5,
-3.757215, -3, -6.416156, 1, 1.5, 0.5, 0.5,
-3.757215, -3, -6.416156, 0, 1.5, 0.5, 0.5,
-3.757215, -2, -6.416156, 0, -0.5, 0.5, 0.5,
-3.757215, -2, -6.416156, 1, -0.5, 0.5, 0.5,
-3.757215, -2, -6.416156, 1, 1.5, 0.5, 0.5,
-3.757215, -2, -6.416156, 0, 1.5, 0.5, 0.5,
-3.757215, -1, -6.416156, 0, -0.5, 0.5, 0.5,
-3.757215, -1, -6.416156, 1, -0.5, 0.5, 0.5,
-3.757215, -1, -6.416156, 1, 1.5, 0.5, 0.5,
-3.757215, -1, -6.416156, 0, 1.5, 0.5, 0.5,
-3.757215, 0, -6.416156, 0, -0.5, 0.5, 0.5,
-3.757215, 0, -6.416156, 1, -0.5, 0.5, 0.5,
-3.757215, 0, -6.416156, 1, 1.5, 0.5, 0.5,
-3.757215, 0, -6.416156, 0, 1.5, 0.5, 0.5,
-3.757215, 1, -6.416156, 0, -0.5, 0.5, 0.5,
-3.757215, 1, -6.416156, 1, -0.5, 0.5, 0.5,
-3.757215, 1, -6.416156, 1, 1.5, 0.5, 0.5,
-3.757215, 1, -6.416156, 0, 1.5, 0.5, 0.5,
-3.757215, 2, -6.416156, 0, -0.5, 0.5, 0.5,
-3.757215, 2, -6.416156, 1, -0.5, 0.5, 0.5,
-3.757215, 2, -6.416156, 1, 1.5, 0.5, 0.5,
-3.757215, 2, -6.416156, 0, 1.5, 0.5, 0.5,
-3.757215, 3, -6.416156, 0, -0.5, 0.5, 0.5,
-3.757215, 3, -6.416156, 1, -0.5, 0.5, 0.5,
-3.757215, 3, -6.416156, 1, 1.5, 0.5, 0.5,
-3.757215, 3, -6.416156, 0, 1.5, 0.5, 0.5
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
-3.285569, -3.420975, -4,
-3.285569, -3.420975, 4,
-3.285569, -3.420975, -4,
-3.442784, -3.588583, -4,
-3.285569, -3.420975, -2,
-3.442784, -3.588583, -2,
-3.285569, -3.420975, 0,
-3.442784, -3.588583, 0,
-3.285569, -3.420975, 2,
-3.442784, -3.588583, 2,
-3.285569, -3.420975, 4,
-3.442784, -3.588583, 4
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
-3.757215, -3.923798, -4, 0, -0.5, 0.5, 0.5,
-3.757215, -3.923798, -4, 1, -0.5, 0.5, 0.5,
-3.757215, -3.923798, -4, 1, 1.5, 0.5, 0.5,
-3.757215, -3.923798, -4, 0, 1.5, 0.5, 0.5,
-3.757215, -3.923798, -2, 0, -0.5, 0.5, 0.5,
-3.757215, -3.923798, -2, 1, -0.5, 0.5, 0.5,
-3.757215, -3.923798, -2, 1, 1.5, 0.5, 0.5,
-3.757215, -3.923798, -2, 0, 1.5, 0.5, 0.5,
-3.757215, -3.923798, 0, 0, -0.5, 0.5, 0.5,
-3.757215, -3.923798, 0, 1, -0.5, 0.5, 0.5,
-3.757215, -3.923798, 0, 1, 1.5, 0.5, 0.5,
-3.757215, -3.923798, 0, 0, 1.5, 0.5, 0.5,
-3.757215, -3.923798, 2, 0, -0.5, 0.5, 0.5,
-3.757215, -3.923798, 2, 1, -0.5, 0.5, 0.5,
-3.757215, -3.923798, 2, 1, 1.5, 0.5, 0.5,
-3.757215, -3.923798, 2, 0, 1.5, 0.5, 0.5,
-3.757215, -3.923798, 4, 0, -0.5, 0.5, 0.5,
-3.757215, -3.923798, 4, 1, -0.5, 0.5, 0.5,
-3.757215, -3.923798, 4, 1, 1.5, 0.5, 0.5,
-3.757215, -3.923798, 4, 0, 1.5, 0.5, 0.5
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
-3.285569, -3.420975, -5.541645,
-3.285569, 3.28333, -5.541645,
-3.285569, -3.420975, 6.118505,
-3.285569, 3.28333, 6.118505,
-3.285569, -3.420975, -5.541645,
-3.285569, -3.420975, 6.118505,
-3.285569, 3.28333, -5.541645,
-3.285569, 3.28333, 6.118505,
-3.285569, -3.420975, -5.541645,
3.003042, -3.420975, -5.541645,
-3.285569, -3.420975, 6.118505,
3.003042, -3.420975, 6.118505,
-3.285569, 3.28333, -5.541645,
3.003042, 3.28333, -5.541645,
-3.285569, 3.28333, 6.118505,
3.003042, 3.28333, 6.118505,
3.003042, -3.420975, -5.541645,
3.003042, 3.28333, -5.541645,
3.003042, -3.420975, 6.118505,
3.003042, 3.28333, 6.118505,
3.003042, -3.420975, -5.541645,
3.003042, -3.420975, 6.118505,
3.003042, 3.28333, -5.541645,
3.003042, 3.28333, 6.118505
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
var radius = 7.92837;
var distance = 35.27421;
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
mvMatrix.translate( 0.1412635, 0.06882262, -0.2884302 );
mvMatrix.scale( 1.363148, 1.278628, 0.73518 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.27421);
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
InChI_1S_C13H8Cl2N2O<-read.table("InChI_1S_C13H8Cl2N2O.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C13H8Cl2N2O$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C13H8Cl2N2O' not found
```

```r
y<-InChI_1S_C13H8Cl2N2O$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C13H8Cl2N2O' not found
```

```r
z<-InChI_1S_C13H8Cl2N2O$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C13H8Cl2N2O' not found
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
-3.193987, 0.423476, -1.538706, 0, 0, 1, 1, 1,
-2.965141, -1.113931, -3.244542, 1, 0, 0, 1, 1,
-2.944691, -0.2601183, -2.115161, 1, 0, 0, 1, 1,
-2.829452, -0.2624231, -1.078783, 1, 0, 0, 1, 1,
-2.688575, 0.07532092, -1.523784, 1, 0, 0, 1, 1,
-2.673033, 0.2700242, -1.349363, 1, 0, 0, 1, 1,
-2.604723, 1.028818, -0.5364874, 0, 0, 0, 1, 1,
-2.597623, -1.123518, -1.393009, 0, 0, 0, 1, 1,
-2.570565, 0.6198238, -1.573632, 0, 0, 0, 1, 1,
-2.518914, -0.05920343, -1.87068, 0, 0, 0, 1, 1,
-2.456172, -1.020107, -3.489534, 0, 0, 0, 1, 1,
-2.451237, 0.007407652, -0.1808914, 0, 0, 0, 1, 1,
-2.418586, 1.078491, -1.141232, 0, 0, 0, 1, 1,
-2.376129, 1.511046, 0.7597281, 1, 1, 1, 1, 1,
-2.340275, -1.175466, -0.9573438, 1, 1, 1, 1, 1,
-2.335793, -0.8298864, -2.577565, 1, 1, 1, 1, 1,
-2.32902, 1.323577, -1.773922, 1, 1, 1, 1, 1,
-2.232336, 0.4661028, -0.6634588, 1, 1, 1, 1, 1,
-2.184242, 0.365625, -2.803817, 1, 1, 1, 1, 1,
-2.167765, 1.762645, -0.7179869, 1, 1, 1, 1, 1,
-2.160328, 0.4478078, -1.411577, 1, 1, 1, 1, 1,
-2.160057, 0.8811617, 0.3384056, 1, 1, 1, 1, 1,
-2.103608, 0.9406426, -2.379153, 1, 1, 1, 1, 1,
-2.093744, 0.6113933, -0.5659962, 1, 1, 1, 1, 1,
-2.069786, -0.9550987, -1.432755, 1, 1, 1, 1, 1,
-2.056284, 0.4196261, 0.1392935, 1, 1, 1, 1, 1,
-2.047183, 1.109997, -1.542981, 1, 1, 1, 1, 1,
-2.019619, -0.02748293, -1.439111, 1, 1, 1, 1, 1,
-1.945507, 0.6968601, -2.641236, 0, 0, 1, 1, 1,
-1.926115, 0.3371214, -0.9658778, 1, 0, 0, 1, 1,
-1.923981, -0.2372396, -2.902149, 1, 0, 0, 1, 1,
-1.897776, 0.2123876, -0.00530782, 1, 0, 0, 1, 1,
-1.89752, -0.8072979, -1.735403, 1, 0, 0, 1, 1,
-1.896132, -1.539252, -0.5053967, 1, 0, 0, 1, 1,
-1.887492, 0.7451434, -0.2163616, 0, 0, 0, 1, 1,
-1.834241, 0.5680562, 0.8367426, 0, 0, 0, 1, 1,
-1.813929, 1.234393, -1.528447, 0, 0, 0, 1, 1,
-1.803945, 2.154291, 0.008536754, 0, 0, 0, 1, 1,
-1.801748, -1.674227, -1.932561, 0, 0, 0, 1, 1,
-1.78998, 1.028123, 0.8661188, 0, 0, 0, 1, 1,
-1.775544, 1.102816, -0.530188, 0, 0, 0, 1, 1,
-1.77372, 0.1852849, -3.735453, 1, 1, 1, 1, 1,
-1.753923, 0.447671, -1.727644, 1, 1, 1, 1, 1,
-1.741449, -0.9324856, -1.197644, 1, 1, 1, 1, 1,
-1.736109, 0.9402629, -1.529745, 1, 1, 1, 1, 1,
-1.697438, 1.133654, 0.3687921, 1, 1, 1, 1, 1,
-1.690293, -1.255334, -1.374248, 1, 1, 1, 1, 1,
-1.664331, 0.1922751, -0.8683129, 1, 1, 1, 1, 1,
-1.657937, -0.2395903, -0.8109871, 1, 1, 1, 1, 1,
-1.653446, 0.5275857, -2.20395, 1, 1, 1, 1, 1,
-1.634665, 1.562746, 1.132489, 1, 1, 1, 1, 1,
-1.609073, 0.3978242, -2.55841, 1, 1, 1, 1, 1,
-1.608101, -0.8593031, -1.930991, 1, 1, 1, 1, 1,
-1.600968, 0.475601, -0.3176213, 1, 1, 1, 1, 1,
-1.600555, -0.585044, -2.106645, 1, 1, 1, 1, 1,
-1.586933, -0.9212446, -0.8935732, 1, 1, 1, 1, 1,
-1.575999, -0.3887147, -1.842823, 0, 0, 1, 1, 1,
-1.566338, 0.08204985, -2.264266, 1, 0, 0, 1, 1,
-1.560815, -0.5674514, -2.259394, 1, 0, 0, 1, 1,
-1.542541, -0.06907281, -1.885479, 1, 0, 0, 1, 1,
-1.53124, 0.01194919, -3.24852, 1, 0, 0, 1, 1,
-1.521078, -1.364875, -3.114989, 1, 0, 0, 1, 1,
-1.515812, -0.7580532, -3.794755, 0, 0, 0, 1, 1,
-1.508367, -0.791706, -0.9508262, 0, 0, 0, 1, 1,
-1.504216, 0.03976363, -3.781825, 0, 0, 0, 1, 1,
-1.493642, -0.3475284, -2.250947, 0, 0, 0, 1, 1,
-1.484859, -0.7877494, -0.8977143, 0, 0, 0, 1, 1,
-1.469326, 0.3094057, -2.255491, 0, 0, 0, 1, 1,
-1.457466, -0.3944327, -1.092043, 0, 0, 0, 1, 1,
-1.455449, -2.37097, -2.54214, 1, 1, 1, 1, 1,
-1.453016, -1.727699, -3.36533, 1, 1, 1, 1, 1,
-1.452343, 0.8155997, 0.5468564, 1, 1, 1, 1, 1,
-1.450372, -0.03830624, -1.252192, 1, 1, 1, 1, 1,
-1.449171, -1.148524, -1.471166, 1, 1, 1, 1, 1,
-1.445639, 0.7468082, 0.3856331, 1, 1, 1, 1, 1,
-1.437224, -0.2662877, -0.6312463, 1, 1, 1, 1, 1,
-1.431977, 0.8301976, -1.943664, 1, 1, 1, 1, 1,
-1.43009, 1.583252, 0.661532, 1, 1, 1, 1, 1,
-1.426169, -0.004725279, -1.534266, 1, 1, 1, 1, 1,
-1.421458, -0.02696307, -1.873368, 1, 1, 1, 1, 1,
-1.417865, 0.4739965, -1.500414, 1, 1, 1, 1, 1,
-1.417279, -0.9551068, -2.969836, 1, 1, 1, 1, 1,
-1.408643, -0.03577634, -0.7142891, 1, 1, 1, 1, 1,
-1.40795, 0.3926001, -0.7712657, 1, 1, 1, 1, 1,
-1.404007, -1.240427, -1.340018, 0, 0, 1, 1, 1,
-1.399975, 1.410941, -1.454754, 1, 0, 0, 1, 1,
-1.370055, -2.04734, -2.346077, 1, 0, 0, 1, 1,
-1.354897, -1.171826, -2.010055, 1, 0, 0, 1, 1,
-1.34567, 0.2218972, -0.6598941, 1, 0, 0, 1, 1,
-1.337391, -0.6943557, -1.70593, 1, 0, 0, 1, 1,
-1.317039, -0.9503039, -1.181977, 0, 0, 0, 1, 1,
-1.293914, -0.4143228, -3.725834, 0, 0, 0, 1, 1,
-1.28879, -1.994931, -0.9557221, 0, 0, 0, 1, 1,
-1.287765, 1.591712, -0.4840227, 0, 0, 0, 1, 1,
-1.272247, 0.1223481, -1.447316, 0, 0, 0, 1, 1,
-1.269284, 0.4144008, -0.5515956, 0, 0, 0, 1, 1,
-1.264003, -0.5942748, -1.410038, 0, 0, 0, 1, 1,
-1.256479, 1.419203, -0.6481296, 1, 1, 1, 1, 1,
-1.242733, 1.449993, -0.5403873, 1, 1, 1, 1, 1,
-1.241582, 1.8443, -1.784679, 1, 1, 1, 1, 1,
-1.240841, 0.608451, 0.1510626, 1, 1, 1, 1, 1,
-1.240219, -0.02400386, -1.177259, 1, 1, 1, 1, 1,
-1.233712, -1.226758, -2.997038, 1, 1, 1, 1, 1,
-1.230289, 0.4207296, 0.02691071, 1, 1, 1, 1, 1,
-1.214698, 0.2286583, -0.6806921, 1, 1, 1, 1, 1,
-1.211235, -2.257936, -3.867168, 1, 1, 1, 1, 1,
-1.205402, 0.555174, -3.51667, 1, 1, 1, 1, 1,
-1.193297, 0.6935726, -1.516795, 1, 1, 1, 1, 1,
-1.192182, 0.4180306, 2.174397, 1, 1, 1, 1, 1,
-1.188972, -1.067258, -1.239988, 1, 1, 1, 1, 1,
-1.184892, -0.5852241, 0.04035609, 1, 1, 1, 1, 1,
-1.172668, 0.849403, -2.987286, 1, 1, 1, 1, 1,
-1.168523, -0.4004676, -1.697424, 0, 0, 1, 1, 1,
-1.164726, 1.694014, -2.637744, 1, 0, 0, 1, 1,
-1.164631, -0.4359062, -2.655399, 1, 0, 0, 1, 1,
-1.162435, -0.2624863, -2.768195, 1, 0, 0, 1, 1,
-1.159757, 0.171072, -1.399391, 1, 0, 0, 1, 1,
-1.159647, 0.3996617, -1.338023, 1, 0, 0, 1, 1,
-1.15811, -0.3384973, -2.046825, 0, 0, 0, 1, 1,
-1.152595, 1.337713, -2.221, 0, 0, 0, 1, 1,
-1.149913, 0.9877864, -1.438415, 0, 0, 0, 1, 1,
-1.148854, -0.007810036, -1.608403, 0, 0, 0, 1, 1,
-1.134528, 0.995952, -0.7569942, 0, 0, 0, 1, 1,
-1.1293, -0.7148336, -1.753238, 0, 0, 0, 1, 1,
-1.128408, -1.257502, -2.941274, 0, 0, 0, 1, 1,
-1.126163, 0.742088, -1.677646, 1, 1, 1, 1, 1,
-1.123943, -0.8149743, -1.551157, 1, 1, 1, 1, 1,
-1.12049, -0.9879199, -2.591773, 1, 1, 1, 1, 1,
-1.111407, 0.3929834, -0.7844643, 1, 1, 1, 1, 1,
-1.098354, -0.467555, -3.595948, 1, 1, 1, 1, 1,
-1.097024, 0.3534661, -0.3204643, 1, 1, 1, 1, 1,
-1.09655, -0.04989305, -0.6771119, 1, 1, 1, 1, 1,
-1.089053, 0.5359029, 0.02565947, 1, 1, 1, 1, 1,
-1.086561, 0.7082943, -0.5624965, 1, 1, 1, 1, 1,
-1.082997, -1.045214, -0.7912809, 1, 1, 1, 1, 1,
-1.079295, 0.7899324, 0.7027048, 1, 1, 1, 1, 1,
-1.078265, -1.038594, -2.733058, 1, 1, 1, 1, 1,
-1.075358, -2.551416, -3.381541, 1, 1, 1, 1, 1,
-1.075033, -0.3064713, -1.990656, 1, 1, 1, 1, 1,
-1.064035, -0.7933409, -2.078662, 1, 1, 1, 1, 1,
-1.062315, -2.31658, -0.8022031, 0, 0, 1, 1, 1,
-1.06138, -0.7656099, -2.139269, 1, 0, 0, 1, 1,
-1.058812, 1.328365, -0.8113339, 1, 0, 0, 1, 1,
-1.053142, -0.1945537, -0.5797628, 1, 0, 0, 1, 1,
-1.05307, 0.6853611, 0.2589169, 1, 0, 0, 1, 1,
-1.045146, -0.5969754, -1.359755, 1, 0, 0, 1, 1,
-1.043148, -0.686358, -3.441235, 0, 0, 0, 1, 1,
-1.03601, -0.3752755, -0.5994897, 0, 0, 0, 1, 1,
-1.033149, -2.052822, -3.330341, 0, 0, 0, 1, 1,
-1.028192, -0.1492137, -1.611655, 0, 0, 0, 1, 1,
-1.027559, -0.7818491, -3.051035, 0, 0, 0, 1, 1,
-1.027111, -1.275507, -3.570963, 0, 0, 0, 1, 1,
-1.017115, -0.1621271, -1.848944, 0, 0, 0, 1, 1,
-1.014935, 0.4388546, -0.9309119, 1, 1, 1, 1, 1,
-1.012895, 0.6417187, 1.323102, 1, 1, 1, 1, 1,
-1.007853, -0.2441474, -2.538125, 1, 1, 1, 1, 1,
-1.00478, -0.526647, -1.591904, 1, 1, 1, 1, 1,
-1.000504, 0.4811645, -0.4838627, 1, 1, 1, 1, 1,
-0.9969941, -0.1958992, -1.867011, 1, 1, 1, 1, 1,
-0.9937675, -1.656658, -2.535536, 1, 1, 1, 1, 1,
-0.9908845, 0.04452127, -1.542659, 1, 1, 1, 1, 1,
-0.9836787, 0.02642681, -1.246942, 1, 1, 1, 1, 1,
-0.9812863, 0.9853259, -1.506988, 1, 1, 1, 1, 1,
-0.9777356, -0.2135119, -0.2784045, 1, 1, 1, 1, 1,
-0.9775054, -1.528826, -2.799332, 1, 1, 1, 1, 1,
-0.9758698, -1.085823, -3.911605, 1, 1, 1, 1, 1,
-0.9628374, -0.1699981, -1.695225, 1, 1, 1, 1, 1,
-0.9528288, 2.276524, 0.1804375, 1, 1, 1, 1, 1,
-0.9522334, -0.09852912, -1.163899, 0, 0, 1, 1, 1,
-0.9520493, -1.534126, -2.620698, 1, 0, 0, 1, 1,
-0.9506074, -0.07079071, -0.8843797, 1, 0, 0, 1, 1,
-0.9483244, -1.297897, -2.425537, 1, 0, 0, 1, 1,
-0.9482707, -1.731122, -2.108072, 1, 0, 0, 1, 1,
-0.9469834, 0.8482573, 0.7984121, 1, 0, 0, 1, 1,
-0.9432256, -0.7786889, -2.54864, 0, 0, 0, 1, 1,
-0.9429314, 1.950842, -0.3415759, 0, 0, 0, 1, 1,
-0.93866, 0.6659576, -0.5262288, 0, 0, 0, 1, 1,
-0.9371641, -0.09999991, -1.722802, 0, 0, 0, 1, 1,
-0.9295869, -0.44897, -2.477952, 0, 0, 0, 1, 1,
-0.9289701, 2.664551, 1.686477, 0, 0, 0, 1, 1,
-0.9278818, 0.3749615, -3.287334, 0, 0, 0, 1, 1,
-0.9232877, 0.7551547, -0.4110149, 1, 1, 1, 1, 1,
-0.9222747, -0.4886102, -3.376894, 1, 1, 1, 1, 1,
-0.9217128, 0.6152912, 0.02712531, 1, 1, 1, 1, 1,
-0.9195426, 0.5494573, -1.515994, 1, 1, 1, 1, 1,
-0.9181328, 0.8395926, -1.10769, 1, 1, 1, 1, 1,
-0.9178143, -0.5430686, -2.447511, 1, 1, 1, 1, 1,
-0.9167123, 0.01842418, -1.534993, 1, 1, 1, 1, 1,
-0.9088025, 0.530035, -2.639005, 1, 1, 1, 1, 1,
-0.9072979, 0.6524781, -1.054589, 1, 1, 1, 1, 1,
-0.906071, 0.01348624, -0.5203438, 1, 1, 1, 1, 1,
-0.9055812, 0.4532297, -1.771367, 1, 1, 1, 1, 1,
-0.900944, 0.3311968, -1.947133, 1, 1, 1, 1, 1,
-0.9001374, -2.135269, -3.506517, 1, 1, 1, 1, 1,
-0.8989465, -0.2519906, -0.9590149, 1, 1, 1, 1, 1,
-0.8947464, -0.6038753, -2.373592, 1, 1, 1, 1, 1,
-0.8924997, 1.104259, -1.158611, 0, 0, 1, 1, 1,
-0.8916589, -0.3105741, -2.376565, 1, 0, 0, 1, 1,
-0.8870103, 1.642928, 0.9540371, 1, 0, 0, 1, 1,
-0.8861555, -2.220327, -1.94126, 1, 0, 0, 1, 1,
-0.8836583, -0.1135385, -0.09163257, 1, 0, 0, 1, 1,
-0.8807607, -0.5509676, -2.145111, 1, 0, 0, 1, 1,
-0.8807589, 1.005602, 0.4664271, 0, 0, 0, 1, 1,
-0.8709403, 1.454982, 0.3457421, 0, 0, 0, 1, 1,
-0.870289, -0.1560234, -2.460343, 0, 0, 0, 1, 1,
-0.8667316, 1.305961, -0.78259, 0, 0, 0, 1, 1,
-0.8558585, 0.5808406, -1.014836, 0, 0, 0, 1, 1,
-0.8549983, -0.6140814, -2.310122, 0, 0, 0, 1, 1,
-0.8491585, 0.1121163, -2.43656, 0, 0, 0, 1, 1,
-0.8400292, -0.4421785, -1.891798, 1, 1, 1, 1, 1,
-0.8378402, -1.092512, -2.25012, 1, 1, 1, 1, 1,
-0.8377833, -0.3649525, -1.716126, 1, 1, 1, 1, 1,
-0.8357456, -0.9268274, -1.504867, 1, 1, 1, 1, 1,
-0.8350556, 0.373446, 0.3911996, 1, 1, 1, 1, 1,
-0.8349745, -0.5275004, -2.252848, 1, 1, 1, 1, 1,
-0.8323157, 1.273345, 0.8398552, 1, 1, 1, 1, 1,
-0.8287218, 1.507665, 0.1374709, 1, 1, 1, 1, 1,
-0.8273525, 1.113113, 1.081368, 1, 1, 1, 1, 1,
-0.8217561, -1.851296, -2.52551, 1, 1, 1, 1, 1,
-0.8196772, -1.709245, -4.517423, 1, 1, 1, 1, 1,
-0.8188349, -1.525528, -2.700791, 1, 1, 1, 1, 1,
-0.8174187, -1.354212, -4.53177, 1, 1, 1, 1, 1,
-0.8116401, 0.4083634, -1.812293, 1, 1, 1, 1, 1,
-0.8076754, 1.941521, -0.4790375, 1, 1, 1, 1, 1,
-0.7981953, -0.3468831, -1.87792, 0, 0, 1, 1, 1,
-0.7959862, 1.32852, -1.542302, 1, 0, 0, 1, 1,
-0.7926517, -1.456985, -3.795389, 1, 0, 0, 1, 1,
-0.7925158, -0.2120618, -2.587371, 1, 0, 0, 1, 1,
-0.7903131, -1.252039, -2.312742, 1, 0, 0, 1, 1,
-0.7889491, 0.4150526, -3.157195, 1, 0, 0, 1, 1,
-0.7867455, -0.8959091, -4.140133, 0, 0, 0, 1, 1,
-0.7864196, 0.983785, -0.8316187, 0, 0, 0, 1, 1,
-0.7821061, -0.3135598, -0.6989654, 0, 0, 0, 1, 1,
-0.7801859, -0.3494059, 0.04015641, 0, 0, 0, 1, 1,
-0.7738532, -1.058695, -3.175237, 0, 0, 0, 1, 1,
-0.7723475, 0.1558964, -0.4515227, 0, 0, 0, 1, 1,
-0.7722149, 0.05300823, -2.579985, 0, 0, 0, 1, 1,
-0.7677313, 0.3090499, -2.45195, 1, 1, 1, 1, 1,
-0.7675717, -1.148809, -3.556865, 1, 1, 1, 1, 1,
-0.7674285, 0.5112009, -1.88285, 1, 1, 1, 1, 1,
-0.7524123, -0.3513864, -0.9689654, 1, 1, 1, 1, 1,
-0.747217, 0.1195385, -1.91584, 1, 1, 1, 1, 1,
-0.7373523, 0.4821766, -1.159656, 1, 1, 1, 1, 1,
-0.7289135, -1.603734, -1.981779, 1, 1, 1, 1, 1,
-0.7265111, -0.7990018, -2.229787, 1, 1, 1, 1, 1,
-0.7223541, 2.524262, -1.229556, 1, 1, 1, 1, 1,
-0.7185029, 0.730608, -0.09533193, 1, 1, 1, 1, 1,
-0.7124031, 0.2799819, -0.7043762, 1, 1, 1, 1, 1,
-0.7071246, 0.4757642, -1.832252, 1, 1, 1, 1, 1,
-0.7061267, 1.028137, -0.7927885, 1, 1, 1, 1, 1,
-0.6966335, 0.5748802, -2.252833, 1, 1, 1, 1, 1,
-0.6933293, -0.3249662, -1.200578, 1, 1, 1, 1, 1,
-0.6931834, -0.5237855, -2.526663, 0, 0, 1, 1, 1,
-0.69274, -0.51949, -2.248585, 1, 0, 0, 1, 1,
-0.6922324, -0.4844324, -2.693457, 1, 0, 0, 1, 1,
-0.6920202, 0.1177697, -1.389916, 1, 0, 0, 1, 1,
-0.6914226, -1.003247, -3.165144, 1, 0, 0, 1, 1,
-0.6904883, 0.964146, -1.419782, 1, 0, 0, 1, 1,
-0.6903538, 0.8919791, 0.1966585, 0, 0, 0, 1, 1,
-0.6898079, -0.277219, -2.196362, 0, 0, 0, 1, 1,
-0.686111, 2.205762, -0.7350942, 0, 0, 0, 1, 1,
-0.6845211, 0.7405791, -0.1324372, 0, 0, 0, 1, 1,
-0.6787001, 0.04364484, -2.968294, 0, 0, 0, 1, 1,
-0.6780645, 0.6783431, -2.288511, 0, 0, 0, 1, 1,
-0.6751513, 0.5368326, 0.3977334, 0, 0, 0, 1, 1,
-0.6747476, 1.938212, -1.581645, 1, 1, 1, 1, 1,
-0.6727377, 1.357167, -0.5791818, 1, 1, 1, 1, 1,
-0.6669551, -0.08305847, -0.4351192, 1, 1, 1, 1, 1,
-0.6654904, -1.367975, -2.644708, 1, 1, 1, 1, 1,
-0.6616287, 0.989532, -0.1238196, 1, 1, 1, 1, 1,
-0.6585708, 0.4281829, -1.48296, 1, 1, 1, 1, 1,
-0.6583216, -0.9120103, -1.880157, 1, 1, 1, 1, 1,
-0.6576314, 0.8404279, -1.700659, 1, 1, 1, 1, 1,
-0.6546789, -2.165807, -2.508801, 1, 1, 1, 1, 1,
-0.6465015, -2.117302, -3.804192, 1, 1, 1, 1, 1,
-0.6388376, 0.2105083, -1.21791, 1, 1, 1, 1, 1,
-0.6375096, -1.476293, -3.206629, 1, 1, 1, 1, 1,
-0.6373057, -0.4148704, -0.1253638, 1, 1, 1, 1, 1,
-0.6342855, 1.338363, -0.9759879, 1, 1, 1, 1, 1,
-0.6329839, 0.03104836, -1.954995, 1, 1, 1, 1, 1,
-0.6231958, 1.333985, -1.116292, 0, 0, 1, 1, 1,
-0.6179558, 0.5614429, -1.024748, 1, 0, 0, 1, 1,
-0.6177245, -0.8723844, -3.29531, 1, 0, 0, 1, 1,
-0.6169336, -1.076268, -2.695733, 1, 0, 0, 1, 1,
-0.6156501, -1.95686, -3.531881, 1, 0, 0, 1, 1,
-0.6129841, 1.444809, -0.5743373, 1, 0, 0, 1, 1,
-0.6097948, 0.6639384, -0.926287, 0, 0, 0, 1, 1,
-0.6082289, 1.182485, 0.1422726, 0, 0, 0, 1, 1,
-0.6067068, 0.1640034, -0.7881692, 0, 0, 0, 1, 1,
-0.6058401, -0.7625715, -1.672269, 0, 0, 0, 1, 1,
-0.6006771, -0.004940238, -2.26308, 0, 0, 0, 1, 1,
-0.5947071, -0.8244581, -3.089572, 0, 0, 0, 1, 1,
-0.5938698, 1.26381, -1.26079, 0, 0, 0, 1, 1,
-0.5918191, 1.111621, 0.4134425, 1, 1, 1, 1, 1,
-0.5909627, 3.185694, -0.1519836, 1, 1, 1, 1, 1,
-0.5893768, 0.1714527, 0.1579505, 1, 1, 1, 1, 1,
-0.5890936, 0.1459271, -0.1926042, 1, 1, 1, 1, 1,
-0.5882689, 1.164363, -1.895398, 1, 1, 1, 1, 1,
-0.5849561, -1.584149, -0.9603483, 1, 1, 1, 1, 1,
-0.5783505, -1.866195, -4.390249, 1, 1, 1, 1, 1,
-0.5755103, -0.75942, -3.382461, 1, 1, 1, 1, 1,
-0.5752271, -1.01948, -3.519507, 1, 1, 1, 1, 1,
-0.564772, 1.199271, -0.3130936, 1, 1, 1, 1, 1,
-0.5605682, 0.06255832, -2.491612, 1, 1, 1, 1, 1,
-0.5603505, 1.188668, 1.18975, 1, 1, 1, 1, 1,
-0.5560614, 0.726535, -0.9566026, 1, 1, 1, 1, 1,
-0.5544133, 0.3604853, -0.4450459, 1, 1, 1, 1, 1,
-0.5540929, 0.3621304, -2.403371, 1, 1, 1, 1, 1,
-0.5536766, 0.4967163, -1.541601, 0, 0, 1, 1, 1,
-0.5525198, 0.5196463, -0.6379459, 1, 0, 0, 1, 1,
-0.5492808, -0.5622048, -1.347007, 1, 0, 0, 1, 1,
-0.5478501, 0.2493135, 0.0609008, 1, 0, 0, 1, 1,
-0.5438414, 0.2381214, 0.4730901, 1, 0, 0, 1, 1,
-0.5435891, -0.864746, -4.396309, 1, 0, 0, 1, 1,
-0.5419026, 0.2872529, -1.644952, 0, 0, 0, 1, 1,
-0.5321548, 0.2806252, -2.287147, 0, 0, 0, 1, 1,
-0.5295014, -0.2443837, -2.886986, 0, 0, 0, 1, 1,
-0.5223579, -0.4807807, -2.510098, 0, 0, 0, 1, 1,
-0.5217716, -1.113504, -2.63499, 0, 0, 0, 1, 1,
-0.5195921, -1.9415, -2.664665, 0, 0, 0, 1, 1,
-0.5147403, 1.286946, 0.7607929, 0, 0, 0, 1, 1,
-0.5121601, 0.8510514, 0.4775623, 1, 1, 1, 1, 1,
-0.5116071, 1.116118, -0.267731, 1, 1, 1, 1, 1,
-0.5091059, 0.6795004, -1.756375, 1, 1, 1, 1, 1,
-0.504904, -0.170495, -2.916053, 1, 1, 1, 1, 1,
-0.5043038, -0.5708019, -2.305266, 1, 1, 1, 1, 1,
-0.5010297, 1.258957, -1.374646, 1, 1, 1, 1, 1,
-0.4997647, -0.5292598, -1.496741, 1, 1, 1, 1, 1,
-0.4980738, -1.241987, -3.292452, 1, 1, 1, 1, 1,
-0.4919659, -1.051067, -2.47399, 1, 1, 1, 1, 1,
-0.4851054, -0.08609878, -2.933001, 1, 1, 1, 1, 1,
-0.4781872, -1.552449, -2.087584, 1, 1, 1, 1, 1,
-0.4767264, 0.3047922, -2.662412, 1, 1, 1, 1, 1,
-0.473696, 0.1671749, -0.0581057, 1, 1, 1, 1, 1,
-0.4725854, 1.669192, 0.1772963, 1, 1, 1, 1, 1,
-0.4671311, 0.1536027, -3.212836, 1, 1, 1, 1, 1,
-0.4652428, 1.329238, 0.6224751, 0, 0, 1, 1, 1,
-0.4621247, -0.855895, -3.019486, 1, 0, 0, 1, 1,
-0.4617302, -0.8837107, -5.011055, 1, 0, 0, 1, 1,
-0.4588929, -0.02069838, 0.4687118, 1, 0, 0, 1, 1,
-0.4585533, -0.4693691, -1.876501, 1, 0, 0, 1, 1,
-0.4526272, -0.8268069, -1.859563, 1, 0, 0, 1, 1,
-0.4524063, 0.2392847, -1.042498, 0, 0, 0, 1, 1,
-0.4483652, 2.145448, -1.535945, 0, 0, 0, 1, 1,
-0.4442564, -0.3475883, -3.219676, 0, 0, 0, 1, 1,
-0.4391373, -0.439204, -0.8310016, 0, 0, 0, 1, 1,
-0.4363775, 0.9436949, 1.974003, 0, 0, 0, 1, 1,
-0.423481, 1.507486, 1.219287, 0, 0, 0, 1, 1,
-0.4165253, 0.7549059, -0.898551, 0, 0, 0, 1, 1,
-0.4080417, 0.8675938, -0.7509267, 1, 1, 1, 1, 1,
-0.4037895, -0.3992064, -1.507632, 1, 1, 1, 1, 1,
-0.3965179, -0.4440803, -3.006337, 1, 1, 1, 1, 1,
-0.387516, -0.6406326, -3.392372, 1, 1, 1, 1, 1,
-0.3872767, -0.1784316, -1.643816, 1, 1, 1, 1, 1,
-0.381775, -1.231256, -2.631284, 1, 1, 1, 1, 1,
-0.3740821, 0.1687211, -0.7023765, 1, 1, 1, 1, 1,
-0.3734542, -0.3652052, -0.1240201, 1, 1, 1, 1, 1,
-0.3659541, -0.9645367, -3.876211, 1, 1, 1, 1, 1,
-0.3644119, 1.150607, 1.159077, 1, 1, 1, 1, 1,
-0.3619602, 1.512286, -2.474262, 1, 1, 1, 1, 1,
-0.3605793, 0.5615119, -0.8239319, 1, 1, 1, 1, 1,
-0.3561848, -1.063785, -3.474108, 1, 1, 1, 1, 1,
-0.3560341, -0.6025476, -2.067851, 1, 1, 1, 1, 1,
-0.3538528, -1.248735, -3.615973, 1, 1, 1, 1, 1,
-0.3496642, -0.6603117, -2.701102, 0, 0, 1, 1, 1,
-0.3472439, 0.5694601, -0.173639, 1, 0, 0, 1, 1,
-0.346629, 1.169566, -0.5794266, 1, 0, 0, 1, 1,
-0.3413075, 0.4955083, -2.395048, 1, 0, 0, 1, 1,
-0.3409466, 0.1494136, -3.356819, 1, 0, 0, 1, 1,
-0.3405226, -0.5146987, -1.893491, 1, 0, 0, 1, 1,
-0.336508, 0.9715191, -0.6432609, 0, 0, 0, 1, 1,
-0.3326431, 0.9641891, -1.668287, 0, 0, 0, 1, 1,
-0.3303521, -0.6449379, -1.928488, 0, 0, 0, 1, 1,
-0.3296342, -1.183787, -3.616649, 0, 0, 0, 1, 1,
-0.3285106, -2.02868, -2.460364, 0, 0, 0, 1, 1,
-0.3259566, -2.322788, -4.04102, 0, 0, 0, 1, 1,
-0.3244912, -0.01863261, -2.204258, 0, 0, 0, 1, 1,
-0.3216382, 0.5793854, 0.1541847, 1, 1, 1, 1, 1,
-0.3140952, -0.9798597, -2.967295, 1, 1, 1, 1, 1,
-0.3139579, -0.238684, -0.7672181, 1, 1, 1, 1, 1,
-0.3127937, -0.7928841, -3.211629, 1, 1, 1, 1, 1,
-0.3120478, 0.6715438, -0.7285203, 1, 1, 1, 1, 1,
-0.3120021, 0.7550228, -2.506929, 1, 1, 1, 1, 1,
-0.3115032, -0.2811004, -2.497336, 1, 1, 1, 1, 1,
-0.3083199, -2.504354, -3.572617, 1, 1, 1, 1, 1,
-0.3015134, -0.004235662, -1.474774, 1, 1, 1, 1, 1,
-0.3005114, 0.3000931, 0.4033969, 1, 1, 1, 1, 1,
-0.3002605, -0.8901439, -2.276362, 1, 1, 1, 1, 1,
-0.2996686, 1.674801, -0.07135493, 1, 1, 1, 1, 1,
-0.2988791, 0.7537941, 0.1193722, 1, 1, 1, 1, 1,
-0.2978607, 2.036656, 0.5341061, 1, 1, 1, 1, 1,
-0.2977775, -0.4393413, -1.941464, 1, 1, 1, 1, 1,
-0.2960934, -0.4365786, -2.854625, 0, 0, 1, 1, 1,
-0.2955985, 0.3920513, -0.547716, 1, 0, 0, 1, 1,
-0.2873572, -0.3968457, -0.04891941, 1, 0, 0, 1, 1,
-0.2846733, 0.2164353, -1.99311, 1, 0, 0, 1, 1,
-0.2834886, 1.948465, 0.1049803, 1, 0, 0, 1, 1,
-0.274165, 0.6004882, -0.5206591, 1, 0, 0, 1, 1,
-0.2725731, -0.7793202, -1.272447, 0, 0, 0, 1, 1,
-0.2696845, 1.083205, 0.218353, 0, 0, 0, 1, 1,
-0.2630303, -1.22127, -3.362878, 0, 0, 0, 1, 1,
-0.2596423, 1.039147, 0.8131337, 0, 0, 0, 1, 1,
-0.2593032, -0.2961185, -0.6538776, 0, 0, 0, 1, 1,
-0.2561769, -2.168432, -2.633802, 0, 0, 0, 1, 1,
-0.2551285, -0.1687873, -2.384192, 0, 0, 0, 1, 1,
-0.2542088, -1.199007, -1.001836, 1, 1, 1, 1, 1,
-0.2505644, -0.6963322, -3.012527, 1, 1, 1, 1, 1,
-0.2500227, 1.439799, -0.3082774, 1, 1, 1, 1, 1,
-0.2442747, 1.318058, -0.02381026, 1, 1, 1, 1, 1,
-0.2415567, 0.2746629, 0.3676791, 1, 1, 1, 1, 1,
-0.2406206, -0.5469751, -4.212949, 1, 1, 1, 1, 1,
-0.2338454, 0.4335918, 0.3258759, 1, 1, 1, 1, 1,
-0.2298187, 0.7093465, -1.060195, 1, 1, 1, 1, 1,
-0.2280065, -0.4591326, -2.022753, 1, 1, 1, 1, 1,
-0.2253883, 0.02666844, -1.821235, 1, 1, 1, 1, 1,
-0.2215391, -0.3425328, -1.946577, 1, 1, 1, 1, 1,
-0.2200132, -1.447507, -0.5448502, 1, 1, 1, 1, 1,
-0.2189609, 1.01297, 0.5235742, 1, 1, 1, 1, 1,
-0.2188405, -0.09831988, -2.225615, 1, 1, 1, 1, 1,
-0.2153738, -0.4909494, -4.436953, 1, 1, 1, 1, 1,
-0.2096063, -0.08448346, -1.93215, 0, 0, 1, 1, 1,
-0.2063254, -0.3066228, -4.597279, 1, 0, 0, 1, 1,
-0.2062155, 0.04653184, -0.1722512, 1, 0, 0, 1, 1,
-0.2060558, 0.2258806, 0.2571572, 1, 0, 0, 1, 1,
-0.2058478, -0.2250232, -2.741445, 1, 0, 0, 1, 1,
-0.2056684, -0.3177556, -3.002184, 1, 0, 0, 1, 1,
-0.2042687, -1.649381, -3.229408, 0, 0, 0, 1, 1,
-0.2015844, 1.197786, 1.885712, 0, 0, 0, 1, 1,
-0.2008602, 1.056815, -0.01849038, 0, 0, 0, 1, 1,
-0.1925776, 0.3967483, 0.2327194, 0, 0, 0, 1, 1,
-0.1911893, 0.3675497, 0.04360142, 0, 0, 0, 1, 1,
-0.1909847, -1.124203, -3.125535, 0, 0, 0, 1, 1,
-0.1847425, 2.755537, -0.3847913, 0, 0, 0, 1, 1,
-0.1804895, -1.000735, -1.341498, 1, 1, 1, 1, 1,
-0.1800361, -1.177727, -3.45018, 1, 1, 1, 1, 1,
-0.178111, -0.4378635, -3.218704, 1, 1, 1, 1, 1,
-0.1745229, 2.274319, -0.9470224, 1, 1, 1, 1, 1,
-0.1653928, -0.1099266, -2.111958, 1, 1, 1, 1, 1,
-0.1653561, -0.3114416, -4.749238, 1, 1, 1, 1, 1,
-0.1641303, 0.6112921, 0.3214569, 1, 1, 1, 1, 1,
-0.1611929, 0.2441838, 0.6153494, 1, 1, 1, 1, 1,
-0.1604328, -1.873766, -3.55573, 1, 1, 1, 1, 1,
-0.1526527, -1.160525, -3.575255, 1, 1, 1, 1, 1,
-0.1501814, 0.9508767, 2.000207, 1, 1, 1, 1, 1,
-0.1475366, 0.5402225, 1.793627, 1, 1, 1, 1, 1,
-0.1473574, -0.133812, -2.48419, 1, 1, 1, 1, 1,
-0.1462186, 0.6378964, -0.4448026, 1, 1, 1, 1, 1,
-0.1452185, 0.8348655, 0.3818226, 1, 1, 1, 1, 1,
-0.1350159, -1.819074, -3.56946, 0, 0, 1, 1, 1,
-0.131744, -0.5988872, -3.196695, 1, 0, 0, 1, 1,
-0.131257, -0.05938968, -2.647307, 1, 0, 0, 1, 1,
-0.1201677, 0.9201324, -0.7823232, 1, 0, 0, 1, 1,
-0.1196797, 0.3964054, 0.2725915, 1, 0, 0, 1, 1,
-0.1190021, -2.022286, -3.719293, 1, 0, 0, 1, 1,
-0.1185136, -1.890206, -3.859382, 0, 0, 0, 1, 1,
-0.1173455, 1.086572, 0.1608264, 0, 0, 0, 1, 1,
-0.1143865, 0.2790622, -0.1581073, 0, 0, 0, 1, 1,
-0.107267, -0.6070413, -4.706004, 0, 0, 0, 1, 1,
-0.09986484, -0.7513292, -3.015159, 0, 0, 0, 1, 1,
-0.09967627, -0.3025771, -3.836887, 0, 0, 0, 1, 1,
-0.09966388, 0.3076095, -0.8969229, 0, 0, 0, 1, 1,
-0.09867182, -2.777559, -1.242756, 1, 1, 1, 1, 1,
-0.09753929, 0.1263601, -1.63221, 1, 1, 1, 1, 1,
-0.09740505, -0.736743, -3.747889, 1, 1, 1, 1, 1,
-0.09576268, 0.6137245, -0.5730448, 1, 1, 1, 1, 1,
-0.09466856, -0.6698619, -2.301046, 1, 1, 1, 1, 1,
-0.08918209, 0.1591093, -0.2343595, 1, 1, 1, 1, 1,
-0.08460441, -0.8929096, -2.471372, 1, 1, 1, 1, 1,
-0.0824042, 0.617358, 0.3050787, 1, 1, 1, 1, 1,
-0.08005556, -3.029993, -3.668156, 1, 1, 1, 1, 1,
-0.07027712, 1.982866, -0.1304019, 1, 1, 1, 1, 1,
-0.06985274, 0.08907303, -1.428728, 1, 1, 1, 1, 1,
-0.06449711, 1.097155, 0.7893007, 1, 1, 1, 1, 1,
-0.06434584, -2.048018, -4.295031, 1, 1, 1, 1, 1,
-0.06095085, -1.027306, -3.200225, 1, 1, 1, 1, 1,
-0.05758791, -0.03047995, -1.242713, 1, 1, 1, 1, 1,
-0.05248914, 0.4619269, -1.57132, 0, 0, 1, 1, 1,
-0.04803964, -1.721778, -3.263536, 1, 0, 0, 1, 1,
-0.04538654, 0.1303665, -1.597467, 1, 0, 0, 1, 1,
-0.04450556, -0.9548222, -3.452122, 1, 0, 0, 1, 1,
-0.04364002, -0.6391307, -1.375787, 1, 0, 0, 1, 1,
-0.04159856, 1.07136, 0.03095917, 1, 0, 0, 1, 1,
-0.03919058, -1.588602, -3.320277, 0, 0, 0, 1, 1,
-0.0386527, -0.4155343, -3.564801, 0, 0, 0, 1, 1,
-0.03476081, 0.6090427, 0.5119869, 0, 0, 0, 1, 1,
-0.03346415, -0.06083422, -3.615604, 0, 0, 0, 1, 1,
-0.03288924, -0.2936211, -5.371837, 0, 0, 0, 1, 1,
-0.03014095, -0.4074511, -1.616098, 0, 0, 0, 1, 1,
-0.02553953, 0.5490104, -0.5812186, 0, 0, 0, 1, 1,
-0.02545398, -0.9070426, -3.226181, 1, 1, 1, 1, 1,
-0.02473561, -0.3627124, -3.518605, 1, 1, 1, 1, 1,
-0.02456647, 0.1671813, -0.2652889, 1, 1, 1, 1, 1,
-0.02280364, -0.417628, -4.176326, 1, 1, 1, 1, 1,
-0.02081407, 0.6547614, 0.1861113, 1, 1, 1, 1, 1,
-0.02001816, -0.7399592, -1.794973, 1, 1, 1, 1, 1,
-0.01822289, 1.342572, 0.1209204, 1, 1, 1, 1, 1,
-0.01777351, -1.683189, -4.325393, 1, 1, 1, 1, 1,
-0.01553751, -0.6529613, -3.344091, 1, 1, 1, 1, 1,
-0.01150043, 0.5240279, -0.5659311, 1, 1, 1, 1, 1,
-0.008469982, -0.8662935, -1.969853, 1, 1, 1, 1, 1,
-0.003187386, 2.036441, 0.2976227, 1, 1, 1, 1, 1,
-0.001869752, 0.1445453, 1.546618, 1, 1, 1, 1, 1,
0.006333681, 1.667992, 0.7111052, 1, 1, 1, 1, 1,
0.006532577, 0.8431346, -0.00643105, 1, 1, 1, 1, 1,
0.009416895, -1.505638, 4.518759, 0, 0, 1, 1, 1,
0.01225985, 0.6403415, -0.8795643, 1, 0, 0, 1, 1,
0.01243995, 0.004018291, 0.7884999, 1, 0, 0, 1, 1,
0.01268774, -0.1651399, 3.093726, 1, 0, 0, 1, 1,
0.01277029, -1.139177, 4.402425, 1, 0, 0, 1, 1,
0.01368248, -0.4755176, 2.042919, 1, 0, 0, 1, 1,
0.01619142, 0.4810888, -2.11863, 0, 0, 0, 1, 1,
0.02004908, -0.5925606, 3.130612, 0, 0, 0, 1, 1,
0.02270986, 0.7978653, -0.5632315, 0, 0, 0, 1, 1,
0.02476158, 0.2989144, -0.166323, 0, 0, 0, 1, 1,
0.02785675, -0.5121434, 2.490292, 0, 0, 0, 1, 1,
0.03147151, 0.4797593, -0.1778666, 0, 0, 0, 1, 1,
0.03434772, -1.683352, 5.677171, 0, 0, 0, 1, 1,
0.03670608, 0.08620783, 1.661886, 1, 1, 1, 1, 1,
0.03979215, -1.392749, 4.118332, 1, 1, 1, 1, 1,
0.04462367, 0.1180114, 1.849775, 1, 1, 1, 1, 1,
0.04744315, 0.7251212, 0.6598348, 1, 1, 1, 1, 1,
0.05210143, 0.4978416, 0.773115, 1, 1, 1, 1, 1,
0.05291771, -0.333081, 2.324799, 1, 1, 1, 1, 1,
0.05603472, -1.124322, 1.500976, 1, 1, 1, 1, 1,
0.06509352, 0.09344813, 2.124404, 1, 1, 1, 1, 1,
0.07022841, -0.1614289, 3.460254, 1, 1, 1, 1, 1,
0.07184014, -0.9329436, 5.948698, 1, 1, 1, 1, 1,
0.07324795, -0.8615301, 0.7879863, 1, 1, 1, 1, 1,
0.07364518, -0.1174752, 3.446255, 1, 1, 1, 1, 1,
0.0748046, 0.1204907, 1.072738, 1, 1, 1, 1, 1,
0.07845082, 1.351593, -1.278355, 1, 1, 1, 1, 1,
0.07962862, -0.152317, 3.340445, 1, 1, 1, 1, 1,
0.08663055, 0.9252691, -0.4256794, 0, 0, 1, 1, 1,
0.09225623, -1.53598, 5.66725, 1, 0, 0, 1, 1,
0.09355841, -1.433514, 5.426114, 1, 0, 0, 1, 1,
0.09395897, -1.296161, 3.456834, 1, 0, 0, 1, 1,
0.09897352, 1.068578, 0.7603502, 1, 0, 0, 1, 1,
0.09994724, -1.893802, 2.871866, 1, 0, 0, 1, 1,
0.1014022, -0.8860217, 3.142087, 0, 0, 0, 1, 1,
0.1046939, -0.6133942, 1.628368, 0, 0, 0, 1, 1,
0.1055933, -1.727323, 3.554205, 0, 0, 0, 1, 1,
0.1056738, 1.44522, -0.7944016, 0, 0, 0, 1, 1,
0.1089697, -0.2992828, 3.824015, 0, 0, 0, 1, 1,
0.1094795, 0.4741653, 0.09440178, 0, 0, 0, 1, 1,
0.1103693, 0.2866291, 1.460554, 0, 0, 0, 1, 1,
0.112931, 1.389545, -0.8475031, 1, 1, 1, 1, 1,
0.1132008, -1.161182, 3.359134, 1, 1, 1, 1, 1,
0.1140428, -0.8097669, 3.606602, 1, 1, 1, 1, 1,
0.1190636, -0.4145066, 3.683801, 1, 1, 1, 1, 1,
0.1235412, -0.5463962, 4.125985, 1, 1, 1, 1, 1,
0.1248831, 1.071769, -1.343928, 1, 1, 1, 1, 1,
0.1357108, 1.256848, -0.5877488, 1, 1, 1, 1, 1,
0.1388693, 0.8796149, -0.3424558, 1, 1, 1, 1, 1,
0.1453163, -0.6757547, 1.818381, 1, 1, 1, 1, 1,
0.145519, -0.2310701, 1.875175, 1, 1, 1, 1, 1,
0.1503735, 0.3306494, -0.01288725, 1, 1, 1, 1, 1,
0.1569564, -0.9158929, 3.037656, 1, 1, 1, 1, 1,
0.1644606, 0.2553746, -0.6233391, 1, 1, 1, 1, 1,
0.1651862, 0.01158075, 1.955245, 1, 1, 1, 1, 1,
0.1655645, 0.340764, 0.4181044, 1, 1, 1, 1, 1,
0.1692393, 0.03205327, 0.9638489, 0, 0, 1, 1, 1,
0.1693442, 2.084007, 1.692707, 1, 0, 0, 1, 1,
0.1705028, -0.6839275, 4.392139, 1, 0, 0, 1, 1,
0.1761197, 0.1342631, 1.19154, 1, 0, 0, 1, 1,
0.1787125, -0.4786026, 2.219207, 1, 0, 0, 1, 1,
0.1830393, -0.6177362, 2.617482, 1, 0, 0, 1, 1,
0.1834856, -0.02925587, 1.962194, 0, 0, 0, 1, 1,
0.184406, 1.808956, 0.3129838, 0, 0, 0, 1, 1,
0.1847192, -1.760745, 3.294441, 0, 0, 0, 1, 1,
0.1849583, 0.6416248, 0.01727532, 0, 0, 0, 1, 1,
0.1862326, 0.5265605, -0.2556199, 0, 0, 0, 1, 1,
0.1875049, -1.120108, 3.873082, 0, 0, 0, 1, 1,
0.1893244, -1.234393, 3.892985, 0, 0, 0, 1, 1,
0.1894014, 0.7066417, 0.5534706, 1, 1, 1, 1, 1,
0.1901659, 0.4166705, 0.08636386, 1, 1, 1, 1, 1,
0.1904159, -0.8085237, 2.645671, 1, 1, 1, 1, 1,
0.1940336, 0.065621, 1.623501, 1, 1, 1, 1, 1,
0.1943199, -0.402254, 2.761664, 1, 1, 1, 1, 1,
0.2021339, 2.267695, -0.4757098, 1, 1, 1, 1, 1,
0.204774, -1.242484, 2.872604, 1, 1, 1, 1, 1,
0.2063915, -1.416182, 0.2944806, 1, 1, 1, 1, 1,
0.2119797, -0.0835639, 1.25465, 1, 1, 1, 1, 1,
0.2130676, 1.509878, 0.2692451, 1, 1, 1, 1, 1,
0.2133638, 1.207972, 0.5959098, 1, 1, 1, 1, 1,
0.2146166, 0.6503391, 0.7097019, 1, 1, 1, 1, 1,
0.2169383, -0.06130622, 2.963206, 1, 1, 1, 1, 1,
0.2180256, -1.396319, 4.812541, 1, 1, 1, 1, 1,
0.2213029, -0.9794555, 4.855485, 1, 1, 1, 1, 1,
0.2213514, -0.4917965, 2.842693, 0, 0, 1, 1, 1,
0.2219944, -0.0170138, 1.956812, 1, 0, 0, 1, 1,
0.2227229, -0.1050249, 0.6610797, 1, 0, 0, 1, 1,
0.223488, 0.09553514, 2.676093, 1, 0, 0, 1, 1,
0.2242621, 1.875315, 0.224918, 1, 0, 0, 1, 1,
0.2288896, 0.5127512, -1.06966, 1, 0, 0, 1, 1,
0.2292635, 0.9287407, -0.07527431, 0, 0, 0, 1, 1,
0.234443, 0.3689997, 0.5778747, 0, 0, 0, 1, 1,
0.2404513, 0.7290981, 1.451253, 0, 0, 0, 1, 1,
0.2438435, -1.200229, 4.231349, 0, 0, 0, 1, 1,
0.244447, 1.517488, -0.2216565, 0, 0, 0, 1, 1,
0.2447269, -1.031756, 3.180148, 0, 0, 0, 1, 1,
0.2455508, -1.337115, 1.743528, 0, 0, 0, 1, 1,
0.2459302, -0.9216168, 2.213504, 1, 1, 1, 1, 1,
0.2478215, -0.1808986, 1.733786, 1, 1, 1, 1, 1,
0.254322, 0.6947746, -0.7165996, 1, 1, 1, 1, 1,
0.2677879, 1.781214, 0.6794867, 1, 1, 1, 1, 1,
0.2739655, -0.7485647, 2.301386, 1, 1, 1, 1, 1,
0.2753203, 0.5290334, 2.608762, 1, 1, 1, 1, 1,
0.2759821, -0.6160911, 2.165243, 1, 1, 1, 1, 1,
0.2768846, -0.2618168, 1.009016, 1, 1, 1, 1, 1,
0.2781594, 0.02896298, 0.7639002, 1, 1, 1, 1, 1,
0.2785116, 0.4439999, 1.208075, 1, 1, 1, 1, 1,
0.2807638, 0.2398803, 0.8886682, 1, 1, 1, 1, 1,
0.2855463, -0.2666213, 2.429353, 1, 1, 1, 1, 1,
0.288088, 0.3604403, 0.9433058, 1, 1, 1, 1, 1,
0.2932476, 2.080794, -0.3424031, 1, 1, 1, 1, 1,
0.2937418, -0.5608156, 2.237035, 1, 1, 1, 1, 1,
0.2949302, -0.750447, 1.848845, 0, 0, 1, 1, 1,
0.2954689, -0.4138251, 1.841863, 1, 0, 0, 1, 1,
0.3020438, 0.5654728, 1.084533, 1, 0, 0, 1, 1,
0.3036047, 0.6913465, 0.1657087, 1, 0, 0, 1, 1,
0.305437, -0.3934653, 4.513992, 1, 0, 0, 1, 1,
0.3119235, -0.5866423, 3.6728, 1, 0, 0, 1, 1,
0.312415, 1.290117, -0.4742568, 0, 0, 0, 1, 1,
0.3128011, -0.8440591, 2.846534, 0, 0, 0, 1, 1,
0.312843, -0.04279494, 3.27204, 0, 0, 0, 1, 1,
0.3135382, 1.317303, 1.049999, 0, 0, 0, 1, 1,
0.3143081, -0.06452182, 0.06182806, 0, 0, 0, 1, 1,
0.3163899, -0.0006153015, 2.412371, 0, 0, 0, 1, 1,
0.3193389, -1.317977, 3.566999, 0, 0, 0, 1, 1,
0.3231846, -0.6252009, 2.884912, 1, 1, 1, 1, 1,
0.3264672, 0.2631484, 1.779726, 1, 1, 1, 1, 1,
0.3305244, -2.468777, 3.347296, 1, 1, 1, 1, 1,
0.3385038, -1.275833, 1.807383, 1, 1, 1, 1, 1,
0.339694, 0.4942972, 0.785882, 1, 1, 1, 1, 1,
0.340651, -0.653765, 3.54768, 1, 1, 1, 1, 1,
0.3418351, 0.3582664, 0.3053769, 1, 1, 1, 1, 1,
0.3457605, 0.6281543, -0.08451962, 1, 1, 1, 1, 1,
0.3473802, -0.07817708, 0.3639174, 1, 1, 1, 1, 1,
0.3493918, 0.8401378, 1.272455, 1, 1, 1, 1, 1,
0.3522198, 0.4322602, 0.6850946, 1, 1, 1, 1, 1,
0.3545624, -0.8030174, 3.639844, 1, 1, 1, 1, 1,
0.3552658, -0.6775934, 1.398835, 1, 1, 1, 1, 1,
0.3566926, -0.5117828, 2.688407, 1, 1, 1, 1, 1,
0.3716605, -1.02262, 2.644691, 1, 1, 1, 1, 1,
0.3775651, -0.2768846, 3.000679, 0, 0, 1, 1, 1,
0.3787545, -0.0472623, 1.784159, 1, 0, 0, 1, 1,
0.3825824, 0.1612176, 1.427969, 1, 0, 0, 1, 1,
0.3842619, 0.1819942, 0.5945846, 1, 0, 0, 1, 1,
0.3884274, -0.4879964, 2.926494, 1, 0, 0, 1, 1,
0.3924438, -0.6528637, 3.011063, 1, 0, 0, 1, 1,
0.39299, -0.2126318, 3.186784, 0, 0, 0, 1, 1,
0.4046829, 0.314596, 0.7525467, 0, 0, 0, 1, 1,
0.4074162, -0.7738876, 3.335694, 0, 0, 0, 1, 1,
0.4076501, 0.8321023, 0.09133586, 0, 0, 0, 1, 1,
0.4090326, 0.4962513, 1.076602, 0, 0, 0, 1, 1,
0.4093139, 0.1922699, 1.66351, 0, 0, 0, 1, 1,
0.4127271, -0.5387428, 2.914808, 0, 0, 0, 1, 1,
0.412792, 0.237435, 0.7326606, 1, 1, 1, 1, 1,
0.4130718, 0.5559883, 1.002494, 1, 1, 1, 1, 1,
0.4132635, 2.266578, 0.2400234, 1, 1, 1, 1, 1,
0.4193696, 0.0673044, 2.45716, 1, 1, 1, 1, 1,
0.4197315, 1.140402, -0.6607377, 1, 1, 1, 1, 1,
0.4199783, 1.368734, -1.053714, 1, 1, 1, 1, 1,
0.420309, 2.43024, 0.5842659, 1, 1, 1, 1, 1,
0.4215256, 0.2700317, -0.4527815, 1, 1, 1, 1, 1,
0.4227231, -1.227975, 1.915837, 1, 1, 1, 1, 1,
0.4238143, 0.3825711, 0.1796432, 1, 1, 1, 1, 1,
0.4262276, 0.1436807, -1.060235, 1, 1, 1, 1, 1,
0.426927, -0.6539809, 3.370681, 1, 1, 1, 1, 1,
0.4269902, 0.2645125, 1.345074, 1, 1, 1, 1, 1,
0.4277562, -1.17786, 3.094814, 1, 1, 1, 1, 1,
0.4277911, 0.1567661, 1.826105, 1, 1, 1, 1, 1,
0.4299316, 0.1359453, 1.080142, 0, 0, 1, 1, 1,
0.4413166, 1.569324, -1.568264, 1, 0, 0, 1, 1,
0.4518009, -0.5826022, 0.4920546, 1, 0, 0, 1, 1,
0.4532424, 0.4592269, 1.336301, 1, 0, 0, 1, 1,
0.460798, 1.398229, 0.5989226, 1, 0, 0, 1, 1,
0.4642997, -0.0943129, 0.02938782, 1, 0, 0, 1, 1,
0.4645491, 0.07382383, 0.4354181, 0, 0, 0, 1, 1,
0.4652187, 0.4753254, 1.342396, 0, 0, 0, 1, 1,
0.4658339, -0.3774489, -0.7305384, 0, 0, 0, 1, 1,
0.4671508, -1.147045, 2.12968, 0, 0, 0, 1, 1,
0.4736153, 0.07404466, 2.473948, 0, 0, 0, 1, 1,
0.4761306, -0.3939196, 2.220661, 0, 0, 0, 1, 1,
0.477475, 0.3404811, -0.7862306, 0, 0, 0, 1, 1,
0.4823187, 1.555245, -0.3455158, 1, 1, 1, 1, 1,
0.4829319, 0.1973931, 1.33594, 1, 1, 1, 1, 1,
0.4834334, 0.003314049, 2.461787, 1, 1, 1, 1, 1,
0.4849546, 0.4332097, 0.7297117, 1, 1, 1, 1, 1,
0.4865653, -0.4318775, 1.569541, 1, 1, 1, 1, 1,
0.4890518, 0.7319569, 0.4173576, 1, 1, 1, 1, 1,
0.490026, 1.446859, 0.737073, 1, 1, 1, 1, 1,
0.4920793, 2.01386, -1.748845, 1, 1, 1, 1, 1,
0.4926379, 0.4679036, -0.03135294, 1, 1, 1, 1, 1,
0.4945538, 0.4582161, 2.465555, 1, 1, 1, 1, 1,
0.4975193, -0.3129438, 2.886968, 1, 1, 1, 1, 1,
0.4985945, -1.15153, 4.464801, 1, 1, 1, 1, 1,
0.500553, 0.4174018, 0.5997518, 1, 1, 1, 1, 1,
0.5056571, 0.645759, 0.2959472, 1, 1, 1, 1, 1,
0.5088039, 0.1762379, -0.1342096, 1, 1, 1, 1, 1,
0.5129312, -0.5523754, 3.484407, 0, 0, 1, 1, 1,
0.5139165, 0.04430481, -0.02603301, 1, 0, 0, 1, 1,
0.5155007, -0.1062152, 0.6423211, 1, 0, 0, 1, 1,
0.5174275, -1.55064, 3.832349, 1, 0, 0, 1, 1,
0.5189062, 0.0311633, 1.649823, 1, 0, 0, 1, 1,
0.5245399, 1.319941, -0.9692096, 1, 0, 0, 1, 1,
0.5254214, -0.4601158, 2.20605, 0, 0, 0, 1, 1,
0.5260214, -0.02485037, 2.568842, 0, 0, 0, 1, 1,
0.5278839, 0.2022869, 2.516883, 0, 0, 0, 1, 1,
0.5307876, -0.2122274, 1.103851, 0, 0, 0, 1, 1,
0.5343913, -1.371874, 2.499729, 0, 0, 0, 1, 1,
0.5348092, -0.7414982, 3.132622, 0, 0, 0, 1, 1,
0.5362345, 2.126978, -0.6828231, 0, 0, 0, 1, 1,
0.537259, 0.1128167, 0.1129504, 1, 1, 1, 1, 1,
0.5372972, 0.5576611, 0.2666669, 1, 1, 1, 1, 1,
0.5400663, 0.9299845, 0.2625232, 1, 1, 1, 1, 1,
0.5419272, 0.4557673, 1.801676, 1, 1, 1, 1, 1,
0.5442768, -1.255862, 2.562056, 1, 1, 1, 1, 1,
0.5475503, -0.4884721, 0.5103553, 1, 1, 1, 1, 1,
0.5500249, -0.2646497, 0.6406748, 1, 1, 1, 1, 1,
0.554549, 0.5003125, 2.219224, 1, 1, 1, 1, 1,
0.560636, -0.6852904, 0.09047171, 1, 1, 1, 1, 1,
0.5647795, -0.6765788, 2.40426, 1, 1, 1, 1, 1,
0.5658055, 0.7869979, 0.3592034, 1, 1, 1, 1, 1,
0.5659341, 0.3035743, 1.996414, 1, 1, 1, 1, 1,
0.5661823, -0.3905588, 3.252039, 1, 1, 1, 1, 1,
0.5690919, -0.3526986, 0.978699, 1, 1, 1, 1, 1,
0.570585, -0.4846573, 1.584491, 1, 1, 1, 1, 1,
0.5727216, 0.199885, 3.277872, 0, 0, 1, 1, 1,
0.5732561, 0.04268197, 0.8694327, 1, 0, 0, 1, 1,
0.5873486, 2.301641, 0.08194487, 1, 0, 0, 1, 1,
0.5879725, -0.7053129, 1.967862, 1, 0, 0, 1, 1,
0.5913365, 0.5187652, 1.301921, 1, 0, 0, 1, 1,
0.5968909, 0.1410535, -0.7631958, 1, 0, 0, 1, 1,
0.6010451, -1.137425, 1.259513, 0, 0, 0, 1, 1,
0.6026697, 0.8800791, 0.03333644, 0, 0, 0, 1, 1,
0.6102481, -0.4647849, 0.4216541, 0, 0, 0, 1, 1,
0.6113889, -0.1692138, 1.004525, 0, 0, 0, 1, 1,
0.6227837, 0.2444623, 2.959376, 0, 0, 0, 1, 1,
0.624455, 0.06052187, 0.2915988, 0, 0, 0, 1, 1,
0.6312988, 0.6704001, 0.7258856, 0, 0, 0, 1, 1,
0.6402902, 0.3309114, 1.081074, 1, 1, 1, 1, 1,
0.6403497, 1.197809, 0.09086975, 1, 1, 1, 1, 1,
0.6424647, 1.584474, 2.270672, 1, 1, 1, 1, 1,
0.6452287, -0.1507189, 1.924353, 1, 1, 1, 1, 1,
0.645834, -0.03025094, 0.2096718, 1, 1, 1, 1, 1,
0.6463258, 0.0857759, -0.5480472, 1, 1, 1, 1, 1,
0.6477519, 1.114955, 1.494649, 1, 1, 1, 1, 1,
0.6499822, -3.323339, 3.133553, 1, 1, 1, 1, 1,
0.6509526, -0.09099266, 1.351985, 1, 1, 1, 1, 1,
0.6539774, 0.03521691, 1.718316, 1, 1, 1, 1, 1,
0.65948, 0.1896257, 1.207562, 1, 1, 1, 1, 1,
0.6648615, 1.347565, 0.8999524, 1, 1, 1, 1, 1,
0.6648872, 0.07113883, 1.8207, 1, 1, 1, 1, 1,
0.665415, -0.976943, 0.6587093, 1, 1, 1, 1, 1,
0.6660299, -0.8344262, 2.315539, 1, 1, 1, 1, 1,
0.6677898, 1.198176, -1.319195, 0, 0, 1, 1, 1,
0.6699086, 0.5748255, 1.036595, 1, 0, 0, 1, 1,
0.6711504, -1.006401, 2.621175, 1, 0, 0, 1, 1,
0.6713592, 0.8232207, 0.6143491, 1, 0, 0, 1, 1,
0.6724012, -0.1635716, 3.827398, 1, 0, 0, 1, 1,
0.6735244, 0.3976231, -0.1236788, 1, 0, 0, 1, 1,
0.6744187, -1.039748, 3.811427, 0, 0, 0, 1, 1,
0.6813855, -0.9670188, 1.384443, 0, 0, 0, 1, 1,
0.6862214, 1.088085, 0.9851715, 0, 0, 0, 1, 1,
0.6874428, 0.9094123, 1.25961, 0, 0, 0, 1, 1,
0.6881788, -0.8724462, -0.2459583, 0, 0, 0, 1, 1,
0.6927738, -0.1282349, 1.956543, 0, 0, 0, 1, 1,
0.6942697, -0.3374866, 3.628681, 0, 0, 0, 1, 1,
0.6982628, -1.139388, 2.255321, 1, 1, 1, 1, 1,
0.7043886, -1.056111, 2.600646, 1, 1, 1, 1, 1,
0.7231659, 0.3301266, 0.06210539, 1, 1, 1, 1, 1,
0.7237298, -2.190266, 2.680295, 1, 1, 1, 1, 1,
0.7270646, 0.2621697, 2.157621, 1, 1, 1, 1, 1,
0.7282395, 1.387402, 0.9030487, 1, 1, 1, 1, 1,
0.7343768, -0.9860989, 2.938321, 1, 1, 1, 1, 1,
0.7346756, 0.9830165, 0.4458546, 1, 1, 1, 1, 1,
0.742493, 2.440946, -0.3305573, 1, 1, 1, 1, 1,
0.7467778, 0.9814341, 0.2602129, 1, 1, 1, 1, 1,
0.7499836, -0.5209853, 0.04465173, 1, 1, 1, 1, 1,
0.7537788, -0.9685494, 1.330103, 1, 1, 1, 1, 1,
0.7575665, 1.009714, 0.7104902, 1, 1, 1, 1, 1,
0.7711321, -0.2522491, 0.7613071, 1, 1, 1, 1, 1,
0.7741933, 0.1328386, 1.812137, 1, 1, 1, 1, 1,
0.7848963, 0.200581, 1.899765, 0, 0, 1, 1, 1,
0.7852294, 0.990014, 1.573926, 1, 0, 0, 1, 1,
0.7867401, 0.2691107, 0.6950075, 1, 0, 0, 1, 1,
0.7944998, 0.782644, 1.982155, 1, 0, 0, 1, 1,
0.7985957, -0.3993489, 1.456352, 1, 0, 0, 1, 1,
0.8006301, 0.4701911, 1.529107, 1, 0, 0, 1, 1,
0.8046064, 0.4059673, 1.825686, 0, 0, 0, 1, 1,
0.8050594, -0.06108575, 0.6108417, 0, 0, 0, 1, 1,
0.8081964, -0.9620255, 3.060722, 0, 0, 0, 1, 1,
0.8109761, -0.669834, 2.876097, 0, 0, 0, 1, 1,
0.8151874, 0.543252, 2.606707, 0, 0, 0, 1, 1,
0.8166119, 0.9975629, 1.864218, 0, 0, 0, 1, 1,
0.8170018, 0.6322819, 0.6315421, 0, 0, 0, 1, 1,
0.8187503, 1.299608, -0.1607813, 1, 1, 1, 1, 1,
0.8212771, -0.7089099, 1.976938, 1, 1, 1, 1, 1,
0.8225788, -2.0424, 3.662997, 1, 1, 1, 1, 1,
0.8246844, 0.2941636, 2.322011, 1, 1, 1, 1, 1,
0.8250456, 0.9682795, 0.8927505, 1, 1, 1, 1, 1,
0.8261181, 0.6408596, 1.497473, 1, 1, 1, 1, 1,
0.8267882, 0.4948836, 1.224843, 1, 1, 1, 1, 1,
0.8285469, -0.4051763, 0.7811652, 1, 1, 1, 1, 1,
0.8443425, -1.595875, 1.801582, 1, 1, 1, 1, 1,
0.8464915, -1.56001, 2.836266, 1, 1, 1, 1, 1,
0.8510894, -0.270662, 1.840366, 1, 1, 1, 1, 1,
0.8550568, 0.8659496, 1.264089, 1, 1, 1, 1, 1,
0.8591191, -1.207796, 0.2972025, 1, 1, 1, 1, 1,
0.8596235, 1.021811, 0.9060827, 1, 1, 1, 1, 1,
0.8649017, -0.2198874, 1.821364, 1, 1, 1, 1, 1,
0.8815482, -0.7085119, 1.978384, 0, 0, 1, 1, 1,
0.8834862, 0.2741314, 2.082615, 1, 0, 0, 1, 1,
0.8851876, -1.088136, 3.69687, 1, 0, 0, 1, 1,
0.8870082, -1.518945, 3.212296, 1, 0, 0, 1, 1,
0.891143, 0.1905777, 2.455559, 1, 0, 0, 1, 1,
0.8936832, -0.4967319, 3.148149, 1, 0, 0, 1, 1,
0.8952116, 0.5804573, 1.356718, 0, 0, 0, 1, 1,
0.8959355, 0.007685632, 3.426805, 0, 0, 0, 1, 1,
0.8981354, -1.339001, 2.81757, 0, 0, 0, 1, 1,
0.9041154, 0.4033271, 1.083159, 0, 0, 0, 1, 1,
0.9060823, 1.288075, 0.660549, 0, 0, 0, 1, 1,
0.9102861, 0.433804, -0.4496316, 0, 0, 0, 1, 1,
0.9112925, 1.637483, 1.4275, 0, 0, 0, 1, 1,
0.9233591, -0.2351801, 2.714264, 1, 1, 1, 1, 1,
0.9245015, 0.6116478, 2.885218, 1, 1, 1, 1, 1,
0.9288964, -0.2812551, 2.948664, 1, 1, 1, 1, 1,
0.9303929, 0.8349921, -0.3984203, 1, 1, 1, 1, 1,
0.9371951, -0.2723328, 0.326316, 1, 1, 1, 1, 1,
0.9389004, 1.248719, 0.2040751, 1, 1, 1, 1, 1,
0.940708, -0.2456388, 2.401016, 1, 1, 1, 1, 1,
0.9429696, 0.9291151, 0.8618401, 1, 1, 1, 1, 1,
0.9443117, -0.7045387, 1.540638, 1, 1, 1, 1, 1,
0.9468545, 0.8018964, 1.930364, 1, 1, 1, 1, 1,
0.95584, 0.3501204, 1.461949, 1, 1, 1, 1, 1,
0.9608039, -0.7704153, 2.375637, 1, 1, 1, 1, 1,
0.9609268, -0.1908381, 0.0004555447, 1, 1, 1, 1, 1,
0.9668391, -0.298821, 3.272262, 1, 1, 1, 1, 1,
0.9730731, -1.108587, 2.903502, 1, 1, 1, 1, 1,
0.9773183, -0.04054402, 2.092188, 0, 0, 1, 1, 1,
0.982879, -3.090338, 3.885486, 1, 0, 0, 1, 1,
0.98429, -0.2724527, 2.640212, 1, 0, 0, 1, 1,
0.9860638, 0.2123685, 1.388363, 1, 0, 0, 1, 1,
0.9896519, 0.3645808, 1.004089, 1, 0, 0, 1, 1,
0.9934223, -0.2951493, 1.938748, 1, 0, 0, 1, 1,
0.9976779, 0.7636493, 1.030772, 0, 0, 0, 1, 1,
1.001423, -0.707453, 1.860459, 0, 0, 0, 1, 1,
1.010909, 0.7205364, 1.89022, 0, 0, 0, 1, 1,
1.016619, 2.367123, -1.460733, 0, 0, 0, 1, 1,
1.016973, -0.9502807, 1.119864, 0, 0, 0, 1, 1,
1.026739, 1.429414, 2.922438, 0, 0, 0, 1, 1,
1.028808, -1.063512, 1.755933, 0, 0, 0, 1, 1,
1.035351, -0.48267, 2.021553, 1, 1, 1, 1, 1,
1.043666, -0.3938875, 1.04222, 1, 1, 1, 1, 1,
1.047548, 0.4667917, 0.1560546, 1, 1, 1, 1, 1,
1.04839, 0.1364996, 1.75293, 1, 1, 1, 1, 1,
1.049876, -0.5207286, 2.587419, 1, 1, 1, 1, 1,
1.062431, 0.1756319, 0.7034998, 1, 1, 1, 1, 1,
1.062547, 0.1534176, 1.556755, 1, 1, 1, 1, 1,
1.06694, -1.10948, 1.156237, 1, 1, 1, 1, 1,
1.080159, -0.5916871, -0.1351431, 1, 1, 1, 1, 1,
1.085911, -1.572003, 1.910109, 1, 1, 1, 1, 1,
1.089613, -0.8881557, 2.427342, 1, 1, 1, 1, 1,
1.093131, 0.3273209, 1.928988, 1, 1, 1, 1, 1,
1.093345, -0.9293447, 2.014126, 1, 1, 1, 1, 1,
1.101232, -1.355068, 2.641487, 1, 1, 1, 1, 1,
1.108521, -1.240055, 2.761231, 1, 1, 1, 1, 1,
1.115227, 0.2448724, 1.214159, 0, 0, 1, 1, 1,
1.116531, -0.9829025, 2.83917, 1, 0, 0, 1, 1,
1.123008, 1.308921, 0.5625168, 1, 0, 0, 1, 1,
1.126683, -0.4342992, 2.907609, 1, 0, 0, 1, 1,
1.12856, 0.2355376, 3.563518, 1, 0, 0, 1, 1,
1.129566, 0.483489, 3.225558, 1, 0, 0, 1, 1,
1.132032, -0.3289368, 1.280113, 0, 0, 0, 1, 1,
1.136827, 0.871006, 0.6452091, 0, 0, 0, 1, 1,
1.140216, 1.535845, 2.277669, 0, 0, 0, 1, 1,
1.140699, 1.559263, 0.12553, 0, 0, 0, 1, 1,
1.148962, -0.519648, 1.393645, 0, 0, 0, 1, 1,
1.152161, 0.7431118, -0.04343391, 0, 0, 0, 1, 1,
1.153267, -0.5381393, 2.395022, 0, 0, 0, 1, 1,
1.176356, -0.7863528, 1.184445, 1, 1, 1, 1, 1,
1.180076, 0.1140901, 1.776335, 1, 1, 1, 1, 1,
1.180289, -0.4274421, 2.14933, 1, 1, 1, 1, 1,
1.193403, 1.64095, -0.4369306, 1, 1, 1, 1, 1,
1.194743, -0.308818, -0.1653418, 1, 1, 1, 1, 1,
1.202647, -0.416074, 2.645793, 1, 1, 1, 1, 1,
1.204691, 2.010685, -0.1353772, 1, 1, 1, 1, 1,
1.205443, -0.295985, 2.631713, 1, 1, 1, 1, 1,
1.207563, 1.221094, 0.03092264, 1, 1, 1, 1, 1,
1.219818, -0.6159835, 2.412202, 1, 1, 1, 1, 1,
1.2255, -0.493398, 2.558873, 1, 1, 1, 1, 1,
1.225905, 0.1334076, 0.1220492, 1, 1, 1, 1, 1,
1.228819, -0.2755983, 2.261093, 1, 1, 1, 1, 1,
1.232273, -0.3467214, 1.989453, 1, 1, 1, 1, 1,
1.23874, -0.5073875, 3.382015, 1, 1, 1, 1, 1,
1.24362, -0.002698679, 0.5242037, 0, 0, 1, 1, 1,
1.244321, 0.0234935, 1.15913, 1, 0, 0, 1, 1,
1.24762, -1.691356, 2.903513, 1, 0, 0, 1, 1,
1.251716, -1.268169, 3.158105, 1, 0, 0, 1, 1,
1.253473, -0.1450904, 1.106333, 1, 0, 0, 1, 1,
1.253615, -0.1556552, 1.057497, 1, 0, 0, 1, 1,
1.268855, 0.08621792, 1.633515, 0, 0, 0, 1, 1,
1.272066, -0.8701114, 3.738218, 0, 0, 0, 1, 1,
1.282697, 0.501112, 2.376216, 0, 0, 0, 1, 1,
1.289099, 1.590787, -0.8752585, 0, 0, 0, 1, 1,
1.300274, -0.5310152, 1.519667, 0, 0, 0, 1, 1,
1.306499, 1.417198, 0.414417, 0, 0, 0, 1, 1,
1.30843, 1.438927, 0.8637599, 0, 0, 0, 1, 1,
1.308967, 0.05123506, 1.356418, 1, 1, 1, 1, 1,
1.310099, 0.63618, 1.046103, 1, 1, 1, 1, 1,
1.318826, 0.479358, 3.314516, 1, 1, 1, 1, 1,
1.327124, -0.3847404, 0.2205173, 1, 1, 1, 1, 1,
1.335146, -1.005379, 3.136165, 1, 1, 1, 1, 1,
1.350711, -0.6018988, 1.937876, 1, 1, 1, 1, 1,
1.354288, -1.051306, 2.804797, 1, 1, 1, 1, 1,
1.356259, -0.1454124, 1.509589, 1, 1, 1, 1, 1,
1.363664, -1.439971, 2.414951, 1, 1, 1, 1, 1,
1.369967, -1.175452, 2.469861, 1, 1, 1, 1, 1,
1.385489, -1.265497, 3.228482, 1, 1, 1, 1, 1,
1.392168, -0.9593244, 3.217303, 1, 1, 1, 1, 1,
1.393315, -0.3564893, 1.450979, 1, 1, 1, 1, 1,
1.396417, -0.8440115, 0.355662, 1, 1, 1, 1, 1,
1.402773, -0.0757827, -1.4656, 1, 1, 1, 1, 1,
1.407687, -0.15079, 3.648337, 0, 0, 1, 1, 1,
1.412695, -0.7343734, 2.585622, 1, 0, 0, 1, 1,
1.423402, 0.5819716, 0.422769, 1, 0, 0, 1, 1,
1.430528, 0.3008235, 1.203302, 1, 0, 0, 1, 1,
1.438684, -1.538729, 2.318659, 1, 0, 0, 1, 1,
1.446621, 0.8469992, 0.5988534, 1, 0, 0, 1, 1,
1.446946, -0.1130006, 2.203096, 0, 0, 0, 1, 1,
1.449448, -0.1166193, 0.7750259, 0, 0, 0, 1, 1,
1.455474, 0.5986161, 2.358317, 0, 0, 0, 1, 1,
1.462266, 1.351706, 0.3529385, 0, 0, 0, 1, 1,
1.471764, 1.140873, 1.541003, 0, 0, 0, 1, 1,
1.478568, 0.9186085, 2.399081, 0, 0, 0, 1, 1,
1.495029, -1.467608, 2.453606, 0, 0, 0, 1, 1,
1.499679, 1.131145, 0.2004719, 1, 1, 1, 1, 1,
1.503739, -1.367432, -0.2915897, 1, 1, 1, 1, 1,
1.520443, 1.032812, -0.1144175, 1, 1, 1, 1, 1,
1.522891, 0.26834, 1.249258, 1, 1, 1, 1, 1,
1.52824, 0.6246471, 2.589421, 1, 1, 1, 1, 1,
1.530122, -1.283968, 2.398466, 1, 1, 1, 1, 1,
1.531622, -0.575815, 0.8018345, 1, 1, 1, 1, 1,
1.538589, 0.4603868, 0.4245782, 1, 1, 1, 1, 1,
1.54222, -0.6314539, -0.1995539, 1, 1, 1, 1, 1,
1.58251, -1.490684, 1.643257, 1, 1, 1, 1, 1,
1.588213, 1.082765, -0.2372649, 1, 1, 1, 1, 1,
1.589876, 0.7203308, 1.669228, 1, 1, 1, 1, 1,
1.594374, 0.6732805, 1.591224, 1, 1, 1, 1, 1,
1.6023, 0.1477135, -1.016065, 1, 1, 1, 1, 1,
1.610718, 0.2030464, -0.03939658, 1, 1, 1, 1, 1,
1.615363, 0.2092972, 0.8159814, 0, 0, 1, 1, 1,
1.630722, -0.8310788, 1.518407, 1, 0, 0, 1, 1,
1.67065, 1.223757, 2.857801, 1, 0, 0, 1, 1,
1.677938, 0.4216068, -0.7069961, 1, 0, 0, 1, 1,
1.689625, 0.07679743, 2.827647, 1, 0, 0, 1, 1,
1.691495, 1.589627, 0.3401466, 1, 0, 0, 1, 1,
1.695529, -0.4387029, 0.7026139, 0, 0, 0, 1, 1,
1.700328, -0.7488112, 2.694931, 0, 0, 0, 1, 1,
1.725964, -0.4465474, 2.078339, 0, 0, 0, 1, 1,
1.726893, 0.8995666, 2.177951, 0, 0, 0, 1, 1,
1.730015, 0.2662227, 1.502108, 0, 0, 0, 1, 1,
1.738904, -1.094484, 4.129792, 0, 0, 0, 1, 1,
1.769598, 0.2572526, 1.724829, 0, 0, 0, 1, 1,
1.770569, -0.2813234, 2.91514, 1, 1, 1, 1, 1,
1.773267, -0.192849, 1.821322, 1, 1, 1, 1, 1,
1.800381, -0.4573043, 2.059303, 1, 1, 1, 1, 1,
1.807033, 1.655484, -0.09274129, 1, 1, 1, 1, 1,
1.823137, 1.008354, 1.408538, 1, 1, 1, 1, 1,
1.839141, 0.6103836, 0.8079753, 1, 1, 1, 1, 1,
1.842275, 0.8443184, 1.323914, 1, 1, 1, 1, 1,
1.853894, -1.316812, 1.47103, 1, 1, 1, 1, 1,
1.88457, 0.5282044, 2.134882, 1, 1, 1, 1, 1,
1.8925, -0.3078506, 3.488005, 1, 1, 1, 1, 1,
1.895082, 0.3452125, 0.2604082, 1, 1, 1, 1, 1,
1.899415, -0.3411396, 1.208628, 1, 1, 1, 1, 1,
1.920718, 0.1879405, 1.968041, 1, 1, 1, 1, 1,
1.961323, -1.951182, 1.175383, 1, 1, 1, 1, 1,
1.961436, 0.0916184, 1.473742, 1, 1, 1, 1, 1,
1.969232, 0.2040522, 0.396086, 0, 0, 1, 1, 1,
2.012889, -1.211932, 1.095281, 1, 0, 0, 1, 1,
2.016655, 0.08453312, 2.42474, 1, 0, 0, 1, 1,
2.023995, -0.01631562, 1.703763, 1, 0, 0, 1, 1,
2.026068, 0.7195818, 1.078813, 1, 0, 0, 1, 1,
2.058478, 1.110066, 2.187497, 1, 0, 0, 1, 1,
2.087523, 0.2315019, 1.769727, 0, 0, 0, 1, 1,
2.126888, -2.012717, 3.812538, 0, 0, 0, 1, 1,
2.216665, -1.454832, 0.8479323, 0, 0, 0, 1, 1,
2.228485, 0.9229051, 2.54073, 0, 0, 0, 1, 1,
2.280736, -0.7321874, 1.359547, 0, 0, 0, 1, 1,
2.299185, -0.5281446, 1.406358, 0, 0, 0, 1, 1,
2.431535, 0.6710892, 0.5419215, 0, 0, 0, 1, 1,
2.543267, -1.612029, 0.2083749, 1, 1, 1, 1, 1,
2.543571, -0.5243389, 1.04476, 1, 1, 1, 1, 1,
2.546211, 1.005309, 0.7562014, 1, 1, 1, 1, 1,
2.558954, -0.8678809, 1.358523, 1, 1, 1, 1, 1,
2.650932, 0.6371853, -0.5234147, 1, 1, 1, 1, 1,
2.667731, -0.7207453, 2.707128, 1, 1, 1, 1, 1,
2.91146, -1.25854, 1.68605, 1, 1, 1, 1, 1
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
var radius = 9.769873;
var distance = 34.31627;
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
mvMatrix.translate( 0.1412634, 0.06882262, -0.2884302 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.31627);
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