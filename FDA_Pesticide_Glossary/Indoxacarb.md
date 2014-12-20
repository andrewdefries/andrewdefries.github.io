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
-3.674573, 0.2875203, -0.7985783, 1, 0, 0, 1,
-3.600303, -0.8800271, -2.362998, 1, 0.007843138, 0, 1,
-3.024349, -1.319466, -1.024656, 1, 0.01176471, 0, 1,
-2.756845, 0.165448, -2.7084, 1, 0.01960784, 0, 1,
-2.719818, 0.7729291, 0.509413, 1, 0.02352941, 0, 1,
-2.67667, -1.110088, -1.661273, 1, 0.03137255, 0, 1,
-2.509791, -0.0469115, -1.185868, 1, 0.03529412, 0, 1,
-2.494932, 0.5662749, -0.3241426, 1, 0.04313726, 0, 1,
-2.466373, -0.06849061, -0.991053, 1, 0.04705882, 0, 1,
-2.460714, -2.011914, -1.840459, 1, 0.05490196, 0, 1,
-2.410174, -0.5659487, -2.302167, 1, 0.05882353, 0, 1,
-2.356885, 0.3078873, -0.06496414, 1, 0.06666667, 0, 1,
-2.256577, -0.8678685, -3.243808, 1, 0.07058824, 0, 1,
-2.247955, -0.6663723, -1.512602, 1, 0.07843138, 0, 1,
-2.236991, 0.7179362, -1.034682, 1, 0.08235294, 0, 1,
-2.228578, -1.756486, -1.068326, 1, 0.09019608, 0, 1,
-2.171886, 0.3709874, -1.83332, 1, 0.09411765, 0, 1,
-2.141127, 0.4672734, -0.2099914, 1, 0.1019608, 0, 1,
-2.074909, -0.5567609, -2.238151, 1, 0.1098039, 0, 1,
-2.020961, -0.5672203, -0.9740722, 1, 0.1137255, 0, 1,
-2.019793, 0.7199952, -2.761057, 1, 0.1215686, 0, 1,
-2.01274, -1.323914, -3.736138, 1, 0.1254902, 0, 1,
-1.909127, -0.4449722, -2.267313, 1, 0.1333333, 0, 1,
-1.895478, 1.965754, -1.412678, 1, 0.1372549, 0, 1,
-1.876713, -2.19958, -3.467608, 1, 0.145098, 0, 1,
-1.869012, 1.419096, -1.908987, 1, 0.1490196, 0, 1,
-1.866825, 0.3665154, -2.568969, 1, 0.1568628, 0, 1,
-1.85275, 1.662136, -0.02546959, 1, 0.1607843, 0, 1,
-1.826269, -1.682332, -1.588419, 1, 0.1686275, 0, 1,
-1.811632, 0.2266795, -2.388892, 1, 0.172549, 0, 1,
-1.801797, -0.903998, -1.338741, 1, 0.1803922, 0, 1,
-1.793505, 0.6399243, -0.9890116, 1, 0.1843137, 0, 1,
-1.790608, -1.798376, -1.18215, 1, 0.1921569, 0, 1,
-1.786944, -0.3274126, -0.8309608, 1, 0.1960784, 0, 1,
-1.773581, -6.675848e-05, -1.830683, 1, 0.2039216, 0, 1,
-1.745508, -0.5620815, -0.1492847, 1, 0.2117647, 0, 1,
-1.743536, 1.174835, -1.20939, 1, 0.2156863, 0, 1,
-1.735126, 0.7008991, -1.547371, 1, 0.2235294, 0, 1,
-1.731485, 0.2347097, -0.1452584, 1, 0.227451, 0, 1,
-1.696849, -0.8754227, -1.235743, 1, 0.2352941, 0, 1,
-1.679509, -2.65819, -2.863465, 1, 0.2392157, 0, 1,
-1.672469, 0.2159599, -2.137241, 1, 0.2470588, 0, 1,
-1.671617, 0.1870259, -2.32117, 1, 0.2509804, 0, 1,
-1.669817, 0.2615315, -3.34754, 1, 0.2588235, 0, 1,
-1.666133, -0.1521405, -1.057111, 1, 0.2627451, 0, 1,
-1.660078, -1.938038, -2.701665, 1, 0.2705882, 0, 1,
-1.648927, 0.4430048, -2.673836, 1, 0.2745098, 0, 1,
-1.640876, 0.06735294, -0.7020853, 1, 0.282353, 0, 1,
-1.639866, -1.171697, -2.701128, 1, 0.2862745, 0, 1,
-1.631816, -0.3515922, -1.663029, 1, 0.2941177, 0, 1,
-1.622525, -1.340913, -1.034773, 1, 0.3019608, 0, 1,
-1.60909, -2.65777, -3.484254, 1, 0.3058824, 0, 1,
-1.579698, -0.273262, -0.02688221, 1, 0.3137255, 0, 1,
-1.545278, -0.2262136, -2.17749, 1, 0.3176471, 0, 1,
-1.542814, -2.570549, -1.736037, 1, 0.3254902, 0, 1,
-1.51844, 0.9163449, 0.1579408, 1, 0.3294118, 0, 1,
-1.508167, 0.08668827, -2.331211, 1, 0.3372549, 0, 1,
-1.482665, -1.026794, -1.339156, 1, 0.3411765, 0, 1,
-1.478665, -0.2265069, -2.301883, 1, 0.3490196, 0, 1,
-1.478184, -0.1632388, -3.075154, 1, 0.3529412, 0, 1,
-1.474272, -0.09430703, -1.492011, 1, 0.3607843, 0, 1,
-1.470708, -0.2737357, -1.422272, 1, 0.3647059, 0, 1,
-1.461582, 0.612525, -0.07484446, 1, 0.372549, 0, 1,
-1.454493, -0.5670841, -2.806638, 1, 0.3764706, 0, 1,
-1.446878, -1.038584, -2.348668, 1, 0.3843137, 0, 1,
-1.433632, 0.2780988, -1.028388, 1, 0.3882353, 0, 1,
-1.432602, -1.025932, -1.314981, 1, 0.3960784, 0, 1,
-1.420719, -1.977423, -2.270125, 1, 0.4039216, 0, 1,
-1.416783, -2.893932, -2.210601, 1, 0.4078431, 0, 1,
-1.402655, 1.25223, 0.5341083, 1, 0.4156863, 0, 1,
-1.398834, -1.836397, -3.715098, 1, 0.4196078, 0, 1,
-1.395619, 0.09375039, -3.528755, 1, 0.427451, 0, 1,
-1.384283, -0.6866023, -2.254619, 1, 0.4313726, 0, 1,
-1.373239, -0.5862361, -2.198091, 1, 0.4392157, 0, 1,
-1.366469, -0.04462159, -2.561341, 1, 0.4431373, 0, 1,
-1.36051, 0.6701638, -1.659824, 1, 0.4509804, 0, 1,
-1.354641, -1.837202, -3.847841, 1, 0.454902, 0, 1,
-1.354406, 0.5126877, -1.299031, 1, 0.4627451, 0, 1,
-1.335007, -0.3525307, -2.244735, 1, 0.4666667, 0, 1,
-1.331797, 0.5178862, -1.468413, 1, 0.4745098, 0, 1,
-1.314711, -0.05928506, -1.953405, 1, 0.4784314, 0, 1,
-1.314168, -1.818611, -1.822567, 1, 0.4862745, 0, 1,
-1.30537, 1.068207, -0.3579682, 1, 0.4901961, 0, 1,
-1.304721, -0.4705791, -0.7652386, 1, 0.4980392, 0, 1,
-1.303096, 0.5679787, -1.238714, 1, 0.5058824, 0, 1,
-1.297297, -0.7089512, -1.307491, 1, 0.509804, 0, 1,
-1.296847, -0.7007721, -0.09798703, 1, 0.5176471, 0, 1,
-1.293861, -0.6142837, -1.197875, 1, 0.5215687, 0, 1,
-1.293504, 0.03421484, -1.421595, 1, 0.5294118, 0, 1,
-1.291817, -1.603596, -2.257371, 1, 0.5333334, 0, 1,
-1.287495, -0.4502508, -1.527498, 1, 0.5411765, 0, 1,
-1.285679, 1.007969, 0.3068483, 1, 0.5450981, 0, 1,
-1.281837, 0.3794278, 0.3470783, 1, 0.5529412, 0, 1,
-1.277142, -0.8177528, -1.662503, 1, 0.5568628, 0, 1,
-1.275992, 0.1700666, -2.195561, 1, 0.5647059, 0, 1,
-1.27091, -0.6047361, -3.282435, 1, 0.5686275, 0, 1,
-1.266765, -0.6524972, -1.001738, 1, 0.5764706, 0, 1,
-1.264558, -1.431661, -3.798929, 1, 0.5803922, 0, 1,
-1.263761, -0.2150253, -1.270223, 1, 0.5882353, 0, 1,
-1.260469, -0.3125959, -3.213056, 1, 0.5921569, 0, 1,
-1.253297, -0.335793, -0.9266493, 1, 0.6, 0, 1,
-1.252066, 0.6452248, -1.382365, 1, 0.6078432, 0, 1,
-1.251848, 0.5248347, -0.5041972, 1, 0.6117647, 0, 1,
-1.246518, -0.5137998, -0.8926118, 1, 0.6196079, 0, 1,
-1.239236, -0.04722085, -1.491206, 1, 0.6235294, 0, 1,
-1.233323, -0.5340004, -0.8349332, 1, 0.6313726, 0, 1,
-1.207489, -0.8986575, -1.823985, 1, 0.6352941, 0, 1,
-1.207004, 0.4488692, -0.9597918, 1, 0.6431373, 0, 1,
-1.20572, -0.2270176, -1.247704, 1, 0.6470588, 0, 1,
-1.205342, 1.622966, -0.4481493, 1, 0.654902, 0, 1,
-1.205105, 0.5864462, -0.3155589, 1, 0.6588235, 0, 1,
-1.197063, -0.6064073, -2.470289, 1, 0.6666667, 0, 1,
-1.195851, -0.8996006, -1.766426, 1, 0.6705883, 0, 1,
-1.189179, 0.2488985, -0.9196538, 1, 0.6784314, 0, 1,
-1.180769, 0.7887698, 0.06986368, 1, 0.682353, 0, 1,
-1.18005, -0.08046601, -2.081484, 1, 0.6901961, 0, 1,
-1.177459, 0.535665, 0.1544233, 1, 0.6941177, 0, 1,
-1.170038, -0.3686144, -1.588926, 1, 0.7019608, 0, 1,
-1.16732, 0.9727544, -0.9704744, 1, 0.7098039, 0, 1,
-1.166924, -0.6475068, -1.193553, 1, 0.7137255, 0, 1,
-1.162477, -2.796753, -2.726821, 1, 0.7215686, 0, 1,
-1.162442, -0.7914333, -2.426747, 1, 0.7254902, 0, 1,
-1.125535, 0.5080035, -0.908023, 1, 0.7333333, 0, 1,
-1.1251, 0.7206492, 1.396297, 1, 0.7372549, 0, 1,
-1.124769, -1.088597, -0.8156284, 1, 0.7450981, 0, 1,
-1.122767, 0.4416123, -1.403702, 1, 0.7490196, 0, 1,
-1.114001, 0.1587135, -1.418859, 1, 0.7568628, 0, 1,
-1.113479, -0.7115016, -3.528761, 1, 0.7607843, 0, 1,
-1.106492, -0.3678762, -1.995581, 1, 0.7686275, 0, 1,
-1.102751, 0.1650141, 0.1717479, 1, 0.772549, 0, 1,
-1.099943, 0.3857107, -1.406668, 1, 0.7803922, 0, 1,
-1.092104, 1.739093, -2.144599, 1, 0.7843137, 0, 1,
-1.086575, 0.4854568, -0.9618369, 1, 0.7921569, 0, 1,
-1.086036, 2.033755, -0.7997175, 1, 0.7960784, 0, 1,
-1.084037, 1.047843, -0.6764943, 1, 0.8039216, 0, 1,
-1.074528, -0.5448747, -0.579688, 1, 0.8117647, 0, 1,
-1.06696, -0.5277373, -1.735012, 1, 0.8156863, 0, 1,
-1.064734, 1.49212, -0.9044888, 1, 0.8235294, 0, 1,
-1.060358, 0.2984406, -0.2270459, 1, 0.827451, 0, 1,
-1.053409, -1.137238, -3.172869, 1, 0.8352941, 0, 1,
-1.053253, -1.29591, -1.044157, 1, 0.8392157, 0, 1,
-1.043856, 1.192476, -0.7772239, 1, 0.8470588, 0, 1,
-1.042731, 0.3170692, 0.2751614, 1, 0.8509804, 0, 1,
-1.039562, 0.4583724, -1.865007, 1, 0.8588235, 0, 1,
-1.039342, -0.0002442928, -1.398936, 1, 0.8627451, 0, 1,
-1.034404, 0.431387, 0.774661, 1, 0.8705882, 0, 1,
-1.03215, -0.816142, -2.94415, 1, 0.8745098, 0, 1,
-1.028233, 0.1902463, -1.704083, 1, 0.8823529, 0, 1,
-1.027135, -1.982833, -3.186654, 1, 0.8862745, 0, 1,
-1.02712, -0.7537678, -2.116109, 1, 0.8941177, 0, 1,
-1.017342, -0.1533566, -0.4619183, 1, 0.8980392, 0, 1,
-1.014401, 1.071501, -0.7137958, 1, 0.9058824, 0, 1,
-1.010193, -0.4288955, -1.528613, 1, 0.9137255, 0, 1,
-1.009344, 0.4115007, -2.295018, 1, 0.9176471, 0, 1,
-1.008014, 0.6946777, -0.5619733, 1, 0.9254902, 0, 1,
-1.003406, -0.7136016, -2.425145, 1, 0.9294118, 0, 1,
-1.000195, -0.2297601, -1.216624, 1, 0.9372549, 0, 1,
-0.9994314, -1.719574, -0.887112, 1, 0.9411765, 0, 1,
-0.998276, 1.59354, -0.4283254, 1, 0.9490196, 0, 1,
-0.9943567, 1.464684, -0.9652609, 1, 0.9529412, 0, 1,
-0.9929229, 0.8065607, 0.7023597, 1, 0.9607843, 0, 1,
-0.9888992, -1.53948, -4.312219, 1, 0.9647059, 0, 1,
-0.9865558, -0.338165, -1.172038, 1, 0.972549, 0, 1,
-0.967381, 0.4541733, -0.5785956, 1, 0.9764706, 0, 1,
-0.9672465, -1.333914, -2.893045, 1, 0.9843137, 0, 1,
-0.9622902, -1.172712, -1.867841, 1, 0.9882353, 0, 1,
-0.9583704, -1.272986, -1.424174, 1, 0.9960784, 0, 1,
-0.9579228, -0.4808573, -3.933423, 0.9960784, 1, 0, 1,
-0.945347, -0.1785991, -3.142866, 0.9921569, 1, 0, 1,
-0.9382867, 0.50447, -3.190678, 0.9843137, 1, 0, 1,
-0.9374587, -0.3828457, -0.8213925, 0.9803922, 1, 0, 1,
-0.9356301, 2.421241, 0.6987638, 0.972549, 1, 0, 1,
-0.934563, -0.2604571, -1.037523, 0.9686275, 1, 0, 1,
-0.9243605, 2.941506, -0.9833509, 0.9607843, 1, 0, 1,
-0.9167577, 0.9339591, -1.912274, 0.9568627, 1, 0, 1,
-0.9158624, -1.203062, -3.343424, 0.9490196, 1, 0, 1,
-0.9064096, 1.069457, -0.9704891, 0.945098, 1, 0, 1,
-0.9015032, -0.1714651, -1.809188, 0.9372549, 1, 0, 1,
-0.8999217, -0.463598, -2.173328, 0.9333333, 1, 0, 1,
-0.8997484, -2.678364, -2.679979, 0.9254902, 1, 0, 1,
-0.8955824, 0.7254254, -3.440343, 0.9215686, 1, 0, 1,
-0.8916125, -0.2969993, -0.394674, 0.9137255, 1, 0, 1,
-0.8886395, -0.7575951, -0.639563, 0.9098039, 1, 0, 1,
-0.8870008, -0.947543, -2.762891, 0.9019608, 1, 0, 1,
-0.8854696, 0.4082175, -1.069947, 0.8941177, 1, 0, 1,
-0.8682263, -0.649707, -1.63779, 0.8901961, 1, 0, 1,
-0.8665206, -1.90503, -3.196932, 0.8823529, 1, 0, 1,
-0.863934, 1.876504, -0.4964402, 0.8784314, 1, 0, 1,
-0.8597024, 0.006097687, -0.8625725, 0.8705882, 1, 0, 1,
-0.8593941, -1.985371, -1.809819, 0.8666667, 1, 0, 1,
-0.8554539, 0.4758806, -1.533191, 0.8588235, 1, 0, 1,
-0.85417, -2.286041, -2.482632, 0.854902, 1, 0, 1,
-0.8534664, -1.188864, -1.792013, 0.8470588, 1, 0, 1,
-0.8526415, 1.14723, -0.1965753, 0.8431373, 1, 0, 1,
-0.8490064, -0.645732, -1.064877, 0.8352941, 1, 0, 1,
-0.8459356, -0.274864, -2.64792, 0.8313726, 1, 0, 1,
-0.8430598, -0.08274066, -1.532627, 0.8235294, 1, 0, 1,
-0.8366587, 0.4529409, -0.9606218, 0.8196079, 1, 0, 1,
-0.8253151, -0.4391957, -2.155871, 0.8117647, 1, 0, 1,
-0.8205224, 0.2206202, -0.5690408, 0.8078431, 1, 0, 1,
-0.8193277, -0.6763693, -1.105268, 0.8, 1, 0, 1,
-0.8161336, 0.2124601, -2.382638, 0.7921569, 1, 0, 1,
-0.8142518, 1.848011, -2.731861, 0.7882353, 1, 0, 1,
-0.8095851, -0.01283478, -3.611972, 0.7803922, 1, 0, 1,
-0.8066713, 0.1527011, -1.192789, 0.7764706, 1, 0, 1,
-0.8046534, 0.3837046, -1.38063, 0.7686275, 1, 0, 1,
-0.8041429, -0.266896, -2.66804, 0.7647059, 1, 0, 1,
-0.8027392, -3.054254, -2.483488, 0.7568628, 1, 0, 1,
-0.8000242, -0.3235669, -1.481132, 0.7529412, 1, 0, 1,
-0.7969398, -0.6316144, 0.1560809, 0.7450981, 1, 0, 1,
-0.7969081, 1.588837, -2.005277, 0.7411765, 1, 0, 1,
-0.7964826, 1.184536, -0.7249863, 0.7333333, 1, 0, 1,
-0.7931219, -0.7139437, -0.8387415, 0.7294118, 1, 0, 1,
-0.7917688, 0.9025081, 0.4186891, 0.7215686, 1, 0, 1,
-0.7864162, 0.2179201, -0.4106085, 0.7176471, 1, 0, 1,
-0.7780282, -1.509289, -2.210054, 0.7098039, 1, 0, 1,
-0.7755194, 1.447089, 1.342677, 0.7058824, 1, 0, 1,
-0.771413, -0.6331958, -1.778786, 0.6980392, 1, 0, 1,
-0.7648616, 0.579622, -0.3783019, 0.6901961, 1, 0, 1,
-0.7629372, -0.7488271, -0.87102, 0.6862745, 1, 0, 1,
-0.7611548, 0.7449625, 0.3389374, 0.6784314, 1, 0, 1,
-0.754642, -0.005662427, -1.16244, 0.6745098, 1, 0, 1,
-0.7505249, 0.4216395, -2.162223, 0.6666667, 1, 0, 1,
-0.7428448, 1.025972, -0.01165944, 0.6627451, 1, 0, 1,
-0.7418882, 1.328433, -0.3204091, 0.654902, 1, 0, 1,
-0.7411205, 0.1862274, -2.655902, 0.6509804, 1, 0, 1,
-0.741009, 0.5268881, -0.1051557, 0.6431373, 1, 0, 1,
-0.7393583, -2.396843, -2.363737, 0.6392157, 1, 0, 1,
-0.7348208, 2.426388, -1.277557, 0.6313726, 1, 0, 1,
-0.7314698, 0.6326371, -1.411836, 0.627451, 1, 0, 1,
-0.7278828, -1.29949, -2.828327, 0.6196079, 1, 0, 1,
-0.7218224, -0.3664029, -1.867918, 0.6156863, 1, 0, 1,
-0.7192574, 0.1286043, -1.242647, 0.6078432, 1, 0, 1,
-0.7133768, -0.4316041, -0.9540653, 0.6039216, 1, 0, 1,
-0.7131695, -0.5253745, -1.353559, 0.5960785, 1, 0, 1,
-0.7099826, 0.5502913, -0.3636993, 0.5882353, 1, 0, 1,
-0.7070411, 2.415451, -0.53348, 0.5843138, 1, 0, 1,
-0.705802, -0.0893067, -0.9140558, 0.5764706, 1, 0, 1,
-0.7045433, -0.7579358, -0.5099919, 0.572549, 1, 0, 1,
-0.7034089, 0.1028497, -0.6585776, 0.5647059, 1, 0, 1,
-0.699044, 1.588914, -0.2588597, 0.5607843, 1, 0, 1,
-0.698387, -2.584776, -2.581419, 0.5529412, 1, 0, 1,
-0.6952421, -0.3311871, -1.342304, 0.5490196, 1, 0, 1,
-0.6881803, 0.8932154, -0.3087066, 0.5411765, 1, 0, 1,
-0.680518, 0.3894993, -0.1841561, 0.5372549, 1, 0, 1,
-0.6781281, 0.878146, -0.07566173, 0.5294118, 1, 0, 1,
-0.6765578, -1.810725, -1.901115, 0.5254902, 1, 0, 1,
-0.6748894, -0.8462478, -1.147899, 0.5176471, 1, 0, 1,
-0.6721827, -0.598096, -3.127976, 0.5137255, 1, 0, 1,
-0.6706269, 0.1635299, -0.5294105, 0.5058824, 1, 0, 1,
-0.6701858, 0.4975221, -0.6754268, 0.5019608, 1, 0, 1,
-0.6696566, -1.364709, -3.500695, 0.4941176, 1, 0, 1,
-0.6655048, 0.02610464, -1.40524, 0.4862745, 1, 0, 1,
-0.6642471, 0.1523833, -3.174564, 0.4823529, 1, 0, 1,
-0.6619019, -0.2264997, -2.503295, 0.4745098, 1, 0, 1,
-0.6558586, -1.075558, -4.104823, 0.4705882, 1, 0, 1,
-0.6535969, -1.034437, -3.912628, 0.4627451, 1, 0, 1,
-0.6404829, 1.091591, -2.310742, 0.4588235, 1, 0, 1,
-0.6354633, 0.2901674, -2.455085, 0.4509804, 1, 0, 1,
-0.6299558, -0.8124356, -1.935024, 0.4470588, 1, 0, 1,
-0.6241175, 0.3871751, 0.6298201, 0.4392157, 1, 0, 1,
-0.6237982, -0.1692628, -1.903603, 0.4352941, 1, 0, 1,
-0.6230219, -1.115102, -2.226913, 0.427451, 1, 0, 1,
-0.6214025, 2.01551, -2.014585, 0.4235294, 1, 0, 1,
-0.6196969, -1.442423, -2.81929, 0.4156863, 1, 0, 1,
-0.6191431, 0.8480064, -0.5059832, 0.4117647, 1, 0, 1,
-0.6168833, 0.9731676, -0.273239, 0.4039216, 1, 0, 1,
-0.6140632, 0.5355948, -1.425378, 0.3960784, 1, 0, 1,
-0.6128792, -0.7681537, -3.476087, 0.3921569, 1, 0, 1,
-0.596729, -1.60807, -3.446865, 0.3843137, 1, 0, 1,
-0.593904, 0.2276303, -3.564154, 0.3803922, 1, 0, 1,
-0.5935912, 0.8382434, -0.7289246, 0.372549, 1, 0, 1,
-0.5935602, 0.07143513, -2.278476, 0.3686275, 1, 0, 1,
-0.5916902, 0.5729845, 1.499758, 0.3607843, 1, 0, 1,
-0.5892301, 0.5034998, -1.283745, 0.3568628, 1, 0, 1,
-0.5871032, 1.135254, -0.690665, 0.3490196, 1, 0, 1,
-0.5833456, 0.2557377, -1.923001, 0.345098, 1, 0, 1,
-0.5799655, 1.338544, 2.289631, 0.3372549, 1, 0, 1,
-0.579237, -1.559276, -3.984271, 0.3333333, 1, 0, 1,
-0.5777741, -1.143857, -3.673697, 0.3254902, 1, 0, 1,
-0.5757632, 0.1743359, 0.7889495, 0.3215686, 1, 0, 1,
-0.567625, -0.4986591, -1.472818, 0.3137255, 1, 0, 1,
-0.5660772, 1.794648, 1.505201, 0.3098039, 1, 0, 1,
-0.5648167, -0.4281065, -2.173318, 0.3019608, 1, 0, 1,
-0.5619469, 1.396411, -0.8205764, 0.2941177, 1, 0, 1,
-0.5593126, -0.8933686, -3.662725, 0.2901961, 1, 0, 1,
-0.5576161, 1.370857, 0.7326843, 0.282353, 1, 0, 1,
-0.5519029, 0.01308355, -2.412487, 0.2784314, 1, 0, 1,
-0.547987, -1.530791, -2.172949, 0.2705882, 1, 0, 1,
-0.5354506, -0.06759623, 0.2699426, 0.2666667, 1, 0, 1,
-0.5327193, 0.07578383, -0.6116745, 0.2588235, 1, 0, 1,
-0.5292009, 1.606181, -1.143849, 0.254902, 1, 0, 1,
-0.5275149, -0.9563856, -3.428854, 0.2470588, 1, 0, 1,
-0.5271668, 0.6081222, -0.1093262, 0.2431373, 1, 0, 1,
-0.5264705, -1.226573, -3.349299, 0.2352941, 1, 0, 1,
-0.5246004, -0.2691731, -3.529033, 0.2313726, 1, 0, 1,
-0.5235699, -0.556012, -2.27324, 0.2235294, 1, 0, 1,
-0.5233934, -1.00339, -2.489795, 0.2196078, 1, 0, 1,
-0.520538, 1.272516, -0.01174803, 0.2117647, 1, 0, 1,
-0.5181652, -0.707963, -3.13559, 0.2078431, 1, 0, 1,
-0.5165185, 0.08185484, -1.636015, 0.2, 1, 0, 1,
-0.5163336, -0.5840488, -3.706445, 0.1921569, 1, 0, 1,
-0.5130424, -1.513328, -2.63449, 0.1882353, 1, 0, 1,
-0.5114959, -2.227115, -2.604136, 0.1803922, 1, 0, 1,
-0.5114278, -0.2345613, -0.4833161, 0.1764706, 1, 0, 1,
-0.5110721, -0.143394, 0.3482505, 0.1686275, 1, 0, 1,
-0.5109761, 0.2210446, -0.5099762, 0.1647059, 1, 0, 1,
-0.5062337, -3.169788, -1.817476, 0.1568628, 1, 0, 1,
-0.5054579, -0.367592, -0.3094802, 0.1529412, 1, 0, 1,
-0.5030049, 0.1587933, -0.6344164, 0.145098, 1, 0, 1,
-0.4992806, 2.308462, -0.5688068, 0.1411765, 1, 0, 1,
-0.4953482, -0.5978007, -3.914474, 0.1333333, 1, 0, 1,
-0.486142, -0.3677248, -2.114113, 0.1294118, 1, 0, 1,
-0.4851743, 1.102756, -0.9671253, 0.1215686, 1, 0, 1,
-0.4793326, 1.92583, -0.8169901, 0.1176471, 1, 0, 1,
-0.4706604, 1.179898, 0.7831043, 0.1098039, 1, 0, 1,
-0.4694962, -0.5904565, -2.943645, 0.1058824, 1, 0, 1,
-0.467972, 1.291994, -0.06834732, 0.09803922, 1, 0, 1,
-0.4668859, 0.2201321, -2.924267, 0.09019608, 1, 0, 1,
-0.4632211, -0.2399828, -4.248345, 0.08627451, 1, 0, 1,
-0.4622679, -0.1153745, -3.27245, 0.07843138, 1, 0, 1,
-0.45902, 2.503927, -0.6397629, 0.07450981, 1, 0, 1,
-0.4567931, 0.9014246, -0.9147351, 0.06666667, 1, 0, 1,
-0.4526374, -0.8414757, -2.854578, 0.0627451, 1, 0, 1,
-0.448326, 1.531655, -0.8650247, 0.05490196, 1, 0, 1,
-0.44817, 0.5499422, -0.8700674, 0.05098039, 1, 0, 1,
-0.4444114, -2.340383, -3.194524, 0.04313726, 1, 0, 1,
-0.4396149, 1.665107, -0.9874276, 0.03921569, 1, 0, 1,
-0.4367222, -0.5263298, -3.378759, 0.03137255, 1, 0, 1,
-0.4366951, 0.7247987, -1.015643, 0.02745098, 1, 0, 1,
-0.4356241, 0.6291295, -0.7650908, 0.01960784, 1, 0, 1,
-0.4321574, 1.833254, -0.7574388, 0.01568628, 1, 0, 1,
-0.4309042, 0.3837076, -3.337007, 0.007843138, 1, 0, 1,
-0.4292637, -1.137989, -3.406358, 0.003921569, 1, 0, 1,
-0.4290538, 1.371347, -0.1013867, 0, 1, 0.003921569, 1,
-0.4288892, 2.834891, 4.018378, 0, 1, 0.01176471, 1,
-0.4257686, 1.754007, -1.047524, 0, 1, 0.01568628, 1,
-0.424312, -1.579194, -2.247355, 0, 1, 0.02352941, 1,
-0.4192108, 0.1986923, -0.3858051, 0, 1, 0.02745098, 1,
-0.415517, -0.5703404, -4.496094, 0, 1, 0.03529412, 1,
-0.4154453, 0.4740882, 1.070493, 0, 1, 0.03921569, 1,
-0.4111376, 0.1301724, -1.872777, 0, 1, 0.04705882, 1,
-0.4108544, 0.885316, 0.1821277, 0, 1, 0.05098039, 1,
-0.4046996, 1.140371, -0.3169709, 0, 1, 0.05882353, 1,
-0.3976253, -0.7415011, -2.080864, 0, 1, 0.0627451, 1,
-0.396944, 0.0983048, 0.08605871, 0, 1, 0.07058824, 1,
-0.3967037, 0.7204838, -0.8671077, 0, 1, 0.07450981, 1,
-0.3962049, 1.807582, -0.309976, 0, 1, 0.08235294, 1,
-0.39423, -0.9741718, -3.454948, 0, 1, 0.08627451, 1,
-0.3933364, 0.4731786, -1.035561, 0, 1, 0.09411765, 1,
-0.3878511, 1.083093, -0.9358087, 0, 1, 0.1019608, 1,
-0.3874006, 1.538569, 0.9162341, 0, 1, 0.1058824, 1,
-0.3854409, 0.5521732, 0.1231075, 0, 1, 0.1137255, 1,
-0.3754545, -0.2478757, -2.286822, 0, 1, 0.1176471, 1,
-0.3731479, -0.9099611, -2.555892, 0, 1, 0.1254902, 1,
-0.3728561, 0.8650082, -0.5688053, 0, 1, 0.1294118, 1,
-0.372583, -0.9162381, -2.606653, 0, 1, 0.1372549, 1,
-0.3715968, -0.336401, -3.336056, 0, 1, 0.1411765, 1,
-0.3690508, -1.511615, -3.027914, 0, 1, 0.1490196, 1,
-0.3662533, 0.1072218, -1.357316, 0, 1, 0.1529412, 1,
-0.3659557, -0.1882697, -2.518614, 0, 1, 0.1607843, 1,
-0.3649324, 0.9069604, -0.4862284, 0, 1, 0.1647059, 1,
-0.3636037, -0.3368975, -1.84748, 0, 1, 0.172549, 1,
-0.3582958, 1.302339, -1.959018, 0, 1, 0.1764706, 1,
-0.3571444, 1.310036, -1.102292, 0, 1, 0.1843137, 1,
-0.3544391, -2.252545, -2.871475, 0, 1, 0.1882353, 1,
-0.3492935, 0.8757734, -0.3808242, 0, 1, 0.1960784, 1,
-0.3486042, -0.2438754, -1.195616, 0, 1, 0.2039216, 1,
-0.3446808, 0.1470706, -0.8146489, 0, 1, 0.2078431, 1,
-0.3425021, -0.5512114, -2.05489, 0, 1, 0.2156863, 1,
-0.3387112, -2.421721, -3.482274, 0, 1, 0.2196078, 1,
-0.3366353, -0.9872025, -3.481675, 0, 1, 0.227451, 1,
-0.3342106, -0.7590872, -3.150317, 0, 1, 0.2313726, 1,
-0.3296131, -0.129698, -0.7671453, 0, 1, 0.2392157, 1,
-0.3291091, 0.6839957, 0.968816, 0, 1, 0.2431373, 1,
-0.3270592, 0.9599929, -1.719523, 0, 1, 0.2509804, 1,
-0.3268289, 0.2202896, -1.3277, 0, 1, 0.254902, 1,
-0.3234729, -0.2292887, -1.587547, 0, 1, 0.2627451, 1,
-0.3222891, -0.9548384, -2.550143, 0, 1, 0.2666667, 1,
-0.3210424, 1.117003, 0.07260883, 0, 1, 0.2745098, 1,
-0.3197004, 0.5698069, 0.4677327, 0, 1, 0.2784314, 1,
-0.3139174, 0.5992147, 0.0321927, 0, 1, 0.2862745, 1,
-0.3113624, -1.171914, -2.745632, 0, 1, 0.2901961, 1,
-0.3107391, 0.3513767, -1.607495, 0, 1, 0.2980392, 1,
-0.3089929, -1.480203, -2.218662, 0, 1, 0.3058824, 1,
-0.3087019, 0.187504, -2.318456, 0, 1, 0.3098039, 1,
-0.3048632, -0.4713169, -1.616617, 0, 1, 0.3176471, 1,
-0.3045998, 0.5944003, 0.6627213, 0, 1, 0.3215686, 1,
-0.3031705, -0.03714334, -1.600301, 0, 1, 0.3294118, 1,
-0.3025907, -1.875981, -1.154227, 0, 1, 0.3333333, 1,
-0.3010466, -0.3286026, -2.422825, 0, 1, 0.3411765, 1,
-0.300197, 2.245325, 1.697291, 0, 1, 0.345098, 1,
-0.2990957, 1.213777, -0.4319152, 0, 1, 0.3529412, 1,
-0.2985629, -1.466963, -3.142919, 0, 1, 0.3568628, 1,
-0.2972725, 1.747243, 0.009515668, 0, 1, 0.3647059, 1,
-0.2890234, -2.639838, -2.815715, 0, 1, 0.3686275, 1,
-0.2879203, -0.149467, -3.340819, 0, 1, 0.3764706, 1,
-0.2830747, -0.8540914, -2.756535, 0, 1, 0.3803922, 1,
-0.2769114, -2.760224, -1.629974, 0, 1, 0.3882353, 1,
-0.2711519, 0.2516691, 2.051973, 0, 1, 0.3921569, 1,
-0.2698767, -0.9260836, -3.0242, 0, 1, 0.4, 1,
-0.2694371, -0.3229696, -3.501114, 0, 1, 0.4078431, 1,
-0.2662513, 0.3456561, -1.044256, 0, 1, 0.4117647, 1,
-0.2659849, 0.5449123, 1.076148, 0, 1, 0.4196078, 1,
-0.2643399, -0.725438, -2.775917, 0, 1, 0.4235294, 1,
-0.2639867, 0.9421954, -0.9680747, 0, 1, 0.4313726, 1,
-0.2622365, 0.9826796, -0.3618784, 0, 1, 0.4352941, 1,
-0.2613717, 0.5781683, -0.4944976, 0, 1, 0.4431373, 1,
-0.2576462, 0.2595876, -0.803154, 0, 1, 0.4470588, 1,
-0.2570124, 0.9498992, -2.594975, 0, 1, 0.454902, 1,
-0.2536443, -0.5430074, -3.121456, 0, 1, 0.4588235, 1,
-0.2534705, -0.8335143, -3.018934, 0, 1, 0.4666667, 1,
-0.2517371, 0.8548477, -0.1581415, 0, 1, 0.4705882, 1,
-0.2418065, 0.9524273, 2.512522, 0, 1, 0.4784314, 1,
-0.2410727, 2.033233, 0.05178791, 0, 1, 0.4823529, 1,
-0.2361877, -0.6307563, -3.976789, 0, 1, 0.4901961, 1,
-0.2361617, 1.28229, -0.3357511, 0, 1, 0.4941176, 1,
-0.2355471, -0.8007154, -1.553203, 0, 1, 0.5019608, 1,
-0.2354182, -1.656945, -2.216215, 0, 1, 0.509804, 1,
-0.2287518, 1.052566, -0.4034361, 0, 1, 0.5137255, 1,
-0.2285607, 0.337152, 0.2296777, 0, 1, 0.5215687, 1,
-0.2277251, 1.52318, 0.3974977, 0, 1, 0.5254902, 1,
-0.222656, 0.4424, 0.8667989, 0, 1, 0.5333334, 1,
-0.220748, 1.036828, -0.4955737, 0, 1, 0.5372549, 1,
-0.2202065, 1.205725, -0.6511638, 0, 1, 0.5450981, 1,
-0.2201894, -0.115563, -2.175992, 0, 1, 0.5490196, 1,
-0.2192105, 0.988095, -0.1712357, 0, 1, 0.5568628, 1,
-0.2106588, 0.4419857, 0.2922304, 0, 1, 0.5607843, 1,
-0.2069273, 0.3336564, -0.4484976, 0, 1, 0.5686275, 1,
-0.201979, -0.5750801, -2.66257, 0, 1, 0.572549, 1,
-0.2017661, -0.3592584, -3.104912, 0, 1, 0.5803922, 1,
-0.1966259, -0.6781245, -4.498795, 0, 1, 0.5843138, 1,
-0.1954703, -1.270605, -2.572415, 0, 1, 0.5921569, 1,
-0.1882113, 0.2759045, -0.4730022, 0, 1, 0.5960785, 1,
-0.1880151, -0.5850934, -3.798412, 0, 1, 0.6039216, 1,
-0.1830918, -0.2776007, -2.374206, 0, 1, 0.6117647, 1,
-0.1774695, 1.537116, 1.070962, 0, 1, 0.6156863, 1,
-0.1742485, -1.201494, -1.574371, 0, 1, 0.6235294, 1,
-0.1661253, -0.1434108, -0.91107, 0, 1, 0.627451, 1,
-0.1640869, 0.7549124, 0.492174, 0, 1, 0.6352941, 1,
-0.1629516, -0.5202371, -2.48034, 0, 1, 0.6392157, 1,
-0.1629501, -0.4943641, -2.415067, 0, 1, 0.6470588, 1,
-0.1599579, 1.145615, -0.4909427, 0, 1, 0.6509804, 1,
-0.1565581, 0.3611789, -0.2599021, 0, 1, 0.6588235, 1,
-0.1562537, 0.2175274, -0.2462597, 0, 1, 0.6627451, 1,
-0.1539347, 1.903556, 0.5767825, 0, 1, 0.6705883, 1,
-0.1528005, -0.654158, -1.597419, 0, 1, 0.6745098, 1,
-0.1443695, -0.3123061, -2.972286, 0, 1, 0.682353, 1,
-0.1430356, 0.9986786, -0.09864887, 0, 1, 0.6862745, 1,
-0.1246974, -1.996237, -4.727041, 0, 1, 0.6941177, 1,
-0.1205189, -0.1983509, -3.633038, 0, 1, 0.7019608, 1,
-0.1203399, -0.08432738, -2.468103, 0, 1, 0.7058824, 1,
-0.1184913, 2.483354, 0.07740633, 0, 1, 0.7137255, 1,
-0.1142822, -0.9951637, -2.803594, 0, 1, 0.7176471, 1,
-0.1135256, -0.4319218, -2.070625, 0, 1, 0.7254902, 1,
-0.1094233, 0.6113899, -1.95299, 0, 1, 0.7294118, 1,
-0.1052787, 0.849031, -0.9579769, 0, 1, 0.7372549, 1,
-0.1021032, -0.3810751, -2.836646, 0, 1, 0.7411765, 1,
-0.09950256, -0.4723019, -2.420187, 0, 1, 0.7490196, 1,
-0.09906857, -1.017371, -1.155152, 0, 1, 0.7529412, 1,
-0.09317395, 2.444333, 0.1712874, 0, 1, 0.7607843, 1,
-0.07923307, 0.9798517, 0.990471, 0, 1, 0.7647059, 1,
-0.07689972, -0.08012277, -2.583779, 0, 1, 0.772549, 1,
-0.07674158, -0.5724003, -0.4073023, 0, 1, 0.7764706, 1,
-0.0713065, 1.363352, -0.06790615, 0, 1, 0.7843137, 1,
-0.06777086, 0.754854, -0.4681441, 0, 1, 0.7882353, 1,
-0.05732096, -1.137758, -5.01873, 0, 1, 0.7960784, 1,
-0.05351374, 0.4363683, -1.443133, 0, 1, 0.8039216, 1,
-0.05280043, -0.99441, -2.907966, 0, 1, 0.8078431, 1,
-0.05127971, -0.4402171, -2.028096, 0, 1, 0.8156863, 1,
-0.05085848, -0.4982794, -1.436962, 0, 1, 0.8196079, 1,
-0.04331335, -0.1918746, -3.646549, 0, 1, 0.827451, 1,
-0.04139087, 0.8864565, 0.2784837, 0, 1, 0.8313726, 1,
-0.04107446, -0.1842628, -3.245938, 0, 1, 0.8392157, 1,
-0.04094592, 0.6401638, 0.3209604, 0, 1, 0.8431373, 1,
-0.03761233, -2.52387, -1.676511, 0, 1, 0.8509804, 1,
-0.03573042, -0.9738821, -2.247959, 0, 1, 0.854902, 1,
-0.03519052, 0.4648963, 0.3738992, 0, 1, 0.8627451, 1,
-0.03425156, 0.6928445, 0.466586, 0, 1, 0.8666667, 1,
-0.03328822, -1.302705, -5.24788, 0, 1, 0.8745098, 1,
-0.02875448, 1.15814, -0.4445069, 0, 1, 0.8784314, 1,
-0.02865054, -0.4524586, -1.948692, 0, 1, 0.8862745, 1,
-0.02696084, 0.8739575, -0.09412466, 0, 1, 0.8901961, 1,
-0.02457219, -1.633381, -4.954979, 0, 1, 0.8980392, 1,
-0.02135318, -0.4713936, -4.124166, 0, 1, 0.9058824, 1,
-0.02027488, -2.20524, -3.106215, 0, 1, 0.9098039, 1,
-0.01451158, -0.08412295, -4.230522, 0, 1, 0.9176471, 1,
-0.01321622, 1.261734, 2.18668, 0, 1, 0.9215686, 1,
-0.01212311, -0.08823478, -2.438779, 0, 1, 0.9294118, 1,
-0.01196056, -1.278732, -3.535644, 0, 1, 0.9333333, 1,
-0.01123904, -0.5624133, -2.634792, 0, 1, 0.9411765, 1,
-0.0102186, -1.111589, -2.941787, 0, 1, 0.945098, 1,
-0.009625446, 0.08592604, -0.3577885, 0, 1, 0.9529412, 1,
-0.007288904, -0.7172297, -4.445932, 0, 1, 0.9568627, 1,
-0.003395317, 0.5272923, -1.542606, 0, 1, 0.9647059, 1,
-0.0009745825, 1.418642, -1.065941, 0, 1, 0.9686275, 1,
0.009961095, -0.1727045, 4.534535, 0, 1, 0.9764706, 1,
0.01099823, 0.5929849, 0.1245242, 0, 1, 0.9803922, 1,
0.01278447, 0.2863318, 1.36733, 0, 1, 0.9882353, 1,
0.0139817, 0.6358107, -1.433767, 0, 1, 0.9921569, 1,
0.01541447, -0.1712415, 2.797007, 0, 1, 1, 1,
0.01722495, -0.2324865, 4.206163, 0, 0.9921569, 1, 1,
0.01870979, 0.207516, 0.1235981, 0, 0.9882353, 1, 1,
0.01915616, -1.019988, 1.845162, 0, 0.9803922, 1, 1,
0.02090072, 0.09702893, -0.6553928, 0, 0.9764706, 1, 1,
0.02162554, -0.7194958, 4.437521, 0, 0.9686275, 1, 1,
0.02250747, -0.3519585, 1.382577, 0, 0.9647059, 1, 1,
0.02298049, -1.426893, 1.929984, 0, 0.9568627, 1, 1,
0.02682658, -0.354265, 4.282003, 0, 0.9529412, 1, 1,
0.03619917, -0.9722285, 3.555489, 0, 0.945098, 1, 1,
0.03637033, 0.7598459, -0.08284444, 0, 0.9411765, 1, 1,
0.03717315, 1.554173, -1.281565, 0, 0.9333333, 1, 1,
0.04280918, 0.1499476, -0.07836135, 0, 0.9294118, 1, 1,
0.04446197, -0.8788612, 3.371344, 0, 0.9215686, 1, 1,
0.04456467, -0.2808686, 2.818089, 0, 0.9176471, 1, 1,
0.0537639, 1.426205, -0.3231305, 0, 0.9098039, 1, 1,
0.05448258, -0.4633662, 2.475287, 0, 0.9058824, 1, 1,
0.05478296, -0.02494261, 2.834302, 0, 0.8980392, 1, 1,
0.0591203, 1.03803, 0.765203, 0, 0.8901961, 1, 1,
0.05949852, 0.146573, -1.404628, 0, 0.8862745, 1, 1,
0.06031532, 0.2879444, 0.496628, 0, 0.8784314, 1, 1,
0.06774918, -0.2340506, 5.168954, 0, 0.8745098, 1, 1,
0.06854694, 0.2625348, 1.660141, 0, 0.8666667, 1, 1,
0.07171993, 0.7100034, 1.295562, 0, 0.8627451, 1, 1,
0.07559849, -1.705101, 2.34209, 0, 0.854902, 1, 1,
0.07696334, -1.233287, 1.427834, 0, 0.8509804, 1, 1,
0.07699129, -1.204362, 2.351069, 0, 0.8431373, 1, 1,
0.07742136, 0.2621373, 0.1391374, 0, 0.8392157, 1, 1,
0.07794666, 0.1600187, 2.04366, 0, 0.8313726, 1, 1,
0.07811231, -0.4920183, 3.845104, 0, 0.827451, 1, 1,
0.08301048, 1.320911, -0.309055, 0, 0.8196079, 1, 1,
0.09034644, 0.03910015, 2.158576, 0, 0.8156863, 1, 1,
0.09121943, -0.4731537, 3.416241, 0, 0.8078431, 1, 1,
0.09274527, -0.3189719, 1.451525, 0, 0.8039216, 1, 1,
0.09576754, -0.1775096, 1.983883, 0, 0.7960784, 1, 1,
0.09912333, -0.5080062, 2.688845, 0, 0.7882353, 1, 1,
0.09918257, -0.5728255, 4.654174, 0, 0.7843137, 1, 1,
0.10129, -0.1093862, 1.352051, 0, 0.7764706, 1, 1,
0.1025632, -0.7009404, 1.725623, 0, 0.772549, 1, 1,
0.1069218, 0.3840398, 1.42331, 0, 0.7647059, 1, 1,
0.1135729, -1.299325, 2.965303, 0, 0.7607843, 1, 1,
0.1157963, 0.3745473, 0.02429961, 0, 0.7529412, 1, 1,
0.1191416, -0.1087523, 2.033647, 0, 0.7490196, 1, 1,
0.1205196, 0.1633666, -0.07747117, 0, 0.7411765, 1, 1,
0.1207389, 1.708595, -1.021319, 0, 0.7372549, 1, 1,
0.1221236, -1.486218, 2.282573, 0, 0.7294118, 1, 1,
0.1240057, -0.5118207, 2.566694, 0, 0.7254902, 1, 1,
0.1245426, -0.8238894, 1.829693, 0, 0.7176471, 1, 1,
0.130438, 1.148228, 1.184305, 0, 0.7137255, 1, 1,
0.1335548, -0.4585522, -0.2079162, 0, 0.7058824, 1, 1,
0.1339304, -0.3016036, 2.905894, 0, 0.6980392, 1, 1,
0.1362769, 0.3660958, 1.277783, 0, 0.6941177, 1, 1,
0.1371886, 1.665284, 0.7605654, 0, 0.6862745, 1, 1,
0.1398828, -1.241167, 3.235142, 0, 0.682353, 1, 1,
0.1436227, 0.4109705, 1.24196, 0, 0.6745098, 1, 1,
0.1448114, 0.2011397, 1.247607, 0, 0.6705883, 1, 1,
0.1482355, 0.9585133, -0.3580805, 0, 0.6627451, 1, 1,
0.1498503, 0.3527856, -0.438154, 0, 0.6588235, 1, 1,
0.1528429, -0.4642129, 2.513421, 0, 0.6509804, 1, 1,
0.1547532, -1.283432, 2.510439, 0, 0.6470588, 1, 1,
0.1547647, -0.5649945, 2.284421, 0, 0.6392157, 1, 1,
0.1557246, -0.5589431, 1.77993, 0, 0.6352941, 1, 1,
0.1631905, -0.0354046, 0.9879836, 0, 0.627451, 1, 1,
0.1632926, 1.128628, -0.9025354, 0, 0.6235294, 1, 1,
0.166211, 0.1543968, 1.323595, 0, 0.6156863, 1, 1,
0.169103, -0.6047121, 2.628217, 0, 0.6117647, 1, 1,
0.1716807, -0.7430577, 3.020775, 0, 0.6039216, 1, 1,
0.1758684, 0.3170044, 0.7561738, 0, 0.5960785, 1, 1,
0.180019, -0.7917529, 3.153806, 0, 0.5921569, 1, 1,
0.1801049, 0.6005048, -0.2060085, 0, 0.5843138, 1, 1,
0.1804297, 0.4182093, 1.140668, 0, 0.5803922, 1, 1,
0.1814562, -0.4409221, 1.572804, 0, 0.572549, 1, 1,
0.1832837, -0.6562162, 3.161089, 0, 0.5686275, 1, 1,
0.1840914, 0.5081029, 0.4358291, 0, 0.5607843, 1, 1,
0.1872885, -0.5886585, 3.422939, 0, 0.5568628, 1, 1,
0.1876091, 2.109561, -0.3829484, 0, 0.5490196, 1, 1,
0.1884093, -1.307435, 2.143793, 0, 0.5450981, 1, 1,
0.1898398, -0.2433236, 1.611374, 0, 0.5372549, 1, 1,
0.1906857, 0.3826446, -0.4161378, 0, 0.5333334, 1, 1,
0.1920614, -0.5228956, 3.333618, 0, 0.5254902, 1, 1,
0.193876, 1.451529, 1.951534, 0, 0.5215687, 1, 1,
0.1962423, -0.8416904, 3.40598, 0, 0.5137255, 1, 1,
0.200516, -0.1472042, 2.342088, 0, 0.509804, 1, 1,
0.2007912, 0.8193752, -0.6513148, 0, 0.5019608, 1, 1,
0.2034796, -0.03996022, 3.403647, 0, 0.4941176, 1, 1,
0.2050902, 0.1643226, 0.3444186, 0, 0.4901961, 1, 1,
0.2057753, -0.555791, 2.801469, 0, 0.4823529, 1, 1,
0.2109225, -0.7616494, 2.945169, 0, 0.4784314, 1, 1,
0.2113674, -1.145098, 3.539575, 0, 0.4705882, 1, 1,
0.2121836, 0.3449481, -0.5807791, 0, 0.4666667, 1, 1,
0.212226, 0.1604469, -0.09386315, 0, 0.4588235, 1, 1,
0.2129897, 0.2010345, 1.974893, 0, 0.454902, 1, 1,
0.213442, 0.6975335, -0.2110571, 0, 0.4470588, 1, 1,
0.2163329, 1.700661, 2.230965, 0, 0.4431373, 1, 1,
0.2222231, -1.08917, 3.340188, 0, 0.4352941, 1, 1,
0.2265406, 0.8372832, -1.165466, 0, 0.4313726, 1, 1,
0.2306653, -2.283056, 4.14675, 0, 0.4235294, 1, 1,
0.2319583, -0.04261491, 4.144136, 0, 0.4196078, 1, 1,
0.2329257, -1.895987, 1.246241, 0, 0.4117647, 1, 1,
0.2339038, -0.5473926, 5.325624, 0, 0.4078431, 1, 1,
0.2400128, 0.7543076, 2.140012, 0, 0.4, 1, 1,
0.2432616, -0.9394448, 2.008096, 0, 0.3921569, 1, 1,
0.2516798, -0.4590158, 0.5439336, 0, 0.3882353, 1, 1,
0.2543133, -0.6697794, 2.802094, 0, 0.3803922, 1, 1,
0.2593053, -0.2608974, 3.39535, 0, 0.3764706, 1, 1,
0.2617658, -0.008047819, 1.140852, 0, 0.3686275, 1, 1,
0.2627113, 0.8637629, 0.1982285, 0, 0.3647059, 1, 1,
0.2631182, 0.9146116, 1.859897, 0, 0.3568628, 1, 1,
0.2636751, -0.02029569, -0.02763802, 0, 0.3529412, 1, 1,
0.267933, -0.7308547, 2.288591, 0, 0.345098, 1, 1,
0.2703923, -0.1392535, 1.331308, 0, 0.3411765, 1, 1,
0.2709177, -1.100085, 2.437493, 0, 0.3333333, 1, 1,
0.2726904, 1.369079, 0.8775833, 0, 0.3294118, 1, 1,
0.2767345, 1.059111, -0.7429956, 0, 0.3215686, 1, 1,
0.2792403, -0.7343833, 2.841621, 0, 0.3176471, 1, 1,
0.2796745, -0.1822523, 1.286975, 0, 0.3098039, 1, 1,
0.2813513, -0.6778234, 2.171075, 0, 0.3058824, 1, 1,
0.2846074, 1.052784, 0.3550611, 0, 0.2980392, 1, 1,
0.289955, 1.674927, 0.5374128, 0, 0.2901961, 1, 1,
0.2925492, -1.086885, 2.683622, 0, 0.2862745, 1, 1,
0.2953477, -2.038044, 3.615915, 0, 0.2784314, 1, 1,
0.296667, -0.07847189, 2.47194, 0, 0.2745098, 1, 1,
0.3006359, -0.2776195, 1.553798, 0, 0.2666667, 1, 1,
0.3048827, -2.453548, 3.518849, 0, 0.2627451, 1, 1,
0.3048873, 1.009308, 1.727048, 0, 0.254902, 1, 1,
0.308951, -0.2880759, 1.486496, 0, 0.2509804, 1, 1,
0.3127018, -0.1021847, 1.447143, 0, 0.2431373, 1, 1,
0.3130253, -0.6335346, 3.228355, 0, 0.2392157, 1, 1,
0.3131518, 0.3650092, 2.113742, 0, 0.2313726, 1, 1,
0.315959, -0.04826363, -0.3060975, 0, 0.227451, 1, 1,
0.3169446, -0.6701463, 2.578323, 0, 0.2196078, 1, 1,
0.3227542, -2.203626, 4.608882, 0, 0.2156863, 1, 1,
0.3292422, -0.8102821, 3.247027, 0, 0.2078431, 1, 1,
0.3352063, -0.2775304, 3.743208, 0, 0.2039216, 1, 1,
0.336527, -1.101101, 4.01421, 0, 0.1960784, 1, 1,
0.3410986, 1.40599, 0.08673211, 0, 0.1882353, 1, 1,
0.3424921, 1.03935, -1.061065, 0, 0.1843137, 1, 1,
0.3465424, 0.6472981, 1.180068, 0, 0.1764706, 1, 1,
0.3558351, -1.480343, 1.152237, 0, 0.172549, 1, 1,
0.3609548, -0.4280334, 4.364998, 0, 0.1647059, 1, 1,
0.3708825, 0.4135641, -0.07452502, 0, 0.1607843, 1, 1,
0.3724915, 0.6560656, 1.011016, 0, 0.1529412, 1, 1,
0.3733749, -0.1009721, 2.997051, 0, 0.1490196, 1, 1,
0.3750039, 1.337475, -1.230989, 0, 0.1411765, 1, 1,
0.3757493, 0.7245849, 1.351231, 0, 0.1372549, 1, 1,
0.3870778, -0.04055259, -0.1125605, 0, 0.1294118, 1, 1,
0.3877524, -0.4249132, 3.718813, 0, 0.1254902, 1, 1,
0.3877861, -1.698106, 2.831498, 0, 0.1176471, 1, 1,
0.3889753, -2.60463, 2.743865, 0, 0.1137255, 1, 1,
0.393404, -0.95115, 2.983921, 0, 0.1058824, 1, 1,
0.3951443, 0.5249047, 1.203678, 0, 0.09803922, 1, 1,
0.4000135, 1.022566, -0.5205199, 0, 0.09411765, 1, 1,
0.402813, -1.422747, 2.764173, 0, 0.08627451, 1, 1,
0.4031154, 0.03755009, 1.230845, 0, 0.08235294, 1, 1,
0.4032393, 1.291575, 0.8609518, 0, 0.07450981, 1, 1,
0.4033184, 0.5047343, 1.037836, 0, 0.07058824, 1, 1,
0.4049107, 0.8597491, 0.8477707, 0, 0.0627451, 1, 1,
0.4067331, -0.1021516, 0.9868566, 0, 0.05882353, 1, 1,
0.4084572, 0.4500705, -0.8753888, 0, 0.05098039, 1, 1,
0.4127607, 0.6447495, 0.3413736, 0, 0.04705882, 1, 1,
0.4144195, -0.3104425, 1.62723, 0, 0.03921569, 1, 1,
0.4147635, 0.8825908, 0.8195733, 0, 0.03529412, 1, 1,
0.4208068, -1.711125, 4.062559, 0, 0.02745098, 1, 1,
0.4314663, 0.1436949, -0.7181173, 0, 0.02352941, 1, 1,
0.439275, 0.5174252, 0.3607902, 0, 0.01568628, 1, 1,
0.4429673, -1.230835, 2.791342, 0, 0.01176471, 1, 1,
0.4436784, -1.188016, 2.389633, 0, 0.003921569, 1, 1,
0.4458921, 0.5950829, 0.6164345, 0.003921569, 0, 1, 1,
0.446735, 0.3078489, -0.6624811, 0.007843138, 0, 1, 1,
0.4476357, -0.6805252, 0.713551, 0.01568628, 0, 1, 1,
0.4492684, -1.828475, 2.23169, 0.01960784, 0, 1, 1,
0.4494085, 0.4423161, 0.3137886, 0.02745098, 0, 1, 1,
0.4500167, 0.0794154, 1.86015, 0.03137255, 0, 1, 1,
0.4526664, -2.440651, 3.361308, 0.03921569, 0, 1, 1,
0.4568789, -0.06078886, 1.141732, 0.04313726, 0, 1, 1,
0.4574567, -0.6577513, 4.321469, 0.05098039, 0, 1, 1,
0.4617285, 1.089574, 0.5746859, 0.05490196, 0, 1, 1,
0.4638111, -1.502027, 3.015499, 0.0627451, 0, 1, 1,
0.4647811, -1.585281, 3.941275, 0.06666667, 0, 1, 1,
0.4666727, -0.3358881, 2.307882, 0.07450981, 0, 1, 1,
0.4706967, -0.5639066, 0.665047, 0.07843138, 0, 1, 1,
0.4776786, -0.497074, 2.953542, 0.08627451, 0, 1, 1,
0.4792485, 0.5749086, -0.2393888, 0.09019608, 0, 1, 1,
0.4855605, -1.600312, 2.448922, 0.09803922, 0, 1, 1,
0.4916987, 1.483303, 0.1973064, 0.1058824, 0, 1, 1,
0.4918546, 0.1628693, -0.9127647, 0.1098039, 0, 1, 1,
0.4926041, 0.5368919, 0.3719535, 0.1176471, 0, 1, 1,
0.4943278, 0.8233796, 0.7642947, 0.1215686, 0, 1, 1,
0.4948392, 0.6416886, 1.734041, 0.1294118, 0, 1, 1,
0.49718, 0.5031582, 1.326771, 0.1333333, 0, 1, 1,
0.4977501, 0.3450235, -0.3380028, 0.1411765, 0, 1, 1,
0.506763, -0.7932841, 3.247894, 0.145098, 0, 1, 1,
0.5075828, 0.5678679, 2.015557, 0.1529412, 0, 1, 1,
0.5087718, 1.484214, 1.116076, 0.1568628, 0, 1, 1,
0.5165125, -0.3265395, 1.621057, 0.1647059, 0, 1, 1,
0.5199829, -0.5132384, 2.036434, 0.1686275, 0, 1, 1,
0.5246171, -0.1168099, 2.646021, 0.1764706, 0, 1, 1,
0.5279889, 0.2927696, 0.6474314, 0.1803922, 0, 1, 1,
0.5284486, -1.579919, 3.138453, 0.1882353, 0, 1, 1,
0.5288457, -0.7587507, 2.782654, 0.1921569, 0, 1, 1,
0.5314849, 0.4502508, 0.3721374, 0.2, 0, 1, 1,
0.537087, -0.5432976, 1.974613, 0.2078431, 0, 1, 1,
0.5437288, -0.649552, 2.446478, 0.2117647, 0, 1, 1,
0.5440683, -0.1159766, 2.072989, 0.2196078, 0, 1, 1,
0.5457887, 0.9299158, -0.1635955, 0.2235294, 0, 1, 1,
0.5474452, -1.540512, 2.406589, 0.2313726, 0, 1, 1,
0.5494215, 0.697367, 0.5741491, 0.2352941, 0, 1, 1,
0.5508036, 0.9937251, -0.7266594, 0.2431373, 0, 1, 1,
0.5537903, 1.804106, 0.7231186, 0.2470588, 0, 1, 1,
0.5542292, 0.5371001, 1.041986, 0.254902, 0, 1, 1,
0.5568069, 0.0877896, 1.212904, 0.2588235, 0, 1, 1,
0.559993, 0.183298, 2.952902, 0.2666667, 0, 1, 1,
0.5605569, -0.9939231, 2.387673, 0.2705882, 0, 1, 1,
0.5624811, 1.534818, 0.4334517, 0.2784314, 0, 1, 1,
0.5630757, -1.549917, 4.374007, 0.282353, 0, 1, 1,
0.5651006, 0.5050641, 1.665281, 0.2901961, 0, 1, 1,
0.565973, 1.292045, 0.7716221, 0.2941177, 0, 1, 1,
0.5666717, -0.005454352, 2.214218, 0.3019608, 0, 1, 1,
0.5786749, -0.6397529, 3.866362, 0.3098039, 0, 1, 1,
0.5820138, 0.4386779, 0.6237395, 0.3137255, 0, 1, 1,
0.5845141, 0.436391, 1.034196, 0.3215686, 0, 1, 1,
0.5884238, -0.4476253, 2.781615, 0.3254902, 0, 1, 1,
0.5930029, -1.103638, 2.982652, 0.3333333, 0, 1, 1,
0.5930841, -0.3640796, 1.695237, 0.3372549, 0, 1, 1,
0.5956349, 0.224297, -0.4192383, 0.345098, 0, 1, 1,
0.6018188, -0.6352692, 2.130765, 0.3490196, 0, 1, 1,
0.6080573, 1.903985, 0.6518708, 0.3568628, 0, 1, 1,
0.6088102, 0.4240672, -0.1253184, 0.3607843, 0, 1, 1,
0.6133578, -0.8461338, 1.666578, 0.3686275, 0, 1, 1,
0.6150284, -0.326281, 1.517866, 0.372549, 0, 1, 1,
0.6178005, 1.181594, 0.1430854, 0.3803922, 0, 1, 1,
0.6181816, 1.05348, 0.7203187, 0.3843137, 0, 1, 1,
0.6191503, 0.5013301, 0.8109173, 0.3921569, 0, 1, 1,
0.6221317, 2.033116, 0.3098446, 0.3960784, 0, 1, 1,
0.6262949, -1.437296, 2.268922, 0.4039216, 0, 1, 1,
0.6315404, -0.06296055, 0.3885181, 0.4117647, 0, 1, 1,
0.6440722, -1.417368, 3.079383, 0.4156863, 0, 1, 1,
0.6504615, 1.195898, 2.246148, 0.4235294, 0, 1, 1,
0.6505351, 0.9864558, 0.7824571, 0.427451, 0, 1, 1,
0.6526487, 1.437338, 1.046692, 0.4352941, 0, 1, 1,
0.6532959, 0.426553, 1.110548, 0.4392157, 0, 1, 1,
0.6552054, 0.5514051, 0.4015151, 0.4470588, 0, 1, 1,
0.6556596, 2.589047, 1.221505, 0.4509804, 0, 1, 1,
0.6561121, -0.9463508, 3.906271, 0.4588235, 0, 1, 1,
0.66449, 0.9459937, -0.19412, 0.4627451, 0, 1, 1,
0.6661798, -0.3021864, 1.719761, 0.4705882, 0, 1, 1,
0.6679222, 0.2565629, 0.9649236, 0.4745098, 0, 1, 1,
0.6679487, 0.9494796, -0.8534896, 0.4823529, 0, 1, 1,
0.6771532, 0.9426584, 0.4372636, 0.4862745, 0, 1, 1,
0.6791065, -1.839686, 2.158354, 0.4941176, 0, 1, 1,
0.6799868, 0.4337972, 2.158523, 0.5019608, 0, 1, 1,
0.6813793, 2.223094, 1.298674, 0.5058824, 0, 1, 1,
0.6817937, 2.001904, 0.2851966, 0.5137255, 0, 1, 1,
0.6833453, -1.997891, 3.036438, 0.5176471, 0, 1, 1,
0.6835442, -1.815262, 3.555073, 0.5254902, 0, 1, 1,
0.6869472, 0.2269795, -0.100444, 0.5294118, 0, 1, 1,
0.6873999, -0.4384886, 1.310055, 0.5372549, 0, 1, 1,
0.6912887, 0.06649268, 2.077524, 0.5411765, 0, 1, 1,
0.6925637, -1.595409, 4.545932, 0.5490196, 0, 1, 1,
0.6937065, 0.2544236, 0.2835629, 0.5529412, 0, 1, 1,
0.6945229, -1.286323, 3.489593, 0.5607843, 0, 1, 1,
0.7023963, 1.986576, 0.2738825, 0.5647059, 0, 1, 1,
0.7039655, 0.8028299, 1.381688, 0.572549, 0, 1, 1,
0.706733, -0.2917773, 3.410852, 0.5764706, 0, 1, 1,
0.7074937, -1.535836, 1.404403, 0.5843138, 0, 1, 1,
0.7107247, -0.2659755, 1.708275, 0.5882353, 0, 1, 1,
0.7111837, 0.2841569, 0.03966774, 0.5960785, 0, 1, 1,
0.7128869, 0.03696414, 0.03564163, 0.6039216, 0, 1, 1,
0.7164986, -1.395461, 3.205219, 0.6078432, 0, 1, 1,
0.7239088, 0.3019879, 0.4942163, 0.6156863, 0, 1, 1,
0.7284905, -0.4282581, 2.870697, 0.6196079, 0, 1, 1,
0.7293057, 0.3943225, 1.459198, 0.627451, 0, 1, 1,
0.7330667, 0.818002, 1.683228, 0.6313726, 0, 1, 1,
0.7368753, 0.3577886, 1.022832, 0.6392157, 0, 1, 1,
0.7386341, 0.5023285, 0.9288324, 0.6431373, 0, 1, 1,
0.7420717, -1.56065, 1.691519, 0.6509804, 0, 1, 1,
0.7443251, -1.020401, 1.70415, 0.654902, 0, 1, 1,
0.7507998, 1.259099, -0.2303791, 0.6627451, 0, 1, 1,
0.7591279, -0.8044031, 1.558211, 0.6666667, 0, 1, 1,
0.7666693, -0.4666602, 3.08835, 0.6745098, 0, 1, 1,
0.7670216, 2.438477, 1.368793, 0.6784314, 0, 1, 1,
0.7843459, 0.3102094, 0.5909628, 0.6862745, 0, 1, 1,
0.7859085, 2.592704, 0.2109801, 0.6901961, 0, 1, 1,
0.7859517, 0.9643258, 0.5421458, 0.6980392, 0, 1, 1,
0.7898239, -2.014224, 3.482527, 0.7058824, 0, 1, 1,
0.7924964, 0.3262108, 1.794649, 0.7098039, 0, 1, 1,
0.7961416, 0.5184032, 0.3599629, 0.7176471, 0, 1, 1,
0.797774, -0.5335159, 1.123007, 0.7215686, 0, 1, 1,
0.7998511, -1.872489, 3.466797, 0.7294118, 0, 1, 1,
0.8009812, 1.363707, 1.656403, 0.7333333, 0, 1, 1,
0.8050945, 0.2875267, 0.5209697, 0.7411765, 0, 1, 1,
0.8084709, -0.6046491, 2.425527, 0.7450981, 0, 1, 1,
0.8163551, -0.1080214, 1.205075, 0.7529412, 0, 1, 1,
0.8233013, -0.6612173, 1.693602, 0.7568628, 0, 1, 1,
0.8258566, 0.2844456, 1.924571, 0.7647059, 0, 1, 1,
0.8292487, 0.8971385, 0.1223315, 0.7686275, 0, 1, 1,
0.8296121, -0.4198727, 2.303406, 0.7764706, 0, 1, 1,
0.8299224, -1.642899, 3.261358, 0.7803922, 0, 1, 1,
0.8301544, 2.409474, -0.8406084, 0.7882353, 0, 1, 1,
0.8348315, -0.4956264, 1.500435, 0.7921569, 0, 1, 1,
0.8389538, 1.212605, 1.499207, 0.8, 0, 1, 1,
0.843905, 0.2809495, 1.056061, 0.8078431, 0, 1, 1,
0.8483068, 0.2104551, 2.299894, 0.8117647, 0, 1, 1,
0.8493069, 0.006268299, 1.642642, 0.8196079, 0, 1, 1,
0.8505575, 1.190449, 1.100578, 0.8235294, 0, 1, 1,
0.8615964, 0.7429426, 0.8048038, 0.8313726, 0, 1, 1,
0.8621566, 0.5003358, 0.8936834, 0.8352941, 0, 1, 1,
0.8630722, 0.09939247, 1.454669, 0.8431373, 0, 1, 1,
0.8663972, -0.5025093, 1.893482, 0.8470588, 0, 1, 1,
0.8697051, -0.4882638, 1.747143, 0.854902, 0, 1, 1,
0.87047, 0.1892661, 1.73245, 0.8588235, 0, 1, 1,
0.8715038, 1.418444, 0.9810097, 0.8666667, 0, 1, 1,
0.877388, -1.463709, 1.650089, 0.8705882, 0, 1, 1,
0.884279, -1.99213, 3.486316, 0.8784314, 0, 1, 1,
0.8927876, -0.9455486, 2.88335, 0.8823529, 0, 1, 1,
0.8940005, 0.5044769, -0.4449822, 0.8901961, 0, 1, 1,
0.894062, 0.2137643, 4.087786, 0.8941177, 0, 1, 1,
0.8953769, 1.631871, -0.3697974, 0.9019608, 0, 1, 1,
0.8981016, 0.3613595, 0.8338257, 0.9098039, 0, 1, 1,
0.9002553, 0.4788322, -0.1168422, 0.9137255, 0, 1, 1,
0.9036534, -1.200053, 2.954621, 0.9215686, 0, 1, 1,
0.9073385, 0.09235036, 0.07011072, 0.9254902, 0, 1, 1,
0.908644, 0.2197499, -0.1206766, 0.9333333, 0, 1, 1,
0.9169211, 0.3957658, 0.715179, 0.9372549, 0, 1, 1,
0.9196756, 0.8679707, 1.467706, 0.945098, 0, 1, 1,
0.919942, 0.9580619, 0.8140109, 0.9490196, 0, 1, 1,
0.9232758, 0.2013785, 0.9566987, 0.9568627, 0, 1, 1,
0.926854, 1.231408, 1.538031, 0.9607843, 0, 1, 1,
0.9275827, 0.7321815, 1.128691, 0.9686275, 0, 1, 1,
0.9401895, -1.264997, 2.127376, 0.972549, 0, 1, 1,
0.9439222, -1.207857, 2.364909, 0.9803922, 0, 1, 1,
0.9569662, 1.312325, -0.9324049, 0.9843137, 0, 1, 1,
0.9613676, -0.6880474, 2.39087, 0.9921569, 0, 1, 1,
0.9647872, -1.902137, 3.599759, 0.9960784, 0, 1, 1,
0.9741997, -1.629644, -0.1034767, 1, 0, 0.9960784, 1,
0.9806688, -1.977485, 1.913946, 1, 0, 0.9882353, 1,
0.9911492, -0.267911, 1.782886, 1, 0, 0.9843137, 1,
0.9927546, 1.725627, -0.355956, 1, 0, 0.9764706, 1,
0.9928148, 0.2474856, 0.4951992, 1, 0, 0.972549, 1,
0.9944487, -0.899214, 0.8049379, 1, 0, 0.9647059, 1,
1.003699, -0.4706337, 2.146952, 1, 0, 0.9607843, 1,
1.005772, -0.2399231, 2.271522, 1, 0, 0.9529412, 1,
1.018049, 0.08217356, 0.1792519, 1, 0, 0.9490196, 1,
1.018555, -0.6255807, 0.2663787, 1, 0, 0.9411765, 1,
1.019913, -0.9352829, -0.3692758, 1, 0, 0.9372549, 1,
1.027025, -0.2147916, 2.679784, 1, 0, 0.9294118, 1,
1.028783, 0.9216664, -0.4370388, 1, 0, 0.9254902, 1,
1.029025, 0.634626, -1.2167, 1, 0, 0.9176471, 1,
1.029127, 2.532485, -0.3118673, 1, 0, 0.9137255, 1,
1.039002, -0.4899335, 0.7955307, 1, 0, 0.9058824, 1,
1.054792, 1.365749, 0.4764838, 1, 0, 0.9019608, 1,
1.064834, -0.9629584, 1.627495, 1, 0, 0.8941177, 1,
1.082063, -0.1086846, 1.329368, 1, 0, 0.8862745, 1,
1.082697, -2.074544, 3.04369, 1, 0, 0.8823529, 1,
1.084553, 0.6573567, 0.4274265, 1, 0, 0.8745098, 1,
1.084643, -0.4451265, 1.94924, 1, 0, 0.8705882, 1,
1.091218, 0.3460076, 1.591457, 1, 0, 0.8627451, 1,
1.097388, -0.735052, 1.078192, 1, 0, 0.8588235, 1,
1.112171, 0.2931153, 0.895053, 1, 0, 0.8509804, 1,
1.120958, 0.1334464, 0.8607966, 1, 0, 0.8470588, 1,
1.126751, -0.934414, 3.438935, 1, 0, 0.8392157, 1,
1.130458, 0.2529638, 1.803805, 1, 0, 0.8352941, 1,
1.132552, -0.5572792, 3.151387, 1, 0, 0.827451, 1,
1.134346, 1.502749, 1.186752, 1, 0, 0.8235294, 1,
1.135776, -1.256179, 2.686133, 1, 0, 0.8156863, 1,
1.144763, 0.6791108, 1.230573, 1, 0, 0.8117647, 1,
1.147334, -0.1277242, 0.2780557, 1, 0, 0.8039216, 1,
1.150529, 1.355113, 0.4871979, 1, 0, 0.7960784, 1,
1.150785, -1.55609, -0.5099299, 1, 0, 0.7921569, 1,
1.158806, -0.7287785, 2.72295, 1, 0, 0.7843137, 1,
1.171909, -0.6563939, 0.6443486, 1, 0, 0.7803922, 1,
1.174639, 0.1575792, 2.732954, 1, 0, 0.772549, 1,
1.180471, -0.3864722, 1.653364, 1, 0, 0.7686275, 1,
1.180633, 0.7708597, 0.9363057, 1, 0, 0.7607843, 1,
1.194368, 0.8651468, 1.61942, 1, 0, 0.7568628, 1,
1.19543, 0.7570534, -0.3343325, 1, 0, 0.7490196, 1,
1.208877, -0.378679, 2.276128, 1, 0, 0.7450981, 1,
1.211615, -0.06509411, 0.8244523, 1, 0, 0.7372549, 1,
1.221092, 0.5155084, 1.633969, 1, 0, 0.7333333, 1,
1.227967, -0.2522112, 3.217038, 1, 0, 0.7254902, 1,
1.229993, -1.116475, 0.6640468, 1, 0, 0.7215686, 1,
1.235713, -0.298632, 1.772569, 1, 0, 0.7137255, 1,
1.238553, -0.9980127, 2.51775, 1, 0, 0.7098039, 1,
1.252383, -0.5401736, 1.32709, 1, 0, 0.7019608, 1,
1.258367, 0.09682336, 1.69679, 1, 0, 0.6941177, 1,
1.264453, 0.1092708, 2.881493, 1, 0, 0.6901961, 1,
1.269094, 0.4162713, 1.497781, 1, 0, 0.682353, 1,
1.269951, -0.3308467, 3.267049, 1, 0, 0.6784314, 1,
1.275595, 0.3782942, 1.69891, 1, 0, 0.6705883, 1,
1.276493, 0.5375426, 1.511106, 1, 0, 0.6666667, 1,
1.278534, 1.182306, 1.380934, 1, 0, 0.6588235, 1,
1.290053, 0.8619307, 0.5623021, 1, 0, 0.654902, 1,
1.291954, 0.6977555, 0.8241113, 1, 0, 0.6470588, 1,
1.299085, -1.234208, 0.6787463, 1, 0, 0.6431373, 1,
1.302988, -0.7325433, 2.587237, 1, 0, 0.6352941, 1,
1.3137, 0.01502772, 0.8539473, 1, 0, 0.6313726, 1,
1.316876, 1.667786, 0.8337048, 1, 0, 0.6235294, 1,
1.350654, 0.675023, 2.693545, 1, 0, 0.6196079, 1,
1.36811, -0.05182626, 1.685902, 1, 0, 0.6117647, 1,
1.370591, -0.1150629, 0.2197554, 1, 0, 0.6078432, 1,
1.374604, 0.422419, 1.974915, 1, 0, 0.6, 1,
1.376896, -0.4118401, 2.796307, 1, 0, 0.5921569, 1,
1.37928, -0.4944008, 3.862662, 1, 0, 0.5882353, 1,
1.382014, -2.097796, 1.691054, 1, 0, 0.5803922, 1,
1.398078, 0.04429398, 1.447916, 1, 0, 0.5764706, 1,
1.398339, 1.100049, -0.02006002, 1, 0, 0.5686275, 1,
1.424696, -1.042999, 2.129654, 1, 0, 0.5647059, 1,
1.42985, -0.08335097, 2.481601, 1, 0, 0.5568628, 1,
1.432439, -0.4591179, 1.630268, 1, 0, 0.5529412, 1,
1.435546, 0.8902482, -0.244217, 1, 0, 0.5450981, 1,
1.451559, 0.713098, 1.393074, 1, 0, 0.5411765, 1,
1.452763, -0.9800348, 4.958593, 1, 0, 0.5333334, 1,
1.453362, -0.7065136, 3.240066, 1, 0, 0.5294118, 1,
1.477648, 0.8425528, 0.852181, 1, 0, 0.5215687, 1,
1.478378, -0.9213461, 1.811962, 1, 0, 0.5176471, 1,
1.479478, -1.763828, 2.305849, 1, 0, 0.509804, 1,
1.479681, 0.1841844, 0.6513292, 1, 0, 0.5058824, 1,
1.484684, -0.7344878, 2.032374, 1, 0, 0.4980392, 1,
1.48505, -1.33856, 1.925592, 1, 0, 0.4901961, 1,
1.489335, 0.3602166, 1.823342, 1, 0, 0.4862745, 1,
1.489966, -2.502674, 2.539504, 1, 0, 0.4784314, 1,
1.490213, 0.3582714, 1.469488, 1, 0, 0.4745098, 1,
1.496682, 0.5409762, 1.033719, 1, 0, 0.4666667, 1,
1.501466, 0.6730345, 0.2070668, 1, 0, 0.4627451, 1,
1.507603, -1.540044, 2.811224, 1, 0, 0.454902, 1,
1.50765, -0.2942468, 2.574152, 1, 0, 0.4509804, 1,
1.521856, 0.3215507, 1.6968, 1, 0, 0.4431373, 1,
1.530809, -0.6976062, 3.494929, 1, 0, 0.4392157, 1,
1.53411, -0.2113188, 1.399569, 1, 0, 0.4313726, 1,
1.543884, -0.02618293, 1.86449, 1, 0, 0.427451, 1,
1.553368, -0.1088916, 1.101588, 1, 0, 0.4196078, 1,
1.557666, 0.2611231, 2.042322, 1, 0, 0.4156863, 1,
1.563483, -0.1105815, 1.912852, 1, 0, 0.4078431, 1,
1.576154, 0.07924911, 0.1949946, 1, 0, 0.4039216, 1,
1.594509, 0.2756528, 0.9156368, 1, 0, 0.3960784, 1,
1.596335, 1.034477, 1.942163, 1, 0, 0.3882353, 1,
1.598107, 0.6231756, -0.4934855, 1, 0, 0.3843137, 1,
1.611434, 0.4616407, -0.3000681, 1, 0, 0.3764706, 1,
1.627663, -0.8619635, 2.902445, 1, 0, 0.372549, 1,
1.631077, -0.07143106, 1.942259, 1, 0, 0.3647059, 1,
1.634888, -0.1551396, 1.678342, 1, 0, 0.3607843, 1,
1.637061, 1.025227, 0.1607063, 1, 0, 0.3529412, 1,
1.645538, 0.8913776, 1.340729, 1, 0, 0.3490196, 1,
1.65238, -0.415028, 1.37977, 1, 0, 0.3411765, 1,
1.656749, 1.15404, 0.6388454, 1, 0, 0.3372549, 1,
1.663557, 0.2437133, 1.954119, 1, 0, 0.3294118, 1,
1.672971, 0.1759425, -0.7504966, 1, 0, 0.3254902, 1,
1.678616, 0.2424733, 1.843485, 1, 0, 0.3176471, 1,
1.679859, 1.051684, 2.146349, 1, 0, 0.3137255, 1,
1.687176, 2.642406, -0.7017518, 1, 0, 0.3058824, 1,
1.707354, -0.0181131, 0.7046541, 1, 0, 0.2980392, 1,
1.72819, 1.540244, 1.451218, 1, 0, 0.2941177, 1,
1.731113, 0.9758903, 1.92505, 1, 0, 0.2862745, 1,
1.74591, 1.13739, 2.092877, 1, 0, 0.282353, 1,
1.748476, 0.6419033, -0.06273112, 1, 0, 0.2745098, 1,
1.754379, -0.09449551, 0.7243485, 1, 0, 0.2705882, 1,
1.760916, -0.0752795, 2.060942, 1, 0, 0.2627451, 1,
1.762927, -1.594229, 1.232562, 1, 0, 0.2588235, 1,
1.785045, -0.7630814, 1.881385, 1, 0, 0.2509804, 1,
1.83852, -0.3898306, 0.7398882, 1, 0, 0.2470588, 1,
1.853675, 1.830618, 0.9504701, 1, 0, 0.2392157, 1,
1.859815, -0.7439075, 2.518536, 1, 0, 0.2352941, 1,
1.870274, 0.332065, 0.8106027, 1, 0, 0.227451, 1,
1.875493, -0.2281136, 3.070942, 1, 0, 0.2235294, 1,
1.890678, -0.1059861, 2.904211, 1, 0, 0.2156863, 1,
1.905633, -0.6497789, 2.185391, 1, 0, 0.2117647, 1,
1.906357, 0.6256573, 0.7919549, 1, 0, 0.2039216, 1,
1.915827, -0.7183484, 1.416917, 1, 0, 0.1960784, 1,
1.93633, -0.2793792, 2.164197, 1, 0, 0.1921569, 1,
1.940286, 2.824862, 3.950998, 1, 0, 0.1843137, 1,
1.992907, -1.642878, 3.333684, 1, 0, 0.1803922, 1,
2.012484, -0.7568457, 2.032628, 1, 0, 0.172549, 1,
2.015907, -1.703887, 1.995597, 1, 0, 0.1686275, 1,
2.031374, 0.0133447, -0.04263784, 1, 0, 0.1607843, 1,
2.091834, 0.5952365, -0.494641, 1, 0, 0.1568628, 1,
2.126418, 0.8672956, 2.407454, 1, 0, 0.1490196, 1,
2.139086, 0.3922418, 1.981165, 1, 0, 0.145098, 1,
2.158766, -0.2615258, 1.931995, 1, 0, 0.1372549, 1,
2.171868, 0.3651889, 2.012408, 1, 0, 0.1333333, 1,
2.198244, -0.2397816, 0.3347414, 1, 0, 0.1254902, 1,
2.221207, 0.7319044, 0.1885378, 1, 0, 0.1215686, 1,
2.231268, -1.046248, 0.6241093, 1, 0, 0.1137255, 1,
2.282828, 0.5286533, 1.618149, 1, 0, 0.1098039, 1,
2.295446, -1.131043, 0.5870813, 1, 0, 0.1019608, 1,
2.321546, 1.491715, 0.5480565, 1, 0, 0.09411765, 1,
2.323283, 0.7381104, 1.169409, 1, 0, 0.09019608, 1,
2.352392, -0.3480087, 2.400385, 1, 0, 0.08235294, 1,
2.381883, 1.044945, 0.607833, 1, 0, 0.07843138, 1,
2.388783, -0.4139636, 1.492369, 1, 0, 0.07058824, 1,
2.406698, 0.9133173, 0.6186894, 1, 0, 0.06666667, 1,
2.435392, -0.4676251, 1.304776, 1, 0, 0.05882353, 1,
2.447, -1.156008, 1.335474, 1, 0, 0.05490196, 1,
2.503021, 0.4971993, 1.939773, 1, 0, 0.04705882, 1,
2.560677, -1.523753, 0.6906875, 1, 0, 0.04313726, 1,
2.632809, 0.1683613, 0.2307447, 1, 0, 0.03529412, 1,
2.801728, -1.278707, 1.194275, 1, 0, 0.03137255, 1,
2.827162, 0.5085551, 0.8032348, 1, 0, 0.02352941, 1,
2.988029, 0.2130891, 2.440176, 1, 0, 0.01960784, 1,
3.093389, -0.3053617, 1.480726, 1, 0, 0.01176471, 1,
3.314151, -0.6452308, 2.511207, 1, 0, 0.007843138, 1
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
-0.1802112, -4.205652, -7.040088, 0, -0.5, 0.5, 0.5,
-0.1802112, -4.205652, -7.040088, 1, -0.5, 0.5, 0.5,
-0.1802112, -4.205652, -7.040088, 1, 1.5, 0.5, 0.5,
-0.1802112, -4.205652, -7.040088, 0, 1.5, 0.5, 0.5
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
-4.859162, -0.1141412, -7.040088, 0, -0.5, 0.5, 0.5,
-4.859162, -0.1141412, -7.040088, 1, -0.5, 0.5, 0.5,
-4.859162, -0.1141412, -7.040088, 1, 1.5, 0.5, 0.5,
-4.859162, -0.1141412, -7.040088, 0, 1.5, 0.5, 0.5
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
-4.859162, -4.205652, 0.03887224, 0, -0.5, 0.5, 0.5,
-4.859162, -4.205652, 0.03887224, 1, -0.5, 0.5, 0.5,
-4.859162, -4.205652, 0.03887224, 1, 1.5, 0.5, 0.5,
-4.859162, -4.205652, 0.03887224, 0, 1.5, 0.5, 0.5
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
-3, -3.261457, -5.406482,
3, -3.261457, -5.406482,
-3, -3.261457, -5.406482,
-3, -3.418823, -5.67875,
-2, -3.261457, -5.406482,
-2, -3.418823, -5.67875,
-1, -3.261457, -5.406482,
-1, -3.418823, -5.67875,
0, -3.261457, -5.406482,
0, -3.418823, -5.67875,
1, -3.261457, -5.406482,
1, -3.418823, -5.67875,
2, -3.261457, -5.406482,
2, -3.418823, -5.67875,
3, -3.261457, -5.406482,
3, -3.418823, -5.67875
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
-3, -3.733555, -6.223285, 0, -0.5, 0.5, 0.5,
-3, -3.733555, -6.223285, 1, -0.5, 0.5, 0.5,
-3, -3.733555, -6.223285, 1, 1.5, 0.5, 0.5,
-3, -3.733555, -6.223285, 0, 1.5, 0.5, 0.5,
-2, -3.733555, -6.223285, 0, -0.5, 0.5, 0.5,
-2, -3.733555, -6.223285, 1, -0.5, 0.5, 0.5,
-2, -3.733555, -6.223285, 1, 1.5, 0.5, 0.5,
-2, -3.733555, -6.223285, 0, 1.5, 0.5, 0.5,
-1, -3.733555, -6.223285, 0, -0.5, 0.5, 0.5,
-1, -3.733555, -6.223285, 1, -0.5, 0.5, 0.5,
-1, -3.733555, -6.223285, 1, 1.5, 0.5, 0.5,
-1, -3.733555, -6.223285, 0, 1.5, 0.5, 0.5,
0, -3.733555, -6.223285, 0, -0.5, 0.5, 0.5,
0, -3.733555, -6.223285, 1, -0.5, 0.5, 0.5,
0, -3.733555, -6.223285, 1, 1.5, 0.5, 0.5,
0, -3.733555, -6.223285, 0, 1.5, 0.5, 0.5,
1, -3.733555, -6.223285, 0, -0.5, 0.5, 0.5,
1, -3.733555, -6.223285, 1, -0.5, 0.5, 0.5,
1, -3.733555, -6.223285, 1, 1.5, 0.5, 0.5,
1, -3.733555, -6.223285, 0, 1.5, 0.5, 0.5,
2, -3.733555, -6.223285, 0, -0.5, 0.5, 0.5,
2, -3.733555, -6.223285, 1, -0.5, 0.5, 0.5,
2, -3.733555, -6.223285, 1, 1.5, 0.5, 0.5,
2, -3.733555, -6.223285, 0, 1.5, 0.5, 0.5,
3, -3.733555, -6.223285, 0, -0.5, 0.5, 0.5,
3, -3.733555, -6.223285, 1, -0.5, 0.5, 0.5,
3, -3.733555, -6.223285, 1, 1.5, 0.5, 0.5,
3, -3.733555, -6.223285, 0, 1.5, 0.5, 0.5
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
-3.779404, -3, -5.406482,
-3.779404, 2, -5.406482,
-3.779404, -3, -5.406482,
-3.959364, -3, -5.67875,
-3.779404, -2, -5.406482,
-3.959364, -2, -5.67875,
-3.779404, -1, -5.406482,
-3.959364, -1, -5.67875,
-3.779404, 0, -5.406482,
-3.959364, 0, -5.67875,
-3.779404, 1, -5.406482,
-3.959364, 1, -5.67875,
-3.779404, 2, -5.406482,
-3.959364, 2, -5.67875
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
-4.319283, -3, -6.223285, 0, -0.5, 0.5, 0.5,
-4.319283, -3, -6.223285, 1, -0.5, 0.5, 0.5,
-4.319283, -3, -6.223285, 1, 1.5, 0.5, 0.5,
-4.319283, -3, -6.223285, 0, 1.5, 0.5, 0.5,
-4.319283, -2, -6.223285, 0, -0.5, 0.5, 0.5,
-4.319283, -2, -6.223285, 1, -0.5, 0.5, 0.5,
-4.319283, -2, -6.223285, 1, 1.5, 0.5, 0.5,
-4.319283, -2, -6.223285, 0, 1.5, 0.5, 0.5,
-4.319283, -1, -6.223285, 0, -0.5, 0.5, 0.5,
-4.319283, -1, -6.223285, 1, -0.5, 0.5, 0.5,
-4.319283, -1, -6.223285, 1, 1.5, 0.5, 0.5,
-4.319283, -1, -6.223285, 0, 1.5, 0.5, 0.5,
-4.319283, 0, -6.223285, 0, -0.5, 0.5, 0.5,
-4.319283, 0, -6.223285, 1, -0.5, 0.5, 0.5,
-4.319283, 0, -6.223285, 1, 1.5, 0.5, 0.5,
-4.319283, 0, -6.223285, 0, 1.5, 0.5, 0.5,
-4.319283, 1, -6.223285, 0, -0.5, 0.5, 0.5,
-4.319283, 1, -6.223285, 1, -0.5, 0.5, 0.5,
-4.319283, 1, -6.223285, 1, 1.5, 0.5, 0.5,
-4.319283, 1, -6.223285, 0, 1.5, 0.5, 0.5,
-4.319283, 2, -6.223285, 0, -0.5, 0.5, 0.5,
-4.319283, 2, -6.223285, 1, -0.5, 0.5, 0.5,
-4.319283, 2, -6.223285, 1, 1.5, 0.5, 0.5,
-4.319283, 2, -6.223285, 0, 1.5, 0.5, 0.5
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
-3.779404, -3.261457, -4,
-3.779404, -3.261457, 4,
-3.779404, -3.261457, -4,
-3.959364, -3.418823, -4,
-3.779404, -3.261457, -2,
-3.959364, -3.418823, -2,
-3.779404, -3.261457, 0,
-3.959364, -3.418823, 0,
-3.779404, -3.261457, 2,
-3.959364, -3.418823, 2,
-3.779404, -3.261457, 4,
-3.959364, -3.418823, 4
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
-4.319283, -3.733555, -4, 0, -0.5, 0.5, 0.5,
-4.319283, -3.733555, -4, 1, -0.5, 0.5, 0.5,
-4.319283, -3.733555, -4, 1, 1.5, 0.5, 0.5,
-4.319283, -3.733555, -4, 0, 1.5, 0.5, 0.5,
-4.319283, -3.733555, -2, 0, -0.5, 0.5, 0.5,
-4.319283, -3.733555, -2, 1, -0.5, 0.5, 0.5,
-4.319283, -3.733555, -2, 1, 1.5, 0.5, 0.5,
-4.319283, -3.733555, -2, 0, 1.5, 0.5, 0.5,
-4.319283, -3.733555, 0, 0, -0.5, 0.5, 0.5,
-4.319283, -3.733555, 0, 1, -0.5, 0.5, 0.5,
-4.319283, -3.733555, 0, 1, 1.5, 0.5, 0.5,
-4.319283, -3.733555, 0, 0, 1.5, 0.5, 0.5,
-4.319283, -3.733555, 2, 0, -0.5, 0.5, 0.5,
-4.319283, -3.733555, 2, 1, -0.5, 0.5, 0.5,
-4.319283, -3.733555, 2, 1, 1.5, 0.5, 0.5,
-4.319283, -3.733555, 2, 0, 1.5, 0.5, 0.5,
-4.319283, -3.733555, 4, 0, -0.5, 0.5, 0.5,
-4.319283, -3.733555, 4, 1, -0.5, 0.5, 0.5,
-4.319283, -3.733555, 4, 1, 1.5, 0.5, 0.5,
-4.319283, -3.733555, 4, 0, 1.5, 0.5, 0.5
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
-3.779404, -3.261457, -5.406482,
-3.779404, 3.033175, -5.406482,
-3.779404, -3.261457, 5.484227,
-3.779404, 3.033175, 5.484227,
-3.779404, -3.261457, -5.406482,
-3.779404, -3.261457, 5.484227,
-3.779404, 3.033175, -5.406482,
-3.779404, 3.033175, 5.484227,
-3.779404, -3.261457, -5.406482,
3.418982, -3.261457, -5.406482,
-3.779404, -3.261457, 5.484227,
3.418982, -3.261457, 5.484227,
-3.779404, 3.033175, -5.406482,
3.418982, 3.033175, -5.406482,
-3.779404, 3.033175, 5.484227,
3.418982, 3.033175, 5.484227,
3.418982, -3.261457, -5.406482,
3.418982, 3.033175, -5.406482,
3.418982, -3.261457, 5.484227,
3.418982, 3.033175, 5.484227,
3.418982, -3.261457, -5.406482,
3.418982, -3.261457, 5.484227,
3.418982, 3.033175, -5.406482,
3.418982, 3.033175, 5.484227
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
var radius = 7.738974;
var distance = 34.43157;
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
mvMatrix.translate( 0.1802112, 0.1141412, -0.03887224 );
mvMatrix.scale( 1.162418, 1.329312, 0.7683182 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.43157);
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
Indoxacarb<-read.table("Indoxacarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Indoxacarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Indoxacarb' not found
```

```r
y<-Indoxacarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Indoxacarb' not found
```

```r
z<-Indoxacarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Indoxacarb' not found
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
-3.674573, 0.2875203, -0.7985783, 0, 0, 1, 1, 1,
-3.600303, -0.8800271, -2.362998, 1, 0, 0, 1, 1,
-3.024349, -1.319466, -1.024656, 1, 0, 0, 1, 1,
-2.756845, 0.165448, -2.7084, 1, 0, 0, 1, 1,
-2.719818, 0.7729291, 0.509413, 1, 0, 0, 1, 1,
-2.67667, -1.110088, -1.661273, 1, 0, 0, 1, 1,
-2.509791, -0.0469115, -1.185868, 0, 0, 0, 1, 1,
-2.494932, 0.5662749, -0.3241426, 0, 0, 0, 1, 1,
-2.466373, -0.06849061, -0.991053, 0, 0, 0, 1, 1,
-2.460714, -2.011914, -1.840459, 0, 0, 0, 1, 1,
-2.410174, -0.5659487, -2.302167, 0, 0, 0, 1, 1,
-2.356885, 0.3078873, -0.06496414, 0, 0, 0, 1, 1,
-2.256577, -0.8678685, -3.243808, 0, 0, 0, 1, 1,
-2.247955, -0.6663723, -1.512602, 1, 1, 1, 1, 1,
-2.236991, 0.7179362, -1.034682, 1, 1, 1, 1, 1,
-2.228578, -1.756486, -1.068326, 1, 1, 1, 1, 1,
-2.171886, 0.3709874, -1.83332, 1, 1, 1, 1, 1,
-2.141127, 0.4672734, -0.2099914, 1, 1, 1, 1, 1,
-2.074909, -0.5567609, -2.238151, 1, 1, 1, 1, 1,
-2.020961, -0.5672203, -0.9740722, 1, 1, 1, 1, 1,
-2.019793, 0.7199952, -2.761057, 1, 1, 1, 1, 1,
-2.01274, -1.323914, -3.736138, 1, 1, 1, 1, 1,
-1.909127, -0.4449722, -2.267313, 1, 1, 1, 1, 1,
-1.895478, 1.965754, -1.412678, 1, 1, 1, 1, 1,
-1.876713, -2.19958, -3.467608, 1, 1, 1, 1, 1,
-1.869012, 1.419096, -1.908987, 1, 1, 1, 1, 1,
-1.866825, 0.3665154, -2.568969, 1, 1, 1, 1, 1,
-1.85275, 1.662136, -0.02546959, 1, 1, 1, 1, 1,
-1.826269, -1.682332, -1.588419, 0, 0, 1, 1, 1,
-1.811632, 0.2266795, -2.388892, 1, 0, 0, 1, 1,
-1.801797, -0.903998, -1.338741, 1, 0, 0, 1, 1,
-1.793505, 0.6399243, -0.9890116, 1, 0, 0, 1, 1,
-1.790608, -1.798376, -1.18215, 1, 0, 0, 1, 1,
-1.786944, -0.3274126, -0.8309608, 1, 0, 0, 1, 1,
-1.773581, -6.675848e-05, -1.830683, 0, 0, 0, 1, 1,
-1.745508, -0.5620815, -0.1492847, 0, 0, 0, 1, 1,
-1.743536, 1.174835, -1.20939, 0, 0, 0, 1, 1,
-1.735126, 0.7008991, -1.547371, 0, 0, 0, 1, 1,
-1.731485, 0.2347097, -0.1452584, 0, 0, 0, 1, 1,
-1.696849, -0.8754227, -1.235743, 0, 0, 0, 1, 1,
-1.679509, -2.65819, -2.863465, 0, 0, 0, 1, 1,
-1.672469, 0.2159599, -2.137241, 1, 1, 1, 1, 1,
-1.671617, 0.1870259, -2.32117, 1, 1, 1, 1, 1,
-1.669817, 0.2615315, -3.34754, 1, 1, 1, 1, 1,
-1.666133, -0.1521405, -1.057111, 1, 1, 1, 1, 1,
-1.660078, -1.938038, -2.701665, 1, 1, 1, 1, 1,
-1.648927, 0.4430048, -2.673836, 1, 1, 1, 1, 1,
-1.640876, 0.06735294, -0.7020853, 1, 1, 1, 1, 1,
-1.639866, -1.171697, -2.701128, 1, 1, 1, 1, 1,
-1.631816, -0.3515922, -1.663029, 1, 1, 1, 1, 1,
-1.622525, -1.340913, -1.034773, 1, 1, 1, 1, 1,
-1.60909, -2.65777, -3.484254, 1, 1, 1, 1, 1,
-1.579698, -0.273262, -0.02688221, 1, 1, 1, 1, 1,
-1.545278, -0.2262136, -2.17749, 1, 1, 1, 1, 1,
-1.542814, -2.570549, -1.736037, 1, 1, 1, 1, 1,
-1.51844, 0.9163449, 0.1579408, 1, 1, 1, 1, 1,
-1.508167, 0.08668827, -2.331211, 0, 0, 1, 1, 1,
-1.482665, -1.026794, -1.339156, 1, 0, 0, 1, 1,
-1.478665, -0.2265069, -2.301883, 1, 0, 0, 1, 1,
-1.478184, -0.1632388, -3.075154, 1, 0, 0, 1, 1,
-1.474272, -0.09430703, -1.492011, 1, 0, 0, 1, 1,
-1.470708, -0.2737357, -1.422272, 1, 0, 0, 1, 1,
-1.461582, 0.612525, -0.07484446, 0, 0, 0, 1, 1,
-1.454493, -0.5670841, -2.806638, 0, 0, 0, 1, 1,
-1.446878, -1.038584, -2.348668, 0, 0, 0, 1, 1,
-1.433632, 0.2780988, -1.028388, 0, 0, 0, 1, 1,
-1.432602, -1.025932, -1.314981, 0, 0, 0, 1, 1,
-1.420719, -1.977423, -2.270125, 0, 0, 0, 1, 1,
-1.416783, -2.893932, -2.210601, 0, 0, 0, 1, 1,
-1.402655, 1.25223, 0.5341083, 1, 1, 1, 1, 1,
-1.398834, -1.836397, -3.715098, 1, 1, 1, 1, 1,
-1.395619, 0.09375039, -3.528755, 1, 1, 1, 1, 1,
-1.384283, -0.6866023, -2.254619, 1, 1, 1, 1, 1,
-1.373239, -0.5862361, -2.198091, 1, 1, 1, 1, 1,
-1.366469, -0.04462159, -2.561341, 1, 1, 1, 1, 1,
-1.36051, 0.6701638, -1.659824, 1, 1, 1, 1, 1,
-1.354641, -1.837202, -3.847841, 1, 1, 1, 1, 1,
-1.354406, 0.5126877, -1.299031, 1, 1, 1, 1, 1,
-1.335007, -0.3525307, -2.244735, 1, 1, 1, 1, 1,
-1.331797, 0.5178862, -1.468413, 1, 1, 1, 1, 1,
-1.314711, -0.05928506, -1.953405, 1, 1, 1, 1, 1,
-1.314168, -1.818611, -1.822567, 1, 1, 1, 1, 1,
-1.30537, 1.068207, -0.3579682, 1, 1, 1, 1, 1,
-1.304721, -0.4705791, -0.7652386, 1, 1, 1, 1, 1,
-1.303096, 0.5679787, -1.238714, 0, 0, 1, 1, 1,
-1.297297, -0.7089512, -1.307491, 1, 0, 0, 1, 1,
-1.296847, -0.7007721, -0.09798703, 1, 0, 0, 1, 1,
-1.293861, -0.6142837, -1.197875, 1, 0, 0, 1, 1,
-1.293504, 0.03421484, -1.421595, 1, 0, 0, 1, 1,
-1.291817, -1.603596, -2.257371, 1, 0, 0, 1, 1,
-1.287495, -0.4502508, -1.527498, 0, 0, 0, 1, 1,
-1.285679, 1.007969, 0.3068483, 0, 0, 0, 1, 1,
-1.281837, 0.3794278, 0.3470783, 0, 0, 0, 1, 1,
-1.277142, -0.8177528, -1.662503, 0, 0, 0, 1, 1,
-1.275992, 0.1700666, -2.195561, 0, 0, 0, 1, 1,
-1.27091, -0.6047361, -3.282435, 0, 0, 0, 1, 1,
-1.266765, -0.6524972, -1.001738, 0, 0, 0, 1, 1,
-1.264558, -1.431661, -3.798929, 1, 1, 1, 1, 1,
-1.263761, -0.2150253, -1.270223, 1, 1, 1, 1, 1,
-1.260469, -0.3125959, -3.213056, 1, 1, 1, 1, 1,
-1.253297, -0.335793, -0.9266493, 1, 1, 1, 1, 1,
-1.252066, 0.6452248, -1.382365, 1, 1, 1, 1, 1,
-1.251848, 0.5248347, -0.5041972, 1, 1, 1, 1, 1,
-1.246518, -0.5137998, -0.8926118, 1, 1, 1, 1, 1,
-1.239236, -0.04722085, -1.491206, 1, 1, 1, 1, 1,
-1.233323, -0.5340004, -0.8349332, 1, 1, 1, 1, 1,
-1.207489, -0.8986575, -1.823985, 1, 1, 1, 1, 1,
-1.207004, 0.4488692, -0.9597918, 1, 1, 1, 1, 1,
-1.20572, -0.2270176, -1.247704, 1, 1, 1, 1, 1,
-1.205342, 1.622966, -0.4481493, 1, 1, 1, 1, 1,
-1.205105, 0.5864462, -0.3155589, 1, 1, 1, 1, 1,
-1.197063, -0.6064073, -2.470289, 1, 1, 1, 1, 1,
-1.195851, -0.8996006, -1.766426, 0, 0, 1, 1, 1,
-1.189179, 0.2488985, -0.9196538, 1, 0, 0, 1, 1,
-1.180769, 0.7887698, 0.06986368, 1, 0, 0, 1, 1,
-1.18005, -0.08046601, -2.081484, 1, 0, 0, 1, 1,
-1.177459, 0.535665, 0.1544233, 1, 0, 0, 1, 1,
-1.170038, -0.3686144, -1.588926, 1, 0, 0, 1, 1,
-1.16732, 0.9727544, -0.9704744, 0, 0, 0, 1, 1,
-1.166924, -0.6475068, -1.193553, 0, 0, 0, 1, 1,
-1.162477, -2.796753, -2.726821, 0, 0, 0, 1, 1,
-1.162442, -0.7914333, -2.426747, 0, 0, 0, 1, 1,
-1.125535, 0.5080035, -0.908023, 0, 0, 0, 1, 1,
-1.1251, 0.7206492, 1.396297, 0, 0, 0, 1, 1,
-1.124769, -1.088597, -0.8156284, 0, 0, 0, 1, 1,
-1.122767, 0.4416123, -1.403702, 1, 1, 1, 1, 1,
-1.114001, 0.1587135, -1.418859, 1, 1, 1, 1, 1,
-1.113479, -0.7115016, -3.528761, 1, 1, 1, 1, 1,
-1.106492, -0.3678762, -1.995581, 1, 1, 1, 1, 1,
-1.102751, 0.1650141, 0.1717479, 1, 1, 1, 1, 1,
-1.099943, 0.3857107, -1.406668, 1, 1, 1, 1, 1,
-1.092104, 1.739093, -2.144599, 1, 1, 1, 1, 1,
-1.086575, 0.4854568, -0.9618369, 1, 1, 1, 1, 1,
-1.086036, 2.033755, -0.7997175, 1, 1, 1, 1, 1,
-1.084037, 1.047843, -0.6764943, 1, 1, 1, 1, 1,
-1.074528, -0.5448747, -0.579688, 1, 1, 1, 1, 1,
-1.06696, -0.5277373, -1.735012, 1, 1, 1, 1, 1,
-1.064734, 1.49212, -0.9044888, 1, 1, 1, 1, 1,
-1.060358, 0.2984406, -0.2270459, 1, 1, 1, 1, 1,
-1.053409, -1.137238, -3.172869, 1, 1, 1, 1, 1,
-1.053253, -1.29591, -1.044157, 0, 0, 1, 1, 1,
-1.043856, 1.192476, -0.7772239, 1, 0, 0, 1, 1,
-1.042731, 0.3170692, 0.2751614, 1, 0, 0, 1, 1,
-1.039562, 0.4583724, -1.865007, 1, 0, 0, 1, 1,
-1.039342, -0.0002442928, -1.398936, 1, 0, 0, 1, 1,
-1.034404, 0.431387, 0.774661, 1, 0, 0, 1, 1,
-1.03215, -0.816142, -2.94415, 0, 0, 0, 1, 1,
-1.028233, 0.1902463, -1.704083, 0, 0, 0, 1, 1,
-1.027135, -1.982833, -3.186654, 0, 0, 0, 1, 1,
-1.02712, -0.7537678, -2.116109, 0, 0, 0, 1, 1,
-1.017342, -0.1533566, -0.4619183, 0, 0, 0, 1, 1,
-1.014401, 1.071501, -0.7137958, 0, 0, 0, 1, 1,
-1.010193, -0.4288955, -1.528613, 0, 0, 0, 1, 1,
-1.009344, 0.4115007, -2.295018, 1, 1, 1, 1, 1,
-1.008014, 0.6946777, -0.5619733, 1, 1, 1, 1, 1,
-1.003406, -0.7136016, -2.425145, 1, 1, 1, 1, 1,
-1.000195, -0.2297601, -1.216624, 1, 1, 1, 1, 1,
-0.9994314, -1.719574, -0.887112, 1, 1, 1, 1, 1,
-0.998276, 1.59354, -0.4283254, 1, 1, 1, 1, 1,
-0.9943567, 1.464684, -0.9652609, 1, 1, 1, 1, 1,
-0.9929229, 0.8065607, 0.7023597, 1, 1, 1, 1, 1,
-0.9888992, -1.53948, -4.312219, 1, 1, 1, 1, 1,
-0.9865558, -0.338165, -1.172038, 1, 1, 1, 1, 1,
-0.967381, 0.4541733, -0.5785956, 1, 1, 1, 1, 1,
-0.9672465, -1.333914, -2.893045, 1, 1, 1, 1, 1,
-0.9622902, -1.172712, -1.867841, 1, 1, 1, 1, 1,
-0.9583704, -1.272986, -1.424174, 1, 1, 1, 1, 1,
-0.9579228, -0.4808573, -3.933423, 1, 1, 1, 1, 1,
-0.945347, -0.1785991, -3.142866, 0, 0, 1, 1, 1,
-0.9382867, 0.50447, -3.190678, 1, 0, 0, 1, 1,
-0.9374587, -0.3828457, -0.8213925, 1, 0, 0, 1, 1,
-0.9356301, 2.421241, 0.6987638, 1, 0, 0, 1, 1,
-0.934563, -0.2604571, -1.037523, 1, 0, 0, 1, 1,
-0.9243605, 2.941506, -0.9833509, 1, 0, 0, 1, 1,
-0.9167577, 0.9339591, -1.912274, 0, 0, 0, 1, 1,
-0.9158624, -1.203062, -3.343424, 0, 0, 0, 1, 1,
-0.9064096, 1.069457, -0.9704891, 0, 0, 0, 1, 1,
-0.9015032, -0.1714651, -1.809188, 0, 0, 0, 1, 1,
-0.8999217, -0.463598, -2.173328, 0, 0, 0, 1, 1,
-0.8997484, -2.678364, -2.679979, 0, 0, 0, 1, 1,
-0.8955824, 0.7254254, -3.440343, 0, 0, 0, 1, 1,
-0.8916125, -0.2969993, -0.394674, 1, 1, 1, 1, 1,
-0.8886395, -0.7575951, -0.639563, 1, 1, 1, 1, 1,
-0.8870008, -0.947543, -2.762891, 1, 1, 1, 1, 1,
-0.8854696, 0.4082175, -1.069947, 1, 1, 1, 1, 1,
-0.8682263, -0.649707, -1.63779, 1, 1, 1, 1, 1,
-0.8665206, -1.90503, -3.196932, 1, 1, 1, 1, 1,
-0.863934, 1.876504, -0.4964402, 1, 1, 1, 1, 1,
-0.8597024, 0.006097687, -0.8625725, 1, 1, 1, 1, 1,
-0.8593941, -1.985371, -1.809819, 1, 1, 1, 1, 1,
-0.8554539, 0.4758806, -1.533191, 1, 1, 1, 1, 1,
-0.85417, -2.286041, -2.482632, 1, 1, 1, 1, 1,
-0.8534664, -1.188864, -1.792013, 1, 1, 1, 1, 1,
-0.8526415, 1.14723, -0.1965753, 1, 1, 1, 1, 1,
-0.8490064, -0.645732, -1.064877, 1, 1, 1, 1, 1,
-0.8459356, -0.274864, -2.64792, 1, 1, 1, 1, 1,
-0.8430598, -0.08274066, -1.532627, 0, 0, 1, 1, 1,
-0.8366587, 0.4529409, -0.9606218, 1, 0, 0, 1, 1,
-0.8253151, -0.4391957, -2.155871, 1, 0, 0, 1, 1,
-0.8205224, 0.2206202, -0.5690408, 1, 0, 0, 1, 1,
-0.8193277, -0.6763693, -1.105268, 1, 0, 0, 1, 1,
-0.8161336, 0.2124601, -2.382638, 1, 0, 0, 1, 1,
-0.8142518, 1.848011, -2.731861, 0, 0, 0, 1, 1,
-0.8095851, -0.01283478, -3.611972, 0, 0, 0, 1, 1,
-0.8066713, 0.1527011, -1.192789, 0, 0, 0, 1, 1,
-0.8046534, 0.3837046, -1.38063, 0, 0, 0, 1, 1,
-0.8041429, -0.266896, -2.66804, 0, 0, 0, 1, 1,
-0.8027392, -3.054254, -2.483488, 0, 0, 0, 1, 1,
-0.8000242, -0.3235669, -1.481132, 0, 0, 0, 1, 1,
-0.7969398, -0.6316144, 0.1560809, 1, 1, 1, 1, 1,
-0.7969081, 1.588837, -2.005277, 1, 1, 1, 1, 1,
-0.7964826, 1.184536, -0.7249863, 1, 1, 1, 1, 1,
-0.7931219, -0.7139437, -0.8387415, 1, 1, 1, 1, 1,
-0.7917688, 0.9025081, 0.4186891, 1, 1, 1, 1, 1,
-0.7864162, 0.2179201, -0.4106085, 1, 1, 1, 1, 1,
-0.7780282, -1.509289, -2.210054, 1, 1, 1, 1, 1,
-0.7755194, 1.447089, 1.342677, 1, 1, 1, 1, 1,
-0.771413, -0.6331958, -1.778786, 1, 1, 1, 1, 1,
-0.7648616, 0.579622, -0.3783019, 1, 1, 1, 1, 1,
-0.7629372, -0.7488271, -0.87102, 1, 1, 1, 1, 1,
-0.7611548, 0.7449625, 0.3389374, 1, 1, 1, 1, 1,
-0.754642, -0.005662427, -1.16244, 1, 1, 1, 1, 1,
-0.7505249, 0.4216395, -2.162223, 1, 1, 1, 1, 1,
-0.7428448, 1.025972, -0.01165944, 1, 1, 1, 1, 1,
-0.7418882, 1.328433, -0.3204091, 0, 0, 1, 1, 1,
-0.7411205, 0.1862274, -2.655902, 1, 0, 0, 1, 1,
-0.741009, 0.5268881, -0.1051557, 1, 0, 0, 1, 1,
-0.7393583, -2.396843, -2.363737, 1, 0, 0, 1, 1,
-0.7348208, 2.426388, -1.277557, 1, 0, 0, 1, 1,
-0.7314698, 0.6326371, -1.411836, 1, 0, 0, 1, 1,
-0.7278828, -1.29949, -2.828327, 0, 0, 0, 1, 1,
-0.7218224, -0.3664029, -1.867918, 0, 0, 0, 1, 1,
-0.7192574, 0.1286043, -1.242647, 0, 0, 0, 1, 1,
-0.7133768, -0.4316041, -0.9540653, 0, 0, 0, 1, 1,
-0.7131695, -0.5253745, -1.353559, 0, 0, 0, 1, 1,
-0.7099826, 0.5502913, -0.3636993, 0, 0, 0, 1, 1,
-0.7070411, 2.415451, -0.53348, 0, 0, 0, 1, 1,
-0.705802, -0.0893067, -0.9140558, 1, 1, 1, 1, 1,
-0.7045433, -0.7579358, -0.5099919, 1, 1, 1, 1, 1,
-0.7034089, 0.1028497, -0.6585776, 1, 1, 1, 1, 1,
-0.699044, 1.588914, -0.2588597, 1, 1, 1, 1, 1,
-0.698387, -2.584776, -2.581419, 1, 1, 1, 1, 1,
-0.6952421, -0.3311871, -1.342304, 1, 1, 1, 1, 1,
-0.6881803, 0.8932154, -0.3087066, 1, 1, 1, 1, 1,
-0.680518, 0.3894993, -0.1841561, 1, 1, 1, 1, 1,
-0.6781281, 0.878146, -0.07566173, 1, 1, 1, 1, 1,
-0.6765578, -1.810725, -1.901115, 1, 1, 1, 1, 1,
-0.6748894, -0.8462478, -1.147899, 1, 1, 1, 1, 1,
-0.6721827, -0.598096, -3.127976, 1, 1, 1, 1, 1,
-0.6706269, 0.1635299, -0.5294105, 1, 1, 1, 1, 1,
-0.6701858, 0.4975221, -0.6754268, 1, 1, 1, 1, 1,
-0.6696566, -1.364709, -3.500695, 1, 1, 1, 1, 1,
-0.6655048, 0.02610464, -1.40524, 0, 0, 1, 1, 1,
-0.6642471, 0.1523833, -3.174564, 1, 0, 0, 1, 1,
-0.6619019, -0.2264997, -2.503295, 1, 0, 0, 1, 1,
-0.6558586, -1.075558, -4.104823, 1, 0, 0, 1, 1,
-0.6535969, -1.034437, -3.912628, 1, 0, 0, 1, 1,
-0.6404829, 1.091591, -2.310742, 1, 0, 0, 1, 1,
-0.6354633, 0.2901674, -2.455085, 0, 0, 0, 1, 1,
-0.6299558, -0.8124356, -1.935024, 0, 0, 0, 1, 1,
-0.6241175, 0.3871751, 0.6298201, 0, 0, 0, 1, 1,
-0.6237982, -0.1692628, -1.903603, 0, 0, 0, 1, 1,
-0.6230219, -1.115102, -2.226913, 0, 0, 0, 1, 1,
-0.6214025, 2.01551, -2.014585, 0, 0, 0, 1, 1,
-0.6196969, -1.442423, -2.81929, 0, 0, 0, 1, 1,
-0.6191431, 0.8480064, -0.5059832, 1, 1, 1, 1, 1,
-0.6168833, 0.9731676, -0.273239, 1, 1, 1, 1, 1,
-0.6140632, 0.5355948, -1.425378, 1, 1, 1, 1, 1,
-0.6128792, -0.7681537, -3.476087, 1, 1, 1, 1, 1,
-0.596729, -1.60807, -3.446865, 1, 1, 1, 1, 1,
-0.593904, 0.2276303, -3.564154, 1, 1, 1, 1, 1,
-0.5935912, 0.8382434, -0.7289246, 1, 1, 1, 1, 1,
-0.5935602, 0.07143513, -2.278476, 1, 1, 1, 1, 1,
-0.5916902, 0.5729845, 1.499758, 1, 1, 1, 1, 1,
-0.5892301, 0.5034998, -1.283745, 1, 1, 1, 1, 1,
-0.5871032, 1.135254, -0.690665, 1, 1, 1, 1, 1,
-0.5833456, 0.2557377, -1.923001, 1, 1, 1, 1, 1,
-0.5799655, 1.338544, 2.289631, 1, 1, 1, 1, 1,
-0.579237, -1.559276, -3.984271, 1, 1, 1, 1, 1,
-0.5777741, -1.143857, -3.673697, 1, 1, 1, 1, 1,
-0.5757632, 0.1743359, 0.7889495, 0, 0, 1, 1, 1,
-0.567625, -0.4986591, -1.472818, 1, 0, 0, 1, 1,
-0.5660772, 1.794648, 1.505201, 1, 0, 0, 1, 1,
-0.5648167, -0.4281065, -2.173318, 1, 0, 0, 1, 1,
-0.5619469, 1.396411, -0.8205764, 1, 0, 0, 1, 1,
-0.5593126, -0.8933686, -3.662725, 1, 0, 0, 1, 1,
-0.5576161, 1.370857, 0.7326843, 0, 0, 0, 1, 1,
-0.5519029, 0.01308355, -2.412487, 0, 0, 0, 1, 1,
-0.547987, -1.530791, -2.172949, 0, 0, 0, 1, 1,
-0.5354506, -0.06759623, 0.2699426, 0, 0, 0, 1, 1,
-0.5327193, 0.07578383, -0.6116745, 0, 0, 0, 1, 1,
-0.5292009, 1.606181, -1.143849, 0, 0, 0, 1, 1,
-0.5275149, -0.9563856, -3.428854, 0, 0, 0, 1, 1,
-0.5271668, 0.6081222, -0.1093262, 1, 1, 1, 1, 1,
-0.5264705, -1.226573, -3.349299, 1, 1, 1, 1, 1,
-0.5246004, -0.2691731, -3.529033, 1, 1, 1, 1, 1,
-0.5235699, -0.556012, -2.27324, 1, 1, 1, 1, 1,
-0.5233934, -1.00339, -2.489795, 1, 1, 1, 1, 1,
-0.520538, 1.272516, -0.01174803, 1, 1, 1, 1, 1,
-0.5181652, -0.707963, -3.13559, 1, 1, 1, 1, 1,
-0.5165185, 0.08185484, -1.636015, 1, 1, 1, 1, 1,
-0.5163336, -0.5840488, -3.706445, 1, 1, 1, 1, 1,
-0.5130424, -1.513328, -2.63449, 1, 1, 1, 1, 1,
-0.5114959, -2.227115, -2.604136, 1, 1, 1, 1, 1,
-0.5114278, -0.2345613, -0.4833161, 1, 1, 1, 1, 1,
-0.5110721, -0.143394, 0.3482505, 1, 1, 1, 1, 1,
-0.5109761, 0.2210446, -0.5099762, 1, 1, 1, 1, 1,
-0.5062337, -3.169788, -1.817476, 1, 1, 1, 1, 1,
-0.5054579, -0.367592, -0.3094802, 0, 0, 1, 1, 1,
-0.5030049, 0.1587933, -0.6344164, 1, 0, 0, 1, 1,
-0.4992806, 2.308462, -0.5688068, 1, 0, 0, 1, 1,
-0.4953482, -0.5978007, -3.914474, 1, 0, 0, 1, 1,
-0.486142, -0.3677248, -2.114113, 1, 0, 0, 1, 1,
-0.4851743, 1.102756, -0.9671253, 1, 0, 0, 1, 1,
-0.4793326, 1.92583, -0.8169901, 0, 0, 0, 1, 1,
-0.4706604, 1.179898, 0.7831043, 0, 0, 0, 1, 1,
-0.4694962, -0.5904565, -2.943645, 0, 0, 0, 1, 1,
-0.467972, 1.291994, -0.06834732, 0, 0, 0, 1, 1,
-0.4668859, 0.2201321, -2.924267, 0, 0, 0, 1, 1,
-0.4632211, -0.2399828, -4.248345, 0, 0, 0, 1, 1,
-0.4622679, -0.1153745, -3.27245, 0, 0, 0, 1, 1,
-0.45902, 2.503927, -0.6397629, 1, 1, 1, 1, 1,
-0.4567931, 0.9014246, -0.9147351, 1, 1, 1, 1, 1,
-0.4526374, -0.8414757, -2.854578, 1, 1, 1, 1, 1,
-0.448326, 1.531655, -0.8650247, 1, 1, 1, 1, 1,
-0.44817, 0.5499422, -0.8700674, 1, 1, 1, 1, 1,
-0.4444114, -2.340383, -3.194524, 1, 1, 1, 1, 1,
-0.4396149, 1.665107, -0.9874276, 1, 1, 1, 1, 1,
-0.4367222, -0.5263298, -3.378759, 1, 1, 1, 1, 1,
-0.4366951, 0.7247987, -1.015643, 1, 1, 1, 1, 1,
-0.4356241, 0.6291295, -0.7650908, 1, 1, 1, 1, 1,
-0.4321574, 1.833254, -0.7574388, 1, 1, 1, 1, 1,
-0.4309042, 0.3837076, -3.337007, 1, 1, 1, 1, 1,
-0.4292637, -1.137989, -3.406358, 1, 1, 1, 1, 1,
-0.4290538, 1.371347, -0.1013867, 1, 1, 1, 1, 1,
-0.4288892, 2.834891, 4.018378, 1, 1, 1, 1, 1,
-0.4257686, 1.754007, -1.047524, 0, 0, 1, 1, 1,
-0.424312, -1.579194, -2.247355, 1, 0, 0, 1, 1,
-0.4192108, 0.1986923, -0.3858051, 1, 0, 0, 1, 1,
-0.415517, -0.5703404, -4.496094, 1, 0, 0, 1, 1,
-0.4154453, 0.4740882, 1.070493, 1, 0, 0, 1, 1,
-0.4111376, 0.1301724, -1.872777, 1, 0, 0, 1, 1,
-0.4108544, 0.885316, 0.1821277, 0, 0, 0, 1, 1,
-0.4046996, 1.140371, -0.3169709, 0, 0, 0, 1, 1,
-0.3976253, -0.7415011, -2.080864, 0, 0, 0, 1, 1,
-0.396944, 0.0983048, 0.08605871, 0, 0, 0, 1, 1,
-0.3967037, 0.7204838, -0.8671077, 0, 0, 0, 1, 1,
-0.3962049, 1.807582, -0.309976, 0, 0, 0, 1, 1,
-0.39423, -0.9741718, -3.454948, 0, 0, 0, 1, 1,
-0.3933364, 0.4731786, -1.035561, 1, 1, 1, 1, 1,
-0.3878511, 1.083093, -0.9358087, 1, 1, 1, 1, 1,
-0.3874006, 1.538569, 0.9162341, 1, 1, 1, 1, 1,
-0.3854409, 0.5521732, 0.1231075, 1, 1, 1, 1, 1,
-0.3754545, -0.2478757, -2.286822, 1, 1, 1, 1, 1,
-0.3731479, -0.9099611, -2.555892, 1, 1, 1, 1, 1,
-0.3728561, 0.8650082, -0.5688053, 1, 1, 1, 1, 1,
-0.372583, -0.9162381, -2.606653, 1, 1, 1, 1, 1,
-0.3715968, -0.336401, -3.336056, 1, 1, 1, 1, 1,
-0.3690508, -1.511615, -3.027914, 1, 1, 1, 1, 1,
-0.3662533, 0.1072218, -1.357316, 1, 1, 1, 1, 1,
-0.3659557, -0.1882697, -2.518614, 1, 1, 1, 1, 1,
-0.3649324, 0.9069604, -0.4862284, 1, 1, 1, 1, 1,
-0.3636037, -0.3368975, -1.84748, 1, 1, 1, 1, 1,
-0.3582958, 1.302339, -1.959018, 1, 1, 1, 1, 1,
-0.3571444, 1.310036, -1.102292, 0, 0, 1, 1, 1,
-0.3544391, -2.252545, -2.871475, 1, 0, 0, 1, 1,
-0.3492935, 0.8757734, -0.3808242, 1, 0, 0, 1, 1,
-0.3486042, -0.2438754, -1.195616, 1, 0, 0, 1, 1,
-0.3446808, 0.1470706, -0.8146489, 1, 0, 0, 1, 1,
-0.3425021, -0.5512114, -2.05489, 1, 0, 0, 1, 1,
-0.3387112, -2.421721, -3.482274, 0, 0, 0, 1, 1,
-0.3366353, -0.9872025, -3.481675, 0, 0, 0, 1, 1,
-0.3342106, -0.7590872, -3.150317, 0, 0, 0, 1, 1,
-0.3296131, -0.129698, -0.7671453, 0, 0, 0, 1, 1,
-0.3291091, 0.6839957, 0.968816, 0, 0, 0, 1, 1,
-0.3270592, 0.9599929, -1.719523, 0, 0, 0, 1, 1,
-0.3268289, 0.2202896, -1.3277, 0, 0, 0, 1, 1,
-0.3234729, -0.2292887, -1.587547, 1, 1, 1, 1, 1,
-0.3222891, -0.9548384, -2.550143, 1, 1, 1, 1, 1,
-0.3210424, 1.117003, 0.07260883, 1, 1, 1, 1, 1,
-0.3197004, 0.5698069, 0.4677327, 1, 1, 1, 1, 1,
-0.3139174, 0.5992147, 0.0321927, 1, 1, 1, 1, 1,
-0.3113624, -1.171914, -2.745632, 1, 1, 1, 1, 1,
-0.3107391, 0.3513767, -1.607495, 1, 1, 1, 1, 1,
-0.3089929, -1.480203, -2.218662, 1, 1, 1, 1, 1,
-0.3087019, 0.187504, -2.318456, 1, 1, 1, 1, 1,
-0.3048632, -0.4713169, -1.616617, 1, 1, 1, 1, 1,
-0.3045998, 0.5944003, 0.6627213, 1, 1, 1, 1, 1,
-0.3031705, -0.03714334, -1.600301, 1, 1, 1, 1, 1,
-0.3025907, -1.875981, -1.154227, 1, 1, 1, 1, 1,
-0.3010466, -0.3286026, -2.422825, 1, 1, 1, 1, 1,
-0.300197, 2.245325, 1.697291, 1, 1, 1, 1, 1,
-0.2990957, 1.213777, -0.4319152, 0, 0, 1, 1, 1,
-0.2985629, -1.466963, -3.142919, 1, 0, 0, 1, 1,
-0.2972725, 1.747243, 0.009515668, 1, 0, 0, 1, 1,
-0.2890234, -2.639838, -2.815715, 1, 0, 0, 1, 1,
-0.2879203, -0.149467, -3.340819, 1, 0, 0, 1, 1,
-0.2830747, -0.8540914, -2.756535, 1, 0, 0, 1, 1,
-0.2769114, -2.760224, -1.629974, 0, 0, 0, 1, 1,
-0.2711519, 0.2516691, 2.051973, 0, 0, 0, 1, 1,
-0.2698767, -0.9260836, -3.0242, 0, 0, 0, 1, 1,
-0.2694371, -0.3229696, -3.501114, 0, 0, 0, 1, 1,
-0.2662513, 0.3456561, -1.044256, 0, 0, 0, 1, 1,
-0.2659849, 0.5449123, 1.076148, 0, 0, 0, 1, 1,
-0.2643399, -0.725438, -2.775917, 0, 0, 0, 1, 1,
-0.2639867, 0.9421954, -0.9680747, 1, 1, 1, 1, 1,
-0.2622365, 0.9826796, -0.3618784, 1, 1, 1, 1, 1,
-0.2613717, 0.5781683, -0.4944976, 1, 1, 1, 1, 1,
-0.2576462, 0.2595876, -0.803154, 1, 1, 1, 1, 1,
-0.2570124, 0.9498992, -2.594975, 1, 1, 1, 1, 1,
-0.2536443, -0.5430074, -3.121456, 1, 1, 1, 1, 1,
-0.2534705, -0.8335143, -3.018934, 1, 1, 1, 1, 1,
-0.2517371, 0.8548477, -0.1581415, 1, 1, 1, 1, 1,
-0.2418065, 0.9524273, 2.512522, 1, 1, 1, 1, 1,
-0.2410727, 2.033233, 0.05178791, 1, 1, 1, 1, 1,
-0.2361877, -0.6307563, -3.976789, 1, 1, 1, 1, 1,
-0.2361617, 1.28229, -0.3357511, 1, 1, 1, 1, 1,
-0.2355471, -0.8007154, -1.553203, 1, 1, 1, 1, 1,
-0.2354182, -1.656945, -2.216215, 1, 1, 1, 1, 1,
-0.2287518, 1.052566, -0.4034361, 1, 1, 1, 1, 1,
-0.2285607, 0.337152, 0.2296777, 0, 0, 1, 1, 1,
-0.2277251, 1.52318, 0.3974977, 1, 0, 0, 1, 1,
-0.222656, 0.4424, 0.8667989, 1, 0, 0, 1, 1,
-0.220748, 1.036828, -0.4955737, 1, 0, 0, 1, 1,
-0.2202065, 1.205725, -0.6511638, 1, 0, 0, 1, 1,
-0.2201894, -0.115563, -2.175992, 1, 0, 0, 1, 1,
-0.2192105, 0.988095, -0.1712357, 0, 0, 0, 1, 1,
-0.2106588, 0.4419857, 0.2922304, 0, 0, 0, 1, 1,
-0.2069273, 0.3336564, -0.4484976, 0, 0, 0, 1, 1,
-0.201979, -0.5750801, -2.66257, 0, 0, 0, 1, 1,
-0.2017661, -0.3592584, -3.104912, 0, 0, 0, 1, 1,
-0.1966259, -0.6781245, -4.498795, 0, 0, 0, 1, 1,
-0.1954703, -1.270605, -2.572415, 0, 0, 0, 1, 1,
-0.1882113, 0.2759045, -0.4730022, 1, 1, 1, 1, 1,
-0.1880151, -0.5850934, -3.798412, 1, 1, 1, 1, 1,
-0.1830918, -0.2776007, -2.374206, 1, 1, 1, 1, 1,
-0.1774695, 1.537116, 1.070962, 1, 1, 1, 1, 1,
-0.1742485, -1.201494, -1.574371, 1, 1, 1, 1, 1,
-0.1661253, -0.1434108, -0.91107, 1, 1, 1, 1, 1,
-0.1640869, 0.7549124, 0.492174, 1, 1, 1, 1, 1,
-0.1629516, -0.5202371, -2.48034, 1, 1, 1, 1, 1,
-0.1629501, -0.4943641, -2.415067, 1, 1, 1, 1, 1,
-0.1599579, 1.145615, -0.4909427, 1, 1, 1, 1, 1,
-0.1565581, 0.3611789, -0.2599021, 1, 1, 1, 1, 1,
-0.1562537, 0.2175274, -0.2462597, 1, 1, 1, 1, 1,
-0.1539347, 1.903556, 0.5767825, 1, 1, 1, 1, 1,
-0.1528005, -0.654158, -1.597419, 1, 1, 1, 1, 1,
-0.1443695, -0.3123061, -2.972286, 1, 1, 1, 1, 1,
-0.1430356, 0.9986786, -0.09864887, 0, 0, 1, 1, 1,
-0.1246974, -1.996237, -4.727041, 1, 0, 0, 1, 1,
-0.1205189, -0.1983509, -3.633038, 1, 0, 0, 1, 1,
-0.1203399, -0.08432738, -2.468103, 1, 0, 0, 1, 1,
-0.1184913, 2.483354, 0.07740633, 1, 0, 0, 1, 1,
-0.1142822, -0.9951637, -2.803594, 1, 0, 0, 1, 1,
-0.1135256, -0.4319218, -2.070625, 0, 0, 0, 1, 1,
-0.1094233, 0.6113899, -1.95299, 0, 0, 0, 1, 1,
-0.1052787, 0.849031, -0.9579769, 0, 0, 0, 1, 1,
-0.1021032, -0.3810751, -2.836646, 0, 0, 0, 1, 1,
-0.09950256, -0.4723019, -2.420187, 0, 0, 0, 1, 1,
-0.09906857, -1.017371, -1.155152, 0, 0, 0, 1, 1,
-0.09317395, 2.444333, 0.1712874, 0, 0, 0, 1, 1,
-0.07923307, 0.9798517, 0.990471, 1, 1, 1, 1, 1,
-0.07689972, -0.08012277, -2.583779, 1, 1, 1, 1, 1,
-0.07674158, -0.5724003, -0.4073023, 1, 1, 1, 1, 1,
-0.0713065, 1.363352, -0.06790615, 1, 1, 1, 1, 1,
-0.06777086, 0.754854, -0.4681441, 1, 1, 1, 1, 1,
-0.05732096, -1.137758, -5.01873, 1, 1, 1, 1, 1,
-0.05351374, 0.4363683, -1.443133, 1, 1, 1, 1, 1,
-0.05280043, -0.99441, -2.907966, 1, 1, 1, 1, 1,
-0.05127971, -0.4402171, -2.028096, 1, 1, 1, 1, 1,
-0.05085848, -0.4982794, -1.436962, 1, 1, 1, 1, 1,
-0.04331335, -0.1918746, -3.646549, 1, 1, 1, 1, 1,
-0.04139087, 0.8864565, 0.2784837, 1, 1, 1, 1, 1,
-0.04107446, -0.1842628, -3.245938, 1, 1, 1, 1, 1,
-0.04094592, 0.6401638, 0.3209604, 1, 1, 1, 1, 1,
-0.03761233, -2.52387, -1.676511, 1, 1, 1, 1, 1,
-0.03573042, -0.9738821, -2.247959, 0, 0, 1, 1, 1,
-0.03519052, 0.4648963, 0.3738992, 1, 0, 0, 1, 1,
-0.03425156, 0.6928445, 0.466586, 1, 0, 0, 1, 1,
-0.03328822, -1.302705, -5.24788, 1, 0, 0, 1, 1,
-0.02875448, 1.15814, -0.4445069, 1, 0, 0, 1, 1,
-0.02865054, -0.4524586, -1.948692, 1, 0, 0, 1, 1,
-0.02696084, 0.8739575, -0.09412466, 0, 0, 0, 1, 1,
-0.02457219, -1.633381, -4.954979, 0, 0, 0, 1, 1,
-0.02135318, -0.4713936, -4.124166, 0, 0, 0, 1, 1,
-0.02027488, -2.20524, -3.106215, 0, 0, 0, 1, 1,
-0.01451158, -0.08412295, -4.230522, 0, 0, 0, 1, 1,
-0.01321622, 1.261734, 2.18668, 0, 0, 0, 1, 1,
-0.01212311, -0.08823478, -2.438779, 0, 0, 0, 1, 1,
-0.01196056, -1.278732, -3.535644, 1, 1, 1, 1, 1,
-0.01123904, -0.5624133, -2.634792, 1, 1, 1, 1, 1,
-0.0102186, -1.111589, -2.941787, 1, 1, 1, 1, 1,
-0.009625446, 0.08592604, -0.3577885, 1, 1, 1, 1, 1,
-0.007288904, -0.7172297, -4.445932, 1, 1, 1, 1, 1,
-0.003395317, 0.5272923, -1.542606, 1, 1, 1, 1, 1,
-0.0009745825, 1.418642, -1.065941, 1, 1, 1, 1, 1,
0.009961095, -0.1727045, 4.534535, 1, 1, 1, 1, 1,
0.01099823, 0.5929849, 0.1245242, 1, 1, 1, 1, 1,
0.01278447, 0.2863318, 1.36733, 1, 1, 1, 1, 1,
0.0139817, 0.6358107, -1.433767, 1, 1, 1, 1, 1,
0.01541447, -0.1712415, 2.797007, 1, 1, 1, 1, 1,
0.01722495, -0.2324865, 4.206163, 1, 1, 1, 1, 1,
0.01870979, 0.207516, 0.1235981, 1, 1, 1, 1, 1,
0.01915616, -1.019988, 1.845162, 1, 1, 1, 1, 1,
0.02090072, 0.09702893, -0.6553928, 0, 0, 1, 1, 1,
0.02162554, -0.7194958, 4.437521, 1, 0, 0, 1, 1,
0.02250747, -0.3519585, 1.382577, 1, 0, 0, 1, 1,
0.02298049, -1.426893, 1.929984, 1, 0, 0, 1, 1,
0.02682658, -0.354265, 4.282003, 1, 0, 0, 1, 1,
0.03619917, -0.9722285, 3.555489, 1, 0, 0, 1, 1,
0.03637033, 0.7598459, -0.08284444, 0, 0, 0, 1, 1,
0.03717315, 1.554173, -1.281565, 0, 0, 0, 1, 1,
0.04280918, 0.1499476, -0.07836135, 0, 0, 0, 1, 1,
0.04446197, -0.8788612, 3.371344, 0, 0, 0, 1, 1,
0.04456467, -0.2808686, 2.818089, 0, 0, 0, 1, 1,
0.0537639, 1.426205, -0.3231305, 0, 0, 0, 1, 1,
0.05448258, -0.4633662, 2.475287, 0, 0, 0, 1, 1,
0.05478296, -0.02494261, 2.834302, 1, 1, 1, 1, 1,
0.0591203, 1.03803, 0.765203, 1, 1, 1, 1, 1,
0.05949852, 0.146573, -1.404628, 1, 1, 1, 1, 1,
0.06031532, 0.2879444, 0.496628, 1, 1, 1, 1, 1,
0.06774918, -0.2340506, 5.168954, 1, 1, 1, 1, 1,
0.06854694, 0.2625348, 1.660141, 1, 1, 1, 1, 1,
0.07171993, 0.7100034, 1.295562, 1, 1, 1, 1, 1,
0.07559849, -1.705101, 2.34209, 1, 1, 1, 1, 1,
0.07696334, -1.233287, 1.427834, 1, 1, 1, 1, 1,
0.07699129, -1.204362, 2.351069, 1, 1, 1, 1, 1,
0.07742136, 0.2621373, 0.1391374, 1, 1, 1, 1, 1,
0.07794666, 0.1600187, 2.04366, 1, 1, 1, 1, 1,
0.07811231, -0.4920183, 3.845104, 1, 1, 1, 1, 1,
0.08301048, 1.320911, -0.309055, 1, 1, 1, 1, 1,
0.09034644, 0.03910015, 2.158576, 1, 1, 1, 1, 1,
0.09121943, -0.4731537, 3.416241, 0, 0, 1, 1, 1,
0.09274527, -0.3189719, 1.451525, 1, 0, 0, 1, 1,
0.09576754, -0.1775096, 1.983883, 1, 0, 0, 1, 1,
0.09912333, -0.5080062, 2.688845, 1, 0, 0, 1, 1,
0.09918257, -0.5728255, 4.654174, 1, 0, 0, 1, 1,
0.10129, -0.1093862, 1.352051, 1, 0, 0, 1, 1,
0.1025632, -0.7009404, 1.725623, 0, 0, 0, 1, 1,
0.1069218, 0.3840398, 1.42331, 0, 0, 0, 1, 1,
0.1135729, -1.299325, 2.965303, 0, 0, 0, 1, 1,
0.1157963, 0.3745473, 0.02429961, 0, 0, 0, 1, 1,
0.1191416, -0.1087523, 2.033647, 0, 0, 0, 1, 1,
0.1205196, 0.1633666, -0.07747117, 0, 0, 0, 1, 1,
0.1207389, 1.708595, -1.021319, 0, 0, 0, 1, 1,
0.1221236, -1.486218, 2.282573, 1, 1, 1, 1, 1,
0.1240057, -0.5118207, 2.566694, 1, 1, 1, 1, 1,
0.1245426, -0.8238894, 1.829693, 1, 1, 1, 1, 1,
0.130438, 1.148228, 1.184305, 1, 1, 1, 1, 1,
0.1335548, -0.4585522, -0.2079162, 1, 1, 1, 1, 1,
0.1339304, -0.3016036, 2.905894, 1, 1, 1, 1, 1,
0.1362769, 0.3660958, 1.277783, 1, 1, 1, 1, 1,
0.1371886, 1.665284, 0.7605654, 1, 1, 1, 1, 1,
0.1398828, -1.241167, 3.235142, 1, 1, 1, 1, 1,
0.1436227, 0.4109705, 1.24196, 1, 1, 1, 1, 1,
0.1448114, 0.2011397, 1.247607, 1, 1, 1, 1, 1,
0.1482355, 0.9585133, -0.3580805, 1, 1, 1, 1, 1,
0.1498503, 0.3527856, -0.438154, 1, 1, 1, 1, 1,
0.1528429, -0.4642129, 2.513421, 1, 1, 1, 1, 1,
0.1547532, -1.283432, 2.510439, 1, 1, 1, 1, 1,
0.1547647, -0.5649945, 2.284421, 0, 0, 1, 1, 1,
0.1557246, -0.5589431, 1.77993, 1, 0, 0, 1, 1,
0.1631905, -0.0354046, 0.9879836, 1, 0, 0, 1, 1,
0.1632926, 1.128628, -0.9025354, 1, 0, 0, 1, 1,
0.166211, 0.1543968, 1.323595, 1, 0, 0, 1, 1,
0.169103, -0.6047121, 2.628217, 1, 0, 0, 1, 1,
0.1716807, -0.7430577, 3.020775, 0, 0, 0, 1, 1,
0.1758684, 0.3170044, 0.7561738, 0, 0, 0, 1, 1,
0.180019, -0.7917529, 3.153806, 0, 0, 0, 1, 1,
0.1801049, 0.6005048, -0.2060085, 0, 0, 0, 1, 1,
0.1804297, 0.4182093, 1.140668, 0, 0, 0, 1, 1,
0.1814562, -0.4409221, 1.572804, 0, 0, 0, 1, 1,
0.1832837, -0.6562162, 3.161089, 0, 0, 0, 1, 1,
0.1840914, 0.5081029, 0.4358291, 1, 1, 1, 1, 1,
0.1872885, -0.5886585, 3.422939, 1, 1, 1, 1, 1,
0.1876091, 2.109561, -0.3829484, 1, 1, 1, 1, 1,
0.1884093, -1.307435, 2.143793, 1, 1, 1, 1, 1,
0.1898398, -0.2433236, 1.611374, 1, 1, 1, 1, 1,
0.1906857, 0.3826446, -0.4161378, 1, 1, 1, 1, 1,
0.1920614, -0.5228956, 3.333618, 1, 1, 1, 1, 1,
0.193876, 1.451529, 1.951534, 1, 1, 1, 1, 1,
0.1962423, -0.8416904, 3.40598, 1, 1, 1, 1, 1,
0.200516, -0.1472042, 2.342088, 1, 1, 1, 1, 1,
0.2007912, 0.8193752, -0.6513148, 1, 1, 1, 1, 1,
0.2034796, -0.03996022, 3.403647, 1, 1, 1, 1, 1,
0.2050902, 0.1643226, 0.3444186, 1, 1, 1, 1, 1,
0.2057753, -0.555791, 2.801469, 1, 1, 1, 1, 1,
0.2109225, -0.7616494, 2.945169, 1, 1, 1, 1, 1,
0.2113674, -1.145098, 3.539575, 0, 0, 1, 1, 1,
0.2121836, 0.3449481, -0.5807791, 1, 0, 0, 1, 1,
0.212226, 0.1604469, -0.09386315, 1, 0, 0, 1, 1,
0.2129897, 0.2010345, 1.974893, 1, 0, 0, 1, 1,
0.213442, 0.6975335, -0.2110571, 1, 0, 0, 1, 1,
0.2163329, 1.700661, 2.230965, 1, 0, 0, 1, 1,
0.2222231, -1.08917, 3.340188, 0, 0, 0, 1, 1,
0.2265406, 0.8372832, -1.165466, 0, 0, 0, 1, 1,
0.2306653, -2.283056, 4.14675, 0, 0, 0, 1, 1,
0.2319583, -0.04261491, 4.144136, 0, 0, 0, 1, 1,
0.2329257, -1.895987, 1.246241, 0, 0, 0, 1, 1,
0.2339038, -0.5473926, 5.325624, 0, 0, 0, 1, 1,
0.2400128, 0.7543076, 2.140012, 0, 0, 0, 1, 1,
0.2432616, -0.9394448, 2.008096, 1, 1, 1, 1, 1,
0.2516798, -0.4590158, 0.5439336, 1, 1, 1, 1, 1,
0.2543133, -0.6697794, 2.802094, 1, 1, 1, 1, 1,
0.2593053, -0.2608974, 3.39535, 1, 1, 1, 1, 1,
0.2617658, -0.008047819, 1.140852, 1, 1, 1, 1, 1,
0.2627113, 0.8637629, 0.1982285, 1, 1, 1, 1, 1,
0.2631182, 0.9146116, 1.859897, 1, 1, 1, 1, 1,
0.2636751, -0.02029569, -0.02763802, 1, 1, 1, 1, 1,
0.267933, -0.7308547, 2.288591, 1, 1, 1, 1, 1,
0.2703923, -0.1392535, 1.331308, 1, 1, 1, 1, 1,
0.2709177, -1.100085, 2.437493, 1, 1, 1, 1, 1,
0.2726904, 1.369079, 0.8775833, 1, 1, 1, 1, 1,
0.2767345, 1.059111, -0.7429956, 1, 1, 1, 1, 1,
0.2792403, -0.7343833, 2.841621, 1, 1, 1, 1, 1,
0.2796745, -0.1822523, 1.286975, 1, 1, 1, 1, 1,
0.2813513, -0.6778234, 2.171075, 0, 0, 1, 1, 1,
0.2846074, 1.052784, 0.3550611, 1, 0, 0, 1, 1,
0.289955, 1.674927, 0.5374128, 1, 0, 0, 1, 1,
0.2925492, -1.086885, 2.683622, 1, 0, 0, 1, 1,
0.2953477, -2.038044, 3.615915, 1, 0, 0, 1, 1,
0.296667, -0.07847189, 2.47194, 1, 0, 0, 1, 1,
0.3006359, -0.2776195, 1.553798, 0, 0, 0, 1, 1,
0.3048827, -2.453548, 3.518849, 0, 0, 0, 1, 1,
0.3048873, 1.009308, 1.727048, 0, 0, 0, 1, 1,
0.308951, -0.2880759, 1.486496, 0, 0, 0, 1, 1,
0.3127018, -0.1021847, 1.447143, 0, 0, 0, 1, 1,
0.3130253, -0.6335346, 3.228355, 0, 0, 0, 1, 1,
0.3131518, 0.3650092, 2.113742, 0, 0, 0, 1, 1,
0.315959, -0.04826363, -0.3060975, 1, 1, 1, 1, 1,
0.3169446, -0.6701463, 2.578323, 1, 1, 1, 1, 1,
0.3227542, -2.203626, 4.608882, 1, 1, 1, 1, 1,
0.3292422, -0.8102821, 3.247027, 1, 1, 1, 1, 1,
0.3352063, -0.2775304, 3.743208, 1, 1, 1, 1, 1,
0.336527, -1.101101, 4.01421, 1, 1, 1, 1, 1,
0.3410986, 1.40599, 0.08673211, 1, 1, 1, 1, 1,
0.3424921, 1.03935, -1.061065, 1, 1, 1, 1, 1,
0.3465424, 0.6472981, 1.180068, 1, 1, 1, 1, 1,
0.3558351, -1.480343, 1.152237, 1, 1, 1, 1, 1,
0.3609548, -0.4280334, 4.364998, 1, 1, 1, 1, 1,
0.3708825, 0.4135641, -0.07452502, 1, 1, 1, 1, 1,
0.3724915, 0.6560656, 1.011016, 1, 1, 1, 1, 1,
0.3733749, -0.1009721, 2.997051, 1, 1, 1, 1, 1,
0.3750039, 1.337475, -1.230989, 1, 1, 1, 1, 1,
0.3757493, 0.7245849, 1.351231, 0, 0, 1, 1, 1,
0.3870778, -0.04055259, -0.1125605, 1, 0, 0, 1, 1,
0.3877524, -0.4249132, 3.718813, 1, 0, 0, 1, 1,
0.3877861, -1.698106, 2.831498, 1, 0, 0, 1, 1,
0.3889753, -2.60463, 2.743865, 1, 0, 0, 1, 1,
0.393404, -0.95115, 2.983921, 1, 0, 0, 1, 1,
0.3951443, 0.5249047, 1.203678, 0, 0, 0, 1, 1,
0.4000135, 1.022566, -0.5205199, 0, 0, 0, 1, 1,
0.402813, -1.422747, 2.764173, 0, 0, 0, 1, 1,
0.4031154, 0.03755009, 1.230845, 0, 0, 0, 1, 1,
0.4032393, 1.291575, 0.8609518, 0, 0, 0, 1, 1,
0.4033184, 0.5047343, 1.037836, 0, 0, 0, 1, 1,
0.4049107, 0.8597491, 0.8477707, 0, 0, 0, 1, 1,
0.4067331, -0.1021516, 0.9868566, 1, 1, 1, 1, 1,
0.4084572, 0.4500705, -0.8753888, 1, 1, 1, 1, 1,
0.4127607, 0.6447495, 0.3413736, 1, 1, 1, 1, 1,
0.4144195, -0.3104425, 1.62723, 1, 1, 1, 1, 1,
0.4147635, 0.8825908, 0.8195733, 1, 1, 1, 1, 1,
0.4208068, -1.711125, 4.062559, 1, 1, 1, 1, 1,
0.4314663, 0.1436949, -0.7181173, 1, 1, 1, 1, 1,
0.439275, 0.5174252, 0.3607902, 1, 1, 1, 1, 1,
0.4429673, -1.230835, 2.791342, 1, 1, 1, 1, 1,
0.4436784, -1.188016, 2.389633, 1, 1, 1, 1, 1,
0.4458921, 0.5950829, 0.6164345, 1, 1, 1, 1, 1,
0.446735, 0.3078489, -0.6624811, 1, 1, 1, 1, 1,
0.4476357, -0.6805252, 0.713551, 1, 1, 1, 1, 1,
0.4492684, -1.828475, 2.23169, 1, 1, 1, 1, 1,
0.4494085, 0.4423161, 0.3137886, 1, 1, 1, 1, 1,
0.4500167, 0.0794154, 1.86015, 0, 0, 1, 1, 1,
0.4526664, -2.440651, 3.361308, 1, 0, 0, 1, 1,
0.4568789, -0.06078886, 1.141732, 1, 0, 0, 1, 1,
0.4574567, -0.6577513, 4.321469, 1, 0, 0, 1, 1,
0.4617285, 1.089574, 0.5746859, 1, 0, 0, 1, 1,
0.4638111, -1.502027, 3.015499, 1, 0, 0, 1, 1,
0.4647811, -1.585281, 3.941275, 0, 0, 0, 1, 1,
0.4666727, -0.3358881, 2.307882, 0, 0, 0, 1, 1,
0.4706967, -0.5639066, 0.665047, 0, 0, 0, 1, 1,
0.4776786, -0.497074, 2.953542, 0, 0, 0, 1, 1,
0.4792485, 0.5749086, -0.2393888, 0, 0, 0, 1, 1,
0.4855605, -1.600312, 2.448922, 0, 0, 0, 1, 1,
0.4916987, 1.483303, 0.1973064, 0, 0, 0, 1, 1,
0.4918546, 0.1628693, -0.9127647, 1, 1, 1, 1, 1,
0.4926041, 0.5368919, 0.3719535, 1, 1, 1, 1, 1,
0.4943278, 0.8233796, 0.7642947, 1, 1, 1, 1, 1,
0.4948392, 0.6416886, 1.734041, 1, 1, 1, 1, 1,
0.49718, 0.5031582, 1.326771, 1, 1, 1, 1, 1,
0.4977501, 0.3450235, -0.3380028, 1, 1, 1, 1, 1,
0.506763, -0.7932841, 3.247894, 1, 1, 1, 1, 1,
0.5075828, 0.5678679, 2.015557, 1, 1, 1, 1, 1,
0.5087718, 1.484214, 1.116076, 1, 1, 1, 1, 1,
0.5165125, -0.3265395, 1.621057, 1, 1, 1, 1, 1,
0.5199829, -0.5132384, 2.036434, 1, 1, 1, 1, 1,
0.5246171, -0.1168099, 2.646021, 1, 1, 1, 1, 1,
0.5279889, 0.2927696, 0.6474314, 1, 1, 1, 1, 1,
0.5284486, -1.579919, 3.138453, 1, 1, 1, 1, 1,
0.5288457, -0.7587507, 2.782654, 1, 1, 1, 1, 1,
0.5314849, 0.4502508, 0.3721374, 0, 0, 1, 1, 1,
0.537087, -0.5432976, 1.974613, 1, 0, 0, 1, 1,
0.5437288, -0.649552, 2.446478, 1, 0, 0, 1, 1,
0.5440683, -0.1159766, 2.072989, 1, 0, 0, 1, 1,
0.5457887, 0.9299158, -0.1635955, 1, 0, 0, 1, 1,
0.5474452, -1.540512, 2.406589, 1, 0, 0, 1, 1,
0.5494215, 0.697367, 0.5741491, 0, 0, 0, 1, 1,
0.5508036, 0.9937251, -0.7266594, 0, 0, 0, 1, 1,
0.5537903, 1.804106, 0.7231186, 0, 0, 0, 1, 1,
0.5542292, 0.5371001, 1.041986, 0, 0, 0, 1, 1,
0.5568069, 0.0877896, 1.212904, 0, 0, 0, 1, 1,
0.559993, 0.183298, 2.952902, 0, 0, 0, 1, 1,
0.5605569, -0.9939231, 2.387673, 0, 0, 0, 1, 1,
0.5624811, 1.534818, 0.4334517, 1, 1, 1, 1, 1,
0.5630757, -1.549917, 4.374007, 1, 1, 1, 1, 1,
0.5651006, 0.5050641, 1.665281, 1, 1, 1, 1, 1,
0.565973, 1.292045, 0.7716221, 1, 1, 1, 1, 1,
0.5666717, -0.005454352, 2.214218, 1, 1, 1, 1, 1,
0.5786749, -0.6397529, 3.866362, 1, 1, 1, 1, 1,
0.5820138, 0.4386779, 0.6237395, 1, 1, 1, 1, 1,
0.5845141, 0.436391, 1.034196, 1, 1, 1, 1, 1,
0.5884238, -0.4476253, 2.781615, 1, 1, 1, 1, 1,
0.5930029, -1.103638, 2.982652, 1, 1, 1, 1, 1,
0.5930841, -0.3640796, 1.695237, 1, 1, 1, 1, 1,
0.5956349, 0.224297, -0.4192383, 1, 1, 1, 1, 1,
0.6018188, -0.6352692, 2.130765, 1, 1, 1, 1, 1,
0.6080573, 1.903985, 0.6518708, 1, 1, 1, 1, 1,
0.6088102, 0.4240672, -0.1253184, 1, 1, 1, 1, 1,
0.6133578, -0.8461338, 1.666578, 0, 0, 1, 1, 1,
0.6150284, -0.326281, 1.517866, 1, 0, 0, 1, 1,
0.6178005, 1.181594, 0.1430854, 1, 0, 0, 1, 1,
0.6181816, 1.05348, 0.7203187, 1, 0, 0, 1, 1,
0.6191503, 0.5013301, 0.8109173, 1, 0, 0, 1, 1,
0.6221317, 2.033116, 0.3098446, 1, 0, 0, 1, 1,
0.6262949, -1.437296, 2.268922, 0, 0, 0, 1, 1,
0.6315404, -0.06296055, 0.3885181, 0, 0, 0, 1, 1,
0.6440722, -1.417368, 3.079383, 0, 0, 0, 1, 1,
0.6504615, 1.195898, 2.246148, 0, 0, 0, 1, 1,
0.6505351, 0.9864558, 0.7824571, 0, 0, 0, 1, 1,
0.6526487, 1.437338, 1.046692, 0, 0, 0, 1, 1,
0.6532959, 0.426553, 1.110548, 0, 0, 0, 1, 1,
0.6552054, 0.5514051, 0.4015151, 1, 1, 1, 1, 1,
0.6556596, 2.589047, 1.221505, 1, 1, 1, 1, 1,
0.6561121, -0.9463508, 3.906271, 1, 1, 1, 1, 1,
0.66449, 0.9459937, -0.19412, 1, 1, 1, 1, 1,
0.6661798, -0.3021864, 1.719761, 1, 1, 1, 1, 1,
0.6679222, 0.2565629, 0.9649236, 1, 1, 1, 1, 1,
0.6679487, 0.9494796, -0.8534896, 1, 1, 1, 1, 1,
0.6771532, 0.9426584, 0.4372636, 1, 1, 1, 1, 1,
0.6791065, -1.839686, 2.158354, 1, 1, 1, 1, 1,
0.6799868, 0.4337972, 2.158523, 1, 1, 1, 1, 1,
0.6813793, 2.223094, 1.298674, 1, 1, 1, 1, 1,
0.6817937, 2.001904, 0.2851966, 1, 1, 1, 1, 1,
0.6833453, -1.997891, 3.036438, 1, 1, 1, 1, 1,
0.6835442, -1.815262, 3.555073, 1, 1, 1, 1, 1,
0.6869472, 0.2269795, -0.100444, 1, 1, 1, 1, 1,
0.6873999, -0.4384886, 1.310055, 0, 0, 1, 1, 1,
0.6912887, 0.06649268, 2.077524, 1, 0, 0, 1, 1,
0.6925637, -1.595409, 4.545932, 1, 0, 0, 1, 1,
0.6937065, 0.2544236, 0.2835629, 1, 0, 0, 1, 1,
0.6945229, -1.286323, 3.489593, 1, 0, 0, 1, 1,
0.7023963, 1.986576, 0.2738825, 1, 0, 0, 1, 1,
0.7039655, 0.8028299, 1.381688, 0, 0, 0, 1, 1,
0.706733, -0.2917773, 3.410852, 0, 0, 0, 1, 1,
0.7074937, -1.535836, 1.404403, 0, 0, 0, 1, 1,
0.7107247, -0.2659755, 1.708275, 0, 0, 0, 1, 1,
0.7111837, 0.2841569, 0.03966774, 0, 0, 0, 1, 1,
0.7128869, 0.03696414, 0.03564163, 0, 0, 0, 1, 1,
0.7164986, -1.395461, 3.205219, 0, 0, 0, 1, 1,
0.7239088, 0.3019879, 0.4942163, 1, 1, 1, 1, 1,
0.7284905, -0.4282581, 2.870697, 1, 1, 1, 1, 1,
0.7293057, 0.3943225, 1.459198, 1, 1, 1, 1, 1,
0.7330667, 0.818002, 1.683228, 1, 1, 1, 1, 1,
0.7368753, 0.3577886, 1.022832, 1, 1, 1, 1, 1,
0.7386341, 0.5023285, 0.9288324, 1, 1, 1, 1, 1,
0.7420717, -1.56065, 1.691519, 1, 1, 1, 1, 1,
0.7443251, -1.020401, 1.70415, 1, 1, 1, 1, 1,
0.7507998, 1.259099, -0.2303791, 1, 1, 1, 1, 1,
0.7591279, -0.8044031, 1.558211, 1, 1, 1, 1, 1,
0.7666693, -0.4666602, 3.08835, 1, 1, 1, 1, 1,
0.7670216, 2.438477, 1.368793, 1, 1, 1, 1, 1,
0.7843459, 0.3102094, 0.5909628, 1, 1, 1, 1, 1,
0.7859085, 2.592704, 0.2109801, 1, 1, 1, 1, 1,
0.7859517, 0.9643258, 0.5421458, 1, 1, 1, 1, 1,
0.7898239, -2.014224, 3.482527, 0, 0, 1, 1, 1,
0.7924964, 0.3262108, 1.794649, 1, 0, 0, 1, 1,
0.7961416, 0.5184032, 0.3599629, 1, 0, 0, 1, 1,
0.797774, -0.5335159, 1.123007, 1, 0, 0, 1, 1,
0.7998511, -1.872489, 3.466797, 1, 0, 0, 1, 1,
0.8009812, 1.363707, 1.656403, 1, 0, 0, 1, 1,
0.8050945, 0.2875267, 0.5209697, 0, 0, 0, 1, 1,
0.8084709, -0.6046491, 2.425527, 0, 0, 0, 1, 1,
0.8163551, -0.1080214, 1.205075, 0, 0, 0, 1, 1,
0.8233013, -0.6612173, 1.693602, 0, 0, 0, 1, 1,
0.8258566, 0.2844456, 1.924571, 0, 0, 0, 1, 1,
0.8292487, 0.8971385, 0.1223315, 0, 0, 0, 1, 1,
0.8296121, -0.4198727, 2.303406, 0, 0, 0, 1, 1,
0.8299224, -1.642899, 3.261358, 1, 1, 1, 1, 1,
0.8301544, 2.409474, -0.8406084, 1, 1, 1, 1, 1,
0.8348315, -0.4956264, 1.500435, 1, 1, 1, 1, 1,
0.8389538, 1.212605, 1.499207, 1, 1, 1, 1, 1,
0.843905, 0.2809495, 1.056061, 1, 1, 1, 1, 1,
0.8483068, 0.2104551, 2.299894, 1, 1, 1, 1, 1,
0.8493069, 0.006268299, 1.642642, 1, 1, 1, 1, 1,
0.8505575, 1.190449, 1.100578, 1, 1, 1, 1, 1,
0.8615964, 0.7429426, 0.8048038, 1, 1, 1, 1, 1,
0.8621566, 0.5003358, 0.8936834, 1, 1, 1, 1, 1,
0.8630722, 0.09939247, 1.454669, 1, 1, 1, 1, 1,
0.8663972, -0.5025093, 1.893482, 1, 1, 1, 1, 1,
0.8697051, -0.4882638, 1.747143, 1, 1, 1, 1, 1,
0.87047, 0.1892661, 1.73245, 1, 1, 1, 1, 1,
0.8715038, 1.418444, 0.9810097, 1, 1, 1, 1, 1,
0.877388, -1.463709, 1.650089, 0, 0, 1, 1, 1,
0.884279, -1.99213, 3.486316, 1, 0, 0, 1, 1,
0.8927876, -0.9455486, 2.88335, 1, 0, 0, 1, 1,
0.8940005, 0.5044769, -0.4449822, 1, 0, 0, 1, 1,
0.894062, 0.2137643, 4.087786, 1, 0, 0, 1, 1,
0.8953769, 1.631871, -0.3697974, 1, 0, 0, 1, 1,
0.8981016, 0.3613595, 0.8338257, 0, 0, 0, 1, 1,
0.9002553, 0.4788322, -0.1168422, 0, 0, 0, 1, 1,
0.9036534, -1.200053, 2.954621, 0, 0, 0, 1, 1,
0.9073385, 0.09235036, 0.07011072, 0, 0, 0, 1, 1,
0.908644, 0.2197499, -0.1206766, 0, 0, 0, 1, 1,
0.9169211, 0.3957658, 0.715179, 0, 0, 0, 1, 1,
0.9196756, 0.8679707, 1.467706, 0, 0, 0, 1, 1,
0.919942, 0.9580619, 0.8140109, 1, 1, 1, 1, 1,
0.9232758, 0.2013785, 0.9566987, 1, 1, 1, 1, 1,
0.926854, 1.231408, 1.538031, 1, 1, 1, 1, 1,
0.9275827, 0.7321815, 1.128691, 1, 1, 1, 1, 1,
0.9401895, -1.264997, 2.127376, 1, 1, 1, 1, 1,
0.9439222, -1.207857, 2.364909, 1, 1, 1, 1, 1,
0.9569662, 1.312325, -0.9324049, 1, 1, 1, 1, 1,
0.9613676, -0.6880474, 2.39087, 1, 1, 1, 1, 1,
0.9647872, -1.902137, 3.599759, 1, 1, 1, 1, 1,
0.9741997, -1.629644, -0.1034767, 1, 1, 1, 1, 1,
0.9806688, -1.977485, 1.913946, 1, 1, 1, 1, 1,
0.9911492, -0.267911, 1.782886, 1, 1, 1, 1, 1,
0.9927546, 1.725627, -0.355956, 1, 1, 1, 1, 1,
0.9928148, 0.2474856, 0.4951992, 1, 1, 1, 1, 1,
0.9944487, -0.899214, 0.8049379, 1, 1, 1, 1, 1,
1.003699, -0.4706337, 2.146952, 0, 0, 1, 1, 1,
1.005772, -0.2399231, 2.271522, 1, 0, 0, 1, 1,
1.018049, 0.08217356, 0.1792519, 1, 0, 0, 1, 1,
1.018555, -0.6255807, 0.2663787, 1, 0, 0, 1, 1,
1.019913, -0.9352829, -0.3692758, 1, 0, 0, 1, 1,
1.027025, -0.2147916, 2.679784, 1, 0, 0, 1, 1,
1.028783, 0.9216664, -0.4370388, 0, 0, 0, 1, 1,
1.029025, 0.634626, -1.2167, 0, 0, 0, 1, 1,
1.029127, 2.532485, -0.3118673, 0, 0, 0, 1, 1,
1.039002, -0.4899335, 0.7955307, 0, 0, 0, 1, 1,
1.054792, 1.365749, 0.4764838, 0, 0, 0, 1, 1,
1.064834, -0.9629584, 1.627495, 0, 0, 0, 1, 1,
1.082063, -0.1086846, 1.329368, 0, 0, 0, 1, 1,
1.082697, -2.074544, 3.04369, 1, 1, 1, 1, 1,
1.084553, 0.6573567, 0.4274265, 1, 1, 1, 1, 1,
1.084643, -0.4451265, 1.94924, 1, 1, 1, 1, 1,
1.091218, 0.3460076, 1.591457, 1, 1, 1, 1, 1,
1.097388, -0.735052, 1.078192, 1, 1, 1, 1, 1,
1.112171, 0.2931153, 0.895053, 1, 1, 1, 1, 1,
1.120958, 0.1334464, 0.8607966, 1, 1, 1, 1, 1,
1.126751, -0.934414, 3.438935, 1, 1, 1, 1, 1,
1.130458, 0.2529638, 1.803805, 1, 1, 1, 1, 1,
1.132552, -0.5572792, 3.151387, 1, 1, 1, 1, 1,
1.134346, 1.502749, 1.186752, 1, 1, 1, 1, 1,
1.135776, -1.256179, 2.686133, 1, 1, 1, 1, 1,
1.144763, 0.6791108, 1.230573, 1, 1, 1, 1, 1,
1.147334, -0.1277242, 0.2780557, 1, 1, 1, 1, 1,
1.150529, 1.355113, 0.4871979, 1, 1, 1, 1, 1,
1.150785, -1.55609, -0.5099299, 0, 0, 1, 1, 1,
1.158806, -0.7287785, 2.72295, 1, 0, 0, 1, 1,
1.171909, -0.6563939, 0.6443486, 1, 0, 0, 1, 1,
1.174639, 0.1575792, 2.732954, 1, 0, 0, 1, 1,
1.180471, -0.3864722, 1.653364, 1, 0, 0, 1, 1,
1.180633, 0.7708597, 0.9363057, 1, 0, 0, 1, 1,
1.194368, 0.8651468, 1.61942, 0, 0, 0, 1, 1,
1.19543, 0.7570534, -0.3343325, 0, 0, 0, 1, 1,
1.208877, -0.378679, 2.276128, 0, 0, 0, 1, 1,
1.211615, -0.06509411, 0.8244523, 0, 0, 0, 1, 1,
1.221092, 0.5155084, 1.633969, 0, 0, 0, 1, 1,
1.227967, -0.2522112, 3.217038, 0, 0, 0, 1, 1,
1.229993, -1.116475, 0.6640468, 0, 0, 0, 1, 1,
1.235713, -0.298632, 1.772569, 1, 1, 1, 1, 1,
1.238553, -0.9980127, 2.51775, 1, 1, 1, 1, 1,
1.252383, -0.5401736, 1.32709, 1, 1, 1, 1, 1,
1.258367, 0.09682336, 1.69679, 1, 1, 1, 1, 1,
1.264453, 0.1092708, 2.881493, 1, 1, 1, 1, 1,
1.269094, 0.4162713, 1.497781, 1, 1, 1, 1, 1,
1.269951, -0.3308467, 3.267049, 1, 1, 1, 1, 1,
1.275595, 0.3782942, 1.69891, 1, 1, 1, 1, 1,
1.276493, 0.5375426, 1.511106, 1, 1, 1, 1, 1,
1.278534, 1.182306, 1.380934, 1, 1, 1, 1, 1,
1.290053, 0.8619307, 0.5623021, 1, 1, 1, 1, 1,
1.291954, 0.6977555, 0.8241113, 1, 1, 1, 1, 1,
1.299085, -1.234208, 0.6787463, 1, 1, 1, 1, 1,
1.302988, -0.7325433, 2.587237, 1, 1, 1, 1, 1,
1.3137, 0.01502772, 0.8539473, 1, 1, 1, 1, 1,
1.316876, 1.667786, 0.8337048, 0, 0, 1, 1, 1,
1.350654, 0.675023, 2.693545, 1, 0, 0, 1, 1,
1.36811, -0.05182626, 1.685902, 1, 0, 0, 1, 1,
1.370591, -0.1150629, 0.2197554, 1, 0, 0, 1, 1,
1.374604, 0.422419, 1.974915, 1, 0, 0, 1, 1,
1.376896, -0.4118401, 2.796307, 1, 0, 0, 1, 1,
1.37928, -0.4944008, 3.862662, 0, 0, 0, 1, 1,
1.382014, -2.097796, 1.691054, 0, 0, 0, 1, 1,
1.398078, 0.04429398, 1.447916, 0, 0, 0, 1, 1,
1.398339, 1.100049, -0.02006002, 0, 0, 0, 1, 1,
1.424696, -1.042999, 2.129654, 0, 0, 0, 1, 1,
1.42985, -0.08335097, 2.481601, 0, 0, 0, 1, 1,
1.432439, -0.4591179, 1.630268, 0, 0, 0, 1, 1,
1.435546, 0.8902482, -0.244217, 1, 1, 1, 1, 1,
1.451559, 0.713098, 1.393074, 1, 1, 1, 1, 1,
1.452763, -0.9800348, 4.958593, 1, 1, 1, 1, 1,
1.453362, -0.7065136, 3.240066, 1, 1, 1, 1, 1,
1.477648, 0.8425528, 0.852181, 1, 1, 1, 1, 1,
1.478378, -0.9213461, 1.811962, 1, 1, 1, 1, 1,
1.479478, -1.763828, 2.305849, 1, 1, 1, 1, 1,
1.479681, 0.1841844, 0.6513292, 1, 1, 1, 1, 1,
1.484684, -0.7344878, 2.032374, 1, 1, 1, 1, 1,
1.48505, -1.33856, 1.925592, 1, 1, 1, 1, 1,
1.489335, 0.3602166, 1.823342, 1, 1, 1, 1, 1,
1.489966, -2.502674, 2.539504, 1, 1, 1, 1, 1,
1.490213, 0.3582714, 1.469488, 1, 1, 1, 1, 1,
1.496682, 0.5409762, 1.033719, 1, 1, 1, 1, 1,
1.501466, 0.6730345, 0.2070668, 1, 1, 1, 1, 1,
1.507603, -1.540044, 2.811224, 0, 0, 1, 1, 1,
1.50765, -0.2942468, 2.574152, 1, 0, 0, 1, 1,
1.521856, 0.3215507, 1.6968, 1, 0, 0, 1, 1,
1.530809, -0.6976062, 3.494929, 1, 0, 0, 1, 1,
1.53411, -0.2113188, 1.399569, 1, 0, 0, 1, 1,
1.543884, -0.02618293, 1.86449, 1, 0, 0, 1, 1,
1.553368, -0.1088916, 1.101588, 0, 0, 0, 1, 1,
1.557666, 0.2611231, 2.042322, 0, 0, 0, 1, 1,
1.563483, -0.1105815, 1.912852, 0, 0, 0, 1, 1,
1.576154, 0.07924911, 0.1949946, 0, 0, 0, 1, 1,
1.594509, 0.2756528, 0.9156368, 0, 0, 0, 1, 1,
1.596335, 1.034477, 1.942163, 0, 0, 0, 1, 1,
1.598107, 0.6231756, -0.4934855, 0, 0, 0, 1, 1,
1.611434, 0.4616407, -0.3000681, 1, 1, 1, 1, 1,
1.627663, -0.8619635, 2.902445, 1, 1, 1, 1, 1,
1.631077, -0.07143106, 1.942259, 1, 1, 1, 1, 1,
1.634888, -0.1551396, 1.678342, 1, 1, 1, 1, 1,
1.637061, 1.025227, 0.1607063, 1, 1, 1, 1, 1,
1.645538, 0.8913776, 1.340729, 1, 1, 1, 1, 1,
1.65238, -0.415028, 1.37977, 1, 1, 1, 1, 1,
1.656749, 1.15404, 0.6388454, 1, 1, 1, 1, 1,
1.663557, 0.2437133, 1.954119, 1, 1, 1, 1, 1,
1.672971, 0.1759425, -0.7504966, 1, 1, 1, 1, 1,
1.678616, 0.2424733, 1.843485, 1, 1, 1, 1, 1,
1.679859, 1.051684, 2.146349, 1, 1, 1, 1, 1,
1.687176, 2.642406, -0.7017518, 1, 1, 1, 1, 1,
1.707354, -0.0181131, 0.7046541, 1, 1, 1, 1, 1,
1.72819, 1.540244, 1.451218, 1, 1, 1, 1, 1,
1.731113, 0.9758903, 1.92505, 0, 0, 1, 1, 1,
1.74591, 1.13739, 2.092877, 1, 0, 0, 1, 1,
1.748476, 0.6419033, -0.06273112, 1, 0, 0, 1, 1,
1.754379, -0.09449551, 0.7243485, 1, 0, 0, 1, 1,
1.760916, -0.0752795, 2.060942, 1, 0, 0, 1, 1,
1.762927, -1.594229, 1.232562, 1, 0, 0, 1, 1,
1.785045, -0.7630814, 1.881385, 0, 0, 0, 1, 1,
1.83852, -0.3898306, 0.7398882, 0, 0, 0, 1, 1,
1.853675, 1.830618, 0.9504701, 0, 0, 0, 1, 1,
1.859815, -0.7439075, 2.518536, 0, 0, 0, 1, 1,
1.870274, 0.332065, 0.8106027, 0, 0, 0, 1, 1,
1.875493, -0.2281136, 3.070942, 0, 0, 0, 1, 1,
1.890678, -0.1059861, 2.904211, 0, 0, 0, 1, 1,
1.905633, -0.6497789, 2.185391, 1, 1, 1, 1, 1,
1.906357, 0.6256573, 0.7919549, 1, 1, 1, 1, 1,
1.915827, -0.7183484, 1.416917, 1, 1, 1, 1, 1,
1.93633, -0.2793792, 2.164197, 1, 1, 1, 1, 1,
1.940286, 2.824862, 3.950998, 1, 1, 1, 1, 1,
1.992907, -1.642878, 3.333684, 1, 1, 1, 1, 1,
2.012484, -0.7568457, 2.032628, 1, 1, 1, 1, 1,
2.015907, -1.703887, 1.995597, 1, 1, 1, 1, 1,
2.031374, 0.0133447, -0.04263784, 1, 1, 1, 1, 1,
2.091834, 0.5952365, -0.494641, 1, 1, 1, 1, 1,
2.126418, 0.8672956, 2.407454, 1, 1, 1, 1, 1,
2.139086, 0.3922418, 1.981165, 1, 1, 1, 1, 1,
2.158766, -0.2615258, 1.931995, 1, 1, 1, 1, 1,
2.171868, 0.3651889, 2.012408, 1, 1, 1, 1, 1,
2.198244, -0.2397816, 0.3347414, 1, 1, 1, 1, 1,
2.221207, 0.7319044, 0.1885378, 0, 0, 1, 1, 1,
2.231268, -1.046248, 0.6241093, 1, 0, 0, 1, 1,
2.282828, 0.5286533, 1.618149, 1, 0, 0, 1, 1,
2.295446, -1.131043, 0.5870813, 1, 0, 0, 1, 1,
2.321546, 1.491715, 0.5480565, 1, 0, 0, 1, 1,
2.323283, 0.7381104, 1.169409, 1, 0, 0, 1, 1,
2.352392, -0.3480087, 2.400385, 0, 0, 0, 1, 1,
2.381883, 1.044945, 0.607833, 0, 0, 0, 1, 1,
2.388783, -0.4139636, 1.492369, 0, 0, 0, 1, 1,
2.406698, 0.9133173, 0.6186894, 0, 0, 0, 1, 1,
2.435392, -0.4676251, 1.304776, 0, 0, 0, 1, 1,
2.447, -1.156008, 1.335474, 0, 0, 0, 1, 1,
2.503021, 0.4971993, 1.939773, 0, 0, 0, 1, 1,
2.560677, -1.523753, 0.6906875, 1, 1, 1, 1, 1,
2.632809, 0.1683613, 0.2307447, 1, 1, 1, 1, 1,
2.801728, -1.278707, 1.194275, 1, 1, 1, 1, 1,
2.827162, 0.5085551, 0.8032348, 1, 1, 1, 1, 1,
2.988029, 0.2130891, 2.440176, 1, 1, 1, 1, 1,
3.093389, -0.3053617, 1.480726, 1, 1, 1, 1, 1,
3.314151, -0.6452308, 2.511207, 1, 1, 1, 1, 1
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
var radius = 9.600348;
var distance = 33.72081;
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
mvMatrix.translate( 0.1802111, 0.1141413, -0.03887224 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.72081);
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
