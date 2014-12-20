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
-3.07829, 1.908464, -1.952567, 1, 0, 0, 1,
-3.004717, 2.308373, -2.503849, 1, 0.007843138, 0, 1,
-2.803929, 1.010023, -0.8720467, 1, 0.01176471, 0, 1,
-2.676082, 0.7075847, 0.1283411, 1, 0.01960784, 0, 1,
-2.548602, -0.2025687, -0.563143, 1, 0.02352941, 0, 1,
-2.517107, -0.4612065, -2.30082, 1, 0.03137255, 0, 1,
-2.515953, 1.224759, -0.902114, 1, 0.03529412, 0, 1,
-2.487864, -0.006796632, -1.948868, 1, 0.04313726, 0, 1,
-2.445884, -1.695305, -0.7745044, 1, 0.04705882, 0, 1,
-2.429402, 0.69469, -0.1690993, 1, 0.05490196, 0, 1,
-2.426648, 1.067033, -1.332966, 1, 0.05882353, 0, 1,
-2.404676, -2.758212, -1.810888, 1, 0.06666667, 0, 1,
-2.388287, -0.5000504, -1.824526, 1, 0.07058824, 0, 1,
-2.377704, -1.17603, -0.8338214, 1, 0.07843138, 0, 1,
-2.327433, 1.457771, 0.007273876, 1, 0.08235294, 0, 1,
-2.326431, -0.7945191, -1.904837, 1, 0.09019608, 0, 1,
-2.267623, 2.735121, -0.8551222, 1, 0.09411765, 0, 1,
-2.221416, -0.1667875, -2.555255, 1, 0.1019608, 0, 1,
-2.182482, -0.9623929, -2.197749, 1, 0.1098039, 0, 1,
-2.168539, -0.5356863, -0.689034, 1, 0.1137255, 0, 1,
-2.123571, -0.8407531, -2.092774, 1, 0.1215686, 0, 1,
-2.101934, -1.77732, -2.202498, 1, 0.1254902, 0, 1,
-2.096313, 0.9106559, 0.3576943, 1, 0.1333333, 0, 1,
-2.063944, -1.098803, -2.272682, 1, 0.1372549, 0, 1,
-2.010023, 0.4424199, -0.476434, 1, 0.145098, 0, 1,
-1.987248, 0.7722595, -0.9610204, 1, 0.1490196, 0, 1,
-1.982502, 0.2141687, -2.780668, 1, 0.1568628, 0, 1,
-1.967368, -0.4369219, -1.069601, 1, 0.1607843, 0, 1,
-1.960878, 0.348232, -0.8685273, 1, 0.1686275, 0, 1,
-1.947749, 0.561042, 0.2031958, 1, 0.172549, 0, 1,
-1.911825, 1.723628, -1.296466, 1, 0.1803922, 0, 1,
-1.888112, 0.7990464, -3.099602, 1, 0.1843137, 0, 1,
-1.872522, 1.317749, -0.1136181, 1, 0.1921569, 0, 1,
-1.871486, -0.1357977, -0.1656658, 1, 0.1960784, 0, 1,
-1.870625, 0.3069212, -0.0199164, 1, 0.2039216, 0, 1,
-1.849426, 0.2007966, -2.667308, 1, 0.2117647, 0, 1,
-1.843108, 0.6583167, -0.9018251, 1, 0.2156863, 0, 1,
-1.842949, -0.1650058, -0.9416884, 1, 0.2235294, 0, 1,
-1.803414, -0.9136056, -0.5200689, 1, 0.227451, 0, 1,
-1.791823, 1.091604, -0.9818226, 1, 0.2352941, 0, 1,
-1.786241, -0.1437861, -2.205741, 1, 0.2392157, 0, 1,
-1.781178, 0.6201406, -0.2682264, 1, 0.2470588, 0, 1,
-1.774958, -1.117147, -2.829468, 1, 0.2509804, 0, 1,
-1.767981, 1.848274, -2.063354, 1, 0.2588235, 0, 1,
-1.754629, -1.09936, -3.234288, 1, 0.2627451, 0, 1,
-1.753668, 0.1553156, -0.3669328, 1, 0.2705882, 0, 1,
-1.749514, 0.5222611, -1.491807, 1, 0.2745098, 0, 1,
-1.738133, -0.4053679, -1.833962, 1, 0.282353, 0, 1,
-1.737346, 0.3575495, -1.758129, 1, 0.2862745, 0, 1,
-1.734311, -0.1120631, -3.83684, 1, 0.2941177, 0, 1,
-1.730958, -0.06387892, -1.269461, 1, 0.3019608, 0, 1,
-1.70738, -0.01093382, 0.1730555, 1, 0.3058824, 0, 1,
-1.682905, 0.362257, -2.549718, 1, 0.3137255, 0, 1,
-1.680424, 0.517369, -2.74849, 1, 0.3176471, 0, 1,
-1.67643, 0.7777244, -0.03110602, 1, 0.3254902, 0, 1,
-1.672344, -0.3243486, -2.12724, 1, 0.3294118, 0, 1,
-1.659971, -0.896522, -1.220743, 1, 0.3372549, 0, 1,
-1.657972, -0.2701071, -1.529837, 1, 0.3411765, 0, 1,
-1.63549, -1.335047, -3.644315, 1, 0.3490196, 0, 1,
-1.63528, 0.07396266, -0.9465263, 1, 0.3529412, 0, 1,
-1.626418, -0.6983497, -1.094264, 1, 0.3607843, 0, 1,
-1.623197, -0.3839565, -1.312893, 1, 0.3647059, 0, 1,
-1.608172, -1.033954, -1.927759, 1, 0.372549, 0, 1,
-1.591309, 0.9239872, -0.5219828, 1, 0.3764706, 0, 1,
-1.581658, -0.484826, -1.785558, 1, 0.3843137, 0, 1,
-1.569414, -0.1406652, -1.948104, 1, 0.3882353, 0, 1,
-1.56527, 0.05429723, -1.47647, 1, 0.3960784, 0, 1,
-1.55024, -0.1676168, -1.125905, 1, 0.4039216, 0, 1,
-1.528998, 1.040222, -1.427667, 1, 0.4078431, 0, 1,
-1.523662, 0.2691557, -1.882744, 1, 0.4156863, 0, 1,
-1.513603, -0.8063262, 0.3536222, 1, 0.4196078, 0, 1,
-1.513128, 0.1489004, -0.8234481, 1, 0.427451, 0, 1,
-1.508743, -2.078524, -3.05989, 1, 0.4313726, 0, 1,
-1.505579, 1.042309, -0.7252876, 1, 0.4392157, 0, 1,
-1.497856, -1.326824, -2.901868, 1, 0.4431373, 0, 1,
-1.493398, 0.5452607, -0.1037611, 1, 0.4509804, 0, 1,
-1.482913, 0.2249671, -0.9386361, 1, 0.454902, 0, 1,
-1.472203, 0.008844053, -1.389799, 1, 0.4627451, 0, 1,
-1.46824, 1.271197, -0.9589993, 1, 0.4666667, 0, 1,
-1.468097, 0.942068, -1.00262, 1, 0.4745098, 0, 1,
-1.461474, 1.085541, -1.404724, 1, 0.4784314, 0, 1,
-1.45271, -0.4274289, -2.055691, 1, 0.4862745, 0, 1,
-1.438351, 0.8571352, -1.918519, 1, 0.4901961, 0, 1,
-1.431162, -0.5461704, -1.867024, 1, 0.4980392, 0, 1,
-1.430721, -1.855897, -2.661748, 1, 0.5058824, 0, 1,
-1.430063, 0.6431579, -0.866828, 1, 0.509804, 0, 1,
-1.414561, 0.2876581, -1.57, 1, 0.5176471, 0, 1,
-1.407598, -0.7662391, -1.404236, 1, 0.5215687, 0, 1,
-1.401997, 0.289638, -0.5313668, 1, 0.5294118, 0, 1,
-1.399232, -0.1113056, -0.9324428, 1, 0.5333334, 0, 1,
-1.39827, -0.7563547, -2.332836, 1, 0.5411765, 0, 1,
-1.387866, -1.017324, -2.005105, 1, 0.5450981, 0, 1,
-1.381883, -1.184909, -3.505563, 1, 0.5529412, 0, 1,
-1.375376, 0.03768004, -1.221468, 1, 0.5568628, 0, 1,
-1.372422, -0.01306149, -2.084619, 1, 0.5647059, 0, 1,
-1.364626, 0.1996413, -1.894012, 1, 0.5686275, 0, 1,
-1.35937, -0.986777, -1.003746, 1, 0.5764706, 0, 1,
-1.352222, -0.9422845, -3.499649, 1, 0.5803922, 0, 1,
-1.3495, 1.607687, -1.019461, 1, 0.5882353, 0, 1,
-1.342477, -0.4118863, -3.056666, 1, 0.5921569, 0, 1,
-1.338632, 1.682334, -1.11125, 1, 0.6, 0, 1,
-1.338491, 1.119654, -1.351554, 1, 0.6078432, 0, 1,
-1.322666, 0.6380228, -1.308537, 1, 0.6117647, 0, 1,
-1.311348, -0.9764574, -2.625785, 1, 0.6196079, 0, 1,
-1.311263, -0.6611236, -1.330011, 1, 0.6235294, 0, 1,
-1.303844, 0.09121069, -0.7293361, 1, 0.6313726, 0, 1,
-1.301915, -0.6482987, -4.409954, 1, 0.6352941, 0, 1,
-1.292968, 0.7578782, -0.7839494, 1, 0.6431373, 0, 1,
-1.290959, -0.08241843, 0.06399006, 1, 0.6470588, 0, 1,
-1.287526, -0.6671943, -1.303444, 1, 0.654902, 0, 1,
-1.287407, 0.4161004, -0.945044, 1, 0.6588235, 0, 1,
-1.283837, 0.7360351, -1.904852, 1, 0.6666667, 0, 1,
-1.277028, 0.7903576, -3.326542, 1, 0.6705883, 0, 1,
-1.272843, -1.781625, -2.23196, 1, 0.6784314, 0, 1,
-1.272548, 0.1974823, 0.6532218, 1, 0.682353, 0, 1,
-1.261814, 0.2903615, -0.8462934, 1, 0.6901961, 0, 1,
-1.249417, -0.08769254, -0.407435, 1, 0.6941177, 0, 1,
-1.23795, 0.4972408, -0.4686814, 1, 0.7019608, 0, 1,
-1.235026, -0.02460779, -1.059209, 1, 0.7098039, 0, 1,
-1.224591, -1.482699, -1.917859, 1, 0.7137255, 0, 1,
-1.223476, 1.132827, -2.016267, 1, 0.7215686, 0, 1,
-1.22122, -0.5213965, -2.255235, 1, 0.7254902, 0, 1,
-1.220397, -0.07488782, -1.228459, 1, 0.7333333, 0, 1,
-1.219756, 0.03744316, -0.5652782, 1, 0.7372549, 0, 1,
-1.202643, 1.472877, 1.458779, 1, 0.7450981, 0, 1,
-1.201476, 1.567414, 0.2336186, 1, 0.7490196, 0, 1,
-1.188936, 0.1384795, -1.69337, 1, 0.7568628, 0, 1,
-1.182746, 0.001549614, -1.199536, 1, 0.7607843, 0, 1,
-1.182413, -0.4504172, -1.805559, 1, 0.7686275, 0, 1,
-1.173017, -0.2462365, -2.185752, 1, 0.772549, 0, 1,
-1.171732, -0.2182436, -1.732851, 1, 0.7803922, 0, 1,
-1.17109, -0.04253073, -0.9437724, 1, 0.7843137, 0, 1,
-1.170927, -1.843011, -0.4323746, 1, 0.7921569, 0, 1,
-1.169154, -0.2326846, -1.978805, 1, 0.7960784, 0, 1,
-1.16092, 0.1657353, -2.733804, 1, 0.8039216, 0, 1,
-1.158433, 0.6661287, -1.269008, 1, 0.8117647, 0, 1,
-1.15109, 0.1166769, -1.287964, 1, 0.8156863, 0, 1,
-1.142723, -2.042092, -2.681705, 1, 0.8235294, 0, 1,
-1.141357, 0.1547381, -1.960869, 1, 0.827451, 0, 1,
-1.139273, 0.6578965, -0.3014416, 1, 0.8352941, 0, 1,
-1.134787, -0.8347232, -3.476257, 1, 0.8392157, 0, 1,
-1.131842, 0.5220028, -0.3404309, 1, 0.8470588, 0, 1,
-1.123617, 0.8406361, -1.047141, 1, 0.8509804, 0, 1,
-1.12336, -1.445744, -1.616003, 1, 0.8588235, 0, 1,
-1.119289, 0.8275872, 0.3021172, 1, 0.8627451, 0, 1,
-1.118665, -0.9850248, -3.265108, 1, 0.8705882, 0, 1,
-1.114651, -0.9265736, -3.746627, 1, 0.8745098, 0, 1,
-1.114516, -0.2475718, -1.853013, 1, 0.8823529, 0, 1,
-1.111264, -1.310008, -2.867946, 1, 0.8862745, 0, 1,
-1.108185, 1.481395, -0.2996958, 1, 0.8941177, 0, 1,
-1.102662, 0.01621637, -2.828201, 1, 0.8980392, 0, 1,
-1.098766, -1.04813, -0.6690726, 1, 0.9058824, 0, 1,
-1.092418, 0.02918285, -2.338719, 1, 0.9137255, 0, 1,
-1.088288, 0.2214097, -1.060503, 1, 0.9176471, 0, 1,
-1.085842, 0.08178352, -0.6937715, 1, 0.9254902, 0, 1,
-1.081875, -0.2929657, -1.972952, 1, 0.9294118, 0, 1,
-1.078177, -1.107932, -0.2478865, 1, 0.9372549, 0, 1,
-1.071071, 1.023052, -0.3016731, 1, 0.9411765, 0, 1,
-1.067099, -0.5828617, -3.938088, 1, 0.9490196, 0, 1,
-1.062653, 2.072721, -0.215918, 1, 0.9529412, 0, 1,
-1.055797, -2.077308, -2.483543, 1, 0.9607843, 0, 1,
-1.052364, -1.199221, -0.7135546, 1, 0.9647059, 0, 1,
-1.047963, -0.3558719, -1.103978, 1, 0.972549, 0, 1,
-1.040474, 1.368408, -1.4264, 1, 0.9764706, 0, 1,
-1.037895, -1.443496, -2.618702, 1, 0.9843137, 0, 1,
-1.036543, -0.7073154, -0.8315365, 1, 0.9882353, 0, 1,
-1.034382, 1.35205, -1.238854, 1, 0.9960784, 0, 1,
-1.029117, 0.8561518, -2.008884, 0.9960784, 1, 0, 1,
-1.027446, -1.52654, -3.128358, 0.9921569, 1, 0, 1,
-1.0254, 0.949854, -1.806952, 0.9843137, 1, 0, 1,
-1.02154, 0.4714997, -0.4068242, 0.9803922, 1, 0, 1,
-1.017036, -0.5753619, -2.104271, 0.972549, 1, 0, 1,
-1.005724, -0.1762928, -2.288286, 0.9686275, 1, 0, 1,
-0.9966922, 0.9157298, -0.07695594, 0.9607843, 1, 0, 1,
-0.9952655, 1.088003, -0.8141724, 0.9568627, 1, 0, 1,
-0.9951831, -0.3167815, -2.475811, 0.9490196, 1, 0, 1,
-0.9933184, -0.2794126, -1.167187, 0.945098, 1, 0, 1,
-0.9919959, -0.4722695, -0.893501, 0.9372549, 1, 0, 1,
-0.9735093, -1.066721, -3.908576, 0.9333333, 1, 0, 1,
-0.969622, -0.2168357, -1.509394, 0.9254902, 1, 0, 1,
-0.9636697, -0.3160442, -1.018224, 0.9215686, 1, 0, 1,
-0.9622838, 0.8818591, -0.9685452, 0.9137255, 1, 0, 1,
-0.955955, 1.361628, -1.295449, 0.9098039, 1, 0, 1,
-0.9535273, -1.165478, -2.771748, 0.9019608, 1, 0, 1,
-0.948569, -0.358009, -2.291538, 0.8941177, 1, 0, 1,
-0.9458886, -1.545737, -0.6903767, 0.8901961, 1, 0, 1,
-0.9454321, 1.741524, -2.300649, 0.8823529, 1, 0, 1,
-0.9435627, -0.7496347, -3.540429, 0.8784314, 1, 0, 1,
-0.9424868, -0.8675157, -1.579085, 0.8705882, 1, 0, 1,
-0.9406098, 0.2570856, -1.979917, 0.8666667, 1, 0, 1,
-0.9404163, 0.8802894, -1.083671, 0.8588235, 1, 0, 1,
-0.9401395, 0.5789288, -1.27808, 0.854902, 1, 0, 1,
-0.9380994, -0.197784, -1.544062, 0.8470588, 1, 0, 1,
-0.935824, 0.9450261, -0.3437059, 0.8431373, 1, 0, 1,
-0.9341915, -0.9697841, -2.633371, 0.8352941, 1, 0, 1,
-0.930709, 0.7858931, -0.2939003, 0.8313726, 1, 0, 1,
-0.9265417, -2.763177, -2.898832, 0.8235294, 1, 0, 1,
-0.9254059, 1.388783, -0.9311045, 0.8196079, 1, 0, 1,
-0.9238628, -0.5510077, -1.085207, 0.8117647, 1, 0, 1,
-0.9210125, -1.26844, -2.977471, 0.8078431, 1, 0, 1,
-0.9197581, 2.151101, 0.5229184, 0.8, 1, 0, 1,
-0.9149874, 0.1331291, -1.19865, 0.7921569, 1, 0, 1,
-0.9124988, 0.08331442, -1.554264, 0.7882353, 1, 0, 1,
-0.9109976, 1.536936, -0.3559045, 0.7803922, 1, 0, 1,
-0.9106772, 1.8671, -0.8511296, 0.7764706, 1, 0, 1,
-0.9057698, 0.3787808, -2.38907, 0.7686275, 1, 0, 1,
-0.9022661, 0.7354787, -0.5013384, 0.7647059, 1, 0, 1,
-0.9003074, 0.1361387, -2.766533, 0.7568628, 1, 0, 1,
-0.8950891, 0.3312472, -0.4353762, 0.7529412, 1, 0, 1,
-0.8943093, -0.1423695, -1.940099, 0.7450981, 1, 0, 1,
-0.8927974, -0.6931174, -3.296223, 0.7411765, 1, 0, 1,
-0.8891839, -0.4377067, -2.321259, 0.7333333, 1, 0, 1,
-0.8881665, -0.4359606, -0.8278056, 0.7294118, 1, 0, 1,
-0.887693, -1.650596, -2.716278, 0.7215686, 1, 0, 1,
-0.882174, 0.2974729, 0.1888959, 0.7176471, 1, 0, 1,
-0.8690441, -0.2836916, -2.741526, 0.7098039, 1, 0, 1,
-0.8682694, 1.089345, -0.3740358, 0.7058824, 1, 0, 1,
-0.867845, 1.319654, -0.5832787, 0.6980392, 1, 0, 1,
-0.8652796, -0.9298767, -2.875135, 0.6901961, 1, 0, 1,
-0.8640069, -0.7118387, -2.776404, 0.6862745, 1, 0, 1,
-0.8599107, 0.2991284, -0.994255, 0.6784314, 1, 0, 1,
-0.8579758, -2.277124, -2.416973, 0.6745098, 1, 0, 1,
-0.8566399, 2.109816, 0.5585321, 0.6666667, 1, 0, 1,
-0.8476776, 0.4554998, -0.4758808, 0.6627451, 1, 0, 1,
-0.8441554, -1.463184, -3.219781, 0.654902, 1, 0, 1,
-0.839008, -0.06270814, -0.3048648, 0.6509804, 1, 0, 1,
-0.8354328, 0.3213989, -1.536384, 0.6431373, 1, 0, 1,
-0.8293095, -0.4349141, -2.63359, 0.6392157, 1, 0, 1,
-0.8272859, -1.121199, -2.889478, 0.6313726, 1, 0, 1,
-0.8263554, -0.9414497, -2.564591, 0.627451, 1, 0, 1,
-0.8211752, 1.29984, -0.3526784, 0.6196079, 1, 0, 1,
-0.8174707, -0.5412933, -1.363817, 0.6156863, 1, 0, 1,
-0.8168468, -1.455569, -2.879569, 0.6078432, 1, 0, 1,
-0.8127895, -0.7120677, -2.542567, 0.6039216, 1, 0, 1,
-0.8027571, 0.5664955, -2.407416, 0.5960785, 1, 0, 1,
-0.8002362, -1.467141, -1.850215, 0.5882353, 1, 0, 1,
-0.7988061, 0.5614707, -0.9240149, 0.5843138, 1, 0, 1,
-0.7985905, -0.2081556, -3.839346, 0.5764706, 1, 0, 1,
-0.791317, 0.03752726, -1.261214, 0.572549, 1, 0, 1,
-0.7903034, 1.032779, -3.443921, 0.5647059, 1, 0, 1,
-0.7780741, -0.8970631, -1.324293, 0.5607843, 1, 0, 1,
-0.7739943, 1.021761, -0.7572823, 0.5529412, 1, 0, 1,
-0.7730704, 0.8067217, -1.314909, 0.5490196, 1, 0, 1,
-0.7638792, 1.388809, -0.8986483, 0.5411765, 1, 0, 1,
-0.7635086, 0.2723953, -0.3007711, 0.5372549, 1, 0, 1,
-0.7611735, -1.171483, -3.022604, 0.5294118, 1, 0, 1,
-0.7546124, -0.3901062, -2.50354, 0.5254902, 1, 0, 1,
-0.7528098, -1.203307, -4.148457, 0.5176471, 1, 0, 1,
-0.7509517, -1.658816, -1.471056, 0.5137255, 1, 0, 1,
-0.7503713, -2.196697, -1.104398, 0.5058824, 1, 0, 1,
-0.7476601, -0.4758393, -0.5974138, 0.5019608, 1, 0, 1,
-0.745268, -0.7075511, -3.105069, 0.4941176, 1, 0, 1,
-0.7426229, -0.4464568, -3.239101, 0.4862745, 1, 0, 1,
-0.7327014, 0.1703672, -0.6445959, 0.4823529, 1, 0, 1,
-0.7314163, -1.069386, -4.429574, 0.4745098, 1, 0, 1,
-0.7272223, -0.6369649, -2.236067, 0.4705882, 1, 0, 1,
-0.7246012, -2.209873, -4.027234, 0.4627451, 1, 0, 1,
-0.7242457, 1.833822, -0.8786321, 0.4588235, 1, 0, 1,
-0.7211924, -1.334703, -0.06272528, 0.4509804, 1, 0, 1,
-0.719995, -1.835295, -1.694164, 0.4470588, 1, 0, 1,
-0.7160643, -0.4182267, -1.746401, 0.4392157, 1, 0, 1,
-0.7155036, -1.009313, -2.0596, 0.4352941, 1, 0, 1,
-0.7129081, -0.1797273, -0.457496, 0.427451, 1, 0, 1,
-0.7127938, -0.02625386, -2.961007, 0.4235294, 1, 0, 1,
-0.7078784, -0.07832605, -1.679674, 0.4156863, 1, 0, 1,
-0.706148, -0.4856514, -2.268157, 0.4117647, 1, 0, 1,
-0.7048331, 1.137162, -0.8913583, 0.4039216, 1, 0, 1,
-0.7033849, 0.009328268, -2.485087, 0.3960784, 1, 0, 1,
-0.7029779, -2.054635, -2.672815, 0.3921569, 1, 0, 1,
-0.7024564, -0.2441741, -2.769031, 0.3843137, 1, 0, 1,
-0.6991387, -0.5239503, -1.816786, 0.3803922, 1, 0, 1,
-0.6989002, 0.2942046, -1.128365, 0.372549, 1, 0, 1,
-0.6971731, 0.4320448, -0.3529557, 0.3686275, 1, 0, 1,
-0.6914849, 1.55313, 0.07446478, 0.3607843, 1, 0, 1,
-0.6849408, 0.9841943, 0.3835929, 0.3568628, 1, 0, 1,
-0.6848052, -0.9415412, -3.311751, 0.3490196, 1, 0, 1,
-0.6845571, -0.02935752, -1.871115, 0.345098, 1, 0, 1,
-0.6840794, -0.3718632, -1.777024, 0.3372549, 1, 0, 1,
-0.6687949, -0.5412776, -3.382044, 0.3333333, 1, 0, 1,
-0.667791, 0.9924458, -1.384131, 0.3254902, 1, 0, 1,
-0.6666085, -0.1375132, 0.300192, 0.3215686, 1, 0, 1,
-0.665418, 0.864046, 0.1868936, 0.3137255, 1, 0, 1,
-0.6636854, 0.7108491, -1.437583, 0.3098039, 1, 0, 1,
-0.6621216, 1.912081, -0.4169308, 0.3019608, 1, 0, 1,
-0.6486702, -0.5165985, -4.004054, 0.2941177, 1, 0, 1,
-0.6460188, -0.2366132, -1.145626, 0.2901961, 1, 0, 1,
-0.641479, -0.3205097, -2.223795, 0.282353, 1, 0, 1,
-0.6407083, -1.746065, -2.949536, 0.2784314, 1, 0, 1,
-0.6398275, 0.4377274, -1.647578, 0.2705882, 1, 0, 1,
-0.6348186, -0.4241685, -2.733332, 0.2666667, 1, 0, 1,
-0.6297812, 0.003759535, -0.8886457, 0.2588235, 1, 0, 1,
-0.6278574, 0.007747903, -0.2088571, 0.254902, 1, 0, 1,
-0.6243491, 2.471825, -0.6444398, 0.2470588, 1, 0, 1,
-0.6242856, -1.997286, -1.582773, 0.2431373, 1, 0, 1,
-0.6198302, 1.451921, -0.1085564, 0.2352941, 1, 0, 1,
-0.6196601, 1.649142, 0.4621476, 0.2313726, 1, 0, 1,
-0.6159718, -1.09024, -3.6549, 0.2235294, 1, 0, 1,
-0.6134018, -0.2302702, -3.334789, 0.2196078, 1, 0, 1,
-0.6069574, 0.2724762, -0.9313259, 0.2117647, 1, 0, 1,
-0.606707, -0.2034419, -3.855919, 0.2078431, 1, 0, 1,
-0.6062447, -0.02172462, -2.888419, 0.2, 1, 0, 1,
-0.605176, -1.058511, -2.006493, 0.1921569, 1, 0, 1,
-0.5965655, -0.2071427, -2.204158, 0.1882353, 1, 0, 1,
-0.595779, -0.6060631, -3.517384, 0.1803922, 1, 0, 1,
-0.5919371, 1.868525, -0.983638, 0.1764706, 1, 0, 1,
-0.5904828, 0.8333693, 1.424665, 0.1686275, 1, 0, 1,
-0.5897893, -1.491385, -1.884013, 0.1647059, 1, 0, 1,
-0.5860317, -1.477337, -3.055982, 0.1568628, 1, 0, 1,
-0.5860223, 1.56309, -2.300028, 0.1529412, 1, 0, 1,
-0.5748383, -0.3635433, -2.119369, 0.145098, 1, 0, 1,
-0.5747348, 0.5134129, -1.694915, 0.1411765, 1, 0, 1,
-0.573321, 0.1288004, -2.909913, 0.1333333, 1, 0, 1,
-0.5713552, -0.9805751, -3.890485, 0.1294118, 1, 0, 1,
-0.5690842, -1.285872, -3.496251, 0.1215686, 1, 0, 1,
-0.5564005, -0.6734498, -0.7044446, 0.1176471, 1, 0, 1,
-0.5481317, 2.756923, 1.088048, 0.1098039, 1, 0, 1,
-0.5398195, 0.2578309, -3.974958, 0.1058824, 1, 0, 1,
-0.5362165, -0.4638153, -0.8525136, 0.09803922, 1, 0, 1,
-0.53151, 0.577481, -1.540691, 0.09019608, 1, 0, 1,
-0.5283856, 0.6793602, -1.390517, 0.08627451, 1, 0, 1,
-0.5274732, 1.170604, -0.9455756, 0.07843138, 1, 0, 1,
-0.5250508, 1.460333, 0.8256862, 0.07450981, 1, 0, 1,
-0.5207328, -1.548481, -2.542513, 0.06666667, 1, 0, 1,
-0.5206807, -0.2549381, -1.955606, 0.0627451, 1, 0, 1,
-0.5204859, 2.425059, 1.566308, 0.05490196, 1, 0, 1,
-0.5194964, 0.9088544, 0.2719058, 0.05098039, 1, 0, 1,
-0.5168229, 0.2543557, -1.36622, 0.04313726, 1, 0, 1,
-0.5160262, 0.3027878, -0.8002692, 0.03921569, 1, 0, 1,
-0.5157723, -0.8455785, -1.49066, 0.03137255, 1, 0, 1,
-0.5145711, -0.3410486, -0.5157819, 0.02745098, 1, 0, 1,
-0.5134537, -0.5089101, -3.305741, 0.01960784, 1, 0, 1,
-0.5132747, -0.9642243, -2.708971, 0.01568628, 1, 0, 1,
-0.5130375, 0.7130978, 0.8488532, 0.007843138, 1, 0, 1,
-0.5106073, 0.173248, -1.526693, 0.003921569, 1, 0, 1,
-0.5052326, 0.131265, -2.508484, 0, 1, 0.003921569, 1,
-0.4923227, -1.314393, -2.19396, 0, 1, 0.01176471, 1,
-0.48942, 0.1541045, -0.9793276, 0, 1, 0.01568628, 1,
-0.4872883, -0.9391664, -1.560238, 0, 1, 0.02352941, 1,
-0.4848396, 0.1381497, -0.3968625, 0, 1, 0.02745098, 1,
-0.4804724, 0.4750675, -2.435823, 0, 1, 0.03529412, 1,
-0.48028, -0.397527, -4.188854, 0, 1, 0.03921569, 1,
-0.4787602, -0.8281177, -2.224399, 0, 1, 0.04705882, 1,
-0.4771556, -0.7779954, -1.318468, 0, 1, 0.05098039, 1,
-0.4766619, -1.551848, -2.771487, 0, 1, 0.05882353, 1,
-0.4754872, 0.2158308, -2.079709, 0, 1, 0.0627451, 1,
-0.4734062, 1.057272, 0.4720095, 0, 1, 0.07058824, 1,
-0.4711836, 0.6065196, 1.469894, 0, 1, 0.07450981, 1,
-0.4687423, 0.3142664, -0.416144, 0, 1, 0.08235294, 1,
-0.463562, -0.8710464, -1.94911, 0, 1, 0.08627451, 1,
-0.4603589, -1.126909, -1.729849, 0, 1, 0.09411765, 1,
-0.4585185, -1.808636, -3.385622, 0, 1, 0.1019608, 1,
-0.4584647, 0.01794313, -1.266882, 0, 1, 0.1058824, 1,
-0.457267, 0.07115152, -0.7339405, 0, 1, 0.1137255, 1,
-0.4568094, -0.3901952, -1.93706, 0, 1, 0.1176471, 1,
-0.4546051, -0.6252244, -2.569119, 0, 1, 0.1254902, 1,
-0.4417031, 0.3505669, -1.955529, 0, 1, 0.1294118, 1,
-0.4413913, 0.2137626, -1.56831, 0, 1, 0.1372549, 1,
-0.4411226, 1.279095, -0.4018973, 0, 1, 0.1411765, 1,
-0.4385218, 0.3378136, -1.540322, 0, 1, 0.1490196, 1,
-0.4382073, 1.552881, -0.5809559, 0, 1, 0.1529412, 1,
-0.4376398, 0.8622797, -1.704294, 0, 1, 0.1607843, 1,
-0.4353557, -0.09794949, -1.577005, 0, 1, 0.1647059, 1,
-0.4344957, 0.5726596, -0.2580949, 0, 1, 0.172549, 1,
-0.4324215, 0.5952353, -0.7100419, 0, 1, 0.1764706, 1,
-0.4254368, 0.120442, -0.6282054, 0, 1, 0.1843137, 1,
-0.4180102, -0.3529597, -3.364282, 0, 1, 0.1882353, 1,
-0.4171999, -0.08840306, -1.50141, 0, 1, 0.1960784, 1,
-0.4141003, 1.203422, -0.6699303, 0, 1, 0.2039216, 1,
-0.4132883, 1.606857, -0.8844129, 0, 1, 0.2078431, 1,
-0.4130859, 0.07433143, -0.9189984, 0, 1, 0.2156863, 1,
-0.4089914, -1.669433, -2.020206, 0, 1, 0.2196078, 1,
-0.3979369, -0.3842722, -2.177625, 0, 1, 0.227451, 1,
-0.3975649, 1.172711, -0.1495045, 0, 1, 0.2313726, 1,
-0.3972611, -0.8697398, -3.877342, 0, 1, 0.2392157, 1,
-0.3920677, 0.2044373, -1.365311, 0, 1, 0.2431373, 1,
-0.3910692, -2.573686, -4.334427, 0, 1, 0.2509804, 1,
-0.3877821, 1.053676, -0.7620475, 0, 1, 0.254902, 1,
-0.3861133, -0.1715068, -2.974693, 0, 1, 0.2627451, 1,
-0.3750539, -0.3577091, -2.458277, 0, 1, 0.2666667, 1,
-0.3633954, -1.24903, -3.599528, 0, 1, 0.2745098, 1,
-0.3551242, 0.1707099, -0.1742564, 0, 1, 0.2784314, 1,
-0.350508, -2.013664, -3.339086, 0, 1, 0.2862745, 1,
-0.3497833, -1.184097, -5.050037, 0, 1, 0.2901961, 1,
-0.3461921, 0.2945823, 0.1811328, 0, 1, 0.2980392, 1,
-0.3456962, 0.7474017, 0.5905603, 0, 1, 0.3058824, 1,
-0.3436178, -2.197511, -1.992689, 0, 1, 0.3098039, 1,
-0.3417175, -0.3435719, -1.299954, 0, 1, 0.3176471, 1,
-0.3416665, 0.06400086, -0.8624655, 0, 1, 0.3215686, 1,
-0.3411083, 0.7440058, 0.5244472, 0, 1, 0.3294118, 1,
-0.3394633, 0.5787229, -0.4208274, 0, 1, 0.3333333, 1,
-0.336734, 0.7686698, -0.3512223, 0, 1, 0.3411765, 1,
-0.3316162, 0.03909142, -2.341846, 0, 1, 0.345098, 1,
-0.3296753, 0.05837622, -1.067952, 0, 1, 0.3529412, 1,
-0.3243478, 1.026624, 0.8786213, 0, 1, 0.3568628, 1,
-0.3222588, -1.106493, -2.548726, 0, 1, 0.3647059, 1,
-0.3197631, 0.8996562, 0.7834029, 0, 1, 0.3686275, 1,
-0.3168711, -0.300126, -3.32247, 0, 1, 0.3764706, 1,
-0.3119956, -0.7986823, -1.54493, 0, 1, 0.3803922, 1,
-0.3103849, 0.2915804, -1.426176, 0, 1, 0.3882353, 1,
-0.3077543, 2.565502, 0.2473492, 0, 1, 0.3921569, 1,
-0.3054259, -0.6243569, -1.152424, 0, 1, 0.4, 1,
-0.3033047, -1.248111, -4.400069, 0, 1, 0.4078431, 1,
-0.3010778, -0.6927407, -3.257024, 0, 1, 0.4117647, 1,
-0.2980695, 1.482159, -1.487974, 0, 1, 0.4196078, 1,
-0.2954876, 0.08342309, 0.01296516, 0, 1, 0.4235294, 1,
-0.2954415, -0.3641814, -2.593834, 0, 1, 0.4313726, 1,
-0.2937007, -1.200421, -3.392783, 0, 1, 0.4352941, 1,
-0.2879609, 0.05223543, -2.115282, 0, 1, 0.4431373, 1,
-0.2876119, -0.0313154, -1.249932, 0, 1, 0.4470588, 1,
-0.2798447, 0.1765033, -1.613116, 0, 1, 0.454902, 1,
-0.2784084, 1.45987, -0.7272852, 0, 1, 0.4588235, 1,
-0.2719391, 1.11882, -1.416245, 0, 1, 0.4666667, 1,
-0.2714708, -0.9983594, -3.309315, 0, 1, 0.4705882, 1,
-0.2711397, -1.792154, -3.044286, 0, 1, 0.4784314, 1,
-0.2673834, -1.249068, -4.031724, 0, 1, 0.4823529, 1,
-0.2651236, 0.2453052, -1.312048, 0, 1, 0.4901961, 1,
-0.26117, 0.8345659, 0.9728432, 0, 1, 0.4941176, 1,
-0.2552608, 0.5569172, -0.335388, 0, 1, 0.5019608, 1,
-0.2522925, -1.504278, -2.101898, 0, 1, 0.509804, 1,
-0.2512206, 0.03289926, -2.849284, 0, 1, 0.5137255, 1,
-0.2487393, 0.1824401, -2.011458, 0, 1, 0.5215687, 1,
-0.2466872, 0.5925372, 0.9961191, 0, 1, 0.5254902, 1,
-0.2460106, -0.4510276, -3.5657, 0, 1, 0.5333334, 1,
-0.2456077, -0.3535294, -3.280429, 0, 1, 0.5372549, 1,
-0.2447962, -0.696476, -2.040994, 0, 1, 0.5450981, 1,
-0.2431215, 0.2509364, -0.186559, 0, 1, 0.5490196, 1,
-0.2367156, 0.1736362, -1.543974, 0, 1, 0.5568628, 1,
-0.2352081, 0.0742266, -1.196668, 0, 1, 0.5607843, 1,
-0.2346389, 0.02561154, -1.346985, 0, 1, 0.5686275, 1,
-0.2268894, -0.1055783, -1.456842, 0, 1, 0.572549, 1,
-0.2261872, 0.7070509, -0.7495608, 0, 1, 0.5803922, 1,
-0.225488, -1.003449, -3.389523, 0, 1, 0.5843138, 1,
-0.2219091, 0.5646418, -0.9143558, 0, 1, 0.5921569, 1,
-0.221144, 0.4357187, 0.01537645, 0, 1, 0.5960785, 1,
-0.2168744, 0.252203, -1.296152, 0, 1, 0.6039216, 1,
-0.214359, -0.05510369, -0.8098308, 0, 1, 0.6117647, 1,
-0.2123557, 0.1799887, 0.4109718, 0, 1, 0.6156863, 1,
-0.2118096, -0.04486743, -1.809626, 0, 1, 0.6235294, 1,
-0.2100362, -0.7142871, -3.405828, 0, 1, 0.627451, 1,
-0.2092003, -0.6790959, -3.874554, 0, 1, 0.6352941, 1,
-0.2029518, 1.574762, 1.125974, 0, 1, 0.6392157, 1,
-0.200891, -1.411692, -1.70774, 0, 1, 0.6470588, 1,
-0.1995658, 0.353144, 1.445434, 0, 1, 0.6509804, 1,
-0.1980752, -0.5964982, -3.09414, 0, 1, 0.6588235, 1,
-0.1966902, -0.1649195, -2.705187, 0, 1, 0.6627451, 1,
-0.1936066, 0.5520511, -0.07386518, 0, 1, 0.6705883, 1,
-0.1925285, 0.4407235, -0.86994, 0, 1, 0.6745098, 1,
-0.1913756, 1.047027, -0.9919417, 0, 1, 0.682353, 1,
-0.1905759, 0.09723899, -0.406033, 0, 1, 0.6862745, 1,
-0.1892038, -0.4025399, -3.229138, 0, 1, 0.6941177, 1,
-0.1859676, -0.7750528, -1.258648, 0, 1, 0.7019608, 1,
-0.1838941, -1.729075, -5.235335, 0, 1, 0.7058824, 1,
-0.1808576, 0.05958252, -0.7496761, 0, 1, 0.7137255, 1,
-0.1770666, 0.7722901, 0.2959246, 0, 1, 0.7176471, 1,
-0.17381, 0.4817738, -0.2787144, 0, 1, 0.7254902, 1,
-0.1727291, 0.1130649, -2.593432, 0, 1, 0.7294118, 1,
-0.1697374, 1.057043, -1.593031, 0, 1, 0.7372549, 1,
-0.1663001, -0.9398112, -2.341833, 0, 1, 0.7411765, 1,
-0.1643293, -0.7022618, -2.40831, 0, 1, 0.7490196, 1,
-0.1538474, -1.079231, -2.7426, 0, 1, 0.7529412, 1,
-0.1536071, 1.026542, 0.9919797, 0, 1, 0.7607843, 1,
-0.1512682, 0.2093893, -0.8323642, 0, 1, 0.7647059, 1,
-0.1484429, 0.5116516, 0.7088735, 0, 1, 0.772549, 1,
-0.148005, 0.4280012, -0.7339751, 0, 1, 0.7764706, 1,
-0.145717, 1.117166, 2.006035, 0, 1, 0.7843137, 1,
-0.1432922, -1.067983, -1.986468, 0, 1, 0.7882353, 1,
-0.1424274, -1.320675, -2.623087, 0, 1, 0.7960784, 1,
-0.1398448, 2.55898, -1.292635, 0, 1, 0.8039216, 1,
-0.1394905, -0.9941433, -4.192017, 0, 1, 0.8078431, 1,
-0.1377198, -0.003720795, -2.724718, 0, 1, 0.8156863, 1,
-0.1367818, -0.7013964, -2.558065, 0, 1, 0.8196079, 1,
-0.1302558, 1.232866, -0.01299641, 0, 1, 0.827451, 1,
-0.1290373, 0.195147, -0.1624341, 0, 1, 0.8313726, 1,
-0.120326, 1.179156, -0.04131292, 0, 1, 0.8392157, 1,
-0.1132943, 0.2193761, -1.043352, 0, 1, 0.8431373, 1,
-0.1130226, -2.70015, -1.618118, 0, 1, 0.8509804, 1,
-0.1087171, -1.591282, -2.411688, 0, 1, 0.854902, 1,
-0.1066334, -0.5916534, -4.579544, 0, 1, 0.8627451, 1,
-0.1046369, -0.660857, -1.959525, 0, 1, 0.8666667, 1,
-0.1041134, 0.3520896, -0.2846719, 0, 1, 0.8745098, 1,
-0.1038826, 0.6600026, 0.4653197, 0, 1, 0.8784314, 1,
-0.1008879, 0.9308159, -0.03397914, 0, 1, 0.8862745, 1,
-0.09901665, -0.213978, -3.466375, 0, 1, 0.8901961, 1,
-0.09553245, -1.193007, -2.113481, 0, 1, 0.8980392, 1,
-0.09479202, -1.055258, -3.785556, 0, 1, 0.9058824, 1,
-0.09163675, -0.8120282, -4.046455, 0, 1, 0.9098039, 1,
-0.09140453, 0.7828391, 0.7151362, 0, 1, 0.9176471, 1,
-0.08802307, 1.056078, -1.322901, 0, 1, 0.9215686, 1,
-0.08445631, 0.1545422, -0.729392, 0, 1, 0.9294118, 1,
-0.08366574, -1.269047, -3.562555, 0, 1, 0.9333333, 1,
-0.0822028, 0.02297131, -1.887215, 0, 1, 0.9411765, 1,
-0.08177898, -0.778373, -2.315812, 0, 1, 0.945098, 1,
-0.07739245, -0.3387603, -3.836502, 0, 1, 0.9529412, 1,
-0.07719032, 2.109995, 0.4060888, 0, 1, 0.9568627, 1,
-0.07576972, -0.2388086, -0.7602511, 0, 1, 0.9647059, 1,
-0.07544244, -0.2243546, -3.16605, 0, 1, 0.9686275, 1,
-0.06982451, 0.8567047, -1.109999, 0, 1, 0.9764706, 1,
-0.06780101, -0.324954, -2.574131, 0, 1, 0.9803922, 1,
-0.06722083, 0.2572497, -0.5251066, 0, 1, 0.9882353, 1,
-0.06449877, 0.5912547, 0.3998226, 0, 1, 0.9921569, 1,
-0.06342587, 0.5409827, -1.178512, 0, 1, 1, 1,
-0.06259618, 1.474548, 0.3825963, 0, 0.9921569, 1, 1,
-0.05977713, 0.2845493, -0.3202009, 0, 0.9882353, 1, 1,
-0.05706001, 1.224199, 0.9345663, 0, 0.9803922, 1, 1,
-0.05598366, 0.2671287, -1.890581, 0, 0.9764706, 1, 1,
-0.05483263, 0.2278099, 0.5924425, 0, 0.9686275, 1, 1,
-0.05478524, -0.7139612, -2.368981, 0, 0.9647059, 1, 1,
-0.0527342, -0.8416854, -2.937247, 0, 0.9568627, 1, 1,
-0.04116723, -1.733272, -3.234616, 0, 0.9529412, 1, 1,
-0.03514144, -0.9955452, -4.414789, 0, 0.945098, 1, 1,
-0.03474675, 0.9521741, 0.7860119, 0, 0.9411765, 1, 1,
-0.03382332, -0.841284, -2.136958, 0, 0.9333333, 1, 1,
-0.03149259, -0.9761771, -3.17734, 0, 0.9294118, 1, 1,
-0.03013149, 0.01772184, 0.8416089, 0, 0.9215686, 1, 1,
-0.02985437, -0.08302327, -1.912721, 0, 0.9176471, 1, 1,
-0.02346517, 1.135923, 0.02820454, 0, 0.9098039, 1, 1,
-0.01774622, 0.2914465, -0.7971093, 0, 0.9058824, 1, 1,
-0.01582144, 0.2433296, -0.5004607, 0, 0.8980392, 1, 1,
-0.012936, -1.180367, -3.530931, 0, 0.8901961, 1, 1,
-0.01291959, -0.0136083, -3.964766, 0, 0.8862745, 1, 1,
-0.01257494, 0.6938795, -0.498908, 0, 0.8784314, 1, 1,
-0.01239204, -0.7824752, -3.034326, 0, 0.8745098, 1, 1,
-0.00812303, 0.6405739, -1.4242, 0, 0.8666667, 1, 1,
0.01005917, -0.3671522, 4.089999, 0, 0.8627451, 1, 1,
0.01109301, 3.468766, -0.1491096, 0, 0.854902, 1, 1,
0.01612144, 0.5678675, -0.4102409, 0, 0.8509804, 1, 1,
0.02668159, 0.8595318, 0.0646233, 0, 0.8431373, 1, 1,
0.02710692, -1.453068, 4.030712, 0, 0.8392157, 1, 1,
0.03055727, 0.669107, -0.01280512, 0, 0.8313726, 1, 1,
0.03229795, -0.6143757, 3.014492, 0, 0.827451, 1, 1,
0.03372527, 1.008752, 0.1384215, 0, 0.8196079, 1, 1,
0.03400622, -0.04420537, 3.231557, 0, 0.8156863, 1, 1,
0.03912156, 2.16305, 0.2174914, 0, 0.8078431, 1, 1,
0.04293394, -0.1376845, 0.5523806, 0, 0.8039216, 1, 1,
0.04521831, 0.3185042, -1.114578, 0, 0.7960784, 1, 1,
0.04575337, 1.542835, 0.8803557, 0, 0.7882353, 1, 1,
0.04956147, 0.8519974, -1.094692, 0, 0.7843137, 1, 1,
0.0521906, -0.08046393, 0.1609885, 0, 0.7764706, 1, 1,
0.05437602, 0.2012539, 2.387918, 0, 0.772549, 1, 1,
0.05488459, -0.6787912, 2.140817, 0, 0.7647059, 1, 1,
0.05812516, 0.8234543, -2.307472, 0, 0.7607843, 1, 1,
0.06134219, -0.6655813, 3.149101, 0, 0.7529412, 1, 1,
0.0622893, 0.5292761, 1.202649, 0, 0.7490196, 1, 1,
0.06659514, -0.5094318, 2.185567, 0, 0.7411765, 1, 1,
0.06800524, -1.502631, 2.552409, 0, 0.7372549, 1, 1,
0.0694221, 0.01312329, 1.621101, 0, 0.7294118, 1, 1,
0.07160997, -0.223532, 3.844877, 0, 0.7254902, 1, 1,
0.0757697, 1.056327, -1.209994, 0, 0.7176471, 1, 1,
0.07617346, 1.215737, -0.2037244, 0, 0.7137255, 1, 1,
0.0774529, -0.7328486, 3.556593, 0, 0.7058824, 1, 1,
0.08067843, 0.3951439, 1.265769, 0, 0.6980392, 1, 1,
0.08145279, 0.1578233, 0.1666847, 0, 0.6941177, 1, 1,
0.08727541, 1.560285, 1.789863, 0, 0.6862745, 1, 1,
0.09789816, -0.03025166, 4.148435, 0, 0.682353, 1, 1,
0.09955721, -0.8358767, 2.253795, 0, 0.6745098, 1, 1,
0.0997167, -1.80491, 4.57439, 0, 0.6705883, 1, 1,
0.09983005, -0.8201653, 2.219954, 0, 0.6627451, 1, 1,
0.1001239, 1.230428, 1.435945, 0, 0.6588235, 1, 1,
0.1021675, -0.2750577, 1.510837, 0, 0.6509804, 1, 1,
0.1105291, -1.222666, 2.692759, 0, 0.6470588, 1, 1,
0.1156622, -0.2102903, 3.290324, 0, 0.6392157, 1, 1,
0.1158249, -1.485808, 4.424973, 0, 0.6352941, 1, 1,
0.1173359, 0.7139242, 0.8771449, 0, 0.627451, 1, 1,
0.1191376, -1.166831, 2.075059, 0, 0.6235294, 1, 1,
0.1212019, 0.6972586, 0.4568081, 0, 0.6156863, 1, 1,
0.1212463, 0.5033565, -1.925627, 0, 0.6117647, 1, 1,
0.1238628, 1.342119, -0.6665567, 0, 0.6039216, 1, 1,
0.1271189, -0.5083209, 3.324032, 0, 0.5960785, 1, 1,
0.1290106, 1.694878, 1.880124, 0, 0.5921569, 1, 1,
0.1303504, -0.1238004, 1.451981, 0, 0.5843138, 1, 1,
0.1325958, -0.1639871, 1.329863, 0, 0.5803922, 1, 1,
0.1351329, 0.63024, -1.818931, 0, 0.572549, 1, 1,
0.1427557, 0.7691709, 0.7031326, 0, 0.5686275, 1, 1,
0.1431977, -0.9757519, 1.503345, 0, 0.5607843, 1, 1,
0.1466481, 1.100062, 0.2638477, 0, 0.5568628, 1, 1,
0.1475056, 1.427586, 1.473802, 0, 0.5490196, 1, 1,
0.1487172, -2.131793, 3.599115, 0, 0.5450981, 1, 1,
0.1587262, -0.8257428, 3.336413, 0, 0.5372549, 1, 1,
0.1604718, -0.656213, 1.968896, 0, 0.5333334, 1, 1,
0.1655254, 0.2163186, 1.736122, 0, 0.5254902, 1, 1,
0.1658062, -0.9151466, 3.744647, 0, 0.5215687, 1, 1,
0.1696007, -0.5275451, 4.875106, 0, 0.5137255, 1, 1,
0.1703895, -0.9550236, 3.556916, 0, 0.509804, 1, 1,
0.1761685, -0.944783, 2.388482, 0, 0.5019608, 1, 1,
0.1782245, -0.7863536, 3.794554, 0, 0.4941176, 1, 1,
0.1824857, 2.013532, -2.179821, 0, 0.4901961, 1, 1,
0.1888114, -1.495201, 5.05851, 0, 0.4823529, 1, 1,
0.189556, -1.12659, 3.470453, 0, 0.4784314, 1, 1,
0.1896185, -2.074551, 3.102071, 0, 0.4705882, 1, 1,
0.1912602, -0.4041802, 4.011345, 0, 0.4666667, 1, 1,
0.1927364, 0.7152495, 1.435924, 0, 0.4588235, 1, 1,
0.1935413, 0.3692374, 0.852336, 0, 0.454902, 1, 1,
0.1942523, -0.7590085, 2.705014, 0, 0.4470588, 1, 1,
0.2026535, -1.861453, 3.963813, 0, 0.4431373, 1, 1,
0.2031951, -0.7133434, 3.624539, 0, 0.4352941, 1, 1,
0.2037019, 0.03366062, 1.820694, 0, 0.4313726, 1, 1,
0.2048401, -1.088779, 3.408886, 0, 0.4235294, 1, 1,
0.2058827, 0.3541783, 0.6048056, 0, 0.4196078, 1, 1,
0.2085268, 0.7822337, 0.863396, 0, 0.4117647, 1, 1,
0.2092651, 0.08110087, 2.476939, 0, 0.4078431, 1, 1,
0.2106272, 0.162582, 3.557555, 0, 0.4, 1, 1,
0.212578, 1.264104, 0.6527401, 0, 0.3921569, 1, 1,
0.2135666, 0.05193141, -0.5992868, 0, 0.3882353, 1, 1,
0.2145028, 1.116679, 2.549767, 0, 0.3803922, 1, 1,
0.2146655, 0.8483154, 0.3422839, 0, 0.3764706, 1, 1,
0.2193646, -0.2419402, -0.05937875, 0, 0.3686275, 1, 1,
0.2233373, 1.236802, 0.6129195, 0, 0.3647059, 1, 1,
0.2244217, -0.697035, 2.997995, 0, 0.3568628, 1, 1,
0.2246346, -0.6494594, 3.963322, 0, 0.3529412, 1, 1,
0.2326876, 0.4739014, 0.9158496, 0, 0.345098, 1, 1,
0.2329206, 1.339406, 1.12218, 0, 0.3411765, 1, 1,
0.2386217, 1.794432, 1.80985, 0, 0.3333333, 1, 1,
0.2407041, 0.7111331, 0.1242142, 0, 0.3294118, 1, 1,
0.2440704, -1.302907, 2.101355, 0, 0.3215686, 1, 1,
0.2475704, 1.135726, 0.3878183, 0, 0.3176471, 1, 1,
0.2507449, 0.9019077, 0.07267382, 0, 0.3098039, 1, 1,
0.2563618, 1.490768, 1.652054, 0, 0.3058824, 1, 1,
0.2590291, 0.2296293, 1.314965, 0, 0.2980392, 1, 1,
0.2604802, 1.790892, 0.9169659, 0, 0.2901961, 1, 1,
0.2621064, -1.408417, 3.09844, 0, 0.2862745, 1, 1,
0.264247, -0.04416965, 2.357232, 0, 0.2784314, 1, 1,
0.2678695, -0.3161367, 3.286946, 0, 0.2745098, 1, 1,
0.2716721, -0.9332658, 2.041182, 0, 0.2666667, 1, 1,
0.2805668, 1.007827, -1.088082, 0, 0.2627451, 1, 1,
0.2812934, -1.977522, 5.927461, 0, 0.254902, 1, 1,
0.2826503, 2.365418, 2.439265, 0, 0.2509804, 1, 1,
0.287904, -0.8497608, 2.548411, 0, 0.2431373, 1, 1,
0.2936212, -1.116158, 1.929249, 0, 0.2392157, 1, 1,
0.2939431, 0.2918922, 1.469156, 0, 0.2313726, 1, 1,
0.2961564, -0.8723313, 2.451495, 0, 0.227451, 1, 1,
0.2964706, -0.7234018, 2.239895, 0, 0.2196078, 1, 1,
0.3012976, -0.8340626, 2.848932, 0, 0.2156863, 1, 1,
0.30216, -0.5421419, 2.542843, 0, 0.2078431, 1, 1,
0.3060708, -0.9896888, 2.689889, 0, 0.2039216, 1, 1,
0.3063343, 0.6341707, 1.215216, 0, 0.1960784, 1, 1,
0.3157594, 1.01454, 1.559295, 0, 0.1882353, 1, 1,
0.3187343, 0.5210977, 2.165994, 0, 0.1843137, 1, 1,
0.3191439, -0.4729888, 2.901487, 0, 0.1764706, 1, 1,
0.3196782, 0.04464903, 0.5587238, 0, 0.172549, 1, 1,
0.3213919, 1.5071, 0.982006, 0, 0.1647059, 1, 1,
0.3232872, 1.77804, 1.41649, 0, 0.1607843, 1, 1,
0.3244347, -0.4401048, 2.39714, 0, 0.1529412, 1, 1,
0.3286872, 0.9753016, -0.8909163, 0, 0.1490196, 1, 1,
0.3302576, 0.4665436, 0.7927684, 0, 0.1411765, 1, 1,
0.3306792, -1.178411, 3.373122, 0, 0.1372549, 1, 1,
0.3328983, -3.12242, 3.05185, 0, 0.1294118, 1, 1,
0.338394, -1.350794, 2.502607, 0, 0.1254902, 1, 1,
0.341847, 0.4249521, 1.302305, 0, 0.1176471, 1, 1,
0.3420241, -1.101945, 4.622275, 0, 0.1137255, 1, 1,
0.3425133, -0.2828303, 2.30872, 0, 0.1058824, 1, 1,
0.3454841, 0.1252639, 2.187857, 0, 0.09803922, 1, 1,
0.3467126, -0.4455763, 2.853819, 0, 0.09411765, 1, 1,
0.3489952, 0.6101665, -0.3988593, 0, 0.08627451, 1, 1,
0.350249, 1.280781, 2.081179, 0, 0.08235294, 1, 1,
0.3504651, -0.4724458, 2.311806, 0, 0.07450981, 1, 1,
0.3505305, 0.9748485, 0.431746, 0, 0.07058824, 1, 1,
0.3576287, -0.5691963, 2.151318, 0, 0.0627451, 1, 1,
0.3586602, 0.6058131, 0.3357553, 0, 0.05882353, 1, 1,
0.3588478, 1.333772, 0.4829386, 0, 0.05098039, 1, 1,
0.3673391, 0.7134941, 0.9257618, 0, 0.04705882, 1, 1,
0.3682136, 0.1098657, 1.285377, 0, 0.03921569, 1, 1,
0.3682825, -0.9144222, 2.682913, 0, 0.03529412, 1, 1,
0.3691488, 1.078461, -1.231179, 0, 0.02745098, 1, 1,
0.3708931, -1.075756, 2.628276, 0, 0.02352941, 1, 1,
0.3710832, -1.75086, 2.457068, 0, 0.01568628, 1, 1,
0.3734583, 0.8704607, 0.009242839, 0, 0.01176471, 1, 1,
0.3780359, -0.08401866, 0.9438432, 0, 0.003921569, 1, 1,
0.381678, 0.8459588, 0.6579077, 0.003921569, 0, 1, 1,
0.3845055, 0.6145683, 0.01541723, 0.007843138, 0, 1, 1,
0.3859227, -1.080928, 3.909751, 0.01568628, 0, 1, 1,
0.3859523, 0.8618082, 1.263425, 0.01960784, 0, 1, 1,
0.3932832, -0.7528012, 2.340162, 0.02745098, 0, 1, 1,
0.3994561, -0.587018, 2.788759, 0.03137255, 0, 1, 1,
0.4023892, 0.2742666, 0.5997463, 0.03921569, 0, 1, 1,
0.4045701, -0.7096396, 3.461275, 0.04313726, 0, 1, 1,
0.4062581, 0.4246141, 1.972565, 0.05098039, 0, 1, 1,
0.4095795, -1.213068, 1.835297, 0.05490196, 0, 1, 1,
0.4180105, -1.137675, 3.07319, 0.0627451, 0, 1, 1,
0.4198306, -0.872621, 3.017179, 0.06666667, 0, 1, 1,
0.4249754, 0.9551123, 0.2865685, 0.07450981, 0, 1, 1,
0.4262669, 1.409, 1.832072, 0.07843138, 0, 1, 1,
0.4280325, -0.08395264, 4.118406, 0.08627451, 0, 1, 1,
0.4287222, -0.2008015, 1.562369, 0.09019608, 0, 1, 1,
0.4297705, 0.3782341, 0.5605368, 0.09803922, 0, 1, 1,
0.4344217, -0.3396204, 1.563569, 0.1058824, 0, 1, 1,
0.4361342, 0.1589351, 1.255236, 0.1098039, 0, 1, 1,
0.4393287, 0.4368982, 0.2208737, 0.1176471, 0, 1, 1,
0.439773, -1.435745, 3.209012, 0.1215686, 0, 1, 1,
0.4400842, -0.9978857, 2.001408, 0.1294118, 0, 1, 1,
0.4411832, -1.495547, 3.178398, 0.1333333, 0, 1, 1,
0.4423857, 1.661395, -0.5760745, 0.1411765, 0, 1, 1,
0.4425982, -1.644353, 3.08254, 0.145098, 0, 1, 1,
0.444771, -1.429949, 1.689831, 0.1529412, 0, 1, 1,
0.4473095, 1.940765, 0.01201952, 0.1568628, 0, 1, 1,
0.4614751, 2.781474, -1.05143, 0.1647059, 0, 1, 1,
0.4615383, -1.510242, 1.127765, 0.1686275, 0, 1, 1,
0.4619436, -1.065839, 3.46055, 0.1764706, 0, 1, 1,
0.4633277, 0.3331531, -0.876728, 0.1803922, 0, 1, 1,
0.468232, 2.227215, -0.1392394, 0.1882353, 0, 1, 1,
0.4686705, 0.5620769, 1.027738, 0.1921569, 0, 1, 1,
0.4732181, 1.256082, -0.7296793, 0.2, 0, 1, 1,
0.4836582, -0.06251184, 0.9478987, 0.2078431, 0, 1, 1,
0.4839572, 0.4043646, 0.0997794, 0.2117647, 0, 1, 1,
0.4881189, -2.096774, 2.999411, 0.2196078, 0, 1, 1,
0.4882126, 0.4409274, 3.421711, 0.2235294, 0, 1, 1,
0.4903139, -2.909138, 3.290617, 0.2313726, 0, 1, 1,
0.4917669, 1.463834, 1.578475, 0.2352941, 0, 1, 1,
0.5057645, 0.5567282, 0.2002822, 0.2431373, 0, 1, 1,
0.5070762, -0.6711901, 1.873221, 0.2470588, 0, 1, 1,
0.5073485, -0.3261466, 3.243929, 0.254902, 0, 1, 1,
0.5096763, -1.410499, 0.9498138, 0.2588235, 0, 1, 1,
0.5103924, 0.3725317, 1.210776, 0.2666667, 0, 1, 1,
0.5175417, -1.458511, 4.530648, 0.2705882, 0, 1, 1,
0.5219415, -1.879763, 2.301317, 0.2784314, 0, 1, 1,
0.5223887, -0.3079028, 1.570358, 0.282353, 0, 1, 1,
0.5276728, 0.1922805, 1.0231, 0.2901961, 0, 1, 1,
0.5326508, 2.251274, -0.3834975, 0.2941177, 0, 1, 1,
0.5364888, -0.6931394, 3.069232, 0.3019608, 0, 1, 1,
0.536936, 0.8347836, 0.5376083, 0.3098039, 0, 1, 1,
0.5392436, 0.4761343, 0.5042584, 0.3137255, 0, 1, 1,
0.5403119, -0.6853314, 3.296335, 0.3215686, 0, 1, 1,
0.5410449, 1.19419, -0.1977578, 0.3254902, 0, 1, 1,
0.5438136, -0.01828178, 1.72565, 0.3333333, 0, 1, 1,
0.5449761, 0.09617498, 2.68702, 0.3372549, 0, 1, 1,
0.5499423, -0.0769895, 0.4788704, 0.345098, 0, 1, 1,
0.551182, -0.8679121, 3.486502, 0.3490196, 0, 1, 1,
0.5557626, -0.2468123, 1.560013, 0.3568628, 0, 1, 1,
0.5573016, 3.078401, 0.7344943, 0.3607843, 0, 1, 1,
0.5596234, -0.09007401, 1.137711, 0.3686275, 0, 1, 1,
0.5628319, -0.3874161, 2.739539, 0.372549, 0, 1, 1,
0.5678399, 2.159823, 1.003574, 0.3803922, 0, 1, 1,
0.5700682, 0.2997063, 0.4873773, 0.3843137, 0, 1, 1,
0.5703095, 1.221125, 0.1860339, 0.3921569, 0, 1, 1,
0.5745828, 0.3861978, 1.492688, 0.3960784, 0, 1, 1,
0.5840223, -0.2078385, 1.971585, 0.4039216, 0, 1, 1,
0.5926995, 1.049903, 2.796778, 0.4117647, 0, 1, 1,
0.5950065, 0.834056, -0.574223, 0.4156863, 0, 1, 1,
0.5989528, 0.04508603, 2.363009, 0.4235294, 0, 1, 1,
0.6039365, 0.05726997, 0.8440593, 0.427451, 0, 1, 1,
0.6045656, -0.38613, 1.781034, 0.4352941, 0, 1, 1,
0.6068091, 0.3810833, 1.498196, 0.4392157, 0, 1, 1,
0.6084436, -0.5598802, 2.759479, 0.4470588, 0, 1, 1,
0.6110396, -0.7774104, 3.682212, 0.4509804, 0, 1, 1,
0.6113394, -1.053441, 1.948, 0.4588235, 0, 1, 1,
0.6160833, 0.04061024, 1.969506, 0.4627451, 0, 1, 1,
0.6210894, -1.370012, 4.044546, 0.4705882, 0, 1, 1,
0.6219003, 0.6139952, 1.154011, 0.4745098, 0, 1, 1,
0.622027, 0.9981362, 0.9991996, 0.4823529, 0, 1, 1,
0.6233313, 0.7598273, 0.803556, 0.4862745, 0, 1, 1,
0.6285521, -1.472108, 2.045918, 0.4941176, 0, 1, 1,
0.6286909, 0.2289779, 1.346565, 0.5019608, 0, 1, 1,
0.6308497, 0.725474, 1.716243, 0.5058824, 0, 1, 1,
0.6360191, 0.2727648, 3.244609, 0.5137255, 0, 1, 1,
0.637476, 0.2854049, 2.53699, 0.5176471, 0, 1, 1,
0.6464768, -0.1861907, 2.329453, 0.5254902, 0, 1, 1,
0.6491898, 0.4142663, -0.006132421, 0.5294118, 0, 1, 1,
0.6513346, 0.1455888, 0.6018018, 0.5372549, 0, 1, 1,
0.6530412, 0.5295259, 0.548667, 0.5411765, 0, 1, 1,
0.6556435, 0.3505405, -1.389782, 0.5490196, 0, 1, 1,
0.65574, -2.810609, 4.46905, 0.5529412, 0, 1, 1,
0.6597794, 1.577399, -0.947893, 0.5607843, 0, 1, 1,
0.6660688, 2.463055, 0.8040129, 0.5647059, 0, 1, 1,
0.6739758, -1.127629, 1.026723, 0.572549, 0, 1, 1,
0.677839, -0.5112752, 2.282125, 0.5764706, 0, 1, 1,
0.6882616, -0.5193111, 1.716488, 0.5843138, 0, 1, 1,
0.6951765, 0.5668547, 0.5957769, 0.5882353, 0, 1, 1,
0.6969646, -0.2667776, 3.061382, 0.5960785, 0, 1, 1,
0.6983248, -0.8780167, 2.333426, 0.6039216, 0, 1, 1,
0.7012803, -0.1469714, 3.299443, 0.6078432, 0, 1, 1,
0.7014548, 0.5729044, 0.4422569, 0.6156863, 0, 1, 1,
0.7014717, -2.165295, 1.823516, 0.6196079, 0, 1, 1,
0.7121097, 0.398771, 0.8413975, 0.627451, 0, 1, 1,
0.7164389, 0.2249249, 1.04678, 0.6313726, 0, 1, 1,
0.7171856, -0.4961394, 1.457692, 0.6392157, 0, 1, 1,
0.7180069, -0.2150812, 1.660149, 0.6431373, 0, 1, 1,
0.7200987, -1.738424, 3.502713, 0.6509804, 0, 1, 1,
0.725177, 0.8418631, 0.8180702, 0.654902, 0, 1, 1,
0.7289013, 0.8049085, -1.257876, 0.6627451, 0, 1, 1,
0.7321849, 0.09824674, 1.143551, 0.6666667, 0, 1, 1,
0.7323052, 0.4199979, 0.9507135, 0.6745098, 0, 1, 1,
0.7340291, -0.6643663, 2.511738, 0.6784314, 0, 1, 1,
0.7407168, 0.3650735, 2.076228, 0.6862745, 0, 1, 1,
0.7471511, 0.7564526, 0.252197, 0.6901961, 0, 1, 1,
0.7477455, 1.698064, 2.005239, 0.6980392, 0, 1, 1,
0.7507958, -1.663207, 2.182537, 0.7058824, 0, 1, 1,
0.7613239, -0.8166037, 2.041946, 0.7098039, 0, 1, 1,
0.7624745, 1.522926, -0.178296, 0.7176471, 0, 1, 1,
0.7632042, 0.358422, 0.8017821, 0.7215686, 0, 1, 1,
0.7722592, -0.8268952, 2.050802, 0.7294118, 0, 1, 1,
0.7745172, 0.1328426, 0.03107034, 0.7333333, 0, 1, 1,
0.7759007, 1.236904, 0.6369076, 0.7411765, 0, 1, 1,
0.7811444, -2.0638, 2.61376, 0.7450981, 0, 1, 1,
0.7976031, 0.4201174, 2.173282, 0.7529412, 0, 1, 1,
0.7985501, 0.6569715, -0.1164276, 0.7568628, 0, 1, 1,
0.8004903, 0.9822422, 0.2067747, 0.7647059, 0, 1, 1,
0.8022022, 0.7860395, 1.115552, 0.7686275, 0, 1, 1,
0.8032959, 0.1810729, 1.863994, 0.7764706, 0, 1, 1,
0.8079607, -0.1557792, 0.117619, 0.7803922, 0, 1, 1,
0.8082903, 0.1343664, 1.756212, 0.7882353, 0, 1, 1,
0.8085263, -1.204816, 2.125955, 0.7921569, 0, 1, 1,
0.809068, -0.3994257, 1.982131, 0.8, 0, 1, 1,
0.8120822, -0.1639446, 1.141165, 0.8078431, 0, 1, 1,
0.814062, -1.803032, 3.693167, 0.8117647, 0, 1, 1,
0.8158476, -0.9784567, 1.52534, 0.8196079, 0, 1, 1,
0.8179086, 0.8464741, 0.5808252, 0.8235294, 0, 1, 1,
0.8193828, 0.3015011, -0.9817564, 0.8313726, 0, 1, 1,
0.8249027, 1.246002, 1.488735, 0.8352941, 0, 1, 1,
0.8266278, -1.36569, 3.117178, 0.8431373, 0, 1, 1,
0.829468, -0.6115791, 2.251745, 0.8470588, 0, 1, 1,
0.8332688, -1.46286, 1.69937, 0.854902, 0, 1, 1,
0.8349621, 0.4689187, 1.666096, 0.8588235, 0, 1, 1,
0.8352005, 1.277297, 1.442307, 0.8666667, 0, 1, 1,
0.8397079, -0.02697854, 2.073174, 0.8705882, 0, 1, 1,
0.8410948, 0.1220999, 0.3763979, 0.8784314, 0, 1, 1,
0.8434134, -0.4671841, 0.3890149, 0.8823529, 0, 1, 1,
0.845054, -0.4855744, 4.185966, 0.8901961, 0, 1, 1,
0.8463464, 0.009185396, 0.6376597, 0.8941177, 0, 1, 1,
0.8469337, -0.05996556, 1.989284, 0.9019608, 0, 1, 1,
0.8474661, 0.3033743, 1.031761, 0.9098039, 0, 1, 1,
0.8625092, 1.934863, -0.6205054, 0.9137255, 0, 1, 1,
0.8636194, -0.9132684, 2.458584, 0.9215686, 0, 1, 1,
0.880079, 0.108487, 0.9559844, 0.9254902, 0, 1, 1,
0.9065528, 0.9316428, 1.83172, 0.9333333, 0, 1, 1,
0.9108757, 0.5003489, 1.169538, 0.9372549, 0, 1, 1,
0.9173734, -1.823541, 3.224433, 0.945098, 0, 1, 1,
0.9175205, 0.3962266, 0.6191915, 0.9490196, 0, 1, 1,
0.9305944, 1.37525, -0.3508284, 0.9568627, 0, 1, 1,
0.93393, 0.02170921, 1.190935, 0.9607843, 0, 1, 1,
0.9340469, 0.532514, 1.02249, 0.9686275, 0, 1, 1,
0.9401559, -1.377238, 0.9174368, 0.972549, 0, 1, 1,
0.9461188, 0.05065211, 2.278306, 0.9803922, 0, 1, 1,
0.9470156, 0.5668114, 0.8322645, 0.9843137, 0, 1, 1,
0.9515001, -0.20312, 0.8035768, 0.9921569, 0, 1, 1,
0.951979, 0.03067717, 0.1425603, 0.9960784, 0, 1, 1,
0.9551216, 0.8202794, 0.3316229, 1, 0, 0.9960784, 1,
0.9556549, -1.292914, 4.208402, 1, 0, 0.9882353, 1,
0.9569854, 0.252727, 1.342758, 1, 0, 0.9843137, 1,
0.9647571, -0.4911481, 3.008561, 1, 0, 0.9764706, 1,
0.9668908, 0.6097844, 3.005808, 1, 0, 0.972549, 1,
0.9740806, 0.1425619, 1.420352, 1, 0, 0.9647059, 1,
0.981635, -0.6791734, 1.601146, 1, 0, 0.9607843, 1,
0.9832187, -1.26661, 2.841529, 1, 0, 0.9529412, 1,
0.9852608, -0.5484497, 1.67749, 1, 0, 0.9490196, 1,
0.9853316, 0.7996623, 2.068193, 1, 0, 0.9411765, 1,
0.989535, -0.7545347, 1.894918, 1, 0, 0.9372549, 1,
0.9921975, -0.5735357, 3.26133, 1, 0, 0.9294118, 1,
0.9944196, -0.4034266, 0.8974015, 1, 0, 0.9254902, 1,
0.9964457, -0.3763672, 3.118522, 1, 0, 0.9176471, 1,
1.006035, -0.4310661, 1.95105, 1, 0, 0.9137255, 1,
1.006249, -0.3307936, 3.876928, 1, 0, 0.9058824, 1,
1.007179, 0.04115266, 1.982988, 1, 0, 0.9019608, 1,
1.008757, -1.020915, 4.271963, 1, 0, 0.8941177, 1,
1.009966, -1.860152, 0.8084929, 1, 0, 0.8862745, 1,
1.014088, -0.4785288, 1.763147, 1, 0, 0.8823529, 1,
1.021843, 2.529809, 0.9060671, 1, 0, 0.8745098, 1,
1.024024, -0.2663693, 1.232082, 1, 0, 0.8705882, 1,
1.034949, 1.679571, 0.986567, 1, 0, 0.8627451, 1,
1.041982, 0.1245177, 0.2317508, 1, 0, 0.8588235, 1,
1.042193, 0.2282386, 2.961945, 1, 0, 0.8509804, 1,
1.043278, 2.078795, 2.740886, 1, 0, 0.8470588, 1,
1.061834, 0.6470304, -0.1962548, 1, 0, 0.8392157, 1,
1.063516, 1.132294, -0.3185652, 1, 0, 0.8352941, 1,
1.066718, -0.3598609, 2.862615, 1, 0, 0.827451, 1,
1.067873, -1.183183, 4.117869, 1, 0, 0.8235294, 1,
1.069885, 0.7118859, 0.009655136, 1, 0, 0.8156863, 1,
1.072915, -0.06036989, 1.878651, 1, 0, 0.8117647, 1,
1.074725, 2.326589, 2.230507, 1, 0, 0.8039216, 1,
1.078043, -0.6416491, 2.338259, 1, 0, 0.7960784, 1,
1.089857, 1.255793, 1.3472, 1, 0, 0.7921569, 1,
1.091478, -0.3517436, 1.112906, 1, 0, 0.7843137, 1,
1.095213, 1.100781, 0.6095521, 1, 0, 0.7803922, 1,
1.095913, -2.144727, 0.6997536, 1, 0, 0.772549, 1,
1.097216, 0.5022953, -0.5484674, 1, 0, 0.7686275, 1,
1.101839, -0.08550791, 1.069817, 1, 0, 0.7607843, 1,
1.105775, 0.1012585, 1.475231, 1, 0, 0.7568628, 1,
1.1084, 0.5983643, 2.047261, 1, 0, 0.7490196, 1,
1.109967, 0.7479038, 1.985447, 1, 0, 0.7450981, 1,
1.110267, 0.8892678, 2.108368, 1, 0, 0.7372549, 1,
1.110424, 0.9048362, 1.079516, 1, 0, 0.7333333, 1,
1.113303, -0.1527891, 3.058751, 1, 0, 0.7254902, 1,
1.116438, 0.2351375, 2.29637, 1, 0, 0.7215686, 1,
1.12292, 0.4574683, 0.02576364, 1, 0, 0.7137255, 1,
1.126131, -0.4998916, 3.245895, 1, 0, 0.7098039, 1,
1.130498, 0.03848483, 0.7118639, 1, 0, 0.7019608, 1,
1.139671, -1.267533, 1.954245, 1, 0, 0.6941177, 1,
1.141942, 1.110021, 0.03861044, 1, 0, 0.6901961, 1,
1.144341, 0.2968414, 2.470513, 1, 0, 0.682353, 1,
1.144868, 0.8168271, -0.2136092, 1, 0, 0.6784314, 1,
1.15064, 1.669452, -0.3734345, 1, 0, 0.6705883, 1,
1.15194, 1.096069, 1.576601, 1, 0, 0.6666667, 1,
1.156726, -0.6307269, 3.113697, 1, 0, 0.6588235, 1,
1.15765, -0.3817632, 1.41539, 1, 0, 0.654902, 1,
1.159103, 0.4783875, -0.481261, 1, 0, 0.6470588, 1,
1.160175, 0.6889578, 2.032214, 1, 0, 0.6431373, 1,
1.164781, -3.208259, 1.166243, 1, 0, 0.6352941, 1,
1.168702, 0.5043892, 1.166921, 1, 0, 0.6313726, 1,
1.169384, -0.2843539, 2.035838, 1, 0, 0.6235294, 1,
1.176464, 0.799531, -0.3496204, 1, 0, 0.6196079, 1,
1.182477, -1.356378, 1.879884, 1, 0, 0.6117647, 1,
1.19017, -0.02089479, 2.01615, 1, 0, 0.6078432, 1,
1.20688, 0.6231961, 0.07119366, 1, 0, 0.6, 1,
1.207533, 0.4632311, 0.9000401, 1, 0, 0.5921569, 1,
1.209833, 1.387251, -1.386407, 1, 0, 0.5882353, 1,
1.212753, 1.102528, 0.7633454, 1, 0, 0.5803922, 1,
1.213975, -0.4815499, 2.367646, 1, 0, 0.5764706, 1,
1.214282, 1.000281, 1.477579, 1, 0, 0.5686275, 1,
1.214964, -0.2216629, 3.093831, 1, 0, 0.5647059, 1,
1.228747, -0.2919986, 4.31735, 1, 0, 0.5568628, 1,
1.233009, 1.742697, 0.6933361, 1, 0, 0.5529412, 1,
1.236066, 1.302679, -0.1009076, 1, 0, 0.5450981, 1,
1.239048, -0.9031254, 1.348687, 1, 0, 0.5411765, 1,
1.239274, 0.2205291, 1.803903, 1, 0, 0.5333334, 1,
1.244454, -1.686287, 2.30769, 1, 0, 0.5294118, 1,
1.245578, -0.794548, 3.33186, 1, 0, 0.5215687, 1,
1.250676, -1.541479, 1.685911, 1, 0, 0.5176471, 1,
1.263546, -0.4729201, 3.147047, 1, 0, 0.509804, 1,
1.268695, -0.03826334, 2.243017, 1, 0, 0.5058824, 1,
1.271624, 0.7038851, 0.2697815, 1, 0, 0.4980392, 1,
1.278134, -0.746273, 0.6198864, 1, 0, 0.4901961, 1,
1.290975, -1.168994, 0.5641449, 1, 0, 0.4862745, 1,
1.293182, 1.475616, 0.008528868, 1, 0, 0.4784314, 1,
1.295144, -0.865599, 0.976959, 1, 0, 0.4745098, 1,
1.297164, -1.389917, 1.731649, 1, 0, 0.4666667, 1,
1.297562, 0.7608793, 1.213056, 1, 0, 0.4627451, 1,
1.301455, -1.186395, 2.107095, 1, 0, 0.454902, 1,
1.321165, 0.682302, 1.88356, 1, 0, 0.4509804, 1,
1.321689, 0.4259638, 0.7609453, 1, 0, 0.4431373, 1,
1.321805, 1.217852, 0.6970059, 1, 0, 0.4392157, 1,
1.325043, -0.6272703, 1.674387, 1, 0, 0.4313726, 1,
1.330421, -0.5423949, 1.958183, 1, 0, 0.427451, 1,
1.334401, -1.060919, 2.479268, 1, 0, 0.4196078, 1,
1.341463, -0.3374762, 2.991504, 1, 0, 0.4156863, 1,
1.354294, -0.623247, 1.037305, 1, 0, 0.4078431, 1,
1.370497, 1.051152, 0.2479302, 1, 0, 0.4039216, 1,
1.372827, 0.6920203, 2.575317, 1, 0, 0.3960784, 1,
1.374692, -0.0129101, 2.463624, 1, 0, 0.3882353, 1,
1.37603, 1.280893, 0.3346816, 1, 0, 0.3843137, 1,
1.398019, -0.3067471, 2.040771, 1, 0, 0.3764706, 1,
1.400845, -1.127496, 3.365968, 1, 0, 0.372549, 1,
1.406176, 1.241157, 0.3584658, 1, 0, 0.3647059, 1,
1.424068, 0.7648355, 1.090164, 1, 0, 0.3607843, 1,
1.441743, -0.2973613, 0.7606121, 1, 0, 0.3529412, 1,
1.458466, 0.2340227, 3.516749, 1, 0, 0.3490196, 1,
1.48778, 0.4326955, 2.20949, 1, 0, 0.3411765, 1,
1.489449, 1.061092, 1.565272, 1, 0, 0.3372549, 1,
1.51451, -0.3374996, 1.235836, 1, 0, 0.3294118, 1,
1.517823, 0.5150259, 1.215093, 1, 0, 0.3254902, 1,
1.529203, -0.4390084, 4.184142, 1, 0, 0.3176471, 1,
1.541293, 1.252298, 0.1772761, 1, 0, 0.3137255, 1,
1.555298, 0.09343835, 1.687882, 1, 0, 0.3058824, 1,
1.559685, 1.091407, 3.006324, 1, 0, 0.2980392, 1,
1.582674, -1.075114, 2.884527, 1, 0, 0.2941177, 1,
1.587668, -1.382563, 1.01135, 1, 0, 0.2862745, 1,
1.587912, -0.1472535, 1.124729, 1, 0, 0.282353, 1,
1.592289, 1.113941, 0.3604941, 1, 0, 0.2745098, 1,
1.605647, -0.9200009, 5.633856, 1, 0, 0.2705882, 1,
1.621966, 0.5093101, 0.4734871, 1, 0, 0.2627451, 1,
1.678166, -0.445582, 2.232779, 1, 0, 0.2588235, 1,
1.686039, 0.04885093, 2.109092, 1, 0, 0.2509804, 1,
1.690233, -1.20417, 2.221781, 1, 0, 0.2470588, 1,
1.70405, 1.961247, 1.861242, 1, 0, 0.2392157, 1,
1.708176, 0.3297597, 0.7412474, 1, 0, 0.2352941, 1,
1.711144, -0.04432668, 1.40231, 1, 0, 0.227451, 1,
1.721308, 0.5049908, 0.2626417, 1, 0, 0.2235294, 1,
1.728535, 0.8809233, 0.8666112, 1, 0, 0.2156863, 1,
1.731028, -1.487589, 3.953262, 1, 0, 0.2117647, 1,
1.753796, -1.012214, 2.157076, 1, 0, 0.2039216, 1,
1.761772, -2.237232, 1.8228, 1, 0, 0.1960784, 1,
1.764839, -1.168775, 0.8117466, 1, 0, 0.1921569, 1,
1.78819, 1.069653, 2.075662, 1, 0, 0.1843137, 1,
1.791012, -0.3801444, 2.589899, 1, 0, 0.1803922, 1,
1.807702, 0.07468905, 2.302618, 1, 0, 0.172549, 1,
1.811365, 1.307533, 1.307151, 1, 0, 0.1686275, 1,
1.82165, 0.8865767, 3.230037, 1, 0, 0.1607843, 1,
1.829842, -0.282418, 2.814628, 1, 0, 0.1568628, 1,
1.835408, -0.3176347, 0.7637688, 1, 0, 0.1490196, 1,
1.838141, 0.8722719, 1.008654, 1, 0, 0.145098, 1,
1.928039, 0.3436835, 0.7756909, 1, 0, 0.1372549, 1,
1.952178, 1.124483, 2.971243, 1, 0, 0.1333333, 1,
1.99438, 1.248069, 0.4984301, 1, 0, 0.1254902, 1,
2.010397, 0.2124213, 0.5195169, 1, 0, 0.1215686, 1,
2.037612, 0.6549025, -0.535543, 1, 0, 0.1137255, 1,
2.064315, -0.09140929, 2.077078, 1, 0, 0.1098039, 1,
2.09806, -0.3746545, 2.743895, 1, 0, 0.1019608, 1,
2.123126, 0.03495893, 2.787731, 1, 0, 0.09411765, 1,
2.175687, -0.2225555, 0.7949243, 1, 0, 0.09019608, 1,
2.183859, -0.1453532, 0.9902773, 1, 0, 0.08235294, 1,
2.195426, 0.6339532, -0.1118971, 1, 0, 0.07843138, 1,
2.202316, 0.7311934, 1.818294, 1, 0, 0.07058824, 1,
2.20906, -0.7779145, 2.552958, 1, 0, 0.06666667, 1,
2.210402, 0.01567386, 3.162339, 1, 0, 0.05882353, 1,
2.223851, 0.847317, 2.428666, 1, 0, 0.05490196, 1,
2.226906, 0.6107469, 1.727867, 1, 0, 0.04705882, 1,
2.308288, 0.8244093, 1.943776, 1, 0, 0.04313726, 1,
2.31069, -0.3615904, 2.549048, 1, 0, 0.03529412, 1,
2.357422, 0.2343801, 1.69413, 1, 0, 0.03137255, 1,
2.47023, 2.413677, 0.3910905, 1, 0, 0.02352941, 1,
2.682332, 1.189583, 2.657831, 1, 0, 0.01960784, 1,
2.789997, 0.4273223, 2.451483, 1, 0, 0.01176471, 1,
2.845989, -1.177306, 0.2855113, 1, 0, 0.007843138, 1
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
-0.1161505, -4.340015, -7.127429, 0, -0.5, 0.5, 0.5,
-0.1161505, -4.340015, -7.127429, 1, -0.5, 0.5, 0.5,
-0.1161505, -4.340015, -7.127429, 1, 1.5, 0.5, 0.5,
-0.1161505, -4.340015, -7.127429, 0, 1.5, 0.5, 0.5
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
-4.082455, 0.1302534, -7.127429, 0, -0.5, 0.5, 0.5,
-4.082455, 0.1302534, -7.127429, 1, -0.5, 0.5, 0.5,
-4.082455, 0.1302534, -7.127429, 1, 1.5, 0.5, 0.5,
-4.082455, 0.1302534, -7.127429, 0, 1.5, 0.5, 0.5
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
-4.082455, -4.340015, 0.3460631, 0, -0.5, 0.5, 0.5,
-4.082455, -4.340015, 0.3460631, 1, -0.5, 0.5, 0.5,
-4.082455, -4.340015, 0.3460631, 1, 1.5, 0.5, 0.5,
-4.082455, -4.340015, 0.3460631, 0, 1.5, 0.5, 0.5
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
-3, -3.308414, -5.402777,
2, -3.308414, -5.402777,
-3, -3.308414, -5.402777,
-3, -3.480348, -5.690219,
-2, -3.308414, -5.402777,
-2, -3.480348, -5.690219,
-1, -3.308414, -5.402777,
-1, -3.480348, -5.690219,
0, -3.308414, -5.402777,
0, -3.480348, -5.690219,
1, -3.308414, -5.402777,
1, -3.480348, -5.690219,
2, -3.308414, -5.402777,
2, -3.480348, -5.690219
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
-3, -3.824215, -6.265103, 0, -0.5, 0.5, 0.5,
-3, -3.824215, -6.265103, 1, -0.5, 0.5, 0.5,
-3, -3.824215, -6.265103, 1, 1.5, 0.5, 0.5,
-3, -3.824215, -6.265103, 0, 1.5, 0.5, 0.5,
-2, -3.824215, -6.265103, 0, -0.5, 0.5, 0.5,
-2, -3.824215, -6.265103, 1, -0.5, 0.5, 0.5,
-2, -3.824215, -6.265103, 1, 1.5, 0.5, 0.5,
-2, -3.824215, -6.265103, 0, 1.5, 0.5, 0.5,
-1, -3.824215, -6.265103, 0, -0.5, 0.5, 0.5,
-1, -3.824215, -6.265103, 1, -0.5, 0.5, 0.5,
-1, -3.824215, -6.265103, 1, 1.5, 0.5, 0.5,
-1, -3.824215, -6.265103, 0, 1.5, 0.5, 0.5,
0, -3.824215, -6.265103, 0, -0.5, 0.5, 0.5,
0, -3.824215, -6.265103, 1, -0.5, 0.5, 0.5,
0, -3.824215, -6.265103, 1, 1.5, 0.5, 0.5,
0, -3.824215, -6.265103, 0, 1.5, 0.5, 0.5,
1, -3.824215, -6.265103, 0, -0.5, 0.5, 0.5,
1, -3.824215, -6.265103, 1, -0.5, 0.5, 0.5,
1, -3.824215, -6.265103, 1, 1.5, 0.5, 0.5,
1, -3.824215, -6.265103, 0, 1.5, 0.5, 0.5,
2, -3.824215, -6.265103, 0, -0.5, 0.5, 0.5,
2, -3.824215, -6.265103, 1, -0.5, 0.5, 0.5,
2, -3.824215, -6.265103, 1, 1.5, 0.5, 0.5,
2, -3.824215, -6.265103, 0, 1.5, 0.5, 0.5
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
-3.167154, -3, -5.402777,
-3.167154, 3, -5.402777,
-3.167154, -3, -5.402777,
-3.319704, -3, -5.690219,
-3.167154, -2, -5.402777,
-3.319704, -2, -5.690219,
-3.167154, -1, -5.402777,
-3.319704, -1, -5.690219,
-3.167154, 0, -5.402777,
-3.319704, 0, -5.690219,
-3.167154, 1, -5.402777,
-3.319704, 1, -5.690219,
-3.167154, 2, -5.402777,
-3.319704, 2, -5.690219,
-3.167154, 3, -5.402777,
-3.319704, 3, -5.690219
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
-3.624804, -3, -6.265103, 0, -0.5, 0.5, 0.5,
-3.624804, -3, -6.265103, 1, -0.5, 0.5, 0.5,
-3.624804, -3, -6.265103, 1, 1.5, 0.5, 0.5,
-3.624804, -3, -6.265103, 0, 1.5, 0.5, 0.5,
-3.624804, -2, -6.265103, 0, -0.5, 0.5, 0.5,
-3.624804, -2, -6.265103, 1, -0.5, 0.5, 0.5,
-3.624804, -2, -6.265103, 1, 1.5, 0.5, 0.5,
-3.624804, -2, -6.265103, 0, 1.5, 0.5, 0.5,
-3.624804, -1, -6.265103, 0, -0.5, 0.5, 0.5,
-3.624804, -1, -6.265103, 1, -0.5, 0.5, 0.5,
-3.624804, -1, -6.265103, 1, 1.5, 0.5, 0.5,
-3.624804, -1, -6.265103, 0, 1.5, 0.5, 0.5,
-3.624804, 0, -6.265103, 0, -0.5, 0.5, 0.5,
-3.624804, 0, -6.265103, 1, -0.5, 0.5, 0.5,
-3.624804, 0, -6.265103, 1, 1.5, 0.5, 0.5,
-3.624804, 0, -6.265103, 0, 1.5, 0.5, 0.5,
-3.624804, 1, -6.265103, 0, -0.5, 0.5, 0.5,
-3.624804, 1, -6.265103, 1, -0.5, 0.5, 0.5,
-3.624804, 1, -6.265103, 1, 1.5, 0.5, 0.5,
-3.624804, 1, -6.265103, 0, 1.5, 0.5, 0.5,
-3.624804, 2, -6.265103, 0, -0.5, 0.5, 0.5,
-3.624804, 2, -6.265103, 1, -0.5, 0.5, 0.5,
-3.624804, 2, -6.265103, 1, 1.5, 0.5, 0.5,
-3.624804, 2, -6.265103, 0, 1.5, 0.5, 0.5,
-3.624804, 3, -6.265103, 0, -0.5, 0.5, 0.5,
-3.624804, 3, -6.265103, 1, -0.5, 0.5, 0.5,
-3.624804, 3, -6.265103, 1, 1.5, 0.5, 0.5,
-3.624804, 3, -6.265103, 0, 1.5, 0.5, 0.5
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
-3.167154, -3.308414, -4,
-3.167154, -3.308414, 4,
-3.167154, -3.308414, -4,
-3.319704, -3.480348, -4,
-3.167154, -3.308414, -2,
-3.319704, -3.480348, -2,
-3.167154, -3.308414, 0,
-3.319704, -3.480348, 0,
-3.167154, -3.308414, 2,
-3.319704, -3.480348, 2,
-3.167154, -3.308414, 4,
-3.319704, -3.480348, 4
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
-3.624804, -3.824215, -4, 0, -0.5, 0.5, 0.5,
-3.624804, -3.824215, -4, 1, -0.5, 0.5, 0.5,
-3.624804, -3.824215, -4, 1, 1.5, 0.5, 0.5,
-3.624804, -3.824215, -4, 0, 1.5, 0.5, 0.5,
-3.624804, -3.824215, -2, 0, -0.5, 0.5, 0.5,
-3.624804, -3.824215, -2, 1, -0.5, 0.5, 0.5,
-3.624804, -3.824215, -2, 1, 1.5, 0.5, 0.5,
-3.624804, -3.824215, -2, 0, 1.5, 0.5, 0.5,
-3.624804, -3.824215, 0, 0, -0.5, 0.5, 0.5,
-3.624804, -3.824215, 0, 1, -0.5, 0.5, 0.5,
-3.624804, -3.824215, 0, 1, 1.5, 0.5, 0.5,
-3.624804, -3.824215, 0, 0, 1.5, 0.5, 0.5,
-3.624804, -3.824215, 2, 0, -0.5, 0.5, 0.5,
-3.624804, -3.824215, 2, 1, -0.5, 0.5, 0.5,
-3.624804, -3.824215, 2, 1, 1.5, 0.5, 0.5,
-3.624804, -3.824215, 2, 0, 1.5, 0.5, 0.5,
-3.624804, -3.824215, 4, 0, -0.5, 0.5, 0.5,
-3.624804, -3.824215, 4, 1, -0.5, 0.5, 0.5,
-3.624804, -3.824215, 4, 1, 1.5, 0.5, 0.5,
-3.624804, -3.824215, 4, 0, 1.5, 0.5, 0.5
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
-3.167154, -3.308414, -5.402777,
-3.167154, 3.568921, -5.402777,
-3.167154, -3.308414, 6.094903,
-3.167154, 3.568921, 6.094903,
-3.167154, -3.308414, -5.402777,
-3.167154, -3.308414, 6.094903,
-3.167154, 3.568921, -5.402777,
-3.167154, 3.568921, 6.094903,
-3.167154, -3.308414, -5.402777,
2.934853, -3.308414, -5.402777,
-3.167154, -3.308414, 6.094903,
2.934853, -3.308414, 6.094903,
-3.167154, 3.568921, -5.402777,
2.934853, 3.568921, -5.402777,
-3.167154, 3.568921, 6.094903,
2.934853, 3.568921, 6.094903,
2.934853, -3.308414, -5.402777,
2.934853, 3.568921, -5.402777,
2.934853, -3.308414, 6.094903,
2.934853, 3.568921, 6.094903,
2.934853, -3.308414, -5.402777,
2.934853, -3.308414, 6.094903,
2.934853, 3.568921, -5.402777,
2.934853, 3.568921, 6.094903
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
var radius = 7.86111;
var distance = 34.97496;
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
mvMatrix.translate( 0.1161505, -0.1302534, -0.3460631 );
mvMatrix.scale( 1.392917, 1.235883, 0.7392436 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.97496);
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
Isobutane<-read.table("Isobutane.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Isobutane$V2
```

```
## Error in eval(expr, envir, enclos): object 'Isobutane' not found
```

```r
y<-Isobutane$V3
```

```
## Error in eval(expr, envir, enclos): object 'Isobutane' not found
```

```r
z<-Isobutane$V4
```

```
## Error in eval(expr, envir, enclos): object 'Isobutane' not found
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
-3.07829, 1.908464, -1.952567, 0, 0, 1, 1, 1,
-3.004717, 2.308373, -2.503849, 1, 0, 0, 1, 1,
-2.803929, 1.010023, -0.8720467, 1, 0, 0, 1, 1,
-2.676082, 0.7075847, 0.1283411, 1, 0, 0, 1, 1,
-2.548602, -0.2025687, -0.563143, 1, 0, 0, 1, 1,
-2.517107, -0.4612065, -2.30082, 1, 0, 0, 1, 1,
-2.515953, 1.224759, -0.902114, 0, 0, 0, 1, 1,
-2.487864, -0.006796632, -1.948868, 0, 0, 0, 1, 1,
-2.445884, -1.695305, -0.7745044, 0, 0, 0, 1, 1,
-2.429402, 0.69469, -0.1690993, 0, 0, 0, 1, 1,
-2.426648, 1.067033, -1.332966, 0, 0, 0, 1, 1,
-2.404676, -2.758212, -1.810888, 0, 0, 0, 1, 1,
-2.388287, -0.5000504, -1.824526, 0, 0, 0, 1, 1,
-2.377704, -1.17603, -0.8338214, 1, 1, 1, 1, 1,
-2.327433, 1.457771, 0.007273876, 1, 1, 1, 1, 1,
-2.326431, -0.7945191, -1.904837, 1, 1, 1, 1, 1,
-2.267623, 2.735121, -0.8551222, 1, 1, 1, 1, 1,
-2.221416, -0.1667875, -2.555255, 1, 1, 1, 1, 1,
-2.182482, -0.9623929, -2.197749, 1, 1, 1, 1, 1,
-2.168539, -0.5356863, -0.689034, 1, 1, 1, 1, 1,
-2.123571, -0.8407531, -2.092774, 1, 1, 1, 1, 1,
-2.101934, -1.77732, -2.202498, 1, 1, 1, 1, 1,
-2.096313, 0.9106559, 0.3576943, 1, 1, 1, 1, 1,
-2.063944, -1.098803, -2.272682, 1, 1, 1, 1, 1,
-2.010023, 0.4424199, -0.476434, 1, 1, 1, 1, 1,
-1.987248, 0.7722595, -0.9610204, 1, 1, 1, 1, 1,
-1.982502, 0.2141687, -2.780668, 1, 1, 1, 1, 1,
-1.967368, -0.4369219, -1.069601, 1, 1, 1, 1, 1,
-1.960878, 0.348232, -0.8685273, 0, 0, 1, 1, 1,
-1.947749, 0.561042, 0.2031958, 1, 0, 0, 1, 1,
-1.911825, 1.723628, -1.296466, 1, 0, 0, 1, 1,
-1.888112, 0.7990464, -3.099602, 1, 0, 0, 1, 1,
-1.872522, 1.317749, -0.1136181, 1, 0, 0, 1, 1,
-1.871486, -0.1357977, -0.1656658, 1, 0, 0, 1, 1,
-1.870625, 0.3069212, -0.0199164, 0, 0, 0, 1, 1,
-1.849426, 0.2007966, -2.667308, 0, 0, 0, 1, 1,
-1.843108, 0.6583167, -0.9018251, 0, 0, 0, 1, 1,
-1.842949, -0.1650058, -0.9416884, 0, 0, 0, 1, 1,
-1.803414, -0.9136056, -0.5200689, 0, 0, 0, 1, 1,
-1.791823, 1.091604, -0.9818226, 0, 0, 0, 1, 1,
-1.786241, -0.1437861, -2.205741, 0, 0, 0, 1, 1,
-1.781178, 0.6201406, -0.2682264, 1, 1, 1, 1, 1,
-1.774958, -1.117147, -2.829468, 1, 1, 1, 1, 1,
-1.767981, 1.848274, -2.063354, 1, 1, 1, 1, 1,
-1.754629, -1.09936, -3.234288, 1, 1, 1, 1, 1,
-1.753668, 0.1553156, -0.3669328, 1, 1, 1, 1, 1,
-1.749514, 0.5222611, -1.491807, 1, 1, 1, 1, 1,
-1.738133, -0.4053679, -1.833962, 1, 1, 1, 1, 1,
-1.737346, 0.3575495, -1.758129, 1, 1, 1, 1, 1,
-1.734311, -0.1120631, -3.83684, 1, 1, 1, 1, 1,
-1.730958, -0.06387892, -1.269461, 1, 1, 1, 1, 1,
-1.70738, -0.01093382, 0.1730555, 1, 1, 1, 1, 1,
-1.682905, 0.362257, -2.549718, 1, 1, 1, 1, 1,
-1.680424, 0.517369, -2.74849, 1, 1, 1, 1, 1,
-1.67643, 0.7777244, -0.03110602, 1, 1, 1, 1, 1,
-1.672344, -0.3243486, -2.12724, 1, 1, 1, 1, 1,
-1.659971, -0.896522, -1.220743, 0, 0, 1, 1, 1,
-1.657972, -0.2701071, -1.529837, 1, 0, 0, 1, 1,
-1.63549, -1.335047, -3.644315, 1, 0, 0, 1, 1,
-1.63528, 0.07396266, -0.9465263, 1, 0, 0, 1, 1,
-1.626418, -0.6983497, -1.094264, 1, 0, 0, 1, 1,
-1.623197, -0.3839565, -1.312893, 1, 0, 0, 1, 1,
-1.608172, -1.033954, -1.927759, 0, 0, 0, 1, 1,
-1.591309, 0.9239872, -0.5219828, 0, 0, 0, 1, 1,
-1.581658, -0.484826, -1.785558, 0, 0, 0, 1, 1,
-1.569414, -0.1406652, -1.948104, 0, 0, 0, 1, 1,
-1.56527, 0.05429723, -1.47647, 0, 0, 0, 1, 1,
-1.55024, -0.1676168, -1.125905, 0, 0, 0, 1, 1,
-1.528998, 1.040222, -1.427667, 0, 0, 0, 1, 1,
-1.523662, 0.2691557, -1.882744, 1, 1, 1, 1, 1,
-1.513603, -0.8063262, 0.3536222, 1, 1, 1, 1, 1,
-1.513128, 0.1489004, -0.8234481, 1, 1, 1, 1, 1,
-1.508743, -2.078524, -3.05989, 1, 1, 1, 1, 1,
-1.505579, 1.042309, -0.7252876, 1, 1, 1, 1, 1,
-1.497856, -1.326824, -2.901868, 1, 1, 1, 1, 1,
-1.493398, 0.5452607, -0.1037611, 1, 1, 1, 1, 1,
-1.482913, 0.2249671, -0.9386361, 1, 1, 1, 1, 1,
-1.472203, 0.008844053, -1.389799, 1, 1, 1, 1, 1,
-1.46824, 1.271197, -0.9589993, 1, 1, 1, 1, 1,
-1.468097, 0.942068, -1.00262, 1, 1, 1, 1, 1,
-1.461474, 1.085541, -1.404724, 1, 1, 1, 1, 1,
-1.45271, -0.4274289, -2.055691, 1, 1, 1, 1, 1,
-1.438351, 0.8571352, -1.918519, 1, 1, 1, 1, 1,
-1.431162, -0.5461704, -1.867024, 1, 1, 1, 1, 1,
-1.430721, -1.855897, -2.661748, 0, 0, 1, 1, 1,
-1.430063, 0.6431579, -0.866828, 1, 0, 0, 1, 1,
-1.414561, 0.2876581, -1.57, 1, 0, 0, 1, 1,
-1.407598, -0.7662391, -1.404236, 1, 0, 0, 1, 1,
-1.401997, 0.289638, -0.5313668, 1, 0, 0, 1, 1,
-1.399232, -0.1113056, -0.9324428, 1, 0, 0, 1, 1,
-1.39827, -0.7563547, -2.332836, 0, 0, 0, 1, 1,
-1.387866, -1.017324, -2.005105, 0, 0, 0, 1, 1,
-1.381883, -1.184909, -3.505563, 0, 0, 0, 1, 1,
-1.375376, 0.03768004, -1.221468, 0, 0, 0, 1, 1,
-1.372422, -0.01306149, -2.084619, 0, 0, 0, 1, 1,
-1.364626, 0.1996413, -1.894012, 0, 0, 0, 1, 1,
-1.35937, -0.986777, -1.003746, 0, 0, 0, 1, 1,
-1.352222, -0.9422845, -3.499649, 1, 1, 1, 1, 1,
-1.3495, 1.607687, -1.019461, 1, 1, 1, 1, 1,
-1.342477, -0.4118863, -3.056666, 1, 1, 1, 1, 1,
-1.338632, 1.682334, -1.11125, 1, 1, 1, 1, 1,
-1.338491, 1.119654, -1.351554, 1, 1, 1, 1, 1,
-1.322666, 0.6380228, -1.308537, 1, 1, 1, 1, 1,
-1.311348, -0.9764574, -2.625785, 1, 1, 1, 1, 1,
-1.311263, -0.6611236, -1.330011, 1, 1, 1, 1, 1,
-1.303844, 0.09121069, -0.7293361, 1, 1, 1, 1, 1,
-1.301915, -0.6482987, -4.409954, 1, 1, 1, 1, 1,
-1.292968, 0.7578782, -0.7839494, 1, 1, 1, 1, 1,
-1.290959, -0.08241843, 0.06399006, 1, 1, 1, 1, 1,
-1.287526, -0.6671943, -1.303444, 1, 1, 1, 1, 1,
-1.287407, 0.4161004, -0.945044, 1, 1, 1, 1, 1,
-1.283837, 0.7360351, -1.904852, 1, 1, 1, 1, 1,
-1.277028, 0.7903576, -3.326542, 0, 0, 1, 1, 1,
-1.272843, -1.781625, -2.23196, 1, 0, 0, 1, 1,
-1.272548, 0.1974823, 0.6532218, 1, 0, 0, 1, 1,
-1.261814, 0.2903615, -0.8462934, 1, 0, 0, 1, 1,
-1.249417, -0.08769254, -0.407435, 1, 0, 0, 1, 1,
-1.23795, 0.4972408, -0.4686814, 1, 0, 0, 1, 1,
-1.235026, -0.02460779, -1.059209, 0, 0, 0, 1, 1,
-1.224591, -1.482699, -1.917859, 0, 0, 0, 1, 1,
-1.223476, 1.132827, -2.016267, 0, 0, 0, 1, 1,
-1.22122, -0.5213965, -2.255235, 0, 0, 0, 1, 1,
-1.220397, -0.07488782, -1.228459, 0, 0, 0, 1, 1,
-1.219756, 0.03744316, -0.5652782, 0, 0, 0, 1, 1,
-1.202643, 1.472877, 1.458779, 0, 0, 0, 1, 1,
-1.201476, 1.567414, 0.2336186, 1, 1, 1, 1, 1,
-1.188936, 0.1384795, -1.69337, 1, 1, 1, 1, 1,
-1.182746, 0.001549614, -1.199536, 1, 1, 1, 1, 1,
-1.182413, -0.4504172, -1.805559, 1, 1, 1, 1, 1,
-1.173017, -0.2462365, -2.185752, 1, 1, 1, 1, 1,
-1.171732, -0.2182436, -1.732851, 1, 1, 1, 1, 1,
-1.17109, -0.04253073, -0.9437724, 1, 1, 1, 1, 1,
-1.170927, -1.843011, -0.4323746, 1, 1, 1, 1, 1,
-1.169154, -0.2326846, -1.978805, 1, 1, 1, 1, 1,
-1.16092, 0.1657353, -2.733804, 1, 1, 1, 1, 1,
-1.158433, 0.6661287, -1.269008, 1, 1, 1, 1, 1,
-1.15109, 0.1166769, -1.287964, 1, 1, 1, 1, 1,
-1.142723, -2.042092, -2.681705, 1, 1, 1, 1, 1,
-1.141357, 0.1547381, -1.960869, 1, 1, 1, 1, 1,
-1.139273, 0.6578965, -0.3014416, 1, 1, 1, 1, 1,
-1.134787, -0.8347232, -3.476257, 0, 0, 1, 1, 1,
-1.131842, 0.5220028, -0.3404309, 1, 0, 0, 1, 1,
-1.123617, 0.8406361, -1.047141, 1, 0, 0, 1, 1,
-1.12336, -1.445744, -1.616003, 1, 0, 0, 1, 1,
-1.119289, 0.8275872, 0.3021172, 1, 0, 0, 1, 1,
-1.118665, -0.9850248, -3.265108, 1, 0, 0, 1, 1,
-1.114651, -0.9265736, -3.746627, 0, 0, 0, 1, 1,
-1.114516, -0.2475718, -1.853013, 0, 0, 0, 1, 1,
-1.111264, -1.310008, -2.867946, 0, 0, 0, 1, 1,
-1.108185, 1.481395, -0.2996958, 0, 0, 0, 1, 1,
-1.102662, 0.01621637, -2.828201, 0, 0, 0, 1, 1,
-1.098766, -1.04813, -0.6690726, 0, 0, 0, 1, 1,
-1.092418, 0.02918285, -2.338719, 0, 0, 0, 1, 1,
-1.088288, 0.2214097, -1.060503, 1, 1, 1, 1, 1,
-1.085842, 0.08178352, -0.6937715, 1, 1, 1, 1, 1,
-1.081875, -0.2929657, -1.972952, 1, 1, 1, 1, 1,
-1.078177, -1.107932, -0.2478865, 1, 1, 1, 1, 1,
-1.071071, 1.023052, -0.3016731, 1, 1, 1, 1, 1,
-1.067099, -0.5828617, -3.938088, 1, 1, 1, 1, 1,
-1.062653, 2.072721, -0.215918, 1, 1, 1, 1, 1,
-1.055797, -2.077308, -2.483543, 1, 1, 1, 1, 1,
-1.052364, -1.199221, -0.7135546, 1, 1, 1, 1, 1,
-1.047963, -0.3558719, -1.103978, 1, 1, 1, 1, 1,
-1.040474, 1.368408, -1.4264, 1, 1, 1, 1, 1,
-1.037895, -1.443496, -2.618702, 1, 1, 1, 1, 1,
-1.036543, -0.7073154, -0.8315365, 1, 1, 1, 1, 1,
-1.034382, 1.35205, -1.238854, 1, 1, 1, 1, 1,
-1.029117, 0.8561518, -2.008884, 1, 1, 1, 1, 1,
-1.027446, -1.52654, -3.128358, 0, 0, 1, 1, 1,
-1.0254, 0.949854, -1.806952, 1, 0, 0, 1, 1,
-1.02154, 0.4714997, -0.4068242, 1, 0, 0, 1, 1,
-1.017036, -0.5753619, -2.104271, 1, 0, 0, 1, 1,
-1.005724, -0.1762928, -2.288286, 1, 0, 0, 1, 1,
-0.9966922, 0.9157298, -0.07695594, 1, 0, 0, 1, 1,
-0.9952655, 1.088003, -0.8141724, 0, 0, 0, 1, 1,
-0.9951831, -0.3167815, -2.475811, 0, 0, 0, 1, 1,
-0.9933184, -0.2794126, -1.167187, 0, 0, 0, 1, 1,
-0.9919959, -0.4722695, -0.893501, 0, 0, 0, 1, 1,
-0.9735093, -1.066721, -3.908576, 0, 0, 0, 1, 1,
-0.969622, -0.2168357, -1.509394, 0, 0, 0, 1, 1,
-0.9636697, -0.3160442, -1.018224, 0, 0, 0, 1, 1,
-0.9622838, 0.8818591, -0.9685452, 1, 1, 1, 1, 1,
-0.955955, 1.361628, -1.295449, 1, 1, 1, 1, 1,
-0.9535273, -1.165478, -2.771748, 1, 1, 1, 1, 1,
-0.948569, -0.358009, -2.291538, 1, 1, 1, 1, 1,
-0.9458886, -1.545737, -0.6903767, 1, 1, 1, 1, 1,
-0.9454321, 1.741524, -2.300649, 1, 1, 1, 1, 1,
-0.9435627, -0.7496347, -3.540429, 1, 1, 1, 1, 1,
-0.9424868, -0.8675157, -1.579085, 1, 1, 1, 1, 1,
-0.9406098, 0.2570856, -1.979917, 1, 1, 1, 1, 1,
-0.9404163, 0.8802894, -1.083671, 1, 1, 1, 1, 1,
-0.9401395, 0.5789288, -1.27808, 1, 1, 1, 1, 1,
-0.9380994, -0.197784, -1.544062, 1, 1, 1, 1, 1,
-0.935824, 0.9450261, -0.3437059, 1, 1, 1, 1, 1,
-0.9341915, -0.9697841, -2.633371, 1, 1, 1, 1, 1,
-0.930709, 0.7858931, -0.2939003, 1, 1, 1, 1, 1,
-0.9265417, -2.763177, -2.898832, 0, 0, 1, 1, 1,
-0.9254059, 1.388783, -0.9311045, 1, 0, 0, 1, 1,
-0.9238628, -0.5510077, -1.085207, 1, 0, 0, 1, 1,
-0.9210125, -1.26844, -2.977471, 1, 0, 0, 1, 1,
-0.9197581, 2.151101, 0.5229184, 1, 0, 0, 1, 1,
-0.9149874, 0.1331291, -1.19865, 1, 0, 0, 1, 1,
-0.9124988, 0.08331442, -1.554264, 0, 0, 0, 1, 1,
-0.9109976, 1.536936, -0.3559045, 0, 0, 0, 1, 1,
-0.9106772, 1.8671, -0.8511296, 0, 0, 0, 1, 1,
-0.9057698, 0.3787808, -2.38907, 0, 0, 0, 1, 1,
-0.9022661, 0.7354787, -0.5013384, 0, 0, 0, 1, 1,
-0.9003074, 0.1361387, -2.766533, 0, 0, 0, 1, 1,
-0.8950891, 0.3312472, -0.4353762, 0, 0, 0, 1, 1,
-0.8943093, -0.1423695, -1.940099, 1, 1, 1, 1, 1,
-0.8927974, -0.6931174, -3.296223, 1, 1, 1, 1, 1,
-0.8891839, -0.4377067, -2.321259, 1, 1, 1, 1, 1,
-0.8881665, -0.4359606, -0.8278056, 1, 1, 1, 1, 1,
-0.887693, -1.650596, -2.716278, 1, 1, 1, 1, 1,
-0.882174, 0.2974729, 0.1888959, 1, 1, 1, 1, 1,
-0.8690441, -0.2836916, -2.741526, 1, 1, 1, 1, 1,
-0.8682694, 1.089345, -0.3740358, 1, 1, 1, 1, 1,
-0.867845, 1.319654, -0.5832787, 1, 1, 1, 1, 1,
-0.8652796, -0.9298767, -2.875135, 1, 1, 1, 1, 1,
-0.8640069, -0.7118387, -2.776404, 1, 1, 1, 1, 1,
-0.8599107, 0.2991284, -0.994255, 1, 1, 1, 1, 1,
-0.8579758, -2.277124, -2.416973, 1, 1, 1, 1, 1,
-0.8566399, 2.109816, 0.5585321, 1, 1, 1, 1, 1,
-0.8476776, 0.4554998, -0.4758808, 1, 1, 1, 1, 1,
-0.8441554, -1.463184, -3.219781, 0, 0, 1, 1, 1,
-0.839008, -0.06270814, -0.3048648, 1, 0, 0, 1, 1,
-0.8354328, 0.3213989, -1.536384, 1, 0, 0, 1, 1,
-0.8293095, -0.4349141, -2.63359, 1, 0, 0, 1, 1,
-0.8272859, -1.121199, -2.889478, 1, 0, 0, 1, 1,
-0.8263554, -0.9414497, -2.564591, 1, 0, 0, 1, 1,
-0.8211752, 1.29984, -0.3526784, 0, 0, 0, 1, 1,
-0.8174707, -0.5412933, -1.363817, 0, 0, 0, 1, 1,
-0.8168468, -1.455569, -2.879569, 0, 0, 0, 1, 1,
-0.8127895, -0.7120677, -2.542567, 0, 0, 0, 1, 1,
-0.8027571, 0.5664955, -2.407416, 0, 0, 0, 1, 1,
-0.8002362, -1.467141, -1.850215, 0, 0, 0, 1, 1,
-0.7988061, 0.5614707, -0.9240149, 0, 0, 0, 1, 1,
-0.7985905, -0.2081556, -3.839346, 1, 1, 1, 1, 1,
-0.791317, 0.03752726, -1.261214, 1, 1, 1, 1, 1,
-0.7903034, 1.032779, -3.443921, 1, 1, 1, 1, 1,
-0.7780741, -0.8970631, -1.324293, 1, 1, 1, 1, 1,
-0.7739943, 1.021761, -0.7572823, 1, 1, 1, 1, 1,
-0.7730704, 0.8067217, -1.314909, 1, 1, 1, 1, 1,
-0.7638792, 1.388809, -0.8986483, 1, 1, 1, 1, 1,
-0.7635086, 0.2723953, -0.3007711, 1, 1, 1, 1, 1,
-0.7611735, -1.171483, -3.022604, 1, 1, 1, 1, 1,
-0.7546124, -0.3901062, -2.50354, 1, 1, 1, 1, 1,
-0.7528098, -1.203307, -4.148457, 1, 1, 1, 1, 1,
-0.7509517, -1.658816, -1.471056, 1, 1, 1, 1, 1,
-0.7503713, -2.196697, -1.104398, 1, 1, 1, 1, 1,
-0.7476601, -0.4758393, -0.5974138, 1, 1, 1, 1, 1,
-0.745268, -0.7075511, -3.105069, 1, 1, 1, 1, 1,
-0.7426229, -0.4464568, -3.239101, 0, 0, 1, 1, 1,
-0.7327014, 0.1703672, -0.6445959, 1, 0, 0, 1, 1,
-0.7314163, -1.069386, -4.429574, 1, 0, 0, 1, 1,
-0.7272223, -0.6369649, -2.236067, 1, 0, 0, 1, 1,
-0.7246012, -2.209873, -4.027234, 1, 0, 0, 1, 1,
-0.7242457, 1.833822, -0.8786321, 1, 0, 0, 1, 1,
-0.7211924, -1.334703, -0.06272528, 0, 0, 0, 1, 1,
-0.719995, -1.835295, -1.694164, 0, 0, 0, 1, 1,
-0.7160643, -0.4182267, -1.746401, 0, 0, 0, 1, 1,
-0.7155036, -1.009313, -2.0596, 0, 0, 0, 1, 1,
-0.7129081, -0.1797273, -0.457496, 0, 0, 0, 1, 1,
-0.7127938, -0.02625386, -2.961007, 0, 0, 0, 1, 1,
-0.7078784, -0.07832605, -1.679674, 0, 0, 0, 1, 1,
-0.706148, -0.4856514, -2.268157, 1, 1, 1, 1, 1,
-0.7048331, 1.137162, -0.8913583, 1, 1, 1, 1, 1,
-0.7033849, 0.009328268, -2.485087, 1, 1, 1, 1, 1,
-0.7029779, -2.054635, -2.672815, 1, 1, 1, 1, 1,
-0.7024564, -0.2441741, -2.769031, 1, 1, 1, 1, 1,
-0.6991387, -0.5239503, -1.816786, 1, 1, 1, 1, 1,
-0.6989002, 0.2942046, -1.128365, 1, 1, 1, 1, 1,
-0.6971731, 0.4320448, -0.3529557, 1, 1, 1, 1, 1,
-0.6914849, 1.55313, 0.07446478, 1, 1, 1, 1, 1,
-0.6849408, 0.9841943, 0.3835929, 1, 1, 1, 1, 1,
-0.6848052, -0.9415412, -3.311751, 1, 1, 1, 1, 1,
-0.6845571, -0.02935752, -1.871115, 1, 1, 1, 1, 1,
-0.6840794, -0.3718632, -1.777024, 1, 1, 1, 1, 1,
-0.6687949, -0.5412776, -3.382044, 1, 1, 1, 1, 1,
-0.667791, 0.9924458, -1.384131, 1, 1, 1, 1, 1,
-0.6666085, -0.1375132, 0.300192, 0, 0, 1, 1, 1,
-0.665418, 0.864046, 0.1868936, 1, 0, 0, 1, 1,
-0.6636854, 0.7108491, -1.437583, 1, 0, 0, 1, 1,
-0.6621216, 1.912081, -0.4169308, 1, 0, 0, 1, 1,
-0.6486702, -0.5165985, -4.004054, 1, 0, 0, 1, 1,
-0.6460188, -0.2366132, -1.145626, 1, 0, 0, 1, 1,
-0.641479, -0.3205097, -2.223795, 0, 0, 0, 1, 1,
-0.6407083, -1.746065, -2.949536, 0, 0, 0, 1, 1,
-0.6398275, 0.4377274, -1.647578, 0, 0, 0, 1, 1,
-0.6348186, -0.4241685, -2.733332, 0, 0, 0, 1, 1,
-0.6297812, 0.003759535, -0.8886457, 0, 0, 0, 1, 1,
-0.6278574, 0.007747903, -0.2088571, 0, 0, 0, 1, 1,
-0.6243491, 2.471825, -0.6444398, 0, 0, 0, 1, 1,
-0.6242856, -1.997286, -1.582773, 1, 1, 1, 1, 1,
-0.6198302, 1.451921, -0.1085564, 1, 1, 1, 1, 1,
-0.6196601, 1.649142, 0.4621476, 1, 1, 1, 1, 1,
-0.6159718, -1.09024, -3.6549, 1, 1, 1, 1, 1,
-0.6134018, -0.2302702, -3.334789, 1, 1, 1, 1, 1,
-0.6069574, 0.2724762, -0.9313259, 1, 1, 1, 1, 1,
-0.606707, -0.2034419, -3.855919, 1, 1, 1, 1, 1,
-0.6062447, -0.02172462, -2.888419, 1, 1, 1, 1, 1,
-0.605176, -1.058511, -2.006493, 1, 1, 1, 1, 1,
-0.5965655, -0.2071427, -2.204158, 1, 1, 1, 1, 1,
-0.595779, -0.6060631, -3.517384, 1, 1, 1, 1, 1,
-0.5919371, 1.868525, -0.983638, 1, 1, 1, 1, 1,
-0.5904828, 0.8333693, 1.424665, 1, 1, 1, 1, 1,
-0.5897893, -1.491385, -1.884013, 1, 1, 1, 1, 1,
-0.5860317, -1.477337, -3.055982, 1, 1, 1, 1, 1,
-0.5860223, 1.56309, -2.300028, 0, 0, 1, 1, 1,
-0.5748383, -0.3635433, -2.119369, 1, 0, 0, 1, 1,
-0.5747348, 0.5134129, -1.694915, 1, 0, 0, 1, 1,
-0.573321, 0.1288004, -2.909913, 1, 0, 0, 1, 1,
-0.5713552, -0.9805751, -3.890485, 1, 0, 0, 1, 1,
-0.5690842, -1.285872, -3.496251, 1, 0, 0, 1, 1,
-0.5564005, -0.6734498, -0.7044446, 0, 0, 0, 1, 1,
-0.5481317, 2.756923, 1.088048, 0, 0, 0, 1, 1,
-0.5398195, 0.2578309, -3.974958, 0, 0, 0, 1, 1,
-0.5362165, -0.4638153, -0.8525136, 0, 0, 0, 1, 1,
-0.53151, 0.577481, -1.540691, 0, 0, 0, 1, 1,
-0.5283856, 0.6793602, -1.390517, 0, 0, 0, 1, 1,
-0.5274732, 1.170604, -0.9455756, 0, 0, 0, 1, 1,
-0.5250508, 1.460333, 0.8256862, 1, 1, 1, 1, 1,
-0.5207328, -1.548481, -2.542513, 1, 1, 1, 1, 1,
-0.5206807, -0.2549381, -1.955606, 1, 1, 1, 1, 1,
-0.5204859, 2.425059, 1.566308, 1, 1, 1, 1, 1,
-0.5194964, 0.9088544, 0.2719058, 1, 1, 1, 1, 1,
-0.5168229, 0.2543557, -1.36622, 1, 1, 1, 1, 1,
-0.5160262, 0.3027878, -0.8002692, 1, 1, 1, 1, 1,
-0.5157723, -0.8455785, -1.49066, 1, 1, 1, 1, 1,
-0.5145711, -0.3410486, -0.5157819, 1, 1, 1, 1, 1,
-0.5134537, -0.5089101, -3.305741, 1, 1, 1, 1, 1,
-0.5132747, -0.9642243, -2.708971, 1, 1, 1, 1, 1,
-0.5130375, 0.7130978, 0.8488532, 1, 1, 1, 1, 1,
-0.5106073, 0.173248, -1.526693, 1, 1, 1, 1, 1,
-0.5052326, 0.131265, -2.508484, 1, 1, 1, 1, 1,
-0.4923227, -1.314393, -2.19396, 1, 1, 1, 1, 1,
-0.48942, 0.1541045, -0.9793276, 0, 0, 1, 1, 1,
-0.4872883, -0.9391664, -1.560238, 1, 0, 0, 1, 1,
-0.4848396, 0.1381497, -0.3968625, 1, 0, 0, 1, 1,
-0.4804724, 0.4750675, -2.435823, 1, 0, 0, 1, 1,
-0.48028, -0.397527, -4.188854, 1, 0, 0, 1, 1,
-0.4787602, -0.8281177, -2.224399, 1, 0, 0, 1, 1,
-0.4771556, -0.7779954, -1.318468, 0, 0, 0, 1, 1,
-0.4766619, -1.551848, -2.771487, 0, 0, 0, 1, 1,
-0.4754872, 0.2158308, -2.079709, 0, 0, 0, 1, 1,
-0.4734062, 1.057272, 0.4720095, 0, 0, 0, 1, 1,
-0.4711836, 0.6065196, 1.469894, 0, 0, 0, 1, 1,
-0.4687423, 0.3142664, -0.416144, 0, 0, 0, 1, 1,
-0.463562, -0.8710464, -1.94911, 0, 0, 0, 1, 1,
-0.4603589, -1.126909, -1.729849, 1, 1, 1, 1, 1,
-0.4585185, -1.808636, -3.385622, 1, 1, 1, 1, 1,
-0.4584647, 0.01794313, -1.266882, 1, 1, 1, 1, 1,
-0.457267, 0.07115152, -0.7339405, 1, 1, 1, 1, 1,
-0.4568094, -0.3901952, -1.93706, 1, 1, 1, 1, 1,
-0.4546051, -0.6252244, -2.569119, 1, 1, 1, 1, 1,
-0.4417031, 0.3505669, -1.955529, 1, 1, 1, 1, 1,
-0.4413913, 0.2137626, -1.56831, 1, 1, 1, 1, 1,
-0.4411226, 1.279095, -0.4018973, 1, 1, 1, 1, 1,
-0.4385218, 0.3378136, -1.540322, 1, 1, 1, 1, 1,
-0.4382073, 1.552881, -0.5809559, 1, 1, 1, 1, 1,
-0.4376398, 0.8622797, -1.704294, 1, 1, 1, 1, 1,
-0.4353557, -0.09794949, -1.577005, 1, 1, 1, 1, 1,
-0.4344957, 0.5726596, -0.2580949, 1, 1, 1, 1, 1,
-0.4324215, 0.5952353, -0.7100419, 1, 1, 1, 1, 1,
-0.4254368, 0.120442, -0.6282054, 0, 0, 1, 1, 1,
-0.4180102, -0.3529597, -3.364282, 1, 0, 0, 1, 1,
-0.4171999, -0.08840306, -1.50141, 1, 0, 0, 1, 1,
-0.4141003, 1.203422, -0.6699303, 1, 0, 0, 1, 1,
-0.4132883, 1.606857, -0.8844129, 1, 0, 0, 1, 1,
-0.4130859, 0.07433143, -0.9189984, 1, 0, 0, 1, 1,
-0.4089914, -1.669433, -2.020206, 0, 0, 0, 1, 1,
-0.3979369, -0.3842722, -2.177625, 0, 0, 0, 1, 1,
-0.3975649, 1.172711, -0.1495045, 0, 0, 0, 1, 1,
-0.3972611, -0.8697398, -3.877342, 0, 0, 0, 1, 1,
-0.3920677, 0.2044373, -1.365311, 0, 0, 0, 1, 1,
-0.3910692, -2.573686, -4.334427, 0, 0, 0, 1, 1,
-0.3877821, 1.053676, -0.7620475, 0, 0, 0, 1, 1,
-0.3861133, -0.1715068, -2.974693, 1, 1, 1, 1, 1,
-0.3750539, -0.3577091, -2.458277, 1, 1, 1, 1, 1,
-0.3633954, -1.24903, -3.599528, 1, 1, 1, 1, 1,
-0.3551242, 0.1707099, -0.1742564, 1, 1, 1, 1, 1,
-0.350508, -2.013664, -3.339086, 1, 1, 1, 1, 1,
-0.3497833, -1.184097, -5.050037, 1, 1, 1, 1, 1,
-0.3461921, 0.2945823, 0.1811328, 1, 1, 1, 1, 1,
-0.3456962, 0.7474017, 0.5905603, 1, 1, 1, 1, 1,
-0.3436178, -2.197511, -1.992689, 1, 1, 1, 1, 1,
-0.3417175, -0.3435719, -1.299954, 1, 1, 1, 1, 1,
-0.3416665, 0.06400086, -0.8624655, 1, 1, 1, 1, 1,
-0.3411083, 0.7440058, 0.5244472, 1, 1, 1, 1, 1,
-0.3394633, 0.5787229, -0.4208274, 1, 1, 1, 1, 1,
-0.336734, 0.7686698, -0.3512223, 1, 1, 1, 1, 1,
-0.3316162, 0.03909142, -2.341846, 1, 1, 1, 1, 1,
-0.3296753, 0.05837622, -1.067952, 0, 0, 1, 1, 1,
-0.3243478, 1.026624, 0.8786213, 1, 0, 0, 1, 1,
-0.3222588, -1.106493, -2.548726, 1, 0, 0, 1, 1,
-0.3197631, 0.8996562, 0.7834029, 1, 0, 0, 1, 1,
-0.3168711, -0.300126, -3.32247, 1, 0, 0, 1, 1,
-0.3119956, -0.7986823, -1.54493, 1, 0, 0, 1, 1,
-0.3103849, 0.2915804, -1.426176, 0, 0, 0, 1, 1,
-0.3077543, 2.565502, 0.2473492, 0, 0, 0, 1, 1,
-0.3054259, -0.6243569, -1.152424, 0, 0, 0, 1, 1,
-0.3033047, -1.248111, -4.400069, 0, 0, 0, 1, 1,
-0.3010778, -0.6927407, -3.257024, 0, 0, 0, 1, 1,
-0.2980695, 1.482159, -1.487974, 0, 0, 0, 1, 1,
-0.2954876, 0.08342309, 0.01296516, 0, 0, 0, 1, 1,
-0.2954415, -0.3641814, -2.593834, 1, 1, 1, 1, 1,
-0.2937007, -1.200421, -3.392783, 1, 1, 1, 1, 1,
-0.2879609, 0.05223543, -2.115282, 1, 1, 1, 1, 1,
-0.2876119, -0.0313154, -1.249932, 1, 1, 1, 1, 1,
-0.2798447, 0.1765033, -1.613116, 1, 1, 1, 1, 1,
-0.2784084, 1.45987, -0.7272852, 1, 1, 1, 1, 1,
-0.2719391, 1.11882, -1.416245, 1, 1, 1, 1, 1,
-0.2714708, -0.9983594, -3.309315, 1, 1, 1, 1, 1,
-0.2711397, -1.792154, -3.044286, 1, 1, 1, 1, 1,
-0.2673834, -1.249068, -4.031724, 1, 1, 1, 1, 1,
-0.2651236, 0.2453052, -1.312048, 1, 1, 1, 1, 1,
-0.26117, 0.8345659, 0.9728432, 1, 1, 1, 1, 1,
-0.2552608, 0.5569172, -0.335388, 1, 1, 1, 1, 1,
-0.2522925, -1.504278, -2.101898, 1, 1, 1, 1, 1,
-0.2512206, 0.03289926, -2.849284, 1, 1, 1, 1, 1,
-0.2487393, 0.1824401, -2.011458, 0, 0, 1, 1, 1,
-0.2466872, 0.5925372, 0.9961191, 1, 0, 0, 1, 1,
-0.2460106, -0.4510276, -3.5657, 1, 0, 0, 1, 1,
-0.2456077, -0.3535294, -3.280429, 1, 0, 0, 1, 1,
-0.2447962, -0.696476, -2.040994, 1, 0, 0, 1, 1,
-0.2431215, 0.2509364, -0.186559, 1, 0, 0, 1, 1,
-0.2367156, 0.1736362, -1.543974, 0, 0, 0, 1, 1,
-0.2352081, 0.0742266, -1.196668, 0, 0, 0, 1, 1,
-0.2346389, 0.02561154, -1.346985, 0, 0, 0, 1, 1,
-0.2268894, -0.1055783, -1.456842, 0, 0, 0, 1, 1,
-0.2261872, 0.7070509, -0.7495608, 0, 0, 0, 1, 1,
-0.225488, -1.003449, -3.389523, 0, 0, 0, 1, 1,
-0.2219091, 0.5646418, -0.9143558, 0, 0, 0, 1, 1,
-0.221144, 0.4357187, 0.01537645, 1, 1, 1, 1, 1,
-0.2168744, 0.252203, -1.296152, 1, 1, 1, 1, 1,
-0.214359, -0.05510369, -0.8098308, 1, 1, 1, 1, 1,
-0.2123557, 0.1799887, 0.4109718, 1, 1, 1, 1, 1,
-0.2118096, -0.04486743, -1.809626, 1, 1, 1, 1, 1,
-0.2100362, -0.7142871, -3.405828, 1, 1, 1, 1, 1,
-0.2092003, -0.6790959, -3.874554, 1, 1, 1, 1, 1,
-0.2029518, 1.574762, 1.125974, 1, 1, 1, 1, 1,
-0.200891, -1.411692, -1.70774, 1, 1, 1, 1, 1,
-0.1995658, 0.353144, 1.445434, 1, 1, 1, 1, 1,
-0.1980752, -0.5964982, -3.09414, 1, 1, 1, 1, 1,
-0.1966902, -0.1649195, -2.705187, 1, 1, 1, 1, 1,
-0.1936066, 0.5520511, -0.07386518, 1, 1, 1, 1, 1,
-0.1925285, 0.4407235, -0.86994, 1, 1, 1, 1, 1,
-0.1913756, 1.047027, -0.9919417, 1, 1, 1, 1, 1,
-0.1905759, 0.09723899, -0.406033, 0, 0, 1, 1, 1,
-0.1892038, -0.4025399, -3.229138, 1, 0, 0, 1, 1,
-0.1859676, -0.7750528, -1.258648, 1, 0, 0, 1, 1,
-0.1838941, -1.729075, -5.235335, 1, 0, 0, 1, 1,
-0.1808576, 0.05958252, -0.7496761, 1, 0, 0, 1, 1,
-0.1770666, 0.7722901, 0.2959246, 1, 0, 0, 1, 1,
-0.17381, 0.4817738, -0.2787144, 0, 0, 0, 1, 1,
-0.1727291, 0.1130649, -2.593432, 0, 0, 0, 1, 1,
-0.1697374, 1.057043, -1.593031, 0, 0, 0, 1, 1,
-0.1663001, -0.9398112, -2.341833, 0, 0, 0, 1, 1,
-0.1643293, -0.7022618, -2.40831, 0, 0, 0, 1, 1,
-0.1538474, -1.079231, -2.7426, 0, 0, 0, 1, 1,
-0.1536071, 1.026542, 0.9919797, 0, 0, 0, 1, 1,
-0.1512682, 0.2093893, -0.8323642, 1, 1, 1, 1, 1,
-0.1484429, 0.5116516, 0.7088735, 1, 1, 1, 1, 1,
-0.148005, 0.4280012, -0.7339751, 1, 1, 1, 1, 1,
-0.145717, 1.117166, 2.006035, 1, 1, 1, 1, 1,
-0.1432922, -1.067983, -1.986468, 1, 1, 1, 1, 1,
-0.1424274, -1.320675, -2.623087, 1, 1, 1, 1, 1,
-0.1398448, 2.55898, -1.292635, 1, 1, 1, 1, 1,
-0.1394905, -0.9941433, -4.192017, 1, 1, 1, 1, 1,
-0.1377198, -0.003720795, -2.724718, 1, 1, 1, 1, 1,
-0.1367818, -0.7013964, -2.558065, 1, 1, 1, 1, 1,
-0.1302558, 1.232866, -0.01299641, 1, 1, 1, 1, 1,
-0.1290373, 0.195147, -0.1624341, 1, 1, 1, 1, 1,
-0.120326, 1.179156, -0.04131292, 1, 1, 1, 1, 1,
-0.1132943, 0.2193761, -1.043352, 1, 1, 1, 1, 1,
-0.1130226, -2.70015, -1.618118, 1, 1, 1, 1, 1,
-0.1087171, -1.591282, -2.411688, 0, 0, 1, 1, 1,
-0.1066334, -0.5916534, -4.579544, 1, 0, 0, 1, 1,
-0.1046369, -0.660857, -1.959525, 1, 0, 0, 1, 1,
-0.1041134, 0.3520896, -0.2846719, 1, 0, 0, 1, 1,
-0.1038826, 0.6600026, 0.4653197, 1, 0, 0, 1, 1,
-0.1008879, 0.9308159, -0.03397914, 1, 0, 0, 1, 1,
-0.09901665, -0.213978, -3.466375, 0, 0, 0, 1, 1,
-0.09553245, -1.193007, -2.113481, 0, 0, 0, 1, 1,
-0.09479202, -1.055258, -3.785556, 0, 0, 0, 1, 1,
-0.09163675, -0.8120282, -4.046455, 0, 0, 0, 1, 1,
-0.09140453, 0.7828391, 0.7151362, 0, 0, 0, 1, 1,
-0.08802307, 1.056078, -1.322901, 0, 0, 0, 1, 1,
-0.08445631, 0.1545422, -0.729392, 0, 0, 0, 1, 1,
-0.08366574, -1.269047, -3.562555, 1, 1, 1, 1, 1,
-0.0822028, 0.02297131, -1.887215, 1, 1, 1, 1, 1,
-0.08177898, -0.778373, -2.315812, 1, 1, 1, 1, 1,
-0.07739245, -0.3387603, -3.836502, 1, 1, 1, 1, 1,
-0.07719032, 2.109995, 0.4060888, 1, 1, 1, 1, 1,
-0.07576972, -0.2388086, -0.7602511, 1, 1, 1, 1, 1,
-0.07544244, -0.2243546, -3.16605, 1, 1, 1, 1, 1,
-0.06982451, 0.8567047, -1.109999, 1, 1, 1, 1, 1,
-0.06780101, -0.324954, -2.574131, 1, 1, 1, 1, 1,
-0.06722083, 0.2572497, -0.5251066, 1, 1, 1, 1, 1,
-0.06449877, 0.5912547, 0.3998226, 1, 1, 1, 1, 1,
-0.06342587, 0.5409827, -1.178512, 1, 1, 1, 1, 1,
-0.06259618, 1.474548, 0.3825963, 1, 1, 1, 1, 1,
-0.05977713, 0.2845493, -0.3202009, 1, 1, 1, 1, 1,
-0.05706001, 1.224199, 0.9345663, 1, 1, 1, 1, 1,
-0.05598366, 0.2671287, -1.890581, 0, 0, 1, 1, 1,
-0.05483263, 0.2278099, 0.5924425, 1, 0, 0, 1, 1,
-0.05478524, -0.7139612, -2.368981, 1, 0, 0, 1, 1,
-0.0527342, -0.8416854, -2.937247, 1, 0, 0, 1, 1,
-0.04116723, -1.733272, -3.234616, 1, 0, 0, 1, 1,
-0.03514144, -0.9955452, -4.414789, 1, 0, 0, 1, 1,
-0.03474675, 0.9521741, 0.7860119, 0, 0, 0, 1, 1,
-0.03382332, -0.841284, -2.136958, 0, 0, 0, 1, 1,
-0.03149259, -0.9761771, -3.17734, 0, 0, 0, 1, 1,
-0.03013149, 0.01772184, 0.8416089, 0, 0, 0, 1, 1,
-0.02985437, -0.08302327, -1.912721, 0, 0, 0, 1, 1,
-0.02346517, 1.135923, 0.02820454, 0, 0, 0, 1, 1,
-0.01774622, 0.2914465, -0.7971093, 0, 0, 0, 1, 1,
-0.01582144, 0.2433296, -0.5004607, 1, 1, 1, 1, 1,
-0.012936, -1.180367, -3.530931, 1, 1, 1, 1, 1,
-0.01291959, -0.0136083, -3.964766, 1, 1, 1, 1, 1,
-0.01257494, 0.6938795, -0.498908, 1, 1, 1, 1, 1,
-0.01239204, -0.7824752, -3.034326, 1, 1, 1, 1, 1,
-0.00812303, 0.6405739, -1.4242, 1, 1, 1, 1, 1,
0.01005917, -0.3671522, 4.089999, 1, 1, 1, 1, 1,
0.01109301, 3.468766, -0.1491096, 1, 1, 1, 1, 1,
0.01612144, 0.5678675, -0.4102409, 1, 1, 1, 1, 1,
0.02668159, 0.8595318, 0.0646233, 1, 1, 1, 1, 1,
0.02710692, -1.453068, 4.030712, 1, 1, 1, 1, 1,
0.03055727, 0.669107, -0.01280512, 1, 1, 1, 1, 1,
0.03229795, -0.6143757, 3.014492, 1, 1, 1, 1, 1,
0.03372527, 1.008752, 0.1384215, 1, 1, 1, 1, 1,
0.03400622, -0.04420537, 3.231557, 1, 1, 1, 1, 1,
0.03912156, 2.16305, 0.2174914, 0, 0, 1, 1, 1,
0.04293394, -0.1376845, 0.5523806, 1, 0, 0, 1, 1,
0.04521831, 0.3185042, -1.114578, 1, 0, 0, 1, 1,
0.04575337, 1.542835, 0.8803557, 1, 0, 0, 1, 1,
0.04956147, 0.8519974, -1.094692, 1, 0, 0, 1, 1,
0.0521906, -0.08046393, 0.1609885, 1, 0, 0, 1, 1,
0.05437602, 0.2012539, 2.387918, 0, 0, 0, 1, 1,
0.05488459, -0.6787912, 2.140817, 0, 0, 0, 1, 1,
0.05812516, 0.8234543, -2.307472, 0, 0, 0, 1, 1,
0.06134219, -0.6655813, 3.149101, 0, 0, 0, 1, 1,
0.0622893, 0.5292761, 1.202649, 0, 0, 0, 1, 1,
0.06659514, -0.5094318, 2.185567, 0, 0, 0, 1, 1,
0.06800524, -1.502631, 2.552409, 0, 0, 0, 1, 1,
0.0694221, 0.01312329, 1.621101, 1, 1, 1, 1, 1,
0.07160997, -0.223532, 3.844877, 1, 1, 1, 1, 1,
0.0757697, 1.056327, -1.209994, 1, 1, 1, 1, 1,
0.07617346, 1.215737, -0.2037244, 1, 1, 1, 1, 1,
0.0774529, -0.7328486, 3.556593, 1, 1, 1, 1, 1,
0.08067843, 0.3951439, 1.265769, 1, 1, 1, 1, 1,
0.08145279, 0.1578233, 0.1666847, 1, 1, 1, 1, 1,
0.08727541, 1.560285, 1.789863, 1, 1, 1, 1, 1,
0.09789816, -0.03025166, 4.148435, 1, 1, 1, 1, 1,
0.09955721, -0.8358767, 2.253795, 1, 1, 1, 1, 1,
0.0997167, -1.80491, 4.57439, 1, 1, 1, 1, 1,
0.09983005, -0.8201653, 2.219954, 1, 1, 1, 1, 1,
0.1001239, 1.230428, 1.435945, 1, 1, 1, 1, 1,
0.1021675, -0.2750577, 1.510837, 1, 1, 1, 1, 1,
0.1105291, -1.222666, 2.692759, 1, 1, 1, 1, 1,
0.1156622, -0.2102903, 3.290324, 0, 0, 1, 1, 1,
0.1158249, -1.485808, 4.424973, 1, 0, 0, 1, 1,
0.1173359, 0.7139242, 0.8771449, 1, 0, 0, 1, 1,
0.1191376, -1.166831, 2.075059, 1, 0, 0, 1, 1,
0.1212019, 0.6972586, 0.4568081, 1, 0, 0, 1, 1,
0.1212463, 0.5033565, -1.925627, 1, 0, 0, 1, 1,
0.1238628, 1.342119, -0.6665567, 0, 0, 0, 1, 1,
0.1271189, -0.5083209, 3.324032, 0, 0, 0, 1, 1,
0.1290106, 1.694878, 1.880124, 0, 0, 0, 1, 1,
0.1303504, -0.1238004, 1.451981, 0, 0, 0, 1, 1,
0.1325958, -0.1639871, 1.329863, 0, 0, 0, 1, 1,
0.1351329, 0.63024, -1.818931, 0, 0, 0, 1, 1,
0.1427557, 0.7691709, 0.7031326, 0, 0, 0, 1, 1,
0.1431977, -0.9757519, 1.503345, 1, 1, 1, 1, 1,
0.1466481, 1.100062, 0.2638477, 1, 1, 1, 1, 1,
0.1475056, 1.427586, 1.473802, 1, 1, 1, 1, 1,
0.1487172, -2.131793, 3.599115, 1, 1, 1, 1, 1,
0.1587262, -0.8257428, 3.336413, 1, 1, 1, 1, 1,
0.1604718, -0.656213, 1.968896, 1, 1, 1, 1, 1,
0.1655254, 0.2163186, 1.736122, 1, 1, 1, 1, 1,
0.1658062, -0.9151466, 3.744647, 1, 1, 1, 1, 1,
0.1696007, -0.5275451, 4.875106, 1, 1, 1, 1, 1,
0.1703895, -0.9550236, 3.556916, 1, 1, 1, 1, 1,
0.1761685, -0.944783, 2.388482, 1, 1, 1, 1, 1,
0.1782245, -0.7863536, 3.794554, 1, 1, 1, 1, 1,
0.1824857, 2.013532, -2.179821, 1, 1, 1, 1, 1,
0.1888114, -1.495201, 5.05851, 1, 1, 1, 1, 1,
0.189556, -1.12659, 3.470453, 1, 1, 1, 1, 1,
0.1896185, -2.074551, 3.102071, 0, 0, 1, 1, 1,
0.1912602, -0.4041802, 4.011345, 1, 0, 0, 1, 1,
0.1927364, 0.7152495, 1.435924, 1, 0, 0, 1, 1,
0.1935413, 0.3692374, 0.852336, 1, 0, 0, 1, 1,
0.1942523, -0.7590085, 2.705014, 1, 0, 0, 1, 1,
0.2026535, -1.861453, 3.963813, 1, 0, 0, 1, 1,
0.2031951, -0.7133434, 3.624539, 0, 0, 0, 1, 1,
0.2037019, 0.03366062, 1.820694, 0, 0, 0, 1, 1,
0.2048401, -1.088779, 3.408886, 0, 0, 0, 1, 1,
0.2058827, 0.3541783, 0.6048056, 0, 0, 0, 1, 1,
0.2085268, 0.7822337, 0.863396, 0, 0, 0, 1, 1,
0.2092651, 0.08110087, 2.476939, 0, 0, 0, 1, 1,
0.2106272, 0.162582, 3.557555, 0, 0, 0, 1, 1,
0.212578, 1.264104, 0.6527401, 1, 1, 1, 1, 1,
0.2135666, 0.05193141, -0.5992868, 1, 1, 1, 1, 1,
0.2145028, 1.116679, 2.549767, 1, 1, 1, 1, 1,
0.2146655, 0.8483154, 0.3422839, 1, 1, 1, 1, 1,
0.2193646, -0.2419402, -0.05937875, 1, 1, 1, 1, 1,
0.2233373, 1.236802, 0.6129195, 1, 1, 1, 1, 1,
0.2244217, -0.697035, 2.997995, 1, 1, 1, 1, 1,
0.2246346, -0.6494594, 3.963322, 1, 1, 1, 1, 1,
0.2326876, 0.4739014, 0.9158496, 1, 1, 1, 1, 1,
0.2329206, 1.339406, 1.12218, 1, 1, 1, 1, 1,
0.2386217, 1.794432, 1.80985, 1, 1, 1, 1, 1,
0.2407041, 0.7111331, 0.1242142, 1, 1, 1, 1, 1,
0.2440704, -1.302907, 2.101355, 1, 1, 1, 1, 1,
0.2475704, 1.135726, 0.3878183, 1, 1, 1, 1, 1,
0.2507449, 0.9019077, 0.07267382, 1, 1, 1, 1, 1,
0.2563618, 1.490768, 1.652054, 0, 0, 1, 1, 1,
0.2590291, 0.2296293, 1.314965, 1, 0, 0, 1, 1,
0.2604802, 1.790892, 0.9169659, 1, 0, 0, 1, 1,
0.2621064, -1.408417, 3.09844, 1, 0, 0, 1, 1,
0.264247, -0.04416965, 2.357232, 1, 0, 0, 1, 1,
0.2678695, -0.3161367, 3.286946, 1, 0, 0, 1, 1,
0.2716721, -0.9332658, 2.041182, 0, 0, 0, 1, 1,
0.2805668, 1.007827, -1.088082, 0, 0, 0, 1, 1,
0.2812934, -1.977522, 5.927461, 0, 0, 0, 1, 1,
0.2826503, 2.365418, 2.439265, 0, 0, 0, 1, 1,
0.287904, -0.8497608, 2.548411, 0, 0, 0, 1, 1,
0.2936212, -1.116158, 1.929249, 0, 0, 0, 1, 1,
0.2939431, 0.2918922, 1.469156, 0, 0, 0, 1, 1,
0.2961564, -0.8723313, 2.451495, 1, 1, 1, 1, 1,
0.2964706, -0.7234018, 2.239895, 1, 1, 1, 1, 1,
0.3012976, -0.8340626, 2.848932, 1, 1, 1, 1, 1,
0.30216, -0.5421419, 2.542843, 1, 1, 1, 1, 1,
0.3060708, -0.9896888, 2.689889, 1, 1, 1, 1, 1,
0.3063343, 0.6341707, 1.215216, 1, 1, 1, 1, 1,
0.3157594, 1.01454, 1.559295, 1, 1, 1, 1, 1,
0.3187343, 0.5210977, 2.165994, 1, 1, 1, 1, 1,
0.3191439, -0.4729888, 2.901487, 1, 1, 1, 1, 1,
0.3196782, 0.04464903, 0.5587238, 1, 1, 1, 1, 1,
0.3213919, 1.5071, 0.982006, 1, 1, 1, 1, 1,
0.3232872, 1.77804, 1.41649, 1, 1, 1, 1, 1,
0.3244347, -0.4401048, 2.39714, 1, 1, 1, 1, 1,
0.3286872, 0.9753016, -0.8909163, 1, 1, 1, 1, 1,
0.3302576, 0.4665436, 0.7927684, 1, 1, 1, 1, 1,
0.3306792, -1.178411, 3.373122, 0, 0, 1, 1, 1,
0.3328983, -3.12242, 3.05185, 1, 0, 0, 1, 1,
0.338394, -1.350794, 2.502607, 1, 0, 0, 1, 1,
0.341847, 0.4249521, 1.302305, 1, 0, 0, 1, 1,
0.3420241, -1.101945, 4.622275, 1, 0, 0, 1, 1,
0.3425133, -0.2828303, 2.30872, 1, 0, 0, 1, 1,
0.3454841, 0.1252639, 2.187857, 0, 0, 0, 1, 1,
0.3467126, -0.4455763, 2.853819, 0, 0, 0, 1, 1,
0.3489952, 0.6101665, -0.3988593, 0, 0, 0, 1, 1,
0.350249, 1.280781, 2.081179, 0, 0, 0, 1, 1,
0.3504651, -0.4724458, 2.311806, 0, 0, 0, 1, 1,
0.3505305, 0.9748485, 0.431746, 0, 0, 0, 1, 1,
0.3576287, -0.5691963, 2.151318, 0, 0, 0, 1, 1,
0.3586602, 0.6058131, 0.3357553, 1, 1, 1, 1, 1,
0.3588478, 1.333772, 0.4829386, 1, 1, 1, 1, 1,
0.3673391, 0.7134941, 0.9257618, 1, 1, 1, 1, 1,
0.3682136, 0.1098657, 1.285377, 1, 1, 1, 1, 1,
0.3682825, -0.9144222, 2.682913, 1, 1, 1, 1, 1,
0.3691488, 1.078461, -1.231179, 1, 1, 1, 1, 1,
0.3708931, -1.075756, 2.628276, 1, 1, 1, 1, 1,
0.3710832, -1.75086, 2.457068, 1, 1, 1, 1, 1,
0.3734583, 0.8704607, 0.009242839, 1, 1, 1, 1, 1,
0.3780359, -0.08401866, 0.9438432, 1, 1, 1, 1, 1,
0.381678, 0.8459588, 0.6579077, 1, 1, 1, 1, 1,
0.3845055, 0.6145683, 0.01541723, 1, 1, 1, 1, 1,
0.3859227, -1.080928, 3.909751, 1, 1, 1, 1, 1,
0.3859523, 0.8618082, 1.263425, 1, 1, 1, 1, 1,
0.3932832, -0.7528012, 2.340162, 1, 1, 1, 1, 1,
0.3994561, -0.587018, 2.788759, 0, 0, 1, 1, 1,
0.4023892, 0.2742666, 0.5997463, 1, 0, 0, 1, 1,
0.4045701, -0.7096396, 3.461275, 1, 0, 0, 1, 1,
0.4062581, 0.4246141, 1.972565, 1, 0, 0, 1, 1,
0.4095795, -1.213068, 1.835297, 1, 0, 0, 1, 1,
0.4180105, -1.137675, 3.07319, 1, 0, 0, 1, 1,
0.4198306, -0.872621, 3.017179, 0, 0, 0, 1, 1,
0.4249754, 0.9551123, 0.2865685, 0, 0, 0, 1, 1,
0.4262669, 1.409, 1.832072, 0, 0, 0, 1, 1,
0.4280325, -0.08395264, 4.118406, 0, 0, 0, 1, 1,
0.4287222, -0.2008015, 1.562369, 0, 0, 0, 1, 1,
0.4297705, 0.3782341, 0.5605368, 0, 0, 0, 1, 1,
0.4344217, -0.3396204, 1.563569, 0, 0, 0, 1, 1,
0.4361342, 0.1589351, 1.255236, 1, 1, 1, 1, 1,
0.4393287, 0.4368982, 0.2208737, 1, 1, 1, 1, 1,
0.439773, -1.435745, 3.209012, 1, 1, 1, 1, 1,
0.4400842, -0.9978857, 2.001408, 1, 1, 1, 1, 1,
0.4411832, -1.495547, 3.178398, 1, 1, 1, 1, 1,
0.4423857, 1.661395, -0.5760745, 1, 1, 1, 1, 1,
0.4425982, -1.644353, 3.08254, 1, 1, 1, 1, 1,
0.444771, -1.429949, 1.689831, 1, 1, 1, 1, 1,
0.4473095, 1.940765, 0.01201952, 1, 1, 1, 1, 1,
0.4614751, 2.781474, -1.05143, 1, 1, 1, 1, 1,
0.4615383, -1.510242, 1.127765, 1, 1, 1, 1, 1,
0.4619436, -1.065839, 3.46055, 1, 1, 1, 1, 1,
0.4633277, 0.3331531, -0.876728, 1, 1, 1, 1, 1,
0.468232, 2.227215, -0.1392394, 1, 1, 1, 1, 1,
0.4686705, 0.5620769, 1.027738, 1, 1, 1, 1, 1,
0.4732181, 1.256082, -0.7296793, 0, 0, 1, 1, 1,
0.4836582, -0.06251184, 0.9478987, 1, 0, 0, 1, 1,
0.4839572, 0.4043646, 0.0997794, 1, 0, 0, 1, 1,
0.4881189, -2.096774, 2.999411, 1, 0, 0, 1, 1,
0.4882126, 0.4409274, 3.421711, 1, 0, 0, 1, 1,
0.4903139, -2.909138, 3.290617, 1, 0, 0, 1, 1,
0.4917669, 1.463834, 1.578475, 0, 0, 0, 1, 1,
0.5057645, 0.5567282, 0.2002822, 0, 0, 0, 1, 1,
0.5070762, -0.6711901, 1.873221, 0, 0, 0, 1, 1,
0.5073485, -0.3261466, 3.243929, 0, 0, 0, 1, 1,
0.5096763, -1.410499, 0.9498138, 0, 0, 0, 1, 1,
0.5103924, 0.3725317, 1.210776, 0, 0, 0, 1, 1,
0.5175417, -1.458511, 4.530648, 0, 0, 0, 1, 1,
0.5219415, -1.879763, 2.301317, 1, 1, 1, 1, 1,
0.5223887, -0.3079028, 1.570358, 1, 1, 1, 1, 1,
0.5276728, 0.1922805, 1.0231, 1, 1, 1, 1, 1,
0.5326508, 2.251274, -0.3834975, 1, 1, 1, 1, 1,
0.5364888, -0.6931394, 3.069232, 1, 1, 1, 1, 1,
0.536936, 0.8347836, 0.5376083, 1, 1, 1, 1, 1,
0.5392436, 0.4761343, 0.5042584, 1, 1, 1, 1, 1,
0.5403119, -0.6853314, 3.296335, 1, 1, 1, 1, 1,
0.5410449, 1.19419, -0.1977578, 1, 1, 1, 1, 1,
0.5438136, -0.01828178, 1.72565, 1, 1, 1, 1, 1,
0.5449761, 0.09617498, 2.68702, 1, 1, 1, 1, 1,
0.5499423, -0.0769895, 0.4788704, 1, 1, 1, 1, 1,
0.551182, -0.8679121, 3.486502, 1, 1, 1, 1, 1,
0.5557626, -0.2468123, 1.560013, 1, 1, 1, 1, 1,
0.5573016, 3.078401, 0.7344943, 1, 1, 1, 1, 1,
0.5596234, -0.09007401, 1.137711, 0, 0, 1, 1, 1,
0.5628319, -0.3874161, 2.739539, 1, 0, 0, 1, 1,
0.5678399, 2.159823, 1.003574, 1, 0, 0, 1, 1,
0.5700682, 0.2997063, 0.4873773, 1, 0, 0, 1, 1,
0.5703095, 1.221125, 0.1860339, 1, 0, 0, 1, 1,
0.5745828, 0.3861978, 1.492688, 1, 0, 0, 1, 1,
0.5840223, -0.2078385, 1.971585, 0, 0, 0, 1, 1,
0.5926995, 1.049903, 2.796778, 0, 0, 0, 1, 1,
0.5950065, 0.834056, -0.574223, 0, 0, 0, 1, 1,
0.5989528, 0.04508603, 2.363009, 0, 0, 0, 1, 1,
0.6039365, 0.05726997, 0.8440593, 0, 0, 0, 1, 1,
0.6045656, -0.38613, 1.781034, 0, 0, 0, 1, 1,
0.6068091, 0.3810833, 1.498196, 0, 0, 0, 1, 1,
0.6084436, -0.5598802, 2.759479, 1, 1, 1, 1, 1,
0.6110396, -0.7774104, 3.682212, 1, 1, 1, 1, 1,
0.6113394, -1.053441, 1.948, 1, 1, 1, 1, 1,
0.6160833, 0.04061024, 1.969506, 1, 1, 1, 1, 1,
0.6210894, -1.370012, 4.044546, 1, 1, 1, 1, 1,
0.6219003, 0.6139952, 1.154011, 1, 1, 1, 1, 1,
0.622027, 0.9981362, 0.9991996, 1, 1, 1, 1, 1,
0.6233313, 0.7598273, 0.803556, 1, 1, 1, 1, 1,
0.6285521, -1.472108, 2.045918, 1, 1, 1, 1, 1,
0.6286909, 0.2289779, 1.346565, 1, 1, 1, 1, 1,
0.6308497, 0.725474, 1.716243, 1, 1, 1, 1, 1,
0.6360191, 0.2727648, 3.244609, 1, 1, 1, 1, 1,
0.637476, 0.2854049, 2.53699, 1, 1, 1, 1, 1,
0.6464768, -0.1861907, 2.329453, 1, 1, 1, 1, 1,
0.6491898, 0.4142663, -0.006132421, 1, 1, 1, 1, 1,
0.6513346, 0.1455888, 0.6018018, 0, 0, 1, 1, 1,
0.6530412, 0.5295259, 0.548667, 1, 0, 0, 1, 1,
0.6556435, 0.3505405, -1.389782, 1, 0, 0, 1, 1,
0.65574, -2.810609, 4.46905, 1, 0, 0, 1, 1,
0.6597794, 1.577399, -0.947893, 1, 0, 0, 1, 1,
0.6660688, 2.463055, 0.8040129, 1, 0, 0, 1, 1,
0.6739758, -1.127629, 1.026723, 0, 0, 0, 1, 1,
0.677839, -0.5112752, 2.282125, 0, 0, 0, 1, 1,
0.6882616, -0.5193111, 1.716488, 0, 0, 0, 1, 1,
0.6951765, 0.5668547, 0.5957769, 0, 0, 0, 1, 1,
0.6969646, -0.2667776, 3.061382, 0, 0, 0, 1, 1,
0.6983248, -0.8780167, 2.333426, 0, 0, 0, 1, 1,
0.7012803, -0.1469714, 3.299443, 0, 0, 0, 1, 1,
0.7014548, 0.5729044, 0.4422569, 1, 1, 1, 1, 1,
0.7014717, -2.165295, 1.823516, 1, 1, 1, 1, 1,
0.7121097, 0.398771, 0.8413975, 1, 1, 1, 1, 1,
0.7164389, 0.2249249, 1.04678, 1, 1, 1, 1, 1,
0.7171856, -0.4961394, 1.457692, 1, 1, 1, 1, 1,
0.7180069, -0.2150812, 1.660149, 1, 1, 1, 1, 1,
0.7200987, -1.738424, 3.502713, 1, 1, 1, 1, 1,
0.725177, 0.8418631, 0.8180702, 1, 1, 1, 1, 1,
0.7289013, 0.8049085, -1.257876, 1, 1, 1, 1, 1,
0.7321849, 0.09824674, 1.143551, 1, 1, 1, 1, 1,
0.7323052, 0.4199979, 0.9507135, 1, 1, 1, 1, 1,
0.7340291, -0.6643663, 2.511738, 1, 1, 1, 1, 1,
0.7407168, 0.3650735, 2.076228, 1, 1, 1, 1, 1,
0.7471511, 0.7564526, 0.252197, 1, 1, 1, 1, 1,
0.7477455, 1.698064, 2.005239, 1, 1, 1, 1, 1,
0.7507958, -1.663207, 2.182537, 0, 0, 1, 1, 1,
0.7613239, -0.8166037, 2.041946, 1, 0, 0, 1, 1,
0.7624745, 1.522926, -0.178296, 1, 0, 0, 1, 1,
0.7632042, 0.358422, 0.8017821, 1, 0, 0, 1, 1,
0.7722592, -0.8268952, 2.050802, 1, 0, 0, 1, 1,
0.7745172, 0.1328426, 0.03107034, 1, 0, 0, 1, 1,
0.7759007, 1.236904, 0.6369076, 0, 0, 0, 1, 1,
0.7811444, -2.0638, 2.61376, 0, 0, 0, 1, 1,
0.7976031, 0.4201174, 2.173282, 0, 0, 0, 1, 1,
0.7985501, 0.6569715, -0.1164276, 0, 0, 0, 1, 1,
0.8004903, 0.9822422, 0.2067747, 0, 0, 0, 1, 1,
0.8022022, 0.7860395, 1.115552, 0, 0, 0, 1, 1,
0.8032959, 0.1810729, 1.863994, 0, 0, 0, 1, 1,
0.8079607, -0.1557792, 0.117619, 1, 1, 1, 1, 1,
0.8082903, 0.1343664, 1.756212, 1, 1, 1, 1, 1,
0.8085263, -1.204816, 2.125955, 1, 1, 1, 1, 1,
0.809068, -0.3994257, 1.982131, 1, 1, 1, 1, 1,
0.8120822, -0.1639446, 1.141165, 1, 1, 1, 1, 1,
0.814062, -1.803032, 3.693167, 1, 1, 1, 1, 1,
0.8158476, -0.9784567, 1.52534, 1, 1, 1, 1, 1,
0.8179086, 0.8464741, 0.5808252, 1, 1, 1, 1, 1,
0.8193828, 0.3015011, -0.9817564, 1, 1, 1, 1, 1,
0.8249027, 1.246002, 1.488735, 1, 1, 1, 1, 1,
0.8266278, -1.36569, 3.117178, 1, 1, 1, 1, 1,
0.829468, -0.6115791, 2.251745, 1, 1, 1, 1, 1,
0.8332688, -1.46286, 1.69937, 1, 1, 1, 1, 1,
0.8349621, 0.4689187, 1.666096, 1, 1, 1, 1, 1,
0.8352005, 1.277297, 1.442307, 1, 1, 1, 1, 1,
0.8397079, -0.02697854, 2.073174, 0, 0, 1, 1, 1,
0.8410948, 0.1220999, 0.3763979, 1, 0, 0, 1, 1,
0.8434134, -0.4671841, 0.3890149, 1, 0, 0, 1, 1,
0.845054, -0.4855744, 4.185966, 1, 0, 0, 1, 1,
0.8463464, 0.009185396, 0.6376597, 1, 0, 0, 1, 1,
0.8469337, -0.05996556, 1.989284, 1, 0, 0, 1, 1,
0.8474661, 0.3033743, 1.031761, 0, 0, 0, 1, 1,
0.8625092, 1.934863, -0.6205054, 0, 0, 0, 1, 1,
0.8636194, -0.9132684, 2.458584, 0, 0, 0, 1, 1,
0.880079, 0.108487, 0.9559844, 0, 0, 0, 1, 1,
0.9065528, 0.9316428, 1.83172, 0, 0, 0, 1, 1,
0.9108757, 0.5003489, 1.169538, 0, 0, 0, 1, 1,
0.9173734, -1.823541, 3.224433, 0, 0, 0, 1, 1,
0.9175205, 0.3962266, 0.6191915, 1, 1, 1, 1, 1,
0.9305944, 1.37525, -0.3508284, 1, 1, 1, 1, 1,
0.93393, 0.02170921, 1.190935, 1, 1, 1, 1, 1,
0.9340469, 0.532514, 1.02249, 1, 1, 1, 1, 1,
0.9401559, -1.377238, 0.9174368, 1, 1, 1, 1, 1,
0.9461188, 0.05065211, 2.278306, 1, 1, 1, 1, 1,
0.9470156, 0.5668114, 0.8322645, 1, 1, 1, 1, 1,
0.9515001, -0.20312, 0.8035768, 1, 1, 1, 1, 1,
0.951979, 0.03067717, 0.1425603, 1, 1, 1, 1, 1,
0.9551216, 0.8202794, 0.3316229, 1, 1, 1, 1, 1,
0.9556549, -1.292914, 4.208402, 1, 1, 1, 1, 1,
0.9569854, 0.252727, 1.342758, 1, 1, 1, 1, 1,
0.9647571, -0.4911481, 3.008561, 1, 1, 1, 1, 1,
0.9668908, 0.6097844, 3.005808, 1, 1, 1, 1, 1,
0.9740806, 0.1425619, 1.420352, 1, 1, 1, 1, 1,
0.981635, -0.6791734, 1.601146, 0, 0, 1, 1, 1,
0.9832187, -1.26661, 2.841529, 1, 0, 0, 1, 1,
0.9852608, -0.5484497, 1.67749, 1, 0, 0, 1, 1,
0.9853316, 0.7996623, 2.068193, 1, 0, 0, 1, 1,
0.989535, -0.7545347, 1.894918, 1, 0, 0, 1, 1,
0.9921975, -0.5735357, 3.26133, 1, 0, 0, 1, 1,
0.9944196, -0.4034266, 0.8974015, 0, 0, 0, 1, 1,
0.9964457, -0.3763672, 3.118522, 0, 0, 0, 1, 1,
1.006035, -0.4310661, 1.95105, 0, 0, 0, 1, 1,
1.006249, -0.3307936, 3.876928, 0, 0, 0, 1, 1,
1.007179, 0.04115266, 1.982988, 0, 0, 0, 1, 1,
1.008757, -1.020915, 4.271963, 0, 0, 0, 1, 1,
1.009966, -1.860152, 0.8084929, 0, 0, 0, 1, 1,
1.014088, -0.4785288, 1.763147, 1, 1, 1, 1, 1,
1.021843, 2.529809, 0.9060671, 1, 1, 1, 1, 1,
1.024024, -0.2663693, 1.232082, 1, 1, 1, 1, 1,
1.034949, 1.679571, 0.986567, 1, 1, 1, 1, 1,
1.041982, 0.1245177, 0.2317508, 1, 1, 1, 1, 1,
1.042193, 0.2282386, 2.961945, 1, 1, 1, 1, 1,
1.043278, 2.078795, 2.740886, 1, 1, 1, 1, 1,
1.061834, 0.6470304, -0.1962548, 1, 1, 1, 1, 1,
1.063516, 1.132294, -0.3185652, 1, 1, 1, 1, 1,
1.066718, -0.3598609, 2.862615, 1, 1, 1, 1, 1,
1.067873, -1.183183, 4.117869, 1, 1, 1, 1, 1,
1.069885, 0.7118859, 0.009655136, 1, 1, 1, 1, 1,
1.072915, -0.06036989, 1.878651, 1, 1, 1, 1, 1,
1.074725, 2.326589, 2.230507, 1, 1, 1, 1, 1,
1.078043, -0.6416491, 2.338259, 1, 1, 1, 1, 1,
1.089857, 1.255793, 1.3472, 0, 0, 1, 1, 1,
1.091478, -0.3517436, 1.112906, 1, 0, 0, 1, 1,
1.095213, 1.100781, 0.6095521, 1, 0, 0, 1, 1,
1.095913, -2.144727, 0.6997536, 1, 0, 0, 1, 1,
1.097216, 0.5022953, -0.5484674, 1, 0, 0, 1, 1,
1.101839, -0.08550791, 1.069817, 1, 0, 0, 1, 1,
1.105775, 0.1012585, 1.475231, 0, 0, 0, 1, 1,
1.1084, 0.5983643, 2.047261, 0, 0, 0, 1, 1,
1.109967, 0.7479038, 1.985447, 0, 0, 0, 1, 1,
1.110267, 0.8892678, 2.108368, 0, 0, 0, 1, 1,
1.110424, 0.9048362, 1.079516, 0, 0, 0, 1, 1,
1.113303, -0.1527891, 3.058751, 0, 0, 0, 1, 1,
1.116438, 0.2351375, 2.29637, 0, 0, 0, 1, 1,
1.12292, 0.4574683, 0.02576364, 1, 1, 1, 1, 1,
1.126131, -0.4998916, 3.245895, 1, 1, 1, 1, 1,
1.130498, 0.03848483, 0.7118639, 1, 1, 1, 1, 1,
1.139671, -1.267533, 1.954245, 1, 1, 1, 1, 1,
1.141942, 1.110021, 0.03861044, 1, 1, 1, 1, 1,
1.144341, 0.2968414, 2.470513, 1, 1, 1, 1, 1,
1.144868, 0.8168271, -0.2136092, 1, 1, 1, 1, 1,
1.15064, 1.669452, -0.3734345, 1, 1, 1, 1, 1,
1.15194, 1.096069, 1.576601, 1, 1, 1, 1, 1,
1.156726, -0.6307269, 3.113697, 1, 1, 1, 1, 1,
1.15765, -0.3817632, 1.41539, 1, 1, 1, 1, 1,
1.159103, 0.4783875, -0.481261, 1, 1, 1, 1, 1,
1.160175, 0.6889578, 2.032214, 1, 1, 1, 1, 1,
1.164781, -3.208259, 1.166243, 1, 1, 1, 1, 1,
1.168702, 0.5043892, 1.166921, 1, 1, 1, 1, 1,
1.169384, -0.2843539, 2.035838, 0, 0, 1, 1, 1,
1.176464, 0.799531, -0.3496204, 1, 0, 0, 1, 1,
1.182477, -1.356378, 1.879884, 1, 0, 0, 1, 1,
1.19017, -0.02089479, 2.01615, 1, 0, 0, 1, 1,
1.20688, 0.6231961, 0.07119366, 1, 0, 0, 1, 1,
1.207533, 0.4632311, 0.9000401, 1, 0, 0, 1, 1,
1.209833, 1.387251, -1.386407, 0, 0, 0, 1, 1,
1.212753, 1.102528, 0.7633454, 0, 0, 0, 1, 1,
1.213975, -0.4815499, 2.367646, 0, 0, 0, 1, 1,
1.214282, 1.000281, 1.477579, 0, 0, 0, 1, 1,
1.214964, -0.2216629, 3.093831, 0, 0, 0, 1, 1,
1.228747, -0.2919986, 4.31735, 0, 0, 0, 1, 1,
1.233009, 1.742697, 0.6933361, 0, 0, 0, 1, 1,
1.236066, 1.302679, -0.1009076, 1, 1, 1, 1, 1,
1.239048, -0.9031254, 1.348687, 1, 1, 1, 1, 1,
1.239274, 0.2205291, 1.803903, 1, 1, 1, 1, 1,
1.244454, -1.686287, 2.30769, 1, 1, 1, 1, 1,
1.245578, -0.794548, 3.33186, 1, 1, 1, 1, 1,
1.250676, -1.541479, 1.685911, 1, 1, 1, 1, 1,
1.263546, -0.4729201, 3.147047, 1, 1, 1, 1, 1,
1.268695, -0.03826334, 2.243017, 1, 1, 1, 1, 1,
1.271624, 0.7038851, 0.2697815, 1, 1, 1, 1, 1,
1.278134, -0.746273, 0.6198864, 1, 1, 1, 1, 1,
1.290975, -1.168994, 0.5641449, 1, 1, 1, 1, 1,
1.293182, 1.475616, 0.008528868, 1, 1, 1, 1, 1,
1.295144, -0.865599, 0.976959, 1, 1, 1, 1, 1,
1.297164, -1.389917, 1.731649, 1, 1, 1, 1, 1,
1.297562, 0.7608793, 1.213056, 1, 1, 1, 1, 1,
1.301455, -1.186395, 2.107095, 0, 0, 1, 1, 1,
1.321165, 0.682302, 1.88356, 1, 0, 0, 1, 1,
1.321689, 0.4259638, 0.7609453, 1, 0, 0, 1, 1,
1.321805, 1.217852, 0.6970059, 1, 0, 0, 1, 1,
1.325043, -0.6272703, 1.674387, 1, 0, 0, 1, 1,
1.330421, -0.5423949, 1.958183, 1, 0, 0, 1, 1,
1.334401, -1.060919, 2.479268, 0, 0, 0, 1, 1,
1.341463, -0.3374762, 2.991504, 0, 0, 0, 1, 1,
1.354294, -0.623247, 1.037305, 0, 0, 0, 1, 1,
1.370497, 1.051152, 0.2479302, 0, 0, 0, 1, 1,
1.372827, 0.6920203, 2.575317, 0, 0, 0, 1, 1,
1.374692, -0.0129101, 2.463624, 0, 0, 0, 1, 1,
1.37603, 1.280893, 0.3346816, 0, 0, 0, 1, 1,
1.398019, -0.3067471, 2.040771, 1, 1, 1, 1, 1,
1.400845, -1.127496, 3.365968, 1, 1, 1, 1, 1,
1.406176, 1.241157, 0.3584658, 1, 1, 1, 1, 1,
1.424068, 0.7648355, 1.090164, 1, 1, 1, 1, 1,
1.441743, -0.2973613, 0.7606121, 1, 1, 1, 1, 1,
1.458466, 0.2340227, 3.516749, 1, 1, 1, 1, 1,
1.48778, 0.4326955, 2.20949, 1, 1, 1, 1, 1,
1.489449, 1.061092, 1.565272, 1, 1, 1, 1, 1,
1.51451, -0.3374996, 1.235836, 1, 1, 1, 1, 1,
1.517823, 0.5150259, 1.215093, 1, 1, 1, 1, 1,
1.529203, -0.4390084, 4.184142, 1, 1, 1, 1, 1,
1.541293, 1.252298, 0.1772761, 1, 1, 1, 1, 1,
1.555298, 0.09343835, 1.687882, 1, 1, 1, 1, 1,
1.559685, 1.091407, 3.006324, 1, 1, 1, 1, 1,
1.582674, -1.075114, 2.884527, 1, 1, 1, 1, 1,
1.587668, -1.382563, 1.01135, 0, 0, 1, 1, 1,
1.587912, -0.1472535, 1.124729, 1, 0, 0, 1, 1,
1.592289, 1.113941, 0.3604941, 1, 0, 0, 1, 1,
1.605647, -0.9200009, 5.633856, 1, 0, 0, 1, 1,
1.621966, 0.5093101, 0.4734871, 1, 0, 0, 1, 1,
1.678166, -0.445582, 2.232779, 1, 0, 0, 1, 1,
1.686039, 0.04885093, 2.109092, 0, 0, 0, 1, 1,
1.690233, -1.20417, 2.221781, 0, 0, 0, 1, 1,
1.70405, 1.961247, 1.861242, 0, 0, 0, 1, 1,
1.708176, 0.3297597, 0.7412474, 0, 0, 0, 1, 1,
1.711144, -0.04432668, 1.40231, 0, 0, 0, 1, 1,
1.721308, 0.5049908, 0.2626417, 0, 0, 0, 1, 1,
1.728535, 0.8809233, 0.8666112, 0, 0, 0, 1, 1,
1.731028, -1.487589, 3.953262, 1, 1, 1, 1, 1,
1.753796, -1.012214, 2.157076, 1, 1, 1, 1, 1,
1.761772, -2.237232, 1.8228, 1, 1, 1, 1, 1,
1.764839, -1.168775, 0.8117466, 1, 1, 1, 1, 1,
1.78819, 1.069653, 2.075662, 1, 1, 1, 1, 1,
1.791012, -0.3801444, 2.589899, 1, 1, 1, 1, 1,
1.807702, 0.07468905, 2.302618, 1, 1, 1, 1, 1,
1.811365, 1.307533, 1.307151, 1, 1, 1, 1, 1,
1.82165, 0.8865767, 3.230037, 1, 1, 1, 1, 1,
1.829842, -0.282418, 2.814628, 1, 1, 1, 1, 1,
1.835408, -0.3176347, 0.7637688, 1, 1, 1, 1, 1,
1.838141, 0.8722719, 1.008654, 1, 1, 1, 1, 1,
1.928039, 0.3436835, 0.7756909, 1, 1, 1, 1, 1,
1.952178, 1.124483, 2.971243, 1, 1, 1, 1, 1,
1.99438, 1.248069, 0.4984301, 1, 1, 1, 1, 1,
2.010397, 0.2124213, 0.5195169, 0, 0, 1, 1, 1,
2.037612, 0.6549025, -0.535543, 1, 0, 0, 1, 1,
2.064315, -0.09140929, 2.077078, 1, 0, 0, 1, 1,
2.09806, -0.3746545, 2.743895, 1, 0, 0, 1, 1,
2.123126, 0.03495893, 2.787731, 1, 0, 0, 1, 1,
2.175687, -0.2225555, 0.7949243, 1, 0, 0, 1, 1,
2.183859, -0.1453532, 0.9902773, 0, 0, 0, 1, 1,
2.195426, 0.6339532, -0.1118971, 0, 0, 0, 1, 1,
2.202316, 0.7311934, 1.818294, 0, 0, 0, 1, 1,
2.20906, -0.7779145, 2.552958, 0, 0, 0, 1, 1,
2.210402, 0.01567386, 3.162339, 0, 0, 0, 1, 1,
2.223851, 0.847317, 2.428666, 0, 0, 0, 1, 1,
2.226906, 0.6107469, 1.727867, 0, 0, 0, 1, 1,
2.308288, 0.8244093, 1.943776, 1, 1, 1, 1, 1,
2.31069, -0.3615904, 2.549048, 1, 1, 1, 1, 1,
2.357422, 0.2343801, 1.69413, 1, 1, 1, 1, 1,
2.47023, 2.413677, 0.3910905, 1, 1, 1, 1, 1,
2.682332, 1.189583, 2.657831, 1, 1, 1, 1, 1,
2.789997, 0.4273223, 2.451483, 1, 1, 1, 1, 1,
2.845989, -1.177306, 0.2855113, 1, 1, 1, 1, 1
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
var radius = 9.704721;
var distance = 34.08742;
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
mvMatrix.translate( 0.1161505, -0.1302536, -0.3460631 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.08742);
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
