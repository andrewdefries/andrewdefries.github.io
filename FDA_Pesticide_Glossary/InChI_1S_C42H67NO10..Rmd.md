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
-3.872252, -2.070745, -3.683488, 1, 0, 0, 1,
-3.386611, 1.010199, -2.679385, 1, 0.007843138, 0, 1,
-3.018607, 1.63959, -1.600522, 1, 0.01176471, 0, 1,
-2.898994, 0.7124364, -0.9260685, 1, 0.01960784, 0, 1,
-2.776978, -2.469758, -2.487109, 1, 0.02352941, 0, 1,
-2.617418, -0.1279425, -2.641055, 1, 0.03137255, 0, 1,
-2.566177, 2.420532, -1.193152, 1, 0.03529412, 0, 1,
-2.555984, 1.018658, 0.03484876, 1, 0.04313726, 0, 1,
-2.424086, 0.7450984, -0.07619781, 1, 0.04705882, 0, 1,
-2.415513, 1.118692, -1.239483, 1, 0.05490196, 0, 1,
-2.408202, -1.259954, -2.507003, 1, 0.05882353, 0, 1,
-2.406535, 0.02138655, -0.1134605, 1, 0.06666667, 0, 1,
-2.38255, -0.1413351, -0.6262305, 1, 0.07058824, 0, 1,
-2.334697, 1.537377, -1.634748, 1, 0.07843138, 0, 1,
-2.286915, -0.6644697, -0.1100755, 1, 0.08235294, 0, 1,
-2.27479, 0.7269611, -1.086234, 1, 0.09019608, 0, 1,
-2.267627, 0.7609879, -1.602094, 1, 0.09411765, 0, 1,
-2.262098, 0.3397434, -1.142953, 1, 0.1019608, 0, 1,
-2.209655, 1.477391, -0.7398183, 1, 0.1098039, 0, 1,
-2.128322, 0.5340204, 0.2639792, 1, 0.1137255, 0, 1,
-2.117103, -0.5166234, -0.6424303, 1, 0.1215686, 0, 1,
-2.074862, 0.4267068, -0.3575043, 1, 0.1254902, 0, 1,
-2.069611, 0.4980094, -1.325377, 1, 0.1333333, 0, 1,
-2.065065, 0.8682189, -2.421892, 1, 0.1372549, 0, 1,
-2.059769, -0.2837096, -2.198712, 1, 0.145098, 0, 1,
-2.047273, 0.3079683, -2.461676, 1, 0.1490196, 0, 1,
-2.012881, -1.129578, -1.926596, 1, 0.1568628, 0, 1,
-1.982852, 0.3913309, -1.010863, 1, 0.1607843, 0, 1,
-1.9749, 1.336175, -1.243397, 1, 0.1686275, 0, 1,
-1.956396, 0.2980185, -2.062125, 1, 0.172549, 0, 1,
-1.93443, 0.2888333, -1.701217, 1, 0.1803922, 0, 1,
-1.931776, -1.049552, -2.839637, 1, 0.1843137, 0, 1,
-1.927433, 0.7986637, -1.190437, 1, 0.1921569, 0, 1,
-1.924247, -1.076192, -2.380277, 1, 0.1960784, 0, 1,
-1.921086, -1.162653, -1.37349, 1, 0.2039216, 0, 1,
-1.894385, -1.248363, -1.577834, 1, 0.2117647, 0, 1,
-1.888423, 0.3843917, 1.17358, 1, 0.2156863, 0, 1,
-1.875948, -1.678255, -2.81718, 1, 0.2235294, 0, 1,
-1.862669, -2.579166, -2.851794, 1, 0.227451, 0, 1,
-1.861799, 0.8470297, -0.8016098, 1, 0.2352941, 0, 1,
-1.853468, 1.460019, 0.01329452, 1, 0.2392157, 0, 1,
-1.829076, -1.373064, -2.219426, 1, 0.2470588, 0, 1,
-1.826289, 0.226413, -1.268423, 1, 0.2509804, 0, 1,
-1.804061, -0.5269082, -1.620407, 1, 0.2588235, 0, 1,
-1.803052, 0.5685262, -1.968086, 1, 0.2627451, 0, 1,
-1.80166, -1.302176, -2.594704, 1, 0.2705882, 0, 1,
-1.788551, -0.3878047, -0.9826316, 1, 0.2745098, 0, 1,
-1.787153, 0.5074845, 0.01791838, 1, 0.282353, 0, 1,
-1.785757, -0.7678587, -2.373512, 1, 0.2862745, 0, 1,
-1.776209, -0.1174041, -1.067735, 1, 0.2941177, 0, 1,
-1.766883, -0.1113698, -2.211212, 1, 0.3019608, 0, 1,
-1.76389, 0.7826356, -1.478374, 1, 0.3058824, 0, 1,
-1.733079, -3.250617, -1.203363, 1, 0.3137255, 0, 1,
-1.730467, 0.3324627, -0.7827145, 1, 0.3176471, 0, 1,
-1.727443, 0.6654693, -0.4263715, 1, 0.3254902, 0, 1,
-1.722027, 1.266121, -1.939187, 1, 0.3294118, 0, 1,
-1.719683, -1.161763, -0.8889819, 1, 0.3372549, 0, 1,
-1.710629, 0.6667626, -1.338307, 1, 0.3411765, 0, 1,
-1.707338, 0.2240586, -0.04830143, 1, 0.3490196, 0, 1,
-1.688175, 0.7933509, -0.3226836, 1, 0.3529412, 0, 1,
-1.670456, -1.43303, -0.9438576, 1, 0.3607843, 0, 1,
-1.637193, 2.863745, -0.5635169, 1, 0.3647059, 0, 1,
-1.620887, -0.2214474, -1.909309, 1, 0.372549, 0, 1,
-1.620716, -0.1181551, -2.164892, 1, 0.3764706, 0, 1,
-1.613162, -1.621754, -3.160757, 1, 0.3843137, 0, 1,
-1.607436, -2.191689, -0.8195638, 1, 0.3882353, 0, 1,
-1.604571, 0.4594722, -3.147949, 1, 0.3960784, 0, 1,
-1.60231, 0.6491182, -1.128152, 1, 0.4039216, 0, 1,
-1.599483, -0.7312706, -1.979464, 1, 0.4078431, 0, 1,
-1.596924, -1.424893, -3.400266, 1, 0.4156863, 0, 1,
-1.591415, 0.5601842, 0.9530439, 1, 0.4196078, 0, 1,
-1.58228, 0.3431364, -0.8541658, 1, 0.427451, 0, 1,
-1.556134, 1.192581, -1.463138, 1, 0.4313726, 0, 1,
-1.550506, -0.2625131, -2.449005, 1, 0.4392157, 0, 1,
-1.543828, -0.5189845, -2.615587, 1, 0.4431373, 0, 1,
-1.543133, 0.05601304, -1.242484, 1, 0.4509804, 0, 1,
-1.539156, 0.2777524, -1.636706, 1, 0.454902, 0, 1,
-1.524118, -1.833925, -1.486938, 1, 0.4627451, 0, 1,
-1.514709, 1.233805, -1.986469, 1, 0.4666667, 0, 1,
-1.509943, 0.4443941, -0.763972, 1, 0.4745098, 0, 1,
-1.50598, 0.441283, -1.382822, 1, 0.4784314, 0, 1,
-1.501285, -0.4959044, -3.127259, 1, 0.4862745, 0, 1,
-1.500163, -0.3519047, -1.302315, 1, 0.4901961, 0, 1,
-1.497808, 2.039, -0.3841588, 1, 0.4980392, 0, 1,
-1.495664, 0.3795917, -1.233058, 1, 0.5058824, 0, 1,
-1.474328, -0.2710226, -0.1149278, 1, 0.509804, 0, 1,
-1.465553, 1.113707, -1.103668, 1, 0.5176471, 0, 1,
-1.428268, 0.3894156, -2.986985, 1, 0.5215687, 0, 1,
-1.425152, -0.3347011, -2.848211, 1, 0.5294118, 0, 1,
-1.423942, 0.7506356, 0.2370106, 1, 0.5333334, 0, 1,
-1.42277, -0.2151671, -2.950408, 1, 0.5411765, 0, 1,
-1.413631, -1.561014, -1.957585, 1, 0.5450981, 0, 1,
-1.413101, 0.7262446, 0.1328069, 1, 0.5529412, 0, 1,
-1.410951, 0.5139007, -0.5701763, 1, 0.5568628, 0, 1,
-1.394035, 0.8081555, -0.49958, 1, 0.5647059, 0, 1,
-1.384808, 1.185164, 0.2892714, 1, 0.5686275, 0, 1,
-1.377536, -1.328296, -2.980081, 1, 0.5764706, 0, 1,
-1.373239, -2.797732, -4.420047, 1, 0.5803922, 0, 1,
-1.330339, -0.2971138, -1.637757, 1, 0.5882353, 0, 1,
-1.319678, -0.991548, -1.972573, 1, 0.5921569, 0, 1,
-1.301443, -0.3602578, -2.239613, 1, 0.6, 0, 1,
-1.300439, 0.8274283, -1.232953, 1, 0.6078432, 0, 1,
-1.295875, -0.3892512, -2.442828, 1, 0.6117647, 0, 1,
-1.293883, 0.770135, -1.599075, 1, 0.6196079, 0, 1,
-1.292136, -1.394177, -1.669182, 1, 0.6235294, 0, 1,
-1.269559, 0.5037154, -0.8031183, 1, 0.6313726, 0, 1,
-1.262055, 0.8750213, 0.2624278, 1, 0.6352941, 0, 1,
-1.26127, -1.340086, -2.207989, 1, 0.6431373, 0, 1,
-1.260443, -0.9671144, -2.569666, 1, 0.6470588, 0, 1,
-1.257206, -0.4389126, -2.308133, 1, 0.654902, 0, 1,
-1.255404, 0.7814752, -1.649884, 1, 0.6588235, 0, 1,
-1.251639, 1.324039, -1.354988, 1, 0.6666667, 0, 1,
-1.239576, -0.8965698, -1.586624, 1, 0.6705883, 0, 1,
-1.224546, -0.2429342, -3.846083, 1, 0.6784314, 0, 1,
-1.224368, 0.2199001, -1.519072, 1, 0.682353, 0, 1,
-1.223619, -1.130184, -1.462826, 1, 0.6901961, 0, 1,
-1.221492, -0.6860394, -0.02314504, 1, 0.6941177, 0, 1,
-1.220419, 1.274315, 0.1697877, 1, 0.7019608, 0, 1,
-1.212914, -0.5259932, -2.714302, 1, 0.7098039, 0, 1,
-1.208802, 0.3428132, 0.4550804, 1, 0.7137255, 0, 1,
-1.208552, -1.082303, -2.335428, 1, 0.7215686, 0, 1,
-1.199944, 1.958061, -1.055342, 1, 0.7254902, 0, 1,
-1.199872, 0.5286774, -1.429852, 1, 0.7333333, 0, 1,
-1.19826, 3.459498, 0.7025761, 1, 0.7372549, 0, 1,
-1.195092, -1.969945, -2.158722, 1, 0.7450981, 0, 1,
-1.194058, -0.8778415, -2.373867, 1, 0.7490196, 0, 1,
-1.190012, -0.3138949, -2.000546, 1, 0.7568628, 0, 1,
-1.188715, 0.01150381, -3.787562, 1, 0.7607843, 0, 1,
-1.181741, -0.108052, -1.758987, 1, 0.7686275, 0, 1,
-1.179293, -0.1513854, -1.444967, 1, 0.772549, 0, 1,
-1.178503, -0.6074966, -2.410435, 1, 0.7803922, 0, 1,
-1.173956, -1.549853, -1.536296, 1, 0.7843137, 0, 1,
-1.171869, 0.2216389, -1.547999, 1, 0.7921569, 0, 1,
-1.161925, 0.9324348, 1.453736, 1, 0.7960784, 0, 1,
-1.16037, 0.09035738, -0.3453621, 1, 0.8039216, 0, 1,
-1.158227, -0.4748465, 0.5507526, 1, 0.8117647, 0, 1,
-1.15297, 0.09408305, -0.08857756, 1, 0.8156863, 0, 1,
-1.152848, -0.01538682, -1.483933, 1, 0.8235294, 0, 1,
-1.151574, 1.811096, 0.03130463, 1, 0.827451, 0, 1,
-1.14989, -0.834317, -2.109135, 1, 0.8352941, 0, 1,
-1.149392, 0.2953677, -1.672902, 1, 0.8392157, 0, 1,
-1.14835, 1.710041, -1.493181, 1, 0.8470588, 0, 1,
-1.142934, -0.6468832, -1.769841, 1, 0.8509804, 0, 1,
-1.129707, 1.367772, -1.135943, 1, 0.8588235, 0, 1,
-1.126765, -0.9039112, -2.098685, 1, 0.8627451, 0, 1,
-1.121629, -0.2306655, -1.340448, 1, 0.8705882, 0, 1,
-1.120925, -0.1507952, -2.309555, 1, 0.8745098, 0, 1,
-1.11819, -0.3017544, -2.792509, 1, 0.8823529, 0, 1,
-1.104693, 1.353585, 0.3480506, 1, 0.8862745, 0, 1,
-1.101511, -1.167104, -1.795657, 1, 0.8941177, 0, 1,
-1.097928, 0.4554034, -0.7036721, 1, 0.8980392, 0, 1,
-1.080719, -1.255895, -1.357056, 1, 0.9058824, 0, 1,
-1.080472, 0.147509, -3.185126, 1, 0.9137255, 0, 1,
-1.079678, -0.7733095, -1.993548, 1, 0.9176471, 0, 1,
-1.07351, 1.202545, -1.343764, 1, 0.9254902, 0, 1,
-1.068781, 0.4228714, -0.9011539, 1, 0.9294118, 0, 1,
-1.066304, -0.4637832, -3.488044, 1, 0.9372549, 0, 1,
-1.061743, 0.4899886, -0.7703966, 1, 0.9411765, 0, 1,
-1.048092, 0.08724261, -2.442505, 1, 0.9490196, 0, 1,
-1.046353, -0.6604629, -2.58779, 1, 0.9529412, 0, 1,
-1.04246, 0.09488066, -1.811838, 1, 0.9607843, 0, 1,
-1.040586, 0.1942633, -1.085343, 1, 0.9647059, 0, 1,
-1.038995, 0.8504304, -0.1963515, 1, 0.972549, 0, 1,
-1.018573, -0.09207112, -1.958292, 1, 0.9764706, 0, 1,
-1.012333, -0.3091778, -0.5156571, 1, 0.9843137, 0, 1,
-1.007598, 0.3414662, -1.00631, 1, 0.9882353, 0, 1,
-1.003097, 0.2961637, -0.1705489, 1, 0.9960784, 0, 1,
-0.9946593, 0.04577437, -0.2857372, 0.9960784, 1, 0, 1,
-0.9913321, 0.7656935, -0.8569281, 0.9921569, 1, 0, 1,
-0.9860847, 0.579808, -3.524603, 0.9843137, 1, 0, 1,
-0.9826607, 0.1757938, -0.7565701, 0.9803922, 1, 0, 1,
-0.9788227, 0.9844324, -1.249484, 0.972549, 1, 0, 1,
-0.9683822, -1.469994, -1.85974, 0.9686275, 1, 0, 1,
-0.9633988, -1.022857, -1.810516, 0.9607843, 1, 0, 1,
-0.959425, 0.2756834, 0.168065, 0.9568627, 1, 0, 1,
-0.9534922, 1.336046, -0.7653429, 0.9490196, 1, 0, 1,
-0.9514642, 1.838294, -0.06988044, 0.945098, 1, 0, 1,
-0.9463026, -0.1493683, -1.121688, 0.9372549, 1, 0, 1,
-0.9445185, -1.568163, -3.763159, 0.9333333, 1, 0, 1,
-0.9376209, -0.2487253, -3.112993, 0.9254902, 1, 0, 1,
-0.9371059, 0.6538337, 0.3698906, 0.9215686, 1, 0, 1,
-0.9351262, 0.8584228, -1.824519, 0.9137255, 1, 0, 1,
-0.9283208, -0.2377896, -1.863794, 0.9098039, 1, 0, 1,
-0.9281327, 0.3280683, -1.969738, 0.9019608, 1, 0, 1,
-0.9184047, 0.9651579, -0.8223429, 0.8941177, 1, 0, 1,
-0.9161018, -0.7312039, -1.347393, 0.8901961, 1, 0, 1,
-0.9056807, -0.5543672, -3.922975, 0.8823529, 1, 0, 1,
-0.9010878, 0.7210782, 0.4352532, 0.8784314, 1, 0, 1,
-0.8993453, -0.1885918, -2.911378, 0.8705882, 1, 0, 1,
-0.8907018, 0.4130322, -2.408768, 0.8666667, 1, 0, 1,
-0.8871959, -0.9958753, -2.255104, 0.8588235, 1, 0, 1,
-0.8747877, -0.2179425, -0.9614998, 0.854902, 1, 0, 1,
-0.8706449, -0.5128033, -0.9019591, 0.8470588, 1, 0, 1,
-0.8686281, -0.7438437, -1.849479, 0.8431373, 1, 0, 1,
-0.8653313, -1.620186, -1.925485, 0.8352941, 1, 0, 1,
-0.8651294, 0.1851671, -1.86127, 0.8313726, 1, 0, 1,
-0.8647573, -0.6853796, -1.451884, 0.8235294, 1, 0, 1,
-0.857899, 1.431193, 0.07111655, 0.8196079, 1, 0, 1,
-0.8574554, -0.5748541, -1.49089, 0.8117647, 1, 0, 1,
-0.8551818, 0.3923217, -1.94248, 0.8078431, 1, 0, 1,
-0.8527614, -1.938439, -2.150743, 0.8, 1, 0, 1,
-0.8524747, -0.1129655, -1.060951, 0.7921569, 1, 0, 1,
-0.8414567, 0.4580552, -3.048932, 0.7882353, 1, 0, 1,
-0.8389124, 0.2864782, -1.046288, 0.7803922, 1, 0, 1,
-0.8383003, 0.2889261, -2.442339, 0.7764706, 1, 0, 1,
-0.8376012, 2.257919, 0.6910049, 0.7686275, 1, 0, 1,
-0.8358901, -0.5482002, -1.621637, 0.7647059, 1, 0, 1,
-0.829413, 1.977196, -0.7708608, 0.7568628, 1, 0, 1,
-0.8254768, 1.198509, 1.605928, 0.7529412, 1, 0, 1,
-0.8252598, -0.8526098, -2.400938, 0.7450981, 1, 0, 1,
-0.8206782, 0.2641895, -3.286593, 0.7411765, 1, 0, 1,
-0.8205218, 1.585834, -0.3365887, 0.7333333, 1, 0, 1,
-0.8151676, -0.8235679, -1.047112, 0.7294118, 1, 0, 1,
-0.8139206, -0.9673507, -2.412623, 0.7215686, 1, 0, 1,
-0.8111567, -1.09319, -1.23623, 0.7176471, 1, 0, 1,
-0.7979407, -0.3240693, -0.5605091, 0.7098039, 1, 0, 1,
-0.7932049, 0.671253, -1.0209, 0.7058824, 1, 0, 1,
-0.791855, 0.5048352, -1.353588, 0.6980392, 1, 0, 1,
-0.7917145, 0.09163089, 1.680604, 0.6901961, 1, 0, 1,
-0.7874992, 0.09989145, -2.453879, 0.6862745, 1, 0, 1,
-0.7779986, -0.003105459, -0.9277395, 0.6784314, 1, 0, 1,
-0.7763648, 0.5709233, -0.04655599, 0.6745098, 1, 0, 1,
-0.7762721, -0.230553, -2.240212, 0.6666667, 1, 0, 1,
-0.7757961, -0.8916662, -2.68539, 0.6627451, 1, 0, 1,
-0.7728764, -0.7192559, -3.156917, 0.654902, 1, 0, 1,
-0.7690199, 0.01844914, -2.616989, 0.6509804, 1, 0, 1,
-0.7689532, -1.337806, -1.77381, 0.6431373, 1, 0, 1,
-0.7687454, -0.4102556, -0.9265945, 0.6392157, 1, 0, 1,
-0.7671766, 0.1204377, -0.17253, 0.6313726, 1, 0, 1,
-0.767013, 0.1561967, -1.981259, 0.627451, 1, 0, 1,
-0.764788, -1.087578, -1.101973, 0.6196079, 1, 0, 1,
-0.7640769, 1.02017, -1.199443, 0.6156863, 1, 0, 1,
-0.7604241, 0.5692194, -1.308323, 0.6078432, 1, 0, 1,
-0.7582598, 1.479665, 0.398672, 0.6039216, 1, 0, 1,
-0.7499343, 2.63885, -2.029333, 0.5960785, 1, 0, 1,
-0.7455816, 0.8451374, 0.4925054, 0.5882353, 1, 0, 1,
-0.7427708, 0.4986328, -2.268336, 0.5843138, 1, 0, 1,
-0.7417871, -2.195711, -2.551125, 0.5764706, 1, 0, 1,
-0.7411681, -1.289845, -2.382357, 0.572549, 1, 0, 1,
-0.7337692, -1.467481, -3.104196, 0.5647059, 1, 0, 1,
-0.7293216, -2.614661, -3.250049, 0.5607843, 1, 0, 1,
-0.7291837, -1.386057, -3.108704, 0.5529412, 1, 0, 1,
-0.725247, 0.4103567, -1.897306, 0.5490196, 1, 0, 1,
-0.7233941, -1.875352, -1.354039, 0.5411765, 1, 0, 1,
-0.7210103, -2.113375, -3.342007, 0.5372549, 1, 0, 1,
-0.7172264, -1.390828, -4.09993, 0.5294118, 1, 0, 1,
-0.7153842, 1.506152, -0.6799588, 0.5254902, 1, 0, 1,
-0.7133413, 1.119317, -0.7936335, 0.5176471, 1, 0, 1,
-0.7130978, -2.664946, -1.634112, 0.5137255, 1, 0, 1,
-0.7084582, 0.4330497, -1.757622, 0.5058824, 1, 0, 1,
-0.7067571, 0.4621405, -0.7055327, 0.5019608, 1, 0, 1,
-0.6949161, 2.499697, -0.4941883, 0.4941176, 1, 0, 1,
-0.6939001, -0.09800139, -1.160658, 0.4862745, 1, 0, 1,
-0.6905999, -0.9465846, -4.221263, 0.4823529, 1, 0, 1,
-0.6875553, 0.9443474, 0.3314309, 0.4745098, 1, 0, 1,
-0.6834642, 0.1683627, 0.4842808, 0.4705882, 1, 0, 1,
-0.6813248, 0.007457836, -1.175726, 0.4627451, 1, 0, 1,
-0.680292, -0.1945835, -2.214788, 0.4588235, 1, 0, 1,
-0.6750721, -0.3012641, 0.1528617, 0.4509804, 1, 0, 1,
-0.6715608, -0.5862373, -2.422908, 0.4470588, 1, 0, 1,
-0.6692719, 0.7564818, 1.018792, 0.4392157, 1, 0, 1,
-0.6608585, -1.448398, -1.335396, 0.4352941, 1, 0, 1,
-0.6551709, 0.5088699, -1.631164, 0.427451, 1, 0, 1,
-0.6541654, 0.6475528, 0.5343022, 0.4235294, 1, 0, 1,
-0.6507467, 0.03105074, 1.522263, 0.4156863, 1, 0, 1,
-0.6451504, 1.24959, 1.50532, 0.4117647, 1, 0, 1,
-0.6411898, 0.2522472, -0.06379975, 0.4039216, 1, 0, 1,
-0.6355875, -1.725182, -0.4591346, 0.3960784, 1, 0, 1,
-0.6312088, 0.6769944, -0.5255839, 0.3921569, 1, 0, 1,
-0.6294619, -0.2765325, -2.266581, 0.3843137, 1, 0, 1,
-0.6282648, 0.3367228, -0.8438795, 0.3803922, 1, 0, 1,
-0.6224405, -1.245282, -1.923071, 0.372549, 1, 0, 1,
-0.6206777, 0.5953895, 0.9875587, 0.3686275, 1, 0, 1,
-0.6140045, -0.1716065, -1.917172, 0.3607843, 1, 0, 1,
-0.6060542, 0.8802024, -0.6600709, 0.3568628, 1, 0, 1,
-0.6036968, -1.840196, -2.811923, 0.3490196, 1, 0, 1,
-0.6026775, -0.4015658, -3.24049, 0.345098, 1, 0, 1,
-0.6017429, 0.9423637, -0.6673564, 0.3372549, 1, 0, 1,
-0.5966806, -0.6231025, -0.5140415, 0.3333333, 1, 0, 1,
-0.5847487, 0.06232914, -0.5622401, 0.3254902, 1, 0, 1,
-0.5825061, 1.4314, 1.9866, 0.3215686, 1, 0, 1,
-0.581839, -0.824542, -2.56671, 0.3137255, 1, 0, 1,
-0.5798003, -0.3986393, -1.542142, 0.3098039, 1, 0, 1,
-0.5787721, 1.18325, -1.588907, 0.3019608, 1, 0, 1,
-0.5769222, 0.5988162, -0.2650602, 0.2941177, 1, 0, 1,
-0.5697933, 0.1703672, -0.5487773, 0.2901961, 1, 0, 1,
-0.569768, 0.7724008, 0.3177337, 0.282353, 1, 0, 1,
-0.5686941, -0.2464931, -3.168693, 0.2784314, 1, 0, 1,
-0.5648574, 0.86185, -2.404239, 0.2705882, 1, 0, 1,
-0.5585976, 0.3171805, -1.65545, 0.2666667, 1, 0, 1,
-0.557603, -0.7723156, -3.408903, 0.2588235, 1, 0, 1,
-0.5575866, -0.5930625, -3.097086, 0.254902, 1, 0, 1,
-0.5533903, -0.3589592, -0.6822453, 0.2470588, 1, 0, 1,
-0.5513925, -1.71437, -1.490372, 0.2431373, 1, 0, 1,
-0.5485945, -0.2016631, -1.881937, 0.2352941, 1, 0, 1,
-0.5454935, 0.9467214, -1.523335, 0.2313726, 1, 0, 1,
-0.5454544, 1.221552, -0.296958, 0.2235294, 1, 0, 1,
-0.542775, 0.4147426, -2.565823, 0.2196078, 1, 0, 1,
-0.5426616, -1.617694, -2.976586, 0.2117647, 1, 0, 1,
-0.5364322, 0.03202619, -0.9056849, 0.2078431, 1, 0, 1,
-0.5346282, 0.3998472, -0.2320591, 0.2, 1, 0, 1,
-0.5327072, -0.4223473, -2.16607, 0.1921569, 1, 0, 1,
-0.5317999, -1.661417, -2.448654, 0.1882353, 1, 0, 1,
-0.5244309, 0.6266412, -0.3840827, 0.1803922, 1, 0, 1,
-0.5236402, -0.5440409, -2.503293, 0.1764706, 1, 0, 1,
-0.5188763, 0.3338922, 0.4468066, 0.1686275, 1, 0, 1,
-0.5180209, -0.9223018, -3.04693, 0.1647059, 1, 0, 1,
-0.5166739, 0.389295, -0.9324536, 0.1568628, 1, 0, 1,
-0.5166367, -1.250272, -2.046435, 0.1529412, 1, 0, 1,
-0.5160975, 0.6585895, -0.7348781, 0.145098, 1, 0, 1,
-0.5125061, 1.095832, 0.1553012, 0.1411765, 1, 0, 1,
-0.509835, -1.241799, -1.946711, 0.1333333, 1, 0, 1,
-0.5097046, -0.8949582, -2.663482, 0.1294118, 1, 0, 1,
-0.5077674, 0.5981263, -1.620683, 0.1215686, 1, 0, 1,
-0.5059054, -0.1479519, -2.377043, 0.1176471, 1, 0, 1,
-0.5045754, 0.3909634, -2.416865, 0.1098039, 1, 0, 1,
-0.4989814, -1.275818, -3.049872, 0.1058824, 1, 0, 1,
-0.4979226, -1.754465, -3.016822, 0.09803922, 1, 0, 1,
-0.4964865, -0.8215797, -4.440719, 0.09019608, 1, 0, 1,
-0.4945699, -1.444414, -3.452916, 0.08627451, 1, 0, 1,
-0.4829797, 0.8064016, -0.898499, 0.07843138, 1, 0, 1,
-0.4763328, 1.394729, -0.5172569, 0.07450981, 1, 0, 1,
-0.4757629, 0.7677004, -2.178884, 0.06666667, 1, 0, 1,
-0.4739572, -0.8992376, -3.931479, 0.0627451, 1, 0, 1,
-0.4647781, -2.539486, -2.962678, 0.05490196, 1, 0, 1,
-0.4598211, 0.2515285, -2.165235, 0.05098039, 1, 0, 1,
-0.4527926, -1.769558, -2.464791, 0.04313726, 1, 0, 1,
-0.4488799, -0.5609602, -3.829017, 0.03921569, 1, 0, 1,
-0.446666, 1.617739, -0.9413119, 0.03137255, 1, 0, 1,
-0.4453111, -0.3425508, -1.655378, 0.02745098, 1, 0, 1,
-0.442803, -0.2440891, -2.41687, 0.01960784, 1, 0, 1,
-0.4404316, 1.159052, -0.7794136, 0.01568628, 1, 0, 1,
-0.4365495, -0.7400983, -1.951159, 0.007843138, 1, 0, 1,
-0.4333694, -2.069532, -2.125198, 0.003921569, 1, 0, 1,
-0.4320952, -1.161404, -2.002956, 0, 1, 0.003921569, 1,
-0.4290953, 0.004592695, 0.8697683, 0, 1, 0.01176471, 1,
-0.4152675, -0.9497095, -2.430114, 0, 1, 0.01568628, 1,
-0.4129192, -0.592501, -3.032304, 0, 1, 0.02352941, 1,
-0.4100085, 1.914739, 1.044269, 0, 1, 0.02745098, 1,
-0.4091534, -1.782979, -3.44078, 0, 1, 0.03529412, 1,
-0.4048087, 0.4482298, -1.744847, 0, 1, 0.03921569, 1,
-0.3956845, 0.3229528, -0.9836409, 0, 1, 0.04705882, 1,
-0.3902776, 1.470624, 0.007048614, 0, 1, 0.05098039, 1,
-0.3894427, -2.973372, -2.471086, 0, 1, 0.05882353, 1,
-0.3876293, 0.03472322, -3.148135, 0, 1, 0.0627451, 1,
-0.3805942, 1.123985, -1.332336, 0, 1, 0.07058824, 1,
-0.3768053, -1.618027, -3.722455, 0, 1, 0.07450981, 1,
-0.3767642, -0.429222, -3.665624, 0, 1, 0.08235294, 1,
-0.3767354, 0.5752838, 1.231387, 0, 1, 0.08627451, 1,
-0.3764827, 1.019701, -1.268434, 0, 1, 0.09411765, 1,
-0.3755388, -0.101238, -2.097169, 0, 1, 0.1019608, 1,
-0.3707374, 2.066275, -1.807106, 0, 1, 0.1058824, 1,
-0.3660893, -0.6097842, -2.185326, 0, 1, 0.1137255, 1,
-0.3656265, -0.4693424, -2.543364, 0, 1, 0.1176471, 1,
-0.3637881, -0.4392354, -2.660062, 0, 1, 0.1254902, 1,
-0.3598636, -0.629821, -2.490071, 0, 1, 0.1294118, 1,
-0.3577182, 1.844511, -0.339136, 0, 1, 0.1372549, 1,
-0.3535746, -0.104256, -0.1589398, 0, 1, 0.1411765, 1,
-0.351281, 0.5521822, -0.2588626, 0, 1, 0.1490196, 1,
-0.3512071, -1.236561, -3.099738, 0, 1, 0.1529412, 1,
-0.3509367, 0.4359315, -0.09737584, 0, 1, 0.1607843, 1,
-0.3466578, 0.3281864, -1.151941, 0, 1, 0.1647059, 1,
-0.3451795, -0.009078974, 0.1727831, 0, 1, 0.172549, 1,
-0.3428963, -0.05589205, -0.561982, 0, 1, 0.1764706, 1,
-0.3389131, -0.3298842, -0.6108782, 0, 1, 0.1843137, 1,
-0.3342721, 0.1677349, -0.4507466, 0, 1, 0.1882353, 1,
-0.3335419, -0.4162405, -2.249501, 0, 1, 0.1960784, 1,
-0.3322492, 1.104828, -3.355, 0, 1, 0.2039216, 1,
-0.3310788, -1.066849, -4.472772, 0, 1, 0.2078431, 1,
-0.3297442, -1.003658, -2.838447, 0, 1, 0.2156863, 1,
-0.3293257, -2.436474, -4.471255, 0, 1, 0.2196078, 1,
-0.3282382, -1.185515, -4.083466, 0, 1, 0.227451, 1,
-0.3280802, -0.002864433, -0.772198, 0, 1, 0.2313726, 1,
-0.325085, 0.5763785, -1.29336, 0, 1, 0.2392157, 1,
-0.3229916, -0.2849996, -2.732639, 0, 1, 0.2431373, 1,
-0.3204113, -0.3586458, -3.864359, 0, 1, 0.2509804, 1,
-0.3194026, -0.9007643, -2.96483, 0, 1, 0.254902, 1,
-0.318995, 0.08667394, -0.9590786, 0, 1, 0.2627451, 1,
-0.3127461, -0.598963, -4.367401, 0, 1, 0.2666667, 1,
-0.3123159, -0.6639608, -3.675841, 0, 1, 0.2745098, 1,
-0.3078275, 1.444341, -0.951109, 0, 1, 0.2784314, 1,
-0.3070126, -0.4531036, -3.740503, 0, 1, 0.2862745, 1,
-0.305488, -0.4359373, -2.965077, 0, 1, 0.2901961, 1,
-0.3042484, 0.9762456, -1.097585, 0, 1, 0.2980392, 1,
-0.2991128, -1.790327, -2.859398, 0, 1, 0.3058824, 1,
-0.2977036, 0.8770721, 0.06115615, 0, 1, 0.3098039, 1,
-0.2970519, 1.596706, 0.709116, 0, 1, 0.3176471, 1,
-0.2932045, 0.1061202, -1.932973, 0, 1, 0.3215686, 1,
-0.2919224, 1.506215, -0.4573504, 0, 1, 0.3294118, 1,
-0.2905895, 1.415764, 0.02376712, 0, 1, 0.3333333, 1,
-0.2880552, -0.6618807, -2.386241, 0, 1, 0.3411765, 1,
-0.2871801, 1.375568, -0.9824957, 0, 1, 0.345098, 1,
-0.2828295, -0.9967279, -2.195292, 0, 1, 0.3529412, 1,
-0.2828034, -0.6533318, -3.242753, 0, 1, 0.3568628, 1,
-0.2815971, -0.3420662, -3.268902, 0, 1, 0.3647059, 1,
-0.2793439, -0.3980759, -2.721622, 0, 1, 0.3686275, 1,
-0.2783052, 0.1914443, 0.1893546, 0, 1, 0.3764706, 1,
-0.2753941, -0.5775734, -1.573324, 0, 1, 0.3803922, 1,
-0.2656968, 1.492455, -0.09083132, 0, 1, 0.3882353, 1,
-0.2641234, -2.100243, -1.715043, 0, 1, 0.3921569, 1,
-0.2640039, 0.8664403, -0.3196233, 0, 1, 0.4, 1,
-0.2634597, -0.4118486, -2.131209, 0, 1, 0.4078431, 1,
-0.2617142, 2.487151, -0.2358762, 0, 1, 0.4117647, 1,
-0.2587785, -0.9755492, -3.724656, 0, 1, 0.4196078, 1,
-0.2558568, 0.2093423, -0.02377319, 0, 1, 0.4235294, 1,
-0.2534662, -0.4852217, -3.454789, 0, 1, 0.4313726, 1,
-0.2470984, 0.1843094, -0.5883142, 0, 1, 0.4352941, 1,
-0.2445301, -1.204134, -2.715312, 0, 1, 0.4431373, 1,
-0.2408266, 0.4315828, 1.192521, 0, 1, 0.4470588, 1,
-0.2371033, 1.593883, -0.4633194, 0, 1, 0.454902, 1,
-0.2365634, -0.419102, -1.671184, 0, 1, 0.4588235, 1,
-0.236002, 0.8103362, -0.1250446, 0, 1, 0.4666667, 1,
-0.2332933, 1.391613, 1.07219, 0, 1, 0.4705882, 1,
-0.232488, 0.01770124, -1.156332, 0, 1, 0.4784314, 1,
-0.2265409, 0.8485209, -1.780332, 0, 1, 0.4823529, 1,
-0.224553, 0.2389789, -1.005186, 0, 1, 0.4901961, 1,
-0.2218456, -1.651318, -2.45702, 0, 1, 0.4941176, 1,
-0.2202237, -1.345994, -2.896472, 0, 1, 0.5019608, 1,
-0.2196972, 0.7641948, -0.7025824, 0, 1, 0.509804, 1,
-0.2180819, 1.489702, -0.2700894, 0, 1, 0.5137255, 1,
-0.2152157, 1.107619, 0.3964678, 0, 1, 0.5215687, 1,
-0.2110551, -0.07212969, -2.451794, 0, 1, 0.5254902, 1,
-0.2097261, -0.7871998, -2.140928, 0, 1, 0.5333334, 1,
-0.2046545, -1.142698, -3.8719, 0, 1, 0.5372549, 1,
-0.202266, -0.6571831, -1.379499, 0, 1, 0.5450981, 1,
-0.1997792, 0.7907232, -0.05078517, 0, 1, 0.5490196, 1,
-0.1961811, 0.2571916, -0.9988418, 0, 1, 0.5568628, 1,
-0.1943116, 0.5709171, -1.226592, 0, 1, 0.5607843, 1,
-0.1934317, -0.3679618, -1.256557, 0, 1, 0.5686275, 1,
-0.1902386, 1.074477, -2.298471, 0, 1, 0.572549, 1,
-0.1891473, -0.3915983, -3.353514, 0, 1, 0.5803922, 1,
-0.1785191, 0.03204635, 0.4785706, 0, 1, 0.5843138, 1,
-0.1738125, 1.392393, 0.5496847, 0, 1, 0.5921569, 1,
-0.1729607, 1.45888, -1.45721, 0, 1, 0.5960785, 1,
-0.1710009, -0.3597991, -2.733143, 0, 1, 0.6039216, 1,
-0.1707347, 0.2038418, 1.075224, 0, 1, 0.6117647, 1,
-0.1662128, 0.5207769, -0.3333966, 0, 1, 0.6156863, 1,
-0.1554965, 1.2435, -1.468422, 0, 1, 0.6235294, 1,
-0.1534086, 0.7766927, 0.3325028, 0, 1, 0.627451, 1,
-0.1489625, -0.7210909, -4.5564, 0, 1, 0.6352941, 1,
-0.1484721, -0.7075614, -2.976247, 0, 1, 0.6392157, 1,
-0.147166, 0.3907188, -0.2525987, 0, 1, 0.6470588, 1,
-0.1435956, -1.117511, -3.718767, 0, 1, 0.6509804, 1,
-0.1416762, 0.87011, -1.834867, 0, 1, 0.6588235, 1,
-0.1390741, 0.4894468, -0.4485672, 0, 1, 0.6627451, 1,
-0.1389329, -0.6014926, -3.536886, 0, 1, 0.6705883, 1,
-0.1353735, -0.4054917, -2.911888, 0, 1, 0.6745098, 1,
-0.1343828, -1.200371, -0.7513766, 0, 1, 0.682353, 1,
-0.1319274, 0.1406411, 0.1397023, 0, 1, 0.6862745, 1,
-0.1268869, -1.020708, -3.126259, 0, 1, 0.6941177, 1,
-0.1258855, 0.4716201, 0.7005488, 0, 1, 0.7019608, 1,
-0.1238576, 1.534974, -1.795424, 0, 1, 0.7058824, 1,
-0.122326, 1.120519, 1.092988, 0, 1, 0.7137255, 1,
-0.1189085, -0.396291, -3.618721, 0, 1, 0.7176471, 1,
-0.1170847, -0.01001068, -1.169961, 0, 1, 0.7254902, 1,
-0.1126772, -0.02950183, -1.154544, 0, 1, 0.7294118, 1,
-0.1041941, 2.981347, 1.418506, 0, 1, 0.7372549, 1,
-0.1023, -0.7249578, -3.055922, 0, 1, 0.7411765, 1,
-0.1001101, -2.818371, -2.914372, 0, 1, 0.7490196, 1,
-0.09755667, -1.001218, -2.813712, 0, 1, 0.7529412, 1,
-0.09302276, 0.6941653, -0.7695748, 0, 1, 0.7607843, 1,
-0.09147722, 0.8260239, -0.6799297, 0, 1, 0.7647059, 1,
-0.08842651, -0.8773917, -2.311291, 0, 1, 0.772549, 1,
-0.08003926, 0.9015594, -1.450864, 0, 1, 0.7764706, 1,
-0.07753292, 1.561321, 0.802198, 0, 1, 0.7843137, 1,
-0.07595856, -0.0569834, -0.2099455, 0, 1, 0.7882353, 1,
-0.07422859, -0.7981191, -3.573779, 0, 1, 0.7960784, 1,
-0.07335714, -1.541671, -2.451108, 0, 1, 0.8039216, 1,
-0.07296373, -0.6937442, -2.074843, 0, 1, 0.8078431, 1,
-0.07110438, 2.245836, -0.5471091, 0, 1, 0.8156863, 1,
-0.06766995, -0.2217534, -1.641565, 0, 1, 0.8196079, 1,
-0.0664871, 1.068103, 1.122822, 0, 1, 0.827451, 1,
-0.06537122, -0.8327546, -4.431494, 0, 1, 0.8313726, 1,
-0.06282472, 0.6016554, -0.1236362, 0, 1, 0.8392157, 1,
-0.05687989, 0.5297639, 0.1553193, 0, 1, 0.8431373, 1,
-0.05568662, -0.07574681, -3.220118, 0, 1, 0.8509804, 1,
-0.05451713, 0.2550619, -0.1715639, 0, 1, 0.854902, 1,
-0.05089082, -0.4782284, -2.558398, 0, 1, 0.8627451, 1,
-0.05088419, -0.3617332, -2.165823, 0, 1, 0.8666667, 1,
-0.05029246, -0.4195384, -4.209466, 0, 1, 0.8745098, 1,
-0.04966884, -1.037393, -1.470377, 0, 1, 0.8784314, 1,
-0.04873174, 0.4377622, 0.9560086, 0, 1, 0.8862745, 1,
-0.04371667, 0.9895144, 0.250513, 0, 1, 0.8901961, 1,
-0.04166439, 0.4989185, -0.7671614, 0, 1, 0.8980392, 1,
-0.04053514, 1.84917, -0.7630454, 0, 1, 0.9058824, 1,
-0.03872249, -0.05170529, -2.13322, 0, 1, 0.9098039, 1,
-0.03404188, 1.81038, 0.1338076, 0, 1, 0.9176471, 1,
-0.03330676, -0.9087425, -1.505796, 0, 1, 0.9215686, 1,
-0.03192146, -0.2435297, -4.172716, 0, 1, 0.9294118, 1,
-0.02496013, 0.05730269, -0.1206508, 0, 1, 0.9333333, 1,
-0.0244768, 2.177524, -0.5153987, 0, 1, 0.9411765, 1,
-0.02367815, 0.1847609, -0.8366166, 0, 1, 0.945098, 1,
-0.01938851, -0.7381285, -4.433138, 0, 1, 0.9529412, 1,
-0.01893138, 0.6794115, -1.258633, 0, 1, 0.9568627, 1,
-0.01710011, -0.1867998, -3.263432, 0, 1, 0.9647059, 1,
-0.01560231, 0.1905431, 0.2498954, 0, 1, 0.9686275, 1,
-0.005921196, 0.4029039, 0.983232, 0, 1, 0.9764706, 1,
-0.001990415, 0.01520888, 0.2556758, 0, 1, 0.9803922, 1,
0.0007869383, 0.6424677, 2.086144, 0, 1, 0.9882353, 1,
0.00333632, 0.144814, 0.9162251, 0, 1, 0.9921569, 1,
0.003807245, 1.844552, 0.2688707, 0, 1, 1, 1,
0.004328093, -1.71055, 3.324456, 0, 0.9921569, 1, 1,
0.01022089, -0.655719, 4.705255, 0, 0.9882353, 1, 1,
0.01026511, -1.013516, 2.498805, 0, 0.9803922, 1, 1,
0.01043569, 0.4763741, -1.015369, 0, 0.9764706, 1, 1,
0.01046909, -1.106916, 3.575934, 0, 0.9686275, 1, 1,
0.01690662, 0.06492164, 0.07539129, 0, 0.9647059, 1, 1,
0.02198463, -0.4727456, 4.057076, 0, 0.9568627, 1, 1,
0.02318146, -0.5121576, 4.390113, 0, 0.9529412, 1, 1,
0.02428968, 0.5432466, -1.581371, 0, 0.945098, 1, 1,
0.02530386, 0.01833262, -0.2739829, 0, 0.9411765, 1, 1,
0.02653124, 0.4136422, 0.9383485, 0, 0.9333333, 1, 1,
0.0268655, -0.6187967, 3.378211, 0, 0.9294118, 1, 1,
0.0303523, -0.3330452, 2.130012, 0, 0.9215686, 1, 1,
0.03140107, -1.761636, 1.476097, 0, 0.9176471, 1, 1,
0.03803238, 0.6003569, -0.7676417, 0, 0.9098039, 1, 1,
0.0388418, 0.7786571, 0.7850869, 0, 0.9058824, 1, 1,
0.03937462, 0.3997116, -0.6708127, 0, 0.8980392, 1, 1,
0.04145582, 0.3426994, 0.8492664, 0, 0.8901961, 1, 1,
0.04211471, 0.5665711, 2.334495, 0, 0.8862745, 1, 1,
0.04640096, -1.326878, 4.186904, 0, 0.8784314, 1, 1,
0.0466444, 2.023673, 0.08359145, 0, 0.8745098, 1, 1,
0.04741243, 1.644783, 1.02398, 0, 0.8666667, 1, 1,
0.05107786, 0.007717404, 1.858751, 0, 0.8627451, 1, 1,
0.05115264, -0.4322276, 2.584902, 0, 0.854902, 1, 1,
0.05281631, -0.5069694, 4.647471, 0, 0.8509804, 1, 1,
0.05356396, -0.3964655, 4.165607, 0, 0.8431373, 1, 1,
0.05485959, 0.4026442, 0.9654976, 0, 0.8392157, 1, 1,
0.05606357, -1.213238, 3.657119, 0, 0.8313726, 1, 1,
0.06193274, -0.2839774, 1.705386, 0, 0.827451, 1, 1,
0.06466224, 0.7823298, 0.7302013, 0, 0.8196079, 1, 1,
0.07050304, -0.1217635, 4.003709, 0, 0.8156863, 1, 1,
0.0740867, -2.580718, 2.686079, 0, 0.8078431, 1, 1,
0.07895521, 0.07524166, 0.7517816, 0, 0.8039216, 1, 1,
0.08073233, 0.5983794, 1.133585, 0, 0.7960784, 1, 1,
0.08152456, -0.9339754, 3.890402, 0, 0.7882353, 1, 1,
0.08657517, 1.232547, 0.7614377, 0, 0.7843137, 1, 1,
0.09003965, -0.2300766, 1.7146, 0, 0.7764706, 1, 1,
0.09176293, 1.691637, 0.02904665, 0, 0.772549, 1, 1,
0.09494192, 0.08430603, 1.702722, 0, 0.7647059, 1, 1,
0.09880176, -0.01757148, 1.179598, 0, 0.7607843, 1, 1,
0.09933205, 0.4230568, 0.9096384, 0, 0.7529412, 1, 1,
0.1002033, 0.7246535, 1.739913, 0, 0.7490196, 1, 1,
0.101288, -1.380176, 1.804137, 0, 0.7411765, 1, 1,
0.1028094, -0.3251427, 2.138535, 0, 0.7372549, 1, 1,
0.1068083, 1.235713, -1.009607, 0, 0.7294118, 1, 1,
0.1080029, 1.730397, 0.4295256, 0, 0.7254902, 1, 1,
0.1110931, -0.818633, 2.579126, 0, 0.7176471, 1, 1,
0.1133873, -0.4303308, 3.388297, 0, 0.7137255, 1, 1,
0.1227092, -0.1609187, 1.284802, 0, 0.7058824, 1, 1,
0.1290953, -0.09301955, 1.143204, 0, 0.6980392, 1, 1,
0.1310267, -2.304374, 3.098456, 0, 0.6941177, 1, 1,
0.1331426, 0.3497391, -0.1920837, 0, 0.6862745, 1, 1,
0.1366167, 1.374092, 0.3203822, 0, 0.682353, 1, 1,
0.1375127, 0.05259852, 1.864249, 0, 0.6745098, 1, 1,
0.1389238, 0.2643527, 2.890604, 0, 0.6705883, 1, 1,
0.1395168, -0.9434624, 2.406993, 0, 0.6627451, 1, 1,
0.1398756, 1.348491, -1.400535, 0, 0.6588235, 1, 1,
0.1430967, -1.110375, 2.198415, 0, 0.6509804, 1, 1,
0.1451479, 0.1458755, 0.2642869, 0, 0.6470588, 1, 1,
0.1452172, 1.392753, 1.332034, 0, 0.6392157, 1, 1,
0.1468012, 0.8852605, 0.4490306, 0, 0.6352941, 1, 1,
0.1476427, 1.927197, -1.78824, 0, 0.627451, 1, 1,
0.1479546, 1.7249, -1.549721, 0, 0.6235294, 1, 1,
0.1487638, -0.7347501, 3.099307, 0, 0.6156863, 1, 1,
0.1489575, -0.8903975, 3.687686, 0, 0.6117647, 1, 1,
0.1491168, -1.038772, 1.753371, 0, 0.6039216, 1, 1,
0.1495226, -0.8492204, 3.887182, 0, 0.5960785, 1, 1,
0.1513863, -0.8609858, 1.570827, 0, 0.5921569, 1, 1,
0.1530612, -0.1553133, 3.203418, 0, 0.5843138, 1, 1,
0.1546979, 0.4712482, -0.3474624, 0, 0.5803922, 1, 1,
0.1563922, 0.05074106, 2.052447, 0, 0.572549, 1, 1,
0.1581838, -0.7789434, 2.487845, 0, 0.5686275, 1, 1,
0.1597425, -0.7507102, 3.599166, 0, 0.5607843, 1, 1,
0.1605031, 0.03080701, 1.637875, 0, 0.5568628, 1, 1,
0.1665149, -0.01213189, 0.6716568, 0, 0.5490196, 1, 1,
0.1690177, -1.049855, 1.319461, 0, 0.5450981, 1, 1,
0.1691414, 0.77784, 0.81213, 0, 0.5372549, 1, 1,
0.1757537, -0.2313901, 1.656881, 0, 0.5333334, 1, 1,
0.1790591, 1.995848, 0.6022449, 0, 0.5254902, 1, 1,
0.1884515, 1.675375, 1.471622, 0, 0.5215687, 1, 1,
0.1939574, 0.5261049, 1.255922, 0, 0.5137255, 1, 1,
0.1964346, 1.875143, -0.8344727, 0, 0.509804, 1, 1,
0.1967435, 0.7800384, 0.5635731, 0, 0.5019608, 1, 1,
0.1974744, 0.7710329, -0.6076056, 0, 0.4941176, 1, 1,
0.1976178, -0.3138177, 1.865839, 0, 0.4901961, 1, 1,
0.197858, -0.3033698, 2.117093, 0, 0.4823529, 1, 1,
0.1985717, -0.5420273, 4.192435, 0, 0.4784314, 1, 1,
0.2008179, -0.02065635, 2.542569, 0, 0.4705882, 1, 1,
0.2017077, -0.1576352, 1.096342, 0, 0.4666667, 1, 1,
0.2024686, -0.166845, 2.201402, 0, 0.4588235, 1, 1,
0.2042762, 1.107765, 0.1563172, 0, 0.454902, 1, 1,
0.2072979, 2.398404, 0.1051946, 0, 0.4470588, 1, 1,
0.2113407, 0.7057306, -0.6129209, 0, 0.4431373, 1, 1,
0.2134611, -0.162231, 1.961058, 0, 0.4352941, 1, 1,
0.213843, -0.6913825, 2.513054, 0, 0.4313726, 1, 1,
0.2185371, 0.04908129, 1.533463, 0, 0.4235294, 1, 1,
0.2235162, 0.6477758, 1.213724, 0, 0.4196078, 1, 1,
0.2327552, -0.4878835, 3.735025, 0, 0.4117647, 1, 1,
0.2329704, -0.8158286, 1.980443, 0, 0.4078431, 1, 1,
0.2344677, -0.5880643, 2.520867, 0, 0.4, 1, 1,
0.2390948, -0.01152038, 0.1630644, 0, 0.3921569, 1, 1,
0.2391383, -0.8807912, 3.064362, 0, 0.3882353, 1, 1,
0.2401773, -1.108245, 3.060905, 0, 0.3803922, 1, 1,
0.2436461, 0.2160571, 0.997307, 0, 0.3764706, 1, 1,
0.2461599, -0.5729806, 2.852466, 0, 0.3686275, 1, 1,
0.246202, -0.386566, 2.795173, 0, 0.3647059, 1, 1,
0.2512195, 0.4064261, 1.317273, 0, 0.3568628, 1, 1,
0.2558176, -1.034925, 3.00427, 0, 0.3529412, 1, 1,
0.2649848, 0.8390869, 0.527383, 0, 0.345098, 1, 1,
0.2664332, 0.04611202, 3.201256, 0, 0.3411765, 1, 1,
0.2679581, 0.5419428, -0.4871091, 0, 0.3333333, 1, 1,
0.268187, 0.4376695, 0.6425938, 0, 0.3294118, 1, 1,
0.2683794, 2.388472, -1.1448, 0, 0.3215686, 1, 1,
0.2726061, 0.8758077, 0.9671723, 0, 0.3176471, 1, 1,
0.2767419, 1.251315, -0.1494635, 0, 0.3098039, 1, 1,
0.2817361, -0.3667068, 0.6924517, 0, 0.3058824, 1, 1,
0.2825394, -0.3535435, 0.6584198, 0, 0.2980392, 1, 1,
0.2831115, 0.5139695, 2.483708, 0, 0.2901961, 1, 1,
0.2833872, -0.3093783, 3.90084, 0, 0.2862745, 1, 1,
0.2850271, 0.5212539, 1.339396, 0, 0.2784314, 1, 1,
0.2863543, 1.060462, -0.3869124, 0, 0.2745098, 1, 1,
0.289757, -0.6728067, 2.270543, 0, 0.2666667, 1, 1,
0.2905192, -1.868184, 2.77766, 0, 0.2627451, 1, 1,
0.2935525, -0.4482037, 0.7356357, 0, 0.254902, 1, 1,
0.2954557, 1.225175, -0.2395481, 0, 0.2509804, 1, 1,
0.3009488, 0.2844544, -0.2541141, 0, 0.2431373, 1, 1,
0.3043332, 0.275425, 0.47695, 0, 0.2392157, 1, 1,
0.3047532, 0.1949497, 1.882525, 0, 0.2313726, 1, 1,
0.3051662, -1.695659, 2.26855, 0, 0.227451, 1, 1,
0.3092331, 0.6382633, 1.009737, 0, 0.2196078, 1, 1,
0.3109005, -0.08875423, 2.719977, 0, 0.2156863, 1, 1,
0.3109822, 0.5243974, 0.9525818, 0, 0.2078431, 1, 1,
0.3115312, 0.2377704, 2.628687, 0, 0.2039216, 1, 1,
0.3122253, 0.8979851, 0.4317107, 0, 0.1960784, 1, 1,
0.3128907, 0.273084, -1.51304, 0, 0.1882353, 1, 1,
0.3167329, 0.3152265, -0.3113509, 0, 0.1843137, 1, 1,
0.3173369, 1.004795, -0.171864, 0, 0.1764706, 1, 1,
0.3184598, -0.006914238, 1.026944, 0, 0.172549, 1, 1,
0.3188986, -1.612852, 0.598396, 0, 0.1647059, 1, 1,
0.3231772, -0.9719908, 2.178234, 0, 0.1607843, 1, 1,
0.3238489, 0.3458786, 2.441949, 0, 0.1529412, 1, 1,
0.3277699, -0.00383534, 1.843775, 0, 0.1490196, 1, 1,
0.3280169, 1.229364, 1.16414, 0, 0.1411765, 1, 1,
0.331797, 0.2089376, 1.109097, 0, 0.1372549, 1, 1,
0.3335968, -1.078717, 2.275884, 0, 0.1294118, 1, 1,
0.3393622, -0.05215331, 1.557267, 0, 0.1254902, 1, 1,
0.3452339, 0.6039258, 0.6756598, 0, 0.1176471, 1, 1,
0.3457716, 0.6704827, 2.478229, 0, 0.1137255, 1, 1,
0.3471492, -1.027803, 1.755015, 0, 0.1058824, 1, 1,
0.3474009, -0.6911891, 2.077554, 0, 0.09803922, 1, 1,
0.3520376, -2.892123, 2.515766, 0, 0.09411765, 1, 1,
0.3535897, -0.2534965, 1.824965, 0, 0.08627451, 1, 1,
0.3582577, 2.090587, 0.6179593, 0, 0.08235294, 1, 1,
0.3601287, 1.161688, 0.542012, 0, 0.07450981, 1, 1,
0.3717494, -0.751238, 1.805508, 0, 0.07058824, 1, 1,
0.3719608, -1.77107, 3.502455, 0, 0.0627451, 1, 1,
0.3732214, 1.216487, 0.582894, 0, 0.05882353, 1, 1,
0.3759362, -0.2610676, 1.342179, 0, 0.05098039, 1, 1,
0.392488, -0.2712679, 3.129489, 0, 0.04705882, 1, 1,
0.3990586, 0.4275897, 0.8178887, 0, 0.03921569, 1, 1,
0.3999486, -0.0169489, 2.626185, 0, 0.03529412, 1, 1,
0.4018264, 1.518418, -0.3124526, 0, 0.02745098, 1, 1,
0.4104949, 1.190427, -2.256758, 0, 0.02352941, 1, 1,
0.4126036, -0.6077291, 1.112196, 0, 0.01568628, 1, 1,
0.4195171, -1.482359, 4.393357, 0, 0.01176471, 1, 1,
0.4231163, -0.4291529, 4.285112, 0, 0.003921569, 1, 1,
0.4343743, -0.5499687, 3.025392, 0.003921569, 0, 1, 1,
0.4346812, 0.2555115, 1.300534, 0.007843138, 0, 1, 1,
0.4378357, 0.8109355, -0.1359059, 0.01568628, 0, 1, 1,
0.4391162, 0.3857238, 1.873694, 0.01960784, 0, 1, 1,
0.4445652, -0.1919871, 3.281518, 0.02745098, 0, 1, 1,
0.4457677, 0.6839148, 0.853731, 0.03137255, 0, 1, 1,
0.4519995, -0.8046182, 4.07974, 0.03921569, 0, 1, 1,
0.4525563, -1.103293, 1.885342, 0.04313726, 0, 1, 1,
0.4562977, -0.3564513, 1.168881, 0.05098039, 0, 1, 1,
0.4617636, 1.610541, 0.3470554, 0.05490196, 0, 1, 1,
0.4633386, 0.01319475, 1.899313, 0.0627451, 0, 1, 1,
0.4664648, -1.621731, 3.08153, 0.06666667, 0, 1, 1,
0.4691309, -0.3573149, 2.489312, 0.07450981, 0, 1, 1,
0.4697312, -0.8687727, 4.440828, 0.07843138, 0, 1, 1,
0.473571, -0.4222358, 4.608011, 0.08627451, 0, 1, 1,
0.4796997, 1.220759, -0.9350221, 0.09019608, 0, 1, 1,
0.4823888, -2.37752, 3.10522, 0.09803922, 0, 1, 1,
0.4840642, -1.121055, 4.239751, 0.1058824, 0, 1, 1,
0.4890948, -0.3589494, 3.676839, 0.1098039, 0, 1, 1,
0.4898761, 0.8042177, 0.469201, 0.1176471, 0, 1, 1,
0.4924484, -1.004937, 2.125866, 0.1215686, 0, 1, 1,
0.4949092, 1.405612, -1.438956, 0.1294118, 0, 1, 1,
0.4992166, -0.4981247, 2.858031, 0.1333333, 0, 1, 1,
0.4997327, -0.6256261, 4.349704, 0.1411765, 0, 1, 1,
0.5063593, 1.992171, 0.03362981, 0.145098, 0, 1, 1,
0.5076734, -1.294923, 2.760934, 0.1529412, 0, 1, 1,
0.5082755, 0.06642834, 2.569074, 0.1568628, 0, 1, 1,
0.5097795, 1.995776, -0.1800203, 0.1647059, 0, 1, 1,
0.5117168, 0.4359703, 1.586275, 0.1686275, 0, 1, 1,
0.5127375, -1.732212, 3.235745, 0.1764706, 0, 1, 1,
0.5157521, -1.594883, 1.071411, 0.1803922, 0, 1, 1,
0.5240785, -0.3462764, 2.187953, 0.1882353, 0, 1, 1,
0.5243958, 2.037604, -0.2612698, 0.1921569, 0, 1, 1,
0.526291, -0.275681, 1.159918, 0.2, 0, 1, 1,
0.5274175, 1.221339, 0.5515306, 0.2078431, 0, 1, 1,
0.5297385, 0.364092, 0.8540887, 0.2117647, 0, 1, 1,
0.5299619, 0.1161502, 1.222737, 0.2196078, 0, 1, 1,
0.5312538, 0.1880012, 0.6839997, 0.2235294, 0, 1, 1,
0.5329762, -0.09425629, 1.796464, 0.2313726, 0, 1, 1,
0.5336675, 0.06094265, 2.107117, 0.2352941, 0, 1, 1,
0.5337504, -1.57959, 3.878525, 0.2431373, 0, 1, 1,
0.5369282, -1.201289, 3.236586, 0.2470588, 0, 1, 1,
0.537765, 1.557773, 1.229005, 0.254902, 0, 1, 1,
0.5475373, 0.2703146, -0.1152311, 0.2588235, 0, 1, 1,
0.548268, 0.1811639, -0.1150281, 0.2666667, 0, 1, 1,
0.5497468, 0.4555478, 1.250577, 0.2705882, 0, 1, 1,
0.5515305, -1.515414, 3.010881, 0.2784314, 0, 1, 1,
0.5517626, 1.258359, 0.838861, 0.282353, 0, 1, 1,
0.5616637, 0.3415641, 1.206907, 0.2901961, 0, 1, 1,
0.5617728, -0.3216124, 2.056697, 0.2941177, 0, 1, 1,
0.5709667, -0.9926779, 1.898443, 0.3019608, 0, 1, 1,
0.5715578, -0.1094429, 1.253251, 0.3098039, 0, 1, 1,
0.5744234, 0.7884478, 0.7685551, 0.3137255, 0, 1, 1,
0.5762773, -0.05292073, 1.911584, 0.3215686, 0, 1, 1,
0.584887, 0.2852723, 1.191408, 0.3254902, 0, 1, 1,
0.5881489, 1.192299, -0.3413206, 0.3333333, 0, 1, 1,
0.5897512, 1.252363, -0.7106854, 0.3372549, 0, 1, 1,
0.5928669, 0.6495088, 0.3007775, 0.345098, 0, 1, 1,
0.5936656, -1.211938, 1.91958, 0.3490196, 0, 1, 1,
0.6051432, 0.4689751, 2.325071, 0.3568628, 0, 1, 1,
0.6059893, 0.6527792, 1.172129, 0.3607843, 0, 1, 1,
0.606893, 1.80614, 0.7328095, 0.3686275, 0, 1, 1,
0.6231546, 0.1049533, -0.1063812, 0.372549, 0, 1, 1,
0.6236212, -0.333068, 3.48073, 0.3803922, 0, 1, 1,
0.6265928, 1.342059, -1.323515, 0.3843137, 0, 1, 1,
0.6373366, -0.02073709, 3.148269, 0.3921569, 0, 1, 1,
0.6419748, -0.1349571, 1.386848, 0.3960784, 0, 1, 1,
0.6423717, 1.210528, 0.06157374, 0.4039216, 0, 1, 1,
0.6436333, 0.2838772, 2.908243, 0.4117647, 0, 1, 1,
0.6462772, -0.6180682, 1.179323, 0.4156863, 0, 1, 1,
0.6504768, 0.8769794, 0.5162238, 0.4235294, 0, 1, 1,
0.6517994, 1.422753, -0.1186743, 0.427451, 0, 1, 1,
0.6528985, -1.696572, 4.202189, 0.4352941, 0, 1, 1,
0.6588091, 1.06045, 1.213071, 0.4392157, 0, 1, 1,
0.6603148, -0.0970398, -0.7779912, 0.4470588, 0, 1, 1,
0.6622603, 2.035282, -1.43704, 0.4509804, 0, 1, 1,
0.6622918, -0.7026048, 3.327517, 0.4588235, 0, 1, 1,
0.6667164, -0.4532205, 1.294998, 0.4627451, 0, 1, 1,
0.674931, 0.6378867, -0.3110218, 0.4705882, 0, 1, 1,
0.6759363, -0.07862546, 1.964142, 0.4745098, 0, 1, 1,
0.6820545, 0.003529466, 0.5714824, 0.4823529, 0, 1, 1,
0.6867275, 0.01925892, 2.719111, 0.4862745, 0, 1, 1,
0.6873326, -0.5518573, 1.541243, 0.4941176, 0, 1, 1,
0.6879802, -0.7028637, 2.925079, 0.5019608, 0, 1, 1,
0.6884322, 0.1835801, 1.005947, 0.5058824, 0, 1, 1,
0.6966281, -1.4092, 2.605638, 0.5137255, 0, 1, 1,
0.7000225, 1.79443, 1.40021, 0.5176471, 0, 1, 1,
0.7076649, -0.198323, 2.203239, 0.5254902, 0, 1, 1,
0.7090336, -1.089545, 3.298925, 0.5294118, 0, 1, 1,
0.709941, 0.9681801, 1.33061, 0.5372549, 0, 1, 1,
0.7179213, -2.150981, 1.692057, 0.5411765, 0, 1, 1,
0.7212008, -0.6417715, 0.7442592, 0.5490196, 0, 1, 1,
0.725311, 0.6603038, 0.8523434, 0.5529412, 0, 1, 1,
0.7311059, -0.3194026, 1.33121, 0.5607843, 0, 1, 1,
0.7374946, 0.5212667, 1.053138, 0.5647059, 0, 1, 1,
0.7377205, -0.1045971, 3.008947, 0.572549, 0, 1, 1,
0.7395692, -1.594298, 2.862493, 0.5764706, 0, 1, 1,
0.7404612, 0.2368682, 2.290882, 0.5843138, 0, 1, 1,
0.7417987, 0.3449681, 0.7730859, 0.5882353, 0, 1, 1,
0.7470537, -0.6473951, 2.835578, 0.5960785, 0, 1, 1,
0.7491706, -0.7709725, 2.591336, 0.6039216, 0, 1, 1,
0.7554988, -0.6597884, 3.573199, 0.6078432, 0, 1, 1,
0.7560424, 2.075007, -1.025627, 0.6156863, 0, 1, 1,
0.7571827, 0.8545076, 0.4718958, 0.6196079, 0, 1, 1,
0.7577426, -0.2944907, 1.90815, 0.627451, 0, 1, 1,
0.7583856, 1.076786, 0.705411, 0.6313726, 0, 1, 1,
0.7606634, 0.7349448, 0.6197335, 0.6392157, 0, 1, 1,
0.7617852, 0.07551639, 0.8800672, 0.6431373, 0, 1, 1,
0.7647791, -0.2032851, -0.3570484, 0.6509804, 0, 1, 1,
0.7657555, -0.3446007, 1.339377, 0.654902, 0, 1, 1,
0.7666931, -0.04648938, 1.032774, 0.6627451, 0, 1, 1,
0.7689949, -0.1262501, 3.377007, 0.6666667, 0, 1, 1,
0.7713357, -1.032231, 1.823034, 0.6745098, 0, 1, 1,
0.7722094, -0.02757063, 0.8353786, 0.6784314, 0, 1, 1,
0.7739807, 0.4279135, 2.154696, 0.6862745, 0, 1, 1,
0.7753138, -0.7365785, 2.907132, 0.6901961, 0, 1, 1,
0.7770817, -1.407198, 4.344256, 0.6980392, 0, 1, 1,
0.7816335, -1.40145, 1.974944, 0.7058824, 0, 1, 1,
0.7820761, 1.049252, 1.014237, 0.7098039, 0, 1, 1,
0.7840333, -0.1479027, 2.682934, 0.7176471, 0, 1, 1,
0.7901516, 0.3410139, 1.03907, 0.7215686, 0, 1, 1,
0.792734, 0.6335828, -1.293342, 0.7294118, 0, 1, 1,
0.7927598, 0.9073805, 0.6472606, 0.7333333, 0, 1, 1,
0.7965111, -1.145381, 3.283285, 0.7411765, 0, 1, 1,
0.8002322, -1.812845, 1.328466, 0.7450981, 0, 1, 1,
0.8008287, -1.506084, 2.902357, 0.7529412, 0, 1, 1,
0.8122894, 0.5565359, 1.922848, 0.7568628, 0, 1, 1,
0.8133888, 0.1641178, 1.062858, 0.7647059, 0, 1, 1,
0.8138279, 0.7429394, 1.374657, 0.7686275, 0, 1, 1,
0.8155585, -0.9188141, 1.708101, 0.7764706, 0, 1, 1,
0.8180404, -0.4067683, 4.289296, 0.7803922, 0, 1, 1,
0.8265663, 0.01817056, 2.366495, 0.7882353, 0, 1, 1,
0.8310658, 0.3913163, 0.3963512, 0.7921569, 0, 1, 1,
0.8327301, -2.267264, 2.271117, 0.8, 0, 1, 1,
0.8415594, -0.7826394, 2.42075, 0.8078431, 0, 1, 1,
0.8554076, -1.499292, 2.835007, 0.8117647, 0, 1, 1,
0.8588888, 1.359957, 1.042679, 0.8196079, 0, 1, 1,
0.859367, -0.575236, 0.1551036, 0.8235294, 0, 1, 1,
0.8604228, 0.6478122, -1.608376, 0.8313726, 0, 1, 1,
0.863261, -0.7387689, 2.891444, 0.8352941, 0, 1, 1,
0.8700346, 1.562508, -1.192507, 0.8431373, 0, 1, 1,
0.8708441, -0.6606523, 1.576791, 0.8470588, 0, 1, 1,
0.8728552, -1.07039, 2.367594, 0.854902, 0, 1, 1,
0.8857559, -0.2043168, 1.413525, 0.8588235, 0, 1, 1,
0.8878672, 0.630458, 3.041636, 0.8666667, 0, 1, 1,
0.8951075, -0.4882, 0.5602514, 0.8705882, 0, 1, 1,
0.9175876, 2.315475, -0.03086282, 0.8784314, 0, 1, 1,
0.9249847, -1.078542, 2.008482, 0.8823529, 0, 1, 1,
0.938084, -0.05135995, 2.108401, 0.8901961, 0, 1, 1,
0.9407064, 0.8139223, -0.297525, 0.8941177, 0, 1, 1,
0.9457099, 2.338562, 0.801411, 0.9019608, 0, 1, 1,
0.948842, -1.13369, 2.010905, 0.9098039, 0, 1, 1,
0.9552537, -1.47678, 2.647371, 0.9137255, 0, 1, 1,
0.9616662, 0.2501169, 1.966983, 0.9215686, 0, 1, 1,
0.9623938, -0.4861886, 0.7769473, 0.9254902, 0, 1, 1,
0.9640405, -2.059457, 4.172565, 0.9333333, 0, 1, 1,
0.96637, 0.7472588, 1.705729, 0.9372549, 0, 1, 1,
0.9716879, -1.243834, 2.900804, 0.945098, 0, 1, 1,
0.9721231, 1.310453, 0.8706061, 0.9490196, 0, 1, 1,
0.9752715, -0.6297098, 1.665217, 0.9568627, 0, 1, 1,
0.9782187, -0.2932568, 1.549753, 0.9607843, 0, 1, 1,
0.9854218, 2.084695, 2.667009, 0.9686275, 0, 1, 1,
0.9879583, -2.195661, 2.611019, 0.972549, 0, 1, 1,
0.9889496, -2.087252, 2.474995, 0.9803922, 0, 1, 1,
0.9917114, -0.3300423, 0.1931382, 0.9843137, 0, 1, 1,
0.9930198, 0.3629061, -0.03670732, 0.9921569, 0, 1, 1,
1.000187, 0.8721819, 0.7877371, 0.9960784, 0, 1, 1,
1.011106, -0.887469, 2.770079, 1, 0, 0.9960784, 1,
1.011622, 0.6091459, 0.1144635, 1, 0, 0.9882353, 1,
1.022103, -0.2245902, 2.707859, 1, 0, 0.9843137, 1,
1.023892, 0.6900616, 1.237376, 1, 0, 0.9764706, 1,
1.028167, 0.2623786, 0.6309868, 1, 0, 0.972549, 1,
1.031866, 0.1784479, 1.610023, 1, 0, 0.9647059, 1,
1.036392, 1.351616, 0.6137199, 1, 0, 0.9607843, 1,
1.038319, 1.419862, 0.8911204, 1, 0, 0.9529412, 1,
1.047942, -1.067834, 2.867785, 1, 0, 0.9490196, 1,
1.049539, -1.586417, 4.26191, 1, 0, 0.9411765, 1,
1.050434, -2.165258, 2.150056, 1, 0, 0.9372549, 1,
1.06616, -0.9693797, 1.598846, 1, 0, 0.9294118, 1,
1.06866, 1.311458, 0.8038307, 1, 0, 0.9254902, 1,
1.068863, -1.489379, 1.92784, 1, 0, 0.9176471, 1,
1.080031, -0.3349258, 2.353335, 1, 0, 0.9137255, 1,
1.083534, 1.107792, 1.642069, 1, 0, 0.9058824, 1,
1.087613, -0.4231904, 2.624486, 1, 0, 0.9019608, 1,
1.089741, -0.5359054, 1.729814, 1, 0, 0.8941177, 1,
1.101555, 0.8655337, 2.164183, 1, 0, 0.8862745, 1,
1.101615, 0.7878887, 2.168046, 1, 0, 0.8823529, 1,
1.10369, 1.009606, -0.06913999, 1, 0, 0.8745098, 1,
1.104328, -0.4082207, 1.955801, 1, 0, 0.8705882, 1,
1.112036, 0.7393546, 0.184522, 1, 0, 0.8627451, 1,
1.113866, -0.5151621, 3.346608, 1, 0, 0.8588235, 1,
1.114187, -0.1858577, 1.924875, 1, 0, 0.8509804, 1,
1.11782, -1.703392, 0.9864166, 1, 0, 0.8470588, 1,
1.118342, -0.6502522, 3.515453, 1, 0, 0.8392157, 1,
1.123811, 0.7511523, -0.1618433, 1, 0, 0.8352941, 1,
1.138437, 0.3873876, 2.012796, 1, 0, 0.827451, 1,
1.139572, -0.8309844, 3.288394, 1, 0, 0.8235294, 1,
1.150639, -0.4621422, 1.099134, 1, 0, 0.8156863, 1,
1.157103, 1.528385, 0.5877218, 1, 0, 0.8117647, 1,
1.159805, 1.515702, 2.214301, 1, 0, 0.8039216, 1,
1.159875, 1.797363, 0.06990321, 1, 0, 0.7960784, 1,
1.164974, 0.8233456, 1.064065, 1, 0, 0.7921569, 1,
1.165673, -1.232, 0.9463487, 1, 0, 0.7843137, 1,
1.170106, -0.7002525, 2.314816, 1, 0, 0.7803922, 1,
1.17364, -0.764007, 1.616526, 1, 0, 0.772549, 1,
1.177137, 1.043976, 2.10247, 1, 0, 0.7686275, 1,
1.178257, 2.310627, 1.038185, 1, 0, 0.7607843, 1,
1.180043, -0.3068157, 2.37283, 1, 0, 0.7568628, 1,
1.180944, 0.04813934, 0.3084627, 1, 0, 0.7490196, 1,
1.187912, -1.659709, 2.480554, 1, 0, 0.7450981, 1,
1.189427, 1.948224, 0.8911425, 1, 0, 0.7372549, 1,
1.190912, 0.2828445, 1.280178, 1, 0, 0.7333333, 1,
1.192438, 0.4070367, 0.8631356, 1, 0, 0.7254902, 1,
1.201697, 0.0985613, 1.235129, 1, 0, 0.7215686, 1,
1.203676, 0.6390661, 1.626184, 1, 0, 0.7137255, 1,
1.212687, -0.6670297, 2.274642, 1, 0, 0.7098039, 1,
1.215103, 1.839114, 0.4057747, 1, 0, 0.7019608, 1,
1.219867, 1.231552, 2.68719, 1, 0, 0.6941177, 1,
1.220856, 1.234972, 1.253659, 1, 0, 0.6901961, 1,
1.234743, -0.3493864, 2.064999, 1, 0, 0.682353, 1,
1.238692, 0.4761969, 0.5939835, 1, 0, 0.6784314, 1,
1.239359, 0.7199615, 0.2723517, 1, 0, 0.6705883, 1,
1.254515, 1.036595, 0.9867831, 1, 0, 0.6666667, 1,
1.254649, -1.923334, 3.042286, 1, 0, 0.6588235, 1,
1.256576, -0.2360771, 2.92829, 1, 0, 0.654902, 1,
1.25868, -0.09044414, 3.284888, 1, 0, 0.6470588, 1,
1.259206, -1.768158, 1.830145, 1, 0, 0.6431373, 1,
1.263625, 0.4388528, 0.126463, 1, 0, 0.6352941, 1,
1.267767, 0.1865751, 2.888457, 1, 0, 0.6313726, 1,
1.272215, 0.6447212, 2.810247, 1, 0, 0.6235294, 1,
1.277667, 0.7770661, 0.5008506, 1, 0, 0.6196079, 1,
1.278029, 0.4375337, -0.3089793, 1, 0, 0.6117647, 1,
1.282762, -0.2197907, 2.251027, 1, 0, 0.6078432, 1,
1.301523, 1.55161, 0.8426615, 1, 0, 0.6, 1,
1.30588, -0.2248058, 1.622063, 1, 0, 0.5921569, 1,
1.306075, -1.028241, 0.08379872, 1, 0, 0.5882353, 1,
1.306738, -0.754913, 3.052337, 1, 0, 0.5803922, 1,
1.319275, -1.220161, 1.834125, 1, 0, 0.5764706, 1,
1.323594, -1.051677, 1.609477, 1, 0, 0.5686275, 1,
1.325488, -2.031998, 2.031411, 1, 0, 0.5647059, 1,
1.331965, 0.008163909, 1.577219, 1, 0, 0.5568628, 1,
1.332404, 1.517922, 1.915279, 1, 0, 0.5529412, 1,
1.333746, -2.106164, 2.227359, 1, 0, 0.5450981, 1,
1.341146, 0.4513361, -0.9600707, 1, 0, 0.5411765, 1,
1.34168, -0.7176317, 1.255474, 1, 0, 0.5333334, 1,
1.35105, -0.5634249, -0.3876726, 1, 0, 0.5294118, 1,
1.367709, -0.04034178, 2.279922, 1, 0, 0.5215687, 1,
1.373552, -0.4241304, 1.343724, 1, 0, 0.5176471, 1,
1.381079, -1.504113, 2.987837, 1, 0, 0.509804, 1,
1.38208, -2.621578, 3.417244, 1, 0, 0.5058824, 1,
1.385487, -0.2679367, 0.2321268, 1, 0, 0.4980392, 1,
1.389203, -0.4871014, 0.2264725, 1, 0, 0.4901961, 1,
1.393453, -0.6450096, 0.5335004, 1, 0, 0.4862745, 1,
1.397575, -1.144015, 2.287828, 1, 0, 0.4784314, 1,
1.397988, -2.314132, 2.768631, 1, 0, 0.4745098, 1,
1.39871, -0.04894447, 3.123348, 1, 0, 0.4666667, 1,
1.402013, -0.2784391, 2.33381, 1, 0, 0.4627451, 1,
1.406159, -1.448807, 1.020919, 1, 0, 0.454902, 1,
1.412841, -1.00236, 1.788405, 1, 0, 0.4509804, 1,
1.428102, 0.2113848, 0.5520841, 1, 0, 0.4431373, 1,
1.449876, -0.4535375, 2.731429, 1, 0, 0.4392157, 1,
1.457531, 1.849133, 0.6160904, 1, 0, 0.4313726, 1,
1.460226, -1.087062, 3.416341, 1, 0, 0.427451, 1,
1.468588, -1.149093, 1.54996, 1, 0, 0.4196078, 1,
1.480611, -0.4725227, -0.3407476, 1, 0, 0.4156863, 1,
1.495474, 1.200861, 0.1521464, 1, 0, 0.4078431, 1,
1.528392, -0.4275984, 3.072272, 1, 0, 0.4039216, 1,
1.53262, 1.902709, -2.093646, 1, 0, 0.3960784, 1,
1.544634, -0.3618456, 0.3273179, 1, 0, 0.3882353, 1,
1.544742, -0.5395858, 1.966343, 1, 0, 0.3843137, 1,
1.559171, 0.511595, 0.7047051, 1, 0, 0.3764706, 1,
1.560388, 0.1193417, 3.194168, 1, 0, 0.372549, 1,
1.583107, 1.786262, -0.5870249, 1, 0, 0.3647059, 1,
1.590198, 0.4577742, 0.56393, 1, 0, 0.3607843, 1,
1.618117, -0.1029804, 1.415932, 1, 0, 0.3529412, 1,
1.6294, -1.062505, 1.506075, 1, 0, 0.3490196, 1,
1.642833, 1.053383, -0.395419, 1, 0, 0.3411765, 1,
1.645538, 0.8733099, 3.104316, 1, 0, 0.3372549, 1,
1.669149, 1.772622, -0.4947226, 1, 0, 0.3294118, 1,
1.672787, -0.3308129, 3.158355, 1, 0, 0.3254902, 1,
1.689094, 0.3395078, 3.543669, 1, 0, 0.3176471, 1,
1.752293, 1.761703, 0.5853952, 1, 0, 0.3137255, 1,
1.756743, 0.1938119, 1.585457, 1, 0, 0.3058824, 1,
1.761592, 1.24699, 1.830272, 1, 0, 0.2980392, 1,
1.782727, 0.9556239, 0.5267053, 1, 0, 0.2941177, 1,
1.800883, -0.8265321, 1.506732, 1, 0, 0.2862745, 1,
1.81015, 0.07338356, 1.093913, 1, 0, 0.282353, 1,
1.81023, -0.2028533, 2.525175, 1, 0, 0.2745098, 1,
1.836966, -1.27799, 1.806867, 1, 0, 0.2705882, 1,
1.841544, 0.4219819, 0.3114014, 1, 0, 0.2627451, 1,
1.844969, 2.455729, 0.171763, 1, 0, 0.2588235, 1,
1.864536, -0.1342927, 0.2960611, 1, 0, 0.2509804, 1,
1.871294, 0.3332683, 0.2298865, 1, 0, 0.2470588, 1,
1.88148, 1.135299, 0.253436, 1, 0, 0.2392157, 1,
1.893399, 0.1858324, 1.420025, 1, 0, 0.2352941, 1,
1.915879, -1.525934, 1.830497, 1, 0, 0.227451, 1,
1.979426, -0.687972, 1.927805, 1, 0, 0.2235294, 1,
1.998092, -0.2788535, 1.977765, 1, 0, 0.2156863, 1,
1.99964, -1.780747, 1.092989, 1, 0, 0.2117647, 1,
2.014665, 0.09288513, 0.6860675, 1, 0, 0.2039216, 1,
2.051967, -0.04135573, 0.03968366, 1, 0, 0.1960784, 1,
2.053944, -0.1645385, 0.0874309, 1, 0, 0.1921569, 1,
2.076552, -0.4483979, 1.010588, 1, 0, 0.1843137, 1,
2.078734, -0.05929936, 2.492701, 1, 0, 0.1803922, 1,
2.082153, -1.823715, 1.967453, 1, 0, 0.172549, 1,
2.095245, -0.4043269, 1.672873, 1, 0, 0.1686275, 1,
2.101547, 1.205209, -1.050766, 1, 0, 0.1607843, 1,
2.125452, 1.682317, -0.7819679, 1, 0, 0.1568628, 1,
2.136611, -0.4968473, 2.643467, 1, 0, 0.1490196, 1,
2.202292, -1.008071, 3.300376, 1, 0, 0.145098, 1,
2.210335, 0.00279686, 1.31057, 1, 0, 0.1372549, 1,
2.256326, 1.028473, 0.681811, 1, 0, 0.1333333, 1,
2.281905, 0.5944096, -0.1524753, 1, 0, 0.1254902, 1,
2.300575, 0.5582305, 1.735042, 1, 0, 0.1215686, 1,
2.307045, 0.2455702, 2.249438, 1, 0, 0.1137255, 1,
2.328351, 0.3677355, 0.1163393, 1, 0, 0.1098039, 1,
2.370584, -0.5787973, 1.955396, 1, 0, 0.1019608, 1,
2.423843, -1.385584, 1.379902, 1, 0, 0.09411765, 1,
2.425082, 0.9646442, 2.922561, 1, 0, 0.09019608, 1,
2.443459, -0.9600321, 2.698444, 1, 0, 0.08235294, 1,
2.448175, -1.382726, 1.904596, 1, 0, 0.07843138, 1,
2.507675, -0.5604991, 2.070232, 1, 0, 0.07058824, 1,
2.509632, -0.9200439, 2.481894, 1, 0, 0.06666667, 1,
2.510162, 0.9111061, 2.420903, 1, 0, 0.05882353, 1,
2.54915, -0.2199663, 1.842844, 1, 0, 0.05490196, 1,
2.549981, 0.8568181, 0.7258496, 1, 0, 0.04705882, 1,
2.570811, -0.6040648, 0.071444, 1, 0, 0.04313726, 1,
2.593552, 0.5314134, 1.619834, 1, 0, 0.03529412, 1,
2.601942, 0.1812529, 1.509065, 1, 0, 0.03137255, 1,
2.710018, -0.6884701, 3.272867, 1, 0, 0.02352941, 1,
2.949607, -2.991997, 1.047587, 1, 0, 0.01960784, 1,
2.954838, -0.6897126, 1.535245, 1, 0, 0.01176471, 1,
3.251389, -1.428705, 3.674635, 1, 0, 0.007843138, 1
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
-0.3104317, -4.387981, -6.12625, 0, -0.5, 0.5, 0.5,
-0.3104317, -4.387981, -6.12625, 1, -0.5, 0.5, 0.5,
-0.3104317, -4.387981, -6.12625, 1, 1.5, 0.5, 0.5,
-0.3104317, -4.387981, -6.12625, 0, 1.5, 0.5, 0.5
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
-5.07971, 0.1044405, -6.12625, 0, -0.5, 0.5, 0.5,
-5.07971, 0.1044405, -6.12625, 1, -0.5, 0.5, 0.5,
-5.07971, 0.1044405, -6.12625, 1, 1.5, 0.5, 0.5,
-5.07971, 0.1044405, -6.12625, 0, 1.5, 0.5, 0.5
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
-5.07971, -4.387981, 0.0744276, 0, -0.5, 0.5, 0.5,
-5.07971, -4.387981, 0.0744276, 1, -0.5, 0.5, 0.5,
-5.07971, -4.387981, 0.0744276, 1, 1.5, 0.5, 0.5,
-5.07971, -4.387981, 0.0744276, 0, 1.5, 0.5, 0.5
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
-2, -3.351269, -4.695324,
2, -3.351269, -4.695324,
-2, -3.351269, -4.695324,
-2, -3.524054, -4.933812,
0, -3.351269, -4.695324,
0, -3.524054, -4.933812,
2, -3.351269, -4.695324,
2, -3.524054, -4.933812
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
"0",
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
-2, -3.869625, -5.410788, 0, -0.5, 0.5, 0.5,
-2, -3.869625, -5.410788, 1, -0.5, 0.5, 0.5,
-2, -3.869625, -5.410788, 1, 1.5, 0.5, 0.5,
-2, -3.869625, -5.410788, 0, 1.5, 0.5, 0.5,
0, -3.869625, -5.410788, 0, -0.5, 0.5, 0.5,
0, -3.869625, -5.410788, 1, -0.5, 0.5, 0.5,
0, -3.869625, -5.410788, 1, 1.5, 0.5, 0.5,
0, -3.869625, -5.410788, 0, 1.5, 0.5, 0.5,
2, -3.869625, -5.410788, 0, -0.5, 0.5, 0.5,
2, -3.869625, -5.410788, 1, -0.5, 0.5, 0.5,
2, -3.869625, -5.410788, 1, 1.5, 0.5, 0.5,
2, -3.869625, -5.410788, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.979107, -3, -4.695324,
-3.979107, 3, -4.695324,
-3.979107, -3, -4.695324,
-4.162541, -3, -4.933812,
-3.979107, -2, -4.695324,
-4.162541, -2, -4.933812,
-3.979107, -1, -4.695324,
-4.162541, -1, -4.933812,
-3.979107, 0, -4.695324,
-4.162541, 0, -4.933812,
-3.979107, 1, -4.695324,
-4.162541, 1, -4.933812,
-3.979107, 2, -4.695324,
-4.162541, 2, -4.933812,
-3.979107, 3, -4.695324,
-4.162541, 3, -4.933812
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
-4.529408, -3, -5.410788, 0, -0.5, 0.5, 0.5,
-4.529408, -3, -5.410788, 1, -0.5, 0.5, 0.5,
-4.529408, -3, -5.410788, 1, 1.5, 0.5, 0.5,
-4.529408, -3, -5.410788, 0, 1.5, 0.5, 0.5,
-4.529408, -2, -5.410788, 0, -0.5, 0.5, 0.5,
-4.529408, -2, -5.410788, 1, -0.5, 0.5, 0.5,
-4.529408, -2, -5.410788, 1, 1.5, 0.5, 0.5,
-4.529408, -2, -5.410788, 0, 1.5, 0.5, 0.5,
-4.529408, -1, -5.410788, 0, -0.5, 0.5, 0.5,
-4.529408, -1, -5.410788, 1, -0.5, 0.5, 0.5,
-4.529408, -1, -5.410788, 1, 1.5, 0.5, 0.5,
-4.529408, -1, -5.410788, 0, 1.5, 0.5, 0.5,
-4.529408, 0, -5.410788, 0, -0.5, 0.5, 0.5,
-4.529408, 0, -5.410788, 1, -0.5, 0.5, 0.5,
-4.529408, 0, -5.410788, 1, 1.5, 0.5, 0.5,
-4.529408, 0, -5.410788, 0, 1.5, 0.5, 0.5,
-4.529408, 1, -5.410788, 0, -0.5, 0.5, 0.5,
-4.529408, 1, -5.410788, 1, -0.5, 0.5, 0.5,
-4.529408, 1, -5.410788, 1, 1.5, 0.5, 0.5,
-4.529408, 1, -5.410788, 0, 1.5, 0.5, 0.5,
-4.529408, 2, -5.410788, 0, -0.5, 0.5, 0.5,
-4.529408, 2, -5.410788, 1, -0.5, 0.5, 0.5,
-4.529408, 2, -5.410788, 1, 1.5, 0.5, 0.5,
-4.529408, 2, -5.410788, 0, 1.5, 0.5, 0.5,
-4.529408, 3, -5.410788, 0, -0.5, 0.5, 0.5,
-4.529408, 3, -5.410788, 1, -0.5, 0.5, 0.5,
-4.529408, 3, -5.410788, 1, 1.5, 0.5, 0.5,
-4.529408, 3, -5.410788, 0, 1.5, 0.5, 0.5
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
-3.979107, -3.351269, -4,
-3.979107, -3.351269, 4,
-3.979107, -3.351269, -4,
-4.162541, -3.524054, -4,
-3.979107, -3.351269, -2,
-4.162541, -3.524054, -2,
-3.979107, -3.351269, 0,
-4.162541, -3.524054, 0,
-3.979107, -3.351269, 2,
-4.162541, -3.524054, 2,
-3.979107, -3.351269, 4,
-4.162541, -3.524054, 4
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
-4.529408, -3.869625, -4, 0, -0.5, 0.5, 0.5,
-4.529408, -3.869625, -4, 1, -0.5, 0.5, 0.5,
-4.529408, -3.869625, -4, 1, 1.5, 0.5, 0.5,
-4.529408, -3.869625, -4, 0, 1.5, 0.5, 0.5,
-4.529408, -3.869625, -2, 0, -0.5, 0.5, 0.5,
-4.529408, -3.869625, -2, 1, -0.5, 0.5, 0.5,
-4.529408, -3.869625, -2, 1, 1.5, 0.5, 0.5,
-4.529408, -3.869625, -2, 0, 1.5, 0.5, 0.5,
-4.529408, -3.869625, 0, 0, -0.5, 0.5, 0.5,
-4.529408, -3.869625, 0, 1, -0.5, 0.5, 0.5,
-4.529408, -3.869625, 0, 1, 1.5, 0.5, 0.5,
-4.529408, -3.869625, 0, 0, 1.5, 0.5, 0.5,
-4.529408, -3.869625, 2, 0, -0.5, 0.5, 0.5,
-4.529408, -3.869625, 2, 1, -0.5, 0.5, 0.5,
-4.529408, -3.869625, 2, 1, 1.5, 0.5, 0.5,
-4.529408, -3.869625, 2, 0, 1.5, 0.5, 0.5,
-4.529408, -3.869625, 4, 0, -0.5, 0.5, 0.5,
-4.529408, -3.869625, 4, 1, -0.5, 0.5, 0.5,
-4.529408, -3.869625, 4, 1, 1.5, 0.5, 0.5,
-4.529408, -3.869625, 4, 0, 1.5, 0.5, 0.5
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
-3.979107, -3.351269, -4.695324,
-3.979107, 3.56015, -4.695324,
-3.979107, -3.351269, 4.84418,
-3.979107, 3.56015, 4.84418,
-3.979107, -3.351269, -4.695324,
-3.979107, -3.351269, 4.84418,
-3.979107, 3.56015, -4.695324,
-3.979107, 3.56015, 4.84418,
-3.979107, -3.351269, -4.695324,
3.358244, -3.351269, -4.695324,
-3.979107, -3.351269, 4.84418,
3.358244, -3.351269, 4.84418,
-3.979107, 3.56015, -4.695324,
3.358244, 3.56015, -4.695324,
-3.979107, 3.56015, 4.84418,
3.358244, 3.56015, 4.84418,
3.358244, -3.351269, -4.695324,
3.358244, 3.56015, -4.695324,
3.358244, -3.351269, 4.84418,
3.358244, 3.56015, 4.84418,
3.358244, -3.351269, -4.695324,
3.358244, -3.351269, 4.84418,
3.358244, 3.56015, -4.695324,
3.358244, 3.56015, 4.84418
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
var radius = 7.41073;
var distance = 32.97118;
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
mvMatrix.translate( 0.3104317, -0.1044405, -0.0744276 );
mvMatrix.scale( 1.092033, 1.159332, 0.8399416 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.97118);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
InChI_1S_C42H67NO10.<-read.table("InChI_1S_C42H67NO10..xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C42H67NO10.$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C42H67NO10.' not found
```

```r
y<-InChI_1S_C42H67NO10.$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C42H67NO10.' not found
```

```r
z<-InChI_1S_C42H67NO10.$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C42H67NO10.' not found
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
-3.872252, -2.070745, -3.683488, 0, 0, 1, 1, 1,
-3.386611, 1.010199, -2.679385, 1, 0, 0, 1, 1,
-3.018607, 1.63959, -1.600522, 1, 0, 0, 1, 1,
-2.898994, 0.7124364, -0.9260685, 1, 0, 0, 1, 1,
-2.776978, -2.469758, -2.487109, 1, 0, 0, 1, 1,
-2.617418, -0.1279425, -2.641055, 1, 0, 0, 1, 1,
-2.566177, 2.420532, -1.193152, 0, 0, 0, 1, 1,
-2.555984, 1.018658, 0.03484876, 0, 0, 0, 1, 1,
-2.424086, 0.7450984, -0.07619781, 0, 0, 0, 1, 1,
-2.415513, 1.118692, -1.239483, 0, 0, 0, 1, 1,
-2.408202, -1.259954, -2.507003, 0, 0, 0, 1, 1,
-2.406535, 0.02138655, -0.1134605, 0, 0, 0, 1, 1,
-2.38255, -0.1413351, -0.6262305, 0, 0, 0, 1, 1,
-2.334697, 1.537377, -1.634748, 1, 1, 1, 1, 1,
-2.286915, -0.6644697, -0.1100755, 1, 1, 1, 1, 1,
-2.27479, 0.7269611, -1.086234, 1, 1, 1, 1, 1,
-2.267627, 0.7609879, -1.602094, 1, 1, 1, 1, 1,
-2.262098, 0.3397434, -1.142953, 1, 1, 1, 1, 1,
-2.209655, 1.477391, -0.7398183, 1, 1, 1, 1, 1,
-2.128322, 0.5340204, 0.2639792, 1, 1, 1, 1, 1,
-2.117103, -0.5166234, -0.6424303, 1, 1, 1, 1, 1,
-2.074862, 0.4267068, -0.3575043, 1, 1, 1, 1, 1,
-2.069611, 0.4980094, -1.325377, 1, 1, 1, 1, 1,
-2.065065, 0.8682189, -2.421892, 1, 1, 1, 1, 1,
-2.059769, -0.2837096, -2.198712, 1, 1, 1, 1, 1,
-2.047273, 0.3079683, -2.461676, 1, 1, 1, 1, 1,
-2.012881, -1.129578, -1.926596, 1, 1, 1, 1, 1,
-1.982852, 0.3913309, -1.010863, 1, 1, 1, 1, 1,
-1.9749, 1.336175, -1.243397, 0, 0, 1, 1, 1,
-1.956396, 0.2980185, -2.062125, 1, 0, 0, 1, 1,
-1.93443, 0.2888333, -1.701217, 1, 0, 0, 1, 1,
-1.931776, -1.049552, -2.839637, 1, 0, 0, 1, 1,
-1.927433, 0.7986637, -1.190437, 1, 0, 0, 1, 1,
-1.924247, -1.076192, -2.380277, 1, 0, 0, 1, 1,
-1.921086, -1.162653, -1.37349, 0, 0, 0, 1, 1,
-1.894385, -1.248363, -1.577834, 0, 0, 0, 1, 1,
-1.888423, 0.3843917, 1.17358, 0, 0, 0, 1, 1,
-1.875948, -1.678255, -2.81718, 0, 0, 0, 1, 1,
-1.862669, -2.579166, -2.851794, 0, 0, 0, 1, 1,
-1.861799, 0.8470297, -0.8016098, 0, 0, 0, 1, 1,
-1.853468, 1.460019, 0.01329452, 0, 0, 0, 1, 1,
-1.829076, -1.373064, -2.219426, 1, 1, 1, 1, 1,
-1.826289, 0.226413, -1.268423, 1, 1, 1, 1, 1,
-1.804061, -0.5269082, -1.620407, 1, 1, 1, 1, 1,
-1.803052, 0.5685262, -1.968086, 1, 1, 1, 1, 1,
-1.80166, -1.302176, -2.594704, 1, 1, 1, 1, 1,
-1.788551, -0.3878047, -0.9826316, 1, 1, 1, 1, 1,
-1.787153, 0.5074845, 0.01791838, 1, 1, 1, 1, 1,
-1.785757, -0.7678587, -2.373512, 1, 1, 1, 1, 1,
-1.776209, -0.1174041, -1.067735, 1, 1, 1, 1, 1,
-1.766883, -0.1113698, -2.211212, 1, 1, 1, 1, 1,
-1.76389, 0.7826356, -1.478374, 1, 1, 1, 1, 1,
-1.733079, -3.250617, -1.203363, 1, 1, 1, 1, 1,
-1.730467, 0.3324627, -0.7827145, 1, 1, 1, 1, 1,
-1.727443, 0.6654693, -0.4263715, 1, 1, 1, 1, 1,
-1.722027, 1.266121, -1.939187, 1, 1, 1, 1, 1,
-1.719683, -1.161763, -0.8889819, 0, 0, 1, 1, 1,
-1.710629, 0.6667626, -1.338307, 1, 0, 0, 1, 1,
-1.707338, 0.2240586, -0.04830143, 1, 0, 0, 1, 1,
-1.688175, 0.7933509, -0.3226836, 1, 0, 0, 1, 1,
-1.670456, -1.43303, -0.9438576, 1, 0, 0, 1, 1,
-1.637193, 2.863745, -0.5635169, 1, 0, 0, 1, 1,
-1.620887, -0.2214474, -1.909309, 0, 0, 0, 1, 1,
-1.620716, -0.1181551, -2.164892, 0, 0, 0, 1, 1,
-1.613162, -1.621754, -3.160757, 0, 0, 0, 1, 1,
-1.607436, -2.191689, -0.8195638, 0, 0, 0, 1, 1,
-1.604571, 0.4594722, -3.147949, 0, 0, 0, 1, 1,
-1.60231, 0.6491182, -1.128152, 0, 0, 0, 1, 1,
-1.599483, -0.7312706, -1.979464, 0, 0, 0, 1, 1,
-1.596924, -1.424893, -3.400266, 1, 1, 1, 1, 1,
-1.591415, 0.5601842, 0.9530439, 1, 1, 1, 1, 1,
-1.58228, 0.3431364, -0.8541658, 1, 1, 1, 1, 1,
-1.556134, 1.192581, -1.463138, 1, 1, 1, 1, 1,
-1.550506, -0.2625131, -2.449005, 1, 1, 1, 1, 1,
-1.543828, -0.5189845, -2.615587, 1, 1, 1, 1, 1,
-1.543133, 0.05601304, -1.242484, 1, 1, 1, 1, 1,
-1.539156, 0.2777524, -1.636706, 1, 1, 1, 1, 1,
-1.524118, -1.833925, -1.486938, 1, 1, 1, 1, 1,
-1.514709, 1.233805, -1.986469, 1, 1, 1, 1, 1,
-1.509943, 0.4443941, -0.763972, 1, 1, 1, 1, 1,
-1.50598, 0.441283, -1.382822, 1, 1, 1, 1, 1,
-1.501285, -0.4959044, -3.127259, 1, 1, 1, 1, 1,
-1.500163, -0.3519047, -1.302315, 1, 1, 1, 1, 1,
-1.497808, 2.039, -0.3841588, 1, 1, 1, 1, 1,
-1.495664, 0.3795917, -1.233058, 0, 0, 1, 1, 1,
-1.474328, -0.2710226, -0.1149278, 1, 0, 0, 1, 1,
-1.465553, 1.113707, -1.103668, 1, 0, 0, 1, 1,
-1.428268, 0.3894156, -2.986985, 1, 0, 0, 1, 1,
-1.425152, -0.3347011, -2.848211, 1, 0, 0, 1, 1,
-1.423942, 0.7506356, 0.2370106, 1, 0, 0, 1, 1,
-1.42277, -0.2151671, -2.950408, 0, 0, 0, 1, 1,
-1.413631, -1.561014, -1.957585, 0, 0, 0, 1, 1,
-1.413101, 0.7262446, 0.1328069, 0, 0, 0, 1, 1,
-1.410951, 0.5139007, -0.5701763, 0, 0, 0, 1, 1,
-1.394035, 0.8081555, -0.49958, 0, 0, 0, 1, 1,
-1.384808, 1.185164, 0.2892714, 0, 0, 0, 1, 1,
-1.377536, -1.328296, -2.980081, 0, 0, 0, 1, 1,
-1.373239, -2.797732, -4.420047, 1, 1, 1, 1, 1,
-1.330339, -0.2971138, -1.637757, 1, 1, 1, 1, 1,
-1.319678, -0.991548, -1.972573, 1, 1, 1, 1, 1,
-1.301443, -0.3602578, -2.239613, 1, 1, 1, 1, 1,
-1.300439, 0.8274283, -1.232953, 1, 1, 1, 1, 1,
-1.295875, -0.3892512, -2.442828, 1, 1, 1, 1, 1,
-1.293883, 0.770135, -1.599075, 1, 1, 1, 1, 1,
-1.292136, -1.394177, -1.669182, 1, 1, 1, 1, 1,
-1.269559, 0.5037154, -0.8031183, 1, 1, 1, 1, 1,
-1.262055, 0.8750213, 0.2624278, 1, 1, 1, 1, 1,
-1.26127, -1.340086, -2.207989, 1, 1, 1, 1, 1,
-1.260443, -0.9671144, -2.569666, 1, 1, 1, 1, 1,
-1.257206, -0.4389126, -2.308133, 1, 1, 1, 1, 1,
-1.255404, 0.7814752, -1.649884, 1, 1, 1, 1, 1,
-1.251639, 1.324039, -1.354988, 1, 1, 1, 1, 1,
-1.239576, -0.8965698, -1.586624, 0, 0, 1, 1, 1,
-1.224546, -0.2429342, -3.846083, 1, 0, 0, 1, 1,
-1.224368, 0.2199001, -1.519072, 1, 0, 0, 1, 1,
-1.223619, -1.130184, -1.462826, 1, 0, 0, 1, 1,
-1.221492, -0.6860394, -0.02314504, 1, 0, 0, 1, 1,
-1.220419, 1.274315, 0.1697877, 1, 0, 0, 1, 1,
-1.212914, -0.5259932, -2.714302, 0, 0, 0, 1, 1,
-1.208802, 0.3428132, 0.4550804, 0, 0, 0, 1, 1,
-1.208552, -1.082303, -2.335428, 0, 0, 0, 1, 1,
-1.199944, 1.958061, -1.055342, 0, 0, 0, 1, 1,
-1.199872, 0.5286774, -1.429852, 0, 0, 0, 1, 1,
-1.19826, 3.459498, 0.7025761, 0, 0, 0, 1, 1,
-1.195092, -1.969945, -2.158722, 0, 0, 0, 1, 1,
-1.194058, -0.8778415, -2.373867, 1, 1, 1, 1, 1,
-1.190012, -0.3138949, -2.000546, 1, 1, 1, 1, 1,
-1.188715, 0.01150381, -3.787562, 1, 1, 1, 1, 1,
-1.181741, -0.108052, -1.758987, 1, 1, 1, 1, 1,
-1.179293, -0.1513854, -1.444967, 1, 1, 1, 1, 1,
-1.178503, -0.6074966, -2.410435, 1, 1, 1, 1, 1,
-1.173956, -1.549853, -1.536296, 1, 1, 1, 1, 1,
-1.171869, 0.2216389, -1.547999, 1, 1, 1, 1, 1,
-1.161925, 0.9324348, 1.453736, 1, 1, 1, 1, 1,
-1.16037, 0.09035738, -0.3453621, 1, 1, 1, 1, 1,
-1.158227, -0.4748465, 0.5507526, 1, 1, 1, 1, 1,
-1.15297, 0.09408305, -0.08857756, 1, 1, 1, 1, 1,
-1.152848, -0.01538682, -1.483933, 1, 1, 1, 1, 1,
-1.151574, 1.811096, 0.03130463, 1, 1, 1, 1, 1,
-1.14989, -0.834317, -2.109135, 1, 1, 1, 1, 1,
-1.149392, 0.2953677, -1.672902, 0, 0, 1, 1, 1,
-1.14835, 1.710041, -1.493181, 1, 0, 0, 1, 1,
-1.142934, -0.6468832, -1.769841, 1, 0, 0, 1, 1,
-1.129707, 1.367772, -1.135943, 1, 0, 0, 1, 1,
-1.126765, -0.9039112, -2.098685, 1, 0, 0, 1, 1,
-1.121629, -0.2306655, -1.340448, 1, 0, 0, 1, 1,
-1.120925, -0.1507952, -2.309555, 0, 0, 0, 1, 1,
-1.11819, -0.3017544, -2.792509, 0, 0, 0, 1, 1,
-1.104693, 1.353585, 0.3480506, 0, 0, 0, 1, 1,
-1.101511, -1.167104, -1.795657, 0, 0, 0, 1, 1,
-1.097928, 0.4554034, -0.7036721, 0, 0, 0, 1, 1,
-1.080719, -1.255895, -1.357056, 0, 0, 0, 1, 1,
-1.080472, 0.147509, -3.185126, 0, 0, 0, 1, 1,
-1.079678, -0.7733095, -1.993548, 1, 1, 1, 1, 1,
-1.07351, 1.202545, -1.343764, 1, 1, 1, 1, 1,
-1.068781, 0.4228714, -0.9011539, 1, 1, 1, 1, 1,
-1.066304, -0.4637832, -3.488044, 1, 1, 1, 1, 1,
-1.061743, 0.4899886, -0.7703966, 1, 1, 1, 1, 1,
-1.048092, 0.08724261, -2.442505, 1, 1, 1, 1, 1,
-1.046353, -0.6604629, -2.58779, 1, 1, 1, 1, 1,
-1.04246, 0.09488066, -1.811838, 1, 1, 1, 1, 1,
-1.040586, 0.1942633, -1.085343, 1, 1, 1, 1, 1,
-1.038995, 0.8504304, -0.1963515, 1, 1, 1, 1, 1,
-1.018573, -0.09207112, -1.958292, 1, 1, 1, 1, 1,
-1.012333, -0.3091778, -0.5156571, 1, 1, 1, 1, 1,
-1.007598, 0.3414662, -1.00631, 1, 1, 1, 1, 1,
-1.003097, 0.2961637, -0.1705489, 1, 1, 1, 1, 1,
-0.9946593, 0.04577437, -0.2857372, 1, 1, 1, 1, 1,
-0.9913321, 0.7656935, -0.8569281, 0, 0, 1, 1, 1,
-0.9860847, 0.579808, -3.524603, 1, 0, 0, 1, 1,
-0.9826607, 0.1757938, -0.7565701, 1, 0, 0, 1, 1,
-0.9788227, 0.9844324, -1.249484, 1, 0, 0, 1, 1,
-0.9683822, -1.469994, -1.85974, 1, 0, 0, 1, 1,
-0.9633988, -1.022857, -1.810516, 1, 0, 0, 1, 1,
-0.959425, 0.2756834, 0.168065, 0, 0, 0, 1, 1,
-0.9534922, 1.336046, -0.7653429, 0, 0, 0, 1, 1,
-0.9514642, 1.838294, -0.06988044, 0, 0, 0, 1, 1,
-0.9463026, -0.1493683, -1.121688, 0, 0, 0, 1, 1,
-0.9445185, -1.568163, -3.763159, 0, 0, 0, 1, 1,
-0.9376209, -0.2487253, -3.112993, 0, 0, 0, 1, 1,
-0.9371059, 0.6538337, 0.3698906, 0, 0, 0, 1, 1,
-0.9351262, 0.8584228, -1.824519, 1, 1, 1, 1, 1,
-0.9283208, -0.2377896, -1.863794, 1, 1, 1, 1, 1,
-0.9281327, 0.3280683, -1.969738, 1, 1, 1, 1, 1,
-0.9184047, 0.9651579, -0.8223429, 1, 1, 1, 1, 1,
-0.9161018, -0.7312039, -1.347393, 1, 1, 1, 1, 1,
-0.9056807, -0.5543672, -3.922975, 1, 1, 1, 1, 1,
-0.9010878, 0.7210782, 0.4352532, 1, 1, 1, 1, 1,
-0.8993453, -0.1885918, -2.911378, 1, 1, 1, 1, 1,
-0.8907018, 0.4130322, -2.408768, 1, 1, 1, 1, 1,
-0.8871959, -0.9958753, -2.255104, 1, 1, 1, 1, 1,
-0.8747877, -0.2179425, -0.9614998, 1, 1, 1, 1, 1,
-0.8706449, -0.5128033, -0.9019591, 1, 1, 1, 1, 1,
-0.8686281, -0.7438437, -1.849479, 1, 1, 1, 1, 1,
-0.8653313, -1.620186, -1.925485, 1, 1, 1, 1, 1,
-0.8651294, 0.1851671, -1.86127, 1, 1, 1, 1, 1,
-0.8647573, -0.6853796, -1.451884, 0, 0, 1, 1, 1,
-0.857899, 1.431193, 0.07111655, 1, 0, 0, 1, 1,
-0.8574554, -0.5748541, -1.49089, 1, 0, 0, 1, 1,
-0.8551818, 0.3923217, -1.94248, 1, 0, 0, 1, 1,
-0.8527614, -1.938439, -2.150743, 1, 0, 0, 1, 1,
-0.8524747, -0.1129655, -1.060951, 1, 0, 0, 1, 1,
-0.8414567, 0.4580552, -3.048932, 0, 0, 0, 1, 1,
-0.8389124, 0.2864782, -1.046288, 0, 0, 0, 1, 1,
-0.8383003, 0.2889261, -2.442339, 0, 0, 0, 1, 1,
-0.8376012, 2.257919, 0.6910049, 0, 0, 0, 1, 1,
-0.8358901, -0.5482002, -1.621637, 0, 0, 0, 1, 1,
-0.829413, 1.977196, -0.7708608, 0, 0, 0, 1, 1,
-0.8254768, 1.198509, 1.605928, 0, 0, 0, 1, 1,
-0.8252598, -0.8526098, -2.400938, 1, 1, 1, 1, 1,
-0.8206782, 0.2641895, -3.286593, 1, 1, 1, 1, 1,
-0.8205218, 1.585834, -0.3365887, 1, 1, 1, 1, 1,
-0.8151676, -0.8235679, -1.047112, 1, 1, 1, 1, 1,
-0.8139206, -0.9673507, -2.412623, 1, 1, 1, 1, 1,
-0.8111567, -1.09319, -1.23623, 1, 1, 1, 1, 1,
-0.7979407, -0.3240693, -0.5605091, 1, 1, 1, 1, 1,
-0.7932049, 0.671253, -1.0209, 1, 1, 1, 1, 1,
-0.791855, 0.5048352, -1.353588, 1, 1, 1, 1, 1,
-0.7917145, 0.09163089, 1.680604, 1, 1, 1, 1, 1,
-0.7874992, 0.09989145, -2.453879, 1, 1, 1, 1, 1,
-0.7779986, -0.003105459, -0.9277395, 1, 1, 1, 1, 1,
-0.7763648, 0.5709233, -0.04655599, 1, 1, 1, 1, 1,
-0.7762721, -0.230553, -2.240212, 1, 1, 1, 1, 1,
-0.7757961, -0.8916662, -2.68539, 1, 1, 1, 1, 1,
-0.7728764, -0.7192559, -3.156917, 0, 0, 1, 1, 1,
-0.7690199, 0.01844914, -2.616989, 1, 0, 0, 1, 1,
-0.7689532, -1.337806, -1.77381, 1, 0, 0, 1, 1,
-0.7687454, -0.4102556, -0.9265945, 1, 0, 0, 1, 1,
-0.7671766, 0.1204377, -0.17253, 1, 0, 0, 1, 1,
-0.767013, 0.1561967, -1.981259, 1, 0, 0, 1, 1,
-0.764788, -1.087578, -1.101973, 0, 0, 0, 1, 1,
-0.7640769, 1.02017, -1.199443, 0, 0, 0, 1, 1,
-0.7604241, 0.5692194, -1.308323, 0, 0, 0, 1, 1,
-0.7582598, 1.479665, 0.398672, 0, 0, 0, 1, 1,
-0.7499343, 2.63885, -2.029333, 0, 0, 0, 1, 1,
-0.7455816, 0.8451374, 0.4925054, 0, 0, 0, 1, 1,
-0.7427708, 0.4986328, -2.268336, 0, 0, 0, 1, 1,
-0.7417871, -2.195711, -2.551125, 1, 1, 1, 1, 1,
-0.7411681, -1.289845, -2.382357, 1, 1, 1, 1, 1,
-0.7337692, -1.467481, -3.104196, 1, 1, 1, 1, 1,
-0.7293216, -2.614661, -3.250049, 1, 1, 1, 1, 1,
-0.7291837, -1.386057, -3.108704, 1, 1, 1, 1, 1,
-0.725247, 0.4103567, -1.897306, 1, 1, 1, 1, 1,
-0.7233941, -1.875352, -1.354039, 1, 1, 1, 1, 1,
-0.7210103, -2.113375, -3.342007, 1, 1, 1, 1, 1,
-0.7172264, -1.390828, -4.09993, 1, 1, 1, 1, 1,
-0.7153842, 1.506152, -0.6799588, 1, 1, 1, 1, 1,
-0.7133413, 1.119317, -0.7936335, 1, 1, 1, 1, 1,
-0.7130978, -2.664946, -1.634112, 1, 1, 1, 1, 1,
-0.7084582, 0.4330497, -1.757622, 1, 1, 1, 1, 1,
-0.7067571, 0.4621405, -0.7055327, 1, 1, 1, 1, 1,
-0.6949161, 2.499697, -0.4941883, 1, 1, 1, 1, 1,
-0.6939001, -0.09800139, -1.160658, 0, 0, 1, 1, 1,
-0.6905999, -0.9465846, -4.221263, 1, 0, 0, 1, 1,
-0.6875553, 0.9443474, 0.3314309, 1, 0, 0, 1, 1,
-0.6834642, 0.1683627, 0.4842808, 1, 0, 0, 1, 1,
-0.6813248, 0.007457836, -1.175726, 1, 0, 0, 1, 1,
-0.680292, -0.1945835, -2.214788, 1, 0, 0, 1, 1,
-0.6750721, -0.3012641, 0.1528617, 0, 0, 0, 1, 1,
-0.6715608, -0.5862373, -2.422908, 0, 0, 0, 1, 1,
-0.6692719, 0.7564818, 1.018792, 0, 0, 0, 1, 1,
-0.6608585, -1.448398, -1.335396, 0, 0, 0, 1, 1,
-0.6551709, 0.5088699, -1.631164, 0, 0, 0, 1, 1,
-0.6541654, 0.6475528, 0.5343022, 0, 0, 0, 1, 1,
-0.6507467, 0.03105074, 1.522263, 0, 0, 0, 1, 1,
-0.6451504, 1.24959, 1.50532, 1, 1, 1, 1, 1,
-0.6411898, 0.2522472, -0.06379975, 1, 1, 1, 1, 1,
-0.6355875, -1.725182, -0.4591346, 1, 1, 1, 1, 1,
-0.6312088, 0.6769944, -0.5255839, 1, 1, 1, 1, 1,
-0.6294619, -0.2765325, -2.266581, 1, 1, 1, 1, 1,
-0.6282648, 0.3367228, -0.8438795, 1, 1, 1, 1, 1,
-0.6224405, -1.245282, -1.923071, 1, 1, 1, 1, 1,
-0.6206777, 0.5953895, 0.9875587, 1, 1, 1, 1, 1,
-0.6140045, -0.1716065, -1.917172, 1, 1, 1, 1, 1,
-0.6060542, 0.8802024, -0.6600709, 1, 1, 1, 1, 1,
-0.6036968, -1.840196, -2.811923, 1, 1, 1, 1, 1,
-0.6026775, -0.4015658, -3.24049, 1, 1, 1, 1, 1,
-0.6017429, 0.9423637, -0.6673564, 1, 1, 1, 1, 1,
-0.5966806, -0.6231025, -0.5140415, 1, 1, 1, 1, 1,
-0.5847487, 0.06232914, -0.5622401, 1, 1, 1, 1, 1,
-0.5825061, 1.4314, 1.9866, 0, 0, 1, 1, 1,
-0.581839, -0.824542, -2.56671, 1, 0, 0, 1, 1,
-0.5798003, -0.3986393, -1.542142, 1, 0, 0, 1, 1,
-0.5787721, 1.18325, -1.588907, 1, 0, 0, 1, 1,
-0.5769222, 0.5988162, -0.2650602, 1, 0, 0, 1, 1,
-0.5697933, 0.1703672, -0.5487773, 1, 0, 0, 1, 1,
-0.569768, 0.7724008, 0.3177337, 0, 0, 0, 1, 1,
-0.5686941, -0.2464931, -3.168693, 0, 0, 0, 1, 1,
-0.5648574, 0.86185, -2.404239, 0, 0, 0, 1, 1,
-0.5585976, 0.3171805, -1.65545, 0, 0, 0, 1, 1,
-0.557603, -0.7723156, -3.408903, 0, 0, 0, 1, 1,
-0.5575866, -0.5930625, -3.097086, 0, 0, 0, 1, 1,
-0.5533903, -0.3589592, -0.6822453, 0, 0, 0, 1, 1,
-0.5513925, -1.71437, -1.490372, 1, 1, 1, 1, 1,
-0.5485945, -0.2016631, -1.881937, 1, 1, 1, 1, 1,
-0.5454935, 0.9467214, -1.523335, 1, 1, 1, 1, 1,
-0.5454544, 1.221552, -0.296958, 1, 1, 1, 1, 1,
-0.542775, 0.4147426, -2.565823, 1, 1, 1, 1, 1,
-0.5426616, -1.617694, -2.976586, 1, 1, 1, 1, 1,
-0.5364322, 0.03202619, -0.9056849, 1, 1, 1, 1, 1,
-0.5346282, 0.3998472, -0.2320591, 1, 1, 1, 1, 1,
-0.5327072, -0.4223473, -2.16607, 1, 1, 1, 1, 1,
-0.5317999, -1.661417, -2.448654, 1, 1, 1, 1, 1,
-0.5244309, 0.6266412, -0.3840827, 1, 1, 1, 1, 1,
-0.5236402, -0.5440409, -2.503293, 1, 1, 1, 1, 1,
-0.5188763, 0.3338922, 0.4468066, 1, 1, 1, 1, 1,
-0.5180209, -0.9223018, -3.04693, 1, 1, 1, 1, 1,
-0.5166739, 0.389295, -0.9324536, 1, 1, 1, 1, 1,
-0.5166367, -1.250272, -2.046435, 0, 0, 1, 1, 1,
-0.5160975, 0.6585895, -0.7348781, 1, 0, 0, 1, 1,
-0.5125061, 1.095832, 0.1553012, 1, 0, 0, 1, 1,
-0.509835, -1.241799, -1.946711, 1, 0, 0, 1, 1,
-0.5097046, -0.8949582, -2.663482, 1, 0, 0, 1, 1,
-0.5077674, 0.5981263, -1.620683, 1, 0, 0, 1, 1,
-0.5059054, -0.1479519, -2.377043, 0, 0, 0, 1, 1,
-0.5045754, 0.3909634, -2.416865, 0, 0, 0, 1, 1,
-0.4989814, -1.275818, -3.049872, 0, 0, 0, 1, 1,
-0.4979226, -1.754465, -3.016822, 0, 0, 0, 1, 1,
-0.4964865, -0.8215797, -4.440719, 0, 0, 0, 1, 1,
-0.4945699, -1.444414, -3.452916, 0, 0, 0, 1, 1,
-0.4829797, 0.8064016, -0.898499, 0, 0, 0, 1, 1,
-0.4763328, 1.394729, -0.5172569, 1, 1, 1, 1, 1,
-0.4757629, 0.7677004, -2.178884, 1, 1, 1, 1, 1,
-0.4739572, -0.8992376, -3.931479, 1, 1, 1, 1, 1,
-0.4647781, -2.539486, -2.962678, 1, 1, 1, 1, 1,
-0.4598211, 0.2515285, -2.165235, 1, 1, 1, 1, 1,
-0.4527926, -1.769558, -2.464791, 1, 1, 1, 1, 1,
-0.4488799, -0.5609602, -3.829017, 1, 1, 1, 1, 1,
-0.446666, 1.617739, -0.9413119, 1, 1, 1, 1, 1,
-0.4453111, -0.3425508, -1.655378, 1, 1, 1, 1, 1,
-0.442803, -0.2440891, -2.41687, 1, 1, 1, 1, 1,
-0.4404316, 1.159052, -0.7794136, 1, 1, 1, 1, 1,
-0.4365495, -0.7400983, -1.951159, 1, 1, 1, 1, 1,
-0.4333694, -2.069532, -2.125198, 1, 1, 1, 1, 1,
-0.4320952, -1.161404, -2.002956, 1, 1, 1, 1, 1,
-0.4290953, 0.004592695, 0.8697683, 1, 1, 1, 1, 1,
-0.4152675, -0.9497095, -2.430114, 0, 0, 1, 1, 1,
-0.4129192, -0.592501, -3.032304, 1, 0, 0, 1, 1,
-0.4100085, 1.914739, 1.044269, 1, 0, 0, 1, 1,
-0.4091534, -1.782979, -3.44078, 1, 0, 0, 1, 1,
-0.4048087, 0.4482298, -1.744847, 1, 0, 0, 1, 1,
-0.3956845, 0.3229528, -0.9836409, 1, 0, 0, 1, 1,
-0.3902776, 1.470624, 0.007048614, 0, 0, 0, 1, 1,
-0.3894427, -2.973372, -2.471086, 0, 0, 0, 1, 1,
-0.3876293, 0.03472322, -3.148135, 0, 0, 0, 1, 1,
-0.3805942, 1.123985, -1.332336, 0, 0, 0, 1, 1,
-0.3768053, -1.618027, -3.722455, 0, 0, 0, 1, 1,
-0.3767642, -0.429222, -3.665624, 0, 0, 0, 1, 1,
-0.3767354, 0.5752838, 1.231387, 0, 0, 0, 1, 1,
-0.3764827, 1.019701, -1.268434, 1, 1, 1, 1, 1,
-0.3755388, -0.101238, -2.097169, 1, 1, 1, 1, 1,
-0.3707374, 2.066275, -1.807106, 1, 1, 1, 1, 1,
-0.3660893, -0.6097842, -2.185326, 1, 1, 1, 1, 1,
-0.3656265, -0.4693424, -2.543364, 1, 1, 1, 1, 1,
-0.3637881, -0.4392354, -2.660062, 1, 1, 1, 1, 1,
-0.3598636, -0.629821, -2.490071, 1, 1, 1, 1, 1,
-0.3577182, 1.844511, -0.339136, 1, 1, 1, 1, 1,
-0.3535746, -0.104256, -0.1589398, 1, 1, 1, 1, 1,
-0.351281, 0.5521822, -0.2588626, 1, 1, 1, 1, 1,
-0.3512071, -1.236561, -3.099738, 1, 1, 1, 1, 1,
-0.3509367, 0.4359315, -0.09737584, 1, 1, 1, 1, 1,
-0.3466578, 0.3281864, -1.151941, 1, 1, 1, 1, 1,
-0.3451795, -0.009078974, 0.1727831, 1, 1, 1, 1, 1,
-0.3428963, -0.05589205, -0.561982, 1, 1, 1, 1, 1,
-0.3389131, -0.3298842, -0.6108782, 0, 0, 1, 1, 1,
-0.3342721, 0.1677349, -0.4507466, 1, 0, 0, 1, 1,
-0.3335419, -0.4162405, -2.249501, 1, 0, 0, 1, 1,
-0.3322492, 1.104828, -3.355, 1, 0, 0, 1, 1,
-0.3310788, -1.066849, -4.472772, 1, 0, 0, 1, 1,
-0.3297442, -1.003658, -2.838447, 1, 0, 0, 1, 1,
-0.3293257, -2.436474, -4.471255, 0, 0, 0, 1, 1,
-0.3282382, -1.185515, -4.083466, 0, 0, 0, 1, 1,
-0.3280802, -0.002864433, -0.772198, 0, 0, 0, 1, 1,
-0.325085, 0.5763785, -1.29336, 0, 0, 0, 1, 1,
-0.3229916, -0.2849996, -2.732639, 0, 0, 0, 1, 1,
-0.3204113, -0.3586458, -3.864359, 0, 0, 0, 1, 1,
-0.3194026, -0.9007643, -2.96483, 0, 0, 0, 1, 1,
-0.318995, 0.08667394, -0.9590786, 1, 1, 1, 1, 1,
-0.3127461, -0.598963, -4.367401, 1, 1, 1, 1, 1,
-0.3123159, -0.6639608, -3.675841, 1, 1, 1, 1, 1,
-0.3078275, 1.444341, -0.951109, 1, 1, 1, 1, 1,
-0.3070126, -0.4531036, -3.740503, 1, 1, 1, 1, 1,
-0.305488, -0.4359373, -2.965077, 1, 1, 1, 1, 1,
-0.3042484, 0.9762456, -1.097585, 1, 1, 1, 1, 1,
-0.2991128, -1.790327, -2.859398, 1, 1, 1, 1, 1,
-0.2977036, 0.8770721, 0.06115615, 1, 1, 1, 1, 1,
-0.2970519, 1.596706, 0.709116, 1, 1, 1, 1, 1,
-0.2932045, 0.1061202, -1.932973, 1, 1, 1, 1, 1,
-0.2919224, 1.506215, -0.4573504, 1, 1, 1, 1, 1,
-0.2905895, 1.415764, 0.02376712, 1, 1, 1, 1, 1,
-0.2880552, -0.6618807, -2.386241, 1, 1, 1, 1, 1,
-0.2871801, 1.375568, -0.9824957, 1, 1, 1, 1, 1,
-0.2828295, -0.9967279, -2.195292, 0, 0, 1, 1, 1,
-0.2828034, -0.6533318, -3.242753, 1, 0, 0, 1, 1,
-0.2815971, -0.3420662, -3.268902, 1, 0, 0, 1, 1,
-0.2793439, -0.3980759, -2.721622, 1, 0, 0, 1, 1,
-0.2783052, 0.1914443, 0.1893546, 1, 0, 0, 1, 1,
-0.2753941, -0.5775734, -1.573324, 1, 0, 0, 1, 1,
-0.2656968, 1.492455, -0.09083132, 0, 0, 0, 1, 1,
-0.2641234, -2.100243, -1.715043, 0, 0, 0, 1, 1,
-0.2640039, 0.8664403, -0.3196233, 0, 0, 0, 1, 1,
-0.2634597, -0.4118486, -2.131209, 0, 0, 0, 1, 1,
-0.2617142, 2.487151, -0.2358762, 0, 0, 0, 1, 1,
-0.2587785, -0.9755492, -3.724656, 0, 0, 0, 1, 1,
-0.2558568, 0.2093423, -0.02377319, 0, 0, 0, 1, 1,
-0.2534662, -0.4852217, -3.454789, 1, 1, 1, 1, 1,
-0.2470984, 0.1843094, -0.5883142, 1, 1, 1, 1, 1,
-0.2445301, -1.204134, -2.715312, 1, 1, 1, 1, 1,
-0.2408266, 0.4315828, 1.192521, 1, 1, 1, 1, 1,
-0.2371033, 1.593883, -0.4633194, 1, 1, 1, 1, 1,
-0.2365634, -0.419102, -1.671184, 1, 1, 1, 1, 1,
-0.236002, 0.8103362, -0.1250446, 1, 1, 1, 1, 1,
-0.2332933, 1.391613, 1.07219, 1, 1, 1, 1, 1,
-0.232488, 0.01770124, -1.156332, 1, 1, 1, 1, 1,
-0.2265409, 0.8485209, -1.780332, 1, 1, 1, 1, 1,
-0.224553, 0.2389789, -1.005186, 1, 1, 1, 1, 1,
-0.2218456, -1.651318, -2.45702, 1, 1, 1, 1, 1,
-0.2202237, -1.345994, -2.896472, 1, 1, 1, 1, 1,
-0.2196972, 0.7641948, -0.7025824, 1, 1, 1, 1, 1,
-0.2180819, 1.489702, -0.2700894, 1, 1, 1, 1, 1,
-0.2152157, 1.107619, 0.3964678, 0, 0, 1, 1, 1,
-0.2110551, -0.07212969, -2.451794, 1, 0, 0, 1, 1,
-0.2097261, -0.7871998, -2.140928, 1, 0, 0, 1, 1,
-0.2046545, -1.142698, -3.8719, 1, 0, 0, 1, 1,
-0.202266, -0.6571831, -1.379499, 1, 0, 0, 1, 1,
-0.1997792, 0.7907232, -0.05078517, 1, 0, 0, 1, 1,
-0.1961811, 0.2571916, -0.9988418, 0, 0, 0, 1, 1,
-0.1943116, 0.5709171, -1.226592, 0, 0, 0, 1, 1,
-0.1934317, -0.3679618, -1.256557, 0, 0, 0, 1, 1,
-0.1902386, 1.074477, -2.298471, 0, 0, 0, 1, 1,
-0.1891473, -0.3915983, -3.353514, 0, 0, 0, 1, 1,
-0.1785191, 0.03204635, 0.4785706, 0, 0, 0, 1, 1,
-0.1738125, 1.392393, 0.5496847, 0, 0, 0, 1, 1,
-0.1729607, 1.45888, -1.45721, 1, 1, 1, 1, 1,
-0.1710009, -0.3597991, -2.733143, 1, 1, 1, 1, 1,
-0.1707347, 0.2038418, 1.075224, 1, 1, 1, 1, 1,
-0.1662128, 0.5207769, -0.3333966, 1, 1, 1, 1, 1,
-0.1554965, 1.2435, -1.468422, 1, 1, 1, 1, 1,
-0.1534086, 0.7766927, 0.3325028, 1, 1, 1, 1, 1,
-0.1489625, -0.7210909, -4.5564, 1, 1, 1, 1, 1,
-0.1484721, -0.7075614, -2.976247, 1, 1, 1, 1, 1,
-0.147166, 0.3907188, -0.2525987, 1, 1, 1, 1, 1,
-0.1435956, -1.117511, -3.718767, 1, 1, 1, 1, 1,
-0.1416762, 0.87011, -1.834867, 1, 1, 1, 1, 1,
-0.1390741, 0.4894468, -0.4485672, 1, 1, 1, 1, 1,
-0.1389329, -0.6014926, -3.536886, 1, 1, 1, 1, 1,
-0.1353735, -0.4054917, -2.911888, 1, 1, 1, 1, 1,
-0.1343828, -1.200371, -0.7513766, 1, 1, 1, 1, 1,
-0.1319274, 0.1406411, 0.1397023, 0, 0, 1, 1, 1,
-0.1268869, -1.020708, -3.126259, 1, 0, 0, 1, 1,
-0.1258855, 0.4716201, 0.7005488, 1, 0, 0, 1, 1,
-0.1238576, 1.534974, -1.795424, 1, 0, 0, 1, 1,
-0.122326, 1.120519, 1.092988, 1, 0, 0, 1, 1,
-0.1189085, -0.396291, -3.618721, 1, 0, 0, 1, 1,
-0.1170847, -0.01001068, -1.169961, 0, 0, 0, 1, 1,
-0.1126772, -0.02950183, -1.154544, 0, 0, 0, 1, 1,
-0.1041941, 2.981347, 1.418506, 0, 0, 0, 1, 1,
-0.1023, -0.7249578, -3.055922, 0, 0, 0, 1, 1,
-0.1001101, -2.818371, -2.914372, 0, 0, 0, 1, 1,
-0.09755667, -1.001218, -2.813712, 0, 0, 0, 1, 1,
-0.09302276, 0.6941653, -0.7695748, 0, 0, 0, 1, 1,
-0.09147722, 0.8260239, -0.6799297, 1, 1, 1, 1, 1,
-0.08842651, -0.8773917, -2.311291, 1, 1, 1, 1, 1,
-0.08003926, 0.9015594, -1.450864, 1, 1, 1, 1, 1,
-0.07753292, 1.561321, 0.802198, 1, 1, 1, 1, 1,
-0.07595856, -0.0569834, -0.2099455, 1, 1, 1, 1, 1,
-0.07422859, -0.7981191, -3.573779, 1, 1, 1, 1, 1,
-0.07335714, -1.541671, -2.451108, 1, 1, 1, 1, 1,
-0.07296373, -0.6937442, -2.074843, 1, 1, 1, 1, 1,
-0.07110438, 2.245836, -0.5471091, 1, 1, 1, 1, 1,
-0.06766995, -0.2217534, -1.641565, 1, 1, 1, 1, 1,
-0.0664871, 1.068103, 1.122822, 1, 1, 1, 1, 1,
-0.06537122, -0.8327546, -4.431494, 1, 1, 1, 1, 1,
-0.06282472, 0.6016554, -0.1236362, 1, 1, 1, 1, 1,
-0.05687989, 0.5297639, 0.1553193, 1, 1, 1, 1, 1,
-0.05568662, -0.07574681, -3.220118, 1, 1, 1, 1, 1,
-0.05451713, 0.2550619, -0.1715639, 0, 0, 1, 1, 1,
-0.05089082, -0.4782284, -2.558398, 1, 0, 0, 1, 1,
-0.05088419, -0.3617332, -2.165823, 1, 0, 0, 1, 1,
-0.05029246, -0.4195384, -4.209466, 1, 0, 0, 1, 1,
-0.04966884, -1.037393, -1.470377, 1, 0, 0, 1, 1,
-0.04873174, 0.4377622, 0.9560086, 1, 0, 0, 1, 1,
-0.04371667, 0.9895144, 0.250513, 0, 0, 0, 1, 1,
-0.04166439, 0.4989185, -0.7671614, 0, 0, 0, 1, 1,
-0.04053514, 1.84917, -0.7630454, 0, 0, 0, 1, 1,
-0.03872249, -0.05170529, -2.13322, 0, 0, 0, 1, 1,
-0.03404188, 1.81038, 0.1338076, 0, 0, 0, 1, 1,
-0.03330676, -0.9087425, -1.505796, 0, 0, 0, 1, 1,
-0.03192146, -0.2435297, -4.172716, 0, 0, 0, 1, 1,
-0.02496013, 0.05730269, -0.1206508, 1, 1, 1, 1, 1,
-0.0244768, 2.177524, -0.5153987, 1, 1, 1, 1, 1,
-0.02367815, 0.1847609, -0.8366166, 1, 1, 1, 1, 1,
-0.01938851, -0.7381285, -4.433138, 1, 1, 1, 1, 1,
-0.01893138, 0.6794115, -1.258633, 1, 1, 1, 1, 1,
-0.01710011, -0.1867998, -3.263432, 1, 1, 1, 1, 1,
-0.01560231, 0.1905431, 0.2498954, 1, 1, 1, 1, 1,
-0.005921196, 0.4029039, 0.983232, 1, 1, 1, 1, 1,
-0.001990415, 0.01520888, 0.2556758, 1, 1, 1, 1, 1,
0.0007869383, 0.6424677, 2.086144, 1, 1, 1, 1, 1,
0.00333632, 0.144814, 0.9162251, 1, 1, 1, 1, 1,
0.003807245, 1.844552, 0.2688707, 1, 1, 1, 1, 1,
0.004328093, -1.71055, 3.324456, 1, 1, 1, 1, 1,
0.01022089, -0.655719, 4.705255, 1, 1, 1, 1, 1,
0.01026511, -1.013516, 2.498805, 1, 1, 1, 1, 1,
0.01043569, 0.4763741, -1.015369, 0, 0, 1, 1, 1,
0.01046909, -1.106916, 3.575934, 1, 0, 0, 1, 1,
0.01690662, 0.06492164, 0.07539129, 1, 0, 0, 1, 1,
0.02198463, -0.4727456, 4.057076, 1, 0, 0, 1, 1,
0.02318146, -0.5121576, 4.390113, 1, 0, 0, 1, 1,
0.02428968, 0.5432466, -1.581371, 1, 0, 0, 1, 1,
0.02530386, 0.01833262, -0.2739829, 0, 0, 0, 1, 1,
0.02653124, 0.4136422, 0.9383485, 0, 0, 0, 1, 1,
0.0268655, -0.6187967, 3.378211, 0, 0, 0, 1, 1,
0.0303523, -0.3330452, 2.130012, 0, 0, 0, 1, 1,
0.03140107, -1.761636, 1.476097, 0, 0, 0, 1, 1,
0.03803238, 0.6003569, -0.7676417, 0, 0, 0, 1, 1,
0.0388418, 0.7786571, 0.7850869, 0, 0, 0, 1, 1,
0.03937462, 0.3997116, -0.6708127, 1, 1, 1, 1, 1,
0.04145582, 0.3426994, 0.8492664, 1, 1, 1, 1, 1,
0.04211471, 0.5665711, 2.334495, 1, 1, 1, 1, 1,
0.04640096, -1.326878, 4.186904, 1, 1, 1, 1, 1,
0.0466444, 2.023673, 0.08359145, 1, 1, 1, 1, 1,
0.04741243, 1.644783, 1.02398, 1, 1, 1, 1, 1,
0.05107786, 0.007717404, 1.858751, 1, 1, 1, 1, 1,
0.05115264, -0.4322276, 2.584902, 1, 1, 1, 1, 1,
0.05281631, -0.5069694, 4.647471, 1, 1, 1, 1, 1,
0.05356396, -0.3964655, 4.165607, 1, 1, 1, 1, 1,
0.05485959, 0.4026442, 0.9654976, 1, 1, 1, 1, 1,
0.05606357, -1.213238, 3.657119, 1, 1, 1, 1, 1,
0.06193274, -0.2839774, 1.705386, 1, 1, 1, 1, 1,
0.06466224, 0.7823298, 0.7302013, 1, 1, 1, 1, 1,
0.07050304, -0.1217635, 4.003709, 1, 1, 1, 1, 1,
0.0740867, -2.580718, 2.686079, 0, 0, 1, 1, 1,
0.07895521, 0.07524166, 0.7517816, 1, 0, 0, 1, 1,
0.08073233, 0.5983794, 1.133585, 1, 0, 0, 1, 1,
0.08152456, -0.9339754, 3.890402, 1, 0, 0, 1, 1,
0.08657517, 1.232547, 0.7614377, 1, 0, 0, 1, 1,
0.09003965, -0.2300766, 1.7146, 1, 0, 0, 1, 1,
0.09176293, 1.691637, 0.02904665, 0, 0, 0, 1, 1,
0.09494192, 0.08430603, 1.702722, 0, 0, 0, 1, 1,
0.09880176, -0.01757148, 1.179598, 0, 0, 0, 1, 1,
0.09933205, 0.4230568, 0.9096384, 0, 0, 0, 1, 1,
0.1002033, 0.7246535, 1.739913, 0, 0, 0, 1, 1,
0.101288, -1.380176, 1.804137, 0, 0, 0, 1, 1,
0.1028094, -0.3251427, 2.138535, 0, 0, 0, 1, 1,
0.1068083, 1.235713, -1.009607, 1, 1, 1, 1, 1,
0.1080029, 1.730397, 0.4295256, 1, 1, 1, 1, 1,
0.1110931, -0.818633, 2.579126, 1, 1, 1, 1, 1,
0.1133873, -0.4303308, 3.388297, 1, 1, 1, 1, 1,
0.1227092, -0.1609187, 1.284802, 1, 1, 1, 1, 1,
0.1290953, -0.09301955, 1.143204, 1, 1, 1, 1, 1,
0.1310267, -2.304374, 3.098456, 1, 1, 1, 1, 1,
0.1331426, 0.3497391, -0.1920837, 1, 1, 1, 1, 1,
0.1366167, 1.374092, 0.3203822, 1, 1, 1, 1, 1,
0.1375127, 0.05259852, 1.864249, 1, 1, 1, 1, 1,
0.1389238, 0.2643527, 2.890604, 1, 1, 1, 1, 1,
0.1395168, -0.9434624, 2.406993, 1, 1, 1, 1, 1,
0.1398756, 1.348491, -1.400535, 1, 1, 1, 1, 1,
0.1430967, -1.110375, 2.198415, 1, 1, 1, 1, 1,
0.1451479, 0.1458755, 0.2642869, 1, 1, 1, 1, 1,
0.1452172, 1.392753, 1.332034, 0, 0, 1, 1, 1,
0.1468012, 0.8852605, 0.4490306, 1, 0, 0, 1, 1,
0.1476427, 1.927197, -1.78824, 1, 0, 0, 1, 1,
0.1479546, 1.7249, -1.549721, 1, 0, 0, 1, 1,
0.1487638, -0.7347501, 3.099307, 1, 0, 0, 1, 1,
0.1489575, -0.8903975, 3.687686, 1, 0, 0, 1, 1,
0.1491168, -1.038772, 1.753371, 0, 0, 0, 1, 1,
0.1495226, -0.8492204, 3.887182, 0, 0, 0, 1, 1,
0.1513863, -0.8609858, 1.570827, 0, 0, 0, 1, 1,
0.1530612, -0.1553133, 3.203418, 0, 0, 0, 1, 1,
0.1546979, 0.4712482, -0.3474624, 0, 0, 0, 1, 1,
0.1563922, 0.05074106, 2.052447, 0, 0, 0, 1, 1,
0.1581838, -0.7789434, 2.487845, 0, 0, 0, 1, 1,
0.1597425, -0.7507102, 3.599166, 1, 1, 1, 1, 1,
0.1605031, 0.03080701, 1.637875, 1, 1, 1, 1, 1,
0.1665149, -0.01213189, 0.6716568, 1, 1, 1, 1, 1,
0.1690177, -1.049855, 1.319461, 1, 1, 1, 1, 1,
0.1691414, 0.77784, 0.81213, 1, 1, 1, 1, 1,
0.1757537, -0.2313901, 1.656881, 1, 1, 1, 1, 1,
0.1790591, 1.995848, 0.6022449, 1, 1, 1, 1, 1,
0.1884515, 1.675375, 1.471622, 1, 1, 1, 1, 1,
0.1939574, 0.5261049, 1.255922, 1, 1, 1, 1, 1,
0.1964346, 1.875143, -0.8344727, 1, 1, 1, 1, 1,
0.1967435, 0.7800384, 0.5635731, 1, 1, 1, 1, 1,
0.1974744, 0.7710329, -0.6076056, 1, 1, 1, 1, 1,
0.1976178, -0.3138177, 1.865839, 1, 1, 1, 1, 1,
0.197858, -0.3033698, 2.117093, 1, 1, 1, 1, 1,
0.1985717, -0.5420273, 4.192435, 1, 1, 1, 1, 1,
0.2008179, -0.02065635, 2.542569, 0, 0, 1, 1, 1,
0.2017077, -0.1576352, 1.096342, 1, 0, 0, 1, 1,
0.2024686, -0.166845, 2.201402, 1, 0, 0, 1, 1,
0.2042762, 1.107765, 0.1563172, 1, 0, 0, 1, 1,
0.2072979, 2.398404, 0.1051946, 1, 0, 0, 1, 1,
0.2113407, 0.7057306, -0.6129209, 1, 0, 0, 1, 1,
0.2134611, -0.162231, 1.961058, 0, 0, 0, 1, 1,
0.213843, -0.6913825, 2.513054, 0, 0, 0, 1, 1,
0.2185371, 0.04908129, 1.533463, 0, 0, 0, 1, 1,
0.2235162, 0.6477758, 1.213724, 0, 0, 0, 1, 1,
0.2327552, -0.4878835, 3.735025, 0, 0, 0, 1, 1,
0.2329704, -0.8158286, 1.980443, 0, 0, 0, 1, 1,
0.2344677, -0.5880643, 2.520867, 0, 0, 0, 1, 1,
0.2390948, -0.01152038, 0.1630644, 1, 1, 1, 1, 1,
0.2391383, -0.8807912, 3.064362, 1, 1, 1, 1, 1,
0.2401773, -1.108245, 3.060905, 1, 1, 1, 1, 1,
0.2436461, 0.2160571, 0.997307, 1, 1, 1, 1, 1,
0.2461599, -0.5729806, 2.852466, 1, 1, 1, 1, 1,
0.246202, -0.386566, 2.795173, 1, 1, 1, 1, 1,
0.2512195, 0.4064261, 1.317273, 1, 1, 1, 1, 1,
0.2558176, -1.034925, 3.00427, 1, 1, 1, 1, 1,
0.2649848, 0.8390869, 0.527383, 1, 1, 1, 1, 1,
0.2664332, 0.04611202, 3.201256, 1, 1, 1, 1, 1,
0.2679581, 0.5419428, -0.4871091, 1, 1, 1, 1, 1,
0.268187, 0.4376695, 0.6425938, 1, 1, 1, 1, 1,
0.2683794, 2.388472, -1.1448, 1, 1, 1, 1, 1,
0.2726061, 0.8758077, 0.9671723, 1, 1, 1, 1, 1,
0.2767419, 1.251315, -0.1494635, 1, 1, 1, 1, 1,
0.2817361, -0.3667068, 0.6924517, 0, 0, 1, 1, 1,
0.2825394, -0.3535435, 0.6584198, 1, 0, 0, 1, 1,
0.2831115, 0.5139695, 2.483708, 1, 0, 0, 1, 1,
0.2833872, -0.3093783, 3.90084, 1, 0, 0, 1, 1,
0.2850271, 0.5212539, 1.339396, 1, 0, 0, 1, 1,
0.2863543, 1.060462, -0.3869124, 1, 0, 0, 1, 1,
0.289757, -0.6728067, 2.270543, 0, 0, 0, 1, 1,
0.2905192, -1.868184, 2.77766, 0, 0, 0, 1, 1,
0.2935525, -0.4482037, 0.7356357, 0, 0, 0, 1, 1,
0.2954557, 1.225175, -0.2395481, 0, 0, 0, 1, 1,
0.3009488, 0.2844544, -0.2541141, 0, 0, 0, 1, 1,
0.3043332, 0.275425, 0.47695, 0, 0, 0, 1, 1,
0.3047532, 0.1949497, 1.882525, 0, 0, 0, 1, 1,
0.3051662, -1.695659, 2.26855, 1, 1, 1, 1, 1,
0.3092331, 0.6382633, 1.009737, 1, 1, 1, 1, 1,
0.3109005, -0.08875423, 2.719977, 1, 1, 1, 1, 1,
0.3109822, 0.5243974, 0.9525818, 1, 1, 1, 1, 1,
0.3115312, 0.2377704, 2.628687, 1, 1, 1, 1, 1,
0.3122253, 0.8979851, 0.4317107, 1, 1, 1, 1, 1,
0.3128907, 0.273084, -1.51304, 1, 1, 1, 1, 1,
0.3167329, 0.3152265, -0.3113509, 1, 1, 1, 1, 1,
0.3173369, 1.004795, -0.171864, 1, 1, 1, 1, 1,
0.3184598, -0.006914238, 1.026944, 1, 1, 1, 1, 1,
0.3188986, -1.612852, 0.598396, 1, 1, 1, 1, 1,
0.3231772, -0.9719908, 2.178234, 1, 1, 1, 1, 1,
0.3238489, 0.3458786, 2.441949, 1, 1, 1, 1, 1,
0.3277699, -0.00383534, 1.843775, 1, 1, 1, 1, 1,
0.3280169, 1.229364, 1.16414, 1, 1, 1, 1, 1,
0.331797, 0.2089376, 1.109097, 0, 0, 1, 1, 1,
0.3335968, -1.078717, 2.275884, 1, 0, 0, 1, 1,
0.3393622, -0.05215331, 1.557267, 1, 0, 0, 1, 1,
0.3452339, 0.6039258, 0.6756598, 1, 0, 0, 1, 1,
0.3457716, 0.6704827, 2.478229, 1, 0, 0, 1, 1,
0.3471492, -1.027803, 1.755015, 1, 0, 0, 1, 1,
0.3474009, -0.6911891, 2.077554, 0, 0, 0, 1, 1,
0.3520376, -2.892123, 2.515766, 0, 0, 0, 1, 1,
0.3535897, -0.2534965, 1.824965, 0, 0, 0, 1, 1,
0.3582577, 2.090587, 0.6179593, 0, 0, 0, 1, 1,
0.3601287, 1.161688, 0.542012, 0, 0, 0, 1, 1,
0.3717494, -0.751238, 1.805508, 0, 0, 0, 1, 1,
0.3719608, -1.77107, 3.502455, 0, 0, 0, 1, 1,
0.3732214, 1.216487, 0.582894, 1, 1, 1, 1, 1,
0.3759362, -0.2610676, 1.342179, 1, 1, 1, 1, 1,
0.392488, -0.2712679, 3.129489, 1, 1, 1, 1, 1,
0.3990586, 0.4275897, 0.8178887, 1, 1, 1, 1, 1,
0.3999486, -0.0169489, 2.626185, 1, 1, 1, 1, 1,
0.4018264, 1.518418, -0.3124526, 1, 1, 1, 1, 1,
0.4104949, 1.190427, -2.256758, 1, 1, 1, 1, 1,
0.4126036, -0.6077291, 1.112196, 1, 1, 1, 1, 1,
0.4195171, -1.482359, 4.393357, 1, 1, 1, 1, 1,
0.4231163, -0.4291529, 4.285112, 1, 1, 1, 1, 1,
0.4343743, -0.5499687, 3.025392, 1, 1, 1, 1, 1,
0.4346812, 0.2555115, 1.300534, 1, 1, 1, 1, 1,
0.4378357, 0.8109355, -0.1359059, 1, 1, 1, 1, 1,
0.4391162, 0.3857238, 1.873694, 1, 1, 1, 1, 1,
0.4445652, -0.1919871, 3.281518, 1, 1, 1, 1, 1,
0.4457677, 0.6839148, 0.853731, 0, 0, 1, 1, 1,
0.4519995, -0.8046182, 4.07974, 1, 0, 0, 1, 1,
0.4525563, -1.103293, 1.885342, 1, 0, 0, 1, 1,
0.4562977, -0.3564513, 1.168881, 1, 0, 0, 1, 1,
0.4617636, 1.610541, 0.3470554, 1, 0, 0, 1, 1,
0.4633386, 0.01319475, 1.899313, 1, 0, 0, 1, 1,
0.4664648, -1.621731, 3.08153, 0, 0, 0, 1, 1,
0.4691309, -0.3573149, 2.489312, 0, 0, 0, 1, 1,
0.4697312, -0.8687727, 4.440828, 0, 0, 0, 1, 1,
0.473571, -0.4222358, 4.608011, 0, 0, 0, 1, 1,
0.4796997, 1.220759, -0.9350221, 0, 0, 0, 1, 1,
0.4823888, -2.37752, 3.10522, 0, 0, 0, 1, 1,
0.4840642, -1.121055, 4.239751, 0, 0, 0, 1, 1,
0.4890948, -0.3589494, 3.676839, 1, 1, 1, 1, 1,
0.4898761, 0.8042177, 0.469201, 1, 1, 1, 1, 1,
0.4924484, -1.004937, 2.125866, 1, 1, 1, 1, 1,
0.4949092, 1.405612, -1.438956, 1, 1, 1, 1, 1,
0.4992166, -0.4981247, 2.858031, 1, 1, 1, 1, 1,
0.4997327, -0.6256261, 4.349704, 1, 1, 1, 1, 1,
0.5063593, 1.992171, 0.03362981, 1, 1, 1, 1, 1,
0.5076734, -1.294923, 2.760934, 1, 1, 1, 1, 1,
0.5082755, 0.06642834, 2.569074, 1, 1, 1, 1, 1,
0.5097795, 1.995776, -0.1800203, 1, 1, 1, 1, 1,
0.5117168, 0.4359703, 1.586275, 1, 1, 1, 1, 1,
0.5127375, -1.732212, 3.235745, 1, 1, 1, 1, 1,
0.5157521, -1.594883, 1.071411, 1, 1, 1, 1, 1,
0.5240785, -0.3462764, 2.187953, 1, 1, 1, 1, 1,
0.5243958, 2.037604, -0.2612698, 1, 1, 1, 1, 1,
0.526291, -0.275681, 1.159918, 0, 0, 1, 1, 1,
0.5274175, 1.221339, 0.5515306, 1, 0, 0, 1, 1,
0.5297385, 0.364092, 0.8540887, 1, 0, 0, 1, 1,
0.5299619, 0.1161502, 1.222737, 1, 0, 0, 1, 1,
0.5312538, 0.1880012, 0.6839997, 1, 0, 0, 1, 1,
0.5329762, -0.09425629, 1.796464, 1, 0, 0, 1, 1,
0.5336675, 0.06094265, 2.107117, 0, 0, 0, 1, 1,
0.5337504, -1.57959, 3.878525, 0, 0, 0, 1, 1,
0.5369282, -1.201289, 3.236586, 0, 0, 0, 1, 1,
0.537765, 1.557773, 1.229005, 0, 0, 0, 1, 1,
0.5475373, 0.2703146, -0.1152311, 0, 0, 0, 1, 1,
0.548268, 0.1811639, -0.1150281, 0, 0, 0, 1, 1,
0.5497468, 0.4555478, 1.250577, 0, 0, 0, 1, 1,
0.5515305, -1.515414, 3.010881, 1, 1, 1, 1, 1,
0.5517626, 1.258359, 0.838861, 1, 1, 1, 1, 1,
0.5616637, 0.3415641, 1.206907, 1, 1, 1, 1, 1,
0.5617728, -0.3216124, 2.056697, 1, 1, 1, 1, 1,
0.5709667, -0.9926779, 1.898443, 1, 1, 1, 1, 1,
0.5715578, -0.1094429, 1.253251, 1, 1, 1, 1, 1,
0.5744234, 0.7884478, 0.7685551, 1, 1, 1, 1, 1,
0.5762773, -0.05292073, 1.911584, 1, 1, 1, 1, 1,
0.584887, 0.2852723, 1.191408, 1, 1, 1, 1, 1,
0.5881489, 1.192299, -0.3413206, 1, 1, 1, 1, 1,
0.5897512, 1.252363, -0.7106854, 1, 1, 1, 1, 1,
0.5928669, 0.6495088, 0.3007775, 1, 1, 1, 1, 1,
0.5936656, -1.211938, 1.91958, 1, 1, 1, 1, 1,
0.6051432, 0.4689751, 2.325071, 1, 1, 1, 1, 1,
0.6059893, 0.6527792, 1.172129, 1, 1, 1, 1, 1,
0.606893, 1.80614, 0.7328095, 0, 0, 1, 1, 1,
0.6231546, 0.1049533, -0.1063812, 1, 0, 0, 1, 1,
0.6236212, -0.333068, 3.48073, 1, 0, 0, 1, 1,
0.6265928, 1.342059, -1.323515, 1, 0, 0, 1, 1,
0.6373366, -0.02073709, 3.148269, 1, 0, 0, 1, 1,
0.6419748, -0.1349571, 1.386848, 1, 0, 0, 1, 1,
0.6423717, 1.210528, 0.06157374, 0, 0, 0, 1, 1,
0.6436333, 0.2838772, 2.908243, 0, 0, 0, 1, 1,
0.6462772, -0.6180682, 1.179323, 0, 0, 0, 1, 1,
0.6504768, 0.8769794, 0.5162238, 0, 0, 0, 1, 1,
0.6517994, 1.422753, -0.1186743, 0, 0, 0, 1, 1,
0.6528985, -1.696572, 4.202189, 0, 0, 0, 1, 1,
0.6588091, 1.06045, 1.213071, 0, 0, 0, 1, 1,
0.6603148, -0.0970398, -0.7779912, 1, 1, 1, 1, 1,
0.6622603, 2.035282, -1.43704, 1, 1, 1, 1, 1,
0.6622918, -0.7026048, 3.327517, 1, 1, 1, 1, 1,
0.6667164, -0.4532205, 1.294998, 1, 1, 1, 1, 1,
0.674931, 0.6378867, -0.3110218, 1, 1, 1, 1, 1,
0.6759363, -0.07862546, 1.964142, 1, 1, 1, 1, 1,
0.6820545, 0.003529466, 0.5714824, 1, 1, 1, 1, 1,
0.6867275, 0.01925892, 2.719111, 1, 1, 1, 1, 1,
0.6873326, -0.5518573, 1.541243, 1, 1, 1, 1, 1,
0.6879802, -0.7028637, 2.925079, 1, 1, 1, 1, 1,
0.6884322, 0.1835801, 1.005947, 1, 1, 1, 1, 1,
0.6966281, -1.4092, 2.605638, 1, 1, 1, 1, 1,
0.7000225, 1.79443, 1.40021, 1, 1, 1, 1, 1,
0.7076649, -0.198323, 2.203239, 1, 1, 1, 1, 1,
0.7090336, -1.089545, 3.298925, 1, 1, 1, 1, 1,
0.709941, 0.9681801, 1.33061, 0, 0, 1, 1, 1,
0.7179213, -2.150981, 1.692057, 1, 0, 0, 1, 1,
0.7212008, -0.6417715, 0.7442592, 1, 0, 0, 1, 1,
0.725311, 0.6603038, 0.8523434, 1, 0, 0, 1, 1,
0.7311059, -0.3194026, 1.33121, 1, 0, 0, 1, 1,
0.7374946, 0.5212667, 1.053138, 1, 0, 0, 1, 1,
0.7377205, -0.1045971, 3.008947, 0, 0, 0, 1, 1,
0.7395692, -1.594298, 2.862493, 0, 0, 0, 1, 1,
0.7404612, 0.2368682, 2.290882, 0, 0, 0, 1, 1,
0.7417987, 0.3449681, 0.7730859, 0, 0, 0, 1, 1,
0.7470537, -0.6473951, 2.835578, 0, 0, 0, 1, 1,
0.7491706, -0.7709725, 2.591336, 0, 0, 0, 1, 1,
0.7554988, -0.6597884, 3.573199, 0, 0, 0, 1, 1,
0.7560424, 2.075007, -1.025627, 1, 1, 1, 1, 1,
0.7571827, 0.8545076, 0.4718958, 1, 1, 1, 1, 1,
0.7577426, -0.2944907, 1.90815, 1, 1, 1, 1, 1,
0.7583856, 1.076786, 0.705411, 1, 1, 1, 1, 1,
0.7606634, 0.7349448, 0.6197335, 1, 1, 1, 1, 1,
0.7617852, 0.07551639, 0.8800672, 1, 1, 1, 1, 1,
0.7647791, -0.2032851, -0.3570484, 1, 1, 1, 1, 1,
0.7657555, -0.3446007, 1.339377, 1, 1, 1, 1, 1,
0.7666931, -0.04648938, 1.032774, 1, 1, 1, 1, 1,
0.7689949, -0.1262501, 3.377007, 1, 1, 1, 1, 1,
0.7713357, -1.032231, 1.823034, 1, 1, 1, 1, 1,
0.7722094, -0.02757063, 0.8353786, 1, 1, 1, 1, 1,
0.7739807, 0.4279135, 2.154696, 1, 1, 1, 1, 1,
0.7753138, -0.7365785, 2.907132, 1, 1, 1, 1, 1,
0.7770817, -1.407198, 4.344256, 1, 1, 1, 1, 1,
0.7816335, -1.40145, 1.974944, 0, 0, 1, 1, 1,
0.7820761, 1.049252, 1.014237, 1, 0, 0, 1, 1,
0.7840333, -0.1479027, 2.682934, 1, 0, 0, 1, 1,
0.7901516, 0.3410139, 1.03907, 1, 0, 0, 1, 1,
0.792734, 0.6335828, -1.293342, 1, 0, 0, 1, 1,
0.7927598, 0.9073805, 0.6472606, 1, 0, 0, 1, 1,
0.7965111, -1.145381, 3.283285, 0, 0, 0, 1, 1,
0.8002322, -1.812845, 1.328466, 0, 0, 0, 1, 1,
0.8008287, -1.506084, 2.902357, 0, 0, 0, 1, 1,
0.8122894, 0.5565359, 1.922848, 0, 0, 0, 1, 1,
0.8133888, 0.1641178, 1.062858, 0, 0, 0, 1, 1,
0.8138279, 0.7429394, 1.374657, 0, 0, 0, 1, 1,
0.8155585, -0.9188141, 1.708101, 0, 0, 0, 1, 1,
0.8180404, -0.4067683, 4.289296, 1, 1, 1, 1, 1,
0.8265663, 0.01817056, 2.366495, 1, 1, 1, 1, 1,
0.8310658, 0.3913163, 0.3963512, 1, 1, 1, 1, 1,
0.8327301, -2.267264, 2.271117, 1, 1, 1, 1, 1,
0.8415594, -0.7826394, 2.42075, 1, 1, 1, 1, 1,
0.8554076, -1.499292, 2.835007, 1, 1, 1, 1, 1,
0.8588888, 1.359957, 1.042679, 1, 1, 1, 1, 1,
0.859367, -0.575236, 0.1551036, 1, 1, 1, 1, 1,
0.8604228, 0.6478122, -1.608376, 1, 1, 1, 1, 1,
0.863261, -0.7387689, 2.891444, 1, 1, 1, 1, 1,
0.8700346, 1.562508, -1.192507, 1, 1, 1, 1, 1,
0.8708441, -0.6606523, 1.576791, 1, 1, 1, 1, 1,
0.8728552, -1.07039, 2.367594, 1, 1, 1, 1, 1,
0.8857559, -0.2043168, 1.413525, 1, 1, 1, 1, 1,
0.8878672, 0.630458, 3.041636, 1, 1, 1, 1, 1,
0.8951075, -0.4882, 0.5602514, 0, 0, 1, 1, 1,
0.9175876, 2.315475, -0.03086282, 1, 0, 0, 1, 1,
0.9249847, -1.078542, 2.008482, 1, 0, 0, 1, 1,
0.938084, -0.05135995, 2.108401, 1, 0, 0, 1, 1,
0.9407064, 0.8139223, -0.297525, 1, 0, 0, 1, 1,
0.9457099, 2.338562, 0.801411, 1, 0, 0, 1, 1,
0.948842, -1.13369, 2.010905, 0, 0, 0, 1, 1,
0.9552537, -1.47678, 2.647371, 0, 0, 0, 1, 1,
0.9616662, 0.2501169, 1.966983, 0, 0, 0, 1, 1,
0.9623938, -0.4861886, 0.7769473, 0, 0, 0, 1, 1,
0.9640405, -2.059457, 4.172565, 0, 0, 0, 1, 1,
0.96637, 0.7472588, 1.705729, 0, 0, 0, 1, 1,
0.9716879, -1.243834, 2.900804, 0, 0, 0, 1, 1,
0.9721231, 1.310453, 0.8706061, 1, 1, 1, 1, 1,
0.9752715, -0.6297098, 1.665217, 1, 1, 1, 1, 1,
0.9782187, -0.2932568, 1.549753, 1, 1, 1, 1, 1,
0.9854218, 2.084695, 2.667009, 1, 1, 1, 1, 1,
0.9879583, -2.195661, 2.611019, 1, 1, 1, 1, 1,
0.9889496, -2.087252, 2.474995, 1, 1, 1, 1, 1,
0.9917114, -0.3300423, 0.1931382, 1, 1, 1, 1, 1,
0.9930198, 0.3629061, -0.03670732, 1, 1, 1, 1, 1,
1.000187, 0.8721819, 0.7877371, 1, 1, 1, 1, 1,
1.011106, -0.887469, 2.770079, 1, 1, 1, 1, 1,
1.011622, 0.6091459, 0.1144635, 1, 1, 1, 1, 1,
1.022103, -0.2245902, 2.707859, 1, 1, 1, 1, 1,
1.023892, 0.6900616, 1.237376, 1, 1, 1, 1, 1,
1.028167, 0.2623786, 0.6309868, 1, 1, 1, 1, 1,
1.031866, 0.1784479, 1.610023, 1, 1, 1, 1, 1,
1.036392, 1.351616, 0.6137199, 0, 0, 1, 1, 1,
1.038319, 1.419862, 0.8911204, 1, 0, 0, 1, 1,
1.047942, -1.067834, 2.867785, 1, 0, 0, 1, 1,
1.049539, -1.586417, 4.26191, 1, 0, 0, 1, 1,
1.050434, -2.165258, 2.150056, 1, 0, 0, 1, 1,
1.06616, -0.9693797, 1.598846, 1, 0, 0, 1, 1,
1.06866, 1.311458, 0.8038307, 0, 0, 0, 1, 1,
1.068863, -1.489379, 1.92784, 0, 0, 0, 1, 1,
1.080031, -0.3349258, 2.353335, 0, 0, 0, 1, 1,
1.083534, 1.107792, 1.642069, 0, 0, 0, 1, 1,
1.087613, -0.4231904, 2.624486, 0, 0, 0, 1, 1,
1.089741, -0.5359054, 1.729814, 0, 0, 0, 1, 1,
1.101555, 0.8655337, 2.164183, 0, 0, 0, 1, 1,
1.101615, 0.7878887, 2.168046, 1, 1, 1, 1, 1,
1.10369, 1.009606, -0.06913999, 1, 1, 1, 1, 1,
1.104328, -0.4082207, 1.955801, 1, 1, 1, 1, 1,
1.112036, 0.7393546, 0.184522, 1, 1, 1, 1, 1,
1.113866, -0.5151621, 3.346608, 1, 1, 1, 1, 1,
1.114187, -0.1858577, 1.924875, 1, 1, 1, 1, 1,
1.11782, -1.703392, 0.9864166, 1, 1, 1, 1, 1,
1.118342, -0.6502522, 3.515453, 1, 1, 1, 1, 1,
1.123811, 0.7511523, -0.1618433, 1, 1, 1, 1, 1,
1.138437, 0.3873876, 2.012796, 1, 1, 1, 1, 1,
1.139572, -0.8309844, 3.288394, 1, 1, 1, 1, 1,
1.150639, -0.4621422, 1.099134, 1, 1, 1, 1, 1,
1.157103, 1.528385, 0.5877218, 1, 1, 1, 1, 1,
1.159805, 1.515702, 2.214301, 1, 1, 1, 1, 1,
1.159875, 1.797363, 0.06990321, 1, 1, 1, 1, 1,
1.164974, 0.8233456, 1.064065, 0, 0, 1, 1, 1,
1.165673, -1.232, 0.9463487, 1, 0, 0, 1, 1,
1.170106, -0.7002525, 2.314816, 1, 0, 0, 1, 1,
1.17364, -0.764007, 1.616526, 1, 0, 0, 1, 1,
1.177137, 1.043976, 2.10247, 1, 0, 0, 1, 1,
1.178257, 2.310627, 1.038185, 1, 0, 0, 1, 1,
1.180043, -0.3068157, 2.37283, 0, 0, 0, 1, 1,
1.180944, 0.04813934, 0.3084627, 0, 0, 0, 1, 1,
1.187912, -1.659709, 2.480554, 0, 0, 0, 1, 1,
1.189427, 1.948224, 0.8911425, 0, 0, 0, 1, 1,
1.190912, 0.2828445, 1.280178, 0, 0, 0, 1, 1,
1.192438, 0.4070367, 0.8631356, 0, 0, 0, 1, 1,
1.201697, 0.0985613, 1.235129, 0, 0, 0, 1, 1,
1.203676, 0.6390661, 1.626184, 1, 1, 1, 1, 1,
1.212687, -0.6670297, 2.274642, 1, 1, 1, 1, 1,
1.215103, 1.839114, 0.4057747, 1, 1, 1, 1, 1,
1.219867, 1.231552, 2.68719, 1, 1, 1, 1, 1,
1.220856, 1.234972, 1.253659, 1, 1, 1, 1, 1,
1.234743, -0.3493864, 2.064999, 1, 1, 1, 1, 1,
1.238692, 0.4761969, 0.5939835, 1, 1, 1, 1, 1,
1.239359, 0.7199615, 0.2723517, 1, 1, 1, 1, 1,
1.254515, 1.036595, 0.9867831, 1, 1, 1, 1, 1,
1.254649, -1.923334, 3.042286, 1, 1, 1, 1, 1,
1.256576, -0.2360771, 2.92829, 1, 1, 1, 1, 1,
1.25868, -0.09044414, 3.284888, 1, 1, 1, 1, 1,
1.259206, -1.768158, 1.830145, 1, 1, 1, 1, 1,
1.263625, 0.4388528, 0.126463, 1, 1, 1, 1, 1,
1.267767, 0.1865751, 2.888457, 1, 1, 1, 1, 1,
1.272215, 0.6447212, 2.810247, 0, 0, 1, 1, 1,
1.277667, 0.7770661, 0.5008506, 1, 0, 0, 1, 1,
1.278029, 0.4375337, -0.3089793, 1, 0, 0, 1, 1,
1.282762, -0.2197907, 2.251027, 1, 0, 0, 1, 1,
1.301523, 1.55161, 0.8426615, 1, 0, 0, 1, 1,
1.30588, -0.2248058, 1.622063, 1, 0, 0, 1, 1,
1.306075, -1.028241, 0.08379872, 0, 0, 0, 1, 1,
1.306738, -0.754913, 3.052337, 0, 0, 0, 1, 1,
1.319275, -1.220161, 1.834125, 0, 0, 0, 1, 1,
1.323594, -1.051677, 1.609477, 0, 0, 0, 1, 1,
1.325488, -2.031998, 2.031411, 0, 0, 0, 1, 1,
1.331965, 0.008163909, 1.577219, 0, 0, 0, 1, 1,
1.332404, 1.517922, 1.915279, 0, 0, 0, 1, 1,
1.333746, -2.106164, 2.227359, 1, 1, 1, 1, 1,
1.341146, 0.4513361, -0.9600707, 1, 1, 1, 1, 1,
1.34168, -0.7176317, 1.255474, 1, 1, 1, 1, 1,
1.35105, -0.5634249, -0.3876726, 1, 1, 1, 1, 1,
1.367709, -0.04034178, 2.279922, 1, 1, 1, 1, 1,
1.373552, -0.4241304, 1.343724, 1, 1, 1, 1, 1,
1.381079, -1.504113, 2.987837, 1, 1, 1, 1, 1,
1.38208, -2.621578, 3.417244, 1, 1, 1, 1, 1,
1.385487, -0.2679367, 0.2321268, 1, 1, 1, 1, 1,
1.389203, -0.4871014, 0.2264725, 1, 1, 1, 1, 1,
1.393453, -0.6450096, 0.5335004, 1, 1, 1, 1, 1,
1.397575, -1.144015, 2.287828, 1, 1, 1, 1, 1,
1.397988, -2.314132, 2.768631, 1, 1, 1, 1, 1,
1.39871, -0.04894447, 3.123348, 1, 1, 1, 1, 1,
1.402013, -0.2784391, 2.33381, 1, 1, 1, 1, 1,
1.406159, -1.448807, 1.020919, 0, 0, 1, 1, 1,
1.412841, -1.00236, 1.788405, 1, 0, 0, 1, 1,
1.428102, 0.2113848, 0.5520841, 1, 0, 0, 1, 1,
1.449876, -0.4535375, 2.731429, 1, 0, 0, 1, 1,
1.457531, 1.849133, 0.6160904, 1, 0, 0, 1, 1,
1.460226, -1.087062, 3.416341, 1, 0, 0, 1, 1,
1.468588, -1.149093, 1.54996, 0, 0, 0, 1, 1,
1.480611, -0.4725227, -0.3407476, 0, 0, 0, 1, 1,
1.495474, 1.200861, 0.1521464, 0, 0, 0, 1, 1,
1.528392, -0.4275984, 3.072272, 0, 0, 0, 1, 1,
1.53262, 1.902709, -2.093646, 0, 0, 0, 1, 1,
1.544634, -0.3618456, 0.3273179, 0, 0, 0, 1, 1,
1.544742, -0.5395858, 1.966343, 0, 0, 0, 1, 1,
1.559171, 0.511595, 0.7047051, 1, 1, 1, 1, 1,
1.560388, 0.1193417, 3.194168, 1, 1, 1, 1, 1,
1.583107, 1.786262, -0.5870249, 1, 1, 1, 1, 1,
1.590198, 0.4577742, 0.56393, 1, 1, 1, 1, 1,
1.618117, -0.1029804, 1.415932, 1, 1, 1, 1, 1,
1.6294, -1.062505, 1.506075, 1, 1, 1, 1, 1,
1.642833, 1.053383, -0.395419, 1, 1, 1, 1, 1,
1.645538, 0.8733099, 3.104316, 1, 1, 1, 1, 1,
1.669149, 1.772622, -0.4947226, 1, 1, 1, 1, 1,
1.672787, -0.3308129, 3.158355, 1, 1, 1, 1, 1,
1.689094, 0.3395078, 3.543669, 1, 1, 1, 1, 1,
1.752293, 1.761703, 0.5853952, 1, 1, 1, 1, 1,
1.756743, 0.1938119, 1.585457, 1, 1, 1, 1, 1,
1.761592, 1.24699, 1.830272, 1, 1, 1, 1, 1,
1.782727, 0.9556239, 0.5267053, 1, 1, 1, 1, 1,
1.800883, -0.8265321, 1.506732, 0, 0, 1, 1, 1,
1.81015, 0.07338356, 1.093913, 1, 0, 0, 1, 1,
1.81023, -0.2028533, 2.525175, 1, 0, 0, 1, 1,
1.836966, -1.27799, 1.806867, 1, 0, 0, 1, 1,
1.841544, 0.4219819, 0.3114014, 1, 0, 0, 1, 1,
1.844969, 2.455729, 0.171763, 1, 0, 0, 1, 1,
1.864536, -0.1342927, 0.2960611, 0, 0, 0, 1, 1,
1.871294, 0.3332683, 0.2298865, 0, 0, 0, 1, 1,
1.88148, 1.135299, 0.253436, 0, 0, 0, 1, 1,
1.893399, 0.1858324, 1.420025, 0, 0, 0, 1, 1,
1.915879, -1.525934, 1.830497, 0, 0, 0, 1, 1,
1.979426, -0.687972, 1.927805, 0, 0, 0, 1, 1,
1.998092, -0.2788535, 1.977765, 0, 0, 0, 1, 1,
1.99964, -1.780747, 1.092989, 1, 1, 1, 1, 1,
2.014665, 0.09288513, 0.6860675, 1, 1, 1, 1, 1,
2.051967, -0.04135573, 0.03968366, 1, 1, 1, 1, 1,
2.053944, -0.1645385, 0.0874309, 1, 1, 1, 1, 1,
2.076552, -0.4483979, 1.010588, 1, 1, 1, 1, 1,
2.078734, -0.05929936, 2.492701, 1, 1, 1, 1, 1,
2.082153, -1.823715, 1.967453, 1, 1, 1, 1, 1,
2.095245, -0.4043269, 1.672873, 1, 1, 1, 1, 1,
2.101547, 1.205209, -1.050766, 1, 1, 1, 1, 1,
2.125452, 1.682317, -0.7819679, 1, 1, 1, 1, 1,
2.136611, -0.4968473, 2.643467, 1, 1, 1, 1, 1,
2.202292, -1.008071, 3.300376, 1, 1, 1, 1, 1,
2.210335, 0.00279686, 1.31057, 1, 1, 1, 1, 1,
2.256326, 1.028473, 0.681811, 1, 1, 1, 1, 1,
2.281905, 0.5944096, -0.1524753, 1, 1, 1, 1, 1,
2.300575, 0.5582305, 1.735042, 0, 0, 1, 1, 1,
2.307045, 0.2455702, 2.249438, 1, 0, 0, 1, 1,
2.328351, 0.3677355, 0.1163393, 1, 0, 0, 1, 1,
2.370584, -0.5787973, 1.955396, 1, 0, 0, 1, 1,
2.423843, -1.385584, 1.379902, 1, 0, 0, 1, 1,
2.425082, 0.9646442, 2.922561, 1, 0, 0, 1, 1,
2.443459, -0.9600321, 2.698444, 0, 0, 0, 1, 1,
2.448175, -1.382726, 1.904596, 0, 0, 0, 1, 1,
2.507675, -0.5604991, 2.070232, 0, 0, 0, 1, 1,
2.509632, -0.9200439, 2.481894, 0, 0, 0, 1, 1,
2.510162, 0.9111061, 2.420903, 0, 0, 0, 1, 1,
2.54915, -0.2199663, 1.842844, 0, 0, 0, 1, 1,
2.549981, 0.8568181, 0.7258496, 0, 0, 0, 1, 1,
2.570811, -0.6040648, 0.071444, 1, 1, 1, 1, 1,
2.593552, 0.5314134, 1.619834, 1, 1, 1, 1, 1,
2.601942, 0.1812529, 1.509065, 1, 1, 1, 1, 1,
2.710018, -0.6884701, 3.272867, 1, 1, 1, 1, 1,
2.949607, -2.991997, 1.047587, 1, 1, 1, 1, 1,
2.954838, -0.6897126, 1.535245, 1, 1, 1, 1, 1,
3.251389, -1.428705, 3.674635, 1, 1, 1, 1, 1
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
var radius = 9.300235;
var distance = 32.66668;
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
mvMatrix.translate( 0.3104317, -0.1044405, -0.0744276 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.66668);
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
