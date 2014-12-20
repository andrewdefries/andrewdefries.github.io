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
-3.123699, 0.4093232, -1.59948, 1, 0, 0, 1,
-3.113774, -0.7394829, -3.405425, 1, 0.007843138, 0, 1,
-3.113716, -0.5660247, 0.5037406, 1, 0.01176471, 0, 1,
-3.019132, 0.6731577, -3.077727, 1, 0.01960784, 0, 1,
-2.73629, 0.1547905, -1.561754, 1, 0.02352941, 0, 1,
-2.688084, -0.9117884, -2.012505, 1, 0.03137255, 0, 1,
-2.601668, 0.2677914, 0.1851522, 1, 0.03529412, 0, 1,
-2.601539, -0.45569, 0.2543251, 1, 0.04313726, 0, 1,
-2.439409, -1.255251, -0.5264906, 1, 0.04705882, 0, 1,
-2.411484, 0.1542751, -2.034147, 1, 0.05490196, 0, 1,
-2.203462, 1.287561, -0.870501, 1, 0.05882353, 0, 1,
-2.168119, 0.2965472, -1.008611, 1, 0.06666667, 0, 1,
-2.141461, 0.6910914, -0.3614404, 1, 0.07058824, 0, 1,
-2.134114, -0.5884079, -3.427704, 1, 0.07843138, 0, 1,
-2.127811, 1.010234, -0.9780577, 1, 0.08235294, 0, 1,
-2.119035, -1.570441, -1.527982, 1, 0.09019608, 0, 1,
-2.077062, -0.7104468, -1.162407, 1, 0.09411765, 0, 1,
-2.06503, -0.7970153, -2.273465, 1, 0.1019608, 0, 1,
-2.052386, 0.5552778, -1.849516, 1, 0.1098039, 0, 1,
-2.042555, -1.183011, -1.339355, 1, 0.1137255, 0, 1,
-2.040301, 0.5135574, -1.698648, 1, 0.1215686, 0, 1,
-2.028217, 0.6816021, -2.109532, 1, 0.1254902, 0, 1,
-2.027268, 0.802152, -1.5104, 1, 0.1333333, 0, 1,
-1.99826, -0.571717, -2.500676, 1, 0.1372549, 0, 1,
-1.973857, -1.018778, -2.502625, 1, 0.145098, 0, 1,
-1.969968, -1.197631, -4.568692, 1, 0.1490196, 0, 1,
-1.948294, 0.379286, 0.4094249, 1, 0.1568628, 0, 1,
-1.922323, -1.493704, -2.663809, 1, 0.1607843, 0, 1,
-1.908253, 0.8521541, -0.556258, 1, 0.1686275, 0, 1,
-1.867615, 0.063402, -0.9084114, 1, 0.172549, 0, 1,
-1.854337, 0.4390422, -0.4735821, 1, 0.1803922, 0, 1,
-1.852284, 0.2043694, -0.7526308, 1, 0.1843137, 0, 1,
-1.848909, -0.8310312, -2.850558, 1, 0.1921569, 0, 1,
-1.823276, 2.900857, 0.7925062, 1, 0.1960784, 0, 1,
-1.820349, 0.5583593, 0.7049104, 1, 0.2039216, 0, 1,
-1.818982, 1.707664, -0.1718911, 1, 0.2117647, 0, 1,
-1.795035, -0.1677395, -2.373909, 1, 0.2156863, 0, 1,
-1.794575, -2.29932, -2.134498, 1, 0.2235294, 0, 1,
-1.785188, -0.6317401, -2.634203, 1, 0.227451, 0, 1,
-1.778757, 0.3645369, -0.9397703, 1, 0.2352941, 0, 1,
-1.769086, 0.4396621, -0.09533612, 1, 0.2392157, 0, 1,
-1.752638, 0.6316947, 0.5077972, 1, 0.2470588, 0, 1,
-1.732493, -0.083845, -0.1298718, 1, 0.2509804, 0, 1,
-1.706547, 0.5161122, -1.430526, 1, 0.2588235, 0, 1,
-1.634503, 0.540044, -1.609408, 1, 0.2627451, 0, 1,
-1.622918, 0.6967373, -1.82834, 1, 0.2705882, 0, 1,
-1.618517, -0.3326766, -2.731608, 1, 0.2745098, 0, 1,
-1.606681, 0.6604465, 1.43176, 1, 0.282353, 0, 1,
-1.605558, 0.6893827, -0.7726938, 1, 0.2862745, 0, 1,
-1.578627, 0.3813072, -3.380965, 1, 0.2941177, 0, 1,
-1.576893, 0.6368816, -1.245874, 1, 0.3019608, 0, 1,
-1.57053, 0.226641, -1.36582, 1, 0.3058824, 0, 1,
-1.569232, -0.3840903, -2.566404, 1, 0.3137255, 0, 1,
-1.568704, 0.7548264, -2.708013, 1, 0.3176471, 0, 1,
-1.557062, 0.5767221, 0.1948884, 1, 0.3254902, 0, 1,
-1.550389, 0.02345476, -1.371998, 1, 0.3294118, 0, 1,
-1.516517, 0.1643208, -0.9341972, 1, 0.3372549, 0, 1,
-1.50873, 1.014846, -0.9299282, 1, 0.3411765, 0, 1,
-1.503869, 0.3207281, -1.492398, 1, 0.3490196, 0, 1,
-1.491129, 0.07171374, -1.187872, 1, 0.3529412, 0, 1,
-1.487705, 0.7936084, -2.048462, 1, 0.3607843, 0, 1,
-1.487018, -1.982193, -3.402269, 1, 0.3647059, 0, 1,
-1.476788, 0.04238814, -1.418274, 1, 0.372549, 0, 1,
-1.475589, 0.1463661, -0.3111428, 1, 0.3764706, 0, 1,
-1.464956, -1.986005, -1.435524, 1, 0.3843137, 0, 1,
-1.459309, -0.06086449, -1.131107, 1, 0.3882353, 0, 1,
-1.456652, 1.20147, 1.096857, 1, 0.3960784, 0, 1,
-1.445732, -0.8283218, -2.53219, 1, 0.4039216, 0, 1,
-1.431376, -1.154159, -1.431857, 1, 0.4078431, 0, 1,
-1.429809, -0.164369, -3.071067, 1, 0.4156863, 0, 1,
-1.421985, 0.1136837, -1.516439, 1, 0.4196078, 0, 1,
-1.416875, 0.7456202, -2.950044, 1, 0.427451, 0, 1,
-1.411803, -0.05568445, -2.56516, 1, 0.4313726, 0, 1,
-1.40804, -0.2263937, -2.972322, 1, 0.4392157, 0, 1,
-1.403453, -0.3039216, -1.078515, 1, 0.4431373, 0, 1,
-1.398932, 0.09350417, -1.098495, 1, 0.4509804, 0, 1,
-1.390295, 0.355414, -1.630778, 1, 0.454902, 0, 1,
-1.376533, -0.6462144, -2.012254, 1, 0.4627451, 0, 1,
-1.374094, 0.6184154, -0.919355, 1, 0.4666667, 0, 1,
-1.371826, 1.276736, -0.9994076, 1, 0.4745098, 0, 1,
-1.370898, 1.139767, -1.759327, 1, 0.4784314, 0, 1,
-1.360432, 0.2133411, -2.415455, 1, 0.4862745, 0, 1,
-1.356237, -1.541688, -0.7827748, 1, 0.4901961, 0, 1,
-1.354032, 0.8750689, -1.002549, 1, 0.4980392, 0, 1,
-1.350593, -0.1345005, -3.514133, 1, 0.5058824, 0, 1,
-1.348506, -2.288438, -2.058774, 1, 0.509804, 0, 1,
-1.34593, -0.3927531, -0.6744515, 1, 0.5176471, 0, 1,
-1.338647, 1.683896, -2.154473, 1, 0.5215687, 0, 1,
-1.335299, -0.1569755, -2.580026, 1, 0.5294118, 0, 1,
-1.331965, 0.627142, 0.8966175, 1, 0.5333334, 0, 1,
-1.329046, 0.2717404, -1.154539, 1, 0.5411765, 0, 1,
-1.328061, -0.9557409, -3.943077, 1, 0.5450981, 0, 1,
-1.327533, -1.995173, -3.915047, 1, 0.5529412, 0, 1,
-1.324581, 1.443302, -0.5137205, 1, 0.5568628, 0, 1,
-1.312279, 1.814042, 1.04737, 1, 0.5647059, 0, 1,
-1.307521, 0.5643609, -1.151362, 1, 0.5686275, 0, 1,
-1.281882, -0.4716055, -2.698798, 1, 0.5764706, 0, 1,
-1.279505, -0.2186126, -3.13585, 1, 0.5803922, 0, 1,
-1.275162, 0.4406018, -1.070901, 1, 0.5882353, 0, 1,
-1.268165, -0.4000438, -0.9462563, 1, 0.5921569, 0, 1,
-1.26413, 1.654054, -0.8466052, 1, 0.6, 0, 1,
-1.263781, -0.006640258, -2.129938, 1, 0.6078432, 0, 1,
-1.258441, 1.236781, -1.552182, 1, 0.6117647, 0, 1,
-1.257793, -0.3227752, -1.28918, 1, 0.6196079, 0, 1,
-1.247283, 0.3832684, -2.24996, 1, 0.6235294, 0, 1,
-1.244937, 0.8066784, -0.3263353, 1, 0.6313726, 0, 1,
-1.240302, 0.840724, -0.0714502, 1, 0.6352941, 0, 1,
-1.2403, -1.540089, -2.991977, 1, 0.6431373, 0, 1,
-1.237044, 1.66447, 1.025951, 1, 0.6470588, 0, 1,
-1.235824, -0.05805226, 0.633012, 1, 0.654902, 0, 1,
-1.234861, 0.05264708, 0.3467687, 1, 0.6588235, 0, 1,
-1.231433, -0.2950509, -3.371936, 1, 0.6666667, 0, 1,
-1.221437, -1.184396, -3.51121, 1, 0.6705883, 0, 1,
-1.216747, 1.279459, -0.1043738, 1, 0.6784314, 0, 1,
-1.216395, 0.01266897, -1.645521, 1, 0.682353, 0, 1,
-1.211556, -1.091876, -2.296842, 1, 0.6901961, 0, 1,
-1.211171, 0.6378812, -1.685445, 1, 0.6941177, 0, 1,
-1.208858, -0.4686581, -0.7021905, 1, 0.7019608, 0, 1,
-1.208298, 0.1294665, -1.970745, 1, 0.7098039, 0, 1,
-1.20467, -2.615524, -2.342985, 1, 0.7137255, 0, 1,
-1.20453, 0.2962531, -0.552415, 1, 0.7215686, 0, 1,
-1.20274, -0.836538, -2.60451, 1, 0.7254902, 0, 1,
-1.201309, -1.014727, -0.8612745, 1, 0.7333333, 0, 1,
-1.200969, 1.669196, -2.350435, 1, 0.7372549, 0, 1,
-1.188683, -0.7969241, -1.425536, 1, 0.7450981, 0, 1,
-1.186235, 1.125243, 0.7838939, 1, 0.7490196, 0, 1,
-1.185689, 1.079043, -1.392794, 1, 0.7568628, 0, 1,
-1.181594, 1.366719, -1.349865, 1, 0.7607843, 0, 1,
-1.174912, 0.2433926, -0.2670192, 1, 0.7686275, 0, 1,
-1.17322, -0.858115, -2.47335, 1, 0.772549, 0, 1,
-1.170076, -0.9268182, -2.37209, 1, 0.7803922, 0, 1,
-1.165741, -0.1973861, -3.142568, 1, 0.7843137, 0, 1,
-1.161573, -0.7271575, -3.075557, 1, 0.7921569, 0, 1,
-1.158188, -0.3397276, -1.485182, 1, 0.7960784, 0, 1,
-1.158147, 0.4263235, -1.684549, 1, 0.8039216, 0, 1,
-1.155336, 2.249979, -2.217463, 1, 0.8117647, 0, 1,
-1.155319, -1.305072, -1.478834, 1, 0.8156863, 0, 1,
-1.150874, -0.6341166, -3.284667, 1, 0.8235294, 0, 1,
-1.144187, 0.6062812, -2.229408, 1, 0.827451, 0, 1,
-1.143047, -0.09485751, -1.112137, 1, 0.8352941, 0, 1,
-1.142078, -0.4113477, -3.0438, 1, 0.8392157, 0, 1,
-1.140483, 0.8078117, -1.489804, 1, 0.8470588, 0, 1,
-1.137425, -1.364405, -1.658195, 1, 0.8509804, 0, 1,
-1.11765, -1.842233, -3.242235, 1, 0.8588235, 0, 1,
-1.109907, -1.328817, -1.95549, 1, 0.8627451, 0, 1,
-1.104893, -0.5349698, -1.387802, 1, 0.8705882, 0, 1,
-1.099378, -0.1507016, -2.729953, 1, 0.8745098, 0, 1,
-1.096214, 1.784296, -1.532065, 1, 0.8823529, 0, 1,
-1.091991, 0.4703178, -0.6772351, 1, 0.8862745, 0, 1,
-1.076956, 0.9695082, -0.9591742, 1, 0.8941177, 0, 1,
-1.073441, -2.417323, -4.495173, 1, 0.8980392, 0, 1,
-1.070029, -0.4857687, -0.3677896, 1, 0.9058824, 0, 1,
-1.06954, 0.7217145, 0.3196461, 1, 0.9137255, 0, 1,
-1.068671, -1.361571, -2.879228, 1, 0.9176471, 0, 1,
-1.063421, 0.2617749, 1.214876, 1, 0.9254902, 0, 1,
-1.05289, 0.2343264, -2.511812, 1, 0.9294118, 0, 1,
-1.041854, 0.2739507, -0.9827884, 1, 0.9372549, 0, 1,
-1.038951, 0.4464745, -1.712754, 1, 0.9411765, 0, 1,
-1.037279, -0.6753866, -2.64126, 1, 0.9490196, 0, 1,
-1.036948, 1.420641, -1.804492, 1, 0.9529412, 0, 1,
-1.03373, 1.586114, 0.1496309, 1, 0.9607843, 0, 1,
-1.02379, 0.8568932, -2.119049, 1, 0.9647059, 0, 1,
-1.023358, -0.2916068, -3.414137, 1, 0.972549, 0, 1,
-1.020562, 0.09172743, -1.052532, 1, 0.9764706, 0, 1,
-1.012393, -0.8084651, -2.743904, 1, 0.9843137, 0, 1,
-1.009866, 2.08252, -1.52379, 1, 0.9882353, 0, 1,
-1.007108, 0.1354999, -0.8111809, 1, 0.9960784, 0, 1,
-1.0028, 0.6341175, -1.098664, 0.9960784, 1, 0, 1,
-0.9981137, -0.5381985, -3.060759, 0.9921569, 1, 0, 1,
-0.9951404, 0.1153131, -1.968118, 0.9843137, 1, 0, 1,
-0.9944995, -1.906941, -0.5960256, 0.9803922, 1, 0, 1,
-0.993916, -0.9200354, -2.341014, 0.972549, 1, 0, 1,
-0.9925109, -0.6638681, -1.910737, 0.9686275, 1, 0, 1,
-0.9912384, -0.3960468, -4.619669, 0.9607843, 1, 0, 1,
-0.9874971, 0.1856273, -1.753879, 0.9568627, 1, 0, 1,
-0.9789876, 0.2621655, -2.037617, 0.9490196, 1, 0, 1,
-0.9779552, 1.264688, 0.1178209, 0.945098, 1, 0, 1,
-0.9776601, -1.287611, -4.197145, 0.9372549, 1, 0, 1,
-0.9721043, 1.754398, -1.580197, 0.9333333, 1, 0, 1,
-0.9685354, 1.731784, -0.1763499, 0.9254902, 1, 0, 1,
-0.9673514, 0.6424985, -1.143939, 0.9215686, 1, 0, 1,
-0.9662958, 0.4828957, -1.869215, 0.9137255, 1, 0, 1,
-0.9642879, 0.8285481, -0.3611646, 0.9098039, 1, 0, 1,
-0.962314, 0.7895502, 0.6170955, 0.9019608, 1, 0, 1,
-0.9550852, 0.1841639, -1.53816, 0.8941177, 1, 0, 1,
-0.9547322, 0.9702913, -1.044825, 0.8901961, 1, 0, 1,
-0.9543193, -0.1590008, -1.872159, 0.8823529, 1, 0, 1,
-0.9468337, -1.40116, -4.452284, 0.8784314, 1, 0, 1,
-0.9467929, -0.518997, -1.767265, 0.8705882, 1, 0, 1,
-0.9366525, -0.6101448, -1.365883, 0.8666667, 1, 0, 1,
-0.9265006, 0.3556197, -1.337351, 0.8588235, 1, 0, 1,
-0.9237482, 0.3281192, -0.5442476, 0.854902, 1, 0, 1,
-0.9183795, 1.353258, -2.553899, 0.8470588, 1, 0, 1,
-0.9100014, -1.248446, -1.546425, 0.8431373, 1, 0, 1,
-0.9083523, 0.3105719, -2.327121, 0.8352941, 1, 0, 1,
-0.9023429, 1.090862, -1.489772, 0.8313726, 1, 0, 1,
-0.885771, 1.207617, 1.496729, 0.8235294, 1, 0, 1,
-0.876764, 1.584284, -1.465862, 0.8196079, 1, 0, 1,
-0.871812, 0.2421054, -0.9092923, 0.8117647, 1, 0, 1,
-0.8657133, -0.2463739, -0.754021, 0.8078431, 1, 0, 1,
-0.8633112, -0.2043298, -2.998854, 0.8, 1, 0, 1,
-0.8594599, 0.9442714, -0.3841742, 0.7921569, 1, 0, 1,
-0.8590026, 0.9593797, -2.184772, 0.7882353, 1, 0, 1,
-0.8564308, 0.1738365, -1.671287, 0.7803922, 1, 0, 1,
-0.8540622, 1.140923, -0.9052196, 0.7764706, 1, 0, 1,
-0.8535183, 1.491091, -0.6687754, 0.7686275, 1, 0, 1,
-0.8478171, -0.6289648, -1.292359, 0.7647059, 1, 0, 1,
-0.8404145, 0.05556737, -2.338839, 0.7568628, 1, 0, 1,
-0.8381602, -1.642562, -1.274776, 0.7529412, 1, 0, 1,
-0.8364307, -0.2665646, -0.4766729, 0.7450981, 1, 0, 1,
-0.825266, -0.1042204, -0.3400795, 0.7411765, 1, 0, 1,
-0.8249074, -0.4111635, -2.028336, 0.7333333, 1, 0, 1,
-0.8192616, -0.5933626, -3.288096, 0.7294118, 1, 0, 1,
-0.8078565, -0.985016, -2.225467, 0.7215686, 1, 0, 1,
-0.8037289, -0.01439805, -3.13112, 0.7176471, 1, 0, 1,
-0.7974103, 0.1895441, -1.2016, 0.7098039, 1, 0, 1,
-0.7948946, -0.568163, -3.155671, 0.7058824, 1, 0, 1,
-0.7875094, -1.745327, -2.981328, 0.6980392, 1, 0, 1,
-0.7846052, -0.2458785, -1.541274, 0.6901961, 1, 0, 1,
-0.7840422, 0.06923484, -2.835269, 0.6862745, 1, 0, 1,
-0.7798051, 0.3495581, -0.6716815, 0.6784314, 1, 0, 1,
-0.7701548, 0.5392842, -0.50538, 0.6745098, 1, 0, 1,
-0.766178, 0.3326221, -0.7268079, 0.6666667, 1, 0, 1,
-0.7661449, 0.3283773, -1.601868, 0.6627451, 1, 0, 1,
-0.7651139, 1.444127, -1.494441, 0.654902, 1, 0, 1,
-0.7644477, -0.4237055, -1.087491, 0.6509804, 1, 0, 1,
-0.7612863, -0.1598596, -1.723845, 0.6431373, 1, 0, 1,
-0.7612046, -0.1603532, -1.047658, 0.6392157, 1, 0, 1,
-0.7598975, 1.062192, 0.91579, 0.6313726, 1, 0, 1,
-0.7586233, 0.3665271, -0.9203119, 0.627451, 1, 0, 1,
-0.7562906, 1.481009, -0.006283648, 0.6196079, 1, 0, 1,
-0.7518267, 0.4250429, -1.477956, 0.6156863, 1, 0, 1,
-0.7479623, 0.9235331, -1.696096, 0.6078432, 1, 0, 1,
-0.747126, 0.07748125, -3.061811, 0.6039216, 1, 0, 1,
-0.7464708, -0.4470088, -2.061279, 0.5960785, 1, 0, 1,
-0.7411293, -0.05924355, -1.71104, 0.5882353, 1, 0, 1,
-0.7370754, 0.4924995, 0.3488501, 0.5843138, 1, 0, 1,
-0.736863, -2.226806, -2.670488, 0.5764706, 1, 0, 1,
-0.7365181, -0.6591299, -1.231952, 0.572549, 1, 0, 1,
-0.7325032, -1.057912, -0.875852, 0.5647059, 1, 0, 1,
-0.7320523, -2.118352, -3.61013, 0.5607843, 1, 0, 1,
-0.730946, -1.416997, -1.07312, 0.5529412, 1, 0, 1,
-0.719122, -0.1699847, -2.151121, 0.5490196, 1, 0, 1,
-0.717234, -0.06520486, -3.524335, 0.5411765, 1, 0, 1,
-0.710552, 0.1705099, -0.8739521, 0.5372549, 1, 0, 1,
-0.7096328, 2.385513, -0.6517252, 0.5294118, 1, 0, 1,
-0.7083586, -0.1588647, -4.061648, 0.5254902, 1, 0, 1,
-0.707131, -0.6817524, -1.733168, 0.5176471, 1, 0, 1,
-0.7006119, 0.409071, -0.277253, 0.5137255, 1, 0, 1,
-0.6986569, -0.9785281, -3.478769, 0.5058824, 1, 0, 1,
-0.6969043, 0.8279554, -0.8885365, 0.5019608, 1, 0, 1,
-0.6968755, -0.2513872, -2.438993, 0.4941176, 1, 0, 1,
-0.6858666, 0.07218359, -0.6957801, 0.4862745, 1, 0, 1,
-0.6824565, -0.6578909, -1.873882, 0.4823529, 1, 0, 1,
-0.6817768, -0.4444685, -1.857472, 0.4745098, 1, 0, 1,
-0.6817538, -0.6825243, -2.147615, 0.4705882, 1, 0, 1,
-0.679998, 0.4701328, 0.2283233, 0.4627451, 1, 0, 1,
-0.6794567, -1.256066, -1.479506, 0.4588235, 1, 0, 1,
-0.6747732, -1.827098, -2.206539, 0.4509804, 1, 0, 1,
-0.6709426, 0.2375651, -0.05075548, 0.4470588, 1, 0, 1,
-0.6691142, 0.04176078, -1.953598, 0.4392157, 1, 0, 1,
-0.6668622, -0.5301442, -0.9997321, 0.4352941, 1, 0, 1,
-0.6645252, 1.013414, 1.513895, 0.427451, 1, 0, 1,
-0.6557265, 0.04037792, -1.793247, 0.4235294, 1, 0, 1,
-0.6503085, 0.3719844, -0.468545, 0.4156863, 1, 0, 1,
-0.6415886, -0.4874316, -2.410713, 0.4117647, 1, 0, 1,
-0.6360134, 0.3299207, -2.119942, 0.4039216, 1, 0, 1,
-0.6278984, -0.2933018, -2.102, 0.3960784, 1, 0, 1,
-0.6253375, -0.3164846, -0.7337602, 0.3921569, 1, 0, 1,
-0.6218522, 0.2652794, -2.640175, 0.3843137, 1, 0, 1,
-0.6215695, 1.412318, -0.6443497, 0.3803922, 1, 0, 1,
-0.6211563, -0.9548116, -3.307761, 0.372549, 1, 0, 1,
-0.6193066, 0.1238945, -1.31357, 0.3686275, 1, 0, 1,
-0.6187786, -0.922559, -3.599702, 0.3607843, 1, 0, 1,
-0.6158246, 0.2177794, -1.76296, 0.3568628, 1, 0, 1,
-0.6134081, -0.04351063, -1.235415, 0.3490196, 1, 0, 1,
-0.6132149, 1.742335, 0.6627564, 0.345098, 1, 0, 1,
-0.6129323, -1.521893, -4.385586, 0.3372549, 1, 0, 1,
-0.6019481, 0.9926494, 0.4837969, 0.3333333, 1, 0, 1,
-0.5981817, 0.6653134, 1.118075, 0.3254902, 1, 0, 1,
-0.5822571, -0.828722, -4.547942, 0.3215686, 1, 0, 1,
-0.5817878, 0.5835484, 1.381565, 0.3137255, 1, 0, 1,
-0.5685242, 1.778279, -0.868098, 0.3098039, 1, 0, 1,
-0.5643488, 1.007512, -0.4912585, 0.3019608, 1, 0, 1,
-0.5632041, 0.624985, -0.7883151, 0.2941177, 1, 0, 1,
-0.5620456, -1.059863, -3.769212, 0.2901961, 1, 0, 1,
-0.5611563, 1.466814, -0.2362309, 0.282353, 1, 0, 1,
-0.556452, 1.06333, -1.987132, 0.2784314, 1, 0, 1,
-0.552139, -1.23982, -3.223158, 0.2705882, 1, 0, 1,
-0.5363043, 0.6810517, -0.713366, 0.2666667, 1, 0, 1,
-0.5329047, 0.02397545, -1.924667, 0.2588235, 1, 0, 1,
-0.5323605, -0.6524219, -3.496495, 0.254902, 1, 0, 1,
-0.525519, -1.344582, -3.492893, 0.2470588, 1, 0, 1,
-0.5192156, -0.1288767, -3.107097, 0.2431373, 1, 0, 1,
-0.5162809, 0.4367103, -0.06088025, 0.2352941, 1, 0, 1,
-0.5161829, -0.5535033, -3.442555, 0.2313726, 1, 0, 1,
-0.5157236, -0.3979174, -1.260343, 0.2235294, 1, 0, 1,
-0.5148568, -0.7437567, -1.14744, 0.2196078, 1, 0, 1,
-0.5143526, 0.4907069, -1.735879, 0.2117647, 1, 0, 1,
-0.5103145, 2.146353, 0.1037242, 0.2078431, 1, 0, 1,
-0.504838, -0.7555215, -3.429918, 0.2, 1, 0, 1,
-0.5024857, -0.1309583, -1.307483, 0.1921569, 1, 0, 1,
-0.5018266, 1.086439, -0.9389889, 0.1882353, 1, 0, 1,
-0.4970424, -0.4170889, 0.0971372, 0.1803922, 1, 0, 1,
-0.4952336, 0.323753, -2.358612, 0.1764706, 1, 0, 1,
-0.4947003, -0.1611295, -2.405998, 0.1686275, 1, 0, 1,
-0.4872544, 0.8769529, -0.8702837, 0.1647059, 1, 0, 1,
-0.4824243, 0.3433561, -1.295403, 0.1568628, 1, 0, 1,
-0.4824153, 2.367018, -1.866749, 0.1529412, 1, 0, 1,
-0.4782926, 0.9389453, 0.2807396, 0.145098, 1, 0, 1,
-0.4763294, 1.471362, -0.2002039, 0.1411765, 1, 0, 1,
-0.4760691, 0.1412082, -1.236836, 0.1333333, 1, 0, 1,
-0.4735869, -2.294559, -2.691986, 0.1294118, 1, 0, 1,
-0.4720729, -0.5869352, -2.661271, 0.1215686, 1, 0, 1,
-0.4718554, -0.07117645, -3.120163, 0.1176471, 1, 0, 1,
-0.4663326, -1.125009, -3.243553, 0.1098039, 1, 0, 1,
-0.4626074, -0.4474897, -3.326912, 0.1058824, 1, 0, 1,
-0.4619302, -1.605888, -4.982275, 0.09803922, 1, 0, 1,
-0.4564609, 1.110045, 1.059532, 0.09019608, 1, 0, 1,
-0.4562574, 0.8941752, -0.2327551, 0.08627451, 1, 0, 1,
-0.4536622, -1.783034, -3.97254, 0.07843138, 1, 0, 1,
-0.4469149, -1.184776, -2.178997, 0.07450981, 1, 0, 1,
-0.437868, -0.102841, -0.2662784, 0.06666667, 1, 0, 1,
-0.4266094, -1.448536, -3.482893, 0.0627451, 1, 0, 1,
-0.4238251, -1.330117, -2.102136, 0.05490196, 1, 0, 1,
-0.4236332, -1.769814, -4.568814, 0.05098039, 1, 0, 1,
-0.4157098, 0.9242101, 0.1121137, 0.04313726, 1, 0, 1,
-0.4138742, 0.8886808, 0.120135, 0.03921569, 1, 0, 1,
-0.4114298, 1.267444, -0.4881603, 0.03137255, 1, 0, 1,
-0.4093311, -0.005636037, -1.778302, 0.02745098, 1, 0, 1,
-0.4047608, -0.2435583, -1.396233, 0.01960784, 1, 0, 1,
-0.4034852, -0.06562827, 0.06704227, 0.01568628, 1, 0, 1,
-0.4018595, -0.1575916, -1.92136, 0.007843138, 1, 0, 1,
-0.4016669, 1.196571, -0.2000332, 0.003921569, 1, 0, 1,
-0.3979138, 0.7854035, -0.7765082, 0, 1, 0.003921569, 1,
-0.3882675, 0.628993, 0.09331845, 0, 1, 0.01176471, 1,
-0.3869858, -0.475545, -1.152498, 0, 1, 0.01568628, 1,
-0.3851945, 2.009107, 0.7911017, 0, 1, 0.02352941, 1,
-0.3842104, 1.047618, -0.2076091, 0, 1, 0.02745098, 1,
-0.383333, 2.385297, 0.7842557, 0, 1, 0.03529412, 1,
-0.3791602, 0.7201672, -0.1759385, 0, 1, 0.03921569, 1,
-0.3778719, -0.03096217, -2.563509, 0, 1, 0.04705882, 1,
-0.3691234, -0.3093455, -2.118581, 0, 1, 0.05098039, 1,
-0.3653482, -1.402463, -4.411384, 0, 1, 0.05882353, 1,
-0.3563921, 0.4342677, -1.73066, 0, 1, 0.0627451, 1,
-0.354021, -0.4793456, -2.357506, 0, 1, 0.07058824, 1,
-0.3529065, 1.833718, -0.7316955, 0, 1, 0.07450981, 1,
-0.350329, 0.2842192, -0.1298194, 0, 1, 0.08235294, 1,
-0.3409677, -1.271718, -3.361068, 0, 1, 0.08627451, 1,
-0.3395091, -2.781649, -3.354992, 0, 1, 0.09411765, 1,
-0.3327499, 0.1555316, 0.6655268, 0, 1, 0.1019608, 1,
-0.3298283, 0.6698608, -2.071954, 0, 1, 0.1058824, 1,
-0.3256384, 0.3582839, -1.405326, 0, 1, 0.1137255, 1,
-0.3200803, -2.336037, -4.719126, 0, 1, 0.1176471, 1,
-0.3109525, -0.7413526, -1.637827, 0, 1, 0.1254902, 1,
-0.3007383, -0.08770741, -0.6364636, 0, 1, 0.1294118, 1,
-0.2988861, -0.6746548, -1.75278, 0, 1, 0.1372549, 1,
-0.2948184, 0.2753733, 0.08852256, 0, 1, 0.1411765, 1,
-0.2934815, -0.3098353, -1.874161, 0, 1, 0.1490196, 1,
-0.2891601, -0.5349093, -3.630032, 0, 1, 0.1529412, 1,
-0.2863754, -0.6235396, -2.538904, 0, 1, 0.1607843, 1,
-0.2793641, -0.4055178, -3.592835, 0, 1, 0.1647059, 1,
-0.2791748, 0.4619767, -0.9133371, 0, 1, 0.172549, 1,
-0.2760319, -1.18054, -3.178281, 0, 1, 0.1764706, 1,
-0.2735141, 0.1725352, -0.0883095, 0, 1, 0.1843137, 1,
-0.2695744, 0.5586492, -0.716558, 0, 1, 0.1882353, 1,
-0.2691399, 0.08643279, -0.8869325, 0, 1, 0.1960784, 1,
-0.2683987, 0.01574579, -2.56045, 0, 1, 0.2039216, 1,
-0.2665223, 1.593742, -0.2238363, 0, 1, 0.2078431, 1,
-0.2631485, -0.6267901, -1.711959, 0, 1, 0.2156863, 1,
-0.2624303, 0.623814, -1.008685, 0, 1, 0.2196078, 1,
-0.2623536, 0.316776, -0.5673443, 0, 1, 0.227451, 1,
-0.261923, -0.0550843, -2.199669, 0, 1, 0.2313726, 1,
-0.2606029, -0.6879728, -3.187381, 0, 1, 0.2392157, 1,
-0.2593456, -0.726482, -4.659724, 0, 1, 0.2431373, 1,
-0.2541758, 1.507404, 1.108758, 0, 1, 0.2509804, 1,
-0.2513473, -0.9013451, -2.140619, 0, 1, 0.254902, 1,
-0.2501101, -1.136409, -1.962639, 0, 1, 0.2627451, 1,
-0.2487182, -1.182334, -5.275322, 0, 1, 0.2666667, 1,
-0.248684, -1.093443, -3.685918, 0, 1, 0.2745098, 1,
-0.2428622, -0.07955762, -2.819363, 0, 1, 0.2784314, 1,
-0.2420395, -0.7456985, -2.193861, 0, 1, 0.2862745, 1,
-0.2414178, 2.093799, -0.619889, 0, 1, 0.2901961, 1,
-0.238642, -1.195862, -2.615093, 0, 1, 0.2980392, 1,
-0.2385537, -1.370217, -1.619899, 0, 1, 0.3058824, 1,
-0.2337903, 0.2668481, 0.9307836, 0, 1, 0.3098039, 1,
-0.2335149, -0.9525236, -3.696379, 0, 1, 0.3176471, 1,
-0.2333864, -0.1656598, -3.065304, 0, 1, 0.3215686, 1,
-0.2286687, -0.3893248, -3.630737, 0, 1, 0.3294118, 1,
-0.2277564, -0.2045498, -1.488182, 0, 1, 0.3333333, 1,
-0.2267023, -0.8937615, -2.765096, 0, 1, 0.3411765, 1,
-0.2254549, 0.4348038, 0.6555672, 0, 1, 0.345098, 1,
-0.2253618, -3.762601, -3.057119, 0, 1, 0.3529412, 1,
-0.223983, -0.1371634, -1.604676, 0, 1, 0.3568628, 1,
-0.2237436, -0.9167334, -2.57937, 0, 1, 0.3647059, 1,
-0.2195414, -1.056644, -2.660669, 0, 1, 0.3686275, 1,
-0.219133, -0.655578, -0.4188532, 0, 1, 0.3764706, 1,
-0.2189095, -0.3769939, -2.177263, 0, 1, 0.3803922, 1,
-0.2160502, 1.699333, 1.095197, 0, 1, 0.3882353, 1,
-0.2148898, 0.6644337, -0.4580305, 0, 1, 0.3921569, 1,
-0.2130852, -0.3039931, -2.728269, 0, 1, 0.4, 1,
-0.2110783, 0.2652401, -0.5028475, 0, 1, 0.4078431, 1,
-0.2086628, -0.7381139, -4.443342, 0, 1, 0.4117647, 1,
-0.2021727, -0.304465, -3.825338, 0, 1, 0.4196078, 1,
-0.2008259, 1.664035, -0.8832533, 0, 1, 0.4235294, 1,
-0.1990558, -0.2073597, -2.630901, 0, 1, 0.4313726, 1,
-0.1990549, -0.8883541, -1.861892, 0, 1, 0.4352941, 1,
-0.1988761, -0.8607743, -2.759898, 0, 1, 0.4431373, 1,
-0.1968195, 0.6120056, -0.3792023, 0, 1, 0.4470588, 1,
-0.1967387, -5.012645e-05, -0.939229, 0, 1, 0.454902, 1,
-0.1951462, -0.3299385, -4.481701, 0, 1, 0.4588235, 1,
-0.1917862, -1.10514, -1.185403, 0, 1, 0.4666667, 1,
-0.1865603, -0.05682961, -3.381323, 0, 1, 0.4705882, 1,
-0.1769607, 0.8943996, -0.2414182, 0, 1, 0.4784314, 1,
-0.1755589, 0.2620899, -0.8162389, 0, 1, 0.4823529, 1,
-0.1687946, 0.5551385, -0.6638675, 0, 1, 0.4901961, 1,
-0.1641766, -1.899166, -3.387577, 0, 1, 0.4941176, 1,
-0.1635308, 1.055635, -0.09921184, 0, 1, 0.5019608, 1,
-0.1614476, -0.5582076, -2.314967, 0, 1, 0.509804, 1,
-0.1603251, 0.1820835, 0.7824634, 0, 1, 0.5137255, 1,
-0.159641, -1.213195, -2.766671, 0, 1, 0.5215687, 1,
-0.1591871, 0.3910385, 1.19085, 0, 1, 0.5254902, 1,
-0.1575981, -1.100685, -4.303477, 0, 1, 0.5333334, 1,
-0.1574365, -1.792336, -1.556322, 0, 1, 0.5372549, 1,
-0.1562602, 0.4213623, -0.1088916, 0, 1, 0.5450981, 1,
-0.1517041, -0.6728402, -3.458439, 0, 1, 0.5490196, 1,
-0.1476023, -0.07513666, -1.761883, 0, 1, 0.5568628, 1,
-0.1433016, 0.7904316, -1.090585, 0, 1, 0.5607843, 1,
-0.1385232, 1.091281, -1.21967, 0, 1, 0.5686275, 1,
-0.1373158, 1.412419, 0.40783, 0, 1, 0.572549, 1,
-0.1365863, 0.380593, -0.8788413, 0, 1, 0.5803922, 1,
-0.1288968, -0.3623706, -3.008193, 0, 1, 0.5843138, 1,
-0.124465, -1.424641, -3.432009, 0, 1, 0.5921569, 1,
-0.1224133, -1.044191, -1.983661, 0, 1, 0.5960785, 1,
-0.1208647, -2.341823, -2.449617, 0, 1, 0.6039216, 1,
-0.1200655, -0.6896533, -2.729781, 0, 1, 0.6117647, 1,
-0.1193629, 0.2835666, -0.8932198, 0, 1, 0.6156863, 1,
-0.1180305, 0.4823213, -0.9834467, 0, 1, 0.6235294, 1,
-0.1172258, -1.505413, -3.587193, 0, 1, 0.627451, 1,
-0.1116959, -0.4041337, -1.023526, 0, 1, 0.6352941, 1,
-0.1115925, 0.37883, 1.658428, 0, 1, 0.6392157, 1,
-0.1109531, -0.03770987, -1.886527, 0, 1, 0.6470588, 1,
-0.1109136, -0.2150451, -1.520902, 0, 1, 0.6509804, 1,
-0.1102263, -0.6751953, -2.695281, 0, 1, 0.6588235, 1,
-0.1093831, -1.185969, -3.775659, 0, 1, 0.6627451, 1,
-0.1065912, 0.04924718, -1.475239, 0, 1, 0.6705883, 1,
-0.1034359, 0.5806223, 1.09011, 0, 1, 0.6745098, 1,
-0.102153, -1.201613, -1.269232, 0, 1, 0.682353, 1,
-0.09633778, -0.4786319, -2.237469, 0, 1, 0.6862745, 1,
-0.09246238, 1.823197, -1.469538, 0, 1, 0.6941177, 1,
-0.09210059, -0.3226844, -3.722202, 0, 1, 0.7019608, 1,
-0.09069125, -0.6589299, -2.259326, 0, 1, 0.7058824, 1,
-0.08936942, -0.4395656, -3.457444, 0, 1, 0.7137255, 1,
-0.08536785, -1.338609, -3.770799, 0, 1, 0.7176471, 1,
-0.08351171, -1.682842, -3.042983, 0, 1, 0.7254902, 1,
-0.08151817, 1.118264, -1.394987, 0, 1, 0.7294118, 1,
-0.0774707, 1.862021, 1.939622, 0, 1, 0.7372549, 1,
-0.07616916, -0.5168509, -3.090997, 0, 1, 0.7411765, 1,
-0.07301736, -0.8578268, -3.184599, 0, 1, 0.7490196, 1,
-0.07161122, -1.745405, -4.129086, 0, 1, 0.7529412, 1,
-0.06951118, 0.5649821, -0.8636866, 0, 1, 0.7607843, 1,
-0.06921394, 0.7777302, 0.8723655, 0, 1, 0.7647059, 1,
-0.06763265, -0.2985258, -3.883238, 0, 1, 0.772549, 1,
-0.06602405, 0.56585, 0.7666264, 0, 1, 0.7764706, 1,
-0.05945336, -1.256269, -2.928591, 0, 1, 0.7843137, 1,
-0.0571786, -0.5444697, -3.356366, 0, 1, 0.7882353, 1,
-0.0553121, -0.1708645, -4.839246, 0, 1, 0.7960784, 1,
-0.05196072, 1.249124, -1.167592, 0, 1, 0.8039216, 1,
-0.05001751, -0.3362667, -2.557378, 0, 1, 0.8078431, 1,
-0.04899366, 0.4896626, 0.8795227, 0, 1, 0.8156863, 1,
-0.04521957, 0.2819741, -2.340357, 0, 1, 0.8196079, 1,
-0.04469242, -0.01999531, -3.391738, 0, 1, 0.827451, 1,
-0.03956692, 2.217517, 0.9124144, 0, 1, 0.8313726, 1,
-0.03843314, 1.921765, -0.6649909, 0, 1, 0.8392157, 1,
-0.03257489, 0.8015452, -0.01873929, 0, 1, 0.8431373, 1,
-0.03212325, 0.08205969, -1.386048, 0, 1, 0.8509804, 1,
-0.0316478, 0.3243577, -1.046774, 0, 1, 0.854902, 1,
-0.03059522, 0.2941563, 1.757076, 0, 1, 0.8627451, 1,
-0.02930601, 1.263331, 1.157183, 0, 1, 0.8666667, 1,
-0.02804338, -2.300406, -3.51475, 0, 1, 0.8745098, 1,
-0.0267569, 0.5329813, -0.6113643, 0, 1, 0.8784314, 1,
-0.02618989, -1.130704, -3.425803, 0, 1, 0.8862745, 1,
-0.0232469, 0.2028161, -0.359385, 0, 1, 0.8901961, 1,
-0.02211249, -0.9304056, -2.557207, 0, 1, 0.8980392, 1,
-0.02168531, 1.522365, 0.7559504, 0, 1, 0.9058824, 1,
-0.01189456, 1.041881, -1.451239, 0, 1, 0.9098039, 1,
-0.01005985, 0.5686305, -0.6339995, 0, 1, 0.9176471, 1,
-0.007019035, 0.8181269, 1.183214, 0, 1, 0.9215686, 1,
-0.006686845, -0.2968968, -1.981619, 0, 1, 0.9294118, 1,
0.001015277, 0.809633, 1.348088, 0, 1, 0.9333333, 1,
0.00363554, 0.2673886, -0.5024153, 0, 1, 0.9411765, 1,
0.004821173, -0.8425896, 2.497107, 0, 1, 0.945098, 1,
0.007076373, -0.1200685, 3.66501, 0, 1, 0.9529412, 1,
0.009307346, 1.512098, 1.640772, 0, 1, 0.9568627, 1,
0.01015779, -1.300333, 1.958172, 0, 1, 0.9647059, 1,
0.01360496, 0.9082666, 1.007041, 0, 1, 0.9686275, 1,
0.01430964, -0.2270314, 3.769119, 0, 1, 0.9764706, 1,
0.02003613, -0.3501152, 3.529406, 0, 1, 0.9803922, 1,
0.02311997, -1.244118, 5.343912, 0, 1, 0.9882353, 1,
0.02557341, 0.3272772, -1.248616, 0, 1, 0.9921569, 1,
0.02579554, 0.1249719, 0.4125231, 0, 1, 1, 1,
0.02596228, -1.065682, 4.800517, 0, 0.9921569, 1, 1,
0.02679804, 0.545566, -0.2603005, 0, 0.9882353, 1, 1,
0.03001891, 0.6267458, 0.6954409, 0, 0.9803922, 1, 1,
0.03213149, 1.523512, 1.229847, 0, 0.9764706, 1, 1,
0.03305861, -0.195975, 3.867101, 0, 0.9686275, 1, 1,
0.03463685, 1.736113, -2.110495, 0, 0.9647059, 1, 1,
0.03584018, -0.4913274, 2.819399, 0, 0.9568627, 1, 1,
0.04050111, -0.446284, 3.300038, 0, 0.9529412, 1, 1,
0.04116664, -0.1688099, 2.742494, 0, 0.945098, 1, 1,
0.0413413, 1.024859, -0.6584904, 0, 0.9411765, 1, 1,
0.04208006, 0.4089275, 0.02317443, 0, 0.9333333, 1, 1,
0.04277843, 0.389072, -0.4696103, 0, 0.9294118, 1, 1,
0.04783111, 0.806264, -2.124785, 0, 0.9215686, 1, 1,
0.05269315, 0.4680993, -0.1652849, 0, 0.9176471, 1, 1,
0.05357247, -1.029002, 1.795281, 0, 0.9098039, 1, 1,
0.05544029, 2.027442, -0.9493045, 0, 0.9058824, 1, 1,
0.06200793, -1.072685, 2.455536, 0, 0.8980392, 1, 1,
0.0625214, -0.3648583, 4.409025, 0, 0.8901961, 1, 1,
0.06338031, 0.1300746, 1.246665, 0, 0.8862745, 1, 1,
0.06912705, 0.9777155, -0.2701516, 0, 0.8784314, 1, 1,
0.06965627, -0.9818175, 4.29123, 0, 0.8745098, 1, 1,
0.07267731, 0.07348216, 0.5886539, 0, 0.8666667, 1, 1,
0.07325546, -1.077845, 3.460586, 0, 0.8627451, 1, 1,
0.07436761, 0.3887359, 0.309262, 0, 0.854902, 1, 1,
0.07582691, -0.1417094, 4.476483, 0, 0.8509804, 1, 1,
0.07711409, -0.7001802, 3.028143, 0, 0.8431373, 1, 1,
0.07755762, 0.002912578, 1.070795, 0, 0.8392157, 1, 1,
0.07956164, -0.03566646, -0.1733068, 0, 0.8313726, 1, 1,
0.08035716, 0.3457881, -0.1952558, 0, 0.827451, 1, 1,
0.08466455, 1.484398, 0.7390814, 0, 0.8196079, 1, 1,
0.08512394, -0.5979366, 2.537497, 0, 0.8156863, 1, 1,
0.08590351, 0.5949798, 0.05420185, 0, 0.8078431, 1, 1,
0.08602048, 0.5747181, 0.8214651, 0, 0.8039216, 1, 1,
0.0861301, -1.09059, 2.451219, 0, 0.7960784, 1, 1,
0.08664296, -0.8744533, 2.408462, 0, 0.7882353, 1, 1,
0.09099092, 0.241305, 1.159613, 0, 0.7843137, 1, 1,
0.09951881, -0.2291978, 0.9837297, 0, 0.7764706, 1, 1,
0.1036207, 3.110399, -0.7584115, 0, 0.772549, 1, 1,
0.1066036, 1.237941, 0.8845363, 0, 0.7647059, 1, 1,
0.1075598, -0.779173, 3.714167, 0, 0.7607843, 1, 1,
0.1090826, 0.3349805, -1.146487, 0, 0.7529412, 1, 1,
0.1153893, -0.311166, 3.410848, 0, 0.7490196, 1, 1,
0.118264, -2.992093, 3.245095, 0, 0.7411765, 1, 1,
0.1195304, 0.4432132, 0.5736929, 0, 0.7372549, 1, 1,
0.1244156, 0.9149359, -1.00448, 0, 0.7294118, 1, 1,
0.1275019, 2.623969, 0.8796946, 0, 0.7254902, 1, 1,
0.1322533, -0.5070447, 2.924818, 0, 0.7176471, 1, 1,
0.1324313, 0.3682684, -2.589952, 0, 0.7137255, 1, 1,
0.1336587, 1.101074, -1.876268, 0, 0.7058824, 1, 1,
0.1380403, 1.364712, -1.654074, 0, 0.6980392, 1, 1,
0.1390799, -0.6927018, 1.324396, 0, 0.6941177, 1, 1,
0.1412272, -0.4884246, 3.696126, 0, 0.6862745, 1, 1,
0.1420915, -1.959565, 3.799767, 0, 0.682353, 1, 1,
0.143077, 1.630077, 1.522633, 0, 0.6745098, 1, 1,
0.1458321, 1.221736, -0.8828628, 0, 0.6705883, 1, 1,
0.1480543, -0.8934431, 2.77038, 0, 0.6627451, 1, 1,
0.149709, 0.5861104, -1.182953, 0, 0.6588235, 1, 1,
0.1548088, -0.328855, 2.598276, 0, 0.6509804, 1, 1,
0.1608486, -0.5142996, 1.660089, 0, 0.6470588, 1, 1,
0.164413, -0.9452941, 0.5005786, 0, 0.6392157, 1, 1,
0.1679371, -0.1987286, 2.71176, 0, 0.6352941, 1, 1,
0.1687833, 1.21109, -0.06283859, 0, 0.627451, 1, 1,
0.1727976, 0.4504494, -2.154929, 0, 0.6235294, 1, 1,
0.173398, 0.6200376, 0.2235527, 0, 0.6156863, 1, 1,
0.1738688, 0.5360482, 1.633309, 0, 0.6117647, 1, 1,
0.1748889, 2.470924, 2.140424, 0, 0.6039216, 1, 1,
0.1783287, 0.2249144, 1.305822, 0, 0.5960785, 1, 1,
0.1823058, 0.5194291, -0.7956616, 0, 0.5921569, 1, 1,
0.1832082, -0.7848641, 4.402874, 0, 0.5843138, 1, 1,
0.1854444, -1.307254, 2.849429, 0, 0.5803922, 1, 1,
0.1873778, -0.06527871, 2.580786, 0, 0.572549, 1, 1,
0.1875584, 0.4639115, 0.2874175, 0, 0.5686275, 1, 1,
0.1906433, 0.1256932, -0.9005317, 0, 0.5607843, 1, 1,
0.1912022, -0.2084336, 2.630907, 0, 0.5568628, 1, 1,
0.196787, 1.723283, 0.8138468, 0, 0.5490196, 1, 1,
0.1979708, -0.9661448, 3.037029, 0, 0.5450981, 1, 1,
0.1994006, -0.3454034, 5.050958, 0, 0.5372549, 1, 1,
0.2002078, 0.3759379, 1.870863, 0, 0.5333334, 1, 1,
0.203147, 1.031638, 0.8486235, 0, 0.5254902, 1, 1,
0.2044977, -1.546016, 3.463419, 0, 0.5215687, 1, 1,
0.2046679, 0.08973257, 1.925594, 0, 0.5137255, 1, 1,
0.2084217, 0.4087689, 0.7652243, 0, 0.509804, 1, 1,
0.2108398, 0.5823164, 0.5028154, 0, 0.5019608, 1, 1,
0.2137128, 3.028884, -1.034073, 0, 0.4941176, 1, 1,
0.2163967, -0.1086796, 1.138325, 0, 0.4901961, 1, 1,
0.2194618, 0.7140308, 0.07264397, 0, 0.4823529, 1, 1,
0.2206826, -0.7508844, 2.908944, 0, 0.4784314, 1, 1,
0.2215904, -0.5467397, 2.606412, 0, 0.4705882, 1, 1,
0.2268083, 0.3079631, 0.7098775, 0, 0.4666667, 1, 1,
0.2274488, -0.1671308, 0.4523091, 0, 0.4588235, 1, 1,
0.2374825, -0.2373591, 0.8420592, 0, 0.454902, 1, 1,
0.2417167, -1.313033, 2.473822, 0, 0.4470588, 1, 1,
0.2429623, -0.1422154, 1.93209, 0, 0.4431373, 1, 1,
0.2447014, 0.5417498, 1.201768, 0, 0.4352941, 1, 1,
0.2487638, -1.164577, 1.411722, 0, 0.4313726, 1, 1,
0.2552079, 1.531019, -1.565935, 0, 0.4235294, 1, 1,
0.257735, 0.4409432, 0.5181956, 0, 0.4196078, 1, 1,
0.2592207, 0.7759614, 2.776003, 0, 0.4117647, 1, 1,
0.2595165, 0.3210156, 0.7044564, 0, 0.4078431, 1, 1,
0.2623391, -0.6665529, 1.768551, 0, 0.4, 1, 1,
0.2680451, 0.308965, 2.080587, 0, 0.3921569, 1, 1,
0.2680587, -0.2158643, 3.484681, 0, 0.3882353, 1, 1,
0.2689603, 0.629583, 0.8099127, 0, 0.3803922, 1, 1,
0.2691803, 2.160659, -1.185394, 0, 0.3764706, 1, 1,
0.2691905, -0.9317471, 3.634803, 0, 0.3686275, 1, 1,
0.2716798, 0.7695591, 0.05905044, 0, 0.3647059, 1, 1,
0.275782, -1.281411, 2.109143, 0, 0.3568628, 1, 1,
0.2772126, -1.013111, 3.421646, 0, 0.3529412, 1, 1,
0.2783026, 0.01716528, 0.3542857, 0, 0.345098, 1, 1,
0.2798297, -0.355478, 3.160362, 0, 0.3411765, 1, 1,
0.2836721, 1.99727, -0.5398967, 0, 0.3333333, 1, 1,
0.2949455, -0.1167912, 3.017983, 0, 0.3294118, 1, 1,
0.3006138, 0.8324443, 0.7393451, 0, 0.3215686, 1, 1,
0.304244, -0.8217493, 4.330418, 0, 0.3176471, 1, 1,
0.3120836, -0.095504, 2.373573, 0, 0.3098039, 1, 1,
0.3153718, -0.4732061, 2.968261, 0, 0.3058824, 1, 1,
0.316486, 1.225936, -0.9959773, 0, 0.2980392, 1, 1,
0.3166678, -0.846073, 3.32815, 0, 0.2901961, 1, 1,
0.319062, -1.936152, 2.695911, 0, 0.2862745, 1, 1,
0.3215925, 0.3228525, -0.624376, 0, 0.2784314, 1, 1,
0.3247694, -0.6579292, 1.538686, 0, 0.2745098, 1, 1,
0.3277985, 0.02005408, 1.260772, 0, 0.2666667, 1, 1,
0.3453351, -0.3480135, 4.004299, 0, 0.2627451, 1, 1,
0.3468024, -0.2323317, 0.9565378, 0, 0.254902, 1, 1,
0.3501217, -1.709758, 2.211122, 0, 0.2509804, 1, 1,
0.3511751, -0.07264178, 3.025281, 0, 0.2431373, 1, 1,
0.3513925, -2.967929, 2.737429, 0, 0.2392157, 1, 1,
0.3524226, -0.8081341, 2.61195, 0, 0.2313726, 1, 1,
0.3568903, 0.5047011, 0.1838835, 0, 0.227451, 1, 1,
0.3597391, -1.3871, 2.702697, 0, 0.2196078, 1, 1,
0.3600583, 0.6516216, 1.717229, 0, 0.2156863, 1, 1,
0.3603743, 2.282447, 2.07641, 0, 0.2078431, 1, 1,
0.3612643, -1.243693, 3.867082, 0, 0.2039216, 1, 1,
0.3684714, 0.5560051, 1.249248, 0, 0.1960784, 1, 1,
0.3697791, -0.489991, 0.05049103, 0, 0.1882353, 1, 1,
0.3709749, -0.8144196, 4.051879, 0, 0.1843137, 1, 1,
0.374133, -0.7511505, 2.7068, 0, 0.1764706, 1, 1,
0.3744278, -0.2367952, 2.224324, 0, 0.172549, 1, 1,
0.3797643, 0.1021776, 1.979436, 0, 0.1647059, 1, 1,
0.3812265, -0.1481392, 1.406889, 0, 0.1607843, 1, 1,
0.3823712, 0.9084936, 0.4986039, 0, 0.1529412, 1, 1,
0.382861, 0.734713, 2.636574, 0, 0.1490196, 1, 1,
0.3878678, -0.4208156, 1.921215, 0, 0.1411765, 1, 1,
0.3897818, 0.4902923, 1.534121, 0, 0.1372549, 1, 1,
0.3924736, 0.9416085, 0.5349057, 0, 0.1294118, 1, 1,
0.393899, 1.443242, 0.863574, 0, 0.1254902, 1, 1,
0.4041491, -0.6257995, 2.043242, 0, 0.1176471, 1, 1,
0.4042661, 1.044086, -1.072638, 0, 0.1137255, 1, 1,
0.4098164, -0.2824091, 2.785905, 0, 0.1058824, 1, 1,
0.4103645, -0.06019776, 0.7897538, 0, 0.09803922, 1, 1,
0.4105507, -0.6442716, 2.847837, 0, 0.09411765, 1, 1,
0.4141984, 0.6376464, 2.038632, 0, 0.08627451, 1, 1,
0.4165768, -1.614072, 4.081661, 0, 0.08235294, 1, 1,
0.4178407, 2.318127, 0.564949, 0, 0.07450981, 1, 1,
0.428255, 0.377619, 1.280827, 0, 0.07058824, 1, 1,
0.4318577, 1.109848, 1.01327, 0, 0.0627451, 1, 1,
0.4326032, -0.3103148, 1.796918, 0, 0.05882353, 1, 1,
0.4351093, 0.1139563, 1.565947, 0, 0.05098039, 1, 1,
0.4407465, 0.5576676, 2.238799, 0, 0.04705882, 1, 1,
0.4414733, -0.4848881, 1.055894, 0, 0.03921569, 1, 1,
0.4459927, 0.850524, 1.284481, 0, 0.03529412, 1, 1,
0.447661, 0.419337, 2.482585, 0, 0.02745098, 1, 1,
0.4479414, 0.7386174, 2.304877, 0, 0.02352941, 1, 1,
0.449063, 1.768795, 0.589397, 0, 0.01568628, 1, 1,
0.4513371, 0.3741487, 1.731271, 0, 0.01176471, 1, 1,
0.4544319, 1.652316, 0.2845312, 0, 0.003921569, 1, 1,
0.4545869, 0.3045628, 0.8444383, 0.003921569, 0, 1, 1,
0.4556422, 0.5793484, 1.306458, 0.007843138, 0, 1, 1,
0.4603751, -0.7157638, 3.120203, 0.01568628, 0, 1, 1,
0.4663167, 1.062848, 0.2912913, 0.01960784, 0, 1, 1,
0.4688508, 0.3626044, 0.8401574, 0.02745098, 0, 1, 1,
0.4700698, 0.3479697, 0.304675, 0.03137255, 0, 1, 1,
0.4738816, -1.177173, 3.93131, 0.03921569, 0, 1, 1,
0.4761978, 0.8346946, 0.4120621, 0.04313726, 0, 1, 1,
0.4784449, 0.9193124, 1.835454, 0.05098039, 0, 1, 1,
0.4819218, 0.7266783, 1.835918, 0.05490196, 0, 1, 1,
0.4828558, -0.04607776, 0.5663162, 0.0627451, 0, 1, 1,
0.4834567, -0.07354396, 1.79577, 0.06666667, 0, 1, 1,
0.4886714, 1.140249, 1.683624, 0.07450981, 0, 1, 1,
0.4892998, 1.383813, 1.27331, 0.07843138, 0, 1, 1,
0.4933434, 0.4451564, 1.870366, 0.08627451, 0, 1, 1,
0.4940199, 0.5879633, 0.008532697, 0.09019608, 0, 1, 1,
0.4940497, 0.5290995, -1.202035, 0.09803922, 0, 1, 1,
0.5036596, -0.5537627, 1.604578, 0.1058824, 0, 1, 1,
0.5061027, -0.1381559, 1.94567, 0.1098039, 0, 1, 1,
0.5091596, -0.4706284, 4.527496, 0.1176471, 0, 1, 1,
0.510552, -0.1777122, 2.072161, 0.1215686, 0, 1, 1,
0.5143026, 0.2354892, 1.819794, 0.1294118, 0, 1, 1,
0.5179664, -1.502138, 2.304397, 0.1333333, 0, 1, 1,
0.5190026, -1.097264, 2.737108, 0.1411765, 0, 1, 1,
0.5208638, -1.659548, 2.423185, 0.145098, 0, 1, 1,
0.5211682, 2.370822, 1.659436, 0.1529412, 0, 1, 1,
0.5213143, 0.08727417, 2.122805, 0.1568628, 0, 1, 1,
0.5225072, -0.5636377, 1.131976, 0.1647059, 0, 1, 1,
0.5249274, -0.6618015, 3.452421, 0.1686275, 0, 1, 1,
0.5321276, 0.1900954, 2.777844, 0.1764706, 0, 1, 1,
0.5338581, 1.39358, 1.177525, 0.1803922, 0, 1, 1,
0.5371914, 1.619529, -0.3425188, 0.1882353, 0, 1, 1,
0.5389673, -0.008034589, 2.209435, 0.1921569, 0, 1, 1,
0.5401599, 0.5288572, 0.06361662, 0.2, 0, 1, 1,
0.5402089, -0.04464964, 1.938914, 0.2078431, 0, 1, 1,
0.5491932, -0.1993024, 1.896474, 0.2117647, 0, 1, 1,
0.5494645, -1.115222, 0.9842799, 0.2196078, 0, 1, 1,
0.5502213, -0.5157178, 0.5538567, 0.2235294, 0, 1, 1,
0.5512508, -1.095736, 1.527202, 0.2313726, 0, 1, 1,
0.5531773, 1.700033, 2.324063, 0.2352941, 0, 1, 1,
0.560847, -1.368255, 3.002772, 0.2431373, 0, 1, 1,
0.5618927, 0.5493574, 0.03124262, 0.2470588, 0, 1, 1,
0.5631191, 0.3993829, 1.672688, 0.254902, 0, 1, 1,
0.5659783, -0.3979439, 2.820153, 0.2588235, 0, 1, 1,
0.569327, -0.7736499, 4.447388, 0.2666667, 0, 1, 1,
0.5696384, -0.8456597, 1.88541, 0.2705882, 0, 1, 1,
0.5709098, -1.226856, 3.840691, 0.2784314, 0, 1, 1,
0.5712072, -1.181319, 1.774015, 0.282353, 0, 1, 1,
0.5804641, -1.62794, 3.470107, 0.2901961, 0, 1, 1,
0.5817808, 0.8675995, 1.112145, 0.2941177, 0, 1, 1,
0.5891979, -0.8484747, 3.336041, 0.3019608, 0, 1, 1,
0.5908063, -1.833312, 1.988809, 0.3098039, 0, 1, 1,
0.5924908, -0.322513, 2.61451, 0.3137255, 0, 1, 1,
0.5940868, 0.1786213, 0.1357162, 0.3215686, 0, 1, 1,
0.5998556, -0.227693, 3.878093, 0.3254902, 0, 1, 1,
0.6013435, -0.4388238, 2.983716, 0.3333333, 0, 1, 1,
0.6015319, 0.5738938, 0.8317857, 0.3372549, 0, 1, 1,
0.6028597, -0.4779726, 2.873082, 0.345098, 0, 1, 1,
0.6050791, -1.783112, 1.863514, 0.3490196, 0, 1, 1,
0.6068906, -1.122341, 1.66242, 0.3568628, 0, 1, 1,
0.6142491, -0.05501962, 1.37499, 0.3607843, 0, 1, 1,
0.6180926, 0.1635391, -0.5481764, 0.3686275, 0, 1, 1,
0.6188377, 0.4027312, 3.926784, 0.372549, 0, 1, 1,
0.6221999, 1.264334, 1.757658, 0.3803922, 0, 1, 1,
0.6225644, -0.3320363, 3.570653, 0.3843137, 0, 1, 1,
0.622601, 0.2553959, 2.431638, 0.3921569, 0, 1, 1,
0.6232567, 1.20992, -0.01650644, 0.3960784, 0, 1, 1,
0.6235777, -0.7654887, 2.481438, 0.4039216, 0, 1, 1,
0.624505, -0.8725707, 1.460005, 0.4117647, 0, 1, 1,
0.6427609, 0.9290359, 2.041009, 0.4156863, 0, 1, 1,
0.6439382, -0.7034514, 2.49962, 0.4235294, 0, 1, 1,
0.6439929, 0.5196753, 1.374881, 0.427451, 0, 1, 1,
0.6501718, -0.6752894, 2.74682, 0.4352941, 0, 1, 1,
0.6547586, -0.8598616, 3.716619, 0.4392157, 0, 1, 1,
0.6582933, -0.1699979, 0.7180612, 0.4470588, 0, 1, 1,
0.6605428, 0.3636605, 1.51361, 0.4509804, 0, 1, 1,
0.6606178, 0.138021, 1.750156, 0.4588235, 0, 1, 1,
0.6616642, 0.7546365, 2.323796, 0.4627451, 0, 1, 1,
0.6794447, 0.9570069, -0.6113122, 0.4705882, 0, 1, 1,
0.6804919, -1.005871, 3.383285, 0.4745098, 0, 1, 1,
0.6815464, -0.3970769, 2.838898, 0.4823529, 0, 1, 1,
0.6844064, 0.3569133, 2.131947, 0.4862745, 0, 1, 1,
0.6884378, -0.8954502, 2.001839, 0.4941176, 0, 1, 1,
0.6903276, -1.87636, 0.7880805, 0.5019608, 0, 1, 1,
0.6945729, 0.193096, 3.306524, 0.5058824, 0, 1, 1,
0.6955515, -0.4208823, 0.3157437, 0.5137255, 0, 1, 1,
0.7028239, -0.1725534, 1.429147, 0.5176471, 0, 1, 1,
0.7042879, -0.04757106, 2.46634, 0.5254902, 0, 1, 1,
0.7111354, -0.09213354, 1.594856, 0.5294118, 0, 1, 1,
0.7117186, -0.374394, 0.2624401, 0.5372549, 0, 1, 1,
0.7120433, -0.6660544, 2.392461, 0.5411765, 0, 1, 1,
0.7134688, -0.06216752, 2.028964, 0.5490196, 0, 1, 1,
0.7228742, 0.3276722, -0.4388625, 0.5529412, 0, 1, 1,
0.7399385, -1.391625, 0.7342148, 0.5607843, 0, 1, 1,
0.7429401, -0.5631575, 2.984374, 0.5647059, 0, 1, 1,
0.7532256, -0.1693157, 2.278231, 0.572549, 0, 1, 1,
0.7553216, 0.7986113, 1.340246, 0.5764706, 0, 1, 1,
0.7634944, 1.478228, 0.4135629, 0.5843138, 0, 1, 1,
0.7652541, 1.399251, 0.4011499, 0.5882353, 0, 1, 1,
0.7715366, 0.4181947, 2.851375, 0.5960785, 0, 1, 1,
0.7727377, 1.490054, -1.364028, 0.6039216, 0, 1, 1,
0.7728068, -1.590549, 2.476026, 0.6078432, 0, 1, 1,
0.7752286, 1.065692, 4.014439, 0.6156863, 0, 1, 1,
0.7757011, -0.395915, 0.9282726, 0.6196079, 0, 1, 1,
0.7769651, 1.095744, -0.6937641, 0.627451, 0, 1, 1,
0.7831995, 0.5478625, 0.4628529, 0.6313726, 0, 1, 1,
0.7898144, -0.00600465, 2.561924, 0.6392157, 0, 1, 1,
0.7947474, -0.9262815, 1.618981, 0.6431373, 0, 1, 1,
0.7967813, 1.335659, 1.772782, 0.6509804, 0, 1, 1,
0.79713, 0.6049016, 1.152136, 0.654902, 0, 1, 1,
0.8001847, -0.6391379, 3.051212, 0.6627451, 0, 1, 1,
0.8163548, -1.156357, 0.09517296, 0.6666667, 0, 1, 1,
0.8174023, 0.3948869, 2.883177, 0.6745098, 0, 1, 1,
0.8198073, -0.5122501, 4.099996, 0.6784314, 0, 1, 1,
0.8341185, 0.2968966, 1.261505, 0.6862745, 0, 1, 1,
0.8353037, 0.3541014, 0.4675399, 0.6901961, 0, 1, 1,
0.8421027, -0.07442258, 0.405925, 0.6980392, 0, 1, 1,
0.8471236, 1.332364, -1.263894, 0.7058824, 0, 1, 1,
0.8472978, -0.2555108, 0.2496109, 0.7098039, 0, 1, 1,
0.8478447, 0.5989828, 0.3554384, 0.7176471, 0, 1, 1,
0.8489164, 0.3453545, 1.772389, 0.7215686, 0, 1, 1,
0.8547211, -0.06459378, 1.240345, 0.7294118, 0, 1, 1,
0.8593872, -0.7225536, 1.620875, 0.7333333, 0, 1, 1,
0.8628043, 1.872781, 1.979679, 0.7411765, 0, 1, 1,
0.8661538, -1.246202, 2.264965, 0.7450981, 0, 1, 1,
0.8687262, -1.224625, 2.961401, 0.7529412, 0, 1, 1,
0.8701259, -0.8100114, 3.093049, 0.7568628, 0, 1, 1,
0.8745947, -0.2438142, 2.350922, 0.7647059, 0, 1, 1,
0.8776502, 2.021168, 0.03477491, 0.7686275, 0, 1, 1,
0.8817962, 1.922849, -1.512, 0.7764706, 0, 1, 1,
0.8881217, 0.9584689, 1.082653, 0.7803922, 0, 1, 1,
0.8923504, 1.495265, 1.772348, 0.7882353, 0, 1, 1,
0.8987964, -1.144083, 3.688148, 0.7921569, 0, 1, 1,
0.9006807, 0.8639537, 1.998352, 0.8, 0, 1, 1,
0.9020405, -0.1770852, 0.07824463, 0.8078431, 0, 1, 1,
0.9095724, -1.041928, 1.610818, 0.8117647, 0, 1, 1,
0.9144056, -0.990898, 1.143796, 0.8196079, 0, 1, 1,
0.9204634, -0.1571709, 0.5938041, 0.8235294, 0, 1, 1,
0.926158, -0.006438324, 1.877341, 0.8313726, 0, 1, 1,
0.9276611, -0.008600563, 1.668523, 0.8352941, 0, 1, 1,
0.9277137, -1.269579, 3.660134, 0.8431373, 0, 1, 1,
0.9372854, 0.5822057, 0.4968885, 0.8470588, 0, 1, 1,
0.9421178, 0.5512402, 3.208973, 0.854902, 0, 1, 1,
0.9445379, 2.668489, 1.461021, 0.8588235, 0, 1, 1,
0.9525178, -0.2358956, 3.039957, 0.8666667, 0, 1, 1,
0.9639485, -0.133662, 1.260476, 0.8705882, 0, 1, 1,
0.9640288, 0.3313287, 1.349859, 0.8784314, 0, 1, 1,
0.968455, -0.1514234, 2.881671, 0.8823529, 0, 1, 1,
0.9707488, 0.03791327, 1.554813, 0.8901961, 0, 1, 1,
0.9756901, 0.658593, 2.6949, 0.8941177, 0, 1, 1,
0.9773241, -0.7453182, 2.92762, 0.9019608, 0, 1, 1,
0.9811486, 1.443013, 1.286305, 0.9098039, 0, 1, 1,
0.986788, -2.097212, 2.663071, 0.9137255, 0, 1, 1,
0.9887767, -0.9010543, 1.599098, 0.9215686, 0, 1, 1,
0.9907635, 1.8716, 1.908993, 0.9254902, 0, 1, 1,
0.996662, 1.038477, 1.242683, 0.9333333, 0, 1, 1,
1.007111, -0.1221444, -0.2492139, 0.9372549, 0, 1, 1,
1.0073, -1.61109, 4.720727, 0.945098, 0, 1, 1,
1.01348, -0.2843498, 0.6215762, 0.9490196, 0, 1, 1,
1.015617, 1.106644, 0.1826918, 0.9568627, 0, 1, 1,
1.016395, 0.8269532, 0.7944804, 0.9607843, 0, 1, 1,
1.017041, 0.4204723, 0.3158842, 0.9686275, 0, 1, 1,
1.021059, -1.880927, 4.316293, 0.972549, 0, 1, 1,
1.025636, 0.4897151, 2.610598, 0.9803922, 0, 1, 1,
1.033103, 1.447279, 0.05380755, 0.9843137, 0, 1, 1,
1.033718, 0.8343924, 1.979194, 0.9921569, 0, 1, 1,
1.034095, -0.4705813, 2.702595, 0.9960784, 0, 1, 1,
1.03493, -1.225149, 2.783051, 1, 0, 0.9960784, 1,
1.036678, 0.3917637, 0.1197046, 1, 0, 0.9882353, 1,
1.03916, 0.02650026, 2.206499, 1, 0, 0.9843137, 1,
1.042514, 0.1417235, 0.8038023, 1, 0, 0.9764706, 1,
1.044161, 0.9912346, 0.641176, 1, 0, 0.972549, 1,
1.046188, 0.8308914, 0.6115208, 1, 0, 0.9647059, 1,
1.048908, 1.635672, 1.220283, 1, 0, 0.9607843, 1,
1.049463, 0.810047, 0.5393134, 1, 0, 0.9529412, 1,
1.04964, -0.4917883, 2.034873, 1, 0, 0.9490196, 1,
1.051097, 1.244904, 0.2171882, 1, 0, 0.9411765, 1,
1.051211, 0.07867054, 2.030416, 1, 0, 0.9372549, 1,
1.052906, -0.1657165, 2.600761, 1, 0, 0.9294118, 1,
1.061186, -1.188003, 3.238741, 1, 0, 0.9254902, 1,
1.065262, -0.6699891, 1.811015, 1, 0, 0.9176471, 1,
1.065898, 0.8411891, 0.4303634, 1, 0, 0.9137255, 1,
1.068867, -0.2987035, 1.258187, 1, 0, 0.9058824, 1,
1.068921, -0.8777727, 2.603084, 1, 0, 0.9019608, 1,
1.069647, 2.094704, 1.488748, 1, 0, 0.8941177, 1,
1.071132, -0.06178855, 2.385177, 1, 0, 0.8862745, 1,
1.071417, 0.82384, 1.309743, 1, 0, 0.8823529, 1,
1.075738, -0.2447639, 0.6702728, 1, 0, 0.8745098, 1,
1.077588, -0.1448075, 0.9227283, 1, 0, 0.8705882, 1,
1.079962, -0.4617521, 2.570759, 1, 0, 0.8627451, 1,
1.082135, -0.9324183, 2.568462, 1, 0, 0.8588235, 1,
1.101193, -1.687295, 2.771464, 1, 0, 0.8509804, 1,
1.101619, 0.9575799, 0.02979953, 1, 0, 0.8470588, 1,
1.102686, 0.08801528, 1.553857, 1, 0, 0.8392157, 1,
1.10281, -0.048409, 3.621814, 1, 0, 0.8352941, 1,
1.107607, 0.1370442, 0.9462454, 1, 0, 0.827451, 1,
1.11115, 0.4075496, 1.03713, 1, 0, 0.8235294, 1,
1.115107, 0.5457143, 3.340562, 1, 0, 0.8156863, 1,
1.125371, -0.01039029, 1.082201, 1, 0, 0.8117647, 1,
1.130979, 0.2530081, 0.5129666, 1, 0, 0.8039216, 1,
1.136258, -0.08296704, 2.300865, 1, 0, 0.7960784, 1,
1.142974, 0.2822722, 2.535403, 1, 0, 0.7921569, 1,
1.158551, -0.1104523, 0.3475886, 1, 0, 0.7843137, 1,
1.160958, -1.978724, 3.428771, 1, 0, 0.7803922, 1,
1.163986, 0.2355401, 0.7920902, 1, 0, 0.772549, 1,
1.169714, -0.3047485, 0.3127631, 1, 0, 0.7686275, 1,
1.170622, -1.303372, 3.702693, 1, 0, 0.7607843, 1,
1.174793, 0.7466106, 1.760991, 1, 0, 0.7568628, 1,
1.176845, -0.3112909, 1.108356, 1, 0, 0.7490196, 1,
1.177088, 1.614599, 1.375611, 1, 0, 0.7450981, 1,
1.181935, 1.407534, 0.2093082, 1, 0, 0.7372549, 1,
1.185315, -1.559948, 3.170148, 1, 0, 0.7333333, 1,
1.187109, 0.3161193, 1.524577, 1, 0, 0.7254902, 1,
1.193344, -1.471174, 1.702517, 1, 0, 0.7215686, 1,
1.198161, -1.607947, 3.936759, 1, 0, 0.7137255, 1,
1.211956, -1.02181, 2.728635, 1, 0, 0.7098039, 1,
1.218361, 0.5719639, 1.117006, 1, 0, 0.7019608, 1,
1.219177, -0.7197488, 2.634407, 1, 0, 0.6941177, 1,
1.219626, 0.5157669, 1.701348, 1, 0, 0.6901961, 1,
1.219913, -0.07131692, 1.375932, 1, 0, 0.682353, 1,
1.223811, 0.2633107, 2.330208, 1, 0, 0.6784314, 1,
1.24296, 0.6383753, -0.05451573, 1, 0, 0.6705883, 1,
1.243184, -0.8642012, 2.003464, 1, 0, 0.6666667, 1,
1.246583, 0.984751, 0.3613162, 1, 0, 0.6588235, 1,
1.248478, -0.5704277, 3.424724, 1, 0, 0.654902, 1,
1.250301, 0.2808112, 0.8045428, 1, 0, 0.6470588, 1,
1.267193, 0.4810475, 0.9860509, 1, 0, 0.6431373, 1,
1.272471, -0.9133871, 3.825248, 1, 0, 0.6352941, 1,
1.302835, 2.04793, 1.793302, 1, 0, 0.6313726, 1,
1.307516, -0.3365135, 1.277741, 1, 0, 0.6235294, 1,
1.308485, -1.213861, 3.787818, 1, 0, 0.6196079, 1,
1.31424, -1.310296, 1.318913, 1, 0, 0.6117647, 1,
1.315264, -0.3708792, -0.5048236, 1, 0, 0.6078432, 1,
1.316819, 1.538272, 0.800703, 1, 0, 0.6, 1,
1.334788, 0.2870077, 1.762063, 1, 0, 0.5921569, 1,
1.352975, 0.965319, 0.621356, 1, 0, 0.5882353, 1,
1.354987, 0.7952199, 0.6229815, 1, 0, 0.5803922, 1,
1.356967, 0.2980902, -0.3396254, 1, 0, 0.5764706, 1,
1.357827, -1.229227, 1.00814, 1, 0, 0.5686275, 1,
1.35816, 1.096621, -1.2612, 1, 0, 0.5647059, 1,
1.372891, 0.5796069, -0.9196969, 1, 0, 0.5568628, 1,
1.389311, -0.7637024, 3.206798, 1, 0, 0.5529412, 1,
1.393579, -0.1445466, 0.9854614, 1, 0, 0.5450981, 1,
1.42649, 0.2769653, 0.2645942, 1, 0, 0.5411765, 1,
1.430282, -0.3201279, 1.283559, 1, 0, 0.5333334, 1,
1.432517, 0.3489189, 2.457822, 1, 0, 0.5294118, 1,
1.43417, 0.2593994, 3.195316, 1, 0, 0.5215687, 1,
1.442933, 0.2775354, 1.818024, 1, 0, 0.5176471, 1,
1.444631, 0.4683549, 2.464039, 1, 0, 0.509804, 1,
1.445786, -0.4242339, 0.8552087, 1, 0, 0.5058824, 1,
1.44844, -1.636934, 2.117116, 1, 0, 0.4980392, 1,
1.451092, 0.8153989, 2.810733, 1, 0, 0.4901961, 1,
1.452547, -0.3356785, 0.4149049, 1, 0, 0.4862745, 1,
1.457866, -0.6284528, 2.493159, 1, 0, 0.4784314, 1,
1.47536, -0.6443208, 2.718176, 1, 0, 0.4745098, 1,
1.476955, -2.622317, 1.849308, 1, 0, 0.4666667, 1,
1.478469, -0.6668488, 2.598226, 1, 0, 0.4627451, 1,
1.479976, -0.6768557, 2.794432, 1, 0, 0.454902, 1,
1.494824, -0.5901601, 2.778017, 1, 0, 0.4509804, 1,
1.517923, 2.108334, 1.905079, 1, 0, 0.4431373, 1,
1.527184, 0.282548, 1.104499, 1, 0, 0.4392157, 1,
1.529451, -1.861534, 2.170659, 1, 0, 0.4313726, 1,
1.532374, 1.627827, -0.5982496, 1, 0, 0.427451, 1,
1.53546, 0.7164865, 2.913037, 1, 0, 0.4196078, 1,
1.5363, 0.2542171, 2.909731, 1, 0, 0.4156863, 1,
1.541687, -0.4765081, 1.991357, 1, 0, 0.4078431, 1,
1.548226, -0.3014657, 1.352493, 1, 0, 0.4039216, 1,
1.550624, 0.3290484, 2.641339, 1, 0, 0.3960784, 1,
1.551912, -0.7569168, 2.217998, 1, 0, 0.3882353, 1,
1.558841, -1.581536, 2.957608, 1, 0, 0.3843137, 1,
1.560185, -0.03357573, 1.603691, 1, 0, 0.3764706, 1,
1.562065, -0.5288708, 0.4164018, 1, 0, 0.372549, 1,
1.573456, 0.01874557, 2.686008, 1, 0, 0.3647059, 1,
1.577773, -0.5973161, 0.8760252, 1, 0, 0.3607843, 1,
1.584558, -0.4410917, 4.364151, 1, 0, 0.3529412, 1,
1.586878, 0.3862817, 0.03284312, 1, 0, 0.3490196, 1,
1.604864, -1.277401, 1.27507, 1, 0, 0.3411765, 1,
1.611844, -1.932512, 3.786376, 1, 0, 0.3372549, 1,
1.646593, -0.7394862, 2.085992, 1, 0, 0.3294118, 1,
1.655132, -0.4635316, 1.645121, 1, 0, 0.3254902, 1,
1.657584, -0.05039769, 2.398552, 1, 0, 0.3176471, 1,
1.65892, 1.812308, -0.2021693, 1, 0, 0.3137255, 1,
1.677498, -0.04132127, 2.101949, 1, 0, 0.3058824, 1,
1.68097, -0.8093439, 2.537498, 1, 0, 0.2980392, 1,
1.708804, -1.91152, 2.410964, 1, 0, 0.2941177, 1,
1.759187, -0.7505894, 3.668529, 1, 0, 0.2862745, 1,
1.769825, -0.04532922, 1.714476, 1, 0, 0.282353, 1,
1.780171, 0.8670745, 1.030475, 1, 0, 0.2745098, 1,
1.780833, 0.08468549, 1.865911, 1, 0, 0.2705882, 1,
1.785976, 0.8704919, 1.973382, 1, 0, 0.2627451, 1,
1.789419, 1.382579, 0.6290357, 1, 0, 0.2588235, 1,
1.796671, 0.0390766, 2.54642, 1, 0, 0.2509804, 1,
1.801444, 0.1928924, 3.458377, 1, 0, 0.2470588, 1,
1.874874, -0.5271007, 2.27456, 1, 0, 0.2392157, 1,
1.878546, 0.6404061, 2.077185, 1, 0, 0.2352941, 1,
1.886956, 0.1918869, 2.630961, 1, 0, 0.227451, 1,
1.919853, -0.1566211, 1.419047, 1, 0, 0.2235294, 1,
1.939429, 0.5490091, 3.004701, 1, 0, 0.2156863, 1,
1.941386, -0.6084328, 2.280201, 1, 0, 0.2117647, 1,
1.96184, 0.9753364, 1.74476, 1, 0, 0.2039216, 1,
1.961994, 1.603643, -0.6101003, 1, 0, 0.1960784, 1,
1.964097, 1.426245, 1.651542, 1, 0, 0.1921569, 1,
1.968959, -1.265687, 3.610355, 1, 0, 0.1843137, 1,
1.987727, -2.894179, 2.363312, 1, 0, 0.1803922, 1,
1.996484, 2.238211, 1.738791, 1, 0, 0.172549, 1,
1.997229, 0.3435034, 1.572221, 1, 0, 0.1686275, 1,
2.010971, 3.180848, 0.9242542, 1, 0, 0.1607843, 1,
2.036301, 0.9463624, -0.7016943, 1, 0, 0.1568628, 1,
2.046755, -0.6825467, 2.679695, 1, 0, 0.1490196, 1,
2.062468, 0.2795429, 0.7489954, 1, 0, 0.145098, 1,
2.06312, 1.74923, -0.5935678, 1, 0, 0.1372549, 1,
2.121535, 0.6668006, 1.456493, 1, 0, 0.1333333, 1,
2.12815, -0.5600756, 1.81206, 1, 0, 0.1254902, 1,
2.165733, 0.6526624, 0.8284535, 1, 0, 0.1215686, 1,
2.176381, 1.110713, 0.08989284, 1, 0, 0.1137255, 1,
2.196461, 1.027189, 1.058334, 1, 0, 0.1098039, 1,
2.202066, 0.2092166, 1.737091, 1, 0, 0.1019608, 1,
2.218237, 1.291937, -1.686151, 1, 0, 0.09411765, 1,
2.240046, -0.4916562, 1.716481, 1, 0, 0.09019608, 1,
2.295035, -1.895941, 2.842449, 1, 0, 0.08235294, 1,
2.309904, 1.042033, 0.316563, 1, 0, 0.07843138, 1,
2.353405, 0.9319903, 2.835024, 1, 0, 0.07058824, 1,
2.353824, 0.5703265, 1.092444, 1, 0, 0.06666667, 1,
2.402919, -0.4385921, 2.668763, 1, 0, 0.05882353, 1,
2.410752, 1.088071, 0.274373, 1, 0, 0.05490196, 1,
2.41099, -1.237343, -0.5109342, 1, 0, 0.04705882, 1,
2.44651, 0.4659007, 2.118239, 1, 0, 0.04313726, 1,
2.583578, 1.243404, -0.2273288, 1, 0, 0.03529412, 1,
2.610535, 0.1598607, 1.83852, 1, 0, 0.03137255, 1,
2.653855, -0.3978264, 1.4569, 1, 0, 0.02352941, 1,
2.715617, -1.953526, 3.253516, 1, 0, 0.01960784, 1,
2.948163, 1.469609, 1.388967, 1, 0, 0.01176471, 1,
3.043386, 0.5755841, 2.853482, 1, 0, 0.007843138, 1
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
-0.04015636, -4.939515, -7.075283, 0, -0.5, 0.5, 0.5,
-0.04015636, -4.939515, -7.075283, 1, -0.5, 0.5, 0.5,
-0.04015636, -4.939515, -7.075283, 1, 1.5, 0.5, 0.5,
-0.04015636, -4.939515, -7.075283, 0, 1.5, 0.5, 0.5
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
-4.16902, -0.2908765, -7.075283, 0, -0.5, 0.5, 0.5,
-4.16902, -0.2908765, -7.075283, 1, -0.5, 0.5, 0.5,
-4.16902, -0.2908765, -7.075283, 1, 1.5, 0.5, 0.5,
-4.16902, -0.2908765, -7.075283, 0, 1.5, 0.5, 0.5
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
-4.16902, -4.939515, 0.03429461, 0, -0.5, 0.5, 0.5,
-4.16902, -4.939515, 0.03429461, 1, -0.5, 0.5, 0.5,
-4.16902, -4.939515, 0.03429461, 1, 1.5, 0.5, 0.5,
-4.16902, -4.939515, 0.03429461, 0, 1.5, 0.5, 0.5
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
-3, -3.866752, -5.434611,
3, -3.866752, -5.434611,
-3, -3.866752, -5.434611,
-3, -4.045546, -5.708056,
-2, -3.866752, -5.434611,
-2, -4.045546, -5.708056,
-1, -3.866752, -5.434611,
-1, -4.045546, -5.708056,
0, -3.866752, -5.434611,
0, -4.045546, -5.708056,
1, -3.866752, -5.434611,
1, -4.045546, -5.708056,
2, -3.866752, -5.434611,
2, -4.045546, -5.708056,
3, -3.866752, -5.434611,
3, -4.045546, -5.708056
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
-3, -4.403134, -6.254947, 0, -0.5, 0.5, 0.5,
-3, -4.403134, -6.254947, 1, -0.5, 0.5, 0.5,
-3, -4.403134, -6.254947, 1, 1.5, 0.5, 0.5,
-3, -4.403134, -6.254947, 0, 1.5, 0.5, 0.5,
-2, -4.403134, -6.254947, 0, -0.5, 0.5, 0.5,
-2, -4.403134, -6.254947, 1, -0.5, 0.5, 0.5,
-2, -4.403134, -6.254947, 1, 1.5, 0.5, 0.5,
-2, -4.403134, -6.254947, 0, 1.5, 0.5, 0.5,
-1, -4.403134, -6.254947, 0, -0.5, 0.5, 0.5,
-1, -4.403134, -6.254947, 1, -0.5, 0.5, 0.5,
-1, -4.403134, -6.254947, 1, 1.5, 0.5, 0.5,
-1, -4.403134, -6.254947, 0, 1.5, 0.5, 0.5,
0, -4.403134, -6.254947, 0, -0.5, 0.5, 0.5,
0, -4.403134, -6.254947, 1, -0.5, 0.5, 0.5,
0, -4.403134, -6.254947, 1, 1.5, 0.5, 0.5,
0, -4.403134, -6.254947, 0, 1.5, 0.5, 0.5,
1, -4.403134, -6.254947, 0, -0.5, 0.5, 0.5,
1, -4.403134, -6.254947, 1, -0.5, 0.5, 0.5,
1, -4.403134, -6.254947, 1, 1.5, 0.5, 0.5,
1, -4.403134, -6.254947, 0, 1.5, 0.5, 0.5,
2, -4.403134, -6.254947, 0, -0.5, 0.5, 0.5,
2, -4.403134, -6.254947, 1, -0.5, 0.5, 0.5,
2, -4.403134, -6.254947, 1, 1.5, 0.5, 0.5,
2, -4.403134, -6.254947, 0, 1.5, 0.5, 0.5,
3, -4.403134, -6.254947, 0, -0.5, 0.5, 0.5,
3, -4.403134, -6.254947, 1, -0.5, 0.5, 0.5,
3, -4.403134, -6.254947, 1, 1.5, 0.5, 0.5,
3, -4.403134, -6.254947, 0, 1.5, 0.5, 0.5
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
-3.216205, -3, -5.434611,
-3.216205, 3, -5.434611,
-3.216205, -3, -5.434611,
-3.375007, -3, -5.708056,
-3.216205, -2, -5.434611,
-3.375007, -2, -5.708056,
-3.216205, -1, -5.434611,
-3.375007, -1, -5.708056,
-3.216205, 0, -5.434611,
-3.375007, 0, -5.708056,
-3.216205, 1, -5.434611,
-3.375007, 1, -5.708056,
-3.216205, 2, -5.434611,
-3.375007, 2, -5.708056,
-3.216205, 3, -5.434611,
-3.375007, 3, -5.708056
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
-3.692612, -3, -6.254947, 0, -0.5, 0.5, 0.5,
-3.692612, -3, -6.254947, 1, -0.5, 0.5, 0.5,
-3.692612, -3, -6.254947, 1, 1.5, 0.5, 0.5,
-3.692612, -3, -6.254947, 0, 1.5, 0.5, 0.5,
-3.692612, -2, -6.254947, 0, -0.5, 0.5, 0.5,
-3.692612, -2, -6.254947, 1, -0.5, 0.5, 0.5,
-3.692612, -2, -6.254947, 1, 1.5, 0.5, 0.5,
-3.692612, -2, -6.254947, 0, 1.5, 0.5, 0.5,
-3.692612, -1, -6.254947, 0, -0.5, 0.5, 0.5,
-3.692612, -1, -6.254947, 1, -0.5, 0.5, 0.5,
-3.692612, -1, -6.254947, 1, 1.5, 0.5, 0.5,
-3.692612, -1, -6.254947, 0, 1.5, 0.5, 0.5,
-3.692612, 0, -6.254947, 0, -0.5, 0.5, 0.5,
-3.692612, 0, -6.254947, 1, -0.5, 0.5, 0.5,
-3.692612, 0, -6.254947, 1, 1.5, 0.5, 0.5,
-3.692612, 0, -6.254947, 0, 1.5, 0.5, 0.5,
-3.692612, 1, -6.254947, 0, -0.5, 0.5, 0.5,
-3.692612, 1, -6.254947, 1, -0.5, 0.5, 0.5,
-3.692612, 1, -6.254947, 1, 1.5, 0.5, 0.5,
-3.692612, 1, -6.254947, 0, 1.5, 0.5, 0.5,
-3.692612, 2, -6.254947, 0, -0.5, 0.5, 0.5,
-3.692612, 2, -6.254947, 1, -0.5, 0.5, 0.5,
-3.692612, 2, -6.254947, 1, 1.5, 0.5, 0.5,
-3.692612, 2, -6.254947, 0, 1.5, 0.5, 0.5,
-3.692612, 3, -6.254947, 0, -0.5, 0.5, 0.5,
-3.692612, 3, -6.254947, 1, -0.5, 0.5, 0.5,
-3.692612, 3, -6.254947, 1, 1.5, 0.5, 0.5,
-3.692612, 3, -6.254947, 0, 1.5, 0.5, 0.5
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
-3.216205, -3.866752, -4,
-3.216205, -3.866752, 4,
-3.216205, -3.866752, -4,
-3.375007, -4.045546, -4,
-3.216205, -3.866752, -2,
-3.375007, -4.045546, -2,
-3.216205, -3.866752, 0,
-3.375007, -4.045546, 0,
-3.216205, -3.866752, 2,
-3.375007, -4.045546, 2,
-3.216205, -3.866752, 4,
-3.375007, -4.045546, 4
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
-3.692612, -4.403134, -4, 0, -0.5, 0.5, 0.5,
-3.692612, -4.403134, -4, 1, -0.5, 0.5, 0.5,
-3.692612, -4.403134, -4, 1, 1.5, 0.5, 0.5,
-3.692612, -4.403134, -4, 0, 1.5, 0.5, 0.5,
-3.692612, -4.403134, -2, 0, -0.5, 0.5, 0.5,
-3.692612, -4.403134, -2, 1, -0.5, 0.5, 0.5,
-3.692612, -4.403134, -2, 1, 1.5, 0.5, 0.5,
-3.692612, -4.403134, -2, 0, 1.5, 0.5, 0.5,
-3.692612, -4.403134, 0, 0, -0.5, 0.5, 0.5,
-3.692612, -4.403134, 0, 1, -0.5, 0.5, 0.5,
-3.692612, -4.403134, 0, 1, 1.5, 0.5, 0.5,
-3.692612, -4.403134, 0, 0, 1.5, 0.5, 0.5,
-3.692612, -4.403134, 2, 0, -0.5, 0.5, 0.5,
-3.692612, -4.403134, 2, 1, -0.5, 0.5, 0.5,
-3.692612, -4.403134, 2, 1, 1.5, 0.5, 0.5,
-3.692612, -4.403134, 2, 0, 1.5, 0.5, 0.5,
-3.692612, -4.403134, 4, 0, -0.5, 0.5, 0.5,
-3.692612, -4.403134, 4, 1, -0.5, 0.5, 0.5,
-3.692612, -4.403134, 4, 1, 1.5, 0.5, 0.5,
-3.692612, -4.403134, 4, 0, 1.5, 0.5, 0.5
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
-3.216205, -3.866752, -5.434611,
-3.216205, 3.284999, -5.434611,
-3.216205, -3.866752, 5.5032,
-3.216205, 3.284999, 5.5032,
-3.216205, -3.866752, -5.434611,
-3.216205, -3.866752, 5.5032,
-3.216205, 3.284999, -5.434611,
-3.216205, 3.284999, 5.5032,
-3.216205, -3.866752, -5.434611,
3.135892, -3.866752, -5.434611,
-3.216205, -3.866752, 5.5032,
3.135892, -3.866752, 5.5032,
-3.216205, 3.284999, -5.434611,
3.135892, 3.284999, -5.434611,
-3.216205, 3.284999, 5.5032,
3.135892, 3.284999, 5.5032,
3.135892, -3.866752, -5.434611,
3.135892, 3.284999, -5.434611,
3.135892, -3.866752, 5.5032,
3.135892, 3.284999, 5.5032,
3.135892, -3.866752, -5.434611,
3.135892, -3.866752, 5.5032,
3.135892, 3.284999, -5.434611,
3.135892, 3.284999, 5.5032
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
var radius = 7.758949;
var distance = 34.52044;
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
mvMatrix.translate( 0.04015636, 0.2908765, -0.03429461 );
mvMatrix.scale( 1.320686, 1.173017, 0.7669842 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.52044);
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
Isobutyrate<-read.table("Isobutyrate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Isobutyrate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Isobutyrate' not found
```

```r
y<-Isobutyrate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Isobutyrate' not found
```

```r
z<-Isobutyrate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Isobutyrate' not found
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
-3.123699, 0.4093232, -1.59948, 0, 0, 1, 1, 1,
-3.113774, -0.7394829, -3.405425, 1, 0, 0, 1, 1,
-3.113716, -0.5660247, 0.5037406, 1, 0, 0, 1, 1,
-3.019132, 0.6731577, -3.077727, 1, 0, 0, 1, 1,
-2.73629, 0.1547905, -1.561754, 1, 0, 0, 1, 1,
-2.688084, -0.9117884, -2.012505, 1, 0, 0, 1, 1,
-2.601668, 0.2677914, 0.1851522, 0, 0, 0, 1, 1,
-2.601539, -0.45569, 0.2543251, 0, 0, 0, 1, 1,
-2.439409, -1.255251, -0.5264906, 0, 0, 0, 1, 1,
-2.411484, 0.1542751, -2.034147, 0, 0, 0, 1, 1,
-2.203462, 1.287561, -0.870501, 0, 0, 0, 1, 1,
-2.168119, 0.2965472, -1.008611, 0, 0, 0, 1, 1,
-2.141461, 0.6910914, -0.3614404, 0, 0, 0, 1, 1,
-2.134114, -0.5884079, -3.427704, 1, 1, 1, 1, 1,
-2.127811, 1.010234, -0.9780577, 1, 1, 1, 1, 1,
-2.119035, -1.570441, -1.527982, 1, 1, 1, 1, 1,
-2.077062, -0.7104468, -1.162407, 1, 1, 1, 1, 1,
-2.06503, -0.7970153, -2.273465, 1, 1, 1, 1, 1,
-2.052386, 0.5552778, -1.849516, 1, 1, 1, 1, 1,
-2.042555, -1.183011, -1.339355, 1, 1, 1, 1, 1,
-2.040301, 0.5135574, -1.698648, 1, 1, 1, 1, 1,
-2.028217, 0.6816021, -2.109532, 1, 1, 1, 1, 1,
-2.027268, 0.802152, -1.5104, 1, 1, 1, 1, 1,
-1.99826, -0.571717, -2.500676, 1, 1, 1, 1, 1,
-1.973857, -1.018778, -2.502625, 1, 1, 1, 1, 1,
-1.969968, -1.197631, -4.568692, 1, 1, 1, 1, 1,
-1.948294, 0.379286, 0.4094249, 1, 1, 1, 1, 1,
-1.922323, -1.493704, -2.663809, 1, 1, 1, 1, 1,
-1.908253, 0.8521541, -0.556258, 0, 0, 1, 1, 1,
-1.867615, 0.063402, -0.9084114, 1, 0, 0, 1, 1,
-1.854337, 0.4390422, -0.4735821, 1, 0, 0, 1, 1,
-1.852284, 0.2043694, -0.7526308, 1, 0, 0, 1, 1,
-1.848909, -0.8310312, -2.850558, 1, 0, 0, 1, 1,
-1.823276, 2.900857, 0.7925062, 1, 0, 0, 1, 1,
-1.820349, 0.5583593, 0.7049104, 0, 0, 0, 1, 1,
-1.818982, 1.707664, -0.1718911, 0, 0, 0, 1, 1,
-1.795035, -0.1677395, -2.373909, 0, 0, 0, 1, 1,
-1.794575, -2.29932, -2.134498, 0, 0, 0, 1, 1,
-1.785188, -0.6317401, -2.634203, 0, 0, 0, 1, 1,
-1.778757, 0.3645369, -0.9397703, 0, 0, 0, 1, 1,
-1.769086, 0.4396621, -0.09533612, 0, 0, 0, 1, 1,
-1.752638, 0.6316947, 0.5077972, 1, 1, 1, 1, 1,
-1.732493, -0.083845, -0.1298718, 1, 1, 1, 1, 1,
-1.706547, 0.5161122, -1.430526, 1, 1, 1, 1, 1,
-1.634503, 0.540044, -1.609408, 1, 1, 1, 1, 1,
-1.622918, 0.6967373, -1.82834, 1, 1, 1, 1, 1,
-1.618517, -0.3326766, -2.731608, 1, 1, 1, 1, 1,
-1.606681, 0.6604465, 1.43176, 1, 1, 1, 1, 1,
-1.605558, 0.6893827, -0.7726938, 1, 1, 1, 1, 1,
-1.578627, 0.3813072, -3.380965, 1, 1, 1, 1, 1,
-1.576893, 0.6368816, -1.245874, 1, 1, 1, 1, 1,
-1.57053, 0.226641, -1.36582, 1, 1, 1, 1, 1,
-1.569232, -0.3840903, -2.566404, 1, 1, 1, 1, 1,
-1.568704, 0.7548264, -2.708013, 1, 1, 1, 1, 1,
-1.557062, 0.5767221, 0.1948884, 1, 1, 1, 1, 1,
-1.550389, 0.02345476, -1.371998, 1, 1, 1, 1, 1,
-1.516517, 0.1643208, -0.9341972, 0, 0, 1, 1, 1,
-1.50873, 1.014846, -0.9299282, 1, 0, 0, 1, 1,
-1.503869, 0.3207281, -1.492398, 1, 0, 0, 1, 1,
-1.491129, 0.07171374, -1.187872, 1, 0, 0, 1, 1,
-1.487705, 0.7936084, -2.048462, 1, 0, 0, 1, 1,
-1.487018, -1.982193, -3.402269, 1, 0, 0, 1, 1,
-1.476788, 0.04238814, -1.418274, 0, 0, 0, 1, 1,
-1.475589, 0.1463661, -0.3111428, 0, 0, 0, 1, 1,
-1.464956, -1.986005, -1.435524, 0, 0, 0, 1, 1,
-1.459309, -0.06086449, -1.131107, 0, 0, 0, 1, 1,
-1.456652, 1.20147, 1.096857, 0, 0, 0, 1, 1,
-1.445732, -0.8283218, -2.53219, 0, 0, 0, 1, 1,
-1.431376, -1.154159, -1.431857, 0, 0, 0, 1, 1,
-1.429809, -0.164369, -3.071067, 1, 1, 1, 1, 1,
-1.421985, 0.1136837, -1.516439, 1, 1, 1, 1, 1,
-1.416875, 0.7456202, -2.950044, 1, 1, 1, 1, 1,
-1.411803, -0.05568445, -2.56516, 1, 1, 1, 1, 1,
-1.40804, -0.2263937, -2.972322, 1, 1, 1, 1, 1,
-1.403453, -0.3039216, -1.078515, 1, 1, 1, 1, 1,
-1.398932, 0.09350417, -1.098495, 1, 1, 1, 1, 1,
-1.390295, 0.355414, -1.630778, 1, 1, 1, 1, 1,
-1.376533, -0.6462144, -2.012254, 1, 1, 1, 1, 1,
-1.374094, 0.6184154, -0.919355, 1, 1, 1, 1, 1,
-1.371826, 1.276736, -0.9994076, 1, 1, 1, 1, 1,
-1.370898, 1.139767, -1.759327, 1, 1, 1, 1, 1,
-1.360432, 0.2133411, -2.415455, 1, 1, 1, 1, 1,
-1.356237, -1.541688, -0.7827748, 1, 1, 1, 1, 1,
-1.354032, 0.8750689, -1.002549, 1, 1, 1, 1, 1,
-1.350593, -0.1345005, -3.514133, 0, 0, 1, 1, 1,
-1.348506, -2.288438, -2.058774, 1, 0, 0, 1, 1,
-1.34593, -0.3927531, -0.6744515, 1, 0, 0, 1, 1,
-1.338647, 1.683896, -2.154473, 1, 0, 0, 1, 1,
-1.335299, -0.1569755, -2.580026, 1, 0, 0, 1, 1,
-1.331965, 0.627142, 0.8966175, 1, 0, 0, 1, 1,
-1.329046, 0.2717404, -1.154539, 0, 0, 0, 1, 1,
-1.328061, -0.9557409, -3.943077, 0, 0, 0, 1, 1,
-1.327533, -1.995173, -3.915047, 0, 0, 0, 1, 1,
-1.324581, 1.443302, -0.5137205, 0, 0, 0, 1, 1,
-1.312279, 1.814042, 1.04737, 0, 0, 0, 1, 1,
-1.307521, 0.5643609, -1.151362, 0, 0, 0, 1, 1,
-1.281882, -0.4716055, -2.698798, 0, 0, 0, 1, 1,
-1.279505, -0.2186126, -3.13585, 1, 1, 1, 1, 1,
-1.275162, 0.4406018, -1.070901, 1, 1, 1, 1, 1,
-1.268165, -0.4000438, -0.9462563, 1, 1, 1, 1, 1,
-1.26413, 1.654054, -0.8466052, 1, 1, 1, 1, 1,
-1.263781, -0.006640258, -2.129938, 1, 1, 1, 1, 1,
-1.258441, 1.236781, -1.552182, 1, 1, 1, 1, 1,
-1.257793, -0.3227752, -1.28918, 1, 1, 1, 1, 1,
-1.247283, 0.3832684, -2.24996, 1, 1, 1, 1, 1,
-1.244937, 0.8066784, -0.3263353, 1, 1, 1, 1, 1,
-1.240302, 0.840724, -0.0714502, 1, 1, 1, 1, 1,
-1.2403, -1.540089, -2.991977, 1, 1, 1, 1, 1,
-1.237044, 1.66447, 1.025951, 1, 1, 1, 1, 1,
-1.235824, -0.05805226, 0.633012, 1, 1, 1, 1, 1,
-1.234861, 0.05264708, 0.3467687, 1, 1, 1, 1, 1,
-1.231433, -0.2950509, -3.371936, 1, 1, 1, 1, 1,
-1.221437, -1.184396, -3.51121, 0, 0, 1, 1, 1,
-1.216747, 1.279459, -0.1043738, 1, 0, 0, 1, 1,
-1.216395, 0.01266897, -1.645521, 1, 0, 0, 1, 1,
-1.211556, -1.091876, -2.296842, 1, 0, 0, 1, 1,
-1.211171, 0.6378812, -1.685445, 1, 0, 0, 1, 1,
-1.208858, -0.4686581, -0.7021905, 1, 0, 0, 1, 1,
-1.208298, 0.1294665, -1.970745, 0, 0, 0, 1, 1,
-1.20467, -2.615524, -2.342985, 0, 0, 0, 1, 1,
-1.20453, 0.2962531, -0.552415, 0, 0, 0, 1, 1,
-1.20274, -0.836538, -2.60451, 0, 0, 0, 1, 1,
-1.201309, -1.014727, -0.8612745, 0, 0, 0, 1, 1,
-1.200969, 1.669196, -2.350435, 0, 0, 0, 1, 1,
-1.188683, -0.7969241, -1.425536, 0, 0, 0, 1, 1,
-1.186235, 1.125243, 0.7838939, 1, 1, 1, 1, 1,
-1.185689, 1.079043, -1.392794, 1, 1, 1, 1, 1,
-1.181594, 1.366719, -1.349865, 1, 1, 1, 1, 1,
-1.174912, 0.2433926, -0.2670192, 1, 1, 1, 1, 1,
-1.17322, -0.858115, -2.47335, 1, 1, 1, 1, 1,
-1.170076, -0.9268182, -2.37209, 1, 1, 1, 1, 1,
-1.165741, -0.1973861, -3.142568, 1, 1, 1, 1, 1,
-1.161573, -0.7271575, -3.075557, 1, 1, 1, 1, 1,
-1.158188, -0.3397276, -1.485182, 1, 1, 1, 1, 1,
-1.158147, 0.4263235, -1.684549, 1, 1, 1, 1, 1,
-1.155336, 2.249979, -2.217463, 1, 1, 1, 1, 1,
-1.155319, -1.305072, -1.478834, 1, 1, 1, 1, 1,
-1.150874, -0.6341166, -3.284667, 1, 1, 1, 1, 1,
-1.144187, 0.6062812, -2.229408, 1, 1, 1, 1, 1,
-1.143047, -0.09485751, -1.112137, 1, 1, 1, 1, 1,
-1.142078, -0.4113477, -3.0438, 0, 0, 1, 1, 1,
-1.140483, 0.8078117, -1.489804, 1, 0, 0, 1, 1,
-1.137425, -1.364405, -1.658195, 1, 0, 0, 1, 1,
-1.11765, -1.842233, -3.242235, 1, 0, 0, 1, 1,
-1.109907, -1.328817, -1.95549, 1, 0, 0, 1, 1,
-1.104893, -0.5349698, -1.387802, 1, 0, 0, 1, 1,
-1.099378, -0.1507016, -2.729953, 0, 0, 0, 1, 1,
-1.096214, 1.784296, -1.532065, 0, 0, 0, 1, 1,
-1.091991, 0.4703178, -0.6772351, 0, 0, 0, 1, 1,
-1.076956, 0.9695082, -0.9591742, 0, 0, 0, 1, 1,
-1.073441, -2.417323, -4.495173, 0, 0, 0, 1, 1,
-1.070029, -0.4857687, -0.3677896, 0, 0, 0, 1, 1,
-1.06954, 0.7217145, 0.3196461, 0, 0, 0, 1, 1,
-1.068671, -1.361571, -2.879228, 1, 1, 1, 1, 1,
-1.063421, 0.2617749, 1.214876, 1, 1, 1, 1, 1,
-1.05289, 0.2343264, -2.511812, 1, 1, 1, 1, 1,
-1.041854, 0.2739507, -0.9827884, 1, 1, 1, 1, 1,
-1.038951, 0.4464745, -1.712754, 1, 1, 1, 1, 1,
-1.037279, -0.6753866, -2.64126, 1, 1, 1, 1, 1,
-1.036948, 1.420641, -1.804492, 1, 1, 1, 1, 1,
-1.03373, 1.586114, 0.1496309, 1, 1, 1, 1, 1,
-1.02379, 0.8568932, -2.119049, 1, 1, 1, 1, 1,
-1.023358, -0.2916068, -3.414137, 1, 1, 1, 1, 1,
-1.020562, 0.09172743, -1.052532, 1, 1, 1, 1, 1,
-1.012393, -0.8084651, -2.743904, 1, 1, 1, 1, 1,
-1.009866, 2.08252, -1.52379, 1, 1, 1, 1, 1,
-1.007108, 0.1354999, -0.8111809, 1, 1, 1, 1, 1,
-1.0028, 0.6341175, -1.098664, 1, 1, 1, 1, 1,
-0.9981137, -0.5381985, -3.060759, 0, 0, 1, 1, 1,
-0.9951404, 0.1153131, -1.968118, 1, 0, 0, 1, 1,
-0.9944995, -1.906941, -0.5960256, 1, 0, 0, 1, 1,
-0.993916, -0.9200354, -2.341014, 1, 0, 0, 1, 1,
-0.9925109, -0.6638681, -1.910737, 1, 0, 0, 1, 1,
-0.9912384, -0.3960468, -4.619669, 1, 0, 0, 1, 1,
-0.9874971, 0.1856273, -1.753879, 0, 0, 0, 1, 1,
-0.9789876, 0.2621655, -2.037617, 0, 0, 0, 1, 1,
-0.9779552, 1.264688, 0.1178209, 0, 0, 0, 1, 1,
-0.9776601, -1.287611, -4.197145, 0, 0, 0, 1, 1,
-0.9721043, 1.754398, -1.580197, 0, 0, 0, 1, 1,
-0.9685354, 1.731784, -0.1763499, 0, 0, 0, 1, 1,
-0.9673514, 0.6424985, -1.143939, 0, 0, 0, 1, 1,
-0.9662958, 0.4828957, -1.869215, 1, 1, 1, 1, 1,
-0.9642879, 0.8285481, -0.3611646, 1, 1, 1, 1, 1,
-0.962314, 0.7895502, 0.6170955, 1, 1, 1, 1, 1,
-0.9550852, 0.1841639, -1.53816, 1, 1, 1, 1, 1,
-0.9547322, 0.9702913, -1.044825, 1, 1, 1, 1, 1,
-0.9543193, -0.1590008, -1.872159, 1, 1, 1, 1, 1,
-0.9468337, -1.40116, -4.452284, 1, 1, 1, 1, 1,
-0.9467929, -0.518997, -1.767265, 1, 1, 1, 1, 1,
-0.9366525, -0.6101448, -1.365883, 1, 1, 1, 1, 1,
-0.9265006, 0.3556197, -1.337351, 1, 1, 1, 1, 1,
-0.9237482, 0.3281192, -0.5442476, 1, 1, 1, 1, 1,
-0.9183795, 1.353258, -2.553899, 1, 1, 1, 1, 1,
-0.9100014, -1.248446, -1.546425, 1, 1, 1, 1, 1,
-0.9083523, 0.3105719, -2.327121, 1, 1, 1, 1, 1,
-0.9023429, 1.090862, -1.489772, 1, 1, 1, 1, 1,
-0.885771, 1.207617, 1.496729, 0, 0, 1, 1, 1,
-0.876764, 1.584284, -1.465862, 1, 0, 0, 1, 1,
-0.871812, 0.2421054, -0.9092923, 1, 0, 0, 1, 1,
-0.8657133, -0.2463739, -0.754021, 1, 0, 0, 1, 1,
-0.8633112, -0.2043298, -2.998854, 1, 0, 0, 1, 1,
-0.8594599, 0.9442714, -0.3841742, 1, 0, 0, 1, 1,
-0.8590026, 0.9593797, -2.184772, 0, 0, 0, 1, 1,
-0.8564308, 0.1738365, -1.671287, 0, 0, 0, 1, 1,
-0.8540622, 1.140923, -0.9052196, 0, 0, 0, 1, 1,
-0.8535183, 1.491091, -0.6687754, 0, 0, 0, 1, 1,
-0.8478171, -0.6289648, -1.292359, 0, 0, 0, 1, 1,
-0.8404145, 0.05556737, -2.338839, 0, 0, 0, 1, 1,
-0.8381602, -1.642562, -1.274776, 0, 0, 0, 1, 1,
-0.8364307, -0.2665646, -0.4766729, 1, 1, 1, 1, 1,
-0.825266, -0.1042204, -0.3400795, 1, 1, 1, 1, 1,
-0.8249074, -0.4111635, -2.028336, 1, 1, 1, 1, 1,
-0.8192616, -0.5933626, -3.288096, 1, 1, 1, 1, 1,
-0.8078565, -0.985016, -2.225467, 1, 1, 1, 1, 1,
-0.8037289, -0.01439805, -3.13112, 1, 1, 1, 1, 1,
-0.7974103, 0.1895441, -1.2016, 1, 1, 1, 1, 1,
-0.7948946, -0.568163, -3.155671, 1, 1, 1, 1, 1,
-0.7875094, -1.745327, -2.981328, 1, 1, 1, 1, 1,
-0.7846052, -0.2458785, -1.541274, 1, 1, 1, 1, 1,
-0.7840422, 0.06923484, -2.835269, 1, 1, 1, 1, 1,
-0.7798051, 0.3495581, -0.6716815, 1, 1, 1, 1, 1,
-0.7701548, 0.5392842, -0.50538, 1, 1, 1, 1, 1,
-0.766178, 0.3326221, -0.7268079, 1, 1, 1, 1, 1,
-0.7661449, 0.3283773, -1.601868, 1, 1, 1, 1, 1,
-0.7651139, 1.444127, -1.494441, 0, 0, 1, 1, 1,
-0.7644477, -0.4237055, -1.087491, 1, 0, 0, 1, 1,
-0.7612863, -0.1598596, -1.723845, 1, 0, 0, 1, 1,
-0.7612046, -0.1603532, -1.047658, 1, 0, 0, 1, 1,
-0.7598975, 1.062192, 0.91579, 1, 0, 0, 1, 1,
-0.7586233, 0.3665271, -0.9203119, 1, 0, 0, 1, 1,
-0.7562906, 1.481009, -0.006283648, 0, 0, 0, 1, 1,
-0.7518267, 0.4250429, -1.477956, 0, 0, 0, 1, 1,
-0.7479623, 0.9235331, -1.696096, 0, 0, 0, 1, 1,
-0.747126, 0.07748125, -3.061811, 0, 0, 0, 1, 1,
-0.7464708, -0.4470088, -2.061279, 0, 0, 0, 1, 1,
-0.7411293, -0.05924355, -1.71104, 0, 0, 0, 1, 1,
-0.7370754, 0.4924995, 0.3488501, 0, 0, 0, 1, 1,
-0.736863, -2.226806, -2.670488, 1, 1, 1, 1, 1,
-0.7365181, -0.6591299, -1.231952, 1, 1, 1, 1, 1,
-0.7325032, -1.057912, -0.875852, 1, 1, 1, 1, 1,
-0.7320523, -2.118352, -3.61013, 1, 1, 1, 1, 1,
-0.730946, -1.416997, -1.07312, 1, 1, 1, 1, 1,
-0.719122, -0.1699847, -2.151121, 1, 1, 1, 1, 1,
-0.717234, -0.06520486, -3.524335, 1, 1, 1, 1, 1,
-0.710552, 0.1705099, -0.8739521, 1, 1, 1, 1, 1,
-0.7096328, 2.385513, -0.6517252, 1, 1, 1, 1, 1,
-0.7083586, -0.1588647, -4.061648, 1, 1, 1, 1, 1,
-0.707131, -0.6817524, -1.733168, 1, 1, 1, 1, 1,
-0.7006119, 0.409071, -0.277253, 1, 1, 1, 1, 1,
-0.6986569, -0.9785281, -3.478769, 1, 1, 1, 1, 1,
-0.6969043, 0.8279554, -0.8885365, 1, 1, 1, 1, 1,
-0.6968755, -0.2513872, -2.438993, 1, 1, 1, 1, 1,
-0.6858666, 0.07218359, -0.6957801, 0, 0, 1, 1, 1,
-0.6824565, -0.6578909, -1.873882, 1, 0, 0, 1, 1,
-0.6817768, -0.4444685, -1.857472, 1, 0, 0, 1, 1,
-0.6817538, -0.6825243, -2.147615, 1, 0, 0, 1, 1,
-0.679998, 0.4701328, 0.2283233, 1, 0, 0, 1, 1,
-0.6794567, -1.256066, -1.479506, 1, 0, 0, 1, 1,
-0.6747732, -1.827098, -2.206539, 0, 0, 0, 1, 1,
-0.6709426, 0.2375651, -0.05075548, 0, 0, 0, 1, 1,
-0.6691142, 0.04176078, -1.953598, 0, 0, 0, 1, 1,
-0.6668622, -0.5301442, -0.9997321, 0, 0, 0, 1, 1,
-0.6645252, 1.013414, 1.513895, 0, 0, 0, 1, 1,
-0.6557265, 0.04037792, -1.793247, 0, 0, 0, 1, 1,
-0.6503085, 0.3719844, -0.468545, 0, 0, 0, 1, 1,
-0.6415886, -0.4874316, -2.410713, 1, 1, 1, 1, 1,
-0.6360134, 0.3299207, -2.119942, 1, 1, 1, 1, 1,
-0.6278984, -0.2933018, -2.102, 1, 1, 1, 1, 1,
-0.6253375, -0.3164846, -0.7337602, 1, 1, 1, 1, 1,
-0.6218522, 0.2652794, -2.640175, 1, 1, 1, 1, 1,
-0.6215695, 1.412318, -0.6443497, 1, 1, 1, 1, 1,
-0.6211563, -0.9548116, -3.307761, 1, 1, 1, 1, 1,
-0.6193066, 0.1238945, -1.31357, 1, 1, 1, 1, 1,
-0.6187786, -0.922559, -3.599702, 1, 1, 1, 1, 1,
-0.6158246, 0.2177794, -1.76296, 1, 1, 1, 1, 1,
-0.6134081, -0.04351063, -1.235415, 1, 1, 1, 1, 1,
-0.6132149, 1.742335, 0.6627564, 1, 1, 1, 1, 1,
-0.6129323, -1.521893, -4.385586, 1, 1, 1, 1, 1,
-0.6019481, 0.9926494, 0.4837969, 1, 1, 1, 1, 1,
-0.5981817, 0.6653134, 1.118075, 1, 1, 1, 1, 1,
-0.5822571, -0.828722, -4.547942, 0, 0, 1, 1, 1,
-0.5817878, 0.5835484, 1.381565, 1, 0, 0, 1, 1,
-0.5685242, 1.778279, -0.868098, 1, 0, 0, 1, 1,
-0.5643488, 1.007512, -0.4912585, 1, 0, 0, 1, 1,
-0.5632041, 0.624985, -0.7883151, 1, 0, 0, 1, 1,
-0.5620456, -1.059863, -3.769212, 1, 0, 0, 1, 1,
-0.5611563, 1.466814, -0.2362309, 0, 0, 0, 1, 1,
-0.556452, 1.06333, -1.987132, 0, 0, 0, 1, 1,
-0.552139, -1.23982, -3.223158, 0, 0, 0, 1, 1,
-0.5363043, 0.6810517, -0.713366, 0, 0, 0, 1, 1,
-0.5329047, 0.02397545, -1.924667, 0, 0, 0, 1, 1,
-0.5323605, -0.6524219, -3.496495, 0, 0, 0, 1, 1,
-0.525519, -1.344582, -3.492893, 0, 0, 0, 1, 1,
-0.5192156, -0.1288767, -3.107097, 1, 1, 1, 1, 1,
-0.5162809, 0.4367103, -0.06088025, 1, 1, 1, 1, 1,
-0.5161829, -0.5535033, -3.442555, 1, 1, 1, 1, 1,
-0.5157236, -0.3979174, -1.260343, 1, 1, 1, 1, 1,
-0.5148568, -0.7437567, -1.14744, 1, 1, 1, 1, 1,
-0.5143526, 0.4907069, -1.735879, 1, 1, 1, 1, 1,
-0.5103145, 2.146353, 0.1037242, 1, 1, 1, 1, 1,
-0.504838, -0.7555215, -3.429918, 1, 1, 1, 1, 1,
-0.5024857, -0.1309583, -1.307483, 1, 1, 1, 1, 1,
-0.5018266, 1.086439, -0.9389889, 1, 1, 1, 1, 1,
-0.4970424, -0.4170889, 0.0971372, 1, 1, 1, 1, 1,
-0.4952336, 0.323753, -2.358612, 1, 1, 1, 1, 1,
-0.4947003, -0.1611295, -2.405998, 1, 1, 1, 1, 1,
-0.4872544, 0.8769529, -0.8702837, 1, 1, 1, 1, 1,
-0.4824243, 0.3433561, -1.295403, 1, 1, 1, 1, 1,
-0.4824153, 2.367018, -1.866749, 0, 0, 1, 1, 1,
-0.4782926, 0.9389453, 0.2807396, 1, 0, 0, 1, 1,
-0.4763294, 1.471362, -0.2002039, 1, 0, 0, 1, 1,
-0.4760691, 0.1412082, -1.236836, 1, 0, 0, 1, 1,
-0.4735869, -2.294559, -2.691986, 1, 0, 0, 1, 1,
-0.4720729, -0.5869352, -2.661271, 1, 0, 0, 1, 1,
-0.4718554, -0.07117645, -3.120163, 0, 0, 0, 1, 1,
-0.4663326, -1.125009, -3.243553, 0, 0, 0, 1, 1,
-0.4626074, -0.4474897, -3.326912, 0, 0, 0, 1, 1,
-0.4619302, -1.605888, -4.982275, 0, 0, 0, 1, 1,
-0.4564609, 1.110045, 1.059532, 0, 0, 0, 1, 1,
-0.4562574, 0.8941752, -0.2327551, 0, 0, 0, 1, 1,
-0.4536622, -1.783034, -3.97254, 0, 0, 0, 1, 1,
-0.4469149, -1.184776, -2.178997, 1, 1, 1, 1, 1,
-0.437868, -0.102841, -0.2662784, 1, 1, 1, 1, 1,
-0.4266094, -1.448536, -3.482893, 1, 1, 1, 1, 1,
-0.4238251, -1.330117, -2.102136, 1, 1, 1, 1, 1,
-0.4236332, -1.769814, -4.568814, 1, 1, 1, 1, 1,
-0.4157098, 0.9242101, 0.1121137, 1, 1, 1, 1, 1,
-0.4138742, 0.8886808, 0.120135, 1, 1, 1, 1, 1,
-0.4114298, 1.267444, -0.4881603, 1, 1, 1, 1, 1,
-0.4093311, -0.005636037, -1.778302, 1, 1, 1, 1, 1,
-0.4047608, -0.2435583, -1.396233, 1, 1, 1, 1, 1,
-0.4034852, -0.06562827, 0.06704227, 1, 1, 1, 1, 1,
-0.4018595, -0.1575916, -1.92136, 1, 1, 1, 1, 1,
-0.4016669, 1.196571, -0.2000332, 1, 1, 1, 1, 1,
-0.3979138, 0.7854035, -0.7765082, 1, 1, 1, 1, 1,
-0.3882675, 0.628993, 0.09331845, 1, 1, 1, 1, 1,
-0.3869858, -0.475545, -1.152498, 0, 0, 1, 1, 1,
-0.3851945, 2.009107, 0.7911017, 1, 0, 0, 1, 1,
-0.3842104, 1.047618, -0.2076091, 1, 0, 0, 1, 1,
-0.383333, 2.385297, 0.7842557, 1, 0, 0, 1, 1,
-0.3791602, 0.7201672, -0.1759385, 1, 0, 0, 1, 1,
-0.3778719, -0.03096217, -2.563509, 1, 0, 0, 1, 1,
-0.3691234, -0.3093455, -2.118581, 0, 0, 0, 1, 1,
-0.3653482, -1.402463, -4.411384, 0, 0, 0, 1, 1,
-0.3563921, 0.4342677, -1.73066, 0, 0, 0, 1, 1,
-0.354021, -0.4793456, -2.357506, 0, 0, 0, 1, 1,
-0.3529065, 1.833718, -0.7316955, 0, 0, 0, 1, 1,
-0.350329, 0.2842192, -0.1298194, 0, 0, 0, 1, 1,
-0.3409677, -1.271718, -3.361068, 0, 0, 0, 1, 1,
-0.3395091, -2.781649, -3.354992, 1, 1, 1, 1, 1,
-0.3327499, 0.1555316, 0.6655268, 1, 1, 1, 1, 1,
-0.3298283, 0.6698608, -2.071954, 1, 1, 1, 1, 1,
-0.3256384, 0.3582839, -1.405326, 1, 1, 1, 1, 1,
-0.3200803, -2.336037, -4.719126, 1, 1, 1, 1, 1,
-0.3109525, -0.7413526, -1.637827, 1, 1, 1, 1, 1,
-0.3007383, -0.08770741, -0.6364636, 1, 1, 1, 1, 1,
-0.2988861, -0.6746548, -1.75278, 1, 1, 1, 1, 1,
-0.2948184, 0.2753733, 0.08852256, 1, 1, 1, 1, 1,
-0.2934815, -0.3098353, -1.874161, 1, 1, 1, 1, 1,
-0.2891601, -0.5349093, -3.630032, 1, 1, 1, 1, 1,
-0.2863754, -0.6235396, -2.538904, 1, 1, 1, 1, 1,
-0.2793641, -0.4055178, -3.592835, 1, 1, 1, 1, 1,
-0.2791748, 0.4619767, -0.9133371, 1, 1, 1, 1, 1,
-0.2760319, -1.18054, -3.178281, 1, 1, 1, 1, 1,
-0.2735141, 0.1725352, -0.0883095, 0, 0, 1, 1, 1,
-0.2695744, 0.5586492, -0.716558, 1, 0, 0, 1, 1,
-0.2691399, 0.08643279, -0.8869325, 1, 0, 0, 1, 1,
-0.2683987, 0.01574579, -2.56045, 1, 0, 0, 1, 1,
-0.2665223, 1.593742, -0.2238363, 1, 0, 0, 1, 1,
-0.2631485, -0.6267901, -1.711959, 1, 0, 0, 1, 1,
-0.2624303, 0.623814, -1.008685, 0, 0, 0, 1, 1,
-0.2623536, 0.316776, -0.5673443, 0, 0, 0, 1, 1,
-0.261923, -0.0550843, -2.199669, 0, 0, 0, 1, 1,
-0.2606029, -0.6879728, -3.187381, 0, 0, 0, 1, 1,
-0.2593456, -0.726482, -4.659724, 0, 0, 0, 1, 1,
-0.2541758, 1.507404, 1.108758, 0, 0, 0, 1, 1,
-0.2513473, -0.9013451, -2.140619, 0, 0, 0, 1, 1,
-0.2501101, -1.136409, -1.962639, 1, 1, 1, 1, 1,
-0.2487182, -1.182334, -5.275322, 1, 1, 1, 1, 1,
-0.248684, -1.093443, -3.685918, 1, 1, 1, 1, 1,
-0.2428622, -0.07955762, -2.819363, 1, 1, 1, 1, 1,
-0.2420395, -0.7456985, -2.193861, 1, 1, 1, 1, 1,
-0.2414178, 2.093799, -0.619889, 1, 1, 1, 1, 1,
-0.238642, -1.195862, -2.615093, 1, 1, 1, 1, 1,
-0.2385537, -1.370217, -1.619899, 1, 1, 1, 1, 1,
-0.2337903, 0.2668481, 0.9307836, 1, 1, 1, 1, 1,
-0.2335149, -0.9525236, -3.696379, 1, 1, 1, 1, 1,
-0.2333864, -0.1656598, -3.065304, 1, 1, 1, 1, 1,
-0.2286687, -0.3893248, -3.630737, 1, 1, 1, 1, 1,
-0.2277564, -0.2045498, -1.488182, 1, 1, 1, 1, 1,
-0.2267023, -0.8937615, -2.765096, 1, 1, 1, 1, 1,
-0.2254549, 0.4348038, 0.6555672, 1, 1, 1, 1, 1,
-0.2253618, -3.762601, -3.057119, 0, 0, 1, 1, 1,
-0.223983, -0.1371634, -1.604676, 1, 0, 0, 1, 1,
-0.2237436, -0.9167334, -2.57937, 1, 0, 0, 1, 1,
-0.2195414, -1.056644, -2.660669, 1, 0, 0, 1, 1,
-0.219133, -0.655578, -0.4188532, 1, 0, 0, 1, 1,
-0.2189095, -0.3769939, -2.177263, 1, 0, 0, 1, 1,
-0.2160502, 1.699333, 1.095197, 0, 0, 0, 1, 1,
-0.2148898, 0.6644337, -0.4580305, 0, 0, 0, 1, 1,
-0.2130852, -0.3039931, -2.728269, 0, 0, 0, 1, 1,
-0.2110783, 0.2652401, -0.5028475, 0, 0, 0, 1, 1,
-0.2086628, -0.7381139, -4.443342, 0, 0, 0, 1, 1,
-0.2021727, -0.304465, -3.825338, 0, 0, 0, 1, 1,
-0.2008259, 1.664035, -0.8832533, 0, 0, 0, 1, 1,
-0.1990558, -0.2073597, -2.630901, 1, 1, 1, 1, 1,
-0.1990549, -0.8883541, -1.861892, 1, 1, 1, 1, 1,
-0.1988761, -0.8607743, -2.759898, 1, 1, 1, 1, 1,
-0.1968195, 0.6120056, -0.3792023, 1, 1, 1, 1, 1,
-0.1967387, -5.012645e-05, -0.939229, 1, 1, 1, 1, 1,
-0.1951462, -0.3299385, -4.481701, 1, 1, 1, 1, 1,
-0.1917862, -1.10514, -1.185403, 1, 1, 1, 1, 1,
-0.1865603, -0.05682961, -3.381323, 1, 1, 1, 1, 1,
-0.1769607, 0.8943996, -0.2414182, 1, 1, 1, 1, 1,
-0.1755589, 0.2620899, -0.8162389, 1, 1, 1, 1, 1,
-0.1687946, 0.5551385, -0.6638675, 1, 1, 1, 1, 1,
-0.1641766, -1.899166, -3.387577, 1, 1, 1, 1, 1,
-0.1635308, 1.055635, -0.09921184, 1, 1, 1, 1, 1,
-0.1614476, -0.5582076, -2.314967, 1, 1, 1, 1, 1,
-0.1603251, 0.1820835, 0.7824634, 1, 1, 1, 1, 1,
-0.159641, -1.213195, -2.766671, 0, 0, 1, 1, 1,
-0.1591871, 0.3910385, 1.19085, 1, 0, 0, 1, 1,
-0.1575981, -1.100685, -4.303477, 1, 0, 0, 1, 1,
-0.1574365, -1.792336, -1.556322, 1, 0, 0, 1, 1,
-0.1562602, 0.4213623, -0.1088916, 1, 0, 0, 1, 1,
-0.1517041, -0.6728402, -3.458439, 1, 0, 0, 1, 1,
-0.1476023, -0.07513666, -1.761883, 0, 0, 0, 1, 1,
-0.1433016, 0.7904316, -1.090585, 0, 0, 0, 1, 1,
-0.1385232, 1.091281, -1.21967, 0, 0, 0, 1, 1,
-0.1373158, 1.412419, 0.40783, 0, 0, 0, 1, 1,
-0.1365863, 0.380593, -0.8788413, 0, 0, 0, 1, 1,
-0.1288968, -0.3623706, -3.008193, 0, 0, 0, 1, 1,
-0.124465, -1.424641, -3.432009, 0, 0, 0, 1, 1,
-0.1224133, -1.044191, -1.983661, 1, 1, 1, 1, 1,
-0.1208647, -2.341823, -2.449617, 1, 1, 1, 1, 1,
-0.1200655, -0.6896533, -2.729781, 1, 1, 1, 1, 1,
-0.1193629, 0.2835666, -0.8932198, 1, 1, 1, 1, 1,
-0.1180305, 0.4823213, -0.9834467, 1, 1, 1, 1, 1,
-0.1172258, -1.505413, -3.587193, 1, 1, 1, 1, 1,
-0.1116959, -0.4041337, -1.023526, 1, 1, 1, 1, 1,
-0.1115925, 0.37883, 1.658428, 1, 1, 1, 1, 1,
-0.1109531, -0.03770987, -1.886527, 1, 1, 1, 1, 1,
-0.1109136, -0.2150451, -1.520902, 1, 1, 1, 1, 1,
-0.1102263, -0.6751953, -2.695281, 1, 1, 1, 1, 1,
-0.1093831, -1.185969, -3.775659, 1, 1, 1, 1, 1,
-0.1065912, 0.04924718, -1.475239, 1, 1, 1, 1, 1,
-0.1034359, 0.5806223, 1.09011, 1, 1, 1, 1, 1,
-0.102153, -1.201613, -1.269232, 1, 1, 1, 1, 1,
-0.09633778, -0.4786319, -2.237469, 0, 0, 1, 1, 1,
-0.09246238, 1.823197, -1.469538, 1, 0, 0, 1, 1,
-0.09210059, -0.3226844, -3.722202, 1, 0, 0, 1, 1,
-0.09069125, -0.6589299, -2.259326, 1, 0, 0, 1, 1,
-0.08936942, -0.4395656, -3.457444, 1, 0, 0, 1, 1,
-0.08536785, -1.338609, -3.770799, 1, 0, 0, 1, 1,
-0.08351171, -1.682842, -3.042983, 0, 0, 0, 1, 1,
-0.08151817, 1.118264, -1.394987, 0, 0, 0, 1, 1,
-0.0774707, 1.862021, 1.939622, 0, 0, 0, 1, 1,
-0.07616916, -0.5168509, -3.090997, 0, 0, 0, 1, 1,
-0.07301736, -0.8578268, -3.184599, 0, 0, 0, 1, 1,
-0.07161122, -1.745405, -4.129086, 0, 0, 0, 1, 1,
-0.06951118, 0.5649821, -0.8636866, 0, 0, 0, 1, 1,
-0.06921394, 0.7777302, 0.8723655, 1, 1, 1, 1, 1,
-0.06763265, -0.2985258, -3.883238, 1, 1, 1, 1, 1,
-0.06602405, 0.56585, 0.7666264, 1, 1, 1, 1, 1,
-0.05945336, -1.256269, -2.928591, 1, 1, 1, 1, 1,
-0.0571786, -0.5444697, -3.356366, 1, 1, 1, 1, 1,
-0.0553121, -0.1708645, -4.839246, 1, 1, 1, 1, 1,
-0.05196072, 1.249124, -1.167592, 1, 1, 1, 1, 1,
-0.05001751, -0.3362667, -2.557378, 1, 1, 1, 1, 1,
-0.04899366, 0.4896626, 0.8795227, 1, 1, 1, 1, 1,
-0.04521957, 0.2819741, -2.340357, 1, 1, 1, 1, 1,
-0.04469242, -0.01999531, -3.391738, 1, 1, 1, 1, 1,
-0.03956692, 2.217517, 0.9124144, 1, 1, 1, 1, 1,
-0.03843314, 1.921765, -0.6649909, 1, 1, 1, 1, 1,
-0.03257489, 0.8015452, -0.01873929, 1, 1, 1, 1, 1,
-0.03212325, 0.08205969, -1.386048, 1, 1, 1, 1, 1,
-0.0316478, 0.3243577, -1.046774, 0, 0, 1, 1, 1,
-0.03059522, 0.2941563, 1.757076, 1, 0, 0, 1, 1,
-0.02930601, 1.263331, 1.157183, 1, 0, 0, 1, 1,
-0.02804338, -2.300406, -3.51475, 1, 0, 0, 1, 1,
-0.0267569, 0.5329813, -0.6113643, 1, 0, 0, 1, 1,
-0.02618989, -1.130704, -3.425803, 1, 0, 0, 1, 1,
-0.0232469, 0.2028161, -0.359385, 0, 0, 0, 1, 1,
-0.02211249, -0.9304056, -2.557207, 0, 0, 0, 1, 1,
-0.02168531, 1.522365, 0.7559504, 0, 0, 0, 1, 1,
-0.01189456, 1.041881, -1.451239, 0, 0, 0, 1, 1,
-0.01005985, 0.5686305, -0.6339995, 0, 0, 0, 1, 1,
-0.007019035, 0.8181269, 1.183214, 0, 0, 0, 1, 1,
-0.006686845, -0.2968968, -1.981619, 0, 0, 0, 1, 1,
0.001015277, 0.809633, 1.348088, 1, 1, 1, 1, 1,
0.00363554, 0.2673886, -0.5024153, 1, 1, 1, 1, 1,
0.004821173, -0.8425896, 2.497107, 1, 1, 1, 1, 1,
0.007076373, -0.1200685, 3.66501, 1, 1, 1, 1, 1,
0.009307346, 1.512098, 1.640772, 1, 1, 1, 1, 1,
0.01015779, -1.300333, 1.958172, 1, 1, 1, 1, 1,
0.01360496, 0.9082666, 1.007041, 1, 1, 1, 1, 1,
0.01430964, -0.2270314, 3.769119, 1, 1, 1, 1, 1,
0.02003613, -0.3501152, 3.529406, 1, 1, 1, 1, 1,
0.02311997, -1.244118, 5.343912, 1, 1, 1, 1, 1,
0.02557341, 0.3272772, -1.248616, 1, 1, 1, 1, 1,
0.02579554, 0.1249719, 0.4125231, 1, 1, 1, 1, 1,
0.02596228, -1.065682, 4.800517, 1, 1, 1, 1, 1,
0.02679804, 0.545566, -0.2603005, 1, 1, 1, 1, 1,
0.03001891, 0.6267458, 0.6954409, 1, 1, 1, 1, 1,
0.03213149, 1.523512, 1.229847, 0, 0, 1, 1, 1,
0.03305861, -0.195975, 3.867101, 1, 0, 0, 1, 1,
0.03463685, 1.736113, -2.110495, 1, 0, 0, 1, 1,
0.03584018, -0.4913274, 2.819399, 1, 0, 0, 1, 1,
0.04050111, -0.446284, 3.300038, 1, 0, 0, 1, 1,
0.04116664, -0.1688099, 2.742494, 1, 0, 0, 1, 1,
0.0413413, 1.024859, -0.6584904, 0, 0, 0, 1, 1,
0.04208006, 0.4089275, 0.02317443, 0, 0, 0, 1, 1,
0.04277843, 0.389072, -0.4696103, 0, 0, 0, 1, 1,
0.04783111, 0.806264, -2.124785, 0, 0, 0, 1, 1,
0.05269315, 0.4680993, -0.1652849, 0, 0, 0, 1, 1,
0.05357247, -1.029002, 1.795281, 0, 0, 0, 1, 1,
0.05544029, 2.027442, -0.9493045, 0, 0, 0, 1, 1,
0.06200793, -1.072685, 2.455536, 1, 1, 1, 1, 1,
0.0625214, -0.3648583, 4.409025, 1, 1, 1, 1, 1,
0.06338031, 0.1300746, 1.246665, 1, 1, 1, 1, 1,
0.06912705, 0.9777155, -0.2701516, 1, 1, 1, 1, 1,
0.06965627, -0.9818175, 4.29123, 1, 1, 1, 1, 1,
0.07267731, 0.07348216, 0.5886539, 1, 1, 1, 1, 1,
0.07325546, -1.077845, 3.460586, 1, 1, 1, 1, 1,
0.07436761, 0.3887359, 0.309262, 1, 1, 1, 1, 1,
0.07582691, -0.1417094, 4.476483, 1, 1, 1, 1, 1,
0.07711409, -0.7001802, 3.028143, 1, 1, 1, 1, 1,
0.07755762, 0.002912578, 1.070795, 1, 1, 1, 1, 1,
0.07956164, -0.03566646, -0.1733068, 1, 1, 1, 1, 1,
0.08035716, 0.3457881, -0.1952558, 1, 1, 1, 1, 1,
0.08466455, 1.484398, 0.7390814, 1, 1, 1, 1, 1,
0.08512394, -0.5979366, 2.537497, 1, 1, 1, 1, 1,
0.08590351, 0.5949798, 0.05420185, 0, 0, 1, 1, 1,
0.08602048, 0.5747181, 0.8214651, 1, 0, 0, 1, 1,
0.0861301, -1.09059, 2.451219, 1, 0, 0, 1, 1,
0.08664296, -0.8744533, 2.408462, 1, 0, 0, 1, 1,
0.09099092, 0.241305, 1.159613, 1, 0, 0, 1, 1,
0.09951881, -0.2291978, 0.9837297, 1, 0, 0, 1, 1,
0.1036207, 3.110399, -0.7584115, 0, 0, 0, 1, 1,
0.1066036, 1.237941, 0.8845363, 0, 0, 0, 1, 1,
0.1075598, -0.779173, 3.714167, 0, 0, 0, 1, 1,
0.1090826, 0.3349805, -1.146487, 0, 0, 0, 1, 1,
0.1153893, -0.311166, 3.410848, 0, 0, 0, 1, 1,
0.118264, -2.992093, 3.245095, 0, 0, 0, 1, 1,
0.1195304, 0.4432132, 0.5736929, 0, 0, 0, 1, 1,
0.1244156, 0.9149359, -1.00448, 1, 1, 1, 1, 1,
0.1275019, 2.623969, 0.8796946, 1, 1, 1, 1, 1,
0.1322533, -0.5070447, 2.924818, 1, 1, 1, 1, 1,
0.1324313, 0.3682684, -2.589952, 1, 1, 1, 1, 1,
0.1336587, 1.101074, -1.876268, 1, 1, 1, 1, 1,
0.1380403, 1.364712, -1.654074, 1, 1, 1, 1, 1,
0.1390799, -0.6927018, 1.324396, 1, 1, 1, 1, 1,
0.1412272, -0.4884246, 3.696126, 1, 1, 1, 1, 1,
0.1420915, -1.959565, 3.799767, 1, 1, 1, 1, 1,
0.143077, 1.630077, 1.522633, 1, 1, 1, 1, 1,
0.1458321, 1.221736, -0.8828628, 1, 1, 1, 1, 1,
0.1480543, -0.8934431, 2.77038, 1, 1, 1, 1, 1,
0.149709, 0.5861104, -1.182953, 1, 1, 1, 1, 1,
0.1548088, -0.328855, 2.598276, 1, 1, 1, 1, 1,
0.1608486, -0.5142996, 1.660089, 1, 1, 1, 1, 1,
0.164413, -0.9452941, 0.5005786, 0, 0, 1, 1, 1,
0.1679371, -0.1987286, 2.71176, 1, 0, 0, 1, 1,
0.1687833, 1.21109, -0.06283859, 1, 0, 0, 1, 1,
0.1727976, 0.4504494, -2.154929, 1, 0, 0, 1, 1,
0.173398, 0.6200376, 0.2235527, 1, 0, 0, 1, 1,
0.1738688, 0.5360482, 1.633309, 1, 0, 0, 1, 1,
0.1748889, 2.470924, 2.140424, 0, 0, 0, 1, 1,
0.1783287, 0.2249144, 1.305822, 0, 0, 0, 1, 1,
0.1823058, 0.5194291, -0.7956616, 0, 0, 0, 1, 1,
0.1832082, -0.7848641, 4.402874, 0, 0, 0, 1, 1,
0.1854444, -1.307254, 2.849429, 0, 0, 0, 1, 1,
0.1873778, -0.06527871, 2.580786, 0, 0, 0, 1, 1,
0.1875584, 0.4639115, 0.2874175, 0, 0, 0, 1, 1,
0.1906433, 0.1256932, -0.9005317, 1, 1, 1, 1, 1,
0.1912022, -0.2084336, 2.630907, 1, 1, 1, 1, 1,
0.196787, 1.723283, 0.8138468, 1, 1, 1, 1, 1,
0.1979708, -0.9661448, 3.037029, 1, 1, 1, 1, 1,
0.1994006, -0.3454034, 5.050958, 1, 1, 1, 1, 1,
0.2002078, 0.3759379, 1.870863, 1, 1, 1, 1, 1,
0.203147, 1.031638, 0.8486235, 1, 1, 1, 1, 1,
0.2044977, -1.546016, 3.463419, 1, 1, 1, 1, 1,
0.2046679, 0.08973257, 1.925594, 1, 1, 1, 1, 1,
0.2084217, 0.4087689, 0.7652243, 1, 1, 1, 1, 1,
0.2108398, 0.5823164, 0.5028154, 1, 1, 1, 1, 1,
0.2137128, 3.028884, -1.034073, 1, 1, 1, 1, 1,
0.2163967, -0.1086796, 1.138325, 1, 1, 1, 1, 1,
0.2194618, 0.7140308, 0.07264397, 1, 1, 1, 1, 1,
0.2206826, -0.7508844, 2.908944, 1, 1, 1, 1, 1,
0.2215904, -0.5467397, 2.606412, 0, 0, 1, 1, 1,
0.2268083, 0.3079631, 0.7098775, 1, 0, 0, 1, 1,
0.2274488, -0.1671308, 0.4523091, 1, 0, 0, 1, 1,
0.2374825, -0.2373591, 0.8420592, 1, 0, 0, 1, 1,
0.2417167, -1.313033, 2.473822, 1, 0, 0, 1, 1,
0.2429623, -0.1422154, 1.93209, 1, 0, 0, 1, 1,
0.2447014, 0.5417498, 1.201768, 0, 0, 0, 1, 1,
0.2487638, -1.164577, 1.411722, 0, 0, 0, 1, 1,
0.2552079, 1.531019, -1.565935, 0, 0, 0, 1, 1,
0.257735, 0.4409432, 0.5181956, 0, 0, 0, 1, 1,
0.2592207, 0.7759614, 2.776003, 0, 0, 0, 1, 1,
0.2595165, 0.3210156, 0.7044564, 0, 0, 0, 1, 1,
0.2623391, -0.6665529, 1.768551, 0, 0, 0, 1, 1,
0.2680451, 0.308965, 2.080587, 1, 1, 1, 1, 1,
0.2680587, -0.2158643, 3.484681, 1, 1, 1, 1, 1,
0.2689603, 0.629583, 0.8099127, 1, 1, 1, 1, 1,
0.2691803, 2.160659, -1.185394, 1, 1, 1, 1, 1,
0.2691905, -0.9317471, 3.634803, 1, 1, 1, 1, 1,
0.2716798, 0.7695591, 0.05905044, 1, 1, 1, 1, 1,
0.275782, -1.281411, 2.109143, 1, 1, 1, 1, 1,
0.2772126, -1.013111, 3.421646, 1, 1, 1, 1, 1,
0.2783026, 0.01716528, 0.3542857, 1, 1, 1, 1, 1,
0.2798297, -0.355478, 3.160362, 1, 1, 1, 1, 1,
0.2836721, 1.99727, -0.5398967, 1, 1, 1, 1, 1,
0.2949455, -0.1167912, 3.017983, 1, 1, 1, 1, 1,
0.3006138, 0.8324443, 0.7393451, 1, 1, 1, 1, 1,
0.304244, -0.8217493, 4.330418, 1, 1, 1, 1, 1,
0.3120836, -0.095504, 2.373573, 1, 1, 1, 1, 1,
0.3153718, -0.4732061, 2.968261, 0, 0, 1, 1, 1,
0.316486, 1.225936, -0.9959773, 1, 0, 0, 1, 1,
0.3166678, -0.846073, 3.32815, 1, 0, 0, 1, 1,
0.319062, -1.936152, 2.695911, 1, 0, 0, 1, 1,
0.3215925, 0.3228525, -0.624376, 1, 0, 0, 1, 1,
0.3247694, -0.6579292, 1.538686, 1, 0, 0, 1, 1,
0.3277985, 0.02005408, 1.260772, 0, 0, 0, 1, 1,
0.3453351, -0.3480135, 4.004299, 0, 0, 0, 1, 1,
0.3468024, -0.2323317, 0.9565378, 0, 0, 0, 1, 1,
0.3501217, -1.709758, 2.211122, 0, 0, 0, 1, 1,
0.3511751, -0.07264178, 3.025281, 0, 0, 0, 1, 1,
0.3513925, -2.967929, 2.737429, 0, 0, 0, 1, 1,
0.3524226, -0.8081341, 2.61195, 0, 0, 0, 1, 1,
0.3568903, 0.5047011, 0.1838835, 1, 1, 1, 1, 1,
0.3597391, -1.3871, 2.702697, 1, 1, 1, 1, 1,
0.3600583, 0.6516216, 1.717229, 1, 1, 1, 1, 1,
0.3603743, 2.282447, 2.07641, 1, 1, 1, 1, 1,
0.3612643, -1.243693, 3.867082, 1, 1, 1, 1, 1,
0.3684714, 0.5560051, 1.249248, 1, 1, 1, 1, 1,
0.3697791, -0.489991, 0.05049103, 1, 1, 1, 1, 1,
0.3709749, -0.8144196, 4.051879, 1, 1, 1, 1, 1,
0.374133, -0.7511505, 2.7068, 1, 1, 1, 1, 1,
0.3744278, -0.2367952, 2.224324, 1, 1, 1, 1, 1,
0.3797643, 0.1021776, 1.979436, 1, 1, 1, 1, 1,
0.3812265, -0.1481392, 1.406889, 1, 1, 1, 1, 1,
0.3823712, 0.9084936, 0.4986039, 1, 1, 1, 1, 1,
0.382861, 0.734713, 2.636574, 1, 1, 1, 1, 1,
0.3878678, -0.4208156, 1.921215, 1, 1, 1, 1, 1,
0.3897818, 0.4902923, 1.534121, 0, 0, 1, 1, 1,
0.3924736, 0.9416085, 0.5349057, 1, 0, 0, 1, 1,
0.393899, 1.443242, 0.863574, 1, 0, 0, 1, 1,
0.4041491, -0.6257995, 2.043242, 1, 0, 0, 1, 1,
0.4042661, 1.044086, -1.072638, 1, 0, 0, 1, 1,
0.4098164, -0.2824091, 2.785905, 1, 0, 0, 1, 1,
0.4103645, -0.06019776, 0.7897538, 0, 0, 0, 1, 1,
0.4105507, -0.6442716, 2.847837, 0, 0, 0, 1, 1,
0.4141984, 0.6376464, 2.038632, 0, 0, 0, 1, 1,
0.4165768, -1.614072, 4.081661, 0, 0, 0, 1, 1,
0.4178407, 2.318127, 0.564949, 0, 0, 0, 1, 1,
0.428255, 0.377619, 1.280827, 0, 0, 0, 1, 1,
0.4318577, 1.109848, 1.01327, 0, 0, 0, 1, 1,
0.4326032, -0.3103148, 1.796918, 1, 1, 1, 1, 1,
0.4351093, 0.1139563, 1.565947, 1, 1, 1, 1, 1,
0.4407465, 0.5576676, 2.238799, 1, 1, 1, 1, 1,
0.4414733, -0.4848881, 1.055894, 1, 1, 1, 1, 1,
0.4459927, 0.850524, 1.284481, 1, 1, 1, 1, 1,
0.447661, 0.419337, 2.482585, 1, 1, 1, 1, 1,
0.4479414, 0.7386174, 2.304877, 1, 1, 1, 1, 1,
0.449063, 1.768795, 0.589397, 1, 1, 1, 1, 1,
0.4513371, 0.3741487, 1.731271, 1, 1, 1, 1, 1,
0.4544319, 1.652316, 0.2845312, 1, 1, 1, 1, 1,
0.4545869, 0.3045628, 0.8444383, 1, 1, 1, 1, 1,
0.4556422, 0.5793484, 1.306458, 1, 1, 1, 1, 1,
0.4603751, -0.7157638, 3.120203, 1, 1, 1, 1, 1,
0.4663167, 1.062848, 0.2912913, 1, 1, 1, 1, 1,
0.4688508, 0.3626044, 0.8401574, 1, 1, 1, 1, 1,
0.4700698, 0.3479697, 0.304675, 0, 0, 1, 1, 1,
0.4738816, -1.177173, 3.93131, 1, 0, 0, 1, 1,
0.4761978, 0.8346946, 0.4120621, 1, 0, 0, 1, 1,
0.4784449, 0.9193124, 1.835454, 1, 0, 0, 1, 1,
0.4819218, 0.7266783, 1.835918, 1, 0, 0, 1, 1,
0.4828558, -0.04607776, 0.5663162, 1, 0, 0, 1, 1,
0.4834567, -0.07354396, 1.79577, 0, 0, 0, 1, 1,
0.4886714, 1.140249, 1.683624, 0, 0, 0, 1, 1,
0.4892998, 1.383813, 1.27331, 0, 0, 0, 1, 1,
0.4933434, 0.4451564, 1.870366, 0, 0, 0, 1, 1,
0.4940199, 0.5879633, 0.008532697, 0, 0, 0, 1, 1,
0.4940497, 0.5290995, -1.202035, 0, 0, 0, 1, 1,
0.5036596, -0.5537627, 1.604578, 0, 0, 0, 1, 1,
0.5061027, -0.1381559, 1.94567, 1, 1, 1, 1, 1,
0.5091596, -0.4706284, 4.527496, 1, 1, 1, 1, 1,
0.510552, -0.1777122, 2.072161, 1, 1, 1, 1, 1,
0.5143026, 0.2354892, 1.819794, 1, 1, 1, 1, 1,
0.5179664, -1.502138, 2.304397, 1, 1, 1, 1, 1,
0.5190026, -1.097264, 2.737108, 1, 1, 1, 1, 1,
0.5208638, -1.659548, 2.423185, 1, 1, 1, 1, 1,
0.5211682, 2.370822, 1.659436, 1, 1, 1, 1, 1,
0.5213143, 0.08727417, 2.122805, 1, 1, 1, 1, 1,
0.5225072, -0.5636377, 1.131976, 1, 1, 1, 1, 1,
0.5249274, -0.6618015, 3.452421, 1, 1, 1, 1, 1,
0.5321276, 0.1900954, 2.777844, 1, 1, 1, 1, 1,
0.5338581, 1.39358, 1.177525, 1, 1, 1, 1, 1,
0.5371914, 1.619529, -0.3425188, 1, 1, 1, 1, 1,
0.5389673, -0.008034589, 2.209435, 1, 1, 1, 1, 1,
0.5401599, 0.5288572, 0.06361662, 0, 0, 1, 1, 1,
0.5402089, -0.04464964, 1.938914, 1, 0, 0, 1, 1,
0.5491932, -0.1993024, 1.896474, 1, 0, 0, 1, 1,
0.5494645, -1.115222, 0.9842799, 1, 0, 0, 1, 1,
0.5502213, -0.5157178, 0.5538567, 1, 0, 0, 1, 1,
0.5512508, -1.095736, 1.527202, 1, 0, 0, 1, 1,
0.5531773, 1.700033, 2.324063, 0, 0, 0, 1, 1,
0.560847, -1.368255, 3.002772, 0, 0, 0, 1, 1,
0.5618927, 0.5493574, 0.03124262, 0, 0, 0, 1, 1,
0.5631191, 0.3993829, 1.672688, 0, 0, 0, 1, 1,
0.5659783, -0.3979439, 2.820153, 0, 0, 0, 1, 1,
0.569327, -0.7736499, 4.447388, 0, 0, 0, 1, 1,
0.5696384, -0.8456597, 1.88541, 0, 0, 0, 1, 1,
0.5709098, -1.226856, 3.840691, 1, 1, 1, 1, 1,
0.5712072, -1.181319, 1.774015, 1, 1, 1, 1, 1,
0.5804641, -1.62794, 3.470107, 1, 1, 1, 1, 1,
0.5817808, 0.8675995, 1.112145, 1, 1, 1, 1, 1,
0.5891979, -0.8484747, 3.336041, 1, 1, 1, 1, 1,
0.5908063, -1.833312, 1.988809, 1, 1, 1, 1, 1,
0.5924908, -0.322513, 2.61451, 1, 1, 1, 1, 1,
0.5940868, 0.1786213, 0.1357162, 1, 1, 1, 1, 1,
0.5998556, -0.227693, 3.878093, 1, 1, 1, 1, 1,
0.6013435, -0.4388238, 2.983716, 1, 1, 1, 1, 1,
0.6015319, 0.5738938, 0.8317857, 1, 1, 1, 1, 1,
0.6028597, -0.4779726, 2.873082, 1, 1, 1, 1, 1,
0.6050791, -1.783112, 1.863514, 1, 1, 1, 1, 1,
0.6068906, -1.122341, 1.66242, 1, 1, 1, 1, 1,
0.6142491, -0.05501962, 1.37499, 1, 1, 1, 1, 1,
0.6180926, 0.1635391, -0.5481764, 0, 0, 1, 1, 1,
0.6188377, 0.4027312, 3.926784, 1, 0, 0, 1, 1,
0.6221999, 1.264334, 1.757658, 1, 0, 0, 1, 1,
0.6225644, -0.3320363, 3.570653, 1, 0, 0, 1, 1,
0.622601, 0.2553959, 2.431638, 1, 0, 0, 1, 1,
0.6232567, 1.20992, -0.01650644, 1, 0, 0, 1, 1,
0.6235777, -0.7654887, 2.481438, 0, 0, 0, 1, 1,
0.624505, -0.8725707, 1.460005, 0, 0, 0, 1, 1,
0.6427609, 0.9290359, 2.041009, 0, 0, 0, 1, 1,
0.6439382, -0.7034514, 2.49962, 0, 0, 0, 1, 1,
0.6439929, 0.5196753, 1.374881, 0, 0, 0, 1, 1,
0.6501718, -0.6752894, 2.74682, 0, 0, 0, 1, 1,
0.6547586, -0.8598616, 3.716619, 0, 0, 0, 1, 1,
0.6582933, -0.1699979, 0.7180612, 1, 1, 1, 1, 1,
0.6605428, 0.3636605, 1.51361, 1, 1, 1, 1, 1,
0.6606178, 0.138021, 1.750156, 1, 1, 1, 1, 1,
0.6616642, 0.7546365, 2.323796, 1, 1, 1, 1, 1,
0.6794447, 0.9570069, -0.6113122, 1, 1, 1, 1, 1,
0.6804919, -1.005871, 3.383285, 1, 1, 1, 1, 1,
0.6815464, -0.3970769, 2.838898, 1, 1, 1, 1, 1,
0.6844064, 0.3569133, 2.131947, 1, 1, 1, 1, 1,
0.6884378, -0.8954502, 2.001839, 1, 1, 1, 1, 1,
0.6903276, -1.87636, 0.7880805, 1, 1, 1, 1, 1,
0.6945729, 0.193096, 3.306524, 1, 1, 1, 1, 1,
0.6955515, -0.4208823, 0.3157437, 1, 1, 1, 1, 1,
0.7028239, -0.1725534, 1.429147, 1, 1, 1, 1, 1,
0.7042879, -0.04757106, 2.46634, 1, 1, 1, 1, 1,
0.7111354, -0.09213354, 1.594856, 1, 1, 1, 1, 1,
0.7117186, -0.374394, 0.2624401, 0, 0, 1, 1, 1,
0.7120433, -0.6660544, 2.392461, 1, 0, 0, 1, 1,
0.7134688, -0.06216752, 2.028964, 1, 0, 0, 1, 1,
0.7228742, 0.3276722, -0.4388625, 1, 0, 0, 1, 1,
0.7399385, -1.391625, 0.7342148, 1, 0, 0, 1, 1,
0.7429401, -0.5631575, 2.984374, 1, 0, 0, 1, 1,
0.7532256, -0.1693157, 2.278231, 0, 0, 0, 1, 1,
0.7553216, 0.7986113, 1.340246, 0, 0, 0, 1, 1,
0.7634944, 1.478228, 0.4135629, 0, 0, 0, 1, 1,
0.7652541, 1.399251, 0.4011499, 0, 0, 0, 1, 1,
0.7715366, 0.4181947, 2.851375, 0, 0, 0, 1, 1,
0.7727377, 1.490054, -1.364028, 0, 0, 0, 1, 1,
0.7728068, -1.590549, 2.476026, 0, 0, 0, 1, 1,
0.7752286, 1.065692, 4.014439, 1, 1, 1, 1, 1,
0.7757011, -0.395915, 0.9282726, 1, 1, 1, 1, 1,
0.7769651, 1.095744, -0.6937641, 1, 1, 1, 1, 1,
0.7831995, 0.5478625, 0.4628529, 1, 1, 1, 1, 1,
0.7898144, -0.00600465, 2.561924, 1, 1, 1, 1, 1,
0.7947474, -0.9262815, 1.618981, 1, 1, 1, 1, 1,
0.7967813, 1.335659, 1.772782, 1, 1, 1, 1, 1,
0.79713, 0.6049016, 1.152136, 1, 1, 1, 1, 1,
0.8001847, -0.6391379, 3.051212, 1, 1, 1, 1, 1,
0.8163548, -1.156357, 0.09517296, 1, 1, 1, 1, 1,
0.8174023, 0.3948869, 2.883177, 1, 1, 1, 1, 1,
0.8198073, -0.5122501, 4.099996, 1, 1, 1, 1, 1,
0.8341185, 0.2968966, 1.261505, 1, 1, 1, 1, 1,
0.8353037, 0.3541014, 0.4675399, 1, 1, 1, 1, 1,
0.8421027, -0.07442258, 0.405925, 1, 1, 1, 1, 1,
0.8471236, 1.332364, -1.263894, 0, 0, 1, 1, 1,
0.8472978, -0.2555108, 0.2496109, 1, 0, 0, 1, 1,
0.8478447, 0.5989828, 0.3554384, 1, 0, 0, 1, 1,
0.8489164, 0.3453545, 1.772389, 1, 0, 0, 1, 1,
0.8547211, -0.06459378, 1.240345, 1, 0, 0, 1, 1,
0.8593872, -0.7225536, 1.620875, 1, 0, 0, 1, 1,
0.8628043, 1.872781, 1.979679, 0, 0, 0, 1, 1,
0.8661538, -1.246202, 2.264965, 0, 0, 0, 1, 1,
0.8687262, -1.224625, 2.961401, 0, 0, 0, 1, 1,
0.8701259, -0.8100114, 3.093049, 0, 0, 0, 1, 1,
0.8745947, -0.2438142, 2.350922, 0, 0, 0, 1, 1,
0.8776502, 2.021168, 0.03477491, 0, 0, 0, 1, 1,
0.8817962, 1.922849, -1.512, 0, 0, 0, 1, 1,
0.8881217, 0.9584689, 1.082653, 1, 1, 1, 1, 1,
0.8923504, 1.495265, 1.772348, 1, 1, 1, 1, 1,
0.8987964, -1.144083, 3.688148, 1, 1, 1, 1, 1,
0.9006807, 0.8639537, 1.998352, 1, 1, 1, 1, 1,
0.9020405, -0.1770852, 0.07824463, 1, 1, 1, 1, 1,
0.9095724, -1.041928, 1.610818, 1, 1, 1, 1, 1,
0.9144056, -0.990898, 1.143796, 1, 1, 1, 1, 1,
0.9204634, -0.1571709, 0.5938041, 1, 1, 1, 1, 1,
0.926158, -0.006438324, 1.877341, 1, 1, 1, 1, 1,
0.9276611, -0.008600563, 1.668523, 1, 1, 1, 1, 1,
0.9277137, -1.269579, 3.660134, 1, 1, 1, 1, 1,
0.9372854, 0.5822057, 0.4968885, 1, 1, 1, 1, 1,
0.9421178, 0.5512402, 3.208973, 1, 1, 1, 1, 1,
0.9445379, 2.668489, 1.461021, 1, 1, 1, 1, 1,
0.9525178, -0.2358956, 3.039957, 1, 1, 1, 1, 1,
0.9639485, -0.133662, 1.260476, 0, 0, 1, 1, 1,
0.9640288, 0.3313287, 1.349859, 1, 0, 0, 1, 1,
0.968455, -0.1514234, 2.881671, 1, 0, 0, 1, 1,
0.9707488, 0.03791327, 1.554813, 1, 0, 0, 1, 1,
0.9756901, 0.658593, 2.6949, 1, 0, 0, 1, 1,
0.9773241, -0.7453182, 2.92762, 1, 0, 0, 1, 1,
0.9811486, 1.443013, 1.286305, 0, 0, 0, 1, 1,
0.986788, -2.097212, 2.663071, 0, 0, 0, 1, 1,
0.9887767, -0.9010543, 1.599098, 0, 0, 0, 1, 1,
0.9907635, 1.8716, 1.908993, 0, 0, 0, 1, 1,
0.996662, 1.038477, 1.242683, 0, 0, 0, 1, 1,
1.007111, -0.1221444, -0.2492139, 0, 0, 0, 1, 1,
1.0073, -1.61109, 4.720727, 0, 0, 0, 1, 1,
1.01348, -0.2843498, 0.6215762, 1, 1, 1, 1, 1,
1.015617, 1.106644, 0.1826918, 1, 1, 1, 1, 1,
1.016395, 0.8269532, 0.7944804, 1, 1, 1, 1, 1,
1.017041, 0.4204723, 0.3158842, 1, 1, 1, 1, 1,
1.021059, -1.880927, 4.316293, 1, 1, 1, 1, 1,
1.025636, 0.4897151, 2.610598, 1, 1, 1, 1, 1,
1.033103, 1.447279, 0.05380755, 1, 1, 1, 1, 1,
1.033718, 0.8343924, 1.979194, 1, 1, 1, 1, 1,
1.034095, -0.4705813, 2.702595, 1, 1, 1, 1, 1,
1.03493, -1.225149, 2.783051, 1, 1, 1, 1, 1,
1.036678, 0.3917637, 0.1197046, 1, 1, 1, 1, 1,
1.03916, 0.02650026, 2.206499, 1, 1, 1, 1, 1,
1.042514, 0.1417235, 0.8038023, 1, 1, 1, 1, 1,
1.044161, 0.9912346, 0.641176, 1, 1, 1, 1, 1,
1.046188, 0.8308914, 0.6115208, 1, 1, 1, 1, 1,
1.048908, 1.635672, 1.220283, 0, 0, 1, 1, 1,
1.049463, 0.810047, 0.5393134, 1, 0, 0, 1, 1,
1.04964, -0.4917883, 2.034873, 1, 0, 0, 1, 1,
1.051097, 1.244904, 0.2171882, 1, 0, 0, 1, 1,
1.051211, 0.07867054, 2.030416, 1, 0, 0, 1, 1,
1.052906, -0.1657165, 2.600761, 1, 0, 0, 1, 1,
1.061186, -1.188003, 3.238741, 0, 0, 0, 1, 1,
1.065262, -0.6699891, 1.811015, 0, 0, 0, 1, 1,
1.065898, 0.8411891, 0.4303634, 0, 0, 0, 1, 1,
1.068867, -0.2987035, 1.258187, 0, 0, 0, 1, 1,
1.068921, -0.8777727, 2.603084, 0, 0, 0, 1, 1,
1.069647, 2.094704, 1.488748, 0, 0, 0, 1, 1,
1.071132, -0.06178855, 2.385177, 0, 0, 0, 1, 1,
1.071417, 0.82384, 1.309743, 1, 1, 1, 1, 1,
1.075738, -0.2447639, 0.6702728, 1, 1, 1, 1, 1,
1.077588, -0.1448075, 0.9227283, 1, 1, 1, 1, 1,
1.079962, -0.4617521, 2.570759, 1, 1, 1, 1, 1,
1.082135, -0.9324183, 2.568462, 1, 1, 1, 1, 1,
1.101193, -1.687295, 2.771464, 1, 1, 1, 1, 1,
1.101619, 0.9575799, 0.02979953, 1, 1, 1, 1, 1,
1.102686, 0.08801528, 1.553857, 1, 1, 1, 1, 1,
1.10281, -0.048409, 3.621814, 1, 1, 1, 1, 1,
1.107607, 0.1370442, 0.9462454, 1, 1, 1, 1, 1,
1.11115, 0.4075496, 1.03713, 1, 1, 1, 1, 1,
1.115107, 0.5457143, 3.340562, 1, 1, 1, 1, 1,
1.125371, -0.01039029, 1.082201, 1, 1, 1, 1, 1,
1.130979, 0.2530081, 0.5129666, 1, 1, 1, 1, 1,
1.136258, -0.08296704, 2.300865, 1, 1, 1, 1, 1,
1.142974, 0.2822722, 2.535403, 0, 0, 1, 1, 1,
1.158551, -0.1104523, 0.3475886, 1, 0, 0, 1, 1,
1.160958, -1.978724, 3.428771, 1, 0, 0, 1, 1,
1.163986, 0.2355401, 0.7920902, 1, 0, 0, 1, 1,
1.169714, -0.3047485, 0.3127631, 1, 0, 0, 1, 1,
1.170622, -1.303372, 3.702693, 1, 0, 0, 1, 1,
1.174793, 0.7466106, 1.760991, 0, 0, 0, 1, 1,
1.176845, -0.3112909, 1.108356, 0, 0, 0, 1, 1,
1.177088, 1.614599, 1.375611, 0, 0, 0, 1, 1,
1.181935, 1.407534, 0.2093082, 0, 0, 0, 1, 1,
1.185315, -1.559948, 3.170148, 0, 0, 0, 1, 1,
1.187109, 0.3161193, 1.524577, 0, 0, 0, 1, 1,
1.193344, -1.471174, 1.702517, 0, 0, 0, 1, 1,
1.198161, -1.607947, 3.936759, 1, 1, 1, 1, 1,
1.211956, -1.02181, 2.728635, 1, 1, 1, 1, 1,
1.218361, 0.5719639, 1.117006, 1, 1, 1, 1, 1,
1.219177, -0.7197488, 2.634407, 1, 1, 1, 1, 1,
1.219626, 0.5157669, 1.701348, 1, 1, 1, 1, 1,
1.219913, -0.07131692, 1.375932, 1, 1, 1, 1, 1,
1.223811, 0.2633107, 2.330208, 1, 1, 1, 1, 1,
1.24296, 0.6383753, -0.05451573, 1, 1, 1, 1, 1,
1.243184, -0.8642012, 2.003464, 1, 1, 1, 1, 1,
1.246583, 0.984751, 0.3613162, 1, 1, 1, 1, 1,
1.248478, -0.5704277, 3.424724, 1, 1, 1, 1, 1,
1.250301, 0.2808112, 0.8045428, 1, 1, 1, 1, 1,
1.267193, 0.4810475, 0.9860509, 1, 1, 1, 1, 1,
1.272471, -0.9133871, 3.825248, 1, 1, 1, 1, 1,
1.302835, 2.04793, 1.793302, 1, 1, 1, 1, 1,
1.307516, -0.3365135, 1.277741, 0, 0, 1, 1, 1,
1.308485, -1.213861, 3.787818, 1, 0, 0, 1, 1,
1.31424, -1.310296, 1.318913, 1, 0, 0, 1, 1,
1.315264, -0.3708792, -0.5048236, 1, 0, 0, 1, 1,
1.316819, 1.538272, 0.800703, 1, 0, 0, 1, 1,
1.334788, 0.2870077, 1.762063, 1, 0, 0, 1, 1,
1.352975, 0.965319, 0.621356, 0, 0, 0, 1, 1,
1.354987, 0.7952199, 0.6229815, 0, 0, 0, 1, 1,
1.356967, 0.2980902, -0.3396254, 0, 0, 0, 1, 1,
1.357827, -1.229227, 1.00814, 0, 0, 0, 1, 1,
1.35816, 1.096621, -1.2612, 0, 0, 0, 1, 1,
1.372891, 0.5796069, -0.9196969, 0, 0, 0, 1, 1,
1.389311, -0.7637024, 3.206798, 0, 0, 0, 1, 1,
1.393579, -0.1445466, 0.9854614, 1, 1, 1, 1, 1,
1.42649, 0.2769653, 0.2645942, 1, 1, 1, 1, 1,
1.430282, -0.3201279, 1.283559, 1, 1, 1, 1, 1,
1.432517, 0.3489189, 2.457822, 1, 1, 1, 1, 1,
1.43417, 0.2593994, 3.195316, 1, 1, 1, 1, 1,
1.442933, 0.2775354, 1.818024, 1, 1, 1, 1, 1,
1.444631, 0.4683549, 2.464039, 1, 1, 1, 1, 1,
1.445786, -0.4242339, 0.8552087, 1, 1, 1, 1, 1,
1.44844, -1.636934, 2.117116, 1, 1, 1, 1, 1,
1.451092, 0.8153989, 2.810733, 1, 1, 1, 1, 1,
1.452547, -0.3356785, 0.4149049, 1, 1, 1, 1, 1,
1.457866, -0.6284528, 2.493159, 1, 1, 1, 1, 1,
1.47536, -0.6443208, 2.718176, 1, 1, 1, 1, 1,
1.476955, -2.622317, 1.849308, 1, 1, 1, 1, 1,
1.478469, -0.6668488, 2.598226, 1, 1, 1, 1, 1,
1.479976, -0.6768557, 2.794432, 0, 0, 1, 1, 1,
1.494824, -0.5901601, 2.778017, 1, 0, 0, 1, 1,
1.517923, 2.108334, 1.905079, 1, 0, 0, 1, 1,
1.527184, 0.282548, 1.104499, 1, 0, 0, 1, 1,
1.529451, -1.861534, 2.170659, 1, 0, 0, 1, 1,
1.532374, 1.627827, -0.5982496, 1, 0, 0, 1, 1,
1.53546, 0.7164865, 2.913037, 0, 0, 0, 1, 1,
1.5363, 0.2542171, 2.909731, 0, 0, 0, 1, 1,
1.541687, -0.4765081, 1.991357, 0, 0, 0, 1, 1,
1.548226, -0.3014657, 1.352493, 0, 0, 0, 1, 1,
1.550624, 0.3290484, 2.641339, 0, 0, 0, 1, 1,
1.551912, -0.7569168, 2.217998, 0, 0, 0, 1, 1,
1.558841, -1.581536, 2.957608, 0, 0, 0, 1, 1,
1.560185, -0.03357573, 1.603691, 1, 1, 1, 1, 1,
1.562065, -0.5288708, 0.4164018, 1, 1, 1, 1, 1,
1.573456, 0.01874557, 2.686008, 1, 1, 1, 1, 1,
1.577773, -0.5973161, 0.8760252, 1, 1, 1, 1, 1,
1.584558, -0.4410917, 4.364151, 1, 1, 1, 1, 1,
1.586878, 0.3862817, 0.03284312, 1, 1, 1, 1, 1,
1.604864, -1.277401, 1.27507, 1, 1, 1, 1, 1,
1.611844, -1.932512, 3.786376, 1, 1, 1, 1, 1,
1.646593, -0.7394862, 2.085992, 1, 1, 1, 1, 1,
1.655132, -0.4635316, 1.645121, 1, 1, 1, 1, 1,
1.657584, -0.05039769, 2.398552, 1, 1, 1, 1, 1,
1.65892, 1.812308, -0.2021693, 1, 1, 1, 1, 1,
1.677498, -0.04132127, 2.101949, 1, 1, 1, 1, 1,
1.68097, -0.8093439, 2.537498, 1, 1, 1, 1, 1,
1.708804, -1.91152, 2.410964, 1, 1, 1, 1, 1,
1.759187, -0.7505894, 3.668529, 0, 0, 1, 1, 1,
1.769825, -0.04532922, 1.714476, 1, 0, 0, 1, 1,
1.780171, 0.8670745, 1.030475, 1, 0, 0, 1, 1,
1.780833, 0.08468549, 1.865911, 1, 0, 0, 1, 1,
1.785976, 0.8704919, 1.973382, 1, 0, 0, 1, 1,
1.789419, 1.382579, 0.6290357, 1, 0, 0, 1, 1,
1.796671, 0.0390766, 2.54642, 0, 0, 0, 1, 1,
1.801444, 0.1928924, 3.458377, 0, 0, 0, 1, 1,
1.874874, -0.5271007, 2.27456, 0, 0, 0, 1, 1,
1.878546, 0.6404061, 2.077185, 0, 0, 0, 1, 1,
1.886956, 0.1918869, 2.630961, 0, 0, 0, 1, 1,
1.919853, -0.1566211, 1.419047, 0, 0, 0, 1, 1,
1.939429, 0.5490091, 3.004701, 0, 0, 0, 1, 1,
1.941386, -0.6084328, 2.280201, 1, 1, 1, 1, 1,
1.96184, 0.9753364, 1.74476, 1, 1, 1, 1, 1,
1.961994, 1.603643, -0.6101003, 1, 1, 1, 1, 1,
1.964097, 1.426245, 1.651542, 1, 1, 1, 1, 1,
1.968959, -1.265687, 3.610355, 1, 1, 1, 1, 1,
1.987727, -2.894179, 2.363312, 1, 1, 1, 1, 1,
1.996484, 2.238211, 1.738791, 1, 1, 1, 1, 1,
1.997229, 0.3435034, 1.572221, 1, 1, 1, 1, 1,
2.010971, 3.180848, 0.9242542, 1, 1, 1, 1, 1,
2.036301, 0.9463624, -0.7016943, 1, 1, 1, 1, 1,
2.046755, -0.6825467, 2.679695, 1, 1, 1, 1, 1,
2.062468, 0.2795429, 0.7489954, 1, 1, 1, 1, 1,
2.06312, 1.74923, -0.5935678, 1, 1, 1, 1, 1,
2.121535, 0.6668006, 1.456493, 1, 1, 1, 1, 1,
2.12815, -0.5600756, 1.81206, 1, 1, 1, 1, 1,
2.165733, 0.6526624, 0.8284535, 0, 0, 1, 1, 1,
2.176381, 1.110713, 0.08989284, 1, 0, 0, 1, 1,
2.196461, 1.027189, 1.058334, 1, 0, 0, 1, 1,
2.202066, 0.2092166, 1.737091, 1, 0, 0, 1, 1,
2.218237, 1.291937, -1.686151, 1, 0, 0, 1, 1,
2.240046, -0.4916562, 1.716481, 1, 0, 0, 1, 1,
2.295035, -1.895941, 2.842449, 0, 0, 0, 1, 1,
2.309904, 1.042033, 0.316563, 0, 0, 0, 1, 1,
2.353405, 0.9319903, 2.835024, 0, 0, 0, 1, 1,
2.353824, 0.5703265, 1.092444, 0, 0, 0, 1, 1,
2.402919, -0.4385921, 2.668763, 0, 0, 0, 1, 1,
2.410752, 1.088071, 0.274373, 0, 0, 0, 1, 1,
2.41099, -1.237343, -0.5109342, 0, 0, 0, 1, 1,
2.44651, 0.4659007, 2.118239, 1, 1, 1, 1, 1,
2.583578, 1.243404, -0.2273288, 1, 1, 1, 1, 1,
2.610535, 0.1598607, 1.83852, 1, 1, 1, 1, 1,
2.653855, -0.3978264, 1.4569, 1, 1, 1, 1, 1,
2.715617, -1.953526, 3.253516, 1, 1, 1, 1, 1,
2.948163, 1.469609, 1.388967, 1, 1, 1, 1, 1,
3.043386, 0.5755841, 2.853482, 1, 1, 1, 1, 1
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
var radius = 9.619995;
var distance = 33.78983;
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
mvMatrix.translate( 0.04015636, 0.2908766, -0.03429461 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.78983);
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
