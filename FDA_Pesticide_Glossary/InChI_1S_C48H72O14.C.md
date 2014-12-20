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
-3.738744, 0.2225463, -3.147018, 1, 0, 0, 1,
-2.819998, 0.3492167, -1.746195, 1, 0.007843138, 0, 1,
-2.627166, -0.08810268, -2.056639, 1, 0.01176471, 0, 1,
-2.488426, -0.1922213, -3.284192, 1, 0.01960784, 0, 1,
-2.47321, -0.4579573, -1.305765, 1, 0.02352941, 0, 1,
-2.454749, 1.340848, -0.5859452, 1, 0.03137255, 0, 1,
-2.42299, 0.1466947, -1.386706, 1, 0.03529412, 0, 1,
-2.311759, -1.096803, -0.6468682, 1, 0.04313726, 0, 1,
-2.252888, -1.188378, -3.233094, 1, 0.04705882, 0, 1,
-2.185504, -0.5042201, -0.865091, 1, 0.05490196, 0, 1,
-2.176024, -0.001505296, -0.01067704, 1, 0.05882353, 0, 1,
-2.09218, -0.4812883, 0.1768342, 1, 0.06666667, 0, 1,
-2.085236, -0.3841317, -2.215901, 1, 0.07058824, 0, 1,
-2.079258, -0.2879949, -0.8459377, 1, 0.07843138, 0, 1,
-2.043231, -0.6484624, -2.281972, 1, 0.08235294, 0, 1,
-2.00067, 0.2623256, -1.259172, 1, 0.09019608, 0, 1,
-1.985373, -1.515788, -2.545876, 1, 0.09411765, 0, 1,
-1.980497, -1.718825, -1.924268, 1, 0.1019608, 0, 1,
-1.96834, -1.73894, -3.226979, 1, 0.1098039, 0, 1,
-1.958606, -1.999218, -2.473561, 1, 0.1137255, 0, 1,
-1.938893, -0.8852949, -2.429433, 1, 0.1215686, 0, 1,
-1.938532, -0.7193368, -1.868811, 1, 0.1254902, 0, 1,
-1.903072, 0.6070951, -1.219422, 1, 0.1333333, 0, 1,
-1.89789, -1.311013, -1.308701, 1, 0.1372549, 0, 1,
-1.896217, 1.334916, -1.579752, 1, 0.145098, 0, 1,
-1.870357, 0.9616646, -2.099255, 1, 0.1490196, 0, 1,
-1.857196, -0.511885, -2.843076, 1, 0.1568628, 0, 1,
-1.848864, 0.3570924, -1.090588, 1, 0.1607843, 0, 1,
-1.838998, -1.355721, 0.813275, 1, 0.1686275, 0, 1,
-1.837578, 0.0923478, -2.412934, 1, 0.172549, 0, 1,
-1.811614, 0.2793522, -1.919038, 1, 0.1803922, 0, 1,
-1.80907, 0.06176322, -1.853586, 1, 0.1843137, 0, 1,
-1.800275, -0.7629051, -1.559646, 1, 0.1921569, 0, 1,
-1.783176, 1.124356, -1.25951, 1, 0.1960784, 0, 1,
-1.737919, 1.344362, -0.5000783, 1, 0.2039216, 0, 1,
-1.729901, 0.2556728, -0.5591705, 1, 0.2117647, 0, 1,
-1.721125, -2.128017, -2.857472, 1, 0.2156863, 0, 1,
-1.692662, -0.4957623, -1.22433, 1, 0.2235294, 0, 1,
-1.692486, -0.6786103, -0.8315942, 1, 0.227451, 0, 1,
-1.691252, -0.1201819, -2.588276, 1, 0.2352941, 0, 1,
-1.690253, 2.737315, 1.439391, 1, 0.2392157, 0, 1,
-1.679882, 1.487656, -0.6664481, 1, 0.2470588, 0, 1,
-1.671856, -0.2828282, -1.015862, 1, 0.2509804, 0, 1,
-1.671494, 2.265566, -0.2008166, 1, 0.2588235, 0, 1,
-1.620959, -1.60843, -3.155813, 1, 0.2627451, 0, 1,
-1.620676, 1.047939, 0.1010865, 1, 0.2705882, 0, 1,
-1.613861, 1.065171, -0.5482134, 1, 0.2745098, 0, 1,
-1.606439, 0.6836464, -1.262602, 1, 0.282353, 0, 1,
-1.605088, -0.3775112, -3.406, 1, 0.2862745, 0, 1,
-1.60208, -0.4629068, -1.867181, 1, 0.2941177, 0, 1,
-1.595795, -2.094768, -1.412004, 1, 0.3019608, 0, 1,
-1.59353, 1.537568, 0.8502657, 1, 0.3058824, 0, 1,
-1.588121, 0.4588806, -1.231884, 1, 0.3137255, 0, 1,
-1.587142, -1.861708, -2.120576, 1, 0.3176471, 0, 1,
-1.560101, 1.723776, -1.19245, 1, 0.3254902, 0, 1,
-1.554198, -0.8264194, 0.8850511, 1, 0.3294118, 0, 1,
-1.552246, 0.04906816, -1.502039, 1, 0.3372549, 0, 1,
-1.537292, -0.07088564, -3.586688, 1, 0.3411765, 0, 1,
-1.530255, -1.503075, -2.526721, 1, 0.3490196, 0, 1,
-1.513292, -1.070168, -0.822779, 1, 0.3529412, 0, 1,
-1.496721, -1.174862, -2.522442, 1, 0.3607843, 0, 1,
-1.49379, 0.8423954, -1.660505, 1, 0.3647059, 0, 1,
-1.491814, 1.149612, -1.99852, 1, 0.372549, 0, 1,
-1.476084, -0.8707094, -3.443819, 1, 0.3764706, 0, 1,
-1.473702, -0.06630103, -1.919414, 1, 0.3843137, 0, 1,
-1.468273, 1.749324, 0.1871438, 1, 0.3882353, 0, 1,
-1.465894, 1.416919, -2.334396, 1, 0.3960784, 0, 1,
-1.463682, 0.5236152, -0.5835558, 1, 0.4039216, 0, 1,
-1.459688, 1.36871, 0.4187496, 1, 0.4078431, 0, 1,
-1.457494, -0.9657137, -4.032145, 1, 0.4156863, 0, 1,
-1.454226, 0.2982705, -1.245459, 1, 0.4196078, 0, 1,
-1.444517, -0.2486031, -0.9508952, 1, 0.427451, 0, 1,
-1.44259, -0.1523298, -1.509896, 1, 0.4313726, 0, 1,
-1.440287, 0.996105, -1.238408, 1, 0.4392157, 0, 1,
-1.438994, -1.433728, -2.599828, 1, 0.4431373, 0, 1,
-1.436784, -2.604702, -2.569829, 1, 0.4509804, 0, 1,
-1.43252, -0.4210623, -0.8680711, 1, 0.454902, 0, 1,
-1.428797, -0.8834645, -2.117837, 1, 0.4627451, 0, 1,
-1.419248, 0.855372, -0.6850045, 1, 0.4666667, 0, 1,
-1.411782, 1.621751, -0.8950582, 1, 0.4745098, 0, 1,
-1.401575, -0.7074459, -3.057629, 1, 0.4784314, 0, 1,
-1.400682, -1.021095, -1.168441, 1, 0.4862745, 0, 1,
-1.400651, 0.2480729, -0.6498531, 1, 0.4901961, 0, 1,
-1.394872, 1.247775, -1.085026, 1, 0.4980392, 0, 1,
-1.385883, -0.05056693, -0.4111639, 1, 0.5058824, 0, 1,
-1.379623, -1.51734, -2.066552, 1, 0.509804, 0, 1,
-1.377256, 0.7033668, -1.911105, 1, 0.5176471, 0, 1,
-1.376804, 0.677507, -1.15982, 1, 0.5215687, 0, 1,
-1.373629, -0.8346809, -3.534121, 1, 0.5294118, 0, 1,
-1.368475, 1.630894, 1.025637, 1, 0.5333334, 0, 1,
-1.359785, -0.8036199, -3.245561, 1, 0.5411765, 0, 1,
-1.342668, 0.1432165, -1.452358, 1, 0.5450981, 0, 1,
-1.328371, -1.332612, -3.523876, 1, 0.5529412, 0, 1,
-1.313918, 0.5236277, -0.08615752, 1, 0.5568628, 0, 1,
-1.312381, 0.3991193, 0.1852118, 1, 0.5647059, 0, 1,
-1.260854, -0.6583909, -1.074229, 1, 0.5686275, 0, 1,
-1.259333, -1.381688, -1.90885, 1, 0.5764706, 0, 1,
-1.253811, 0.5369033, -2.616235, 1, 0.5803922, 0, 1,
-1.24962, 0.4578928, -1.23276, 1, 0.5882353, 0, 1,
-1.248407, 1.413859, -0.9727414, 1, 0.5921569, 0, 1,
-1.248092, -0.1099081, -1.090596, 1, 0.6, 0, 1,
-1.247906, 0.8796961, -0.3180402, 1, 0.6078432, 0, 1,
-1.245812, 0.1950722, -2.781784, 1, 0.6117647, 0, 1,
-1.245599, 0.05262334, -0.8357704, 1, 0.6196079, 0, 1,
-1.242655, 0.3163994, -1.769619, 1, 0.6235294, 0, 1,
-1.241156, 0.02353897, 0.5143955, 1, 0.6313726, 0, 1,
-1.237037, -1.096737, -2.211969, 1, 0.6352941, 0, 1,
-1.225075, 0.960725, -1.635207, 1, 0.6431373, 0, 1,
-1.218669, -0.7808095, -4.242176, 1, 0.6470588, 0, 1,
-1.216767, 0.4352472, -1.347704, 1, 0.654902, 0, 1,
-1.20747, 1.580532, 0.3461659, 1, 0.6588235, 0, 1,
-1.204619, -0.03643385, -1.19973, 1, 0.6666667, 0, 1,
-1.197405, 0.1862944, -2.297232, 1, 0.6705883, 0, 1,
-1.197161, 1.354896, 0.2106636, 1, 0.6784314, 0, 1,
-1.194511, 1.232421, -0.1442551, 1, 0.682353, 0, 1,
-1.1937, -0.1580714, -1.37043, 1, 0.6901961, 0, 1,
-1.189031, 1.012794, -1.084829, 1, 0.6941177, 0, 1,
-1.188737, -1.60093, -3.092182, 1, 0.7019608, 0, 1,
-1.184337, 1.64156, -1.860739, 1, 0.7098039, 0, 1,
-1.178262, -0.00463861, -0.5216523, 1, 0.7137255, 0, 1,
-1.162145, 0.1137034, -1.274698, 1, 0.7215686, 0, 1,
-1.147944, 0.8974497, -0.1652498, 1, 0.7254902, 0, 1,
-1.146543, 0.5201977, -0.1839087, 1, 0.7333333, 0, 1,
-1.126546, -0.1512974, -2.591542, 1, 0.7372549, 0, 1,
-1.115393, -1.143487, -3.013952, 1, 0.7450981, 0, 1,
-1.113451, -2.04221, -2.504164, 1, 0.7490196, 0, 1,
-1.108907, 2.081564, -2.416957, 1, 0.7568628, 0, 1,
-1.104127, -1.728706, -3.405938, 1, 0.7607843, 0, 1,
-1.10194, -1.320075, -1.450047, 1, 0.7686275, 0, 1,
-1.097072, -2.983425, -2.683929, 1, 0.772549, 0, 1,
-1.096712, 0.08379926, -0.7262263, 1, 0.7803922, 0, 1,
-1.091927, 0.6618878, -1.064469, 1, 0.7843137, 0, 1,
-1.086005, 0.1381665, -1.577921, 1, 0.7921569, 0, 1,
-1.080489, -0.3865419, -1.866418, 1, 0.7960784, 0, 1,
-1.079547, -0.5506757, -1.906041, 1, 0.8039216, 0, 1,
-1.073221, -0.1037361, -0.5154978, 1, 0.8117647, 0, 1,
-1.072254, 0.3723662, -1.152025, 1, 0.8156863, 0, 1,
-1.071145, -0.7198185, -0.02608139, 1, 0.8235294, 0, 1,
-1.070512, 0.2075114, -3.810484, 1, 0.827451, 0, 1,
-1.069062, 0.3050258, -1.527189, 1, 0.8352941, 0, 1,
-1.063015, 0.7207432, -1.078189, 1, 0.8392157, 0, 1,
-1.060737, -1.544059, -3.127472, 1, 0.8470588, 0, 1,
-1.053653, 0.8830185, -1.745783, 1, 0.8509804, 0, 1,
-1.052802, -0.892549, -1.967143, 1, 0.8588235, 0, 1,
-1.052675, 0.2822064, -0.02425064, 1, 0.8627451, 0, 1,
-1.047985, -0.07352959, -1.767825, 1, 0.8705882, 0, 1,
-1.045194, 1.265059, -0.2891667, 1, 0.8745098, 0, 1,
-1.043893, 0.1554144, -1.23519, 1, 0.8823529, 0, 1,
-1.042265, 0.3545203, -0.2441711, 1, 0.8862745, 0, 1,
-1.037513, -0.6318358, -3.147882, 1, 0.8941177, 0, 1,
-1.036216, -0.9569428, -3.935514, 1, 0.8980392, 0, 1,
-1.03304, 0.7548572, -0.5938666, 1, 0.9058824, 0, 1,
-1.032388, -0.7470012, -0.9832259, 1, 0.9137255, 0, 1,
-1.032288, -1.281958, -1.382561, 1, 0.9176471, 0, 1,
-1.032258, -1.37195, -3.774798, 1, 0.9254902, 0, 1,
-1.027991, -0.1561103, -1.552594, 1, 0.9294118, 0, 1,
-1.023142, 1.011272, -0.8688394, 1, 0.9372549, 0, 1,
-1.015395, 0.8186173, -0.4532116, 1, 0.9411765, 0, 1,
-1.004183, -0.7715663, -3.366397, 1, 0.9490196, 0, 1,
-1.002126, 1.012997, -2.904395, 1, 0.9529412, 0, 1,
-0.9996749, 0.9716585, -2.452366, 1, 0.9607843, 0, 1,
-0.9996358, 1.819483, -0.6261914, 1, 0.9647059, 0, 1,
-0.9993799, 1.223996, -1.148046, 1, 0.972549, 0, 1,
-0.9815775, -0.3574415, -2.736106, 1, 0.9764706, 0, 1,
-0.9774369, -1.543712, -3.215373, 1, 0.9843137, 0, 1,
-0.9756159, 0.09589548, -1.687342, 1, 0.9882353, 0, 1,
-0.973509, 0.9490974, 0.1101547, 1, 0.9960784, 0, 1,
-0.9708198, -0.001843544, -2.503758, 0.9960784, 1, 0, 1,
-0.9698893, 0.6163346, -2.55052, 0.9921569, 1, 0, 1,
-0.9689758, 1.13471, -1.440442, 0.9843137, 1, 0, 1,
-0.9673519, -1.319823, -2.509485, 0.9803922, 1, 0, 1,
-0.9620294, -0.5819387, -1.734074, 0.972549, 1, 0, 1,
-0.9455388, 1.561203, 0.3342766, 0.9686275, 1, 0, 1,
-0.9416041, 0.2676603, -0.5998555, 0.9607843, 1, 0, 1,
-0.9413245, 0.8052236, -2.477583, 0.9568627, 1, 0, 1,
-0.9400493, -1.435814, -3.452397, 0.9490196, 1, 0, 1,
-0.9390972, -0.9669209, -2.871165, 0.945098, 1, 0, 1,
-0.9373471, 0.8484025, -3.496928, 0.9372549, 1, 0, 1,
-0.9362394, 0.1858318, -2.322333, 0.9333333, 1, 0, 1,
-0.9285669, -1.848817, -2.151894, 0.9254902, 1, 0, 1,
-0.9272014, 0.5362509, -1.02872, 0.9215686, 1, 0, 1,
-0.9254906, -1.55824, -2.329187, 0.9137255, 1, 0, 1,
-0.9234685, 0.420388, -0.7259216, 0.9098039, 1, 0, 1,
-0.9196649, 0.1831411, -1.640961, 0.9019608, 1, 0, 1,
-0.9168586, 0.5444166, 1.660002, 0.8941177, 1, 0, 1,
-0.9096162, -1.187189, -1.5412, 0.8901961, 1, 0, 1,
-0.903887, 0.3458706, -1.86637, 0.8823529, 1, 0, 1,
-0.9021171, 0.8259301, -2.06165, 0.8784314, 1, 0, 1,
-0.898874, -0.8659515, -1.618302, 0.8705882, 1, 0, 1,
-0.8956147, -1.337921, -2.423763, 0.8666667, 1, 0, 1,
-0.8899491, -0.5240723, -3.045332, 0.8588235, 1, 0, 1,
-0.8873235, -0.8929759, -2.053591, 0.854902, 1, 0, 1,
-0.8851636, 0.5271214, -1.619249, 0.8470588, 1, 0, 1,
-0.885, 1.142847, 0.5890484, 0.8431373, 1, 0, 1,
-0.8742992, -0.04476349, -2.007571, 0.8352941, 1, 0, 1,
-0.873701, -1.517735, -3.716296, 0.8313726, 1, 0, 1,
-0.8728219, 0.09360668, -2.538714, 0.8235294, 1, 0, 1,
-0.8714945, -1.908793, -2.808492, 0.8196079, 1, 0, 1,
-0.8628131, -0.005390598, -1.247191, 0.8117647, 1, 0, 1,
-0.857067, 0.1010554, -0.9190287, 0.8078431, 1, 0, 1,
-0.8565589, 0.2619441, -2.062195, 0.8, 1, 0, 1,
-0.8541693, 0.5897883, 0.4784244, 0.7921569, 1, 0, 1,
-0.8518811, 0.7250175, 1.120058, 0.7882353, 1, 0, 1,
-0.8482619, 0.397092, -0.66097, 0.7803922, 1, 0, 1,
-0.8480031, -0.1711583, -2.804766, 0.7764706, 1, 0, 1,
-0.845005, 0.1001007, -0.85079, 0.7686275, 1, 0, 1,
-0.8427134, 1.007424, -1.556393, 0.7647059, 1, 0, 1,
-0.8363986, 2.382811, 0.4240991, 0.7568628, 1, 0, 1,
-0.832091, -0.6785319, -2.658864, 0.7529412, 1, 0, 1,
-0.8318533, -0.7505915, -1.416552, 0.7450981, 1, 0, 1,
-0.8299384, 1.9811, 0.1788426, 0.7411765, 1, 0, 1,
-0.8278444, 1.229118, 0.3195438, 0.7333333, 1, 0, 1,
-0.8257514, 1.421334, -1.652326, 0.7294118, 1, 0, 1,
-0.8224475, 0.4795432, -0.7725658, 0.7215686, 1, 0, 1,
-0.8199381, -0.7887811, -1.478092, 0.7176471, 1, 0, 1,
-0.8168052, 1.523929, -0.9826959, 0.7098039, 1, 0, 1,
-0.8150814, 0.6295948, -0.1569279, 0.7058824, 1, 0, 1,
-0.8121577, -0.04061223, -2.091446, 0.6980392, 1, 0, 1,
-0.8110512, -1.047817, -3.010026, 0.6901961, 1, 0, 1,
-0.8023011, 0.3042654, -2.368389, 0.6862745, 1, 0, 1,
-0.7969216, 0.3826798, -1.961654, 0.6784314, 1, 0, 1,
-0.7938489, 1.212344, -1.051123, 0.6745098, 1, 0, 1,
-0.7935685, -0.3649672, -1.991808, 0.6666667, 1, 0, 1,
-0.7930855, -0.01432236, -3.123183, 0.6627451, 1, 0, 1,
-0.7919958, 0.4880311, -1.176521, 0.654902, 1, 0, 1,
-0.7916347, -1.553885, -2.873833, 0.6509804, 1, 0, 1,
-0.7874209, 0.9618024, -0.1236214, 0.6431373, 1, 0, 1,
-0.787158, 0.3900962, -0.6607537, 0.6392157, 1, 0, 1,
-0.7806942, -0.6128873, -2.157517, 0.6313726, 1, 0, 1,
-0.7805661, 0.3404585, -2.697096, 0.627451, 1, 0, 1,
-0.778105, -1.104816, -2.074183, 0.6196079, 1, 0, 1,
-0.7742319, -2.412246, -4.369086, 0.6156863, 1, 0, 1,
-0.771438, 0.3947617, -1.862031, 0.6078432, 1, 0, 1,
-0.7700106, 0.2823283, -1.953142, 0.6039216, 1, 0, 1,
-0.7644833, -0.6268243, -2.273046, 0.5960785, 1, 0, 1,
-0.7629786, 0.6187487, 0.7373627, 0.5882353, 1, 0, 1,
-0.7581154, 0.3630114, -1.529597, 0.5843138, 1, 0, 1,
-0.7574706, -1.023371, -3.302098, 0.5764706, 1, 0, 1,
-0.7564614, -0.6570616, -2.21106, 0.572549, 1, 0, 1,
-0.7534078, 0.7083864, -0.2169165, 0.5647059, 1, 0, 1,
-0.7518546, 0.649757, -0.2783497, 0.5607843, 1, 0, 1,
-0.750157, -0.2635437, -0.7603933, 0.5529412, 1, 0, 1,
-0.7460267, 0.3491434, -0.1815989, 0.5490196, 1, 0, 1,
-0.7436844, 0.8503945, -1.39607, 0.5411765, 1, 0, 1,
-0.7427956, -0.3429628, -2.297055, 0.5372549, 1, 0, 1,
-0.7422179, 1.937412, 1.364251, 0.5294118, 1, 0, 1,
-0.7415794, 0.8580489, -0.5868247, 0.5254902, 1, 0, 1,
-0.7384955, -0.5998352, -1.134968, 0.5176471, 1, 0, 1,
-0.7349849, -0.2106255, -2.308922, 0.5137255, 1, 0, 1,
-0.7319013, 1.402397, 1.733207, 0.5058824, 1, 0, 1,
-0.7227484, -0.872933, -3.093736, 0.5019608, 1, 0, 1,
-0.7155853, -0.4099073, -1.916049, 0.4941176, 1, 0, 1,
-0.7153289, -0.7649721, -1.390693, 0.4862745, 1, 0, 1,
-0.7107662, -0.8952155, -2.950867, 0.4823529, 1, 0, 1,
-0.7087691, 1.138624, 0.2205231, 0.4745098, 1, 0, 1,
-0.7064987, -0.6773602, -3.237967, 0.4705882, 1, 0, 1,
-0.6810241, -1.409403, -2.834531, 0.4627451, 1, 0, 1,
-0.6798439, -0.3030681, -1.370318, 0.4588235, 1, 0, 1,
-0.6756897, -1.229002, -2.724687, 0.4509804, 1, 0, 1,
-0.6732237, 1.187642, 0.01602482, 0.4470588, 1, 0, 1,
-0.6700338, 0.05993458, -0.5365764, 0.4392157, 1, 0, 1,
-0.6597753, 0.7225508, -0.4307382, 0.4352941, 1, 0, 1,
-0.6584667, -1.24888, -2.789939, 0.427451, 1, 0, 1,
-0.6582798, 1.203712, -0.3164474, 0.4235294, 1, 0, 1,
-0.6581283, 2.025, -0.3190978, 0.4156863, 1, 0, 1,
-0.654372, -0.8114046, -4.184477, 0.4117647, 1, 0, 1,
-0.650709, 1.264745, -0.7520003, 0.4039216, 1, 0, 1,
-0.6503173, -0.84521, -3.46253, 0.3960784, 1, 0, 1,
-0.6499576, 1.54998, 2.967682, 0.3921569, 1, 0, 1,
-0.6497332, -0.01399375, 0.8701025, 0.3843137, 1, 0, 1,
-0.6460469, 0.5863126, -1.291715, 0.3803922, 1, 0, 1,
-0.6388822, -0.03204222, -2.290251, 0.372549, 1, 0, 1,
-0.6329566, -1.097659, -1.584931, 0.3686275, 1, 0, 1,
-0.6260704, -0.1167214, -3.588546, 0.3607843, 1, 0, 1,
-0.6240688, 0.2497833, -1.96197, 0.3568628, 1, 0, 1,
-0.6237444, -0.2274647, -1.935097, 0.3490196, 1, 0, 1,
-0.6138922, 1.520666, 1.067083, 0.345098, 1, 0, 1,
-0.6137805, 1.312802, -0.3454369, 0.3372549, 1, 0, 1,
-0.6124201, -0.7206626, -3.149025, 0.3333333, 1, 0, 1,
-0.5962401, 0.588302, -2.359022, 0.3254902, 1, 0, 1,
-0.5948966, 1.736276, -0.1616504, 0.3215686, 1, 0, 1,
-0.5948552, -0.4880508, -3.041172, 0.3137255, 1, 0, 1,
-0.5889798, -1.634264, -2.759728, 0.3098039, 1, 0, 1,
-0.5886709, 0.4007574, 1.226571, 0.3019608, 1, 0, 1,
-0.5878832, 0.08139736, 0.1316675, 0.2941177, 1, 0, 1,
-0.5860019, 1.542457, -0.01801384, 0.2901961, 1, 0, 1,
-0.5841635, -0.3172506, -5.069066, 0.282353, 1, 0, 1,
-0.5828571, 1.371156, -0.1695137, 0.2784314, 1, 0, 1,
-0.5764698, 0.482135, 0.1499757, 0.2705882, 1, 0, 1,
-0.5743525, -1.251246, -4.118899, 0.2666667, 1, 0, 1,
-0.5726125, -0.9031806, -3.275289, 0.2588235, 1, 0, 1,
-0.5672342, 0.2036874, -1.749088, 0.254902, 1, 0, 1,
-0.566776, 0.1344926, -3.119728, 0.2470588, 1, 0, 1,
-0.5648769, 0.6192987, 1.039645, 0.2431373, 1, 0, 1,
-0.5629452, -1.337983, -4.430579, 0.2352941, 1, 0, 1,
-0.5612493, 2.917535, 0.4200612, 0.2313726, 1, 0, 1,
-0.561053, -1.105096, -2.878021, 0.2235294, 1, 0, 1,
-0.5545581, 0.02330997, -0.975308, 0.2196078, 1, 0, 1,
-0.5505202, 0.2331446, 1.193966, 0.2117647, 1, 0, 1,
-0.5486168, 0.8440093, -1.096864, 0.2078431, 1, 0, 1,
-0.5466099, -0.4483318, -1.653373, 0.2, 1, 0, 1,
-0.5461962, 1.851273, -0.8194839, 0.1921569, 1, 0, 1,
-0.5432712, 0.8263534, -0.2023616, 0.1882353, 1, 0, 1,
-0.5427331, 0.4596751, -1.133754, 0.1803922, 1, 0, 1,
-0.5427008, 1.106084, 0.6919809, 0.1764706, 1, 0, 1,
-0.5422549, -0.05454975, -2.44621, 0.1686275, 1, 0, 1,
-0.5420423, 1.414005, -2.971516, 0.1647059, 1, 0, 1,
-0.5325363, -0.541036, -1.762659, 0.1568628, 1, 0, 1,
-0.5300958, -1.278079, -1.162459, 0.1529412, 1, 0, 1,
-0.5298139, -0.2814771, -2.360794, 0.145098, 1, 0, 1,
-0.524785, -0.9833134, -3.679823, 0.1411765, 1, 0, 1,
-0.5237001, 0.560208, 0.838856, 0.1333333, 1, 0, 1,
-0.5146285, -0.6204864, -2.139502, 0.1294118, 1, 0, 1,
-0.5113919, 1.437901, 1.298326, 0.1215686, 1, 0, 1,
-0.5103939, 2.43074, -0.7654679, 0.1176471, 1, 0, 1,
-0.5078058, 1.303223, -1.161816, 0.1098039, 1, 0, 1,
-0.507362, 1.235143, 0.9918448, 0.1058824, 1, 0, 1,
-0.5023544, 0.5796174, -0.4999554, 0.09803922, 1, 0, 1,
-0.4981567, -0.1477112, -2.650264, 0.09019608, 1, 0, 1,
-0.4972096, -1.311134, -4.547121, 0.08627451, 1, 0, 1,
-0.4911853, 0.3978312, -0.4431331, 0.07843138, 1, 0, 1,
-0.4904217, -0.3995685, -2.181353, 0.07450981, 1, 0, 1,
-0.4902853, -0.4151946, -4.227127, 0.06666667, 1, 0, 1,
-0.4868275, -1.993347, -1.764947, 0.0627451, 1, 0, 1,
-0.4856144, 2.609277, -1.330347, 0.05490196, 1, 0, 1,
-0.478291, 0.4190125, -1.814108, 0.05098039, 1, 0, 1,
-0.4737031, 2.305424, -0.5347415, 0.04313726, 1, 0, 1,
-0.4640323, 1.115929, 0.553053, 0.03921569, 1, 0, 1,
-0.4620702, 1.28993, 0.04550889, 0.03137255, 1, 0, 1,
-0.4607558, -0.3435688, -4.120944, 0.02745098, 1, 0, 1,
-0.4534815, -0.1960784, -1.978857, 0.01960784, 1, 0, 1,
-0.442637, 0.7523693, 0.02723632, 0.01568628, 1, 0, 1,
-0.4425215, -0.01274488, -3.296268, 0.007843138, 1, 0, 1,
-0.4423895, 0.7486156, -0.5874178, 0.003921569, 1, 0, 1,
-0.4411403, -0.7865917, -3.136854, 0, 1, 0.003921569, 1,
-0.4324678, 0.4534935, -1.595605, 0, 1, 0.01176471, 1,
-0.4283694, -0.1344787, -0.2659753, 0, 1, 0.01568628, 1,
-0.4273195, 1.372789, -1.466169, 0, 1, 0.02352941, 1,
-0.4230847, 1.111304, -0.06092172, 0, 1, 0.02745098, 1,
-0.4212162, -0.5210947, -1.539753, 0, 1, 0.03529412, 1,
-0.418359, 0.2309932, 0.8341004, 0, 1, 0.03921569, 1,
-0.4134033, -1.882938, -2.876327, 0, 1, 0.04705882, 1,
-0.4123661, 1.908486, 0.6364591, 0, 1, 0.05098039, 1,
-0.4091996, 2.29764, -1.481557, 0, 1, 0.05882353, 1,
-0.408398, -1.249983, -1.760176, 0, 1, 0.0627451, 1,
-0.4073728, 0.3930268, -2.02912, 0, 1, 0.07058824, 1,
-0.406154, 1.70761, -1.345961, 0, 1, 0.07450981, 1,
-0.4022524, 1.051483, 0.5156193, 0, 1, 0.08235294, 1,
-0.4002486, 0.5703634, -2.231243, 0, 1, 0.08627451, 1,
-0.3995246, 1.458222, 0.1912797, 0, 1, 0.09411765, 1,
-0.3968879, -1.25618, -2.994819, 0, 1, 0.1019608, 1,
-0.3957614, 1.4025, 1.131783, 0, 1, 0.1058824, 1,
-0.3954344, 1.009112, 0.995205, 0, 1, 0.1137255, 1,
-0.3922127, 0.01496852, -1.819176, 0, 1, 0.1176471, 1,
-0.3898598, 1.021623, -1.56073, 0, 1, 0.1254902, 1,
-0.3797954, -0.9576327, -1.572173, 0, 1, 0.1294118, 1,
-0.3796812, -0.9538887, -3.21405, 0, 1, 0.1372549, 1,
-0.3765326, 0.9564639, -1.846866, 0, 1, 0.1411765, 1,
-0.3761594, -0.786413, -3.804596, 0, 1, 0.1490196, 1,
-0.375291, -0.808561, -3.179332, 0, 1, 0.1529412, 1,
-0.3743631, -1.782548, -1.918997, 0, 1, 0.1607843, 1,
-0.3742827, -0.08686449, -2.708922, 0, 1, 0.1647059, 1,
-0.3740896, -0.4155954, -3.617057, 0, 1, 0.172549, 1,
-0.3739238, 1.246596, 0.1622856, 0, 1, 0.1764706, 1,
-0.3738797, -2.028501, -1.948484, 0, 1, 0.1843137, 1,
-0.3720669, -0.4864878, -2.908856, 0, 1, 0.1882353, 1,
-0.3713927, -0.2614905, -2.149224, 0, 1, 0.1960784, 1,
-0.3712784, 0.517304, 0.6052384, 0, 1, 0.2039216, 1,
-0.369188, 0.3499191, -0.9491374, 0, 1, 0.2078431, 1,
-0.3616005, 1.553387, -0.6029388, 0, 1, 0.2156863, 1,
-0.3613731, 0.9228188, -0.7679439, 0, 1, 0.2196078, 1,
-0.3588865, -0.2490124, -2.93325, 0, 1, 0.227451, 1,
-0.355872, 0.8887644, 0.4047945, 0, 1, 0.2313726, 1,
-0.3511778, -1.486142, -2.670196, 0, 1, 0.2392157, 1,
-0.3479981, 1.190272, 0.3005085, 0, 1, 0.2431373, 1,
-0.3469052, -0.4986078, -2.944317, 0, 1, 0.2509804, 1,
-0.3448795, 1.279578, 0.1063929, 0, 1, 0.254902, 1,
-0.3405887, 1.782924, 0.2101777, 0, 1, 0.2627451, 1,
-0.3377808, -0.7010037, -2.170024, 0, 1, 0.2666667, 1,
-0.3278563, 0.2216041, -1.722246, 0, 1, 0.2745098, 1,
-0.3261128, 1.49837, -0.902963, 0, 1, 0.2784314, 1,
-0.3259218, 0.1262517, -1.143642, 0, 1, 0.2862745, 1,
-0.3257599, -0.7805327, -2.750229, 0, 1, 0.2901961, 1,
-0.3204839, 1.107762, -1.477286, 0, 1, 0.2980392, 1,
-0.3114139, -1.644198, -3.857857, 0, 1, 0.3058824, 1,
-0.3048499, -0.5505844, -3.021537, 0, 1, 0.3098039, 1,
-0.3023594, -1.24031, -2.869665, 0, 1, 0.3176471, 1,
-0.3017892, 0.158586, -1.032356, 0, 1, 0.3215686, 1,
-0.3016617, 1.004034, 0.5032611, 0, 1, 0.3294118, 1,
-0.3002265, 0.1089802, -2.26117, 0, 1, 0.3333333, 1,
-0.298817, 0.6816177, -0.8541418, 0, 1, 0.3411765, 1,
-0.2964514, 0.5245207, 0.2398995, 0, 1, 0.345098, 1,
-0.2879432, -1.996783, -3.420156, 0, 1, 0.3529412, 1,
-0.2872184, -0.1405523, -1.753116, 0, 1, 0.3568628, 1,
-0.2863548, -0.7111168, -3.658242, 0, 1, 0.3647059, 1,
-0.286143, 0.893756, 1.132199, 0, 1, 0.3686275, 1,
-0.2846303, 0.6998548, 0.2257736, 0, 1, 0.3764706, 1,
-0.2800185, -0.2058188, -1.437966, 0, 1, 0.3803922, 1,
-0.2785074, -0.06238816, -2.652188, 0, 1, 0.3882353, 1,
-0.2727292, 0.1519987, -1.098701, 0, 1, 0.3921569, 1,
-0.2724489, -1.145539, -4.067569, 0, 1, 0.4, 1,
-0.2706715, 0.5882418, 0.2552974, 0, 1, 0.4078431, 1,
-0.2703274, -0.1328608, -1.840717, 0, 1, 0.4117647, 1,
-0.2602106, -1.205354, -1.590228, 0, 1, 0.4196078, 1,
-0.2580643, -0.6330726, -3.908657, 0, 1, 0.4235294, 1,
-0.2569115, 1.546817, -1.572001, 0, 1, 0.4313726, 1,
-0.2537453, 0.6287324, -0.9160219, 0, 1, 0.4352941, 1,
-0.2499603, 0.8075353, 0.9988852, 0, 1, 0.4431373, 1,
-0.2483545, -2.354891, -3.0857, 0, 1, 0.4470588, 1,
-0.2472979, -1.149522, -2.334422, 0, 1, 0.454902, 1,
-0.2470473, -0.9829879, -3.704316, 0, 1, 0.4588235, 1,
-0.2467532, 0.2459702, 0.9257773, 0, 1, 0.4666667, 1,
-0.2459873, -0.8451377, -2.374752, 0, 1, 0.4705882, 1,
-0.2444596, 0.7823904, -2.840019, 0, 1, 0.4784314, 1,
-0.2439044, -1.433919, -2.969621, 0, 1, 0.4823529, 1,
-0.2433249, 0.3375523, -0.9703172, 0, 1, 0.4901961, 1,
-0.2393633, -0.611748, -4.146307, 0, 1, 0.4941176, 1,
-0.2388508, 0.9639357, -1.00782, 0, 1, 0.5019608, 1,
-0.2342531, -0.3126716, -3.475873, 0, 1, 0.509804, 1,
-0.2289829, 1.909294, 1.289516, 0, 1, 0.5137255, 1,
-0.2270878, 0.6749125, 0.2140842, 0, 1, 0.5215687, 1,
-0.2252374, 0.01012734, -0.1947983, 0, 1, 0.5254902, 1,
-0.2224347, -0.4541474, -2.248871, 0, 1, 0.5333334, 1,
-0.2221258, -0.6914775, -2.695709, 0, 1, 0.5372549, 1,
-0.2193527, -1.645571, -3.432148, 0, 1, 0.5450981, 1,
-0.2135779, 0.7613465, 0.2718261, 0, 1, 0.5490196, 1,
-0.2106642, -0.5279124, -1.761099, 0, 1, 0.5568628, 1,
-0.2100071, -0.4271264, -3.928032, 0, 1, 0.5607843, 1,
-0.2040806, -1.372719, -2.20712, 0, 1, 0.5686275, 1,
-0.2015387, -0.05089064, -1.821933, 0, 1, 0.572549, 1,
-0.1948389, -0.5190812, -2.873522, 0, 1, 0.5803922, 1,
-0.1894798, 0.8779238, 0.05615944, 0, 1, 0.5843138, 1,
-0.189047, -1.422497, -4.217027, 0, 1, 0.5921569, 1,
-0.1881103, -0.9339749, -3.232331, 0, 1, 0.5960785, 1,
-0.1854219, -0.4230322, -1.972022, 0, 1, 0.6039216, 1,
-0.1817036, 1.140036, -0.2491813, 0, 1, 0.6117647, 1,
-0.1792437, -0.7955655, -3.440053, 0, 1, 0.6156863, 1,
-0.1764764, 0.2396821, -0.03565341, 0, 1, 0.6235294, 1,
-0.1762228, 0.6498908, -1.366407, 0, 1, 0.627451, 1,
-0.170821, 1.030646, -1.316629, 0, 1, 0.6352941, 1,
-0.1679921, -1.041323, -2.540952, 0, 1, 0.6392157, 1,
-0.1651964, -3.004014, -3.908453, 0, 1, 0.6470588, 1,
-0.1617398, -0.956385, -1.372051, 0, 1, 0.6509804, 1,
-0.159284, -0.2807245, -3.173985, 0, 1, 0.6588235, 1,
-0.1587418, 0.7478597, 0.6405214, 0, 1, 0.6627451, 1,
-0.1561609, -0.5670106, -4.243343, 0, 1, 0.6705883, 1,
-0.1561404, -0.3311611, -3.072294, 0, 1, 0.6745098, 1,
-0.1543561, 0.6219872, 0.2502668, 0, 1, 0.682353, 1,
-0.1533653, 0.1561203, -1.618461, 0, 1, 0.6862745, 1,
-0.1530389, -2.431576, -3.70656, 0, 1, 0.6941177, 1,
-0.1496799, 0.1594463, 0.2575398, 0, 1, 0.7019608, 1,
-0.1460157, 0.8173913, -1.337995, 0, 1, 0.7058824, 1,
-0.1423192, 0.1860265, -2.660496, 0, 1, 0.7137255, 1,
-0.1385177, 0.6029928, -0.1061052, 0, 1, 0.7176471, 1,
-0.1362593, 0.9504091, -0.8715811, 0, 1, 0.7254902, 1,
-0.1347009, -0.4204314, -1.787179, 0, 1, 0.7294118, 1,
-0.1338016, -0.264681, -4.714151, 0, 1, 0.7372549, 1,
-0.1283165, -1.635443, -2.220727, 0, 1, 0.7411765, 1,
-0.127353, -0.6296418, -2.811055, 0, 1, 0.7490196, 1,
-0.1261848, 3.457156, -1.249472, 0, 1, 0.7529412, 1,
-0.1176854, -1.841374, -2.051441, 0, 1, 0.7607843, 1,
-0.117186, -1.457441, -1.33677, 0, 1, 0.7647059, 1,
-0.1106554, 0.335664, 1.061548, 0, 1, 0.772549, 1,
-0.1082097, 0.04321609, -2.708094, 0, 1, 0.7764706, 1,
-0.1035367, 0.5598681, -1.014051, 0, 1, 0.7843137, 1,
-0.1023017, 0.2813752, -0.9697462, 0, 1, 0.7882353, 1,
-0.102136, -0.193069, -3.948071, 0, 1, 0.7960784, 1,
-0.1009224, 1.372007, 1.206455, 0, 1, 0.8039216, 1,
-0.09926327, -0.8990384, -2.435531, 0, 1, 0.8078431, 1,
-0.09894574, 0.05199613, -1.153759, 0, 1, 0.8156863, 1,
-0.09843087, -0.09001978, -3.905434, 0, 1, 0.8196079, 1,
-0.09705086, -0.09266753, -1.780895, 0, 1, 0.827451, 1,
-0.09547478, -0.370576, -2.658492, 0, 1, 0.8313726, 1,
-0.0930354, -1.731588, -4.543003, 0, 1, 0.8392157, 1,
-0.08267887, 0.4092112, -0.1638632, 0, 1, 0.8431373, 1,
-0.078151, -0.4798654, -4.162548, 0, 1, 0.8509804, 1,
-0.07667826, -0.1434934, -3.164049, 0, 1, 0.854902, 1,
-0.0765522, -1.465945, -4.712984, 0, 1, 0.8627451, 1,
-0.0757223, -0.6325088, -1.576483, 0, 1, 0.8666667, 1,
-0.07404688, -0.3402928, -2.846469, 0, 1, 0.8745098, 1,
-0.07255041, -0.420176, -0.9573347, 0, 1, 0.8784314, 1,
-0.07212059, -0.2672159, -0.5830256, 0, 1, 0.8862745, 1,
-0.07060621, -0.7074618, -4.807889, 0, 1, 0.8901961, 1,
-0.0674702, 0.4862916, -0.8149173, 0, 1, 0.8980392, 1,
-0.06727052, -0.1593903, 0.06628564, 0, 1, 0.9058824, 1,
-0.06680711, -0.4109469, -2.979719, 0, 1, 0.9098039, 1,
-0.06307521, -0.6207204, -3.133433, 0, 1, 0.9176471, 1,
-0.06231585, -0.1221292, -3.18548, 0, 1, 0.9215686, 1,
-0.05980509, -2.74577, -2.461234, 0, 1, 0.9294118, 1,
-0.05968469, -0.2565995, -2.362617, 0, 1, 0.9333333, 1,
-0.0589969, -0.5819985, -3.803722, 0, 1, 0.9411765, 1,
-0.05608182, -0.9216411, -1.504376, 0, 1, 0.945098, 1,
-0.05501053, -0.5292982, -4.925992, 0, 1, 0.9529412, 1,
-0.05428061, -0.1996952, -1.558074, 0, 1, 0.9568627, 1,
-0.05147113, 1.847493, -0.1477311, 0, 1, 0.9647059, 1,
-0.04815405, 1.074304, -0.8638276, 0, 1, 0.9686275, 1,
-0.0383675, 0.2732581, -0.5494322, 0, 1, 0.9764706, 1,
-0.02509502, 0.6119094, 1.707275, 0, 1, 0.9803922, 1,
-0.0246786, 2.781538, -0.5130178, 0, 1, 0.9882353, 1,
-0.02324549, -2.000094, -2.920979, 0, 1, 0.9921569, 1,
-0.02278251, 0.7135258, 0.1367234, 0, 1, 1, 1,
-0.01919555, 0.383051, 0.01048909, 0, 0.9921569, 1, 1,
-0.01784062, -0.3231963, -3.022566, 0, 0.9882353, 1, 1,
-0.01719283, -2.503466, -4.928352, 0, 0.9803922, 1, 1,
-0.01331913, -0.8794068, -3.577061, 0, 0.9764706, 1, 1,
-0.01198552, -0.2315763, -2.14806, 0, 0.9686275, 1, 1,
-0.00966482, -0.8648822, -3.643153, 0, 0.9647059, 1, 1,
-0.003691123, -0.04238205, -3.529435, 0, 0.9568627, 1, 1,
-0.001632949, -0.8537089, -2.502703, 0, 0.9529412, 1, 1,
-0.001129095, -1.751498, -5.045702, 0, 0.945098, 1, 1,
0.003233807, 2.084732, -1.45492, 0, 0.9411765, 1, 1,
0.004450554, 2.094168, 1.086146, 0, 0.9333333, 1, 1,
0.007146867, -1.025288, 3.956259, 0, 0.9294118, 1, 1,
0.01380785, -0.5482831, 4.297533, 0, 0.9215686, 1, 1,
0.02007184, 0.3778262, 0.06087666, 0, 0.9176471, 1, 1,
0.0263289, -0.3831442, 2.670694, 0, 0.9098039, 1, 1,
0.03371435, 0.09612376, -1.018315, 0, 0.9058824, 1, 1,
0.03813031, 0.225483, 0.3346986, 0, 0.8980392, 1, 1,
0.03860839, -1.582299, 2.724843, 0, 0.8901961, 1, 1,
0.04178438, -0.1860673, 3.424712, 0, 0.8862745, 1, 1,
0.04208149, -1.65912, 2.811201, 0, 0.8784314, 1, 1,
0.04319217, -0.1180821, 2.589282, 0, 0.8745098, 1, 1,
0.04793714, -0.500917, 1.611479, 0, 0.8666667, 1, 1,
0.05120243, 0.9552922, -1.094801, 0, 0.8627451, 1, 1,
0.05262447, 1.102798, -0.305898, 0, 0.854902, 1, 1,
0.05725714, -0.2884713, 0.2001778, 0, 0.8509804, 1, 1,
0.05813534, -1.220765, 2.495363, 0, 0.8431373, 1, 1,
0.06219644, 0.2890692, -0.002970737, 0, 0.8392157, 1, 1,
0.06281511, -1.788805, 1.058887, 0, 0.8313726, 1, 1,
0.07105051, 0.5067015, -1.224249, 0, 0.827451, 1, 1,
0.07536376, -0.5670074, 2.421999, 0, 0.8196079, 1, 1,
0.07621903, 0.7722568, -0.5959341, 0, 0.8156863, 1, 1,
0.0773036, -1.505263, 2.591381, 0, 0.8078431, 1, 1,
0.08297925, 0.7817744, 0.07865886, 0, 0.8039216, 1, 1,
0.08329563, -0.9586114, 3.144389, 0, 0.7960784, 1, 1,
0.08636346, -0.02238228, 0.4257737, 0, 0.7882353, 1, 1,
0.08841512, -1.159538, 3.773446, 0, 0.7843137, 1, 1,
0.09004928, 0.3188356, -0.08413329, 0, 0.7764706, 1, 1,
0.09080206, -0.7859871, 1.77211, 0, 0.772549, 1, 1,
0.09110392, 1.268708, 1.713688, 0, 0.7647059, 1, 1,
0.09346013, -0.9730701, 3.056071, 0, 0.7607843, 1, 1,
0.09886745, -0.7158128, 2.284539, 0, 0.7529412, 1, 1,
0.1033208, -1.829783, 1.660725, 0, 0.7490196, 1, 1,
0.1035751, 2.034894, -0.7345482, 0, 0.7411765, 1, 1,
0.1064779, -2.514306, 3.684221, 0, 0.7372549, 1, 1,
0.1092038, 0.06341457, 2.383072, 0, 0.7294118, 1, 1,
0.1117547, 1.47399, -0.2092561, 0, 0.7254902, 1, 1,
0.1119205, 0.3554114, -0.1342136, 0, 0.7176471, 1, 1,
0.1126941, -0.3269678, 3.108038, 0, 0.7137255, 1, 1,
0.1140798, -0.4816951, 2.318931, 0, 0.7058824, 1, 1,
0.1190261, 0.6371859, -0.03852055, 0, 0.6980392, 1, 1,
0.1194931, -2.038247, 2.029681, 0, 0.6941177, 1, 1,
0.1201123, 0.2532557, 0.4025691, 0, 0.6862745, 1, 1,
0.1212566, 1.018419, 0.4438281, 0, 0.682353, 1, 1,
0.1216844, -0.4511115, 2.656033, 0, 0.6745098, 1, 1,
0.1265883, -0.6632079, 2.840517, 0, 0.6705883, 1, 1,
0.1307676, 1.198213, -0.2034457, 0, 0.6627451, 1, 1,
0.1357291, -0.6319708, 2.856851, 0, 0.6588235, 1, 1,
0.138168, -0.1587525, 3.312412, 0, 0.6509804, 1, 1,
0.1463086, -0.9125274, 2.762796, 0, 0.6470588, 1, 1,
0.1464529, 0.5003048, 0.00376646, 0, 0.6392157, 1, 1,
0.1499652, -1.65869, 2.032762, 0, 0.6352941, 1, 1,
0.1502994, -0.8521304, 2.4715, 0, 0.627451, 1, 1,
0.1525815, 0.8290385, 0.3766465, 0, 0.6235294, 1, 1,
0.1541406, -0.1648137, 3.033118, 0, 0.6156863, 1, 1,
0.1546085, -0.0006446262, 0.2585378, 0, 0.6117647, 1, 1,
0.1578351, -0.4248436, 4.484198, 0, 0.6039216, 1, 1,
0.1780751, 0.8982257, 0.6689559, 0, 0.5960785, 1, 1,
0.1793998, 1.076569, 0.4600299, 0, 0.5921569, 1, 1,
0.1810433, -0.2315848, 3.454564, 0, 0.5843138, 1, 1,
0.1811783, -1.14938, 3.568847, 0, 0.5803922, 1, 1,
0.1851863, 0.7570228, -1.191524, 0, 0.572549, 1, 1,
0.1883218, -0.1211042, -0.04707551, 0, 0.5686275, 1, 1,
0.1883973, 1.203344, 0.1640632, 0, 0.5607843, 1, 1,
0.1891589, -0.7599832, 2.35388, 0, 0.5568628, 1, 1,
0.1896248, -0.07636773, 2.716642, 0, 0.5490196, 1, 1,
0.191286, 0.2318522, 1.609256, 0, 0.5450981, 1, 1,
0.1914376, -0.5325231, 1.257668, 0, 0.5372549, 1, 1,
0.2008337, -0.2577519, 2.196769, 0, 0.5333334, 1, 1,
0.2009005, 1.230311, -0.5837975, 0, 0.5254902, 1, 1,
0.202644, 0.2768353, 0.8234499, 0, 0.5215687, 1, 1,
0.2033146, 2.424544, -0.04860672, 0, 0.5137255, 1, 1,
0.2052253, -1.546095, 3.225495, 0, 0.509804, 1, 1,
0.2063139, -0.6498323, 2.573821, 0, 0.5019608, 1, 1,
0.2080632, -0.388878, 3.411915, 0, 0.4941176, 1, 1,
0.210371, -1.104585, 1.761294, 0, 0.4901961, 1, 1,
0.2139854, -0.2480654, 4.05075, 0, 0.4823529, 1, 1,
0.2153583, 0.186503, 1.858335, 0, 0.4784314, 1, 1,
0.2162339, -0.06859285, 2.762681, 0, 0.4705882, 1, 1,
0.218309, -0.1119834, 2.484562, 0, 0.4666667, 1, 1,
0.2284382, 1.508844, -1.032629, 0, 0.4588235, 1, 1,
0.2301133, -0.2948962, 2.356177, 0, 0.454902, 1, 1,
0.2314521, 0.8605321, 0.4008944, 0, 0.4470588, 1, 1,
0.2345743, 0.6783324, 0.01563251, 0, 0.4431373, 1, 1,
0.2353983, -1.735107, 2.572097, 0, 0.4352941, 1, 1,
0.2383333, 0.8524, 1.288901, 0, 0.4313726, 1, 1,
0.2498815, 1.46769, -1.091255, 0, 0.4235294, 1, 1,
0.2520159, -0.6325367, 3.701219, 0, 0.4196078, 1, 1,
0.2567634, 0.3207269, 0.7298335, 0, 0.4117647, 1, 1,
0.257008, 0.05179446, 2.20444, 0, 0.4078431, 1, 1,
0.2572171, 0.6625419, 1.751971, 0, 0.4, 1, 1,
0.2578931, 1.543268, -1.157097, 0, 0.3921569, 1, 1,
0.2606554, 0.6307887, 0.4594388, 0, 0.3882353, 1, 1,
0.2632249, -0.5217573, 3.784671, 0, 0.3803922, 1, 1,
0.265439, -0.6920357, -0.3953336, 0, 0.3764706, 1, 1,
0.266144, -0.5530341, 3.485788, 0, 0.3686275, 1, 1,
0.2726916, -0.6350725, 0.7306873, 0, 0.3647059, 1, 1,
0.2790306, 0.07722303, 1.62084, 0, 0.3568628, 1, 1,
0.2828691, 0.1198178, 0.02549677, 0, 0.3529412, 1, 1,
0.2828991, -0.3688949, 1.912313, 0, 0.345098, 1, 1,
0.290408, 1.510307, 0.3767523, 0, 0.3411765, 1, 1,
0.2923602, -1.815872, 1.835041, 0, 0.3333333, 1, 1,
0.2930824, 1.175855, -0.01756163, 0, 0.3294118, 1, 1,
0.2980025, 1.906657, 1.476438, 0, 0.3215686, 1, 1,
0.2993514, -0.1034212, 1.613804, 0, 0.3176471, 1, 1,
0.3005498, -0.7024431, 3.57065, 0, 0.3098039, 1, 1,
0.3005934, -0.73997, 2.485544, 0, 0.3058824, 1, 1,
0.3006329, 0.05654727, 1.167221, 0, 0.2980392, 1, 1,
0.3037369, 0.9622663, 0.9337196, 0, 0.2901961, 1, 1,
0.3049386, 0.007769579, 2.663085, 0, 0.2862745, 1, 1,
0.3074302, 1.503856, -0.488812, 0, 0.2784314, 1, 1,
0.317581, -1.117355, 2.715374, 0, 0.2745098, 1, 1,
0.3180074, -1.10232, 2.261927, 0, 0.2666667, 1, 1,
0.3193411, 1.687668, 0.2399822, 0, 0.2627451, 1, 1,
0.321665, -0.4460868, 1.98392, 0, 0.254902, 1, 1,
0.326984, 0.9906353, 1.398694, 0, 0.2509804, 1, 1,
0.3285648, -0.3011428, 2.654118, 0, 0.2431373, 1, 1,
0.3339739, 0.6981096, -0.3190608, 0, 0.2392157, 1, 1,
0.3360226, -0.9398718, 3.366456, 0, 0.2313726, 1, 1,
0.3360519, -0.6055025, 3.358918, 0, 0.227451, 1, 1,
0.3368251, -0.7849223, 3.835202, 0, 0.2196078, 1, 1,
0.3415087, 2.021508, -1.292645, 0, 0.2156863, 1, 1,
0.3421464, 0.1826943, 0.8542357, 0, 0.2078431, 1, 1,
0.3425207, -0.3994107, 3.369964, 0, 0.2039216, 1, 1,
0.3429637, -0.6662862, 2.416207, 0, 0.1960784, 1, 1,
0.346157, -1.317014, 3.543229, 0, 0.1882353, 1, 1,
0.3462882, 0.09192854, 1.87819, 0, 0.1843137, 1, 1,
0.3492447, -0.06593671, 3.024409, 0, 0.1764706, 1, 1,
0.3529029, -1.212605, 4.41863, 0, 0.172549, 1, 1,
0.3572229, -0.3283224, 3.978346, 0, 0.1647059, 1, 1,
0.358577, -0.6374454, 3.193532, 0, 0.1607843, 1, 1,
0.3611558, -1.04716, 3.303778, 0, 0.1529412, 1, 1,
0.3633547, 0.8691572, 0.4148496, 0, 0.1490196, 1, 1,
0.3638248, 0.2099973, 0.1802414, 0, 0.1411765, 1, 1,
0.3644194, 0.2036054, 3.141952, 0, 0.1372549, 1, 1,
0.367549, -0.3672508, 2.92736, 0, 0.1294118, 1, 1,
0.368015, 0.4741388, 1.078754, 0, 0.1254902, 1, 1,
0.3686261, -0.3966207, 2.650558, 0, 0.1176471, 1, 1,
0.3687318, 0.5709277, 0.9953836, 0, 0.1137255, 1, 1,
0.3727323, 0.9168532, 2.41513, 0, 0.1058824, 1, 1,
0.3731041, -0.8338772, 1.278802, 0, 0.09803922, 1, 1,
0.374461, 0.10678, 1.288394, 0, 0.09411765, 1, 1,
0.3751135, 0.2934928, 1.481616, 0, 0.08627451, 1, 1,
0.3791657, -2.147825, 2.866516, 0, 0.08235294, 1, 1,
0.3803137, -0.6980743, 2.454552, 0, 0.07450981, 1, 1,
0.385574, -0.02464621, 2.290739, 0, 0.07058824, 1, 1,
0.3930665, 0.2353982, -0.5822545, 0, 0.0627451, 1, 1,
0.39845, -1.285031, 2.665959, 0, 0.05882353, 1, 1,
0.4003202, -0.06785465, 3.512757, 0, 0.05098039, 1, 1,
0.4038883, 0.2243478, 1.919803, 0, 0.04705882, 1, 1,
0.4043173, -1.782031, 2.441309, 0, 0.03921569, 1, 1,
0.4079839, -0.2078815, 2.175988, 0, 0.03529412, 1, 1,
0.4107021, 1.389903, 1.512372, 0, 0.02745098, 1, 1,
0.4129085, 0.2363073, 0.1192572, 0, 0.02352941, 1, 1,
0.413882, 0.273081, 1.989461, 0, 0.01568628, 1, 1,
0.4177995, -0.6202403, 1.256459, 0, 0.01176471, 1, 1,
0.4262472, -0.8934618, 3.466549, 0, 0.003921569, 1, 1,
0.4330894, -0.3897937, 1.823956, 0.003921569, 0, 1, 1,
0.435503, -1.507781, 2.250976, 0.007843138, 0, 1, 1,
0.4391102, 0.5343973, 1.16853, 0.01568628, 0, 1, 1,
0.4446071, 0.1883062, 1.417264, 0.01960784, 0, 1, 1,
0.4482208, -0.6431713, 2.857819, 0.02745098, 0, 1, 1,
0.4487107, -0.1841081, 2.288288, 0.03137255, 0, 1, 1,
0.4543748, -2.000611, 4.149805, 0.03921569, 0, 1, 1,
0.4546144, 0.4235086, 0.9699296, 0.04313726, 0, 1, 1,
0.4563252, 0.11862, 0.8118231, 0.05098039, 0, 1, 1,
0.4600648, -0.2138218, 3.788596, 0.05490196, 0, 1, 1,
0.4703022, -0.4473902, 1.943188, 0.0627451, 0, 1, 1,
0.4712167, 0.9902543, -0.3447881, 0.06666667, 0, 1, 1,
0.4785703, 1.29882, -0.1235294, 0.07450981, 0, 1, 1,
0.481261, -1.356066, 3.171396, 0.07843138, 0, 1, 1,
0.4819297, -0.3314316, 2.97632, 0.08627451, 0, 1, 1,
0.4820828, -0.6327648, 1.33308, 0.09019608, 0, 1, 1,
0.4837148, -0.3203605, 2.99851, 0.09803922, 0, 1, 1,
0.4857529, 2.242059, -0.4018199, 0.1058824, 0, 1, 1,
0.4873905, -0.2702688, 1.12128, 0.1098039, 0, 1, 1,
0.4928195, 1.000771, 0.5923864, 0.1176471, 0, 1, 1,
0.4970186, -0.1358198, 2.905046, 0.1215686, 0, 1, 1,
0.5011541, 0.2833281, 2.295038, 0.1294118, 0, 1, 1,
0.5064167, 0.585039, 2.693173, 0.1333333, 0, 1, 1,
0.5068856, 0.2891905, 2.466807, 0.1411765, 0, 1, 1,
0.5077298, 0.9284899, -0.7671306, 0.145098, 0, 1, 1,
0.5134282, -0.1464813, 1.322054, 0.1529412, 0, 1, 1,
0.52029, 0.8394138, 0.7472713, 0.1568628, 0, 1, 1,
0.5203516, -1.185863, 2.226918, 0.1647059, 0, 1, 1,
0.521692, 0.456764, -0.3709457, 0.1686275, 0, 1, 1,
0.5226647, -0.2784481, 2.131435, 0.1764706, 0, 1, 1,
0.5274228, -0.08861104, 2.124322, 0.1803922, 0, 1, 1,
0.527967, -1.25403, 2.240226, 0.1882353, 0, 1, 1,
0.5287681, 0.8521231, -0.1819335, 0.1921569, 0, 1, 1,
0.5348101, 0.8725976, 1.437261, 0.2, 0, 1, 1,
0.5371193, 1.129902, 0.1599502, 0.2078431, 0, 1, 1,
0.5506303, 0.6653043, 1.168337, 0.2117647, 0, 1, 1,
0.5511994, -0.5316725, 0.08835983, 0.2196078, 0, 1, 1,
0.5531089, 0.1428934, 2.861938, 0.2235294, 0, 1, 1,
0.5532466, -0.04594317, 2.746833, 0.2313726, 0, 1, 1,
0.5546072, -1.262127, 2.892952, 0.2352941, 0, 1, 1,
0.5725601, -0.8333201, 2.986616, 0.2431373, 0, 1, 1,
0.5736655, 1.588306, -0.9682908, 0.2470588, 0, 1, 1,
0.5747365, -0.05882634, 0.8221512, 0.254902, 0, 1, 1,
0.5788752, -0.8448647, 1.538147, 0.2588235, 0, 1, 1,
0.5817296, -0.3157159, 0.6196637, 0.2666667, 0, 1, 1,
0.5884893, 0.06697294, 1.893035, 0.2705882, 0, 1, 1,
0.5907142, -1.403706, 5.164876, 0.2784314, 0, 1, 1,
0.5944489, -0.2696833, 3.782973, 0.282353, 0, 1, 1,
0.5957558, -1.437233, 1.331514, 0.2901961, 0, 1, 1,
0.5981283, -0.4097083, 2.623227, 0.2941177, 0, 1, 1,
0.5995892, 2.558331, 0.0679359, 0.3019608, 0, 1, 1,
0.6064247, -1.921695, 3.968957, 0.3098039, 0, 1, 1,
0.6068972, -0.4689762, 2.296871, 0.3137255, 0, 1, 1,
0.6077892, -0.4849798, 1.181705, 0.3215686, 0, 1, 1,
0.6089613, -0.500185, 1.846399, 0.3254902, 0, 1, 1,
0.6098549, -0.4198413, 3.433849, 0.3333333, 0, 1, 1,
0.610319, -0.4156362, 1.289772, 0.3372549, 0, 1, 1,
0.6112256, 0.793842, 2.19495, 0.345098, 0, 1, 1,
0.6120054, -0.2229616, 1.203097, 0.3490196, 0, 1, 1,
0.6127605, 1.353999, 0.6855256, 0.3568628, 0, 1, 1,
0.6145314, 1.462559, -0.9683527, 0.3607843, 0, 1, 1,
0.6145382, -0.4122883, 2.062086, 0.3686275, 0, 1, 1,
0.6172615, -1.451712, 1.990468, 0.372549, 0, 1, 1,
0.6173952, 1.073255, 1.377113, 0.3803922, 0, 1, 1,
0.617745, -0.564014, 2.834151, 0.3843137, 0, 1, 1,
0.6188918, 0.8266561, 2.678529, 0.3921569, 0, 1, 1,
0.6209105, 0.150434, 0.5730861, 0.3960784, 0, 1, 1,
0.6211718, -1.225709, 2.029525, 0.4039216, 0, 1, 1,
0.6251878, 0.8942607, -0.5455416, 0.4117647, 0, 1, 1,
0.6276985, -0.7126946, 1.277194, 0.4156863, 0, 1, 1,
0.6439271, 0.8926322, 0.989246, 0.4235294, 0, 1, 1,
0.6444693, 0.03297858, 0.9092714, 0.427451, 0, 1, 1,
0.6476285, 0.08496363, 3.120095, 0.4352941, 0, 1, 1,
0.6507303, 0.484207, 2.303767, 0.4392157, 0, 1, 1,
0.6579024, -0.912899, 1.781201, 0.4470588, 0, 1, 1,
0.6614367, 0.5084478, -1.030562, 0.4509804, 0, 1, 1,
0.662859, -0.35355, 0.6698882, 0.4588235, 0, 1, 1,
0.6697319, 1.486053, -0.3489348, 0.4627451, 0, 1, 1,
0.6707863, -1.476949, 3.240169, 0.4705882, 0, 1, 1,
0.6715246, 1.660865, -0.1192295, 0.4745098, 0, 1, 1,
0.6726431, -0.5652888, 3.379461, 0.4823529, 0, 1, 1,
0.6767933, 0.8627071, -0.1638417, 0.4862745, 0, 1, 1,
0.6786423, 0.3293938, 1.130249, 0.4941176, 0, 1, 1,
0.6819227, 0.9094602, -1.206453, 0.5019608, 0, 1, 1,
0.6821926, 0.9088489, 0.5503993, 0.5058824, 0, 1, 1,
0.6827897, -0.06335488, 0.9302886, 0.5137255, 0, 1, 1,
0.6896673, 0.1624384, 0.2162976, 0.5176471, 0, 1, 1,
0.6897914, 1.13194, 0.6481003, 0.5254902, 0, 1, 1,
0.6914861, -2.713662, 2.366662, 0.5294118, 0, 1, 1,
0.6938446, 0.4457593, 0.0970099, 0.5372549, 0, 1, 1,
0.699644, -2.015594, 2.785012, 0.5411765, 0, 1, 1,
0.7005342, -0.6202669, 2.750836, 0.5490196, 0, 1, 1,
0.7066109, -1.591594, 4.13404, 0.5529412, 0, 1, 1,
0.7133875, -0.1735358, 1.851839, 0.5607843, 0, 1, 1,
0.7161378, 0.6166942, 0.2715883, 0.5647059, 0, 1, 1,
0.7272156, 0.1749407, 0.3565438, 0.572549, 0, 1, 1,
0.7274544, -0.7324699, 3.255932, 0.5764706, 0, 1, 1,
0.7278644, -0.1999468, 2.262333, 0.5843138, 0, 1, 1,
0.7280021, 1.295426, 1.235874, 0.5882353, 0, 1, 1,
0.7373413, 0.4572731, 0.8390029, 0.5960785, 0, 1, 1,
0.7420076, -1.581936, 4.814428, 0.6039216, 0, 1, 1,
0.7434489, -1.875708, 3.520869, 0.6078432, 0, 1, 1,
0.7494444, 0.5939364, 1.773744, 0.6156863, 0, 1, 1,
0.7535566, 0.240324, 1.101242, 0.6196079, 0, 1, 1,
0.7550052, 0.9029969, 0.8560007, 0.627451, 0, 1, 1,
0.7570763, -0.6015537, 2.509997, 0.6313726, 0, 1, 1,
0.762042, 1.874687, 1.281301, 0.6392157, 0, 1, 1,
0.762139, 0.9547368, 2.297011, 0.6431373, 0, 1, 1,
0.769604, 0.07706936, 1.410499, 0.6509804, 0, 1, 1,
0.7703671, 0.794205, 1.616293, 0.654902, 0, 1, 1,
0.770479, 0.9754719, 0.7790061, 0.6627451, 0, 1, 1,
0.7746595, -1.144867, 3.21158, 0.6666667, 0, 1, 1,
0.7756951, 0.27386, 2.200129, 0.6745098, 0, 1, 1,
0.7759586, 1.266673, 0.7911185, 0.6784314, 0, 1, 1,
0.7812516, 1.121451, 2.781629, 0.6862745, 0, 1, 1,
0.7831719, 0.04950198, 1.189015, 0.6901961, 0, 1, 1,
0.7858499, 0.2946322, 0.8697451, 0.6980392, 0, 1, 1,
0.7886512, 1.056363, 2.042563, 0.7058824, 0, 1, 1,
0.7912929, 0.3885304, 0.9169108, 0.7098039, 0, 1, 1,
0.797772, 1.635399, -1.468116, 0.7176471, 0, 1, 1,
0.7978091, 0.01231273, 1.453828, 0.7215686, 0, 1, 1,
0.80624, 0.1591265, 1.096173, 0.7294118, 0, 1, 1,
0.8099214, 0.8532684, -0.1365443, 0.7333333, 0, 1, 1,
0.8168368, -0.7925031, 3.023198, 0.7411765, 0, 1, 1,
0.8185977, 0.2792637, 0.7249517, 0.7450981, 0, 1, 1,
0.8309755, 0.8735545, 1.652492, 0.7529412, 0, 1, 1,
0.8352023, 0.5606312, -0.07926402, 0.7568628, 0, 1, 1,
0.8362297, 0.6571099, 2.542057, 0.7647059, 0, 1, 1,
0.8374786, -0.9994959, 2.982121, 0.7686275, 0, 1, 1,
0.8450581, 0.1643463, 1.087493, 0.7764706, 0, 1, 1,
0.847807, -0.6165773, 2.552573, 0.7803922, 0, 1, 1,
0.8493675, 1.413635, -1.690258, 0.7882353, 0, 1, 1,
0.8509977, -0.2108356, 0.6168214, 0.7921569, 0, 1, 1,
0.851536, 1.466525, 2.819777, 0.8, 0, 1, 1,
0.8536048, -1.454385, 2.19653, 0.8078431, 0, 1, 1,
0.8568935, -0.07597255, 0.7083391, 0.8117647, 0, 1, 1,
0.8571635, -0.9147919, 2.63655, 0.8196079, 0, 1, 1,
0.8635587, -0.1899647, 0.8415231, 0.8235294, 0, 1, 1,
0.8635752, -0.7197922, 1.329706, 0.8313726, 0, 1, 1,
0.8644556, -0.6464561, 1.946099, 0.8352941, 0, 1, 1,
0.8663604, -0.03715012, 1.601237, 0.8431373, 0, 1, 1,
0.8721464, -0.1968147, 1.915122, 0.8470588, 0, 1, 1,
0.8721712, -1.786117, 1.502164, 0.854902, 0, 1, 1,
0.8783847, 0.5156121, 2.009164, 0.8588235, 0, 1, 1,
0.8816746, 1.202722, -0.2563499, 0.8666667, 0, 1, 1,
0.8925396, 1.042075, 1.619743, 0.8705882, 0, 1, 1,
0.8946741, 0.8058461, 2.386332, 0.8784314, 0, 1, 1,
0.89512, 1.153285, -0.0765987, 0.8823529, 0, 1, 1,
0.898637, -0.7650042, 4.062474, 0.8901961, 0, 1, 1,
0.8990926, 2.630947, 0.07612286, 0.8941177, 0, 1, 1,
0.9023955, -0.08591933, 1.738366, 0.9019608, 0, 1, 1,
0.9037925, 1.683819, -0.1635166, 0.9098039, 0, 1, 1,
0.9110267, -0.3274126, 1.125496, 0.9137255, 0, 1, 1,
0.9124058, 1.135135, -0.4895557, 0.9215686, 0, 1, 1,
0.9139623, -0.2450232, 2.486865, 0.9254902, 0, 1, 1,
0.9157953, -1.184546, 3.45833, 0.9333333, 0, 1, 1,
0.9199209, -0.7949111, 0.8081841, 0.9372549, 0, 1, 1,
0.9224183, -0.4476315, 2.11039, 0.945098, 0, 1, 1,
0.9258158, 2.319313, 0.5218312, 0.9490196, 0, 1, 1,
0.9274731, 1.180639, 1.144787, 0.9568627, 0, 1, 1,
0.9334632, -0.6435744, 2.812893, 0.9607843, 0, 1, 1,
0.9382345, -0.3646962, 1.724768, 0.9686275, 0, 1, 1,
0.9384004, 1.583282, 1.520554, 0.972549, 0, 1, 1,
0.9402336, -1.475876, 2.133919, 0.9803922, 0, 1, 1,
0.9450551, -0.7480419, 0.5648057, 0.9843137, 0, 1, 1,
0.9450626, -0.1393898, 2.64713, 0.9921569, 0, 1, 1,
0.9507182, 1.245798, -1.182202, 0.9960784, 0, 1, 1,
0.951053, -0.7871071, 1.484676, 1, 0, 0.9960784, 1,
0.9521418, -0.1540494, 2.144523, 1, 0, 0.9882353, 1,
0.960058, -0.1506785, 1.303362, 1, 0, 0.9843137, 1,
0.9630075, -0.2563764, -0.2359782, 1, 0, 0.9764706, 1,
0.9667186, -0.1798099, 1.979429, 1, 0, 0.972549, 1,
0.9713627, -1.343966, 2.263646, 1, 0, 0.9647059, 1,
0.9782845, 2.795534, -1.542388, 1, 0, 0.9607843, 1,
0.9821783, 0.4626983, 1.526825, 1, 0, 0.9529412, 1,
0.9849002, 0.6780791, 0.07848883, 1, 0, 0.9490196, 1,
0.9881092, 0.1089976, 2.3138, 1, 0, 0.9411765, 1,
0.9902117, -1.815184, 2.11939, 1, 0, 0.9372549, 1,
1.003767, -0.07483881, 1.432286, 1, 0, 0.9294118, 1,
1.004603, 1.188898, 0.5994173, 1, 0, 0.9254902, 1,
1.007238, 1.394506, 0.2013798, 1, 0, 0.9176471, 1,
1.007608, -0.562442, 2.15979, 1, 0, 0.9137255, 1,
1.007805, 0.2368688, 0.7532871, 1, 0, 0.9058824, 1,
1.010846, -2.019032, 3.247504, 1, 0, 0.9019608, 1,
1.014389, 0.2034594, 1.902805, 1, 0, 0.8941177, 1,
1.02875, -0.04998051, -0.06574664, 1, 0, 0.8862745, 1,
1.033011, 0.5548659, -0.3428565, 1, 0, 0.8823529, 1,
1.036698, 0.2749027, 0.6858586, 1, 0, 0.8745098, 1,
1.041249, 1.345934, 0.9568963, 1, 0, 0.8705882, 1,
1.042946, -0.9930613, 1.247976, 1, 0, 0.8627451, 1,
1.046947, 0.0717432, 0.5843275, 1, 0, 0.8588235, 1,
1.054252, 0.893752, 0.8873985, 1, 0, 0.8509804, 1,
1.060777, 0.2181809, 0.5929253, 1, 0, 0.8470588, 1,
1.064305, -1.438065, 2.341827, 1, 0, 0.8392157, 1,
1.06666, -2.113907, 2.953796, 1, 0, 0.8352941, 1,
1.088326, -0.1141307, 2.166722, 1, 0, 0.827451, 1,
1.091415, -0.1356783, 0.06612356, 1, 0, 0.8235294, 1,
1.091624, -2.434481, 3.473439, 1, 0, 0.8156863, 1,
1.10266, -0.3301015, 0.7850915, 1, 0, 0.8117647, 1,
1.106108, 0.8698352, -1.0071, 1, 0, 0.8039216, 1,
1.112348, -0.9509706, 2.850204, 1, 0, 0.7960784, 1,
1.122087, -0.1315897, 2.217688, 1, 0, 0.7921569, 1,
1.1303, -0.3115031, 1.859871, 1, 0, 0.7843137, 1,
1.130952, -0.3814376, 0.3328999, 1, 0, 0.7803922, 1,
1.133221, 0.8294989, 0.03305839, 1, 0, 0.772549, 1,
1.135792, 0.7882817, -0.8861625, 1, 0, 0.7686275, 1,
1.137005, -0.5334854, 1.091084, 1, 0, 0.7607843, 1,
1.14295, -2.302718, 2.179868, 1, 0, 0.7568628, 1,
1.147364, -1.827466, 2.033018, 1, 0, 0.7490196, 1,
1.147593, -1.156471, 2.268301, 1, 0, 0.7450981, 1,
1.157727, -0.04782825, 0.7792592, 1, 0, 0.7372549, 1,
1.162785, -0.4774135, 2.225127, 1, 0, 0.7333333, 1,
1.166801, -0.9051204, 2.162667, 1, 0, 0.7254902, 1,
1.181481, 0.05469873, 3.24028, 1, 0, 0.7215686, 1,
1.181633, 0.4541106, 1.675868, 1, 0, 0.7137255, 1,
1.183702, -0.09480994, 0.0777164, 1, 0, 0.7098039, 1,
1.198877, 1.052394, 0.9091531, 1, 0, 0.7019608, 1,
1.206654, -1.121305, 2.4679, 1, 0, 0.6941177, 1,
1.215521, -0.4314109, 1.114657, 1, 0, 0.6901961, 1,
1.228893, -0.3633429, 2.775559, 1, 0, 0.682353, 1,
1.230374, 0.4290645, -0.5090741, 1, 0, 0.6784314, 1,
1.234915, 0.5507359, 1.600997, 1, 0, 0.6705883, 1,
1.238271, -1.472116, 2.126862, 1, 0, 0.6666667, 1,
1.251419, 0.1314961, 2.15688, 1, 0, 0.6588235, 1,
1.256612, -0.6182296, 1.798873, 1, 0, 0.654902, 1,
1.260365, 1.926369, 0.9446408, 1, 0, 0.6470588, 1,
1.270676, 0.7713396, 2.155859, 1, 0, 0.6431373, 1,
1.272892, 0.2954409, 3.770195, 1, 0, 0.6352941, 1,
1.280694, -2.248135, 2.14106, 1, 0, 0.6313726, 1,
1.285547, -0.4001554, 1.114535, 1, 0, 0.6235294, 1,
1.286998, -1.209143, 2.374628, 1, 0, 0.6196079, 1,
1.288998, 1.323098, 1.237717, 1, 0, 0.6117647, 1,
1.291029, -0.03701329, 1.908387, 1, 0, 0.6078432, 1,
1.291861, -0.08524748, 3.018995, 1, 0, 0.6, 1,
1.29889, 0.6367705, 1.101079, 1, 0, 0.5921569, 1,
1.311443, -0.9775746, 1.77083, 1, 0, 0.5882353, 1,
1.325738, -1.283089, 1.903872, 1, 0, 0.5803922, 1,
1.331411, -0.1590492, 0.384561, 1, 0, 0.5764706, 1,
1.335402, -0.7861947, 2.280562, 1, 0, 0.5686275, 1,
1.336612, -0.5118135, 1.804338, 1, 0, 0.5647059, 1,
1.34736, -0.4011709, 2.089599, 1, 0, 0.5568628, 1,
1.359251, 0.04589552, 2.492591, 1, 0, 0.5529412, 1,
1.364046, 0.05677297, 1.410167, 1, 0, 0.5450981, 1,
1.372539, 0.9125133, 0.469148, 1, 0, 0.5411765, 1,
1.373212, -0.3421925, 1.725666, 1, 0, 0.5333334, 1,
1.37982, -1.660961, 0.5094039, 1, 0, 0.5294118, 1,
1.380845, 0.5793252, 1.54642, 1, 0, 0.5215687, 1,
1.381512, -1.251985, 1.235564, 1, 0, 0.5176471, 1,
1.383539, 0.4020976, 0.1381517, 1, 0, 0.509804, 1,
1.384415, -1.284497, 4.652974, 1, 0, 0.5058824, 1,
1.386399, 0.5342678, 2.573408, 1, 0, 0.4980392, 1,
1.401146, -0.2599645, 0.4460683, 1, 0, 0.4901961, 1,
1.407072, -0.9999458, 3.819229, 1, 0, 0.4862745, 1,
1.410689, -1.062487, 0.992365, 1, 0, 0.4784314, 1,
1.41608, -0.4783041, 1.016751, 1, 0, 0.4745098, 1,
1.418602, -2.1154, 2.168132, 1, 0, 0.4666667, 1,
1.433391, 0.9039742, 1.152421, 1, 0, 0.4627451, 1,
1.447142, -0.02816567, 1.228841, 1, 0, 0.454902, 1,
1.452374, -0.3918807, 2.638158, 1, 0, 0.4509804, 1,
1.460106, -0.8631894, 1.598239, 1, 0, 0.4431373, 1,
1.461041, 0.7310601, 2.016712, 1, 0, 0.4392157, 1,
1.464989, -0.7045544, 0.6942394, 1, 0, 0.4313726, 1,
1.472928, 0.6619959, 1.288928, 1, 0, 0.427451, 1,
1.475699, -1.784888, 4.082315, 1, 0, 0.4196078, 1,
1.490934, 1.175791, 0.2990524, 1, 0, 0.4156863, 1,
1.497223, 1.036848, 1.534675, 1, 0, 0.4078431, 1,
1.508711, -0.1413916, 2.38632, 1, 0, 0.4039216, 1,
1.511918, 0.371568, 0.03152596, 1, 0, 0.3960784, 1,
1.514104, 0.1347396, 1.312403, 1, 0, 0.3882353, 1,
1.518263, 0.2806635, 0.3251577, 1, 0, 0.3843137, 1,
1.521038, -0.8337629, 1.634157, 1, 0, 0.3764706, 1,
1.524787, -0.3197572, -0.3408742, 1, 0, 0.372549, 1,
1.550217, 1.400612, 0.5806298, 1, 0, 0.3647059, 1,
1.557279, 0.4025696, -0.4968277, 1, 0, 0.3607843, 1,
1.584217, 0.5661011, 0.2701001, 1, 0, 0.3529412, 1,
1.600638, -1.898028, 2.659523, 1, 0, 0.3490196, 1,
1.605954, -0.9582127, 4.229785, 1, 0, 0.3411765, 1,
1.618767, 0.5230739, 0.06356079, 1, 0, 0.3372549, 1,
1.619914, -0.6519836, 0.6985383, 1, 0, 0.3294118, 1,
1.620423, 0.25804, 1.35421, 1, 0, 0.3254902, 1,
1.621283, 0.1800046, 1.147053, 1, 0, 0.3176471, 1,
1.640651, -0.08514163, 1.564914, 1, 0, 0.3137255, 1,
1.655049, 1.119504, 0.849927, 1, 0, 0.3058824, 1,
1.6663, 0.03891671, 2.042583, 1, 0, 0.2980392, 1,
1.699642, 0.8790943, 1.767023, 1, 0, 0.2941177, 1,
1.70628, -0.1678671, 3.588449, 1, 0, 0.2862745, 1,
1.707618, -0.4217147, 0.1473889, 1, 0, 0.282353, 1,
1.721286, -0.2852194, 1.072517, 1, 0, 0.2745098, 1,
1.768162, -1.089242, 3.709777, 1, 0, 0.2705882, 1,
1.777326, 0.7957544, 0.7259139, 1, 0, 0.2627451, 1,
1.781322, 0.4881974, 1.423997, 1, 0, 0.2588235, 1,
1.790045, 1.509208, 0.4917843, 1, 0, 0.2509804, 1,
1.795263, 0.06716011, 1.035645, 1, 0, 0.2470588, 1,
1.803089, 1.767491, 0.800648, 1, 0, 0.2392157, 1,
1.818262, -0.851052, 0.4082038, 1, 0, 0.2352941, 1,
1.83472, -0.05474421, 3.034113, 1, 0, 0.227451, 1,
1.840516, -0.1882077, 2.592126, 1, 0, 0.2235294, 1,
1.840943, 1.904888, 0.03240456, 1, 0, 0.2156863, 1,
1.846797, 1.476006, 0.5300797, 1, 0, 0.2117647, 1,
1.875068, -2.367713, 2.110588, 1, 0, 0.2039216, 1,
1.877715, 1.270794, 0.4010811, 1, 0, 0.1960784, 1,
1.880416, 0.6798905, 1.200135, 1, 0, 0.1921569, 1,
1.882323, -0.6876595, 3.935196, 1, 0, 0.1843137, 1,
1.910508, -0.2194766, 2.114105, 1, 0, 0.1803922, 1,
1.931406, 2.264692, 0.613603, 1, 0, 0.172549, 1,
1.951046, 0.3430144, 0.8446439, 1, 0, 0.1686275, 1,
1.959331, -0.005689859, 1.969869, 1, 0, 0.1607843, 1,
1.973645, -0.01165168, -0.4459789, 1, 0, 0.1568628, 1,
1.986704, 0.39248, 1.472108, 1, 0, 0.1490196, 1,
2.043121, 0.3837908, 1.220462, 1, 0, 0.145098, 1,
2.047669, -0.5975527, 2.542216, 1, 0, 0.1372549, 1,
2.061837, 1.413085, -1.155305, 1, 0, 0.1333333, 1,
2.085016, -0.9648505, 2.396291, 1, 0, 0.1254902, 1,
2.096431, -0.4206043, 2.279255, 1, 0, 0.1215686, 1,
2.111428, -1.044931, 3.50964, 1, 0, 0.1137255, 1,
2.143452, -1.40958, -0.4178829, 1, 0, 0.1098039, 1,
2.159253, -0.6084101, 0.1027544, 1, 0, 0.1019608, 1,
2.175104, 0.9747483, 0.9083933, 1, 0, 0.09411765, 1,
2.186444, 0.2257657, -1.600324, 1, 0, 0.09019608, 1,
2.283586, 0.8058388, 1.541489, 1, 0, 0.08235294, 1,
2.292312, -0.3784988, 2.046829, 1, 0, 0.07843138, 1,
2.309949, 0.3344947, 2.841662, 1, 0, 0.07058824, 1,
2.315467, 0.2290867, 2.13985, 1, 0, 0.06666667, 1,
2.37531, 0.7960247, -0.8641024, 1, 0, 0.05882353, 1,
2.383943, 0.1181776, 0.7161832, 1, 0, 0.05490196, 1,
2.415576, 0.4201706, 1.29262, 1, 0, 0.04705882, 1,
2.456185, 0.4974709, 2.338399, 1, 0, 0.04313726, 1,
2.558567, 0.1097787, 0.8690124, 1, 0, 0.03529412, 1,
2.696914, -2.479258, 1.646838, 1, 0, 0.03137255, 1,
2.824474, -0.9930006, 2.189298, 1, 0, 0.02352941, 1,
2.890477, 0.3683457, 2.17859, 1, 0, 0.01960784, 1,
2.937159, 0.5412035, 2.039174, 1, 0, 0.01176471, 1,
3.609324, 0.494306, 0.6591341, 1, 0, 0.007843138, 1
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
-0.06471038, -4.099182, -6.803719, 0, -0.5, 0.5, 0.5,
-0.06471038, -4.099182, -6.803719, 1, -0.5, 0.5, 0.5,
-0.06471038, -4.099182, -6.803719, 1, 1.5, 0.5, 0.5,
-0.06471038, -4.099182, -6.803719, 0, 1.5, 0.5, 0.5
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
-4.984242, 0.2265713, -6.803719, 0, -0.5, 0.5, 0.5,
-4.984242, 0.2265713, -6.803719, 1, -0.5, 0.5, 0.5,
-4.984242, 0.2265713, -6.803719, 1, 1.5, 0.5, 0.5,
-4.984242, 0.2265713, -6.803719, 0, 1.5, 0.5, 0.5
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
-4.984242, -4.099182, 0.04790521, 0, -0.5, 0.5, 0.5,
-4.984242, -4.099182, 0.04790521, 1, -0.5, 0.5, 0.5,
-4.984242, -4.099182, 0.04790521, 1, 1.5, 0.5, 0.5,
-4.984242, -4.099182, 0.04790521, 0, 1.5, 0.5, 0.5
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
-2, -3.100931, -5.222575,
2, -3.100931, -5.222575,
-2, -3.100931, -5.222575,
-2, -3.267306, -5.486099,
0, -3.100931, -5.222575,
0, -3.267306, -5.486099,
2, -3.100931, -5.222575,
2, -3.267306, -5.486099
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
-2, -3.600056, -6.013147, 0, -0.5, 0.5, 0.5,
-2, -3.600056, -6.013147, 1, -0.5, 0.5, 0.5,
-2, -3.600056, -6.013147, 1, 1.5, 0.5, 0.5,
-2, -3.600056, -6.013147, 0, 1.5, 0.5, 0.5,
0, -3.600056, -6.013147, 0, -0.5, 0.5, 0.5,
0, -3.600056, -6.013147, 1, -0.5, 0.5, 0.5,
0, -3.600056, -6.013147, 1, 1.5, 0.5, 0.5,
0, -3.600056, -6.013147, 0, 1.5, 0.5, 0.5,
2, -3.600056, -6.013147, 0, -0.5, 0.5, 0.5,
2, -3.600056, -6.013147, 1, -0.5, 0.5, 0.5,
2, -3.600056, -6.013147, 1, 1.5, 0.5, 0.5,
2, -3.600056, -6.013147, 0, 1.5, 0.5, 0.5
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
-3.848965, -3, -5.222575,
-3.848965, 3, -5.222575,
-3.848965, -3, -5.222575,
-4.038178, -3, -5.486099,
-3.848965, -2, -5.222575,
-4.038178, -2, -5.486099,
-3.848965, -1, -5.222575,
-4.038178, -1, -5.486099,
-3.848965, 0, -5.222575,
-4.038178, 0, -5.486099,
-3.848965, 1, -5.222575,
-4.038178, 1, -5.486099,
-3.848965, 2, -5.222575,
-4.038178, 2, -5.486099,
-3.848965, 3, -5.222575,
-4.038178, 3, -5.486099
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
-4.416604, -3, -6.013147, 0, -0.5, 0.5, 0.5,
-4.416604, -3, -6.013147, 1, -0.5, 0.5, 0.5,
-4.416604, -3, -6.013147, 1, 1.5, 0.5, 0.5,
-4.416604, -3, -6.013147, 0, 1.5, 0.5, 0.5,
-4.416604, -2, -6.013147, 0, -0.5, 0.5, 0.5,
-4.416604, -2, -6.013147, 1, -0.5, 0.5, 0.5,
-4.416604, -2, -6.013147, 1, 1.5, 0.5, 0.5,
-4.416604, -2, -6.013147, 0, 1.5, 0.5, 0.5,
-4.416604, -1, -6.013147, 0, -0.5, 0.5, 0.5,
-4.416604, -1, -6.013147, 1, -0.5, 0.5, 0.5,
-4.416604, -1, -6.013147, 1, 1.5, 0.5, 0.5,
-4.416604, -1, -6.013147, 0, 1.5, 0.5, 0.5,
-4.416604, 0, -6.013147, 0, -0.5, 0.5, 0.5,
-4.416604, 0, -6.013147, 1, -0.5, 0.5, 0.5,
-4.416604, 0, -6.013147, 1, 1.5, 0.5, 0.5,
-4.416604, 0, -6.013147, 0, 1.5, 0.5, 0.5,
-4.416604, 1, -6.013147, 0, -0.5, 0.5, 0.5,
-4.416604, 1, -6.013147, 1, -0.5, 0.5, 0.5,
-4.416604, 1, -6.013147, 1, 1.5, 0.5, 0.5,
-4.416604, 1, -6.013147, 0, 1.5, 0.5, 0.5,
-4.416604, 2, -6.013147, 0, -0.5, 0.5, 0.5,
-4.416604, 2, -6.013147, 1, -0.5, 0.5, 0.5,
-4.416604, 2, -6.013147, 1, 1.5, 0.5, 0.5,
-4.416604, 2, -6.013147, 0, 1.5, 0.5, 0.5,
-4.416604, 3, -6.013147, 0, -0.5, 0.5, 0.5,
-4.416604, 3, -6.013147, 1, -0.5, 0.5, 0.5,
-4.416604, 3, -6.013147, 1, 1.5, 0.5, 0.5,
-4.416604, 3, -6.013147, 0, 1.5, 0.5, 0.5
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
-3.848965, -3.100931, -4,
-3.848965, -3.100931, 4,
-3.848965, -3.100931, -4,
-4.038178, -3.267306, -4,
-3.848965, -3.100931, -2,
-4.038178, -3.267306, -2,
-3.848965, -3.100931, 0,
-4.038178, -3.267306, 0,
-3.848965, -3.100931, 2,
-4.038178, -3.267306, 2,
-3.848965, -3.100931, 4,
-4.038178, -3.267306, 4
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
-4.416604, -3.600056, -4, 0, -0.5, 0.5, 0.5,
-4.416604, -3.600056, -4, 1, -0.5, 0.5, 0.5,
-4.416604, -3.600056, -4, 1, 1.5, 0.5, 0.5,
-4.416604, -3.600056, -4, 0, 1.5, 0.5, 0.5,
-4.416604, -3.600056, -2, 0, -0.5, 0.5, 0.5,
-4.416604, -3.600056, -2, 1, -0.5, 0.5, 0.5,
-4.416604, -3.600056, -2, 1, 1.5, 0.5, 0.5,
-4.416604, -3.600056, -2, 0, 1.5, 0.5, 0.5,
-4.416604, -3.600056, 0, 0, -0.5, 0.5, 0.5,
-4.416604, -3.600056, 0, 1, -0.5, 0.5, 0.5,
-4.416604, -3.600056, 0, 1, 1.5, 0.5, 0.5,
-4.416604, -3.600056, 0, 0, 1.5, 0.5, 0.5,
-4.416604, -3.600056, 2, 0, -0.5, 0.5, 0.5,
-4.416604, -3.600056, 2, 1, -0.5, 0.5, 0.5,
-4.416604, -3.600056, 2, 1, 1.5, 0.5, 0.5,
-4.416604, -3.600056, 2, 0, 1.5, 0.5, 0.5,
-4.416604, -3.600056, 4, 0, -0.5, 0.5, 0.5,
-4.416604, -3.600056, 4, 1, -0.5, 0.5, 0.5,
-4.416604, -3.600056, 4, 1, 1.5, 0.5, 0.5,
-4.416604, -3.600056, 4, 0, 1.5, 0.5, 0.5
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
-3.848965, -3.100931, -5.222575,
-3.848965, 3.554074, -5.222575,
-3.848965, -3.100931, 5.318385,
-3.848965, 3.554074, 5.318385,
-3.848965, -3.100931, -5.222575,
-3.848965, -3.100931, 5.318385,
-3.848965, 3.554074, -5.222575,
-3.848965, 3.554074, 5.318385,
-3.848965, -3.100931, -5.222575,
3.719545, -3.100931, -5.222575,
-3.848965, -3.100931, 5.318385,
3.719545, -3.100931, 5.318385,
-3.848965, 3.554074, -5.222575,
3.719545, 3.554074, -5.222575,
-3.848965, 3.554074, 5.318385,
3.719545, 3.554074, 5.318385,
3.719545, -3.100931, -5.222575,
3.719545, 3.554074, -5.222575,
3.719545, -3.100931, 5.318385,
3.719545, 3.554074, 5.318385,
3.719545, -3.100931, -5.222575,
3.719545, -3.100931, 5.318385,
3.719545, 3.554074, -5.222575,
3.719545, 3.554074, 5.318385
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
var radius = 7.787394;
var distance = 34.647;
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
mvMatrix.translate( 0.06471038, -0.2265713, -0.04790521 );
mvMatrix.scale( 1.112489, 1.265196, 0.7987776 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.647);
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
InChI_1S_C48H72O14.C<-read.table("InChI_1S_C48H72O14.C.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C48H72O14.C$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C48H72O14.C' not found
```

```r
y<-InChI_1S_C48H72O14.C$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C48H72O14.C' not found
```

```r
z<-InChI_1S_C48H72O14.C$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C48H72O14.C' not found
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
-3.738744, 0.2225463, -3.147018, 0, 0, 1, 1, 1,
-2.819998, 0.3492167, -1.746195, 1, 0, 0, 1, 1,
-2.627166, -0.08810268, -2.056639, 1, 0, 0, 1, 1,
-2.488426, -0.1922213, -3.284192, 1, 0, 0, 1, 1,
-2.47321, -0.4579573, -1.305765, 1, 0, 0, 1, 1,
-2.454749, 1.340848, -0.5859452, 1, 0, 0, 1, 1,
-2.42299, 0.1466947, -1.386706, 0, 0, 0, 1, 1,
-2.311759, -1.096803, -0.6468682, 0, 0, 0, 1, 1,
-2.252888, -1.188378, -3.233094, 0, 0, 0, 1, 1,
-2.185504, -0.5042201, -0.865091, 0, 0, 0, 1, 1,
-2.176024, -0.001505296, -0.01067704, 0, 0, 0, 1, 1,
-2.09218, -0.4812883, 0.1768342, 0, 0, 0, 1, 1,
-2.085236, -0.3841317, -2.215901, 0, 0, 0, 1, 1,
-2.079258, -0.2879949, -0.8459377, 1, 1, 1, 1, 1,
-2.043231, -0.6484624, -2.281972, 1, 1, 1, 1, 1,
-2.00067, 0.2623256, -1.259172, 1, 1, 1, 1, 1,
-1.985373, -1.515788, -2.545876, 1, 1, 1, 1, 1,
-1.980497, -1.718825, -1.924268, 1, 1, 1, 1, 1,
-1.96834, -1.73894, -3.226979, 1, 1, 1, 1, 1,
-1.958606, -1.999218, -2.473561, 1, 1, 1, 1, 1,
-1.938893, -0.8852949, -2.429433, 1, 1, 1, 1, 1,
-1.938532, -0.7193368, -1.868811, 1, 1, 1, 1, 1,
-1.903072, 0.6070951, -1.219422, 1, 1, 1, 1, 1,
-1.89789, -1.311013, -1.308701, 1, 1, 1, 1, 1,
-1.896217, 1.334916, -1.579752, 1, 1, 1, 1, 1,
-1.870357, 0.9616646, -2.099255, 1, 1, 1, 1, 1,
-1.857196, -0.511885, -2.843076, 1, 1, 1, 1, 1,
-1.848864, 0.3570924, -1.090588, 1, 1, 1, 1, 1,
-1.838998, -1.355721, 0.813275, 0, 0, 1, 1, 1,
-1.837578, 0.0923478, -2.412934, 1, 0, 0, 1, 1,
-1.811614, 0.2793522, -1.919038, 1, 0, 0, 1, 1,
-1.80907, 0.06176322, -1.853586, 1, 0, 0, 1, 1,
-1.800275, -0.7629051, -1.559646, 1, 0, 0, 1, 1,
-1.783176, 1.124356, -1.25951, 1, 0, 0, 1, 1,
-1.737919, 1.344362, -0.5000783, 0, 0, 0, 1, 1,
-1.729901, 0.2556728, -0.5591705, 0, 0, 0, 1, 1,
-1.721125, -2.128017, -2.857472, 0, 0, 0, 1, 1,
-1.692662, -0.4957623, -1.22433, 0, 0, 0, 1, 1,
-1.692486, -0.6786103, -0.8315942, 0, 0, 0, 1, 1,
-1.691252, -0.1201819, -2.588276, 0, 0, 0, 1, 1,
-1.690253, 2.737315, 1.439391, 0, 0, 0, 1, 1,
-1.679882, 1.487656, -0.6664481, 1, 1, 1, 1, 1,
-1.671856, -0.2828282, -1.015862, 1, 1, 1, 1, 1,
-1.671494, 2.265566, -0.2008166, 1, 1, 1, 1, 1,
-1.620959, -1.60843, -3.155813, 1, 1, 1, 1, 1,
-1.620676, 1.047939, 0.1010865, 1, 1, 1, 1, 1,
-1.613861, 1.065171, -0.5482134, 1, 1, 1, 1, 1,
-1.606439, 0.6836464, -1.262602, 1, 1, 1, 1, 1,
-1.605088, -0.3775112, -3.406, 1, 1, 1, 1, 1,
-1.60208, -0.4629068, -1.867181, 1, 1, 1, 1, 1,
-1.595795, -2.094768, -1.412004, 1, 1, 1, 1, 1,
-1.59353, 1.537568, 0.8502657, 1, 1, 1, 1, 1,
-1.588121, 0.4588806, -1.231884, 1, 1, 1, 1, 1,
-1.587142, -1.861708, -2.120576, 1, 1, 1, 1, 1,
-1.560101, 1.723776, -1.19245, 1, 1, 1, 1, 1,
-1.554198, -0.8264194, 0.8850511, 1, 1, 1, 1, 1,
-1.552246, 0.04906816, -1.502039, 0, 0, 1, 1, 1,
-1.537292, -0.07088564, -3.586688, 1, 0, 0, 1, 1,
-1.530255, -1.503075, -2.526721, 1, 0, 0, 1, 1,
-1.513292, -1.070168, -0.822779, 1, 0, 0, 1, 1,
-1.496721, -1.174862, -2.522442, 1, 0, 0, 1, 1,
-1.49379, 0.8423954, -1.660505, 1, 0, 0, 1, 1,
-1.491814, 1.149612, -1.99852, 0, 0, 0, 1, 1,
-1.476084, -0.8707094, -3.443819, 0, 0, 0, 1, 1,
-1.473702, -0.06630103, -1.919414, 0, 0, 0, 1, 1,
-1.468273, 1.749324, 0.1871438, 0, 0, 0, 1, 1,
-1.465894, 1.416919, -2.334396, 0, 0, 0, 1, 1,
-1.463682, 0.5236152, -0.5835558, 0, 0, 0, 1, 1,
-1.459688, 1.36871, 0.4187496, 0, 0, 0, 1, 1,
-1.457494, -0.9657137, -4.032145, 1, 1, 1, 1, 1,
-1.454226, 0.2982705, -1.245459, 1, 1, 1, 1, 1,
-1.444517, -0.2486031, -0.9508952, 1, 1, 1, 1, 1,
-1.44259, -0.1523298, -1.509896, 1, 1, 1, 1, 1,
-1.440287, 0.996105, -1.238408, 1, 1, 1, 1, 1,
-1.438994, -1.433728, -2.599828, 1, 1, 1, 1, 1,
-1.436784, -2.604702, -2.569829, 1, 1, 1, 1, 1,
-1.43252, -0.4210623, -0.8680711, 1, 1, 1, 1, 1,
-1.428797, -0.8834645, -2.117837, 1, 1, 1, 1, 1,
-1.419248, 0.855372, -0.6850045, 1, 1, 1, 1, 1,
-1.411782, 1.621751, -0.8950582, 1, 1, 1, 1, 1,
-1.401575, -0.7074459, -3.057629, 1, 1, 1, 1, 1,
-1.400682, -1.021095, -1.168441, 1, 1, 1, 1, 1,
-1.400651, 0.2480729, -0.6498531, 1, 1, 1, 1, 1,
-1.394872, 1.247775, -1.085026, 1, 1, 1, 1, 1,
-1.385883, -0.05056693, -0.4111639, 0, 0, 1, 1, 1,
-1.379623, -1.51734, -2.066552, 1, 0, 0, 1, 1,
-1.377256, 0.7033668, -1.911105, 1, 0, 0, 1, 1,
-1.376804, 0.677507, -1.15982, 1, 0, 0, 1, 1,
-1.373629, -0.8346809, -3.534121, 1, 0, 0, 1, 1,
-1.368475, 1.630894, 1.025637, 1, 0, 0, 1, 1,
-1.359785, -0.8036199, -3.245561, 0, 0, 0, 1, 1,
-1.342668, 0.1432165, -1.452358, 0, 0, 0, 1, 1,
-1.328371, -1.332612, -3.523876, 0, 0, 0, 1, 1,
-1.313918, 0.5236277, -0.08615752, 0, 0, 0, 1, 1,
-1.312381, 0.3991193, 0.1852118, 0, 0, 0, 1, 1,
-1.260854, -0.6583909, -1.074229, 0, 0, 0, 1, 1,
-1.259333, -1.381688, -1.90885, 0, 0, 0, 1, 1,
-1.253811, 0.5369033, -2.616235, 1, 1, 1, 1, 1,
-1.24962, 0.4578928, -1.23276, 1, 1, 1, 1, 1,
-1.248407, 1.413859, -0.9727414, 1, 1, 1, 1, 1,
-1.248092, -0.1099081, -1.090596, 1, 1, 1, 1, 1,
-1.247906, 0.8796961, -0.3180402, 1, 1, 1, 1, 1,
-1.245812, 0.1950722, -2.781784, 1, 1, 1, 1, 1,
-1.245599, 0.05262334, -0.8357704, 1, 1, 1, 1, 1,
-1.242655, 0.3163994, -1.769619, 1, 1, 1, 1, 1,
-1.241156, 0.02353897, 0.5143955, 1, 1, 1, 1, 1,
-1.237037, -1.096737, -2.211969, 1, 1, 1, 1, 1,
-1.225075, 0.960725, -1.635207, 1, 1, 1, 1, 1,
-1.218669, -0.7808095, -4.242176, 1, 1, 1, 1, 1,
-1.216767, 0.4352472, -1.347704, 1, 1, 1, 1, 1,
-1.20747, 1.580532, 0.3461659, 1, 1, 1, 1, 1,
-1.204619, -0.03643385, -1.19973, 1, 1, 1, 1, 1,
-1.197405, 0.1862944, -2.297232, 0, 0, 1, 1, 1,
-1.197161, 1.354896, 0.2106636, 1, 0, 0, 1, 1,
-1.194511, 1.232421, -0.1442551, 1, 0, 0, 1, 1,
-1.1937, -0.1580714, -1.37043, 1, 0, 0, 1, 1,
-1.189031, 1.012794, -1.084829, 1, 0, 0, 1, 1,
-1.188737, -1.60093, -3.092182, 1, 0, 0, 1, 1,
-1.184337, 1.64156, -1.860739, 0, 0, 0, 1, 1,
-1.178262, -0.00463861, -0.5216523, 0, 0, 0, 1, 1,
-1.162145, 0.1137034, -1.274698, 0, 0, 0, 1, 1,
-1.147944, 0.8974497, -0.1652498, 0, 0, 0, 1, 1,
-1.146543, 0.5201977, -0.1839087, 0, 0, 0, 1, 1,
-1.126546, -0.1512974, -2.591542, 0, 0, 0, 1, 1,
-1.115393, -1.143487, -3.013952, 0, 0, 0, 1, 1,
-1.113451, -2.04221, -2.504164, 1, 1, 1, 1, 1,
-1.108907, 2.081564, -2.416957, 1, 1, 1, 1, 1,
-1.104127, -1.728706, -3.405938, 1, 1, 1, 1, 1,
-1.10194, -1.320075, -1.450047, 1, 1, 1, 1, 1,
-1.097072, -2.983425, -2.683929, 1, 1, 1, 1, 1,
-1.096712, 0.08379926, -0.7262263, 1, 1, 1, 1, 1,
-1.091927, 0.6618878, -1.064469, 1, 1, 1, 1, 1,
-1.086005, 0.1381665, -1.577921, 1, 1, 1, 1, 1,
-1.080489, -0.3865419, -1.866418, 1, 1, 1, 1, 1,
-1.079547, -0.5506757, -1.906041, 1, 1, 1, 1, 1,
-1.073221, -0.1037361, -0.5154978, 1, 1, 1, 1, 1,
-1.072254, 0.3723662, -1.152025, 1, 1, 1, 1, 1,
-1.071145, -0.7198185, -0.02608139, 1, 1, 1, 1, 1,
-1.070512, 0.2075114, -3.810484, 1, 1, 1, 1, 1,
-1.069062, 0.3050258, -1.527189, 1, 1, 1, 1, 1,
-1.063015, 0.7207432, -1.078189, 0, 0, 1, 1, 1,
-1.060737, -1.544059, -3.127472, 1, 0, 0, 1, 1,
-1.053653, 0.8830185, -1.745783, 1, 0, 0, 1, 1,
-1.052802, -0.892549, -1.967143, 1, 0, 0, 1, 1,
-1.052675, 0.2822064, -0.02425064, 1, 0, 0, 1, 1,
-1.047985, -0.07352959, -1.767825, 1, 0, 0, 1, 1,
-1.045194, 1.265059, -0.2891667, 0, 0, 0, 1, 1,
-1.043893, 0.1554144, -1.23519, 0, 0, 0, 1, 1,
-1.042265, 0.3545203, -0.2441711, 0, 0, 0, 1, 1,
-1.037513, -0.6318358, -3.147882, 0, 0, 0, 1, 1,
-1.036216, -0.9569428, -3.935514, 0, 0, 0, 1, 1,
-1.03304, 0.7548572, -0.5938666, 0, 0, 0, 1, 1,
-1.032388, -0.7470012, -0.9832259, 0, 0, 0, 1, 1,
-1.032288, -1.281958, -1.382561, 1, 1, 1, 1, 1,
-1.032258, -1.37195, -3.774798, 1, 1, 1, 1, 1,
-1.027991, -0.1561103, -1.552594, 1, 1, 1, 1, 1,
-1.023142, 1.011272, -0.8688394, 1, 1, 1, 1, 1,
-1.015395, 0.8186173, -0.4532116, 1, 1, 1, 1, 1,
-1.004183, -0.7715663, -3.366397, 1, 1, 1, 1, 1,
-1.002126, 1.012997, -2.904395, 1, 1, 1, 1, 1,
-0.9996749, 0.9716585, -2.452366, 1, 1, 1, 1, 1,
-0.9996358, 1.819483, -0.6261914, 1, 1, 1, 1, 1,
-0.9993799, 1.223996, -1.148046, 1, 1, 1, 1, 1,
-0.9815775, -0.3574415, -2.736106, 1, 1, 1, 1, 1,
-0.9774369, -1.543712, -3.215373, 1, 1, 1, 1, 1,
-0.9756159, 0.09589548, -1.687342, 1, 1, 1, 1, 1,
-0.973509, 0.9490974, 0.1101547, 1, 1, 1, 1, 1,
-0.9708198, -0.001843544, -2.503758, 1, 1, 1, 1, 1,
-0.9698893, 0.6163346, -2.55052, 0, 0, 1, 1, 1,
-0.9689758, 1.13471, -1.440442, 1, 0, 0, 1, 1,
-0.9673519, -1.319823, -2.509485, 1, 0, 0, 1, 1,
-0.9620294, -0.5819387, -1.734074, 1, 0, 0, 1, 1,
-0.9455388, 1.561203, 0.3342766, 1, 0, 0, 1, 1,
-0.9416041, 0.2676603, -0.5998555, 1, 0, 0, 1, 1,
-0.9413245, 0.8052236, -2.477583, 0, 0, 0, 1, 1,
-0.9400493, -1.435814, -3.452397, 0, 0, 0, 1, 1,
-0.9390972, -0.9669209, -2.871165, 0, 0, 0, 1, 1,
-0.9373471, 0.8484025, -3.496928, 0, 0, 0, 1, 1,
-0.9362394, 0.1858318, -2.322333, 0, 0, 0, 1, 1,
-0.9285669, -1.848817, -2.151894, 0, 0, 0, 1, 1,
-0.9272014, 0.5362509, -1.02872, 0, 0, 0, 1, 1,
-0.9254906, -1.55824, -2.329187, 1, 1, 1, 1, 1,
-0.9234685, 0.420388, -0.7259216, 1, 1, 1, 1, 1,
-0.9196649, 0.1831411, -1.640961, 1, 1, 1, 1, 1,
-0.9168586, 0.5444166, 1.660002, 1, 1, 1, 1, 1,
-0.9096162, -1.187189, -1.5412, 1, 1, 1, 1, 1,
-0.903887, 0.3458706, -1.86637, 1, 1, 1, 1, 1,
-0.9021171, 0.8259301, -2.06165, 1, 1, 1, 1, 1,
-0.898874, -0.8659515, -1.618302, 1, 1, 1, 1, 1,
-0.8956147, -1.337921, -2.423763, 1, 1, 1, 1, 1,
-0.8899491, -0.5240723, -3.045332, 1, 1, 1, 1, 1,
-0.8873235, -0.8929759, -2.053591, 1, 1, 1, 1, 1,
-0.8851636, 0.5271214, -1.619249, 1, 1, 1, 1, 1,
-0.885, 1.142847, 0.5890484, 1, 1, 1, 1, 1,
-0.8742992, -0.04476349, -2.007571, 1, 1, 1, 1, 1,
-0.873701, -1.517735, -3.716296, 1, 1, 1, 1, 1,
-0.8728219, 0.09360668, -2.538714, 0, 0, 1, 1, 1,
-0.8714945, -1.908793, -2.808492, 1, 0, 0, 1, 1,
-0.8628131, -0.005390598, -1.247191, 1, 0, 0, 1, 1,
-0.857067, 0.1010554, -0.9190287, 1, 0, 0, 1, 1,
-0.8565589, 0.2619441, -2.062195, 1, 0, 0, 1, 1,
-0.8541693, 0.5897883, 0.4784244, 1, 0, 0, 1, 1,
-0.8518811, 0.7250175, 1.120058, 0, 0, 0, 1, 1,
-0.8482619, 0.397092, -0.66097, 0, 0, 0, 1, 1,
-0.8480031, -0.1711583, -2.804766, 0, 0, 0, 1, 1,
-0.845005, 0.1001007, -0.85079, 0, 0, 0, 1, 1,
-0.8427134, 1.007424, -1.556393, 0, 0, 0, 1, 1,
-0.8363986, 2.382811, 0.4240991, 0, 0, 0, 1, 1,
-0.832091, -0.6785319, -2.658864, 0, 0, 0, 1, 1,
-0.8318533, -0.7505915, -1.416552, 1, 1, 1, 1, 1,
-0.8299384, 1.9811, 0.1788426, 1, 1, 1, 1, 1,
-0.8278444, 1.229118, 0.3195438, 1, 1, 1, 1, 1,
-0.8257514, 1.421334, -1.652326, 1, 1, 1, 1, 1,
-0.8224475, 0.4795432, -0.7725658, 1, 1, 1, 1, 1,
-0.8199381, -0.7887811, -1.478092, 1, 1, 1, 1, 1,
-0.8168052, 1.523929, -0.9826959, 1, 1, 1, 1, 1,
-0.8150814, 0.6295948, -0.1569279, 1, 1, 1, 1, 1,
-0.8121577, -0.04061223, -2.091446, 1, 1, 1, 1, 1,
-0.8110512, -1.047817, -3.010026, 1, 1, 1, 1, 1,
-0.8023011, 0.3042654, -2.368389, 1, 1, 1, 1, 1,
-0.7969216, 0.3826798, -1.961654, 1, 1, 1, 1, 1,
-0.7938489, 1.212344, -1.051123, 1, 1, 1, 1, 1,
-0.7935685, -0.3649672, -1.991808, 1, 1, 1, 1, 1,
-0.7930855, -0.01432236, -3.123183, 1, 1, 1, 1, 1,
-0.7919958, 0.4880311, -1.176521, 0, 0, 1, 1, 1,
-0.7916347, -1.553885, -2.873833, 1, 0, 0, 1, 1,
-0.7874209, 0.9618024, -0.1236214, 1, 0, 0, 1, 1,
-0.787158, 0.3900962, -0.6607537, 1, 0, 0, 1, 1,
-0.7806942, -0.6128873, -2.157517, 1, 0, 0, 1, 1,
-0.7805661, 0.3404585, -2.697096, 1, 0, 0, 1, 1,
-0.778105, -1.104816, -2.074183, 0, 0, 0, 1, 1,
-0.7742319, -2.412246, -4.369086, 0, 0, 0, 1, 1,
-0.771438, 0.3947617, -1.862031, 0, 0, 0, 1, 1,
-0.7700106, 0.2823283, -1.953142, 0, 0, 0, 1, 1,
-0.7644833, -0.6268243, -2.273046, 0, 0, 0, 1, 1,
-0.7629786, 0.6187487, 0.7373627, 0, 0, 0, 1, 1,
-0.7581154, 0.3630114, -1.529597, 0, 0, 0, 1, 1,
-0.7574706, -1.023371, -3.302098, 1, 1, 1, 1, 1,
-0.7564614, -0.6570616, -2.21106, 1, 1, 1, 1, 1,
-0.7534078, 0.7083864, -0.2169165, 1, 1, 1, 1, 1,
-0.7518546, 0.649757, -0.2783497, 1, 1, 1, 1, 1,
-0.750157, -0.2635437, -0.7603933, 1, 1, 1, 1, 1,
-0.7460267, 0.3491434, -0.1815989, 1, 1, 1, 1, 1,
-0.7436844, 0.8503945, -1.39607, 1, 1, 1, 1, 1,
-0.7427956, -0.3429628, -2.297055, 1, 1, 1, 1, 1,
-0.7422179, 1.937412, 1.364251, 1, 1, 1, 1, 1,
-0.7415794, 0.8580489, -0.5868247, 1, 1, 1, 1, 1,
-0.7384955, -0.5998352, -1.134968, 1, 1, 1, 1, 1,
-0.7349849, -0.2106255, -2.308922, 1, 1, 1, 1, 1,
-0.7319013, 1.402397, 1.733207, 1, 1, 1, 1, 1,
-0.7227484, -0.872933, -3.093736, 1, 1, 1, 1, 1,
-0.7155853, -0.4099073, -1.916049, 1, 1, 1, 1, 1,
-0.7153289, -0.7649721, -1.390693, 0, 0, 1, 1, 1,
-0.7107662, -0.8952155, -2.950867, 1, 0, 0, 1, 1,
-0.7087691, 1.138624, 0.2205231, 1, 0, 0, 1, 1,
-0.7064987, -0.6773602, -3.237967, 1, 0, 0, 1, 1,
-0.6810241, -1.409403, -2.834531, 1, 0, 0, 1, 1,
-0.6798439, -0.3030681, -1.370318, 1, 0, 0, 1, 1,
-0.6756897, -1.229002, -2.724687, 0, 0, 0, 1, 1,
-0.6732237, 1.187642, 0.01602482, 0, 0, 0, 1, 1,
-0.6700338, 0.05993458, -0.5365764, 0, 0, 0, 1, 1,
-0.6597753, 0.7225508, -0.4307382, 0, 0, 0, 1, 1,
-0.6584667, -1.24888, -2.789939, 0, 0, 0, 1, 1,
-0.6582798, 1.203712, -0.3164474, 0, 0, 0, 1, 1,
-0.6581283, 2.025, -0.3190978, 0, 0, 0, 1, 1,
-0.654372, -0.8114046, -4.184477, 1, 1, 1, 1, 1,
-0.650709, 1.264745, -0.7520003, 1, 1, 1, 1, 1,
-0.6503173, -0.84521, -3.46253, 1, 1, 1, 1, 1,
-0.6499576, 1.54998, 2.967682, 1, 1, 1, 1, 1,
-0.6497332, -0.01399375, 0.8701025, 1, 1, 1, 1, 1,
-0.6460469, 0.5863126, -1.291715, 1, 1, 1, 1, 1,
-0.6388822, -0.03204222, -2.290251, 1, 1, 1, 1, 1,
-0.6329566, -1.097659, -1.584931, 1, 1, 1, 1, 1,
-0.6260704, -0.1167214, -3.588546, 1, 1, 1, 1, 1,
-0.6240688, 0.2497833, -1.96197, 1, 1, 1, 1, 1,
-0.6237444, -0.2274647, -1.935097, 1, 1, 1, 1, 1,
-0.6138922, 1.520666, 1.067083, 1, 1, 1, 1, 1,
-0.6137805, 1.312802, -0.3454369, 1, 1, 1, 1, 1,
-0.6124201, -0.7206626, -3.149025, 1, 1, 1, 1, 1,
-0.5962401, 0.588302, -2.359022, 1, 1, 1, 1, 1,
-0.5948966, 1.736276, -0.1616504, 0, 0, 1, 1, 1,
-0.5948552, -0.4880508, -3.041172, 1, 0, 0, 1, 1,
-0.5889798, -1.634264, -2.759728, 1, 0, 0, 1, 1,
-0.5886709, 0.4007574, 1.226571, 1, 0, 0, 1, 1,
-0.5878832, 0.08139736, 0.1316675, 1, 0, 0, 1, 1,
-0.5860019, 1.542457, -0.01801384, 1, 0, 0, 1, 1,
-0.5841635, -0.3172506, -5.069066, 0, 0, 0, 1, 1,
-0.5828571, 1.371156, -0.1695137, 0, 0, 0, 1, 1,
-0.5764698, 0.482135, 0.1499757, 0, 0, 0, 1, 1,
-0.5743525, -1.251246, -4.118899, 0, 0, 0, 1, 1,
-0.5726125, -0.9031806, -3.275289, 0, 0, 0, 1, 1,
-0.5672342, 0.2036874, -1.749088, 0, 0, 0, 1, 1,
-0.566776, 0.1344926, -3.119728, 0, 0, 0, 1, 1,
-0.5648769, 0.6192987, 1.039645, 1, 1, 1, 1, 1,
-0.5629452, -1.337983, -4.430579, 1, 1, 1, 1, 1,
-0.5612493, 2.917535, 0.4200612, 1, 1, 1, 1, 1,
-0.561053, -1.105096, -2.878021, 1, 1, 1, 1, 1,
-0.5545581, 0.02330997, -0.975308, 1, 1, 1, 1, 1,
-0.5505202, 0.2331446, 1.193966, 1, 1, 1, 1, 1,
-0.5486168, 0.8440093, -1.096864, 1, 1, 1, 1, 1,
-0.5466099, -0.4483318, -1.653373, 1, 1, 1, 1, 1,
-0.5461962, 1.851273, -0.8194839, 1, 1, 1, 1, 1,
-0.5432712, 0.8263534, -0.2023616, 1, 1, 1, 1, 1,
-0.5427331, 0.4596751, -1.133754, 1, 1, 1, 1, 1,
-0.5427008, 1.106084, 0.6919809, 1, 1, 1, 1, 1,
-0.5422549, -0.05454975, -2.44621, 1, 1, 1, 1, 1,
-0.5420423, 1.414005, -2.971516, 1, 1, 1, 1, 1,
-0.5325363, -0.541036, -1.762659, 1, 1, 1, 1, 1,
-0.5300958, -1.278079, -1.162459, 0, 0, 1, 1, 1,
-0.5298139, -0.2814771, -2.360794, 1, 0, 0, 1, 1,
-0.524785, -0.9833134, -3.679823, 1, 0, 0, 1, 1,
-0.5237001, 0.560208, 0.838856, 1, 0, 0, 1, 1,
-0.5146285, -0.6204864, -2.139502, 1, 0, 0, 1, 1,
-0.5113919, 1.437901, 1.298326, 1, 0, 0, 1, 1,
-0.5103939, 2.43074, -0.7654679, 0, 0, 0, 1, 1,
-0.5078058, 1.303223, -1.161816, 0, 0, 0, 1, 1,
-0.507362, 1.235143, 0.9918448, 0, 0, 0, 1, 1,
-0.5023544, 0.5796174, -0.4999554, 0, 0, 0, 1, 1,
-0.4981567, -0.1477112, -2.650264, 0, 0, 0, 1, 1,
-0.4972096, -1.311134, -4.547121, 0, 0, 0, 1, 1,
-0.4911853, 0.3978312, -0.4431331, 0, 0, 0, 1, 1,
-0.4904217, -0.3995685, -2.181353, 1, 1, 1, 1, 1,
-0.4902853, -0.4151946, -4.227127, 1, 1, 1, 1, 1,
-0.4868275, -1.993347, -1.764947, 1, 1, 1, 1, 1,
-0.4856144, 2.609277, -1.330347, 1, 1, 1, 1, 1,
-0.478291, 0.4190125, -1.814108, 1, 1, 1, 1, 1,
-0.4737031, 2.305424, -0.5347415, 1, 1, 1, 1, 1,
-0.4640323, 1.115929, 0.553053, 1, 1, 1, 1, 1,
-0.4620702, 1.28993, 0.04550889, 1, 1, 1, 1, 1,
-0.4607558, -0.3435688, -4.120944, 1, 1, 1, 1, 1,
-0.4534815, -0.1960784, -1.978857, 1, 1, 1, 1, 1,
-0.442637, 0.7523693, 0.02723632, 1, 1, 1, 1, 1,
-0.4425215, -0.01274488, -3.296268, 1, 1, 1, 1, 1,
-0.4423895, 0.7486156, -0.5874178, 1, 1, 1, 1, 1,
-0.4411403, -0.7865917, -3.136854, 1, 1, 1, 1, 1,
-0.4324678, 0.4534935, -1.595605, 1, 1, 1, 1, 1,
-0.4283694, -0.1344787, -0.2659753, 0, 0, 1, 1, 1,
-0.4273195, 1.372789, -1.466169, 1, 0, 0, 1, 1,
-0.4230847, 1.111304, -0.06092172, 1, 0, 0, 1, 1,
-0.4212162, -0.5210947, -1.539753, 1, 0, 0, 1, 1,
-0.418359, 0.2309932, 0.8341004, 1, 0, 0, 1, 1,
-0.4134033, -1.882938, -2.876327, 1, 0, 0, 1, 1,
-0.4123661, 1.908486, 0.6364591, 0, 0, 0, 1, 1,
-0.4091996, 2.29764, -1.481557, 0, 0, 0, 1, 1,
-0.408398, -1.249983, -1.760176, 0, 0, 0, 1, 1,
-0.4073728, 0.3930268, -2.02912, 0, 0, 0, 1, 1,
-0.406154, 1.70761, -1.345961, 0, 0, 0, 1, 1,
-0.4022524, 1.051483, 0.5156193, 0, 0, 0, 1, 1,
-0.4002486, 0.5703634, -2.231243, 0, 0, 0, 1, 1,
-0.3995246, 1.458222, 0.1912797, 1, 1, 1, 1, 1,
-0.3968879, -1.25618, -2.994819, 1, 1, 1, 1, 1,
-0.3957614, 1.4025, 1.131783, 1, 1, 1, 1, 1,
-0.3954344, 1.009112, 0.995205, 1, 1, 1, 1, 1,
-0.3922127, 0.01496852, -1.819176, 1, 1, 1, 1, 1,
-0.3898598, 1.021623, -1.56073, 1, 1, 1, 1, 1,
-0.3797954, -0.9576327, -1.572173, 1, 1, 1, 1, 1,
-0.3796812, -0.9538887, -3.21405, 1, 1, 1, 1, 1,
-0.3765326, 0.9564639, -1.846866, 1, 1, 1, 1, 1,
-0.3761594, -0.786413, -3.804596, 1, 1, 1, 1, 1,
-0.375291, -0.808561, -3.179332, 1, 1, 1, 1, 1,
-0.3743631, -1.782548, -1.918997, 1, 1, 1, 1, 1,
-0.3742827, -0.08686449, -2.708922, 1, 1, 1, 1, 1,
-0.3740896, -0.4155954, -3.617057, 1, 1, 1, 1, 1,
-0.3739238, 1.246596, 0.1622856, 1, 1, 1, 1, 1,
-0.3738797, -2.028501, -1.948484, 0, 0, 1, 1, 1,
-0.3720669, -0.4864878, -2.908856, 1, 0, 0, 1, 1,
-0.3713927, -0.2614905, -2.149224, 1, 0, 0, 1, 1,
-0.3712784, 0.517304, 0.6052384, 1, 0, 0, 1, 1,
-0.369188, 0.3499191, -0.9491374, 1, 0, 0, 1, 1,
-0.3616005, 1.553387, -0.6029388, 1, 0, 0, 1, 1,
-0.3613731, 0.9228188, -0.7679439, 0, 0, 0, 1, 1,
-0.3588865, -0.2490124, -2.93325, 0, 0, 0, 1, 1,
-0.355872, 0.8887644, 0.4047945, 0, 0, 0, 1, 1,
-0.3511778, -1.486142, -2.670196, 0, 0, 0, 1, 1,
-0.3479981, 1.190272, 0.3005085, 0, 0, 0, 1, 1,
-0.3469052, -0.4986078, -2.944317, 0, 0, 0, 1, 1,
-0.3448795, 1.279578, 0.1063929, 0, 0, 0, 1, 1,
-0.3405887, 1.782924, 0.2101777, 1, 1, 1, 1, 1,
-0.3377808, -0.7010037, -2.170024, 1, 1, 1, 1, 1,
-0.3278563, 0.2216041, -1.722246, 1, 1, 1, 1, 1,
-0.3261128, 1.49837, -0.902963, 1, 1, 1, 1, 1,
-0.3259218, 0.1262517, -1.143642, 1, 1, 1, 1, 1,
-0.3257599, -0.7805327, -2.750229, 1, 1, 1, 1, 1,
-0.3204839, 1.107762, -1.477286, 1, 1, 1, 1, 1,
-0.3114139, -1.644198, -3.857857, 1, 1, 1, 1, 1,
-0.3048499, -0.5505844, -3.021537, 1, 1, 1, 1, 1,
-0.3023594, -1.24031, -2.869665, 1, 1, 1, 1, 1,
-0.3017892, 0.158586, -1.032356, 1, 1, 1, 1, 1,
-0.3016617, 1.004034, 0.5032611, 1, 1, 1, 1, 1,
-0.3002265, 0.1089802, -2.26117, 1, 1, 1, 1, 1,
-0.298817, 0.6816177, -0.8541418, 1, 1, 1, 1, 1,
-0.2964514, 0.5245207, 0.2398995, 1, 1, 1, 1, 1,
-0.2879432, -1.996783, -3.420156, 0, 0, 1, 1, 1,
-0.2872184, -0.1405523, -1.753116, 1, 0, 0, 1, 1,
-0.2863548, -0.7111168, -3.658242, 1, 0, 0, 1, 1,
-0.286143, 0.893756, 1.132199, 1, 0, 0, 1, 1,
-0.2846303, 0.6998548, 0.2257736, 1, 0, 0, 1, 1,
-0.2800185, -0.2058188, -1.437966, 1, 0, 0, 1, 1,
-0.2785074, -0.06238816, -2.652188, 0, 0, 0, 1, 1,
-0.2727292, 0.1519987, -1.098701, 0, 0, 0, 1, 1,
-0.2724489, -1.145539, -4.067569, 0, 0, 0, 1, 1,
-0.2706715, 0.5882418, 0.2552974, 0, 0, 0, 1, 1,
-0.2703274, -0.1328608, -1.840717, 0, 0, 0, 1, 1,
-0.2602106, -1.205354, -1.590228, 0, 0, 0, 1, 1,
-0.2580643, -0.6330726, -3.908657, 0, 0, 0, 1, 1,
-0.2569115, 1.546817, -1.572001, 1, 1, 1, 1, 1,
-0.2537453, 0.6287324, -0.9160219, 1, 1, 1, 1, 1,
-0.2499603, 0.8075353, 0.9988852, 1, 1, 1, 1, 1,
-0.2483545, -2.354891, -3.0857, 1, 1, 1, 1, 1,
-0.2472979, -1.149522, -2.334422, 1, 1, 1, 1, 1,
-0.2470473, -0.9829879, -3.704316, 1, 1, 1, 1, 1,
-0.2467532, 0.2459702, 0.9257773, 1, 1, 1, 1, 1,
-0.2459873, -0.8451377, -2.374752, 1, 1, 1, 1, 1,
-0.2444596, 0.7823904, -2.840019, 1, 1, 1, 1, 1,
-0.2439044, -1.433919, -2.969621, 1, 1, 1, 1, 1,
-0.2433249, 0.3375523, -0.9703172, 1, 1, 1, 1, 1,
-0.2393633, -0.611748, -4.146307, 1, 1, 1, 1, 1,
-0.2388508, 0.9639357, -1.00782, 1, 1, 1, 1, 1,
-0.2342531, -0.3126716, -3.475873, 1, 1, 1, 1, 1,
-0.2289829, 1.909294, 1.289516, 1, 1, 1, 1, 1,
-0.2270878, 0.6749125, 0.2140842, 0, 0, 1, 1, 1,
-0.2252374, 0.01012734, -0.1947983, 1, 0, 0, 1, 1,
-0.2224347, -0.4541474, -2.248871, 1, 0, 0, 1, 1,
-0.2221258, -0.6914775, -2.695709, 1, 0, 0, 1, 1,
-0.2193527, -1.645571, -3.432148, 1, 0, 0, 1, 1,
-0.2135779, 0.7613465, 0.2718261, 1, 0, 0, 1, 1,
-0.2106642, -0.5279124, -1.761099, 0, 0, 0, 1, 1,
-0.2100071, -0.4271264, -3.928032, 0, 0, 0, 1, 1,
-0.2040806, -1.372719, -2.20712, 0, 0, 0, 1, 1,
-0.2015387, -0.05089064, -1.821933, 0, 0, 0, 1, 1,
-0.1948389, -0.5190812, -2.873522, 0, 0, 0, 1, 1,
-0.1894798, 0.8779238, 0.05615944, 0, 0, 0, 1, 1,
-0.189047, -1.422497, -4.217027, 0, 0, 0, 1, 1,
-0.1881103, -0.9339749, -3.232331, 1, 1, 1, 1, 1,
-0.1854219, -0.4230322, -1.972022, 1, 1, 1, 1, 1,
-0.1817036, 1.140036, -0.2491813, 1, 1, 1, 1, 1,
-0.1792437, -0.7955655, -3.440053, 1, 1, 1, 1, 1,
-0.1764764, 0.2396821, -0.03565341, 1, 1, 1, 1, 1,
-0.1762228, 0.6498908, -1.366407, 1, 1, 1, 1, 1,
-0.170821, 1.030646, -1.316629, 1, 1, 1, 1, 1,
-0.1679921, -1.041323, -2.540952, 1, 1, 1, 1, 1,
-0.1651964, -3.004014, -3.908453, 1, 1, 1, 1, 1,
-0.1617398, -0.956385, -1.372051, 1, 1, 1, 1, 1,
-0.159284, -0.2807245, -3.173985, 1, 1, 1, 1, 1,
-0.1587418, 0.7478597, 0.6405214, 1, 1, 1, 1, 1,
-0.1561609, -0.5670106, -4.243343, 1, 1, 1, 1, 1,
-0.1561404, -0.3311611, -3.072294, 1, 1, 1, 1, 1,
-0.1543561, 0.6219872, 0.2502668, 1, 1, 1, 1, 1,
-0.1533653, 0.1561203, -1.618461, 0, 0, 1, 1, 1,
-0.1530389, -2.431576, -3.70656, 1, 0, 0, 1, 1,
-0.1496799, 0.1594463, 0.2575398, 1, 0, 0, 1, 1,
-0.1460157, 0.8173913, -1.337995, 1, 0, 0, 1, 1,
-0.1423192, 0.1860265, -2.660496, 1, 0, 0, 1, 1,
-0.1385177, 0.6029928, -0.1061052, 1, 0, 0, 1, 1,
-0.1362593, 0.9504091, -0.8715811, 0, 0, 0, 1, 1,
-0.1347009, -0.4204314, -1.787179, 0, 0, 0, 1, 1,
-0.1338016, -0.264681, -4.714151, 0, 0, 0, 1, 1,
-0.1283165, -1.635443, -2.220727, 0, 0, 0, 1, 1,
-0.127353, -0.6296418, -2.811055, 0, 0, 0, 1, 1,
-0.1261848, 3.457156, -1.249472, 0, 0, 0, 1, 1,
-0.1176854, -1.841374, -2.051441, 0, 0, 0, 1, 1,
-0.117186, -1.457441, -1.33677, 1, 1, 1, 1, 1,
-0.1106554, 0.335664, 1.061548, 1, 1, 1, 1, 1,
-0.1082097, 0.04321609, -2.708094, 1, 1, 1, 1, 1,
-0.1035367, 0.5598681, -1.014051, 1, 1, 1, 1, 1,
-0.1023017, 0.2813752, -0.9697462, 1, 1, 1, 1, 1,
-0.102136, -0.193069, -3.948071, 1, 1, 1, 1, 1,
-0.1009224, 1.372007, 1.206455, 1, 1, 1, 1, 1,
-0.09926327, -0.8990384, -2.435531, 1, 1, 1, 1, 1,
-0.09894574, 0.05199613, -1.153759, 1, 1, 1, 1, 1,
-0.09843087, -0.09001978, -3.905434, 1, 1, 1, 1, 1,
-0.09705086, -0.09266753, -1.780895, 1, 1, 1, 1, 1,
-0.09547478, -0.370576, -2.658492, 1, 1, 1, 1, 1,
-0.0930354, -1.731588, -4.543003, 1, 1, 1, 1, 1,
-0.08267887, 0.4092112, -0.1638632, 1, 1, 1, 1, 1,
-0.078151, -0.4798654, -4.162548, 1, 1, 1, 1, 1,
-0.07667826, -0.1434934, -3.164049, 0, 0, 1, 1, 1,
-0.0765522, -1.465945, -4.712984, 1, 0, 0, 1, 1,
-0.0757223, -0.6325088, -1.576483, 1, 0, 0, 1, 1,
-0.07404688, -0.3402928, -2.846469, 1, 0, 0, 1, 1,
-0.07255041, -0.420176, -0.9573347, 1, 0, 0, 1, 1,
-0.07212059, -0.2672159, -0.5830256, 1, 0, 0, 1, 1,
-0.07060621, -0.7074618, -4.807889, 0, 0, 0, 1, 1,
-0.0674702, 0.4862916, -0.8149173, 0, 0, 0, 1, 1,
-0.06727052, -0.1593903, 0.06628564, 0, 0, 0, 1, 1,
-0.06680711, -0.4109469, -2.979719, 0, 0, 0, 1, 1,
-0.06307521, -0.6207204, -3.133433, 0, 0, 0, 1, 1,
-0.06231585, -0.1221292, -3.18548, 0, 0, 0, 1, 1,
-0.05980509, -2.74577, -2.461234, 0, 0, 0, 1, 1,
-0.05968469, -0.2565995, -2.362617, 1, 1, 1, 1, 1,
-0.0589969, -0.5819985, -3.803722, 1, 1, 1, 1, 1,
-0.05608182, -0.9216411, -1.504376, 1, 1, 1, 1, 1,
-0.05501053, -0.5292982, -4.925992, 1, 1, 1, 1, 1,
-0.05428061, -0.1996952, -1.558074, 1, 1, 1, 1, 1,
-0.05147113, 1.847493, -0.1477311, 1, 1, 1, 1, 1,
-0.04815405, 1.074304, -0.8638276, 1, 1, 1, 1, 1,
-0.0383675, 0.2732581, -0.5494322, 1, 1, 1, 1, 1,
-0.02509502, 0.6119094, 1.707275, 1, 1, 1, 1, 1,
-0.0246786, 2.781538, -0.5130178, 1, 1, 1, 1, 1,
-0.02324549, -2.000094, -2.920979, 1, 1, 1, 1, 1,
-0.02278251, 0.7135258, 0.1367234, 1, 1, 1, 1, 1,
-0.01919555, 0.383051, 0.01048909, 1, 1, 1, 1, 1,
-0.01784062, -0.3231963, -3.022566, 1, 1, 1, 1, 1,
-0.01719283, -2.503466, -4.928352, 1, 1, 1, 1, 1,
-0.01331913, -0.8794068, -3.577061, 0, 0, 1, 1, 1,
-0.01198552, -0.2315763, -2.14806, 1, 0, 0, 1, 1,
-0.00966482, -0.8648822, -3.643153, 1, 0, 0, 1, 1,
-0.003691123, -0.04238205, -3.529435, 1, 0, 0, 1, 1,
-0.001632949, -0.8537089, -2.502703, 1, 0, 0, 1, 1,
-0.001129095, -1.751498, -5.045702, 1, 0, 0, 1, 1,
0.003233807, 2.084732, -1.45492, 0, 0, 0, 1, 1,
0.004450554, 2.094168, 1.086146, 0, 0, 0, 1, 1,
0.007146867, -1.025288, 3.956259, 0, 0, 0, 1, 1,
0.01380785, -0.5482831, 4.297533, 0, 0, 0, 1, 1,
0.02007184, 0.3778262, 0.06087666, 0, 0, 0, 1, 1,
0.0263289, -0.3831442, 2.670694, 0, 0, 0, 1, 1,
0.03371435, 0.09612376, -1.018315, 0, 0, 0, 1, 1,
0.03813031, 0.225483, 0.3346986, 1, 1, 1, 1, 1,
0.03860839, -1.582299, 2.724843, 1, 1, 1, 1, 1,
0.04178438, -0.1860673, 3.424712, 1, 1, 1, 1, 1,
0.04208149, -1.65912, 2.811201, 1, 1, 1, 1, 1,
0.04319217, -0.1180821, 2.589282, 1, 1, 1, 1, 1,
0.04793714, -0.500917, 1.611479, 1, 1, 1, 1, 1,
0.05120243, 0.9552922, -1.094801, 1, 1, 1, 1, 1,
0.05262447, 1.102798, -0.305898, 1, 1, 1, 1, 1,
0.05725714, -0.2884713, 0.2001778, 1, 1, 1, 1, 1,
0.05813534, -1.220765, 2.495363, 1, 1, 1, 1, 1,
0.06219644, 0.2890692, -0.002970737, 1, 1, 1, 1, 1,
0.06281511, -1.788805, 1.058887, 1, 1, 1, 1, 1,
0.07105051, 0.5067015, -1.224249, 1, 1, 1, 1, 1,
0.07536376, -0.5670074, 2.421999, 1, 1, 1, 1, 1,
0.07621903, 0.7722568, -0.5959341, 1, 1, 1, 1, 1,
0.0773036, -1.505263, 2.591381, 0, 0, 1, 1, 1,
0.08297925, 0.7817744, 0.07865886, 1, 0, 0, 1, 1,
0.08329563, -0.9586114, 3.144389, 1, 0, 0, 1, 1,
0.08636346, -0.02238228, 0.4257737, 1, 0, 0, 1, 1,
0.08841512, -1.159538, 3.773446, 1, 0, 0, 1, 1,
0.09004928, 0.3188356, -0.08413329, 1, 0, 0, 1, 1,
0.09080206, -0.7859871, 1.77211, 0, 0, 0, 1, 1,
0.09110392, 1.268708, 1.713688, 0, 0, 0, 1, 1,
0.09346013, -0.9730701, 3.056071, 0, 0, 0, 1, 1,
0.09886745, -0.7158128, 2.284539, 0, 0, 0, 1, 1,
0.1033208, -1.829783, 1.660725, 0, 0, 0, 1, 1,
0.1035751, 2.034894, -0.7345482, 0, 0, 0, 1, 1,
0.1064779, -2.514306, 3.684221, 0, 0, 0, 1, 1,
0.1092038, 0.06341457, 2.383072, 1, 1, 1, 1, 1,
0.1117547, 1.47399, -0.2092561, 1, 1, 1, 1, 1,
0.1119205, 0.3554114, -0.1342136, 1, 1, 1, 1, 1,
0.1126941, -0.3269678, 3.108038, 1, 1, 1, 1, 1,
0.1140798, -0.4816951, 2.318931, 1, 1, 1, 1, 1,
0.1190261, 0.6371859, -0.03852055, 1, 1, 1, 1, 1,
0.1194931, -2.038247, 2.029681, 1, 1, 1, 1, 1,
0.1201123, 0.2532557, 0.4025691, 1, 1, 1, 1, 1,
0.1212566, 1.018419, 0.4438281, 1, 1, 1, 1, 1,
0.1216844, -0.4511115, 2.656033, 1, 1, 1, 1, 1,
0.1265883, -0.6632079, 2.840517, 1, 1, 1, 1, 1,
0.1307676, 1.198213, -0.2034457, 1, 1, 1, 1, 1,
0.1357291, -0.6319708, 2.856851, 1, 1, 1, 1, 1,
0.138168, -0.1587525, 3.312412, 1, 1, 1, 1, 1,
0.1463086, -0.9125274, 2.762796, 1, 1, 1, 1, 1,
0.1464529, 0.5003048, 0.00376646, 0, 0, 1, 1, 1,
0.1499652, -1.65869, 2.032762, 1, 0, 0, 1, 1,
0.1502994, -0.8521304, 2.4715, 1, 0, 0, 1, 1,
0.1525815, 0.8290385, 0.3766465, 1, 0, 0, 1, 1,
0.1541406, -0.1648137, 3.033118, 1, 0, 0, 1, 1,
0.1546085, -0.0006446262, 0.2585378, 1, 0, 0, 1, 1,
0.1578351, -0.4248436, 4.484198, 0, 0, 0, 1, 1,
0.1780751, 0.8982257, 0.6689559, 0, 0, 0, 1, 1,
0.1793998, 1.076569, 0.4600299, 0, 0, 0, 1, 1,
0.1810433, -0.2315848, 3.454564, 0, 0, 0, 1, 1,
0.1811783, -1.14938, 3.568847, 0, 0, 0, 1, 1,
0.1851863, 0.7570228, -1.191524, 0, 0, 0, 1, 1,
0.1883218, -0.1211042, -0.04707551, 0, 0, 0, 1, 1,
0.1883973, 1.203344, 0.1640632, 1, 1, 1, 1, 1,
0.1891589, -0.7599832, 2.35388, 1, 1, 1, 1, 1,
0.1896248, -0.07636773, 2.716642, 1, 1, 1, 1, 1,
0.191286, 0.2318522, 1.609256, 1, 1, 1, 1, 1,
0.1914376, -0.5325231, 1.257668, 1, 1, 1, 1, 1,
0.2008337, -0.2577519, 2.196769, 1, 1, 1, 1, 1,
0.2009005, 1.230311, -0.5837975, 1, 1, 1, 1, 1,
0.202644, 0.2768353, 0.8234499, 1, 1, 1, 1, 1,
0.2033146, 2.424544, -0.04860672, 1, 1, 1, 1, 1,
0.2052253, -1.546095, 3.225495, 1, 1, 1, 1, 1,
0.2063139, -0.6498323, 2.573821, 1, 1, 1, 1, 1,
0.2080632, -0.388878, 3.411915, 1, 1, 1, 1, 1,
0.210371, -1.104585, 1.761294, 1, 1, 1, 1, 1,
0.2139854, -0.2480654, 4.05075, 1, 1, 1, 1, 1,
0.2153583, 0.186503, 1.858335, 1, 1, 1, 1, 1,
0.2162339, -0.06859285, 2.762681, 0, 0, 1, 1, 1,
0.218309, -0.1119834, 2.484562, 1, 0, 0, 1, 1,
0.2284382, 1.508844, -1.032629, 1, 0, 0, 1, 1,
0.2301133, -0.2948962, 2.356177, 1, 0, 0, 1, 1,
0.2314521, 0.8605321, 0.4008944, 1, 0, 0, 1, 1,
0.2345743, 0.6783324, 0.01563251, 1, 0, 0, 1, 1,
0.2353983, -1.735107, 2.572097, 0, 0, 0, 1, 1,
0.2383333, 0.8524, 1.288901, 0, 0, 0, 1, 1,
0.2498815, 1.46769, -1.091255, 0, 0, 0, 1, 1,
0.2520159, -0.6325367, 3.701219, 0, 0, 0, 1, 1,
0.2567634, 0.3207269, 0.7298335, 0, 0, 0, 1, 1,
0.257008, 0.05179446, 2.20444, 0, 0, 0, 1, 1,
0.2572171, 0.6625419, 1.751971, 0, 0, 0, 1, 1,
0.2578931, 1.543268, -1.157097, 1, 1, 1, 1, 1,
0.2606554, 0.6307887, 0.4594388, 1, 1, 1, 1, 1,
0.2632249, -0.5217573, 3.784671, 1, 1, 1, 1, 1,
0.265439, -0.6920357, -0.3953336, 1, 1, 1, 1, 1,
0.266144, -0.5530341, 3.485788, 1, 1, 1, 1, 1,
0.2726916, -0.6350725, 0.7306873, 1, 1, 1, 1, 1,
0.2790306, 0.07722303, 1.62084, 1, 1, 1, 1, 1,
0.2828691, 0.1198178, 0.02549677, 1, 1, 1, 1, 1,
0.2828991, -0.3688949, 1.912313, 1, 1, 1, 1, 1,
0.290408, 1.510307, 0.3767523, 1, 1, 1, 1, 1,
0.2923602, -1.815872, 1.835041, 1, 1, 1, 1, 1,
0.2930824, 1.175855, -0.01756163, 1, 1, 1, 1, 1,
0.2980025, 1.906657, 1.476438, 1, 1, 1, 1, 1,
0.2993514, -0.1034212, 1.613804, 1, 1, 1, 1, 1,
0.3005498, -0.7024431, 3.57065, 1, 1, 1, 1, 1,
0.3005934, -0.73997, 2.485544, 0, 0, 1, 1, 1,
0.3006329, 0.05654727, 1.167221, 1, 0, 0, 1, 1,
0.3037369, 0.9622663, 0.9337196, 1, 0, 0, 1, 1,
0.3049386, 0.007769579, 2.663085, 1, 0, 0, 1, 1,
0.3074302, 1.503856, -0.488812, 1, 0, 0, 1, 1,
0.317581, -1.117355, 2.715374, 1, 0, 0, 1, 1,
0.3180074, -1.10232, 2.261927, 0, 0, 0, 1, 1,
0.3193411, 1.687668, 0.2399822, 0, 0, 0, 1, 1,
0.321665, -0.4460868, 1.98392, 0, 0, 0, 1, 1,
0.326984, 0.9906353, 1.398694, 0, 0, 0, 1, 1,
0.3285648, -0.3011428, 2.654118, 0, 0, 0, 1, 1,
0.3339739, 0.6981096, -0.3190608, 0, 0, 0, 1, 1,
0.3360226, -0.9398718, 3.366456, 0, 0, 0, 1, 1,
0.3360519, -0.6055025, 3.358918, 1, 1, 1, 1, 1,
0.3368251, -0.7849223, 3.835202, 1, 1, 1, 1, 1,
0.3415087, 2.021508, -1.292645, 1, 1, 1, 1, 1,
0.3421464, 0.1826943, 0.8542357, 1, 1, 1, 1, 1,
0.3425207, -0.3994107, 3.369964, 1, 1, 1, 1, 1,
0.3429637, -0.6662862, 2.416207, 1, 1, 1, 1, 1,
0.346157, -1.317014, 3.543229, 1, 1, 1, 1, 1,
0.3462882, 0.09192854, 1.87819, 1, 1, 1, 1, 1,
0.3492447, -0.06593671, 3.024409, 1, 1, 1, 1, 1,
0.3529029, -1.212605, 4.41863, 1, 1, 1, 1, 1,
0.3572229, -0.3283224, 3.978346, 1, 1, 1, 1, 1,
0.358577, -0.6374454, 3.193532, 1, 1, 1, 1, 1,
0.3611558, -1.04716, 3.303778, 1, 1, 1, 1, 1,
0.3633547, 0.8691572, 0.4148496, 1, 1, 1, 1, 1,
0.3638248, 0.2099973, 0.1802414, 1, 1, 1, 1, 1,
0.3644194, 0.2036054, 3.141952, 0, 0, 1, 1, 1,
0.367549, -0.3672508, 2.92736, 1, 0, 0, 1, 1,
0.368015, 0.4741388, 1.078754, 1, 0, 0, 1, 1,
0.3686261, -0.3966207, 2.650558, 1, 0, 0, 1, 1,
0.3687318, 0.5709277, 0.9953836, 1, 0, 0, 1, 1,
0.3727323, 0.9168532, 2.41513, 1, 0, 0, 1, 1,
0.3731041, -0.8338772, 1.278802, 0, 0, 0, 1, 1,
0.374461, 0.10678, 1.288394, 0, 0, 0, 1, 1,
0.3751135, 0.2934928, 1.481616, 0, 0, 0, 1, 1,
0.3791657, -2.147825, 2.866516, 0, 0, 0, 1, 1,
0.3803137, -0.6980743, 2.454552, 0, 0, 0, 1, 1,
0.385574, -0.02464621, 2.290739, 0, 0, 0, 1, 1,
0.3930665, 0.2353982, -0.5822545, 0, 0, 0, 1, 1,
0.39845, -1.285031, 2.665959, 1, 1, 1, 1, 1,
0.4003202, -0.06785465, 3.512757, 1, 1, 1, 1, 1,
0.4038883, 0.2243478, 1.919803, 1, 1, 1, 1, 1,
0.4043173, -1.782031, 2.441309, 1, 1, 1, 1, 1,
0.4079839, -0.2078815, 2.175988, 1, 1, 1, 1, 1,
0.4107021, 1.389903, 1.512372, 1, 1, 1, 1, 1,
0.4129085, 0.2363073, 0.1192572, 1, 1, 1, 1, 1,
0.413882, 0.273081, 1.989461, 1, 1, 1, 1, 1,
0.4177995, -0.6202403, 1.256459, 1, 1, 1, 1, 1,
0.4262472, -0.8934618, 3.466549, 1, 1, 1, 1, 1,
0.4330894, -0.3897937, 1.823956, 1, 1, 1, 1, 1,
0.435503, -1.507781, 2.250976, 1, 1, 1, 1, 1,
0.4391102, 0.5343973, 1.16853, 1, 1, 1, 1, 1,
0.4446071, 0.1883062, 1.417264, 1, 1, 1, 1, 1,
0.4482208, -0.6431713, 2.857819, 1, 1, 1, 1, 1,
0.4487107, -0.1841081, 2.288288, 0, 0, 1, 1, 1,
0.4543748, -2.000611, 4.149805, 1, 0, 0, 1, 1,
0.4546144, 0.4235086, 0.9699296, 1, 0, 0, 1, 1,
0.4563252, 0.11862, 0.8118231, 1, 0, 0, 1, 1,
0.4600648, -0.2138218, 3.788596, 1, 0, 0, 1, 1,
0.4703022, -0.4473902, 1.943188, 1, 0, 0, 1, 1,
0.4712167, 0.9902543, -0.3447881, 0, 0, 0, 1, 1,
0.4785703, 1.29882, -0.1235294, 0, 0, 0, 1, 1,
0.481261, -1.356066, 3.171396, 0, 0, 0, 1, 1,
0.4819297, -0.3314316, 2.97632, 0, 0, 0, 1, 1,
0.4820828, -0.6327648, 1.33308, 0, 0, 0, 1, 1,
0.4837148, -0.3203605, 2.99851, 0, 0, 0, 1, 1,
0.4857529, 2.242059, -0.4018199, 0, 0, 0, 1, 1,
0.4873905, -0.2702688, 1.12128, 1, 1, 1, 1, 1,
0.4928195, 1.000771, 0.5923864, 1, 1, 1, 1, 1,
0.4970186, -0.1358198, 2.905046, 1, 1, 1, 1, 1,
0.5011541, 0.2833281, 2.295038, 1, 1, 1, 1, 1,
0.5064167, 0.585039, 2.693173, 1, 1, 1, 1, 1,
0.5068856, 0.2891905, 2.466807, 1, 1, 1, 1, 1,
0.5077298, 0.9284899, -0.7671306, 1, 1, 1, 1, 1,
0.5134282, -0.1464813, 1.322054, 1, 1, 1, 1, 1,
0.52029, 0.8394138, 0.7472713, 1, 1, 1, 1, 1,
0.5203516, -1.185863, 2.226918, 1, 1, 1, 1, 1,
0.521692, 0.456764, -0.3709457, 1, 1, 1, 1, 1,
0.5226647, -0.2784481, 2.131435, 1, 1, 1, 1, 1,
0.5274228, -0.08861104, 2.124322, 1, 1, 1, 1, 1,
0.527967, -1.25403, 2.240226, 1, 1, 1, 1, 1,
0.5287681, 0.8521231, -0.1819335, 1, 1, 1, 1, 1,
0.5348101, 0.8725976, 1.437261, 0, 0, 1, 1, 1,
0.5371193, 1.129902, 0.1599502, 1, 0, 0, 1, 1,
0.5506303, 0.6653043, 1.168337, 1, 0, 0, 1, 1,
0.5511994, -0.5316725, 0.08835983, 1, 0, 0, 1, 1,
0.5531089, 0.1428934, 2.861938, 1, 0, 0, 1, 1,
0.5532466, -0.04594317, 2.746833, 1, 0, 0, 1, 1,
0.5546072, -1.262127, 2.892952, 0, 0, 0, 1, 1,
0.5725601, -0.8333201, 2.986616, 0, 0, 0, 1, 1,
0.5736655, 1.588306, -0.9682908, 0, 0, 0, 1, 1,
0.5747365, -0.05882634, 0.8221512, 0, 0, 0, 1, 1,
0.5788752, -0.8448647, 1.538147, 0, 0, 0, 1, 1,
0.5817296, -0.3157159, 0.6196637, 0, 0, 0, 1, 1,
0.5884893, 0.06697294, 1.893035, 0, 0, 0, 1, 1,
0.5907142, -1.403706, 5.164876, 1, 1, 1, 1, 1,
0.5944489, -0.2696833, 3.782973, 1, 1, 1, 1, 1,
0.5957558, -1.437233, 1.331514, 1, 1, 1, 1, 1,
0.5981283, -0.4097083, 2.623227, 1, 1, 1, 1, 1,
0.5995892, 2.558331, 0.0679359, 1, 1, 1, 1, 1,
0.6064247, -1.921695, 3.968957, 1, 1, 1, 1, 1,
0.6068972, -0.4689762, 2.296871, 1, 1, 1, 1, 1,
0.6077892, -0.4849798, 1.181705, 1, 1, 1, 1, 1,
0.6089613, -0.500185, 1.846399, 1, 1, 1, 1, 1,
0.6098549, -0.4198413, 3.433849, 1, 1, 1, 1, 1,
0.610319, -0.4156362, 1.289772, 1, 1, 1, 1, 1,
0.6112256, 0.793842, 2.19495, 1, 1, 1, 1, 1,
0.6120054, -0.2229616, 1.203097, 1, 1, 1, 1, 1,
0.6127605, 1.353999, 0.6855256, 1, 1, 1, 1, 1,
0.6145314, 1.462559, -0.9683527, 1, 1, 1, 1, 1,
0.6145382, -0.4122883, 2.062086, 0, 0, 1, 1, 1,
0.6172615, -1.451712, 1.990468, 1, 0, 0, 1, 1,
0.6173952, 1.073255, 1.377113, 1, 0, 0, 1, 1,
0.617745, -0.564014, 2.834151, 1, 0, 0, 1, 1,
0.6188918, 0.8266561, 2.678529, 1, 0, 0, 1, 1,
0.6209105, 0.150434, 0.5730861, 1, 0, 0, 1, 1,
0.6211718, -1.225709, 2.029525, 0, 0, 0, 1, 1,
0.6251878, 0.8942607, -0.5455416, 0, 0, 0, 1, 1,
0.6276985, -0.7126946, 1.277194, 0, 0, 0, 1, 1,
0.6439271, 0.8926322, 0.989246, 0, 0, 0, 1, 1,
0.6444693, 0.03297858, 0.9092714, 0, 0, 0, 1, 1,
0.6476285, 0.08496363, 3.120095, 0, 0, 0, 1, 1,
0.6507303, 0.484207, 2.303767, 0, 0, 0, 1, 1,
0.6579024, -0.912899, 1.781201, 1, 1, 1, 1, 1,
0.6614367, 0.5084478, -1.030562, 1, 1, 1, 1, 1,
0.662859, -0.35355, 0.6698882, 1, 1, 1, 1, 1,
0.6697319, 1.486053, -0.3489348, 1, 1, 1, 1, 1,
0.6707863, -1.476949, 3.240169, 1, 1, 1, 1, 1,
0.6715246, 1.660865, -0.1192295, 1, 1, 1, 1, 1,
0.6726431, -0.5652888, 3.379461, 1, 1, 1, 1, 1,
0.6767933, 0.8627071, -0.1638417, 1, 1, 1, 1, 1,
0.6786423, 0.3293938, 1.130249, 1, 1, 1, 1, 1,
0.6819227, 0.9094602, -1.206453, 1, 1, 1, 1, 1,
0.6821926, 0.9088489, 0.5503993, 1, 1, 1, 1, 1,
0.6827897, -0.06335488, 0.9302886, 1, 1, 1, 1, 1,
0.6896673, 0.1624384, 0.2162976, 1, 1, 1, 1, 1,
0.6897914, 1.13194, 0.6481003, 1, 1, 1, 1, 1,
0.6914861, -2.713662, 2.366662, 1, 1, 1, 1, 1,
0.6938446, 0.4457593, 0.0970099, 0, 0, 1, 1, 1,
0.699644, -2.015594, 2.785012, 1, 0, 0, 1, 1,
0.7005342, -0.6202669, 2.750836, 1, 0, 0, 1, 1,
0.7066109, -1.591594, 4.13404, 1, 0, 0, 1, 1,
0.7133875, -0.1735358, 1.851839, 1, 0, 0, 1, 1,
0.7161378, 0.6166942, 0.2715883, 1, 0, 0, 1, 1,
0.7272156, 0.1749407, 0.3565438, 0, 0, 0, 1, 1,
0.7274544, -0.7324699, 3.255932, 0, 0, 0, 1, 1,
0.7278644, -0.1999468, 2.262333, 0, 0, 0, 1, 1,
0.7280021, 1.295426, 1.235874, 0, 0, 0, 1, 1,
0.7373413, 0.4572731, 0.8390029, 0, 0, 0, 1, 1,
0.7420076, -1.581936, 4.814428, 0, 0, 0, 1, 1,
0.7434489, -1.875708, 3.520869, 0, 0, 0, 1, 1,
0.7494444, 0.5939364, 1.773744, 1, 1, 1, 1, 1,
0.7535566, 0.240324, 1.101242, 1, 1, 1, 1, 1,
0.7550052, 0.9029969, 0.8560007, 1, 1, 1, 1, 1,
0.7570763, -0.6015537, 2.509997, 1, 1, 1, 1, 1,
0.762042, 1.874687, 1.281301, 1, 1, 1, 1, 1,
0.762139, 0.9547368, 2.297011, 1, 1, 1, 1, 1,
0.769604, 0.07706936, 1.410499, 1, 1, 1, 1, 1,
0.7703671, 0.794205, 1.616293, 1, 1, 1, 1, 1,
0.770479, 0.9754719, 0.7790061, 1, 1, 1, 1, 1,
0.7746595, -1.144867, 3.21158, 1, 1, 1, 1, 1,
0.7756951, 0.27386, 2.200129, 1, 1, 1, 1, 1,
0.7759586, 1.266673, 0.7911185, 1, 1, 1, 1, 1,
0.7812516, 1.121451, 2.781629, 1, 1, 1, 1, 1,
0.7831719, 0.04950198, 1.189015, 1, 1, 1, 1, 1,
0.7858499, 0.2946322, 0.8697451, 1, 1, 1, 1, 1,
0.7886512, 1.056363, 2.042563, 0, 0, 1, 1, 1,
0.7912929, 0.3885304, 0.9169108, 1, 0, 0, 1, 1,
0.797772, 1.635399, -1.468116, 1, 0, 0, 1, 1,
0.7978091, 0.01231273, 1.453828, 1, 0, 0, 1, 1,
0.80624, 0.1591265, 1.096173, 1, 0, 0, 1, 1,
0.8099214, 0.8532684, -0.1365443, 1, 0, 0, 1, 1,
0.8168368, -0.7925031, 3.023198, 0, 0, 0, 1, 1,
0.8185977, 0.2792637, 0.7249517, 0, 0, 0, 1, 1,
0.8309755, 0.8735545, 1.652492, 0, 0, 0, 1, 1,
0.8352023, 0.5606312, -0.07926402, 0, 0, 0, 1, 1,
0.8362297, 0.6571099, 2.542057, 0, 0, 0, 1, 1,
0.8374786, -0.9994959, 2.982121, 0, 0, 0, 1, 1,
0.8450581, 0.1643463, 1.087493, 0, 0, 0, 1, 1,
0.847807, -0.6165773, 2.552573, 1, 1, 1, 1, 1,
0.8493675, 1.413635, -1.690258, 1, 1, 1, 1, 1,
0.8509977, -0.2108356, 0.6168214, 1, 1, 1, 1, 1,
0.851536, 1.466525, 2.819777, 1, 1, 1, 1, 1,
0.8536048, -1.454385, 2.19653, 1, 1, 1, 1, 1,
0.8568935, -0.07597255, 0.7083391, 1, 1, 1, 1, 1,
0.8571635, -0.9147919, 2.63655, 1, 1, 1, 1, 1,
0.8635587, -0.1899647, 0.8415231, 1, 1, 1, 1, 1,
0.8635752, -0.7197922, 1.329706, 1, 1, 1, 1, 1,
0.8644556, -0.6464561, 1.946099, 1, 1, 1, 1, 1,
0.8663604, -0.03715012, 1.601237, 1, 1, 1, 1, 1,
0.8721464, -0.1968147, 1.915122, 1, 1, 1, 1, 1,
0.8721712, -1.786117, 1.502164, 1, 1, 1, 1, 1,
0.8783847, 0.5156121, 2.009164, 1, 1, 1, 1, 1,
0.8816746, 1.202722, -0.2563499, 1, 1, 1, 1, 1,
0.8925396, 1.042075, 1.619743, 0, 0, 1, 1, 1,
0.8946741, 0.8058461, 2.386332, 1, 0, 0, 1, 1,
0.89512, 1.153285, -0.0765987, 1, 0, 0, 1, 1,
0.898637, -0.7650042, 4.062474, 1, 0, 0, 1, 1,
0.8990926, 2.630947, 0.07612286, 1, 0, 0, 1, 1,
0.9023955, -0.08591933, 1.738366, 1, 0, 0, 1, 1,
0.9037925, 1.683819, -0.1635166, 0, 0, 0, 1, 1,
0.9110267, -0.3274126, 1.125496, 0, 0, 0, 1, 1,
0.9124058, 1.135135, -0.4895557, 0, 0, 0, 1, 1,
0.9139623, -0.2450232, 2.486865, 0, 0, 0, 1, 1,
0.9157953, -1.184546, 3.45833, 0, 0, 0, 1, 1,
0.9199209, -0.7949111, 0.8081841, 0, 0, 0, 1, 1,
0.9224183, -0.4476315, 2.11039, 0, 0, 0, 1, 1,
0.9258158, 2.319313, 0.5218312, 1, 1, 1, 1, 1,
0.9274731, 1.180639, 1.144787, 1, 1, 1, 1, 1,
0.9334632, -0.6435744, 2.812893, 1, 1, 1, 1, 1,
0.9382345, -0.3646962, 1.724768, 1, 1, 1, 1, 1,
0.9384004, 1.583282, 1.520554, 1, 1, 1, 1, 1,
0.9402336, -1.475876, 2.133919, 1, 1, 1, 1, 1,
0.9450551, -0.7480419, 0.5648057, 1, 1, 1, 1, 1,
0.9450626, -0.1393898, 2.64713, 1, 1, 1, 1, 1,
0.9507182, 1.245798, -1.182202, 1, 1, 1, 1, 1,
0.951053, -0.7871071, 1.484676, 1, 1, 1, 1, 1,
0.9521418, -0.1540494, 2.144523, 1, 1, 1, 1, 1,
0.960058, -0.1506785, 1.303362, 1, 1, 1, 1, 1,
0.9630075, -0.2563764, -0.2359782, 1, 1, 1, 1, 1,
0.9667186, -0.1798099, 1.979429, 1, 1, 1, 1, 1,
0.9713627, -1.343966, 2.263646, 1, 1, 1, 1, 1,
0.9782845, 2.795534, -1.542388, 0, 0, 1, 1, 1,
0.9821783, 0.4626983, 1.526825, 1, 0, 0, 1, 1,
0.9849002, 0.6780791, 0.07848883, 1, 0, 0, 1, 1,
0.9881092, 0.1089976, 2.3138, 1, 0, 0, 1, 1,
0.9902117, -1.815184, 2.11939, 1, 0, 0, 1, 1,
1.003767, -0.07483881, 1.432286, 1, 0, 0, 1, 1,
1.004603, 1.188898, 0.5994173, 0, 0, 0, 1, 1,
1.007238, 1.394506, 0.2013798, 0, 0, 0, 1, 1,
1.007608, -0.562442, 2.15979, 0, 0, 0, 1, 1,
1.007805, 0.2368688, 0.7532871, 0, 0, 0, 1, 1,
1.010846, -2.019032, 3.247504, 0, 0, 0, 1, 1,
1.014389, 0.2034594, 1.902805, 0, 0, 0, 1, 1,
1.02875, -0.04998051, -0.06574664, 0, 0, 0, 1, 1,
1.033011, 0.5548659, -0.3428565, 1, 1, 1, 1, 1,
1.036698, 0.2749027, 0.6858586, 1, 1, 1, 1, 1,
1.041249, 1.345934, 0.9568963, 1, 1, 1, 1, 1,
1.042946, -0.9930613, 1.247976, 1, 1, 1, 1, 1,
1.046947, 0.0717432, 0.5843275, 1, 1, 1, 1, 1,
1.054252, 0.893752, 0.8873985, 1, 1, 1, 1, 1,
1.060777, 0.2181809, 0.5929253, 1, 1, 1, 1, 1,
1.064305, -1.438065, 2.341827, 1, 1, 1, 1, 1,
1.06666, -2.113907, 2.953796, 1, 1, 1, 1, 1,
1.088326, -0.1141307, 2.166722, 1, 1, 1, 1, 1,
1.091415, -0.1356783, 0.06612356, 1, 1, 1, 1, 1,
1.091624, -2.434481, 3.473439, 1, 1, 1, 1, 1,
1.10266, -0.3301015, 0.7850915, 1, 1, 1, 1, 1,
1.106108, 0.8698352, -1.0071, 1, 1, 1, 1, 1,
1.112348, -0.9509706, 2.850204, 1, 1, 1, 1, 1,
1.122087, -0.1315897, 2.217688, 0, 0, 1, 1, 1,
1.1303, -0.3115031, 1.859871, 1, 0, 0, 1, 1,
1.130952, -0.3814376, 0.3328999, 1, 0, 0, 1, 1,
1.133221, 0.8294989, 0.03305839, 1, 0, 0, 1, 1,
1.135792, 0.7882817, -0.8861625, 1, 0, 0, 1, 1,
1.137005, -0.5334854, 1.091084, 1, 0, 0, 1, 1,
1.14295, -2.302718, 2.179868, 0, 0, 0, 1, 1,
1.147364, -1.827466, 2.033018, 0, 0, 0, 1, 1,
1.147593, -1.156471, 2.268301, 0, 0, 0, 1, 1,
1.157727, -0.04782825, 0.7792592, 0, 0, 0, 1, 1,
1.162785, -0.4774135, 2.225127, 0, 0, 0, 1, 1,
1.166801, -0.9051204, 2.162667, 0, 0, 0, 1, 1,
1.181481, 0.05469873, 3.24028, 0, 0, 0, 1, 1,
1.181633, 0.4541106, 1.675868, 1, 1, 1, 1, 1,
1.183702, -0.09480994, 0.0777164, 1, 1, 1, 1, 1,
1.198877, 1.052394, 0.9091531, 1, 1, 1, 1, 1,
1.206654, -1.121305, 2.4679, 1, 1, 1, 1, 1,
1.215521, -0.4314109, 1.114657, 1, 1, 1, 1, 1,
1.228893, -0.3633429, 2.775559, 1, 1, 1, 1, 1,
1.230374, 0.4290645, -0.5090741, 1, 1, 1, 1, 1,
1.234915, 0.5507359, 1.600997, 1, 1, 1, 1, 1,
1.238271, -1.472116, 2.126862, 1, 1, 1, 1, 1,
1.251419, 0.1314961, 2.15688, 1, 1, 1, 1, 1,
1.256612, -0.6182296, 1.798873, 1, 1, 1, 1, 1,
1.260365, 1.926369, 0.9446408, 1, 1, 1, 1, 1,
1.270676, 0.7713396, 2.155859, 1, 1, 1, 1, 1,
1.272892, 0.2954409, 3.770195, 1, 1, 1, 1, 1,
1.280694, -2.248135, 2.14106, 1, 1, 1, 1, 1,
1.285547, -0.4001554, 1.114535, 0, 0, 1, 1, 1,
1.286998, -1.209143, 2.374628, 1, 0, 0, 1, 1,
1.288998, 1.323098, 1.237717, 1, 0, 0, 1, 1,
1.291029, -0.03701329, 1.908387, 1, 0, 0, 1, 1,
1.291861, -0.08524748, 3.018995, 1, 0, 0, 1, 1,
1.29889, 0.6367705, 1.101079, 1, 0, 0, 1, 1,
1.311443, -0.9775746, 1.77083, 0, 0, 0, 1, 1,
1.325738, -1.283089, 1.903872, 0, 0, 0, 1, 1,
1.331411, -0.1590492, 0.384561, 0, 0, 0, 1, 1,
1.335402, -0.7861947, 2.280562, 0, 0, 0, 1, 1,
1.336612, -0.5118135, 1.804338, 0, 0, 0, 1, 1,
1.34736, -0.4011709, 2.089599, 0, 0, 0, 1, 1,
1.359251, 0.04589552, 2.492591, 0, 0, 0, 1, 1,
1.364046, 0.05677297, 1.410167, 1, 1, 1, 1, 1,
1.372539, 0.9125133, 0.469148, 1, 1, 1, 1, 1,
1.373212, -0.3421925, 1.725666, 1, 1, 1, 1, 1,
1.37982, -1.660961, 0.5094039, 1, 1, 1, 1, 1,
1.380845, 0.5793252, 1.54642, 1, 1, 1, 1, 1,
1.381512, -1.251985, 1.235564, 1, 1, 1, 1, 1,
1.383539, 0.4020976, 0.1381517, 1, 1, 1, 1, 1,
1.384415, -1.284497, 4.652974, 1, 1, 1, 1, 1,
1.386399, 0.5342678, 2.573408, 1, 1, 1, 1, 1,
1.401146, -0.2599645, 0.4460683, 1, 1, 1, 1, 1,
1.407072, -0.9999458, 3.819229, 1, 1, 1, 1, 1,
1.410689, -1.062487, 0.992365, 1, 1, 1, 1, 1,
1.41608, -0.4783041, 1.016751, 1, 1, 1, 1, 1,
1.418602, -2.1154, 2.168132, 1, 1, 1, 1, 1,
1.433391, 0.9039742, 1.152421, 1, 1, 1, 1, 1,
1.447142, -0.02816567, 1.228841, 0, 0, 1, 1, 1,
1.452374, -0.3918807, 2.638158, 1, 0, 0, 1, 1,
1.460106, -0.8631894, 1.598239, 1, 0, 0, 1, 1,
1.461041, 0.7310601, 2.016712, 1, 0, 0, 1, 1,
1.464989, -0.7045544, 0.6942394, 1, 0, 0, 1, 1,
1.472928, 0.6619959, 1.288928, 1, 0, 0, 1, 1,
1.475699, -1.784888, 4.082315, 0, 0, 0, 1, 1,
1.490934, 1.175791, 0.2990524, 0, 0, 0, 1, 1,
1.497223, 1.036848, 1.534675, 0, 0, 0, 1, 1,
1.508711, -0.1413916, 2.38632, 0, 0, 0, 1, 1,
1.511918, 0.371568, 0.03152596, 0, 0, 0, 1, 1,
1.514104, 0.1347396, 1.312403, 0, 0, 0, 1, 1,
1.518263, 0.2806635, 0.3251577, 0, 0, 0, 1, 1,
1.521038, -0.8337629, 1.634157, 1, 1, 1, 1, 1,
1.524787, -0.3197572, -0.3408742, 1, 1, 1, 1, 1,
1.550217, 1.400612, 0.5806298, 1, 1, 1, 1, 1,
1.557279, 0.4025696, -0.4968277, 1, 1, 1, 1, 1,
1.584217, 0.5661011, 0.2701001, 1, 1, 1, 1, 1,
1.600638, -1.898028, 2.659523, 1, 1, 1, 1, 1,
1.605954, -0.9582127, 4.229785, 1, 1, 1, 1, 1,
1.618767, 0.5230739, 0.06356079, 1, 1, 1, 1, 1,
1.619914, -0.6519836, 0.6985383, 1, 1, 1, 1, 1,
1.620423, 0.25804, 1.35421, 1, 1, 1, 1, 1,
1.621283, 0.1800046, 1.147053, 1, 1, 1, 1, 1,
1.640651, -0.08514163, 1.564914, 1, 1, 1, 1, 1,
1.655049, 1.119504, 0.849927, 1, 1, 1, 1, 1,
1.6663, 0.03891671, 2.042583, 1, 1, 1, 1, 1,
1.699642, 0.8790943, 1.767023, 1, 1, 1, 1, 1,
1.70628, -0.1678671, 3.588449, 0, 0, 1, 1, 1,
1.707618, -0.4217147, 0.1473889, 1, 0, 0, 1, 1,
1.721286, -0.2852194, 1.072517, 1, 0, 0, 1, 1,
1.768162, -1.089242, 3.709777, 1, 0, 0, 1, 1,
1.777326, 0.7957544, 0.7259139, 1, 0, 0, 1, 1,
1.781322, 0.4881974, 1.423997, 1, 0, 0, 1, 1,
1.790045, 1.509208, 0.4917843, 0, 0, 0, 1, 1,
1.795263, 0.06716011, 1.035645, 0, 0, 0, 1, 1,
1.803089, 1.767491, 0.800648, 0, 0, 0, 1, 1,
1.818262, -0.851052, 0.4082038, 0, 0, 0, 1, 1,
1.83472, -0.05474421, 3.034113, 0, 0, 0, 1, 1,
1.840516, -0.1882077, 2.592126, 0, 0, 0, 1, 1,
1.840943, 1.904888, 0.03240456, 0, 0, 0, 1, 1,
1.846797, 1.476006, 0.5300797, 1, 1, 1, 1, 1,
1.875068, -2.367713, 2.110588, 1, 1, 1, 1, 1,
1.877715, 1.270794, 0.4010811, 1, 1, 1, 1, 1,
1.880416, 0.6798905, 1.200135, 1, 1, 1, 1, 1,
1.882323, -0.6876595, 3.935196, 1, 1, 1, 1, 1,
1.910508, -0.2194766, 2.114105, 1, 1, 1, 1, 1,
1.931406, 2.264692, 0.613603, 1, 1, 1, 1, 1,
1.951046, 0.3430144, 0.8446439, 1, 1, 1, 1, 1,
1.959331, -0.005689859, 1.969869, 1, 1, 1, 1, 1,
1.973645, -0.01165168, -0.4459789, 1, 1, 1, 1, 1,
1.986704, 0.39248, 1.472108, 1, 1, 1, 1, 1,
2.043121, 0.3837908, 1.220462, 1, 1, 1, 1, 1,
2.047669, -0.5975527, 2.542216, 1, 1, 1, 1, 1,
2.061837, 1.413085, -1.155305, 1, 1, 1, 1, 1,
2.085016, -0.9648505, 2.396291, 1, 1, 1, 1, 1,
2.096431, -0.4206043, 2.279255, 0, 0, 1, 1, 1,
2.111428, -1.044931, 3.50964, 1, 0, 0, 1, 1,
2.143452, -1.40958, -0.4178829, 1, 0, 0, 1, 1,
2.159253, -0.6084101, 0.1027544, 1, 0, 0, 1, 1,
2.175104, 0.9747483, 0.9083933, 1, 0, 0, 1, 1,
2.186444, 0.2257657, -1.600324, 1, 0, 0, 1, 1,
2.283586, 0.8058388, 1.541489, 0, 0, 0, 1, 1,
2.292312, -0.3784988, 2.046829, 0, 0, 0, 1, 1,
2.309949, 0.3344947, 2.841662, 0, 0, 0, 1, 1,
2.315467, 0.2290867, 2.13985, 0, 0, 0, 1, 1,
2.37531, 0.7960247, -0.8641024, 0, 0, 0, 1, 1,
2.383943, 0.1181776, 0.7161832, 0, 0, 0, 1, 1,
2.415576, 0.4201706, 1.29262, 0, 0, 0, 1, 1,
2.456185, 0.4974709, 2.338399, 1, 1, 1, 1, 1,
2.558567, 0.1097787, 0.8690124, 1, 1, 1, 1, 1,
2.696914, -2.479258, 1.646838, 1, 1, 1, 1, 1,
2.824474, -0.9930006, 2.189298, 1, 1, 1, 1, 1,
2.890477, 0.3683457, 2.17859, 1, 1, 1, 1, 1,
2.937159, 0.5412035, 2.039174, 1, 1, 1, 1, 1,
3.609324, 0.494306, 0.6591341, 1, 1, 1, 1, 1
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
var radius = 9.662595;
var distance = 33.93946;
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
mvMatrix.translate( 0.06471062, -0.2265713, -0.04790521 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.93946);
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
