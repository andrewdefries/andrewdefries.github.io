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
-3.32336, 0.5877168, -0.6509867, 1, 0, 0, 1,
-3.292992, -1.616602, 0.4313073, 1, 0.007843138, 0, 1,
-2.735237, 2.419762, -1.258187, 1, 0.01176471, 0, 1,
-2.713594, -1.062885, -3.77979, 1, 0.01960784, 0, 1,
-2.638134, 0.8923265, -3.262915, 1, 0.02352941, 0, 1,
-2.584993, -1.149932, -3.205691, 1, 0.03137255, 0, 1,
-2.531359, 0.3043441, -1.223775, 1, 0.03529412, 0, 1,
-2.444043, -1.23492, -1.868405, 1, 0.04313726, 0, 1,
-2.432635, 0.1350334, -1.800273, 1, 0.04705882, 0, 1,
-2.39615, -0.4548691, -2.62793, 1, 0.05490196, 0, 1,
-2.386051, 1.467225, 0.1741976, 1, 0.05882353, 0, 1,
-2.227895, -0.8854213, -3.767107, 1, 0.06666667, 0, 1,
-2.218477, 0.3809332, -1.5362, 1, 0.07058824, 0, 1,
-2.198321, 0.3472173, -2.363527, 1, 0.07843138, 0, 1,
-2.186169, 0.6428143, -3.612607, 1, 0.08235294, 0, 1,
-2.183288, 0.1425306, -1.360228, 1, 0.09019608, 0, 1,
-2.131207, -0.9023436, -2.092537, 1, 0.09411765, 0, 1,
-2.090295, -0.3526784, -1.696744, 1, 0.1019608, 0, 1,
-2.041185, 0.07431392, -0.6709394, 1, 0.1098039, 0, 1,
-2.037059, 0.8191645, 0.1108899, 1, 0.1137255, 0, 1,
-2.032032, -0.3926795, -1.283984, 1, 0.1215686, 0, 1,
-2.031902, 0.1223962, -2.534307, 1, 0.1254902, 0, 1,
-2.025832, 0.04633727, -1.579688, 1, 0.1333333, 0, 1,
-2.023578, -0.2645195, -0.4725424, 1, 0.1372549, 0, 1,
-1.995523, -2.287582, -2.900735, 1, 0.145098, 0, 1,
-1.983486, -0.4362576, -1.411915, 1, 0.1490196, 0, 1,
-1.968487, -0.9264753, -2.681017, 1, 0.1568628, 0, 1,
-1.956614, 1.131166, -0.6369809, 1, 0.1607843, 0, 1,
-1.921647, 0.4830608, -0.2049875, 1, 0.1686275, 0, 1,
-1.89961, -0.3763001, -2.424375, 1, 0.172549, 0, 1,
-1.89757, -2.025896, -0.5914338, 1, 0.1803922, 0, 1,
-1.861896, 0.1407233, -1.833471, 1, 0.1843137, 0, 1,
-1.840299, -0.6563442, -2.259532, 1, 0.1921569, 0, 1,
-1.80876, 0.07997022, -1.511512, 1, 0.1960784, 0, 1,
-1.808206, -0.4037277, -0.4430713, 1, 0.2039216, 0, 1,
-1.792953, -1.104713, -3.034071, 1, 0.2117647, 0, 1,
-1.781315, 2.000754, 0.07121418, 1, 0.2156863, 0, 1,
-1.76073, 0.3866076, -1.580175, 1, 0.2235294, 0, 1,
-1.753991, -0.7505575, -1.5836, 1, 0.227451, 0, 1,
-1.739393, 1.05853, -1.307952, 1, 0.2352941, 0, 1,
-1.695927, 0.2619982, -2.722086, 1, 0.2392157, 0, 1,
-1.689539, -0.5937268, -2.298485, 1, 0.2470588, 0, 1,
-1.683648, 0.9428961, -1.377706, 1, 0.2509804, 0, 1,
-1.683509, 0.8250108, -2.301738, 1, 0.2588235, 0, 1,
-1.676329, -0.2028348, -0.8317042, 1, 0.2627451, 0, 1,
-1.672263, 0.7943869, -0.2252068, 1, 0.2705882, 0, 1,
-1.660728, 0.7392188, -2.412048, 1, 0.2745098, 0, 1,
-1.658956, 0.1308921, -2.382448, 1, 0.282353, 0, 1,
-1.643679, 0.3921251, -0.1603298, 1, 0.2862745, 0, 1,
-1.625966, 0.1673826, -1.084474, 1, 0.2941177, 0, 1,
-1.625849, -0.5419851, -1.937398, 1, 0.3019608, 0, 1,
-1.596673, -0.6521177, -2.241126, 1, 0.3058824, 0, 1,
-1.589886, 0.4195244, -0.9771868, 1, 0.3137255, 0, 1,
-1.588422, 1.567246, -2.693456, 1, 0.3176471, 0, 1,
-1.580626, 0.6670168, -3.15296, 1, 0.3254902, 0, 1,
-1.574628, 0.08425601, -1.37475, 1, 0.3294118, 0, 1,
-1.57117, -0.4445678, -1.989441, 1, 0.3372549, 0, 1,
-1.570585, 0.2186946, -0.797304, 1, 0.3411765, 0, 1,
-1.563541, -1.106922, -1.221442, 1, 0.3490196, 0, 1,
-1.541092, -0.2316947, -1.905398, 1, 0.3529412, 0, 1,
-1.522143, 0.4187585, -0.7587037, 1, 0.3607843, 0, 1,
-1.518799, -1.435134, -3.336945, 1, 0.3647059, 0, 1,
-1.509493, -1.389678, 0.1611646, 1, 0.372549, 0, 1,
-1.504895, -0.1803867, -0.587316, 1, 0.3764706, 0, 1,
-1.502831, 2.167553, 1.00686, 1, 0.3843137, 0, 1,
-1.50208, -0.9636988, -0.815655, 1, 0.3882353, 0, 1,
-1.501857, -0.299812, -3.044872, 1, 0.3960784, 0, 1,
-1.500144, -1.603851, -2.049347, 1, 0.4039216, 0, 1,
-1.495109, -0.2278302, -0.8640661, 1, 0.4078431, 0, 1,
-1.492111, 0.5738689, -1.264006, 1, 0.4156863, 0, 1,
-1.471184, -0.8646225, -1.649239, 1, 0.4196078, 0, 1,
-1.468283, 1.987031, 0.1464692, 1, 0.427451, 0, 1,
-1.467323, -1.039431, -3.148546, 1, 0.4313726, 0, 1,
-1.464965, 0.3993957, -2.871242, 1, 0.4392157, 0, 1,
-1.450089, -1.483039, -0.694504, 1, 0.4431373, 0, 1,
-1.444005, -0.7381002, -1.544701, 1, 0.4509804, 0, 1,
-1.442133, 0.06684078, -1.979472, 1, 0.454902, 0, 1,
-1.441433, 0.7309072, -0.7582612, 1, 0.4627451, 0, 1,
-1.4366, 0.2977946, -1.042426, 1, 0.4666667, 0, 1,
-1.436031, 1.567832, -3.028715, 1, 0.4745098, 0, 1,
-1.405848, -0.1035518, -0.6068976, 1, 0.4784314, 0, 1,
-1.393619, 0.07583845, -2.721126, 1, 0.4862745, 0, 1,
-1.372785, 0.706107, -2.898269, 1, 0.4901961, 0, 1,
-1.368894, 0.7585352, -2.23346, 1, 0.4980392, 0, 1,
-1.366521, -0.001853198, -1.109512, 1, 0.5058824, 0, 1,
-1.365868, -1.745484, -3.106734, 1, 0.509804, 0, 1,
-1.365016, -0.8938345, -1.393225, 1, 0.5176471, 0, 1,
-1.35526, -1.717047, -0.8698843, 1, 0.5215687, 0, 1,
-1.340258, 0.3874106, -1.359492, 1, 0.5294118, 0, 1,
-1.339908, -0.9955229, -3.410385, 1, 0.5333334, 0, 1,
-1.335847, -0.4152304, -1.107099, 1, 0.5411765, 0, 1,
-1.330118, 1.017382, -1.53782, 1, 0.5450981, 0, 1,
-1.328958, -0.3323987, -2.783049, 1, 0.5529412, 0, 1,
-1.320087, 0.1651632, -2.167423, 1, 0.5568628, 0, 1,
-1.314399, -0.6015046, -0.9382438, 1, 0.5647059, 0, 1,
-1.308361, 0.6375188, -2.831726, 1, 0.5686275, 0, 1,
-1.296303, 0.1659304, -0.3002188, 1, 0.5764706, 0, 1,
-1.28486, -0.434955, -3.661367, 1, 0.5803922, 0, 1,
-1.27435, -1.429638, -1.191126, 1, 0.5882353, 0, 1,
-1.253465, -0.3689652, -1.836842, 1, 0.5921569, 0, 1,
-1.25029, -1.111912, -2.262328, 1, 0.6, 0, 1,
-1.249018, -1.467348, -3.632865, 1, 0.6078432, 0, 1,
-1.243836, -0.8808706, -2.904466, 1, 0.6117647, 0, 1,
-1.238506, 0.828517, -1.513398, 1, 0.6196079, 0, 1,
-1.238427, 1.20518, -1.547892, 1, 0.6235294, 0, 1,
-1.233203, -0.6242954, -0.7235366, 1, 0.6313726, 0, 1,
-1.22845, 0.08431817, -1.121687, 1, 0.6352941, 0, 1,
-1.222978, 0.3454665, -1.276078, 1, 0.6431373, 0, 1,
-1.215882, 0.5905819, -0.8447664, 1, 0.6470588, 0, 1,
-1.203834, -0.1606213, -1.744232, 1, 0.654902, 0, 1,
-1.199134, -1.147545, -3.242409, 1, 0.6588235, 0, 1,
-1.190874, -2.511028, -2.545471, 1, 0.6666667, 0, 1,
-1.187303, -0.04994184, -0.9528217, 1, 0.6705883, 0, 1,
-1.185814, 0.08909021, -0.3897415, 1, 0.6784314, 0, 1,
-1.175009, 0.8701309, -1.693499, 1, 0.682353, 0, 1,
-1.164008, -1.109761, -3.318563, 1, 0.6901961, 0, 1,
-1.162575, 1.127758, 0.2013996, 1, 0.6941177, 0, 1,
-1.159879, 0.005963264, -0.4778098, 1, 0.7019608, 0, 1,
-1.151234, -1.513583, -2.797181, 1, 0.7098039, 0, 1,
-1.1497, -0.09613792, -2.312032, 1, 0.7137255, 0, 1,
-1.148923, 0.6369393, -1.378477, 1, 0.7215686, 0, 1,
-1.146811, -0.2590038, -1.727973, 1, 0.7254902, 0, 1,
-1.140971, -0.05584145, -3.506307, 1, 0.7333333, 0, 1,
-1.114593, -0.07062028, -1.680949, 1, 0.7372549, 0, 1,
-1.108234, -2.212769, -2.070426, 1, 0.7450981, 0, 1,
-1.098821, -0.2580588, -0.2302905, 1, 0.7490196, 0, 1,
-1.098516, -0.797078, -4.167364, 1, 0.7568628, 0, 1,
-1.098042, 0.4739039, -1.777499, 1, 0.7607843, 0, 1,
-1.095865, -0.514188, -0.2690005, 1, 0.7686275, 0, 1,
-1.095254, -0.09142664, -2.935878, 1, 0.772549, 0, 1,
-1.090499, -0.9202785, -2.445074, 1, 0.7803922, 0, 1,
-1.087682, -1.119873, -2.776045, 1, 0.7843137, 0, 1,
-1.073719, -0.9130033, -2.148732, 1, 0.7921569, 0, 1,
-1.073262, -0.6021436, -1.455284, 1, 0.7960784, 0, 1,
-1.073228, 1.057448, 0.006940091, 1, 0.8039216, 0, 1,
-1.065225, -0.3652798, -0.08194616, 1, 0.8117647, 0, 1,
-1.057878, -1.801629, -2.921792, 1, 0.8156863, 0, 1,
-1.042429, 0.8389118, -0.9487447, 1, 0.8235294, 0, 1,
-1.041006, 1.577941, -1.26465, 1, 0.827451, 0, 1,
-1.035862, 0.2539712, 0.07702176, 1, 0.8352941, 0, 1,
-1.032928, -0.2495702, -3.131361, 1, 0.8392157, 0, 1,
-1.030768, 1.042519, 0.9351854, 1, 0.8470588, 0, 1,
-1.030416, 0.9150357, -1.700491, 1, 0.8509804, 0, 1,
-1.028657, -0.4614028, -0.8735172, 1, 0.8588235, 0, 1,
-1.028059, 1.186035, -1.098737, 1, 0.8627451, 0, 1,
-1.025395, 0.2882009, -1.767225, 1, 0.8705882, 0, 1,
-1.023853, -0.6814446, -3.689922, 1, 0.8745098, 0, 1,
-1.020096, 1.405906, -1.781994, 1, 0.8823529, 0, 1,
-1.017771, -2.334577, -0.8966007, 1, 0.8862745, 0, 1,
-1.014102, 0.0597998, -1.52602, 1, 0.8941177, 0, 1,
-1.011706, -0.3488548, -2.892189, 1, 0.8980392, 0, 1,
-1.011105, -0.1225787, -0.9158996, 1, 0.9058824, 0, 1,
-1.010634, 0.9091032, -0.2251031, 1, 0.9137255, 0, 1,
-1.009548, 1.064753, 0.2268282, 1, 0.9176471, 0, 1,
-1.004587, 0.2701688, -2.642174, 1, 0.9254902, 0, 1,
-1.002724, -1.709885, -2.705781, 1, 0.9294118, 0, 1,
-0.9996067, 0.5553768, 0.3832639, 1, 0.9372549, 0, 1,
-0.9982668, -1.981467, -1.736421, 1, 0.9411765, 0, 1,
-0.9909961, 1.37498, 0.4382332, 1, 0.9490196, 0, 1,
-0.9841122, -0.2108017, -0.8305016, 1, 0.9529412, 0, 1,
-0.9803588, 0.4039023, -1.414395, 1, 0.9607843, 0, 1,
-0.9784134, 1.294303, -0.1339696, 1, 0.9647059, 0, 1,
-0.9763501, 1.143814, -1.141908, 1, 0.972549, 0, 1,
-0.9681121, 0.7202103, -0.1909015, 1, 0.9764706, 0, 1,
-0.9680511, 0.1989393, -1.964196, 1, 0.9843137, 0, 1,
-0.9504988, -0.5430975, -2.027595, 1, 0.9882353, 0, 1,
-0.945917, -0.5769362, -0.7024367, 1, 0.9960784, 0, 1,
-0.9390813, -0.9810537, -1.964989, 0.9960784, 1, 0, 1,
-0.9375222, 0.2074395, -3.465862, 0.9921569, 1, 0, 1,
-0.9349528, 0.8256549, -0.2986098, 0.9843137, 1, 0, 1,
-0.9314806, -0.8685756, -2.009255, 0.9803922, 1, 0, 1,
-0.9257997, 0.1514916, -0.9298223, 0.972549, 1, 0, 1,
-0.9206322, 1.076521, 0.4470676, 0.9686275, 1, 0, 1,
-0.9188932, 0.4139948, -0.4133948, 0.9607843, 1, 0, 1,
-0.9155164, 1.181773, -2.31713, 0.9568627, 1, 0, 1,
-0.9095191, 1.711009, 0.4009219, 0.9490196, 1, 0, 1,
-0.9005352, 0.3755438, -0.5440667, 0.945098, 1, 0, 1,
-0.8980017, 0.211597, -1.497075, 0.9372549, 1, 0, 1,
-0.8942062, 1.261272, -1.997863, 0.9333333, 1, 0, 1,
-0.8833466, -0.335766, -0.8690266, 0.9254902, 1, 0, 1,
-0.8762989, -0.9129429, -3.558682, 0.9215686, 1, 0, 1,
-0.871411, -0.5354007, -1.786996, 0.9137255, 1, 0, 1,
-0.8627112, 0.4361789, 0.4034274, 0.9098039, 1, 0, 1,
-0.8589933, 0.6419829, -0.188142, 0.9019608, 1, 0, 1,
-0.8515356, -0.4839303, -1.714996, 0.8941177, 1, 0, 1,
-0.8503488, 0.00166768, -1.636539, 0.8901961, 1, 0, 1,
-0.8468953, -0.196048, -1.798221, 0.8823529, 1, 0, 1,
-0.8465133, -0.9845717, -1.826288, 0.8784314, 1, 0, 1,
-0.8450757, 1.275397, -1.513563, 0.8705882, 1, 0, 1,
-0.8394365, -0.989877, -3.384498, 0.8666667, 1, 0, 1,
-0.8390332, -1.830183, -1.793929, 0.8588235, 1, 0, 1,
-0.8324156, 0.3912381, -1.19019, 0.854902, 1, 0, 1,
-0.8156055, -0.1710407, -1.751447, 0.8470588, 1, 0, 1,
-0.8105786, 0.6875228, -1.153626, 0.8431373, 1, 0, 1,
-0.8013656, 0.1735433, -0.07573498, 0.8352941, 1, 0, 1,
-0.7980674, 1.283159, 1.218523, 0.8313726, 1, 0, 1,
-0.7955206, 0.244295, -1.670228, 0.8235294, 1, 0, 1,
-0.7887945, -0.2994016, -1.325102, 0.8196079, 1, 0, 1,
-0.7791291, -0.5797366, -2.368872, 0.8117647, 1, 0, 1,
-0.777638, 0.7272137, -0.7663972, 0.8078431, 1, 0, 1,
-0.7771691, 1.43989, 0.2664768, 0.8, 1, 0, 1,
-0.7732235, -0.08164944, -1.77238, 0.7921569, 1, 0, 1,
-0.771601, 1.167848, -0.5182977, 0.7882353, 1, 0, 1,
-0.7675031, -0.6364793, -2.668298, 0.7803922, 1, 0, 1,
-0.7656019, 1.665316, -0.1148252, 0.7764706, 1, 0, 1,
-0.7649329, 1.398246, 0.1338012, 0.7686275, 1, 0, 1,
-0.7613502, -0.4487314, -0.8186889, 0.7647059, 1, 0, 1,
-0.756982, 1.39203, 1.931866, 0.7568628, 1, 0, 1,
-0.750398, 0.009912462, -0.4627008, 0.7529412, 1, 0, 1,
-0.7431886, -0.1123706, -1.01601, 0.7450981, 1, 0, 1,
-0.7418849, 0.8640702, -0.9979885, 0.7411765, 1, 0, 1,
-0.735845, 2.237728, -0.5211229, 0.7333333, 1, 0, 1,
-0.7353206, -1.004783, -3.650749, 0.7294118, 1, 0, 1,
-0.7280172, 2.740631, -1.590846, 0.7215686, 1, 0, 1,
-0.7199637, -0.4558443, -3.515394, 0.7176471, 1, 0, 1,
-0.7195626, -1.422519, -2.375456, 0.7098039, 1, 0, 1,
-0.7170269, 1.47496, -0.9900991, 0.7058824, 1, 0, 1,
-0.7120376, 1.449393, -0.9202263, 0.6980392, 1, 0, 1,
-0.7113135, 0.02132177, -0.6959152, 0.6901961, 1, 0, 1,
-0.7109376, 1.544834, 0.2384958, 0.6862745, 1, 0, 1,
-0.7091549, -0.2810628, -1.56843, 0.6784314, 1, 0, 1,
-0.7047691, -1.110559, -3.503603, 0.6745098, 1, 0, 1,
-0.6977459, 0.9587669, 0.7639768, 0.6666667, 1, 0, 1,
-0.6977365, 1.980688, 0.03645605, 0.6627451, 1, 0, 1,
-0.694262, -0.1699746, -1.022957, 0.654902, 1, 0, 1,
-0.6931815, -1.561846, -4.96019, 0.6509804, 1, 0, 1,
-0.6930475, 0.3967941, -1.363499, 0.6431373, 1, 0, 1,
-0.6875515, -0.09503013, -1.039871, 0.6392157, 1, 0, 1,
-0.6814354, -0.4409713, -3.579979, 0.6313726, 1, 0, 1,
-0.6809943, 0.4722911, -0.4158124, 0.627451, 1, 0, 1,
-0.6801051, -0.3018838, -1.096632, 0.6196079, 1, 0, 1,
-0.676981, 1.092266, 0.564656, 0.6156863, 1, 0, 1,
-0.6757343, -1.370163, -3.466394, 0.6078432, 1, 0, 1,
-0.6751626, 0.4036628, -2.853793, 0.6039216, 1, 0, 1,
-0.6732746, -2.326925, -2.941209, 0.5960785, 1, 0, 1,
-0.6731241, 1.178395, -0.7355033, 0.5882353, 1, 0, 1,
-0.6700506, 0.2342943, -1.34386, 0.5843138, 1, 0, 1,
-0.667033, 1.352994, -0.248334, 0.5764706, 1, 0, 1,
-0.6645944, 1.706246, -0.4530613, 0.572549, 1, 0, 1,
-0.6630645, -0.8206018, -4.037005, 0.5647059, 1, 0, 1,
-0.6619864, 2.123367, 1.461929, 0.5607843, 1, 0, 1,
-0.6606621, 0.8474418, -2.101857, 0.5529412, 1, 0, 1,
-0.6598868, -0.5254233, -2.814048, 0.5490196, 1, 0, 1,
-0.6579096, -0.9074607, -1.534402, 0.5411765, 1, 0, 1,
-0.6562334, 1.498093, -1.18128, 0.5372549, 1, 0, 1,
-0.6554024, -0.2013265, -2.836789, 0.5294118, 1, 0, 1,
-0.6497649, -0.6762377, -2.730447, 0.5254902, 1, 0, 1,
-0.6294118, 1.395646, -0.2814386, 0.5176471, 1, 0, 1,
-0.6293384, 0.9296461, -1.680466, 0.5137255, 1, 0, 1,
-0.6261884, -0.7874274, -3.833515, 0.5058824, 1, 0, 1,
-0.6257597, 0.7208239, -1.493135, 0.5019608, 1, 0, 1,
-0.6242301, 0.67662, -0.4800208, 0.4941176, 1, 0, 1,
-0.6212949, 0.1684228, 0.6620004, 0.4862745, 1, 0, 1,
-0.6200699, -2.080699, -1.799656, 0.4823529, 1, 0, 1,
-0.6164501, -1.60616, -1.525535, 0.4745098, 1, 0, 1,
-0.6156688, 0.08575764, -2.431714, 0.4705882, 1, 0, 1,
-0.6133152, 0.202219, -2.61355, 0.4627451, 1, 0, 1,
-0.6129232, -2.697049, -3.943734, 0.4588235, 1, 0, 1,
-0.6056899, -0.2551404, -2.203245, 0.4509804, 1, 0, 1,
-0.6044042, -0.8157747, -1.86062, 0.4470588, 1, 0, 1,
-0.5988131, 1.142583, -0.2102735, 0.4392157, 1, 0, 1,
-0.5964441, -0.09575141, -2.524861, 0.4352941, 1, 0, 1,
-0.588544, 0.6712262, 0.1033305, 0.427451, 1, 0, 1,
-0.5882693, 0.1629004, -1.315889, 0.4235294, 1, 0, 1,
-0.586051, -0.110456, -1.160413, 0.4156863, 1, 0, 1,
-0.5788966, 1.067993, 0.2834473, 0.4117647, 1, 0, 1,
-0.5754981, 0.06519828, -1.183835, 0.4039216, 1, 0, 1,
-0.5729038, -0.1261996, -3.010982, 0.3960784, 1, 0, 1,
-0.5689833, -0.4791885, -4.813284, 0.3921569, 1, 0, 1,
-0.5667081, -0.2541201, -1.369329, 0.3843137, 1, 0, 1,
-0.5664436, -1.342202, -2.86999, 0.3803922, 1, 0, 1,
-0.5651975, -0.6847265, -2.258745, 0.372549, 1, 0, 1,
-0.5645505, -0.9268858, -3.686462, 0.3686275, 1, 0, 1,
-0.5636742, -1.694197, -3.526554, 0.3607843, 1, 0, 1,
-0.5627031, -0.2960955, -1.235331, 0.3568628, 1, 0, 1,
-0.5614693, -2.548635, -3.207469, 0.3490196, 1, 0, 1,
-0.5608597, -0.5703362, -1.491314, 0.345098, 1, 0, 1,
-0.5512287, -0.5231262, -0.4025719, 0.3372549, 1, 0, 1,
-0.5470051, 1.239148, 0.1737396, 0.3333333, 1, 0, 1,
-0.5427993, 1.606596, 1.728673, 0.3254902, 1, 0, 1,
-0.5403993, -0.1967178, -3.997756, 0.3215686, 1, 0, 1,
-0.5378211, -0.2682996, -2.41301, 0.3137255, 1, 0, 1,
-0.5354845, 0.7308065, 0.04054065, 0.3098039, 1, 0, 1,
-0.5343102, -0.08501445, -1.475353, 0.3019608, 1, 0, 1,
-0.5302667, 2.049026, -1.331603, 0.2941177, 1, 0, 1,
-0.5289546, -0.7327443, -3.787112, 0.2901961, 1, 0, 1,
-0.527739, -0.1447385, -2.797511, 0.282353, 1, 0, 1,
-0.525744, -0.5791343, -2.885391, 0.2784314, 1, 0, 1,
-0.5193817, 0.4469022, -2.008032, 0.2705882, 1, 0, 1,
-0.519114, -1.183735, -3.477318, 0.2666667, 1, 0, 1,
-0.5093843, -0.241703, -1.52528, 0.2588235, 1, 0, 1,
-0.508971, 2.44756, -0.755541, 0.254902, 1, 0, 1,
-0.5082492, -1.074478, -1.02473, 0.2470588, 1, 0, 1,
-0.5034525, 0.9678955, 0.03616109, 0.2431373, 1, 0, 1,
-0.5001113, -0.6822564, -0.2762669, 0.2352941, 1, 0, 1,
-0.4963637, 0.4922184, -1.861672, 0.2313726, 1, 0, 1,
-0.4951859, -0.9452602, -4.011368, 0.2235294, 1, 0, 1,
-0.494911, -0.8099378, -5.432219, 0.2196078, 1, 0, 1,
-0.4933991, 0.6427013, 0.1240066, 0.2117647, 1, 0, 1,
-0.4915094, -0.3348037, -0.7317066, 0.2078431, 1, 0, 1,
-0.4869863, 0.4563784, 0.4881119, 0.2, 1, 0, 1,
-0.4853004, -0.5284272, -0.9229203, 0.1921569, 1, 0, 1,
-0.4832546, -0.2531537, -0.9300846, 0.1882353, 1, 0, 1,
-0.4818485, -1.779731, -3.361527, 0.1803922, 1, 0, 1,
-0.4722249, -1.177685, -1.810701, 0.1764706, 1, 0, 1,
-0.4717382, 1.967493, -0.4188647, 0.1686275, 1, 0, 1,
-0.4713056, 0.4136882, -0.6909608, 0.1647059, 1, 0, 1,
-0.4709668, -0.5308581, -2.698645, 0.1568628, 1, 0, 1,
-0.4669268, 0.9958103, 0.03205475, 0.1529412, 1, 0, 1,
-0.4658788, -0.06525616, -0.6316683, 0.145098, 1, 0, 1,
-0.4656884, 0.7437145, 0.06946007, 0.1411765, 1, 0, 1,
-0.4653737, -0.8308907, -2.681022, 0.1333333, 1, 0, 1,
-0.4653512, 0.3959316, -1.307558, 0.1294118, 1, 0, 1,
-0.4625671, 0.6609728, 0.8894995, 0.1215686, 1, 0, 1,
-0.4619835, 0.6806443, -2.283581, 0.1176471, 1, 0, 1,
-0.4560265, -0.3218933, -3.250329, 0.1098039, 1, 0, 1,
-0.4543296, 1.413979, -0.8610819, 0.1058824, 1, 0, 1,
-0.4521938, -1.039108, -1.738464, 0.09803922, 1, 0, 1,
-0.4419897, -0.02048011, -0.8288729, 0.09019608, 1, 0, 1,
-0.4415874, -1.181146, -2.534595, 0.08627451, 1, 0, 1,
-0.4354772, 1.680987, 0.5917864, 0.07843138, 1, 0, 1,
-0.4331758, -0.7831143, -3.285755, 0.07450981, 1, 0, 1,
-0.4307401, -1.033772, -1.981033, 0.06666667, 1, 0, 1,
-0.4263526, -0.4272736, 0.4279986, 0.0627451, 1, 0, 1,
-0.4256991, -1.147164, -3.502819, 0.05490196, 1, 0, 1,
-0.4233941, -0.6036578, -2.414411, 0.05098039, 1, 0, 1,
-0.4228196, 1.267658, 0.8967834, 0.04313726, 1, 0, 1,
-0.421208, -0.7830871, -4.024604, 0.03921569, 1, 0, 1,
-0.4194557, 0.9711553, -0.2021211, 0.03137255, 1, 0, 1,
-0.4056277, 1.205981, -2.570958, 0.02745098, 1, 0, 1,
-0.4054732, -1.472526, -4.301096, 0.01960784, 1, 0, 1,
-0.3907413, 0.5836358, -0.6523532, 0.01568628, 1, 0, 1,
-0.3859301, -1.232264, -3.054138, 0.007843138, 1, 0, 1,
-0.3830712, 0.7833005, 2.13783, 0.003921569, 1, 0, 1,
-0.3821456, -0.07820154, -1.56124, 0, 1, 0.003921569, 1,
-0.3806601, 0.1599929, -0.7532088, 0, 1, 0.01176471, 1,
-0.3784877, 0.5184783, -0.5663577, 0, 1, 0.01568628, 1,
-0.3782857, 0.2088116, 0.2048639, 0, 1, 0.02352941, 1,
-0.3780388, 0.4735176, -1.640098, 0, 1, 0.02745098, 1,
-0.3778732, -0.04734354, -2.759202, 0, 1, 0.03529412, 1,
-0.3756271, -0.8238401, -3.940224, 0, 1, 0.03921569, 1,
-0.3723821, -1.194093, -2.564908, 0, 1, 0.04705882, 1,
-0.3697667, 1.041435, 0.949254, 0, 1, 0.05098039, 1,
-0.3683596, 0.9633374, -0.03110463, 0, 1, 0.05882353, 1,
-0.3669552, -0.009183239, -0.6064313, 0, 1, 0.0627451, 1,
-0.3668235, -2.496144, -3.338402, 0, 1, 0.07058824, 1,
-0.3644433, 0.09682829, -0.2994719, 0, 1, 0.07450981, 1,
-0.363117, -2.628953, -4.300441, 0, 1, 0.08235294, 1,
-0.3595659, 0.519086, -0.01350594, 0, 1, 0.08627451, 1,
-0.3567432, 0.3399511, -0.5291193, 0, 1, 0.09411765, 1,
-0.3493304, 1.105519, 1.174402, 0, 1, 0.1019608, 1,
-0.3429236, -0.08423373, -1.373104, 0, 1, 0.1058824, 1,
-0.3388472, -0.5125467, -1.354708, 0, 1, 0.1137255, 1,
-0.3273494, 0.1851616, 0.02328371, 0, 1, 0.1176471, 1,
-0.3216123, -0.7770272, -3.530075, 0, 1, 0.1254902, 1,
-0.3214984, -0.03805157, -1.992614, 0, 1, 0.1294118, 1,
-0.3212402, -0.07518621, -2.548063, 0, 1, 0.1372549, 1,
-0.3194799, -1.348434, -2.342777, 0, 1, 0.1411765, 1,
-0.3158826, -1.281362, -3.569391, 0, 1, 0.1490196, 1,
-0.3133264, 0.4296712, -0.2335551, 0, 1, 0.1529412, 1,
-0.3103935, -0.4616364, -3.544125, 0, 1, 0.1607843, 1,
-0.3084662, -1.919813, -4.212965, 0, 1, 0.1647059, 1,
-0.3083629, -0.852946, -1.442596, 0, 1, 0.172549, 1,
-0.3072814, -0.2574142, -2.667994, 0, 1, 0.1764706, 1,
-0.3062031, 0.5539761, -0.9079896, 0, 1, 0.1843137, 1,
-0.3044345, -0.7639423, -3.747073, 0, 1, 0.1882353, 1,
-0.2997929, -2.11536, -3.841134, 0, 1, 0.1960784, 1,
-0.2893412, -0.5052449, -1.728591, 0, 1, 0.2039216, 1,
-0.289236, -0.7138133, -4.123254, 0, 1, 0.2078431, 1,
-0.2871714, -1.083326, -0.8765646, 0, 1, 0.2156863, 1,
-0.2786664, -0.7709085, -3.441634, 0, 1, 0.2196078, 1,
-0.2781712, -0.912141, -2.384115, 0, 1, 0.227451, 1,
-0.2779821, -1.176803, -3.070668, 0, 1, 0.2313726, 1,
-0.277782, 1.03042, -0.3157821, 0, 1, 0.2392157, 1,
-0.2768834, 1.679763, 1.448008, 0, 1, 0.2431373, 1,
-0.2743476, -0.2987096, -3.943194, 0, 1, 0.2509804, 1,
-0.2741821, -1.196394, -3.583599, 0, 1, 0.254902, 1,
-0.2739694, 1.27108, 0.3800706, 0, 1, 0.2627451, 1,
-0.2692584, 0.8433744, 1.513608, 0, 1, 0.2666667, 1,
-0.2688507, 0.4405074, 0.4204882, 0, 1, 0.2745098, 1,
-0.2676101, 0.3140777, -0.4374123, 0, 1, 0.2784314, 1,
-0.2577199, 0.03200329, -3.767256, 0, 1, 0.2862745, 1,
-0.2572427, -0.927214, -3.348903, 0, 1, 0.2901961, 1,
-0.256024, -1.12247, -3.110945, 0, 1, 0.2980392, 1,
-0.2554641, 1.20775, -1.431316, 0, 1, 0.3058824, 1,
-0.2553611, -1.43708, -2.562447, 0, 1, 0.3098039, 1,
-0.2518308, 0.1795227, -0.8254073, 0, 1, 0.3176471, 1,
-0.249196, -0.792693, -1.574751, 0, 1, 0.3215686, 1,
-0.2479154, 2.935662, -0.8930553, 0, 1, 0.3294118, 1,
-0.2408789, -0.1102737, -4.464716, 0, 1, 0.3333333, 1,
-0.2346477, -3.080839, -3.848225, 0, 1, 0.3411765, 1,
-0.2288235, 0.1595044, -2.706921, 0, 1, 0.345098, 1,
-0.2238972, 2.415276, 0.7872681, 0, 1, 0.3529412, 1,
-0.2199493, -0.9893433, -2.757329, 0, 1, 0.3568628, 1,
-0.2182109, 0.5521758, 0.03562595, 0, 1, 0.3647059, 1,
-0.2134394, -0.3253546, -1.555303, 0, 1, 0.3686275, 1,
-0.2121074, -0.0809515, -2.339556, 0, 1, 0.3764706, 1,
-0.2095631, 0.2113923, 1.043234, 0, 1, 0.3803922, 1,
-0.2074827, -0.6844221, -1.842537, 0, 1, 0.3882353, 1,
-0.2073804, 0.1415364, -2.891449, 0, 1, 0.3921569, 1,
-0.2066654, -0.2220544, -1.142043, 0, 1, 0.4, 1,
-0.1992656, 0.4266842, 1.677261, 0, 1, 0.4078431, 1,
-0.195391, -0.9344779, -2.613185, 0, 1, 0.4117647, 1,
-0.1949341, 1.362221, 2.466043, 0, 1, 0.4196078, 1,
-0.1939646, -1.918988, -1.227317, 0, 1, 0.4235294, 1,
-0.1939114, -0.3456412, -3.0967, 0, 1, 0.4313726, 1,
-0.1918288, 0.2110154, -1.133289, 0, 1, 0.4352941, 1,
-0.1910939, 0.5619848, -0.5877264, 0, 1, 0.4431373, 1,
-0.1909262, -0.8350503, -2.093979, 0, 1, 0.4470588, 1,
-0.1897193, 0.2934804, -0.1709724, 0, 1, 0.454902, 1,
-0.1889125, -2.402711, -2.852917, 0, 1, 0.4588235, 1,
-0.1882874, -0.04342234, -1.008232, 0, 1, 0.4666667, 1,
-0.1861935, -2.067355, -3.30394, 0, 1, 0.4705882, 1,
-0.1854447, 0.6462054, -1.41502, 0, 1, 0.4784314, 1,
-0.1780007, -0.3029864, -2.845273, 0, 1, 0.4823529, 1,
-0.1777278, -0.3503272, -4.053171, 0, 1, 0.4901961, 1,
-0.1751957, -0.475553, -2.737456, 0, 1, 0.4941176, 1,
-0.1722624, -1.263751, -4.936527, 0, 1, 0.5019608, 1,
-0.172116, -0.659798, -2.907305, 0, 1, 0.509804, 1,
-0.1714509, -1.176798, -3.182323, 0, 1, 0.5137255, 1,
-0.1709207, 0.4405328, -0.4522361, 0, 1, 0.5215687, 1,
-0.169983, -0.5590289, -3.599202, 0, 1, 0.5254902, 1,
-0.1673709, 0.1916262, -1.287982, 0, 1, 0.5333334, 1,
-0.1645979, 0.2026593, 1.695081, 0, 1, 0.5372549, 1,
-0.1645041, -1.667442, -2.965931, 0, 1, 0.5450981, 1,
-0.160737, 0.6129525, -0.8806076, 0, 1, 0.5490196, 1,
-0.1605024, -0.1063906, -2.144519, 0, 1, 0.5568628, 1,
-0.1596431, -0.5465056, -4.168124, 0, 1, 0.5607843, 1,
-0.1564034, -0.4833741, -2.01712, 0, 1, 0.5686275, 1,
-0.1438339, -0.9619819, -4.109547, 0, 1, 0.572549, 1,
-0.1417173, 1.255514, -2.443095, 0, 1, 0.5803922, 1,
-0.1384863, 1.433847, -0.02057648, 0, 1, 0.5843138, 1,
-0.1369612, 1.413161, 1.348248, 0, 1, 0.5921569, 1,
-0.1329899, 0.6053811, 0.1535357, 0, 1, 0.5960785, 1,
-0.1295857, 0.4325057, -0.2848173, 0, 1, 0.6039216, 1,
-0.1288829, -1.114811, -3.030451, 0, 1, 0.6117647, 1,
-0.1208578, -0.7943875, -2.971141, 0, 1, 0.6156863, 1,
-0.116942, 1.164018, 0.4731514, 0, 1, 0.6235294, 1,
-0.1166977, -1.197191, -2.915338, 0, 1, 0.627451, 1,
-0.1149272, -0.2125364, -2.236654, 0, 1, 0.6352941, 1,
-0.114224, -0.46925, -3.536638, 0, 1, 0.6392157, 1,
-0.1134359, -0.3115098, -4.875291, 0, 1, 0.6470588, 1,
-0.1116453, -2.108188, -3.018473, 0, 1, 0.6509804, 1,
-0.110305, 0.5666089, 0.2871274, 0, 1, 0.6588235, 1,
-0.1067345, -0.0805143, -2.35623, 0, 1, 0.6627451, 1,
-0.1061227, 0.6764261, -0.2080932, 0, 1, 0.6705883, 1,
-0.1054244, 0.2555261, -0.1399103, 0, 1, 0.6745098, 1,
-0.1007264, 0.02355802, -1.16348, 0, 1, 0.682353, 1,
-0.1005657, 0.7912174, -0.6656586, 0, 1, 0.6862745, 1,
-0.09970552, 0.1312193, -2.321384, 0, 1, 0.6941177, 1,
-0.09610869, 1.163642, 0.3704555, 0, 1, 0.7019608, 1,
-0.09429527, -1.089879, -3.084885, 0, 1, 0.7058824, 1,
-0.09220801, -0.3115475, -1.495991, 0, 1, 0.7137255, 1,
-0.08774941, -0.5176712, -2.791663, 0, 1, 0.7176471, 1,
-0.08764209, 1.813554, -1.372996, 0, 1, 0.7254902, 1,
-0.07752641, -0.43255, -3.602918, 0, 1, 0.7294118, 1,
-0.07613175, 0.4416828, 0.5163381, 0, 1, 0.7372549, 1,
-0.07141216, 0.7233521, -1.708494, 0, 1, 0.7411765, 1,
-0.07026041, -0.9427665, -2.260314, 0, 1, 0.7490196, 1,
-0.06926326, 1.9888, -0.6092815, 0, 1, 0.7529412, 1,
-0.06649176, -0.8713445, -3.708233, 0, 1, 0.7607843, 1,
-0.06633035, -0.5662996, -3.275993, 0, 1, 0.7647059, 1,
-0.05940253, -1.236216, -3.844381, 0, 1, 0.772549, 1,
-0.05563194, -0.2360709, -3.515562, 0, 1, 0.7764706, 1,
-0.05438195, 2.525081, -0.01352356, 0, 1, 0.7843137, 1,
-0.05158476, -0.4381077, -2.032786, 0, 1, 0.7882353, 1,
-0.04681488, -0.7121595, -2.681063, 0, 1, 0.7960784, 1,
-0.04578499, -0.7279112, -4.644361, 0, 1, 0.8039216, 1,
-0.04416277, -2.176246, -4.39434, 0, 1, 0.8078431, 1,
-0.04342185, -0.8031614, 0.099608, 0, 1, 0.8156863, 1,
-0.036995, 0.2737139, -0.7956955, 0, 1, 0.8196079, 1,
-0.03599435, -1.308709, -3.599264, 0, 1, 0.827451, 1,
-0.03519443, -0.2714935, -4.613811, 0, 1, 0.8313726, 1,
-0.03274451, -0.4766209, -3.382262, 0, 1, 0.8392157, 1,
-0.03115014, 0.3168506, -0.4614024, 0, 1, 0.8431373, 1,
-0.03066971, 1.195605, 0.1499819, 0, 1, 0.8509804, 1,
-0.03006226, 0.3299313, -1.000142, 0, 1, 0.854902, 1,
-0.02832513, -0.2258514, -1.423043, 0, 1, 0.8627451, 1,
-0.02793669, -0.2799627, -3.682288, 0, 1, 0.8666667, 1,
-0.0191435, 2.75243, 0.5059066, 0, 1, 0.8745098, 1,
-0.01599316, -1.266249, -4.734581, 0, 1, 0.8784314, 1,
-0.01264783, 0.05874626, 0.608444, 0, 1, 0.8862745, 1,
-0.01249916, 1.765655, 1.245077, 0, 1, 0.8901961, 1,
-0.01012292, 0.05564284, 0.2638367, 0, 1, 0.8980392, 1,
-0.005790562, -0.8253295, -4.578744, 0, 1, 0.9058824, 1,
-0.005106322, -0.2000321, -2.420581, 0, 1, 0.9098039, 1,
-0.002131959, 0.987013, 0.8721715, 0, 1, 0.9176471, 1,
-0.0002895345, -0.8746804, -2.065897, 0, 1, 0.9215686, 1,
-9.384408e-05, 0.2456233, -0.08499474, 0, 1, 0.9294118, 1,
0.002290602, 0.9133082, -0.4420501, 0, 1, 0.9333333, 1,
0.004309164, -0.08468757, 2.812806, 0, 1, 0.9411765, 1,
0.008543357, -1.930427, 4.780611, 0, 1, 0.945098, 1,
0.01145422, -0.8676673, 3.115543, 0, 1, 0.9529412, 1,
0.01423434, -2.519701, 2.235349, 0, 1, 0.9568627, 1,
0.01628419, 1.739548, 0.1368178, 0, 1, 0.9647059, 1,
0.01666901, -1.347208, 1.934182, 0, 1, 0.9686275, 1,
0.01997666, -0.4666541, 3.061913, 0, 1, 0.9764706, 1,
0.0214618, -0.9896106, 2.57674, 0, 1, 0.9803922, 1,
0.02179806, 0.03986487, -0.8782882, 0, 1, 0.9882353, 1,
0.02903378, -0.979399, 2.329714, 0, 1, 0.9921569, 1,
0.03343085, -0.266706, 2.379528, 0, 1, 1, 1,
0.03361485, -0.02127129, 2.19307, 0, 0.9921569, 1, 1,
0.0389885, 1.773383, -0.7829267, 0, 0.9882353, 1, 1,
0.04064404, -0.3373826, 3.705036, 0, 0.9803922, 1, 1,
0.04203001, -2.765692, 2.869912, 0, 0.9764706, 1, 1,
0.04499428, 1.934884, -1.201373, 0, 0.9686275, 1, 1,
0.04523898, -1.398443, 2.888438, 0, 0.9647059, 1, 1,
0.045908, -0.07780112, 4.029142, 0, 0.9568627, 1, 1,
0.04721091, 0.7759414, 0.628641, 0, 0.9529412, 1, 1,
0.05334699, -0.3054317, 2.401784, 0, 0.945098, 1, 1,
0.05794431, 1.218031, 1.9421, 0, 0.9411765, 1, 1,
0.05828262, -1.51357, 4.196034, 0, 0.9333333, 1, 1,
0.05835219, 1.438136, -0.5125967, 0, 0.9294118, 1, 1,
0.06986766, -0.7367715, 2.082425, 0, 0.9215686, 1, 1,
0.07161734, -1.269001, 1.592568, 0, 0.9176471, 1, 1,
0.08461311, -0.5535744, 2.705302, 0, 0.9098039, 1, 1,
0.08722398, 0.4360401, -1.562022, 0, 0.9058824, 1, 1,
0.0873109, 1.216983, -0.5104429, 0, 0.8980392, 1, 1,
0.09037718, 0.7825782, -1.522464, 0, 0.8901961, 1, 1,
0.09190897, -2.116393, 3.236583, 0, 0.8862745, 1, 1,
0.0921247, 0.3303484, -2.04527, 0, 0.8784314, 1, 1,
0.0960377, 0.9582629, -2.039843, 0, 0.8745098, 1, 1,
0.09973501, 1.264, 1.432274, 0, 0.8666667, 1, 1,
0.1000713, 1.535969, 2.887407, 0, 0.8627451, 1, 1,
0.1036721, 1.34293, -0.4285169, 0, 0.854902, 1, 1,
0.1046749, -0.1131904, 1.627622, 0, 0.8509804, 1, 1,
0.1079275, -2.204589, 2.772151, 0, 0.8431373, 1, 1,
0.112431, 0.5736973, 0.3966186, 0, 0.8392157, 1, 1,
0.1194056, -1.251536, 4.350734, 0, 0.8313726, 1, 1,
0.1198568, 0.2331494, 0.6896553, 0, 0.827451, 1, 1,
0.1231227, -1.897536, 3.810455, 0, 0.8196079, 1, 1,
0.1241625, -1.354296, 1.05544, 0, 0.8156863, 1, 1,
0.1243317, 0.1670801, 0.1025579, 0, 0.8078431, 1, 1,
0.1252453, -0.7712882, 4.78585, 0, 0.8039216, 1, 1,
0.1275315, 1.254434, 1.431247, 0, 0.7960784, 1, 1,
0.1281979, -2.016315, 3.294232, 0, 0.7882353, 1, 1,
0.1293042, 1.447947, -1.144494, 0, 0.7843137, 1, 1,
0.1337995, 0.3784412, 0.9755324, 0, 0.7764706, 1, 1,
0.1357433, 0.9219002, 0.2009144, 0, 0.772549, 1, 1,
0.142491, 0.05732547, 0.4261759, 0, 0.7647059, 1, 1,
0.1545774, 0.01381316, 2.391907, 0, 0.7607843, 1, 1,
0.1551947, -1.198896, 1.93222, 0, 0.7529412, 1, 1,
0.1562021, 0.7348555, 0.2247852, 0, 0.7490196, 1, 1,
0.1576947, -0.7666036, 3.690817, 0, 0.7411765, 1, 1,
0.1597501, -0.1795472, 2.248393, 0, 0.7372549, 1, 1,
0.160475, 0.8766735, 1.089209, 0, 0.7294118, 1, 1,
0.1609899, -0.7266319, 2.02394, 0, 0.7254902, 1, 1,
0.1625085, -0.766337, 3.104424, 0, 0.7176471, 1, 1,
0.1632553, 0.105023, -0.6621029, 0, 0.7137255, 1, 1,
0.1709671, 0.7315594, 1.118267, 0, 0.7058824, 1, 1,
0.1722653, 1.613196, 0.7204256, 0, 0.6980392, 1, 1,
0.174784, -1.008188, 3.688648, 0, 0.6941177, 1, 1,
0.1759914, -1.337467, 3.485887, 0, 0.6862745, 1, 1,
0.1761362, -0.7577295, 2.726369, 0, 0.682353, 1, 1,
0.1763811, -0.6535307, 3.146443, 0, 0.6745098, 1, 1,
0.1800762, 0.5803614, 2.244496, 0, 0.6705883, 1, 1,
0.1850884, 0.02805865, 1.339877, 0, 0.6627451, 1, 1,
0.1886267, -0.7120574, 4.274303, 0, 0.6588235, 1, 1,
0.1910099, 1.602854, 0.9963571, 0, 0.6509804, 1, 1,
0.1930206, -1.238153, 3.52271, 0, 0.6470588, 1, 1,
0.1939009, -1.182084, 1.691613, 0, 0.6392157, 1, 1,
0.199549, -1.691895, 4.033586, 0, 0.6352941, 1, 1,
0.2021974, -0.6562045, 2.542764, 0, 0.627451, 1, 1,
0.2030699, -0.5022092, 3.028309, 0, 0.6235294, 1, 1,
0.210294, 0.739452, 0.4809331, 0, 0.6156863, 1, 1,
0.2112378, -1.479524, 3.476526, 0, 0.6117647, 1, 1,
0.2114335, -1.260781, 4.153619, 0, 0.6039216, 1, 1,
0.2137562, -1.556632, 2.536922, 0, 0.5960785, 1, 1,
0.2139685, 0.5358009, -0.2510315, 0, 0.5921569, 1, 1,
0.2172658, -0.714149, 3.808896, 0, 0.5843138, 1, 1,
0.2214417, -1.186424, 3.440214, 0, 0.5803922, 1, 1,
0.2225786, 0.9832381, -1.548396, 0, 0.572549, 1, 1,
0.2286583, 0.4196037, 0.1573282, 0, 0.5686275, 1, 1,
0.2429367, -0.928537, 0.07045799, 0, 0.5607843, 1, 1,
0.2485551, -0.9178752, 4.197938, 0, 0.5568628, 1, 1,
0.2493027, 0.6612431, 1.118531, 0, 0.5490196, 1, 1,
0.2571762, 0.4652394, 0.2234962, 0, 0.5450981, 1, 1,
0.2611954, -1.32388, 4.060288, 0, 0.5372549, 1, 1,
0.2660231, -0.2271167, 3.679011, 0, 0.5333334, 1, 1,
0.2682731, -0.05488971, 1.711712, 0, 0.5254902, 1, 1,
0.2685147, 0.4953859, 1.43179, 0, 0.5215687, 1, 1,
0.2694055, -0.2671002, 2.194201, 0, 0.5137255, 1, 1,
0.2695959, 0.7112086, 0.1648296, 0, 0.509804, 1, 1,
0.2702468, 1.902091, 1.300535, 0, 0.5019608, 1, 1,
0.2715108, 1.232689, 0.9645738, 0, 0.4941176, 1, 1,
0.2736152, -0.2453521, 2.026558, 0, 0.4901961, 1, 1,
0.2738994, 0.6661342, -0.3389542, 0, 0.4823529, 1, 1,
0.2748193, -0.2111139, 0.05687018, 0, 0.4784314, 1, 1,
0.2764388, -0.3229879, 4.030134, 0, 0.4705882, 1, 1,
0.2765806, -0.03825951, 1.656948, 0, 0.4666667, 1, 1,
0.2771851, -0.8301904, 2.987491, 0, 0.4588235, 1, 1,
0.2776881, 0.3941531, 0.1883888, 0, 0.454902, 1, 1,
0.2791331, -0.474752, 1.542403, 0, 0.4470588, 1, 1,
0.2831261, 0.6857743, -1.364717, 0, 0.4431373, 1, 1,
0.2836775, -0.1111176, 2.417639, 0, 0.4352941, 1, 1,
0.2889363, -0.07802706, 2.764525, 0, 0.4313726, 1, 1,
0.2894689, 0.7844695, 0.191058, 0, 0.4235294, 1, 1,
0.289926, -0.09321171, -0.26369, 0, 0.4196078, 1, 1,
0.290052, -0.08162042, 1.257245, 0, 0.4117647, 1, 1,
0.2917197, -0.4649307, 2.689959, 0, 0.4078431, 1, 1,
0.2918813, -0.3086832, 2.789646, 0, 0.4, 1, 1,
0.2941378, -1.200676, 3.085933, 0, 0.3921569, 1, 1,
0.2980648, -0.7326546, 3.804412, 0, 0.3882353, 1, 1,
0.2992447, -1.171101, 3.773332, 0, 0.3803922, 1, 1,
0.3012147, 0.4758639, 0.1673545, 0, 0.3764706, 1, 1,
0.3106681, 0.5116723, 1.769027, 0, 0.3686275, 1, 1,
0.3106749, -1.28916, 3.595135, 0, 0.3647059, 1, 1,
0.3112505, -0.3132938, 2.7728, 0, 0.3568628, 1, 1,
0.3149349, 0.6720388, 0.7554643, 0, 0.3529412, 1, 1,
0.3174285, 0.5580242, -0.5560617, 0, 0.345098, 1, 1,
0.3219725, 1.235519, 0.09483679, 0, 0.3411765, 1, 1,
0.3272766, 2.029231, 1.834216, 0, 0.3333333, 1, 1,
0.3399163, -0.2767007, 2.932586, 0, 0.3294118, 1, 1,
0.3403229, 0.989543, 1.347549, 0, 0.3215686, 1, 1,
0.3440743, -0.7057819, 3.116495, 0, 0.3176471, 1, 1,
0.3443201, -1.466528, 2.121788, 0, 0.3098039, 1, 1,
0.3454655, 0.2155926, 1.167427, 0, 0.3058824, 1, 1,
0.3468399, -0.414667, 4.508452, 0, 0.2980392, 1, 1,
0.3504572, 1.357623, 0.1250726, 0, 0.2901961, 1, 1,
0.3518801, 0.327435, 0.8045139, 0, 0.2862745, 1, 1,
0.3553716, 0.138741, 2.343813, 0, 0.2784314, 1, 1,
0.3561572, 0.6355809, 0.6852532, 0, 0.2745098, 1, 1,
0.3578039, 2.386089, 0.8519046, 0, 0.2666667, 1, 1,
0.359359, 0.09902968, 0.3973698, 0, 0.2627451, 1, 1,
0.3655563, 0.7879063, 1.319864, 0, 0.254902, 1, 1,
0.3731211, -1.618211, 3.974452, 0, 0.2509804, 1, 1,
0.3745352, 0.8264193, 0.201663, 0, 0.2431373, 1, 1,
0.3775187, -1.082109, 4.148682, 0, 0.2392157, 1, 1,
0.3798804, -0.6272526, 2.51976, 0, 0.2313726, 1, 1,
0.3859902, -1.113496, 4.045565, 0, 0.227451, 1, 1,
0.3887119, 0.7379289, -0.5598004, 0, 0.2196078, 1, 1,
0.3894927, -2.0934, 1.669713, 0, 0.2156863, 1, 1,
0.4039626, -0.2317691, 2.164765, 0, 0.2078431, 1, 1,
0.4120903, 0.2410394, 0.2986776, 0, 0.2039216, 1, 1,
0.4198318, -1.560847, 3.285568, 0, 0.1960784, 1, 1,
0.4220644, -1.305086, 3.634316, 0, 0.1882353, 1, 1,
0.4231797, 1.026027, -0.4094667, 0, 0.1843137, 1, 1,
0.4247478, 0.07013602, 3.175113, 0, 0.1764706, 1, 1,
0.4251217, 0.480071, -0.6167075, 0, 0.172549, 1, 1,
0.4283875, -0.5226765, 2.477822, 0, 0.1647059, 1, 1,
0.4310708, 0.6296293, -0.4136429, 0, 0.1607843, 1, 1,
0.4311274, 0.1689234, 2.419546, 0, 0.1529412, 1, 1,
0.4327239, -1.708292, 4.264266, 0, 0.1490196, 1, 1,
0.433904, 0.6445946, -0.2157177, 0, 0.1411765, 1, 1,
0.4374186, -0.03737859, 2.152082, 0, 0.1372549, 1, 1,
0.4385801, -0.1666805, 0.9242237, 0, 0.1294118, 1, 1,
0.4453752, -0.08417229, 1.314459, 0, 0.1254902, 1, 1,
0.4490409, 0.1897248, 1.273287, 0, 0.1176471, 1, 1,
0.4517364, 2.041911, 1.380385, 0, 0.1137255, 1, 1,
0.4522842, -1.739506, 2.912681, 0, 0.1058824, 1, 1,
0.4547504, -1.490583, 2.186677, 0, 0.09803922, 1, 1,
0.4570854, 0.3845645, 1.420725, 0, 0.09411765, 1, 1,
0.4570913, 1.530962, 2.178055, 0, 0.08627451, 1, 1,
0.4626254, -0.3094232, 2.590321, 0, 0.08235294, 1, 1,
0.463189, -0.8758189, 3.18074, 0, 0.07450981, 1, 1,
0.4662894, -0.9694453, 1.873851, 0, 0.07058824, 1, 1,
0.4667481, -0.7253338, 3.632255, 0, 0.0627451, 1, 1,
0.4733631, -1.747796, 2.137075, 0, 0.05882353, 1, 1,
0.4748066, -0.3850565, 3.145172, 0, 0.05098039, 1, 1,
0.4769305, -0.08493821, 2.447944, 0, 0.04705882, 1, 1,
0.4790319, -0.2879086, 1.236633, 0, 0.03921569, 1, 1,
0.4792979, -2.977685, 3.341791, 0, 0.03529412, 1, 1,
0.4801068, -0.6750034, 2.726519, 0, 0.02745098, 1, 1,
0.4815142, -0.9605443, 2.993213, 0, 0.02352941, 1, 1,
0.4817652, -1.026664, 2.033763, 0, 0.01568628, 1, 1,
0.4834712, -0.7636288, 3.545848, 0, 0.01176471, 1, 1,
0.4850982, -0.7047058, 0.7480389, 0, 0.003921569, 1, 1,
0.4855673, -0.963396, 2.237543, 0.003921569, 0, 1, 1,
0.4870391, -1.056582, 2.223653, 0.007843138, 0, 1, 1,
0.492774, 1.577474, 0.6447188, 0.01568628, 0, 1, 1,
0.4935718, 0.50324, 1.146801, 0.01960784, 0, 1, 1,
0.4942368, -0.03622114, 3.36833, 0.02745098, 0, 1, 1,
0.4973424, 0.8513455, -0.02938633, 0.03137255, 0, 1, 1,
0.5005163, 0.3369305, -0.1271248, 0.03921569, 0, 1, 1,
0.5031363, 0.3484322, 1.373132, 0.04313726, 0, 1, 1,
0.5040514, -0.04247973, 1.718095, 0.05098039, 0, 1, 1,
0.5051506, -0.6851858, 1.76249, 0.05490196, 0, 1, 1,
0.5144538, 0.8851395, -0.8578551, 0.0627451, 0, 1, 1,
0.5147836, -2.12932, 3.122036, 0.06666667, 0, 1, 1,
0.5176793, 1.361544, 0.9475614, 0.07450981, 0, 1, 1,
0.5186791, -0.9500288, 1.069165, 0.07843138, 0, 1, 1,
0.5236018, -1.397778, 3.479248, 0.08627451, 0, 1, 1,
0.527131, -3.342885, 2.340026, 0.09019608, 0, 1, 1,
0.5313919, 0.05529395, 2.065177, 0.09803922, 0, 1, 1,
0.5389233, -0.0579704, 2.19941, 0.1058824, 0, 1, 1,
0.5438896, -1.848142, 2.874284, 0.1098039, 0, 1, 1,
0.5467461, 1.149195, 0.9970635, 0.1176471, 0, 1, 1,
0.5472575, -0.7261894, 2.119897, 0.1215686, 0, 1, 1,
0.5495075, -0.683525, 3.965014, 0.1294118, 0, 1, 1,
0.5517901, -0.04353575, 1.716234, 0.1333333, 0, 1, 1,
0.5550716, -0.1824046, 1.76239, 0.1411765, 0, 1, 1,
0.5560306, 0.5831242, -0.493873, 0.145098, 0, 1, 1,
0.5563567, -0.233402, 1.904984, 0.1529412, 0, 1, 1,
0.5585568, 0.2068089, 0.3299531, 0.1568628, 0, 1, 1,
0.5644424, -1.327163, 2.204852, 0.1647059, 0, 1, 1,
0.5648796, 0.4196513, -0.05965597, 0.1686275, 0, 1, 1,
0.5693418, 0.4863583, 1.549713, 0.1764706, 0, 1, 1,
0.5708066, -0.4693717, 2.572439, 0.1803922, 0, 1, 1,
0.5712106, -1.792287, 2.765245, 0.1882353, 0, 1, 1,
0.5716895, 2.824277, 0.1795344, 0.1921569, 0, 1, 1,
0.5754955, -1.118773, 3.118609, 0.2, 0, 1, 1,
0.575873, 1.170379, 1.439247, 0.2078431, 0, 1, 1,
0.5789489, -0.6915429, 1.243135, 0.2117647, 0, 1, 1,
0.5832902, -1.176923, 1.644749, 0.2196078, 0, 1, 1,
0.5848336, 0.07191626, 1.78678, 0.2235294, 0, 1, 1,
0.5943949, 0.1578102, -0.3897649, 0.2313726, 0, 1, 1,
0.5968248, 0.5000059, 0.5552664, 0.2352941, 0, 1, 1,
0.5994953, -0.1148551, 1.260782, 0.2431373, 0, 1, 1,
0.6063355, 0.4175233, 1.964988, 0.2470588, 0, 1, 1,
0.6063696, 0.2479653, 0.6851307, 0.254902, 0, 1, 1,
0.6087601, -1.857473, 3.67202, 0.2588235, 0, 1, 1,
0.6096633, -0.8090927, 3.727902, 0.2666667, 0, 1, 1,
0.6097957, 1.221353, 0.7295712, 0.2705882, 0, 1, 1,
0.6111227, 0.2231975, 1.773121, 0.2784314, 0, 1, 1,
0.6125799, 0.2995049, 0.7708524, 0.282353, 0, 1, 1,
0.6176716, 0.1509613, 0.9025535, 0.2901961, 0, 1, 1,
0.6185, 0.8046235, 0.8697682, 0.2941177, 0, 1, 1,
0.6229633, -0.2207656, 2.299792, 0.3019608, 0, 1, 1,
0.6238923, -0.8491697, 1.31609, 0.3098039, 0, 1, 1,
0.624128, 0.1467445, 2.588983, 0.3137255, 0, 1, 1,
0.6264384, -0.2407521, 2.465568, 0.3215686, 0, 1, 1,
0.6294402, 0.5266598, 1.699556, 0.3254902, 0, 1, 1,
0.6346508, -0.6647034, 1.927475, 0.3333333, 0, 1, 1,
0.6393492, 0.393719, 1.202814, 0.3372549, 0, 1, 1,
0.644804, -0.2894966, 2.848538, 0.345098, 0, 1, 1,
0.6453165, -0.1988711, 2.857529, 0.3490196, 0, 1, 1,
0.6547974, -0.5966376, 1.346866, 0.3568628, 0, 1, 1,
0.6631394, 0.07358517, 0.6955429, 0.3607843, 0, 1, 1,
0.6675599, 1.238601, 0.2558266, 0.3686275, 0, 1, 1,
0.6700498, -0.3511811, 1.201012, 0.372549, 0, 1, 1,
0.6747734, -1.284126, 2.832097, 0.3803922, 0, 1, 1,
0.6761381, 0.04820552, 3.353057, 0.3843137, 0, 1, 1,
0.6801389, -1.866179, 2.28528, 0.3921569, 0, 1, 1,
0.6811738, -1.182602, 2.949724, 0.3960784, 0, 1, 1,
0.6858453, 1.64642, 0.2970319, 0.4039216, 0, 1, 1,
0.6923794, 0.5126137, 0.8711325, 0.4117647, 0, 1, 1,
0.6957681, -1.542842, 3.2465, 0.4156863, 0, 1, 1,
0.7004871, 0.4269548, 0.1548608, 0.4235294, 0, 1, 1,
0.7027944, -1.289267, 3.72505, 0.427451, 0, 1, 1,
0.70733, -0.2662145, 1.171287, 0.4352941, 0, 1, 1,
0.7094763, -0.1474764, 3.625411, 0.4392157, 0, 1, 1,
0.7113375, -0.3600661, 3.965499, 0.4470588, 0, 1, 1,
0.7153422, 0.3517181, 1.025204, 0.4509804, 0, 1, 1,
0.727259, 0.7927089, 0.06558582, 0.4588235, 0, 1, 1,
0.7297581, 1.145889, 0.3365489, 0.4627451, 0, 1, 1,
0.7307045, -0.4643844, 0.6713059, 0.4705882, 0, 1, 1,
0.7321928, 0.4483459, 1.387801, 0.4745098, 0, 1, 1,
0.7390063, -0.4329036, 2.688129, 0.4823529, 0, 1, 1,
0.7425186, -0.3269876, 1.884795, 0.4862745, 0, 1, 1,
0.7458372, 0.1362096, 1.949691, 0.4941176, 0, 1, 1,
0.7494588, -2.134273, 3.421191, 0.5019608, 0, 1, 1,
0.7496122, -0.7038689, 2.284557, 0.5058824, 0, 1, 1,
0.7507272, -0.5004013, 2.273224, 0.5137255, 0, 1, 1,
0.7512867, 0.08858959, 0.152743, 0.5176471, 0, 1, 1,
0.7523441, -0.5570633, 1.973583, 0.5254902, 0, 1, 1,
0.7535006, 0.2577826, 0.9637157, 0.5294118, 0, 1, 1,
0.7576554, -0.7432442, 0.9473651, 0.5372549, 0, 1, 1,
0.7616322, -0.9803042, 3.080744, 0.5411765, 0, 1, 1,
0.7625076, -0.3466334, 1.220778, 0.5490196, 0, 1, 1,
0.7630562, 0.1405451, 0.6586446, 0.5529412, 0, 1, 1,
0.7677968, -1.333212, 1.594563, 0.5607843, 0, 1, 1,
0.7707531, 1.360738, 0.4201212, 0.5647059, 0, 1, 1,
0.7722701, 1.664347, 0.352984, 0.572549, 0, 1, 1,
0.7740113, -0.3325691, 1.808771, 0.5764706, 0, 1, 1,
0.7744442, 1.726446, 1.347817, 0.5843138, 0, 1, 1,
0.7782055, -0.6355339, 3.363253, 0.5882353, 0, 1, 1,
0.7794763, 0.003640164, 0.8216301, 0.5960785, 0, 1, 1,
0.7829097, -0.7798312, 1.88833, 0.6039216, 0, 1, 1,
0.7838496, -0.3326033, 1.672077, 0.6078432, 0, 1, 1,
0.7871603, -1.081967, 2.465383, 0.6156863, 0, 1, 1,
0.7875771, 0.9254702, 1.081037, 0.6196079, 0, 1, 1,
0.7941619, -0.4591276, 0.648429, 0.627451, 0, 1, 1,
0.7944517, 0.3809135, 0.2925116, 0.6313726, 0, 1, 1,
0.8035477, 0.1988052, 2.315041, 0.6392157, 0, 1, 1,
0.8072422, 1.051361, 1.943691, 0.6431373, 0, 1, 1,
0.8091514, -0.4943762, 1.968034, 0.6509804, 0, 1, 1,
0.8101586, 0.6156581, 0.06582463, 0.654902, 0, 1, 1,
0.8115665, -0.2306957, 2.61806, 0.6627451, 0, 1, 1,
0.812463, 0.1507007, -1.275672, 0.6666667, 0, 1, 1,
0.813138, -1.104968, 3.085477, 0.6745098, 0, 1, 1,
0.8142233, -0.3558577, 2.270001, 0.6784314, 0, 1, 1,
0.8147202, -0.8402218, 3.177654, 0.6862745, 0, 1, 1,
0.8192471, -1.627135, 3.314503, 0.6901961, 0, 1, 1,
0.8199018, -1.23598, 1.545809, 0.6980392, 0, 1, 1,
0.8204853, 1.496737, 2.36987, 0.7058824, 0, 1, 1,
0.8283743, -0.4421253, 0.6100782, 0.7098039, 0, 1, 1,
0.8288518, 0.5368086, 0.8040523, 0.7176471, 0, 1, 1,
0.8293207, 0.2339891, 1.239197, 0.7215686, 0, 1, 1,
0.8334299, 1.773741, 0.3150545, 0.7294118, 0, 1, 1,
0.8350365, 1.122494, 1.201777, 0.7333333, 0, 1, 1,
0.8351945, 0.08192577, 0.4459307, 0.7411765, 0, 1, 1,
0.8362873, 1.08368, 0.03443227, 0.7450981, 0, 1, 1,
0.8377158, 0.1738432, 0.2394406, 0.7529412, 0, 1, 1,
0.8417905, -1.687823, 1.979903, 0.7568628, 0, 1, 1,
0.8522559, 0.2450856, 1.11726, 0.7647059, 0, 1, 1,
0.8538968, 0.5762017, 1.408515, 0.7686275, 0, 1, 1,
0.8574246, 0.4710683, 1.629485, 0.7764706, 0, 1, 1,
0.8591465, 0.3476709, 0.8377967, 0.7803922, 0, 1, 1,
0.8607806, -0.004981578, 2.359712, 0.7882353, 0, 1, 1,
0.8609749, 0.4688739, 1.488344, 0.7921569, 0, 1, 1,
0.8670519, -1.048576, 3.540665, 0.8, 0, 1, 1,
0.8709482, 2.136962, 1.217488, 0.8078431, 0, 1, 1,
0.878113, 0.625209, 0.8999391, 0.8117647, 0, 1, 1,
0.8789518, -2.563113, 2.714569, 0.8196079, 0, 1, 1,
0.8854066, 1.463297, -0.5711289, 0.8235294, 0, 1, 1,
0.8876164, -0.3215596, 0.6199555, 0.8313726, 0, 1, 1,
0.8898578, 0.0774284, 0.1045927, 0.8352941, 0, 1, 1,
0.8906637, -0.06842125, 1.124823, 0.8431373, 0, 1, 1,
0.8923087, -0.4762425, 1.454191, 0.8470588, 0, 1, 1,
0.8980934, 0.2184227, 1.867611, 0.854902, 0, 1, 1,
0.8984422, 0.896283, -0.3331114, 0.8588235, 0, 1, 1,
0.8985551, 0.7628558, 1.51143, 0.8666667, 0, 1, 1,
0.9013145, 0.78741, 0.7762653, 0.8705882, 0, 1, 1,
0.9014284, -0.6238948, 2.640781, 0.8784314, 0, 1, 1,
0.9067101, -0.9652471, 3.755586, 0.8823529, 0, 1, 1,
0.9087216, -0.6835955, 1.491378, 0.8901961, 0, 1, 1,
0.9095047, 0.8652097, 1.432733, 0.8941177, 0, 1, 1,
0.9143969, -1.155495, 2.650783, 0.9019608, 0, 1, 1,
0.9167786, -0.8264179, 0.9259133, 0.9098039, 0, 1, 1,
0.9208349, -0.5550019, 2.792222, 0.9137255, 0, 1, 1,
0.924278, 1.009162, 0.05651826, 0.9215686, 0, 1, 1,
0.9259106, -0.7684901, 3.163033, 0.9254902, 0, 1, 1,
0.9260484, -2.017062, 1.986627, 0.9333333, 0, 1, 1,
0.9341413, 2.904937, 0.9744041, 0.9372549, 0, 1, 1,
0.9349925, -1.038909, 2.130127, 0.945098, 0, 1, 1,
0.9375714, 1.242646, 0.7364454, 0.9490196, 0, 1, 1,
0.9386764, 1.381432, -1.978389, 0.9568627, 0, 1, 1,
0.9442204, -1.517084, 2.29917, 0.9607843, 0, 1, 1,
0.9474674, 0.6916715, 0.0489652, 0.9686275, 0, 1, 1,
0.950935, 0.7878212, -0.270138, 0.972549, 0, 1, 1,
0.9587716, -1.476551, 2.587744, 0.9803922, 0, 1, 1,
0.9605814, 1.68776, -0.9365404, 0.9843137, 0, 1, 1,
0.9670966, 0.920756, 0.5375316, 0.9921569, 0, 1, 1,
0.9695178, -1.109421, 2.316168, 0.9960784, 0, 1, 1,
0.974214, -0.05586746, 2.335472, 1, 0, 0.9960784, 1,
0.9784184, 0.4340934, 1.490856, 1, 0, 0.9882353, 1,
0.9922256, -0.21426, 1.768027, 1, 0, 0.9843137, 1,
0.9988853, -1.986439, -0.6163867, 1, 0, 0.9764706, 1,
1.00566, 0.6094474, 1.512544, 1, 0, 0.972549, 1,
1.00651, -0.05052837, 0.2632709, 1, 0, 0.9647059, 1,
1.00861, 0.7357766, -0.6815428, 1, 0, 0.9607843, 1,
1.011429, 0.5935118, 1.547136, 1, 0, 0.9529412, 1,
1.012954, -0.1922878, 0.7871459, 1, 0, 0.9490196, 1,
1.016868, 0.4814736, 0.4991225, 1, 0, 0.9411765, 1,
1.017136, -1.085305, 1.950248, 1, 0, 0.9372549, 1,
1.027351, -1.075372, 1.55136, 1, 0, 0.9294118, 1,
1.035918, -2.229985, 2.223659, 1, 0, 0.9254902, 1,
1.043229, -0.7320712, 2.216163, 1, 0, 0.9176471, 1,
1.04413, -0.6753298, 1.40473, 1, 0, 0.9137255, 1,
1.050705, 0.6504484, 1.623738, 1, 0, 0.9058824, 1,
1.052024, 0.3457878, -0.03955016, 1, 0, 0.9019608, 1,
1.05969, -0.2697825, 1.708142, 1, 0, 0.8941177, 1,
1.06177, 1.571086, -0.3221392, 1, 0, 0.8862745, 1,
1.068396, 1.37904, 0.9960485, 1, 0, 0.8823529, 1,
1.070312, 2.445339, 0.1371142, 1, 0, 0.8745098, 1,
1.079033, -1.593897, 0.6664385, 1, 0, 0.8705882, 1,
1.079314, -0.4975739, 0.6164968, 1, 0, 0.8627451, 1,
1.088481, 0.4407488, 1.568146, 1, 0, 0.8588235, 1,
1.092651, -0.8680233, 1.535755, 1, 0, 0.8509804, 1,
1.093266, 1.545232, 0.6894068, 1, 0, 0.8470588, 1,
1.094373, -0.5634744, 2.055373, 1, 0, 0.8392157, 1,
1.095441, -0.5567805, 1.000993, 1, 0, 0.8352941, 1,
1.100729, 1.849737, 1.478823, 1, 0, 0.827451, 1,
1.103019, -0.4425893, 2.881713, 1, 0, 0.8235294, 1,
1.114601, -0.1150795, 2.388696, 1, 0, 0.8156863, 1,
1.1177, -1.869239, 4.020422, 1, 0, 0.8117647, 1,
1.118035, 1.089331, 1.538471, 1, 0, 0.8039216, 1,
1.120364, 0.6343747, 0.8689839, 1, 0, 0.7960784, 1,
1.121952, 1.545123, 0.3842328, 1, 0, 0.7921569, 1,
1.129944, -0.0861544, 2.458624, 1, 0, 0.7843137, 1,
1.132118, -0.810814, 2.650707, 1, 0, 0.7803922, 1,
1.132195, -0.07698677, 0.3420907, 1, 0, 0.772549, 1,
1.135689, 0.7456125, 2.229929, 1, 0, 0.7686275, 1,
1.142698, -1.829772, 2.666708, 1, 0, 0.7607843, 1,
1.146009, -0.4327302, 1.038315, 1, 0, 0.7568628, 1,
1.146831, 1.804937, -1.102918, 1, 0, 0.7490196, 1,
1.15058, -0.3511031, 1.503253, 1, 0, 0.7450981, 1,
1.151119, -1.934623, 2.210642, 1, 0, 0.7372549, 1,
1.15228, 1.033687, 0.331989, 1, 0, 0.7333333, 1,
1.152786, 0.497032, 1.588625, 1, 0, 0.7254902, 1,
1.153198, -2.160195, 4.292875, 1, 0, 0.7215686, 1,
1.155858, 1.404775, 1.809012, 1, 0, 0.7137255, 1,
1.160713, 0.684054, 2.052562, 1, 0, 0.7098039, 1,
1.165034, 0.1462859, -1.054151, 1, 0, 0.7019608, 1,
1.166582, 0.5677122, 0.906682, 1, 0, 0.6941177, 1,
1.172106, 1.210302, 0.5354342, 1, 0, 0.6901961, 1,
1.187801, 2.075532, 0.5670525, 1, 0, 0.682353, 1,
1.190188, -0.2899988, -0.09332016, 1, 0, 0.6784314, 1,
1.195688, -1.067519, 0.716794, 1, 0, 0.6705883, 1,
1.197815, 0.4485488, 2.383907, 1, 0, 0.6666667, 1,
1.209519, 0.08754931, 0.1445038, 1, 0, 0.6588235, 1,
1.220808, 0.2168871, -0.9451287, 1, 0, 0.654902, 1,
1.221779, -0.8592404, 1.584157, 1, 0, 0.6470588, 1,
1.231907, -0.8368254, 2.371266, 1, 0, 0.6431373, 1,
1.255604, -0.2360764, 2.36551, 1, 0, 0.6352941, 1,
1.257347, -0.4668091, -0.3459249, 1, 0, 0.6313726, 1,
1.258913, -0.7036781, 0.8714811, 1, 0, 0.6235294, 1,
1.264753, -0.8961205, 2.250932, 1, 0, 0.6196079, 1,
1.277968, 0.7270049, 2.390226, 1, 0, 0.6117647, 1,
1.278073, -1.513674, 2.970214, 1, 0, 0.6078432, 1,
1.291512, 1.092438, 0.5636387, 1, 0, 0.6, 1,
1.31705, -0.10191, 0.5515658, 1, 0, 0.5921569, 1,
1.319125, -1.340806, 1.091178, 1, 0, 0.5882353, 1,
1.34484, 0.9684312, 0.6730072, 1, 0, 0.5803922, 1,
1.348208, -0.3901439, 0.5177822, 1, 0, 0.5764706, 1,
1.351104, -1.529069, 1.734792, 1, 0, 0.5686275, 1,
1.357323, 0.3593655, 2.810751, 1, 0, 0.5647059, 1,
1.363785, 1.576337, 2.604974, 1, 0, 0.5568628, 1,
1.366977, 0.1291129, 2.080988, 1, 0, 0.5529412, 1,
1.376309, -0.9377286, 2.62627, 1, 0, 0.5450981, 1,
1.376411, 0.3215005, 0.7444048, 1, 0, 0.5411765, 1,
1.383749, -0.07847486, 1.204441, 1, 0, 0.5333334, 1,
1.389672, -1.363326, 3.155544, 1, 0, 0.5294118, 1,
1.395988, -1.065027, 1.487867, 1, 0, 0.5215687, 1,
1.411597, 0.648702, 0.4673462, 1, 0, 0.5176471, 1,
1.41266, -1.220235, 1.781548, 1, 0, 0.509804, 1,
1.416793, -1.801537, 2.190842, 1, 0, 0.5058824, 1,
1.423351, 0.2871839, 1.997954, 1, 0, 0.4980392, 1,
1.424549, 1.249678, 1.405563, 1, 0, 0.4901961, 1,
1.44134, -1.575896, 2.07395, 1, 0, 0.4862745, 1,
1.44962, -0.7168401, 2.588493, 1, 0, 0.4784314, 1,
1.452327, -1.681609, 2.585857, 1, 0, 0.4745098, 1,
1.490863, 1.394779, 1.088235, 1, 0, 0.4666667, 1,
1.494521, 3.27839, 1.801545, 1, 0, 0.4627451, 1,
1.49997, -0.5877681, 1.868674, 1, 0, 0.454902, 1,
1.51406, 0.7289872, 1.245582, 1, 0, 0.4509804, 1,
1.518694, -0.6628367, 2.888582, 1, 0, 0.4431373, 1,
1.519495, -2.03505, 1.784334, 1, 0, 0.4392157, 1,
1.520546, 1.537961, 0.2758774, 1, 0, 0.4313726, 1,
1.538353, 0.7532217, 3.007154, 1, 0, 0.427451, 1,
1.541869, 0.1936163, 1.009938, 1, 0, 0.4196078, 1,
1.546036, -0.02071379, 1.730917, 1, 0, 0.4156863, 1,
1.548543, 0.4753507, 1.527183, 1, 0, 0.4078431, 1,
1.552868, 0.1759304, 1.91434, 1, 0, 0.4039216, 1,
1.558068, 0.7162412, 1.458466, 1, 0, 0.3960784, 1,
1.5657, 0.3253732, 2.553841, 1, 0, 0.3882353, 1,
1.569171, 2.12016, 0.05306846, 1, 0, 0.3843137, 1,
1.573467, -0.7537904, 0.4408144, 1, 0, 0.3764706, 1,
1.580079, -0.7767714, 3.356446, 1, 0, 0.372549, 1,
1.582599, 0.06996834, 0.5510051, 1, 0, 0.3647059, 1,
1.58622, -0.6539597, 3.615574, 1, 0, 0.3607843, 1,
1.594955, -1.673362, 4.735674, 1, 0, 0.3529412, 1,
1.596882, -0.2396628, 0.9460363, 1, 0, 0.3490196, 1,
1.600491, 0.3491306, -0.5737956, 1, 0, 0.3411765, 1,
1.630262, 0.08399873, 2.089136, 1, 0, 0.3372549, 1,
1.632196, -0.5256675, 2.399201, 1, 0, 0.3294118, 1,
1.638776, -1.157054, 0.8494488, 1, 0, 0.3254902, 1,
1.654301, -1.018545, 2.05411, 1, 0, 0.3176471, 1,
1.674071, -0.4558088, 2.890582, 1, 0, 0.3137255, 1,
1.678743, -0.3652084, 1.003456, 1, 0, 0.3058824, 1,
1.682493, -0.8850338, 1.24394, 1, 0, 0.2980392, 1,
1.716179, -1.523539, 0.451135, 1, 0, 0.2941177, 1,
1.727594, -1.531835, 2.210397, 1, 0, 0.2862745, 1,
1.746392, 0.5502106, 2.0358, 1, 0, 0.282353, 1,
1.77031, 0.6734056, -1.181533, 1, 0, 0.2745098, 1,
1.779289, -1.667705, 1.46915, 1, 0, 0.2705882, 1,
1.797538, -0.8478283, 1.697643, 1, 0, 0.2627451, 1,
1.80591, 1.457321, 2.338428, 1, 0, 0.2588235, 1,
1.806813, 0.8777897, 0.2109342, 1, 0, 0.2509804, 1,
1.812128, 0.2432657, 0.3673035, 1, 0, 0.2470588, 1,
1.813076, 0.4262434, 2.128584, 1, 0, 0.2392157, 1,
1.814858, 0.03218664, 1.568515, 1, 0, 0.2352941, 1,
1.822949, -0.6848717, 1.050758, 1, 0, 0.227451, 1,
1.862084, -1.819907, 0.3971369, 1, 0, 0.2235294, 1,
1.872225, 0.4944682, 1.190214, 1, 0, 0.2156863, 1,
1.893754, 0.363727, 2.093435, 1, 0, 0.2117647, 1,
1.895436, 0.8584154, 0.7236632, 1, 0, 0.2039216, 1,
1.899917, -0.07270326, 0.6671956, 1, 0, 0.1960784, 1,
1.904984, 1.595721, 0.3946258, 1, 0, 0.1921569, 1,
1.915097, 0.5414359, 1.429679, 1, 0, 0.1843137, 1,
1.920836, 0.1810361, 0.5337582, 1, 0, 0.1803922, 1,
1.933378, -0.4732367, 0.2174356, 1, 0, 0.172549, 1,
1.963083, 0.5817484, 1.745239, 1, 0, 0.1686275, 1,
1.965854, -0.005826088, 1.727135, 1, 0, 0.1607843, 1,
1.973206, -0.008244025, -0.4063757, 1, 0, 0.1568628, 1,
1.981681, -1.584194, 1.35032, 1, 0, 0.1490196, 1,
1.997112, -1.707922, 2.874203, 1, 0, 0.145098, 1,
2.00283, 0.03347407, 2.093495, 1, 0, 0.1372549, 1,
2.01885, 2.410988, 0.3158722, 1, 0, 0.1333333, 1,
2.095758, 1.225989, 1.490269, 1, 0, 0.1254902, 1,
2.135573, 0.04715022, 1.739684, 1, 0, 0.1215686, 1,
2.142628, 1.229479, 2.840481, 1, 0, 0.1137255, 1,
2.182525, 1.015133, 1.394644, 1, 0, 0.1098039, 1,
2.210033, 0.9195979, 1.106456, 1, 0, 0.1019608, 1,
2.236039, 0.5724267, 1.421229, 1, 0, 0.09411765, 1,
2.249126, -0.06260263, 0.2204421, 1, 0, 0.09019608, 1,
2.272509, 1.099357, 1.735639, 1, 0, 0.08235294, 1,
2.277277, -1.762058, 1.680528, 1, 0, 0.07843138, 1,
2.280188, -1.098998, -0.4071498, 1, 0, 0.07058824, 1,
2.386492, 1.790143, 2.700701, 1, 0, 0.06666667, 1,
2.39836, 0.5952303, 2.09633, 1, 0, 0.05882353, 1,
2.71041, 0.2418227, 1.537335, 1, 0, 0.05490196, 1,
2.710896, -0.9729429, 1.946924, 1, 0, 0.04705882, 1,
2.743827, -2.002272, 2.265344, 1, 0, 0.04313726, 1,
2.861456, 0.9018703, 1.426924, 1, 0, 0.03529412, 1,
2.912549, -0.4417047, 0.7151486, 1, 0, 0.03137255, 1,
2.942628, -0.6757747, 1.973839, 1, 0, 0.02352941, 1,
3.027452, -0.283575, 2.535671, 1, 0, 0.01960784, 1,
3.043902, 0.8688033, 0.3618086, 1, 0, 0.01176471, 1,
3.117655, -0.1315134, 2.650068, 1, 0, 0.007843138, 1
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
-0.1028528, -4.465191, -7.164181, 0, -0.5, 0.5, 0.5,
-0.1028528, -4.465191, -7.164181, 1, -0.5, 0.5, 0.5,
-0.1028528, -4.465191, -7.164181, 1, 1.5, 0.5, 0.5,
-0.1028528, -4.465191, -7.164181, 0, 1.5, 0.5, 0.5
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
-4.415112, -0.0322473, -7.164181, 0, -0.5, 0.5, 0.5,
-4.415112, -0.0322473, -7.164181, 1, -0.5, 0.5, 0.5,
-4.415112, -0.0322473, -7.164181, 1, 1.5, 0.5, 0.5,
-4.415112, -0.0322473, -7.164181, 0, 1.5, 0.5, 0.5
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
-4.415112, -4.465191, -0.3231843, 0, -0.5, 0.5, 0.5,
-4.415112, -4.465191, -0.3231843, 1, -0.5, 0.5, 0.5,
-4.415112, -4.465191, -0.3231843, 1, 1.5, 0.5, 0.5,
-4.415112, -4.465191, -0.3231843, 0, 1.5, 0.5, 0.5
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
-3, -3.442204, -5.58549,
3, -3.442204, -5.58549,
-3, -3.442204, -5.58549,
-3, -3.612702, -5.848605,
-2, -3.442204, -5.58549,
-2, -3.612702, -5.848605,
-1, -3.442204, -5.58549,
-1, -3.612702, -5.848605,
0, -3.442204, -5.58549,
0, -3.612702, -5.848605,
1, -3.442204, -5.58549,
1, -3.612702, -5.848605,
2, -3.442204, -5.58549,
2, -3.612702, -5.848605,
3, -3.442204, -5.58549,
3, -3.612702, -5.848605
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
-3, -3.953697, -6.374835, 0, -0.5, 0.5, 0.5,
-3, -3.953697, -6.374835, 1, -0.5, 0.5, 0.5,
-3, -3.953697, -6.374835, 1, 1.5, 0.5, 0.5,
-3, -3.953697, -6.374835, 0, 1.5, 0.5, 0.5,
-2, -3.953697, -6.374835, 0, -0.5, 0.5, 0.5,
-2, -3.953697, -6.374835, 1, -0.5, 0.5, 0.5,
-2, -3.953697, -6.374835, 1, 1.5, 0.5, 0.5,
-2, -3.953697, -6.374835, 0, 1.5, 0.5, 0.5,
-1, -3.953697, -6.374835, 0, -0.5, 0.5, 0.5,
-1, -3.953697, -6.374835, 1, -0.5, 0.5, 0.5,
-1, -3.953697, -6.374835, 1, 1.5, 0.5, 0.5,
-1, -3.953697, -6.374835, 0, 1.5, 0.5, 0.5,
0, -3.953697, -6.374835, 0, -0.5, 0.5, 0.5,
0, -3.953697, -6.374835, 1, -0.5, 0.5, 0.5,
0, -3.953697, -6.374835, 1, 1.5, 0.5, 0.5,
0, -3.953697, -6.374835, 0, 1.5, 0.5, 0.5,
1, -3.953697, -6.374835, 0, -0.5, 0.5, 0.5,
1, -3.953697, -6.374835, 1, -0.5, 0.5, 0.5,
1, -3.953697, -6.374835, 1, 1.5, 0.5, 0.5,
1, -3.953697, -6.374835, 0, 1.5, 0.5, 0.5,
2, -3.953697, -6.374835, 0, -0.5, 0.5, 0.5,
2, -3.953697, -6.374835, 1, -0.5, 0.5, 0.5,
2, -3.953697, -6.374835, 1, 1.5, 0.5, 0.5,
2, -3.953697, -6.374835, 0, 1.5, 0.5, 0.5,
3, -3.953697, -6.374835, 0, -0.5, 0.5, 0.5,
3, -3.953697, -6.374835, 1, -0.5, 0.5, 0.5,
3, -3.953697, -6.374835, 1, 1.5, 0.5, 0.5,
3, -3.953697, -6.374835, 0, 1.5, 0.5, 0.5
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
-3.419976, -3, -5.58549,
-3.419976, 3, -5.58549,
-3.419976, -3, -5.58549,
-3.585832, -3, -5.848605,
-3.419976, -2, -5.58549,
-3.585832, -2, -5.848605,
-3.419976, -1, -5.58549,
-3.585832, -1, -5.848605,
-3.419976, 0, -5.58549,
-3.585832, 0, -5.848605,
-3.419976, 1, -5.58549,
-3.585832, 1, -5.848605,
-3.419976, 2, -5.58549,
-3.585832, 2, -5.848605,
-3.419976, 3, -5.58549,
-3.585832, 3, -5.848605
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
-3.917544, -3, -6.374835, 0, -0.5, 0.5, 0.5,
-3.917544, -3, -6.374835, 1, -0.5, 0.5, 0.5,
-3.917544, -3, -6.374835, 1, 1.5, 0.5, 0.5,
-3.917544, -3, -6.374835, 0, 1.5, 0.5, 0.5,
-3.917544, -2, -6.374835, 0, -0.5, 0.5, 0.5,
-3.917544, -2, -6.374835, 1, -0.5, 0.5, 0.5,
-3.917544, -2, -6.374835, 1, 1.5, 0.5, 0.5,
-3.917544, -2, -6.374835, 0, 1.5, 0.5, 0.5,
-3.917544, -1, -6.374835, 0, -0.5, 0.5, 0.5,
-3.917544, -1, -6.374835, 1, -0.5, 0.5, 0.5,
-3.917544, -1, -6.374835, 1, 1.5, 0.5, 0.5,
-3.917544, -1, -6.374835, 0, 1.5, 0.5, 0.5,
-3.917544, 0, -6.374835, 0, -0.5, 0.5, 0.5,
-3.917544, 0, -6.374835, 1, -0.5, 0.5, 0.5,
-3.917544, 0, -6.374835, 1, 1.5, 0.5, 0.5,
-3.917544, 0, -6.374835, 0, 1.5, 0.5, 0.5,
-3.917544, 1, -6.374835, 0, -0.5, 0.5, 0.5,
-3.917544, 1, -6.374835, 1, -0.5, 0.5, 0.5,
-3.917544, 1, -6.374835, 1, 1.5, 0.5, 0.5,
-3.917544, 1, -6.374835, 0, 1.5, 0.5, 0.5,
-3.917544, 2, -6.374835, 0, -0.5, 0.5, 0.5,
-3.917544, 2, -6.374835, 1, -0.5, 0.5, 0.5,
-3.917544, 2, -6.374835, 1, 1.5, 0.5, 0.5,
-3.917544, 2, -6.374835, 0, 1.5, 0.5, 0.5,
-3.917544, 3, -6.374835, 0, -0.5, 0.5, 0.5,
-3.917544, 3, -6.374835, 1, -0.5, 0.5, 0.5,
-3.917544, 3, -6.374835, 1, 1.5, 0.5, 0.5,
-3.917544, 3, -6.374835, 0, 1.5, 0.5, 0.5
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
-3.419976, -3.442204, -4,
-3.419976, -3.442204, 4,
-3.419976, -3.442204, -4,
-3.585832, -3.612702, -4,
-3.419976, -3.442204, -2,
-3.585832, -3.612702, -2,
-3.419976, -3.442204, 0,
-3.585832, -3.612702, 0,
-3.419976, -3.442204, 2,
-3.585832, -3.612702, 2,
-3.419976, -3.442204, 4,
-3.585832, -3.612702, 4
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
-3.917544, -3.953697, -4, 0, -0.5, 0.5, 0.5,
-3.917544, -3.953697, -4, 1, -0.5, 0.5, 0.5,
-3.917544, -3.953697, -4, 1, 1.5, 0.5, 0.5,
-3.917544, -3.953697, -4, 0, 1.5, 0.5, 0.5,
-3.917544, -3.953697, -2, 0, -0.5, 0.5, 0.5,
-3.917544, -3.953697, -2, 1, -0.5, 0.5, 0.5,
-3.917544, -3.953697, -2, 1, 1.5, 0.5, 0.5,
-3.917544, -3.953697, -2, 0, 1.5, 0.5, 0.5,
-3.917544, -3.953697, 0, 0, -0.5, 0.5, 0.5,
-3.917544, -3.953697, 0, 1, -0.5, 0.5, 0.5,
-3.917544, -3.953697, 0, 1, 1.5, 0.5, 0.5,
-3.917544, -3.953697, 0, 0, 1.5, 0.5, 0.5,
-3.917544, -3.953697, 2, 0, -0.5, 0.5, 0.5,
-3.917544, -3.953697, 2, 1, -0.5, 0.5, 0.5,
-3.917544, -3.953697, 2, 1, 1.5, 0.5, 0.5,
-3.917544, -3.953697, 2, 0, 1.5, 0.5, 0.5,
-3.917544, -3.953697, 4, 0, -0.5, 0.5, 0.5,
-3.917544, -3.953697, 4, 1, -0.5, 0.5, 0.5,
-3.917544, -3.953697, 4, 1, 1.5, 0.5, 0.5,
-3.917544, -3.953697, 4, 0, 1.5, 0.5, 0.5
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
-3.419976, -3.442204, -5.58549,
-3.419976, 3.377709, -5.58549,
-3.419976, -3.442204, 4.939121,
-3.419976, 3.377709, 4.939121,
-3.419976, -3.442204, -5.58549,
-3.419976, -3.442204, 4.939121,
-3.419976, 3.377709, -5.58549,
-3.419976, 3.377709, 4.939121,
-3.419976, -3.442204, -5.58549,
3.21427, -3.442204, -5.58549,
-3.419976, -3.442204, 4.939121,
3.21427, -3.442204, 4.939121,
-3.419976, 3.377709, -5.58549,
3.21427, 3.377709, -5.58549,
-3.419976, 3.377709, 4.939121,
3.21427, 3.377709, 4.939121,
3.21427, -3.442204, -5.58549,
3.21427, 3.377709, -5.58549,
3.21427, -3.442204, 4.939121,
3.21427, 3.377709, 4.939121,
3.21427, -3.442204, -5.58549,
3.21427, -3.442204, 4.939121,
3.21427, 3.377709, -5.58549,
3.21427, 3.377709, 4.939121
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
var radius = 7.575976;
var distance = 33.70637;
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
mvMatrix.translate( 0.1028528, 0.0322473, 0.3231843 );
mvMatrix.scale( 1.234699, 1.201085, 0.778299 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.70637);
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
InChI_1S_C13H9Cl2F3N<-read.table("InChI_1S_C13H9Cl2F3N.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C13H9Cl2F3N$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C13H9Cl2F3N' not found
```

```r
y<-InChI_1S_C13H9Cl2F3N$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C13H9Cl2F3N' not found
```

```r
z<-InChI_1S_C13H9Cl2F3N$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C13H9Cl2F3N' not found
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
-3.32336, 0.5877168, -0.6509867, 0, 0, 1, 1, 1,
-3.292992, -1.616602, 0.4313073, 1, 0, 0, 1, 1,
-2.735237, 2.419762, -1.258187, 1, 0, 0, 1, 1,
-2.713594, -1.062885, -3.77979, 1, 0, 0, 1, 1,
-2.638134, 0.8923265, -3.262915, 1, 0, 0, 1, 1,
-2.584993, -1.149932, -3.205691, 1, 0, 0, 1, 1,
-2.531359, 0.3043441, -1.223775, 0, 0, 0, 1, 1,
-2.444043, -1.23492, -1.868405, 0, 0, 0, 1, 1,
-2.432635, 0.1350334, -1.800273, 0, 0, 0, 1, 1,
-2.39615, -0.4548691, -2.62793, 0, 0, 0, 1, 1,
-2.386051, 1.467225, 0.1741976, 0, 0, 0, 1, 1,
-2.227895, -0.8854213, -3.767107, 0, 0, 0, 1, 1,
-2.218477, 0.3809332, -1.5362, 0, 0, 0, 1, 1,
-2.198321, 0.3472173, -2.363527, 1, 1, 1, 1, 1,
-2.186169, 0.6428143, -3.612607, 1, 1, 1, 1, 1,
-2.183288, 0.1425306, -1.360228, 1, 1, 1, 1, 1,
-2.131207, -0.9023436, -2.092537, 1, 1, 1, 1, 1,
-2.090295, -0.3526784, -1.696744, 1, 1, 1, 1, 1,
-2.041185, 0.07431392, -0.6709394, 1, 1, 1, 1, 1,
-2.037059, 0.8191645, 0.1108899, 1, 1, 1, 1, 1,
-2.032032, -0.3926795, -1.283984, 1, 1, 1, 1, 1,
-2.031902, 0.1223962, -2.534307, 1, 1, 1, 1, 1,
-2.025832, 0.04633727, -1.579688, 1, 1, 1, 1, 1,
-2.023578, -0.2645195, -0.4725424, 1, 1, 1, 1, 1,
-1.995523, -2.287582, -2.900735, 1, 1, 1, 1, 1,
-1.983486, -0.4362576, -1.411915, 1, 1, 1, 1, 1,
-1.968487, -0.9264753, -2.681017, 1, 1, 1, 1, 1,
-1.956614, 1.131166, -0.6369809, 1, 1, 1, 1, 1,
-1.921647, 0.4830608, -0.2049875, 0, 0, 1, 1, 1,
-1.89961, -0.3763001, -2.424375, 1, 0, 0, 1, 1,
-1.89757, -2.025896, -0.5914338, 1, 0, 0, 1, 1,
-1.861896, 0.1407233, -1.833471, 1, 0, 0, 1, 1,
-1.840299, -0.6563442, -2.259532, 1, 0, 0, 1, 1,
-1.80876, 0.07997022, -1.511512, 1, 0, 0, 1, 1,
-1.808206, -0.4037277, -0.4430713, 0, 0, 0, 1, 1,
-1.792953, -1.104713, -3.034071, 0, 0, 0, 1, 1,
-1.781315, 2.000754, 0.07121418, 0, 0, 0, 1, 1,
-1.76073, 0.3866076, -1.580175, 0, 0, 0, 1, 1,
-1.753991, -0.7505575, -1.5836, 0, 0, 0, 1, 1,
-1.739393, 1.05853, -1.307952, 0, 0, 0, 1, 1,
-1.695927, 0.2619982, -2.722086, 0, 0, 0, 1, 1,
-1.689539, -0.5937268, -2.298485, 1, 1, 1, 1, 1,
-1.683648, 0.9428961, -1.377706, 1, 1, 1, 1, 1,
-1.683509, 0.8250108, -2.301738, 1, 1, 1, 1, 1,
-1.676329, -0.2028348, -0.8317042, 1, 1, 1, 1, 1,
-1.672263, 0.7943869, -0.2252068, 1, 1, 1, 1, 1,
-1.660728, 0.7392188, -2.412048, 1, 1, 1, 1, 1,
-1.658956, 0.1308921, -2.382448, 1, 1, 1, 1, 1,
-1.643679, 0.3921251, -0.1603298, 1, 1, 1, 1, 1,
-1.625966, 0.1673826, -1.084474, 1, 1, 1, 1, 1,
-1.625849, -0.5419851, -1.937398, 1, 1, 1, 1, 1,
-1.596673, -0.6521177, -2.241126, 1, 1, 1, 1, 1,
-1.589886, 0.4195244, -0.9771868, 1, 1, 1, 1, 1,
-1.588422, 1.567246, -2.693456, 1, 1, 1, 1, 1,
-1.580626, 0.6670168, -3.15296, 1, 1, 1, 1, 1,
-1.574628, 0.08425601, -1.37475, 1, 1, 1, 1, 1,
-1.57117, -0.4445678, -1.989441, 0, 0, 1, 1, 1,
-1.570585, 0.2186946, -0.797304, 1, 0, 0, 1, 1,
-1.563541, -1.106922, -1.221442, 1, 0, 0, 1, 1,
-1.541092, -0.2316947, -1.905398, 1, 0, 0, 1, 1,
-1.522143, 0.4187585, -0.7587037, 1, 0, 0, 1, 1,
-1.518799, -1.435134, -3.336945, 1, 0, 0, 1, 1,
-1.509493, -1.389678, 0.1611646, 0, 0, 0, 1, 1,
-1.504895, -0.1803867, -0.587316, 0, 0, 0, 1, 1,
-1.502831, 2.167553, 1.00686, 0, 0, 0, 1, 1,
-1.50208, -0.9636988, -0.815655, 0, 0, 0, 1, 1,
-1.501857, -0.299812, -3.044872, 0, 0, 0, 1, 1,
-1.500144, -1.603851, -2.049347, 0, 0, 0, 1, 1,
-1.495109, -0.2278302, -0.8640661, 0, 0, 0, 1, 1,
-1.492111, 0.5738689, -1.264006, 1, 1, 1, 1, 1,
-1.471184, -0.8646225, -1.649239, 1, 1, 1, 1, 1,
-1.468283, 1.987031, 0.1464692, 1, 1, 1, 1, 1,
-1.467323, -1.039431, -3.148546, 1, 1, 1, 1, 1,
-1.464965, 0.3993957, -2.871242, 1, 1, 1, 1, 1,
-1.450089, -1.483039, -0.694504, 1, 1, 1, 1, 1,
-1.444005, -0.7381002, -1.544701, 1, 1, 1, 1, 1,
-1.442133, 0.06684078, -1.979472, 1, 1, 1, 1, 1,
-1.441433, 0.7309072, -0.7582612, 1, 1, 1, 1, 1,
-1.4366, 0.2977946, -1.042426, 1, 1, 1, 1, 1,
-1.436031, 1.567832, -3.028715, 1, 1, 1, 1, 1,
-1.405848, -0.1035518, -0.6068976, 1, 1, 1, 1, 1,
-1.393619, 0.07583845, -2.721126, 1, 1, 1, 1, 1,
-1.372785, 0.706107, -2.898269, 1, 1, 1, 1, 1,
-1.368894, 0.7585352, -2.23346, 1, 1, 1, 1, 1,
-1.366521, -0.001853198, -1.109512, 0, 0, 1, 1, 1,
-1.365868, -1.745484, -3.106734, 1, 0, 0, 1, 1,
-1.365016, -0.8938345, -1.393225, 1, 0, 0, 1, 1,
-1.35526, -1.717047, -0.8698843, 1, 0, 0, 1, 1,
-1.340258, 0.3874106, -1.359492, 1, 0, 0, 1, 1,
-1.339908, -0.9955229, -3.410385, 1, 0, 0, 1, 1,
-1.335847, -0.4152304, -1.107099, 0, 0, 0, 1, 1,
-1.330118, 1.017382, -1.53782, 0, 0, 0, 1, 1,
-1.328958, -0.3323987, -2.783049, 0, 0, 0, 1, 1,
-1.320087, 0.1651632, -2.167423, 0, 0, 0, 1, 1,
-1.314399, -0.6015046, -0.9382438, 0, 0, 0, 1, 1,
-1.308361, 0.6375188, -2.831726, 0, 0, 0, 1, 1,
-1.296303, 0.1659304, -0.3002188, 0, 0, 0, 1, 1,
-1.28486, -0.434955, -3.661367, 1, 1, 1, 1, 1,
-1.27435, -1.429638, -1.191126, 1, 1, 1, 1, 1,
-1.253465, -0.3689652, -1.836842, 1, 1, 1, 1, 1,
-1.25029, -1.111912, -2.262328, 1, 1, 1, 1, 1,
-1.249018, -1.467348, -3.632865, 1, 1, 1, 1, 1,
-1.243836, -0.8808706, -2.904466, 1, 1, 1, 1, 1,
-1.238506, 0.828517, -1.513398, 1, 1, 1, 1, 1,
-1.238427, 1.20518, -1.547892, 1, 1, 1, 1, 1,
-1.233203, -0.6242954, -0.7235366, 1, 1, 1, 1, 1,
-1.22845, 0.08431817, -1.121687, 1, 1, 1, 1, 1,
-1.222978, 0.3454665, -1.276078, 1, 1, 1, 1, 1,
-1.215882, 0.5905819, -0.8447664, 1, 1, 1, 1, 1,
-1.203834, -0.1606213, -1.744232, 1, 1, 1, 1, 1,
-1.199134, -1.147545, -3.242409, 1, 1, 1, 1, 1,
-1.190874, -2.511028, -2.545471, 1, 1, 1, 1, 1,
-1.187303, -0.04994184, -0.9528217, 0, 0, 1, 1, 1,
-1.185814, 0.08909021, -0.3897415, 1, 0, 0, 1, 1,
-1.175009, 0.8701309, -1.693499, 1, 0, 0, 1, 1,
-1.164008, -1.109761, -3.318563, 1, 0, 0, 1, 1,
-1.162575, 1.127758, 0.2013996, 1, 0, 0, 1, 1,
-1.159879, 0.005963264, -0.4778098, 1, 0, 0, 1, 1,
-1.151234, -1.513583, -2.797181, 0, 0, 0, 1, 1,
-1.1497, -0.09613792, -2.312032, 0, 0, 0, 1, 1,
-1.148923, 0.6369393, -1.378477, 0, 0, 0, 1, 1,
-1.146811, -0.2590038, -1.727973, 0, 0, 0, 1, 1,
-1.140971, -0.05584145, -3.506307, 0, 0, 0, 1, 1,
-1.114593, -0.07062028, -1.680949, 0, 0, 0, 1, 1,
-1.108234, -2.212769, -2.070426, 0, 0, 0, 1, 1,
-1.098821, -0.2580588, -0.2302905, 1, 1, 1, 1, 1,
-1.098516, -0.797078, -4.167364, 1, 1, 1, 1, 1,
-1.098042, 0.4739039, -1.777499, 1, 1, 1, 1, 1,
-1.095865, -0.514188, -0.2690005, 1, 1, 1, 1, 1,
-1.095254, -0.09142664, -2.935878, 1, 1, 1, 1, 1,
-1.090499, -0.9202785, -2.445074, 1, 1, 1, 1, 1,
-1.087682, -1.119873, -2.776045, 1, 1, 1, 1, 1,
-1.073719, -0.9130033, -2.148732, 1, 1, 1, 1, 1,
-1.073262, -0.6021436, -1.455284, 1, 1, 1, 1, 1,
-1.073228, 1.057448, 0.006940091, 1, 1, 1, 1, 1,
-1.065225, -0.3652798, -0.08194616, 1, 1, 1, 1, 1,
-1.057878, -1.801629, -2.921792, 1, 1, 1, 1, 1,
-1.042429, 0.8389118, -0.9487447, 1, 1, 1, 1, 1,
-1.041006, 1.577941, -1.26465, 1, 1, 1, 1, 1,
-1.035862, 0.2539712, 0.07702176, 1, 1, 1, 1, 1,
-1.032928, -0.2495702, -3.131361, 0, 0, 1, 1, 1,
-1.030768, 1.042519, 0.9351854, 1, 0, 0, 1, 1,
-1.030416, 0.9150357, -1.700491, 1, 0, 0, 1, 1,
-1.028657, -0.4614028, -0.8735172, 1, 0, 0, 1, 1,
-1.028059, 1.186035, -1.098737, 1, 0, 0, 1, 1,
-1.025395, 0.2882009, -1.767225, 1, 0, 0, 1, 1,
-1.023853, -0.6814446, -3.689922, 0, 0, 0, 1, 1,
-1.020096, 1.405906, -1.781994, 0, 0, 0, 1, 1,
-1.017771, -2.334577, -0.8966007, 0, 0, 0, 1, 1,
-1.014102, 0.0597998, -1.52602, 0, 0, 0, 1, 1,
-1.011706, -0.3488548, -2.892189, 0, 0, 0, 1, 1,
-1.011105, -0.1225787, -0.9158996, 0, 0, 0, 1, 1,
-1.010634, 0.9091032, -0.2251031, 0, 0, 0, 1, 1,
-1.009548, 1.064753, 0.2268282, 1, 1, 1, 1, 1,
-1.004587, 0.2701688, -2.642174, 1, 1, 1, 1, 1,
-1.002724, -1.709885, -2.705781, 1, 1, 1, 1, 1,
-0.9996067, 0.5553768, 0.3832639, 1, 1, 1, 1, 1,
-0.9982668, -1.981467, -1.736421, 1, 1, 1, 1, 1,
-0.9909961, 1.37498, 0.4382332, 1, 1, 1, 1, 1,
-0.9841122, -0.2108017, -0.8305016, 1, 1, 1, 1, 1,
-0.9803588, 0.4039023, -1.414395, 1, 1, 1, 1, 1,
-0.9784134, 1.294303, -0.1339696, 1, 1, 1, 1, 1,
-0.9763501, 1.143814, -1.141908, 1, 1, 1, 1, 1,
-0.9681121, 0.7202103, -0.1909015, 1, 1, 1, 1, 1,
-0.9680511, 0.1989393, -1.964196, 1, 1, 1, 1, 1,
-0.9504988, -0.5430975, -2.027595, 1, 1, 1, 1, 1,
-0.945917, -0.5769362, -0.7024367, 1, 1, 1, 1, 1,
-0.9390813, -0.9810537, -1.964989, 1, 1, 1, 1, 1,
-0.9375222, 0.2074395, -3.465862, 0, 0, 1, 1, 1,
-0.9349528, 0.8256549, -0.2986098, 1, 0, 0, 1, 1,
-0.9314806, -0.8685756, -2.009255, 1, 0, 0, 1, 1,
-0.9257997, 0.1514916, -0.9298223, 1, 0, 0, 1, 1,
-0.9206322, 1.076521, 0.4470676, 1, 0, 0, 1, 1,
-0.9188932, 0.4139948, -0.4133948, 1, 0, 0, 1, 1,
-0.9155164, 1.181773, -2.31713, 0, 0, 0, 1, 1,
-0.9095191, 1.711009, 0.4009219, 0, 0, 0, 1, 1,
-0.9005352, 0.3755438, -0.5440667, 0, 0, 0, 1, 1,
-0.8980017, 0.211597, -1.497075, 0, 0, 0, 1, 1,
-0.8942062, 1.261272, -1.997863, 0, 0, 0, 1, 1,
-0.8833466, -0.335766, -0.8690266, 0, 0, 0, 1, 1,
-0.8762989, -0.9129429, -3.558682, 0, 0, 0, 1, 1,
-0.871411, -0.5354007, -1.786996, 1, 1, 1, 1, 1,
-0.8627112, 0.4361789, 0.4034274, 1, 1, 1, 1, 1,
-0.8589933, 0.6419829, -0.188142, 1, 1, 1, 1, 1,
-0.8515356, -0.4839303, -1.714996, 1, 1, 1, 1, 1,
-0.8503488, 0.00166768, -1.636539, 1, 1, 1, 1, 1,
-0.8468953, -0.196048, -1.798221, 1, 1, 1, 1, 1,
-0.8465133, -0.9845717, -1.826288, 1, 1, 1, 1, 1,
-0.8450757, 1.275397, -1.513563, 1, 1, 1, 1, 1,
-0.8394365, -0.989877, -3.384498, 1, 1, 1, 1, 1,
-0.8390332, -1.830183, -1.793929, 1, 1, 1, 1, 1,
-0.8324156, 0.3912381, -1.19019, 1, 1, 1, 1, 1,
-0.8156055, -0.1710407, -1.751447, 1, 1, 1, 1, 1,
-0.8105786, 0.6875228, -1.153626, 1, 1, 1, 1, 1,
-0.8013656, 0.1735433, -0.07573498, 1, 1, 1, 1, 1,
-0.7980674, 1.283159, 1.218523, 1, 1, 1, 1, 1,
-0.7955206, 0.244295, -1.670228, 0, 0, 1, 1, 1,
-0.7887945, -0.2994016, -1.325102, 1, 0, 0, 1, 1,
-0.7791291, -0.5797366, -2.368872, 1, 0, 0, 1, 1,
-0.777638, 0.7272137, -0.7663972, 1, 0, 0, 1, 1,
-0.7771691, 1.43989, 0.2664768, 1, 0, 0, 1, 1,
-0.7732235, -0.08164944, -1.77238, 1, 0, 0, 1, 1,
-0.771601, 1.167848, -0.5182977, 0, 0, 0, 1, 1,
-0.7675031, -0.6364793, -2.668298, 0, 0, 0, 1, 1,
-0.7656019, 1.665316, -0.1148252, 0, 0, 0, 1, 1,
-0.7649329, 1.398246, 0.1338012, 0, 0, 0, 1, 1,
-0.7613502, -0.4487314, -0.8186889, 0, 0, 0, 1, 1,
-0.756982, 1.39203, 1.931866, 0, 0, 0, 1, 1,
-0.750398, 0.009912462, -0.4627008, 0, 0, 0, 1, 1,
-0.7431886, -0.1123706, -1.01601, 1, 1, 1, 1, 1,
-0.7418849, 0.8640702, -0.9979885, 1, 1, 1, 1, 1,
-0.735845, 2.237728, -0.5211229, 1, 1, 1, 1, 1,
-0.7353206, -1.004783, -3.650749, 1, 1, 1, 1, 1,
-0.7280172, 2.740631, -1.590846, 1, 1, 1, 1, 1,
-0.7199637, -0.4558443, -3.515394, 1, 1, 1, 1, 1,
-0.7195626, -1.422519, -2.375456, 1, 1, 1, 1, 1,
-0.7170269, 1.47496, -0.9900991, 1, 1, 1, 1, 1,
-0.7120376, 1.449393, -0.9202263, 1, 1, 1, 1, 1,
-0.7113135, 0.02132177, -0.6959152, 1, 1, 1, 1, 1,
-0.7109376, 1.544834, 0.2384958, 1, 1, 1, 1, 1,
-0.7091549, -0.2810628, -1.56843, 1, 1, 1, 1, 1,
-0.7047691, -1.110559, -3.503603, 1, 1, 1, 1, 1,
-0.6977459, 0.9587669, 0.7639768, 1, 1, 1, 1, 1,
-0.6977365, 1.980688, 0.03645605, 1, 1, 1, 1, 1,
-0.694262, -0.1699746, -1.022957, 0, 0, 1, 1, 1,
-0.6931815, -1.561846, -4.96019, 1, 0, 0, 1, 1,
-0.6930475, 0.3967941, -1.363499, 1, 0, 0, 1, 1,
-0.6875515, -0.09503013, -1.039871, 1, 0, 0, 1, 1,
-0.6814354, -0.4409713, -3.579979, 1, 0, 0, 1, 1,
-0.6809943, 0.4722911, -0.4158124, 1, 0, 0, 1, 1,
-0.6801051, -0.3018838, -1.096632, 0, 0, 0, 1, 1,
-0.676981, 1.092266, 0.564656, 0, 0, 0, 1, 1,
-0.6757343, -1.370163, -3.466394, 0, 0, 0, 1, 1,
-0.6751626, 0.4036628, -2.853793, 0, 0, 0, 1, 1,
-0.6732746, -2.326925, -2.941209, 0, 0, 0, 1, 1,
-0.6731241, 1.178395, -0.7355033, 0, 0, 0, 1, 1,
-0.6700506, 0.2342943, -1.34386, 0, 0, 0, 1, 1,
-0.667033, 1.352994, -0.248334, 1, 1, 1, 1, 1,
-0.6645944, 1.706246, -0.4530613, 1, 1, 1, 1, 1,
-0.6630645, -0.8206018, -4.037005, 1, 1, 1, 1, 1,
-0.6619864, 2.123367, 1.461929, 1, 1, 1, 1, 1,
-0.6606621, 0.8474418, -2.101857, 1, 1, 1, 1, 1,
-0.6598868, -0.5254233, -2.814048, 1, 1, 1, 1, 1,
-0.6579096, -0.9074607, -1.534402, 1, 1, 1, 1, 1,
-0.6562334, 1.498093, -1.18128, 1, 1, 1, 1, 1,
-0.6554024, -0.2013265, -2.836789, 1, 1, 1, 1, 1,
-0.6497649, -0.6762377, -2.730447, 1, 1, 1, 1, 1,
-0.6294118, 1.395646, -0.2814386, 1, 1, 1, 1, 1,
-0.6293384, 0.9296461, -1.680466, 1, 1, 1, 1, 1,
-0.6261884, -0.7874274, -3.833515, 1, 1, 1, 1, 1,
-0.6257597, 0.7208239, -1.493135, 1, 1, 1, 1, 1,
-0.6242301, 0.67662, -0.4800208, 1, 1, 1, 1, 1,
-0.6212949, 0.1684228, 0.6620004, 0, 0, 1, 1, 1,
-0.6200699, -2.080699, -1.799656, 1, 0, 0, 1, 1,
-0.6164501, -1.60616, -1.525535, 1, 0, 0, 1, 1,
-0.6156688, 0.08575764, -2.431714, 1, 0, 0, 1, 1,
-0.6133152, 0.202219, -2.61355, 1, 0, 0, 1, 1,
-0.6129232, -2.697049, -3.943734, 1, 0, 0, 1, 1,
-0.6056899, -0.2551404, -2.203245, 0, 0, 0, 1, 1,
-0.6044042, -0.8157747, -1.86062, 0, 0, 0, 1, 1,
-0.5988131, 1.142583, -0.2102735, 0, 0, 0, 1, 1,
-0.5964441, -0.09575141, -2.524861, 0, 0, 0, 1, 1,
-0.588544, 0.6712262, 0.1033305, 0, 0, 0, 1, 1,
-0.5882693, 0.1629004, -1.315889, 0, 0, 0, 1, 1,
-0.586051, -0.110456, -1.160413, 0, 0, 0, 1, 1,
-0.5788966, 1.067993, 0.2834473, 1, 1, 1, 1, 1,
-0.5754981, 0.06519828, -1.183835, 1, 1, 1, 1, 1,
-0.5729038, -0.1261996, -3.010982, 1, 1, 1, 1, 1,
-0.5689833, -0.4791885, -4.813284, 1, 1, 1, 1, 1,
-0.5667081, -0.2541201, -1.369329, 1, 1, 1, 1, 1,
-0.5664436, -1.342202, -2.86999, 1, 1, 1, 1, 1,
-0.5651975, -0.6847265, -2.258745, 1, 1, 1, 1, 1,
-0.5645505, -0.9268858, -3.686462, 1, 1, 1, 1, 1,
-0.5636742, -1.694197, -3.526554, 1, 1, 1, 1, 1,
-0.5627031, -0.2960955, -1.235331, 1, 1, 1, 1, 1,
-0.5614693, -2.548635, -3.207469, 1, 1, 1, 1, 1,
-0.5608597, -0.5703362, -1.491314, 1, 1, 1, 1, 1,
-0.5512287, -0.5231262, -0.4025719, 1, 1, 1, 1, 1,
-0.5470051, 1.239148, 0.1737396, 1, 1, 1, 1, 1,
-0.5427993, 1.606596, 1.728673, 1, 1, 1, 1, 1,
-0.5403993, -0.1967178, -3.997756, 0, 0, 1, 1, 1,
-0.5378211, -0.2682996, -2.41301, 1, 0, 0, 1, 1,
-0.5354845, 0.7308065, 0.04054065, 1, 0, 0, 1, 1,
-0.5343102, -0.08501445, -1.475353, 1, 0, 0, 1, 1,
-0.5302667, 2.049026, -1.331603, 1, 0, 0, 1, 1,
-0.5289546, -0.7327443, -3.787112, 1, 0, 0, 1, 1,
-0.527739, -0.1447385, -2.797511, 0, 0, 0, 1, 1,
-0.525744, -0.5791343, -2.885391, 0, 0, 0, 1, 1,
-0.5193817, 0.4469022, -2.008032, 0, 0, 0, 1, 1,
-0.519114, -1.183735, -3.477318, 0, 0, 0, 1, 1,
-0.5093843, -0.241703, -1.52528, 0, 0, 0, 1, 1,
-0.508971, 2.44756, -0.755541, 0, 0, 0, 1, 1,
-0.5082492, -1.074478, -1.02473, 0, 0, 0, 1, 1,
-0.5034525, 0.9678955, 0.03616109, 1, 1, 1, 1, 1,
-0.5001113, -0.6822564, -0.2762669, 1, 1, 1, 1, 1,
-0.4963637, 0.4922184, -1.861672, 1, 1, 1, 1, 1,
-0.4951859, -0.9452602, -4.011368, 1, 1, 1, 1, 1,
-0.494911, -0.8099378, -5.432219, 1, 1, 1, 1, 1,
-0.4933991, 0.6427013, 0.1240066, 1, 1, 1, 1, 1,
-0.4915094, -0.3348037, -0.7317066, 1, 1, 1, 1, 1,
-0.4869863, 0.4563784, 0.4881119, 1, 1, 1, 1, 1,
-0.4853004, -0.5284272, -0.9229203, 1, 1, 1, 1, 1,
-0.4832546, -0.2531537, -0.9300846, 1, 1, 1, 1, 1,
-0.4818485, -1.779731, -3.361527, 1, 1, 1, 1, 1,
-0.4722249, -1.177685, -1.810701, 1, 1, 1, 1, 1,
-0.4717382, 1.967493, -0.4188647, 1, 1, 1, 1, 1,
-0.4713056, 0.4136882, -0.6909608, 1, 1, 1, 1, 1,
-0.4709668, -0.5308581, -2.698645, 1, 1, 1, 1, 1,
-0.4669268, 0.9958103, 0.03205475, 0, 0, 1, 1, 1,
-0.4658788, -0.06525616, -0.6316683, 1, 0, 0, 1, 1,
-0.4656884, 0.7437145, 0.06946007, 1, 0, 0, 1, 1,
-0.4653737, -0.8308907, -2.681022, 1, 0, 0, 1, 1,
-0.4653512, 0.3959316, -1.307558, 1, 0, 0, 1, 1,
-0.4625671, 0.6609728, 0.8894995, 1, 0, 0, 1, 1,
-0.4619835, 0.6806443, -2.283581, 0, 0, 0, 1, 1,
-0.4560265, -0.3218933, -3.250329, 0, 0, 0, 1, 1,
-0.4543296, 1.413979, -0.8610819, 0, 0, 0, 1, 1,
-0.4521938, -1.039108, -1.738464, 0, 0, 0, 1, 1,
-0.4419897, -0.02048011, -0.8288729, 0, 0, 0, 1, 1,
-0.4415874, -1.181146, -2.534595, 0, 0, 0, 1, 1,
-0.4354772, 1.680987, 0.5917864, 0, 0, 0, 1, 1,
-0.4331758, -0.7831143, -3.285755, 1, 1, 1, 1, 1,
-0.4307401, -1.033772, -1.981033, 1, 1, 1, 1, 1,
-0.4263526, -0.4272736, 0.4279986, 1, 1, 1, 1, 1,
-0.4256991, -1.147164, -3.502819, 1, 1, 1, 1, 1,
-0.4233941, -0.6036578, -2.414411, 1, 1, 1, 1, 1,
-0.4228196, 1.267658, 0.8967834, 1, 1, 1, 1, 1,
-0.421208, -0.7830871, -4.024604, 1, 1, 1, 1, 1,
-0.4194557, 0.9711553, -0.2021211, 1, 1, 1, 1, 1,
-0.4056277, 1.205981, -2.570958, 1, 1, 1, 1, 1,
-0.4054732, -1.472526, -4.301096, 1, 1, 1, 1, 1,
-0.3907413, 0.5836358, -0.6523532, 1, 1, 1, 1, 1,
-0.3859301, -1.232264, -3.054138, 1, 1, 1, 1, 1,
-0.3830712, 0.7833005, 2.13783, 1, 1, 1, 1, 1,
-0.3821456, -0.07820154, -1.56124, 1, 1, 1, 1, 1,
-0.3806601, 0.1599929, -0.7532088, 1, 1, 1, 1, 1,
-0.3784877, 0.5184783, -0.5663577, 0, 0, 1, 1, 1,
-0.3782857, 0.2088116, 0.2048639, 1, 0, 0, 1, 1,
-0.3780388, 0.4735176, -1.640098, 1, 0, 0, 1, 1,
-0.3778732, -0.04734354, -2.759202, 1, 0, 0, 1, 1,
-0.3756271, -0.8238401, -3.940224, 1, 0, 0, 1, 1,
-0.3723821, -1.194093, -2.564908, 1, 0, 0, 1, 1,
-0.3697667, 1.041435, 0.949254, 0, 0, 0, 1, 1,
-0.3683596, 0.9633374, -0.03110463, 0, 0, 0, 1, 1,
-0.3669552, -0.009183239, -0.6064313, 0, 0, 0, 1, 1,
-0.3668235, -2.496144, -3.338402, 0, 0, 0, 1, 1,
-0.3644433, 0.09682829, -0.2994719, 0, 0, 0, 1, 1,
-0.363117, -2.628953, -4.300441, 0, 0, 0, 1, 1,
-0.3595659, 0.519086, -0.01350594, 0, 0, 0, 1, 1,
-0.3567432, 0.3399511, -0.5291193, 1, 1, 1, 1, 1,
-0.3493304, 1.105519, 1.174402, 1, 1, 1, 1, 1,
-0.3429236, -0.08423373, -1.373104, 1, 1, 1, 1, 1,
-0.3388472, -0.5125467, -1.354708, 1, 1, 1, 1, 1,
-0.3273494, 0.1851616, 0.02328371, 1, 1, 1, 1, 1,
-0.3216123, -0.7770272, -3.530075, 1, 1, 1, 1, 1,
-0.3214984, -0.03805157, -1.992614, 1, 1, 1, 1, 1,
-0.3212402, -0.07518621, -2.548063, 1, 1, 1, 1, 1,
-0.3194799, -1.348434, -2.342777, 1, 1, 1, 1, 1,
-0.3158826, -1.281362, -3.569391, 1, 1, 1, 1, 1,
-0.3133264, 0.4296712, -0.2335551, 1, 1, 1, 1, 1,
-0.3103935, -0.4616364, -3.544125, 1, 1, 1, 1, 1,
-0.3084662, -1.919813, -4.212965, 1, 1, 1, 1, 1,
-0.3083629, -0.852946, -1.442596, 1, 1, 1, 1, 1,
-0.3072814, -0.2574142, -2.667994, 1, 1, 1, 1, 1,
-0.3062031, 0.5539761, -0.9079896, 0, 0, 1, 1, 1,
-0.3044345, -0.7639423, -3.747073, 1, 0, 0, 1, 1,
-0.2997929, -2.11536, -3.841134, 1, 0, 0, 1, 1,
-0.2893412, -0.5052449, -1.728591, 1, 0, 0, 1, 1,
-0.289236, -0.7138133, -4.123254, 1, 0, 0, 1, 1,
-0.2871714, -1.083326, -0.8765646, 1, 0, 0, 1, 1,
-0.2786664, -0.7709085, -3.441634, 0, 0, 0, 1, 1,
-0.2781712, -0.912141, -2.384115, 0, 0, 0, 1, 1,
-0.2779821, -1.176803, -3.070668, 0, 0, 0, 1, 1,
-0.277782, 1.03042, -0.3157821, 0, 0, 0, 1, 1,
-0.2768834, 1.679763, 1.448008, 0, 0, 0, 1, 1,
-0.2743476, -0.2987096, -3.943194, 0, 0, 0, 1, 1,
-0.2741821, -1.196394, -3.583599, 0, 0, 0, 1, 1,
-0.2739694, 1.27108, 0.3800706, 1, 1, 1, 1, 1,
-0.2692584, 0.8433744, 1.513608, 1, 1, 1, 1, 1,
-0.2688507, 0.4405074, 0.4204882, 1, 1, 1, 1, 1,
-0.2676101, 0.3140777, -0.4374123, 1, 1, 1, 1, 1,
-0.2577199, 0.03200329, -3.767256, 1, 1, 1, 1, 1,
-0.2572427, -0.927214, -3.348903, 1, 1, 1, 1, 1,
-0.256024, -1.12247, -3.110945, 1, 1, 1, 1, 1,
-0.2554641, 1.20775, -1.431316, 1, 1, 1, 1, 1,
-0.2553611, -1.43708, -2.562447, 1, 1, 1, 1, 1,
-0.2518308, 0.1795227, -0.8254073, 1, 1, 1, 1, 1,
-0.249196, -0.792693, -1.574751, 1, 1, 1, 1, 1,
-0.2479154, 2.935662, -0.8930553, 1, 1, 1, 1, 1,
-0.2408789, -0.1102737, -4.464716, 1, 1, 1, 1, 1,
-0.2346477, -3.080839, -3.848225, 1, 1, 1, 1, 1,
-0.2288235, 0.1595044, -2.706921, 1, 1, 1, 1, 1,
-0.2238972, 2.415276, 0.7872681, 0, 0, 1, 1, 1,
-0.2199493, -0.9893433, -2.757329, 1, 0, 0, 1, 1,
-0.2182109, 0.5521758, 0.03562595, 1, 0, 0, 1, 1,
-0.2134394, -0.3253546, -1.555303, 1, 0, 0, 1, 1,
-0.2121074, -0.0809515, -2.339556, 1, 0, 0, 1, 1,
-0.2095631, 0.2113923, 1.043234, 1, 0, 0, 1, 1,
-0.2074827, -0.6844221, -1.842537, 0, 0, 0, 1, 1,
-0.2073804, 0.1415364, -2.891449, 0, 0, 0, 1, 1,
-0.2066654, -0.2220544, -1.142043, 0, 0, 0, 1, 1,
-0.1992656, 0.4266842, 1.677261, 0, 0, 0, 1, 1,
-0.195391, -0.9344779, -2.613185, 0, 0, 0, 1, 1,
-0.1949341, 1.362221, 2.466043, 0, 0, 0, 1, 1,
-0.1939646, -1.918988, -1.227317, 0, 0, 0, 1, 1,
-0.1939114, -0.3456412, -3.0967, 1, 1, 1, 1, 1,
-0.1918288, 0.2110154, -1.133289, 1, 1, 1, 1, 1,
-0.1910939, 0.5619848, -0.5877264, 1, 1, 1, 1, 1,
-0.1909262, -0.8350503, -2.093979, 1, 1, 1, 1, 1,
-0.1897193, 0.2934804, -0.1709724, 1, 1, 1, 1, 1,
-0.1889125, -2.402711, -2.852917, 1, 1, 1, 1, 1,
-0.1882874, -0.04342234, -1.008232, 1, 1, 1, 1, 1,
-0.1861935, -2.067355, -3.30394, 1, 1, 1, 1, 1,
-0.1854447, 0.6462054, -1.41502, 1, 1, 1, 1, 1,
-0.1780007, -0.3029864, -2.845273, 1, 1, 1, 1, 1,
-0.1777278, -0.3503272, -4.053171, 1, 1, 1, 1, 1,
-0.1751957, -0.475553, -2.737456, 1, 1, 1, 1, 1,
-0.1722624, -1.263751, -4.936527, 1, 1, 1, 1, 1,
-0.172116, -0.659798, -2.907305, 1, 1, 1, 1, 1,
-0.1714509, -1.176798, -3.182323, 1, 1, 1, 1, 1,
-0.1709207, 0.4405328, -0.4522361, 0, 0, 1, 1, 1,
-0.169983, -0.5590289, -3.599202, 1, 0, 0, 1, 1,
-0.1673709, 0.1916262, -1.287982, 1, 0, 0, 1, 1,
-0.1645979, 0.2026593, 1.695081, 1, 0, 0, 1, 1,
-0.1645041, -1.667442, -2.965931, 1, 0, 0, 1, 1,
-0.160737, 0.6129525, -0.8806076, 1, 0, 0, 1, 1,
-0.1605024, -0.1063906, -2.144519, 0, 0, 0, 1, 1,
-0.1596431, -0.5465056, -4.168124, 0, 0, 0, 1, 1,
-0.1564034, -0.4833741, -2.01712, 0, 0, 0, 1, 1,
-0.1438339, -0.9619819, -4.109547, 0, 0, 0, 1, 1,
-0.1417173, 1.255514, -2.443095, 0, 0, 0, 1, 1,
-0.1384863, 1.433847, -0.02057648, 0, 0, 0, 1, 1,
-0.1369612, 1.413161, 1.348248, 0, 0, 0, 1, 1,
-0.1329899, 0.6053811, 0.1535357, 1, 1, 1, 1, 1,
-0.1295857, 0.4325057, -0.2848173, 1, 1, 1, 1, 1,
-0.1288829, -1.114811, -3.030451, 1, 1, 1, 1, 1,
-0.1208578, -0.7943875, -2.971141, 1, 1, 1, 1, 1,
-0.116942, 1.164018, 0.4731514, 1, 1, 1, 1, 1,
-0.1166977, -1.197191, -2.915338, 1, 1, 1, 1, 1,
-0.1149272, -0.2125364, -2.236654, 1, 1, 1, 1, 1,
-0.114224, -0.46925, -3.536638, 1, 1, 1, 1, 1,
-0.1134359, -0.3115098, -4.875291, 1, 1, 1, 1, 1,
-0.1116453, -2.108188, -3.018473, 1, 1, 1, 1, 1,
-0.110305, 0.5666089, 0.2871274, 1, 1, 1, 1, 1,
-0.1067345, -0.0805143, -2.35623, 1, 1, 1, 1, 1,
-0.1061227, 0.6764261, -0.2080932, 1, 1, 1, 1, 1,
-0.1054244, 0.2555261, -0.1399103, 1, 1, 1, 1, 1,
-0.1007264, 0.02355802, -1.16348, 1, 1, 1, 1, 1,
-0.1005657, 0.7912174, -0.6656586, 0, 0, 1, 1, 1,
-0.09970552, 0.1312193, -2.321384, 1, 0, 0, 1, 1,
-0.09610869, 1.163642, 0.3704555, 1, 0, 0, 1, 1,
-0.09429527, -1.089879, -3.084885, 1, 0, 0, 1, 1,
-0.09220801, -0.3115475, -1.495991, 1, 0, 0, 1, 1,
-0.08774941, -0.5176712, -2.791663, 1, 0, 0, 1, 1,
-0.08764209, 1.813554, -1.372996, 0, 0, 0, 1, 1,
-0.07752641, -0.43255, -3.602918, 0, 0, 0, 1, 1,
-0.07613175, 0.4416828, 0.5163381, 0, 0, 0, 1, 1,
-0.07141216, 0.7233521, -1.708494, 0, 0, 0, 1, 1,
-0.07026041, -0.9427665, -2.260314, 0, 0, 0, 1, 1,
-0.06926326, 1.9888, -0.6092815, 0, 0, 0, 1, 1,
-0.06649176, -0.8713445, -3.708233, 0, 0, 0, 1, 1,
-0.06633035, -0.5662996, -3.275993, 1, 1, 1, 1, 1,
-0.05940253, -1.236216, -3.844381, 1, 1, 1, 1, 1,
-0.05563194, -0.2360709, -3.515562, 1, 1, 1, 1, 1,
-0.05438195, 2.525081, -0.01352356, 1, 1, 1, 1, 1,
-0.05158476, -0.4381077, -2.032786, 1, 1, 1, 1, 1,
-0.04681488, -0.7121595, -2.681063, 1, 1, 1, 1, 1,
-0.04578499, -0.7279112, -4.644361, 1, 1, 1, 1, 1,
-0.04416277, -2.176246, -4.39434, 1, 1, 1, 1, 1,
-0.04342185, -0.8031614, 0.099608, 1, 1, 1, 1, 1,
-0.036995, 0.2737139, -0.7956955, 1, 1, 1, 1, 1,
-0.03599435, -1.308709, -3.599264, 1, 1, 1, 1, 1,
-0.03519443, -0.2714935, -4.613811, 1, 1, 1, 1, 1,
-0.03274451, -0.4766209, -3.382262, 1, 1, 1, 1, 1,
-0.03115014, 0.3168506, -0.4614024, 1, 1, 1, 1, 1,
-0.03066971, 1.195605, 0.1499819, 1, 1, 1, 1, 1,
-0.03006226, 0.3299313, -1.000142, 0, 0, 1, 1, 1,
-0.02832513, -0.2258514, -1.423043, 1, 0, 0, 1, 1,
-0.02793669, -0.2799627, -3.682288, 1, 0, 0, 1, 1,
-0.0191435, 2.75243, 0.5059066, 1, 0, 0, 1, 1,
-0.01599316, -1.266249, -4.734581, 1, 0, 0, 1, 1,
-0.01264783, 0.05874626, 0.608444, 1, 0, 0, 1, 1,
-0.01249916, 1.765655, 1.245077, 0, 0, 0, 1, 1,
-0.01012292, 0.05564284, 0.2638367, 0, 0, 0, 1, 1,
-0.005790562, -0.8253295, -4.578744, 0, 0, 0, 1, 1,
-0.005106322, -0.2000321, -2.420581, 0, 0, 0, 1, 1,
-0.002131959, 0.987013, 0.8721715, 0, 0, 0, 1, 1,
-0.0002895345, -0.8746804, -2.065897, 0, 0, 0, 1, 1,
-9.384408e-05, 0.2456233, -0.08499474, 0, 0, 0, 1, 1,
0.002290602, 0.9133082, -0.4420501, 1, 1, 1, 1, 1,
0.004309164, -0.08468757, 2.812806, 1, 1, 1, 1, 1,
0.008543357, -1.930427, 4.780611, 1, 1, 1, 1, 1,
0.01145422, -0.8676673, 3.115543, 1, 1, 1, 1, 1,
0.01423434, -2.519701, 2.235349, 1, 1, 1, 1, 1,
0.01628419, 1.739548, 0.1368178, 1, 1, 1, 1, 1,
0.01666901, -1.347208, 1.934182, 1, 1, 1, 1, 1,
0.01997666, -0.4666541, 3.061913, 1, 1, 1, 1, 1,
0.0214618, -0.9896106, 2.57674, 1, 1, 1, 1, 1,
0.02179806, 0.03986487, -0.8782882, 1, 1, 1, 1, 1,
0.02903378, -0.979399, 2.329714, 1, 1, 1, 1, 1,
0.03343085, -0.266706, 2.379528, 1, 1, 1, 1, 1,
0.03361485, -0.02127129, 2.19307, 1, 1, 1, 1, 1,
0.0389885, 1.773383, -0.7829267, 1, 1, 1, 1, 1,
0.04064404, -0.3373826, 3.705036, 1, 1, 1, 1, 1,
0.04203001, -2.765692, 2.869912, 0, 0, 1, 1, 1,
0.04499428, 1.934884, -1.201373, 1, 0, 0, 1, 1,
0.04523898, -1.398443, 2.888438, 1, 0, 0, 1, 1,
0.045908, -0.07780112, 4.029142, 1, 0, 0, 1, 1,
0.04721091, 0.7759414, 0.628641, 1, 0, 0, 1, 1,
0.05334699, -0.3054317, 2.401784, 1, 0, 0, 1, 1,
0.05794431, 1.218031, 1.9421, 0, 0, 0, 1, 1,
0.05828262, -1.51357, 4.196034, 0, 0, 0, 1, 1,
0.05835219, 1.438136, -0.5125967, 0, 0, 0, 1, 1,
0.06986766, -0.7367715, 2.082425, 0, 0, 0, 1, 1,
0.07161734, -1.269001, 1.592568, 0, 0, 0, 1, 1,
0.08461311, -0.5535744, 2.705302, 0, 0, 0, 1, 1,
0.08722398, 0.4360401, -1.562022, 0, 0, 0, 1, 1,
0.0873109, 1.216983, -0.5104429, 1, 1, 1, 1, 1,
0.09037718, 0.7825782, -1.522464, 1, 1, 1, 1, 1,
0.09190897, -2.116393, 3.236583, 1, 1, 1, 1, 1,
0.0921247, 0.3303484, -2.04527, 1, 1, 1, 1, 1,
0.0960377, 0.9582629, -2.039843, 1, 1, 1, 1, 1,
0.09973501, 1.264, 1.432274, 1, 1, 1, 1, 1,
0.1000713, 1.535969, 2.887407, 1, 1, 1, 1, 1,
0.1036721, 1.34293, -0.4285169, 1, 1, 1, 1, 1,
0.1046749, -0.1131904, 1.627622, 1, 1, 1, 1, 1,
0.1079275, -2.204589, 2.772151, 1, 1, 1, 1, 1,
0.112431, 0.5736973, 0.3966186, 1, 1, 1, 1, 1,
0.1194056, -1.251536, 4.350734, 1, 1, 1, 1, 1,
0.1198568, 0.2331494, 0.6896553, 1, 1, 1, 1, 1,
0.1231227, -1.897536, 3.810455, 1, 1, 1, 1, 1,
0.1241625, -1.354296, 1.05544, 1, 1, 1, 1, 1,
0.1243317, 0.1670801, 0.1025579, 0, 0, 1, 1, 1,
0.1252453, -0.7712882, 4.78585, 1, 0, 0, 1, 1,
0.1275315, 1.254434, 1.431247, 1, 0, 0, 1, 1,
0.1281979, -2.016315, 3.294232, 1, 0, 0, 1, 1,
0.1293042, 1.447947, -1.144494, 1, 0, 0, 1, 1,
0.1337995, 0.3784412, 0.9755324, 1, 0, 0, 1, 1,
0.1357433, 0.9219002, 0.2009144, 0, 0, 0, 1, 1,
0.142491, 0.05732547, 0.4261759, 0, 0, 0, 1, 1,
0.1545774, 0.01381316, 2.391907, 0, 0, 0, 1, 1,
0.1551947, -1.198896, 1.93222, 0, 0, 0, 1, 1,
0.1562021, 0.7348555, 0.2247852, 0, 0, 0, 1, 1,
0.1576947, -0.7666036, 3.690817, 0, 0, 0, 1, 1,
0.1597501, -0.1795472, 2.248393, 0, 0, 0, 1, 1,
0.160475, 0.8766735, 1.089209, 1, 1, 1, 1, 1,
0.1609899, -0.7266319, 2.02394, 1, 1, 1, 1, 1,
0.1625085, -0.766337, 3.104424, 1, 1, 1, 1, 1,
0.1632553, 0.105023, -0.6621029, 1, 1, 1, 1, 1,
0.1709671, 0.7315594, 1.118267, 1, 1, 1, 1, 1,
0.1722653, 1.613196, 0.7204256, 1, 1, 1, 1, 1,
0.174784, -1.008188, 3.688648, 1, 1, 1, 1, 1,
0.1759914, -1.337467, 3.485887, 1, 1, 1, 1, 1,
0.1761362, -0.7577295, 2.726369, 1, 1, 1, 1, 1,
0.1763811, -0.6535307, 3.146443, 1, 1, 1, 1, 1,
0.1800762, 0.5803614, 2.244496, 1, 1, 1, 1, 1,
0.1850884, 0.02805865, 1.339877, 1, 1, 1, 1, 1,
0.1886267, -0.7120574, 4.274303, 1, 1, 1, 1, 1,
0.1910099, 1.602854, 0.9963571, 1, 1, 1, 1, 1,
0.1930206, -1.238153, 3.52271, 1, 1, 1, 1, 1,
0.1939009, -1.182084, 1.691613, 0, 0, 1, 1, 1,
0.199549, -1.691895, 4.033586, 1, 0, 0, 1, 1,
0.2021974, -0.6562045, 2.542764, 1, 0, 0, 1, 1,
0.2030699, -0.5022092, 3.028309, 1, 0, 0, 1, 1,
0.210294, 0.739452, 0.4809331, 1, 0, 0, 1, 1,
0.2112378, -1.479524, 3.476526, 1, 0, 0, 1, 1,
0.2114335, -1.260781, 4.153619, 0, 0, 0, 1, 1,
0.2137562, -1.556632, 2.536922, 0, 0, 0, 1, 1,
0.2139685, 0.5358009, -0.2510315, 0, 0, 0, 1, 1,
0.2172658, -0.714149, 3.808896, 0, 0, 0, 1, 1,
0.2214417, -1.186424, 3.440214, 0, 0, 0, 1, 1,
0.2225786, 0.9832381, -1.548396, 0, 0, 0, 1, 1,
0.2286583, 0.4196037, 0.1573282, 0, 0, 0, 1, 1,
0.2429367, -0.928537, 0.07045799, 1, 1, 1, 1, 1,
0.2485551, -0.9178752, 4.197938, 1, 1, 1, 1, 1,
0.2493027, 0.6612431, 1.118531, 1, 1, 1, 1, 1,
0.2571762, 0.4652394, 0.2234962, 1, 1, 1, 1, 1,
0.2611954, -1.32388, 4.060288, 1, 1, 1, 1, 1,
0.2660231, -0.2271167, 3.679011, 1, 1, 1, 1, 1,
0.2682731, -0.05488971, 1.711712, 1, 1, 1, 1, 1,
0.2685147, 0.4953859, 1.43179, 1, 1, 1, 1, 1,
0.2694055, -0.2671002, 2.194201, 1, 1, 1, 1, 1,
0.2695959, 0.7112086, 0.1648296, 1, 1, 1, 1, 1,
0.2702468, 1.902091, 1.300535, 1, 1, 1, 1, 1,
0.2715108, 1.232689, 0.9645738, 1, 1, 1, 1, 1,
0.2736152, -0.2453521, 2.026558, 1, 1, 1, 1, 1,
0.2738994, 0.6661342, -0.3389542, 1, 1, 1, 1, 1,
0.2748193, -0.2111139, 0.05687018, 1, 1, 1, 1, 1,
0.2764388, -0.3229879, 4.030134, 0, 0, 1, 1, 1,
0.2765806, -0.03825951, 1.656948, 1, 0, 0, 1, 1,
0.2771851, -0.8301904, 2.987491, 1, 0, 0, 1, 1,
0.2776881, 0.3941531, 0.1883888, 1, 0, 0, 1, 1,
0.2791331, -0.474752, 1.542403, 1, 0, 0, 1, 1,
0.2831261, 0.6857743, -1.364717, 1, 0, 0, 1, 1,
0.2836775, -0.1111176, 2.417639, 0, 0, 0, 1, 1,
0.2889363, -0.07802706, 2.764525, 0, 0, 0, 1, 1,
0.2894689, 0.7844695, 0.191058, 0, 0, 0, 1, 1,
0.289926, -0.09321171, -0.26369, 0, 0, 0, 1, 1,
0.290052, -0.08162042, 1.257245, 0, 0, 0, 1, 1,
0.2917197, -0.4649307, 2.689959, 0, 0, 0, 1, 1,
0.2918813, -0.3086832, 2.789646, 0, 0, 0, 1, 1,
0.2941378, -1.200676, 3.085933, 1, 1, 1, 1, 1,
0.2980648, -0.7326546, 3.804412, 1, 1, 1, 1, 1,
0.2992447, -1.171101, 3.773332, 1, 1, 1, 1, 1,
0.3012147, 0.4758639, 0.1673545, 1, 1, 1, 1, 1,
0.3106681, 0.5116723, 1.769027, 1, 1, 1, 1, 1,
0.3106749, -1.28916, 3.595135, 1, 1, 1, 1, 1,
0.3112505, -0.3132938, 2.7728, 1, 1, 1, 1, 1,
0.3149349, 0.6720388, 0.7554643, 1, 1, 1, 1, 1,
0.3174285, 0.5580242, -0.5560617, 1, 1, 1, 1, 1,
0.3219725, 1.235519, 0.09483679, 1, 1, 1, 1, 1,
0.3272766, 2.029231, 1.834216, 1, 1, 1, 1, 1,
0.3399163, -0.2767007, 2.932586, 1, 1, 1, 1, 1,
0.3403229, 0.989543, 1.347549, 1, 1, 1, 1, 1,
0.3440743, -0.7057819, 3.116495, 1, 1, 1, 1, 1,
0.3443201, -1.466528, 2.121788, 1, 1, 1, 1, 1,
0.3454655, 0.2155926, 1.167427, 0, 0, 1, 1, 1,
0.3468399, -0.414667, 4.508452, 1, 0, 0, 1, 1,
0.3504572, 1.357623, 0.1250726, 1, 0, 0, 1, 1,
0.3518801, 0.327435, 0.8045139, 1, 0, 0, 1, 1,
0.3553716, 0.138741, 2.343813, 1, 0, 0, 1, 1,
0.3561572, 0.6355809, 0.6852532, 1, 0, 0, 1, 1,
0.3578039, 2.386089, 0.8519046, 0, 0, 0, 1, 1,
0.359359, 0.09902968, 0.3973698, 0, 0, 0, 1, 1,
0.3655563, 0.7879063, 1.319864, 0, 0, 0, 1, 1,
0.3731211, -1.618211, 3.974452, 0, 0, 0, 1, 1,
0.3745352, 0.8264193, 0.201663, 0, 0, 0, 1, 1,
0.3775187, -1.082109, 4.148682, 0, 0, 0, 1, 1,
0.3798804, -0.6272526, 2.51976, 0, 0, 0, 1, 1,
0.3859902, -1.113496, 4.045565, 1, 1, 1, 1, 1,
0.3887119, 0.7379289, -0.5598004, 1, 1, 1, 1, 1,
0.3894927, -2.0934, 1.669713, 1, 1, 1, 1, 1,
0.4039626, -0.2317691, 2.164765, 1, 1, 1, 1, 1,
0.4120903, 0.2410394, 0.2986776, 1, 1, 1, 1, 1,
0.4198318, -1.560847, 3.285568, 1, 1, 1, 1, 1,
0.4220644, -1.305086, 3.634316, 1, 1, 1, 1, 1,
0.4231797, 1.026027, -0.4094667, 1, 1, 1, 1, 1,
0.4247478, 0.07013602, 3.175113, 1, 1, 1, 1, 1,
0.4251217, 0.480071, -0.6167075, 1, 1, 1, 1, 1,
0.4283875, -0.5226765, 2.477822, 1, 1, 1, 1, 1,
0.4310708, 0.6296293, -0.4136429, 1, 1, 1, 1, 1,
0.4311274, 0.1689234, 2.419546, 1, 1, 1, 1, 1,
0.4327239, -1.708292, 4.264266, 1, 1, 1, 1, 1,
0.433904, 0.6445946, -0.2157177, 1, 1, 1, 1, 1,
0.4374186, -0.03737859, 2.152082, 0, 0, 1, 1, 1,
0.4385801, -0.1666805, 0.9242237, 1, 0, 0, 1, 1,
0.4453752, -0.08417229, 1.314459, 1, 0, 0, 1, 1,
0.4490409, 0.1897248, 1.273287, 1, 0, 0, 1, 1,
0.4517364, 2.041911, 1.380385, 1, 0, 0, 1, 1,
0.4522842, -1.739506, 2.912681, 1, 0, 0, 1, 1,
0.4547504, -1.490583, 2.186677, 0, 0, 0, 1, 1,
0.4570854, 0.3845645, 1.420725, 0, 0, 0, 1, 1,
0.4570913, 1.530962, 2.178055, 0, 0, 0, 1, 1,
0.4626254, -0.3094232, 2.590321, 0, 0, 0, 1, 1,
0.463189, -0.8758189, 3.18074, 0, 0, 0, 1, 1,
0.4662894, -0.9694453, 1.873851, 0, 0, 0, 1, 1,
0.4667481, -0.7253338, 3.632255, 0, 0, 0, 1, 1,
0.4733631, -1.747796, 2.137075, 1, 1, 1, 1, 1,
0.4748066, -0.3850565, 3.145172, 1, 1, 1, 1, 1,
0.4769305, -0.08493821, 2.447944, 1, 1, 1, 1, 1,
0.4790319, -0.2879086, 1.236633, 1, 1, 1, 1, 1,
0.4792979, -2.977685, 3.341791, 1, 1, 1, 1, 1,
0.4801068, -0.6750034, 2.726519, 1, 1, 1, 1, 1,
0.4815142, -0.9605443, 2.993213, 1, 1, 1, 1, 1,
0.4817652, -1.026664, 2.033763, 1, 1, 1, 1, 1,
0.4834712, -0.7636288, 3.545848, 1, 1, 1, 1, 1,
0.4850982, -0.7047058, 0.7480389, 1, 1, 1, 1, 1,
0.4855673, -0.963396, 2.237543, 1, 1, 1, 1, 1,
0.4870391, -1.056582, 2.223653, 1, 1, 1, 1, 1,
0.492774, 1.577474, 0.6447188, 1, 1, 1, 1, 1,
0.4935718, 0.50324, 1.146801, 1, 1, 1, 1, 1,
0.4942368, -0.03622114, 3.36833, 1, 1, 1, 1, 1,
0.4973424, 0.8513455, -0.02938633, 0, 0, 1, 1, 1,
0.5005163, 0.3369305, -0.1271248, 1, 0, 0, 1, 1,
0.5031363, 0.3484322, 1.373132, 1, 0, 0, 1, 1,
0.5040514, -0.04247973, 1.718095, 1, 0, 0, 1, 1,
0.5051506, -0.6851858, 1.76249, 1, 0, 0, 1, 1,
0.5144538, 0.8851395, -0.8578551, 1, 0, 0, 1, 1,
0.5147836, -2.12932, 3.122036, 0, 0, 0, 1, 1,
0.5176793, 1.361544, 0.9475614, 0, 0, 0, 1, 1,
0.5186791, -0.9500288, 1.069165, 0, 0, 0, 1, 1,
0.5236018, -1.397778, 3.479248, 0, 0, 0, 1, 1,
0.527131, -3.342885, 2.340026, 0, 0, 0, 1, 1,
0.5313919, 0.05529395, 2.065177, 0, 0, 0, 1, 1,
0.5389233, -0.0579704, 2.19941, 0, 0, 0, 1, 1,
0.5438896, -1.848142, 2.874284, 1, 1, 1, 1, 1,
0.5467461, 1.149195, 0.9970635, 1, 1, 1, 1, 1,
0.5472575, -0.7261894, 2.119897, 1, 1, 1, 1, 1,
0.5495075, -0.683525, 3.965014, 1, 1, 1, 1, 1,
0.5517901, -0.04353575, 1.716234, 1, 1, 1, 1, 1,
0.5550716, -0.1824046, 1.76239, 1, 1, 1, 1, 1,
0.5560306, 0.5831242, -0.493873, 1, 1, 1, 1, 1,
0.5563567, -0.233402, 1.904984, 1, 1, 1, 1, 1,
0.5585568, 0.2068089, 0.3299531, 1, 1, 1, 1, 1,
0.5644424, -1.327163, 2.204852, 1, 1, 1, 1, 1,
0.5648796, 0.4196513, -0.05965597, 1, 1, 1, 1, 1,
0.5693418, 0.4863583, 1.549713, 1, 1, 1, 1, 1,
0.5708066, -0.4693717, 2.572439, 1, 1, 1, 1, 1,
0.5712106, -1.792287, 2.765245, 1, 1, 1, 1, 1,
0.5716895, 2.824277, 0.1795344, 1, 1, 1, 1, 1,
0.5754955, -1.118773, 3.118609, 0, 0, 1, 1, 1,
0.575873, 1.170379, 1.439247, 1, 0, 0, 1, 1,
0.5789489, -0.6915429, 1.243135, 1, 0, 0, 1, 1,
0.5832902, -1.176923, 1.644749, 1, 0, 0, 1, 1,
0.5848336, 0.07191626, 1.78678, 1, 0, 0, 1, 1,
0.5943949, 0.1578102, -0.3897649, 1, 0, 0, 1, 1,
0.5968248, 0.5000059, 0.5552664, 0, 0, 0, 1, 1,
0.5994953, -0.1148551, 1.260782, 0, 0, 0, 1, 1,
0.6063355, 0.4175233, 1.964988, 0, 0, 0, 1, 1,
0.6063696, 0.2479653, 0.6851307, 0, 0, 0, 1, 1,
0.6087601, -1.857473, 3.67202, 0, 0, 0, 1, 1,
0.6096633, -0.8090927, 3.727902, 0, 0, 0, 1, 1,
0.6097957, 1.221353, 0.7295712, 0, 0, 0, 1, 1,
0.6111227, 0.2231975, 1.773121, 1, 1, 1, 1, 1,
0.6125799, 0.2995049, 0.7708524, 1, 1, 1, 1, 1,
0.6176716, 0.1509613, 0.9025535, 1, 1, 1, 1, 1,
0.6185, 0.8046235, 0.8697682, 1, 1, 1, 1, 1,
0.6229633, -0.2207656, 2.299792, 1, 1, 1, 1, 1,
0.6238923, -0.8491697, 1.31609, 1, 1, 1, 1, 1,
0.624128, 0.1467445, 2.588983, 1, 1, 1, 1, 1,
0.6264384, -0.2407521, 2.465568, 1, 1, 1, 1, 1,
0.6294402, 0.5266598, 1.699556, 1, 1, 1, 1, 1,
0.6346508, -0.6647034, 1.927475, 1, 1, 1, 1, 1,
0.6393492, 0.393719, 1.202814, 1, 1, 1, 1, 1,
0.644804, -0.2894966, 2.848538, 1, 1, 1, 1, 1,
0.6453165, -0.1988711, 2.857529, 1, 1, 1, 1, 1,
0.6547974, -0.5966376, 1.346866, 1, 1, 1, 1, 1,
0.6631394, 0.07358517, 0.6955429, 1, 1, 1, 1, 1,
0.6675599, 1.238601, 0.2558266, 0, 0, 1, 1, 1,
0.6700498, -0.3511811, 1.201012, 1, 0, 0, 1, 1,
0.6747734, -1.284126, 2.832097, 1, 0, 0, 1, 1,
0.6761381, 0.04820552, 3.353057, 1, 0, 0, 1, 1,
0.6801389, -1.866179, 2.28528, 1, 0, 0, 1, 1,
0.6811738, -1.182602, 2.949724, 1, 0, 0, 1, 1,
0.6858453, 1.64642, 0.2970319, 0, 0, 0, 1, 1,
0.6923794, 0.5126137, 0.8711325, 0, 0, 0, 1, 1,
0.6957681, -1.542842, 3.2465, 0, 0, 0, 1, 1,
0.7004871, 0.4269548, 0.1548608, 0, 0, 0, 1, 1,
0.7027944, -1.289267, 3.72505, 0, 0, 0, 1, 1,
0.70733, -0.2662145, 1.171287, 0, 0, 0, 1, 1,
0.7094763, -0.1474764, 3.625411, 0, 0, 0, 1, 1,
0.7113375, -0.3600661, 3.965499, 1, 1, 1, 1, 1,
0.7153422, 0.3517181, 1.025204, 1, 1, 1, 1, 1,
0.727259, 0.7927089, 0.06558582, 1, 1, 1, 1, 1,
0.7297581, 1.145889, 0.3365489, 1, 1, 1, 1, 1,
0.7307045, -0.4643844, 0.6713059, 1, 1, 1, 1, 1,
0.7321928, 0.4483459, 1.387801, 1, 1, 1, 1, 1,
0.7390063, -0.4329036, 2.688129, 1, 1, 1, 1, 1,
0.7425186, -0.3269876, 1.884795, 1, 1, 1, 1, 1,
0.7458372, 0.1362096, 1.949691, 1, 1, 1, 1, 1,
0.7494588, -2.134273, 3.421191, 1, 1, 1, 1, 1,
0.7496122, -0.7038689, 2.284557, 1, 1, 1, 1, 1,
0.7507272, -0.5004013, 2.273224, 1, 1, 1, 1, 1,
0.7512867, 0.08858959, 0.152743, 1, 1, 1, 1, 1,
0.7523441, -0.5570633, 1.973583, 1, 1, 1, 1, 1,
0.7535006, 0.2577826, 0.9637157, 1, 1, 1, 1, 1,
0.7576554, -0.7432442, 0.9473651, 0, 0, 1, 1, 1,
0.7616322, -0.9803042, 3.080744, 1, 0, 0, 1, 1,
0.7625076, -0.3466334, 1.220778, 1, 0, 0, 1, 1,
0.7630562, 0.1405451, 0.6586446, 1, 0, 0, 1, 1,
0.7677968, -1.333212, 1.594563, 1, 0, 0, 1, 1,
0.7707531, 1.360738, 0.4201212, 1, 0, 0, 1, 1,
0.7722701, 1.664347, 0.352984, 0, 0, 0, 1, 1,
0.7740113, -0.3325691, 1.808771, 0, 0, 0, 1, 1,
0.7744442, 1.726446, 1.347817, 0, 0, 0, 1, 1,
0.7782055, -0.6355339, 3.363253, 0, 0, 0, 1, 1,
0.7794763, 0.003640164, 0.8216301, 0, 0, 0, 1, 1,
0.7829097, -0.7798312, 1.88833, 0, 0, 0, 1, 1,
0.7838496, -0.3326033, 1.672077, 0, 0, 0, 1, 1,
0.7871603, -1.081967, 2.465383, 1, 1, 1, 1, 1,
0.7875771, 0.9254702, 1.081037, 1, 1, 1, 1, 1,
0.7941619, -0.4591276, 0.648429, 1, 1, 1, 1, 1,
0.7944517, 0.3809135, 0.2925116, 1, 1, 1, 1, 1,
0.8035477, 0.1988052, 2.315041, 1, 1, 1, 1, 1,
0.8072422, 1.051361, 1.943691, 1, 1, 1, 1, 1,
0.8091514, -0.4943762, 1.968034, 1, 1, 1, 1, 1,
0.8101586, 0.6156581, 0.06582463, 1, 1, 1, 1, 1,
0.8115665, -0.2306957, 2.61806, 1, 1, 1, 1, 1,
0.812463, 0.1507007, -1.275672, 1, 1, 1, 1, 1,
0.813138, -1.104968, 3.085477, 1, 1, 1, 1, 1,
0.8142233, -0.3558577, 2.270001, 1, 1, 1, 1, 1,
0.8147202, -0.8402218, 3.177654, 1, 1, 1, 1, 1,
0.8192471, -1.627135, 3.314503, 1, 1, 1, 1, 1,
0.8199018, -1.23598, 1.545809, 1, 1, 1, 1, 1,
0.8204853, 1.496737, 2.36987, 0, 0, 1, 1, 1,
0.8283743, -0.4421253, 0.6100782, 1, 0, 0, 1, 1,
0.8288518, 0.5368086, 0.8040523, 1, 0, 0, 1, 1,
0.8293207, 0.2339891, 1.239197, 1, 0, 0, 1, 1,
0.8334299, 1.773741, 0.3150545, 1, 0, 0, 1, 1,
0.8350365, 1.122494, 1.201777, 1, 0, 0, 1, 1,
0.8351945, 0.08192577, 0.4459307, 0, 0, 0, 1, 1,
0.8362873, 1.08368, 0.03443227, 0, 0, 0, 1, 1,
0.8377158, 0.1738432, 0.2394406, 0, 0, 0, 1, 1,
0.8417905, -1.687823, 1.979903, 0, 0, 0, 1, 1,
0.8522559, 0.2450856, 1.11726, 0, 0, 0, 1, 1,
0.8538968, 0.5762017, 1.408515, 0, 0, 0, 1, 1,
0.8574246, 0.4710683, 1.629485, 0, 0, 0, 1, 1,
0.8591465, 0.3476709, 0.8377967, 1, 1, 1, 1, 1,
0.8607806, -0.004981578, 2.359712, 1, 1, 1, 1, 1,
0.8609749, 0.4688739, 1.488344, 1, 1, 1, 1, 1,
0.8670519, -1.048576, 3.540665, 1, 1, 1, 1, 1,
0.8709482, 2.136962, 1.217488, 1, 1, 1, 1, 1,
0.878113, 0.625209, 0.8999391, 1, 1, 1, 1, 1,
0.8789518, -2.563113, 2.714569, 1, 1, 1, 1, 1,
0.8854066, 1.463297, -0.5711289, 1, 1, 1, 1, 1,
0.8876164, -0.3215596, 0.6199555, 1, 1, 1, 1, 1,
0.8898578, 0.0774284, 0.1045927, 1, 1, 1, 1, 1,
0.8906637, -0.06842125, 1.124823, 1, 1, 1, 1, 1,
0.8923087, -0.4762425, 1.454191, 1, 1, 1, 1, 1,
0.8980934, 0.2184227, 1.867611, 1, 1, 1, 1, 1,
0.8984422, 0.896283, -0.3331114, 1, 1, 1, 1, 1,
0.8985551, 0.7628558, 1.51143, 1, 1, 1, 1, 1,
0.9013145, 0.78741, 0.7762653, 0, 0, 1, 1, 1,
0.9014284, -0.6238948, 2.640781, 1, 0, 0, 1, 1,
0.9067101, -0.9652471, 3.755586, 1, 0, 0, 1, 1,
0.9087216, -0.6835955, 1.491378, 1, 0, 0, 1, 1,
0.9095047, 0.8652097, 1.432733, 1, 0, 0, 1, 1,
0.9143969, -1.155495, 2.650783, 1, 0, 0, 1, 1,
0.9167786, -0.8264179, 0.9259133, 0, 0, 0, 1, 1,
0.9208349, -0.5550019, 2.792222, 0, 0, 0, 1, 1,
0.924278, 1.009162, 0.05651826, 0, 0, 0, 1, 1,
0.9259106, -0.7684901, 3.163033, 0, 0, 0, 1, 1,
0.9260484, -2.017062, 1.986627, 0, 0, 0, 1, 1,
0.9341413, 2.904937, 0.9744041, 0, 0, 0, 1, 1,
0.9349925, -1.038909, 2.130127, 0, 0, 0, 1, 1,
0.9375714, 1.242646, 0.7364454, 1, 1, 1, 1, 1,
0.9386764, 1.381432, -1.978389, 1, 1, 1, 1, 1,
0.9442204, -1.517084, 2.29917, 1, 1, 1, 1, 1,
0.9474674, 0.6916715, 0.0489652, 1, 1, 1, 1, 1,
0.950935, 0.7878212, -0.270138, 1, 1, 1, 1, 1,
0.9587716, -1.476551, 2.587744, 1, 1, 1, 1, 1,
0.9605814, 1.68776, -0.9365404, 1, 1, 1, 1, 1,
0.9670966, 0.920756, 0.5375316, 1, 1, 1, 1, 1,
0.9695178, -1.109421, 2.316168, 1, 1, 1, 1, 1,
0.974214, -0.05586746, 2.335472, 1, 1, 1, 1, 1,
0.9784184, 0.4340934, 1.490856, 1, 1, 1, 1, 1,
0.9922256, -0.21426, 1.768027, 1, 1, 1, 1, 1,
0.9988853, -1.986439, -0.6163867, 1, 1, 1, 1, 1,
1.00566, 0.6094474, 1.512544, 1, 1, 1, 1, 1,
1.00651, -0.05052837, 0.2632709, 1, 1, 1, 1, 1,
1.00861, 0.7357766, -0.6815428, 0, 0, 1, 1, 1,
1.011429, 0.5935118, 1.547136, 1, 0, 0, 1, 1,
1.012954, -0.1922878, 0.7871459, 1, 0, 0, 1, 1,
1.016868, 0.4814736, 0.4991225, 1, 0, 0, 1, 1,
1.017136, -1.085305, 1.950248, 1, 0, 0, 1, 1,
1.027351, -1.075372, 1.55136, 1, 0, 0, 1, 1,
1.035918, -2.229985, 2.223659, 0, 0, 0, 1, 1,
1.043229, -0.7320712, 2.216163, 0, 0, 0, 1, 1,
1.04413, -0.6753298, 1.40473, 0, 0, 0, 1, 1,
1.050705, 0.6504484, 1.623738, 0, 0, 0, 1, 1,
1.052024, 0.3457878, -0.03955016, 0, 0, 0, 1, 1,
1.05969, -0.2697825, 1.708142, 0, 0, 0, 1, 1,
1.06177, 1.571086, -0.3221392, 0, 0, 0, 1, 1,
1.068396, 1.37904, 0.9960485, 1, 1, 1, 1, 1,
1.070312, 2.445339, 0.1371142, 1, 1, 1, 1, 1,
1.079033, -1.593897, 0.6664385, 1, 1, 1, 1, 1,
1.079314, -0.4975739, 0.6164968, 1, 1, 1, 1, 1,
1.088481, 0.4407488, 1.568146, 1, 1, 1, 1, 1,
1.092651, -0.8680233, 1.535755, 1, 1, 1, 1, 1,
1.093266, 1.545232, 0.6894068, 1, 1, 1, 1, 1,
1.094373, -0.5634744, 2.055373, 1, 1, 1, 1, 1,
1.095441, -0.5567805, 1.000993, 1, 1, 1, 1, 1,
1.100729, 1.849737, 1.478823, 1, 1, 1, 1, 1,
1.103019, -0.4425893, 2.881713, 1, 1, 1, 1, 1,
1.114601, -0.1150795, 2.388696, 1, 1, 1, 1, 1,
1.1177, -1.869239, 4.020422, 1, 1, 1, 1, 1,
1.118035, 1.089331, 1.538471, 1, 1, 1, 1, 1,
1.120364, 0.6343747, 0.8689839, 1, 1, 1, 1, 1,
1.121952, 1.545123, 0.3842328, 0, 0, 1, 1, 1,
1.129944, -0.0861544, 2.458624, 1, 0, 0, 1, 1,
1.132118, -0.810814, 2.650707, 1, 0, 0, 1, 1,
1.132195, -0.07698677, 0.3420907, 1, 0, 0, 1, 1,
1.135689, 0.7456125, 2.229929, 1, 0, 0, 1, 1,
1.142698, -1.829772, 2.666708, 1, 0, 0, 1, 1,
1.146009, -0.4327302, 1.038315, 0, 0, 0, 1, 1,
1.146831, 1.804937, -1.102918, 0, 0, 0, 1, 1,
1.15058, -0.3511031, 1.503253, 0, 0, 0, 1, 1,
1.151119, -1.934623, 2.210642, 0, 0, 0, 1, 1,
1.15228, 1.033687, 0.331989, 0, 0, 0, 1, 1,
1.152786, 0.497032, 1.588625, 0, 0, 0, 1, 1,
1.153198, -2.160195, 4.292875, 0, 0, 0, 1, 1,
1.155858, 1.404775, 1.809012, 1, 1, 1, 1, 1,
1.160713, 0.684054, 2.052562, 1, 1, 1, 1, 1,
1.165034, 0.1462859, -1.054151, 1, 1, 1, 1, 1,
1.166582, 0.5677122, 0.906682, 1, 1, 1, 1, 1,
1.172106, 1.210302, 0.5354342, 1, 1, 1, 1, 1,
1.187801, 2.075532, 0.5670525, 1, 1, 1, 1, 1,
1.190188, -0.2899988, -0.09332016, 1, 1, 1, 1, 1,
1.195688, -1.067519, 0.716794, 1, 1, 1, 1, 1,
1.197815, 0.4485488, 2.383907, 1, 1, 1, 1, 1,
1.209519, 0.08754931, 0.1445038, 1, 1, 1, 1, 1,
1.220808, 0.2168871, -0.9451287, 1, 1, 1, 1, 1,
1.221779, -0.8592404, 1.584157, 1, 1, 1, 1, 1,
1.231907, -0.8368254, 2.371266, 1, 1, 1, 1, 1,
1.255604, -0.2360764, 2.36551, 1, 1, 1, 1, 1,
1.257347, -0.4668091, -0.3459249, 1, 1, 1, 1, 1,
1.258913, -0.7036781, 0.8714811, 0, 0, 1, 1, 1,
1.264753, -0.8961205, 2.250932, 1, 0, 0, 1, 1,
1.277968, 0.7270049, 2.390226, 1, 0, 0, 1, 1,
1.278073, -1.513674, 2.970214, 1, 0, 0, 1, 1,
1.291512, 1.092438, 0.5636387, 1, 0, 0, 1, 1,
1.31705, -0.10191, 0.5515658, 1, 0, 0, 1, 1,
1.319125, -1.340806, 1.091178, 0, 0, 0, 1, 1,
1.34484, 0.9684312, 0.6730072, 0, 0, 0, 1, 1,
1.348208, -0.3901439, 0.5177822, 0, 0, 0, 1, 1,
1.351104, -1.529069, 1.734792, 0, 0, 0, 1, 1,
1.357323, 0.3593655, 2.810751, 0, 0, 0, 1, 1,
1.363785, 1.576337, 2.604974, 0, 0, 0, 1, 1,
1.366977, 0.1291129, 2.080988, 0, 0, 0, 1, 1,
1.376309, -0.9377286, 2.62627, 1, 1, 1, 1, 1,
1.376411, 0.3215005, 0.7444048, 1, 1, 1, 1, 1,
1.383749, -0.07847486, 1.204441, 1, 1, 1, 1, 1,
1.389672, -1.363326, 3.155544, 1, 1, 1, 1, 1,
1.395988, -1.065027, 1.487867, 1, 1, 1, 1, 1,
1.411597, 0.648702, 0.4673462, 1, 1, 1, 1, 1,
1.41266, -1.220235, 1.781548, 1, 1, 1, 1, 1,
1.416793, -1.801537, 2.190842, 1, 1, 1, 1, 1,
1.423351, 0.2871839, 1.997954, 1, 1, 1, 1, 1,
1.424549, 1.249678, 1.405563, 1, 1, 1, 1, 1,
1.44134, -1.575896, 2.07395, 1, 1, 1, 1, 1,
1.44962, -0.7168401, 2.588493, 1, 1, 1, 1, 1,
1.452327, -1.681609, 2.585857, 1, 1, 1, 1, 1,
1.490863, 1.394779, 1.088235, 1, 1, 1, 1, 1,
1.494521, 3.27839, 1.801545, 1, 1, 1, 1, 1,
1.49997, -0.5877681, 1.868674, 0, 0, 1, 1, 1,
1.51406, 0.7289872, 1.245582, 1, 0, 0, 1, 1,
1.518694, -0.6628367, 2.888582, 1, 0, 0, 1, 1,
1.519495, -2.03505, 1.784334, 1, 0, 0, 1, 1,
1.520546, 1.537961, 0.2758774, 1, 0, 0, 1, 1,
1.538353, 0.7532217, 3.007154, 1, 0, 0, 1, 1,
1.541869, 0.1936163, 1.009938, 0, 0, 0, 1, 1,
1.546036, -0.02071379, 1.730917, 0, 0, 0, 1, 1,
1.548543, 0.4753507, 1.527183, 0, 0, 0, 1, 1,
1.552868, 0.1759304, 1.91434, 0, 0, 0, 1, 1,
1.558068, 0.7162412, 1.458466, 0, 0, 0, 1, 1,
1.5657, 0.3253732, 2.553841, 0, 0, 0, 1, 1,
1.569171, 2.12016, 0.05306846, 0, 0, 0, 1, 1,
1.573467, -0.7537904, 0.4408144, 1, 1, 1, 1, 1,
1.580079, -0.7767714, 3.356446, 1, 1, 1, 1, 1,
1.582599, 0.06996834, 0.5510051, 1, 1, 1, 1, 1,
1.58622, -0.6539597, 3.615574, 1, 1, 1, 1, 1,
1.594955, -1.673362, 4.735674, 1, 1, 1, 1, 1,
1.596882, -0.2396628, 0.9460363, 1, 1, 1, 1, 1,
1.600491, 0.3491306, -0.5737956, 1, 1, 1, 1, 1,
1.630262, 0.08399873, 2.089136, 1, 1, 1, 1, 1,
1.632196, -0.5256675, 2.399201, 1, 1, 1, 1, 1,
1.638776, -1.157054, 0.8494488, 1, 1, 1, 1, 1,
1.654301, -1.018545, 2.05411, 1, 1, 1, 1, 1,
1.674071, -0.4558088, 2.890582, 1, 1, 1, 1, 1,
1.678743, -0.3652084, 1.003456, 1, 1, 1, 1, 1,
1.682493, -0.8850338, 1.24394, 1, 1, 1, 1, 1,
1.716179, -1.523539, 0.451135, 1, 1, 1, 1, 1,
1.727594, -1.531835, 2.210397, 0, 0, 1, 1, 1,
1.746392, 0.5502106, 2.0358, 1, 0, 0, 1, 1,
1.77031, 0.6734056, -1.181533, 1, 0, 0, 1, 1,
1.779289, -1.667705, 1.46915, 1, 0, 0, 1, 1,
1.797538, -0.8478283, 1.697643, 1, 0, 0, 1, 1,
1.80591, 1.457321, 2.338428, 1, 0, 0, 1, 1,
1.806813, 0.8777897, 0.2109342, 0, 0, 0, 1, 1,
1.812128, 0.2432657, 0.3673035, 0, 0, 0, 1, 1,
1.813076, 0.4262434, 2.128584, 0, 0, 0, 1, 1,
1.814858, 0.03218664, 1.568515, 0, 0, 0, 1, 1,
1.822949, -0.6848717, 1.050758, 0, 0, 0, 1, 1,
1.862084, -1.819907, 0.3971369, 0, 0, 0, 1, 1,
1.872225, 0.4944682, 1.190214, 0, 0, 0, 1, 1,
1.893754, 0.363727, 2.093435, 1, 1, 1, 1, 1,
1.895436, 0.8584154, 0.7236632, 1, 1, 1, 1, 1,
1.899917, -0.07270326, 0.6671956, 1, 1, 1, 1, 1,
1.904984, 1.595721, 0.3946258, 1, 1, 1, 1, 1,
1.915097, 0.5414359, 1.429679, 1, 1, 1, 1, 1,
1.920836, 0.1810361, 0.5337582, 1, 1, 1, 1, 1,
1.933378, -0.4732367, 0.2174356, 1, 1, 1, 1, 1,
1.963083, 0.5817484, 1.745239, 1, 1, 1, 1, 1,
1.965854, -0.005826088, 1.727135, 1, 1, 1, 1, 1,
1.973206, -0.008244025, -0.4063757, 1, 1, 1, 1, 1,
1.981681, -1.584194, 1.35032, 1, 1, 1, 1, 1,
1.997112, -1.707922, 2.874203, 1, 1, 1, 1, 1,
2.00283, 0.03347407, 2.093495, 1, 1, 1, 1, 1,
2.01885, 2.410988, 0.3158722, 1, 1, 1, 1, 1,
2.095758, 1.225989, 1.490269, 1, 1, 1, 1, 1,
2.135573, 0.04715022, 1.739684, 0, 0, 1, 1, 1,
2.142628, 1.229479, 2.840481, 1, 0, 0, 1, 1,
2.182525, 1.015133, 1.394644, 1, 0, 0, 1, 1,
2.210033, 0.9195979, 1.106456, 1, 0, 0, 1, 1,
2.236039, 0.5724267, 1.421229, 1, 0, 0, 1, 1,
2.249126, -0.06260263, 0.2204421, 1, 0, 0, 1, 1,
2.272509, 1.099357, 1.735639, 0, 0, 0, 1, 1,
2.277277, -1.762058, 1.680528, 0, 0, 0, 1, 1,
2.280188, -1.098998, -0.4071498, 0, 0, 0, 1, 1,
2.386492, 1.790143, 2.700701, 0, 0, 0, 1, 1,
2.39836, 0.5952303, 2.09633, 0, 0, 0, 1, 1,
2.71041, 0.2418227, 1.537335, 0, 0, 0, 1, 1,
2.710896, -0.9729429, 1.946924, 0, 0, 0, 1, 1,
2.743827, -2.002272, 2.265344, 1, 1, 1, 1, 1,
2.861456, 0.9018703, 1.426924, 1, 1, 1, 1, 1,
2.912549, -0.4417047, 0.7151486, 1, 1, 1, 1, 1,
2.942628, -0.6757747, 1.973839, 1, 1, 1, 1, 1,
3.027452, -0.283575, 2.535671, 1, 1, 1, 1, 1,
3.043902, 0.8688033, 0.3618086, 1, 1, 1, 1, 1,
3.117655, -0.1315134, 2.650068, 1, 1, 1, 1, 1
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
var radius = 9.444291;
var distance = 33.17268;
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
mvMatrix.translate( 0.1028528, 0.03224754, 0.3231843 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.17268);
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
