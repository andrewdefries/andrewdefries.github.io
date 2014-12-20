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
-3.516576, 0.1617593, -1.494521, 1, 0, 0, 1,
-2.943186, -1.880085, -3.106169, 1, 0.007843138, 0, 1,
-2.725364, -0.7324712, -2.895203, 1, 0.01176471, 0, 1,
-2.469031, 1.579618, -2.758559, 1, 0.01960784, 0, 1,
-2.464014, 1.662482, -0.6262012, 1, 0.02352941, 0, 1,
-2.463971, 0.2633417, -1.776023, 1, 0.03137255, 0, 1,
-2.44478, -1.75328, -1.257185, 1, 0.03529412, 0, 1,
-2.42402, -0.6077124, -1.353784, 1, 0.04313726, 0, 1,
-2.382065, 0.658359, -0.4076715, 1, 0.04705882, 0, 1,
-2.347308, -1.586538, -3.276578, 1, 0.05490196, 0, 1,
-2.32834, 0.1621796, 0.2452419, 1, 0.05882353, 0, 1,
-2.311791, 0.6047249, -0.5035911, 1, 0.06666667, 0, 1,
-2.311283, -0.773636, -1.237312, 1, 0.07058824, 0, 1,
-2.265648, -0.1506652, -3.577893, 1, 0.07843138, 0, 1,
-2.246176, 0.4182498, -1.621338, 1, 0.08235294, 0, 1,
-2.244931, -0.5582954, -1.350314, 1, 0.09019608, 0, 1,
-2.210824, 0.2298602, -0.2568192, 1, 0.09411765, 0, 1,
-2.208808, 0.2832042, -1.359907, 1, 0.1019608, 0, 1,
-2.196925, -0.2192597, -2.237957, 1, 0.1098039, 0, 1,
-2.175889, 1.970586, -1.463994, 1, 0.1137255, 0, 1,
-2.162696, 0.1842329, -1.435104, 1, 0.1215686, 0, 1,
-2.160095, 0.1977256, -1.386567, 1, 0.1254902, 0, 1,
-2.140774, 0.5010895, -1.103383, 1, 0.1333333, 0, 1,
-2.137704, -0.6175229, -1.792586, 1, 0.1372549, 0, 1,
-2.131731, -1.087486, -1.22065, 1, 0.145098, 0, 1,
-2.129326, -0.4664527, -2.094572, 1, 0.1490196, 0, 1,
-2.126419, -1.065404, -2.417646, 1, 0.1568628, 0, 1,
-2.120248, -0.4908265, 0.257603, 1, 0.1607843, 0, 1,
-2.118387, 1.065748, -1.409503, 1, 0.1686275, 0, 1,
-2.023752, -1.011483, -1.940942, 1, 0.172549, 0, 1,
-1.99468, 0.2299662, -0.060124, 1, 0.1803922, 0, 1,
-1.994611, -0.5906029, -3.55857, 1, 0.1843137, 0, 1,
-1.963586, 0.6723769, -0.1969281, 1, 0.1921569, 0, 1,
-1.960956, 0.9028556, -0.8217652, 1, 0.1960784, 0, 1,
-1.925203, -0.5409154, -2.818067, 1, 0.2039216, 0, 1,
-1.901142, 0.4090592, 0.2866789, 1, 0.2117647, 0, 1,
-1.896975, -0.1731555, -2.117626, 1, 0.2156863, 0, 1,
-1.855917, 0.499611, -1.235829, 1, 0.2235294, 0, 1,
-1.834202, 0.7239474, -1.453861, 1, 0.227451, 0, 1,
-1.82702, 0.4358249, -0.7579205, 1, 0.2352941, 0, 1,
-1.809128, -2.104142, -2.813995, 1, 0.2392157, 0, 1,
-1.769657, -0.8555343, -2.774957, 1, 0.2470588, 0, 1,
-1.753473, 1.480922, -0.5613618, 1, 0.2509804, 0, 1,
-1.723791, 0.4140333, -2.371671, 1, 0.2588235, 0, 1,
-1.716616, -1.34435, -1.553931, 1, 0.2627451, 0, 1,
-1.708967, 0.8620347, -1.177172, 1, 0.2705882, 0, 1,
-1.703537, 1.330175, 0.4815135, 1, 0.2745098, 0, 1,
-1.695695, 0.9353039, -0.3235373, 1, 0.282353, 0, 1,
-1.680918, 1.232289, -1.364359, 1, 0.2862745, 0, 1,
-1.678335, -0.7299355, -1.716541, 1, 0.2941177, 0, 1,
-1.670226, -0.6105453, -3.578643, 1, 0.3019608, 0, 1,
-1.650215, 0.2078204, -2.14944, 1, 0.3058824, 0, 1,
-1.648895, -0.660969, -1.163839, 1, 0.3137255, 0, 1,
-1.630753, 0.5922043, -2.922127, 1, 0.3176471, 0, 1,
-1.629351, -0.791598, -0.7005549, 1, 0.3254902, 0, 1,
-1.612628, -0.4803642, -2.02429, 1, 0.3294118, 0, 1,
-1.610869, 0.05677317, -0.9657214, 1, 0.3372549, 0, 1,
-1.609425, 0.3585427, -1.505263, 1, 0.3411765, 0, 1,
-1.602978, -1.627887, -1.758215, 1, 0.3490196, 0, 1,
-1.596269, -0.2451026, -0.9938039, 1, 0.3529412, 0, 1,
-1.582769, 0.5067822, -2.009646, 1, 0.3607843, 0, 1,
-1.570777, 1.211643, 0.1782165, 1, 0.3647059, 0, 1,
-1.549338, 1.21993, -1.060468, 1, 0.372549, 0, 1,
-1.537496, -1.273036, -3.504903, 1, 0.3764706, 0, 1,
-1.534068, 2.322843, -1.759786, 1, 0.3843137, 0, 1,
-1.534011, 1.107964, -0.03390339, 1, 0.3882353, 0, 1,
-1.490052, -1.073684, -3.847557, 1, 0.3960784, 0, 1,
-1.48941, -1.100897, -1.815726, 1, 0.4039216, 0, 1,
-1.480396, -0.1616088, -1.290657, 1, 0.4078431, 0, 1,
-1.470458, -1.279732, -2.595501, 1, 0.4156863, 0, 1,
-1.470391, 0.6607057, 0.09629991, 1, 0.4196078, 0, 1,
-1.469294, -0.1379008, -1.039756, 1, 0.427451, 0, 1,
-1.440834, 0.4112812, -1.918916, 1, 0.4313726, 0, 1,
-1.420351, -0.05390386, -1.854666, 1, 0.4392157, 0, 1,
-1.403834, -0.671862, -1.727429, 1, 0.4431373, 0, 1,
-1.395642, -1.529953, -3.406077, 1, 0.4509804, 0, 1,
-1.385315, 0.05126888, -0.5995583, 1, 0.454902, 0, 1,
-1.380072, 0.1905677, -1.934893, 1, 0.4627451, 0, 1,
-1.378695, -1.296493, -1.820048, 1, 0.4666667, 0, 1,
-1.352892, 1.116361, -0.7707196, 1, 0.4745098, 0, 1,
-1.351853, 0.4121751, -1.451079, 1, 0.4784314, 0, 1,
-1.347327, -1.021103, -1.894451, 1, 0.4862745, 0, 1,
-1.345154, -0.4294611, -1.176285, 1, 0.4901961, 0, 1,
-1.340265, 0.1225157, -0.8056571, 1, 0.4980392, 0, 1,
-1.330432, 0.6568769, 0.4106747, 1, 0.5058824, 0, 1,
-1.326034, 0.1704448, -0.8686137, 1, 0.509804, 0, 1,
-1.315692, 0.424684, -1.463171, 1, 0.5176471, 0, 1,
-1.314997, 1.367487, -1.884458, 1, 0.5215687, 0, 1,
-1.309748, -0.3860727, -1.293804, 1, 0.5294118, 0, 1,
-1.309022, 1.493915, -0.8451799, 1, 0.5333334, 0, 1,
-1.306094, -0.07375944, -1.172175, 1, 0.5411765, 0, 1,
-1.301053, 1.306015, -1.87327, 1, 0.5450981, 0, 1,
-1.3005, 0.3459982, -1.742814, 1, 0.5529412, 0, 1,
-1.296805, -0.2901596, -2.873268, 1, 0.5568628, 0, 1,
-1.296264, 1.429204, 0.8659053, 1, 0.5647059, 0, 1,
-1.296025, 0.05751843, -0.7985032, 1, 0.5686275, 0, 1,
-1.283322, 0.8937877, -1.225879, 1, 0.5764706, 0, 1,
-1.268602, -1.527199, -2.513206, 1, 0.5803922, 0, 1,
-1.258678, 1.456789, 1.202259, 1, 0.5882353, 0, 1,
-1.252371, -1.56899, -2.248305, 1, 0.5921569, 0, 1,
-1.250142, -0.8364238, -2.767435, 1, 0.6, 0, 1,
-1.247404, 1.738052, 0.6731334, 1, 0.6078432, 0, 1,
-1.244026, -0.205365, -0.7251191, 1, 0.6117647, 0, 1,
-1.238925, -2.320566, -2.855451, 1, 0.6196079, 0, 1,
-1.235707, 1.981502, -1.088993, 1, 0.6235294, 0, 1,
-1.233064, -1.077019, -1.835026, 1, 0.6313726, 0, 1,
-1.229084, -0.67215, -1.321632, 1, 0.6352941, 0, 1,
-1.217108, -0.6497515, -3.198278, 1, 0.6431373, 0, 1,
-1.216728, -0.8489872, -2.967744, 1, 0.6470588, 0, 1,
-1.21304, 1.494329, 0.7789261, 1, 0.654902, 0, 1,
-1.209901, -0.3387171, -1.971363, 1, 0.6588235, 0, 1,
-1.187907, -0.8671368, -0.7552457, 1, 0.6666667, 0, 1,
-1.18604, 0.3311995, -1.015991, 1, 0.6705883, 0, 1,
-1.185219, -0.6800367, -2.362125, 1, 0.6784314, 0, 1,
-1.178202, 0.7821066, -1.264203, 1, 0.682353, 0, 1,
-1.169958, 0.2107443, -2.666759, 1, 0.6901961, 0, 1,
-1.166172, -1.131538, -1.570675, 1, 0.6941177, 0, 1,
-1.166074, 0.6074655, -0.5287145, 1, 0.7019608, 0, 1,
-1.153683, 0.03635092, -1.156899, 1, 0.7098039, 0, 1,
-1.152223, -1.275111, -2.674454, 1, 0.7137255, 0, 1,
-1.15126, -0.1059918, -1.282445, 1, 0.7215686, 0, 1,
-1.145836, -1.388899, -1.592037, 1, 0.7254902, 0, 1,
-1.138098, -1.883536, -3.585438, 1, 0.7333333, 0, 1,
-1.13543, 0.5949176, -1.26559, 1, 0.7372549, 0, 1,
-1.133341, -1.088935, -2.275845, 1, 0.7450981, 0, 1,
-1.13215, -0.3552541, -2.059537, 1, 0.7490196, 0, 1,
-1.129503, -0.9027834, -1.933272, 1, 0.7568628, 0, 1,
-1.129253, -1.058352, -3.519187, 1, 0.7607843, 0, 1,
-1.127381, -1.295705, -4.225078, 1, 0.7686275, 0, 1,
-1.12681, 0.6933997, 0.07927437, 1, 0.772549, 0, 1,
-1.124581, 0.7208992, -0.3068423, 1, 0.7803922, 0, 1,
-1.118242, -0.5435039, -1.394646, 1, 0.7843137, 0, 1,
-1.117199, -1.810592, -1.572582, 1, 0.7921569, 0, 1,
-1.116824, -0.9596767, -3.1845, 1, 0.7960784, 0, 1,
-1.110784, 0.685542, 0.04387617, 1, 0.8039216, 0, 1,
-1.106599, -0.6179983, -4.103912, 1, 0.8117647, 0, 1,
-1.098261, -0.2326494, -1.744538, 1, 0.8156863, 0, 1,
-1.08957, -1.267203, -3.68228, 1, 0.8235294, 0, 1,
-1.083085, -0.826089, -3.543238, 1, 0.827451, 0, 1,
-1.079584, 0.4764554, -2.10777, 1, 0.8352941, 0, 1,
-1.070101, 0.787468, -0.8343262, 1, 0.8392157, 0, 1,
-1.052909, 0.5358774, -2.080927, 1, 0.8470588, 0, 1,
-1.045303, 0.3873853, -2.985526, 1, 0.8509804, 0, 1,
-1.044813, -0.7942411, -1.04372, 1, 0.8588235, 0, 1,
-1.041108, -1.033551, -2.546358, 1, 0.8627451, 0, 1,
-1.038208, 0.4115312, -0.1401602, 1, 0.8705882, 0, 1,
-1.038154, 1.080192, 0.04577549, 1, 0.8745098, 0, 1,
-1.021569, -1.116743, -2.129803, 1, 0.8823529, 0, 1,
-1.021288, -1.486354, -2.348284, 1, 0.8862745, 0, 1,
-1.019086, 0.4940819, -0.4597393, 1, 0.8941177, 0, 1,
-1.017801, 0.2364904, -1.34971, 1, 0.8980392, 0, 1,
-1.012494, -0.6792239, -1.348675, 1, 0.9058824, 0, 1,
-1.007342, 0.9593275, -1.331086, 1, 0.9137255, 0, 1,
-1.005946, -0.6998742, -1.05074, 1, 0.9176471, 0, 1,
-1.00412, 1.378873, 0.2434081, 1, 0.9254902, 0, 1,
-0.9969321, 0.8620011, -0.9395537, 1, 0.9294118, 0, 1,
-0.9914706, -0.3938798, -0.09127638, 1, 0.9372549, 0, 1,
-0.9909797, -0.7705989, -3.033034, 1, 0.9411765, 0, 1,
-0.9830867, 1.426604, 0.02572305, 1, 0.9490196, 0, 1,
-0.9829996, 0.8801724, -0.1299448, 1, 0.9529412, 0, 1,
-0.9819363, -0.7278417, -0.6431962, 1, 0.9607843, 0, 1,
-0.9804819, -0.617146, -0.7592068, 1, 0.9647059, 0, 1,
-0.9731271, 0.1075037, -0.882507, 1, 0.972549, 0, 1,
-0.9702636, -1.365775, -1.731993, 1, 0.9764706, 0, 1,
-0.9690244, -1.115573, -1.241458, 1, 0.9843137, 0, 1,
-0.9676481, -0.08176857, -1.012844, 1, 0.9882353, 0, 1,
-0.9639574, 0.4078006, 0.5167005, 1, 0.9960784, 0, 1,
-0.9584424, 1.727151, -1.416868, 0.9960784, 1, 0, 1,
-0.9557114, -0.009214664, -1.697109, 0.9921569, 1, 0, 1,
-0.9513812, 0.1742304, -0.9144778, 0.9843137, 1, 0, 1,
-0.9496908, 2.096117, -1.804362, 0.9803922, 1, 0, 1,
-0.9473483, -1.320976, -1.85954, 0.972549, 1, 0, 1,
-0.9467391, -1.295306, -1.197141, 0.9686275, 1, 0, 1,
-0.9370152, 1.266204, -0.9368443, 0.9607843, 1, 0, 1,
-0.9255187, -0.926346, -3.949224, 0.9568627, 1, 0, 1,
-0.9086974, -0.6529948, -2.277214, 0.9490196, 1, 0, 1,
-0.9035323, 0.006990831, -3.808039, 0.945098, 1, 0, 1,
-0.9003696, -1.215692, -3.435917, 0.9372549, 1, 0, 1,
-0.8983732, -2.267857, -2.324349, 0.9333333, 1, 0, 1,
-0.8983634, 0.6537428, 0.6790427, 0.9254902, 1, 0, 1,
-0.8976309, 0.03985658, -1.660805, 0.9215686, 1, 0, 1,
-0.8895857, 0.6437594, -0.9066592, 0.9137255, 1, 0, 1,
-0.8889411, 0.1313128, -0.9309483, 0.9098039, 1, 0, 1,
-0.8845432, 0.2456358, -2.198457, 0.9019608, 1, 0, 1,
-0.8684382, -0.8023593, -0.530628, 0.8941177, 1, 0, 1,
-0.867644, -0.951334, -2.057814, 0.8901961, 1, 0, 1,
-0.8609126, 0.3083971, -1.48201, 0.8823529, 1, 0, 1,
-0.8564538, 0.761232, -1.97758, 0.8784314, 1, 0, 1,
-0.8561569, -0.6252299, -1.000797, 0.8705882, 1, 0, 1,
-0.8520666, 2.161158, 0.1323175, 0.8666667, 1, 0, 1,
-0.8519307, 1.193036, 0.2581597, 0.8588235, 1, 0, 1,
-0.8491888, 0.3928338, -0.07118534, 0.854902, 1, 0, 1,
-0.8438912, -0.5938578, -2.824695, 0.8470588, 1, 0, 1,
-0.8408605, -0.8764476, -2.47736, 0.8431373, 1, 0, 1,
-0.8388082, -0.05091041, -0.9182301, 0.8352941, 1, 0, 1,
-0.8356662, -0.1622548, -0.4428184, 0.8313726, 1, 0, 1,
-0.8355871, 0.413138, -1.631551, 0.8235294, 1, 0, 1,
-0.8329985, 1.013753, 0.3389039, 0.8196079, 1, 0, 1,
-0.8293307, -0.3052803, -1.430189, 0.8117647, 1, 0, 1,
-0.8226421, 1.629059, 1.399403, 0.8078431, 1, 0, 1,
-0.8222033, 1.309285, -1.539073, 0.8, 1, 0, 1,
-0.8215087, -0.9622345, -1.844941, 0.7921569, 1, 0, 1,
-0.818213, -0.6925691, -3.106411, 0.7882353, 1, 0, 1,
-0.8121044, -1.107072, -3.412092, 0.7803922, 1, 0, 1,
-0.807862, 0.8725859, -0.9066578, 0.7764706, 1, 0, 1,
-0.8025413, 3.278998, -0.1769959, 0.7686275, 1, 0, 1,
-0.801813, 1.673516, 1.060494, 0.7647059, 1, 0, 1,
-0.7967003, 1.115063, -2.005206, 0.7568628, 1, 0, 1,
-0.7911787, -0.6015981, -1.90241, 0.7529412, 1, 0, 1,
-0.7881883, -0.2203794, -2.176722, 0.7450981, 1, 0, 1,
-0.7746953, 0.1188896, -1.097937, 0.7411765, 1, 0, 1,
-0.772052, -1.043195, -3.827515, 0.7333333, 1, 0, 1,
-0.7698739, 1.013117, -0.9854955, 0.7294118, 1, 0, 1,
-0.7674256, -0.1819591, -0.1463965, 0.7215686, 1, 0, 1,
-0.7650756, 0.3710333, -1.787226, 0.7176471, 1, 0, 1,
-0.7642961, 0.736997, -1.062174, 0.7098039, 1, 0, 1,
-0.7630267, -0.7401488, -2.838444, 0.7058824, 1, 0, 1,
-0.7617596, -0.05941458, -0.6315022, 0.6980392, 1, 0, 1,
-0.7615868, -0.6706337, 0.972468, 0.6901961, 1, 0, 1,
-0.7613034, -0.2417555, 0.00309599, 0.6862745, 1, 0, 1,
-0.7607274, 0.6206434, -1.935275, 0.6784314, 1, 0, 1,
-0.7603173, -0.5270462, -1.448184, 0.6745098, 1, 0, 1,
-0.7572324, -1.92826, -2.248656, 0.6666667, 1, 0, 1,
-0.7536301, 0.41408, -1.123774, 0.6627451, 1, 0, 1,
-0.7515857, -1.889336, -3.484978, 0.654902, 1, 0, 1,
-0.7512332, -0.3276207, -2.456105, 0.6509804, 1, 0, 1,
-0.7496163, 0.4829556, -1.324795, 0.6431373, 1, 0, 1,
-0.7473426, -1.483614, -2.140875, 0.6392157, 1, 0, 1,
-0.7444254, 1.40641, 0.771553, 0.6313726, 1, 0, 1,
-0.739867, -1.055097, -1.398388, 0.627451, 1, 0, 1,
-0.7390003, -0.445966, -1.775118, 0.6196079, 1, 0, 1,
-0.7306257, -0.09584821, 0.4442466, 0.6156863, 1, 0, 1,
-0.7293552, 0.4518027, 0.1643005, 0.6078432, 1, 0, 1,
-0.7279788, 0.9667733, -0.6387557, 0.6039216, 1, 0, 1,
-0.7263949, -0.4250525, -2.691908, 0.5960785, 1, 0, 1,
-0.7256426, 1.310452, -0.1981201, 0.5882353, 1, 0, 1,
-0.7250851, -1.523674, -2.724487, 0.5843138, 1, 0, 1,
-0.7214896, 0.3354641, -1.046837, 0.5764706, 1, 0, 1,
-0.7191717, -1.429912, -3.425612, 0.572549, 1, 0, 1,
-0.718973, 1.123197, -0.01083492, 0.5647059, 1, 0, 1,
-0.712986, 0.2167957, -1.234176, 0.5607843, 1, 0, 1,
-0.7127856, 0.2102888, -1.2613, 0.5529412, 1, 0, 1,
-0.7109002, -1.771528, -1.362746, 0.5490196, 1, 0, 1,
-0.7098073, 2.3664, -1.512322, 0.5411765, 1, 0, 1,
-0.7080986, -1.96525, -2.895654, 0.5372549, 1, 0, 1,
-0.7039573, -0.4174815, -3.262703, 0.5294118, 1, 0, 1,
-0.7022789, -0.9737762, -3.998219, 0.5254902, 1, 0, 1,
-0.6971012, 1.948166, 1.57559, 0.5176471, 1, 0, 1,
-0.6931358, 1.143912, -1.629658, 0.5137255, 1, 0, 1,
-0.6913151, 1.345384, -0.5889984, 0.5058824, 1, 0, 1,
-0.6736906, 0.258937, -0.4522668, 0.5019608, 1, 0, 1,
-0.6731881, 0.9454942, 0.5411977, 0.4941176, 1, 0, 1,
-0.6726962, -0.6638157, -1.663116, 0.4862745, 1, 0, 1,
-0.6698953, 3.553679, 1.065249, 0.4823529, 1, 0, 1,
-0.6698092, 1.129772, -0.09305035, 0.4745098, 1, 0, 1,
-0.6635024, 1.065274, -0.8178629, 0.4705882, 1, 0, 1,
-0.662932, 1.504297, 0.2980469, 0.4627451, 1, 0, 1,
-0.6628842, 1.643167, -1.250736, 0.4588235, 1, 0, 1,
-0.661665, -0.8689317, -1.667436, 0.4509804, 1, 0, 1,
-0.6608936, -1.266256, -0.9373266, 0.4470588, 1, 0, 1,
-0.6607236, -0.2419341, -3.347497, 0.4392157, 1, 0, 1,
-0.658174, -1.191671, -2.217175, 0.4352941, 1, 0, 1,
-0.652959, -1.910555, -2.712202, 0.427451, 1, 0, 1,
-0.6515474, -0.08338626, -1.115209, 0.4235294, 1, 0, 1,
-0.6435862, -0.1971523, -0.877175, 0.4156863, 1, 0, 1,
-0.639377, -0.9366642, -0.2355679, 0.4117647, 1, 0, 1,
-0.6373203, 0.3180003, -1.116857, 0.4039216, 1, 0, 1,
-0.6360324, 0.405707, 0.5285074, 0.3960784, 1, 0, 1,
-0.635717, 1.009852, -1.070292, 0.3921569, 1, 0, 1,
-0.6325145, 0.5252511, 0.5930466, 0.3843137, 1, 0, 1,
-0.6316109, -0.9492751, -3.398885, 0.3803922, 1, 0, 1,
-0.6308131, -0.02598679, -1.077441, 0.372549, 1, 0, 1,
-0.628455, -0.8195045, -2.601053, 0.3686275, 1, 0, 1,
-0.6281134, -0.1363229, -1.451283, 0.3607843, 1, 0, 1,
-0.6264314, 1.7281, 0.2593057, 0.3568628, 1, 0, 1,
-0.6252828, -0.6082074, -3.00686, 0.3490196, 1, 0, 1,
-0.623906, 1.245896, -1.624418, 0.345098, 1, 0, 1,
-0.6212538, 2.134145, 0.4914938, 0.3372549, 1, 0, 1,
-0.6209008, 0.2068071, -2.223017, 0.3333333, 1, 0, 1,
-0.6202016, -0.6338444, -1.873162, 0.3254902, 1, 0, 1,
-0.6201565, 1.865996, -1.267285, 0.3215686, 1, 0, 1,
-0.6172111, -3.046659, -2.293832, 0.3137255, 1, 0, 1,
-0.607439, -0.4085873, -1.910681, 0.3098039, 1, 0, 1,
-0.6060129, -2.114734, -1.841265, 0.3019608, 1, 0, 1,
-0.6017349, -1.546921, -2.266962, 0.2941177, 1, 0, 1,
-0.5986251, 0.03339371, -0.9697139, 0.2901961, 1, 0, 1,
-0.5965407, 0.6727969, -0.412607, 0.282353, 1, 0, 1,
-0.5946706, -0.4488112, -2.519343, 0.2784314, 1, 0, 1,
-0.5932732, 1.340562, -0.9896072, 0.2705882, 1, 0, 1,
-0.5916543, -0.6933293, -2.399233, 0.2666667, 1, 0, 1,
-0.5894927, -2.573933, -3.445452, 0.2588235, 1, 0, 1,
-0.5847298, 0.7387682, -0.6689712, 0.254902, 1, 0, 1,
-0.5845163, 1.243267, 1.058385, 0.2470588, 1, 0, 1,
-0.5835332, 0.03147756, 0.4625222, 0.2431373, 1, 0, 1,
-0.5835267, -0.9471913, -3.667041, 0.2352941, 1, 0, 1,
-0.5835266, 1.223763, -0.7821981, 0.2313726, 1, 0, 1,
-0.5815861, 2.027347, -0.8061169, 0.2235294, 1, 0, 1,
-0.5714014, -0.1180785, -0.686494, 0.2196078, 1, 0, 1,
-0.571148, 0.2752962, -3.290957, 0.2117647, 1, 0, 1,
-0.5699371, -0.6303359, -2.697176, 0.2078431, 1, 0, 1,
-0.5665793, 1.004432, 0.03967667, 0.2, 1, 0, 1,
-0.564566, -0.1241093, -2.119786, 0.1921569, 1, 0, 1,
-0.5612744, -1.320801, -0.8890205, 0.1882353, 1, 0, 1,
-0.5604905, -0.3308049, -0.4720432, 0.1803922, 1, 0, 1,
-0.5593109, 0.5928882, -2.78265, 0.1764706, 1, 0, 1,
-0.5585948, -0.2064482, 0.7956615, 0.1686275, 1, 0, 1,
-0.555394, 1.460902, -1.374571, 0.1647059, 1, 0, 1,
-0.5537814, 0.5274148, -1.582477, 0.1568628, 1, 0, 1,
-0.5496486, -0.1841383, 0.07318814, 0.1529412, 1, 0, 1,
-0.5481046, -0.3350918, -3.145575, 0.145098, 1, 0, 1,
-0.5455604, -0.09652387, -0.6630386, 0.1411765, 1, 0, 1,
-0.5414368, 0.02498502, 0.02842516, 0.1333333, 1, 0, 1,
-0.5390744, 0.5012523, 0.6344241, 0.1294118, 1, 0, 1,
-0.535, -0.9972484, -1.479239, 0.1215686, 1, 0, 1,
-0.530349, -1.718793, -4.092786, 0.1176471, 1, 0, 1,
-0.5300343, -0.2097694, -1.051177, 0.1098039, 1, 0, 1,
-0.5277185, -1.303401, -1.864765, 0.1058824, 1, 0, 1,
-0.5248334, 0.6005303, -0.4551751, 0.09803922, 1, 0, 1,
-0.5245979, 1.442782, -0.02941242, 0.09019608, 1, 0, 1,
-0.5191426, -2.097773, -4.135417, 0.08627451, 1, 0, 1,
-0.5170016, -0.4418495, -0.7725792, 0.07843138, 1, 0, 1,
-0.5162634, -1.321791, -2.158787, 0.07450981, 1, 0, 1,
-0.5154595, 0.8260942, -0.3580602, 0.06666667, 1, 0, 1,
-0.514917, 2.449075, 0.9268662, 0.0627451, 1, 0, 1,
-0.5133527, 0.06074911, -1.050731, 0.05490196, 1, 0, 1,
-0.5093765, -3.083677, -4.453882, 0.05098039, 1, 0, 1,
-0.508655, 1.106236, 0.7175195, 0.04313726, 1, 0, 1,
-0.5084904, 0.5760695, 0.9744024, 0.03921569, 1, 0, 1,
-0.5023088, 0.004153874, -0.5499177, 0.03137255, 1, 0, 1,
-0.5008679, -1.586149, -3.924778, 0.02745098, 1, 0, 1,
-0.5005409, 1.926061, -0.6249627, 0.01960784, 1, 0, 1,
-0.4995504, 0.3486092, -1.785744, 0.01568628, 1, 0, 1,
-0.4953791, 0.6379445, -1.544662, 0.007843138, 1, 0, 1,
-0.4936191, -0.02422352, -1.885674, 0.003921569, 1, 0, 1,
-0.4872477, -0.4049453, -2.632251, 0, 1, 0.003921569, 1,
-0.4779304, 0.5518041, -0.7100453, 0, 1, 0.01176471, 1,
-0.4776974, 0.4814233, -2.191106, 0, 1, 0.01568628, 1,
-0.4764777, 1.156119, 0.1315035, 0, 1, 0.02352941, 1,
-0.4743422, -0.4049395, -1.514581, 0, 1, 0.02745098, 1,
-0.4729462, -0.4705054, -2.282127, 0, 1, 0.03529412, 1,
-0.4725007, 2.01704, 0.4704847, 0, 1, 0.03921569, 1,
-0.4704737, 0.6443877, -0.7719369, 0, 1, 0.04705882, 1,
-0.4658811, -1.515291, -3.462547, 0, 1, 0.05098039, 1,
-0.4551649, -0.560113, -2.477693, 0, 1, 0.05882353, 1,
-0.4545504, -0.8718643, -1.810241, 0, 1, 0.0627451, 1,
-0.4532382, -1.308235, -2.696267, 0, 1, 0.07058824, 1,
-0.4492527, -0.6041725, -4.190678, 0, 1, 0.07450981, 1,
-0.4414125, 0.3193042, -0.4801663, 0, 1, 0.08235294, 1,
-0.4379072, -0.5450604, -3.768749, 0, 1, 0.08627451, 1,
-0.4354668, 0.7579741, -0.9398296, 0, 1, 0.09411765, 1,
-0.4348226, 0.06305999, -3.191222, 0, 1, 0.1019608, 1,
-0.4310321, -0.03968582, -1.798967, 0, 1, 0.1058824, 1,
-0.4308384, -1.395731, -2.458091, 0, 1, 0.1137255, 1,
-0.4302163, 1.882147, 0.03772543, 0, 1, 0.1176471, 1,
-0.4294583, -0.1501264, -2.124387, 0, 1, 0.1254902, 1,
-0.4287201, -0.4745461, -5.384585, 0, 1, 0.1294118, 1,
-0.4233322, 0.3425035, -0.7569339, 0, 1, 0.1372549, 1,
-0.4201699, 0.3231327, -1.087238, 0, 1, 0.1411765, 1,
-0.4191768, 0.1349781, -0.8059834, 0, 1, 0.1490196, 1,
-0.4116554, 2.570388, 0.9343397, 0, 1, 0.1529412, 1,
-0.4063279, 0.1476945, -0.2206205, 0, 1, 0.1607843, 1,
-0.4048632, 0.1310259, -1.825722, 0, 1, 0.1647059, 1,
-0.4033135, 0.2697701, -0.8447227, 0, 1, 0.172549, 1,
-0.4016588, 0.6214394, -0.6580597, 0, 1, 0.1764706, 1,
-0.3949755, 0.8255134, -0.3853091, 0, 1, 0.1843137, 1,
-0.3930977, -0.4451435, -0.5239822, 0, 1, 0.1882353, 1,
-0.3884067, -0.06811576, -1.047975, 0, 1, 0.1960784, 1,
-0.3881078, 0.459316, -2.146151, 0, 1, 0.2039216, 1,
-0.3879611, 1.786966, 1.616011, 0, 1, 0.2078431, 1,
-0.3860076, -1.393338, -4.449097, 0, 1, 0.2156863, 1,
-0.3822011, 0.03985631, -0.689086, 0, 1, 0.2196078, 1,
-0.3796277, -0.0613663, -0.6253073, 0, 1, 0.227451, 1,
-0.3787815, 0.068805, -0.6584902, 0, 1, 0.2313726, 1,
-0.3785172, -0.575846, -1.413975, 0, 1, 0.2392157, 1,
-0.3764856, 0.1840921, 0.3928804, 0, 1, 0.2431373, 1,
-0.3760629, 1.064481, 0.5438101, 0, 1, 0.2509804, 1,
-0.3675597, 1.285452, -0.4768757, 0, 1, 0.254902, 1,
-0.3670338, -1.947026, -4.119949, 0, 1, 0.2627451, 1,
-0.3660148, -0.2117467, -2.726334, 0, 1, 0.2666667, 1,
-0.361229, 0.8504564, -0.02140418, 0, 1, 0.2745098, 1,
-0.3573625, 1.712942, -0.7251927, 0, 1, 0.2784314, 1,
-0.3538472, 0.8971376, -1.614605, 0, 1, 0.2862745, 1,
-0.3505431, -0.5732638, -3.471591, 0, 1, 0.2901961, 1,
-0.3498911, -1.34501, -0.9370105, 0, 1, 0.2980392, 1,
-0.3490467, 0.1641934, -1.007505, 0, 1, 0.3058824, 1,
-0.3419621, -1.137305, -0.9508994, 0, 1, 0.3098039, 1,
-0.3350145, -0.4412644, -0.9293742, 0, 1, 0.3176471, 1,
-0.3327331, -0.953617, -4.481602, 0, 1, 0.3215686, 1,
-0.3310273, -0.9924405, -2.869895, 0, 1, 0.3294118, 1,
-0.329657, 0.2067386, -0.6677524, 0, 1, 0.3333333, 1,
-0.3296202, -1.234563, -2.318348, 0, 1, 0.3411765, 1,
-0.3283065, 0.2704268, -1.331754, 0, 1, 0.345098, 1,
-0.3129887, -0.9998115, -3.343645, 0, 1, 0.3529412, 1,
-0.3121005, -0.3647512, -2.904721, 0, 1, 0.3568628, 1,
-0.3096334, -0.5217978, -4.373045, 0, 1, 0.3647059, 1,
-0.3095181, 0.8938535, -0.7720063, 0, 1, 0.3686275, 1,
-0.3078225, -1.206419, -2.095633, 0, 1, 0.3764706, 1,
-0.3072877, 1.279239, 0.8065421, 0, 1, 0.3803922, 1,
-0.3071626, 1.882071, -0.7578765, 0, 1, 0.3882353, 1,
-0.2998641, 0.006963225, -1.280598, 0, 1, 0.3921569, 1,
-0.2979693, -0.3957608, -1.295394, 0, 1, 0.4, 1,
-0.2958941, 0.04814822, -1.896803, 0, 1, 0.4078431, 1,
-0.2907022, 0.9760485, -0.5789032, 0, 1, 0.4117647, 1,
-0.2897543, 1.192827, 0.4379119, 0, 1, 0.4196078, 1,
-0.2865072, -0.3181423, -2.014624, 0, 1, 0.4235294, 1,
-0.2861173, 0.08822567, -2.373518, 0, 1, 0.4313726, 1,
-0.2850978, 1.218766, 0.2113855, 0, 1, 0.4352941, 1,
-0.2820424, -0.2032347, -3.137999, 0, 1, 0.4431373, 1,
-0.281281, -0.3067926, -1.357202, 0, 1, 0.4470588, 1,
-0.2793235, -0.2484897, -0.9529961, 0, 1, 0.454902, 1,
-0.2758825, 0.786728, -0.9566944, 0, 1, 0.4588235, 1,
-0.2740461, 1.092569, -1.042747, 0, 1, 0.4666667, 1,
-0.2711561, 1.017358, -1.859022, 0, 1, 0.4705882, 1,
-0.2682097, 0.004779357, -1.792155, 0, 1, 0.4784314, 1,
-0.266433, 0.1820627, -1.372562, 0, 1, 0.4823529, 1,
-0.2651466, -0.846054, -2.626534, 0, 1, 0.4901961, 1,
-0.2571295, -1.287623, -2.11138, 0, 1, 0.4941176, 1,
-0.2531034, -0.4479388, -3.527244, 0, 1, 0.5019608, 1,
-0.2523955, 0.4132263, 0.056451, 0, 1, 0.509804, 1,
-0.2463549, 0.7263866, 0.08744676, 0, 1, 0.5137255, 1,
-0.2461173, 0.882499, 0.7215388, 0, 1, 0.5215687, 1,
-0.2395831, 0.5413017, -1.220926, 0, 1, 0.5254902, 1,
-0.2392904, 0.9841954, -0.5571952, 0, 1, 0.5333334, 1,
-0.2357663, 0.914396, 0.8918083, 0, 1, 0.5372549, 1,
-0.2347909, 0.3910691, -0.4635347, 0, 1, 0.5450981, 1,
-0.2336842, 0.2140592, -2.415953, 0, 1, 0.5490196, 1,
-0.2327011, 1.137888, -0.8449427, 0, 1, 0.5568628, 1,
-0.232485, -0.8694062, -2.640878, 0, 1, 0.5607843, 1,
-0.231846, 1.619876, -1.363829, 0, 1, 0.5686275, 1,
-0.2301702, 0.1853231, -0.03837243, 0, 1, 0.572549, 1,
-0.2276301, -1.318824, -3.247542, 0, 1, 0.5803922, 1,
-0.2246284, -0.8919923, -0.9900235, 0, 1, 0.5843138, 1,
-0.2158424, -0.1663615, -1.59038, 0, 1, 0.5921569, 1,
-0.2115325, -0.7537532, -4.317233, 0, 1, 0.5960785, 1,
-0.2087393, -0.6068147, -2.663546, 0, 1, 0.6039216, 1,
-0.2086816, 0.3208723, -0.3357204, 0, 1, 0.6117647, 1,
-0.2036518, 0.9195544, -0.8981755, 0, 1, 0.6156863, 1,
-0.2034108, -0.05035418, -2.921751, 0, 1, 0.6235294, 1,
-0.2000368, 2.180497, -0.4076589, 0, 1, 0.627451, 1,
-0.1969372, 1.163729, -1.198292, 0, 1, 0.6352941, 1,
-0.191946, 0.5541993, 1.143333, 0, 1, 0.6392157, 1,
-0.1816192, 0.2705578, -0.2403924, 0, 1, 0.6470588, 1,
-0.1814526, 1.004604, -0.02385409, 0, 1, 0.6509804, 1,
-0.1807116, -1.334533, -1.924565, 0, 1, 0.6588235, 1,
-0.1802482, -0.6977953, -3.772767, 0, 1, 0.6627451, 1,
-0.1792592, -1.066519, -2.198313, 0, 1, 0.6705883, 1,
-0.1786246, 2.694019, -0.8108817, 0, 1, 0.6745098, 1,
-0.1752523, -0.6036164, -3.459898, 0, 1, 0.682353, 1,
-0.1745158, 0.3698484, -1.976601, 0, 1, 0.6862745, 1,
-0.1669433, -0.2723089, -4.041525, 0, 1, 0.6941177, 1,
-0.1642097, 0.9243087, -0.5056234, 0, 1, 0.7019608, 1,
-0.1554909, -0.7111403, -3.58118, 0, 1, 0.7058824, 1,
-0.153814, -0.3652887, -2.756362, 0, 1, 0.7137255, 1,
-0.1529378, 1.644223, 1.155641, 0, 1, 0.7176471, 1,
-0.1514613, 0.4155486, 0.2936504, 0, 1, 0.7254902, 1,
-0.1499311, -0.2584036, -0.8540754, 0, 1, 0.7294118, 1,
-0.1439224, -0.4004016, -3.427007, 0, 1, 0.7372549, 1,
-0.1396396, 0.6847001, 0.6100925, 0, 1, 0.7411765, 1,
-0.1393058, 1.918476, -0.00231178, 0, 1, 0.7490196, 1,
-0.1323796, -0.6431156, -3.542537, 0, 1, 0.7529412, 1,
-0.1292715, -1.158494, -3.518279, 0, 1, 0.7607843, 1,
-0.1284091, -0.6749647, -0.3248704, 0, 1, 0.7647059, 1,
-0.1255831, 0.5629711, -1.584422, 0, 1, 0.772549, 1,
-0.1230095, -0.4941756, -2.659626, 0, 1, 0.7764706, 1,
-0.1221309, 0.3545085, 0.2125658, 0, 1, 0.7843137, 1,
-0.1197867, -1.238776, -4.530815, 0, 1, 0.7882353, 1,
-0.1196882, 0.9179822, 1.005701, 0, 1, 0.7960784, 1,
-0.1180024, -0.4535347, -3.015272, 0, 1, 0.8039216, 1,
-0.1173774, 0.2967328, -2.081867, 0, 1, 0.8078431, 1,
-0.1154882, 1.380689, 0.6941441, 0, 1, 0.8156863, 1,
-0.1056919, -1.545425, -3.58699, 0, 1, 0.8196079, 1,
-0.1037984, -0.7697459, -5.347034, 0, 1, 0.827451, 1,
-0.1025826, 0.7309565, 0.04170695, 0, 1, 0.8313726, 1,
-0.1023054, -1.336391, -3.043053, 0, 1, 0.8392157, 1,
-0.1008525, 0.8518878, -1.262725, 0, 1, 0.8431373, 1,
-0.1003004, 0.07409175, -1.130591, 0, 1, 0.8509804, 1,
-0.09851853, -0.2252094, -3.574559, 0, 1, 0.854902, 1,
-0.09690938, 0.4724837, -1.456731, 0, 1, 0.8627451, 1,
-0.09512843, -2.047346, -3.088147, 0, 1, 0.8666667, 1,
-0.09474028, -2.543007, -3.318512, 0, 1, 0.8745098, 1,
-0.09331418, -0.8993801, -3.127718, 0, 1, 0.8784314, 1,
-0.09279981, 0.03852826, -2.851557, 0, 1, 0.8862745, 1,
-0.09276554, -0.6503201, -2.388199, 0, 1, 0.8901961, 1,
-0.09044755, -1.536012, -4.161335, 0, 1, 0.8980392, 1,
-0.08965448, -0.4091333, -2.812278, 0, 1, 0.9058824, 1,
-0.08838669, -0.4032842, -2.423377, 0, 1, 0.9098039, 1,
-0.08723796, 0.02235784, -2.661678, 0, 1, 0.9176471, 1,
-0.08443233, 0.8465554, -0.02079375, 0, 1, 0.9215686, 1,
-0.08317947, -0.3397394, -3.246304, 0, 1, 0.9294118, 1,
-0.08135435, -2.554038, -3.198946, 0, 1, 0.9333333, 1,
-0.08075999, 0.4421191, -0.3822544, 0, 1, 0.9411765, 1,
-0.08014797, -0.03804423, -3.514483, 0, 1, 0.945098, 1,
-0.07894634, -0.5220299, -3.626306, 0, 1, 0.9529412, 1,
-0.07416565, 0.09127927, -0.731052, 0, 1, 0.9568627, 1,
-0.07314156, -0.9161616, -4.317639, 0, 1, 0.9647059, 1,
-0.07228526, -2.138626, -3.724706, 0, 1, 0.9686275, 1,
-0.07005161, 0.1769271, 0.6054682, 0, 1, 0.9764706, 1,
-0.06671396, 2.00212, -1.16383, 0, 1, 0.9803922, 1,
-0.06121078, 1.102242, 0.03525622, 0, 1, 0.9882353, 1,
-0.05474257, 0.6557373, 0.0115832, 0, 1, 0.9921569, 1,
-0.04460983, 0.7126541, 2.021505, 0, 1, 1, 1,
-0.04194907, 0.4537138, 0.04971199, 0, 0.9921569, 1, 1,
-0.03822492, -0.8304883, -2.841424, 0, 0.9882353, 1, 1,
-0.03681009, -1.285891, -3.330345, 0, 0.9803922, 1, 1,
-0.03637451, 0.4799137, 0.8346003, 0, 0.9764706, 1, 1,
-0.03419171, 0.002315134, 0.2990871, 0, 0.9686275, 1, 1,
-0.03198218, -0.2172718, -2.93046, 0, 0.9647059, 1, 1,
-0.03194961, -1.092025, -5.03718, 0, 0.9568627, 1, 1,
-0.03185856, -0.1675199, -2.47425, 0, 0.9529412, 1, 1,
-0.02473879, -1.674403, -3.395508, 0, 0.945098, 1, 1,
-0.02400945, 0.4792881, 0.1306024, 0, 0.9411765, 1, 1,
-0.01920487, 0.5265248, -0.8089538, 0, 0.9333333, 1, 1,
-0.01529916, 0.1784119, -3.176728, 0, 0.9294118, 1, 1,
-0.01088478, 0.5763299, -0.4445421, 0, 0.9215686, 1, 1,
-0.009348743, 1.363937, -0.4868045, 0, 0.9176471, 1, 1,
-0.005946403, 0.4191011, -0.7748097, 0, 0.9098039, 1, 1,
-0.0046554, 0.09946696, 1.788823, 0, 0.9058824, 1, 1,
-0.003138734, 0.2420248, -1.204773, 0, 0.8980392, 1, 1,
-0.00103582, -1.923239, -4.510997, 0, 0.8901961, 1, 1,
0.001723884, 2.305241, 0.7694964, 0, 0.8862745, 1, 1,
0.004296911, -2.15937, 3.580046, 0, 0.8784314, 1, 1,
0.005426022, 0.5984276, -0.5741365, 0, 0.8745098, 1, 1,
0.008311778, 0.3965284, 0.4677274, 0, 0.8666667, 1, 1,
0.009744342, 0.4149657, -0.7139977, 0, 0.8627451, 1, 1,
0.01665833, -0.9955165, 3.977948, 0, 0.854902, 1, 1,
0.0179206, -1.19275, 2.859753, 0, 0.8509804, 1, 1,
0.01880546, 0.2092279, -0.7152995, 0, 0.8431373, 1, 1,
0.0220174, 0.1037664, 1.702944, 0, 0.8392157, 1, 1,
0.02283027, 0.2365644, -0.841199, 0, 0.8313726, 1, 1,
0.02579645, -0.3013788, 2.430445, 0, 0.827451, 1, 1,
0.0259077, -0.1937636, 3.516007, 0, 0.8196079, 1, 1,
0.02949628, 1.769054, -0.9366964, 0, 0.8156863, 1, 1,
0.03115773, 0.7821347, -0.6700887, 0, 0.8078431, 1, 1,
0.03382803, -0.9909145, 3.788483, 0, 0.8039216, 1, 1,
0.03495777, -0.4605438, 3.89012, 0, 0.7960784, 1, 1,
0.0373392, -1.464791, 2.266927, 0, 0.7882353, 1, 1,
0.0374346, -0.09270953, 2.450992, 0, 0.7843137, 1, 1,
0.03993144, -0.4300174, 4.999624, 0, 0.7764706, 1, 1,
0.04032884, -1.041023, 4.630833, 0, 0.772549, 1, 1,
0.04385003, 0.5285259, 0.8505362, 0, 0.7647059, 1, 1,
0.04525943, -1.520061, 2.447751, 0, 0.7607843, 1, 1,
0.04907964, 0.5796733, 0.8777692, 0, 0.7529412, 1, 1,
0.04936126, 0.195182, 0.5765333, 0, 0.7490196, 1, 1,
0.05173637, -0.2557389, 3.593995, 0, 0.7411765, 1, 1,
0.05254745, -0.07737917, 3.622637, 0, 0.7372549, 1, 1,
0.05271948, 1.053131, 0.08313689, 0, 0.7294118, 1, 1,
0.05511608, 0.7051319, -0.5226156, 0, 0.7254902, 1, 1,
0.05912871, -0.01974185, 1.92021, 0, 0.7176471, 1, 1,
0.06033015, -2.003118, 4.361391, 0, 0.7137255, 1, 1,
0.06368297, 0.2710665, 2.531058, 0, 0.7058824, 1, 1,
0.06436814, -1.097589, 3.363876, 0, 0.6980392, 1, 1,
0.06495921, -0.920979, 2.972509, 0, 0.6941177, 1, 1,
0.06973978, 0.8581607, -1.255709, 0, 0.6862745, 1, 1,
0.06997527, -1.395056, 4.751325, 0, 0.682353, 1, 1,
0.08529843, -0.2446813, 3.733222, 0, 0.6745098, 1, 1,
0.08817704, 0.2703992, 0.9131398, 0, 0.6705883, 1, 1,
0.08845793, -1.98504, 1.410177, 0, 0.6627451, 1, 1,
0.08858953, -2.024661, 2.795887, 0, 0.6588235, 1, 1,
0.0919656, 0.9127603, 1.308655, 0, 0.6509804, 1, 1,
0.09201002, -1.035014, 2.587361, 0, 0.6470588, 1, 1,
0.09208692, -0.7134671, 3.387978, 0, 0.6392157, 1, 1,
0.09290744, 0.5812953, 0.9966031, 0, 0.6352941, 1, 1,
0.09832542, 0.5525581, 0.3402051, 0, 0.627451, 1, 1,
0.1014757, -0.3763618, 3.250718, 0, 0.6235294, 1, 1,
0.1024819, -0.892195, 2.614028, 0, 0.6156863, 1, 1,
0.1027989, -1.224398, 3.827193, 0, 0.6117647, 1, 1,
0.1034753, -1.326026, 2.566424, 0, 0.6039216, 1, 1,
0.1058242, -0.4808039, 2.823597, 0, 0.5960785, 1, 1,
0.1062055, 0.03619242, -1.134385, 0, 0.5921569, 1, 1,
0.1066498, -1.619926, 1.628239, 0, 0.5843138, 1, 1,
0.1118635, 0.7163028, 0.4724668, 0, 0.5803922, 1, 1,
0.1123081, -0.1911464, 3.258048, 0, 0.572549, 1, 1,
0.1130232, -0.2672313, 3.76791, 0, 0.5686275, 1, 1,
0.1140945, 0.1214433, 1.730846, 0, 0.5607843, 1, 1,
0.1272453, -0.6654881, 4.79275, 0, 0.5568628, 1, 1,
0.1312676, 0.7101562, -0.9161209, 0, 0.5490196, 1, 1,
0.1314124, -0.1049174, 4.117902, 0, 0.5450981, 1, 1,
0.1325752, -1.582586, 2.073557, 0, 0.5372549, 1, 1,
0.1329176, -1.995063, 3.356637, 0, 0.5333334, 1, 1,
0.138421, -0.1281658, 2.542619, 0, 0.5254902, 1, 1,
0.139607, -1.346269, 2.022781, 0, 0.5215687, 1, 1,
0.1494716, -1.095101, 2.412851, 0, 0.5137255, 1, 1,
0.150903, 0.4884045, 1.586265, 0, 0.509804, 1, 1,
0.1515265, -0.4965205, 3.800002, 0, 0.5019608, 1, 1,
0.151719, -0.637913, 2.017981, 0, 0.4941176, 1, 1,
0.1565865, 0.7830042, 2.059333, 0, 0.4901961, 1, 1,
0.1566925, 0.4536619, -1.058697, 0, 0.4823529, 1, 1,
0.157302, 1.050687, 0.2877513, 0, 0.4784314, 1, 1,
0.1652889, -0.6723086, 3.306156, 0, 0.4705882, 1, 1,
0.1756068, -0.5675268, 0.6618071, 0, 0.4666667, 1, 1,
0.1761547, 1.287611, 0.7326651, 0, 0.4588235, 1, 1,
0.1791428, -0.1793916, 0.7439213, 0, 0.454902, 1, 1,
0.1801692, 0.1263888, -0.2225087, 0, 0.4470588, 1, 1,
0.1831682, -1.243321, 4.248783, 0, 0.4431373, 1, 1,
0.1862177, -0.4911367, 2.806368, 0, 0.4352941, 1, 1,
0.1872435, 1.039121, 0.9303492, 0, 0.4313726, 1, 1,
0.1882414, -0.9321165, 3.62929, 0, 0.4235294, 1, 1,
0.1941642, -1.783531, 3.958791, 0, 0.4196078, 1, 1,
0.1985767, -1.869684, 4.2257, 0, 0.4117647, 1, 1,
0.2006151, -1.137898, 3.643795, 0, 0.4078431, 1, 1,
0.2008808, 0.7305267, 2.605448, 0, 0.4, 1, 1,
0.2009036, 0.4208138, -0.7742503, 0, 0.3921569, 1, 1,
0.2045203, 1.538003, 0.7342434, 0, 0.3882353, 1, 1,
0.2074014, 0.6101694, 0.4903556, 0, 0.3803922, 1, 1,
0.211076, -1.059339, 2.247189, 0, 0.3764706, 1, 1,
0.2201398, 0.598602, 0.1810426, 0, 0.3686275, 1, 1,
0.2286919, -0.1658302, 0.3060458, 0, 0.3647059, 1, 1,
0.2304747, -2.187662, 1.698857, 0, 0.3568628, 1, 1,
0.2354385, 0.3341931, -0.2144015, 0, 0.3529412, 1, 1,
0.235498, -0.6609624, 5.414094, 0, 0.345098, 1, 1,
0.2421866, -0.4918761, 2.524399, 0, 0.3411765, 1, 1,
0.257633, -1.377419, 3.049086, 0, 0.3333333, 1, 1,
0.2601966, -1.120462, 4.363287, 0, 0.3294118, 1, 1,
0.2639393, -0.985567, 3.823293, 0, 0.3215686, 1, 1,
0.269842, 0.5606745, 1.553405, 0, 0.3176471, 1, 1,
0.2726439, -0.1302865, 1.044284, 0, 0.3098039, 1, 1,
0.2753719, -2.031873, 3.14561, 0, 0.3058824, 1, 1,
0.2820249, -0.5238414, 4.899648, 0, 0.2980392, 1, 1,
0.2884529, -0.280113, 1.749419, 0, 0.2901961, 1, 1,
0.288489, 0.6445912, 0.8359315, 0, 0.2862745, 1, 1,
0.2885778, 1.805658, -0.8158063, 0, 0.2784314, 1, 1,
0.2907498, 0.9822678, 0.3534023, 0, 0.2745098, 1, 1,
0.2926632, 0.5902227, -1.234343, 0, 0.2666667, 1, 1,
0.2975064, -1.743693, 2.420244, 0, 0.2627451, 1, 1,
0.3033235, 0.2077011, 1.647234, 0, 0.254902, 1, 1,
0.308412, 1.859353, -0.8748498, 0, 0.2509804, 1, 1,
0.3099205, 0.9395623, -0.4923663, 0, 0.2431373, 1, 1,
0.3124983, 0.01322051, 1.120202, 0, 0.2392157, 1, 1,
0.3130403, 0.1224417, 2.701233, 0, 0.2313726, 1, 1,
0.3178421, 0.3525164, 0.1440685, 0, 0.227451, 1, 1,
0.3187373, 0.6286603, 1.569365, 0, 0.2196078, 1, 1,
0.3189787, -1.099697, 1.632373, 0, 0.2156863, 1, 1,
0.3190037, -0.3094243, 4.474221, 0, 0.2078431, 1, 1,
0.3229321, 0.8107904, 0.4619219, 0, 0.2039216, 1, 1,
0.3231937, 1.911103, -0.1820359, 0, 0.1960784, 1, 1,
0.3246054, 1.305768, 1.64509, 0, 0.1882353, 1, 1,
0.3266466, 1.354859, -0.3424769, 0, 0.1843137, 1, 1,
0.3301562, -1.487619, 2.577743, 0, 0.1764706, 1, 1,
0.3341179, -1.521944, 3.077502, 0, 0.172549, 1, 1,
0.3367895, -1.01316, 3.654914, 0, 0.1647059, 1, 1,
0.3393564, 1.091295, -0.3606173, 0, 0.1607843, 1, 1,
0.3407457, 0.1572605, -0.1607738, 0, 0.1529412, 1, 1,
0.3423658, 0.1781646, 1.612154, 0, 0.1490196, 1, 1,
0.345952, -0.3040264, 3.868622, 0, 0.1411765, 1, 1,
0.3475995, -0.3176037, 0.7217857, 0, 0.1372549, 1, 1,
0.3495409, 0.2285065, 3.377293, 0, 0.1294118, 1, 1,
0.3516727, -0.959018, 2.76845, 0, 0.1254902, 1, 1,
0.3517421, -0.5082068, 3.919231, 0, 0.1176471, 1, 1,
0.3522729, 0.6704854, -0.5940332, 0, 0.1137255, 1, 1,
0.3545295, -0.5717224, 2.429351, 0, 0.1058824, 1, 1,
0.357845, 0.5910583, -1.381533, 0, 0.09803922, 1, 1,
0.3581523, -1.333481, 2.318098, 0, 0.09411765, 1, 1,
0.3604221, -0.1185046, 2.258646, 0, 0.08627451, 1, 1,
0.3648663, -0.5170786, 4.024904, 0, 0.08235294, 1, 1,
0.3715014, 1.209008, 0.4840167, 0, 0.07450981, 1, 1,
0.3723934, 0.9850495, -1.909794, 0, 0.07058824, 1, 1,
0.3739606, 0.1167198, 1.536545, 0, 0.0627451, 1, 1,
0.3746724, -0.382047, 2.24749, 0, 0.05882353, 1, 1,
0.3770348, 0.1848637, 1.79399, 0, 0.05098039, 1, 1,
0.3775656, 0.1629289, 1.740958, 0, 0.04705882, 1, 1,
0.3810335, -1.699311, 2.951125, 0, 0.03921569, 1, 1,
0.3917382, 0.09018611, 1.391095, 0, 0.03529412, 1, 1,
0.394455, -0.1028664, 1.58091, 0, 0.02745098, 1, 1,
0.4018451, 1.161728, -0.4471601, 0, 0.02352941, 1, 1,
0.4020236, -0.9937208, 3.582892, 0, 0.01568628, 1, 1,
0.4034299, -0.7507458, 3.099658, 0, 0.01176471, 1, 1,
0.4059853, 0.4771205, 0.9598656, 0, 0.003921569, 1, 1,
0.408053, 0.8483459, 1.448506, 0.003921569, 0, 1, 1,
0.4114821, -0.09242399, 0.8385891, 0.007843138, 0, 1, 1,
0.4116088, 1.136899, 0.01392703, 0.01568628, 0, 1, 1,
0.411829, -0.2687377, 1.476832, 0.01960784, 0, 1, 1,
0.4174343, -0.4428541, 1.889219, 0.02745098, 0, 1, 1,
0.4215222, -0.9619448, 2.27105, 0.03137255, 0, 1, 1,
0.423901, -0.1971416, 2.49561, 0.03921569, 0, 1, 1,
0.427454, 1.768307, 1.172319, 0.04313726, 0, 1, 1,
0.4363589, -0.6050807, 2.636503, 0.05098039, 0, 1, 1,
0.436926, 1.113369, -0.4568736, 0.05490196, 0, 1, 1,
0.4371419, -1.023067, 3.393923, 0.0627451, 0, 1, 1,
0.4385447, -0.4631464, 3.016724, 0.06666667, 0, 1, 1,
0.4412452, -0.5541131, 2.548604, 0.07450981, 0, 1, 1,
0.4434162, 0.3599759, -0.3296473, 0.07843138, 0, 1, 1,
0.4448661, -0.09897745, 0.1868304, 0.08627451, 0, 1, 1,
0.446215, -0.278062, 0.7148737, 0.09019608, 0, 1, 1,
0.4540751, -0.5872531, 0.9911986, 0.09803922, 0, 1, 1,
0.4541857, -1.132764, 2.943831, 0.1058824, 0, 1, 1,
0.4577485, -1.104553, 3.295997, 0.1098039, 0, 1, 1,
0.4579982, 0.662861, 1.420512, 0.1176471, 0, 1, 1,
0.4608218, 0.3426893, -0.7801328, 0.1215686, 0, 1, 1,
0.4621005, -0.370777, 2.972334, 0.1294118, 0, 1, 1,
0.4621586, -1.25689, 2.792206, 0.1333333, 0, 1, 1,
0.4672907, 0.2026124, 0.5429446, 0.1411765, 0, 1, 1,
0.4759206, 1.026065, 0.1835772, 0.145098, 0, 1, 1,
0.4774023, 0.8686696, -1.650403, 0.1529412, 0, 1, 1,
0.4843854, 0.315467, 0.3773659, 0.1568628, 0, 1, 1,
0.4847958, 0.7715584, -0.9264508, 0.1647059, 0, 1, 1,
0.4887312, 2.025777, 1.247273, 0.1686275, 0, 1, 1,
0.4991119, 0.08369792, 2.038742, 0.1764706, 0, 1, 1,
0.5013868, -0.8610258, 4.05683, 0.1803922, 0, 1, 1,
0.5018645, 0.5429577, 1.822572, 0.1882353, 0, 1, 1,
0.502125, -0.3229081, 2.916019, 0.1921569, 0, 1, 1,
0.5062688, 1.694729, 0.2063087, 0.2, 0, 1, 1,
0.5072849, -1.171382, 3.250479, 0.2078431, 0, 1, 1,
0.5126592, 0.3451037, 0.7971058, 0.2117647, 0, 1, 1,
0.5137398, -0.9695772, 3.389685, 0.2196078, 0, 1, 1,
0.5148251, 2.012153, 1.00383, 0.2235294, 0, 1, 1,
0.5210299, -0.2016019, 2.29064, 0.2313726, 0, 1, 1,
0.532765, -2.439101, 4.737652, 0.2352941, 0, 1, 1,
0.5357206, -0.2432476, 3.338082, 0.2431373, 0, 1, 1,
0.5406247, 1.066047, -0.5287672, 0.2470588, 0, 1, 1,
0.546942, -1.222928, 2.120439, 0.254902, 0, 1, 1,
0.5504912, -0.03775908, 1.295655, 0.2588235, 0, 1, 1,
0.5558932, 0.462753, -0.4379868, 0.2666667, 0, 1, 1,
0.5567217, -0.4561377, 3.701057, 0.2705882, 0, 1, 1,
0.5568092, -0.6835388, 1.898517, 0.2784314, 0, 1, 1,
0.557606, -0.4933599, 3.063357, 0.282353, 0, 1, 1,
0.5601051, -0.3925093, 2.648546, 0.2901961, 0, 1, 1,
0.5695246, -2.093629, 3.50967, 0.2941177, 0, 1, 1,
0.5712357, -0.4644862, 2.99448, 0.3019608, 0, 1, 1,
0.575586, -1.719088, 3.11294, 0.3098039, 0, 1, 1,
0.5763378, 0.8306341, 0.2831223, 0.3137255, 0, 1, 1,
0.5832755, 1.141259, 1.556217, 0.3215686, 0, 1, 1,
0.5838953, 0.4773129, 1.128612, 0.3254902, 0, 1, 1,
0.5853201, -1.18974, 1.011394, 0.3333333, 0, 1, 1,
0.5871319, -0.6978868, 1.340874, 0.3372549, 0, 1, 1,
0.5947757, 0.3729761, 0.5446705, 0.345098, 0, 1, 1,
0.5959874, 0.9094306, 0.8940898, 0.3490196, 0, 1, 1,
0.6000845, -2.788366, 4.568743, 0.3568628, 0, 1, 1,
0.6001036, -0.4732167, 1.880367, 0.3607843, 0, 1, 1,
0.6065146, -0.08318967, 2.428386, 0.3686275, 0, 1, 1,
0.6073967, -1.740964, 4.213967, 0.372549, 0, 1, 1,
0.6090253, -1.272045, 3.995134, 0.3803922, 0, 1, 1,
0.6095175, 0.2232592, 1.787382, 0.3843137, 0, 1, 1,
0.6120476, 0.6230447, -0.5888604, 0.3921569, 0, 1, 1,
0.6208902, -0.009136159, 4.577538, 0.3960784, 0, 1, 1,
0.6250387, -1.603961, 3.086999, 0.4039216, 0, 1, 1,
0.6251122, -0.7148365, 3.129552, 0.4117647, 0, 1, 1,
0.6260017, 0.225178, 2.338722, 0.4156863, 0, 1, 1,
0.6325247, 0.3939151, 0.9100469, 0.4235294, 0, 1, 1,
0.6369812, 0.8724226, 1.448229, 0.427451, 0, 1, 1,
0.6512945, 1.957879, 0.6291478, 0.4352941, 0, 1, 1,
0.6513809, -0.1844182, 1.251419, 0.4392157, 0, 1, 1,
0.6572113, 0.8499817, 1.060566, 0.4470588, 0, 1, 1,
0.6645213, -0.1210356, 2.643069, 0.4509804, 0, 1, 1,
0.6734253, -1.172955, 3.401326, 0.4588235, 0, 1, 1,
0.6769365, 0.4260819, 2.393068, 0.4627451, 0, 1, 1,
0.679499, 1.47507, 1.426155, 0.4705882, 0, 1, 1,
0.6815556, -0.2209101, 1.481936, 0.4745098, 0, 1, 1,
0.6860129, 0.1346437, 2.049327, 0.4823529, 0, 1, 1,
0.6880102, -1.206216, 1.914964, 0.4862745, 0, 1, 1,
0.6904466, 1.004247, 0.437725, 0.4941176, 0, 1, 1,
0.6912934, -0.9315078, 1.262227, 0.5019608, 0, 1, 1,
0.6916848, 0.2157704, 0.8253376, 0.5058824, 0, 1, 1,
0.6949251, 0.9648291, 0.9291855, 0.5137255, 0, 1, 1,
0.6953248, 1.157061, -0.5391983, 0.5176471, 0, 1, 1,
0.6993228, 0.2443445, 1.411436, 0.5254902, 0, 1, 1,
0.7048278, -0.2062654, -0.09670461, 0.5294118, 0, 1, 1,
0.714587, 1.091463, 0.9081815, 0.5372549, 0, 1, 1,
0.7161594, 0.6299184, 0.9584065, 0.5411765, 0, 1, 1,
0.7187147, -1.085344, 4.609814, 0.5490196, 0, 1, 1,
0.7190514, -1.055215, 2.60336, 0.5529412, 0, 1, 1,
0.7193116, 0.716579, -0.08161975, 0.5607843, 0, 1, 1,
0.7195115, -1.20992, 1.302287, 0.5647059, 0, 1, 1,
0.7223784, 0.3075899, 1.412241, 0.572549, 0, 1, 1,
0.7229748, 0.2874674, 0.1412567, 0.5764706, 0, 1, 1,
0.7259873, 0.9716407, 1.500264, 0.5843138, 0, 1, 1,
0.7281439, -0.2501409, 0.9852799, 0.5882353, 0, 1, 1,
0.7359464, -0.09786926, 2.865315, 0.5960785, 0, 1, 1,
0.7387007, 0.4179885, 0.7737113, 0.6039216, 0, 1, 1,
0.7393927, -1.472862, 2.925153, 0.6078432, 0, 1, 1,
0.739857, -1.204732, 1.962957, 0.6156863, 0, 1, 1,
0.7405928, 0.9952259, 2.979125, 0.6196079, 0, 1, 1,
0.7449784, 0.3156546, 1.781978, 0.627451, 0, 1, 1,
0.7571869, 1.141384, -1.773289, 0.6313726, 0, 1, 1,
0.7625086, 0.5498737, 0.1674361, 0.6392157, 0, 1, 1,
0.7643812, -1.065257, 3.474026, 0.6431373, 0, 1, 1,
0.7747483, 1.309428, -0.5374056, 0.6509804, 0, 1, 1,
0.7777368, -0.5162057, 1.47966, 0.654902, 0, 1, 1,
0.7860789, -1.724334, 4.195682, 0.6627451, 0, 1, 1,
0.7880895, -0.4124921, 1.903283, 0.6666667, 0, 1, 1,
0.7896768, 0.6465873, 0.8196902, 0.6745098, 0, 1, 1,
0.7908093, -2.003573, 2.990881, 0.6784314, 0, 1, 1,
0.7987971, -0.2948583, 1.950313, 0.6862745, 0, 1, 1,
0.8042922, 0.3337161, 1.226762, 0.6901961, 0, 1, 1,
0.8046695, 1.595157, -1.427701, 0.6980392, 0, 1, 1,
0.8051145, 0.7970755, -1.853338, 0.7058824, 0, 1, 1,
0.8082274, 2.005586, -0.5715263, 0.7098039, 0, 1, 1,
0.8131877, -0.9405997, 2.352784, 0.7176471, 0, 1, 1,
0.8169797, 0.9995072, 0.7130297, 0.7215686, 0, 1, 1,
0.817324, 0.5491265, 0.3280322, 0.7294118, 0, 1, 1,
0.8173305, -0.2362734, 1.067192, 0.7333333, 0, 1, 1,
0.8184124, 0.5137111, 1.446063, 0.7411765, 0, 1, 1,
0.8206732, 0.1610707, 1.981684, 0.7450981, 0, 1, 1,
0.8236629, 2.109146, -1.66645, 0.7529412, 0, 1, 1,
0.8272151, -0.1906937, 3.259615, 0.7568628, 0, 1, 1,
0.8275361, -0.162991, 1.512429, 0.7647059, 0, 1, 1,
0.8284037, 1.07126, 2.081653, 0.7686275, 0, 1, 1,
0.8348137, 1.860838, 1.236909, 0.7764706, 0, 1, 1,
0.8351563, -0.2810635, 1.018886, 0.7803922, 0, 1, 1,
0.8397449, 0.4350563, 1.697517, 0.7882353, 0, 1, 1,
0.845344, 0.2504497, 0.5022074, 0.7921569, 0, 1, 1,
0.8453703, -0.887139, 3.381924, 0.8, 0, 1, 1,
0.8484136, 0.9717362, 0.7256039, 0.8078431, 0, 1, 1,
0.8560867, -0.1509913, 1.443057, 0.8117647, 0, 1, 1,
0.8576325, -0.7558736, 2.12393, 0.8196079, 0, 1, 1,
0.8624195, -0.6665931, 0.9936519, 0.8235294, 0, 1, 1,
0.8638338, -0.3320672, 1.697125, 0.8313726, 0, 1, 1,
0.8647122, -0.6427186, 2.373128, 0.8352941, 0, 1, 1,
0.8691379, -2.122622, 4.512186, 0.8431373, 0, 1, 1,
0.8725219, 0.3967131, 1.689828, 0.8470588, 0, 1, 1,
0.8742166, 2.002692, 1.658985, 0.854902, 0, 1, 1,
0.8793549, -0.4700096, 1.700642, 0.8588235, 0, 1, 1,
0.8798805, 1.187583, -0.4841518, 0.8666667, 0, 1, 1,
0.8810866, -0.3613382, 3.02425, 0.8705882, 0, 1, 1,
0.8837443, 0.4115478, 0.07950082, 0.8784314, 0, 1, 1,
0.8853152, -1.093925, 1.572888, 0.8823529, 0, 1, 1,
0.8858745, 0.4222043, 0.960048, 0.8901961, 0, 1, 1,
0.8914875, 0.4298367, -0.7289525, 0.8941177, 0, 1, 1,
0.8915328, -1.680813, 1.569795, 0.9019608, 0, 1, 1,
0.8930444, 0.3555494, 2.257547, 0.9098039, 0, 1, 1,
0.893156, -0.6863174, 4.140603, 0.9137255, 0, 1, 1,
0.893918, -0.01887423, 2.60826, 0.9215686, 0, 1, 1,
0.8943562, 0.2453945, 1.527145, 0.9254902, 0, 1, 1,
0.8952585, -0.7672409, 1.606198, 0.9333333, 0, 1, 1,
0.9018393, -0.2970657, 0.6445104, 0.9372549, 0, 1, 1,
0.9018396, 0.0568916, 2.143816, 0.945098, 0, 1, 1,
0.9022135, -0.1504276, 1.184813, 0.9490196, 0, 1, 1,
0.9059586, -0.6730987, 4.481021, 0.9568627, 0, 1, 1,
0.9068016, 0.4162118, 0.07237753, 0.9607843, 0, 1, 1,
0.9077286, 1.511721, 0.5805151, 0.9686275, 0, 1, 1,
0.9141873, -1.598417, 1.23244, 0.972549, 0, 1, 1,
0.9159133, 0.4081557, 1.523819, 0.9803922, 0, 1, 1,
0.9181664, -0.2530713, 2.919426, 0.9843137, 0, 1, 1,
0.939515, -0.2770852, 1.888607, 0.9921569, 0, 1, 1,
0.9417356, -1.131835, 3.701518, 0.9960784, 0, 1, 1,
0.948384, -0.3430494, 3.498496, 1, 0, 0.9960784, 1,
0.9672492, -0.0815887, 1.505649, 1, 0, 0.9882353, 1,
0.9725761, 1.167452, 1.432975, 1, 0, 0.9843137, 1,
0.9746233, -1.08071, 1.186325, 1, 0, 0.9764706, 1,
0.9766111, 0.3711719, 1.448566, 1, 0, 0.972549, 1,
0.9771093, 0.6215031, 1.759214, 1, 0, 0.9647059, 1,
0.9776772, 0.2546355, 3.347462, 1, 0, 0.9607843, 1,
0.9817782, 0.2659965, -0.407883, 1, 0, 0.9529412, 1,
0.9860567, -1.443387, 2.229427, 1, 0, 0.9490196, 1,
0.9925041, -0.1566009, 0.8334138, 1, 0, 0.9411765, 1,
0.9976492, 0.2286283, -0.3744326, 1, 0, 0.9372549, 1,
1.000047, -0.9860282, 1.055336, 1, 0, 0.9294118, 1,
1.006952, -1.653036, 2.074128, 1, 0, 0.9254902, 1,
1.011021, 0.8029708, 1.16359, 1, 0, 0.9176471, 1,
1.011827, 0.1723811, 0.1266144, 1, 0, 0.9137255, 1,
1.018105, -0.2015962, 1.145689, 1, 0, 0.9058824, 1,
1.018864, -0.1893254, -0.08751603, 1, 0, 0.9019608, 1,
1.020561, -1.659663, 2.612894, 1, 0, 0.8941177, 1,
1.027767, 2.071134, 0.7917381, 1, 0, 0.8862745, 1,
1.030054, -0.9166784, 1.136172, 1, 0, 0.8823529, 1,
1.036573, -0.7622833, 2.756714, 1, 0, 0.8745098, 1,
1.039252, -0.7466303, 2.639995, 1, 0, 0.8705882, 1,
1.039551, 0.2221329, 2.032063, 1, 0, 0.8627451, 1,
1.048156, 0.6377109, -0.718414, 1, 0, 0.8588235, 1,
1.048537, -0.963002, 2.991097, 1, 0, 0.8509804, 1,
1.052571, 1.958781, 2.127698, 1, 0, 0.8470588, 1,
1.057538, 0.8161193, 2.189908, 1, 0, 0.8392157, 1,
1.060178, -0.6709567, 0.7173227, 1, 0, 0.8352941, 1,
1.060389, 1.179259, 0.8574282, 1, 0, 0.827451, 1,
1.062164, 0.4493547, 0.7714301, 1, 0, 0.8235294, 1,
1.063739, -0.3946145, 1.908036, 1, 0, 0.8156863, 1,
1.064202, -0.2074934, 2.064176, 1, 0, 0.8117647, 1,
1.065388, -1.511348, 2.444186, 1, 0, 0.8039216, 1,
1.072458, -0.1353908, -0.1749898, 1, 0, 0.7960784, 1,
1.084355, 0.004192386, 1.949773, 1, 0, 0.7921569, 1,
1.084785, 0.354055, 3.080142, 1, 0, 0.7843137, 1,
1.091162, -0.8907168, 0.6942123, 1, 0, 0.7803922, 1,
1.100533, -0.3233379, 1.927562, 1, 0, 0.772549, 1,
1.103019, 0.7349254, -0.1440049, 1, 0, 0.7686275, 1,
1.105369, 0.5921473, 0.6079446, 1, 0, 0.7607843, 1,
1.115243, 0.125899, 1.350759, 1, 0, 0.7568628, 1,
1.118347, -1.493256, 1.919236, 1, 0, 0.7490196, 1,
1.122276, -0.879251, 0.6268182, 1, 0, 0.7450981, 1,
1.127511, 0.9789817, -0.1812598, 1, 0, 0.7372549, 1,
1.133816, -0.6832803, 1.412529, 1, 0, 0.7333333, 1,
1.135503, -1.173872, 3.524385, 1, 0, 0.7254902, 1,
1.15294, 0.1412958, 0.8207032, 1, 0, 0.7215686, 1,
1.156385, 1.061857, -1.471099, 1, 0, 0.7137255, 1,
1.159363, -0.4838397, 0.923865, 1, 0, 0.7098039, 1,
1.161441, -0.1493136, 1.559995, 1, 0, 0.7019608, 1,
1.171865, 1.136836, 1.428872, 1, 0, 0.6941177, 1,
1.175221, -0.9905562, 1.650434, 1, 0, 0.6901961, 1,
1.179897, 1.128413, 1.702227, 1, 0, 0.682353, 1,
1.183159, 0.7363479, 1.679516, 1, 0, 0.6784314, 1,
1.188848, 0.225546, 2.540374, 1, 0, 0.6705883, 1,
1.189074, -1.386842, 3.325508, 1, 0, 0.6666667, 1,
1.204876, 1.842319, 1.174009, 1, 0, 0.6588235, 1,
1.206991, -0.7096791, 1.911562, 1, 0, 0.654902, 1,
1.207932, -0.25521, 3.432796, 1, 0, 0.6470588, 1,
1.209103, -1.069639, 3.498122, 1, 0, 0.6431373, 1,
1.209734, -0.07479483, 1.016373, 1, 0, 0.6352941, 1,
1.214653, -0.9304618, 2.312958, 1, 0, 0.6313726, 1,
1.228152, 0.7439362, 1.479963, 1, 0, 0.6235294, 1,
1.256881, -0.2427339, 2.624707, 1, 0, 0.6196079, 1,
1.258773, -0.7287402, 2.906048, 1, 0, 0.6117647, 1,
1.259987, -0.04448928, 1.619373, 1, 0, 0.6078432, 1,
1.274654, 0.7592333, 1.62769, 1, 0, 0.6, 1,
1.275504, -1.284474, 0.8936079, 1, 0, 0.5921569, 1,
1.277588, -0.420395, 3.796533, 1, 0, 0.5882353, 1,
1.281519, -0.5634283, 0.9652442, 1, 0, 0.5803922, 1,
1.283406, 1.59057, 0.05573908, 1, 0, 0.5764706, 1,
1.289354, 0.4576635, 1.18529, 1, 0, 0.5686275, 1,
1.299322, 0.3176264, 0.6739451, 1, 0, 0.5647059, 1,
1.31189, -1.01876, 1.587626, 1, 0, 0.5568628, 1,
1.313147, -0.2076285, 1.577547, 1, 0, 0.5529412, 1,
1.315235, -0.5406092, 4.205392, 1, 0, 0.5450981, 1,
1.318385, 0.06405321, 2.580117, 1, 0, 0.5411765, 1,
1.32184, -1.337049, 1.750732, 1, 0, 0.5333334, 1,
1.323294, -2.1388, 2.209134, 1, 0, 0.5294118, 1,
1.325153, 0.2793415, 0.7672685, 1, 0, 0.5215687, 1,
1.327542, 0.4293509, 1.493702, 1, 0, 0.5176471, 1,
1.331883, 0.1030084, 0.8725324, 1, 0, 0.509804, 1,
1.334976, 0.8331711, 1.534738, 1, 0, 0.5058824, 1,
1.342344, -0.0635774, 2.330424, 1, 0, 0.4980392, 1,
1.345004, 0.1917865, 1.106083, 1, 0, 0.4901961, 1,
1.361686, -1.097604, 4.030184, 1, 0, 0.4862745, 1,
1.373275, -1.467147, 3.505072, 1, 0, 0.4784314, 1,
1.377152, 0.2532522, 1.424784, 1, 0, 0.4745098, 1,
1.377304, -0.1328495, 1.459785, 1, 0, 0.4666667, 1,
1.380396, 0.5286391, 1.192324, 1, 0, 0.4627451, 1,
1.384462, -2.191023, 3.918215, 1, 0, 0.454902, 1,
1.39616, -1.226134, 2.279591, 1, 0, 0.4509804, 1,
1.425511, 2.311272, -1.346175, 1, 0, 0.4431373, 1,
1.438429, 0.2024102, 2.29988, 1, 0, 0.4392157, 1,
1.447044, -0.467649, 1.748742, 1, 0, 0.4313726, 1,
1.452931, 1.562141, 1.091857, 1, 0, 0.427451, 1,
1.453483, 0.9661925, 0.4770234, 1, 0, 0.4196078, 1,
1.455254, -0.2269154, 2.394958, 1, 0, 0.4156863, 1,
1.457136, 0.6116881, 1.04496, 1, 0, 0.4078431, 1,
1.459561, 0.3898305, 3.140372, 1, 0, 0.4039216, 1,
1.465708, -0.1933613, 2.071166, 1, 0, 0.3960784, 1,
1.47119, -0.6040354, 2.979113, 1, 0, 0.3882353, 1,
1.472629, 0.2745056, 1.828916, 1, 0, 0.3843137, 1,
1.476694, 0.6960636, 1.198218, 1, 0, 0.3764706, 1,
1.482031, -0.08078487, 2.206492, 1, 0, 0.372549, 1,
1.482229, -0.660747, 1.473502, 1, 0, 0.3647059, 1,
1.486435, 0.2008493, 2.702034, 1, 0, 0.3607843, 1,
1.50296, -0.1379674, 2.34868, 1, 0, 0.3529412, 1,
1.503524, 1.001626, 1.898422, 1, 0, 0.3490196, 1,
1.519749, 0.9241957, 0.8886912, 1, 0, 0.3411765, 1,
1.535512, -0.9692963, 3.506667, 1, 0, 0.3372549, 1,
1.549597, -0.4299244, 2.371707, 1, 0, 0.3294118, 1,
1.555206, -0.1572399, 1.69824, 1, 0, 0.3254902, 1,
1.561794, 0.6248874, 0.5442729, 1, 0, 0.3176471, 1,
1.577971, -0.2379845, 2.334018, 1, 0, 0.3137255, 1,
1.585695, 0.3030154, 2.596543, 1, 0, 0.3058824, 1,
1.587183, -1.411937, 0.6332141, 1, 0, 0.2980392, 1,
1.603179, 0.02053625, 1.607685, 1, 0, 0.2941177, 1,
1.642361, 0.883137, 1.07444, 1, 0, 0.2862745, 1,
1.663211, -0.1256876, 2.416214, 1, 0, 0.282353, 1,
1.674809, 0.1658895, 0.902232, 1, 0, 0.2745098, 1,
1.681226, -1.234313, 1.560602, 1, 0, 0.2705882, 1,
1.682602, 1.122357, 0.8061737, 1, 0, 0.2627451, 1,
1.683399, -1.190754, 1.208863, 1, 0, 0.2588235, 1,
1.688497, 0.239305, 2.914087, 1, 0, 0.2509804, 1,
1.691453, 0.6656821, 0.8880773, 1, 0, 0.2470588, 1,
1.712918, 0.6881861, 0.5689458, 1, 0, 0.2392157, 1,
1.721381, 1.028781, 2.519587, 1, 0, 0.2352941, 1,
1.721814, -1.495664, 3.434467, 1, 0, 0.227451, 1,
1.72778, 0.370091, 1.262891, 1, 0, 0.2235294, 1,
1.739671, 1.048535, 0.6256983, 1, 0, 0.2156863, 1,
1.755201, -1.450383, 2.724174, 1, 0, 0.2117647, 1,
1.767581, 1.097058, 2.183704, 1, 0, 0.2039216, 1,
1.773722, -0.2469199, 2.231046, 1, 0, 0.1960784, 1,
1.790088, 0.8862321, 0.7721455, 1, 0, 0.1921569, 1,
1.799718, 0.7840753, 1.268374, 1, 0, 0.1843137, 1,
1.841244, 1.321157, 2.169249, 1, 0, 0.1803922, 1,
1.872577, -0.3367257, 0.9918496, 1, 0, 0.172549, 1,
1.934653, 1.067253, -0.0920004, 1, 0, 0.1686275, 1,
1.938366, -0.872247, 1.772048, 1, 0, 0.1607843, 1,
1.942635, -0.2453258, 0.93372, 1, 0, 0.1568628, 1,
1.963882, 0.1244664, 2.640726, 1, 0, 0.1490196, 1,
1.965624, -0.5599223, 2.859262, 1, 0, 0.145098, 1,
1.969571, -2.051138, 3.77228, 1, 0, 0.1372549, 1,
1.974571, -2.25479, 1.288508, 1, 0, 0.1333333, 1,
1.985534, 0.1644393, 1.744482, 1, 0, 0.1254902, 1,
1.985785, -0.3791115, 2.808073, 1, 0, 0.1215686, 1,
2.006835, -0.05518825, 2.95754, 1, 0, 0.1137255, 1,
2.025314, 1.421317, -0.08586694, 1, 0, 0.1098039, 1,
2.039152, -0.01917732, 2.096281, 1, 0, 0.1019608, 1,
2.045459, 1.000782, 1.031349, 1, 0, 0.09411765, 1,
2.073892, 0.1601856, 2.512946, 1, 0, 0.09019608, 1,
2.088979, -0.3046358, 3.423069, 1, 0, 0.08235294, 1,
2.121351, 2.04583, -0.6073176, 1, 0, 0.07843138, 1,
2.1303, -0.0002551955, 0.1170294, 1, 0, 0.07058824, 1,
2.155508, 1.085788, 2.105856, 1, 0, 0.06666667, 1,
2.171059, 0.3097486, 1.833605, 1, 0, 0.05882353, 1,
2.285766, 0.2929288, 0.9529173, 1, 0, 0.05490196, 1,
2.299734, 1.086337, 0.2918383, 1, 0, 0.04705882, 1,
2.317027, 2.507022, -1.047046, 1, 0, 0.04313726, 1,
2.356351, 1.730922, 0.5769801, 1, 0, 0.03529412, 1,
2.577787, -0.4247554, 3.741365, 1, 0, 0.03137255, 1,
2.600958, 0.2585092, 1.286241, 1, 0, 0.02352941, 1,
2.684189, -1.531642, 2.447447, 1, 0, 0.01960784, 1,
3.061398, 0.9688216, 1.604293, 1, 0, 0.01176471, 1,
3.238092, -0.4108968, 3.093945, 1, 0, 0.007843138, 1
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
-0.1392419, -4.208709, -7.214961, 0, -0.5, 0.5, 0.5,
-0.1392419, -4.208709, -7.214961, 1, -0.5, 0.5, 0.5,
-0.1392419, -4.208709, -7.214961, 1, 1.5, 0.5, 0.5,
-0.1392419, -4.208709, -7.214961, 0, 1.5, 0.5, 0.5
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
-4.661492, 0.2350008, -7.214961, 0, -0.5, 0.5, 0.5,
-4.661492, 0.2350008, -7.214961, 1, -0.5, 0.5, 0.5,
-4.661492, 0.2350008, -7.214961, 1, 1.5, 0.5, 0.5,
-4.661492, 0.2350008, -7.214961, 0, 1.5, 0.5, 0.5
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
-4.661492, -4.208709, 0.01475453, 0, -0.5, 0.5, 0.5,
-4.661492, -4.208709, 0.01475453, 1, -0.5, 0.5, 0.5,
-4.661492, -4.208709, 0.01475453, 1, 1.5, 0.5, 0.5,
-4.661492, -4.208709, 0.01475453, 0, 1.5, 0.5, 0.5
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
-3, -3.183237, -5.546565,
3, -3.183237, -5.546565,
-3, -3.183237, -5.546565,
-3, -3.354149, -5.824631,
-2, -3.183237, -5.546565,
-2, -3.354149, -5.824631,
-1, -3.183237, -5.546565,
-1, -3.354149, -5.824631,
0, -3.183237, -5.546565,
0, -3.354149, -5.824631,
1, -3.183237, -5.546565,
1, -3.354149, -5.824631,
2, -3.183237, -5.546565,
2, -3.354149, -5.824631,
3, -3.183237, -5.546565,
3, -3.354149, -5.824631
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
-3, -3.695973, -6.380763, 0, -0.5, 0.5, 0.5,
-3, -3.695973, -6.380763, 1, -0.5, 0.5, 0.5,
-3, -3.695973, -6.380763, 1, 1.5, 0.5, 0.5,
-3, -3.695973, -6.380763, 0, 1.5, 0.5, 0.5,
-2, -3.695973, -6.380763, 0, -0.5, 0.5, 0.5,
-2, -3.695973, -6.380763, 1, -0.5, 0.5, 0.5,
-2, -3.695973, -6.380763, 1, 1.5, 0.5, 0.5,
-2, -3.695973, -6.380763, 0, 1.5, 0.5, 0.5,
-1, -3.695973, -6.380763, 0, -0.5, 0.5, 0.5,
-1, -3.695973, -6.380763, 1, -0.5, 0.5, 0.5,
-1, -3.695973, -6.380763, 1, 1.5, 0.5, 0.5,
-1, -3.695973, -6.380763, 0, 1.5, 0.5, 0.5,
0, -3.695973, -6.380763, 0, -0.5, 0.5, 0.5,
0, -3.695973, -6.380763, 1, -0.5, 0.5, 0.5,
0, -3.695973, -6.380763, 1, 1.5, 0.5, 0.5,
0, -3.695973, -6.380763, 0, 1.5, 0.5, 0.5,
1, -3.695973, -6.380763, 0, -0.5, 0.5, 0.5,
1, -3.695973, -6.380763, 1, -0.5, 0.5, 0.5,
1, -3.695973, -6.380763, 1, 1.5, 0.5, 0.5,
1, -3.695973, -6.380763, 0, 1.5, 0.5, 0.5,
2, -3.695973, -6.380763, 0, -0.5, 0.5, 0.5,
2, -3.695973, -6.380763, 1, -0.5, 0.5, 0.5,
2, -3.695973, -6.380763, 1, 1.5, 0.5, 0.5,
2, -3.695973, -6.380763, 0, 1.5, 0.5, 0.5,
3, -3.695973, -6.380763, 0, -0.5, 0.5, 0.5,
3, -3.695973, -6.380763, 1, -0.5, 0.5, 0.5,
3, -3.695973, -6.380763, 1, 1.5, 0.5, 0.5,
3, -3.695973, -6.380763, 0, 1.5, 0.5, 0.5
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
-3.617896, -3, -5.546565,
-3.617896, 3, -5.546565,
-3.617896, -3, -5.546565,
-3.791828, -3, -5.824631,
-3.617896, -2, -5.546565,
-3.791828, -2, -5.824631,
-3.617896, -1, -5.546565,
-3.791828, -1, -5.824631,
-3.617896, 0, -5.546565,
-3.791828, 0, -5.824631,
-3.617896, 1, -5.546565,
-3.791828, 1, -5.824631,
-3.617896, 2, -5.546565,
-3.791828, 2, -5.824631,
-3.617896, 3, -5.546565,
-3.791828, 3, -5.824631
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
-4.139694, -3, -6.380763, 0, -0.5, 0.5, 0.5,
-4.139694, -3, -6.380763, 1, -0.5, 0.5, 0.5,
-4.139694, -3, -6.380763, 1, 1.5, 0.5, 0.5,
-4.139694, -3, -6.380763, 0, 1.5, 0.5, 0.5,
-4.139694, -2, -6.380763, 0, -0.5, 0.5, 0.5,
-4.139694, -2, -6.380763, 1, -0.5, 0.5, 0.5,
-4.139694, -2, -6.380763, 1, 1.5, 0.5, 0.5,
-4.139694, -2, -6.380763, 0, 1.5, 0.5, 0.5,
-4.139694, -1, -6.380763, 0, -0.5, 0.5, 0.5,
-4.139694, -1, -6.380763, 1, -0.5, 0.5, 0.5,
-4.139694, -1, -6.380763, 1, 1.5, 0.5, 0.5,
-4.139694, -1, -6.380763, 0, 1.5, 0.5, 0.5,
-4.139694, 0, -6.380763, 0, -0.5, 0.5, 0.5,
-4.139694, 0, -6.380763, 1, -0.5, 0.5, 0.5,
-4.139694, 0, -6.380763, 1, 1.5, 0.5, 0.5,
-4.139694, 0, -6.380763, 0, 1.5, 0.5, 0.5,
-4.139694, 1, -6.380763, 0, -0.5, 0.5, 0.5,
-4.139694, 1, -6.380763, 1, -0.5, 0.5, 0.5,
-4.139694, 1, -6.380763, 1, 1.5, 0.5, 0.5,
-4.139694, 1, -6.380763, 0, 1.5, 0.5, 0.5,
-4.139694, 2, -6.380763, 0, -0.5, 0.5, 0.5,
-4.139694, 2, -6.380763, 1, -0.5, 0.5, 0.5,
-4.139694, 2, -6.380763, 1, 1.5, 0.5, 0.5,
-4.139694, 2, -6.380763, 0, 1.5, 0.5, 0.5,
-4.139694, 3, -6.380763, 0, -0.5, 0.5, 0.5,
-4.139694, 3, -6.380763, 1, -0.5, 0.5, 0.5,
-4.139694, 3, -6.380763, 1, 1.5, 0.5, 0.5,
-4.139694, 3, -6.380763, 0, 1.5, 0.5, 0.5
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
-3.617896, -3.183237, -4,
-3.617896, -3.183237, 4,
-3.617896, -3.183237, -4,
-3.791828, -3.354149, -4,
-3.617896, -3.183237, -2,
-3.791828, -3.354149, -2,
-3.617896, -3.183237, 0,
-3.791828, -3.354149, 0,
-3.617896, -3.183237, 2,
-3.791828, -3.354149, 2,
-3.617896, -3.183237, 4,
-3.791828, -3.354149, 4
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
-4.139694, -3.695973, -4, 0, -0.5, 0.5, 0.5,
-4.139694, -3.695973, -4, 1, -0.5, 0.5, 0.5,
-4.139694, -3.695973, -4, 1, 1.5, 0.5, 0.5,
-4.139694, -3.695973, -4, 0, 1.5, 0.5, 0.5,
-4.139694, -3.695973, -2, 0, -0.5, 0.5, 0.5,
-4.139694, -3.695973, -2, 1, -0.5, 0.5, 0.5,
-4.139694, -3.695973, -2, 1, 1.5, 0.5, 0.5,
-4.139694, -3.695973, -2, 0, 1.5, 0.5, 0.5,
-4.139694, -3.695973, 0, 0, -0.5, 0.5, 0.5,
-4.139694, -3.695973, 0, 1, -0.5, 0.5, 0.5,
-4.139694, -3.695973, 0, 1, 1.5, 0.5, 0.5,
-4.139694, -3.695973, 0, 0, 1.5, 0.5, 0.5,
-4.139694, -3.695973, 2, 0, -0.5, 0.5, 0.5,
-4.139694, -3.695973, 2, 1, -0.5, 0.5, 0.5,
-4.139694, -3.695973, 2, 1, 1.5, 0.5, 0.5,
-4.139694, -3.695973, 2, 0, 1.5, 0.5, 0.5,
-4.139694, -3.695973, 4, 0, -0.5, 0.5, 0.5,
-4.139694, -3.695973, 4, 1, -0.5, 0.5, 0.5,
-4.139694, -3.695973, 4, 1, 1.5, 0.5, 0.5,
-4.139694, -3.695973, 4, 0, 1.5, 0.5, 0.5
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
-3.617896, -3.183237, -5.546565,
-3.617896, 3.653239, -5.546565,
-3.617896, -3.183237, 5.576074,
-3.617896, 3.653239, 5.576074,
-3.617896, -3.183237, -5.546565,
-3.617896, -3.183237, 5.576074,
-3.617896, 3.653239, -5.546565,
-3.617896, 3.653239, 5.576074,
-3.617896, -3.183237, -5.546565,
3.339412, -3.183237, -5.546565,
-3.617896, -3.183237, 5.576074,
3.339412, -3.183237, 5.576074,
-3.617896, 3.653239, -5.546565,
3.339412, 3.653239, -5.546565,
-3.617896, 3.653239, 5.576074,
3.339412, 3.653239, 5.576074,
3.339412, -3.183237, -5.546565,
3.339412, 3.653239, -5.546565,
3.339412, -3.183237, 5.576074,
3.339412, 3.653239, 5.576074,
3.339412, -3.183237, -5.546565,
3.339412, -3.183237, 5.576074,
3.339412, 3.653239, -5.546565,
3.339412, 3.653239, 5.576074
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
var radius = 7.899568;
var distance = 35.14607;
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
mvMatrix.translate( 0.1392419, -0.2350008, -0.01475453 );
mvMatrix.scale( 1.227654, 1.249352, 0.7679084 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.14607);
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
InChI_1S_C42H67NO10.<-read.table("InChI_1S_C42H67NO10..xyz")
```

```
## Error in read.table("InChI_1S_C42H67NO10..xyz"): no lines available in input
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
-3.516576, 0.1617593, -1.494521, 0, 0, 1, 1, 1,
-2.943186, -1.880085, -3.106169, 1, 0, 0, 1, 1,
-2.725364, -0.7324712, -2.895203, 1, 0, 0, 1, 1,
-2.469031, 1.579618, -2.758559, 1, 0, 0, 1, 1,
-2.464014, 1.662482, -0.6262012, 1, 0, 0, 1, 1,
-2.463971, 0.2633417, -1.776023, 1, 0, 0, 1, 1,
-2.44478, -1.75328, -1.257185, 0, 0, 0, 1, 1,
-2.42402, -0.6077124, -1.353784, 0, 0, 0, 1, 1,
-2.382065, 0.658359, -0.4076715, 0, 0, 0, 1, 1,
-2.347308, -1.586538, -3.276578, 0, 0, 0, 1, 1,
-2.32834, 0.1621796, 0.2452419, 0, 0, 0, 1, 1,
-2.311791, 0.6047249, -0.5035911, 0, 0, 0, 1, 1,
-2.311283, -0.773636, -1.237312, 0, 0, 0, 1, 1,
-2.265648, -0.1506652, -3.577893, 1, 1, 1, 1, 1,
-2.246176, 0.4182498, -1.621338, 1, 1, 1, 1, 1,
-2.244931, -0.5582954, -1.350314, 1, 1, 1, 1, 1,
-2.210824, 0.2298602, -0.2568192, 1, 1, 1, 1, 1,
-2.208808, 0.2832042, -1.359907, 1, 1, 1, 1, 1,
-2.196925, -0.2192597, -2.237957, 1, 1, 1, 1, 1,
-2.175889, 1.970586, -1.463994, 1, 1, 1, 1, 1,
-2.162696, 0.1842329, -1.435104, 1, 1, 1, 1, 1,
-2.160095, 0.1977256, -1.386567, 1, 1, 1, 1, 1,
-2.140774, 0.5010895, -1.103383, 1, 1, 1, 1, 1,
-2.137704, -0.6175229, -1.792586, 1, 1, 1, 1, 1,
-2.131731, -1.087486, -1.22065, 1, 1, 1, 1, 1,
-2.129326, -0.4664527, -2.094572, 1, 1, 1, 1, 1,
-2.126419, -1.065404, -2.417646, 1, 1, 1, 1, 1,
-2.120248, -0.4908265, 0.257603, 1, 1, 1, 1, 1,
-2.118387, 1.065748, -1.409503, 0, 0, 1, 1, 1,
-2.023752, -1.011483, -1.940942, 1, 0, 0, 1, 1,
-1.99468, 0.2299662, -0.060124, 1, 0, 0, 1, 1,
-1.994611, -0.5906029, -3.55857, 1, 0, 0, 1, 1,
-1.963586, 0.6723769, -0.1969281, 1, 0, 0, 1, 1,
-1.960956, 0.9028556, -0.8217652, 1, 0, 0, 1, 1,
-1.925203, -0.5409154, -2.818067, 0, 0, 0, 1, 1,
-1.901142, 0.4090592, 0.2866789, 0, 0, 0, 1, 1,
-1.896975, -0.1731555, -2.117626, 0, 0, 0, 1, 1,
-1.855917, 0.499611, -1.235829, 0, 0, 0, 1, 1,
-1.834202, 0.7239474, -1.453861, 0, 0, 0, 1, 1,
-1.82702, 0.4358249, -0.7579205, 0, 0, 0, 1, 1,
-1.809128, -2.104142, -2.813995, 0, 0, 0, 1, 1,
-1.769657, -0.8555343, -2.774957, 1, 1, 1, 1, 1,
-1.753473, 1.480922, -0.5613618, 1, 1, 1, 1, 1,
-1.723791, 0.4140333, -2.371671, 1, 1, 1, 1, 1,
-1.716616, -1.34435, -1.553931, 1, 1, 1, 1, 1,
-1.708967, 0.8620347, -1.177172, 1, 1, 1, 1, 1,
-1.703537, 1.330175, 0.4815135, 1, 1, 1, 1, 1,
-1.695695, 0.9353039, -0.3235373, 1, 1, 1, 1, 1,
-1.680918, 1.232289, -1.364359, 1, 1, 1, 1, 1,
-1.678335, -0.7299355, -1.716541, 1, 1, 1, 1, 1,
-1.670226, -0.6105453, -3.578643, 1, 1, 1, 1, 1,
-1.650215, 0.2078204, -2.14944, 1, 1, 1, 1, 1,
-1.648895, -0.660969, -1.163839, 1, 1, 1, 1, 1,
-1.630753, 0.5922043, -2.922127, 1, 1, 1, 1, 1,
-1.629351, -0.791598, -0.7005549, 1, 1, 1, 1, 1,
-1.612628, -0.4803642, -2.02429, 1, 1, 1, 1, 1,
-1.610869, 0.05677317, -0.9657214, 0, 0, 1, 1, 1,
-1.609425, 0.3585427, -1.505263, 1, 0, 0, 1, 1,
-1.602978, -1.627887, -1.758215, 1, 0, 0, 1, 1,
-1.596269, -0.2451026, -0.9938039, 1, 0, 0, 1, 1,
-1.582769, 0.5067822, -2.009646, 1, 0, 0, 1, 1,
-1.570777, 1.211643, 0.1782165, 1, 0, 0, 1, 1,
-1.549338, 1.21993, -1.060468, 0, 0, 0, 1, 1,
-1.537496, -1.273036, -3.504903, 0, 0, 0, 1, 1,
-1.534068, 2.322843, -1.759786, 0, 0, 0, 1, 1,
-1.534011, 1.107964, -0.03390339, 0, 0, 0, 1, 1,
-1.490052, -1.073684, -3.847557, 0, 0, 0, 1, 1,
-1.48941, -1.100897, -1.815726, 0, 0, 0, 1, 1,
-1.480396, -0.1616088, -1.290657, 0, 0, 0, 1, 1,
-1.470458, -1.279732, -2.595501, 1, 1, 1, 1, 1,
-1.470391, 0.6607057, 0.09629991, 1, 1, 1, 1, 1,
-1.469294, -0.1379008, -1.039756, 1, 1, 1, 1, 1,
-1.440834, 0.4112812, -1.918916, 1, 1, 1, 1, 1,
-1.420351, -0.05390386, -1.854666, 1, 1, 1, 1, 1,
-1.403834, -0.671862, -1.727429, 1, 1, 1, 1, 1,
-1.395642, -1.529953, -3.406077, 1, 1, 1, 1, 1,
-1.385315, 0.05126888, -0.5995583, 1, 1, 1, 1, 1,
-1.380072, 0.1905677, -1.934893, 1, 1, 1, 1, 1,
-1.378695, -1.296493, -1.820048, 1, 1, 1, 1, 1,
-1.352892, 1.116361, -0.7707196, 1, 1, 1, 1, 1,
-1.351853, 0.4121751, -1.451079, 1, 1, 1, 1, 1,
-1.347327, -1.021103, -1.894451, 1, 1, 1, 1, 1,
-1.345154, -0.4294611, -1.176285, 1, 1, 1, 1, 1,
-1.340265, 0.1225157, -0.8056571, 1, 1, 1, 1, 1,
-1.330432, 0.6568769, 0.4106747, 0, 0, 1, 1, 1,
-1.326034, 0.1704448, -0.8686137, 1, 0, 0, 1, 1,
-1.315692, 0.424684, -1.463171, 1, 0, 0, 1, 1,
-1.314997, 1.367487, -1.884458, 1, 0, 0, 1, 1,
-1.309748, -0.3860727, -1.293804, 1, 0, 0, 1, 1,
-1.309022, 1.493915, -0.8451799, 1, 0, 0, 1, 1,
-1.306094, -0.07375944, -1.172175, 0, 0, 0, 1, 1,
-1.301053, 1.306015, -1.87327, 0, 0, 0, 1, 1,
-1.3005, 0.3459982, -1.742814, 0, 0, 0, 1, 1,
-1.296805, -0.2901596, -2.873268, 0, 0, 0, 1, 1,
-1.296264, 1.429204, 0.8659053, 0, 0, 0, 1, 1,
-1.296025, 0.05751843, -0.7985032, 0, 0, 0, 1, 1,
-1.283322, 0.8937877, -1.225879, 0, 0, 0, 1, 1,
-1.268602, -1.527199, -2.513206, 1, 1, 1, 1, 1,
-1.258678, 1.456789, 1.202259, 1, 1, 1, 1, 1,
-1.252371, -1.56899, -2.248305, 1, 1, 1, 1, 1,
-1.250142, -0.8364238, -2.767435, 1, 1, 1, 1, 1,
-1.247404, 1.738052, 0.6731334, 1, 1, 1, 1, 1,
-1.244026, -0.205365, -0.7251191, 1, 1, 1, 1, 1,
-1.238925, -2.320566, -2.855451, 1, 1, 1, 1, 1,
-1.235707, 1.981502, -1.088993, 1, 1, 1, 1, 1,
-1.233064, -1.077019, -1.835026, 1, 1, 1, 1, 1,
-1.229084, -0.67215, -1.321632, 1, 1, 1, 1, 1,
-1.217108, -0.6497515, -3.198278, 1, 1, 1, 1, 1,
-1.216728, -0.8489872, -2.967744, 1, 1, 1, 1, 1,
-1.21304, 1.494329, 0.7789261, 1, 1, 1, 1, 1,
-1.209901, -0.3387171, -1.971363, 1, 1, 1, 1, 1,
-1.187907, -0.8671368, -0.7552457, 1, 1, 1, 1, 1,
-1.18604, 0.3311995, -1.015991, 0, 0, 1, 1, 1,
-1.185219, -0.6800367, -2.362125, 1, 0, 0, 1, 1,
-1.178202, 0.7821066, -1.264203, 1, 0, 0, 1, 1,
-1.169958, 0.2107443, -2.666759, 1, 0, 0, 1, 1,
-1.166172, -1.131538, -1.570675, 1, 0, 0, 1, 1,
-1.166074, 0.6074655, -0.5287145, 1, 0, 0, 1, 1,
-1.153683, 0.03635092, -1.156899, 0, 0, 0, 1, 1,
-1.152223, -1.275111, -2.674454, 0, 0, 0, 1, 1,
-1.15126, -0.1059918, -1.282445, 0, 0, 0, 1, 1,
-1.145836, -1.388899, -1.592037, 0, 0, 0, 1, 1,
-1.138098, -1.883536, -3.585438, 0, 0, 0, 1, 1,
-1.13543, 0.5949176, -1.26559, 0, 0, 0, 1, 1,
-1.133341, -1.088935, -2.275845, 0, 0, 0, 1, 1,
-1.13215, -0.3552541, -2.059537, 1, 1, 1, 1, 1,
-1.129503, -0.9027834, -1.933272, 1, 1, 1, 1, 1,
-1.129253, -1.058352, -3.519187, 1, 1, 1, 1, 1,
-1.127381, -1.295705, -4.225078, 1, 1, 1, 1, 1,
-1.12681, 0.6933997, 0.07927437, 1, 1, 1, 1, 1,
-1.124581, 0.7208992, -0.3068423, 1, 1, 1, 1, 1,
-1.118242, -0.5435039, -1.394646, 1, 1, 1, 1, 1,
-1.117199, -1.810592, -1.572582, 1, 1, 1, 1, 1,
-1.116824, -0.9596767, -3.1845, 1, 1, 1, 1, 1,
-1.110784, 0.685542, 0.04387617, 1, 1, 1, 1, 1,
-1.106599, -0.6179983, -4.103912, 1, 1, 1, 1, 1,
-1.098261, -0.2326494, -1.744538, 1, 1, 1, 1, 1,
-1.08957, -1.267203, -3.68228, 1, 1, 1, 1, 1,
-1.083085, -0.826089, -3.543238, 1, 1, 1, 1, 1,
-1.079584, 0.4764554, -2.10777, 1, 1, 1, 1, 1,
-1.070101, 0.787468, -0.8343262, 0, 0, 1, 1, 1,
-1.052909, 0.5358774, -2.080927, 1, 0, 0, 1, 1,
-1.045303, 0.3873853, -2.985526, 1, 0, 0, 1, 1,
-1.044813, -0.7942411, -1.04372, 1, 0, 0, 1, 1,
-1.041108, -1.033551, -2.546358, 1, 0, 0, 1, 1,
-1.038208, 0.4115312, -0.1401602, 1, 0, 0, 1, 1,
-1.038154, 1.080192, 0.04577549, 0, 0, 0, 1, 1,
-1.021569, -1.116743, -2.129803, 0, 0, 0, 1, 1,
-1.021288, -1.486354, -2.348284, 0, 0, 0, 1, 1,
-1.019086, 0.4940819, -0.4597393, 0, 0, 0, 1, 1,
-1.017801, 0.2364904, -1.34971, 0, 0, 0, 1, 1,
-1.012494, -0.6792239, -1.348675, 0, 0, 0, 1, 1,
-1.007342, 0.9593275, -1.331086, 0, 0, 0, 1, 1,
-1.005946, -0.6998742, -1.05074, 1, 1, 1, 1, 1,
-1.00412, 1.378873, 0.2434081, 1, 1, 1, 1, 1,
-0.9969321, 0.8620011, -0.9395537, 1, 1, 1, 1, 1,
-0.9914706, -0.3938798, -0.09127638, 1, 1, 1, 1, 1,
-0.9909797, -0.7705989, -3.033034, 1, 1, 1, 1, 1,
-0.9830867, 1.426604, 0.02572305, 1, 1, 1, 1, 1,
-0.9829996, 0.8801724, -0.1299448, 1, 1, 1, 1, 1,
-0.9819363, -0.7278417, -0.6431962, 1, 1, 1, 1, 1,
-0.9804819, -0.617146, -0.7592068, 1, 1, 1, 1, 1,
-0.9731271, 0.1075037, -0.882507, 1, 1, 1, 1, 1,
-0.9702636, -1.365775, -1.731993, 1, 1, 1, 1, 1,
-0.9690244, -1.115573, -1.241458, 1, 1, 1, 1, 1,
-0.9676481, -0.08176857, -1.012844, 1, 1, 1, 1, 1,
-0.9639574, 0.4078006, 0.5167005, 1, 1, 1, 1, 1,
-0.9584424, 1.727151, -1.416868, 1, 1, 1, 1, 1,
-0.9557114, -0.009214664, -1.697109, 0, 0, 1, 1, 1,
-0.9513812, 0.1742304, -0.9144778, 1, 0, 0, 1, 1,
-0.9496908, 2.096117, -1.804362, 1, 0, 0, 1, 1,
-0.9473483, -1.320976, -1.85954, 1, 0, 0, 1, 1,
-0.9467391, -1.295306, -1.197141, 1, 0, 0, 1, 1,
-0.9370152, 1.266204, -0.9368443, 1, 0, 0, 1, 1,
-0.9255187, -0.926346, -3.949224, 0, 0, 0, 1, 1,
-0.9086974, -0.6529948, -2.277214, 0, 0, 0, 1, 1,
-0.9035323, 0.006990831, -3.808039, 0, 0, 0, 1, 1,
-0.9003696, -1.215692, -3.435917, 0, 0, 0, 1, 1,
-0.8983732, -2.267857, -2.324349, 0, 0, 0, 1, 1,
-0.8983634, 0.6537428, 0.6790427, 0, 0, 0, 1, 1,
-0.8976309, 0.03985658, -1.660805, 0, 0, 0, 1, 1,
-0.8895857, 0.6437594, -0.9066592, 1, 1, 1, 1, 1,
-0.8889411, 0.1313128, -0.9309483, 1, 1, 1, 1, 1,
-0.8845432, 0.2456358, -2.198457, 1, 1, 1, 1, 1,
-0.8684382, -0.8023593, -0.530628, 1, 1, 1, 1, 1,
-0.867644, -0.951334, -2.057814, 1, 1, 1, 1, 1,
-0.8609126, 0.3083971, -1.48201, 1, 1, 1, 1, 1,
-0.8564538, 0.761232, -1.97758, 1, 1, 1, 1, 1,
-0.8561569, -0.6252299, -1.000797, 1, 1, 1, 1, 1,
-0.8520666, 2.161158, 0.1323175, 1, 1, 1, 1, 1,
-0.8519307, 1.193036, 0.2581597, 1, 1, 1, 1, 1,
-0.8491888, 0.3928338, -0.07118534, 1, 1, 1, 1, 1,
-0.8438912, -0.5938578, -2.824695, 1, 1, 1, 1, 1,
-0.8408605, -0.8764476, -2.47736, 1, 1, 1, 1, 1,
-0.8388082, -0.05091041, -0.9182301, 1, 1, 1, 1, 1,
-0.8356662, -0.1622548, -0.4428184, 1, 1, 1, 1, 1,
-0.8355871, 0.413138, -1.631551, 0, 0, 1, 1, 1,
-0.8329985, 1.013753, 0.3389039, 1, 0, 0, 1, 1,
-0.8293307, -0.3052803, -1.430189, 1, 0, 0, 1, 1,
-0.8226421, 1.629059, 1.399403, 1, 0, 0, 1, 1,
-0.8222033, 1.309285, -1.539073, 1, 0, 0, 1, 1,
-0.8215087, -0.9622345, -1.844941, 1, 0, 0, 1, 1,
-0.818213, -0.6925691, -3.106411, 0, 0, 0, 1, 1,
-0.8121044, -1.107072, -3.412092, 0, 0, 0, 1, 1,
-0.807862, 0.8725859, -0.9066578, 0, 0, 0, 1, 1,
-0.8025413, 3.278998, -0.1769959, 0, 0, 0, 1, 1,
-0.801813, 1.673516, 1.060494, 0, 0, 0, 1, 1,
-0.7967003, 1.115063, -2.005206, 0, 0, 0, 1, 1,
-0.7911787, -0.6015981, -1.90241, 0, 0, 0, 1, 1,
-0.7881883, -0.2203794, -2.176722, 1, 1, 1, 1, 1,
-0.7746953, 0.1188896, -1.097937, 1, 1, 1, 1, 1,
-0.772052, -1.043195, -3.827515, 1, 1, 1, 1, 1,
-0.7698739, 1.013117, -0.9854955, 1, 1, 1, 1, 1,
-0.7674256, -0.1819591, -0.1463965, 1, 1, 1, 1, 1,
-0.7650756, 0.3710333, -1.787226, 1, 1, 1, 1, 1,
-0.7642961, 0.736997, -1.062174, 1, 1, 1, 1, 1,
-0.7630267, -0.7401488, -2.838444, 1, 1, 1, 1, 1,
-0.7617596, -0.05941458, -0.6315022, 1, 1, 1, 1, 1,
-0.7615868, -0.6706337, 0.972468, 1, 1, 1, 1, 1,
-0.7613034, -0.2417555, 0.00309599, 1, 1, 1, 1, 1,
-0.7607274, 0.6206434, -1.935275, 1, 1, 1, 1, 1,
-0.7603173, -0.5270462, -1.448184, 1, 1, 1, 1, 1,
-0.7572324, -1.92826, -2.248656, 1, 1, 1, 1, 1,
-0.7536301, 0.41408, -1.123774, 1, 1, 1, 1, 1,
-0.7515857, -1.889336, -3.484978, 0, 0, 1, 1, 1,
-0.7512332, -0.3276207, -2.456105, 1, 0, 0, 1, 1,
-0.7496163, 0.4829556, -1.324795, 1, 0, 0, 1, 1,
-0.7473426, -1.483614, -2.140875, 1, 0, 0, 1, 1,
-0.7444254, 1.40641, 0.771553, 1, 0, 0, 1, 1,
-0.739867, -1.055097, -1.398388, 1, 0, 0, 1, 1,
-0.7390003, -0.445966, -1.775118, 0, 0, 0, 1, 1,
-0.7306257, -0.09584821, 0.4442466, 0, 0, 0, 1, 1,
-0.7293552, 0.4518027, 0.1643005, 0, 0, 0, 1, 1,
-0.7279788, 0.9667733, -0.6387557, 0, 0, 0, 1, 1,
-0.7263949, -0.4250525, -2.691908, 0, 0, 0, 1, 1,
-0.7256426, 1.310452, -0.1981201, 0, 0, 0, 1, 1,
-0.7250851, -1.523674, -2.724487, 0, 0, 0, 1, 1,
-0.7214896, 0.3354641, -1.046837, 1, 1, 1, 1, 1,
-0.7191717, -1.429912, -3.425612, 1, 1, 1, 1, 1,
-0.718973, 1.123197, -0.01083492, 1, 1, 1, 1, 1,
-0.712986, 0.2167957, -1.234176, 1, 1, 1, 1, 1,
-0.7127856, 0.2102888, -1.2613, 1, 1, 1, 1, 1,
-0.7109002, -1.771528, -1.362746, 1, 1, 1, 1, 1,
-0.7098073, 2.3664, -1.512322, 1, 1, 1, 1, 1,
-0.7080986, -1.96525, -2.895654, 1, 1, 1, 1, 1,
-0.7039573, -0.4174815, -3.262703, 1, 1, 1, 1, 1,
-0.7022789, -0.9737762, -3.998219, 1, 1, 1, 1, 1,
-0.6971012, 1.948166, 1.57559, 1, 1, 1, 1, 1,
-0.6931358, 1.143912, -1.629658, 1, 1, 1, 1, 1,
-0.6913151, 1.345384, -0.5889984, 1, 1, 1, 1, 1,
-0.6736906, 0.258937, -0.4522668, 1, 1, 1, 1, 1,
-0.6731881, 0.9454942, 0.5411977, 1, 1, 1, 1, 1,
-0.6726962, -0.6638157, -1.663116, 0, 0, 1, 1, 1,
-0.6698953, 3.553679, 1.065249, 1, 0, 0, 1, 1,
-0.6698092, 1.129772, -0.09305035, 1, 0, 0, 1, 1,
-0.6635024, 1.065274, -0.8178629, 1, 0, 0, 1, 1,
-0.662932, 1.504297, 0.2980469, 1, 0, 0, 1, 1,
-0.6628842, 1.643167, -1.250736, 1, 0, 0, 1, 1,
-0.661665, -0.8689317, -1.667436, 0, 0, 0, 1, 1,
-0.6608936, -1.266256, -0.9373266, 0, 0, 0, 1, 1,
-0.6607236, -0.2419341, -3.347497, 0, 0, 0, 1, 1,
-0.658174, -1.191671, -2.217175, 0, 0, 0, 1, 1,
-0.652959, -1.910555, -2.712202, 0, 0, 0, 1, 1,
-0.6515474, -0.08338626, -1.115209, 0, 0, 0, 1, 1,
-0.6435862, -0.1971523, -0.877175, 0, 0, 0, 1, 1,
-0.639377, -0.9366642, -0.2355679, 1, 1, 1, 1, 1,
-0.6373203, 0.3180003, -1.116857, 1, 1, 1, 1, 1,
-0.6360324, 0.405707, 0.5285074, 1, 1, 1, 1, 1,
-0.635717, 1.009852, -1.070292, 1, 1, 1, 1, 1,
-0.6325145, 0.5252511, 0.5930466, 1, 1, 1, 1, 1,
-0.6316109, -0.9492751, -3.398885, 1, 1, 1, 1, 1,
-0.6308131, -0.02598679, -1.077441, 1, 1, 1, 1, 1,
-0.628455, -0.8195045, -2.601053, 1, 1, 1, 1, 1,
-0.6281134, -0.1363229, -1.451283, 1, 1, 1, 1, 1,
-0.6264314, 1.7281, 0.2593057, 1, 1, 1, 1, 1,
-0.6252828, -0.6082074, -3.00686, 1, 1, 1, 1, 1,
-0.623906, 1.245896, -1.624418, 1, 1, 1, 1, 1,
-0.6212538, 2.134145, 0.4914938, 1, 1, 1, 1, 1,
-0.6209008, 0.2068071, -2.223017, 1, 1, 1, 1, 1,
-0.6202016, -0.6338444, -1.873162, 1, 1, 1, 1, 1,
-0.6201565, 1.865996, -1.267285, 0, 0, 1, 1, 1,
-0.6172111, -3.046659, -2.293832, 1, 0, 0, 1, 1,
-0.607439, -0.4085873, -1.910681, 1, 0, 0, 1, 1,
-0.6060129, -2.114734, -1.841265, 1, 0, 0, 1, 1,
-0.6017349, -1.546921, -2.266962, 1, 0, 0, 1, 1,
-0.5986251, 0.03339371, -0.9697139, 1, 0, 0, 1, 1,
-0.5965407, 0.6727969, -0.412607, 0, 0, 0, 1, 1,
-0.5946706, -0.4488112, -2.519343, 0, 0, 0, 1, 1,
-0.5932732, 1.340562, -0.9896072, 0, 0, 0, 1, 1,
-0.5916543, -0.6933293, -2.399233, 0, 0, 0, 1, 1,
-0.5894927, -2.573933, -3.445452, 0, 0, 0, 1, 1,
-0.5847298, 0.7387682, -0.6689712, 0, 0, 0, 1, 1,
-0.5845163, 1.243267, 1.058385, 0, 0, 0, 1, 1,
-0.5835332, 0.03147756, 0.4625222, 1, 1, 1, 1, 1,
-0.5835267, -0.9471913, -3.667041, 1, 1, 1, 1, 1,
-0.5835266, 1.223763, -0.7821981, 1, 1, 1, 1, 1,
-0.5815861, 2.027347, -0.8061169, 1, 1, 1, 1, 1,
-0.5714014, -0.1180785, -0.686494, 1, 1, 1, 1, 1,
-0.571148, 0.2752962, -3.290957, 1, 1, 1, 1, 1,
-0.5699371, -0.6303359, -2.697176, 1, 1, 1, 1, 1,
-0.5665793, 1.004432, 0.03967667, 1, 1, 1, 1, 1,
-0.564566, -0.1241093, -2.119786, 1, 1, 1, 1, 1,
-0.5612744, -1.320801, -0.8890205, 1, 1, 1, 1, 1,
-0.5604905, -0.3308049, -0.4720432, 1, 1, 1, 1, 1,
-0.5593109, 0.5928882, -2.78265, 1, 1, 1, 1, 1,
-0.5585948, -0.2064482, 0.7956615, 1, 1, 1, 1, 1,
-0.555394, 1.460902, -1.374571, 1, 1, 1, 1, 1,
-0.5537814, 0.5274148, -1.582477, 1, 1, 1, 1, 1,
-0.5496486, -0.1841383, 0.07318814, 0, 0, 1, 1, 1,
-0.5481046, -0.3350918, -3.145575, 1, 0, 0, 1, 1,
-0.5455604, -0.09652387, -0.6630386, 1, 0, 0, 1, 1,
-0.5414368, 0.02498502, 0.02842516, 1, 0, 0, 1, 1,
-0.5390744, 0.5012523, 0.6344241, 1, 0, 0, 1, 1,
-0.535, -0.9972484, -1.479239, 1, 0, 0, 1, 1,
-0.530349, -1.718793, -4.092786, 0, 0, 0, 1, 1,
-0.5300343, -0.2097694, -1.051177, 0, 0, 0, 1, 1,
-0.5277185, -1.303401, -1.864765, 0, 0, 0, 1, 1,
-0.5248334, 0.6005303, -0.4551751, 0, 0, 0, 1, 1,
-0.5245979, 1.442782, -0.02941242, 0, 0, 0, 1, 1,
-0.5191426, -2.097773, -4.135417, 0, 0, 0, 1, 1,
-0.5170016, -0.4418495, -0.7725792, 0, 0, 0, 1, 1,
-0.5162634, -1.321791, -2.158787, 1, 1, 1, 1, 1,
-0.5154595, 0.8260942, -0.3580602, 1, 1, 1, 1, 1,
-0.514917, 2.449075, 0.9268662, 1, 1, 1, 1, 1,
-0.5133527, 0.06074911, -1.050731, 1, 1, 1, 1, 1,
-0.5093765, -3.083677, -4.453882, 1, 1, 1, 1, 1,
-0.508655, 1.106236, 0.7175195, 1, 1, 1, 1, 1,
-0.5084904, 0.5760695, 0.9744024, 1, 1, 1, 1, 1,
-0.5023088, 0.004153874, -0.5499177, 1, 1, 1, 1, 1,
-0.5008679, -1.586149, -3.924778, 1, 1, 1, 1, 1,
-0.5005409, 1.926061, -0.6249627, 1, 1, 1, 1, 1,
-0.4995504, 0.3486092, -1.785744, 1, 1, 1, 1, 1,
-0.4953791, 0.6379445, -1.544662, 1, 1, 1, 1, 1,
-0.4936191, -0.02422352, -1.885674, 1, 1, 1, 1, 1,
-0.4872477, -0.4049453, -2.632251, 1, 1, 1, 1, 1,
-0.4779304, 0.5518041, -0.7100453, 1, 1, 1, 1, 1,
-0.4776974, 0.4814233, -2.191106, 0, 0, 1, 1, 1,
-0.4764777, 1.156119, 0.1315035, 1, 0, 0, 1, 1,
-0.4743422, -0.4049395, -1.514581, 1, 0, 0, 1, 1,
-0.4729462, -0.4705054, -2.282127, 1, 0, 0, 1, 1,
-0.4725007, 2.01704, 0.4704847, 1, 0, 0, 1, 1,
-0.4704737, 0.6443877, -0.7719369, 1, 0, 0, 1, 1,
-0.4658811, -1.515291, -3.462547, 0, 0, 0, 1, 1,
-0.4551649, -0.560113, -2.477693, 0, 0, 0, 1, 1,
-0.4545504, -0.8718643, -1.810241, 0, 0, 0, 1, 1,
-0.4532382, -1.308235, -2.696267, 0, 0, 0, 1, 1,
-0.4492527, -0.6041725, -4.190678, 0, 0, 0, 1, 1,
-0.4414125, 0.3193042, -0.4801663, 0, 0, 0, 1, 1,
-0.4379072, -0.5450604, -3.768749, 0, 0, 0, 1, 1,
-0.4354668, 0.7579741, -0.9398296, 1, 1, 1, 1, 1,
-0.4348226, 0.06305999, -3.191222, 1, 1, 1, 1, 1,
-0.4310321, -0.03968582, -1.798967, 1, 1, 1, 1, 1,
-0.4308384, -1.395731, -2.458091, 1, 1, 1, 1, 1,
-0.4302163, 1.882147, 0.03772543, 1, 1, 1, 1, 1,
-0.4294583, -0.1501264, -2.124387, 1, 1, 1, 1, 1,
-0.4287201, -0.4745461, -5.384585, 1, 1, 1, 1, 1,
-0.4233322, 0.3425035, -0.7569339, 1, 1, 1, 1, 1,
-0.4201699, 0.3231327, -1.087238, 1, 1, 1, 1, 1,
-0.4191768, 0.1349781, -0.8059834, 1, 1, 1, 1, 1,
-0.4116554, 2.570388, 0.9343397, 1, 1, 1, 1, 1,
-0.4063279, 0.1476945, -0.2206205, 1, 1, 1, 1, 1,
-0.4048632, 0.1310259, -1.825722, 1, 1, 1, 1, 1,
-0.4033135, 0.2697701, -0.8447227, 1, 1, 1, 1, 1,
-0.4016588, 0.6214394, -0.6580597, 1, 1, 1, 1, 1,
-0.3949755, 0.8255134, -0.3853091, 0, 0, 1, 1, 1,
-0.3930977, -0.4451435, -0.5239822, 1, 0, 0, 1, 1,
-0.3884067, -0.06811576, -1.047975, 1, 0, 0, 1, 1,
-0.3881078, 0.459316, -2.146151, 1, 0, 0, 1, 1,
-0.3879611, 1.786966, 1.616011, 1, 0, 0, 1, 1,
-0.3860076, -1.393338, -4.449097, 1, 0, 0, 1, 1,
-0.3822011, 0.03985631, -0.689086, 0, 0, 0, 1, 1,
-0.3796277, -0.0613663, -0.6253073, 0, 0, 0, 1, 1,
-0.3787815, 0.068805, -0.6584902, 0, 0, 0, 1, 1,
-0.3785172, -0.575846, -1.413975, 0, 0, 0, 1, 1,
-0.3764856, 0.1840921, 0.3928804, 0, 0, 0, 1, 1,
-0.3760629, 1.064481, 0.5438101, 0, 0, 0, 1, 1,
-0.3675597, 1.285452, -0.4768757, 0, 0, 0, 1, 1,
-0.3670338, -1.947026, -4.119949, 1, 1, 1, 1, 1,
-0.3660148, -0.2117467, -2.726334, 1, 1, 1, 1, 1,
-0.361229, 0.8504564, -0.02140418, 1, 1, 1, 1, 1,
-0.3573625, 1.712942, -0.7251927, 1, 1, 1, 1, 1,
-0.3538472, 0.8971376, -1.614605, 1, 1, 1, 1, 1,
-0.3505431, -0.5732638, -3.471591, 1, 1, 1, 1, 1,
-0.3498911, -1.34501, -0.9370105, 1, 1, 1, 1, 1,
-0.3490467, 0.1641934, -1.007505, 1, 1, 1, 1, 1,
-0.3419621, -1.137305, -0.9508994, 1, 1, 1, 1, 1,
-0.3350145, -0.4412644, -0.9293742, 1, 1, 1, 1, 1,
-0.3327331, -0.953617, -4.481602, 1, 1, 1, 1, 1,
-0.3310273, -0.9924405, -2.869895, 1, 1, 1, 1, 1,
-0.329657, 0.2067386, -0.6677524, 1, 1, 1, 1, 1,
-0.3296202, -1.234563, -2.318348, 1, 1, 1, 1, 1,
-0.3283065, 0.2704268, -1.331754, 1, 1, 1, 1, 1,
-0.3129887, -0.9998115, -3.343645, 0, 0, 1, 1, 1,
-0.3121005, -0.3647512, -2.904721, 1, 0, 0, 1, 1,
-0.3096334, -0.5217978, -4.373045, 1, 0, 0, 1, 1,
-0.3095181, 0.8938535, -0.7720063, 1, 0, 0, 1, 1,
-0.3078225, -1.206419, -2.095633, 1, 0, 0, 1, 1,
-0.3072877, 1.279239, 0.8065421, 1, 0, 0, 1, 1,
-0.3071626, 1.882071, -0.7578765, 0, 0, 0, 1, 1,
-0.2998641, 0.006963225, -1.280598, 0, 0, 0, 1, 1,
-0.2979693, -0.3957608, -1.295394, 0, 0, 0, 1, 1,
-0.2958941, 0.04814822, -1.896803, 0, 0, 0, 1, 1,
-0.2907022, 0.9760485, -0.5789032, 0, 0, 0, 1, 1,
-0.2897543, 1.192827, 0.4379119, 0, 0, 0, 1, 1,
-0.2865072, -0.3181423, -2.014624, 0, 0, 0, 1, 1,
-0.2861173, 0.08822567, -2.373518, 1, 1, 1, 1, 1,
-0.2850978, 1.218766, 0.2113855, 1, 1, 1, 1, 1,
-0.2820424, -0.2032347, -3.137999, 1, 1, 1, 1, 1,
-0.281281, -0.3067926, -1.357202, 1, 1, 1, 1, 1,
-0.2793235, -0.2484897, -0.9529961, 1, 1, 1, 1, 1,
-0.2758825, 0.786728, -0.9566944, 1, 1, 1, 1, 1,
-0.2740461, 1.092569, -1.042747, 1, 1, 1, 1, 1,
-0.2711561, 1.017358, -1.859022, 1, 1, 1, 1, 1,
-0.2682097, 0.004779357, -1.792155, 1, 1, 1, 1, 1,
-0.266433, 0.1820627, -1.372562, 1, 1, 1, 1, 1,
-0.2651466, -0.846054, -2.626534, 1, 1, 1, 1, 1,
-0.2571295, -1.287623, -2.11138, 1, 1, 1, 1, 1,
-0.2531034, -0.4479388, -3.527244, 1, 1, 1, 1, 1,
-0.2523955, 0.4132263, 0.056451, 1, 1, 1, 1, 1,
-0.2463549, 0.7263866, 0.08744676, 1, 1, 1, 1, 1,
-0.2461173, 0.882499, 0.7215388, 0, 0, 1, 1, 1,
-0.2395831, 0.5413017, -1.220926, 1, 0, 0, 1, 1,
-0.2392904, 0.9841954, -0.5571952, 1, 0, 0, 1, 1,
-0.2357663, 0.914396, 0.8918083, 1, 0, 0, 1, 1,
-0.2347909, 0.3910691, -0.4635347, 1, 0, 0, 1, 1,
-0.2336842, 0.2140592, -2.415953, 1, 0, 0, 1, 1,
-0.2327011, 1.137888, -0.8449427, 0, 0, 0, 1, 1,
-0.232485, -0.8694062, -2.640878, 0, 0, 0, 1, 1,
-0.231846, 1.619876, -1.363829, 0, 0, 0, 1, 1,
-0.2301702, 0.1853231, -0.03837243, 0, 0, 0, 1, 1,
-0.2276301, -1.318824, -3.247542, 0, 0, 0, 1, 1,
-0.2246284, -0.8919923, -0.9900235, 0, 0, 0, 1, 1,
-0.2158424, -0.1663615, -1.59038, 0, 0, 0, 1, 1,
-0.2115325, -0.7537532, -4.317233, 1, 1, 1, 1, 1,
-0.2087393, -0.6068147, -2.663546, 1, 1, 1, 1, 1,
-0.2086816, 0.3208723, -0.3357204, 1, 1, 1, 1, 1,
-0.2036518, 0.9195544, -0.8981755, 1, 1, 1, 1, 1,
-0.2034108, -0.05035418, -2.921751, 1, 1, 1, 1, 1,
-0.2000368, 2.180497, -0.4076589, 1, 1, 1, 1, 1,
-0.1969372, 1.163729, -1.198292, 1, 1, 1, 1, 1,
-0.191946, 0.5541993, 1.143333, 1, 1, 1, 1, 1,
-0.1816192, 0.2705578, -0.2403924, 1, 1, 1, 1, 1,
-0.1814526, 1.004604, -0.02385409, 1, 1, 1, 1, 1,
-0.1807116, -1.334533, -1.924565, 1, 1, 1, 1, 1,
-0.1802482, -0.6977953, -3.772767, 1, 1, 1, 1, 1,
-0.1792592, -1.066519, -2.198313, 1, 1, 1, 1, 1,
-0.1786246, 2.694019, -0.8108817, 1, 1, 1, 1, 1,
-0.1752523, -0.6036164, -3.459898, 1, 1, 1, 1, 1,
-0.1745158, 0.3698484, -1.976601, 0, 0, 1, 1, 1,
-0.1669433, -0.2723089, -4.041525, 1, 0, 0, 1, 1,
-0.1642097, 0.9243087, -0.5056234, 1, 0, 0, 1, 1,
-0.1554909, -0.7111403, -3.58118, 1, 0, 0, 1, 1,
-0.153814, -0.3652887, -2.756362, 1, 0, 0, 1, 1,
-0.1529378, 1.644223, 1.155641, 1, 0, 0, 1, 1,
-0.1514613, 0.4155486, 0.2936504, 0, 0, 0, 1, 1,
-0.1499311, -0.2584036, -0.8540754, 0, 0, 0, 1, 1,
-0.1439224, -0.4004016, -3.427007, 0, 0, 0, 1, 1,
-0.1396396, 0.6847001, 0.6100925, 0, 0, 0, 1, 1,
-0.1393058, 1.918476, -0.00231178, 0, 0, 0, 1, 1,
-0.1323796, -0.6431156, -3.542537, 0, 0, 0, 1, 1,
-0.1292715, -1.158494, -3.518279, 0, 0, 0, 1, 1,
-0.1284091, -0.6749647, -0.3248704, 1, 1, 1, 1, 1,
-0.1255831, 0.5629711, -1.584422, 1, 1, 1, 1, 1,
-0.1230095, -0.4941756, -2.659626, 1, 1, 1, 1, 1,
-0.1221309, 0.3545085, 0.2125658, 1, 1, 1, 1, 1,
-0.1197867, -1.238776, -4.530815, 1, 1, 1, 1, 1,
-0.1196882, 0.9179822, 1.005701, 1, 1, 1, 1, 1,
-0.1180024, -0.4535347, -3.015272, 1, 1, 1, 1, 1,
-0.1173774, 0.2967328, -2.081867, 1, 1, 1, 1, 1,
-0.1154882, 1.380689, 0.6941441, 1, 1, 1, 1, 1,
-0.1056919, -1.545425, -3.58699, 1, 1, 1, 1, 1,
-0.1037984, -0.7697459, -5.347034, 1, 1, 1, 1, 1,
-0.1025826, 0.7309565, 0.04170695, 1, 1, 1, 1, 1,
-0.1023054, -1.336391, -3.043053, 1, 1, 1, 1, 1,
-0.1008525, 0.8518878, -1.262725, 1, 1, 1, 1, 1,
-0.1003004, 0.07409175, -1.130591, 1, 1, 1, 1, 1,
-0.09851853, -0.2252094, -3.574559, 0, 0, 1, 1, 1,
-0.09690938, 0.4724837, -1.456731, 1, 0, 0, 1, 1,
-0.09512843, -2.047346, -3.088147, 1, 0, 0, 1, 1,
-0.09474028, -2.543007, -3.318512, 1, 0, 0, 1, 1,
-0.09331418, -0.8993801, -3.127718, 1, 0, 0, 1, 1,
-0.09279981, 0.03852826, -2.851557, 1, 0, 0, 1, 1,
-0.09276554, -0.6503201, -2.388199, 0, 0, 0, 1, 1,
-0.09044755, -1.536012, -4.161335, 0, 0, 0, 1, 1,
-0.08965448, -0.4091333, -2.812278, 0, 0, 0, 1, 1,
-0.08838669, -0.4032842, -2.423377, 0, 0, 0, 1, 1,
-0.08723796, 0.02235784, -2.661678, 0, 0, 0, 1, 1,
-0.08443233, 0.8465554, -0.02079375, 0, 0, 0, 1, 1,
-0.08317947, -0.3397394, -3.246304, 0, 0, 0, 1, 1,
-0.08135435, -2.554038, -3.198946, 1, 1, 1, 1, 1,
-0.08075999, 0.4421191, -0.3822544, 1, 1, 1, 1, 1,
-0.08014797, -0.03804423, -3.514483, 1, 1, 1, 1, 1,
-0.07894634, -0.5220299, -3.626306, 1, 1, 1, 1, 1,
-0.07416565, 0.09127927, -0.731052, 1, 1, 1, 1, 1,
-0.07314156, -0.9161616, -4.317639, 1, 1, 1, 1, 1,
-0.07228526, -2.138626, -3.724706, 1, 1, 1, 1, 1,
-0.07005161, 0.1769271, 0.6054682, 1, 1, 1, 1, 1,
-0.06671396, 2.00212, -1.16383, 1, 1, 1, 1, 1,
-0.06121078, 1.102242, 0.03525622, 1, 1, 1, 1, 1,
-0.05474257, 0.6557373, 0.0115832, 1, 1, 1, 1, 1,
-0.04460983, 0.7126541, 2.021505, 1, 1, 1, 1, 1,
-0.04194907, 0.4537138, 0.04971199, 1, 1, 1, 1, 1,
-0.03822492, -0.8304883, -2.841424, 1, 1, 1, 1, 1,
-0.03681009, -1.285891, -3.330345, 1, 1, 1, 1, 1,
-0.03637451, 0.4799137, 0.8346003, 0, 0, 1, 1, 1,
-0.03419171, 0.002315134, 0.2990871, 1, 0, 0, 1, 1,
-0.03198218, -0.2172718, -2.93046, 1, 0, 0, 1, 1,
-0.03194961, -1.092025, -5.03718, 1, 0, 0, 1, 1,
-0.03185856, -0.1675199, -2.47425, 1, 0, 0, 1, 1,
-0.02473879, -1.674403, -3.395508, 1, 0, 0, 1, 1,
-0.02400945, 0.4792881, 0.1306024, 0, 0, 0, 1, 1,
-0.01920487, 0.5265248, -0.8089538, 0, 0, 0, 1, 1,
-0.01529916, 0.1784119, -3.176728, 0, 0, 0, 1, 1,
-0.01088478, 0.5763299, -0.4445421, 0, 0, 0, 1, 1,
-0.009348743, 1.363937, -0.4868045, 0, 0, 0, 1, 1,
-0.005946403, 0.4191011, -0.7748097, 0, 0, 0, 1, 1,
-0.0046554, 0.09946696, 1.788823, 0, 0, 0, 1, 1,
-0.003138734, 0.2420248, -1.204773, 1, 1, 1, 1, 1,
-0.00103582, -1.923239, -4.510997, 1, 1, 1, 1, 1,
0.001723884, 2.305241, 0.7694964, 1, 1, 1, 1, 1,
0.004296911, -2.15937, 3.580046, 1, 1, 1, 1, 1,
0.005426022, 0.5984276, -0.5741365, 1, 1, 1, 1, 1,
0.008311778, 0.3965284, 0.4677274, 1, 1, 1, 1, 1,
0.009744342, 0.4149657, -0.7139977, 1, 1, 1, 1, 1,
0.01665833, -0.9955165, 3.977948, 1, 1, 1, 1, 1,
0.0179206, -1.19275, 2.859753, 1, 1, 1, 1, 1,
0.01880546, 0.2092279, -0.7152995, 1, 1, 1, 1, 1,
0.0220174, 0.1037664, 1.702944, 1, 1, 1, 1, 1,
0.02283027, 0.2365644, -0.841199, 1, 1, 1, 1, 1,
0.02579645, -0.3013788, 2.430445, 1, 1, 1, 1, 1,
0.0259077, -0.1937636, 3.516007, 1, 1, 1, 1, 1,
0.02949628, 1.769054, -0.9366964, 1, 1, 1, 1, 1,
0.03115773, 0.7821347, -0.6700887, 0, 0, 1, 1, 1,
0.03382803, -0.9909145, 3.788483, 1, 0, 0, 1, 1,
0.03495777, -0.4605438, 3.89012, 1, 0, 0, 1, 1,
0.0373392, -1.464791, 2.266927, 1, 0, 0, 1, 1,
0.0374346, -0.09270953, 2.450992, 1, 0, 0, 1, 1,
0.03993144, -0.4300174, 4.999624, 1, 0, 0, 1, 1,
0.04032884, -1.041023, 4.630833, 0, 0, 0, 1, 1,
0.04385003, 0.5285259, 0.8505362, 0, 0, 0, 1, 1,
0.04525943, -1.520061, 2.447751, 0, 0, 0, 1, 1,
0.04907964, 0.5796733, 0.8777692, 0, 0, 0, 1, 1,
0.04936126, 0.195182, 0.5765333, 0, 0, 0, 1, 1,
0.05173637, -0.2557389, 3.593995, 0, 0, 0, 1, 1,
0.05254745, -0.07737917, 3.622637, 0, 0, 0, 1, 1,
0.05271948, 1.053131, 0.08313689, 1, 1, 1, 1, 1,
0.05511608, 0.7051319, -0.5226156, 1, 1, 1, 1, 1,
0.05912871, -0.01974185, 1.92021, 1, 1, 1, 1, 1,
0.06033015, -2.003118, 4.361391, 1, 1, 1, 1, 1,
0.06368297, 0.2710665, 2.531058, 1, 1, 1, 1, 1,
0.06436814, -1.097589, 3.363876, 1, 1, 1, 1, 1,
0.06495921, -0.920979, 2.972509, 1, 1, 1, 1, 1,
0.06973978, 0.8581607, -1.255709, 1, 1, 1, 1, 1,
0.06997527, -1.395056, 4.751325, 1, 1, 1, 1, 1,
0.08529843, -0.2446813, 3.733222, 1, 1, 1, 1, 1,
0.08817704, 0.2703992, 0.9131398, 1, 1, 1, 1, 1,
0.08845793, -1.98504, 1.410177, 1, 1, 1, 1, 1,
0.08858953, -2.024661, 2.795887, 1, 1, 1, 1, 1,
0.0919656, 0.9127603, 1.308655, 1, 1, 1, 1, 1,
0.09201002, -1.035014, 2.587361, 1, 1, 1, 1, 1,
0.09208692, -0.7134671, 3.387978, 0, 0, 1, 1, 1,
0.09290744, 0.5812953, 0.9966031, 1, 0, 0, 1, 1,
0.09832542, 0.5525581, 0.3402051, 1, 0, 0, 1, 1,
0.1014757, -0.3763618, 3.250718, 1, 0, 0, 1, 1,
0.1024819, -0.892195, 2.614028, 1, 0, 0, 1, 1,
0.1027989, -1.224398, 3.827193, 1, 0, 0, 1, 1,
0.1034753, -1.326026, 2.566424, 0, 0, 0, 1, 1,
0.1058242, -0.4808039, 2.823597, 0, 0, 0, 1, 1,
0.1062055, 0.03619242, -1.134385, 0, 0, 0, 1, 1,
0.1066498, -1.619926, 1.628239, 0, 0, 0, 1, 1,
0.1118635, 0.7163028, 0.4724668, 0, 0, 0, 1, 1,
0.1123081, -0.1911464, 3.258048, 0, 0, 0, 1, 1,
0.1130232, -0.2672313, 3.76791, 0, 0, 0, 1, 1,
0.1140945, 0.1214433, 1.730846, 1, 1, 1, 1, 1,
0.1272453, -0.6654881, 4.79275, 1, 1, 1, 1, 1,
0.1312676, 0.7101562, -0.9161209, 1, 1, 1, 1, 1,
0.1314124, -0.1049174, 4.117902, 1, 1, 1, 1, 1,
0.1325752, -1.582586, 2.073557, 1, 1, 1, 1, 1,
0.1329176, -1.995063, 3.356637, 1, 1, 1, 1, 1,
0.138421, -0.1281658, 2.542619, 1, 1, 1, 1, 1,
0.139607, -1.346269, 2.022781, 1, 1, 1, 1, 1,
0.1494716, -1.095101, 2.412851, 1, 1, 1, 1, 1,
0.150903, 0.4884045, 1.586265, 1, 1, 1, 1, 1,
0.1515265, -0.4965205, 3.800002, 1, 1, 1, 1, 1,
0.151719, -0.637913, 2.017981, 1, 1, 1, 1, 1,
0.1565865, 0.7830042, 2.059333, 1, 1, 1, 1, 1,
0.1566925, 0.4536619, -1.058697, 1, 1, 1, 1, 1,
0.157302, 1.050687, 0.2877513, 1, 1, 1, 1, 1,
0.1652889, -0.6723086, 3.306156, 0, 0, 1, 1, 1,
0.1756068, -0.5675268, 0.6618071, 1, 0, 0, 1, 1,
0.1761547, 1.287611, 0.7326651, 1, 0, 0, 1, 1,
0.1791428, -0.1793916, 0.7439213, 1, 0, 0, 1, 1,
0.1801692, 0.1263888, -0.2225087, 1, 0, 0, 1, 1,
0.1831682, -1.243321, 4.248783, 1, 0, 0, 1, 1,
0.1862177, -0.4911367, 2.806368, 0, 0, 0, 1, 1,
0.1872435, 1.039121, 0.9303492, 0, 0, 0, 1, 1,
0.1882414, -0.9321165, 3.62929, 0, 0, 0, 1, 1,
0.1941642, -1.783531, 3.958791, 0, 0, 0, 1, 1,
0.1985767, -1.869684, 4.2257, 0, 0, 0, 1, 1,
0.2006151, -1.137898, 3.643795, 0, 0, 0, 1, 1,
0.2008808, 0.7305267, 2.605448, 0, 0, 0, 1, 1,
0.2009036, 0.4208138, -0.7742503, 1, 1, 1, 1, 1,
0.2045203, 1.538003, 0.7342434, 1, 1, 1, 1, 1,
0.2074014, 0.6101694, 0.4903556, 1, 1, 1, 1, 1,
0.211076, -1.059339, 2.247189, 1, 1, 1, 1, 1,
0.2201398, 0.598602, 0.1810426, 1, 1, 1, 1, 1,
0.2286919, -0.1658302, 0.3060458, 1, 1, 1, 1, 1,
0.2304747, -2.187662, 1.698857, 1, 1, 1, 1, 1,
0.2354385, 0.3341931, -0.2144015, 1, 1, 1, 1, 1,
0.235498, -0.6609624, 5.414094, 1, 1, 1, 1, 1,
0.2421866, -0.4918761, 2.524399, 1, 1, 1, 1, 1,
0.257633, -1.377419, 3.049086, 1, 1, 1, 1, 1,
0.2601966, -1.120462, 4.363287, 1, 1, 1, 1, 1,
0.2639393, -0.985567, 3.823293, 1, 1, 1, 1, 1,
0.269842, 0.5606745, 1.553405, 1, 1, 1, 1, 1,
0.2726439, -0.1302865, 1.044284, 1, 1, 1, 1, 1,
0.2753719, -2.031873, 3.14561, 0, 0, 1, 1, 1,
0.2820249, -0.5238414, 4.899648, 1, 0, 0, 1, 1,
0.2884529, -0.280113, 1.749419, 1, 0, 0, 1, 1,
0.288489, 0.6445912, 0.8359315, 1, 0, 0, 1, 1,
0.2885778, 1.805658, -0.8158063, 1, 0, 0, 1, 1,
0.2907498, 0.9822678, 0.3534023, 1, 0, 0, 1, 1,
0.2926632, 0.5902227, -1.234343, 0, 0, 0, 1, 1,
0.2975064, -1.743693, 2.420244, 0, 0, 0, 1, 1,
0.3033235, 0.2077011, 1.647234, 0, 0, 0, 1, 1,
0.308412, 1.859353, -0.8748498, 0, 0, 0, 1, 1,
0.3099205, 0.9395623, -0.4923663, 0, 0, 0, 1, 1,
0.3124983, 0.01322051, 1.120202, 0, 0, 0, 1, 1,
0.3130403, 0.1224417, 2.701233, 0, 0, 0, 1, 1,
0.3178421, 0.3525164, 0.1440685, 1, 1, 1, 1, 1,
0.3187373, 0.6286603, 1.569365, 1, 1, 1, 1, 1,
0.3189787, -1.099697, 1.632373, 1, 1, 1, 1, 1,
0.3190037, -0.3094243, 4.474221, 1, 1, 1, 1, 1,
0.3229321, 0.8107904, 0.4619219, 1, 1, 1, 1, 1,
0.3231937, 1.911103, -0.1820359, 1, 1, 1, 1, 1,
0.3246054, 1.305768, 1.64509, 1, 1, 1, 1, 1,
0.3266466, 1.354859, -0.3424769, 1, 1, 1, 1, 1,
0.3301562, -1.487619, 2.577743, 1, 1, 1, 1, 1,
0.3341179, -1.521944, 3.077502, 1, 1, 1, 1, 1,
0.3367895, -1.01316, 3.654914, 1, 1, 1, 1, 1,
0.3393564, 1.091295, -0.3606173, 1, 1, 1, 1, 1,
0.3407457, 0.1572605, -0.1607738, 1, 1, 1, 1, 1,
0.3423658, 0.1781646, 1.612154, 1, 1, 1, 1, 1,
0.345952, -0.3040264, 3.868622, 1, 1, 1, 1, 1,
0.3475995, -0.3176037, 0.7217857, 0, 0, 1, 1, 1,
0.3495409, 0.2285065, 3.377293, 1, 0, 0, 1, 1,
0.3516727, -0.959018, 2.76845, 1, 0, 0, 1, 1,
0.3517421, -0.5082068, 3.919231, 1, 0, 0, 1, 1,
0.3522729, 0.6704854, -0.5940332, 1, 0, 0, 1, 1,
0.3545295, -0.5717224, 2.429351, 1, 0, 0, 1, 1,
0.357845, 0.5910583, -1.381533, 0, 0, 0, 1, 1,
0.3581523, -1.333481, 2.318098, 0, 0, 0, 1, 1,
0.3604221, -0.1185046, 2.258646, 0, 0, 0, 1, 1,
0.3648663, -0.5170786, 4.024904, 0, 0, 0, 1, 1,
0.3715014, 1.209008, 0.4840167, 0, 0, 0, 1, 1,
0.3723934, 0.9850495, -1.909794, 0, 0, 0, 1, 1,
0.3739606, 0.1167198, 1.536545, 0, 0, 0, 1, 1,
0.3746724, -0.382047, 2.24749, 1, 1, 1, 1, 1,
0.3770348, 0.1848637, 1.79399, 1, 1, 1, 1, 1,
0.3775656, 0.1629289, 1.740958, 1, 1, 1, 1, 1,
0.3810335, -1.699311, 2.951125, 1, 1, 1, 1, 1,
0.3917382, 0.09018611, 1.391095, 1, 1, 1, 1, 1,
0.394455, -0.1028664, 1.58091, 1, 1, 1, 1, 1,
0.4018451, 1.161728, -0.4471601, 1, 1, 1, 1, 1,
0.4020236, -0.9937208, 3.582892, 1, 1, 1, 1, 1,
0.4034299, -0.7507458, 3.099658, 1, 1, 1, 1, 1,
0.4059853, 0.4771205, 0.9598656, 1, 1, 1, 1, 1,
0.408053, 0.8483459, 1.448506, 1, 1, 1, 1, 1,
0.4114821, -0.09242399, 0.8385891, 1, 1, 1, 1, 1,
0.4116088, 1.136899, 0.01392703, 1, 1, 1, 1, 1,
0.411829, -0.2687377, 1.476832, 1, 1, 1, 1, 1,
0.4174343, -0.4428541, 1.889219, 1, 1, 1, 1, 1,
0.4215222, -0.9619448, 2.27105, 0, 0, 1, 1, 1,
0.423901, -0.1971416, 2.49561, 1, 0, 0, 1, 1,
0.427454, 1.768307, 1.172319, 1, 0, 0, 1, 1,
0.4363589, -0.6050807, 2.636503, 1, 0, 0, 1, 1,
0.436926, 1.113369, -0.4568736, 1, 0, 0, 1, 1,
0.4371419, -1.023067, 3.393923, 1, 0, 0, 1, 1,
0.4385447, -0.4631464, 3.016724, 0, 0, 0, 1, 1,
0.4412452, -0.5541131, 2.548604, 0, 0, 0, 1, 1,
0.4434162, 0.3599759, -0.3296473, 0, 0, 0, 1, 1,
0.4448661, -0.09897745, 0.1868304, 0, 0, 0, 1, 1,
0.446215, -0.278062, 0.7148737, 0, 0, 0, 1, 1,
0.4540751, -0.5872531, 0.9911986, 0, 0, 0, 1, 1,
0.4541857, -1.132764, 2.943831, 0, 0, 0, 1, 1,
0.4577485, -1.104553, 3.295997, 1, 1, 1, 1, 1,
0.4579982, 0.662861, 1.420512, 1, 1, 1, 1, 1,
0.4608218, 0.3426893, -0.7801328, 1, 1, 1, 1, 1,
0.4621005, -0.370777, 2.972334, 1, 1, 1, 1, 1,
0.4621586, -1.25689, 2.792206, 1, 1, 1, 1, 1,
0.4672907, 0.2026124, 0.5429446, 1, 1, 1, 1, 1,
0.4759206, 1.026065, 0.1835772, 1, 1, 1, 1, 1,
0.4774023, 0.8686696, -1.650403, 1, 1, 1, 1, 1,
0.4843854, 0.315467, 0.3773659, 1, 1, 1, 1, 1,
0.4847958, 0.7715584, -0.9264508, 1, 1, 1, 1, 1,
0.4887312, 2.025777, 1.247273, 1, 1, 1, 1, 1,
0.4991119, 0.08369792, 2.038742, 1, 1, 1, 1, 1,
0.5013868, -0.8610258, 4.05683, 1, 1, 1, 1, 1,
0.5018645, 0.5429577, 1.822572, 1, 1, 1, 1, 1,
0.502125, -0.3229081, 2.916019, 1, 1, 1, 1, 1,
0.5062688, 1.694729, 0.2063087, 0, 0, 1, 1, 1,
0.5072849, -1.171382, 3.250479, 1, 0, 0, 1, 1,
0.5126592, 0.3451037, 0.7971058, 1, 0, 0, 1, 1,
0.5137398, -0.9695772, 3.389685, 1, 0, 0, 1, 1,
0.5148251, 2.012153, 1.00383, 1, 0, 0, 1, 1,
0.5210299, -0.2016019, 2.29064, 1, 0, 0, 1, 1,
0.532765, -2.439101, 4.737652, 0, 0, 0, 1, 1,
0.5357206, -0.2432476, 3.338082, 0, 0, 0, 1, 1,
0.5406247, 1.066047, -0.5287672, 0, 0, 0, 1, 1,
0.546942, -1.222928, 2.120439, 0, 0, 0, 1, 1,
0.5504912, -0.03775908, 1.295655, 0, 0, 0, 1, 1,
0.5558932, 0.462753, -0.4379868, 0, 0, 0, 1, 1,
0.5567217, -0.4561377, 3.701057, 0, 0, 0, 1, 1,
0.5568092, -0.6835388, 1.898517, 1, 1, 1, 1, 1,
0.557606, -0.4933599, 3.063357, 1, 1, 1, 1, 1,
0.5601051, -0.3925093, 2.648546, 1, 1, 1, 1, 1,
0.5695246, -2.093629, 3.50967, 1, 1, 1, 1, 1,
0.5712357, -0.4644862, 2.99448, 1, 1, 1, 1, 1,
0.575586, -1.719088, 3.11294, 1, 1, 1, 1, 1,
0.5763378, 0.8306341, 0.2831223, 1, 1, 1, 1, 1,
0.5832755, 1.141259, 1.556217, 1, 1, 1, 1, 1,
0.5838953, 0.4773129, 1.128612, 1, 1, 1, 1, 1,
0.5853201, -1.18974, 1.011394, 1, 1, 1, 1, 1,
0.5871319, -0.6978868, 1.340874, 1, 1, 1, 1, 1,
0.5947757, 0.3729761, 0.5446705, 1, 1, 1, 1, 1,
0.5959874, 0.9094306, 0.8940898, 1, 1, 1, 1, 1,
0.6000845, -2.788366, 4.568743, 1, 1, 1, 1, 1,
0.6001036, -0.4732167, 1.880367, 1, 1, 1, 1, 1,
0.6065146, -0.08318967, 2.428386, 0, 0, 1, 1, 1,
0.6073967, -1.740964, 4.213967, 1, 0, 0, 1, 1,
0.6090253, -1.272045, 3.995134, 1, 0, 0, 1, 1,
0.6095175, 0.2232592, 1.787382, 1, 0, 0, 1, 1,
0.6120476, 0.6230447, -0.5888604, 1, 0, 0, 1, 1,
0.6208902, -0.009136159, 4.577538, 1, 0, 0, 1, 1,
0.6250387, -1.603961, 3.086999, 0, 0, 0, 1, 1,
0.6251122, -0.7148365, 3.129552, 0, 0, 0, 1, 1,
0.6260017, 0.225178, 2.338722, 0, 0, 0, 1, 1,
0.6325247, 0.3939151, 0.9100469, 0, 0, 0, 1, 1,
0.6369812, 0.8724226, 1.448229, 0, 0, 0, 1, 1,
0.6512945, 1.957879, 0.6291478, 0, 0, 0, 1, 1,
0.6513809, -0.1844182, 1.251419, 0, 0, 0, 1, 1,
0.6572113, 0.8499817, 1.060566, 1, 1, 1, 1, 1,
0.6645213, -0.1210356, 2.643069, 1, 1, 1, 1, 1,
0.6734253, -1.172955, 3.401326, 1, 1, 1, 1, 1,
0.6769365, 0.4260819, 2.393068, 1, 1, 1, 1, 1,
0.679499, 1.47507, 1.426155, 1, 1, 1, 1, 1,
0.6815556, -0.2209101, 1.481936, 1, 1, 1, 1, 1,
0.6860129, 0.1346437, 2.049327, 1, 1, 1, 1, 1,
0.6880102, -1.206216, 1.914964, 1, 1, 1, 1, 1,
0.6904466, 1.004247, 0.437725, 1, 1, 1, 1, 1,
0.6912934, -0.9315078, 1.262227, 1, 1, 1, 1, 1,
0.6916848, 0.2157704, 0.8253376, 1, 1, 1, 1, 1,
0.6949251, 0.9648291, 0.9291855, 1, 1, 1, 1, 1,
0.6953248, 1.157061, -0.5391983, 1, 1, 1, 1, 1,
0.6993228, 0.2443445, 1.411436, 1, 1, 1, 1, 1,
0.7048278, -0.2062654, -0.09670461, 1, 1, 1, 1, 1,
0.714587, 1.091463, 0.9081815, 0, 0, 1, 1, 1,
0.7161594, 0.6299184, 0.9584065, 1, 0, 0, 1, 1,
0.7187147, -1.085344, 4.609814, 1, 0, 0, 1, 1,
0.7190514, -1.055215, 2.60336, 1, 0, 0, 1, 1,
0.7193116, 0.716579, -0.08161975, 1, 0, 0, 1, 1,
0.7195115, -1.20992, 1.302287, 1, 0, 0, 1, 1,
0.7223784, 0.3075899, 1.412241, 0, 0, 0, 1, 1,
0.7229748, 0.2874674, 0.1412567, 0, 0, 0, 1, 1,
0.7259873, 0.9716407, 1.500264, 0, 0, 0, 1, 1,
0.7281439, -0.2501409, 0.9852799, 0, 0, 0, 1, 1,
0.7359464, -0.09786926, 2.865315, 0, 0, 0, 1, 1,
0.7387007, 0.4179885, 0.7737113, 0, 0, 0, 1, 1,
0.7393927, -1.472862, 2.925153, 0, 0, 0, 1, 1,
0.739857, -1.204732, 1.962957, 1, 1, 1, 1, 1,
0.7405928, 0.9952259, 2.979125, 1, 1, 1, 1, 1,
0.7449784, 0.3156546, 1.781978, 1, 1, 1, 1, 1,
0.7571869, 1.141384, -1.773289, 1, 1, 1, 1, 1,
0.7625086, 0.5498737, 0.1674361, 1, 1, 1, 1, 1,
0.7643812, -1.065257, 3.474026, 1, 1, 1, 1, 1,
0.7747483, 1.309428, -0.5374056, 1, 1, 1, 1, 1,
0.7777368, -0.5162057, 1.47966, 1, 1, 1, 1, 1,
0.7860789, -1.724334, 4.195682, 1, 1, 1, 1, 1,
0.7880895, -0.4124921, 1.903283, 1, 1, 1, 1, 1,
0.7896768, 0.6465873, 0.8196902, 1, 1, 1, 1, 1,
0.7908093, -2.003573, 2.990881, 1, 1, 1, 1, 1,
0.7987971, -0.2948583, 1.950313, 1, 1, 1, 1, 1,
0.8042922, 0.3337161, 1.226762, 1, 1, 1, 1, 1,
0.8046695, 1.595157, -1.427701, 1, 1, 1, 1, 1,
0.8051145, 0.7970755, -1.853338, 0, 0, 1, 1, 1,
0.8082274, 2.005586, -0.5715263, 1, 0, 0, 1, 1,
0.8131877, -0.9405997, 2.352784, 1, 0, 0, 1, 1,
0.8169797, 0.9995072, 0.7130297, 1, 0, 0, 1, 1,
0.817324, 0.5491265, 0.3280322, 1, 0, 0, 1, 1,
0.8173305, -0.2362734, 1.067192, 1, 0, 0, 1, 1,
0.8184124, 0.5137111, 1.446063, 0, 0, 0, 1, 1,
0.8206732, 0.1610707, 1.981684, 0, 0, 0, 1, 1,
0.8236629, 2.109146, -1.66645, 0, 0, 0, 1, 1,
0.8272151, -0.1906937, 3.259615, 0, 0, 0, 1, 1,
0.8275361, -0.162991, 1.512429, 0, 0, 0, 1, 1,
0.8284037, 1.07126, 2.081653, 0, 0, 0, 1, 1,
0.8348137, 1.860838, 1.236909, 0, 0, 0, 1, 1,
0.8351563, -0.2810635, 1.018886, 1, 1, 1, 1, 1,
0.8397449, 0.4350563, 1.697517, 1, 1, 1, 1, 1,
0.845344, 0.2504497, 0.5022074, 1, 1, 1, 1, 1,
0.8453703, -0.887139, 3.381924, 1, 1, 1, 1, 1,
0.8484136, 0.9717362, 0.7256039, 1, 1, 1, 1, 1,
0.8560867, -0.1509913, 1.443057, 1, 1, 1, 1, 1,
0.8576325, -0.7558736, 2.12393, 1, 1, 1, 1, 1,
0.8624195, -0.6665931, 0.9936519, 1, 1, 1, 1, 1,
0.8638338, -0.3320672, 1.697125, 1, 1, 1, 1, 1,
0.8647122, -0.6427186, 2.373128, 1, 1, 1, 1, 1,
0.8691379, -2.122622, 4.512186, 1, 1, 1, 1, 1,
0.8725219, 0.3967131, 1.689828, 1, 1, 1, 1, 1,
0.8742166, 2.002692, 1.658985, 1, 1, 1, 1, 1,
0.8793549, -0.4700096, 1.700642, 1, 1, 1, 1, 1,
0.8798805, 1.187583, -0.4841518, 1, 1, 1, 1, 1,
0.8810866, -0.3613382, 3.02425, 0, 0, 1, 1, 1,
0.8837443, 0.4115478, 0.07950082, 1, 0, 0, 1, 1,
0.8853152, -1.093925, 1.572888, 1, 0, 0, 1, 1,
0.8858745, 0.4222043, 0.960048, 1, 0, 0, 1, 1,
0.8914875, 0.4298367, -0.7289525, 1, 0, 0, 1, 1,
0.8915328, -1.680813, 1.569795, 1, 0, 0, 1, 1,
0.8930444, 0.3555494, 2.257547, 0, 0, 0, 1, 1,
0.893156, -0.6863174, 4.140603, 0, 0, 0, 1, 1,
0.893918, -0.01887423, 2.60826, 0, 0, 0, 1, 1,
0.8943562, 0.2453945, 1.527145, 0, 0, 0, 1, 1,
0.8952585, -0.7672409, 1.606198, 0, 0, 0, 1, 1,
0.9018393, -0.2970657, 0.6445104, 0, 0, 0, 1, 1,
0.9018396, 0.0568916, 2.143816, 0, 0, 0, 1, 1,
0.9022135, -0.1504276, 1.184813, 1, 1, 1, 1, 1,
0.9059586, -0.6730987, 4.481021, 1, 1, 1, 1, 1,
0.9068016, 0.4162118, 0.07237753, 1, 1, 1, 1, 1,
0.9077286, 1.511721, 0.5805151, 1, 1, 1, 1, 1,
0.9141873, -1.598417, 1.23244, 1, 1, 1, 1, 1,
0.9159133, 0.4081557, 1.523819, 1, 1, 1, 1, 1,
0.9181664, -0.2530713, 2.919426, 1, 1, 1, 1, 1,
0.939515, -0.2770852, 1.888607, 1, 1, 1, 1, 1,
0.9417356, -1.131835, 3.701518, 1, 1, 1, 1, 1,
0.948384, -0.3430494, 3.498496, 1, 1, 1, 1, 1,
0.9672492, -0.0815887, 1.505649, 1, 1, 1, 1, 1,
0.9725761, 1.167452, 1.432975, 1, 1, 1, 1, 1,
0.9746233, -1.08071, 1.186325, 1, 1, 1, 1, 1,
0.9766111, 0.3711719, 1.448566, 1, 1, 1, 1, 1,
0.9771093, 0.6215031, 1.759214, 1, 1, 1, 1, 1,
0.9776772, 0.2546355, 3.347462, 0, 0, 1, 1, 1,
0.9817782, 0.2659965, -0.407883, 1, 0, 0, 1, 1,
0.9860567, -1.443387, 2.229427, 1, 0, 0, 1, 1,
0.9925041, -0.1566009, 0.8334138, 1, 0, 0, 1, 1,
0.9976492, 0.2286283, -0.3744326, 1, 0, 0, 1, 1,
1.000047, -0.9860282, 1.055336, 1, 0, 0, 1, 1,
1.006952, -1.653036, 2.074128, 0, 0, 0, 1, 1,
1.011021, 0.8029708, 1.16359, 0, 0, 0, 1, 1,
1.011827, 0.1723811, 0.1266144, 0, 0, 0, 1, 1,
1.018105, -0.2015962, 1.145689, 0, 0, 0, 1, 1,
1.018864, -0.1893254, -0.08751603, 0, 0, 0, 1, 1,
1.020561, -1.659663, 2.612894, 0, 0, 0, 1, 1,
1.027767, 2.071134, 0.7917381, 0, 0, 0, 1, 1,
1.030054, -0.9166784, 1.136172, 1, 1, 1, 1, 1,
1.036573, -0.7622833, 2.756714, 1, 1, 1, 1, 1,
1.039252, -0.7466303, 2.639995, 1, 1, 1, 1, 1,
1.039551, 0.2221329, 2.032063, 1, 1, 1, 1, 1,
1.048156, 0.6377109, -0.718414, 1, 1, 1, 1, 1,
1.048537, -0.963002, 2.991097, 1, 1, 1, 1, 1,
1.052571, 1.958781, 2.127698, 1, 1, 1, 1, 1,
1.057538, 0.8161193, 2.189908, 1, 1, 1, 1, 1,
1.060178, -0.6709567, 0.7173227, 1, 1, 1, 1, 1,
1.060389, 1.179259, 0.8574282, 1, 1, 1, 1, 1,
1.062164, 0.4493547, 0.7714301, 1, 1, 1, 1, 1,
1.063739, -0.3946145, 1.908036, 1, 1, 1, 1, 1,
1.064202, -0.2074934, 2.064176, 1, 1, 1, 1, 1,
1.065388, -1.511348, 2.444186, 1, 1, 1, 1, 1,
1.072458, -0.1353908, -0.1749898, 1, 1, 1, 1, 1,
1.084355, 0.004192386, 1.949773, 0, 0, 1, 1, 1,
1.084785, 0.354055, 3.080142, 1, 0, 0, 1, 1,
1.091162, -0.8907168, 0.6942123, 1, 0, 0, 1, 1,
1.100533, -0.3233379, 1.927562, 1, 0, 0, 1, 1,
1.103019, 0.7349254, -0.1440049, 1, 0, 0, 1, 1,
1.105369, 0.5921473, 0.6079446, 1, 0, 0, 1, 1,
1.115243, 0.125899, 1.350759, 0, 0, 0, 1, 1,
1.118347, -1.493256, 1.919236, 0, 0, 0, 1, 1,
1.122276, -0.879251, 0.6268182, 0, 0, 0, 1, 1,
1.127511, 0.9789817, -0.1812598, 0, 0, 0, 1, 1,
1.133816, -0.6832803, 1.412529, 0, 0, 0, 1, 1,
1.135503, -1.173872, 3.524385, 0, 0, 0, 1, 1,
1.15294, 0.1412958, 0.8207032, 0, 0, 0, 1, 1,
1.156385, 1.061857, -1.471099, 1, 1, 1, 1, 1,
1.159363, -0.4838397, 0.923865, 1, 1, 1, 1, 1,
1.161441, -0.1493136, 1.559995, 1, 1, 1, 1, 1,
1.171865, 1.136836, 1.428872, 1, 1, 1, 1, 1,
1.175221, -0.9905562, 1.650434, 1, 1, 1, 1, 1,
1.179897, 1.128413, 1.702227, 1, 1, 1, 1, 1,
1.183159, 0.7363479, 1.679516, 1, 1, 1, 1, 1,
1.188848, 0.225546, 2.540374, 1, 1, 1, 1, 1,
1.189074, -1.386842, 3.325508, 1, 1, 1, 1, 1,
1.204876, 1.842319, 1.174009, 1, 1, 1, 1, 1,
1.206991, -0.7096791, 1.911562, 1, 1, 1, 1, 1,
1.207932, -0.25521, 3.432796, 1, 1, 1, 1, 1,
1.209103, -1.069639, 3.498122, 1, 1, 1, 1, 1,
1.209734, -0.07479483, 1.016373, 1, 1, 1, 1, 1,
1.214653, -0.9304618, 2.312958, 1, 1, 1, 1, 1,
1.228152, 0.7439362, 1.479963, 0, 0, 1, 1, 1,
1.256881, -0.2427339, 2.624707, 1, 0, 0, 1, 1,
1.258773, -0.7287402, 2.906048, 1, 0, 0, 1, 1,
1.259987, -0.04448928, 1.619373, 1, 0, 0, 1, 1,
1.274654, 0.7592333, 1.62769, 1, 0, 0, 1, 1,
1.275504, -1.284474, 0.8936079, 1, 0, 0, 1, 1,
1.277588, -0.420395, 3.796533, 0, 0, 0, 1, 1,
1.281519, -0.5634283, 0.9652442, 0, 0, 0, 1, 1,
1.283406, 1.59057, 0.05573908, 0, 0, 0, 1, 1,
1.289354, 0.4576635, 1.18529, 0, 0, 0, 1, 1,
1.299322, 0.3176264, 0.6739451, 0, 0, 0, 1, 1,
1.31189, -1.01876, 1.587626, 0, 0, 0, 1, 1,
1.313147, -0.2076285, 1.577547, 0, 0, 0, 1, 1,
1.315235, -0.5406092, 4.205392, 1, 1, 1, 1, 1,
1.318385, 0.06405321, 2.580117, 1, 1, 1, 1, 1,
1.32184, -1.337049, 1.750732, 1, 1, 1, 1, 1,
1.323294, -2.1388, 2.209134, 1, 1, 1, 1, 1,
1.325153, 0.2793415, 0.7672685, 1, 1, 1, 1, 1,
1.327542, 0.4293509, 1.493702, 1, 1, 1, 1, 1,
1.331883, 0.1030084, 0.8725324, 1, 1, 1, 1, 1,
1.334976, 0.8331711, 1.534738, 1, 1, 1, 1, 1,
1.342344, -0.0635774, 2.330424, 1, 1, 1, 1, 1,
1.345004, 0.1917865, 1.106083, 1, 1, 1, 1, 1,
1.361686, -1.097604, 4.030184, 1, 1, 1, 1, 1,
1.373275, -1.467147, 3.505072, 1, 1, 1, 1, 1,
1.377152, 0.2532522, 1.424784, 1, 1, 1, 1, 1,
1.377304, -0.1328495, 1.459785, 1, 1, 1, 1, 1,
1.380396, 0.5286391, 1.192324, 1, 1, 1, 1, 1,
1.384462, -2.191023, 3.918215, 0, 0, 1, 1, 1,
1.39616, -1.226134, 2.279591, 1, 0, 0, 1, 1,
1.425511, 2.311272, -1.346175, 1, 0, 0, 1, 1,
1.438429, 0.2024102, 2.29988, 1, 0, 0, 1, 1,
1.447044, -0.467649, 1.748742, 1, 0, 0, 1, 1,
1.452931, 1.562141, 1.091857, 1, 0, 0, 1, 1,
1.453483, 0.9661925, 0.4770234, 0, 0, 0, 1, 1,
1.455254, -0.2269154, 2.394958, 0, 0, 0, 1, 1,
1.457136, 0.6116881, 1.04496, 0, 0, 0, 1, 1,
1.459561, 0.3898305, 3.140372, 0, 0, 0, 1, 1,
1.465708, -0.1933613, 2.071166, 0, 0, 0, 1, 1,
1.47119, -0.6040354, 2.979113, 0, 0, 0, 1, 1,
1.472629, 0.2745056, 1.828916, 0, 0, 0, 1, 1,
1.476694, 0.6960636, 1.198218, 1, 1, 1, 1, 1,
1.482031, -0.08078487, 2.206492, 1, 1, 1, 1, 1,
1.482229, -0.660747, 1.473502, 1, 1, 1, 1, 1,
1.486435, 0.2008493, 2.702034, 1, 1, 1, 1, 1,
1.50296, -0.1379674, 2.34868, 1, 1, 1, 1, 1,
1.503524, 1.001626, 1.898422, 1, 1, 1, 1, 1,
1.519749, 0.9241957, 0.8886912, 1, 1, 1, 1, 1,
1.535512, -0.9692963, 3.506667, 1, 1, 1, 1, 1,
1.549597, -0.4299244, 2.371707, 1, 1, 1, 1, 1,
1.555206, -0.1572399, 1.69824, 1, 1, 1, 1, 1,
1.561794, 0.6248874, 0.5442729, 1, 1, 1, 1, 1,
1.577971, -0.2379845, 2.334018, 1, 1, 1, 1, 1,
1.585695, 0.3030154, 2.596543, 1, 1, 1, 1, 1,
1.587183, -1.411937, 0.6332141, 1, 1, 1, 1, 1,
1.603179, 0.02053625, 1.607685, 1, 1, 1, 1, 1,
1.642361, 0.883137, 1.07444, 0, 0, 1, 1, 1,
1.663211, -0.1256876, 2.416214, 1, 0, 0, 1, 1,
1.674809, 0.1658895, 0.902232, 1, 0, 0, 1, 1,
1.681226, -1.234313, 1.560602, 1, 0, 0, 1, 1,
1.682602, 1.122357, 0.8061737, 1, 0, 0, 1, 1,
1.683399, -1.190754, 1.208863, 1, 0, 0, 1, 1,
1.688497, 0.239305, 2.914087, 0, 0, 0, 1, 1,
1.691453, 0.6656821, 0.8880773, 0, 0, 0, 1, 1,
1.712918, 0.6881861, 0.5689458, 0, 0, 0, 1, 1,
1.721381, 1.028781, 2.519587, 0, 0, 0, 1, 1,
1.721814, -1.495664, 3.434467, 0, 0, 0, 1, 1,
1.72778, 0.370091, 1.262891, 0, 0, 0, 1, 1,
1.739671, 1.048535, 0.6256983, 0, 0, 0, 1, 1,
1.755201, -1.450383, 2.724174, 1, 1, 1, 1, 1,
1.767581, 1.097058, 2.183704, 1, 1, 1, 1, 1,
1.773722, -0.2469199, 2.231046, 1, 1, 1, 1, 1,
1.790088, 0.8862321, 0.7721455, 1, 1, 1, 1, 1,
1.799718, 0.7840753, 1.268374, 1, 1, 1, 1, 1,
1.841244, 1.321157, 2.169249, 1, 1, 1, 1, 1,
1.872577, -0.3367257, 0.9918496, 1, 1, 1, 1, 1,
1.934653, 1.067253, -0.0920004, 1, 1, 1, 1, 1,
1.938366, -0.872247, 1.772048, 1, 1, 1, 1, 1,
1.942635, -0.2453258, 0.93372, 1, 1, 1, 1, 1,
1.963882, 0.1244664, 2.640726, 1, 1, 1, 1, 1,
1.965624, -0.5599223, 2.859262, 1, 1, 1, 1, 1,
1.969571, -2.051138, 3.77228, 1, 1, 1, 1, 1,
1.974571, -2.25479, 1.288508, 1, 1, 1, 1, 1,
1.985534, 0.1644393, 1.744482, 1, 1, 1, 1, 1,
1.985785, -0.3791115, 2.808073, 0, 0, 1, 1, 1,
2.006835, -0.05518825, 2.95754, 1, 0, 0, 1, 1,
2.025314, 1.421317, -0.08586694, 1, 0, 0, 1, 1,
2.039152, -0.01917732, 2.096281, 1, 0, 0, 1, 1,
2.045459, 1.000782, 1.031349, 1, 0, 0, 1, 1,
2.073892, 0.1601856, 2.512946, 1, 0, 0, 1, 1,
2.088979, -0.3046358, 3.423069, 0, 0, 0, 1, 1,
2.121351, 2.04583, -0.6073176, 0, 0, 0, 1, 1,
2.1303, -0.0002551955, 0.1170294, 0, 0, 0, 1, 1,
2.155508, 1.085788, 2.105856, 0, 0, 0, 1, 1,
2.171059, 0.3097486, 1.833605, 0, 0, 0, 1, 1,
2.285766, 0.2929288, 0.9529173, 0, 0, 0, 1, 1,
2.299734, 1.086337, 0.2918383, 0, 0, 0, 1, 1,
2.317027, 2.507022, -1.047046, 1, 1, 1, 1, 1,
2.356351, 1.730922, 0.5769801, 1, 1, 1, 1, 1,
2.577787, -0.4247554, 3.741365, 1, 1, 1, 1, 1,
2.600958, 0.2585092, 1.286241, 1, 1, 1, 1, 1,
2.684189, -1.531642, 2.447447, 1, 1, 1, 1, 1,
3.061398, 0.9688216, 1.604293, 1, 1, 1, 1, 1,
3.238092, -0.4108968, 3.093945, 1, 1, 1, 1, 1
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
var radius = 9.762373;
var distance = 34.28992;
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
mvMatrix.translate( 0.1392422, -0.2350006, -0.01475453 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.28992);
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
