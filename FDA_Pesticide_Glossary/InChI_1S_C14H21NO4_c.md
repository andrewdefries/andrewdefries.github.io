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
-3.049899, 1.598237, 0.3317547, 1, 0, 0, 1,
-2.933117, 2.060634, -2.561356, 1, 0.007843138, 0, 1,
-2.867153, 2.957378, -0.07486758, 1, 0.01176471, 0, 1,
-2.813935, -0.05966907, -1.696143, 1, 0.01960784, 0, 1,
-2.668107, -0.264219, -1.950236, 1, 0.02352941, 0, 1,
-2.599761, 1.051574, -1.87297, 1, 0.03137255, 0, 1,
-2.59643, 0.1015099, -1.816829, 1, 0.03529412, 0, 1,
-2.516851, -0.076929, -2.768591, 1, 0.04313726, 0, 1,
-2.426059, -1.344197, -0.5096493, 1, 0.04705882, 0, 1,
-2.367343, 2.225453, -1.703512, 1, 0.05490196, 0, 1,
-2.318747, -0.6146409, -3.050109, 1, 0.05882353, 0, 1,
-2.280638, 0.3841844, -0.4675865, 1, 0.06666667, 0, 1,
-2.262187, 0.0855781, -2.275706, 1, 0.07058824, 0, 1,
-2.177811, -0.7814224, -2.687683, 1, 0.07843138, 0, 1,
-2.137963, 1.062458, -2.052098, 1, 0.08235294, 0, 1,
-2.0873, 0.246055, -1.415942, 1, 0.09019608, 0, 1,
-2.072129, 0.9259685, -2.788423, 1, 0.09411765, 0, 1,
-2.055301, 1.692776, -1.210137, 1, 0.1019608, 0, 1,
-2.04819, 0.8547575, -2.325373, 1, 0.1098039, 0, 1,
-2.043426, 0.2910693, -2.610405, 1, 0.1137255, 0, 1,
-2.006775, 0.1167058, -1.173674, 1, 0.1215686, 0, 1,
-1.992107, -2.194432, -3.244603, 1, 0.1254902, 0, 1,
-1.990885, 1.600742, -0.05077254, 1, 0.1333333, 0, 1,
-1.972607, -0.6885245, -2.251567, 1, 0.1372549, 0, 1,
-1.969483, 0.6787414, -2.045736, 1, 0.145098, 0, 1,
-1.926054, -0.09340957, 0.9731044, 1, 0.1490196, 0, 1,
-1.921953, -0.1760938, -1.868112, 1, 0.1568628, 0, 1,
-1.899191, 0.3375601, -0.2833872, 1, 0.1607843, 0, 1,
-1.890148, 1.43516, -2.473735, 1, 0.1686275, 0, 1,
-1.888967, -0.2009519, -3.119178, 1, 0.172549, 0, 1,
-1.886137, -0.9979291, -1.793657, 1, 0.1803922, 0, 1,
-1.873414, 1.085115, -1.237645, 1, 0.1843137, 0, 1,
-1.866121, -1.39565, -3.847513, 1, 0.1921569, 0, 1,
-1.864269, -1.067491, -1.65456, 1, 0.1960784, 0, 1,
-1.858827, 0.4431031, -1.523253, 1, 0.2039216, 0, 1,
-1.853499, 0.155052, -2.579712, 1, 0.2117647, 0, 1,
-1.851347, 1.38742, -1.680033, 1, 0.2156863, 0, 1,
-1.846788, -2.618642, -1.573526, 1, 0.2235294, 0, 1,
-1.840104, -0.138306, -1.227486, 1, 0.227451, 0, 1,
-1.835548, 0.2793737, -1.626815, 1, 0.2352941, 0, 1,
-1.820386, 1.054024, -1.109627, 1, 0.2392157, 0, 1,
-1.818046, 0.9130938, -2.280534, 1, 0.2470588, 0, 1,
-1.814142, 0.04211421, -1.35461, 1, 0.2509804, 0, 1,
-1.765722, -0.2040771, -1.684253, 1, 0.2588235, 0, 1,
-1.765459, -0.7539927, -2.492089, 1, 0.2627451, 0, 1,
-1.762949, -0.2950275, -3.541022, 1, 0.2705882, 0, 1,
-1.762798, -0.6864951, -2.190794, 1, 0.2745098, 0, 1,
-1.76232, -0.4577187, -1.792403, 1, 0.282353, 0, 1,
-1.755888, -1.555349, -2.789021, 1, 0.2862745, 0, 1,
-1.740975, -0.8826725, -3.652472, 1, 0.2941177, 0, 1,
-1.725323, -1.670763, -1.096162, 1, 0.3019608, 0, 1,
-1.686166, 0.9319834, -0.8945665, 1, 0.3058824, 0, 1,
-1.681115, 0.05260719, -1.411573, 1, 0.3137255, 0, 1,
-1.657928, 0.2433974, -0.529633, 1, 0.3176471, 0, 1,
-1.654325, -0.1583777, -1.91064, 1, 0.3254902, 0, 1,
-1.652387, 1.514957, -0.6541739, 1, 0.3294118, 0, 1,
-1.646734, -0.05318008, -0.8848016, 1, 0.3372549, 0, 1,
-1.644578, -0.4847603, -2.834304, 1, 0.3411765, 0, 1,
-1.635107, 1.098216, 0.1773798, 1, 0.3490196, 0, 1,
-1.628495, -1.071965, -0.7256045, 1, 0.3529412, 0, 1,
-1.622146, -0.5125248, -2.80253, 1, 0.3607843, 0, 1,
-1.6207, 0.8944851, -2.617614, 1, 0.3647059, 0, 1,
-1.603581, 1.270901, -0.4755498, 1, 0.372549, 0, 1,
-1.589453, -1.46723, -3.509915, 1, 0.3764706, 0, 1,
-1.587532, 0.3732764, -2.325726, 1, 0.3843137, 0, 1,
-1.583828, -0.7231796, -4.360422, 1, 0.3882353, 0, 1,
-1.575141, -0.6220554, -2.416366, 1, 0.3960784, 0, 1,
-1.567062, -1.305074, -2.846276, 1, 0.4039216, 0, 1,
-1.561292, 1.127396, -0.8083394, 1, 0.4078431, 0, 1,
-1.557115, -0.4967212, -0.9144545, 1, 0.4156863, 0, 1,
-1.545526, 0.2392698, -3.239062, 1, 0.4196078, 0, 1,
-1.539199, 0.652572, -2.948947, 1, 0.427451, 0, 1,
-1.534279, 1.231039, -0.6728467, 1, 0.4313726, 0, 1,
-1.529703, 0.6254374, 0.9508603, 1, 0.4392157, 0, 1,
-1.520231, -0.4565905, -2.833353, 1, 0.4431373, 0, 1,
-1.518629, -0.7206982, -1.628015, 1, 0.4509804, 0, 1,
-1.495342, 1.352911, -1.310221, 1, 0.454902, 0, 1,
-1.494895, -0.7162482, -0.7825572, 1, 0.4627451, 0, 1,
-1.491844, 0.3138264, -0.482327, 1, 0.4666667, 0, 1,
-1.490552, -0.7860907, -0.382986, 1, 0.4745098, 0, 1,
-1.488185, -0.5183755, -0.6971975, 1, 0.4784314, 0, 1,
-1.483496, 0.2917284, -1.558555, 1, 0.4862745, 0, 1,
-1.479126, 0.6327109, -2.459697, 1, 0.4901961, 0, 1,
-1.45458, 0.9001653, 0.4642704, 1, 0.4980392, 0, 1,
-1.454447, -1.036804, -2.60454, 1, 0.5058824, 0, 1,
-1.447219, -0.8662658, -2.002854, 1, 0.509804, 0, 1,
-1.444817, 0.540015, -0.699459, 1, 0.5176471, 0, 1,
-1.425137, 2.090371, 0.9880951, 1, 0.5215687, 0, 1,
-1.398807, -1.220602, -3.199126, 1, 0.5294118, 0, 1,
-1.393634, -1.658027, -1.96723, 1, 0.5333334, 0, 1,
-1.377234, -0.7010676, -2.32818, 1, 0.5411765, 0, 1,
-1.367899, -1.08269, -1.95592, 1, 0.5450981, 0, 1,
-1.365527, -0.3679883, -1.386358, 1, 0.5529412, 0, 1,
-1.365357, 0.9403875, -1.004657, 1, 0.5568628, 0, 1,
-1.359838, 1.093211, -1.797277, 1, 0.5647059, 0, 1,
-1.351052, 0.8920924, -2.318248, 1, 0.5686275, 0, 1,
-1.349624, -0.1411754, -1.426859, 1, 0.5764706, 0, 1,
-1.342394, 1.830547, -3.27791, 1, 0.5803922, 0, 1,
-1.339663, 0.6270226, -1.915237, 1, 0.5882353, 0, 1,
-1.322119, 1.0792, 0.4751756, 1, 0.5921569, 0, 1,
-1.320136, -0.1977443, -0.3968398, 1, 0.6, 0, 1,
-1.311134, -0.7968927, -2.662753, 1, 0.6078432, 0, 1,
-1.308163, 2.053284, -1.299538, 1, 0.6117647, 0, 1,
-1.296313, 1.706623, -0.8799772, 1, 0.6196079, 0, 1,
-1.29404, -1.770705, -3.5037, 1, 0.6235294, 0, 1,
-1.29286, 0.8849419, -1.330072, 1, 0.6313726, 0, 1,
-1.285318, -0.009284593, -2.142726, 1, 0.6352941, 0, 1,
-1.280512, 0.6441104, -1.832831, 1, 0.6431373, 0, 1,
-1.27465, -0.1392629, -2.543386, 1, 0.6470588, 0, 1,
-1.270668, 0.5404198, -1.678253, 1, 0.654902, 0, 1,
-1.252792, 0.789538, -1.686048, 1, 0.6588235, 0, 1,
-1.252194, 0.4561355, -2.099619, 1, 0.6666667, 0, 1,
-1.248386, 0.610728, -0.6063591, 1, 0.6705883, 0, 1,
-1.247038, -0.02131478, 0.06416767, 1, 0.6784314, 0, 1,
-1.240109, 1.395503, -0.1844637, 1, 0.682353, 0, 1,
-1.232438, 0.1244124, -1.892428, 1, 0.6901961, 0, 1,
-1.227282, -1.533489, -3.282665, 1, 0.6941177, 0, 1,
-1.220429, -0.4788017, -1.156917, 1, 0.7019608, 0, 1,
-1.219545, -0.9268014, -1.593306, 1, 0.7098039, 0, 1,
-1.216998, 1.252117, -1.190789, 1, 0.7137255, 0, 1,
-1.214858, 0.06324992, -2.220284, 1, 0.7215686, 0, 1,
-1.20826, 0.2002872, -1.231008, 1, 0.7254902, 0, 1,
-1.207289, -0.8187255, -1.032634, 1, 0.7333333, 0, 1,
-1.206083, 1.02185, -0.3742, 1, 0.7372549, 0, 1,
-1.205115, -0.5386128, -2.152456, 1, 0.7450981, 0, 1,
-1.197875, 2.382905, 0.3845697, 1, 0.7490196, 0, 1,
-1.195484, 1.087098, -0.5892554, 1, 0.7568628, 0, 1,
-1.195327, 0.2453997, -0.695213, 1, 0.7607843, 0, 1,
-1.194623, 0.5379819, -1.369951, 1, 0.7686275, 0, 1,
-1.19343, -0.9258611, -0.5870619, 1, 0.772549, 0, 1,
-1.191873, 0.4682929, -0.5495046, 1, 0.7803922, 0, 1,
-1.191576, -0.02059208, -1.446481, 1, 0.7843137, 0, 1,
-1.190556, -0.8289722, -4.051449, 1, 0.7921569, 0, 1,
-1.189761, -1.628828, -3.654815, 1, 0.7960784, 0, 1,
-1.18901, 0.5100072, 0.5173416, 1, 0.8039216, 0, 1,
-1.181346, -0.5123684, -1.657923, 1, 0.8117647, 0, 1,
-1.178157, 0.9509073, -1.995833, 1, 0.8156863, 0, 1,
-1.172715, -1.236096, -2.171194, 1, 0.8235294, 0, 1,
-1.158153, -1.141115, -2.82436, 1, 0.827451, 0, 1,
-1.158045, -0.2993613, -1.412848, 1, 0.8352941, 0, 1,
-1.146448, 1.211637, -0.4323593, 1, 0.8392157, 0, 1,
-1.140399, -0.09445355, -2.153711, 1, 0.8470588, 0, 1,
-1.140369, -0.4428357, -1.164413, 1, 0.8509804, 0, 1,
-1.138976, 1.680922, 0.8974558, 1, 0.8588235, 0, 1,
-1.135229, 0.06609262, 1.266452, 1, 0.8627451, 0, 1,
-1.130095, -0.1260738, -2.607729, 1, 0.8705882, 0, 1,
-1.127714, 0.3975261, -0.5818599, 1, 0.8745098, 0, 1,
-1.125777, 0.2381908, -0.4188239, 1, 0.8823529, 0, 1,
-1.115307, 0.05948087, -1.446158, 1, 0.8862745, 0, 1,
-1.100505, -0.9001933, -2.341961, 1, 0.8941177, 0, 1,
-1.091792, -0.01460132, -3.584785, 1, 0.8980392, 0, 1,
-1.087178, 0.3270606, -2.917812, 1, 0.9058824, 0, 1,
-1.079689, -2.536637, -2.730493, 1, 0.9137255, 0, 1,
-1.077337, 1.656777, -0.9907223, 1, 0.9176471, 0, 1,
-1.07699, 0.3215606, -0.9079232, 1, 0.9254902, 0, 1,
-1.075822, -0.3314395, -2.190108, 1, 0.9294118, 0, 1,
-1.068647, 0.5595137, -0.6021158, 1, 0.9372549, 0, 1,
-1.043628, 0.644532, -1.129923, 1, 0.9411765, 0, 1,
-1.04212, 0.1356665, -2.432285, 1, 0.9490196, 0, 1,
-1.039248, 1.186313, 0.8210991, 1, 0.9529412, 0, 1,
-1.035407, 0.110211, -1.726405, 1, 0.9607843, 0, 1,
-1.033892, 0.4569076, -1.240328, 1, 0.9647059, 0, 1,
-1.03202, 0.9837937, -0.8884335, 1, 0.972549, 0, 1,
-1.028461, -0.1106016, -0.7560984, 1, 0.9764706, 0, 1,
-1.026056, 0.2115776, -1.645715, 1, 0.9843137, 0, 1,
-1.02575, 0.2070036, -1.671247, 1, 0.9882353, 0, 1,
-1.021179, 0.6802852, -0.07539473, 1, 0.9960784, 0, 1,
-1.020802, 0.6819941, -2.236699, 0.9960784, 1, 0, 1,
-1.018786, 1.191004, 0.991026, 0.9921569, 1, 0, 1,
-1.014251, 0.1468664, -3.002771, 0.9843137, 1, 0, 1,
-1.012277, -1.008392, -3.553933, 0.9803922, 1, 0, 1,
-1.011535, 0.2636141, -1.047794, 0.972549, 1, 0, 1,
-1.009166, 1.151043, -0.5339355, 0.9686275, 1, 0, 1,
-1.00892, -0.365774, -3.160376, 0.9607843, 1, 0, 1,
-1.00166, -0.2110766, -0.4438051, 0.9568627, 1, 0, 1,
-1.000978, -0.8518813, -2.767432, 0.9490196, 1, 0, 1,
-0.9985934, 1.003147, -0.6442828, 0.945098, 1, 0, 1,
-0.9942731, 1.091052, -1.807151, 0.9372549, 1, 0, 1,
-0.9941061, 0.4414669, 1.354906, 0.9333333, 1, 0, 1,
-0.9868596, 0.4396003, -1.441619, 0.9254902, 1, 0, 1,
-0.9823939, -1.11711, -3.64422, 0.9215686, 1, 0, 1,
-0.9751191, -0.1831735, -1.714305, 0.9137255, 1, 0, 1,
-0.9748708, 1.445558, 1.002679, 0.9098039, 1, 0, 1,
-0.9620222, 0.1945241, -0.002543998, 0.9019608, 1, 0, 1,
-0.9562981, -0.2839529, -2.223805, 0.8941177, 1, 0, 1,
-0.9547363, -0.6298443, -2.395557, 0.8901961, 1, 0, 1,
-0.9513701, -0.3464158, -2.684124, 0.8823529, 1, 0, 1,
-0.9446086, -0.3124609, -1.193659, 0.8784314, 1, 0, 1,
-0.9443596, -1.339772, -2.05432, 0.8705882, 1, 0, 1,
-0.9374198, 0.8401232, -1.050061, 0.8666667, 1, 0, 1,
-0.9147817, 0.9866966, -1.161343, 0.8588235, 1, 0, 1,
-0.9129708, 0.5273371, -0.5334747, 0.854902, 1, 0, 1,
-0.9125653, -0.037301, -0.07180674, 0.8470588, 1, 0, 1,
-0.9077054, 1.117986, -2.294541, 0.8431373, 1, 0, 1,
-0.8992909, 0.95616, 0.3071265, 0.8352941, 1, 0, 1,
-0.8957243, 0.4345319, -1.052407, 0.8313726, 1, 0, 1,
-0.8950644, 0.3062619, -1.454993, 0.8235294, 1, 0, 1,
-0.8946142, -0.4817364, -4.265067, 0.8196079, 1, 0, 1,
-0.8922779, 1.172071, -0.2752256, 0.8117647, 1, 0, 1,
-0.8892723, 0.2619956, -0.7999671, 0.8078431, 1, 0, 1,
-0.8870853, -0.01374527, -2.10216, 0.8, 1, 0, 1,
-0.8867574, -0.04557617, 1.13524, 0.7921569, 1, 0, 1,
-0.8850908, 0.04277402, -1.461046, 0.7882353, 1, 0, 1,
-0.8849144, 0.4519234, 0.1692911, 0.7803922, 1, 0, 1,
-0.8781661, -0.8935132, -1.860687, 0.7764706, 1, 0, 1,
-0.8780669, -0.09804979, -3.032004, 0.7686275, 1, 0, 1,
-0.8752031, 1.606511, 0.8047123, 0.7647059, 1, 0, 1,
-0.8750629, 0.37804, 0.3968625, 0.7568628, 1, 0, 1,
-0.8677224, 1.388639, -0.9124934, 0.7529412, 1, 0, 1,
-0.8634343, 0.05809739, -2.111632, 0.7450981, 1, 0, 1,
-0.8632118, 0.490767, -1.010823, 0.7411765, 1, 0, 1,
-0.862584, -0.5920539, -2.594959, 0.7333333, 1, 0, 1,
-0.8561795, -0.5119589, -1.922617, 0.7294118, 1, 0, 1,
-0.8445463, 0.5626432, -1.118038, 0.7215686, 1, 0, 1,
-0.8436569, -0.1556001, -0.1931537, 0.7176471, 1, 0, 1,
-0.8371406, 0.2302911, -1.472139, 0.7098039, 1, 0, 1,
-0.8359851, -1.002323, -1.844791, 0.7058824, 1, 0, 1,
-0.8310837, 0.2621637, -1.893594, 0.6980392, 1, 0, 1,
-0.8169076, 0.4453573, -1.149914, 0.6901961, 1, 0, 1,
-0.8146526, 0.125697, -2.524027, 0.6862745, 1, 0, 1,
-0.8063269, 0.8076895, 0.05978126, 0.6784314, 1, 0, 1,
-0.8033182, 1.560884, -1.258974, 0.6745098, 1, 0, 1,
-0.8014182, -0.3786439, -1.360828, 0.6666667, 1, 0, 1,
-0.7996073, -0.7656398, -2.463937, 0.6627451, 1, 0, 1,
-0.7978219, 0.2485132, -0.3361279, 0.654902, 1, 0, 1,
-0.7969061, -1.76969, -3.967952, 0.6509804, 1, 0, 1,
-0.7889149, -0.5965744, -2.800325, 0.6431373, 1, 0, 1,
-0.7877374, 0.0796506, -1.265061, 0.6392157, 1, 0, 1,
-0.779086, -0.9589843, -3.765881, 0.6313726, 1, 0, 1,
-0.7770876, 1.031065, -0.1760248, 0.627451, 1, 0, 1,
-0.7741952, 0.4571785, -1.028433, 0.6196079, 1, 0, 1,
-0.7734974, 0.1231749, -2.935336, 0.6156863, 1, 0, 1,
-0.7516245, 0.3651887, -0.3369474, 0.6078432, 1, 0, 1,
-0.7503808, 0.5363865, -0.1385964, 0.6039216, 1, 0, 1,
-0.7493873, -1.983949, -2.183808, 0.5960785, 1, 0, 1,
-0.7447253, 0.4907781, -1.942234, 0.5882353, 1, 0, 1,
-0.7429073, 0.379271, -2.788651, 0.5843138, 1, 0, 1,
-0.7424196, 0.5038077, -0.9833764, 0.5764706, 1, 0, 1,
-0.7416044, 0.9317758, -1.114622, 0.572549, 1, 0, 1,
-0.7407381, -0.1727439, -1.205651, 0.5647059, 1, 0, 1,
-0.7398046, -0.9910094, -1.680701, 0.5607843, 1, 0, 1,
-0.7396978, -2.112107, -3.833397, 0.5529412, 1, 0, 1,
-0.7381393, 0.4992096, -0.335979, 0.5490196, 1, 0, 1,
-0.7319407, -0.9868283, -0.9935828, 0.5411765, 1, 0, 1,
-0.7316121, -1.047915, -3.036736, 0.5372549, 1, 0, 1,
-0.729554, -0.884312, -2.804276, 0.5294118, 1, 0, 1,
-0.7206342, -1.005648, -2.365047, 0.5254902, 1, 0, 1,
-0.7203215, -0.01221943, -1.92178, 0.5176471, 1, 0, 1,
-0.7051505, -1.860673, -3.832002, 0.5137255, 1, 0, 1,
-0.7032606, 1.399428, 0.5473291, 0.5058824, 1, 0, 1,
-0.6994952, 0.09638813, -3.277985, 0.5019608, 1, 0, 1,
-0.6905711, -1.580084, -1.69118, 0.4941176, 1, 0, 1,
-0.6904994, -0.5940046, -1.571599, 0.4862745, 1, 0, 1,
-0.6899839, -1.21077, -1.614068, 0.4823529, 1, 0, 1,
-0.689136, 1.459193, -0.4694016, 0.4745098, 1, 0, 1,
-0.6854681, 1.137175, -0.1348163, 0.4705882, 1, 0, 1,
-0.6798908, -0.3999584, -1.081157, 0.4627451, 1, 0, 1,
-0.6760812, -1.154661, -2.091626, 0.4588235, 1, 0, 1,
-0.6755377, 0.3932717, -1.699782, 0.4509804, 1, 0, 1,
-0.6631512, -0.9322498, -2.53686, 0.4470588, 1, 0, 1,
-0.6627874, -0.5838987, -1.225371, 0.4392157, 1, 0, 1,
-0.6627473, -0.8334784, -2.409868, 0.4352941, 1, 0, 1,
-0.659865, -0.5090142, -1.677083, 0.427451, 1, 0, 1,
-0.6563963, 0.9651932, -1.949298, 0.4235294, 1, 0, 1,
-0.6533515, 1.017653, -1.981868, 0.4156863, 1, 0, 1,
-0.652442, -0.8774505, -2.595064, 0.4117647, 1, 0, 1,
-0.6523947, -0.183944, 0.3141874, 0.4039216, 1, 0, 1,
-0.6522214, -1.016007, -1.997305, 0.3960784, 1, 0, 1,
-0.6502788, -0.1219649, -4.20126, 0.3921569, 1, 0, 1,
-0.6435069, 1.015705, -0.04853496, 0.3843137, 1, 0, 1,
-0.6411559, 0.3598617, -0.2901569, 0.3803922, 1, 0, 1,
-0.6386129, 1.609442, -0.4014025, 0.372549, 1, 0, 1,
-0.629158, 1.31867, 0.3765557, 0.3686275, 1, 0, 1,
-0.6277592, 2.206942, 0.7332098, 0.3607843, 1, 0, 1,
-0.626234, 0.5053976, -0.4857955, 0.3568628, 1, 0, 1,
-0.6253047, 0.6204957, 0.2210716, 0.3490196, 1, 0, 1,
-0.6227149, -0.2513359, -2.859995, 0.345098, 1, 0, 1,
-0.6104855, 1.690423, -0.6384775, 0.3372549, 1, 0, 1,
-0.6091991, -0.4423729, -1.624774, 0.3333333, 1, 0, 1,
-0.6011896, -0.2187506, -3.56218, 0.3254902, 1, 0, 1,
-0.5999627, -0.2145761, -1.729973, 0.3215686, 1, 0, 1,
-0.5972977, 1.091864, -0.455226, 0.3137255, 1, 0, 1,
-0.5926664, 1.739911, -0.1937585, 0.3098039, 1, 0, 1,
-0.5904216, -0.2413039, -2.331328, 0.3019608, 1, 0, 1,
-0.5881414, -0.9110311, -2.453487, 0.2941177, 1, 0, 1,
-0.5815998, -0.1541555, -2.545406, 0.2901961, 1, 0, 1,
-0.5774248, 0.7102455, -0.07471509, 0.282353, 1, 0, 1,
-0.5725969, -1.241386, -3.207429, 0.2784314, 1, 0, 1,
-0.5668745, -1.284203, -2.095488, 0.2705882, 1, 0, 1,
-0.5637266, 0.2828139, -1.048804, 0.2666667, 1, 0, 1,
-0.5603217, -1.702943, -3.011488, 0.2588235, 1, 0, 1,
-0.560094, 0.2540964, -2.644515, 0.254902, 1, 0, 1,
-0.5600129, -1.022244, -2.569404, 0.2470588, 1, 0, 1,
-0.557147, 0.705836, -1.575599, 0.2431373, 1, 0, 1,
-0.5531154, 3.147253, 0.5931827, 0.2352941, 1, 0, 1,
-0.5441779, 0.08461408, -2.348713, 0.2313726, 1, 0, 1,
-0.543167, 0.3809827, -0.8958053, 0.2235294, 1, 0, 1,
-0.5367499, 0.07211947, -1.070176, 0.2196078, 1, 0, 1,
-0.5352985, -1.165341, -2.161387, 0.2117647, 1, 0, 1,
-0.5346442, 1.875636, 0.3721981, 0.2078431, 1, 0, 1,
-0.5325724, -0.6020905, -3.05444, 0.2, 1, 0, 1,
-0.5316857, 0.3392687, 0.567726, 0.1921569, 1, 0, 1,
-0.5293815, -0.7971027, -4.925991, 0.1882353, 1, 0, 1,
-0.5280501, 0.396837, -0.933414, 0.1803922, 1, 0, 1,
-0.5256761, -0.3633562, -2.841089, 0.1764706, 1, 0, 1,
-0.5255694, 0.6232847, -0.1055329, 0.1686275, 1, 0, 1,
-0.5252547, -2.059014, -4.39581, 0.1647059, 1, 0, 1,
-0.5252146, -0.1480935, -1.159271, 0.1568628, 1, 0, 1,
-0.5242094, 0.1796607, -1.76368, 0.1529412, 1, 0, 1,
-0.524152, -0.2353354, -3.375747, 0.145098, 1, 0, 1,
-0.5220707, 0.3591923, -0.6962671, 0.1411765, 1, 0, 1,
-0.5208452, 1.427681, -1.860868, 0.1333333, 1, 0, 1,
-0.5201211, 1.017283, -1.934766, 0.1294118, 1, 0, 1,
-0.5198586, 0.09968375, -1.695087, 0.1215686, 1, 0, 1,
-0.5162479, 2.128239, -1.649931, 0.1176471, 1, 0, 1,
-0.5092794, 0.4205117, -2.426116, 0.1098039, 1, 0, 1,
-0.5054856, 0.1026448, -3.076399, 0.1058824, 1, 0, 1,
-0.5007178, 0.6072838, -0.06474598, 0.09803922, 1, 0, 1,
-0.4978071, 0.2768417, -1.196032, 0.09019608, 1, 0, 1,
-0.4955846, 1.891824, 1.018376, 0.08627451, 1, 0, 1,
-0.4939405, 0.272823, -1.02224, 0.07843138, 1, 0, 1,
-0.4879766, 0.2533216, -1.882961, 0.07450981, 1, 0, 1,
-0.4840843, -0.7653716, -4.293743, 0.06666667, 1, 0, 1,
-0.4812081, 0.2522399, -0.9480956, 0.0627451, 1, 0, 1,
-0.4789484, 0.9745126, -0.5433168, 0.05490196, 1, 0, 1,
-0.4777908, 1.38355, -1.722747, 0.05098039, 1, 0, 1,
-0.4694835, -1.3149, -2.941109, 0.04313726, 1, 0, 1,
-0.46764, 0.08546446, -2.695879, 0.03921569, 1, 0, 1,
-0.4673752, -0.2914348, -1.45588, 0.03137255, 1, 0, 1,
-0.4672025, -1.027412, -1.856557, 0.02745098, 1, 0, 1,
-0.4659511, -0.1245171, -2.777205, 0.01960784, 1, 0, 1,
-0.4625872, -0.1349765, -2.018095, 0.01568628, 1, 0, 1,
-0.4556154, -1.692699, -0.6228657, 0.007843138, 1, 0, 1,
-0.4534982, -0.3176468, -2.562173, 0.003921569, 1, 0, 1,
-0.4530255, 1.975969, 0.2786331, 0, 1, 0.003921569, 1,
-0.4522081, 0.8910995, -0.9182112, 0, 1, 0.01176471, 1,
-0.4519817, 2.612447, -0.3802526, 0, 1, 0.01568628, 1,
-0.4492765, 0.02613504, -2.756744, 0, 1, 0.02352941, 1,
-0.4474555, 1.044153, -0.2394637, 0, 1, 0.02745098, 1,
-0.4463929, 0.9242801, -1.505231, 0, 1, 0.03529412, 1,
-0.4425457, -0.5570716, -2.461583, 0, 1, 0.03921569, 1,
-0.4358949, -0.1456893, -1.660819, 0, 1, 0.04705882, 1,
-0.4350313, -1.262463, -3.633699, 0, 1, 0.05098039, 1,
-0.4342564, 2.43195, -0.7937977, 0, 1, 0.05882353, 1,
-0.4335206, 0.0346221, -2.919752, 0, 1, 0.0627451, 1,
-0.4291259, 0.5765141, -0.8516864, 0, 1, 0.07058824, 1,
-0.4274783, 0.7238817, -1.061532, 0, 1, 0.07450981, 1,
-0.4240991, 1.338918, 1.079825, 0, 1, 0.08235294, 1,
-0.4210486, -1.442098, -1.625857, 0, 1, 0.08627451, 1,
-0.4206168, 0.2213971, -1.669731, 0, 1, 0.09411765, 1,
-0.4166937, -0.9172723, -1.514266, 0, 1, 0.1019608, 1,
-0.4146454, 1.253918, 0.3235088, 0, 1, 0.1058824, 1,
-0.4133012, -0.9215347, -3.682192, 0, 1, 0.1137255, 1,
-0.410505, 1.505938, -0.5652581, 0, 1, 0.1176471, 1,
-0.4099955, 1.794947, 0.4714215, 0, 1, 0.1254902, 1,
-0.4092441, -0.0927277, -2.523731, 0, 1, 0.1294118, 1,
-0.4088098, -0.4354694, -2.159855, 0, 1, 0.1372549, 1,
-0.4080736, 0.9236065, -1.036628, 0, 1, 0.1411765, 1,
-0.4066374, -1.276547, -2.374304, 0, 1, 0.1490196, 1,
-0.4042029, -2.227067, -3.538618, 0, 1, 0.1529412, 1,
-0.4037275, 0.450662, -1.365951, 0, 1, 0.1607843, 1,
-0.4033802, 0.8477105, 0.04832797, 0, 1, 0.1647059, 1,
-0.3950742, 0.08270414, -1.45723, 0, 1, 0.172549, 1,
-0.3934572, 0.3566282, -0.2039112, 0, 1, 0.1764706, 1,
-0.387067, 1.421165, -0.3749947, 0, 1, 0.1843137, 1,
-0.3822686, -0.01065616, -0.2374252, 0, 1, 0.1882353, 1,
-0.3806634, 0.4172927, -0.650727, 0, 1, 0.1960784, 1,
-0.3794946, 1.044462, -1.132788, 0, 1, 0.2039216, 1,
-0.3743686, -1.434053, -3.978435, 0, 1, 0.2078431, 1,
-0.3692395, -0.6733957, -3.252423, 0, 1, 0.2156863, 1,
-0.3576611, 0.07501087, -1.486726, 0, 1, 0.2196078, 1,
-0.3561966, 0.8239916, -0.5471888, 0, 1, 0.227451, 1,
-0.3543602, 0.3186021, 0.1210985, 0, 1, 0.2313726, 1,
-0.3483405, 0.7458068, -2.063391, 0, 1, 0.2392157, 1,
-0.3472556, 0.2578957, -0.5244794, 0, 1, 0.2431373, 1,
-0.3465509, 0.8213652, -0.7809126, 0, 1, 0.2509804, 1,
-0.3460958, -1.456554, -2.695876, 0, 1, 0.254902, 1,
-0.3441727, 1.132212, -0.4638968, 0, 1, 0.2627451, 1,
-0.3405518, 2.114404, -0.6973699, 0, 1, 0.2666667, 1,
-0.3308689, 1.418414, 0.4024501, 0, 1, 0.2745098, 1,
-0.3307458, 0.6865439, -0.3947733, 0, 1, 0.2784314, 1,
-0.3291401, 0.5103806, -1.943774, 0, 1, 0.2862745, 1,
-0.3277306, -1.033016, -3.465445, 0, 1, 0.2901961, 1,
-0.3224422, 0.9536904, -0.7363778, 0, 1, 0.2980392, 1,
-0.3183236, -0.835967, -1.708295, 0, 1, 0.3058824, 1,
-0.3134671, -0.06206573, -2.677847, 0, 1, 0.3098039, 1,
-0.3129033, 0.3582712, 1.844683, 0, 1, 0.3176471, 1,
-0.3113312, -0.4110407, -1.873181, 0, 1, 0.3215686, 1,
-0.3112767, 1.728481, -1.048213, 0, 1, 0.3294118, 1,
-0.3083686, -0.6159503, -2.144044, 0, 1, 0.3333333, 1,
-0.3075911, 0.4318839, -2.181962, 0, 1, 0.3411765, 1,
-0.3068765, -1.415386, -3.037095, 0, 1, 0.345098, 1,
-0.3057934, 0.7315174, -2.20541, 0, 1, 0.3529412, 1,
-0.3054965, 0.2609435, -0.9805889, 0, 1, 0.3568628, 1,
-0.3041232, -0.1513125, -2.693108, 0, 1, 0.3647059, 1,
-0.298772, -0.1907818, -1.583379, 0, 1, 0.3686275, 1,
-0.2952109, -0.1457152, -3.235529, 0, 1, 0.3764706, 1,
-0.2938319, -1.267542, -1.92173, 0, 1, 0.3803922, 1,
-0.2937849, -0.53561, -2.475633, 0, 1, 0.3882353, 1,
-0.2922705, -0.07092295, -2.310164, 0, 1, 0.3921569, 1,
-0.2911228, 0.2255304, -0.4137685, 0, 1, 0.4, 1,
-0.2879241, 1.247846, 1.072924, 0, 1, 0.4078431, 1,
-0.2864528, -0.1934092, -1.437171, 0, 1, 0.4117647, 1,
-0.2840042, -0.3584478, -2.88026, 0, 1, 0.4196078, 1,
-0.2819677, 0.4597915, -0.3876579, 0, 1, 0.4235294, 1,
-0.2730579, -0.9751852, -1.876791, 0, 1, 0.4313726, 1,
-0.2686924, -1.300077, -2.400111, 0, 1, 0.4352941, 1,
-0.2675723, 0.7477915, 0.6590069, 0, 1, 0.4431373, 1,
-0.2659938, 0.7372003, 1.036627, 0, 1, 0.4470588, 1,
-0.2647873, 2.29737, -1.136207, 0, 1, 0.454902, 1,
-0.264586, 0.833779, -0.1965914, 0, 1, 0.4588235, 1,
-0.2636451, -0.1420008, -2.535146, 0, 1, 0.4666667, 1,
-0.2452534, 1.390453, -0.3601828, 0, 1, 0.4705882, 1,
-0.2425092, -1.959363, -4.904153, 0, 1, 0.4784314, 1,
-0.2412721, -0.4813413, -3.053054, 0, 1, 0.4823529, 1,
-0.2408907, 0.03499692, 1.407722, 0, 1, 0.4901961, 1,
-0.2350509, 1.879969, -0.5602407, 0, 1, 0.4941176, 1,
-0.2349603, -1.053924, -2.152055, 0, 1, 0.5019608, 1,
-0.2328955, 0.9793859, 0.9251736, 0, 1, 0.509804, 1,
-0.2327346, -1.00845, -2.423462, 0, 1, 0.5137255, 1,
-0.2311844, -0.04331152, -0.6151924, 0, 1, 0.5215687, 1,
-0.2266496, -0.7059128, -1.187972, 0, 1, 0.5254902, 1,
-0.2264132, -0.8406948, -2.535298, 0, 1, 0.5333334, 1,
-0.2256835, 0.3300867, -1.172333, 0, 1, 0.5372549, 1,
-0.2231064, -0.5840787, -3.043373, 0, 1, 0.5450981, 1,
-0.2229887, -0.4261765, -2.878406, 0, 1, 0.5490196, 1,
-0.2203089, 1.408827, 0.4289255, 0, 1, 0.5568628, 1,
-0.2194138, 0.7643419, -0.3383259, 0, 1, 0.5607843, 1,
-0.218893, 1.119992, -1.502341, 0, 1, 0.5686275, 1,
-0.2155792, 0.265048, -2.125212, 0, 1, 0.572549, 1,
-0.212767, -1.889559, -3.790674, 0, 1, 0.5803922, 1,
-0.2081965, 2.681635, -1.090992, 0, 1, 0.5843138, 1,
-0.2045926, -0.5229575, -0.4122532, 0, 1, 0.5921569, 1,
-0.2019659, -1.570371, -2.826145, 0, 1, 0.5960785, 1,
-0.1943505, 1.30319, -0.9014711, 0, 1, 0.6039216, 1,
-0.1938197, 1.68867, 0.5969065, 0, 1, 0.6117647, 1,
-0.1897876, -0.4755173, -3.036932, 0, 1, 0.6156863, 1,
-0.1864912, 0.2379981, -0.1903362, 0, 1, 0.6235294, 1,
-0.1836882, 1.138633, 0.06053007, 0, 1, 0.627451, 1,
-0.1831511, 1.318866, 0.3318914, 0, 1, 0.6352941, 1,
-0.1740025, 0.8636494, 0.5060845, 0, 1, 0.6392157, 1,
-0.1739527, -1.212408, -2.25748, 0, 1, 0.6470588, 1,
-0.1720871, -0.3964583, -3.335312, 0, 1, 0.6509804, 1,
-0.1719628, -0.248628, -3.016829, 0, 1, 0.6588235, 1,
-0.1709262, 0.5031765, 0.5451855, 0, 1, 0.6627451, 1,
-0.1693515, -0.569107, -3.173751, 0, 1, 0.6705883, 1,
-0.1643525, 0.02203973, -0.4220702, 0, 1, 0.6745098, 1,
-0.1616895, 0.08549252, -1.025264, 0, 1, 0.682353, 1,
-0.1569181, 2.567205, 0.2241009, 0, 1, 0.6862745, 1,
-0.1568234, 0.5146181, -0.6965451, 0, 1, 0.6941177, 1,
-0.1549917, -0.7264016, -1.157585, 0, 1, 0.7019608, 1,
-0.1504131, -0.5899529, -3.930194, 0, 1, 0.7058824, 1,
-0.1499212, -0.05257405, -0.9584681, 0, 1, 0.7137255, 1,
-0.1486763, 0.7426205, -0.6658264, 0, 1, 0.7176471, 1,
-0.1481068, -1.265125, -1.437474, 0, 1, 0.7254902, 1,
-0.1446296, -1.349684, -3.82634, 0, 1, 0.7294118, 1,
-0.1444112, 0.2672818, -1.277649, 0, 1, 0.7372549, 1,
-0.1437074, 0.9374781, -0.0904021, 0, 1, 0.7411765, 1,
-0.1424073, 1.465866, 0.6679876, 0, 1, 0.7490196, 1,
-0.1412882, 1.064117, -1.693909, 0, 1, 0.7529412, 1,
-0.1390873, -1.443318, -3.778031, 0, 1, 0.7607843, 1,
-0.1366749, 1.867528, -0.01195452, 0, 1, 0.7647059, 1,
-0.1352778, 0.5337517, 0.495292, 0, 1, 0.772549, 1,
-0.1299067, 0.138483, -1.101289, 0, 1, 0.7764706, 1,
-0.1250841, 0.5314045, -0.4729674, 0, 1, 0.7843137, 1,
-0.118354, -0.1162447, -3.579888, 0, 1, 0.7882353, 1,
-0.1168431, 2.067396, 1.430184, 0, 1, 0.7960784, 1,
-0.1131012, -0.5060176, -2.000158, 0, 1, 0.8039216, 1,
-0.1094132, -0.7718396, -3.231181, 0, 1, 0.8078431, 1,
-0.1065648, 1.655686, -1.214603, 0, 1, 0.8156863, 1,
-0.1055367, 0.4842978, 0.1965874, 0, 1, 0.8196079, 1,
-0.1011215, -0.4968726, -2.396583, 0, 1, 0.827451, 1,
-0.09723955, 0.7652327, 1.118696, 0, 1, 0.8313726, 1,
-0.08483139, -0.3395905, -1.658604, 0, 1, 0.8392157, 1,
-0.08429072, 0.05315162, -1.201817, 0, 1, 0.8431373, 1,
-0.08242057, -0.6447773, -2.993621, 0, 1, 0.8509804, 1,
-0.07946255, 0.2036094, 0.7527507, 0, 1, 0.854902, 1,
-0.07844979, -0.04512181, -1.328941, 0, 1, 0.8627451, 1,
-0.07755104, -0.1409684, -2.838895, 0, 1, 0.8666667, 1,
-0.07291359, 0.1731683, 1.070545, 0, 1, 0.8745098, 1,
-0.07222671, -0.4117723, -4.098495, 0, 1, 0.8784314, 1,
-0.07182852, -1.723283, -2.938933, 0, 1, 0.8862745, 1,
-0.06977598, 2.195965, 0.0656772, 0, 1, 0.8901961, 1,
-0.06767221, 0.921096, -1.165829, 0, 1, 0.8980392, 1,
-0.06573269, -2.191354, -2.311711, 0, 1, 0.9058824, 1,
-0.06345417, 0.128019, 0.4437264, 0, 1, 0.9098039, 1,
-0.05693842, -0.1969414, -4.002387, 0, 1, 0.9176471, 1,
-0.05595886, -0.3482845, -4.364662, 0, 1, 0.9215686, 1,
-0.05584758, -0.9900771, -1.926196, 0, 1, 0.9294118, 1,
-0.05026004, 1.143826, -1.744577, 0, 1, 0.9333333, 1,
-0.04938242, -1.351456, -2.060793, 0, 1, 0.9411765, 1,
-0.04916766, 0.6737834, -0.05782127, 0, 1, 0.945098, 1,
-0.04860353, 0.06153695, -1.060058, 0, 1, 0.9529412, 1,
-0.04846363, -2.128517, -3.14867, 0, 1, 0.9568627, 1,
-0.04817642, 0.2197475, -2.048537, 0, 1, 0.9647059, 1,
-0.04717301, -0.9457824, -3.28966, 0, 1, 0.9686275, 1,
-0.04336636, 0.1224376, -0.6637961, 0, 1, 0.9764706, 1,
-0.03548663, 1.708812, -0.8007262, 0, 1, 0.9803922, 1,
-0.03539174, -0.01899362, -1.994148, 0, 1, 0.9882353, 1,
-0.0340715, 0.3249175, -0.04106044, 0, 1, 0.9921569, 1,
-0.0297604, 0.137259, 0.3376074, 0, 1, 1, 1,
-0.02750742, -1.828702, -2.411979, 0, 0.9921569, 1, 1,
-0.02695587, -0.3655987, -3.905075, 0, 0.9882353, 1, 1,
-0.02478399, 1.569676, 0.1656772, 0, 0.9803922, 1, 1,
-0.0244693, 0.7802002, -1.513578, 0, 0.9764706, 1, 1,
-0.02313082, 0.2760596, 0.4626453, 0, 0.9686275, 1, 1,
-0.02041054, -0.8481941, -3.630964, 0, 0.9647059, 1, 1,
-0.01860368, 0.7417759, -0.176281, 0, 0.9568627, 1, 1,
-0.01709759, 1.036677, 1.729696, 0, 0.9529412, 1, 1,
-0.01497845, -0.6548843, -3.126885, 0, 0.945098, 1, 1,
-0.01071069, -0.5816357, -2.883343, 0, 0.9411765, 1, 1,
-0.008085112, -0.7683803, -1.952241, 0, 0.9333333, 1, 1,
-0.006972849, 0.1546204, 2.653805, 0, 0.9294118, 1, 1,
-0.003453095, -1.036789, -4.893792, 0, 0.9215686, 1, 1,
-0.003145977, -1.733038, -3.565024, 0, 0.9176471, 1, 1,
-0.003026712, 1.211171, 0.4104804, 0, 0.9098039, 1, 1,
-0.000651468, -0.06385331, -2.430634, 0, 0.9058824, 1, 1,
0.000414744, -1.210627, 3.385605, 0, 0.8980392, 1, 1,
0.003364363, 0.3186281, 1.070776, 0, 0.8901961, 1, 1,
0.005083241, 1.362253, -2.352192, 0, 0.8862745, 1, 1,
0.009299583, 1.246987, 0.667814, 0, 0.8784314, 1, 1,
0.01813823, -0.6661968, 1.249689, 0, 0.8745098, 1, 1,
0.02915519, -1.635386, 2.717429, 0, 0.8666667, 1, 1,
0.03653472, -0.1441792, 4.625268, 0, 0.8627451, 1, 1,
0.04062838, -0.01040614, 2.706488, 0, 0.854902, 1, 1,
0.04372484, -1.043354, 4.642185, 0, 0.8509804, 1, 1,
0.04421347, 0.009634771, 2.259434, 0, 0.8431373, 1, 1,
0.05130951, -0.1359472, 2.483505, 0, 0.8392157, 1, 1,
0.05184775, 0.4728737, 1.481317, 0, 0.8313726, 1, 1,
0.05316537, 0.345956, 0.3823138, 0, 0.827451, 1, 1,
0.05382732, -0.5545239, 0.9780177, 0, 0.8196079, 1, 1,
0.06108835, 0.7042753, 0.0865542, 0, 0.8156863, 1, 1,
0.06289627, 0.5403473, -0.0001520446, 0, 0.8078431, 1, 1,
0.06684215, 1.351623, -1.66658, 0, 0.8039216, 1, 1,
0.06784617, 1.240417, -0.7090368, 0, 0.7960784, 1, 1,
0.07540413, 1.072029, 2.553403, 0, 0.7882353, 1, 1,
0.07587429, 0.5657113, 1.776303, 0, 0.7843137, 1, 1,
0.08046396, -0.2258333, 1.076728, 0, 0.7764706, 1, 1,
0.0808451, 0.3909308, -1.02767, 0, 0.772549, 1, 1,
0.08151668, -0.9220108, 2.767273, 0, 0.7647059, 1, 1,
0.08155155, -0.2115146, 3.524536, 0, 0.7607843, 1, 1,
0.08544718, -0.1802095, 0.9444944, 0, 0.7529412, 1, 1,
0.08545672, -1.927308, 3.056709, 0, 0.7490196, 1, 1,
0.0892337, -0.2063043, 2.622775, 0, 0.7411765, 1, 1,
0.09890291, 0.4347534, 1.492865, 0, 0.7372549, 1, 1,
0.1023725, 0.01021007, 1.682361, 0, 0.7294118, 1, 1,
0.1052151, 0.3911382, 1.227887, 0, 0.7254902, 1, 1,
0.1060233, -0.3155888, 2.815888, 0, 0.7176471, 1, 1,
0.1068368, 0.8883991, 1.145922, 0, 0.7137255, 1, 1,
0.1112414, 0.8483656, 2.434051, 0, 0.7058824, 1, 1,
0.1118342, 0.1293029, 0.7768679, 0, 0.6980392, 1, 1,
0.1142072, 1.567352, -0.1762042, 0, 0.6941177, 1, 1,
0.115234, -0.8122928, 3.07097, 0, 0.6862745, 1, 1,
0.1187068, -0.7330572, 1.932202, 0, 0.682353, 1, 1,
0.1195688, -0.1970383, 3.506566, 0, 0.6745098, 1, 1,
0.1201442, -2.206454, 3.686689, 0, 0.6705883, 1, 1,
0.1253337, -0.06030119, 1.340299, 0, 0.6627451, 1, 1,
0.1287476, -1.157003, 2.330952, 0, 0.6588235, 1, 1,
0.1304242, -0.9687919, 4.298008, 0, 0.6509804, 1, 1,
0.1332896, 0.1488379, 0.6951805, 0, 0.6470588, 1, 1,
0.1431571, -0.4914118, 1.208441, 0, 0.6392157, 1, 1,
0.1479311, 1.419196, 0.7138154, 0, 0.6352941, 1, 1,
0.1497816, -0.1004169, 1.951381, 0, 0.627451, 1, 1,
0.1509944, 0.6621221, 0.5507433, 0, 0.6235294, 1, 1,
0.1524574, -1.101611, 3.591177, 0, 0.6156863, 1, 1,
0.1545791, 0.7518466, 0.2005927, 0, 0.6117647, 1, 1,
0.164405, 1.583729, -0.5294811, 0, 0.6039216, 1, 1,
0.1709781, -1.410698, 2.798156, 0, 0.5960785, 1, 1,
0.1722867, -0.2856372, 2.363182, 0, 0.5921569, 1, 1,
0.1729706, 0.8315867, 0.8645774, 0, 0.5843138, 1, 1,
0.1732277, -0.3725893, 1.43297, 0, 0.5803922, 1, 1,
0.1737982, 0.9180713, -0.2451737, 0, 0.572549, 1, 1,
0.1863711, 1.427764, -0.3593261, 0, 0.5686275, 1, 1,
0.1893462, -0.4763739, 2.594338, 0, 0.5607843, 1, 1,
0.1918724, -1.107265, 1.948264, 0, 0.5568628, 1, 1,
0.1961661, 1.076726, -1.293609, 0, 0.5490196, 1, 1,
0.1962277, 0.4190008, 1.41728, 0, 0.5450981, 1, 1,
0.2005311, 0.1334634, 1.656476, 0, 0.5372549, 1, 1,
0.2006517, -1.388204, 3.75612, 0, 0.5333334, 1, 1,
0.2016761, 0.3007196, 0.8120219, 0, 0.5254902, 1, 1,
0.2047029, -2.164927, 2.939227, 0, 0.5215687, 1, 1,
0.2048371, -2.044865, 2.775193, 0, 0.5137255, 1, 1,
0.2110492, 0.4047634, -0.01969904, 0, 0.509804, 1, 1,
0.2123833, 2.49144, -0.5696359, 0, 0.5019608, 1, 1,
0.2127966, -1.219103, 1.397943, 0, 0.4941176, 1, 1,
0.2147464, 0.3269185, 0.9460808, 0, 0.4901961, 1, 1,
0.2193992, 0.1209584, 2.028312, 0, 0.4823529, 1, 1,
0.2214336, -0.9123262, 1.255516, 0, 0.4784314, 1, 1,
0.2232468, 1.693651, -0.5430748, 0, 0.4705882, 1, 1,
0.2238177, 1.364327, -0.6491109, 0, 0.4666667, 1, 1,
0.2238558, 0.07273561, 0.6877866, 0, 0.4588235, 1, 1,
0.2250055, -2.295898, 3.284023, 0, 0.454902, 1, 1,
0.2290685, 0.03576815, 0.5104673, 0, 0.4470588, 1, 1,
0.2320845, -1.186682, 2.67146, 0, 0.4431373, 1, 1,
0.2351834, -1.870777, 2.377423, 0, 0.4352941, 1, 1,
0.2381247, -0.3172825, 1.918547, 0, 0.4313726, 1, 1,
0.2385063, 0.8803104, 0.4114017, 0, 0.4235294, 1, 1,
0.2386284, 0.8120834, 0.4096479, 0, 0.4196078, 1, 1,
0.2419991, -1.223738, 3.66315, 0, 0.4117647, 1, 1,
0.2432074, 1.328428, 0.2385581, 0, 0.4078431, 1, 1,
0.2447785, 0.01648424, 1.265197, 0, 0.4, 1, 1,
0.2500924, -0.7858865, 1.279752, 0, 0.3921569, 1, 1,
0.25157, 0.4725286, 0.5154154, 0, 0.3882353, 1, 1,
0.2573128, -0.4205064, 1.901679, 0, 0.3803922, 1, 1,
0.2607628, -0.6402569, 1.908717, 0, 0.3764706, 1, 1,
0.2638503, 0.2187705, 1.568484, 0, 0.3686275, 1, 1,
0.2639289, -0.7927972, 2.622367, 0, 0.3647059, 1, 1,
0.2645468, -0.4462545, 2.946307, 0, 0.3568628, 1, 1,
0.2646231, -1.662675, 1.652025, 0, 0.3529412, 1, 1,
0.2679762, 0.9023154, -0.4426906, 0, 0.345098, 1, 1,
0.2745147, 0.2191215, 1.734659, 0, 0.3411765, 1, 1,
0.277634, 1.297386, -0.815116, 0, 0.3333333, 1, 1,
0.2788645, 1.381017, -2.032805, 0, 0.3294118, 1, 1,
0.2804557, 0.458397, 2.546357, 0, 0.3215686, 1, 1,
0.280585, -2.109085, 3.059524, 0, 0.3176471, 1, 1,
0.2832415, -0.7552738, 1.983495, 0, 0.3098039, 1, 1,
0.2840137, 0.6054518, 1.139805, 0, 0.3058824, 1, 1,
0.2849957, -0.2194216, 2.986984, 0, 0.2980392, 1, 1,
0.2889131, -1.417209, 4.502884, 0, 0.2901961, 1, 1,
0.2979431, 0.9556841, -0.02636678, 0, 0.2862745, 1, 1,
0.3011001, -0.3226418, 1.999103, 0, 0.2784314, 1, 1,
0.3019669, -0.8455813, 3.765643, 0, 0.2745098, 1, 1,
0.3035462, 0.9907097, -2.240285, 0, 0.2666667, 1, 1,
0.3056052, -0.1540277, 3.015656, 0, 0.2627451, 1, 1,
0.3058641, 0.1618217, 2.354838, 0, 0.254902, 1, 1,
0.3167601, -0.7876647, 2.827441, 0, 0.2509804, 1, 1,
0.3204772, 0.2631424, 2.52787, 0, 0.2431373, 1, 1,
0.3218648, -0.3554632, 2.078835, 0, 0.2392157, 1, 1,
0.3219859, 0.538753, -0.5498011, 0, 0.2313726, 1, 1,
0.3245491, 0.02249594, 0.742494, 0, 0.227451, 1, 1,
0.3269556, -0.735895, 2.001413, 0, 0.2196078, 1, 1,
0.3294431, 1.413124, -1.578861, 0, 0.2156863, 1, 1,
0.3298599, -1.32359, 4.527475, 0, 0.2078431, 1, 1,
0.332464, -0.07542644, 1.217348, 0, 0.2039216, 1, 1,
0.3401817, 0.2479772, -0.3057686, 0, 0.1960784, 1, 1,
0.3461192, 1.084551, -0.3842973, 0, 0.1882353, 1, 1,
0.3465196, 1.10244, 1.13736, 0, 0.1843137, 1, 1,
0.3505571, 0.09535346, 0.9020432, 0, 0.1764706, 1, 1,
0.3517474, 1.323441, 1.258344, 0, 0.172549, 1, 1,
0.3544293, -0.5780258, 1.285574, 0, 0.1647059, 1, 1,
0.3547495, 1.840518, -0.1718564, 0, 0.1607843, 1, 1,
0.3554204, 0.6554732, 1.966964, 0, 0.1529412, 1, 1,
0.3560343, 2.357043, 0.5829221, 0, 0.1490196, 1, 1,
0.3583812, -2.196102, 1.296663, 0, 0.1411765, 1, 1,
0.3601893, -0.9107884, 4.32748, 0, 0.1372549, 1, 1,
0.3653566, 0.5906274, 1.808177, 0, 0.1294118, 1, 1,
0.3715322, 1.063044, -0.5350803, 0, 0.1254902, 1, 1,
0.3741201, 0.5326522, 2.030628, 0, 0.1176471, 1, 1,
0.3780372, -0.3007117, 4.968399, 0, 0.1137255, 1, 1,
0.3802821, 0.1741197, 0.3496819, 0, 0.1058824, 1, 1,
0.3808633, 0.8012744, 1.070838, 0, 0.09803922, 1, 1,
0.3814434, 1.642973, 0.6955182, 0, 0.09411765, 1, 1,
0.3847891, -0.813624, 3.12707, 0, 0.08627451, 1, 1,
0.3850649, 1.443733, -0.394075, 0, 0.08235294, 1, 1,
0.3852632, -1.04803, 4.014144, 0, 0.07450981, 1, 1,
0.3968611, -1.047227, 0.8965939, 0, 0.07058824, 1, 1,
0.4022252, 0.541913, 0.9311741, 0, 0.0627451, 1, 1,
0.4063783, 0.2554074, 1.007194, 0, 0.05882353, 1, 1,
0.4109889, -0.5442462, 1.497125, 0, 0.05098039, 1, 1,
0.4110859, 0.5844162, 0.1827375, 0, 0.04705882, 1, 1,
0.4127103, 1.043595, 2.025565, 0, 0.03921569, 1, 1,
0.414328, -0.5566193, 3.103697, 0, 0.03529412, 1, 1,
0.4148889, 0.367552, -1.383667, 0, 0.02745098, 1, 1,
0.4187928, 1.022991, 1.534956, 0, 0.02352941, 1, 1,
0.4196444, 0.9449834, -1.204491, 0, 0.01568628, 1, 1,
0.4217264, -0.348246, 2.149345, 0, 0.01176471, 1, 1,
0.4242184, -0.3840258, 1.477666, 0, 0.003921569, 1, 1,
0.425294, 0.7628838, 1.005058, 0.003921569, 0, 1, 1,
0.4280706, 0.3339345, 2.241606, 0.007843138, 0, 1, 1,
0.431105, -1.359919, 3.90586, 0.01568628, 0, 1, 1,
0.4320062, -0.5674066, 0.4279386, 0.01960784, 0, 1, 1,
0.435109, -0.9808331, 4.322808, 0.02745098, 0, 1, 1,
0.439753, 0.8709718, 1.228278, 0.03137255, 0, 1, 1,
0.4412911, 0.5551163, -0.5872071, 0.03921569, 0, 1, 1,
0.4463889, -0.7314538, 1.865913, 0.04313726, 0, 1, 1,
0.4479032, 2.369877, -0.7971514, 0.05098039, 0, 1, 1,
0.4487762, 1.239317, -1.481519, 0.05490196, 0, 1, 1,
0.4541607, 0.09111458, 2.228099, 0.0627451, 0, 1, 1,
0.4546595, 0.4708031, 1.57066, 0.06666667, 0, 1, 1,
0.4584841, -0.7136978, 2.66954, 0.07450981, 0, 1, 1,
0.4615631, 0.4957674, 0.1430259, 0.07843138, 0, 1, 1,
0.4626685, -1.678029, 3.179497, 0.08627451, 0, 1, 1,
0.4663878, -1.627033, 3.898256, 0.09019608, 0, 1, 1,
0.4683113, -0.06621069, 2.649694, 0.09803922, 0, 1, 1,
0.4695746, -0.6709751, 3.058854, 0.1058824, 0, 1, 1,
0.4715428, -1.250075, 3.397482, 0.1098039, 0, 1, 1,
0.476633, -0.1813805, 1.485092, 0.1176471, 0, 1, 1,
0.4780325, -0.3772325, 1.801505, 0.1215686, 0, 1, 1,
0.4796084, 1.077935, 0.4092991, 0.1294118, 0, 1, 1,
0.4811017, -0.4891437, 1.466745, 0.1333333, 0, 1, 1,
0.4850023, -0.352857, 0.01784557, 0.1411765, 0, 1, 1,
0.4866022, 0.8735558, 0.5417792, 0.145098, 0, 1, 1,
0.4870609, 0.2853189, 1.194071, 0.1529412, 0, 1, 1,
0.491964, 1.001688, 0.9354655, 0.1568628, 0, 1, 1,
0.4970437, 0.4130051, 1.717286, 0.1647059, 0, 1, 1,
0.4984023, -0.5431443, 2.300655, 0.1686275, 0, 1, 1,
0.5010232, -0.2063269, 1.778362, 0.1764706, 0, 1, 1,
0.5035887, 1.26456, 0.1494608, 0.1803922, 0, 1, 1,
0.5066925, -1.301915, 3.126864, 0.1882353, 0, 1, 1,
0.5232108, 0.1944274, 0.5065644, 0.1921569, 0, 1, 1,
0.5245323, 0.2933898, 0.6290877, 0.2, 0, 1, 1,
0.5248917, -0.3630786, 2.32577, 0.2078431, 0, 1, 1,
0.5270019, -0.6837486, 1.014121, 0.2117647, 0, 1, 1,
0.5285753, 2.755207, -0.05256854, 0.2196078, 0, 1, 1,
0.530309, 0.6492082, 1.123876, 0.2235294, 0, 1, 1,
0.5304338, -0.2007785, 1.45426, 0.2313726, 0, 1, 1,
0.531386, 2.979724, -0.8610685, 0.2352941, 0, 1, 1,
0.5339836, -0.183702, 2.344241, 0.2431373, 0, 1, 1,
0.5370935, 0.7707155, -0.4038552, 0.2470588, 0, 1, 1,
0.5393709, 0.6822085, 2.303509, 0.254902, 0, 1, 1,
0.5409909, 0.6204576, 1.678993, 0.2588235, 0, 1, 1,
0.5410786, -2.682927, 2.250878, 0.2666667, 0, 1, 1,
0.5442237, 0.3124306, 1.121571, 0.2705882, 0, 1, 1,
0.5465852, -1.375422, 3.401577, 0.2784314, 0, 1, 1,
0.5490007, -2.430447, 3.035033, 0.282353, 0, 1, 1,
0.55015, 0.02254082, 2.359557, 0.2901961, 0, 1, 1,
0.5538439, -0.1758138, 0.1138363, 0.2941177, 0, 1, 1,
0.5569547, 0.09319873, 2.461651, 0.3019608, 0, 1, 1,
0.5576555, 0.09993105, -0.2040566, 0.3098039, 0, 1, 1,
0.5590627, -1.878426, 2.784184, 0.3137255, 0, 1, 1,
0.5620649, 0.185637, 2.17219, 0.3215686, 0, 1, 1,
0.5643415, -0.7143108, 2.933708, 0.3254902, 0, 1, 1,
0.5678558, -0.9665461, 2.956812, 0.3333333, 0, 1, 1,
0.5678934, 0.4290689, 0.647789, 0.3372549, 0, 1, 1,
0.5705359, -0.7729792, 3.032895, 0.345098, 0, 1, 1,
0.5723404, -0.6334749, 3.339924, 0.3490196, 0, 1, 1,
0.5739703, 1.934704, 0.9218086, 0.3568628, 0, 1, 1,
0.5828893, 0.1949146, 1.575252, 0.3607843, 0, 1, 1,
0.5878959, 0.5023984, 0.5002535, 0.3686275, 0, 1, 1,
0.5930947, -0.6172636, 2.040299, 0.372549, 0, 1, 1,
0.5937772, 1.735116, 1.325513, 0.3803922, 0, 1, 1,
0.5946282, -1.240592, 2.727913, 0.3843137, 0, 1, 1,
0.6016158, -0.9601184, 2.008009, 0.3921569, 0, 1, 1,
0.6023244, -1.094016, 3.549783, 0.3960784, 0, 1, 1,
0.60511, 1.538393, -0.4744839, 0.4039216, 0, 1, 1,
0.6101542, -0.4134557, 2.700464, 0.4117647, 0, 1, 1,
0.6197893, -0.7656201, 0.8625399, 0.4156863, 0, 1, 1,
0.6245464, 0.1618856, 0.1811427, 0.4235294, 0, 1, 1,
0.6246873, 1.461117, 0.3531655, 0.427451, 0, 1, 1,
0.6271143, 0.4759745, 1.706757, 0.4352941, 0, 1, 1,
0.6281479, 0.2147271, 1.022308, 0.4392157, 0, 1, 1,
0.6374801, -1.404464, 2.244666, 0.4470588, 0, 1, 1,
0.6381416, 0.01992026, 1.599038, 0.4509804, 0, 1, 1,
0.6390232, 1.473061, -0.5535116, 0.4588235, 0, 1, 1,
0.639506, 1.091518, 0.3696554, 0.4627451, 0, 1, 1,
0.65264, -1.351115, 3.187088, 0.4705882, 0, 1, 1,
0.6543783, -0.6999931, 2.282213, 0.4745098, 0, 1, 1,
0.6594067, 1.220777, 0.1143636, 0.4823529, 0, 1, 1,
0.664647, 0.08741377, 0.3396055, 0.4862745, 0, 1, 1,
0.6691281, 0.7725728, 1.966596, 0.4941176, 0, 1, 1,
0.6729318, 0.358246, 0.8603701, 0.5019608, 0, 1, 1,
0.6821696, -0.3798584, 1.90308, 0.5058824, 0, 1, 1,
0.6865348, -0.3551378, 3.640118, 0.5137255, 0, 1, 1,
0.6870732, 0.7604917, -0.8448617, 0.5176471, 0, 1, 1,
0.691747, -0.2128323, 2.746416, 0.5254902, 0, 1, 1,
0.6936712, -1.534418, 2.123571, 0.5294118, 0, 1, 1,
0.6964529, 0.9515511, 0.2876034, 0.5372549, 0, 1, 1,
0.7105438, -0.40429, 2.924864, 0.5411765, 0, 1, 1,
0.7110661, -0.1777902, 2.197686, 0.5490196, 0, 1, 1,
0.7115343, -0.7803181, 1.756333, 0.5529412, 0, 1, 1,
0.7151502, 1.111592, -0.08807724, 0.5607843, 0, 1, 1,
0.7158639, -1.086564, 3.968915, 0.5647059, 0, 1, 1,
0.7212255, 0.4961297, 1.10859, 0.572549, 0, 1, 1,
0.7216862, -1.968633, 1.849589, 0.5764706, 0, 1, 1,
0.7219389, 0.01381769, 1.543471, 0.5843138, 0, 1, 1,
0.7219586, 0.469045, 1.56598, 0.5882353, 0, 1, 1,
0.7222297, -0.1559879, 1.697669, 0.5960785, 0, 1, 1,
0.7261065, -1.116253, 2.181472, 0.6039216, 0, 1, 1,
0.7278588, -0.7831516, 2.265473, 0.6078432, 0, 1, 1,
0.7304434, -2.207242, 3.76659, 0.6156863, 0, 1, 1,
0.7307796, -0.2406975, 1.562858, 0.6196079, 0, 1, 1,
0.7322711, 1.047752, 1.550986, 0.627451, 0, 1, 1,
0.7370395, -0.7768732, 2.265776, 0.6313726, 0, 1, 1,
0.7524931, 1.200055, 0.3876855, 0.6392157, 0, 1, 1,
0.7574905, 0.2742054, 1.612636, 0.6431373, 0, 1, 1,
0.7583478, 0.9030545, 0.3767574, 0.6509804, 0, 1, 1,
0.7618148, -0.06033316, 2.484434, 0.654902, 0, 1, 1,
0.7640859, 0.3019142, 1.849491, 0.6627451, 0, 1, 1,
0.7649843, 0.3552465, 0.4576066, 0.6666667, 0, 1, 1,
0.7668845, 1.117754, 1.364515, 0.6745098, 0, 1, 1,
0.7671736, -0.7852129, 2.56948, 0.6784314, 0, 1, 1,
0.7678682, 0.2453007, -0.4107943, 0.6862745, 0, 1, 1,
0.7754232, -0.1404245, 0.7040215, 0.6901961, 0, 1, 1,
0.7763804, 0.1699761, 1.59971, 0.6980392, 0, 1, 1,
0.7807651, -0.09679897, 1.680971, 0.7058824, 0, 1, 1,
0.7807881, 0.6660777, 0.7721269, 0.7098039, 0, 1, 1,
0.780797, 1.708194, 0.350697, 0.7176471, 0, 1, 1,
0.7822429, -1.039387, 3.150658, 0.7215686, 0, 1, 1,
0.7822815, -2.523117, 2.067767, 0.7294118, 0, 1, 1,
0.7861176, -0.6615009, 1.95158, 0.7333333, 0, 1, 1,
0.7914063, 0.2545372, 0.4296018, 0.7411765, 0, 1, 1,
0.7928593, -0.3781383, 2.4352, 0.7450981, 0, 1, 1,
0.8052795, -0.8335057, 3.829716, 0.7529412, 0, 1, 1,
0.8061327, 0.3730387, 2.102117, 0.7568628, 0, 1, 1,
0.8065626, 0.09255639, 2.528199, 0.7647059, 0, 1, 1,
0.8075961, 1.740408, 0.2952909, 0.7686275, 0, 1, 1,
0.8151879, -1.03612, 2.625169, 0.7764706, 0, 1, 1,
0.8161663, 1.546458, 0.7598764, 0.7803922, 0, 1, 1,
0.8281562, -1.407203, 1.50508, 0.7882353, 0, 1, 1,
0.8282519, -0.3786179, 2.220905, 0.7921569, 0, 1, 1,
0.8338462, 1.072324, 1.274405, 0.8, 0, 1, 1,
0.8366936, -1.101818, 2.255494, 0.8078431, 0, 1, 1,
0.8391353, 1.272639, 0.4816707, 0.8117647, 0, 1, 1,
0.8476667, -0.2270593, 2.845037, 0.8196079, 0, 1, 1,
0.8616146, -0.5361409, 1.37007, 0.8235294, 0, 1, 1,
0.863884, -0.1980298, 1.493041, 0.8313726, 0, 1, 1,
0.868576, -0.773973, 2.677099, 0.8352941, 0, 1, 1,
0.8734968, -0.2986283, 3.302411, 0.8431373, 0, 1, 1,
0.8736624, -1.313961, 0.514191, 0.8470588, 0, 1, 1,
0.8754872, -0.2847324, 3.71154, 0.854902, 0, 1, 1,
0.8796678, -0.1281802, 1.612348, 0.8588235, 0, 1, 1,
0.8843588, 1.618612, 0.5882081, 0.8666667, 0, 1, 1,
0.8885059, 1.476786, 1.630123, 0.8705882, 0, 1, 1,
0.8952667, 1.041026, 1.161414, 0.8784314, 0, 1, 1,
0.9020793, 1.905591, 0.1778868, 0.8823529, 0, 1, 1,
0.9138866, -0.6495324, -0.9694214, 0.8901961, 0, 1, 1,
0.9274769, -1.415725, 2.388421, 0.8941177, 0, 1, 1,
0.9398952, -0.7567637, 2.023075, 0.9019608, 0, 1, 1,
0.9490131, -0.684864, 0.6582851, 0.9098039, 0, 1, 1,
0.9503242, 0.7316198, -0.1491991, 0.9137255, 0, 1, 1,
0.9574809, 0.554343, 2.275591, 0.9215686, 0, 1, 1,
0.958759, -1.32624, 1.304383, 0.9254902, 0, 1, 1,
0.9626538, -0.9457238, 3.632263, 0.9333333, 0, 1, 1,
0.9735074, 0.09011532, 1.633254, 0.9372549, 0, 1, 1,
0.9761758, 1.055015, 1.052859, 0.945098, 0, 1, 1,
0.984832, -1.091296, 1.395977, 0.9490196, 0, 1, 1,
0.9851772, -0.9124109, 3.428687, 0.9568627, 0, 1, 1,
0.986587, 0.4783685, 1.620221, 0.9607843, 0, 1, 1,
0.9877703, 1.573985, 1.22007, 0.9686275, 0, 1, 1,
0.9878357, -0.3851277, 1.565973, 0.972549, 0, 1, 1,
0.9928234, 0.8940187, 1.178921, 0.9803922, 0, 1, 1,
0.9932443, -0.8790782, 2.799917, 0.9843137, 0, 1, 1,
0.9948877, -0.8812202, 4.041057, 0.9921569, 0, 1, 1,
0.996204, -1.016856, 0.7800929, 0.9960784, 0, 1, 1,
0.9969429, 0.9526754, -1.037081, 1, 0, 0.9960784, 1,
1.00137, 0.9572468, -0.02528849, 1, 0, 0.9882353, 1,
1.00784, -1.357472, 2.878669, 1, 0, 0.9843137, 1,
1.015807, 0.1909788, 1.45358, 1, 0, 0.9764706, 1,
1.020249, 0.1130621, 0.3419808, 1, 0, 0.972549, 1,
1.0256, -0.4589163, 3.336583, 1, 0, 0.9647059, 1,
1.030779, 1.069953, 1.087863, 1, 0, 0.9607843, 1,
1.033254, -1.235886, 2.683293, 1, 0, 0.9529412, 1,
1.033353, -0.3669286, 1.922402, 1, 0, 0.9490196, 1,
1.039757, -0.07848601, 2.897139, 1, 0, 0.9411765, 1,
1.040062, 0.5921549, 2.249677, 1, 0, 0.9372549, 1,
1.052947, 0.1480411, 1.657456, 1, 0, 0.9294118, 1,
1.055841, -0.9399954, 2.350021, 1, 0, 0.9254902, 1,
1.061452, 0.01605473, 1.793362, 1, 0, 0.9176471, 1,
1.061631, 1.42978, 1.220098, 1, 0, 0.9137255, 1,
1.067827, 1.396856, 0.8086025, 1, 0, 0.9058824, 1,
1.072477, 0.1067489, 1.88533, 1, 0, 0.9019608, 1,
1.0735, -0.2060083, 3.473036, 1, 0, 0.8941177, 1,
1.074636, -0.01865126, 0.1235839, 1, 0, 0.8862745, 1,
1.075363, -0.3289182, 3.063559, 1, 0, 0.8823529, 1,
1.07969, 0.173949, 1.268846, 1, 0, 0.8745098, 1,
1.079922, 0.5697489, 0.05987202, 1, 0, 0.8705882, 1,
1.082424, -0.8432202, 2.483131, 1, 0, 0.8627451, 1,
1.082968, 0.4125694, 1.661876, 1, 0, 0.8588235, 1,
1.08786, -0.6971471, 4.23084, 1, 0, 0.8509804, 1,
1.090057, 0.2243464, 2.580405, 1, 0, 0.8470588, 1,
1.101051, -0.6508673, -0.298624, 1, 0, 0.8392157, 1,
1.103159, 0.8580796, 0.7371029, 1, 0, 0.8352941, 1,
1.103178, -0.1495079, 2.819743, 1, 0, 0.827451, 1,
1.103819, -0.6587369, -0.1186688, 1, 0, 0.8235294, 1,
1.10397, -0.5198912, 3.008731, 1, 0, 0.8156863, 1,
1.107368, -2.301824, 3.09519, 1, 0, 0.8117647, 1,
1.109372, -0.8084103, 4.082254, 1, 0, 0.8039216, 1,
1.114318, 1.281163, 1.021835, 1, 0, 0.7960784, 1,
1.116036, 0.9032864, 1.693982, 1, 0, 0.7921569, 1,
1.117186, -0.7689558, 3.751226, 1, 0, 0.7843137, 1,
1.118161, -0.9152825, 1.254115, 1, 0, 0.7803922, 1,
1.122819, -0.3135263, 1.486458, 1, 0, 0.772549, 1,
1.124178, 0.8208819, 4.479472, 1, 0, 0.7686275, 1,
1.135043, -2.118522, -0.1138537, 1, 0, 0.7607843, 1,
1.137071, 0.05641862, 0.3640057, 1, 0, 0.7568628, 1,
1.142733, 0.9344927, 1.546075, 1, 0, 0.7490196, 1,
1.146709, -0.2743899, 0.6026657, 1, 0, 0.7450981, 1,
1.160037, -1.095354, 2.254057, 1, 0, 0.7372549, 1,
1.166537, 0.4636078, 0.7680948, 1, 0, 0.7333333, 1,
1.17304, 1.813912, 0.5296021, 1, 0, 0.7254902, 1,
1.194873, 0.2442936, 3.114245, 1, 0, 0.7215686, 1,
1.197673, 0.7911752, 2.445238, 1, 0, 0.7137255, 1,
1.198267, -0.1978807, 0.949675, 1, 0, 0.7098039, 1,
1.207389, 1.498017, 0.780816, 1, 0, 0.7019608, 1,
1.213009, -1.837897, 2.394546, 1, 0, 0.6941177, 1,
1.236399, -0.655381, 1.340937, 1, 0, 0.6901961, 1,
1.236589, -0.2122748, 2.220838, 1, 0, 0.682353, 1,
1.240056, -0.08511256, 2.53766, 1, 0, 0.6784314, 1,
1.241637, -0.9071903, 4.457033, 1, 0, 0.6705883, 1,
1.261859, -0.3972129, 0.8380114, 1, 0, 0.6666667, 1,
1.269251, 1.554877, 0.2746627, 1, 0, 0.6588235, 1,
1.280877, -1.869982, 2.643396, 1, 0, 0.654902, 1,
1.286384, -1.132301, 3.019185, 1, 0, 0.6470588, 1,
1.289786, -1.782943, 0.4904427, 1, 0, 0.6431373, 1,
1.299154, -0.6901003, 2.409103, 1, 0, 0.6352941, 1,
1.306876, -0.6373624, 2.238649, 1, 0, 0.6313726, 1,
1.311712, 0.120375, 2.110175, 1, 0, 0.6235294, 1,
1.323034, -0.5639967, -0.03519424, 1, 0, 0.6196079, 1,
1.333871, -0.8712902, 0.3176292, 1, 0, 0.6117647, 1,
1.335143, -1.042262, 1.24075, 1, 0, 0.6078432, 1,
1.336679, -0.6236734, 2.74036, 1, 0, 0.6, 1,
1.338092, 0.07134648, 2.666437, 1, 0, 0.5921569, 1,
1.348093, 0.2081947, 1.273219, 1, 0, 0.5882353, 1,
1.348322, -0.674567, 1.651021, 1, 0, 0.5803922, 1,
1.349698, 0.7017705, 1.090354, 1, 0, 0.5764706, 1,
1.350134, -0.1180448, 0.8666262, 1, 0, 0.5686275, 1,
1.373462, -0.5288568, 1.122424, 1, 0, 0.5647059, 1,
1.380357, 1.130104, 1.516189, 1, 0, 0.5568628, 1,
1.38394, 1.62699, 0.8656531, 1, 0, 0.5529412, 1,
1.392676, 0.2752283, 1.157628, 1, 0, 0.5450981, 1,
1.393065, 0.05391546, 2.968469, 1, 0, 0.5411765, 1,
1.394111, -0.9007463, 2.194391, 1, 0, 0.5333334, 1,
1.395038, -1.10957, 3.611566, 1, 0, 0.5294118, 1,
1.400396, 1.313148, 1.03227, 1, 0, 0.5215687, 1,
1.403051, 0.003824627, 2.907973, 1, 0, 0.5176471, 1,
1.413675, -1.284008, 0.4301979, 1, 0, 0.509804, 1,
1.425627, -1.430577, 1.839521, 1, 0, 0.5058824, 1,
1.426907, 0.3648144, 0.3856036, 1, 0, 0.4980392, 1,
1.438478, -0.6027235, 0.6367903, 1, 0, 0.4901961, 1,
1.447383, 0.65679, 0.9400005, 1, 0, 0.4862745, 1,
1.463156, -1.343028, 1.885339, 1, 0, 0.4784314, 1,
1.480524, 0.054494, 0.4809916, 1, 0, 0.4745098, 1,
1.494241, 2.004204, 1.796, 1, 0, 0.4666667, 1,
1.498275, 0.4921228, 1.644653, 1, 0, 0.4627451, 1,
1.499086, 1.358148, 1.972938, 1, 0, 0.454902, 1,
1.501143, 0.13165, 2.113477, 1, 0, 0.4509804, 1,
1.505487, -1.301186, 2.592772, 1, 0, 0.4431373, 1,
1.51326, -0.3429251, 0.3415296, 1, 0, 0.4392157, 1,
1.515925, 1.808936, 1.227698, 1, 0, 0.4313726, 1,
1.516319, 0.1423687, 1.408635, 1, 0, 0.427451, 1,
1.548918, 0.1794928, 2.515573, 1, 0, 0.4196078, 1,
1.549532, 0.9158069, 1.741944, 1, 0, 0.4156863, 1,
1.550304, 0.1587365, 1.853249, 1, 0, 0.4078431, 1,
1.557965, 1.155175, 2.315788, 1, 0, 0.4039216, 1,
1.560217, -1.460869, 1.611268, 1, 0, 0.3960784, 1,
1.562072, -0.7608752, 1.166925, 1, 0, 0.3882353, 1,
1.573517, 0.04456948, 2.434315, 1, 0, 0.3843137, 1,
1.576624, -1.059309, 0.5933571, 1, 0, 0.3764706, 1,
1.606974, 1.21632, 2.686224, 1, 0, 0.372549, 1,
1.618489, 0.997674, 0.02662214, 1, 0, 0.3647059, 1,
1.61988, -1.296828, 1.758653, 1, 0, 0.3607843, 1,
1.625589, 1.268022, 3.023017, 1, 0, 0.3529412, 1,
1.63006, -0.6714302, 2.52024, 1, 0, 0.3490196, 1,
1.637246, -0.3981069, 2.060028, 1, 0, 0.3411765, 1,
1.645647, 0.6659133, 0.8037248, 1, 0, 0.3372549, 1,
1.649937, 1.43169, 3.05846, 1, 0, 0.3294118, 1,
1.651582, -0.3490675, 1.260289, 1, 0, 0.3254902, 1,
1.667915, -1.173931, 1.723808, 1, 0, 0.3176471, 1,
1.673162, 0.8524211, 0.9260305, 1, 0, 0.3137255, 1,
1.682759, 0.3903919, 0.3058982, 1, 0, 0.3058824, 1,
1.706928, -0.5445936, -0.3345315, 1, 0, 0.2980392, 1,
1.734807, 0.4501998, 2.646096, 1, 0, 0.2941177, 1,
1.73511, 1.028835, 1.782041, 1, 0, 0.2862745, 1,
1.738132, 1.459717, 1.807556, 1, 0, 0.282353, 1,
1.743628, -0.1035157, 0.1789059, 1, 0, 0.2745098, 1,
1.762473, 0.01052974, -0.6111604, 1, 0, 0.2705882, 1,
1.803654, -0.04191998, 2.632071, 1, 0, 0.2627451, 1,
1.811075, 0.5470106, 1.077843, 1, 0, 0.2588235, 1,
1.816624, 0.2990592, 2.265496, 1, 0, 0.2509804, 1,
1.827384, -0.06786072, 2.764225, 1, 0, 0.2470588, 1,
1.849019, -1.223771, 1.532772, 1, 0, 0.2392157, 1,
1.860291, 0.1434339, 0.4999084, 1, 0, 0.2352941, 1,
1.87599, 0.2438973, 1.40914, 1, 0, 0.227451, 1,
1.881174, -0.1971312, 1.44119, 1, 0, 0.2235294, 1,
1.903357, -0.7215722, 2.337475, 1, 0, 0.2156863, 1,
1.921519, 2.186251, 3.340494, 1, 0, 0.2117647, 1,
1.931864, 1.190712, 0.2606479, 1, 0, 0.2039216, 1,
1.932142, -0.1910088, 0.8890852, 1, 0, 0.1960784, 1,
1.938963, 0.4093594, 0.9400177, 1, 0, 0.1921569, 1,
1.965531, 1.126571, 1.403461, 1, 0, 0.1843137, 1,
1.973809, 0.1072399, 3.433101, 1, 0, 0.1803922, 1,
1.974408, -0.6501409, 2.608346, 1, 0, 0.172549, 1,
1.992674, -0.6865608, 0.6328438, 1, 0, 0.1686275, 1,
2.01631, 0.2321383, 1.63778, 1, 0, 0.1607843, 1,
2.017149, 0.6927656, 0.4864507, 1, 0, 0.1568628, 1,
2.02422, -0.006683285, 0.4722689, 1, 0, 0.1490196, 1,
2.040983, 0.8115718, 0.8708646, 1, 0, 0.145098, 1,
2.051214, 0.4339451, 2.753199, 1, 0, 0.1372549, 1,
2.054249, 1.886998, 0.1599117, 1, 0, 0.1333333, 1,
2.061968, -0.395832, 1.908332, 1, 0, 0.1254902, 1,
2.071243, 1.307024, 0.1776898, 1, 0, 0.1215686, 1,
2.087957, 0.746249, 0.3158563, 1, 0, 0.1137255, 1,
2.100272, 0.8890728, 0.4911695, 1, 0, 0.1098039, 1,
2.108371, -0.1855211, 1.005242, 1, 0, 0.1019608, 1,
2.115679, -2.618575, 2.077032, 1, 0, 0.09411765, 1,
2.12077, 0.8528745, 1.795158, 1, 0, 0.09019608, 1,
2.130649, -0.8633153, 1.934568, 1, 0, 0.08235294, 1,
2.13889, -1.374808, 2.695959, 1, 0, 0.07843138, 1,
2.13942, 1.28973, 1.082942, 1, 0, 0.07058824, 1,
2.139873, -0.3766939, 3.586627, 1, 0, 0.06666667, 1,
2.147768, -1.623659, 1.130437, 1, 0, 0.05882353, 1,
2.175116, -1.572822, 1.818065, 1, 0, 0.05490196, 1,
2.291348, -0.2738464, 1.906744, 1, 0, 0.04705882, 1,
2.317312, 1.17943, 1.595916, 1, 0, 0.04313726, 1,
2.331648, 0.2803946, 2.008895, 1, 0, 0.03529412, 1,
2.58203, -1.106627, 5.010937, 1, 0, 0.03137255, 1,
2.593864, -0.5244238, 1.331686, 1, 0, 0.02352941, 1,
2.678591, -0.5668722, 2.994932, 1, 0, 0.01960784, 1,
2.97729, -0.4764729, 2.333577, 1, 0, 0.01176471, 1,
3.172551, 0.4655218, 0.8047202, 1, 0, 0.007843138, 1
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
0.06132603, -3.671143, -6.610301, 0, -0.5, 0.5, 0.5,
0.06132603, -3.671143, -6.610301, 1, -0.5, 0.5, 0.5,
0.06132603, -3.671143, -6.610301, 1, 1.5, 0.5, 0.5,
0.06132603, -3.671143, -6.610301, 0, 1.5, 0.5, 0.5
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
-4.104605, 0.2321626, -6.610301, 0, -0.5, 0.5, 0.5,
-4.104605, 0.2321626, -6.610301, 1, -0.5, 0.5, 0.5,
-4.104605, 0.2321626, -6.610301, 1, 1.5, 0.5, 0.5,
-4.104605, 0.2321626, -6.610301, 0, 1.5, 0.5, 0.5
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
-4.104605, -3.671143, 0.04247308, 0, -0.5, 0.5, 0.5,
-4.104605, -3.671143, 0.04247308, 1, -0.5, 0.5, 0.5,
-4.104605, -3.671143, 0.04247308, 1, 1.5, 0.5, 0.5,
-4.104605, -3.671143, 0.04247308, 0, 1.5, 0.5, 0.5
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
-3, -2.77038, -5.075045,
3, -2.77038, -5.075045,
-3, -2.77038, -5.075045,
-3, -2.920507, -5.330921,
-2, -2.77038, -5.075045,
-2, -2.920507, -5.330921,
-1, -2.77038, -5.075045,
-1, -2.920507, -5.330921,
0, -2.77038, -5.075045,
0, -2.920507, -5.330921,
1, -2.77038, -5.075045,
1, -2.920507, -5.330921,
2, -2.77038, -5.075045,
2, -2.920507, -5.330921,
3, -2.77038, -5.075045,
3, -2.920507, -5.330921
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
-3, -3.220762, -5.842673, 0, -0.5, 0.5, 0.5,
-3, -3.220762, -5.842673, 1, -0.5, 0.5, 0.5,
-3, -3.220762, -5.842673, 1, 1.5, 0.5, 0.5,
-3, -3.220762, -5.842673, 0, 1.5, 0.5, 0.5,
-2, -3.220762, -5.842673, 0, -0.5, 0.5, 0.5,
-2, -3.220762, -5.842673, 1, -0.5, 0.5, 0.5,
-2, -3.220762, -5.842673, 1, 1.5, 0.5, 0.5,
-2, -3.220762, -5.842673, 0, 1.5, 0.5, 0.5,
-1, -3.220762, -5.842673, 0, -0.5, 0.5, 0.5,
-1, -3.220762, -5.842673, 1, -0.5, 0.5, 0.5,
-1, -3.220762, -5.842673, 1, 1.5, 0.5, 0.5,
-1, -3.220762, -5.842673, 0, 1.5, 0.5, 0.5,
0, -3.220762, -5.842673, 0, -0.5, 0.5, 0.5,
0, -3.220762, -5.842673, 1, -0.5, 0.5, 0.5,
0, -3.220762, -5.842673, 1, 1.5, 0.5, 0.5,
0, -3.220762, -5.842673, 0, 1.5, 0.5, 0.5,
1, -3.220762, -5.842673, 0, -0.5, 0.5, 0.5,
1, -3.220762, -5.842673, 1, -0.5, 0.5, 0.5,
1, -3.220762, -5.842673, 1, 1.5, 0.5, 0.5,
1, -3.220762, -5.842673, 0, 1.5, 0.5, 0.5,
2, -3.220762, -5.842673, 0, -0.5, 0.5, 0.5,
2, -3.220762, -5.842673, 1, -0.5, 0.5, 0.5,
2, -3.220762, -5.842673, 1, 1.5, 0.5, 0.5,
2, -3.220762, -5.842673, 0, 1.5, 0.5, 0.5,
3, -3.220762, -5.842673, 0, -0.5, 0.5, 0.5,
3, -3.220762, -5.842673, 1, -0.5, 0.5, 0.5,
3, -3.220762, -5.842673, 1, 1.5, 0.5, 0.5,
3, -3.220762, -5.842673, 0, 1.5, 0.5, 0.5
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
-3.143236, -2, -5.075045,
-3.143236, 3, -5.075045,
-3.143236, -2, -5.075045,
-3.303464, -2, -5.330921,
-3.143236, -1, -5.075045,
-3.303464, -1, -5.330921,
-3.143236, 0, -5.075045,
-3.303464, 0, -5.330921,
-3.143236, 1, -5.075045,
-3.303464, 1, -5.330921,
-3.143236, 2, -5.075045,
-3.303464, 2, -5.330921,
-3.143236, 3, -5.075045,
-3.303464, 3, -5.330921
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
-3.62392, -2, -5.842673, 0, -0.5, 0.5, 0.5,
-3.62392, -2, -5.842673, 1, -0.5, 0.5, 0.5,
-3.62392, -2, -5.842673, 1, 1.5, 0.5, 0.5,
-3.62392, -2, -5.842673, 0, 1.5, 0.5, 0.5,
-3.62392, -1, -5.842673, 0, -0.5, 0.5, 0.5,
-3.62392, -1, -5.842673, 1, -0.5, 0.5, 0.5,
-3.62392, -1, -5.842673, 1, 1.5, 0.5, 0.5,
-3.62392, -1, -5.842673, 0, 1.5, 0.5, 0.5,
-3.62392, 0, -5.842673, 0, -0.5, 0.5, 0.5,
-3.62392, 0, -5.842673, 1, -0.5, 0.5, 0.5,
-3.62392, 0, -5.842673, 1, 1.5, 0.5, 0.5,
-3.62392, 0, -5.842673, 0, 1.5, 0.5, 0.5,
-3.62392, 1, -5.842673, 0, -0.5, 0.5, 0.5,
-3.62392, 1, -5.842673, 1, -0.5, 0.5, 0.5,
-3.62392, 1, -5.842673, 1, 1.5, 0.5, 0.5,
-3.62392, 1, -5.842673, 0, 1.5, 0.5, 0.5,
-3.62392, 2, -5.842673, 0, -0.5, 0.5, 0.5,
-3.62392, 2, -5.842673, 1, -0.5, 0.5, 0.5,
-3.62392, 2, -5.842673, 1, 1.5, 0.5, 0.5,
-3.62392, 2, -5.842673, 0, 1.5, 0.5, 0.5,
-3.62392, 3, -5.842673, 0, -0.5, 0.5, 0.5,
-3.62392, 3, -5.842673, 1, -0.5, 0.5, 0.5,
-3.62392, 3, -5.842673, 1, 1.5, 0.5, 0.5,
-3.62392, 3, -5.842673, 0, 1.5, 0.5, 0.5
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
-3.143236, -2.77038, -4,
-3.143236, -2.77038, 4,
-3.143236, -2.77038, -4,
-3.303464, -2.920507, -4,
-3.143236, -2.77038, -2,
-3.303464, -2.920507, -2,
-3.143236, -2.77038, 0,
-3.303464, -2.920507, 0,
-3.143236, -2.77038, 2,
-3.303464, -2.920507, 2,
-3.143236, -2.77038, 4,
-3.303464, -2.920507, 4
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
-3.62392, -3.220762, -4, 0, -0.5, 0.5, 0.5,
-3.62392, -3.220762, -4, 1, -0.5, 0.5, 0.5,
-3.62392, -3.220762, -4, 1, 1.5, 0.5, 0.5,
-3.62392, -3.220762, -4, 0, 1.5, 0.5, 0.5,
-3.62392, -3.220762, -2, 0, -0.5, 0.5, 0.5,
-3.62392, -3.220762, -2, 1, -0.5, 0.5, 0.5,
-3.62392, -3.220762, -2, 1, 1.5, 0.5, 0.5,
-3.62392, -3.220762, -2, 0, 1.5, 0.5, 0.5,
-3.62392, -3.220762, 0, 0, -0.5, 0.5, 0.5,
-3.62392, -3.220762, 0, 1, -0.5, 0.5, 0.5,
-3.62392, -3.220762, 0, 1, 1.5, 0.5, 0.5,
-3.62392, -3.220762, 0, 0, 1.5, 0.5, 0.5,
-3.62392, -3.220762, 2, 0, -0.5, 0.5, 0.5,
-3.62392, -3.220762, 2, 1, -0.5, 0.5, 0.5,
-3.62392, -3.220762, 2, 1, 1.5, 0.5, 0.5,
-3.62392, -3.220762, 2, 0, 1.5, 0.5, 0.5,
-3.62392, -3.220762, 4, 0, -0.5, 0.5, 0.5,
-3.62392, -3.220762, 4, 1, -0.5, 0.5, 0.5,
-3.62392, -3.220762, 4, 1, 1.5, 0.5, 0.5,
-3.62392, -3.220762, 4, 0, 1.5, 0.5, 0.5
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
-3.143236, -2.77038, -5.075045,
-3.143236, 3.234705, -5.075045,
-3.143236, -2.77038, 5.159991,
-3.143236, 3.234705, 5.159991,
-3.143236, -2.77038, -5.075045,
-3.143236, -2.77038, 5.159991,
-3.143236, 3.234705, -5.075045,
-3.143236, 3.234705, 5.159991,
-3.143236, -2.77038, -5.075045,
3.265888, -2.77038, -5.075045,
-3.143236, -2.77038, 5.159991,
3.265888, -2.77038, 5.159991,
-3.143236, 3.234705, -5.075045,
3.265888, 3.234705, -5.075045,
-3.143236, 3.234705, 5.159991,
3.265888, 3.234705, 5.159991,
3.265888, -2.77038, -5.075045,
3.265888, 3.234705, -5.075045,
3.265888, -2.77038, 5.159991,
3.265888, 3.234705, 5.159991,
3.265888, -2.77038, -5.075045,
3.265888, -2.77038, 5.159991,
3.265888, 3.234705, -5.075045,
3.265888, 3.234705, 5.159991
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
var radius = 7.201692;
var distance = 32.04114;
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
mvMatrix.translate( -0.06132603, -0.2321626, -0.04247308 );
mvMatrix.scale( 1.214926, 1.296669, 0.7607799 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.04114);
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
InChI_1S_C14H21NO4_c<-read.table("InChI_1S_C14H21NO4_c.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C14H21NO4_c$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C14H21NO4_c' not found
```

```r
y<-InChI_1S_C14H21NO4_c$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C14H21NO4_c' not found
```

```r
z<-InChI_1S_C14H21NO4_c$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C14H21NO4_c' not found
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
-3.049899, 1.598237, 0.3317547, 0, 0, 1, 1, 1,
-2.933117, 2.060634, -2.561356, 1, 0, 0, 1, 1,
-2.867153, 2.957378, -0.07486758, 1, 0, 0, 1, 1,
-2.813935, -0.05966907, -1.696143, 1, 0, 0, 1, 1,
-2.668107, -0.264219, -1.950236, 1, 0, 0, 1, 1,
-2.599761, 1.051574, -1.87297, 1, 0, 0, 1, 1,
-2.59643, 0.1015099, -1.816829, 0, 0, 0, 1, 1,
-2.516851, -0.076929, -2.768591, 0, 0, 0, 1, 1,
-2.426059, -1.344197, -0.5096493, 0, 0, 0, 1, 1,
-2.367343, 2.225453, -1.703512, 0, 0, 0, 1, 1,
-2.318747, -0.6146409, -3.050109, 0, 0, 0, 1, 1,
-2.280638, 0.3841844, -0.4675865, 0, 0, 0, 1, 1,
-2.262187, 0.0855781, -2.275706, 0, 0, 0, 1, 1,
-2.177811, -0.7814224, -2.687683, 1, 1, 1, 1, 1,
-2.137963, 1.062458, -2.052098, 1, 1, 1, 1, 1,
-2.0873, 0.246055, -1.415942, 1, 1, 1, 1, 1,
-2.072129, 0.9259685, -2.788423, 1, 1, 1, 1, 1,
-2.055301, 1.692776, -1.210137, 1, 1, 1, 1, 1,
-2.04819, 0.8547575, -2.325373, 1, 1, 1, 1, 1,
-2.043426, 0.2910693, -2.610405, 1, 1, 1, 1, 1,
-2.006775, 0.1167058, -1.173674, 1, 1, 1, 1, 1,
-1.992107, -2.194432, -3.244603, 1, 1, 1, 1, 1,
-1.990885, 1.600742, -0.05077254, 1, 1, 1, 1, 1,
-1.972607, -0.6885245, -2.251567, 1, 1, 1, 1, 1,
-1.969483, 0.6787414, -2.045736, 1, 1, 1, 1, 1,
-1.926054, -0.09340957, 0.9731044, 1, 1, 1, 1, 1,
-1.921953, -0.1760938, -1.868112, 1, 1, 1, 1, 1,
-1.899191, 0.3375601, -0.2833872, 1, 1, 1, 1, 1,
-1.890148, 1.43516, -2.473735, 0, 0, 1, 1, 1,
-1.888967, -0.2009519, -3.119178, 1, 0, 0, 1, 1,
-1.886137, -0.9979291, -1.793657, 1, 0, 0, 1, 1,
-1.873414, 1.085115, -1.237645, 1, 0, 0, 1, 1,
-1.866121, -1.39565, -3.847513, 1, 0, 0, 1, 1,
-1.864269, -1.067491, -1.65456, 1, 0, 0, 1, 1,
-1.858827, 0.4431031, -1.523253, 0, 0, 0, 1, 1,
-1.853499, 0.155052, -2.579712, 0, 0, 0, 1, 1,
-1.851347, 1.38742, -1.680033, 0, 0, 0, 1, 1,
-1.846788, -2.618642, -1.573526, 0, 0, 0, 1, 1,
-1.840104, -0.138306, -1.227486, 0, 0, 0, 1, 1,
-1.835548, 0.2793737, -1.626815, 0, 0, 0, 1, 1,
-1.820386, 1.054024, -1.109627, 0, 0, 0, 1, 1,
-1.818046, 0.9130938, -2.280534, 1, 1, 1, 1, 1,
-1.814142, 0.04211421, -1.35461, 1, 1, 1, 1, 1,
-1.765722, -0.2040771, -1.684253, 1, 1, 1, 1, 1,
-1.765459, -0.7539927, -2.492089, 1, 1, 1, 1, 1,
-1.762949, -0.2950275, -3.541022, 1, 1, 1, 1, 1,
-1.762798, -0.6864951, -2.190794, 1, 1, 1, 1, 1,
-1.76232, -0.4577187, -1.792403, 1, 1, 1, 1, 1,
-1.755888, -1.555349, -2.789021, 1, 1, 1, 1, 1,
-1.740975, -0.8826725, -3.652472, 1, 1, 1, 1, 1,
-1.725323, -1.670763, -1.096162, 1, 1, 1, 1, 1,
-1.686166, 0.9319834, -0.8945665, 1, 1, 1, 1, 1,
-1.681115, 0.05260719, -1.411573, 1, 1, 1, 1, 1,
-1.657928, 0.2433974, -0.529633, 1, 1, 1, 1, 1,
-1.654325, -0.1583777, -1.91064, 1, 1, 1, 1, 1,
-1.652387, 1.514957, -0.6541739, 1, 1, 1, 1, 1,
-1.646734, -0.05318008, -0.8848016, 0, 0, 1, 1, 1,
-1.644578, -0.4847603, -2.834304, 1, 0, 0, 1, 1,
-1.635107, 1.098216, 0.1773798, 1, 0, 0, 1, 1,
-1.628495, -1.071965, -0.7256045, 1, 0, 0, 1, 1,
-1.622146, -0.5125248, -2.80253, 1, 0, 0, 1, 1,
-1.6207, 0.8944851, -2.617614, 1, 0, 0, 1, 1,
-1.603581, 1.270901, -0.4755498, 0, 0, 0, 1, 1,
-1.589453, -1.46723, -3.509915, 0, 0, 0, 1, 1,
-1.587532, 0.3732764, -2.325726, 0, 0, 0, 1, 1,
-1.583828, -0.7231796, -4.360422, 0, 0, 0, 1, 1,
-1.575141, -0.6220554, -2.416366, 0, 0, 0, 1, 1,
-1.567062, -1.305074, -2.846276, 0, 0, 0, 1, 1,
-1.561292, 1.127396, -0.8083394, 0, 0, 0, 1, 1,
-1.557115, -0.4967212, -0.9144545, 1, 1, 1, 1, 1,
-1.545526, 0.2392698, -3.239062, 1, 1, 1, 1, 1,
-1.539199, 0.652572, -2.948947, 1, 1, 1, 1, 1,
-1.534279, 1.231039, -0.6728467, 1, 1, 1, 1, 1,
-1.529703, 0.6254374, 0.9508603, 1, 1, 1, 1, 1,
-1.520231, -0.4565905, -2.833353, 1, 1, 1, 1, 1,
-1.518629, -0.7206982, -1.628015, 1, 1, 1, 1, 1,
-1.495342, 1.352911, -1.310221, 1, 1, 1, 1, 1,
-1.494895, -0.7162482, -0.7825572, 1, 1, 1, 1, 1,
-1.491844, 0.3138264, -0.482327, 1, 1, 1, 1, 1,
-1.490552, -0.7860907, -0.382986, 1, 1, 1, 1, 1,
-1.488185, -0.5183755, -0.6971975, 1, 1, 1, 1, 1,
-1.483496, 0.2917284, -1.558555, 1, 1, 1, 1, 1,
-1.479126, 0.6327109, -2.459697, 1, 1, 1, 1, 1,
-1.45458, 0.9001653, 0.4642704, 1, 1, 1, 1, 1,
-1.454447, -1.036804, -2.60454, 0, 0, 1, 1, 1,
-1.447219, -0.8662658, -2.002854, 1, 0, 0, 1, 1,
-1.444817, 0.540015, -0.699459, 1, 0, 0, 1, 1,
-1.425137, 2.090371, 0.9880951, 1, 0, 0, 1, 1,
-1.398807, -1.220602, -3.199126, 1, 0, 0, 1, 1,
-1.393634, -1.658027, -1.96723, 1, 0, 0, 1, 1,
-1.377234, -0.7010676, -2.32818, 0, 0, 0, 1, 1,
-1.367899, -1.08269, -1.95592, 0, 0, 0, 1, 1,
-1.365527, -0.3679883, -1.386358, 0, 0, 0, 1, 1,
-1.365357, 0.9403875, -1.004657, 0, 0, 0, 1, 1,
-1.359838, 1.093211, -1.797277, 0, 0, 0, 1, 1,
-1.351052, 0.8920924, -2.318248, 0, 0, 0, 1, 1,
-1.349624, -0.1411754, -1.426859, 0, 0, 0, 1, 1,
-1.342394, 1.830547, -3.27791, 1, 1, 1, 1, 1,
-1.339663, 0.6270226, -1.915237, 1, 1, 1, 1, 1,
-1.322119, 1.0792, 0.4751756, 1, 1, 1, 1, 1,
-1.320136, -0.1977443, -0.3968398, 1, 1, 1, 1, 1,
-1.311134, -0.7968927, -2.662753, 1, 1, 1, 1, 1,
-1.308163, 2.053284, -1.299538, 1, 1, 1, 1, 1,
-1.296313, 1.706623, -0.8799772, 1, 1, 1, 1, 1,
-1.29404, -1.770705, -3.5037, 1, 1, 1, 1, 1,
-1.29286, 0.8849419, -1.330072, 1, 1, 1, 1, 1,
-1.285318, -0.009284593, -2.142726, 1, 1, 1, 1, 1,
-1.280512, 0.6441104, -1.832831, 1, 1, 1, 1, 1,
-1.27465, -0.1392629, -2.543386, 1, 1, 1, 1, 1,
-1.270668, 0.5404198, -1.678253, 1, 1, 1, 1, 1,
-1.252792, 0.789538, -1.686048, 1, 1, 1, 1, 1,
-1.252194, 0.4561355, -2.099619, 1, 1, 1, 1, 1,
-1.248386, 0.610728, -0.6063591, 0, 0, 1, 1, 1,
-1.247038, -0.02131478, 0.06416767, 1, 0, 0, 1, 1,
-1.240109, 1.395503, -0.1844637, 1, 0, 0, 1, 1,
-1.232438, 0.1244124, -1.892428, 1, 0, 0, 1, 1,
-1.227282, -1.533489, -3.282665, 1, 0, 0, 1, 1,
-1.220429, -0.4788017, -1.156917, 1, 0, 0, 1, 1,
-1.219545, -0.9268014, -1.593306, 0, 0, 0, 1, 1,
-1.216998, 1.252117, -1.190789, 0, 0, 0, 1, 1,
-1.214858, 0.06324992, -2.220284, 0, 0, 0, 1, 1,
-1.20826, 0.2002872, -1.231008, 0, 0, 0, 1, 1,
-1.207289, -0.8187255, -1.032634, 0, 0, 0, 1, 1,
-1.206083, 1.02185, -0.3742, 0, 0, 0, 1, 1,
-1.205115, -0.5386128, -2.152456, 0, 0, 0, 1, 1,
-1.197875, 2.382905, 0.3845697, 1, 1, 1, 1, 1,
-1.195484, 1.087098, -0.5892554, 1, 1, 1, 1, 1,
-1.195327, 0.2453997, -0.695213, 1, 1, 1, 1, 1,
-1.194623, 0.5379819, -1.369951, 1, 1, 1, 1, 1,
-1.19343, -0.9258611, -0.5870619, 1, 1, 1, 1, 1,
-1.191873, 0.4682929, -0.5495046, 1, 1, 1, 1, 1,
-1.191576, -0.02059208, -1.446481, 1, 1, 1, 1, 1,
-1.190556, -0.8289722, -4.051449, 1, 1, 1, 1, 1,
-1.189761, -1.628828, -3.654815, 1, 1, 1, 1, 1,
-1.18901, 0.5100072, 0.5173416, 1, 1, 1, 1, 1,
-1.181346, -0.5123684, -1.657923, 1, 1, 1, 1, 1,
-1.178157, 0.9509073, -1.995833, 1, 1, 1, 1, 1,
-1.172715, -1.236096, -2.171194, 1, 1, 1, 1, 1,
-1.158153, -1.141115, -2.82436, 1, 1, 1, 1, 1,
-1.158045, -0.2993613, -1.412848, 1, 1, 1, 1, 1,
-1.146448, 1.211637, -0.4323593, 0, 0, 1, 1, 1,
-1.140399, -0.09445355, -2.153711, 1, 0, 0, 1, 1,
-1.140369, -0.4428357, -1.164413, 1, 0, 0, 1, 1,
-1.138976, 1.680922, 0.8974558, 1, 0, 0, 1, 1,
-1.135229, 0.06609262, 1.266452, 1, 0, 0, 1, 1,
-1.130095, -0.1260738, -2.607729, 1, 0, 0, 1, 1,
-1.127714, 0.3975261, -0.5818599, 0, 0, 0, 1, 1,
-1.125777, 0.2381908, -0.4188239, 0, 0, 0, 1, 1,
-1.115307, 0.05948087, -1.446158, 0, 0, 0, 1, 1,
-1.100505, -0.9001933, -2.341961, 0, 0, 0, 1, 1,
-1.091792, -0.01460132, -3.584785, 0, 0, 0, 1, 1,
-1.087178, 0.3270606, -2.917812, 0, 0, 0, 1, 1,
-1.079689, -2.536637, -2.730493, 0, 0, 0, 1, 1,
-1.077337, 1.656777, -0.9907223, 1, 1, 1, 1, 1,
-1.07699, 0.3215606, -0.9079232, 1, 1, 1, 1, 1,
-1.075822, -0.3314395, -2.190108, 1, 1, 1, 1, 1,
-1.068647, 0.5595137, -0.6021158, 1, 1, 1, 1, 1,
-1.043628, 0.644532, -1.129923, 1, 1, 1, 1, 1,
-1.04212, 0.1356665, -2.432285, 1, 1, 1, 1, 1,
-1.039248, 1.186313, 0.8210991, 1, 1, 1, 1, 1,
-1.035407, 0.110211, -1.726405, 1, 1, 1, 1, 1,
-1.033892, 0.4569076, -1.240328, 1, 1, 1, 1, 1,
-1.03202, 0.9837937, -0.8884335, 1, 1, 1, 1, 1,
-1.028461, -0.1106016, -0.7560984, 1, 1, 1, 1, 1,
-1.026056, 0.2115776, -1.645715, 1, 1, 1, 1, 1,
-1.02575, 0.2070036, -1.671247, 1, 1, 1, 1, 1,
-1.021179, 0.6802852, -0.07539473, 1, 1, 1, 1, 1,
-1.020802, 0.6819941, -2.236699, 1, 1, 1, 1, 1,
-1.018786, 1.191004, 0.991026, 0, 0, 1, 1, 1,
-1.014251, 0.1468664, -3.002771, 1, 0, 0, 1, 1,
-1.012277, -1.008392, -3.553933, 1, 0, 0, 1, 1,
-1.011535, 0.2636141, -1.047794, 1, 0, 0, 1, 1,
-1.009166, 1.151043, -0.5339355, 1, 0, 0, 1, 1,
-1.00892, -0.365774, -3.160376, 1, 0, 0, 1, 1,
-1.00166, -0.2110766, -0.4438051, 0, 0, 0, 1, 1,
-1.000978, -0.8518813, -2.767432, 0, 0, 0, 1, 1,
-0.9985934, 1.003147, -0.6442828, 0, 0, 0, 1, 1,
-0.9942731, 1.091052, -1.807151, 0, 0, 0, 1, 1,
-0.9941061, 0.4414669, 1.354906, 0, 0, 0, 1, 1,
-0.9868596, 0.4396003, -1.441619, 0, 0, 0, 1, 1,
-0.9823939, -1.11711, -3.64422, 0, 0, 0, 1, 1,
-0.9751191, -0.1831735, -1.714305, 1, 1, 1, 1, 1,
-0.9748708, 1.445558, 1.002679, 1, 1, 1, 1, 1,
-0.9620222, 0.1945241, -0.002543998, 1, 1, 1, 1, 1,
-0.9562981, -0.2839529, -2.223805, 1, 1, 1, 1, 1,
-0.9547363, -0.6298443, -2.395557, 1, 1, 1, 1, 1,
-0.9513701, -0.3464158, -2.684124, 1, 1, 1, 1, 1,
-0.9446086, -0.3124609, -1.193659, 1, 1, 1, 1, 1,
-0.9443596, -1.339772, -2.05432, 1, 1, 1, 1, 1,
-0.9374198, 0.8401232, -1.050061, 1, 1, 1, 1, 1,
-0.9147817, 0.9866966, -1.161343, 1, 1, 1, 1, 1,
-0.9129708, 0.5273371, -0.5334747, 1, 1, 1, 1, 1,
-0.9125653, -0.037301, -0.07180674, 1, 1, 1, 1, 1,
-0.9077054, 1.117986, -2.294541, 1, 1, 1, 1, 1,
-0.8992909, 0.95616, 0.3071265, 1, 1, 1, 1, 1,
-0.8957243, 0.4345319, -1.052407, 1, 1, 1, 1, 1,
-0.8950644, 0.3062619, -1.454993, 0, 0, 1, 1, 1,
-0.8946142, -0.4817364, -4.265067, 1, 0, 0, 1, 1,
-0.8922779, 1.172071, -0.2752256, 1, 0, 0, 1, 1,
-0.8892723, 0.2619956, -0.7999671, 1, 0, 0, 1, 1,
-0.8870853, -0.01374527, -2.10216, 1, 0, 0, 1, 1,
-0.8867574, -0.04557617, 1.13524, 1, 0, 0, 1, 1,
-0.8850908, 0.04277402, -1.461046, 0, 0, 0, 1, 1,
-0.8849144, 0.4519234, 0.1692911, 0, 0, 0, 1, 1,
-0.8781661, -0.8935132, -1.860687, 0, 0, 0, 1, 1,
-0.8780669, -0.09804979, -3.032004, 0, 0, 0, 1, 1,
-0.8752031, 1.606511, 0.8047123, 0, 0, 0, 1, 1,
-0.8750629, 0.37804, 0.3968625, 0, 0, 0, 1, 1,
-0.8677224, 1.388639, -0.9124934, 0, 0, 0, 1, 1,
-0.8634343, 0.05809739, -2.111632, 1, 1, 1, 1, 1,
-0.8632118, 0.490767, -1.010823, 1, 1, 1, 1, 1,
-0.862584, -0.5920539, -2.594959, 1, 1, 1, 1, 1,
-0.8561795, -0.5119589, -1.922617, 1, 1, 1, 1, 1,
-0.8445463, 0.5626432, -1.118038, 1, 1, 1, 1, 1,
-0.8436569, -0.1556001, -0.1931537, 1, 1, 1, 1, 1,
-0.8371406, 0.2302911, -1.472139, 1, 1, 1, 1, 1,
-0.8359851, -1.002323, -1.844791, 1, 1, 1, 1, 1,
-0.8310837, 0.2621637, -1.893594, 1, 1, 1, 1, 1,
-0.8169076, 0.4453573, -1.149914, 1, 1, 1, 1, 1,
-0.8146526, 0.125697, -2.524027, 1, 1, 1, 1, 1,
-0.8063269, 0.8076895, 0.05978126, 1, 1, 1, 1, 1,
-0.8033182, 1.560884, -1.258974, 1, 1, 1, 1, 1,
-0.8014182, -0.3786439, -1.360828, 1, 1, 1, 1, 1,
-0.7996073, -0.7656398, -2.463937, 1, 1, 1, 1, 1,
-0.7978219, 0.2485132, -0.3361279, 0, 0, 1, 1, 1,
-0.7969061, -1.76969, -3.967952, 1, 0, 0, 1, 1,
-0.7889149, -0.5965744, -2.800325, 1, 0, 0, 1, 1,
-0.7877374, 0.0796506, -1.265061, 1, 0, 0, 1, 1,
-0.779086, -0.9589843, -3.765881, 1, 0, 0, 1, 1,
-0.7770876, 1.031065, -0.1760248, 1, 0, 0, 1, 1,
-0.7741952, 0.4571785, -1.028433, 0, 0, 0, 1, 1,
-0.7734974, 0.1231749, -2.935336, 0, 0, 0, 1, 1,
-0.7516245, 0.3651887, -0.3369474, 0, 0, 0, 1, 1,
-0.7503808, 0.5363865, -0.1385964, 0, 0, 0, 1, 1,
-0.7493873, -1.983949, -2.183808, 0, 0, 0, 1, 1,
-0.7447253, 0.4907781, -1.942234, 0, 0, 0, 1, 1,
-0.7429073, 0.379271, -2.788651, 0, 0, 0, 1, 1,
-0.7424196, 0.5038077, -0.9833764, 1, 1, 1, 1, 1,
-0.7416044, 0.9317758, -1.114622, 1, 1, 1, 1, 1,
-0.7407381, -0.1727439, -1.205651, 1, 1, 1, 1, 1,
-0.7398046, -0.9910094, -1.680701, 1, 1, 1, 1, 1,
-0.7396978, -2.112107, -3.833397, 1, 1, 1, 1, 1,
-0.7381393, 0.4992096, -0.335979, 1, 1, 1, 1, 1,
-0.7319407, -0.9868283, -0.9935828, 1, 1, 1, 1, 1,
-0.7316121, -1.047915, -3.036736, 1, 1, 1, 1, 1,
-0.729554, -0.884312, -2.804276, 1, 1, 1, 1, 1,
-0.7206342, -1.005648, -2.365047, 1, 1, 1, 1, 1,
-0.7203215, -0.01221943, -1.92178, 1, 1, 1, 1, 1,
-0.7051505, -1.860673, -3.832002, 1, 1, 1, 1, 1,
-0.7032606, 1.399428, 0.5473291, 1, 1, 1, 1, 1,
-0.6994952, 0.09638813, -3.277985, 1, 1, 1, 1, 1,
-0.6905711, -1.580084, -1.69118, 1, 1, 1, 1, 1,
-0.6904994, -0.5940046, -1.571599, 0, 0, 1, 1, 1,
-0.6899839, -1.21077, -1.614068, 1, 0, 0, 1, 1,
-0.689136, 1.459193, -0.4694016, 1, 0, 0, 1, 1,
-0.6854681, 1.137175, -0.1348163, 1, 0, 0, 1, 1,
-0.6798908, -0.3999584, -1.081157, 1, 0, 0, 1, 1,
-0.6760812, -1.154661, -2.091626, 1, 0, 0, 1, 1,
-0.6755377, 0.3932717, -1.699782, 0, 0, 0, 1, 1,
-0.6631512, -0.9322498, -2.53686, 0, 0, 0, 1, 1,
-0.6627874, -0.5838987, -1.225371, 0, 0, 0, 1, 1,
-0.6627473, -0.8334784, -2.409868, 0, 0, 0, 1, 1,
-0.659865, -0.5090142, -1.677083, 0, 0, 0, 1, 1,
-0.6563963, 0.9651932, -1.949298, 0, 0, 0, 1, 1,
-0.6533515, 1.017653, -1.981868, 0, 0, 0, 1, 1,
-0.652442, -0.8774505, -2.595064, 1, 1, 1, 1, 1,
-0.6523947, -0.183944, 0.3141874, 1, 1, 1, 1, 1,
-0.6522214, -1.016007, -1.997305, 1, 1, 1, 1, 1,
-0.6502788, -0.1219649, -4.20126, 1, 1, 1, 1, 1,
-0.6435069, 1.015705, -0.04853496, 1, 1, 1, 1, 1,
-0.6411559, 0.3598617, -0.2901569, 1, 1, 1, 1, 1,
-0.6386129, 1.609442, -0.4014025, 1, 1, 1, 1, 1,
-0.629158, 1.31867, 0.3765557, 1, 1, 1, 1, 1,
-0.6277592, 2.206942, 0.7332098, 1, 1, 1, 1, 1,
-0.626234, 0.5053976, -0.4857955, 1, 1, 1, 1, 1,
-0.6253047, 0.6204957, 0.2210716, 1, 1, 1, 1, 1,
-0.6227149, -0.2513359, -2.859995, 1, 1, 1, 1, 1,
-0.6104855, 1.690423, -0.6384775, 1, 1, 1, 1, 1,
-0.6091991, -0.4423729, -1.624774, 1, 1, 1, 1, 1,
-0.6011896, -0.2187506, -3.56218, 1, 1, 1, 1, 1,
-0.5999627, -0.2145761, -1.729973, 0, 0, 1, 1, 1,
-0.5972977, 1.091864, -0.455226, 1, 0, 0, 1, 1,
-0.5926664, 1.739911, -0.1937585, 1, 0, 0, 1, 1,
-0.5904216, -0.2413039, -2.331328, 1, 0, 0, 1, 1,
-0.5881414, -0.9110311, -2.453487, 1, 0, 0, 1, 1,
-0.5815998, -0.1541555, -2.545406, 1, 0, 0, 1, 1,
-0.5774248, 0.7102455, -0.07471509, 0, 0, 0, 1, 1,
-0.5725969, -1.241386, -3.207429, 0, 0, 0, 1, 1,
-0.5668745, -1.284203, -2.095488, 0, 0, 0, 1, 1,
-0.5637266, 0.2828139, -1.048804, 0, 0, 0, 1, 1,
-0.5603217, -1.702943, -3.011488, 0, 0, 0, 1, 1,
-0.560094, 0.2540964, -2.644515, 0, 0, 0, 1, 1,
-0.5600129, -1.022244, -2.569404, 0, 0, 0, 1, 1,
-0.557147, 0.705836, -1.575599, 1, 1, 1, 1, 1,
-0.5531154, 3.147253, 0.5931827, 1, 1, 1, 1, 1,
-0.5441779, 0.08461408, -2.348713, 1, 1, 1, 1, 1,
-0.543167, 0.3809827, -0.8958053, 1, 1, 1, 1, 1,
-0.5367499, 0.07211947, -1.070176, 1, 1, 1, 1, 1,
-0.5352985, -1.165341, -2.161387, 1, 1, 1, 1, 1,
-0.5346442, 1.875636, 0.3721981, 1, 1, 1, 1, 1,
-0.5325724, -0.6020905, -3.05444, 1, 1, 1, 1, 1,
-0.5316857, 0.3392687, 0.567726, 1, 1, 1, 1, 1,
-0.5293815, -0.7971027, -4.925991, 1, 1, 1, 1, 1,
-0.5280501, 0.396837, -0.933414, 1, 1, 1, 1, 1,
-0.5256761, -0.3633562, -2.841089, 1, 1, 1, 1, 1,
-0.5255694, 0.6232847, -0.1055329, 1, 1, 1, 1, 1,
-0.5252547, -2.059014, -4.39581, 1, 1, 1, 1, 1,
-0.5252146, -0.1480935, -1.159271, 1, 1, 1, 1, 1,
-0.5242094, 0.1796607, -1.76368, 0, 0, 1, 1, 1,
-0.524152, -0.2353354, -3.375747, 1, 0, 0, 1, 1,
-0.5220707, 0.3591923, -0.6962671, 1, 0, 0, 1, 1,
-0.5208452, 1.427681, -1.860868, 1, 0, 0, 1, 1,
-0.5201211, 1.017283, -1.934766, 1, 0, 0, 1, 1,
-0.5198586, 0.09968375, -1.695087, 1, 0, 0, 1, 1,
-0.5162479, 2.128239, -1.649931, 0, 0, 0, 1, 1,
-0.5092794, 0.4205117, -2.426116, 0, 0, 0, 1, 1,
-0.5054856, 0.1026448, -3.076399, 0, 0, 0, 1, 1,
-0.5007178, 0.6072838, -0.06474598, 0, 0, 0, 1, 1,
-0.4978071, 0.2768417, -1.196032, 0, 0, 0, 1, 1,
-0.4955846, 1.891824, 1.018376, 0, 0, 0, 1, 1,
-0.4939405, 0.272823, -1.02224, 0, 0, 0, 1, 1,
-0.4879766, 0.2533216, -1.882961, 1, 1, 1, 1, 1,
-0.4840843, -0.7653716, -4.293743, 1, 1, 1, 1, 1,
-0.4812081, 0.2522399, -0.9480956, 1, 1, 1, 1, 1,
-0.4789484, 0.9745126, -0.5433168, 1, 1, 1, 1, 1,
-0.4777908, 1.38355, -1.722747, 1, 1, 1, 1, 1,
-0.4694835, -1.3149, -2.941109, 1, 1, 1, 1, 1,
-0.46764, 0.08546446, -2.695879, 1, 1, 1, 1, 1,
-0.4673752, -0.2914348, -1.45588, 1, 1, 1, 1, 1,
-0.4672025, -1.027412, -1.856557, 1, 1, 1, 1, 1,
-0.4659511, -0.1245171, -2.777205, 1, 1, 1, 1, 1,
-0.4625872, -0.1349765, -2.018095, 1, 1, 1, 1, 1,
-0.4556154, -1.692699, -0.6228657, 1, 1, 1, 1, 1,
-0.4534982, -0.3176468, -2.562173, 1, 1, 1, 1, 1,
-0.4530255, 1.975969, 0.2786331, 1, 1, 1, 1, 1,
-0.4522081, 0.8910995, -0.9182112, 1, 1, 1, 1, 1,
-0.4519817, 2.612447, -0.3802526, 0, 0, 1, 1, 1,
-0.4492765, 0.02613504, -2.756744, 1, 0, 0, 1, 1,
-0.4474555, 1.044153, -0.2394637, 1, 0, 0, 1, 1,
-0.4463929, 0.9242801, -1.505231, 1, 0, 0, 1, 1,
-0.4425457, -0.5570716, -2.461583, 1, 0, 0, 1, 1,
-0.4358949, -0.1456893, -1.660819, 1, 0, 0, 1, 1,
-0.4350313, -1.262463, -3.633699, 0, 0, 0, 1, 1,
-0.4342564, 2.43195, -0.7937977, 0, 0, 0, 1, 1,
-0.4335206, 0.0346221, -2.919752, 0, 0, 0, 1, 1,
-0.4291259, 0.5765141, -0.8516864, 0, 0, 0, 1, 1,
-0.4274783, 0.7238817, -1.061532, 0, 0, 0, 1, 1,
-0.4240991, 1.338918, 1.079825, 0, 0, 0, 1, 1,
-0.4210486, -1.442098, -1.625857, 0, 0, 0, 1, 1,
-0.4206168, 0.2213971, -1.669731, 1, 1, 1, 1, 1,
-0.4166937, -0.9172723, -1.514266, 1, 1, 1, 1, 1,
-0.4146454, 1.253918, 0.3235088, 1, 1, 1, 1, 1,
-0.4133012, -0.9215347, -3.682192, 1, 1, 1, 1, 1,
-0.410505, 1.505938, -0.5652581, 1, 1, 1, 1, 1,
-0.4099955, 1.794947, 0.4714215, 1, 1, 1, 1, 1,
-0.4092441, -0.0927277, -2.523731, 1, 1, 1, 1, 1,
-0.4088098, -0.4354694, -2.159855, 1, 1, 1, 1, 1,
-0.4080736, 0.9236065, -1.036628, 1, 1, 1, 1, 1,
-0.4066374, -1.276547, -2.374304, 1, 1, 1, 1, 1,
-0.4042029, -2.227067, -3.538618, 1, 1, 1, 1, 1,
-0.4037275, 0.450662, -1.365951, 1, 1, 1, 1, 1,
-0.4033802, 0.8477105, 0.04832797, 1, 1, 1, 1, 1,
-0.3950742, 0.08270414, -1.45723, 1, 1, 1, 1, 1,
-0.3934572, 0.3566282, -0.2039112, 1, 1, 1, 1, 1,
-0.387067, 1.421165, -0.3749947, 0, 0, 1, 1, 1,
-0.3822686, -0.01065616, -0.2374252, 1, 0, 0, 1, 1,
-0.3806634, 0.4172927, -0.650727, 1, 0, 0, 1, 1,
-0.3794946, 1.044462, -1.132788, 1, 0, 0, 1, 1,
-0.3743686, -1.434053, -3.978435, 1, 0, 0, 1, 1,
-0.3692395, -0.6733957, -3.252423, 1, 0, 0, 1, 1,
-0.3576611, 0.07501087, -1.486726, 0, 0, 0, 1, 1,
-0.3561966, 0.8239916, -0.5471888, 0, 0, 0, 1, 1,
-0.3543602, 0.3186021, 0.1210985, 0, 0, 0, 1, 1,
-0.3483405, 0.7458068, -2.063391, 0, 0, 0, 1, 1,
-0.3472556, 0.2578957, -0.5244794, 0, 0, 0, 1, 1,
-0.3465509, 0.8213652, -0.7809126, 0, 0, 0, 1, 1,
-0.3460958, -1.456554, -2.695876, 0, 0, 0, 1, 1,
-0.3441727, 1.132212, -0.4638968, 1, 1, 1, 1, 1,
-0.3405518, 2.114404, -0.6973699, 1, 1, 1, 1, 1,
-0.3308689, 1.418414, 0.4024501, 1, 1, 1, 1, 1,
-0.3307458, 0.6865439, -0.3947733, 1, 1, 1, 1, 1,
-0.3291401, 0.5103806, -1.943774, 1, 1, 1, 1, 1,
-0.3277306, -1.033016, -3.465445, 1, 1, 1, 1, 1,
-0.3224422, 0.9536904, -0.7363778, 1, 1, 1, 1, 1,
-0.3183236, -0.835967, -1.708295, 1, 1, 1, 1, 1,
-0.3134671, -0.06206573, -2.677847, 1, 1, 1, 1, 1,
-0.3129033, 0.3582712, 1.844683, 1, 1, 1, 1, 1,
-0.3113312, -0.4110407, -1.873181, 1, 1, 1, 1, 1,
-0.3112767, 1.728481, -1.048213, 1, 1, 1, 1, 1,
-0.3083686, -0.6159503, -2.144044, 1, 1, 1, 1, 1,
-0.3075911, 0.4318839, -2.181962, 1, 1, 1, 1, 1,
-0.3068765, -1.415386, -3.037095, 1, 1, 1, 1, 1,
-0.3057934, 0.7315174, -2.20541, 0, 0, 1, 1, 1,
-0.3054965, 0.2609435, -0.9805889, 1, 0, 0, 1, 1,
-0.3041232, -0.1513125, -2.693108, 1, 0, 0, 1, 1,
-0.298772, -0.1907818, -1.583379, 1, 0, 0, 1, 1,
-0.2952109, -0.1457152, -3.235529, 1, 0, 0, 1, 1,
-0.2938319, -1.267542, -1.92173, 1, 0, 0, 1, 1,
-0.2937849, -0.53561, -2.475633, 0, 0, 0, 1, 1,
-0.2922705, -0.07092295, -2.310164, 0, 0, 0, 1, 1,
-0.2911228, 0.2255304, -0.4137685, 0, 0, 0, 1, 1,
-0.2879241, 1.247846, 1.072924, 0, 0, 0, 1, 1,
-0.2864528, -0.1934092, -1.437171, 0, 0, 0, 1, 1,
-0.2840042, -0.3584478, -2.88026, 0, 0, 0, 1, 1,
-0.2819677, 0.4597915, -0.3876579, 0, 0, 0, 1, 1,
-0.2730579, -0.9751852, -1.876791, 1, 1, 1, 1, 1,
-0.2686924, -1.300077, -2.400111, 1, 1, 1, 1, 1,
-0.2675723, 0.7477915, 0.6590069, 1, 1, 1, 1, 1,
-0.2659938, 0.7372003, 1.036627, 1, 1, 1, 1, 1,
-0.2647873, 2.29737, -1.136207, 1, 1, 1, 1, 1,
-0.264586, 0.833779, -0.1965914, 1, 1, 1, 1, 1,
-0.2636451, -0.1420008, -2.535146, 1, 1, 1, 1, 1,
-0.2452534, 1.390453, -0.3601828, 1, 1, 1, 1, 1,
-0.2425092, -1.959363, -4.904153, 1, 1, 1, 1, 1,
-0.2412721, -0.4813413, -3.053054, 1, 1, 1, 1, 1,
-0.2408907, 0.03499692, 1.407722, 1, 1, 1, 1, 1,
-0.2350509, 1.879969, -0.5602407, 1, 1, 1, 1, 1,
-0.2349603, -1.053924, -2.152055, 1, 1, 1, 1, 1,
-0.2328955, 0.9793859, 0.9251736, 1, 1, 1, 1, 1,
-0.2327346, -1.00845, -2.423462, 1, 1, 1, 1, 1,
-0.2311844, -0.04331152, -0.6151924, 0, 0, 1, 1, 1,
-0.2266496, -0.7059128, -1.187972, 1, 0, 0, 1, 1,
-0.2264132, -0.8406948, -2.535298, 1, 0, 0, 1, 1,
-0.2256835, 0.3300867, -1.172333, 1, 0, 0, 1, 1,
-0.2231064, -0.5840787, -3.043373, 1, 0, 0, 1, 1,
-0.2229887, -0.4261765, -2.878406, 1, 0, 0, 1, 1,
-0.2203089, 1.408827, 0.4289255, 0, 0, 0, 1, 1,
-0.2194138, 0.7643419, -0.3383259, 0, 0, 0, 1, 1,
-0.218893, 1.119992, -1.502341, 0, 0, 0, 1, 1,
-0.2155792, 0.265048, -2.125212, 0, 0, 0, 1, 1,
-0.212767, -1.889559, -3.790674, 0, 0, 0, 1, 1,
-0.2081965, 2.681635, -1.090992, 0, 0, 0, 1, 1,
-0.2045926, -0.5229575, -0.4122532, 0, 0, 0, 1, 1,
-0.2019659, -1.570371, -2.826145, 1, 1, 1, 1, 1,
-0.1943505, 1.30319, -0.9014711, 1, 1, 1, 1, 1,
-0.1938197, 1.68867, 0.5969065, 1, 1, 1, 1, 1,
-0.1897876, -0.4755173, -3.036932, 1, 1, 1, 1, 1,
-0.1864912, 0.2379981, -0.1903362, 1, 1, 1, 1, 1,
-0.1836882, 1.138633, 0.06053007, 1, 1, 1, 1, 1,
-0.1831511, 1.318866, 0.3318914, 1, 1, 1, 1, 1,
-0.1740025, 0.8636494, 0.5060845, 1, 1, 1, 1, 1,
-0.1739527, -1.212408, -2.25748, 1, 1, 1, 1, 1,
-0.1720871, -0.3964583, -3.335312, 1, 1, 1, 1, 1,
-0.1719628, -0.248628, -3.016829, 1, 1, 1, 1, 1,
-0.1709262, 0.5031765, 0.5451855, 1, 1, 1, 1, 1,
-0.1693515, -0.569107, -3.173751, 1, 1, 1, 1, 1,
-0.1643525, 0.02203973, -0.4220702, 1, 1, 1, 1, 1,
-0.1616895, 0.08549252, -1.025264, 1, 1, 1, 1, 1,
-0.1569181, 2.567205, 0.2241009, 0, 0, 1, 1, 1,
-0.1568234, 0.5146181, -0.6965451, 1, 0, 0, 1, 1,
-0.1549917, -0.7264016, -1.157585, 1, 0, 0, 1, 1,
-0.1504131, -0.5899529, -3.930194, 1, 0, 0, 1, 1,
-0.1499212, -0.05257405, -0.9584681, 1, 0, 0, 1, 1,
-0.1486763, 0.7426205, -0.6658264, 1, 0, 0, 1, 1,
-0.1481068, -1.265125, -1.437474, 0, 0, 0, 1, 1,
-0.1446296, -1.349684, -3.82634, 0, 0, 0, 1, 1,
-0.1444112, 0.2672818, -1.277649, 0, 0, 0, 1, 1,
-0.1437074, 0.9374781, -0.0904021, 0, 0, 0, 1, 1,
-0.1424073, 1.465866, 0.6679876, 0, 0, 0, 1, 1,
-0.1412882, 1.064117, -1.693909, 0, 0, 0, 1, 1,
-0.1390873, -1.443318, -3.778031, 0, 0, 0, 1, 1,
-0.1366749, 1.867528, -0.01195452, 1, 1, 1, 1, 1,
-0.1352778, 0.5337517, 0.495292, 1, 1, 1, 1, 1,
-0.1299067, 0.138483, -1.101289, 1, 1, 1, 1, 1,
-0.1250841, 0.5314045, -0.4729674, 1, 1, 1, 1, 1,
-0.118354, -0.1162447, -3.579888, 1, 1, 1, 1, 1,
-0.1168431, 2.067396, 1.430184, 1, 1, 1, 1, 1,
-0.1131012, -0.5060176, -2.000158, 1, 1, 1, 1, 1,
-0.1094132, -0.7718396, -3.231181, 1, 1, 1, 1, 1,
-0.1065648, 1.655686, -1.214603, 1, 1, 1, 1, 1,
-0.1055367, 0.4842978, 0.1965874, 1, 1, 1, 1, 1,
-0.1011215, -0.4968726, -2.396583, 1, 1, 1, 1, 1,
-0.09723955, 0.7652327, 1.118696, 1, 1, 1, 1, 1,
-0.08483139, -0.3395905, -1.658604, 1, 1, 1, 1, 1,
-0.08429072, 0.05315162, -1.201817, 1, 1, 1, 1, 1,
-0.08242057, -0.6447773, -2.993621, 1, 1, 1, 1, 1,
-0.07946255, 0.2036094, 0.7527507, 0, 0, 1, 1, 1,
-0.07844979, -0.04512181, -1.328941, 1, 0, 0, 1, 1,
-0.07755104, -0.1409684, -2.838895, 1, 0, 0, 1, 1,
-0.07291359, 0.1731683, 1.070545, 1, 0, 0, 1, 1,
-0.07222671, -0.4117723, -4.098495, 1, 0, 0, 1, 1,
-0.07182852, -1.723283, -2.938933, 1, 0, 0, 1, 1,
-0.06977598, 2.195965, 0.0656772, 0, 0, 0, 1, 1,
-0.06767221, 0.921096, -1.165829, 0, 0, 0, 1, 1,
-0.06573269, -2.191354, -2.311711, 0, 0, 0, 1, 1,
-0.06345417, 0.128019, 0.4437264, 0, 0, 0, 1, 1,
-0.05693842, -0.1969414, -4.002387, 0, 0, 0, 1, 1,
-0.05595886, -0.3482845, -4.364662, 0, 0, 0, 1, 1,
-0.05584758, -0.9900771, -1.926196, 0, 0, 0, 1, 1,
-0.05026004, 1.143826, -1.744577, 1, 1, 1, 1, 1,
-0.04938242, -1.351456, -2.060793, 1, 1, 1, 1, 1,
-0.04916766, 0.6737834, -0.05782127, 1, 1, 1, 1, 1,
-0.04860353, 0.06153695, -1.060058, 1, 1, 1, 1, 1,
-0.04846363, -2.128517, -3.14867, 1, 1, 1, 1, 1,
-0.04817642, 0.2197475, -2.048537, 1, 1, 1, 1, 1,
-0.04717301, -0.9457824, -3.28966, 1, 1, 1, 1, 1,
-0.04336636, 0.1224376, -0.6637961, 1, 1, 1, 1, 1,
-0.03548663, 1.708812, -0.8007262, 1, 1, 1, 1, 1,
-0.03539174, -0.01899362, -1.994148, 1, 1, 1, 1, 1,
-0.0340715, 0.3249175, -0.04106044, 1, 1, 1, 1, 1,
-0.0297604, 0.137259, 0.3376074, 1, 1, 1, 1, 1,
-0.02750742, -1.828702, -2.411979, 1, 1, 1, 1, 1,
-0.02695587, -0.3655987, -3.905075, 1, 1, 1, 1, 1,
-0.02478399, 1.569676, 0.1656772, 1, 1, 1, 1, 1,
-0.0244693, 0.7802002, -1.513578, 0, 0, 1, 1, 1,
-0.02313082, 0.2760596, 0.4626453, 1, 0, 0, 1, 1,
-0.02041054, -0.8481941, -3.630964, 1, 0, 0, 1, 1,
-0.01860368, 0.7417759, -0.176281, 1, 0, 0, 1, 1,
-0.01709759, 1.036677, 1.729696, 1, 0, 0, 1, 1,
-0.01497845, -0.6548843, -3.126885, 1, 0, 0, 1, 1,
-0.01071069, -0.5816357, -2.883343, 0, 0, 0, 1, 1,
-0.008085112, -0.7683803, -1.952241, 0, 0, 0, 1, 1,
-0.006972849, 0.1546204, 2.653805, 0, 0, 0, 1, 1,
-0.003453095, -1.036789, -4.893792, 0, 0, 0, 1, 1,
-0.003145977, -1.733038, -3.565024, 0, 0, 0, 1, 1,
-0.003026712, 1.211171, 0.4104804, 0, 0, 0, 1, 1,
-0.000651468, -0.06385331, -2.430634, 0, 0, 0, 1, 1,
0.000414744, -1.210627, 3.385605, 1, 1, 1, 1, 1,
0.003364363, 0.3186281, 1.070776, 1, 1, 1, 1, 1,
0.005083241, 1.362253, -2.352192, 1, 1, 1, 1, 1,
0.009299583, 1.246987, 0.667814, 1, 1, 1, 1, 1,
0.01813823, -0.6661968, 1.249689, 1, 1, 1, 1, 1,
0.02915519, -1.635386, 2.717429, 1, 1, 1, 1, 1,
0.03653472, -0.1441792, 4.625268, 1, 1, 1, 1, 1,
0.04062838, -0.01040614, 2.706488, 1, 1, 1, 1, 1,
0.04372484, -1.043354, 4.642185, 1, 1, 1, 1, 1,
0.04421347, 0.009634771, 2.259434, 1, 1, 1, 1, 1,
0.05130951, -0.1359472, 2.483505, 1, 1, 1, 1, 1,
0.05184775, 0.4728737, 1.481317, 1, 1, 1, 1, 1,
0.05316537, 0.345956, 0.3823138, 1, 1, 1, 1, 1,
0.05382732, -0.5545239, 0.9780177, 1, 1, 1, 1, 1,
0.06108835, 0.7042753, 0.0865542, 1, 1, 1, 1, 1,
0.06289627, 0.5403473, -0.0001520446, 0, 0, 1, 1, 1,
0.06684215, 1.351623, -1.66658, 1, 0, 0, 1, 1,
0.06784617, 1.240417, -0.7090368, 1, 0, 0, 1, 1,
0.07540413, 1.072029, 2.553403, 1, 0, 0, 1, 1,
0.07587429, 0.5657113, 1.776303, 1, 0, 0, 1, 1,
0.08046396, -0.2258333, 1.076728, 1, 0, 0, 1, 1,
0.0808451, 0.3909308, -1.02767, 0, 0, 0, 1, 1,
0.08151668, -0.9220108, 2.767273, 0, 0, 0, 1, 1,
0.08155155, -0.2115146, 3.524536, 0, 0, 0, 1, 1,
0.08544718, -0.1802095, 0.9444944, 0, 0, 0, 1, 1,
0.08545672, -1.927308, 3.056709, 0, 0, 0, 1, 1,
0.0892337, -0.2063043, 2.622775, 0, 0, 0, 1, 1,
0.09890291, 0.4347534, 1.492865, 0, 0, 0, 1, 1,
0.1023725, 0.01021007, 1.682361, 1, 1, 1, 1, 1,
0.1052151, 0.3911382, 1.227887, 1, 1, 1, 1, 1,
0.1060233, -0.3155888, 2.815888, 1, 1, 1, 1, 1,
0.1068368, 0.8883991, 1.145922, 1, 1, 1, 1, 1,
0.1112414, 0.8483656, 2.434051, 1, 1, 1, 1, 1,
0.1118342, 0.1293029, 0.7768679, 1, 1, 1, 1, 1,
0.1142072, 1.567352, -0.1762042, 1, 1, 1, 1, 1,
0.115234, -0.8122928, 3.07097, 1, 1, 1, 1, 1,
0.1187068, -0.7330572, 1.932202, 1, 1, 1, 1, 1,
0.1195688, -0.1970383, 3.506566, 1, 1, 1, 1, 1,
0.1201442, -2.206454, 3.686689, 1, 1, 1, 1, 1,
0.1253337, -0.06030119, 1.340299, 1, 1, 1, 1, 1,
0.1287476, -1.157003, 2.330952, 1, 1, 1, 1, 1,
0.1304242, -0.9687919, 4.298008, 1, 1, 1, 1, 1,
0.1332896, 0.1488379, 0.6951805, 1, 1, 1, 1, 1,
0.1431571, -0.4914118, 1.208441, 0, 0, 1, 1, 1,
0.1479311, 1.419196, 0.7138154, 1, 0, 0, 1, 1,
0.1497816, -0.1004169, 1.951381, 1, 0, 0, 1, 1,
0.1509944, 0.6621221, 0.5507433, 1, 0, 0, 1, 1,
0.1524574, -1.101611, 3.591177, 1, 0, 0, 1, 1,
0.1545791, 0.7518466, 0.2005927, 1, 0, 0, 1, 1,
0.164405, 1.583729, -0.5294811, 0, 0, 0, 1, 1,
0.1709781, -1.410698, 2.798156, 0, 0, 0, 1, 1,
0.1722867, -0.2856372, 2.363182, 0, 0, 0, 1, 1,
0.1729706, 0.8315867, 0.8645774, 0, 0, 0, 1, 1,
0.1732277, -0.3725893, 1.43297, 0, 0, 0, 1, 1,
0.1737982, 0.9180713, -0.2451737, 0, 0, 0, 1, 1,
0.1863711, 1.427764, -0.3593261, 0, 0, 0, 1, 1,
0.1893462, -0.4763739, 2.594338, 1, 1, 1, 1, 1,
0.1918724, -1.107265, 1.948264, 1, 1, 1, 1, 1,
0.1961661, 1.076726, -1.293609, 1, 1, 1, 1, 1,
0.1962277, 0.4190008, 1.41728, 1, 1, 1, 1, 1,
0.2005311, 0.1334634, 1.656476, 1, 1, 1, 1, 1,
0.2006517, -1.388204, 3.75612, 1, 1, 1, 1, 1,
0.2016761, 0.3007196, 0.8120219, 1, 1, 1, 1, 1,
0.2047029, -2.164927, 2.939227, 1, 1, 1, 1, 1,
0.2048371, -2.044865, 2.775193, 1, 1, 1, 1, 1,
0.2110492, 0.4047634, -0.01969904, 1, 1, 1, 1, 1,
0.2123833, 2.49144, -0.5696359, 1, 1, 1, 1, 1,
0.2127966, -1.219103, 1.397943, 1, 1, 1, 1, 1,
0.2147464, 0.3269185, 0.9460808, 1, 1, 1, 1, 1,
0.2193992, 0.1209584, 2.028312, 1, 1, 1, 1, 1,
0.2214336, -0.9123262, 1.255516, 1, 1, 1, 1, 1,
0.2232468, 1.693651, -0.5430748, 0, 0, 1, 1, 1,
0.2238177, 1.364327, -0.6491109, 1, 0, 0, 1, 1,
0.2238558, 0.07273561, 0.6877866, 1, 0, 0, 1, 1,
0.2250055, -2.295898, 3.284023, 1, 0, 0, 1, 1,
0.2290685, 0.03576815, 0.5104673, 1, 0, 0, 1, 1,
0.2320845, -1.186682, 2.67146, 1, 0, 0, 1, 1,
0.2351834, -1.870777, 2.377423, 0, 0, 0, 1, 1,
0.2381247, -0.3172825, 1.918547, 0, 0, 0, 1, 1,
0.2385063, 0.8803104, 0.4114017, 0, 0, 0, 1, 1,
0.2386284, 0.8120834, 0.4096479, 0, 0, 0, 1, 1,
0.2419991, -1.223738, 3.66315, 0, 0, 0, 1, 1,
0.2432074, 1.328428, 0.2385581, 0, 0, 0, 1, 1,
0.2447785, 0.01648424, 1.265197, 0, 0, 0, 1, 1,
0.2500924, -0.7858865, 1.279752, 1, 1, 1, 1, 1,
0.25157, 0.4725286, 0.5154154, 1, 1, 1, 1, 1,
0.2573128, -0.4205064, 1.901679, 1, 1, 1, 1, 1,
0.2607628, -0.6402569, 1.908717, 1, 1, 1, 1, 1,
0.2638503, 0.2187705, 1.568484, 1, 1, 1, 1, 1,
0.2639289, -0.7927972, 2.622367, 1, 1, 1, 1, 1,
0.2645468, -0.4462545, 2.946307, 1, 1, 1, 1, 1,
0.2646231, -1.662675, 1.652025, 1, 1, 1, 1, 1,
0.2679762, 0.9023154, -0.4426906, 1, 1, 1, 1, 1,
0.2745147, 0.2191215, 1.734659, 1, 1, 1, 1, 1,
0.277634, 1.297386, -0.815116, 1, 1, 1, 1, 1,
0.2788645, 1.381017, -2.032805, 1, 1, 1, 1, 1,
0.2804557, 0.458397, 2.546357, 1, 1, 1, 1, 1,
0.280585, -2.109085, 3.059524, 1, 1, 1, 1, 1,
0.2832415, -0.7552738, 1.983495, 1, 1, 1, 1, 1,
0.2840137, 0.6054518, 1.139805, 0, 0, 1, 1, 1,
0.2849957, -0.2194216, 2.986984, 1, 0, 0, 1, 1,
0.2889131, -1.417209, 4.502884, 1, 0, 0, 1, 1,
0.2979431, 0.9556841, -0.02636678, 1, 0, 0, 1, 1,
0.3011001, -0.3226418, 1.999103, 1, 0, 0, 1, 1,
0.3019669, -0.8455813, 3.765643, 1, 0, 0, 1, 1,
0.3035462, 0.9907097, -2.240285, 0, 0, 0, 1, 1,
0.3056052, -0.1540277, 3.015656, 0, 0, 0, 1, 1,
0.3058641, 0.1618217, 2.354838, 0, 0, 0, 1, 1,
0.3167601, -0.7876647, 2.827441, 0, 0, 0, 1, 1,
0.3204772, 0.2631424, 2.52787, 0, 0, 0, 1, 1,
0.3218648, -0.3554632, 2.078835, 0, 0, 0, 1, 1,
0.3219859, 0.538753, -0.5498011, 0, 0, 0, 1, 1,
0.3245491, 0.02249594, 0.742494, 1, 1, 1, 1, 1,
0.3269556, -0.735895, 2.001413, 1, 1, 1, 1, 1,
0.3294431, 1.413124, -1.578861, 1, 1, 1, 1, 1,
0.3298599, -1.32359, 4.527475, 1, 1, 1, 1, 1,
0.332464, -0.07542644, 1.217348, 1, 1, 1, 1, 1,
0.3401817, 0.2479772, -0.3057686, 1, 1, 1, 1, 1,
0.3461192, 1.084551, -0.3842973, 1, 1, 1, 1, 1,
0.3465196, 1.10244, 1.13736, 1, 1, 1, 1, 1,
0.3505571, 0.09535346, 0.9020432, 1, 1, 1, 1, 1,
0.3517474, 1.323441, 1.258344, 1, 1, 1, 1, 1,
0.3544293, -0.5780258, 1.285574, 1, 1, 1, 1, 1,
0.3547495, 1.840518, -0.1718564, 1, 1, 1, 1, 1,
0.3554204, 0.6554732, 1.966964, 1, 1, 1, 1, 1,
0.3560343, 2.357043, 0.5829221, 1, 1, 1, 1, 1,
0.3583812, -2.196102, 1.296663, 1, 1, 1, 1, 1,
0.3601893, -0.9107884, 4.32748, 0, 0, 1, 1, 1,
0.3653566, 0.5906274, 1.808177, 1, 0, 0, 1, 1,
0.3715322, 1.063044, -0.5350803, 1, 0, 0, 1, 1,
0.3741201, 0.5326522, 2.030628, 1, 0, 0, 1, 1,
0.3780372, -0.3007117, 4.968399, 1, 0, 0, 1, 1,
0.3802821, 0.1741197, 0.3496819, 1, 0, 0, 1, 1,
0.3808633, 0.8012744, 1.070838, 0, 0, 0, 1, 1,
0.3814434, 1.642973, 0.6955182, 0, 0, 0, 1, 1,
0.3847891, -0.813624, 3.12707, 0, 0, 0, 1, 1,
0.3850649, 1.443733, -0.394075, 0, 0, 0, 1, 1,
0.3852632, -1.04803, 4.014144, 0, 0, 0, 1, 1,
0.3968611, -1.047227, 0.8965939, 0, 0, 0, 1, 1,
0.4022252, 0.541913, 0.9311741, 0, 0, 0, 1, 1,
0.4063783, 0.2554074, 1.007194, 1, 1, 1, 1, 1,
0.4109889, -0.5442462, 1.497125, 1, 1, 1, 1, 1,
0.4110859, 0.5844162, 0.1827375, 1, 1, 1, 1, 1,
0.4127103, 1.043595, 2.025565, 1, 1, 1, 1, 1,
0.414328, -0.5566193, 3.103697, 1, 1, 1, 1, 1,
0.4148889, 0.367552, -1.383667, 1, 1, 1, 1, 1,
0.4187928, 1.022991, 1.534956, 1, 1, 1, 1, 1,
0.4196444, 0.9449834, -1.204491, 1, 1, 1, 1, 1,
0.4217264, -0.348246, 2.149345, 1, 1, 1, 1, 1,
0.4242184, -0.3840258, 1.477666, 1, 1, 1, 1, 1,
0.425294, 0.7628838, 1.005058, 1, 1, 1, 1, 1,
0.4280706, 0.3339345, 2.241606, 1, 1, 1, 1, 1,
0.431105, -1.359919, 3.90586, 1, 1, 1, 1, 1,
0.4320062, -0.5674066, 0.4279386, 1, 1, 1, 1, 1,
0.435109, -0.9808331, 4.322808, 1, 1, 1, 1, 1,
0.439753, 0.8709718, 1.228278, 0, 0, 1, 1, 1,
0.4412911, 0.5551163, -0.5872071, 1, 0, 0, 1, 1,
0.4463889, -0.7314538, 1.865913, 1, 0, 0, 1, 1,
0.4479032, 2.369877, -0.7971514, 1, 0, 0, 1, 1,
0.4487762, 1.239317, -1.481519, 1, 0, 0, 1, 1,
0.4541607, 0.09111458, 2.228099, 1, 0, 0, 1, 1,
0.4546595, 0.4708031, 1.57066, 0, 0, 0, 1, 1,
0.4584841, -0.7136978, 2.66954, 0, 0, 0, 1, 1,
0.4615631, 0.4957674, 0.1430259, 0, 0, 0, 1, 1,
0.4626685, -1.678029, 3.179497, 0, 0, 0, 1, 1,
0.4663878, -1.627033, 3.898256, 0, 0, 0, 1, 1,
0.4683113, -0.06621069, 2.649694, 0, 0, 0, 1, 1,
0.4695746, -0.6709751, 3.058854, 0, 0, 0, 1, 1,
0.4715428, -1.250075, 3.397482, 1, 1, 1, 1, 1,
0.476633, -0.1813805, 1.485092, 1, 1, 1, 1, 1,
0.4780325, -0.3772325, 1.801505, 1, 1, 1, 1, 1,
0.4796084, 1.077935, 0.4092991, 1, 1, 1, 1, 1,
0.4811017, -0.4891437, 1.466745, 1, 1, 1, 1, 1,
0.4850023, -0.352857, 0.01784557, 1, 1, 1, 1, 1,
0.4866022, 0.8735558, 0.5417792, 1, 1, 1, 1, 1,
0.4870609, 0.2853189, 1.194071, 1, 1, 1, 1, 1,
0.491964, 1.001688, 0.9354655, 1, 1, 1, 1, 1,
0.4970437, 0.4130051, 1.717286, 1, 1, 1, 1, 1,
0.4984023, -0.5431443, 2.300655, 1, 1, 1, 1, 1,
0.5010232, -0.2063269, 1.778362, 1, 1, 1, 1, 1,
0.5035887, 1.26456, 0.1494608, 1, 1, 1, 1, 1,
0.5066925, -1.301915, 3.126864, 1, 1, 1, 1, 1,
0.5232108, 0.1944274, 0.5065644, 1, 1, 1, 1, 1,
0.5245323, 0.2933898, 0.6290877, 0, 0, 1, 1, 1,
0.5248917, -0.3630786, 2.32577, 1, 0, 0, 1, 1,
0.5270019, -0.6837486, 1.014121, 1, 0, 0, 1, 1,
0.5285753, 2.755207, -0.05256854, 1, 0, 0, 1, 1,
0.530309, 0.6492082, 1.123876, 1, 0, 0, 1, 1,
0.5304338, -0.2007785, 1.45426, 1, 0, 0, 1, 1,
0.531386, 2.979724, -0.8610685, 0, 0, 0, 1, 1,
0.5339836, -0.183702, 2.344241, 0, 0, 0, 1, 1,
0.5370935, 0.7707155, -0.4038552, 0, 0, 0, 1, 1,
0.5393709, 0.6822085, 2.303509, 0, 0, 0, 1, 1,
0.5409909, 0.6204576, 1.678993, 0, 0, 0, 1, 1,
0.5410786, -2.682927, 2.250878, 0, 0, 0, 1, 1,
0.5442237, 0.3124306, 1.121571, 0, 0, 0, 1, 1,
0.5465852, -1.375422, 3.401577, 1, 1, 1, 1, 1,
0.5490007, -2.430447, 3.035033, 1, 1, 1, 1, 1,
0.55015, 0.02254082, 2.359557, 1, 1, 1, 1, 1,
0.5538439, -0.1758138, 0.1138363, 1, 1, 1, 1, 1,
0.5569547, 0.09319873, 2.461651, 1, 1, 1, 1, 1,
0.5576555, 0.09993105, -0.2040566, 1, 1, 1, 1, 1,
0.5590627, -1.878426, 2.784184, 1, 1, 1, 1, 1,
0.5620649, 0.185637, 2.17219, 1, 1, 1, 1, 1,
0.5643415, -0.7143108, 2.933708, 1, 1, 1, 1, 1,
0.5678558, -0.9665461, 2.956812, 1, 1, 1, 1, 1,
0.5678934, 0.4290689, 0.647789, 1, 1, 1, 1, 1,
0.5705359, -0.7729792, 3.032895, 1, 1, 1, 1, 1,
0.5723404, -0.6334749, 3.339924, 1, 1, 1, 1, 1,
0.5739703, 1.934704, 0.9218086, 1, 1, 1, 1, 1,
0.5828893, 0.1949146, 1.575252, 1, 1, 1, 1, 1,
0.5878959, 0.5023984, 0.5002535, 0, 0, 1, 1, 1,
0.5930947, -0.6172636, 2.040299, 1, 0, 0, 1, 1,
0.5937772, 1.735116, 1.325513, 1, 0, 0, 1, 1,
0.5946282, -1.240592, 2.727913, 1, 0, 0, 1, 1,
0.6016158, -0.9601184, 2.008009, 1, 0, 0, 1, 1,
0.6023244, -1.094016, 3.549783, 1, 0, 0, 1, 1,
0.60511, 1.538393, -0.4744839, 0, 0, 0, 1, 1,
0.6101542, -0.4134557, 2.700464, 0, 0, 0, 1, 1,
0.6197893, -0.7656201, 0.8625399, 0, 0, 0, 1, 1,
0.6245464, 0.1618856, 0.1811427, 0, 0, 0, 1, 1,
0.6246873, 1.461117, 0.3531655, 0, 0, 0, 1, 1,
0.6271143, 0.4759745, 1.706757, 0, 0, 0, 1, 1,
0.6281479, 0.2147271, 1.022308, 0, 0, 0, 1, 1,
0.6374801, -1.404464, 2.244666, 1, 1, 1, 1, 1,
0.6381416, 0.01992026, 1.599038, 1, 1, 1, 1, 1,
0.6390232, 1.473061, -0.5535116, 1, 1, 1, 1, 1,
0.639506, 1.091518, 0.3696554, 1, 1, 1, 1, 1,
0.65264, -1.351115, 3.187088, 1, 1, 1, 1, 1,
0.6543783, -0.6999931, 2.282213, 1, 1, 1, 1, 1,
0.6594067, 1.220777, 0.1143636, 1, 1, 1, 1, 1,
0.664647, 0.08741377, 0.3396055, 1, 1, 1, 1, 1,
0.6691281, 0.7725728, 1.966596, 1, 1, 1, 1, 1,
0.6729318, 0.358246, 0.8603701, 1, 1, 1, 1, 1,
0.6821696, -0.3798584, 1.90308, 1, 1, 1, 1, 1,
0.6865348, -0.3551378, 3.640118, 1, 1, 1, 1, 1,
0.6870732, 0.7604917, -0.8448617, 1, 1, 1, 1, 1,
0.691747, -0.2128323, 2.746416, 1, 1, 1, 1, 1,
0.6936712, -1.534418, 2.123571, 1, 1, 1, 1, 1,
0.6964529, 0.9515511, 0.2876034, 0, 0, 1, 1, 1,
0.7105438, -0.40429, 2.924864, 1, 0, 0, 1, 1,
0.7110661, -0.1777902, 2.197686, 1, 0, 0, 1, 1,
0.7115343, -0.7803181, 1.756333, 1, 0, 0, 1, 1,
0.7151502, 1.111592, -0.08807724, 1, 0, 0, 1, 1,
0.7158639, -1.086564, 3.968915, 1, 0, 0, 1, 1,
0.7212255, 0.4961297, 1.10859, 0, 0, 0, 1, 1,
0.7216862, -1.968633, 1.849589, 0, 0, 0, 1, 1,
0.7219389, 0.01381769, 1.543471, 0, 0, 0, 1, 1,
0.7219586, 0.469045, 1.56598, 0, 0, 0, 1, 1,
0.7222297, -0.1559879, 1.697669, 0, 0, 0, 1, 1,
0.7261065, -1.116253, 2.181472, 0, 0, 0, 1, 1,
0.7278588, -0.7831516, 2.265473, 0, 0, 0, 1, 1,
0.7304434, -2.207242, 3.76659, 1, 1, 1, 1, 1,
0.7307796, -0.2406975, 1.562858, 1, 1, 1, 1, 1,
0.7322711, 1.047752, 1.550986, 1, 1, 1, 1, 1,
0.7370395, -0.7768732, 2.265776, 1, 1, 1, 1, 1,
0.7524931, 1.200055, 0.3876855, 1, 1, 1, 1, 1,
0.7574905, 0.2742054, 1.612636, 1, 1, 1, 1, 1,
0.7583478, 0.9030545, 0.3767574, 1, 1, 1, 1, 1,
0.7618148, -0.06033316, 2.484434, 1, 1, 1, 1, 1,
0.7640859, 0.3019142, 1.849491, 1, 1, 1, 1, 1,
0.7649843, 0.3552465, 0.4576066, 1, 1, 1, 1, 1,
0.7668845, 1.117754, 1.364515, 1, 1, 1, 1, 1,
0.7671736, -0.7852129, 2.56948, 1, 1, 1, 1, 1,
0.7678682, 0.2453007, -0.4107943, 1, 1, 1, 1, 1,
0.7754232, -0.1404245, 0.7040215, 1, 1, 1, 1, 1,
0.7763804, 0.1699761, 1.59971, 1, 1, 1, 1, 1,
0.7807651, -0.09679897, 1.680971, 0, 0, 1, 1, 1,
0.7807881, 0.6660777, 0.7721269, 1, 0, 0, 1, 1,
0.780797, 1.708194, 0.350697, 1, 0, 0, 1, 1,
0.7822429, -1.039387, 3.150658, 1, 0, 0, 1, 1,
0.7822815, -2.523117, 2.067767, 1, 0, 0, 1, 1,
0.7861176, -0.6615009, 1.95158, 1, 0, 0, 1, 1,
0.7914063, 0.2545372, 0.4296018, 0, 0, 0, 1, 1,
0.7928593, -0.3781383, 2.4352, 0, 0, 0, 1, 1,
0.8052795, -0.8335057, 3.829716, 0, 0, 0, 1, 1,
0.8061327, 0.3730387, 2.102117, 0, 0, 0, 1, 1,
0.8065626, 0.09255639, 2.528199, 0, 0, 0, 1, 1,
0.8075961, 1.740408, 0.2952909, 0, 0, 0, 1, 1,
0.8151879, -1.03612, 2.625169, 0, 0, 0, 1, 1,
0.8161663, 1.546458, 0.7598764, 1, 1, 1, 1, 1,
0.8281562, -1.407203, 1.50508, 1, 1, 1, 1, 1,
0.8282519, -0.3786179, 2.220905, 1, 1, 1, 1, 1,
0.8338462, 1.072324, 1.274405, 1, 1, 1, 1, 1,
0.8366936, -1.101818, 2.255494, 1, 1, 1, 1, 1,
0.8391353, 1.272639, 0.4816707, 1, 1, 1, 1, 1,
0.8476667, -0.2270593, 2.845037, 1, 1, 1, 1, 1,
0.8616146, -0.5361409, 1.37007, 1, 1, 1, 1, 1,
0.863884, -0.1980298, 1.493041, 1, 1, 1, 1, 1,
0.868576, -0.773973, 2.677099, 1, 1, 1, 1, 1,
0.8734968, -0.2986283, 3.302411, 1, 1, 1, 1, 1,
0.8736624, -1.313961, 0.514191, 1, 1, 1, 1, 1,
0.8754872, -0.2847324, 3.71154, 1, 1, 1, 1, 1,
0.8796678, -0.1281802, 1.612348, 1, 1, 1, 1, 1,
0.8843588, 1.618612, 0.5882081, 1, 1, 1, 1, 1,
0.8885059, 1.476786, 1.630123, 0, 0, 1, 1, 1,
0.8952667, 1.041026, 1.161414, 1, 0, 0, 1, 1,
0.9020793, 1.905591, 0.1778868, 1, 0, 0, 1, 1,
0.9138866, -0.6495324, -0.9694214, 1, 0, 0, 1, 1,
0.9274769, -1.415725, 2.388421, 1, 0, 0, 1, 1,
0.9398952, -0.7567637, 2.023075, 1, 0, 0, 1, 1,
0.9490131, -0.684864, 0.6582851, 0, 0, 0, 1, 1,
0.9503242, 0.7316198, -0.1491991, 0, 0, 0, 1, 1,
0.9574809, 0.554343, 2.275591, 0, 0, 0, 1, 1,
0.958759, -1.32624, 1.304383, 0, 0, 0, 1, 1,
0.9626538, -0.9457238, 3.632263, 0, 0, 0, 1, 1,
0.9735074, 0.09011532, 1.633254, 0, 0, 0, 1, 1,
0.9761758, 1.055015, 1.052859, 0, 0, 0, 1, 1,
0.984832, -1.091296, 1.395977, 1, 1, 1, 1, 1,
0.9851772, -0.9124109, 3.428687, 1, 1, 1, 1, 1,
0.986587, 0.4783685, 1.620221, 1, 1, 1, 1, 1,
0.9877703, 1.573985, 1.22007, 1, 1, 1, 1, 1,
0.9878357, -0.3851277, 1.565973, 1, 1, 1, 1, 1,
0.9928234, 0.8940187, 1.178921, 1, 1, 1, 1, 1,
0.9932443, -0.8790782, 2.799917, 1, 1, 1, 1, 1,
0.9948877, -0.8812202, 4.041057, 1, 1, 1, 1, 1,
0.996204, -1.016856, 0.7800929, 1, 1, 1, 1, 1,
0.9969429, 0.9526754, -1.037081, 1, 1, 1, 1, 1,
1.00137, 0.9572468, -0.02528849, 1, 1, 1, 1, 1,
1.00784, -1.357472, 2.878669, 1, 1, 1, 1, 1,
1.015807, 0.1909788, 1.45358, 1, 1, 1, 1, 1,
1.020249, 0.1130621, 0.3419808, 1, 1, 1, 1, 1,
1.0256, -0.4589163, 3.336583, 1, 1, 1, 1, 1,
1.030779, 1.069953, 1.087863, 0, 0, 1, 1, 1,
1.033254, -1.235886, 2.683293, 1, 0, 0, 1, 1,
1.033353, -0.3669286, 1.922402, 1, 0, 0, 1, 1,
1.039757, -0.07848601, 2.897139, 1, 0, 0, 1, 1,
1.040062, 0.5921549, 2.249677, 1, 0, 0, 1, 1,
1.052947, 0.1480411, 1.657456, 1, 0, 0, 1, 1,
1.055841, -0.9399954, 2.350021, 0, 0, 0, 1, 1,
1.061452, 0.01605473, 1.793362, 0, 0, 0, 1, 1,
1.061631, 1.42978, 1.220098, 0, 0, 0, 1, 1,
1.067827, 1.396856, 0.8086025, 0, 0, 0, 1, 1,
1.072477, 0.1067489, 1.88533, 0, 0, 0, 1, 1,
1.0735, -0.2060083, 3.473036, 0, 0, 0, 1, 1,
1.074636, -0.01865126, 0.1235839, 0, 0, 0, 1, 1,
1.075363, -0.3289182, 3.063559, 1, 1, 1, 1, 1,
1.07969, 0.173949, 1.268846, 1, 1, 1, 1, 1,
1.079922, 0.5697489, 0.05987202, 1, 1, 1, 1, 1,
1.082424, -0.8432202, 2.483131, 1, 1, 1, 1, 1,
1.082968, 0.4125694, 1.661876, 1, 1, 1, 1, 1,
1.08786, -0.6971471, 4.23084, 1, 1, 1, 1, 1,
1.090057, 0.2243464, 2.580405, 1, 1, 1, 1, 1,
1.101051, -0.6508673, -0.298624, 1, 1, 1, 1, 1,
1.103159, 0.8580796, 0.7371029, 1, 1, 1, 1, 1,
1.103178, -0.1495079, 2.819743, 1, 1, 1, 1, 1,
1.103819, -0.6587369, -0.1186688, 1, 1, 1, 1, 1,
1.10397, -0.5198912, 3.008731, 1, 1, 1, 1, 1,
1.107368, -2.301824, 3.09519, 1, 1, 1, 1, 1,
1.109372, -0.8084103, 4.082254, 1, 1, 1, 1, 1,
1.114318, 1.281163, 1.021835, 1, 1, 1, 1, 1,
1.116036, 0.9032864, 1.693982, 0, 0, 1, 1, 1,
1.117186, -0.7689558, 3.751226, 1, 0, 0, 1, 1,
1.118161, -0.9152825, 1.254115, 1, 0, 0, 1, 1,
1.122819, -0.3135263, 1.486458, 1, 0, 0, 1, 1,
1.124178, 0.8208819, 4.479472, 1, 0, 0, 1, 1,
1.135043, -2.118522, -0.1138537, 1, 0, 0, 1, 1,
1.137071, 0.05641862, 0.3640057, 0, 0, 0, 1, 1,
1.142733, 0.9344927, 1.546075, 0, 0, 0, 1, 1,
1.146709, -0.2743899, 0.6026657, 0, 0, 0, 1, 1,
1.160037, -1.095354, 2.254057, 0, 0, 0, 1, 1,
1.166537, 0.4636078, 0.7680948, 0, 0, 0, 1, 1,
1.17304, 1.813912, 0.5296021, 0, 0, 0, 1, 1,
1.194873, 0.2442936, 3.114245, 0, 0, 0, 1, 1,
1.197673, 0.7911752, 2.445238, 1, 1, 1, 1, 1,
1.198267, -0.1978807, 0.949675, 1, 1, 1, 1, 1,
1.207389, 1.498017, 0.780816, 1, 1, 1, 1, 1,
1.213009, -1.837897, 2.394546, 1, 1, 1, 1, 1,
1.236399, -0.655381, 1.340937, 1, 1, 1, 1, 1,
1.236589, -0.2122748, 2.220838, 1, 1, 1, 1, 1,
1.240056, -0.08511256, 2.53766, 1, 1, 1, 1, 1,
1.241637, -0.9071903, 4.457033, 1, 1, 1, 1, 1,
1.261859, -0.3972129, 0.8380114, 1, 1, 1, 1, 1,
1.269251, 1.554877, 0.2746627, 1, 1, 1, 1, 1,
1.280877, -1.869982, 2.643396, 1, 1, 1, 1, 1,
1.286384, -1.132301, 3.019185, 1, 1, 1, 1, 1,
1.289786, -1.782943, 0.4904427, 1, 1, 1, 1, 1,
1.299154, -0.6901003, 2.409103, 1, 1, 1, 1, 1,
1.306876, -0.6373624, 2.238649, 1, 1, 1, 1, 1,
1.311712, 0.120375, 2.110175, 0, 0, 1, 1, 1,
1.323034, -0.5639967, -0.03519424, 1, 0, 0, 1, 1,
1.333871, -0.8712902, 0.3176292, 1, 0, 0, 1, 1,
1.335143, -1.042262, 1.24075, 1, 0, 0, 1, 1,
1.336679, -0.6236734, 2.74036, 1, 0, 0, 1, 1,
1.338092, 0.07134648, 2.666437, 1, 0, 0, 1, 1,
1.348093, 0.2081947, 1.273219, 0, 0, 0, 1, 1,
1.348322, -0.674567, 1.651021, 0, 0, 0, 1, 1,
1.349698, 0.7017705, 1.090354, 0, 0, 0, 1, 1,
1.350134, -0.1180448, 0.8666262, 0, 0, 0, 1, 1,
1.373462, -0.5288568, 1.122424, 0, 0, 0, 1, 1,
1.380357, 1.130104, 1.516189, 0, 0, 0, 1, 1,
1.38394, 1.62699, 0.8656531, 0, 0, 0, 1, 1,
1.392676, 0.2752283, 1.157628, 1, 1, 1, 1, 1,
1.393065, 0.05391546, 2.968469, 1, 1, 1, 1, 1,
1.394111, -0.9007463, 2.194391, 1, 1, 1, 1, 1,
1.395038, -1.10957, 3.611566, 1, 1, 1, 1, 1,
1.400396, 1.313148, 1.03227, 1, 1, 1, 1, 1,
1.403051, 0.003824627, 2.907973, 1, 1, 1, 1, 1,
1.413675, -1.284008, 0.4301979, 1, 1, 1, 1, 1,
1.425627, -1.430577, 1.839521, 1, 1, 1, 1, 1,
1.426907, 0.3648144, 0.3856036, 1, 1, 1, 1, 1,
1.438478, -0.6027235, 0.6367903, 1, 1, 1, 1, 1,
1.447383, 0.65679, 0.9400005, 1, 1, 1, 1, 1,
1.463156, -1.343028, 1.885339, 1, 1, 1, 1, 1,
1.480524, 0.054494, 0.4809916, 1, 1, 1, 1, 1,
1.494241, 2.004204, 1.796, 1, 1, 1, 1, 1,
1.498275, 0.4921228, 1.644653, 1, 1, 1, 1, 1,
1.499086, 1.358148, 1.972938, 0, 0, 1, 1, 1,
1.501143, 0.13165, 2.113477, 1, 0, 0, 1, 1,
1.505487, -1.301186, 2.592772, 1, 0, 0, 1, 1,
1.51326, -0.3429251, 0.3415296, 1, 0, 0, 1, 1,
1.515925, 1.808936, 1.227698, 1, 0, 0, 1, 1,
1.516319, 0.1423687, 1.408635, 1, 0, 0, 1, 1,
1.548918, 0.1794928, 2.515573, 0, 0, 0, 1, 1,
1.549532, 0.9158069, 1.741944, 0, 0, 0, 1, 1,
1.550304, 0.1587365, 1.853249, 0, 0, 0, 1, 1,
1.557965, 1.155175, 2.315788, 0, 0, 0, 1, 1,
1.560217, -1.460869, 1.611268, 0, 0, 0, 1, 1,
1.562072, -0.7608752, 1.166925, 0, 0, 0, 1, 1,
1.573517, 0.04456948, 2.434315, 0, 0, 0, 1, 1,
1.576624, -1.059309, 0.5933571, 1, 1, 1, 1, 1,
1.606974, 1.21632, 2.686224, 1, 1, 1, 1, 1,
1.618489, 0.997674, 0.02662214, 1, 1, 1, 1, 1,
1.61988, -1.296828, 1.758653, 1, 1, 1, 1, 1,
1.625589, 1.268022, 3.023017, 1, 1, 1, 1, 1,
1.63006, -0.6714302, 2.52024, 1, 1, 1, 1, 1,
1.637246, -0.3981069, 2.060028, 1, 1, 1, 1, 1,
1.645647, 0.6659133, 0.8037248, 1, 1, 1, 1, 1,
1.649937, 1.43169, 3.05846, 1, 1, 1, 1, 1,
1.651582, -0.3490675, 1.260289, 1, 1, 1, 1, 1,
1.667915, -1.173931, 1.723808, 1, 1, 1, 1, 1,
1.673162, 0.8524211, 0.9260305, 1, 1, 1, 1, 1,
1.682759, 0.3903919, 0.3058982, 1, 1, 1, 1, 1,
1.706928, -0.5445936, -0.3345315, 1, 1, 1, 1, 1,
1.734807, 0.4501998, 2.646096, 1, 1, 1, 1, 1,
1.73511, 1.028835, 1.782041, 0, 0, 1, 1, 1,
1.738132, 1.459717, 1.807556, 1, 0, 0, 1, 1,
1.743628, -0.1035157, 0.1789059, 1, 0, 0, 1, 1,
1.762473, 0.01052974, -0.6111604, 1, 0, 0, 1, 1,
1.803654, -0.04191998, 2.632071, 1, 0, 0, 1, 1,
1.811075, 0.5470106, 1.077843, 1, 0, 0, 1, 1,
1.816624, 0.2990592, 2.265496, 0, 0, 0, 1, 1,
1.827384, -0.06786072, 2.764225, 0, 0, 0, 1, 1,
1.849019, -1.223771, 1.532772, 0, 0, 0, 1, 1,
1.860291, 0.1434339, 0.4999084, 0, 0, 0, 1, 1,
1.87599, 0.2438973, 1.40914, 0, 0, 0, 1, 1,
1.881174, -0.1971312, 1.44119, 0, 0, 0, 1, 1,
1.903357, -0.7215722, 2.337475, 0, 0, 0, 1, 1,
1.921519, 2.186251, 3.340494, 1, 1, 1, 1, 1,
1.931864, 1.190712, 0.2606479, 1, 1, 1, 1, 1,
1.932142, -0.1910088, 0.8890852, 1, 1, 1, 1, 1,
1.938963, 0.4093594, 0.9400177, 1, 1, 1, 1, 1,
1.965531, 1.126571, 1.403461, 1, 1, 1, 1, 1,
1.973809, 0.1072399, 3.433101, 1, 1, 1, 1, 1,
1.974408, -0.6501409, 2.608346, 1, 1, 1, 1, 1,
1.992674, -0.6865608, 0.6328438, 1, 1, 1, 1, 1,
2.01631, 0.2321383, 1.63778, 1, 1, 1, 1, 1,
2.017149, 0.6927656, 0.4864507, 1, 1, 1, 1, 1,
2.02422, -0.006683285, 0.4722689, 1, 1, 1, 1, 1,
2.040983, 0.8115718, 0.8708646, 1, 1, 1, 1, 1,
2.051214, 0.4339451, 2.753199, 1, 1, 1, 1, 1,
2.054249, 1.886998, 0.1599117, 1, 1, 1, 1, 1,
2.061968, -0.395832, 1.908332, 1, 1, 1, 1, 1,
2.071243, 1.307024, 0.1776898, 0, 0, 1, 1, 1,
2.087957, 0.746249, 0.3158563, 1, 0, 0, 1, 1,
2.100272, 0.8890728, 0.4911695, 1, 0, 0, 1, 1,
2.108371, -0.1855211, 1.005242, 1, 0, 0, 1, 1,
2.115679, -2.618575, 2.077032, 1, 0, 0, 1, 1,
2.12077, 0.8528745, 1.795158, 1, 0, 0, 1, 1,
2.130649, -0.8633153, 1.934568, 0, 0, 0, 1, 1,
2.13889, -1.374808, 2.695959, 0, 0, 0, 1, 1,
2.13942, 1.28973, 1.082942, 0, 0, 0, 1, 1,
2.139873, -0.3766939, 3.586627, 0, 0, 0, 1, 1,
2.147768, -1.623659, 1.130437, 0, 0, 0, 1, 1,
2.175116, -1.572822, 1.818065, 0, 0, 0, 1, 1,
2.291348, -0.2738464, 1.906744, 0, 0, 0, 1, 1,
2.317312, 1.17943, 1.595916, 1, 1, 1, 1, 1,
2.331648, 0.2803946, 2.008895, 1, 1, 1, 1, 1,
2.58203, -1.106627, 5.010937, 1, 1, 1, 1, 1,
2.593864, -0.5244238, 1.331686, 1, 1, 1, 1, 1,
2.678591, -0.5668722, 2.994932, 1, 1, 1, 1, 1,
2.97729, -0.4764729, 2.333577, 1, 1, 1, 1, 1,
3.172551, 0.4655218, 0.8047202, 1, 1, 1, 1, 1
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
var radius = 9.061;
var distance = 31.82638;
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
mvMatrix.translate( -0.06132603, -0.2321626, -0.04247308 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.82638);
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
