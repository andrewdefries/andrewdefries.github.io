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
-3.608472, -0.06955238, -2.379251, 1, 0, 0, 1,
-3.110381, -0.457876, -2.576382, 1, 0.007843138, 0, 1,
-2.711712, 1.352112, -1.836171, 1, 0.01176471, 0, 1,
-2.593968, 1.555687, -1.188275, 1, 0.01960784, 0, 1,
-2.389722, -0.8735923, -1.79173, 1, 0.02352941, 0, 1,
-2.337017, -0.9886688, -1.938859, 1, 0.03137255, 0, 1,
-2.314245, 0.5453268, -2.314218, 1, 0.03529412, 0, 1,
-2.300697, 1.224964, -1.545282, 1, 0.04313726, 0, 1,
-2.30029, -0.4433192, -3.535142, 1, 0.04705882, 0, 1,
-2.288897, 0.6204231, -1.187875, 1, 0.05490196, 0, 1,
-2.276364, 0.5950169, 0.4763229, 1, 0.05882353, 0, 1,
-2.237094, 1.294107, -0.2454699, 1, 0.06666667, 0, 1,
-2.220965, 0.5006684, -2.21981, 1, 0.07058824, 0, 1,
-2.216865, -0.2256749, -0.8607776, 1, 0.07843138, 0, 1,
-2.109424, 0.2772594, -2.422782, 1, 0.08235294, 0, 1,
-2.091138, 2.316153, -0.7567553, 1, 0.09019608, 0, 1,
-2.043381, -0.4717855, -2.428138, 1, 0.09411765, 0, 1,
-2.02416, -0.3510993, -2.838497, 1, 0.1019608, 0, 1,
-2.022082, -0.2746373, -2.307932, 1, 0.1098039, 0, 1,
-2.003842, 2.291908, 0.9720713, 1, 0.1137255, 0, 1,
-1.995132, -0.3765405, -0.7666374, 1, 0.1215686, 0, 1,
-1.988288, -0.7840531, -0.7711396, 1, 0.1254902, 0, 1,
-1.930992, 0.3167219, -1.301194, 1, 0.1333333, 0, 1,
-1.906372, -0.02324971, -3.073764, 1, 0.1372549, 0, 1,
-1.888495, 0.0748889, -0.6014627, 1, 0.145098, 0, 1,
-1.857856, -0.952776, -2.265383, 1, 0.1490196, 0, 1,
-1.846763, -0.7438073, -0.7104074, 1, 0.1568628, 0, 1,
-1.832101, 1.952804, 0.03652883, 1, 0.1607843, 0, 1,
-1.8014, -1.527911, -1.245311, 1, 0.1686275, 0, 1,
-1.792592, 1.3889, 0.563942, 1, 0.172549, 0, 1,
-1.785101, 1.545491, -1.342399, 1, 0.1803922, 0, 1,
-1.779366, -1.564621, -1.390644, 1, 0.1843137, 0, 1,
-1.772981, -0.6121138, -0.1565601, 1, 0.1921569, 0, 1,
-1.772635, 0.008129793, -1.300486, 1, 0.1960784, 0, 1,
-1.75922, 0.2919005, -1.697151, 1, 0.2039216, 0, 1,
-1.742334, -1.163417, -1.337238, 1, 0.2117647, 0, 1,
-1.729341, 1.001303, -0.1202753, 1, 0.2156863, 0, 1,
-1.719874, 0.7119165, -1.01207, 1, 0.2235294, 0, 1,
-1.698966, 0.7201487, -2.115268, 1, 0.227451, 0, 1,
-1.68286, 1.761995, -2.809573, 1, 0.2352941, 0, 1,
-1.67564, -0.6910911, -1.06941, 1, 0.2392157, 0, 1,
-1.671127, 1.654751, -0.3201247, 1, 0.2470588, 0, 1,
-1.654507, -0.256248, -1.248001, 1, 0.2509804, 0, 1,
-1.637764, -1.269345, -1.392287, 1, 0.2588235, 0, 1,
-1.63338, -0.5519894, -2.785501, 1, 0.2627451, 0, 1,
-1.600353, -0.3067577, -2.29662, 1, 0.2705882, 0, 1,
-1.595268, -0.7566383, -2.024871, 1, 0.2745098, 0, 1,
-1.590515, 0.2259372, -2.180282, 1, 0.282353, 0, 1,
-1.589546, 1.053936, -2.614881, 1, 0.2862745, 0, 1,
-1.576076, -0.4567888, -2.520708, 1, 0.2941177, 0, 1,
-1.553144, 0.8839253, -1.643887, 1, 0.3019608, 0, 1,
-1.550772, 1.155611, -1.812669, 1, 0.3058824, 0, 1,
-1.54546, 0.1415898, -2.30303, 1, 0.3137255, 0, 1,
-1.530167, -0.9142667, -1.465048, 1, 0.3176471, 0, 1,
-1.511531, -0.3019536, -1.984959, 1, 0.3254902, 0, 1,
-1.504975, 0.1493502, -1.507122, 1, 0.3294118, 0, 1,
-1.500201, -0.9286659, -2.569325, 1, 0.3372549, 0, 1,
-1.498758, -1.719728, -2.409145, 1, 0.3411765, 0, 1,
-1.49095, -0.01087203, -1.316785, 1, 0.3490196, 0, 1,
-1.489372, 1.339004, -0.08114662, 1, 0.3529412, 0, 1,
-1.48813, -1.680037, -2.939388, 1, 0.3607843, 0, 1,
-1.465641, -2.120446, -0.8808909, 1, 0.3647059, 0, 1,
-1.458272, 1.046735, -0.6253206, 1, 0.372549, 0, 1,
-1.445662, 3.352536, -2.467241, 1, 0.3764706, 0, 1,
-1.44255, 0.3908384, -3.161408, 1, 0.3843137, 0, 1,
-1.431503, 0.4382215, -3.296063, 1, 0.3882353, 0, 1,
-1.423309, -0.0749672, -2.387964, 1, 0.3960784, 0, 1,
-1.421954, 0.02455247, -0.7401793, 1, 0.4039216, 0, 1,
-1.42034, 1.02451, -1.670086, 1, 0.4078431, 0, 1,
-1.406766, 0.4087296, -2.028959, 1, 0.4156863, 0, 1,
-1.404605, -0.2070349, -2.763538, 1, 0.4196078, 0, 1,
-1.396799, 1.007652, 1.044479, 1, 0.427451, 0, 1,
-1.396023, 0.412124, -1.046654, 1, 0.4313726, 0, 1,
-1.381458, 0.06818071, -1.91767, 1, 0.4392157, 0, 1,
-1.378811, 0.9120443, -0.8884125, 1, 0.4431373, 0, 1,
-1.368535, -1.634429, -1.959626, 1, 0.4509804, 0, 1,
-1.365462, 0.08439884, -0.5717056, 1, 0.454902, 0, 1,
-1.357329, -1.486909, -2.751012, 1, 0.4627451, 0, 1,
-1.336035, 0.3050943, -2.941351, 1, 0.4666667, 0, 1,
-1.325266, 0.7447013, -1.801408, 1, 0.4745098, 0, 1,
-1.322724, -1.459514, -2.577833, 1, 0.4784314, 0, 1,
-1.316608, -0.7643613, -1.051596, 1, 0.4862745, 0, 1,
-1.313236, 0.6824754, -1.390864, 1, 0.4901961, 0, 1,
-1.308929, -0.745226, -1.814269, 1, 0.4980392, 0, 1,
-1.301438, -0.7418215, -1.508346, 1, 0.5058824, 0, 1,
-1.299512, -0.3418322, -1.537084, 1, 0.509804, 0, 1,
-1.288895, 0.2787122, -2.793399, 1, 0.5176471, 0, 1,
-1.287019, -1.314228, -2.352905, 1, 0.5215687, 0, 1,
-1.28049, 0.1550273, -0.3116148, 1, 0.5294118, 0, 1,
-1.268325, 1.784577, -1.105108, 1, 0.5333334, 0, 1,
-1.268281, 2.886479, -1.309168, 1, 0.5411765, 0, 1,
-1.263484, -0.1617247, -1.865162, 1, 0.5450981, 0, 1,
-1.262337, -0.08411884, -0.3327902, 1, 0.5529412, 0, 1,
-1.260445, -0.5741611, 0.6101623, 1, 0.5568628, 0, 1,
-1.258266, 1.776528, 0.09925794, 1, 0.5647059, 0, 1,
-1.258044, -0.6529809, -3.272366, 1, 0.5686275, 0, 1,
-1.247504, 0.335595, -2.28046, 1, 0.5764706, 0, 1,
-1.245302, 0.4370956, -1.33453, 1, 0.5803922, 0, 1,
-1.241756, 0.5109782, -0.805399, 1, 0.5882353, 0, 1,
-1.236538, -0.5033968, -3.612652, 1, 0.5921569, 0, 1,
-1.231271, 0.7007701, 0.6455341, 1, 0.6, 0, 1,
-1.22945, -1.816262, -2.149748, 1, 0.6078432, 0, 1,
-1.228707, -2.188, -1.475618, 1, 0.6117647, 0, 1,
-1.228342, -0.09360643, -1.127356, 1, 0.6196079, 0, 1,
-1.218426, -0.07853143, -3.919324, 1, 0.6235294, 0, 1,
-1.213685, -2.526858, -4.170409, 1, 0.6313726, 0, 1,
-1.207739, 0.9458627, -1.659827, 1, 0.6352941, 0, 1,
-1.205132, 0.7476354, -0.8097184, 1, 0.6431373, 0, 1,
-1.199044, -0.6891194, -0.7112684, 1, 0.6470588, 0, 1,
-1.191167, -0.4766496, -2.887263, 1, 0.654902, 0, 1,
-1.188726, -0.531342, -3.863918, 1, 0.6588235, 0, 1,
-1.185756, -0.1610845, -3.425468, 1, 0.6666667, 0, 1,
-1.178509, 1.013426, -0.8317891, 1, 0.6705883, 0, 1,
-1.168501, 0.1582237, 0.6788546, 1, 0.6784314, 0, 1,
-1.168405, 0.414762, -1.023929, 1, 0.682353, 0, 1,
-1.164718, 0.6002634, -1.319519, 1, 0.6901961, 0, 1,
-1.160953, -0.1450777, -1.527371, 1, 0.6941177, 0, 1,
-1.158613, 3.081365, 0.1316944, 1, 0.7019608, 0, 1,
-1.156253, -1.864509, -2.422951, 1, 0.7098039, 0, 1,
-1.153784, -0.5510954, -0.8866715, 1, 0.7137255, 0, 1,
-1.147159, -1.196082, -2.875782, 1, 0.7215686, 0, 1,
-1.143245, -0.8686953, -1.007932, 1, 0.7254902, 0, 1,
-1.141304, 0.2396908, -1.381658, 1, 0.7333333, 0, 1,
-1.129404, 1.449626, -1.181183, 1, 0.7372549, 0, 1,
-1.125736, -0.1041391, -0.4577777, 1, 0.7450981, 0, 1,
-1.125603, 0.1028763, -1.417986, 1, 0.7490196, 0, 1,
-1.121178, -0.06633683, -0.3279411, 1, 0.7568628, 0, 1,
-1.113638, -1.100158, -2.620617, 1, 0.7607843, 0, 1,
-1.102015, -0.8636969, -3.031017, 1, 0.7686275, 0, 1,
-1.101677, -0.1409681, -1.042422, 1, 0.772549, 0, 1,
-1.084163, -0.7959027, -2.113388, 1, 0.7803922, 0, 1,
-1.079435, 0.8503563, 0.4464372, 1, 0.7843137, 0, 1,
-1.073611, 0.8278294, -0.5309246, 1, 0.7921569, 0, 1,
-1.065496, 0.1366266, -1.875732, 1, 0.7960784, 0, 1,
-1.057487, -0.5663098, -2.641925, 1, 0.8039216, 0, 1,
-1.056673, -0.7843211, -3.697665, 1, 0.8117647, 0, 1,
-1.055521, 0.3592861, 0.1019824, 1, 0.8156863, 0, 1,
-1.05184, -0.5999238, -2.328357, 1, 0.8235294, 0, 1,
-1.048827, -1.289589, -4.184879, 1, 0.827451, 0, 1,
-1.048653, -1.180457, -2.232642, 1, 0.8352941, 0, 1,
-1.047034, 1.825994, 0.001257545, 1, 0.8392157, 0, 1,
-1.038906, -0.1630439, -1.930957, 1, 0.8470588, 0, 1,
-1.032877, -0.2231997, -2.625005, 1, 0.8509804, 0, 1,
-1.032435, -0.8855318, -1.22031, 1, 0.8588235, 0, 1,
-1.02358, 0.09260468, 2.08074, 1, 0.8627451, 0, 1,
-1.016444, 0.3127271, -1.273585, 1, 0.8705882, 0, 1,
-1.011898, 0.3417396, -1.631515, 1, 0.8745098, 0, 1,
-1.010863, 1.126722, 0.3110246, 1, 0.8823529, 0, 1,
-1.010421, 0.7091293, -0.4328339, 1, 0.8862745, 0, 1,
-1.002556, -0.7950218, -3.691773, 1, 0.8941177, 0, 1,
-1.001992, -0.004137967, -3.5501, 1, 0.8980392, 0, 1,
-1.001622, 2.805894, -0.3353007, 1, 0.9058824, 0, 1,
-1.001134, 0.6634981, -2.380532, 1, 0.9137255, 0, 1,
-0.9991027, 1.51483, -1.397462, 1, 0.9176471, 0, 1,
-0.9943257, 0.7891617, -1.242016, 1, 0.9254902, 0, 1,
-0.9930221, -0.9824541, -3.147079, 1, 0.9294118, 0, 1,
-0.9869677, -0.3260213, 0.2285192, 1, 0.9372549, 0, 1,
-0.9853585, -0.4314829, -2.609572, 1, 0.9411765, 0, 1,
-0.9838147, -0.9136654, -2.139588, 1, 0.9490196, 0, 1,
-0.9798859, 0.02905929, -0.5000296, 1, 0.9529412, 0, 1,
-0.9734976, -0.2707299, -1.281228, 1, 0.9607843, 0, 1,
-0.969891, 1.031875, -1.366216, 1, 0.9647059, 0, 1,
-0.9669669, -0.6076129, -1.309814, 1, 0.972549, 0, 1,
-0.9664317, 0.1228237, 0.023783, 1, 0.9764706, 0, 1,
-0.9654036, -1.236545, -3.095362, 1, 0.9843137, 0, 1,
-0.9629726, -0.5077556, -3.804255, 1, 0.9882353, 0, 1,
-0.9599884, -1.241895, -0.4235227, 1, 0.9960784, 0, 1,
-0.9574412, -0.3605365, -1.571531, 0.9960784, 1, 0, 1,
-0.9571629, -1.183411, -3.769382, 0.9921569, 1, 0, 1,
-0.9554964, 0.7559429, -1.239057, 0.9843137, 1, 0, 1,
-0.9528984, -1.412224, -1.438897, 0.9803922, 1, 0, 1,
-0.94493, 0.5509697, -2.252195, 0.972549, 1, 0, 1,
-0.9424715, 1.228537, -2.386756, 0.9686275, 1, 0, 1,
-0.9410357, 0.6808982, -0.4131459, 0.9607843, 1, 0, 1,
-0.938383, -0.3340404, -2.092821, 0.9568627, 1, 0, 1,
-0.935444, 1.589138, -0.9690578, 0.9490196, 1, 0, 1,
-0.9349211, 0.1676582, -0.2469733, 0.945098, 1, 0, 1,
-0.9330209, 0.6562191, 0.8499856, 0.9372549, 1, 0, 1,
-0.9296705, 0.7254475, 0.5737579, 0.9333333, 1, 0, 1,
-0.9259874, -0.2279667, -1.721345, 0.9254902, 1, 0, 1,
-0.9244248, -0.5457249, -1.670125, 0.9215686, 1, 0, 1,
-0.9234807, 2.372883, 0.09287824, 0.9137255, 1, 0, 1,
-0.9209649, 0.1739418, -1.009721, 0.9098039, 1, 0, 1,
-0.9194358, 0.7322309, 0.07277483, 0.9019608, 1, 0, 1,
-0.9171448, -1.655534, -1.859505, 0.8941177, 1, 0, 1,
-0.9126166, 1.178158, 1.79825, 0.8901961, 1, 0, 1,
-0.9104739, -1.032104, -3.195564, 0.8823529, 1, 0, 1,
-0.9045399, -0.3736692, -3.122729, 0.8784314, 1, 0, 1,
-0.8877981, -0.1278238, -1.93128, 0.8705882, 1, 0, 1,
-0.8840358, 0.9920382, 1.488787, 0.8666667, 1, 0, 1,
-0.882571, -0.467368, -2.051713, 0.8588235, 1, 0, 1,
-0.8796172, -2.348908, -3.329727, 0.854902, 1, 0, 1,
-0.8782451, -2.131861, -1.843718, 0.8470588, 1, 0, 1,
-0.8773642, -0.857042, -1.788591, 0.8431373, 1, 0, 1,
-0.8764395, 0.7892743, -1.297204, 0.8352941, 1, 0, 1,
-0.8741843, 1.352515, 1.501023, 0.8313726, 1, 0, 1,
-0.8707249, -0.2557361, -1.557972, 0.8235294, 1, 0, 1,
-0.870382, 0.4414317, -2.07128, 0.8196079, 1, 0, 1,
-0.8640929, -0.6799442, -1.84721, 0.8117647, 1, 0, 1,
-0.8522437, -1.029374, -1.51852, 0.8078431, 1, 0, 1,
-0.8348743, -0.2738839, -1.73537, 0.8, 1, 0, 1,
-0.833283, -1.320836, -2.571053, 0.7921569, 1, 0, 1,
-0.8319511, -1.941157, -5.481901, 0.7882353, 1, 0, 1,
-0.8311591, -0.5451823, -2.186056, 0.7803922, 1, 0, 1,
-0.825649, -2.067473, -2.861265, 0.7764706, 1, 0, 1,
-0.8256483, -1.061599, -1.851197, 0.7686275, 1, 0, 1,
-0.8232593, -0.08443098, -0.9745289, 0.7647059, 1, 0, 1,
-0.8028934, 0.8479878, 1.674907, 0.7568628, 1, 0, 1,
-0.7955496, 2.417728, -0.8431416, 0.7529412, 1, 0, 1,
-0.7873875, 0.02886569, -2.272534, 0.7450981, 1, 0, 1,
-0.7828673, 0.6586839, -1.484472, 0.7411765, 1, 0, 1,
-0.7779214, 1.006261, -0.8084879, 0.7333333, 1, 0, 1,
-0.7744704, 0.7024502, -1.461742, 0.7294118, 1, 0, 1,
-0.7618548, 0.207625, -1.758228, 0.7215686, 1, 0, 1,
-0.7598717, 0.4344603, 0.3671198, 0.7176471, 1, 0, 1,
-0.7529355, 1.14532, -0.1388234, 0.7098039, 1, 0, 1,
-0.7528145, -0.006840109, -1.493244, 0.7058824, 1, 0, 1,
-0.7470482, -0.3106899, -1.308086, 0.6980392, 1, 0, 1,
-0.7447621, 0.830793, -1.658914, 0.6901961, 1, 0, 1,
-0.7416518, 1.032959, 0.9512249, 0.6862745, 1, 0, 1,
-0.7365416, -0.620105, -3.335576, 0.6784314, 1, 0, 1,
-0.7363946, -0.9325379, -2.101789, 0.6745098, 1, 0, 1,
-0.7311147, -0.3353805, -1.476697, 0.6666667, 1, 0, 1,
-0.7308702, 0.04450513, -0.4213867, 0.6627451, 1, 0, 1,
-0.7290782, 1.27509, -1.462513, 0.654902, 1, 0, 1,
-0.725298, -1.436546, -1.930301, 0.6509804, 1, 0, 1,
-0.7236694, 1.857117, -0.4809747, 0.6431373, 1, 0, 1,
-0.7230615, 0.1223326, -2.719583, 0.6392157, 1, 0, 1,
-0.7153351, 0.9695914, 0.1623662, 0.6313726, 1, 0, 1,
-0.7100773, -0.3935449, -2.066014, 0.627451, 1, 0, 1,
-0.7040477, 0.6722612, -1.86285, 0.6196079, 1, 0, 1,
-0.6978126, 0.8210427, -1.10702, 0.6156863, 1, 0, 1,
-0.6974363, -1.421388, -1.873193, 0.6078432, 1, 0, 1,
-0.6926651, -1.393974, -2.986366, 0.6039216, 1, 0, 1,
-0.6918721, -0.6047525, -0.5488815, 0.5960785, 1, 0, 1,
-0.6833108, -0.01898217, -1.211947, 0.5882353, 1, 0, 1,
-0.6808871, 1.221444, 1.740972, 0.5843138, 1, 0, 1,
-0.6761369, -0.5227902, -2.253144, 0.5764706, 1, 0, 1,
-0.6740888, -0.7056358, -2.673625, 0.572549, 1, 0, 1,
-0.6719687, 1.058954, -0.4481429, 0.5647059, 1, 0, 1,
-0.6713024, -1.147516, -3.48192, 0.5607843, 1, 0, 1,
-0.6630332, 0.2269264, -2.919287, 0.5529412, 1, 0, 1,
-0.6608698, -1.471167, -1.006471, 0.5490196, 1, 0, 1,
-0.6534992, 3.556639, 1.445193, 0.5411765, 1, 0, 1,
-0.6529471, -0.6075813, -2.285759, 0.5372549, 1, 0, 1,
-0.6525761, -0.5863379, -3.597309, 0.5294118, 1, 0, 1,
-0.6467938, 0.006633813, -1.138181, 0.5254902, 1, 0, 1,
-0.6461769, -0.1178986, -2.36008, 0.5176471, 1, 0, 1,
-0.6435223, -1.238867, -2.276425, 0.5137255, 1, 0, 1,
-0.6297473, 0.4689288, 0.2753845, 0.5058824, 1, 0, 1,
-0.6296696, -0.2990989, -2.007582, 0.5019608, 1, 0, 1,
-0.6168411, 0.09509022, -1.510094, 0.4941176, 1, 0, 1,
-0.6143522, 0.3130403, -0.4104451, 0.4862745, 1, 0, 1,
-0.6123174, -0.4437926, -0.09004236, 0.4823529, 1, 0, 1,
-0.6117554, -0.4327026, -1.129285, 0.4745098, 1, 0, 1,
-0.6053199, -1.627908, -3.968893, 0.4705882, 1, 0, 1,
-0.6020751, 0.1176511, 0.081175, 0.4627451, 1, 0, 1,
-0.6004765, 1.259936, 0.2971914, 0.4588235, 1, 0, 1,
-0.5874432, 0.167713, -0.5049904, 0.4509804, 1, 0, 1,
-0.581969, 1.217035, -0.7114676, 0.4470588, 1, 0, 1,
-0.5764486, -0.9503883, -3.793815, 0.4392157, 1, 0, 1,
-0.5733985, -2.002715, -3.476418, 0.4352941, 1, 0, 1,
-0.5710692, -0.3904135, -4.237404, 0.427451, 1, 0, 1,
-0.5648561, -0.8782308, -3.650502, 0.4235294, 1, 0, 1,
-0.5623713, -0.6189661, -2.201969, 0.4156863, 1, 0, 1,
-0.5612618, -0.7787973, -1.967231, 0.4117647, 1, 0, 1,
-0.5589148, 0.8601243, -1.160319, 0.4039216, 1, 0, 1,
-0.5553747, 2.07758, -0.4383999, 0.3960784, 1, 0, 1,
-0.5548542, 0.2054931, -1.952618, 0.3921569, 1, 0, 1,
-0.5505453, 0.7298898, -0.2833921, 0.3843137, 1, 0, 1,
-0.5489689, 0.3769682, -1.902445, 0.3803922, 1, 0, 1,
-0.5455524, 0.8443986, -0.1165123, 0.372549, 1, 0, 1,
-0.5368745, 0.323992, -0.06860927, 0.3686275, 1, 0, 1,
-0.5348009, -3.203913, -2.700688, 0.3607843, 1, 0, 1,
-0.534165, -1.48189, -1.864558, 0.3568628, 1, 0, 1,
-0.5337273, -1.013544, -3.193524, 0.3490196, 1, 0, 1,
-0.5333885, 1.582433, 1.448567, 0.345098, 1, 0, 1,
-0.5312818, -0.5834771, -0.9658873, 0.3372549, 1, 0, 1,
-0.529952, 0.9139009, -0.8121841, 0.3333333, 1, 0, 1,
-0.529298, -0.05168016, -3.582089, 0.3254902, 1, 0, 1,
-0.5289964, 0.5680205, -2.349275, 0.3215686, 1, 0, 1,
-0.5267057, 0.6746639, -0.6472547, 0.3137255, 1, 0, 1,
-0.5227414, -0.2388403, -2.889578, 0.3098039, 1, 0, 1,
-0.5194572, -0.4933549, -2.313446, 0.3019608, 1, 0, 1,
-0.5191592, -0.1068302, -2.455025, 0.2941177, 1, 0, 1,
-0.5190585, -0.1623314, -1.206344, 0.2901961, 1, 0, 1,
-0.5183188, 0.4000347, -1.361126, 0.282353, 1, 0, 1,
-0.5139526, -0.9507738, -2.22535, 0.2784314, 1, 0, 1,
-0.5096646, 0.07642771, -1.556021, 0.2705882, 1, 0, 1,
-0.5067999, -0.4926398, -1.92394, 0.2666667, 1, 0, 1,
-0.504472, -0.7643332, -3.955487, 0.2588235, 1, 0, 1,
-0.5001491, 0.1102221, -0.1900331, 0.254902, 1, 0, 1,
-0.4970497, -1.4019, -1.344906, 0.2470588, 1, 0, 1,
-0.4952549, -0.4746391, -3.416045, 0.2431373, 1, 0, 1,
-0.4935634, -0.1470298, -0.4962038, 0.2352941, 1, 0, 1,
-0.4917562, -0.5288712, -2.655813, 0.2313726, 1, 0, 1,
-0.4899016, -0.4532017, -1.107084, 0.2235294, 1, 0, 1,
-0.4866681, 1.520174, 0.07669462, 0.2196078, 1, 0, 1,
-0.4842671, -0.09296404, -1.875822, 0.2117647, 1, 0, 1,
-0.4829811, 0.3682284, -1.785612, 0.2078431, 1, 0, 1,
-0.4793777, -0.2523217, -0.793627, 0.2, 1, 0, 1,
-0.4716971, 0.5054324, -1.452608, 0.1921569, 1, 0, 1,
-0.4671586, 1.048776, -0.2956026, 0.1882353, 1, 0, 1,
-0.4658954, -0.8014802, -2.111334, 0.1803922, 1, 0, 1,
-0.4648346, 1.192338, -0.8738319, 0.1764706, 1, 0, 1,
-0.4635057, -0.117244, -3.652007, 0.1686275, 1, 0, 1,
-0.4619915, 0.3737969, -1.581237, 0.1647059, 1, 0, 1,
-0.4594607, 0.5777116, -1.849174, 0.1568628, 1, 0, 1,
-0.4571224, -0.1196627, -2.615353, 0.1529412, 1, 0, 1,
-0.4539022, -0.9113433, -1.958553, 0.145098, 1, 0, 1,
-0.4528348, -1.526892, -0.9192734, 0.1411765, 1, 0, 1,
-0.4500473, -0.08802891, -2.503829, 0.1333333, 1, 0, 1,
-0.4481032, -0.5896299, -2.072025, 0.1294118, 1, 0, 1,
-0.4452673, -0.3867575, -2.049601, 0.1215686, 1, 0, 1,
-0.4441824, -0.6737544, -3.199792, 0.1176471, 1, 0, 1,
-0.4402755, 1.222924, 0.1488902, 0.1098039, 1, 0, 1,
-0.4388216, 1.504742, 1.433846, 0.1058824, 1, 0, 1,
-0.4351665, -1.332829, -3.360949, 0.09803922, 1, 0, 1,
-0.4313189, 1.333438, -0.4662027, 0.09019608, 1, 0, 1,
-0.4206492, 1.00957, -0.7835447, 0.08627451, 1, 0, 1,
-0.4069117, 0.2817134, -0.973138, 0.07843138, 1, 0, 1,
-0.4063961, -0.2353, -2.071256, 0.07450981, 1, 0, 1,
-0.403373, -0.8311769, -3.267004, 0.06666667, 1, 0, 1,
-0.4013159, 0.3478939, -2.174075, 0.0627451, 1, 0, 1,
-0.4001749, -1.272947, -4.055453, 0.05490196, 1, 0, 1,
-0.3966745, 0.9255719, -0.3123254, 0.05098039, 1, 0, 1,
-0.3924653, -0.3841631, -2.019928, 0.04313726, 1, 0, 1,
-0.3913029, 0.07824568, -1.951055, 0.03921569, 1, 0, 1,
-0.3905928, 1.115716, 0.2515566, 0.03137255, 1, 0, 1,
-0.3888707, 1.375132, 0.5750732, 0.02745098, 1, 0, 1,
-0.3857735, 1.040704, -0.2488375, 0.01960784, 1, 0, 1,
-0.3852711, -0.8829724, -2.447334, 0.01568628, 1, 0, 1,
-0.3833218, 0.4039653, -1.589784, 0.007843138, 1, 0, 1,
-0.3817537, 0.4093915, -0.2736306, 0.003921569, 1, 0, 1,
-0.3796038, -0.7346002, -2.517691, 0, 1, 0.003921569, 1,
-0.3794783, 0.6707802, -0.04355036, 0, 1, 0.01176471, 1,
-0.3789368, 2.02024, -1.145136, 0, 1, 0.01568628, 1,
-0.3747942, 0.1428143, -0.7779441, 0, 1, 0.02352941, 1,
-0.3742745, 0.995917, -1.290628, 0, 1, 0.02745098, 1,
-0.3686065, 0.4367352, -0.4511559, 0, 1, 0.03529412, 1,
-0.3661012, 1.303522, -1.07327, 0, 1, 0.03921569, 1,
-0.3622821, -3.283695, -1.575352, 0, 1, 0.04705882, 1,
-0.3613616, 0.2953185, -0.2738865, 0, 1, 0.05098039, 1,
-0.3610098, -0.5214562, -2.694452, 0, 1, 0.05882353, 1,
-0.3558083, 1.157486, -0.5945896, 0, 1, 0.0627451, 1,
-0.3496248, -0.1484491, -3.194942, 0, 1, 0.07058824, 1,
-0.3481213, -0.5575399, -2.92389, 0, 1, 0.07450981, 1,
-0.3471066, -0.6635717, -1.84442, 0, 1, 0.08235294, 1,
-0.3464116, 0.5052141, -0.7058008, 0, 1, 0.08627451, 1,
-0.3460598, -1.719156, -3.8234, 0, 1, 0.09411765, 1,
-0.345542, -0.6880047, -3.09738, 0, 1, 0.1019608, 1,
-0.3424929, -0.5865173, -2.425186, 0, 1, 0.1058824, 1,
-0.3348597, 0.1260882, 0.2139319, 0, 1, 0.1137255, 1,
-0.3330929, -0.4050626, -2.629704, 0, 1, 0.1176471, 1,
-0.3312188, -1.869081, -2.933833, 0, 1, 0.1254902, 1,
-0.3291108, 0.7105738, 0.4368633, 0, 1, 0.1294118, 1,
-0.3279307, -0.2367266, -2.240999, 0, 1, 0.1372549, 1,
-0.3256521, -1.004248, -3.969497, 0, 1, 0.1411765, 1,
-0.3218437, 0.05639036, -1.23846, 0, 1, 0.1490196, 1,
-0.3201878, -1.168687, -3.794508, 0, 1, 0.1529412, 1,
-0.313043, 0.3681828, -1.782257, 0, 1, 0.1607843, 1,
-0.3107012, 0.7531704, -0.8735914, 0, 1, 0.1647059, 1,
-0.302606, -0.3327032, -2.797463, 0, 1, 0.172549, 1,
-0.2925073, 0.5980632, -0.4041157, 0, 1, 0.1764706, 1,
-0.2915528, 0.6065144, -1.188372, 0, 1, 0.1843137, 1,
-0.2873062, 0.9394975, 0.7135141, 0, 1, 0.1882353, 1,
-0.2849342, 0.09460524, -1.513718, 0, 1, 0.1960784, 1,
-0.2808951, 0.1644986, -2.212024, 0, 1, 0.2039216, 1,
-0.2766603, 1.204075, -0.5552902, 0, 1, 0.2078431, 1,
-0.2747521, -0.670249, -3.387937, 0, 1, 0.2156863, 1,
-0.2738453, 0.05053009, 0.5226316, 0, 1, 0.2196078, 1,
-0.2722385, -1.129125, -3.061887, 0, 1, 0.227451, 1,
-0.2712146, 1.547066, 2.358495, 0, 1, 0.2313726, 1,
-0.2707275, -0.3578045, -3.02339, 0, 1, 0.2392157, 1,
-0.2701351, 0.4568131, -0.5934722, 0, 1, 0.2431373, 1,
-0.2697571, -2.459139, -3.528205, 0, 1, 0.2509804, 1,
-0.268658, 0.8653486, -0.9345622, 0, 1, 0.254902, 1,
-0.2616664, -1.667326, -2.069885, 0, 1, 0.2627451, 1,
-0.2604006, -1.138212, -3.133567, 0, 1, 0.2666667, 1,
-0.2580685, 0.3759156, -0.8171287, 0, 1, 0.2745098, 1,
-0.2573039, -1.347132, -3.452723, 0, 1, 0.2784314, 1,
-0.2555155, -1.241187, -3.948885, 0, 1, 0.2862745, 1,
-0.2532489, -0.1320361, 0.2524721, 0, 1, 0.2901961, 1,
-0.2411205, -1.110777, -2.447681, 0, 1, 0.2980392, 1,
-0.2406439, -1.683121, -1.093193, 0, 1, 0.3058824, 1,
-0.2389639, 0.5850911, -0.3026607, 0, 1, 0.3098039, 1,
-0.2383553, 0.2616226, 0.6442414, 0, 1, 0.3176471, 1,
-0.2351251, -1.007698, -2.873242, 0, 1, 0.3215686, 1,
-0.234211, -0.9256446, -1.984026, 0, 1, 0.3294118, 1,
-0.2331153, -0.07584073, -2.17163, 0, 1, 0.3333333, 1,
-0.2316153, 0.3354289, 0.6895813, 0, 1, 0.3411765, 1,
-0.2287456, 2.019361, 0.5801237, 0, 1, 0.345098, 1,
-0.2285052, -0.5434604, -1.366577, 0, 1, 0.3529412, 1,
-0.2266564, -0.7465593, -3.846082, 0, 1, 0.3568628, 1,
-0.2216712, 1.628268, 0.6466657, 0, 1, 0.3647059, 1,
-0.2166104, 0.0006100992, -0.7693799, 0, 1, 0.3686275, 1,
-0.2112796, -1.001279, -2.523772, 0, 1, 0.3764706, 1,
-0.2079092, -1.274833, -3.959027, 0, 1, 0.3803922, 1,
-0.205615, -1.930073, -4.499573, 0, 1, 0.3882353, 1,
-0.2018853, -0.6819397, -5.356585, 0, 1, 0.3921569, 1,
-0.2015153, 0.5464652, 0.1339755, 0, 1, 0.4, 1,
-0.2001162, -0.2741003, -1.95684, 0, 1, 0.4078431, 1,
-0.1957106, 0.3334507, -0.5560232, 0, 1, 0.4117647, 1,
-0.1940284, 1.256564, 0.4425566, 0, 1, 0.4196078, 1,
-0.1903127, -1.035682, -2.288679, 0, 1, 0.4235294, 1,
-0.1850882, -0.1542441, -2.345355, 0, 1, 0.4313726, 1,
-0.1824711, 1.388845, -2.513462, 0, 1, 0.4352941, 1,
-0.1733206, -0.7779815, -3.483015, 0, 1, 0.4431373, 1,
-0.1714675, 0.5914676, 0.7705443, 0, 1, 0.4470588, 1,
-0.1672107, -0.5671117, -2.25089, 0, 1, 0.454902, 1,
-0.1649127, -0.7782575, -3.143647, 0, 1, 0.4588235, 1,
-0.1635575, -1.803593, -0.4831291, 0, 1, 0.4666667, 1,
-0.1626179, 0.2111377, 0.2668928, 0, 1, 0.4705882, 1,
-0.1613511, -1.720451, -1.930761, 0, 1, 0.4784314, 1,
-0.1608842, -0.3624012, 0.3368303, 0, 1, 0.4823529, 1,
-0.1537623, -1.443048, -1.100537, 0, 1, 0.4901961, 1,
-0.152707, 0.9018782, -1.396389, 0, 1, 0.4941176, 1,
-0.1508406, -1.353369, -3.904333, 0, 1, 0.5019608, 1,
-0.1500925, -0.0497473, -0.303343, 0, 1, 0.509804, 1,
-0.1480884, -0.5659937, -4.40963, 0, 1, 0.5137255, 1,
-0.1471265, -0.2627873, -3.251725, 0, 1, 0.5215687, 1,
-0.1403275, 0.03389648, -2.021495, 0, 1, 0.5254902, 1,
-0.1375885, 1.341868, -0.4740144, 0, 1, 0.5333334, 1,
-0.1374794, -1.910293, -1.911742, 0, 1, 0.5372549, 1,
-0.1316879, 0.03198519, -1.982981, 0, 1, 0.5450981, 1,
-0.1293062, 1.100238, 1.077012, 0, 1, 0.5490196, 1,
-0.1253579, -0.9651541, -2.247227, 0, 1, 0.5568628, 1,
-0.1162895, 0.9609415, 0.9209185, 0, 1, 0.5607843, 1,
-0.1095467, 2.002475, -2.225461, 0, 1, 0.5686275, 1,
-0.1090657, 0.5278418, 2.001446, 0, 1, 0.572549, 1,
-0.1047821, 0.6899525, 0.3680401, 0, 1, 0.5803922, 1,
-0.1044872, -0.6816774, -1.243424, 0, 1, 0.5843138, 1,
-0.1024974, -1.039136, -4.547624, 0, 1, 0.5921569, 1,
-0.101463, -0.4805606, -2.971074, 0, 1, 0.5960785, 1,
-0.1012263, 0.3627041, 0.7522337, 0, 1, 0.6039216, 1,
-0.09472298, 2.42898, 0.5179496, 0, 1, 0.6117647, 1,
-0.09164794, 0.04945839, -0.9037153, 0, 1, 0.6156863, 1,
-0.09157424, 1.905443, 0.09956643, 0, 1, 0.6235294, 1,
-0.09105428, -1.128613, -2.562177, 0, 1, 0.627451, 1,
-0.08855429, 0.154414, -0.7110369, 0, 1, 0.6352941, 1,
-0.08687386, -1.063249, -1.716469, 0, 1, 0.6392157, 1,
-0.08310837, -1.651198, -2.861254, 0, 1, 0.6470588, 1,
-0.07329591, 0.5780671, -1.191086, 0, 1, 0.6509804, 1,
-0.0657604, -0.3219685, -3.536677, 0, 1, 0.6588235, 1,
-0.06488012, 1.02296, -1.490893, 0, 1, 0.6627451, 1,
-0.0641591, 0.5228823, -0.5289079, 0, 1, 0.6705883, 1,
-0.06222812, -1.145706, -3.133525, 0, 1, 0.6745098, 1,
-0.06188375, 0.7938105, 1.983276, 0, 1, 0.682353, 1,
-0.05359804, -1.10889, -4.186216, 0, 1, 0.6862745, 1,
-0.05243832, 0.0704728, -1.409642, 0, 1, 0.6941177, 1,
-0.04836921, 1.798982, -0.9932978, 0, 1, 0.7019608, 1,
-0.04690999, -0.01491095, -2.192428, 0, 1, 0.7058824, 1,
-0.0456991, 1.202885, 1.415803, 0, 1, 0.7137255, 1,
-0.04539513, 1.187523, 0.6385428, 0, 1, 0.7176471, 1,
-0.04098045, -0.9249063, -2.795202, 0, 1, 0.7254902, 1,
-0.04078233, 0.7095366, 0.1055504, 0, 1, 0.7294118, 1,
-0.03958374, 0.9094273, -0.7680119, 0, 1, 0.7372549, 1,
-0.03723642, 1.409323, -1.042949, 0, 1, 0.7411765, 1,
-0.03678944, 1.481785, 0.3178645, 0, 1, 0.7490196, 1,
-0.02833801, -0.5612661, -2.705009, 0, 1, 0.7529412, 1,
-0.01871322, -0.6261345, -3.302438, 0, 1, 0.7607843, 1,
-0.01752939, -0.0471608, -2.197301, 0, 1, 0.7647059, 1,
-0.01711021, -1.015285, -3.8567, 0, 1, 0.772549, 1,
-0.01587797, -0.6973134, -2.50584, 0, 1, 0.7764706, 1,
-0.015491, -0.441789, -3.546539, 0, 1, 0.7843137, 1,
-0.01331641, -0.8066429, -2.785548, 0, 1, 0.7882353, 1,
-0.01310471, 0.09051844, -1.101489, 0, 1, 0.7960784, 1,
-0.01263416, 1.52653, -0.04267722, 0, 1, 0.8039216, 1,
-0.009763566, 0.7364411, 0.2991743, 0, 1, 0.8078431, 1,
-0.007753702, -1.176385, -1.854818, 0, 1, 0.8156863, 1,
-0.006181372, 1.229795, -1.556144, 0, 1, 0.8196079, 1,
-0.004773279, -0.1720596, -3.382513, 0, 1, 0.827451, 1,
-0.001823199, -1.390712, -4.104475, 0, 1, 0.8313726, 1,
-0.001524939, 0.8737374, 1.51872, 0, 1, 0.8392157, 1,
-0.00107274, 1.588636, 1.032305, 0, 1, 0.8431373, 1,
0.004876471, 1.22766, 1.184246, 0, 1, 0.8509804, 1,
0.01449017, -0.25453, 3.316066, 0, 1, 0.854902, 1,
0.01586706, -1.804683, 3.093261, 0, 1, 0.8627451, 1,
0.01680978, 0.1275295, -0.7511068, 0, 1, 0.8666667, 1,
0.02058005, -0.7958698, 4.002203, 0, 1, 0.8745098, 1,
0.03273565, 0.7622909, 1.148403, 0, 1, 0.8784314, 1,
0.03436233, -1.438555, 3.616036, 0, 1, 0.8862745, 1,
0.0359682, -1.991353, 2.172201, 0, 1, 0.8901961, 1,
0.03756677, 0.4116567, -1.155039, 0, 1, 0.8980392, 1,
0.03789291, -3.07616, 2.485347, 0, 1, 0.9058824, 1,
0.03843748, -0.5255821, 2.051369, 0, 1, 0.9098039, 1,
0.04106387, -0.8485782, 3.999942, 0, 1, 0.9176471, 1,
0.04186442, 0.3182756, -0.6513228, 0, 1, 0.9215686, 1,
0.05238927, -1.731568, 2.773344, 0, 1, 0.9294118, 1,
0.053868, 0.1874269, 1.473635, 0, 1, 0.9333333, 1,
0.05441582, -1.178048, 3.442517, 0, 1, 0.9411765, 1,
0.05705982, 0.879889, -1.827326, 0, 1, 0.945098, 1,
0.05934996, -0.1231749, 4.669873, 0, 1, 0.9529412, 1,
0.06167955, 0.8981149, -0.03377714, 0, 1, 0.9568627, 1,
0.06194973, -0.8288795, 1.070372, 0, 1, 0.9647059, 1,
0.06240037, 2.048735, 0.1020088, 0, 1, 0.9686275, 1,
0.06826075, -1.228481, 3.287097, 0, 1, 0.9764706, 1,
0.06989164, -0.2052101, 2.37229, 0, 1, 0.9803922, 1,
0.0707602, 1.737856, -1.611307, 0, 1, 0.9882353, 1,
0.07087038, 0.1429492, 1.222126, 0, 1, 0.9921569, 1,
0.07186062, 1.034822, 0.3515683, 0, 1, 1, 1,
0.07208167, -0.2179034, 2.212707, 0, 0.9921569, 1, 1,
0.07558905, -0.4017961, 3.210532, 0, 0.9882353, 1, 1,
0.07632086, -0.4772124, 2.987619, 0, 0.9803922, 1, 1,
0.08197995, 0.8326212, -0.07290765, 0, 0.9764706, 1, 1,
0.08444724, 1.230777, 1.53461, 0, 0.9686275, 1, 1,
0.08596861, -1.156639, 4.149157, 0, 0.9647059, 1, 1,
0.08663702, 0.4017177, -0.2677821, 0, 0.9568627, 1, 1,
0.09119794, -1.110824, 3.730646, 0, 0.9529412, 1, 1,
0.09350429, -0.738705, 2.658244, 0, 0.945098, 1, 1,
0.09490991, -1.012361, 2.372411, 0, 0.9411765, 1, 1,
0.09633027, -1.326368, 3.006115, 0, 0.9333333, 1, 1,
0.09802568, -1.010071, 2.245359, 0, 0.9294118, 1, 1,
0.1010932, 0.3380577, 2.147143, 0, 0.9215686, 1, 1,
0.1096049, 2.337001, 0.2913521, 0, 0.9176471, 1, 1,
0.1114833, -1.26315, 1.760435, 0, 0.9098039, 1, 1,
0.116102, -0.8943725, 0.9476755, 0, 0.9058824, 1, 1,
0.1178468, -0.5485128, 2.103024, 0, 0.8980392, 1, 1,
0.1209064, -0.1643617, 0.3588019, 0, 0.8901961, 1, 1,
0.121565, -0.3114055, 1.907973, 0, 0.8862745, 1, 1,
0.1244576, -1.044506, 1.386611, 0, 0.8784314, 1, 1,
0.1261747, 0.1215518, -0.2616045, 0, 0.8745098, 1, 1,
0.1273519, -1.209886, 4.129978, 0, 0.8666667, 1, 1,
0.1274627, 0.7104277, -1.687618, 0, 0.8627451, 1, 1,
0.1275861, 0.05356022, -0.295665, 0, 0.854902, 1, 1,
0.1289951, -1.021049, 3.713802, 0, 0.8509804, 1, 1,
0.1312023, 0.0137373, 2.234313, 0, 0.8431373, 1, 1,
0.1327322, 0.1232937, 0.7078972, 0, 0.8392157, 1, 1,
0.1328272, -1.32332, 2.727769, 0, 0.8313726, 1, 1,
0.1330938, 0.7438079, 1.351686, 0, 0.827451, 1, 1,
0.1344792, -0.8917475, 3.18068, 0, 0.8196079, 1, 1,
0.1381269, -0.1651712, 1.607608, 0, 0.8156863, 1, 1,
0.1434258, 0.3931803, -0.6595404, 0, 0.8078431, 1, 1,
0.1460547, 0.8156784, -1.075929, 0, 0.8039216, 1, 1,
0.155295, -1.032426, 2.495304, 0, 0.7960784, 1, 1,
0.1579939, 0.3380924, -0.3087378, 0, 0.7882353, 1, 1,
0.1595799, 0.9119862, 0.7403065, 0, 0.7843137, 1, 1,
0.1606689, 0.6242245, 2.016023, 0, 0.7764706, 1, 1,
0.1612075, -0.9039366, 3.491455, 0, 0.772549, 1, 1,
0.1622322, -1.461284, 4.203339, 0, 0.7647059, 1, 1,
0.1637929, -0.01263747, 1.406917, 0, 0.7607843, 1, 1,
0.1641931, -1.025056, 3.044943, 0, 0.7529412, 1, 1,
0.1670991, 0.7559143, -0.006265158, 0, 0.7490196, 1, 1,
0.1686873, 1.060245, 0.09735202, 0, 0.7411765, 1, 1,
0.1695734, -0.4039273, 1.085548, 0, 0.7372549, 1, 1,
0.1701071, 0.5341026, -1.369043, 0, 0.7294118, 1, 1,
0.1749272, -1.013023, 2.272892, 0, 0.7254902, 1, 1,
0.177408, -0.03475697, 1.771186, 0, 0.7176471, 1, 1,
0.1784808, -0.5283675, 3.888185, 0, 0.7137255, 1, 1,
0.1822456, -0.4674082, 2.744621, 0, 0.7058824, 1, 1,
0.1848708, -0.1162764, 3.301207, 0, 0.6980392, 1, 1,
0.1856291, 0.4001043, -0.5418662, 0, 0.6941177, 1, 1,
0.1876982, 1.376529, -0.4439974, 0, 0.6862745, 1, 1,
0.1895738, 0.4316222, 0.0003718541, 0, 0.682353, 1, 1,
0.189773, 0.4475912, 1.828624, 0, 0.6745098, 1, 1,
0.1899038, 1.973371, -0.5602922, 0, 0.6705883, 1, 1,
0.1903338, -0.2723472, 0.9298083, 0, 0.6627451, 1, 1,
0.1905389, -0.4796392, 3.341699, 0, 0.6588235, 1, 1,
0.1905535, -0.1291056, 3.769797, 0, 0.6509804, 1, 1,
0.1913023, 1.626824, 0.9245374, 0, 0.6470588, 1, 1,
0.1915643, -0.9579286, 2.41175, 0, 0.6392157, 1, 1,
0.1925544, 0.1443711, 0.9392919, 0, 0.6352941, 1, 1,
0.1963277, -0.0254993, 2.587233, 0, 0.627451, 1, 1,
0.2010664, -1.378533, 0.9492221, 0, 0.6235294, 1, 1,
0.2042512, 0.6167006, 2.108721, 0, 0.6156863, 1, 1,
0.2069997, -0.3484016, 3.780854, 0, 0.6117647, 1, 1,
0.2088913, -0.1588745, 1.290924, 0, 0.6039216, 1, 1,
0.2091875, -0.8270828, 4.168612, 0, 0.5960785, 1, 1,
0.2124518, -0.5270957, 1.712733, 0, 0.5921569, 1, 1,
0.2173731, -1.19074, 2.926946, 0, 0.5843138, 1, 1,
0.2211823, 0.5869483, -0.3568848, 0, 0.5803922, 1, 1,
0.2234199, -0.5658094, 2.194427, 0, 0.572549, 1, 1,
0.2249108, 1.665436, 0.5100895, 0, 0.5686275, 1, 1,
0.2252152, -0.5302427, 2.387452, 0, 0.5607843, 1, 1,
0.2282221, 0.9859157, 0.7511125, 0, 0.5568628, 1, 1,
0.2286644, -1.259125, 4.372625, 0, 0.5490196, 1, 1,
0.2300323, 0.1911597, 0.4100075, 0, 0.5450981, 1, 1,
0.2303081, 0.8536, 0.9790198, 0, 0.5372549, 1, 1,
0.2313465, -0.2338637, 2.819371, 0, 0.5333334, 1, 1,
0.2354973, 1.834011, -0.3717112, 0, 0.5254902, 1, 1,
0.2372595, -0.8255118, 1.877723, 0, 0.5215687, 1, 1,
0.2373813, 1.094083, 1.059641, 0, 0.5137255, 1, 1,
0.2404302, 0.4770972, -0.4914359, 0, 0.509804, 1, 1,
0.242148, 1.35262, -2.138216, 0, 0.5019608, 1, 1,
0.244867, 1.037739, 1.975248, 0, 0.4941176, 1, 1,
0.2486217, -0.7469638, 4.293931, 0, 0.4901961, 1, 1,
0.2508135, 0.4876779, -0.4781145, 0, 0.4823529, 1, 1,
0.2563665, -0.4558848, 4.333924, 0, 0.4784314, 1, 1,
0.2563771, 1.049954, -0.3911636, 0, 0.4705882, 1, 1,
0.2592855, 1.045931, 0.1238965, 0, 0.4666667, 1, 1,
0.2604081, 1.317717, 2.375421, 0, 0.4588235, 1, 1,
0.2667057, 1.576538, 0.03810035, 0, 0.454902, 1, 1,
0.2669477, 0.6673792, 1.029365, 0, 0.4470588, 1, 1,
0.2693079, -1.171521, 3.154375, 0, 0.4431373, 1, 1,
0.2703932, -0.7866195, 2.498315, 0, 0.4352941, 1, 1,
0.2782037, -2.328388, 4.27013, 0, 0.4313726, 1, 1,
0.2831224, 1.093032, 0.5717596, 0, 0.4235294, 1, 1,
0.2840568, -1.682547, 0.9575701, 0, 0.4196078, 1, 1,
0.2891531, -0.4688221, 2.029553, 0, 0.4117647, 1, 1,
0.2926575, -1.274208, 3.405463, 0, 0.4078431, 1, 1,
0.2959034, 0.4594189, 0.8166441, 0, 0.4, 1, 1,
0.3001501, 0.01211662, 0.670572, 0, 0.3921569, 1, 1,
0.3038419, -1.350175, 3.332961, 0, 0.3882353, 1, 1,
0.3039981, -1.697763, 1.838194, 0, 0.3803922, 1, 1,
0.3072604, 0.8277596, 1.952065, 0, 0.3764706, 1, 1,
0.3085657, 0.3109198, 0.4794669, 0, 0.3686275, 1, 1,
0.3087806, 0.6344192, -0.8615604, 0, 0.3647059, 1, 1,
0.3110351, 2.250514, 0.3978555, 0, 0.3568628, 1, 1,
0.3146004, -0.9075368, 2.020756, 0, 0.3529412, 1, 1,
0.3163108, 0.6145625, -1.581383, 0, 0.345098, 1, 1,
0.3267885, -0.172239, 2.261403, 0, 0.3411765, 1, 1,
0.3287747, 0.7066367, -0.5279161, 0, 0.3333333, 1, 1,
0.3303954, 0.7715692, -0.2653908, 0, 0.3294118, 1, 1,
0.3315111, 1.607664, -0.5602816, 0, 0.3215686, 1, 1,
0.3363276, 2.048725, -0.2160735, 0, 0.3176471, 1, 1,
0.3378115, 0.4188553, 0.03167269, 0, 0.3098039, 1, 1,
0.3383926, -0.5102302, 2.294399, 0, 0.3058824, 1, 1,
0.343097, -0.9797782, 3.161733, 0, 0.2980392, 1, 1,
0.3444809, -2.107293, 1.33654, 0, 0.2901961, 1, 1,
0.3450656, -0.5756215, 3.940862, 0, 0.2862745, 1, 1,
0.3484099, -0.8125505, 2.941913, 0, 0.2784314, 1, 1,
0.3495031, 1.350162, 1.993251, 0, 0.2745098, 1, 1,
0.3521909, 2.148715, 0.2081058, 0, 0.2666667, 1, 1,
0.3525916, 0.3102987, 1.1438, 0, 0.2627451, 1, 1,
0.3618334, -0.03272967, 2.508694, 0, 0.254902, 1, 1,
0.3638088, 2.486572, -0.394024, 0, 0.2509804, 1, 1,
0.3654254, -1.702053, 3.030587, 0, 0.2431373, 1, 1,
0.3738561, 1.078541, -2.059159, 0, 0.2392157, 1, 1,
0.3749763, -0.2759687, 1.529242, 0, 0.2313726, 1, 1,
0.3769945, -0.8660548, 1.334276, 0, 0.227451, 1, 1,
0.3779937, -0.04031707, 0.2948939, 0, 0.2196078, 1, 1,
0.3780479, -0.02160671, 2.740229, 0, 0.2156863, 1, 1,
0.3820617, -0.3791578, 2.812718, 0, 0.2078431, 1, 1,
0.3838958, -1.243922, 2.929254, 0, 0.2039216, 1, 1,
0.3857855, 1.041224, 1.128043, 0, 0.1960784, 1, 1,
0.3865784, -0.2312841, 4.587143, 0, 0.1882353, 1, 1,
0.3935187, 0.4381616, 1.30022, 0, 0.1843137, 1, 1,
0.3952896, 0.02639199, 1.024848, 0, 0.1764706, 1, 1,
0.397861, -0.8987077, 2.233793, 0, 0.172549, 1, 1,
0.3988748, 0.1101382, 2.956057, 0, 0.1647059, 1, 1,
0.4003171, -0.6535245, 3.279739, 0, 0.1607843, 1, 1,
0.4021942, 0.7217481, 3.027262, 0, 0.1529412, 1, 1,
0.4052197, 0.5947337, 1.206818, 0, 0.1490196, 1, 1,
0.41044, -1.996027, 1.5901, 0, 0.1411765, 1, 1,
0.4134678, -1.050031, 4.39749, 0, 0.1372549, 1, 1,
0.4199308, -2.156127, 4.481285, 0, 0.1294118, 1, 1,
0.4217271, -0.1897036, 2.609412, 0, 0.1254902, 1, 1,
0.4242531, -0.4424799, 1.268072, 0, 0.1176471, 1, 1,
0.4304933, -1.142959, 3.863135, 0, 0.1137255, 1, 1,
0.4330633, -0.5296531, 2.130815, 0, 0.1058824, 1, 1,
0.4367152, -0.6846266, 3.585763, 0, 0.09803922, 1, 1,
0.4372958, -0.7358387, 4.467295, 0, 0.09411765, 1, 1,
0.4413452, 0.8832136, -1.169432, 0, 0.08627451, 1, 1,
0.4473477, -0.6316936, 2.707766, 0, 0.08235294, 1, 1,
0.4516012, 1.089978, 1.015955, 0, 0.07450981, 1, 1,
0.45205, -1.832215, 2.228579, 0, 0.07058824, 1, 1,
0.4527729, 1.440034, 1.903242, 0, 0.0627451, 1, 1,
0.4545501, -0.3243757, 1.000787, 0, 0.05882353, 1, 1,
0.4559979, 0.686343, 0.5006438, 0, 0.05098039, 1, 1,
0.4563377, 1.144149, -0.8553989, 0, 0.04705882, 1, 1,
0.4582005, 0.7021546, 0.550113, 0, 0.03921569, 1, 1,
0.4625739, -0.1644896, 0.633405, 0, 0.03529412, 1, 1,
0.4659882, 0.08933063, 0.2348439, 0, 0.02745098, 1, 1,
0.4704754, 0.2243125, 0.3658031, 0, 0.02352941, 1, 1,
0.4707339, -0.3730837, 3.746845, 0, 0.01568628, 1, 1,
0.4716496, -0.3207608, 1.51888, 0, 0.01176471, 1, 1,
0.4732095, 0.1936541, -0.6817612, 0, 0.003921569, 1, 1,
0.4749269, -1.429363, 3.646523, 0.003921569, 0, 1, 1,
0.4805145, -0.4990157, 3.259657, 0.007843138, 0, 1, 1,
0.4827133, -0.2242931, 2.28033, 0.01568628, 0, 1, 1,
0.4858228, -0.2504375, 2.517723, 0.01960784, 0, 1, 1,
0.4868715, 1.392441, 0.7517242, 0.02745098, 0, 1, 1,
0.4949897, 0.664483, 2.114296, 0.03137255, 0, 1, 1,
0.4981042, 0.07828495, 0.8004339, 0.03921569, 0, 1, 1,
0.5060577, 0.1661897, 0.02941955, 0.04313726, 0, 1, 1,
0.5080593, -1.878272, 2.771656, 0.05098039, 0, 1, 1,
0.5083684, -1.896383, 3.273757, 0.05490196, 0, 1, 1,
0.5097453, -0.9818298, 2.11283, 0.0627451, 0, 1, 1,
0.5112739, -0.6838285, 1.855615, 0.06666667, 0, 1, 1,
0.511977, 1.860242, -0.03734105, 0.07450981, 0, 1, 1,
0.5120738, -0.2887036, 2.053051, 0.07843138, 0, 1, 1,
0.5125758, 0.1193618, 1.174829, 0.08627451, 0, 1, 1,
0.5177574, -1.296145, 3.290429, 0.09019608, 0, 1, 1,
0.5192242, -1.831063, 3.260834, 0.09803922, 0, 1, 1,
0.5223573, -1.488605, 1.219839, 0.1058824, 0, 1, 1,
0.5236231, 0.5067381, 0.9657224, 0.1098039, 0, 1, 1,
0.5241249, 1.593456, -0.03542912, 0.1176471, 0, 1, 1,
0.5256609, 2.748475, 0.2788321, 0.1215686, 0, 1, 1,
0.5326189, 0.5424112, 1.243251, 0.1294118, 0, 1, 1,
0.5331237, -0.6068591, 3.407479, 0.1333333, 0, 1, 1,
0.539957, 2.089474, 1.072104, 0.1411765, 0, 1, 1,
0.5441735, 0.4230152, 0.3035677, 0.145098, 0, 1, 1,
0.5536996, 1.547521, -1.427034, 0.1529412, 0, 1, 1,
0.5593422, -1.467994, 5.662681, 0.1568628, 0, 1, 1,
0.5596069, 0.1216576, 2.087128, 0.1647059, 0, 1, 1,
0.5612641, 0.672186, 1.768998, 0.1686275, 0, 1, 1,
0.5624856, -0.263734, 4.095708, 0.1764706, 0, 1, 1,
0.5675653, -1.218587, 2.716079, 0.1803922, 0, 1, 1,
0.571601, 0.5475677, 1.134197, 0.1882353, 0, 1, 1,
0.5717821, 2.00536, 0.07182215, 0.1921569, 0, 1, 1,
0.5753494, -0.7102921, 3.176184, 0.2, 0, 1, 1,
0.5755808, -0.7732437, 2.032874, 0.2078431, 0, 1, 1,
0.5773752, 0.04589826, 1.501223, 0.2117647, 0, 1, 1,
0.5773778, 1.335027, 0.4791668, 0.2196078, 0, 1, 1,
0.5804777, 0.181918, 2.459426, 0.2235294, 0, 1, 1,
0.5844812, -0.6108957, 0.6585738, 0.2313726, 0, 1, 1,
0.5846789, 1.425064, 0.9658412, 0.2352941, 0, 1, 1,
0.5859448, -1.743239, 3.06236, 0.2431373, 0, 1, 1,
0.5870113, -1.223491, 1.7207, 0.2470588, 0, 1, 1,
0.5928071, 2.257253, 0.4870205, 0.254902, 0, 1, 1,
0.5972502, 1.064627, 0.4641353, 0.2588235, 0, 1, 1,
0.6009862, -1.015742, 4.020479, 0.2666667, 0, 1, 1,
0.6077011, -0.8056204, 3.339615, 0.2705882, 0, 1, 1,
0.6117215, 1.278747, 1.150956, 0.2784314, 0, 1, 1,
0.6137072, 0.4228438, -1.043773, 0.282353, 0, 1, 1,
0.6167054, 0.3959137, 1.628556, 0.2901961, 0, 1, 1,
0.6188975, 0.8934759, 0.5721617, 0.2941177, 0, 1, 1,
0.6203121, 0.8277671, 1.281668, 0.3019608, 0, 1, 1,
0.6204563, 0.9416151, 0.4593999, 0.3098039, 0, 1, 1,
0.6208888, -1.206763, 2.612945, 0.3137255, 0, 1, 1,
0.6253144, 0.4068935, 1.881325, 0.3215686, 0, 1, 1,
0.6363365, -0.7573431, 1.490033, 0.3254902, 0, 1, 1,
0.639309, 1.124572, 0.0571909, 0.3333333, 0, 1, 1,
0.6435937, -1.412882, 2.081735, 0.3372549, 0, 1, 1,
0.6542082, 2.124979, -1.42143, 0.345098, 0, 1, 1,
0.6562346, -0.987513, 2.270627, 0.3490196, 0, 1, 1,
0.6589038, 0.1345292, 0.4058098, 0.3568628, 0, 1, 1,
0.6623208, -0.4749273, 1.089851, 0.3607843, 0, 1, 1,
0.6624313, 0.4439155, 0.3056704, 0.3686275, 0, 1, 1,
0.664362, -0.2855258, 1.915065, 0.372549, 0, 1, 1,
0.669136, -0.6605448, 2.888283, 0.3803922, 0, 1, 1,
0.6722187, 0.4639366, -1.071211, 0.3843137, 0, 1, 1,
0.6797087, -0.1588132, -0.8808615, 0.3921569, 0, 1, 1,
0.6838845, -1.060207, 3.478403, 0.3960784, 0, 1, 1,
0.6866189, -0.001807513, 2.731581, 0.4039216, 0, 1, 1,
0.6881672, -0.6006566, 1.458482, 0.4117647, 0, 1, 1,
0.6891459, 0.8782594, 1.857714, 0.4156863, 0, 1, 1,
0.6976253, -0.7330607, 0.4329627, 0.4235294, 0, 1, 1,
0.6993955, -0.3426026, 0.9914449, 0.427451, 0, 1, 1,
0.7006093, 0.2887397, 1.745064, 0.4352941, 0, 1, 1,
0.7015994, 0.07548805, 2.44145, 0.4392157, 0, 1, 1,
0.70394, 2.300842, -0.490496, 0.4470588, 0, 1, 1,
0.7040286, -0.6714773, 2.977714, 0.4509804, 0, 1, 1,
0.7159377, -0.5038888, 2.450719, 0.4588235, 0, 1, 1,
0.725195, -0.4458687, 3.034313, 0.4627451, 0, 1, 1,
0.7259061, 1.704208, 0.1144066, 0.4705882, 0, 1, 1,
0.7312974, 0.7930731, 0.1442219, 0.4745098, 0, 1, 1,
0.7314109, 0.008345951, 1.326818, 0.4823529, 0, 1, 1,
0.7333075, 0.8992344, 1.057584, 0.4862745, 0, 1, 1,
0.742768, 1.470076, 0.8871613, 0.4941176, 0, 1, 1,
0.7454096, 0.8006116, 1.386204, 0.5019608, 0, 1, 1,
0.745442, -0.1557636, 1.127737, 0.5058824, 0, 1, 1,
0.7567722, -1.055199, 3.619923, 0.5137255, 0, 1, 1,
0.7590106, 1.016841, -0.6043661, 0.5176471, 0, 1, 1,
0.7605004, -0.2463856, 1.704389, 0.5254902, 0, 1, 1,
0.7613751, 0.6554787, -0.3267168, 0.5294118, 0, 1, 1,
0.7623041, 0.1224923, 2.339785, 0.5372549, 0, 1, 1,
0.7642478, 0.9287392, 0.4289838, 0.5411765, 0, 1, 1,
0.7644481, -0.7322432, 1.828311, 0.5490196, 0, 1, 1,
0.767453, -1.064784, 3.479879, 0.5529412, 0, 1, 1,
0.7784343, 1.285242, 1.639734, 0.5607843, 0, 1, 1,
0.7810259, -0.1610916, 1.527735, 0.5647059, 0, 1, 1,
0.78383, -1.691892, 3.145646, 0.572549, 0, 1, 1,
0.7839494, -0.4001625, 1.954822, 0.5764706, 0, 1, 1,
0.7876124, -0.1821258, 1.32261, 0.5843138, 0, 1, 1,
0.7900094, -0.1944577, 0.3742616, 0.5882353, 0, 1, 1,
0.7917588, 1.196194, -0.3548617, 0.5960785, 0, 1, 1,
0.7937309, 0.4568053, 0.2938568, 0.6039216, 0, 1, 1,
0.7996051, -0.2474462, 2.983237, 0.6078432, 0, 1, 1,
0.806136, 0.00391427, 1.889758, 0.6156863, 0, 1, 1,
0.8066962, 0.6040901, 1.621618, 0.6196079, 0, 1, 1,
0.8089991, 1.203899, 0.03764716, 0.627451, 0, 1, 1,
0.8097488, 0.8522575, 0.9945781, 0.6313726, 0, 1, 1,
0.811472, -0.2556906, 2.321349, 0.6392157, 0, 1, 1,
0.8139967, 1.132428, -0.07290613, 0.6431373, 0, 1, 1,
0.8147018, -0.8943105, 1.673036, 0.6509804, 0, 1, 1,
0.8194845, 1.035853, -0.01044891, 0.654902, 0, 1, 1,
0.8228393, -1.182789, 2.463305, 0.6627451, 0, 1, 1,
0.8235496, 0.3885692, 1.51754, 0.6666667, 0, 1, 1,
0.8305119, 0.09841127, 0.2009811, 0.6745098, 0, 1, 1,
0.8306369, -0.5042958, 0.3149233, 0.6784314, 0, 1, 1,
0.8326663, 1.285319, 0.2310372, 0.6862745, 0, 1, 1,
0.8484787, 0.1216108, 0.02883227, 0.6901961, 0, 1, 1,
0.8485571, -0.521733, 1.758428, 0.6980392, 0, 1, 1,
0.8491262, -0.5287153, 2.56564, 0.7058824, 0, 1, 1,
0.8502386, -0.6160561, 2.083677, 0.7098039, 0, 1, 1,
0.8507638, 0.2178633, 1.637682, 0.7176471, 0, 1, 1,
0.856723, 1.807531, -0.9807287, 0.7215686, 0, 1, 1,
0.8587139, -0.6950971, 3.357821, 0.7294118, 0, 1, 1,
0.8605446, -0.9558682, 2.796096, 0.7333333, 0, 1, 1,
0.8623987, 2.807975, 0.5459133, 0.7411765, 0, 1, 1,
0.8624153, 0.02603745, 2.235136, 0.7450981, 0, 1, 1,
0.863716, 0.1282576, 0.7540677, 0.7529412, 0, 1, 1,
0.8655217, -0.9764869, 3.00984, 0.7568628, 0, 1, 1,
0.8779331, -0.1162153, 2.413617, 0.7647059, 0, 1, 1,
0.8799344, -1.052743, 2.475732, 0.7686275, 0, 1, 1,
0.8835714, -1.154556, 3.039047, 0.7764706, 0, 1, 1,
0.884045, -0.4795696, 0.9542296, 0.7803922, 0, 1, 1,
0.8841153, -1.0082, 1.828219, 0.7882353, 0, 1, 1,
0.8866808, 0.8099555, 0.4781637, 0.7921569, 0, 1, 1,
0.8900886, 0.3447055, 2.609878, 0.8, 0, 1, 1,
0.8913155, -0.3510058, 1.785095, 0.8078431, 0, 1, 1,
0.8938399, -0.607224, 0.1626486, 0.8117647, 0, 1, 1,
0.8957294, -0.9115597, 2.068668, 0.8196079, 0, 1, 1,
0.9000145, 0.6796978, -0.0595932, 0.8235294, 0, 1, 1,
0.9008424, 0.6740558, 0.4848031, 0.8313726, 0, 1, 1,
0.9066623, 0.1817601, 1.946165, 0.8352941, 0, 1, 1,
0.9097863, 0.463404, 0.845395, 0.8431373, 0, 1, 1,
0.9123062, -0.2666623, 1.603783, 0.8470588, 0, 1, 1,
0.9145857, -0.491274, 3.85676, 0.854902, 0, 1, 1,
0.9160167, -0.9885554, 2.218182, 0.8588235, 0, 1, 1,
0.9275458, 1.40425, 1.488039, 0.8666667, 0, 1, 1,
0.9331245, 0.3335194, 1.58119, 0.8705882, 0, 1, 1,
0.9385234, 1.274878, 1.159863, 0.8784314, 0, 1, 1,
0.9427584, 0.1322335, 3.228736, 0.8823529, 0, 1, 1,
0.9455947, -0.9876519, 1.945769, 0.8901961, 0, 1, 1,
0.9470691, 0.2001248, 1.274684, 0.8941177, 0, 1, 1,
0.9505777, -0.9932534, 1.319974, 0.9019608, 0, 1, 1,
0.9521054, -0.8271332, 2.873364, 0.9098039, 0, 1, 1,
0.9604643, -0.4300961, 3.10544, 0.9137255, 0, 1, 1,
0.9622318, -0.5436634, 1.739283, 0.9215686, 0, 1, 1,
0.9668461, 0.348646, 2.851521, 0.9254902, 0, 1, 1,
0.9673514, -1.005448, 1.663893, 0.9333333, 0, 1, 1,
0.9700492, 0.2761113, 2.206626, 0.9372549, 0, 1, 1,
0.9899834, -0.0712737, 1.923027, 0.945098, 0, 1, 1,
0.9920509, 0.6599615, -1.143789, 0.9490196, 0, 1, 1,
1.003624, 0.2616141, 2.350443, 0.9568627, 0, 1, 1,
1.006617, -0.8443323, 3.459729, 0.9607843, 0, 1, 1,
1.012543, 0.3501279, 1.022033, 0.9686275, 0, 1, 1,
1.015902, 0.3164537, 1.793905, 0.972549, 0, 1, 1,
1.020335, -1.125793, 2.291878, 0.9803922, 0, 1, 1,
1.036345, -0.7310771, 1.769888, 0.9843137, 0, 1, 1,
1.038071, 0.4544637, 1.835755, 0.9921569, 0, 1, 1,
1.039136, 0.2341952, 0.1561489, 0.9960784, 0, 1, 1,
1.042606, 0.7943001, 0.6145778, 1, 0, 0.9960784, 1,
1.045446, 0.8981135, 1.470911, 1, 0, 0.9882353, 1,
1.066765, 0.08741336, 0.7059283, 1, 0, 0.9843137, 1,
1.067556, -1.299791, 2.342461, 1, 0, 0.9764706, 1,
1.070467, 1.43899, -1.179209, 1, 0, 0.972549, 1,
1.070602, -1.131757, 2.237309, 1, 0, 0.9647059, 1,
1.073327, -1.001932, 1.638509, 1, 0, 0.9607843, 1,
1.073743, -0.530824, 1.075573, 1, 0, 0.9529412, 1,
1.075335, -0.260196, 1.644012, 1, 0, 0.9490196, 1,
1.077872, -1.094067, 2.580775, 1, 0, 0.9411765, 1,
1.079138, 2.582019, 1.280612, 1, 0, 0.9372549, 1,
1.081403, 1.203096, 0.977409, 1, 0, 0.9294118, 1,
1.081546, 1.266394, -0.77941, 1, 0, 0.9254902, 1,
1.08567, -0.1264931, 1.564117, 1, 0, 0.9176471, 1,
1.086915, 0.004115591, 2.541026, 1, 0, 0.9137255, 1,
1.088134, -0.8693445, 1.509766, 1, 0, 0.9058824, 1,
1.089248, -0.744208, 3.19302, 1, 0, 0.9019608, 1,
1.101932, 0.2192195, 3.447014, 1, 0, 0.8941177, 1,
1.102883, 0.3646964, 1.763067, 1, 0, 0.8862745, 1,
1.10325, -0.1540923, 1.583885, 1, 0, 0.8823529, 1,
1.107732, -1.637038, 1.324363, 1, 0, 0.8745098, 1,
1.109577, -0.4085442, 1.845623, 1, 0, 0.8705882, 1,
1.119362, 0.8293421, 1.217779, 1, 0, 0.8627451, 1,
1.125944, -0.2579061, 1.226718, 1, 0, 0.8588235, 1,
1.126532, 0.3319045, 1.874007, 1, 0, 0.8509804, 1,
1.129152, 1.273486, -0.9828925, 1, 0, 0.8470588, 1,
1.130617, -1.633424, 2.56381, 1, 0, 0.8392157, 1,
1.131949, -0.2260054, 1.650075, 1, 0, 0.8352941, 1,
1.144352, -1.486939, 3.513, 1, 0, 0.827451, 1,
1.145194, -2.527764, 4.126245, 1, 0, 0.8235294, 1,
1.148282, -0.8377213, 1.851653, 1, 0, 0.8156863, 1,
1.15391, -0.04415089, 0.4487532, 1, 0, 0.8117647, 1,
1.154883, -0.535767, 2.132269, 1, 0, 0.8039216, 1,
1.155381, 0.7333725, 0.1133874, 1, 0, 0.7960784, 1,
1.155606, -0.172319, 2.965045, 1, 0, 0.7921569, 1,
1.156403, 1.182636, 1.943765, 1, 0, 0.7843137, 1,
1.170843, -1.188527, 2.656861, 1, 0, 0.7803922, 1,
1.172622, -0.03645475, 1.73761, 1, 0, 0.772549, 1,
1.173886, -0.1333355, 0.8678241, 1, 0, 0.7686275, 1,
1.175286, -0.5908756, 2.760998, 1, 0, 0.7607843, 1,
1.175534, -0.0006819469, 2.283742, 1, 0, 0.7568628, 1,
1.17584, -0.6493688, 1.396249, 1, 0, 0.7490196, 1,
1.177363, -1.177612, 3.115787, 1, 0, 0.7450981, 1,
1.186949, -0.8001495, 2.127159, 1, 0, 0.7372549, 1,
1.187515, 0.6364713, 3.667001, 1, 0, 0.7333333, 1,
1.18761, -0.7589427, 2.273757, 1, 0, 0.7254902, 1,
1.192784, -0.8226151, 2.206839, 1, 0, 0.7215686, 1,
1.195538, -1.409575, 2.486995, 1, 0, 0.7137255, 1,
1.197685, 1.537994, 1.166654, 1, 0, 0.7098039, 1,
1.218779, 1.49208, 0.4749849, 1, 0, 0.7019608, 1,
1.22583, -0.2993113, 0.4602633, 1, 0, 0.6941177, 1,
1.226319, -1.139107, 2.880326, 1, 0, 0.6901961, 1,
1.229035, -0.3922101, 2.351415, 1, 0, 0.682353, 1,
1.232479, -1.554193, 2.167707, 1, 0, 0.6784314, 1,
1.233092, 0.8441036, 1.228063, 1, 0, 0.6705883, 1,
1.236572, 1.17536, 1.110619, 1, 0, 0.6666667, 1,
1.239123, 1.135252, 1.48885, 1, 0, 0.6588235, 1,
1.240674, -0.5745133, 1.374827, 1, 0, 0.654902, 1,
1.243289, 0.4374246, 0.6490182, 1, 0, 0.6470588, 1,
1.24878, 0.3555895, 1.525593, 1, 0, 0.6431373, 1,
1.250641, 0.9448494, 0.2147565, 1, 0, 0.6352941, 1,
1.250817, -0.9933327, 2.155467, 1, 0, 0.6313726, 1,
1.251543, -0.6910095, 3.257607, 1, 0, 0.6235294, 1,
1.257199, 0.4028604, 1.884158, 1, 0, 0.6196079, 1,
1.259101, 1.254491, 1.180435, 1, 0, 0.6117647, 1,
1.273735, -0.1923513, 2.227707, 1, 0, 0.6078432, 1,
1.275977, 1.316773, 1.123441, 1, 0, 0.6, 1,
1.276136, -1.346262, 3.162228, 1, 0, 0.5921569, 1,
1.280226, 1.829853, 0.6060922, 1, 0, 0.5882353, 1,
1.283522, 0.09248511, 1.077883, 1, 0, 0.5803922, 1,
1.286277, 0.9408231, -0.3218408, 1, 0, 0.5764706, 1,
1.291674, -0.3995802, 4.316401, 1, 0, 0.5686275, 1,
1.304109, -0.4037987, 2.395481, 1, 0, 0.5647059, 1,
1.315217, 0.5687389, 1.434018, 1, 0, 0.5568628, 1,
1.336321, 1.047274, 0.1687191, 1, 0, 0.5529412, 1,
1.337731, 0.9197994, 0.4143154, 1, 0, 0.5450981, 1,
1.342158, -0.9516334, 1.765783, 1, 0, 0.5411765, 1,
1.343356, 1.646638, 0.370218, 1, 0, 0.5333334, 1,
1.358894, -0.7288797, 3.211538, 1, 0, 0.5294118, 1,
1.366254, 0.7177162, -0.909959, 1, 0, 0.5215687, 1,
1.374586, 0.2171943, 1.808789, 1, 0, 0.5176471, 1,
1.374784, 0.1599185, 3.606013, 1, 0, 0.509804, 1,
1.394294, 1.8324, -0.229608, 1, 0, 0.5058824, 1,
1.409062, -1.24358, 2.293708, 1, 0, 0.4980392, 1,
1.414004, -1.204198, 1.79668, 1, 0, 0.4901961, 1,
1.416115, -1.230687, 1.43921, 1, 0, 0.4862745, 1,
1.424842, -1.243551, 2.692139, 1, 0, 0.4784314, 1,
1.434877, 0.828034, 1.93535, 1, 0, 0.4745098, 1,
1.437716, 0.9865189, 0.7496762, 1, 0, 0.4666667, 1,
1.43867, -0.3787709, 3.61041, 1, 0, 0.4627451, 1,
1.4566, -0.775561, 2.304938, 1, 0, 0.454902, 1,
1.483679, -0.977882, 1.276857, 1, 0, 0.4509804, 1,
1.498419, -0.5527689, 1.441863, 1, 0, 0.4431373, 1,
1.498825, -1.965554, 3.032293, 1, 0, 0.4392157, 1,
1.505599, 1.98087, -1.819499, 1, 0, 0.4313726, 1,
1.507885, 1.391897, 2.533498, 1, 0, 0.427451, 1,
1.514702, -0.06964508, 0.1641513, 1, 0, 0.4196078, 1,
1.515766, -0.9860664, 0.1842076, 1, 0, 0.4156863, 1,
1.52389, 0.123069, 1.45293, 1, 0, 0.4078431, 1,
1.527888, 0.1882088, 0.3768308, 1, 0, 0.4039216, 1,
1.532125, 0.113521, 1.070631, 1, 0, 0.3960784, 1,
1.537603, 0.7019296, 1.756493, 1, 0, 0.3882353, 1,
1.541473, 0.4398296, 0.9378155, 1, 0, 0.3843137, 1,
1.556708, 0.3352642, -1.159331, 1, 0, 0.3764706, 1,
1.561895, -0.2153041, 2.200035, 1, 0, 0.372549, 1,
1.565255, -0.2662189, 2.350712, 1, 0, 0.3647059, 1,
1.566116, -1.952106, 2.453924, 1, 0, 0.3607843, 1,
1.568029, -0.1196863, 1.605793, 1, 0, 0.3529412, 1,
1.571162, 1.15828, 0.1230117, 1, 0, 0.3490196, 1,
1.576597, 1.172276, 0.6753027, 1, 0, 0.3411765, 1,
1.63505, -0.3155605, 3.374151, 1, 0, 0.3372549, 1,
1.649225, 0.08828589, 1.494135, 1, 0, 0.3294118, 1,
1.652087, 0.8731307, 0.2707115, 1, 0, 0.3254902, 1,
1.654665, -0.7950451, 2.666993, 1, 0, 0.3176471, 1,
1.660031, -0.3720363, 2.695438, 1, 0, 0.3137255, 1,
1.677308, 0.7991874, 1.150538, 1, 0, 0.3058824, 1,
1.678522, 1.762202, -0.6282572, 1, 0, 0.2980392, 1,
1.680778, -0.1714274, 1.741588, 1, 0, 0.2941177, 1,
1.703954, 0.3578489, 1.326141, 1, 0, 0.2862745, 1,
1.707453, 0.06517785, 1.118036, 1, 0, 0.282353, 1,
1.713151, -0.7324014, 2.563417, 1, 0, 0.2745098, 1,
1.716888, 0.2360456, 3.348513, 1, 0, 0.2705882, 1,
1.730126, -0.5767639, 2.750139, 1, 0, 0.2627451, 1,
1.750451, 0.6927348, 1.465523, 1, 0, 0.2588235, 1,
1.770925, -0.6488202, 1.720989, 1, 0, 0.2509804, 1,
1.783122, -0.128245, 0.293256, 1, 0, 0.2470588, 1,
1.794412, -0.04512705, 2.223929, 1, 0, 0.2392157, 1,
1.795375, -1.986417, 1.217575, 1, 0, 0.2352941, 1,
1.799567, -0.6986054, 2.168483, 1, 0, 0.227451, 1,
1.805785, -2.162678, 1.894164, 1, 0, 0.2235294, 1,
1.819255, -2.161919, 3.929848, 1, 0, 0.2156863, 1,
1.845697, -0.4036977, 1.081419, 1, 0, 0.2117647, 1,
1.845888, 0.6826746, 1.092479, 1, 0, 0.2039216, 1,
1.882709, 1.16349, 0.5804741, 1, 0, 0.1960784, 1,
1.889051, 1.13793, 1.62031, 1, 0, 0.1921569, 1,
1.894209, -0.3375961, 3.25993, 1, 0, 0.1843137, 1,
1.901694, 1.282764, 0.3570125, 1, 0, 0.1803922, 1,
1.914832, 1.78337, -0.4605553, 1, 0, 0.172549, 1,
1.960326, -0.1449672, 0.3128803, 1, 0, 0.1686275, 1,
1.978109, 0.5559372, 0.3089428, 1, 0, 0.1607843, 1,
1.981264, -0.8500956, 2.880183, 1, 0, 0.1568628, 1,
2.009526, 1.102416, 1.846184, 1, 0, 0.1490196, 1,
2.015457, -0.4322075, 1.884273, 1, 0, 0.145098, 1,
2.018869, 0.21651, 1.736434, 1, 0, 0.1372549, 1,
2.024945, -0.1889388, 0.7963205, 1, 0, 0.1333333, 1,
2.04219, 0.2586895, 1.242424, 1, 0, 0.1254902, 1,
2.045082, 0.2417445, 2.937033, 1, 0, 0.1215686, 1,
2.072212, -0.1820299, 0.7503379, 1, 0, 0.1137255, 1,
2.074795, -0.3958002, 0.4533704, 1, 0, 0.1098039, 1,
2.094552, 1.111262, -0.07122398, 1, 0, 0.1019608, 1,
2.127657, -0.8853495, 0.73658, 1, 0, 0.09411765, 1,
2.16981, -1.78435, 3.815911, 1, 0, 0.09019608, 1,
2.230469, -1.233654, 0.5706186, 1, 0, 0.08235294, 1,
2.259614, -0.7558944, 2.024072, 1, 0, 0.07843138, 1,
2.263124, -1.220071, 2.279668, 1, 0, 0.07058824, 1,
2.295201, -0.6708153, 2.080518, 1, 0, 0.06666667, 1,
2.305348, 0.5636095, 1.485747, 1, 0, 0.05882353, 1,
2.322705, -0.01631546, 1.814424, 1, 0, 0.05490196, 1,
2.341004, 0.09826548, 1.621621, 1, 0, 0.04705882, 1,
2.500596, 1.450297, 2.362856, 1, 0, 0.04313726, 1,
2.61651, 0.01045083, 0.9498218, 1, 0, 0.03529412, 1,
2.628537, 2.643067, 1.429962, 1, 0, 0.03137255, 1,
2.780036, 0.8757555, 1.49055, 1, 0, 0.02352941, 1,
2.867878, 0.2770827, 1.257992, 1, 0, 0.01960784, 1,
3.194621, -0.8479201, 2.275557, 1, 0, 0.01176471, 1,
3.196675, 1.280166, -0.5719824, 1, 0, 0.007843138, 1
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
-0.2058983, -4.443131, -7.370908, 0, -0.5, 0.5, 0.5,
-0.2058983, -4.443131, -7.370908, 1, -0.5, 0.5, 0.5,
-0.2058983, -4.443131, -7.370908, 1, 1.5, 0.5, 0.5,
-0.2058983, -4.443131, -7.370908, 0, 1.5, 0.5, 0.5
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
-4.761944, 0.1364725, -7.370908, 0, -0.5, 0.5, 0.5,
-4.761944, 0.1364725, -7.370908, 1, -0.5, 0.5, 0.5,
-4.761944, 0.1364725, -7.370908, 1, 1.5, 0.5, 0.5,
-4.761944, 0.1364725, -7.370908, 0, 1.5, 0.5, 0.5
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
-4.761944, -4.443131, 0.09038973, 0, -0.5, 0.5, 0.5,
-4.761944, -4.443131, 0.09038973, 1, -0.5, 0.5, 0.5,
-4.761944, -4.443131, 0.09038973, 1, 1.5, 0.5, 0.5,
-4.761944, -4.443131, 0.09038973, 0, 1.5, 0.5, 0.5
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
-3, -3.3863, -5.64907,
3, -3.3863, -5.64907,
-3, -3.3863, -5.64907,
-3, -3.562438, -5.936043,
-2, -3.3863, -5.64907,
-2, -3.562438, -5.936043,
-1, -3.3863, -5.64907,
-1, -3.562438, -5.936043,
0, -3.3863, -5.64907,
0, -3.562438, -5.936043,
1, -3.3863, -5.64907,
1, -3.562438, -5.936043,
2, -3.3863, -5.64907,
2, -3.562438, -5.936043,
3, -3.3863, -5.64907,
3, -3.562438, -5.936043
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
-3, -3.914715, -6.509989, 0, -0.5, 0.5, 0.5,
-3, -3.914715, -6.509989, 1, -0.5, 0.5, 0.5,
-3, -3.914715, -6.509989, 1, 1.5, 0.5, 0.5,
-3, -3.914715, -6.509989, 0, 1.5, 0.5, 0.5,
-2, -3.914715, -6.509989, 0, -0.5, 0.5, 0.5,
-2, -3.914715, -6.509989, 1, -0.5, 0.5, 0.5,
-2, -3.914715, -6.509989, 1, 1.5, 0.5, 0.5,
-2, -3.914715, -6.509989, 0, 1.5, 0.5, 0.5,
-1, -3.914715, -6.509989, 0, -0.5, 0.5, 0.5,
-1, -3.914715, -6.509989, 1, -0.5, 0.5, 0.5,
-1, -3.914715, -6.509989, 1, 1.5, 0.5, 0.5,
-1, -3.914715, -6.509989, 0, 1.5, 0.5, 0.5,
0, -3.914715, -6.509989, 0, -0.5, 0.5, 0.5,
0, -3.914715, -6.509989, 1, -0.5, 0.5, 0.5,
0, -3.914715, -6.509989, 1, 1.5, 0.5, 0.5,
0, -3.914715, -6.509989, 0, 1.5, 0.5, 0.5,
1, -3.914715, -6.509989, 0, -0.5, 0.5, 0.5,
1, -3.914715, -6.509989, 1, -0.5, 0.5, 0.5,
1, -3.914715, -6.509989, 1, 1.5, 0.5, 0.5,
1, -3.914715, -6.509989, 0, 1.5, 0.5, 0.5,
2, -3.914715, -6.509989, 0, -0.5, 0.5, 0.5,
2, -3.914715, -6.509989, 1, -0.5, 0.5, 0.5,
2, -3.914715, -6.509989, 1, 1.5, 0.5, 0.5,
2, -3.914715, -6.509989, 0, 1.5, 0.5, 0.5,
3, -3.914715, -6.509989, 0, -0.5, 0.5, 0.5,
3, -3.914715, -6.509989, 1, -0.5, 0.5, 0.5,
3, -3.914715, -6.509989, 1, 1.5, 0.5, 0.5,
3, -3.914715, -6.509989, 0, 1.5, 0.5, 0.5
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
-3.710549, -3, -5.64907,
-3.710549, 3, -5.64907,
-3.710549, -3, -5.64907,
-3.885781, -3, -5.936043,
-3.710549, -2, -5.64907,
-3.885781, -2, -5.936043,
-3.710549, -1, -5.64907,
-3.885781, -1, -5.936043,
-3.710549, 0, -5.64907,
-3.885781, 0, -5.936043,
-3.710549, 1, -5.64907,
-3.885781, 1, -5.936043,
-3.710549, 2, -5.64907,
-3.885781, 2, -5.936043,
-3.710549, 3, -5.64907,
-3.885781, 3, -5.936043
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
-4.236247, -3, -6.509989, 0, -0.5, 0.5, 0.5,
-4.236247, -3, -6.509989, 1, -0.5, 0.5, 0.5,
-4.236247, -3, -6.509989, 1, 1.5, 0.5, 0.5,
-4.236247, -3, -6.509989, 0, 1.5, 0.5, 0.5,
-4.236247, -2, -6.509989, 0, -0.5, 0.5, 0.5,
-4.236247, -2, -6.509989, 1, -0.5, 0.5, 0.5,
-4.236247, -2, -6.509989, 1, 1.5, 0.5, 0.5,
-4.236247, -2, -6.509989, 0, 1.5, 0.5, 0.5,
-4.236247, -1, -6.509989, 0, -0.5, 0.5, 0.5,
-4.236247, -1, -6.509989, 1, -0.5, 0.5, 0.5,
-4.236247, -1, -6.509989, 1, 1.5, 0.5, 0.5,
-4.236247, -1, -6.509989, 0, 1.5, 0.5, 0.5,
-4.236247, 0, -6.509989, 0, -0.5, 0.5, 0.5,
-4.236247, 0, -6.509989, 1, -0.5, 0.5, 0.5,
-4.236247, 0, -6.509989, 1, 1.5, 0.5, 0.5,
-4.236247, 0, -6.509989, 0, 1.5, 0.5, 0.5,
-4.236247, 1, -6.509989, 0, -0.5, 0.5, 0.5,
-4.236247, 1, -6.509989, 1, -0.5, 0.5, 0.5,
-4.236247, 1, -6.509989, 1, 1.5, 0.5, 0.5,
-4.236247, 1, -6.509989, 0, 1.5, 0.5, 0.5,
-4.236247, 2, -6.509989, 0, -0.5, 0.5, 0.5,
-4.236247, 2, -6.509989, 1, -0.5, 0.5, 0.5,
-4.236247, 2, -6.509989, 1, 1.5, 0.5, 0.5,
-4.236247, 2, -6.509989, 0, 1.5, 0.5, 0.5,
-4.236247, 3, -6.509989, 0, -0.5, 0.5, 0.5,
-4.236247, 3, -6.509989, 1, -0.5, 0.5, 0.5,
-4.236247, 3, -6.509989, 1, 1.5, 0.5, 0.5,
-4.236247, 3, -6.509989, 0, 1.5, 0.5, 0.5
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
-3.710549, -3.3863, -4,
-3.710549, -3.3863, 4,
-3.710549, -3.3863, -4,
-3.885781, -3.562438, -4,
-3.710549, -3.3863, -2,
-3.885781, -3.562438, -2,
-3.710549, -3.3863, 0,
-3.885781, -3.562438, 0,
-3.710549, -3.3863, 2,
-3.885781, -3.562438, 2,
-3.710549, -3.3863, 4,
-3.885781, -3.562438, 4
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
-4.236247, -3.914715, -4, 0, -0.5, 0.5, 0.5,
-4.236247, -3.914715, -4, 1, -0.5, 0.5, 0.5,
-4.236247, -3.914715, -4, 1, 1.5, 0.5, 0.5,
-4.236247, -3.914715, -4, 0, 1.5, 0.5, 0.5,
-4.236247, -3.914715, -2, 0, -0.5, 0.5, 0.5,
-4.236247, -3.914715, -2, 1, -0.5, 0.5, 0.5,
-4.236247, -3.914715, -2, 1, 1.5, 0.5, 0.5,
-4.236247, -3.914715, -2, 0, 1.5, 0.5, 0.5,
-4.236247, -3.914715, 0, 0, -0.5, 0.5, 0.5,
-4.236247, -3.914715, 0, 1, -0.5, 0.5, 0.5,
-4.236247, -3.914715, 0, 1, 1.5, 0.5, 0.5,
-4.236247, -3.914715, 0, 0, 1.5, 0.5, 0.5,
-4.236247, -3.914715, 2, 0, -0.5, 0.5, 0.5,
-4.236247, -3.914715, 2, 1, -0.5, 0.5, 0.5,
-4.236247, -3.914715, 2, 1, 1.5, 0.5, 0.5,
-4.236247, -3.914715, 2, 0, 1.5, 0.5, 0.5,
-4.236247, -3.914715, 4, 0, -0.5, 0.5, 0.5,
-4.236247, -3.914715, 4, 1, -0.5, 0.5, 0.5,
-4.236247, -3.914715, 4, 1, 1.5, 0.5, 0.5,
-4.236247, -3.914715, 4, 0, 1.5, 0.5, 0.5
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
-3.710549, -3.3863, -5.64907,
-3.710549, 3.659245, -5.64907,
-3.710549, -3.3863, 5.829849,
-3.710549, 3.659245, 5.829849,
-3.710549, -3.3863, -5.64907,
-3.710549, -3.3863, 5.829849,
-3.710549, 3.659245, -5.64907,
-3.710549, 3.659245, 5.829849,
-3.710549, -3.3863, -5.64907,
3.298752, -3.3863, -5.64907,
-3.710549, -3.3863, 5.829849,
3.298752, -3.3863, 5.829849,
-3.710549, 3.659245, -5.64907,
3.298752, 3.659245, -5.64907,
-3.710549, 3.659245, 5.829849,
3.298752, 3.659245, 5.829849,
3.298752, -3.3863, -5.64907,
3.298752, 3.659245, -5.64907,
3.298752, -3.3863, 5.829849,
3.298752, 3.659245, 5.829849,
3.298752, -3.3863, -5.64907,
3.298752, -3.3863, 5.829849,
3.298752, 3.659245, -5.64907,
3.298752, 3.659245, 5.829849
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
var radius = 8.10764;
var distance = 36.0718;
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
mvMatrix.translate( 0.2058983, -0.1364725, -0.09038973 );
mvMatrix.scale( 1.250644, 1.24421, 0.7636728 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.0718);
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
InChI_1S_C13H8Cl2N2O<-read.table("InChI_1S_C13H8Cl2N2O.xyz")
```

```
## Error in read.table("InChI_1S_C13H8Cl2N2O.xyz"): no lines available in input
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
-3.608472, -0.06955238, -2.379251, 0, 0, 1, 1, 1,
-3.110381, -0.457876, -2.576382, 1, 0, 0, 1, 1,
-2.711712, 1.352112, -1.836171, 1, 0, 0, 1, 1,
-2.593968, 1.555687, -1.188275, 1, 0, 0, 1, 1,
-2.389722, -0.8735923, -1.79173, 1, 0, 0, 1, 1,
-2.337017, -0.9886688, -1.938859, 1, 0, 0, 1, 1,
-2.314245, 0.5453268, -2.314218, 0, 0, 0, 1, 1,
-2.300697, 1.224964, -1.545282, 0, 0, 0, 1, 1,
-2.30029, -0.4433192, -3.535142, 0, 0, 0, 1, 1,
-2.288897, 0.6204231, -1.187875, 0, 0, 0, 1, 1,
-2.276364, 0.5950169, 0.4763229, 0, 0, 0, 1, 1,
-2.237094, 1.294107, -0.2454699, 0, 0, 0, 1, 1,
-2.220965, 0.5006684, -2.21981, 0, 0, 0, 1, 1,
-2.216865, -0.2256749, -0.8607776, 1, 1, 1, 1, 1,
-2.109424, 0.2772594, -2.422782, 1, 1, 1, 1, 1,
-2.091138, 2.316153, -0.7567553, 1, 1, 1, 1, 1,
-2.043381, -0.4717855, -2.428138, 1, 1, 1, 1, 1,
-2.02416, -0.3510993, -2.838497, 1, 1, 1, 1, 1,
-2.022082, -0.2746373, -2.307932, 1, 1, 1, 1, 1,
-2.003842, 2.291908, 0.9720713, 1, 1, 1, 1, 1,
-1.995132, -0.3765405, -0.7666374, 1, 1, 1, 1, 1,
-1.988288, -0.7840531, -0.7711396, 1, 1, 1, 1, 1,
-1.930992, 0.3167219, -1.301194, 1, 1, 1, 1, 1,
-1.906372, -0.02324971, -3.073764, 1, 1, 1, 1, 1,
-1.888495, 0.0748889, -0.6014627, 1, 1, 1, 1, 1,
-1.857856, -0.952776, -2.265383, 1, 1, 1, 1, 1,
-1.846763, -0.7438073, -0.7104074, 1, 1, 1, 1, 1,
-1.832101, 1.952804, 0.03652883, 1, 1, 1, 1, 1,
-1.8014, -1.527911, -1.245311, 0, 0, 1, 1, 1,
-1.792592, 1.3889, 0.563942, 1, 0, 0, 1, 1,
-1.785101, 1.545491, -1.342399, 1, 0, 0, 1, 1,
-1.779366, -1.564621, -1.390644, 1, 0, 0, 1, 1,
-1.772981, -0.6121138, -0.1565601, 1, 0, 0, 1, 1,
-1.772635, 0.008129793, -1.300486, 1, 0, 0, 1, 1,
-1.75922, 0.2919005, -1.697151, 0, 0, 0, 1, 1,
-1.742334, -1.163417, -1.337238, 0, 0, 0, 1, 1,
-1.729341, 1.001303, -0.1202753, 0, 0, 0, 1, 1,
-1.719874, 0.7119165, -1.01207, 0, 0, 0, 1, 1,
-1.698966, 0.7201487, -2.115268, 0, 0, 0, 1, 1,
-1.68286, 1.761995, -2.809573, 0, 0, 0, 1, 1,
-1.67564, -0.6910911, -1.06941, 0, 0, 0, 1, 1,
-1.671127, 1.654751, -0.3201247, 1, 1, 1, 1, 1,
-1.654507, -0.256248, -1.248001, 1, 1, 1, 1, 1,
-1.637764, -1.269345, -1.392287, 1, 1, 1, 1, 1,
-1.63338, -0.5519894, -2.785501, 1, 1, 1, 1, 1,
-1.600353, -0.3067577, -2.29662, 1, 1, 1, 1, 1,
-1.595268, -0.7566383, -2.024871, 1, 1, 1, 1, 1,
-1.590515, 0.2259372, -2.180282, 1, 1, 1, 1, 1,
-1.589546, 1.053936, -2.614881, 1, 1, 1, 1, 1,
-1.576076, -0.4567888, -2.520708, 1, 1, 1, 1, 1,
-1.553144, 0.8839253, -1.643887, 1, 1, 1, 1, 1,
-1.550772, 1.155611, -1.812669, 1, 1, 1, 1, 1,
-1.54546, 0.1415898, -2.30303, 1, 1, 1, 1, 1,
-1.530167, -0.9142667, -1.465048, 1, 1, 1, 1, 1,
-1.511531, -0.3019536, -1.984959, 1, 1, 1, 1, 1,
-1.504975, 0.1493502, -1.507122, 1, 1, 1, 1, 1,
-1.500201, -0.9286659, -2.569325, 0, 0, 1, 1, 1,
-1.498758, -1.719728, -2.409145, 1, 0, 0, 1, 1,
-1.49095, -0.01087203, -1.316785, 1, 0, 0, 1, 1,
-1.489372, 1.339004, -0.08114662, 1, 0, 0, 1, 1,
-1.48813, -1.680037, -2.939388, 1, 0, 0, 1, 1,
-1.465641, -2.120446, -0.8808909, 1, 0, 0, 1, 1,
-1.458272, 1.046735, -0.6253206, 0, 0, 0, 1, 1,
-1.445662, 3.352536, -2.467241, 0, 0, 0, 1, 1,
-1.44255, 0.3908384, -3.161408, 0, 0, 0, 1, 1,
-1.431503, 0.4382215, -3.296063, 0, 0, 0, 1, 1,
-1.423309, -0.0749672, -2.387964, 0, 0, 0, 1, 1,
-1.421954, 0.02455247, -0.7401793, 0, 0, 0, 1, 1,
-1.42034, 1.02451, -1.670086, 0, 0, 0, 1, 1,
-1.406766, 0.4087296, -2.028959, 1, 1, 1, 1, 1,
-1.404605, -0.2070349, -2.763538, 1, 1, 1, 1, 1,
-1.396799, 1.007652, 1.044479, 1, 1, 1, 1, 1,
-1.396023, 0.412124, -1.046654, 1, 1, 1, 1, 1,
-1.381458, 0.06818071, -1.91767, 1, 1, 1, 1, 1,
-1.378811, 0.9120443, -0.8884125, 1, 1, 1, 1, 1,
-1.368535, -1.634429, -1.959626, 1, 1, 1, 1, 1,
-1.365462, 0.08439884, -0.5717056, 1, 1, 1, 1, 1,
-1.357329, -1.486909, -2.751012, 1, 1, 1, 1, 1,
-1.336035, 0.3050943, -2.941351, 1, 1, 1, 1, 1,
-1.325266, 0.7447013, -1.801408, 1, 1, 1, 1, 1,
-1.322724, -1.459514, -2.577833, 1, 1, 1, 1, 1,
-1.316608, -0.7643613, -1.051596, 1, 1, 1, 1, 1,
-1.313236, 0.6824754, -1.390864, 1, 1, 1, 1, 1,
-1.308929, -0.745226, -1.814269, 1, 1, 1, 1, 1,
-1.301438, -0.7418215, -1.508346, 0, 0, 1, 1, 1,
-1.299512, -0.3418322, -1.537084, 1, 0, 0, 1, 1,
-1.288895, 0.2787122, -2.793399, 1, 0, 0, 1, 1,
-1.287019, -1.314228, -2.352905, 1, 0, 0, 1, 1,
-1.28049, 0.1550273, -0.3116148, 1, 0, 0, 1, 1,
-1.268325, 1.784577, -1.105108, 1, 0, 0, 1, 1,
-1.268281, 2.886479, -1.309168, 0, 0, 0, 1, 1,
-1.263484, -0.1617247, -1.865162, 0, 0, 0, 1, 1,
-1.262337, -0.08411884, -0.3327902, 0, 0, 0, 1, 1,
-1.260445, -0.5741611, 0.6101623, 0, 0, 0, 1, 1,
-1.258266, 1.776528, 0.09925794, 0, 0, 0, 1, 1,
-1.258044, -0.6529809, -3.272366, 0, 0, 0, 1, 1,
-1.247504, 0.335595, -2.28046, 0, 0, 0, 1, 1,
-1.245302, 0.4370956, -1.33453, 1, 1, 1, 1, 1,
-1.241756, 0.5109782, -0.805399, 1, 1, 1, 1, 1,
-1.236538, -0.5033968, -3.612652, 1, 1, 1, 1, 1,
-1.231271, 0.7007701, 0.6455341, 1, 1, 1, 1, 1,
-1.22945, -1.816262, -2.149748, 1, 1, 1, 1, 1,
-1.228707, -2.188, -1.475618, 1, 1, 1, 1, 1,
-1.228342, -0.09360643, -1.127356, 1, 1, 1, 1, 1,
-1.218426, -0.07853143, -3.919324, 1, 1, 1, 1, 1,
-1.213685, -2.526858, -4.170409, 1, 1, 1, 1, 1,
-1.207739, 0.9458627, -1.659827, 1, 1, 1, 1, 1,
-1.205132, 0.7476354, -0.8097184, 1, 1, 1, 1, 1,
-1.199044, -0.6891194, -0.7112684, 1, 1, 1, 1, 1,
-1.191167, -0.4766496, -2.887263, 1, 1, 1, 1, 1,
-1.188726, -0.531342, -3.863918, 1, 1, 1, 1, 1,
-1.185756, -0.1610845, -3.425468, 1, 1, 1, 1, 1,
-1.178509, 1.013426, -0.8317891, 0, 0, 1, 1, 1,
-1.168501, 0.1582237, 0.6788546, 1, 0, 0, 1, 1,
-1.168405, 0.414762, -1.023929, 1, 0, 0, 1, 1,
-1.164718, 0.6002634, -1.319519, 1, 0, 0, 1, 1,
-1.160953, -0.1450777, -1.527371, 1, 0, 0, 1, 1,
-1.158613, 3.081365, 0.1316944, 1, 0, 0, 1, 1,
-1.156253, -1.864509, -2.422951, 0, 0, 0, 1, 1,
-1.153784, -0.5510954, -0.8866715, 0, 0, 0, 1, 1,
-1.147159, -1.196082, -2.875782, 0, 0, 0, 1, 1,
-1.143245, -0.8686953, -1.007932, 0, 0, 0, 1, 1,
-1.141304, 0.2396908, -1.381658, 0, 0, 0, 1, 1,
-1.129404, 1.449626, -1.181183, 0, 0, 0, 1, 1,
-1.125736, -0.1041391, -0.4577777, 0, 0, 0, 1, 1,
-1.125603, 0.1028763, -1.417986, 1, 1, 1, 1, 1,
-1.121178, -0.06633683, -0.3279411, 1, 1, 1, 1, 1,
-1.113638, -1.100158, -2.620617, 1, 1, 1, 1, 1,
-1.102015, -0.8636969, -3.031017, 1, 1, 1, 1, 1,
-1.101677, -0.1409681, -1.042422, 1, 1, 1, 1, 1,
-1.084163, -0.7959027, -2.113388, 1, 1, 1, 1, 1,
-1.079435, 0.8503563, 0.4464372, 1, 1, 1, 1, 1,
-1.073611, 0.8278294, -0.5309246, 1, 1, 1, 1, 1,
-1.065496, 0.1366266, -1.875732, 1, 1, 1, 1, 1,
-1.057487, -0.5663098, -2.641925, 1, 1, 1, 1, 1,
-1.056673, -0.7843211, -3.697665, 1, 1, 1, 1, 1,
-1.055521, 0.3592861, 0.1019824, 1, 1, 1, 1, 1,
-1.05184, -0.5999238, -2.328357, 1, 1, 1, 1, 1,
-1.048827, -1.289589, -4.184879, 1, 1, 1, 1, 1,
-1.048653, -1.180457, -2.232642, 1, 1, 1, 1, 1,
-1.047034, 1.825994, 0.001257545, 0, 0, 1, 1, 1,
-1.038906, -0.1630439, -1.930957, 1, 0, 0, 1, 1,
-1.032877, -0.2231997, -2.625005, 1, 0, 0, 1, 1,
-1.032435, -0.8855318, -1.22031, 1, 0, 0, 1, 1,
-1.02358, 0.09260468, 2.08074, 1, 0, 0, 1, 1,
-1.016444, 0.3127271, -1.273585, 1, 0, 0, 1, 1,
-1.011898, 0.3417396, -1.631515, 0, 0, 0, 1, 1,
-1.010863, 1.126722, 0.3110246, 0, 0, 0, 1, 1,
-1.010421, 0.7091293, -0.4328339, 0, 0, 0, 1, 1,
-1.002556, -0.7950218, -3.691773, 0, 0, 0, 1, 1,
-1.001992, -0.004137967, -3.5501, 0, 0, 0, 1, 1,
-1.001622, 2.805894, -0.3353007, 0, 0, 0, 1, 1,
-1.001134, 0.6634981, -2.380532, 0, 0, 0, 1, 1,
-0.9991027, 1.51483, -1.397462, 1, 1, 1, 1, 1,
-0.9943257, 0.7891617, -1.242016, 1, 1, 1, 1, 1,
-0.9930221, -0.9824541, -3.147079, 1, 1, 1, 1, 1,
-0.9869677, -0.3260213, 0.2285192, 1, 1, 1, 1, 1,
-0.9853585, -0.4314829, -2.609572, 1, 1, 1, 1, 1,
-0.9838147, -0.9136654, -2.139588, 1, 1, 1, 1, 1,
-0.9798859, 0.02905929, -0.5000296, 1, 1, 1, 1, 1,
-0.9734976, -0.2707299, -1.281228, 1, 1, 1, 1, 1,
-0.969891, 1.031875, -1.366216, 1, 1, 1, 1, 1,
-0.9669669, -0.6076129, -1.309814, 1, 1, 1, 1, 1,
-0.9664317, 0.1228237, 0.023783, 1, 1, 1, 1, 1,
-0.9654036, -1.236545, -3.095362, 1, 1, 1, 1, 1,
-0.9629726, -0.5077556, -3.804255, 1, 1, 1, 1, 1,
-0.9599884, -1.241895, -0.4235227, 1, 1, 1, 1, 1,
-0.9574412, -0.3605365, -1.571531, 1, 1, 1, 1, 1,
-0.9571629, -1.183411, -3.769382, 0, 0, 1, 1, 1,
-0.9554964, 0.7559429, -1.239057, 1, 0, 0, 1, 1,
-0.9528984, -1.412224, -1.438897, 1, 0, 0, 1, 1,
-0.94493, 0.5509697, -2.252195, 1, 0, 0, 1, 1,
-0.9424715, 1.228537, -2.386756, 1, 0, 0, 1, 1,
-0.9410357, 0.6808982, -0.4131459, 1, 0, 0, 1, 1,
-0.938383, -0.3340404, -2.092821, 0, 0, 0, 1, 1,
-0.935444, 1.589138, -0.9690578, 0, 0, 0, 1, 1,
-0.9349211, 0.1676582, -0.2469733, 0, 0, 0, 1, 1,
-0.9330209, 0.6562191, 0.8499856, 0, 0, 0, 1, 1,
-0.9296705, 0.7254475, 0.5737579, 0, 0, 0, 1, 1,
-0.9259874, -0.2279667, -1.721345, 0, 0, 0, 1, 1,
-0.9244248, -0.5457249, -1.670125, 0, 0, 0, 1, 1,
-0.9234807, 2.372883, 0.09287824, 1, 1, 1, 1, 1,
-0.9209649, 0.1739418, -1.009721, 1, 1, 1, 1, 1,
-0.9194358, 0.7322309, 0.07277483, 1, 1, 1, 1, 1,
-0.9171448, -1.655534, -1.859505, 1, 1, 1, 1, 1,
-0.9126166, 1.178158, 1.79825, 1, 1, 1, 1, 1,
-0.9104739, -1.032104, -3.195564, 1, 1, 1, 1, 1,
-0.9045399, -0.3736692, -3.122729, 1, 1, 1, 1, 1,
-0.8877981, -0.1278238, -1.93128, 1, 1, 1, 1, 1,
-0.8840358, 0.9920382, 1.488787, 1, 1, 1, 1, 1,
-0.882571, -0.467368, -2.051713, 1, 1, 1, 1, 1,
-0.8796172, -2.348908, -3.329727, 1, 1, 1, 1, 1,
-0.8782451, -2.131861, -1.843718, 1, 1, 1, 1, 1,
-0.8773642, -0.857042, -1.788591, 1, 1, 1, 1, 1,
-0.8764395, 0.7892743, -1.297204, 1, 1, 1, 1, 1,
-0.8741843, 1.352515, 1.501023, 1, 1, 1, 1, 1,
-0.8707249, -0.2557361, -1.557972, 0, 0, 1, 1, 1,
-0.870382, 0.4414317, -2.07128, 1, 0, 0, 1, 1,
-0.8640929, -0.6799442, -1.84721, 1, 0, 0, 1, 1,
-0.8522437, -1.029374, -1.51852, 1, 0, 0, 1, 1,
-0.8348743, -0.2738839, -1.73537, 1, 0, 0, 1, 1,
-0.833283, -1.320836, -2.571053, 1, 0, 0, 1, 1,
-0.8319511, -1.941157, -5.481901, 0, 0, 0, 1, 1,
-0.8311591, -0.5451823, -2.186056, 0, 0, 0, 1, 1,
-0.825649, -2.067473, -2.861265, 0, 0, 0, 1, 1,
-0.8256483, -1.061599, -1.851197, 0, 0, 0, 1, 1,
-0.8232593, -0.08443098, -0.9745289, 0, 0, 0, 1, 1,
-0.8028934, 0.8479878, 1.674907, 0, 0, 0, 1, 1,
-0.7955496, 2.417728, -0.8431416, 0, 0, 0, 1, 1,
-0.7873875, 0.02886569, -2.272534, 1, 1, 1, 1, 1,
-0.7828673, 0.6586839, -1.484472, 1, 1, 1, 1, 1,
-0.7779214, 1.006261, -0.8084879, 1, 1, 1, 1, 1,
-0.7744704, 0.7024502, -1.461742, 1, 1, 1, 1, 1,
-0.7618548, 0.207625, -1.758228, 1, 1, 1, 1, 1,
-0.7598717, 0.4344603, 0.3671198, 1, 1, 1, 1, 1,
-0.7529355, 1.14532, -0.1388234, 1, 1, 1, 1, 1,
-0.7528145, -0.006840109, -1.493244, 1, 1, 1, 1, 1,
-0.7470482, -0.3106899, -1.308086, 1, 1, 1, 1, 1,
-0.7447621, 0.830793, -1.658914, 1, 1, 1, 1, 1,
-0.7416518, 1.032959, 0.9512249, 1, 1, 1, 1, 1,
-0.7365416, -0.620105, -3.335576, 1, 1, 1, 1, 1,
-0.7363946, -0.9325379, -2.101789, 1, 1, 1, 1, 1,
-0.7311147, -0.3353805, -1.476697, 1, 1, 1, 1, 1,
-0.7308702, 0.04450513, -0.4213867, 1, 1, 1, 1, 1,
-0.7290782, 1.27509, -1.462513, 0, 0, 1, 1, 1,
-0.725298, -1.436546, -1.930301, 1, 0, 0, 1, 1,
-0.7236694, 1.857117, -0.4809747, 1, 0, 0, 1, 1,
-0.7230615, 0.1223326, -2.719583, 1, 0, 0, 1, 1,
-0.7153351, 0.9695914, 0.1623662, 1, 0, 0, 1, 1,
-0.7100773, -0.3935449, -2.066014, 1, 0, 0, 1, 1,
-0.7040477, 0.6722612, -1.86285, 0, 0, 0, 1, 1,
-0.6978126, 0.8210427, -1.10702, 0, 0, 0, 1, 1,
-0.6974363, -1.421388, -1.873193, 0, 0, 0, 1, 1,
-0.6926651, -1.393974, -2.986366, 0, 0, 0, 1, 1,
-0.6918721, -0.6047525, -0.5488815, 0, 0, 0, 1, 1,
-0.6833108, -0.01898217, -1.211947, 0, 0, 0, 1, 1,
-0.6808871, 1.221444, 1.740972, 0, 0, 0, 1, 1,
-0.6761369, -0.5227902, -2.253144, 1, 1, 1, 1, 1,
-0.6740888, -0.7056358, -2.673625, 1, 1, 1, 1, 1,
-0.6719687, 1.058954, -0.4481429, 1, 1, 1, 1, 1,
-0.6713024, -1.147516, -3.48192, 1, 1, 1, 1, 1,
-0.6630332, 0.2269264, -2.919287, 1, 1, 1, 1, 1,
-0.6608698, -1.471167, -1.006471, 1, 1, 1, 1, 1,
-0.6534992, 3.556639, 1.445193, 1, 1, 1, 1, 1,
-0.6529471, -0.6075813, -2.285759, 1, 1, 1, 1, 1,
-0.6525761, -0.5863379, -3.597309, 1, 1, 1, 1, 1,
-0.6467938, 0.006633813, -1.138181, 1, 1, 1, 1, 1,
-0.6461769, -0.1178986, -2.36008, 1, 1, 1, 1, 1,
-0.6435223, -1.238867, -2.276425, 1, 1, 1, 1, 1,
-0.6297473, 0.4689288, 0.2753845, 1, 1, 1, 1, 1,
-0.6296696, -0.2990989, -2.007582, 1, 1, 1, 1, 1,
-0.6168411, 0.09509022, -1.510094, 1, 1, 1, 1, 1,
-0.6143522, 0.3130403, -0.4104451, 0, 0, 1, 1, 1,
-0.6123174, -0.4437926, -0.09004236, 1, 0, 0, 1, 1,
-0.6117554, -0.4327026, -1.129285, 1, 0, 0, 1, 1,
-0.6053199, -1.627908, -3.968893, 1, 0, 0, 1, 1,
-0.6020751, 0.1176511, 0.081175, 1, 0, 0, 1, 1,
-0.6004765, 1.259936, 0.2971914, 1, 0, 0, 1, 1,
-0.5874432, 0.167713, -0.5049904, 0, 0, 0, 1, 1,
-0.581969, 1.217035, -0.7114676, 0, 0, 0, 1, 1,
-0.5764486, -0.9503883, -3.793815, 0, 0, 0, 1, 1,
-0.5733985, -2.002715, -3.476418, 0, 0, 0, 1, 1,
-0.5710692, -0.3904135, -4.237404, 0, 0, 0, 1, 1,
-0.5648561, -0.8782308, -3.650502, 0, 0, 0, 1, 1,
-0.5623713, -0.6189661, -2.201969, 0, 0, 0, 1, 1,
-0.5612618, -0.7787973, -1.967231, 1, 1, 1, 1, 1,
-0.5589148, 0.8601243, -1.160319, 1, 1, 1, 1, 1,
-0.5553747, 2.07758, -0.4383999, 1, 1, 1, 1, 1,
-0.5548542, 0.2054931, -1.952618, 1, 1, 1, 1, 1,
-0.5505453, 0.7298898, -0.2833921, 1, 1, 1, 1, 1,
-0.5489689, 0.3769682, -1.902445, 1, 1, 1, 1, 1,
-0.5455524, 0.8443986, -0.1165123, 1, 1, 1, 1, 1,
-0.5368745, 0.323992, -0.06860927, 1, 1, 1, 1, 1,
-0.5348009, -3.203913, -2.700688, 1, 1, 1, 1, 1,
-0.534165, -1.48189, -1.864558, 1, 1, 1, 1, 1,
-0.5337273, -1.013544, -3.193524, 1, 1, 1, 1, 1,
-0.5333885, 1.582433, 1.448567, 1, 1, 1, 1, 1,
-0.5312818, -0.5834771, -0.9658873, 1, 1, 1, 1, 1,
-0.529952, 0.9139009, -0.8121841, 1, 1, 1, 1, 1,
-0.529298, -0.05168016, -3.582089, 1, 1, 1, 1, 1,
-0.5289964, 0.5680205, -2.349275, 0, 0, 1, 1, 1,
-0.5267057, 0.6746639, -0.6472547, 1, 0, 0, 1, 1,
-0.5227414, -0.2388403, -2.889578, 1, 0, 0, 1, 1,
-0.5194572, -0.4933549, -2.313446, 1, 0, 0, 1, 1,
-0.5191592, -0.1068302, -2.455025, 1, 0, 0, 1, 1,
-0.5190585, -0.1623314, -1.206344, 1, 0, 0, 1, 1,
-0.5183188, 0.4000347, -1.361126, 0, 0, 0, 1, 1,
-0.5139526, -0.9507738, -2.22535, 0, 0, 0, 1, 1,
-0.5096646, 0.07642771, -1.556021, 0, 0, 0, 1, 1,
-0.5067999, -0.4926398, -1.92394, 0, 0, 0, 1, 1,
-0.504472, -0.7643332, -3.955487, 0, 0, 0, 1, 1,
-0.5001491, 0.1102221, -0.1900331, 0, 0, 0, 1, 1,
-0.4970497, -1.4019, -1.344906, 0, 0, 0, 1, 1,
-0.4952549, -0.4746391, -3.416045, 1, 1, 1, 1, 1,
-0.4935634, -0.1470298, -0.4962038, 1, 1, 1, 1, 1,
-0.4917562, -0.5288712, -2.655813, 1, 1, 1, 1, 1,
-0.4899016, -0.4532017, -1.107084, 1, 1, 1, 1, 1,
-0.4866681, 1.520174, 0.07669462, 1, 1, 1, 1, 1,
-0.4842671, -0.09296404, -1.875822, 1, 1, 1, 1, 1,
-0.4829811, 0.3682284, -1.785612, 1, 1, 1, 1, 1,
-0.4793777, -0.2523217, -0.793627, 1, 1, 1, 1, 1,
-0.4716971, 0.5054324, -1.452608, 1, 1, 1, 1, 1,
-0.4671586, 1.048776, -0.2956026, 1, 1, 1, 1, 1,
-0.4658954, -0.8014802, -2.111334, 1, 1, 1, 1, 1,
-0.4648346, 1.192338, -0.8738319, 1, 1, 1, 1, 1,
-0.4635057, -0.117244, -3.652007, 1, 1, 1, 1, 1,
-0.4619915, 0.3737969, -1.581237, 1, 1, 1, 1, 1,
-0.4594607, 0.5777116, -1.849174, 1, 1, 1, 1, 1,
-0.4571224, -0.1196627, -2.615353, 0, 0, 1, 1, 1,
-0.4539022, -0.9113433, -1.958553, 1, 0, 0, 1, 1,
-0.4528348, -1.526892, -0.9192734, 1, 0, 0, 1, 1,
-0.4500473, -0.08802891, -2.503829, 1, 0, 0, 1, 1,
-0.4481032, -0.5896299, -2.072025, 1, 0, 0, 1, 1,
-0.4452673, -0.3867575, -2.049601, 1, 0, 0, 1, 1,
-0.4441824, -0.6737544, -3.199792, 0, 0, 0, 1, 1,
-0.4402755, 1.222924, 0.1488902, 0, 0, 0, 1, 1,
-0.4388216, 1.504742, 1.433846, 0, 0, 0, 1, 1,
-0.4351665, -1.332829, -3.360949, 0, 0, 0, 1, 1,
-0.4313189, 1.333438, -0.4662027, 0, 0, 0, 1, 1,
-0.4206492, 1.00957, -0.7835447, 0, 0, 0, 1, 1,
-0.4069117, 0.2817134, -0.973138, 0, 0, 0, 1, 1,
-0.4063961, -0.2353, -2.071256, 1, 1, 1, 1, 1,
-0.403373, -0.8311769, -3.267004, 1, 1, 1, 1, 1,
-0.4013159, 0.3478939, -2.174075, 1, 1, 1, 1, 1,
-0.4001749, -1.272947, -4.055453, 1, 1, 1, 1, 1,
-0.3966745, 0.9255719, -0.3123254, 1, 1, 1, 1, 1,
-0.3924653, -0.3841631, -2.019928, 1, 1, 1, 1, 1,
-0.3913029, 0.07824568, -1.951055, 1, 1, 1, 1, 1,
-0.3905928, 1.115716, 0.2515566, 1, 1, 1, 1, 1,
-0.3888707, 1.375132, 0.5750732, 1, 1, 1, 1, 1,
-0.3857735, 1.040704, -0.2488375, 1, 1, 1, 1, 1,
-0.3852711, -0.8829724, -2.447334, 1, 1, 1, 1, 1,
-0.3833218, 0.4039653, -1.589784, 1, 1, 1, 1, 1,
-0.3817537, 0.4093915, -0.2736306, 1, 1, 1, 1, 1,
-0.3796038, -0.7346002, -2.517691, 1, 1, 1, 1, 1,
-0.3794783, 0.6707802, -0.04355036, 1, 1, 1, 1, 1,
-0.3789368, 2.02024, -1.145136, 0, 0, 1, 1, 1,
-0.3747942, 0.1428143, -0.7779441, 1, 0, 0, 1, 1,
-0.3742745, 0.995917, -1.290628, 1, 0, 0, 1, 1,
-0.3686065, 0.4367352, -0.4511559, 1, 0, 0, 1, 1,
-0.3661012, 1.303522, -1.07327, 1, 0, 0, 1, 1,
-0.3622821, -3.283695, -1.575352, 1, 0, 0, 1, 1,
-0.3613616, 0.2953185, -0.2738865, 0, 0, 0, 1, 1,
-0.3610098, -0.5214562, -2.694452, 0, 0, 0, 1, 1,
-0.3558083, 1.157486, -0.5945896, 0, 0, 0, 1, 1,
-0.3496248, -0.1484491, -3.194942, 0, 0, 0, 1, 1,
-0.3481213, -0.5575399, -2.92389, 0, 0, 0, 1, 1,
-0.3471066, -0.6635717, -1.84442, 0, 0, 0, 1, 1,
-0.3464116, 0.5052141, -0.7058008, 0, 0, 0, 1, 1,
-0.3460598, -1.719156, -3.8234, 1, 1, 1, 1, 1,
-0.345542, -0.6880047, -3.09738, 1, 1, 1, 1, 1,
-0.3424929, -0.5865173, -2.425186, 1, 1, 1, 1, 1,
-0.3348597, 0.1260882, 0.2139319, 1, 1, 1, 1, 1,
-0.3330929, -0.4050626, -2.629704, 1, 1, 1, 1, 1,
-0.3312188, -1.869081, -2.933833, 1, 1, 1, 1, 1,
-0.3291108, 0.7105738, 0.4368633, 1, 1, 1, 1, 1,
-0.3279307, -0.2367266, -2.240999, 1, 1, 1, 1, 1,
-0.3256521, -1.004248, -3.969497, 1, 1, 1, 1, 1,
-0.3218437, 0.05639036, -1.23846, 1, 1, 1, 1, 1,
-0.3201878, -1.168687, -3.794508, 1, 1, 1, 1, 1,
-0.313043, 0.3681828, -1.782257, 1, 1, 1, 1, 1,
-0.3107012, 0.7531704, -0.8735914, 1, 1, 1, 1, 1,
-0.302606, -0.3327032, -2.797463, 1, 1, 1, 1, 1,
-0.2925073, 0.5980632, -0.4041157, 1, 1, 1, 1, 1,
-0.2915528, 0.6065144, -1.188372, 0, 0, 1, 1, 1,
-0.2873062, 0.9394975, 0.7135141, 1, 0, 0, 1, 1,
-0.2849342, 0.09460524, -1.513718, 1, 0, 0, 1, 1,
-0.2808951, 0.1644986, -2.212024, 1, 0, 0, 1, 1,
-0.2766603, 1.204075, -0.5552902, 1, 0, 0, 1, 1,
-0.2747521, -0.670249, -3.387937, 1, 0, 0, 1, 1,
-0.2738453, 0.05053009, 0.5226316, 0, 0, 0, 1, 1,
-0.2722385, -1.129125, -3.061887, 0, 0, 0, 1, 1,
-0.2712146, 1.547066, 2.358495, 0, 0, 0, 1, 1,
-0.2707275, -0.3578045, -3.02339, 0, 0, 0, 1, 1,
-0.2701351, 0.4568131, -0.5934722, 0, 0, 0, 1, 1,
-0.2697571, -2.459139, -3.528205, 0, 0, 0, 1, 1,
-0.268658, 0.8653486, -0.9345622, 0, 0, 0, 1, 1,
-0.2616664, -1.667326, -2.069885, 1, 1, 1, 1, 1,
-0.2604006, -1.138212, -3.133567, 1, 1, 1, 1, 1,
-0.2580685, 0.3759156, -0.8171287, 1, 1, 1, 1, 1,
-0.2573039, -1.347132, -3.452723, 1, 1, 1, 1, 1,
-0.2555155, -1.241187, -3.948885, 1, 1, 1, 1, 1,
-0.2532489, -0.1320361, 0.2524721, 1, 1, 1, 1, 1,
-0.2411205, -1.110777, -2.447681, 1, 1, 1, 1, 1,
-0.2406439, -1.683121, -1.093193, 1, 1, 1, 1, 1,
-0.2389639, 0.5850911, -0.3026607, 1, 1, 1, 1, 1,
-0.2383553, 0.2616226, 0.6442414, 1, 1, 1, 1, 1,
-0.2351251, -1.007698, -2.873242, 1, 1, 1, 1, 1,
-0.234211, -0.9256446, -1.984026, 1, 1, 1, 1, 1,
-0.2331153, -0.07584073, -2.17163, 1, 1, 1, 1, 1,
-0.2316153, 0.3354289, 0.6895813, 1, 1, 1, 1, 1,
-0.2287456, 2.019361, 0.5801237, 1, 1, 1, 1, 1,
-0.2285052, -0.5434604, -1.366577, 0, 0, 1, 1, 1,
-0.2266564, -0.7465593, -3.846082, 1, 0, 0, 1, 1,
-0.2216712, 1.628268, 0.6466657, 1, 0, 0, 1, 1,
-0.2166104, 0.0006100992, -0.7693799, 1, 0, 0, 1, 1,
-0.2112796, -1.001279, -2.523772, 1, 0, 0, 1, 1,
-0.2079092, -1.274833, -3.959027, 1, 0, 0, 1, 1,
-0.205615, -1.930073, -4.499573, 0, 0, 0, 1, 1,
-0.2018853, -0.6819397, -5.356585, 0, 0, 0, 1, 1,
-0.2015153, 0.5464652, 0.1339755, 0, 0, 0, 1, 1,
-0.2001162, -0.2741003, -1.95684, 0, 0, 0, 1, 1,
-0.1957106, 0.3334507, -0.5560232, 0, 0, 0, 1, 1,
-0.1940284, 1.256564, 0.4425566, 0, 0, 0, 1, 1,
-0.1903127, -1.035682, -2.288679, 0, 0, 0, 1, 1,
-0.1850882, -0.1542441, -2.345355, 1, 1, 1, 1, 1,
-0.1824711, 1.388845, -2.513462, 1, 1, 1, 1, 1,
-0.1733206, -0.7779815, -3.483015, 1, 1, 1, 1, 1,
-0.1714675, 0.5914676, 0.7705443, 1, 1, 1, 1, 1,
-0.1672107, -0.5671117, -2.25089, 1, 1, 1, 1, 1,
-0.1649127, -0.7782575, -3.143647, 1, 1, 1, 1, 1,
-0.1635575, -1.803593, -0.4831291, 1, 1, 1, 1, 1,
-0.1626179, 0.2111377, 0.2668928, 1, 1, 1, 1, 1,
-0.1613511, -1.720451, -1.930761, 1, 1, 1, 1, 1,
-0.1608842, -0.3624012, 0.3368303, 1, 1, 1, 1, 1,
-0.1537623, -1.443048, -1.100537, 1, 1, 1, 1, 1,
-0.152707, 0.9018782, -1.396389, 1, 1, 1, 1, 1,
-0.1508406, -1.353369, -3.904333, 1, 1, 1, 1, 1,
-0.1500925, -0.0497473, -0.303343, 1, 1, 1, 1, 1,
-0.1480884, -0.5659937, -4.40963, 1, 1, 1, 1, 1,
-0.1471265, -0.2627873, -3.251725, 0, 0, 1, 1, 1,
-0.1403275, 0.03389648, -2.021495, 1, 0, 0, 1, 1,
-0.1375885, 1.341868, -0.4740144, 1, 0, 0, 1, 1,
-0.1374794, -1.910293, -1.911742, 1, 0, 0, 1, 1,
-0.1316879, 0.03198519, -1.982981, 1, 0, 0, 1, 1,
-0.1293062, 1.100238, 1.077012, 1, 0, 0, 1, 1,
-0.1253579, -0.9651541, -2.247227, 0, 0, 0, 1, 1,
-0.1162895, 0.9609415, 0.9209185, 0, 0, 0, 1, 1,
-0.1095467, 2.002475, -2.225461, 0, 0, 0, 1, 1,
-0.1090657, 0.5278418, 2.001446, 0, 0, 0, 1, 1,
-0.1047821, 0.6899525, 0.3680401, 0, 0, 0, 1, 1,
-0.1044872, -0.6816774, -1.243424, 0, 0, 0, 1, 1,
-0.1024974, -1.039136, -4.547624, 0, 0, 0, 1, 1,
-0.101463, -0.4805606, -2.971074, 1, 1, 1, 1, 1,
-0.1012263, 0.3627041, 0.7522337, 1, 1, 1, 1, 1,
-0.09472298, 2.42898, 0.5179496, 1, 1, 1, 1, 1,
-0.09164794, 0.04945839, -0.9037153, 1, 1, 1, 1, 1,
-0.09157424, 1.905443, 0.09956643, 1, 1, 1, 1, 1,
-0.09105428, -1.128613, -2.562177, 1, 1, 1, 1, 1,
-0.08855429, 0.154414, -0.7110369, 1, 1, 1, 1, 1,
-0.08687386, -1.063249, -1.716469, 1, 1, 1, 1, 1,
-0.08310837, -1.651198, -2.861254, 1, 1, 1, 1, 1,
-0.07329591, 0.5780671, -1.191086, 1, 1, 1, 1, 1,
-0.0657604, -0.3219685, -3.536677, 1, 1, 1, 1, 1,
-0.06488012, 1.02296, -1.490893, 1, 1, 1, 1, 1,
-0.0641591, 0.5228823, -0.5289079, 1, 1, 1, 1, 1,
-0.06222812, -1.145706, -3.133525, 1, 1, 1, 1, 1,
-0.06188375, 0.7938105, 1.983276, 1, 1, 1, 1, 1,
-0.05359804, -1.10889, -4.186216, 0, 0, 1, 1, 1,
-0.05243832, 0.0704728, -1.409642, 1, 0, 0, 1, 1,
-0.04836921, 1.798982, -0.9932978, 1, 0, 0, 1, 1,
-0.04690999, -0.01491095, -2.192428, 1, 0, 0, 1, 1,
-0.0456991, 1.202885, 1.415803, 1, 0, 0, 1, 1,
-0.04539513, 1.187523, 0.6385428, 1, 0, 0, 1, 1,
-0.04098045, -0.9249063, -2.795202, 0, 0, 0, 1, 1,
-0.04078233, 0.7095366, 0.1055504, 0, 0, 0, 1, 1,
-0.03958374, 0.9094273, -0.7680119, 0, 0, 0, 1, 1,
-0.03723642, 1.409323, -1.042949, 0, 0, 0, 1, 1,
-0.03678944, 1.481785, 0.3178645, 0, 0, 0, 1, 1,
-0.02833801, -0.5612661, -2.705009, 0, 0, 0, 1, 1,
-0.01871322, -0.6261345, -3.302438, 0, 0, 0, 1, 1,
-0.01752939, -0.0471608, -2.197301, 1, 1, 1, 1, 1,
-0.01711021, -1.015285, -3.8567, 1, 1, 1, 1, 1,
-0.01587797, -0.6973134, -2.50584, 1, 1, 1, 1, 1,
-0.015491, -0.441789, -3.546539, 1, 1, 1, 1, 1,
-0.01331641, -0.8066429, -2.785548, 1, 1, 1, 1, 1,
-0.01310471, 0.09051844, -1.101489, 1, 1, 1, 1, 1,
-0.01263416, 1.52653, -0.04267722, 1, 1, 1, 1, 1,
-0.009763566, 0.7364411, 0.2991743, 1, 1, 1, 1, 1,
-0.007753702, -1.176385, -1.854818, 1, 1, 1, 1, 1,
-0.006181372, 1.229795, -1.556144, 1, 1, 1, 1, 1,
-0.004773279, -0.1720596, -3.382513, 1, 1, 1, 1, 1,
-0.001823199, -1.390712, -4.104475, 1, 1, 1, 1, 1,
-0.001524939, 0.8737374, 1.51872, 1, 1, 1, 1, 1,
-0.00107274, 1.588636, 1.032305, 1, 1, 1, 1, 1,
0.004876471, 1.22766, 1.184246, 1, 1, 1, 1, 1,
0.01449017, -0.25453, 3.316066, 0, 0, 1, 1, 1,
0.01586706, -1.804683, 3.093261, 1, 0, 0, 1, 1,
0.01680978, 0.1275295, -0.7511068, 1, 0, 0, 1, 1,
0.02058005, -0.7958698, 4.002203, 1, 0, 0, 1, 1,
0.03273565, 0.7622909, 1.148403, 1, 0, 0, 1, 1,
0.03436233, -1.438555, 3.616036, 1, 0, 0, 1, 1,
0.0359682, -1.991353, 2.172201, 0, 0, 0, 1, 1,
0.03756677, 0.4116567, -1.155039, 0, 0, 0, 1, 1,
0.03789291, -3.07616, 2.485347, 0, 0, 0, 1, 1,
0.03843748, -0.5255821, 2.051369, 0, 0, 0, 1, 1,
0.04106387, -0.8485782, 3.999942, 0, 0, 0, 1, 1,
0.04186442, 0.3182756, -0.6513228, 0, 0, 0, 1, 1,
0.05238927, -1.731568, 2.773344, 0, 0, 0, 1, 1,
0.053868, 0.1874269, 1.473635, 1, 1, 1, 1, 1,
0.05441582, -1.178048, 3.442517, 1, 1, 1, 1, 1,
0.05705982, 0.879889, -1.827326, 1, 1, 1, 1, 1,
0.05934996, -0.1231749, 4.669873, 1, 1, 1, 1, 1,
0.06167955, 0.8981149, -0.03377714, 1, 1, 1, 1, 1,
0.06194973, -0.8288795, 1.070372, 1, 1, 1, 1, 1,
0.06240037, 2.048735, 0.1020088, 1, 1, 1, 1, 1,
0.06826075, -1.228481, 3.287097, 1, 1, 1, 1, 1,
0.06989164, -0.2052101, 2.37229, 1, 1, 1, 1, 1,
0.0707602, 1.737856, -1.611307, 1, 1, 1, 1, 1,
0.07087038, 0.1429492, 1.222126, 1, 1, 1, 1, 1,
0.07186062, 1.034822, 0.3515683, 1, 1, 1, 1, 1,
0.07208167, -0.2179034, 2.212707, 1, 1, 1, 1, 1,
0.07558905, -0.4017961, 3.210532, 1, 1, 1, 1, 1,
0.07632086, -0.4772124, 2.987619, 1, 1, 1, 1, 1,
0.08197995, 0.8326212, -0.07290765, 0, 0, 1, 1, 1,
0.08444724, 1.230777, 1.53461, 1, 0, 0, 1, 1,
0.08596861, -1.156639, 4.149157, 1, 0, 0, 1, 1,
0.08663702, 0.4017177, -0.2677821, 1, 0, 0, 1, 1,
0.09119794, -1.110824, 3.730646, 1, 0, 0, 1, 1,
0.09350429, -0.738705, 2.658244, 1, 0, 0, 1, 1,
0.09490991, -1.012361, 2.372411, 0, 0, 0, 1, 1,
0.09633027, -1.326368, 3.006115, 0, 0, 0, 1, 1,
0.09802568, -1.010071, 2.245359, 0, 0, 0, 1, 1,
0.1010932, 0.3380577, 2.147143, 0, 0, 0, 1, 1,
0.1096049, 2.337001, 0.2913521, 0, 0, 0, 1, 1,
0.1114833, -1.26315, 1.760435, 0, 0, 0, 1, 1,
0.116102, -0.8943725, 0.9476755, 0, 0, 0, 1, 1,
0.1178468, -0.5485128, 2.103024, 1, 1, 1, 1, 1,
0.1209064, -0.1643617, 0.3588019, 1, 1, 1, 1, 1,
0.121565, -0.3114055, 1.907973, 1, 1, 1, 1, 1,
0.1244576, -1.044506, 1.386611, 1, 1, 1, 1, 1,
0.1261747, 0.1215518, -0.2616045, 1, 1, 1, 1, 1,
0.1273519, -1.209886, 4.129978, 1, 1, 1, 1, 1,
0.1274627, 0.7104277, -1.687618, 1, 1, 1, 1, 1,
0.1275861, 0.05356022, -0.295665, 1, 1, 1, 1, 1,
0.1289951, -1.021049, 3.713802, 1, 1, 1, 1, 1,
0.1312023, 0.0137373, 2.234313, 1, 1, 1, 1, 1,
0.1327322, 0.1232937, 0.7078972, 1, 1, 1, 1, 1,
0.1328272, -1.32332, 2.727769, 1, 1, 1, 1, 1,
0.1330938, 0.7438079, 1.351686, 1, 1, 1, 1, 1,
0.1344792, -0.8917475, 3.18068, 1, 1, 1, 1, 1,
0.1381269, -0.1651712, 1.607608, 1, 1, 1, 1, 1,
0.1434258, 0.3931803, -0.6595404, 0, 0, 1, 1, 1,
0.1460547, 0.8156784, -1.075929, 1, 0, 0, 1, 1,
0.155295, -1.032426, 2.495304, 1, 0, 0, 1, 1,
0.1579939, 0.3380924, -0.3087378, 1, 0, 0, 1, 1,
0.1595799, 0.9119862, 0.7403065, 1, 0, 0, 1, 1,
0.1606689, 0.6242245, 2.016023, 1, 0, 0, 1, 1,
0.1612075, -0.9039366, 3.491455, 0, 0, 0, 1, 1,
0.1622322, -1.461284, 4.203339, 0, 0, 0, 1, 1,
0.1637929, -0.01263747, 1.406917, 0, 0, 0, 1, 1,
0.1641931, -1.025056, 3.044943, 0, 0, 0, 1, 1,
0.1670991, 0.7559143, -0.006265158, 0, 0, 0, 1, 1,
0.1686873, 1.060245, 0.09735202, 0, 0, 0, 1, 1,
0.1695734, -0.4039273, 1.085548, 0, 0, 0, 1, 1,
0.1701071, 0.5341026, -1.369043, 1, 1, 1, 1, 1,
0.1749272, -1.013023, 2.272892, 1, 1, 1, 1, 1,
0.177408, -0.03475697, 1.771186, 1, 1, 1, 1, 1,
0.1784808, -0.5283675, 3.888185, 1, 1, 1, 1, 1,
0.1822456, -0.4674082, 2.744621, 1, 1, 1, 1, 1,
0.1848708, -0.1162764, 3.301207, 1, 1, 1, 1, 1,
0.1856291, 0.4001043, -0.5418662, 1, 1, 1, 1, 1,
0.1876982, 1.376529, -0.4439974, 1, 1, 1, 1, 1,
0.1895738, 0.4316222, 0.0003718541, 1, 1, 1, 1, 1,
0.189773, 0.4475912, 1.828624, 1, 1, 1, 1, 1,
0.1899038, 1.973371, -0.5602922, 1, 1, 1, 1, 1,
0.1903338, -0.2723472, 0.9298083, 1, 1, 1, 1, 1,
0.1905389, -0.4796392, 3.341699, 1, 1, 1, 1, 1,
0.1905535, -0.1291056, 3.769797, 1, 1, 1, 1, 1,
0.1913023, 1.626824, 0.9245374, 1, 1, 1, 1, 1,
0.1915643, -0.9579286, 2.41175, 0, 0, 1, 1, 1,
0.1925544, 0.1443711, 0.9392919, 1, 0, 0, 1, 1,
0.1963277, -0.0254993, 2.587233, 1, 0, 0, 1, 1,
0.2010664, -1.378533, 0.9492221, 1, 0, 0, 1, 1,
0.2042512, 0.6167006, 2.108721, 1, 0, 0, 1, 1,
0.2069997, -0.3484016, 3.780854, 1, 0, 0, 1, 1,
0.2088913, -0.1588745, 1.290924, 0, 0, 0, 1, 1,
0.2091875, -0.8270828, 4.168612, 0, 0, 0, 1, 1,
0.2124518, -0.5270957, 1.712733, 0, 0, 0, 1, 1,
0.2173731, -1.19074, 2.926946, 0, 0, 0, 1, 1,
0.2211823, 0.5869483, -0.3568848, 0, 0, 0, 1, 1,
0.2234199, -0.5658094, 2.194427, 0, 0, 0, 1, 1,
0.2249108, 1.665436, 0.5100895, 0, 0, 0, 1, 1,
0.2252152, -0.5302427, 2.387452, 1, 1, 1, 1, 1,
0.2282221, 0.9859157, 0.7511125, 1, 1, 1, 1, 1,
0.2286644, -1.259125, 4.372625, 1, 1, 1, 1, 1,
0.2300323, 0.1911597, 0.4100075, 1, 1, 1, 1, 1,
0.2303081, 0.8536, 0.9790198, 1, 1, 1, 1, 1,
0.2313465, -0.2338637, 2.819371, 1, 1, 1, 1, 1,
0.2354973, 1.834011, -0.3717112, 1, 1, 1, 1, 1,
0.2372595, -0.8255118, 1.877723, 1, 1, 1, 1, 1,
0.2373813, 1.094083, 1.059641, 1, 1, 1, 1, 1,
0.2404302, 0.4770972, -0.4914359, 1, 1, 1, 1, 1,
0.242148, 1.35262, -2.138216, 1, 1, 1, 1, 1,
0.244867, 1.037739, 1.975248, 1, 1, 1, 1, 1,
0.2486217, -0.7469638, 4.293931, 1, 1, 1, 1, 1,
0.2508135, 0.4876779, -0.4781145, 1, 1, 1, 1, 1,
0.2563665, -0.4558848, 4.333924, 1, 1, 1, 1, 1,
0.2563771, 1.049954, -0.3911636, 0, 0, 1, 1, 1,
0.2592855, 1.045931, 0.1238965, 1, 0, 0, 1, 1,
0.2604081, 1.317717, 2.375421, 1, 0, 0, 1, 1,
0.2667057, 1.576538, 0.03810035, 1, 0, 0, 1, 1,
0.2669477, 0.6673792, 1.029365, 1, 0, 0, 1, 1,
0.2693079, -1.171521, 3.154375, 1, 0, 0, 1, 1,
0.2703932, -0.7866195, 2.498315, 0, 0, 0, 1, 1,
0.2782037, -2.328388, 4.27013, 0, 0, 0, 1, 1,
0.2831224, 1.093032, 0.5717596, 0, 0, 0, 1, 1,
0.2840568, -1.682547, 0.9575701, 0, 0, 0, 1, 1,
0.2891531, -0.4688221, 2.029553, 0, 0, 0, 1, 1,
0.2926575, -1.274208, 3.405463, 0, 0, 0, 1, 1,
0.2959034, 0.4594189, 0.8166441, 0, 0, 0, 1, 1,
0.3001501, 0.01211662, 0.670572, 1, 1, 1, 1, 1,
0.3038419, -1.350175, 3.332961, 1, 1, 1, 1, 1,
0.3039981, -1.697763, 1.838194, 1, 1, 1, 1, 1,
0.3072604, 0.8277596, 1.952065, 1, 1, 1, 1, 1,
0.3085657, 0.3109198, 0.4794669, 1, 1, 1, 1, 1,
0.3087806, 0.6344192, -0.8615604, 1, 1, 1, 1, 1,
0.3110351, 2.250514, 0.3978555, 1, 1, 1, 1, 1,
0.3146004, -0.9075368, 2.020756, 1, 1, 1, 1, 1,
0.3163108, 0.6145625, -1.581383, 1, 1, 1, 1, 1,
0.3267885, -0.172239, 2.261403, 1, 1, 1, 1, 1,
0.3287747, 0.7066367, -0.5279161, 1, 1, 1, 1, 1,
0.3303954, 0.7715692, -0.2653908, 1, 1, 1, 1, 1,
0.3315111, 1.607664, -0.5602816, 1, 1, 1, 1, 1,
0.3363276, 2.048725, -0.2160735, 1, 1, 1, 1, 1,
0.3378115, 0.4188553, 0.03167269, 1, 1, 1, 1, 1,
0.3383926, -0.5102302, 2.294399, 0, 0, 1, 1, 1,
0.343097, -0.9797782, 3.161733, 1, 0, 0, 1, 1,
0.3444809, -2.107293, 1.33654, 1, 0, 0, 1, 1,
0.3450656, -0.5756215, 3.940862, 1, 0, 0, 1, 1,
0.3484099, -0.8125505, 2.941913, 1, 0, 0, 1, 1,
0.3495031, 1.350162, 1.993251, 1, 0, 0, 1, 1,
0.3521909, 2.148715, 0.2081058, 0, 0, 0, 1, 1,
0.3525916, 0.3102987, 1.1438, 0, 0, 0, 1, 1,
0.3618334, -0.03272967, 2.508694, 0, 0, 0, 1, 1,
0.3638088, 2.486572, -0.394024, 0, 0, 0, 1, 1,
0.3654254, -1.702053, 3.030587, 0, 0, 0, 1, 1,
0.3738561, 1.078541, -2.059159, 0, 0, 0, 1, 1,
0.3749763, -0.2759687, 1.529242, 0, 0, 0, 1, 1,
0.3769945, -0.8660548, 1.334276, 1, 1, 1, 1, 1,
0.3779937, -0.04031707, 0.2948939, 1, 1, 1, 1, 1,
0.3780479, -0.02160671, 2.740229, 1, 1, 1, 1, 1,
0.3820617, -0.3791578, 2.812718, 1, 1, 1, 1, 1,
0.3838958, -1.243922, 2.929254, 1, 1, 1, 1, 1,
0.3857855, 1.041224, 1.128043, 1, 1, 1, 1, 1,
0.3865784, -0.2312841, 4.587143, 1, 1, 1, 1, 1,
0.3935187, 0.4381616, 1.30022, 1, 1, 1, 1, 1,
0.3952896, 0.02639199, 1.024848, 1, 1, 1, 1, 1,
0.397861, -0.8987077, 2.233793, 1, 1, 1, 1, 1,
0.3988748, 0.1101382, 2.956057, 1, 1, 1, 1, 1,
0.4003171, -0.6535245, 3.279739, 1, 1, 1, 1, 1,
0.4021942, 0.7217481, 3.027262, 1, 1, 1, 1, 1,
0.4052197, 0.5947337, 1.206818, 1, 1, 1, 1, 1,
0.41044, -1.996027, 1.5901, 1, 1, 1, 1, 1,
0.4134678, -1.050031, 4.39749, 0, 0, 1, 1, 1,
0.4199308, -2.156127, 4.481285, 1, 0, 0, 1, 1,
0.4217271, -0.1897036, 2.609412, 1, 0, 0, 1, 1,
0.4242531, -0.4424799, 1.268072, 1, 0, 0, 1, 1,
0.4304933, -1.142959, 3.863135, 1, 0, 0, 1, 1,
0.4330633, -0.5296531, 2.130815, 1, 0, 0, 1, 1,
0.4367152, -0.6846266, 3.585763, 0, 0, 0, 1, 1,
0.4372958, -0.7358387, 4.467295, 0, 0, 0, 1, 1,
0.4413452, 0.8832136, -1.169432, 0, 0, 0, 1, 1,
0.4473477, -0.6316936, 2.707766, 0, 0, 0, 1, 1,
0.4516012, 1.089978, 1.015955, 0, 0, 0, 1, 1,
0.45205, -1.832215, 2.228579, 0, 0, 0, 1, 1,
0.4527729, 1.440034, 1.903242, 0, 0, 0, 1, 1,
0.4545501, -0.3243757, 1.000787, 1, 1, 1, 1, 1,
0.4559979, 0.686343, 0.5006438, 1, 1, 1, 1, 1,
0.4563377, 1.144149, -0.8553989, 1, 1, 1, 1, 1,
0.4582005, 0.7021546, 0.550113, 1, 1, 1, 1, 1,
0.4625739, -0.1644896, 0.633405, 1, 1, 1, 1, 1,
0.4659882, 0.08933063, 0.2348439, 1, 1, 1, 1, 1,
0.4704754, 0.2243125, 0.3658031, 1, 1, 1, 1, 1,
0.4707339, -0.3730837, 3.746845, 1, 1, 1, 1, 1,
0.4716496, -0.3207608, 1.51888, 1, 1, 1, 1, 1,
0.4732095, 0.1936541, -0.6817612, 1, 1, 1, 1, 1,
0.4749269, -1.429363, 3.646523, 1, 1, 1, 1, 1,
0.4805145, -0.4990157, 3.259657, 1, 1, 1, 1, 1,
0.4827133, -0.2242931, 2.28033, 1, 1, 1, 1, 1,
0.4858228, -0.2504375, 2.517723, 1, 1, 1, 1, 1,
0.4868715, 1.392441, 0.7517242, 1, 1, 1, 1, 1,
0.4949897, 0.664483, 2.114296, 0, 0, 1, 1, 1,
0.4981042, 0.07828495, 0.8004339, 1, 0, 0, 1, 1,
0.5060577, 0.1661897, 0.02941955, 1, 0, 0, 1, 1,
0.5080593, -1.878272, 2.771656, 1, 0, 0, 1, 1,
0.5083684, -1.896383, 3.273757, 1, 0, 0, 1, 1,
0.5097453, -0.9818298, 2.11283, 1, 0, 0, 1, 1,
0.5112739, -0.6838285, 1.855615, 0, 0, 0, 1, 1,
0.511977, 1.860242, -0.03734105, 0, 0, 0, 1, 1,
0.5120738, -0.2887036, 2.053051, 0, 0, 0, 1, 1,
0.5125758, 0.1193618, 1.174829, 0, 0, 0, 1, 1,
0.5177574, -1.296145, 3.290429, 0, 0, 0, 1, 1,
0.5192242, -1.831063, 3.260834, 0, 0, 0, 1, 1,
0.5223573, -1.488605, 1.219839, 0, 0, 0, 1, 1,
0.5236231, 0.5067381, 0.9657224, 1, 1, 1, 1, 1,
0.5241249, 1.593456, -0.03542912, 1, 1, 1, 1, 1,
0.5256609, 2.748475, 0.2788321, 1, 1, 1, 1, 1,
0.5326189, 0.5424112, 1.243251, 1, 1, 1, 1, 1,
0.5331237, -0.6068591, 3.407479, 1, 1, 1, 1, 1,
0.539957, 2.089474, 1.072104, 1, 1, 1, 1, 1,
0.5441735, 0.4230152, 0.3035677, 1, 1, 1, 1, 1,
0.5536996, 1.547521, -1.427034, 1, 1, 1, 1, 1,
0.5593422, -1.467994, 5.662681, 1, 1, 1, 1, 1,
0.5596069, 0.1216576, 2.087128, 1, 1, 1, 1, 1,
0.5612641, 0.672186, 1.768998, 1, 1, 1, 1, 1,
0.5624856, -0.263734, 4.095708, 1, 1, 1, 1, 1,
0.5675653, -1.218587, 2.716079, 1, 1, 1, 1, 1,
0.571601, 0.5475677, 1.134197, 1, 1, 1, 1, 1,
0.5717821, 2.00536, 0.07182215, 1, 1, 1, 1, 1,
0.5753494, -0.7102921, 3.176184, 0, 0, 1, 1, 1,
0.5755808, -0.7732437, 2.032874, 1, 0, 0, 1, 1,
0.5773752, 0.04589826, 1.501223, 1, 0, 0, 1, 1,
0.5773778, 1.335027, 0.4791668, 1, 0, 0, 1, 1,
0.5804777, 0.181918, 2.459426, 1, 0, 0, 1, 1,
0.5844812, -0.6108957, 0.6585738, 1, 0, 0, 1, 1,
0.5846789, 1.425064, 0.9658412, 0, 0, 0, 1, 1,
0.5859448, -1.743239, 3.06236, 0, 0, 0, 1, 1,
0.5870113, -1.223491, 1.7207, 0, 0, 0, 1, 1,
0.5928071, 2.257253, 0.4870205, 0, 0, 0, 1, 1,
0.5972502, 1.064627, 0.4641353, 0, 0, 0, 1, 1,
0.6009862, -1.015742, 4.020479, 0, 0, 0, 1, 1,
0.6077011, -0.8056204, 3.339615, 0, 0, 0, 1, 1,
0.6117215, 1.278747, 1.150956, 1, 1, 1, 1, 1,
0.6137072, 0.4228438, -1.043773, 1, 1, 1, 1, 1,
0.6167054, 0.3959137, 1.628556, 1, 1, 1, 1, 1,
0.6188975, 0.8934759, 0.5721617, 1, 1, 1, 1, 1,
0.6203121, 0.8277671, 1.281668, 1, 1, 1, 1, 1,
0.6204563, 0.9416151, 0.4593999, 1, 1, 1, 1, 1,
0.6208888, -1.206763, 2.612945, 1, 1, 1, 1, 1,
0.6253144, 0.4068935, 1.881325, 1, 1, 1, 1, 1,
0.6363365, -0.7573431, 1.490033, 1, 1, 1, 1, 1,
0.639309, 1.124572, 0.0571909, 1, 1, 1, 1, 1,
0.6435937, -1.412882, 2.081735, 1, 1, 1, 1, 1,
0.6542082, 2.124979, -1.42143, 1, 1, 1, 1, 1,
0.6562346, -0.987513, 2.270627, 1, 1, 1, 1, 1,
0.6589038, 0.1345292, 0.4058098, 1, 1, 1, 1, 1,
0.6623208, -0.4749273, 1.089851, 1, 1, 1, 1, 1,
0.6624313, 0.4439155, 0.3056704, 0, 0, 1, 1, 1,
0.664362, -0.2855258, 1.915065, 1, 0, 0, 1, 1,
0.669136, -0.6605448, 2.888283, 1, 0, 0, 1, 1,
0.6722187, 0.4639366, -1.071211, 1, 0, 0, 1, 1,
0.6797087, -0.1588132, -0.8808615, 1, 0, 0, 1, 1,
0.6838845, -1.060207, 3.478403, 1, 0, 0, 1, 1,
0.6866189, -0.001807513, 2.731581, 0, 0, 0, 1, 1,
0.6881672, -0.6006566, 1.458482, 0, 0, 0, 1, 1,
0.6891459, 0.8782594, 1.857714, 0, 0, 0, 1, 1,
0.6976253, -0.7330607, 0.4329627, 0, 0, 0, 1, 1,
0.6993955, -0.3426026, 0.9914449, 0, 0, 0, 1, 1,
0.7006093, 0.2887397, 1.745064, 0, 0, 0, 1, 1,
0.7015994, 0.07548805, 2.44145, 0, 0, 0, 1, 1,
0.70394, 2.300842, -0.490496, 1, 1, 1, 1, 1,
0.7040286, -0.6714773, 2.977714, 1, 1, 1, 1, 1,
0.7159377, -0.5038888, 2.450719, 1, 1, 1, 1, 1,
0.725195, -0.4458687, 3.034313, 1, 1, 1, 1, 1,
0.7259061, 1.704208, 0.1144066, 1, 1, 1, 1, 1,
0.7312974, 0.7930731, 0.1442219, 1, 1, 1, 1, 1,
0.7314109, 0.008345951, 1.326818, 1, 1, 1, 1, 1,
0.7333075, 0.8992344, 1.057584, 1, 1, 1, 1, 1,
0.742768, 1.470076, 0.8871613, 1, 1, 1, 1, 1,
0.7454096, 0.8006116, 1.386204, 1, 1, 1, 1, 1,
0.745442, -0.1557636, 1.127737, 1, 1, 1, 1, 1,
0.7567722, -1.055199, 3.619923, 1, 1, 1, 1, 1,
0.7590106, 1.016841, -0.6043661, 1, 1, 1, 1, 1,
0.7605004, -0.2463856, 1.704389, 1, 1, 1, 1, 1,
0.7613751, 0.6554787, -0.3267168, 1, 1, 1, 1, 1,
0.7623041, 0.1224923, 2.339785, 0, 0, 1, 1, 1,
0.7642478, 0.9287392, 0.4289838, 1, 0, 0, 1, 1,
0.7644481, -0.7322432, 1.828311, 1, 0, 0, 1, 1,
0.767453, -1.064784, 3.479879, 1, 0, 0, 1, 1,
0.7784343, 1.285242, 1.639734, 1, 0, 0, 1, 1,
0.7810259, -0.1610916, 1.527735, 1, 0, 0, 1, 1,
0.78383, -1.691892, 3.145646, 0, 0, 0, 1, 1,
0.7839494, -0.4001625, 1.954822, 0, 0, 0, 1, 1,
0.7876124, -0.1821258, 1.32261, 0, 0, 0, 1, 1,
0.7900094, -0.1944577, 0.3742616, 0, 0, 0, 1, 1,
0.7917588, 1.196194, -0.3548617, 0, 0, 0, 1, 1,
0.7937309, 0.4568053, 0.2938568, 0, 0, 0, 1, 1,
0.7996051, -0.2474462, 2.983237, 0, 0, 0, 1, 1,
0.806136, 0.00391427, 1.889758, 1, 1, 1, 1, 1,
0.8066962, 0.6040901, 1.621618, 1, 1, 1, 1, 1,
0.8089991, 1.203899, 0.03764716, 1, 1, 1, 1, 1,
0.8097488, 0.8522575, 0.9945781, 1, 1, 1, 1, 1,
0.811472, -0.2556906, 2.321349, 1, 1, 1, 1, 1,
0.8139967, 1.132428, -0.07290613, 1, 1, 1, 1, 1,
0.8147018, -0.8943105, 1.673036, 1, 1, 1, 1, 1,
0.8194845, 1.035853, -0.01044891, 1, 1, 1, 1, 1,
0.8228393, -1.182789, 2.463305, 1, 1, 1, 1, 1,
0.8235496, 0.3885692, 1.51754, 1, 1, 1, 1, 1,
0.8305119, 0.09841127, 0.2009811, 1, 1, 1, 1, 1,
0.8306369, -0.5042958, 0.3149233, 1, 1, 1, 1, 1,
0.8326663, 1.285319, 0.2310372, 1, 1, 1, 1, 1,
0.8484787, 0.1216108, 0.02883227, 1, 1, 1, 1, 1,
0.8485571, -0.521733, 1.758428, 1, 1, 1, 1, 1,
0.8491262, -0.5287153, 2.56564, 0, 0, 1, 1, 1,
0.8502386, -0.6160561, 2.083677, 1, 0, 0, 1, 1,
0.8507638, 0.2178633, 1.637682, 1, 0, 0, 1, 1,
0.856723, 1.807531, -0.9807287, 1, 0, 0, 1, 1,
0.8587139, -0.6950971, 3.357821, 1, 0, 0, 1, 1,
0.8605446, -0.9558682, 2.796096, 1, 0, 0, 1, 1,
0.8623987, 2.807975, 0.5459133, 0, 0, 0, 1, 1,
0.8624153, 0.02603745, 2.235136, 0, 0, 0, 1, 1,
0.863716, 0.1282576, 0.7540677, 0, 0, 0, 1, 1,
0.8655217, -0.9764869, 3.00984, 0, 0, 0, 1, 1,
0.8779331, -0.1162153, 2.413617, 0, 0, 0, 1, 1,
0.8799344, -1.052743, 2.475732, 0, 0, 0, 1, 1,
0.8835714, -1.154556, 3.039047, 0, 0, 0, 1, 1,
0.884045, -0.4795696, 0.9542296, 1, 1, 1, 1, 1,
0.8841153, -1.0082, 1.828219, 1, 1, 1, 1, 1,
0.8866808, 0.8099555, 0.4781637, 1, 1, 1, 1, 1,
0.8900886, 0.3447055, 2.609878, 1, 1, 1, 1, 1,
0.8913155, -0.3510058, 1.785095, 1, 1, 1, 1, 1,
0.8938399, -0.607224, 0.1626486, 1, 1, 1, 1, 1,
0.8957294, -0.9115597, 2.068668, 1, 1, 1, 1, 1,
0.9000145, 0.6796978, -0.0595932, 1, 1, 1, 1, 1,
0.9008424, 0.6740558, 0.4848031, 1, 1, 1, 1, 1,
0.9066623, 0.1817601, 1.946165, 1, 1, 1, 1, 1,
0.9097863, 0.463404, 0.845395, 1, 1, 1, 1, 1,
0.9123062, -0.2666623, 1.603783, 1, 1, 1, 1, 1,
0.9145857, -0.491274, 3.85676, 1, 1, 1, 1, 1,
0.9160167, -0.9885554, 2.218182, 1, 1, 1, 1, 1,
0.9275458, 1.40425, 1.488039, 1, 1, 1, 1, 1,
0.9331245, 0.3335194, 1.58119, 0, 0, 1, 1, 1,
0.9385234, 1.274878, 1.159863, 1, 0, 0, 1, 1,
0.9427584, 0.1322335, 3.228736, 1, 0, 0, 1, 1,
0.9455947, -0.9876519, 1.945769, 1, 0, 0, 1, 1,
0.9470691, 0.2001248, 1.274684, 1, 0, 0, 1, 1,
0.9505777, -0.9932534, 1.319974, 1, 0, 0, 1, 1,
0.9521054, -0.8271332, 2.873364, 0, 0, 0, 1, 1,
0.9604643, -0.4300961, 3.10544, 0, 0, 0, 1, 1,
0.9622318, -0.5436634, 1.739283, 0, 0, 0, 1, 1,
0.9668461, 0.348646, 2.851521, 0, 0, 0, 1, 1,
0.9673514, -1.005448, 1.663893, 0, 0, 0, 1, 1,
0.9700492, 0.2761113, 2.206626, 0, 0, 0, 1, 1,
0.9899834, -0.0712737, 1.923027, 0, 0, 0, 1, 1,
0.9920509, 0.6599615, -1.143789, 1, 1, 1, 1, 1,
1.003624, 0.2616141, 2.350443, 1, 1, 1, 1, 1,
1.006617, -0.8443323, 3.459729, 1, 1, 1, 1, 1,
1.012543, 0.3501279, 1.022033, 1, 1, 1, 1, 1,
1.015902, 0.3164537, 1.793905, 1, 1, 1, 1, 1,
1.020335, -1.125793, 2.291878, 1, 1, 1, 1, 1,
1.036345, -0.7310771, 1.769888, 1, 1, 1, 1, 1,
1.038071, 0.4544637, 1.835755, 1, 1, 1, 1, 1,
1.039136, 0.2341952, 0.1561489, 1, 1, 1, 1, 1,
1.042606, 0.7943001, 0.6145778, 1, 1, 1, 1, 1,
1.045446, 0.8981135, 1.470911, 1, 1, 1, 1, 1,
1.066765, 0.08741336, 0.7059283, 1, 1, 1, 1, 1,
1.067556, -1.299791, 2.342461, 1, 1, 1, 1, 1,
1.070467, 1.43899, -1.179209, 1, 1, 1, 1, 1,
1.070602, -1.131757, 2.237309, 1, 1, 1, 1, 1,
1.073327, -1.001932, 1.638509, 0, 0, 1, 1, 1,
1.073743, -0.530824, 1.075573, 1, 0, 0, 1, 1,
1.075335, -0.260196, 1.644012, 1, 0, 0, 1, 1,
1.077872, -1.094067, 2.580775, 1, 0, 0, 1, 1,
1.079138, 2.582019, 1.280612, 1, 0, 0, 1, 1,
1.081403, 1.203096, 0.977409, 1, 0, 0, 1, 1,
1.081546, 1.266394, -0.77941, 0, 0, 0, 1, 1,
1.08567, -0.1264931, 1.564117, 0, 0, 0, 1, 1,
1.086915, 0.004115591, 2.541026, 0, 0, 0, 1, 1,
1.088134, -0.8693445, 1.509766, 0, 0, 0, 1, 1,
1.089248, -0.744208, 3.19302, 0, 0, 0, 1, 1,
1.101932, 0.2192195, 3.447014, 0, 0, 0, 1, 1,
1.102883, 0.3646964, 1.763067, 0, 0, 0, 1, 1,
1.10325, -0.1540923, 1.583885, 1, 1, 1, 1, 1,
1.107732, -1.637038, 1.324363, 1, 1, 1, 1, 1,
1.109577, -0.4085442, 1.845623, 1, 1, 1, 1, 1,
1.119362, 0.8293421, 1.217779, 1, 1, 1, 1, 1,
1.125944, -0.2579061, 1.226718, 1, 1, 1, 1, 1,
1.126532, 0.3319045, 1.874007, 1, 1, 1, 1, 1,
1.129152, 1.273486, -0.9828925, 1, 1, 1, 1, 1,
1.130617, -1.633424, 2.56381, 1, 1, 1, 1, 1,
1.131949, -0.2260054, 1.650075, 1, 1, 1, 1, 1,
1.144352, -1.486939, 3.513, 1, 1, 1, 1, 1,
1.145194, -2.527764, 4.126245, 1, 1, 1, 1, 1,
1.148282, -0.8377213, 1.851653, 1, 1, 1, 1, 1,
1.15391, -0.04415089, 0.4487532, 1, 1, 1, 1, 1,
1.154883, -0.535767, 2.132269, 1, 1, 1, 1, 1,
1.155381, 0.7333725, 0.1133874, 1, 1, 1, 1, 1,
1.155606, -0.172319, 2.965045, 0, 0, 1, 1, 1,
1.156403, 1.182636, 1.943765, 1, 0, 0, 1, 1,
1.170843, -1.188527, 2.656861, 1, 0, 0, 1, 1,
1.172622, -0.03645475, 1.73761, 1, 0, 0, 1, 1,
1.173886, -0.1333355, 0.8678241, 1, 0, 0, 1, 1,
1.175286, -0.5908756, 2.760998, 1, 0, 0, 1, 1,
1.175534, -0.0006819469, 2.283742, 0, 0, 0, 1, 1,
1.17584, -0.6493688, 1.396249, 0, 0, 0, 1, 1,
1.177363, -1.177612, 3.115787, 0, 0, 0, 1, 1,
1.186949, -0.8001495, 2.127159, 0, 0, 0, 1, 1,
1.187515, 0.6364713, 3.667001, 0, 0, 0, 1, 1,
1.18761, -0.7589427, 2.273757, 0, 0, 0, 1, 1,
1.192784, -0.8226151, 2.206839, 0, 0, 0, 1, 1,
1.195538, -1.409575, 2.486995, 1, 1, 1, 1, 1,
1.197685, 1.537994, 1.166654, 1, 1, 1, 1, 1,
1.218779, 1.49208, 0.4749849, 1, 1, 1, 1, 1,
1.22583, -0.2993113, 0.4602633, 1, 1, 1, 1, 1,
1.226319, -1.139107, 2.880326, 1, 1, 1, 1, 1,
1.229035, -0.3922101, 2.351415, 1, 1, 1, 1, 1,
1.232479, -1.554193, 2.167707, 1, 1, 1, 1, 1,
1.233092, 0.8441036, 1.228063, 1, 1, 1, 1, 1,
1.236572, 1.17536, 1.110619, 1, 1, 1, 1, 1,
1.239123, 1.135252, 1.48885, 1, 1, 1, 1, 1,
1.240674, -0.5745133, 1.374827, 1, 1, 1, 1, 1,
1.243289, 0.4374246, 0.6490182, 1, 1, 1, 1, 1,
1.24878, 0.3555895, 1.525593, 1, 1, 1, 1, 1,
1.250641, 0.9448494, 0.2147565, 1, 1, 1, 1, 1,
1.250817, -0.9933327, 2.155467, 1, 1, 1, 1, 1,
1.251543, -0.6910095, 3.257607, 0, 0, 1, 1, 1,
1.257199, 0.4028604, 1.884158, 1, 0, 0, 1, 1,
1.259101, 1.254491, 1.180435, 1, 0, 0, 1, 1,
1.273735, -0.1923513, 2.227707, 1, 0, 0, 1, 1,
1.275977, 1.316773, 1.123441, 1, 0, 0, 1, 1,
1.276136, -1.346262, 3.162228, 1, 0, 0, 1, 1,
1.280226, 1.829853, 0.6060922, 0, 0, 0, 1, 1,
1.283522, 0.09248511, 1.077883, 0, 0, 0, 1, 1,
1.286277, 0.9408231, -0.3218408, 0, 0, 0, 1, 1,
1.291674, -0.3995802, 4.316401, 0, 0, 0, 1, 1,
1.304109, -0.4037987, 2.395481, 0, 0, 0, 1, 1,
1.315217, 0.5687389, 1.434018, 0, 0, 0, 1, 1,
1.336321, 1.047274, 0.1687191, 0, 0, 0, 1, 1,
1.337731, 0.9197994, 0.4143154, 1, 1, 1, 1, 1,
1.342158, -0.9516334, 1.765783, 1, 1, 1, 1, 1,
1.343356, 1.646638, 0.370218, 1, 1, 1, 1, 1,
1.358894, -0.7288797, 3.211538, 1, 1, 1, 1, 1,
1.366254, 0.7177162, -0.909959, 1, 1, 1, 1, 1,
1.374586, 0.2171943, 1.808789, 1, 1, 1, 1, 1,
1.374784, 0.1599185, 3.606013, 1, 1, 1, 1, 1,
1.394294, 1.8324, -0.229608, 1, 1, 1, 1, 1,
1.409062, -1.24358, 2.293708, 1, 1, 1, 1, 1,
1.414004, -1.204198, 1.79668, 1, 1, 1, 1, 1,
1.416115, -1.230687, 1.43921, 1, 1, 1, 1, 1,
1.424842, -1.243551, 2.692139, 1, 1, 1, 1, 1,
1.434877, 0.828034, 1.93535, 1, 1, 1, 1, 1,
1.437716, 0.9865189, 0.7496762, 1, 1, 1, 1, 1,
1.43867, -0.3787709, 3.61041, 1, 1, 1, 1, 1,
1.4566, -0.775561, 2.304938, 0, 0, 1, 1, 1,
1.483679, -0.977882, 1.276857, 1, 0, 0, 1, 1,
1.498419, -0.5527689, 1.441863, 1, 0, 0, 1, 1,
1.498825, -1.965554, 3.032293, 1, 0, 0, 1, 1,
1.505599, 1.98087, -1.819499, 1, 0, 0, 1, 1,
1.507885, 1.391897, 2.533498, 1, 0, 0, 1, 1,
1.514702, -0.06964508, 0.1641513, 0, 0, 0, 1, 1,
1.515766, -0.9860664, 0.1842076, 0, 0, 0, 1, 1,
1.52389, 0.123069, 1.45293, 0, 0, 0, 1, 1,
1.527888, 0.1882088, 0.3768308, 0, 0, 0, 1, 1,
1.532125, 0.113521, 1.070631, 0, 0, 0, 1, 1,
1.537603, 0.7019296, 1.756493, 0, 0, 0, 1, 1,
1.541473, 0.4398296, 0.9378155, 0, 0, 0, 1, 1,
1.556708, 0.3352642, -1.159331, 1, 1, 1, 1, 1,
1.561895, -0.2153041, 2.200035, 1, 1, 1, 1, 1,
1.565255, -0.2662189, 2.350712, 1, 1, 1, 1, 1,
1.566116, -1.952106, 2.453924, 1, 1, 1, 1, 1,
1.568029, -0.1196863, 1.605793, 1, 1, 1, 1, 1,
1.571162, 1.15828, 0.1230117, 1, 1, 1, 1, 1,
1.576597, 1.172276, 0.6753027, 1, 1, 1, 1, 1,
1.63505, -0.3155605, 3.374151, 1, 1, 1, 1, 1,
1.649225, 0.08828589, 1.494135, 1, 1, 1, 1, 1,
1.652087, 0.8731307, 0.2707115, 1, 1, 1, 1, 1,
1.654665, -0.7950451, 2.666993, 1, 1, 1, 1, 1,
1.660031, -0.3720363, 2.695438, 1, 1, 1, 1, 1,
1.677308, 0.7991874, 1.150538, 1, 1, 1, 1, 1,
1.678522, 1.762202, -0.6282572, 1, 1, 1, 1, 1,
1.680778, -0.1714274, 1.741588, 1, 1, 1, 1, 1,
1.703954, 0.3578489, 1.326141, 0, 0, 1, 1, 1,
1.707453, 0.06517785, 1.118036, 1, 0, 0, 1, 1,
1.713151, -0.7324014, 2.563417, 1, 0, 0, 1, 1,
1.716888, 0.2360456, 3.348513, 1, 0, 0, 1, 1,
1.730126, -0.5767639, 2.750139, 1, 0, 0, 1, 1,
1.750451, 0.6927348, 1.465523, 1, 0, 0, 1, 1,
1.770925, -0.6488202, 1.720989, 0, 0, 0, 1, 1,
1.783122, -0.128245, 0.293256, 0, 0, 0, 1, 1,
1.794412, -0.04512705, 2.223929, 0, 0, 0, 1, 1,
1.795375, -1.986417, 1.217575, 0, 0, 0, 1, 1,
1.799567, -0.6986054, 2.168483, 0, 0, 0, 1, 1,
1.805785, -2.162678, 1.894164, 0, 0, 0, 1, 1,
1.819255, -2.161919, 3.929848, 0, 0, 0, 1, 1,
1.845697, -0.4036977, 1.081419, 1, 1, 1, 1, 1,
1.845888, 0.6826746, 1.092479, 1, 1, 1, 1, 1,
1.882709, 1.16349, 0.5804741, 1, 1, 1, 1, 1,
1.889051, 1.13793, 1.62031, 1, 1, 1, 1, 1,
1.894209, -0.3375961, 3.25993, 1, 1, 1, 1, 1,
1.901694, 1.282764, 0.3570125, 1, 1, 1, 1, 1,
1.914832, 1.78337, -0.4605553, 1, 1, 1, 1, 1,
1.960326, -0.1449672, 0.3128803, 1, 1, 1, 1, 1,
1.978109, 0.5559372, 0.3089428, 1, 1, 1, 1, 1,
1.981264, -0.8500956, 2.880183, 1, 1, 1, 1, 1,
2.009526, 1.102416, 1.846184, 1, 1, 1, 1, 1,
2.015457, -0.4322075, 1.884273, 1, 1, 1, 1, 1,
2.018869, 0.21651, 1.736434, 1, 1, 1, 1, 1,
2.024945, -0.1889388, 0.7963205, 1, 1, 1, 1, 1,
2.04219, 0.2586895, 1.242424, 1, 1, 1, 1, 1,
2.045082, 0.2417445, 2.937033, 0, 0, 1, 1, 1,
2.072212, -0.1820299, 0.7503379, 1, 0, 0, 1, 1,
2.074795, -0.3958002, 0.4533704, 1, 0, 0, 1, 1,
2.094552, 1.111262, -0.07122398, 1, 0, 0, 1, 1,
2.127657, -0.8853495, 0.73658, 1, 0, 0, 1, 1,
2.16981, -1.78435, 3.815911, 1, 0, 0, 1, 1,
2.230469, -1.233654, 0.5706186, 0, 0, 0, 1, 1,
2.259614, -0.7558944, 2.024072, 0, 0, 0, 1, 1,
2.263124, -1.220071, 2.279668, 0, 0, 0, 1, 1,
2.295201, -0.6708153, 2.080518, 0, 0, 0, 1, 1,
2.305348, 0.5636095, 1.485747, 0, 0, 0, 1, 1,
2.322705, -0.01631546, 1.814424, 0, 0, 0, 1, 1,
2.341004, 0.09826548, 1.621621, 0, 0, 0, 1, 1,
2.500596, 1.450297, 2.362856, 1, 1, 1, 1, 1,
2.61651, 0.01045083, 0.9498218, 1, 1, 1, 1, 1,
2.628537, 2.643067, 1.429962, 1, 1, 1, 1, 1,
2.780036, 0.8757555, 1.49055, 1, 1, 1, 1, 1,
2.867878, 0.2770827, 1.257992, 1, 1, 1, 1, 1,
3.194621, -0.8479201, 2.275557, 1, 1, 1, 1, 1,
3.196675, 1.280166, -0.5719824, 1, 1, 1, 1, 1
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
var radius = 9.967939;
var distance = 35.01196;
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
mvMatrix.translate( 0.2058983, -0.1364727, -0.09038973 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.01196);
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
