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
-3.499993, 0.7581794, -0.942952, 1, 0, 0, 1,
-3.25678, 1.881452, -1.640375, 1, 0.007843138, 0, 1,
-2.668408, 1.09237, -1.606214, 1, 0.01176471, 0, 1,
-2.605694, 0.1704473, -1.785007, 1, 0.01960784, 0, 1,
-2.528364, -0.1042262, -3.274396, 1, 0.02352941, 0, 1,
-2.515198, 0.71112, -0.9878801, 1, 0.03137255, 0, 1,
-2.464555, -0.9305683, -3.108602, 1, 0.03529412, 0, 1,
-2.463619, 1.713229, -1.097749, 1, 0.04313726, 0, 1,
-2.434992, 2.393656, -0.6821873, 1, 0.04705882, 0, 1,
-2.434309, -1.961383, -2.53318, 1, 0.05490196, 0, 1,
-2.430528, -0.02579676, -0.9644294, 1, 0.05882353, 0, 1,
-2.358609, 1.624049, -0.3775834, 1, 0.06666667, 0, 1,
-2.347465, 1.533457, -1.152064, 1, 0.07058824, 0, 1,
-2.329115, 0.09722241, -2.650754, 1, 0.07843138, 0, 1,
-2.295684, 0.3309462, -0.9880652, 1, 0.08235294, 0, 1,
-2.199197, 0.5521888, -0.6294609, 1, 0.09019608, 0, 1,
-2.183871, 1.439618, -0.8008338, 1, 0.09411765, 0, 1,
-2.159052, 0.9334266, -1.339706, 1, 0.1019608, 0, 1,
-2.144783, 0.1380659, -1.258658, 1, 0.1098039, 0, 1,
-2.133566, 1.676925, -0.2290823, 1, 0.1137255, 0, 1,
-2.128372, -0.06868828, -1.610818, 1, 0.1215686, 0, 1,
-2.111544, 0.7815019, 0.6113036, 1, 0.1254902, 0, 1,
-2.020598, 0.03199418, -1.094662, 1, 0.1333333, 0, 1,
-2.010386, -0.4852898, -2.089983, 1, 0.1372549, 0, 1,
-1.956755, -1.061499, -1.628136, 1, 0.145098, 0, 1,
-1.947324, -2.008361, -2.733674, 1, 0.1490196, 0, 1,
-1.927163, -1.650864, -1.717494, 1, 0.1568628, 0, 1,
-1.914066, -0.1573033, -3.130095, 1, 0.1607843, 0, 1,
-1.907436, -0.9442146, -1.823364, 1, 0.1686275, 0, 1,
-1.893708, 1.480952, 0.7649339, 1, 0.172549, 0, 1,
-1.892713, 2.135582, 0.281894, 1, 0.1803922, 0, 1,
-1.883358, -1.735956, -3.962119, 1, 0.1843137, 0, 1,
-1.861063, 1.018899, -0.8502343, 1, 0.1921569, 0, 1,
-1.82763, -1.352927, 0.6319183, 1, 0.1960784, 0, 1,
-1.823048, -0.4515161, -2.711638, 1, 0.2039216, 0, 1,
-1.809353, -1.843885, -1.721927, 1, 0.2117647, 0, 1,
-1.793065, -0.8299372, -1.816133, 1, 0.2156863, 0, 1,
-1.776281, 0.8516096, -1.097244, 1, 0.2235294, 0, 1,
-1.775742, -0.5676659, -1.890136, 1, 0.227451, 0, 1,
-1.754201, 0.7939996, -0.7542101, 1, 0.2352941, 0, 1,
-1.720562, -0.2139618, -1.71602, 1, 0.2392157, 0, 1,
-1.71666, -1.806955, -3.156451, 1, 0.2470588, 0, 1,
-1.702659, 1.5633, 1.783496, 1, 0.2509804, 0, 1,
-1.675325, 0.3598286, -0.637047, 1, 0.2588235, 0, 1,
-1.665234, 0.2731477, -0.6487702, 1, 0.2627451, 0, 1,
-1.658445, -0.7769942, -2.795003, 1, 0.2705882, 0, 1,
-1.649728, -0.9567276, -1.517704, 1, 0.2745098, 0, 1,
-1.643818, -2.386541, -2.199675, 1, 0.282353, 0, 1,
-1.633929, -1.776986, -3.168944, 1, 0.2862745, 0, 1,
-1.633044, 1.956264, 0.7881646, 1, 0.2941177, 0, 1,
-1.629601, -0.3541065, -1.971469, 1, 0.3019608, 0, 1,
-1.629399, -0.8683235, -1.790616, 1, 0.3058824, 0, 1,
-1.62031, 0.1038682, -2.284143, 1, 0.3137255, 0, 1,
-1.615074, -1.174147, -2.771127, 1, 0.3176471, 0, 1,
-1.605915, 1.306232, 0.931748, 1, 0.3254902, 0, 1,
-1.592342, -0.992259, -0.6695203, 1, 0.3294118, 0, 1,
-1.581884, 1.237008, -0.2296321, 1, 0.3372549, 0, 1,
-1.564804, -1.757695, -2.119352, 1, 0.3411765, 0, 1,
-1.560199, 0.8865052, -0.9182537, 1, 0.3490196, 0, 1,
-1.558925, 1.750085, 2.061782, 1, 0.3529412, 0, 1,
-1.558924, 0.7413757, -0.5481005, 1, 0.3607843, 0, 1,
-1.555462, -0.9614444, -1.727409, 1, 0.3647059, 0, 1,
-1.554294, -0.9594826, -2.490377, 1, 0.372549, 0, 1,
-1.546388, 0.4806144, -1.111224, 1, 0.3764706, 0, 1,
-1.54368, -0.4240145, -2.089013, 1, 0.3843137, 0, 1,
-1.526644, 0.3296438, 0.2696552, 1, 0.3882353, 0, 1,
-1.506747, 0.6513607, 0.5773395, 1, 0.3960784, 0, 1,
-1.506243, 1.214041, 0.1761673, 1, 0.4039216, 0, 1,
-1.484151, -0.6811346, -1.955755, 1, 0.4078431, 0, 1,
-1.482587, -0.048921, -0.04859835, 1, 0.4156863, 0, 1,
-1.480637, 1.564794, 1.039671, 1, 0.4196078, 0, 1,
-1.455862, 0.9140248, -0.8679951, 1, 0.427451, 0, 1,
-1.446431, 0.1073305, -1.388818, 1, 0.4313726, 0, 1,
-1.43845, 0.8720108, 0.6785952, 1, 0.4392157, 0, 1,
-1.438358, 0.6198468, -0.6509331, 1, 0.4431373, 0, 1,
-1.437983, 2.020012, -1.289621, 1, 0.4509804, 0, 1,
-1.432623, 0.1630544, -1.513758, 1, 0.454902, 0, 1,
-1.428156, 1.089676, -1.679337, 1, 0.4627451, 0, 1,
-1.417992, 0.2751557, -2.471729, 1, 0.4666667, 0, 1,
-1.417786, -0.3576319, -1.637233, 1, 0.4745098, 0, 1,
-1.396716, -1.865287, -1.800903, 1, 0.4784314, 0, 1,
-1.389044, -0.04921179, -1.265607, 1, 0.4862745, 0, 1,
-1.386307, -0.02190224, -1.109016, 1, 0.4901961, 0, 1,
-1.384313, 0.610888, -1.383637, 1, 0.4980392, 0, 1,
-1.375707, 0.8392605, -0.7125698, 1, 0.5058824, 0, 1,
-1.374594, -0.4316804, -2.153692, 1, 0.509804, 0, 1,
-1.356137, 0.5407329, -1.613076, 1, 0.5176471, 0, 1,
-1.352443, 0.7153908, -0.9279971, 1, 0.5215687, 0, 1,
-1.339334, -1.605508, -2.992062, 1, 0.5294118, 0, 1,
-1.337638, 0.3909466, -2.335302, 1, 0.5333334, 0, 1,
-1.336294, -0.4341603, -2.201937, 1, 0.5411765, 0, 1,
-1.331858, -0.02534886, -1.522907, 1, 0.5450981, 0, 1,
-1.331663, -1.640897, -3.240582, 1, 0.5529412, 0, 1,
-1.327987, 0.3667495, -2.371495, 1, 0.5568628, 0, 1,
-1.322274, -0.4952558, -1.887226, 1, 0.5647059, 0, 1,
-1.320398, -0.5877302, -1.294142, 1, 0.5686275, 0, 1,
-1.300776, -0.1630966, -3.115008, 1, 0.5764706, 0, 1,
-1.299487, -0.6125835, -1.850295, 1, 0.5803922, 0, 1,
-1.298827, -0.6772135, -2.759366, 1, 0.5882353, 0, 1,
-1.298019, 0.2929463, -0.3013235, 1, 0.5921569, 0, 1,
-1.290967, 1.253435, -2.323454, 1, 0.6, 0, 1,
-1.28461, 1.219699, -0.3319674, 1, 0.6078432, 0, 1,
-1.27385, -1.039938, -1.192984, 1, 0.6117647, 0, 1,
-1.266258, -0.1021601, -1.414898, 1, 0.6196079, 0, 1,
-1.262478, 0.1647028, -0.4980135, 1, 0.6235294, 0, 1,
-1.251373, -0.421674, 0.3101385, 1, 0.6313726, 0, 1,
-1.242488, -0.463751, -1.214189, 1, 0.6352941, 0, 1,
-1.240026, 1.164223, -0.8472425, 1, 0.6431373, 0, 1,
-1.234396, -0.2175248, -1.820868, 1, 0.6470588, 0, 1,
-1.224636, 0.209295, -1.639561, 1, 0.654902, 0, 1,
-1.212188, 0.09887994, -1.748653, 1, 0.6588235, 0, 1,
-1.211959, 0.5502104, -0.5871816, 1, 0.6666667, 0, 1,
-1.207324, 1.111458, -0.721669, 1, 0.6705883, 0, 1,
-1.206005, 1.451993, 0.2678423, 1, 0.6784314, 0, 1,
-1.179316, -0.6326075, -2.29191, 1, 0.682353, 0, 1,
-1.176814, 1.573611, 1.087824, 1, 0.6901961, 0, 1,
-1.176721, -0.5017967, -2.441085, 1, 0.6941177, 0, 1,
-1.176659, -0.2607346, -1.915141, 1, 0.7019608, 0, 1,
-1.16689, -0.2070259, -2.994164, 1, 0.7098039, 0, 1,
-1.159902, 0.6103802, -2.306742, 1, 0.7137255, 0, 1,
-1.15342, -0.1668148, -1.586164, 1, 0.7215686, 0, 1,
-1.152267, -0.3711923, -3.187815, 1, 0.7254902, 0, 1,
-1.147952, 0.4557135, 0.4900526, 1, 0.7333333, 0, 1,
-1.143802, -0.2132262, -1.89162, 1, 0.7372549, 0, 1,
-1.136719, 1.237942, 0.2131266, 1, 0.7450981, 0, 1,
-1.133568, -0.3224931, -0.1327272, 1, 0.7490196, 0, 1,
-1.12782, 1.414644, -1.750286, 1, 0.7568628, 0, 1,
-1.12729, -0.3898762, -1.668436, 1, 0.7607843, 0, 1,
-1.119846, 1.274373, -0.04980252, 1, 0.7686275, 0, 1,
-1.108941, -0.1949977, 0.5775292, 1, 0.772549, 0, 1,
-1.10868, -0.8724056, -0.9785364, 1, 0.7803922, 0, 1,
-1.108249, 0.1026862, -1.603525, 1, 0.7843137, 0, 1,
-1.102617, -1.238723, -4.337516, 1, 0.7921569, 0, 1,
-1.102071, 0.5463355, 0.2570554, 1, 0.7960784, 0, 1,
-1.095993, -0.3528412, -2.183692, 1, 0.8039216, 0, 1,
-1.082217, -0.676107, -0.9813755, 1, 0.8117647, 0, 1,
-1.074412, 0.271342, -0.6682414, 1, 0.8156863, 0, 1,
-1.066551, -0.3688063, -1.506694, 1, 0.8235294, 0, 1,
-1.065366, -1.140243, -2.50519, 1, 0.827451, 0, 1,
-1.063258, 0.3118199, -1.220648, 1, 0.8352941, 0, 1,
-1.063184, 0.07956649, -2.64005, 1, 0.8392157, 0, 1,
-1.062872, -0.1281876, -1.623824, 1, 0.8470588, 0, 1,
-1.05763, 0.420389, -0.3350624, 1, 0.8509804, 0, 1,
-1.057431, -0.07565825, 1.123219, 1, 0.8588235, 0, 1,
-1.051424, 0.0119293, -1.373499, 1, 0.8627451, 0, 1,
-1.043968, -0.3262142, -2.874604, 1, 0.8705882, 0, 1,
-1.041631, -1.318796, -2.568332, 1, 0.8745098, 0, 1,
-1.040883, -0.04653017, -0.8579692, 1, 0.8823529, 0, 1,
-1.039591, 0.4291294, -1.384762, 1, 0.8862745, 0, 1,
-1.034114, -1.247713, -1.669901, 1, 0.8941177, 0, 1,
-1.031953, 1.225892, -0.2506541, 1, 0.8980392, 0, 1,
-1.031792, 0.5054595, -1.953635, 1, 0.9058824, 0, 1,
-1.027682, -0.06547903, -2.563713, 1, 0.9137255, 0, 1,
-1.023645, -0.9334174, -2.537731, 1, 0.9176471, 0, 1,
-1.019559, -0.08545508, -3.419338, 1, 0.9254902, 0, 1,
-1.014405, 1.083117, -1.466807, 1, 0.9294118, 0, 1,
-1.009773, 1.750541, -1.202451, 1, 0.9372549, 0, 1,
-1.008062, -0.5927923, -2.198398, 1, 0.9411765, 0, 1,
-1.007892, -0.9912131, -4.084146, 1, 0.9490196, 0, 1,
-1.005001, -1.145775, -2.967546, 1, 0.9529412, 0, 1,
-1.004631, 0.854027, -0.01183615, 1, 0.9607843, 0, 1,
-0.9940381, -1.632301, -1.777258, 1, 0.9647059, 0, 1,
-0.9898716, 1.608927, -1.020809, 1, 0.972549, 0, 1,
-0.9876423, 0.9134586, 1.143093, 1, 0.9764706, 0, 1,
-0.9840993, 1.517661, -0.4897628, 1, 0.9843137, 0, 1,
-0.9837317, -1.010836, -2.04339, 1, 0.9882353, 0, 1,
-0.9808203, 0.05805527, -4.264968, 1, 0.9960784, 0, 1,
-0.9779186, 0.7324317, -1.023723, 0.9960784, 1, 0, 1,
-0.9688783, 0.3312396, -0.9828879, 0.9921569, 1, 0, 1,
-0.9611041, 0.991343, -0.3276867, 0.9843137, 1, 0, 1,
-0.9413983, -0.2689467, -1.879701, 0.9803922, 1, 0, 1,
-0.9287431, -0.07317916, -2.086953, 0.972549, 1, 0, 1,
-0.9208326, -1.651019, -4.040239, 0.9686275, 1, 0, 1,
-0.9165635, -0.1864585, -2.210605, 0.9607843, 1, 0, 1,
-0.9105812, 0.3884162, -0.5735209, 0.9568627, 1, 0, 1,
-0.9085132, 0.4315839, -1.712817, 0.9490196, 1, 0, 1,
-0.9061261, 0.2506589, -2.423871, 0.945098, 1, 0, 1,
-0.9010436, 0.2548621, -2.424546, 0.9372549, 1, 0, 1,
-0.8949799, 0.5623773, -2.304943, 0.9333333, 1, 0, 1,
-0.89055, -0.1554502, -0.6275442, 0.9254902, 1, 0, 1,
-0.8828142, 0.710605, -1.425934, 0.9215686, 1, 0, 1,
-0.8676065, -0.03552553, -0.9044832, 0.9137255, 1, 0, 1,
-0.8627272, -0.9367348, -2.192498, 0.9098039, 1, 0, 1,
-0.8611735, 0.08392712, -1.655187, 0.9019608, 1, 0, 1,
-0.8533752, 0.6337051, -2.562669, 0.8941177, 1, 0, 1,
-0.8500925, -0.2866974, -2.383334, 0.8901961, 1, 0, 1,
-0.8447216, -1.548845, -3.690234, 0.8823529, 1, 0, 1,
-0.8435599, -0.6529338, -0.6978908, 0.8784314, 1, 0, 1,
-0.841875, -0.6304741, -2.812351, 0.8705882, 1, 0, 1,
-0.8375633, 1.291091, 1.559005, 0.8666667, 1, 0, 1,
-0.8350992, -0.4846579, -1.045308, 0.8588235, 1, 0, 1,
-0.8289079, -2.069088, -2.602634, 0.854902, 1, 0, 1,
-0.828056, -0.01769954, -1.015838, 0.8470588, 1, 0, 1,
-0.8273427, 2.657945, -0.1458273, 0.8431373, 1, 0, 1,
-0.8182628, -1.286567, -2.681557, 0.8352941, 1, 0, 1,
-0.8165709, 0.0009196285, -1.449403, 0.8313726, 1, 0, 1,
-0.8065142, 1.470356, -1.575758, 0.8235294, 1, 0, 1,
-0.8063706, -0.5148612, -0.8448651, 0.8196079, 1, 0, 1,
-0.8028063, -0.5300264, -0.8963442, 0.8117647, 1, 0, 1,
-0.7932714, -1.066737, -0.8109946, 0.8078431, 1, 0, 1,
-0.7801029, 0.2147759, -1.264198, 0.8, 1, 0, 1,
-0.7789966, -0.4433345, -1.779668, 0.7921569, 1, 0, 1,
-0.7746025, 0.561418, -0.23191, 0.7882353, 1, 0, 1,
-0.7719284, -0.1484609, -3.667795, 0.7803922, 1, 0, 1,
-0.7701357, -0.5042736, -2.855603, 0.7764706, 1, 0, 1,
-0.7659248, -0.2313453, -1.811185, 0.7686275, 1, 0, 1,
-0.7646548, -0.2620977, -1.21301, 0.7647059, 1, 0, 1,
-0.7617282, 0.2778743, 0.6036453, 0.7568628, 1, 0, 1,
-0.7456101, 0.500837, -2.61388, 0.7529412, 1, 0, 1,
-0.7439016, -0.3245855, -1.633377, 0.7450981, 1, 0, 1,
-0.7408938, -0.5094704, -2.119646, 0.7411765, 1, 0, 1,
-0.7348366, 0.2838011, -0.1743261, 0.7333333, 1, 0, 1,
-0.732078, 0.2038509, -0.2842152, 0.7294118, 1, 0, 1,
-0.7312291, -0.5011057, -0.9082497, 0.7215686, 1, 0, 1,
-0.7233862, -1.953641, -3.61698, 0.7176471, 1, 0, 1,
-0.7194778, 0.2451885, -1.787963, 0.7098039, 1, 0, 1,
-0.7167416, -1.623265, -2.143378, 0.7058824, 1, 0, 1,
-0.7114775, 1.318358, -0.22342, 0.6980392, 1, 0, 1,
-0.7099717, 0.01553473, 0.96286, 0.6901961, 1, 0, 1,
-0.7037661, 1.001789, -1.658946, 0.6862745, 1, 0, 1,
-0.7009567, -0.05269063, -2.799885, 0.6784314, 1, 0, 1,
-0.6965687, 0.2268204, -0.1951138, 0.6745098, 1, 0, 1,
-0.6962351, 0.7838891, -0.05586707, 0.6666667, 1, 0, 1,
-0.6959647, 0.1100831, -1.5921, 0.6627451, 1, 0, 1,
-0.6912892, 0.2887676, -1.713573, 0.654902, 1, 0, 1,
-0.6896377, -0.9218512, -3.52843, 0.6509804, 1, 0, 1,
-0.6881803, -0.09671251, -2.498867, 0.6431373, 1, 0, 1,
-0.6855657, -0.9846326, -2.314245, 0.6392157, 1, 0, 1,
-0.6820258, -1.361167, -4.092417, 0.6313726, 1, 0, 1,
-0.6798228, -0.2834247, -3.175952, 0.627451, 1, 0, 1,
-0.679016, 0.3749557, -1.765693, 0.6196079, 1, 0, 1,
-0.6763002, -1.231234, -2.420649, 0.6156863, 1, 0, 1,
-0.6747096, 0.4069617, 0.8198032, 0.6078432, 1, 0, 1,
-0.67256, -0.02370016, -0.6208092, 0.6039216, 1, 0, 1,
-0.6694619, -0.1828612, -1.276729, 0.5960785, 1, 0, 1,
-0.6665145, -0.7991412, -2.212126, 0.5882353, 1, 0, 1,
-0.6661655, 1.831834, 0.6720664, 0.5843138, 1, 0, 1,
-0.6659014, 0.894381, 0.6916103, 0.5764706, 1, 0, 1,
-0.6658829, 1.720012, -1.252557, 0.572549, 1, 0, 1,
-0.6643073, -1.563511, -3.521609, 0.5647059, 1, 0, 1,
-0.65927, -0.4388214, -0.2559021, 0.5607843, 1, 0, 1,
-0.6576629, 0.2284132, -2.009004, 0.5529412, 1, 0, 1,
-0.6548619, -0.1800909, -1.871645, 0.5490196, 1, 0, 1,
-0.647776, -1.293164, -2.27389, 0.5411765, 1, 0, 1,
-0.6475049, 0.2769561, -2.946389, 0.5372549, 1, 0, 1,
-0.6471566, 0.6826657, -1.727867, 0.5294118, 1, 0, 1,
-0.6469063, -0.1826171, -1.436454, 0.5254902, 1, 0, 1,
-0.6410561, -0.7620574, -3.839246, 0.5176471, 1, 0, 1,
-0.639487, -2.2172, -3.40286, 0.5137255, 1, 0, 1,
-0.6375086, -0.516026, -3.328553, 0.5058824, 1, 0, 1,
-0.6290929, 0.8517542, 0.03211577, 0.5019608, 1, 0, 1,
-0.6273407, 0.5909619, 0.5581813, 0.4941176, 1, 0, 1,
-0.6261908, -0.9611694, -3.211494, 0.4862745, 1, 0, 1,
-0.6193168, 0.7767851, 0.6117641, 0.4823529, 1, 0, 1,
-0.6171954, -0.4533195, -2.08498, 0.4745098, 1, 0, 1,
-0.6164141, 0.6533815, 0.2673881, 0.4705882, 1, 0, 1,
-0.6150166, -1.462974, -1.791992, 0.4627451, 1, 0, 1,
-0.6115039, 1.449013, -1.036506, 0.4588235, 1, 0, 1,
-0.6087326, -0.4703002, -2.923184, 0.4509804, 1, 0, 1,
-0.5968544, -1.709764, -2.551294, 0.4470588, 1, 0, 1,
-0.5965396, 1.662339, -0.2627307, 0.4392157, 1, 0, 1,
-0.5961958, 1.445412, 1.952579, 0.4352941, 1, 0, 1,
-0.5912343, -0.9037611, -0.4950899, 0.427451, 1, 0, 1,
-0.5900734, 0.8419888, -1.234318, 0.4235294, 1, 0, 1,
-0.587836, 0.05725326, 1.07708, 0.4156863, 1, 0, 1,
-0.5860227, -0.05220052, -1.784888, 0.4117647, 1, 0, 1,
-0.5845199, 1.083935, -0.8542038, 0.4039216, 1, 0, 1,
-0.5822558, 0.4584754, -2.339818, 0.3960784, 1, 0, 1,
-0.5799892, 0.8365003, -1.44874, 0.3921569, 1, 0, 1,
-0.5793279, -0.7649052, -3.457252, 0.3843137, 1, 0, 1,
-0.572116, 0.5640652, 0.3555342, 0.3803922, 1, 0, 1,
-0.5681514, 2.217144, 0.4075009, 0.372549, 1, 0, 1,
-0.5616654, 0.6523311, -2.871777, 0.3686275, 1, 0, 1,
-0.5609994, -0.3570285, -3.554212, 0.3607843, 1, 0, 1,
-0.5606796, 0.4769299, -1.662947, 0.3568628, 1, 0, 1,
-0.5594118, 0.1746883, -0.8800923, 0.3490196, 1, 0, 1,
-0.559172, -1.420609, -0.003649017, 0.345098, 1, 0, 1,
-0.5573023, 2.038209, -1.628066, 0.3372549, 1, 0, 1,
-0.5544211, 0.4269972, -1.420829, 0.3333333, 1, 0, 1,
-0.5534647, -0.2003639, -2.09768, 0.3254902, 1, 0, 1,
-0.553353, 0.7527754, -0.9598155, 0.3215686, 1, 0, 1,
-0.5523229, 1.203061, 0.4643256, 0.3137255, 1, 0, 1,
-0.5520709, -0.2052673, -1.529247, 0.3098039, 1, 0, 1,
-0.5481409, 0.342607, 0.2906027, 0.3019608, 1, 0, 1,
-0.5463971, -0.8413499, -0.9774421, 0.2941177, 1, 0, 1,
-0.5462437, 2.067861, -2.121711, 0.2901961, 1, 0, 1,
-0.545233, -0.5922301, -3.307007, 0.282353, 1, 0, 1,
-0.5447946, -0.08958282, -3.218496, 0.2784314, 1, 0, 1,
-0.5437231, -1.768486, -3.513541, 0.2705882, 1, 0, 1,
-0.5400895, 0.179783, -1.395493, 0.2666667, 1, 0, 1,
-0.5369325, 0.4093235, 0.9694229, 0.2588235, 1, 0, 1,
-0.534629, 1.496824, -1.462641, 0.254902, 1, 0, 1,
-0.5338484, 1.000525, -0.8003911, 0.2470588, 1, 0, 1,
-0.5335563, 1.087925, -0.4022371, 0.2431373, 1, 0, 1,
-0.5252723, 0.9115894, -0.4555114, 0.2352941, 1, 0, 1,
-0.5246257, -1.18671, -2.771155, 0.2313726, 1, 0, 1,
-0.5232702, -1.288264, -2.018457, 0.2235294, 1, 0, 1,
-0.5204536, 0.6864861, -0.4190465, 0.2196078, 1, 0, 1,
-0.5147978, 0.3715943, -1.349591, 0.2117647, 1, 0, 1,
-0.5132009, 0.311227, -1.186999, 0.2078431, 1, 0, 1,
-0.5124049, -0.2305831, -1.834777, 0.2, 1, 0, 1,
-0.5047066, -0.8001725, -1.993894, 0.1921569, 1, 0, 1,
-0.4939924, 0.5889424, 0.02834828, 0.1882353, 1, 0, 1,
-0.493406, 0.8963173, -0.9872688, 0.1803922, 1, 0, 1,
-0.4929514, 0.2478039, -4.398223, 0.1764706, 1, 0, 1,
-0.4916689, 0.9999439, 0.1795957, 0.1686275, 1, 0, 1,
-0.4894023, 1.113208, -0.2531549, 0.1647059, 1, 0, 1,
-0.4889366, -0.5576352, -1.402606, 0.1568628, 1, 0, 1,
-0.4885376, 0.6873839, -1.900156, 0.1529412, 1, 0, 1,
-0.4876273, -0.2472452, -2.71831, 0.145098, 1, 0, 1,
-0.4849933, 0.1308943, -1.715813, 0.1411765, 1, 0, 1,
-0.4744815, 0.834173, -1.038866, 0.1333333, 1, 0, 1,
-0.4740246, 0.615416, -0.3030861, 0.1294118, 1, 0, 1,
-0.4733251, 1.240328, 0.9177178, 0.1215686, 1, 0, 1,
-0.470943, -0.562101, -2.643402, 0.1176471, 1, 0, 1,
-0.4707587, -0.4252365, -2.956221, 0.1098039, 1, 0, 1,
-0.4669009, -0.2571872, -1.084175, 0.1058824, 1, 0, 1,
-0.4633456, 0.7702203, -2.541628, 0.09803922, 1, 0, 1,
-0.4602351, 1.41025, -0.7089151, 0.09019608, 1, 0, 1,
-0.4587049, -1.021976, -2.420049, 0.08627451, 1, 0, 1,
-0.4586825, 1.473086, -0.1905998, 0.07843138, 1, 0, 1,
-0.4540101, -1.468656, -1.989539, 0.07450981, 1, 0, 1,
-0.4487023, -0.798299, -1.033787, 0.06666667, 1, 0, 1,
-0.442857, 0.8120254, -0.2910314, 0.0627451, 1, 0, 1,
-0.4405077, 0.03283637, -1.422452, 0.05490196, 1, 0, 1,
-0.4367116, -0.7388573, -3.520018, 0.05098039, 1, 0, 1,
-0.4338575, 1.180937, 0.1243968, 0.04313726, 1, 0, 1,
-0.4331239, -2.293706, -3.818685, 0.03921569, 1, 0, 1,
-0.4279082, -0.9514832, -3.371356, 0.03137255, 1, 0, 1,
-0.4239433, 0.005717868, -2.511861, 0.02745098, 1, 0, 1,
-0.4224375, -2.493005, -1.18604, 0.01960784, 1, 0, 1,
-0.4152974, -1.616346, -3.389386, 0.01568628, 1, 0, 1,
-0.4123594, -1.428167, -2.688067, 0.007843138, 1, 0, 1,
-0.4105788, 2.224925, -1.16868, 0.003921569, 1, 0, 1,
-0.4104083, 0.8585707, -1.665648, 0, 1, 0.003921569, 1,
-0.4101105, 0.1454006, -1.525095, 0, 1, 0.01176471, 1,
-0.4092545, 0.301093, -0.5607902, 0, 1, 0.01568628, 1,
-0.4046826, -0.3425095, -1.825209, 0, 1, 0.02352941, 1,
-0.4044833, -0.6061662, -2.84675, 0, 1, 0.02745098, 1,
-0.3915773, -0.05573317, -1.113148, 0, 1, 0.03529412, 1,
-0.384206, -0.07838196, -2.110781, 0, 1, 0.03921569, 1,
-0.3810079, 0.163305, -0.675229, 0, 1, 0.04705882, 1,
-0.3754401, 0.6717934, 1.88193, 0, 1, 0.05098039, 1,
-0.3724601, 0.01835018, -1.33095, 0, 1, 0.05882353, 1,
-0.3708837, -0.4196288, -2.892294, 0, 1, 0.0627451, 1,
-0.3649148, -0.8292664, -3.39855, 0, 1, 0.07058824, 1,
-0.3639439, 0.4526507, 0.6268079, 0, 1, 0.07450981, 1,
-0.3593477, 1.189143, -1.253147, 0, 1, 0.08235294, 1,
-0.3548348, -0.3091673, -2.45361, 0, 1, 0.08627451, 1,
-0.3547361, -0.5399318, -0.6883794, 0, 1, 0.09411765, 1,
-0.3530854, -1.748899, -5.261726, 0, 1, 0.1019608, 1,
-0.3496722, -0.01854675, -0.3410598, 0, 1, 0.1058824, 1,
-0.3462795, 1.242344, -0.1560568, 0, 1, 0.1137255, 1,
-0.3455171, -0.4028856, -1.676222, 0, 1, 0.1176471, 1,
-0.3387749, -1.719351, -3.869458, 0, 1, 0.1254902, 1,
-0.3362532, -0.176502, -2.178671, 0, 1, 0.1294118, 1,
-0.3354514, 1.766936, 1.15661, 0, 1, 0.1372549, 1,
-0.3321013, 0.7418249, -0.6875052, 0, 1, 0.1411765, 1,
-0.3295422, -0.2124471, -1.942396, 0, 1, 0.1490196, 1,
-0.3289936, 0.7984765, -0.5981444, 0, 1, 0.1529412, 1,
-0.3269905, -1.074494, -1.741686, 0, 1, 0.1607843, 1,
-0.3267984, -1.843009, -4.314334, 0, 1, 0.1647059, 1,
-0.3252742, -0.8380346, -2.570738, 0, 1, 0.172549, 1,
-0.3212194, 0.8831839, 1.53026, 0, 1, 0.1764706, 1,
-0.3201558, 0.1512969, -1.576756, 0, 1, 0.1843137, 1,
-0.3181551, -1.651615, -4.241154, 0, 1, 0.1882353, 1,
-0.3174718, -0.5080055, -2.238937, 0, 1, 0.1960784, 1,
-0.3143134, 0.5632296, -0.8495144, 0, 1, 0.2039216, 1,
-0.3127821, -0.6969892, -2.444885, 0, 1, 0.2078431, 1,
-0.3077868, 0.3958138, -0.5462098, 0, 1, 0.2156863, 1,
-0.3072951, -2.21187, -4.327557, 0, 1, 0.2196078, 1,
-0.3062032, -0.8294676, -2.470409, 0, 1, 0.227451, 1,
-0.3058658, -0.05966938, -1.539304, 0, 1, 0.2313726, 1,
-0.3032187, -0.1242731, -1.879984, 0, 1, 0.2392157, 1,
-0.2996897, 0.5216137, -0.1027847, 0, 1, 0.2431373, 1,
-0.2967611, -0.02289518, -0.5110901, 0, 1, 0.2509804, 1,
-0.2967546, -0.8555253, -3.743099, 0, 1, 0.254902, 1,
-0.2885791, -0.6940426, -2.842807, 0, 1, 0.2627451, 1,
-0.2876665, -0.2545447, -1.542618, 0, 1, 0.2666667, 1,
-0.2837227, -0.3449794, -4.02773, 0, 1, 0.2745098, 1,
-0.2812766, -0.08337538, -2.866699, 0, 1, 0.2784314, 1,
-0.27209, -0.265196, -2.207198, 0, 1, 0.2862745, 1,
-0.2711089, -0.2737359, -3.392653, 0, 1, 0.2901961, 1,
-0.2663542, -0.8760411, -2.773333, 0, 1, 0.2980392, 1,
-0.2621863, 0.5191171, -0.6489135, 0, 1, 0.3058824, 1,
-0.2567126, 3.039768, 0.5703859, 0, 1, 0.3098039, 1,
-0.2554158, -1.025509, -2.143047, 0, 1, 0.3176471, 1,
-0.2553977, 0.7919903, -2.379764, 0, 1, 0.3215686, 1,
-0.2480124, -1.041117, -2.852817, 0, 1, 0.3294118, 1,
-0.2477437, -0.6123309, -2.523235, 0, 1, 0.3333333, 1,
-0.2459399, -0.8041277, -4.049171, 0, 1, 0.3411765, 1,
-0.2449218, -1.515814, -3.271355, 0, 1, 0.345098, 1,
-0.2448868, -0.2557411, -4.21806, 0, 1, 0.3529412, 1,
-0.2432766, -0.4413109, -1.98916, 0, 1, 0.3568628, 1,
-0.242937, 1.27357, -0.9332947, 0, 1, 0.3647059, 1,
-0.2426838, 0.6514808, -0.5088543, 0, 1, 0.3686275, 1,
-0.2401841, 0.02712089, -2.153632, 0, 1, 0.3764706, 1,
-0.2292152, 0.2596989, -3.121624, 0, 1, 0.3803922, 1,
-0.2216459, 0.2848604, -0.2037518, 0, 1, 0.3882353, 1,
-0.2216401, -0.8396264, -3.394705, 0, 1, 0.3921569, 1,
-0.2202142, 0.451846, -2.262851, 0, 1, 0.4, 1,
-0.2191105, 0.07803538, -1.45285, 0, 1, 0.4078431, 1,
-0.2185906, -0.5795158, -3.032473, 0, 1, 0.4117647, 1,
-0.2168091, 0.5827497, -1.552277, 0, 1, 0.4196078, 1,
-0.2145224, -0.7490709, -5.151178, 0, 1, 0.4235294, 1,
-0.2132098, 3.225996, -0.8463533, 0, 1, 0.4313726, 1,
-0.213131, 0.2322547, -1.759656, 0, 1, 0.4352941, 1,
-0.2104573, 1.545809, 0.4359969, 0, 1, 0.4431373, 1,
-0.2047223, 0.09334642, -1.162138, 0, 1, 0.4470588, 1,
-0.2039788, 0.9318824, 0.3633627, 0, 1, 0.454902, 1,
-0.2037619, -0.2537002, -0.8165073, 0, 1, 0.4588235, 1,
-0.1997989, 1.89937, 1.701261, 0, 1, 0.4666667, 1,
-0.1975388, -0.0003974945, 0.3780116, 0, 1, 0.4705882, 1,
-0.1875154, -0.1242852, -2.316544, 0, 1, 0.4784314, 1,
-0.1841584, 0.3661473, -0.8219928, 0, 1, 0.4823529, 1,
-0.18377, 0.4003151, -0.4413666, 0, 1, 0.4901961, 1,
-0.1795738, -0.5945556, -3.264826, 0, 1, 0.4941176, 1,
-0.177855, -0.8889707, -0.8782754, 0, 1, 0.5019608, 1,
-0.1765535, -0.5161619, -4.539114, 0, 1, 0.509804, 1,
-0.1750619, -0.2464324, -1.856038, 0, 1, 0.5137255, 1,
-0.1688952, 0.1510741, -0.9508016, 0, 1, 0.5215687, 1,
-0.1626947, -1.409949, -2.75335, 0, 1, 0.5254902, 1,
-0.1624389, 0.4742104, -1.79435, 0, 1, 0.5333334, 1,
-0.1612291, -1.764724, -3.264662, 0, 1, 0.5372549, 1,
-0.1583847, -0.2158251, -4.041822, 0, 1, 0.5450981, 1,
-0.1577535, -0.6446893, -2.821901, 0, 1, 0.5490196, 1,
-0.1540127, -0.6071646, -2.903219, 0, 1, 0.5568628, 1,
-0.1506841, -0.4833429, -1.914023, 0, 1, 0.5607843, 1,
-0.1467717, 0.7724868, -0.3319916, 0, 1, 0.5686275, 1,
-0.1455467, -0.285152, -3.520141, 0, 1, 0.572549, 1,
-0.141974, -1.240952, -4.250612, 0, 1, 0.5803922, 1,
-0.1387167, -2.374525, -2.959631, 0, 1, 0.5843138, 1,
-0.1383804, -1.044837, -2.742138, 0, 1, 0.5921569, 1,
-0.1363982, -0.5766349, -3.036514, 0, 1, 0.5960785, 1,
-0.1305137, -2.026665, -3.226591, 0, 1, 0.6039216, 1,
-0.126817, 0.7131695, -0.280677, 0, 1, 0.6117647, 1,
-0.1261636, -0.8417851, -3.711188, 0, 1, 0.6156863, 1,
-0.1250576, 1.709104, 1.06113, 0, 1, 0.6235294, 1,
-0.1245217, -0.15973, -2.46886, 0, 1, 0.627451, 1,
-0.1231659, 1.676508, 2.014266, 0, 1, 0.6352941, 1,
-0.1223228, 1.357277, -0.08525252, 0, 1, 0.6392157, 1,
-0.1163875, 1.096673, -0.953189, 0, 1, 0.6470588, 1,
-0.1153559, 0.07975876, -1.74715, 0, 1, 0.6509804, 1,
-0.1084637, -0.5263935, -2.832501, 0, 1, 0.6588235, 1,
-0.105293, 0.7074114, -0.1444475, 0, 1, 0.6627451, 1,
-0.1034842, 0.4320924, -1.604391, 0, 1, 0.6705883, 1,
-0.1021282, 2.104512, 0.9193648, 0, 1, 0.6745098, 1,
-0.09613054, -0.2557019, -2.937799, 0, 1, 0.682353, 1,
-0.09405892, 1.086184, 2.065143, 0, 1, 0.6862745, 1,
-0.08977752, -1.02245, -2.810237, 0, 1, 0.6941177, 1,
-0.08970281, -0.5258281, -3.497864, 0, 1, 0.7019608, 1,
-0.08864245, 0.1243487, -0.90725, 0, 1, 0.7058824, 1,
-0.07821529, 0.7347748, -0.2393887, 0, 1, 0.7137255, 1,
-0.06981947, 0.06946664, 0.1376364, 0, 1, 0.7176471, 1,
-0.0690088, -0.8306067, -2.53455, 0, 1, 0.7254902, 1,
-0.06702965, -0.04042939, -1.695265, 0, 1, 0.7294118, 1,
-0.06152223, -0.4106667, -2.114491, 0, 1, 0.7372549, 1,
-0.06059938, -2.083026, -2.581695, 0, 1, 0.7411765, 1,
-0.0550868, -0.4921036, -3.991028, 0, 1, 0.7490196, 1,
-0.05159067, -1.799428, -2.674246, 0, 1, 0.7529412, 1,
-0.05023292, -0.8085594, -3.461259, 0, 1, 0.7607843, 1,
-0.0465261, -0.9263406, -2.738322, 0, 1, 0.7647059, 1,
-0.04432917, 0.02749053, -1.645143, 0, 1, 0.772549, 1,
-0.03965741, 0.4650414, -1.042662, 0, 1, 0.7764706, 1,
-0.03850359, -1.208802, -3.063857, 0, 1, 0.7843137, 1,
-0.03666457, -0.3442843, -4.092389, 0, 1, 0.7882353, 1,
-0.03384719, 1.038255, 1.655091, 0, 1, 0.7960784, 1,
-0.0248084, -1.226655, -2.257869, 0, 1, 0.8039216, 1,
-0.01967996, -1.144043, -3.942986, 0, 1, 0.8078431, 1,
-0.01918695, 0.3882965, 0.07417455, 0, 1, 0.8156863, 1,
-0.01749238, -0.9098054, -2.790577, 0, 1, 0.8196079, 1,
-0.01484881, 1.210617, -0.3591857, 0, 1, 0.827451, 1,
-0.01316898, -0.6346253, -3.698659, 0, 1, 0.8313726, 1,
-0.01040741, -0.8180533, -2.880256, 0, 1, 0.8392157, 1,
-0.01010344, -0.2671644, -2.293253, 0, 1, 0.8431373, 1,
-0.006067402, -0.183378, -3.4594, 0, 1, 0.8509804, 1,
-0.004228473, 0.6888766, 1.7381, 0, 1, 0.854902, 1,
-0.002274461, -1.186441, -2.800475, 0, 1, 0.8627451, 1,
-0.0001187867, -0.791643, -2.718465, 0, 1, 0.8666667, 1,
0.0003087965, 0.2613881, 0.1434679, 0, 1, 0.8745098, 1,
0.0008925102, -0.951112, 4.184103, 0, 1, 0.8784314, 1,
0.004441147, -1.411099, 2.98024, 0, 1, 0.8862745, 1,
0.006624698, -0.057729, 2.137569, 0, 1, 0.8901961, 1,
0.01405068, 0.9109727, 1.385649, 0, 1, 0.8980392, 1,
0.01511165, -0.5264786, 4.664267, 0, 1, 0.9058824, 1,
0.01838637, 0.112321, 0.01214526, 0, 1, 0.9098039, 1,
0.02123746, 1.867086, -0.1531586, 0, 1, 0.9176471, 1,
0.02397976, -0.4431558, 1.719539, 0, 1, 0.9215686, 1,
0.02720599, 0.9847094, -0.3779641, 0, 1, 0.9294118, 1,
0.02832151, 0.1085468, -0.5565804, 0, 1, 0.9333333, 1,
0.02893695, -0.7094164, 3.563619, 0, 1, 0.9411765, 1,
0.02898367, 0.2947302, 0.4290432, 0, 1, 0.945098, 1,
0.02997159, 0.9868833, 0.7883289, 0, 1, 0.9529412, 1,
0.0306522, 0.8275232, 0.3168354, 0, 1, 0.9568627, 1,
0.03105242, 1.285492, -0.1592108, 0, 1, 0.9647059, 1,
0.0317056, 1.177012, -0.5955625, 0, 1, 0.9686275, 1,
0.03258219, 1.248832, -0.7595183, 0, 1, 0.9764706, 1,
0.03434223, -1.45753, 3.44102, 0, 1, 0.9803922, 1,
0.03561089, 2.662913, 1.128874, 0, 1, 0.9882353, 1,
0.03828328, 0.8044839, 0.2843406, 0, 1, 0.9921569, 1,
0.0383569, -0.0477192, 4.400353, 0, 1, 1, 1,
0.04057468, -0.396574, 2.272742, 0, 0.9921569, 1, 1,
0.04270469, -0.8711855, 0.5102136, 0, 0.9882353, 1, 1,
0.04843741, 0.02784, -0.8368957, 0, 0.9803922, 1, 1,
0.05082398, -0.4363979, 4.062966, 0, 0.9764706, 1, 1,
0.05150802, 0.1280675, 0.9491373, 0, 0.9686275, 1, 1,
0.0540073, -0.5872974, 4.627325, 0, 0.9647059, 1, 1,
0.05456344, 0.9903398, 0.3107069, 0, 0.9568627, 1, 1,
0.05827046, -1.044545, 1.898729, 0, 0.9529412, 1, 1,
0.06205972, 1.091896, 0.5289361, 0, 0.945098, 1, 1,
0.06472244, 1.973161, 0.03309472, 0, 0.9411765, 1, 1,
0.06608152, 1.116069, 1.201418, 0, 0.9333333, 1, 1,
0.06948266, -0.4261717, 3.136109, 0, 0.9294118, 1, 1,
0.07170495, 0.8411775, -0.304353, 0, 0.9215686, 1, 1,
0.07279143, 0.1128919, 1.829407, 0, 0.9176471, 1, 1,
0.07311209, -0.9612822, 2.683133, 0, 0.9098039, 1, 1,
0.07415797, -1.256219, 2.423609, 0, 0.9058824, 1, 1,
0.08138539, 0.3942424, 1.791592, 0, 0.8980392, 1, 1,
0.08158015, 1.496166, -0.1039568, 0, 0.8901961, 1, 1,
0.08630327, -0.5852043, 3.706512, 0, 0.8862745, 1, 1,
0.09181737, 0.19736, -0.06203609, 0, 0.8784314, 1, 1,
0.09312109, 0.4937395, 1.441882, 0, 0.8745098, 1, 1,
0.09578114, 0.3849607, -1.23023, 0, 0.8666667, 1, 1,
0.09592423, 0.1397922, 0.7781637, 0, 0.8627451, 1, 1,
0.1002354, -0.2131382, 2.590435, 0, 0.854902, 1, 1,
0.1016059, 1.220405, 1.495048, 0, 0.8509804, 1, 1,
0.105444, 1.954274, 3.234363, 0, 0.8431373, 1, 1,
0.1117383, -0.8407845, 3.88216, 0, 0.8392157, 1, 1,
0.1120026, 0.1317175, 1.596712, 0, 0.8313726, 1, 1,
0.113034, -2.213228, 3.104115, 0, 0.827451, 1, 1,
0.1262054, -1.984577, 2.504969, 0, 0.8196079, 1, 1,
0.1264179, -0.8771503, 1.420162, 0, 0.8156863, 1, 1,
0.1275418, 0.7618174, 0.2831512, 0, 0.8078431, 1, 1,
0.1278031, 1.636908, 0.8318977, 0, 0.8039216, 1, 1,
0.1278042, 1.916807, 1.031508, 0, 0.7960784, 1, 1,
0.1296688, 0.5697943, 1.20936, 0, 0.7882353, 1, 1,
0.1375237, 0.1318512, -0.4994979, 0, 0.7843137, 1, 1,
0.1397184, 0.6928287, 0.7255692, 0, 0.7764706, 1, 1,
0.1421774, 0.3730952, -1.462948, 0, 0.772549, 1, 1,
0.1503057, 1.23248, 0.1041695, 0, 0.7647059, 1, 1,
0.1529108, -1.833344, 2.136562, 0, 0.7607843, 1, 1,
0.1552403, -0.2899111, 2.485922, 0, 0.7529412, 1, 1,
0.1552429, 0.8421521, -2.273229, 0, 0.7490196, 1, 1,
0.1572818, 0.1888378, 2.170417, 0, 0.7411765, 1, 1,
0.1618256, -0.02409038, 3.210134, 0, 0.7372549, 1, 1,
0.1657364, -0.3975776, 1.958249, 0, 0.7294118, 1, 1,
0.1666457, 0.4847538, 1.210829, 0, 0.7254902, 1, 1,
0.1703833, 0.9318937, 2.085472, 0, 0.7176471, 1, 1,
0.1721126, 1.576167, 0.4259095, 0, 0.7137255, 1, 1,
0.1740969, 1.13684, -0.3886316, 0, 0.7058824, 1, 1,
0.1826514, -2.206101, 0.8571543, 0, 0.6980392, 1, 1,
0.1886353, 0.7204121, 0.2949155, 0, 0.6941177, 1, 1,
0.1935363, -1.51581, 3.7947, 0, 0.6862745, 1, 1,
0.194254, 0.04734793, 1.980625, 0, 0.682353, 1, 1,
0.1958638, -1.183544, 2.655076, 0, 0.6745098, 1, 1,
0.1982912, 0.2946761, 1.420324, 0, 0.6705883, 1, 1,
0.2001358, -0.1103378, 1.362407, 0, 0.6627451, 1, 1,
0.2023708, 0.8535962, 1.148791, 0, 0.6588235, 1, 1,
0.2053554, 1.285923, -1.915918, 0, 0.6509804, 1, 1,
0.2064295, -0.8729134, 3.839297, 0, 0.6470588, 1, 1,
0.2064296, 2.420506, 0.1373354, 0, 0.6392157, 1, 1,
0.2071627, 1.8308, -0.06190386, 0, 0.6352941, 1, 1,
0.2072244, 2.933873, -1.00061, 0, 0.627451, 1, 1,
0.2074714, 0.02857604, 2.101816, 0, 0.6235294, 1, 1,
0.2088467, 2.553584, -0.01107129, 0, 0.6156863, 1, 1,
0.2139336, -0.5943603, 3.714314, 0, 0.6117647, 1, 1,
0.2148243, -2.133207, 3.48383, 0, 0.6039216, 1, 1,
0.2152682, 1.097371, 0.7966004, 0, 0.5960785, 1, 1,
0.2243379, 1.526009, 1.250857, 0, 0.5921569, 1, 1,
0.2250201, -0.9118503, 1.684199, 0, 0.5843138, 1, 1,
0.2270883, 0.8530322, -1.223747, 0, 0.5803922, 1, 1,
0.2315007, -0.4739127, 2.204419, 0, 0.572549, 1, 1,
0.2344107, 0.2593199, -0.4276384, 0, 0.5686275, 1, 1,
0.2351816, 0.9434467, 0.955502, 0, 0.5607843, 1, 1,
0.2398061, 0.2615714, 1.997786, 0, 0.5568628, 1, 1,
0.2401158, -0.9950428, 4.63764, 0, 0.5490196, 1, 1,
0.2403078, -1.399882, -1.088477, 0, 0.5450981, 1, 1,
0.2515161, -0.05548405, 0.3455304, 0, 0.5372549, 1, 1,
0.2521206, 0.3556832, 0.1041858, 0, 0.5333334, 1, 1,
0.2562813, 0.3289682, 1.568981, 0, 0.5254902, 1, 1,
0.2569083, 1.415408, 0.3916608, 0, 0.5215687, 1, 1,
0.2617442, -0.7120273, 2.082471, 0, 0.5137255, 1, 1,
0.264886, 0.5249773, 1.257806, 0, 0.509804, 1, 1,
0.2651021, 1.19255, 0.3950773, 0, 0.5019608, 1, 1,
0.2673968, -0.5215423, 2.700609, 0, 0.4941176, 1, 1,
0.2675072, -0.1914493, 3.300917, 0, 0.4901961, 1, 1,
0.2692016, 1.329771, 0.3841084, 0, 0.4823529, 1, 1,
0.2713853, 0.06367543, 0.5514095, 0, 0.4784314, 1, 1,
0.2844715, -1.346253, 4.346854, 0, 0.4705882, 1, 1,
0.2853505, -1.422853, 3.544868, 0, 0.4666667, 1, 1,
0.2925726, 1.173303, 0.2213573, 0, 0.4588235, 1, 1,
0.2942443, 2.142485, 1.421215, 0, 0.454902, 1, 1,
0.2948301, -0.00638871, 2.050165, 0, 0.4470588, 1, 1,
0.2996965, -0.3577875, 2.246086, 0, 0.4431373, 1, 1,
0.2999749, 0.6191692, -0.8756049, 0, 0.4352941, 1, 1,
0.3000063, 0.4586968, 1.786573, 0, 0.4313726, 1, 1,
0.3042371, -0.01923923, 2.824882, 0, 0.4235294, 1, 1,
0.313445, 1.034206, -0.4811555, 0, 0.4196078, 1, 1,
0.315181, 1.524446, -1.301313, 0, 0.4117647, 1, 1,
0.3155742, 0.1898504, 0.4550564, 0, 0.4078431, 1, 1,
0.3194776, -0.3992779, 2.249115, 0, 0.4, 1, 1,
0.3202798, -0.9221689, 2.221377, 0, 0.3921569, 1, 1,
0.3225844, -0.6197219, 2.858999, 0, 0.3882353, 1, 1,
0.3227527, -1.990351, 1.417238, 0, 0.3803922, 1, 1,
0.3268953, 0.05137993, 0.7842447, 0, 0.3764706, 1, 1,
0.3303008, 1.178895, -0.2304016, 0, 0.3686275, 1, 1,
0.3355198, -0.003809012, 0.5222928, 0, 0.3647059, 1, 1,
0.3373142, 0.384942, 0.7525092, 0, 0.3568628, 1, 1,
0.3374372, -1.241253, 4.626756, 0, 0.3529412, 1, 1,
0.3392734, -1.74022, 2.408347, 0, 0.345098, 1, 1,
0.3414847, 1.141976, 1.0796, 0, 0.3411765, 1, 1,
0.3429983, 0.1304645, 1.007469, 0, 0.3333333, 1, 1,
0.3479578, 0.1273643, 2.079808, 0, 0.3294118, 1, 1,
0.3496121, 0.1241373, 1.241043, 0, 0.3215686, 1, 1,
0.3501297, 0.9460958, 0.4137467, 0, 0.3176471, 1, 1,
0.367211, -0.5289036, 2.49911, 0, 0.3098039, 1, 1,
0.370665, 0.4869346, 1.815649, 0, 0.3058824, 1, 1,
0.3728009, -0.9436502, 4.682266, 0, 0.2980392, 1, 1,
0.3735096, 2.318291, -0.07456885, 0, 0.2901961, 1, 1,
0.3741052, -0.9542436, 2.040906, 0, 0.2862745, 1, 1,
0.3783342, 0.1037804, 0.4729929, 0, 0.2784314, 1, 1,
0.3789074, 2.525354, -1.291852, 0, 0.2745098, 1, 1,
0.3790889, 0.05665863, 0.6686205, 0, 0.2666667, 1, 1,
0.3843661, 0.05895838, 1.090144, 0, 0.2627451, 1, 1,
0.3859423, 0.1464358, 2.019917, 0, 0.254902, 1, 1,
0.3887878, 0.5207647, 2.923902, 0, 0.2509804, 1, 1,
0.3893196, 0.5078216, 0.797953, 0, 0.2431373, 1, 1,
0.3893954, 1.058098, -0.8897278, 0, 0.2392157, 1, 1,
0.3954419, 0.9127051, 0.8938313, 0, 0.2313726, 1, 1,
0.3967766, 0.6677011, 1.450282, 0, 0.227451, 1, 1,
0.397746, 1.264583, 2.265227, 0, 0.2196078, 1, 1,
0.4069963, -1.932223, 4.729995, 0, 0.2156863, 1, 1,
0.4071331, 1.653298, 1.000501, 0, 0.2078431, 1, 1,
0.4075193, -0.2691253, 2.566631, 0, 0.2039216, 1, 1,
0.4115564, -0.3342623, 2.666928, 0, 0.1960784, 1, 1,
0.4136422, 0.004063632, 3.355086, 0, 0.1882353, 1, 1,
0.414549, 0.3016838, -0.1308505, 0, 0.1843137, 1, 1,
0.4174282, 0.6093791, -1.126642, 0, 0.1764706, 1, 1,
0.4177328, 0.1188355, 1.53569, 0, 0.172549, 1, 1,
0.4194121, -1.009513, 2.735513, 0, 0.1647059, 1, 1,
0.4197448, 0.371816, 0.2450769, 0, 0.1607843, 1, 1,
0.420399, -0.1667229, 1.073531, 0, 0.1529412, 1, 1,
0.4204733, 0.5380276, 0.4506333, 0, 0.1490196, 1, 1,
0.4206094, -1.267205, 1.79419, 0, 0.1411765, 1, 1,
0.4224122, 0.9321471, 0.1812163, 0, 0.1372549, 1, 1,
0.4237215, 1.228642, -1.364728, 0, 0.1294118, 1, 1,
0.4274068, -0.7847291, 3.821722, 0, 0.1254902, 1, 1,
0.4297216, -1.754237, 3.096952, 0, 0.1176471, 1, 1,
0.4378996, -0.578086, 2.816287, 0, 0.1137255, 1, 1,
0.4400486, -1.438318, 1.761238, 0, 0.1058824, 1, 1,
0.4411993, -0.2686218, 1.979576, 0, 0.09803922, 1, 1,
0.441247, -1.80546, 2.124057, 0, 0.09411765, 1, 1,
0.4466087, -0.8194021, 2.268801, 0, 0.08627451, 1, 1,
0.4471862, 0.3438491, 0.1649221, 0, 0.08235294, 1, 1,
0.4519213, 0.1537574, 1.894802, 0, 0.07450981, 1, 1,
0.4525476, -0.1682939, 0.09788608, 0, 0.07058824, 1, 1,
0.4549407, -0.1836424, 2.491243, 0, 0.0627451, 1, 1,
0.4565647, 0.7043332, 2.784234, 0, 0.05882353, 1, 1,
0.4566423, -0.8821213, 2.241032, 0, 0.05098039, 1, 1,
0.4581441, -0.6059662, 2.070497, 0, 0.04705882, 1, 1,
0.4589857, 1.006269, 1.506763, 0, 0.03921569, 1, 1,
0.4662811, 1.168563, 1.458232, 0, 0.03529412, 1, 1,
0.4675706, 1.253386, -1.067389, 0, 0.02745098, 1, 1,
0.4794196, -0.6257777, 2.845156, 0, 0.02352941, 1, 1,
0.4800925, -1.580536, 3.875193, 0, 0.01568628, 1, 1,
0.4848977, -0.272142, 0.8974392, 0, 0.01176471, 1, 1,
0.4922258, -0.7631156, 3.029242, 0, 0.003921569, 1, 1,
0.4942054, 1.69495, 0.9611942, 0.003921569, 0, 1, 1,
0.4956883, -0.7706611, 2.803138, 0.007843138, 0, 1, 1,
0.5009417, -2.643501, 4.111185, 0.01568628, 0, 1, 1,
0.5011573, 1.506844, -0.6076475, 0.01960784, 0, 1, 1,
0.5049512, 1.390445, -0.3101822, 0.02745098, 0, 1, 1,
0.5096844, -1.769198, 2.600645, 0.03137255, 0, 1, 1,
0.5109618, -1.5973, 1.281142, 0.03921569, 0, 1, 1,
0.5116497, 0.3360971, -1.014465, 0.04313726, 0, 1, 1,
0.5157939, -0.1431353, 2.973562, 0.05098039, 0, 1, 1,
0.5168491, -1.305029, 4.325431, 0.05490196, 0, 1, 1,
0.5265595, -0.7924361, 1.481678, 0.0627451, 0, 1, 1,
0.5273608, -0.1974053, 2.174925, 0.06666667, 0, 1, 1,
0.5293748, 0.8728963, 1.620469, 0.07450981, 0, 1, 1,
0.5304439, 1.211798, -0.9613673, 0.07843138, 0, 1, 1,
0.5336952, -0.6702554, 3.77049, 0.08627451, 0, 1, 1,
0.5380842, 0.6413272, 0.0544281, 0.09019608, 0, 1, 1,
0.5396658, 2.375287, -0.5239404, 0.09803922, 0, 1, 1,
0.5420852, 0.4470406, 1.02647, 0.1058824, 0, 1, 1,
0.5456386, -0.7022867, 2.388098, 0.1098039, 0, 1, 1,
0.5515038, -0.3440581, 3.540231, 0.1176471, 0, 1, 1,
0.5526358, 0.1989797, 1.253969, 0.1215686, 0, 1, 1,
0.5541773, -0.1317411, 3.746076, 0.1294118, 0, 1, 1,
0.5597073, -0.3165477, 1.896653, 0.1333333, 0, 1, 1,
0.5620265, 0.1720536, 1.664055, 0.1411765, 0, 1, 1,
0.5631533, 0.01113347, 2.531071, 0.145098, 0, 1, 1,
0.5637841, 0.002558819, 1.915288, 0.1529412, 0, 1, 1,
0.5680118, -0.3834072, 2.674879, 0.1568628, 0, 1, 1,
0.5680565, 0.3427985, 1.526525, 0.1647059, 0, 1, 1,
0.5712562, 0.4710814, 1.664595, 0.1686275, 0, 1, 1,
0.5770061, 0.6527298, -0.2595512, 0.1764706, 0, 1, 1,
0.5772765, 0.694553, 0.6829991, 0.1803922, 0, 1, 1,
0.5795044, -0.1300662, 1.769795, 0.1882353, 0, 1, 1,
0.5813476, -3.639436, 3.669657, 0.1921569, 0, 1, 1,
0.5829017, 0.3451496, 1.655895, 0.2, 0, 1, 1,
0.5836887, -1.044218, 4.257421, 0.2078431, 0, 1, 1,
0.584282, -2.7183, 2.47892, 0.2117647, 0, 1, 1,
0.58611, -1.977712, 2.727876, 0.2196078, 0, 1, 1,
0.586789, 0.5183521, 1.904437, 0.2235294, 0, 1, 1,
0.5883136, -0.7961407, 2.94365, 0.2313726, 0, 1, 1,
0.5889086, 0.4569768, 0.6617295, 0.2352941, 0, 1, 1,
0.5986277, 1.004855, 0.7441214, 0.2431373, 0, 1, 1,
0.6039191, -0.8082076, 1.465683, 0.2470588, 0, 1, 1,
0.6062383, 1.111261, -0.07151759, 0.254902, 0, 1, 1,
0.6071565, -1.481663, 3.165888, 0.2588235, 0, 1, 1,
0.6111406, -0.123713, 4.582782, 0.2666667, 0, 1, 1,
0.6117008, 0.6027162, 0.7898302, 0.2705882, 0, 1, 1,
0.6130421, 0.3591359, 1.110008, 0.2784314, 0, 1, 1,
0.6167884, 0.6789141, 1.240244, 0.282353, 0, 1, 1,
0.6201245, 0.9878436, 1.412426, 0.2901961, 0, 1, 1,
0.6287133, -2.289492, 3.404795, 0.2941177, 0, 1, 1,
0.6316212, -0.2977043, 2.654312, 0.3019608, 0, 1, 1,
0.6366743, 0.1540117, 2.221698, 0.3098039, 0, 1, 1,
0.6393967, -0.5467023, 1.202788, 0.3137255, 0, 1, 1,
0.6409961, 0.03644457, 1.799131, 0.3215686, 0, 1, 1,
0.6422496, -1.750592, 3.32681, 0.3254902, 0, 1, 1,
0.6422747, 0.9130022, 0.4977943, 0.3333333, 0, 1, 1,
0.6429766, 0.05243023, 3.305718, 0.3372549, 0, 1, 1,
0.6430057, -0.954302, 2.377043, 0.345098, 0, 1, 1,
0.6502765, 0.4635472, 1.888009, 0.3490196, 0, 1, 1,
0.6529542, 0.6366366, 1.562172, 0.3568628, 0, 1, 1,
0.6575826, -1.488193, 2.779824, 0.3607843, 0, 1, 1,
0.6632819, 0.2180325, 0.2155582, 0.3686275, 0, 1, 1,
0.6673462, 0.7320805, -0.296643, 0.372549, 0, 1, 1,
0.6684116, -0.3129585, 2.889971, 0.3803922, 0, 1, 1,
0.67598, -0.02811077, 3.39454, 0.3843137, 0, 1, 1,
0.676488, 0.6595592, 0.2248317, 0.3921569, 0, 1, 1,
0.6824635, 1.225521, 2.290271, 0.3960784, 0, 1, 1,
0.6852963, 0.8941793, 2.467543, 0.4039216, 0, 1, 1,
0.6893767, -1.723558, 2.877526, 0.4117647, 0, 1, 1,
0.6903146, -0.1629384, 1.466945, 0.4156863, 0, 1, 1,
0.6946046, -1.52723, 4.184599, 0.4235294, 0, 1, 1,
0.6971363, -0.7169893, 3.851768, 0.427451, 0, 1, 1,
0.7048264, -1.119606, 3.541545, 0.4352941, 0, 1, 1,
0.7048504, 0.07724483, 0.5495584, 0.4392157, 0, 1, 1,
0.7114103, -1.874221, 2.957357, 0.4470588, 0, 1, 1,
0.7122953, -1.454531, 3.314734, 0.4509804, 0, 1, 1,
0.7165174, -0.4734016, 1.459848, 0.4588235, 0, 1, 1,
0.7183033, 0.2398983, 1.44851, 0.4627451, 0, 1, 1,
0.7219771, 0.6231187, 0.5650343, 0.4705882, 0, 1, 1,
0.7306459, 0.599063, -0.4091308, 0.4745098, 0, 1, 1,
0.737327, -1.613119, 2.498986, 0.4823529, 0, 1, 1,
0.7392066, 1.659388, 0.6888008, 0.4862745, 0, 1, 1,
0.74145, -1.235219, 2.268869, 0.4941176, 0, 1, 1,
0.7450502, -0.7572167, 1.707977, 0.5019608, 0, 1, 1,
0.7471104, 1.218018, 0.7722394, 0.5058824, 0, 1, 1,
0.7521766, 0.08462515, 1.567322, 0.5137255, 0, 1, 1,
0.752188, 0.8529872, 2.640996, 0.5176471, 0, 1, 1,
0.7543337, -0.3985586, 2.057966, 0.5254902, 0, 1, 1,
0.7546191, -1.342203, 4.274408, 0.5294118, 0, 1, 1,
0.7587035, 0.03113662, 2.552395, 0.5372549, 0, 1, 1,
0.7603959, 1.510488, -1.185927, 0.5411765, 0, 1, 1,
0.7608161, -0.7685444, 3.450583, 0.5490196, 0, 1, 1,
0.761029, 0.01255148, 2.661303, 0.5529412, 0, 1, 1,
0.7688468, -0.9364601, 2.146615, 0.5607843, 0, 1, 1,
0.7700236, 1.566935, 0.4823558, 0.5647059, 0, 1, 1,
0.771141, -0.2294846, 2.255525, 0.572549, 0, 1, 1,
0.7775397, -0.5288975, 3.304137, 0.5764706, 0, 1, 1,
0.7786232, -1.029557, 4.331763, 0.5843138, 0, 1, 1,
0.7795176, 0.2454133, 0.2068287, 0.5882353, 0, 1, 1,
0.7797539, 0.2244835, 2.272025, 0.5960785, 0, 1, 1,
0.7808394, -0.5191928, 2.048341, 0.6039216, 0, 1, 1,
0.7833071, 1.085673, -2.219972, 0.6078432, 0, 1, 1,
0.7847434, 1.564154, -0.5830061, 0.6156863, 0, 1, 1,
0.7873481, -0.2960939, 2.684577, 0.6196079, 0, 1, 1,
0.7913547, 0.7204145, 0.8082361, 0.627451, 0, 1, 1,
0.7919405, 0.929686, 1.048689, 0.6313726, 0, 1, 1,
0.7965077, -0.3720865, 0.3320979, 0.6392157, 0, 1, 1,
0.8001748, -0.7032465, 2.698692, 0.6431373, 0, 1, 1,
0.8029727, -1.861559, 3.280098, 0.6509804, 0, 1, 1,
0.8071287, 0.8194584, 1.647266, 0.654902, 0, 1, 1,
0.8118182, 0.5037305, 1.541078, 0.6627451, 0, 1, 1,
0.8121586, -1.850535, 1.437312, 0.6666667, 0, 1, 1,
0.814034, 0.01018079, 0.4656579, 0.6745098, 0, 1, 1,
0.8140754, 0.9124969, -0.637215, 0.6784314, 0, 1, 1,
0.8195969, -0.4814249, 2.509171, 0.6862745, 0, 1, 1,
0.822016, -0.12717, 3.053573, 0.6901961, 0, 1, 1,
0.8280887, 0.3733202, 0.1294325, 0.6980392, 0, 1, 1,
0.8316352, 0.2791365, 2.386665, 0.7058824, 0, 1, 1,
0.8346295, 1.232539, 0.4809695, 0.7098039, 0, 1, 1,
0.8387247, 2.110132, -0.3762644, 0.7176471, 0, 1, 1,
0.8387581, 0.4390776, -0.5199736, 0.7215686, 0, 1, 1,
0.8394248, 0.5103074, -0.2603915, 0.7294118, 0, 1, 1,
0.8408399, 0.1672337, 2.662708, 0.7333333, 0, 1, 1,
0.8531303, 0.07598308, 2.560231, 0.7411765, 0, 1, 1,
0.860823, -1.433542, 2.082516, 0.7450981, 0, 1, 1,
0.8619441, -1.289113, 2.651009, 0.7529412, 0, 1, 1,
0.862519, 0.64197, 1.754238, 0.7568628, 0, 1, 1,
0.8820117, 0.4641896, 2.20492, 0.7647059, 0, 1, 1,
0.8826042, -0.2674089, 1.604723, 0.7686275, 0, 1, 1,
0.8832993, -0.5518209, 2.095896, 0.7764706, 0, 1, 1,
0.8881285, 0.08256728, 0.9368339, 0.7803922, 0, 1, 1,
0.8918339, -1.337843, 2.120756, 0.7882353, 0, 1, 1,
0.9016774, 0.8436573, 0.8972611, 0.7921569, 0, 1, 1,
0.9017389, -0.6405078, 1.508909, 0.8, 0, 1, 1,
0.903725, 0.5211764, -0.8827513, 0.8078431, 0, 1, 1,
0.9042961, -0.6020967, 2.520729, 0.8117647, 0, 1, 1,
0.9046443, 0.7540051, 0.8673073, 0.8196079, 0, 1, 1,
0.9087076, 0.07873597, 0.9864142, 0.8235294, 0, 1, 1,
0.9089193, 0.7829546, 0.7276064, 0.8313726, 0, 1, 1,
0.9100894, 0.1872593, -0.6428553, 0.8352941, 0, 1, 1,
0.9154041, 1.207734, 1.289551, 0.8431373, 0, 1, 1,
0.9158403, 1.820668, 0.8008662, 0.8470588, 0, 1, 1,
0.9164739, -0.145663, 0.8522018, 0.854902, 0, 1, 1,
0.926282, 0.4789325, 2.299328, 0.8588235, 0, 1, 1,
0.9273798, -1.274338, 3.228685, 0.8666667, 0, 1, 1,
0.9300359, -0.03258662, 1.922719, 0.8705882, 0, 1, 1,
0.932835, 0.9709825, 0.4628036, 0.8784314, 0, 1, 1,
0.9383454, -0.4574223, 1.945337, 0.8823529, 0, 1, 1,
0.9505041, 1.236572, 0.3453603, 0.8901961, 0, 1, 1,
0.9509931, 0.9972804, 0.4643511, 0.8941177, 0, 1, 1,
0.9553465, -0.592214, 4.60944, 0.9019608, 0, 1, 1,
0.9562058, -1.636316, 1.779041, 0.9098039, 0, 1, 1,
0.9587606, 1.98168, 0.9744241, 0.9137255, 0, 1, 1,
0.9634463, -0.5028824, 4.49191, 0.9215686, 0, 1, 1,
0.9658146, -0.5852773, 2.436762, 0.9254902, 0, 1, 1,
0.9705707, 0.0111856, 1.742103, 0.9333333, 0, 1, 1,
0.9754893, -0.03870269, 0.9828275, 0.9372549, 0, 1, 1,
0.9847369, -1.019567, 1.517448, 0.945098, 0, 1, 1,
0.9868448, 2.522245, 0.7141476, 0.9490196, 0, 1, 1,
0.9927625, 0.2082493, 2.51271, 0.9568627, 0, 1, 1,
0.9931875, -0.2998008, 1.700989, 0.9607843, 0, 1, 1,
1.001857, 0.8309337, -0.04246138, 0.9686275, 0, 1, 1,
1.002468, 0.4683394, 1.329839, 0.972549, 0, 1, 1,
1.002865, 0.2692192, 0.01700363, 0.9803922, 0, 1, 1,
1.003338, -0.04778304, 0.4498821, 0.9843137, 0, 1, 1,
1.010795, -0.3623176, 2.108797, 0.9921569, 0, 1, 1,
1.014708, 0.4032476, 0.1115074, 0.9960784, 0, 1, 1,
1.016465, -0.3493993, 2.270923, 1, 0, 0.9960784, 1,
1.020828, -0.3393146, 1.176606, 1, 0, 0.9882353, 1,
1.021317, -1.594269, 1.458184, 1, 0, 0.9843137, 1,
1.0214, -0.2896188, 2.838485, 1, 0, 0.9764706, 1,
1.022436, -0.7483001, 2.119735, 1, 0, 0.972549, 1,
1.023328, -0.4244614, 2.549266, 1, 0, 0.9647059, 1,
1.025589, -1.334344, 1.612291, 1, 0, 0.9607843, 1,
1.03085, -0.3953065, 3.456526, 1, 0, 0.9529412, 1,
1.03347, -1.056182, 2.190072, 1, 0, 0.9490196, 1,
1.038452, -1.067516, 2.864622, 1, 0, 0.9411765, 1,
1.040439, 0.5099711, 1.33287, 1, 0, 0.9372549, 1,
1.04544, -1.221267, 2.63096, 1, 0, 0.9294118, 1,
1.062034, -0.7132217, 3.469248, 1, 0, 0.9254902, 1,
1.06307, -0.3590947, 3.702239, 1, 0, 0.9176471, 1,
1.091495, 0.5311002, 1.404867, 1, 0, 0.9137255, 1,
1.094155, 1.37613, 0.211585, 1, 0, 0.9058824, 1,
1.097034, -2.521232, 3.673988, 1, 0, 0.9019608, 1,
1.099922, 1.373668, 1.504037, 1, 0, 0.8941177, 1,
1.100377, 0.4697237, 1.497189, 1, 0, 0.8862745, 1,
1.10253, 0.5929529, 1.508606, 1, 0, 0.8823529, 1,
1.103076, 0.5342804, 0.9514154, 1, 0, 0.8745098, 1,
1.1086, 0.5222151, 0.3021797, 1, 0, 0.8705882, 1,
1.125557, 1.203897, -1.026571, 1, 0, 0.8627451, 1,
1.125931, 0.3544303, 1.427567, 1, 0, 0.8588235, 1,
1.130775, -0.4694693, 1.733964, 1, 0, 0.8509804, 1,
1.130775, 0.9031421, 0.637444, 1, 0, 0.8470588, 1,
1.132624, -1.260733, 3.317078, 1, 0, 0.8392157, 1,
1.134436, -0.04603682, 1.137672, 1, 0, 0.8352941, 1,
1.14228, -1.227418, 2.061862, 1, 0, 0.827451, 1,
1.147315, 0.357536, 1.390715, 1, 0, 0.8235294, 1,
1.148561, -0.5724173, 1.640116, 1, 0, 0.8156863, 1,
1.152841, -0.2603112, 2.79784, 1, 0, 0.8117647, 1,
1.154801, 0.2370653, 1.481343, 1, 0, 0.8039216, 1,
1.155232, 0.4348615, 2.617963, 1, 0, 0.7960784, 1,
1.159238, 0.5761131, -1.205491, 1, 0, 0.7921569, 1,
1.160254, 0.7680155, 0.225606, 1, 0, 0.7843137, 1,
1.168006, -0.7245644, 0.6971599, 1, 0, 0.7803922, 1,
1.17255, 0.07496183, 1.612352, 1, 0, 0.772549, 1,
1.17862, 0.02432901, 1.085837, 1, 0, 0.7686275, 1,
1.181018, 0.4509547, 1.051628, 1, 0, 0.7607843, 1,
1.199903, 0.6663332, 0.654171, 1, 0, 0.7568628, 1,
1.205028, -1.382119, 1.5894, 1, 0, 0.7490196, 1,
1.21142, 0.4104998, -1.602268, 1, 0, 0.7450981, 1,
1.215495, 0.8094038, 1.023268, 1, 0, 0.7372549, 1,
1.216521, -0.2512494, 1.472912, 1, 0, 0.7333333, 1,
1.221416, -1.804859, 3.84542, 1, 0, 0.7254902, 1,
1.223012, 0.2524142, 0.6021687, 1, 0, 0.7215686, 1,
1.223548, -1.504774, 1.593895, 1, 0, 0.7137255, 1,
1.224506, -0.01167363, 2.245792, 1, 0, 0.7098039, 1,
1.234868, -1.233947, 3.672299, 1, 0, 0.7019608, 1,
1.238181, -0.1890032, 1.773894, 1, 0, 0.6941177, 1,
1.251897, 0.1700982, 3.260074, 1, 0, 0.6901961, 1,
1.254542, -1.255498, 3.678104, 1, 0, 0.682353, 1,
1.259051, -0.1638953, 1.931118, 1, 0, 0.6784314, 1,
1.262325, -0.3464235, 2.610852, 1, 0, 0.6705883, 1,
1.264019, -0.4673663, 0.8209416, 1, 0, 0.6666667, 1,
1.26487, 0.930943, -0.4794571, 1, 0, 0.6588235, 1,
1.266262, 0.5452363, 1.163519, 1, 0, 0.654902, 1,
1.266744, 0.554538, 1.304631, 1, 0, 0.6470588, 1,
1.275746, 0.7357777, 1.374982, 1, 0, 0.6431373, 1,
1.285114, 0.7705128, 0.730291, 1, 0, 0.6352941, 1,
1.288482, -0.273658, 2.531178, 1, 0, 0.6313726, 1,
1.297433, -0.40963, 0.7466652, 1, 0, 0.6235294, 1,
1.303043, -0.9817039, 3.130607, 1, 0, 0.6196079, 1,
1.303933, 0.2338276, 1.294955, 1, 0, 0.6117647, 1,
1.306063, 1.522099, 0.7648354, 1, 0, 0.6078432, 1,
1.309191, -0.1019164, 0.4232149, 1, 0, 0.6, 1,
1.319222, -0.693651, 1.112935, 1, 0, 0.5921569, 1,
1.319737, -1.473985, 1.67698, 1, 0, 0.5882353, 1,
1.321786, -0.7196604, 3.8834, 1, 0, 0.5803922, 1,
1.326981, 0.7397632, -0.3081489, 1, 0, 0.5764706, 1,
1.336261, 0.1880495, 1.311526, 1, 0, 0.5686275, 1,
1.345198, 0.1381633, -0.4776763, 1, 0, 0.5647059, 1,
1.361419, -0.2900559, 1.750826, 1, 0, 0.5568628, 1,
1.362556, -0.8495054, 0.649327, 1, 0, 0.5529412, 1,
1.369417, -0.9124916, 1.762, 1, 0, 0.5450981, 1,
1.374127, 0.6868352, 1.925146, 1, 0, 0.5411765, 1,
1.374612, -0.8326746, 1.713537, 1, 0, 0.5333334, 1,
1.389687, -1.125245, 1.351989, 1, 0, 0.5294118, 1,
1.394543, -0.2686508, 1.604391, 1, 0, 0.5215687, 1,
1.399743, -0.5817745, 1.58865, 1, 0, 0.5176471, 1,
1.400707, -0.5794651, -0.2040682, 1, 0, 0.509804, 1,
1.401858, 2.096414, 4.157187, 1, 0, 0.5058824, 1,
1.40245, -0.1642277, 2.492593, 1, 0, 0.4980392, 1,
1.408975, 0.6319694, 2.272509, 1, 0, 0.4901961, 1,
1.420763, -0.02260148, 2.13464, 1, 0, 0.4862745, 1,
1.421928, 0.7289862, 1.459281, 1, 0, 0.4784314, 1,
1.424717, -0.1102744, 1.479212, 1, 0, 0.4745098, 1,
1.426953, -1.065362, 1.535601, 1, 0, 0.4666667, 1,
1.435855, -0.2781723, 2.184436, 1, 0, 0.4627451, 1,
1.447095, 0.916892, 1.202396, 1, 0, 0.454902, 1,
1.461167, -0.260482, 1.240505, 1, 0, 0.4509804, 1,
1.464704, 2.453988, 0.5186824, 1, 0, 0.4431373, 1,
1.474041, 0.4597531, 1.311409, 1, 0, 0.4392157, 1,
1.477865, -0.8506889, 2.97562, 1, 0, 0.4313726, 1,
1.488137, -0.6247382, 3.613152, 1, 0, 0.427451, 1,
1.494928, 1.070125, 0.985833, 1, 0, 0.4196078, 1,
1.498249, 0.0211012, 2.364578, 1, 0, 0.4156863, 1,
1.501722, 0.1463853, 1.067577, 1, 0, 0.4078431, 1,
1.502678, 0.9650437, 1.828767, 1, 0, 0.4039216, 1,
1.505276, 0.6050545, 1.714324, 1, 0, 0.3960784, 1,
1.509479, -2.156845, 2.408044, 1, 0, 0.3882353, 1,
1.509526, 0.729517, 0.7293707, 1, 0, 0.3843137, 1,
1.513587, 0.608441, 2.114731, 1, 0, 0.3764706, 1,
1.554536, 1.576559, 1.880195, 1, 0, 0.372549, 1,
1.566267, 0.6275108, 1.260113, 1, 0, 0.3647059, 1,
1.580253, -0.7169059, 1.675036, 1, 0, 0.3607843, 1,
1.589313, -0.8914074, 2.791035, 1, 0, 0.3529412, 1,
1.593621, -1.204138, 3.663757, 1, 0, 0.3490196, 1,
1.595411, 0.6500354, 0.4904156, 1, 0, 0.3411765, 1,
1.604579, 0.9661652, -0.1902615, 1, 0, 0.3372549, 1,
1.631538, -0.2822162, 2.514106, 1, 0, 0.3294118, 1,
1.637193, 0.1950791, 3.021344, 1, 0, 0.3254902, 1,
1.647505, 1.632403, 1.019911, 1, 0, 0.3176471, 1,
1.665186, -0.5075744, 3.057857, 1, 0, 0.3137255, 1,
1.690618, 1.319298, 1.796831, 1, 0, 0.3058824, 1,
1.696011, -1.027152, 0.09817589, 1, 0, 0.2980392, 1,
1.698409, 0.1369074, 0.8131562, 1, 0, 0.2941177, 1,
1.70873, -0.0416564, 1.653033, 1, 0, 0.2862745, 1,
1.717278, 1.696179, 2.364333, 1, 0, 0.282353, 1,
1.717443, -0.5585399, 1.253746, 1, 0, 0.2745098, 1,
1.726909, -0.046514, 1.754384, 1, 0, 0.2705882, 1,
1.727193, 0.1801706, 0.1181228, 1, 0, 0.2627451, 1,
1.729366, -0.1495159, 3.32969, 1, 0, 0.2588235, 1,
1.761102, 0.6146952, -0.2421904, 1, 0, 0.2509804, 1,
1.769264, -1.151619, 5.41598, 1, 0, 0.2470588, 1,
1.773006, -1.774923, 2.902732, 1, 0, 0.2392157, 1,
1.791996, -0.5133187, 0.650549, 1, 0, 0.2352941, 1,
1.793624, 1.386181, -1.584343, 1, 0, 0.227451, 1,
1.799846, 1.598254, 0.7817055, 1, 0, 0.2235294, 1,
1.812549, -0.7255522, 2.908373, 1, 0, 0.2156863, 1,
1.835883, -0.2651159, 3.583127, 1, 0, 0.2117647, 1,
1.87088, 1.07008, -0.6027035, 1, 0, 0.2039216, 1,
1.888216, -0.5561856, 1.518066, 1, 0, 0.1960784, 1,
1.888344, 0.1056904, 1.269449, 1, 0, 0.1921569, 1,
1.890046, 1.852448, 3.218154, 1, 0, 0.1843137, 1,
1.904046, -2.725852, 3.041235, 1, 0, 0.1803922, 1,
1.922014, -0.1448999, 1.619536, 1, 0, 0.172549, 1,
1.924025, 0.171185, 2.067243, 1, 0, 0.1686275, 1,
1.924743, 2.174931, 0.4174048, 1, 0, 0.1607843, 1,
1.925217, -0.7601533, 2.646054, 1, 0, 0.1568628, 1,
1.955034, -1.140291, 3.724038, 1, 0, 0.1490196, 1,
1.966865, -2.437864, 3.931016, 1, 0, 0.145098, 1,
1.987507, 0.5393506, 0.9684889, 1, 0, 0.1372549, 1,
2.022044, -0.2973356, 2.360349, 1, 0, 0.1333333, 1,
2.036692, 0.3640884, 2.857689, 1, 0, 0.1254902, 1,
2.087643, -2.152214, 2.195669, 1, 0, 0.1215686, 1,
2.091567, -0.2515345, 1.917142, 1, 0, 0.1137255, 1,
2.098101, -0.1084745, 2.352309, 1, 0, 0.1098039, 1,
2.111506, 1.565895, 2.451313, 1, 0, 0.1019608, 1,
2.154071, 0.8493498, 1.295357, 1, 0, 0.09411765, 1,
2.171795, -0.5897927, 1.332341, 1, 0, 0.09019608, 1,
2.201016, 0.1939616, 1.638713, 1, 0, 0.08235294, 1,
2.246794, -0.6774209, 1.40459, 1, 0, 0.07843138, 1,
2.249028, 0.1648453, 0.8639799, 1, 0, 0.07058824, 1,
2.293206, -0.3352138, 1.243877, 1, 0, 0.06666667, 1,
2.3104, 0.4639014, 1.330525, 1, 0, 0.05882353, 1,
2.322832, 1.604585, -0.1283933, 1, 0, 0.05490196, 1,
2.322909, 0.4065354, 1.59068, 1, 0, 0.04705882, 1,
2.357226, -1.159796, 1.765204, 1, 0, 0.04313726, 1,
2.394888, 1.338647, 1.108593, 1, 0, 0.03529412, 1,
2.436579, 1.237135, 1.750226, 1, 0, 0.03137255, 1,
2.47073, 0.7757668, 2.323503, 1, 0, 0.02352941, 1,
2.482344, 1.295613, 1.674843, 1, 0, 0.01960784, 1,
2.485467, 0.4965037, 0.8335143, 1, 0, 0.01176471, 1,
2.49519, -0.4250224, -0.07060483, 1, 0, 0.007843138, 1
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
-0.5024018, -4.803126, -7.071598, 0, -0.5, 0.5, 0.5,
-0.5024018, -4.803126, -7.071598, 1, -0.5, 0.5, 0.5,
-0.5024018, -4.803126, -7.071598, 1, 1.5, 0.5, 0.5,
-0.5024018, -4.803126, -7.071598, 0, 1.5, 0.5, 0.5
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
-4.516177, -0.2067198, -7.071598, 0, -0.5, 0.5, 0.5,
-4.516177, -0.2067198, -7.071598, 1, -0.5, 0.5, 0.5,
-4.516177, -0.2067198, -7.071598, 1, 1.5, 0.5, 0.5,
-4.516177, -0.2067198, -7.071598, 0, 1.5, 0.5, 0.5
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
-4.516177, -4.803126, 0.07712674, 0, -0.5, 0.5, 0.5,
-4.516177, -4.803126, 0.07712674, 1, -0.5, 0.5, 0.5,
-4.516177, -4.803126, 0.07712674, 1, 1.5, 0.5, 0.5,
-4.516177, -4.803126, 0.07712674, 0, 1.5, 0.5, 0.5
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
-3, -3.742417, -5.421892,
2, -3.742417, -5.421892,
-3, -3.742417, -5.421892,
-3, -3.919202, -5.696843,
-2, -3.742417, -5.421892,
-2, -3.919202, -5.696843,
-1, -3.742417, -5.421892,
-1, -3.919202, -5.696843,
0, -3.742417, -5.421892,
0, -3.919202, -5.696843,
1, -3.742417, -5.421892,
1, -3.919202, -5.696843,
2, -3.742417, -5.421892,
2, -3.919202, -5.696843
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
-3, -4.272772, -6.246745, 0, -0.5, 0.5, 0.5,
-3, -4.272772, -6.246745, 1, -0.5, 0.5, 0.5,
-3, -4.272772, -6.246745, 1, 1.5, 0.5, 0.5,
-3, -4.272772, -6.246745, 0, 1.5, 0.5, 0.5,
-2, -4.272772, -6.246745, 0, -0.5, 0.5, 0.5,
-2, -4.272772, -6.246745, 1, -0.5, 0.5, 0.5,
-2, -4.272772, -6.246745, 1, 1.5, 0.5, 0.5,
-2, -4.272772, -6.246745, 0, 1.5, 0.5, 0.5,
-1, -4.272772, -6.246745, 0, -0.5, 0.5, 0.5,
-1, -4.272772, -6.246745, 1, -0.5, 0.5, 0.5,
-1, -4.272772, -6.246745, 1, 1.5, 0.5, 0.5,
-1, -4.272772, -6.246745, 0, 1.5, 0.5, 0.5,
0, -4.272772, -6.246745, 0, -0.5, 0.5, 0.5,
0, -4.272772, -6.246745, 1, -0.5, 0.5, 0.5,
0, -4.272772, -6.246745, 1, 1.5, 0.5, 0.5,
0, -4.272772, -6.246745, 0, 1.5, 0.5, 0.5,
1, -4.272772, -6.246745, 0, -0.5, 0.5, 0.5,
1, -4.272772, -6.246745, 1, -0.5, 0.5, 0.5,
1, -4.272772, -6.246745, 1, 1.5, 0.5, 0.5,
1, -4.272772, -6.246745, 0, 1.5, 0.5, 0.5,
2, -4.272772, -6.246745, 0, -0.5, 0.5, 0.5,
2, -4.272772, -6.246745, 1, -0.5, 0.5, 0.5,
2, -4.272772, -6.246745, 1, 1.5, 0.5, 0.5,
2, -4.272772, -6.246745, 0, 1.5, 0.5, 0.5
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
-3.589921, -3, -5.421892,
-3.589921, 3, -5.421892,
-3.589921, -3, -5.421892,
-3.744297, -3, -5.696843,
-3.589921, -2, -5.421892,
-3.744297, -2, -5.696843,
-3.589921, -1, -5.421892,
-3.744297, -1, -5.696843,
-3.589921, 0, -5.421892,
-3.744297, 0, -5.696843,
-3.589921, 1, -5.421892,
-3.744297, 1, -5.696843,
-3.589921, 2, -5.421892,
-3.744297, 2, -5.696843,
-3.589921, 3, -5.421892,
-3.744297, 3, -5.696843
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
-4.053049, -3, -6.246745, 0, -0.5, 0.5, 0.5,
-4.053049, -3, -6.246745, 1, -0.5, 0.5, 0.5,
-4.053049, -3, -6.246745, 1, 1.5, 0.5, 0.5,
-4.053049, -3, -6.246745, 0, 1.5, 0.5, 0.5,
-4.053049, -2, -6.246745, 0, -0.5, 0.5, 0.5,
-4.053049, -2, -6.246745, 1, -0.5, 0.5, 0.5,
-4.053049, -2, -6.246745, 1, 1.5, 0.5, 0.5,
-4.053049, -2, -6.246745, 0, 1.5, 0.5, 0.5,
-4.053049, -1, -6.246745, 0, -0.5, 0.5, 0.5,
-4.053049, -1, -6.246745, 1, -0.5, 0.5, 0.5,
-4.053049, -1, -6.246745, 1, 1.5, 0.5, 0.5,
-4.053049, -1, -6.246745, 0, 1.5, 0.5, 0.5,
-4.053049, 0, -6.246745, 0, -0.5, 0.5, 0.5,
-4.053049, 0, -6.246745, 1, -0.5, 0.5, 0.5,
-4.053049, 0, -6.246745, 1, 1.5, 0.5, 0.5,
-4.053049, 0, -6.246745, 0, 1.5, 0.5, 0.5,
-4.053049, 1, -6.246745, 0, -0.5, 0.5, 0.5,
-4.053049, 1, -6.246745, 1, -0.5, 0.5, 0.5,
-4.053049, 1, -6.246745, 1, 1.5, 0.5, 0.5,
-4.053049, 1, -6.246745, 0, 1.5, 0.5, 0.5,
-4.053049, 2, -6.246745, 0, -0.5, 0.5, 0.5,
-4.053049, 2, -6.246745, 1, -0.5, 0.5, 0.5,
-4.053049, 2, -6.246745, 1, 1.5, 0.5, 0.5,
-4.053049, 2, -6.246745, 0, 1.5, 0.5, 0.5,
-4.053049, 3, -6.246745, 0, -0.5, 0.5, 0.5,
-4.053049, 3, -6.246745, 1, -0.5, 0.5, 0.5,
-4.053049, 3, -6.246745, 1, 1.5, 0.5, 0.5,
-4.053049, 3, -6.246745, 0, 1.5, 0.5, 0.5
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
-3.589921, -3.742417, -4,
-3.589921, -3.742417, 4,
-3.589921, -3.742417, -4,
-3.744297, -3.919202, -4,
-3.589921, -3.742417, -2,
-3.744297, -3.919202, -2,
-3.589921, -3.742417, 0,
-3.744297, -3.919202, 0,
-3.589921, -3.742417, 2,
-3.744297, -3.919202, 2,
-3.589921, -3.742417, 4,
-3.744297, -3.919202, 4
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
-4.053049, -4.272772, -4, 0, -0.5, 0.5, 0.5,
-4.053049, -4.272772, -4, 1, -0.5, 0.5, 0.5,
-4.053049, -4.272772, -4, 1, 1.5, 0.5, 0.5,
-4.053049, -4.272772, -4, 0, 1.5, 0.5, 0.5,
-4.053049, -4.272772, -2, 0, -0.5, 0.5, 0.5,
-4.053049, -4.272772, -2, 1, -0.5, 0.5, 0.5,
-4.053049, -4.272772, -2, 1, 1.5, 0.5, 0.5,
-4.053049, -4.272772, -2, 0, 1.5, 0.5, 0.5,
-4.053049, -4.272772, 0, 0, -0.5, 0.5, 0.5,
-4.053049, -4.272772, 0, 1, -0.5, 0.5, 0.5,
-4.053049, -4.272772, 0, 1, 1.5, 0.5, 0.5,
-4.053049, -4.272772, 0, 0, 1.5, 0.5, 0.5,
-4.053049, -4.272772, 2, 0, -0.5, 0.5, 0.5,
-4.053049, -4.272772, 2, 1, -0.5, 0.5, 0.5,
-4.053049, -4.272772, 2, 1, 1.5, 0.5, 0.5,
-4.053049, -4.272772, 2, 0, 1.5, 0.5, 0.5,
-4.053049, -4.272772, 4, 0, -0.5, 0.5, 0.5,
-4.053049, -4.272772, 4, 1, -0.5, 0.5, 0.5,
-4.053049, -4.272772, 4, 1, 1.5, 0.5, 0.5,
-4.053049, -4.272772, 4, 0, 1.5, 0.5, 0.5
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
-3.589921, -3.742417, -5.421892,
-3.589921, 3.328978, -5.421892,
-3.589921, -3.742417, 5.576146,
-3.589921, 3.328978, 5.576146,
-3.589921, -3.742417, -5.421892,
-3.589921, -3.742417, 5.576146,
-3.589921, 3.328978, -5.421892,
-3.589921, 3.328978, 5.576146,
-3.589921, -3.742417, -5.421892,
2.585117, -3.742417, -5.421892,
-3.589921, -3.742417, 5.576146,
2.585117, -3.742417, 5.576146,
-3.589921, 3.328978, -5.421892,
2.585117, 3.328978, -5.421892,
-3.589921, 3.328978, 5.576146,
2.585117, 3.328978, 5.576146,
2.585117, -3.742417, -5.421892,
2.585117, 3.328978, -5.421892,
2.585117, -3.742417, 5.576146,
2.585117, 3.328978, 5.576146,
2.585117, -3.742417, -5.421892,
2.585117, -3.742417, 5.576146,
2.585117, 3.328978, -5.421892,
2.585117, 3.328978, 5.576146
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
var radius = 7.721377;
var distance = 34.35328;
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
mvMatrix.translate( 0.5024018, 0.2067198, -0.07712674 );
mvMatrix.scale( 1.351976, 1.180602, 0.7590904 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.35328);
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
Isoxathion<-read.table("Isoxathion.xyz")
```

```
## Error in read.table("Isoxathion.xyz"): no lines available in input
```

```r
x<-Isoxathion$V2
```

```
## Error in eval(expr, envir, enclos): object 'Isoxathion' not found
```

```r
y<-Isoxathion$V3
```

```
## Error in eval(expr, envir, enclos): object 'Isoxathion' not found
```

```r
z<-Isoxathion$V4
```

```
## Error in eval(expr, envir, enclos): object 'Isoxathion' not found
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
-3.499993, 0.7581794, -0.942952, 0, 0, 1, 1, 1,
-3.25678, 1.881452, -1.640375, 1, 0, 0, 1, 1,
-2.668408, 1.09237, -1.606214, 1, 0, 0, 1, 1,
-2.605694, 0.1704473, -1.785007, 1, 0, 0, 1, 1,
-2.528364, -0.1042262, -3.274396, 1, 0, 0, 1, 1,
-2.515198, 0.71112, -0.9878801, 1, 0, 0, 1, 1,
-2.464555, -0.9305683, -3.108602, 0, 0, 0, 1, 1,
-2.463619, 1.713229, -1.097749, 0, 0, 0, 1, 1,
-2.434992, 2.393656, -0.6821873, 0, 0, 0, 1, 1,
-2.434309, -1.961383, -2.53318, 0, 0, 0, 1, 1,
-2.430528, -0.02579676, -0.9644294, 0, 0, 0, 1, 1,
-2.358609, 1.624049, -0.3775834, 0, 0, 0, 1, 1,
-2.347465, 1.533457, -1.152064, 0, 0, 0, 1, 1,
-2.329115, 0.09722241, -2.650754, 1, 1, 1, 1, 1,
-2.295684, 0.3309462, -0.9880652, 1, 1, 1, 1, 1,
-2.199197, 0.5521888, -0.6294609, 1, 1, 1, 1, 1,
-2.183871, 1.439618, -0.8008338, 1, 1, 1, 1, 1,
-2.159052, 0.9334266, -1.339706, 1, 1, 1, 1, 1,
-2.144783, 0.1380659, -1.258658, 1, 1, 1, 1, 1,
-2.133566, 1.676925, -0.2290823, 1, 1, 1, 1, 1,
-2.128372, -0.06868828, -1.610818, 1, 1, 1, 1, 1,
-2.111544, 0.7815019, 0.6113036, 1, 1, 1, 1, 1,
-2.020598, 0.03199418, -1.094662, 1, 1, 1, 1, 1,
-2.010386, -0.4852898, -2.089983, 1, 1, 1, 1, 1,
-1.956755, -1.061499, -1.628136, 1, 1, 1, 1, 1,
-1.947324, -2.008361, -2.733674, 1, 1, 1, 1, 1,
-1.927163, -1.650864, -1.717494, 1, 1, 1, 1, 1,
-1.914066, -0.1573033, -3.130095, 1, 1, 1, 1, 1,
-1.907436, -0.9442146, -1.823364, 0, 0, 1, 1, 1,
-1.893708, 1.480952, 0.7649339, 1, 0, 0, 1, 1,
-1.892713, 2.135582, 0.281894, 1, 0, 0, 1, 1,
-1.883358, -1.735956, -3.962119, 1, 0, 0, 1, 1,
-1.861063, 1.018899, -0.8502343, 1, 0, 0, 1, 1,
-1.82763, -1.352927, 0.6319183, 1, 0, 0, 1, 1,
-1.823048, -0.4515161, -2.711638, 0, 0, 0, 1, 1,
-1.809353, -1.843885, -1.721927, 0, 0, 0, 1, 1,
-1.793065, -0.8299372, -1.816133, 0, 0, 0, 1, 1,
-1.776281, 0.8516096, -1.097244, 0, 0, 0, 1, 1,
-1.775742, -0.5676659, -1.890136, 0, 0, 0, 1, 1,
-1.754201, 0.7939996, -0.7542101, 0, 0, 0, 1, 1,
-1.720562, -0.2139618, -1.71602, 0, 0, 0, 1, 1,
-1.71666, -1.806955, -3.156451, 1, 1, 1, 1, 1,
-1.702659, 1.5633, 1.783496, 1, 1, 1, 1, 1,
-1.675325, 0.3598286, -0.637047, 1, 1, 1, 1, 1,
-1.665234, 0.2731477, -0.6487702, 1, 1, 1, 1, 1,
-1.658445, -0.7769942, -2.795003, 1, 1, 1, 1, 1,
-1.649728, -0.9567276, -1.517704, 1, 1, 1, 1, 1,
-1.643818, -2.386541, -2.199675, 1, 1, 1, 1, 1,
-1.633929, -1.776986, -3.168944, 1, 1, 1, 1, 1,
-1.633044, 1.956264, 0.7881646, 1, 1, 1, 1, 1,
-1.629601, -0.3541065, -1.971469, 1, 1, 1, 1, 1,
-1.629399, -0.8683235, -1.790616, 1, 1, 1, 1, 1,
-1.62031, 0.1038682, -2.284143, 1, 1, 1, 1, 1,
-1.615074, -1.174147, -2.771127, 1, 1, 1, 1, 1,
-1.605915, 1.306232, 0.931748, 1, 1, 1, 1, 1,
-1.592342, -0.992259, -0.6695203, 1, 1, 1, 1, 1,
-1.581884, 1.237008, -0.2296321, 0, 0, 1, 1, 1,
-1.564804, -1.757695, -2.119352, 1, 0, 0, 1, 1,
-1.560199, 0.8865052, -0.9182537, 1, 0, 0, 1, 1,
-1.558925, 1.750085, 2.061782, 1, 0, 0, 1, 1,
-1.558924, 0.7413757, -0.5481005, 1, 0, 0, 1, 1,
-1.555462, -0.9614444, -1.727409, 1, 0, 0, 1, 1,
-1.554294, -0.9594826, -2.490377, 0, 0, 0, 1, 1,
-1.546388, 0.4806144, -1.111224, 0, 0, 0, 1, 1,
-1.54368, -0.4240145, -2.089013, 0, 0, 0, 1, 1,
-1.526644, 0.3296438, 0.2696552, 0, 0, 0, 1, 1,
-1.506747, 0.6513607, 0.5773395, 0, 0, 0, 1, 1,
-1.506243, 1.214041, 0.1761673, 0, 0, 0, 1, 1,
-1.484151, -0.6811346, -1.955755, 0, 0, 0, 1, 1,
-1.482587, -0.048921, -0.04859835, 1, 1, 1, 1, 1,
-1.480637, 1.564794, 1.039671, 1, 1, 1, 1, 1,
-1.455862, 0.9140248, -0.8679951, 1, 1, 1, 1, 1,
-1.446431, 0.1073305, -1.388818, 1, 1, 1, 1, 1,
-1.43845, 0.8720108, 0.6785952, 1, 1, 1, 1, 1,
-1.438358, 0.6198468, -0.6509331, 1, 1, 1, 1, 1,
-1.437983, 2.020012, -1.289621, 1, 1, 1, 1, 1,
-1.432623, 0.1630544, -1.513758, 1, 1, 1, 1, 1,
-1.428156, 1.089676, -1.679337, 1, 1, 1, 1, 1,
-1.417992, 0.2751557, -2.471729, 1, 1, 1, 1, 1,
-1.417786, -0.3576319, -1.637233, 1, 1, 1, 1, 1,
-1.396716, -1.865287, -1.800903, 1, 1, 1, 1, 1,
-1.389044, -0.04921179, -1.265607, 1, 1, 1, 1, 1,
-1.386307, -0.02190224, -1.109016, 1, 1, 1, 1, 1,
-1.384313, 0.610888, -1.383637, 1, 1, 1, 1, 1,
-1.375707, 0.8392605, -0.7125698, 0, 0, 1, 1, 1,
-1.374594, -0.4316804, -2.153692, 1, 0, 0, 1, 1,
-1.356137, 0.5407329, -1.613076, 1, 0, 0, 1, 1,
-1.352443, 0.7153908, -0.9279971, 1, 0, 0, 1, 1,
-1.339334, -1.605508, -2.992062, 1, 0, 0, 1, 1,
-1.337638, 0.3909466, -2.335302, 1, 0, 0, 1, 1,
-1.336294, -0.4341603, -2.201937, 0, 0, 0, 1, 1,
-1.331858, -0.02534886, -1.522907, 0, 0, 0, 1, 1,
-1.331663, -1.640897, -3.240582, 0, 0, 0, 1, 1,
-1.327987, 0.3667495, -2.371495, 0, 0, 0, 1, 1,
-1.322274, -0.4952558, -1.887226, 0, 0, 0, 1, 1,
-1.320398, -0.5877302, -1.294142, 0, 0, 0, 1, 1,
-1.300776, -0.1630966, -3.115008, 0, 0, 0, 1, 1,
-1.299487, -0.6125835, -1.850295, 1, 1, 1, 1, 1,
-1.298827, -0.6772135, -2.759366, 1, 1, 1, 1, 1,
-1.298019, 0.2929463, -0.3013235, 1, 1, 1, 1, 1,
-1.290967, 1.253435, -2.323454, 1, 1, 1, 1, 1,
-1.28461, 1.219699, -0.3319674, 1, 1, 1, 1, 1,
-1.27385, -1.039938, -1.192984, 1, 1, 1, 1, 1,
-1.266258, -0.1021601, -1.414898, 1, 1, 1, 1, 1,
-1.262478, 0.1647028, -0.4980135, 1, 1, 1, 1, 1,
-1.251373, -0.421674, 0.3101385, 1, 1, 1, 1, 1,
-1.242488, -0.463751, -1.214189, 1, 1, 1, 1, 1,
-1.240026, 1.164223, -0.8472425, 1, 1, 1, 1, 1,
-1.234396, -0.2175248, -1.820868, 1, 1, 1, 1, 1,
-1.224636, 0.209295, -1.639561, 1, 1, 1, 1, 1,
-1.212188, 0.09887994, -1.748653, 1, 1, 1, 1, 1,
-1.211959, 0.5502104, -0.5871816, 1, 1, 1, 1, 1,
-1.207324, 1.111458, -0.721669, 0, 0, 1, 1, 1,
-1.206005, 1.451993, 0.2678423, 1, 0, 0, 1, 1,
-1.179316, -0.6326075, -2.29191, 1, 0, 0, 1, 1,
-1.176814, 1.573611, 1.087824, 1, 0, 0, 1, 1,
-1.176721, -0.5017967, -2.441085, 1, 0, 0, 1, 1,
-1.176659, -0.2607346, -1.915141, 1, 0, 0, 1, 1,
-1.16689, -0.2070259, -2.994164, 0, 0, 0, 1, 1,
-1.159902, 0.6103802, -2.306742, 0, 0, 0, 1, 1,
-1.15342, -0.1668148, -1.586164, 0, 0, 0, 1, 1,
-1.152267, -0.3711923, -3.187815, 0, 0, 0, 1, 1,
-1.147952, 0.4557135, 0.4900526, 0, 0, 0, 1, 1,
-1.143802, -0.2132262, -1.89162, 0, 0, 0, 1, 1,
-1.136719, 1.237942, 0.2131266, 0, 0, 0, 1, 1,
-1.133568, -0.3224931, -0.1327272, 1, 1, 1, 1, 1,
-1.12782, 1.414644, -1.750286, 1, 1, 1, 1, 1,
-1.12729, -0.3898762, -1.668436, 1, 1, 1, 1, 1,
-1.119846, 1.274373, -0.04980252, 1, 1, 1, 1, 1,
-1.108941, -0.1949977, 0.5775292, 1, 1, 1, 1, 1,
-1.10868, -0.8724056, -0.9785364, 1, 1, 1, 1, 1,
-1.108249, 0.1026862, -1.603525, 1, 1, 1, 1, 1,
-1.102617, -1.238723, -4.337516, 1, 1, 1, 1, 1,
-1.102071, 0.5463355, 0.2570554, 1, 1, 1, 1, 1,
-1.095993, -0.3528412, -2.183692, 1, 1, 1, 1, 1,
-1.082217, -0.676107, -0.9813755, 1, 1, 1, 1, 1,
-1.074412, 0.271342, -0.6682414, 1, 1, 1, 1, 1,
-1.066551, -0.3688063, -1.506694, 1, 1, 1, 1, 1,
-1.065366, -1.140243, -2.50519, 1, 1, 1, 1, 1,
-1.063258, 0.3118199, -1.220648, 1, 1, 1, 1, 1,
-1.063184, 0.07956649, -2.64005, 0, 0, 1, 1, 1,
-1.062872, -0.1281876, -1.623824, 1, 0, 0, 1, 1,
-1.05763, 0.420389, -0.3350624, 1, 0, 0, 1, 1,
-1.057431, -0.07565825, 1.123219, 1, 0, 0, 1, 1,
-1.051424, 0.0119293, -1.373499, 1, 0, 0, 1, 1,
-1.043968, -0.3262142, -2.874604, 1, 0, 0, 1, 1,
-1.041631, -1.318796, -2.568332, 0, 0, 0, 1, 1,
-1.040883, -0.04653017, -0.8579692, 0, 0, 0, 1, 1,
-1.039591, 0.4291294, -1.384762, 0, 0, 0, 1, 1,
-1.034114, -1.247713, -1.669901, 0, 0, 0, 1, 1,
-1.031953, 1.225892, -0.2506541, 0, 0, 0, 1, 1,
-1.031792, 0.5054595, -1.953635, 0, 0, 0, 1, 1,
-1.027682, -0.06547903, -2.563713, 0, 0, 0, 1, 1,
-1.023645, -0.9334174, -2.537731, 1, 1, 1, 1, 1,
-1.019559, -0.08545508, -3.419338, 1, 1, 1, 1, 1,
-1.014405, 1.083117, -1.466807, 1, 1, 1, 1, 1,
-1.009773, 1.750541, -1.202451, 1, 1, 1, 1, 1,
-1.008062, -0.5927923, -2.198398, 1, 1, 1, 1, 1,
-1.007892, -0.9912131, -4.084146, 1, 1, 1, 1, 1,
-1.005001, -1.145775, -2.967546, 1, 1, 1, 1, 1,
-1.004631, 0.854027, -0.01183615, 1, 1, 1, 1, 1,
-0.9940381, -1.632301, -1.777258, 1, 1, 1, 1, 1,
-0.9898716, 1.608927, -1.020809, 1, 1, 1, 1, 1,
-0.9876423, 0.9134586, 1.143093, 1, 1, 1, 1, 1,
-0.9840993, 1.517661, -0.4897628, 1, 1, 1, 1, 1,
-0.9837317, -1.010836, -2.04339, 1, 1, 1, 1, 1,
-0.9808203, 0.05805527, -4.264968, 1, 1, 1, 1, 1,
-0.9779186, 0.7324317, -1.023723, 1, 1, 1, 1, 1,
-0.9688783, 0.3312396, -0.9828879, 0, 0, 1, 1, 1,
-0.9611041, 0.991343, -0.3276867, 1, 0, 0, 1, 1,
-0.9413983, -0.2689467, -1.879701, 1, 0, 0, 1, 1,
-0.9287431, -0.07317916, -2.086953, 1, 0, 0, 1, 1,
-0.9208326, -1.651019, -4.040239, 1, 0, 0, 1, 1,
-0.9165635, -0.1864585, -2.210605, 1, 0, 0, 1, 1,
-0.9105812, 0.3884162, -0.5735209, 0, 0, 0, 1, 1,
-0.9085132, 0.4315839, -1.712817, 0, 0, 0, 1, 1,
-0.9061261, 0.2506589, -2.423871, 0, 0, 0, 1, 1,
-0.9010436, 0.2548621, -2.424546, 0, 0, 0, 1, 1,
-0.8949799, 0.5623773, -2.304943, 0, 0, 0, 1, 1,
-0.89055, -0.1554502, -0.6275442, 0, 0, 0, 1, 1,
-0.8828142, 0.710605, -1.425934, 0, 0, 0, 1, 1,
-0.8676065, -0.03552553, -0.9044832, 1, 1, 1, 1, 1,
-0.8627272, -0.9367348, -2.192498, 1, 1, 1, 1, 1,
-0.8611735, 0.08392712, -1.655187, 1, 1, 1, 1, 1,
-0.8533752, 0.6337051, -2.562669, 1, 1, 1, 1, 1,
-0.8500925, -0.2866974, -2.383334, 1, 1, 1, 1, 1,
-0.8447216, -1.548845, -3.690234, 1, 1, 1, 1, 1,
-0.8435599, -0.6529338, -0.6978908, 1, 1, 1, 1, 1,
-0.841875, -0.6304741, -2.812351, 1, 1, 1, 1, 1,
-0.8375633, 1.291091, 1.559005, 1, 1, 1, 1, 1,
-0.8350992, -0.4846579, -1.045308, 1, 1, 1, 1, 1,
-0.8289079, -2.069088, -2.602634, 1, 1, 1, 1, 1,
-0.828056, -0.01769954, -1.015838, 1, 1, 1, 1, 1,
-0.8273427, 2.657945, -0.1458273, 1, 1, 1, 1, 1,
-0.8182628, -1.286567, -2.681557, 1, 1, 1, 1, 1,
-0.8165709, 0.0009196285, -1.449403, 1, 1, 1, 1, 1,
-0.8065142, 1.470356, -1.575758, 0, 0, 1, 1, 1,
-0.8063706, -0.5148612, -0.8448651, 1, 0, 0, 1, 1,
-0.8028063, -0.5300264, -0.8963442, 1, 0, 0, 1, 1,
-0.7932714, -1.066737, -0.8109946, 1, 0, 0, 1, 1,
-0.7801029, 0.2147759, -1.264198, 1, 0, 0, 1, 1,
-0.7789966, -0.4433345, -1.779668, 1, 0, 0, 1, 1,
-0.7746025, 0.561418, -0.23191, 0, 0, 0, 1, 1,
-0.7719284, -0.1484609, -3.667795, 0, 0, 0, 1, 1,
-0.7701357, -0.5042736, -2.855603, 0, 0, 0, 1, 1,
-0.7659248, -0.2313453, -1.811185, 0, 0, 0, 1, 1,
-0.7646548, -0.2620977, -1.21301, 0, 0, 0, 1, 1,
-0.7617282, 0.2778743, 0.6036453, 0, 0, 0, 1, 1,
-0.7456101, 0.500837, -2.61388, 0, 0, 0, 1, 1,
-0.7439016, -0.3245855, -1.633377, 1, 1, 1, 1, 1,
-0.7408938, -0.5094704, -2.119646, 1, 1, 1, 1, 1,
-0.7348366, 0.2838011, -0.1743261, 1, 1, 1, 1, 1,
-0.732078, 0.2038509, -0.2842152, 1, 1, 1, 1, 1,
-0.7312291, -0.5011057, -0.9082497, 1, 1, 1, 1, 1,
-0.7233862, -1.953641, -3.61698, 1, 1, 1, 1, 1,
-0.7194778, 0.2451885, -1.787963, 1, 1, 1, 1, 1,
-0.7167416, -1.623265, -2.143378, 1, 1, 1, 1, 1,
-0.7114775, 1.318358, -0.22342, 1, 1, 1, 1, 1,
-0.7099717, 0.01553473, 0.96286, 1, 1, 1, 1, 1,
-0.7037661, 1.001789, -1.658946, 1, 1, 1, 1, 1,
-0.7009567, -0.05269063, -2.799885, 1, 1, 1, 1, 1,
-0.6965687, 0.2268204, -0.1951138, 1, 1, 1, 1, 1,
-0.6962351, 0.7838891, -0.05586707, 1, 1, 1, 1, 1,
-0.6959647, 0.1100831, -1.5921, 1, 1, 1, 1, 1,
-0.6912892, 0.2887676, -1.713573, 0, 0, 1, 1, 1,
-0.6896377, -0.9218512, -3.52843, 1, 0, 0, 1, 1,
-0.6881803, -0.09671251, -2.498867, 1, 0, 0, 1, 1,
-0.6855657, -0.9846326, -2.314245, 1, 0, 0, 1, 1,
-0.6820258, -1.361167, -4.092417, 1, 0, 0, 1, 1,
-0.6798228, -0.2834247, -3.175952, 1, 0, 0, 1, 1,
-0.679016, 0.3749557, -1.765693, 0, 0, 0, 1, 1,
-0.6763002, -1.231234, -2.420649, 0, 0, 0, 1, 1,
-0.6747096, 0.4069617, 0.8198032, 0, 0, 0, 1, 1,
-0.67256, -0.02370016, -0.6208092, 0, 0, 0, 1, 1,
-0.6694619, -0.1828612, -1.276729, 0, 0, 0, 1, 1,
-0.6665145, -0.7991412, -2.212126, 0, 0, 0, 1, 1,
-0.6661655, 1.831834, 0.6720664, 0, 0, 0, 1, 1,
-0.6659014, 0.894381, 0.6916103, 1, 1, 1, 1, 1,
-0.6658829, 1.720012, -1.252557, 1, 1, 1, 1, 1,
-0.6643073, -1.563511, -3.521609, 1, 1, 1, 1, 1,
-0.65927, -0.4388214, -0.2559021, 1, 1, 1, 1, 1,
-0.6576629, 0.2284132, -2.009004, 1, 1, 1, 1, 1,
-0.6548619, -0.1800909, -1.871645, 1, 1, 1, 1, 1,
-0.647776, -1.293164, -2.27389, 1, 1, 1, 1, 1,
-0.6475049, 0.2769561, -2.946389, 1, 1, 1, 1, 1,
-0.6471566, 0.6826657, -1.727867, 1, 1, 1, 1, 1,
-0.6469063, -0.1826171, -1.436454, 1, 1, 1, 1, 1,
-0.6410561, -0.7620574, -3.839246, 1, 1, 1, 1, 1,
-0.639487, -2.2172, -3.40286, 1, 1, 1, 1, 1,
-0.6375086, -0.516026, -3.328553, 1, 1, 1, 1, 1,
-0.6290929, 0.8517542, 0.03211577, 1, 1, 1, 1, 1,
-0.6273407, 0.5909619, 0.5581813, 1, 1, 1, 1, 1,
-0.6261908, -0.9611694, -3.211494, 0, 0, 1, 1, 1,
-0.6193168, 0.7767851, 0.6117641, 1, 0, 0, 1, 1,
-0.6171954, -0.4533195, -2.08498, 1, 0, 0, 1, 1,
-0.6164141, 0.6533815, 0.2673881, 1, 0, 0, 1, 1,
-0.6150166, -1.462974, -1.791992, 1, 0, 0, 1, 1,
-0.6115039, 1.449013, -1.036506, 1, 0, 0, 1, 1,
-0.6087326, -0.4703002, -2.923184, 0, 0, 0, 1, 1,
-0.5968544, -1.709764, -2.551294, 0, 0, 0, 1, 1,
-0.5965396, 1.662339, -0.2627307, 0, 0, 0, 1, 1,
-0.5961958, 1.445412, 1.952579, 0, 0, 0, 1, 1,
-0.5912343, -0.9037611, -0.4950899, 0, 0, 0, 1, 1,
-0.5900734, 0.8419888, -1.234318, 0, 0, 0, 1, 1,
-0.587836, 0.05725326, 1.07708, 0, 0, 0, 1, 1,
-0.5860227, -0.05220052, -1.784888, 1, 1, 1, 1, 1,
-0.5845199, 1.083935, -0.8542038, 1, 1, 1, 1, 1,
-0.5822558, 0.4584754, -2.339818, 1, 1, 1, 1, 1,
-0.5799892, 0.8365003, -1.44874, 1, 1, 1, 1, 1,
-0.5793279, -0.7649052, -3.457252, 1, 1, 1, 1, 1,
-0.572116, 0.5640652, 0.3555342, 1, 1, 1, 1, 1,
-0.5681514, 2.217144, 0.4075009, 1, 1, 1, 1, 1,
-0.5616654, 0.6523311, -2.871777, 1, 1, 1, 1, 1,
-0.5609994, -0.3570285, -3.554212, 1, 1, 1, 1, 1,
-0.5606796, 0.4769299, -1.662947, 1, 1, 1, 1, 1,
-0.5594118, 0.1746883, -0.8800923, 1, 1, 1, 1, 1,
-0.559172, -1.420609, -0.003649017, 1, 1, 1, 1, 1,
-0.5573023, 2.038209, -1.628066, 1, 1, 1, 1, 1,
-0.5544211, 0.4269972, -1.420829, 1, 1, 1, 1, 1,
-0.5534647, -0.2003639, -2.09768, 1, 1, 1, 1, 1,
-0.553353, 0.7527754, -0.9598155, 0, 0, 1, 1, 1,
-0.5523229, 1.203061, 0.4643256, 1, 0, 0, 1, 1,
-0.5520709, -0.2052673, -1.529247, 1, 0, 0, 1, 1,
-0.5481409, 0.342607, 0.2906027, 1, 0, 0, 1, 1,
-0.5463971, -0.8413499, -0.9774421, 1, 0, 0, 1, 1,
-0.5462437, 2.067861, -2.121711, 1, 0, 0, 1, 1,
-0.545233, -0.5922301, -3.307007, 0, 0, 0, 1, 1,
-0.5447946, -0.08958282, -3.218496, 0, 0, 0, 1, 1,
-0.5437231, -1.768486, -3.513541, 0, 0, 0, 1, 1,
-0.5400895, 0.179783, -1.395493, 0, 0, 0, 1, 1,
-0.5369325, 0.4093235, 0.9694229, 0, 0, 0, 1, 1,
-0.534629, 1.496824, -1.462641, 0, 0, 0, 1, 1,
-0.5338484, 1.000525, -0.8003911, 0, 0, 0, 1, 1,
-0.5335563, 1.087925, -0.4022371, 1, 1, 1, 1, 1,
-0.5252723, 0.9115894, -0.4555114, 1, 1, 1, 1, 1,
-0.5246257, -1.18671, -2.771155, 1, 1, 1, 1, 1,
-0.5232702, -1.288264, -2.018457, 1, 1, 1, 1, 1,
-0.5204536, 0.6864861, -0.4190465, 1, 1, 1, 1, 1,
-0.5147978, 0.3715943, -1.349591, 1, 1, 1, 1, 1,
-0.5132009, 0.311227, -1.186999, 1, 1, 1, 1, 1,
-0.5124049, -0.2305831, -1.834777, 1, 1, 1, 1, 1,
-0.5047066, -0.8001725, -1.993894, 1, 1, 1, 1, 1,
-0.4939924, 0.5889424, 0.02834828, 1, 1, 1, 1, 1,
-0.493406, 0.8963173, -0.9872688, 1, 1, 1, 1, 1,
-0.4929514, 0.2478039, -4.398223, 1, 1, 1, 1, 1,
-0.4916689, 0.9999439, 0.1795957, 1, 1, 1, 1, 1,
-0.4894023, 1.113208, -0.2531549, 1, 1, 1, 1, 1,
-0.4889366, -0.5576352, -1.402606, 1, 1, 1, 1, 1,
-0.4885376, 0.6873839, -1.900156, 0, 0, 1, 1, 1,
-0.4876273, -0.2472452, -2.71831, 1, 0, 0, 1, 1,
-0.4849933, 0.1308943, -1.715813, 1, 0, 0, 1, 1,
-0.4744815, 0.834173, -1.038866, 1, 0, 0, 1, 1,
-0.4740246, 0.615416, -0.3030861, 1, 0, 0, 1, 1,
-0.4733251, 1.240328, 0.9177178, 1, 0, 0, 1, 1,
-0.470943, -0.562101, -2.643402, 0, 0, 0, 1, 1,
-0.4707587, -0.4252365, -2.956221, 0, 0, 0, 1, 1,
-0.4669009, -0.2571872, -1.084175, 0, 0, 0, 1, 1,
-0.4633456, 0.7702203, -2.541628, 0, 0, 0, 1, 1,
-0.4602351, 1.41025, -0.7089151, 0, 0, 0, 1, 1,
-0.4587049, -1.021976, -2.420049, 0, 0, 0, 1, 1,
-0.4586825, 1.473086, -0.1905998, 0, 0, 0, 1, 1,
-0.4540101, -1.468656, -1.989539, 1, 1, 1, 1, 1,
-0.4487023, -0.798299, -1.033787, 1, 1, 1, 1, 1,
-0.442857, 0.8120254, -0.2910314, 1, 1, 1, 1, 1,
-0.4405077, 0.03283637, -1.422452, 1, 1, 1, 1, 1,
-0.4367116, -0.7388573, -3.520018, 1, 1, 1, 1, 1,
-0.4338575, 1.180937, 0.1243968, 1, 1, 1, 1, 1,
-0.4331239, -2.293706, -3.818685, 1, 1, 1, 1, 1,
-0.4279082, -0.9514832, -3.371356, 1, 1, 1, 1, 1,
-0.4239433, 0.005717868, -2.511861, 1, 1, 1, 1, 1,
-0.4224375, -2.493005, -1.18604, 1, 1, 1, 1, 1,
-0.4152974, -1.616346, -3.389386, 1, 1, 1, 1, 1,
-0.4123594, -1.428167, -2.688067, 1, 1, 1, 1, 1,
-0.4105788, 2.224925, -1.16868, 1, 1, 1, 1, 1,
-0.4104083, 0.8585707, -1.665648, 1, 1, 1, 1, 1,
-0.4101105, 0.1454006, -1.525095, 1, 1, 1, 1, 1,
-0.4092545, 0.301093, -0.5607902, 0, 0, 1, 1, 1,
-0.4046826, -0.3425095, -1.825209, 1, 0, 0, 1, 1,
-0.4044833, -0.6061662, -2.84675, 1, 0, 0, 1, 1,
-0.3915773, -0.05573317, -1.113148, 1, 0, 0, 1, 1,
-0.384206, -0.07838196, -2.110781, 1, 0, 0, 1, 1,
-0.3810079, 0.163305, -0.675229, 1, 0, 0, 1, 1,
-0.3754401, 0.6717934, 1.88193, 0, 0, 0, 1, 1,
-0.3724601, 0.01835018, -1.33095, 0, 0, 0, 1, 1,
-0.3708837, -0.4196288, -2.892294, 0, 0, 0, 1, 1,
-0.3649148, -0.8292664, -3.39855, 0, 0, 0, 1, 1,
-0.3639439, 0.4526507, 0.6268079, 0, 0, 0, 1, 1,
-0.3593477, 1.189143, -1.253147, 0, 0, 0, 1, 1,
-0.3548348, -0.3091673, -2.45361, 0, 0, 0, 1, 1,
-0.3547361, -0.5399318, -0.6883794, 1, 1, 1, 1, 1,
-0.3530854, -1.748899, -5.261726, 1, 1, 1, 1, 1,
-0.3496722, -0.01854675, -0.3410598, 1, 1, 1, 1, 1,
-0.3462795, 1.242344, -0.1560568, 1, 1, 1, 1, 1,
-0.3455171, -0.4028856, -1.676222, 1, 1, 1, 1, 1,
-0.3387749, -1.719351, -3.869458, 1, 1, 1, 1, 1,
-0.3362532, -0.176502, -2.178671, 1, 1, 1, 1, 1,
-0.3354514, 1.766936, 1.15661, 1, 1, 1, 1, 1,
-0.3321013, 0.7418249, -0.6875052, 1, 1, 1, 1, 1,
-0.3295422, -0.2124471, -1.942396, 1, 1, 1, 1, 1,
-0.3289936, 0.7984765, -0.5981444, 1, 1, 1, 1, 1,
-0.3269905, -1.074494, -1.741686, 1, 1, 1, 1, 1,
-0.3267984, -1.843009, -4.314334, 1, 1, 1, 1, 1,
-0.3252742, -0.8380346, -2.570738, 1, 1, 1, 1, 1,
-0.3212194, 0.8831839, 1.53026, 1, 1, 1, 1, 1,
-0.3201558, 0.1512969, -1.576756, 0, 0, 1, 1, 1,
-0.3181551, -1.651615, -4.241154, 1, 0, 0, 1, 1,
-0.3174718, -0.5080055, -2.238937, 1, 0, 0, 1, 1,
-0.3143134, 0.5632296, -0.8495144, 1, 0, 0, 1, 1,
-0.3127821, -0.6969892, -2.444885, 1, 0, 0, 1, 1,
-0.3077868, 0.3958138, -0.5462098, 1, 0, 0, 1, 1,
-0.3072951, -2.21187, -4.327557, 0, 0, 0, 1, 1,
-0.3062032, -0.8294676, -2.470409, 0, 0, 0, 1, 1,
-0.3058658, -0.05966938, -1.539304, 0, 0, 0, 1, 1,
-0.3032187, -0.1242731, -1.879984, 0, 0, 0, 1, 1,
-0.2996897, 0.5216137, -0.1027847, 0, 0, 0, 1, 1,
-0.2967611, -0.02289518, -0.5110901, 0, 0, 0, 1, 1,
-0.2967546, -0.8555253, -3.743099, 0, 0, 0, 1, 1,
-0.2885791, -0.6940426, -2.842807, 1, 1, 1, 1, 1,
-0.2876665, -0.2545447, -1.542618, 1, 1, 1, 1, 1,
-0.2837227, -0.3449794, -4.02773, 1, 1, 1, 1, 1,
-0.2812766, -0.08337538, -2.866699, 1, 1, 1, 1, 1,
-0.27209, -0.265196, -2.207198, 1, 1, 1, 1, 1,
-0.2711089, -0.2737359, -3.392653, 1, 1, 1, 1, 1,
-0.2663542, -0.8760411, -2.773333, 1, 1, 1, 1, 1,
-0.2621863, 0.5191171, -0.6489135, 1, 1, 1, 1, 1,
-0.2567126, 3.039768, 0.5703859, 1, 1, 1, 1, 1,
-0.2554158, -1.025509, -2.143047, 1, 1, 1, 1, 1,
-0.2553977, 0.7919903, -2.379764, 1, 1, 1, 1, 1,
-0.2480124, -1.041117, -2.852817, 1, 1, 1, 1, 1,
-0.2477437, -0.6123309, -2.523235, 1, 1, 1, 1, 1,
-0.2459399, -0.8041277, -4.049171, 1, 1, 1, 1, 1,
-0.2449218, -1.515814, -3.271355, 1, 1, 1, 1, 1,
-0.2448868, -0.2557411, -4.21806, 0, 0, 1, 1, 1,
-0.2432766, -0.4413109, -1.98916, 1, 0, 0, 1, 1,
-0.242937, 1.27357, -0.9332947, 1, 0, 0, 1, 1,
-0.2426838, 0.6514808, -0.5088543, 1, 0, 0, 1, 1,
-0.2401841, 0.02712089, -2.153632, 1, 0, 0, 1, 1,
-0.2292152, 0.2596989, -3.121624, 1, 0, 0, 1, 1,
-0.2216459, 0.2848604, -0.2037518, 0, 0, 0, 1, 1,
-0.2216401, -0.8396264, -3.394705, 0, 0, 0, 1, 1,
-0.2202142, 0.451846, -2.262851, 0, 0, 0, 1, 1,
-0.2191105, 0.07803538, -1.45285, 0, 0, 0, 1, 1,
-0.2185906, -0.5795158, -3.032473, 0, 0, 0, 1, 1,
-0.2168091, 0.5827497, -1.552277, 0, 0, 0, 1, 1,
-0.2145224, -0.7490709, -5.151178, 0, 0, 0, 1, 1,
-0.2132098, 3.225996, -0.8463533, 1, 1, 1, 1, 1,
-0.213131, 0.2322547, -1.759656, 1, 1, 1, 1, 1,
-0.2104573, 1.545809, 0.4359969, 1, 1, 1, 1, 1,
-0.2047223, 0.09334642, -1.162138, 1, 1, 1, 1, 1,
-0.2039788, 0.9318824, 0.3633627, 1, 1, 1, 1, 1,
-0.2037619, -0.2537002, -0.8165073, 1, 1, 1, 1, 1,
-0.1997989, 1.89937, 1.701261, 1, 1, 1, 1, 1,
-0.1975388, -0.0003974945, 0.3780116, 1, 1, 1, 1, 1,
-0.1875154, -0.1242852, -2.316544, 1, 1, 1, 1, 1,
-0.1841584, 0.3661473, -0.8219928, 1, 1, 1, 1, 1,
-0.18377, 0.4003151, -0.4413666, 1, 1, 1, 1, 1,
-0.1795738, -0.5945556, -3.264826, 1, 1, 1, 1, 1,
-0.177855, -0.8889707, -0.8782754, 1, 1, 1, 1, 1,
-0.1765535, -0.5161619, -4.539114, 1, 1, 1, 1, 1,
-0.1750619, -0.2464324, -1.856038, 1, 1, 1, 1, 1,
-0.1688952, 0.1510741, -0.9508016, 0, 0, 1, 1, 1,
-0.1626947, -1.409949, -2.75335, 1, 0, 0, 1, 1,
-0.1624389, 0.4742104, -1.79435, 1, 0, 0, 1, 1,
-0.1612291, -1.764724, -3.264662, 1, 0, 0, 1, 1,
-0.1583847, -0.2158251, -4.041822, 1, 0, 0, 1, 1,
-0.1577535, -0.6446893, -2.821901, 1, 0, 0, 1, 1,
-0.1540127, -0.6071646, -2.903219, 0, 0, 0, 1, 1,
-0.1506841, -0.4833429, -1.914023, 0, 0, 0, 1, 1,
-0.1467717, 0.7724868, -0.3319916, 0, 0, 0, 1, 1,
-0.1455467, -0.285152, -3.520141, 0, 0, 0, 1, 1,
-0.141974, -1.240952, -4.250612, 0, 0, 0, 1, 1,
-0.1387167, -2.374525, -2.959631, 0, 0, 0, 1, 1,
-0.1383804, -1.044837, -2.742138, 0, 0, 0, 1, 1,
-0.1363982, -0.5766349, -3.036514, 1, 1, 1, 1, 1,
-0.1305137, -2.026665, -3.226591, 1, 1, 1, 1, 1,
-0.126817, 0.7131695, -0.280677, 1, 1, 1, 1, 1,
-0.1261636, -0.8417851, -3.711188, 1, 1, 1, 1, 1,
-0.1250576, 1.709104, 1.06113, 1, 1, 1, 1, 1,
-0.1245217, -0.15973, -2.46886, 1, 1, 1, 1, 1,
-0.1231659, 1.676508, 2.014266, 1, 1, 1, 1, 1,
-0.1223228, 1.357277, -0.08525252, 1, 1, 1, 1, 1,
-0.1163875, 1.096673, -0.953189, 1, 1, 1, 1, 1,
-0.1153559, 0.07975876, -1.74715, 1, 1, 1, 1, 1,
-0.1084637, -0.5263935, -2.832501, 1, 1, 1, 1, 1,
-0.105293, 0.7074114, -0.1444475, 1, 1, 1, 1, 1,
-0.1034842, 0.4320924, -1.604391, 1, 1, 1, 1, 1,
-0.1021282, 2.104512, 0.9193648, 1, 1, 1, 1, 1,
-0.09613054, -0.2557019, -2.937799, 1, 1, 1, 1, 1,
-0.09405892, 1.086184, 2.065143, 0, 0, 1, 1, 1,
-0.08977752, -1.02245, -2.810237, 1, 0, 0, 1, 1,
-0.08970281, -0.5258281, -3.497864, 1, 0, 0, 1, 1,
-0.08864245, 0.1243487, -0.90725, 1, 0, 0, 1, 1,
-0.07821529, 0.7347748, -0.2393887, 1, 0, 0, 1, 1,
-0.06981947, 0.06946664, 0.1376364, 1, 0, 0, 1, 1,
-0.0690088, -0.8306067, -2.53455, 0, 0, 0, 1, 1,
-0.06702965, -0.04042939, -1.695265, 0, 0, 0, 1, 1,
-0.06152223, -0.4106667, -2.114491, 0, 0, 0, 1, 1,
-0.06059938, -2.083026, -2.581695, 0, 0, 0, 1, 1,
-0.0550868, -0.4921036, -3.991028, 0, 0, 0, 1, 1,
-0.05159067, -1.799428, -2.674246, 0, 0, 0, 1, 1,
-0.05023292, -0.8085594, -3.461259, 0, 0, 0, 1, 1,
-0.0465261, -0.9263406, -2.738322, 1, 1, 1, 1, 1,
-0.04432917, 0.02749053, -1.645143, 1, 1, 1, 1, 1,
-0.03965741, 0.4650414, -1.042662, 1, 1, 1, 1, 1,
-0.03850359, -1.208802, -3.063857, 1, 1, 1, 1, 1,
-0.03666457, -0.3442843, -4.092389, 1, 1, 1, 1, 1,
-0.03384719, 1.038255, 1.655091, 1, 1, 1, 1, 1,
-0.0248084, -1.226655, -2.257869, 1, 1, 1, 1, 1,
-0.01967996, -1.144043, -3.942986, 1, 1, 1, 1, 1,
-0.01918695, 0.3882965, 0.07417455, 1, 1, 1, 1, 1,
-0.01749238, -0.9098054, -2.790577, 1, 1, 1, 1, 1,
-0.01484881, 1.210617, -0.3591857, 1, 1, 1, 1, 1,
-0.01316898, -0.6346253, -3.698659, 1, 1, 1, 1, 1,
-0.01040741, -0.8180533, -2.880256, 1, 1, 1, 1, 1,
-0.01010344, -0.2671644, -2.293253, 1, 1, 1, 1, 1,
-0.006067402, -0.183378, -3.4594, 1, 1, 1, 1, 1,
-0.004228473, 0.6888766, 1.7381, 0, 0, 1, 1, 1,
-0.002274461, -1.186441, -2.800475, 1, 0, 0, 1, 1,
-0.0001187867, -0.791643, -2.718465, 1, 0, 0, 1, 1,
0.0003087965, 0.2613881, 0.1434679, 1, 0, 0, 1, 1,
0.0008925102, -0.951112, 4.184103, 1, 0, 0, 1, 1,
0.004441147, -1.411099, 2.98024, 1, 0, 0, 1, 1,
0.006624698, -0.057729, 2.137569, 0, 0, 0, 1, 1,
0.01405068, 0.9109727, 1.385649, 0, 0, 0, 1, 1,
0.01511165, -0.5264786, 4.664267, 0, 0, 0, 1, 1,
0.01838637, 0.112321, 0.01214526, 0, 0, 0, 1, 1,
0.02123746, 1.867086, -0.1531586, 0, 0, 0, 1, 1,
0.02397976, -0.4431558, 1.719539, 0, 0, 0, 1, 1,
0.02720599, 0.9847094, -0.3779641, 0, 0, 0, 1, 1,
0.02832151, 0.1085468, -0.5565804, 1, 1, 1, 1, 1,
0.02893695, -0.7094164, 3.563619, 1, 1, 1, 1, 1,
0.02898367, 0.2947302, 0.4290432, 1, 1, 1, 1, 1,
0.02997159, 0.9868833, 0.7883289, 1, 1, 1, 1, 1,
0.0306522, 0.8275232, 0.3168354, 1, 1, 1, 1, 1,
0.03105242, 1.285492, -0.1592108, 1, 1, 1, 1, 1,
0.0317056, 1.177012, -0.5955625, 1, 1, 1, 1, 1,
0.03258219, 1.248832, -0.7595183, 1, 1, 1, 1, 1,
0.03434223, -1.45753, 3.44102, 1, 1, 1, 1, 1,
0.03561089, 2.662913, 1.128874, 1, 1, 1, 1, 1,
0.03828328, 0.8044839, 0.2843406, 1, 1, 1, 1, 1,
0.0383569, -0.0477192, 4.400353, 1, 1, 1, 1, 1,
0.04057468, -0.396574, 2.272742, 1, 1, 1, 1, 1,
0.04270469, -0.8711855, 0.5102136, 1, 1, 1, 1, 1,
0.04843741, 0.02784, -0.8368957, 1, 1, 1, 1, 1,
0.05082398, -0.4363979, 4.062966, 0, 0, 1, 1, 1,
0.05150802, 0.1280675, 0.9491373, 1, 0, 0, 1, 1,
0.0540073, -0.5872974, 4.627325, 1, 0, 0, 1, 1,
0.05456344, 0.9903398, 0.3107069, 1, 0, 0, 1, 1,
0.05827046, -1.044545, 1.898729, 1, 0, 0, 1, 1,
0.06205972, 1.091896, 0.5289361, 1, 0, 0, 1, 1,
0.06472244, 1.973161, 0.03309472, 0, 0, 0, 1, 1,
0.06608152, 1.116069, 1.201418, 0, 0, 0, 1, 1,
0.06948266, -0.4261717, 3.136109, 0, 0, 0, 1, 1,
0.07170495, 0.8411775, -0.304353, 0, 0, 0, 1, 1,
0.07279143, 0.1128919, 1.829407, 0, 0, 0, 1, 1,
0.07311209, -0.9612822, 2.683133, 0, 0, 0, 1, 1,
0.07415797, -1.256219, 2.423609, 0, 0, 0, 1, 1,
0.08138539, 0.3942424, 1.791592, 1, 1, 1, 1, 1,
0.08158015, 1.496166, -0.1039568, 1, 1, 1, 1, 1,
0.08630327, -0.5852043, 3.706512, 1, 1, 1, 1, 1,
0.09181737, 0.19736, -0.06203609, 1, 1, 1, 1, 1,
0.09312109, 0.4937395, 1.441882, 1, 1, 1, 1, 1,
0.09578114, 0.3849607, -1.23023, 1, 1, 1, 1, 1,
0.09592423, 0.1397922, 0.7781637, 1, 1, 1, 1, 1,
0.1002354, -0.2131382, 2.590435, 1, 1, 1, 1, 1,
0.1016059, 1.220405, 1.495048, 1, 1, 1, 1, 1,
0.105444, 1.954274, 3.234363, 1, 1, 1, 1, 1,
0.1117383, -0.8407845, 3.88216, 1, 1, 1, 1, 1,
0.1120026, 0.1317175, 1.596712, 1, 1, 1, 1, 1,
0.113034, -2.213228, 3.104115, 1, 1, 1, 1, 1,
0.1262054, -1.984577, 2.504969, 1, 1, 1, 1, 1,
0.1264179, -0.8771503, 1.420162, 1, 1, 1, 1, 1,
0.1275418, 0.7618174, 0.2831512, 0, 0, 1, 1, 1,
0.1278031, 1.636908, 0.8318977, 1, 0, 0, 1, 1,
0.1278042, 1.916807, 1.031508, 1, 0, 0, 1, 1,
0.1296688, 0.5697943, 1.20936, 1, 0, 0, 1, 1,
0.1375237, 0.1318512, -0.4994979, 1, 0, 0, 1, 1,
0.1397184, 0.6928287, 0.7255692, 1, 0, 0, 1, 1,
0.1421774, 0.3730952, -1.462948, 0, 0, 0, 1, 1,
0.1503057, 1.23248, 0.1041695, 0, 0, 0, 1, 1,
0.1529108, -1.833344, 2.136562, 0, 0, 0, 1, 1,
0.1552403, -0.2899111, 2.485922, 0, 0, 0, 1, 1,
0.1552429, 0.8421521, -2.273229, 0, 0, 0, 1, 1,
0.1572818, 0.1888378, 2.170417, 0, 0, 0, 1, 1,
0.1618256, -0.02409038, 3.210134, 0, 0, 0, 1, 1,
0.1657364, -0.3975776, 1.958249, 1, 1, 1, 1, 1,
0.1666457, 0.4847538, 1.210829, 1, 1, 1, 1, 1,
0.1703833, 0.9318937, 2.085472, 1, 1, 1, 1, 1,
0.1721126, 1.576167, 0.4259095, 1, 1, 1, 1, 1,
0.1740969, 1.13684, -0.3886316, 1, 1, 1, 1, 1,
0.1826514, -2.206101, 0.8571543, 1, 1, 1, 1, 1,
0.1886353, 0.7204121, 0.2949155, 1, 1, 1, 1, 1,
0.1935363, -1.51581, 3.7947, 1, 1, 1, 1, 1,
0.194254, 0.04734793, 1.980625, 1, 1, 1, 1, 1,
0.1958638, -1.183544, 2.655076, 1, 1, 1, 1, 1,
0.1982912, 0.2946761, 1.420324, 1, 1, 1, 1, 1,
0.2001358, -0.1103378, 1.362407, 1, 1, 1, 1, 1,
0.2023708, 0.8535962, 1.148791, 1, 1, 1, 1, 1,
0.2053554, 1.285923, -1.915918, 1, 1, 1, 1, 1,
0.2064295, -0.8729134, 3.839297, 1, 1, 1, 1, 1,
0.2064296, 2.420506, 0.1373354, 0, 0, 1, 1, 1,
0.2071627, 1.8308, -0.06190386, 1, 0, 0, 1, 1,
0.2072244, 2.933873, -1.00061, 1, 0, 0, 1, 1,
0.2074714, 0.02857604, 2.101816, 1, 0, 0, 1, 1,
0.2088467, 2.553584, -0.01107129, 1, 0, 0, 1, 1,
0.2139336, -0.5943603, 3.714314, 1, 0, 0, 1, 1,
0.2148243, -2.133207, 3.48383, 0, 0, 0, 1, 1,
0.2152682, 1.097371, 0.7966004, 0, 0, 0, 1, 1,
0.2243379, 1.526009, 1.250857, 0, 0, 0, 1, 1,
0.2250201, -0.9118503, 1.684199, 0, 0, 0, 1, 1,
0.2270883, 0.8530322, -1.223747, 0, 0, 0, 1, 1,
0.2315007, -0.4739127, 2.204419, 0, 0, 0, 1, 1,
0.2344107, 0.2593199, -0.4276384, 0, 0, 0, 1, 1,
0.2351816, 0.9434467, 0.955502, 1, 1, 1, 1, 1,
0.2398061, 0.2615714, 1.997786, 1, 1, 1, 1, 1,
0.2401158, -0.9950428, 4.63764, 1, 1, 1, 1, 1,
0.2403078, -1.399882, -1.088477, 1, 1, 1, 1, 1,
0.2515161, -0.05548405, 0.3455304, 1, 1, 1, 1, 1,
0.2521206, 0.3556832, 0.1041858, 1, 1, 1, 1, 1,
0.2562813, 0.3289682, 1.568981, 1, 1, 1, 1, 1,
0.2569083, 1.415408, 0.3916608, 1, 1, 1, 1, 1,
0.2617442, -0.7120273, 2.082471, 1, 1, 1, 1, 1,
0.264886, 0.5249773, 1.257806, 1, 1, 1, 1, 1,
0.2651021, 1.19255, 0.3950773, 1, 1, 1, 1, 1,
0.2673968, -0.5215423, 2.700609, 1, 1, 1, 1, 1,
0.2675072, -0.1914493, 3.300917, 1, 1, 1, 1, 1,
0.2692016, 1.329771, 0.3841084, 1, 1, 1, 1, 1,
0.2713853, 0.06367543, 0.5514095, 1, 1, 1, 1, 1,
0.2844715, -1.346253, 4.346854, 0, 0, 1, 1, 1,
0.2853505, -1.422853, 3.544868, 1, 0, 0, 1, 1,
0.2925726, 1.173303, 0.2213573, 1, 0, 0, 1, 1,
0.2942443, 2.142485, 1.421215, 1, 0, 0, 1, 1,
0.2948301, -0.00638871, 2.050165, 1, 0, 0, 1, 1,
0.2996965, -0.3577875, 2.246086, 1, 0, 0, 1, 1,
0.2999749, 0.6191692, -0.8756049, 0, 0, 0, 1, 1,
0.3000063, 0.4586968, 1.786573, 0, 0, 0, 1, 1,
0.3042371, -0.01923923, 2.824882, 0, 0, 0, 1, 1,
0.313445, 1.034206, -0.4811555, 0, 0, 0, 1, 1,
0.315181, 1.524446, -1.301313, 0, 0, 0, 1, 1,
0.3155742, 0.1898504, 0.4550564, 0, 0, 0, 1, 1,
0.3194776, -0.3992779, 2.249115, 0, 0, 0, 1, 1,
0.3202798, -0.9221689, 2.221377, 1, 1, 1, 1, 1,
0.3225844, -0.6197219, 2.858999, 1, 1, 1, 1, 1,
0.3227527, -1.990351, 1.417238, 1, 1, 1, 1, 1,
0.3268953, 0.05137993, 0.7842447, 1, 1, 1, 1, 1,
0.3303008, 1.178895, -0.2304016, 1, 1, 1, 1, 1,
0.3355198, -0.003809012, 0.5222928, 1, 1, 1, 1, 1,
0.3373142, 0.384942, 0.7525092, 1, 1, 1, 1, 1,
0.3374372, -1.241253, 4.626756, 1, 1, 1, 1, 1,
0.3392734, -1.74022, 2.408347, 1, 1, 1, 1, 1,
0.3414847, 1.141976, 1.0796, 1, 1, 1, 1, 1,
0.3429983, 0.1304645, 1.007469, 1, 1, 1, 1, 1,
0.3479578, 0.1273643, 2.079808, 1, 1, 1, 1, 1,
0.3496121, 0.1241373, 1.241043, 1, 1, 1, 1, 1,
0.3501297, 0.9460958, 0.4137467, 1, 1, 1, 1, 1,
0.367211, -0.5289036, 2.49911, 1, 1, 1, 1, 1,
0.370665, 0.4869346, 1.815649, 0, 0, 1, 1, 1,
0.3728009, -0.9436502, 4.682266, 1, 0, 0, 1, 1,
0.3735096, 2.318291, -0.07456885, 1, 0, 0, 1, 1,
0.3741052, -0.9542436, 2.040906, 1, 0, 0, 1, 1,
0.3783342, 0.1037804, 0.4729929, 1, 0, 0, 1, 1,
0.3789074, 2.525354, -1.291852, 1, 0, 0, 1, 1,
0.3790889, 0.05665863, 0.6686205, 0, 0, 0, 1, 1,
0.3843661, 0.05895838, 1.090144, 0, 0, 0, 1, 1,
0.3859423, 0.1464358, 2.019917, 0, 0, 0, 1, 1,
0.3887878, 0.5207647, 2.923902, 0, 0, 0, 1, 1,
0.3893196, 0.5078216, 0.797953, 0, 0, 0, 1, 1,
0.3893954, 1.058098, -0.8897278, 0, 0, 0, 1, 1,
0.3954419, 0.9127051, 0.8938313, 0, 0, 0, 1, 1,
0.3967766, 0.6677011, 1.450282, 1, 1, 1, 1, 1,
0.397746, 1.264583, 2.265227, 1, 1, 1, 1, 1,
0.4069963, -1.932223, 4.729995, 1, 1, 1, 1, 1,
0.4071331, 1.653298, 1.000501, 1, 1, 1, 1, 1,
0.4075193, -0.2691253, 2.566631, 1, 1, 1, 1, 1,
0.4115564, -0.3342623, 2.666928, 1, 1, 1, 1, 1,
0.4136422, 0.004063632, 3.355086, 1, 1, 1, 1, 1,
0.414549, 0.3016838, -0.1308505, 1, 1, 1, 1, 1,
0.4174282, 0.6093791, -1.126642, 1, 1, 1, 1, 1,
0.4177328, 0.1188355, 1.53569, 1, 1, 1, 1, 1,
0.4194121, -1.009513, 2.735513, 1, 1, 1, 1, 1,
0.4197448, 0.371816, 0.2450769, 1, 1, 1, 1, 1,
0.420399, -0.1667229, 1.073531, 1, 1, 1, 1, 1,
0.4204733, 0.5380276, 0.4506333, 1, 1, 1, 1, 1,
0.4206094, -1.267205, 1.79419, 1, 1, 1, 1, 1,
0.4224122, 0.9321471, 0.1812163, 0, 0, 1, 1, 1,
0.4237215, 1.228642, -1.364728, 1, 0, 0, 1, 1,
0.4274068, -0.7847291, 3.821722, 1, 0, 0, 1, 1,
0.4297216, -1.754237, 3.096952, 1, 0, 0, 1, 1,
0.4378996, -0.578086, 2.816287, 1, 0, 0, 1, 1,
0.4400486, -1.438318, 1.761238, 1, 0, 0, 1, 1,
0.4411993, -0.2686218, 1.979576, 0, 0, 0, 1, 1,
0.441247, -1.80546, 2.124057, 0, 0, 0, 1, 1,
0.4466087, -0.8194021, 2.268801, 0, 0, 0, 1, 1,
0.4471862, 0.3438491, 0.1649221, 0, 0, 0, 1, 1,
0.4519213, 0.1537574, 1.894802, 0, 0, 0, 1, 1,
0.4525476, -0.1682939, 0.09788608, 0, 0, 0, 1, 1,
0.4549407, -0.1836424, 2.491243, 0, 0, 0, 1, 1,
0.4565647, 0.7043332, 2.784234, 1, 1, 1, 1, 1,
0.4566423, -0.8821213, 2.241032, 1, 1, 1, 1, 1,
0.4581441, -0.6059662, 2.070497, 1, 1, 1, 1, 1,
0.4589857, 1.006269, 1.506763, 1, 1, 1, 1, 1,
0.4662811, 1.168563, 1.458232, 1, 1, 1, 1, 1,
0.4675706, 1.253386, -1.067389, 1, 1, 1, 1, 1,
0.4794196, -0.6257777, 2.845156, 1, 1, 1, 1, 1,
0.4800925, -1.580536, 3.875193, 1, 1, 1, 1, 1,
0.4848977, -0.272142, 0.8974392, 1, 1, 1, 1, 1,
0.4922258, -0.7631156, 3.029242, 1, 1, 1, 1, 1,
0.4942054, 1.69495, 0.9611942, 1, 1, 1, 1, 1,
0.4956883, -0.7706611, 2.803138, 1, 1, 1, 1, 1,
0.5009417, -2.643501, 4.111185, 1, 1, 1, 1, 1,
0.5011573, 1.506844, -0.6076475, 1, 1, 1, 1, 1,
0.5049512, 1.390445, -0.3101822, 1, 1, 1, 1, 1,
0.5096844, -1.769198, 2.600645, 0, 0, 1, 1, 1,
0.5109618, -1.5973, 1.281142, 1, 0, 0, 1, 1,
0.5116497, 0.3360971, -1.014465, 1, 0, 0, 1, 1,
0.5157939, -0.1431353, 2.973562, 1, 0, 0, 1, 1,
0.5168491, -1.305029, 4.325431, 1, 0, 0, 1, 1,
0.5265595, -0.7924361, 1.481678, 1, 0, 0, 1, 1,
0.5273608, -0.1974053, 2.174925, 0, 0, 0, 1, 1,
0.5293748, 0.8728963, 1.620469, 0, 0, 0, 1, 1,
0.5304439, 1.211798, -0.9613673, 0, 0, 0, 1, 1,
0.5336952, -0.6702554, 3.77049, 0, 0, 0, 1, 1,
0.5380842, 0.6413272, 0.0544281, 0, 0, 0, 1, 1,
0.5396658, 2.375287, -0.5239404, 0, 0, 0, 1, 1,
0.5420852, 0.4470406, 1.02647, 0, 0, 0, 1, 1,
0.5456386, -0.7022867, 2.388098, 1, 1, 1, 1, 1,
0.5515038, -0.3440581, 3.540231, 1, 1, 1, 1, 1,
0.5526358, 0.1989797, 1.253969, 1, 1, 1, 1, 1,
0.5541773, -0.1317411, 3.746076, 1, 1, 1, 1, 1,
0.5597073, -0.3165477, 1.896653, 1, 1, 1, 1, 1,
0.5620265, 0.1720536, 1.664055, 1, 1, 1, 1, 1,
0.5631533, 0.01113347, 2.531071, 1, 1, 1, 1, 1,
0.5637841, 0.002558819, 1.915288, 1, 1, 1, 1, 1,
0.5680118, -0.3834072, 2.674879, 1, 1, 1, 1, 1,
0.5680565, 0.3427985, 1.526525, 1, 1, 1, 1, 1,
0.5712562, 0.4710814, 1.664595, 1, 1, 1, 1, 1,
0.5770061, 0.6527298, -0.2595512, 1, 1, 1, 1, 1,
0.5772765, 0.694553, 0.6829991, 1, 1, 1, 1, 1,
0.5795044, -0.1300662, 1.769795, 1, 1, 1, 1, 1,
0.5813476, -3.639436, 3.669657, 1, 1, 1, 1, 1,
0.5829017, 0.3451496, 1.655895, 0, 0, 1, 1, 1,
0.5836887, -1.044218, 4.257421, 1, 0, 0, 1, 1,
0.584282, -2.7183, 2.47892, 1, 0, 0, 1, 1,
0.58611, -1.977712, 2.727876, 1, 0, 0, 1, 1,
0.586789, 0.5183521, 1.904437, 1, 0, 0, 1, 1,
0.5883136, -0.7961407, 2.94365, 1, 0, 0, 1, 1,
0.5889086, 0.4569768, 0.6617295, 0, 0, 0, 1, 1,
0.5986277, 1.004855, 0.7441214, 0, 0, 0, 1, 1,
0.6039191, -0.8082076, 1.465683, 0, 0, 0, 1, 1,
0.6062383, 1.111261, -0.07151759, 0, 0, 0, 1, 1,
0.6071565, -1.481663, 3.165888, 0, 0, 0, 1, 1,
0.6111406, -0.123713, 4.582782, 0, 0, 0, 1, 1,
0.6117008, 0.6027162, 0.7898302, 0, 0, 0, 1, 1,
0.6130421, 0.3591359, 1.110008, 1, 1, 1, 1, 1,
0.6167884, 0.6789141, 1.240244, 1, 1, 1, 1, 1,
0.6201245, 0.9878436, 1.412426, 1, 1, 1, 1, 1,
0.6287133, -2.289492, 3.404795, 1, 1, 1, 1, 1,
0.6316212, -0.2977043, 2.654312, 1, 1, 1, 1, 1,
0.6366743, 0.1540117, 2.221698, 1, 1, 1, 1, 1,
0.6393967, -0.5467023, 1.202788, 1, 1, 1, 1, 1,
0.6409961, 0.03644457, 1.799131, 1, 1, 1, 1, 1,
0.6422496, -1.750592, 3.32681, 1, 1, 1, 1, 1,
0.6422747, 0.9130022, 0.4977943, 1, 1, 1, 1, 1,
0.6429766, 0.05243023, 3.305718, 1, 1, 1, 1, 1,
0.6430057, -0.954302, 2.377043, 1, 1, 1, 1, 1,
0.6502765, 0.4635472, 1.888009, 1, 1, 1, 1, 1,
0.6529542, 0.6366366, 1.562172, 1, 1, 1, 1, 1,
0.6575826, -1.488193, 2.779824, 1, 1, 1, 1, 1,
0.6632819, 0.2180325, 0.2155582, 0, 0, 1, 1, 1,
0.6673462, 0.7320805, -0.296643, 1, 0, 0, 1, 1,
0.6684116, -0.3129585, 2.889971, 1, 0, 0, 1, 1,
0.67598, -0.02811077, 3.39454, 1, 0, 0, 1, 1,
0.676488, 0.6595592, 0.2248317, 1, 0, 0, 1, 1,
0.6824635, 1.225521, 2.290271, 1, 0, 0, 1, 1,
0.6852963, 0.8941793, 2.467543, 0, 0, 0, 1, 1,
0.6893767, -1.723558, 2.877526, 0, 0, 0, 1, 1,
0.6903146, -0.1629384, 1.466945, 0, 0, 0, 1, 1,
0.6946046, -1.52723, 4.184599, 0, 0, 0, 1, 1,
0.6971363, -0.7169893, 3.851768, 0, 0, 0, 1, 1,
0.7048264, -1.119606, 3.541545, 0, 0, 0, 1, 1,
0.7048504, 0.07724483, 0.5495584, 0, 0, 0, 1, 1,
0.7114103, -1.874221, 2.957357, 1, 1, 1, 1, 1,
0.7122953, -1.454531, 3.314734, 1, 1, 1, 1, 1,
0.7165174, -0.4734016, 1.459848, 1, 1, 1, 1, 1,
0.7183033, 0.2398983, 1.44851, 1, 1, 1, 1, 1,
0.7219771, 0.6231187, 0.5650343, 1, 1, 1, 1, 1,
0.7306459, 0.599063, -0.4091308, 1, 1, 1, 1, 1,
0.737327, -1.613119, 2.498986, 1, 1, 1, 1, 1,
0.7392066, 1.659388, 0.6888008, 1, 1, 1, 1, 1,
0.74145, -1.235219, 2.268869, 1, 1, 1, 1, 1,
0.7450502, -0.7572167, 1.707977, 1, 1, 1, 1, 1,
0.7471104, 1.218018, 0.7722394, 1, 1, 1, 1, 1,
0.7521766, 0.08462515, 1.567322, 1, 1, 1, 1, 1,
0.752188, 0.8529872, 2.640996, 1, 1, 1, 1, 1,
0.7543337, -0.3985586, 2.057966, 1, 1, 1, 1, 1,
0.7546191, -1.342203, 4.274408, 1, 1, 1, 1, 1,
0.7587035, 0.03113662, 2.552395, 0, 0, 1, 1, 1,
0.7603959, 1.510488, -1.185927, 1, 0, 0, 1, 1,
0.7608161, -0.7685444, 3.450583, 1, 0, 0, 1, 1,
0.761029, 0.01255148, 2.661303, 1, 0, 0, 1, 1,
0.7688468, -0.9364601, 2.146615, 1, 0, 0, 1, 1,
0.7700236, 1.566935, 0.4823558, 1, 0, 0, 1, 1,
0.771141, -0.2294846, 2.255525, 0, 0, 0, 1, 1,
0.7775397, -0.5288975, 3.304137, 0, 0, 0, 1, 1,
0.7786232, -1.029557, 4.331763, 0, 0, 0, 1, 1,
0.7795176, 0.2454133, 0.2068287, 0, 0, 0, 1, 1,
0.7797539, 0.2244835, 2.272025, 0, 0, 0, 1, 1,
0.7808394, -0.5191928, 2.048341, 0, 0, 0, 1, 1,
0.7833071, 1.085673, -2.219972, 0, 0, 0, 1, 1,
0.7847434, 1.564154, -0.5830061, 1, 1, 1, 1, 1,
0.7873481, -0.2960939, 2.684577, 1, 1, 1, 1, 1,
0.7913547, 0.7204145, 0.8082361, 1, 1, 1, 1, 1,
0.7919405, 0.929686, 1.048689, 1, 1, 1, 1, 1,
0.7965077, -0.3720865, 0.3320979, 1, 1, 1, 1, 1,
0.8001748, -0.7032465, 2.698692, 1, 1, 1, 1, 1,
0.8029727, -1.861559, 3.280098, 1, 1, 1, 1, 1,
0.8071287, 0.8194584, 1.647266, 1, 1, 1, 1, 1,
0.8118182, 0.5037305, 1.541078, 1, 1, 1, 1, 1,
0.8121586, -1.850535, 1.437312, 1, 1, 1, 1, 1,
0.814034, 0.01018079, 0.4656579, 1, 1, 1, 1, 1,
0.8140754, 0.9124969, -0.637215, 1, 1, 1, 1, 1,
0.8195969, -0.4814249, 2.509171, 1, 1, 1, 1, 1,
0.822016, -0.12717, 3.053573, 1, 1, 1, 1, 1,
0.8280887, 0.3733202, 0.1294325, 1, 1, 1, 1, 1,
0.8316352, 0.2791365, 2.386665, 0, 0, 1, 1, 1,
0.8346295, 1.232539, 0.4809695, 1, 0, 0, 1, 1,
0.8387247, 2.110132, -0.3762644, 1, 0, 0, 1, 1,
0.8387581, 0.4390776, -0.5199736, 1, 0, 0, 1, 1,
0.8394248, 0.5103074, -0.2603915, 1, 0, 0, 1, 1,
0.8408399, 0.1672337, 2.662708, 1, 0, 0, 1, 1,
0.8531303, 0.07598308, 2.560231, 0, 0, 0, 1, 1,
0.860823, -1.433542, 2.082516, 0, 0, 0, 1, 1,
0.8619441, -1.289113, 2.651009, 0, 0, 0, 1, 1,
0.862519, 0.64197, 1.754238, 0, 0, 0, 1, 1,
0.8820117, 0.4641896, 2.20492, 0, 0, 0, 1, 1,
0.8826042, -0.2674089, 1.604723, 0, 0, 0, 1, 1,
0.8832993, -0.5518209, 2.095896, 0, 0, 0, 1, 1,
0.8881285, 0.08256728, 0.9368339, 1, 1, 1, 1, 1,
0.8918339, -1.337843, 2.120756, 1, 1, 1, 1, 1,
0.9016774, 0.8436573, 0.8972611, 1, 1, 1, 1, 1,
0.9017389, -0.6405078, 1.508909, 1, 1, 1, 1, 1,
0.903725, 0.5211764, -0.8827513, 1, 1, 1, 1, 1,
0.9042961, -0.6020967, 2.520729, 1, 1, 1, 1, 1,
0.9046443, 0.7540051, 0.8673073, 1, 1, 1, 1, 1,
0.9087076, 0.07873597, 0.9864142, 1, 1, 1, 1, 1,
0.9089193, 0.7829546, 0.7276064, 1, 1, 1, 1, 1,
0.9100894, 0.1872593, -0.6428553, 1, 1, 1, 1, 1,
0.9154041, 1.207734, 1.289551, 1, 1, 1, 1, 1,
0.9158403, 1.820668, 0.8008662, 1, 1, 1, 1, 1,
0.9164739, -0.145663, 0.8522018, 1, 1, 1, 1, 1,
0.926282, 0.4789325, 2.299328, 1, 1, 1, 1, 1,
0.9273798, -1.274338, 3.228685, 1, 1, 1, 1, 1,
0.9300359, -0.03258662, 1.922719, 0, 0, 1, 1, 1,
0.932835, 0.9709825, 0.4628036, 1, 0, 0, 1, 1,
0.9383454, -0.4574223, 1.945337, 1, 0, 0, 1, 1,
0.9505041, 1.236572, 0.3453603, 1, 0, 0, 1, 1,
0.9509931, 0.9972804, 0.4643511, 1, 0, 0, 1, 1,
0.9553465, -0.592214, 4.60944, 1, 0, 0, 1, 1,
0.9562058, -1.636316, 1.779041, 0, 0, 0, 1, 1,
0.9587606, 1.98168, 0.9744241, 0, 0, 0, 1, 1,
0.9634463, -0.5028824, 4.49191, 0, 0, 0, 1, 1,
0.9658146, -0.5852773, 2.436762, 0, 0, 0, 1, 1,
0.9705707, 0.0111856, 1.742103, 0, 0, 0, 1, 1,
0.9754893, -0.03870269, 0.9828275, 0, 0, 0, 1, 1,
0.9847369, -1.019567, 1.517448, 0, 0, 0, 1, 1,
0.9868448, 2.522245, 0.7141476, 1, 1, 1, 1, 1,
0.9927625, 0.2082493, 2.51271, 1, 1, 1, 1, 1,
0.9931875, -0.2998008, 1.700989, 1, 1, 1, 1, 1,
1.001857, 0.8309337, -0.04246138, 1, 1, 1, 1, 1,
1.002468, 0.4683394, 1.329839, 1, 1, 1, 1, 1,
1.002865, 0.2692192, 0.01700363, 1, 1, 1, 1, 1,
1.003338, -0.04778304, 0.4498821, 1, 1, 1, 1, 1,
1.010795, -0.3623176, 2.108797, 1, 1, 1, 1, 1,
1.014708, 0.4032476, 0.1115074, 1, 1, 1, 1, 1,
1.016465, -0.3493993, 2.270923, 1, 1, 1, 1, 1,
1.020828, -0.3393146, 1.176606, 1, 1, 1, 1, 1,
1.021317, -1.594269, 1.458184, 1, 1, 1, 1, 1,
1.0214, -0.2896188, 2.838485, 1, 1, 1, 1, 1,
1.022436, -0.7483001, 2.119735, 1, 1, 1, 1, 1,
1.023328, -0.4244614, 2.549266, 1, 1, 1, 1, 1,
1.025589, -1.334344, 1.612291, 0, 0, 1, 1, 1,
1.03085, -0.3953065, 3.456526, 1, 0, 0, 1, 1,
1.03347, -1.056182, 2.190072, 1, 0, 0, 1, 1,
1.038452, -1.067516, 2.864622, 1, 0, 0, 1, 1,
1.040439, 0.5099711, 1.33287, 1, 0, 0, 1, 1,
1.04544, -1.221267, 2.63096, 1, 0, 0, 1, 1,
1.062034, -0.7132217, 3.469248, 0, 0, 0, 1, 1,
1.06307, -0.3590947, 3.702239, 0, 0, 0, 1, 1,
1.091495, 0.5311002, 1.404867, 0, 0, 0, 1, 1,
1.094155, 1.37613, 0.211585, 0, 0, 0, 1, 1,
1.097034, -2.521232, 3.673988, 0, 0, 0, 1, 1,
1.099922, 1.373668, 1.504037, 0, 0, 0, 1, 1,
1.100377, 0.4697237, 1.497189, 0, 0, 0, 1, 1,
1.10253, 0.5929529, 1.508606, 1, 1, 1, 1, 1,
1.103076, 0.5342804, 0.9514154, 1, 1, 1, 1, 1,
1.1086, 0.5222151, 0.3021797, 1, 1, 1, 1, 1,
1.125557, 1.203897, -1.026571, 1, 1, 1, 1, 1,
1.125931, 0.3544303, 1.427567, 1, 1, 1, 1, 1,
1.130775, -0.4694693, 1.733964, 1, 1, 1, 1, 1,
1.130775, 0.9031421, 0.637444, 1, 1, 1, 1, 1,
1.132624, -1.260733, 3.317078, 1, 1, 1, 1, 1,
1.134436, -0.04603682, 1.137672, 1, 1, 1, 1, 1,
1.14228, -1.227418, 2.061862, 1, 1, 1, 1, 1,
1.147315, 0.357536, 1.390715, 1, 1, 1, 1, 1,
1.148561, -0.5724173, 1.640116, 1, 1, 1, 1, 1,
1.152841, -0.2603112, 2.79784, 1, 1, 1, 1, 1,
1.154801, 0.2370653, 1.481343, 1, 1, 1, 1, 1,
1.155232, 0.4348615, 2.617963, 1, 1, 1, 1, 1,
1.159238, 0.5761131, -1.205491, 0, 0, 1, 1, 1,
1.160254, 0.7680155, 0.225606, 1, 0, 0, 1, 1,
1.168006, -0.7245644, 0.6971599, 1, 0, 0, 1, 1,
1.17255, 0.07496183, 1.612352, 1, 0, 0, 1, 1,
1.17862, 0.02432901, 1.085837, 1, 0, 0, 1, 1,
1.181018, 0.4509547, 1.051628, 1, 0, 0, 1, 1,
1.199903, 0.6663332, 0.654171, 0, 0, 0, 1, 1,
1.205028, -1.382119, 1.5894, 0, 0, 0, 1, 1,
1.21142, 0.4104998, -1.602268, 0, 0, 0, 1, 1,
1.215495, 0.8094038, 1.023268, 0, 0, 0, 1, 1,
1.216521, -0.2512494, 1.472912, 0, 0, 0, 1, 1,
1.221416, -1.804859, 3.84542, 0, 0, 0, 1, 1,
1.223012, 0.2524142, 0.6021687, 0, 0, 0, 1, 1,
1.223548, -1.504774, 1.593895, 1, 1, 1, 1, 1,
1.224506, -0.01167363, 2.245792, 1, 1, 1, 1, 1,
1.234868, -1.233947, 3.672299, 1, 1, 1, 1, 1,
1.238181, -0.1890032, 1.773894, 1, 1, 1, 1, 1,
1.251897, 0.1700982, 3.260074, 1, 1, 1, 1, 1,
1.254542, -1.255498, 3.678104, 1, 1, 1, 1, 1,
1.259051, -0.1638953, 1.931118, 1, 1, 1, 1, 1,
1.262325, -0.3464235, 2.610852, 1, 1, 1, 1, 1,
1.264019, -0.4673663, 0.8209416, 1, 1, 1, 1, 1,
1.26487, 0.930943, -0.4794571, 1, 1, 1, 1, 1,
1.266262, 0.5452363, 1.163519, 1, 1, 1, 1, 1,
1.266744, 0.554538, 1.304631, 1, 1, 1, 1, 1,
1.275746, 0.7357777, 1.374982, 1, 1, 1, 1, 1,
1.285114, 0.7705128, 0.730291, 1, 1, 1, 1, 1,
1.288482, -0.273658, 2.531178, 1, 1, 1, 1, 1,
1.297433, -0.40963, 0.7466652, 0, 0, 1, 1, 1,
1.303043, -0.9817039, 3.130607, 1, 0, 0, 1, 1,
1.303933, 0.2338276, 1.294955, 1, 0, 0, 1, 1,
1.306063, 1.522099, 0.7648354, 1, 0, 0, 1, 1,
1.309191, -0.1019164, 0.4232149, 1, 0, 0, 1, 1,
1.319222, -0.693651, 1.112935, 1, 0, 0, 1, 1,
1.319737, -1.473985, 1.67698, 0, 0, 0, 1, 1,
1.321786, -0.7196604, 3.8834, 0, 0, 0, 1, 1,
1.326981, 0.7397632, -0.3081489, 0, 0, 0, 1, 1,
1.336261, 0.1880495, 1.311526, 0, 0, 0, 1, 1,
1.345198, 0.1381633, -0.4776763, 0, 0, 0, 1, 1,
1.361419, -0.2900559, 1.750826, 0, 0, 0, 1, 1,
1.362556, -0.8495054, 0.649327, 0, 0, 0, 1, 1,
1.369417, -0.9124916, 1.762, 1, 1, 1, 1, 1,
1.374127, 0.6868352, 1.925146, 1, 1, 1, 1, 1,
1.374612, -0.8326746, 1.713537, 1, 1, 1, 1, 1,
1.389687, -1.125245, 1.351989, 1, 1, 1, 1, 1,
1.394543, -0.2686508, 1.604391, 1, 1, 1, 1, 1,
1.399743, -0.5817745, 1.58865, 1, 1, 1, 1, 1,
1.400707, -0.5794651, -0.2040682, 1, 1, 1, 1, 1,
1.401858, 2.096414, 4.157187, 1, 1, 1, 1, 1,
1.40245, -0.1642277, 2.492593, 1, 1, 1, 1, 1,
1.408975, 0.6319694, 2.272509, 1, 1, 1, 1, 1,
1.420763, -0.02260148, 2.13464, 1, 1, 1, 1, 1,
1.421928, 0.7289862, 1.459281, 1, 1, 1, 1, 1,
1.424717, -0.1102744, 1.479212, 1, 1, 1, 1, 1,
1.426953, -1.065362, 1.535601, 1, 1, 1, 1, 1,
1.435855, -0.2781723, 2.184436, 1, 1, 1, 1, 1,
1.447095, 0.916892, 1.202396, 0, 0, 1, 1, 1,
1.461167, -0.260482, 1.240505, 1, 0, 0, 1, 1,
1.464704, 2.453988, 0.5186824, 1, 0, 0, 1, 1,
1.474041, 0.4597531, 1.311409, 1, 0, 0, 1, 1,
1.477865, -0.8506889, 2.97562, 1, 0, 0, 1, 1,
1.488137, -0.6247382, 3.613152, 1, 0, 0, 1, 1,
1.494928, 1.070125, 0.985833, 0, 0, 0, 1, 1,
1.498249, 0.0211012, 2.364578, 0, 0, 0, 1, 1,
1.501722, 0.1463853, 1.067577, 0, 0, 0, 1, 1,
1.502678, 0.9650437, 1.828767, 0, 0, 0, 1, 1,
1.505276, 0.6050545, 1.714324, 0, 0, 0, 1, 1,
1.509479, -2.156845, 2.408044, 0, 0, 0, 1, 1,
1.509526, 0.729517, 0.7293707, 0, 0, 0, 1, 1,
1.513587, 0.608441, 2.114731, 1, 1, 1, 1, 1,
1.554536, 1.576559, 1.880195, 1, 1, 1, 1, 1,
1.566267, 0.6275108, 1.260113, 1, 1, 1, 1, 1,
1.580253, -0.7169059, 1.675036, 1, 1, 1, 1, 1,
1.589313, -0.8914074, 2.791035, 1, 1, 1, 1, 1,
1.593621, -1.204138, 3.663757, 1, 1, 1, 1, 1,
1.595411, 0.6500354, 0.4904156, 1, 1, 1, 1, 1,
1.604579, 0.9661652, -0.1902615, 1, 1, 1, 1, 1,
1.631538, -0.2822162, 2.514106, 1, 1, 1, 1, 1,
1.637193, 0.1950791, 3.021344, 1, 1, 1, 1, 1,
1.647505, 1.632403, 1.019911, 1, 1, 1, 1, 1,
1.665186, -0.5075744, 3.057857, 1, 1, 1, 1, 1,
1.690618, 1.319298, 1.796831, 1, 1, 1, 1, 1,
1.696011, -1.027152, 0.09817589, 1, 1, 1, 1, 1,
1.698409, 0.1369074, 0.8131562, 1, 1, 1, 1, 1,
1.70873, -0.0416564, 1.653033, 0, 0, 1, 1, 1,
1.717278, 1.696179, 2.364333, 1, 0, 0, 1, 1,
1.717443, -0.5585399, 1.253746, 1, 0, 0, 1, 1,
1.726909, -0.046514, 1.754384, 1, 0, 0, 1, 1,
1.727193, 0.1801706, 0.1181228, 1, 0, 0, 1, 1,
1.729366, -0.1495159, 3.32969, 1, 0, 0, 1, 1,
1.761102, 0.6146952, -0.2421904, 0, 0, 0, 1, 1,
1.769264, -1.151619, 5.41598, 0, 0, 0, 1, 1,
1.773006, -1.774923, 2.902732, 0, 0, 0, 1, 1,
1.791996, -0.5133187, 0.650549, 0, 0, 0, 1, 1,
1.793624, 1.386181, -1.584343, 0, 0, 0, 1, 1,
1.799846, 1.598254, 0.7817055, 0, 0, 0, 1, 1,
1.812549, -0.7255522, 2.908373, 0, 0, 0, 1, 1,
1.835883, -0.2651159, 3.583127, 1, 1, 1, 1, 1,
1.87088, 1.07008, -0.6027035, 1, 1, 1, 1, 1,
1.888216, -0.5561856, 1.518066, 1, 1, 1, 1, 1,
1.888344, 0.1056904, 1.269449, 1, 1, 1, 1, 1,
1.890046, 1.852448, 3.218154, 1, 1, 1, 1, 1,
1.904046, -2.725852, 3.041235, 1, 1, 1, 1, 1,
1.922014, -0.1448999, 1.619536, 1, 1, 1, 1, 1,
1.924025, 0.171185, 2.067243, 1, 1, 1, 1, 1,
1.924743, 2.174931, 0.4174048, 1, 1, 1, 1, 1,
1.925217, -0.7601533, 2.646054, 1, 1, 1, 1, 1,
1.955034, -1.140291, 3.724038, 1, 1, 1, 1, 1,
1.966865, -2.437864, 3.931016, 1, 1, 1, 1, 1,
1.987507, 0.5393506, 0.9684889, 1, 1, 1, 1, 1,
2.022044, -0.2973356, 2.360349, 1, 1, 1, 1, 1,
2.036692, 0.3640884, 2.857689, 1, 1, 1, 1, 1,
2.087643, -2.152214, 2.195669, 0, 0, 1, 1, 1,
2.091567, -0.2515345, 1.917142, 1, 0, 0, 1, 1,
2.098101, -0.1084745, 2.352309, 1, 0, 0, 1, 1,
2.111506, 1.565895, 2.451313, 1, 0, 0, 1, 1,
2.154071, 0.8493498, 1.295357, 1, 0, 0, 1, 1,
2.171795, -0.5897927, 1.332341, 1, 0, 0, 1, 1,
2.201016, 0.1939616, 1.638713, 0, 0, 0, 1, 1,
2.246794, -0.6774209, 1.40459, 0, 0, 0, 1, 1,
2.249028, 0.1648453, 0.8639799, 0, 0, 0, 1, 1,
2.293206, -0.3352138, 1.243877, 0, 0, 0, 1, 1,
2.3104, 0.4639014, 1.330525, 0, 0, 0, 1, 1,
2.322832, 1.604585, -0.1283933, 0, 0, 0, 1, 1,
2.322909, 0.4065354, 1.59068, 0, 0, 0, 1, 1,
2.357226, -1.159796, 1.765204, 1, 1, 1, 1, 1,
2.394888, 1.338647, 1.108593, 1, 1, 1, 1, 1,
2.436579, 1.237135, 1.750226, 1, 1, 1, 1, 1,
2.47073, 0.7757668, 2.323503, 1, 1, 1, 1, 1,
2.482344, 1.295613, 1.674843, 1, 1, 1, 1, 1,
2.485467, 0.4965037, 0.8335143, 1, 1, 1, 1, 1,
2.49519, -0.4250224, -0.07060483, 1, 1, 1, 1, 1
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
var radius = 9.577632;
var distance = 33.64103;
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
mvMatrix.translate( 0.5024018, 0.2067199, -0.07712674 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.64103);
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
