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
-2.678485, 1.359586, -1.104929, 1, 0, 0, 1,
-2.491421, -0.9402752, -0.6639056, 1, 0.007843138, 0, 1,
-2.463231, 0.2653697, -1.1745, 1, 0.01176471, 0, 1,
-2.346708, -0.1892436, -3.297312, 1, 0.01960784, 0, 1,
-2.313408, -0.0493011, -1.067356, 1, 0.02352941, 0, 1,
-2.239848, 0.3248668, -3.392721, 1, 0.03137255, 0, 1,
-2.214187, -0.769411, -1.27367, 1, 0.03529412, 0, 1,
-2.109824, 0.5257941, -2.923834, 1, 0.04313726, 0, 1,
-2.092944, 0.3311884, -1.144201, 1, 0.04705882, 0, 1,
-2.059836, -0.7892567, -0.4523171, 1, 0.05490196, 0, 1,
-2.057906, -0.5226138, -0.775264, 1, 0.05882353, 0, 1,
-2.049717, 0.5695276, -2.160644, 1, 0.06666667, 0, 1,
-2.042389, -1.289687, -0.4740809, 1, 0.07058824, 0, 1,
-2.004253, 0.2169771, -0.5403281, 1, 0.07843138, 0, 1,
-1.989579, 0.5987548, -0.5174153, 1, 0.08235294, 0, 1,
-1.976009, 0.7821684, -1.211797, 1, 0.09019608, 0, 1,
-1.975858, 0.9156659, -1.141737, 1, 0.09411765, 0, 1,
-1.953929, 0.605051, -1.571818, 1, 0.1019608, 0, 1,
-1.930547, -0.02679304, -2.754431, 1, 0.1098039, 0, 1,
-1.91446, -0.8380669, -1.642901, 1, 0.1137255, 0, 1,
-1.904113, 0.1719019, -1.795949, 1, 0.1215686, 0, 1,
-1.894491, 1.477759, -1.401119, 1, 0.1254902, 0, 1,
-1.891975, -1.456639, -1.582634, 1, 0.1333333, 0, 1,
-1.87597, -1.481457, -1.881366, 1, 0.1372549, 0, 1,
-1.834487, 0.5193557, -0.8460449, 1, 0.145098, 0, 1,
-1.812137, -1.325186, -1.217897, 1, 0.1490196, 0, 1,
-1.810096, 0.2855965, -1.292567, 1, 0.1568628, 0, 1,
-1.801438, -2.000396, -2.784755, 1, 0.1607843, 0, 1,
-1.738781, 0.8037013, -1.101699, 1, 0.1686275, 0, 1,
-1.728251, -0.8309461, -3.341624, 1, 0.172549, 0, 1,
-1.707345, 0.368527, -0.7546956, 1, 0.1803922, 0, 1,
-1.700711, 0.01429258, -1.893253, 1, 0.1843137, 0, 1,
-1.681974, 1.467132, 0.4930539, 1, 0.1921569, 0, 1,
-1.679002, 0.3897269, -2.607763, 1, 0.1960784, 0, 1,
-1.678412, -1.390393, -2.648759, 1, 0.2039216, 0, 1,
-1.674848, -0.1797168, -0.995731, 1, 0.2117647, 0, 1,
-1.672622, -0.3681869, -0.5570225, 1, 0.2156863, 0, 1,
-1.668617, 1.414051, -0.1138718, 1, 0.2235294, 0, 1,
-1.668256, -1.835592, -2.711153, 1, 0.227451, 0, 1,
-1.665572, 0.454587, -1.865466, 1, 0.2352941, 0, 1,
-1.646744, -0.4930501, -4.455426, 1, 0.2392157, 0, 1,
-1.63801, -0.6917689, -2.883583, 1, 0.2470588, 0, 1,
-1.619821, -0.9703966, -1.721667, 1, 0.2509804, 0, 1,
-1.619249, -0.647118, -2.268901, 1, 0.2588235, 0, 1,
-1.602553, -0.1757445, -1.633431, 1, 0.2627451, 0, 1,
-1.596838, -0.1321813, -1.154388, 1, 0.2705882, 0, 1,
-1.583397, -1.994486, -2.523704, 1, 0.2745098, 0, 1,
-1.579837, 2.114296, 0.07096216, 1, 0.282353, 0, 1,
-1.576525, -0.9201181, -1.287614, 1, 0.2862745, 0, 1,
-1.570049, 0.2663431, -0.160069, 1, 0.2941177, 0, 1,
-1.563765, 0.5740573, -3.380032, 1, 0.3019608, 0, 1,
-1.56215, -0.6058768, -0.7505587, 1, 0.3058824, 0, 1,
-1.551333, 0.009051748, -2.674269, 1, 0.3137255, 0, 1,
-1.531597, 0.01067177, -1.968816, 1, 0.3176471, 0, 1,
-1.505469, 0.1503204, -0.5700114, 1, 0.3254902, 0, 1,
-1.501656, -0.2517625, -1.684652, 1, 0.3294118, 0, 1,
-1.496418, -0.3216929, -3.354722, 1, 0.3372549, 0, 1,
-1.49446, -1.166868, -2.186652, 1, 0.3411765, 0, 1,
-1.481645, -1.623419, -2.921037, 1, 0.3490196, 0, 1,
-1.470213, 1.333869, -0.9764761, 1, 0.3529412, 0, 1,
-1.469239, 0.3940676, -1.392974, 1, 0.3607843, 0, 1,
-1.468736, -1.720762, -3.581079, 1, 0.3647059, 0, 1,
-1.462714, 0.9224966, 0.1936555, 1, 0.372549, 0, 1,
-1.460655, 0.4972744, -2.601765, 1, 0.3764706, 0, 1,
-1.445402, -3.293361, -2.101819, 1, 0.3843137, 0, 1,
-1.439033, 0.5544828, -2.504036, 1, 0.3882353, 0, 1,
-1.431027, 2.126355, -0.3843667, 1, 0.3960784, 0, 1,
-1.410597, 1.270568, -1.578539, 1, 0.4039216, 0, 1,
-1.410535, 0.3744825, -1.411568, 1, 0.4078431, 0, 1,
-1.405664, -0.5989218, -0.9110556, 1, 0.4156863, 0, 1,
-1.403864, -0.0250118, -1.565057, 1, 0.4196078, 0, 1,
-1.393489, 0.796228, -1.078859, 1, 0.427451, 0, 1,
-1.379324, 0.4453111, 0.7043496, 1, 0.4313726, 0, 1,
-1.359345, -0.6679436, -2.672731, 1, 0.4392157, 0, 1,
-1.356061, 2.534598, -0.3682185, 1, 0.4431373, 0, 1,
-1.352019, 0.6187944, -1.710191, 1, 0.4509804, 0, 1,
-1.340104, -0.08652583, -3.410209, 1, 0.454902, 0, 1,
-1.340034, 0.3894413, -0.4690602, 1, 0.4627451, 0, 1,
-1.331044, -0.3561142, -2.141699, 1, 0.4666667, 0, 1,
-1.323363, -1.049204, -2.538203, 1, 0.4745098, 0, 1,
-1.318075, -1.009267, -0.6235161, 1, 0.4784314, 0, 1,
-1.313226, 2.21914, 0.1207832, 1, 0.4862745, 0, 1,
-1.312953, -0.1725911, -0.7152184, 1, 0.4901961, 0, 1,
-1.312736, 1.141992, 0.1919503, 1, 0.4980392, 0, 1,
-1.311275, 0.1860658, -1.755821, 1, 0.5058824, 0, 1,
-1.310625, -0.07193036, -2.276406, 1, 0.509804, 0, 1,
-1.308332, -1.007003, -2.717228, 1, 0.5176471, 0, 1,
-1.300864, 0.3801704, -0.2665136, 1, 0.5215687, 0, 1,
-1.298751, 0.2761813, -0.5297443, 1, 0.5294118, 0, 1,
-1.295921, -0.8792672, -1.972955, 1, 0.5333334, 0, 1,
-1.292891, -2.083272, -1.292009, 1, 0.5411765, 0, 1,
-1.277282, 1.032279, -0.6371784, 1, 0.5450981, 0, 1,
-1.262397, 0.5753685, -0.4407846, 1, 0.5529412, 0, 1,
-1.261911, 3.05387, 1.111865, 1, 0.5568628, 0, 1,
-1.243981, 0.2864341, -1.329157, 1, 0.5647059, 0, 1,
-1.243698, -0.9884492, -0.9307221, 1, 0.5686275, 0, 1,
-1.236387, 1.231797, -1.326244, 1, 0.5764706, 0, 1,
-1.224146, -0.8511915, -3.984269, 1, 0.5803922, 0, 1,
-1.223128, -0.1930264, -2.424258, 1, 0.5882353, 0, 1,
-1.221468, 0.4486031, -1.558095, 1, 0.5921569, 0, 1,
-1.216604, 1.026918, -2.821445, 1, 0.6, 0, 1,
-1.216472, 1.696639, -0.6457332, 1, 0.6078432, 0, 1,
-1.211506, -0.7394181, -2.516943, 1, 0.6117647, 0, 1,
-1.203708, -0.3459079, -0.7526184, 1, 0.6196079, 0, 1,
-1.199636, -0.7557126, -4.778878, 1, 0.6235294, 0, 1,
-1.190601, -0.4863068, -1.469526, 1, 0.6313726, 0, 1,
-1.187519, -1.611374, -2.797393, 1, 0.6352941, 0, 1,
-1.187187, 1.295655, -1.63785, 1, 0.6431373, 0, 1,
-1.184033, 0.9217498, -0.741155, 1, 0.6470588, 0, 1,
-1.181772, 2.215661, 0.9532236, 1, 0.654902, 0, 1,
-1.178655, 1.374452, -0.4547934, 1, 0.6588235, 0, 1,
-1.175848, -1.467624, -2.212569, 1, 0.6666667, 0, 1,
-1.172209, -2.206221, -2.361889, 1, 0.6705883, 0, 1,
-1.170044, 0.8603788, -1.558138, 1, 0.6784314, 0, 1,
-1.163507, 1.760785, 1.081321, 1, 0.682353, 0, 1,
-1.155848, -0.2014386, -2.309034, 1, 0.6901961, 0, 1,
-1.155128, -0.257856, -1.745566, 1, 0.6941177, 0, 1,
-1.15348, -0.3739083, -1.48565, 1, 0.7019608, 0, 1,
-1.143415, 0.9967308, -2.039762, 1, 0.7098039, 0, 1,
-1.138994, 1.221822, 0.3150139, 1, 0.7137255, 0, 1,
-1.129806, -0.3344222, -0.3992685, 1, 0.7215686, 0, 1,
-1.128202, -1.44312, -3.142776, 1, 0.7254902, 0, 1,
-1.118804, 0.5636672, -1.368147, 1, 0.7333333, 0, 1,
-1.118781, -0.1491479, -0.9991385, 1, 0.7372549, 0, 1,
-1.108144, -0.8834666, -2.033881, 1, 0.7450981, 0, 1,
-1.10506, -0.882435, -3.355011, 1, 0.7490196, 0, 1,
-1.104543, -0.4615568, -0.9901517, 1, 0.7568628, 0, 1,
-1.100306, 1.314237, 0.2350278, 1, 0.7607843, 0, 1,
-1.090696, -0.7092296, -2.995775, 1, 0.7686275, 0, 1,
-1.09034, -1.621477, -2.258955, 1, 0.772549, 0, 1,
-1.089486, 0.6863052, -0.370109, 1, 0.7803922, 0, 1,
-1.08837, 0.8647916, -1.302789, 1, 0.7843137, 0, 1,
-1.087326, 1.255567, 0.3700753, 1, 0.7921569, 0, 1,
-1.085659, 0.6744497, -1.516635, 1, 0.7960784, 0, 1,
-1.085514, 0.6657871, -2.421641, 1, 0.8039216, 0, 1,
-1.082715, 0.8611565, -1.401138, 1, 0.8117647, 0, 1,
-1.080633, 0.5560782, -1.978695, 1, 0.8156863, 0, 1,
-1.074229, 0.74218, 0.9316489, 1, 0.8235294, 0, 1,
-1.066404, 0.1816082, -1.669725, 1, 0.827451, 0, 1,
-1.060773, -0.09897256, -0.9659513, 1, 0.8352941, 0, 1,
-1.057161, 0.07755733, -2.621701, 1, 0.8392157, 0, 1,
-1.043377, -1.034748, -2.594373, 1, 0.8470588, 0, 1,
-1.042322, 0.1982359, -2.027459, 1, 0.8509804, 0, 1,
-1.038524, -1.049472, -3.13378, 1, 0.8588235, 0, 1,
-1.034324, 0.4413223, -2.650355, 1, 0.8627451, 0, 1,
-1.033692, 1.742704, -0.888818, 1, 0.8705882, 0, 1,
-1.030263, -1.808781, -1.025849, 1, 0.8745098, 0, 1,
-1.023065, 0.1281665, -2.007594, 1, 0.8823529, 0, 1,
-1.013992, 0.3588457, -1.391413, 1, 0.8862745, 0, 1,
-1.010853, -1.613486, -1.620086, 1, 0.8941177, 0, 1,
-1.010797, 0.9025832, -2.803045, 1, 0.8980392, 0, 1,
-1.00822, -1.958463, -1.558904, 1, 0.9058824, 0, 1,
-1.007388, -0.9980642, -3.161501, 1, 0.9137255, 0, 1,
-1.00085, 1.636975, 1.998183, 1, 0.9176471, 0, 1,
-0.9987723, -0.4566593, -2.546334, 1, 0.9254902, 0, 1,
-0.9952245, 0.2021824, -2.568634, 1, 0.9294118, 0, 1,
-0.9932591, 1.400833, -0.2042493, 1, 0.9372549, 0, 1,
-0.9868864, 1.666236, -1.141534, 1, 0.9411765, 0, 1,
-0.9845229, 0.2505498, -0.6713918, 1, 0.9490196, 0, 1,
-0.982837, -0.4428902, -2.454102, 1, 0.9529412, 0, 1,
-0.9788783, -0.4875185, -2.978102, 1, 0.9607843, 0, 1,
-0.9723237, -2.56484, -4.580668, 1, 0.9647059, 0, 1,
-0.9665626, -0.4254755, -2.937783, 1, 0.972549, 0, 1,
-0.9650933, 0.5127166, -1.856461, 1, 0.9764706, 0, 1,
-0.9599887, -0.1634568, -1.682373, 1, 0.9843137, 0, 1,
-0.9594582, 0.266697, -1.969849, 1, 0.9882353, 0, 1,
-0.959036, -0.4917882, -4.320168, 1, 0.9960784, 0, 1,
-0.9588783, -0.06782389, -0.7005826, 0.9960784, 1, 0, 1,
-0.9577645, -0.8899423, -2.041636, 0.9921569, 1, 0, 1,
-0.9520779, 0.7121658, -1.04593, 0.9843137, 1, 0, 1,
-0.9446316, 1.054458, -1.299493, 0.9803922, 1, 0, 1,
-0.9397776, -1.81041, -2.435481, 0.972549, 1, 0, 1,
-0.9340543, 0.131683, -0.9905844, 0.9686275, 1, 0, 1,
-0.9222118, -1.323502, -1.884731, 0.9607843, 1, 0, 1,
-0.9123779, 1.525686, 0.7693794, 0.9568627, 1, 0, 1,
-0.9095821, -0.8433224, -3.538371, 0.9490196, 1, 0, 1,
-0.9069082, 1.227449, -0.3540373, 0.945098, 1, 0, 1,
-0.9058449, -0.7403091, -2.490484, 0.9372549, 1, 0, 1,
-0.9041089, 0.2613414, -1.205891, 0.9333333, 1, 0, 1,
-0.899259, -0.3300252, -1.706222, 0.9254902, 1, 0, 1,
-0.8942242, -0.5976253, -1.595502, 0.9215686, 1, 0, 1,
-0.8841361, 1.615141, -0.3972676, 0.9137255, 1, 0, 1,
-0.8807612, 0.6121961, -1.975683, 0.9098039, 1, 0, 1,
-0.8723236, 0.8766125, -1.358236, 0.9019608, 1, 0, 1,
-0.8718873, 0.9642839, -2.739405, 0.8941177, 1, 0, 1,
-0.8704194, -2.132909, -2.816685, 0.8901961, 1, 0, 1,
-0.8660621, 0.5895818, -1.441764, 0.8823529, 1, 0, 1,
-0.8627855, 0.215654, -2.131434, 0.8784314, 1, 0, 1,
-0.8595569, -0.4476322, -2.318011, 0.8705882, 1, 0, 1,
-0.857866, -0.3635532, -3.107095, 0.8666667, 1, 0, 1,
-0.8573925, 0.01974621, -1.829951, 0.8588235, 1, 0, 1,
-0.8571662, 0.3371863, -2.019632, 0.854902, 1, 0, 1,
-0.8503063, 0.7601402, -2.529133, 0.8470588, 1, 0, 1,
-0.8500246, 2.063483, -0.9448326, 0.8431373, 1, 0, 1,
-0.8463275, -0.4449102, -1.537919, 0.8352941, 1, 0, 1,
-0.8433496, -1.274589, -2.617777, 0.8313726, 1, 0, 1,
-0.8406827, 1.308289, -1.436961, 0.8235294, 1, 0, 1,
-0.8388934, -1.414698, -4.498979, 0.8196079, 1, 0, 1,
-0.8366638, -1.672649, -4.494733, 0.8117647, 1, 0, 1,
-0.8263322, -0.2266172, -4.426592, 0.8078431, 1, 0, 1,
-0.8171566, -1.672451, -2.342653, 0.8, 1, 0, 1,
-0.8155873, 0.08057939, -0.7893026, 0.7921569, 1, 0, 1,
-0.8147392, 0.3583133, -2.394029, 0.7882353, 1, 0, 1,
-0.8064827, -0.6246816, -4.816765, 0.7803922, 1, 0, 1,
-0.8055274, -0.06914969, -2.236649, 0.7764706, 1, 0, 1,
-0.8008871, -0.9489478, -1.088376, 0.7686275, 1, 0, 1,
-0.8005086, -0.6757348, -2.816084, 0.7647059, 1, 0, 1,
-0.7964348, -0.1775268, -2.214668, 0.7568628, 1, 0, 1,
-0.792181, -0.2485725, -1.20287, 0.7529412, 1, 0, 1,
-0.7917369, -0.1750968, -2.595545, 0.7450981, 1, 0, 1,
-0.7869131, 0.3418118, -0.1640317, 0.7411765, 1, 0, 1,
-0.7686459, -0.01723975, -1.785285, 0.7333333, 1, 0, 1,
-0.7665851, -0.5264997, -1.748623, 0.7294118, 1, 0, 1,
-0.7656538, 0.7945469, -0.4837093, 0.7215686, 1, 0, 1,
-0.7648557, -0.3962715, -1.133531, 0.7176471, 1, 0, 1,
-0.7621959, -0.602771, -1.566222, 0.7098039, 1, 0, 1,
-0.7583284, 0.5468518, -1.849459, 0.7058824, 1, 0, 1,
-0.7550858, -1.016222, -3.2091, 0.6980392, 1, 0, 1,
-0.7530339, 0.4719672, -1.664366, 0.6901961, 1, 0, 1,
-0.7473394, -2.439376, -2.409773, 0.6862745, 1, 0, 1,
-0.7366887, -0.5932732, -1.30044, 0.6784314, 1, 0, 1,
-0.7338036, 0.3767315, -2.209944, 0.6745098, 1, 0, 1,
-0.7318805, 0.9374303, -0.8261334, 0.6666667, 1, 0, 1,
-0.7293608, -0.2008483, -3.148957, 0.6627451, 1, 0, 1,
-0.726291, 0.8841035, -1.002126, 0.654902, 1, 0, 1,
-0.7256685, -1.903424, -4.014677, 0.6509804, 1, 0, 1,
-0.7207223, -1.451592, -3.598753, 0.6431373, 1, 0, 1,
-0.7160766, -0.547536, -1.986096, 0.6392157, 1, 0, 1,
-0.7155814, -0.1116367, -0.8305053, 0.6313726, 1, 0, 1,
-0.7137083, -1.040205, -3.19811, 0.627451, 1, 0, 1,
-0.7051376, -1.00621, -2.124243, 0.6196079, 1, 0, 1,
-0.6990278, 0.1590162, -0.3587242, 0.6156863, 1, 0, 1,
-0.698758, -0.1884394, -1.602453, 0.6078432, 1, 0, 1,
-0.6913767, 1.31689, -0.9310118, 0.6039216, 1, 0, 1,
-0.6891321, -0.201957, -1.928902, 0.5960785, 1, 0, 1,
-0.6878516, -0.4605605, -2.587848, 0.5882353, 1, 0, 1,
-0.6853581, 0.0191978, -2.053955, 0.5843138, 1, 0, 1,
-0.6825795, 0.1706218, -1.394331, 0.5764706, 1, 0, 1,
-0.677184, 0.4069123, 1.219911, 0.572549, 1, 0, 1,
-0.6725821, 0.7828076, -1.216825, 0.5647059, 1, 0, 1,
-0.670665, 0.3793139, -1.044927, 0.5607843, 1, 0, 1,
-0.669199, 0.1713969, -1.704509, 0.5529412, 1, 0, 1,
-0.6617107, -0.4718663, -3.560637, 0.5490196, 1, 0, 1,
-0.6491952, -0.1817097, -3.698675, 0.5411765, 1, 0, 1,
-0.643708, 0.7148879, -0.135487, 0.5372549, 1, 0, 1,
-0.6435764, 1.698427, 1.342618, 0.5294118, 1, 0, 1,
-0.6425134, 1.186213, -1.655339, 0.5254902, 1, 0, 1,
-0.6425015, -0.455839, -1.53966, 0.5176471, 1, 0, 1,
-0.6387151, 0.4362189, -0.6613749, 0.5137255, 1, 0, 1,
-0.6367162, -1.018383, -3.320573, 0.5058824, 1, 0, 1,
-0.6267599, 1.066769, -1.584783, 0.5019608, 1, 0, 1,
-0.6263158, -0.1295827, -1.689815, 0.4941176, 1, 0, 1,
-0.6261169, 0.2856159, -1.100174, 0.4862745, 1, 0, 1,
-0.625102, -0.5773935, -4.796076, 0.4823529, 1, 0, 1,
-0.621613, 0.09178314, -2.016461, 0.4745098, 1, 0, 1,
-0.6196366, 0.7906405, -1.314426, 0.4705882, 1, 0, 1,
-0.6179941, 0.5805176, -0.5268602, 0.4627451, 1, 0, 1,
-0.612087, 0.2586085, -1.381625, 0.4588235, 1, 0, 1,
-0.6101675, -2.112751, -1.945393, 0.4509804, 1, 0, 1,
-0.6074483, 0.7219642, -1.047083, 0.4470588, 1, 0, 1,
-0.6029611, -0.7384455, -3.727425, 0.4392157, 1, 0, 1,
-0.6025042, -1.187316, -3.585603, 0.4352941, 1, 0, 1,
-0.6010264, -0.1686974, -1.051301, 0.427451, 1, 0, 1,
-0.6007715, -0.3297586, -2.81675, 0.4235294, 1, 0, 1,
-0.5903399, -0.9991358, -2.181783, 0.4156863, 1, 0, 1,
-0.5881271, 0.07218962, -0.9443824, 0.4117647, 1, 0, 1,
-0.5875451, -0.6166304, -2.894628, 0.4039216, 1, 0, 1,
-0.5866813, 0.953248, -0.8895639, 0.3960784, 1, 0, 1,
-0.5830561, -0.1230456, -0.2526602, 0.3921569, 1, 0, 1,
-0.5807263, -0.2208937, -2.355021, 0.3843137, 1, 0, 1,
-0.5761185, -0.05141767, -1.537328, 0.3803922, 1, 0, 1,
-0.5726508, 0.5804568, -0.01581725, 0.372549, 1, 0, 1,
-0.5684004, -0.07345586, -2.807076, 0.3686275, 1, 0, 1,
-0.5681928, 0.4595817, -0.7145351, 0.3607843, 1, 0, 1,
-0.5633883, 0.2097779, -0.7707067, 0.3568628, 1, 0, 1,
-0.5624586, 0.3002378, -0.2913862, 0.3490196, 1, 0, 1,
-0.5621929, 0.5250289, -0.9905604, 0.345098, 1, 0, 1,
-0.5615013, -1.861455, -2.809439, 0.3372549, 1, 0, 1,
-0.5605747, -0.2036563, -0.3714523, 0.3333333, 1, 0, 1,
-0.5593595, 0.1192789, -1.614235, 0.3254902, 1, 0, 1,
-0.5586505, -0.09382556, -1.771948, 0.3215686, 1, 0, 1,
-0.5582854, 1.636208, -0.8060828, 0.3137255, 1, 0, 1,
-0.5552545, -0.2278038, -1.608807, 0.3098039, 1, 0, 1,
-0.5534831, 0.09458533, -2.149887, 0.3019608, 1, 0, 1,
-0.5526149, 0.5069786, -2.752705, 0.2941177, 1, 0, 1,
-0.5488924, -0.7743825, -1.718502, 0.2901961, 1, 0, 1,
-0.5475456, -0.540873, -1.822549, 0.282353, 1, 0, 1,
-0.5414531, -0.7336114, -0.7918954, 0.2784314, 1, 0, 1,
-0.5389698, -1.099947, -2.915904, 0.2705882, 1, 0, 1,
-0.5374206, 0.4754018, -1.413074, 0.2666667, 1, 0, 1,
-0.5369493, 0.7483079, -0.6822712, 0.2588235, 1, 0, 1,
-0.5304772, -0.960893, -4.816697, 0.254902, 1, 0, 1,
-0.5290767, -0.5817884, -2.545029, 0.2470588, 1, 0, 1,
-0.5272213, 2.193299, -0.03021278, 0.2431373, 1, 0, 1,
-0.52109, -0.8469092, -4.357633, 0.2352941, 1, 0, 1,
-0.5208011, -0.0415214, -2.015597, 0.2313726, 1, 0, 1,
-0.5196702, -1.031367, -3.374166, 0.2235294, 1, 0, 1,
-0.5182866, -0.6002406, -2.780479, 0.2196078, 1, 0, 1,
-0.5165018, 0.9444609, 0.06990822, 0.2117647, 1, 0, 1,
-0.5161059, 1.886799, -0.1349911, 0.2078431, 1, 0, 1,
-0.5131019, 0.4648361, 0.2322761, 0.2, 1, 0, 1,
-0.51099, -0.1642188, -1.147868, 0.1921569, 1, 0, 1,
-0.5106508, 1.555034, 0.3279559, 0.1882353, 1, 0, 1,
-0.5068082, -0.3874885, -3.373194, 0.1803922, 1, 0, 1,
-0.5064957, 0.06492038, -0.09362467, 0.1764706, 1, 0, 1,
-0.5061813, -0.01319385, -1.230613, 0.1686275, 1, 0, 1,
-0.5046318, 1.481277, -3.065694, 0.1647059, 1, 0, 1,
-0.5030184, 0.7363003, -0.9752196, 0.1568628, 1, 0, 1,
-0.4980386, -0.7166145, -2.62565, 0.1529412, 1, 0, 1,
-0.4979717, 0.437014, -1.378991, 0.145098, 1, 0, 1,
-0.4872642, -2.009687, -3.215693, 0.1411765, 1, 0, 1,
-0.4823259, 1.076089, -2.468835, 0.1333333, 1, 0, 1,
-0.4818015, -2.05519, -3.081441, 0.1294118, 1, 0, 1,
-0.478672, -0.297853, -3.364914, 0.1215686, 1, 0, 1,
-0.4779391, -0.7938199, -2.401501, 0.1176471, 1, 0, 1,
-0.4759832, -0.1179951, 0.2457835, 0.1098039, 1, 0, 1,
-0.4678065, 0.5620322, 1.021395, 0.1058824, 1, 0, 1,
-0.4676872, -1.660671, -3.27104, 0.09803922, 1, 0, 1,
-0.4662457, -0.3518409, -2.377736, 0.09019608, 1, 0, 1,
-0.4632538, 0.734181, 0.5722854, 0.08627451, 1, 0, 1,
-0.461631, 1.1084, -0.5078998, 0.07843138, 1, 0, 1,
-0.4593022, 1.013605, 0.6552311, 0.07450981, 1, 0, 1,
-0.4549944, 1.794466, -0.4629239, 0.06666667, 1, 0, 1,
-0.4549482, -1.143922, -3.554866, 0.0627451, 1, 0, 1,
-0.4478231, -0.0320582, -1.838943, 0.05490196, 1, 0, 1,
-0.4447362, 0.7466345, 0.8703485, 0.05098039, 1, 0, 1,
-0.4445481, 1.686927, -0.596709, 0.04313726, 1, 0, 1,
-0.4433264, 0.6991807, 0.1646897, 0.03921569, 1, 0, 1,
-0.4417079, -1.963765, -3.177143, 0.03137255, 1, 0, 1,
-0.4373945, -0.268721, -2.389559, 0.02745098, 1, 0, 1,
-0.4373886, -0.08009438, -1.110894, 0.01960784, 1, 0, 1,
-0.4357, 1.126614, -1.192123, 0.01568628, 1, 0, 1,
-0.4265206, -0.811381, -0.7045398, 0.007843138, 1, 0, 1,
-0.4247821, 1.750896, -0.3795836, 0.003921569, 1, 0, 1,
-0.424551, -0.6207618, -1.341944, 0, 1, 0.003921569, 1,
-0.4230341, -0.899415, -2.187415, 0, 1, 0.01176471, 1,
-0.4227089, 0.5827136, -0.9667941, 0, 1, 0.01568628, 1,
-0.4213351, 0.7567633, -1.695606, 0, 1, 0.02352941, 1,
-0.4180591, -0.04346406, -3.704876, 0, 1, 0.02745098, 1,
-0.4177871, -0.4944114, -1.411018, 0, 1, 0.03529412, 1,
-0.4176389, -0.769293, -3.947505, 0, 1, 0.03921569, 1,
-0.4168451, 0.1798449, -2.766771, 0, 1, 0.04705882, 1,
-0.4156696, -1.783674, -2.918608, 0, 1, 0.05098039, 1,
-0.4141134, 1.325004, -1.53086, 0, 1, 0.05882353, 1,
-0.4127764, -1.80643, -2.573445, 0, 1, 0.0627451, 1,
-0.4124977, -0.3949928, -4.006913, 0, 1, 0.07058824, 1,
-0.4119779, 0.08156323, -0.8130136, 0, 1, 0.07450981, 1,
-0.410477, -0.68411, -0.9434357, 0, 1, 0.08235294, 1,
-0.4103726, -1.07829, -2.085617, 0, 1, 0.08627451, 1,
-0.4083894, -1.108472, -4.184389, 0, 1, 0.09411765, 1,
-0.4054407, -0.774906, -3.279278, 0, 1, 0.1019608, 1,
-0.4033321, -1.195795, -2.434346, 0, 1, 0.1058824, 1,
-0.4028409, -0.1703469, -1.761751, 0, 1, 0.1137255, 1,
-0.399664, -0.3348063, -2.722241, 0, 1, 0.1176471, 1,
-0.3975448, -0.5612324, -1.73714, 0, 1, 0.1254902, 1,
-0.3957924, 0.1785147, -1.487844, 0, 1, 0.1294118, 1,
-0.3910938, -0.2986815, -0.7166554, 0, 1, 0.1372549, 1,
-0.3899437, 1.126645, -0.8026831, 0, 1, 0.1411765, 1,
-0.3821934, 0.04901076, -2.6528, 0, 1, 0.1490196, 1,
-0.3814836, 0.7670501, 0.8257579, 0, 1, 0.1529412, 1,
-0.3791417, -0.1932792, -3.089734, 0, 1, 0.1607843, 1,
-0.3728766, 0.7523887, -1.008476, 0, 1, 0.1647059, 1,
-0.3701708, -0.514949, -4.349939, 0, 1, 0.172549, 1,
-0.3699895, -0.8426804, -5.202229, 0, 1, 0.1764706, 1,
-0.3683208, 0.1520365, -0.3292, 0, 1, 0.1843137, 1,
-0.3590418, -0.8166245, -3.390978, 0, 1, 0.1882353, 1,
-0.3576762, -1.268551, -2.259293, 0, 1, 0.1960784, 1,
-0.3564298, 0.4225233, -1.677143, 0, 1, 0.2039216, 1,
-0.3562523, -0.3548015, -3.179522, 0, 1, 0.2078431, 1,
-0.3545176, -0.2006116, -1.921519, 0, 1, 0.2156863, 1,
-0.3535654, -1.68229, -2.561862, 0, 1, 0.2196078, 1,
-0.3522761, 0.5714981, -2.859178, 0, 1, 0.227451, 1,
-0.3521052, -2.220716, -3.029016, 0, 1, 0.2313726, 1,
-0.350959, 0.8764026, -0.9630191, 0, 1, 0.2392157, 1,
-0.3374263, -1.127074, -3.208322, 0, 1, 0.2431373, 1,
-0.33719, 0.2633775, -1.478536, 0, 1, 0.2509804, 1,
-0.3279839, -0.6108063, -5.105592, 0, 1, 0.254902, 1,
-0.326135, 0.9913175, -0.711744, 0, 1, 0.2627451, 1,
-0.3256175, 1.988326, 2.047437, 0, 1, 0.2666667, 1,
-0.3241539, 0.342293, -1.912804, 0, 1, 0.2745098, 1,
-0.3231757, -1.930165, -3.722946, 0, 1, 0.2784314, 1,
-0.3137107, -0.2363064, -2.704006, 0, 1, 0.2862745, 1,
-0.3110043, -0.5383855, -3.651877, 0, 1, 0.2901961, 1,
-0.307355, -0.716855, -2.299129, 0, 1, 0.2980392, 1,
-0.3052393, 1.515813, -0.9353811, 0, 1, 0.3058824, 1,
-0.3047791, -2.212718, -3.262264, 0, 1, 0.3098039, 1,
-0.3047212, 0.5260114, 0.7227348, 0, 1, 0.3176471, 1,
-0.3030605, -0.4437833, -1.475328, 0, 1, 0.3215686, 1,
-0.3000346, -0.4936842, -2.906923, 0, 1, 0.3294118, 1,
-0.2971851, 0.1462477, -1.406255, 0, 1, 0.3333333, 1,
-0.2970611, -0.5040528, -1.804758, 0, 1, 0.3411765, 1,
-0.2919033, -2.508209, -2.280174, 0, 1, 0.345098, 1,
-0.2910889, -0.05383255, -1.87701, 0, 1, 0.3529412, 1,
-0.2910504, -0.260677, -1.753752, 0, 1, 0.3568628, 1,
-0.2902098, 0.9408447, -1.030241, 0, 1, 0.3647059, 1,
-0.2897894, -1.006885, -3.074095, 0, 1, 0.3686275, 1,
-0.2884909, -0.5702366, -1.205811, 0, 1, 0.3764706, 1,
-0.2842738, -0.02129502, -2.815286, 0, 1, 0.3803922, 1,
-0.2825237, 0.8788084, 0.173453, 0, 1, 0.3882353, 1,
-0.281545, 0.7521127, 0.4325445, 0, 1, 0.3921569, 1,
-0.280206, -0.680489, -3.198228, 0, 1, 0.4, 1,
-0.2786544, 0.8598944, 1.969211, 0, 1, 0.4078431, 1,
-0.277307, 1.126969, -2.016279, 0, 1, 0.4117647, 1,
-0.2771943, -0.1472079, -1.972096, 0, 1, 0.4196078, 1,
-0.2738369, 0.03588818, -0.5422466, 0, 1, 0.4235294, 1,
-0.2723489, 0.9443503, 1.132492, 0, 1, 0.4313726, 1,
-0.2694578, 0.7066039, -1.710576, 0, 1, 0.4352941, 1,
-0.2674329, 2.419944, 0.3981075, 0, 1, 0.4431373, 1,
-0.267056, 0.354456, -0.4194437, 0, 1, 0.4470588, 1,
-0.2662092, 0.4486249, -1.000484, 0, 1, 0.454902, 1,
-0.2621928, -0.6933888, -4.203411, 0, 1, 0.4588235, 1,
-0.2611466, 0.3082173, -0.1355678, 0, 1, 0.4666667, 1,
-0.255815, 0.5167801, 1.562756, 0, 1, 0.4705882, 1,
-0.2554356, 0.2102096, -1.079971, 0, 1, 0.4784314, 1,
-0.2551998, -1.082901, -1.771388, 0, 1, 0.4823529, 1,
-0.252874, -0.8147666, -2.598222, 0, 1, 0.4901961, 1,
-0.252466, 0.5490034, -0.4506875, 0, 1, 0.4941176, 1,
-0.2516782, 0.4212246, 0.2366823, 0, 1, 0.5019608, 1,
-0.2502309, 1.151006, 0.1960181, 0, 1, 0.509804, 1,
-0.2496739, -1.285832, -2.538255, 0, 1, 0.5137255, 1,
-0.2453783, 1.12685, -1.009033, 0, 1, 0.5215687, 1,
-0.2442686, -0.4444362, -1.510725, 0, 1, 0.5254902, 1,
-0.2395057, 0.1673999, -0.3800213, 0, 1, 0.5333334, 1,
-0.2388076, 0.6159992, -0.2215911, 0, 1, 0.5372549, 1,
-0.2383535, 1.30095, -0.04433074, 0, 1, 0.5450981, 1,
-0.2281942, -0.1653445, -2.806707, 0, 1, 0.5490196, 1,
-0.2278381, 0.9173635, 0.6878901, 0, 1, 0.5568628, 1,
-0.223847, -1.197525, -3.325, 0, 1, 0.5607843, 1,
-0.2234271, -1.078029, -4.246427, 0, 1, 0.5686275, 1,
-0.2175168, -0.9934604, -2.458278, 0, 1, 0.572549, 1,
-0.2145095, 1.270441, -1.259074, 0, 1, 0.5803922, 1,
-0.2057223, -1.085321, -2.080304, 0, 1, 0.5843138, 1,
-0.2044323, -1.631246, -1.959712, 0, 1, 0.5921569, 1,
-0.1990337, -1.568622, -3.609045, 0, 1, 0.5960785, 1,
-0.1973532, -0.669422, -3.471516, 0, 1, 0.6039216, 1,
-0.1972497, -1.645162, -3.579477, 0, 1, 0.6117647, 1,
-0.1968851, -0.7179483, -4.763827, 0, 1, 0.6156863, 1,
-0.1955501, -1.857945, -5.509284, 0, 1, 0.6235294, 1,
-0.1948411, 0.7553611, -0.6554894, 0, 1, 0.627451, 1,
-0.1944284, 0.7103765, -1.347592, 0, 1, 0.6352941, 1,
-0.1922564, 0.3036406, -0.2056516, 0, 1, 0.6392157, 1,
-0.1920982, 0.6941121, 0.6244452, 0, 1, 0.6470588, 1,
-0.1883145, 0.2018963, 0.511838, 0, 1, 0.6509804, 1,
-0.1877442, 0.4602083, 0.2669823, 0, 1, 0.6588235, 1,
-0.1824465, 1.285887, 1.009168, 0, 1, 0.6627451, 1,
-0.1783372, 1.727977, -2.234841, 0, 1, 0.6705883, 1,
-0.1750204, 0.3524481, -0.239527, 0, 1, 0.6745098, 1,
-0.1730297, 1.605704, -0.7634758, 0, 1, 0.682353, 1,
-0.1697854, -1.246179, -2.942297, 0, 1, 0.6862745, 1,
-0.167882, 0.3700089, -0.868995, 0, 1, 0.6941177, 1,
-0.1638782, 1.715522, 2.262054, 0, 1, 0.7019608, 1,
-0.1624285, 0.7968026, -1.084567, 0, 1, 0.7058824, 1,
-0.1602112, 1.364739, 0.1954506, 0, 1, 0.7137255, 1,
-0.1539654, -1.89518, -2.408739, 0, 1, 0.7176471, 1,
-0.1523975, 0.4887766, 0.1883471, 0, 1, 0.7254902, 1,
-0.1514034, 0.8379465, -0.4829707, 0, 1, 0.7294118, 1,
-0.149787, -0.02948002, -3.310112, 0, 1, 0.7372549, 1,
-0.1454311, -1.022049, -0.1022534, 0, 1, 0.7411765, 1,
-0.1395278, -0.01305407, -2.385113, 0, 1, 0.7490196, 1,
-0.1392877, -2.130985, -3.173924, 0, 1, 0.7529412, 1,
-0.1387863, -1.126994, -3.337861, 0, 1, 0.7607843, 1,
-0.1294659, -0.1049686, -2.309747, 0, 1, 0.7647059, 1,
-0.1279012, 0.8075893, -1.888788, 0, 1, 0.772549, 1,
-0.1173311, 0.02043557, -2.851947, 0, 1, 0.7764706, 1,
-0.1169607, -0.2964361, -4.545687, 0, 1, 0.7843137, 1,
-0.1135196, -0.2198909, -3.489312, 0, 1, 0.7882353, 1,
-0.1091441, 0.7308876, -0.8870739, 0, 1, 0.7960784, 1,
-0.1088413, 0.2149924, -0.8573147, 0, 1, 0.8039216, 1,
-0.108046, -0.3188386, -3.391046, 0, 1, 0.8078431, 1,
-0.1073562, 0.4691034, -1.450147, 0, 1, 0.8156863, 1,
-0.102484, 0.9949284, 0.2501054, 0, 1, 0.8196079, 1,
-0.1006454, -1.48439, -1.879449, 0, 1, 0.827451, 1,
-0.09721581, -1.544114, -3.299071, 0, 1, 0.8313726, 1,
-0.09535839, 0.4630001, -1.525169, 0, 1, 0.8392157, 1,
-0.09359926, -1.379962, -4.295197, 0, 1, 0.8431373, 1,
-0.09155581, -0.9216865, -4.703105, 0, 1, 0.8509804, 1,
-0.08112486, -1.885117, -2.869831, 0, 1, 0.854902, 1,
-0.07644485, -0.01170222, -3.28203, 0, 1, 0.8627451, 1,
-0.07107016, 0.8584111, -1.712417, 0, 1, 0.8666667, 1,
-0.0675851, 1.65053, 1.182341, 0, 1, 0.8745098, 1,
-0.05726332, -0.1747585, -1.750782, 0, 1, 0.8784314, 1,
-0.05596693, 1.17461, -0.9933184, 0, 1, 0.8862745, 1,
-0.05392702, 0.8955918, -0.1817532, 0, 1, 0.8901961, 1,
-0.05312985, -0.05098885, -0.3374376, 0, 1, 0.8980392, 1,
-0.04986564, -0.414744, -3.032163, 0, 1, 0.9058824, 1,
-0.04876343, 0.3559173, 0.2469185, 0, 1, 0.9098039, 1,
-0.0449466, -0.177113, -1.054241, 0, 1, 0.9176471, 1,
-0.04411016, 0.6994033, 2.227132, 0, 1, 0.9215686, 1,
-0.04283941, 0.8041735, -0.7044969, 0, 1, 0.9294118, 1,
-0.04035176, 0.1430211, -1.898214, 0, 1, 0.9333333, 1,
-0.03281261, 1.224566, 0.7902769, 0, 1, 0.9411765, 1,
-0.02476798, 0.4458513, -0.1266363, 0, 1, 0.945098, 1,
-0.02193054, -0.1705932, -3.002278, 0, 1, 0.9529412, 1,
-0.02047761, 1.375889, 0.1671727, 0, 1, 0.9568627, 1,
-0.01759678, 0.660094, 0.5162209, 0, 1, 0.9647059, 1,
-0.0144222, -0.06909712, -1.853701, 0, 1, 0.9686275, 1,
-0.007811237, 1.573363, -0.9719172, 0, 1, 0.9764706, 1,
-0.006983099, -0.3340893, -3.034955, 0, 1, 0.9803922, 1,
-0.006226972, 0.530609, -2.09428, 0, 1, 0.9882353, 1,
-0.005921653, -0.3622213, -2.516232, 0, 1, 0.9921569, 1,
-0.002908773, -0.5096764, -2.505568, 0, 1, 1, 1,
0.005059281, 0.2342152, -1.171144, 0, 0.9921569, 1, 1,
0.007257309, 0.07863732, -0.808753, 0, 0.9882353, 1, 1,
0.008470532, -1.75457, 3.367378, 0, 0.9803922, 1, 1,
0.01042885, 0.3881081, 0.2624373, 0, 0.9764706, 1, 1,
0.01076564, -2.038629, 1.957085, 0, 0.9686275, 1, 1,
0.01141779, -0.9043347, 4.403966, 0, 0.9647059, 1, 1,
0.01459066, 1.219222, 1.767633, 0, 0.9568627, 1, 1,
0.01578076, -0.4510851, 3.584692, 0, 0.9529412, 1, 1,
0.01871465, -0.879853, 4.424235, 0, 0.945098, 1, 1,
0.01992836, -2.197299, 3.792412, 0, 0.9411765, 1, 1,
0.02056653, 0.3332163, 0.3368059, 0, 0.9333333, 1, 1,
0.02068986, 0.9091383, 0.4853403, 0, 0.9294118, 1, 1,
0.02074755, -1.383499, 2.757519, 0, 0.9215686, 1, 1,
0.02162204, 0.2991104, -0.5651699, 0, 0.9176471, 1, 1,
0.02367184, -1.237977, 0.2839135, 0, 0.9098039, 1, 1,
0.02609111, -1.473968, 3.300589, 0, 0.9058824, 1, 1,
0.0301839, 1.088189, 0.2113357, 0, 0.8980392, 1, 1,
0.03097898, 1.345879, -0.1719218, 0, 0.8901961, 1, 1,
0.03322484, -0.6482017, 1.461145, 0, 0.8862745, 1, 1,
0.03866472, -0.2972211, 3.992211, 0, 0.8784314, 1, 1,
0.03948593, -0.8812623, 3.201729, 0, 0.8745098, 1, 1,
0.04207716, 1.465922, 0.1808326, 0, 0.8666667, 1, 1,
0.05694925, -0.02358293, 2.096267, 0, 0.8627451, 1, 1,
0.0595306, -0.1635025, 2.75204, 0, 0.854902, 1, 1,
0.06203105, -0.9153347, 3.116647, 0, 0.8509804, 1, 1,
0.06295149, 1.526062, 1.073396, 0, 0.8431373, 1, 1,
0.06631387, 0.5018672, 0.3024668, 0, 0.8392157, 1, 1,
0.06836571, -0.3810043, 2.297904, 0, 0.8313726, 1, 1,
0.06837744, 1.445282, 1.645888, 0, 0.827451, 1, 1,
0.07453911, 1.470897, -0.4030693, 0, 0.8196079, 1, 1,
0.07496596, -1.216006, 2.041732, 0, 0.8156863, 1, 1,
0.0764429, 1.497705, 0.3715337, 0, 0.8078431, 1, 1,
0.07734568, 0.3997255, 0.6511924, 0, 0.8039216, 1, 1,
0.08291001, 0.2938307, -0.02378646, 0, 0.7960784, 1, 1,
0.08308385, -2.649161, 2.949245, 0, 0.7882353, 1, 1,
0.08438808, 0.1598657, 0.6231109, 0, 0.7843137, 1, 1,
0.0877859, -0.2811445, 3.407403, 0, 0.7764706, 1, 1,
0.09283662, -1.087979, 2.125932, 0, 0.772549, 1, 1,
0.09664964, -2.17907, 3.425928, 0, 0.7647059, 1, 1,
0.1021449, 0.9952164, -0.7806823, 0, 0.7607843, 1, 1,
0.1085269, 0.7908846, -0.5369523, 0, 0.7529412, 1, 1,
0.1088298, -0.0790843, 2.047355, 0, 0.7490196, 1, 1,
0.109751, 0.4508158, 0.8428896, 0, 0.7411765, 1, 1,
0.1156816, 0.3144508, -0.3309349, 0, 0.7372549, 1, 1,
0.1161375, 0.383687, 0.9905888, 0, 0.7294118, 1, 1,
0.1189114, -0.2726001, 1.835943, 0, 0.7254902, 1, 1,
0.1231477, -0.2332362, 2.262685, 0, 0.7176471, 1, 1,
0.1247831, -0.1861366, 1.351212, 0, 0.7137255, 1, 1,
0.126545, 2.389277, 0.2239767, 0, 0.7058824, 1, 1,
0.1284014, 2.69322, 0.7398215, 0, 0.6980392, 1, 1,
0.1284452, -0.4013037, 3.150992, 0, 0.6941177, 1, 1,
0.1321051, 2.112796, -1.133651, 0, 0.6862745, 1, 1,
0.1328616, -0.5539543, 2.686386, 0, 0.682353, 1, 1,
0.1364001, -0.4609382, 3.359743, 0, 0.6745098, 1, 1,
0.1371329, 1.196417, 1.859424, 0, 0.6705883, 1, 1,
0.1444544, 0.7889165, -0.853188, 0, 0.6627451, 1, 1,
0.1447341, 1.52351, -0.560622, 0, 0.6588235, 1, 1,
0.1510996, -1.438989, 2.885627, 0, 0.6509804, 1, 1,
0.1535738, 1.973808, -1.608349, 0, 0.6470588, 1, 1,
0.1562544, 0.1395692, -0.03689367, 0, 0.6392157, 1, 1,
0.1562922, -2.309798, 1.964413, 0, 0.6352941, 1, 1,
0.1575144, -0.7162856, 2.862306, 0, 0.627451, 1, 1,
0.163458, 1.981036, 1.510589, 0, 0.6235294, 1, 1,
0.1769131, 0.9301586, 0.6428336, 0, 0.6156863, 1, 1,
0.177011, 0.9401397, 1.483391, 0, 0.6117647, 1, 1,
0.1770964, 0.4677199, -1.482128, 0, 0.6039216, 1, 1,
0.1783879, 2.252986, -0.8997975, 0, 0.5960785, 1, 1,
0.1834862, 0.02188722, 1.127156, 0, 0.5921569, 1, 1,
0.1847895, -0.0459309, 0.6739298, 0, 0.5843138, 1, 1,
0.1867698, -0.0696404, 0.5168635, 0, 0.5803922, 1, 1,
0.1877274, 0.6458681, 1.457729, 0, 0.572549, 1, 1,
0.1958895, 1.62147, -0.2900339, 0, 0.5686275, 1, 1,
0.1966127, -0.4520834, 3.307225, 0, 0.5607843, 1, 1,
0.1986074, 0.6445143, 1.423235, 0, 0.5568628, 1, 1,
0.1990312, -0.7519087, 0.6313024, 0, 0.5490196, 1, 1,
0.1990751, -0.6075316, 3.571736, 0, 0.5450981, 1, 1,
0.2000293, 1.522248, -0.7200483, 0, 0.5372549, 1, 1,
0.2010675, 0.5934894, -0.1494011, 0, 0.5333334, 1, 1,
0.2013167, 0.5161238, 1.347751, 0, 0.5254902, 1, 1,
0.2013473, -0.2205138, 2.403641, 0, 0.5215687, 1, 1,
0.2028641, -0.9907174, 3.586323, 0, 0.5137255, 1, 1,
0.2059299, 1.242514, 2.215442, 0, 0.509804, 1, 1,
0.2077174, -1.30909, 2.500515, 0, 0.5019608, 1, 1,
0.2101402, 0.05429164, 1.316332, 0, 0.4941176, 1, 1,
0.2110271, 1.795188, 1.672049, 0, 0.4901961, 1, 1,
0.2124577, 1.466183, -2.047229, 0, 0.4823529, 1, 1,
0.2126082, 0.1422552, -0.21121, 0, 0.4784314, 1, 1,
0.2165076, 0.5603951, 2.24595, 0, 0.4705882, 1, 1,
0.2255333, -1.301043, 3.235091, 0, 0.4666667, 1, 1,
0.2264513, 0.5535777, -0.8545172, 0, 0.4588235, 1, 1,
0.2265594, 0.089077, 2.674147, 0, 0.454902, 1, 1,
0.2266568, 0.74273, 2.649748, 0, 0.4470588, 1, 1,
0.2282326, -0.3536869, 3.329458, 0, 0.4431373, 1, 1,
0.2303955, -3.103031, 2.867573, 0, 0.4352941, 1, 1,
0.2388057, 0.274902, 0.8750854, 0, 0.4313726, 1, 1,
0.2391712, 0.2348221, 0.8407186, 0, 0.4235294, 1, 1,
0.2403004, 1.001057, 1.854858, 0, 0.4196078, 1, 1,
0.2545294, 0.8190407, -1.46158, 0, 0.4117647, 1, 1,
0.2612263, 0.677811, 0.2836463, 0, 0.4078431, 1, 1,
0.2622599, -0.4559557, 1.148423, 0, 0.4, 1, 1,
0.2629046, 1.108004, 0.04424183, 0, 0.3921569, 1, 1,
0.2687562, 0.1620203, 1.595243, 0, 0.3882353, 1, 1,
0.2689106, 0.7399345, 0.5370439, 0, 0.3803922, 1, 1,
0.2690012, -0.2238793, 1.146175, 0, 0.3764706, 1, 1,
0.2692266, 1.146016, -0.1552195, 0, 0.3686275, 1, 1,
0.2713864, 1.436117, -0.2124099, 0, 0.3647059, 1, 1,
0.2714617, 0.4311932, -0.7492746, 0, 0.3568628, 1, 1,
0.2776662, 1.793043, 0.114418, 0, 0.3529412, 1, 1,
0.2837512, -0.006692605, 0.05587196, 0, 0.345098, 1, 1,
0.2837807, -0.6547672, 2.305354, 0, 0.3411765, 1, 1,
0.2855943, 0.3589776, -0.1499823, 0, 0.3333333, 1, 1,
0.2907497, -0.5119904, 1.515462, 0, 0.3294118, 1, 1,
0.2929801, 0.300537, 0.6514811, 0, 0.3215686, 1, 1,
0.295052, -1.031837, 2.841157, 0, 0.3176471, 1, 1,
0.2972555, -1.119012, 2.885144, 0, 0.3098039, 1, 1,
0.3017819, -0.8273293, 3.431409, 0, 0.3058824, 1, 1,
0.3018326, 0.1479578, -0.1632015, 0, 0.2980392, 1, 1,
0.3060759, -2.060328, 2.938767, 0, 0.2901961, 1, 1,
0.3078472, -2.490515, 4.31428, 0, 0.2862745, 1, 1,
0.3095728, -1.007369, 3.325489, 0, 0.2784314, 1, 1,
0.3156168, -0.5831589, 2.419438, 0, 0.2745098, 1, 1,
0.3168936, 1.525164, 0.2944117, 0, 0.2666667, 1, 1,
0.3176395, 0.2409014, 0.5038115, 0, 0.2627451, 1, 1,
0.3180199, 1.311004, -1.311125, 0, 0.254902, 1, 1,
0.3231461, -0.5229698, 2.563412, 0, 0.2509804, 1, 1,
0.3246882, 2.448967, -0.4145794, 0, 0.2431373, 1, 1,
0.3248101, -0.6021555, 3.242209, 0, 0.2392157, 1, 1,
0.3278329, -1.04802, 1.768854, 0, 0.2313726, 1, 1,
0.3293878, -0.2647901, 2.00162, 0, 0.227451, 1, 1,
0.3301398, -0.1351339, 2.202424, 0, 0.2196078, 1, 1,
0.3311085, 1.96315, -0.05564373, 0, 0.2156863, 1, 1,
0.3319957, 0.3333693, -0.7013413, 0, 0.2078431, 1, 1,
0.3330978, -1.336704, 3.590799, 0, 0.2039216, 1, 1,
0.3350661, -0.6853819, 2.272735, 0, 0.1960784, 1, 1,
0.3415308, -0.5654643, 4.252634, 0, 0.1882353, 1, 1,
0.3525624, -0.6465304, 2.855855, 0, 0.1843137, 1, 1,
0.353252, 0.2894172, 2.694545, 0, 0.1764706, 1, 1,
0.3533745, -0.8631904, 3.578025, 0, 0.172549, 1, 1,
0.3538243, -0.3867683, 1.387679, 0, 0.1647059, 1, 1,
0.358907, 0.06566393, 0.7555274, 0, 0.1607843, 1, 1,
0.3631278, 0.9281879, 1.264743, 0, 0.1529412, 1, 1,
0.3673344, 2.321969, -0.5111942, 0, 0.1490196, 1, 1,
0.3678665, -0.6036276, 2.092081, 0, 0.1411765, 1, 1,
0.3705929, 0.005302771, 0.4109312, 0, 0.1372549, 1, 1,
0.3706071, -0.3857069, 1.912025, 0, 0.1294118, 1, 1,
0.3762301, 1.173286, -0.9318978, 0, 0.1254902, 1, 1,
0.3776751, 0.4954864, 0.8321393, 0, 0.1176471, 1, 1,
0.3777485, 0.5828108, 0.7812551, 0, 0.1137255, 1, 1,
0.379519, 1.101627, 0.9387609, 0, 0.1058824, 1, 1,
0.3816453, 0.904974, -0.7837777, 0, 0.09803922, 1, 1,
0.384615, -0.8125135, 1.932105, 0, 0.09411765, 1, 1,
0.387558, 0.885458, 0.9800366, 0, 0.08627451, 1, 1,
0.3876081, -0.8290329, 4.16176, 0, 0.08235294, 1, 1,
0.3927948, 0.8011683, -0.2060639, 0, 0.07450981, 1, 1,
0.3940673, 0.8790222, 2.333616, 0, 0.07058824, 1, 1,
0.3966448, 0.6707748, 0.2083645, 0, 0.0627451, 1, 1,
0.3977855, 1.257638, 0.8837237, 0, 0.05882353, 1, 1,
0.3979152, 0.3561702, 0.5353075, 0, 0.05098039, 1, 1,
0.3980492, 1.405451, 1.960327, 0, 0.04705882, 1, 1,
0.3988198, -0.2450589, 1.970824, 0, 0.03921569, 1, 1,
0.399569, 1.173166, -0.9543912, 0, 0.03529412, 1, 1,
0.4028557, -0.8809035, 0.3880643, 0, 0.02745098, 1, 1,
0.4035056, -2.33882, 3.680093, 0, 0.02352941, 1, 1,
0.407845, -1.229828, 2.891478, 0, 0.01568628, 1, 1,
0.408964, -0.07871415, 1.908799, 0, 0.01176471, 1, 1,
0.4100403, 0.1471327, 1.202624, 0, 0.003921569, 1, 1,
0.4114885, 1.634558, -1.530526, 0.003921569, 0, 1, 1,
0.4165574, 0.1648071, -0.1925559, 0.007843138, 0, 1, 1,
0.4200372, -1.004946, 1.928097, 0.01568628, 0, 1, 1,
0.4233803, -0.5368398, 2.959355, 0.01960784, 0, 1, 1,
0.4252327, 0.2009762, 3.039466, 0.02745098, 0, 1, 1,
0.425898, 0.5291364, -0.7743106, 0.03137255, 0, 1, 1,
0.4282789, 0.4992189, -0.386105, 0.03921569, 0, 1, 1,
0.4292938, 0.9135163, 0.9026781, 0.04313726, 0, 1, 1,
0.4299693, 1.403334, 0.4641425, 0.05098039, 0, 1, 1,
0.4303403, -0.2793566, 3.373727, 0.05490196, 0, 1, 1,
0.4332277, -0.7968785, 3.060685, 0.0627451, 0, 1, 1,
0.4348879, 0.8182462, 1.648814, 0.06666667, 0, 1, 1,
0.4442135, 1.259356, 1.162998, 0.07450981, 0, 1, 1,
0.4485824, 0.9130812, 1.216631, 0.07843138, 0, 1, 1,
0.4562444, -1.096752, 2.601253, 0.08627451, 0, 1, 1,
0.4573552, 0.6437055, 1.659745, 0.09019608, 0, 1, 1,
0.4668302, 0.3662991, 2.088039, 0.09803922, 0, 1, 1,
0.4691816, -1.017345, 2.922894, 0.1058824, 0, 1, 1,
0.4750677, 0.3860145, 0.3634844, 0.1098039, 0, 1, 1,
0.4766881, -0.8334608, 4.135147, 0.1176471, 0, 1, 1,
0.4815242, -1.242891, 2.170764, 0.1215686, 0, 1, 1,
0.4840077, -1.375889, 1.807155, 0.1294118, 0, 1, 1,
0.4854919, 0.5066862, -0.1595513, 0.1333333, 0, 1, 1,
0.4870827, -0.9431224, 2.499613, 0.1411765, 0, 1, 1,
0.4903275, -0.8307107, 2.565707, 0.145098, 0, 1, 1,
0.4915988, -1.509471, 1.613485, 0.1529412, 0, 1, 1,
0.4971025, -1.292661, 1.680459, 0.1568628, 0, 1, 1,
0.4984589, 0.1735951, 1.182963, 0.1647059, 0, 1, 1,
0.4998385, 0.9459415, 0.5157332, 0.1686275, 0, 1, 1,
0.5012, -0.9091488, 2.842871, 0.1764706, 0, 1, 1,
0.5067423, -1.271042, 2.287401, 0.1803922, 0, 1, 1,
0.5082842, 0.9309945, -0.3818754, 0.1882353, 0, 1, 1,
0.5173385, -0.002441214, 1.231646, 0.1921569, 0, 1, 1,
0.5203474, 0.2878796, 0.4463573, 0.2, 0, 1, 1,
0.5223476, 0.3648843, 1.308583, 0.2078431, 0, 1, 1,
0.5341492, -1.458771, 2.832783, 0.2117647, 0, 1, 1,
0.5343974, -1.187828, 1.558948, 0.2196078, 0, 1, 1,
0.5353138, 0.2361158, -0.4319976, 0.2235294, 0, 1, 1,
0.5357484, 0.07174064, 1.978373, 0.2313726, 0, 1, 1,
0.5418174, -0.4119885, 1.790838, 0.2352941, 0, 1, 1,
0.543564, 0.4097909, 0.9773836, 0.2431373, 0, 1, 1,
0.5468439, 0.9371742, -0.1742342, 0.2470588, 0, 1, 1,
0.5490949, 0.7214137, 0.4956556, 0.254902, 0, 1, 1,
0.5575528, 0.2210092, 0.3882628, 0.2588235, 0, 1, 1,
0.5653657, -0.8099917, 1.569795, 0.2666667, 0, 1, 1,
0.5684164, -1.222251, 4.186917, 0.2705882, 0, 1, 1,
0.5727503, -0.4851869, 0.6133, 0.2784314, 0, 1, 1,
0.5758342, -0.2977039, 1.239417, 0.282353, 0, 1, 1,
0.5777478, 0.1539916, 1.398265, 0.2901961, 0, 1, 1,
0.5788858, 1.27014, 0.1912257, 0.2941177, 0, 1, 1,
0.5840113, 2.450035, -0.4723992, 0.3019608, 0, 1, 1,
0.5847109, -0.3388858, 2.04874, 0.3098039, 0, 1, 1,
0.5849033, 0.1484326, 1.454499, 0.3137255, 0, 1, 1,
0.5920827, 1.662752, 2.243336, 0.3215686, 0, 1, 1,
0.5947476, -0.671647, 3.007245, 0.3254902, 0, 1, 1,
0.5949935, 0.3910958, 2.280644, 0.3333333, 0, 1, 1,
0.598452, 1.627676, -0.7981758, 0.3372549, 0, 1, 1,
0.6073078, 0.3189414, 1.027231, 0.345098, 0, 1, 1,
0.6106215, 1.271544, -0.3029913, 0.3490196, 0, 1, 1,
0.6192626, 0.7397781, 0.8099309, 0.3568628, 0, 1, 1,
0.6201593, -0.4926832, 2.944598, 0.3607843, 0, 1, 1,
0.6233416, 0.4289733, 3.438675, 0.3686275, 0, 1, 1,
0.623706, -0.9051346, 5.261387, 0.372549, 0, 1, 1,
0.6282952, -0.5930356, 2.097563, 0.3803922, 0, 1, 1,
0.6334993, 0.4141035, 0.3901252, 0.3843137, 0, 1, 1,
0.6475492, 2.057667, 1.277353, 0.3921569, 0, 1, 1,
0.6478607, -0.8398889, 2.590285, 0.3960784, 0, 1, 1,
0.6496316, -0.2255224, 0.9585608, 0.4039216, 0, 1, 1,
0.650361, -2.423242, 3.516432, 0.4117647, 0, 1, 1,
0.6545725, -2.200779, 2.070117, 0.4156863, 0, 1, 1,
0.6570191, -0.9781206, 3.629677, 0.4235294, 0, 1, 1,
0.6617008, 0.488006, 0.3161268, 0.427451, 0, 1, 1,
0.6649385, -0.01832705, 2.668502, 0.4352941, 0, 1, 1,
0.6652435, 1.364163, 0.3118608, 0.4392157, 0, 1, 1,
0.668363, 0.3883105, 1.373841, 0.4470588, 0, 1, 1,
0.6687548, 1.474097, -0.3908837, 0.4509804, 0, 1, 1,
0.6700959, 1.242101, 1.275815, 0.4588235, 0, 1, 1,
0.6721874, 0.05408937, 1.947501, 0.4627451, 0, 1, 1,
0.672959, 1.119054, -1.421236, 0.4705882, 0, 1, 1,
0.6737911, 0.2779293, 0.1089498, 0.4745098, 0, 1, 1,
0.6782722, -0.4270689, 2.005573, 0.4823529, 0, 1, 1,
0.6811421, 1.815617, 0.5029442, 0.4862745, 0, 1, 1,
0.6836489, 0.4759715, 0.4468257, 0.4941176, 0, 1, 1,
0.6934786, 0.5359726, 0.2801048, 0.5019608, 0, 1, 1,
0.6955705, 0.6408042, 0.4451211, 0.5058824, 0, 1, 1,
0.7031138, -0.939432, 2.412841, 0.5137255, 0, 1, 1,
0.7054556, -0.2097795, 3.101826, 0.5176471, 0, 1, 1,
0.7141811, 1.209818, -0.03009627, 0.5254902, 0, 1, 1,
0.714966, 0.7361246, 0.5420489, 0.5294118, 0, 1, 1,
0.7169433, 1.13623, 0.1571059, 0.5372549, 0, 1, 1,
0.7187784, -1.175135, 3.164468, 0.5411765, 0, 1, 1,
0.7192838, -0.08624535, -0.4140541, 0.5490196, 0, 1, 1,
0.7202961, -0.237274, 2.955932, 0.5529412, 0, 1, 1,
0.7235413, -1.108337, 1.350555, 0.5607843, 0, 1, 1,
0.7283204, -0.05395618, 2.620526, 0.5647059, 0, 1, 1,
0.7410999, 1.003777, 0.98917, 0.572549, 0, 1, 1,
0.743422, -0.6869338, 1.547097, 0.5764706, 0, 1, 1,
0.749046, -0.8434744, 2.34901, 0.5843138, 0, 1, 1,
0.7529727, 0.986676, -1.501426, 0.5882353, 0, 1, 1,
0.7530556, -0.6961447, 0.8004075, 0.5960785, 0, 1, 1,
0.7545554, -0.8495042, 3.045585, 0.6039216, 0, 1, 1,
0.7594395, 0.6176249, 2.886106, 0.6078432, 0, 1, 1,
0.7599356, -1.03203, 2.153628, 0.6156863, 0, 1, 1,
0.7636674, -0.235339, 2.550186, 0.6196079, 0, 1, 1,
0.7694071, 1.321549, 0.0973327, 0.627451, 0, 1, 1,
0.7732069, 1.025053, 0.6747708, 0.6313726, 0, 1, 1,
0.7736366, -0.2073765, 1.805865, 0.6392157, 0, 1, 1,
0.7771684, -0.02526374, 2.350299, 0.6431373, 0, 1, 1,
0.7815921, -1.470898, 2.694462, 0.6509804, 0, 1, 1,
0.7816868, -0.2808614, 1.80995, 0.654902, 0, 1, 1,
0.7836501, 0.7031943, 0.7529628, 0.6627451, 0, 1, 1,
0.7859939, 0.3144357, 2.214211, 0.6666667, 0, 1, 1,
0.7863215, 0.1352384, 1.33878, 0.6745098, 0, 1, 1,
0.7872584, -1.205542, 2.870856, 0.6784314, 0, 1, 1,
0.7894343, -0.1214062, 2.557572, 0.6862745, 0, 1, 1,
0.8004956, 0.443812, 0.3141773, 0.6901961, 0, 1, 1,
0.8035839, 0.2097771, 1.450491, 0.6980392, 0, 1, 1,
0.8180575, 0.005900892, 0.8799485, 0.7058824, 0, 1, 1,
0.8185828, 1.386387, 0.1845722, 0.7098039, 0, 1, 1,
0.8217027, 2.029949, 1.640799, 0.7176471, 0, 1, 1,
0.8243383, 0.2202662, 2.446636, 0.7215686, 0, 1, 1,
0.8254753, -0.7846888, 2.194188, 0.7294118, 0, 1, 1,
0.828565, -1.168575, 2.606834, 0.7333333, 0, 1, 1,
0.8435324, -0.5323243, 2.843703, 0.7411765, 0, 1, 1,
0.847502, 0.6860885, 0.2755507, 0.7450981, 0, 1, 1,
0.8484451, 1.608949, -0.302601, 0.7529412, 0, 1, 1,
0.8487987, 0.8690645, 1.338813, 0.7568628, 0, 1, 1,
0.8508357, 0.9255068, -0.1881915, 0.7647059, 0, 1, 1,
0.854872, 0.0808787, 1.339565, 0.7686275, 0, 1, 1,
0.8570036, 1.071572, 0.5479881, 0.7764706, 0, 1, 1,
0.8598003, -0.727783, 3.901108, 0.7803922, 0, 1, 1,
0.867707, 0.7994525, -0.8133172, 0.7882353, 0, 1, 1,
0.8771734, -0.4221577, 1.377837, 0.7921569, 0, 1, 1,
0.8783792, -1.006112, 3.271549, 0.8, 0, 1, 1,
0.8919211, 0.695653, 0.5480909, 0.8078431, 0, 1, 1,
0.8921011, 2.541513, 1.158602, 0.8117647, 0, 1, 1,
0.8926216, -1.736322, 2.681611, 0.8196079, 0, 1, 1,
0.8948917, 0.3439624, 1.823859, 0.8235294, 0, 1, 1,
0.8955367, -2.12996, 3.352549, 0.8313726, 0, 1, 1,
0.9005262, -0.7452442, 2.88123, 0.8352941, 0, 1, 1,
0.9012727, 0.8170916, 0.1728944, 0.8431373, 0, 1, 1,
0.9023852, 0.9570386, 0.3371667, 0.8470588, 0, 1, 1,
0.9077312, -1.12885, -0.5828461, 0.854902, 0, 1, 1,
0.9318217, 0.5936893, 2.521016, 0.8588235, 0, 1, 1,
0.9341543, 0.1937819, 1.449835, 0.8666667, 0, 1, 1,
0.9360361, 0.1857182, 1.687561, 0.8705882, 0, 1, 1,
0.9417682, 1.215245, 1.37223, 0.8784314, 0, 1, 1,
0.9466576, 0.1728257, 0.8769585, 0.8823529, 0, 1, 1,
0.9493591, -0.3177571, 1.537768, 0.8901961, 0, 1, 1,
0.9498352, -0.6336058, 3.844454, 0.8941177, 0, 1, 1,
0.9507504, -1.441214, 3.482754, 0.9019608, 0, 1, 1,
0.9511932, 0.1688833, 1.382516, 0.9098039, 0, 1, 1,
0.9553336, 0.4587173, 0.5218032, 0.9137255, 0, 1, 1,
0.9567266, 0.4817102, 2.487068, 0.9215686, 0, 1, 1,
0.9637799, -0.03001687, 1.27251, 0.9254902, 0, 1, 1,
0.9641684, 0.05877606, 2.492423, 0.9333333, 0, 1, 1,
0.9709768, -0.04213217, 1.724353, 0.9372549, 0, 1, 1,
0.9819072, -0.9871405, 2.239117, 0.945098, 0, 1, 1,
0.9870982, -0.7122994, 2.620177, 0.9490196, 0, 1, 1,
0.9931034, -0.6681421, 2.507779, 0.9568627, 0, 1, 1,
0.9942963, 1.87355, 0.3535348, 0.9607843, 0, 1, 1,
0.9948959, 1.02123, 0.4954881, 0.9686275, 0, 1, 1,
0.999217, -1.681661, 0.7916548, 0.972549, 0, 1, 1,
1.007851, -0.6033993, 1.232726, 0.9803922, 0, 1, 1,
1.011147, -0.6957015, 2.20331, 0.9843137, 0, 1, 1,
1.013447, -0.4882545, 3.574856, 0.9921569, 0, 1, 1,
1.015467, 1.081416, 0.5634688, 0.9960784, 0, 1, 1,
1.017551, -0.8397142, 2.295167, 1, 0, 0.9960784, 1,
1.02211, -0.9966209, 2.324396, 1, 0, 0.9882353, 1,
1.029066, 0.5681487, 0.08356845, 1, 0, 0.9843137, 1,
1.029161, -0.5957696, 1.20636, 1, 0, 0.9764706, 1,
1.030957, -0.02111259, 3.029062, 1, 0, 0.972549, 1,
1.033045, -0.8144118, 1.366171, 1, 0, 0.9647059, 1,
1.033908, 0.6688761, 0.7724305, 1, 0, 0.9607843, 1,
1.035057, -0.3075486, 1.558319, 1, 0, 0.9529412, 1,
1.035426, 0.546635, 0.5300755, 1, 0, 0.9490196, 1,
1.043353, -0.250113, 1.179237, 1, 0, 0.9411765, 1,
1.054538, 1.750835, 0.3218586, 1, 0, 0.9372549, 1,
1.057138, 0.04457786, 0.9510472, 1, 0, 0.9294118, 1,
1.057934, 1.44567, -1.361669, 1, 0, 0.9254902, 1,
1.062537, 1.290988, 0.02199578, 1, 0, 0.9176471, 1,
1.070181, -1.243164, 2.408419, 1, 0, 0.9137255, 1,
1.070733, 1.061611, -0.04874429, 1, 0, 0.9058824, 1,
1.072077, -1.326772, 2.863502, 1, 0, 0.9019608, 1,
1.074435, -0.1836857, 0.2280064, 1, 0, 0.8941177, 1,
1.076165, 0.05186399, 0.6595456, 1, 0, 0.8862745, 1,
1.077745, -0.5422618, 2.909795, 1, 0, 0.8823529, 1,
1.081923, 0.04286157, 2.56663, 1, 0, 0.8745098, 1,
1.086301, -1.061256, 1.932598, 1, 0, 0.8705882, 1,
1.088409, 0.6736541, 1.196854, 1, 0, 0.8627451, 1,
1.089875, -0.9565187, 1.856524, 1, 0, 0.8588235, 1,
1.092814, -0.1867979, 1.81245, 1, 0, 0.8509804, 1,
1.099847, 0.4207253, 0.7936277, 1, 0, 0.8470588, 1,
1.105348, -0.9852818, 1.877636, 1, 0, 0.8392157, 1,
1.10602, -0.8191208, 3.919901, 1, 0, 0.8352941, 1,
1.109815, 0.9542103, 0.2507416, 1, 0, 0.827451, 1,
1.114814, 0.8904711, -1.561837, 1, 0, 0.8235294, 1,
1.118507, 0.6547418, 1.764261, 1, 0, 0.8156863, 1,
1.119089, 1.036692, -2.41025, 1, 0, 0.8117647, 1,
1.119836, -0.4173025, 1.310198, 1, 0, 0.8039216, 1,
1.128056, -0.9770622, 0.7647966, 1, 0, 0.7960784, 1,
1.131247, 0.2933416, 1.034568, 1, 0, 0.7921569, 1,
1.136582, 0.1209118, 1.287402, 1, 0, 0.7843137, 1,
1.140375, -0.8267578, 2.504861, 1, 0, 0.7803922, 1,
1.150571, -1.758922, 1.751127, 1, 0, 0.772549, 1,
1.159002, -0.2233053, 1.291801, 1, 0, 0.7686275, 1,
1.171271, 0.8519856, 0.5161867, 1, 0, 0.7607843, 1,
1.172665, 0.1662531, 2.613205, 1, 0, 0.7568628, 1,
1.175791, -1.091946, 2.476339, 1, 0, 0.7490196, 1,
1.178709, -1.121452, 3.396554, 1, 0, 0.7450981, 1,
1.181404, 0.07586714, 0.870502, 1, 0, 0.7372549, 1,
1.188603, 0.8269199, 0.4441373, 1, 0, 0.7333333, 1,
1.195474, 0.1250661, 2.335972, 1, 0, 0.7254902, 1,
1.195995, 1.478315, 0.6921166, 1, 0, 0.7215686, 1,
1.196825, 2.327743, -0.4197522, 1, 0, 0.7137255, 1,
1.197144, -0.8634362, -0.2689761, 1, 0, 0.7098039, 1,
1.198299, 0.4041423, 0.04297955, 1, 0, 0.7019608, 1,
1.203707, -0.1113809, 2.150082, 1, 0, 0.6941177, 1,
1.206575, 1.728142, 0.8718149, 1, 0, 0.6901961, 1,
1.215024, -0.6412833, 1.757213, 1, 0, 0.682353, 1,
1.219374, -0.4231699, 1.999226, 1, 0, 0.6784314, 1,
1.221223, -0.3801571, -0.495877, 1, 0, 0.6705883, 1,
1.221506, 0.2659348, 2.396295, 1, 0, 0.6666667, 1,
1.223572, -1.574598, 2.337499, 1, 0, 0.6588235, 1,
1.227825, -0.6094007, 2.040862, 1, 0, 0.654902, 1,
1.235235, -0.1711038, 1.669808, 1, 0, 0.6470588, 1,
1.236022, 1.283382, -0.03598715, 1, 0, 0.6431373, 1,
1.255563, 0.3757135, 1.717529, 1, 0, 0.6352941, 1,
1.262039, 1.75896, -0.06489233, 1, 0, 0.6313726, 1,
1.262283, -0.9999722, 2.334343, 1, 0, 0.6235294, 1,
1.269245, -0.2860186, 0.525457, 1, 0, 0.6196079, 1,
1.277299, -2.176698, 2.764063, 1, 0, 0.6117647, 1,
1.278854, 0.4342517, 0.2020431, 1, 0, 0.6078432, 1,
1.282802, 1.814457, 1.540039, 1, 0, 0.6, 1,
1.287811, -1.027348, 0.7601771, 1, 0, 0.5921569, 1,
1.288295, 0.1320392, 1.350129, 1, 0, 0.5882353, 1,
1.292359, 0.9244905, 0.6307458, 1, 0, 0.5803922, 1,
1.294539, 1.164722, 0.3876098, 1, 0, 0.5764706, 1,
1.298476, 0.6101326, 2.576794, 1, 0, 0.5686275, 1,
1.307561, 0.9245886, 1.66248, 1, 0, 0.5647059, 1,
1.309441, 1.700986, 1.286843, 1, 0, 0.5568628, 1,
1.31363, -1.21831, 2.64666, 1, 0, 0.5529412, 1,
1.32383, 0.5083336, 1.011439, 1, 0, 0.5450981, 1,
1.325917, 0.5284352, 1.281475, 1, 0, 0.5411765, 1,
1.327667, 0.08122832, 0.8920307, 1, 0, 0.5333334, 1,
1.329467, -0.1812148, 2.10779, 1, 0, 0.5294118, 1,
1.33614, -0.2483415, 0.2937655, 1, 0, 0.5215687, 1,
1.337702, -0.0955096, 2.60175, 1, 0, 0.5176471, 1,
1.340259, -0.2930352, 1.922688, 1, 0, 0.509804, 1,
1.34222, 0.6511305, 1.886712, 1, 0, 0.5058824, 1,
1.343022, -0.7575617, 2.732591, 1, 0, 0.4980392, 1,
1.357025, -0.6347559, 3.192327, 1, 0, 0.4901961, 1,
1.366757, 0.03978941, 3.742671, 1, 0, 0.4862745, 1,
1.372229, -1.647026, 3.780284, 1, 0, 0.4784314, 1,
1.378488, 0.1839425, 1.80865, 1, 0, 0.4745098, 1,
1.391456, 2.21363, -0.7128171, 1, 0, 0.4666667, 1,
1.397501, -1.009704, 2.49173, 1, 0, 0.4627451, 1,
1.401084, 0.3196274, 2.421667, 1, 0, 0.454902, 1,
1.40232, 1.384014, -0.0796432, 1, 0, 0.4509804, 1,
1.433456, -1.369831, 2.447358, 1, 0, 0.4431373, 1,
1.434336, 1.745858, -0.4824441, 1, 0, 0.4392157, 1,
1.43841, -0.8402554, 0.613372, 1, 0, 0.4313726, 1,
1.446913, -1.098174, 0.7408481, 1, 0, 0.427451, 1,
1.449936, -1.015541, 2.756319, 1, 0, 0.4196078, 1,
1.451215, -1.399639, 4.542616, 1, 0, 0.4156863, 1,
1.458399, -0.6573508, 1.565671, 1, 0, 0.4078431, 1,
1.459601, 0.5205802, 0.5135764, 1, 0, 0.4039216, 1,
1.466534, -0.8832735, 2.977013, 1, 0, 0.3960784, 1,
1.480098, -0.8188424, 1.622355, 1, 0, 0.3882353, 1,
1.481584, 1.043957, 0.03151392, 1, 0, 0.3843137, 1,
1.485109, 0.8567665, 1.672546, 1, 0, 0.3764706, 1,
1.485182, 0.4327373, 1.992775, 1, 0, 0.372549, 1,
1.489356, -0.2892658, 1.869848, 1, 0, 0.3647059, 1,
1.495835, 0.130632, 2.788687, 1, 0, 0.3607843, 1,
1.500591, -0.9961076, 2.252077, 1, 0, 0.3529412, 1,
1.514185, -0.3125056, 1.090353, 1, 0, 0.3490196, 1,
1.527224, 0.4488994, 1.592456, 1, 0, 0.3411765, 1,
1.557739, 1.16216, 0.09183478, 1, 0, 0.3372549, 1,
1.559422, -0.6376173, 1.362484, 1, 0, 0.3294118, 1,
1.573393, 2.821994, 1.048711, 1, 0, 0.3254902, 1,
1.614368, -0.5784134, 4.078088, 1, 0, 0.3176471, 1,
1.635939, -0.3586483, 0.003824738, 1, 0, 0.3137255, 1,
1.649111, 0.4695352, 1.692982, 1, 0, 0.3058824, 1,
1.657659, 1.449816, 2.125494, 1, 0, 0.2980392, 1,
1.666105, -0.5595961, 2.675537, 1, 0, 0.2941177, 1,
1.676034, 0.2697442, 2.0539, 1, 0, 0.2862745, 1,
1.686522, -1.94347, 1.052511, 1, 0, 0.282353, 1,
1.697258, -1.297579, 0.8507713, 1, 0, 0.2745098, 1,
1.728341, -1.095101, 1.368963, 1, 0, 0.2705882, 1,
1.735111, -0.3487751, 0.9492046, 1, 0, 0.2627451, 1,
1.737327, -1.070238, 2.276886, 1, 0, 0.2588235, 1,
1.74086, 1.203127, 1.44917, 1, 0, 0.2509804, 1,
1.770628, -0.5155768, 0.07864831, 1, 0, 0.2470588, 1,
1.772148, -0.09459858, 1.262012, 1, 0, 0.2392157, 1,
1.781001, -1.851313, 1.620817, 1, 0, 0.2352941, 1,
1.786234, 0.1492507, 1.986732, 1, 0, 0.227451, 1,
1.791407, -0.4237076, 2.713015, 1, 0, 0.2235294, 1,
1.796624, -0.9783896, 2.094234, 1, 0, 0.2156863, 1,
1.82165, -1.151667, 0.9768965, 1, 0, 0.2117647, 1,
1.845394, -0.1320213, 1.668481, 1, 0, 0.2039216, 1,
1.84597, 0.2305887, 2.471836, 1, 0, 0.1960784, 1,
1.850688, 0.009981549, 2.078015, 1, 0, 0.1921569, 1,
1.870826, -0.5612604, 0.9884629, 1, 0, 0.1843137, 1,
1.871279, 0.2632602, 0.4148422, 1, 0, 0.1803922, 1,
1.895523, 0.9698206, 1.516999, 1, 0, 0.172549, 1,
1.927517, 0.6191845, -0.3615949, 1, 0, 0.1686275, 1,
1.938686, 0.787417, 4.394956, 1, 0, 0.1607843, 1,
1.967312, -0.7204327, 3.653069, 1, 0, 0.1568628, 1,
1.992664, -0.9135785, 1.894886, 1, 0, 0.1490196, 1,
2.00627, -0.3554984, 2.007325, 1, 0, 0.145098, 1,
2.018092, -0.5997179, 1.406309, 1, 0, 0.1372549, 1,
2.029667, -1.762924, 2.426847, 1, 0, 0.1333333, 1,
2.047634, 1.456514, 1.404107, 1, 0, 0.1254902, 1,
2.063075, -0.5001477, 2.419025, 1, 0, 0.1215686, 1,
2.075464, -0.5027523, 2.812753, 1, 0, 0.1137255, 1,
2.085646, 0.9262487, 1.644178, 1, 0, 0.1098039, 1,
2.09061, -2.534276, 0.9877297, 1, 0, 0.1019608, 1,
2.103102, 0.5590597, 1.546757, 1, 0, 0.09411765, 1,
2.148608, -1.012201, 1.196423, 1, 0, 0.09019608, 1,
2.1775, -0.4904469, 0.843721, 1, 0, 0.08235294, 1,
2.208107, 1.490506, 0.8506873, 1, 0, 0.07843138, 1,
2.22313, -0.3570881, 1.46192, 1, 0, 0.07058824, 1,
2.224438, -1.348112, 3.658236, 1, 0, 0.06666667, 1,
2.254555, 0.475196, 1.042998, 1, 0, 0.05882353, 1,
2.261219, -1.317728, 1.237515, 1, 0, 0.05490196, 1,
2.317357, 0.8522024, 1.34102, 1, 0, 0.04705882, 1,
2.363143, 1.649261, 2.338506, 1, 0, 0.04313726, 1,
2.36347, 1.071884, 1.554876, 1, 0, 0.03529412, 1,
2.430585, -1.280246, 1.636618, 1, 0, 0.03137255, 1,
2.593417, 0.8579795, 0.594873, 1, 0, 0.02352941, 1,
2.780936, -1.563751, 2.813376, 1, 0, 0.01960784, 1,
2.80033, -1.495594, 1.33929, 1, 0, 0.01176471, 1,
3.047239, -0.6442185, 1.396318, 1, 0, 0.007843138, 1
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
0.1843768, -4.369216, -7.334913, 0, -0.5, 0.5, 0.5,
0.1843768, -4.369216, -7.334913, 1, -0.5, 0.5, 0.5,
0.1843768, -4.369216, -7.334913, 1, 1.5, 0.5, 0.5,
0.1843768, -4.369216, -7.334913, 0, 1.5, 0.5, 0.5
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
-3.648995, -0.1197456, -7.334913, 0, -0.5, 0.5, 0.5,
-3.648995, -0.1197456, -7.334913, 1, -0.5, 0.5, 0.5,
-3.648995, -0.1197456, -7.334913, 1, 1.5, 0.5, 0.5,
-3.648995, -0.1197456, -7.334913, 0, 1.5, 0.5, 0.5
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
-3.648995, -4.369216, -0.1239483, 0, -0.5, 0.5, 0.5,
-3.648995, -4.369216, -0.1239483, 1, -0.5, 0.5, 0.5,
-3.648995, -4.369216, -0.1239483, 1, 1.5, 0.5, 0.5,
-3.648995, -4.369216, -0.1239483, 0, 1.5, 0.5, 0.5
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
-2, -3.388569, -5.670844,
3, -3.388569, -5.670844,
-2, -3.388569, -5.670844,
-2, -3.552011, -5.948189,
-1, -3.388569, -5.670844,
-1, -3.552011, -5.948189,
0, -3.388569, -5.670844,
0, -3.552011, -5.948189,
1, -3.388569, -5.670844,
1, -3.552011, -5.948189,
2, -3.388569, -5.670844,
2, -3.552011, -5.948189,
3, -3.388569, -5.670844,
3, -3.552011, -5.948189
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
-2, -3.878893, -6.502879, 0, -0.5, 0.5, 0.5,
-2, -3.878893, -6.502879, 1, -0.5, 0.5, 0.5,
-2, -3.878893, -6.502879, 1, 1.5, 0.5, 0.5,
-2, -3.878893, -6.502879, 0, 1.5, 0.5, 0.5,
-1, -3.878893, -6.502879, 0, -0.5, 0.5, 0.5,
-1, -3.878893, -6.502879, 1, -0.5, 0.5, 0.5,
-1, -3.878893, -6.502879, 1, 1.5, 0.5, 0.5,
-1, -3.878893, -6.502879, 0, 1.5, 0.5, 0.5,
0, -3.878893, -6.502879, 0, -0.5, 0.5, 0.5,
0, -3.878893, -6.502879, 1, -0.5, 0.5, 0.5,
0, -3.878893, -6.502879, 1, 1.5, 0.5, 0.5,
0, -3.878893, -6.502879, 0, 1.5, 0.5, 0.5,
1, -3.878893, -6.502879, 0, -0.5, 0.5, 0.5,
1, -3.878893, -6.502879, 1, -0.5, 0.5, 0.5,
1, -3.878893, -6.502879, 1, 1.5, 0.5, 0.5,
1, -3.878893, -6.502879, 0, 1.5, 0.5, 0.5,
2, -3.878893, -6.502879, 0, -0.5, 0.5, 0.5,
2, -3.878893, -6.502879, 1, -0.5, 0.5, 0.5,
2, -3.878893, -6.502879, 1, 1.5, 0.5, 0.5,
2, -3.878893, -6.502879, 0, 1.5, 0.5, 0.5,
3, -3.878893, -6.502879, 0, -0.5, 0.5, 0.5,
3, -3.878893, -6.502879, 1, -0.5, 0.5, 0.5,
3, -3.878893, -6.502879, 1, 1.5, 0.5, 0.5,
3, -3.878893, -6.502879, 0, 1.5, 0.5, 0.5
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
-2.764371, -3, -5.670844,
-2.764371, 3, -5.670844,
-2.764371, -3, -5.670844,
-2.911808, -3, -5.948189,
-2.764371, -2, -5.670844,
-2.911808, -2, -5.948189,
-2.764371, -1, -5.670844,
-2.911808, -1, -5.948189,
-2.764371, 0, -5.670844,
-2.911808, 0, -5.948189,
-2.764371, 1, -5.670844,
-2.911808, 1, -5.948189,
-2.764371, 2, -5.670844,
-2.911808, 2, -5.948189,
-2.764371, 3, -5.670844,
-2.911808, 3, -5.948189
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
-3.206683, -3, -6.502879, 0, -0.5, 0.5, 0.5,
-3.206683, -3, -6.502879, 1, -0.5, 0.5, 0.5,
-3.206683, -3, -6.502879, 1, 1.5, 0.5, 0.5,
-3.206683, -3, -6.502879, 0, 1.5, 0.5, 0.5,
-3.206683, -2, -6.502879, 0, -0.5, 0.5, 0.5,
-3.206683, -2, -6.502879, 1, -0.5, 0.5, 0.5,
-3.206683, -2, -6.502879, 1, 1.5, 0.5, 0.5,
-3.206683, -2, -6.502879, 0, 1.5, 0.5, 0.5,
-3.206683, -1, -6.502879, 0, -0.5, 0.5, 0.5,
-3.206683, -1, -6.502879, 1, -0.5, 0.5, 0.5,
-3.206683, -1, -6.502879, 1, 1.5, 0.5, 0.5,
-3.206683, -1, -6.502879, 0, 1.5, 0.5, 0.5,
-3.206683, 0, -6.502879, 0, -0.5, 0.5, 0.5,
-3.206683, 0, -6.502879, 1, -0.5, 0.5, 0.5,
-3.206683, 0, -6.502879, 1, 1.5, 0.5, 0.5,
-3.206683, 0, -6.502879, 0, 1.5, 0.5, 0.5,
-3.206683, 1, -6.502879, 0, -0.5, 0.5, 0.5,
-3.206683, 1, -6.502879, 1, -0.5, 0.5, 0.5,
-3.206683, 1, -6.502879, 1, 1.5, 0.5, 0.5,
-3.206683, 1, -6.502879, 0, 1.5, 0.5, 0.5,
-3.206683, 2, -6.502879, 0, -0.5, 0.5, 0.5,
-3.206683, 2, -6.502879, 1, -0.5, 0.5, 0.5,
-3.206683, 2, -6.502879, 1, 1.5, 0.5, 0.5,
-3.206683, 2, -6.502879, 0, 1.5, 0.5, 0.5,
-3.206683, 3, -6.502879, 0, -0.5, 0.5, 0.5,
-3.206683, 3, -6.502879, 1, -0.5, 0.5, 0.5,
-3.206683, 3, -6.502879, 1, 1.5, 0.5, 0.5,
-3.206683, 3, -6.502879, 0, 1.5, 0.5, 0.5
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
-2.764371, -3.388569, -4,
-2.764371, -3.388569, 4,
-2.764371, -3.388569, -4,
-2.911808, -3.552011, -4,
-2.764371, -3.388569, -2,
-2.911808, -3.552011, -2,
-2.764371, -3.388569, 0,
-2.911808, -3.552011, 0,
-2.764371, -3.388569, 2,
-2.911808, -3.552011, 2,
-2.764371, -3.388569, 4,
-2.911808, -3.552011, 4
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
-3.206683, -3.878893, -4, 0, -0.5, 0.5, 0.5,
-3.206683, -3.878893, -4, 1, -0.5, 0.5, 0.5,
-3.206683, -3.878893, -4, 1, 1.5, 0.5, 0.5,
-3.206683, -3.878893, -4, 0, 1.5, 0.5, 0.5,
-3.206683, -3.878893, -2, 0, -0.5, 0.5, 0.5,
-3.206683, -3.878893, -2, 1, -0.5, 0.5, 0.5,
-3.206683, -3.878893, -2, 1, 1.5, 0.5, 0.5,
-3.206683, -3.878893, -2, 0, 1.5, 0.5, 0.5,
-3.206683, -3.878893, 0, 0, -0.5, 0.5, 0.5,
-3.206683, -3.878893, 0, 1, -0.5, 0.5, 0.5,
-3.206683, -3.878893, 0, 1, 1.5, 0.5, 0.5,
-3.206683, -3.878893, 0, 0, 1.5, 0.5, 0.5,
-3.206683, -3.878893, 2, 0, -0.5, 0.5, 0.5,
-3.206683, -3.878893, 2, 1, -0.5, 0.5, 0.5,
-3.206683, -3.878893, 2, 1, 1.5, 0.5, 0.5,
-3.206683, -3.878893, 2, 0, 1.5, 0.5, 0.5,
-3.206683, -3.878893, 4, 0, -0.5, 0.5, 0.5,
-3.206683, -3.878893, 4, 1, -0.5, 0.5, 0.5,
-3.206683, -3.878893, 4, 1, 1.5, 0.5, 0.5,
-3.206683, -3.878893, 4, 0, 1.5, 0.5, 0.5
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
-2.764371, -3.388569, -5.670844,
-2.764371, 3.149078, -5.670844,
-2.764371, -3.388569, 5.422947,
-2.764371, 3.149078, 5.422947,
-2.764371, -3.388569, -5.670844,
-2.764371, -3.388569, 5.422947,
-2.764371, 3.149078, -5.670844,
-2.764371, 3.149078, 5.422947,
-2.764371, -3.388569, -5.670844,
3.133124, -3.388569, -5.670844,
-2.764371, -3.388569, 5.422947,
3.133124, -3.388569, 5.422947,
-2.764371, 3.149078, -5.670844,
3.133124, 3.149078, -5.670844,
-2.764371, 3.149078, 5.422947,
3.133124, 3.149078, 5.422947,
3.133124, -3.388569, -5.670844,
3.133124, 3.149078, -5.670844,
3.133124, -3.388569, 5.422947,
3.133124, 3.149078, 5.422947,
3.133124, -3.388569, -5.670844,
3.133124, -3.388569, 5.422947,
3.133124, 3.149078, -5.670844,
3.133124, 3.149078, 5.422947
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
var radius = 7.562822;
var distance = 33.64785;
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
mvMatrix.translate( -0.1843768, 0.1197456, 0.1239483 );
mvMatrix.scale( 1.386533, 1.250767, 0.7370854 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.64785);
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
InChI_1S_C17H15ClFNO<-read.table("InChI_1S_C17H15ClFNO.xyz")
```

```
## Error in read.table("InChI_1S_C17H15ClFNO.xyz"): no lines available in input
```

```r
x<-InChI_1S_C17H15ClFNO$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C17H15ClFNO' not found
```

```r
y<-InChI_1S_C17H15ClFNO$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C17H15ClFNO' not found
```

```r
z<-InChI_1S_C17H15ClFNO$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C17H15ClFNO' not found
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
-2.678485, 1.359586, -1.104929, 0, 0, 1, 1, 1,
-2.491421, -0.9402752, -0.6639056, 1, 0, 0, 1, 1,
-2.463231, 0.2653697, -1.1745, 1, 0, 0, 1, 1,
-2.346708, -0.1892436, -3.297312, 1, 0, 0, 1, 1,
-2.313408, -0.0493011, -1.067356, 1, 0, 0, 1, 1,
-2.239848, 0.3248668, -3.392721, 1, 0, 0, 1, 1,
-2.214187, -0.769411, -1.27367, 0, 0, 0, 1, 1,
-2.109824, 0.5257941, -2.923834, 0, 0, 0, 1, 1,
-2.092944, 0.3311884, -1.144201, 0, 0, 0, 1, 1,
-2.059836, -0.7892567, -0.4523171, 0, 0, 0, 1, 1,
-2.057906, -0.5226138, -0.775264, 0, 0, 0, 1, 1,
-2.049717, 0.5695276, -2.160644, 0, 0, 0, 1, 1,
-2.042389, -1.289687, -0.4740809, 0, 0, 0, 1, 1,
-2.004253, 0.2169771, -0.5403281, 1, 1, 1, 1, 1,
-1.989579, 0.5987548, -0.5174153, 1, 1, 1, 1, 1,
-1.976009, 0.7821684, -1.211797, 1, 1, 1, 1, 1,
-1.975858, 0.9156659, -1.141737, 1, 1, 1, 1, 1,
-1.953929, 0.605051, -1.571818, 1, 1, 1, 1, 1,
-1.930547, -0.02679304, -2.754431, 1, 1, 1, 1, 1,
-1.91446, -0.8380669, -1.642901, 1, 1, 1, 1, 1,
-1.904113, 0.1719019, -1.795949, 1, 1, 1, 1, 1,
-1.894491, 1.477759, -1.401119, 1, 1, 1, 1, 1,
-1.891975, -1.456639, -1.582634, 1, 1, 1, 1, 1,
-1.87597, -1.481457, -1.881366, 1, 1, 1, 1, 1,
-1.834487, 0.5193557, -0.8460449, 1, 1, 1, 1, 1,
-1.812137, -1.325186, -1.217897, 1, 1, 1, 1, 1,
-1.810096, 0.2855965, -1.292567, 1, 1, 1, 1, 1,
-1.801438, -2.000396, -2.784755, 1, 1, 1, 1, 1,
-1.738781, 0.8037013, -1.101699, 0, 0, 1, 1, 1,
-1.728251, -0.8309461, -3.341624, 1, 0, 0, 1, 1,
-1.707345, 0.368527, -0.7546956, 1, 0, 0, 1, 1,
-1.700711, 0.01429258, -1.893253, 1, 0, 0, 1, 1,
-1.681974, 1.467132, 0.4930539, 1, 0, 0, 1, 1,
-1.679002, 0.3897269, -2.607763, 1, 0, 0, 1, 1,
-1.678412, -1.390393, -2.648759, 0, 0, 0, 1, 1,
-1.674848, -0.1797168, -0.995731, 0, 0, 0, 1, 1,
-1.672622, -0.3681869, -0.5570225, 0, 0, 0, 1, 1,
-1.668617, 1.414051, -0.1138718, 0, 0, 0, 1, 1,
-1.668256, -1.835592, -2.711153, 0, 0, 0, 1, 1,
-1.665572, 0.454587, -1.865466, 0, 0, 0, 1, 1,
-1.646744, -0.4930501, -4.455426, 0, 0, 0, 1, 1,
-1.63801, -0.6917689, -2.883583, 1, 1, 1, 1, 1,
-1.619821, -0.9703966, -1.721667, 1, 1, 1, 1, 1,
-1.619249, -0.647118, -2.268901, 1, 1, 1, 1, 1,
-1.602553, -0.1757445, -1.633431, 1, 1, 1, 1, 1,
-1.596838, -0.1321813, -1.154388, 1, 1, 1, 1, 1,
-1.583397, -1.994486, -2.523704, 1, 1, 1, 1, 1,
-1.579837, 2.114296, 0.07096216, 1, 1, 1, 1, 1,
-1.576525, -0.9201181, -1.287614, 1, 1, 1, 1, 1,
-1.570049, 0.2663431, -0.160069, 1, 1, 1, 1, 1,
-1.563765, 0.5740573, -3.380032, 1, 1, 1, 1, 1,
-1.56215, -0.6058768, -0.7505587, 1, 1, 1, 1, 1,
-1.551333, 0.009051748, -2.674269, 1, 1, 1, 1, 1,
-1.531597, 0.01067177, -1.968816, 1, 1, 1, 1, 1,
-1.505469, 0.1503204, -0.5700114, 1, 1, 1, 1, 1,
-1.501656, -0.2517625, -1.684652, 1, 1, 1, 1, 1,
-1.496418, -0.3216929, -3.354722, 0, 0, 1, 1, 1,
-1.49446, -1.166868, -2.186652, 1, 0, 0, 1, 1,
-1.481645, -1.623419, -2.921037, 1, 0, 0, 1, 1,
-1.470213, 1.333869, -0.9764761, 1, 0, 0, 1, 1,
-1.469239, 0.3940676, -1.392974, 1, 0, 0, 1, 1,
-1.468736, -1.720762, -3.581079, 1, 0, 0, 1, 1,
-1.462714, 0.9224966, 0.1936555, 0, 0, 0, 1, 1,
-1.460655, 0.4972744, -2.601765, 0, 0, 0, 1, 1,
-1.445402, -3.293361, -2.101819, 0, 0, 0, 1, 1,
-1.439033, 0.5544828, -2.504036, 0, 0, 0, 1, 1,
-1.431027, 2.126355, -0.3843667, 0, 0, 0, 1, 1,
-1.410597, 1.270568, -1.578539, 0, 0, 0, 1, 1,
-1.410535, 0.3744825, -1.411568, 0, 0, 0, 1, 1,
-1.405664, -0.5989218, -0.9110556, 1, 1, 1, 1, 1,
-1.403864, -0.0250118, -1.565057, 1, 1, 1, 1, 1,
-1.393489, 0.796228, -1.078859, 1, 1, 1, 1, 1,
-1.379324, 0.4453111, 0.7043496, 1, 1, 1, 1, 1,
-1.359345, -0.6679436, -2.672731, 1, 1, 1, 1, 1,
-1.356061, 2.534598, -0.3682185, 1, 1, 1, 1, 1,
-1.352019, 0.6187944, -1.710191, 1, 1, 1, 1, 1,
-1.340104, -0.08652583, -3.410209, 1, 1, 1, 1, 1,
-1.340034, 0.3894413, -0.4690602, 1, 1, 1, 1, 1,
-1.331044, -0.3561142, -2.141699, 1, 1, 1, 1, 1,
-1.323363, -1.049204, -2.538203, 1, 1, 1, 1, 1,
-1.318075, -1.009267, -0.6235161, 1, 1, 1, 1, 1,
-1.313226, 2.21914, 0.1207832, 1, 1, 1, 1, 1,
-1.312953, -0.1725911, -0.7152184, 1, 1, 1, 1, 1,
-1.312736, 1.141992, 0.1919503, 1, 1, 1, 1, 1,
-1.311275, 0.1860658, -1.755821, 0, 0, 1, 1, 1,
-1.310625, -0.07193036, -2.276406, 1, 0, 0, 1, 1,
-1.308332, -1.007003, -2.717228, 1, 0, 0, 1, 1,
-1.300864, 0.3801704, -0.2665136, 1, 0, 0, 1, 1,
-1.298751, 0.2761813, -0.5297443, 1, 0, 0, 1, 1,
-1.295921, -0.8792672, -1.972955, 1, 0, 0, 1, 1,
-1.292891, -2.083272, -1.292009, 0, 0, 0, 1, 1,
-1.277282, 1.032279, -0.6371784, 0, 0, 0, 1, 1,
-1.262397, 0.5753685, -0.4407846, 0, 0, 0, 1, 1,
-1.261911, 3.05387, 1.111865, 0, 0, 0, 1, 1,
-1.243981, 0.2864341, -1.329157, 0, 0, 0, 1, 1,
-1.243698, -0.9884492, -0.9307221, 0, 0, 0, 1, 1,
-1.236387, 1.231797, -1.326244, 0, 0, 0, 1, 1,
-1.224146, -0.8511915, -3.984269, 1, 1, 1, 1, 1,
-1.223128, -0.1930264, -2.424258, 1, 1, 1, 1, 1,
-1.221468, 0.4486031, -1.558095, 1, 1, 1, 1, 1,
-1.216604, 1.026918, -2.821445, 1, 1, 1, 1, 1,
-1.216472, 1.696639, -0.6457332, 1, 1, 1, 1, 1,
-1.211506, -0.7394181, -2.516943, 1, 1, 1, 1, 1,
-1.203708, -0.3459079, -0.7526184, 1, 1, 1, 1, 1,
-1.199636, -0.7557126, -4.778878, 1, 1, 1, 1, 1,
-1.190601, -0.4863068, -1.469526, 1, 1, 1, 1, 1,
-1.187519, -1.611374, -2.797393, 1, 1, 1, 1, 1,
-1.187187, 1.295655, -1.63785, 1, 1, 1, 1, 1,
-1.184033, 0.9217498, -0.741155, 1, 1, 1, 1, 1,
-1.181772, 2.215661, 0.9532236, 1, 1, 1, 1, 1,
-1.178655, 1.374452, -0.4547934, 1, 1, 1, 1, 1,
-1.175848, -1.467624, -2.212569, 1, 1, 1, 1, 1,
-1.172209, -2.206221, -2.361889, 0, 0, 1, 1, 1,
-1.170044, 0.8603788, -1.558138, 1, 0, 0, 1, 1,
-1.163507, 1.760785, 1.081321, 1, 0, 0, 1, 1,
-1.155848, -0.2014386, -2.309034, 1, 0, 0, 1, 1,
-1.155128, -0.257856, -1.745566, 1, 0, 0, 1, 1,
-1.15348, -0.3739083, -1.48565, 1, 0, 0, 1, 1,
-1.143415, 0.9967308, -2.039762, 0, 0, 0, 1, 1,
-1.138994, 1.221822, 0.3150139, 0, 0, 0, 1, 1,
-1.129806, -0.3344222, -0.3992685, 0, 0, 0, 1, 1,
-1.128202, -1.44312, -3.142776, 0, 0, 0, 1, 1,
-1.118804, 0.5636672, -1.368147, 0, 0, 0, 1, 1,
-1.118781, -0.1491479, -0.9991385, 0, 0, 0, 1, 1,
-1.108144, -0.8834666, -2.033881, 0, 0, 0, 1, 1,
-1.10506, -0.882435, -3.355011, 1, 1, 1, 1, 1,
-1.104543, -0.4615568, -0.9901517, 1, 1, 1, 1, 1,
-1.100306, 1.314237, 0.2350278, 1, 1, 1, 1, 1,
-1.090696, -0.7092296, -2.995775, 1, 1, 1, 1, 1,
-1.09034, -1.621477, -2.258955, 1, 1, 1, 1, 1,
-1.089486, 0.6863052, -0.370109, 1, 1, 1, 1, 1,
-1.08837, 0.8647916, -1.302789, 1, 1, 1, 1, 1,
-1.087326, 1.255567, 0.3700753, 1, 1, 1, 1, 1,
-1.085659, 0.6744497, -1.516635, 1, 1, 1, 1, 1,
-1.085514, 0.6657871, -2.421641, 1, 1, 1, 1, 1,
-1.082715, 0.8611565, -1.401138, 1, 1, 1, 1, 1,
-1.080633, 0.5560782, -1.978695, 1, 1, 1, 1, 1,
-1.074229, 0.74218, 0.9316489, 1, 1, 1, 1, 1,
-1.066404, 0.1816082, -1.669725, 1, 1, 1, 1, 1,
-1.060773, -0.09897256, -0.9659513, 1, 1, 1, 1, 1,
-1.057161, 0.07755733, -2.621701, 0, 0, 1, 1, 1,
-1.043377, -1.034748, -2.594373, 1, 0, 0, 1, 1,
-1.042322, 0.1982359, -2.027459, 1, 0, 0, 1, 1,
-1.038524, -1.049472, -3.13378, 1, 0, 0, 1, 1,
-1.034324, 0.4413223, -2.650355, 1, 0, 0, 1, 1,
-1.033692, 1.742704, -0.888818, 1, 0, 0, 1, 1,
-1.030263, -1.808781, -1.025849, 0, 0, 0, 1, 1,
-1.023065, 0.1281665, -2.007594, 0, 0, 0, 1, 1,
-1.013992, 0.3588457, -1.391413, 0, 0, 0, 1, 1,
-1.010853, -1.613486, -1.620086, 0, 0, 0, 1, 1,
-1.010797, 0.9025832, -2.803045, 0, 0, 0, 1, 1,
-1.00822, -1.958463, -1.558904, 0, 0, 0, 1, 1,
-1.007388, -0.9980642, -3.161501, 0, 0, 0, 1, 1,
-1.00085, 1.636975, 1.998183, 1, 1, 1, 1, 1,
-0.9987723, -0.4566593, -2.546334, 1, 1, 1, 1, 1,
-0.9952245, 0.2021824, -2.568634, 1, 1, 1, 1, 1,
-0.9932591, 1.400833, -0.2042493, 1, 1, 1, 1, 1,
-0.9868864, 1.666236, -1.141534, 1, 1, 1, 1, 1,
-0.9845229, 0.2505498, -0.6713918, 1, 1, 1, 1, 1,
-0.982837, -0.4428902, -2.454102, 1, 1, 1, 1, 1,
-0.9788783, -0.4875185, -2.978102, 1, 1, 1, 1, 1,
-0.9723237, -2.56484, -4.580668, 1, 1, 1, 1, 1,
-0.9665626, -0.4254755, -2.937783, 1, 1, 1, 1, 1,
-0.9650933, 0.5127166, -1.856461, 1, 1, 1, 1, 1,
-0.9599887, -0.1634568, -1.682373, 1, 1, 1, 1, 1,
-0.9594582, 0.266697, -1.969849, 1, 1, 1, 1, 1,
-0.959036, -0.4917882, -4.320168, 1, 1, 1, 1, 1,
-0.9588783, -0.06782389, -0.7005826, 1, 1, 1, 1, 1,
-0.9577645, -0.8899423, -2.041636, 0, 0, 1, 1, 1,
-0.9520779, 0.7121658, -1.04593, 1, 0, 0, 1, 1,
-0.9446316, 1.054458, -1.299493, 1, 0, 0, 1, 1,
-0.9397776, -1.81041, -2.435481, 1, 0, 0, 1, 1,
-0.9340543, 0.131683, -0.9905844, 1, 0, 0, 1, 1,
-0.9222118, -1.323502, -1.884731, 1, 0, 0, 1, 1,
-0.9123779, 1.525686, 0.7693794, 0, 0, 0, 1, 1,
-0.9095821, -0.8433224, -3.538371, 0, 0, 0, 1, 1,
-0.9069082, 1.227449, -0.3540373, 0, 0, 0, 1, 1,
-0.9058449, -0.7403091, -2.490484, 0, 0, 0, 1, 1,
-0.9041089, 0.2613414, -1.205891, 0, 0, 0, 1, 1,
-0.899259, -0.3300252, -1.706222, 0, 0, 0, 1, 1,
-0.8942242, -0.5976253, -1.595502, 0, 0, 0, 1, 1,
-0.8841361, 1.615141, -0.3972676, 1, 1, 1, 1, 1,
-0.8807612, 0.6121961, -1.975683, 1, 1, 1, 1, 1,
-0.8723236, 0.8766125, -1.358236, 1, 1, 1, 1, 1,
-0.8718873, 0.9642839, -2.739405, 1, 1, 1, 1, 1,
-0.8704194, -2.132909, -2.816685, 1, 1, 1, 1, 1,
-0.8660621, 0.5895818, -1.441764, 1, 1, 1, 1, 1,
-0.8627855, 0.215654, -2.131434, 1, 1, 1, 1, 1,
-0.8595569, -0.4476322, -2.318011, 1, 1, 1, 1, 1,
-0.857866, -0.3635532, -3.107095, 1, 1, 1, 1, 1,
-0.8573925, 0.01974621, -1.829951, 1, 1, 1, 1, 1,
-0.8571662, 0.3371863, -2.019632, 1, 1, 1, 1, 1,
-0.8503063, 0.7601402, -2.529133, 1, 1, 1, 1, 1,
-0.8500246, 2.063483, -0.9448326, 1, 1, 1, 1, 1,
-0.8463275, -0.4449102, -1.537919, 1, 1, 1, 1, 1,
-0.8433496, -1.274589, -2.617777, 1, 1, 1, 1, 1,
-0.8406827, 1.308289, -1.436961, 0, 0, 1, 1, 1,
-0.8388934, -1.414698, -4.498979, 1, 0, 0, 1, 1,
-0.8366638, -1.672649, -4.494733, 1, 0, 0, 1, 1,
-0.8263322, -0.2266172, -4.426592, 1, 0, 0, 1, 1,
-0.8171566, -1.672451, -2.342653, 1, 0, 0, 1, 1,
-0.8155873, 0.08057939, -0.7893026, 1, 0, 0, 1, 1,
-0.8147392, 0.3583133, -2.394029, 0, 0, 0, 1, 1,
-0.8064827, -0.6246816, -4.816765, 0, 0, 0, 1, 1,
-0.8055274, -0.06914969, -2.236649, 0, 0, 0, 1, 1,
-0.8008871, -0.9489478, -1.088376, 0, 0, 0, 1, 1,
-0.8005086, -0.6757348, -2.816084, 0, 0, 0, 1, 1,
-0.7964348, -0.1775268, -2.214668, 0, 0, 0, 1, 1,
-0.792181, -0.2485725, -1.20287, 0, 0, 0, 1, 1,
-0.7917369, -0.1750968, -2.595545, 1, 1, 1, 1, 1,
-0.7869131, 0.3418118, -0.1640317, 1, 1, 1, 1, 1,
-0.7686459, -0.01723975, -1.785285, 1, 1, 1, 1, 1,
-0.7665851, -0.5264997, -1.748623, 1, 1, 1, 1, 1,
-0.7656538, 0.7945469, -0.4837093, 1, 1, 1, 1, 1,
-0.7648557, -0.3962715, -1.133531, 1, 1, 1, 1, 1,
-0.7621959, -0.602771, -1.566222, 1, 1, 1, 1, 1,
-0.7583284, 0.5468518, -1.849459, 1, 1, 1, 1, 1,
-0.7550858, -1.016222, -3.2091, 1, 1, 1, 1, 1,
-0.7530339, 0.4719672, -1.664366, 1, 1, 1, 1, 1,
-0.7473394, -2.439376, -2.409773, 1, 1, 1, 1, 1,
-0.7366887, -0.5932732, -1.30044, 1, 1, 1, 1, 1,
-0.7338036, 0.3767315, -2.209944, 1, 1, 1, 1, 1,
-0.7318805, 0.9374303, -0.8261334, 1, 1, 1, 1, 1,
-0.7293608, -0.2008483, -3.148957, 1, 1, 1, 1, 1,
-0.726291, 0.8841035, -1.002126, 0, 0, 1, 1, 1,
-0.7256685, -1.903424, -4.014677, 1, 0, 0, 1, 1,
-0.7207223, -1.451592, -3.598753, 1, 0, 0, 1, 1,
-0.7160766, -0.547536, -1.986096, 1, 0, 0, 1, 1,
-0.7155814, -0.1116367, -0.8305053, 1, 0, 0, 1, 1,
-0.7137083, -1.040205, -3.19811, 1, 0, 0, 1, 1,
-0.7051376, -1.00621, -2.124243, 0, 0, 0, 1, 1,
-0.6990278, 0.1590162, -0.3587242, 0, 0, 0, 1, 1,
-0.698758, -0.1884394, -1.602453, 0, 0, 0, 1, 1,
-0.6913767, 1.31689, -0.9310118, 0, 0, 0, 1, 1,
-0.6891321, -0.201957, -1.928902, 0, 0, 0, 1, 1,
-0.6878516, -0.4605605, -2.587848, 0, 0, 0, 1, 1,
-0.6853581, 0.0191978, -2.053955, 0, 0, 0, 1, 1,
-0.6825795, 0.1706218, -1.394331, 1, 1, 1, 1, 1,
-0.677184, 0.4069123, 1.219911, 1, 1, 1, 1, 1,
-0.6725821, 0.7828076, -1.216825, 1, 1, 1, 1, 1,
-0.670665, 0.3793139, -1.044927, 1, 1, 1, 1, 1,
-0.669199, 0.1713969, -1.704509, 1, 1, 1, 1, 1,
-0.6617107, -0.4718663, -3.560637, 1, 1, 1, 1, 1,
-0.6491952, -0.1817097, -3.698675, 1, 1, 1, 1, 1,
-0.643708, 0.7148879, -0.135487, 1, 1, 1, 1, 1,
-0.6435764, 1.698427, 1.342618, 1, 1, 1, 1, 1,
-0.6425134, 1.186213, -1.655339, 1, 1, 1, 1, 1,
-0.6425015, -0.455839, -1.53966, 1, 1, 1, 1, 1,
-0.6387151, 0.4362189, -0.6613749, 1, 1, 1, 1, 1,
-0.6367162, -1.018383, -3.320573, 1, 1, 1, 1, 1,
-0.6267599, 1.066769, -1.584783, 1, 1, 1, 1, 1,
-0.6263158, -0.1295827, -1.689815, 1, 1, 1, 1, 1,
-0.6261169, 0.2856159, -1.100174, 0, 0, 1, 1, 1,
-0.625102, -0.5773935, -4.796076, 1, 0, 0, 1, 1,
-0.621613, 0.09178314, -2.016461, 1, 0, 0, 1, 1,
-0.6196366, 0.7906405, -1.314426, 1, 0, 0, 1, 1,
-0.6179941, 0.5805176, -0.5268602, 1, 0, 0, 1, 1,
-0.612087, 0.2586085, -1.381625, 1, 0, 0, 1, 1,
-0.6101675, -2.112751, -1.945393, 0, 0, 0, 1, 1,
-0.6074483, 0.7219642, -1.047083, 0, 0, 0, 1, 1,
-0.6029611, -0.7384455, -3.727425, 0, 0, 0, 1, 1,
-0.6025042, -1.187316, -3.585603, 0, 0, 0, 1, 1,
-0.6010264, -0.1686974, -1.051301, 0, 0, 0, 1, 1,
-0.6007715, -0.3297586, -2.81675, 0, 0, 0, 1, 1,
-0.5903399, -0.9991358, -2.181783, 0, 0, 0, 1, 1,
-0.5881271, 0.07218962, -0.9443824, 1, 1, 1, 1, 1,
-0.5875451, -0.6166304, -2.894628, 1, 1, 1, 1, 1,
-0.5866813, 0.953248, -0.8895639, 1, 1, 1, 1, 1,
-0.5830561, -0.1230456, -0.2526602, 1, 1, 1, 1, 1,
-0.5807263, -0.2208937, -2.355021, 1, 1, 1, 1, 1,
-0.5761185, -0.05141767, -1.537328, 1, 1, 1, 1, 1,
-0.5726508, 0.5804568, -0.01581725, 1, 1, 1, 1, 1,
-0.5684004, -0.07345586, -2.807076, 1, 1, 1, 1, 1,
-0.5681928, 0.4595817, -0.7145351, 1, 1, 1, 1, 1,
-0.5633883, 0.2097779, -0.7707067, 1, 1, 1, 1, 1,
-0.5624586, 0.3002378, -0.2913862, 1, 1, 1, 1, 1,
-0.5621929, 0.5250289, -0.9905604, 1, 1, 1, 1, 1,
-0.5615013, -1.861455, -2.809439, 1, 1, 1, 1, 1,
-0.5605747, -0.2036563, -0.3714523, 1, 1, 1, 1, 1,
-0.5593595, 0.1192789, -1.614235, 1, 1, 1, 1, 1,
-0.5586505, -0.09382556, -1.771948, 0, 0, 1, 1, 1,
-0.5582854, 1.636208, -0.8060828, 1, 0, 0, 1, 1,
-0.5552545, -0.2278038, -1.608807, 1, 0, 0, 1, 1,
-0.5534831, 0.09458533, -2.149887, 1, 0, 0, 1, 1,
-0.5526149, 0.5069786, -2.752705, 1, 0, 0, 1, 1,
-0.5488924, -0.7743825, -1.718502, 1, 0, 0, 1, 1,
-0.5475456, -0.540873, -1.822549, 0, 0, 0, 1, 1,
-0.5414531, -0.7336114, -0.7918954, 0, 0, 0, 1, 1,
-0.5389698, -1.099947, -2.915904, 0, 0, 0, 1, 1,
-0.5374206, 0.4754018, -1.413074, 0, 0, 0, 1, 1,
-0.5369493, 0.7483079, -0.6822712, 0, 0, 0, 1, 1,
-0.5304772, -0.960893, -4.816697, 0, 0, 0, 1, 1,
-0.5290767, -0.5817884, -2.545029, 0, 0, 0, 1, 1,
-0.5272213, 2.193299, -0.03021278, 1, 1, 1, 1, 1,
-0.52109, -0.8469092, -4.357633, 1, 1, 1, 1, 1,
-0.5208011, -0.0415214, -2.015597, 1, 1, 1, 1, 1,
-0.5196702, -1.031367, -3.374166, 1, 1, 1, 1, 1,
-0.5182866, -0.6002406, -2.780479, 1, 1, 1, 1, 1,
-0.5165018, 0.9444609, 0.06990822, 1, 1, 1, 1, 1,
-0.5161059, 1.886799, -0.1349911, 1, 1, 1, 1, 1,
-0.5131019, 0.4648361, 0.2322761, 1, 1, 1, 1, 1,
-0.51099, -0.1642188, -1.147868, 1, 1, 1, 1, 1,
-0.5106508, 1.555034, 0.3279559, 1, 1, 1, 1, 1,
-0.5068082, -0.3874885, -3.373194, 1, 1, 1, 1, 1,
-0.5064957, 0.06492038, -0.09362467, 1, 1, 1, 1, 1,
-0.5061813, -0.01319385, -1.230613, 1, 1, 1, 1, 1,
-0.5046318, 1.481277, -3.065694, 1, 1, 1, 1, 1,
-0.5030184, 0.7363003, -0.9752196, 1, 1, 1, 1, 1,
-0.4980386, -0.7166145, -2.62565, 0, 0, 1, 1, 1,
-0.4979717, 0.437014, -1.378991, 1, 0, 0, 1, 1,
-0.4872642, -2.009687, -3.215693, 1, 0, 0, 1, 1,
-0.4823259, 1.076089, -2.468835, 1, 0, 0, 1, 1,
-0.4818015, -2.05519, -3.081441, 1, 0, 0, 1, 1,
-0.478672, -0.297853, -3.364914, 1, 0, 0, 1, 1,
-0.4779391, -0.7938199, -2.401501, 0, 0, 0, 1, 1,
-0.4759832, -0.1179951, 0.2457835, 0, 0, 0, 1, 1,
-0.4678065, 0.5620322, 1.021395, 0, 0, 0, 1, 1,
-0.4676872, -1.660671, -3.27104, 0, 0, 0, 1, 1,
-0.4662457, -0.3518409, -2.377736, 0, 0, 0, 1, 1,
-0.4632538, 0.734181, 0.5722854, 0, 0, 0, 1, 1,
-0.461631, 1.1084, -0.5078998, 0, 0, 0, 1, 1,
-0.4593022, 1.013605, 0.6552311, 1, 1, 1, 1, 1,
-0.4549944, 1.794466, -0.4629239, 1, 1, 1, 1, 1,
-0.4549482, -1.143922, -3.554866, 1, 1, 1, 1, 1,
-0.4478231, -0.0320582, -1.838943, 1, 1, 1, 1, 1,
-0.4447362, 0.7466345, 0.8703485, 1, 1, 1, 1, 1,
-0.4445481, 1.686927, -0.596709, 1, 1, 1, 1, 1,
-0.4433264, 0.6991807, 0.1646897, 1, 1, 1, 1, 1,
-0.4417079, -1.963765, -3.177143, 1, 1, 1, 1, 1,
-0.4373945, -0.268721, -2.389559, 1, 1, 1, 1, 1,
-0.4373886, -0.08009438, -1.110894, 1, 1, 1, 1, 1,
-0.4357, 1.126614, -1.192123, 1, 1, 1, 1, 1,
-0.4265206, -0.811381, -0.7045398, 1, 1, 1, 1, 1,
-0.4247821, 1.750896, -0.3795836, 1, 1, 1, 1, 1,
-0.424551, -0.6207618, -1.341944, 1, 1, 1, 1, 1,
-0.4230341, -0.899415, -2.187415, 1, 1, 1, 1, 1,
-0.4227089, 0.5827136, -0.9667941, 0, 0, 1, 1, 1,
-0.4213351, 0.7567633, -1.695606, 1, 0, 0, 1, 1,
-0.4180591, -0.04346406, -3.704876, 1, 0, 0, 1, 1,
-0.4177871, -0.4944114, -1.411018, 1, 0, 0, 1, 1,
-0.4176389, -0.769293, -3.947505, 1, 0, 0, 1, 1,
-0.4168451, 0.1798449, -2.766771, 1, 0, 0, 1, 1,
-0.4156696, -1.783674, -2.918608, 0, 0, 0, 1, 1,
-0.4141134, 1.325004, -1.53086, 0, 0, 0, 1, 1,
-0.4127764, -1.80643, -2.573445, 0, 0, 0, 1, 1,
-0.4124977, -0.3949928, -4.006913, 0, 0, 0, 1, 1,
-0.4119779, 0.08156323, -0.8130136, 0, 0, 0, 1, 1,
-0.410477, -0.68411, -0.9434357, 0, 0, 0, 1, 1,
-0.4103726, -1.07829, -2.085617, 0, 0, 0, 1, 1,
-0.4083894, -1.108472, -4.184389, 1, 1, 1, 1, 1,
-0.4054407, -0.774906, -3.279278, 1, 1, 1, 1, 1,
-0.4033321, -1.195795, -2.434346, 1, 1, 1, 1, 1,
-0.4028409, -0.1703469, -1.761751, 1, 1, 1, 1, 1,
-0.399664, -0.3348063, -2.722241, 1, 1, 1, 1, 1,
-0.3975448, -0.5612324, -1.73714, 1, 1, 1, 1, 1,
-0.3957924, 0.1785147, -1.487844, 1, 1, 1, 1, 1,
-0.3910938, -0.2986815, -0.7166554, 1, 1, 1, 1, 1,
-0.3899437, 1.126645, -0.8026831, 1, 1, 1, 1, 1,
-0.3821934, 0.04901076, -2.6528, 1, 1, 1, 1, 1,
-0.3814836, 0.7670501, 0.8257579, 1, 1, 1, 1, 1,
-0.3791417, -0.1932792, -3.089734, 1, 1, 1, 1, 1,
-0.3728766, 0.7523887, -1.008476, 1, 1, 1, 1, 1,
-0.3701708, -0.514949, -4.349939, 1, 1, 1, 1, 1,
-0.3699895, -0.8426804, -5.202229, 1, 1, 1, 1, 1,
-0.3683208, 0.1520365, -0.3292, 0, 0, 1, 1, 1,
-0.3590418, -0.8166245, -3.390978, 1, 0, 0, 1, 1,
-0.3576762, -1.268551, -2.259293, 1, 0, 0, 1, 1,
-0.3564298, 0.4225233, -1.677143, 1, 0, 0, 1, 1,
-0.3562523, -0.3548015, -3.179522, 1, 0, 0, 1, 1,
-0.3545176, -0.2006116, -1.921519, 1, 0, 0, 1, 1,
-0.3535654, -1.68229, -2.561862, 0, 0, 0, 1, 1,
-0.3522761, 0.5714981, -2.859178, 0, 0, 0, 1, 1,
-0.3521052, -2.220716, -3.029016, 0, 0, 0, 1, 1,
-0.350959, 0.8764026, -0.9630191, 0, 0, 0, 1, 1,
-0.3374263, -1.127074, -3.208322, 0, 0, 0, 1, 1,
-0.33719, 0.2633775, -1.478536, 0, 0, 0, 1, 1,
-0.3279839, -0.6108063, -5.105592, 0, 0, 0, 1, 1,
-0.326135, 0.9913175, -0.711744, 1, 1, 1, 1, 1,
-0.3256175, 1.988326, 2.047437, 1, 1, 1, 1, 1,
-0.3241539, 0.342293, -1.912804, 1, 1, 1, 1, 1,
-0.3231757, -1.930165, -3.722946, 1, 1, 1, 1, 1,
-0.3137107, -0.2363064, -2.704006, 1, 1, 1, 1, 1,
-0.3110043, -0.5383855, -3.651877, 1, 1, 1, 1, 1,
-0.307355, -0.716855, -2.299129, 1, 1, 1, 1, 1,
-0.3052393, 1.515813, -0.9353811, 1, 1, 1, 1, 1,
-0.3047791, -2.212718, -3.262264, 1, 1, 1, 1, 1,
-0.3047212, 0.5260114, 0.7227348, 1, 1, 1, 1, 1,
-0.3030605, -0.4437833, -1.475328, 1, 1, 1, 1, 1,
-0.3000346, -0.4936842, -2.906923, 1, 1, 1, 1, 1,
-0.2971851, 0.1462477, -1.406255, 1, 1, 1, 1, 1,
-0.2970611, -0.5040528, -1.804758, 1, 1, 1, 1, 1,
-0.2919033, -2.508209, -2.280174, 1, 1, 1, 1, 1,
-0.2910889, -0.05383255, -1.87701, 0, 0, 1, 1, 1,
-0.2910504, -0.260677, -1.753752, 1, 0, 0, 1, 1,
-0.2902098, 0.9408447, -1.030241, 1, 0, 0, 1, 1,
-0.2897894, -1.006885, -3.074095, 1, 0, 0, 1, 1,
-0.2884909, -0.5702366, -1.205811, 1, 0, 0, 1, 1,
-0.2842738, -0.02129502, -2.815286, 1, 0, 0, 1, 1,
-0.2825237, 0.8788084, 0.173453, 0, 0, 0, 1, 1,
-0.281545, 0.7521127, 0.4325445, 0, 0, 0, 1, 1,
-0.280206, -0.680489, -3.198228, 0, 0, 0, 1, 1,
-0.2786544, 0.8598944, 1.969211, 0, 0, 0, 1, 1,
-0.277307, 1.126969, -2.016279, 0, 0, 0, 1, 1,
-0.2771943, -0.1472079, -1.972096, 0, 0, 0, 1, 1,
-0.2738369, 0.03588818, -0.5422466, 0, 0, 0, 1, 1,
-0.2723489, 0.9443503, 1.132492, 1, 1, 1, 1, 1,
-0.2694578, 0.7066039, -1.710576, 1, 1, 1, 1, 1,
-0.2674329, 2.419944, 0.3981075, 1, 1, 1, 1, 1,
-0.267056, 0.354456, -0.4194437, 1, 1, 1, 1, 1,
-0.2662092, 0.4486249, -1.000484, 1, 1, 1, 1, 1,
-0.2621928, -0.6933888, -4.203411, 1, 1, 1, 1, 1,
-0.2611466, 0.3082173, -0.1355678, 1, 1, 1, 1, 1,
-0.255815, 0.5167801, 1.562756, 1, 1, 1, 1, 1,
-0.2554356, 0.2102096, -1.079971, 1, 1, 1, 1, 1,
-0.2551998, -1.082901, -1.771388, 1, 1, 1, 1, 1,
-0.252874, -0.8147666, -2.598222, 1, 1, 1, 1, 1,
-0.252466, 0.5490034, -0.4506875, 1, 1, 1, 1, 1,
-0.2516782, 0.4212246, 0.2366823, 1, 1, 1, 1, 1,
-0.2502309, 1.151006, 0.1960181, 1, 1, 1, 1, 1,
-0.2496739, -1.285832, -2.538255, 1, 1, 1, 1, 1,
-0.2453783, 1.12685, -1.009033, 0, 0, 1, 1, 1,
-0.2442686, -0.4444362, -1.510725, 1, 0, 0, 1, 1,
-0.2395057, 0.1673999, -0.3800213, 1, 0, 0, 1, 1,
-0.2388076, 0.6159992, -0.2215911, 1, 0, 0, 1, 1,
-0.2383535, 1.30095, -0.04433074, 1, 0, 0, 1, 1,
-0.2281942, -0.1653445, -2.806707, 1, 0, 0, 1, 1,
-0.2278381, 0.9173635, 0.6878901, 0, 0, 0, 1, 1,
-0.223847, -1.197525, -3.325, 0, 0, 0, 1, 1,
-0.2234271, -1.078029, -4.246427, 0, 0, 0, 1, 1,
-0.2175168, -0.9934604, -2.458278, 0, 0, 0, 1, 1,
-0.2145095, 1.270441, -1.259074, 0, 0, 0, 1, 1,
-0.2057223, -1.085321, -2.080304, 0, 0, 0, 1, 1,
-0.2044323, -1.631246, -1.959712, 0, 0, 0, 1, 1,
-0.1990337, -1.568622, -3.609045, 1, 1, 1, 1, 1,
-0.1973532, -0.669422, -3.471516, 1, 1, 1, 1, 1,
-0.1972497, -1.645162, -3.579477, 1, 1, 1, 1, 1,
-0.1968851, -0.7179483, -4.763827, 1, 1, 1, 1, 1,
-0.1955501, -1.857945, -5.509284, 1, 1, 1, 1, 1,
-0.1948411, 0.7553611, -0.6554894, 1, 1, 1, 1, 1,
-0.1944284, 0.7103765, -1.347592, 1, 1, 1, 1, 1,
-0.1922564, 0.3036406, -0.2056516, 1, 1, 1, 1, 1,
-0.1920982, 0.6941121, 0.6244452, 1, 1, 1, 1, 1,
-0.1883145, 0.2018963, 0.511838, 1, 1, 1, 1, 1,
-0.1877442, 0.4602083, 0.2669823, 1, 1, 1, 1, 1,
-0.1824465, 1.285887, 1.009168, 1, 1, 1, 1, 1,
-0.1783372, 1.727977, -2.234841, 1, 1, 1, 1, 1,
-0.1750204, 0.3524481, -0.239527, 1, 1, 1, 1, 1,
-0.1730297, 1.605704, -0.7634758, 1, 1, 1, 1, 1,
-0.1697854, -1.246179, -2.942297, 0, 0, 1, 1, 1,
-0.167882, 0.3700089, -0.868995, 1, 0, 0, 1, 1,
-0.1638782, 1.715522, 2.262054, 1, 0, 0, 1, 1,
-0.1624285, 0.7968026, -1.084567, 1, 0, 0, 1, 1,
-0.1602112, 1.364739, 0.1954506, 1, 0, 0, 1, 1,
-0.1539654, -1.89518, -2.408739, 1, 0, 0, 1, 1,
-0.1523975, 0.4887766, 0.1883471, 0, 0, 0, 1, 1,
-0.1514034, 0.8379465, -0.4829707, 0, 0, 0, 1, 1,
-0.149787, -0.02948002, -3.310112, 0, 0, 0, 1, 1,
-0.1454311, -1.022049, -0.1022534, 0, 0, 0, 1, 1,
-0.1395278, -0.01305407, -2.385113, 0, 0, 0, 1, 1,
-0.1392877, -2.130985, -3.173924, 0, 0, 0, 1, 1,
-0.1387863, -1.126994, -3.337861, 0, 0, 0, 1, 1,
-0.1294659, -0.1049686, -2.309747, 1, 1, 1, 1, 1,
-0.1279012, 0.8075893, -1.888788, 1, 1, 1, 1, 1,
-0.1173311, 0.02043557, -2.851947, 1, 1, 1, 1, 1,
-0.1169607, -0.2964361, -4.545687, 1, 1, 1, 1, 1,
-0.1135196, -0.2198909, -3.489312, 1, 1, 1, 1, 1,
-0.1091441, 0.7308876, -0.8870739, 1, 1, 1, 1, 1,
-0.1088413, 0.2149924, -0.8573147, 1, 1, 1, 1, 1,
-0.108046, -0.3188386, -3.391046, 1, 1, 1, 1, 1,
-0.1073562, 0.4691034, -1.450147, 1, 1, 1, 1, 1,
-0.102484, 0.9949284, 0.2501054, 1, 1, 1, 1, 1,
-0.1006454, -1.48439, -1.879449, 1, 1, 1, 1, 1,
-0.09721581, -1.544114, -3.299071, 1, 1, 1, 1, 1,
-0.09535839, 0.4630001, -1.525169, 1, 1, 1, 1, 1,
-0.09359926, -1.379962, -4.295197, 1, 1, 1, 1, 1,
-0.09155581, -0.9216865, -4.703105, 1, 1, 1, 1, 1,
-0.08112486, -1.885117, -2.869831, 0, 0, 1, 1, 1,
-0.07644485, -0.01170222, -3.28203, 1, 0, 0, 1, 1,
-0.07107016, 0.8584111, -1.712417, 1, 0, 0, 1, 1,
-0.0675851, 1.65053, 1.182341, 1, 0, 0, 1, 1,
-0.05726332, -0.1747585, -1.750782, 1, 0, 0, 1, 1,
-0.05596693, 1.17461, -0.9933184, 1, 0, 0, 1, 1,
-0.05392702, 0.8955918, -0.1817532, 0, 0, 0, 1, 1,
-0.05312985, -0.05098885, -0.3374376, 0, 0, 0, 1, 1,
-0.04986564, -0.414744, -3.032163, 0, 0, 0, 1, 1,
-0.04876343, 0.3559173, 0.2469185, 0, 0, 0, 1, 1,
-0.0449466, -0.177113, -1.054241, 0, 0, 0, 1, 1,
-0.04411016, 0.6994033, 2.227132, 0, 0, 0, 1, 1,
-0.04283941, 0.8041735, -0.7044969, 0, 0, 0, 1, 1,
-0.04035176, 0.1430211, -1.898214, 1, 1, 1, 1, 1,
-0.03281261, 1.224566, 0.7902769, 1, 1, 1, 1, 1,
-0.02476798, 0.4458513, -0.1266363, 1, 1, 1, 1, 1,
-0.02193054, -0.1705932, -3.002278, 1, 1, 1, 1, 1,
-0.02047761, 1.375889, 0.1671727, 1, 1, 1, 1, 1,
-0.01759678, 0.660094, 0.5162209, 1, 1, 1, 1, 1,
-0.0144222, -0.06909712, -1.853701, 1, 1, 1, 1, 1,
-0.007811237, 1.573363, -0.9719172, 1, 1, 1, 1, 1,
-0.006983099, -0.3340893, -3.034955, 1, 1, 1, 1, 1,
-0.006226972, 0.530609, -2.09428, 1, 1, 1, 1, 1,
-0.005921653, -0.3622213, -2.516232, 1, 1, 1, 1, 1,
-0.002908773, -0.5096764, -2.505568, 1, 1, 1, 1, 1,
0.005059281, 0.2342152, -1.171144, 1, 1, 1, 1, 1,
0.007257309, 0.07863732, -0.808753, 1, 1, 1, 1, 1,
0.008470532, -1.75457, 3.367378, 1, 1, 1, 1, 1,
0.01042885, 0.3881081, 0.2624373, 0, 0, 1, 1, 1,
0.01076564, -2.038629, 1.957085, 1, 0, 0, 1, 1,
0.01141779, -0.9043347, 4.403966, 1, 0, 0, 1, 1,
0.01459066, 1.219222, 1.767633, 1, 0, 0, 1, 1,
0.01578076, -0.4510851, 3.584692, 1, 0, 0, 1, 1,
0.01871465, -0.879853, 4.424235, 1, 0, 0, 1, 1,
0.01992836, -2.197299, 3.792412, 0, 0, 0, 1, 1,
0.02056653, 0.3332163, 0.3368059, 0, 0, 0, 1, 1,
0.02068986, 0.9091383, 0.4853403, 0, 0, 0, 1, 1,
0.02074755, -1.383499, 2.757519, 0, 0, 0, 1, 1,
0.02162204, 0.2991104, -0.5651699, 0, 0, 0, 1, 1,
0.02367184, -1.237977, 0.2839135, 0, 0, 0, 1, 1,
0.02609111, -1.473968, 3.300589, 0, 0, 0, 1, 1,
0.0301839, 1.088189, 0.2113357, 1, 1, 1, 1, 1,
0.03097898, 1.345879, -0.1719218, 1, 1, 1, 1, 1,
0.03322484, -0.6482017, 1.461145, 1, 1, 1, 1, 1,
0.03866472, -0.2972211, 3.992211, 1, 1, 1, 1, 1,
0.03948593, -0.8812623, 3.201729, 1, 1, 1, 1, 1,
0.04207716, 1.465922, 0.1808326, 1, 1, 1, 1, 1,
0.05694925, -0.02358293, 2.096267, 1, 1, 1, 1, 1,
0.0595306, -0.1635025, 2.75204, 1, 1, 1, 1, 1,
0.06203105, -0.9153347, 3.116647, 1, 1, 1, 1, 1,
0.06295149, 1.526062, 1.073396, 1, 1, 1, 1, 1,
0.06631387, 0.5018672, 0.3024668, 1, 1, 1, 1, 1,
0.06836571, -0.3810043, 2.297904, 1, 1, 1, 1, 1,
0.06837744, 1.445282, 1.645888, 1, 1, 1, 1, 1,
0.07453911, 1.470897, -0.4030693, 1, 1, 1, 1, 1,
0.07496596, -1.216006, 2.041732, 1, 1, 1, 1, 1,
0.0764429, 1.497705, 0.3715337, 0, 0, 1, 1, 1,
0.07734568, 0.3997255, 0.6511924, 1, 0, 0, 1, 1,
0.08291001, 0.2938307, -0.02378646, 1, 0, 0, 1, 1,
0.08308385, -2.649161, 2.949245, 1, 0, 0, 1, 1,
0.08438808, 0.1598657, 0.6231109, 1, 0, 0, 1, 1,
0.0877859, -0.2811445, 3.407403, 1, 0, 0, 1, 1,
0.09283662, -1.087979, 2.125932, 0, 0, 0, 1, 1,
0.09664964, -2.17907, 3.425928, 0, 0, 0, 1, 1,
0.1021449, 0.9952164, -0.7806823, 0, 0, 0, 1, 1,
0.1085269, 0.7908846, -0.5369523, 0, 0, 0, 1, 1,
0.1088298, -0.0790843, 2.047355, 0, 0, 0, 1, 1,
0.109751, 0.4508158, 0.8428896, 0, 0, 0, 1, 1,
0.1156816, 0.3144508, -0.3309349, 0, 0, 0, 1, 1,
0.1161375, 0.383687, 0.9905888, 1, 1, 1, 1, 1,
0.1189114, -0.2726001, 1.835943, 1, 1, 1, 1, 1,
0.1231477, -0.2332362, 2.262685, 1, 1, 1, 1, 1,
0.1247831, -0.1861366, 1.351212, 1, 1, 1, 1, 1,
0.126545, 2.389277, 0.2239767, 1, 1, 1, 1, 1,
0.1284014, 2.69322, 0.7398215, 1, 1, 1, 1, 1,
0.1284452, -0.4013037, 3.150992, 1, 1, 1, 1, 1,
0.1321051, 2.112796, -1.133651, 1, 1, 1, 1, 1,
0.1328616, -0.5539543, 2.686386, 1, 1, 1, 1, 1,
0.1364001, -0.4609382, 3.359743, 1, 1, 1, 1, 1,
0.1371329, 1.196417, 1.859424, 1, 1, 1, 1, 1,
0.1444544, 0.7889165, -0.853188, 1, 1, 1, 1, 1,
0.1447341, 1.52351, -0.560622, 1, 1, 1, 1, 1,
0.1510996, -1.438989, 2.885627, 1, 1, 1, 1, 1,
0.1535738, 1.973808, -1.608349, 1, 1, 1, 1, 1,
0.1562544, 0.1395692, -0.03689367, 0, 0, 1, 1, 1,
0.1562922, -2.309798, 1.964413, 1, 0, 0, 1, 1,
0.1575144, -0.7162856, 2.862306, 1, 0, 0, 1, 1,
0.163458, 1.981036, 1.510589, 1, 0, 0, 1, 1,
0.1769131, 0.9301586, 0.6428336, 1, 0, 0, 1, 1,
0.177011, 0.9401397, 1.483391, 1, 0, 0, 1, 1,
0.1770964, 0.4677199, -1.482128, 0, 0, 0, 1, 1,
0.1783879, 2.252986, -0.8997975, 0, 0, 0, 1, 1,
0.1834862, 0.02188722, 1.127156, 0, 0, 0, 1, 1,
0.1847895, -0.0459309, 0.6739298, 0, 0, 0, 1, 1,
0.1867698, -0.0696404, 0.5168635, 0, 0, 0, 1, 1,
0.1877274, 0.6458681, 1.457729, 0, 0, 0, 1, 1,
0.1958895, 1.62147, -0.2900339, 0, 0, 0, 1, 1,
0.1966127, -0.4520834, 3.307225, 1, 1, 1, 1, 1,
0.1986074, 0.6445143, 1.423235, 1, 1, 1, 1, 1,
0.1990312, -0.7519087, 0.6313024, 1, 1, 1, 1, 1,
0.1990751, -0.6075316, 3.571736, 1, 1, 1, 1, 1,
0.2000293, 1.522248, -0.7200483, 1, 1, 1, 1, 1,
0.2010675, 0.5934894, -0.1494011, 1, 1, 1, 1, 1,
0.2013167, 0.5161238, 1.347751, 1, 1, 1, 1, 1,
0.2013473, -0.2205138, 2.403641, 1, 1, 1, 1, 1,
0.2028641, -0.9907174, 3.586323, 1, 1, 1, 1, 1,
0.2059299, 1.242514, 2.215442, 1, 1, 1, 1, 1,
0.2077174, -1.30909, 2.500515, 1, 1, 1, 1, 1,
0.2101402, 0.05429164, 1.316332, 1, 1, 1, 1, 1,
0.2110271, 1.795188, 1.672049, 1, 1, 1, 1, 1,
0.2124577, 1.466183, -2.047229, 1, 1, 1, 1, 1,
0.2126082, 0.1422552, -0.21121, 1, 1, 1, 1, 1,
0.2165076, 0.5603951, 2.24595, 0, 0, 1, 1, 1,
0.2255333, -1.301043, 3.235091, 1, 0, 0, 1, 1,
0.2264513, 0.5535777, -0.8545172, 1, 0, 0, 1, 1,
0.2265594, 0.089077, 2.674147, 1, 0, 0, 1, 1,
0.2266568, 0.74273, 2.649748, 1, 0, 0, 1, 1,
0.2282326, -0.3536869, 3.329458, 1, 0, 0, 1, 1,
0.2303955, -3.103031, 2.867573, 0, 0, 0, 1, 1,
0.2388057, 0.274902, 0.8750854, 0, 0, 0, 1, 1,
0.2391712, 0.2348221, 0.8407186, 0, 0, 0, 1, 1,
0.2403004, 1.001057, 1.854858, 0, 0, 0, 1, 1,
0.2545294, 0.8190407, -1.46158, 0, 0, 0, 1, 1,
0.2612263, 0.677811, 0.2836463, 0, 0, 0, 1, 1,
0.2622599, -0.4559557, 1.148423, 0, 0, 0, 1, 1,
0.2629046, 1.108004, 0.04424183, 1, 1, 1, 1, 1,
0.2687562, 0.1620203, 1.595243, 1, 1, 1, 1, 1,
0.2689106, 0.7399345, 0.5370439, 1, 1, 1, 1, 1,
0.2690012, -0.2238793, 1.146175, 1, 1, 1, 1, 1,
0.2692266, 1.146016, -0.1552195, 1, 1, 1, 1, 1,
0.2713864, 1.436117, -0.2124099, 1, 1, 1, 1, 1,
0.2714617, 0.4311932, -0.7492746, 1, 1, 1, 1, 1,
0.2776662, 1.793043, 0.114418, 1, 1, 1, 1, 1,
0.2837512, -0.006692605, 0.05587196, 1, 1, 1, 1, 1,
0.2837807, -0.6547672, 2.305354, 1, 1, 1, 1, 1,
0.2855943, 0.3589776, -0.1499823, 1, 1, 1, 1, 1,
0.2907497, -0.5119904, 1.515462, 1, 1, 1, 1, 1,
0.2929801, 0.300537, 0.6514811, 1, 1, 1, 1, 1,
0.295052, -1.031837, 2.841157, 1, 1, 1, 1, 1,
0.2972555, -1.119012, 2.885144, 1, 1, 1, 1, 1,
0.3017819, -0.8273293, 3.431409, 0, 0, 1, 1, 1,
0.3018326, 0.1479578, -0.1632015, 1, 0, 0, 1, 1,
0.3060759, -2.060328, 2.938767, 1, 0, 0, 1, 1,
0.3078472, -2.490515, 4.31428, 1, 0, 0, 1, 1,
0.3095728, -1.007369, 3.325489, 1, 0, 0, 1, 1,
0.3156168, -0.5831589, 2.419438, 1, 0, 0, 1, 1,
0.3168936, 1.525164, 0.2944117, 0, 0, 0, 1, 1,
0.3176395, 0.2409014, 0.5038115, 0, 0, 0, 1, 1,
0.3180199, 1.311004, -1.311125, 0, 0, 0, 1, 1,
0.3231461, -0.5229698, 2.563412, 0, 0, 0, 1, 1,
0.3246882, 2.448967, -0.4145794, 0, 0, 0, 1, 1,
0.3248101, -0.6021555, 3.242209, 0, 0, 0, 1, 1,
0.3278329, -1.04802, 1.768854, 0, 0, 0, 1, 1,
0.3293878, -0.2647901, 2.00162, 1, 1, 1, 1, 1,
0.3301398, -0.1351339, 2.202424, 1, 1, 1, 1, 1,
0.3311085, 1.96315, -0.05564373, 1, 1, 1, 1, 1,
0.3319957, 0.3333693, -0.7013413, 1, 1, 1, 1, 1,
0.3330978, -1.336704, 3.590799, 1, 1, 1, 1, 1,
0.3350661, -0.6853819, 2.272735, 1, 1, 1, 1, 1,
0.3415308, -0.5654643, 4.252634, 1, 1, 1, 1, 1,
0.3525624, -0.6465304, 2.855855, 1, 1, 1, 1, 1,
0.353252, 0.2894172, 2.694545, 1, 1, 1, 1, 1,
0.3533745, -0.8631904, 3.578025, 1, 1, 1, 1, 1,
0.3538243, -0.3867683, 1.387679, 1, 1, 1, 1, 1,
0.358907, 0.06566393, 0.7555274, 1, 1, 1, 1, 1,
0.3631278, 0.9281879, 1.264743, 1, 1, 1, 1, 1,
0.3673344, 2.321969, -0.5111942, 1, 1, 1, 1, 1,
0.3678665, -0.6036276, 2.092081, 1, 1, 1, 1, 1,
0.3705929, 0.005302771, 0.4109312, 0, 0, 1, 1, 1,
0.3706071, -0.3857069, 1.912025, 1, 0, 0, 1, 1,
0.3762301, 1.173286, -0.9318978, 1, 0, 0, 1, 1,
0.3776751, 0.4954864, 0.8321393, 1, 0, 0, 1, 1,
0.3777485, 0.5828108, 0.7812551, 1, 0, 0, 1, 1,
0.379519, 1.101627, 0.9387609, 1, 0, 0, 1, 1,
0.3816453, 0.904974, -0.7837777, 0, 0, 0, 1, 1,
0.384615, -0.8125135, 1.932105, 0, 0, 0, 1, 1,
0.387558, 0.885458, 0.9800366, 0, 0, 0, 1, 1,
0.3876081, -0.8290329, 4.16176, 0, 0, 0, 1, 1,
0.3927948, 0.8011683, -0.2060639, 0, 0, 0, 1, 1,
0.3940673, 0.8790222, 2.333616, 0, 0, 0, 1, 1,
0.3966448, 0.6707748, 0.2083645, 0, 0, 0, 1, 1,
0.3977855, 1.257638, 0.8837237, 1, 1, 1, 1, 1,
0.3979152, 0.3561702, 0.5353075, 1, 1, 1, 1, 1,
0.3980492, 1.405451, 1.960327, 1, 1, 1, 1, 1,
0.3988198, -0.2450589, 1.970824, 1, 1, 1, 1, 1,
0.399569, 1.173166, -0.9543912, 1, 1, 1, 1, 1,
0.4028557, -0.8809035, 0.3880643, 1, 1, 1, 1, 1,
0.4035056, -2.33882, 3.680093, 1, 1, 1, 1, 1,
0.407845, -1.229828, 2.891478, 1, 1, 1, 1, 1,
0.408964, -0.07871415, 1.908799, 1, 1, 1, 1, 1,
0.4100403, 0.1471327, 1.202624, 1, 1, 1, 1, 1,
0.4114885, 1.634558, -1.530526, 1, 1, 1, 1, 1,
0.4165574, 0.1648071, -0.1925559, 1, 1, 1, 1, 1,
0.4200372, -1.004946, 1.928097, 1, 1, 1, 1, 1,
0.4233803, -0.5368398, 2.959355, 1, 1, 1, 1, 1,
0.4252327, 0.2009762, 3.039466, 1, 1, 1, 1, 1,
0.425898, 0.5291364, -0.7743106, 0, 0, 1, 1, 1,
0.4282789, 0.4992189, -0.386105, 1, 0, 0, 1, 1,
0.4292938, 0.9135163, 0.9026781, 1, 0, 0, 1, 1,
0.4299693, 1.403334, 0.4641425, 1, 0, 0, 1, 1,
0.4303403, -0.2793566, 3.373727, 1, 0, 0, 1, 1,
0.4332277, -0.7968785, 3.060685, 1, 0, 0, 1, 1,
0.4348879, 0.8182462, 1.648814, 0, 0, 0, 1, 1,
0.4442135, 1.259356, 1.162998, 0, 0, 0, 1, 1,
0.4485824, 0.9130812, 1.216631, 0, 0, 0, 1, 1,
0.4562444, -1.096752, 2.601253, 0, 0, 0, 1, 1,
0.4573552, 0.6437055, 1.659745, 0, 0, 0, 1, 1,
0.4668302, 0.3662991, 2.088039, 0, 0, 0, 1, 1,
0.4691816, -1.017345, 2.922894, 0, 0, 0, 1, 1,
0.4750677, 0.3860145, 0.3634844, 1, 1, 1, 1, 1,
0.4766881, -0.8334608, 4.135147, 1, 1, 1, 1, 1,
0.4815242, -1.242891, 2.170764, 1, 1, 1, 1, 1,
0.4840077, -1.375889, 1.807155, 1, 1, 1, 1, 1,
0.4854919, 0.5066862, -0.1595513, 1, 1, 1, 1, 1,
0.4870827, -0.9431224, 2.499613, 1, 1, 1, 1, 1,
0.4903275, -0.8307107, 2.565707, 1, 1, 1, 1, 1,
0.4915988, -1.509471, 1.613485, 1, 1, 1, 1, 1,
0.4971025, -1.292661, 1.680459, 1, 1, 1, 1, 1,
0.4984589, 0.1735951, 1.182963, 1, 1, 1, 1, 1,
0.4998385, 0.9459415, 0.5157332, 1, 1, 1, 1, 1,
0.5012, -0.9091488, 2.842871, 1, 1, 1, 1, 1,
0.5067423, -1.271042, 2.287401, 1, 1, 1, 1, 1,
0.5082842, 0.9309945, -0.3818754, 1, 1, 1, 1, 1,
0.5173385, -0.002441214, 1.231646, 1, 1, 1, 1, 1,
0.5203474, 0.2878796, 0.4463573, 0, 0, 1, 1, 1,
0.5223476, 0.3648843, 1.308583, 1, 0, 0, 1, 1,
0.5341492, -1.458771, 2.832783, 1, 0, 0, 1, 1,
0.5343974, -1.187828, 1.558948, 1, 0, 0, 1, 1,
0.5353138, 0.2361158, -0.4319976, 1, 0, 0, 1, 1,
0.5357484, 0.07174064, 1.978373, 1, 0, 0, 1, 1,
0.5418174, -0.4119885, 1.790838, 0, 0, 0, 1, 1,
0.543564, 0.4097909, 0.9773836, 0, 0, 0, 1, 1,
0.5468439, 0.9371742, -0.1742342, 0, 0, 0, 1, 1,
0.5490949, 0.7214137, 0.4956556, 0, 0, 0, 1, 1,
0.5575528, 0.2210092, 0.3882628, 0, 0, 0, 1, 1,
0.5653657, -0.8099917, 1.569795, 0, 0, 0, 1, 1,
0.5684164, -1.222251, 4.186917, 0, 0, 0, 1, 1,
0.5727503, -0.4851869, 0.6133, 1, 1, 1, 1, 1,
0.5758342, -0.2977039, 1.239417, 1, 1, 1, 1, 1,
0.5777478, 0.1539916, 1.398265, 1, 1, 1, 1, 1,
0.5788858, 1.27014, 0.1912257, 1, 1, 1, 1, 1,
0.5840113, 2.450035, -0.4723992, 1, 1, 1, 1, 1,
0.5847109, -0.3388858, 2.04874, 1, 1, 1, 1, 1,
0.5849033, 0.1484326, 1.454499, 1, 1, 1, 1, 1,
0.5920827, 1.662752, 2.243336, 1, 1, 1, 1, 1,
0.5947476, -0.671647, 3.007245, 1, 1, 1, 1, 1,
0.5949935, 0.3910958, 2.280644, 1, 1, 1, 1, 1,
0.598452, 1.627676, -0.7981758, 1, 1, 1, 1, 1,
0.6073078, 0.3189414, 1.027231, 1, 1, 1, 1, 1,
0.6106215, 1.271544, -0.3029913, 1, 1, 1, 1, 1,
0.6192626, 0.7397781, 0.8099309, 1, 1, 1, 1, 1,
0.6201593, -0.4926832, 2.944598, 1, 1, 1, 1, 1,
0.6233416, 0.4289733, 3.438675, 0, 0, 1, 1, 1,
0.623706, -0.9051346, 5.261387, 1, 0, 0, 1, 1,
0.6282952, -0.5930356, 2.097563, 1, 0, 0, 1, 1,
0.6334993, 0.4141035, 0.3901252, 1, 0, 0, 1, 1,
0.6475492, 2.057667, 1.277353, 1, 0, 0, 1, 1,
0.6478607, -0.8398889, 2.590285, 1, 0, 0, 1, 1,
0.6496316, -0.2255224, 0.9585608, 0, 0, 0, 1, 1,
0.650361, -2.423242, 3.516432, 0, 0, 0, 1, 1,
0.6545725, -2.200779, 2.070117, 0, 0, 0, 1, 1,
0.6570191, -0.9781206, 3.629677, 0, 0, 0, 1, 1,
0.6617008, 0.488006, 0.3161268, 0, 0, 0, 1, 1,
0.6649385, -0.01832705, 2.668502, 0, 0, 0, 1, 1,
0.6652435, 1.364163, 0.3118608, 0, 0, 0, 1, 1,
0.668363, 0.3883105, 1.373841, 1, 1, 1, 1, 1,
0.6687548, 1.474097, -0.3908837, 1, 1, 1, 1, 1,
0.6700959, 1.242101, 1.275815, 1, 1, 1, 1, 1,
0.6721874, 0.05408937, 1.947501, 1, 1, 1, 1, 1,
0.672959, 1.119054, -1.421236, 1, 1, 1, 1, 1,
0.6737911, 0.2779293, 0.1089498, 1, 1, 1, 1, 1,
0.6782722, -0.4270689, 2.005573, 1, 1, 1, 1, 1,
0.6811421, 1.815617, 0.5029442, 1, 1, 1, 1, 1,
0.6836489, 0.4759715, 0.4468257, 1, 1, 1, 1, 1,
0.6934786, 0.5359726, 0.2801048, 1, 1, 1, 1, 1,
0.6955705, 0.6408042, 0.4451211, 1, 1, 1, 1, 1,
0.7031138, -0.939432, 2.412841, 1, 1, 1, 1, 1,
0.7054556, -0.2097795, 3.101826, 1, 1, 1, 1, 1,
0.7141811, 1.209818, -0.03009627, 1, 1, 1, 1, 1,
0.714966, 0.7361246, 0.5420489, 1, 1, 1, 1, 1,
0.7169433, 1.13623, 0.1571059, 0, 0, 1, 1, 1,
0.7187784, -1.175135, 3.164468, 1, 0, 0, 1, 1,
0.7192838, -0.08624535, -0.4140541, 1, 0, 0, 1, 1,
0.7202961, -0.237274, 2.955932, 1, 0, 0, 1, 1,
0.7235413, -1.108337, 1.350555, 1, 0, 0, 1, 1,
0.7283204, -0.05395618, 2.620526, 1, 0, 0, 1, 1,
0.7410999, 1.003777, 0.98917, 0, 0, 0, 1, 1,
0.743422, -0.6869338, 1.547097, 0, 0, 0, 1, 1,
0.749046, -0.8434744, 2.34901, 0, 0, 0, 1, 1,
0.7529727, 0.986676, -1.501426, 0, 0, 0, 1, 1,
0.7530556, -0.6961447, 0.8004075, 0, 0, 0, 1, 1,
0.7545554, -0.8495042, 3.045585, 0, 0, 0, 1, 1,
0.7594395, 0.6176249, 2.886106, 0, 0, 0, 1, 1,
0.7599356, -1.03203, 2.153628, 1, 1, 1, 1, 1,
0.7636674, -0.235339, 2.550186, 1, 1, 1, 1, 1,
0.7694071, 1.321549, 0.0973327, 1, 1, 1, 1, 1,
0.7732069, 1.025053, 0.6747708, 1, 1, 1, 1, 1,
0.7736366, -0.2073765, 1.805865, 1, 1, 1, 1, 1,
0.7771684, -0.02526374, 2.350299, 1, 1, 1, 1, 1,
0.7815921, -1.470898, 2.694462, 1, 1, 1, 1, 1,
0.7816868, -0.2808614, 1.80995, 1, 1, 1, 1, 1,
0.7836501, 0.7031943, 0.7529628, 1, 1, 1, 1, 1,
0.7859939, 0.3144357, 2.214211, 1, 1, 1, 1, 1,
0.7863215, 0.1352384, 1.33878, 1, 1, 1, 1, 1,
0.7872584, -1.205542, 2.870856, 1, 1, 1, 1, 1,
0.7894343, -0.1214062, 2.557572, 1, 1, 1, 1, 1,
0.8004956, 0.443812, 0.3141773, 1, 1, 1, 1, 1,
0.8035839, 0.2097771, 1.450491, 1, 1, 1, 1, 1,
0.8180575, 0.005900892, 0.8799485, 0, 0, 1, 1, 1,
0.8185828, 1.386387, 0.1845722, 1, 0, 0, 1, 1,
0.8217027, 2.029949, 1.640799, 1, 0, 0, 1, 1,
0.8243383, 0.2202662, 2.446636, 1, 0, 0, 1, 1,
0.8254753, -0.7846888, 2.194188, 1, 0, 0, 1, 1,
0.828565, -1.168575, 2.606834, 1, 0, 0, 1, 1,
0.8435324, -0.5323243, 2.843703, 0, 0, 0, 1, 1,
0.847502, 0.6860885, 0.2755507, 0, 0, 0, 1, 1,
0.8484451, 1.608949, -0.302601, 0, 0, 0, 1, 1,
0.8487987, 0.8690645, 1.338813, 0, 0, 0, 1, 1,
0.8508357, 0.9255068, -0.1881915, 0, 0, 0, 1, 1,
0.854872, 0.0808787, 1.339565, 0, 0, 0, 1, 1,
0.8570036, 1.071572, 0.5479881, 0, 0, 0, 1, 1,
0.8598003, -0.727783, 3.901108, 1, 1, 1, 1, 1,
0.867707, 0.7994525, -0.8133172, 1, 1, 1, 1, 1,
0.8771734, -0.4221577, 1.377837, 1, 1, 1, 1, 1,
0.8783792, -1.006112, 3.271549, 1, 1, 1, 1, 1,
0.8919211, 0.695653, 0.5480909, 1, 1, 1, 1, 1,
0.8921011, 2.541513, 1.158602, 1, 1, 1, 1, 1,
0.8926216, -1.736322, 2.681611, 1, 1, 1, 1, 1,
0.8948917, 0.3439624, 1.823859, 1, 1, 1, 1, 1,
0.8955367, -2.12996, 3.352549, 1, 1, 1, 1, 1,
0.9005262, -0.7452442, 2.88123, 1, 1, 1, 1, 1,
0.9012727, 0.8170916, 0.1728944, 1, 1, 1, 1, 1,
0.9023852, 0.9570386, 0.3371667, 1, 1, 1, 1, 1,
0.9077312, -1.12885, -0.5828461, 1, 1, 1, 1, 1,
0.9318217, 0.5936893, 2.521016, 1, 1, 1, 1, 1,
0.9341543, 0.1937819, 1.449835, 1, 1, 1, 1, 1,
0.9360361, 0.1857182, 1.687561, 0, 0, 1, 1, 1,
0.9417682, 1.215245, 1.37223, 1, 0, 0, 1, 1,
0.9466576, 0.1728257, 0.8769585, 1, 0, 0, 1, 1,
0.9493591, -0.3177571, 1.537768, 1, 0, 0, 1, 1,
0.9498352, -0.6336058, 3.844454, 1, 0, 0, 1, 1,
0.9507504, -1.441214, 3.482754, 1, 0, 0, 1, 1,
0.9511932, 0.1688833, 1.382516, 0, 0, 0, 1, 1,
0.9553336, 0.4587173, 0.5218032, 0, 0, 0, 1, 1,
0.9567266, 0.4817102, 2.487068, 0, 0, 0, 1, 1,
0.9637799, -0.03001687, 1.27251, 0, 0, 0, 1, 1,
0.9641684, 0.05877606, 2.492423, 0, 0, 0, 1, 1,
0.9709768, -0.04213217, 1.724353, 0, 0, 0, 1, 1,
0.9819072, -0.9871405, 2.239117, 0, 0, 0, 1, 1,
0.9870982, -0.7122994, 2.620177, 1, 1, 1, 1, 1,
0.9931034, -0.6681421, 2.507779, 1, 1, 1, 1, 1,
0.9942963, 1.87355, 0.3535348, 1, 1, 1, 1, 1,
0.9948959, 1.02123, 0.4954881, 1, 1, 1, 1, 1,
0.999217, -1.681661, 0.7916548, 1, 1, 1, 1, 1,
1.007851, -0.6033993, 1.232726, 1, 1, 1, 1, 1,
1.011147, -0.6957015, 2.20331, 1, 1, 1, 1, 1,
1.013447, -0.4882545, 3.574856, 1, 1, 1, 1, 1,
1.015467, 1.081416, 0.5634688, 1, 1, 1, 1, 1,
1.017551, -0.8397142, 2.295167, 1, 1, 1, 1, 1,
1.02211, -0.9966209, 2.324396, 1, 1, 1, 1, 1,
1.029066, 0.5681487, 0.08356845, 1, 1, 1, 1, 1,
1.029161, -0.5957696, 1.20636, 1, 1, 1, 1, 1,
1.030957, -0.02111259, 3.029062, 1, 1, 1, 1, 1,
1.033045, -0.8144118, 1.366171, 1, 1, 1, 1, 1,
1.033908, 0.6688761, 0.7724305, 0, 0, 1, 1, 1,
1.035057, -0.3075486, 1.558319, 1, 0, 0, 1, 1,
1.035426, 0.546635, 0.5300755, 1, 0, 0, 1, 1,
1.043353, -0.250113, 1.179237, 1, 0, 0, 1, 1,
1.054538, 1.750835, 0.3218586, 1, 0, 0, 1, 1,
1.057138, 0.04457786, 0.9510472, 1, 0, 0, 1, 1,
1.057934, 1.44567, -1.361669, 0, 0, 0, 1, 1,
1.062537, 1.290988, 0.02199578, 0, 0, 0, 1, 1,
1.070181, -1.243164, 2.408419, 0, 0, 0, 1, 1,
1.070733, 1.061611, -0.04874429, 0, 0, 0, 1, 1,
1.072077, -1.326772, 2.863502, 0, 0, 0, 1, 1,
1.074435, -0.1836857, 0.2280064, 0, 0, 0, 1, 1,
1.076165, 0.05186399, 0.6595456, 0, 0, 0, 1, 1,
1.077745, -0.5422618, 2.909795, 1, 1, 1, 1, 1,
1.081923, 0.04286157, 2.56663, 1, 1, 1, 1, 1,
1.086301, -1.061256, 1.932598, 1, 1, 1, 1, 1,
1.088409, 0.6736541, 1.196854, 1, 1, 1, 1, 1,
1.089875, -0.9565187, 1.856524, 1, 1, 1, 1, 1,
1.092814, -0.1867979, 1.81245, 1, 1, 1, 1, 1,
1.099847, 0.4207253, 0.7936277, 1, 1, 1, 1, 1,
1.105348, -0.9852818, 1.877636, 1, 1, 1, 1, 1,
1.10602, -0.8191208, 3.919901, 1, 1, 1, 1, 1,
1.109815, 0.9542103, 0.2507416, 1, 1, 1, 1, 1,
1.114814, 0.8904711, -1.561837, 1, 1, 1, 1, 1,
1.118507, 0.6547418, 1.764261, 1, 1, 1, 1, 1,
1.119089, 1.036692, -2.41025, 1, 1, 1, 1, 1,
1.119836, -0.4173025, 1.310198, 1, 1, 1, 1, 1,
1.128056, -0.9770622, 0.7647966, 1, 1, 1, 1, 1,
1.131247, 0.2933416, 1.034568, 0, 0, 1, 1, 1,
1.136582, 0.1209118, 1.287402, 1, 0, 0, 1, 1,
1.140375, -0.8267578, 2.504861, 1, 0, 0, 1, 1,
1.150571, -1.758922, 1.751127, 1, 0, 0, 1, 1,
1.159002, -0.2233053, 1.291801, 1, 0, 0, 1, 1,
1.171271, 0.8519856, 0.5161867, 1, 0, 0, 1, 1,
1.172665, 0.1662531, 2.613205, 0, 0, 0, 1, 1,
1.175791, -1.091946, 2.476339, 0, 0, 0, 1, 1,
1.178709, -1.121452, 3.396554, 0, 0, 0, 1, 1,
1.181404, 0.07586714, 0.870502, 0, 0, 0, 1, 1,
1.188603, 0.8269199, 0.4441373, 0, 0, 0, 1, 1,
1.195474, 0.1250661, 2.335972, 0, 0, 0, 1, 1,
1.195995, 1.478315, 0.6921166, 0, 0, 0, 1, 1,
1.196825, 2.327743, -0.4197522, 1, 1, 1, 1, 1,
1.197144, -0.8634362, -0.2689761, 1, 1, 1, 1, 1,
1.198299, 0.4041423, 0.04297955, 1, 1, 1, 1, 1,
1.203707, -0.1113809, 2.150082, 1, 1, 1, 1, 1,
1.206575, 1.728142, 0.8718149, 1, 1, 1, 1, 1,
1.215024, -0.6412833, 1.757213, 1, 1, 1, 1, 1,
1.219374, -0.4231699, 1.999226, 1, 1, 1, 1, 1,
1.221223, -0.3801571, -0.495877, 1, 1, 1, 1, 1,
1.221506, 0.2659348, 2.396295, 1, 1, 1, 1, 1,
1.223572, -1.574598, 2.337499, 1, 1, 1, 1, 1,
1.227825, -0.6094007, 2.040862, 1, 1, 1, 1, 1,
1.235235, -0.1711038, 1.669808, 1, 1, 1, 1, 1,
1.236022, 1.283382, -0.03598715, 1, 1, 1, 1, 1,
1.255563, 0.3757135, 1.717529, 1, 1, 1, 1, 1,
1.262039, 1.75896, -0.06489233, 1, 1, 1, 1, 1,
1.262283, -0.9999722, 2.334343, 0, 0, 1, 1, 1,
1.269245, -0.2860186, 0.525457, 1, 0, 0, 1, 1,
1.277299, -2.176698, 2.764063, 1, 0, 0, 1, 1,
1.278854, 0.4342517, 0.2020431, 1, 0, 0, 1, 1,
1.282802, 1.814457, 1.540039, 1, 0, 0, 1, 1,
1.287811, -1.027348, 0.7601771, 1, 0, 0, 1, 1,
1.288295, 0.1320392, 1.350129, 0, 0, 0, 1, 1,
1.292359, 0.9244905, 0.6307458, 0, 0, 0, 1, 1,
1.294539, 1.164722, 0.3876098, 0, 0, 0, 1, 1,
1.298476, 0.6101326, 2.576794, 0, 0, 0, 1, 1,
1.307561, 0.9245886, 1.66248, 0, 0, 0, 1, 1,
1.309441, 1.700986, 1.286843, 0, 0, 0, 1, 1,
1.31363, -1.21831, 2.64666, 0, 0, 0, 1, 1,
1.32383, 0.5083336, 1.011439, 1, 1, 1, 1, 1,
1.325917, 0.5284352, 1.281475, 1, 1, 1, 1, 1,
1.327667, 0.08122832, 0.8920307, 1, 1, 1, 1, 1,
1.329467, -0.1812148, 2.10779, 1, 1, 1, 1, 1,
1.33614, -0.2483415, 0.2937655, 1, 1, 1, 1, 1,
1.337702, -0.0955096, 2.60175, 1, 1, 1, 1, 1,
1.340259, -0.2930352, 1.922688, 1, 1, 1, 1, 1,
1.34222, 0.6511305, 1.886712, 1, 1, 1, 1, 1,
1.343022, -0.7575617, 2.732591, 1, 1, 1, 1, 1,
1.357025, -0.6347559, 3.192327, 1, 1, 1, 1, 1,
1.366757, 0.03978941, 3.742671, 1, 1, 1, 1, 1,
1.372229, -1.647026, 3.780284, 1, 1, 1, 1, 1,
1.378488, 0.1839425, 1.80865, 1, 1, 1, 1, 1,
1.391456, 2.21363, -0.7128171, 1, 1, 1, 1, 1,
1.397501, -1.009704, 2.49173, 1, 1, 1, 1, 1,
1.401084, 0.3196274, 2.421667, 0, 0, 1, 1, 1,
1.40232, 1.384014, -0.0796432, 1, 0, 0, 1, 1,
1.433456, -1.369831, 2.447358, 1, 0, 0, 1, 1,
1.434336, 1.745858, -0.4824441, 1, 0, 0, 1, 1,
1.43841, -0.8402554, 0.613372, 1, 0, 0, 1, 1,
1.446913, -1.098174, 0.7408481, 1, 0, 0, 1, 1,
1.449936, -1.015541, 2.756319, 0, 0, 0, 1, 1,
1.451215, -1.399639, 4.542616, 0, 0, 0, 1, 1,
1.458399, -0.6573508, 1.565671, 0, 0, 0, 1, 1,
1.459601, 0.5205802, 0.5135764, 0, 0, 0, 1, 1,
1.466534, -0.8832735, 2.977013, 0, 0, 0, 1, 1,
1.480098, -0.8188424, 1.622355, 0, 0, 0, 1, 1,
1.481584, 1.043957, 0.03151392, 0, 0, 0, 1, 1,
1.485109, 0.8567665, 1.672546, 1, 1, 1, 1, 1,
1.485182, 0.4327373, 1.992775, 1, 1, 1, 1, 1,
1.489356, -0.2892658, 1.869848, 1, 1, 1, 1, 1,
1.495835, 0.130632, 2.788687, 1, 1, 1, 1, 1,
1.500591, -0.9961076, 2.252077, 1, 1, 1, 1, 1,
1.514185, -0.3125056, 1.090353, 1, 1, 1, 1, 1,
1.527224, 0.4488994, 1.592456, 1, 1, 1, 1, 1,
1.557739, 1.16216, 0.09183478, 1, 1, 1, 1, 1,
1.559422, -0.6376173, 1.362484, 1, 1, 1, 1, 1,
1.573393, 2.821994, 1.048711, 1, 1, 1, 1, 1,
1.614368, -0.5784134, 4.078088, 1, 1, 1, 1, 1,
1.635939, -0.3586483, 0.003824738, 1, 1, 1, 1, 1,
1.649111, 0.4695352, 1.692982, 1, 1, 1, 1, 1,
1.657659, 1.449816, 2.125494, 1, 1, 1, 1, 1,
1.666105, -0.5595961, 2.675537, 1, 1, 1, 1, 1,
1.676034, 0.2697442, 2.0539, 0, 0, 1, 1, 1,
1.686522, -1.94347, 1.052511, 1, 0, 0, 1, 1,
1.697258, -1.297579, 0.8507713, 1, 0, 0, 1, 1,
1.728341, -1.095101, 1.368963, 1, 0, 0, 1, 1,
1.735111, -0.3487751, 0.9492046, 1, 0, 0, 1, 1,
1.737327, -1.070238, 2.276886, 1, 0, 0, 1, 1,
1.74086, 1.203127, 1.44917, 0, 0, 0, 1, 1,
1.770628, -0.5155768, 0.07864831, 0, 0, 0, 1, 1,
1.772148, -0.09459858, 1.262012, 0, 0, 0, 1, 1,
1.781001, -1.851313, 1.620817, 0, 0, 0, 1, 1,
1.786234, 0.1492507, 1.986732, 0, 0, 0, 1, 1,
1.791407, -0.4237076, 2.713015, 0, 0, 0, 1, 1,
1.796624, -0.9783896, 2.094234, 0, 0, 0, 1, 1,
1.82165, -1.151667, 0.9768965, 1, 1, 1, 1, 1,
1.845394, -0.1320213, 1.668481, 1, 1, 1, 1, 1,
1.84597, 0.2305887, 2.471836, 1, 1, 1, 1, 1,
1.850688, 0.009981549, 2.078015, 1, 1, 1, 1, 1,
1.870826, -0.5612604, 0.9884629, 1, 1, 1, 1, 1,
1.871279, 0.2632602, 0.4148422, 1, 1, 1, 1, 1,
1.895523, 0.9698206, 1.516999, 1, 1, 1, 1, 1,
1.927517, 0.6191845, -0.3615949, 1, 1, 1, 1, 1,
1.938686, 0.787417, 4.394956, 1, 1, 1, 1, 1,
1.967312, -0.7204327, 3.653069, 1, 1, 1, 1, 1,
1.992664, -0.9135785, 1.894886, 1, 1, 1, 1, 1,
2.00627, -0.3554984, 2.007325, 1, 1, 1, 1, 1,
2.018092, -0.5997179, 1.406309, 1, 1, 1, 1, 1,
2.029667, -1.762924, 2.426847, 1, 1, 1, 1, 1,
2.047634, 1.456514, 1.404107, 1, 1, 1, 1, 1,
2.063075, -0.5001477, 2.419025, 0, 0, 1, 1, 1,
2.075464, -0.5027523, 2.812753, 1, 0, 0, 1, 1,
2.085646, 0.9262487, 1.644178, 1, 0, 0, 1, 1,
2.09061, -2.534276, 0.9877297, 1, 0, 0, 1, 1,
2.103102, 0.5590597, 1.546757, 1, 0, 0, 1, 1,
2.148608, -1.012201, 1.196423, 1, 0, 0, 1, 1,
2.1775, -0.4904469, 0.843721, 0, 0, 0, 1, 1,
2.208107, 1.490506, 0.8506873, 0, 0, 0, 1, 1,
2.22313, -0.3570881, 1.46192, 0, 0, 0, 1, 1,
2.224438, -1.348112, 3.658236, 0, 0, 0, 1, 1,
2.254555, 0.475196, 1.042998, 0, 0, 0, 1, 1,
2.261219, -1.317728, 1.237515, 0, 0, 0, 1, 1,
2.317357, 0.8522024, 1.34102, 0, 0, 0, 1, 1,
2.363143, 1.649261, 2.338506, 1, 1, 1, 1, 1,
2.36347, 1.071884, 1.554876, 1, 1, 1, 1, 1,
2.430585, -1.280246, 1.636618, 1, 1, 1, 1, 1,
2.593417, 0.8579795, 0.594873, 1, 1, 1, 1, 1,
2.780936, -1.563751, 2.813376, 1, 1, 1, 1, 1,
2.80033, -1.495594, 1.33929, 1, 1, 1, 1, 1,
3.047239, -0.6442185, 1.396318, 1, 1, 1, 1, 1
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
var radius = 9.405693;
var distance = 33.0371;
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
mvMatrix.translate( -0.1843767, 0.1197455, 0.1239483 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.0371);
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
