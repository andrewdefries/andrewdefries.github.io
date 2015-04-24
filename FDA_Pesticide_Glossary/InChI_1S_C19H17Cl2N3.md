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
-3.400045, 1.854832, 1.300367, 1, 0, 0, 1,
-3.335493, -0.08342076, -1.481966, 1, 0.007843138, 0, 1,
-2.909365, 0.01846363, 0.4459267, 1, 0.01176471, 0, 1,
-2.656162, -0.3974006, -2.773477, 1, 0.01960784, 0, 1,
-2.468362, 0.7905514, -0.9144688, 1, 0.02352941, 0, 1,
-2.384462, -1.39193, -2.771775, 1, 0.03137255, 0, 1,
-2.363002, -0.8898858, -0.9953598, 1, 0.03529412, 0, 1,
-2.309173, -0.7730302, -3.611068, 1, 0.04313726, 0, 1,
-2.266645, -0.09841388, -0.2270211, 1, 0.04705882, 0, 1,
-2.208675, 0.7968854, -0.04048355, 1, 0.05490196, 0, 1,
-2.18465, 1.783382, -1.284536, 1, 0.05882353, 0, 1,
-2.180339, 0.4196938, -2.403337, 1, 0.06666667, 0, 1,
-2.167394, 0.008868526, -2.440517, 1, 0.07058824, 0, 1,
-2.163512, 1.194383, -1.953352, 1, 0.07843138, 0, 1,
-2.153186, 0.5189301, -2.464562, 1, 0.08235294, 0, 1,
-2.152303, -0.06454475, -1.837439, 1, 0.09019608, 0, 1,
-2.146307, -0.5898059, -2.059047, 1, 0.09411765, 0, 1,
-2.140472, 1.9325, -0.4029399, 1, 0.1019608, 0, 1,
-2.116845, 0.01956691, 0.5965306, 1, 0.1098039, 0, 1,
-2.113711, -0.08043584, -2.174153, 1, 0.1137255, 0, 1,
-2.111448, -1.44036, -2.41307, 1, 0.1215686, 0, 1,
-2.040691, -0.7963083, -0.6770747, 1, 0.1254902, 0, 1,
-2.028728, -1.979043, -0.5488126, 1, 0.1333333, 0, 1,
-1.98622, 2.018652, -0.1699639, 1, 0.1372549, 0, 1,
-1.978339, -0.4389054, -1.035534, 1, 0.145098, 0, 1,
-1.954089, -1.194284, -2.397217, 1, 0.1490196, 0, 1,
-1.952899, 1.404958, -0.9139698, 1, 0.1568628, 0, 1,
-1.944147, -0.4216484, -2.634831, 1, 0.1607843, 0, 1,
-1.928673, -0.01521534, -0.2134162, 1, 0.1686275, 0, 1,
-1.906521, 0.9498197, -1.798697, 1, 0.172549, 0, 1,
-1.905676, 1.156573, -1.370359, 1, 0.1803922, 0, 1,
-1.873772, -0.03071395, -3.641143, 1, 0.1843137, 0, 1,
-1.865431, -0.6632274, -2.946188, 1, 0.1921569, 0, 1,
-1.860117, 0.7547513, -2.138062, 1, 0.1960784, 0, 1,
-1.838905, 1.186428, -1.569362, 1, 0.2039216, 0, 1,
-1.834163, 0.387667, -2.794614, 1, 0.2117647, 0, 1,
-1.817223, 0.6521217, -0.8527407, 1, 0.2156863, 0, 1,
-1.789777, 0.2239722, -0.1919253, 1, 0.2235294, 0, 1,
-1.784777, -0.1174977, -3.828253, 1, 0.227451, 0, 1,
-1.784309, 1.163972, -2.074163, 1, 0.2352941, 0, 1,
-1.757175, 0.1428517, -3.305551, 1, 0.2392157, 0, 1,
-1.75365, 0.2610835, 0.8356053, 1, 0.2470588, 0, 1,
-1.744191, -0.2640983, -2.09672, 1, 0.2509804, 0, 1,
-1.737116, -1.068639, -1.047272, 1, 0.2588235, 0, 1,
-1.723301, 0.3838786, -3.327127, 1, 0.2627451, 0, 1,
-1.717254, -0.270312, 0.3847439, 1, 0.2705882, 0, 1,
-1.71515, 0.1428488, -2.013835, 1, 0.2745098, 0, 1,
-1.714465, 0.5204531, -2.326706, 1, 0.282353, 0, 1,
-1.707252, 0.8269544, -0.1898724, 1, 0.2862745, 0, 1,
-1.70548, 0.436819, -3.629264, 1, 0.2941177, 0, 1,
-1.704746, 0.5745238, -0.9064847, 1, 0.3019608, 0, 1,
-1.70195, 0.4004133, -1.836235, 1, 0.3058824, 0, 1,
-1.675113, -0.6291497, -3.050026, 1, 0.3137255, 0, 1,
-1.671712, -0.40597, -0.9198223, 1, 0.3176471, 0, 1,
-1.668979, 0.1675248, -1.195143, 1, 0.3254902, 0, 1,
-1.660013, 0.6191924, -1.869289, 1, 0.3294118, 0, 1,
-1.651373, 0.2950863, 0.8910786, 1, 0.3372549, 0, 1,
-1.650046, -0.1870629, -0.2229827, 1, 0.3411765, 0, 1,
-1.614259, 0.3292007, -1.632274, 1, 0.3490196, 0, 1,
-1.596565, 1.014992, -1.589768, 1, 0.3529412, 0, 1,
-1.594742, 1.137054, -1.711212, 1, 0.3607843, 0, 1,
-1.584718, -1.132824, -3.088242, 1, 0.3647059, 0, 1,
-1.576984, 0.5507372, 0.1039162, 1, 0.372549, 0, 1,
-1.569068, 1.89364, -1.299872, 1, 0.3764706, 0, 1,
-1.561921, 0.251984, -0.870078, 1, 0.3843137, 0, 1,
-1.561131, -1.486583, -0.97175, 1, 0.3882353, 0, 1,
-1.561036, -0.2367308, -1.35665, 1, 0.3960784, 0, 1,
-1.557682, 0.253211, -2.867944, 1, 0.4039216, 0, 1,
-1.54868, 0.7254018, -0.3113734, 1, 0.4078431, 0, 1,
-1.531233, 1.890833, -2.356823, 1, 0.4156863, 0, 1,
-1.530991, -1.651885, -2.824416, 1, 0.4196078, 0, 1,
-1.512693, -1.348924, -1.009206, 1, 0.427451, 0, 1,
-1.508756, -0.8157326, -2.117582, 1, 0.4313726, 0, 1,
-1.494481, 0.364682, -1.100415, 1, 0.4392157, 0, 1,
-1.488622, 0.7683984, -0.8026984, 1, 0.4431373, 0, 1,
-1.471284, -0.1217616, -2.171558, 1, 0.4509804, 0, 1,
-1.464654, -0.7279307, -1.351153, 1, 0.454902, 0, 1,
-1.459879, -1.714242, -1.735546, 1, 0.4627451, 0, 1,
-1.458559, -0.9232194, -0.2287008, 1, 0.4666667, 0, 1,
-1.456531, 0.396712, -0.2124525, 1, 0.4745098, 0, 1,
-1.440145, 1.379548, 0.009817664, 1, 0.4784314, 0, 1,
-1.437927, 0.3490279, -1.027486, 1, 0.4862745, 0, 1,
-1.437255, 1.164239, -0.7991273, 1, 0.4901961, 0, 1,
-1.436573, -2.070422, -2.06259, 1, 0.4980392, 0, 1,
-1.426908, 0.7025431, -1.031557, 1, 0.5058824, 0, 1,
-1.425577, -0.2941014, -2.703975, 1, 0.509804, 0, 1,
-1.423794, -0.6303119, -3.093865, 1, 0.5176471, 0, 1,
-1.422166, 0.0187242, -1.585858, 1, 0.5215687, 0, 1,
-1.420444, -0.1275909, -2.303135, 1, 0.5294118, 0, 1,
-1.420073, -1.541376, -2.1981, 1, 0.5333334, 0, 1,
-1.418952, -0.9433097, -3.192373, 1, 0.5411765, 0, 1,
-1.400651, 0.8660464, -2.149505, 1, 0.5450981, 0, 1,
-1.395224, -0.7995542, -2.390394, 1, 0.5529412, 0, 1,
-1.393469, -0.207049, -2.538613, 1, 0.5568628, 0, 1,
-1.391309, -1.954859, -3.281371, 1, 0.5647059, 0, 1,
-1.376599, 1.013286, -1.204485, 1, 0.5686275, 0, 1,
-1.375266, 0.9805464, -1.417035, 1, 0.5764706, 0, 1,
-1.360686, 0.6969157, -1.549348, 1, 0.5803922, 0, 1,
-1.360587, 0.3179419, -1.353501, 1, 0.5882353, 0, 1,
-1.353921, -1.191082, -1.021387, 1, 0.5921569, 0, 1,
-1.35163, 1.300022, -0.6064068, 1, 0.6, 0, 1,
-1.349546, 0.4746775, -1.864501, 1, 0.6078432, 0, 1,
-1.341319, 0.7110082, -1.821487, 1, 0.6117647, 0, 1,
-1.335361, 0.4875806, -1.657026, 1, 0.6196079, 0, 1,
-1.333005, 0.7659335, 0.5685055, 1, 0.6235294, 0, 1,
-1.332434, -0.00869783, -1.921584, 1, 0.6313726, 0, 1,
-1.321126, 0.05631049, -1.428555, 1, 0.6352941, 0, 1,
-1.321054, 0.8291975, -0.456055, 1, 0.6431373, 0, 1,
-1.32079, -0.4596388, -1.019678, 1, 0.6470588, 0, 1,
-1.318791, -0.4545403, -2.471571, 1, 0.654902, 0, 1,
-1.305026, -1.427279, -3.588521, 1, 0.6588235, 0, 1,
-1.302556, -1.70039, -2.101145, 1, 0.6666667, 0, 1,
-1.300344, 1.031686, -2.314659, 1, 0.6705883, 0, 1,
-1.28004, -1.169406, -3.249175, 1, 0.6784314, 0, 1,
-1.278849, -2.806317, -2.908859, 1, 0.682353, 0, 1,
-1.260167, -0.3954592, -2.815748, 1, 0.6901961, 0, 1,
-1.254805, -0.8957557, -3.261466, 1, 0.6941177, 0, 1,
-1.246976, 0.9078258, -0.03137183, 1, 0.7019608, 0, 1,
-1.242297, -0.3660361, -2.625218, 1, 0.7098039, 0, 1,
-1.23627, 1.05829, -1.183812, 1, 0.7137255, 0, 1,
-1.235152, -0.05690179, -1.136258, 1, 0.7215686, 0, 1,
-1.22853, 0.4808757, -0.5504739, 1, 0.7254902, 0, 1,
-1.227163, -0.5604011, -3.196412, 1, 0.7333333, 0, 1,
-1.220872, 0.014293, 0.03569895, 1, 0.7372549, 0, 1,
-1.219078, -0.575666, -1.609825, 1, 0.7450981, 0, 1,
-1.2183, 1.019871, 0.6184202, 1, 0.7490196, 0, 1,
-1.210779, 1.089526, 0.2535875, 1, 0.7568628, 0, 1,
-1.190108, 0.6566762, -1.133801, 1, 0.7607843, 0, 1,
-1.184577, -1.871968, -3.056772, 1, 0.7686275, 0, 1,
-1.183986, -0.01242601, -1.201612, 1, 0.772549, 0, 1,
-1.183406, -0.9649642, 0.1799792, 1, 0.7803922, 0, 1,
-1.182569, 0.1605307, -1.690963, 1, 0.7843137, 0, 1,
-1.158464, 1.853297, 0.6754436, 1, 0.7921569, 0, 1,
-1.157518, -0.8252033, -1.514552, 1, 0.7960784, 0, 1,
-1.152383, 0.3224573, -1.644088, 1, 0.8039216, 0, 1,
-1.147232, 0.1878863, -1.787905, 1, 0.8117647, 0, 1,
-1.145548, -1.079939, -1.900621, 1, 0.8156863, 0, 1,
-1.138726, 0.604587, 0.524758, 1, 0.8235294, 0, 1,
-1.131873, -0.2863152, -0.1751204, 1, 0.827451, 0, 1,
-1.128604, 0.5007605, -1.612134, 1, 0.8352941, 0, 1,
-1.126568, 0.3498184, -0.9786444, 1, 0.8392157, 0, 1,
-1.118595, -1.13933, -1.200039, 1, 0.8470588, 0, 1,
-1.118475, 0.541564, -1.648866, 1, 0.8509804, 0, 1,
-1.111313, 0.02480743, -1.027205, 1, 0.8588235, 0, 1,
-1.110734, 0.1568852, -1.304682, 1, 0.8627451, 0, 1,
-1.106004, -2.021395, -0.4056954, 1, 0.8705882, 0, 1,
-1.10525, -0.5678492, -2.316229, 1, 0.8745098, 0, 1,
-1.102682, -0.01053343, -1.242514, 1, 0.8823529, 0, 1,
-1.10252, 1.621117, -0.2509041, 1, 0.8862745, 0, 1,
-1.100956, 0.05541139, -1.163688, 1, 0.8941177, 0, 1,
-1.096138, 1.098793, -1.722476, 1, 0.8980392, 0, 1,
-1.094939, 1.024585, 1.270759, 1, 0.9058824, 0, 1,
-1.093943, 0.9897572, -2.178443, 1, 0.9137255, 0, 1,
-1.093421, 1.239217, -1.771235, 1, 0.9176471, 0, 1,
-1.093271, -0.5446256, -2.197902, 1, 0.9254902, 0, 1,
-1.088266, 0.05787019, -1.223211, 1, 0.9294118, 0, 1,
-1.075344, -0.2460562, -2.920345, 1, 0.9372549, 0, 1,
-1.074996, -0.7073396, -2.697566, 1, 0.9411765, 0, 1,
-1.073112, -2.282789, -3.372362, 1, 0.9490196, 0, 1,
-1.069043, 0.4600247, -0.1146119, 1, 0.9529412, 0, 1,
-1.068671, -1.060396, -3.884817, 1, 0.9607843, 0, 1,
-1.064288, 0.5954563, 0.3095467, 1, 0.9647059, 0, 1,
-1.063571, 0.9383305, -0.4043103, 1, 0.972549, 0, 1,
-1.061499, 0.9371524, 0.7605215, 1, 0.9764706, 0, 1,
-1.060163, 0.06436071, -1.19704, 1, 0.9843137, 0, 1,
-1.057195, -0.3721214, -1.191534, 1, 0.9882353, 0, 1,
-1.053344, 0.5070239, -1.846323, 1, 0.9960784, 0, 1,
-1.046465, 0.2890585, 0.02463143, 0.9960784, 1, 0, 1,
-1.042463, -0.6156496, -1.319975, 0.9921569, 1, 0, 1,
-1.039424, 1.001917, -0.4221525, 0.9843137, 1, 0, 1,
-1.034805, -0.999, -1.822933, 0.9803922, 1, 0, 1,
-1.03098, 0.06643999, -1.631199, 0.972549, 1, 0, 1,
-1.030516, 0.7574774, -0.7217971, 0.9686275, 1, 0, 1,
-1.021292, 0.8047059, -1.692859, 0.9607843, 1, 0, 1,
-1.020288, -0.08864924, -0.07655312, 0.9568627, 1, 0, 1,
-1.018447, 1.728512, 0.5219672, 0.9490196, 1, 0, 1,
-1.015577, 0.8452331, -0.6059791, 0.945098, 1, 0, 1,
-1.011575, -0.2717328, -1.545035, 0.9372549, 1, 0, 1,
-1.010161, 2.53582, -0.6365029, 0.9333333, 1, 0, 1,
-1.009917, -0.6280951, -3.312608, 0.9254902, 1, 0, 1,
-1.009435, -1.263479, -2.344032, 0.9215686, 1, 0, 1,
-0.9970872, 0.1622534, -2.903677, 0.9137255, 1, 0, 1,
-0.9881999, 0.9703615, 0.2735568, 0.9098039, 1, 0, 1,
-0.9827598, -0.04161593, -3.329477, 0.9019608, 1, 0, 1,
-0.9765183, -0.5978987, -4.557308, 0.8941177, 1, 0, 1,
-0.9530379, -0.8600622, -2.371398, 0.8901961, 1, 0, 1,
-0.9500304, 0.9226608, -2.04416, 0.8823529, 1, 0, 1,
-0.9399445, -0.7297435, -2.920311, 0.8784314, 1, 0, 1,
-0.9380445, -0.806147, -2.21668, 0.8705882, 1, 0, 1,
-0.9322224, 1.069714, -0.2687886, 0.8666667, 1, 0, 1,
-0.9259091, 1.10817, -1.26644, 0.8588235, 1, 0, 1,
-0.9025192, 0.1555739, -1.429051, 0.854902, 1, 0, 1,
-0.9016764, -0.6315897, -0.06560198, 0.8470588, 1, 0, 1,
-0.9003456, -0.3437922, -0.954846, 0.8431373, 1, 0, 1,
-0.8996881, -0.963576, -3.066608, 0.8352941, 1, 0, 1,
-0.8972238, 0.05893143, 0.6901857, 0.8313726, 1, 0, 1,
-0.8874006, 0.6059573, -0.3708144, 0.8235294, 1, 0, 1,
-0.88272, -0.5753738, -1.867103, 0.8196079, 1, 0, 1,
-0.8817115, 0.6997542, -0.3618407, 0.8117647, 1, 0, 1,
-0.8807979, 0.9678038, -1.398928, 0.8078431, 1, 0, 1,
-0.8795184, 0.04012585, -2.338728, 0.8, 1, 0, 1,
-0.8742849, -0.5457472, -2.469637, 0.7921569, 1, 0, 1,
-0.8703144, -1.065945, -2.345549, 0.7882353, 1, 0, 1,
-0.8695394, -0.3299098, -1.315814, 0.7803922, 1, 0, 1,
-0.8655245, 0.586997, 0.2802052, 0.7764706, 1, 0, 1,
-0.8608415, 0.7875614, -0.8517631, 0.7686275, 1, 0, 1,
-0.857915, -0.4005192, -0.9855223, 0.7647059, 1, 0, 1,
-0.8565562, 0.2395369, -1.998878, 0.7568628, 1, 0, 1,
-0.8505501, -0.8520306, -3.0033, 0.7529412, 1, 0, 1,
-0.8471113, -0.2642401, -2.428218, 0.7450981, 1, 0, 1,
-0.8447771, -0.09128232, -0.7342026, 0.7411765, 1, 0, 1,
-0.8441775, -0.729424, -1.770196, 0.7333333, 1, 0, 1,
-0.8420416, -0.1136408, -1.51633, 0.7294118, 1, 0, 1,
-0.8373566, -0.686248, -3.399337, 0.7215686, 1, 0, 1,
-0.836996, -1.294843, -2.262207, 0.7176471, 1, 0, 1,
-0.8305326, 0.8975951, -1.291002, 0.7098039, 1, 0, 1,
-0.8292701, -0.37004, -1.651493, 0.7058824, 1, 0, 1,
-0.8278233, -0.3853979, -2.987112, 0.6980392, 1, 0, 1,
-0.8240294, 0.1156956, -1.672204, 0.6901961, 1, 0, 1,
-0.8181145, -1.355799, -2.073487, 0.6862745, 1, 0, 1,
-0.8174725, -1.022305, -2.699171, 0.6784314, 1, 0, 1,
-0.8113081, -0.3724184, -2.11061, 0.6745098, 1, 0, 1,
-0.810961, -0.7720316, -3.370736, 0.6666667, 1, 0, 1,
-0.803784, 0.6115593, -1.357412, 0.6627451, 1, 0, 1,
-0.7998201, -0.05255346, -1.558739, 0.654902, 1, 0, 1,
-0.7982373, -1.193917, -2.917844, 0.6509804, 1, 0, 1,
-0.7980337, -2.254409, -2.682395, 0.6431373, 1, 0, 1,
-0.7906033, -0.8620784, -2.025861, 0.6392157, 1, 0, 1,
-0.788637, 1.009376, -0.9966634, 0.6313726, 1, 0, 1,
-0.7876754, 0.08324947, -0.5608634, 0.627451, 1, 0, 1,
-0.7856123, 0.7522513, -1.656825, 0.6196079, 1, 0, 1,
-0.7847866, 0.92063, -1.181209, 0.6156863, 1, 0, 1,
-0.7843671, 0.2963572, -1.468494, 0.6078432, 1, 0, 1,
-0.776233, -0.106685, -1.054459, 0.6039216, 1, 0, 1,
-0.7753882, -1.264955, -3.525579, 0.5960785, 1, 0, 1,
-0.7696491, 0.7926391, 0.3422002, 0.5882353, 1, 0, 1,
-0.7563096, 0.2189922, -1.890994, 0.5843138, 1, 0, 1,
-0.7561898, -0.2178757, -0.9242478, 0.5764706, 1, 0, 1,
-0.755276, -0.1476711, -2.234944, 0.572549, 1, 0, 1,
-0.7532357, -0.04975037, -0.8876913, 0.5647059, 1, 0, 1,
-0.7511923, 0.9725312, 0.03218559, 0.5607843, 1, 0, 1,
-0.7486429, 0.4604233, -0.1300245, 0.5529412, 1, 0, 1,
-0.7477363, -0.9027644, -0.01689659, 0.5490196, 1, 0, 1,
-0.7432192, 0.7557237, 0.8638369, 0.5411765, 1, 0, 1,
-0.7308646, -0.5584179, -2.719773, 0.5372549, 1, 0, 1,
-0.7302519, -0.5616687, -2.76241, 0.5294118, 1, 0, 1,
-0.7269756, 0.1850407, -0.6459444, 0.5254902, 1, 0, 1,
-0.7263096, 0.6800182, -1.550339, 0.5176471, 1, 0, 1,
-0.7142475, 0.7053093, -0.8129695, 0.5137255, 1, 0, 1,
-0.7116283, -0.347534, -0.8333404, 0.5058824, 1, 0, 1,
-0.7050747, 0.8875703, -0.189314, 0.5019608, 1, 0, 1,
-0.7038438, 0.549823, -0.9161237, 0.4941176, 1, 0, 1,
-0.7034946, 0.01808708, -1.599659, 0.4862745, 1, 0, 1,
-0.7007037, -1.165732, -0.835143, 0.4823529, 1, 0, 1,
-0.6977783, -0.2338852, -1.086568, 0.4745098, 1, 0, 1,
-0.691417, -1.04976, -3.283963, 0.4705882, 1, 0, 1,
-0.6866431, -0.4544185, -1.652362, 0.4627451, 1, 0, 1,
-0.677325, 0.04528098, -2.872062, 0.4588235, 1, 0, 1,
-0.6768388, -0.3088692, -2.636552, 0.4509804, 1, 0, 1,
-0.6767211, -0.4940955, -3.062433, 0.4470588, 1, 0, 1,
-0.6720313, 0.006120166, 0.07505234, 0.4392157, 1, 0, 1,
-0.6679612, 1.373459, -0.2540983, 0.4352941, 1, 0, 1,
-0.6654727, 1.410236, -1.441561, 0.427451, 1, 0, 1,
-0.6644727, -1.048311, -2.623672, 0.4235294, 1, 0, 1,
-0.6643772, -0.3362717, -3.123269, 0.4156863, 1, 0, 1,
-0.6623375, 0.1833829, -1.652026, 0.4117647, 1, 0, 1,
-0.661601, -0.1355349, -0.9818971, 0.4039216, 1, 0, 1,
-0.6593902, 0.4615912, -0.3296374, 0.3960784, 1, 0, 1,
-0.6542842, -0.4249596, -2.391504, 0.3921569, 1, 0, 1,
-0.6511413, -0.2409829, -1.367688, 0.3843137, 1, 0, 1,
-0.6442893, 1.378226, -0.5369707, 0.3803922, 1, 0, 1,
-0.6360965, -0.5220392, -2.512337, 0.372549, 1, 0, 1,
-0.6325143, -1.025435, -4.141674, 0.3686275, 1, 0, 1,
-0.6268343, -0.40422, -1.159361, 0.3607843, 1, 0, 1,
-0.6224812, 0.394339, -1.032305, 0.3568628, 1, 0, 1,
-0.6221655, 0.4041178, -1.401272, 0.3490196, 1, 0, 1,
-0.6187359, -0.3108704, -1.989592, 0.345098, 1, 0, 1,
-0.6175917, 0.2060409, -3.15143, 0.3372549, 1, 0, 1,
-0.6151962, 0.2692792, -3.16998, 0.3333333, 1, 0, 1,
-0.6074026, -1.227888, -2.065414, 0.3254902, 1, 0, 1,
-0.6072283, -0.2149366, -1.958897, 0.3215686, 1, 0, 1,
-0.6064224, 1.365608, -0.4802608, 0.3137255, 1, 0, 1,
-0.6056097, -0.9500922, -3.564133, 0.3098039, 1, 0, 1,
-0.6047844, -1.013894, -2.948672, 0.3019608, 1, 0, 1,
-0.6047164, -0.7191882, -1.924125, 0.2941177, 1, 0, 1,
-0.6043844, -1.273997, -2.039941, 0.2901961, 1, 0, 1,
-0.6035387, 0.4427411, -2.565494, 0.282353, 1, 0, 1,
-0.6019937, 1.39489, -1.286398, 0.2784314, 1, 0, 1,
-0.5979604, 0.6575938, -1.994752, 0.2705882, 1, 0, 1,
-0.5934167, 0.3881358, -1.930937, 0.2666667, 1, 0, 1,
-0.5825426, 1.288634, -2.179434, 0.2588235, 1, 0, 1,
-0.5781277, -1.391969, -0.4847344, 0.254902, 1, 0, 1,
-0.5779967, -1.893392, -5.133836, 0.2470588, 1, 0, 1,
-0.5765418, 1.607199, -1.653358, 0.2431373, 1, 0, 1,
-0.5739798, -0.3406295, -1.457325, 0.2352941, 1, 0, 1,
-0.5739588, 0.1261511, -2.666672, 0.2313726, 1, 0, 1,
-0.5731281, -0.5576912, 0.03122081, 0.2235294, 1, 0, 1,
-0.5664829, -0.3286553, -1.460329, 0.2196078, 1, 0, 1,
-0.5628821, -2.12034, -3.211332, 0.2117647, 1, 0, 1,
-0.5575845, -0.4136691, -2.060358, 0.2078431, 1, 0, 1,
-0.5529633, 0.3219982, 1.162348, 0.2, 1, 0, 1,
-0.5483902, 1.180709, 1.909135, 0.1921569, 1, 0, 1,
-0.5449189, -1.477616, -4.160852, 0.1882353, 1, 0, 1,
-0.5405162, 1.301043, -1.693831, 0.1803922, 1, 0, 1,
-0.540372, 1.16569, -1.302237, 0.1764706, 1, 0, 1,
-0.538955, 1.204478, 0.4040871, 0.1686275, 1, 0, 1,
-0.5337957, -0.02775177, -1.270612, 0.1647059, 1, 0, 1,
-0.5311583, -0.4065101, -2.252622, 0.1568628, 1, 0, 1,
-0.5287718, 2.327656, -0.2639714, 0.1529412, 1, 0, 1,
-0.5267591, 1.075528, -0.6001552, 0.145098, 1, 0, 1,
-0.5149568, -0.6408426, -1.7148, 0.1411765, 1, 0, 1,
-0.5145297, 0.6133536, -0.9396889, 0.1333333, 1, 0, 1,
-0.5130194, -0.3302449, -3.957688, 0.1294118, 1, 0, 1,
-0.511836, 0.1173056, -2.241422, 0.1215686, 1, 0, 1,
-0.5108176, 0.8312762, 0.2291238, 0.1176471, 1, 0, 1,
-0.5074075, -0.7015926, -3.155394, 0.1098039, 1, 0, 1,
-0.5059354, -0.3042859, -2.708929, 0.1058824, 1, 0, 1,
-0.5057777, -1.152596, -1.710841, 0.09803922, 1, 0, 1,
-0.5014676, 1.52536, -1.824935, 0.09019608, 1, 0, 1,
-0.4976044, -1.713766, -4.290176, 0.08627451, 1, 0, 1,
-0.494671, -0.4355508, -2.107817, 0.07843138, 1, 0, 1,
-0.4922653, 0.1464141, -1.78049, 0.07450981, 1, 0, 1,
-0.4891141, 0.3901533, -1.73815, 0.06666667, 1, 0, 1,
-0.487424, 0.7714776, -1.312834, 0.0627451, 1, 0, 1,
-0.4872777, -0.9825984, -4.779375, 0.05490196, 1, 0, 1,
-0.48351, 1.110977, -1.543651, 0.05098039, 1, 0, 1,
-0.4825683, -0.5830013, -5.350073, 0.04313726, 1, 0, 1,
-0.4820112, 1.001016, -0.2742701, 0.03921569, 1, 0, 1,
-0.481939, 2.539802, 0.0199198, 0.03137255, 1, 0, 1,
-0.4798436, -1.061441, -2.026136, 0.02745098, 1, 0, 1,
-0.4768382, 1.342505, 0.1263394, 0.01960784, 1, 0, 1,
-0.476141, 0.2113017, -0.7074282, 0.01568628, 1, 0, 1,
-0.4758765, -1.293297, -2.957822, 0.007843138, 1, 0, 1,
-0.4741961, 0.8159696, -0.5834909, 0.003921569, 1, 0, 1,
-0.4735695, 1.148912, 1.022831, 0, 1, 0.003921569, 1,
-0.473224, 0.2790835, -1.149454, 0, 1, 0.01176471, 1,
-0.4724235, 0.08819484, -0.9175439, 0, 1, 0.01568628, 1,
-0.4691388, 1.131526, 1.042025, 0, 1, 0.02352941, 1,
-0.4662229, -0.3838035, -1.282434, 0, 1, 0.02745098, 1,
-0.4646394, 0.4634834, 0.2592436, 0, 1, 0.03529412, 1,
-0.464137, 0.7098285, -1.578612, 0, 1, 0.03921569, 1,
-0.4587608, -0.7319557, -2.727816, 0, 1, 0.04705882, 1,
-0.4579687, -1.498453, -2.884033, 0, 1, 0.05098039, 1,
-0.4576249, -0.6969562, -4.531279, 0, 1, 0.05882353, 1,
-0.4554121, -0.5586501, -3.532647, 0, 1, 0.0627451, 1,
-0.4520563, -0.9106197, -2.348479, 0, 1, 0.07058824, 1,
-0.4453775, 1.816214, -0.6674641, 0, 1, 0.07450981, 1,
-0.4451263, 0.2294599, -1.254608, 0, 1, 0.08235294, 1,
-0.4408114, 1.107748, -1.657439, 0, 1, 0.08627451, 1,
-0.434838, 1.184326, -1.155038, 0, 1, 0.09411765, 1,
-0.4341772, -0.6755826, -2.479817, 0, 1, 0.1019608, 1,
-0.4339365, -1.703055, -2.979609, 0, 1, 0.1058824, 1,
-0.4251965, 1.389631, 0.6893708, 0, 1, 0.1137255, 1,
-0.4234437, -0.008651702, -1.787964, 0, 1, 0.1176471, 1,
-0.4125283, 1.788954, -0.7038901, 0, 1, 0.1254902, 1,
-0.4124289, 0.6215119, 1.522828, 0, 1, 0.1294118, 1,
-0.4088404, -0.137022, -2.033059, 0, 1, 0.1372549, 1,
-0.4043001, -1.44218, -2.134256, 0, 1, 0.1411765, 1,
-0.4034128, 2.292094, 1.331618, 0, 1, 0.1490196, 1,
-0.4010907, -0.3505715, -2.448644, 0, 1, 0.1529412, 1,
-0.4010783, 0.8874572, -1.381426, 0, 1, 0.1607843, 1,
-0.3924257, 1.019559, 0.5474526, 0, 1, 0.1647059, 1,
-0.3916679, -0.8555925, -3.666746, 0, 1, 0.172549, 1,
-0.3881969, -0.7100289, -2.467101, 0, 1, 0.1764706, 1,
-0.3865606, -0.3321097, -2.029033, 0, 1, 0.1843137, 1,
-0.3855152, 0.2701956, 0.03190496, 0, 1, 0.1882353, 1,
-0.3849053, -1.251647, -2.079096, 0, 1, 0.1960784, 1,
-0.3812771, 0.2048745, -0.5670707, 0, 1, 0.2039216, 1,
-0.3803334, -0.5262233, -2.660482, 0, 1, 0.2078431, 1,
-0.3781089, 0.9361876, -1.446684, 0, 1, 0.2156863, 1,
-0.3764901, -0.7553856, -2.722306, 0, 1, 0.2196078, 1,
-0.3749431, -0.7387177, -1.309012, 0, 1, 0.227451, 1,
-0.3683904, -0.4062375, -1.138985, 0, 1, 0.2313726, 1,
-0.3683212, -0.5389963, -1.547996, 0, 1, 0.2392157, 1,
-0.3662336, -0.3561344, -3.805495, 0, 1, 0.2431373, 1,
-0.3662273, 0.9113404, 0.6874183, 0, 1, 0.2509804, 1,
-0.3615994, 1.11904, -0.988439, 0, 1, 0.254902, 1,
-0.358941, 0.5629982, -1.616594, 0, 1, 0.2627451, 1,
-0.3549146, -2.490571, -3.030233, 0, 1, 0.2666667, 1,
-0.354399, -0.2371671, -1.715371, 0, 1, 0.2745098, 1,
-0.3517288, 1.316483, -0.4774335, 0, 1, 0.2784314, 1,
-0.350976, -0.7647555, -2.784946, 0, 1, 0.2862745, 1,
-0.3504983, 0.2091994, -1.861887, 0, 1, 0.2901961, 1,
-0.3488698, -0.4346353, -2.943793, 0, 1, 0.2980392, 1,
-0.3436347, -0.05607061, -2.712855, 0, 1, 0.3058824, 1,
-0.3388121, -1.248427, -1.128099, 0, 1, 0.3098039, 1,
-0.3380745, -0.9427301, -3.898395, 0, 1, 0.3176471, 1,
-0.3300897, -1.056414, -2.066276, 0, 1, 0.3215686, 1,
-0.3232595, 1.631425, -0.5002059, 0, 1, 0.3294118, 1,
-0.3220509, -1.760194, -1.938827, 0, 1, 0.3333333, 1,
-0.3202564, -0.2810066, -2.078369, 0, 1, 0.3411765, 1,
-0.3155524, -0.3679356, -3.376479, 0, 1, 0.345098, 1,
-0.315279, 0.3762598, -0.9963855, 0, 1, 0.3529412, 1,
-0.3140016, -1.300049, -2.923236, 0, 1, 0.3568628, 1,
-0.3059953, 1.314273, 0.9100384, 0, 1, 0.3647059, 1,
-0.3019788, 0.257703, -1.392063, 0, 1, 0.3686275, 1,
-0.2950778, 0.2982965, 0.03048199, 0, 1, 0.3764706, 1,
-0.2946735, -1.02315, -3.502915, 0, 1, 0.3803922, 1,
-0.2909687, 1.102181, 1.650416, 0, 1, 0.3882353, 1,
-0.2905736, 1.341398, 0.1464413, 0, 1, 0.3921569, 1,
-0.2888135, 0.009646053, -2.788299, 0, 1, 0.4, 1,
-0.288157, 1.442343, -0.9099612, 0, 1, 0.4078431, 1,
-0.277241, 1.432347, 0.02854507, 0, 1, 0.4117647, 1,
-0.2768826, 0.6160254, -1.007827, 0, 1, 0.4196078, 1,
-0.2759342, 0.7773152, 0.9780041, 0, 1, 0.4235294, 1,
-0.2728243, 1.495346, -0.816686, 0, 1, 0.4313726, 1,
-0.2713563, 0.177685, -0.3331545, 0, 1, 0.4352941, 1,
-0.2680469, -0.2470855, -2.697628, 0, 1, 0.4431373, 1,
-0.2671759, -0.9327821, -3.367095, 0, 1, 0.4470588, 1,
-0.2636237, 0.4922992, -0.8577614, 0, 1, 0.454902, 1,
-0.2634789, -0.6873979, -4.079849, 0, 1, 0.4588235, 1,
-0.2587743, 1.509689, -0.8159782, 0, 1, 0.4666667, 1,
-0.2562155, 0.2470059, -2.274935, 0, 1, 0.4705882, 1,
-0.2502212, -0.6198072, -1.040047, 0, 1, 0.4784314, 1,
-0.2499154, -0.09187812, -3.038907, 0, 1, 0.4823529, 1,
-0.2495991, -1.355191, -2.657468, 0, 1, 0.4901961, 1,
-0.2489787, 0.9560147, 0.5050678, 0, 1, 0.4941176, 1,
-0.2456864, -0.4685409, -3.160046, 0, 1, 0.5019608, 1,
-0.2388714, -0.9563687, -3.464837, 0, 1, 0.509804, 1,
-0.234381, 0.1610663, -1.642161, 0, 1, 0.5137255, 1,
-0.2305091, -0.0845566, -0.7748483, 0, 1, 0.5215687, 1,
-0.2295014, 1.370135, 1.408535, 0, 1, 0.5254902, 1,
-0.221832, 1.29904, 0.005424553, 0, 1, 0.5333334, 1,
-0.2087879, -2.694957, -3.40976, 0, 1, 0.5372549, 1,
-0.2070753, 1.436303, -0.320967, 0, 1, 0.5450981, 1,
-0.206158, -1.286981, -3.514204, 0, 1, 0.5490196, 1,
-0.2036144, -0.5070829, -4.433418, 0, 1, 0.5568628, 1,
-0.2014968, 0.479948, 0.6522431, 0, 1, 0.5607843, 1,
-0.2009986, -1.215572, -1.30282, 0, 1, 0.5686275, 1,
-0.1968081, 0.260095, -1.311011, 0, 1, 0.572549, 1,
-0.1967847, 0.2500747, -1.545554, 0, 1, 0.5803922, 1,
-0.1923289, -0.3662062, -3.93612, 0, 1, 0.5843138, 1,
-0.1884671, 0.9403421, -1.82638, 0, 1, 0.5921569, 1,
-0.1880454, -2.035599, -3.045998, 0, 1, 0.5960785, 1,
-0.1834953, -0.4029419, -1.436138, 0, 1, 0.6039216, 1,
-0.1776086, 0.5394481, 0.9352615, 0, 1, 0.6117647, 1,
-0.1767044, -0.2702748, -3.446577, 0, 1, 0.6156863, 1,
-0.1704183, -0.7642478, -5.348819, 0, 1, 0.6235294, 1,
-0.1695977, -0.1267559, -2.836727, 0, 1, 0.627451, 1,
-0.1691827, -0.5110269, -1.684837, 0, 1, 0.6352941, 1,
-0.1638238, -1.724595, -1.906627, 0, 1, 0.6392157, 1,
-0.1635797, 1.153323, -0.277555, 0, 1, 0.6470588, 1,
-0.163095, 0.6816831, 0.6665491, 0, 1, 0.6509804, 1,
-0.1550054, -0.01697855, -2.033466, 0, 1, 0.6588235, 1,
-0.1471966, 1.804876, -1.750096, 0, 1, 0.6627451, 1,
-0.1469964, 0.5861664, 2.224884, 0, 1, 0.6705883, 1,
-0.1453506, -1.308758, -3.783792, 0, 1, 0.6745098, 1,
-0.1449417, -1.153124, -3.378336, 0, 1, 0.682353, 1,
-0.1443325, 0.481406, 2.330592, 0, 1, 0.6862745, 1,
-0.1433733, -0.2969145, -3.613354, 0, 1, 0.6941177, 1,
-0.1417128, -0.1618529, -2.451591, 0, 1, 0.7019608, 1,
-0.140855, -0.1196749, -1.353967, 0, 1, 0.7058824, 1,
-0.1403442, 1.72305, 0.3201991, 0, 1, 0.7137255, 1,
-0.135943, 0.8291413, -0.982593, 0, 1, 0.7176471, 1,
-0.1349439, -0.6456728, -4.027306, 0, 1, 0.7254902, 1,
-0.1326961, -0.9529033, -2.601903, 0, 1, 0.7294118, 1,
-0.1296149, -0.1277359, -4.868791, 0, 1, 0.7372549, 1,
-0.1222088, -1.36377, -5.065574, 0, 1, 0.7411765, 1,
-0.1210732, 1.536372, -0.1885259, 0, 1, 0.7490196, 1,
-0.1089344, 0.0002000153, -1.030797, 0, 1, 0.7529412, 1,
-0.1082559, 1.07808, -2.775637, 0, 1, 0.7607843, 1,
-0.1040706, -1.811311, -3.066256, 0, 1, 0.7647059, 1,
-0.1003611, -0.02626266, -2.713567, 0, 1, 0.772549, 1,
-0.09923472, 0.2922796, -0.8493693, 0, 1, 0.7764706, 1,
-0.09874015, -0.4102971, -2.281018, 0, 1, 0.7843137, 1,
-0.09617932, 0.6570634, -0.6956823, 0, 1, 0.7882353, 1,
-0.0883845, -0.2369414, -2.952453, 0, 1, 0.7960784, 1,
-0.07978168, -0.827675, -1.309192, 0, 1, 0.8039216, 1,
-0.07639694, 1.37532, -0.9100013, 0, 1, 0.8078431, 1,
-0.07567639, -1.276723, -2.373202, 0, 1, 0.8156863, 1,
-0.0734845, 0.4307038, -0.5290905, 0, 1, 0.8196079, 1,
-0.07110158, 0.2506577, -0.816579, 0, 1, 0.827451, 1,
-0.07060591, 1.072349, -0.2260871, 0, 1, 0.8313726, 1,
-0.07000159, -0.9417632, -3.737243, 0, 1, 0.8392157, 1,
-0.06844582, 0.05311607, -2.203202, 0, 1, 0.8431373, 1,
-0.06236666, -0.6722189, -3.560306, 0, 1, 0.8509804, 1,
-0.05806801, -0.8906195, -3.032103, 0, 1, 0.854902, 1,
-0.05629084, -1.061462, -3.511918, 0, 1, 0.8627451, 1,
-0.05562073, 0.01130516, 0.2355632, 0, 1, 0.8666667, 1,
-0.05544833, 0.2287861, 0.1072774, 0, 1, 0.8745098, 1,
-0.05200873, -1.385079, -4.315227, 0, 1, 0.8784314, 1,
-0.04936813, 0.2106301, -2.060301, 0, 1, 0.8862745, 1,
-0.04649885, -1.617176, -3.23517, 0, 1, 0.8901961, 1,
-0.04600054, -0.7000561, -1.750017, 0, 1, 0.8980392, 1,
-0.04571282, 0.0232496, -1.390111, 0, 1, 0.9058824, 1,
-0.04417091, -0.9522353, -3.068117, 0, 1, 0.9098039, 1,
-0.04416639, -0.6895234, -3.575716, 0, 1, 0.9176471, 1,
-0.04316949, 0.4338048, 0.0542607, 0, 1, 0.9215686, 1,
-0.03912984, 0.6382672, 1.037185, 0, 1, 0.9294118, 1,
-0.03755866, 1.119478, 0.1191516, 0, 1, 0.9333333, 1,
-0.03432172, 0.5556561, 1.094802, 0, 1, 0.9411765, 1,
-0.03423184, -0.08831741, -2.352749, 0, 1, 0.945098, 1,
-0.03235897, 0.2549296, -0.02428183, 0, 1, 0.9529412, 1,
-0.03121016, 0.1107645, 0.04859254, 0, 1, 0.9568627, 1,
-0.03026005, -0.6917374, -2.058177, 0, 1, 0.9647059, 1,
-0.03021766, -1.44016, -1.341413, 0, 1, 0.9686275, 1,
-0.03012169, -0.370911, -2.917389, 0, 1, 0.9764706, 1,
-0.02957369, -0.1686971, -3.134881, 0, 1, 0.9803922, 1,
-0.02946554, -0.5475204, -3.338663, 0, 1, 0.9882353, 1,
-0.02581681, -0.5466607, -4.298294, 0, 1, 0.9921569, 1,
-0.02406895, -1.23011, -4.434597, 0, 1, 1, 1,
-0.02031042, 0.1383153, -1.051455, 0, 0.9921569, 1, 1,
-0.01999796, 0.05877471, -0.4431695, 0, 0.9882353, 1, 1,
-0.01634936, -0.1022043, -4.302856, 0, 0.9803922, 1, 1,
-0.01128951, -0.2035792, -2.774869, 0, 0.9764706, 1, 1,
-0.0102849, 0.1805218, -0.05256543, 0, 0.9686275, 1, 1,
-0.007605292, 0.3571424, 0.0377192, 0, 0.9647059, 1, 1,
-0.00490605, -1.519473, -2.541895, 0, 0.9568627, 1, 1,
-0.003838684, 0.6727079, 0.9406428, 0, 0.9529412, 1, 1,
-0.002173117, 1.660039, -0.8047235, 0, 0.945098, 1, 1,
-0.001417664, -1.81025, -4.693565, 0, 0.9411765, 1, 1,
-0.0005142605, 0.5984652, -0.2111893, 0, 0.9333333, 1, 1,
0.001189036, 2.335804, 0.07133781, 0, 0.9294118, 1, 1,
0.001261514, -0.01186431, 3.660847, 0, 0.9215686, 1, 1,
0.003223564, -1.27729, 4.272326, 0, 0.9176471, 1, 1,
0.004315377, 0.4009333, -0.9532743, 0, 0.9098039, 1, 1,
0.005168343, -0.6581801, 3.379949, 0, 0.9058824, 1, 1,
0.007552839, 0.2980414, 0.4218557, 0, 0.8980392, 1, 1,
0.01067856, 1.536385, -0.1467153, 0, 0.8901961, 1, 1,
0.02264969, 1.263819, 0.5845838, 0, 0.8862745, 1, 1,
0.02312333, 1.047459, -1.338938, 0, 0.8784314, 1, 1,
0.02357089, 0.5731741, 0.03709278, 0, 0.8745098, 1, 1,
0.02541897, -0.8839638, 3.572382, 0, 0.8666667, 1, 1,
0.02559984, -0.103197, 2.887489, 0, 0.8627451, 1, 1,
0.03183253, 0.108953, 0.9002595, 0, 0.854902, 1, 1,
0.03244831, 1.573793, 0.8342198, 0, 0.8509804, 1, 1,
0.03787312, -0.0622803, 1.21204, 0, 0.8431373, 1, 1,
0.04379681, -0.08482688, 3.30814, 0, 0.8392157, 1, 1,
0.04819325, -0.1739861, 3.927834, 0, 0.8313726, 1, 1,
0.04937253, 0.2856757, 1.111716, 0, 0.827451, 1, 1,
0.05031988, 0.4125402, -1.628013, 0, 0.8196079, 1, 1,
0.05340543, -0.8568466, 5.773662, 0, 0.8156863, 1, 1,
0.054256, 0.542354, 1.842038, 0, 0.8078431, 1, 1,
0.05538162, 0.3060834, 0.7147956, 0, 0.8039216, 1, 1,
0.05589338, 0.1697437, 1.449283, 0, 0.7960784, 1, 1,
0.05671468, 1.543818, -1.076228, 0, 0.7882353, 1, 1,
0.05715934, 0.2591243, 0.6663382, 0, 0.7843137, 1, 1,
0.05853976, 0.002701571, 1.770292, 0, 0.7764706, 1, 1,
0.06310626, 0.8086594, -0.1133194, 0, 0.772549, 1, 1,
0.06788097, 0.9721059, 0.5913264, 0, 0.7647059, 1, 1,
0.06993808, -1.268059, 2.931429, 0, 0.7607843, 1, 1,
0.07670764, 0.9551711, 0.1706783, 0, 0.7529412, 1, 1,
0.07788809, -2.878882, 4.805094, 0, 0.7490196, 1, 1,
0.08004645, 0.5678419, 0.1057463, 0, 0.7411765, 1, 1,
0.08055076, -0.327334, 4.341287, 0, 0.7372549, 1, 1,
0.08117366, -0.1572139, 2.376949, 0, 0.7294118, 1, 1,
0.08237712, 0.1231891, 1.914865, 0, 0.7254902, 1, 1,
0.08291429, 2.079781, 0.349417, 0, 0.7176471, 1, 1,
0.0964707, -0.8588746, 4.62792, 0, 0.7137255, 1, 1,
0.09802639, -1.288423, 2.248939, 0, 0.7058824, 1, 1,
0.09823078, -0.2984767, 1.751595, 0, 0.6980392, 1, 1,
0.09897031, -0.3319094, 1.803639, 0, 0.6941177, 1, 1,
0.09991342, 1.573984, -1.056064, 0, 0.6862745, 1, 1,
0.1004784, 0.9300622, -0.9976992, 0, 0.682353, 1, 1,
0.1008819, 0.1689921, 1.056257, 0, 0.6745098, 1, 1,
0.1024268, 0.4276831, 1.334504, 0, 0.6705883, 1, 1,
0.1039452, 0.8476422, 0.8533329, 0, 0.6627451, 1, 1,
0.1099251, 0.05242767, 1.438337, 0, 0.6588235, 1, 1,
0.1105438, 0.734267, -1.299686, 0, 0.6509804, 1, 1,
0.1142899, -0.05730357, 2.998495, 0, 0.6470588, 1, 1,
0.1197681, 0.7070455, 0.2559502, 0, 0.6392157, 1, 1,
0.1206118, -0.8582192, 3.633181, 0, 0.6352941, 1, 1,
0.122571, 0.1895283, 0.2842507, 0, 0.627451, 1, 1,
0.1251309, 0.4379106, -0.441667, 0, 0.6235294, 1, 1,
0.1261809, 0.08341613, 0.7618901, 0, 0.6156863, 1, 1,
0.1263399, 0.4855217, 0.8254239, 0, 0.6117647, 1, 1,
0.1266973, -1.352197, 2.670455, 0, 0.6039216, 1, 1,
0.1314312, -0.5269532, 1.625838, 0, 0.5960785, 1, 1,
0.1323921, -0.4488053, 4.229107, 0, 0.5921569, 1, 1,
0.1327845, 1.169399, 1.421234, 0, 0.5843138, 1, 1,
0.1348817, 1.958292, 0.2327408, 0, 0.5803922, 1, 1,
0.1431322, 2.476061, -0.05985269, 0, 0.572549, 1, 1,
0.1441442, -1.047765, 3.47045, 0, 0.5686275, 1, 1,
0.1441453, 1.230821, -0.7002743, 0, 0.5607843, 1, 1,
0.1446131, -0.5097455, 4.232038, 0, 0.5568628, 1, 1,
0.1477463, 1.572386, 1.59696, 0, 0.5490196, 1, 1,
0.1503079, 1.024999, 0.9051874, 0, 0.5450981, 1, 1,
0.1524806, -0.02101258, 1.818348, 0, 0.5372549, 1, 1,
0.154463, 1.421998, -1.946699, 0, 0.5333334, 1, 1,
0.1545523, 0.7536094, 1.110776, 0, 0.5254902, 1, 1,
0.1566491, -0.05173431, 0.896707, 0, 0.5215687, 1, 1,
0.1593397, 1.129159, 2.204671, 0, 0.5137255, 1, 1,
0.1604625, 0.8436548, -0.1105833, 0, 0.509804, 1, 1,
0.1625377, 0.3892593, 0.344794, 0, 0.5019608, 1, 1,
0.163793, 1.389653, 0.4754824, 0, 0.4941176, 1, 1,
0.1702051, 0.4677115, -2.348881, 0, 0.4901961, 1, 1,
0.1710804, -0.1807859, 3.02049, 0, 0.4823529, 1, 1,
0.1722011, -0.04870734, 2.767428, 0, 0.4784314, 1, 1,
0.1751039, 1.076391, -0.07029106, 0, 0.4705882, 1, 1,
0.1824202, -1.318466, 2.062614, 0, 0.4666667, 1, 1,
0.1847191, -0.7994164, 2.694378, 0, 0.4588235, 1, 1,
0.18539, -1.437279, 1.805257, 0, 0.454902, 1, 1,
0.1952054, -0.629001, 2.086154, 0, 0.4470588, 1, 1,
0.1966077, -1.63597, 2.286762, 0, 0.4431373, 1, 1,
0.1973718, 0.9781342, -0.05143584, 0, 0.4352941, 1, 1,
0.1980938, 1.177201, -1.200369, 0, 0.4313726, 1, 1,
0.1999255, 0.8356832, 0.05786449, 0, 0.4235294, 1, 1,
0.200919, -0.5952463, 4.189318, 0, 0.4196078, 1, 1,
0.2063466, 0.7575943, -0.1042051, 0, 0.4117647, 1, 1,
0.2103064, -0.3081317, 3.502354, 0, 0.4078431, 1, 1,
0.2104756, -0.06549574, 0.6919499, 0, 0.4, 1, 1,
0.217654, 0.6195387, -0.3350224, 0, 0.3921569, 1, 1,
0.2215162, -1.40135, 3.031726, 0, 0.3882353, 1, 1,
0.2233844, 0.8609881, -0.4406005, 0, 0.3803922, 1, 1,
0.2264876, 0.6879629, 1.627743, 0, 0.3764706, 1, 1,
0.2272137, 0.7933128, 1.486163, 0, 0.3686275, 1, 1,
0.2289783, 0.4008255, 0.6522591, 0, 0.3647059, 1, 1,
0.2383387, -0.5548393, 2.346434, 0, 0.3568628, 1, 1,
0.2395882, -0.09557159, 2.692565, 0, 0.3529412, 1, 1,
0.2428366, -0.3112219, 2.442493, 0, 0.345098, 1, 1,
0.2464413, -0.4669892, 3.711726, 0, 0.3411765, 1, 1,
0.2475045, -1.281544, 2.662822, 0, 0.3333333, 1, 1,
0.24906, -0.4304696, 2.079123, 0, 0.3294118, 1, 1,
0.2506284, -0.111982, 1.536689, 0, 0.3215686, 1, 1,
0.2512922, 0.3366985, 0.1389854, 0, 0.3176471, 1, 1,
0.2535, -0.6328529, 1.779838, 0, 0.3098039, 1, 1,
0.2540003, -1.582232, 3.133924, 0, 0.3058824, 1, 1,
0.2560333, 1.924652, -0.2399198, 0, 0.2980392, 1, 1,
0.2574554, -0.9052497, 2.549568, 0, 0.2901961, 1, 1,
0.2575949, -0.2336465, 2.097933, 0, 0.2862745, 1, 1,
0.2615991, 2.416667, 0.03764115, 0, 0.2784314, 1, 1,
0.2618697, -0.4670262, 3.914441, 0, 0.2745098, 1, 1,
0.2701307, -0.3321013, 3.779645, 0, 0.2666667, 1, 1,
0.2749029, -0.1598297, 3.117084, 0, 0.2627451, 1, 1,
0.2787841, 0.788977, 1.272641, 0, 0.254902, 1, 1,
0.283835, 0.2435494, -0.4921972, 0, 0.2509804, 1, 1,
0.2908015, 0.3268121, 1.104458, 0, 0.2431373, 1, 1,
0.2995175, 0.9770392, -0.8149219, 0, 0.2392157, 1, 1,
0.3051539, 0.4483644, 0.2943347, 0, 0.2313726, 1, 1,
0.3051623, 0.2979905, 1.289015, 0, 0.227451, 1, 1,
0.3075505, -0.7198479, 3.138304, 0, 0.2196078, 1, 1,
0.3129598, 2.254182, -0.8192296, 0, 0.2156863, 1, 1,
0.3142972, -2.582608, 3.45079, 0, 0.2078431, 1, 1,
0.3207843, -1.65151, 3.807051, 0, 0.2039216, 1, 1,
0.3267615, -1.176587, 2.362259, 0, 0.1960784, 1, 1,
0.3268535, -0.2868299, 2.546106, 0, 0.1882353, 1, 1,
0.3271979, -0.755483, 0.4230278, 0, 0.1843137, 1, 1,
0.3296837, 1.245566, -0.3173306, 0, 0.1764706, 1, 1,
0.3413806, -0.6867212, 1.574063, 0, 0.172549, 1, 1,
0.3425785, -0.2937275, 1.933626, 0, 0.1647059, 1, 1,
0.3436872, 0.09245959, 1.072253, 0, 0.1607843, 1, 1,
0.3447929, 0.04293598, 0.9092085, 0, 0.1529412, 1, 1,
0.3472007, -0.4162505, 2.420966, 0, 0.1490196, 1, 1,
0.348029, -1.292103, 2.330798, 0, 0.1411765, 1, 1,
0.3491238, -0.02988352, 0.4193586, 0, 0.1372549, 1, 1,
0.355119, -0.4923581, 1.600839, 0, 0.1294118, 1, 1,
0.3619427, 1.552857, 1.750519, 0, 0.1254902, 1, 1,
0.3677045, -0.9929315, 3.893167, 0, 0.1176471, 1, 1,
0.3694563, 0.01098993, 2.280223, 0, 0.1137255, 1, 1,
0.379378, -1.154219, 4.10642, 0, 0.1058824, 1, 1,
0.3922421, -0.1236069, 2.158463, 0, 0.09803922, 1, 1,
0.3943017, 0.2874076, 1.1417, 0, 0.09411765, 1, 1,
0.3958603, -0.1123342, 3.241561, 0, 0.08627451, 1, 1,
0.4065726, 0.1920968, 1.039404, 0, 0.08235294, 1, 1,
0.408062, 2.154414, -1.227349, 0, 0.07450981, 1, 1,
0.4089986, 0.4648353, 0.6297236, 0, 0.07058824, 1, 1,
0.4110793, 0.7399549, 0.2635113, 0, 0.0627451, 1, 1,
0.414169, 0.090671, 1.892825, 0, 0.05882353, 1, 1,
0.4153845, 0.02754151, 2.700758, 0, 0.05098039, 1, 1,
0.4161434, 1.081779, 1.38962, 0, 0.04705882, 1, 1,
0.4246036, -0.9385684, 2.964892, 0, 0.03921569, 1, 1,
0.4255841, 1.435941, -0.08602239, 0, 0.03529412, 1, 1,
0.4267325, 1.578496, -1.723247, 0, 0.02745098, 1, 1,
0.4279208, -1.367207, 1.084354, 0, 0.02352941, 1, 1,
0.4294074, 0.7430738, 0.6436787, 0, 0.01568628, 1, 1,
0.4314146, 0.0772749, 2.791559, 0, 0.01176471, 1, 1,
0.434705, 2.337674, 1.599026, 0, 0.003921569, 1, 1,
0.4400326, -0.8015929, 3.40001, 0.003921569, 0, 1, 1,
0.4472479, 0.04476256, 3.20512, 0.007843138, 0, 1, 1,
0.4521509, -0.2730303, 2.854038, 0.01568628, 0, 1, 1,
0.4531959, 0.4137088, 2.44645, 0.01960784, 0, 1, 1,
0.453262, -0.7261133, 2.719018, 0.02745098, 0, 1, 1,
0.4663126, -1.26322, 3.791181, 0.03137255, 0, 1, 1,
0.4707318, -1.207199, 2.54831, 0.03921569, 0, 1, 1,
0.4719656, -0.6353803, 2.650932, 0.04313726, 0, 1, 1,
0.4741259, 0.7588713, 2.733286, 0.05098039, 0, 1, 1,
0.4811364, -0.3862247, 2.386363, 0.05490196, 0, 1, 1,
0.4874835, 1.118604, 0.8454081, 0.0627451, 0, 1, 1,
0.4897357, -0.2132465, 2.080328, 0.06666667, 0, 1, 1,
0.4912593, 1.51677, 1.805944, 0.07450981, 0, 1, 1,
0.4966052, 1.246359, 0.1962694, 0.07843138, 0, 1, 1,
0.4990379, -0.6571157, -0.4512796, 0.08627451, 0, 1, 1,
0.5101326, -0.6948887, 2.333277, 0.09019608, 0, 1, 1,
0.511409, 1.379014, 0.6673568, 0.09803922, 0, 1, 1,
0.5116431, 0.2234661, -0.5149602, 0.1058824, 0, 1, 1,
0.5117286, -0.3617352, 2.640758, 0.1098039, 0, 1, 1,
0.5163081, 0.3198697, 1.903442, 0.1176471, 0, 1, 1,
0.5173187, -0.4005117, 1.60822, 0.1215686, 0, 1, 1,
0.5196581, -1.353472, 3.516157, 0.1294118, 0, 1, 1,
0.5214438, 0.4249949, 1.708941, 0.1333333, 0, 1, 1,
0.5248616, -1.026678, 2.746042, 0.1411765, 0, 1, 1,
0.5260227, 1.342852, -0.8465654, 0.145098, 0, 1, 1,
0.5310546, 0.2415191, 0.6455288, 0.1529412, 0, 1, 1,
0.5389005, -1.939766, 1.2526, 0.1568628, 0, 1, 1,
0.5421535, 0.5374632, -1.01625, 0.1647059, 0, 1, 1,
0.5431185, 0.8589094, 0.396837, 0.1686275, 0, 1, 1,
0.5431257, -1.196343, 4.119333, 0.1764706, 0, 1, 1,
0.5459201, -0.1290071, 3.090885, 0.1803922, 0, 1, 1,
0.5468621, 0.3557428, -0.01118753, 0.1882353, 0, 1, 1,
0.5593936, -0.5471147, 1.368861, 0.1921569, 0, 1, 1,
0.5651054, 0.643815, 0.7633238, 0.2, 0, 1, 1,
0.5674192, 0.07300086, 2.71417, 0.2078431, 0, 1, 1,
0.5707595, -1.908286, 1.648043, 0.2117647, 0, 1, 1,
0.5719105, 1.6147, -0.4723217, 0.2196078, 0, 1, 1,
0.574335, 0.5080093, 0.5641409, 0.2235294, 0, 1, 1,
0.5828866, -0.6015861, 2.417446, 0.2313726, 0, 1, 1,
0.5852366, -1.538566, 2.641685, 0.2352941, 0, 1, 1,
0.5877343, 0.5475917, 1.64855, 0.2431373, 0, 1, 1,
0.5916532, -1.469367, 2.548082, 0.2470588, 0, 1, 1,
0.5968808, -0.1158527, 0.8044143, 0.254902, 0, 1, 1,
0.5996473, -1.714265, 1.829188, 0.2588235, 0, 1, 1,
0.6022475, 1.563119, -1.068804, 0.2666667, 0, 1, 1,
0.6037737, 0.3729211, 1.179086, 0.2705882, 0, 1, 1,
0.6092868, -0.4445551, 3.197808, 0.2784314, 0, 1, 1,
0.6126081, -0.2838552, 1.447318, 0.282353, 0, 1, 1,
0.6128207, 0.3189163, -0.5774546, 0.2901961, 0, 1, 1,
0.6160474, -1.392072, 1.974345, 0.2941177, 0, 1, 1,
0.6166107, -0.9198469, 1.901591, 0.3019608, 0, 1, 1,
0.6176733, -1.26168, 4.175809, 0.3098039, 0, 1, 1,
0.6269761, 0.184432, 1.150478, 0.3137255, 0, 1, 1,
0.627344, 1.206545, 2.158838, 0.3215686, 0, 1, 1,
0.6276767, 2.115654, 0.2043868, 0.3254902, 0, 1, 1,
0.6297458, 0.226465, 0.75081, 0.3333333, 0, 1, 1,
0.6341087, -0.05142655, 2.71189, 0.3372549, 0, 1, 1,
0.6354001, -0.6563241, 2.661714, 0.345098, 0, 1, 1,
0.6356405, -0.8450089, 2.589938, 0.3490196, 0, 1, 1,
0.6407984, 0.8646791, 0.1033695, 0.3568628, 0, 1, 1,
0.6427277, -0.9881039, 0.5267212, 0.3607843, 0, 1, 1,
0.6430874, -1.847336, 3.262252, 0.3686275, 0, 1, 1,
0.6443803, 1.405421, 1.568302, 0.372549, 0, 1, 1,
0.6465923, -2.145124, 3.133416, 0.3803922, 0, 1, 1,
0.6483067, -0.2963288, 0.7142443, 0.3843137, 0, 1, 1,
0.6493129, 0.8627226, 1.074258, 0.3921569, 0, 1, 1,
0.659023, -3.346797, 3.639325, 0.3960784, 0, 1, 1,
0.6591086, -0.2872255, 3.315582, 0.4039216, 0, 1, 1,
0.6679187, -0.2326582, 2.725025, 0.4117647, 0, 1, 1,
0.6698108, -2.037667, 3.593983, 0.4156863, 0, 1, 1,
0.6726317, 0.6315214, -1.295653, 0.4235294, 0, 1, 1,
0.6757415, 1.088843, -1.738334, 0.427451, 0, 1, 1,
0.6785519, 0.8148903, 1.389053, 0.4352941, 0, 1, 1,
0.6810673, 0.3288263, 1.307858, 0.4392157, 0, 1, 1,
0.6838136, -0.9523245, 2.432652, 0.4470588, 0, 1, 1,
0.6877367, 0.6318455, 0.04097133, 0.4509804, 0, 1, 1,
0.6905959, 0.8566975, -0.03046391, 0.4588235, 0, 1, 1,
0.6976156, -0.7985429, 1.174903, 0.4627451, 0, 1, 1,
0.711998, -0.4105788, 0.6294557, 0.4705882, 0, 1, 1,
0.714736, -0.3862734, 2.037097, 0.4745098, 0, 1, 1,
0.7167213, 0.04597644, 1.61569, 0.4823529, 0, 1, 1,
0.7172134, 0.2867071, 2.002563, 0.4862745, 0, 1, 1,
0.7238042, 1.195854, 0.1552502, 0.4941176, 0, 1, 1,
0.7245544, -0.5721545, 2.627316, 0.5019608, 0, 1, 1,
0.7387213, 0.1332298, 2.675656, 0.5058824, 0, 1, 1,
0.7449238, 1.52981, 0.3049783, 0.5137255, 0, 1, 1,
0.7465137, -0.08178623, 1.802092, 0.5176471, 0, 1, 1,
0.7490645, 0.5302219, 0.5155901, 0.5254902, 0, 1, 1,
0.7530806, 1.143853, 2.675904, 0.5294118, 0, 1, 1,
0.7543312, -0.6227086, 3.096986, 0.5372549, 0, 1, 1,
0.7615253, 0.5233934, 0.360072, 0.5411765, 0, 1, 1,
0.7624063, -1.389801, 3.308054, 0.5490196, 0, 1, 1,
0.7630528, -2.099963, 3.619291, 0.5529412, 0, 1, 1,
0.7647564, 0.9783574, 1.312954, 0.5607843, 0, 1, 1,
0.7734534, -0.3979302, 3.478482, 0.5647059, 0, 1, 1,
0.774913, -1.181103, 1.584263, 0.572549, 0, 1, 1,
0.7759607, -0.1027792, 0.3390391, 0.5764706, 0, 1, 1,
0.7783522, -0.1317961, 0.5718463, 0.5843138, 0, 1, 1,
0.7909771, -1.150702, 2.324744, 0.5882353, 0, 1, 1,
0.7921597, 0.1699241, 0.8060892, 0.5960785, 0, 1, 1,
0.7942595, 1.413323, 0.6251856, 0.6039216, 0, 1, 1,
0.7962962, 1.119412, 0.4730682, 0.6078432, 0, 1, 1,
0.796576, 1.230506, 0.4940776, 0.6156863, 0, 1, 1,
0.7974218, -0.01916163, 1.297971, 0.6196079, 0, 1, 1,
0.7999414, 1.681368, 2.00949, 0.627451, 0, 1, 1,
0.8097463, 0.4662811, 0.7596613, 0.6313726, 0, 1, 1,
0.8113982, -0.6989458, 1.739221, 0.6392157, 0, 1, 1,
0.8163994, 0.597638, 0.564485, 0.6431373, 0, 1, 1,
0.8204213, -0.225388, 1.479441, 0.6509804, 0, 1, 1,
0.82463, 1.151079, 0.2997172, 0.654902, 0, 1, 1,
0.8265143, -0.8426716, 3.410869, 0.6627451, 0, 1, 1,
0.8281156, 1.313626, 0.6938339, 0.6666667, 0, 1, 1,
0.8286437, -0.2146246, 1.811237, 0.6745098, 0, 1, 1,
0.832099, 0.6732041, 0.4254329, 0.6784314, 0, 1, 1,
0.8326126, -2.052816, 1.895042, 0.6862745, 0, 1, 1,
0.8358198, -0.07153182, 0.8013012, 0.6901961, 0, 1, 1,
0.8365862, -0.1478424, 0.130106, 0.6980392, 0, 1, 1,
0.84565, 0.6166955, 0.1913197, 0.7058824, 0, 1, 1,
0.8551374, 0.7390614, -0.97891, 0.7098039, 0, 1, 1,
0.8636027, -1.076286, 0.7764815, 0.7176471, 0, 1, 1,
0.8695469, -1.010852, 2.202456, 0.7215686, 0, 1, 1,
0.8744111, 1.758003, -1.32198, 0.7294118, 0, 1, 1,
0.875398, -0.09191331, 2.087282, 0.7333333, 0, 1, 1,
0.8769841, 0.801269, 0.7208486, 0.7411765, 0, 1, 1,
0.8770826, 0.2854872, -0.4351337, 0.7450981, 0, 1, 1,
0.8785849, -0.1456581, 1.771293, 0.7529412, 0, 1, 1,
0.8827394, -1.895556, 3.404468, 0.7568628, 0, 1, 1,
0.8850825, -0.1320592, 2.453778, 0.7647059, 0, 1, 1,
0.8864682, -0.7656875, 3.269249, 0.7686275, 0, 1, 1,
0.898618, 1.585883, 1.45119, 0.7764706, 0, 1, 1,
0.8986287, -0.5881072, 2.788823, 0.7803922, 0, 1, 1,
0.8997637, 1.65825, 0.869545, 0.7882353, 0, 1, 1,
0.9063845, -0.4322852, 2.237454, 0.7921569, 0, 1, 1,
0.9141507, -0.2955915, 2.455078, 0.8, 0, 1, 1,
0.9197563, -0.4643512, 1.292831, 0.8078431, 0, 1, 1,
0.9237722, -0.1261757, 1.714659, 0.8117647, 0, 1, 1,
0.9260221, 0.3467007, 1.094358, 0.8196079, 0, 1, 1,
0.9271026, -1.696408, 4.264204, 0.8235294, 0, 1, 1,
0.9273055, 0.3686432, 1.022927, 0.8313726, 0, 1, 1,
0.9281857, -0.400818, 1.409417, 0.8352941, 0, 1, 1,
0.9349928, 0.8176998, 0.1628276, 0.8431373, 0, 1, 1,
0.9383858, -0.4562684, 3.375713, 0.8470588, 0, 1, 1,
0.9385909, 1.583979, -0.3404057, 0.854902, 0, 1, 1,
0.9460835, 2.269434, 0.641587, 0.8588235, 0, 1, 1,
0.9466689, 0.8702085, 2.645706, 0.8666667, 0, 1, 1,
0.9521135, -0.3345999, 2.776399, 0.8705882, 0, 1, 1,
0.9532165, 0.5458882, -0.5143461, 0.8784314, 0, 1, 1,
0.9533162, -1.34197, 1.897633, 0.8823529, 0, 1, 1,
0.9552608, -1.010341, 2.716058, 0.8901961, 0, 1, 1,
0.9569432, 2.02475, -0.4882064, 0.8941177, 0, 1, 1,
0.9601319, -1.100192, 2.374404, 0.9019608, 0, 1, 1,
0.9607022, -0.04191038, 0.3997038, 0.9098039, 0, 1, 1,
0.964695, -0.3846769, 1.60537, 0.9137255, 0, 1, 1,
0.9704977, 0.2376829, 2.439499, 0.9215686, 0, 1, 1,
0.9720752, 0.344986, 1.494877, 0.9254902, 0, 1, 1,
0.973496, 0.4338617, 1.786948, 0.9333333, 0, 1, 1,
0.9878108, -0.1235259, 2.213202, 0.9372549, 0, 1, 1,
0.9909573, -0.08496512, 2.950552, 0.945098, 0, 1, 1,
0.9976189, 0.758782, 1.736238, 0.9490196, 0, 1, 1,
0.9978099, -1.390203, -0.001271785, 0.9568627, 0, 1, 1,
1.001015, -0.4025593, 1.4517, 0.9607843, 0, 1, 1,
1.002681, 0.08915306, 1.777719, 0.9686275, 0, 1, 1,
1.01345, -1.665705, 2.159954, 0.972549, 0, 1, 1,
1.017409, -0.6582977, 3.556199, 0.9803922, 0, 1, 1,
1.024041, -0.7734317, 1.953147, 0.9843137, 0, 1, 1,
1.024227, 0.9628552, 0.1726682, 0.9921569, 0, 1, 1,
1.027333, -0.6763043, 1.85236, 0.9960784, 0, 1, 1,
1.030549, 0.3561505, 0.9990203, 1, 0, 0.9960784, 1,
1.032707, 0.4316316, 1.458542, 1, 0, 0.9882353, 1,
1.045979, 1.875895, 0.5045236, 1, 0, 0.9843137, 1,
1.04772, 0.6025884, 1.546463, 1, 0, 0.9764706, 1,
1.05266, 0.6186407, 2.745947, 1, 0, 0.972549, 1,
1.055641, -1.364619, 1.005285, 1, 0, 0.9647059, 1,
1.058153, -0.2216914, 0.6447962, 1, 0, 0.9607843, 1,
1.059706, -0.2741198, 1.814754, 1, 0, 0.9529412, 1,
1.062589, 0.9078436, 1.446321, 1, 0, 0.9490196, 1,
1.070332, 2.021003, 0.7695231, 1, 0, 0.9411765, 1,
1.071972, -0.4278156, 1.953877, 1, 0, 0.9372549, 1,
1.086195, -1.559201, 3.009196, 1, 0, 0.9294118, 1,
1.094558, 1.05004, 1.192235, 1, 0, 0.9254902, 1,
1.09544, -0.4739115, 2.80385, 1, 0, 0.9176471, 1,
1.097327, 0.1181773, 0.3783114, 1, 0, 0.9137255, 1,
1.114619, -0.15864, 2.321815, 1, 0, 0.9058824, 1,
1.120719, -0.04497668, 0.4102478, 1, 0, 0.9019608, 1,
1.122146, 0.5338156, 1.019604, 1, 0, 0.8941177, 1,
1.124793, -0.6673514, 5.051926, 1, 0, 0.8862745, 1,
1.125515, 0.05431055, -0.5548974, 1, 0, 0.8823529, 1,
1.12569, 1.164465, 1.350392, 1, 0, 0.8745098, 1,
1.12652, 0.328497, 0.806887, 1, 0, 0.8705882, 1,
1.137376, 1.314991, 3.032299, 1, 0, 0.8627451, 1,
1.1446, 0.09784497, 1.957317, 1, 0, 0.8588235, 1,
1.146372, 0.002093678, 2.19465, 1, 0, 0.8509804, 1,
1.148857, -1.967878, 2.146177, 1, 0, 0.8470588, 1,
1.156397, 0.01155769, 2.538336, 1, 0, 0.8392157, 1,
1.158225, -1.381253, 2.60485, 1, 0, 0.8352941, 1,
1.159795, 0.7896608, -0.9487979, 1, 0, 0.827451, 1,
1.16287, -0.572283, 2.082395, 1, 0, 0.8235294, 1,
1.164502, 0.6199468, 1.026581, 1, 0, 0.8156863, 1,
1.165007, 2.438494, 1.447538, 1, 0, 0.8117647, 1,
1.165911, 1.433251, -0.6712536, 1, 0, 0.8039216, 1,
1.168092, -0.9370583, 0.9353933, 1, 0, 0.7960784, 1,
1.168731, -2.090377, 3.623936, 1, 0, 0.7921569, 1,
1.174875, -0.005334583, 0.06402094, 1, 0, 0.7843137, 1,
1.175792, -0.8978004, 4.357692, 1, 0, 0.7803922, 1,
1.178371, -0.8723058, 4.218538, 1, 0, 0.772549, 1,
1.185745, 1.699746, -0.01095602, 1, 0, 0.7686275, 1,
1.190066, 0.8202844, 1.360108, 1, 0, 0.7607843, 1,
1.195748, -0.6483254, 1.770697, 1, 0, 0.7568628, 1,
1.19769, 1.088615, -0.04754819, 1, 0, 0.7490196, 1,
1.203775, -0.3322017, 1.690271, 1, 0, 0.7450981, 1,
1.210972, -1.441608, 2.445609, 1, 0, 0.7372549, 1,
1.214906, 0.05722644, -1.088512, 1, 0, 0.7333333, 1,
1.219614, 1.209772, 2.09301, 1, 0, 0.7254902, 1,
1.221252, -0.4255617, 0.2561679, 1, 0, 0.7215686, 1,
1.245716, 0.6646854, 0.9097068, 1, 0, 0.7137255, 1,
1.245931, -0.02454395, 1.302575, 1, 0, 0.7098039, 1,
1.248701, -1.198702, 2.924869, 1, 0, 0.7019608, 1,
1.249888, -0.4983588, 1.886558, 1, 0, 0.6941177, 1,
1.252061, -0.5604053, 1.3138, 1, 0, 0.6901961, 1,
1.254341, 0.6190954, -0.5608292, 1, 0, 0.682353, 1,
1.258913, -0.2091874, 0.7110279, 1, 0, 0.6784314, 1,
1.265453, -0.1059579, 2.173002, 1, 0, 0.6705883, 1,
1.26903, -1.070683, 2.184822, 1, 0, 0.6666667, 1,
1.275843, 0.176073, 0.6931072, 1, 0, 0.6588235, 1,
1.277549, 0.356156, 2.152281, 1, 0, 0.654902, 1,
1.290168, 0.4002762, 2.263363, 1, 0, 0.6470588, 1,
1.29218, -0.02135793, 2.025404, 1, 0, 0.6431373, 1,
1.298125, -0.550396, 2.073823, 1, 0, 0.6352941, 1,
1.303441, -0.2048754, 3.005575, 1, 0, 0.6313726, 1,
1.315582, 0.5956892, 0.3367774, 1, 0, 0.6235294, 1,
1.320158, 0.2460848, 1.700209, 1, 0, 0.6196079, 1,
1.32702, -0.3137901, 2.753527, 1, 0, 0.6117647, 1,
1.337088, 0.8266881, 0.7754503, 1, 0, 0.6078432, 1,
1.346681, -0.001233599, 5.257442, 1, 0, 0.6, 1,
1.356137, 0.3441333, 3.11542, 1, 0, 0.5921569, 1,
1.362721, -1.121414, 1.637661, 1, 0, 0.5882353, 1,
1.371377, -0.646486, 2.642688, 1, 0, 0.5803922, 1,
1.387227, -0.8405164, 1.685326, 1, 0, 0.5764706, 1,
1.387706, -1.610355, 0.04865882, 1, 0, 0.5686275, 1,
1.390917, -1.485859, 1.229995, 1, 0, 0.5647059, 1,
1.395414, 1.07584, 1.124089, 1, 0, 0.5568628, 1,
1.410093, -0.09047219, 1.913097, 1, 0, 0.5529412, 1,
1.422095, 0.6565297, 0.5845434, 1, 0, 0.5450981, 1,
1.42374, -0.5326391, 1.485223, 1, 0, 0.5411765, 1,
1.432185, -0.4671142, 0.9354835, 1, 0, 0.5333334, 1,
1.432474, -0.4051425, 1.386555, 1, 0, 0.5294118, 1,
1.449774, -0.9268107, 0.2725763, 1, 0, 0.5215687, 1,
1.460473, 1.239179, -0.215663, 1, 0, 0.5176471, 1,
1.464321, 0.7717916, 2.303368, 1, 0, 0.509804, 1,
1.466748, -0.4870451, 3.657896, 1, 0, 0.5058824, 1,
1.476476, 0.2752586, 1.107878, 1, 0, 0.4980392, 1,
1.476875, 0.6162058, -0.1563675, 1, 0, 0.4901961, 1,
1.478763, 0.08720295, 1.540253, 1, 0, 0.4862745, 1,
1.479224, 0.3634437, 2.791995, 1, 0, 0.4784314, 1,
1.479496, -1.16147, 1.31928, 1, 0, 0.4745098, 1,
1.479728, 0.2792961, 0.4512135, 1, 0, 0.4666667, 1,
1.488587, 0.1395572, 0.365717, 1, 0, 0.4627451, 1,
1.488725, -0.4943811, 1.330755, 1, 0, 0.454902, 1,
1.489705, -0.4712853, 0.1285622, 1, 0, 0.4509804, 1,
1.502809, -0.3776969, 1.66099, 1, 0, 0.4431373, 1,
1.503456, -0.8770178, 2.355174, 1, 0, 0.4392157, 1,
1.506633, -0.4407416, 1.923883, 1, 0, 0.4313726, 1,
1.506854, -0.4043191, 0.905938, 1, 0, 0.427451, 1,
1.520206, 0.4871956, 0.6404226, 1, 0, 0.4196078, 1,
1.523759, 0.5934697, 0.8054228, 1, 0, 0.4156863, 1,
1.524347, 0.7870523, 0.4782918, 1, 0, 0.4078431, 1,
1.527887, -0.8266863, 2.037791, 1, 0, 0.4039216, 1,
1.552098, -0.7335865, 1.970638, 1, 0, 0.3960784, 1,
1.578145, -0.3475339, 1.643416, 1, 0, 0.3882353, 1,
1.580637, 0.08606927, 2.045692, 1, 0, 0.3843137, 1,
1.58568, 2.353591, 0.8838909, 1, 0, 0.3764706, 1,
1.586121, 0.3700016, 1.154028, 1, 0, 0.372549, 1,
1.586133, -1.257399, 1.155727, 1, 0, 0.3647059, 1,
1.595016, 0.575026, -0.4873433, 1, 0, 0.3607843, 1,
1.607873, -0.7870927, 1.89084, 1, 0, 0.3529412, 1,
1.632827, -1.065618, 2.853288, 1, 0, 0.3490196, 1,
1.640236, -1.125244, 1.039203, 1, 0, 0.3411765, 1,
1.649233, 0.2280647, 2.40154, 1, 0, 0.3372549, 1,
1.667766, 0.1234723, 0.3169685, 1, 0, 0.3294118, 1,
1.680322, 0.2402039, 1.39526, 1, 0, 0.3254902, 1,
1.681533, 0.4651897, 3.721742, 1, 0, 0.3176471, 1,
1.681906, -2.114127, 1.323415, 1, 0, 0.3137255, 1,
1.682006, 1.064049, 1.584466, 1, 0, 0.3058824, 1,
1.695348, 0.5771656, 0.8097745, 1, 0, 0.2980392, 1,
1.696749, 0.9566059, 0.8176833, 1, 0, 0.2941177, 1,
1.69762, -0.262371, 2.236276, 1, 0, 0.2862745, 1,
1.726393, -0.031127, 1.268723, 1, 0, 0.282353, 1,
1.733204, 1.219977, 0.3583508, 1, 0, 0.2745098, 1,
1.73781, -1.74769, 2.761554, 1, 0, 0.2705882, 1,
1.754831, 2.552753, -0.6322612, 1, 0, 0.2627451, 1,
1.767288, 0.8662189, 3.166176, 1, 0, 0.2588235, 1,
1.768357, -0.3184349, 0.1887548, 1, 0, 0.2509804, 1,
1.770434, -0.5867574, 0.9870169, 1, 0, 0.2470588, 1,
1.778168, -1.109132, 3.254102, 1, 0, 0.2392157, 1,
1.781032, -0.2344102, 2.132066, 1, 0, 0.2352941, 1,
1.802629, 0.7577887, 0.333277, 1, 0, 0.227451, 1,
1.805821, 0.7905462, 3.191908, 1, 0, 0.2235294, 1,
1.82839, 0.8206496, 2.06302, 1, 0, 0.2156863, 1,
1.836212, 1.526531, 0.9330461, 1, 0, 0.2117647, 1,
1.884159, 1.196446, -0.5298287, 1, 0, 0.2039216, 1,
1.885543, 1.689171, 0.09145815, 1, 0, 0.1960784, 1,
1.897137, -0.3918013, 2.136099, 1, 0, 0.1921569, 1,
1.898716, -2.23816, 1.04862, 1, 0, 0.1843137, 1,
1.917839, 0.9151019, 2.794327, 1, 0, 0.1803922, 1,
1.925102, -0.798583, 3.511131, 1, 0, 0.172549, 1,
1.941402, 0.6003179, -0.3348175, 1, 0, 0.1686275, 1,
1.952234, -1.518284, 2.85552, 1, 0, 0.1607843, 1,
1.96297, 0.6675578, 0.7910143, 1, 0, 0.1568628, 1,
2.059665, 0.405706, 1.419001, 1, 0, 0.1490196, 1,
2.073797, 0.1420339, 1.77512, 1, 0, 0.145098, 1,
2.080905, 0.4576445, 1.858449, 1, 0, 0.1372549, 1,
2.087162, -1.120137, 2.323199, 1, 0, 0.1333333, 1,
2.096652, -0.9465155, 0.5687646, 1, 0, 0.1254902, 1,
2.101553, 0.05543156, 2.478759, 1, 0, 0.1215686, 1,
2.137138, 0.8267977, 0.7438668, 1, 0, 0.1137255, 1,
2.148036, -1.02523, 3.141046, 1, 0, 0.1098039, 1,
2.173321, 0.5863514, 2.07756, 1, 0, 0.1019608, 1,
2.17359, 0.2141195, 3.570744, 1, 0, 0.09411765, 1,
2.184474, 0.014798, 1.645101, 1, 0, 0.09019608, 1,
2.231997, -0.4352289, 3.521057, 1, 0, 0.08235294, 1,
2.329726, -2.129084, 2.169316, 1, 0, 0.07843138, 1,
2.335624, -1.025325, 1.463741, 1, 0, 0.07058824, 1,
2.394531, 0.476704, 0.3169243, 1, 0, 0.06666667, 1,
2.42929, 0.09750267, 2.243073, 1, 0, 0.05882353, 1,
2.442264, 0.1067242, 1.790577, 1, 0, 0.05490196, 1,
2.541124, -0.9044751, 2.785583, 1, 0, 0.04705882, 1,
2.547306, -0.8961934, 3.215348, 1, 0, 0.04313726, 1,
2.589001, -0.5854068, 2.57739, 1, 0, 0.03529412, 1,
2.625782, -1.070929, 2.401513, 1, 0, 0.03137255, 1,
2.685906, -0.7599905, 0.8951499, 1, 0, 0.02352941, 1,
3.016379, 0.9876797, 1.967127, 1, 0, 0.01960784, 1,
3.082036, -0.8773813, 0.9750422, 1, 0, 0.01176471, 1,
3.097523, -0.08567799, -0.4088551, 1, 0, 0.007843138, 1
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
-0.1512609, -4.346771, -7.235546, 0, -0.5, 0.5, 0.5,
-0.1512609, -4.346771, -7.235546, 1, -0.5, 0.5, 0.5,
-0.1512609, -4.346771, -7.235546, 1, 1.5, 0.5, 0.5,
-0.1512609, -4.346771, -7.235546, 0, 1.5, 0.5, 0.5
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
-4.501382, -0.3970224, -7.235546, 0, -0.5, 0.5, 0.5,
-4.501382, -0.3970224, -7.235546, 1, -0.5, 0.5, 0.5,
-4.501382, -0.3970224, -7.235546, 1, 1.5, 0.5, 0.5,
-4.501382, -0.3970224, -7.235546, 0, 1.5, 0.5, 0.5
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
-4.501382, -4.346771, 0.2117946, 0, -0.5, 0.5, 0.5,
-4.501382, -4.346771, 0.2117946, 1, -0.5, 0.5, 0.5,
-4.501382, -4.346771, 0.2117946, 1, 1.5, 0.5, 0.5,
-4.501382, -4.346771, 0.2117946, 0, 1.5, 0.5, 0.5
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
-3, -3.435291, -5.516929,
3, -3.435291, -5.516929,
-3, -3.435291, -5.516929,
-3, -3.587204, -5.803365,
-2, -3.435291, -5.516929,
-2, -3.587204, -5.803365,
-1, -3.435291, -5.516929,
-1, -3.587204, -5.803365,
0, -3.435291, -5.516929,
0, -3.587204, -5.803365,
1, -3.435291, -5.516929,
1, -3.587204, -5.803365,
2, -3.435291, -5.516929,
2, -3.587204, -5.803365,
3, -3.435291, -5.516929,
3, -3.587204, -5.803365
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
-3, -3.891031, -6.376237, 0, -0.5, 0.5, 0.5,
-3, -3.891031, -6.376237, 1, -0.5, 0.5, 0.5,
-3, -3.891031, -6.376237, 1, 1.5, 0.5, 0.5,
-3, -3.891031, -6.376237, 0, 1.5, 0.5, 0.5,
-2, -3.891031, -6.376237, 0, -0.5, 0.5, 0.5,
-2, -3.891031, -6.376237, 1, -0.5, 0.5, 0.5,
-2, -3.891031, -6.376237, 1, 1.5, 0.5, 0.5,
-2, -3.891031, -6.376237, 0, 1.5, 0.5, 0.5,
-1, -3.891031, -6.376237, 0, -0.5, 0.5, 0.5,
-1, -3.891031, -6.376237, 1, -0.5, 0.5, 0.5,
-1, -3.891031, -6.376237, 1, 1.5, 0.5, 0.5,
-1, -3.891031, -6.376237, 0, 1.5, 0.5, 0.5,
0, -3.891031, -6.376237, 0, -0.5, 0.5, 0.5,
0, -3.891031, -6.376237, 1, -0.5, 0.5, 0.5,
0, -3.891031, -6.376237, 1, 1.5, 0.5, 0.5,
0, -3.891031, -6.376237, 0, 1.5, 0.5, 0.5,
1, -3.891031, -6.376237, 0, -0.5, 0.5, 0.5,
1, -3.891031, -6.376237, 1, -0.5, 0.5, 0.5,
1, -3.891031, -6.376237, 1, 1.5, 0.5, 0.5,
1, -3.891031, -6.376237, 0, 1.5, 0.5, 0.5,
2, -3.891031, -6.376237, 0, -0.5, 0.5, 0.5,
2, -3.891031, -6.376237, 1, -0.5, 0.5, 0.5,
2, -3.891031, -6.376237, 1, 1.5, 0.5, 0.5,
2, -3.891031, -6.376237, 0, 1.5, 0.5, 0.5,
3, -3.891031, -6.376237, 0, -0.5, 0.5, 0.5,
3, -3.891031, -6.376237, 1, -0.5, 0.5, 0.5,
3, -3.891031, -6.376237, 1, 1.5, 0.5, 0.5,
3, -3.891031, -6.376237, 0, 1.5, 0.5, 0.5
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
-3.497508, -3, -5.516929,
-3.497508, 2, -5.516929,
-3.497508, -3, -5.516929,
-3.664821, -3, -5.803365,
-3.497508, -2, -5.516929,
-3.664821, -2, -5.803365,
-3.497508, -1, -5.516929,
-3.664821, -1, -5.803365,
-3.497508, 0, -5.516929,
-3.664821, 0, -5.803365,
-3.497508, 1, -5.516929,
-3.664821, 1, -5.803365,
-3.497508, 2, -5.516929,
-3.664821, 2, -5.803365
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
-3.999445, -3, -6.376237, 0, -0.5, 0.5, 0.5,
-3.999445, -3, -6.376237, 1, -0.5, 0.5, 0.5,
-3.999445, -3, -6.376237, 1, 1.5, 0.5, 0.5,
-3.999445, -3, -6.376237, 0, 1.5, 0.5, 0.5,
-3.999445, -2, -6.376237, 0, -0.5, 0.5, 0.5,
-3.999445, -2, -6.376237, 1, -0.5, 0.5, 0.5,
-3.999445, -2, -6.376237, 1, 1.5, 0.5, 0.5,
-3.999445, -2, -6.376237, 0, 1.5, 0.5, 0.5,
-3.999445, -1, -6.376237, 0, -0.5, 0.5, 0.5,
-3.999445, -1, -6.376237, 1, -0.5, 0.5, 0.5,
-3.999445, -1, -6.376237, 1, 1.5, 0.5, 0.5,
-3.999445, -1, -6.376237, 0, 1.5, 0.5, 0.5,
-3.999445, 0, -6.376237, 0, -0.5, 0.5, 0.5,
-3.999445, 0, -6.376237, 1, -0.5, 0.5, 0.5,
-3.999445, 0, -6.376237, 1, 1.5, 0.5, 0.5,
-3.999445, 0, -6.376237, 0, 1.5, 0.5, 0.5,
-3.999445, 1, -6.376237, 0, -0.5, 0.5, 0.5,
-3.999445, 1, -6.376237, 1, -0.5, 0.5, 0.5,
-3.999445, 1, -6.376237, 1, 1.5, 0.5, 0.5,
-3.999445, 1, -6.376237, 0, 1.5, 0.5, 0.5,
-3.999445, 2, -6.376237, 0, -0.5, 0.5, 0.5,
-3.999445, 2, -6.376237, 1, -0.5, 0.5, 0.5,
-3.999445, 2, -6.376237, 1, 1.5, 0.5, 0.5,
-3.999445, 2, -6.376237, 0, 1.5, 0.5, 0.5
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
-3.497508, -3.435291, -4,
-3.497508, -3.435291, 4,
-3.497508, -3.435291, -4,
-3.664821, -3.587204, -4,
-3.497508, -3.435291, -2,
-3.664821, -3.587204, -2,
-3.497508, -3.435291, 0,
-3.664821, -3.587204, 0,
-3.497508, -3.435291, 2,
-3.664821, -3.587204, 2,
-3.497508, -3.435291, 4,
-3.664821, -3.587204, 4
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
-3.999445, -3.891031, -4, 0, -0.5, 0.5, 0.5,
-3.999445, -3.891031, -4, 1, -0.5, 0.5, 0.5,
-3.999445, -3.891031, -4, 1, 1.5, 0.5, 0.5,
-3.999445, -3.891031, -4, 0, 1.5, 0.5, 0.5,
-3.999445, -3.891031, -2, 0, -0.5, 0.5, 0.5,
-3.999445, -3.891031, -2, 1, -0.5, 0.5, 0.5,
-3.999445, -3.891031, -2, 1, 1.5, 0.5, 0.5,
-3.999445, -3.891031, -2, 0, 1.5, 0.5, 0.5,
-3.999445, -3.891031, 0, 0, -0.5, 0.5, 0.5,
-3.999445, -3.891031, 0, 1, -0.5, 0.5, 0.5,
-3.999445, -3.891031, 0, 1, 1.5, 0.5, 0.5,
-3.999445, -3.891031, 0, 0, 1.5, 0.5, 0.5,
-3.999445, -3.891031, 2, 0, -0.5, 0.5, 0.5,
-3.999445, -3.891031, 2, 1, -0.5, 0.5, 0.5,
-3.999445, -3.891031, 2, 1, 1.5, 0.5, 0.5,
-3.999445, -3.891031, 2, 0, 1.5, 0.5, 0.5,
-3.999445, -3.891031, 4, 0, -0.5, 0.5, 0.5,
-3.999445, -3.891031, 4, 1, -0.5, 0.5, 0.5,
-3.999445, -3.891031, 4, 1, 1.5, 0.5, 0.5,
-3.999445, -3.891031, 4, 0, 1.5, 0.5, 0.5
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
-3.497508, -3.435291, -5.516929,
-3.497508, 2.641246, -5.516929,
-3.497508, -3.435291, 5.940518,
-3.497508, 2.641246, 5.940518,
-3.497508, -3.435291, -5.516929,
-3.497508, -3.435291, 5.940518,
-3.497508, 2.641246, -5.516929,
-3.497508, 2.641246, 5.940518,
-3.497508, -3.435291, -5.516929,
3.194987, -3.435291, -5.516929,
-3.497508, -3.435291, 5.940518,
3.194987, -3.435291, 5.940518,
-3.497508, 2.641246, -5.516929,
3.194987, 2.641246, -5.516929,
-3.497508, 2.641246, 5.940518,
3.194987, 2.641246, 5.940518,
3.194987, -3.435291, -5.516929,
3.194987, 2.641246, -5.516929,
3.194987, -3.435291, 5.940518,
3.194987, 2.641246, 5.940518,
3.194987, -3.435291, -5.516929,
3.194987, -3.435291, 5.940518,
3.194987, 2.641246, -5.516929,
3.194987, 2.641246, 5.940518
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
var radius = 7.79295;
var distance = 34.67171;
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
mvMatrix.translate( 0.1512609, 0.3970224, -0.2117946 );
mvMatrix.scale( 1.259006, 1.386627, 0.7354073 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.67171);
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
InChI_1S_C19H17Cl2N3<-read.table("InChI_1S_C19H17Cl2N3.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C19H17Cl2N3$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C19H17Cl2N3' not found
```

```r
y<-InChI_1S_C19H17Cl2N3$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C19H17Cl2N3' not found
```

```r
z<-InChI_1S_C19H17Cl2N3$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C19H17Cl2N3' not found
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
-3.400045, 1.854832, 1.300367, 0, 0, 1, 1, 1,
-3.335493, -0.08342076, -1.481966, 1, 0, 0, 1, 1,
-2.909365, 0.01846363, 0.4459267, 1, 0, 0, 1, 1,
-2.656162, -0.3974006, -2.773477, 1, 0, 0, 1, 1,
-2.468362, 0.7905514, -0.9144688, 1, 0, 0, 1, 1,
-2.384462, -1.39193, -2.771775, 1, 0, 0, 1, 1,
-2.363002, -0.8898858, -0.9953598, 0, 0, 0, 1, 1,
-2.309173, -0.7730302, -3.611068, 0, 0, 0, 1, 1,
-2.266645, -0.09841388, -0.2270211, 0, 0, 0, 1, 1,
-2.208675, 0.7968854, -0.04048355, 0, 0, 0, 1, 1,
-2.18465, 1.783382, -1.284536, 0, 0, 0, 1, 1,
-2.180339, 0.4196938, -2.403337, 0, 0, 0, 1, 1,
-2.167394, 0.008868526, -2.440517, 0, 0, 0, 1, 1,
-2.163512, 1.194383, -1.953352, 1, 1, 1, 1, 1,
-2.153186, 0.5189301, -2.464562, 1, 1, 1, 1, 1,
-2.152303, -0.06454475, -1.837439, 1, 1, 1, 1, 1,
-2.146307, -0.5898059, -2.059047, 1, 1, 1, 1, 1,
-2.140472, 1.9325, -0.4029399, 1, 1, 1, 1, 1,
-2.116845, 0.01956691, 0.5965306, 1, 1, 1, 1, 1,
-2.113711, -0.08043584, -2.174153, 1, 1, 1, 1, 1,
-2.111448, -1.44036, -2.41307, 1, 1, 1, 1, 1,
-2.040691, -0.7963083, -0.6770747, 1, 1, 1, 1, 1,
-2.028728, -1.979043, -0.5488126, 1, 1, 1, 1, 1,
-1.98622, 2.018652, -0.1699639, 1, 1, 1, 1, 1,
-1.978339, -0.4389054, -1.035534, 1, 1, 1, 1, 1,
-1.954089, -1.194284, -2.397217, 1, 1, 1, 1, 1,
-1.952899, 1.404958, -0.9139698, 1, 1, 1, 1, 1,
-1.944147, -0.4216484, -2.634831, 1, 1, 1, 1, 1,
-1.928673, -0.01521534, -0.2134162, 0, 0, 1, 1, 1,
-1.906521, 0.9498197, -1.798697, 1, 0, 0, 1, 1,
-1.905676, 1.156573, -1.370359, 1, 0, 0, 1, 1,
-1.873772, -0.03071395, -3.641143, 1, 0, 0, 1, 1,
-1.865431, -0.6632274, -2.946188, 1, 0, 0, 1, 1,
-1.860117, 0.7547513, -2.138062, 1, 0, 0, 1, 1,
-1.838905, 1.186428, -1.569362, 0, 0, 0, 1, 1,
-1.834163, 0.387667, -2.794614, 0, 0, 0, 1, 1,
-1.817223, 0.6521217, -0.8527407, 0, 0, 0, 1, 1,
-1.789777, 0.2239722, -0.1919253, 0, 0, 0, 1, 1,
-1.784777, -0.1174977, -3.828253, 0, 0, 0, 1, 1,
-1.784309, 1.163972, -2.074163, 0, 0, 0, 1, 1,
-1.757175, 0.1428517, -3.305551, 0, 0, 0, 1, 1,
-1.75365, 0.2610835, 0.8356053, 1, 1, 1, 1, 1,
-1.744191, -0.2640983, -2.09672, 1, 1, 1, 1, 1,
-1.737116, -1.068639, -1.047272, 1, 1, 1, 1, 1,
-1.723301, 0.3838786, -3.327127, 1, 1, 1, 1, 1,
-1.717254, -0.270312, 0.3847439, 1, 1, 1, 1, 1,
-1.71515, 0.1428488, -2.013835, 1, 1, 1, 1, 1,
-1.714465, 0.5204531, -2.326706, 1, 1, 1, 1, 1,
-1.707252, 0.8269544, -0.1898724, 1, 1, 1, 1, 1,
-1.70548, 0.436819, -3.629264, 1, 1, 1, 1, 1,
-1.704746, 0.5745238, -0.9064847, 1, 1, 1, 1, 1,
-1.70195, 0.4004133, -1.836235, 1, 1, 1, 1, 1,
-1.675113, -0.6291497, -3.050026, 1, 1, 1, 1, 1,
-1.671712, -0.40597, -0.9198223, 1, 1, 1, 1, 1,
-1.668979, 0.1675248, -1.195143, 1, 1, 1, 1, 1,
-1.660013, 0.6191924, -1.869289, 1, 1, 1, 1, 1,
-1.651373, 0.2950863, 0.8910786, 0, 0, 1, 1, 1,
-1.650046, -0.1870629, -0.2229827, 1, 0, 0, 1, 1,
-1.614259, 0.3292007, -1.632274, 1, 0, 0, 1, 1,
-1.596565, 1.014992, -1.589768, 1, 0, 0, 1, 1,
-1.594742, 1.137054, -1.711212, 1, 0, 0, 1, 1,
-1.584718, -1.132824, -3.088242, 1, 0, 0, 1, 1,
-1.576984, 0.5507372, 0.1039162, 0, 0, 0, 1, 1,
-1.569068, 1.89364, -1.299872, 0, 0, 0, 1, 1,
-1.561921, 0.251984, -0.870078, 0, 0, 0, 1, 1,
-1.561131, -1.486583, -0.97175, 0, 0, 0, 1, 1,
-1.561036, -0.2367308, -1.35665, 0, 0, 0, 1, 1,
-1.557682, 0.253211, -2.867944, 0, 0, 0, 1, 1,
-1.54868, 0.7254018, -0.3113734, 0, 0, 0, 1, 1,
-1.531233, 1.890833, -2.356823, 1, 1, 1, 1, 1,
-1.530991, -1.651885, -2.824416, 1, 1, 1, 1, 1,
-1.512693, -1.348924, -1.009206, 1, 1, 1, 1, 1,
-1.508756, -0.8157326, -2.117582, 1, 1, 1, 1, 1,
-1.494481, 0.364682, -1.100415, 1, 1, 1, 1, 1,
-1.488622, 0.7683984, -0.8026984, 1, 1, 1, 1, 1,
-1.471284, -0.1217616, -2.171558, 1, 1, 1, 1, 1,
-1.464654, -0.7279307, -1.351153, 1, 1, 1, 1, 1,
-1.459879, -1.714242, -1.735546, 1, 1, 1, 1, 1,
-1.458559, -0.9232194, -0.2287008, 1, 1, 1, 1, 1,
-1.456531, 0.396712, -0.2124525, 1, 1, 1, 1, 1,
-1.440145, 1.379548, 0.009817664, 1, 1, 1, 1, 1,
-1.437927, 0.3490279, -1.027486, 1, 1, 1, 1, 1,
-1.437255, 1.164239, -0.7991273, 1, 1, 1, 1, 1,
-1.436573, -2.070422, -2.06259, 1, 1, 1, 1, 1,
-1.426908, 0.7025431, -1.031557, 0, 0, 1, 1, 1,
-1.425577, -0.2941014, -2.703975, 1, 0, 0, 1, 1,
-1.423794, -0.6303119, -3.093865, 1, 0, 0, 1, 1,
-1.422166, 0.0187242, -1.585858, 1, 0, 0, 1, 1,
-1.420444, -0.1275909, -2.303135, 1, 0, 0, 1, 1,
-1.420073, -1.541376, -2.1981, 1, 0, 0, 1, 1,
-1.418952, -0.9433097, -3.192373, 0, 0, 0, 1, 1,
-1.400651, 0.8660464, -2.149505, 0, 0, 0, 1, 1,
-1.395224, -0.7995542, -2.390394, 0, 0, 0, 1, 1,
-1.393469, -0.207049, -2.538613, 0, 0, 0, 1, 1,
-1.391309, -1.954859, -3.281371, 0, 0, 0, 1, 1,
-1.376599, 1.013286, -1.204485, 0, 0, 0, 1, 1,
-1.375266, 0.9805464, -1.417035, 0, 0, 0, 1, 1,
-1.360686, 0.6969157, -1.549348, 1, 1, 1, 1, 1,
-1.360587, 0.3179419, -1.353501, 1, 1, 1, 1, 1,
-1.353921, -1.191082, -1.021387, 1, 1, 1, 1, 1,
-1.35163, 1.300022, -0.6064068, 1, 1, 1, 1, 1,
-1.349546, 0.4746775, -1.864501, 1, 1, 1, 1, 1,
-1.341319, 0.7110082, -1.821487, 1, 1, 1, 1, 1,
-1.335361, 0.4875806, -1.657026, 1, 1, 1, 1, 1,
-1.333005, 0.7659335, 0.5685055, 1, 1, 1, 1, 1,
-1.332434, -0.00869783, -1.921584, 1, 1, 1, 1, 1,
-1.321126, 0.05631049, -1.428555, 1, 1, 1, 1, 1,
-1.321054, 0.8291975, -0.456055, 1, 1, 1, 1, 1,
-1.32079, -0.4596388, -1.019678, 1, 1, 1, 1, 1,
-1.318791, -0.4545403, -2.471571, 1, 1, 1, 1, 1,
-1.305026, -1.427279, -3.588521, 1, 1, 1, 1, 1,
-1.302556, -1.70039, -2.101145, 1, 1, 1, 1, 1,
-1.300344, 1.031686, -2.314659, 0, 0, 1, 1, 1,
-1.28004, -1.169406, -3.249175, 1, 0, 0, 1, 1,
-1.278849, -2.806317, -2.908859, 1, 0, 0, 1, 1,
-1.260167, -0.3954592, -2.815748, 1, 0, 0, 1, 1,
-1.254805, -0.8957557, -3.261466, 1, 0, 0, 1, 1,
-1.246976, 0.9078258, -0.03137183, 1, 0, 0, 1, 1,
-1.242297, -0.3660361, -2.625218, 0, 0, 0, 1, 1,
-1.23627, 1.05829, -1.183812, 0, 0, 0, 1, 1,
-1.235152, -0.05690179, -1.136258, 0, 0, 0, 1, 1,
-1.22853, 0.4808757, -0.5504739, 0, 0, 0, 1, 1,
-1.227163, -0.5604011, -3.196412, 0, 0, 0, 1, 1,
-1.220872, 0.014293, 0.03569895, 0, 0, 0, 1, 1,
-1.219078, -0.575666, -1.609825, 0, 0, 0, 1, 1,
-1.2183, 1.019871, 0.6184202, 1, 1, 1, 1, 1,
-1.210779, 1.089526, 0.2535875, 1, 1, 1, 1, 1,
-1.190108, 0.6566762, -1.133801, 1, 1, 1, 1, 1,
-1.184577, -1.871968, -3.056772, 1, 1, 1, 1, 1,
-1.183986, -0.01242601, -1.201612, 1, 1, 1, 1, 1,
-1.183406, -0.9649642, 0.1799792, 1, 1, 1, 1, 1,
-1.182569, 0.1605307, -1.690963, 1, 1, 1, 1, 1,
-1.158464, 1.853297, 0.6754436, 1, 1, 1, 1, 1,
-1.157518, -0.8252033, -1.514552, 1, 1, 1, 1, 1,
-1.152383, 0.3224573, -1.644088, 1, 1, 1, 1, 1,
-1.147232, 0.1878863, -1.787905, 1, 1, 1, 1, 1,
-1.145548, -1.079939, -1.900621, 1, 1, 1, 1, 1,
-1.138726, 0.604587, 0.524758, 1, 1, 1, 1, 1,
-1.131873, -0.2863152, -0.1751204, 1, 1, 1, 1, 1,
-1.128604, 0.5007605, -1.612134, 1, 1, 1, 1, 1,
-1.126568, 0.3498184, -0.9786444, 0, 0, 1, 1, 1,
-1.118595, -1.13933, -1.200039, 1, 0, 0, 1, 1,
-1.118475, 0.541564, -1.648866, 1, 0, 0, 1, 1,
-1.111313, 0.02480743, -1.027205, 1, 0, 0, 1, 1,
-1.110734, 0.1568852, -1.304682, 1, 0, 0, 1, 1,
-1.106004, -2.021395, -0.4056954, 1, 0, 0, 1, 1,
-1.10525, -0.5678492, -2.316229, 0, 0, 0, 1, 1,
-1.102682, -0.01053343, -1.242514, 0, 0, 0, 1, 1,
-1.10252, 1.621117, -0.2509041, 0, 0, 0, 1, 1,
-1.100956, 0.05541139, -1.163688, 0, 0, 0, 1, 1,
-1.096138, 1.098793, -1.722476, 0, 0, 0, 1, 1,
-1.094939, 1.024585, 1.270759, 0, 0, 0, 1, 1,
-1.093943, 0.9897572, -2.178443, 0, 0, 0, 1, 1,
-1.093421, 1.239217, -1.771235, 1, 1, 1, 1, 1,
-1.093271, -0.5446256, -2.197902, 1, 1, 1, 1, 1,
-1.088266, 0.05787019, -1.223211, 1, 1, 1, 1, 1,
-1.075344, -0.2460562, -2.920345, 1, 1, 1, 1, 1,
-1.074996, -0.7073396, -2.697566, 1, 1, 1, 1, 1,
-1.073112, -2.282789, -3.372362, 1, 1, 1, 1, 1,
-1.069043, 0.4600247, -0.1146119, 1, 1, 1, 1, 1,
-1.068671, -1.060396, -3.884817, 1, 1, 1, 1, 1,
-1.064288, 0.5954563, 0.3095467, 1, 1, 1, 1, 1,
-1.063571, 0.9383305, -0.4043103, 1, 1, 1, 1, 1,
-1.061499, 0.9371524, 0.7605215, 1, 1, 1, 1, 1,
-1.060163, 0.06436071, -1.19704, 1, 1, 1, 1, 1,
-1.057195, -0.3721214, -1.191534, 1, 1, 1, 1, 1,
-1.053344, 0.5070239, -1.846323, 1, 1, 1, 1, 1,
-1.046465, 0.2890585, 0.02463143, 1, 1, 1, 1, 1,
-1.042463, -0.6156496, -1.319975, 0, 0, 1, 1, 1,
-1.039424, 1.001917, -0.4221525, 1, 0, 0, 1, 1,
-1.034805, -0.999, -1.822933, 1, 0, 0, 1, 1,
-1.03098, 0.06643999, -1.631199, 1, 0, 0, 1, 1,
-1.030516, 0.7574774, -0.7217971, 1, 0, 0, 1, 1,
-1.021292, 0.8047059, -1.692859, 1, 0, 0, 1, 1,
-1.020288, -0.08864924, -0.07655312, 0, 0, 0, 1, 1,
-1.018447, 1.728512, 0.5219672, 0, 0, 0, 1, 1,
-1.015577, 0.8452331, -0.6059791, 0, 0, 0, 1, 1,
-1.011575, -0.2717328, -1.545035, 0, 0, 0, 1, 1,
-1.010161, 2.53582, -0.6365029, 0, 0, 0, 1, 1,
-1.009917, -0.6280951, -3.312608, 0, 0, 0, 1, 1,
-1.009435, -1.263479, -2.344032, 0, 0, 0, 1, 1,
-0.9970872, 0.1622534, -2.903677, 1, 1, 1, 1, 1,
-0.9881999, 0.9703615, 0.2735568, 1, 1, 1, 1, 1,
-0.9827598, -0.04161593, -3.329477, 1, 1, 1, 1, 1,
-0.9765183, -0.5978987, -4.557308, 1, 1, 1, 1, 1,
-0.9530379, -0.8600622, -2.371398, 1, 1, 1, 1, 1,
-0.9500304, 0.9226608, -2.04416, 1, 1, 1, 1, 1,
-0.9399445, -0.7297435, -2.920311, 1, 1, 1, 1, 1,
-0.9380445, -0.806147, -2.21668, 1, 1, 1, 1, 1,
-0.9322224, 1.069714, -0.2687886, 1, 1, 1, 1, 1,
-0.9259091, 1.10817, -1.26644, 1, 1, 1, 1, 1,
-0.9025192, 0.1555739, -1.429051, 1, 1, 1, 1, 1,
-0.9016764, -0.6315897, -0.06560198, 1, 1, 1, 1, 1,
-0.9003456, -0.3437922, -0.954846, 1, 1, 1, 1, 1,
-0.8996881, -0.963576, -3.066608, 1, 1, 1, 1, 1,
-0.8972238, 0.05893143, 0.6901857, 1, 1, 1, 1, 1,
-0.8874006, 0.6059573, -0.3708144, 0, 0, 1, 1, 1,
-0.88272, -0.5753738, -1.867103, 1, 0, 0, 1, 1,
-0.8817115, 0.6997542, -0.3618407, 1, 0, 0, 1, 1,
-0.8807979, 0.9678038, -1.398928, 1, 0, 0, 1, 1,
-0.8795184, 0.04012585, -2.338728, 1, 0, 0, 1, 1,
-0.8742849, -0.5457472, -2.469637, 1, 0, 0, 1, 1,
-0.8703144, -1.065945, -2.345549, 0, 0, 0, 1, 1,
-0.8695394, -0.3299098, -1.315814, 0, 0, 0, 1, 1,
-0.8655245, 0.586997, 0.2802052, 0, 0, 0, 1, 1,
-0.8608415, 0.7875614, -0.8517631, 0, 0, 0, 1, 1,
-0.857915, -0.4005192, -0.9855223, 0, 0, 0, 1, 1,
-0.8565562, 0.2395369, -1.998878, 0, 0, 0, 1, 1,
-0.8505501, -0.8520306, -3.0033, 0, 0, 0, 1, 1,
-0.8471113, -0.2642401, -2.428218, 1, 1, 1, 1, 1,
-0.8447771, -0.09128232, -0.7342026, 1, 1, 1, 1, 1,
-0.8441775, -0.729424, -1.770196, 1, 1, 1, 1, 1,
-0.8420416, -0.1136408, -1.51633, 1, 1, 1, 1, 1,
-0.8373566, -0.686248, -3.399337, 1, 1, 1, 1, 1,
-0.836996, -1.294843, -2.262207, 1, 1, 1, 1, 1,
-0.8305326, 0.8975951, -1.291002, 1, 1, 1, 1, 1,
-0.8292701, -0.37004, -1.651493, 1, 1, 1, 1, 1,
-0.8278233, -0.3853979, -2.987112, 1, 1, 1, 1, 1,
-0.8240294, 0.1156956, -1.672204, 1, 1, 1, 1, 1,
-0.8181145, -1.355799, -2.073487, 1, 1, 1, 1, 1,
-0.8174725, -1.022305, -2.699171, 1, 1, 1, 1, 1,
-0.8113081, -0.3724184, -2.11061, 1, 1, 1, 1, 1,
-0.810961, -0.7720316, -3.370736, 1, 1, 1, 1, 1,
-0.803784, 0.6115593, -1.357412, 1, 1, 1, 1, 1,
-0.7998201, -0.05255346, -1.558739, 0, 0, 1, 1, 1,
-0.7982373, -1.193917, -2.917844, 1, 0, 0, 1, 1,
-0.7980337, -2.254409, -2.682395, 1, 0, 0, 1, 1,
-0.7906033, -0.8620784, -2.025861, 1, 0, 0, 1, 1,
-0.788637, 1.009376, -0.9966634, 1, 0, 0, 1, 1,
-0.7876754, 0.08324947, -0.5608634, 1, 0, 0, 1, 1,
-0.7856123, 0.7522513, -1.656825, 0, 0, 0, 1, 1,
-0.7847866, 0.92063, -1.181209, 0, 0, 0, 1, 1,
-0.7843671, 0.2963572, -1.468494, 0, 0, 0, 1, 1,
-0.776233, -0.106685, -1.054459, 0, 0, 0, 1, 1,
-0.7753882, -1.264955, -3.525579, 0, 0, 0, 1, 1,
-0.7696491, 0.7926391, 0.3422002, 0, 0, 0, 1, 1,
-0.7563096, 0.2189922, -1.890994, 0, 0, 0, 1, 1,
-0.7561898, -0.2178757, -0.9242478, 1, 1, 1, 1, 1,
-0.755276, -0.1476711, -2.234944, 1, 1, 1, 1, 1,
-0.7532357, -0.04975037, -0.8876913, 1, 1, 1, 1, 1,
-0.7511923, 0.9725312, 0.03218559, 1, 1, 1, 1, 1,
-0.7486429, 0.4604233, -0.1300245, 1, 1, 1, 1, 1,
-0.7477363, -0.9027644, -0.01689659, 1, 1, 1, 1, 1,
-0.7432192, 0.7557237, 0.8638369, 1, 1, 1, 1, 1,
-0.7308646, -0.5584179, -2.719773, 1, 1, 1, 1, 1,
-0.7302519, -0.5616687, -2.76241, 1, 1, 1, 1, 1,
-0.7269756, 0.1850407, -0.6459444, 1, 1, 1, 1, 1,
-0.7263096, 0.6800182, -1.550339, 1, 1, 1, 1, 1,
-0.7142475, 0.7053093, -0.8129695, 1, 1, 1, 1, 1,
-0.7116283, -0.347534, -0.8333404, 1, 1, 1, 1, 1,
-0.7050747, 0.8875703, -0.189314, 1, 1, 1, 1, 1,
-0.7038438, 0.549823, -0.9161237, 1, 1, 1, 1, 1,
-0.7034946, 0.01808708, -1.599659, 0, 0, 1, 1, 1,
-0.7007037, -1.165732, -0.835143, 1, 0, 0, 1, 1,
-0.6977783, -0.2338852, -1.086568, 1, 0, 0, 1, 1,
-0.691417, -1.04976, -3.283963, 1, 0, 0, 1, 1,
-0.6866431, -0.4544185, -1.652362, 1, 0, 0, 1, 1,
-0.677325, 0.04528098, -2.872062, 1, 0, 0, 1, 1,
-0.6768388, -0.3088692, -2.636552, 0, 0, 0, 1, 1,
-0.6767211, -0.4940955, -3.062433, 0, 0, 0, 1, 1,
-0.6720313, 0.006120166, 0.07505234, 0, 0, 0, 1, 1,
-0.6679612, 1.373459, -0.2540983, 0, 0, 0, 1, 1,
-0.6654727, 1.410236, -1.441561, 0, 0, 0, 1, 1,
-0.6644727, -1.048311, -2.623672, 0, 0, 0, 1, 1,
-0.6643772, -0.3362717, -3.123269, 0, 0, 0, 1, 1,
-0.6623375, 0.1833829, -1.652026, 1, 1, 1, 1, 1,
-0.661601, -0.1355349, -0.9818971, 1, 1, 1, 1, 1,
-0.6593902, 0.4615912, -0.3296374, 1, 1, 1, 1, 1,
-0.6542842, -0.4249596, -2.391504, 1, 1, 1, 1, 1,
-0.6511413, -0.2409829, -1.367688, 1, 1, 1, 1, 1,
-0.6442893, 1.378226, -0.5369707, 1, 1, 1, 1, 1,
-0.6360965, -0.5220392, -2.512337, 1, 1, 1, 1, 1,
-0.6325143, -1.025435, -4.141674, 1, 1, 1, 1, 1,
-0.6268343, -0.40422, -1.159361, 1, 1, 1, 1, 1,
-0.6224812, 0.394339, -1.032305, 1, 1, 1, 1, 1,
-0.6221655, 0.4041178, -1.401272, 1, 1, 1, 1, 1,
-0.6187359, -0.3108704, -1.989592, 1, 1, 1, 1, 1,
-0.6175917, 0.2060409, -3.15143, 1, 1, 1, 1, 1,
-0.6151962, 0.2692792, -3.16998, 1, 1, 1, 1, 1,
-0.6074026, -1.227888, -2.065414, 1, 1, 1, 1, 1,
-0.6072283, -0.2149366, -1.958897, 0, 0, 1, 1, 1,
-0.6064224, 1.365608, -0.4802608, 1, 0, 0, 1, 1,
-0.6056097, -0.9500922, -3.564133, 1, 0, 0, 1, 1,
-0.6047844, -1.013894, -2.948672, 1, 0, 0, 1, 1,
-0.6047164, -0.7191882, -1.924125, 1, 0, 0, 1, 1,
-0.6043844, -1.273997, -2.039941, 1, 0, 0, 1, 1,
-0.6035387, 0.4427411, -2.565494, 0, 0, 0, 1, 1,
-0.6019937, 1.39489, -1.286398, 0, 0, 0, 1, 1,
-0.5979604, 0.6575938, -1.994752, 0, 0, 0, 1, 1,
-0.5934167, 0.3881358, -1.930937, 0, 0, 0, 1, 1,
-0.5825426, 1.288634, -2.179434, 0, 0, 0, 1, 1,
-0.5781277, -1.391969, -0.4847344, 0, 0, 0, 1, 1,
-0.5779967, -1.893392, -5.133836, 0, 0, 0, 1, 1,
-0.5765418, 1.607199, -1.653358, 1, 1, 1, 1, 1,
-0.5739798, -0.3406295, -1.457325, 1, 1, 1, 1, 1,
-0.5739588, 0.1261511, -2.666672, 1, 1, 1, 1, 1,
-0.5731281, -0.5576912, 0.03122081, 1, 1, 1, 1, 1,
-0.5664829, -0.3286553, -1.460329, 1, 1, 1, 1, 1,
-0.5628821, -2.12034, -3.211332, 1, 1, 1, 1, 1,
-0.5575845, -0.4136691, -2.060358, 1, 1, 1, 1, 1,
-0.5529633, 0.3219982, 1.162348, 1, 1, 1, 1, 1,
-0.5483902, 1.180709, 1.909135, 1, 1, 1, 1, 1,
-0.5449189, -1.477616, -4.160852, 1, 1, 1, 1, 1,
-0.5405162, 1.301043, -1.693831, 1, 1, 1, 1, 1,
-0.540372, 1.16569, -1.302237, 1, 1, 1, 1, 1,
-0.538955, 1.204478, 0.4040871, 1, 1, 1, 1, 1,
-0.5337957, -0.02775177, -1.270612, 1, 1, 1, 1, 1,
-0.5311583, -0.4065101, -2.252622, 1, 1, 1, 1, 1,
-0.5287718, 2.327656, -0.2639714, 0, 0, 1, 1, 1,
-0.5267591, 1.075528, -0.6001552, 1, 0, 0, 1, 1,
-0.5149568, -0.6408426, -1.7148, 1, 0, 0, 1, 1,
-0.5145297, 0.6133536, -0.9396889, 1, 0, 0, 1, 1,
-0.5130194, -0.3302449, -3.957688, 1, 0, 0, 1, 1,
-0.511836, 0.1173056, -2.241422, 1, 0, 0, 1, 1,
-0.5108176, 0.8312762, 0.2291238, 0, 0, 0, 1, 1,
-0.5074075, -0.7015926, -3.155394, 0, 0, 0, 1, 1,
-0.5059354, -0.3042859, -2.708929, 0, 0, 0, 1, 1,
-0.5057777, -1.152596, -1.710841, 0, 0, 0, 1, 1,
-0.5014676, 1.52536, -1.824935, 0, 0, 0, 1, 1,
-0.4976044, -1.713766, -4.290176, 0, 0, 0, 1, 1,
-0.494671, -0.4355508, -2.107817, 0, 0, 0, 1, 1,
-0.4922653, 0.1464141, -1.78049, 1, 1, 1, 1, 1,
-0.4891141, 0.3901533, -1.73815, 1, 1, 1, 1, 1,
-0.487424, 0.7714776, -1.312834, 1, 1, 1, 1, 1,
-0.4872777, -0.9825984, -4.779375, 1, 1, 1, 1, 1,
-0.48351, 1.110977, -1.543651, 1, 1, 1, 1, 1,
-0.4825683, -0.5830013, -5.350073, 1, 1, 1, 1, 1,
-0.4820112, 1.001016, -0.2742701, 1, 1, 1, 1, 1,
-0.481939, 2.539802, 0.0199198, 1, 1, 1, 1, 1,
-0.4798436, -1.061441, -2.026136, 1, 1, 1, 1, 1,
-0.4768382, 1.342505, 0.1263394, 1, 1, 1, 1, 1,
-0.476141, 0.2113017, -0.7074282, 1, 1, 1, 1, 1,
-0.4758765, -1.293297, -2.957822, 1, 1, 1, 1, 1,
-0.4741961, 0.8159696, -0.5834909, 1, 1, 1, 1, 1,
-0.4735695, 1.148912, 1.022831, 1, 1, 1, 1, 1,
-0.473224, 0.2790835, -1.149454, 1, 1, 1, 1, 1,
-0.4724235, 0.08819484, -0.9175439, 0, 0, 1, 1, 1,
-0.4691388, 1.131526, 1.042025, 1, 0, 0, 1, 1,
-0.4662229, -0.3838035, -1.282434, 1, 0, 0, 1, 1,
-0.4646394, 0.4634834, 0.2592436, 1, 0, 0, 1, 1,
-0.464137, 0.7098285, -1.578612, 1, 0, 0, 1, 1,
-0.4587608, -0.7319557, -2.727816, 1, 0, 0, 1, 1,
-0.4579687, -1.498453, -2.884033, 0, 0, 0, 1, 1,
-0.4576249, -0.6969562, -4.531279, 0, 0, 0, 1, 1,
-0.4554121, -0.5586501, -3.532647, 0, 0, 0, 1, 1,
-0.4520563, -0.9106197, -2.348479, 0, 0, 0, 1, 1,
-0.4453775, 1.816214, -0.6674641, 0, 0, 0, 1, 1,
-0.4451263, 0.2294599, -1.254608, 0, 0, 0, 1, 1,
-0.4408114, 1.107748, -1.657439, 0, 0, 0, 1, 1,
-0.434838, 1.184326, -1.155038, 1, 1, 1, 1, 1,
-0.4341772, -0.6755826, -2.479817, 1, 1, 1, 1, 1,
-0.4339365, -1.703055, -2.979609, 1, 1, 1, 1, 1,
-0.4251965, 1.389631, 0.6893708, 1, 1, 1, 1, 1,
-0.4234437, -0.008651702, -1.787964, 1, 1, 1, 1, 1,
-0.4125283, 1.788954, -0.7038901, 1, 1, 1, 1, 1,
-0.4124289, 0.6215119, 1.522828, 1, 1, 1, 1, 1,
-0.4088404, -0.137022, -2.033059, 1, 1, 1, 1, 1,
-0.4043001, -1.44218, -2.134256, 1, 1, 1, 1, 1,
-0.4034128, 2.292094, 1.331618, 1, 1, 1, 1, 1,
-0.4010907, -0.3505715, -2.448644, 1, 1, 1, 1, 1,
-0.4010783, 0.8874572, -1.381426, 1, 1, 1, 1, 1,
-0.3924257, 1.019559, 0.5474526, 1, 1, 1, 1, 1,
-0.3916679, -0.8555925, -3.666746, 1, 1, 1, 1, 1,
-0.3881969, -0.7100289, -2.467101, 1, 1, 1, 1, 1,
-0.3865606, -0.3321097, -2.029033, 0, 0, 1, 1, 1,
-0.3855152, 0.2701956, 0.03190496, 1, 0, 0, 1, 1,
-0.3849053, -1.251647, -2.079096, 1, 0, 0, 1, 1,
-0.3812771, 0.2048745, -0.5670707, 1, 0, 0, 1, 1,
-0.3803334, -0.5262233, -2.660482, 1, 0, 0, 1, 1,
-0.3781089, 0.9361876, -1.446684, 1, 0, 0, 1, 1,
-0.3764901, -0.7553856, -2.722306, 0, 0, 0, 1, 1,
-0.3749431, -0.7387177, -1.309012, 0, 0, 0, 1, 1,
-0.3683904, -0.4062375, -1.138985, 0, 0, 0, 1, 1,
-0.3683212, -0.5389963, -1.547996, 0, 0, 0, 1, 1,
-0.3662336, -0.3561344, -3.805495, 0, 0, 0, 1, 1,
-0.3662273, 0.9113404, 0.6874183, 0, 0, 0, 1, 1,
-0.3615994, 1.11904, -0.988439, 0, 0, 0, 1, 1,
-0.358941, 0.5629982, -1.616594, 1, 1, 1, 1, 1,
-0.3549146, -2.490571, -3.030233, 1, 1, 1, 1, 1,
-0.354399, -0.2371671, -1.715371, 1, 1, 1, 1, 1,
-0.3517288, 1.316483, -0.4774335, 1, 1, 1, 1, 1,
-0.350976, -0.7647555, -2.784946, 1, 1, 1, 1, 1,
-0.3504983, 0.2091994, -1.861887, 1, 1, 1, 1, 1,
-0.3488698, -0.4346353, -2.943793, 1, 1, 1, 1, 1,
-0.3436347, -0.05607061, -2.712855, 1, 1, 1, 1, 1,
-0.3388121, -1.248427, -1.128099, 1, 1, 1, 1, 1,
-0.3380745, -0.9427301, -3.898395, 1, 1, 1, 1, 1,
-0.3300897, -1.056414, -2.066276, 1, 1, 1, 1, 1,
-0.3232595, 1.631425, -0.5002059, 1, 1, 1, 1, 1,
-0.3220509, -1.760194, -1.938827, 1, 1, 1, 1, 1,
-0.3202564, -0.2810066, -2.078369, 1, 1, 1, 1, 1,
-0.3155524, -0.3679356, -3.376479, 1, 1, 1, 1, 1,
-0.315279, 0.3762598, -0.9963855, 0, 0, 1, 1, 1,
-0.3140016, -1.300049, -2.923236, 1, 0, 0, 1, 1,
-0.3059953, 1.314273, 0.9100384, 1, 0, 0, 1, 1,
-0.3019788, 0.257703, -1.392063, 1, 0, 0, 1, 1,
-0.2950778, 0.2982965, 0.03048199, 1, 0, 0, 1, 1,
-0.2946735, -1.02315, -3.502915, 1, 0, 0, 1, 1,
-0.2909687, 1.102181, 1.650416, 0, 0, 0, 1, 1,
-0.2905736, 1.341398, 0.1464413, 0, 0, 0, 1, 1,
-0.2888135, 0.009646053, -2.788299, 0, 0, 0, 1, 1,
-0.288157, 1.442343, -0.9099612, 0, 0, 0, 1, 1,
-0.277241, 1.432347, 0.02854507, 0, 0, 0, 1, 1,
-0.2768826, 0.6160254, -1.007827, 0, 0, 0, 1, 1,
-0.2759342, 0.7773152, 0.9780041, 0, 0, 0, 1, 1,
-0.2728243, 1.495346, -0.816686, 1, 1, 1, 1, 1,
-0.2713563, 0.177685, -0.3331545, 1, 1, 1, 1, 1,
-0.2680469, -0.2470855, -2.697628, 1, 1, 1, 1, 1,
-0.2671759, -0.9327821, -3.367095, 1, 1, 1, 1, 1,
-0.2636237, 0.4922992, -0.8577614, 1, 1, 1, 1, 1,
-0.2634789, -0.6873979, -4.079849, 1, 1, 1, 1, 1,
-0.2587743, 1.509689, -0.8159782, 1, 1, 1, 1, 1,
-0.2562155, 0.2470059, -2.274935, 1, 1, 1, 1, 1,
-0.2502212, -0.6198072, -1.040047, 1, 1, 1, 1, 1,
-0.2499154, -0.09187812, -3.038907, 1, 1, 1, 1, 1,
-0.2495991, -1.355191, -2.657468, 1, 1, 1, 1, 1,
-0.2489787, 0.9560147, 0.5050678, 1, 1, 1, 1, 1,
-0.2456864, -0.4685409, -3.160046, 1, 1, 1, 1, 1,
-0.2388714, -0.9563687, -3.464837, 1, 1, 1, 1, 1,
-0.234381, 0.1610663, -1.642161, 1, 1, 1, 1, 1,
-0.2305091, -0.0845566, -0.7748483, 0, 0, 1, 1, 1,
-0.2295014, 1.370135, 1.408535, 1, 0, 0, 1, 1,
-0.221832, 1.29904, 0.005424553, 1, 0, 0, 1, 1,
-0.2087879, -2.694957, -3.40976, 1, 0, 0, 1, 1,
-0.2070753, 1.436303, -0.320967, 1, 0, 0, 1, 1,
-0.206158, -1.286981, -3.514204, 1, 0, 0, 1, 1,
-0.2036144, -0.5070829, -4.433418, 0, 0, 0, 1, 1,
-0.2014968, 0.479948, 0.6522431, 0, 0, 0, 1, 1,
-0.2009986, -1.215572, -1.30282, 0, 0, 0, 1, 1,
-0.1968081, 0.260095, -1.311011, 0, 0, 0, 1, 1,
-0.1967847, 0.2500747, -1.545554, 0, 0, 0, 1, 1,
-0.1923289, -0.3662062, -3.93612, 0, 0, 0, 1, 1,
-0.1884671, 0.9403421, -1.82638, 0, 0, 0, 1, 1,
-0.1880454, -2.035599, -3.045998, 1, 1, 1, 1, 1,
-0.1834953, -0.4029419, -1.436138, 1, 1, 1, 1, 1,
-0.1776086, 0.5394481, 0.9352615, 1, 1, 1, 1, 1,
-0.1767044, -0.2702748, -3.446577, 1, 1, 1, 1, 1,
-0.1704183, -0.7642478, -5.348819, 1, 1, 1, 1, 1,
-0.1695977, -0.1267559, -2.836727, 1, 1, 1, 1, 1,
-0.1691827, -0.5110269, -1.684837, 1, 1, 1, 1, 1,
-0.1638238, -1.724595, -1.906627, 1, 1, 1, 1, 1,
-0.1635797, 1.153323, -0.277555, 1, 1, 1, 1, 1,
-0.163095, 0.6816831, 0.6665491, 1, 1, 1, 1, 1,
-0.1550054, -0.01697855, -2.033466, 1, 1, 1, 1, 1,
-0.1471966, 1.804876, -1.750096, 1, 1, 1, 1, 1,
-0.1469964, 0.5861664, 2.224884, 1, 1, 1, 1, 1,
-0.1453506, -1.308758, -3.783792, 1, 1, 1, 1, 1,
-0.1449417, -1.153124, -3.378336, 1, 1, 1, 1, 1,
-0.1443325, 0.481406, 2.330592, 0, 0, 1, 1, 1,
-0.1433733, -0.2969145, -3.613354, 1, 0, 0, 1, 1,
-0.1417128, -0.1618529, -2.451591, 1, 0, 0, 1, 1,
-0.140855, -0.1196749, -1.353967, 1, 0, 0, 1, 1,
-0.1403442, 1.72305, 0.3201991, 1, 0, 0, 1, 1,
-0.135943, 0.8291413, -0.982593, 1, 0, 0, 1, 1,
-0.1349439, -0.6456728, -4.027306, 0, 0, 0, 1, 1,
-0.1326961, -0.9529033, -2.601903, 0, 0, 0, 1, 1,
-0.1296149, -0.1277359, -4.868791, 0, 0, 0, 1, 1,
-0.1222088, -1.36377, -5.065574, 0, 0, 0, 1, 1,
-0.1210732, 1.536372, -0.1885259, 0, 0, 0, 1, 1,
-0.1089344, 0.0002000153, -1.030797, 0, 0, 0, 1, 1,
-0.1082559, 1.07808, -2.775637, 0, 0, 0, 1, 1,
-0.1040706, -1.811311, -3.066256, 1, 1, 1, 1, 1,
-0.1003611, -0.02626266, -2.713567, 1, 1, 1, 1, 1,
-0.09923472, 0.2922796, -0.8493693, 1, 1, 1, 1, 1,
-0.09874015, -0.4102971, -2.281018, 1, 1, 1, 1, 1,
-0.09617932, 0.6570634, -0.6956823, 1, 1, 1, 1, 1,
-0.0883845, -0.2369414, -2.952453, 1, 1, 1, 1, 1,
-0.07978168, -0.827675, -1.309192, 1, 1, 1, 1, 1,
-0.07639694, 1.37532, -0.9100013, 1, 1, 1, 1, 1,
-0.07567639, -1.276723, -2.373202, 1, 1, 1, 1, 1,
-0.0734845, 0.4307038, -0.5290905, 1, 1, 1, 1, 1,
-0.07110158, 0.2506577, -0.816579, 1, 1, 1, 1, 1,
-0.07060591, 1.072349, -0.2260871, 1, 1, 1, 1, 1,
-0.07000159, -0.9417632, -3.737243, 1, 1, 1, 1, 1,
-0.06844582, 0.05311607, -2.203202, 1, 1, 1, 1, 1,
-0.06236666, -0.6722189, -3.560306, 1, 1, 1, 1, 1,
-0.05806801, -0.8906195, -3.032103, 0, 0, 1, 1, 1,
-0.05629084, -1.061462, -3.511918, 1, 0, 0, 1, 1,
-0.05562073, 0.01130516, 0.2355632, 1, 0, 0, 1, 1,
-0.05544833, 0.2287861, 0.1072774, 1, 0, 0, 1, 1,
-0.05200873, -1.385079, -4.315227, 1, 0, 0, 1, 1,
-0.04936813, 0.2106301, -2.060301, 1, 0, 0, 1, 1,
-0.04649885, -1.617176, -3.23517, 0, 0, 0, 1, 1,
-0.04600054, -0.7000561, -1.750017, 0, 0, 0, 1, 1,
-0.04571282, 0.0232496, -1.390111, 0, 0, 0, 1, 1,
-0.04417091, -0.9522353, -3.068117, 0, 0, 0, 1, 1,
-0.04416639, -0.6895234, -3.575716, 0, 0, 0, 1, 1,
-0.04316949, 0.4338048, 0.0542607, 0, 0, 0, 1, 1,
-0.03912984, 0.6382672, 1.037185, 0, 0, 0, 1, 1,
-0.03755866, 1.119478, 0.1191516, 1, 1, 1, 1, 1,
-0.03432172, 0.5556561, 1.094802, 1, 1, 1, 1, 1,
-0.03423184, -0.08831741, -2.352749, 1, 1, 1, 1, 1,
-0.03235897, 0.2549296, -0.02428183, 1, 1, 1, 1, 1,
-0.03121016, 0.1107645, 0.04859254, 1, 1, 1, 1, 1,
-0.03026005, -0.6917374, -2.058177, 1, 1, 1, 1, 1,
-0.03021766, -1.44016, -1.341413, 1, 1, 1, 1, 1,
-0.03012169, -0.370911, -2.917389, 1, 1, 1, 1, 1,
-0.02957369, -0.1686971, -3.134881, 1, 1, 1, 1, 1,
-0.02946554, -0.5475204, -3.338663, 1, 1, 1, 1, 1,
-0.02581681, -0.5466607, -4.298294, 1, 1, 1, 1, 1,
-0.02406895, -1.23011, -4.434597, 1, 1, 1, 1, 1,
-0.02031042, 0.1383153, -1.051455, 1, 1, 1, 1, 1,
-0.01999796, 0.05877471, -0.4431695, 1, 1, 1, 1, 1,
-0.01634936, -0.1022043, -4.302856, 1, 1, 1, 1, 1,
-0.01128951, -0.2035792, -2.774869, 0, 0, 1, 1, 1,
-0.0102849, 0.1805218, -0.05256543, 1, 0, 0, 1, 1,
-0.007605292, 0.3571424, 0.0377192, 1, 0, 0, 1, 1,
-0.00490605, -1.519473, -2.541895, 1, 0, 0, 1, 1,
-0.003838684, 0.6727079, 0.9406428, 1, 0, 0, 1, 1,
-0.002173117, 1.660039, -0.8047235, 1, 0, 0, 1, 1,
-0.001417664, -1.81025, -4.693565, 0, 0, 0, 1, 1,
-0.0005142605, 0.5984652, -0.2111893, 0, 0, 0, 1, 1,
0.001189036, 2.335804, 0.07133781, 0, 0, 0, 1, 1,
0.001261514, -0.01186431, 3.660847, 0, 0, 0, 1, 1,
0.003223564, -1.27729, 4.272326, 0, 0, 0, 1, 1,
0.004315377, 0.4009333, -0.9532743, 0, 0, 0, 1, 1,
0.005168343, -0.6581801, 3.379949, 0, 0, 0, 1, 1,
0.007552839, 0.2980414, 0.4218557, 1, 1, 1, 1, 1,
0.01067856, 1.536385, -0.1467153, 1, 1, 1, 1, 1,
0.02264969, 1.263819, 0.5845838, 1, 1, 1, 1, 1,
0.02312333, 1.047459, -1.338938, 1, 1, 1, 1, 1,
0.02357089, 0.5731741, 0.03709278, 1, 1, 1, 1, 1,
0.02541897, -0.8839638, 3.572382, 1, 1, 1, 1, 1,
0.02559984, -0.103197, 2.887489, 1, 1, 1, 1, 1,
0.03183253, 0.108953, 0.9002595, 1, 1, 1, 1, 1,
0.03244831, 1.573793, 0.8342198, 1, 1, 1, 1, 1,
0.03787312, -0.0622803, 1.21204, 1, 1, 1, 1, 1,
0.04379681, -0.08482688, 3.30814, 1, 1, 1, 1, 1,
0.04819325, -0.1739861, 3.927834, 1, 1, 1, 1, 1,
0.04937253, 0.2856757, 1.111716, 1, 1, 1, 1, 1,
0.05031988, 0.4125402, -1.628013, 1, 1, 1, 1, 1,
0.05340543, -0.8568466, 5.773662, 1, 1, 1, 1, 1,
0.054256, 0.542354, 1.842038, 0, 0, 1, 1, 1,
0.05538162, 0.3060834, 0.7147956, 1, 0, 0, 1, 1,
0.05589338, 0.1697437, 1.449283, 1, 0, 0, 1, 1,
0.05671468, 1.543818, -1.076228, 1, 0, 0, 1, 1,
0.05715934, 0.2591243, 0.6663382, 1, 0, 0, 1, 1,
0.05853976, 0.002701571, 1.770292, 1, 0, 0, 1, 1,
0.06310626, 0.8086594, -0.1133194, 0, 0, 0, 1, 1,
0.06788097, 0.9721059, 0.5913264, 0, 0, 0, 1, 1,
0.06993808, -1.268059, 2.931429, 0, 0, 0, 1, 1,
0.07670764, 0.9551711, 0.1706783, 0, 0, 0, 1, 1,
0.07788809, -2.878882, 4.805094, 0, 0, 0, 1, 1,
0.08004645, 0.5678419, 0.1057463, 0, 0, 0, 1, 1,
0.08055076, -0.327334, 4.341287, 0, 0, 0, 1, 1,
0.08117366, -0.1572139, 2.376949, 1, 1, 1, 1, 1,
0.08237712, 0.1231891, 1.914865, 1, 1, 1, 1, 1,
0.08291429, 2.079781, 0.349417, 1, 1, 1, 1, 1,
0.0964707, -0.8588746, 4.62792, 1, 1, 1, 1, 1,
0.09802639, -1.288423, 2.248939, 1, 1, 1, 1, 1,
0.09823078, -0.2984767, 1.751595, 1, 1, 1, 1, 1,
0.09897031, -0.3319094, 1.803639, 1, 1, 1, 1, 1,
0.09991342, 1.573984, -1.056064, 1, 1, 1, 1, 1,
0.1004784, 0.9300622, -0.9976992, 1, 1, 1, 1, 1,
0.1008819, 0.1689921, 1.056257, 1, 1, 1, 1, 1,
0.1024268, 0.4276831, 1.334504, 1, 1, 1, 1, 1,
0.1039452, 0.8476422, 0.8533329, 1, 1, 1, 1, 1,
0.1099251, 0.05242767, 1.438337, 1, 1, 1, 1, 1,
0.1105438, 0.734267, -1.299686, 1, 1, 1, 1, 1,
0.1142899, -0.05730357, 2.998495, 1, 1, 1, 1, 1,
0.1197681, 0.7070455, 0.2559502, 0, 0, 1, 1, 1,
0.1206118, -0.8582192, 3.633181, 1, 0, 0, 1, 1,
0.122571, 0.1895283, 0.2842507, 1, 0, 0, 1, 1,
0.1251309, 0.4379106, -0.441667, 1, 0, 0, 1, 1,
0.1261809, 0.08341613, 0.7618901, 1, 0, 0, 1, 1,
0.1263399, 0.4855217, 0.8254239, 1, 0, 0, 1, 1,
0.1266973, -1.352197, 2.670455, 0, 0, 0, 1, 1,
0.1314312, -0.5269532, 1.625838, 0, 0, 0, 1, 1,
0.1323921, -0.4488053, 4.229107, 0, 0, 0, 1, 1,
0.1327845, 1.169399, 1.421234, 0, 0, 0, 1, 1,
0.1348817, 1.958292, 0.2327408, 0, 0, 0, 1, 1,
0.1431322, 2.476061, -0.05985269, 0, 0, 0, 1, 1,
0.1441442, -1.047765, 3.47045, 0, 0, 0, 1, 1,
0.1441453, 1.230821, -0.7002743, 1, 1, 1, 1, 1,
0.1446131, -0.5097455, 4.232038, 1, 1, 1, 1, 1,
0.1477463, 1.572386, 1.59696, 1, 1, 1, 1, 1,
0.1503079, 1.024999, 0.9051874, 1, 1, 1, 1, 1,
0.1524806, -0.02101258, 1.818348, 1, 1, 1, 1, 1,
0.154463, 1.421998, -1.946699, 1, 1, 1, 1, 1,
0.1545523, 0.7536094, 1.110776, 1, 1, 1, 1, 1,
0.1566491, -0.05173431, 0.896707, 1, 1, 1, 1, 1,
0.1593397, 1.129159, 2.204671, 1, 1, 1, 1, 1,
0.1604625, 0.8436548, -0.1105833, 1, 1, 1, 1, 1,
0.1625377, 0.3892593, 0.344794, 1, 1, 1, 1, 1,
0.163793, 1.389653, 0.4754824, 1, 1, 1, 1, 1,
0.1702051, 0.4677115, -2.348881, 1, 1, 1, 1, 1,
0.1710804, -0.1807859, 3.02049, 1, 1, 1, 1, 1,
0.1722011, -0.04870734, 2.767428, 1, 1, 1, 1, 1,
0.1751039, 1.076391, -0.07029106, 0, 0, 1, 1, 1,
0.1824202, -1.318466, 2.062614, 1, 0, 0, 1, 1,
0.1847191, -0.7994164, 2.694378, 1, 0, 0, 1, 1,
0.18539, -1.437279, 1.805257, 1, 0, 0, 1, 1,
0.1952054, -0.629001, 2.086154, 1, 0, 0, 1, 1,
0.1966077, -1.63597, 2.286762, 1, 0, 0, 1, 1,
0.1973718, 0.9781342, -0.05143584, 0, 0, 0, 1, 1,
0.1980938, 1.177201, -1.200369, 0, 0, 0, 1, 1,
0.1999255, 0.8356832, 0.05786449, 0, 0, 0, 1, 1,
0.200919, -0.5952463, 4.189318, 0, 0, 0, 1, 1,
0.2063466, 0.7575943, -0.1042051, 0, 0, 0, 1, 1,
0.2103064, -0.3081317, 3.502354, 0, 0, 0, 1, 1,
0.2104756, -0.06549574, 0.6919499, 0, 0, 0, 1, 1,
0.217654, 0.6195387, -0.3350224, 1, 1, 1, 1, 1,
0.2215162, -1.40135, 3.031726, 1, 1, 1, 1, 1,
0.2233844, 0.8609881, -0.4406005, 1, 1, 1, 1, 1,
0.2264876, 0.6879629, 1.627743, 1, 1, 1, 1, 1,
0.2272137, 0.7933128, 1.486163, 1, 1, 1, 1, 1,
0.2289783, 0.4008255, 0.6522591, 1, 1, 1, 1, 1,
0.2383387, -0.5548393, 2.346434, 1, 1, 1, 1, 1,
0.2395882, -0.09557159, 2.692565, 1, 1, 1, 1, 1,
0.2428366, -0.3112219, 2.442493, 1, 1, 1, 1, 1,
0.2464413, -0.4669892, 3.711726, 1, 1, 1, 1, 1,
0.2475045, -1.281544, 2.662822, 1, 1, 1, 1, 1,
0.24906, -0.4304696, 2.079123, 1, 1, 1, 1, 1,
0.2506284, -0.111982, 1.536689, 1, 1, 1, 1, 1,
0.2512922, 0.3366985, 0.1389854, 1, 1, 1, 1, 1,
0.2535, -0.6328529, 1.779838, 1, 1, 1, 1, 1,
0.2540003, -1.582232, 3.133924, 0, 0, 1, 1, 1,
0.2560333, 1.924652, -0.2399198, 1, 0, 0, 1, 1,
0.2574554, -0.9052497, 2.549568, 1, 0, 0, 1, 1,
0.2575949, -0.2336465, 2.097933, 1, 0, 0, 1, 1,
0.2615991, 2.416667, 0.03764115, 1, 0, 0, 1, 1,
0.2618697, -0.4670262, 3.914441, 1, 0, 0, 1, 1,
0.2701307, -0.3321013, 3.779645, 0, 0, 0, 1, 1,
0.2749029, -0.1598297, 3.117084, 0, 0, 0, 1, 1,
0.2787841, 0.788977, 1.272641, 0, 0, 0, 1, 1,
0.283835, 0.2435494, -0.4921972, 0, 0, 0, 1, 1,
0.2908015, 0.3268121, 1.104458, 0, 0, 0, 1, 1,
0.2995175, 0.9770392, -0.8149219, 0, 0, 0, 1, 1,
0.3051539, 0.4483644, 0.2943347, 0, 0, 0, 1, 1,
0.3051623, 0.2979905, 1.289015, 1, 1, 1, 1, 1,
0.3075505, -0.7198479, 3.138304, 1, 1, 1, 1, 1,
0.3129598, 2.254182, -0.8192296, 1, 1, 1, 1, 1,
0.3142972, -2.582608, 3.45079, 1, 1, 1, 1, 1,
0.3207843, -1.65151, 3.807051, 1, 1, 1, 1, 1,
0.3267615, -1.176587, 2.362259, 1, 1, 1, 1, 1,
0.3268535, -0.2868299, 2.546106, 1, 1, 1, 1, 1,
0.3271979, -0.755483, 0.4230278, 1, 1, 1, 1, 1,
0.3296837, 1.245566, -0.3173306, 1, 1, 1, 1, 1,
0.3413806, -0.6867212, 1.574063, 1, 1, 1, 1, 1,
0.3425785, -0.2937275, 1.933626, 1, 1, 1, 1, 1,
0.3436872, 0.09245959, 1.072253, 1, 1, 1, 1, 1,
0.3447929, 0.04293598, 0.9092085, 1, 1, 1, 1, 1,
0.3472007, -0.4162505, 2.420966, 1, 1, 1, 1, 1,
0.348029, -1.292103, 2.330798, 1, 1, 1, 1, 1,
0.3491238, -0.02988352, 0.4193586, 0, 0, 1, 1, 1,
0.355119, -0.4923581, 1.600839, 1, 0, 0, 1, 1,
0.3619427, 1.552857, 1.750519, 1, 0, 0, 1, 1,
0.3677045, -0.9929315, 3.893167, 1, 0, 0, 1, 1,
0.3694563, 0.01098993, 2.280223, 1, 0, 0, 1, 1,
0.379378, -1.154219, 4.10642, 1, 0, 0, 1, 1,
0.3922421, -0.1236069, 2.158463, 0, 0, 0, 1, 1,
0.3943017, 0.2874076, 1.1417, 0, 0, 0, 1, 1,
0.3958603, -0.1123342, 3.241561, 0, 0, 0, 1, 1,
0.4065726, 0.1920968, 1.039404, 0, 0, 0, 1, 1,
0.408062, 2.154414, -1.227349, 0, 0, 0, 1, 1,
0.4089986, 0.4648353, 0.6297236, 0, 0, 0, 1, 1,
0.4110793, 0.7399549, 0.2635113, 0, 0, 0, 1, 1,
0.414169, 0.090671, 1.892825, 1, 1, 1, 1, 1,
0.4153845, 0.02754151, 2.700758, 1, 1, 1, 1, 1,
0.4161434, 1.081779, 1.38962, 1, 1, 1, 1, 1,
0.4246036, -0.9385684, 2.964892, 1, 1, 1, 1, 1,
0.4255841, 1.435941, -0.08602239, 1, 1, 1, 1, 1,
0.4267325, 1.578496, -1.723247, 1, 1, 1, 1, 1,
0.4279208, -1.367207, 1.084354, 1, 1, 1, 1, 1,
0.4294074, 0.7430738, 0.6436787, 1, 1, 1, 1, 1,
0.4314146, 0.0772749, 2.791559, 1, 1, 1, 1, 1,
0.434705, 2.337674, 1.599026, 1, 1, 1, 1, 1,
0.4400326, -0.8015929, 3.40001, 1, 1, 1, 1, 1,
0.4472479, 0.04476256, 3.20512, 1, 1, 1, 1, 1,
0.4521509, -0.2730303, 2.854038, 1, 1, 1, 1, 1,
0.4531959, 0.4137088, 2.44645, 1, 1, 1, 1, 1,
0.453262, -0.7261133, 2.719018, 1, 1, 1, 1, 1,
0.4663126, -1.26322, 3.791181, 0, 0, 1, 1, 1,
0.4707318, -1.207199, 2.54831, 1, 0, 0, 1, 1,
0.4719656, -0.6353803, 2.650932, 1, 0, 0, 1, 1,
0.4741259, 0.7588713, 2.733286, 1, 0, 0, 1, 1,
0.4811364, -0.3862247, 2.386363, 1, 0, 0, 1, 1,
0.4874835, 1.118604, 0.8454081, 1, 0, 0, 1, 1,
0.4897357, -0.2132465, 2.080328, 0, 0, 0, 1, 1,
0.4912593, 1.51677, 1.805944, 0, 0, 0, 1, 1,
0.4966052, 1.246359, 0.1962694, 0, 0, 0, 1, 1,
0.4990379, -0.6571157, -0.4512796, 0, 0, 0, 1, 1,
0.5101326, -0.6948887, 2.333277, 0, 0, 0, 1, 1,
0.511409, 1.379014, 0.6673568, 0, 0, 0, 1, 1,
0.5116431, 0.2234661, -0.5149602, 0, 0, 0, 1, 1,
0.5117286, -0.3617352, 2.640758, 1, 1, 1, 1, 1,
0.5163081, 0.3198697, 1.903442, 1, 1, 1, 1, 1,
0.5173187, -0.4005117, 1.60822, 1, 1, 1, 1, 1,
0.5196581, -1.353472, 3.516157, 1, 1, 1, 1, 1,
0.5214438, 0.4249949, 1.708941, 1, 1, 1, 1, 1,
0.5248616, -1.026678, 2.746042, 1, 1, 1, 1, 1,
0.5260227, 1.342852, -0.8465654, 1, 1, 1, 1, 1,
0.5310546, 0.2415191, 0.6455288, 1, 1, 1, 1, 1,
0.5389005, -1.939766, 1.2526, 1, 1, 1, 1, 1,
0.5421535, 0.5374632, -1.01625, 1, 1, 1, 1, 1,
0.5431185, 0.8589094, 0.396837, 1, 1, 1, 1, 1,
0.5431257, -1.196343, 4.119333, 1, 1, 1, 1, 1,
0.5459201, -0.1290071, 3.090885, 1, 1, 1, 1, 1,
0.5468621, 0.3557428, -0.01118753, 1, 1, 1, 1, 1,
0.5593936, -0.5471147, 1.368861, 1, 1, 1, 1, 1,
0.5651054, 0.643815, 0.7633238, 0, 0, 1, 1, 1,
0.5674192, 0.07300086, 2.71417, 1, 0, 0, 1, 1,
0.5707595, -1.908286, 1.648043, 1, 0, 0, 1, 1,
0.5719105, 1.6147, -0.4723217, 1, 0, 0, 1, 1,
0.574335, 0.5080093, 0.5641409, 1, 0, 0, 1, 1,
0.5828866, -0.6015861, 2.417446, 1, 0, 0, 1, 1,
0.5852366, -1.538566, 2.641685, 0, 0, 0, 1, 1,
0.5877343, 0.5475917, 1.64855, 0, 0, 0, 1, 1,
0.5916532, -1.469367, 2.548082, 0, 0, 0, 1, 1,
0.5968808, -0.1158527, 0.8044143, 0, 0, 0, 1, 1,
0.5996473, -1.714265, 1.829188, 0, 0, 0, 1, 1,
0.6022475, 1.563119, -1.068804, 0, 0, 0, 1, 1,
0.6037737, 0.3729211, 1.179086, 0, 0, 0, 1, 1,
0.6092868, -0.4445551, 3.197808, 1, 1, 1, 1, 1,
0.6126081, -0.2838552, 1.447318, 1, 1, 1, 1, 1,
0.6128207, 0.3189163, -0.5774546, 1, 1, 1, 1, 1,
0.6160474, -1.392072, 1.974345, 1, 1, 1, 1, 1,
0.6166107, -0.9198469, 1.901591, 1, 1, 1, 1, 1,
0.6176733, -1.26168, 4.175809, 1, 1, 1, 1, 1,
0.6269761, 0.184432, 1.150478, 1, 1, 1, 1, 1,
0.627344, 1.206545, 2.158838, 1, 1, 1, 1, 1,
0.6276767, 2.115654, 0.2043868, 1, 1, 1, 1, 1,
0.6297458, 0.226465, 0.75081, 1, 1, 1, 1, 1,
0.6341087, -0.05142655, 2.71189, 1, 1, 1, 1, 1,
0.6354001, -0.6563241, 2.661714, 1, 1, 1, 1, 1,
0.6356405, -0.8450089, 2.589938, 1, 1, 1, 1, 1,
0.6407984, 0.8646791, 0.1033695, 1, 1, 1, 1, 1,
0.6427277, -0.9881039, 0.5267212, 1, 1, 1, 1, 1,
0.6430874, -1.847336, 3.262252, 0, 0, 1, 1, 1,
0.6443803, 1.405421, 1.568302, 1, 0, 0, 1, 1,
0.6465923, -2.145124, 3.133416, 1, 0, 0, 1, 1,
0.6483067, -0.2963288, 0.7142443, 1, 0, 0, 1, 1,
0.6493129, 0.8627226, 1.074258, 1, 0, 0, 1, 1,
0.659023, -3.346797, 3.639325, 1, 0, 0, 1, 1,
0.6591086, -0.2872255, 3.315582, 0, 0, 0, 1, 1,
0.6679187, -0.2326582, 2.725025, 0, 0, 0, 1, 1,
0.6698108, -2.037667, 3.593983, 0, 0, 0, 1, 1,
0.6726317, 0.6315214, -1.295653, 0, 0, 0, 1, 1,
0.6757415, 1.088843, -1.738334, 0, 0, 0, 1, 1,
0.6785519, 0.8148903, 1.389053, 0, 0, 0, 1, 1,
0.6810673, 0.3288263, 1.307858, 0, 0, 0, 1, 1,
0.6838136, -0.9523245, 2.432652, 1, 1, 1, 1, 1,
0.6877367, 0.6318455, 0.04097133, 1, 1, 1, 1, 1,
0.6905959, 0.8566975, -0.03046391, 1, 1, 1, 1, 1,
0.6976156, -0.7985429, 1.174903, 1, 1, 1, 1, 1,
0.711998, -0.4105788, 0.6294557, 1, 1, 1, 1, 1,
0.714736, -0.3862734, 2.037097, 1, 1, 1, 1, 1,
0.7167213, 0.04597644, 1.61569, 1, 1, 1, 1, 1,
0.7172134, 0.2867071, 2.002563, 1, 1, 1, 1, 1,
0.7238042, 1.195854, 0.1552502, 1, 1, 1, 1, 1,
0.7245544, -0.5721545, 2.627316, 1, 1, 1, 1, 1,
0.7387213, 0.1332298, 2.675656, 1, 1, 1, 1, 1,
0.7449238, 1.52981, 0.3049783, 1, 1, 1, 1, 1,
0.7465137, -0.08178623, 1.802092, 1, 1, 1, 1, 1,
0.7490645, 0.5302219, 0.5155901, 1, 1, 1, 1, 1,
0.7530806, 1.143853, 2.675904, 1, 1, 1, 1, 1,
0.7543312, -0.6227086, 3.096986, 0, 0, 1, 1, 1,
0.7615253, 0.5233934, 0.360072, 1, 0, 0, 1, 1,
0.7624063, -1.389801, 3.308054, 1, 0, 0, 1, 1,
0.7630528, -2.099963, 3.619291, 1, 0, 0, 1, 1,
0.7647564, 0.9783574, 1.312954, 1, 0, 0, 1, 1,
0.7734534, -0.3979302, 3.478482, 1, 0, 0, 1, 1,
0.774913, -1.181103, 1.584263, 0, 0, 0, 1, 1,
0.7759607, -0.1027792, 0.3390391, 0, 0, 0, 1, 1,
0.7783522, -0.1317961, 0.5718463, 0, 0, 0, 1, 1,
0.7909771, -1.150702, 2.324744, 0, 0, 0, 1, 1,
0.7921597, 0.1699241, 0.8060892, 0, 0, 0, 1, 1,
0.7942595, 1.413323, 0.6251856, 0, 0, 0, 1, 1,
0.7962962, 1.119412, 0.4730682, 0, 0, 0, 1, 1,
0.796576, 1.230506, 0.4940776, 1, 1, 1, 1, 1,
0.7974218, -0.01916163, 1.297971, 1, 1, 1, 1, 1,
0.7999414, 1.681368, 2.00949, 1, 1, 1, 1, 1,
0.8097463, 0.4662811, 0.7596613, 1, 1, 1, 1, 1,
0.8113982, -0.6989458, 1.739221, 1, 1, 1, 1, 1,
0.8163994, 0.597638, 0.564485, 1, 1, 1, 1, 1,
0.8204213, -0.225388, 1.479441, 1, 1, 1, 1, 1,
0.82463, 1.151079, 0.2997172, 1, 1, 1, 1, 1,
0.8265143, -0.8426716, 3.410869, 1, 1, 1, 1, 1,
0.8281156, 1.313626, 0.6938339, 1, 1, 1, 1, 1,
0.8286437, -0.2146246, 1.811237, 1, 1, 1, 1, 1,
0.832099, 0.6732041, 0.4254329, 1, 1, 1, 1, 1,
0.8326126, -2.052816, 1.895042, 1, 1, 1, 1, 1,
0.8358198, -0.07153182, 0.8013012, 1, 1, 1, 1, 1,
0.8365862, -0.1478424, 0.130106, 1, 1, 1, 1, 1,
0.84565, 0.6166955, 0.1913197, 0, 0, 1, 1, 1,
0.8551374, 0.7390614, -0.97891, 1, 0, 0, 1, 1,
0.8636027, -1.076286, 0.7764815, 1, 0, 0, 1, 1,
0.8695469, -1.010852, 2.202456, 1, 0, 0, 1, 1,
0.8744111, 1.758003, -1.32198, 1, 0, 0, 1, 1,
0.875398, -0.09191331, 2.087282, 1, 0, 0, 1, 1,
0.8769841, 0.801269, 0.7208486, 0, 0, 0, 1, 1,
0.8770826, 0.2854872, -0.4351337, 0, 0, 0, 1, 1,
0.8785849, -0.1456581, 1.771293, 0, 0, 0, 1, 1,
0.8827394, -1.895556, 3.404468, 0, 0, 0, 1, 1,
0.8850825, -0.1320592, 2.453778, 0, 0, 0, 1, 1,
0.8864682, -0.7656875, 3.269249, 0, 0, 0, 1, 1,
0.898618, 1.585883, 1.45119, 0, 0, 0, 1, 1,
0.8986287, -0.5881072, 2.788823, 1, 1, 1, 1, 1,
0.8997637, 1.65825, 0.869545, 1, 1, 1, 1, 1,
0.9063845, -0.4322852, 2.237454, 1, 1, 1, 1, 1,
0.9141507, -0.2955915, 2.455078, 1, 1, 1, 1, 1,
0.9197563, -0.4643512, 1.292831, 1, 1, 1, 1, 1,
0.9237722, -0.1261757, 1.714659, 1, 1, 1, 1, 1,
0.9260221, 0.3467007, 1.094358, 1, 1, 1, 1, 1,
0.9271026, -1.696408, 4.264204, 1, 1, 1, 1, 1,
0.9273055, 0.3686432, 1.022927, 1, 1, 1, 1, 1,
0.9281857, -0.400818, 1.409417, 1, 1, 1, 1, 1,
0.9349928, 0.8176998, 0.1628276, 1, 1, 1, 1, 1,
0.9383858, -0.4562684, 3.375713, 1, 1, 1, 1, 1,
0.9385909, 1.583979, -0.3404057, 1, 1, 1, 1, 1,
0.9460835, 2.269434, 0.641587, 1, 1, 1, 1, 1,
0.9466689, 0.8702085, 2.645706, 1, 1, 1, 1, 1,
0.9521135, -0.3345999, 2.776399, 0, 0, 1, 1, 1,
0.9532165, 0.5458882, -0.5143461, 1, 0, 0, 1, 1,
0.9533162, -1.34197, 1.897633, 1, 0, 0, 1, 1,
0.9552608, -1.010341, 2.716058, 1, 0, 0, 1, 1,
0.9569432, 2.02475, -0.4882064, 1, 0, 0, 1, 1,
0.9601319, -1.100192, 2.374404, 1, 0, 0, 1, 1,
0.9607022, -0.04191038, 0.3997038, 0, 0, 0, 1, 1,
0.964695, -0.3846769, 1.60537, 0, 0, 0, 1, 1,
0.9704977, 0.2376829, 2.439499, 0, 0, 0, 1, 1,
0.9720752, 0.344986, 1.494877, 0, 0, 0, 1, 1,
0.973496, 0.4338617, 1.786948, 0, 0, 0, 1, 1,
0.9878108, -0.1235259, 2.213202, 0, 0, 0, 1, 1,
0.9909573, -0.08496512, 2.950552, 0, 0, 0, 1, 1,
0.9976189, 0.758782, 1.736238, 1, 1, 1, 1, 1,
0.9978099, -1.390203, -0.001271785, 1, 1, 1, 1, 1,
1.001015, -0.4025593, 1.4517, 1, 1, 1, 1, 1,
1.002681, 0.08915306, 1.777719, 1, 1, 1, 1, 1,
1.01345, -1.665705, 2.159954, 1, 1, 1, 1, 1,
1.017409, -0.6582977, 3.556199, 1, 1, 1, 1, 1,
1.024041, -0.7734317, 1.953147, 1, 1, 1, 1, 1,
1.024227, 0.9628552, 0.1726682, 1, 1, 1, 1, 1,
1.027333, -0.6763043, 1.85236, 1, 1, 1, 1, 1,
1.030549, 0.3561505, 0.9990203, 1, 1, 1, 1, 1,
1.032707, 0.4316316, 1.458542, 1, 1, 1, 1, 1,
1.045979, 1.875895, 0.5045236, 1, 1, 1, 1, 1,
1.04772, 0.6025884, 1.546463, 1, 1, 1, 1, 1,
1.05266, 0.6186407, 2.745947, 1, 1, 1, 1, 1,
1.055641, -1.364619, 1.005285, 1, 1, 1, 1, 1,
1.058153, -0.2216914, 0.6447962, 0, 0, 1, 1, 1,
1.059706, -0.2741198, 1.814754, 1, 0, 0, 1, 1,
1.062589, 0.9078436, 1.446321, 1, 0, 0, 1, 1,
1.070332, 2.021003, 0.7695231, 1, 0, 0, 1, 1,
1.071972, -0.4278156, 1.953877, 1, 0, 0, 1, 1,
1.086195, -1.559201, 3.009196, 1, 0, 0, 1, 1,
1.094558, 1.05004, 1.192235, 0, 0, 0, 1, 1,
1.09544, -0.4739115, 2.80385, 0, 0, 0, 1, 1,
1.097327, 0.1181773, 0.3783114, 0, 0, 0, 1, 1,
1.114619, -0.15864, 2.321815, 0, 0, 0, 1, 1,
1.120719, -0.04497668, 0.4102478, 0, 0, 0, 1, 1,
1.122146, 0.5338156, 1.019604, 0, 0, 0, 1, 1,
1.124793, -0.6673514, 5.051926, 0, 0, 0, 1, 1,
1.125515, 0.05431055, -0.5548974, 1, 1, 1, 1, 1,
1.12569, 1.164465, 1.350392, 1, 1, 1, 1, 1,
1.12652, 0.328497, 0.806887, 1, 1, 1, 1, 1,
1.137376, 1.314991, 3.032299, 1, 1, 1, 1, 1,
1.1446, 0.09784497, 1.957317, 1, 1, 1, 1, 1,
1.146372, 0.002093678, 2.19465, 1, 1, 1, 1, 1,
1.148857, -1.967878, 2.146177, 1, 1, 1, 1, 1,
1.156397, 0.01155769, 2.538336, 1, 1, 1, 1, 1,
1.158225, -1.381253, 2.60485, 1, 1, 1, 1, 1,
1.159795, 0.7896608, -0.9487979, 1, 1, 1, 1, 1,
1.16287, -0.572283, 2.082395, 1, 1, 1, 1, 1,
1.164502, 0.6199468, 1.026581, 1, 1, 1, 1, 1,
1.165007, 2.438494, 1.447538, 1, 1, 1, 1, 1,
1.165911, 1.433251, -0.6712536, 1, 1, 1, 1, 1,
1.168092, -0.9370583, 0.9353933, 1, 1, 1, 1, 1,
1.168731, -2.090377, 3.623936, 0, 0, 1, 1, 1,
1.174875, -0.005334583, 0.06402094, 1, 0, 0, 1, 1,
1.175792, -0.8978004, 4.357692, 1, 0, 0, 1, 1,
1.178371, -0.8723058, 4.218538, 1, 0, 0, 1, 1,
1.185745, 1.699746, -0.01095602, 1, 0, 0, 1, 1,
1.190066, 0.8202844, 1.360108, 1, 0, 0, 1, 1,
1.195748, -0.6483254, 1.770697, 0, 0, 0, 1, 1,
1.19769, 1.088615, -0.04754819, 0, 0, 0, 1, 1,
1.203775, -0.3322017, 1.690271, 0, 0, 0, 1, 1,
1.210972, -1.441608, 2.445609, 0, 0, 0, 1, 1,
1.214906, 0.05722644, -1.088512, 0, 0, 0, 1, 1,
1.219614, 1.209772, 2.09301, 0, 0, 0, 1, 1,
1.221252, -0.4255617, 0.2561679, 0, 0, 0, 1, 1,
1.245716, 0.6646854, 0.9097068, 1, 1, 1, 1, 1,
1.245931, -0.02454395, 1.302575, 1, 1, 1, 1, 1,
1.248701, -1.198702, 2.924869, 1, 1, 1, 1, 1,
1.249888, -0.4983588, 1.886558, 1, 1, 1, 1, 1,
1.252061, -0.5604053, 1.3138, 1, 1, 1, 1, 1,
1.254341, 0.6190954, -0.5608292, 1, 1, 1, 1, 1,
1.258913, -0.2091874, 0.7110279, 1, 1, 1, 1, 1,
1.265453, -0.1059579, 2.173002, 1, 1, 1, 1, 1,
1.26903, -1.070683, 2.184822, 1, 1, 1, 1, 1,
1.275843, 0.176073, 0.6931072, 1, 1, 1, 1, 1,
1.277549, 0.356156, 2.152281, 1, 1, 1, 1, 1,
1.290168, 0.4002762, 2.263363, 1, 1, 1, 1, 1,
1.29218, -0.02135793, 2.025404, 1, 1, 1, 1, 1,
1.298125, -0.550396, 2.073823, 1, 1, 1, 1, 1,
1.303441, -0.2048754, 3.005575, 1, 1, 1, 1, 1,
1.315582, 0.5956892, 0.3367774, 0, 0, 1, 1, 1,
1.320158, 0.2460848, 1.700209, 1, 0, 0, 1, 1,
1.32702, -0.3137901, 2.753527, 1, 0, 0, 1, 1,
1.337088, 0.8266881, 0.7754503, 1, 0, 0, 1, 1,
1.346681, -0.001233599, 5.257442, 1, 0, 0, 1, 1,
1.356137, 0.3441333, 3.11542, 1, 0, 0, 1, 1,
1.362721, -1.121414, 1.637661, 0, 0, 0, 1, 1,
1.371377, -0.646486, 2.642688, 0, 0, 0, 1, 1,
1.387227, -0.8405164, 1.685326, 0, 0, 0, 1, 1,
1.387706, -1.610355, 0.04865882, 0, 0, 0, 1, 1,
1.390917, -1.485859, 1.229995, 0, 0, 0, 1, 1,
1.395414, 1.07584, 1.124089, 0, 0, 0, 1, 1,
1.410093, -0.09047219, 1.913097, 0, 0, 0, 1, 1,
1.422095, 0.6565297, 0.5845434, 1, 1, 1, 1, 1,
1.42374, -0.5326391, 1.485223, 1, 1, 1, 1, 1,
1.432185, -0.4671142, 0.9354835, 1, 1, 1, 1, 1,
1.432474, -0.4051425, 1.386555, 1, 1, 1, 1, 1,
1.449774, -0.9268107, 0.2725763, 1, 1, 1, 1, 1,
1.460473, 1.239179, -0.215663, 1, 1, 1, 1, 1,
1.464321, 0.7717916, 2.303368, 1, 1, 1, 1, 1,
1.466748, -0.4870451, 3.657896, 1, 1, 1, 1, 1,
1.476476, 0.2752586, 1.107878, 1, 1, 1, 1, 1,
1.476875, 0.6162058, -0.1563675, 1, 1, 1, 1, 1,
1.478763, 0.08720295, 1.540253, 1, 1, 1, 1, 1,
1.479224, 0.3634437, 2.791995, 1, 1, 1, 1, 1,
1.479496, -1.16147, 1.31928, 1, 1, 1, 1, 1,
1.479728, 0.2792961, 0.4512135, 1, 1, 1, 1, 1,
1.488587, 0.1395572, 0.365717, 1, 1, 1, 1, 1,
1.488725, -0.4943811, 1.330755, 0, 0, 1, 1, 1,
1.489705, -0.4712853, 0.1285622, 1, 0, 0, 1, 1,
1.502809, -0.3776969, 1.66099, 1, 0, 0, 1, 1,
1.503456, -0.8770178, 2.355174, 1, 0, 0, 1, 1,
1.506633, -0.4407416, 1.923883, 1, 0, 0, 1, 1,
1.506854, -0.4043191, 0.905938, 1, 0, 0, 1, 1,
1.520206, 0.4871956, 0.6404226, 0, 0, 0, 1, 1,
1.523759, 0.5934697, 0.8054228, 0, 0, 0, 1, 1,
1.524347, 0.7870523, 0.4782918, 0, 0, 0, 1, 1,
1.527887, -0.8266863, 2.037791, 0, 0, 0, 1, 1,
1.552098, -0.7335865, 1.970638, 0, 0, 0, 1, 1,
1.578145, -0.3475339, 1.643416, 0, 0, 0, 1, 1,
1.580637, 0.08606927, 2.045692, 0, 0, 0, 1, 1,
1.58568, 2.353591, 0.8838909, 1, 1, 1, 1, 1,
1.586121, 0.3700016, 1.154028, 1, 1, 1, 1, 1,
1.586133, -1.257399, 1.155727, 1, 1, 1, 1, 1,
1.595016, 0.575026, -0.4873433, 1, 1, 1, 1, 1,
1.607873, -0.7870927, 1.89084, 1, 1, 1, 1, 1,
1.632827, -1.065618, 2.853288, 1, 1, 1, 1, 1,
1.640236, -1.125244, 1.039203, 1, 1, 1, 1, 1,
1.649233, 0.2280647, 2.40154, 1, 1, 1, 1, 1,
1.667766, 0.1234723, 0.3169685, 1, 1, 1, 1, 1,
1.680322, 0.2402039, 1.39526, 1, 1, 1, 1, 1,
1.681533, 0.4651897, 3.721742, 1, 1, 1, 1, 1,
1.681906, -2.114127, 1.323415, 1, 1, 1, 1, 1,
1.682006, 1.064049, 1.584466, 1, 1, 1, 1, 1,
1.695348, 0.5771656, 0.8097745, 1, 1, 1, 1, 1,
1.696749, 0.9566059, 0.8176833, 1, 1, 1, 1, 1,
1.69762, -0.262371, 2.236276, 0, 0, 1, 1, 1,
1.726393, -0.031127, 1.268723, 1, 0, 0, 1, 1,
1.733204, 1.219977, 0.3583508, 1, 0, 0, 1, 1,
1.73781, -1.74769, 2.761554, 1, 0, 0, 1, 1,
1.754831, 2.552753, -0.6322612, 1, 0, 0, 1, 1,
1.767288, 0.8662189, 3.166176, 1, 0, 0, 1, 1,
1.768357, -0.3184349, 0.1887548, 0, 0, 0, 1, 1,
1.770434, -0.5867574, 0.9870169, 0, 0, 0, 1, 1,
1.778168, -1.109132, 3.254102, 0, 0, 0, 1, 1,
1.781032, -0.2344102, 2.132066, 0, 0, 0, 1, 1,
1.802629, 0.7577887, 0.333277, 0, 0, 0, 1, 1,
1.805821, 0.7905462, 3.191908, 0, 0, 0, 1, 1,
1.82839, 0.8206496, 2.06302, 0, 0, 0, 1, 1,
1.836212, 1.526531, 0.9330461, 1, 1, 1, 1, 1,
1.884159, 1.196446, -0.5298287, 1, 1, 1, 1, 1,
1.885543, 1.689171, 0.09145815, 1, 1, 1, 1, 1,
1.897137, -0.3918013, 2.136099, 1, 1, 1, 1, 1,
1.898716, -2.23816, 1.04862, 1, 1, 1, 1, 1,
1.917839, 0.9151019, 2.794327, 1, 1, 1, 1, 1,
1.925102, -0.798583, 3.511131, 1, 1, 1, 1, 1,
1.941402, 0.6003179, -0.3348175, 1, 1, 1, 1, 1,
1.952234, -1.518284, 2.85552, 1, 1, 1, 1, 1,
1.96297, 0.6675578, 0.7910143, 1, 1, 1, 1, 1,
2.059665, 0.405706, 1.419001, 1, 1, 1, 1, 1,
2.073797, 0.1420339, 1.77512, 1, 1, 1, 1, 1,
2.080905, 0.4576445, 1.858449, 1, 1, 1, 1, 1,
2.087162, -1.120137, 2.323199, 1, 1, 1, 1, 1,
2.096652, -0.9465155, 0.5687646, 1, 1, 1, 1, 1,
2.101553, 0.05543156, 2.478759, 0, 0, 1, 1, 1,
2.137138, 0.8267977, 0.7438668, 1, 0, 0, 1, 1,
2.148036, -1.02523, 3.141046, 1, 0, 0, 1, 1,
2.173321, 0.5863514, 2.07756, 1, 0, 0, 1, 1,
2.17359, 0.2141195, 3.570744, 1, 0, 0, 1, 1,
2.184474, 0.014798, 1.645101, 1, 0, 0, 1, 1,
2.231997, -0.4352289, 3.521057, 0, 0, 0, 1, 1,
2.329726, -2.129084, 2.169316, 0, 0, 0, 1, 1,
2.335624, -1.025325, 1.463741, 0, 0, 0, 1, 1,
2.394531, 0.476704, 0.3169243, 0, 0, 0, 1, 1,
2.42929, 0.09750267, 2.243073, 0, 0, 0, 1, 1,
2.442264, 0.1067242, 1.790577, 0, 0, 0, 1, 1,
2.541124, -0.9044751, 2.785583, 0, 0, 0, 1, 1,
2.547306, -0.8961934, 3.215348, 1, 1, 1, 1, 1,
2.589001, -0.5854068, 2.57739, 1, 1, 1, 1, 1,
2.625782, -1.070929, 2.401513, 1, 1, 1, 1, 1,
2.685906, -0.7599905, 0.8951499, 1, 1, 1, 1, 1,
3.016379, 0.9876797, 1.967127, 1, 1, 1, 1, 1,
3.082036, -0.8773813, 0.9750422, 1, 1, 1, 1, 1,
3.097523, -0.08567799, -0.4088551, 1, 1, 1, 1, 1
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
var radius = 9.634329;
var distance = 33.84018;
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
mvMatrix.translate( 0.1512609, 0.3970224, -0.2117946 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.84018);
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