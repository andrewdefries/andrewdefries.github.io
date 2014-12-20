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
-3.305669, 0.4702699, -2.505367, 1, 0, 0, 1,
-3.073198, -0.8342714, -0.4900389, 1, 0.007843138, 0, 1,
-3.022463, -0.6592876, -2.168813, 1, 0.01176471, 0, 1,
-2.828449, 1.223693, -0.2409739, 1, 0.01960784, 0, 1,
-2.81584, 0.4998985, -1.684137, 1, 0.02352941, 0, 1,
-2.731575, 1.077545, -2.652537, 1, 0.03137255, 0, 1,
-2.727204, 0.9608353, -1.283727, 1, 0.03529412, 0, 1,
-2.697016, 0.6760083, -1.726933, 1, 0.04313726, 0, 1,
-2.656213, -0.5385152, -1.93962, 1, 0.04705882, 0, 1,
-2.608213, 0.5655547, -1.181303, 1, 0.05490196, 0, 1,
-2.580663, -0.4643762, -1.328524, 1, 0.05882353, 0, 1,
-2.460539, 0.2372227, -2.387446, 1, 0.06666667, 0, 1,
-2.455193, -1.597603, -4.893536, 1, 0.07058824, 0, 1,
-2.432057, 0.5482922, -1.734943, 1, 0.07843138, 0, 1,
-2.392658, 0.7913972, -0.8951561, 1, 0.08235294, 0, 1,
-2.360449, -0.4231102, -0.9042398, 1, 0.09019608, 0, 1,
-2.329408, 0.9573443, -2.762229, 1, 0.09411765, 0, 1,
-2.283314, 1.789278, -0.8387688, 1, 0.1019608, 0, 1,
-2.190808, -1.276052, -2.02104, 1, 0.1098039, 0, 1,
-2.155975, 0.2181246, -1.675052, 1, 0.1137255, 0, 1,
-2.14419, 0.0374479, -1.188047, 1, 0.1215686, 0, 1,
-2.12859, -1.749803, -1.230211, 1, 0.1254902, 0, 1,
-2.121469, -0.07883131, -2.935278, 1, 0.1333333, 0, 1,
-2.086824, -0.02342738, -3.433823, 1, 0.1372549, 0, 1,
-2.079863, -0.2701804, -1.486469, 1, 0.145098, 0, 1,
-2.069004, 0.4079491, -2.28617, 1, 0.1490196, 0, 1,
-2.063765, 0.3411684, -0.8243485, 1, 0.1568628, 0, 1,
-2.010268, -0.2004448, -2.781171, 1, 0.1607843, 0, 1,
-2.001899, 1.320901, -1.624497, 1, 0.1686275, 0, 1,
-1.986175, -0.1568476, -1.609279, 1, 0.172549, 0, 1,
-1.981287, -1.350909, -1.865185, 1, 0.1803922, 0, 1,
-1.961798, -0.8771406, -3.774919, 1, 0.1843137, 0, 1,
-1.959117, 0.5423396, -1.232002, 1, 0.1921569, 0, 1,
-1.953372, -0.2482421, -1.260364, 1, 0.1960784, 0, 1,
-1.948591, -0.7491056, -2.033312, 1, 0.2039216, 0, 1,
-1.93673, 0.03961665, -1.619834, 1, 0.2117647, 0, 1,
-1.930215, 1.243607, -1.545985, 1, 0.2156863, 0, 1,
-1.915367, 0.4487052, -1.311891, 1, 0.2235294, 0, 1,
-1.907873, -1.296588, -2.23762, 1, 0.227451, 0, 1,
-1.907472, -0.1830239, -3.986456, 1, 0.2352941, 0, 1,
-1.84761, 0.7449742, -1.610963, 1, 0.2392157, 0, 1,
-1.822838, -0.1410997, 0.6587583, 1, 0.2470588, 0, 1,
-1.816276, 2.013775, -0.6746081, 1, 0.2509804, 0, 1,
-1.796, -0.3998915, -4.311906, 1, 0.2588235, 0, 1,
-1.793036, -1.03961, -2.393306, 1, 0.2627451, 0, 1,
-1.750732, 1.034699, -0.43545, 1, 0.2705882, 0, 1,
-1.743563, 0.5022565, -1.864732, 1, 0.2745098, 0, 1,
-1.742786, 1.911557, -1.104353, 1, 0.282353, 0, 1,
-1.742209, -0.286043, -3.380891, 1, 0.2862745, 0, 1,
-1.740386, -0.9315372, -2.524878, 1, 0.2941177, 0, 1,
-1.72755, 0.1960761, -2.137591, 1, 0.3019608, 0, 1,
-1.72704, -0.7316628, -2.344955, 1, 0.3058824, 0, 1,
-1.710794, 0.5932099, 0.7229776, 1, 0.3137255, 0, 1,
-1.707104, 0.8571731, -2.151159, 1, 0.3176471, 0, 1,
-1.691015, 1.5754, 0.1502752, 1, 0.3254902, 0, 1,
-1.685544, 1.508935, -0.01016027, 1, 0.3294118, 0, 1,
-1.672738, 0.6281214, -1.431168, 1, 0.3372549, 0, 1,
-1.666098, -0.1189307, -2.154209, 1, 0.3411765, 0, 1,
-1.662765, 0.4154136, -2.546652, 1, 0.3490196, 0, 1,
-1.662734, 0.8265218, -0.3970256, 1, 0.3529412, 0, 1,
-1.660544, -0.9036778, -2.622027, 1, 0.3607843, 0, 1,
-1.654584, 1.126964, -1.344881, 1, 0.3647059, 0, 1,
-1.644295, -0.7958708, -2.226567, 1, 0.372549, 0, 1,
-1.643316, 0.1756555, -2.693734, 1, 0.3764706, 0, 1,
-1.641056, -0.2105152, -0.5143451, 1, 0.3843137, 0, 1,
-1.623652, 0.1391323, -2.176143, 1, 0.3882353, 0, 1,
-1.617634, -0.6735133, -2.196496, 1, 0.3960784, 0, 1,
-1.614589, -0.2951214, -2.526093, 1, 0.4039216, 0, 1,
-1.601131, -1.317673, -2.003124, 1, 0.4078431, 0, 1,
-1.600599, 2.920065, -0.6424832, 1, 0.4156863, 0, 1,
-1.596106, -0.9717071, -2.237445, 1, 0.4196078, 0, 1,
-1.594312, -1.483051, -1.388691, 1, 0.427451, 0, 1,
-1.573417, 1.32116, -2.508687, 1, 0.4313726, 0, 1,
-1.572244, -0.783108, -0.4416487, 1, 0.4392157, 0, 1,
-1.568347, -0.776822, -4.070709, 1, 0.4431373, 0, 1,
-1.543637, 1.140942, -1.267475, 1, 0.4509804, 0, 1,
-1.529704, -1.166817, -3.950535, 1, 0.454902, 0, 1,
-1.528299, 1.208776, -0.8303515, 1, 0.4627451, 0, 1,
-1.527922, 1.986377, -1.928379, 1, 0.4666667, 0, 1,
-1.513911, -0.05604618, -0.4425521, 1, 0.4745098, 0, 1,
-1.506332, 0.4792726, -1.194127, 1, 0.4784314, 0, 1,
-1.4834, 0.09919588, -0.8530148, 1, 0.4862745, 0, 1,
-1.478643, 0.300687, -2.206098, 1, 0.4901961, 0, 1,
-1.477704, -1.949761, -1.901577, 1, 0.4980392, 0, 1,
-1.477497, 0.1000051, -1.975381, 1, 0.5058824, 0, 1,
-1.476006, 0.06597476, 0.0363885, 1, 0.509804, 0, 1,
-1.461407, 0.1060329, -0.3812335, 1, 0.5176471, 0, 1,
-1.440329, 0.4571372, -0.8054663, 1, 0.5215687, 0, 1,
-1.43237, 1.317657, -0.902283, 1, 0.5294118, 0, 1,
-1.420069, -1.041735, -2.998565, 1, 0.5333334, 0, 1,
-1.417758, -0.7973624, -1.498861, 1, 0.5411765, 0, 1,
-1.416019, -0.4649997, -2.903762, 1, 0.5450981, 0, 1,
-1.412923, 0.9850384, -1.438662, 1, 0.5529412, 0, 1,
-1.402926, -1.174442, -2.366068, 1, 0.5568628, 0, 1,
-1.399003, 0.1650254, -1.179649, 1, 0.5647059, 0, 1,
-1.391553, -1.290012, -1.965893, 1, 0.5686275, 0, 1,
-1.386774, 1.467647, -1.810639, 1, 0.5764706, 0, 1,
-1.383354, 0.8163588, -2.169374, 1, 0.5803922, 0, 1,
-1.368847, 0.533304, -1.046898, 1, 0.5882353, 0, 1,
-1.366112, 0.7874822, -1.57036, 1, 0.5921569, 0, 1,
-1.365571, -0.4236111, -1.95284, 1, 0.6, 0, 1,
-1.363542, 0.147921, -3.14053, 1, 0.6078432, 0, 1,
-1.358045, 1.146436, -0.4573921, 1, 0.6117647, 0, 1,
-1.356339, -0.8018255, -2.959261, 1, 0.6196079, 0, 1,
-1.344183, -1.436916, -2.113126, 1, 0.6235294, 0, 1,
-1.343175, -0.5042003, -2.480831, 1, 0.6313726, 0, 1,
-1.334303, -0.4073164, -2.808604, 1, 0.6352941, 0, 1,
-1.324104, -0.6724926, -1.277709, 1, 0.6431373, 0, 1,
-1.32196, 0.5228168, -3.4275, 1, 0.6470588, 0, 1,
-1.311478, 0.7459237, -0.9447026, 1, 0.654902, 0, 1,
-1.307635, 0.7099733, -0.9768006, 1, 0.6588235, 0, 1,
-1.287641, -0.6880277, -1.527014, 1, 0.6666667, 0, 1,
-1.286579, -1.814037, -4.638682, 1, 0.6705883, 0, 1,
-1.280067, 0.0277779, -0.4639513, 1, 0.6784314, 0, 1,
-1.278324, 0.5004852, -2.298988, 1, 0.682353, 0, 1,
-1.274793, -1.317257, -2.279868, 1, 0.6901961, 0, 1,
-1.272725, -0.3055936, -2.445206, 1, 0.6941177, 0, 1,
-1.261589, -0.4349581, -0.9154692, 1, 0.7019608, 0, 1,
-1.255058, -0.6143353, -2.697953, 1, 0.7098039, 0, 1,
-1.24596, 0.0733766, -0.420571, 1, 0.7137255, 0, 1,
-1.243517, -0.163429, -2.737772, 1, 0.7215686, 0, 1,
-1.241834, 0.4321771, -0.5452907, 1, 0.7254902, 0, 1,
-1.238305, 1.378516, -1.659882, 1, 0.7333333, 0, 1,
-1.235785, -0.616743, -1.282354, 1, 0.7372549, 0, 1,
-1.226923, 0.2975945, -2.76948, 1, 0.7450981, 0, 1,
-1.223734, -2.066803, -4.493282, 1, 0.7490196, 0, 1,
-1.215901, -1.46548, -1.645708, 1, 0.7568628, 0, 1,
-1.215811, -0.3805848, -3.252698, 1, 0.7607843, 0, 1,
-1.211675, 0.9550577, -0.6668097, 1, 0.7686275, 0, 1,
-1.210692, 0.3139476, -1.424812, 1, 0.772549, 0, 1,
-1.206534, 2.204796, -2.530945, 1, 0.7803922, 0, 1,
-1.188614, -1.677729, -3.604678, 1, 0.7843137, 0, 1,
-1.18416, 0.5685529, -0.9931275, 1, 0.7921569, 0, 1,
-1.183103, 0.4170365, -1.275716, 1, 0.7960784, 0, 1,
-1.182124, -0.5239718, -0.7140397, 1, 0.8039216, 0, 1,
-1.180744, -2.613089, -3.005814, 1, 0.8117647, 0, 1,
-1.175362, -2.089222, -3.482984, 1, 0.8156863, 0, 1,
-1.172745, -0.5213289, -2.775438, 1, 0.8235294, 0, 1,
-1.168889, 0.07147609, -1.157329, 1, 0.827451, 0, 1,
-1.16441, -1.518947, -2.888278, 1, 0.8352941, 0, 1,
-1.162586, 1.250817, 0.1238424, 1, 0.8392157, 0, 1,
-1.157266, -0.9944788, -1.109206, 1, 0.8470588, 0, 1,
-1.153367, 0.005546435, -2.404173, 1, 0.8509804, 0, 1,
-1.134738, 0.4243182, 0.2444067, 1, 0.8588235, 0, 1,
-1.133238, 0.753323, -1.546544, 1, 0.8627451, 0, 1,
-1.130435, -0.8585799, -1.129684, 1, 0.8705882, 0, 1,
-1.126411, -1.681142, -3.796104, 1, 0.8745098, 0, 1,
-1.126076, -1.723093, -3.094377, 1, 0.8823529, 0, 1,
-1.119986, -0.2830795, -3.05354, 1, 0.8862745, 0, 1,
-1.116679, 0.2946122, -1.961959, 1, 0.8941177, 0, 1,
-1.113345, -0.2733105, -1.822536, 1, 0.8980392, 0, 1,
-1.105611, -0.3829677, 0.6366256, 1, 0.9058824, 0, 1,
-1.102539, -0.1118518, 0.1396435, 1, 0.9137255, 0, 1,
-1.0972, -0.4533381, -2.86108, 1, 0.9176471, 0, 1,
-1.084244, -1.52211, -2.411367, 1, 0.9254902, 0, 1,
-1.07655, 0.6239334, -2.415949, 1, 0.9294118, 0, 1,
-1.074522, -0.7724285, -2.232062, 1, 0.9372549, 0, 1,
-1.067561, -0.5120372, -2.565815, 1, 0.9411765, 0, 1,
-1.058809, -1.296602, -2.707769, 1, 0.9490196, 0, 1,
-1.056726, -0.4777403, -1.777273, 1, 0.9529412, 0, 1,
-1.05418, 1.490186, -1.297288, 1, 0.9607843, 0, 1,
-1.05398, 1.20713, 0.8697695, 1, 0.9647059, 0, 1,
-1.049309, 0.496843, -0.800917, 1, 0.972549, 0, 1,
-1.036488, -1.381643, -2.923077, 1, 0.9764706, 0, 1,
-1.036101, -0.5204976, -1.833948, 1, 0.9843137, 0, 1,
-1.033068, 1.738298, -0.1820149, 1, 0.9882353, 0, 1,
-1.031955, 1.230744, -1.346123, 1, 0.9960784, 0, 1,
-1.029472, -0.6122373, -0.2833926, 0.9960784, 1, 0, 1,
-1.028003, -0.5767159, -4.153383, 0.9921569, 1, 0, 1,
-1.02706, 1.332993, -2.657144, 0.9843137, 1, 0, 1,
-1.016001, 1.006909, 0.5660132, 0.9803922, 1, 0, 1,
-1.010501, -2.142689, -3.152949, 0.972549, 1, 0, 1,
-1.009969, -0.5904248, -0.8184296, 0.9686275, 1, 0, 1,
-1.008721, 1.181937, -2.222438, 0.9607843, 1, 0, 1,
-1.00089, -1.009371, -1.835212, 0.9568627, 1, 0, 1,
-0.9976436, -0.3903825, -1.804081, 0.9490196, 1, 0, 1,
-0.996366, 1.261331, 0.5289378, 0.945098, 1, 0, 1,
-0.9961858, -1.629679, -0.540668, 0.9372549, 1, 0, 1,
-0.9881645, 0.3037053, -0.08289831, 0.9333333, 1, 0, 1,
-0.9860412, 0.3209074, -0.03899507, 0.9254902, 1, 0, 1,
-0.9817503, 2.164643, -1.74094, 0.9215686, 1, 0, 1,
-0.9805068, 0.8478602, -2.404447, 0.9137255, 1, 0, 1,
-0.9803814, -0.0158017, -1.085845, 0.9098039, 1, 0, 1,
-0.9799449, -0.8764421, -1.974677, 0.9019608, 1, 0, 1,
-0.979798, -0.7982351, -2.587684, 0.8941177, 1, 0, 1,
-0.9785409, 0.02478667, -1.073285, 0.8901961, 1, 0, 1,
-0.9746152, 0.3408724, -0.6479432, 0.8823529, 1, 0, 1,
-0.9699429, -1.637375, -3.690516, 0.8784314, 1, 0, 1,
-0.9662155, 0.6326203, -0.5824874, 0.8705882, 1, 0, 1,
-0.9638124, 0.2312405, -1.349731, 0.8666667, 1, 0, 1,
-0.9605458, 1.255738, -0.3071424, 0.8588235, 1, 0, 1,
-0.9600258, 1.62278, 0.1414126, 0.854902, 1, 0, 1,
-0.9597024, 0.2558465, -0.6987074, 0.8470588, 1, 0, 1,
-0.9579628, -0.753087, -2.049561, 0.8431373, 1, 0, 1,
-0.955788, 0.8791515, -1.505769, 0.8352941, 1, 0, 1,
-0.9536002, 0.4929003, -1.942146, 0.8313726, 1, 0, 1,
-0.952676, 0.1755739, -2.309081, 0.8235294, 1, 0, 1,
-0.9514505, -0.5975717, -0.5768915, 0.8196079, 1, 0, 1,
-0.943056, 0.4936582, -0.7001566, 0.8117647, 1, 0, 1,
-0.9396396, -0.2529749, -1.476588, 0.8078431, 1, 0, 1,
-0.9376995, -0.9152969, -0.4469487, 0.8, 1, 0, 1,
-0.9328543, -0.03411923, 0.2868304, 0.7921569, 1, 0, 1,
-0.921872, -0.4786738, -3.16752, 0.7882353, 1, 0, 1,
-0.9163559, 0.3782988, -0.846085, 0.7803922, 1, 0, 1,
-0.9122573, 0.3303142, -0.3148553, 0.7764706, 1, 0, 1,
-0.899684, 0.06145931, -3.304968, 0.7686275, 1, 0, 1,
-0.894951, -0.2360739, -2.767463, 0.7647059, 1, 0, 1,
-0.8922007, -0.3662808, -1.019346, 0.7568628, 1, 0, 1,
-0.8850434, -0.1892186, -3.02107, 0.7529412, 1, 0, 1,
-0.8821408, -0.51946, -1.780129, 0.7450981, 1, 0, 1,
-0.8764259, 0.7417986, -0.7515914, 0.7411765, 1, 0, 1,
-0.8721019, 0.8104511, -0.7267512, 0.7333333, 1, 0, 1,
-0.8678276, -0.2569812, -1.526511, 0.7294118, 1, 0, 1,
-0.8653795, -2.842148, -2.202706, 0.7215686, 1, 0, 1,
-0.8627868, -0.08863721, -0.8724126, 0.7176471, 1, 0, 1,
-0.8602132, -0.282197, -3.322229, 0.7098039, 1, 0, 1,
-0.858916, 0.7828359, -1.230804, 0.7058824, 1, 0, 1,
-0.8580604, -1.135781, -3.442126, 0.6980392, 1, 0, 1,
-0.8482488, 0.8962078, -0.8695138, 0.6901961, 1, 0, 1,
-0.8478272, -0.7775285, -3.053122, 0.6862745, 1, 0, 1,
-0.8459606, 0.3229808, -0.4042633, 0.6784314, 1, 0, 1,
-0.8458632, 0.4134254, -2.320473, 0.6745098, 1, 0, 1,
-0.8422652, -1.746639, -2.955627, 0.6666667, 1, 0, 1,
-0.831821, -0.6668929, -1.495548, 0.6627451, 1, 0, 1,
-0.8297434, -1.712621, -2.224709, 0.654902, 1, 0, 1,
-0.8261443, -1.104381, -1.558332, 0.6509804, 1, 0, 1,
-0.8257117, 1.137228, -0.8724255, 0.6431373, 1, 0, 1,
-0.8222318, -0.7947721, -3.213238, 0.6392157, 1, 0, 1,
-0.8186799, -0.5756018, -2.203856, 0.6313726, 1, 0, 1,
-0.8162329, 0.4472942, -0.3051948, 0.627451, 1, 0, 1,
-0.8147993, 0.8012084, -1.908362, 0.6196079, 1, 0, 1,
-0.8140789, 0.2694122, -1.357661, 0.6156863, 1, 0, 1,
-0.8137953, -0.436395, -1.003032, 0.6078432, 1, 0, 1,
-0.7998299, -0.08808966, -2.695795, 0.6039216, 1, 0, 1,
-0.7948083, 0.713841, -1.570545, 0.5960785, 1, 0, 1,
-0.786006, 0.7249407, -0.3978839, 0.5882353, 1, 0, 1,
-0.7784494, 0.325572, -1.904326, 0.5843138, 1, 0, 1,
-0.7677929, -0.09508558, -0.6333084, 0.5764706, 1, 0, 1,
-0.7653682, 1.897766, -1.521295, 0.572549, 1, 0, 1,
-0.7628378, 0.042218, -1.130014, 0.5647059, 1, 0, 1,
-0.7601596, 0.6959403, -0.4272805, 0.5607843, 1, 0, 1,
-0.756085, -1.110957, -2.16204, 0.5529412, 1, 0, 1,
-0.7523407, -0.5528058, -1.962498, 0.5490196, 1, 0, 1,
-0.7473959, -1.314334, -4.119005, 0.5411765, 1, 0, 1,
-0.7408851, -0.1191596, -0.8379077, 0.5372549, 1, 0, 1,
-0.7326396, 1.118293, -0.02976151, 0.5294118, 1, 0, 1,
-0.7314324, 2.061392, -0.5164023, 0.5254902, 1, 0, 1,
-0.729359, 0.004656839, -3.525136, 0.5176471, 1, 0, 1,
-0.727096, 0.173647, -0.3086252, 0.5137255, 1, 0, 1,
-0.7240413, 0.6114957, -0.5979399, 0.5058824, 1, 0, 1,
-0.7224976, -1.089386, 0.222225, 0.5019608, 1, 0, 1,
-0.7191824, 2.047383, -1.160728, 0.4941176, 1, 0, 1,
-0.7116911, 1.232723, -0.07673583, 0.4862745, 1, 0, 1,
-0.7072235, 0.01580953, -1.377838, 0.4823529, 1, 0, 1,
-0.6998436, 1.049028, -2.528241, 0.4745098, 1, 0, 1,
-0.6917144, 1.033425, 0.4006197, 0.4705882, 1, 0, 1,
-0.6913428, 0.7106109, -1.7669, 0.4627451, 1, 0, 1,
-0.6904739, -0.3219833, -2.911036, 0.4588235, 1, 0, 1,
-0.6854649, -0.6917186, -3.210254, 0.4509804, 1, 0, 1,
-0.685074, 0.3508985, -1.316441, 0.4470588, 1, 0, 1,
-0.6821188, -0.06083535, -0.4045515, 0.4392157, 1, 0, 1,
-0.6793618, -1.315364, -1.736568, 0.4352941, 1, 0, 1,
-0.671924, -1.38615, -2.691953, 0.427451, 1, 0, 1,
-0.6717254, 0.8391865, -0.1354444, 0.4235294, 1, 0, 1,
-0.6699942, 0.7376352, -1.628043, 0.4156863, 1, 0, 1,
-0.6668661, -1.460819, -1.394558, 0.4117647, 1, 0, 1,
-0.6624193, -0.1818098, -2.433429, 0.4039216, 1, 0, 1,
-0.6616444, -0.6717218, -4.213383, 0.3960784, 1, 0, 1,
-0.6582301, 1.015058, -2.151349, 0.3921569, 1, 0, 1,
-0.6577467, -0.02264726, -1.063189, 0.3843137, 1, 0, 1,
-0.6575683, -0.4410341, -3.216411, 0.3803922, 1, 0, 1,
-0.6554751, 0.1948506, -1.880167, 0.372549, 1, 0, 1,
-0.6552631, -0.5708288, -2.788899, 0.3686275, 1, 0, 1,
-0.6439373, -1.011631, -3.981208, 0.3607843, 1, 0, 1,
-0.6416806, -0.01750555, -2.365593, 0.3568628, 1, 0, 1,
-0.6413469, -1.918704, -1.318018, 0.3490196, 1, 0, 1,
-0.6377316, 0.5810372, -1.934413, 0.345098, 1, 0, 1,
-0.6372127, 2.514126, -1.468896, 0.3372549, 1, 0, 1,
-0.6313722, -0.436689, -1.466442, 0.3333333, 1, 0, 1,
-0.6310923, 0.4658181, -0.7108644, 0.3254902, 1, 0, 1,
-0.6306732, 0.9696864, 0.1770061, 0.3215686, 1, 0, 1,
-0.6285751, -1.876911, -2.586864, 0.3137255, 1, 0, 1,
-0.6211137, 1.042908, -0.9684249, 0.3098039, 1, 0, 1,
-0.6161262, 0.6048006, 0.1005909, 0.3019608, 1, 0, 1,
-0.6155782, 0.005474973, -0.4491026, 0.2941177, 1, 0, 1,
-0.6134812, 1.107171, -0.9617842, 0.2901961, 1, 0, 1,
-0.6123911, 0.2582738, -2.179826, 0.282353, 1, 0, 1,
-0.6107779, 1.206396, 0.4942716, 0.2784314, 1, 0, 1,
-0.6073621, 0.4823702, -0.08093953, 0.2705882, 1, 0, 1,
-0.5991688, -1.085923, -3.332418, 0.2666667, 1, 0, 1,
-0.5990437, 1.130966, -0.5188468, 0.2588235, 1, 0, 1,
-0.5983049, -0.176949, -2.660513, 0.254902, 1, 0, 1,
-0.597447, 1.169042, 0.7303675, 0.2470588, 1, 0, 1,
-0.5944808, -0.1778098, -1.417886, 0.2431373, 1, 0, 1,
-0.5903897, -1.469681, -1.804154, 0.2352941, 1, 0, 1,
-0.5902352, -1.586432, -3.259007, 0.2313726, 1, 0, 1,
-0.5857381, -1.073847, -1.81763, 0.2235294, 1, 0, 1,
-0.5851397, -0.4193941, -2.577785, 0.2196078, 1, 0, 1,
-0.5846189, -1.39119, -3.724569, 0.2117647, 1, 0, 1,
-0.5787751, 0.7623104, -0.6234441, 0.2078431, 1, 0, 1,
-0.5762661, -1.526975, -2.304765, 0.2, 1, 0, 1,
-0.5719507, 0.1888073, -0.9426859, 0.1921569, 1, 0, 1,
-0.5698792, -0.8687504, -1.950437, 0.1882353, 1, 0, 1,
-0.5685728, 0.5454501, -1.861807, 0.1803922, 1, 0, 1,
-0.5632731, 1.594115, 1.712552, 0.1764706, 1, 0, 1,
-0.5610267, 0.5094879, -2.186067, 0.1686275, 1, 0, 1,
-0.5545388, 0.3059608, -0.06025698, 0.1647059, 1, 0, 1,
-0.5526333, -1.630148, -2.711862, 0.1568628, 1, 0, 1,
-0.5516834, 0.08898395, -1.163927, 0.1529412, 1, 0, 1,
-0.5495746, -0.2028503, -0.6077062, 0.145098, 1, 0, 1,
-0.5483645, -0.8009461, -3.604794, 0.1411765, 1, 0, 1,
-0.5477271, 0.4328716, -0.5421093, 0.1333333, 1, 0, 1,
-0.5442581, 1.129079, -0.9918276, 0.1294118, 1, 0, 1,
-0.5420778, -1.27285, -3.625501, 0.1215686, 1, 0, 1,
-0.5384574, 0.01451348, -0.3205383, 0.1176471, 1, 0, 1,
-0.5292487, -0.1711946, -2.350214, 0.1098039, 1, 0, 1,
-0.5291861, -1.290717, -2.70291, 0.1058824, 1, 0, 1,
-0.525372, -0.02195126, -1.452751, 0.09803922, 1, 0, 1,
-0.5251962, -1.295484, -1.434617, 0.09019608, 1, 0, 1,
-0.524156, -2.34158, -5.521626, 0.08627451, 1, 0, 1,
-0.5193965, -1.01277, -3.449197, 0.07843138, 1, 0, 1,
-0.5146863, 1.931774, 1.105589, 0.07450981, 1, 0, 1,
-0.5138704, 2.080864, -0.2578174, 0.06666667, 1, 0, 1,
-0.5105847, 0.9831882, -1.609559, 0.0627451, 1, 0, 1,
-0.5084383, 1.231956, -1.385986, 0.05490196, 1, 0, 1,
-0.5040034, -0.4984498, -2.517143, 0.05098039, 1, 0, 1,
-0.5020459, -1.551919, -4.608807, 0.04313726, 1, 0, 1,
-0.5015196, -2.045673, -2.088479, 0.03921569, 1, 0, 1,
-0.4997616, 0.991383, -0.4178667, 0.03137255, 1, 0, 1,
-0.4992482, -0.9702733, -1.588424, 0.02745098, 1, 0, 1,
-0.4963667, 0.2969394, 1.125224, 0.01960784, 1, 0, 1,
-0.4963451, -2.397722, -1.246711, 0.01568628, 1, 0, 1,
-0.4955495, -0.2697845, -1.475921, 0.007843138, 1, 0, 1,
-0.494522, -1.106308, -3.317787, 0.003921569, 1, 0, 1,
-0.4910546, -0.04438497, 0.8845766, 0, 1, 0.003921569, 1,
-0.4814321, 0.7685474, -3.164601, 0, 1, 0.01176471, 1,
-0.4814084, -1.790198, -3.141273, 0, 1, 0.01568628, 1,
-0.4804867, -0.9843346, -3.559475, 0, 1, 0.02352941, 1,
-0.4769684, -0.4571734, -2.817557, 0, 1, 0.02745098, 1,
-0.4716384, -1.743976, -1.032356, 0, 1, 0.03529412, 1,
-0.4706657, -0.7194008, -3.063932, 0, 1, 0.03921569, 1,
-0.4688645, -0.6135634, -3.477983, 0, 1, 0.04705882, 1,
-0.4651237, -0.4218045, -2.130954, 0, 1, 0.05098039, 1,
-0.464998, 1.344055, -0.09223596, 0, 1, 0.05882353, 1,
-0.4632246, -0.1141892, -1.530612, 0, 1, 0.0627451, 1,
-0.4537466, 0.2878267, -1.518245, 0, 1, 0.07058824, 1,
-0.4500421, -1.461871, -2.804272, 0, 1, 0.07450981, 1,
-0.4420843, 0.1516747, -1.838856, 0, 1, 0.08235294, 1,
-0.4391783, -0.3691498, -1.668283, 0, 1, 0.08627451, 1,
-0.4319778, -1.676022, -5.506382, 0, 1, 0.09411765, 1,
-0.4276387, -0.3017909, -1.566409, 0, 1, 0.1019608, 1,
-0.4210658, -0.2686594, -1.363188, 0, 1, 0.1058824, 1,
-0.4202563, 0.7006884, 1.164221, 0, 1, 0.1137255, 1,
-0.4194618, -0.1306552, -1.261358, 0, 1, 0.1176471, 1,
-0.4174695, -0.07427422, -2.787199, 0, 1, 0.1254902, 1,
-0.4164103, -0.4641992, -3.583399, 0, 1, 0.1294118, 1,
-0.4152808, 0.9241571, -1.219482, 0, 1, 0.1372549, 1,
-0.4120988, 0.816121, -3.652847, 0, 1, 0.1411765, 1,
-0.4109912, 0.8065976, -1.048982, 0, 1, 0.1490196, 1,
-0.4108744, -1.049471, -3.018607, 0, 1, 0.1529412, 1,
-0.4095956, 0.1775358, 0.2084028, 0, 1, 0.1607843, 1,
-0.4094853, 1.096803, 0.2381258, 0, 1, 0.1647059, 1,
-0.401608, -0.6044005, -2.79417, 0, 1, 0.172549, 1,
-0.4010402, 0.2880589, -1.017762, 0, 1, 0.1764706, 1,
-0.4003837, -0.8015881, -2.373563, 0, 1, 0.1843137, 1,
-0.3993469, -0.2589322, -2.232184, 0, 1, 0.1882353, 1,
-0.3977055, -0.7322096, -2.636993, 0, 1, 0.1960784, 1,
-0.3959879, -0.09620097, -1.573521, 0, 1, 0.2039216, 1,
-0.3945039, 0.02065662, -2.392187, 0, 1, 0.2078431, 1,
-0.3865675, -0.1433958, -4.369104, 0, 1, 0.2156863, 1,
-0.3848501, -1.214146, -3.957496, 0, 1, 0.2196078, 1,
-0.3807282, 0.3854532, 0.663482, 0, 1, 0.227451, 1,
-0.380292, -1.401333, -2.72583, 0, 1, 0.2313726, 1,
-0.379614, -0.8079821, -2.680015, 0, 1, 0.2392157, 1,
-0.3707544, -1.552499, -3.733583, 0, 1, 0.2431373, 1,
-0.3699773, -0.330304, -5.098738, 0, 1, 0.2509804, 1,
-0.3698789, -2.12978, -3.587027, 0, 1, 0.254902, 1,
-0.3675059, 0.2594099, -2.087465, 0, 1, 0.2627451, 1,
-0.3666365, 1.679985, 0.05986319, 0, 1, 0.2666667, 1,
-0.3664872, -1.104027, -2.978643, 0, 1, 0.2745098, 1,
-0.3623907, -0.8311421, -2.959776, 0, 1, 0.2784314, 1,
-0.3617721, -0.1249838, -3.137168, 0, 1, 0.2862745, 1,
-0.3520723, -0.1165075, -1.832985, 0, 1, 0.2901961, 1,
-0.3501341, -1.848553, -2.037745, 0, 1, 0.2980392, 1,
-0.3468249, 0.1469495, -0.4948977, 0, 1, 0.3058824, 1,
-0.3454462, 0.5986735, -0.3846222, 0, 1, 0.3098039, 1,
-0.3443388, 0.9498134, 1.512834, 0, 1, 0.3176471, 1,
-0.3383682, 0.9619037, 0.968085, 0, 1, 0.3215686, 1,
-0.338235, 1.763423, -0.35149, 0, 1, 0.3294118, 1,
-0.3374805, -0.1394203, -0.08311945, 0, 1, 0.3333333, 1,
-0.3373467, 0.5721887, 0.4481675, 0, 1, 0.3411765, 1,
-0.3332447, -0.5084088, -4.833928, 0, 1, 0.345098, 1,
-0.332886, -1.841303, -1.310411, 0, 1, 0.3529412, 1,
-0.3322378, -1.667115, -4.098481, 0, 1, 0.3568628, 1,
-0.3318947, -0.2608542, -2.139797, 0, 1, 0.3647059, 1,
-0.3287122, -0.5399258, -3.720179, 0, 1, 0.3686275, 1,
-0.3285482, 1.336066, -1.483563, 0, 1, 0.3764706, 1,
-0.3261171, -0.8541829, -1.844505, 0, 1, 0.3803922, 1,
-0.3210831, 0.8981724, -0.3482075, 0, 1, 0.3882353, 1,
-0.3175703, -0.8934612, -2.402406, 0, 1, 0.3921569, 1,
-0.3163739, 0.1902958, -3.377541, 0, 1, 0.4, 1,
-0.3108615, -0.2828844, -2.241513, 0, 1, 0.4078431, 1,
-0.3101612, -0.3451991, -5.120124, 0, 1, 0.4117647, 1,
-0.3027858, 0.036459, -0.6034146, 0, 1, 0.4196078, 1,
-0.3001483, 0.8622977, 0.5202569, 0, 1, 0.4235294, 1,
-0.2841069, 0.09408264, -0.3848249, 0, 1, 0.4313726, 1,
-0.2836284, -0.4367557, -2.432316, 0, 1, 0.4352941, 1,
-0.2824405, -2.098921, -3.90232, 0, 1, 0.4431373, 1,
-0.2766357, -0.6388096, -2.153454, 0, 1, 0.4470588, 1,
-0.2761938, 1.23181, 0.3152763, 0, 1, 0.454902, 1,
-0.2700715, -0.4951288, -3.160966, 0, 1, 0.4588235, 1,
-0.2698596, 1.357059, 0.2029851, 0, 1, 0.4666667, 1,
-0.2678523, -0.2410863, -1.989975, 0, 1, 0.4705882, 1,
-0.2654047, 2.302153, -1.296721, 0, 1, 0.4784314, 1,
-0.265178, 0.1321428, -1.533307, 0, 1, 0.4823529, 1,
-0.2651401, 0.9757507, 1.175748, 0, 1, 0.4901961, 1,
-0.2645504, -1.302707, -4.903495, 0, 1, 0.4941176, 1,
-0.2644179, 0.4398168, 0.3350739, 0, 1, 0.5019608, 1,
-0.261481, -0.4520901, -4.615618, 0, 1, 0.509804, 1,
-0.2596297, 0.8281575, -0.7601861, 0, 1, 0.5137255, 1,
-0.2531314, -1.1315, -3.581593, 0, 1, 0.5215687, 1,
-0.2440938, 0.7346908, 1.386204, 0, 1, 0.5254902, 1,
-0.2405113, 1.271778, -0.2394708, 0, 1, 0.5333334, 1,
-0.2400746, -0.1693407, -0.7613881, 0, 1, 0.5372549, 1,
-0.2351296, 0.9341011, 0.4236533, 0, 1, 0.5450981, 1,
-0.2333431, 0.1960905, -0.6767284, 0, 1, 0.5490196, 1,
-0.230891, 0.8909443, -0.7166187, 0, 1, 0.5568628, 1,
-0.2231487, -1.371758, -1.336662, 0, 1, 0.5607843, 1,
-0.2222951, -0.02849546, -2.473653, 0, 1, 0.5686275, 1,
-0.2201709, 0.6420462, 1.078125, 0, 1, 0.572549, 1,
-0.2159161, 0.5604734, -2.086065, 0, 1, 0.5803922, 1,
-0.2158045, 0.3142709, -0.4422127, 0, 1, 0.5843138, 1,
-0.2114835, -0.5342904, -2.444774, 0, 1, 0.5921569, 1,
-0.2071503, -0.8462662, -3.299135, 0, 1, 0.5960785, 1,
-0.202091, 0.8529919, -0.6741016, 0, 1, 0.6039216, 1,
-0.2003628, 0.7778486, -2.606493, 0, 1, 0.6117647, 1,
-0.19992, 0.5978539, 1.418066, 0, 1, 0.6156863, 1,
-0.1984956, -0.09844509, -2.910455, 0, 1, 0.6235294, 1,
-0.1952735, -1.361482, -4.130711, 0, 1, 0.627451, 1,
-0.1949413, -0.4920756, -2.800163, 0, 1, 0.6352941, 1,
-0.1932932, 0.3812471, 0.4298576, 0, 1, 0.6392157, 1,
-0.1924233, -0.1114257, -1.848391, 0, 1, 0.6470588, 1,
-0.1889814, 0.2858451, -0.598814, 0, 1, 0.6509804, 1,
-0.1850775, -1.388733, -2.777327, 0, 1, 0.6588235, 1,
-0.1809146, -0.2662798, -2.333284, 0, 1, 0.6627451, 1,
-0.1805013, -0.6111778, -0.5858028, 0, 1, 0.6705883, 1,
-0.1735448, -0.8913953, -2.20124, 0, 1, 0.6745098, 1,
-0.1731151, -0.2745928, -1.283745, 0, 1, 0.682353, 1,
-0.1686805, 1.63396, -0.5440752, 0, 1, 0.6862745, 1,
-0.1670489, 0.1385167, -0.3202183, 0, 1, 0.6941177, 1,
-0.1595351, 1.622223, -2.098089, 0, 1, 0.7019608, 1,
-0.1588105, -1.336825, -2.74191, 0, 1, 0.7058824, 1,
-0.1585002, 0.606827, -0.4524231, 0, 1, 0.7137255, 1,
-0.1542011, 0.5725568, 0.752968, 0, 1, 0.7176471, 1,
-0.1333554, 0.6315038, -1.384281, 0, 1, 0.7254902, 1,
-0.1311581, 0.385238, -2.004519, 0, 1, 0.7294118, 1,
-0.1294865, -0.757421, -2.731571, 0, 1, 0.7372549, 1,
-0.1294322, 0.5806634, -0.2620273, 0, 1, 0.7411765, 1,
-0.1272878, -1.256899, -3.105693, 0, 1, 0.7490196, 1,
-0.1232494, -1.512898, -3.891704, 0, 1, 0.7529412, 1,
-0.1222075, 0.07140648, -2.145932, 0, 1, 0.7607843, 1,
-0.1215421, -0.7336921, -1.490175, 0, 1, 0.7647059, 1,
-0.1159332, 1.098698, 0.8915483, 0, 1, 0.772549, 1,
-0.115079, -1.184795, -3.711738, 0, 1, 0.7764706, 1,
-0.1091095, 0.4461075, -0.7796518, 0, 1, 0.7843137, 1,
-0.1034946, 0.8220234, -1.36854, 0, 1, 0.7882353, 1,
-0.09932549, 1.532229, -0.07851753, 0, 1, 0.7960784, 1,
-0.09777721, -2.009575, -1.535933, 0, 1, 0.8039216, 1,
-0.09638142, 0.1968669, -0.3135585, 0, 1, 0.8078431, 1,
-0.08641597, -0.442645, -2.303349, 0, 1, 0.8156863, 1,
-0.08598728, -0.5726895, -3.882365, 0, 1, 0.8196079, 1,
-0.08567041, -0.1468918, -3.067894, 0, 1, 0.827451, 1,
-0.08069169, 0.1287987, -1.299856, 0, 1, 0.8313726, 1,
-0.07963979, -1.705121, -0.6309915, 0, 1, 0.8392157, 1,
-0.07924608, 0.08380879, 0.0039761, 0, 1, 0.8431373, 1,
-0.07737617, -1.575476, -2.408825, 0, 1, 0.8509804, 1,
-0.07651242, 1.276592, -2.426562, 0, 1, 0.854902, 1,
-0.07471548, -0.7137679, -3.019412, 0, 1, 0.8627451, 1,
-0.07396975, -0.6088962, -2.167548, 0, 1, 0.8666667, 1,
-0.07288546, 0.1370324, 0.2695991, 0, 1, 0.8745098, 1,
-0.06907067, -2.728883, -4.787907, 0, 1, 0.8784314, 1,
-0.06907021, 0.1680419, 0.3397546, 0, 1, 0.8862745, 1,
-0.0658688, 1.802907, 0.4103936, 0, 1, 0.8901961, 1,
-0.06220575, 0.4271408, -0.3320417, 0, 1, 0.8980392, 1,
-0.05677934, 2.270065, 0.8131877, 0, 1, 0.9058824, 1,
-0.05246276, 1.090761, 0.1072923, 0, 1, 0.9098039, 1,
-0.05185186, -0.4963513, -3.227073, 0, 1, 0.9176471, 1,
-0.05049324, -2.168193, -3.517798, 0, 1, 0.9215686, 1,
-0.04977579, 0.0560078, -0.4393507, 0, 1, 0.9294118, 1,
-0.04411324, -0.4249573, -2.326339, 0, 1, 0.9333333, 1,
-0.04055576, 0.3422347, 1.979816, 0, 1, 0.9411765, 1,
-0.03879129, -0.5210429, -3.025379, 0, 1, 0.945098, 1,
-0.0377784, 0.6753254, 0.3390954, 0, 1, 0.9529412, 1,
-0.03388678, 0.6384088, -0.7488225, 0, 1, 0.9568627, 1,
-0.03233637, 1.259489, -0.955116, 0, 1, 0.9647059, 1,
-0.03173028, 1.619389, 0.1328312, 0, 1, 0.9686275, 1,
-0.02977684, -0.4532413, -3.689705, 0, 1, 0.9764706, 1,
-0.0281742, 0.6896197, -0.06141065, 0, 1, 0.9803922, 1,
-0.02600812, 1.850255, -0.09783853, 0, 1, 0.9882353, 1,
-0.02571992, 0.7399046, -0.6462935, 0, 1, 0.9921569, 1,
-0.02051621, 0.03911843, 1.883376, 0, 1, 1, 1,
-0.01862567, -0.05097152, -4.084821, 0, 0.9921569, 1, 1,
-0.01808844, 2.129658, 1.4671, 0, 0.9882353, 1, 1,
-0.01572242, -0.1064441, -3.057432, 0, 0.9803922, 1, 1,
-0.007488071, -0.8645945, -3.583309, 0, 0.9764706, 1, 1,
-0.006528422, 2.190583, 1.811406, 0, 0.9686275, 1, 1,
-0.005647483, 0.08752959, 1.378551, 0, 0.9647059, 1, 1,
-0.004929758, -1.199495, -3.504462, 0, 0.9568627, 1, 1,
-0.004008252, -1.572963, -2.64203, 0, 0.9529412, 1, 1,
0.007341726, 0.1990793, 0.751, 0, 0.945098, 1, 1,
0.00942804, 0.6465604, 2.495228, 0, 0.9411765, 1, 1,
0.009850239, -1.026543, 3.787108, 0, 0.9333333, 1, 1,
0.01444497, -0.0609528, 0.7237788, 0, 0.9294118, 1, 1,
0.01474224, 1.478473, -0.5825597, 0, 0.9215686, 1, 1,
0.01774134, -1.40545, 3.318123, 0, 0.9176471, 1, 1,
0.0197771, -1.316127, 1.807104, 0, 0.9098039, 1, 1,
0.02072055, 1.828532, 0.5178189, 0, 0.9058824, 1, 1,
0.02102466, 0.3138609, -2.330872, 0, 0.8980392, 1, 1,
0.0230297, -0.890959, 2.773428, 0, 0.8901961, 1, 1,
0.02378119, 0.563498, 0.9660987, 0, 0.8862745, 1, 1,
0.02455518, -0.7798997, 3.274256, 0, 0.8784314, 1, 1,
0.03262048, 0.4876722, -0.797197, 0, 0.8745098, 1, 1,
0.03705432, -1.727725, 3.698188, 0, 0.8666667, 1, 1,
0.04494833, 0.01537664, -0.1311272, 0, 0.8627451, 1, 1,
0.04658006, 0.7813859, -0.7491984, 0, 0.854902, 1, 1,
0.05245485, -0.6755126, 2.768914, 0, 0.8509804, 1, 1,
0.05642828, 1.159348, -0.3952647, 0, 0.8431373, 1, 1,
0.05667723, -0.7413983, 1.980204, 0, 0.8392157, 1, 1,
0.06296992, -1.83714, 2.031972, 0, 0.8313726, 1, 1,
0.06400142, 0.3655691, 2.323461, 0, 0.827451, 1, 1,
0.06574025, -0.1460618, 3.913966, 0, 0.8196079, 1, 1,
0.07204241, -0.09978133, 2.068261, 0, 0.8156863, 1, 1,
0.07250568, -0.5413059, 3.750909, 0, 0.8078431, 1, 1,
0.07913928, -0.6918028, 4.222281, 0, 0.8039216, 1, 1,
0.08435849, -0.1359136, -0.5683564, 0, 0.7960784, 1, 1,
0.0849911, -1.930352, 2.754659, 0, 0.7882353, 1, 1,
0.09292053, 0.523913, 0.2736942, 0, 0.7843137, 1, 1,
0.09390137, 0.9976454, 0.84661, 0, 0.7764706, 1, 1,
0.09570121, 0.5133292, 0.8437359, 0, 0.772549, 1, 1,
0.0963631, 0.06168716, 2.685806, 0, 0.7647059, 1, 1,
0.09700739, -1.660553, 2.195912, 0, 0.7607843, 1, 1,
0.09734752, 1.250605, 0.3367542, 0, 0.7529412, 1, 1,
0.09797505, -0.7832393, 3.044131, 0, 0.7490196, 1, 1,
0.09906582, -0.6242226, 2.216311, 0, 0.7411765, 1, 1,
0.09920999, 0.8561835, 1.14762, 0, 0.7372549, 1, 1,
0.1001179, 1.212664, 0.1525301, 0, 0.7294118, 1, 1,
0.1078122, 0.9058471, 0.9844478, 0, 0.7254902, 1, 1,
0.1092442, -0.5282564, 4.854468, 0, 0.7176471, 1, 1,
0.1130239, -1.159263, 2.76767, 0, 0.7137255, 1, 1,
0.1172446, 1.62495, 1.017898, 0, 0.7058824, 1, 1,
0.1206063, 1.309268, -1.009513, 0, 0.6980392, 1, 1,
0.1207067, -0.4611933, 1.579482, 0, 0.6941177, 1, 1,
0.1219914, -0.2131428, 2.848278, 0, 0.6862745, 1, 1,
0.1272207, -1.435837, 3.891077, 0, 0.682353, 1, 1,
0.1286605, -1.082053, 3.850945, 0, 0.6745098, 1, 1,
0.1291124, -0.05391535, 1.513333, 0, 0.6705883, 1, 1,
0.1303546, 1.599585, -0.112921, 0, 0.6627451, 1, 1,
0.1318633, -1.435128, 2.135532, 0, 0.6588235, 1, 1,
0.132124, 2.070539, 0.3997014, 0, 0.6509804, 1, 1,
0.1367837, 2.282299, -1.270094, 0, 0.6470588, 1, 1,
0.1394012, -0.9126992, 4.048267, 0, 0.6392157, 1, 1,
0.1437957, -0.05017266, 2.053768, 0, 0.6352941, 1, 1,
0.1441317, -0.5899431, 2.836675, 0, 0.627451, 1, 1,
0.1452907, -0.3019346, 3.670507, 0, 0.6235294, 1, 1,
0.1469031, 0.1486429, 0.03779623, 0, 0.6156863, 1, 1,
0.1481829, 1.270753, 1.345849, 0, 0.6117647, 1, 1,
0.1483526, -0.0003417949, 1.812386, 0, 0.6039216, 1, 1,
0.1488831, 0.9994965, -0.04895996, 0, 0.5960785, 1, 1,
0.1634485, 1.0222, 1.248631, 0, 0.5921569, 1, 1,
0.1683382, -0.6429443, 3.487355, 0, 0.5843138, 1, 1,
0.1721596, -1.092238, 4.234993, 0, 0.5803922, 1, 1,
0.1721825, 0.4369311, -0.09266709, 0, 0.572549, 1, 1,
0.1797206, 0.1809496, 1.387909, 0, 0.5686275, 1, 1,
0.1823677, 0.09212615, 2.412836, 0, 0.5607843, 1, 1,
0.1853143, -0.3823555, 3.218136, 0, 0.5568628, 1, 1,
0.1863503, -0.1836726, 2.694092, 0, 0.5490196, 1, 1,
0.1895146, 0.8296133, 1.675131, 0, 0.5450981, 1, 1,
0.1896366, 0.4416514, 0.2145974, 0, 0.5372549, 1, 1,
0.1911452, -0.1925674, 2.252896, 0, 0.5333334, 1, 1,
0.1920072, 0.9676976, 1.68826, 0, 0.5254902, 1, 1,
0.1952141, -0.6260495, 2.582952, 0, 0.5215687, 1, 1,
0.1959056, 1.292857, 1.505014, 0, 0.5137255, 1, 1,
0.1980439, -0.2921772, 4.304411, 0, 0.509804, 1, 1,
0.1995642, 0.8825379, -1.049191, 0, 0.5019608, 1, 1,
0.200611, -0.2702605, 2.851423, 0, 0.4941176, 1, 1,
0.2054561, -1.778126, 2.967556, 0, 0.4901961, 1, 1,
0.2067942, 0.1369495, 1.751702, 0, 0.4823529, 1, 1,
0.2144591, 1.090583, -1.02235, 0, 0.4784314, 1, 1,
0.2152655, -0.3749865, 2.578599, 0, 0.4705882, 1, 1,
0.2153026, -0.7446475, 3.150725, 0, 0.4666667, 1, 1,
0.2193373, -0.08588152, 1.516873, 0, 0.4588235, 1, 1,
0.2199117, -0.937148, 0.4400202, 0, 0.454902, 1, 1,
0.2287344, -0.1623863, 2.31589, 0, 0.4470588, 1, 1,
0.2302844, 0.5047691, -1.283373, 0, 0.4431373, 1, 1,
0.2327093, -0.5937515, 3.093506, 0, 0.4352941, 1, 1,
0.2327147, 0.7304933, 1.797617, 0, 0.4313726, 1, 1,
0.2327776, 0.5445837, -1.230118, 0, 0.4235294, 1, 1,
0.2335751, -0.5562309, 2.643689, 0, 0.4196078, 1, 1,
0.2376114, 1.07855, 0.07825718, 0, 0.4117647, 1, 1,
0.2378615, 0.04613369, 0.6971136, 0, 0.4078431, 1, 1,
0.2380612, -1.057574, 2.802876, 0, 0.4, 1, 1,
0.23896, -0.222172, 2.397092, 0, 0.3921569, 1, 1,
0.2407653, -1.617691, 3.126723, 0, 0.3882353, 1, 1,
0.2477983, 0.1707331, 1.117571, 0, 0.3803922, 1, 1,
0.2484477, 0.6312181, 0.7692567, 0, 0.3764706, 1, 1,
0.2527138, 1.107504, -0.3208006, 0, 0.3686275, 1, 1,
0.2564574, -0.3640906, 3.47443, 0, 0.3647059, 1, 1,
0.2566149, -0.3053147, 2.057313, 0, 0.3568628, 1, 1,
0.258866, 0.6882809, 2.20469, 0, 0.3529412, 1, 1,
0.2624635, 0.2787876, 0.2933035, 0, 0.345098, 1, 1,
0.2634182, -1.373038, 3.133487, 0, 0.3411765, 1, 1,
0.2747073, 0.5014542, 2.097138, 0, 0.3333333, 1, 1,
0.2755846, -0.0877096, 1.263856, 0, 0.3294118, 1, 1,
0.2785214, -2.212263, 2.440451, 0, 0.3215686, 1, 1,
0.2880147, -0.9991012, 2.787138, 0, 0.3176471, 1, 1,
0.289464, 0.6633152, 0.7366289, 0, 0.3098039, 1, 1,
0.2920343, 1.034453, 1.07925, 0, 0.3058824, 1, 1,
0.294572, 0.07056718, 1.573523, 0, 0.2980392, 1, 1,
0.2964182, -1.656175, 2.296144, 0, 0.2901961, 1, 1,
0.2964997, -0.420233, 3.152351, 0, 0.2862745, 1, 1,
0.2967126, 1.147438, 0.1951288, 0, 0.2784314, 1, 1,
0.3004811, 0.06638033, 1.943731, 0, 0.2745098, 1, 1,
0.3042708, 1.071093, 0.3995729, 0, 0.2666667, 1, 1,
0.304337, 1.718621, 1.003364, 0, 0.2627451, 1, 1,
0.3055607, 0.660801, 1.185821, 0, 0.254902, 1, 1,
0.3066511, -0.1648293, 2.349821, 0, 0.2509804, 1, 1,
0.3117031, 0.037506, 1.472894, 0, 0.2431373, 1, 1,
0.3145095, -0.7750497, 4.132792, 0, 0.2392157, 1, 1,
0.3165832, 0.9602228, 0.9819313, 0, 0.2313726, 1, 1,
0.3189459, 1.522521, -0.5907962, 0, 0.227451, 1, 1,
0.3217955, 1.0288, 0.7479272, 0, 0.2196078, 1, 1,
0.3219727, 0.04027864, 1.657804, 0, 0.2156863, 1, 1,
0.3245118, 0.5161851, -0.9652638, 0, 0.2078431, 1, 1,
0.325076, 0.04540653, 1.670576, 0, 0.2039216, 1, 1,
0.3251239, -1.617043, 2.164332, 0, 0.1960784, 1, 1,
0.3275891, -0.2085937, 3.068955, 0, 0.1882353, 1, 1,
0.3305633, -0.1126256, 2.940338, 0, 0.1843137, 1, 1,
0.3335307, -0.7691836, 1.804217, 0, 0.1764706, 1, 1,
0.3356056, 0.1858212, 0.3473948, 0, 0.172549, 1, 1,
0.3358245, 1.42239, -0.9766906, 0, 0.1647059, 1, 1,
0.3411398, 0.4231548, -0.3416677, 0, 0.1607843, 1, 1,
0.3421625, 1.099426, 1.455241, 0, 0.1529412, 1, 1,
0.3424609, -0.7547236, 2.611192, 0, 0.1490196, 1, 1,
0.3429938, 1.398067, 2.25122, 0, 0.1411765, 1, 1,
0.344377, -0.482035, 3.13026, 0, 0.1372549, 1, 1,
0.3462237, -0.7411156, 3.06178, 0, 0.1294118, 1, 1,
0.347621, -1.247222, 2.081402, 0, 0.1254902, 1, 1,
0.3511091, 0.7948635, -0.1748006, 0, 0.1176471, 1, 1,
0.3529216, 1.098088, 1.876615, 0, 0.1137255, 1, 1,
0.3535016, -0.7537374, 3.74363, 0, 0.1058824, 1, 1,
0.355464, -0.3081959, 3.50387, 0, 0.09803922, 1, 1,
0.3579741, 1.028639, 1.984992, 0, 0.09411765, 1, 1,
0.3634865, 0.5400964, 0.4096137, 0, 0.08627451, 1, 1,
0.3663919, 1.61042, 0.130272, 0, 0.08235294, 1, 1,
0.3668984, 0.7742249, 1.155047, 0, 0.07450981, 1, 1,
0.3693815, -0.4631454, 1.868862, 0, 0.07058824, 1, 1,
0.3721526, 0.3821496, -1.9605, 0, 0.0627451, 1, 1,
0.3777617, -1.018883, 1.267012, 0, 0.05882353, 1, 1,
0.3794342, 0.6795127, 0.6878477, 0, 0.05098039, 1, 1,
0.3830751, -0.6107935, 2.3071, 0, 0.04705882, 1, 1,
0.3867491, 2.126955, 0.5219929, 0, 0.03921569, 1, 1,
0.3872887, 2.070059, 1.028648, 0, 0.03529412, 1, 1,
0.3887354, -1.385725, 3.62967, 0, 0.02745098, 1, 1,
0.3917938, -0.5365394, 2.049832, 0, 0.02352941, 1, 1,
0.3935944, -1.030124, 2.657264, 0, 0.01568628, 1, 1,
0.3963513, 0.6710283, 1.659715, 0, 0.01176471, 1, 1,
0.3993246, -0.5096202, 3.619408, 0, 0.003921569, 1, 1,
0.4019381, 0.1841601, 1.5053, 0.003921569, 0, 1, 1,
0.4041716, -1.811513, 3.445982, 0.007843138, 0, 1, 1,
0.4042667, 0.5875233, 1.684667, 0.01568628, 0, 1, 1,
0.406525, -1.268223, 2.83623, 0.01960784, 0, 1, 1,
0.411816, 0.9493315, -0.1394847, 0.02745098, 0, 1, 1,
0.4153644, -0.103591, 0.06602073, 0.03137255, 0, 1, 1,
0.423883, -1.502153, 3.612097, 0.03921569, 0, 1, 1,
0.4244411, 0.1108782, 0.9926848, 0.04313726, 0, 1, 1,
0.4258079, -0.1008324, 0.4775887, 0.05098039, 0, 1, 1,
0.4280172, 1.902822, -0.08170141, 0.05490196, 0, 1, 1,
0.4302313, 1.273776, -0.3496214, 0.0627451, 0, 1, 1,
0.4317106, 0.008666145, 1.244064, 0.06666667, 0, 1, 1,
0.4324906, 0.7662922, 1.839964, 0.07450981, 0, 1, 1,
0.4359067, 0.06724266, 1.106112, 0.07843138, 0, 1, 1,
0.4364254, 0.9016448, 1.345214, 0.08627451, 0, 1, 1,
0.4418091, 0.005122474, 0.1620272, 0.09019608, 0, 1, 1,
0.4456706, -0.4900049, 3.932541, 0.09803922, 0, 1, 1,
0.4502191, 0.8274536, 1.582929, 0.1058824, 0, 1, 1,
0.4504089, -1.640181, 3.430602, 0.1098039, 0, 1, 1,
0.4522291, 0.7477571, 0.9807582, 0.1176471, 0, 1, 1,
0.4545071, 0.01775127, 3.171526, 0.1215686, 0, 1, 1,
0.4580563, -0.1079367, -0.9781643, 0.1294118, 0, 1, 1,
0.4606344, -0.4635085, 2.036022, 0.1333333, 0, 1, 1,
0.4618032, 0.8625242, -0.4420165, 0.1411765, 0, 1, 1,
0.4693202, -1.1853, 3.773934, 0.145098, 0, 1, 1,
0.4709498, -0.5293726, 1.4156, 0.1529412, 0, 1, 1,
0.4738028, 0.8447619, -0.05631489, 0.1568628, 0, 1, 1,
0.4757473, 1.073738, 0.4794745, 0.1647059, 0, 1, 1,
0.4771788, 0.4986395, -1.797558, 0.1686275, 0, 1, 1,
0.4800555, 0.9281717, 1.341861, 0.1764706, 0, 1, 1,
0.4859371, 1.021558, 0.6364051, 0.1803922, 0, 1, 1,
0.4873039, -1.424403, 1.646868, 0.1882353, 0, 1, 1,
0.4913722, 1.462235, -1.216337, 0.1921569, 0, 1, 1,
0.4925203, 0.2724448, 0.329499, 0.2, 0, 1, 1,
0.4927694, 0.666643, 1.29727, 0.2078431, 0, 1, 1,
0.5006531, -0.3178953, 1.578525, 0.2117647, 0, 1, 1,
0.5016445, 0.1390614, 2.50221, 0.2196078, 0, 1, 1,
0.5052214, -0.02221824, 1.024718, 0.2235294, 0, 1, 1,
0.5069177, 0.2279062, 0.1127554, 0.2313726, 0, 1, 1,
0.5071182, -0.09266191, 1.684195, 0.2352941, 0, 1, 1,
0.5093324, -0.9053999, 3.240283, 0.2431373, 0, 1, 1,
0.5162441, -0.1527938, 2.387473, 0.2470588, 0, 1, 1,
0.5218606, 0.8271432, -0.8396997, 0.254902, 0, 1, 1,
0.5282179, -1.431454, 3.052042, 0.2588235, 0, 1, 1,
0.5285283, -0.6873876, 2.569221, 0.2666667, 0, 1, 1,
0.5343995, -1.390184, 1.470023, 0.2705882, 0, 1, 1,
0.5349691, 0.9969624, 0.5403253, 0.2784314, 0, 1, 1,
0.5381515, 0.06677598, 5.22189, 0.282353, 0, 1, 1,
0.5409162, 0.28422, -0.3045574, 0.2901961, 0, 1, 1,
0.542757, 0.13381, 1.507611, 0.2941177, 0, 1, 1,
0.5441067, 0.4800379, -1.240902, 0.3019608, 0, 1, 1,
0.5570046, -0.1946183, 3.53333, 0.3098039, 0, 1, 1,
0.5623938, 0.1272857, 1.373045, 0.3137255, 0, 1, 1,
0.5683743, 3.349852, -0.7245431, 0.3215686, 0, 1, 1,
0.5702662, 0.9732789, 0.8910958, 0.3254902, 0, 1, 1,
0.5712491, -1.006444, 3.818598, 0.3333333, 0, 1, 1,
0.5737286, 0.2005751, 0.2727367, 0.3372549, 0, 1, 1,
0.5782288, -0.8728471, 3.942943, 0.345098, 0, 1, 1,
0.5804465, 0.5224648, -0.4667849, 0.3490196, 0, 1, 1,
0.5816561, -2.179347, 2.332525, 0.3568628, 0, 1, 1,
0.5829471, -1.492015, 1.775267, 0.3607843, 0, 1, 1,
0.5855899, 0.7100028, 1.446876, 0.3686275, 0, 1, 1,
0.5866133, -1.398945, 1.322459, 0.372549, 0, 1, 1,
0.5956205, 1.049043, 0.6304007, 0.3803922, 0, 1, 1,
0.6033518, 0.7061237, 1.266423, 0.3843137, 0, 1, 1,
0.6035805, 0.8160698, -0.03309038, 0.3921569, 0, 1, 1,
0.6081865, -0.8783388, 2.472619, 0.3960784, 0, 1, 1,
0.6105599, -1.363345, 2.29935, 0.4039216, 0, 1, 1,
0.6156114, -0.6574346, 1.646051, 0.4117647, 0, 1, 1,
0.6189663, -0.1205148, 1.188172, 0.4156863, 0, 1, 1,
0.6195349, -1.630428, 1.590041, 0.4235294, 0, 1, 1,
0.6250504, -0.9888754, 3.126369, 0.427451, 0, 1, 1,
0.6349655, -0.9354377, 2.528357, 0.4352941, 0, 1, 1,
0.6367863, 2.240402, -1.489526, 0.4392157, 0, 1, 1,
0.6474143, 0.3937201, 1.081379, 0.4470588, 0, 1, 1,
0.651119, 0.5829453, 0.1231503, 0.4509804, 0, 1, 1,
0.6569304, 0.2875223, 0.4267592, 0.4588235, 0, 1, 1,
0.6625838, 1.222933, 1.879986, 0.4627451, 0, 1, 1,
0.6626147, 2.449917, 0.7705867, 0.4705882, 0, 1, 1,
0.6633273, 0.2926179, 1.088277, 0.4745098, 0, 1, 1,
0.6654801, -1.099717, 3.010834, 0.4823529, 0, 1, 1,
0.6698451, -0.2601285, 3.472203, 0.4862745, 0, 1, 1,
0.6774985, 0.8050852, 1.202289, 0.4941176, 0, 1, 1,
0.6803184, -0.2551782, 2.241488, 0.5019608, 0, 1, 1,
0.6970784, 0.5325938, 0.07743164, 0.5058824, 0, 1, 1,
0.7051165, 1.054496, 0.08591878, 0.5137255, 0, 1, 1,
0.7063558, 0.1172786, 1.626728, 0.5176471, 0, 1, 1,
0.7072455, 1.20041, -0.3697539, 0.5254902, 0, 1, 1,
0.7110701, -1.789487, 2.560034, 0.5294118, 0, 1, 1,
0.7137074, 0.7238762, -0.2826947, 0.5372549, 0, 1, 1,
0.7162359, -1.124561, 3.976737, 0.5411765, 0, 1, 1,
0.7164399, -0.6629134, 1.892522, 0.5490196, 0, 1, 1,
0.7170021, -1.20636, 1.451331, 0.5529412, 0, 1, 1,
0.7174609, -0.3812517, 1.493632, 0.5607843, 0, 1, 1,
0.718362, 0.9493791, 0.9137402, 0.5647059, 0, 1, 1,
0.7185014, 0.2269343, 0.5358612, 0.572549, 0, 1, 1,
0.7191052, -0.4319059, 2.874612, 0.5764706, 0, 1, 1,
0.7193001, -1.768795, 2.250885, 0.5843138, 0, 1, 1,
0.7259852, -0.4130108, 1.043174, 0.5882353, 0, 1, 1,
0.7285998, 0.8462148, 0.793831, 0.5960785, 0, 1, 1,
0.731609, -2.470392, 1.845595, 0.6039216, 0, 1, 1,
0.7327868, -0.854691, 3.445376, 0.6078432, 0, 1, 1,
0.7334576, 0.957917, 0.6854467, 0.6156863, 0, 1, 1,
0.7335318, -1.601894, 3.332735, 0.6196079, 0, 1, 1,
0.7436171, -0.968008, 1.617592, 0.627451, 0, 1, 1,
0.7450482, 1.189461, -0.09315655, 0.6313726, 0, 1, 1,
0.7474607, -1.515182, 2.124207, 0.6392157, 0, 1, 1,
0.7564625, 1.078749, -1.340368, 0.6431373, 0, 1, 1,
0.7592968, 0.1493584, 2.297013, 0.6509804, 0, 1, 1,
0.7599512, -0.1960128, 1.5162, 0.654902, 0, 1, 1,
0.7675133, -0.03392921, 0.09020679, 0.6627451, 0, 1, 1,
0.7696463, 0.6769932, 1.005475, 0.6666667, 0, 1, 1,
0.7725567, 0.6255251, -0.61926, 0.6745098, 0, 1, 1,
0.775237, -0.4093281, 1.999277, 0.6784314, 0, 1, 1,
0.7905587, 1.884948, 0.9591118, 0.6862745, 0, 1, 1,
0.7917686, 0.5511214, 1.231487, 0.6901961, 0, 1, 1,
0.7945477, -0.3199902, 2.436272, 0.6980392, 0, 1, 1,
0.8015292, -1.697969, 2.527961, 0.7058824, 0, 1, 1,
0.8088049, 0.3493304, 1.370888, 0.7098039, 0, 1, 1,
0.8100793, 0.7293358, 0.1219163, 0.7176471, 0, 1, 1,
0.8134232, -1.524042, 4.034144, 0.7215686, 0, 1, 1,
0.8162188, 0.6651241, 1.951577, 0.7294118, 0, 1, 1,
0.8244141, -0.9285399, 2.324064, 0.7333333, 0, 1, 1,
0.8247775, 1.34377, 0.7269033, 0.7411765, 0, 1, 1,
0.8253678, -0.5527485, 2.193856, 0.7450981, 0, 1, 1,
0.8265635, 1.054821, -0.5069566, 0.7529412, 0, 1, 1,
0.8270622, -1.17039, 0.02759079, 0.7568628, 0, 1, 1,
0.8287821, -0.03504047, 1.17969, 0.7647059, 0, 1, 1,
0.8328837, 0.9745609, 1.479844, 0.7686275, 0, 1, 1,
0.8427294, -0.6241002, 2.09719, 0.7764706, 0, 1, 1,
0.842934, -0.3263168, 0.4630589, 0.7803922, 0, 1, 1,
0.8484769, 0.5783358, 0.5138899, 0.7882353, 0, 1, 1,
0.858801, 0.9181724, -0.398949, 0.7921569, 0, 1, 1,
0.8594361, 0.3096631, 1.20218, 0.8, 0, 1, 1,
0.8610588, 2.914888, -0.3261222, 0.8078431, 0, 1, 1,
0.864577, 0.6039669, 0.2350167, 0.8117647, 0, 1, 1,
0.8662916, 0.3013958, 0.8086045, 0.8196079, 0, 1, 1,
0.8667463, -1.28528, 2.599986, 0.8235294, 0, 1, 1,
0.8748385, -0.2960738, 1.013671, 0.8313726, 0, 1, 1,
0.8772812, 0.7126018, 2.005606, 0.8352941, 0, 1, 1,
0.8776367, -0.514502, 0.318609, 0.8431373, 0, 1, 1,
0.8788978, -1.447639, 0.9704709, 0.8470588, 0, 1, 1,
0.8892207, 0.8744087, 1.965115, 0.854902, 0, 1, 1,
0.8894647, 0.332753, 1.186719, 0.8588235, 0, 1, 1,
0.9003099, 0.8814401, 1.454571, 0.8666667, 0, 1, 1,
0.9145845, -2.100043, 2.795607, 0.8705882, 0, 1, 1,
0.9148309, 1.065536, 1.030682, 0.8784314, 0, 1, 1,
0.9197052, 0.3454702, 0.6339523, 0.8823529, 0, 1, 1,
0.9221315, 0.06659072, 1.627805, 0.8901961, 0, 1, 1,
0.9287903, 0.2097768, 0.341011, 0.8941177, 0, 1, 1,
0.9344429, 0.5569969, 0.8125342, 0.9019608, 0, 1, 1,
0.9399517, -0.120938, 0.908121, 0.9098039, 0, 1, 1,
0.9408756, 0.4445021, 1.16051, 0.9137255, 0, 1, 1,
0.9423509, -1.373722, 1.637832, 0.9215686, 0, 1, 1,
0.9448685, 0.4342805, 0.9143693, 0.9254902, 0, 1, 1,
0.9506648, 0.4584832, 1.777008, 0.9333333, 0, 1, 1,
0.9540794, -1.186767, 2.793282, 0.9372549, 0, 1, 1,
0.9560002, -0.8800703, 3.11717, 0.945098, 0, 1, 1,
0.9587473, 2.13004, 0.4059573, 0.9490196, 0, 1, 1,
0.9592957, -0.1175034, 2.314161, 0.9568627, 0, 1, 1,
0.9602694, 0.04469706, -0.142961, 0.9607843, 0, 1, 1,
0.9669926, -1.133695, 3.108145, 0.9686275, 0, 1, 1,
0.9915966, 0.9450989, -0.6377168, 0.972549, 0, 1, 1,
0.9986349, 0.1634678, 1.351084, 0.9803922, 0, 1, 1,
0.9986677, 1.688378, -0.4396472, 0.9843137, 0, 1, 1,
1.007321, -0.07180619, 2.049641, 0.9921569, 0, 1, 1,
1.008344, -1.045052, 0.8589066, 0.9960784, 0, 1, 1,
1.012311, -0.9682974, 2.494238, 1, 0, 0.9960784, 1,
1.016405, -0.3988354, 0.9961426, 1, 0, 0.9882353, 1,
1.017817, 0.7183111, 0.9675981, 1, 0, 0.9843137, 1,
1.019791, 0.08069617, 1.115749, 1, 0, 0.9764706, 1,
1.020255, -0.6519275, 1.093563, 1, 0, 0.972549, 1,
1.022895, -1.109882, 3.354315, 1, 0, 0.9647059, 1,
1.023031, 0.3516105, 1.151584, 1, 0, 0.9607843, 1,
1.023603, -0.5234392, 2.467614, 1, 0, 0.9529412, 1,
1.024437, -1.595798, 1.688469, 1, 0, 0.9490196, 1,
1.027041, -0.572742, 2.322742, 1, 0, 0.9411765, 1,
1.03094, -0.5492877, 1.680205, 1, 0, 0.9372549, 1,
1.031135, 0.910839, 1.397254, 1, 0, 0.9294118, 1,
1.033943, -1.593366, 3.772577, 1, 0, 0.9254902, 1,
1.0426, -0.3191029, 0.1130824, 1, 0, 0.9176471, 1,
1.048883, 1.675756, 0.04800662, 1, 0, 0.9137255, 1,
1.050667, 0.2281066, 0.9989098, 1, 0, 0.9058824, 1,
1.051636, 2.763674, 0.4863987, 1, 0, 0.9019608, 1,
1.053366, -1.031434, 1.827529, 1, 0, 0.8941177, 1,
1.053671, -0.2806732, -0.726567, 1, 0, 0.8862745, 1,
1.053888, -0.194084, 1.319254, 1, 0, 0.8823529, 1,
1.0577, -2.022314, 2.790788, 1, 0, 0.8745098, 1,
1.061702, -0.5023995, 1.90779, 1, 0, 0.8705882, 1,
1.064258, -0.9018141, 1.983241, 1, 0, 0.8627451, 1,
1.06537, 2.258004, -0.2815652, 1, 0, 0.8588235, 1,
1.067703, -0.8640369, 2.281724, 1, 0, 0.8509804, 1,
1.070716, -0.05418994, 3.362694, 1, 0, 0.8470588, 1,
1.078677, -0.1630457, 3.159664, 1, 0, 0.8392157, 1,
1.09028, -0.2557879, 0.6975726, 1, 0, 0.8352941, 1,
1.090372, -0.2522432, 2.327399, 1, 0, 0.827451, 1,
1.095151, 1.094099, 0.4264125, 1, 0, 0.8235294, 1,
1.097549, 0.8405939, 1.580026, 1, 0, 0.8156863, 1,
1.099401, 2.344018, -0.05260219, 1, 0, 0.8117647, 1,
1.103326, -0.7287991, 1.282987, 1, 0, 0.8039216, 1,
1.103568, -0.1703756, 3.196538, 1, 0, 0.7960784, 1,
1.107188, -0.1200693, 1.542236, 1, 0, 0.7921569, 1,
1.119311, -1.381547, 3.134907, 1, 0, 0.7843137, 1,
1.126499, -1.039552, 4.115648, 1, 0, 0.7803922, 1,
1.12971, -1.102411, 2.549422, 1, 0, 0.772549, 1,
1.133578, 3.406109, 0.1544932, 1, 0, 0.7686275, 1,
1.134318, -1.513611, 3.029375, 1, 0, 0.7607843, 1,
1.137702, 0.1200541, -0.7856385, 1, 0, 0.7568628, 1,
1.139773, -0.5977066, 2.946925, 1, 0, 0.7490196, 1,
1.139889, 1.177933, -0.02188929, 1, 0, 0.7450981, 1,
1.141618, 0.2505665, 2.457351, 1, 0, 0.7372549, 1,
1.169055, -0.214157, 1.953633, 1, 0, 0.7333333, 1,
1.171358, -0.1389179, 2.429232, 1, 0, 0.7254902, 1,
1.184768, 2.040417, 0.1850177, 1, 0, 0.7215686, 1,
1.186148, -0.3971292, 1.987173, 1, 0, 0.7137255, 1,
1.192109, -0.0004092584, 1.76297, 1, 0, 0.7098039, 1,
1.209893, -1.734524, 3.317317, 1, 0, 0.7019608, 1,
1.246496, -1.229665, 2.483605, 1, 0, 0.6941177, 1,
1.247272, 1.05512, 1.777086, 1, 0, 0.6901961, 1,
1.251772, -0.3865361, 1.64158, 1, 0, 0.682353, 1,
1.25444, -1.243681, 3.338935, 1, 0, 0.6784314, 1,
1.254802, 1.189672, 2.201155, 1, 0, 0.6705883, 1,
1.255325, -0.01520318, 2.143204, 1, 0, 0.6666667, 1,
1.255477, -0.0602521, 1.550001, 1, 0, 0.6588235, 1,
1.267657, -1.03603, 2.568218, 1, 0, 0.654902, 1,
1.274153, 0.2266804, 0.6478087, 1, 0, 0.6470588, 1,
1.279365, 0.5849255, 1.135085, 1, 0, 0.6431373, 1,
1.280522, 0.1069853, 0.8451496, 1, 0, 0.6352941, 1,
1.286093, 1.551395, 1.435048, 1, 0, 0.6313726, 1,
1.287939, 0.5472854, 1.629059, 1, 0, 0.6235294, 1,
1.289793, -0.7864282, 1.960817, 1, 0, 0.6196079, 1,
1.290208, 1.107553, 0.6206161, 1, 0, 0.6117647, 1,
1.294808, 1.119761, 0.9195165, 1, 0, 0.6078432, 1,
1.301117, 1.07129, 0.04535537, 1, 0, 0.6, 1,
1.307699, -0.04368321, 1.050766, 1, 0, 0.5921569, 1,
1.310778, -1.437037, 2.67215, 1, 0, 0.5882353, 1,
1.319708, -0.006221887, 0.9406776, 1, 0, 0.5803922, 1,
1.323856, 0.3999022, 2.030165, 1, 0, 0.5764706, 1,
1.332089, 0.4853874, 2.269932, 1, 0, 0.5686275, 1,
1.351356, -2.542713, 2.227372, 1, 0, 0.5647059, 1,
1.357847, 0.7254458, 1.99862, 1, 0, 0.5568628, 1,
1.359075, -0.1805675, 2.732083, 1, 0, 0.5529412, 1,
1.36323, 0.7502233, -0.8890018, 1, 0, 0.5450981, 1,
1.371425, 0.08409342, 0.7526624, 1, 0, 0.5411765, 1,
1.375532, 0.5504788, 2.956254, 1, 0, 0.5333334, 1,
1.376386, 0.6017315, 0.8240565, 1, 0, 0.5294118, 1,
1.379946, -1.434615, 2.208815, 1, 0, 0.5215687, 1,
1.390281, -0.002797265, 1.373108, 1, 0, 0.5176471, 1,
1.395523, 0.2711779, 1.107724, 1, 0, 0.509804, 1,
1.403931, 0.3137369, 1.737934, 1, 0, 0.5058824, 1,
1.427984, 0.2637286, 0.8130186, 1, 0, 0.4980392, 1,
1.430856, 1.292692, 1.689669, 1, 0, 0.4901961, 1,
1.438539, 0.1754786, 4.354676, 1, 0, 0.4862745, 1,
1.451523, 0.06121618, 1.360726, 1, 0, 0.4784314, 1,
1.462135, 0.2242763, 1.976602, 1, 0, 0.4745098, 1,
1.471295, 3.047549, 1.542816, 1, 0, 0.4666667, 1,
1.471548, -0.6333788, 1.249325, 1, 0, 0.4627451, 1,
1.474054, -1.812706, 0.6780069, 1, 0, 0.454902, 1,
1.479007, 2.356619, -0.02068171, 1, 0, 0.4509804, 1,
1.480637, -1.731285, 3.827423, 1, 0, 0.4431373, 1,
1.486272, 0.8552034, 0.4414795, 1, 0, 0.4392157, 1,
1.48899, 0.4442259, 0.9601442, 1, 0, 0.4313726, 1,
1.499776, -0.01068567, 2.808423, 1, 0, 0.427451, 1,
1.503254, -0.2437983, 2.399672, 1, 0, 0.4196078, 1,
1.512701, 1.643385, -0.2759432, 1, 0, 0.4156863, 1,
1.514143, 0.752005, 0.4783639, 1, 0, 0.4078431, 1,
1.522253, -0.3327327, 2.267839, 1, 0, 0.4039216, 1,
1.525529, 0.1825419, 1.662074, 1, 0, 0.3960784, 1,
1.527905, 0.4966105, 1.037254, 1, 0, 0.3882353, 1,
1.534238, 1.695701, -1.089893, 1, 0, 0.3843137, 1,
1.549697, -0.7838576, 3.175103, 1, 0, 0.3764706, 1,
1.551066, -1.354942, 2.034407, 1, 0, 0.372549, 1,
1.560461, -1.158591, 1.071375, 1, 0, 0.3647059, 1,
1.568217, 0.5566381, 0.3786877, 1, 0, 0.3607843, 1,
1.570685, -0.1941728, 1.275324, 1, 0, 0.3529412, 1,
1.572444, 0.1944109, 0.7159916, 1, 0, 0.3490196, 1,
1.585114, 0.9924597, 1.127198, 1, 0, 0.3411765, 1,
1.602114, -0.694296, 1.414915, 1, 0, 0.3372549, 1,
1.611856, -0.7763171, 1.241765, 1, 0, 0.3294118, 1,
1.612745, -0.5906965, 1.546436, 1, 0, 0.3254902, 1,
1.623405, 0.6465367, -0.7011839, 1, 0, 0.3176471, 1,
1.636075, -0.8156019, -0.5167831, 1, 0, 0.3137255, 1,
1.639107, -1.028243, 3.59449, 1, 0, 0.3058824, 1,
1.66562, -0.7382295, 0.0237565, 1, 0, 0.2980392, 1,
1.681763, 1.916151, 1.159111, 1, 0, 0.2941177, 1,
1.682218, -0.9107676, 3.705963, 1, 0, 0.2862745, 1,
1.703446, -1.547701, 1.41426, 1, 0, 0.282353, 1,
1.714428, 0.5583915, 1.047639, 1, 0, 0.2745098, 1,
1.727338, 1.546667, -1.166393, 1, 0, 0.2705882, 1,
1.751727, 0.9019669, 2.967045, 1, 0, 0.2627451, 1,
1.770921, 0.2986404, 3.999791, 1, 0, 0.2588235, 1,
1.801229, 1.273515, 0.0400633, 1, 0, 0.2509804, 1,
1.809354, -2.113557, 0.557976, 1, 0, 0.2470588, 1,
1.8148, 0.2929763, 1.146248, 1, 0, 0.2392157, 1,
1.827594, 0.4865673, 1.989062, 1, 0, 0.2352941, 1,
1.833961, 0.2825428, 1.652707, 1, 0, 0.227451, 1,
1.835269, 0.2862082, 1.914775, 1, 0, 0.2235294, 1,
1.843152, -0.6030388, -0.6542833, 1, 0, 0.2156863, 1,
1.848313, 1.973329, 1.233721, 1, 0, 0.2117647, 1,
1.863193, 0.2997616, 0.875065, 1, 0, 0.2039216, 1,
1.868033, -0.6554199, 2.754813, 1, 0, 0.1960784, 1,
1.874969, 0.7817503, 0.001735425, 1, 0, 0.1921569, 1,
1.885679, -0.3988405, 1.024235, 1, 0, 0.1843137, 1,
1.899382, 0.008911912, 1.560745, 1, 0, 0.1803922, 1,
1.899828, 2.799414, 2.28756, 1, 0, 0.172549, 1,
1.923581, -0.1766979, -0.2080597, 1, 0, 0.1686275, 1,
1.935243, -0.1353463, 3.874017, 1, 0, 0.1607843, 1,
1.958244, -0.1037102, 1.850821, 1, 0, 0.1568628, 1,
1.971459, -0.6787854, 2.804158, 1, 0, 0.1490196, 1,
1.987891, -0.6915895, -0.6184717, 1, 0, 0.145098, 1,
2.003472, -0.5255712, 1.458528, 1, 0, 0.1372549, 1,
2.007566, -0.4799854, 3.244138, 1, 0, 0.1333333, 1,
2.027447, -0.7272043, 1.600796, 1, 0, 0.1254902, 1,
2.035259, -1.543627, 3.228887, 1, 0, 0.1215686, 1,
2.061174, 1.411471, 2.271207, 1, 0, 0.1137255, 1,
2.076403, 1.099559, 0.4112159, 1, 0, 0.1098039, 1,
2.098743, 2.623971, 2.234067, 1, 0, 0.1019608, 1,
2.102769, -0.1174576, 0.4342609, 1, 0, 0.09411765, 1,
2.115205, -1.53195, 2.896263, 1, 0, 0.09019608, 1,
2.120186, -0.5727721, 3.972822, 1, 0, 0.08235294, 1,
2.184948, 0.9913924, 1.896084, 1, 0, 0.07843138, 1,
2.198015, -0.9466542, 2.232919, 1, 0, 0.07058824, 1,
2.225725, -0.6318563, 1.050654, 1, 0, 0.06666667, 1,
2.251256, -0.4073897, 1.518107, 1, 0, 0.05882353, 1,
2.267381, -0.3054239, 2.109774, 1, 0, 0.05490196, 1,
2.281189, -0.713757, 2.118593, 1, 0, 0.04705882, 1,
2.337831, 1.582347, -0.01598237, 1, 0, 0.04313726, 1,
2.437277, 1.869347, 0.9429666, 1, 0, 0.03529412, 1,
2.572508, 0.5352189, 1.278071, 1, 0, 0.03137255, 1,
2.594094, -0.9242374, 2.375377, 1, 0, 0.02352941, 1,
2.616656, 0.06649823, 3.029152, 1, 0, 0.01960784, 1,
2.63605, 0.3299891, 1.523586, 1, 0, 0.01176471, 1,
2.677888, 0.0283359, 1.893211, 1, 0, 0.007843138, 1
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
-0.3138906, -3.901228, -7.342652, 0, -0.5, 0.5, 0.5,
-0.3138906, -3.901228, -7.342652, 1, -0.5, 0.5, 0.5,
-0.3138906, -3.901228, -7.342652, 1, 1.5, 0.5, 0.5,
-0.3138906, -3.901228, -7.342652, 0, 1.5, 0.5, 0.5
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
-4.319882, 0.2819804, -7.342652, 0, -0.5, 0.5, 0.5,
-4.319882, 0.2819804, -7.342652, 1, -0.5, 0.5, 0.5,
-4.319882, 0.2819804, -7.342652, 1, 1.5, 0.5, 0.5,
-4.319882, 0.2819804, -7.342652, 0, 1.5, 0.5, 0.5
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
-4.319882, -3.901228, -0.1498678, 0, -0.5, 0.5, 0.5,
-4.319882, -3.901228, -0.1498678, 1, -0.5, 0.5, 0.5,
-4.319882, -3.901228, -0.1498678, 1, 1.5, 0.5, 0.5,
-4.319882, -3.901228, -0.1498678, 0, 1.5, 0.5, 0.5
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
-3, -2.935872, -5.682779,
2, -2.935872, -5.682779,
-3, -2.935872, -5.682779,
-3, -3.096765, -5.959424,
-2, -2.935872, -5.682779,
-2, -3.096765, -5.959424,
-1, -2.935872, -5.682779,
-1, -3.096765, -5.959424,
0, -2.935872, -5.682779,
0, -3.096765, -5.959424,
1, -2.935872, -5.682779,
1, -3.096765, -5.959424,
2, -2.935872, -5.682779,
2, -3.096765, -5.959424
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
-3, -3.41855, -6.512715, 0, -0.5, 0.5, 0.5,
-3, -3.41855, -6.512715, 1, -0.5, 0.5, 0.5,
-3, -3.41855, -6.512715, 1, 1.5, 0.5, 0.5,
-3, -3.41855, -6.512715, 0, 1.5, 0.5, 0.5,
-2, -3.41855, -6.512715, 0, -0.5, 0.5, 0.5,
-2, -3.41855, -6.512715, 1, -0.5, 0.5, 0.5,
-2, -3.41855, -6.512715, 1, 1.5, 0.5, 0.5,
-2, -3.41855, -6.512715, 0, 1.5, 0.5, 0.5,
-1, -3.41855, -6.512715, 0, -0.5, 0.5, 0.5,
-1, -3.41855, -6.512715, 1, -0.5, 0.5, 0.5,
-1, -3.41855, -6.512715, 1, 1.5, 0.5, 0.5,
-1, -3.41855, -6.512715, 0, 1.5, 0.5, 0.5,
0, -3.41855, -6.512715, 0, -0.5, 0.5, 0.5,
0, -3.41855, -6.512715, 1, -0.5, 0.5, 0.5,
0, -3.41855, -6.512715, 1, 1.5, 0.5, 0.5,
0, -3.41855, -6.512715, 0, 1.5, 0.5, 0.5,
1, -3.41855, -6.512715, 0, -0.5, 0.5, 0.5,
1, -3.41855, -6.512715, 1, -0.5, 0.5, 0.5,
1, -3.41855, -6.512715, 1, 1.5, 0.5, 0.5,
1, -3.41855, -6.512715, 0, 1.5, 0.5, 0.5,
2, -3.41855, -6.512715, 0, -0.5, 0.5, 0.5,
2, -3.41855, -6.512715, 1, -0.5, 0.5, 0.5,
2, -3.41855, -6.512715, 1, 1.5, 0.5, 0.5,
2, -3.41855, -6.512715, 0, 1.5, 0.5, 0.5
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
-3.395423, -2, -5.682779,
-3.395423, 3, -5.682779,
-3.395423, -2, -5.682779,
-3.549499, -2, -5.959424,
-3.395423, -1, -5.682779,
-3.549499, -1, -5.959424,
-3.395423, 0, -5.682779,
-3.549499, 0, -5.959424,
-3.395423, 1, -5.682779,
-3.549499, 1, -5.959424,
-3.395423, 2, -5.682779,
-3.549499, 2, -5.959424,
-3.395423, 3, -5.682779,
-3.549499, 3, -5.959424
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
-3.857652, -2, -6.512715, 0, -0.5, 0.5, 0.5,
-3.857652, -2, -6.512715, 1, -0.5, 0.5, 0.5,
-3.857652, -2, -6.512715, 1, 1.5, 0.5, 0.5,
-3.857652, -2, -6.512715, 0, 1.5, 0.5, 0.5,
-3.857652, -1, -6.512715, 0, -0.5, 0.5, 0.5,
-3.857652, -1, -6.512715, 1, -0.5, 0.5, 0.5,
-3.857652, -1, -6.512715, 1, 1.5, 0.5, 0.5,
-3.857652, -1, -6.512715, 0, 1.5, 0.5, 0.5,
-3.857652, 0, -6.512715, 0, -0.5, 0.5, 0.5,
-3.857652, 0, -6.512715, 1, -0.5, 0.5, 0.5,
-3.857652, 0, -6.512715, 1, 1.5, 0.5, 0.5,
-3.857652, 0, -6.512715, 0, 1.5, 0.5, 0.5,
-3.857652, 1, -6.512715, 0, -0.5, 0.5, 0.5,
-3.857652, 1, -6.512715, 1, -0.5, 0.5, 0.5,
-3.857652, 1, -6.512715, 1, 1.5, 0.5, 0.5,
-3.857652, 1, -6.512715, 0, 1.5, 0.5, 0.5,
-3.857652, 2, -6.512715, 0, -0.5, 0.5, 0.5,
-3.857652, 2, -6.512715, 1, -0.5, 0.5, 0.5,
-3.857652, 2, -6.512715, 1, 1.5, 0.5, 0.5,
-3.857652, 2, -6.512715, 0, 1.5, 0.5, 0.5,
-3.857652, 3, -6.512715, 0, -0.5, 0.5, 0.5,
-3.857652, 3, -6.512715, 1, -0.5, 0.5, 0.5,
-3.857652, 3, -6.512715, 1, 1.5, 0.5, 0.5,
-3.857652, 3, -6.512715, 0, 1.5, 0.5, 0.5
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
-3.395423, -2.935872, -4,
-3.395423, -2.935872, 4,
-3.395423, -2.935872, -4,
-3.549499, -3.096765, -4,
-3.395423, -2.935872, -2,
-3.549499, -3.096765, -2,
-3.395423, -2.935872, 0,
-3.549499, -3.096765, 0,
-3.395423, -2.935872, 2,
-3.549499, -3.096765, 2,
-3.395423, -2.935872, 4,
-3.549499, -3.096765, 4
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
-3.857652, -3.41855, -4, 0, -0.5, 0.5, 0.5,
-3.857652, -3.41855, -4, 1, -0.5, 0.5, 0.5,
-3.857652, -3.41855, -4, 1, 1.5, 0.5, 0.5,
-3.857652, -3.41855, -4, 0, 1.5, 0.5, 0.5,
-3.857652, -3.41855, -2, 0, -0.5, 0.5, 0.5,
-3.857652, -3.41855, -2, 1, -0.5, 0.5, 0.5,
-3.857652, -3.41855, -2, 1, 1.5, 0.5, 0.5,
-3.857652, -3.41855, -2, 0, 1.5, 0.5, 0.5,
-3.857652, -3.41855, 0, 0, -0.5, 0.5, 0.5,
-3.857652, -3.41855, 0, 1, -0.5, 0.5, 0.5,
-3.857652, -3.41855, 0, 1, 1.5, 0.5, 0.5,
-3.857652, -3.41855, 0, 0, 1.5, 0.5, 0.5,
-3.857652, -3.41855, 2, 0, -0.5, 0.5, 0.5,
-3.857652, -3.41855, 2, 1, -0.5, 0.5, 0.5,
-3.857652, -3.41855, 2, 1, 1.5, 0.5, 0.5,
-3.857652, -3.41855, 2, 0, 1.5, 0.5, 0.5,
-3.857652, -3.41855, 4, 0, -0.5, 0.5, 0.5,
-3.857652, -3.41855, 4, 1, -0.5, 0.5, 0.5,
-3.857652, -3.41855, 4, 1, 1.5, 0.5, 0.5,
-3.857652, -3.41855, 4, 0, 1.5, 0.5, 0.5
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
-3.395423, -2.935872, -5.682779,
-3.395423, 3.499833, -5.682779,
-3.395423, -2.935872, 5.383043,
-3.395423, 3.499833, 5.383043,
-3.395423, -2.935872, -5.682779,
-3.395423, -2.935872, 5.383043,
-3.395423, 3.499833, -5.682779,
-3.395423, 3.499833, 5.383043,
-3.395423, -2.935872, -5.682779,
2.767642, -2.935872, -5.682779,
-3.395423, -2.935872, 5.383043,
2.767642, -2.935872, 5.383043,
-3.395423, 3.499833, -5.682779,
2.767642, 3.499833, -5.682779,
-3.395423, 3.499833, 5.383043,
2.767642, 3.499833, 5.383043,
2.767642, -2.935872, -5.682779,
2.767642, 3.499833, -5.682779,
2.767642, -2.935872, 5.383043,
2.767642, 3.499833, 5.383043,
2.767642, -2.935872, -5.682779,
2.767642, -2.935872, 5.383043,
2.767642, 3.499833, -5.682779,
2.767642, 3.499833, 5.383043
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
var radius = 7.586548;
var distance = 33.75341;
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
mvMatrix.translate( 0.3138906, -0.2819804, 0.1498678 );
mvMatrix.scale( 1.330949, 1.274565, 0.7412667 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.75341);
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
InChI_1S_C18H19NO4_c<-read.table("InChI_1S_C18H19NO4_c.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C18H19NO4_c$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C18H19NO4_c' not found
```

```r
y<-InChI_1S_C18H19NO4_c$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C18H19NO4_c' not found
```

```r
z<-InChI_1S_C18H19NO4_c$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C18H19NO4_c' not found
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
-3.305669, 0.4702699, -2.505367, 0, 0, 1, 1, 1,
-3.073198, -0.8342714, -0.4900389, 1, 0, 0, 1, 1,
-3.022463, -0.6592876, -2.168813, 1, 0, 0, 1, 1,
-2.828449, 1.223693, -0.2409739, 1, 0, 0, 1, 1,
-2.81584, 0.4998985, -1.684137, 1, 0, 0, 1, 1,
-2.731575, 1.077545, -2.652537, 1, 0, 0, 1, 1,
-2.727204, 0.9608353, -1.283727, 0, 0, 0, 1, 1,
-2.697016, 0.6760083, -1.726933, 0, 0, 0, 1, 1,
-2.656213, -0.5385152, -1.93962, 0, 0, 0, 1, 1,
-2.608213, 0.5655547, -1.181303, 0, 0, 0, 1, 1,
-2.580663, -0.4643762, -1.328524, 0, 0, 0, 1, 1,
-2.460539, 0.2372227, -2.387446, 0, 0, 0, 1, 1,
-2.455193, -1.597603, -4.893536, 0, 0, 0, 1, 1,
-2.432057, 0.5482922, -1.734943, 1, 1, 1, 1, 1,
-2.392658, 0.7913972, -0.8951561, 1, 1, 1, 1, 1,
-2.360449, -0.4231102, -0.9042398, 1, 1, 1, 1, 1,
-2.329408, 0.9573443, -2.762229, 1, 1, 1, 1, 1,
-2.283314, 1.789278, -0.8387688, 1, 1, 1, 1, 1,
-2.190808, -1.276052, -2.02104, 1, 1, 1, 1, 1,
-2.155975, 0.2181246, -1.675052, 1, 1, 1, 1, 1,
-2.14419, 0.0374479, -1.188047, 1, 1, 1, 1, 1,
-2.12859, -1.749803, -1.230211, 1, 1, 1, 1, 1,
-2.121469, -0.07883131, -2.935278, 1, 1, 1, 1, 1,
-2.086824, -0.02342738, -3.433823, 1, 1, 1, 1, 1,
-2.079863, -0.2701804, -1.486469, 1, 1, 1, 1, 1,
-2.069004, 0.4079491, -2.28617, 1, 1, 1, 1, 1,
-2.063765, 0.3411684, -0.8243485, 1, 1, 1, 1, 1,
-2.010268, -0.2004448, -2.781171, 1, 1, 1, 1, 1,
-2.001899, 1.320901, -1.624497, 0, 0, 1, 1, 1,
-1.986175, -0.1568476, -1.609279, 1, 0, 0, 1, 1,
-1.981287, -1.350909, -1.865185, 1, 0, 0, 1, 1,
-1.961798, -0.8771406, -3.774919, 1, 0, 0, 1, 1,
-1.959117, 0.5423396, -1.232002, 1, 0, 0, 1, 1,
-1.953372, -0.2482421, -1.260364, 1, 0, 0, 1, 1,
-1.948591, -0.7491056, -2.033312, 0, 0, 0, 1, 1,
-1.93673, 0.03961665, -1.619834, 0, 0, 0, 1, 1,
-1.930215, 1.243607, -1.545985, 0, 0, 0, 1, 1,
-1.915367, 0.4487052, -1.311891, 0, 0, 0, 1, 1,
-1.907873, -1.296588, -2.23762, 0, 0, 0, 1, 1,
-1.907472, -0.1830239, -3.986456, 0, 0, 0, 1, 1,
-1.84761, 0.7449742, -1.610963, 0, 0, 0, 1, 1,
-1.822838, -0.1410997, 0.6587583, 1, 1, 1, 1, 1,
-1.816276, 2.013775, -0.6746081, 1, 1, 1, 1, 1,
-1.796, -0.3998915, -4.311906, 1, 1, 1, 1, 1,
-1.793036, -1.03961, -2.393306, 1, 1, 1, 1, 1,
-1.750732, 1.034699, -0.43545, 1, 1, 1, 1, 1,
-1.743563, 0.5022565, -1.864732, 1, 1, 1, 1, 1,
-1.742786, 1.911557, -1.104353, 1, 1, 1, 1, 1,
-1.742209, -0.286043, -3.380891, 1, 1, 1, 1, 1,
-1.740386, -0.9315372, -2.524878, 1, 1, 1, 1, 1,
-1.72755, 0.1960761, -2.137591, 1, 1, 1, 1, 1,
-1.72704, -0.7316628, -2.344955, 1, 1, 1, 1, 1,
-1.710794, 0.5932099, 0.7229776, 1, 1, 1, 1, 1,
-1.707104, 0.8571731, -2.151159, 1, 1, 1, 1, 1,
-1.691015, 1.5754, 0.1502752, 1, 1, 1, 1, 1,
-1.685544, 1.508935, -0.01016027, 1, 1, 1, 1, 1,
-1.672738, 0.6281214, -1.431168, 0, 0, 1, 1, 1,
-1.666098, -0.1189307, -2.154209, 1, 0, 0, 1, 1,
-1.662765, 0.4154136, -2.546652, 1, 0, 0, 1, 1,
-1.662734, 0.8265218, -0.3970256, 1, 0, 0, 1, 1,
-1.660544, -0.9036778, -2.622027, 1, 0, 0, 1, 1,
-1.654584, 1.126964, -1.344881, 1, 0, 0, 1, 1,
-1.644295, -0.7958708, -2.226567, 0, 0, 0, 1, 1,
-1.643316, 0.1756555, -2.693734, 0, 0, 0, 1, 1,
-1.641056, -0.2105152, -0.5143451, 0, 0, 0, 1, 1,
-1.623652, 0.1391323, -2.176143, 0, 0, 0, 1, 1,
-1.617634, -0.6735133, -2.196496, 0, 0, 0, 1, 1,
-1.614589, -0.2951214, -2.526093, 0, 0, 0, 1, 1,
-1.601131, -1.317673, -2.003124, 0, 0, 0, 1, 1,
-1.600599, 2.920065, -0.6424832, 1, 1, 1, 1, 1,
-1.596106, -0.9717071, -2.237445, 1, 1, 1, 1, 1,
-1.594312, -1.483051, -1.388691, 1, 1, 1, 1, 1,
-1.573417, 1.32116, -2.508687, 1, 1, 1, 1, 1,
-1.572244, -0.783108, -0.4416487, 1, 1, 1, 1, 1,
-1.568347, -0.776822, -4.070709, 1, 1, 1, 1, 1,
-1.543637, 1.140942, -1.267475, 1, 1, 1, 1, 1,
-1.529704, -1.166817, -3.950535, 1, 1, 1, 1, 1,
-1.528299, 1.208776, -0.8303515, 1, 1, 1, 1, 1,
-1.527922, 1.986377, -1.928379, 1, 1, 1, 1, 1,
-1.513911, -0.05604618, -0.4425521, 1, 1, 1, 1, 1,
-1.506332, 0.4792726, -1.194127, 1, 1, 1, 1, 1,
-1.4834, 0.09919588, -0.8530148, 1, 1, 1, 1, 1,
-1.478643, 0.300687, -2.206098, 1, 1, 1, 1, 1,
-1.477704, -1.949761, -1.901577, 1, 1, 1, 1, 1,
-1.477497, 0.1000051, -1.975381, 0, 0, 1, 1, 1,
-1.476006, 0.06597476, 0.0363885, 1, 0, 0, 1, 1,
-1.461407, 0.1060329, -0.3812335, 1, 0, 0, 1, 1,
-1.440329, 0.4571372, -0.8054663, 1, 0, 0, 1, 1,
-1.43237, 1.317657, -0.902283, 1, 0, 0, 1, 1,
-1.420069, -1.041735, -2.998565, 1, 0, 0, 1, 1,
-1.417758, -0.7973624, -1.498861, 0, 0, 0, 1, 1,
-1.416019, -0.4649997, -2.903762, 0, 0, 0, 1, 1,
-1.412923, 0.9850384, -1.438662, 0, 0, 0, 1, 1,
-1.402926, -1.174442, -2.366068, 0, 0, 0, 1, 1,
-1.399003, 0.1650254, -1.179649, 0, 0, 0, 1, 1,
-1.391553, -1.290012, -1.965893, 0, 0, 0, 1, 1,
-1.386774, 1.467647, -1.810639, 0, 0, 0, 1, 1,
-1.383354, 0.8163588, -2.169374, 1, 1, 1, 1, 1,
-1.368847, 0.533304, -1.046898, 1, 1, 1, 1, 1,
-1.366112, 0.7874822, -1.57036, 1, 1, 1, 1, 1,
-1.365571, -0.4236111, -1.95284, 1, 1, 1, 1, 1,
-1.363542, 0.147921, -3.14053, 1, 1, 1, 1, 1,
-1.358045, 1.146436, -0.4573921, 1, 1, 1, 1, 1,
-1.356339, -0.8018255, -2.959261, 1, 1, 1, 1, 1,
-1.344183, -1.436916, -2.113126, 1, 1, 1, 1, 1,
-1.343175, -0.5042003, -2.480831, 1, 1, 1, 1, 1,
-1.334303, -0.4073164, -2.808604, 1, 1, 1, 1, 1,
-1.324104, -0.6724926, -1.277709, 1, 1, 1, 1, 1,
-1.32196, 0.5228168, -3.4275, 1, 1, 1, 1, 1,
-1.311478, 0.7459237, -0.9447026, 1, 1, 1, 1, 1,
-1.307635, 0.7099733, -0.9768006, 1, 1, 1, 1, 1,
-1.287641, -0.6880277, -1.527014, 1, 1, 1, 1, 1,
-1.286579, -1.814037, -4.638682, 0, 0, 1, 1, 1,
-1.280067, 0.0277779, -0.4639513, 1, 0, 0, 1, 1,
-1.278324, 0.5004852, -2.298988, 1, 0, 0, 1, 1,
-1.274793, -1.317257, -2.279868, 1, 0, 0, 1, 1,
-1.272725, -0.3055936, -2.445206, 1, 0, 0, 1, 1,
-1.261589, -0.4349581, -0.9154692, 1, 0, 0, 1, 1,
-1.255058, -0.6143353, -2.697953, 0, 0, 0, 1, 1,
-1.24596, 0.0733766, -0.420571, 0, 0, 0, 1, 1,
-1.243517, -0.163429, -2.737772, 0, 0, 0, 1, 1,
-1.241834, 0.4321771, -0.5452907, 0, 0, 0, 1, 1,
-1.238305, 1.378516, -1.659882, 0, 0, 0, 1, 1,
-1.235785, -0.616743, -1.282354, 0, 0, 0, 1, 1,
-1.226923, 0.2975945, -2.76948, 0, 0, 0, 1, 1,
-1.223734, -2.066803, -4.493282, 1, 1, 1, 1, 1,
-1.215901, -1.46548, -1.645708, 1, 1, 1, 1, 1,
-1.215811, -0.3805848, -3.252698, 1, 1, 1, 1, 1,
-1.211675, 0.9550577, -0.6668097, 1, 1, 1, 1, 1,
-1.210692, 0.3139476, -1.424812, 1, 1, 1, 1, 1,
-1.206534, 2.204796, -2.530945, 1, 1, 1, 1, 1,
-1.188614, -1.677729, -3.604678, 1, 1, 1, 1, 1,
-1.18416, 0.5685529, -0.9931275, 1, 1, 1, 1, 1,
-1.183103, 0.4170365, -1.275716, 1, 1, 1, 1, 1,
-1.182124, -0.5239718, -0.7140397, 1, 1, 1, 1, 1,
-1.180744, -2.613089, -3.005814, 1, 1, 1, 1, 1,
-1.175362, -2.089222, -3.482984, 1, 1, 1, 1, 1,
-1.172745, -0.5213289, -2.775438, 1, 1, 1, 1, 1,
-1.168889, 0.07147609, -1.157329, 1, 1, 1, 1, 1,
-1.16441, -1.518947, -2.888278, 1, 1, 1, 1, 1,
-1.162586, 1.250817, 0.1238424, 0, 0, 1, 1, 1,
-1.157266, -0.9944788, -1.109206, 1, 0, 0, 1, 1,
-1.153367, 0.005546435, -2.404173, 1, 0, 0, 1, 1,
-1.134738, 0.4243182, 0.2444067, 1, 0, 0, 1, 1,
-1.133238, 0.753323, -1.546544, 1, 0, 0, 1, 1,
-1.130435, -0.8585799, -1.129684, 1, 0, 0, 1, 1,
-1.126411, -1.681142, -3.796104, 0, 0, 0, 1, 1,
-1.126076, -1.723093, -3.094377, 0, 0, 0, 1, 1,
-1.119986, -0.2830795, -3.05354, 0, 0, 0, 1, 1,
-1.116679, 0.2946122, -1.961959, 0, 0, 0, 1, 1,
-1.113345, -0.2733105, -1.822536, 0, 0, 0, 1, 1,
-1.105611, -0.3829677, 0.6366256, 0, 0, 0, 1, 1,
-1.102539, -0.1118518, 0.1396435, 0, 0, 0, 1, 1,
-1.0972, -0.4533381, -2.86108, 1, 1, 1, 1, 1,
-1.084244, -1.52211, -2.411367, 1, 1, 1, 1, 1,
-1.07655, 0.6239334, -2.415949, 1, 1, 1, 1, 1,
-1.074522, -0.7724285, -2.232062, 1, 1, 1, 1, 1,
-1.067561, -0.5120372, -2.565815, 1, 1, 1, 1, 1,
-1.058809, -1.296602, -2.707769, 1, 1, 1, 1, 1,
-1.056726, -0.4777403, -1.777273, 1, 1, 1, 1, 1,
-1.05418, 1.490186, -1.297288, 1, 1, 1, 1, 1,
-1.05398, 1.20713, 0.8697695, 1, 1, 1, 1, 1,
-1.049309, 0.496843, -0.800917, 1, 1, 1, 1, 1,
-1.036488, -1.381643, -2.923077, 1, 1, 1, 1, 1,
-1.036101, -0.5204976, -1.833948, 1, 1, 1, 1, 1,
-1.033068, 1.738298, -0.1820149, 1, 1, 1, 1, 1,
-1.031955, 1.230744, -1.346123, 1, 1, 1, 1, 1,
-1.029472, -0.6122373, -0.2833926, 1, 1, 1, 1, 1,
-1.028003, -0.5767159, -4.153383, 0, 0, 1, 1, 1,
-1.02706, 1.332993, -2.657144, 1, 0, 0, 1, 1,
-1.016001, 1.006909, 0.5660132, 1, 0, 0, 1, 1,
-1.010501, -2.142689, -3.152949, 1, 0, 0, 1, 1,
-1.009969, -0.5904248, -0.8184296, 1, 0, 0, 1, 1,
-1.008721, 1.181937, -2.222438, 1, 0, 0, 1, 1,
-1.00089, -1.009371, -1.835212, 0, 0, 0, 1, 1,
-0.9976436, -0.3903825, -1.804081, 0, 0, 0, 1, 1,
-0.996366, 1.261331, 0.5289378, 0, 0, 0, 1, 1,
-0.9961858, -1.629679, -0.540668, 0, 0, 0, 1, 1,
-0.9881645, 0.3037053, -0.08289831, 0, 0, 0, 1, 1,
-0.9860412, 0.3209074, -0.03899507, 0, 0, 0, 1, 1,
-0.9817503, 2.164643, -1.74094, 0, 0, 0, 1, 1,
-0.9805068, 0.8478602, -2.404447, 1, 1, 1, 1, 1,
-0.9803814, -0.0158017, -1.085845, 1, 1, 1, 1, 1,
-0.9799449, -0.8764421, -1.974677, 1, 1, 1, 1, 1,
-0.979798, -0.7982351, -2.587684, 1, 1, 1, 1, 1,
-0.9785409, 0.02478667, -1.073285, 1, 1, 1, 1, 1,
-0.9746152, 0.3408724, -0.6479432, 1, 1, 1, 1, 1,
-0.9699429, -1.637375, -3.690516, 1, 1, 1, 1, 1,
-0.9662155, 0.6326203, -0.5824874, 1, 1, 1, 1, 1,
-0.9638124, 0.2312405, -1.349731, 1, 1, 1, 1, 1,
-0.9605458, 1.255738, -0.3071424, 1, 1, 1, 1, 1,
-0.9600258, 1.62278, 0.1414126, 1, 1, 1, 1, 1,
-0.9597024, 0.2558465, -0.6987074, 1, 1, 1, 1, 1,
-0.9579628, -0.753087, -2.049561, 1, 1, 1, 1, 1,
-0.955788, 0.8791515, -1.505769, 1, 1, 1, 1, 1,
-0.9536002, 0.4929003, -1.942146, 1, 1, 1, 1, 1,
-0.952676, 0.1755739, -2.309081, 0, 0, 1, 1, 1,
-0.9514505, -0.5975717, -0.5768915, 1, 0, 0, 1, 1,
-0.943056, 0.4936582, -0.7001566, 1, 0, 0, 1, 1,
-0.9396396, -0.2529749, -1.476588, 1, 0, 0, 1, 1,
-0.9376995, -0.9152969, -0.4469487, 1, 0, 0, 1, 1,
-0.9328543, -0.03411923, 0.2868304, 1, 0, 0, 1, 1,
-0.921872, -0.4786738, -3.16752, 0, 0, 0, 1, 1,
-0.9163559, 0.3782988, -0.846085, 0, 0, 0, 1, 1,
-0.9122573, 0.3303142, -0.3148553, 0, 0, 0, 1, 1,
-0.899684, 0.06145931, -3.304968, 0, 0, 0, 1, 1,
-0.894951, -0.2360739, -2.767463, 0, 0, 0, 1, 1,
-0.8922007, -0.3662808, -1.019346, 0, 0, 0, 1, 1,
-0.8850434, -0.1892186, -3.02107, 0, 0, 0, 1, 1,
-0.8821408, -0.51946, -1.780129, 1, 1, 1, 1, 1,
-0.8764259, 0.7417986, -0.7515914, 1, 1, 1, 1, 1,
-0.8721019, 0.8104511, -0.7267512, 1, 1, 1, 1, 1,
-0.8678276, -0.2569812, -1.526511, 1, 1, 1, 1, 1,
-0.8653795, -2.842148, -2.202706, 1, 1, 1, 1, 1,
-0.8627868, -0.08863721, -0.8724126, 1, 1, 1, 1, 1,
-0.8602132, -0.282197, -3.322229, 1, 1, 1, 1, 1,
-0.858916, 0.7828359, -1.230804, 1, 1, 1, 1, 1,
-0.8580604, -1.135781, -3.442126, 1, 1, 1, 1, 1,
-0.8482488, 0.8962078, -0.8695138, 1, 1, 1, 1, 1,
-0.8478272, -0.7775285, -3.053122, 1, 1, 1, 1, 1,
-0.8459606, 0.3229808, -0.4042633, 1, 1, 1, 1, 1,
-0.8458632, 0.4134254, -2.320473, 1, 1, 1, 1, 1,
-0.8422652, -1.746639, -2.955627, 1, 1, 1, 1, 1,
-0.831821, -0.6668929, -1.495548, 1, 1, 1, 1, 1,
-0.8297434, -1.712621, -2.224709, 0, 0, 1, 1, 1,
-0.8261443, -1.104381, -1.558332, 1, 0, 0, 1, 1,
-0.8257117, 1.137228, -0.8724255, 1, 0, 0, 1, 1,
-0.8222318, -0.7947721, -3.213238, 1, 0, 0, 1, 1,
-0.8186799, -0.5756018, -2.203856, 1, 0, 0, 1, 1,
-0.8162329, 0.4472942, -0.3051948, 1, 0, 0, 1, 1,
-0.8147993, 0.8012084, -1.908362, 0, 0, 0, 1, 1,
-0.8140789, 0.2694122, -1.357661, 0, 0, 0, 1, 1,
-0.8137953, -0.436395, -1.003032, 0, 0, 0, 1, 1,
-0.7998299, -0.08808966, -2.695795, 0, 0, 0, 1, 1,
-0.7948083, 0.713841, -1.570545, 0, 0, 0, 1, 1,
-0.786006, 0.7249407, -0.3978839, 0, 0, 0, 1, 1,
-0.7784494, 0.325572, -1.904326, 0, 0, 0, 1, 1,
-0.7677929, -0.09508558, -0.6333084, 1, 1, 1, 1, 1,
-0.7653682, 1.897766, -1.521295, 1, 1, 1, 1, 1,
-0.7628378, 0.042218, -1.130014, 1, 1, 1, 1, 1,
-0.7601596, 0.6959403, -0.4272805, 1, 1, 1, 1, 1,
-0.756085, -1.110957, -2.16204, 1, 1, 1, 1, 1,
-0.7523407, -0.5528058, -1.962498, 1, 1, 1, 1, 1,
-0.7473959, -1.314334, -4.119005, 1, 1, 1, 1, 1,
-0.7408851, -0.1191596, -0.8379077, 1, 1, 1, 1, 1,
-0.7326396, 1.118293, -0.02976151, 1, 1, 1, 1, 1,
-0.7314324, 2.061392, -0.5164023, 1, 1, 1, 1, 1,
-0.729359, 0.004656839, -3.525136, 1, 1, 1, 1, 1,
-0.727096, 0.173647, -0.3086252, 1, 1, 1, 1, 1,
-0.7240413, 0.6114957, -0.5979399, 1, 1, 1, 1, 1,
-0.7224976, -1.089386, 0.222225, 1, 1, 1, 1, 1,
-0.7191824, 2.047383, -1.160728, 1, 1, 1, 1, 1,
-0.7116911, 1.232723, -0.07673583, 0, 0, 1, 1, 1,
-0.7072235, 0.01580953, -1.377838, 1, 0, 0, 1, 1,
-0.6998436, 1.049028, -2.528241, 1, 0, 0, 1, 1,
-0.6917144, 1.033425, 0.4006197, 1, 0, 0, 1, 1,
-0.6913428, 0.7106109, -1.7669, 1, 0, 0, 1, 1,
-0.6904739, -0.3219833, -2.911036, 1, 0, 0, 1, 1,
-0.6854649, -0.6917186, -3.210254, 0, 0, 0, 1, 1,
-0.685074, 0.3508985, -1.316441, 0, 0, 0, 1, 1,
-0.6821188, -0.06083535, -0.4045515, 0, 0, 0, 1, 1,
-0.6793618, -1.315364, -1.736568, 0, 0, 0, 1, 1,
-0.671924, -1.38615, -2.691953, 0, 0, 0, 1, 1,
-0.6717254, 0.8391865, -0.1354444, 0, 0, 0, 1, 1,
-0.6699942, 0.7376352, -1.628043, 0, 0, 0, 1, 1,
-0.6668661, -1.460819, -1.394558, 1, 1, 1, 1, 1,
-0.6624193, -0.1818098, -2.433429, 1, 1, 1, 1, 1,
-0.6616444, -0.6717218, -4.213383, 1, 1, 1, 1, 1,
-0.6582301, 1.015058, -2.151349, 1, 1, 1, 1, 1,
-0.6577467, -0.02264726, -1.063189, 1, 1, 1, 1, 1,
-0.6575683, -0.4410341, -3.216411, 1, 1, 1, 1, 1,
-0.6554751, 0.1948506, -1.880167, 1, 1, 1, 1, 1,
-0.6552631, -0.5708288, -2.788899, 1, 1, 1, 1, 1,
-0.6439373, -1.011631, -3.981208, 1, 1, 1, 1, 1,
-0.6416806, -0.01750555, -2.365593, 1, 1, 1, 1, 1,
-0.6413469, -1.918704, -1.318018, 1, 1, 1, 1, 1,
-0.6377316, 0.5810372, -1.934413, 1, 1, 1, 1, 1,
-0.6372127, 2.514126, -1.468896, 1, 1, 1, 1, 1,
-0.6313722, -0.436689, -1.466442, 1, 1, 1, 1, 1,
-0.6310923, 0.4658181, -0.7108644, 1, 1, 1, 1, 1,
-0.6306732, 0.9696864, 0.1770061, 0, 0, 1, 1, 1,
-0.6285751, -1.876911, -2.586864, 1, 0, 0, 1, 1,
-0.6211137, 1.042908, -0.9684249, 1, 0, 0, 1, 1,
-0.6161262, 0.6048006, 0.1005909, 1, 0, 0, 1, 1,
-0.6155782, 0.005474973, -0.4491026, 1, 0, 0, 1, 1,
-0.6134812, 1.107171, -0.9617842, 1, 0, 0, 1, 1,
-0.6123911, 0.2582738, -2.179826, 0, 0, 0, 1, 1,
-0.6107779, 1.206396, 0.4942716, 0, 0, 0, 1, 1,
-0.6073621, 0.4823702, -0.08093953, 0, 0, 0, 1, 1,
-0.5991688, -1.085923, -3.332418, 0, 0, 0, 1, 1,
-0.5990437, 1.130966, -0.5188468, 0, 0, 0, 1, 1,
-0.5983049, -0.176949, -2.660513, 0, 0, 0, 1, 1,
-0.597447, 1.169042, 0.7303675, 0, 0, 0, 1, 1,
-0.5944808, -0.1778098, -1.417886, 1, 1, 1, 1, 1,
-0.5903897, -1.469681, -1.804154, 1, 1, 1, 1, 1,
-0.5902352, -1.586432, -3.259007, 1, 1, 1, 1, 1,
-0.5857381, -1.073847, -1.81763, 1, 1, 1, 1, 1,
-0.5851397, -0.4193941, -2.577785, 1, 1, 1, 1, 1,
-0.5846189, -1.39119, -3.724569, 1, 1, 1, 1, 1,
-0.5787751, 0.7623104, -0.6234441, 1, 1, 1, 1, 1,
-0.5762661, -1.526975, -2.304765, 1, 1, 1, 1, 1,
-0.5719507, 0.1888073, -0.9426859, 1, 1, 1, 1, 1,
-0.5698792, -0.8687504, -1.950437, 1, 1, 1, 1, 1,
-0.5685728, 0.5454501, -1.861807, 1, 1, 1, 1, 1,
-0.5632731, 1.594115, 1.712552, 1, 1, 1, 1, 1,
-0.5610267, 0.5094879, -2.186067, 1, 1, 1, 1, 1,
-0.5545388, 0.3059608, -0.06025698, 1, 1, 1, 1, 1,
-0.5526333, -1.630148, -2.711862, 1, 1, 1, 1, 1,
-0.5516834, 0.08898395, -1.163927, 0, 0, 1, 1, 1,
-0.5495746, -0.2028503, -0.6077062, 1, 0, 0, 1, 1,
-0.5483645, -0.8009461, -3.604794, 1, 0, 0, 1, 1,
-0.5477271, 0.4328716, -0.5421093, 1, 0, 0, 1, 1,
-0.5442581, 1.129079, -0.9918276, 1, 0, 0, 1, 1,
-0.5420778, -1.27285, -3.625501, 1, 0, 0, 1, 1,
-0.5384574, 0.01451348, -0.3205383, 0, 0, 0, 1, 1,
-0.5292487, -0.1711946, -2.350214, 0, 0, 0, 1, 1,
-0.5291861, -1.290717, -2.70291, 0, 0, 0, 1, 1,
-0.525372, -0.02195126, -1.452751, 0, 0, 0, 1, 1,
-0.5251962, -1.295484, -1.434617, 0, 0, 0, 1, 1,
-0.524156, -2.34158, -5.521626, 0, 0, 0, 1, 1,
-0.5193965, -1.01277, -3.449197, 0, 0, 0, 1, 1,
-0.5146863, 1.931774, 1.105589, 1, 1, 1, 1, 1,
-0.5138704, 2.080864, -0.2578174, 1, 1, 1, 1, 1,
-0.5105847, 0.9831882, -1.609559, 1, 1, 1, 1, 1,
-0.5084383, 1.231956, -1.385986, 1, 1, 1, 1, 1,
-0.5040034, -0.4984498, -2.517143, 1, 1, 1, 1, 1,
-0.5020459, -1.551919, -4.608807, 1, 1, 1, 1, 1,
-0.5015196, -2.045673, -2.088479, 1, 1, 1, 1, 1,
-0.4997616, 0.991383, -0.4178667, 1, 1, 1, 1, 1,
-0.4992482, -0.9702733, -1.588424, 1, 1, 1, 1, 1,
-0.4963667, 0.2969394, 1.125224, 1, 1, 1, 1, 1,
-0.4963451, -2.397722, -1.246711, 1, 1, 1, 1, 1,
-0.4955495, -0.2697845, -1.475921, 1, 1, 1, 1, 1,
-0.494522, -1.106308, -3.317787, 1, 1, 1, 1, 1,
-0.4910546, -0.04438497, 0.8845766, 1, 1, 1, 1, 1,
-0.4814321, 0.7685474, -3.164601, 1, 1, 1, 1, 1,
-0.4814084, -1.790198, -3.141273, 0, 0, 1, 1, 1,
-0.4804867, -0.9843346, -3.559475, 1, 0, 0, 1, 1,
-0.4769684, -0.4571734, -2.817557, 1, 0, 0, 1, 1,
-0.4716384, -1.743976, -1.032356, 1, 0, 0, 1, 1,
-0.4706657, -0.7194008, -3.063932, 1, 0, 0, 1, 1,
-0.4688645, -0.6135634, -3.477983, 1, 0, 0, 1, 1,
-0.4651237, -0.4218045, -2.130954, 0, 0, 0, 1, 1,
-0.464998, 1.344055, -0.09223596, 0, 0, 0, 1, 1,
-0.4632246, -0.1141892, -1.530612, 0, 0, 0, 1, 1,
-0.4537466, 0.2878267, -1.518245, 0, 0, 0, 1, 1,
-0.4500421, -1.461871, -2.804272, 0, 0, 0, 1, 1,
-0.4420843, 0.1516747, -1.838856, 0, 0, 0, 1, 1,
-0.4391783, -0.3691498, -1.668283, 0, 0, 0, 1, 1,
-0.4319778, -1.676022, -5.506382, 1, 1, 1, 1, 1,
-0.4276387, -0.3017909, -1.566409, 1, 1, 1, 1, 1,
-0.4210658, -0.2686594, -1.363188, 1, 1, 1, 1, 1,
-0.4202563, 0.7006884, 1.164221, 1, 1, 1, 1, 1,
-0.4194618, -0.1306552, -1.261358, 1, 1, 1, 1, 1,
-0.4174695, -0.07427422, -2.787199, 1, 1, 1, 1, 1,
-0.4164103, -0.4641992, -3.583399, 1, 1, 1, 1, 1,
-0.4152808, 0.9241571, -1.219482, 1, 1, 1, 1, 1,
-0.4120988, 0.816121, -3.652847, 1, 1, 1, 1, 1,
-0.4109912, 0.8065976, -1.048982, 1, 1, 1, 1, 1,
-0.4108744, -1.049471, -3.018607, 1, 1, 1, 1, 1,
-0.4095956, 0.1775358, 0.2084028, 1, 1, 1, 1, 1,
-0.4094853, 1.096803, 0.2381258, 1, 1, 1, 1, 1,
-0.401608, -0.6044005, -2.79417, 1, 1, 1, 1, 1,
-0.4010402, 0.2880589, -1.017762, 1, 1, 1, 1, 1,
-0.4003837, -0.8015881, -2.373563, 0, 0, 1, 1, 1,
-0.3993469, -0.2589322, -2.232184, 1, 0, 0, 1, 1,
-0.3977055, -0.7322096, -2.636993, 1, 0, 0, 1, 1,
-0.3959879, -0.09620097, -1.573521, 1, 0, 0, 1, 1,
-0.3945039, 0.02065662, -2.392187, 1, 0, 0, 1, 1,
-0.3865675, -0.1433958, -4.369104, 1, 0, 0, 1, 1,
-0.3848501, -1.214146, -3.957496, 0, 0, 0, 1, 1,
-0.3807282, 0.3854532, 0.663482, 0, 0, 0, 1, 1,
-0.380292, -1.401333, -2.72583, 0, 0, 0, 1, 1,
-0.379614, -0.8079821, -2.680015, 0, 0, 0, 1, 1,
-0.3707544, -1.552499, -3.733583, 0, 0, 0, 1, 1,
-0.3699773, -0.330304, -5.098738, 0, 0, 0, 1, 1,
-0.3698789, -2.12978, -3.587027, 0, 0, 0, 1, 1,
-0.3675059, 0.2594099, -2.087465, 1, 1, 1, 1, 1,
-0.3666365, 1.679985, 0.05986319, 1, 1, 1, 1, 1,
-0.3664872, -1.104027, -2.978643, 1, 1, 1, 1, 1,
-0.3623907, -0.8311421, -2.959776, 1, 1, 1, 1, 1,
-0.3617721, -0.1249838, -3.137168, 1, 1, 1, 1, 1,
-0.3520723, -0.1165075, -1.832985, 1, 1, 1, 1, 1,
-0.3501341, -1.848553, -2.037745, 1, 1, 1, 1, 1,
-0.3468249, 0.1469495, -0.4948977, 1, 1, 1, 1, 1,
-0.3454462, 0.5986735, -0.3846222, 1, 1, 1, 1, 1,
-0.3443388, 0.9498134, 1.512834, 1, 1, 1, 1, 1,
-0.3383682, 0.9619037, 0.968085, 1, 1, 1, 1, 1,
-0.338235, 1.763423, -0.35149, 1, 1, 1, 1, 1,
-0.3374805, -0.1394203, -0.08311945, 1, 1, 1, 1, 1,
-0.3373467, 0.5721887, 0.4481675, 1, 1, 1, 1, 1,
-0.3332447, -0.5084088, -4.833928, 1, 1, 1, 1, 1,
-0.332886, -1.841303, -1.310411, 0, 0, 1, 1, 1,
-0.3322378, -1.667115, -4.098481, 1, 0, 0, 1, 1,
-0.3318947, -0.2608542, -2.139797, 1, 0, 0, 1, 1,
-0.3287122, -0.5399258, -3.720179, 1, 0, 0, 1, 1,
-0.3285482, 1.336066, -1.483563, 1, 0, 0, 1, 1,
-0.3261171, -0.8541829, -1.844505, 1, 0, 0, 1, 1,
-0.3210831, 0.8981724, -0.3482075, 0, 0, 0, 1, 1,
-0.3175703, -0.8934612, -2.402406, 0, 0, 0, 1, 1,
-0.3163739, 0.1902958, -3.377541, 0, 0, 0, 1, 1,
-0.3108615, -0.2828844, -2.241513, 0, 0, 0, 1, 1,
-0.3101612, -0.3451991, -5.120124, 0, 0, 0, 1, 1,
-0.3027858, 0.036459, -0.6034146, 0, 0, 0, 1, 1,
-0.3001483, 0.8622977, 0.5202569, 0, 0, 0, 1, 1,
-0.2841069, 0.09408264, -0.3848249, 1, 1, 1, 1, 1,
-0.2836284, -0.4367557, -2.432316, 1, 1, 1, 1, 1,
-0.2824405, -2.098921, -3.90232, 1, 1, 1, 1, 1,
-0.2766357, -0.6388096, -2.153454, 1, 1, 1, 1, 1,
-0.2761938, 1.23181, 0.3152763, 1, 1, 1, 1, 1,
-0.2700715, -0.4951288, -3.160966, 1, 1, 1, 1, 1,
-0.2698596, 1.357059, 0.2029851, 1, 1, 1, 1, 1,
-0.2678523, -0.2410863, -1.989975, 1, 1, 1, 1, 1,
-0.2654047, 2.302153, -1.296721, 1, 1, 1, 1, 1,
-0.265178, 0.1321428, -1.533307, 1, 1, 1, 1, 1,
-0.2651401, 0.9757507, 1.175748, 1, 1, 1, 1, 1,
-0.2645504, -1.302707, -4.903495, 1, 1, 1, 1, 1,
-0.2644179, 0.4398168, 0.3350739, 1, 1, 1, 1, 1,
-0.261481, -0.4520901, -4.615618, 1, 1, 1, 1, 1,
-0.2596297, 0.8281575, -0.7601861, 1, 1, 1, 1, 1,
-0.2531314, -1.1315, -3.581593, 0, 0, 1, 1, 1,
-0.2440938, 0.7346908, 1.386204, 1, 0, 0, 1, 1,
-0.2405113, 1.271778, -0.2394708, 1, 0, 0, 1, 1,
-0.2400746, -0.1693407, -0.7613881, 1, 0, 0, 1, 1,
-0.2351296, 0.9341011, 0.4236533, 1, 0, 0, 1, 1,
-0.2333431, 0.1960905, -0.6767284, 1, 0, 0, 1, 1,
-0.230891, 0.8909443, -0.7166187, 0, 0, 0, 1, 1,
-0.2231487, -1.371758, -1.336662, 0, 0, 0, 1, 1,
-0.2222951, -0.02849546, -2.473653, 0, 0, 0, 1, 1,
-0.2201709, 0.6420462, 1.078125, 0, 0, 0, 1, 1,
-0.2159161, 0.5604734, -2.086065, 0, 0, 0, 1, 1,
-0.2158045, 0.3142709, -0.4422127, 0, 0, 0, 1, 1,
-0.2114835, -0.5342904, -2.444774, 0, 0, 0, 1, 1,
-0.2071503, -0.8462662, -3.299135, 1, 1, 1, 1, 1,
-0.202091, 0.8529919, -0.6741016, 1, 1, 1, 1, 1,
-0.2003628, 0.7778486, -2.606493, 1, 1, 1, 1, 1,
-0.19992, 0.5978539, 1.418066, 1, 1, 1, 1, 1,
-0.1984956, -0.09844509, -2.910455, 1, 1, 1, 1, 1,
-0.1952735, -1.361482, -4.130711, 1, 1, 1, 1, 1,
-0.1949413, -0.4920756, -2.800163, 1, 1, 1, 1, 1,
-0.1932932, 0.3812471, 0.4298576, 1, 1, 1, 1, 1,
-0.1924233, -0.1114257, -1.848391, 1, 1, 1, 1, 1,
-0.1889814, 0.2858451, -0.598814, 1, 1, 1, 1, 1,
-0.1850775, -1.388733, -2.777327, 1, 1, 1, 1, 1,
-0.1809146, -0.2662798, -2.333284, 1, 1, 1, 1, 1,
-0.1805013, -0.6111778, -0.5858028, 1, 1, 1, 1, 1,
-0.1735448, -0.8913953, -2.20124, 1, 1, 1, 1, 1,
-0.1731151, -0.2745928, -1.283745, 1, 1, 1, 1, 1,
-0.1686805, 1.63396, -0.5440752, 0, 0, 1, 1, 1,
-0.1670489, 0.1385167, -0.3202183, 1, 0, 0, 1, 1,
-0.1595351, 1.622223, -2.098089, 1, 0, 0, 1, 1,
-0.1588105, -1.336825, -2.74191, 1, 0, 0, 1, 1,
-0.1585002, 0.606827, -0.4524231, 1, 0, 0, 1, 1,
-0.1542011, 0.5725568, 0.752968, 1, 0, 0, 1, 1,
-0.1333554, 0.6315038, -1.384281, 0, 0, 0, 1, 1,
-0.1311581, 0.385238, -2.004519, 0, 0, 0, 1, 1,
-0.1294865, -0.757421, -2.731571, 0, 0, 0, 1, 1,
-0.1294322, 0.5806634, -0.2620273, 0, 0, 0, 1, 1,
-0.1272878, -1.256899, -3.105693, 0, 0, 0, 1, 1,
-0.1232494, -1.512898, -3.891704, 0, 0, 0, 1, 1,
-0.1222075, 0.07140648, -2.145932, 0, 0, 0, 1, 1,
-0.1215421, -0.7336921, -1.490175, 1, 1, 1, 1, 1,
-0.1159332, 1.098698, 0.8915483, 1, 1, 1, 1, 1,
-0.115079, -1.184795, -3.711738, 1, 1, 1, 1, 1,
-0.1091095, 0.4461075, -0.7796518, 1, 1, 1, 1, 1,
-0.1034946, 0.8220234, -1.36854, 1, 1, 1, 1, 1,
-0.09932549, 1.532229, -0.07851753, 1, 1, 1, 1, 1,
-0.09777721, -2.009575, -1.535933, 1, 1, 1, 1, 1,
-0.09638142, 0.1968669, -0.3135585, 1, 1, 1, 1, 1,
-0.08641597, -0.442645, -2.303349, 1, 1, 1, 1, 1,
-0.08598728, -0.5726895, -3.882365, 1, 1, 1, 1, 1,
-0.08567041, -0.1468918, -3.067894, 1, 1, 1, 1, 1,
-0.08069169, 0.1287987, -1.299856, 1, 1, 1, 1, 1,
-0.07963979, -1.705121, -0.6309915, 1, 1, 1, 1, 1,
-0.07924608, 0.08380879, 0.0039761, 1, 1, 1, 1, 1,
-0.07737617, -1.575476, -2.408825, 1, 1, 1, 1, 1,
-0.07651242, 1.276592, -2.426562, 0, 0, 1, 1, 1,
-0.07471548, -0.7137679, -3.019412, 1, 0, 0, 1, 1,
-0.07396975, -0.6088962, -2.167548, 1, 0, 0, 1, 1,
-0.07288546, 0.1370324, 0.2695991, 1, 0, 0, 1, 1,
-0.06907067, -2.728883, -4.787907, 1, 0, 0, 1, 1,
-0.06907021, 0.1680419, 0.3397546, 1, 0, 0, 1, 1,
-0.0658688, 1.802907, 0.4103936, 0, 0, 0, 1, 1,
-0.06220575, 0.4271408, -0.3320417, 0, 0, 0, 1, 1,
-0.05677934, 2.270065, 0.8131877, 0, 0, 0, 1, 1,
-0.05246276, 1.090761, 0.1072923, 0, 0, 0, 1, 1,
-0.05185186, -0.4963513, -3.227073, 0, 0, 0, 1, 1,
-0.05049324, -2.168193, -3.517798, 0, 0, 0, 1, 1,
-0.04977579, 0.0560078, -0.4393507, 0, 0, 0, 1, 1,
-0.04411324, -0.4249573, -2.326339, 1, 1, 1, 1, 1,
-0.04055576, 0.3422347, 1.979816, 1, 1, 1, 1, 1,
-0.03879129, -0.5210429, -3.025379, 1, 1, 1, 1, 1,
-0.0377784, 0.6753254, 0.3390954, 1, 1, 1, 1, 1,
-0.03388678, 0.6384088, -0.7488225, 1, 1, 1, 1, 1,
-0.03233637, 1.259489, -0.955116, 1, 1, 1, 1, 1,
-0.03173028, 1.619389, 0.1328312, 1, 1, 1, 1, 1,
-0.02977684, -0.4532413, -3.689705, 1, 1, 1, 1, 1,
-0.0281742, 0.6896197, -0.06141065, 1, 1, 1, 1, 1,
-0.02600812, 1.850255, -0.09783853, 1, 1, 1, 1, 1,
-0.02571992, 0.7399046, -0.6462935, 1, 1, 1, 1, 1,
-0.02051621, 0.03911843, 1.883376, 1, 1, 1, 1, 1,
-0.01862567, -0.05097152, -4.084821, 1, 1, 1, 1, 1,
-0.01808844, 2.129658, 1.4671, 1, 1, 1, 1, 1,
-0.01572242, -0.1064441, -3.057432, 1, 1, 1, 1, 1,
-0.007488071, -0.8645945, -3.583309, 0, 0, 1, 1, 1,
-0.006528422, 2.190583, 1.811406, 1, 0, 0, 1, 1,
-0.005647483, 0.08752959, 1.378551, 1, 0, 0, 1, 1,
-0.004929758, -1.199495, -3.504462, 1, 0, 0, 1, 1,
-0.004008252, -1.572963, -2.64203, 1, 0, 0, 1, 1,
0.007341726, 0.1990793, 0.751, 1, 0, 0, 1, 1,
0.00942804, 0.6465604, 2.495228, 0, 0, 0, 1, 1,
0.009850239, -1.026543, 3.787108, 0, 0, 0, 1, 1,
0.01444497, -0.0609528, 0.7237788, 0, 0, 0, 1, 1,
0.01474224, 1.478473, -0.5825597, 0, 0, 0, 1, 1,
0.01774134, -1.40545, 3.318123, 0, 0, 0, 1, 1,
0.0197771, -1.316127, 1.807104, 0, 0, 0, 1, 1,
0.02072055, 1.828532, 0.5178189, 0, 0, 0, 1, 1,
0.02102466, 0.3138609, -2.330872, 1, 1, 1, 1, 1,
0.0230297, -0.890959, 2.773428, 1, 1, 1, 1, 1,
0.02378119, 0.563498, 0.9660987, 1, 1, 1, 1, 1,
0.02455518, -0.7798997, 3.274256, 1, 1, 1, 1, 1,
0.03262048, 0.4876722, -0.797197, 1, 1, 1, 1, 1,
0.03705432, -1.727725, 3.698188, 1, 1, 1, 1, 1,
0.04494833, 0.01537664, -0.1311272, 1, 1, 1, 1, 1,
0.04658006, 0.7813859, -0.7491984, 1, 1, 1, 1, 1,
0.05245485, -0.6755126, 2.768914, 1, 1, 1, 1, 1,
0.05642828, 1.159348, -0.3952647, 1, 1, 1, 1, 1,
0.05667723, -0.7413983, 1.980204, 1, 1, 1, 1, 1,
0.06296992, -1.83714, 2.031972, 1, 1, 1, 1, 1,
0.06400142, 0.3655691, 2.323461, 1, 1, 1, 1, 1,
0.06574025, -0.1460618, 3.913966, 1, 1, 1, 1, 1,
0.07204241, -0.09978133, 2.068261, 1, 1, 1, 1, 1,
0.07250568, -0.5413059, 3.750909, 0, 0, 1, 1, 1,
0.07913928, -0.6918028, 4.222281, 1, 0, 0, 1, 1,
0.08435849, -0.1359136, -0.5683564, 1, 0, 0, 1, 1,
0.0849911, -1.930352, 2.754659, 1, 0, 0, 1, 1,
0.09292053, 0.523913, 0.2736942, 1, 0, 0, 1, 1,
0.09390137, 0.9976454, 0.84661, 1, 0, 0, 1, 1,
0.09570121, 0.5133292, 0.8437359, 0, 0, 0, 1, 1,
0.0963631, 0.06168716, 2.685806, 0, 0, 0, 1, 1,
0.09700739, -1.660553, 2.195912, 0, 0, 0, 1, 1,
0.09734752, 1.250605, 0.3367542, 0, 0, 0, 1, 1,
0.09797505, -0.7832393, 3.044131, 0, 0, 0, 1, 1,
0.09906582, -0.6242226, 2.216311, 0, 0, 0, 1, 1,
0.09920999, 0.8561835, 1.14762, 0, 0, 0, 1, 1,
0.1001179, 1.212664, 0.1525301, 1, 1, 1, 1, 1,
0.1078122, 0.9058471, 0.9844478, 1, 1, 1, 1, 1,
0.1092442, -0.5282564, 4.854468, 1, 1, 1, 1, 1,
0.1130239, -1.159263, 2.76767, 1, 1, 1, 1, 1,
0.1172446, 1.62495, 1.017898, 1, 1, 1, 1, 1,
0.1206063, 1.309268, -1.009513, 1, 1, 1, 1, 1,
0.1207067, -0.4611933, 1.579482, 1, 1, 1, 1, 1,
0.1219914, -0.2131428, 2.848278, 1, 1, 1, 1, 1,
0.1272207, -1.435837, 3.891077, 1, 1, 1, 1, 1,
0.1286605, -1.082053, 3.850945, 1, 1, 1, 1, 1,
0.1291124, -0.05391535, 1.513333, 1, 1, 1, 1, 1,
0.1303546, 1.599585, -0.112921, 1, 1, 1, 1, 1,
0.1318633, -1.435128, 2.135532, 1, 1, 1, 1, 1,
0.132124, 2.070539, 0.3997014, 1, 1, 1, 1, 1,
0.1367837, 2.282299, -1.270094, 1, 1, 1, 1, 1,
0.1394012, -0.9126992, 4.048267, 0, 0, 1, 1, 1,
0.1437957, -0.05017266, 2.053768, 1, 0, 0, 1, 1,
0.1441317, -0.5899431, 2.836675, 1, 0, 0, 1, 1,
0.1452907, -0.3019346, 3.670507, 1, 0, 0, 1, 1,
0.1469031, 0.1486429, 0.03779623, 1, 0, 0, 1, 1,
0.1481829, 1.270753, 1.345849, 1, 0, 0, 1, 1,
0.1483526, -0.0003417949, 1.812386, 0, 0, 0, 1, 1,
0.1488831, 0.9994965, -0.04895996, 0, 0, 0, 1, 1,
0.1634485, 1.0222, 1.248631, 0, 0, 0, 1, 1,
0.1683382, -0.6429443, 3.487355, 0, 0, 0, 1, 1,
0.1721596, -1.092238, 4.234993, 0, 0, 0, 1, 1,
0.1721825, 0.4369311, -0.09266709, 0, 0, 0, 1, 1,
0.1797206, 0.1809496, 1.387909, 0, 0, 0, 1, 1,
0.1823677, 0.09212615, 2.412836, 1, 1, 1, 1, 1,
0.1853143, -0.3823555, 3.218136, 1, 1, 1, 1, 1,
0.1863503, -0.1836726, 2.694092, 1, 1, 1, 1, 1,
0.1895146, 0.8296133, 1.675131, 1, 1, 1, 1, 1,
0.1896366, 0.4416514, 0.2145974, 1, 1, 1, 1, 1,
0.1911452, -0.1925674, 2.252896, 1, 1, 1, 1, 1,
0.1920072, 0.9676976, 1.68826, 1, 1, 1, 1, 1,
0.1952141, -0.6260495, 2.582952, 1, 1, 1, 1, 1,
0.1959056, 1.292857, 1.505014, 1, 1, 1, 1, 1,
0.1980439, -0.2921772, 4.304411, 1, 1, 1, 1, 1,
0.1995642, 0.8825379, -1.049191, 1, 1, 1, 1, 1,
0.200611, -0.2702605, 2.851423, 1, 1, 1, 1, 1,
0.2054561, -1.778126, 2.967556, 1, 1, 1, 1, 1,
0.2067942, 0.1369495, 1.751702, 1, 1, 1, 1, 1,
0.2144591, 1.090583, -1.02235, 1, 1, 1, 1, 1,
0.2152655, -0.3749865, 2.578599, 0, 0, 1, 1, 1,
0.2153026, -0.7446475, 3.150725, 1, 0, 0, 1, 1,
0.2193373, -0.08588152, 1.516873, 1, 0, 0, 1, 1,
0.2199117, -0.937148, 0.4400202, 1, 0, 0, 1, 1,
0.2287344, -0.1623863, 2.31589, 1, 0, 0, 1, 1,
0.2302844, 0.5047691, -1.283373, 1, 0, 0, 1, 1,
0.2327093, -0.5937515, 3.093506, 0, 0, 0, 1, 1,
0.2327147, 0.7304933, 1.797617, 0, 0, 0, 1, 1,
0.2327776, 0.5445837, -1.230118, 0, 0, 0, 1, 1,
0.2335751, -0.5562309, 2.643689, 0, 0, 0, 1, 1,
0.2376114, 1.07855, 0.07825718, 0, 0, 0, 1, 1,
0.2378615, 0.04613369, 0.6971136, 0, 0, 0, 1, 1,
0.2380612, -1.057574, 2.802876, 0, 0, 0, 1, 1,
0.23896, -0.222172, 2.397092, 1, 1, 1, 1, 1,
0.2407653, -1.617691, 3.126723, 1, 1, 1, 1, 1,
0.2477983, 0.1707331, 1.117571, 1, 1, 1, 1, 1,
0.2484477, 0.6312181, 0.7692567, 1, 1, 1, 1, 1,
0.2527138, 1.107504, -0.3208006, 1, 1, 1, 1, 1,
0.2564574, -0.3640906, 3.47443, 1, 1, 1, 1, 1,
0.2566149, -0.3053147, 2.057313, 1, 1, 1, 1, 1,
0.258866, 0.6882809, 2.20469, 1, 1, 1, 1, 1,
0.2624635, 0.2787876, 0.2933035, 1, 1, 1, 1, 1,
0.2634182, -1.373038, 3.133487, 1, 1, 1, 1, 1,
0.2747073, 0.5014542, 2.097138, 1, 1, 1, 1, 1,
0.2755846, -0.0877096, 1.263856, 1, 1, 1, 1, 1,
0.2785214, -2.212263, 2.440451, 1, 1, 1, 1, 1,
0.2880147, -0.9991012, 2.787138, 1, 1, 1, 1, 1,
0.289464, 0.6633152, 0.7366289, 1, 1, 1, 1, 1,
0.2920343, 1.034453, 1.07925, 0, 0, 1, 1, 1,
0.294572, 0.07056718, 1.573523, 1, 0, 0, 1, 1,
0.2964182, -1.656175, 2.296144, 1, 0, 0, 1, 1,
0.2964997, -0.420233, 3.152351, 1, 0, 0, 1, 1,
0.2967126, 1.147438, 0.1951288, 1, 0, 0, 1, 1,
0.3004811, 0.06638033, 1.943731, 1, 0, 0, 1, 1,
0.3042708, 1.071093, 0.3995729, 0, 0, 0, 1, 1,
0.304337, 1.718621, 1.003364, 0, 0, 0, 1, 1,
0.3055607, 0.660801, 1.185821, 0, 0, 0, 1, 1,
0.3066511, -0.1648293, 2.349821, 0, 0, 0, 1, 1,
0.3117031, 0.037506, 1.472894, 0, 0, 0, 1, 1,
0.3145095, -0.7750497, 4.132792, 0, 0, 0, 1, 1,
0.3165832, 0.9602228, 0.9819313, 0, 0, 0, 1, 1,
0.3189459, 1.522521, -0.5907962, 1, 1, 1, 1, 1,
0.3217955, 1.0288, 0.7479272, 1, 1, 1, 1, 1,
0.3219727, 0.04027864, 1.657804, 1, 1, 1, 1, 1,
0.3245118, 0.5161851, -0.9652638, 1, 1, 1, 1, 1,
0.325076, 0.04540653, 1.670576, 1, 1, 1, 1, 1,
0.3251239, -1.617043, 2.164332, 1, 1, 1, 1, 1,
0.3275891, -0.2085937, 3.068955, 1, 1, 1, 1, 1,
0.3305633, -0.1126256, 2.940338, 1, 1, 1, 1, 1,
0.3335307, -0.7691836, 1.804217, 1, 1, 1, 1, 1,
0.3356056, 0.1858212, 0.3473948, 1, 1, 1, 1, 1,
0.3358245, 1.42239, -0.9766906, 1, 1, 1, 1, 1,
0.3411398, 0.4231548, -0.3416677, 1, 1, 1, 1, 1,
0.3421625, 1.099426, 1.455241, 1, 1, 1, 1, 1,
0.3424609, -0.7547236, 2.611192, 1, 1, 1, 1, 1,
0.3429938, 1.398067, 2.25122, 1, 1, 1, 1, 1,
0.344377, -0.482035, 3.13026, 0, 0, 1, 1, 1,
0.3462237, -0.7411156, 3.06178, 1, 0, 0, 1, 1,
0.347621, -1.247222, 2.081402, 1, 0, 0, 1, 1,
0.3511091, 0.7948635, -0.1748006, 1, 0, 0, 1, 1,
0.3529216, 1.098088, 1.876615, 1, 0, 0, 1, 1,
0.3535016, -0.7537374, 3.74363, 1, 0, 0, 1, 1,
0.355464, -0.3081959, 3.50387, 0, 0, 0, 1, 1,
0.3579741, 1.028639, 1.984992, 0, 0, 0, 1, 1,
0.3634865, 0.5400964, 0.4096137, 0, 0, 0, 1, 1,
0.3663919, 1.61042, 0.130272, 0, 0, 0, 1, 1,
0.3668984, 0.7742249, 1.155047, 0, 0, 0, 1, 1,
0.3693815, -0.4631454, 1.868862, 0, 0, 0, 1, 1,
0.3721526, 0.3821496, -1.9605, 0, 0, 0, 1, 1,
0.3777617, -1.018883, 1.267012, 1, 1, 1, 1, 1,
0.3794342, 0.6795127, 0.6878477, 1, 1, 1, 1, 1,
0.3830751, -0.6107935, 2.3071, 1, 1, 1, 1, 1,
0.3867491, 2.126955, 0.5219929, 1, 1, 1, 1, 1,
0.3872887, 2.070059, 1.028648, 1, 1, 1, 1, 1,
0.3887354, -1.385725, 3.62967, 1, 1, 1, 1, 1,
0.3917938, -0.5365394, 2.049832, 1, 1, 1, 1, 1,
0.3935944, -1.030124, 2.657264, 1, 1, 1, 1, 1,
0.3963513, 0.6710283, 1.659715, 1, 1, 1, 1, 1,
0.3993246, -0.5096202, 3.619408, 1, 1, 1, 1, 1,
0.4019381, 0.1841601, 1.5053, 1, 1, 1, 1, 1,
0.4041716, -1.811513, 3.445982, 1, 1, 1, 1, 1,
0.4042667, 0.5875233, 1.684667, 1, 1, 1, 1, 1,
0.406525, -1.268223, 2.83623, 1, 1, 1, 1, 1,
0.411816, 0.9493315, -0.1394847, 1, 1, 1, 1, 1,
0.4153644, -0.103591, 0.06602073, 0, 0, 1, 1, 1,
0.423883, -1.502153, 3.612097, 1, 0, 0, 1, 1,
0.4244411, 0.1108782, 0.9926848, 1, 0, 0, 1, 1,
0.4258079, -0.1008324, 0.4775887, 1, 0, 0, 1, 1,
0.4280172, 1.902822, -0.08170141, 1, 0, 0, 1, 1,
0.4302313, 1.273776, -0.3496214, 1, 0, 0, 1, 1,
0.4317106, 0.008666145, 1.244064, 0, 0, 0, 1, 1,
0.4324906, 0.7662922, 1.839964, 0, 0, 0, 1, 1,
0.4359067, 0.06724266, 1.106112, 0, 0, 0, 1, 1,
0.4364254, 0.9016448, 1.345214, 0, 0, 0, 1, 1,
0.4418091, 0.005122474, 0.1620272, 0, 0, 0, 1, 1,
0.4456706, -0.4900049, 3.932541, 0, 0, 0, 1, 1,
0.4502191, 0.8274536, 1.582929, 0, 0, 0, 1, 1,
0.4504089, -1.640181, 3.430602, 1, 1, 1, 1, 1,
0.4522291, 0.7477571, 0.9807582, 1, 1, 1, 1, 1,
0.4545071, 0.01775127, 3.171526, 1, 1, 1, 1, 1,
0.4580563, -0.1079367, -0.9781643, 1, 1, 1, 1, 1,
0.4606344, -0.4635085, 2.036022, 1, 1, 1, 1, 1,
0.4618032, 0.8625242, -0.4420165, 1, 1, 1, 1, 1,
0.4693202, -1.1853, 3.773934, 1, 1, 1, 1, 1,
0.4709498, -0.5293726, 1.4156, 1, 1, 1, 1, 1,
0.4738028, 0.8447619, -0.05631489, 1, 1, 1, 1, 1,
0.4757473, 1.073738, 0.4794745, 1, 1, 1, 1, 1,
0.4771788, 0.4986395, -1.797558, 1, 1, 1, 1, 1,
0.4800555, 0.9281717, 1.341861, 1, 1, 1, 1, 1,
0.4859371, 1.021558, 0.6364051, 1, 1, 1, 1, 1,
0.4873039, -1.424403, 1.646868, 1, 1, 1, 1, 1,
0.4913722, 1.462235, -1.216337, 1, 1, 1, 1, 1,
0.4925203, 0.2724448, 0.329499, 0, 0, 1, 1, 1,
0.4927694, 0.666643, 1.29727, 1, 0, 0, 1, 1,
0.5006531, -0.3178953, 1.578525, 1, 0, 0, 1, 1,
0.5016445, 0.1390614, 2.50221, 1, 0, 0, 1, 1,
0.5052214, -0.02221824, 1.024718, 1, 0, 0, 1, 1,
0.5069177, 0.2279062, 0.1127554, 1, 0, 0, 1, 1,
0.5071182, -0.09266191, 1.684195, 0, 0, 0, 1, 1,
0.5093324, -0.9053999, 3.240283, 0, 0, 0, 1, 1,
0.5162441, -0.1527938, 2.387473, 0, 0, 0, 1, 1,
0.5218606, 0.8271432, -0.8396997, 0, 0, 0, 1, 1,
0.5282179, -1.431454, 3.052042, 0, 0, 0, 1, 1,
0.5285283, -0.6873876, 2.569221, 0, 0, 0, 1, 1,
0.5343995, -1.390184, 1.470023, 0, 0, 0, 1, 1,
0.5349691, 0.9969624, 0.5403253, 1, 1, 1, 1, 1,
0.5381515, 0.06677598, 5.22189, 1, 1, 1, 1, 1,
0.5409162, 0.28422, -0.3045574, 1, 1, 1, 1, 1,
0.542757, 0.13381, 1.507611, 1, 1, 1, 1, 1,
0.5441067, 0.4800379, -1.240902, 1, 1, 1, 1, 1,
0.5570046, -0.1946183, 3.53333, 1, 1, 1, 1, 1,
0.5623938, 0.1272857, 1.373045, 1, 1, 1, 1, 1,
0.5683743, 3.349852, -0.7245431, 1, 1, 1, 1, 1,
0.5702662, 0.9732789, 0.8910958, 1, 1, 1, 1, 1,
0.5712491, -1.006444, 3.818598, 1, 1, 1, 1, 1,
0.5737286, 0.2005751, 0.2727367, 1, 1, 1, 1, 1,
0.5782288, -0.8728471, 3.942943, 1, 1, 1, 1, 1,
0.5804465, 0.5224648, -0.4667849, 1, 1, 1, 1, 1,
0.5816561, -2.179347, 2.332525, 1, 1, 1, 1, 1,
0.5829471, -1.492015, 1.775267, 1, 1, 1, 1, 1,
0.5855899, 0.7100028, 1.446876, 0, 0, 1, 1, 1,
0.5866133, -1.398945, 1.322459, 1, 0, 0, 1, 1,
0.5956205, 1.049043, 0.6304007, 1, 0, 0, 1, 1,
0.6033518, 0.7061237, 1.266423, 1, 0, 0, 1, 1,
0.6035805, 0.8160698, -0.03309038, 1, 0, 0, 1, 1,
0.6081865, -0.8783388, 2.472619, 1, 0, 0, 1, 1,
0.6105599, -1.363345, 2.29935, 0, 0, 0, 1, 1,
0.6156114, -0.6574346, 1.646051, 0, 0, 0, 1, 1,
0.6189663, -0.1205148, 1.188172, 0, 0, 0, 1, 1,
0.6195349, -1.630428, 1.590041, 0, 0, 0, 1, 1,
0.6250504, -0.9888754, 3.126369, 0, 0, 0, 1, 1,
0.6349655, -0.9354377, 2.528357, 0, 0, 0, 1, 1,
0.6367863, 2.240402, -1.489526, 0, 0, 0, 1, 1,
0.6474143, 0.3937201, 1.081379, 1, 1, 1, 1, 1,
0.651119, 0.5829453, 0.1231503, 1, 1, 1, 1, 1,
0.6569304, 0.2875223, 0.4267592, 1, 1, 1, 1, 1,
0.6625838, 1.222933, 1.879986, 1, 1, 1, 1, 1,
0.6626147, 2.449917, 0.7705867, 1, 1, 1, 1, 1,
0.6633273, 0.2926179, 1.088277, 1, 1, 1, 1, 1,
0.6654801, -1.099717, 3.010834, 1, 1, 1, 1, 1,
0.6698451, -0.2601285, 3.472203, 1, 1, 1, 1, 1,
0.6774985, 0.8050852, 1.202289, 1, 1, 1, 1, 1,
0.6803184, -0.2551782, 2.241488, 1, 1, 1, 1, 1,
0.6970784, 0.5325938, 0.07743164, 1, 1, 1, 1, 1,
0.7051165, 1.054496, 0.08591878, 1, 1, 1, 1, 1,
0.7063558, 0.1172786, 1.626728, 1, 1, 1, 1, 1,
0.7072455, 1.20041, -0.3697539, 1, 1, 1, 1, 1,
0.7110701, -1.789487, 2.560034, 1, 1, 1, 1, 1,
0.7137074, 0.7238762, -0.2826947, 0, 0, 1, 1, 1,
0.7162359, -1.124561, 3.976737, 1, 0, 0, 1, 1,
0.7164399, -0.6629134, 1.892522, 1, 0, 0, 1, 1,
0.7170021, -1.20636, 1.451331, 1, 0, 0, 1, 1,
0.7174609, -0.3812517, 1.493632, 1, 0, 0, 1, 1,
0.718362, 0.9493791, 0.9137402, 1, 0, 0, 1, 1,
0.7185014, 0.2269343, 0.5358612, 0, 0, 0, 1, 1,
0.7191052, -0.4319059, 2.874612, 0, 0, 0, 1, 1,
0.7193001, -1.768795, 2.250885, 0, 0, 0, 1, 1,
0.7259852, -0.4130108, 1.043174, 0, 0, 0, 1, 1,
0.7285998, 0.8462148, 0.793831, 0, 0, 0, 1, 1,
0.731609, -2.470392, 1.845595, 0, 0, 0, 1, 1,
0.7327868, -0.854691, 3.445376, 0, 0, 0, 1, 1,
0.7334576, 0.957917, 0.6854467, 1, 1, 1, 1, 1,
0.7335318, -1.601894, 3.332735, 1, 1, 1, 1, 1,
0.7436171, -0.968008, 1.617592, 1, 1, 1, 1, 1,
0.7450482, 1.189461, -0.09315655, 1, 1, 1, 1, 1,
0.7474607, -1.515182, 2.124207, 1, 1, 1, 1, 1,
0.7564625, 1.078749, -1.340368, 1, 1, 1, 1, 1,
0.7592968, 0.1493584, 2.297013, 1, 1, 1, 1, 1,
0.7599512, -0.1960128, 1.5162, 1, 1, 1, 1, 1,
0.7675133, -0.03392921, 0.09020679, 1, 1, 1, 1, 1,
0.7696463, 0.6769932, 1.005475, 1, 1, 1, 1, 1,
0.7725567, 0.6255251, -0.61926, 1, 1, 1, 1, 1,
0.775237, -0.4093281, 1.999277, 1, 1, 1, 1, 1,
0.7905587, 1.884948, 0.9591118, 1, 1, 1, 1, 1,
0.7917686, 0.5511214, 1.231487, 1, 1, 1, 1, 1,
0.7945477, -0.3199902, 2.436272, 1, 1, 1, 1, 1,
0.8015292, -1.697969, 2.527961, 0, 0, 1, 1, 1,
0.8088049, 0.3493304, 1.370888, 1, 0, 0, 1, 1,
0.8100793, 0.7293358, 0.1219163, 1, 0, 0, 1, 1,
0.8134232, -1.524042, 4.034144, 1, 0, 0, 1, 1,
0.8162188, 0.6651241, 1.951577, 1, 0, 0, 1, 1,
0.8244141, -0.9285399, 2.324064, 1, 0, 0, 1, 1,
0.8247775, 1.34377, 0.7269033, 0, 0, 0, 1, 1,
0.8253678, -0.5527485, 2.193856, 0, 0, 0, 1, 1,
0.8265635, 1.054821, -0.5069566, 0, 0, 0, 1, 1,
0.8270622, -1.17039, 0.02759079, 0, 0, 0, 1, 1,
0.8287821, -0.03504047, 1.17969, 0, 0, 0, 1, 1,
0.8328837, 0.9745609, 1.479844, 0, 0, 0, 1, 1,
0.8427294, -0.6241002, 2.09719, 0, 0, 0, 1, 1,
0.842934, -0.3263168, 0.4630589, 1, 1, 1, 1, 1,
0.8484769, 0.5783358, 0.5138899, 1, 1, 1, 1, 1,
0.858801, 0.9181724, -0.398949, 1, 1, 1, 1, 1,
0.8594361, 0.3096631, 1.20218, 1, 1, 1, 1, 1,
0.8610588, 2.914888, -0.3261222, 1, 1, 1, 1, 1,
0.864577, 0.6039669, 0.2350167, 1, 1, 1, 1, 1,
0.8662916, 0.3013958, 0.8086045, 1, 1, 1, 1, 1,
0.8667463, -1.28528, 2.599986, 1, 1, 1, 1, 1,
0.8748385, -0.2960738, 1.013671, 1, 1, 1, 1, 1,
0.8772812, 0.7126018, 2.005606, 1, 1, 1, 1, 1,
0.8776367, -0.514502, 0.318609, 1, 1, 1, 1, 1,
0.8788978, -1.447639, 0.9704709, 1, 1, 1, 1, 1,
0.8892207, 0.8744087, 1.965115, 1, 1, 1, 1, 1,
0.8894647, 0.332753, 1.186719, 1, 1, 1, 1, 1,
0.9003099, 0.8814401, 1.454571, 1, 1, 1, 1, 1,
0.9145845, -2.100043, 2.795607, 0, 0, 1, 1, 1,
0.9148309, 1.065536, 1.030682, 1, 0, 0, 1, 1,
0.9197052, 0.3454702, 0.6339523, 1, 0, 0, 1, 1,
0.9221315, 0.06659072, 1.627805, 1, 0, 0, 1, 1,
0.9287903, 0.2097768, 0.341011, 1, 0, 0, 1, 1,
0.9344429, 0.5569969, 0.8125342, 1, 0, 0, 1, 1,
0.9399517, -0.120938, 0.908121, 0, 0, 0, 1, 1,
0.9408756, 0.4445021, 1.16051, 0, 0, 0, 1, 1,
0.9423509, -1.373722, 1.637832, 0, 0, 0, 1, 1,
0.9448685, 0.4342805, 0.9143693, 0, 0, 0, 1, 1,
0.9506648, 0.4584832, 1.777008, 0, 0, 0, 1, 1,
0.9540794, -1.186767, 2.793282, 0, 0, 0, 1, 1,
0.9560002, -0.8800703, 3.11717, 0, 0, 0, 1, 1,
0.9587473, 2.13004, 0.4059573, 1, 1, 1, 1, 1,
0.9592957, -0.1175034, 2.314161, 1, 1, 1, 1, 1,
0.9602694, 0.04469706, -0.142961, 1, 1, 1, 1, 1,
0.9669926, -1.133695, 3.108145, 1, 1, 1, 1, 1,
0.9915966, 0.9450989, -0.6377168, 1, 1, 1, 1, 1,
0.9986349, 0.1634678, 1.351084, 1, 1, 1, 1, 1,
0.9986677, 1.688378, -0.4396472, 1, 1, 1, 1, 1,
1.007321, -0.07180619, 2.049641, 1, 1, 1, 1, 1,
1.008344, -1.045052, 0.8589066, 1, 1, 1, 1, 1,
1.012311, -0.9682974, 2.494238, 1, 1, 1, 1, 1,
1.016405, -0.3988354, 0.9961426, 1, 1, 1, 1, 1,
1.017817, 0.7183111, 0.9675981, 1, 1, 1, 1, 1,
1.019791, 0.08069617, 1.115749, 1, 1, 1, 1, 1,
1.020255, -0.6519275, 1.093563, 1, 1, 1, 1, 1,
1.022895, -1.109882, 3.354315, 1, 1, 1, 1, 1,
1.023031, 0.3516105, 1.151584, 0, 0, 1, 1, 1,
1.023603, -0.5234392, 2.467614, 1, 0, 0, 1, 1,
1.024437, -1.595798, 1.688469, 1, 0, 0, 1, 1,
1.027041, -0.572742, 2.322742, 1, 0, 0, 1, 1,
1.03094, -0.5492877, 1.680205, 1, 0, 0, 1, 1,
1.031135, 0.910839, 1.397254, 1, 0, 0, 1, 1,
1.033943, -1.593366, 3.772577, 0, 0, 0, 1, 1,
1.0426, -0.3191029, 0.1130824, 0, 0, 0, 1, 1,
1.048883, 1.675756, 0.04800662, 0, 0, 0, 1, 1,
1.050667, 0.2281066, 0.9989098, 0, 0, 0, 1, 1,
1.051636, 2.763674, 0.4863987, 0, 0, 0, 1, 1,
1.053366, -1.031434, 1.827529, 0, 0, 0, 1, 1,
1.053671, -0.2806732, -0.726567, 0, 0, 0, 1, 1,
1.053888, -0.194084, 1.319254, 1, 1, 1, 1, 1,
1.0577, -2.022314, 2.790788, 1, 1, 1, 1, 1,
1.061702, -0.5023995, 1.90779, 1, 1, 1, 1, 1,
1.064258, -0.9018141, 1.983241, 1, 1, 1, 1, 1,
1.06537, 2.258004, -0.2815652, 1, 1, 1, 1, 1,
1.067703, -0.8640369, 2.281724, 1, 1, 1, 1, 1,
1.070716, -0.05418994, 3.362694, 1, 1, 1, 1, 1,
1.078677, -0.1630457, 3.159664, 1, 1, 1, 1, 1,
1.09028, -0.2557879, 0.6975726, 1, 1, 1, 1, 1,
1.090372, -0.2522432, 2.327399, 1, 1, 1, 1, 1,
1.095151, 1.094099, 0.4264125, 1, 1, 1, 1, 1,
1.097549, 0.8405939, 1.580026, 1, 1, 1, 1, 1,
1.099401, 2.344018, -0.05260219, 1, 1, 1, 1, 1,
1.103326, -0.7287991, 1.282987, 1, 1, 1, 1, 1,
1.103568, -0.1703756, 3.196538, 1, 1, 1, 1, 1,
1.107188, -0.1200693, 1.542236, 0, 0, 1, 1, 1,
1.119311, -1.381547, 3.134907, 1, 0, 0, 1, 1,
1.126499, -1.039552, 4.115648, 1, 0, 0, 1, 1,
1.12971, -1.102411, 2.549422, 1, 0, 0, 1, 1,
1.133578, 3.406109, 0.1544932, 1, 0, 0, 1, 1,
1.134318, -1.513611, 3.029375, 1, 0, 0, 1, 1,
1.137702, 0.1200541, -0.7856385, 0, 0, 0, 1, 1,
1.139773, -0.5977066, 2.946925, 0, 0, 0, 1, 1,
1.139889, 1.177933, -0.02188929, 0, 0, 0, 1, 1,
1.141618, 0.2505665, 2.457351, 0, 0, 0, 1, 1,
1.169055, -0.214157, 1.953633, 0, 0, 0, 1, 1,
1.171358, -0.1389179, 2.429232, 0, 0, 0, 1, 1,
1.184768, 2.040417, 0.1850177, 0, 0, 0, 1, 1,
1.186148, -0.3971292, 1.987173, 1, 1, 1, 1, 1,
1.192109, -0.0004092584, 1.76297, 1, 1, 1, 1, 1,
1.209893, -1.734524, 3.317317, 1, 1, 1, 1, 1,
1.246496, -1.229665, 2.483605, 1, 1, 1, 1, 1,
1.247272, 1.05512, 1.777086, 1, 1, 1, 1, 1,
1.251772, -0.3865361, 1.64158, 1, 1, 1, 1, 1,
1.25444, -1.243681, 3.338935, 1, 1, 1, 1, 1,
1.254802, 1.189672, 2.201155, 1, 1, 1, 1, 1,
1.255325, -0.01520318, 2.143204, 1, 1, 1, 1, 1,
1.255477, -0.0602521, 1.550001, 1, 1, 1, 1, 1,
1.267657, -1.03603, 2.568218, 1, 1, 1, 1, 1,
1.274153, 0.2266804, 0.6478087, 1, 1, 1, 1, 1,
1.279365, 0.5849255, 1.135085, 1, 1, 1, 1, 1,
1.280522, 0.1069853, 0.8451496, 1, 1, 1, 1, 1,
1.286093, 1.551395, 1.435048, 1, 1, 1, 1, 1,
1.287939, 0.5472854, 1.629059, 0, 0, 1, 1, 1,
1.289793, -0.7864282, 1.960817, 1, 0, 0, 1, 1,
1.290208, 1.107553, 0.6206161, 1, 0, 0, 1, 1,
1.294808, 1.119761, 0.9195165, 1, 0, 0, 1, 1,
1.301117, 1.07129, 0.04535537, 1, 0, 0, 1, 1,
1.307699, -0.04368321, 1.050766, 1, 0, 0, 1, 1,
1.310778, -1.437037, 2.67215, 0, 0, 0, 1, 1,
1.319708, -0.006221887, 0.9406776, 0, 0, 0, 1, 1,
1.323856, 0.3999022, 2.030165, 0, 0, 0, 1, 1,
1.332089, 0.4853874, 2.269932, 0, 0, 0, 1, 1,
1.351356, -2.542713, 2.227372, 0, 0, 0, 1, 1,
1.357847, 0.7254458, 1.99862, 0, 0, 0, 1, 1,
1.359075, -0.1805675, 2.732083, 0, 0, 0, 1, 1,
1.36323, 0.7502233, -0.8890018, 1, 1, 1, 1, 1,
1.371425, 0.08409342, 0.7526624, 1, 1, 1, 1, 1,
1.375532, 0.5504788, 2.956254, 1, 1, 1, 1, 1,
1.376386, 0.6017315, 0.8240565, 1, 1, 1, 1, 1,
1.379946, -1.434615, 2.208815, 1, 1, 1, 1, 1,
1.390281, -0.002797265, 1.373108, 1, 1, 1, 1, 1,
1.395523, 0.2711779, 1.107724, 1, 1, 1, 1, 1,
1.403931, 0.3137369, 1.737934, 1, 1, 1, 1, 1,
1.427984, 0.2637286, 0.8130186, 1, 1, 1, 1, 1,
1.430856, 1.292692, 1.689669, 1, 1, 1, 1, 1,
1.438539, 0.1754786, 4.354676, 1, 1, 1, 1, 1,
1.451523, 0.06121618, 1.360726, 1, 1, 1, 1, 1,
1.462135, 0.2242763, 1.976602, 1, 1, 1, 1, 1,
1.471295, 3.047549, 1.542816, 1, 1, 1, 1, 1,
1.471548, -0.6333788, 1.249325, 1, 1, 1, 1, 1,
1.474054, -1.812706, 0.6780069, 0, 0, 1, 1, 1,
1.479007, 2.356619, -0.02068171, 1, 0, 0, 1, 1,
1.480637, -1.731285, 3.827423, 1, 0, 0, 1, 1,
1.486272, 0.8552034, 0.4414795, 1, 0, 0, 1, 1,
1.48899, 0.4442259, 0.9601442, 1, 0, 0, 1, 1,
1.499776, -0.01068567, 2.808423, 1, 0, 0, 1, 1,
1.503254, -0.2437983, 2.399672, 0, 0, 0, 1, 1,
1.512701, 1.643385, -0.2759432, 0, 0, 0, 1, 1,
1.514143, 0.752005, 0.4783639, 0, 0, 0, 1, 1,
1.522253, -0.3327327, 2.267839, 0, 0, 0, 1, 1,
1.525529, 0.1825419, 1.662074, 0, 0, 0, 1, 1,
1.527905, 0.4966105, 1.037254, 0, 0, 0, 1, 1,
1.534238, 1.695701, -1.089893, 0, 0, 0, 1, 1,
1.549697, -0.7838576, 3.175103, 1, 1, 1, 1, 1,
1.551066, -1.354942, 2.034407, 1, 1, 1, 1, 1,
1.560461, -1.158591, 1.071375, 1, 1, 1, 1, 1,
1.568217, 0.5566381, 0.3786877, 1, 1, 1, 1, 1,
1.570685, -0.1941728, 1.275324, 1, 1, 1, 1, 1,
1.572444, 0.1944109, 0.7159916, 1, 1, 1, 1, 1,
1.585114, 0.9924597, 1.127198, 1, 1, 1, 1, 1,
1.602114, -0.694296, 1.414915, 1, 1, 1, 1, 1,
1.611856, -0.7763171, 1.241765, 1, 1, 1, 1, 1,
1.612745, -0.5906965, 1.546436, 1, 1, 1, 1, 1,
1.623405, 0.6465367, -0.7011839, 1, 1, 1, 1, 1,
1.636075, -0.8156019, -0.5167831, 1, 1, 1, 1, 1,
1.639107, -1.028243, 3.59449, 1, 1, 1, 1, 1,
1.66562, -0.7382295, 0.0237565, 1, 1, 1, 1, 1,
1.681763, 1.916151, 1.159111, 1, 1, 1, 1, 1,
1.682218, -0.9107676, 3.705963, 0, 0, 1, 1, 1,
1.703446, -1.547701, 1.41426, 1, 0, 0, 1, 1,
1.714428, 0.5583915, 1.047639, 1, 0, 0, 1, 1,
1.727338, 1.546667, -1.166393, 1, 0, 0, 1, 1,
1.751727, 0.9019669, 2.967045, 1, 0, 0, 1, 1,
1.770921, 0.2986404, 3.999791, 1, 0, 0, 1, 1,
1.801229, 1.273515, 0.0400633, 0, 0, 0, 1, 1,
1.809354, -2.113557, 0.557976, 0, 0, 0, 1, 1,
1.8148, 0.2929763, 1.146248, 0, 0, 0, 1, 1,
1.827594, 0.4865673, 1.989062, 0, 0, 0, 1, 1,
1.833961, 0.2825428, 1.652707, 0, 0, 0, 1, 1,
1.835269, 0.2862082, 1.914775, 0, 0, 0, 1, 1,
1.843152, -0.6030388, -0.6542833, 0, 0, 0, 1, 1,
1.848313, 1.973329, 1.233721, 1, 1, 1, 1, 1,
1.863193, 0.2997616, 0.875065, 1, 1, 1, 1, 1,
1.868033, -0.6554199, 2.754813, 1, 1, 1, 1, 1,
1.874969, 0.7817503, 0.001735425, 1, 1, 1, 1, 1,
1.885679, -0.3988405, 1.024235, 1, 1, 1, 1, 1,
1.899382, 0.008911912, 1.560745, 1, 1, 1, 1, 1,
1.899828, 2.799414, 2.28756, 1, 1, 1, 1, 1,
1.923581, -0.1766979, -0.2080597, 1, 1, 1, 1, 1,
1.935243, -0.1353463, 3.874017, 1, 1, 1, 1, 1,
1.958244, -0.1037102, 1.850821, 1, 1, 1, 1, 1,
1.971459, -0.6787854, 2.804158, 1, 1, 1, 1, 1,
1.987891, -0.6915895, -0.6184717, 1, 1, 1, 1, 1,
2.003472, -0.5255712, 1.458528, 1, 1, 1, 1, 1,
2.007566, -0.4799854, 3.244138, 1, 1, 1, 1, 1,
2.027447, -0.7272043, 1.600796, 1, 1, 1, 1, 1,
2.035259, -1.543627, 3.228887, 0, 0, 1, 1, 1,
2.061174, 1.411471, 2.271207, 1, 0, 0, 1, 1,
2.076403, 1.099559, 0.4112159, 1, 0, 0, 1, 1,
2.098743, 2.623971, 2.234067, 1, 0, 0, 1, 1,
2.102769, -0.1174576, 0.4342609, 1, 0, 0, 1, 1,
2.115205, -1.53195, 2.896263, 1, 0, 0, 1, 1,
2.120186, -0.5727721, 3.972822, 0, 0, 0, 1, 1,
2.184948, 0.9913924, 1.896084, 0, 0, 0, 1, 1,
2.198015, -0.9466542, 2.232919, 0, 0, 0, 1, 1,
2.225725, -0.6318563, 1.050654, 0, 0, 0, 1, 1,
2.251256, -0.4073897, 1.518107, 0, 0, 0, 1, 1,
2.267381, -0.3054239, 2.109774, 0, 0, 0, 1, 1,
2.281189, -0.713757, 2.118593, 0, 0, 0, 1, 1,
2.337831, 1.582347, -0.01598237, 1, 1, 1, 1, 1,
2.437277, 1.869347, 0.9429666, 1, 1, 1, 1, 1,
2.572508, 0.5352189, 1.278071, 1, 1, 1, 1, 1,
2.594094, -0.9242374, 2.375377, 1, 1, 1, 1, 1,
2.616656, 0.06649823, 3.029152, 1, 1, 1, 1, 1,
2.63605, 0.3299891, 1.523586, 1, 1, 1, 1, 1,
2.677888, 0.0283359, 1.893211, 1, 1, 1, 1, 1
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
var radius = 9.433232;
var distance = 33.13383;
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
mvMatrix.translate( 0.3138906, -0.2819803, 0.1498678 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.13383);
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
