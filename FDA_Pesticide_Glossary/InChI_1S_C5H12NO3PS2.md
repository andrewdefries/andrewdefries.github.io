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
-3.198447, -1.614778, -2.10176, 1, 0, 0, 1,
-3.05251, -0.4613466, -0.2464942, 1, 0.007843138, 0, 1,
-2.928307, -0.514767, -1.872097, 1, 0.01176471, 0, 1,
-2.735312, 1.633316, -1.449915, 1, 0.01960784, 0, 1,
-2.609139, 0.29942, -2.157829, 1, 0.02352941, 0, 1,
-2.483925, 0.3759463, -1.513265, 1, 0.03137255, 0, 1,
-2.434, 1.540497, -1.452507, 1, 0.03529412, 0, 1,
-2.429419, -0.01519708, -3.382931, 1, 0.04313726, 0, 1,
-2.387765, -0.9664578, -0.8687394, 1, 0.04705882, 0, 1,
-2.374125, -1.260376, -2.58584, 1, 0.05490196, 0, 1,
-2.342091, -2.232904, -3.828435, 1, 0.05882353, 0, 1,
-2.338749, -0.4194492, -3.036334, 1, 0.06666667, 0, 1,
-2.32158, 1.555344, -1.341558, 1, 0.07058824, 0, 1,
-2.22325, 0.1052663, -2.051868, 1, 0.07843138, 0, 1,
-2.221072, -1.639936, -3.007122, 1, 0.08235294, 0, 1,
-2.164104, 0.4350761, -2.832611, 1, 0.09019608, 0, 1,
-2.121196, -1.729465, -1.845628, 1, 0.09411765, 0, 1,
-2.118507, 1.428025, -3.495589, 1, 0.1019608, 0, 1,
-2.117108, -1.517344, -2.447999, 1, 0.1098039, 0, 1,
-2.116047, 0.617829, 0.5135515, 1, 0.1137255, 0, 1,
-2.111039, 2.163016, -0.916643, 1, 0.1215686, 0, 1,
-2.093276, 1.684089, -0.8158619, 1, 0.1254902, 0, 1,
-2.092632, -0.06965064, -1.565375, 1, 0.1333333, 0, 1,
-2.041035, 0.7306548, -4.041255, 1, 0.1372549, 0, 1,
-2.023321, -1.207844, -2.990315, 1, 0.145098, 0, 1,
-2.006482, -0.469391, -2.835108, 1, 0.1490196, 0, 1,
-2.003893, 0.09488757, -2.045346, 1, 0.1568628, 0, 1,
-1.996547, -3.31321, -1.076039, 1, 0.1607843, 0, 1,
-1.975145, 1.675466, -0.6160423, 1, 0.1686275, 0, 1,
-1.961023, 1.766554, -0.5238303, 1, 0.172549, 0, 1,
-1.958526, 0.262839, -0.411536, 1, 0.1803922, 0, 1,
-1.932245, 0.7034451, -0.8214551, 1, 0.1843137, 0, 1,
-1.925317, 1.24965, -0.4948718, 1, 0.1921569, 0, 1,
-1.913728, 1.191568, -1.094343, 1, 0.1960784, 0, 1,
-1.908817, -0.4073592, -1.291861, 1, 0.2039216, 0, 1,
-1.892205, 0.3182705, -0.6680112, 1, 0.2117647, 0, 1,
-1.803735, 2.302531, -1.723012, 1, 0.2156863, 0, 1,
-1.803232, -0.163922, -0.8906146, 1, 0.2235294, 0, 1,
-1.802699, 0.6918868, -0.8971155, 1, 0.227451, 0, 1,
-1.799706, 0.2740872, -1.982538, 1, 0.2352941, 0, 1,
-1.779534, 0.4534827, -2.891012, 1, 0.2392157, 0, 1,
-1.764881, -1.97473, -3.8571, 1, 0.2470588, 0, 1,
-1.759543, -2.333117, -3.951938, 1, 0.2509804, 0, 1,
-1.756743, 1.868973, 0.2157841, 1, 0.2588235, 0, 1,
-1.753003, 0.6771643, -0.7338702, 1, 0.2627451, 0, 1,
-1.739646, -1.14259, -0.1629739, 1, 0.2705882, 0, 1,
-1.730494, -0.645473, -2.491005, 1, 0.2745098, 0, 1,
-1.729398, -0.4364113, -1.947145, 1, 0.282353, 0, 1,
-1.713687, -0.9573336, -2.667852, 1, 0.2862745, 0, 1,
-1.712045, 0.7706124, -3.003771, 1, 0.2941177, 0, 1,
-1.690022, 1.055119, -1.370668, 1, 0.3019608, 0, 1,
-1.688643, 0.00138367, -1.374991, 1, 0.3058824, 0, 1,
-1.682102, 0.7960188, -2.418376, 1, 0.3137255, 0, 1,
-1.679767, -0.1936479, -4.446804, 1, 0.3176471, 0, 1,
-1.642432, 1.080271, -0.7362818, 1, 0.3254902, 0, 1,
-1.632349, 1.424956, 0.01639083, 1, 0.3294118, 0, 1,
-1.627215, -0.2126683, -1.43417, 1, 0.3372549, 0, 1,
-1.622536, -1.531996, -1.580942, 1, 0.3411765, 0, 1,
-1.621841, -0.01199093, -2.656812, 1, 0.3490196, 0, 1,
-1.613259, 1.907504, -0.845419, 1, 0.3529412, 0, 1,
-1.605887, 1.576454, -0.09347469, 1, 0.3607843, 0, 1,
-1.605685, -0.9160717, -2.051405, 1, 0.3647059, 0, 1,
-1.602722, 0.9789712, -0.8952722, 1, 0.372549, 0, 1,
-1.597075, 0.3583787, -0.6058977, 1, 0.3764706, 0, 1,
-1.596595, -1.32114, -1.521403, 1, 0.3843137, 0, 1,
-1.579382, 0.2209489, -1.395026, 1, 0.3882353, 0, 1,
-1.578161, 0.02768971, -0.3334704, 1, 0.3960784, 0, 1,
-1.577276, -1.060315, -0.7366264, 1, 0.4039216, 0, 1,
-1.575651, 1.36845, 0.1198164, 1, 0.4078431, 0, 1,
-1.565759, 1.753269, -0.8669963, 1, 0.4156863, 0, 1,
-1.562656, -0.8171779, -3.146773, 1, 0.4196078, 0, 1,
-1.52921, -1.348133, -1.826696, 1, 0.427451, 0, 1,
-1.525373, -0.2872398, -2.076569, 1, 0.4313726, 0, 1,
-1.507504, -0.2623297, -0.7934951, 1, 0.4392157, 0, 1,
-1.50738, -0.8733478, -1.904353, 1, 0.4431373, 0, 1,
-1.505504, 1.819193, 1.878235, 1, 0.4509804, 0, 1,
-1.477142, 0.7131364, -1.569483, 1, 0.454902, 0, 1,
-1.477049, -0.9709365, -2.533066, 1, 0.4627451, 0, 1,
-1.452489, -0.3708056, -1.575281, 1, 0.4666667, 0, 1,
-1.446019, -0.5843415, 0.02278547, 1, 0.4745098, 0, 1,
-1.444704, -0.3989707, -2.243053, 1, 0.4784314, 0, 1,
-1.437161, 0.02550677, -1.936525, 1, 0.4862745, 0, 1,
-1.433973, 0.7917462, -0.659771, 1, 0.4901961, 0, 1,
-1.431455, 0.1409262, -1.71219, 1, 0.4980392, 0, 1,
-1.420766, 1.30482, -0.5039694, 1, 0.5058824, 0, 1,
-1.414422, -0.2634054, -2.100358, 1, 0.509804, 0, 1,
-1.408787, -1.522931, -2.643868, 1, 0.5176471, 0, 1,
-1.403848, -0.4957733, -1.202224, 1, 0.5215687, 0, 1,
-1.400108, -0.9667128, -0.8330048, 1, 0.5294118, 0, 1,
-1.395862, -2.175912, -3.344621, 1, 0.5333334, 0, 1,
-1.383571, 1.549104, -0.9043304, 1, 0.5411765, 0, 1,
-1.382573, -0.253939, -3.761052, 1, 0.5450981, 0, 1,
-1.37096, 0.6109461, -0.9153492, 1, 0.5529412, 0, 1,
-1.368191, -1.243608, -3.822896, 1, 0.5568628, 0, 1,
-1.348686, 0.1279614, -0.9066741, 1, 0.5647059, 0, 1,
-1.340837, 0.2973038, -2.271189, 1, 0.5686275, 0, 1,
-1.340682, 1.549914, 0.2265526, 1, 0.5764706, 0, 1,
-1.33777, -0.346196, -1.610129, 1, 0.5803922, 0, 1,
-1.336737, 0.73597, -2.673077, 1, 0.5882353, 0, 1,
-1.323374, -0.4257401, -3.355031, 1, 0.5921569, 0, 1,
-1.32332, 0.9777072, -0.211893, 1, 0.6, 0, 1,
-1.322876, -0.6808479, -0.932688, 1, 0.6078432, 0, 1,
-1.319691, 0.2481179, -2.099414, 1, 0.6117647, 0, 1,
-1.312791, 1.064363, -2.394796, 1, 0.6196079, 0, 1,
-1.309662, 1.047067, -1.972321, 1, 0.6235294, 0, 1,
-1.30965, -0.1033251, -2.796059, 1, 0.6313726, 0, 1,
-1.290524, 1.212475, -0.8167261, 1, 0.6352941, 0, 1,
-1.286002, 0.1361412, -1.809801, 1, 0.6431373, 0, 1,
-1.276657, -1.005506, -2.465154, 1, 0.6470588, 0, 1,
-1.276349, 0.07533475, -1.133208, 1, 0.654902, 0, 1,
-1.271017, 0.0646035, -1.00009, 1, 0.6588235, 0, 1,
-1.269528, -1.065942, -0.7034655, 1, 0.6666667, 0, 1,
-1.265509, -0.109869, -1.634908, 1, 0.6705883, 0, 1,
-1.261456, 0.09930456, -1.955997, 1, 0.6784314, 0, 1,
-1.251863, -0.9424831, -1.164273, 1, 0.682353, 0, 1,
-1.242676, -0.3471937, -1.071498, 1, 0.6901961, 0, 1,
-1.238721, 0.8086346, -2.329353, 1, 0.6941177, 0, 1,
-1.235845, -0.6664551, -0.7846029, 1, 0.7019608, 0, 1,
-1.234155, -0.0275541, -1.441303, 1, 0.7098039, 0, 1,
-1.233936, 0.4497291, -1.765742, 1, 0.7137255, 0, 1,
-1.2296, 0.7368794, -0.6070812, 1, 0.7215686, 0, 1,
-1.228178, -0.4543046, -2.034968, 1, 0.7254902, 0, 1,
-1.22293, -0.9665765, -1.25886, 1, 0.7333333, 0, 1,
-1.222625, 0.8612673, -0.7034902, 1, 0.7372549, 0, 1,
-1.219603, 0.4684615, -1.863136, 1, 0.7450981, 0, 1,
-1.216261, -0.6510417, -3.102959, 1, 0.7490196, 0, 1,
-1.202309, 0.02295477, -1.698973, 1, 0.7568628, 0, 1,
-1.197919, 1.279645, 0.6458666, 1, 0.7607843, 0, 1,
-1.194973, -0.7121048, -2.474673, 1, 0.7686275, 0, 1,
-1.193284, -0.06875655, -0.8406908, 1, 0.772549, 0, 1,
-1.191399, -1.554662, -0.5917734, 1, 0.7803922, 0, 1,
-1.187002, -0.7462338, -2.297819, 1, 0.7843137, 0, 1,
-1.186653, 0.6436573, -1.175895, 1, 0.7921569, 0, 1,
-1.177253, -0.6918949, -0.4919636, 1, 0.7960784, 0, 1,
-1.16264, -0.4298943, -0.8751963, 1, 0.8039216, 0, 1,
-1.16256, 0.2453533, -2.368177, 1, 0.8117647, 0, 1,
-1.161944, -0.06984684, -2.052478, 1, 0.8156863, 0, 1,
-1.160882, -0.6886166, -2.46604, 1, 0.8235294, 0, 1,
-1.157091, -1.687593, -3.919407, 1, 0.827451, 0, 1,
-1.15202, 0.871892, -1.525654, 1, 0.8352941, 0, 1,
-1.144197, 0.1544759, -2.764077, 1, 0.8392157, 0, 1,
-1.141665, -1.918049, -0.4323989, 1, 0.8470588, 0, 1,
-1.138926, 0.2139558, -1.820574, 1, 0.8509804, 0, 1,
-1.136785, -0.9317859, -0.7256884, 1, 0.8588235, 0, 1,
-1.130068, -0.6051289, -2.883868, 1, 0.8627451, 0, 1,
-1.121908, -0.6083611, -1.709678, 1, 0.8705882, 0, 1,
-1.112892, 1.651918, -0.1949178, 1, 0.8745098, 0, 1,
-1.112005, -1.292546, -3.028825, 1, 0.8823529, 0, 1,
-1.109966, -1.224265, -4.450401, 1, 0.8862745, 0, 1,
-1.102225, 2.482414, -0.4489676, 1, 0.8941177, 0, 1,
-1.095333, -0.4559183, -1.284879, 1, 0.8980392, 0, 1,
-1.084729, 2.074379, -0.4330309, 1, 0.9058824, 0, 1,
-1.083573, 1.949534, 0.7200652, 1, 0.9137255, 0, 1,
-1.076534, 0.0588752, -0.6232396, 1, 0.9176471, 0, 1,
-1.072547, -0.6991579, -2.230664, 1, 0.9254902, 0, 1,
-1.071933, -0.5509642, -1.81287, 1, 0.9294118, 0, 1,
-1.068111, 0.6740239, 0.04736659, 1, 0.9372549, 0, 1,
-1.06766, -0.2655584, -0.9192005, 1, 0.9411765, 0, 1,
-1.066461, 2.733837, -1.057775, 1, 0.9490196, 0, 1,
-1.054354, 1.215488, -0.05735023, 1, 0.9529412, 0, 1,
-1.050626, 0.9204548, -0.04060857, 1, 0.9607843, 0, 1,
-1.045079, 0.5317202, -0.9957202, 1, 0.9647059, 0, 1,
-1.037961, -0.6875857, -3.535179, 1, 0.972549, 0, 1,
-1.036321, 1.387597, -0.7837572, 1, 0.9764706, 0, 1,
-1.031575, -0.8974973, -2.164927, 1, 0.9843137, 0, 1,
-1.029921, -0.777798, -2.483953, 1, 0.9882353, 0, 1,
-1.028231, 1.224976, -1.89755, 1, 0.9960784, 0, 1,
-1.023211, -0.2501579, -1.381521, 0.9960784, 1, 0, 1,
-1.021913, 0.5824144, -2.925568, 0.9921569, 1, 0, 1,
-1.018496, 0.1417868, -1.294378, 0.9843137, 1, 0, 1,
-1.009032, -0.9027928, -0.4867018, 0.9803922, 1, 0, 1,
-1.008133, -0.002153181, -0.9652724, 0.972549, 1, 0, 1,
-1.005725, -0.7904747, -2.857952, 0.9686275, 1, 0, 1,
-0.9878527, -0.003577327, -0.5898919, 0.9607843, 1, 0, 1,
-0.9825375, -0.8349081, -4.337889, 0.9568627, 1, 0, 1,
-0.9824069, 0.06636388, -1.379288, 0.9490196, 1, 0, 1,
-0.9794565, -0.591821, -3.396662, 0.945098, 1, 0, 1,
-0.9770977, 0.3141169, -0.2610973, 0.9372549, 1, 0, 1,
-0.9737372, 0.6596995, -2.593956, 0.9333333, 1, 0, 1,
-0.9698831, 0.2106572, -2.686961, 0.9254902, 1, 0, 1,
-0.9625809, 0.07260448, -0.4482423, 0.9215686, 1, 0, 1,
-0.9593076, -0.02530386, -1.366041, 0.9137255, 1, 0, 1,
-0.9573399, 1.621931, 1.50146, 0.9098039, 1, 0, 1,
-0.9556893, -1.156278, -3.242789, 0.9019608, 1, 0, 1,
-0.9540702, 0.1493734, -2.511003, 0.8941177, 1, 0, 1,
-0.9536079, 1.374852, -0.6059844, 0.8901961, 1, 0, 1,
-0.9488239, 0.3096196, -2.018366, 0.8823529, 1, 0, 1,
-0.9469773, -1.096664, -1.968589, 0.8784314, 1, 0, 1,
-0.9394258, -1.187551, -3.006703, 0.8705882, 1, 0, 1,
-0.938026, 1.032318, -0.3926667, 0.8666667, 1, 0, 1,
-0.9224988, 1.025559, -1.625112, 0.8588235, 1, 0, 1,
-0.9220454, -0.0449226, -1.239796, 0.854902, 1, 0, 1,
-0.9186991, 0.7177993, -0.3910512, 0.8470588, 1, 0, 1,
-0.8950676, 0.1385706, -1.805219, 0.8431373, 1, 0, 1,
-0.8926812, -1.729183, -0.6808968, 0.8352941, 1, 0, 1,
-0.891053, 0.34719, -1.000041, 0.8313726, 1, 0, 1,
-0.8867577, -0.9224945, -2.87625, 0.8235294, 1, 0, 1,
-0.8708966, 0.9459766, -1.702045, 0.8196079, 1, 0, 1,
-0.8686917, -0.02633949, -2.589032, 0.8117647, 1, 0, 1,
-0.8683543, -1.554621, -2.929708, 0.8078431, 1, 0, 1,
-0.8648851, 0.7152346, 0.4172888, 0.8, 1, 0, 1,
-0.862492, 0.5600668, -1.450985, 0.7921569, 1, 0, 1,
-0.8560817, -0.4177077, -1.954224, 0.7882353, 1, 0, 1,
-0.8514215, 0.676454, -0.2027026, 0.7803922, 1, 0, 1,
-0.8502953, -0.2379342, -2.41877, 0.7764706, 1, 0, 1,
-0.8460405, 2.189093, -1.773732, 0.7686275, 1, 0, 1,
-0.8365692, 0.8521833, -2.026317, 0.7647059, 1, 0, 1,
-0.8338082, -0.9524598, -4.20386, 0.7568628, 1, 0, 1,
-0.829173, -0.01288337, -1.079116, 0.7529412, 1, 0, 1,
-0.8232285, 0.06252024, -1.809463, 0.7450981, 1, 0, 1,
-0.8141972, 1.933053, 0.2300469, 0.7411765, 1, 0, 1,
-0.8110147, 0.2876679, -0.8569859, 0.7333333, 1, 0, 1,
-0.8106385, 1.03766, -0.2157348, 0.7294118, 1, 0, 1,
-0.7969531, 0.2723098, -2.639781, 0.7215686, 1, 0, 1,
-0.7950607, -0.06745401, -1.076415, 0.7176471, 1, 0, 1,
-0.7945915, -1.871758, -1.332195, 0.7098039, 1, 0, 1,
-0.7915672, -0.6359262, -2.128286, 0.7058824, 1, 0, 1,
-0.7895108, -1.453364, -3.17274, 0.6980392, 1, 0, 1,
-0.7828679, 0.3449456, -1.670612, 0.6901961, 1, 0, 1,
-0.7826499, 0.4421125, 0.1485347, 0.6862745, 1, 0, 1,
-0.7791353, -0.4192374, 0.4253983, 0.6784314, 1, 0, 1,
-0.7783498, -0.7284057, -3.198298, 0.6745098, 1, 0, 1,
-0.7707106, 0.03984276, -2.022879, 0.6666667, 1, 0, 1,
-0.7689345, 0.1463288, -0.689191, 0.6627451, 1, 0, 1,
-0.7676547, 0.7770345, -1.550519, 0.654902, 1, 0, 1,
-0.7662255, 0.5938458, 0.6361392, 0.6509804, 1, 0, 1,
-0.7584546, 0.7003098, -2.447821, 0.6431373, 1, 0, 1,
-0.7570987, 0.05357916, -1.584084, 0.6392157, 1, 0, 1,
-0.7449139, -2.481755, -2.770208, 0.6313726, 1, 0, 1,
-0.7427036, -0.3622445, -3.573978, 0.627451, 1, 0, 1,
-0.7394939, -0.1899833, -0.3722112, 0.6196079, 1, 0, 1,
-0.7367311, 0.7856166, -2.535396, 0.6156863, 1, 0, 1,
-0.7297195, 0.4920126, -1.068857, 0.6078432, 1, 0, 1,
-0.7297006, -1.83877, -2.598463, 0.6039216, 1, 0, 1,
-0.7239938, -0.3009163, -1.059557, 0.5960785, 1, 0, 1,
-0.719279, 1.689984, -0.4922794, 0.5882353, 1, 0, 1,
-0.7168584, -1.058965, -2.926818, 0.5843138, 1, 0, 1,
-0.7160404, -0.6910357, -3.81102, 0.5764706, 1, 0, 1,
-0.7064461, -1.12547, -3.066977, 0.572549, 1, 0, 1,
-0.7020687, 0.27303, -2.159884, 0.5647059, 1, 0, 1,
-0.7018166, -0.0524282, -2.96642, 0.5607843, 1, 0, 1,
-0.6957799, 1.059162, -1.022772, 0.5529412, 1, 0, 1,
-0.6880357, 0.551545, -2.050966, 0.5490196, 1, 0, 1,
-0.6873643, -0.9606107, -3.166294, 0.5411765, 1, 0, 1,
-0.6855701, -0.7195026, -2.30494, 0.5372549, 1, 0, 1,
-0.6851745, -0.228459, -2.837057, 0.5294118, 1, 0, 1,
-0.6847595, -0.5511773, -2.332337, 0.5254902, 1, 0, 1,
-0.6802709, 1.628693, -1.0379, 0.5176471, 1, 0, 1,
-0.6769881, -0.1448022, -1.182543, 0.5137255, 1, 0, 1,
-0.6665833, 1.260734, -0.8085785, 0.5058824, 1, 0, 1,
-0.6634133, -1.40035, -3.513074, 0.5019608, 1, 0, 1,
-0.6624781, -0.29173, -1.916353, 0.4941176, 1, 0, 1,
-0.658053, 0.7274039, -1.032264, 0.4862745, 1, 0, 1,
-0.6512207, -0.8240954, -3.335989, 0.4823529, 1, 0, 1,
-0.6499495, -0.5287015, -2.911397, 0.4745098, 1, 0, 1,
-0.6472966, -1.347723, -1.828403, 0.4705882, 1, 0, 1,
-0.6438328, -0.5139679, -2.583778, 0.4627451, 1, 0, 1,
-0.6392205, -0.01749629, -1.69212, 0.4588235, 1, 0, 1,
-0.637963, -1.590713, -3.111158, 0.4509804, 1, 0, 1,
-0.6352315, 0.4580244, -0.4523067, 0.4470588, 1, 0, 1,
-0.6334251, -0.4615104, -1.927345, 0.4392157, 1, 0, 1,
-0.6322368, -0.03123327, -2.147719, 0.4352941, 1, 0, 1,
-0.6315296, -0.8502776, -2.262686, 0.427451, 1, 0, 1,
-0.6313351, -0.1183305, -1.903278, 0.4235294, 1, 0, 1,
-0.6282784, -0.4657253, -1.420296, 0.4156863, 1, 0, 1,
-0.6264498, -1.007198, -2.244157, 0.4117647, 1, 0, 1,
-0.6206301, -1.898576, -3.192555, 0.4039216, 1, 0, 1,
-0.6196541, -0.3919523, -2.134848, 0.3960784, 1, 0, 1,
-0.6100053, -0.7093014, -1.573412, 0.3921569, 1, 0, 1,
-0.6098917, 0.2433654, 0.7814227, 0.3843137, 1, 0, 1,
-0.6092081, 0.1422665, -1.011395, 0.3803922, 1, 0, 1,
-0.6081353, -0.2290784, -0.5166935, 0.372549, 1, 0, 1,
-0.6023046, -0.2571225, -1.86636, 0.3686275, 1, 0, 1,
-0.6015125, -0.3593379, -1.477423, 0.3607843, 1, 0, 1,
-0.5982507, 0.9920627, -1.711025, 0.3568628, 1, 0, 1,
-0.5953886, -0.001831765, -1.287419, 0.3490196, 1, 0, 1,
-0.5951214, -0.6841736, -3.929157, 0.345098, 1, 0, 1,
-0.5863167, 0.05649072, -0.4737754, 0.3372549, 1, 0, 1,
-0.5855724, 0.3410673, -2.857102, 0.3333333, 1, 0, 1,
-0.5845212, 0.1588698, -1.28829, 0.3254902, 1, 0, 1,
-0.5813263, 0.05394242, -1.228531, 0.3215686, 1, 0, 1,
-0.5801553, -0.3069446, -2.849408, 0.3137255, 1, 0, 1,
-0.5784486, 0.4936302, -2.988219, 0.3098039, 1, 0, 1,
-0.5766978, 0.545154, -0.1908814, 0.3019608, 1, 0, 1,
-0.5765554, -0.2106662, -2.650416, 0.2941177, 1, 0, 1,
-0.57176, 0.96047, -0.1179897, 0.2901961, 1, 0, 1,
-0.5661483, 0.8405265, -1.679777, 0.282353, 1, 0, 1,
-0.5595649, 0.04828146, -2.97523, 0.2784314, 1, 0, 1,
-0.5557256, 0.5756406, 1.19999, 0.2705882, 1, 0, 1,
-0.546567, 1.324017, -1.117006, 0.2666667, 1, 0, 1,
-0.5396374, 0.5696207, -0.9878885, 0.2588235, 1, 0, 1,
-0.5378382, 0.9777176, -0.2783555, 0.254902, 1, 0, 1,
-0.5374071, 1.037111, -2.552386, 0.2470588, 1, 0, 1,
-0.5356824, -1.22917, -2.725428, 0.2431373, 1, 0, 1,
-0.5345601, -0.5405998, -1.991209, 0.2352941, 1, 0, 1,
-0.5274565, 1.255444, -0.9054906, 0.2313726, 1, 0, 1,
-0.5246781, -0.1048828, -2.514058, 0.2235294, 1, 0, 1,
-0.5129392, -1.60181, -2.831417, 0.2196078, 1, 0, 1,
-0.5110722, -0.172244, -3.223173, 0.2117647, 1, 0, 1,
-0.5016211, 0.8844105, -2.003858, 0.2078431, 1, 0, 1,
-0.4997136, 0.3421059, 0.2962867, 0.2, 1, 0, 1,
-0.491354, 1.19683, 1.337829, 0.1921569, 1, 0, 1,
-0.4882045, 0.3113768, -0.4279733, 0.1882353, 1, 0, 1,
-0.4856957, -0.3716245, -2.726954, 0.1803922, 1, 0, 1,
-0.4741205, -0.8638581, -2.540243, 0.1764706, 1, 0, 1,
-0.4728558, -0.3991315, -1.499115, 0.1686275, 1, 0, 1,
-0.4694563, -0.8479066, -4.034222, 0.1647059, 1, 0, 1,
-0.4693031, 0.4820605, -0.1795536, 0.1568628, 1, 0, 1,
-0.4662516, -1.385826, -2.524205, 0.1529412, 1, 0, 1,
-0.46473, -0.7704467, -2.77482, 0.145098, 1, 0, 1,
-0.46057, -0.7756115, -3.731984, 0.1411765, 1, 0, 1,
-0.4588421, -0.6165321, -3.861848, 0.1333333, 1, 0, 1,
-0.4582624, -0.4628502, -2.42328, 0.1294118, 1, 0, 1,
-0.4546337, -1.5975, -4.479654, 0.1215686, 1, 0, 1,
-0.4489243, 0.2500497, -0.3124123, 0.1176471, 1, 0, 1,
-0.4483932, 1.511158, 0.7174052, 0.1098039, 1, 0, 1,
-0.4470107, 1.181547, -0.8917037, 0.1058824, 1, 0, 1,
-0.4403476, 1.134595, -0.7227855, 0.09803922, 1, 0, 1,
-0.4367376, -0.1452902, -1.360446, 0.09019608, 1, 0, 1,
-0.4232904, 0.4978085, -0.6731359, 0.08627451, 1, 0, 1,
-0.4146017, -1.379086, -3.717684, 0.07843138, 1, 0, 1,
-0.4122197, -0.733757, -1.798095, 0.07450981, 1, 0, 1,
-0.4081222, -1.079764, -3.608081, 0.06666667, 1, 0, 1,
-0.4061646, 0.01017471, -3.299326, 0.0627451, 1, 0, 1,
-0.3973207, -1.533288, -2.017394, 0.05490196, 1, 0, 1,
-0.3967725, 0.07957732, -2.411733, 0.05098039, 1, 0, 1,
-0.3936801, 0.3862213, -0.006776437, 0.04313726, 1, 0, 1,
-0.3915627, 0.6276504, 0.1618933, 0.03921569, 1, 0, 1,
-0.3895256, -1.556737, -3.474058, 0.03137255, 1, 0, 1,
-0.3889217, -1.110513, -2.2763, 0.02745098, 1, 0, 1,
-0.3864084, 1.614144, 0.2885179, 0.01960784, 1, 0, 1,
-0.3862817, -1.297776, -3.110968, 0.01568628, 1, 0, 1,
-0.378664, 0.3363909, -1.212966, 0.007843138, 1, 0, 1,
-0.3768899, -1.478486, -3.630041, 0.003921569, 1, 0, 1,
-0.3757197, -0.7782994, -2.216558, 0, 1, 0.003921569, 1,
-0.3655554, 0.8888263, 1.03395, 0, 1, 0.01176471, 1,
-0.3643278, -0.3369427, -1.577039, 0, 1, 0.01568628, 1,
-0.3607241, -0.4171484, -2.89856, 0, 1, 0.02352941, 1,
-0.3531229, -0.4472813, -2.002049, 0, 1, 0.02745098, 1,
-0.3491265, 0.5730486, -1.011266, 0, 1, 0.03529412, 1,
-0.348497, 0.5673788, 0.2779838, 0, 1, 0.03921569, 1,
-0.3484663, 1.342596, -0.1434103, 0, 1, 0.04705882, 1,
-0.3461075, 0.4426672, -0.343206, 0, 1, 0.05098039, 1,
-0.3448834, 0.3063745, 0.5747852, 0, 1, 0.05882353, 1,
-0.3422686, 0.08093078, -1.684074, 0, 1, 0.0627451, 1,
-0.3413675, -0.1198239, -1.226723, 0, 1, 0.07058824, 1,
-0.3237697, -0.3805337, -1.497604, 0, 1, 0.07450981, 1,
-0.3197817, 1.762133, 0.7588568, 0, 1, 0.08235294, 1,
-0.3146366, 0.5602677, 1.300602, 0, 1, 0.08627451, 1,
-0.3109099, -0.4050063, -2.81875, 0, 1, 0.09411765, 1,
-0.3108378, -2.927568, -1.676927, 0, 1, 0.1019608, 1,
-0.3102373, -0.2971805, -3.284529, 0, 1, 0.1058824, 1,
-0.3078048, -0.9264245, -1.243157, 0, 1, 0.1137255, 1,
-0.3047445, 0.5345687, -0.9233046, 0, 1, 0.1176471, 1,
-0.3028051, 0.583056, -1.406606, 0, 1, 0.1254902, 1,
-0.3022037, -0.7414506, -2.881018, 0, 1, 0.1294118, 1,
-0.2986687, 0.5125589, 0.5720341, 0, 1, 0.1372549, 1,
-0.2956306, 0.3548586, -1.530641, 0, 1, 0.1411765, 1,
-0.2943622, 0.7217213, -0.3503202, 0, 1, 0.1490196, 1,
-0.2928386, -1.123241, -1.907876, 0, 1, 0.1529412, 1,
-0.2841295, -0.03121748, -2.883342, 0, 1, 0.1607843, 1,
-0.2778236, -2.136819, -3.490893, 0, 1, 0.1647059, 1,
-0.2742876, 1.611067, 0.8412136, 0, 1, 0.172549, 1,
-0.2732471, 0.9764579, -0.3978815, 0, 1, 0.1764706, 1,
-0.2720537, -0.4339665, -2.490144, 0, 1, 0.1843137, 1,
-0.2714985, 0.6021362, -1.46791, 0, 1, 0.1882353, 1,
-0.2705403, 1.219776, -0.8518385, 0, 1, 0.1960784, 1,
-0.2694863, -0.849989, -3.239614, 0, 1, 0.2039216, 1,
-0.2687183, -0.6848567, -2.542216, 0, 1, 0.2078431, 1,
-0.2673381, 1.104537, 0.4797665, 0, 1, 0.2156863, 1,
-0.261776, -0.2127579, -1.516039, 0, 1, 0.2196078, 1,
-0.2601585, 0.2670603, -1.568096, 0, 1, 0.227451, 1,
-0.2585358, 0.5675961, -0.09051473, 0, 1, 0.2313726, 1,
-0.2509385, 1.063097, 0.3248813, 0, 1, 0.2392157, 1,
-0.2496278, 0.05258245, -1.717559, 0, 1, 0.2431373, 1,
-0.2478863, 0.02725808, -2.726386, 0, 1, 0.2509804, 1,
-0.2478786, -0.06998395, -2.062267, 0, 1, 0.254902, 1,
-0.2478552, -0.376678, -2.708942, 0, 1, 0.2627451, 1,
-0.2465733, -0.7645326, -4.193213, 0, 1, 0.2666667, 1,
-0.2458069, 0.212779, -1.026033, 0, 1, 0.2745098, 1,
-0.2450163, -0.7541229, -4.255492, 0, 1, 0.2784314, 1,
-0.2444461, 0.9121168, 0.69633, 0, 1, 0.2862745, 1,
-0.2426479, -1.182215, -3.638215, 0, 1, 0.2901961, 1,
-0.2423133, -0.04644982, -1.782115, 0, 1, 0.2980392, 1,
-0.2356119, 0.2261447, -0.5194852, 0, 1, 0.3058824, 1,
-0.2354901, 1.233037, -0.5936414, 0, 1, 0.3098039, 1,
-0.2186059, 1.783523, -0.5365443, 0, 1, 0.3176471, 1,
-0.2162635, -0.2920221, -2.474484, 0, 1, 0.3215686, 1,
-0.2138903, 1.391051, -1.127928, 0, 1, 0.3294118, 1,
-0.2137964, 1.118201, 1.715644, 0, 1, 0.3333333, 1,
-0.2103434, -0.7131792, -2.182165, 0, 1, 0.3411765, 1,
-0.2057852, -0.8693789, -2.697308, 0, 1, 0.345098, 1,
-0.2052264, -0.5125852, -2.491218, 0, 1, 0.3529412, 1,
-0.2036493, 0.5961409, 0.01566127, 0, 1, 0.3568628, 1,
-0.2008413, 0.1434747, -0.6633948, 0, 1, 0.3647059, 1,
-0.1959681, -0.4626735, -3.591389, 0, 1, 0.3686275, 1,
-0.1921248, -0.9233235, -4.936378, 0, 1, 0.3764706, 1,
-0.1856494, -0.2921455, -2.031081, 0, 1, 0.3803922, 1,
-0.1853611, 0.9263978, 0.5494934, 0, 1, 0.3882353, 1,
-0.1833502, 0.8854483, -0.3351097, 0, 1, 0.3921569, 1,
-0.1828408, -1.551027, -2.723702, 0, 1, 0.4, 1,
-0.1818255, -0.6582749, -2.525206, 0, 1, 0.4078431, 1,
-0.180713, 0.1255597, -0.8383447, 0, 1, 0.4117647, 1,
-0.1792197, 1.600794, 0.503432, 0, 1, 0.4196078, 1,
-0.1750957, 0.3076253, -0.9176716, 0, 1, 0.4235294, 1,
-0.1735719, 0.01395658, -2.612405, 0, 1, 0.4313726, 1,
-0.1713905, 0.2697878, -1.981561, 0, 1, 0.4352941, 1,
-0.1692715, -0.1239382, -2.650326, 0, 1, 0.4431373, 1,
-0.1663343, 0.4379201, -0.5058113, 0, 1, 0.4470588, 1,
-0.1661991, -2.197394, -2.361003, 0, 1, 0.454902, 1,
-0.165362, 1.230212, 0.08504304, 0, 1, 0.4588235, 1,
-0.1608799, 1.337201, 1.616454, 0, 1, 0.4666667, 1,
-0.1535665, 0.7267501, -0.3856474, 0, 1, 0.4705882, 1,
-0.1464596, -1.230806, -2.291949, 0, 1, 0.4784314, 1,
-0.1464573, -0.1513247, -0.9668244, 0, 1, 0.4823529, 1,
-0.1407163, -0.4217823, -2.104437, 0, 1, 0.4901961, 1,
-0.1389204, -0.4154372, -3.501379, 0, 1, 0.4941176, 1,
-0.1364871, 2.179199, 0.2458185, 0, 1, 0.5019608, 1,
-0.1360757, -0.7895384, -3.233629, 0, 1, 0.509804, 1,
-0.1349339, 0.8470042, 0.4122593, 0, 1, 0.5137255, 1,
-0.1335389, 0.3959112, 0.8050292, 0, 1, 0.5215687, 1,
-0.130407, 1.949775, -1.414124, 0, 1, 0.5254902, 1,
-0.1303662, -1.281746, -1.672435, 0, 1, 0.5333334, 1,
-0.1240938, 0.4355823, 0.8037015, 0, 1, 0.5372549, 1,
-0.1198642, -0.9086775, -2.28509, 0, 1, 0.5450981, 1,
-0.1158739, -0.4244242, -1.62263, 0, 1, 0.5490196, 1,
-0.1136814, 0.8960949, 1.044158, 0, 1, 0.5568628, 1,
-0.1134368, 1.103326, 0.3374127, 0, 1, 0.5607843, 1,
-0.1119747, 1.091845, 1.963796, 0, 1, 0.5686275, 1,
-0.1085125, 0.3134432, -2.045439, 0, 1, 0.572549, 1,
-0.1068754, -0.4357254, -3.571543, 0, 1, 0.5803922, 1,
-0.1064774, 0.9199049, -1.515256, 0, 1, 0.5843138, 1,
-0.1048351, 1.165098, -0.468643, 0, 1, 0.5921569, 1,
-0.1032977, 0.6421615, 0.4899532, 0, 1, 0.5960785, 1,
-0.09983587, -0.2925578, -3.395438, 0, 1, 0.6039216, 1,
-0.09777848, 0.8636208, -0.05592358, 0, 1, 0.6117647, 1,
-0.09092726, 0.4531626, -1.658029, 0, 1, 0.6156863, 1,
-0.08730164, 0.09174029, -2.177622, 0, 1, 0.6235294, 1,
-0.08638351, 1.142338, 1.015002, 0, 1, 0.627451, 1,
-0.08432893, -0.3619522, -2.022454, 0, 1, 0.6352941, 1,
-0.08257904, -1.638255, -4.327164, 0, 1, 0.6392157, 1,
-0.07769725, 1.805272, 0.03885978, 0, 1, 0.6470588, 1,
-0.07711787, 1.076207, -0.8816311, 0, 1, 0.6509804, 1,
-0.06911256, -2.133997, -3.580179, 0, 1, 0.6588235, 1,
-0.06721873, 0.6918583, -0.2645662, 0, 1, 0.6627451, 1,
-0.0628355, 1.448185, -1.048919, 0, 1, 0.6705883, 1,
-0.06029978, -0.03342287, -1.260244, 0, 1, 0.6745098, 1,
-0.0589954, 2.315927, -0.3695379, 0, 1, 0.682353, 1,
-0.05585574, -1.177757, -4.259785, 0, 1, 0.6862745, 1,
-0.04777094, 0.5784622, -1.412361, 0, 1, 0.6941177, 1,
-0.04296372, 1.181918, 1.222651, 0, 1, 0.7019608, 1,
-0.04270284, -1.0244, -3.181939, 0, 1, 0.7058824, 1,
-0.04123446, 1.517238, 0.188669, 0, 1, 0.7137255, 1,
-0.04082689, 1.338878, -1.116479, 0, 1, 0.7176471, 1,
-0.04067329, -0.6065649, -1.902983, 0, 1, 0.7254902, 1,
-0.03553034, -0.8559018, -2.303351, 0, 1, 0.7294118, 1,
-0.03394806, 0.03408129, -0.9984765, 0, 1, 0.7372549, 1,
-0.03355492, 0.08681124, 0.5379807, 0, 1, 0.7411765, 1,
-0.03036289, 1.284002, -0.01320621, 0, 1, 0.7490196, 1,
-0.02528208, -0.4279609, -3.027512, 0, 1, 0.7529412, 1,
-0.02003172, 0.2192848, -1.590612, 0, 1, 0.7607843, 1,
-0.01846407, 1.357988, -0.005147104, 0, 1, 0.7647059, 1,
-0.01713802, 0.2357465, -1.463691, 0, 1, 0.772549, 1,
-0.01709291, -0.4514075, -2.498327, 0, 1, 0.7764706, 1,
-0.01336377, -1.248833, -3.267555, 0, 1, 0.7843137, 1,
-0.01178693, -0.1022817, -3.87247, 0, 1, 0.7882353, 1,
-0.008587395, 1.579641, -1.845923, 0, 1, 0.7960784, 1,
-0.008248103, -0.9793718, -2.236748, 0, 1, 0.8039216, 1,
-0.003527067, 1.398251, 0.02262919, 0, 1, 0.8078431, 1,
0.002099398, -0.8207507, 2.370301, 0, 1, 0.8156863, 1,
0.005779118, 1.249787, 2.502189, 0, 1, 0.8196079, 1,
0.006753983, -1.542243, 5.750076, 0, 1, 0.827451, 1,
0.006810329, 0.2527878, 0.5801528, 0, 1, 0.8313726, 1,
0.01978926, -0.677037, 2.845496, 0, 1, 0.8392157, 1,
0.02315866, 0.2721889, 0.9450755, 0, 1, 0.8431373, 1,
0.02474428, -1.197628, 2.433, 0, 1, 0.8509804, 1,
0.02514328, 0.8857672, 0.010866, 0, 1, 0.854902, 1,
0.02738516, -0.5957959, 3.424575, 0, 1, 0.8627451, 1,
0.02780299, 0.7542497, 0.1984183, 0, 1, 0.8666667, 1,
0.03052854, 0.4220325, -0.288343, 0, 1, 0.8745098, 1,
0.03312297, 1.907227, 2.538385, 0, 1, 0.8784314, 1,
0.03546755, 1.982158, 0.8119951, 0, 1, 0.8862745, 1,
0.03927095, 1.443021, 1.331613, 0, 1, 0.8901961, 1,
0.04151832, 0.5296565, -1.411974, 0, 1, 0.8980392, 1,
0.04197164, 1.183978, 0.9050586, 0, 1, 0.9058824, 1,
0.04275902, 0.09715242, 0.4914989, 0, 1, 0.9098039, 1,
0.0444071, 1.069348, 0.1759648, 0, 1, 0.9176471, 1,
0.04696135, 1.959415, -1.413837, 0, 1, 0.9215686, 1,
0.05096691, -0.03119377, 2.436007, 0, 1, 0.9294118, 1,
0.05459352, -0.5884177, 3.487803, 0, 1, 0.9333333, 1,
0.05523251, -1.484558, 3.390213, 0, 1, 0.9411765, 1,
0.05796833, 0.2060553, 1.54552, 0, 1, 0.945098, 1,
0.06337883, 1.699971, -0.2982121, 0, 1, 0.9529412, 1,
0.06709057, 0.451987, 0.8291389, 0, 1, 0.9568627, 1,
0.06749418, -0.6239953, 1.940642, 0, 1, 0.9647059, 1,
0.06954658, -0.9798312, 1.452799, 0, 1, 0.9686275, 1,
0.07074457, 0.5167749, 0.7565919, 0, 1, 0.9764706, 1,
0.07328549, -0.5796844, 3.463978, 0, 1, 0.9803922, 1,
0.07529259, -0.207036, 3.5075, 0, 1, 0.9882353, 1,
0.07533816, 1.04504, -0.6013049, 0, 1, 0.9921569, 1,
0.07568412, -0.6637781, 4.501229, 0, 1, 1, 1,
0.07811864, -1.097185, 4.449372, 0, 0.9921569, 1, 1,
0.0914172, 0.07818978, -1.057696, 0, 0.9882353, 1, 1,
0.09465277, -0.863945, 2.277309, 0, 0.9803922, 1, 1,
0.09643424, 1.585777, 0.3072332, 0, 0.9764706, 1, 1,
0.09661718, -1.239716, 1.929477, 0, 0.9686275, 1, 1,
0.1019032, -1.616582, 4.89727, 0, 0.9647059, 1, 1,
0.1025781, -1.298245, 3.149741, 0, 0.9568627, 1, 1,
0.1039407, 0.7007213, 0.6439937, 0, 0.9529412, 1, 1,
0.1060422, -0.60955, 3.716507, 0, 0.945098, 1, 1,
0.1108289, 0.211172, 0.9490225, 0, 0.9411765, 1, 1,
0.1124244, -0.2330205, 1.992865, 0, 0.9333333, 1, 1,
0.1149132, 0.8494129, -0.1963873, 0, 0.9294118, 1, 1,
0.1154783, -0.1584458, 2.386913, 0, 0.9215686, 1, 1,
0.1220829, -0.299028, 1.563718, 0, 0.9176471, 1, 1,
0.123083, 0.442591, 0.5302686, 0, 0.9098039, 1, 1,
0.1246633, -0.6638107, 3.712028, 0, 0.9058824, 1, 1,
0.1263893, -1.530857, 3.883612, 0, 0.8980392, 1, 1,
0.1291336, -0.5779341, 3.621598, 0, 0.8901961, 1, 1,
0.1310327, -0.2930834, 3.095143, 0, 0.8862745, 1, 1,
0.1316145, -1.394393, 3.361567, 0, 0.8784314, 1, 1,
0.1357413, -0.9343217, 1.29647, 0, 0.8745098, 1, 1,
0.1359943, -0.5397077, 2.312749, 0, 0.8666667, 1, 1,
0.1388448, -1.983004, 2.595998, 0, 0.8627451, 1, 1,
0.1407892, 0.6527069, -0.5580429, 0, 0.854902, 1, 1,
0.1424287, 1.187594, 0.4324624, 0, 0.8509804, 1, 1,
0.145802, 0.144342, 0.6437824, 0, 0.8431373, 1, 1,
0.1462726, -0.5140142, 1.896434, 0, 0.8392157, 1, 1,
0.1545253, -0.3993893, 2.698086, 0, 0.8313726, 1, 1,
0.1559001, 1.425949, -1.937725, 0, 0.827451, 1, 1,
0.1597202, 1.562275, 1.333515, 0, 0.8196079, 1, 1,
0.1597675, 0.01265667, 1.037706, 0, 0.8156863, 1, 1,
0.161112, -1.204498, 2.227821, 0, 0.8078431, 1, 1,
0.1625901, -0.305858, 2.717274, 0, 0.8039216, 1, 1,
0.1650742, -0.678243, 2.165871, 0, 0.7960784, 1, 1,
0.1652723, -0.8917327, 3.932333, 0, 0.7882353, 1, 1,
0.1729922, -0.8440584, 3.929277, 0, 0.7843137, 1, 1,
0.1777756, -1.642207, 2.563562, 0, 0.7764706, 1, 1,
0.1795161, -0.8779008, 3.260248, 0, 0.772549, 1, 1,
0.1809948, -1.100694, 3.412549, 0, 0.7647059, 1, 1,
0.1836294, -1.013791, 2.117354, 0, 0.7607843, 1, 1,
0.187251, 1.520578, -0.2014933, 0, 0.7529412, 1, 1,
0.1877453, 0.2397509, 1.185745, 0, 0.7490196, 1, 1,
0.1881423, 0.9000555, -0.3075714, 0, 0.7411765, 1, 1,
0.1890123, 1.382656, -0.6904814, 0, 0.7372549, 1, 1,
0.1915376, 1.790872, -1.299633, 0, 0.7294118, 1, 1,
0.1942528, 0.5038812, 0.8762911, 0, 0.7254902, 1, 1,
0.1952928, -0.4522834, 1.858425, 0, 0.7176471, 1, 1,
0.1978669, -0.4879147, 2.720387, 0, 0.7137255, 1, 1,
0.2003098, 1.340683, 1.432581, 0, 0.7058824, 1, 1,
0.2033058, 0.2726062, 1.467971, 0, 0.6980392, 1, 1,
0.2073691, -0.3093854, 2.319283, 0, 0.6941177, 1, 1,
0.2120451, -0.09396351, 4.206029, 0, 0.6862745, 1, 1,
0.2159377, 0.2590077, 0.9736327, 0, 0.682353, 1, 1,
0.2164367, 1.587318, 0.4237787, 0, 0.6745098, 1, 1,
0.2165865, 1.529761, 0.5921929, 0, 0.6705883, 1, 1,
0.2178214, -1.031952, 3.140925, 0, 0.6627451, 1, 1,
0.2181412, 0.5404501, 0.4021556, 0, 0.6588235, 1, 1,
0.2254253, 0.3721638, -0.2125225, 0, 0.6509804, 1, 1,
0.2281438, 1.387865, -0.3989952, 0, 0.6470588, 1, 1,
0.2282297, 0.6506366, -0.4248757, 0, 0.6392157, 1, 1,
0.2317335, 1.355697, 1.621946, 0, 0.6352941, 1, 1,
0.2329505, 0.2130989, 0.7912208, 0, 0.627451, 1, 1,
0.2349858, -0.5687817, 2.903581, 0, 0.6235294, 1, 1,
0.23735, 0.2848845, 0.322352, 0, 0.6156863, 1, 1,
0.2379323, -0.3326892, 4.187726, 0, 0.6117647, 1, 1,
0.2398962, 1.278386, 1.607522, 0, 0.6039216, 1, 1,
0.241555, -0.5081398, 2.120872, 0, 0.5960785, 1, 1,
0.2444795, 0.3918397, 0.3282652, 0, 0.5921569, 1, 1,
0.2452333, 0.3234047, 1.572077, 0, 0.5843138, 1, 1,
0.246689, -1.67924, 3.373279, 0, 0.5803922, 1, 1,
0.2467415, 1.593109, -1.734671, 0, 0.572549, 1, 1,
0.2506829, 0.6209942, 1.127459, 0, 0.5686275, 1, 1,
0.2568255, 0.9936392, 2.917893, 0, 0.5607843, 1, 1,
0.2605383, 1.657372, 1.233896, 0, 0.5568628, 1, 1,
0.2616477, -1.720926, 3.68581, 0, 0.5490196, 1, 1,
0.2635447, 1.45587, 0.1408659, 0, 0.5450981, 1, 1,
0.2651286, -0.3893832, 2.779161, 0, 0.5372549, 1, 1,
0.2723443, 1.193328, 1.075035, 0, 0.5333334, 1, 1,
0.2751031, 0.8227245, 0.4011265, 0, 0.5254902, 1, 1,
0.2756186, 0.3257642, 1.032424, 0, 0.5215687, 1, 1,
0.2776258, 0.4630011, 0.504027, 0, 0.5137255, 1, 1,
0.2784264, -0.2304283, 1.371618, 0, 0.509804, 1, 1,
0.2791376, 0.6458467, -0.06206721, 0, 0.5019608, 1, 1,
0.2800908, -0.731895, 4.032035, 0, 0.4941176, 1, 1,
0.280537, -0.2893043, 3.4336, 0, 0.4901961, 1, 1,
0.2858988, 0.4071181, 0.8990709, 0, 0.4823529, 1, 1,
0.2896713, -1.034705, 3.028139, 0, 0.4784314, 1, 1,
0.2906282, 0.6956459, 1.811487, 0, 0.4705882, 1, 1,
0.2916718, -0.2427569, 2.288639, 0, 0.4666667, 1, 1,
0.2925373, 0.9779382, 1.941361, 0, 0.4588235, 1, 1,
0.2977362, -0.7392651, 2.955428, 0, 0.454902, 1, 1,
0.3009531, 0.1563463, 0.985127, 0, 0.4470588, 1, 1,
0.3098093, 1.41024, 1.050452, 0, 0.4431373, 1, 1,
0.3099816, -1.508535, 3.34731, 0, 0.4352941, 1, 1,
0.3145595, 0.2098828, 1.699327, 0, 0.4313726, 1, 1,
0.3168703, -2.61324, 2.54889, 0, 0.4235294, 1, 1,
0.3184184, -0.199149, 1.7555, 0, 0.4196078, 1, 1,
0.3193758, -0.05645442, 2.317129, 0, 0.4117647, 1, 1,
0.3235688, -0.3861247, 0.4488964, 0, 0.4078431, 1, 1,
0.324018, 0.2567699, 2.212149, 0, 0.4, 1, 1,
0.326983, 0.3234011, -0.3655179, 0, 0.3921569, 1, 1,
0.3319386, 0.636382, -0.3764282, 0, 0.3882353, 1, 1,
0.3335935, -0.6381222, 2.906963, 0, 0.3803922, 1, 1,
0.3336784, -0.9481328, 2.618966, 0, 0.3764706, 1, 1,
0.3340699, -1.492359, 3.003131, 0, 0.3686275, 1, 1,
0.3343284, -0.8207375, 0.2975878, 0, 0.3647059, 1, 1,
0.3345305, -0.3283784, 0.4379511, 0, 0.3568628, 1, 1,
0.3404866, 1.101801, -0.4243711, 0, 0.3529412, 1, 1,
0.342215, 0.3203978, 1.536397, 0, 0.345098, 1, 1,
0.3435037, 0.6952714, 1.802404, 0, 0.3411765, 1, 1,
0.3436325, 1.230111, 0.3106371, 0, 0.3333333, 1, 1,
0.3490855, -0.42717, 2.626015, 0, 0.3294118, 1, 1,
0.3490967, 0.1489225, 1.353973, 0, 0.3215686, 1, 1,
0.349204, -0.8603101, 2.150449, 0, 0.3176471, 1, 1,
0.3497852, -0.1501197, 3.267289, 0, 0.3098039, 1, 1,
0.3498706, -0.4018505, 3.422669, 0, 0.3058824, 1, 1,
0.3527794, -0.7258252, 1.853859, 0, 0.2980392, 1, 1,
0.355955, -0.5280365, 1.227783, 0, 0.2901961, 1, 1,
0.3565916, -0.8227099, 2.467273, 0, 0.2862745, 1, 1,
0.3569661, -0.6570773, 0.8334825, 0, 0.2784314, 1, 1,
0.3588854, -0.1555257, 0.3618038, 0, 0.2745098, 1, 1,
0.3626549, 0.08164002, 0.7101896, 0, 0.2666667, 1, 1,
0.3670781, -0.317518, 1.777871, 0, 0.2627451, 1, 1,
0.3694173, 0.1268292, 0.1188795, 0, 0.254902, 1, 1,
0.3694788, -0.3654985, 1.61806, 0, 0.2509804, 1, 1,
0.3722582, 0.9727508, 0.5705247, 0, 0.2431373, 1, 1,
0.3729183, 1.172035, 0.6433659, 0, 0.2392157, 1, 1,
0.3775826, -0.1208776, 0.7638426, 0, 0.2313726, 1, 1,
0.3784796, 0.3419118, 0.6052527, 0, 0.227451, 1, 1,
0.3789108, 0.5425748, 0.6458828, 0, 0.2196078, 1, 1,
0.3803682, 1.02214, -0.007050852, 0, 0.2156863, 1, 1,
0.3893875, -0.3118856, 0.5971112, 0, 0.2078431, 1, 1,
0.3929301, 0.1641187, 2.942618, 0, 0.2039216, 1, 1,
0.3981304, -0.3717088, 1.075388, 0, 0.1960784, 1, 1,
0.3998782, 0.4456775, 1.524808, 0, 0.1882353, 1, 1,
0.4051193, -0.201818, 2.655094, 0, 0.1843137, 1, 1,
0.4062938, 0.5751132, 0.6822488, 0, 0.1764706, 1, 1,
0.4091406, 0.5196849, 0.06193374, 0, 0.172549, 1, 1,
0.4100939, 1.56452, -0.7166298, 0, 0.1647059, 1, 1,
0.4133899, 1.314426, 0.2432714, 0, 0.1607843, 1, 1,
0.4143638, -2.273861, 2.430318, 0, 0.1529412, 1, 1,
0.415228, -0.1417114, 2.711926, 0, 0.1490196, 1, 1,
0.4220386, 1.330209, 0.7340865, 0, 0.1411765, 1, 1,
0.4239297, -1.047944, 2.378722, 0, 0.1372549, 1, 1,
0.4240502, 1.118018, -0.1972578, 0, 0.1294118, 1, 1,
0.4252026, -1.343133, 1.664042, 0, 0.1254902, 1, 1,
0.4283588, 0.5595677, -0.1324169, 0, 0.1176471, 1, 1,
0.4304003, -0.2302366, 2.474983, 0, 0.1137255, 1, 1,
0.4312644, -0.1001259, 1.489366, 0, 0.1058824, 1, 1,
0.4347341, 1.150823, 0.5702418, 0, 0.09803922, 1, 1,
0.4436319, 1.112544, 0.6792325, 0, 0.09411765, 1, 1,
0.4454981, 0.9564054, -0.4216331, 0, 0.08627451, 1, 1,
0.4466312, -0.9049208, 4.141917, 0, 0.08235294, 1, 1,
0.4511599, 0.5651407, 1.134815, 0, 0.07450981, 1, 1,
0.4532874, -1.075619, 2.268336, 0, 0.07058824, 1, 1,
0.457217, -0.06113682, 1.004809, 0, 0.0627451, 1, 1,
0.4595151, 0.6043105, 1.975625, 0, 0.05882353, 1, 1,
0.4599994, -2.027613, 5.044718, 0, 0.05098039, 1, 1,
0.4711342, -0.01174809, 0.8776661, 0, 0.04705882, 1, 1,
0.4723155, 2.035002, 0.4064903, 0, 0.03921569, 1, 1,
0.4814582, 0.5919796, 1.091944, 0, 0.03529412, 1, 1,
0.4820985, -0.4571716, 2.876399, 0, 0.02745098, 1, 1,
0.4828907, 0.584101, 0.482755, 0, 0.02352941, 1, 1,
0.4857273, -1.867803, 3.384445, 0, 0.01568628, 1, 1,
0.4950898, -0.6916613, 1.319954, 0, 0.01176471, 1, 1,
0.4979022, -1.034929, 2.626226, 0, 0.003921569, 1, 1,
0.5007741, -0.9684362, 5.092938, 0.003921569, 0, 1, 1,
0.5012597, 0.3415288, -0.5354285, 0.007843138, 0, 1, 1,
0.5034114, -0.08502305, 0.3424334, 0.01568628, 0, 1, 1,
0.5061938, 0.9640687, 1.409942, 0.01960784, 0, 1, 1,
0.5088308, -0.2768327, 1.734654, 0.02745098, 0, 1, 1,
0.509718, 0.1531914, 0.08048986, 0.03137255, 0, 1, 1,
0.5109958, -0.7688303, 2.295498, 0.03921569, 0, 1, 1,
0.5135268, -1.672743, 1.7682, 0.04313726, 0, 1, 1,
0.5150551, 1.911906, 1.265936, 0.05098039, 0, 1, 1,
0.516221, -0.7073166, 1.30522, 0.05490196, 0, 1, 1,
0.5275296, 0.3189894, 1.837443, 0.0627451, 0, 1, 1,
0.5275626, 1.072863, 0.05984311, 0.06666667, 0, 1, 1,
0.5283539, 0.1317582, 2.510597, 0.07450981, 0, 1, 1,
0.5292658, -0.8434103, 2.562238, 0.07843138, 0, 1, 1,
0.532962, -1.938738, 2.888045, 0.08627451, 0, 1, 1,
0.5336884, 0.3954056, 1.132026, 0.09019608, 0, 1, 1,
0.5343417, 0.4666072, 1.141902, 0.09803922, 0, 1, 1,
0.537132, 0.1057813, -1.456094, 0.1058824, 0, 1, 1,
0.5373905, 0.6508657, 1.847466, 0.1098039, 0, 1, 1,
0.5425174, -0.05065902, 2.46577, 0.1176471, 0, 1, 1,
0.5459532, 0.1453652, 1.479887, 0.1215686, 0, 1, 1,
0.5459778, 0.4523008, 0.041276, 0.1294118, 0, 1, 1,
0.5523239, -0.6595134, 2.355626, 0.1333333, 0, 1, 1,
0.5526215, 1.27467, -0.09519384, 0.1411765, 0, 1, 1,
0.5526658, 0.969341, 0.4976187, 0.145098, 0, 1, 1,
0.559507, 1.008225, 0.4947435, 0.1529412, 0, 1, 1,
0.564005, -0.6799386, 1.531717, 0.1568628, 0, 1, 1,
0.567222, 0.5787318, 2.064548, 0.1647059, 0, 1, 1,
0.5789741, -0.4365524, 2.098904, 0.1686275, 0, 1, 1,
0.5915674, 1.35862, -0.5141424, 0.1764706, 0, 1, 1,
0.5921623, 0.5407422, 2.418312, 0.1803922, 0, 1, 1,
0.5939746, -0.399543, 1.772879, 0.1882353, 0, 1, 1,
0.5972065, -0.03774627, 1.91673, 0.1921569, 0, 1, 1,
0.6007249, 0.4284157, 0.4506941, 0.2, 0, 1, 1,
0.6056464, -0.4905785, 0.3309731, 0.2078431, 0, 1, 1,
0.607305, -1.774094, 1.703443, 0.2117647, 0, 1, 1,
0.612673, -0.7100051, 0.968304, 0.2196078, 0, 1, 1,
0.6128883, 0.160523, 1.48762, 0.2235294, 0, 1, 1,
0.6255181, 0.08574541, 1.857426, 0.2313726, 0, 1, 1,
0.6273311, -0.7423599, 3.536158, 0.2352941, 0, 1, 1,
0.6322244, 1.177262, 1.581015, 0.2431373, 0, 1, 1,
0.6375045, -0.5667847, 2.132706, 0.2470588, 0, 1, 1,
0.6410623, 2.034183, -0.7212234, 0.254902, 0, 1, 1,
0.6435317, 0.9966693, 0.730769, 0.2588235, 0, 1, 1,
0.6451143, 0.2555507, 0.610482, 0.2666667, 0, 1, 1,
0.6475454, 0.7830783, 1.107536, 0.2705882, 0, 1, 1,
0.6478961, 1.391304, -0.1328685, 0.2784314, 0, 1, 1,
0.6484908, -0.9326642, 3.953521, 0.282353, 0, 1, 1,
0.6543012, -1.613052, 3.05779, 0.2901961, 0, 1, 1,
0.6586593, -0.5485989, 3.120523, 0.2941177, 0, 1, 1,
0.6621427, 0.3494844, 1.341217, 0.3019608, 0, 1, 1,
0.6628866, -1.325859, 3.325445, 0.3098039, 0, 1, 1,
0.6641215, -1.692779, 2.27688, 0.3137255, 0, 1, 1,
0.6658224, 0.6957344, 0.4802326, 0.3215686, 0, 1, 1,
0.6659767, -0.5212263, 3.346699, 0.3254902, 0, 1, 1,
0.67101, 1.291566, 0.02179495, 0.3333333, 0, 1, 1,
0.6731097, -0.3538684, 1.874285, 0.3372549, 0, 1, 1,
0.6765018, 1.092577, 1.444521, 0.345098, 0, 1, 1,
0.6777793, -2.306606, 2.027122, 0.3490196, 0, 1, 1,
0.6778629, -1.461015, 2.926484, 0.3568628, 0, 1, 1,
0.6789573, -0.083511, 2.496494, 0.3607843, 0, 1, 1,
0.6825914, -0.9479582, 1.651959, 0.3686275, 0, 1, 1,
0.6890898, 0.3346027, 0.8846406, 0.372549, 0, 1, 1,
0.6899883, -0.8396368, 0.432267, 0.3803922, 0, 1, 1,
0.6900249, -0.6678854, 2.226314, 0.3843137, 0, 1, 1,
0.6904246, 0.04841526, 1.853446, 0.3921569, 0, 1, 1,
0.6946262, -1.718142, 3.016334, 0.3960784, 0, 1, 1,
0.6987313, -1.102691, 2.836947, 0.4039216, 0, 1, 1,
0.7052994, -0.8029473, 2.509517, 0.4117647, 0, 1, 1,
0.707588, -0.0331501, 1.83, 0.4156863, 0, 1, 1,
0.707889, -0.8307781, 1.752487, 0.4235294, 0, 1, 1,
0.709857, -0.07203712, 1.686128, 0.427451, 0, 1, 1,
0.7131709, -0.4947573, 1.357894, 0.4352941, 0, 1, 1,
0.7138072, 1.027145, 1.375193, 0.4392157, 0, 1, 1,
0.716005, -0.2908453, 1.991051, 0.4470588, 0, 1, 1,
0.7185757, -0.03806098, -0.1652879, 0.4509804, 0, 1, 1,
0.7272294, -1.545692, 1.833471, 0.4588235, 0, 1, 1,
0.7286577, 0.1294766, 2.123144, 0.4627451, 0, 1, 1,
0.7320115, 0.1957401, 0.3702602, 0.4705882, 0, 1, 1,
0.732182, -1.445766, 2.407763, 0.4745098, 0, 1, 1,
0.7322204, -1.879142, 3.118335, 0.4823529, 0, 1, 1,
0.7369109, -0.5028855, 3.808851, 0.4862745, 0, 1, 1,
0.7481486, 0.9168652, 0.5431695, 0.4941176, 0, 1, 1,
0.7522173, -0.8165517, 2.389814, 0.5019608, 0, 1, 1,
0.7590066, -0.0944766, 1.168032, 0.5058824, 0, 1, 1,
0.7605259, -0.2590971, 2.664179, 0.5137255, 0, 1, 1,
0.7623258, 0.157527, 1.94066, 0.5176471, 0, 1, 1,
0.7646455, -0.05480884, 1.33076, 0.5254902, 0, 1, 1,
0.7655419, -1.217881, 3.300868, 0.5294118, 0, 1, 1,
0.7662439, 0.992088, 1.028308, 0.5372549, 0, 1, 1,
0.7672697, 1.180626, 0.3221035, 0.5411765, 0, 1, 1,
0.7739542, -0.462692, 1.693489, 0.5490196, 0, 1, 1,
0.7838416, -0.08087385, 2.082401, 0.5529412, 0, 1, 1,
0.7883657, 0.5753229, 3.042463, 0.5607843, 0, 1, 1,
0.7927134, -0.1086838, 0.9812298, 0.5647059, 0, 1, 1,
0.7954164, -0.09088773, 2.059342, 0.572549, 0, 1, 1,
0.803764, -1.11919, 1.95214, 0.5764706, 0, 1, 1,
0.8039153, -0.8581508, 1.945302, 0.5843138, 0, 1, 1,
0.8108591, 0.9925861, -0.3054921, 0.5882353, 0, 1, 1,
0.8174508, 0.4919354, 3.082853, 0.5960785, 0, 1, 1,
0.8186522, 0.14955, 2.731238, 0.6039216, 0, 1, 1,
0.820427, -0.61669, -0.04273983, 0.6078432, 0, 1, 1,
0.8263104, 0.4476286, 1.289765, 0.6156863, 0, 1, 1,
0.8307334, 1.098908, -0.4072211, 0.6196079, 0, 1, 1,
0.831596, 0.7543508, -1.214993, 0.627451, 0, 1, 1,
0.8350792, -1.838184, 3.163904, 0.6313726, 0, 1, 1,
0.8464227, 0.7983338, 1.620892, 0.6392157, 0, 1, 1,
0.8467824, -1.672366, 2.143039, 0.6431373, 0, 1, 1,
0.8472114, 1.830132, 0.8600804, 0.6509804, 0, 1, 1,
0.8476865, -0.4270048, 3.65239, 0.654902, 0, 1, 1,
0.8506784, 0.9410923, 1.451679, 0.6627451, 0, 1, 1,
0.8528686, -0.1709875, 2.774317, 0.6666667, 0, 1, 1,
0.859986, 0.725825, 1.474612, 0.6745098, 0, 1, 1,
0.8680334, -0.3155876, 1.7018, 0.6784314, 0, 1, 1,
0.8680679, 0.0433845, 1.877469, 0.6862745, 0, 1, 1,
0.8697973, -0.3076323, 3.190454, 0.6901961, 0, 1, 1,
0.8795304, 0.7357125, -1.121655, 0.6980392, 0, 1, 1,
0.8939604, 0.112589, 1.347899, 0.7058824, 0, 1, 1,
0.8951797, -0.141827, 1.217691, 0.7098039, 0, 1, 1,
0.8966861, 0.8698903, 1.269375, 0.7176471, 0, 1, 1,
0.8973516, 0.385381, 0.2215996, 0.7215686, 0, 1, 1,
0.8973734, 1.596401, 0.002102176, 0.7294118, 0, 1, 1,
0.8979824, -0.4233023, 0.02375064, 0.7333333, 0, 1, 1,
0.8984102, -1.002354, 1.860353, 0.7411765, 0, 1, 1,
0.8990967, 1.208336, 0.2243951, 0.7450981, 0, 1, 1,
0.9010266, 0.4294159, 0.7457495, 0.7529412, 0, 1, 1,
0.901588, 0.7662148, 1.077781, 0.7568628, 0, 1, 1,
0.9040374, -0.3605137, 2.68925, 0.7647059, 0, 1, 1,
0.9042976, 0.8417142, 0.6383057, 0.7686275, 0, 1, 1,
0.905338, 0.8460473, 0.577933, 0.7764706, 0, 1, 1,
0.9082337, 1.341518, 0.2162202, 0.7803922, 0, 1, 1,
0.9234743, 0.9410597, 1.457091, 0.7882353, 0, 1, 1,
0.9299536, -0.8707794, 0.7934299, 0.7921569, 0, 1, 1,
0.9313564, 0.9719529, -0.7255484, 0.8, 0, 1, 1,
0.9328263, 0.7401008, 1.90363, 0.8078431, 0, 1, 1,
0.9384384, -0.3126627, 2.794339, 0.8117647, 0, 1, 1,
0.9405277, -0.6490141, 2.977916, 0.8196079, 0, 1, 1,
0.9411525, 0.06676286, 2.210038, 0.8235294, 0, 1, 1,
0.942153, 0.1712027, 2.269823, 0.8313726, 0, 1, 1,
0.9472997, -0.1007343, 1.886351, 0.8352941, 0, 1, 1,
0.948526, 0.426513, 1.944404, 0.8431373, 0, 1, 1,
0.9516837, 0.1385879, 1.77574, 0.8470588, 0, 1, 1,
0.9553468, -0.2933889, 1.395296, 0.854902, 0, 1, 1,
0.959161, -0.8131778, 3.416761, 0.8588235, 0, 1, 1,
0.9621689, -0.02437329, 1.633878, 0.8666667, 0, 1, 1,
0.9626979, -1.523605, 3.533981, 0.8705882, 0, 1, 1,
0.9634109, -1.110063, 0.1281767, 0.8784314, 0, 1, 1,
0.9657938, -1.557688, 3.724048, 0.8823529, 0, 1, 1,
0.9669696, 1.947128, -0.8294243, 0.8901961, 0, 1, 1,
0.9711628, 1.622603, -1.167875, 0.8941177, 0, 1, 1,
0.973461, -0.1824232, 1.862155, 0.9019608, 0, 1, 1,
0.9793097, -0.06713918, 2.355799, 0.9098039, 0, 1, 1,
0.9815891, 0.1962741, 0.955403, 0.9137255, 0, 1, 1,
0.9885635, -0.3865272, 2.89125, 0.9215686, 0, 1, 1,
0.9897726, 1.433622, 0.4101872, 0.9254902, 0, 1, 1,
0.9926459, -1.352735, 2.030685, 0.9333333, 0, 1, 1,
0.9931651, -1.331318, 2.420469, 0.9372549, 0, 1, 1,
0.9981818, 0.5467646, 0.2842686, 0.945098, 0, 1, 1,
0.9986633, -1.136189, 3.276187, 0.9490196, 0, 1, 1,
0.999849, -1.765482, 4.268359, 0.9568627, 0, 1, 1,
1.00685, 0.3271683, 1.432212, 0.9607843, 0, 1, 1,
1.007141, 0.5126842, 1.674637, 0.9686275, 0, 1, 1,
1.010156, -0.2480433, 1.665065, 0.972549, 0, 1, 1,
1.011661, 3.075648, 0.4306197, 0.9803922, 0, 1, 1,
1.016168, 0.6332741, 1.70665, 0.9843137, 0, 1, 1,
1.016456, 0.1030253, 1.129261, 0.9921569, 0, 1, 1,
1.018139, 1.740013, 1.636258, 0.9960784, 0, 1, 1,
1.020618, 0.9614387, -0.1751264, 1, 0, 0.9960784, 1,
1.02202, 1.164904, 0.5625621, 1, 0, 0.9882353, 1,
1.027001, -1.158337, 2.490685, 1, 0, 0.9843137, 1,
1.030696, -0.3098395, 2.483607, 1, 0, 0.9764706, 1,
1.032168, -0.6020123, 1.744073, 1, 0, 0.972549, 1,
1.056906, 0.3789701, 2.492944, 1, 0, 0.9647059, 1,
1.05762, 0.5997338, 1.079661, 1, 0, 0.9607843, 1,
1.058181, -0.08030373, 2.677691, 1, 0, 0.9529412, 1,
1.061734, -1.546318, 1.327289, 1, 0, 0.9490196, 1,
1.061782, 0.853624, 0.7364674, 1, 0, 0.9411765, 1,
1.061939, 0.4922232, 0.6750657, 1, 0, 0.9372549, 1,
1.067867, -1.791407, 3.046392, 1, 0, 0.9294118, 1,
1.107344, -0.6492224, 2.7244, 1, 0, 0.9254902, 1,
1.10783, 0.9844514, 1.350565, 1, 0, 0.9176471, 1,
1.109733, -0.2629333, 2.874094, 1, 0, 0.9137255, 1,
1.117009, 0.08902032, 2.126159, 1, 0, 0.9058824, 1,
1.119508, -1.717223, 2.864929, 1, 0, 0.9019608, 1,
1.125779, -0.3822212, 2.785604, 1, 0, 0.8941177, 1,
1.133018, -1.097165, 1.069389, 1, 0, 0.8862745, 1,
1.135121, -0.7850815, 2.087331, 1, 0, 0.8823529, 1,
1.13916, -0.4488553, 2.295232, 1, 0, 0.8745098, 1,
1.149857, -0.8305882, 2.813717, 1, 0, 0.8705882, 1,
1.152996, 0.3591971, 0.6405665, 1, 0, 0.8627451, 1,
1.154706, 0.3901692, -0.4555724, 1, 0, 0.8588235, 1,
1.155357, -0.1364065, 2.492328, 1, 0, 0.8509804, 1,
1.156642, 0.9404321, -0.7092583, 1, 0, 0.8470588, 1,
1.160915, 0.5894189, 1.933506, 1, 0, 0.8392157, 1,
1.174114, -0.7842224, 0.6767756, 1, 0, 0.8352941, 1,
1.174646, -1.631251, 3.955041, 1, 0, 0.827451, 1,
1.182383, -0.7939812, 3.046398, 1, 0, 0.8235294, 1,
1.183551, 0.6271638, 1.946274, 1, 0, 0.8156863, 1,
1.186693, 0.5076904, 1.291599, 1, 0, 0.8117647, 1,
1.196549, -1.675104, 1.717983, 1, 0, 0.8039216, 1,
1.196731, -0.07622227, 1.510774, 1, 0, 0.7960784, 1,
1.199157, 1.262936, 1.569934, 1, 0, 0.7921569, 1,
1.20057, -1.194133, 1.879941, 1, 0, 0.7843137, 1,
1.20329, 1.162409, -1.830266, 1, 0, 0.7803922, 1,
1.216132, 0.5886983, 1.337133, 1, 0, 0.772549, 1,
1.216542, -0.9211092, 1.306901, 1, 0, 0.7686275, 1,
1.221714, -1.699132, 2.014985, 1, 0, 0.7607843, 1,
1.224954, 0.7257574, 0.7864181, 1, 0, 0.7568628, 1,
1.226871, 0.4049, 1.780019, 1, 0, 0.7490196, 1,
1.227037, -0.2717481, 0.7971451, 1, 0, 0.7450981, 1,
1.227748, 0.2913149, 3.091789, 1, 0, 0.7372549, 1,
1.229385, 0.1651588, 1.326322, 1, 0, 0.7333333, 1,
1.233978, -0.4630171, 1.328058, 1, 0, 0.7254902, 1,
1.234653, -0.9304644, 2.470287, 1, 0, 0.7215686, 1,
1.240235, 1.040016, 1.511916, 1, 0, 0.7137255, 1,
1.253257, 0.09899449, 3.333829, 1, 0, 0.7098039, 1,
1.260954, 1.512592, 2.344204, 1, 0, 0.7019608, 1,
1.265309, -0.4648203, 3.734398, 1, 0, 0.6941177, 1,
1.278571, -0.4694246, 1.078485, 1, 0, 0.6901961, 1,
1.296035, 0.9784623, 1.538019, 1, 0, 0.682353, 1,
1.303679, 1.886006, 1.368877, 1, 0, 0.6784314, 1,
1.307299, 1.590389, 2.555616, 1, 0, 0.6705883, 1,
1.309351, -0.4000499, 0.7664986, 1, 0, 0.6666667, 1,
1.310137, -0.675442, 1.06262, 1, 0, 0.6588235, 1,
1.310158, -1.471478, 1.937926, 1, 0, 0.654902, 1,
1.314288, -0.2876014, 0.5460652, 1, 0, 0.6470588, 1,
1.333606, 0.06965031, 1.921613, 1, 0, 0.6431373, 1,
1.342828, 0.123098, 1.305825, 1, 0, 0.6352941, 1,
1.35492, 1.890434, 1.493547, 1, 0, 0.6313726, 1,
1.358849, -1.17874, 2.321311, 1, 0, 0.6235294, 1,
1.376737, 1.814742, 1.367836, 1, 0, 0.6196079, 1,
1.38282, 0.3686313, 1.612909, 1, 0, 0.6117647, 1,
1.384532, -0.8621628, 1.811301, 1, 0, 0.6078432, 1,
1.385332, -0.04781459, 2.536971, 1, 0, 0.6, 1,
1.389905, -0.4632204, 2.474856, 1, 0, 0.5921569, 1,
1.394283, -0.6950397, 1.773613, 1, 0, 0.5882353, 1,
1.406607, -0.07155307, 3.42229, 1, 0, 0.5803922, 1,
1.411459, 0.005946384, -1.008141, 1, 0, 0.5764706, 1,
1.416886, -0.4223053, 2.601422, 1, 0, 0.5686275, 1,
1.417197, 1.169823, 1.080907, 1, 0, 0.5647059, 1,
1.427627, 1.276641, -1.751001, 1, 0, 0.5568628, 1,
1.442098, 1.282896, 0.6194788, 1, 0, 0.5529412, 1,
1.468511, -0.1721536, 2.139557, 1, 0, 0.5450981, 1,
1.484968, 1.169998, 0.8157808, 1, 0, 0.5411765, 1,
1.492644, -1.719272, 1.909387, 1, 0, 0.5333334, 1,
1.495312, -0.3981663, -2.441847, 1, 0, 0.5294118, 1,
1.496322, 0.2640088, 1.578372, 1, 0, 0.5215687, 1,
1.496557, 0.6645337, -0.7845269, 1, 0, 0.5176471, 1,
1.497968, -0.8470337, 4.715262, 1, 0, 0.509804, 1,
1.499409, -0.9306391, 3.671461, 1, 0, 0.5058824, 1,
1.520576, -0.8065816, 1.50826, 1, 0, 0.4980392, 1,
1.533907, -0.8333586, 1.535158, 1, 0, 0.4901961, 1,
1.538943, -0.8520446, 1.363016, 1, 0, 0.4862745, 1,
1.540247, 0.07102337, 1.627703, 1, 0, 0.4784314, 1,
1.543001, -0.497244, 0.5095053, 1, 0, 0.4745098, 1,
1.546245, 0.8931, -0.1948467, 1, 0, 0.4666667, 1,
1.547132, -0.09481122, 2.893053, 1, 0, 0.4627451, 1,
1.565524, 1.929879, 0.4913044, 1, 0, 0.454902, 1,
1.567943, 0.7430115, -0.3933637, 1, 0, 0.4509804, 1,
1.57027, 0.5065149, 0.7887365, 1, 0, 0.4431373, 1,
1.586475, -0.3572677, 3.350456, 1, 0, 0.4392157, 1,
1.588853, -0.01618381, 1.757287, 1, 0, 0.4313726, 1,
1.602024, 0.6976265, -0.270193, 1, 0, 0.427451, 1,
1.613621, 1.197139, 1.339168, 1, 0, 0.4196078, 1,
1.614766, 0.03051003, 1.679758, 1, 0, 0.4156863, 1,
1.615685, -0.2353394, 0.1230121, 1, 0, 0.4078431, 1,
1.61806, -1.467856, 1.787764, 1, 0, 0.4039216, 1,
1.62174, -0.76987, 1.292133, 1, 0, 0.3960784, 1,
1.626856, 1.882127, 0.1286032, 1, 0, 0.3882353, 1,
1.62756, 0.7615652, 0.2790835, 1, 0, 0.3843137, 1,
1.628363, -1.882753, 2.059094, 1, 0, 0.3764706, 1,
1.638844, -0.5092051, 1.743487, 1, 0, 0.372549, 1,
1.642044, -0.678153, 2.274649, 1, 0, 0.3647059, 1,
1.643567, -2.346677, 3.616935, 1, 0, 0.3607843, 1,
1.656182, -0.06170664, 1.059656, 1, 0, 0.3529412, 1,
1.667532, -0.8928065, 3.701682, 1, 0, 0.3490196, 1,
1.679874, 0.5983902, 1.180433, 1, 0, 0.3411765, 1,
1.697881, -1.158585, 2.109253, 1, 0, 0.3372549, 1,
1.699825, 0.2041107, 1.159646, 1, 0, 0.3294118, 1,
1.702067, 0.5647657, -0.1081476, 1, 0, 0.3254902, 1,
1.717952, -0.9975255, 2.049693, 1, 0, 0.3176471, 1,
1.728909, 0.3709695, 0.5394587, 1, 0, 0.3137255, 1,
1.731311, -1.072289, 0.6433077, 1, 0, 0.3058824, 1,
1.731541, -2.06521, 2.399832, 1, 0, 0.2980392, 1,
1.733803, 0.9153886, 0.4865415, 1, 0, 0.2941177, 1,
1.734543, 0.7444224, 1.883044, 1, 0, 0.2862745, 1,
1.755966, 0.7129049, 1.285092, 1, 0, 0.282353, 1,
1.772749, 0.443994, 1.828639, 1, 0, 0.2745098, 1,
1.7739, -0.7698852, 4.913455, 1, 0, 0.2705882, 1,
1.775672, -1.472881, 1.656797, 1, 0, 0.2627451, 1,
1.776591, -1.499105, 4.149486, 1, 0, 0.2588235, 1,
1.792896, -1.24081, 1.540692, 1, 0, 0.2509804, 1,
1.801221, -0.3275674, 1.542094, 1, 0, 0.2470588, 1,
1.812361, -0.139676, 1.85574, 1, 0, 0.2392157, 1,
1.815351, 0.2820671, 1.714465, 1, 0, 0.2352941, 1,
1.822695, -1.379124, 2.621373, 1, 0, 0.227451, 1,
1.830335, -1.054014, 0.05109305, 1, 0, 0.2235294, 1,
1.833589, 1.137781, 3.160649, 1, 0, 0.2156863, 1,
1.855579, -0.01740833, 1.371825, 1, 0, 0.2117647, 1,
1.858891, 0.6006835, 2.948691, 1, 0, 0.2039216, 1,
1.87169, 0.360018, 0.4703335, 1, 0, 0.1960784, 1,
1.886178, -0.1078566, 3.651421, 1, 0, 0.1921569, 1,
1.887055, 0.752405, 0.8314504, 1, 0, 0.1843137, 1,
1.916417, 0.81148, -0.5223952, 1, 0, 0.1803922, 1,
1.920397, 0.3554235, 0.4297169, 1, 0, 0.172549, 1,
1.98492, 0.5147216, 2.069469, 1, 0, 0.1686275, 1,
1.996925, -0.532882, 2.358121, 1, 0, 0.1607843, 1,
2.004606, -2.458119, 2.107704, 1, 0, 0.1568628, 1,
2.017387, -0.01542117, 3.663714, 1, 0, 0.1490196, 1,
2.027622, -2.673965, 3.817485, 1, 0, 0.145098, 1,
2.074048, -0.08132874, 2.985764, 1, 0, 0.1372549, 1,
2.085086, 0.1737158, 2.471264, 1, 0, 0.1333333, 1,
2.128814, -0.1370681, 4.045076, 1, 0, 0.1254902, 1,
2.131694, 0.9029442, 0.1029977, 1, 0, 0.1215686, 1,
2.144498, 0.4400632, -0.5652936, 1, 0, 0.1137255, 1,
2.146009, -1.144012, 1.845846, 1, 0, 0.1098039, 1,
2.162886, 0.76805, 0.8824098, 1, 0, 0.1019608, 1,
2.218752, -1.709674, 5.205053, 1, 0, 0.09411765, 1,
2.226061, 0.7768276, 1.094501, 1, 0, 0.09019608, 1,
2.304224, 1.134944, 0.9112189, 1, 0, 0.08235294, 1,
2.352308, 0.4258468, 2.187421, 1, 0, 0.07843138, 1,
2.379487, -0.439704, 3.160288, 1, 0, 0.07058824, 1,
2.429326, -0.3450062, -0.1557658, 1, 0, 0.06666667, 1,
2.475036, 0.4646864, 1.99044, 1, 0, 0.05882353, 1,
2.495337, -1.118567, 1.077133, 1, 0, 0.05490196, 1,
2.53582, -0.4989837, 2.935705, 1, 0, 0.04705882, 1,
2.898011, -0.8748093, 1.371569, 1, 0, 0.04313726, 1,
2.932096, 0.2749935, 2.180486, 1, 0, 0.03529412, 1,
2.974142, -1.060382, 2.267063, 1, 0, 0.03137255, 1,
2.99951, 0.6256176, 2.200464, 1, 0, 0.02352941, 1,
3.125228, -1.187397, 1.588131, 1, 0, 0.01960784, 1,
3.341266, 1.064759, 0.2736923, 1, 0, 0.01176471, 1,
3.433664, 1.188995, 0.9825501, 1, 0, 0.007843138, 1
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
0.1176087, -4.396121, -6.747732, 0, -0.5, 0.5, 0.5,
0.1176087, -4.396121, -6.747732, 1, -0.5, 0.5, 0.5,
0.1176087, -4.396121, -6.747732, 1, 1.5, 0.5, 0.5,
0.1176087, -4.396121, -6.747732, 0, 1.5, 0.5, 0.5
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
-4.32259, -0.1187807, -6.747732, 0, -0.5, 0.5, 0.5,
-4.32259, -0.1187807, -6.747732, 1, -0.5, 0.5, 0.5,
-4.32259, -0.1187807, -6.747732, 1, 1.5, 0.5, 0.5,
-4.32259, -0.1187807, -6.747732, 0, 1.5, 0.5, 0.5
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
-4.32259, -4.396121, 0.4068489, 0, -0.5, 0.5, 0.5,
-4.32259, -4.396121, 0.4068489, 1, -0.5, 0.5, 0.5,
-4.32259, -4.396121, 0.4068489, 1, 1.5, 0.5, 0.5,
-4.32259, -4.396121, 0.4068489, 0, 1.5, 0.5, 0.5
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
-3, -3.409042, -5.096675,
3, -3.409042, -5.096675,
-3, -3.409042, -5.096675,
-3, -3.573555, -5.371851,
-2, -3.409042, -5.096675,
-2, -3.573555, -5.371851,
-1, -3.409042, -5.096675,
-1, -3.573555, -5.371851,
0, -3.409042, -5.096675,
0, -3.573555, -5.371851,
1, -3.409042, -5.096675,
1, -3.573555, -5.371851,
2, -3.409042, -5.096675,
2, -3.573555, -5.371851,
3, -3.409042, -5.096675,
3, -3.573555, -5.371851
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
-3, -3.902582, -5.922204, 0, -0.5, 0.5, 0.5,
-3, -3.902582, -5.922204, 1, -0.5, 0.5, 0.5,
-3, -3.902582, -5.922204, 1, 1.5, 0.5, 0.5,
-3, -3.902582, -5.922204, 0, 1.5, 0.5, 0.5,
-2, -3.902582, -5.922204, 0, -0.5, 0.5, 0.5,
-2, -3.902582, -5.922204, 1, -0.5, 0.5, 0.5,
-2, -3.902582, -5.922204, 1, 1.5, 0.5, 0.5,
-2, -3.902582, -5.922204, 0, 1.5, 0.5, 0.5,
-1, -3.902582, -5.922204, 0, -0.5, 0.5, 0.5,
-1, -3.902582, -5.922204, 1, -0.5, 0.5, 0.5,
-1, -3.902582, -5.922204, 1, 1.5, 0.5, 0.5,
-1, -3.902582, -5.922204, 0, 1.5, 0.5, 0.5,
0, -3.902582, -5.922204, 0, -0.5, 0.5, 0.5,
0, -3.902582, -5.922204, 1, -0.5, 0.5, 0.5,
0, -3.902582, -5.922204, 1, 1.5, 0.5, 0.5,
0, -3.902582, -5.922204, 0, 1.5, 0.5, 0.5,
1, -3.902582, -5.922204, 0, -0.5, 0.5, 0.5,
1, -3.902582, -5.922204, 1, -0.5, 0.5, 0.5,
1, -3.902582, -5.922204, 1, 1.5, 0.5, 0.5,
1, -3.902582, -5.922204, 0, 1.5, 0.5, 0.5,
2, -3.902582, -5.922204, 0, -0.5, 0.5, 0.5,
2, -3.902582, -5.922204, 1, -0.5, 0.5, 0.5,
2, -3.902582, -5.922204, 1, 1.5, 0.5, 0.5,
2, -3.902582, -5.922204, 0, 1.5, 0.5, 0.5,
3, -3.902582, -5.922204, 0, -0.5, 0.5, 0.5,
3, -3.902582, -5.922204, 1, -0.5, 0.5, 0.5,
3, -3.902582, -5.922204, 1, 1.5, 0.5, 0.5,
3, -3.902582, -5.922204, 0, 1.5, 0.5, 0.5
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
-3.297929, -3, -5.096675,
-3.297929, 3, -5.096675,
-3.297929, -3, -5.096675,
-3.468705, -3, -5.371851,
-3.297929, -2, -5.096675,
-3.468705, -2, -5.371851,
-3.297929, -1, -5.096675,
-3.468705, -1, -5.371851,
-3.297929, 0, -5.096675,
-3.468705, 0, -5.371851,
-3.297929, 1, -5.096675,
-3.468705, 1, -5.371851,
-3.297929, 2, -5.096675,
-3.468705, 2, -5.371851,
-3.297929, 3, -5.096675,
-3.468705, 3, -5.371851
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
-3.810259, -3, -5.922204, 0, -0.5, 0.5, 0.5,
-3.810259, -3, -5.922204, 1, -0.5, 0.5, 0.5,
-3.810259, -3, -5.922204, 1, 1.5, 0.5, 0.5,
-3.810259, -3, -5.922204, 0, 1.5, 0.5, 0.5,
-3.810259, -2, -5.922204, 0, -0.5, 0.5, 0.5,
-3.810259, -2, -5.922204, 1, -0.5, 0.5, 0.5,
-3.810259, -2, -5.922204, 1, 1.5, 0.5, 0.5,
-3.810259, -2, -5.922204, 0, 1.5, 0.5, 0.5,
-3.810259, -1, -5.922204, 0, -0.5, 0.5, 0.5,
-3.810259, -1, -5.922204, 1, -0.5, 0.5, 0.5,
-3.810259, -1, -5.922204, 1, 1.5, 0.5, 0.5,
-3.810259, -1, -5.922204, 0, 1.5, 0.5, 0.5,
-3.810259, 0, -5.922204, 0, -0.5, 0.5, 0.5,
-3.810259, 0, -5.922204, 1, -0.5, 0.5, 0.5,
-3.810259, 0, -5.922204, 1, 1.5, 0.5, 0.5,
-3.810259, 0, -5.922204, 0, 1.5, 0.5, 0.5,
-3.810259, 1, -5.922204, 0, -0.5, 0.5, 0.5,
-3.810259, 1, -5.922204, 1, -0.5, 0.5, 0.5,
-3.810259, 1, -5.922204, 1, 1.5, 0.5, 0.5,
-3.810259, 1, -5.922204, 0, 1.5, 0.5, 0.5,
-3.810259, 2, -5.922204, 0, -0.5, 0.5, 0.5,
-3.810259, 2, -5.922204, 1, -0.5, 0.5, 0.5,
-3.810259, 2, -5.922204, 1, 1.5, 0.5, 0.5,
-3.810259, 2, -5.922204, 0, 1.5, 0.5, 0.5,
-3.810259, 3, -5.922204, 0, -0.5, 0.5, 0.5,
-3.810259, 3, -5.922204, 1, -0.5, 0.5, 0.5,
-3.810259, 3, -5.922204, 1, 1.5, 0.5, 0.5,
-3.810259, 3, -5.922204, 0, 1.5, 0.5, 0.5
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
-3.297929, -3.409042, -4,
-3.297929, -3.409042, 4,
-3.297929, -3.409042, -4,
-3.468705, -3.573555, -4,
-3.297929, -3.409042, -2,
-3.468705, -3.573555, -2,
-3.297929, -3.409042, 0,
-3.468705, -3.573555, 0,
-3.297929, -3.409042, 2,
-3.468705, -3.573555, 2,
-3.297929, -3.409042, 4,
-3.468705, -3.573555, 4
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
-3.810259, -3.902582, -4, 0, -0.5, 0.5, 0.5,
-3.810259, -3.902582, -4, 1, -0.5, 0.5, 0.5,
-3.810259, -3.902582, -4, 1, 1.5, 0.5, 0.5,
-3.810259, -3.902582, -4, 0, 1.5, 0.5, 0.5,
-3.810259, -3.902582, -2, 0, -0.5, 0.5, 0.5,
-3.810259, -3.902582, -2, 1, -0.5, 0.5, 0.5,
-3.810259, -3.902582, -2, 1, 1.5, 0.5, 0.5,
-3.810259, -3.902582, -2, 0, 1.5, 0.5, 0.5,
-3.810259, -3.902582, 0, 0, -0.5, 0.5, 0.5,
-3.810259, -3.902582, 0, 1, -0.5, 0.5, 0.5,
-3.810259, -3.902582, 0, 1, 1.5, 0.5, 0.5,
-3.810259, -3.902582, 0, 0, 1.5, 0.5, 0.5,
-3.810259, -3.902582, 2, 0, -0.5, 0.5, 0.5,
-3.810259, -3.902582, 2, 1, -0.5, 0.5, 0.5,
-3.810259, -3.902582, 2, 1, 1.5, 0.5, 0.5,
-3.810259, -3.902582, 2, 0, 1.5, 0.5, 0.5,
-3.810259, -3.902582, 4, 0, -0.5, 0.5, 0.5,
-3.810259, -3.902582, 4, 1, -0.5, 0.5, 0.5,
-3.810259, -3.902582, 4, 1, 1.5, 0.5, 0.5,
-3.810259, -3.902582, 4, 0, 1.5, 0.5, 0.5
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
-3.297929, -3.409042, -5.096675,
-3.297929, 3.171481, -5.096675,
-3.297929, -3.409042, 5.910373,
-3.297929, 3.171481, 5.910373,
-3.297929, -3.409042, -5.096675,
-3.297929, -3.409042, 5.910373,
-3.297929, 3.171481, -5.096675,
-3.297929, 3.171481, 5.910373,
-3.297929, -3.409042, -5.096675,
3.533146, -3.409042, -5.096675,
-3.297929, -3.409042, 5.910373,
3.533146, -3.409042, 5.910373,
-3.297929, 3.171481, -5.096675,
3.533146, 3.171481, -5.096675,
-3.297929, 3.171481, 5.910373,
3.533146, 3.171481, 5.910373,
3.533146, -3.409042, -5.096675,
3.533146, 3.171481, -5.096675,
3.533146, -3.409042, 5.910373,
3.533146, 3.171481, 5.910373,
3.533146, -3.409042, -5.096675,
3.533146, -3.409042, 5.910373,
3.533146, 3.171481, -5.096675,
3.533146, 3.171481, 5.910373
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
var radius = 7.758758;
var distance = 34.51959;
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
mvMatrix.translate( -0.1176087, 0.1187807, -0.4068489 );
mvMatrix.scale( 1.228053, 1.274811, 0.7621409 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.51959);
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
InChI_1S_C5H12NO3PS2<-read.table("InChI_1S_C5H12NO3PS2.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C5H12NO3PS2$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C5H12NO3PS2' not found
```

```r
y<-InChI_1S_C5H12NO3PS2$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C5H12NO3PS2' not found
```

```r
z<-InChI_1S_C5H12NO3PS2$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C5H12NO3PS2' not found
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
-3.198447, -1.614778, -2.10176, 0, 0, 1, 1, 1,
-3.05251, -0.4613466, -0.2464942, 1, 0, 0, 1, 1,
-2.928307, -0.514767, -1.872097, 1, 0, 0, 1, 1,
-2.735312, 1.633316, -1.449915, 1, 0, 0, 1, 1,
-2.609139, 0.29942, -2.157829, 1, 0, 0, 1, 1,
-2.483925, 0.3759463, -1.513265, 1, 0, 0, 1, 1,
-2.434, 1.540497, -1.452507, 0, 0, 0, 1, 1,
-2.429419, -0.01519708, -3.382931, 0, 0, 0, 1, 1,
-2.387765, -0.9664578, -0.8687394, 0, 0, 0, 1, 1,
-2.374125, -1.260376, -2.58584, 0, 0, 0, 1, 1,
-2.342091, -2.232904, -3.828435, 0, 0, 0, 1, 1,
-2.338749, -0.4194492, -3.036334, 0, 0, 0, 1, 1,
-2.32158, 1.555344, -1.341558, 0, 0, 0, 1, 1,
-2.22325, 0.1052663, -2.051868, 1, 1, 1, 1, 1,
-2.221072, -1.639936, -3.007122, 1, 1, 1, 1, 1,
-2.164104, 0.4350761, -2.832611, 1, 1, 1, 1, 1,
-2.121196, -1.729465, -1.845628, 1, 1, 1, 1, 1,
-2.118507, 1.428025, -3.495589, 1, 1, 1, 1, 1,
-2.117108, -1.517344, -2.447999, 1, 1, 1, 1, 1,
-2.116047, 0.617829, 0.5135515, 1, 1, 1, 1, 1,
-2.111039, 2.163016, -0.916643, 1, 1, 1, 1, 1,
-2.093276, 1.684089, -0.8158619, 1, 1, 1, 1, 1,
-2.092632, -0.06965064, -1.565375, 1, 1, 1, 1, 1,
-2.041035, 0.7306548, -4.041255, 1, 1, 1, 1, 1,
-2.023321, -1.207844, -2.990315, 1, 1, 1, 1, 1,
-2.006482, -0.469391, -2.835108, 1, 1, 1, 1, 1,
-2.003893, 0.09488757, -2.045346, 1, 1, 1, 1, 1,
-1.996547, -3.31321, -1.076039, 1, 1, 1, 1, 1,
-1.975145, 1.675466, -0.6160423, 0, 0, 1, 1, 1,
-1.961023, 1.766554, -0.5238303, 1, 0, 0, 1, 1,
-1.958526, 0.262839, -0.411536, 1, 0, 0, 1, 1,
-1.932245, 0.7034451, -0.8214551, 1, 0, 0, 1, 1,
-1.925317, 1.24965, -0.4948718, 1, 0, 0, 1, 1,
-1.913728, 1.191568, -1.094343, 1, 0, 0, 1, 1,
-1.908817, -0.4073592, -1.291861, 0, 0, 0, 1, 1,
-1.892205, 0.3182705, -0.6680112, 0, 0, 0, 1, 1,
-1.803735, 2.302531, -1.723012, 0, 0, 0, 1, 1,
-1.803232, -0.163922, -0.8906146, 0, 0, 0, 1, 1,
-1.802699, 0.6918868, -0.8971155, 0, 0, 0, 1, 1,
-1.799706, 0.2740872, -1.982538, 0, 0, 0, 1, 1,
-1.779534, 0.4534827, -2.891012, 0, 0, 0, 1, 1,
-1.764881, -1.97473, -3.8571, 1, 1, 1, 1, 1,
-1.759543, -2.333117, -3.951938, 1, 1, 1, 1, 1,
-1.756743, 1.868973, 0.2157841, 1, 1, 1, 1, 1,
-1.753003, 0.6771643, -0.7338702, 1, 1, 1, 1, 1,
-1.739646, -1.14259, -0.1629739, 1, 1, 1, 1, 1,
-1.730494, -0.645473, -2.491005, 1, 1, 1, 1, 1,
-1.729398, -0.4364113, -1.947145, 1, 1, 1, 1, 1,
-1.713687, -0.9573336, -2.667852, 1, 1, 1, 1, 1,
-1.712045, 0.7706124, -3.003771, 1, 1, 1, 1, 1,
-1.690022, 1.055119, -1.370668, 1, 1, 1, 1, 1,
-1.688643, 0.00138367, -1.374991, 1, 1, 1, 1, 1,
-1.682102, 0.7960188, -2.418376, 1, 1, 1, 1, 1,
-1.679767, -0.1936479, -4.446804, 1, 1, 1, 1, 1,
-1.642432, 1.080271, -0.7362818, 1, 1, 1, 1, 1,
-1.632349, 1.424956, 0.01639083, 1, 1, 1, 1, 1,
-1.627215, -0.2126683, -1.43417, 0, 0, 1, 1, 1,
-1.622536, -1.531996, -1.580942, 1, 0, 0, 1, 1,
-1.621841, -0.01199093, -2.656812, 1, 0, 0, 1, 1,
-1.613259, 1.907504, -0.845419, 1, 0, 0, 1, 1,
-1.605887, 1.576454, -0.09347469, 1, 0, 0, 1, 1,
-1.605685, -0.9160717, -2.051405, 1, 0, 0, 1, 1,
-1.602722, 0.9789712, -0.8952722, 0, 0, 0, 1, 1,
-1.597075, 0.3583787, -0.6058977, 0, 0, 0, 1, 1,
-1.596595, -1.32114, -1.521403, 0, 0, 0, 1, 1,
-1.579382, 0.2209489, -1.395026, 0, 0, 0, 1, 1,
-1.578161, 0.02768971, -0.3334704, 0, 0, 0, 1, 1,
-1.577276, -1.060315, -0.7366264, 0, 0, 0, 1, 1,
-1.575651, 1.36845, 0.1198164, 0, 0, 0, 1, 1,
-1.565759, 1.753269, -0.8669963, 1, 1, 1, 1, 1,
-1.562656, -0.8171779, -3.146773, 1, 1, 1, 1, 1,
-1.52921, -1.348133, -1.826696, 1, 1, 1, 1, 1,
-1.525373, -0.2872398, -2.076569, 1, 1, 1, 1, 1,
-1.507504, -0.2623297, -0.7934951, 1, 1, 1, 1, 1,
-1.50738, -0.8733478, -1.904353, 1, 1, 1, 1, 1,
-1.505504, 1.819193, 1.878235, 1, 1, 1, 1, 1,
-1.477142, 0.7131364, -1.569483, 1, 1, 1, 1, 1,
-1.477049, -0.9709365, -2.533066, 1, 1, 1, 1, 1,
-1.452489, -0.3708056, -1.575281, 1, 1, 1, 1, 1,
-1.446019, -0.5843415, 0.02278547, 1, 1, 1, 1, 1,
-1.444704, -0.3989707, -2.243053, 1, 1, 1, 1, 1,
-1.437161, 0.02550677, -1.936525, 1, 1, 1, 1, 1,
-1.433973, 0.7917462, -0.659771, 1, 1, 1, 1, 1,
-1.431455, 0.1409262, -1.71219, 1, 1, 1, 1, 1,
-1.420766, 1.30482, -0.5039694, 0, 0, 1, 1, 1,
-1.414422, -0.2634054, -2.100358, 1, 0, 0, 1, 1,
-1.408787, -1.522931, -2.643868, 1, 0, 0, 1, 1,
-1.403848, -0.4957733, -1.202224, 1, 0, 0, 1, 1,
-1.400108, -0.9667128, -0.8330048, 1, 0, 0, 1, 1,
-1.395862, -2.175912, -3.344621, 1, 0, 0, 1, 1,
-1.383571, 1.549104, -0.9043304, 0, 0, 0, 1, 1,
-1.382573, -0.253939, -3.761052, 0, 0, 0, 1, 1,
-1.37096, 0.6109461, -0.9153492, 0, 0, 0, 1, 1,
-1.368191, -1.243608, -3.822896, 0, 0, 0, 1, 1,
-1.348686, 0.1279614, -0.9066741, 0, 0, 0, 1, 1,
-1.340837, 0.2973038, -2.271189, 0, 0, 0, 1, 1,
-1.340682, 1.549914, 0.2265526, 0, 0, 0, 1, 1,
-1.33777, -0.346196, -1.610129, 1, 1, 1, 1, 1,
-1.336737, 0.73597, -2.673077, 1, 1, 1, 1, 1,
-1.323374, -0.4257401, -3.355031, 1, 1, 1, 1, 1,
-1.32332, 0.9777072, -0.211893, 1, 1, 1, 1, 1,
-1.322876, -0.6808479, -0.932688, 1, 1, 1, 1, 1,
-1.319691, 0.2481179, -2.099414, 1, 1, 1, 1, 1,
-1.312791, 1.064363, -2.394796, 1, 1, 1, 1, 1,
-1.309662, 1.047067, -1.972321, 1, 1, 1, 1, 1,
-1.30965, -0.1033251, -2.796059, 1, 1, 1, 1, 1,
-1.290524, 1.212475, -0.8167261, 1, 1, 1, 1, 1,
-1.286002, 0.1361412, -1.809801, 1, 1, 1, 1, 1,
-1.276657, -1.005506, -2.465154, 1, 1, 1, 1, 1,
-1.276349, 0.07533475, -1.133208, 1, 1, 1, 1, 1,
-1.271017, 0.0646035, -1.00009, 1, 1, 1, 1, 1,
-1.269528, -1.065942, -0.7034655, 1, 1, 1, 1, 1,
-1.265509, -0.109869, -1.634908, 0, 0, 1, 1, 1,
-1.261456, 0.09930456, -1.955997, 1, 0, 0, 1, 1,
-1.251863, -0.9424831, -1.164273, 1, 0, 0, 1, 1,
-1.242676, -0.3471937, -1.071498, 1, 0, 0, 1, 1,
-1.238721, 0.8086346, -2.329353, 1, 0, 0, 1, 1,
-1.235845, -0.6664551, -0.7846029, 1, 0, 0, 1, 1,
-1.234155, -0.0275541, -1.441303, 0, 0, 0, 1, 1,
-1.233936, 0.4497291, -1.765742, 0, 0, 0, 1, 1,
-1.2296, 0.7368794, -0.6070812, 0, 0, 0, 1, 1,
-1.228178, -0.4543046, -2.034968, 0, 0, 0, 1, 1,
-1.22293, -0.9665765, -1.25886, 0, 0, 0, 1, 1,
-1.222625, 0.8612673, -0.7034902, 0, 0, 0, 1, 1,
-1.219603, 0.4684615, -1.863136, 0, 0, 0, 1, 1,
-1.216261, -0.6510417, -3.102959, 1, 1, 1, 1, 1,
-1.202309, 0.02295477, -1.698973, 1, 1, 1, 1, 1,
-1.197919, 1.279645, 0.6458666, 1, 1, 1, 1, 1,
-1.194973, -0.7121048, -2.474673, 1, 1, 1, 1, 1,
-1.193284, -0.06875655, -0.8406908, 1, 1, 1, 1, 1,
-1.191399, -1.554662, -0.5917734, 1, 1, 1, 1, 1,
-1.187002, -0.7462338, -2.297819, 1, 1, 1, 1, 1,
-1.186653, 0.6436573, -1.175895, 1, 1, 1, 1, 1,
-1.177253, -0.6918949, -0.4919636, 1, 1, 1, 1, 1,
-1.16264, -0.4298943, -0.8751963, 1, 1, 1, 1, 1,
-1.16256, 0.2453533, -2.368177, 1, 1, 1, 1, 1,
-1.161944, -0.06984684, -2.052478, 1, 1, 1, 1, 1,
-1.160882, -0.6886166, -2.46604, 1, 1, 1, 1, 1,
-1.157091, -1.687593, -3.919407, 1, 1, 1, 1, 1,
-1.15202, 0.871892, -1.525654, 1, 1, 1, 1, 1,
-1.144197, 0.1544759, -2.764077, 0, 0, 1, 1, 1,
-1.141665, -1.918049, -0.4323989, 1, 0, 0, 1, 1,
-1.138926, 0.2139558, -1.820574, 1, 0, 0, 1, 1,
-1.136785, -0.9317859, -0.7256884, 1, 0, 0, 1, 1,
-1.130068, -0.6051289, -2.883868, 1, 0, 0, 1, 1,
-1.121908, -0.6083611, -1.709678, 1, 0, 0, 1, 1,
-1.112892, 1.651918, -0.1949178, 0, 0, 0, 1, 1,
-1.112005, -1.292546, -3.028825, 0, 0, 0, 1, 1,
-1.109966, -1.224265, -4.450401, 0, 0, 0, 1, 1,
-1.102225, 2.482414, -0.4489676, 0, 0, 0, 1, 1,
-1.095333, -0.4559183, -1.284879, 0, 0, 0, 1, 1,
-1.084729, 2.074379, -0.4330309, 0, 0, 0, 1, 1,
-1.083573, 1.949534, 0.7200652, 0, 0, 0, 1, 1,
-1.076534, 0.0588752, -0.6232396, 1, 1, 1, 1, 1,
-1.072547, -0.6991579, -2.230664, 1, 1, 1, 1, 1,
-1.071933, -0.5509642, -1.81287, 1, 1, 1, 1, 1,
-1.068111, 0.6740239, 0.04736659, 1, 1, 1, 1, 1,
-1.06766, -0.2655584, -0.9192005, 1, 1, 1, 1, 1,
-1.066461, 2.733837, -1.057775, 1, 1, 1, 1, 1,
-1.054354, 1.215488, -0.05735023, 1, 1, 1, 1, 1,
-1.050626, 0.9204548, -0.04060857, 1, 1, 1, 1, 1,
-1.045079, 0.5317202, -0.9957202, 1, 1, 1, 1, 1,
-1.037961, -0.6875857, -3.535179, 1, 1, 1, 1, 1,
-1.036321, 1.387597, -0.7837572, 1, 1, 1, 1, 1,
-1.031575, -0.8974973, -2.164927, 1, 1, 1, 1, 1,
-1.029921, -0.777798, -2.483953, 1, 1, 1, 1, 1,
-1.028231, 1.224976, -1.89755, 1, 1, 1, 1, 1,
-1.023211, -0.2501579, -1.381521, 1, 1, 1, 1, 1,
-1.021913, 0.5824144, -2.925568, 0, 0, 1, 1, 1,
-1.018496, 0.1417868, -1.294378, 1, 0, 0, 1, 1,
-1.009032, -0.9027928, -0.4867018, 1, 0, 0, 1, 1,
-1.008133, -0.002153181, -0.9652724, 1, 0, 0, 1, 1,
-1.005725, -0.7904747, -2.857952, 1, 0, 0, 1, 1,
-0.9878527, -0.003577327, -0.5898919, 1, 0, 0, 1, 1,
-0.9825375, -0.8349081, -4.337889, 0, 0, 0, 1, 1,
-0.9824069, 0.06636388, -1.379288, 0, 0, 0, 1, 1,
-0.9794565, -0.591821, -3.396662, 0, 0, 0, 1, 1,
-0.9770977, 0.3141169, -0.2610973, 0, 0, 0, 1, 1,
-0.9737372, 0.6596995, -2.593956, 0, 0, 0, 1, 1,
-0.9698831, 0.2106572, -2.686961, 0, 0, 0, 1, 1,
-0.9625809, 0.07260448, -0.4482423, 0, 0, 0, 1, 1,
-0.9593076, -0.02530386, -1.366041, 1, 1, 1, 1, 1,
-0.9573399, 1.621931, 1.50146, 1, 1, 1, 1, 1,
-0.9556893, -1.156278, -3.242789, 1, 1, 1, 1, 1,
-0.9540702, 0.1493734, -2.511003, 1, 1, 1, 1, 1,
-0.9536079, 1.374852, -0.6059844, 1, 1, 1, 1, 1,
-0.9488239, 0.3096196, -2.018366, 1, 1, 1, 1, 1,
-0.9469773, -1.096664, -1.968589, 1, 1, 1, 1, 1,
-0.9394258, -1.187551, -3.006703, 1, 1, 1, 1, 1,
-0.938026, 1.032318, -0.3926667, 1, 1, 1, 1, 1,
-0.9224988, 1.025559, -1.625112, 1, 1, 1, 1, 1,
-0.9220454, -0.0449226, -1.239796, 1, 1, 1, 1, 1,
-0.9186991, 0.7177993, -0.3910512, 1, 1, 1, 1, 1,
-0.8950676, 0.1385706, -1.805219, 1, 1, 1, 1, 1,
-0.8926812, -1.729183, -0.6808968, 1, 1, 1, 1, 1,
-0.891053, 0.34719, -1.000041, 1, 1, 1, 1, 1,
-0.8867577, -0.9224945, -2.87625, 0, 0, 1, 1, 1,
-0.8708966, 0.9459766, -1.702045, 1, 0, 0, 1, 1,
-0.8686917, -0.02633949, -2.589032, 1, 0, 0, 1, 1,
-0.8683543, -1.554621, -2.929708, 1, 0, 0, 1, 1,
-0.8648851, 0.7152346, 0.4172888, 1, 0, 0, 1, 1,
-0.862492, 0.5600668, -1.450985, 1, 0, 0, 1, 1,
-0.8560817, -0.4177077, -1.954224, 0, 0, 0, 1, 1,
-0.8514215, 0.676454, -0.2027026, 0, 0, 0, 1, 1,
-0.8502953, -0.2379342, -2.41877, 0, 0, 0, 1, 1,
-0.8460405, 2.189093, -1.773732, 0, 0, 0, 1, 1,
-0.8365692, 0.8521833, -2.026317, 0, 0, 0, 1, 1,
-0.8338082, -0.9524598, -4.20386, 0, 0, 0, 1, 1,
-0.829173, -0.01288337, -1.079116, 0, 0, 0, 1, 1,
-0.8232285, 0.06252024, -1.809463, 1, 1, 1, 1, 1,
-0.8141972, 1.933053, 0.2300469, 1, 1, 1, 1, 1,
-0.8110147, 0.2876679, -0.8569859, 1, 1, 1, 1, 1,
-0.8106385, 1.03766, -0.2157348, 1, 1, 1, 1, 1,
-0.7969531, 0.2723098, -2.639781, 1, 1, 1, 1, 1,
-0.7950607, -0.06745401, -1.076415, 1, 1, 1, 1, 1,
-0.7945915, -1.871758, -1.332195, 1, 1, 1, 1, 1,
-0.7915672, -0.6359262, -2.128286, 1, 1, 1, 1, 1,
-0.7895108, -1.453364, -3.17274, 1, 1, 1, 1, 1,
-0.7828679, 0.3449456, -1.670612, 1, 1, 1, 1, 1,
-0.7826499, 0.4421125, 0.1485347, 1, 1, 1, 1, 1,
-0.7791353, -0.4192374, 0.4253983, 1, 1, 1, 1, 1,
-0.7783498, -0.7284057, -3.198298, 1, 1, 1, 1, 1,
-0.7707106, 0.03984276, -2.022879, 1, 1, 1, 1, 1,
-0.7689345, 0.1463288, -0.689191, 1, 1, 1, 1, 1,
-0.7676547, 0.7770345, -1.550519, 0, 0, 1, 1, 1,
-0.7662255, 0.5938458, 0.6361392, 1, 0, 0, 1, 1,
-0.7584546, 0.7003098, -2.447821, 1, 0, 0, 1, 1,
-0.7570987, 0.05357916, -1.584084, 1, 0, 0, 1, 1,
-0.7449139, -2.481755, -2.770208, 1, 0, 0, 1, 1,
-0.7427036, -0.3622445, -3.573978, 1, 0, 0, 1, 1,
-0.7394939, -0.1899833, -0.3722112, 0, 0, 0, 1, 1,
-0.7367311, 0.7856166, -2.535396, 0, 0, 0, 1, 1,
-0.7297195, 0.4920126, -1.068857, 0, 0, 0, 1, 1,
-0.7297006, -1.83877, -2.598463, 0, 0, 0, 1, 1,
-0.7239938, -0.3009163, -1.059557, 0, 0, 0, 1, 1,
-0.719279, 1.689984, -0.4922794, 0, 0, 0, 1, 1,
-0.7168584, -1.058965, -2.926818, 0, 0, 0, 1, 1,
-0.7160404, -0.6910357, -3.81102, 1, 1, 1, 1, 1,
-0.7064461, -1.12547, -3.066977, 1, 1, 1, 1, 1,
-0.7020687, 0.27303, -2.159884, 1, 1, 1, 1, 1,
-0.7018166, -0.0524282, -2.96642, 1, 1, 1, 1, 1,
-0.6957799, 1.059162, -1.022772, 1, 1, 1, 1, 1,
-0.6880357, 0.551545, -2.050966, 1, 1, 1, 1, 1,
-0.6873643, -0.9606107, -3.166294, 1, 1, 1, 1, 1,
-0.6855701, -0.7195026, -2.30494, 1, 1, 1, 1, 1,
-0.6851745, -0.228459, -2.837057, 1, 1, 1, 1, 1,
-0.6847595, -0.5511773, -2.332337, 1, 1, 1, 1, 1,
-0.6802709, 1.628693, -1.0379, 1, 1, 1, 1, 1,
-0.6769881, -0.1448022, -1.182543, 1, 1, 1, 1, 1,
-0.6665833, 1.260734, -0.8085785, 1, 1, 1, 1, 1,
-0.6634133, -1.40035, -3.513074, 1, 1, 1, 1, 1,
-0.6624781, -0.29173, -1.916353, 1, 1, 1, 1, 1,
-0.658053, 0.7274039, -1.032264, 0, 0, 1, 1, 1,
-0.6512207, -0.8240954, -3.335989, 1, 0, 0, 1, 1,
-0.6499495, -0.5287015, -2.911397, 1, 0, 0, 1, 1,
-0.6472966, -1.347723, -1.828403, 1, 0, 0, 1, 1,
-0.6438328, -0.5139679, -2.583778, 1, 0, 0, 1, 1,
-0.6392205, -0.01749629, -1.69212, 1, 0, 0, 1, 1,
-0.637963, -1.590713, -3.111158, 0, 0, 0, 1, 1,
-0.6352315, 0.4580244, -0.4523067, 0, 0, 0, 1, 1,
-0.6334251, -0.4615104, -1.927345, 0, 0, 0, 1, 1,
-0.6322368, -0.03123327, -2.147719, 0, 0, 0, 1, 1,
-0.6315296, -0.8502776, -2.262686, 0, 0, 0, 1, 1,
-0.6313351, -0.1183305, -1.903278, 0, 0, 0, 1, 1,
-0.6282784, -0.4657253, -1.420296, 0, 0, 0, 1, 1,
-0.6264498, -1.007198, -2.244157, 1, 1, 1, 1, 1,
-0.6206301, -1.898576, -3.192555, 1, 1, 1, 1, 1,
-0.6196541, -0.3919523, -2.134848, 1, 1, 1, 1, 1,
-0.6100053, -0.7093014, -1.573412, 1, 1, 1, 1, 1,
-0.6098917, 0.2433654, 0.7814227, 1, 1, 1, 1, 1,
-0.6092081, 0.1422665, -1.011395, 1, 1, 1, 1, 1,
-0.6081353, -0.2290784, -0.5166935, 1, 1, 1, 1, 1,
-0.6023046, -0.2571225, -1.86636, 1, 1, 1, 1, 1,
-0.6015125, -0.3593379, -1.477423, 1, 1, 1, 1, 1,
-0.5982507, 0.9920627, -1.711025, 1, 1, 1, 1, 1,
-0.5953886, -0.001831765, -1.287419, 1, 1, 1, 1, 1,
-0.5951214, -0.6841736, -3.929157, 1, 1, 1, 1, 1,
-0.5863167, 0.05649072, -0.4737754, 1, 1, 1, 1, 1,
-0.5855724, 0.3410673, -2.857102, 1, 1, 1, 1, 1,
-0.5845212, 0.1588698, -1.28829, 1, 1, 1, 1, 1,
-0.5813263, 0.05394242, -1.228531, 0, 0, 1, 1, 1,
-0.5801553, -0.3069446, -2.849408, 1, 0, 0, 1, 1,
-0.5784486, 0.4936302, -2.988219, 1, 0, 0, 1, 1,
-0.5766978, 0.545154, -0.1908814, 1, 0, 0, 1, 1,
-0.5765554, -0.2106662, -2.650416, 1, 0, 0, 1, 1,
-0.57176, 0.96047, -0.1179897, 1, 0, 0, 1, 1,
-0.5661483, 0.8405265, -1.679777, 0, 0, 0, 1, 1,
-0.5595649, 0.04828146, -2.97523, 0, 0, 0, 1, 1,
-0.5557256, 0.5756406, 1.19999, 0, 0, 0, 1, 1,
-0.546567, 1.324017, -1.117006, 0, 0, 0, 1, 1,
-0.5396374, 0.5696207, -0.9878885, 0, 0, 0, 1, 1,
-0.5378382, 0.9777176, -0.2783555, 0, 0, 0, 1, 1,
-0.5374071, 1.037111, -2.552386, 0, 0, 0, 1, 1,
-0.5356824, -1.22917, -2.725428, 1, 1, 1, 1, 1,
-0.5345601, -0.5405998, -1.991209, 1, 1, 1, 1, 1,
-0.5274565, 1.255444, -0.9054906, 1, 1, 1, 1, 1,
-0.5246781, -0.1048828, -2.514058, 1, 1, 1, 1, 1,
-0.5129392, -1.60181, -2.831417, 1, 1, 1, 1, 1,
-0.5110722, -0.172244, -3.223173, 1, 1, 1, 1, 1,
-0.5016211, 0.8844105, -2.003858, 1, 1, 1, 1, 1,
-0.4997136, 0.3421059, 0.2962867, 1, 1, 1, 1, 1,
-0.491354, 1.19683, 1.337829, 1, 1, 1, 1, 1,
-0.4882045, 0.3113768, -0.4279733, 1, 1, 1, 1, 1,
-0.4856957, -0.3716245, -2.726954, 1, 1, 1, 1, 1,
-0.4741205, -0.8638581, -2.540243, 1, 1, 1, 1, 1,
-0.4728558, -0.3991315, -1.499115, 1, 1, 1, 1, 1,
-0.4694563, -0.8479066, -4.034222, 1, 1, 1, 1, 1,
-0.4693031, 0.4820605, -0.1795536, 1, 1, 1, 1, 1,
-0.4662516, -1.385826, -2.524205, 0, 0, 1, 1, 1,
-0.46473, -0.7704467, -2.77482, 1, 0, 0, 1, 1,
-0.46057, -0.7756115, -3.731984, 1, 0, 0, 1, 1,
-0.4588421, -0.6165321, -3.861848, 1, 0, 0, 1, 1,
-0.4582624, -0.4628502, -2.42328, 1, 0, 0, 1, 1,
-0.4546337, -1.5975, -4.479654, 1, 0, 0, 1, 1,
-0.4489243, 0.2500497, -0.3124123, 0, 0, 0, 1, 1,
-0.4483932, 1.511158, 0.7174052, 0, 0, 0, 1, 1,
-0.4470107, 1.181547, -0.8917037, 0, 0, 0, 1, 1,
-0.4403476, 1.134595, -0.7227855, 0, 0, 0, 1, 1,
-0.4367376, -0.1452902, -1.360446, 0, 0, 0, 1, 1,
-0.4232904, 0.4978085, -0.6731359, 0, 0, 0, 1, 1,
-0.4146017, -1.379086, -3.717684, 0, 0, 0, 1, 1,
-0.4122197, -0.733757, -1.798095, 1, 1, 1, 1, 1,
-0.4081222, -1.079764, -3.608081, 1, 1, 1, 1, 1,
-0.4061646, 0.01017471, -3.299326, 1, 1, 1, 1, 1,
-0.3973207, -1.533288, -2.017394, 1, 1, 1, 1, 1,
-0.3967725, 0.07957732, -2.411733, 1, 1, 1, 1, 1,
-0.3936801, 0.3862213, -0.006776437, 1, 1, 1, 1, 1,
-0.3915627, 0.6276504, 0.1618933, 1, 1, 1, 1, 1,
-0.3895256, -1.556737, -3.474058, 1, 1, 1, 1, 1,
-0.3889217, -1.110513, -2.2763, 1, 1, 1, 1, 1,
-0.3864084, 1.614144, 0.2885179, 1, 1, 1, 1, 1,
-0.3862817, -1.297776, -3.110968, 1, 1, 1, 1, 1,
-0.378664, 0.3363909, -1.212966, 1, 1, 1, 1, 1,
-0.3768899, -1.478486, -3.630041, 1, 1, 1, 1, 1,
-0.3757197, -0.7782994, -2.216558, 1, 1, 1, 1, 1,
-0.3655554, 0.8888263, 1.03395, 1, 1, 1, 1, 1,
-0.3643278, -0.3369427, -1.577039, 0, 0, 1, 1, 1,
-0.3607241, -0.4171484, -2.89856, 1, 0, 0, 1, 1,
-0.3531229, -0.4472813, -2.002049, 1, 0, 0, 1, 1,
-0.3491265, 0.5730486, -1.011266, 1, 0, 0, 1, 1,
-0.348497, 0.5673788, 0.2779838, 1, 0, 0, 1, 1,
-0.3484663, 1.342596, -0.1434103, 1, 0, 0, 1, 1,
-0.3461075, 0.4426672, -0.343206, 0, 0, 0, 1, 1,
-0.3448834, 0.3063745, 0.5747852, 0, 0, 0, 1, 1,
-0.3422686, 0.08093078, -1.684074, 0, 0, 0, 1, 1,
-0.3413675, -0.1198239, -1.226723, 0, 0, 0, 1, 1,
-0.3237697, -0.3805337, -1.497604, 0, 0, 0, 1, 1,
-0.3197817, 1.762133, 0.7588568, 0, 0, 0, 1, 1,
-0.3146366, 0.5602677, 1.300602, 0, 0, 0, 1, 1,
-0.3109099, -0.4050063, -2.81875, 1, 1, 1, 1, 1,
-0.3108378, -2.927568, -1.676927, 1, 1, 1, 1, 1,
-0.3102373, -0.2971805, -3.284529, 1, 1, 1, 1, 1,
-0.3078048, -0.9264245, -1.243157, 1, 1, 1, 1, 1,
-0.3047445, 0.5345687, -0.9233046, 1, 1, 1, 1, 1,
-0.3028051, 0.583056, -1.406606, 1, 1, 1, 1, 1,
-0.3022037, -0.7414506, -2.881018, 1, 1, 1, 1, 1,
-0.2986687, 0.5125589, 0.5720341, 1, 1, 1, 1, 1,
-0.2956306, 0.3548586, -1.530641, 1, 1, 1, 1, 1,
-0.2943622, 0.7217213, -0.3503202, 1, 1, 1, 1, 1,
-0.2928386, -1.123241, -1.907876, 1, 1, 1, 1, 1,
-0.2841295, -0.03121748, -2.883342, 1, 1, 1, 1, 1,
-0.2778236, -2.136819, -3.490893, 1, 1, 1, 1, 1,
-0.2742876, 1.611067, 0.8412136, 1, 1, 1, 1, 1,
-0.2732471, 0.9764579, -0.3978815, 1, 1, 1, 1, 1,
-0.2720537, -0.4339665, -2.490144, 0, 0, 1, 1, 1,
-0.2714985, 0.6021362, -1.46791, 1, 0, 0, 1, 1,
-0.2705403, 1.219776, -0.8518385, 1, 0, 0, 1, 1,
-0.2694863, -0.849989, -3.239614, 1, 0, 0, 1, 1,
-0.2687183, -0.6848567, -2.542216, 1, 0, 0, 1, 1,
-0.2673381, 1.104537, 0.4797665, 1, 0, 0, 1, 1,
-0.261776, -0.2127579, -1.516039, 0, 0, 0, 1, 1,
-0.2601585, 0.2670603, -1.568096, 0, 0, 0, 1, 1,
-0.2585358, 0.5675961, -0.09051473, 0, 0, 0, 1, 1,
-0.2509385, 1.063097, 0.3248813, 0, 0, 0, 1, 1,
-0.2496278, 0.05258245, -1.717559, 0, 0, 0, 1, 1,
-0.2478863, 0.02725808, -2.726386, 0, 0, 0, 1, 1,
-0.2478786, -0.06998395, -2.062267, 0, 0, 0, 1, 1,
-0.2478552, -0.376678, -2.708942, 1, 1, 1, 1, 1,
-0.2465733, -0.7645326, -4.193213, 1, 1, 1, 1, 1,
-0.2458069, 0.212779, -1.026033, 1, 1, 1, 1, 1,
-0.2450163, -0.7541229, -4.255492, 1, 1, 1, 1, 1,
-0.2444461, 0.9121168, 0.69633, 1, 1, 1, 1, 1,
-0.2426479, -1.182215, -3.638215, 1, 1, 1, 1, 1,
-0.2423133, -0.04644982, -1.782115, 1, 1, 1, 1, 1,
-0.2356119, 0.2261447, -0.5194852, 1, 1, 1, 1, 1,
-0.2354901, 1.233037, -0.5936414, 1, 1, 1, 1, 1,
-0.2186059, 1.783523, -0.5365443, 1, 1, 1, 1, 1,
-0.2162635, -0.2920221, -2.474484, 1, 1, 1, 1, 1,
-0.2138903, 1.391051, -1.127928, 1, 1, 1, 1, 1,
-0.2137964, 1.118201, 1.715644, 1, 1, 1, 1, 1,
-0.2103434, -0.7131792, -2.182165, 1, 1, 1, 1, 1,
-0.2057852, -0.8693789, -2.697308, 1, 1, 1, 1, 1,
-0.2052264, -0.5125852, -2.491218, 0, 0, 1, 1, 1,
-0.2036493, 0.5961409, 0.01566127, 1, 0, 0, 1, 1,
-0.2008413, 0.1434747, -0.6633948, 1, 0, 0, 1, 1,
-0.1959681, -0.4626735, -3.591389, 1, 0, 0, 1, 1,
-0.1921248, -0.9233235, -4.936378, 1, 0, 0, 1, 1,
-0.1856494, -0.2921455, -2.031081, 1, 0, 0, 1, 1,
-0.1853611, 0.9263978, 0.5494934, 0, 0, 0, 1, 1,
-0.1833502, 0.8854483, -0.3351097, 0, 0, 0, 1, 1,
-0.1828408, -1.551027, -2.723702, 0, 0, 0, 1, 1,
-0.1818255, -0.6582749, -2.525206, 0, 0, 0, 1, 1,
-0.180713, 0.1255597, -0.8383447, 0, 0, 0, 1, 1,
-0.1792197, 1.600794, 0.503432, 0, 0, 0, 1, 1,
-0.1750957, 0.3076253, -0.9176716, 0, 0, 0, 1, 1,
-0.1735719, 0.01395658, -2.612405, 1, 1, 1, 1, 1,
-0.1713905, 0.2697878, -1.981561, 1, 1, 1, 1, 1,
-0.1692715, -0.1239382, -2.650326, 1, 1, 1, 1, 1,
-0.1663343, 0.4379201, -0.5058113, 1, 1, 1, 1, 1,
-0.1661991, -2.197394, -2.361003, 1, 1, 1, 1, 1,
-0.165362, 1.230212, 0.08504304, 1, 1, 1, 1, 1,
-0.1608799, 1.337201, 1.616454, 1, 1, 1, 1, 1,
-0.1535665, 0.7267501, -0.3856474, 1, 1, 1, 1, 1,
-0.1464596, -1.230806, -2.291949, 1, 1, 1, 1, 1,
-0.1464573, -0.1513247, -0.9668244, 1, 1, 1, 1, 1,
-0.1407163, -0.4217823, -2.104437, 1, 1, 1, 1, 1,
-0.1389204, -0.4154372, -3.501379, 1, 1, 1, 1, 1,
-0.1364871, 2.179199, 0.2458185, 1, 1, 1, 1, 1,
-0.1360757, -0.7895384, -3.233629, 1, 1, 1, 1, 1,
-0.1349339, 0.8470042, 0.4122593, 1, 1, 1, 1, 1,
-0.1335389, 0.3959112, 0.8050292, 0, 0, 1, 1, 1,
-0.130407, 1.949775, -1.414124, 1, 0, 0, 1, 1,
-0.1303662, -1.281746, -1.672435, 1, 0, 0, 1, 1,
-0.1240938, 0.4355823, 0.8037015, 1, 0, 0, 1, 1,
-0.1198642, -0.9086775, -2.28509, 1, 0, 0, 1, 1,
-0.1158739, -0.4244242, -1.62263, 1, 0, 0, 1, 1,
-0.1136814, 0.8960949, 1.044158, 0, 0, 0, 1, 1,
-0.1134368, 1.103326, 0.3374127, 0, 0, 0, 1, 1,
-0.1119747, 1.091845, 1.963796, 0, 0, 0, 1, 1,
-0.1085125, 0.3134432, -2.045439, 0, 0, 0, 1, 1,
-0.1068754, -0.4357254, -3.571543, 0, 0, 0, 1, 1,
-0.1064774, 0.9199049, -1.515256, 0, 0, 0, 1, 1,
-0.1048351, 1.165098, -0.468643, 0, 0, 0, 1, 1,
-0.1032977, 0.6421615, 0.4899532, 1, 1, 1, 1, 1,
-0.09983587, -0.2925578, -3.395438, 1, 1, 1, 1, 1,
-0.09777848, 0.8636208, -0.05592358, 1, 1, 1, 1, 1,
-0.09092726, 0.4531626, -1.658029, 1, 1, 1, 1, 1,
-0.08730164, 0.09174029, -2.177622, 1, 1, 1, 1, 1,
-0.08638351, 1.142338, 1.015002, 1, 1, 1, 1, 1,
-0.08432893, -0.3619522, -2.022454, 1, 1, 1, 1, 1,
-0.08257904, -1.638255, -4.327164, 1, 1, 1, 1, 1,
-0.07769725, 1.805272, 0.03885978, 1, 1, 1, 1, 1,
-0.07711787, 1.076207, -0.8816311, 1, 1, 1, 1, 1,
-0.06911256, -2.133997, -3.580179, 1, 1, 1, 1, 1,
-0.06721873, 0.6918583, -0.2645662, 1, 1, 1, 1, 1,
-0.0628355, 1.448185, -1.048919, 1, 1, 1, 1, 1,
-0.06029978, -0.03342287, -1.260244, 1, 1, 1, 1, 1,
-0.0589954, 2.315927, -0.3695379, 1, 1, 1, 1, 1,
-0.05585574, -1.177757, -4.259785, 0, 0, 1, 1, 1,
-0.04777094, 0.5784622, -1.412361, 1, 0, 0, 1, 1,
-0.04296372, 1.181918, 1.222651, 1, 0, 0, 1, 1,
-0.04270284, -1.0244, -3.181939, 1, 0, 0, 1, 1,
-0.04123446, 1.517238, 0.188669, 1, 0, 0, 1, 1,
-0.04082689, 1.338878, -1.116479, 1, 0, 0, 1, 1,
-0.04067329, -0.6065649, -1.902983, 0, 0, 0, 1, 1,
-0.03553034, -0.8559018, -2.303351, 0, 0, 0, 1, 1,
-0.03394806, 0.03408129, -0.9984765, 0, 0, 0, 1, 1,
-0.03355492, 0.08681124, 0.5379807, 0, 0, 0, 1, 1,
-0.03036289, 1.284002, -0.01320621, 0, 0, 0, 1, 1,
-0.02528208, -0.4279609, -3.027512, 0, 0, 0, 1, 1,
-0.02003172, 0.2192848, -1.590612, 0, 0, 0, 1, 1,
-0.01846407, 1.357988, -0.005147104, 1, 1, 1, 1, 1,
-0.01713802, 0.2357465, -1.463691, 1, 1, 1, 1, 1,
-0.01709291, -0.4514075, -2.498327, 1, 1, 1, 1, 1,
-0.01336377, -1.248833, -3.267555, 1, 1, 1, 1, 1,
-0.01178693, -0.1022817, -3.87247, 1, 1, 1, 1, 1,
-0.008587395, 1.579641, -1.845923, 1, 1, 1, 1, 1,
-0.008248103, -0.9793718, -2.236748, 1, 1, 1, 1, 1,
-0.003527067, 1.398251, 0.02262919, 1, 1, 1, 1, 1,
0.002099398, -0.8207507, 2.370301, 1, 1, 1, 1, 1,
0.005779118, 1.249787, 2.502189, 1, 1, 1, 1, 1,
0.006753983, -1.542243, 5.750076, 1, 1, 1, 1, 1,
0.006810329, 0.2527878, 0.5801528, 1, 1, 1, 1, 1,
0.01978926, -0.677037, 2.845496, 1, 1, 1, 1, 1,
0.02315866, 0.2721889, 0.9450755, 1, 1, 1, 1, 1,
0.02474428, -1.197628, 2.433, 1, 1, 1, 1, 1,
0.02514328, 0.8857672, 0.010866, 0, 0, 1, 1, 1,
0.02738516, -0.5957959, 3.424575, 1, 0, 0, 1, 1,
0.02780299, 0.7542497, 0.1984183, 1, 0, 0, 1, 1,
0.03052854, 0.4220325, -0.288343, 1, 0, 0, 1, 1,
0.03312297, 1.907227, 2.538385, 1, 0, 0, 1, 1,
0.03546755, 1.982158, 0.8119951, 1, 0, 0, 1, 1,
0.03927095, 1.443021, 1.331613, 0, 0, 0, 1, 1,
0.04151832, 0.5296565, -1.411974, 0, 0, 0, 1, 1,
0.04197164, 1.183978, 0.9050586, 0, 0, 0, 1, 1,
0.04275902, 0.09715242, 0.4914989, 0, 0, 0, 1, 1,
0.0444071, 1.069348, 0.1759648, 0, 0, 0, 1, 1,
0.04696135, 1.959415, -1.413837, 0, 0, 0, 1, 1,
0.05096691, -0.03119377, 2.436007, 0, 0, 0, 1, 1,
0.05459352, -0.5884177, 3.487803, 1, 1, 1, 1, 1,
0.05523251, -1.484558, 3.390213, 1, 1, 1, 1, 1,
0.05796833, 0.2060553, 1.54552, 1, 1, 1, 1, 1,
0.06337883, 1.699971, -0.2982121, 1, 1, 1, 1, 1,
0.06709057, 0.451987, 0.8291389, 1, 1, 1, 1, 1,
0.06749418, -0.6239953, 1.940642, 1, 1, 1, 1, 1,
0.06954658, -0.9798312, 1.452799, 1, 1, 1, 1, 1,
0.07074457, 0.5167749, 0.7565919, 1, 1, 1, 1, 1,
0.07328549, -0.5796844, 3.463978, 1, 1, 1, 1, 1,
0.07529259, -0.207036, 3.5075, 1, 1, 1, 1, 1,
0.07533816, 1.04504, -0.6013049, 1, 1, 1, 1, 1,
0.07568412, -0.6637781, 4.501229, 1, 1, 1, 1, 1,
0.07811864, -1.097185, 4.449372, 1, 1, 1, 1, 1,
0.0914172, 0.07818978, -1.057696, 1, 1, 1, 1, 1,
0.09465277, -0.863945, 2.277309, 1, 1, 1, 1, 1,
0.09643424, 1.585777, 0.3072332, 0, 0, 1, 1, 1,
0.09661718, -1.239716, 1.929477, 1, 0, 0, 1, 1,
0.1019032, -1.616582, 4.89727, 1, 0, 0, 1, 1,
0.1025781, -1.298245, 3.149741, 1, 0, 0, 1, 1,
0.1039407, 0.7007213, 0.6439937, 1, 0, 0, 1, 1,
0.1060422, -0.60955, 3.716507, 1, 0, 0, 1, 1,
0.1108289, 0.211172, 0.9490225, 0, 0, 0, 1, 1,
0.1124244, -0.2330205, 1.992865, 0, 0, 0, 1, 1,
0.1149132, 0.8494129, -0.1963873, 0, 0, 0, 1, 1,
0.1154783, -0.1584458, 2.386913, 0, 0, 0, 1, 1,
0.1220829, -0.299028, 1.563718, 0, 0, 0, 1, 1,
0.123083, 0.442591, 0.5302686, 0, 0, 0, 1, 1,
0.1246633, -0.6638107, 3.712028, 0, 0, 0, 1, 1,
0.1263893, -1.530857, 3.883612, 1, 1, 1, 1, 1,
0.1291336, -0.5779341, 3.621598, 1, 1, 1, 1, 1,
0.1310327, -0.2930834, 3.095143, 1, 1, 1, 1, 1,
0.1316145, -1.394393, 3.361567, 1, 1, 1, 1, 1,
0.1357413, -0.9343217, 1.29647, 1, 1, 1, 1, 1,
0.1359943, -0.5397077, 2.312749, 1, 1, 1, 1, 1,
0.1388448, -1.983004, 2.595998, 1, 1, 1, 1, 1,
0.1407892, 0.6527069, -0.5580429, 1, 1, 1, 1, 1,
0.1424287, 1.187594, 0.4324624, 1, 1, 1, 1, 1,
0.145802, 0.144342, 0.6437824, 1, 1, 1, 1, 1,
0.1462726, -0.5140142, 1.896434, 1, 1, 1, 1, 1,
0.1545253, -0.3993893, 2.698086, 1, 1, 1, 1, 1,
0.1559001, 1.425949, -1.937725, 1, 1, 1, 1, 1,
0.1597202, 1.562275, 1.333515, 1, 1, 1, 1, 1,
0.1597675, 0.01265667, 1.037706, 1, 1, 1, 1, 1,
0.161112, -1.204498, 2.227821, 0, 0, 1, 1, 1,
0.1625901, -0.305858, 2.717274, 1, 0, 0, 1, 1,
0.1650742, -0.678243, 2.165871, 1, 0, 0, 1, 1,
0.1652723, -0.8917327, 3.932333, 1, 0, 0, 1, 1,
0.1729922, -0.8440584, 3.929277, 1, 0, 0, 1, 1,
0.1777756, -1.642207, 2.563562, 1, 0, 0, 1, 1,
0.1795161, -0.8779008, 3.260248, 0, 0, 0, 1, 1,
0.1809948, -1.100694, 3.412549, 0, 0, 0, 1, 1,
0.1836294, -1.013791, 2.117354, 0, 0, 0, 1, 1,
0.187251, 1.520578, -0.2014933, 0, 0, 0, 1, 1,
0.1877453, 0.2397509, 1.185745, 0, 0, 0, 1, 1,
0.1881423, 0.9000555, -0.3075714, 0, 0, 0, 1, 1,
0.1890123, 1.382656, -0.6904814, 0, 0, 0, 1, 1,
0.1915376, 1.790872, -1.299633, 1, 1, 1, 1, 1,
0.1942528, 0.5038812, 0.8762911, 1, 1, 1, 1, 1,
0.1952928, -0.4522834, 1.858425, 1, 1, 1, 1, 1,
0.1978669, -0.4879147, 2.720387, 1, 1, 1, 1, 1,
0.2003098, 1.340683, 1.432581, 1, 1, 1, 1, 1,
0.2033058, 0.2726062, 1.467971, 1, 1, 1, 1, 1,
0.2073691, -0.3093854, 2.319283, 1, 1, 1, 1, 1,
0.2120451, -0.09396351, 4.206029, 1, 1, 1, 1, 1,
0.2159377, 0.2590077, 0.9736327, 1, 1, 1, 1, 1,
0.2164367, 1.587318, 0.4237787, 1, 1, 1, 1, 1,
0.2165865, 1.529761, 0.5921929, 1, 1, 1, 1, 1,
0.2178214, -1.031952, 3.140925, 1, 1, 1, 1, 1,
0.2181412, 0.5404501, 0.4021556, 1, 1, 1, 1, 1,
0.2254253, 0.3721638, -0.2125225, 1, 1, 1, 1, 1,
0.2281438, 1.387865, -0.3989952, 1, 1, 1, 1, 1,
0.2282297, 0.6506366, -0.4248757, 0, 0, 1, 1, 1,
0.2317335, 1.355697, 1.621946, 1, 0, 0, 1, 1,
0.2329505, 0.2130989, 0.7912208, 1, 0, 0, 1, 1,
0.2349858, -0.5687817, 2.903581, 1, 0, 0, 1, 1,
0.23735, 0.2848845, 0.322352, 1, 0, 0, 1, 1,
0.2379323, -0.3326892, 4.187726, 1, 0, 0, 1, 1,
0.2398962, 1.278386, 1.607522, 0, 0, 0, 1, 1,
0.241555, -0.5081398, 2.120872, 0, 0, 0, 1, 1,
0.2444795, 0.3918397, 0.3282652, 0, 0, 0, 1, 1,
0.2452333, 0.3234047, 1.572077, 0, 0, 0, 1, 1,
0.246689, -1.67924, 3.373279, 0, 0, 0, 1, 1,
0.2467415, 1.593109, -1.734671, 0, 0, 0, 1, 1,
0.2506829, 0.6209942, 1.127459, 0, 0, 0, 1, 1,
0.2568255, 0.9936392, 2.917893, 1, 1, 1, 1, 1,
0.2605383, 1.657372, 1.233896, 1, 1, 1, 1, 1,
0.2616477, -1.720926, 3.68581, 1, 1, 1, 1, 1,
0.2635447, 1.45587, 0.1408659, 1, 1, 1, 1, 1,
0.2651286, -0.3893832, 2.779161, 1, 1, 1, 1, 1,
0.2723443, 1.193328, 1.075035, 1, 1, 1, 1, 1,
0.2751031, 0.8227245, 0.4011265, 1, 1, 1, 1, 1,
0.2756186, 0.3257642, 1.032424, 1, 1, 1, 1, 1,
0.2776258, 0.4630011, 0.504027, 1, 1, 1, 1, 1,
0.2784264, -0.2304283, 1.371618, 1, 1, 1, 1, 1,
0.2791376, 0.6458467, -0.06206721, 1, 1, 1, 1, 1,
0.2800908, -0.731895, 4.032035, 1, 1, 1, 1, 1,
0.280537, -0.2893043, 3.4336, 1, 1, 1, 1, 1,
0.2858988, 0.4071181, 0.8990709, 1, 1, 1, 1, 1,
0.2896713, -1.034705, 3.028139, 1, 1, 1, 1, 1,
0.2906282, 0.6956459, 1.811487, 0, 0, 1, 1, 1,
0.2916718, -0.2427569, 2.288639, 1, 0, 0, 1, 1,
0.2925373, 0.9779382, 1.941361, 1, 0, 0, 1, 1,
0.2977362, -0.7392651, 2.955428, 1, 0, 0, 1, 1,
0.3009531, 0.1563463, 0.985127, 1, 0, 0, 1, 1,
0.3098093, 1.41024, 1.050452, 1, 0, 0, 1, 1,
0.3099816, -1.508535, 3.34731, 0, 0, 0, 1, 1,
0.3145595, 0.2098828, 1.699327, 0, 0, 0, 1, 1,
0.3168703, -2.61324, 2.54889, 0, 0, 0, 1, 1,
0.3184184, -0.199149, 1.7555, 0, 0, 0, 1, 1,
0.3193758, -0.05645442, 2.317129, 0, 0, 0, 1, 1,
0.3235688, -0.3861247, 0.4488964, 0, 0, 0, 1, 1,
0.324018, 0.2567699, 2.212149, 0, 0, 0, 1, 1,
0.326983, 0.3234011, -0.3655179, 1, 1, 1, 1, 1,
0.3319386, 0.636382, -0.3764282, 1, 1, 1, 1, 1,
0.3335935, -0.6381222, 2.906963, 1, 1, 1, 1, 1,
0.3336784, -0.9481328, 2.618966, 1, 1, 1, 1, 1,
0.3340699, -1.492359, 3.003131, 1, 1, 1, 1, 1,
0.3343284, -0.8207375, 0.2975878, 1, 1, 1, 1, 1,
0.3345305, -0.3283784, 0.4379511, 1, 1, 1, 1, 1,
0.3404866, 1.101801, -0.4243711, 1, 1, 1, 1, 1,
0.342215, 0.3203978, 1.536397, 1, 1, 1, 1, 1,
0.3435037, 0.6952714, 1.802404, 1, 1, 1, 1, 1,
0.3436325, 1.230111, 0.3106371, 1, 1, 1, 1, 1,
0.3490855, -0.42717, 2.626015, 1, 1, 1, 1, 1,
0.3490967, 0.1489225, 1.353973, 1, 1, 1, 1, 1,
0.349204, -0.8603101, 2.150449, 1, 1, 1, 1, 1,
0.3497852, -0.1501197, 3.267289, 1, 1, 1, 1, 1,
0.3498706, -0.4018505, 3.422669, 0, 0, 1, 1, 1,
0.3527794, -0.7258252, 1.853859, 1, 0, 0, 1, 1,
0.355955, -0.5280365, 1.227783, 1, 0, 0, 1, 1,
0.3565916, -0.8227099, 2.467273, 1, 0, 0, 1, 1,
0.3569661, -0.6570773, 0.8334825, 1, 0, 0, 1, 1,
0.3588854, -0.1555257, 0.3618038, 1, 0, 0, 1, 1,
0.3626549, 0.08164002, 0.7101896, 0, 0, 0, 1, 1,
0.3670781, -0.317518, 1.777871, 0, 0, 0, 1, 1,
0.3694173, 0.1268292, 0.1188795, 0, 0, 0, 1, 1,
0.3694788, -0.3654985, 1.61806, 0, 0, 0, 1, 1,
0.3722582, 0.9727508, 0.5705247, 0, 0, 0, 1, 1,
0.3729183, 1.172035, 0.6433659, 0, 0, 0, 1, 1,
0.3775826, -0.1208776, 0.7638426, 0, 0, 0, 1, 1,
0.3784796, 0.3419118, 0.6052527, 1, 1, 1, 1, 1,
0.3789108, 0.5425748, 0.6458828, 1, 1, 1, 1, 1,
0.3803682, 1.02214, -0.007050852, 1, 1, 1, 1, 1,
0.3893875, -0.3118856, 0.5971112, 1, 1, 1, 1, 1,
0.3929301, 0.1641187, 2.942618, 1, 1, 1, 1, 1,
0.3981304, -0.3717088, 1.075388, 1, 1, 1, 1, 1,
0.3998782, 0.4456775, 1.524808, 1, 1, 1, 1, 1,
0.4051193, -0.201818, 2.655094, 1, 1, 1, 1, 1,
0.4062938, 0.5751132, 0.6822488, 1, 1, 1, 1, 1,
0.4091406, 0.5196849, 0.06193374, 1, 1, 1, 1, 1,
0.4100939, 1.56452, -0.7166298, 1, 1, 1, 1, 1,
0.4133899, 1.314426, 0.2432714, 1, 1, 1, 1, 1,
0.4143638, -2.273861, 2.430318, 1, 1, 1, 1, 1,
0.415228, -0.1417114, 2.711926, 1, 1, 1, 1, 1,
0.4220386, 1.330209, 0.7340865, 1, 1, 1, 1, 1,
0.4239297, -1.047944, 2.378722, 0, 0, 1, 1, 1,
0.4240502, 1.118018, -0.1972578, 1, 0, 0, 1, 1,
0.4252026, -1.343133, 1.664042, 1, 0, 0, 1, 1,
0.4283588, 0.5595677, -0.1324169, 1, 0, 0, 1, 1,
0.4304003, -0.2302366, 2.474983, 1, 0, 0, 1, 1,
0.4312644, -0.1001259, 1.489366, 1, 0, 0, 1, 1,
0.4347341, 1.150823, 0.5702418, 0, 0, 0, 1, 1,
0.4436319, 1.112544, 0.6792325, 0, 0, 0, 1, 1,
0.4454981, 0.9564054, -0.4216331, 0, 0, 0, 1, 1,
0.4466312, -0.9049208, 4.141917, 0, 0, 0, 1, 1,
0.4511599, 0.5651407, 1.134815, 0, 0, 0, 1, 1,
0.4532874, -1.075619, 2.268336, 0, 0, 0, 1, 1,
0.457217, -0.06113682, 1.004809, 0, 0, 0, 1, 1,
0.4595151, 0.6043105, 1.975625, 1, 1, 1, 1, 1,
0.4599994, -2.027613, 5.044718, 1, 1, 1, 1, 1,
0.4711342, -0.01174809, 0.8776661, 1, 1, 1, 1, 1,
0.4723155, 2.035002, 0.4064903, 1, 1, 1, 1, 1,
0.4814582, 0.5919796, 1.091944, 1, 1, 1, 1, 1,
0.4820985, -0.4571716, 2.876399, 1, 1, 1, 1, 1,
0.4828907, 0.584101, 0.482755, 1, 1, 1, 1, 1,
0.4857273, -1.867803, 3.384445, 1, 1, 1, 1, 1,
0.4950898, -0.6916613, 1.319954, 1, 1, 1, 1, 1,
0.4979022, -1.034929, 2.626226, 1, 1, 1, 1, 1,
0.5007741, -0.9684362, 5.092938, 1, 1, 1, 1, 1,
0.5012597, 0.3415288, -0.5354285, 1, 1, 1, 1, 1,
0.5034114, -0.08502305, 0.3424334, 1, 1, 1, 1, 1,
0.5061938, 0.9640687, 1.409942, 1, 1, 1, 1, 1,
0.5088308, -0.2768327, 1.734654, 1, 1, 1, 1, 1,
0.509718, 0.1531914, 0.08048986, 0, 0, 1, 1, 1,
0.5109958, -0.7688303, 2.295498, 1, 0, 0, 1, 1,
0.5135268, -1.672743, 1.7682, 1, 0, 0, 1, 1,
0.5150551, 1.911906, 1.265936, 1, 0, 0, 1, 1,
0.516221, -0.7073166, 1.30522, 1, 0, 0, 1, 1,
0.5275296, 0.3189894, 1.837443, 1, 0, 0, 1, 1,
0.5275626, 1.072863, 0.05984311, 0, 0, 0, 1, 1,
0.5283539, 0.1317582, 2.510597, 0, 0, 0, 1, 1,
0.5292658, -0.8434103, 2.562238, 0, 0, 0, 1, 1,
0.532962, -1.938738, 2.888045, 0, 0, 0, 1, 1,
0.5336884, 0.3954056, 1.132026, 0, 0, 0, 1, 1,
0.5343417, 0.4666072, 1.141902, 0, 0, 0, 1, 1,
0.537132, 0.1057813, -1.456094, 0, 0, 0, 1, 1,
0.5373905, 0.6508657, 1.847466, 1, 1, 1, 1, 1,
0.5425174, -0.05065902, 2.46577, 1, 1, 1, 1, 1,
0.5459532, 0.1453652, 1.479887, 1, 1, 1, 1, 1,
0.5459778, 0.4523008, 0.041276, 1, 1, 1, 1, 1,
0.5523239, -0.6595134, 2.355626, 1, 1, 1, 1, 1,
0.5526215, 1.27467, -0.09519384, 1, 1, 1, 1, 1,
0.5526658, 0.969341, 0.4976187, 1, 1, 1, 1, 1,
0.559507, 1.008225, 0.4947435, 1, 1, 1, 1, 1,
0.564005, -0.6799386, 1.531717, 1, 1, 1, 1, 1,
0.567222, 0.5787318, 2.064548, 1, 1, 1, 1, 1,
0.5789741, -0.4365524, 2.098904, 1, 1, 1, 1, 1,
0.5915674, 1.35862, -0.5141424, 1, 1, 1, 1, 1,
0.5921623, 0.5407422, 2.418312, 1, 1, 1, 1, 1,
0.5939746, -0.399543, 1.772879, 1, 1, 1, 1, 1,
0.5972065, -0.03774627, 1.91673, 1, 1, 1, 1, 1,
0.6007249, 0.4284157, 0.4506941, 0, 0, 1, 1, 1,
0.6056464, -0.4905785, 0.3309731, 1, 0, 0, 1, 1,
0.607305, -1.774094, 1.703443, 1, 0, 0, 1, 1,
0.612673, -0.7100051, 0.968304, 1, 0, 0, 1, 1,
0.6128883, 0.160523, 1.48762, 1, 0, 0, 1, 1,
0.6255181, 0.08574541, 1.857426, 1, 0, 0, 1, 1,
0.6273311, -0.7423599, 3.536158, 0, 0, 0, 1, 1,
0.6322244, 1.177262, 1.581015, 0, 0, 0, 1, 1,
0.6375045, -0.5667847, 2.132706, 0, 0, 0, 1, 1,
0.6410623, 2.034183, -0.7212234, 0, 0, 0, 1, 1,
0.6435317, 0.9966693, 0.730769, 0, 0, 0, 1, 1,
0.6451143, 0.2555507, 0.610482, 0, 0, 0, 1, 1,
0.6475454, 0.7830783, 1.107536, 0, 0, 0, 1, 1,
0.6478961, 1.391304, -0.1328685, 1, 1, 1, 1, 1,
0.6484908, -0.9326642, 3.953521, 1, 1, 1, 1, 1,
0.6543012, -1.613052, 3.05779, 1, 1, 1, 1, 1,
0.6586593, -0.5485989, 3.120523, 1, 1, 1, 1, 1,
0.6621427, 0.3494844, 1.341217, 1, 1, 1, 1, 1,
0.6628866, -1.325859, 3.325445, 1, 1, 1, 1, 1,
0.6641215, -1.692779, 2.27688, 1, 1, 1, 1, 1,
0.6658224, 0.6957344, 0.4802326, 1, 1, 1, 1, 1,
0.6659767, -0.5212263, 3.346699, 1, 1, 1, 1, 1,
0.67101, 1.291566, 0.02179495, 1, 1, 1, 1, 1,
0.6731097, -0.3538684, 1.874285, 1, 1, 1, 1, 1,
0.6765018, 1.092577, 1.444521, 1, 1, 1, 1, 1,
0.6777793, -2.306606, 2.027122, 1, 1, 1, 1, 1,
0.6778629, -1.461015, 2.926484, 1, 1, 1, 1, 1,
0.6789573, -0.083511, 2.496494, 1, 1, 1, 1, 1,
0.6825914, -0.9479582, 1.651959, 0, 0, 1, 1, 1,
0.6890898, 0.3346027, 0.8846406, 1, 0, 0, 1, 1,
0.6899883, -0.8396368, 0.432267, 1, 0, 0, 1, 1,
0.6900249, -0.6678854, 2.226314, 1, 0, 0, 1, 1,
0.6904246, 0.04841526, 1.853446, 1, 0, 0, 1, 1,
0.6946262, -1.718142, 3.016334, 1, 0, 0, 1, 1,
0.6987313, -1.102691, 2.836947, 0, 0, 0, 1, 1,
0.7052994, -0.8029473, 2.509517, 0, 0, 0, 1, 1,
0.707588, -0.0331501, 1.83, 0, 0, 0, 1, 1,
0.707889, -0.8307781, 1.752487, 0, 0, 0, 1, 1,
0.709857, -0.07203712, 1.686128, 0, 0, 0, 1, 1,
0.7131709, -0.4947573, 1.357894, 0, 0, 0, 1, 1,
0.7138072, 1.027145, 1.375193, 0, 0, 0, 1, 1,
0.716005, -0.2908453, 1.991051, 1, 1, 1, 1, 1,
0.7185757, -0.03806098, -0.1652879, 1, 1, 1, 1, 1,
0.7272294, -1.545692, 1.833471, 1, 1, 1, 1, 1,
0.7286577, 0.1294766, 2.123144, 1, 1, 1, 1, 1,
0.7320115, 0.1957401, 0.3702602, 1, 1, 1, 1, 1,
0.732182, -1.445766, 2.407763, 1, 1, 1, 1, 1,
0.7322204, -1.879142, 3.118335, 1, 1, 1, 1, 1,
0.7369109, -0.5028855, 3.808851, 1, 1, 1, 1, 1,
0.7481486, 0.9168652, 0.5431695, 1, 1, 1, 1, 1,
0.7522173, -0.8165517, 2.389814, 1, 1, 1, 1, 1,
0.7590066, -0.0944766, 1.168032, 1, 1, 1, 1, 1,
0.7605259, -0.2590971, 2.664179, 1, 1, 1, 1, 1,
0.7623258, 0.157527, 1.94066, 1, 1, 1, 1, 1,
0.7646455, -0.05480884, 1.33076, 1, 1, 1, 1, 1,
0.7655419, -1.217881, 3.300868, 1, 1, 1, 1, 1,
0.7662439, 0.992088, 1.028308, 0, 0, 1, 1, 1,
0.7672697, 1.180626, 0.3221035, 1, 0, 0, 1, 1,
0.7739542, -0.462692, 1.693489, 1, 0, 0, 1, 1,
0.7838416, -0.08087385, 2.082401, 1, 0, 0, 1, 1,
0.7883657, 0.5753229, 3.042463, 1, 0, 0, 1, 1,
0.7927134, -0.1086838, 0.9812298, 1, 0, 0, 1, 1,
0.7954164, -0.09088773, 2.059342, 0, 0, 0, 1, 1,
0.803764, -1.11919, 1.95214, 0, 0, 0, 1, 1,
0.8039153, -0.8581508, 1.945302, 0, 0, 0, 1, 1,
0.8108591, 0.9925861, -0.3054921, 0, 0, 0, 1, 1,
0.8174508, 0.4919354, 3.082853, 0, 0, 0, 1, 1,
0.8186522, 0.14955, 2.731238, 0, 0, 0, 1, 1,
0.820427, -0.61669, -0.04273983, 0, 0, 0, 1, 1,
0.8263104, 0.4476286, 1.289765, 1, 1, 1, 1, 1,
0.8307334, 1.098908, -0.4072211, 1, 1, 1, 1, 1,
0.831596, 0.7543508, -1.214993, 1, 1, 1, 1, 1,
0.8350792, -1.838184, 3.163904, 1, 1, 1, 1, 1,
0.8464227, 0.7983338, 1.620892, 1, 1, 1, 1, 1,
0.8467824, -1.672366, 2.143039, 1, 1, 1, 1, 1,
0.8472114, 1.830132, 0.8600804, 1, 1, 1, 1, 1,
0.8476865, -0.4270048, 3.65239, 1, 1, 1, 1, 1,
0.8506784, 0.9410923, 1.451679, 1, 1, 1, 1, 1,
0.8528686, -0.1709875, 2.774317, 1, 1, 1, 1, 1,
0.859986, 0.725825, 1.474612, 1, 1, 1, 1, 1,
0.8680334, -0.3155876, 1.7018, 1, 1, 1, 1, 1,
0.8680679, 0.0433845, 1.877469, 1, 1, 1, 1, 1,
0.8697973, -0.3076323, 3.190454, 1, 1, 1, 1, 1,
0.8795304, 0.7357125, -1.121655, 1, 1, 1, 1, 1,
0.8939604, 0.112589, 1.347899, 0, 0, 1, 1, 1,
0.8951797, -0.141827, 1.217691, 1, 0, 0, 1, 1,
0.8966861, 0.8698903, 1.269375, 1, 0, 0, 1, 1,
0.8973516, 0.385381, 0.2215996, 1, 0, 0, 1, 1,
0.8973734, 1.596401, 0.002102176, 1, 0, 0, 1, 1,
0.8979824, -0.4233023, 0.02375064, 1, 0, 0, 1, 1,
0.8984102, -1.002354, 1.860353, 0, 0, 0, 1, 1,
0.8990967, 1.208336, 0.2243951, 0, 0, 0, 1, 1,
0.9010266, 0.4294159, 0.7457495, 0, 0, 0, 1, 1,
0.901588, 0.7662148, 1.077781, 0, 0, 0, 1, 1,
0.9040374, -0.3605137, 2.68925, 0, 0, 0, 1, 1,
0.9042976, 0.8417142, 0.6383057, 0, 0, 0, 1, 1,
0.905338, 0.8460473, 0.577933, 0, 0, 0, 1, 1,
0.9082337, 1.341518, 0.2162202, 1, 1, 1, 1, 1,
0.9234743, 0.9410597, 1.457091, 1, 1, 1, 1, 1,
0.9299536, -0.8707794, 0.7934299, 1, 1, 1, 1, 1,
0.9313564, 0.9719529, -0.7255484, 1, 1, 1, 1, 1,
0.9328263, 0.7401008, 1.90363, 1, 1, 1, 1, 1,
0.9384384, -0.3126627, 2.794339, 1, 1, 1, 1, 1,
0.9405277, -0.6490141, 2.977916, 1, 1, 1, 1, 1,
0.9411525, 0.06676286, 2.210038, 1, 1, 1, 1, 1,
0.942153, 0.1712027, 2.269823, 1, 1, 1, 1, 1,
0.9472997, -0.1007343, 1.886351, 1, 1, 1, 1, 1,
0.948526, 0.426513, 1.944404, 1, 1, 1, 1, 1,
0.9516837, 0.1385879, 1.77574, 1, 1, 1, 1, 1,
0.9553468, -0.2933889, 1.395296, 1, 1, 1, 1, 1,
0.959161, -0.8131778, 3.416761, 1, 1, 1, 1, 1,
0.9621689, -0.02437329, 1.633878, 1, 1, 1, 1, 1,
0.9626979, -1.523605, 3.533981, 0, 0, 1, 1, 1,
0.9634109, -1.110063, 0.1281767, 1, 0, 0, 1, 1,
0.9657938, -1.557688, 3.724048, 1, 0, 0, 1, 1,
0.9669696, 1.947128, -0.8294243, 1, 0, 0, 1, 1,
0.9711628, 1.622603, -1.167875, 1, 0, 0, 1, 1,
0.973461, -0.1824232, 1.862155, 1, 0, 0, 1, 1,
0.9793097, -0.06713918, 2.355799, 0, 0, 0, 1, 1,
0.9815891, 0.1962741, 0.955403, 0, 0, 0, 1, 1,
0.9885635, -0.3865272, 2.89125, 0, 0, 0, 1, 1,
0.9897726, 1.433622, 0.4101872, 0, 0, 0, 1, 1,
0.9926459, -1.352735, 2.030685, 0, 0, 0, 1, 1,
0.9931651, -1.331318, 2.420469, 0, 0, 0, 1, 1,
0.9981818, 0.5467646, 0.2842686, 0, 0, 0, 1, 1,
0.9986633, -1.136189, 3.276187, 1, 1, 1, 1, 1,
0.999849, -1.765482, 4.268359, 1, 1, 1, 1, 1,
1.00685, 0.3271683, 1.432212, 1, 1, 1, 1, 1,
1.007141, 0.5126842, 1.674637, 1, 1, 1, 1, 1,
1.010156, -0.2480433, 1.665065, 1, 1, 1, 1, 1,
1.011661, 3.075648, 0.4306197, 1, 1, 1, 1, 1,
1.016168, 0.6332741, 1.70665, 1, 1, 1, 1, 1,
1.016456, 0.1030253, 1.129261, 1, 1, 1, 1, 1,
1.018139, 1.740013, 1.636258, 1, 1, 1, 1, 1,
1.020618, 0.9614387, -0.1751264, 1, 1, 1, 1, 1,
1.02202, 1.164904, 0.5625621, 1, 1, 1, 1, 1,
1.027001, -1.158337, 2.490685, 1, 1, 1, 1, 1,
1.030696, -0.3098395, 2.483607, 1, 1, 1, 1, 1,
1.032168, -0.6020123, 1.744073, 1, 1, 1, 1, 1,
1.056906, 0.3789701, 2.492944, 1, 1, 1, 1, 1,
1.05762, 0.5997338, 1.079661, 0, 0, 1, 1, 1,
1.058181, -0.08030373, 2.677691, 1, 0, 0, 1, 1,
1.061734, -1.546318, 1.327289, 1, 0, 0, 1, 1,
1.061782, 0.853624, 0.7364674, 1, 0, 0, 1, 1,
1.061939, 0.4922232, 0.6750657, 1, 0, 0, 1, 1,
1.067867, -1.791407, 3.046392, 1, 0, 0, 1, 1,
1.107344, -0.6492224, 2.7244, 0, 0, 0, 1, 1,
1.10783, 0.9844514, 1.350565, 0, 0, 0, 1, 1,
1.109733, -0.2629333, 2.874094, 0, 0, 0, 1, 1,
1.117009, 0.08902032, 2.126159, 0, 0, 0, 1, 1,
1.119508, -1.717223, 2.864929, 0, 0, 0, 1, 1,
1.125779, -0.3822212, 2.785604, 0, 0, 0, 1, 1,
1.133018, -1.097165, 1.069389, 0, 0, 0, 1, 1,
1.135121, -0.7850815, 2.087331, 1, 1, 1, 1, 1,
1.13916, -0.4488553, 2.295232, 1, 1, 1, 1, 1,
1.149857, -0.8305882, 2.813717, 1, 1, 1, 1, 1,
1.152996, 0.3591971, 0.6405665, 1, 1, 1, 1, 1,
1.154706, 0.3901692, -0.4555724, 1, 1, 1, 1, 1,
1.155357, -0.1364065, 2.492328, 1, 1, 1, 1, 1,
1.156642, 0.9404321, -0.7092583, 1, 1, 1, 1, 1,
1.160915, 0.5894189, 1.933506, 1, 1, 1, 1, 1,
1.174114, -0.7842224, 0.6767756, 1, 1, 1, 1, 1,
1.174646, -1.631251, 3.955041, 1, 1, 1, 1, 1,
1.182383, -0.7939812, 3.046398, 1, 1, 1, 1, 1,
1.183551, 0.6271638, 1.946274, 1, 1, 1, 1, 1,
1.186693, 0.5076904, 1.291599, 1, 1, 1, 1, 1,
1.196549, -1.675104, 1.717983, 1, 1, 1, 1, 1,
1.196731, -0.07622227, 1.510774, 1, 1, 1, 1, 1,
1.199157, 1.262936, 1.569934, 0, 0, 1, 1, 1,
1.20057, -1.194133, 1.879941, 1, 0, 0, 1, 1,
1.20329, 1.162409, -1.830266, 1, 0, 0, 1, 1,
1.216132, 0.5886983, 1.337133, 1, 0, 0, 1, 1,
1.216542, -0.9211092, 1.306901, 1, 0, 0, 1, 1,
1.221714, -1.699132, 2.014985, 1, 0, 0, 1, 1,
1.224954, 0.7257574, 0.7864181, 0, 0, 0, 1, 1,
1.226871, 0.4049, 1.780019, 0, 0, 0, 1, 1,
1.227037, -0.2717481, 0.7971451, 0, 0, 0, 1, 1,
1.227748, 0.2913149, 3.091789, 0, 0, 0, 1, 1,
1.229385, 0.1651588, 1.326322, 0, 0, 0, 1, 1,
1.233978, -0.4630171, 1.328058, 0, 0, 0, 1, 1,
1.234653, -0.9304644, 2.470287, 0, 0, 0, 1, 1,
1.240235, 1.040016, 1.511916, 1, 1, 1, 1, 1,
1.253257, 0.09899449, 3.333829, 1, 1, 1, 1, 1,
1.260954, 1.512592, 2.344204, 1, 1, 1, 1, 1,
1.265309, -0.4648203, 3.734398, 1, 1, 1, 1, 1,
1.278571, -0.4694246, 1.078485, 1, 1, 1, 1, 1,
1.296035, 0.9784623, 1.538019, 1, 1, 1, 1, 1,
1.303679, 1.886006, 1.368877, 1, 1, 1, 1, 1,
1.307299, 1.590389, 2.555616, 1, 1, 1, 1, 1,
1.309351, -0.4000499, 0.7664986, 1, 1, 1, 1, 1,
1.310137, -0.675442, 1.06262, 1, 1, 1, 1, 1,
1.310158, -1.471478, 1.937926, 1, 1, 1, 1, 1,
1.314288, -0.2876014, 0.5460652, 1, 1, 1, 1, 1,
1.333606, 0.06965031, 1.921613, 1, 1, 1, 1, 1,
1.342828, 0.123098, 1.305825, 1, 1, 1, 1, 1,
1.35492, 1.890434, 1.493547, 1, 1, 1, 1, 1,
1.358849, -1.17874, 2.321311, 0, 0, 1, 1, 1,
1.376737, 1.814742, 1.367836, 1, 0, 0, 1, 1,
1.38282, 0.3686313, 1.612909, 1, 0, 0, 1, 1,
1.384532, -0.8621628, 1.811301, 1, 0, 0, 1, 1,
1.385332, -0.04781459, 2.536971, 1, 0, 0, 1, 1,
1.389905, -0.4632204, 2.474856, 1, 0, 0, 1, 1,
1.394283, -0.6950397, 1.773613, 0, 0, 0, 1, 1,
1.406607, -0.07155307, 3.42229, 0, 0, 0, 1, 1,
1.411459, 0.005946384, -1.008141, 0, 0, 0, 1, 1,
1.416886, -0.4223053, 2.601422, 0, 0, 0, 1, 1,
1.417197, 1.169823, 1.080907, 0, 0, 0, 1, 1,
1.427627, 1.276641, -1.751001, 0, 0, 0, 1, 1,
1.442098, 1.282896, 0.6194788, 0, 0, 0, 1, 1,
1.468511, -0.1721536, 2.139557, 1, 1, 1, 1, 1,
1.484968, 1.169998, 0.8157808, 1, 1, 1, 1, 1,
1.492644, -1.719272, 1.909387, 1, 1, 1, 1, 1,
1.495312, -0.3981663, -2.441847, 1, 1, 1, 1, 1,
1.496322, 0.2640088, 1.578372, 1, 1, 1, 1, 1,
1.496557, 0.6645337, -0.7845269, 1, 1, 1, 1, 1,
1.497968, -0.8470337, 4.715262, 1, 1, 1, 1, 1,
1.499409, -0.9306391, 3.671461, 1, 1, 1, 1, 1,
1.520576, -0.8065816, 1.50826, 1, 1, 1, 1, 1,
1.533907, -0.8333586, 1.535158, 1, 1, 1, 1, 1,
1.538943, -0.8520446, 1.363016, 1, 1, 1, 1, 1,
1.540247, 0.07102337, 1.627703, 1, 1, 1, 1, 1,
1.543001, -0.497244, 0.5095053, 1, 1, 1, 1, 1,
1.546245, 0.8931, -0.1948467, 1, 1, 1, 1, 1,
1.547132, -0.09481122, 2.893053, 1, 1, 1, 1, 1,
1.565524, 1.929879, 0.4913044, 0, 0, 1, 1, 1,
1.567943, 0.7430115, -0.3933637, 1, 0, 0, 1, 1,
1.57027, 0.5065149, 0.7887365, 1, 0, 0, 1, 1,
1.586475, -0.3572677, 3.350456, 1, 0, 0, 1, 1,
1.588853, -0.01618381, 1.757287, 1, 0, 0, 1, 1,
1.602024, 0.6976265, -0.270193, 1, 0, 0, 1, 1,
1.613621, 1.197139, 1.339168, 0, 0, 0, 1, 1,
1.614766, 0.03051003, 1.679758, 0, 0, 0, 1, 1,
1.615685, -0.2353394, 0.1230121, 0, 0, 0, 1, 1,
1.61806, -1.467856, 1.787764, 0, 0, 0, 1, 1,
1.62174, -0.76987, 1.292133, 0, 0, 0, 1, 1,
1.626856, 1.882127, 0.1286032, 0, 0, 0, 1, 1,
1.62756, 0.7615652, 0.2790835, 0, 0, 0, 1, 1,
1.628363, -1.882753, 2.059094, 1, 1, 1, 1, 1,
1.638844, -0.5092051, 1.743487, 1, 1, 1, 1, 1,
1.642044, -0.678153, 2.274649, 1, 1, 1, 1, 1,
1.643567, -2.346677, 3.616935, 1, 1, 1, 1, 1,
1.656182, -0.06170664, 1.059656, 1, 1, 1, 1, 1,
1.667532, -0.8928065, 3.701682, 1, 1, 1, 1, 1,
1.679874, 0.5983902, 1.180433, 1, 1, 1, 1, 1,
1.697881, -1.158585, 2.109253, 1, 1, 1, 1, 1,
1.699825, 0.2041107, 1.159646, 1, 1, 1, 1, 1,
1.702067, 0.5647657, -0.1081476, 1, 1, 1, 1, 1,
1.717952, -0.9975255, 2.049693, 1, 1, 1, 1, 1,
1.728909, 0.3709695, 0.5394587, 1, 1, 1, 1, 1,
1.731311, -1.072289, 0.6433077, 1, 1, 1, 1, 1,
1.731541, -2.06521, 2.399832, 1, 1, 1, 1, 1,
1.733803, 0.9153886, 0.4865415, 1, 1, 1, 1, 1,
1.734543, 0.7444224, 1.883044, 0, 0, 1, 1, 1,
1.755966, 0.7129049, 1.285092, 1, 0, 0, 1, 1,
1.772749, 0.443994, 1.828639, 1, 0, 0, 1, 1,
1.7739, -0.7698852, 4.913455, 1, 0, 0, 1, 1,
1.775672, -1.472881, 1.656797, 1, 0, 0, 1, 1,
1.776591, -1.499105, 4.149486, 1, 0, 0, 1, 1,
1.792896, -1.24081, 1.540692, 0, 0, 0, 1, 1,
1.801221, -0.3275674, 1.542094, 0, 0, 0, 1, 1,
1.812361, -0.139676, 1.85574, 0, 0, 0, 1, 1,
1.815351, 0.2820671, 1.714465, 0, 0, 0, 1, 1,
1.822695, -1.379124, 2.621373, 0, 0, 0, 1, 1,
1.830335, -1.054014, 0.05109305, 0, 0, 0, 1, 1,
1.833589, 1.137781, 3.160649, 0, 0, 0, 1, 1,
1.855579, -0.01740833, 1.371825, 1, 1, 1, 1, 1,
1.858891, 0.6006835, 2.948691, 1, 1, 1, 1, 1,
1.87169, 0.360018, 0.4703335, 1, 1, 1, 1, 1,
1.886178, -0.1078566, 3.651421, 1, 1, 1, 1, 1,
1.887055, 0.752405, 0.8314504, 1, 1, 1, 1, 1,
1.916417, 0.81148, -0.5223952, 1, 1, 1, 1, 1,
1.920397, 0.3554235, 0.4297169, 1, 1, 1, 1, 1,
1.98492, 0.5147216, 2.069469, 1, 1, 1, 1, 1,
1.996925, -0.532882, 2.358121, 1, 1, 1, 1, 1,
2.004606, -2.458119, 2.107704, 1, 1, 1, 1, 1,
2.017387, -0.01542117, 3.663714, 1, 1, 1, 1, 1,
2.027622, -2.673965, 3.817485, 1, 1, 1, 1, 1,
2.074048, -0.08132874, 2.985764, 1, 1, 1, 1, 1,
2.085086, 0.1737158, 2.471264, 1, 1, 1, 1, 1,
2.128814, -0.1370681, 4.045076, 1, 1, 1, 1, 1,
2.131694, 0.9029442, 0.1029977, 0, 0, 1, 1, 1,
2.144498, 0.4400632, -0.5652936, 1, 0, 0, 1, 1,
2.146009, -1.144012, 1.845846, 1, 0, 0, 1, 1,
2.162886, 0.76805, 0.8824098, 1, 0, 0, 1, 1,
2.218752, -1.709674, 5.205053, 1, 0, 0, 1, 1,
2.226061, 0.7768276, 1.094501, 1, 0, 0, 1, 1,
2.304224, 1.134944, 0.9112189, 0, 0, 0, 1, 1,
2.352308, 0.4258468, 2.187421, 0, 0, 0, 1, 1,
2.379487, -0.439704, 3.160288, 0, 0, 0, 1, 1,
2.429326, -0.3450062, -0.1557658, 0, 0, 0, 1, 1,
2.475036, 0.4646864, 1.99044, 0, 0, 0, 1, 1,
2.495337, -1.118567, 1.077133, 0, 0, 0, 1, 1,
2.53582, -0.4989837, 2.935705, 0, 0, 0, 1, 1,
2.898011, -0.8748093, 1.371569, 1, 1, 1, 1, 1,
2.932096, 0.2749935, 2.180486, 1, 1, 1, 1, 1,
2.974142, -1.060382, 2.267063, 1, 1, 1, 1, 1,
2.99951, 0.6256176, 2.200464, 1, 1, 1, 1, 1,
3.125228, -1.187397, 1.588131, 1, 1, 1, 1, 1,
3.341266, 1.064759, 0.2736923, 1, 1, 1, 1, 1,
3.433664, 1.188995, 0.9825501, 1, 1, 1, 1, 1
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
var radius = 9.618435;
var distance = 33.78434;
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
mvMatrix.translate( -0.1176085, 0.1187806, -0.4068489 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.78434);
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
