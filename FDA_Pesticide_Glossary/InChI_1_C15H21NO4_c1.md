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
-3.166563, -1.243325, -1.975152, 1, 0, 0, 1,
-2.977979, 1.308549, 0.2936028, 1, 0.007843138, 0, 1,
-2.952123, 1.28029, -1.146605, 1, 0.01176471, 0, 1,
-2.852761, -0.3422574, -0.4902689, 1, 0.01960784, 0, 1,
-2.727259, -0.8960901, -1.333169, 1, 0.02352941, 0, 1,
-2.608473, 0.1551744, -2.502225, 1, 0.03137255, 0, 1,
-2.440877, -0.4460416, 0.04403616, 1, 0.03529412, 0, 1,
-2.312092, 0.1870328, -1.299863, 1, 0.04313726, 0, 1,
-2.287434, 1.181442, -0.6751063, 1, 0.04705882, 0, 1,
-2.285064, 1.881894, -0.236144, 1, 0.05490196, 0, 1,
-2.284873, 2.030771, -0.4221417, 1, 0.05882353, 0, 1,
-2.27068, 1.462701, -1.363168, 1, 0.06666667, 0, 1,
-2.26753, 0.8257257, -1.882941, 1, 0.07058824, 0, 1,
-2.261331, 0.2072858, -0.6183209, 1, 0.07843138, 0, 1,
-2.250992, 1.244807, -0.6353533, 1, 0.08235294, 0, 1,
-2.237479, 0.4322589, -0.2245479, 1, 0.09019608, 0, 1,
-2.223311, -0.09291985, -1.669169, 1, 0.09411765, 0, 1,
-2.170224, 0.6546401, -1.391592, 1, 0.1019608, 0, 1,
-2.127912, -0.1252187, -2.482333, 1, 0.1098039, 0, 1,
-2.126116, 0.6982001, -1.847991, 1, 0.1137255, 0, 1,
-2.125559, 1.847119, -1.152676, 1, 0.1215686, 0, 1,
-2.121535, 1.237201, 0.4753745, 1, 0.1254902, 0, 1,
-2.116732, -0.05886968, -2.237484, 1, 0.1333333, 0, 1,
-2.094979, 0.1114474, -2.869954, 1, 0.1372549, 0, 1,
-2.092159, 0.190097, -1.580327, 1, 0.145098, 0, 1,
-2.084715, 0.4035411, 0.4427238, 1, 0.1490196, 0, 1,
-2.080988, -0.06258418, -1.779283, 1, 0.1568628, 0, 1,
-2.067408, 2.458734, -0.3017867, 1, 0.1607843, 0, 1,
-2.039476, -1.061842, -4.628251, 1, 0.1686275, 0, 1,
-2.010091, -0.9463377, -1.284374, 1, 0.172549, 0, 1,
-1.972515, 0.2367621, -1.715094, 1, 0.1803922, 0, 1,
-1.934947, 0.3751395, -1.455328, 1, 0.1843137, 0, 1,
-1.934494, -0.6288528, -2.261808, 1, 0.1921569, 0, 1,
-1.917604, 0.4743771, -0.6870297, 1, 0.1960784, 0, 1,
-1.911867, -0.2608178, -0.9888552, 1, 0.2039216, 0, 1,
-1.907494, -1.028382, -2.25765, 1, 0.2117647, 0, 1,
-1.90252, 1.638542, 0.5399495, 1, 0.2156863, 0, 1,
-1.900382, -1.315134, -2.023276, 1, 0.2235294, 0, 1,
-1.888149, -0.9675273, -1.998891, 1, 0.227451, 0, 1,
-1.886215, -0.6096576, -1.883273, 1, 0.2352941, 0, 1,
-1.869232, 2.625709, -0.03555826, 1, 0.2392157, 0, 1,
-1.855166, -0.9851056, -2.166273, 1, 0.2470588, 0, 1,
-1.829712, 1.080679, -2.576862, 1, 0.2509804, 0, 1,
-1.829012, 0.6865984, -1.231044, 1, 0.2588235, 0, 1,
-1.825918, -0.9072974, -1.192269, 1, 0.2627451, 0, 1,
-1.817943, -1.4512, -1.987143, 1, 0.2705882, 0, 1,
-1.815097, -0.7263244, -2.877983, 1, 0.2745098, 0, 1,
-1.774998, -2.102665, -4.241663, 1, 0.282353, 0, 1,
-1.765102, 0.9284235, -1.106482, 1, 0.2862745, 0, 1,
-1.745871, -0.8612829, -2.199888, 1, 0.2941177, 0, 1,
-1.726189, -0.6384706, -0.9728851, 1, 0.3019608, 0, 1,
-1.724955, -0.8708224, -1.25845, 1, 0.3058824, 0, 1,
-1.715355, 1.813569, -2.258673, 1, 0.3137255, 0, 1,
-1.707089, 0.2673495, 0.4679656, 1, 0.3176471, 0, 1,
-1.702532, -0.2497797, -1.692159, 1, 0.3254902, 0, 1,
-1.702076, -0.2146681, -2.010592, 1, 0.3294118, 0, 1,
-1.699072, -0.1208622, -1.766935, 1, 0.3372549, 0, 1,
-1.687972, 0.025598, -1.464645, 1, 0.3411765, 0, 1,
-1.679805, 0.6510323, 0.09349271, 1, 0.3490196, 0, 1,
-1.67794, -0.6497464, -1.248266, 1, 0.3529412, 0, 1,
-1.658321, -0.9684014, -1.982106, 1, 0.3607843, 0, 1,
-1.654069, -0.136897, -0.09970614, 1, 0.3647059, 0, 1,
-1.651946, -0.8423432, -1.44099, 1, 0.372549, 0, 1,
-1.651911, -2.293136, -1.725179, 1, 0.3764706, 0, 1,
-1.643031, 2.039028, -0.639881, 1, 0.3843137, 0, 1,
-1.641837, 1.084423, -1.823019, 1, 0.3882353, 0, 1,
-1.611539, -1.484329, -3.257983, 1, 0.3960784, 0, 1,
-1.611245, 1.026227, -1.712885, 1, 0.4039216, 0, 1,
-1.60266, -0.5729857, -1.118453, 1, 0.4078431, 0, 1,
-1.592872, 0.2988249, -2.664532, 1, 0.4156863, 0, 1,
-1.584372, -0.4243957, -2.409347, 1, 0.4196078, 0, 1,
-1.581019, -1.491925, -2.858095, 1, 0.427451, 0, 1,
-1.580586, 1.15466, -0.04305314, 1, 0.4313726, 0, 1,
-1.572916, -0.6612748, -0.6738809, 1, 0.4392157, 0, 1,
-1.572829, 1.168887, -1.534019, 1, 0.4431373, 0, 1,
-1.567919, 0.6617413, -0.1383003, 1, 0.4509804, 0, 1,
-1.561217, 0.07744014, -0.1186433, 1, 0.454902, 0, 1,
-1.533444, 0.02518274, -0.5799662, 1, 0.4627451, 0, 1,
-1.527863, 1.392483, -0.4753311, 1, 0.4666667, 0, 1,
-1.521302, -0.4589241, -2.555667, 1, 0.4745098, 0, 1,
-1.505556, 1.15858, -0.3371503, 1, 0.4784314, 0, 1,
-1.474884, -0.7813326, -1.190419, 1, 0.4862745, 0, 1,
-1.446493, 0.7636852, -0.6211463, 1, 0.4901961, 0, 1,
-1.4136, 0.1887364, -1.106305, 1, 0.4980392, 0, 1,
-1.405856, -0.8824798, -2.656941, 1, 0.5058824, 0, 1,
-1.404638, -0.6445636, -3.639781, 1, 0.509804, 0, 1,
-1.402872, -0.9379019, -2.237502, 1, 0.5176471, 0, 1,
-1.39543, 1.215683, -0.9760881, 1, 0.5215687, 0, 1,
-1.391914, 0.4225976, -2.37113, 1, 0.5294118, 0, 1,
-1.38978, -2.158147, -1.950419, 1, 0.5333334, 0, 1,
-1.386378, 0.05643551, -0.8386561, 1, 0.5411765, 0, 1,
-1.382209, -0.03550638, -2.004478, 1, 0.5450981, 0, 1,
-1.379991, 0.4013794, -2.328248, 1, 0.5529412, 0, 1,
-1.36159, 0.19095, -1.899457, 1, 0.5568628, 0, 1,
-1.352956, -0.8372242, -2.362279, 1, 0.5647059, 0, 1,
-1.338534, -1.269289, -1.568114, 1, 0.5686275, 0, 1,
-1.334566, 0.4031381, -0.2391448, 1, 0.5764706, 0, 1,
-1.332083, 0.424492, -2.512912, 1, 0.5803922, 0, 1,
-1.330952, -0.2640404, -0.5901824, 1, 0.5882353, 0, 1,
-1.325962, -0.4685295, -0.8910134, 1, 0.5921569, 0, 1,
-1.292887, -0.6094861, -0.9859075, 1, 0.6, 0, 1,
-1.290309, 0.8596749, -1.747563, 1, 0.6078432, 0, 1,
-1.286761, 0.1925027, -0.1153388, 1, 0.6117647, 0, 1,
-1.277637, 1.283509, -0.5323268, 1, 0.6196079, 0, 1,
-1.274463, -1.032055, -1.265313, 1, 0.6235294, 0, 1,
-1.258067, -0.2828691, -1.627601, 1, 0.6313726, 0, 1,
-1.252373, 0.05110518, -1.575515, 1, 0.6352941, 0, 1,
-1.251745, 0.2721038, -1.323884, 1, 0.6431373, 0, 1,
-1.245924, 0.5167753, -1.481356, 1, 0.6470588, 0, 1,
-1.240627, -2.012512, -2.055208, 1, 0.654902, 0, 1,
-1.229401, 0.01504885, -1.98548, 1, 0.6588235, 0, 1,
-1.227257, -1.599453, -3.02704, 1, 0.6666667, 0, 1,
-1.219496, 2.04807, 0.1058802, 1, 0.6705883, 0, 1,
-1.218663, -0.6882825, -0.03238145, 1, 0.6784314, 0, 1,
-1.217836, -0.2953272, -0.9445225, 1, 0.682353, 0, 1,
-1.213754, -1.301371, -3.280819, 1, 0.6901961, 0, 1,
-1.210532, -2.27894, -2.451723, 1, 0.6941177, 0, 1,
-1.196873, -0.7616722, -2.94182, 1, 0.7019608, 0, 1,
-1.192713, -0.4814456, -1.559931, 1, 0.7098039, 0, 1,
-1.183836, 0.9856495, -1.124374, 1, 0.7137255, 0, 1,
-1.179232, 0.5743163, -1.927775, 1, 0.7215686, 0, 1,
-1.177647, 0.04525119, -0.8522203, 1, 0.7254902, 0, 1,
-1.176519, -0.2379868, -1.96823, 1, 0.7333333, 0, 1,
-1.167136, -0.09188147, -0.5755359, 1, 0.7372549, 0, 1,
-1.166034, -0.8974484, -2.022283, 1, 0.7450981, 0, 1,
-1.166016, -1.557121, -0.9123049, 1, 0.7490196, 0, 1,
-1.15141, -0.2935197, -2.645091, 1, 0.7568628, 0, 1,
-1.149036, 0.1839264, -1.936568, 1, 0.7607843, 0, 1,
-1.14179, 0.4560423, -0.4495214, 1, 0.7686275, 0, 1,
-1.140166, 0.4671483, -0.8572584, 1, 0.772549, 0, 1,
-1.120536, 0.4137761, -0.9540909, 1, 0.7803922, 0, 1,
-1.119106, 0.1240178, -2.097958, 1, 0.7843137, 0, 1,
-1.115804, 1.669178, -0.9293183, 1, 0.7921569, 0, 1,
-1.112708, 0.03560755, -0.3749102, 1, 0.7960784, 0, 1,
-1.109061, -0.1074421, -1.508351, 1, 0.8039216, 0, 1,
-1.108755, 0.2120073, -2.800665, 1, 0.8117647, 0, 1,
-1.10647, 0.1538242, 0.09178305, 1, 0.8156863, 0, 1,
-1.091863, 1.022226, -0.2073732, 1, 0.8235294, 0, 1,
-1.088235, 1.123529, -1.009765, 1, 0.827451, 0, 1,
-1.087412, -0.4616988, -2.899949, 1, 0.8352941, 0, 1,
-1.086936, 0.1363888, -2.929696, 1, 0.8392157, 0, 1,
-1.082109, 0.2939756, 0.2594465, 1, 0.8470588, 0, 1,
-1.076329, -1.663132, -2.294436, 1, 0.8509804, 0, 1,
-1.062655, 0.2766306, 0.01335569, 1, 0.8588235, 0, 1,
-1.059683, -1.125913, -3.24194, 1, 0.8627451, 0, 1,
-1.059487, -1.441303, -2.370747, 1, 0.8705882, 0, 1,
-1.05899, 0.211646, -0.9343159, 1, 0.8745098, 0, 1,
-1.054697, -0.1073593, -3.159088, 1, 0.8823529, 0, 1,
-1.050908, -0.9203299, -3.874645, 1, 0.8862745, 0, 1,
-1.050218, -0.9708269, -1.577634, 1, 0.8941177, 0, 1,
-1.043992, -1.148866, -2.863838, 1, 0.8980392, 0, 1,
-1.043065, 0.914023, -1.349463, 1, 0.9058824, 0, 1,
-1.039821, -1.228983, -3.180989, 1, 0.9137255, 0, 1,
-1.022306, -0.6604233, -2.029718, 1, 0.9176471, 0, 1,
-1.019752, 0.3071342, -0.9442715, 1, 0.9254902, 0, 1,
-1.01483, 1.505922, 0.1358254, 1, 0.9294118, 0, 1,
-1.004765, -0.04602816, -3.735255, 1, 0.9372549, 0, 1,
-1.004281, 0.612642, 0.436592, 1, 0.9411765, 0, 1,
-1.003205, 2.675434, 0.4081242, 1, 0.9490196, 0, 1,
-0.9961651, 0.4568966, -3.815733, 1, 0.9529412, 0, 1,
-0.9877302, -0.4046223, -1.500235, 1, 0.9607843, 0, 1,
-0.9817888, 0.2142284, -0.9840481, 1, 0.9647059, 0, 1,
-0.9815413, -0.8602091, -2.706433, 1, 0.972549, 0, 1,
-0.979419, 0.242303, -0.808058, 1, 0.9764706, 0, 1,
-0.9745566, 1.509337, -0.1825038, 1, 0.9843137, 0, 1,
-0.9700531, -0.9509695, -2.10006, 1, 0.9882353, 0, 1,
-0.9675256, -0.9346594, -1.508069, 1, 0.9960784, 0, 1,
-0.952449, -1.218103, -2.605286, 0.9960784, 1, 0, 1,
-0.9460385, 1.31652, -0.7584239, 0.9921569, 1, 0, 1,
-0.944682, 0.4961676, 0.05872793, 0.9843137, 1, 0, 1,
-0.938805, -0.005169744, -2.882984, 0.9803922, 1, 0, 1,
-0.9370196, 0.4449134, -0.9226319, 0.972549, 1, 0, 1,
-0.9333709, 0.04828921, -1.400505, 0.9686275, 1, 0, 1,
-0.9326915, 0.6876918, -0.164516, 0.9607843, 1, 0, 1,
-0.9276678, -0.7496859, -1.283567, 0.9568627, 1, 0, 1,
-0.9245378, 1.364243, -0.8747689, 0.9490196, 1, 0, 1,
-0.9207802, 0.5527284, -0.4101057, 0.945098, 1, 0, 1,
-0.9196538, -0.5535072, -1.555328, 0.9372549, 1, 0, 1,
-0.9149719, 0.3127463, -3.208811, 0.9333333, 1, 0, 1,
-0.9056697, 0.4460399, -3.029301, 0.9254902, 1, 0, 1,
-0.9017789, 0.8654586, -0.587025, 0.9215686, 1, 0, 1,
-0.8964703, -0.9918053, -4.545895, 0.9137255, 1, 0, 1,
-0.8796756, -0.5468104, -3.563469, 0.9098039, 1, 0, 1,
-0.8773528, -1.18529, -3.135393, 0.9019608, 1, 0, 1,
-0.8710808, -1.277717, -1.322586, 0.8941177, 1, 0, 1,
-0.863916, 1.47792, 1.264168, 0.8901961, 1, 0, 1,
-0.8599722, 0.5213641, 0.05108179, 0.8823529, 1, 0, 1,
-0.8580845, -2.376489, -2.36467, 0.8784314, 1, 0, 1,
-0.8440322, 0.4328122, -1.674008, 0.8705882, 1, 0, 1,
-0.8427023, -0.8700889, -2.575158, 0.8666667, 1, 0, 1,
-0.8423101, -0.8130961, -2.312545, 0.8588235, 1, 0, 1,
-0.838863, 0.5410234, 0.3102179, 0.854902, 1, 0, 1,
-0.8232865, 0.01930536, -1.915734, 0.8470588, 1, 0, 1,
-0.8165504, 0.9176779, 0.33348, 0.8431373, 1, 0, 1,
-0.8086662, -1.037022, -2.755728, 0.8352941, 1, 0, 1,
-0.806853, 0.8256964, -1.381965, 0.8313726, 1, 0, 1,
-0.8058981, -0.2093562, 0.3532251, 0.8235294, 1, 0, 1,
-0.7963811, 0.1578579, -2.663854, 0.8196079, 1, 0, 1,
-0.7868916, -0.359333, -2.78257, 0.8117647, 1, 0, 1,
-0.7860559, 0.43509, -0.847854, 0.8078431, 1, 0, 1,
-0.7835147, 1.314739, 1.288278, 0.8, 1, 0, 1,
-0.7813358, -0.5481338, -0.9760107, 0.7921569, 1, 0, 1,
-0.7792482, 0.5986688, 0.538416, 0.7882353, 1, 0, 1,
-0.7777855, -0.77786, -2.404708, 0.7803922, 1, 0, 1,
-0.7746789, 0.443015, -1.491485, 0.7764706, 1, 0, 1,
-0.77438, 0.4658763, 0.2823545, 0.7686275, 1, 0, 1,
-0.7698184, -0.001928416, -1.024352, 0.7647059, 1, 0, 1,
-0.7679715, 1.304963, -0.04915321, 0.7568628, 1, 0, 1,
-0.7637069, 0.4728812, -1.17091, 0.7529412, 1, 0, 1,
-0.7586088, -0.2049285, -2.510634, 0.7450981, 1, 0, 1,
-0.7584597, -0.6022792, -2.550144, 0.7411765, 1, 0, 1,
-0.7562847, 0.3503527, -3.291469, 0.7333333, 1, 0, 1,
-0.752781, -0.5531338, -1.652622, 0.7294118, 1, 0, 1,
-0.7511937, -0.2232678, -1.820113, 0.7215686, 1, 0, 1,
-0.7499628, -1.299215, -1.878759, 0.7176471, 1, 0, 1,
-0.7456763, -0.3714709, -1.157144, 0.7098039, 1, 0, 1,
-0.7454802, -0.9800374, -2.469309, 0.7058824, 1, 0, 1,
-0.7449238, 1.129417, -1.019099, 0.6980392, 1, 0, 1,
-0.7383517, -1.508805, -2.624929, 0.6901961, 1, 0, 1,
-0.737999, -0.8224909, -2.047429, 0.6862745, 1, 0, 1,
-0.7324547, -1.718191, -2.6344, 0.6784314, 1, 0, 1,
-0.7274662, -0.8684235, -2.481534, 0.6745098, 1, 0, 1,
-0.7162547, 1.223571, -1.119993, 0.6666667, 1, 0, 1,
-0.7161268, 0.6528972, -0.03862724, 0.6627451, 1, 0, 1,
-0.7154772, 1.152117, 0.1945696, 0.654902, 1, 0, 1,
-0.7143657, -0.1274199, -1.128626, 0.6509804, 1, 0, 1,
-0.7139794, 0.4379241, 0.4239984, 0.6431373, 1, 0, 1,
-0.7000132, 1.444891, -0.4997784, 0.6392157, 1, 0, 1,
-0.6901431, -0.8280139, -3.664011, 0.6313726, 1, 0, 1,
-0.6875854, 0.8340166, -0.9146681, 0.627451, 1, 0, 1,
-0.6863355, 0.8043931, -1.249436, 0.6196079, 1, 0, 1,
-0.684949, 0.9112495, -1.424926, 0.6156863, 1, 0, 1,
-0.6832668, -0.4907982, -0.7655902, 0.6078432, 1, 0, 1,
-0.6821542, 0.4246669, -1.367068, 0.6039216, 1, 0, 1,
-0.6812206, -1.407782, -2.41522, 0.5960785, 1, 0, 1,
-0.6795771, -1.811835, -2.61832, 0.5882353, 1, 0, 1,
-0.6778988, 1.017773, -0.3758493, 0.5843138, 1, 0, 1,
-0.6740956, 0.362316, -0.2627637, 0.5764706, 1, 0, 1,
-0.6713023, -1.658321, -2.755394, 0.572549, 1, 0, 1,
-0.6616493, -0.4757394, -3.281569, 0.5647059, 1, 0, 1,
-0.6590093, 0.1729019, -0.9765993, 0.5607843, 1, 0, 1,
-0.6583437, -0.7074547, -2.464067, 0.5529412, 1, 0, 1,
-0.658026, 0.6572722, 0.9947261, 0.5490196, 1, 0, 1,
-0.6512192, 0.831361, -2.12765, 0.5411765, 1, 0, 1,
-0.6496056, -0.4174956, -1.405007, 0.5372549, 1, 0, 1,
-0.6476494, 0.1275548, -0.6645586, 0.5294118, 1, 0, 1,
-0.6475517, -0.3514078, -4.217873, 0.5254902, 1, 0, 1,
-0.6366478, -0.3334821, -0.6786503, 0.5176471, 1, 0, 1,
-0.6345026, -1.126654, -3.805179, 0.5137255, 1, 0, 1,
-0.6334668, -0.7496979, -1.407147, 0.5058824, 1, 0, 1,
-0.6289963, -1.089893, -4.031951, 0.5019608, 1, 0, 1,
-0.6221105, -1.291992, -0.8446201, 0.4941176, 1, 0, 1,
-0.6219364, 0.1237933, -2.182613, 0.4862745, 1, 0, 1,
-0.6076673, -0.09144321, -2.507645, 0.4823529, 1, 0, 1,
-0.6055741, -2.24446, -1.973938, 0.4745098, 1, 0, 1,
-0.6037214, -1.500692, -2.150211, 0.4705882, 1, 0, 1,
-0.600684, 0.725648, -0.005440929, 0.4627451, 1, 0, 1,
-0.5987864, -0.272992, -0.9339311, 0.4588235, 1, 0, 1,
-0.5983251, -0.5481122, -1.930532, 0.4509804, 1, 0, 1,
-0.5902187, 0.4911406, -1.540749, 0.4470588, 1, 0, 1,
-0.5901671, -0.8215912, -0.5332435, 0.4392157, 1, 0, 1,
-0.5865298, 0.3015941, -1.100239, 0.4352941, 1, 0, 1,
-0.58132, -1.659371, -1.497708, 0.427451, 1, 0, 1,
-0.5742736, 0.6623619, -0.7347853, 0.4235294, 1, 0, 1,
-0.5713409, 0.5102916, -0.2837453, 0.4156863, 1, 0, 1,
-0.5707579, 1.608626, -0.3675447, 0.4117647, 1, 0, 1,
-0.5655728, -2.390638, -2.745947, 0.4039216, 1, 0, 1,
-0.5609664, -0.3876101, -2.322791, 0.3960784, 1, 0, 1,
-0.5529236, -0.7036516, -2.555727, 0.3921569, 1, 0, 1,
-0.5491613, 0.1490956, -1.214411, 0.3843137, 1, 0, 1,
-0.5464197, -0.8625646, -0.394519, 0.3803922, 1, 0, 1,
-0.5454857, -0.5993387, -3.641156, 0.372549, 1, 0, 1,
-0.5410706, 0.4181113, -0.6929871, 0.3686275, 1, 0, 1,
-0.538699, 0.6605543, -0.2603806, 0.3607843, 1, 0, 1,
-0.5365302, 0.05729783, -0.5048464, 0.3568628, 1, 0, 1,
-0.5335579, 0.3869791, -3.024868, 0.3490196, 1, 0, 1,
-0.5302145, 1.357774, -1.85025, 0.345098, 1, 0, 1,
-0.530135, 0.2377049, -1.623064, 0.3372549, 1, 0, 1,
-0.5267161, 0.005193696, -1.73436, 0.3333333, 1, 0, 1,
-0.5265148, -0.8367399, -0.8963267, 0.3254902, 1, 0, 1,
-0.5176729, -1.032062, -3.174837, 0.3215686, 1, 0, 1,
-0.517233, -0.6588328, -3.34598, 0.3137255, 1, 0, 1,
-0.5147072, -1.190648, -3.24195, 0.3098039, 1, 0, 1,
-0.5106624, 1.060569, -3.002326, 0.3019608, 1, 0, 1,
-0.5043392, 0.9709922, -0.2395993, 0.2941177, 1, 0, 1,
-0.5013863, -0.07589529, -1.854663, 0.2901961, 1, 0, 1,
-0.4971607, -1.653768, -3.536374, 0.282353, 1, 0, 1,
-0.4960314, 0.406438, 0.2282193, 0.2784314, 1, 0, 1,
-0.4952628, 0.3791652, -2.999206, 0.2705882, 1, 0, 1,
-0.492969, -0.7628734, -2.350154, 0.2666667, 1, 0, 1,
-0.4918156, 1.712259, 0.6441457, 0.2588235, 1, 0, 1,
-0.4917279, -0.6564972, -3.143349, 0.254902, 1, 0, 1,
-0.4845877, 0.3718171, -0.5664057, 0.2470588, 1, 0, 1,
-0.4801549, -0.246075, -2.023418, 0.2431373, 1, 0, 1,
-0.4776655, 0.5630072, -3.418388, 0.2352941, 1, 0, 1,
-0.4692892, -1.7249, -3.572928, 0.2313726, 1, 0, 1,
-0.469042, 0.8312084, -2.855555, 0.2235294, 1, 0, 1,
-0.4677186, -0.2092143, -1.913224, 0.2196078, 1, 0, 1,
-0.4654894, 0.2237727, -0.9515404, 0.2117647, 1, 0, 1,
-0.4638926, -0.6392108, -2.866721, 0.2078431, 1, 0, 1,
-0.463558, 0.295332, -0.5226623, 0.2, 1, 0, 1,
-0.4614059, -2.156109, -2.067815, 0.1921569, 1, 0, 1,
-0.4608385, 3.086775, 1.839197, 0.1882353, 1, 0, 1,
-0.4575752, -0.5894948, -2.168446, 0.1803922, 1, 0, 1,
-0.4526199, 0.6546382, -0.7925041, 0.1764706, 1, 0, 1,
-0.450827, -0.3176204, -2.824589, 0.1686275, 1, 0, 1,
-0.449923, -1.215427, -4.293435, 0.1647059, 1, 0, 1,
-0.4478802, -2.611247, -1.633973, 0.1568628, 1, 0, 1,
-0.4413166, -0.8247516, -2.438037, 0.1529412, 1, 0, 1,
-0.4394861, 1.664746, -0.7990856, 0.145098, 1, 0, 1,
-0.4385057, -0.06262606, -3.472499, 0.1411765, 1, 0, 1,
-0.4380223, 0.2977029, 0.1078402, 0.1333333, 1, 0, 1,
-0.4354793, -0.2357935, -2.340123, 0.1294118, 1, 0, 1,
-0.4337466, 1.473394, 0.1066918, 0.1215686, 1, 0, 1,
-0.4330197, -0.317012, -1.381141, 0.1176471, 1, 0, 1,
-0.4308581, 0.3254021, -0.3510526, 0.1098039, 1, 0, 1,
-0.4300854, 0.5075794, -2.337394, 0.1058824, 1, 0, 1,
-0.4293619, -0.2041362, -3.219732, 0.09803922, 1, 0, 1,
-0.4273261, 0.8272654, -2.734452, 0.09019608, 1, 0, 1,
-0.4257744, -2.064067, -5.875944, 0.08627451, 1, 0, 1,
-0.4253967, -1.393225, -2.508952, 0.07843138, 1, 0, 1,
-0.4239683, -0.9186431, -2.043319, 0.07450981, 1, 0, 1,
-0.4223244, -0.8243285, -2.206772, 0.06666667, 1, 0, 1,
-0.4218704, -1.714019, -1.71246, 0.0627451, 1, 0, 1,
-0.420776, 0.4572591, -2.303075, 0.05490196, 1, 0, 1,
-0.4168529, 1.255759, -0.5213578, 0.05098039, 1, 0, 1,
-0.4138845, -0.9194323, -0.8681754, 0.04313726, 1, 0, 1,
-0.4126425, -0.8369428, -3.154076, 0.03921569, 1, 0, 1,
-0.4094162, 0.5227624, -0.9359728, 0.03137255, 1, 0, 1,
-0.4054548, -0.3053225, -2.084115, 0.02745098, 1, 0, 1,
-0.3981822, -0.8591882, -3.172061, 0.01960784, 1, 0, 1,
-0.3980966, -0.02928416, -1.485519, 0.01568628, 1, 0, 1,
-0.3913224, 0.1821095, -1.632858, 0.007843138, 1, 0, 1,
-0.3907535, 0.5769297, -0.2784793, 0.003921569, 1, 0, 1,
-0.3863893, -0.3310719, -2.099962, 0, 1, 0.003921569, 1,
-0.3835624, 0.5466356, 0.7868106, 0, 1, 0.01176471, 1,
-0.3832439, 1.01429, 1.36218, 0, 1, 0.01568628, 1,
-0.3671989, 1.208556, 1.12832, 0, 1, 0.02352941, 1,
-0.3652954, -0.6329845, -2.832359, 0, 1, 0.02745098, 1,
-0.3598401, 0.2472486, -0.6323739, 0, 1, 0.03529412, 1,
-0.3595392, 1.700969, -1.161624, 0, 1, 0.03921569, 1,
-0.3588167, -0.3937357, -3.519399, 0, 1, 0.04705882, 1,
-0.3576677, -0.2858872, -2.873783, 0, 1, 0.05098039, 1,
-0.3574907, -0.5251774, -2.877237, 0, 1, 0.05882353, 1,
-0.3572267, 0.5039293, 0.2240725, 0, 1, 0.0627451, 1,
-0.3505167, -0.7560678, -1.078653, 0, 1, 0.07058824, 1,
-0.3503317, -1.28363, -2.891505, 0, 1, 0.07450981, 1,
-0.3499206, 0.3955379, -1.443762, 0, 1, 0.08235294, 1,
-0.3490022, 0.4823914, -0.4508588, 0, 1, 0.08627451, 1,
-0.348756, -0.7320278, -2.099509, 0, 1, 0.09411765, 1,
-0.3461006, 1.954156, -1.52628, 0, 1, 0.1019608, 1,
-0.3442295, -1.028573, -2.94307, 0, 1, 0.1058824, 1,
-0.3437018, 0.5499961, 0.4448392, 0, 1, 0.1137255, 1,
-0.3421429, -0.4864431, -3.814817, 0, 1, 0.1176471, 1,
-0.3416165, 0.3608614, -0.4279288, 0, 1, 0.1254902, 1,
-0.3398224, 1.100273, -0.2568291, 0, 1, 0.1294118, 1,
-0.3357273, -0.1296458, -1.69302, 0, 1, 0.1372549, 1,
-0.3348798, 0.2532477, -2.862458, 0, 1, 0.1411765, 1,
-0.3346901, 0.2341975, 0.08249103, 0, 1, 0.1490196, 1,
-0.3331932, -0.8624373, -0.3070459, 0, 1, 0.1529412, 1,
-0.3308091, -0.3629324, -2.90375, 0, 1, 0.1607843, 1,
-0.3289261, 0.3048654, 1.158821, 0, 1, 0.1647059, 1,
-0.3210303, -0.9821807, -2.280335, 0, 1, 0.172549, 1,
-0.3174468, -1.94451, -3.805167, 0, 1, 0.1764706, 1,
-0.3155121, -0.2599829, -2.641549, 0, 1, 0.1843137, 1,
-0.3123086, -1.133882, -2.906571, 0, 1, 0.1882353, 1,
-0.3121388, 1.021472, 1.957686, 0, 1, 0.1960784, 1,
-0.3049788, -0.7181342, -3.501217, 0, 1, 0.2039216, 1,
-0.3023274, -0.5742989, -1.5927, 0, 1, 0.2078431, 1,
-0.3003671, -1.858356, -1.97735, 0, 1, 0.2156863, 1,
-0.3001474, 1.277322, -0.2317552, 0, 1, 0.2196078, 1,
-0.2976229, 0.6439613, -1.861698, 0, 1, 0.227451, 1,
-0.2935625, 1.211995, -0.5938154, 0, 1, 0.2313726, 1,
-0.2912644, -0.1337294, -1.745417, 0, 1, 0.2392157, 1,
-0.2912048, -1.057503, -1.138184, 0, 1, 0.2431373, 1,
-0.2907681, -0.1259083, -2.703143, 0, 1, 0.2509804, 1,
-0.2895806, 0.1162464, -1.04387, 0, 1, 0.254902, 1,
-0.2891312, 1.626543, -0.9283577, 0, 1, 0.2627451, 1,
-0.2886144, 0.2342613, -1.731244, 0, 1, 0.2666667, 1,
-0.2879792, 0.7877357, -0.433503, 0, 1, 0.2745098, 1,
-0.2804333, 0.386203, -0.03435632, 0, 1, 0.2784314, 1,
-0.2777554, -0.8822243, -2.211828, 0, 1, 0.2862745, 1,
-0.2681333, -0.2193652, -0.8643751, 0, 1, 0.2901961, 1,
-0.2669716, 0.3202739, 0.1215662, 0, 1, 0.2980392, 1,
-0.2656304, 0.8806041, 0.7942085, 0, 1, 0.3058824, 1,
-0.2644493, -1.282374, -3.335641, 0, 1, 0.3098039, 1,
-0.2635755, 1.330188, 0.4290993, 0, 1, 0.3176471, 1,
-0.2620983, 0.6342162, -2.420587, 0, 1, 0.3215686, 1,
-0.2613604, 0.6714009, 1.159766, 0, 1, 0.3294118, 1,
-0.2609287, -0.1962022, -0.5248278, 0, 1, 0.3333333, 1,
-0.2604936, -0.4525172, -2.864036, 0, 1, 0.3411765, 1,
-0.2579958, 0.8439211, -1.565328, 0, 1, 0.345098, 1,
-0.2552384, -1.07264, -2.420825, 0, 1, 0.3529412, 1,
-0.2531692, -0.4956752, -3.606289, 0, 1, 0.3568628, 1,
-0.2461943, 1.250204, -1.055449, 0, 1, 0.3647059, 1,
-0.2461364, 1.068178, -1.590483, 0, 1, 0.3686275, 1,
-0.2459179, 1.299497, -0.957335, 0, 1, 0.3764706, 1,
-0.243448, -0.3193335, -1.539305, 0, 1, 0.3803922, 1,
-0.2426839, 0.1276628, -1.277241, 0, 1, 0.3882353, 1,
-0.2412264, -0.8691896, -2.172595, 0, 1, 0.3921569, 1,
-0.2355673, -2.271747, -2.720362, 0, 1, 0.4, 1,
-0.2289656, -1.223672, -2.616377, 0, 1, 0.4078431, 1,
-0.2269603, 0.08309456, -1.957788, 0, 1, 0.4117647, 1,
-0.2119483, 1.138912, -0.7209281, 0, 1, 0.4196078, 1,
-0.2118581, 0.8825741, 1.630033, 0, 1, 0.4235294, 1,
-0.2085309, 0.4369535, -1.801588, 0, 1, 0.4313726, 1,
-0.2070316, -0.4158468, 0.6000523, 0, 1, 0.4352941, 1,
-0.2069018, 0.04051253, -1.544047, 0, 1, 0.4431373, 1,
-0.206643, -0.5409735, -1.451682, 0, 1, 0.4470588, 1,
-0.2051247, -1.336357, -2.863497, 0, 1, 0.454902, 1,
-0.202437, -1.10785, -2.358749, 0, 1, 0.4588235, 1,
-0.202368, -1.944639, -2.827085, 0, 1, 0.4666667, 1,
-0.2018135, 0.8719155, -0.2267846, 0, 1, 0.4705882, 1,
-0.200093, -0.1142998, -2.77912, 0, 1, 0.4784314, 1,
-0.2000726, 0.06940683, -2.986983, 0, 1, 0.4823529, 1,
-0.197205, 0.9063293, 0.3503899, 0, 1, 0.4901961, 1,
-0.1955081, 1.621818, -0.4294066, 0, 1, 0.4941176, 1,
-0.1941646, 0.3023765, -1.269148, 0, 1, 0.5019608, 1,
-0.1827068, -0.5784324, -2.622688, 0, 1, 0.509804, 1,
-0.1818134, 0.3114119, -0.5721948, 0, 1, 0.5137255, 1,
-0.1813758, -0.6116614, -3.401229, 0, 1, 0.5215687, 1,
-0.1764637, -0.4883042, -3.551214, 0, 1, 0.5254902, 1,
-0.1763662, -0.428678, -3.571269, 0, 1, 0.5333334, 1,
-0.1714106, -0.0505281, -2.147065, 0, 1, 0.5372549, 1,
-0.1707557, 0.2833985, -0.8605178, 0, 1, 0.5450981, 1,
-0.1688607, -0.6313436, -1.92006, 0, 1, 0.5490196, 1,
-0.1675994, 0.2494065, -0.7896173, 0, 1, 0.5568628, 1,
-0.1667783, -1.335598, -3.667489, 0, 1, 0.5607843, 1,
-0.1614878, -0.406088, -4.096622, 0, 1, 0.5686275, 1,
-0.1611261, 0.6061127, -0.2477094, 0, 1, 0.572549, 1,
-0.1594628, 0.1080134, -1.704491, 0, 1, 0.5803922, 1,
-0.1592384, 0.04295669, -0.6746075, 0, 1, 0.5843138, 1,
-0.1581309, 0.7982044, -0.8822447, 0, 1, 0.5921569, 1,
-0.1546826, -0.04232512, -0.8483012, 0, 1, 0.5960785, 1,
-0.1527829, 0.1328522, -1.149756, 0, 1, 0.6039216, 1,
-0.1527476, 1.03662, 2.026293, 0, 1, 0.6117647, 1,
-0.1512853, 1.107994, -0.4264323, 0, 1, 0.6156863, 1,
-0.1504544, 1.171332, -0.1546386, 0, 1, 0.6235294, 1,
-0.1499769, -2.437243, -2.674328, 0, 1, 0.627451, 1,
-0.149781, -0.6218714, -1.922964, 0, 1, 0.6352941, 1,
-0.1468801, -0.7159158, -2.038236, 0, 1, 0.6392157, 1,
-0.1449511, 1.579807, 0.4016363, 0, 1, 0.6470588, 1,
-0.1414789, -2.171777, -3.023763, 0, 1, 0.6509804, 1,
-0.1404041, 0.703641, -1.202877, 0, 1, 0.6588235, 1,
-0.1341701, -0.1579443, -3.164911, 0, 1, 0.6627451, 1,
-0.1298923, -1.284525, -3.615487, 0, 1, 0.6705883, 1,
-0.1262633, 0.8446245, 0.08574075, 0, 1, 0.6745098, 1,
-0.124553, -1.562575, -2.510095, 0, 1, 0.682353, 1,
-0.1226181, -0.8230087, -1.722968, 0, 1, 0.6862745, 1,
-0.1217257, 0.1606591, -1.091633, 0, 1, 0.6941177, 1,
-0.1211554, 0.9016402, -2.035481, 0, 1, 0.7019608, 1,
-0.1160261, -0.546492, -2.464415, 0, 1, 0.7058824, 1,
-0.1100564, 1.529349, -0.04238167, 0, 1, 0.7137255, 1,
-0.1063869, -0.2307423, -2.466333, 0, 1, 0.7176471, 1,
-0.105813, -0.5912243, -2.730511, 0, 1, 0.7254902, 1,
-0.09523086, 0.48615, -0.4040464, 0, 1, 0.7294118, 1,
-0.08644121, 1.142748, -0.06794627, 0, 1, 0.7372549, 1,
-0.08643775, -0.9482497, -2.322577, 0, 1, 0.7411765, 1,
-0.08630969, -0.07351992, -1.924136, 0, 1, 0.7490196, 1,
-0.08200194, 1.211789, -0.7236139, 0, 1, 0.7529412, 1,
-0.07903423, -0.1249678, -3.224734, 0, 1, 0.7607843, 1,
-0.07676595, -0.2259951, -4.323109, 0, 1, 0.7647059, 1,
-0.07540058, 0.31785, 0.6548235, 0, 1, 0.772549, 1,
-0.07451542, 0.4081338, 0.2047159, 0, 1, 0.7764706, 1,
-0.07391851, -0.463275, -2.524873, 0, 1, 0.7843137, 1,
-0.07196169, -1.110211, -3.520384, 0, 1, 0.7882353, 1,
-0.06764748, -0.02557251, -1.149631, 0, 1, 0.7960784, 1,
-0.06736524, -0.6573662, -3.245924, 0, 1, 0.8039216, 1,
-0.06617029, -0.1692871, -2.95368, 0, 1, 0.8078431, 1,
-0.06573674, 0.7089501, -1.000396, 0, 1, 0.8156863, 1,
-0.0592213, -0.6889703, -2.138632, 0, 1, 0.8196079, 1,
-0.05773255, -0.2159629, -3.119385, 0, 1, 0.827451, 1,
-0.05693755, 1.988578, 0.03433636, 0, 1, 0.8313726, 1,
-0.05489189, 0.009215322, -3.038586, 0, 1, 0.8392157, 1,
-0.04973497, 0.5193523, -0.4323491, 0, 1, 0.8431373, 1,
-0.04929315, 0.7957042, 1.074265, 0, 1, 0.8509804, 1,
-0.04857195, 0.4178254, 0.5929856, 0, 1, 0.854902, 1,
-0.04748173, 0.8070649, 0.1413829, 0, 1, 0.8627451, 1,
-0.04535154, 1.137358, 0.5614033, 0, 1, 0.8666667, 1,
-0.04505482, -0.8706865, -2.086791, 0, 1, 0.8745098, 1,
-0.04283517, 1.066045, -1.124803, 0, 1, 0.8784314, 1,
-0.04072583, -0.937704, -2.902414, 0, 1, 0.8862745, 1,
-0.04048504, -0.8272666, -1.973748, 0, 1, 0.8901961, 1,
-0.03358106, 1.281738, 0.9809973, 0, 1, 0.8980392, 1,
-0.02950237, 0.9403735, 2.797846, 0, 1, 0.9058824, 1,
-0.02905535, 0.1339982, 0.7643142, 0, 1, 0.9098039, 1,
-0.02746912, 1.289533, -0.9798734, 0, 1, 0.9176471, 1,
-0.02602247, 0.2246149, 1.517756, 0, 1, 0.9215686, 1,
-0.02334985, -1.071656, -2.791527, 0, 1, 0.9294118, 1,
-0.02095565, 0.99173, -2.183134, 0, 1, 0.9333333, 1,
-0.01877496, 0.3535, 0.3617724, 0, 1, 0.9411765, 1,
-0.0128152, -0.1004549, -2.764505, 0, 1, 0.945098, 1,
0.002456486, 0.4810304, -0.1617719, 0, 1, 0.9529412, 1,
0.0041636, 1.763757, -1.661335, 0, 1, 0.9568627, 1,
0.004513596, 0.6738665, 0.1623205, 0, 1, 0.9647059, 1,
0.007978326, -0.8074223, 1.492806, 0, 1, 0.9686275, 1,
0.009170179, 0.4262399, -2.981418, 0, 1, 0.9764706, 1,
0.009803368, -0.2066509, 3.742668, 0, 1, 0.9803922, 1,
0.0114763, -0.134382, 4.014416, 0, 1, 0.9882353, 1,
0.01979672, -0.3348701, 1.821266, 0, 1, 0.9921569, 1,
0.0205228, 0.3059892, -0.4615471, 0, 1, 1, 1,
0.02728771, 0.7397808, 1.999029, 0, 0.9921569, 1, 1,
0.02851956, 0.3366261, 0.1562696, 0, 0.9882353, 1, 1,
0.03376356, -0.6527454, 1.44566, 0, 0.9803922, 1, 1,
0.0365827, 0.07656141, -1.093088, 0, 0.9764706, 1, 1,
0.03785208, -1.069951, 1.765439, 0, 0.9686275, 1, 1,
0.04122546, -0.3159274, 3.031534, 0, 0.9647059, 1, 1,
0.04543746, 1.908222, -0.5115821, 0, 0.9568627, 1, 1,
0.04896675, 0.7260686, 0.07785558, 0, 0.9529412, 1, 1,
0.05127238, 0.3096045, 0.4561355, 0, 0.945098, 1, 1,
0.05313487, 0.1808449, 0.6029015, 0, 0.9411765, 1, 1,
0.05766945, 0.5288547, -0.3188627, 0, 0.9333333, 1, 1,
0.05956437, 0.2611725, 0.8532993, 0, 0.9294118, 1, 1,
0.06011676, -0.9167573, 4.816184, 0, 0.9215686, 1, 1,
0.06109547, 0.1864923, -0.281267, 0, 0.9176471, 1, 1,
0.06250613, 0.06341478, 0.8067656, 0, 0.9098039, 1, 1,
0.06500316, 0.5691752, -1.257394, 0, 0.9058824, 1, 1,
0.06781766, 0.2960669, 1.362206, 0, 0.8980392, 1, 1,
0.07002697, 0.2295848, 2.320438, 0, 0.8901961, 1, 1,
0.07037857, 0.7103855, 1.266276, 0, 0.8862745, 1, 1,
0.0727949, 1.13006, 0.8039517, 0, 0.8784314, 1, 1,
0.07329492, 1.211136, 0.4805736, 0, 0.8745098, 1, 1,
0.07524947, 1.778823, 1.006998, 0, 0.8666667, 1, 1,
0.07712016, -0.5352381, 3.017771, 0, 0.8627451, 1, 1,
0.07829229, 0.06315397, 1.490243, 0, 0.854902, 1, 1,
0.08037629, -1.320462, 3.710716, 0, 0.8509804, 1, 1,
0.08584265, 0.793133, 0.4220279, 0, 0.8431373, 1, 1,
0.08726974, 0.1534846, -0.7904531, 0, 0.8392157, 1, 1,
0.08821051, 0.3061066, -0.1969218, 0, 0.8313726, 1, 1,
0.08978932, 1.723148, 0.3657598, 0, 0.827451, 1, 1,
0.09850105, -0.6044743, 2.39317, 0, 0.8196079, 1, 1,
0.09978294, -1.004689, 4.827764, 0, 0.8156863, 1, 1,
0.1045003, -1.010993, 4.496269, 0, 0.8078431, 1, 1,
0.1053381, -0.2229531, 4.002766, 0, 0.8039216, 1, 1,
0.1071906, 0.07123657, 0.5206855, 0, 0.7960784, 1, 1,
0.1073004, 1.282791, -0.899584, 0, 0.7882353, 1, 1,
0.1073974, 0.3712406, -0.6086767, 0, 0.7843137, 1, 1,
0.1074275, 1.460644, -0.217719, 0, 0.7764706, 1, 1,
0.1080334, 0.4060678, -1.149682, 0, 0.772549, 1, 1,
0.1100059, -0.4321786, 3.827966, 0, 0.7647059, 1, 1,
0.1141735, 0.1270964, 0.3133283, 0, 0.7607843, 1, 1,
0.114187, 1.06833, -1.779767, 0, 0.7529412, 1, 1,
0.1162737, 0.09165943, 0.8388969, 0, 0.7490196, 1, 1,
0.1175264, -0.06044572, 0.9697832, 0, 0.7411765, 1, 1,
0.117728, 0.4601597, 1.270267, 0, 0.7372549, 1, 1,
0.1188792, 0.6560928, 0.5516629, 0, 0.7294118, 1, 1,
0.1234369, 2.779464, 0.2147379, 0, 0.7254902, 1, 1,
0.1244231, 1.251907, 1.241493, 0, 0.7176471, 1, 1,
0.1252555, 1.476594, -0.1751618, 0, 0.7137255, 1, 1,
0.1267985, 0.5684842, -0.2981654, 0, 0.7058824, 1, 1,
0.1288522, -0.02143087, 1.053351, 0, 0.6980392, 1, 1,
0.1300691, 1.029414, -0.1135429, 0, 0.6941177, 1, 1,
0.1304479, 0.5402876, 0.2888165, 0, 0.6862745, 1, 1,
0.1364392, 1.382917, -1.393163, 0, 0.682353, 1, 1,
0.1385508, 0.02322474, 1.642801, 0, 0.6745098, 1, 1,
0.1386432, -0.3244899, 3.95621, 0, 0.6705883, 1, 1,
0.1392078, -0.930728, 4.06149, 0, 0.6627451, 1, 1,
0.1401634, -0.2094461, 4.381348, 0, 0.6588235, 1, 1,
0.1404288, 1.261702, -0.2789311, 0, 0.6509804, 1, 1,
0.1409675, -3.458578, 2.63538, 0, 0.6470588, 1, 1,
0.144851, 0.5848653, 1.453709, 0, 0.6392157, 1, 1,
0.1465087, -1.960505, 3.467939, 0, 0.6352941, 1, 1,
0.1469874, -1.684325, 4.437926, 0, 0.627451, 1, 1,
0.1504069, -1.705298, 2.142646, 0, 0.6235294, 1, 1,
0.1517212, 0.6909311, 0.2043819, 0, 0.6156863, 1, 1,
0.1593744, -0.5888546, 1.897642, 0, 0.6117647, 1, 1,
0.163081, 1.588306, 1.757092, 0, 0.6039216, 1, 1,
0.1698315, -0.3298904, 1.90068, 0, 0.5960785, 1, 1,
0.1718303, 0.5456814, 1.00888, 0, 0.5921569, 1, 1,
0.1725314, -0.5262578, 3.432184, 0, 0.5843138, 1, 1,
0.1740759, -0.1892629, 1.954623, 0, 0.5803922, 1, 1,
0.175215, 2.513054, 0.3051484, 0, 0.572549, 1, 1,
0.1760715, 0.3806829, 1.593272, 0, 0.5686275, 1, 1,
0.1787488, 1.30158, -0.3657826, 0, 0.5607843, 1, 1,
0.1793846, -0.2020302, 1.559611, 0, 0.5568628, 1, 1,
0.181645, -0.05956145, 2.022028, 0, 0.5490196, 1, 1,
0.1826011, -0.08212671, 1.294902, 0, 0.5450981, 1, 1,
0.1848556, -0.326025, 1.754869, 0, 0.5372549, 1, 1,
0.1886057, -1.892376, 3.151118, 0, 0.5333334, 1, 1,
0.1924458, -0.3576187, 2.00021, 0, 0.5254902, 1, 1,
0.1930568, 0.5527847, -0.08602551, 0, 0.5215687, 1, 1,
0.197125, 0.6923386, 0.05616732, 0, 0.5137255, 1, 1,
0.205171, 1.547953, 0.7964895, 0, 0.509804, 1, 1,
0.2101117, -1.098491, 4.551751, 0, 0.5019608, 1, 1,
0.2103597, -2.11161, 3.625298, 0, 0.4941176, 1, 1,
0.2132051, -0.4594825, 4.58209, 0, 0.4901961, 1, 1,
0.2135924, -1.877262, 2.715876, 0, 0.4823529, 1, 1,
0.2157305, 0.9032804, 1.699445, 0, 0.4784314, 1, 1,
0.2183671, 1.331556, 0.505885, 0, 0.4705882, 1, 1,
0.2230252, -0.01834173, -0.1656498, 0, 0.4666667, 1, 1,
0.2233263, 1.170067, -0.6981558, 0, 0.4588235, 1, 1,
0.2300609, -0.5763823, 1.577957, 0, 0.454902, 1, 1,
0.2336287, -0.1876377, 0.2079299, 0, 0.4470588, 1, 1,
0.2363941, -0.4519731, 1.181493, 0, 0.4431373, 1, 1,
0.2365016, -1.292403, 4.489297, 0, 0.4352941, 1, 1,
0.2367329, -0.2159313, 0.6017724, 0, 0.4313726, 1, 1,
0.2392103, 1.022272, -0.5122191, 0, 0.4235294, 1, 1,
0.2467698, 1.891498, 1.250256, 0, 0.4196078, 1, 1,
0.2504019, 0.09465781, 1.917938, 0, 0.4117647, 1, 1,
0.2513203, 0.45254, -0.00176024, 0, 0.4078431, 1, 1,
0.2601683, 1.472531, 0.3722854, 0, 0.4, 1, 1,
0.2625504, 0.8823506, 1.010411, 0, 0.3921569, 1, 1,
0.2718368, -1.54669, 3.763122, 0, 0.3882353, 1, 1,
0.2724121, -0.7168874, 3.918823, 0, 0.3803922, 1, 1,
0.2768564, 0.1776469, 1.131333, 0, 0.3764706, 1, 1,
0.2823318, -0.5672493, 2.694291, 0, 0.3686275, 1, 1,
0.2845101, -1.523075, 4.290203, 0, 0.3647059, 1, 1,
0.2867253, 0.6528018, 0.430364, 0, 0.3568628, 1, 1,
0.2871821, -0.2183575, 4.147949, 0, 0.3529412, 1, 1,
0.2887328, 1.015, 1.080313, 0, 0.345098, 1, 1,
0.2947825, -2.167741, 2.141186, 0, 0.3411765, 1, 1,
0.2974996, -0.08846902, -1.081488, 0, 0.3333333, 1, 1,
0.2985543, 0.5112963, 0.04668415, 0, 0.3294118, 1, 1,
0.3021494, 0.9554832, 3.18321, 0, 0.3215686, 1, 1,
0.3054874, 1.057024, -1.516962, 0, 0.3176471, 1, 1,
0.3107769, 0.2227756, -0.3368212, 0, 0.3098039, 1, 1,
0.311517, -2.138163, 1.453889, 0, 0.3058824, 1, 1,
0.3137358, -1.677107, 1.560852, 0, 0.2980392, 1, 1,
0.3148978, 0.2922136, 0.1318308, 0, 0.2901961, 1, 1,
0.3301306, 0.06513886, 1.304758, 0, 0.2862745, 1, 1,
0.3339179, 0.6133656, -0.1711497, 0, 0.2784314, 1, 1,
0.3345713, 1.527742, 1.418374, 0, 0.2745098, 1, 1,
0.3348803, -0.09937055, 2.445627, 0, 0.2666667, 1, 1,
0.3378052, 0.1351548, 1.14374, 0, 0.2627451, 1, 1,
0.338595, 1.487491, -2.275538, 0, 0.254902, 1, 1,
0.3392391, -0.09418552, 2.489339, 0, 0.2509804, 1, 1,
0.3422025, 0.3913933, -0.2808625, 0, 0.2431373, 1, 1,
0.3423837, 0.4908077, -0.3830101, 0, 0.2392157, 1, 1,
0.3448291, -0.3000085, 1.910804, 0, 0.2313726, 1, 1,
0.3457952, 0.01402772, 2.669919, 0, 0.227451, 1, 1,
0.3465167, -1.690458, 2.191668, 0, 0.2196078, 1, 1,
0.3480535, -1.560394, 3.776457, 0, 0.2156863, 1, 1,
0.3486638, 1.449701, 0.5206527, 0, 0.2078431, 1, 1,
0.350303, 0.9590743, 1.030834, 0, 0.2039216, 1, 1,
0.3547121, 0.9017234, 1.439032, 0, 0.1960784, 1, 1,
0.3566898, 0.6389446, 0.09732952, 0, 0.1882353, 1, 1,
0.3579495, -0.6427729, 1.365399, 0, 0.1843137, 1, 1,
0.3630108, -0.2330626, 0.9755993, 0, 0.1764706, 1, 1,
0.3652795, -0.4004299, 3.562602, 0, 0.172549, 1, 1,
0.3654693, -2.819271, 3.074439, 0, 0.1647059, 1, 1,
0.3678522, -0.1211037, 3.148364, 0, 0.1607843, 1, 1,
0.3789259, -0.7930275, 2.380387, 0, 0.1529412, 1, 1,
0.3805138, -0.3002259, 2.469531, 0, 0.1490196, 1, 1,
0.3816434, 0.3825006, -1.005911, 0, 0.1411765, 1, 1,
0.3851276, -1.661502, 2.912848, 0, 0.1372549, 1, 1,
0.390287, 0.3554604, -0.3662389, 0, 0.1294118, 1, 1,
0.3926553, -0.2281482, 0.5437568, 0, 0.1254902, 1, 1,
0.394391, -0.6208175, 0.9767386, 0, 0.1176471, 1, 1,
0.3949764, -0.6881571, 4.085698, 0, 0.1137255, 1, 1,
0.3980872, -0.6071439, 3.774738, 0, 0.1058824, 1, 1,
0.4093067, 1.577501, -0.08037863, 0, 0.09803922, 1, 1,
0.4117812, 0.2670189, 0.7132331, 0, 0.09411765, 1, 1,
0.4156579, 0.2107512, 0.2229035, 0, 0.08627451, 1, 1,
0.4159478, 0.283846, 1.044517, 0, 0.08235294, 1, 1,
0.4182469, -0.5456653, 1.915443, 0, 0.07450981, 1, 1,
0.4251982, -1.168231, 3.451972, 0, 0.07058824, 1, 1,
0.4292136, 0.7860692, 0.001037183, 0, 0.0627451, 1, 1,
0.43011, 1.889921, -0.7516194, 0, 0.05882353, 1, 1,
0.4322074, -1.788923, 4.325671, 0, 0.05098039, 1, 1,
0.4354365, -2.329504, 3.640578, 0, 0.04705882, 1, 1,
0.4380396, -0.1488141, 2.546985, 0, 0.03921569, 1, 1,
0.4431016, -0.2721726, 1.248771, 0, 0.03529412, 1, 1,
0.4459736, 0.3760913, -0.9639788, 0, 0.02745098, 1, 1,
0.4492576, 1.171014, 1.24542, 0, 0.02352941, 1, 1,
0.4541728, -0.6570087, 3.812969, 0, 0.01568628, 1, 1,
0.4593158, 0.5073015, -0.6608886, 0, 0.01176471, 1, 1,
0.4621511, 0.1292013, 1.711097, 0, 0.003921569, 1, 1,
0.4645607, 0.7456229, -0.2244528, 0.003921569, 0, 1, 1,
0.46601, 1.426212, 0.3576777, 0.007843138, 0, 1, 1,
0.4695348, 0.4572231, 0.8055735, 0.01568628, 0, 1, 1,
0.4699379, 0.6312537, -0.3801165, 0.01960784, 0, 1, 1,
0.4701774, 0.4037746, 1.748045, 0.02745098, 0, 1, 1,
0.4729675, 2.134847, 0.8844509, 0.03137255, 0, 1, 1,
0.475042, -0.8680504, 2.508054, 0.03921569, 0, 1, 1,
0.4753139, -0.1083655, 0.9748341, 0.04313726, 0, 1, 1,
0.4814283, -1.151971, 4.222408, 0.05098039, 0, 1, 1,
0.4875707, -1.260473, 2.257741, 0.05490196, 0, 1, 1,
0.49062, 0.737591, -0.910096, 0.0627451, 0, 1, 1,
0.4948172, -0.5822645, 2.904369, 0.06666667, 0, 1, 1,
0.4948606, 0.4362612, 1.696309, 0.07450981, 0, 1, 1,
0.5001725, 1.658805, 0.8222476, 0.07843138, 0, 1, 1,
0.5007329, -2.605172, 1.706334, 0.08627451, 0, 1, 1,
0.5010157, -0.7080622, 1.575189, 0.09019608, 0, 1, 1,
0.5057878, 0.7560418, 0.9067298, 0.09803922, 0, 1, 1,
0.5132929, 0.6951296, 0.9619941, 0.1058824, 0, 1, 1,
0.5189657, 0.3494514, 1.698605, 0.1098039, 0, 1, 1,
0.5193652, 0.957762, 2.327659, 0.1176471, 0, 1, 1,
0.5266809, 0.4660435, -0.2988983, 0.1215686, 0, 1, 1,
0.5376433, 0.07126378, 2.665633, 0.1294118, 0, 1, 1,
0.5394743, 0.5498987, -0.2506103, 0.1333333, 0, 1, 1,
0.5426036, 0.7404595, 1.159705, 0.1411765, 0, 1, 1,
0.5439791, 2.630535, 0.3186485, 0.145098, 0, 1, 1,
0.5487697, -0.9025139, 3.379565, 0.1529412, 0, 1, 1,
0.5497905, 0.6355531, 0.7502154, 0.1568628, 0, 1, 1,
0.5511506, -0.7330752, 2.551365, 0.1647059, 0, 1, 1,
0.5648228, 1.023355, 0.1010405, 0.1686275, 0, 1, 1,
0.5658667, -2.08262, 2.933249, 0.1764706, 0, 1, 1,
0.5663662, -0.7746061, 2.322914, 0.1803922, 0, 1, 1,
0.5707296, -0.402553, 1.353831, 0.1882353, 0, 1, 1,
0.571357, -0.1068581, 2.302689, 0.1921569, 0, 1, 1,
0.5743228, 0.03053285, -1.122966, 0.2, 0, 1, 1,
0.57639, -0.7064485, 3.228643, 0.2078431, 0, 1, 1,
0.5798287, 0.451454, -0.614816, 0.2117647, 0, 1, 1,
0.5811179, -0.4941652, 2.939387, 0.2196078, 0, 1, 1,
0.5882068, 0.734221, 0.7195122, 0.2235294, 0, 1, 1,
0.5911431, 0.0732317, 1.940469, 0.2313726, 0, 1, 1,
0.6062312, -0.6590537, 2.577929, 0.2352941, 0, 1, 1,
0.6138082, -0.836138, 3.409818, 0.2431373, 0, 1, 1,
0.6179277, -0.5959958, 3.649413, 0.2470588, 0, 1, 1,
0.6187737, -0.3154271, 2.104435, 0.254902, 0, 1, 1,
0.6210694, -0.6653203, 3.275446, 0.2588235, 0, 1, 1,
0.6222817, 1.008083, 0.8302338, 0.2666667, 0, 1, 1,
0.6224584, -1.962796, 4.563416, 0.2705882, 0, 1, 1,
0.6265354, 1.144644, 1.963478, 0.2784314, 0, 1, 1,
0.6288105, -0.9075355, 3.740527, 0.282353, 0, 1, 1,
0.6311413, -0.4110261, 2.778722, 0.2901961, 0, 1, 1,
0.63184, -1.245378, 2.915537, 0.2941177, 0, 1, 1,
0.6324855, 0.7913237, -0.559271, 0.3019608, 0, 1, 1,
0.6350983, 1.256772, 2.546177, 0.3098039, 0, 1, 1,
0.6375962, 0.9643474, -0.1576106, 0.3137255, 0, 1, 1,
0.6389201, -0.6755791, 2.547145, 0.3215686, 0, 1, 1,
0.6401154, 0.1480079, -0.174895, 0.3254902, 0, 1, 1,
0.6456109, -0.3344668, 2.014447, 0.3333333, 0, 1, 1,
0.6491544, 1.785882, -0.2146152, 0.3372549, 0, 1, 1,
0.6502402, 0.7728227, 1.553208, 0.345098, 0, 1, 1,
0.6576971, 0.925176, 0.3025718, 0.3490196, 0, 1, 1,
0.6600773, 0.5102674, 0.7908758, 0.3568628, 0, 1, 1,
0.6633378, 0.8356393, 0.1269081, 0.3607843, 0, 1, 1,
0.6661103, 0.2656833, 0.1282521, 0.3686275, 0, 1, 1,
0.6708577, -0.5272169, 2.297013, 0.372549, 0, 1, 1,
0.6711212, -1.0743, 1.488566, 0.3803922, 0, 1, 1,
0.6732466, -1.660807, 1.829252, 0.3843137, 0, 1, 1,
0.6866509, 1.718736, 1.18509, 0.3921569, 0, 1, 1,
0.687241, -0.4775485, 1.756168, 0.3960784, 0, 1, 1,
0.6909472, 0.3123015, 0.2494894, 0.4039216, 0, 1, 1,
0.6922021, 0.09750522, 1.259839, 0.4117647, 0, 1, 1,
0.6923702, -2.377903, 4.018611, 0.4156863, 0, 1, 1,
0.6931036, -1.055602, 1.730563, 0.4235294, 0, 1, 1,
0.6948484, -0.7888629, -0.21145, 0.427451, 0, 1, 1,
0.6951005, 0.5309391, 0.7023994, 0.4352941, 0, 1, 1,
0.6953882, -0.130164, 4.179864, 0.4392157, 0, 1, 1,
0.6994382, 0.257372, 2.158717, 0.4470588, 0, 1, 1,
0.7004532, -0.4344492, 1.74274, 0.4509804, 0, 1, 1,
0.7046909, 0.05608702, 1.724313, 0.4588235, 0, 1, 1,
0.7056466, -1.061218, 3.406786, 0.4627451, 0, 1, 1,
0.7112796, -0.1485029, 2.225374, 0.4705882, 0, 1, 1,
0.7115285, -1.148642, 1.988158, 0.4745098, 0, 1, 1,
0.7224301, 2.734939, 1.531586, 0.4823529, 0, 1, 1,
0.7245701, -0.4121458, 3.465541, 0.4862745, 0, 1, 1,
0.7255326, -0.6875444, 1.150248, 0.4941176, 0, 1, 1,
0.7259179, -0.6135393, 1.436271, 0.5019608, 0, 1, 1,
0.7270562, -1.344256, 1.908626, 0.5058824, 0, 1, 1,
0.7281957, -0.3364061, 2.619645, 0.5137255, 0, 1, 1,
0.7283518, -0.7731618, 1.315813, 0.5176471, 0, 1, 1,
0.7286668, 0.207384, 1.109674, 0.5254902, 0, 1, 1,
0.732222, -0.1875408, 0.8013352, 0.5294118, 0, 1, 1,
0.7324326, 2.148339, 0.7638447, 0.5372549, 0, 1, 1,
0.7382687, 0.1613064, -0.6321858, 0.5411765, 0, 1, 1,
0.7397251, 0.3158833, 1.590983, 0.5490196, 0, 1, 1,
0.7400967, -0.4587908, 0.9958562, 0.5529412, 0, 1, 1,
0.7439705, -0.3019679, 2.210749, 0.5607843, 0, 1, 1,
0.745026, -0.3973931, 1.907134, 0.5647059, 0, 1, 1,
0.7478324, 0.9288762, 0.1791296, 0.572549, 0, 1, 1,
0.7497321, 0.1984576, 0.8542259, 0.5764706, 0, 1, 1,
0.7540546, -0.8175677, 2.913026, 0.5843138, 0, 1, 1,
0.7568614, -0.7584193, 4.025599, 0.5882353, 0, 1, 1,
0.7574885, -0.6090507, 0.4130484, 0.5960785, 0, 1, 1,
0.7609827, 0.7835435, 1.403677, 0.6039216, 0, 1, 1,
0.7626911, -0.3055218, 1.44527, 0.6078432, 0, 1, 1,
0.7637282, 0.5041792, 0.9662251, 0.6156863, 0, 1, 1,
0.7712085, 0.2780833, 1.457686, 0.6196079, 0, 1, 1,
0.7725544, 1.967828, 0.6667549, 0.627451, 0, 1, 1,
0.7748873, 1.06066, 1.327519, 0.6313726, 0, 1, 1,
0.775872, -0.1996741, 1.888546, 0.6392157, 0, 1, 1,
0.7788855, 1.068313, 0.04369775, 0.6431373, 0, 1, 1,
0.7792487, -0.08417697, 0.08685856, 0.6509804, 0, 1, 1,
0.7892424, -0.3430424, 2.221813, 0.654902, 0, 1, 1,
0.7924075, -0.524422, 3.271404, 0.6627451, 0, 1, 1,
0.7976345, 0.5960776, -0.3939572, 0.6666667, 0, 1, 1,
0.8101634, 1.359107, -0.3688113, 0.6745098, 0, 1, 1,
0.8140643, -2.460485, 2.83515, 0.6784314, 0, 1, 1,
0.8158504, -0.3841383, 2.35146, 0.6862745, 0, 1, 1,
0.8203418, -0.5678345, 3.061854, 0.6901961, 0, 1, 1,
0.8240994, 1.291814, 1.349715, 0.6980392, 0, 1, 1,
0.8295292, -2.503006, 3.410998, 0.7058824, 0, 1, 1,
0.8320464, 0.4123714, 1.065688, 0.7098039, 0, 1, 1,
0.8332261, 0.002183099, 3.251436, 0.7176471, 0, 1, 1,
0.833716, -0.8978018, 1.379948, 0.7215686, 0, 1, 1,
0.8339442, -0.2778583, 3.58403, 0.7294118, 0, 1, 1,
0.8345079, 0.3758465, 1.763811, 0.7333333, 0, 1, 1,
0.8365896, -0.2242014, 2.892258, 0.7411765, 0, 1, 1,
0.8366488, 0.04067988, 1.173647, 0.7450981, 0, 1, 1,
0.8381003, 0.1867504, 1.924565, 0.7529412, 0, 1, 1,
0.8390948, -0.1880374, 1.913264, 0.7568628, 0, 1, 1,
0.8428962, -0.4804481, 2.553917, 0.7647059, 0, 1, 1,
0.8500172, 0.1646912, 2.365218, 0.7686275, 0, 1, 1,
0.8552259, -0.2738824, 2.029493, 0.7764706, 0, 1, 1,
0.8576666, -1.096923, -0.2245422, 0.7803922, 0, 1, 1,
0.8584366, 0.00483585, 0.8939947, 0.7882353, 0, 1, 1,
0.863065, 0.1546993, 2.295091, 0.7921569, 0, 1, 1,
0.8710456, -1.061851, 4.719461, 0.8, 0, 1, 1,
0.874384, 2.405439, -0.3605407, 0.8078431, 0, 1, 1,
0.8766298, 1.038383, 0.2133728, 0.8117647, 0, 1, 1,
0.8780836, 0.5882666, -0.4313852, 0.8196079, 0, 1, 1,
0.878372, 1.196842, -0.3473869, 0.8235294, 0, 1, 1,
0.8805683, 0.09584347, 3.105592, 0.8313726, 0, 1, 1,
0.880793, 1.455487, 2.224581, 0.8352941, 0, 1, 1,
0.8857363, -1.36022, 3.234613, 0.8431373, 0, 1, 1,
0.8907786, 0.2738226, 1.719143, 0.8470588, 0, 1, 1,
0.8918409, -1.519277, 2.048667, 0.854902, 0, 1, 1,
0.9068782, 1.01438, -0.3966843, 0.8588235, 0, 1, 1,
0.9071435, 2.509898, -0.3972583, 0.8666667, 0, 1, 1,
0.9078339, 1.297574, 0.4173223, 0.8705882, 0, 1, 1,
0.9090505, 0.7411323, 1.051462, 0.8784314, 0, 1, 1,
0.9125519, 1.179792, 1.052177, 0.8823529, 0, 1, 1,
0.9175355, 0.4544756, 1.464733, 0.8901961, 0, 1, 1,
0.9179011, -0.6117761, 1.757278, 0.8941177, 0, 1, 1,
0.9186034, 0.6533417, -0.8549547, 0.9019608, 0, 1, 1,
0.9217848, -0.5453097, 3.256991, 0.9098039, 0, 1, 1,
0.9223315, -0.4237815, 0.4901128, 0.9137255, 0, 1, 1,
0.9245431, -0.03161031, 0.6235091, 0.9215686, 0, 1, 1,
0.9255319, -0.5072287, 2.857548, 0.9254902, 0, 1, 1,
0.9268911, -0.8538231, 1.385178, 0.9333333, 0, 1, 1,
0.9270084, -0.9311037, 1.631893, 0.9372549, 0, 1, 1,
0.9289682, 0.5178065, 1.062219, 0.945098, 0, 1, 1,
0.937781, -1.223325, 2.061591, 0.9490196, 0, 1, 1,
0.9392467, 0.3133876, 1.729318, 0.9568627, 0, 1, 1,
0.9442902, 0.3909988, 0.5452908, 0.9607843, 0, 1, 1,
0.9475987, 0.6813134, 0.527207, 0.9686275, 0, 1, 1,
0.9585764, -0.8016009, 2.548173, 0.972549, 0, 1, 1,
0.9617359, 0.9956834, 0.5228114, 0.9803922, 0, 1, 1,
0.9667707, -0.7034383, 2.671089, 0.9843137, 0, 1, 1,
0.9839903, 1.371767, -1.321944, 0.9921569, 0, 1, 1,
0.9854136, -1.342548, 1.719195, 0.9960784, 0, 1, 1,
0.9885684, 1.603913, -0.2319662, 1, 0, 0.9960784, 1,
0.9919883, -0.5820477, 2.895017, 1, 0, 0.9882353, 1,
0.9934495, -1.116652, 2.270048, 1, 0, 0.9843137, 1,
0.9985076, 1.379669, 0.6782815, 1, 0, 0.9764706, 1,
0.9999015, -1.04141, 1.583622, 1, 0, 0.972549, 1,
1.002328, -0.2523886, 1.686631, 1, 0, 0.9647059, 1,
1.009145, 0.4322586, 0.5894899, 1, 0, 0.9607843, 1,
1.011608, -0.3292369, 1.578449, 1, 0, 0.9529412, 1,
1.012387, -1.151479, 2.855798, 1, 0, 0.9490196, 1,
1.017828, 0.5171091, 0.9110197, 1, 0, 0.9411765, 1,
1.017965, 1.834692, 1.96434, 1, 0, 0.9372549, 1,
1.019308, 0.3307828, 0.7306767, 1, 0, 0.9294118, 1,
1.02027, -1.360131, 2.734072, 1, 0, 0.9254902, 1,
1.034561, -1.06359, 3.346215, 1, 0, 0.9176471, 1,
1.034792, 1.113154, 0.569319, 1, 0, 0.9137255, 1,
1.035944, 1.837253, 0.9062731, 1, 0, 0.9058824, 1,
1.041458, 0.9663581, -0.5121407, 1, 0, 0.9019608, 1,
1.044036, 0.1840947, 1.499604, 1, 0, 0.8941177, 1,
1.05707, 0.4943316, 0.6466412, 1, 0, 0.8862745, 1,
1.062149, 0.348105, 1.139557, 1, 0, 0.8823529, 1,
1.075674, -0.4609425, 2.489246, 1, 0, 0.8745098, 1,
1.077772, -1.252496, 2.289538, 1, 0, 0.8705882, 1,
1.077896, 0.978942, 1.076983, 1, 0, 0.8627451, 1,
1.080228, 0.589928, 0.5299498, 1, 0, 0.8588235, 1,
1.092667, -0.7912482, 3.229929, 1, 0, 0.8509804, 1,
1.094926, 0.6010528, 1.727096, 1, 0, 0.8470588, 1,
1.096642, -1.084955, 2.940351, 1, 0, 0.8392157, 1,
1.101991, 0.2909956, 2.183181, 1, 0, 0.8352941, 1,
1.11183, 0.7092519, -0.855431, 1, 0, 0.827451, 1,
1.116644, -0.1767228, 2.473936, 1, 0, 0.8235294, 1,
1.133384, 0.1958605, -1.135942, 1, 0, 0.8156863, 1,
1.133715, 0.3228687, 0.9320617, 1, 0, 0.8117647, 1,
1.134233, 1.04806, 1.121639, 1, 0, 0.8039216, 1,
1.137515, 0.2246474, 0.6903167, 1, 0, 0.7960784, 1,
1.138146, -1.113102, 3.575424, 1, 0, 0.7921569, 1,
1.144037, -0.319194, -0.3974614, 1, 0, 0.7843137, 1,
1.144325, 0.7042952, -0.3808501, 1, 0, 0.7803922, 1,
1.144578, -0.6026776, 1.578605, 1, 0, 0.772549, 1,
1.14521, 1.263395, -0.2231073, 1, 0, 0.7686275, 1,
1.15408, -2.059961, 2.750527, 1, 0, 0.7607843, 1,
1.178416, -0.2358104, 0.5904074, 1, 0, 0.7568628, 1,
1.180216, 0.4214478, 1.313632, 1, 0, 0.7490196, 1,
1.185358, -0.770426, 3.125144, 1, 0, 0.7450981, 1,
1.188462, -0.3889428, 0.8359732, 1, 0, 0.7372549, 1,
1.189496, -0.6634476, 2.011397, 1, 0, 0.7333333, 1,
1.18953, -0.1215424, 3.672043, 1, 0, 0.7254902, 1,
1.207422, 1.711065, 0.1477868, 1, 0, 0.7215686, 1,
1.20816, 0.4063351, 0.9074489, 1, 0, 0.7137255, 1,
1.210754, 0.6701096, 1.44071, 1, 0, 0.7098039, 1,
1.213092, -0.07413978, 2.199347, 1, 0, 0.7019608, 1,
1.214992, -0.06862698, 1.68866, 1, 0, 0.6941177, 1,
1.225374, -0.413144, 1.965456, 1, 0, 0.6901961, 1,
1.235501, -0.9327666, 3.167151, 1, 0, 0.682353, 1,
1.244569, 0.6241601, 0.3425621, 1, 0, 0.6784314, 1,
1.245873, -0.5909652, 1.913231, 1, 0, 0.6705883, 1,
1.250787, 0.7720547, -0.4253285, 1, 0, 0.6666667, 1,
1.254164, 1.872838, -0.5691081, 1, 0, 0.6588235, 1,
1.260795, -0.5728196, 3.082146, 1, 0, 0.654902, 1,
1.261632, -1.615814, 2.623489, 1, 0, 0.6470588, 1,
1.26793, 0.6388318, 1.682171, 1, 0, 0.6431373, 1,
1.30615, 0.007375387, 2.38448, 1, 0, 0.6352941, 1,
1.311828, -0.6642025, 2.432602, 1, 0, 0.6313726, 1,
1.317102, -1.604915, 1.311357, 1, 0, 0.6235294, 1,
1.317704, -1.266771, 2.25004, 1, 0, 0.6196079, 1,
1.320808, -1.585006, 1.927222, 1, 0, 0.6117647, 1,
1.322692, 0.4607342, 1.164318, 1, 0, 0.6078432, 1,
1.322896, -1.208639, 0.7664849, 1, 0, 0.6, 1,
1.32671, -1.469912, 1.600751, 1, 0, 0.5921569, 1,
1.32833, -0.3566927, 1.464295, 1, 0, 0.5882353, 1,
1.330963, -1.473086, 3.564117, 1, 0, 0.5803922, 1,
1.338682, -0.2359752, 0.3082077, 1, 0, 0.5764706, 1,
1.350739, -0.6372718, 1.163574, 1, 0, 0.5686275, 1,
1.381158, 2.195033, 0.9963089, 1, 0, 0.5647059, 1,
1.397956, -0.7583135, 1.682485, 1, 0, 0.5568628, 1,
1.403507, -0.8400348, 1.466766, 1, 0, 0.5529412, 1,
1.404549, 0.3479176, 2.290819, 1, 0, 0.5450981, 1,
1.407303, 1.708573, 1.677535, 1, 0, 0.5411765, 1,
1.414452, -2.341255, 2.952482, 1, 0, 0.5333334, 1,
1.415078, -0.7619385, 1.437642, 1, 0, 0.5294118, 1,
1.41855, 0.3217365, 0.3221309, 1, 0, 0.5215687, 1,
1.422491, 0.5023236, 0.3158165, 1, 0, 0.5176471, 1,
1.424186, 1.074165, 0.3777986, 1, 0, 0.509804, 1,
1.45134, -0.7477342, 2.983634, 1, 0, 0.5058824, 1,
1.462856, -0.003801654, 1.722123, 1, 0, 0.4980392, 1,
1.463301, -0.9253175, 4.951865, 1, 0, 0.4901961, 1,
1.463452, 1.050791, 0.9316388, 1, 0, 0.4862745, 1,
1.468118, 0.6709521, 2.780443, 1, 0, 0.4784314, 1,
1.471877, -1.525257, 3.801159, 1, 0, 0.4745098, 1,
1.475506, -0.1974275, 0.9433236, 1, 0, 0.4666667, 1,
1.475538, -0.1814098, 1.238977, 1, 0, 0.4627451, 1,
1.487406, -0.6974914, 2.382601, 1, 0, 0.454902, 1,
1.488508, -0.9229149, 1.577617, 1, 0, 0.4509804, 1,
1.491715, -0.9501979, 2.963469, 1, 0, 0.4431373, 1,
1.492639, 1.088297, 0.7380545, 1, 0, 0.4392157, 1,
1.511946, -1.473223, 1.730281, 1, 0, 0.4313726, 1,
1.514596, -1.362563, 3.440537, 1, 0, 0.427451, 1,
1.51748, 0.02896461, 3.592741, 1, 0, 0.4196078, 1,
1.521286, -1.504455, 2.462201, 1, 0, 0.4156863, 1,
1.534889, -2.385392, 1.847823, 1, 0, 0.4078431, 1,
1.538656, 0.1427539, 2.03205, 1, 0, 0.4039216, 1,
1.539205, 0.3822878, 0.1062621, 1, 0, 0.3960784, 1,
1.545934, -0.9331781, 2.097816, 1, 0, 0.3882353, 1,
1.580943, 1.879072, 0.246331, 1, 0, 0.3843137, 1,
1.59915, 0.5168252, 1.267154, 1, 0, 0.3764706, 1,
1.601706, -0.236835, 2.908718, 1, 0, 0.372549, 1,
1.605959, 0.1573853, 1.885372, 1, 0, 0.3647059, 1,
1.625709, 0.4295219, -0.6298783, 1, 0, 0.3607843, 1,
1.634959, 1.383587, 0.7582651, 1, 0, 0.3529412, 1,
1.643948, 0.8212447, 1.350019, 1, 0, 0.3490196, 1,
1.650901, -1.826045, 3.52924, 1, 0, 0.3411765, 1,
1.65477, -0.4715434, 0.4096274, 1, 0, 0.3372549, 1,
1.665315, -0.8237099, 3.257482, 1, 0, 0.3294118, 1,
1.670052, 1.555359, -0.08517409, 1, 0, 0.3254902, 1,
1.675976, 1.063825, 1.591934, 1, 0, 0.3176471, 1,
1.686466, -0.915348, 2.029649, 1, 0, 0.3137255, 1,
1.70496, -0.581131, 3.190787, 1, 0, 0.3058824, 1,
1.711878, 1.536117, 0.3991787, 1, 0, 0.2980392, 1,
1.715666, 0.3830671, 1.073486, 1, 0, 0.2941177, 1,
1.73756, 0.7749771, 0.8622894, 1, 0, 0.2862745, 1,
1.748391, -0.8733636, 0.7567536, 1, 0, 0.282353, 1,
1.759638, 1.340177, 0.1539557, 1, 0, 0.2745098, 1,
1.776918, -0.2149795, 2.851015, 1, 0, 0.2705882, 1,
1.778159, 0.7774716, 0.5417697, 1, 0, 0.2627451, 1,
1.786078, 0.4933134, 1.955816, 1, 0, 0.2588235, 1,
1.799513, -0.8913776, 2.487495, 1, 0, 0.2509804, 1,
1.804242, 0.4774956, 1.595689, 1, 0, 0.2470588, 1,
1.805887, -2.724225, 3.814842, 1, 0, 0.2392157, 1,
1.808418, -0.7161868, 2.849599, 1, 0, 0.2352941, 1,
1.8117, -2.165389, 2.664195, 1, 0, 0.227451, 1,
1.815039, -0.3225435, 1.130368, 1, 0, 0.2235294, 1,
1.824908, -1.170213, 3.02128, 1, 0, 0.2156863, 1,
1.837063, 1.682715, 1.517207, 1, 0, 0.2117647, 1,
1.875532, 0.3155119, 1.160926, 1, 0, 0.2039216, 1,
1.878414, 1.253971, -0.7834692, 1, 0, 0.1960784, 1,
1.88281, 1.452096, 1.1519, 1, 0, 0.1921569, 1,
1.897964, 0.3211529, 0.4766803, 1, 0, 0.1843137, 1,
1.90173, 0.1136512, 1.373907, 1, 0, 0.1803922, 1,
1.928043, -0.006148677, 0.08130165, 1, 0, 0.172549, 1,
1.929758, -1.869925, 1.576306, 1, 0, 0.1686275, 1,
1.952491, 0.4261597, 1.5186, 1, 0, 0.1607843, 1,
1.995708, 0.01567454, 0.113378, 1, 0, 0.1568628, 1,
2.007248, -2.031598, 2.641138, 1, 0, 0.1490196, 1,
2.009454, 2.43212, 0.6286069, 1, 0, 0.145098, 1,
2.018694, -0.5698611, 0.6735256, 1, 0, 0.1372549, 1,
2.05098, -0.897046, 2.565548, 1, 0, 0.1333333, 1,
2.08934, 0.5221578, -0.3592476, 1, 0, 0.1254902, 1,
2.091784, -0.254442, 2.635347, 1, 0, 0.1215686, 1,
2.120416, -1.48277, 2.686625, 1, 0, 0.1137255, 1,
2.135074, 1.325255, 1.202394, 1, 0, 0.1098039, 1,
2.161816, 1.225246, 0.9695496, 1, 0, 0.1019608, 1,
2.167966, 0.5072673, 2.015678, 1, 0, 0.09411765, 1,
2.175854, 1.213127, -0.03890803, 1, 0, 0.09019608, 1,
2.200645, -0.1057179, 0.3909262, 1, 0, 0.08235294, 1,
2.213372, -1.150546, 3.453932, 1, 0, 0.07843138, 1,
2.215477, 0.5971287, 1.362785, 1, 0, 0.07058824, 1,
2.2281, 1.082167, 0.7487181, 1, 0, 0.06666667, 1,
2.275146, -0.04643881, 2.231562, 1, 0, 0.05882353, 1,
2.327192, 0.4641863, 3.26619, 1, 0, 0.05490196, 1,
2.408288, -0.6154987, 1.55396, 1, 0, 0.04705882, 1,
2.422981, -0.1359697, 2.124184, 1, 0, 0.04313726, 1,
2.505368, 0.6749686, 0.7794794, 1, 0, 0.03529412, 1,
2.656925, 0.1046863, 3.031579, 1, 0, 0.03137255, 1,
2.78931, 0.2692772, 1.527761, 1, 0, 0.02352941, 1,
2.957217, 0.4730837, 2.768049, 1, 0, 0.01960784, 1,
3.02943, -0.9309142, 2.250974, 1, 0, 0.01176471, 1,
3.181187, 2.166663, -1.097535, 1, 0, 0.007843138, 1
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
0.007312059, -4.568016, -7.711258, 0, -0.5, 0.5, 0.5,
0.007312059, -4.568016, -7.711258, 1, -0.5, 0.5, 0.5,
0.007312059, -4.568016, -7.711258, 1, 1.5, 0.5, 0.5,
0.007312059, -4.568016, -7.711258, 0, 1.5, 0.5, 0.5
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
-4.242507, -0.1859015, -7.711258, 0, -0.5, 0.5, 0.5,
-4.242507, -0.1859015, -7.711258, 1, -0.5, 0.5, 0.5,
-4.242507, -0.1859015, -7.711258, 1, 1.5, 0.5, 0.5,
-4.242507, -0.1859015, -7.711258, 0, 1.5, 0.5, 0.5
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
-4.242507, -4.568016, -0.4620397, 0, -0.5, 0.5, 0.5,
-4.242507, -4.568016, -0.4620397, 1, -0.5, 0.5, 0.5,
-4.242507, -4.568016, -0.4620397, 1, 1.5, 0.5, 0.5,
-4.242507, -4.568016, -0.4620397, 0, 1.5, 0.5, 0.5
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
-3, -3.556759, -6.038361,
3, -3.556759, -6.038361,
-3, -3.556759, -6.038361,
-3, -3.725302, -6.317177,
-2, -3.556759, -6.038361,
-2, -3.725302, -6.317177,
-1, -3.556759, -6.038361,
-1, -3.725302, -6.317177,
0, -3.556759, -6.038361,
0, -3.725302, -6.317177,
1, -3.556759, -6.038361,
1, -3.725302, -6.317177,
2, -3.556759, -6.038361,
2, -3.725302, -6.317177,
3, -3.556759, -6.038361,
3, -3.725302, -6.317177
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
-3, -4.062387, -6.87481, 0, -0.5, 0.5, 0.5,
-3, -4.062387, -6.87481, 1, -0.5, 0.5, 0.5,
-3, -4.062387, -6.87481, 1, 1.5, 0.5, 0.5,
-3, -4.062387, -6.87481, 0, 1.5, 0.5, 0.5,
-2, -4.062387, -6.87481, 0, -0.5, 0.5, 0.5,
-2, -4.062387, -6.87481, 1, -0.5, 0.5, 0.5,
-2, -4.062387, -6.87481, 1, 1.5, 0.5, 0.5,
-2, -4.062387, -6.87481, 0, 1.5, 0.5, 0.5,
-1, -4.062387, -6.87481, 0, -0.5, 0.5, 0.5,
-1, -4.062387, -6.87481, 1, -0.5, 0.5, 0.5,
-1, -4.062387, -6.87481, 1, 1.5, 0.5, 0.5,
-1, -4.062387, -6.87481, 0, 1.5, 0.5, 0.5,
0, -4.062387, -6.87481, 0, -0.5, 0.5, 0.5,
0, -4.062387, -6.87481, 1, -0.5, 0.5, 0.5,
0, -4.062387, -6.87481, 1, 1.5, 0.5, 0.5,
0, -4.062387, -6.87481, 0, 1.5, 0.5, 0.5,
1, -4.062387, -6.87481, 0, -0.5, 0.5, 0.5,
1, -4.062387, -6.87481, 1, -0.5, 0.5, 0.5,
1, -4.062387, -6.87481, 1, 1.5, 0.5, 0.5,
1, -4.062387, -6.87481, 0, 1.5, 0.5, 0.5,
2, -4.062387, -6.87481, 0, -0.5, 0.5, 0.5,
2, -4.062387, -6.87481, 1, -0.5, 0.5, 0.5,
2, -4.062387, -6.87481, 1, 1.5, 0.5, 0.5,
2, -4.062387, -6.87481, 0, 1.5, 0.5, 0.5,
3, -4.062387, -6.87481, 0, -0.5, 0.5, 0.5,
3, -4.062387, -6.87481, 1, -0.5, 0.5, 0.5,
3, -4.062387, -6.87481, 1, 1.5, 0.5, 0.5,
3, -4.062387, -6.87481, 0, 1.5, 0.5, 0.5
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
-3.261779, -3, -6.038361,
-3.261779, 3, -6.038361,
-3.261779, -3, -6.038361,
-3.425234, -3, -6.317177,
-3.261779, -2, -6.038361,
-3.425234, -2, -6.317177,
-3.261779, -1, -6.038361,
-3.425234, -1, -6.317177,
-3.261779, 0, -6.038361,
-3.425234, 0, -6.317177,
-3.261779, 1, -6.038361,
-3.425234, 1, -6.317177,
-3.261779, 2, -6.038361,
-3.425234, 2, -6.317177,
-3.261779, 3, -6.038361,
-3.425234, 3, -6.317177
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
-3.752143, -3, -6.87481, 0, -0.5, 0.5, 0.5,
-3.752143, -3, -6.87481, 1, -0.5, 0.5, 0.5,
-3.752143, -3, -6.87481, 1, 1.5, 0.5, 0.5,
-3.752143, -3, -6.87481, 0, 1.5, 0.5, 0.5,
-3.752143, -2, -6.87481, 0, -0.5, 0.5, 0.5,
-3.752143, -2, -6.87481, 1, -0.5, 0.5, 0.5,
-3.752143, -2, -6.87481, 1, 1.5, 0.5, 0.5,
-3.752143, -2, -6.87481, 0, 1.5, 0.5, 0.5,
-3.752143, -1, -6.87481, 0, -0.5, 0.5, 0.5,
-3.752143, -1, -6.87481, 1, -0.5, 0.5, 0.5,
-3.752143, -1, -6.87481, 1, 1.5, 0.5, 0.5,
-3.752143, -1, -6.87481, 0, 1.5, 0.5, 0.5,
-3.752143, 0, -6.87481, 0, -0.5, 0.5, 0.5,
-3.752143, 0, -6.87481, 1, -0.5, 0.5, 0.5,
-3.752143, 0, -6.87481, 1, 1.5, 0.5, 0.5,
-3.752143, 0, -6.87481, 0, 1.5, 0.5, 0.5,
-3.752143, 1, -6.87481, 0, -0.5, 0.5, 0.5,
-3.752143, 1, -6.87481, 1, -0.5, 0.5, 0.5,
-3.752143, 1, -6.87481, 1, 1.5, 0.5, 0.5,
-3.752143, 1, -6.87481, 0, 1.5, 0.5, 0.5,
-3.752143, 2, -6.87481, 0, -0.5, 0.5, 0.5,
-3.752143, 2, -6.87481, 1, -0.5, 0.5, 0.5,
-3.752143, 2, -6.87481, 1, 1.5, 0.5, 0.5,
-3.752143, 2, -6.87481, 0, 1.5, 0.5, 0.5,
-3.752143, 3, -6.87481, 0, -0.5, 0.5, 0.5,
-3.752143, 3, -6.87481, 1, -0.5, 0.5, 0.5,
-3.752143, 3, -6.87481, 1, 1.5, 0.5, 0.5,
-3.752143, 3, -6.87481, 0, 1.5, 0.5, 0.5
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
-3.261779, -3.556759, -4,
-3.261779, -3.556759, 4,
-3.261779, -3.556759, -4,
-3.425234, -3.725302, -4,
-3.261779, -3.556759, -2,
-3.425234, -3.725302, -2,
-3.261779, -3.556759, 0,
-3.425234, -3.725302, 0,
-3.261779, -3.556759, 2,
-3.425234, -3.725302, 2,
-3.261779, -3.556759, 4,
-3.425234, -3.725302, 4
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
-3.752143, -4.062387, -4, 0, -0.5, 0.5, 0.5,
-3.752143, -4.062387, -4, 1, -0.5, 0.5, 0.5,
-3.752143, -4.062387, -4, 1, 1.5, 0.5, 0.5,
-3.752143, -4.062387, -4, 0, 1.5, 0.5, 0.5,
-3.752143, -4.062387, -2, 0, -0.5, 0.5, 0.5,
-3.752143, -4.062387, -2, 1, -0.5, 0.5, 0.5,
-3.752143, -4.062387, -2, 1, 1.5, 0.5, 0.5,
-3.752143, -4.062387, -2, 0, 1.5, 0.5, 0.5,
-3.752143, -4.062387, 0, 0, -0.5, 0.5, 0.5,
-3.752143, -4.062387, 0, 1, -0.5, 0.5, 0.5,
-3.752143, -4.062387, 0, 1, 1.5, 0.5, 0.5,
-3.752143, -4.062387, 0, 0, 1.5, 0.5, 0.5,
-3.752143, -4.062387, 2, 0, -0.5, 0.5, 0.5,
-3.752143, -4.062387, 2, 1, -0.5, 0.5, 0.5,
-3.752143, -4.062387, 2, 1, 1.5, 0.5, 0.5,
-3.752143, -4.062387, 2, 0, 1.5, 0.5, 0.5,
-3.752143, -4.062387, 4, 0, -0.5, 0.5, 0.5,
-3.752143, -4.062387, 4, 1, -0.5, 0.5, 0.5,
-3.752143, -4.062387, 4, 1, 1.5, 0.5, 0.5,
-3.752143, -4.062387, 4, 0, 1.5, 0.5, 0.5
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
-3.261779, -3.556759, -6.038361,
-3.261779, 3.184956, -6.038361,
-3.261779, -3.556759, 5.114282,
-3.261779, 3.184956, 5.114282,
-3.261779, -3.556759, -6.038361,
-3.261779, -3.556759, 5.114282,
-3.261779, 3.184956, -6.038361,
-3.261779, 3.184956, 5.114282,
-3.261779, -3.556759, -6.038361,
3.276403, -3.556759, -6.038361,
-3.261779, -3.556759, 5.114282,
3.276403, -3.556759, 5.114282,
-3.261779, 3.184956, -6.038361,
3.276403, 3.184956, -6.038361,
-3.261779, 3.184956, 5.114282,
3.276403, 3.184956, 5.114282,
3.276403, -3.556759, -6.038361,
3.276403, 3.184956, -6.038361,
3.276403, -3.556759, 5.114282,
3.276403, 3.184956, 5.114282,
3.276403, -3.556759, -6.038361,
3.276403, -3.556759, 5.114282,
3.276403, 3.184956, -6.038361,
3.276403, 3.184956, 5.114282
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
var radius = 7.785502;
var distance = 34.63858;
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
mvMatrix.translate( -0.007312059, 0.1859015, 0.4620397 );
mvMatrix.scale( 1.287489, 1.24862, 0.7547841 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.63858);
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
InChI_1_C15H21NO4_c1<-read.table("InChI_1_C15H21NO4_c1.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1_C15H21NO4_c1$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1_C15H21NO4_c1' not found
```

```r
y<-InChI_1_C15H21NO4_c1$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1_C15H21NO4_c1' not found
```

```r
z<-InChI_1_C15H21NO4_c1$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1_C15H21NO4_c1' not found
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
-3.166563, -1.243325, -1.975152, 0, 0, 1, 1, 1,
-2.977979, 1.308549, 0.2936028, 1, 0, 0, 1, 1,
-2.952123, 1.28029, -1.146605, 1, 0, 0, 1, 1,
-2.852761, -0.3422574, -0.4902689, 1, 0, 0, 1, 1,
-2.727259, -0.8960901, -1.333169, 1, 0, 0, 1, 1,
-2.608473, 0.1551744, -2.502225, 1, 0, 0, 1, 1,
-2.440877, -0.4460416, 0.04403616, 0, 0, 0, 1, 1,
-2.312092, 0.1870328, -1.299863, 0, 0, 0, 1, 1,
-2.287434, 1.181442, -0.6751063, 0, 0, 0, 1, 1,
-2.285064, 1.881894, -0.236144, 0, 0, 0, 1, 1,
-2.284873, 2.030771, -0.4221417, 0, 0, 0, 1, 1,
-2.27068, 1.462701, -1.363168, 0, 0, 0, 1, 1,
-2.26753, 0.8257257, -1.882941, 0, 0, 0, 1, 1,
-2.261331, 0.2072858, -0.6183209, 1, 1, 1, 1, 1,
-2.250992, 1.244807, -0.6353533, 1, 1, 1, 1, 1,
-2.237479, 0.4322589, -0.2245479, 1, 1, 1, 1, 1,
-2.223311, -0.09291985, -1.669169, 1, 1, 1, 1, 1,
-2.170224, 0.6546401, -1.391592, 1, 1, 1, 1, 1,
-2.127912, -0.1252187, -2.482333, 1, 1, 1, 1, 1,
-2.126116, 0.6982001, -1.847991, 1, 1, 1, 1, 1,
-2.125559, 1.847119, -1.152676, 1, 1, 1, 1, 1,
-2.121535, 1.237201, 0.4753745, 1, 1, 1, 1, 1,
-2.116732, -0.05886968, -2.237484, 1, 1, 1, 1, 1,
-2.094979, 0.1114474, -2.869954, 1, 1, 1, 1, 1,
-2.092159, 0.190097, -1.580327, 1, 1, 1, 1, 1,
-2.084715, 0.4035411, 0.4427238, 1, 1, 1, 1, 1,
-2.080988, -0.06258418, -1.779283, 1, 1, 1, 1, 1,
-2.067408, 2.458734, -0.3017867, 1, 1, 1, 1, 1,
-2.039476, -1.061842, -4.628251, 0, 0, 1, 1, 1,
-2.010091, -0.9463377, -1.284374, 1, 0, 0, 1, 1,
-1.972515, 0.2367621, -1.715094, 1, 0, 0, 1, 1,
-1.934947, 0.3751395, -1.455328, 1, 0, 0, 1, 1,
-1.934494, -0.6288528, -2.261808, 1, 0, 0, 1, 1,
-1.917604, 0.4743771, -0.6870297, 1, 0, 0, 1, 1,
-1.911867, -0.2608178, -0.9888552, 0, 0, 0, 1, 1,
-1.907494, -1.028382, -2.25765, 0, 0, 0, 1, 1,
-1.90252, 1.638542, 0.5399495, 0, 0, 0, 1, 1,
-1.900382, -1.315134, -2.023276, 0, 0, 0, 1, 1,
-1.888149, -0.9675273, -1.998891, 0, 0, 0, 1, 1,
-1.886215, -0.6096576, -1.883273, 0, 0, 0, 1, 1,
-1.869232, 2.625709, -0.03555826, 0, 0, 0, 1, 1,
-1.855166, -0.9851056, -2.166273, 1, 1, 1, 1, 1,
-1.829712, 1.080679, -2.576862, 1, 1, 1, 1, 1,
-1.829012, 0.6865984, -1.231044, 1, 1, 1, 1, 1,
-1.825918, -0.9072974, -1.192269, 1, 1, 1, 1, 1,
-1.817943, -1.4512, -1.987143, 1, 1, 1, 1, 1,
-1.815097, -0.7263244, -2.877983, 1, 1, 1, 1, 1,
-1.774998, -2.102665, -4.241663, 1, 1, 1, 1, 1,
-1.765102, 0.9284235, -1.106482, 1, 1, 1, 1, 1,
-1.745871, -0.8612829, -2.199888, 1, 1, 1, 1, 1,
-1.726189, -0.6384706, -0.9728851, 1, 1, 1, 1, 1,
-1.724955, -0.8708224, -1.25845, 1, 1, 1, 1, 1,
-1.715355, 1.813569, -2.258673, 1, 1, 1, 1, 1,
-1.707089, 0.2673495, 0.4679656, 1, 1, 1, 1, 1,
-1.702532, -0.2497797, -1.692159, 1, 1, 1, 1, 1,
-1.702076, -0.2146681, -2.010592, 1, 1, 1, 1, 1,
-1.699072, -0.1208622, -1.766935, 0, 0, 1, 1, 1,
-1.687972, 0.025598, -1.464645, 1, 0, 0, 1, 1,
-1.679805, 0.6510323, 0.09349271, 1, 0, 0, 1, 1,
-1.67794, -0.6497464, -1.248266, 1, 0, 0, 1, 1,
-1.658321, -0.9684014, -1.982106, 1, 0, 0, 1, 1,
-1.654069, -0.136897, -0.09970614, 1, 0, 0, 1, 1,
-1.651946, -0.8423432, -1.44099, 0, 0, 0, 1, 1,
-1.651911, -2.293136, -1.725179, 0, 0, 0, 1, 1,
-1.643031, 2.039028, -0.639881, 0, 0, 0, 1, 1,
-1.641837, 1.084423, -1.823019, 0, 0, 0, 1, 1,
-1.611539, -1.484329, -3.257983, 0, 0, 0, 1, 1,
-1.611245, 1.026227, -1.712885, 0, 0, 0, 1, 1,
-1.60266, -0.5729857, -1.118453, 0, 0, 0, 1, 1,
-1.592872, 0.2988249, -2.664532, 1, 1, 1, 1, 1,
-1.584372, -0.4243957, -2.409347, 1, 1, 1, 1, 1,
-1.581019, -1.491925, -2.858095, 1, 1, 1, 1, 1,
-1.580586, 1.15466, -0.04305314, 1, 1, 1, 1, 1,
-1.572916, -0.6612748, -0.6738809, 1, 1, 1, 1, 1,
-1.572829, 1.168887, -1.534019, 1, 1, 1, 1, 1,
-1.567919, 0.6617413, -0.1383003, 1, 1, 1, 1, 1,
-1.561217, 0.07744014, -0.1186433, 1, 1, 1, 1, 1,
-1.533444, 0.02518274, -0.5799662, 1, 1, 1, 1, 1,
-1.527863, 1.392483, -0.4753311, 1, 1, 1, 1, 1,
-1.521302, -0.4589241, -2.555667, 1, 1, 1, 1, 1,
-1.505556, 1.15858, -0.3371503, 1, 1, 1, 1, 1,
-1.474884, -0.7813326, -1.190419, 1, 1, 1, 1, 1,
-1.446493, 0.7636852, -0.6211463, 1, 1, 1, 1, 1,
-1.4136, 0.1887364, -1.106305, 1, 1, 1, 1, 1,
-1.405856, -0.8824798, -2.656941, 0, 0, 1, 1, 1,
-1.404638, -0.6445636, -3.639781, 1, 0, 0, 1, 1,
-1.402872, -0.9379019, -2.237502, 1, 0, 0, 1, 1,
-1.39543, 1.215683, -0.9760881, 1, 0, 0, 1, 1,
-1.391914, 0.4225976, -2.37113, 1, 0, 0, 1, 1,
-1.38978, -2.158147, -1.950419, 1, 0, 0, 1, 1,
-1.386378, 0.05643551, -0.8386561, 0, 0, 0, 1, 1,
-1.382209, -0.03550638, -2.004478, 0, 0, 0, 1, 1,
-1.379991, 0.4013794, -2.328248, 0, 0, 0, 1, 1,
-1.36159, 0.19095, -1.899457, 0, 0, 0, 1, 1,
-1.352956, -0.8372242, -2.362279, 0, 0, 0, 1, 1,
-1.338534, -1.269289, -1.568114, 0, 0, 0, 1, 1,
-1.334566, 0.4031381, -0.2391448, 0, 0, 0, 1, 1,
-1.332083, 0.424492, -2.512912, 1, 1, 1, 1, 1,
-1.330952, -0.2640404, -0.5901824, 1, 1, 1, 1, 1,
-1.325962, -0.4685295, -0.8910134, 1, 1, 1, 1, 1,
-1.292887, -0.6094861, -0.9859075, 1, 1, 1, 1, 1,
-1.290309, 0.8596749, -1.747563, 1, 1, 1, 1, 1,
-1.286761, 0.1925027, -0.1153388, 1, 1, 1, 1, 1,
-1.277637, 1.283509, -0.5323268, 1, 1, 1, 1, 1,
-1.274463, -1.032055, -1.265313, 1, 1, 1, 1, 1,
-1.258067, -0.2828691, -1.627601, 1, 1, 1, 1, 1,
-1.252373, 0.05110518, -1.575515, 1, 1, 1, 1, 1,
-1.251745, 0.2721038, -1.323884, 1, 1, 1, 1, 1,
-1.245924, 0.5167753, -1.481356, 1, 1, 1, 1, 1,
-1.240627, -2.012512, -2.055208, 1, 1, 1, 1, 1,
-1.229401, 0.01504885, -1.98548, 1, 1, 1, 1, 1,
-1.227257, -1.599453, -3.02704, 1, 1, 1, 1, 1,
-1.219496, 2.04807, 0.1058802, 0, 0, 1, 1, 1,
-1.218663, -0.6882825, -0.03238145, 1, 0, 0, 1, 1,
-1.217836, -0.2953272, -0.9445225, 1, 0, 0, 1, 1,
-1.213754, -1.301371, -3.280819, 1, 0, 0, 1, 1,
-1.210532, -2.27894, -2.451723, 1, 0, 0, 1, 1,
-1.196873, -0.7616722, -2.94182, 1, 0, 0, 1, 1,
-1.192713, -0.4814456, -1.559931, 0, 0, 0, 1, 1,
-1.183836, 0.9856495, -1.124374, 0, 0, 0, 1, 1,
-1.179232, 0.5743163, -1.927775, 0, 0, 0, 1, 1,
-1.177647, 0.04525119, -0.8522203, 0, 0, 0, 1, 1,
-1.176519, -0.2379868, -1.96823, 0, 0, 0, 1, 1,
-1.167136, -0.09188147, -0.5755359, 0, 0, 0, 1, 1,
-1.166034, -0.8974484, -2.022283, 0, 0, 0, 1, 1,
-1.166016, -1.557121, -0.9123049, 1, 1, 1, 1, 1,
-1.15141, -0.2935197, -2.645091, 1, 1, 1, 1, 1,
-1.149036, 0.1839264, -1.936568, 1, 1, 1, 1, 1,
-1.14179, 0.4560423, -0.4495214, 1, 1, 1, 1, 1,
-1.140166, 0.4671483, -0.8572584, 1, 1, 1, 1, 1,
-1.120536, 0.4137761, -0.9540909, 1, 1, 1, 1, 1,
-1.119106, 0.1240178, -2.097958, 1, 1, 1, 1, 1,
-1.115804, 1.669178, -0.9293183, 1, 1, 1, 1, 1,
-1.112708, 0.03560755, -0.3749102, 1, 1, 1, 1, 1,
-1.109061, -0.1074421, -1.508351, 1, 1, 1, 1, 1,
-1.108755, 0.2120073, -2.800665, 1, 1, 1, 1, 1,
-1.10647, 0.1538242, 0.09178305, 1, 1, 1, 1, 1,
-1.091863, 1.022226, -0.2073732, 1, 1, 1, 1, 1,
-1.088235, 1.123529, -1.009765, 1, 1, 1, 1, 1,
-1.087412, -0.4616988, -2.899949, 1, 1, 1, 1, 1,
-1.086936, 0.1363888, -2.929696, 0, 0, 1, 1, 1,
-1.082109, 0.2939756, 0.2594465, 1, 0, 0, 1, 1,
-1.076329, -1.663132, -2.294436, 1, 0, 0, 1, 1,
-1.062655, 0.2766306, 0.01335569, 1, 0, 0, 1, 1,
-1.059683, -1.125913, -3.24194, 1, 0, 0, 1, 1,
-1.059487, -1.441303, -2.370747, 1, 0, 0, 1, 1,
-1.05899, 0.211646, -0.9343159, 0, 0, 0, 1, 1,
-1.054697, -0.1073593, -3.159088, 0, 0, 0, 1, 1,
-1.050908, -0.9203299, -3.874645, 0, 0, 0, 1, 1,
-1.050218, -0.9708269, -1.577634, 0, 0, 0, 1, 1,
-1.043992, -1.148866, -2.863838, 0, 0, 0, 1, 1,
-1.043065, 0.914023, -1.349463, 0, 0, 0, 1, 1,
-1.039821, -1.228983, -3.180989, 0, 0, 0, 1, 1,
-1.022306, -0.6604233, -2.029718, 1, 1, 1, 1, 1,
-1.019752, 0.3071342, -0.9442715, 1, 1, 1, 1, 1,
-1.01483, 1.505922, 0.1358254, 1, 1, 1, 1, 1,
-1.004765, -0.04602816, -3.735255, 1, 1, 1, 1, 1,
-1.004281, 0.612642, 0.436592, 1, 1, 1, 1, 1,
-1.003205, 2.675434, 0.4081242, 1, 1, 1, 1, 1,
-0.9961651, 0.4568966, -3.815733, 1, 1, 1, 1, 1,
-0.9877302, -0.4046223, -1.500235, 1, 1, 1, 1, 1,
-0.9817888, 0.2142284, -0.9840481, 1, 1, 1, 1, 1,
-0.9815413, -0.8602091, -2.706433, 1, 1, 1, 1, 1,
-0.979419, 0.242303, -0.808058, 1, 1, 1, 1, 1,
-0.9745566, 1.509337, -0.1825038, 1, 1, 1, 1, 1,
-0.9700531, -0.9509695, -2.10006, 1, 1, 1, 1, 1,
-0.9675256, -0.9346594, -1.508069, 1, 1, 1, 1, 1,
-0.952449, -1.218103, -2.605286, 1, 1, 1, 1, 1,
-0.9460385, 1.31652, -0.7584239, 0, 0, 1, 1, 1,
-0.944682, 0.4961676, 0.05872793, 1, 0, 0, 1, 1,
-0.938805, -0.005169744, -2.882984, 1, 0, 0, 1, 1,
-0.9370196, 0.4449134, -0.9226319, 1, 0, 0, 1, 1,
-0.9333709, 0.04828921, -1.400505, 1, 0, 0, 1, 1,
-0.9326915, 0.6876918, -0.164516, 1, 0, 0, 1, 1,
-0.9276678, -0.7496859, -1.283567, 0, 0, 0, 1, 1,
-0.9245378, 1.364243, -0.8747689, 0, 0, 0, 1, 1,
-0.9207802, 0.5527284, -0.4101057, 0, 0, 0, 1, 1,
-0.9196538, -0.5535072, -1.555328, 0, 0, 0, 1, 1,
-0.9149719, 0.3127463, -3.208811, 0, 0, 0, 1, 1,
-0.9056697, 0.4460399, -3.029301, 0, 0, 0, 1, 1,
-0.9017789, 0.8654586, -0.587025, 0, 0, 0, 1, 1,
-0.8964703, -0.9918053, -4.545895, 1, 1, 1, 1, 1,
-0.8796756, -0.5468104, -3.563469, 1, 1, 1, 1, 1,
-0.8773528, -1.18529, -3.135393, 1, 1, 1, 1, 1,
-0.8710808, -1.277717, -1.322586, 1, 1, 1, 1, 1,
-0.863916, 1.47792, 1.264168, 1, 1, 1, 1, 1,
-0.8599722, 0.5213641, 0.05108179, 1, 1, 1, 1, 1,
-0.8580845, -2.376489, -2.36467, 1, 1, 1, 1, 1,
-0.8440322, 0.4328122, -1.674008, 1, 1, 1, 1, 1,
-0.8427023, -0.8700889, -2.575158, 1, 1, 1, 1, 1,
-0.8423101, -0.8130961, -2.312545, 1, 1, 1, 1, 1,
-0.838863, 0.5410234, 0.3102179, 1, 1, 1, 1, 1,
-0.8232865, 0.01930536, -1.915734, 1, 1, 1, 1, 1,
-0.8165504, 0.9176779, 0.33348, 1, 1, 1, 1, 1,
-0.8086662, -1.037022, -2.755728, 1, 1, 1, 1, 1,
-0.806853, 0.8256964, -1.381965, 1, 1, 1, 1, 1,
-0.8058981, -0.2093562, 0.3532251, 0, 0, 1, 1, 1,
-0.7963811, 0.1578579, -2.663854, 1, 0, 0, 1, 1,
-0.7868916, -0.359333, -2.78257, 1, 0, 0, 1, 1,
-0.7860559, 0.43509, -0.847854, 1, 0, 0, 1, 1,
-0.7835147, 1.314739, 1.288278, 1, 0, 0, 1, 1,
-0.7813358, -0.5481338, -0.9760107, 1, 0, 0, 1, 1,
-0.7792482, 0.5986688, 0.538416, 0, 0, 0, 1, 1,
-0.7777855, -0.77786, -2.404708, 0, 0, 0, 1, 1,
-0.7746789, 0.443015, -1.491485, 0, 0, 0, 1, 1,
-0.77438, 0.4658763, 0.2823545, 0, 0, 0, 1, 1,
-0.7698184, -0.001928416, -1.024352, 0, 0, 0, 1, 1,
-0.7679715, 1.304963, -0.04915321, 0, 0, 0, 1, 1,
-0.7637069, 0.4728812, -1.17091, 0, 0, 0, 1, 1,
-0.7586088, -0.2049285, -2.510634, 1, 1, 1, 1, 1,
-0.7584597, -0.6022792, -2.550144, 1, 1, 1, 1, 1,
-0.7562847, 0.3503527, -3.291469, 1, 1, 1, 1, 1,
-0.752781, -0.5531338, -1.652622, 1, 1, 1, 1, 1,
-0.7511937, -0.2232678, -1.820113, 1, 1, 1, 1, 1,
-0.7499628, -1.299215, -1.878759, 1, 1, 1, 1, 1,
-0.7456763, -0.3714709, -1.157144, 1, 1, 1, 1, 1,
-0.7454802, -0.9800374, -2.469309, 1, 1, 1, 1, 1,
-0.7449238, 1.129417, -1.019099, 1, 1, 1, 1, 1,
-0.7383517, -1.508805, -2.624929, 1, 1, 1, 1, 1,
-0.737999, -0.8224909, -2.047429, 1, 1, 1, 1, 1,
-0.7324547, -1.718191, -2.6344, 1, 1, 1, 1, 1,
-0.7274662, -0.8684235, -2.481534, 1, 1, 1, 1, 1,
-0.7162547, 1.223571, -1.119993, 1, 1, 1, 1, 1,
-0.7161268, 0.6528972, -0.03862724, 1, 1, 1, 1, 1,
-0.7154772, 1.152117, 0.1945696, 0, 0, 1, 1, 1,
-0.7143657, -0.1274199, -1.128626, 1, 0, 0, 1, 1,
-0.7139794, 0.4379241, 0.4239984, 1, 0, 0, 1, 1,
-0.7000132, 1.444891, -0.4997784, 1, 0, 0, 1, 1,
-0.6901431, -0.8280139, -3.664011, 1, 0, 0, 1, 1,
-0.6875854, 0.8340166, -0.9146681, 1, 0, 0, 1, 1,
-0.6863355, 0.8043931, -1.249436, 0, 0, 0, 1, 1,
-0.684949, 0.9112495, -1.424926, 0, 0, 0, 1, 1,
-0.6832668, -0.4907982, -0.7655902, 0, 0, 0, 1, 1,
-0.6821542, 0.4246669, -1.367068, 0, 0, 0, 1, 1,
-0.6812206, -1.407782, -2.41522, 0, 0, 0, 1, 1,
-0.6795771, -1.811835, -2.61832, 0, 0, 0, 1, 1,
-0.6778988, 1.017773, -0.3758493, 0, 0, 0, 1, 1,
-0.6740956, 0.362316, -0.2627637, 1, 1, 1, 1, 1,
-0.6713023, -1.658321, -2.755394, 1, 1, 1, 1, 1,
-0.6616493, -0.4757394, -3.281569, 1, 1, 1, 1, 1,
-0.6590093, 0.1729019, -0.9765993, 1, 1, 1, 1, 1,
-0.6583437, -0.7074547, -2.464067, 1, 1, 1, 1, 1,
-0.658026, 0.6572722, 0.9947261, 1, 1, 1, 1, 1,
-0.6512192, 0.831361, -2.12765, 1, 1, 1, 1, 1,
-0.6496056, -0.4174956, -1.405007, 1, 1, 1, 1, 1,
-0.6476494, 0.1275548, -0.6645586, 1, 1, 1, 1, 1,
-0.6475517, -0.3514078, -4.217873, 1, 1, 1, 1, 1,
-0.6366478, -0.3334821, -0.6786503, 1, 1, 1, 1, 1,
-0.6345026, -1.126654, -3.805179, 1, 1, 1, 1, 1,
-0.6334668, -0.7496979, -1.407147, 1, 1, 1, 1, 1,
-0.6289963, -1.089893, -4.031951, 1, 1, 1, 1, 1,
-0.6221105, -1.291992, -0.8446201, 1, 1, 1, 1, 1,
-0.6219364, 0.1237933, -2.182613, 0, 0, 1, 1, 1,
-0.6076673, -0.09144321, -2.507645, 1, 0, 0, 1, 1,
-0.6055741, -2.24446, -1.973938, 1, 0, 0, 1, 1,
-0.6037214, -1.500692, -2.150211, 1, 0, 0, 1, 1,
-0.600684, 0.725648, -0.005440929, 1, 0, 0, 1, 1,
-0.5987864, -0.272992, -0.9339311, 1, 0, 0, 1, 1,
-0.5983251, -0.5481122, -1.930532, 0, 0, 0, 1, 1,
-0.5902187, 0.4911406, -1.540749, 0, 0, 0, 1, 1,
-0.5901671, -0.8215912, -0.5332435, 0, 0, 0, 1, 1,
-0.5865298, 0.3015941, -1.100239, 0, 0, 0, 1, 1,
-0.58132, -1.659371, -1.497708, 0, 0, 0, 1, 1,
-0.5742736, 0.6623619, -0.7347853, 0, 0, 0, 1, 1,
-0.5713409, 0.5102916, -0.2837453, 0, 0, 0, 1, 1,
-0.5707579, 1.608626, -0.3675447, 1, 1, 1, 1, 1,
-0.5655728, -2.390638, -2.745947, 1, 1, 1, 1, 1,
-0.5609664, -0.3876101, -2.322791, 1, 1, 1, 1, 1,
-0.5529236, -0.7036516, -2.555727, 1, 1, 1, 1, 1,
-0.5491613, 0.1490956, -1.214411, 1, 1, 1, 1, 1,
-0.5464197, -0.8625646, -0.394519, 1, 1, 1, 1, 1,
-0.5454857, -0.5993387, -3.641156, 1, 1, 1, 1, 1,
-0.5410706, 0.4181113, -0.6929871, 1, 1, 1, 1, 1,
-0.538699, 0.6605543, -0.2603806, 1, 1, 1, 1, 1,
-0.5365302, 0.05729783, -0.5048464, 1, 1, 1, 1, 1,
-0.5335579, 0.3869791, -3.024868, 1, 1, 1, 1, 1,
-0.5302145, 1.357774, -1.85025, 1, 1, 1, 1, 1,
-0.530135, 0.2377049, -1.623064, 1, 1, 1, 1, 1,
-0.5267161, 0.005193696, -1.73436, 1, 1, 1, 1, 1,
-0.5265148, -0.8367399, -0.8963267, 1, 1, 1, 1, 1,
-0.5176729, -1.032062, -3.174837, 0, 0, 1, 1, 1,
-0.517233, -0.6588328, -3.34598, 1, 0, 0, 1, 1,
-0.5147072, -1.190648, -3.24195, 1, 0, 0, 1, 1,
-0.5106624, 1.060569, -3.002326, 1, 0, 0, 1, 1,
-0.5043392, 0.9709922, -0.2395993, 1, 0, 0, 1, 1,
-0.5013863, -0.07589529, -1.854663, 1, 0, 0, 1, 1,
-0.4971607, -1.653768, -3.536374, 0, 0, 0, 1, 1,
-0.4960314, 0.406438, 0.2282193, 0, 0, 0, 1, 1,
-0.4952628, 0.3791652, -2.999206, 0, 0, 0, 1, 1,
-0.492969, -0.7628734, -2.350154, 0, 0, 0, 1, 1,
-0.4918156, 1.712259, 0.6441457, 0, 0, 0, 1, 1,
-0.4917279, -0.6564972, -3.143349, 0, 0, 0, 1, 1,
-0.4845877, 0.3718171, -0.5664057, 0, 0, 0, 1, 1,
-0.4801549, -0.246075, -2.023418, 1, 1, 1, 1, 1,
-0.4776655, 0.5630072, -3.418388, 1, 1, 1, 1, 1,
-0.4692892, -1.7249, -3.572928, 1, 1, 1, 1, 1,
-0.469042, 0.8312084, -2.855555, 1, 1, 1, 1, 1,
-0.4677186, -0.2092143, -1.913224, 1, 1, 1, 1, 1,
-0.4654894, 0.2237727, -0.9515404, 1, 1, 1, 1, 1,
-0.4638926, -0.6392108, -2.866721, 1, 1, 1, 1, 1,
-0.463558, 0.295332, -0.5226623, 1, 1, 1, 1, 1,
-0.4614059, -2.156109, -2.067815, 1, 1, 1, 1, 1,
-0.4608385, 3.086775, 1.839197, 1, 1, 1, 1, 1,
-0.4575752, -0.5894948, -2.168446, 1, 1, 1, 1, 1,
-0.4526199, 0.6546382, -0.7925041, 1, 1, 1, 1, 1,
-0.450827, -0.3176204, -2.824589, 1, 1, 1, 1, 1,
-0.449923, -1.215427, -4.293435, 1, 1, 1, 1, 1,
-0.4478802, -2.611247, -1.633973, 1, 1, 1, 1, 1,
-0.4413166, -0.8247516, -2.438037, 0, 0, 1, 1, 1,
-0.4394861, 1.664746, -0.7990856, 1, 0, 0, 1, 1,
-0.4385057, -0.06262606, -3.472499, 1, 0, 0, 1, 1,
-0.4380223, 0.2977029, 0.1078402, 1, 0, 0, 1, 1,
-0.4354793, -0.2357935, -2.340123, 1, 0, 0, 1, 1,
-0.4337466, 1.473394, 0.1066918, 1, 0, 0, 1, 1,
-0.4330197, -0.317012, -1.381141, 0, 0, 0, 1, 1,
-0.4308581, 0.3254021, -0.3510526, 0, 0, 0, 1, 1,
-0.4300854, 0.5075794, -2.337394, 0, 0, 0, 1, 1,
-0.4293619, -0.2041362, -3.219732, 0, 0, 0, 1, 1,
-0.4273261, 0.8272654, -2.734452, 0, 0, 0, 1, 1,
-0.4257744, -2.064067, -5.875944, 0, 0, 0, 1, 1,
-0.4253967, -1.393225, -2.508952, 0, 0, 0, 1, 1,
-0.4239683, -0.9186431, -2.043319, 1, 1, 1, 1, 1,
-0.4223244, -0.8243285, -2.206772, 1, 1, 1, 1, 1,
-0.4218704, -1.714019, -1.71246, 1, 1, 1, 1, 1,
-0.420776, 0.4572591, -2.303075, 1, 1, 1, 1, 1,
-0.4168529, 1.255759, -0.5213578, 1, 1, 1, 1, 1,
-0.4138845, -0.9194323, -0.8681754, 1, 1, 1, 1, 1,
-0.4126425, -0.8369428, -3.154076, 1, 1, 1, 1, 1,
-0.4094162, 0.5227624, -0.9359728, 1, 1, 1, 1, 1,
-0.4054548, -0.3053225, -2.084115, 1, 1, 1, 1, 1,
-0.3981822, -0.8591882, -3.172061, 1, 1, 1, 1, 1,
-0.3980966, -0.02928416, -1.485519, 1, 1, 1, 1, 1,
-0.3913224, 0.1821095, -1.632858, 1, 1, 1, 1, 1,
-0.3907535, 0.5769297, -0.2784793, 1, 1, 1, 1, 1,
-0.3863893, -0.3310719, -2.099962, 1, 1, 1, 1, 1,
-0.3835624, 0.5466356, 0.7868106, 1, 1, 1, 1, 1,
-0.3832439, 1.01429, 1.36218, 0, 0, 1, 1, 1,
-0.3671989, 1.208556, 1.12832, 1, 0, 0, 1, 1,
-0.3652954, -0.6329845, -2.832359, 1, 0, 0, 1, 1,
-0.3598401, 0.2472486, -0.6323739, 1, 0, 0, 1, 1,
-0.3595392, 1.700969, -1.161624, 1, 0, 0, 1, 1,
-0.3588167, -0.3937357, -3.519399, 1, 0, 0, 1, 1,
-0.3576677, -0.2858872, -2.873783, 0, 0, 0, 1, 1,
-0.3574907, -0.5251774, -2.877237, 0, 0, 0, 1, 1,
-0.3572267, 0.5039293, 0.2240725, 0, 0, 0, 1, 1,
-0.3505167, -0.7560678, -1.078653, 0, 0, 0, 1, 1,
-0.3503317, -1.28363, -2.891505, 0, 0, 0, 1, 1,
-0.3499206, 0.3955379, -1.443762, 0, 0, 0, 1, 1,
-0.3490022, 0.4823914, -0.4508588, 0, 0, 0, 1, 1,
-0.348756, -0.7320278, -2.099509, 1, 1, 1, 1, 1,
-0.3461006, 1.954156, -1.52628, 1, 1, 1, 1, 1,
-0.3442295, -1.028573, -2.94307, 1, 1, 1, 1, 1,
-0.3437018, 0.5499961, 0.4448392, 1, 1, 1, 1, 1,
-0.3421429, -0.4864431, -3.814817, 1, 1, 1, 1, 1,
-0.3416165, 0.3608614, -0.4279288, 1, 1, 1, 1, 1,
-0.3398224, 1.100273, -0.2568291, 1, 1, 1, 1, 1,
-0.3357273, -0.1296458, -1.69302, 1, 1, 1, 1, 1,
-0.3348798, 0.2532477, -2.862458, 1, 1, 1, 1, 1,
-0.3346901, 0.2341975, 0.08249103, 1, 1, 1, 1, 1,
-0.3331932, -0.8624373, -0.3070459, 1, 1, 1, 1, 1,
-0.3308091, -0.3629324, -2.90375, 1, 1, 1, 1, 1,
-0.3289261, 0.3048654, 1.158821, 1, 1, 1, 1, 1,
-0.3210303, -0.9821807, -2.280335, 1, 1, 1, 1, 1,
-0.3174468, -1.94451, -3.805167, 1, 1, 1, 1, 1,
-0.3155121, -0.2599829, -2.641549, 0, 0, 1, 1, 1,
-0.3123086, -1.133882, -2.906571, 1, 0, 0, 1, 1,
-0.3121388, 1.021472, 1.957686, 1, 0, 0, 1, 1,
-0.3049788, -0.7181342, -3.501217, 1, 0, 0, 1, 1,
-0.3023274, -0.5742989, -1.5927, 1, 0, 0, 1, 1,
-0.3003671, -1.858356, -1.97735, 1, 0, 0, 1, 1,
-0.3001474, 1.277322, -0.2317552, 0, 0, 0, 1, 1,
-0.2976229, 0.6439613, -1.861698, 0, 0, 0, 1, 1,
-0.2935625, 1.211995, -0.5938154, 0, 0, 0, 1, 1,
-0.2912644, -0.1337294, -1.745417, 0, 0, 0, 1, 1,
-0.2912048, -1.057503, -1.138184, 0, 0, 0, 1, 1,
-0.2907681, -0.1259083, -2.703143, 0, 0, 0, 1, 1,
-0.2895806, 0.1162464, -1.04387, 0, 0, 0, 1, 1,
-0.2891312, 1.626543, -0.9283577, 1, 1, 1, 1, 1,
-0.2886144, 0.2342613, -1.731244, 1, 1, 1, 1, 1,
-0.2879792, 0.7877357, -0.433503, 1, 1, 1, 1, 1,
-0.2804333, 0.386203, -0.03435632, 1, 1, 1, 1, 1,
-0.2777554, -0.8822243, -2.211828, 1, 1, 1, 1, 1,
-0.2681333, -0.2193652, -0.8643751, 1, 1, 1, 1, 1,
-0.2669716, 0.3202739, 0.1215662, 1, 1, 1, 1, 1,
-0.2656304, 0.8806041, 0.7942085, 1, 1, 1, 1, 1,
-0.2644493, -1.282374, -3.335641, 1, 1, 1, 1, 1,
-0.2635755, 1.330188, 0.4290993, 1, 1, 1, 1, 1,
-0.2620983, 0.6342162, -2.420587, 1, 1, 1, 1, 1,
-0.2613604, 0.6714009, 1.159766, 1, 1, 1, 1, 1,
-0.2609287, -0.1962022, -0.5248278, 1, 1, 1, 1, 1,
-0.2604936, -0.4525172, -2.864036, 1, 1, 1, 1, 1,
-0.2579958, 0.8439211, -1.565328, 1, 1, 1, 1, 1,
-0.2552384, -1.07264, -2.420825, 0, 0, 1, 1, 1,
-0.2531692, -0.4956752, -3.606289, 1, 0, 0, 1, 1,
-0.2461943, 1.250204, -1.055449, 1, 0, 0, 1, 1,
-0.2461364, 1.068178, -1.590483, 1, 0, 0, 1, 1,
-0.2459179, 1.299497, -0.957335, 1, 0, 0, 1, 1,
-0.243448, -0.3193335, -1.539305, 1, 0, 0, 1, 1,
-0.2426839, 0.1276628, -1.277241, 0, 0, 0, 1, 1,
-0.2412264, -0.8691896, -2.172595, 0, 0, 0, 1, 1,
-0.2355673, -2.271747, -2.720362, 0, 0, 0, 1, 1,
-0.2289656, -1.223672, -2.616377, 0, 0, 0, 1, 1,
-0.2269603, 0.08309456, -1.957788, 0, 0, 0, 1, 1,
-0.2119483, 1.138912, -0.7209281, 0, 0, 0, 1, 1,
-0.2118581, 0.8825741, 1.630033, 0, 0, 0, 1, 1,
-0.2085309, 0.4369535, -1.801588, 1, 1, 1, 1, 1,
-0.2070316, -0.4158468, 0.6000523, 1, 1, 1, 1, 1,
-0.2069018, 0.04051253, -1.544047, 1, 1, 1, 1, 1,
-0.206643, -0.5409735, -1.451682, 1, 1, 1, 1, 1,
-0.2051247, -1.336357, -2.863497, 1, 1, 1, 1, 1,
-0.202437, -1.10785, -2.358749, 1, 1, 1, 1, 1,
-0.202368, -1.944639, -2.827085, 1, 1, 1, 1, 1,
-0.2018135, 0.8719155, -0.2267846, 1, 1, 1, 1, 1,
-0.200093, -0.1142998, -2.77912, 1, 1, 1, 1, 1,
-0.2000726, 0.06940683, -2.986983, 1, 1, 1, 1, 1,
-0.197205, 0.9063293, 0.3503899, 1, 1, 1, 1, 1,
-0.1955081, 1.621818, -0.4294066, 1, 1, 1, 1, 1,
-0.1941646, 0.3023765, -1.269148, 1, 1, 1, 1, 1,
-0.1827068, -0.5784324, -2.622688, 1, 1, 1, 1, 1,
-0.1818134, 0.3114119, -0.5721948, 1, 1, 1, 1, 1,
-0.1813758, -0.6116614, -3.401229, 0, 0, 1, 1, 1,
-0.1764637, -0.4883042, -3.551214, 1, 0, 0, 1, 1,
-0.1763662, -0.428678, -3.571269, 1, 0, 0, 1, 1,
-0.1714106, -0.0505281, -2.147065, 1, 0, 0, 1, 1,
-0.1707557, 0.2833985, -0.8605178, 1, 0, 0, 1, 1,
-0.1688607, -0.6313436, -1.92006, 1, 0, 0, 1, 1,
-0.1675994, 0.2494065, -0.7896173, 0, 0, 0, 1, 1,
-0.1667783, -1.335598, -3.667489, 0, 0, 0, 1, 1,
-0.1614878, -0.406088, -4.096622, 0, 0, 0, 1, 1,
-0.1611261, 0.6061127, -0.2477094, 0, 0, 0, 1, 1,
-0.1594628, 0.1080134, -1.704491, 0, 0, 0, 1, 1,
-0.1592384, 0.04295669, -0.6746075, 0, 0, 0, 1, 1,
-0.1581309, 0.7982044, -0.8822447, 0, 0, 0, 1, 1,
-0.1546826, -0.04232512, -0.8483012, 1, 1, 1, 1, 1,
-0.1527829, 0.1328522, -1.149756, 1, 1, 1, 1, 1,
-0.1527476, 1.03662, 2.026293, 1, 1, 1, 1, 1,
-0.1512853, 1.107994, -0.4264323, 1, 1, 1, 1, 1,
-0.1504544, 1.171332, -0.1546386, 1, 1, 1, 1, 1,
-0.1499769, -2.437243, -2.674328, 1, 1, 1, 1, 1,
-0.149781, -0.6218714, -1.922964, 1, 1, 1, 1, 1,
-0.1468801, -0.7159158, -2.038236, 1, 1, 1, 1, 1,
-0.1449511, 1.579807, 0.4016363, 1, 1, 1, 1, 1,
-0.1414789, -2.171777, -3.023763, 1, 1, 1, 1, 1,
-0.1404041, 0.703641, -1.202877, 1, 1, 1, 1, 1,
-0.1341701, -0.1579443, -3.164911, 1, 1, 1, 1, 1,
-0.1298923, -1.284525, -3.615487, 1, 1, 1, 1, 1,
-0.1262633, 0.8446245, 0.08574075, 1, 1, 1, 1, 1,
-0.124553, -1.562575, -2.510095, 1, 1, 1, 1, 1,
-0.1226181, -0.8230087, -1.722968, 0, 0, 1, 1, 1,
-0.1217257, 0.1606591, -1.091633, 1, 0, 0, 1, 1,
-0.1211554, 0.9016402, -2.035481, 1, 0, 0, 1, 1,
-0.1160261, -0.546492, -2.464415, 1, 0, 0, 1, 1,
-0.1100564, 1.529349, -0.04238167, 1, 0, 0, 1, 1,
-0.1063869, -0.2307423, -2.466333, 1, 0, 0, 1, 1,
-0.105813, -0.5912243, -2.730511, 0, 0, 0, 1, 1,
-0.09523086, 0.48615, -0.4040464, 0, 0, 0, 1, 1,
-0.08644121, 1.142748, -0.06794627, 0, 0, 0, 1, 1,
-0.08643775, -0.9482497, -2.322577, 0, 0, 0, 1, 1,
-0.08630969, -0.07351992, -1.924136, 0, 0, 0, 1, 1,
-0.08200194, 1.211789, -0.7236139, 0, 0, 0, 1, 1,
-0.07903423, -0.1249678, -3.224734, 0, 0, 0, 1, 1,
-0.07676595, -0.2259951, -4.323109, 1, 1, 1, 1, 1,
-0.07540058, 0.31785, 0.6548235, 1, 1, 1, 1, 1,
-0.07451542, 0.4081338, 0.2047159, 1, 1, 1, 1, 1,
-0.07391851, -0.463275, -2.524873, 1, 1, 1, 1, 1,
-0.07196169, -1.110211, -3.520384, 1, 1, 1, 1, 1,
-0.06764748, -0.02557251, -1.149631, 1, 1, 1, 1, 1,
-0.06736524, -0.6573662, -3.245924, 1, 1, 1, 1, 1,
-0.06617029, -0.1692871, -2.95368, 1, 1, 1, 1, 1,
-0.06573674, 0.7089501, -1.000396, 1, 1, 1, 1, 1,
-0.0592213, -0.6889703, -2.138632, 1, 1, 1, 1, 1,
-0.05773255, -0.2159629, -3.119385, 1, 1, 1, 1, 1,
-0.05693755, 1.988578, 0.03433636, 1, 1, 1, 1, 1,
-0.05489189, 0.009215322, -3.038586, 1, 1, 1, 1, 1,
-0.04973497, 0.5193523, -0.4323491, 1, 1, 1, 1, 1,
-0.04929315, 0.7957042, 1.074265, 1, 1, 1, 1, 1,
-0.04857195, 0.4178254, 0.5929856, 0, 0, 1, 1, 1,
-0.04748173, 0.8070649, 0.1413829, 1, 0, 0, 1, 1,
-0.04535154, 1.137358, 0.5614033, 1, 0, 0, 1, 1,
-0.04505482, -0.8706865, -2.086791, 1, 0, 0, 1, 1,
-0.04283517, 1.066045, -1.124803, 1, 0, 0, 1, 1,
-0.04072583, -0.937704, -2.902414, 1, 0, 0, 1, 1,
-0.04048504, -0.8272666, -1.973748, 0, 0, 0, 1, 1,
-0.03358106, 1.281738, 0.9809973, 0, 0, 0, 1, 1,
-0.02950237, 0.9403735, 2.797846, 0, 0, 0, 1, 1,
-0.02905535, 0.1339982, 0.7643142, 0, 0, 0, 1, 1,
-0.02746912, 1.289533, -0.9798734, 0, 0, 0, 1, 1,
-0.02602247, 0.2246149, 1.517756, 0, 0, 0, 1, 1,
-0.02334985, -1.071656, -2.791527, 0, 0, 0, 1, 1,
-0.02095565, 0.99173, -2.183134, 1, 1, 1, 1, 1,
-0.01877496, 0.3535, 0.3617724, 1, 1, 1, 1, 1,
-0.0128152, -0.1004549, -2.764505, 1, 1, 1, 1, 1,
0.002456486, 0.4810304, -0.1617719, 1, 1, 1, 1, 1,
0.0041636, 1.763757, -1.661335, 1, 1, 1, 1, 1,
0.004513596, 0.6738665, 0.1623205, 1, 1, 1, 1, 1,
0.007978326, -0.8074223, 1.492806, 1, 1, 1, 1, 1,
0.009170179, 0.4262399, -2.981418, 1, 1, 1, 1, 1,
0.009803368, -0.2066509, 3.742668, 1, 1, 1, 1, 1,
0.0114763, -0.134382, 4.014416, 1, 1, 1, 1, 1,
0.01979672, -0.3348701, 1.821266, 1, 1, 1, 1, 1,
0.0205228, 0.3059892, -0.4615471, 1, 1, 1, 1, 1,
0.02728771, 0.7397808, 1.999029, 1, 1, 1, 1, 1,
0.02851956, 0.3366261, 0.1562696, 1, 1, 1, 1, 1,
0.03376356, -0.6527454, 1.44566, 1, 1, 1, 1, 1,
0.0365827, 0.07656141, -1.093088, 0, 0, 1, 1, 1,
0.03785208, -1.069951, 1.765439, 1, 0, 0, 1, 1,
0.04122546, -0.3159274, 3.031534, 1, 0, 0, 1, 1,
0.04543746, 1.908222, -0.5115821, 1, 0, 0, 1, 1,
0.04896675, 0.7260686, 0.07785558, 1, 0, 0, 1, 1,
0.05127238, 0.3096045, 0.4561355, 1, 0, 0, 1, 1,
0.05313487, 0.1808449, 0.6029015, 0, 0, 0, 1, 1,
0.05766945, 0.5288547, -0.3188627, 0, 0, 0, 1, 1,
0.05956437, 0.2611725, 0.8532993, 0, 0, 0, 1, 1,
0.06011676, -0.9167573, 4.816184, 0, 0, 0, 1, 1,
0.06109547, 0.1864923, -0.281267, 0, 0, 0, 1, 1,
0.06250613, 0.06341478, 0.8067656, 0, 0, 0, 1, 1,
0.06500316, 0.5691752, -1.257394, 0, 0, 0, 1, 1,
0.06781766, 0.2960669, 1.362206, 1, 1, 1, 1, 1,
0.07002697, 0.2295848, 2.320438, 1, 1, 1, 1, 1,
0.07037857, 0.7103855, 1.266276, 1, 1, 1, 1, 1,
0.0727949, 1.13006, 0.8039517, 1, 1, 1, 1, 1,
0.07329492, 1.211136, 0.4805736, 1, 1, 1, 1, 1,
0.07524947, 1.778823, 1.006998, 1, 1, 1, 1, 1,
0.07712016, -0.5352381, 3.017771, 1, 1, 1, 1, 1,
0.07829229, 0.06315397, 1.490243, 1, 1, 1, 1, 1,
0.08037629, -1.320462, 3.710716, 1, 1, 1, 1, 1,
0.08584265, 0.793133, 0.4220279, 1, 1, 1, 1, 1,
0.08726974, 0.1534846, -0.7904531, 1, 1, 1, 1, 1,
0.08821051, 0.3061066, -0.1969218, 1, 1, 1, 1, 1,
0.08978932, 1.723148, 0.3657598, 1, 1, 1, 1, 1,
0.09850105, -0.6044743, 2.39317, 1, 1, 1, 1, 1,
0.09978294, -1.004689, 4.827764, 1, 1, 1, 1, 1,
0.1045003, -1.010993, 4.496269, 0, 0, 1, 1, 1,
0.1053381, -0.2229531, 4.002766, 1, 0, 0, 1, 1,
0.1071906, 0.07123657, 0.5206855, 1, 0, 0, 1, 1,
0.1073004, 1.282791, -0.899584, 1, 0, 0, 1, 1,
0.1073974, 0.3712406, -0.6086767, 1, 0, 0, 1, 1,
0.1074275, 1.460644, -0.217719, 1, 0, 0, 1, 1,
0.1080334, 0.4060678, -1.149682, 0, 0, 0, 1, 1,
0.1100059, -0.4321786, 3.827966, 0, 0, 0, 1, 1,
0.1141735, 0.1270964, 0.3133283, 0, 0, 0, 1, 1,
0.114187, 1.06833, -1.779767, 0, 0, 0, 1, 1,
0.1162737, 0.09165943, 0.8388969, 0, 0, 0, 1, 1,
0.1175264, -0.06044572, 0.9697832, 0, 0, 0, 1, 1,
0.117728, 0.4601597, 1.270267, 0, 0, 0, 1, 1,
0.1188792, 0.6560928, 0.5516629, 1, 1, 1, 1, 1,
0.1234369, 2.779464, 0.2147379, 1, 1, 1, 1, 1,
0.1244231, 1.251907, 1.241493, 1, 1, 1, 1, 1,
0.1252555, 1.476594, -0.1751618, 1, 1, 1, 1, 1,
0.1267985, 0.5684842, -0.2981654, 1, 1, 1, 1, 1,
0.1288522, -0.02143087, 1.053351, 1, 1, 1, 1, 1,
0.1300691, 1.029414, -0.1135429, 1, 1, 1, 1, 1,
0.1304479, 0.5402876, 0.2888165, 1, 1, 1, 1, 1,
0.1364392, 1.382917, -1.393163, 1, 1, 1, 1, 1,
0.1385508, 0.02322474, 1.642801, 1, 1, 1, 1, 1,
0.1386432, -0.3244899, 3.95621, 1, 1, 1, 1, 1,
0.1392078, -0.930728, 4.06149, 1, 1, 1, 1, 1,
0.1401634, -0.2094461, 4.381348, 1, 1, 1, 1, 1,
0.1404288, 1.261702, -0.2789311, 1, 1, 1, 1, 1,
0.1409675, -3.458578, 2.63538, 1, 1, 1, 1, 1,
0.144851, 0.5848653, 1.453709, 0, 0, 1, 1, 1,
0.1465087, -1.960505, 3.467939, 1, 0, 0, 1, 1,
0.1469874, -1.684325, 4.437926, 1, 0, 0, 1, 1,
0.1504069, -1.705298, 2.142646, 1, 0, 0, 1, 1,
0.1517212, 0.6909311, 0.2043819, 1, 0, 0, 1, 1,
0.1593744, -0.5888546, 1.897642, 1, 0, 0, 1, 1,
0.163081, 1.588306, 1.757092, 0, 0, 0, 1, 1,
0.1698315, -0.3298904, 1.90068, 0, 0, 0, 1, 1,
0.1718303, 0.5456814, 1.00888, 0, 0, 0, 1, 1,
0.1725314, -0.5262578, 3.432184, 0, 0, 0, 1, 1,
0.1740759, -0.1892629, 1.954623, 0, 0, 0, 1, 1,
0.175215, 2.513054, 0.3051484, 0, 0, 0, 1, 1,
0.1760715, 0.3806829, 1.593272, 0, 0, 0, 1, 1,
0.1787488, 1.30158, -0.3657826, 1, 1, 1, 1, 1,
0.1793846, -0.2020302, 1.559611, 1, 1, 1, 1, 1,
0.181645, -0.05956145, 2.022028, 1, 1, 1, 1, 1,
0.1826011, -0.08212671, 1.294902, 1, 1, 1, 1, 1,
0.1848556, -0.326025, 1.754869, 1, 1, 1, 1, 1,
0.1886057, -1.892376, 3.151118, 1, 1, 1, 1, 1,
0.1924458, -0.3576187, 2.00021, 1, 1, 1, 1, 1,
0.1930568, 0.5527847, -0.08602551, 1, 1, 1, 1, 1,
0.197125, 0.6923386, 0.05616732, 1, 1, 1, 1, 1,
0.205171, 1.547953, 0.7964895, 1, 1, 1, 1, 1,
0.2101117, -1.098491, 4.551751, 1, 1, 1, 1, 1,
0.2103597, -2.11161, 3.625298, 1, 1, 1, 1, 1,
0.2132051, -0.4594825, 4.58209, 1, 1, 1, 1, 1,
0.2135924, -1.877262, 2.715876, 1, 1, 1, 1, 1,
0.2157305, 0.9032804, 1.699445, 1, 1, 1, 1, 1,
0.2183671, 1.331556, 0.505885, 0, 0, 1, 1, 1,
0.2230252, -0.01834173, -0.1656498, 1, 0, 0, 1, 1,
0.2233263, 1.170067, -0.6981558, 1, 0, 0, 1, 1,
0.2300609, -0.5763823, 1.577957, 1, 0, 0, 1, 1,
0.2336287, -0.1876377, 0.2079299, 1, 0, 0, 1, 1,
0.2363941, -0.4519731, 1.181493, 1, 0, 0, 1, 1,
0.2365016, -1.292403, 4.489297, 0, 0, 0, 1, 1,
0.2367329, -0.2159313, 0.6017724, 0, 0, 0, 1, 1,
0.2392103, 1.022272, -0.5122191, 0, 0, 0, 1, 1,
0.2467698, 1.891498, 1.250256, 0, 0, 0, 1, 1,
0.2504019, 0.09465781, 1.917938, 0, 0, 0, 1, 1,
0.2513203, 0.45254, -0.00176024, 0, 0, 0, 1, 1,
0.2601683, 1.472531, 0.3722854, 0, 0, 0, 1, 1,
0.2625504, 0.8823506, 1.010411, 1, 1, 1, 1, 1,
0.2718368, -1.54669, 3.763122, 1, 1, 1, 1, 1,
0.2724121, -0.7168874, 3.918823, 1, 1, 1, 1, 1,
0.2768564, 0.1776469, 1.131333, 1, 1, 1, 1, 1,
0.2823318, -0.5672493, 2.694291, 1, 1, 1, 1, 1,
0.2845101, -1.523075, 4.290203, 1, 1, 1, 1, 1,
0.2867253, 0.6528018, 0.430364, 1, 1, 1, 1, 1,
0.2871821, -0.2183575, 4.147949, 1, 1, 1, 1, 1,
0.2887328, 1.015, 1.080313, 1, 1, 1, 1, 1,
0.2947825, -2.167741, 2.141186, 1, 1, 1, 1, 1,
0.2974996, -0.08846902, -1.081488, 1, 1, 1, 1, 1,
0.2985543, 0.5112963, 0.04668415, 1, 1, 1, 1, 1,
0.3021494, 0.9554832, 3.18321, 1, 1, 1, 1, 1,
0.3054874, 1.057024, -1.516962, 1, 1, 1, 1, 1,
0.3107769, 0.2227756, -0.3368212, 1, 1, 1, 1, 1,
0.311517, -2.138163, 1.453889, 0, 0, 1, 1, 1,
0.3137358, -1.677107, 1.560852, 1, 0, 0, 1, 1,
0.3148978, 0.2922136, 0.1318308, 1, 0, 0, 1, 1,
0.3301306, 0.06513886, 1.304758, 1, 0, 0, 1, 1,
0.3339179, 0.6133656, -0.1711497, 1, 0, 0, 1, 1,
0.3345713, 1.527742, 1.418374, 1, 0, 0, 1, 1,
0.3348803, -0.09937055, 2.445627, 0, 0, 0, 1, 1,
0.3378052, 0.1351548, 1.14374, 0, 0, 0, 1, 1,
0.338595, 1.487491, -2.275538, 0, 0, 0, 1, 1,
0.3392391, -0.09418552, 2.489339, 0, 0, 0, 1, 1,
0.3422025, 0.3913933, -0.2808625, 0, 0, 0, 1, 1,
0.3423837, 0.4908077, -0.3830101, 0, 0, 0, 1, 1,
0.3448291, -0.3000085, 1.910804, 0, 0, 0, 1, 1,
0.3457952, 0.01402772, 2.669919, 1, 1, 1, 1, 1,
0.3465167, -1.690458, 2.191668, 1, 1, 1, 1, 1,
0.3480535, -1.560394, 3.776457, 1, 1, 1, 1, 1,
0.3486638, 1.449701, 0.5206527, 1, 1, 1, 1, 1,
0.350303, 0.9590743, 1.030834, 1, 1, 1, 1, 1,
0.3547121, 0.9017234, 1.439032, 1, 1, 1, 1, 1,
0.3566898, 0.6389446, 0.09732952, 1, 1, 1, 1, 1,
0.3579495, -0.6427729, 1.365399, 1, 1, 1, 1, 1,
0.3630108, -0.2330626, 0.9755993, 1, 1, 1, 1, 1,
0.3652795, -0.4004299, 3.562602, 1, 1, 1, 1, 1,
0.3654693, -2.819271, 3.074439, 1, 1, 1, 1, 1,
0.3678522, -0.1211037, 3.148364, 1, 1, 1, 1, 1,
0.3789259, -0.7930275, 2.380387, 1, 1, 1, 1, 1,
0.3805138, -0.3002259, 2.469531, 1, 1, 1, 1, 1,
0.3816434, 0.3825006, -1.005911, 1, 1, 1, 1, 1,
0.3851276, -1.661502, 2.912848, 0, 0, 1, 1, 1,
0.390287, 0.3554604, -0.3662389, 1, 0, 0, 1, 1,
0.3926553, -0.2281482, 0.5437568, 1, 0, 0, 1, 1,
0.394391, -0.6208175, 0.9767386, 1, 0, 0, 1, 1,
0.3949764, -0.6881571, 4.085698, 1, 0, 0, 1, 1,
0.3980872, -0.6071439, 3.774738, 1, 0, 0, 1, 1,
0.4093067, 1.577501, -0.08037863, 0, 0, 0, 1, 1,
0.4117812, 0.2670189, 0.7132331, 0, 0, 0, 1, 1,
0.4156579, 0.2107512, 0.2229035, 0, 0, 0, 1, 1,
0.4159478, 0.283846, 1.044517, 0, 0, 0, 1, 1,
0.4182469, -0.5456653, 1.915443, 0, 0, 0, 1, 1,
0.4251982, -1.168231, 3.451972, 0, 0, 0, 1, 1,
0.4292136, 0.7860692, 0.001037183, 0, 0, 0, 1, 1,
0.43011, 1.889921, -0.7516194, 1, 1, 1, 1, 1,
0.4322074, -1.788923, 4.325671, 1, 1, 1, 1, 1,
0.4354365, -2.329504, 3.640578, 1, 1, 1, 1, 1,
0.4380396, -0.1488141, 2.546985, 1, 1, 1, 1, 1,
0.4431016, -0.2721726, 1.248771, 1, 1, 1, 1, 1,
0.4459736, 0.3760913, -0.9639788, 1, 1, 1, 1, 1,
0.4492576, 1.171014, 1.24542, 1, 1, 1, 1, 1,
0.4541728, -0.6570087, 3.812969, 1, 1, 1, 1, 1,
0.4593158, 0.5073015, -0.6608886, 1, 1, 1, 1, 1,
0.4621511, 0.1292013, 1.711097, 1, 1, 1, 1, 1,
0.4645607, 0.7456229, -0.2244528, 1, 1, 1, 1, 1,
0.46601, 1.426212, 0.3576777, 1, 1, 1, 1, 1,
0.4695348, 0.4572231, 0.8055735, 1, 1, 1, 1, 1,
0.4699379, 0.6312537, -0.3801165, 1, 1, 1, 1, 1,
0.4701774, 0.4037746, 1.748045, 1, 1, 1, 1, 1,
0.4729675, 2.134847, 0.8844509, 0, 0, 1, 1, 1,
0.475042, -0.8680504, 2.508054, 1, 0, 0, 1, 1,
0.4753139, -0.1083655, 0.9748341, 1, 0, 0, 1, 1,
0.4814283, -1.151971, 4.222408, 1, 0, 0, 1, 1,
0.4875707, -1.260473, 2.257741, 1, 0, 0, 1, 1,
0.49062, 0.737591, -0.910096, 1, 0, 0, 1, 1,
0.4948172, -0.5822645, 2.904369, 0, 0, 0, 1, 1,
0.4948606, 0.4362612, 1.696309, 0, 0, 0, 1, 1,
0.5001725, 1.658805, 0.8222476, 0, 0, 0, 1, 1,
0.5007329, -2.605172, 1.706334, 0, 0, 0, 1, 1,
0.5010157, -0.7080622, 1.575189, 0, 0, 0, 1, 1,
0.5057878, 0.7560418, 0.9067298, 0, 0, 0, 1, 1,
0.5132929, 0.6951296, 0.9619941, 0, 0, 0, 1, 1,
0.5189657, 0.3494514, 1.698605, 1, 1, 1, 1, 1,
0.5193652, 0.957762, 2.327659, 1, 1, 1, 1, 1,
0.5266809, 0.4660435, -0.2988983, 1, 1, 1, 1, 1,
0.5376433, 0.07126378, 2.665633, 1, 1, 1, 1, 1,
0.5394743, 0.5498987, -0.2506103, 1, 1, 1, 1, 1,
0.5426036, 0.7404595, 1.159705, 1, 1, 1, 1, 1,
0.5439791, 2.630535, 0.3186485, 1, 1, 1, 1, 1,
0.5487697, -0.9025139, 3.379565, 1, 1, 1, 1, 1,
0.5497905, 0.6355531, 0.7502154, 1, 1, 1, 1, 1,
0.5511506, -0.7330752, 2.551365, 1, 1, 1, 1, 1,
0.5648228, 1.023355, 0.1010405, 1, 1, 1, 1, 1,
0.5658667, -2.08262, 2.933249, 1, 1, 1, 1, 1,
0.5663662, -0.7746061, 2.322914, 1, 1, 1, 1, 1,
0.5707296, -0.402553, 1.353831, 1, 1, 1, 1, 1,
0.571357, -0.1068581, 2.302689, 1, 1, 1, 1, 1,
0.5743228, 0.03053285, -1.122966, 0, 0, 1, 1, 1,
0.57639, -0.7064485, 3.228643, 1, 0, 0, 1, 1,
0.5798287, 0.451454, -0.614816, 1, 0, 0, 1, 1,
0.5811179, -0.4941652, 2.939387, 1, 0, 0, 1, 1,
0.5882068, 0.734221, 0.7195122, 1, 0, 0, 1, 1,
0.5911431, 0.0732317, 1.940469, 1, 0, 0, 1, 1,
0.6062312, -0.6590537, 2.577929, 0, 0, 0, 1, 1,
0.6138082, -0.836138, 3.409818, 0, 0, 0, 1, 1,
0.6179277, -0.5959958, 3.649413, 0, 0, 0, 1, 1,
0.6187737, -0.3154271, 2.104435, 0, 0, 0, 1, 1,
0.6210694, -0.6653203, 3.275446, 0, 0, 0, 1, 1,
0.6222817, 1.008083, 0.8302338, 0, 0, 0, 1, 1,
0.6224584, -1.962796, 4.563416, 0, 0, 0, 1, 1,
0.6265354, 1.144644, 1.963478, 1, 1, 1, 1, 1,
0.6288105, -0.9075355, 3.740527, 1, 1, 1, 1, 1,
0.6311413, -0.4110261, 2.778722, 1, 1, 1, 1, 1,
0.63184, -1.245378, 2.915537, 1, 1, 1, 1, 1,
0.6324855, 0.7913237, -0.559271, 1, 1, 1, 1, 1,
0.6350983, 1.256772, 2.546177, 1, 1, 1, 1, 1,
0.6375962, 0.9643474, -0.1576106, 1, 1, 1, 1, 1,
0.6389201, -0.6755791, 2.547145, 1, 1, 1, 1, 1,
0.6401154, 0.1480079, -0.174895, 1, 1, 1, 1, 1,
0.6456109, -0.3344668, 2.014447, 1, 1, 1, 1, 1,
0.6491544, 1.785882, -0.2146152, 1, 1, 1, 1, 1,
0.6502402, 0.7728227, 1.553208, 1, 1, 1, 1, 1,
0.6576971, 0.925176, 0.3025718, 1, 1, 1, 1, 1,
0.6600773, 0.5102674, 0.7908758, 1, 1, 1, 1, 1,
0.6633378, 0.8356393, 0.1269081, 1, 1, 1, 1, 1,
0.6661103, 0.2656833, 0.1282521, 0, 0, 1, 1, 1,
0.6708577, -0.5272169, 2.297013, 1, 0, 0, 1, 1,
0.6711212, -1.0743, 1.488566, 1, 0, 0, 1, 1,
0.6732466, -1.660807, 1.829252, 1, 0, 0, 1, 1,
0.6866509, 1.718736, 1.18509, 1, 0, 0, 1, 1,
0.687241, -0.4775485, 1.756168, 1, 0, 0, 1, 1,
0.6909472, 0.3123015, 0.2494894, 0, 0, 0, 1, 1,
0.6922021, 0.09750522, 1.259839, 0, 0, 0, 1, 1,
0.6923702, -2.377903, 4.018611, 0, 0, 0, 1, 1,
0.6931036, -1.055602, 1.730563, 0, 0, 0, 1, 1,
0.6948484, -0.7888629, -0.21145, 0, 0, 0, 1, 1,
0.6951005, 0.5309391, 0.7023994, 0, 0, 0, 1, 1,
0.6953882, -0.130164, 4.179864, 0, 0, 0, 1, 1,
0.6994382, 0.257372, 2.158717, 1, 1, 1, 1, 1,
0.7004532, -0.4344492, 1.74274, 1, 1, 1, 1, 1,
0.7046909, 0.05608702, 1.724313, 1, 1, 1, 1, 1,
0.7056466, -1.061218, 3.406786, 1, 1, 1, 1, 1,
0.7112796, -0.1485029, 2.225374, 1, 1, 1, 1, 1,
0.7115285, -1.148642, 1.988158, 1, 1, 1, 1, 1,
0.7224301, 2.734939, 1.531586, 1, 1, 1, 1, 1,
0.7245701, -0.4121458, 3.465541, 1, 1, 1, 1, 1,
0.7255326, -0.6875444, 1.150248, 1, 1, 1, 1, 1,
0.7259179, -0.6135393, 1.436271, 1, 1, 1, 1, 1,
0.7270562, -1.344256, 1.908626, 1, 1, 1, 1, 1,
0.7281957, -0.3364061, 2.619645, 1, 1, 1, 1, 1,
0.7283518, -0.7731618, 1.315813, 1, 1, 1, 1, 1,
0.7286668, 0.207384, 1.109674, 1, 1, 1, 1, 1,
0.732222, -0.1875408, 0.8013352, 1, 1, 1, 1, 1,
0.7324326, 2.148339, 0.7638447, 0, 0, 1, 1, 1,
0.7382687, 0.1613064, -0.6321858, 1, 0, 0, 1, 1,
0.7397251, 0.3158833, 1.590983, 1, 0, 0, 1, 1,
0.7400967, -0.4587908, 0.9958562, 1, 0, 0, 1, 1,
0.7439705, -0.3019679, 2.210749, 1, 0, 0, 1, 1,
0.745026, -0.3973931, 1.907134, 1, 0, 0, 1, 1,
0.7478324, 0.9288762, 0.1791296, 0, 0, 0, 1, 1,
0.7497321, 0.1984576, 0.8542259, 0, 0, 0, 1, 1,
0.7540546, -0.8175677, 2.913026, 0, 0, 0, 1, 1,
0.7568614, -0.7584193, 4.025599, 0, 0, 0, 1, 1,
0.7574885, -0.6090507, 0.4130484, 0, 0, 0, 1, 1,
0.7609827, 0.7835435, 1.403677, 0, 0, 0, 1, 1,
0.7626911, -0.3055218, 1.44527, 0, 0, 0, 1, 1,
0.7637282, 0.5041792, 0.9662251, 1, 1, 1, 1, 1,
0.7712085, 0.2780833, 1.457686, 1, 1, 1, 1, 1,
0.7725544, 1.967828, 0.6667549, 1, 1, 1, 1, 1,
0.7748873, 1.06066, 1.327519, 1, 1, 1, 1, 1,
0.775872, -0.1996741, 1.888546, 1, 1, 1, 1, 1,
0.7788855, 1.068313, 0.04369775, 1, 1, 1, 1, 1,
0.7792487, -0.08417697, 0.08685856, 1, 1, 1, 1, 1,
0.7892424, -0.3430424, 2.221813, 1, 1, 1, 1, 1,
0.7924075, -0.524422, 3.271404, 1, 1, 1, 1, 1,
0.7976345, 0.5960776, -0.3939572, 1, 1, 1, 1, 1,
0.8101634, 1.359107, -0.3688113, 1, 1, 1, 1, 1,
0.8140643, -2.460485, 2.83515, 1, 1, 1, 1, 1,
0.8158504, -0.3841383, 2.35146, 1, 1, 1, 1, 1,
0.8203418, -0.5678345, 3.061854, 1, 1, 1, 1, 1,
0.8240994, 1.291814, 1.349715, 1, 1, 1, 1, 1,
0.8295292, -2.503006, 3.410998, 0, 0, 1, 1, 1,
0.8320464, 0.4123714, 1.065688, 1, 0, 0, 1, 1,
0.8332261, 0.002183099, 3.251436, 1, 0, 0, 1, 1,
0.833716, -0.8978018, 1.379948, 1, 0, 0, 1, 1,
0.8339442, -0.2778583, 3.58403, 1, 0, 0, 1, 1,
0.8345079, 0.3758465, 1.763811, 1, 0, 0, 1, 1,
0.8365896, -0.2242014, 2.892258, 0, 0, 0, 1, 1,
0.8366488, 0.04067988, 1.173647, 0, 0, 0, 1, 1,
0.8381003, 0.1867504, 1.924565, 0, 0, 0, 1, 1,
0.8390948, -0.1880374, 1.913264, 0, 0, 0, 1, 1,
0.8428962, -0.4804481, 2.553917, 0, 0, 0, 1, 1,
0.8500172, 0.1646912, 2.365218, 0, 0, 0, 1, 1,
0.8552259, -0.2738824, 2.029493, 0, 0, 0, 1, 1,
0.8576666, -1.096923, -0.2245422, 1, 1, 1, 1, 1,
0.8584366, 0.00483585, 0.8939947, 1, 1, 1, 1, 1,
0.863065, 0.1546993, 2.295091, 1, 1, 1, 1, 1,
0.8710456, -1.061851, 4.719461, 1, 1, 1, 1, 1,
0.874384, 2.405439, -0.3605407, 1, 1, 1, 1, 1,
0.8766298, 1.038383, 0.2133728, 1, 1, 1, 1, 1,
0.8780836, 0.5882666, -0.4313852, 1, 1, 1, 1, 1,
0.878372, 1.196842, -0.3473869, 1, 1, 1, 1, 1,
0.8805683, 0.09584347, 3.105592, 1, 1, 1, 1, 1,
0.880793, 1.455487, 2.224581, 1, 1, 1, 1, 1,
0.8857363, -1.36022, 3.234613, 1, 1, 1, 1, 1,
0.8907786, 0.2738226, 1.719143, 1, 1, 1, 1, 1,
0.8918409, -1.519277, 2.048667, 1, 1, 1, 1, 1,
0.9068782, 1.01438, -0.3966843, 1, 1, 1, 1, 1,
0.9071435, 2.509898, -0.3972583, 1, 1, 1, 1, 1,
0.9078339, 1.297574, 0.4173223, 0, 0, 1, 1, 1,
0.9090505, 0.7411323, 1.051462, 1, 0, 0, 1, 1,
0.9125519, 1.179792, 1.052177, 1, 0, 0, 1, 1,
0.9175355, 0.4544756, 1.464733, 1, 0, 0, 1, 1,
0.9179011, -0.6117761, 1.757278, 1, 0, 0, 1, 1,
0.9186034, 0.6533417, -0.8549547, 1, 0, 0, 1, 1,
0.9217848, -0.5453097, 3.256991, 0, 0, 0, 1, 1,
0.9223315, -0.4237815, 0.4901128, 0, 0, 0, 1, 1,
0.9245431, -0.03161031, 0.6235091, 0, 0, 0, 1, 1,
0.9255319, -0.5072287, 2.857548, 0, 0, 0, 1, 1,
0.9268911, -0.8538231, 1.385178, 0, 0, 0, 1, 1,
0.9270084, -0.9311037, 1.631893, 0, 0, 0, 1, 1,
0.9289682, 0.5178065, 1.062219, 0, 0, 0, 1, 1,
0.937781, -1.223325, 2.061591, 1, 1, 1, 1, 1,
0.9392467, 0.3133876, 1.729318, 1, 1, 1, 1, 1,
0.9442902, 0.3909988, 0.5452908, 1, 1, 1, 1, 1,
0.9475987, 0.6813134, 0.527207, 1, 1, 1, 1, 1,
0.9585764, -0.8016009, 2.548173, 1, 1, 1, 1, 1,
0.9617359, 0.9956834, 0.5228114, 1, 1, 1, 1, 1,
0.9667707, -0.7034383, 2.671089, 1, 1, 1, 1, 1,
0.9839903, 1.371767, -1.321944, 1, 1, 1, 1, 1,
0.9854136, -1.342548, 1.719195, 1, 1, 1, 1, 1,
0.9885684, 1.603913, -0.2319662, 1, 1, 1, 1, 1,
0.9919883, -0.5820477, 2.895017, 1, 1, 1, 1, 1,
0.9934495, -1.116652, 2.270048, 1, 1, 1, 1, 1,
0.9985076, 1.379669, 0.6782815, 1, 1, 1, 1, 1,
0.9999015, -1.04141, 1.583622, 1, 1, 1, 1, 1,
1.002328, -0.2523886, 1.686631, 1, 1, 1, 1, 1,
1.009145, 0.4322586, 0.5894899, 0, 0, 1, 1, 1,
1.011608, -0.3292369, 1.578449, 1, 0, 0, 1, 1,
1.012387, -1.151479, 2.855798, 1, 0, 0, 1, 1,
1.017828, 0.5171091, 0.9110197, 1, 0, 0, 1, 1,
1.017965, 1.834692, 1.96434, 1, 0, 0, 1, 1,
1.019308, 0.3307828, 0.7306767, 1, 0, 0, 1, 1,
1.02027, -1.360131, 2.734072, 0, 0, 0, 1, 1,
1.034561, -1.06359, 3.346215, 0, 0, 0, 1, 1,
1.034792, 1.113154, 0.569319, 0, 0, 0, 1, 1,
1.035944, 1.837253, 0.9062731, 0, 0, 0, 1, 1,
1.041458, 0.9663581, -0.5121407, 0, 0, 0, 1, 1,
1.044036, 0.1840947, 1.499604, 0, 0, 0, 1, 1,
1.05707, 0.4943316, 0.6466412, 0, 0, 0, 1, 1,
1.062149, 0.348105, 1.139557, 1, 1, 1, 1, 1,
1.075674, -0.4609425, 2.489246, 1, 1, 1, 1, 1,
1.077772, -1.252496, 2.289538, 1, 1, 1, 1, 1,
1.077896, 0.978942, 1.076983, 1, 1, 1, 1, 1,
1.080228, 0.589928, 0.5299498, 1, 1, 1, 1, 1,
1.092667, -0.7912482, 3.229929, 1, 1, 1, 1, 1,
1.094926, 0.6010528, 1.727096, 1, 1, 1, 1, 1,
1.096642, -1.084955, 2.940351, 1, 1, 1, 1, 1,
1.101991, 0.2909956, 2.183181, 1, 1, 1, 1, 1,
1.11183, 0.7092519, -0.855431, 1, 1, 1, 1, 1,
1.116644, -0.1767228, 2.473936, 1, 1, 1, 1, 1,
1.133384, 0.1958605, -1.135942, 1, 1, 1, 1, 1,
1.133715, 0.3228687, 0.9320617, 1, 1, 1, 1, 1,
1.134233, 1.04806, 1.121639, 1, 1, 1, 1, 1,
1.137515, 0.2246474, 0.6903167, 1, 1, 1, 1, 1,
1.138146, -1.113102, 3.575424, 0, 0, 1, 1, 1,
1.144037, -0.319194, -0.3974614, 1, 0, 0, 1, 1,
1.144325, 0.7042952, -0.3808501, 1, 0, 0, 1, 1,
1.144578, -0.6026776, 1.578605, 1, 0, 0, 1, 1,
1.14521, 1.263395, -0.2231073, 1, 0, 0, 1, 1,
1.15408, -2.059961, 2.750527, 1, 0, 0, 1, 1,
1.178416, -0.2358104, 0.5904074, 0, 0, 0, 1, 1,
1.180216, 0.4214478, 1.313632, 0, 0, 0, 1, 1,
1.185358, -0.770426, 3.125144, 0, 0, 0, 1, 1,
1.188462, -0.3889428, 0.8359732, 0, 0, 0, 1, 1,
1.189496, -0.6634476, 2.011397, 0, 0, 0, 1, 1,
1.18953, -0.1215424, 3.672043, 0, 0, 0, 1, 1,
1.207422, 1.711065, 0.1477868, 0, 0, 0, 1, 1,
1.20816, 0.4063351, 0.9074489, 1, 1, 1, 1, 1,
1.210754, 0.6701096, 1.44071, 1, 1, 1, 1, 1,
1.213092, -0.07413978, 2.199347, 1, 1, 1, 1, 1,
1.214992, -0.06862698, 1.68866, 1, 1, 1, 1, 1,
1.225374, -0.413144, 1.965456, 1, 1, 1, 1, 1,
1.235501, -0.9327666, 3.167151, 1, 1, 1, 1, 1,
1.244569, 0.6241601, 0.3425621, 1, 1, 1, 1, 1,
1.245873, -0.5909652, 1.913231, 1, 1, 1, 1, 1,
1.250787, 0.7720547, -0.4253285, 1, 1, 1, 1, 1,
1.254164, 1.872838, -0.5691081, 1, 1, 1, 1, 1,
1.260795, -0.5728196, 3.082146, 1, 1, 1, 1, 1,
1.261632, -1.615814, 2.623489, 1, 1, 1, 1, 1,
1.26793, 0.6388318, 1.682171, 1, 1, 1, 1, 1,
1.30615, 0.007375387, 2.38448, 1, 1, 1, 1, 1,
1.311828, -0.6642025, 2.432602, 1, 1, 1, 1, 1,
1.317102, -1.604915, 1.311357, 0, 0, 1, 1, 1,
1.317704, -1.266771, 2.25004, 1, 0, 0, 1, 1,
1.320808, -1.585006, 1.927222, 1, 0, 0, 1, 1,
1.322692, 0.4607342, 1.164318, 1, 0, 0, 1, 1,
1.322896, -1.208639, 0.7664849, 1, 0, 0, 1, 1,
1.32671, -1.469912, 1.600751, 1, 0, 0, 1, 1,
1.32833, -0.3566927, 1.464295, 0, 0, 0, 1, 1,
1.330963, -1.473086, 3.564117, 0, 0, 0, 1, 1,
1.338682, -0.2359752, 0.3082077, 0, 0, 0, 1, 1,
1.350739, -0.6372718, 1.163574, 0, 0, 0, 1, 1,
1.381158, 2.195033, 0.9963089, 0, 0, 0, 1, 1,
1.397956, -0.7583135, 1.682485, 0, 0, 0, 1, 1,
1.403507, -0.8400348, 1.466766, 0, 0, 0, 1, 1,
1.404549, 0.3479176, 2.290819, 1, 1, 1, 1, 1,
1.407303, 1.708573, 1.677535, 1, 1, 1, 1, 1,
1.414452, -2.341255, 2.952482, 1, 1, 1, 1, 1,
1.415078, -0.7619385, 1.437642, 1, 1, 1, 1, 1,
1.41855, 0.3217365, 0.3221309, 1, 1, 1, 1, 1,
1.422491, 0.5023236, 0.3158165, 1, 1, 1, 1, 1,
1.424186, 1.074165, 0.3777986, 1, 1, 1, 1, 1,
1.45134, -0.7477342, 2.983634, 1, 1, 1, 1, 1,
1.462856, -0.003801654, 1.722123, 1, 1, 1, 1, 1,
1.463301, -0.9253175, 4.951865, 1, 1, 1, 1, 1,
1.463452, 1.050791, 0.9316388, 1, 1, 1, 1, 1,
1.468118, 0.6709521, 2.780443, 1, 1, 1, 1, 1,
1.471877, -1.525257, 3.801159, 1, 1, 1, 1, 1,
1.475506, -0.1974275, 0.9433236, 1, 1, 1, 1, 1,
1.475538, -0.1814098, 1.238977, 1, 1, 1, 1, 1,
1.487406, -0.6974914, 2.382601, 0, 0, 1, 1, 1,
1.488508, -0.9229149, 1.577617, 1, 0, 0, 1, 1,
1.491715, -0.9501979, 2.963469, 1, 0, 0, 1, 1,
1.492639, 1.088297, 0.7380545, 1, 0, 0, 1, 1,
1.511946, -1.473223, 1.730281, 1, 0, 0, 1, 1,
1.514596, -1.362563, 3.440537, 1, 0, 0, 1, 1,
1.51748, 0.02896461, 3.592741, 0, 0, 0, 1, 1,
1.521286, -1.504455, 2.462201, 0, 0, 0, 1, 1,
1.534889, -2.385392, 1.847823, 0, 0, 0, 1, 1,
1.538656, 0.1427539, 2.03205, 0, 0, 0, 1, 1,
1.539205, 0.3822878, 0.1062621, 0, 0, 0, 1, 1,
1.545934, -0.9331781, 2.097816, 0, 0, 0, 1, 1,
1.580943, 1.879072, 0.246331, 0, 0, 0, 1, 1,
1.59915, 0.5168252, 1.267154, 1, 1, 1, 1, 1,
1.601706, -0.236835, 2.908718, 1, 1, 1, 1, 1,
1.605959, 0.1573853, 1.885372, 1, 1, 1, 1, 1,
1.625709, 0.4295219, -0.6298783, 1, 1, 1, 1, 1,
1.634959, 1.383587, 0.7582651, 1, 1, 1, 1, 1,
1.643948, 0.8212447, 1.350019, 1, 1, 1, 1, 1,
1.650901, -1.826045, 3.52924, 1, 1, 1, 1, 1,
1.65477, -0.4715434, 0.4096274, 1, 1, 1, 1, 1,
1.665315, -0.8237099, 3.257482, 1, 1, 1, 1, 1,
1.670052, 1.555359, -0.08517409, 1, 1, 1, 1, 1,
1.675976, 1.063825, 1.591934, 1, 1, 1, 1, 1,
1.686466, -0.915348, 2.029649, 1, 1, 1, 1, 1,
1.70496, -0.581131, 3.190787, 1, 1, 1, 1, 1,
1.711878, 1.536117, 0.3991787, 1, 1, 1, 1, 1,
1.715666, 0.3830671, 1.073486, 1, 1, 1, 1, 1,
1.73756, 0.7749771, 0.8622894, 0, 0, 1, 1, 1,
1.748391, -0.8733636, 0.7567536, 1, 0, 0, 1, 1,
1.759638, 1.340177, 0.1539557, 1, 0, 0, 1, 1,
1.776918, -0.2149795, 2.851015, 1, 0, 0, 1, 1,
1.778159, 0.7774716, 0.5417697, 1, 0, 0, 1, 1,
1.786078, 0.4933134, 1.955816, 1, 0, 0, 1, 1,
1.799513, -0.8913776, 2.487495, 0, 0, 0, 1, 1,
1.804242, 0.4774956, 1.595689, 0, 0, 0, 1, 1,
1.805887, -2.724225, 3.814842, 0, 0, 0, 1, 1,
1.808418, -0.7161868, 2.849599, 0, 0, 0, 1, 1,
1.8117, -2.165389, 2.664195, 0, 0, 0, 1, 1,
1.815039, -0.3225435, 1.130368, 0, 0, 0, 1, 1,
1.824908, -1.170213, 3.02128, 0, 0, 0, 1, 1,
1.837063, 1.682715, 1.517207, 1, 1, 1, 1, 1,
1.875532, 0.3155119, 1.160926, 1, 1, 1, 1, 1,
1.878414, 1.253971, -0.7834692, 1, 1, 1, 1, 1,
1.88281, 1.452096, 1.1519, 1, 1, 1, 1, 1,
1.897964, 0.3211529, 0.4766803, 1, 1, 1, 1, 1,
1.90173, 0.1136512, 1.373907, 1, 1, 1, 1, 1,
1.928043, -0.006148677, 0.08130165, 1, 1, 1, 1, 1,
1.929758, -1.869925, 1.576306, 1, 1, 1, 1, 1,
1.952491, 0.4261597, 1.5186, 1, 1, 1, 1, 1,
1.995708, 0.01567454, 0.113378, 1, 1, 1, 1, 1,
2.007248, -2.031598, 2.641138, 1, 1, 1, 1, 1,
2.009454, 2.43212, 0.6286069, 1, 1, 1, 1, 1,
2.018694, -0.5698611, 0.6735256, 1, 1, 1, 1, 1,
2.05098, -0.897046, 2.565548, 1, 1, 1, 1, 1,
2.08934, 0.5221578, -0.3592476, 1, 1, 1, 1, 1,
2.091784, -0.254442, 2.635347, 0, 0, 1, 1, 1,
2.120416, -1.48277, 2.686625, 1, 0, 0, 1, 1,
2.135074, 1.325255, 1.202394, 1, 0, 0, 1, 1,
2.161816, 1.225246, 0.9695496, 1, 0, 0, 1, 1,
2.167966, 0.5072673, 2.015678, 1, 0, 0, 1, 1,
2.175854, 1.213127, -0.03890803, 1, 0, 0, 1, 1,
2.200645, -0.1057179, 0.3909262, 0, 0, 0, 1, 1,
2.213372, -1.150546, 3.453932, 0, 0, 0, 1, 1,
2.215477, 0.5971287, 1.362785, 0, 0, 0, 1, 1,
2.2281, 1.082167, 0.7487181, 0, 0, 0, 1, 1,
2.275146, -0.04643881, 2.231562, 0, 0, 0, 1, 1,
2.327192, 0.4641863, 3.26619, 0, 0, 0, 1, 1,
2.408288, -0.6154987, 1.55396, 0, 0, 0, 1, 1,
2.422981, -0.1359697, 2.124184, 1, 1, 1, 1, 1,
2.505368, 0.6749686, 0.7794794, 1, 1, 1, 1, 1,
2.656925, 0.1046863, 3.031579, 1, 1, 1, 1, 1,
2.78931, 0.2692772, 1.527761, 1, 1, 1, 1, 1,
2.957217, 0.4730837, 2.768049, 1, 1, 1, 1, 1,
3.02943, -0.9309142, 2.250974, 1, 1, 1, 1, 1,
3.181187, 2.166663, -1.097535, 1, 1, 1, 1, 1
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
var radius = 9.640869;
var distance = 33.86314;
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
mvMatrix.translate( -0.007312059, 0.1859014, 0.4620397 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.86314);
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