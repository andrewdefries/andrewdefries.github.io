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
-2.793077, -1.074546, -1.705075, 1, 0, 0, 1,
-2.6945, -0.4601432, -2.529681, 1, 0.007843138, 0, 1,
-2.647568, -1.45646, -1.784334, 1, 0.01176471, 0, 1,
-2.60225, -1.204403, -3.42941, 1, 0.01960784, 0, 1,
-2.587175, -0.6926886, -2.573124, 1, 0.02352941, 0, 1,
-2.347891, -0.2627181, -0.8465227, 1, 0.03137255, 0, 1,
-2.344855, -0.9143085, -1.044868, 1, 0.03529412, 0, 1,
-2.341317, -0.09727598, -0.6343762, 1, 0.04313726, 0, 1,
-2.305902, 0.5339914, -1.045306, 1, 0.04705882, 0, 1,
-2.275156, 0.8354184, -1.556067, 1, 0.05490196, 0, 1,
-2.27138, -0.1178504, 0.1814192, 1, 0.05882353, 0, 1,
-2.26806, 0.4075024, -2.565089, 1, 0.06666667, 0, 1,
-2.252641, 0.9747444, -0.3257818, 1, 0.07058824, 0, 1,
-2.250652, -0.5851445, -1.883919, 1, 0.07843138, 0, 1,
-2.207994, 0.474685, -2.261272, 1, 0.08235294, 0, 1,
-2.165387, 0.6814465, -0.9354509, 1, 0.09019608, 0, 1,
-2.138688, -0.2038971, -1.636106, 1, 0.09411765, 0, 1,
-2.126387, -1.570114, -1.228735, 1, 0.1019608, 0, 1,
-2.113394, 1.853201, -0.9085392, 1, 0.1098039, 0, 1,
-2.066837, -1.571346, -1.914896, 1, 0.1137255, 0, 1,
-2.051425, 0.4743655, -2.449291, 1, 0.1215686, 0, 1,
-2.028861, -0.6510127, -2.272682, 1, 0.1254902, 0, 1,
-2.008285, 0.3184082, -3.45479, 1, 0.1333333, 0, 1,
-2.007531, 0.4649955, -2.565685, 1, 0.1372549, 0, 1,
-1.990072, 0.7021582, 0.6352897, 1, 0.145098, 0, 1,
-1.973113, 0.7747751, -1.402895, 1, 0.1490196, 0, 1,
-1.914109, -0.838092, -2.773489, 1, 0.1568628, 0, 1,
-1.897639, -2.766093, -1.404444, 1, 0.1607843, 0, 1,
-1.890721, 1.544059, -0.4040954, 1, 0.1686275, 0, 1,
-1.882927, -0.1341735, -2.560331, 1, 0.172549, 0, 1,
-1.878465, -0.7724996, -1.578641, 1, 0.1803922, 0, 1,
-1.878397, -1.008206, -1.951426, 1, 0.1843137, 0, 1,
-1.876284, 2.2252, -1.256368, 1, 0.1921569, 0, 1,
-1.873868, 0.09422588, -1.14577, 1, 0.1960784, 0, 1,
-1.841303, 0.768832, -0.50658, 1, 0.2039216, 0, 1,
-1.804093, -0.439235, -0.9254262, 1, 0.2117647, 0, 1,
-1.778152, 1.818764, 0.7776067, 1, 0.2156863, 0, 1,
-1.773003, -0.6726685, -3.827969, 1, 0.2235294, 0, 1,
-1.761508, 0.5762135, -1.10429, 1, 0.227451, 0, 1,
-1.749387, 0.4660184, -2.888436, 1, 0.2352941, 0, 1,
-1.741028, -0.6859462, -1.0736, 1, 0.2392157, 0, 1,
-1.738682, -0.1653608, -1.580747, 1, 0.2470588, 0, 1,
-1.708679, -0.04253916, -1.087418, 1, 0.2509804, 0, 1,
-1.678874, -1.59206, -1.81539, 1, 0.2588235, 0, 1,
-1.676996, 0.8082904, -1.175786, 1, 0.2627451, 0, 1,
-1.665094, -0.2537747, -1.109776, 1, 0.2705882, 0, 1,
-1.633542, -1.488752, -3.122919, 1, 0.2745098, 0, 1,
-1.633271, -1.806129, -2.392099, 1, 0.282353, 0, 1,
-1.632091, -0.479988, 0.5168899, 1, 0.2862745, 0, 1,
-1.630455, -0.1605106, -2.821749, 1, 0.2941177, 0, 1,
-1.627121, -0.9341873, -0.1853355, 1, 0.3019608, 0, 1,
-1.622713, -0.4990641, -0.9392362, 1, 0.3058824, 0, 1,
-1.610408, 0.2362466, -0.08171785, 1, 0.3137255, 0, 1,
-1.606967, 0.1870213, -1.987941, 1, 0.3176471, 0, 1,
-1.606688, 0.2947523, -0.8573843, 1, 0.3254902, 0, 1,
-1.605478, -0.02362249, -1.235957, 1, 0.3294118, 0, 1,
-1.604499, -0.500118, -1.902785, 1, 0.3372549, 0, 1,
-1.603647, 1.424714, 1.273037, 1, 0.3411765, 0, 1,
-1.603386, -0.8459128, -0.667264, 1, 0.3490196, 0, 1,
-1.592679, -1.295721, -4.265909, 1, 0.3529412, 0, 1,
-1.588547, 1.038537, -0.1553845, 1, 0.3607843, 0, 1,
-1.582706, 0.2787738, -1.159412, 1, 0.3647059, 0, 1,
-1.572486, -0.8178168, -1.794391, 1, 0.372549, 0, 1,
-1.522676, 0.4597349, -1.730618, 1, 0.3764706, 0, 1,
-1.51403, 0.7979915, -0.8595043, 1, 0.3843137, 0, 1,
-1.506692, 2.63922, 0.3977355, 1, 0.3882353, 0, 1,
-1.496588, 1.342479, -0.9425101, 1, 0.3960784, 0, 1,
-1.493826, -1.080642, -3.386218, 1, 0.4039216, 0, 1,
-1.492555, -1.09919, -0.829623, 1, 0.4078431, 0, 1,
-1.490058, -0.3346562, -1.672091, 1, 0.4156863, 0, 1,
-1.47544, 0.3038781, -2.787712, 1, 0.4196078, 0, 1,
-1.468367, 0.2038148, -0.9329012, 1, 0.427451, 0, 1,
-1.459829, -0.1152237, -0.7760797, 1, 0.4313726, 0, 1,
-1.457091, 1.041948, -1.071829, 1, 0.4392157, 0, 1,
-1.4559, -0.8257679, -2.981008, 1, 0.4431373, 0, 1,
-1.450478, -0.3584207, -1.938647, 1, 0.4509804, 0, 1,
-1.437033, 0.05558321, -1.211025, 1, 0.454902, 0, 1,
-1.426988, -0.6762357, -1.288532, 1, 0.4627451, 0, 1,
-1.426642, -0.439154, -1.701664, 1, 0.4666667, 0, 1,
-1.412763, 0.8376464, 2.366988, 1, 0.4745098, 0, 1,
-1.411198, -0.2804189, -1.560283, 1, 0.4784314, 0, 1,
-1.395706, -0.2474167, -0.4109534, 1, 0.4862745, 0, 1,
-1.391752, -0.00356912, -1.498959, 1, 0.4901961, 0, 1,
-1.370769, -1.903908, -3.36521, 1, 0.4980392, 0, 1,
-1.356855, -1.315414, -4.90901, 1, 0.5058824, 0, 1,
-1.356152, 0.1881691, -1.32765, 1, 0.509804, 0, 1,
-1.350346, -0.7272562, -2.83402, 1, 0.5176471, 0, 1,
-1.347244, -0.4590725, 0.01277585, 1, 0.5215687, 0, 1,
-1.338967, -1.391484, -1.855386, 1, 0.5294118, 0, 1,
-1.337186, -0.9221154, -2.227729, 1, 0.5333334, 0, 1,
-1.330866, 1.695725, -1.565901, 1, 0.5411765, 0, 1,
-1.323404, 1.581617, 0.3577221, 1, 0.5450981, 0, 1,
-1.321318, 0.7540843, -1.442686, 1, 0.5529412, 0, 1,
-1.315136, -1.614142, -4.027853, 1, 0.5568628, 0, 1,
-1.311117, 0.03755634, -2.500454, 1, 0.5647059, 0, 1,
-1.303587, 1.409783, -0.9580405, 1, 0.5686275, 0, 1,
-1.293524, 0.3725001, -2.667205, 1, 0.5764706, 0, 1,
-1.29175, 0.734331, -0.09624082, 1, 0.5803922, 0, 1,
-1.285228, 0.7756028, -1.616323, 1, 0.5882353, 0, 1,
-1.283911, -0.08721756, -0.6440663, 1, 0.5921569, 0, 1,
-1.279105, 0.3612543, -0.7478101, 1, 0.6, 0, 1,
-1.278991, -2.42179, -4.468753, 1, 0.6078432, 0, 1,
-1.276872, -1.64228, -2.458867, 1, 0.6117647, 0, 1,
-1.276547, 1.018239, -2.559497, 1, 0.6196079, 0, 1,
-1.261925, -1.034847, -1.88249, 1, 0.6235294, 0, 1,
-1.259572, 0.8762396, -2.956916, 1, 0.6313726, 0, 1,
-1.249493, 0.1272817, -2.428995, 1, 0.6352941, 0, 1,
-1.247411, 1.451213, -2.59929, 1, 0.6431373, 0, 1,
-1.23338, 0.5840466, -2.0354, 1, 0.6470588, 0, 1,
-1.232661, 0.7604405, -1.023224, 1, 0.654902, 0, 1,
-1.228814, -0.6007218, -3.391268, 1, 0.6588235, 0, 1,
-1.224857, -0.09870079, -0.4144924, 1, 0.6666667, 0, 1,
-1.216513, 0.352902, -0.121347, 1, 0.6705883, 0, 1,
-1.216024, 0.3843048, -0.2803934, 1, 0.6784314, 0, 1,
-1.186786, -1.387573, -2.104145, 1, 0.682353, 0, 1,
-1.183039, 0.4352288, -2.270319, 1, 0.6901961, 0, 1,
-1.180714, 1.42988, 0.1812067, 1, 0.6941177, 0, 1,
-1.174788, 1.830734, -1.3804, 1, 0.7019608, 0, 1,
-1.17339, 0.8048578, 1.139806, 1, 0.7098039, 0, 1,
-1.169896, -0.5623523, -2.264194, 1, 0.7137255, 0, 1,
-1.167562, 0.5219386, -1.774641, 1, 0.7215686, 0, 1,
-1.162517, -0.7713687, -2.347389, 1, 0.7254902, 0, 1,
-1.159557, 0.3365948, -1.803452, 1, 0.7333333, 0, 1,
-1.157434, 0.3974972, -1.160897, 1, 0.7372549, 0, 1,
-1.157042, 0.2986702, -0.5893425, 1, 0.7450981, 0, 1,
-1.155833, -0.3968989, -0.6359341, 1, 0.7490196, 0, 1,
-1.146041, -0.5737776, -1.26098, 1, 0.7568628, 0, 1,
-1.145435, -0.6784967, -3.308211, 1, 0.7607843, 0, 1,
-1.139486, -0.4712763, -1.764574, 1, 0.7686275, 0, 1,
-1.137586, -0.6113792, -2.391344, 1, 0.772549, 0, 1,
-1.135108, -1.262682, -1.290895, 1, 0.7803922, 0, 1,
-1.134211, -0.2877724, -2.70807, 1, 0.7843137, 0, 1,
-1.133958, -0.1732951, -0.2369474, 1, 0.7921569, 0, 1,
-1.133417, -2.349859, -1.227463, 1, 0.7960784, 0, 1,
-1.128254, 2.012383, 0.8368951, 1, 0.8039216, 0, 1,
-1.126974, 1.086885, -1.574184, 1, 0.8117647, 0, 1,
-1.126586, -0.3623028, -0.4349816, 1, 0.8156863, 0, 1,
-1.126256, 0.9703975, -0.9897556, 1, 0.8235294, 0, 1,
-1.125207, 0.4539395, -2.252594, 1, 0.827451, 0, 1,
-1.124892, 1.324273, 0.864507, 1, 0.8352941, 0, 1,
-1.113154, 1.166267, -0.2437567, 1, 0.8392157, 0, 1,
-1.111157, 0.5304191, -1.401942, 1, 0.8470588, 0, 1,
-1.103153, 2.605476, -0.5515442, 1, 0.8509804, 0, 1,
-1.097395, -1.029563, -3.017677, 1, 0.8588235, 0, 1,
-1.0971, 0.2451147, -1.926876, 1, 0.8627451, 0, 1,
-1.080443, -2.237107, -3.960523, 1, 0.8705882, 0, 1,
-1.066022, 0.331306, -1.363434, 1, 0.8745098, 0, 1,
-1.065093, 0.6584942, -1.210581, 1, 0.8823529, 0, 1,
-1.06506, 1.179801, -2.964304, 1, 0.8862745, 0, 1,
-1.059052, -0.3107467, -0.9644923, 1, 0.8941177, 0, 1,
-1.057524, 0.8284123, -0.5836024, 1, 0.8980392, 0, 1,
-1.053139, -0.07594716, -1.318087, 1, 0.9058824, 0, 1,
-1.049575, -0.3353333, -0.8913891, 1, 0.9137255, 0, 1,
-1.049405, 0.8955191, -3.791416, 1, 0.9176471, 0, 1,
-1.049201, -0.3356957, -1.736608, 1, 0.9254902, 0, 1,
-1.048657, -0.1253806, -1.893878, 1, 0.9294118, 0, 1,
-1.048536, 0.1241264, -1.943035, 1, 0.9372549, 0, 1,
-1.042585, 1.52158, -0.977221, 1, 0.9411765, 0, 1,
-1.039918, -0.711813, -3.488068, 1, 0.9490196, 0, 1,
-1.038423, 0.4421441, -0.7726009, 1, 0.9529412, 0, 1,
-1.036765, -0.145068, -1.224289, 1, 0.9607843, 0, 1,
-1.030246, -0.1906154, -0.6889291, 1, 0.9647059, 0, 1,
-1.028231, 0.005843191, -0.6651442, 1, 0.972549, 0, 1,
-1.02702, -0.7328933, -1.709947, 1, 0.9764706, 0, 1,
-1.017021, 0.5078911, -2.687053, 1, 0.9843137, 0, 1,
-1.014206, -1.164883, -2.230491, 1, 0.9882353, 0, 1,
-1.011611, 0.8125114, -1.257358, 1, 0.9960784, 0, 1,
-1.003398, 0.3197228, -0.9859383, 0.9960784, 1, 0, 1,
-1.00326, 1.72886, -0.9242197, 0.9921569, 1, 0, 1,
-1.000354, 0.8912488, -0.8771192, 0.9843137, 1, 0, 1,
-0.9984984, -1.316608, -0.5988834, 0.9803922, 1, 0, 1,
-0.9976013, 0.4687953, -0.7229236, 0.972549, 1, 0, 1,
-0.9957442, 0.1656359, -3.62364, 0.9686275, 1, 0, 1,
-0.9856586, -0.2273217, -3.719182, 0.9607843, 1, 0, 1,
-0.972194, -1.698805, -3.386897, 0.9568627, 1, 0, 1,
-0.9693633, 0.5144552, -0.7272256, 0.9490196, 1, 0, 1,
-0.9634089, -0.3996186, -0.8451318, 0.945098, 1, 0, 1,
-0.9540595, 0.1268206, -2.487447, 0.9372549, 1, 0, 1,
-0.9510787, -2.908051, -3.027745, 0.9333333, 1, 0, 1,
-0.9495781, -0.001974321, -1.939591, 0.9254902, 1, 0, 1,
-0.9484071, -0.9229575, -2.109777, 0.9215686, 1, 0, 1,
-0.9480308, -0.2166456, -1.259838, 0.9137255, 1, 0, 1,
-0.947681, -0.06326485, -3.594112, 0.9098039, 1, 0, 1,
-0.9459623, 0.4998415, -0.7273327, 0.9019608, 1, 0, 1,
-0.9457209, -0.04743083, -1.541976, 0.8941177, 1, 0, 1,
-0.9412015, -2.452856, -3.825204, 0.8901961, 1, 0, 1,
-0.9410827, 0.8438925, -1.099609, 0.8823529, 1, 0, 1,
-0.9349317, -1.598499, -2.079999, 0.8784314, 1, 0, 1,
-0.933579, 0.1970535, -1.286639, 0.8705882, 1, 0, 1,
-0.92211, -0.6481999, -4.112199, 0.8666667, 1, 0, 1,
-0.921024, -1.182975, -3.688246, 0.8588235, 1, 0, 1,
-0.9189438, -1.787032, -2.568126, 0.854902, 1, 0, 1,
-0.9172169, 0.8190371, -2.402287, 0.8470588, 1, 0, 1,
-0.9162749, -0.1676967, -0.3395364, 0.8431373, 1, 0, 1,
-0.9116251, -1.599316, -3.399019, 0.8352941, 1, 0, 1,
-0.9040233, 0.5172619, -1.927189, 0.8313726, 1, 0, 1,
-0.9021525, -0.7703397, -3.670256, 0.8235294, 1, 0, 1,
-0.8927511, -1.260303, -3.076557, 0.8196079, 1, 0, 1,
-0.8868665, -0.6828546, -4.82682, 0.8117647, 1, 0, 1,
-0.8800036, 0.627225, -0.4366909, 0.8078431, 1, 0, 1,
-0.8776972, -3.374949, -2.733591, 0.8, 1, 0, 1,
-0.8764491, 1.21064, -1.984394, 0.7921569, 1, 0, 1,
-0.8732682, -0.3140193, -3.690067, 0.7882353, 1, 0, 1,
-0.8721976, 1.818447, -1.467739, 0.7803922, 1, 0, 1,
-0.8712451, -1.344607, -2.540177, 0.7764706, 1, 0, 1,
-0.8672706, 0.5718486, -1.885909, 0.7686275, 1, 0, 1,
-0.8670517, 0.9188464, -0.744804, 0.7647059, 1, 0, 1,
-0.8656627, 2.540563, -1.722868, 0.7568628, 1, 0, 1,
-0.8630981, 1.098679, -1.786262, 0.7529412, 1, 0, 1,
-0.8590214, 0.1847938, -0.4233572, 0.7450981, 1, 0, 1,
-0.857589, 0.6844073, 0.03813051, 0.7411765, 1, 0, 1,
-0.8535477, -1.321818, -0.1401379, 0.7333333, 1, 0, 1,
-0.8526636, -0.328361, -1.589092, 0.7294118, 1, 0, 1,
-0.8503985, -0.2635588, -3.668269, 0.7215686, 1, 0, 1,
-0.8453734, 0.2346906, -0.3754242, 0.7176471, 1, 0, 1,
-0.8423645, 1.324975, -0.768603, 0.7098039, 1, 0, 1,
-0.8287848, -0.00360395, -2.593369, 0.7058824, 1, 0, 1,
-0.8204476, 1.369919, -1.264484, 0.6980392, 1, 0, 1,
-0.8198017, -0.8343908, -0.847743, 0.6901961, 1, 0, 1,
-0.8196378, -1.042428, -2.679735, 0.6862745, 1, 0, 1,
-0.8192118, 0.1302955, -3.33121, 0.6784314, 1, 0, 1,
-0.8163657, 1.461541, -0.6707219, 0.6745098, 1, 0, 1,
-0.8153946, -0.8167254, -0.948281, 0.6666667, 1, 0, 1,
-0.8143388, -0.5889894, -1.356194, 0.6627451, 1, 0, 1,
-0.8091142, 0.7093559, -0.8102556, 0.654902, 1, 0, 1,
-0.8059855, -0.7463377, -3.141441, 0.6509804, 1, 0, 1,
-0.7974011, 0.3922715, -1.698653, 0.6431373, 1, 0, 1,
-0.7950928, 0.08319075, -0.3975157, 0.6392157, 1, 0, 1,
-0.7851507, -1.041072, -1.493158, 0.6313726, 1, 0, 1,
-0.7846006, -1.573225, -0.9131206, 0.627451, 1, 0, 1,
-0.7824197, 1.48977, 1.557585, 0.6196079, 1, 0, 1,
-0.7772446, -0.5339426, -1.896127, 0.6156863, 1, 0, 1,
-0.772131, 0.9917393, 1.455708, 0.6078432, 1, 0, 1,
-0.7690473, 1.36742, 0.4822807, 0.6039216, 1, 0, 1,
-0.7681231, -0.4771189, -2.133242, 0.5960785, 1, 0, 1,
-0.7667432, -1.050694, -1.89609, 0.5882353, 1, 0, 1,
-0.7617382, 0.8965222, -1.571965, 0.5843138, 1, 0, 1,
-0.7509443, -0.8056755, -2.192176, 0.5764706, 1, 0, 1,
-0.7474322, -0.7195208, -3.290964, 0.572549, 1, 0, 1,
-0.7360747, -1.562486, -3.542635, 0.5647059, 1, 0, 1,
-0.7251543, -0.157344, -1.20258, 0.5607843, 1, 0, 1,
-0.7245383, 0.09230859, -2.554004, 0.5529412, 1, 0, 1,
-0.7240486, -0.8422151, -3.310996, 0.5490196, 1, 0, 1,
-0.7205357, 0.7598187, -0.8510106, 0.5411765, 1, 0, 1,
-0.7202969, 0.8356006, -2.684711, 0.5372549, 1, 0, 1,
-0.7158701, -0.003630996, -1.444005, 0.5294118, 1, 0, 1,
-0.708959, 1.471664, -2.345128, 0.5254902, 1, 0, 1,
-0.7081493, 1.308517, 0.5087007, 0.5176471, 1, 0, 1,
-0.7078753, 0.148723, -2.506891, 0.5137255, 1, 0, 1,
-0.7070758, 0.6955402, -1.068339, 0.5058824, 1, 0, 1,
-0.7037436, -0.0161518, -3.22048, 0.5019608, 1, 0, 1,
-0.7036511, -0.9673116, -0.9124597, 0.4941176, 1, 0, 1,
-0.7021419, 0.4150749, -1.387813, 0.4862745, 1, 0, 1,
-0.6926945, 0.4457585, -0.911976, 0.4823529, 1, 0, 1,
-0.6892737, -1.141145, -3.48986, 0.4745098, 1, 0, 1,
-0.6844866, 0.3802104, -2.256787, 0.4705882, 1, 0, 1,
-0.6821939, 0.8097712, -1.925358, 0.4627451, 1, 0, 1,
-0.680176, 0.3709949, -1.413283, 0.4588235, 1, 0, 1,
-0.6783864, 0.2703321, -2.112525, 0.4509804, 1, 0, 1,
-0.6749185, 0.0510146, -1.498606, 0.4470588, 1, 0, 1,
-0.666996, -3.310502, -2.748638, 0.4392157, 1, 0, 1,
-0.6650143, -0.07847384, -2.422129, 0.4352941, 1, 0, 1,
-0.6648455, -1.48579, -1.988867, 0.427451, 1, 0, 1,
-0.6613764, -0.1020507, -0.6723424, 0.4235294, 1, 0, 1,
-0.6550367, 0.7320514, -1.016606, 0.4156863, 1, 0, 1,
-0.6544432, -0.727601, -1.700889, 0.4117647, 1, 0, 1,
-0.6519805, -0.8513796, -0.4397327, 0.4039216, 1, 0, 1,
-0.6515142, 0.5069305, 0.8304841, 0.3960784, 1, 0, 1,
-0.6478041, 0.6986208, -1.03577, 0.3921569, 1, 0, 1,
-0.6465725, -0.5450879, -2.178944, 0.3843137, 1, 0, 1,
-0.6370525, 0.4825196, -1.385946, 0.3803922, 1, 0, 1,
-0.6369612, 0.106262, -2.06752, 0.372549, 1, 0, 1,
-0.6319736, -1.66235, -1.909535, 0.3686275, 1, 0, 1,
-0.6160511, 1.383097, -0.547002, 0.3607843, 1, 0, 1,
-0.6154628, -2.14161, -0.9795637, 0.3568628, 1, 0, 1,
-0.6137124, 0.1366881, -2.4817, 0.3490196, 1, 0, 1,
-0.6096222, -0.8055288, -3.141934, 0.345098, 1, 0, 1,
-0.6086758, -1.666135, -2.59281, 0.3372549, 1, 0, 1,
-0.6081141, 1.615615, 0.7273089, 0.3333333, 1, 0, 1,
-0.6018859, 0.06902132, -1.494977, 0.3254902, 1, 0, 1,
-0.6013668, 0.7355793, 0.2253271, 0.3215686, 1, 0, 1,
-0.5984827, 1.364866, 1.793215, 0.3137255, 1, 0, 1,
-0.5893178, 0.1316368, 0.508759, 0.3098039, 1, 0, 1,
-0.588598, 0.238772, -0.8534549, 0.3019608, 1, 0, 1,
-0.5818927, -0.2792894, -1.277458, 0.2941177, 1, 0, 1,
-0.5803579, -1.306727, -2.363487, 0.2901961, 1, 0, 1,
-0.5790608, -0.999718, -1.746127, 0.282353, 1, 0, 1,
-0.5763922, -0.09210104, 1.575851, 0.2784314, 1, 0, 1,
-0.5756924, -0.4900352, -1.599407, 0.2705882, 1, 0, 1,
-0.5739522, -0.9395604, -1.785555, 0.2666667, 1, 0, 1,
-0.5738645, 0.8141444, -0.2272826, 0.2588235, 1, 0, 1,
-0.5728164, 0.7842512, -2.186346, 0.254902, 1, 0, 1,
-0.5724531, 0.02414845, -1.015951, 0.2470588, 1, 0, 1,
-0.5632026, -1.028485, -2.422797, 0.2431373, 1, 0, 1,
-0.56139, -0.4282714, -1.123068, 0.2352941, 1, 0, 1,
-0.5604913, 0.2791917, -0.7123327, 0.2313726, 1, 0, 1,
-0.5577646, 0.8987163, -0.5537907, 0.2235294, 1, 0, 1,
-0.5570487, 0.7166125, -1.242669, 0.2196078, 1, 0, 1,
-0.5518256, 0.02407413, -1.975497, 0.2117647, 1, 0, 1,
-0.5514979, -0.2464364, -2.347238, 0.2078431, 1, 0, 1,
-0.5469902, 0.7205057, 0.6571223, 0.2, 1, 0, 1,
-0.5396778, -0.3211007, -1.535624, 0.1921569, 1, 0, 1,
-0.5378477, -0.04617006, -1.848555, 0.1882353, 1, 0, 1,
-0.5369687, 0.9716392, 0.8499876, 0.1803922, 1, 0, 1,
-0.5236594, -0.5528863, -1.83824, 0.1764706, 1, 0, 1,
-0.5224989, -1.33722, -4.108678, 0.1686275, 1, 0, 1,
-0.5124564, 0.3009929, -0.7819779, 0.1647059, 1, 0, 1,
-0.5115895, 0.3624952, -1.096305, 0.1568628, 1, 0, 1,
-0.5095994, 0.9700287, -0.3080623, 0.1529412, 1, 0, 1,
-0.506577, 0.4259425, -1.118271, 0.145098, 1, 0, 1,
-0.5058869, -0.9383017, -2.499891, 0.1411765, 1, 0, 1,
-0.5042484, 0.719769, -0.6562924, 0.1333333, 1, 0, 1,
-0.5005657, 0.5133179, -1.061456, 0.1294118, 1, 0, 1,
-0.4968147, 1.027242, -0.6804482, 0.1215686, 1, 0, 1,
-0.4964035, -0.6178041, -2.078301, 0.1176471, 1, 0, 1,
-0.4955689, -0.09338167, -0.1232279, 0.1098039, 1, 0, 1,
-0.4920163, -0.3991278, -1.924558, 0.1058824, 1, 0, 1,
-0.4878287, -0.5205732, -2.8837, 0.09803922, 1, 0, 1,
-0.4855127, -1.401394, -2.246822, 0.09019608, 1, 0, 1,
-0.4845077, -0.1220908, -0.7392762, 0.08627451, 1, 0, 1,
-0.4813633, 0.1625559, -1.177251, 0.07843138, 1, 0, 1,
-0.4762817, 1.156721, 0.09289415, 0.07450981, 1, 0, 1,
-0.4716271, 1.00829, -1.321337, 0.06666667, 1, 0, 1,
-0.470825, -0.2198389, -4.398626, 0.0627451, 1, 0, 1,
-0.4683387, -0.9153212, -3.156674, 0.05490196, 1, 0, 1,
-0.4577905, -0.6477697, -2.292984, 0.05098039, 1, 0, 1,
-0.4551277, 0.1669624, -1.049679, 0.04313726, 1, 0, 1,
-0.4528002, 0.2741729, -2.625576, 0.03921569, 1, 0, 1,
-0.4479736, -0.7318983, -0.812859, 0.03137255, 1, 0, 1,
-0.4475186, 0.1883192, -0.6819237, 0.02745098, 1, 0, 1,
-0.4439272, -1.656821, -3.137605, 0.01960784, 1, 0, 1,
-0.4430947, 0.7424734, -0.3805766, 0.01568628, 1, 0, 1,
-0.4428929, 0.6491843, -0.6272115, 0.007843138, 1, 0, 1,
-0.4389868, -0.3176748, -2.038424, 0.003921569, 1, 0, 1,
-0.434909, -0.09200596, -1.224406, 0, 1, 0.003921569, 1,
-0.4339115, -0.1086827, -1.350667, 0, 1, 0.01176471, 1,
-0.4317498, -1.176861, -0.3933789, 0, 1, 0.01568628, 1,
-0.429279, -0.05761556, -3.069605, 0, 1, 0.02352941, 1,
-0.4264593, -0.4218983, -1.058192, 0, 1, 0.02745098, 1,
-0.4222389, -1.079323, -3.475954, 0, 1, 0.03529412, 1,
-0.4180672, 2.053165, 0.3343443, 0, 1, 0.03921569, 1,
-0.416622, 1.0294, 0.4242277, 0, 1, 0.04705882, 1,
-0.4143296, -1.422986, -3.569172, 0, 1, 0.05098039, 1,
-0.41135, -1.300851, -2.16909, 0, 1, 0.05882353, 1,
-0.4092225, -0.2419613, -1.570006, 0, 1, 0.0627451, 1,
-0.407204, -0.7973813, -3.449004, 0, 1, 0.07058824, 1,
-0.4064827, -0.1871255, -1.555975, 0, 1, 0.07450981, 1,
-0.4016557, -0.5207233, -2.185893, 0, 1, 0.08235294, 1,
-0.4009885, -2.707974, -3.256383, 0, 1, 0.08627451, 1,
-0.4005164, 0.3086998, -2.098958, 0, 1, 0.09411765, 1,
-0.3994373, 0.2961251, 1.527722, 0, 1, 0.1019608, 1,
-0.3944165, -0.3047177, -2.240609, 0, 1, 0.1058824, 1,
-0.3906144, -0.468543, -0.5096532, 0, 1, 0.1137255, 1,
-0.3890362, 0.7470334, -1.97372, 0, 1, 0.1176471, 1,
-0.385399, -0.9426494, -1.649674, 0, 1, 0.1254902, 1,
-0.3853831, 1.253537, 0.06074932, 0, 1, 0.1294118, 1,
-0.3847912, -0.06107482, -1.499055, 0, 1, 0.1372549, 1,
-0.382342, -0.6618863, -2.346804, 0, 1, 0.1411765, 1,
-0.3808407, -0.4054216, -1.108723, 0, 1, 0.1490196, 1,
-0.3805026, 0.8080434, -1.569077, 0, 1, 0.1529412, 1,
-0.3802747, -0.7401342, -2.51957, 0, 1, 0.1607843, 1,
-0.3792711, 0.6953926, -2.81436, 0, 1, 0.1647059, 1,
-0.3789208, 0.6762641, -2.03887, 0, 1, 0.172549, 1,
-0.3741451, -0.3724925, -1.63802, 0, 1, 0.1764706, 1,
-0.3695421, -0.6346688, -3.923598, 0, 1, 0.1843137, 1,
-0.3646073, -0.4479053, -2.906924, 0, 1, 0.1882353, 1,
-0.3500382, 0.8802439, -2.507715, 0, 1, 0.1960784, 1,
-0.3452973, -0.7785183, -2.130329, 0, 1, 0.2039216, 1,
-0.3370843, 0.7598935, 0.5035672, 0, 1, 0.2078431, 1,
-0.334755, -0.9100083, -1.498047, 0, 1, 0.2156863, 1,
-0.3335593, 0.1751027, -1.554024, 0, 1, 0.2196078, 1,
-0.3331328, 1.307116, 1.008702, 0, 1, 0.227451, 1,
-0.3311438, 2.590062, -0.6172544, 0, 1, 0.2313726, 1,
-0.3296087, 0.0948569, -1.215721, 0, 1, 0.2392157, 1,
-0.3265494, 1.658351, 1.486243, 0, 1, 0.2431373, 1,
-0.3180569, -1.0821, -2.98068, 0, 1, 0.2509804, 1,
-0.3158612, 0.8978997, -1.096872, 0, 1, 0.254902, 1,
-0.3139541, -1.299242, -2.754555, 0, 1, 0.2627451, 1,
-0.3129682, -0.702337, -2.268833, 0, 1, 0.2666667, 1,
-0.3122055, -1.397718, -5.35795, 0, 1, 0.2745098, 1,
-0.3121228, -0.2964835, -2.918648, 0, 1, 0.2784314, 1,
-0.3119401, 1.348899, 0.3117154, 0, 1, 0.2862745, 1,
-0.3101335, 0.003755491, -2.35094, 0, 1, 0.2901961, 1,
-0.3090195, 0.4064556, -0.9594133, 0, 1, 0.2980392, 1,
-0.3036746, 0.5642589, -0.3052188, 0, 1, 0.3058824, 1,
-0.3007869, 0.3665087, 0.4972316, 0, 1, 0.3098039, 1,
-0.3007261, 0.3711199, 0.5549477, 0, 1, 0.3176471, 1,
-0.2972657, -0.4567453, -3.998666, 0, 1, 0.3215686, 1,
-0.2959274, 0.7593011, -2.163516, 0, 1, 0.3294118, 1,
-0.2866704, 0.1951757, -1.107917, 0, 1, 0.3333333, 1,
-0.2862329, -0.2095217, -2.259768, 0, 1, 0.3411765, 1,
-0.2825728, 0.8732184, -0.3972615, 0, 1, 0.345098, 1,
-0.281841, 2.53695, 0.5594136, 0, 1, 0.3529412, 1,
-0.2771881, -1.417785, -2.377985, 0, 1, 0.3568628, 1,
-0.275374, 0.5164835, -0.8018425, 0, 1, 0.3647059, 1,
-0.271736, -0.8886831, -3.621414, 0, 1, 0.3686275, 1,
-0.2711989, 0.656168, 0.1784878, 0, 1, 0.3764706, 1,
-0.2705792, 0.5443358, -0.9862054, 0, 1, 0.3803922, 1,
-0.267565, 0.7940534, -0.05548894, 0, 1, 0.3882353, 1,
-0.2646335, 0.8401802, -1.197118, 0, 1, 0.3921569, 1,
-0.2630209, 0.6172969, -1.513507, 0, 1, 0.4, 1,
-0.2615088, 1.375786, 0.3656671, 0, 1, 0.4078431, 1,
-0.256721, -0.7303887, -0.7453098, 0, 1, 0.4117647, 1,
-0.2545039, -0.1568215, -2.060458, 0, 1, 0.4196078, 1,
-0.2544682, 0.122581, -2.004083, 0, 1, 0.4235294, 1,
-0.2510226, -0.856687, -2.625155, 0, 1, 0.4313726, 1,
-0.2487613, 1.453199, 1.218756, 0, 1, 0.4352941, 1,
-0.2458163, 0.2413209, -1.765286, 0, 1, 0.4431373, 1,
-0.2444054, 0.9205809, 0.9495847, 0, 1, 0.4470588, 1,
-0.2407363, -0.08809806, -1.805023, 0, 1, 0.454902, 1,
-0.2400497, -0.09887502, -1.560409, 0, 1, 0.4588235, 1,
-0.2344202, -1.298789, -2.329153, 0, 1, 0.4666667, 1,
-0.2312995, 0.4093734, -1.784252, 0, 1, 0.4705882, 1,
-0.2309346, -0.2154457, -1.393873, 0, 1, 0.4784314, 1,
-0.2265226, 0.1656705, -2.377565, 0, 1, 0.4823529, 1,
-0.2191547, -0.3144374, -1.427225, 0, 1, 0.4901961, 1,
-0.2105697, -1.691959, -4.387064, 0, 1, 0.4941176, 1,
-0.2104758, 0.1827987, -1.616239, 0, 1, 0.5019608, 1,
-0.2100498, -0.4453881, -2.924032, 0, 1, 0.509804, 1,
-0.2087558, -0.5224345, -4.115177, 0, 1, 0.5137255, 1,
-0.2068312, 0.06399826, -1.782839, 0, 1, 0.5215687, 1,
-0.203077, 2.106442, -1.058309, 0, 1, 0.5254902, 1,
-0.192146, 2.23106, 1.362095, 0, 1, 0.5333334, 1,
-0.1914678, 1.088071, -1.020621, 0, 1, 0.5372549, 1,
-0.1912211, 1.700432, -0.05660383, 0, 1, 0.5450981, 1,
-0.1883598, -2.502659, -3.232971, 0, 1, 0.5490196, 1,
-0.187169, -1.833237, -2.000413, 0, 1, 0.5568628, 1,
-0.1852908, -1.191033, -3.084586, 0, 1, 0.5607843, 1,
-0.1822664, 1.583242, -0.5335926, 0, 1, 0.5686275, 1,
-0.1748572, 0.6415778, 0.9076923, 0, 1, 0.572549, 1,
-0.173544, 1.460185, -0.4798439, 0, 1, 0.5803922, 1,
-0.1723081, -1.007894, -3.093091, 0, 1, 0.5843138, 1,
-0.1720993, 0.07188287, -0.5774686, 0, 1, 0.5921569, 1,
-0.1709418, 0.7195074, 0.2301029, 0, 1, 0.5960785, 1,
-0.1700395, 1.191463, 1.052009, 0, 1, 0.6039216, 1,
-0.1622825, -0.7064329, -1.651323, 0, 1, 0.6117647, 1,
-0.1617205, 0.01511261, -0.9364932, 0, 1, 0.6156863, 1,
-0.1566437, 1.925596, -0.5499809, 0, 1, 0.6235294, 1,
-0.1550928, 0.09420966, -1.029672, 0, 1, 0.627451, 1,
-0.1534619, 0.9810977, -0.8009658, 0, 1, 0.6352941, 1,
-0.1492802, 0.209137, -1.045234, 0, 1, 0.6392157, 1,
-0.1475107, -0.9681305, -2.420275, 0, 1, 0.6470588, 1,
-0.1452993, -0.7938024, -3.988576, 0, 1, 0.6509804, 1,
-0.1447638, -0.1623642, -2.768039, 0, 1, 0.6588235, 1,
-0.138056, -0.9970144, -3.119267, 0, 1, 0.6627451, 1,
-0.1360245, 0.7861412, 0.6031583, 0, 1, 0.6705883, 1,
-0.1336322, 2.131224, -0.193119, 0, 1, 0.6745098, 1,
-0.1328454, -0.1929225, -1.569371, 0, 1, 0.682353, 1,
-0.1302619, -0.04348608, -2.006809, 0, 1, 0.6862745, 1,
-0.1194386, 2.003084, -0.3117024, 0, 1, 0.6941177, 1,
-0.1192628, -1.784222, -2.97938, 0, 1, 0.7019608, 1,
-0.1185071, 1.596713, 1.261419, 0, 1, 0.7058824, 1,
-0.115816, 0.2375076, -0.6432919, 0, 1, 0.7137255, 1,
-0.1122598, -1.314001, -1.347332, 0, 1, 0.7176471, 1,
-0.1121721, 0.1929526, -0.3806857, 0, 1, 0.7254902, 1,
-0.1112727, 0.1194019, -0.2878383, 0, 1, 0.7294118, 1,
-0.1097275, 2.340537, -0.1465498, 0, 1, 0.7372549, 1,
-0.09664361, 0.2532411, 1.401705, 0, 1, 0.7411765, 1,
-0.09645908, -0.548187, -2.920608, 0, 1, 0.7490196, 1,
-0.09502426, 1.417268, 0.6057114, 0, 1, 0.7529412, 1,
-0.09420177, -0.2947631, -2.156371, 0, 1, 0.7607843, 1,
-0.09409744, -0.70942, -2.285239, 0, 1, 0.7647059, 1,
-0.09092777, 0.1145967, 0.543867, 0, 1, 0.772549, 1,
-0.08688261, -0.6758263, -3.275562, 0, 1, 0.7764706, 1,
-0.0852232, 1.656411, -1.032812, 0, 1, 0.7843137, 1,
-0.0849943, 2.032488, -1.521042, 0, 1, 0.7882353, 1,
-0.07577085, -1.482544, -3.408851, 0, 1, 0.7960784, 1,
-0.07258384, 0.4161308, 0.4719435, 0, 1, 0.8039216, 1,
-0.06995232, 0.1241951, 0.923844, 0, 1, 0.8078431, 1,
-0.06976709, 0.6476614, -0.2678827, 0, 1, 0.8156863, 1,
-0.06582876, 0.4634598, 0.4230392, 0, 1, 0.8196079, 1,
-0.06564157, 0.9356449, -0.2886428, 0, 1, 0.827451, 1,
-0.06453731, -0.4729102, -6.062413, 0, 1, 0.8313726, 1,
-0.06196228, 0.8014367, 0.9225456, 0, 1, 0.8392157, 1,
-0.05157305, -0.9810743, -2.642974, 0, 1, 0.8431373, 1,
-0.05120514, 0.7372222, -0.8693241, 0, 1, 0.8509804, 1,
-0.0502797, 0.6367432, -0.3554518, 0, 1, 0.854902, 1,
-0.04531542, 0.03407507, -0.9126871, 0, 1, 0.8627451, 1,
-0.04508313, -1.128001, -5.111122, 0, 1, 0.8666667, 1,
-0.04375139, 0.9278365, 0.6740676, 0, 1, 0.8745098, 1,
-0.04312586, 0.2148629, -1.777942, 0, 1, 0.8784314, 1,
-0.03390542, -0.2463172, -3.647183, 0, 1, 0.8862745, 1,
-0.02970838, -0.2525018, -4.967452, 0, 1, 0.8901961, 1,
-0.02525019, -0.8005614, -2.473101, 0, 1, 0.8980392, 1,
-0.02394426, -0.1890227, -2.203075, 0, 1, 0.9058824, 1,
-0.02360993, -0.7246695, -3.164985, 0, 1, 0.9098039, 1,
-0.02328002, 0.7936807, -0.6260079, 0, 1, 0.9176471, 1,
-0.02088835, 0.4690544, -1.110925, 0, 1, 0.9215686, 1,
-0.01726115, -0.0835831, -3.476908, 0, 1, 0.9294118, 1,
-0.01719783, -0.3256326, -3.917529, 0, 1, 0.9333333, 1,
-0.01655333, -0.03433912, -3.061434, 0, 1, 0.9411765, 1,
-0.0153976, -1.206542, -3.622054, 0, 1, 0.945098, 1,
-0.009422095, -0.5550938, -2.718043, 0, 1, 0.9529412, 1,
-0.004180844, 0.6762355, -0.3087886, 0, 1, 0.9568627, 1,
-0.0005602846, -1.193246, -3.384428, 0, 1, 0.9647059, 1,
0.00361188, -2.113713, 2.647443, 0, 1, 0.9686275, 1,
0.004833116, 0.1944471, -1.745264, 0, 1, 0.9764706, 1,
0.005964352, 0.8607442, -0.2718869, 0, 1, 0.9803922, 1,
0.007764282, 0.9187905, 0.4553901, 0, 1, 0.9882353, 1,
0.0114053, 0.4162294, -1.264369, 0, 1, 0.9921569, 1,
0.01840884, -0.4087505, 3.172093, 0, 1, 1, 1,
0.02261144, -0.8949809, 2.65902, 0, 0.9921569, 1, 1,
0.02401478, -1.055162, 2.020377, 0, 0.9882353, 1, 1,
0.02415395, -0.6876148, 1.536886, 0, 0.9803922, 1, 1,
0.02550408, -0.3553239, 2.997334, 0, 0.9764706, 1, 1,
0.03079784, -1.274395, 4.091087, 0, 0.9686275, 1, 1,
0.03193835, 0.1369771, 0.7284821, 0, 0.9647059, 1, 1,
0.03439708, 1.231579, 0.5546071, 0, 0.9568627, 1, 1,
0.03847737, -0.8292371, 5.447863, 0, 0.9529412, 1, 1,
0.04029579, 0.7722117, -0.05709967, 0, 0.945098, 1, 1,
0.04062446, 1.787502, -1.070183, 0, 0.9411765, 1, 1,
0.0425769, -0.6652096, 4.313871, 0, 0.9333333, 1, 1,
0.04345303, -0.04322917, 1.338793, 0, 0.9294118, 1, 1,
0.04422725, -1.874962, 3.296215, 0, 0.9215686, 1, 1,
0.05083385, 0.4708962, 0.5499429, 0, 0.9176471, 1, 1,
0.05491664, 1.48649, 0.3357113, 0, 0.9098039, 1, 1,
0.06110937, 0.07476638, 1.225973, 0, 0.9058824, 1, 1,
0.06387635, -0.2051394, 4.38749, 0, 0.8980392, 1, 1,
0.06407106, -1.392717, 2.920994, 0, 0.8901961, 1, 1,
0.06897435, 0.3939537, 0.2436169, 0, 0.8862745, 1, 1,
0.07247484, -0.03552395, 3.089151, 0, 0.8784314, 1, 1,
0.07305922, -0.8159853, 4.4994, 0, 0.8745098, 1, 1,
0.07367083, 0.2135282, 0.1823109, 0, 0.8666667, 1, 1,
0.07437146, -0.49669, 4.386153, 0, 0.8627451, 1, 1,
0.07705701, 1.740052, -0.4264418, 0, 0.854902, 1, 1,
0.08752615, 1.246266, -0.7789565, 0, 0.8509804, 1, 1,
0.0886181, 0.06623195, 2.981555, 0, 0.8431373, 1, 1,
0.09348037, -0.9200013, 4.001014, 0, 0.8392157, 1, 1,
0.09550485, -1.22382, 2.106654, 0, 0.8313726, 1, 1,
0.09728523, 1.240883, -0.6905674, 0, 0.827451, 1, 1,
0.1040398, 0.02584982, 2.926338, 0, 0.8196079, 1, 1,
0.1051277, -0.6018044, 3.821301, 0, 0.8156863, 1, 1,
0.1154276, 0.972924, -1.009213, 0, 0.8078431, 1, 1,
0.1216055, -0.6522831, 2.526143, 0, 0.8039216, 1, 1,
0.1252585, 1.22016, 0.8058591, 0, 0.7960784, 1, 1,
0.128818, 3.216137, 0.07480298, 0, 0.7882353, 1, 1,
0.1322577, -0.687768, 2.509366, 0, 0.7843137, 1, 1,
0.1323087, -0.3083819, 4.026822, 0, 0.7764706, 1, 1,
0.1330818, -0.7925127, 3.40449, 0, 0.772549, 1, 1,
0.1344439, -1.860945, 3.094571, 0, 0.7647059, 1, 1,
0.1360561, 1.491923, 0.08821125, 0, 0.7607843, 1, 1,
0.1413161, -1.055821, 3.245317, 0, 0.7529412, 1, 1,
0.1438809, 0.08488235, 1.677204, 0, 0.7490196, 1, 1,
0.1445584, -1.07429, 3.041227, 0, 0.7411765, 1, 1,
0.1451588, -0.5927678, 2.593731, 0, 0.7372549, 1, 1,
0.1472849, -0.01395878, 2.959401, 0, 0.7294118, 1, 1,
0.1492643, 1.608518, 1.073358, 0, 0.7254902, 1, 1,
0.1523953, 1.181458, 0.5138617, 0, 0.7176471, 1, 1,
0.1529551, 0.5924118, -1.325628, 0, 0.7137255, 1, 1,
0.1559424, 0.2700261, 2.057966, 0, 0.7058824, 1, 1,
0.1566387, 1.544832, 0.5821146, 0, 0.6980392, 1, 1,
0.1589992, 0.5660743, 0.9629424, 0, 0.6941177, 1, 1,
0.1692134, 0.6837981, 0.03229443, 0, 0.6862745, 1, 1,
0.1693238, -1.543797, 3.212606, 0, 0.682353, 1, 1,
0.1734106, -0.5002074, 1.93424, 0, 0.6745098, 1, 1,
0.1753004, 0.7263787, 0.05799858, 0, 0.6705883, 1, 1,
0.1776928, 0.8203521, 2.021641, 0, 0.6627451, 1, 1,
0.1809101, 0.5914181, -1.685692, 0, 0.6588235, 1, 1,
0.1832425, 0.06249046, 2.017639, 0, 0.6509804, 1, 1,
0.185527, 0.0599117, 0.6091728, 0, 0.6470588, 1, 1,
0.1878034, -0.6578993, 3.021265, 0, 0.6392157, 1, 1,
0.1882356, -1.247067, 4.330647, 0, 0.6352941, 1, 1,
0.1882536, -1.135701, 2.22155, 0, 0.627451, 1, 1,
0.1883169, -0.7574706, 3.412367, 0, 0.6235294, 1, 1,
0.1890127, 0.6393093, 0.0362913, 0, 0.6156863, 1, 1,
0.1890875, 1.11899, 0.8652281, 0, 0.6117647, 1, 1,
0.1914358, 1.213561, 0.6512538, 0, 0.6039216, 1, 1,
0.1989014, 0.345019, -0.3987242, 0, 0.5960785, 1, 1,
0.1991153, 2.609572, -0.5447873, 0, 0.5921569, 1, 1,
0.2029881, 0.5478682, 1.683444, 0, 0.5843138, 1, 1,
0.2180653, 0.2104897, 0.1960377, 0, 0.5803922, 1, 1,
0.2191346, -1.23546, 2.956476, 0, 0.572549, 1, 1,
0.2204479, -0.05412435, 1.590517, 0, 0.5686275, 1, 1,
0.2213819, 0.9663823, -0.2672158, 0, 0.5607843, 1, 1,
0.2300534, -0.3438733, 2.152375, 0, 0.5568628, 1, 1,
0.2375723, 0.7543145, 1.840918, 0, 0.5490196, 1, 1,
0.2391321, 0.6081335, -0.5558788, 0, 0.5450981, 1, 1,
0.2431106, -0.3837509, 2.596005, 0, 0.5372549, 1, 1,
0.2490323, 0.2904691, -0.1677337, 0, 0.5333334, 1, 1,
0.2503294, 0.1073361, 2.030336, 0, 0.5254902, 1, 1,
0.2515941, 0.3973556, 0.3636444, 0, 0.5215687, 1, 1,
0.2553411, -0.6078187, 3.170678, 0, 0.5137255, 1, 1,
0.2628595, -0.4321553, 3.032765, 0, 0.509804, 1, 1,
0.2642057, 1.203699, -0.6655079, 0, 0.5019608, 1, 1,
0.2652148, 0.9355192, 1.480926, 0, 0.4941176, 1, 1,
0.2664445, -0.2502886, 2.832535, 0, 0.4901961, 1, 1,
0.2672939, -0.5453677, 4.565022, 0, 0.4823529, 1, 1,
0.2713791, -0.0104487, 1.021381, 0, 0.4784314, 1, 1,
0.2718836, 0.7363039, -0.7478424, 0, 0.4705882, 1, 1,
0.2723314, 0.6431497, 0.1158456, 0, 0.4666667, 1, 1,
0.2796775, -0.1857655, 2.481805, 0, 0.4588235, 1, 1,
0.2859482, -0.2421159, 1.265103, 0, 0.454902, 1, 1,
0.2862753, 2.273047, -1.66074, 0, 0.4470588, 1, 1,
0.292373, -0.6591626, 2.104925, 0, 0.4431373, 1, 1,
0.2931584, -1.037168, 2.433456, 0, 0.4352941, 1, 1,
0.2975821, 0.05106402, 4.026793, 0, 0.4313726, 1, 1,
0.2990138, -0.8254634, 5.017981, 0, 0.4235294, 1, 1,
0.3013932, 1.057771, 0.5205998, 0, 0.4196078, 1, 1,
0.303957, -0.4256555, 2.684656, 0, 0.4117647, 1, 1,
0.303997, 0.2680914, 1.255263, 0, 0.4078431, 1, 1,
0.3073406, -0.4504917, 3.529817, 0, 0.4, 1, 1,
0.3089056, 0.2026814, 0.4466278, 0, 0.3921569, 1, 1,
0.3095838, 0.230202, 1.810012, 0, 0.3882353, 1, 1,
0.3115597, 0.09509762, 1.184375, 0, 0.3803922, 1, 1,
0.3128299, -0.5580626, 3.868453, 0, 0.3764706, 1, 1,
0.3179496, -0.7634891, 2.496064, 0, 0.3686275, 1, 1,
0.3204032, -1.734788, 2.873575, 0, 0.3647059, 1, 1,
0.3264993, 1.280674, 2.448016, 0, 0.3568628, 1, 1,
0.3282797, 0.4921841, 1.276299, 0, 0.3529412, 1, 1,
0.3294015, -0.4861945, 2.176507, 0, 0.345098, 1, 1,
0.3388958, -0.03885627, 1.01119, 0, 0.3411765, 1, 1,
0.341527, -0.6013631, 2.11045, 0, 0.3333333, 1, 1,
0.3415494, 0.7793796, 0.7622905, 0, 0.3294118, 1, 1,
0.341598, -1.130154, -0.1725134, 0, 0.3215686, 1, 1,
0.3453874, -0.08085483, 2.521119, 0, 0.3176471, 1, 1,
0.3468682, -0.06901906, 0.9620885, 0, 0.3098039, 1, 1,
0.3481114, -0.949822, 4.19589, 0, 0.3058824, 1, 1,
0.348489, -0.6966946, 2.830528, 0, 0.2980392, 1, 1,
0.3505186, -1.62788, 2.467545, 0, 0.2901961, 1, 1,
0.351183, 0.3110215, 1.72327, 0, 0.2862745, 1, 1,
0.3522191, 2.204095, 0.547485, 0, 0.2784314, 1, 1,
0.3542236, 0.534838, -0.6550198, 0, 0.2745098, 1, 1,
0.3542739, -0.3094093, 1.439879, 0, 0.2666667, 1, 1,
0.3576978, 0.5679604, 0.01335009, 0, 0.2627451, 1, 1,
0.3624764, -0.4940071, 1.878304, 0, 0.254902, 1, 1,
0.3683605, 1.830264, 0.5253658, 0, 0.2509804, 1, 1,
0.369562, -1.829113, 3.677606, 0, 0.2431373, 1, 1,
0.3712722, -0.1851904, 1.5962, 0, 0.2392157, 1, 1,
0.3717878, 0.374992, 1.271736, 0, 0.2313726, 1, 1,
0.3722567, 1.897295, -0.5850953, 0, 0.227451, 1, 1,
0.3783246, 0.0130003, 1.293447, 0, 0.2196078, 1, 1,
0.3788024, -1.705968, 3.674915, 0, 0.2156863, 1, 1,
0.3793856, 0.5436472, 0.91088, 0, 0.2078431, 1, 1,
0.3848001, 0.6541232, 1.725852, 0, 0.2039216, 1, 1,
0.3849372, 0.2048191, 1.549925, 0, 0.1960784, 1, 1,
0.3857522, 2.80077, -0.6834785, 0, 0.1882353, 1, 1,
0.3872676, -0.3909445, 2.956779, 0, 0.1843137, 1, 1,
0.3917799, 0.4372478, 1.211571, 0, 0.1764706, 1, 1,
0.3918135, 0.93031, 0.5671415, 0, 0.172549, 1, 1,
0.4059436, -1.520659, 2.708097, 0, 0.1647059, 1, 1,
0.4091772, -0.5673986, 2.363072, 0, 0.1607843, 1, 1,
0.4100102, 0.7616716, -0.8047279, 0, 0.1529412, 1, 1,
0.4125187, 1.062213, -0.08095666, 0, 0.1490196, 1, 1,
0.4128179, -0.5835907, 3.248656, 0, 0.1411765, 1, 1,
0.4222895, -0.3516938, 1.457159, 0, 0.1372549, 1, 1,
0.4272094, 0.02780828, 2.059958, 0, 0.1294118, 1, 1,
0.427222, 0.4671729, 0.8285481, 0, 0.1254902, 1, 1,
0.4324027, 1.910534, -0.8945044, 0, 0.1176471, 1, 1,
0.4385966, 0.1811403, 0.506762, 0, 0.1137255, 1, 1,
0.4388299, 0.8313679, 1.508407, 0, 0.1058824, 1, 1,
0.440341, -0.6776704, 2.126681, 0, 0.09803922, 1, 1,
0.4424679, 0.3654035, 0.5375003, 0, 0.09411765, 1, 1,
0.4429216, 0.6199401, 2.021888, 0, 0.08627451, 1, 1,
0.4522338, 0.2163924, -0.9788964, 0, 0.08235294, 1, 1,
0.4525129, 1.165346, -0.5387197, 0, 0.07450981, 1, 1,
0.4650003, 0.6313913, 1.358039, 0, 0.07058824, 1, 1,
0.4695047, -1.61744, 3.132358, 0, 0.0627451, 1, 1,
0.4697408, -1.258061, 0.956589, 0, 0.05882353, 1, 1,
0.4706602, 0.5235308, 0.4743881, 0, 0.05098039, 1, 1,
0.4728727, 0.750606, -1.088345, 0, 0.04705882, 1, 1,
0.4742455, 0.03519818, 2.823739, 0, 0.03921569, 1, 1,
0.4770434, -0.495718, 1.086636, 0, 0.03529412, 1, 1,
0.4834991, -0.1394179, 2.621322, 0, 0.02745098, 1, 1,
0.487818, -0.4215497, 2.047348, 0, 0.02352941, 1, 1,
0.4883996, -2.381472, 4.440086, 0, 0.01568628, 1, 1,
0.492301, -1.05681, 3.333221, 0, 0.01176471, 1, 1,
0.5070545, 0.2143119, 0.2252091, 0, 0.003921569, 1, 1,
0.508655, 0.1153307, 2.601846, 0.003921569, 0, 1, 1,
0.5148112, -1.213912, 2.368539, 0.007843138, 0, 1, 1,
0.5149222, 1.809863, -0.1817736, 0.01568628, 0, 1, 1,
0.516065, -0.9785905, 4.230951, 0.01960784, 0, 1, 1,
0.5191033, 0.465907, 0.1676707, 0.02745098, 0, 1, 1,
0.5298994, -1.228769, 1.822308, 0.03137255, 0, 1, 1,
0.5301841, 0.2263267, 0.851841, 0.03921569, 0, 1, 1,
0.5337636, -0.430624, 2.366596, 0.04313726, 0, 1, 1,
0.5402601, -0.7384578, 4.22705, 0.05098039, 0, 1, 1,
0.5425229, -0.655558, 0.7840368, 0.05490196, 0, 1, 1,
0.5438271, -1.045976, 2.219282, 0.0627451, 0, 1, 1,
0.5442455, -1.349277, 2.512951, 0.06666667, 0, 1, 1,
0.5464286, -0.008028679, 0.4725602, 0.07450981, 0, 1, 1,
0.5467175, -1.810402, 4.435926, 0.07843138, 0, 1, 1,
0.5476399, -0.3241081, 2.559978, 0.08627451, 0, 1, 1,
0.5507178, 0.5487222, 0.3979699, 0.09019608, 0, 1, 1,
0.5508768, 0.9314376, 0.8962954, 0.09803922, 0, 1, 1,
0.5619694, -0.09177037, 1.318362, 0.1058824, 0, 1, 1,
0.5692047, -0.0549632, 1.434494, 0.1098039, 0, 1, 1,
0.5721858, 1.082579, 0.8281282, 0.1176471, 0, 1, 1,
0.5729237, 0.2294024, 2.938485, 0.1215686, 0, 1, 1,
0.5814273, 1.29985, 0.6874018, 0.1294118, 0, 1, 1,
0.5834883, -0.4974272, 3.029415, 0.1333333, 0, 1, 1,
0.5857658, 1.756734, 0.5305921, 0.1411765, 0, 1, 1,
0.5888285, -1.460201, 2.349526, 0.145098, 0, 1, 1,
0.5894299, 1.053104, -0.09148713, 0.1529412, 0, 1, 1,
0.5913969, -0.4628947, 1.695328, 0.1568628, 0, 1, 1,
0.5942715, 0.373141, 1.523033, 0.1647059, 0, 1, 1,
0.5965642, -1.153844, 4.756455, 0.1686275, 0, 1, 1,
0.5984315, -0.2218649, 1.862014, 0.1764706, 0, 1, 1,
0.6001045, 0.3366704, 1.899808, 0.1803922, 0, 1, 1,
0.6025301, -0.5736555, 0.03156513, 0.1882353, 0, 1, 1,
0.6038751, -1.227109, -0.3117094, 0.1921569, 0, 1, 1,
0.606113, 0.6567676, 0.0652092, 0.2, 0, 1, 1,
0.6107448, -0.614709, 1.992396, 0.2078431, 0, 1, 1,
0.6110692, 0.2998885, 2.23593, 0.2117647, 0, 1, 1,
0.6116093, 0.5990219, 0.9399665, 0.2196078, 0, 1, 1,
0.6126305, 0.5281076, 0.5730905, 0.2235294, 0, 1, 1,
0.6163724, 0.9998768, -0.07969235, 0.2313726, 0, 1, 1,
0.6170177, 0.4136027, 2.287807, 0.2352941, 0, 1, 1,
0.6222265, 1.966926, 0.9746015, 0.2431373, 0, 1, 1,
0.6265854, 0.2044494, 0.9841563, 0.2470588, 0, 1, 1,
0.633059, 0.7377489, 1.059627, 0.254902, 0, 1, 1,
0.6331265, -0.255087, 1.362148, 0.2588235, 0, 1, 1,
0.6341469, 0.9422768, 0.5464552, 0.2666667, 0, 1, 1,
0.6346019, -0.5413375, 2.952047, 0.2705882, 0, 1, 1,
0.6357218, -1.135844, 2.613961, 0.2784314, 0, 1, 1,
0.638519, 0.9387736, 2.326008, 0.282353, 0, 1, 1,
0.6432239, 1.379526, 0.7921677, 0.2901961, 0, 1, 1,
0.644411, 0.6449257, 1.721087, 0.2941177, 0, 1, 1,
0.6445938, -1.830167, 3.383029, 0.3019608, 0, 1, 1,
0.6460255, 0.97829, -0.4706492, 0.3098039, 0, 1, 1,
0.6460873, 2.018742, 0.2914633, 0.3137255, 0, 1, 1,
0.6479671, 1.346768, 0.5930988, 0.3215686, 0, 1, 1,
0.6500667, -0.9975505, 1.460752, 0.3254902, 0, 1, 1,
0.6519936, -0.9693728, 2.758752, 0.3333333, 0, 1, 1,
0.6577789, -1.105345, 2.420441, 0.3372549, 0, 1, 1,
0.6585262, -0.1882939, 2.843246, 0.345098, 0, 1, 1,
0.6627052, -0.4634742, 2.172904, 0.3490196, 0, 1, 1,
0.6627576, -2.882061, 2.730983, 0.3568628, 0, 1, 1,
0.6679074, -0.3820815, 2.841181, 0.3607843, 0, 1, 1,
0.6681321, -0.6556593, 3.483687, 0.3686275, 0, 1, 1,
0.6724367, 0.7989806, 1.276457, 0.372549, 0, 1, 1,
0.6808202, 1.145222, -0.8534467, 0.3803922, 0, 1, 1,
0.6849791, -1.392007, 3.479856, 0.3843137, 0, 1, 1,
0.685629, 0.1818275, 2.061952, 0.3921569, 0, 1, 1,
0.6946157, -0.6555702, 2.063406, 0.3960784, 0, 1, 1,
0.6969257, -0.1885946, 2.60251, 0.4039216, 0, 1, 1,
0.698631, 1.39034, 0.6253029, 0.4117647, 0, 1, 1,
0.6991534, -0.9990543, 3.437797, 0.4156863, 0, 1, 1,
0.6994197, -0.4244401, 3.08138, 0.4235294, 0, 1, 1,
0.700642, 0.4147128, 2.263102, 0.427451, 0, 1, 1,
0.7013974, 0.784817, 0.2522967, 0.4352941, 0, 1, 1,
0.7115347, 0.5774885, 1.010077, 0.4392157, 0, 1, 1,
0.7125229, 0.2497783, 1.6879, 0.4470588, 0, 1, 1,
0.7160649, 1.447059, -1.07824, 0.4509804, 0, 1, 1,
0.7160747, 0.952272, -0.6126248, 0.4588235, 0, 1, 1,
0.7163153, -0.2008329, 1.033511, 0.4627451, 0, 1, 1,
0.7204584, -0.8303505, 3.201598, 0.4705882, 0, 1, 1,
0.7212761, 1.533692, -0.4734561, 0.4745098, 0, 1, 1,
0.7330706, 0.9627875, 1.310356, 0.4823529, 0, 1, 1,
0.7417749, 0.1498019, 2.059144, 0.4862745, 0, 1, 1,
0.7496455, 0.8963468, 2.908461, 0.4941176, 0, 1, 1,
0.7553523, -0.6455349, 1.075499, 0.5019608, 0, 1, 1,
0.7616764, -0.9354819, 1.921464, 0.5058824, 0, 1, 1,
0.764922, 0.8298585, 0.8435689, 0.5137255, 0, 1, 1,
0.7651545, -0.1410611, 0.9606234, 0.5176471, 0, 1, 1,
0.7659065, 1.184328, 1.643663, 0.5254902, 0, 1, 1,
0.7669952, 0.2114313, 1.767918, 0.5294118, 0, 1, 1,
0.7745622, -1.352471, 3.284486, 0.5372549, 0, 1, 1,
0.776232, 0.2675486, 1.089254, 0.5411765, 0, 1, 1,
0.790412, 0.2619188, 1.661264, 0.5490196, 0, 1, 1,
0.795027, -0.9528628, 4.327397, 0.5529412, 0, 1, 1,
0.8005927, -0.7758775, 2.050988, 0.5607843, 0, 1, 1,
0.8058937, 0.8713128, 1.039043, 0.5647059, 0, 1, 1,
0.8125094, -0.02561555, 0.9398866, 0.572549, 0, 1, 1,
0.8197016, 0.2670201, 1.821997, 0.5764706, 0, 1, 1,
0.8215363, -0.5481482, 3.056468, 0.5843138, 0, 1, 1,
0.822326, -0.003235503, 1.06598, 0.5882353, 0, 1, 1,
0.8235633, -0.4840449, 1.367883, 0.5960785, 0, 1, 1,
0.8273531, -0.642731, 3.533197, 0.6039216, 0, 1, 1,
0.8297798, 1.085342, 1.517407, 0.6078432, 0, 1, 1,
0.8320946, -0.8927639, 1.674822, 0.6156863, 0, 1, 1,
0.8337587, 0.877184, 0.5944378, 0.6196079, 0, 1, 1,
0.8343123, -0.3892058, 2.992675, 0.627451, 0, 1, 1,
0.8347739, 2.065516, -1.147533, 0.6313726, 0, 1, 1,
0.8401825, 0.8501502, 0.9988131, 0.6392157, 0, 1, 1,
0.8421869, 0.02476408, 2.987359, 0.6431373, 0, 1, 1,
0.8447888, -0.5289472, 1.120607, 0.6509804, 0, 1, 1,
0.8486572, -0.7248197, 2.274994, 0.654902, 0, 1, 1,
0.8517318, -0.1415266, 3.14143, 0.6627451, 0, 1, 1,
0.8574554, 0.2470453, 0.9124309, 0.6666667, 0, 1, 1,
0.8583419, -1.267673, 3.76735, 0.6745098, 0, 1, 1,
0.8650575, 1.159069, 0.9830664, 0.6784314, 0, 1, 1,
0.8686168, -0.2440566, 1.645962, 0.6862745, 0, 1, 1,
0.8703563, 0.2917288, 0.4043992, 0.6901961, 0, 1, 1,
0.8707271, -1.403882, 3.992955, 0.6980392, 0, 1, 1,
0.8725382, -0.02856311, 1.971346, 0.7058824, 0, 1, 1,
0.8761795, -1.543896, 4.076491, 0.7098039, 0, 1, 1,
0.8763101, -1.35321, 3.93163, 0.7176471, 0, 1, 1,
0.8857667, -0.179823, 3.02042, 0.7215686, 0, 1, 1,
0.8862792, 0.3174448, 1.69254, 0.7294118, 0, 1, 1,
0.8989028, 0.3524975, 0.6388535, 0.7333333, 0, 1, 1,
0.9061214, 0.4055687, 1.05829, 0.7411765, 0, 1, 1,
0.9065481, 0.342762, 0.9209331, 0.7450981, 0, 1, 1,
0.9075032, -1.407351, 1.833253, 0.7529412, 0, 1, 1,
0.9090735, 1.000899, 2.694814, 0.7568628, 0, 1, 1,
0.9094556, -0.09253471, 0.7455032, 0.7647059, 0, 1, 1,
0.9101444, 0.117164, 1.552718, 0.7686275, 0, 1, 1,
0.9106047, -1.885601, 2.550926, 0.7764706, 0, 1, 1,
0.9117265, -2.016768, 3.392143, 0.7803922, 0, 1, 1,
0.9135591, -0.1400771, 1.834174, 0.7882353, 0, 1, 1,
0.9145777, 0.7702412, 2.103598, 0.7921569, 0, 1, 1,
0.9207045, -1.535566, 2.32682, 0.8, 0, 1, 1,
0.9230753, 0.4464744, -0.1235987, 0.8078431, 0, 1, 1,
0.927502, 0.374667, 0.5993671, 0.8117647, 0, 1, 1,
0.9372695, 0.698741, -0.6549284, 0.8196079, 0, 1, 1,
0.9394012, 2.62545, 2.691167, 0.8235294, 0, 1, 1,
0.9404036, -0.8269113, 1.623425, 0.8313726, 0, 1, 1,
0.9449857, 0.4968738, 1.982998, 0.8352941, 0, 1, 1,
0.953292, -0.09215641, 2.603741, 0.8431373, 0, 1, 1,
0.9607211, -1.539343, 2.697366, 0.8470588, 0, 1, 1,
0.9616166, 0.6146793, 0.8845987, 0.854902, 0, 1, 1,
0.9637339, 0.4115804, 1.234314, 0.8588235, 0, 1, 1,
0.9652292, -0.7092513, 3.194984, 0.8666667, 0, 1, 1,
0.9667525, -1.93006, 3.302582, 0.8705882, 0, 1, 1,
0.9812018, 0.2569207, 0.6192889, 0.8784314, 0, 1, 1,
0.9820876, 1.544577, 0.278425, 0.8823529, 0, 1, 1,
0.982133, -0.505629, 1.718385, 0.8901961, 0, 1, 1,
0.9823726, -1.411028, 1.65142, 0.8941177, 0, 1, 1,
0.9844825, -1.988832, 3.321109, 0.9019608, 0, 1, 1,
0.9846398, -0.1827692, 1.167379, 0.9098039, 0, 1, 1,
0.9922693, -1.734999, 3.378903, 0.9137255, 0, 1, 1,
0.9938675, -0.318868, 1.183677, 0.9215686, 0, 1, 1,
0.9962611, 0.7219198, 0.6789654, 0.9254902, 0, 1, 1,
0.9973047, -0.8437811, 0.1779428, 0.9333333, 0, 1, 1,
0.9991551, 1.036888, 0.04612695, 0.9372549, 0, 1, 1,
1.004597, 1.175891, 1.445916, 0.945098, 0, 1, 1,
1.010437, 0.1453661, 1.849253, 0.9490196, 0, 1, 1,
1.012159, 1.703235, 1.278193, 0.9568627, 0, 1, 1,
1.012847, 0.9884602, 0.9654607, 0.9607843, 0, 1, 1,
1.014466, -0.3248826, 2.850482, 0.9686275, 0, 1, 1,
1.018059, 0.7651168, -0.06858572, 0.972549, 0, 1, 1,
1.020347, -0.6958353, 4.361462, 0.9803922, 0, 1, 1,
1.0207, 1.851955, 2.052863, 0.9843137, 0, 1, 1,
1.034161, 0.05910107, 3.068222, 0.9921569, 0, 1, 1,
1.046429, -0.5801809, 0.6902835, 0.9960784, 0, 1, 1,
1.047298, 1.500747, 0.795245, 1, 0, 0.9960784, 1,
1.048666, -0.6794477, 2.081627, 1, 0, 0.9882353, 1,
1.05215, 0.6812762, 1.358123, 1, 0, 0.9843137, 1,
1.052181, 0.3754838, -0.2126403, 1, 0, 0.9764706, 1,
1.054072, 1.658342, 0.2474934, 1, 0, 0.972549, 1,
1.060369, -0.4915173, 2.927067, 1, 0, 0.9647059, 1,
1.060954, -0.8912028, 4.914018, 1, 0, 0.9607843, 1,
1.061931, 0.2516911, 3.134503, 1, 0, 0.9529412, 1,
1.062579, 0.5233752, 0.7605743, 1, 0, 0.9490196, 1,
1.064835, 0.579089, 0.3952027, 1, 0, 0.9411765, 1,
1.067309, 0.6000149, -0.05427929, 1, 0, 0.9372549, 1,
1.068966, -1.197405, 2.308725, 1, 0, 0.9294118, 1,
1.06948, 1.229329, 1.75856, 1, 0, 0.9254902, 1,
1.074808, -0.3682539, 3.131091, 1, 0, 0.9176471, 1,
1.079535, 1.204043, 1.512197, 1, 0, 0.9137255, 1,
1.082597, 2.257528, -1.078956, 1, 0, 0.9058824, 1,
1.087313, 1.647915, 0.7186552, 1, 0, 0.9019608, 1,
1.093149, -0.4777401, 0.8299509, 1, 0, 0.8941177, 1,
1.093619, -0.7863851, 1.945302, 1, 0, 0.8862745, 1,
1.093626, 0.6492433, 1.29995, 1, 0, 0.8823529, 1,
1.096425, -1.410541, 1.873481, 1, 0, 0.8745098, 1,
1.096486, 0.1423554, 0.4758931, 1, 0, 0.8705882, 1,
1.10173, -0.5657967, 0.6836964, 1, 0, 0.8627451, 1,
1.10227, -0.8100023, 3.26072, 1, 0, 0.8588235, 1,
1.106192, 0.04290742, 3.00087, 1, 0, 0.8509804, 1,
1.108328, -0.2001212, -1.424511, 1, 0, 0.8470588, 1,
1.126511, 1.425078, 1.449299, 1, 0, 0.8392157, 1,
1.127069, -0.1042513, -0.1722647, 1, 0, 0.8352941, 1,
1.135529, 1.543637, -0.004635092, 1, 0, 0.827451, 1,
1.135799, 0.7069736, 1.848088, 1, 0, 0.8235294, 1,
1.148941, -0.8781206, 0.1930612, 1, 0, 0.8156863, 1,
1.151019, -0.4561271, 2.722621, 1, 0, 0.8117647, 1,
1.153889, 0.4261854, 1.996753, 1, 0, 0.8039216, 1,
1.165371, 0.3301049, 1.730489, 1, 0, 0.7960784, 1,
1.169069, 1.239437, -0.7914455, 1, 0, 0.7921569, 1,
1.169104, 0.1869351, 1.977319, 1, 0, 0.7843137, 1,
1.185031, -0.2862245, 1.740892, 1, 0, 0.7803922, 1,
1.195068, 0.8842571, 2.433273, 1, 0, 0.772549, 1,
1.199858, -1.47502, 1.763742, 1, 0, 0.7686275, 1,
1.206057, 0.515496, 0.7221135, 1, 0, 0.7607843, 1,
1.206215, -0.7882614, 2.108069, 1, 0, 0.7568628, 1,
1.212172, 1.971009, 1.545273, 1, 0, 0.7490196, 1,
1.220257, -1.027657, 1.098883, 1, 0, 0.7450981, 1,
1.226411, 0.04103479, 0.9189153, 1, 0, 0.7372549, 1,
1.226879, -0.298534, 1.290589, 1, 0, 0.7333333, 1,
1.229284, 0.1186664, 0.3674854, 1, 0, 0.7254902, 1,
1.230772, -0.8736048, 1.66569, 1, 0, 0.7215686, 1,
1.247073, -0.362075, 1.223241, 1, 0, 0.7137255, 1,
1.255458, 0.9241257, 0.3259102, 1, 0, 0.7098039, 1,
1.25823, -0.2731425, 2.602446, 1, 0, 0.7019608, 1,
1.258627, 3.567275, -1.181224, 1, 0, 0.6941177, 1,
1.258932, 0.07581025, 1.995429, 1, 0, 0.6901961, 1,
1.26865, -0.3652551, 1.35303, 1, 0, 0.682353, 1,
1.269234, 0.04719978, 1.673383, 1, 0, 0.6784314, 1,
1.269701, -0.3479029, 1.144039, 1, 0, 0.6705883, 1,
1.274775, -1.111787, 2.190296, 1, 0, 0.6666667, 1,
1.277824, -0.1226279, 1.355036, 1, 0, 0.6588235, 1,
1.2785, 0.6759758, 1.877452, 1, 0, 0.654902, 1,
1.284373, -0.6059196, 2.650584, 1, 0, 0.6470588, 1,
1.285611, 0.09678112, 1.177326, 1, 0, 0.6431373, 1,
1.298501, -2.50536, 2.887327, 1, 0, 0.6352941, 1,
1.300989, 1.930896, -0.02358083, 1, 0, 0.6313726, 1,
1.304584, 0.1663681, -0.4051096, 1, 0, 0.6235294, 1,
1.321406, 0.8459919, -0.1465199, 1, 0, 0.6196079, 1,
1.329614, 0.03137911, 1.300045, 1, 0, 0.6117647, 1,
1.333034, 1.076579, 1.720861, 1, 0, 0.6078432, 1,
1.338388, -1.889215, 3.136425, 1, 0, 0.6, 1,
1.340697, 0.1127282, 1.064214, 1, 0, 0.5921569, 1,
1.342504, -0.8236554, 0.0183164, 1, 0, 0.5882353, 1,
1.343482, -0.2335178, 2.223037, 1, 0, 0.5803922, 1,
1.34401, -0.5804281, 0.38575, 1, 0, 0.5764706, 1,
1.346368, -1.001451, 2.150113, 1, 0, 0.5686275, 1,
1.346412, -0.5245713, 3.529631, 1, 0, 0.5647059, 1,
1.348767, 0.7644013, 1.351014, 1, 0, 0.5568628, 1,
1.350673, -1.464769, 2.317168, 1, 0, 0.5529412, 1,
1.354123, -1.75715, 1.660369, 1, 0, 0.5450981, 1,
1.358333, -0.9607928, 1.675168, 1, 0, 0.5411765, 1,
1.374385, 1.638939, 0.2999334, 1, 0, 0.5333334, 1,
1.37481, 0.5720278, -0.09950344, 1, 0, 0.5294118, 1,
1.378188, 0.6656097, 1.068253, 1, 0, 0.5215687, 1,
1.382221, -0.352199, 2.221949, 1, 0, 0.5176471, 1,
1.387999, -0.4711782, 2.008353, 1, 0, 0.509804, 1,
1.411241, -0.8191334, 1.440288, 1, 0, 0.5058824, 1,
1.421198, -1.867188, 2.303797, 1, 0, 0.4980392, 1,
1.422005, 0.4105735, 3.196465, 1, 0, 0.4901961, 1,
1.425562, -1.310002, 3.486991, 1, 0, 0.4862745, 1,
1.43227, -0.5289471, 0.08871526, 1, 0, 0.4784314, 1,
1.450477, 0.3010468, 2.439029, 1, 0, 0.4745098, 1,
1.451278, -1.788606, 1.174865, 1, 0, 0.4666667, 1,
1.452, -0.2320005, 1.16801, 1, 0, 0.4627451, 1,
1.458955, -1.661005, 0.4655539, 1, 0, 0.454902, 1,
1.46175, 0.7532697, 0.5370815, 1, 0, 0.4509804, 1,
1.46841, 0.6372324, 1.415761, 1, 0, 0.4431373, 1,
1.469936, -0.05704031, 0.7795653, 1, 0, 0.4392157, 1,
1.475849, -0.9125562, 3.378702, 1, 0, 0.4313726, 1,
1.485098, 0.2145603, 0.8234894, 1, 0, 0.427451, 1,
1.489255, -0.2752667, 2.603071, 1, 0, 0.4196078, 1,
1.491865, -1.000528, 1.20262, 1, 0, 0.4156863, 1,
1.502094, 0.7241182, -0.8148474, 1, 0, 0.4078431, 1,
1.511598, -0.7804503, 1.007237, 1, 0, 0.4039216, 1,
1.527198, -0.3526837, 1.819586, 1, 0, 0.3960784, 1,
1.528632, 0.2632588, -0.3372246, 1, 0, 0.3882353, 1,
1.530884, 1.942184, 0.8659006, 1, 0, 0.3843137, 1,
1.541675, 0.8957038, -0.3749604, 1, 0, 0.3764706, 1,
1.543491, 0.490322, 0.9324149, 1, 0, 0.372549, 1,
1.545089, 1.833288, 0.02815073, 1, 0, 0.3647059, 1,
1.55421, -0.1245984, 2.71467, 1, 0, 0.3607843, 1,
1.572363, 0.3611518, -0.5107582, 1, 0, 0.3529412, 1,
1.587636, -1.666399, 3.683296, 1, 0, 0.3490196, 1,
1.607126, 1.066385, 2.479823, 1, 0, 0.3411765, 1,
1.608506, 1.460273, 0.5592098, 1, 0, 0.3372549, 1,
1.620735, -0.1053817, 3.30872, 1, 0, 0.3294118, 1,
1.620846, 0.879799, 1.294111, 1, 0, 0.3254902, 1,
1.620952, -1.109536, 1.765245, 1, 0, 0.3176471, 1,
1.628415, -1.514832, 0.8293288, 1, 0, 0.3137255, 1,
1.629544, 0.8089157, 0.04687675, 1, 0, 0.3058824, 1,
1.632189, 0.3868727, 0.3028587, 1, 0, 0.2980392, 1,
1.653041, -1.172394, 1.273006, 1, 0, 0.2941177, 1,
1.663116, 1.768098, 1.571536, 1, 0, 0.2862745, 1,
1.668147, -0.5547149, 2.071911, 1, 0, 0.282353, 1,
1.674245, -0.3134957, 3.362668, 1, 0, 0.2745098, 1,
1.676177, -0.3374855, 2.707138, 1, 0, 0.2705882, 1,
1.692089, 1.770826, 0.2612219, 1, 0, 0.2627451, 1,
1.701515, 0.1095325, 2.14453, 1, 0, 0.2588235, 1,
1.714427, -0.9080151, 2.514513, 1, 0, 0.2509804, 1,
1.726402, 0.4078507, 2.21918, 1, 0, 0.2470588, 1,
1.729044, 0.5037184, 2.285029, 1, 0, 0.2392157, 1,
1.734492, 0.07621326, 2.118541, 1, 0, 0.2352941, 1,
1.766469, -0.1829201, 2.068583, 1, 0, 0.227451, 1,
1.785453, -0.9564135, 2.044095, 1, 0, 0.2235294, 1,
1.798861, 1.533573, 0.159973, 1, 0, 0.2156863, 1,
1.809019, -1.75345, 2.40235, 1, 0, 0.2117647, 1,
1.814235, -0.8479637, 3.022088, 1, 0, 0.2039216, 1,
1.817432, 0.2758696, 1.020877, 1, 0, 0.1960784, 1,
1.8324, 0.5543789, 1.13823, 1, 0, 0.1921569, 1,
1.832734, 0.9770758, -0.1139532, 1, 0, 0.1843137, 1,
1.833877, -1.016284, 1.662975, 1, 0, 0.1803922, 1,
1.844519, -0.08492826, 0.01461144, 1, 0, 0.172549, 1,
1.852303, -0.09180864, 1.997232, 1, 0, 0.1686275, 1,
1.867649, -0.3334681, 2.049785, 1, 0, 0.1607843, 1,
1.904104, -1.901552, 1.200371, 1, 0, 0.1568628, 1,
1.916058, -0.6652558, 1.838408, 1, 0, 0.1490196, 1,
1.916099, 0.3396748, 1.482765, 1, 0, 0.145098, 1,
1.932371, -0.1512332, 1.027966, 1, 0, 0.1372549, 1,
1.936296, -0.7071003, 2.152585, 1, 0, 0.1333333, 1,
1.953455, -0.8754012, 2.64976, 1, 0, 0.1254902, 1,
1.96738, -0.3473918, 2.128419, 1, 0, 0.1215686, 1,
1.972444, 0.5934779, 2.616739, 1, 0, 0.1137255, 1,
2.005225, -0.8390168, 2.607407, 1, 0, 0.1098039, 1,
2.01372, 0.1983376, 1.750755, 1, 0, 0.1019608, 1,
2.029554, 1.060702, 1.87867, 1, 0, 0.09411765, 1,
2.034523, -3.093946, 3.222243, 1, 0, 0.09019608, 1,
2.075045, -1.524415, 1.748643, 1, 0, 0.08235294, 1,
2.096401, -0.6310027, 1.129744, 1, 0, 0.07843138, 1,
2.291763, 1.516104, 2.825254, 1, 0, 0.07058824, 1,
2.335198, 1.33372, 2.841949, 1, 0, 0.06666667, 1,
2.43767, 1.326876, 1.282034, 1, 0, 0.05882353, 1,
2.444856, 1.031935, -0.1563775, 1, 0, 0.05490196, 1,
2.445426, -0.7689074, 2.205596, 1, 0, 0.04705882, 1,
2.595141, 0.3719347, 0.8147171, 1, 0, 0.04313726, 1,
2.600767, -1.750436, 2.019102, 1, 0, 0.03529412, 1,
2.607877, -0.1351347, -0.09751444, 1, 0, 0.03137255, 1,
2.697833, -0.7389662, 1.026269, 1, 0, 0.02352941, 1,
2.728191, -3.092286, 3.083859, 1, 0, 0.01960784, 1,
2.764363, 0.4187782, 0.3414313, 1, 0, 0.01176471, 1,
3.034865, 1.260887, 1.660233, 1, 0, 0.007843138, 1
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
0.120894, -4.551655, -8.013405, 0, -0.5, 0.5, 0.5,
0.120894, -4.551655, -8.013405, 1, -0.5, 0.5, 0.5,
0.120894, -4.551655, -8.013405, 1, 1.5, 0.5, 0.5,
0.120894, -4.551655, -8.013405, 0, 1.5, 0.5, 0.5
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
-3.780913, 0.09616339, -8.013405, 0, -0.5, 0.5, 0.5,
-3.780913, 0.09616339, -8.013405, 1, -0.5, 0.5, 0.5,
-3.780913, 0.09616339, -8.013405, 1, 1.5, 0.5, 0.5,
-3.780913, 0.09616339, -8.013405, 0, 1.5, 0.5, 0.5
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
-3.780913, -4.551655, -0.3072751, 0, -0.5, 0.5, 0.5,
-3.780913, -4.551655, -0.3072751, 1, -0.5, 0.5, 0.5,
-3.780913, -4.551655, -0.3072751, 1, 1.5, 0.5, 0.5,
-3.780913, -4.551655, -0.3072751, 0, 1.5, 0.5, 0.5
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
-2, -3.479082, -6.235067,
3, -3.479082, -6.235067,
-2, -3.479082, -6.235067,
-2, -3.657844, -6.531456,
-1, -3.479082, -6.235067,
-1, -3.657844, -6.531456,
0, -3.479082, -6.235067,
0, -3.657844, -6.531456,
1, -3.479082, -6.235067,
1, -3.657844, -6.531456,
2, -3.479082, -6.235067,
2, -3.657844, -6.531456,
3, -3.479082, -6.235067,
3, -3.657844, -6.531456
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
-2, -4.015368, -7.124236, 0, -0.5, 0.5, 0.5,
-2, -4.015368, -7.124236, 1, -0.5, 0.5, 0.5,
-2, -4.015368, -7.124236, 1, 1.5, 0.5, 0.5,
-2, -4.015368, -7.124236, 0, 1.5, 0.5, 0.5,
-1, -4.015368, -7.124236, 0, -0.5, 0.5, 0.5,
-1, -4.015368, -7.124236, 1, -0.5, 0.5, 0.5,
-1, -4.015368, -7.124236, 1, 1.5, 0.5, 0.5,
-1, -4.015368, -7.124236, 0, 1.5, 0.5, 0.5,
0, -4.015368, -7.124236, 0, -0.5, 0.5, 0.5,
0, -4.015368, -7.124236, 1, -0.5, 0.5, 0.5,
0, -4.015368, -7.124236, 1, 1.5, 0.5, 0.5,
0, -4.015368, -7.124236, 0, 1.5, 0.5, 0.5,
1, -4.015368, -7.124236, 0, -0.5, 0.5, 0.5,
1, -4.015368, -7.124236, 1, -0.5, 0.5, 0.5,
1, -4.015368, -7.124236, 1, 1.5, 0.5, 0.5,
1, -4.015368, -7.124236, 0, 1.5, 0.5, 0.5,
2, -4.015368, -7.124236, 0, -0.5, 0.5, 0.5,
2, -4.015368, -7.124236, 1, -0.5, 0.5, 0.5,
2, -4.015368, -7.124236, 1, 1.5, 0.5, 0.5,
2, -4.015368, -7.124236, 0, 1.5, 0.5, 0.5,
3, -4.015368, -7.124236, 0, -0.5, 0.5, 0.5,
3, -4.015368, -7.124236, 1, -0.5, 0.5, 0.5,
3, -4.015368, -7.124236, 1, 1.5, 0.5, 0.5,
3, -4.015368, -7.124236, 0, 1.5, 0.5, 0.5
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
-2.880496, -3, -6.235067,
-2.880496, 3, -6.235067,
-2.880496, -3, -6.235067,
-3.030565, -3, -6.531456,
-2.880496, -2, -6.235067,
-3.030565, -2, -6.531456,
-2.880496, -1, -6.235067,
-3.030565, -1, -6.531456,
-2.880496, 0, -6.235067,
-3.030565, 0, -6.531456,
-2.880496, 1, -6.235067,
-3.030565, 1, -6.531456,
-2.880496, 2, -6.235067,
-3.030565, 2, -6.531456,
-2.880496, 3, -6.235067,
-3.030565, 3, -6.531456
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
-3.330704, -3, -7.124236, 0, -0.5, 0.5, 0.5,
-3.330704, -3, -7.124236, 1, -0.5, 0.5, 0.5,
-3.330704, -3, -7.124236, 1, 1.5, 0.5, 0.5,
-3.330704, -3, -7.124236, 0, 1.5, 0.5, 0.5,
-3.330704, -2, -7.124236, 0, -0.5, 0.5, 0.5,
-3.330704, -2, -7.124236, 1, -0.5, 0.5, 0.5,
-3.330704, -2, -7.124236, 1, 1.5, 0.5, 0.5,
-3.330704, -2, -7.124236, 0, 1.5, 0.5, 0.5,
-3.330704, -1, -7.124236, 0, -0.5, 0.5, 0.5,
-3.330704, -1, -7.124236, 1, -0.5, 0.5, 0.5,
-3.330704, -1, -7.124236, 1, 1.5, 0.5, 0.5,
-3.330704, -1, -7.124236, 0, 1.5, 0.5, 0.5,
-3.330704, 0, -7.124236, 0, -0.5, 0.5, 0.5,
-3.330704, 0, -7.124236, 1, -0.5, 0.5, 0.5,
-3.330704, 0, -7.124236, 1, 1.5, 0.5, 0.5,
-3.330704, 0, -7.124236, 0, 1.5, 0.5, 0.5,
-3.330704, 1, -7.124236, 0, -0.5, 0.5, 0.5,
-3.330704, 1, -7.124236, 1, -0.5, 0.5, 0.5,
-3.330704, 1, -7.124236, 1, 1.5, 0.5, 0.5,
-3.330704, 1, -7.124236, 0, 1.5, 0.5, 0.5,
-3.330704, 2, -7.124236, 0, -0.5, 0.5, 0.5,
-3.330704, 2, -7.124236, 1, -0.5, 0.5, 0.5,
-3.330704, 2, -7.124236, 1, 1.5, 0.5, 0.5,
-3.330704, 2, -7.124236, 0, 1.5, 0.5, 0.5,
-3.330704, 3, -7.124236, 0, -0.5, 0.5, 0.5,
-3.330704, 3, -7.124236, 1, -0.5, 0.5, 0.5,
-3.330704, 3, -7.124236, 1, 1.5, 0.5, 0.5,
-3.330704, 3, -7.124236, 0, 1.5, 0.5, 0.5
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
-2.880496, -3.479082, -6,
-2.880496, -3.479082, 4,
-2.880496, -3.479082, -6,
-3.030565, -3.657844, -6,
-2.880496, -3.479082, -4,
-3.030565, -3.657844, -4,
-2.880496, -3.479082, -2,
-3.030565, -3.657844, -2,
-2.880496, -3.479082, 0,
-3.030565, -3.657844, 0,
-2.880496, -3.479082, 2,
-3.030565, -3.657844, 2,
-2.880496, -3.479082, 4,
-3.030565, -3.657844, 4
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
"-6",
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
-3.330704, -4.015368, -6, 0, -0.5, 0.5, 0.5,
-3.330704, -4.015368, -6, 1, -0.5, 0.5, 0.5,
-3.330704, -4.015368, -6, 1, 1.5, 0.5, 0.5,
-3.330704, -4.015368, -6, 0, 1.5, 0.5, 0.5,
-3.330704, -4.015368, -4, 0, -0.5, 0.5, 0.5,
-3.330704, -4.015368, -4, 1, -0.5, 0.5, 0.5,
-3.330704, -4.015368, -4, 1, 1.5, 0.5, 0.5,
-3.330704, -4.015368, -4, 0, 1.5, 0.5, 0.5,
-3.330704, -4.015368, -2, 0, -0.5, 0.5, 0.5,
-3.330704, -4.015368, -2, 1, -0.5, 0.5, 0.5,
-3.330704, -4.015368, -2, 1, 1.5, 0.5, 0.5,
-3.330704, -4.015368, -2, 0, 1.5, 0.5, 0.5,
-3.330704, -4.015368, 0, 0, -0.5, 0.5, 0.5,
-3.330704, -4.015368, 0, 1, -0.5, 0.5, 0.5,
-3.330704, -4.015368, 0, 1, 1.5, 0.5, 0.5,
-3.330704, -4.015368, 0, 0, 1.5, 0.5, 0.5,
-3.330704, -4.015368, 2, 0, -0.5, 0.5, 0.5,
-3.330704, -4.015368, 2, 1, -0.5, 0.5, 0.5,
-3.330704, -4.015368, 2, 1, 1.5, 0.5, 0.5,
-3.330704, -4.015368, 2, 0, 1.5, 0.5, 0.5,
-3.330704, -4.015368, 4, 0, -0.5, 0.5, 0.5,
-3.330704, -4.015368, 4, 1, -0.5, 0.5, 0.5,
-3.330704, -4.015368, 4, 1, 1.5, 0.5, 0.5,
-3.330704, -4.015368, 4, 0, 1.5, 0.5, 0.5
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
-2.880496, -3.479082, -6.235067,
-2.880496, 3.671409, -6.235067,
-2.880496, -3.479082, 5.620517,
-2.880496, 3.671409, 5.620517,
-2.880496, -3.479082, -6.235067,
-2.880496, -3.479082, 5.620517,
-2.880496, 3.671409, -6.235067,
-2.880496, 3.671409, 5.620517,
-2.880496, -3.479082, -6.235067,
3.122284, -3.479082, -6.235067,
-2.880496, -3.479082, 5.620517,
3.122284, -3.479082, 5.620517,
-2.880496, 3.671409, -6.235067,
3.122284, 3.671409, -6.235067,
-2.880496, 3.671409, 5.620517,
3.122284, 3.671409, 5.620517,
3.122284, -3.479082, -6.235067,
3.122284, 3.671409, -6.235067,
3.122284, -3.479082, 5.620517,
3.122284, 3.671409, 5.620517,
3.122284, -3.479082, -6.235067,
3.122284, -3.479082, 5.620517,
3.122284, 3.671409, -6.235067,
3.122284, 3.671409, 5.620517
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
var radius = 8.057938;
var distance = 35.85067;
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
mvMatrix.translate( -0.120894, -0.09616339, 0.3072751 );
mvMatrix.scale( 1.451394, 1.218434, 0.7348773 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.85067);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Isopropamide<-read.table("Isopropamide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Isopropamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Isopropamide' not found
```

```r
y<-Isopropamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Isopropamide' not found
```

```r
z<-Isopropamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Isopropamide' not found
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
-2.793077, -1.074546, -1.705075, 0, 0, 1, 1, 1,
-2.6945, -0.4601432, -2.529681, 1, 0, 0, 1, 1,
-2.647568, -1.45646, -1.784334, 1, 0, 0, 1, 1,
-2.60225, -1.204403, -3.42941, 1, 0, 0, 1, 1,
-2.587175, -0.6926886, -2.573124, 1, 0, 0, 1, 1,
-2.347891, -0.2627181, -0.8465227, 1, 0, 0, 1, 1,
-2.344855, -0.9143085, -1.044868, 0, 0, 0, 1, 1,
-2.341317, -0.09727598, -0.6343762, 0, 0, 0, 1, 1,
-2.305902, 0.5339914, -1.045306, 0, 0, 0, 1, 1,
-2.275156, 0.8354184, -1.556067, 0, 0, 0, 1, 1,
-2.27138, -0.1178504, 0.1814192, 0, 0, 0, 1, 1,
-2.26806, 0.4075024, -2.565089, 0, 0, 0, 1, 1,
-2.252641, 0.9747444, -0.3257818, 0, 0, 0, 1, 1,
-2.250652, -0.5851445, -1.883919, 1, 1, 1, 1, 1,
-2.207994, 0.474685, -2.261272, 1, 1, 1, 1, 1,
-2.165387, 0.6814465, -0.9354509, 1, 1, 1, 1, 1,
-2.138688, -0.2038971, -1.636106, 1, 1, 1, 1, 1,
-2.126387, -1.570114, -1.228735, 1, 1, 1, 1, 1,
-2.113394, 1.853201, -0.9085392, 1, 1, 1, 1, 1,
-2.066837, -1.571346, -1.914896, 1, 1, 1, 1, 1,
-2.051425, 0.4743655, -2.449291, 1, 1, 1, 1, 1,
-2.028861, -0.6510127, -2.272682, 1, 1, 1, 1, 1,
-2.008285, 0.3184082, -3.45479, 1, 1, 1, 1, 1,
-2.007531, 0.4649955, -2.565685, 1, 1, 1, 1, 1,
-1.990072, 0.7021582, 0.6352897, 1, 1, 1, 1, 1,
-1.973113, 0.7747751, -1.402895, 1, 1, 1, 1, 1,
-1.914109, -0.838092, -2.773489, 1, 1, 1, 1, 1,
-1.897639, -2.766093, -1.404444, 1, 1, 1, 1, 1,
-1.890721, 1.544059, -0.4040954, 0, 0, 1, 1, 1,
-1.882927, -0.1341735, -2.560331, 1, 0, 0, 1, 1,
-1.878465, -0.7724996, -1.578641, 1, 0, 0, 1, 1,
-1.878397, -1.008206, -1.951426, 1, 0, 0, 1, 1,
-1.876284, 2.2252, -1.256368, 1, 0, 0, 1, 1,
-1.873868, 0.09422588, -1.14577, 1, 0, 0, 1, 1,
-1.841303, 0.768832, -0.50658, 0, 0, 0, 1, 1,
-1.804093, -0.439235, -0.9254262, 0, 0, 0, 1, 1,
-1.778152, 1.818764, 0.7776067, 0, 0, 0, 1, 1,
-1.773003, -0.6726685, -3.827969, 0, 0, 0, 1, 1,
-1.761508, 0.5762135, -1.10429, 0, 0, 0, 1, 1,
-1.749387, 0.4660184, -2.888436, 0, 0, 0, 1, 1,
-1.741028, -0.6859462, -1.0736, 0, 0, 0, 1, 1,
-1.738682, -0.1653608, -1.580747, 1, 1, 1, 1, 1,
-1.708679, -0.04253916, -1.087418, 1, 1, 1, 1, 1,
-1.678874, -1.59206, -1.81539, 1, 1, 1, 1, 1,
-1.676996, 0.8082904, -1.175786, 1, 1, 1, 1, 1,
-1.665094, -0.2537747, -1.109776, 1, 1, 1, 1, 1,
-1.633542, -1.488752, -3.122919, 1, 1, 1, 1, 1,
-1.633271, -1.806129, -2.392099, 1, 1, 1, 1, 1,
-1.632091, -0.479988, 0.5168899, 1, 1, 1, 1, 1,
-1.630455, -0.1605106, -2.821749, 1, 1, 1, 1, 1,
-1.627121, -0.9341873, -0.1853355, 1, 1, 1, 1, 1,
-1.622713, -0.4990641, -0.9392362, 1, 1, 1, 1, 1,
-1.610408, 0.2362466, -0.08171785, 1, 1, 1, 1, 1,
-1.606967, 0.1870213, -1.987941, 1, 1, 1, 1, 1,
-1.606688, 0.2947523, -0.8573843, 1, 1, 1, 1, 1,
-1.605478, -0.02362249, -1.235957, 1, 1, 1, 1, 1,
-1.604499, -0.500118, -1.902785, 0, 0, 1, 1, 1,
-1.603647, 1.424714, 1.273037, 1, 0, 0, 1, 1,
-1.603386, -0.8459128, -0.667264, 1, 0, 0, 1, 1,
-1.592679, -1.295721, -4.265909, 1, 0, 0, 1, 1,
-1.588547, 1.038537, -0.1553845, 1, 0, 0, 1, 1,
-1.582706, 0.2787738, -1.159412, 1, 0, 0, 1, 1,
-1.572486, -0.8178168, -1.794391, 0, 0, 0, 1, 1,
-1.522676, 0.4597349, -1.730618, 0, 0, 0, 1, 1,
-1.51403, 0.7979915, -0.8595043, 0, 0, 0, 1, 1,
-1.506692, 2.63922, 0.3977355, 0, 0, 0, 1, 1,
-1.496588, 1.342479, -0.9425101, 0, 0, 0, 1, 1,
-1.493826, -1.080642, -3.386218, 0, 0, 0, 1, 1,
-1.492555, -1.09919, -0.829623, 0, 0, 0, 1, 1,
-1.490058, -0.3346562, -1.672091, 1, 1, 1, 1, 1,
-1.47544, 0.3038781, -2.787712, 1, 1, 1, 1, 1,
-1.468367, 0.2038148, -0.9329012, 1, 1, 1, 1, 1,
-1.459829, -0.1152237, -0.7760797, 1, 1, 1, 1, 1,
-1.457091, 1.041948, -1.071829, 1, 1, 1, 1, 1,
-1.4559, -0.8257679, -2.981008, 1, 1, 1, 1, 1,
-1.450478, -0.3584207, -1.938647, 1, 1, 1, 1, 1,
-1.437033, 0.05558321, -1.211025, 1, 1, 1, 1, 1,
-1.426988, -0.6762357, -1.288532, 1, 1, 1, 1, 1,
-1.426642, -0.439154, -1.701664, 1, 1, 1, 1, 1,
-1.412763, 0.8376464, 2.366988, 1, 1, 1, 1, 1,
-1.411198, -0.2804189, -1.560283, 1, 1, 1, 1, 1,
-1.395706, -0.2474167, -0.4109534, 1, 1, 1, 1, 1,
-1.391752, -0.00356912, -1.498959, 1, 1, 1, 1, 1,
-1.370769, -1.903908, -3.36521, 1, 1, 1, 1, 1,
-1.356855, -1.315414, -4.90901, 0, 0, 1, 1, 1,
-1.356152, 0.1881691, -1.32765, 1, 0, 0, 1, 1,
-1.350346, -0.7272562, -2.83402, 1, 0, 0, 1, 1,
-1.347244, -0.4590725, 0.01277585, 1, 0, 0, 1, 1,
-1.338967, -1.391484, -1.855386, 1, 0, 0, 1, 1,
-1.337186, -0.9221154, -2.227729, 1, 0, 0, 1, 1,
-1.330866, 1.695725, -1.565901, 0, 0, 0, 1, 1,
-1.323404, 1.581617, 0.3577221, 0, 0, 0, 1, 1,
-1.321318, 0.7540843, -1.442686, 0, 0, 0, 1, 1,
-1.315136, -1.614142, -4.027853, 0, 0, 0, 1, 1,
-1.311117, 0.03755634, -2.500454, 0, 0, 0, 1, 1,
-1.303587, 1.409783, -0.9580405, 0, 0, 0, 1, 1,
-1.293524, 0.3725001, -2.667205, 0, 0, 0, 1, 1,
-1.29175, 0.734331, -0.09624082, 1, 1, 1, 1, 1,
-1.285228, 0.7756028, -1.616323, 1, 1, 1, 1, 1,
-1.283911, -0.08721756, -0.6440663, 1, 1, 1, 1, 1,
-1.279105, 0.3612543, -0.7478101, 1, 1, 1, 1, 1,
-1.278991, -2.42179, -4.468753, 1, 1, 1, 1, 1,
-1.276872, -1.64228, -2.458867, 1, 1, 1, 1, 1,
-1.276547, 1.018239, -2.559497, 1, 1, 1, 1, 1,
-1.261925, -1.034847, -1.88249, 1, 1, 1, 1, 1,
-1.259572, 0.8762396, -2.956916, 1, 1, 1, 1, 1,
-1.249493, 0.1272817, -2.428995, 1, 1, 1, 1, 1,
-1.247411, 1.451213, -2.59929, 1, 1, 1, 1, 1,
-1.23338, 0.5840466, -2.0354, 1, 1, 1, 1, 1,
-1.232661, 0.7604405, -1.023224, 1, 1, 1, 1, 1,
-1.228814, -0.6007218, -3.391268, 1, 1, 1, 1, 1,
-1.224857, -0.09870079, -0.4144924, 1, 1, 1, 1, 1,
-1.216513, 0.352902, -0.121347, 0, 0, 1, 1, 1,
-1.216024, 0.3843048, -0.2803934, 1, 0, 0, 1, 1,
-1.186786, -1.387573, -2.104145, 1, 0, 0, 1, 1,
-1.183039, 0.4352288, -2.270319, 1, 0, 0, 1, 1,
-1.180714, 1.42988, 0.1812067, 1, 0, 0, 1, 1,
-1.174788, 1.830734, -1.3804, 1, 0, 0, 1, 1,
-1.17339, 0.8048578, 1.139806, 0, 0, 0, 1, 1,
-1.169896, -0.5623523, -2.264194, 0, 0, 0, 1, 1,
-1.167562, 0.5219386, -1.774641, 0, 0, 0, 1, 1,
-1.162517, -0.7713687, -2.347389, 0, 0, 0, 1, 1,
-1.159557, 0.3365948, -1.803452, 0, 0, 0, 1, 1,
-1.157434, 0.3974972, -1.160897, 0, 0, 0, 1, 1,
-1.157042, 0.2986702, -0.5893425, 0, 0, 0, 1, 1,
-1.155833, -0.3968989, -0.6359341, 1, 1, 1, 1, 1,
-1.146041, -0.5737776, -1.26098, 1, 1, 1, 1, 1,
-1.145435, -0.6784967, -3.308211, 1, 1, 1, 1, 1,
-1.139486, -0.4712763, -1.764574, 1, 1, 1, 1, 1,
-1.137586, -0.6113792, -2.391344, 1, 1, 1, 1, 1,
-1.135108, -1.262682, -1.290895, 1, 1, 1, 1, 1,
-1.134211, -0.2877724, -2.70807, 1, 1, 1, 1, 1,
-1.133958, -0.1732951, -0.2369474, 1, 1, 1, 1, 1,
-1.133417, -2.349859, -1.227463, 1, 1, 1, 1, 1,
-1.128254, 2.012383, 0.8368951, 1, 1, 1, 1, 1,
-1.126974, 1.086885, -1.574184, 1, 1, 1, 1, 1,
-1.126586, -0.3623028, -0.4349816, 1, 1, 1, 1, 1,
-1.126256, 0.9703975, -0.9897556, 1, 1, 1, 1, 1,
-1.125207, 0.4539395, -2.252594, 1, 1, 1, 1, 1,
-1.124892, 1.324273, 0.864507, 1, 1, 1, 1, 1,
-1.113154, 1.166267, -0.2437567, 0, 0, 1, 1, 1,
-1.111157, 0.5304191, -1.401942, 1, 0, 0, 1, 1,
-1.103153, 2.605476, -0.5515442, 1, 0, 0, 1, 1,
-1.097395, -1.029563, -3.017677, 1, 0, 0, 1, 1,
-1.0971, 0.2451147, -1.926876, 1, 0, 0, 1, 1,
-1.080443, -2.237107, -3.960523, 1, 0, 0, 1, 1,
-1.066022, 0.331306, -1.363434, 0, 0, 0, 1, 1,
-1.065093, 0.6584942, -1.210581, 0, 0, 0, 1, 1,
-1.06506, 1.179801, -2.964304, 0, 0, 0, 1, 1,
-1.059052, -0.3107467, -0.9644923, 0, 0, 0, 1, 1,
-1.057524, 0.8284123, -0.5836024, 0, 0, 0, 1, 1,
-1.053139, -0.07594716, -1.318087, 0, 0, 0, 1, 1,
-1.049575, -0.3353333, -0.8913891, 0, 0, 0, 1, 1,
-1.049405, 0.8955191, -3.791416, 1, 1, 1, 1, 1,
-1.049201, -0.3356957, -1.736608, 1, 1, 1, 1, 1,
-1.048657, -0.1253806, -1.893878, 1, 1, 1, 1, 1,
-1.048536, 0.1241264, -1.943035, 1, 1, 1, 1, 1,
-1.042585, 1.52158, -0.977221, 1, 1, 1, 1, 1,
-1.039918, -0.711813, -3.488068, 1, 1, 1, 1, 1,
-1.038423, 0.4421441, -0.7726009, 1, 1, 1, 1, 1,
-1.036765, -0.145068, -1.224289, 1, 1, 1, 1, 1,
-1.030246, -0.1906154, -0.6889291, 1, 1, 1, 1, 1,
-1.028231, 0.005843191, -0.6651442, 1, 1, 1, 1, 1,
-1.02702, -0.7328933, -1.709947, 1, 1, 1, 1, 1,
-1.017021, 0.5078911, -2.687053, 1, 1, 1, 1, 1,
-1.014206, -1.164883, -2.230491, 1, 1, 1, 1, 1,
-1.011611, 0.8125114, -1.257358, 1, 1, 1, 1, 1,
-1.003398, 0.3197228, -0.9859383, 1, 1, 1, 1, 1,
-1.00326, 1.72886, -0.9242197, 0, 0, 1, 1, 1,
-1.000354, 0.8912488, -0.8771192, 1, 0, 0, 1, 1,
-0.9984984, -1.316608, -0.5988834, 1, 0, 0, 1, 1,
-0.9976013, 0.4687953, -0.7229236, 1, 0, 0, 1, 1,
-0.9957442, 0.1656359, -3.62364, 1, 0, 0, 1, 1,
-0.9856586, -0.2273217, -3.719182, 1, 0, 0, 1, 1,
-0.972194, -1.698805, -3.386897, 0, 0, 0, 1, 1,
-0.9693633, 0.5144552, -0.7272256, 0, 0, 0, 1, 1,
-0.9634089, -0.3996186, -0.8451318, 0, 0, 0, 1, 1,
-0.9540595, 0.1268206, -2.487447, 0, 0, 0, 1, 1,
-0.9510787, -2.908051, -3.027745, 0, 0, 0, 1, 1,
-0.9495781, -0.001974321, -1.939591, 0, 0, 0, 1, 1,
-0.9484071, -0.9229575, -2.109777, 0, 0, 0, 1, 1,
-0.9480308, -0.2166456, -1.259838, 1, 1, 1, 1, 1,
-0.947681, -0.06326485, -3.594112, 1, 1, 1, 1, 1,
-0.9459623, 0.4998415, -0.7273327, 1, 1, 1, 1, 1,
-0.9457209, -0.04743083, -1.541976, 1, 1, 1, 1, 1,
-0.9412015, -2.452856, -3.825204, 1, 1, 1, 1, 1,
-0.9410827, 0.8438925, -1.099609, 1, 1, 1, 1, 1,
-0.9349317, -1.598499, -2.079999, 1, 1, 1, 1, 1,
-0.933579, 0.1970535, -1.286639, 1, 1, 1, 1, 1,
-0.92211, -0.6481999, -4.112199, 1, 1, 1, 1, 1,
-0.921024, -1.182975, -3.688246, 1, 1, 1, 1, 1,
-0.9189438, -1.787032, -2.568126, 1, 1, 1, 1, 1,
-0.9172169, 0.8190371, -2.402287, 1, 1, 1, 1, 1,
-0.9162749, -0.1676967, -0.3395364, 1, 1, 1, 1, 1,
-0.9116251, -1.599316, -3.399019, 1, 1, 1, 1, 1,
-0.9040233, 0.5172619, -1.927189, 1, 1, 1, 1, 1,
-0.9021525, -0.7703397, -3.670256, 0, 0, 1, 1, 1,
-0.8927511, -1.260303, -3.076557, 1, 0, 0, 1, 1,
-0.8868665, -0.6828546, -4.82682, 1, 0, 0, 1, 1,
-0.8800036, 0.627225, -0.4366909, 1, 0, 0, 1, 1,
-0.8776972, -3.374949, -2.733591, 1, 0, 0, 1, 1,
-0.8764491, 1.21064, -1.984394, 1, 0, 0, 1, 1,
-0.8732682, -0.3140193, -3.690067, 0, 0, 0, 1, 1,
-0.8721976, 1.818447, -1.467739, 0, 0, 0, 1, 1,
-0.8712451, -1.344607, -2.540177, 0, 0, 0, 1, 1,
-0.8672706, 0.5718486, -1.885909, 0, 0, 0, 1, 1,
-0.8670517, 0.9188464, -0.744804, 0, 0, 0, 1, 1,
-0.8656627, 2.540563, -1.722868, 0, 0, 0, 1, 1,
-0.8630981, 1.098679, -1.786262, 0, 0, 0, 1, 1,
-0.8590214, 0.1847938, -0.4233572, 1, 1, 1, 1, 1,
-0.857589, 0.6844073, 0.03813051, 1, 1, 1, 1, 1,
-0.8535477, -1.321818, -0.1401379, 1, 1, 1, 1, 1,
-0.8526636, -0.328361, -1.589092, 1, 1, 1, 1, 1,
-0.8503985, -0.2635588, -3.668269, 1, 1, 1, 1, 1,
-0.8453734, 0.2346906, -0.3754242, 1, 1, 1, 1, 1,
-0.8423645, 1.324975, -0.768603, 1, 1, 1, 1, 1,
-0.8287848, -0.00360395, -2.593369, 1, 1, 1, 1, 1,
-0.8204476, 1.369919, -1.264484, 1, 1, 1, 1, 1,
-0.8198017, -0.8343908, -0.847743, 1, 1, 1, 1, 1,
-0.8196378, -1.042428, -2.679735, 1, 1, 1, 1, 1,
-0.8192118, 0.1302955, -3.33121, 1, 1, 1, 1, 1,
-0.8163657, 1.461541, -0.6707219, 1, 1, 1, 1, 1,
-0.8153946, -0.8167254, -0.948281, 1, 1, 1, 1, 1,
-0.8143388, -0.5889894, -1.356194, 1, 1, 1, 1, 1,
-0.8091142, 0.7093559, -0.8102556, 0, 0, 1, 1, 1,
-0.8059855, -0.7463377, -3.141441, 1, 0, 0, 1, 1,
-0.7974011, 0.3922715, -1.698653, 1, 0, 0, 1, 1,
-0.7950928, 0.08319075, -0.3975157, 1, 0, 0, 1, 1,
-0.7851507, -1.041072, -1.493158, 1, 0, 0, 1, 1,
-0.7846006, -1.573225, -0.9131206, 1, 0, 0, 1, 1,
-0.7824197, 1.48977, 1.557585, 0, 0, 0, 1, 1,
-0.7772446, -0.5339426, -1.896127, 0, 0, 0, 1, 1,
-0.772131, 0.9917393, 1.455708, 0, 0, 0, 1, 1,
-0.7690473, 1.36742, 0.4822807, 0, 0, 0, 1, 1,
-0.7681231, -0.4771189, -2.133242, 0, 0, 0, 1, 1,
-0.7667432, -1.050694, -1.89609, 0, 0, 0, 1, 1,
-0.7617382, 0.8965222, -1.571965, 0, 0, 0, 1, 1,
-0.7509443, -0.8056755, -2.192176, 1, 1, 1, 1, 1,
-0.7474322, -0.7195208, -3.290964, 1, 1, 1, 1, 1,
-0.7360747, -1.562486, -3.542635, 1, 1, 1, 1, 1,
-0.7251543, -0.157344, -1.20258, 1, 1, 1, 1, 1,
-0.7245383, 0.09230859, -2.554004, 1, 1, 1, 1, 1,
-0.7240486, -0.8422151, -3.310996, 1, 1, 1, 1, 1,
-0.7205357, 0.7598187, -0.8510106, 1, 1, 1, 1, 1,
-0.7202969, 0.8356006, -2.684711, 1, 1, 1, 1, 1,
-0.7158701, -0.003630996, -1.444005, 1, 1, 1, 1, 1,
-0.708959, 1.471664, -2.345128, 1, 1, 1, 1, 1,
-0.7081493, 1.308517, 0.5087007, 1, 1, 1, 1, 1,
-0.7078753, 0.148723, -2.506891, 1, 1, 1, 1, 1,
-0.7070758, 0.6955402, -1.068339, 1, 1, 1, 1, 1,
-0.7037436, -0.0161518, -3.22048, 1, 1, 1, 1, 1,
-0.7036511, -0.9673116, -0.9124597, 1, 1, 1, 1, 1,
-0.7021419, 0.4150749, -1.387813, 0, 0, 1, 1, 1,
-0.6926945, 0.4457585, -0.911976, 1, 0, 0, 1, 1,
-0.6892737, -1.141145, -3.48986, 1, 0, 0, 1, 1,
-0.6844866, 0.3802104, -2.256787, 1, 0, 0, 1, 1,
-0.6821939, 0.8097712, -1.925358, 1, 0, 0, 1, 1,
-0.680176, 0.3709949, -1.413283, 1, 0, 0, 1, 1,
-0.6783864, 0.2703321, -2.112525, 0, 0, 0, 1, 1,
-0.6749185, 0.0510146, -1.498606, 0, 0, 0, 1, 1,
-0.666996, -3.310502, -2.748638, 0, 0, 0, 1, 1,
-0.6650143, -0.07847384, -2.422129, 0, 0, 0, 1, 1,
-0.6648455, -1.48579, -1.988867, 0, 0, 0, 1, 1,
-0.6613764, -0.1020507, -0.6723424, 0, 0, 0, 1, 1,
-0.6550367, 0.7320514, -1.016606, 0, 0, 0, 1, 1,
-0.6544432, -0.727601, -1.700889, 1, 1, 1, 1, 1,
-0.6519805, -0.8513796, -0.4397327, 1, 1, 1, 1, 1,
-0.6515142, 0.5069305, 0.8304841, 1, 1, 1, 1, 1,
-0.6478041, 0.6986208, -1.03577, 1, 1, 1, 1, 1,
-0.6465725, -0.5450879, -2.178944, 1, 1, 1, 1, 1,
-0.6370525, 0.4825196, -1.385946, 1, 1, 1, 1, 1,
-0.6369612, 0.106262, -2.06752, 1, 1, 1, 1, 1,
-0.6319736, -1.66235, -1.909535, 1, 1, 1, 1, 1,
-0.6160511, 1.383097, -0.547002, 1, 1, 1, 1, 1,
-0.6154628, -2.14161, -0.9795637, 1, 1, 1, 1, 1,
-0.6137124, 0.1366881, -2.4817, 1, 1, 1, 1, 1,
-0.6096222, -0.8055288, -3.141934, 1, 1, 1, 1, 1,
-0.6086758, -1.666135, -2.59281, 1, 1, 1, 1, 1,
-0.6081141, 1.615615, 0.7273089, 1, 1, 1, 1, 1,
-0.6018859, 0.06902132, -1.494977, 1, 1, 1, 1, 1,
-0.6013668, 0.7355793, 0.2253271, 0, 0, 1, 1, 1,
-0.5984827, 1.364866, 1.793215, 1, 0, 0, 1, 1,
-0.5893178, 0.1316368, 0.508759, 1, 0, 0, 1, 1,
-0.588598, 0.238772, -0.8534549, 1, 0, 0, 1, 1,
-0.5818927, -0.2792894, -1.277458, 1, 0, 0, 1, 1,
-0.5803579, -1.306727, -2.363487, 1, 0, 0, 1, 1,
-0.5790608, -0.999718, -1.746127, 0, 0, 0, 1, 1,
-0.5763922, -0.09210104, 1.575851, 0, 0, 0, 1, 1,
-0.5756924, -0.4900352, -1.599407, 0, 0, 0, 1, 1,
-0.5739522, -0.9395604, -1.785555, 0, 0, 0, 1, 1,
-0.5738645, 0.8141444, -0.2272826, 0, 0, 0, 1, 1,
-0.5728164, 0.7842512, -2.186346, 0, 0, 0, 1, 1,
-0.5724531, 0.02414845, -1.015951, 0, 0, 0, 1, 1,
-0.5632026, -1.028485, -2.422797, 1, 1, 1, 1, 1,
-0.56139, -0.4282714, -1.123068, 1, 1, 1, 1, 1,
-0.5604913, 0.2791917, -0.7123327, 1, 1, 1, 1, 1,
-0.5577646, 0.8987163, -0.5537907, 1, 1, 1, 1, 1,
-0.5570487, 0.7166125, -1.242669, 1, 1, 1, 1, 1,
-0.5518256, 0.02407413, -1.975497, 1, 1, 1, 1, 1,
-0.5514979, -0.2464364, -2.347238, 1, 1, 1, 1, 1,
-0.5469902, 0.7205057, 0.6571223, 1, 1, 1, 1, 1,
-0.5396778, -0.3211007, -1.535624, 1, 1, 1, 1, 1,
-0.5378477, -0.04617006, -1.848555, 1, 1, 1, 1, 1,
-0.5369687, 0.9716392, 0.8499876, 1, 1, 1, 1, 1,
-0.5236594, -0.5528863, -1.83824, 1, 1, 1, 1, 1,
-0.5224989, -1.33722, -4.108678, 1, 1, 1, 1, 1,
-0.5124564, 0.3009929, -0.7819779, 1, 1, 1, 1, 1,
-0.5115895, 0.3624952, -1.096305, 1, 1, 1, 1, 1,
-0.5095994, 0.9700287, -0.3080623, 0, 0, 1, 1, 1,
-0.506577, 0.4259425, -1.118271, 1, 0, 0, 1, 1,
-0.5058869, -0.9383017, -2.499891, 1, 0, 0, 1, 1,
-0.5042484, 0.719769, -0.6562924, 1, 0, 0, 1, 1,
-0.5005657, 0.5133179, -1.061456, 1, 0, 0, 1, 1,
-0.4968147, 1.027242, -0.6804482, 1, 0, 0, 1, 1,
-0.4964035, -0.6178041, -2.078301, 0, 0, 0, 1, 1,
-0.4955689, -0.09338167, -0.1232279, 0, 0, 0, 1, 1,
-0.4920163, -0.3991278, -1.924558, 0, 0, 0, 1, 1,
-0.4878287, -0.5205732, -2.8837, 0, 0, 0, 1, 1,
-0.4855127, -1.401394, -2.246822, 0, 0, 0, 1, 1,
-0.4845077, -0.1220908, -0.7392762, 0, 0, 0, 1, 1,
-0.4813633, 0.1625559, -1.177251, 0, 0, 0, 1, 1,
-0.4762817, 1.156721, 0.09289415, 1, 1, 1, 1, 1,
-0.4716271, 1.00829, -1.321337, 1, 1, 1, 1, 1,
-0.470825, -0.2198389, -4.398626, 1, 1, 1, 1, 1,
-0.4683387, -0.9153212, -3.156674, 1, 1, 1, 1, 1,
-0.4577905, -0.6477697, -2.292984, 1, 1, 1, 1, 1,
-0.4551277, 0.1669624, -1.049679, 1, 1, 1, 1, 1,
-0.4528002, 0.2741729, -2.625576, 1, 1, 1, 1, 1,
-0.4479736, -0.7318983, -0.812859, 1, 1, 1, 1, 1,
-0.4475186, 0.1883192, -0.6819237, 1, 1, 1, 1, 1,
-0.4439272, -1.656821, -3.137605, 1, 1, 1, 1, 1,
-0.4430947, 0.7424734, -0.3805766, 1, 1, 1, 1, 1,
-0.4428929, 0.6491843, -0.6272115, 1, 1, 1, 1, 1,
-0.4389868, -0.3176748, -2.038424, 1, 1, 1, 1, 1,
-0.434909, -0.09200596, -1.224406, 1, 1, 1, 1, 1,
-0.4339115, -0.1086827, -1.350667, 1, 1, 1, 1, 1,
-0.4317498, -1.176861, -0.3933789, 0, 0, 1, 1, 1,
-0.429279, -0.05761556, -3.069605, 1, 0, 0, 1, 1,
-0.4264593, -0.4218983, -1.058192, 1, 0, 0, 1, 1,
-0.4222389, -1.079323, -3.475954, 1, 0, 0, 1, 1,
-0.4180672, 2.053165, 0.3343443, 1, 0, 0, 1, 1,
-0.416622, 1.0294, 0.4242277, 1, 0, 0, 1, 1,
-0.4143296, -1.422986, -3.569172, 0, 0, 0, 1, 1,
-0.41135, -1.300851, -2.16909, 0, 0, 0, 1, 1,
-0.4092225, -0.2419613, -1.570006, 0, 0, 0, 1, 1,
-0.407204, -0.7973813, -3.449004, 0, 0, 0, 1, 1,
-0.4064827, -0.1871255, -1.555975, 0, 0, 0, 1, 1,
-0.4016557, -0.5207233, -2.185893, 0, 0, 0, 1, 1,
-0.4009885, -2.707974, -3.256383, 0, 0, 0, 1, 1,
-0.4005164, 0.3086998, -2.098958, 1, 1, 1, 1, 1,
-0.3994373, 0.2961251, 1.527722, 1, 1, 1, 1, 1,
-0.3944165, -0.3047177, -2.240609, 1, 1, 1, 1, 1,
-0.3906144, -0.468543, -0.5096532, 1, 1, 1, 1, 1,
-0.3890362, 0.7470334, -1.97372, 1, 1, 1, 1, 1,
-0.385399, -0.9426494, -1.649674, 1, 1, 1, 1, 1,
-0.3853831, 1.253537, 0.06074932, 1, 1, 1, 1, 1,
-0.3847912, -0.06107482, -1.499055, 1, 1, 1, 1, 1,
-0.382342, -0.6618863, -2.346804, 1, 1, 1, 1, 1,
-0.3808407, -0.4054216, -1.108723, 1, 1, 1, 1, 1,
-0.3805026, 0.8080434, -1.569077, 1, 1, 1, 1, 1,
-0.3802747, -0.7401342, -2.51957, 1, 1, 1, 1, 1,
-0.3792711, 0.6953926, -2.81436, 1, 1, 1, 1, 1,
-0.3789208, 0.6762641, -2.03887, 1, 1, 1, 1, 1,
-0.3741451, -0.3724925, -1.63802, 1, 1, 1, 1, 1,
-0.3695421, -0.6346688, -3.923598, 0, 0, 1, 1, 1,
-0.3646073, -0.4479053, -2.906924, 1, 0, 0, 1, 1,
-0.3500382, 0.8802439, -2.507715, 1, 0, 0, 1, 1,
-0.3452973, -0.7785183, -2.130329, 1, 0, 0, 1, 1,
-0.3370843, 0.7598935, 0.5035672, 1, 0, 0, 1, 1,
-0.334755, -0.9100083, -1.498047, 1, 0, 0, 1, 1,
-0.3335593, 0.1751027, -1.554024, 0, 0, 0, 1, 1,
-0.3331328, 1.307116, 1.008702, 0, 0, 0, 1, 1,
-0.3311438, 2.590062, -0.6172544, 0, 0, 0, 1, 1,
-0.3296087, 0.0948569, -1.215721, 0, 0, 0, 1, 1,
-0.3265494, 1.658351, 1.486243, 0, 0, 0, 1, 1,
-0.3180569, -1.0821, -2.98068, 0, 0, 0, 1, 1,
-0.3158612, 0.8978997, -1.096872, 0, 0, 0, 1, 1,
-0.3139541, -1.299242, -2.754555, 1, 1, 1, 1, 1,
-0.3129682, -0.702337, -2.268833, 1, 1, 1, 1, 1,
-0.3122055, -1.397718, -5.35795, 1, 1, 1, 1, 1,
-0.3121228, -0.2964835, -2.918648, 1, 1, 1, 1, 1,
-0.3119401, 1.348899, 0.3117154, 1, 1, 1, 1, 1,
-0.3101335, 0.003755491, -2.35094, 1, 1, 1, 1, 1,
-0.3090195, 0.4064556, -0.9594133, 1, 1, 1, 1, 1,
-0.3036746, 0.5642589, -0.3052188, 1, 1, 1, 1, 1,
-0.3007869, 0.3665087, 0.4972316, 1, 1, 1, 1, 1,
-0.3007261, 0.3711199, 0.5549477, 1, 1, 1, 1, 1,
-0.2972657, -0.4567453, -3.998666, 1, 1, 1, 1, 1,
-0.2959274, 0.7593011, -2.163516, 1, 1, 1, 1, 1,
-0.2866704, 0.1951757, -1.107917, 1, 1, 1, 1, 1,
-0.2862329, -0.2095217, -2.259768, 1, 1, 1, 1, 1,
-0.2825728, 0.8732184, -0.3972615, 1, 1, 1, 1, 1,
-0.281841, 2.53695, 0.5594136, 0, 0, 1, 1, 1,
-0.2771881, -1.417785, -2.377985, 1, 0, 0, 1, 1,
-0.275374, 0.5164835, -0.8018425, 1, 0, 0, 1, 1,
-0.271736, -0.8886831, -3.621414, 1, 0, 0, 1, 1,
-0.2711989, 0.656168, 0.1784878, 1, 0, 0, 1, 1,
-0.2705792, 0.5443358, -0.9862054, 1, 0, 0, 1, 1,
-0.267565, 0.7940534, -0.05548894, 0, 0, 0, 1, 1,
-0.2646335, 0.8401802, -1.197118, 0, 0, 0, 1, 1,
-0.2630209, 0.6172969, -1.513507, 0, 0, 0, 1, 1,
-0.2615088, 1.375786, 0.3656671, 0, 0, 0, 1, 1,
-0.256721, -0.7303887, -0.7453098, 0, 0, 0, 1, 1,
-0.2545039, -0.1568215, -2.060458, 0, 0, 0, 1, 1,
-0.2544682, 0.122581, -2.004083, 0, 0, 0, 1, 1,
-0.2510226, -0.856687, -2.625155, 1, 1, 1, 1, 1,
-0.2487613, 1.453199, 1.218756, 1, 1, 1, 1, 1,
-0.2458163, 0.2413209, -1.765286, 1, 1, 1, 1, 1,
-0.2444054, 0.9205809, 0.9495847, 1, 1, 1, 1, 1,
-0.2407363, -0.08809806, -1.805023, 1, 1, 1, 1, 1,
-0.2400497, -0.09887502, -1.560409, 1, 1, 1, 1, 1,
-0.2344202, -1.298789, -2.329153, 1, 1, 1, 1, 1,
-0.2312995, 0.4093734, -1.784252, 1, 1, 1, 1, 1,
-0.2309346, -0.2154457, -1.393873, 1, 1, 1, 1, 1,
-0.2265226, 0.1656705, -2.377565, 1, 1, 1, 1, 1,
-0.2191547, -0.3144374, -1.427225, 1, 1, 1, 1, 1,
-0.2105697, -1.691959, -4.387064, 1, 1, 1, 1, 1,
-0.2104758, 0.1827987, -1.616239, 1, 1, 1, 1, 1,
-0.2100498, -0.4453881, -2.924032, 1, 1, 1, 1, 1,
-0.2087558, -0.5224345, -4.115177, 1, 1, 1, 1, 1,
-0.2068312, 0.06399826, -1.782839, 0, 0, 1, 1, 1,
-0.203077, 2.106442, -1.058309, 1, 0, 0, 1, 1,
-0.192146, 2.23106, 1.362095, 1, 0, 0, 1, 1,
-0.1914678, 1.088071, -1.020621, 1, 0, 0, 1, 1,
-0.1912211, 1.700432, -0.05660383, 1, 0, 0, 1, 1,
-0.1883598, -2.502659, -3.232971, 1, 0, 0, 1, 1,
-0.187169, -1.833237, -2.000413, 0, 0, 0, 1, 1,
-0.1852908, -1.191033, -3.084586, 0, 0, 0, 1, 1,
-0.1822664, 1.583242, -0.5335926, 0, 0, 0, 1, 1,
-0.1748572, 0.6415778, 0.9076923, 0, 0, 0, 1, 1,
-0.173544, 1.460185, -0.4798439, 0, 0, 0, 1, 1,
-0.1723081, -1.007894, -3.093091, 0, 0, 0, 1, 1,
-0.1720993, 0.07188287, -0.5774686, 0, 0, 0, 1, 1,
-0.1709418, 0.7195074, 0.2301029, 1, 1, 1, 1, 1,
-0.1700395, 1.191463, 1.052009, 1, 1, 1, 1, 1,
-0.1622825, -0.7064329, -1.651323, 1, 1, 1, 1, 1,
-0.1617205, 0.01511261, -0.9364932, 1, 1, 1, 1, 1,
-0.1566437, 1.925596, -0.5499809, 1, 1, 1, 1, 1,
-0.1550928, 0.09420966, -1.029672, 1, 1, 1, 1, 1,
-0.1534619, 0.9810977, -0.8009658, 1, 1, 1, 1, 1,
-0.1492802, 0.209137, -1.045234, 1, 1, 1, 1, 1,
-0.1475107, -0.9681305, -2.420275, 1, 1, 1, 1, 1,
-0.1452993, -0.7938024, -3.988576, 1, 1, 1, 1, 1,
-0.1447638, -0.1623642, -2.768039, 1, 1, 1, 1, 1,
-0.138056, -0.9970144, -3.119267, 1, 1, 1, 1, 1,
-0.1360245, 0.7861412, 0.6031583, 1, 1, 1, 1, 1,
-0.1336322, 2.131224, -0.193119, 1, 1, 1, 1, 1,
-0.1328454, -0.1929225, -1.569371, 1, 1, 1, 1, 1,
-0.1302619, -0.04348608, -2.006809, 0, 0, 1, 1, 1,
-0.1194386, 2.003084, -0.3117024, 1, 0, 0, 1, 1,
-0.1192628, -1.784222, -2.97938, 1, 0, 0, 1, 1,
-0.1185071, 1.596713, 1.261419, 1, 0, 0, 1, 1,
-0.115816, 0.2375076, -0.6432919, 1, 0, 0, 1, 1,
-0.1122598, -1.314001, -1.347332, 1, 0, 0, 1, 1,
-0.1121721, 0.1929526, -0.3806857, 0, 0, 0, 1, 1,
-0.1112727, 0.1194019, -0.2878383, 0, 0, 0, 1, 1,
-0.1097275, 2.340537, -0.1465498, 0, 0, 0, 1, 1,
-0.09664361, 0.2532411, 1.401705, 0, 0, 0, 1, 1,
-0.09645908, -0.548187, -2.920608, 0, 0, 0, 1, 1,
-0.09502426, 1.417268, 0.6057114, 0, 0, 0, 1, 1,
-0.09420177, -0.2947631, -2.156371, 0, 0, 0, 1, 1,
-0.09409744, -0.70942, -2.285239, 1, 1, 1, 1, 1,
-0.09092777, 0.1145967, 0.543867, 1, 1, 1, 1, 1,
-0.08688261, -0.6758263, -3.275562, 1, 1, 1, 1, 1,
-0.0852232, 1.656411, -1.032812, 1, 1, 1, 1, 1,
-0.0849943, 2.032488, -1.521042, 1, 1, 1, 1, 1,
-0.07577085, -1.482544, -3.408851, 1, 1, 1, 1, 1,
-0.07258384, 0.4161308, 0.4719435, 1, 1, 1, 1, 1,
-0.06995232, 0.1241951, 0.923844, 1, 1, 1, 1, 1,
-0.06976709, 0.6476614, -0.2678827, 1, 1, 1, 1, 1,
-0.06582876, 0.4634598, 0.4230392, 1, 1, 1, 1, 1,
-0.06564157, 0.9356449, -0.2886428, 1, 1, 1, 1, 1,
-0.06453731, -0.4729102, -6.062413, 1, 1, 1, 1, 1,
-0.06196228, 0.8014367, 0.9225456, 1, 1, 1, 1, 1,
-0.05157305, -0.9810743, -2.642974, 1, 1, 1, 1, 1,
-0.05120514, 0.7372222, -0.8693241, 1, 1, 1, 1, 1,
-0.0502797, 0.6367432, -0.3554518, 0, 0, 1, 1, 1,
-0.04531542, 0.03407507, -0.9126871, 1, 0, 0, 1, 1,
-0.04508313, -1.128001, -5.111122, 1, 0, 0, 1, 1,
-0.04375139, 0.9278365, 0.6740676, 1, 0, 0, 1, 1,
-0.04312586, 0.2148629, -1.777942, 1, 0, 0, 1, 1,
-0.03390542, -0.2463172, -3.647183, 1, 0, 0, 1, 1,
-0.02970838, -0.2525018, -4.967452, 0, 0, 0, 1, 1,
-0.02525019, -0.8005614, -2.473101, 0, 0, 0, 1, 1,
-0.02394426, -0.1890227, -2.203075, 0, 0, 0, 1, 1,
-0.02360993, -0.7246695, -3.164985, 0, 0, 0, 1, 1,
-0.02328002, 0.7936807, -0.6260079, 0, 0, 0, 1, 1,
-0.02088835, 0.4690544, -1.110925, 0, 0, 0, 1, 1,
-0.01726115, -0.0835831, -3.476908, 0, 0, 0, 1, 1,
-0.01719783, -0.3256326, -3.917529, 1, 1, 1, 1, 1,
-0.01655333, -0.03433912, -3.061434, 1, 1, 1, 1, 1,
-0.0153976, -1.206542, -3.622054, 1, 1, 1, 1, 1,
-0.009422095, -0.5550938, -2.718043, 1, 1, 1, 1, 1,
-0.004180844, 0.6762355, -0.3087886, 1, 1, 1, 1, 1,
-0.0005602846, -1.193246, -3.384428, 1, 1, 1, 1, 1,
0.00361188, -2.113713, 2.647443, 1, 1, 1, 1, 1,
0.004833116, 0.1944471, -1.745264, 1, 1, 1, 1, 1,
0.005964352, 0.8607442, -0.2718869, 1, 1, 1, 1, 1,
0.007764282, 0.9187905, 0.4553901, 1, 1, 1, 1, 1,
0.0114053, 0.4162294, -1.264369, 1, 1, 1, 1, 1,
0.01840884, -0.4087505, 3.172093, 1, 1, 1, 1, 1,
0.02261144, -0.8949809, 2.65902, 1, 1, 1, 1, 1,
0.02401478, -1.055162, 2.020377, 1, 1, 1, 1, 1,
0.02415395, -0.6876148, 1.536886, 1, 1, 1, 1, 1,
0.02550408, -0.3553239, 2.997334, 0, 0, 1, 1, 1,
0.03079784, -1.274395, 4.091087, 1, 0, 0, 1, 1,
0.03193835, 0.1369771, 0.7284821, 1, 0, 0, 1, 1,
0.03439708, 1.231579, 0.5546071, 1, 0, 0, 1, 1,
0.03847737, -0.8292371, 5.447863, 1, 0, 0, 1, 1,
0.04029579, 0.7722117, -0.05709967, 1, 0, 0, 1, 1,
0.04062446, 1.787502, -1.070183, 0, 0, 0, 1, 1,
0.0425769, -0.6652096, 4.313871, 0, 0, 0, 1, 1,
0.04345303, -0.04322917, 1.338793, 0, 0, 0, 1, 1,
0.04422725, -1.874962, 3.296215, 0, 0, 0, 1, 1,
0.05083385, 0.4708962, 0.5499429, 0, 0, 0, 1, 1,
0.05491664, 1.48649, 0.3357113, 0, 0, 0, 1, 1,
0.06110937, 0.07476638, 1.225973, 0, 0, 0, 1, 1,
0.06387635, -0.2051394, 4.38749, 1, 1, 1, 1, 1,
0.06407106, -1.392717, 2.920994, 1, 1, 1, 1, 1,
0.06897435, 0.3939537, 0.2436169, 1, 1, 1, 1, 1,
0.07247484, -0.03552395, 3.089151, 1, 1, 1, 1, 1,
0.07305922, -0.8159853, 4.4994, 1, 1, 1, 1, 1,
0.07367083, 0.2135282, 0.1823109, 1, 1, 1, 1, 1,
0.07437146, -0.49669, 4.386153, 1, 1, 1, 1, 1,
0.07705701, 1.740052, -0.4264418, 1, 1, 1, 1, 1,
0.08752615, 1.246266, -0.7789565, 1, 1, 1, 1, 1,
0.0886181, 0.06623195, 2.981555, 1, 1, 1, 1, 1,
0.09348037, -0.9200013, 4.001014, 1, 1, 1, 1, 1,
0.09550485, -1.22382, 2.106654, 1, 1, 1, 1, 1,
0.09728523, 1.240883, -0.6905674, 1, 1, 1, 1, 1,
0.1040398, 0.02584982, 2.926338, 1, 1, 1, 1, 1,
0.1051277, -0.6018044, 3.821301, 1, 1, 1, 1, 1,
0.1154276, 0.972924, -1.009213, 0, 0, 1, 1, 1,
0.1216055, -0.6522831, 2.526143, 1, 0, 0, 1, 1,
0.1252585, 1.22016, 0.8058591, 1, 0, 0, 1, 1,
0.128818, 3.216137, 0.07480298, 1, 0, 0, 1, 1,
0.1322577, -0.687768, 2.509366, 1, 0, 0, 1, 1,
0.1323087, -0.3083819, 4.026822, 1, 0, 0, 1, 1,
0.1330818, -0.7925127, 3.40449, 0, 0, 0, 1, 1,
0.1344439, -1.860945, 3.094571, 0, 0, 0, 1, 1,
0.1360561, 1.491923, 0.08821125, 0, 0, 0, 1, 1,
0.1413161, -1.055821, 3.245317, 0, 0, 0, 1, 1,
0.1438809, 0.08488235, 1.677204, 0, 0, 0, 1, 1,
0.1445584, -1.07429, 3.041227, 0, 0, 0, 1, 1,
0.1451588, -0.5927678, 2.593731, 0, 0, 0, 1, 1,
0.1472849, -0.01395878, 2.959401, 1, 1, 1, 1, 1,
0.1492643, 1.608518, 1.073358, 1, 1, 1, 1, 1,
0.1523953, 1.181458, 0.5138617, 1, 1, 1, 1, 1,
0.1529551, 0.5924118, -1.325628, 1, 1, 1, 1, 1,
0.1559424, 0.2700261, 2.057966, 1, 1, 1, 1, 1,
0.1566387, 1.544832, 0.5821146, 1, 1, 1, 1, 1,
0.1589992, 0.5660743, 0.9629424, 1, 1, 1, 1, 1,
0.1692134, 0.6837981, 0.03229443, 1, 1, 1, 1, 1,
0.1693238, -1.543797, 3.212606, 1, 1, 1, 1, 1,
0.1734106, -0.5002074, 1.93424, 1, 1, 1, 1, 1,
0.1753004, 0.7263787, 0.05799858, 1, 1, 1, 1, 1,
0.1776928, 0.8203521, 2.021641, 1, 1, 1, 1, 1,
0.1809101, 0.5914181, -1.685692, 1, 1, 1, 1, 1,
0.1832425, 0.06249046, 2.017639, 1, 1, 1, 1, 1,
0.185527, 0.0599117, 0.6091728, 1, 1, 1, 1, 1,
0.1878034, -0.6578993, 3.021265, 0, 0, 1, 1, 1,
0.1882356, -1.247067, 4.330647, 1, 0, 0, 1, 1,
0.1882536, -1.135701, 2.22155, 1, 0, 0, 1, 1,
0.1883169, -0.7574706, 3.412367, 1, 0, 0, 1, 1,
0.1890127, 0.6393093, 0.0362913, 1, 0, 0, 1, 1,
0.1890875, 1.11899, 0.8652281, 1, 0, 0, 1, 1,
0.1914358, 1.213561, 0.6512538, 0, 0, 0, 1, 1,
0.1989014, 0.345019, -0.3987242, 0, 0, 0, 1, 1,
0.1991153, 2.609572, -0.5447873, 0, 0, 0, 1, 1,
0.2029881, 0.5478682, 1.683444, 0, 0, 0, 1, 1,
0.2180653, 0.2104897, 0.1960377, 0, 0, 0, 1, 1,
0.2191346, -1.23546, 2.956476, 0, 0, 0, 1, 1,
0.2204479, -0.05412435, 1.590517, 0, 0, 0, 1, 1,
0.2213819, 0.9663823, -0.2672158, 1, 1, 1, 1, 1,
0.2300534, -0.3438733, 2.152375, 1, 1, 1, 1, 1,
0.2375723, 0.7543145, 1.840918, 1, 1, 1, 1, 1,
0.2391321, 0.6081335, -0.5558788, 1, 1, 1, 1, 1,
0.2431106, -0.3837509, 2.596005, 1, 1, 1, 1, 1,
0.2490323, 0.2904691, -0.1677337, 1, 1, 1, 1, 1,
0.2503294, 0.1073361, 2.030336, 1, 1, 1, 1, 1,
0.2515941, 0.3973556, 0.3636444, 1, 1, 1, 1, 1,
0.2553411, -0.6078187, 3.170678, 1, 1, 1, 1, 1,
0.2628595, -0.4321553, 3.032765, 1, 1, 1, 1, 1,
0.2642057, 1.203699, -0.6655079, 1, 1, 1, 1, 1,
0.2652148, 0.9355192, 1.480926, 1, 1, 1, 1, 1,
0.2664445, -0.2502886, 2.832535, 1, 1, 1, 1, 1,
0.2672939, -0.5453677, 4.565022, 1, 1, 1, 1, 1,
0.2713791, -0.0104487, 1.021381, 1, 1, 1, 1, 1,
0.2718836, 0.7363039, -0.7478424, 0, 0, 1, 1, 1,
0.2723314, 0.6431497, 0.1158456, 1, 0, 0, 1, 1,
0.2796775, -0.1857655, 2.481805, 1, 0, 0, 1, 1,
0.2859482, -0.2421159, 1.265103, 1, 0, 0, 1, 1,
0.2862753, 2.273047, -1.66074, 1, 0, 0, 1, 1,
0.292373, -0.6591626, 2.104925, 1, 0, 0, 1, 1,
0.2931584, -1.037168, 2.433456, 0, 0, 0, 1, 1,
0.2975821, 0.05106402, 4.026793, 0, 0, 0, 1, 1,
0.2990138, -0.8254634, 5.017981, 0, 0, 0, 1, 1,
0.3013932, 1.057771, 0.5205998, 0, 0, 0, 1, 1,
0.303957, -0.4256555, 2.684656, 0, 0, 0, 1, 1,
0.303997, 0.2680914, 1.255263, 0, 0, 0, 1, 1,
0.3073406, -0.4504917, 3.529817, 0, 0, 0, 1, 1,
0.3089056, 0.2026814, 0.4466278, 1, 1, 1, 1, 1,
0.3095838, 0.230202, 1.810012, 1, 1, 1, 1, 1,
0.3115597, 0.09509762, 1.184375, 1, 1, 1, 1, 1,
0.3128299, -0.5580626, 3.868453, 1, 1, 1, 1, 1,
0.3179496, -0.7634891, 2.496064, 1, 1, 1, 1, 1,
0.3204032, -1.734788, 2.873575, 1, 1, 1, 1, 1,
0.3264993, 1.280674, 2.448016, 1, 1, 1, 1, 1,
0.3282797, 0.4921841, 1.276299, 1, 1, 1, 1, 1,
0.3294015, -0.4861945, 2.176507, 1, 1, 1, 1, 1,
0.3388958, -0.03885627, 1.01119, 1, 1, 1, 1, 1,
0.341527, -0.6013631, 2.11045, 1, 1, 1, 1, 1,
0.3415494, 0.7793796, 0.7622905, 1, 1, 1, 1, 1,
0.341598, -1.130154, -0.1725134, 1, 1, 1, 1, 1,
0.3453874, -0.08085483, 2.521119, 1, 1, 1, 1, 1,
0.3468682, -0.06901906, 0.9620885, 1, 1, 1, 1, 1,
0.3481114, -0.949822, 4.19589, 0, 0, 1, 1, 1,
0.348489, -0.6966946, 2.830528, 1, 0, 0, 1, 1,
0.3505186, -1.62788, 2.467545, 1, 0, 0, 1, 1,
0.351183, 0.3110215, 1.72327, 1, 0, 0, 1, 1,
0.3522191, 2.204095, 0.547485, 1, 0, 0, 1, 1,
0.3542236, 0.534838, -0.6550198, 1, 0, 0, 1, 1,
0.3542739, -0.3094093, 1.439879, 0, 0, 0, 1, 1,
0.3576978, 0.5679604, 0.01335009, 0, 0, 0, 1, 1,
0.3624764, -0.4940071, 1.878304, 0, 0, 0, 1, 1,
0.3683605, 1.830264, 0.5253658, 0, 0, 0, 1, 1,
0.369562, -1.829113, 3.677606, 0, 0, 0, 1, 1,
0.3712722, -0.1851904, 1.5962, 0, 0, 0, 1, 1,
0.3717878, 0.374992, 1.271736, 0, 0, 0, 1, 1,
0.3722567, 1.897295, -0.5850953, 1, 1, 1, 1, 1,
0.3783246, 0.0130003, 1.293447, 1, 1, 1, 1, 1,
0.3788024, -1.705968, 3.674915, 1, 1, 1, 1, 1,
0.3793856, 0.5436472, 0.91088, 1, 1, 1, 1, 1,
0.3848001, 0.6541232, 1.725852, 1, 1, 1, 1, 1,
0.3849372, 0.2048191, 1.549925, 1, 1, 1, 1, 1,
0.3857522, 2.80077, -0.6834785, 1, 1, 1, 1, 1,
0.3872676, -0.3909445, 2.956779, 1, 1, 1, 1, 1,
0.3917799, 0.4372478, 1.211571, 1, 1, 1, 1, 1,
0.3918135, 0.93031, 0.5671415, 1, 1, 1, 1, 1,
0.4059436, -1.520659, 2.708097, 1, 1, 1, 1, 1,
0.4091772, -0.5673986, 2.363072, 1, 1, 1, 1, 1,
0.4100102, 0.7616716, -0.8047279, 1, 1, 1, 1, 1,
0.4125187, 1.062213, -0.08095666, 1, 1, 1, 1, 1,
0.4128179, -0.5835907, 3.248656, 1, 1, 1, 1, 1,
0.4222895, -0.3516938, 1.457159, 0, 0, 1, 1, 1,
0.4272094, 0.02780828, 2.059958, 1, 0, 0, 1, 1,
0.427222, 0.4671729, 0.8285481, 1, 0, 0, 1, 1,
0.4324027, 1.910534, -0.8945044, 1, 0, 0, 1, 1,
0.4385966, 0.1811403, 0.506762, 1, 0, 0, 1, 1,
0.4388299, 0.8313679, 1.508407, 1, 0, 0, 1, 1,
0.440341, -0.6776704, 2.126681, 0, 0, 0, 1, 1,
0.4424679, 0.3654035, 0.5375003, 0, 0, 0, 1, 1,
0.4429216, 0.6199401, 2.021888, 0, 0, 0, 1, 1,
0.4522338, 0.2163924, -0.9788964, 0, 0, 0, 1, 1,
0.4525129, 1.165346, -0.5387197, 0, 0, 0, 1, 1,
0.4650003, 0.6313913, 1.358039, 0, 0, 0, 1, 1,
0.4695047, -1.61744, 3.132358, 0, 0, 0, 1, 1,
0.4697408, -1.258061, 0.956589, 1, 1, 1, 1, 1,
0.4706602, 0.5235308, 0.4743881, 1, 1, 1, 1, 1,
0.4728727, 0.750606, -1.088345, 1, 1, 1, 1, 1,
0.4742455, 0.03519818, 2.823739, 1, 1, 1, 1, 1,
0.4770434, -0.495718, 1.086636, 1, 1, 1, 1, 1,
0.4834991, -0.1394179, 2.621322, 1, 1, 1, 1, 1,
0.487818, -0.4215497, 2.047348, 1, 1, 1, 1, 1,
0.4883996, -2.381472, 4.440086, 1, 1, 1, 1, 1,
0.492301, -1.05681, 3.333221, 1, 1, 1, 1, 1,
0.5070545, 0.2143119, 0.2252091, 1, 1, 1, 1, 1,
0.508655, 0.1153307, 2.601846, 1, 1, 1, 1, 1,
0.5148112, -1.213912, 2.368539, 1, 1, 1, 1, 1,
0.5149222, 1.809863, -0.1817736, 1, 1, 1, 1, 1,
0.516065, -0.9785905, 4.230951, 1, 1, 1, 1, 1,
0.5191033, 0.465907, 0.1676707, 1, 1, 1, 1, 1,
0.5298994, -1.228769, 1.822308, 0, 0, 1, 1, 1,
0.5301841, 0.2263267, 0.851841, 1, 0, 0, 1, 1,
0.5337636, -0.430624, 2.366596, 1, 0, 0, 1, 1,
0.5402601, -0.7384578, 4.22705, 1, 0, 0, 1, 1,
0.5425229, -0.655558, 0.7840368, 1, 0, 0, 1, 1,
0.5438271, -1.045976, 2.219282, 1, 0, 0, 1, 1,
0.5442455, -1.349277, 2.512951, 0, 0, 0, 1, 1,
0.5464286, -0.008028679, 0.4725602, 0, 0, 0, 1, 1,
0.5467175, -1.810402, 4.435926, 0, 0, 0, 1, 1,
0.5476399, -0.3241081, 2.559978, 0, 0, 0, 1, 1,
0.5507178, 0.5487222, 0.3979699, 0, 0, 0, 1, 1,
0.5508768, 0.9314376, 0.8962954, 0, 0, 0, 1, 1,
0.5619694, -0.09177037, 1.318362, 0, 0, 0, 1, 1,
0.5692047, -0.0549632, 1.434494, 1, 1, 1, 1, 1,
0.5721858, 1.082579, 0.8281282, 1, 1, 1, 1, 1,
0.5729237, 0.2294024, 2.938485, 1, 1, 1, 1, 1,
0.5814273, 1.29985, 0.6874018, 1, 1, 1, 1, 1,
0.5834883, -0.4974272, 3.029415, 1, 1, 1, 1, 1,
0.5857658, 1.756734, 0.5305921, 1, 1, 1, 1, 1,
0.5888285, -1.460201, 2.349526, 1, 1, 1, 1, 1,
0.5894299, 1.053104, -0.09148713, 1, 1, 1, 1, 1,
0.5913969, -0.4628947, 1.695328, 1, 1, 1, 1, 1,
0.5942715, 0.373141, 1.523033, 1, 1, 1, 1, 1,
0.5965642, -1.153844, 4.756455, 1, 1, 1, 1, 1,
0.5984315, -0.2218649, 1.862014, 1, 1, 1, 1, 1,
0.6001045, 0.3366704, 1.899808, 1, 1, 1, 1, 1,
0.6025301, -0.5736555, 0.03156513, 1, 1, 1, 1, 1,
0.6038751, -1.227109, -0.3117094, 1, 1, 1, 1, 1,
0.606113, 0.6567676, 0.0652092, 0, 0, 1, 1, 1,
0.6107448, -0.614709, 1.992396, 1, 0, 0, 1, 1,
0.6110692, 0.2998885, 2.23593, 1, 0, 0, 1, 1,
0.6116093, 0.5990219, 0.9399665, 1, 0, 0, 1, 1,
0.6126305, 0.5281076, 0.5730905, 1, 0, 0, 1, 1,
0.6163724, 0.9998768, -0.07969235, 1, 0, 0, 1, 1,
0.6170177, 0.4136027, 2.287807, 0, 0, 0, 1, 1,
0.6222265, 1.966926, 0.9746015, 0, 0, 0, 1, 1,
0.6265854, 0.2044494, 0.9841563, 0, 0, 0, 1, 1,
0.633059, 0.7377489, 1.059627, 0, 0, 0, 1, 1,
0.6331265, -0.255087, 1.362148, 0, 0, 0, 1, 1,
0.6341469, 0.9422768, 0.5464552, 0, 0, 0, 1, 1,
0.6346019, -0.5413375, 2.952047, 0, 0, 0, 1, 1,
0.6357218, -1.135844, 2.613961, 1, 1, 1, 1, 1,
0.638519, 0.9387736, 2.326008, 1, 1, 1, 1, 1,
0.6432239, 1.379526, 0.7921677, 1, 1, 1, 1, 1,
0.644411, 0.6449257, 1.721087, 1, 1, 1, 1, 1,
0.6445938, -1.830167, 3.383029, 1, 1, 1, 1, 1,
0.6460255, 0.97829, -0.4706492, 1, 1, 1, 1, 1,
0.6460873, 2.018742, 0.2914633, 1, 1, 1, 1, 1,
0.6479671, 1.346768, 0.5930988, 1, 1, 1, 1, 1,
0.6500667, -0.9975505, 1.460752, 1, 1, 1, 1, 1,
0.6519936, -0.9693728, 2.758752, 1, 1, 1, 1, 1,
0.6577789, -1.105345, 2.420441, 1, 1, 1, 1, 1,
0.6585262, -0.1882939, 2.843246, 1, 1, 1, 1, 1,
0.6627052, -0.4634742, 2.172904, 1, 1, 1, 1, 1,
0.6627576, -2.882061, 2.730983, 1, 1, 1, 1, 1,
0.6679074, -0.3820815, 2.841181, 1, 1, 1, 1, 1,
0.6681321, -0.6556593, 3.483687, 0, 0, 1, 1, 1,
0.6724367, 0.7989806, 1.276457, 1, 0, 0, 1, 1,
0.6808202, 1.145222, -0.8534467, 1, 0, 0, 1, 1,
0.6849791, -1.392007, 3.479856, 1, 0, 0, 1, 1,
0.685629, 0.1818275, 2.061952, 1, 0, 0, 1, 1,
0.6946157, -0.6555702, 2.063406, 1, 0, 0, 1, 1,
0.6969257, -0.1885946, 2.60251, 0, 0, 0, 1, 1,
0.698631, 1.39034, 0.6253029, 0, 0, 0, 1, 1,
0.6991534, -0.9990543, 3.437797, 0, 0, 0, 1, 1,
0.6994197, -0.4244401, 3.08138, 0, 0, 0, 1, 1,
0.700642, 0.4147128, 2.263102, 0, 0, 0, 1, 1,
0.7013974, 0.784817, 0.2522967, 0, 0, 0, 1, 1,
0.7115347, 0.5774885, 1.010077, 0, 0, 0, 1, 1,
0.7125229, 0.2497783, 1.6879, 1, 1, 1, 1, 1,
0.7160649, 1.447059, -1.07824, 1, 1, 1, 1, 1,
0.7160747, 0.952272, -0.6126248, 1, 1, 1, 1, 1,
0.7163153, -0.2008329, 1.033511, 1, 1, 1, 1, 1,
0.7204584, -0.8303505, 3.201598, 1, 1, 1, 1, 1,
0.7212761, 1.533692, -0.4734561, 1, 1, 1, 1, 1,
0.7330706, 0.9627875, 1.310356, 1, 1, 1, 1, 1,
0.7417749, 0.1498019, 2.059144, 1, 1, 1, 1, 1,
0.7496455, 0.8963468, 2.908461, 1, 1, 1, 1, 1,
0.7553523, -0.6455349, 1.075499, 1, 1, 1, 1, 1,
0.7616764, -0.9354819, 1.921464, 1, 1, 1, 1, 1,
0.764922, 0.8298585, 0.8435689, 1, 1, 1, 1, 1,
0.7651545, -0.1410611, 0.9606234, 1, 1, 1, 1, 1,
0.7659065, 1.184328, 1.643663, 1, 1, 1, 1, 1,
0.7669952, 0.2114313, 1.767918, 1, 1, 1, 1, 1,
0.7745622, -1.352471, 3.284486, 0, 0, 1, 1, 1,
0.776232, 0.2675486, 1.089254, 1, 0, 0, 1, 1,
0.790412, 0.2619188, 1.661264, 1, 0, 0, 1, 1,
0.795027, -0.9528628, 4.327397, 1, 0, 0, 1, 1,
0.8005927, -0.7758775, 2.050988, 1, 0, 0, 1, 1,
0.8058937, 0.8713128, 1.039043, 1, 0, 0, 1, 1,
0.8125094, -0.02561555, 0.9398866, 0, 0, 0, 1, 1,
0.8197016, 0.2670201, 1.821997, 0, 0, 0, 1, 1,
0.8215363, -0.5481482, 3.056468, 0, 0, 0, 1, 1,
0.822326, -0.003235503, 1.06598, 0, 0, 0, 1, 1,
0.8235633, -0.4840449, 1.367883, 0, 0, 0, 1, 1,
0.8273531, -0.642731, 3.533197, 0, 0, 0, 1, 1,
0.8297798, 1.085342, 1.517407, 0, 0, 0, 1, 1,
0.8320946, -0.8927639, 1.674822, 1, 1, 1, 1, 1,
0.8337587, 0.877184, 0.5944378, 1, 1, 1, 1, 1,
0.8343123, -0.3892058, 2.992675, 1, 1, 1, 1, 1,
0.8347739, 2.065516, -1.147533, 1, 1, 1, 1, 1,
0.8401825, 0.8501502, 0.9988131, 1, 1, 1, 1, 1,
0.8421869, 0.02476408, 2.987359, 1, 1, 1, 1, 1,
0.8447888, -0.5289472, 1.120607, 1, 1, 1, 1, 1,
0.8486572, -0.7248197, 2.274994, 1, 1, 1, 1, 1,
0.8517318, -0.1415266, 3.14143, 1, 1, 1, 1, 1,
0.8574554, 0.2470453, 0.9124309, 1, 1, 1, 1, 1,
0.8583419, -1.267673, 3.76735, 1, 1, 1, 1, 1,
0.8650575, 1.159069, 0.9830664, 1, 1, 1, 1, 1,
0.8686168, -0.2440566, 1.645962, 1, 1, 1, 1, 1,
0.8703563, 0.2917288, 0.4043992, 1, 1, 1, 1, 1,
0.8707271, -1.403882, 3.992955, 1, 1, 1, 1, 1,
0.8725382, -0.02856311, 1.971346, 0, 0, 1, 1, 1,
0.8761795, -1.543896, 4.076491, 1, 0, 0, 1, 1,
0.8763101, -1.35321, 3.93163, 1, 0, 0, 1, 1,
0.8857667, -0.179823, 3.02042, 1, 0, 0, 1, 1,
0.8862792, 0.3174448, 1.69254, 1, 0, 0, 1, 1,
0.8989028, 0.3524975, 0.6388535, 1, 0, 0, 1, 1,
0.9061214, 0.4055687, 1.05829, 0, 0, 0, 1, 1,
0.9065481, 0.342762, 0.9209331, 0, 0, 0, 1, 1,
0.9075032, -1.407351, 1.833253, 0, 0, 0, 1, 1,
0.9090735, 1.000899, 2.694814, 0, 0, 0, 1, 1,
0.9094556, -0.09253471, 0.7455032, 0, 0, 0, 1, 1,
0.9101444, 0.117164, 1.552718, 0, 0, 0, 1, 1,
0.9106047, -1.885601, 2.550926, 0, 0, 0, 1, 1,
0.9117265, -2.016768, 3.392143, 1, 1, 1, 1, 1,
0.9135591, -0.1400771, 1.834174, 1, 1, 1, 1, 1,
0.9145777, 0.7702412, 2.103598, 1, 1, 1, 1, 1,
0.9207045, -1.535566, 2.32682, 1, 1, 1, 1, 1,
0.9230753, 0.4464744, -0.1235987, 1, 1, 1, 1, 1,
0.927502, 0.374667, 0.5993671, 1, 1, 1, 1, 1,
0.9372695, 0.698741, -0.6549284, 1, 1, 1, 1, 1,
0.9394012, 2.62545, 2.691167, 1, 1, 1, 1, 1,
0.9404036, -0.8269113, 1.623425, 1, 1, 1, 1, 1,
0.9449857, 0.4968738, 1.982998, 1, 1, 1, 1, 1,
0.953292, -0.09215641, 2.603741, 1, 1, 1, 1, 1,
0.9607211, -1.539343, 2.697366, 1, 1, 1, 1, 1,
0.9616166, 0.6146793, 0.8845987, 1, 1, 1, 1, 1,
0.9637339, 0.4115804, 1.234314, 1, 1, 1, 1, 1,
0.9652292, -0.7092513, 3.194984, 1, 1, 1, 1, 1,
0.9667525, -1.93006, 3.302582, 0, 0, 1, 1, 1,
0.9812018, 0.2569207, 0.6192889, 1, 0, 0, 1, 1,
0.9820876, 1.544577, 0.278425, 1, 0, 0, 1, 1,
0.982133, -0.505629, 1.718385, 1, 0, 0, 1, 1,
0.9823726, -1.411028, 1.65142, 1, 0, 0, 1, 1,
0.9844825, -1.988832, 3.321109, 1, 0, 0, 1, 1,
0.9846398, -0.1827692, 1.167379, 0, 0, 0, 1, 1,
0.9922693, -1.734999, 3.378903, 0, 0, 0, 1, 1,
0.9938675, -0.318868, 1.183677, 0, 0, 0, 1, 1,
0.9962611, 0.7219198, 0.6789654, 0, 0, 0, 1, 1,
0.9973047, -0.8437811, 0.1779428, 0, 0, 0, 1, 1,
0.9991551, 1.036888, 0.04612695, 0, 0, 0, 1, 1,
1.004597, 1.175891, 1.445916, 0, 0, 0, 1, 1,
1.010437, 0.1453661, 1.849253, 1, 1, 1, 1, 1,
1.012159, 1.703235, 1.278193, 1, 1, 1, 1, 1,
1.012847, 0.9884602, 0.9654607, 1, 1, 1, 1, 1,
1.014466, -0.3248826, 2.850482, 1, 1, 1, 1, 1,
1.018059, 0.7651168, -0.06858572, 1, 1, 1, 1, 1,
1.020347, -0.6958353, 4.361462, 1, 1, 1, 1, 1,
1.0207, 1.851955, 2.052863, 1, 1, 1, 1, 1,
1.034161, 0.05910107, 3.068222, 1, 1, 1, 1, 1,
1.046429, -0.5801809, 0.6902835, 1, 1, 1, 1, 1,
1.047298, 1.500747, 0.795245, 1, 1, 1, 1, 1,
1.048666, -0.6794477, 2.081627, 1, 1, 1, 1, 1,
1.05215, 0.6812762, 1.358123, 1, 1, 1, 1, 1,
1.052181, 0.3754838, -0.2126403, 1, 1, 1, 1, 1,
1.054072, 1.658342, 0.2474934, 1, 1, 1, 1, 1,
1.060369, -0.4915173, 2.927067, 1, 1, 1, 1, 1,
1.060954, -0.8912028, 4.914018, 0, 0, 1, 1, 1,
1.061931, 0.2516911, 3.134503, 1, 0, 0, 1, 1,
1.062579, 0.5233752, 0.7605743, 1, 0, 0, 1, 1,
1.064835, 0.579089, 0.3952027, 1, 0, 0, 1, 1,
1.067309, 0.6000149, -0.05427929, 1, 0, 0, 1, 1,
1.068966, -1.197405, 2.308725, 1, 0, 0, 1, 1,
1.06948, 1.229329, 1.75856, 0, 0, 0, 1, 1,
1.074808, -0.3682539, 3.131091, 0, 0, 0, 1, 1,
1.079535, 1.204043, 1.512197, 0, 0, 0, 1, 1,
1.082597, 2.257528, -1.078956, 0, 0, 0, 1, 1,
1.087313, 1.647915, 0.7186552, 0, 0, 0, 1, 1,
1.093149, -0.4777401, 0.8299509, 0, 0, 0, 1, 1,
1.093619, -0.7863851, 1.945302, 0, 0, 0, 1, 1,
1.093626, 0.6492433, 1.29995, 1, 1, 1, 1, 1,
1.096425, -1.410541, 1.873481, 1, 1, 1, 1, 1,
1.096486, 0.1423554, 0.4758931, 1, 1, 1, 1, 1,
1.10173, -0.5657967, 0.6836964, 1, 1, 1, 1, 1,
1.10227, -0.8100023, 3.26072, 1, 1, 1, 1, 1,
1.106192, 0.04290742, 3.00087, 1, 1, 1, 1, 1,
1.108328, -0.2001212, -1.424511, 1, 1, 1, 1, 1,
1.126511, 1.425078, 1.449299, 1, 1, 1, 1, 1,
1.127069, -0.1042513, -0.1722647, 1, 1, 1, 1, 1,
1.135529, 1.543637, -0.004635092, 1, 1, 1, 1, 1,
1.135799, 0.7069736, 1.848088, 1, 1, 1, 1, 1,
1.148941, -0.8781206, 0.1930612, 1, 1, 1, 1, 1,
1.151019, -0.4561271, 2.722621, 1, 1, 1, 1, 1,
1.153889, 0.4261854, 1.996753, 1, 1, 1, 1, 1,
1.165371, 0.3301049, 1.730489, 1, 1, 1, 1, 1,
1.169069, 1.239437, -0.7914455, 0, 0, 1, 1, 1,
1.169104, 0.1869351, 1.977319, 1, 0, 0, 1, 1,
1.185031, -0.2862245, 1.740892, 1, 0, 0, 1, 1,
1.195068, 0.8842571, 2.433273, 1, 0, 0, 1, 1,
1.199858, -1.47502, 1.763742, 1, 0, 0, 1, 1,
1.206057, 0.515496, 0.7221135, 1, 0, 0, 1, 1,
1.206215, -0.7882614, 2.108069, 0, 0, 0, 1, 1,
1.212172, 1.971009, 1.545273, 0, 0, 0, 1, 1,
1.220257, -1.027657, 1.098883, 0, 0, 0, 1, 1,
1.226411, 0.04103479, 0.9189153, 0, 0, 0, 1, 1,
1.226879, -0.298534, 1.290589, 0, 0, 0, 1, 1,
1.229284, 0.1186664, 0.3674854, 0, 0, 0, 1, 1,
1.230772, -0.8736048, 1.66569, 0, 0, 0, 1, 1,
1.247073, -0.362075, 1.223241, 1, 1, 1, 1, 1,
1.255458, 0.9241257, 0.3259102, 1, 1, 1, 1, 1,
1.25823, -0.2731425, 2.602446, 1, 1, 1, 1, 1,
1.258627, 3.567275, -1.181224, 1, 1, 1, 1, 1,
1.258932, 0.07581025, 1.995429, 1, 1, 1, 1, 1,
1.26865, -0.3652551, 1.35303, 1, 1, 1, 1, 1,
1.269234, 0.04719978, 1.673383, 1, 1, 1, 1, 1,
1.269701, -0.3479029, 1.144039, 1, 1, 1, 1, 1,
1.274775, -1.111787, 2.190296, 1, 1, 1, 1, 1,
1.277824, -0.1226279, 1.355036, 1, 1, 1, 1, 1,
1.2785, 0.6759758, 1.877452, 1, 1, 1, 1, 1,
1.284373, -0.6059196, 2.650584, 1, 1, 1, 1, 1,
1.285611, 0.09678112, 1.177326, 1, 1, 1, 1, 1,
1.298501, -2.50536, 2.887327, 1, 1, 1, 1, 1,
1.300989, 1.930896, -0.02358083, 1, 1, 1, 1, 1,
1.304584, 0.1663681, -0.4051096, 0, 0, 1, 1, 1,
1.321406, 0.8459919, -0.1465199, 1, 0, 0, 1, 1,
1.329614, 0.03137911, 1.300045, 1, 0, 0, 1, 1,
1.333034, 1.076579, 1.720861, 1, 0, 0, 1, 1,
1.338388, -1.889215, 3.136425, 1, 0, 0, 1, 1,
1.340697, 0.1127282, 1.064214, 1, 0, 0, 1, 1,
1.342504, -0.8236554, 0.0183164, 0, 0, 0, 1, 1,
1.343482, -0.2335178, 2.223037, 0, 0, 0, 1, 1,
1.34401, -0.5804281, 0.38575, 0, 0, 0, 1, 1,
1.346368, -1.001451, 2.150113, 0, 0, 0, 1, 1,
1.346412, -0.5245713, 3.529631, 0, 0, 0, 1, 1,
1.348767, 0.7644013, 1.351014, 0, 0, 0, 1, 1,
1.350673, -1.464769, 2.317168, 0, 0, 0, 1, 1,
1.354123, -1.75715, 1.660369, 1, 1, 1, 1, 1,
1.358333, -0.9607928, 1.675168, 1, 1, 1, 1, 1,
1.374385, 1.638939, 0.2999334, 1, 1, 1, 1, 1,
1.37481, 0.5720278, -0.09950344, 1, 1, 1, 1, 1,
1.378188, 0.6656097, 1.068253, 1, 1, 1, 1, 1,
1.382221, -0.352199, 2.221949, 1, 1, 1, 1, 1,
1.387999, -0.4711782, 2.008353, 1, 1, 1, 1, 1,
1.411241, -0.8191334, 1.440288, 1, 1, 1, 1, 1,
1.421198, -1.867188, 2.303797, 1, 1, 1, 1, 1,
1.422005, 0.4105735, 3.196465, 1, 1, 1, 1, 1,
1.425562, -1.310002, 3.486991, 1, 1, 1, 1, 1,
1.43227, -0.5289471, 0.08871526, 1, 1, 1, 1, 1,
1.450477, 0.3010468, 2.439029, 1, 1, 1, 1, 1,
1.451278, -1.788606, 1.174865, 1, 1, 1, 1, 1,
1.452, -0.2320005, 1.16801, 1, 1, 1, 1, 1,
1.458955, -1.661005, 0.4655539, 0, 0, 1, 1, 1,
1.46175, 0.7532697, 0.5370815, 1, 0, 0, 1, 1,
1.46841, 0.6372324, 1.415761, 1, 0, 0, 1, 1,
1.469936, -0.05704031, 0.7795653, 1, 0, 0, 1, 1,
1.475849, -0.9125562, 3.378702, 1, 0, 0, 1, 1,
1.485098, 0.2145603, 0.8234894, 1, 0, 0, 1, 1,
1.489255, -0.2752667, 2.603071, 0, 0, 0, 1, 1,
1.491865, -1.000528, 1.20262, 0, 0, 0, 1, 1,
1.502094, 0.7241182, -0.8148474, 0, 0, 0, 1, 1,
1.511598, -0.7804503, 1.007237, 0, 0, 0, 1, 1,
1.527198, -0.3526837, 1.819586, 0, 0, 0, 1, 1,
1.528632, 0.2632588, -0.3372246, 0, 0, 0, 1, 1,
1.530884, 1.942184, 0.8659006, 0, 0, 0, 1, 1,
1.541675, 0.8957038, -0.3749604, 1, 1, 1, 1, 1,
1.543491, 0.490322, 0.9324149, 1, 1, 1, 1, 1,
1.545089, 1.833288, 0.02815073, 1, 1, 1, 1, 1,
1.55421, -0.1245984, 2.71467, 1, 1, 1, 1, 1,
1.572363, 0.3611518, -0.5107582, 1, 1, 1, 1, 1,
1.587636, -1.666399, 3.683296, 1, 1, 1, 1, 1,
1.607126, 1.066385, 2.479823, 1, 1, 1, 1, 1,
1.608506, 1.460273, 0.5592098, 1, 1, 1, 1, 1,
1.620735, -0.1053817, 3.30872, 1, 1, 1, 1, 1,
1.620846, 0.879799, 1.294111, 1, 1, 1, 1, 1,
1.620952, -1.109536, 1.765245, 1, 1, 1, 1, 1,
1.628415, -1.514832, 0.8293288, 1, 1, 1, 1, 1,
1.629544, 0.8089157, 0.04687675, 1, 1, 1, 1, 1,
1.632189, 0.3868727, 0.3028587, 1, 1, 1, 1, 1,
1.653041, -1.172394, 1.273006, 1, 1, 1, 1, 1,
1.663116, 1.768098, 1.571536, 0, 0, 1, 1, 1,
1.668147, -0.5547149, 2.071911, 1, 0, 0, 1, 1,
1.674245, -0.3134957, 3.362668, 1, 0, 0, 1, 1,
1.676177, -0.3374855, 2.707138, 1, 0, 0, 1, 1,
1.692089, 1.770826, 0.2612219, 1, 0, 0, 1, 1,
1.701515, 0.1095325, 2.14453, 1, 0, 0, 1, 1,
1.714427, -0.9080151, 2.514513, 0, 0, 0, 1, 1,
1.726402, 0.4078507, 2.21918, 0, 0, 0, 1, 1,
1.729044, 0.5037184, 2.285029, 0, 0, 0, 1, 1,
1.734492, 0.07621326, 2.118541, 0, 0, 0, 1, 1,
1.766469, -0.1829201, 2.068583, 0, 0, 0, 1, 1,
1.785453, -0.9564135, 2.044095, 0, 0, 0, 1, 1,
1.798861, 1.533573, 0.159973, 0, 0, 0, 1, 1,
1.809019, -1.75345, 2.40235, 1, 1, 1, 1, 1,
1.814235, -0.8479637, 3.022088, 1, 1, 1, 1, 1,
1.817432, 0.2758696, 1.020877, 1, 1, 1, 1, 1,
1.8324, 0.5543789, 1.13823, 1, 1, 1, 1, 1,
1.832734, 0.9770758, -0.1139532, 1, 1, 1, 1, 1,
1.833877, -1.016284, 1.662975, 1, 1, 1, 1, 1,
1.844519, -0.08492826, 0.01461144, 1, 1, 1, 1, 1,
1.852303, -0.09180864, 1.997232, 1, 1, 1, 1, 1,
1.867649, -0.3334681, 2.049785, 1, 1, 1, 1, 1,
1.904104, -1.901552, 1.200371, 1, 1, 1, 1, 1,
1.916058, -0.6652558, 1.838408, 1, 1, 1, 1, 1,
1.916099, 0.3396748, 1.482765, 1, 1, 1, 1, 1,
1.932371, -0.1512332, 1.027966, 1, 1, 1, 1, 1,
1.936296, -0.7071003, 2.152585, 1, 1, 1, 1, 1,
1.953455, -0.8754012, 2.64976, 1, 1, 1, 1, 1,
1.96738, -0.3473918, 2.128419, 0, 0, 1, 1, 1,
1.972444, 0.5934779, 2.616739, 1, 0, 0, 1, 1,
2.005225, -0.8390168, 2.607407, 1, 0, 0, 1, 1,
2.01372, 0.1983376, 1.750755, 1, 0, 0, 1, 1,
2.029554, 1.060702, 1.87867, 1, 0, 0, 1, 1,
2.034523, -3.093946, 3.222243, 1, 0, 0, 1, 1,
2.075045, -1.524415, 1.748643, 0, 0, 0, 1, 1,
2.096401, -0.6310027, 1.129744, 0, 0, 0, 1, 1,
2.291763, 1.516104, 2.825254, 0, 0, 0, 1, 1,
2.335198, 1.33372, 2.841949, 0, 0, 0, 1, 1,
2.43767, 1.326876, 1.282034, 0, 0, 0, 1, 1,
2.444856, 1.031935, -0.1563775, 0, 0, 0, 1, 1,
2.445426, -0.7689074, 2.205596, 0, 0, 0, 1, 1,
2.595141, 0.3719347, 0.8147171, 1, 1, 1, 1, 1,
2.600767, -1.750436, 2.019102, 1, 1, 1, 1, 1,
2.607877, -0.1351347, -0.09751444, 1, 1, 1, 1, 1,
2.697833, -0.7389662, 1.026269, 1, 1, 1, 1, 1,
2.728191, -3.092286, 3.083859, 1, 1, 1, 1, 1,
2.764363, 0.4187782, 0.3414313, 1, 1, 1, 1, 1,
3.034865, 1.260887, 1.660233, 1, 1, 1, 1, 1
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
var radius = 9.896448;
var distance = 34.76085;
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
mvMatrix.translate( -0.1208938, -0.09616327, 0.3072751 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.76085);
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