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
-3.078209, 0.3262266, -1.903904, 1, 0, 0, 1,
-2.962933, -0.33885, -1.894761, 1, 0.007843138, 0, 1,
-2.774732, 0.04324858, -1.007142, 1, 0.01176471, 0, 1,
-2.746531, 0.8286703, -0.8777115, 1, 0.01960784, 0, 1,
-2.735967, 0.1054936, -0.8281745, 1, 0.02352941, 0, 1,
-2.707605, -1.565521, -2.535321, 1, 0.03137255, 0, 1,
-2.647484, -1.000452, -1.436699, 1, 0.03529412, 0, 1,
-2.582079, 0.6482397, -0.8043273, 1, 0.04313726, 0, 1,
-2.571185, -0.02867462, -2.541414, 1, 0.04705882, 0, 1,
-2.559182, 0.2793132, -1.904229, 1, 0.05490196, 0, 1,
-2.530595, -1.899547, -1.521497, 1, 0.05882353, 0, 1,
-2.369841, 0.3831304, -0.8727271, 1, 0.06666667, 0, 1,
-2.318916, 0.6451864, -2.11129, 1, 0.07058824, 0, 1,
-2.221765, 0.5651901, -2.285596, 1, 0.07843138, 0, 1,
-2.183197, -1.120184, -1.816604, 1, 0.08235294, 0, 1,
-2.106842, -0.2087016, -1.554125, 1, 0.09019608, 0, 1,
-2.100575, -0.07809663, -2.523028, 1, 0.09411765, 0, 1,
-2.091268, -0.1283502, -2.092837, 1, 0.1019608, 0, 1,
-2.088135, 0.1105881, -0.8143194, 1, 0.1098039, 0, 1,
-2.063891, 0.5932828, -0.8296192, 1, 0.1137255, 0, 1,
-2.057455, 1.170297, -2.299628, 1, 0.1215686, 0, 1,
-2.040639, -1.121168, -3.039056, 1, 0.1254902, 0, 1,
-2.036019, -2.026475, -1.754491, 1, 0.1333333, 0, 1,
-2.029546, -1.627476, -0.8683298, 1, 0.1372549, 0, 1,
-2.023746, -0.7687262, -1.05933, 1, 0.145098, 0, 1,
-2.005762, 1.909294, -2.31366, 1, 0.1490196, 0, 1,
-1.998448, 0.6462802, -1.410873, 1, 0.1568628, 0, 1,
-1.971612, 0.05730994, -2.259768, 1, 0.1607843, 0, 1,
-1.966412, -0.548589, -2.149232, 1, 0.1686275, 0, 1,
-1.948201, -1.499201, -2.430663, 1, 0.172549, 0, 1,
-1.92189, 0.60026, -1.39629, 1, 0.1803922, 0, 1,
-1.88389, 0.9776674, 0.9078856, 1, 0.1843137, 0, 1,
-1.874326, 0.04329534, -2.568265, 1, 0.1921569, 0, 1,
-1.866833, 1.591447, -1.285727, 1, 0.1960784, 0, 1,
-1.836889, 0.6316341, -1.418452, 1, 0.2039216, 0, 1,
-1.835556, 1.540944, -2.659496, 1, 0.2117647, 0, 1,
-1.812263, -1.989307, -2.284055, 1, 0.2156863, 0, 1,
-1.810891, 0.5563779, -1.985896, 1, 0.2235294, 0, 1,
-1.794195, 0.2417803, -1.988962, 1, 0.227451, 0, 1,
-1.767208, 0.07907409, -2.008224, 1, 0.2352941, 0, 1,
-1.764024, -0.003217702, -1.037689, 1, 0.2392157, 0, 1,
-1.758075, 0.7384076, -1.745879, 1, 0.2470588, 0, 1,
-1.740145, -0.842585, -2.596832, 1, 0.2509804, 0, 1,
-1.735843, 0.5700432, -1.620317, 1, 0.2588235, 0, 1,
-1.732028, 0.3707941, -0.6436532, 1, 0.2627451, 0, 1,
-1.725563, 0.7503904, -1.330458, 1, 0.2705882, 0, 1,
-1.712228, 0.9997618, -0.3856325, 1, 0.2745098, 0, 1,
-1.683259, 2.037518, 1.613223, 1, 0.282353, 0, 1,
-1.677978, -1.196809, -2.379935, 1, 0.2862745, 0, 1,
-1.664945, -0.8446403, -2.921731, 1, 0.2941177, 0, 1,
-1.662524, -0.802652, -1.842537, 1, 0.3019608, 0, 1,
-1.657734, -2.063784, -2.387608, 1, 0.3058824, 0, 1,
-1.649456, 0.3482303, -1.937368, 1, 0.3137255, 0, 1,
-1.642307, -0.3479967, -2.10884, 1, 0.3176471, 0, 1,
-1.641947, -1.288773, -3.563286, 1, 0.3254902, 0, 1,
-1.641086, 1.698908, 0.2641571, 1, 0.3294118, 0, 1,
-1.633318, 2.263861, -0.5903499, 1, 0.3372549, 0, 1,
-1.626371, 0.9008359, -1.493441, 1, 0.3411765, 0, 1,
-1.621104, -0.8863255, -2.724521, 1, 0.3490196, 0, 1,
-1.598849, -0.3488416, -2.29055, 1, 0.3529412, 0, 1,
-1.595981, -1.481981, -4.349056, 1, 0.3607843, 0, 1,
-1.594983, 0.7995808, -0.4722517, 1, 0.3647059, 0, 1,
-1.578596, -1.676033, -2.651197, 1, 0.372549, 0, 1,
-1.561829, -0.6553559, -3.847689, 1, 0.3764706, 0, 1,
-1.558918, 0.7762554, -1.926831, 1, 0.3843137, 0, 1,
-1.553233, 0.3316873, -0.2235913, 1, 0.3882353, 0, 1,
-1.548759, -0.3428794, -1.624415, 1, 0.3960784, 0, 1,
-1.547613, -0.489133, -2.612877, 1, 0.4039216, 0, 1,
-1.527101, -0.2984, -2.072755, 1, 0.4078431, 0, 1,
-1.516925, 0.8390282, 0.3048105, 1, 0.4156863, 0, 1,
-1.511353, 0.2290377, -1.207219, 1, 0.4196078, 0, 1,
-1.510843, -0.4881477, -1.162214, 1, 0.427451, 0, 1,
-1.504654, 0.4501891, -0.1667186, 1, 0.4313726, 0, 1,
-1.504575, 1.339494, -0.4155653, 1, 0.4392157, 0, 1,
-1.468777, 0.823436, -0.8059897, 1, 0.4431373, 0, 1,
-1.462536, 0.1619476, -0.1073911, 1, 0.4509804, 0, 1,
-1.462175, 0.1466139, -1.446246, 1, 0.454902, 0, 1,
-1.460825, -0.4819181, -3.020334, 1, 0.4627451, 0, 1,
-1.459945, 0.667238, -2.002069, 1, 0.4666667, 0, 1,
-1.454532, -1.069871, -2.504231, 1, 0.4745098, 0, 1,
-1.4526, -0.6339797, -2.076324, 1, 0.4784314, 0, 1,
-1.448502, 0.8159524, -3.126534, 1, 0.4862745, 0, 1,
-1.435364, 0.8578264, 0.02338878, 1, 0.4901961, 0, 1,
-1.407618, 0.205855, -0.2416034, 1, 0.4980392, 0, 1,
-1.405739, 0.357904, -0.893277, 1, 0.5058824, 0, 1,
-1.403269, 0.9290509, -1.180126, 1, 0.509804, 0, 1,
-1.396986, -1.082329, -1.949188, 1, 0.5176471, 0, 1,
-1.38622, 1.166311, -1.888393, 1, 0.5215687, 0, 1,
-1.37931, 2.041266, -1.052381, 1, 0.5294118, 0, 1,
-1.373892, 0.06066189, -0.9393303, 1, 0.5333334, 0, 1,
-1.363791, -1.007066, -1.533682, 1, 0.5411765, 0, 1,
-1.348851, -0.808183, -2.779326, 1, 0.5450981, 0, 1,
-1.345369, -2.810591, -1.91191, 1, 0.5529412, 0, 1,
-1.341102, 1.61571, -1.186203, 1, 0.5568628, 0, 1,
-1.340143, 1.485108, -2.290657, 1, 0.5647059, 0, 1,
-1.335972, 1.073048, -0.2095975, 1, 0.5686275, 0, 1,
-1.335099, 1.624627, -0.4035901, 1, 0.5764706, 0, 1,
-1.327894, -1.211476, -3.854928, 1, 0.5803922, 0, 1,
-1.32651, -1.833581, -2.374167, 1, 0.5882353, 0, 1,
-1.322113, 0.5479999, -0.9261617, 1, 0.5921569, 0, 1,
-1.318776, -0.4482818, -1.416039, 1, 0.6, 0, 1,
-1.312375, -0.9021862, -1.275951, 1, 0.6078432, 0, 1,
-1.29598, 1.182701, -0.8309498, 1, 0.6117647, 0, 1,
-1.289081, 0.4454418, -0.6349027, 1, 0.6196079, 0, 1,
-1.28642, -1.510757, -0.8778411, 1, 0.6235294, 0, 1,
-1.285784, -0.6984168, -1.296609, 1, 0.6313726, 0, 1,
-1.271363, 0.1139804, -0.4546385, 1, 0.6352941, 0, 1,
-1.269504, -1.701208, -2.47562, 1, 0.6431373, 0, 1,
-1.268076, 0.4927321, -0.4358698, 1, 0.6470588, 0, 1,
-1.261829, 1.273613, -2.374014, 1, 0.654902, 0, 1,
-1.259196, -1.748896, -0.9576461, 1, 0.6588235, 0, 1,
-1.258479, 0.8056801, -1.755396, 1, 0.6666667, 0, 1,
-1.256455, -1.318435, -0.9996991, 1, 0.6705883, 0, 1,
-1.251444, -0.5533684, -1.842154, 1, 0.6784314, 0, 1,
-1.243919, -1.09105, -1.463923, 1, 0.682353, 0, 1,
-1.238586, -0.1607949, -1.173311, 1, 0.6901961, 0, 1,
-1.238256, 1.970259, -2.440398, 1, 0.6941177, 0, 1,
-1.231186, -0.4360189, -2.873424, 1, 0.7019608, 0, 1,
-1.227942, 0.4537875, 0.4478984, 1, 0.7098039, 0, 1,
-1.220282, -0.5298471, -2.940688, 1, 0.7137255, 0, 1,
-1.216374, -0.1772176, -2.59804, 1, 0.7215686, 0, 1,
-1.214698, -1.101417, -2.004865, 1, 0.7254902, 0, 1,
-1.214466, -1.470138, -2.150653, 1, 0.7333333, 0, 1,
-1.214206, -1.900269, -1.111694, 1, 0.7372549, 0, 1,
-1.207353, -2.147152, -2.638379, 1, 0.7450981, 0, 1,
-1.205569, -0.5107323, -4.380397, 1, 0.7490196, 0, 1,
-1.202919, 0.1497383, -2.330507, 1, 0.7568628, 0, 1,
-1.199132, -0.5414443, -2.367136, 1, 0.7607843, 0, 1,
-1.197624, 0.830803, -1.598593, 1, 0.7686275, 0, 1,
-1.196092, 1.024514, -0.83661, 1, 0.772549, 0, 1,
-1.189593, 0.2911397, -2.896127, 1, 0.7803922, 0, 1,
-1.185861, 0.5261144, -1.96131, 1, 0.7843137, 0, 1,
-1.17778, 1.389437, -1.217317, 1, 0.7921569, 0, 1,
-1.17733, 0.4288454, -3.10902, 1, 0.7960784, 0, 1,
-1.171805, -0.5428044, -1.299586, 1, 0.8039216, 0, 1,
-1.167358, 0.9875804, -3.308341, 1, 0.8117647, 0, 1,
-1.166705, 0.2148163, -0.706758, 1, 0.8156863, 0, 1,
-1.151085, -1.176117, -3.574882, 1, 0.8235294, 0, 1,
-1.151044, -0.5360836, -1.658835, 1, 0.827451, 0, 1,
-1.141754, 0.1208066, -4.412341, 1, 0.8352941, 0, 1,
-1.129295, -0.4251766, -0.6478171, 1, 0.8392157, 0, 1,
-1.123346, -0.1198109, -1.086151, 1, 0.8470588, 0, 1,
-1.121632, 0.1225871, -0.9898575, 1, 0.8509804, 0, 1,
-1.110959, 0.04000171, -1.691259, 1, 0.8588235, 0, 1,
-1.108002, -0.244272, -2.378147, 1, 0.8627451, 0, 1,
-1.102885, -2.526948, -0.8960958, 1, 0.8705882, 0, 1,
-1.089571, -0.02261945, -3.09844, 1, 0.8745098, 0, 1,
-1.084152, 0.9676462, -1.090402, 1, 0.8823529, 0, 1,
-1.075578, 1.241752, -0.9689091, 1, 0.8862745, 0, 1,
-1.074878, -0.4154562, -3.664354, 1, 0.8941177, 0, 1,
-1.055384, 0.9368161, -0.5506071, 1, 0.8980392, 0, 1,
-1.044598, 1.376334, -0.3918045, 1, 0.9058824, 0, 1,
-1.040262, -1.710229, -1.647484, 1, 0.9137255, 0, 1,
-1.038661, 0.1485651, -2.198141, 1, 0.9176471, 0, 1,
-1.034977, -1.225324, -3.057153, 1, 0.9254902, 0, 1,
-1.030601, -0.6485975, -2.391207, 1, 0.9294118, 0, 1,
-1.023611, 0.05123492, -2.34696, 1, 0.9372549, 0, 1,
-0.9926373, 0.6572524, -1.713908, 1, 0.9411765, 0, 1,
-0.992441, 1.371926, -1.530324, 1, 0.9490196, 0, 1,
-0.9917198, -0.7624639, -1.960939, 1, 0.9529412, 0, 1,
-0.9751772, 0.1678425, -0.9972216, 1, 0.9607843, 0, 1,
-0.9743029, 1.062807, -0.002235551, 1, 0.9647059, 0, 1,
-0.9730603, 0.9835905, -1.228055, 1, 0.972549, 0, 1,
-0.965197, -0.5491552, -3.747593, 1, 0.9764706, 0, 1,
-0.9599454, 0.6223345, 0.1301634, 1, 0.9843137, 0, 1,
-0.955672, -0.1137453, -0.5050113, 1, 0.9882353, 0, 1,
-0.9524841, -0.1426414, -2.259315, 1, 0.9960784, 0, 1,
-0.9509723, 0.4141831, -0.3575296, 0.9960784, 1, 0, 1,
-0.9410763, 0.5984541, 0.4868701, 0.9921569, 1, 0, 1,
-0.9387746, -0.2587216, -2.970371, 0.9843137, 1, 0, 1,
-0.9350138, 1.121902, 0.2513002, 0.9803922, 1, 0, 1,
-0.9317316, -0.158062, -3.011482, 0.972549, 1, 0, 1,
-0.9309738, 0.7964543, -3.961481, 0.9686275, 1, 0, 1,
-0.9267439, 0.7038561, -0.08860726, 0.9607843, 1, 0, 1,
-0.9174474, -0.1005491, -2.841498, 0.9568627, 1, 0, 1,
-0.9148007, 1.428218, 0.01256031, 0.9490196, 1, 0, 1,
-0.9146885, -0.5363596, -1.620054, 0.945098, 1, 0, 1,
-0.9064001, 0.8083653, -0.03890485, 0.9372549, 1, 0, 1,
-0.903536, 0.2530008, 0.1926117, 0.9333333, 1, 0, 1,
-0.9020242, -0.3845238, -0.3887661, 0.9254902, 1, 0, 1,
-0.9014724, -1.72027, -2.812397, 0.9215686, 1, 0, 1,
-0.8991075, 1.854048, -0.1915305, 0.9137255, 1, 0, 1,
-0.8951215, 2.367993, -1.807825, 0.9098039, 1, 0, 1,
-0.894242, 0.2095271, -1.943864, 0.9019608, 1, 0, 1,
-0.8868716, -0.5517651, -2.968537, 0.8941177, 1, 0, 1,
-0.8853232, -0.4682913, -0.8938919, 0.8901961, 1, 0, 1,
-0.8749751, -1.052502, -1.383177, 0.8823529, 1, 0, 1,
-0.8744113, 0.2269201, -0.3421908, 0.8784314, 1, 0, 1,
-0.8735651, -1.204898, -1.465848, 0.8705882, 1, 0, 1,
-0.8728749, -0.3208588, -3.107048, 0.8666667, 1, 0, 1,
-0.8658369, -1.618222, -1.165646, 0.8588235, 1, 0, 1,
-0.8521022, 0.738125, -0.138993, 0.854902, 1, 0, 1,
-0.8431035, -0.4759324, -2.618993, 0.8470588, 1, 0, 1,
-0.8357186, -1.345485, -2.220291, 0.8431373, 1, 0, 1,
-0.8335534, -0.4381876, -1.785271, 0.8352941, 1, 0, 1,
-0.83163, 0.5950829, 0.5696604, 0.8313726, 1, 0, 1,
-0.8311555, -1.671225, -1.230013, 0.8235294, 1, 0, 1,
-0.8239886, -0.1297476, -1.868496, 0.8196079, 1, 0, 1,
-0.8227701, 0.3351673, -0.863502, 0.8117647, 1, 0, 1,
-0.8218353, -1.772181, -3.299247, 0.8078431, 1, 0, 1,
-0.8203609, -0.5743496, -2.8416, 0.8, 1, 0, 1,
-0.8186065, -0.7750993, -1.772786, 0.7921569, 1, 0, 1,
-0.8109159, -0.8122011, -3.6018, 0.7882353, 1, 0, 1,
-0.8103682, -1.058794, -2.632084, 0.7803922, 1, 0, 1,
-0.8100917, 1.794358, 0.9959959, 0.7764706, 1, 0, 1,
-0.8096979, 1.236878, 1.761906, 0.7686275, 1, 0, 1,
-0.8084519, 0.210366, -1.817576, 0.7647059, 1, 0, 1,
-0.7999963, 0.7274843, 0.8764033, 0.7568628, 1, 0, 1,
-0.7912385, -1.196801, -2.641573, 0.7529412, 1, 0, 1,
-0.790966, 0.3837927, -0.6170619, 0.7450981, 1, 0, 1,
-0.7890757, -1.142131, -1.365981, 0.7411765, 1, 0, 1,
-0.7817618, 0.9572842, -1.176727, 0.7333333, 1, 0, 1,
-0.7763425, -2.08422, -2.765385, 0.7294118, 1, 0, 1,
-0.771848, 0.4243482, 0.9254096, 0.7215686, 1, 0, 1,
-0.7647579, 1.211793, -0.4962783, 0.7176471, 1, 0, 1,
-0.7544779, -0.3504884, -3.346661, 0.7098039, 1, 0, 1,
-0.7484474, -1.169577, -1.796807, 0.7058824, 1, 0, 1,
-0.7471526, -1.127545, -3.204915, 0.6980392, 1, 0, 1,
-0.7439986, 1.543383, -1.075073, 0.6901961, 1, 0, 1,
-0.7427018, 0.2873024, -2.2072, 0.6862745, 1, 0, 1,
-0.7421182, 0.9964716, -2.051485, 0.6784314, 1, 0, 1,
-0.7397177, -1.335961, -2.991901, 0.6745098, 1, 0, 1,
-0.739652, -0.3774756, -2.985002, 0.6666667, 1, 0, 1,
-0.7347874, 0.2979813, -1.117147, 0.6627451, 1, 0, 1,
-0.7344379, -0.8634032, -1.00517, 0.654902, 1, 0, 1,
-0.7216861, 0.1643758, -1.620398, 0.6509804, 1, 0, 1,
-0.7213377, -1.333095, -3.059406, 0.6431373, 1, 0, 1,
-0.7183329, -0.6097053, -0.9220549, 0.6392157, 1, 0, 1,
-0.7179761, 0.8623463, -1.714097, 0.6313726, 1, 0, 1,
-0.7120832, 0.138382, -1.980571, 0.627451, 1, 0, 1,
-0.708027, 0.4043712, -0.2304485, 0.6196079, 1, 0, 1,
-0.7074218, -0.221911, -1.344822, 0.6156863, 1, 0, 1,
-0.7006904, 1.005433, -1.474444, 0.6078432, 1, 0, 1,
-0.6998104, -1.125197, -1.88892, 0.6039216, 1, 0, 1,
-0.6917502, -2.268274, -3.132665, 0.5960785, 1, 0, 1,
-0.6867206, 0.4571158, 0.4361771, 0.5882353, 1, 0, 1,
-0.68396, 0.5936844, -1.241747, 0.5843138, 1, 0, 1,
-0.6752859, 0.2525539, -0.414854, 0.5764706, 1, 0, 1,
-0.6711675, 0.3435174, -0.2104508, 0.572549, 1, 0, 1,
-0.6631534, -0.02972309, -2.383117, 0.5647059, 1, 0, 1,
-0.6608489, 1.266993, -0.03992742, 0.5607843, 1, 0, 1,
-0.6558278, 0.92277, -0.5546338, 0.5529412, 1, 0, 1,
-0.6497124, -0.3105117, -0.01229081, 0.5490196, 1, 0, 1,
-0.6490301, -1.842375, -1.791589, 0.5411765, 1, 0, 1,
-0.6483793, 0.475183, 0.7316728, 0.5372549, 1, 0, 1,
-0.6483564, -1.389214, -2.575269, 0.5294118, 1, 0, 1,
-0.6441772, 0.8640697, -0.6201858, 0.5254902, 1, 0, 1,
-0.6419777, 0.8935702, -0.7790739, 0.5176471, 1, 0, 1,
-0.6326498, -1.120534, -3.166706, 0.5137255, 1, 0, 1,
-0.6318756, -0.8011142, -3.102407, 0.5058824, 1, 0, 1,
-0.6309178, -1.300961, -3.954869, 0.5019608, 1, 0, 1,
-0.6308944, 0.8494833, -0.7859282, 0.4941176, 1, 0, 1,
-0.6289803, -1.09277, -3.76483, 0.4862745, 1, 0, 1,
-0.6138132, 0.2410692, -2.146372, 0.4823529, 1, 0, 1,
-0.6137433, -1.603645, -1.40567, 0.4745098, 1, 0, 1,
-0.6112001, 0.05419837, -2.220196, 0.4705882, 1, 0, 1,
-0.6017348, -0.3482668, -3.293281, 0.4627451, 1, 0, 1,
-0.6017206, -0.9488451, -2.367667, 0.4588235, 1, 0, 1,
-0.6009116, 1.863038, 0.1649704, 0.4509804, 1, 0, 1,
-0.6008486, 0.6202777, 0.9971482, 0.4470588, 1, 0, 1,
-0.591198, 2.276299, -1.150685, 0.4392157, 1, 0, 1,
-0.581997, -0.03627591, -0.8732369, 0.4352941, 1, 0, 1,
-0.5738422, 0.3352275, 0.3319896, 0.427451, 1, 0, 1,
-0.5719003, 0.2567756, -0.8673536, 0.4235294, 1, 0, 1,
-0.5708331, 0.2166741, -1.487784, 0.4156863, 1, 0, 1,
-0.568722, 0.8536792, -0.2699375, 0.4117647, 1, 0, 1,
-0.5620036, -0.5201604, -2.969675, 0.4039216, 1, 0, 1,
-0.5605992, -0.843946, -2.284726, 0.3960784, 1, 0, 1,
-0.5596805, -0.2979435, -1.223911, 0.3921569, 1, 0, 1,
-0.5577808, 0.4763724, 0.3466133, 0.3843137, 1, 0, 1,
-0.5538818, 1.490637, -1.276337, 0.3803922, 1, 0, 1,
-0.5500159, 0.06239082, 1.573985, 0.372549, 1, 0, 1,
-0.5482827, -0.8721949, -2.141174, 0.3686275, 1, 0, 1,
-0.5455261, 0.704237, 1.432201, 0.3607843, 1, 0, 1,
-0.543723, 0.4387431, -1.070499, 0.3568628, 1, 0, 1,
-0.5436907, 0.6626362, 0.4257879, 0.3490196, 1, 0, 1,
-0.5429693, 0.3130076, -2.358699, 0.345098, 1, 0, 1,
-0.5421472, 0.4079913, -0.5334021, 0.3372549, 1, 0, 1,
-0.539784, -1.153179, -2.955353, 0.3333333, 1, 0, 1,
-0.530229, 0.07035401, -0.410553, 0.3254902, 1, 0, 1,
-0.5300455, 0.183924, -1.869367, 0.3215686, 1, 0, 1,
-0.5263284, -0.09293284, -2.080287, 0.3137255, 1, 0, 1,
-0.5193754, -2.213517, -3.093007, 0.3098039, 1, 0, 1,
-0.5175373, -0.1551679, -3.291322, 0.3019608, 1, 0, 1,
-0.5168597, 0.04425044, -0.7893874, 0.2941177, 1, 0, 1,
-0.5157201, -0.2133397, -2.197836, 0.2901961, 1, 0, 1,
-0.5155375, 1.600006, -0.1474887, 0.282353, 1, 0, 1,
-0.5125012, -0.7729718, -3.03199, 0.2784314, 1, 0, 1,
-0.5083413, 0.1479561, -0.8723404, 0.2705882, 1, 0, 1,
-0.5037282, -0.8959041, -2.029381, 0.2666667, 1, 0, 1,
-0.5020762, 0.5985863, -1.824712, 0.2588235, 1, 0, 1,
-0.5020022, -1.397609, -2.407188, 0.254902, 1, 0, 1,
-0.5000429, 1.15518, 0.8779119, 0.2470588, 1, 0, 1,
-0.4966761, 0.1927093, -1.559819, 0.2431373, 1, 0, 1,
-0.4928955, -1.053725, -4.083291, 0.2352941, 1, 0, 1,
-0.4908487, 0.6265376, -0.4014826, 0.2313726, 1, 0, 1,
-0.4903411, 0.03303134, -3.658009, 0.2235294, 1, 0, 1,
-0.4886822, -1.291067, -2.947867, 0.2196078, 1, 0, 1,
-0.4866847, 0.6375551, 0.5928235, 0.2117647, 1, 0, 1,
-0.481383, -1.698826, -2.596931, 0.2078431, 1, 0, 1,
-0.4788298, 0.5043749, -1.404594, 0.2, 1, 0, 1,
-0.4730876, -0.2734463, -2.752212, 0.1921569, 1, 0, 1,
-0.4721004, -0.4226679, -1.299975, 0.1882353, 1, 0, 1,
-0.4700462, 1.597862, -2.128487, 0.1803922, 1, 0, 1,
-0.4672391, 0.8156874, -1.371316, 0.1764706, 1, 0, 1,
-0.4633524, 1.406634, -1.294166, 0.1686275, 1, 0, 1,
-0.4632887, 1.39621, 0.07314131, 0.1647059, 1, 0, 1,
-0.460733, -0.02589156, -2.405408, 0.1568628, 1, 0, 1,
-0.4590601, -1.156993, -2.798583, 0.1529412, 1, 0, 1,
-0.4581072, -0.6178982, -3.392901, 0.145098, 1, 0, 1,
-0.4561371, 0.1781057, -0.8618593, 0.1411765, 1, 0, 1,
-0.4560649, 0.3133495, -1.972015, 0.1333333, 1, 0, 1,
-0.4455187, 0.135953, -1.161534, 0.1294118, 1, 0, 1,
-0.4434538, -0.2609895, -3.010524, 0.1215686, 1, 0, 1,
-0.4421417, -0.6540591, -1.136761, 0.1176471, 1, 0, 1,
-0.4398295, -0.7873138, -2.654617, 0.1098039, 1, 0, 1,
-0.4389115, 0.4467367, -0.3056351, 0.1058824, 1, 0, 1,
-0.4372549, -2.050193, -5.482946, 0.09803922, 1, 0, 1,
-0.4332273, 0.8839344, 1.083106, 0.09019608, 1, 0, 1,
-0.4330187, 1.506016, -0.6217684, 0.08627451, 1, 0, 1,
-0.4291368, -0.7661704, -3.668101, 0.07843138, 1, 0, 1,
-0.4271805, 0.9380066, 0.4905755, 0.07450981, 1, 0, 1,
-0.4255698, -0.04644842, -2.64741, 0.06666667, 1, 0, 1,
-0.4250377, -0.9183818, -3.677115, 0.0627451, 1, 0, 1,
-0.4186502, -0.5917634, -2.136056, 0.05490196, 1, 0, 1,
-0.4166282, 0.5790018, -1.815504, 0.05098039, 1, 0, 1,
-0.4152975, -0.9782168, -1.829015, 0.04313726, 1, 0, 1,
-0.4141125, 0.902352, 1.5012, 0.03921569, 1, 0, 1,
-0.4106601, 0.9335898, 0.1998353, 0.03137255, 1, 0, 1,
-0.4076558, -1.072474, -2.059966, 0.02745098, 1, 0, 1,
-0.4065277, 0.8463385, -0.1242785, 0.01960784, 1, 0, 1,
-0.4051449, 1.368319, -0.5706847, 0.01568628, 1, 0, 1,
-0.4050099, -0.1886044, -0.7988225, 0.007843138, 1, 0, 1,
-0.3963212, -0.5671918, -1.533992, 0.003921569, 1, 0, 1,
-0.3944851, 1.284555, 1.030572, 0, 1, 0.003921569, 1,
-0.3938394, 0.7862436, 1.255989, 0, 1, 0.01176471, 1,
-0.3934982, 0.2166119, -1.63171, 0, 1, 0.01568628, 1,
-0.3800451, -0.5091467, -2.236062, 0, 1, 0.02352941, 1,
-0.3762667, -0.2185838, -2.266748, 0, 1, 0.02745098, 1,
-0.373279, 0.9061751, 0.1669588, 0, 1, 0.03529412, 1,
-0.3721465, 1.30146, -0.7210234, 0, 1, 0.03921569, 1,
-0.3683065, -0.5116253, -3.393787, 0, 1, 0.04705882, 1,
-0.3681794, -0.9464068, -2.802207, 0, 1, 0.05098039, 1,
-0.3676096, -1.102028, -3.402529, 0, 1, 0.05882353, 1,
-0.3625189, 1.430654, -0.8026114, 0, 1, 0.0627451, 1,
-0.3583533, 2.03591, -1.259889, 0, 1, 0.07058824, 1,
-0.357351, -0.7882437, -2.301471, 0, 1, 0.07450981, 1,
-0.3569897, -0.703306, -3.947996, 0, 1, 0.08235294, 1,
-0.3549587, 0.1893985, -0.585384, 0, 1, 0.08627451, 1,
-0.3549027, -0.9564055, -2.242401, 0, 1, 0.09411765, 1,
-0.3529984, 0.1398602, -2.712294, 0, 1, 0.1019608, 1,
-0.3512189, -1.444021, -3.796473, 0, 1, 0.1058824, 1,
-0.3460433, -0.6287382, -3.088971, 0, 1, 0.1137255, 1,
-0.3450934, -0.5734553, -1.390994, 0, 1, 0.1176471, 1,
-0.3408742, -0.7774894, -1.638705, 0, 1, 0.1254902, 1,
-0.3327837, -0.3310437, -3.539502, 0, 1, 0.1294118, 1,
-0.3269203, -0.6464584, -1.255519, 0, 1, 0.1372549, 1,
-0.3261293, -0.3644456, -2.844725, 0, 1, 0.1411765, 1,
-0.3244906, -0.05616114, -0.8759991, 0, 1, 0.1490196, 1,
-0.3189626, -1.283054, -2.741355, 0, 1, 0.1529412, 1,
-0.3154585, 0.2494158, -3.136157, 0, 1, 0.1607843, 1,
-0.3145088, 0.2857895, 0.7514791, 0, 1, 0.1647059, 1,
-0.308479, 0.4814619, -0.7540964, 0, 1, 0.172549, 1,
-0.3069, 0.2658631, 0.1038382, 0, 1, 0.1764706, 1,
-0.3041137, 1.216498, 0.56481, 0, 1, 0.1843137, 1,
-0.3035503, -1.771547, -3.564217, 0, 1, 0.1882353, 1,
-0.3027847, -0.5275164, -2.238482, 0, 1, 0.1960784, 1,
-0.2993578, -0.1272072, -1.633553, 0, 1, 0.2039216, 1,
-0.2959184, -1.925392, -4.003944, 0, 1, 0.2078431, 1,
-0.2934291, 0.5106625, 1.162305, 0, 1, 0.2156863, 1,
-0.2920409, 0.1878904, -1.32542, 0, 1, 0.2196078, 1,
-0.2872807, -0.3025555, -3.14369, 0, 1, 0.227451, 1,
-0.2853539, -0.2166059, -2.190238, 0, 1, 0.2313726, 1,
-0.2810383, 2.190519, -1.570341, 0, 1, 0.2392157, 1,
-0.2792979, -0.8996962, -1.884971, 0, 1, 0.2431373, 1,
-0.2787991, 0.7552533, 0.8288867, 0, 1, 0.2509804, 1,
-0.2776272, -2.30209, -3.261672, 0, 1, 0.254902, 1,
-0.2724846, -0.5247251, -3.209719, 0, 1, 0.2627451, 1,
-0.2713604, 0.7139523, -0.7699938, 0, 1, 0.2666667, 1,
-0.2711427, 0.07452572, -1.475453, 0, 1, 0.2745098, 1,
-0.2673466, -0.7304472, -3.107324, 0, 1, 0.2784314, 1,
-0.2598095, -0.6555225, -0.5454898, 0, 1, 0.2862745, 1,
-0.2579555, -0.4350181, -2.501638, 0, 1, 0.2901961, 1,
-0.2566158, 1.39219, 1.00263, 0, 1, 0.2980392, 1,
-0.2485476, -1.201587, -3.319625, 0, 1, 0.3058824, 1,
-0.2401149, -0.9709493, -3.332654, 0, 1, 0.3098039, 1,
-0.2392626, -1.329997, -2.08461, 0, 1, 0.3176471, 1,
-0.2383976, -1.490032, -3.435879, 0, 1, 0.3215686, 1,
-0.2374964, -1.326432, -5.53553, 0, 1, 0.3294118, 1,
-0.2372142, -0.3186214, -0.8723935, 0, 1, 0.3333333, 1,
-0.2371299, 0.1792773, -2.210742, 0, 1, 0.3411765, 1,
-0.2351819, 0.09184078, -1.624564, 0, 1, 0.345098, 1,
-0.2325483, -0.6317145, -3.412883, 0, 1, 0.3529412, 1,
-0.2308371, 0.01838857, -0.6212613, 0, 1, 0.3568628, 1,
-0.2259164, -0.3282209, -3.435433, 0, 1, 0.3647059, 1,
-0.2243321, -3.673646, -3.168984, 0, 1, 0.3686275, 1,
-0.2224899, -1.43512, -3.662418, 0, 1, 0.3764706, 1,
-0.2205711, -0.4083637, -2.984384, 0, 1, 0.3803922, 1,
-0.219918, 0.8232393, -0.4306916, 0, 1, 0.3882353, 1,
-0.2182556, 0.9935132, 0.899128, 0, 1, 0.3921569, 1,
-0.2173943, 1.350064, 0.1465852, 0, 1, 0.4, 1,
-0.2155408, 1.343063, -1.455291, 0, 1, 0.4078431, 1,
-0.212302, -0.2509453, -1.394093, 0, 1, 0.4117647, 1,
-0.2120535, 0.4153334, 1.012404, 0, 1, 0.4196078, 1,
-0.2080545, -1.199015, -5.043203, 0, 1, 0.4235294, 1,
-0.207438, -1.66851, -3.725467, 0, 1, 0.4313726, 1,
-0.2043569, -0.6107495, -2.626465, 0, 1, 0.4352941, 1,
-0.2025741, -1.053861, -2.409735, 0, 1, 0.4431373, 1,
-0.2013791, -0.2078543, -3.112389, 0, 1, 0.4470588, 1,
-0.1980347, 1.265035, 0.3603506, 0, 1, 0.454902, 1,
-0.1976224, -0.4880533, -2.783151, 0, 1, 0.4588235, 1,
-0.19699, -0.9560471, -2.937852, 0, 1, 0.4666667, 1,
-0.1958925, -0.6642641, -1.783563, 0, 1, 0.4705882, 1,
-0.1952149, 0.808691, -0.4860891, 0, 1, 0.4784314, 1,
-0.1866409, 0.8468156, 0.9936025, 0, 1, 0.4823529, 1,
-0.1851664, 2.036636, -0.6545041, 0, 1, 0.4901961, 1,
-0.1851292, -0.1407546, -3.16032, 0, 1, 0.4941176, 1,
-0.184119, -0.795505, -4.294863, 0, 1, 0.5019608, 1,
-0.1837217, -0.6958466, -3.485634, 0, 1, 0.509804, 1,
-0.1833541, -0.4774983, -3.396113, 0, 1, 0.5137255, 1,
-0.1807012, -0.8128356, -4.343242, 0, 1, 0.5215687, 1,
-0.1782043, 0.5047243, -0.7800053, 0, 1, 0.5254902, 1,
-0.1763105, 0.3824338, -0.1847481, 0, 1, 0.5333334, 1,
-0.176294, 1.0144, 0.3745155, 0, 1, 0.5372549, 1,
-0.1753314, -0.2145708, -2.528879, 0, 1, 0.5450981, 1,
-0.173473, -0.4430128, -3.164823, 0, 1, 0.5490196, 1,
-0.1723089, -0.08369966, -0.5040228, 0, 1, 0.5568628, 1,
-0.1682009, 0.03381719, -2.977026, 0, 1, 0.5607843, 1,
-0.1580969, -0.4030636, -2.516839, 0, 1, 0.5686275, 1,
-0.1541568, -0.907133, -2.912611, 0, 1, 0.572549, 1,
-0.1531081, 0.6941285, 0.009713057, 0, 1, 0.5803922, 1,
-0.1508357, 0.4454032, 0.08227808, 0, 1, 0.5843138, 1,
-0.150701, 0.205635, 0.08876656, 0, 1, 0.5921569, 1,
-0.1488858, -1.97809, -1.717766, 0, 1, 0.5960785, 1,
-0.1455594, 0.4129845, -1.478686, 0, 1, 0.6039216, 1,
-0.1453131, 1.56496, 1.031996, 0, 1, 0.6117647, 1,
-0.1449248, 1.91512, 0.4609189, 0, 1, 0.6156863, 1,
-0.144491, 0.9146743, -0.2309517, 0, 1, 0.6235294, 1,
-0.137731, -0.1264433, -2.227137, 0, 1, 0.627451, 1,
-0.1366343, 1.170601, -0.2325237, 0, 1, 0.6352941, 1,
-0.133821, 0.9173062, -1.171081, 0, 1, 0.6392157, 1,
-0.1318336, -0.8479506, -1.511658, 0, 1, 0.6470588, 1,
-0.1250765, -0.4875014, -2.551253, 0, 1, 0.6509804, 1,
-0.1243758, -0.1041136, -1.471304, 0, 1, 0.6588235, 1,
-0.1224621, -1.778598, -2.227077, 0, 1, 0.6627451, 1,
-0.1168303, 0.3300626, 0.8351564, 0, 1, 0.6705883, 1,
-0.1155613, 1.220116, -0.6142785, 0, 1, 0.6745098, 1,
-0.1083992, -1.817525, -3.668203, 0, 1, 0.682353, 1,
-0.1042403, -0.6505902, -1.916451, 0, 1, 0.6862745, 1,
-0.09884216, -1.390711, -2.934037, 0, 1, 0.6941177, 1,
-0.0986538, 0.3529122, -0.05002045, 0, 1, 0.7019608, 1,
-0.09710476, 1.865083, 0.0001476162, 0, 1, 0.7058824, 1,
-0.09458529, 0.2533014, -0.7471964, 0, 1, 0.7137255, 1,
-0.09440865, -1.079673, -3.793889, 0, 1, 0.7176471, 1,
-0.09235413, -0.5967659, -2.614044, 0, 1, 0.7254902, 1,
-0.09159397, -1.765587, -3.620737, 0, 1, 0.7294118, 1,
-0.08967395, 0.9000503, 0.8609614, 0, 1, 0.7372549, 1,
-0.08938912, 0.986033, -0.2629686, 0, 1, 0.7411765, 1,
-0.08795656, 1.510833, 0.5787508, 0, 1, 0.7490196, 1,
-0.0872684, 2.730879, 0.1425895, 0, 1, 0.7529412, 1,
-0.08684106, 2.030829, -1.505893, 0, 1, 0.7607843, 1,
-0.08561721, 0.889159, -0.7965644, 0, 1, 0.7647059, 1,
-0.08167213, -1.726674, -3.604882, 0, 1, 0.772549, 1,
-0.0706915, 0.6215567, -1.910378, 0, 1, 0.7764706, 1,
-0.06866118, 0.4733215, 0.7507724, 0, 1, 0.7843137, 1,
-0.06736631, 0.348154, 1.030024, 0, 1, 0.7882353, 1,
-0.06390817, -0.7559495, -1.594558, 0, 1, 0.7960784, 1,
-0.06380112, 0.6306407, 1.422157, 0, 1, 0.8039216, 1,
-0.06103253, -0.8627969, -2.638131, 0, 1, 0.8078431, 1,
-0.05738773, 0.7836293, 0.3808769, 0, 1, 0.8156863, 1,
-0.05732489, 0.140412, -2.028471, 0, 1, 0.8196079, 1,
-0.05725021, 0.2741261, 0.2408158, 0, 1, 0.827451, 1,
-0.05650091, 0.7743934, -1.357726, 0, 1, 0.8313726, 1,
-0.05522789, -0.892931, -1.935608, 0, 1, 0.8392157, 1,
-0.05449883, 0.01182808, -0.8418188, 0, 1, 0.8431373, 1,
-0.05215369, -0.07911985, -2.593448, 0, 1, 0.8509804, 1,
-0.05056886, 0.3765458, 0.9924064, 0, 1, 0.854902, 1,
-0.04849336, 2.354977, 1.102972, 0, 1, 0.8627451, 1,
-0.04323869, -0.04911156, -3.442995, 0, 1, 0.8666667, 1,
-0.04027226, -0.0507326, -2.287894, 0, 1, 0.8745098, 1,
-0.03835915, 0.5539315, 0.2814426, 0, 1, 0.8784314, 1,
-0.03782935, -1.637634, -0.9985945, 0, 1, 0.8862745, 1,
-0.03538489, -0.7526515, -2.281923, 0, 1, 0.8901961, 1,
-0.03137999, -0.6454473, -4.554915, 0, 1, 0.8980392, 1,
-0.03094972, 1.243556, -1.258652, 0, 1, 0.9058824, 1,
-0.02606429, -0.3108635, -5.197491, 0, 1, 0.9098039, 1,
-0.02520925, 0.6190699, -0.9498732, 0, 1, 0.9176471, 1,
-0.01703784, -0.9957913, -3.219964, 0, 1, 0.9215686, 1,
-0.01646, -0.8889816, -2.999496, 0, 1, 0.9294118, 1,
-0.006393624, -0.7654985, -2.366145, 0, 1, 0.9333333, 1,
-0.006295332, -0.5661833, -2.852581, 0, 1, 0.9411765, 1,
-0.003681559, 0.5598205, -0.118304, 0, 1, 0.945098, 1,
-0.003434877, -0.3135187, -2.474707, 0, 1, 0.9529412, 1,
-0.002889623, -1.950224, -3.004647, 0, 1, 0.9568627, 1,
-0.002065566, -0.00585233, -2.453583, 0, 1, 0.9647059, 1,
-0.0004400401, -0.1050525, -3.260195, 0, 1, 0.9686275, 1,
0.001650712, -0.4685503, 2.869488, 0, 1, 0.9764706, 1,
0.003121506, -0.246534, 3.137744, 0, 1, 0.9803922, 1,
0.007394811, -1.649479, 3.151858, 0, 1, 0.9882353, 1,
0.007849484, 0.8290278, -0.5086374, 0, 1, 0.9921569, 1,
0.00846512, 1.47542, -0.2423897, 0, 1, 1, 1,
0.009264387, 0.8691745, -0.6982866, 0, 0.9921569, 1, 1,
0.01277013, -2.061996, 1.348782, 0, 0.9882353, 1, 1,
0.01409831, 0.5197597, -0.5189324, 0, 0.9803922, 1, 1,
0.02007099, 0.1859166, 1.076842, 0, 0.9764706, 1, 1,
0.02230054, -0.1680503, 3.62536, 0, 0.9686275, 1, 1,
0.02255412, -1.386893, 2.750508, 0, 0.9647059, 1, 1,
0.02382773, 1.343841, 1.893796, 0, 0.9568627, 1, 1,
0.02547835, 1.330739, -0.9521067, 0, 0.9529412, 1, 1,
0.02692726, -0.3762463, 2.715724, 0, 0.945098, 1, 1,
0.0294544, 1.804784, -2.620508, 0, 0.9411765, 1, 1,
0.03233141, 1.16821, -0.8196709, 0, 0.9333333, 1, 1,
0.03675531, -0.6761624, 2.777214, 0, 0.9294118, 1, 1,
0.0379265, 1.733078, 1.19271, 0, 0.9215686, 1, 1,
0.03837161, 1.516588, -0.4791532, 0, 0.9176471, 1, 1,
0.0445581, 1.435248, 0.2802755, 0, 0.9098039, 1, 1,
0.04544459, 0.8608367, -0.2787337, 0, 0.9058824, 1, 1,
0.05097719, -0.5135077, 3.361093, 0, 0.8980392, 1, 1,
0.05140243, 1.24303, -0.4555327, 0, 0.8901961, 1, 1,
0.0530675, -2.183491, 4.250836, 0, 0.8862745, 1, 1,
0.0545728, -0.4817808, 1.42035, 0, 0.8784314, 1, 1,
0.05548105, -0.06282789, 3.36555, 0, 0.8745098, 1, 1,
0.0567167, -0.9301944, 3.561939, 0, 0.8666667, 1, 1,
0.05919345, -0.7684664, 3.39977, 0, 0.8627451, 1, 1,
0.05930169, 0.3515433, 0.06434789, 0, 0.854902, 1, 1,
0.06128697, -0.2964281, 2.924792, 0, 0.8509804, 1, 1,
0.06827135, -1.177797, 3.485101, 0, 0.8431373, 1, 1,
0.06934667, 1.371565, -0.5898036, 0, 0.8392157, 1, 1,
0.07216397, -0.714829, 3.322435, 0, 0.8313726, 1, 1,
0.07483978, 1.193774, 0.1558004, 0, 0.827451, 1, 1,
0.07507785, -0.1068123, 1.222798, 0, 0.8196079, 1, 1,
0.07888517, 0.03632244, 1.196189, 0, 0.8156863, 1, 1,
0.0799733, -0.3898481, 3.727666, 0, 0.8078431, 1, 1,
0.08421779, 1.49273, -2.049042, 0, 0.8039216, 1, 1,
0.08692062, 0.2227938, 0.4841819, 0, 0.7960784, 1, 1,
0.08760182, 1.386037, -0.5889155, 0, 0.7882353, 1, 1,
0.09031742, -0.2834237, 2.251211, 0, 0.7843137, 1, 1,
0.09765939, 0.02994468, -0.2902058, 0, 0.7764706, 1, 1,
0.09828395, 0.8584368, 1.914189, 0, 0.772549, 1, 1,
0.1007723, -0.2669872, 1.31171, 0, 0.7647059, 1, 1,
0.1074768, -1.311874, 2.971485, 0, 0.7607843, 1, 1,
0.1100995, -0.4531695, 2.259732, 0, 0.7529412, 1, 1,
0.1141668, -1.387692, 3.331542, 0, 0.7490196, 1, 1,
0.1147927, -1.808272, 4.03489, 0, 0.7411765, 1, 1,
0.1180867, -0.6631559, 3.27067, 0, 0.7372549, 1, 1,
0.1194623, 0.1865899, 0.03920993, 0, 0.7294118, 1, 1,
0.1220253, -0.09611589, 2.848047, 0, 0.7254902, 1, 1,
0.1223554, 1.527541, -0.9671535, 0, 0.7176471, 1, 1,
0.1228884, 0.2851523, 1.011877, 0, 0.7137255, 1, 1,
0.1237039, -0.2974578, 1.987734, 0, 0.7058824, 1, 1,
0.1251264, 1.067829, -0.2931992, 0, 0.6980392, 1, 1,
0.1275169, 1.277268, -2.388734, 0, 0.6941177, 1, 1,
0.1278967, -0.9414799, 3.17086, 0, 0.6862745, 1, 1,
0.1299665, 0.5704721, 1.056896, 0, 0.682353, 1, 1,
0.1313301, 1.029333, -1.336993, 0, 0.6745098, 1, 1,
0.1325583, 0.1892253, 1.832756, 0, 0.6705883, 1, 1,
0.1337412, -0.2965053, 3.312638, 0, 0.6627451, 1, 1,
0.1351497, 0.9227738, 0.4697023, 0, 0.6588235, 1, 1,
0.1478433, -1.696665, 2.063081, 0, 0.6509804, 1, 1,
0.148047, 0.03985218, 2.49349, 0, 0.6470588, 1, 1,
0.1530082, -0.4246308, 2.207683, 0, 0.6392157, 1, 1,
0.1569419, -2.219835, 3.053916, 0, 0.6352941, 1, 1,
0.1634003, 1.732823, 1.44378, 0, 0.627451, 1, 1,
0.1659234, -0.7886932, 2.779675, 0, 0.6235294, 1, 1,
0.1714342, 0.0369858, 1.26035, 0, 0.6156863, 1, 1,
0.1716336, -0.4743309, 3.427003, 0, 0.6117647, 1, 1,
0.1728399, 0.863232, -0.8946075, 0, 0.6039216, 1, 1,
0.1739148, 0.1977174, 1.216473, 0, 0.5960785, 1, 1,
0.1749584, -1.368802, 2.801405, 0, 0.5921569, 1, 1,
0.1795599, -0.9871127, 2.240904, 0, 0.5843138, 1, 1,
0.1801112, -1.380802, 5.201719, 0, 0.5803922, 1, 1,
0.1846625, -1.660979, 5.015874, 0, 0.572549, 1, 1,
0.1852721, 1.734569, 0.1640136, 0, 0.5686275, 1, 1,
0.1897547, -1.11873, 2.533002, 0, 0.5607843, 1, 1,
0.1950908, 1.053796, 0.3214146, 0, 0.5568628, 1, 1,
0.1957806, 0.1719864, 0.2727744, 0, 0.5490196, 1, 1,
0.1961093, 0.5960405, -0.2091892, 0, 0.5450981, 1, 1,
0.1966017, -0.8172827, 4.832351, 0, 0.5372549, 1, 1,
0.1977904, 2.242156, 0.2197912, 0, 0.5333334, 1, 1,
0.1978213, -0.945094, 3.593804, 0, 0.5254902, 1, 1,
0.2021321, 1.341982, -1.121318, 0, 0.5215687, 1, 1,
0.2043367, 2.6193, -1.453046, 0, 0.5137255, 1, 1,
0.2116665, 1.186507, 0.4567189, 0, 0.509804, 1, 1,
0.2131176, 0.1802999, 0.1049813, 0, 0.5019608, 1, 1,
0.2202893, -0.5840963, 3.564271, 0, 0.4941176, 1, 1,
0.2211978, -0.6155249, 2.718357, 0, 0.4901961, 1, 1,
0.2236009, 0.3519057, 1.92767, 0, 0.4823529, 1, 1,
0.2253779, 2.11513, 0.3222985, 0, 0.4784314, 1, 1,
0.2263127, 0.5779863, 2.354672, 0, 0.4705882, 1, 1,
0.2284219, 1.050326, -1.662566, 0, 0.4666667, 1, 1,
0.2333191, -0.2671206, 3.900593, 0, 0.4588235, 1, 1,
0.2341593, -0.3489577, 3.487863, 0, 0.454902, 1, 1,
0.2347646, 1.635716, 0.7121603, 0, 0.4470588, 1, 1,
0.2376952, -0.2679812, 3.725544, 0, 0.4431373, 1, 1,
0.2386418, -1.025456, 4.736383, 0, 0.4352941, 1, 1,
0.2435225, -1.078265, 1.255479, 0, 0.4313726, 1, 1,
0.2438083, -0.4212992, 3.51645, 0, 0.4235294, 1, 1,
0.2451541, -0.9751671, 0.7077799, 0, 0.4196078, 1, 1,
0.2474432, 0.8050463, 0.165121, 0, 0.4117647, 1, 1,
0.2501107, 0.003465535, 3.802438, 0, 0.4078431, 1, 1,
0.2507594, 0.5572886, -0.4695194, 0, 0.4, 1, 1,
0.2561806, 0.6486012, 0.5261192, 0, 0.3921569, 1, 1,
0.2591495, 0.6125291, -0.9940657, 0, 0.3882353, 1, 1,
0.2592787, 1.491994, 0.5441743, 0, 0.3803922, 1, 1,
0.2634303, 1.322917, -1.426998, 0, 0.3764706, 1, 1,
0.2704018, -2.559675, 1.529119, 0, 0.3686275, 1, 1,
0.2770013, -1.229053, 4.355755, 0, 0.3647059, 1, 1,
0.278841, -0.5960519, 3.881201, 0, 0.3568628, 1, 1,
0.2799176, 1.403119, 0.3854764, 0, 0.3529412, 1, 1,
0.2821009, -1.204383, 1.336847, 0, 0.345098, 1, 1,
0.2872025, 1.648599, -1.786116, 0, 0.3411765, 1, 1,
0.2909157, 1.086743, 0.7614728, 0, 0.3333333, 1, 1,
0.2956011, -0.9095626, 4.09395, 0, 0.3294118, 1, 1,
0.2970423, -0.2730179, 2.670321, 0, 0.3215686, 1, 1,
0.2974216, -1.456416, 2.060099, 0, 0.3176471, 1, 1,
0.3015571, 0.01355676, 1.835183, 0, 0.3098039, 1, 1,
0.3026344, 0.0339839, 0.2672098, 0, 0.3058824, 1, 1,
0.3068459, 1.772691, 0.3072442, 0, 0.2980392, 1, 1,
0.308836, 0.2102907, 1.466105, 0, 0.2901961, 1, 1,
0.310659, -1.070465, 2.55878, 0, 0.2862745, 1, 1,
0.3135947, 0.8105152, 0.6364857, 0, 0.2784314, 1, 1,
0.3152911, -0.02338389, 1.011537, 0, 0.2745098, 1, 1,
0.3163905, -0.3063486, 1.249005, 0, 0.2666667, 1, 1,
0.3188817, 0.4776003, 1.129336, 0, 0.2627451, 1, 1,
0.3233721, -0.2251402, 1.649921, 0, 0.254902, 1, 1,
0.3243746, -0.05568652, 1.682792, 0, 0.2509804, 1, 1,
0.3250366, 0.05843886, 2.120393, 0, 0.2431373, 1, 1,
0.3278073, 0.7737454, 0.8116096, 0, 0.2392157, 1, 1,
0.3305151, 0.9616725, 0.1766715, 0, 0.2313726, 1, 1,
0.332073, 1.865897, 0.3520991, 0, 0.227451, 1, 1,
0.3325507, 0.2516946, 0.1033407, 0, 0.2196078, 1, 1,
0.3377174, 1.050659, 0.9826808, 0, 0.2156863, 1, 1,
0.3480701, -0.1406001, 2.875173, 0, 0.2078431, 1, 1,
0.3552445, 1.535108, 0.2792902, 0, 0.2039216, 1, 1,
0.3557218, -0.768597, 3.991348, 0, 0.1960784, 1, 1,
0.3580548, -0.3681535, 2.843647, 0, 0.1882353, 1, 1,
0.3600363, 0.03499794, 0.5650233, 0, 0.1843137, 1, 1,
0.3653615, -1.708427, 2.313866, 0, 0.1764706, 1, 1,
0.3704103, -0.0347361, 1.986914, 0, 0.172549, 1, 1,
0.3704453, -1.735354, 3.864748, 0, 0.1647059, 1, 1,
0.3712049, 0.8315532, -0.2252982, 0, 0.1607843, 1, 1,
0.3728426, 0.4452614, 1.071227, 0, 0.1529412, 1, 1,
0.377941, 0.4500396, 0.8004083, 0, 0.1490196, 1, 1,
0.3781029, -0.3741637, 3.321969, 0, 0.1411765, 1, 1,
0.3790092, -1.0947, 1.315388, 0, 0.1372549, 1, 1,
0.3803415, 1.039976, 0.3095573, 0, 0.1294118, 1, 1,
0.3822981, 2.003938, 0.5991404, 0, 0.1254902, 1, 1,
0.383024, 0.9049932, -0.2507954, 0, 0.1176471, 1, 1,
0.4008605, -0.03933843, 1.143287, 0, 0.1137255, 1, 1,
0.4012291, 0.6895843, 1.085821, 0, 0.1058824, 1, 1,
0.4023371, 0.6028343, 0.5167016, 0, 0.09803922, 1, 1,
0.407032, 0.4064372, 1.332107, 0, 0.09411765, 1, 1,
0.4097829, -0.1180971, 1.34112, 0, 0.08627451, 1, 1,
0.4127638, 0.6077092, 1.43336, 0, 0.08235294, 1, 1,
0.4137952, -0.1980429, 1.860134, 0, 0.07450981, 1, 1,
0.4148829, -0.2138181, 1.973731, 0, 0.07058824, 1, 1,
0.4168611, -0.7753741, 2.191787, 0, 0.0627451, 1, 1,
0.4174666, 0.6079367, 1.524335, 0, 0.05882353, 1, 1,
0.4182184, 1.167126, 1.159992, 0, 0.05098039, 1, 1,
0.4184536, 2.919167, -0.940608, 0, 0.04705882, 1, 1,
0.4258881, -0.9700143, 1.365075, 0, 0.03921569, 1, 1,
0.4264983, 0.3412787, 1.917384, 0, 0.03529412, 1, 1,
0.4286388, -1.137324, 2.470314, 0, 0.02745098, 1, 1,
0.4321634, -0.6453508, 2.69575, 0, 0.02352941, 1, 1,
0.4330917, -0.5972217, 2.878115, 0, 0.01568628, 1, 1,
0.4365853, -0.07638434, 1.211266, 0, 0.01176471, 1, 1,
0.4392301, -0.3373843, 1.34785, 0, 0.003921569, 1, 1,
0.4393881, 2.10733, 0.2673968, 0.003921569, 0, 1, 1,
0.4403465, 1.048036, -0.6633659, 0.007843138, 0, 1, 1,
0.4409424, -1.664292, 2.187675, 0.01568628, 0, 1, 1,
0.4438747, 0.4863472, 1.139916, 0.01960784, 0, 1, 1,
0.4478649, -0.8274264, 4.843815, 0.02745098, 0, 1, 1,
0.4501099, 0.297628, 0.3552726, 0.03137255, 0, 1, 1,
0.452409, -1.871865, 1.93812, 0.03921569, 0, 1, 1,
0.4535118, -0.6138066, 1.349374, 0.04313726, 0, 1, 1,
0.4536682, 1.128294, 0.1862927, 0.05098039, 0, 1, 1,
0.4540865, 0.4302644, 2.208156, 0.05490196, 0, 1, 1,
0.4542909, -0.6998122, 2.335898, 0.0627451, 0, 1, 1,
0.4583552, -0.7026396, 1.602072, 0.06666667, 0, 1, 1,
0.4614344, 1.452937, 0.2224045, 0.07450981, 0, 1, 1,
0.463334, 0.2073176, -0.668415, 0.07843138, 0, 1, 1,
0.4667653, -0.6540679, 1.720207, 0.08627451, 0, 1, 1,
0.4708215, -0.669988, 3.318055, 0.09019608, 0, 1, 1,
0.4712664, -2.864198, 2.649941, 0.09803922, 0, 1, 1,
0.4714742, 1.219952, -0.08764629, 0.1058824, 0, 1, 1,
0.473772, 0.1330829, 1.332887, 0.1098039, 0, 1, 1,
0.4751922, 0.1960787, 0.355592, 0.1176471, 0, 1, 1,
0.4756952, 1.021748, -0.6973594, 0.1215686, 0, 1, 1,
0.4782111, -1.26696, 2.298419, 0.1294118, 0, 1, 1,
0.4828502, -0.4427811, 3.337932, 0.1333333, 0, 1, 1,
0.487861, 0.3697687, 1.040719, 0.1411765, 0, 1, 1,
0.488565, 0.4251412, 2.490248, 0.145098, 0, 1, 1,
0.4887967, 0.1768267, 0.9077994, 0.1529412, 0, 1, 1,
0.4915901, -0.8398753, 0.9622018, 0.1568628, 0, 1, 1,
0.4922597, -0.4303542, 2.712992, 0.1647059, 0, 1, 1,
0.4922604, -1.038393, 3.074995, 0.1686275, 0, 1, 1,
0.4941645, 0.2392421, 2.36215, 0.1764706, 0, 1, 1,
0.4944165, 1.27498, -1.191485, 0.1803922, 0, 1, 1,
0.4944542, 0.7917337, 0.4807901, 0.1882353, 0, 1, 1,
0.4994439, 1.113587, 0.5759448, 0.1921569, 0, 1, 1,
0.501644, 1.959294, 1.344994, 0.2, 0, 1, 1,
0.5042072, 0.9999784, -0.1652002, 0.2078431, 0, 1, 1,
0.5104885, 0.1719229, 0.09694587, 0.2117647, 0, 1, 1,
0.5128934, -0.03373455, 1.966569, 0.2196078, 0, 1, 1,
0.5136393, 0.8568778, 0.5735098, 0.2235294, 0, 1, 1,
0.5157311, -1.028061, 1.786089, 0.2313726, 0, 1, 1,
0.5159853, 0.26998, 2.310606, 0.2352941, 0, 1, 1,
0.5188873, 0.5952198, 0.3004357, 0.2431373, 0, 1, 1,
0.5211468, -0.3681312, 0.6570129, 0.2470588, 0, 1, 1,
0.5267845, -0.410952, 1.80455, 0.254902, 0, 1, 1,
0.5271673, -0.4253794, 1.142494, 0.2588235, 0, 1, 1,
0.5326141, 1.060329, -1.573633, 0.2666667, 0, 1, 1,
0.5393798, -2.232417, 3.236987, 0.2705882, 0, 1, 1,
0.5401754, -0.2623659, 1.184976, 0.2784314, 0, 1, 1,
0.5412318, 0.4124796, 1.955434, 0.282353, 0, 1, 1,
0.5441926, -0.309543, 2.579792, 0.2901961, 0, 1, 1,
0.5495682, 0.8015908, 0.409632, 0.2941177, 0, 1, 1,
0.5524858, -1.795873, 2.357878, 0.3019608, 0, 1, 1,
0.5665116, -0.6687584, 3.264794, 0.3098039, 0, 1, 1,
0.5761374, -0.236185, 2.285406, 0.3137255, 0, 1, 1,
0.5781611, -0.7236663, 0.8068937, 0.3215686, 0, 1, 1,
0.5785553, 0.3311126, 1.158394, 0.3254902, 0, 1, 1,
0.5785972, -0.299842, 1.286268, 0.3333333, 0, 1, 1,
0.5789844, 1.018246, 0.9137816, 0.3372549, 0, 1, 1,
0.5860735, -0.02593505, -0.4982145, 0.345098, 0, 1, 1,
0.5919929, -0.5819214, 0.5799814, 0.3490196, 0, 1, 1,
0.595196, -1.27905, 2.700162, 0.3568628, 0, 1, 1,
0.5964904, 1.575199, 0.1752279, 0.3607843, 0, 1, 1,
0.6012771, 0.7078811, 1.825714, 0.3686275, 0, 1, 1,
0.6025266, -0.7960274, 1.918476, 0.372549, 0, 1, 1,
0.6034827, 1.022185, 1.091661, 0.3803922, 0, 1, 1,
0.6035894, 1.113822, 0.7924935, 0.3843137, 0, 1, 1,
0.6067514, -0.419069, 3.54998, 0.3921569, 0, 1, 1,
0.6101391, -0.07737962, 2.370291, 0.3960784, 0, 1, 1,
0.6155199, 0.870396, -0.1485693, 0.4039216, 0, 1, 1,
0.617093, 1.224551, 1.135956, 0.4117647, 0, 1, 1,
0.6199636, -0.7930654, 2.084243, 0.4156863, 0, 1, 1,
0.6225735, -0.2742313, 1.505172, 0.4235294, 0, 1, 1,
0.6242871, 1.269114, 1.434898, 0.427451, 0, 1, 1,
0.6251728, -1.034808, 2.580349, 0.4352941, 0, 1, 1,
0.6287733, -0.9583029, 2.978834, 0.4392157, 0, 1, 1,
0.639111, -0.3913096, 4.458469, 0.4470588, 0, 1, 1,
0.6400903, 1.024966, -1.638218, 0.4509804, 0, 1, 1,
0.6410519, -0.04302868, 3.413781, 0.4588235, 0, 1, 1,
0.6411009, -0.3694275, 2.493517, 0.4627451, 0, 1, 1,
0.6420418, 0.6856276, 0.5194073, 0.4705882, 0, 1, 1,
0.642826, -0.7714034, 3.025506, 0.4745098, 0, 1, 1,
0.6441771, -0.6024235, 1.506507, 0.4823529, 0, 1, 1,
0.6442094, -0.1555701, 2.785869, 0.4862745, 0, 1, 1,
0.6464294, 0.3881108, -0.1832465, 0.4941176, 0, 1, 1,
0.6467973, 0.3960947, 0.072645, 0.5019608, 0, 1, 1,
0.64818, 0.4540164, 0.9844881, 0.5058824, 0, 1, 1,
0.6509131, -0.1922504, 1.940546, 0.5137255, 0, 1, 1,
0.6533764, 0.6649227, 1.790052, 0.5176471, 0, 1, 1,
0.6542971, -0.8537896, 2.226461, 0.5254902, 0, 1, 1,
0.6551127, 0.1864261, 1.907091, 0.5294118, 0, 1, 1,
0.6601985, -0.0187767, 2.563337, 0.5372549, 0, 1, 1,
0.6628762, 0.9462892, -0.9207489, 0.5411765, 0, 1, 1,
0.6631371, -1.548977, 2.996706, 0.5490196, 0, 1, 1,
0.6647484, -1.352067, 2.611242, 0.5529412, 0, 1, 1,
0.6768903, 0.4784171, 1.706417, 0.5607843, 0, 1, 1,
0.6787345, -1.005713, 2.28086, 0.5647059, 0, 1, 1,
0.6800777, 0.4922712, 0.09094352, 0.572549, 0, 1, 1,
0.6801307, 0.7807326, 1.022934, 0.5764706, 0, 1, 1,
0.6807916, -1.173491, 4.703511, 0.5843138, 0, 1, 1,
0.6905277, -0.1484383, 2.789944, 0.5882353, 0, 1, 1,
0.6927172, 0.336951, 0.4490005, 0.5960785, 0, 1, 1,
0.6938775, -0.8531029, 3.625553, 0.6039216, 0, 1, 1,
0.6965702, 1.19226, 1.068748, 0.6078432, 0, 1, 1,
0.6989695, -2.035363, 2.979838, 0.6156863, 0, 1, 1,
0.7046959, -0.2115528, 3.196481, 0.6196079, 0, 1, 1,
0.7090575, 0.9084463, 0.5210911, 0.627451, 0, 1, 1,
0.7189723, -0.2203163, 2.023192, 0.6313726, 0, 1, 1,
0.7273109, 0.08270958, 1.666752, 0.6392157, 0, 1, 1,
0.7307501, 0.3816294, 0.3141607, 0.6431373, 0, 1, 1,
0.7357941, 0.228764, 0.6733926, 0.6509804, 0, 1, 1,
0.7429529, 0.4280359, 1.382269, 0.654902, 0, 1, 1,
0.7440168, -0.5068028, 1.848733, 0.6627451, 0, 1, 1,
0.7441763, -1.125391, 3.326951, 0.6666667, 0, 1, 1,
0.7508215, 1.013331, 0.4777924, 0.6745098, 0, 1, 1,
0.7528719, 0.1277693, 0.4817971, 0.6784314, 0, 1, 1,
0.7557945, 0.6495382, 1.11028, 0.6862745, 0, 1, 1,
0.7595112, -2.347079, 2.701823, 0.6901961, 0, 1, 1,
0.7610436, -0.637527, 1.109221, 0.6980392, 0, 1, 1,
0.7697479, 0.2942058, -0.5942483, 0.7058824, 0, 1, 1,
0.783793, 0.7846554, 1.777858, 0.7098039, 0, 1, 1,
0.7857209, -1.037865, 1.753398, 0.7176471, 0, 1, 1,
0.7957594, -1.679312, 2.058771, 0.7215686, 0, 1, 1,
0.8004066, 0.602806, -0.3449954, 0.7294118, 0, 1, 1,
0.8040113, 0.3513303, 0.1783572, 0.7333333, 0, 1, 1,
0.8046857, -0.07121653, 0.4961753, 0.7411765, 0, 1, 1,
0.8060622, 1.583109, 1.569073, 0.7450981, 0, 1, 1,
0.8109161, 0.6168749, 1.230049, 0.7529412, 0, 1, 1,
0.8124319, 1.265553, 1.446786, 0.7568628, 0, 1, 1,
0.8160341, -0.1608639, 2.505177, 0.7647059, 0, 1, 1,
0.8200395, -0.04671778, 3.393808, 0.7686275, 0, 1, 1,
0.8328772, -0.948153, 2.398024, 0.7764706, 0, 1, 1,
0.8404508, 0.2358602, 2.538815, 0.7803922, 0, 1, 1,
0.8491307, 0.1823366, 2.388113, 0.7882353, 0, 1, 1,
0.8505518, 2.61709, 0.8259073, 0.7921569, 0, 1, 1,
0.8542726, 0.3519854, 2.045439, 0.8, 0, 1, 1,
0.8603525, 1.650016, 0.8669471, 0.8078431, 0, 1, 1,
0.8620877, 0.4954305, 1.715723, 0.8117647, 0, 1, 1,
0.8621921, 1.584492, 0.345468, 0.8196079, 0, 1, 1,
0.8650377, 1.334462, -0.4885173, 0.8235294, 0, 1, 1,
0.870689, -0.7089303, 2.164413, 0.8313726, 0, 1, 1,
0.8742697, 0.2635602, 1.751229, 0.8352941, 0, 1, 1,
0.8814174, 1.00919, 1.64714, 0.8431373, 0, 1, 1,
0.8834794, 0.7809616, 1.258343, 0.8470588, 0, 1, 1,
0.8894341, -0.5504984, 3.251694, 0.854902, 0, 1, 1,
0.8948317, -0.1257084, 0.6972789, 0.8588235, 0, 1, 1,
0.8969034, 0.8606864, 2.879951, 0.8666667, 0, 1, 1,
0.8971049, -0.5706044, 2.527294, 0.8705882, 0, 1, 1,
0.8977845, -1.11425, 1.528811, 0.8784314, 0, 1, 1,
0.8979399, 0.01841604, 0.2829355, 0.8823529, 0, 1, 1,
0.8995327, -0.0199032, 1.16352, 0.8901961, 0, 1, 1,
0.8999937, -0.5131794, 1.353911, 0.8941177, 0, 1, 1,
0.9054478, -0.3499081, 1.447995, 0.9019608, 0, 1, 1,
0.9058909, 0.2514861, 0.6196555, 0.9098039, 0, 1, 1,
0.9128812, -1.075562, 3.027428, 0.9137255, 0, 1, 1,
0.9225373, 0.5029923, 0.693792, 0.9215686, 0, 1, 1,
0.9323055, 0.311196, 2.391952, 0.9254902, 0, 1, 1,
0.9326564, 0.06320775, 0.8344566, 0.9333333, 0, 1, 1,
0.9346503, 1.997083, -0.2846845, 0.9372549, 0, 1, 1,
0.9429956, 0.3935187, 1.690354, 0.945098, 0, 1, 1,
0.9464404, 0.3892131, 1.016107, 0.9490196, 0, 1, 1,
0.9496358, 0.2290149, 1.890065, 0.9568627, 0, 1, 1,
0.9541152, 0.3345335, -1.309611, 0.9607843, 0, 1, 1,
0.9586073, -0.5592477, 1.496581, 0.9686275, 0, 1, 1,
0.9724333, -0.2874072, 2.581415, 0.972549, 0, 1, 1,
0.9755258, -0.5457856, 3.655961, 0.9803922, 0, 1, 1,
0.9776033, 1.546585, -0.2792545, 0.9843137, 0, 1, 1,
0.9860728, 1.143221, 0.2074313, 0.9921569, 0, 1, 1,
0.9962947, -0.9684262, 3.612186, 0.9960784, 0, 1, 1,
0.9971227, 0.9963141, 0.6362213, 1, 0, 0.9960784, 1,
0.9979019, -1.222963, 0.3206522, 1, 0, 0.9882353, 1,
1.000679, 0.2654262, -0.2564352, 1, 0, 0.9843137, 1,
1.015893, -0.6758612, 2.50259, 1, 0, 0.9764706, 1,
1.016058, 0.2256097, 2.418367, 1, 0, 0.972549, 1,
1.019676, 1.195289, 1.377862, 1, 0, 0.9647059, 1,
1.02245, 0.7731175, 1.675558, 1, 0, 0.9607843, 1,
1.025355, 0.6964547, 2.14064, 1, 0, 0.9529412, 1,
1.0269, -0.1700896, 0.3021376, 1, 0, 0.9490196, 1,
1.02853, 1.125366, -1.18797, 1, 0, 0.9411765, 1,
1.039564, 2.30121, -0.7861238, 1, 0, 0.9372549, 1,
1.041863, 0.4454471, 0.4893176, 1, 0, 0.9294118, 1,
1.049401, -1.483397, 3.249362, 1, 0, 0.9254902, 1,
1.049915, 0.4885914, 1.232619, 1, 0, 0.9176471, 1,
1.050159, -0.4513499, 1.198, 1, 0, 0.9137255, 1,
1.05224, 0.9091282, 1.96263, 1, 0, 0.9058824, 1,
1.056254, -0.3682323, 2.11404, 1, 0, 0.9019608, 1,
1.056657, 1.396801, -0.769451, 1, 0, 0.8941177, 1,
1.057581, -0.5339152, 2.276242, 1, 0, 0.8862745, 1,
1.059856, -0.4884034, 2.799432, 1, 0, 0.8823529, 1,
1.062977, -0.3572829, 0.6951043, 1, 0, 0.8745098, 1,
1.064346, 1.84121, 1.559441, 1, 0, 0.8705882, 1,
1.064416, -0.547966, 0.6968968, 1, 0, 0.8627451, 1,
1.06507, -0.4424474, 5.432671, 1, 0, 0.8588235, 1,
1.069127, -1.280833, 2.432156, 1, 0, 0.8509804, 1,
1.07733, 0.7027737, 1.488949, 1, 0, 0.8470588, 1,
1.07812, 0.891355, -0.4920876, 1, 0, 0.8392157, 1,
1.081087, -1.305028, 3.104492, 1, 0, 0.8352941, 1,
1.085476, -0.9051934, 3.665159, 1, 0, 0.827451, 1,
1.08599, 0.4182087, 0.3135838, 1, 0, 0.8235294, 1,
1.09895, -1.217841, 2.216497, 1, 0, 0.8156863, 1,
1.100289, -0.05591852, 1.21239, 1, 0, 0.8117647, 1,
1.104076, 0.8964195, 0.417122, 1, 0, 0.8039216, 1,
1.107494, -0.03546227, 0.9939736, 1, 0, 0.7960784, 1,
1.114673, 0.5746331, -0.1532164, 1, 0, 0.7921569, 1,
1.12152, -1.048596, 2.529131, 1, 0, 0.7843137, 1,
1.143463, -0.3976116, 1.683535, 1, 0, 0.7803922, 1,
1.145842, 0.3807271, 1.708709, 1, 0, 0.772549, 1,
1.148959, -2.014528, 3.373121, 1, 0, 0.7686275, 1,
1.149676, -0.2977882, -0.4297327, 1, 0, 0.7607843, 1,
1.154412, 0.08229635, 1.059368, 1, 0, 0.7568628, 1,
1.156083, 0.716389, 0.8844358, 1, 0, 0.7490196, 1,
1.157428, 1.148811, -0.3513594, 1, 0, 0.7450981, 1,
1.160229, -0.3431779, 1.95746, 1, 0, 0.7372549, 1,
1.168948, -1.577865, 1.831415, 1, 0, 0.7333333, 1,
1.172588, 1.143737, 0.2382516, 1, 0, 0.7254902, 1,
1.178117, 0.7728402, 1.556487, 1, 0, 0.7215686, 1,
1.179182, -0.6776695, 1.524033, 1, 0, 0.7137255, 1,
1.18434, -0.9617435, 3.327092, 1, 0, 0.7098039, 1,
1.190858, -1.863887, 2.618576, 1, 0, 0.7019608, 1,
1.212019, 0.3401251, 1.413653, 1, 0, 0.6941177, 1,
1.213778, -0.6802012, 1.13722, 1, 0, 0.6901961, 1,
1.221192, -1.475162, 1.860471, 1, 0, 0.682353, 1,
1.222477, -1.394845, 1.529865, 1, 0, 0.6784314, 1,
1.22375, -0.8585668, 1.372825, 1, 0, 0.6705883, 1,
1.228849, 1.37084, 1.907974, 1, 0, 0.6666667, 1,
1.232733, 0.9466177, 0.464043, 1, 0, 0.6588235, 1,
1.237114, -0.4585546, 1.118747, 1, 0, 0.654902, 1,
1.237667, 0.1253372, 0.5223715, 1, 0, 0.6470588, 1,
1.25629, 0.770467, -0.3033004, 1, 0, 0.6431373, 1,
1.2631, 0.8971919, 0.7004572, 1, 0, 0.6352941, 1,
1.26346, 3.491801, 0.1003087, 1, 0, 0.6313726, 1,
1.270399, 0.458921, 0.8367566, 1, 0, 0.6235294, 1,
1.270697, -1.084003, 3.762494, 1, 0, 0.6196079, 1,
1.27151, 0.3382892, 1.703094, 1, 0, 0.6117647, 1,
1.272439, 1.177883, 0.6675732, 1, 0, 0.6078432, 1,
1.275221, -0.4499423, 1.381403, 1, 0, 0.6, 1,
1.279385, -1.089858, 1.792536, 1, 0, 0.5921569, 1,
1.293332, -0.393031, 2.087207, 1, 0, 0.5882353, 1,
1.298954, -1.261821, 2.918826, 1, 0, 0.5803922, 1,
1.316636, 1.136518, 1.519171, 1, 0, 0.5764706, 1,
1.326135, -0.4542458, 1.976887, 1, 0, 0.5686275, 1,
1.327863, 0.2013599, 1.756857, 1, 0, 0.5647059, 1,
1.339125, -0.7752023, 1.70505, 1, 0, 0.5568628, 1,
1.340791, -1.894679, 1.293101, 1, 0, 0.5529412, 1,
1.343455, 1.230848, 0.2710485, 1, 0, 0.5450981, 1,
1.348948, -1.970411, 1.030218, 1, 0, 0.5411765, 1,
1.349083, 0.2656851, 0.2905512, 1, 0, 0.5333334, 1,
1.349641, -0.260664, 1.005094, 1, 0, 0.5294118, 1,
1.367838, -0.5673886, 3.540487, 1, 0, 0.5215687, 1,
1.370118, 0.600319, 2.187232, 1, 0, 0.5176471, 1,
1.372737, -1.042493, 2.769805, 1, 0, 0.509804, 1,
1.376809, -0.2879196, 2.573542, 1, 0, 0.5058824, 1,
1.379486, -0.02569324, 2.082396, 1, 0, 0.4980392, 1,
1.391361, -0.6500213, 2.643418, 1, 0, 0.4901961, 1,
1.395208, -0.3548394, 3.014204, 1, 0, 0.4862745, 1,
1.398379, 0.6266713, 1.090447, 1, 0, 0.4784314, 1,
1.402342, -1.01733, 1.373167, 1, 0, 0.4745098, 1,
1.404683, 1.16726, -0.8860767, 1, 0, 0.4666667, 1,
1.411142, -1.631785, 1.585538, 1, 0, 0.4627451, 1,
1.434799, 0.3751499, 0.1740198, 1, 0, 0.454902, 1,
1.441071, -0.9968763, 0.2852736, 1, 0, 0.4509804, 1,
1.443981, 0.8418155, 0.5232782, 1, 0, 0.4431373, 1,
1.449456, -2.203408, 1.404837, 1, 0, 0.4392157, 1,
1.454816, -0.2871874, 1.407919, 1, 0, 0.4313726, 1,
1.456592, -0.04460144, 2.090434, 1, 0, 0.427451, 1,
1.461273, 2.116977, 0.9949576, 1, 0, 0.4196078, 1,
1.464727, -0.5893098, 1.716581, 1, 0, 0.4156863, 1,
1.472086, -0.4883743, 2.642013, 1, 0, 0.4078431, 1,
1.479466, 0.2201937, 0.6491531, 1, 0, 0.4039216, 1,
1.48032, -0.1253342, 2.609345, 1, 0, 0.3960784, 1,
1.487994, 0.8421768, -1.161217, 1, 0, 0.3882353, 1,
1.495273, -0.7050813, 1.253395, 1, 0, 0.3843137, 1,
1.498275, -0.5864299, 1.885759, 1, 0, 0.3764706, 1,
1.514769, 1.792064, 0.1117283, 1, 0, 0.372549, 1,
1.527641, -0.03987376, 0.7249343, 1, 0, 0.3647059, 1,
1.529678, 0.5312808, 1.984598, 1, 0, 0.3607843, 1,
1.531104, 1.150641, 0.9786833, 1, 0, 0.3529412, 1,
1.532051, 0.9143252, 1.206656, 1, 0, 0.3490196, 1,
1.534009, 0.2762616, 1.317972, 1, 0, 0.3411765, 1,
1.535382, 0.1931867, 0.5148211, 1, 0, 0.3372549, 1,
1.54029, 0.395797, 1.44417, 1, 0, 0.3294118, 1,
1.576012, 0.6770774, 2.751696, 1, 0, 0.3254902, 1,
1.583384, 0.06391244, 2.394255, 1, 0, 0.3176471, 1,
1.586196, 1.588466, 1.00615, 1, 0, 0.3137255, 1,
1.599211, -1.307109, 1.568049, 1, 0, 0.3058824, 1,
1.601664, -0.9969241, 1.802447, 1, 0, 0.2980392, 1,
1.623707, -1.334409, 1.714024, 1, 0, 0.2941177, 1,
1.631868, -0.5640535, 1.46412, 1, 0, 0.2862745, 1,
1.639183, -1.890337, 0.3853228, 1, 0, 0.282353, 1,
1.663976, -0.7550722, 2.543479, 1, 0, 0.2745098, 1,
1.676337, 1.425759, 0.4696882, 1, 0, 0.2705882, 1,
1.677716, 1.693433, -1.145389, 1, 0, 0.2627451, 1,
1.680616, -0.08343624, -0.688879, 1, 0, 0.2588235, 1,
1.689707, -0.3051209, 3.811327, 1, 0, 0.2509804, 1,
1.69389, -0.844299, 0.5965937, 1, 0, 0.2470588, 1,
1.75548, 2.259763, -1.787987, 1, 0, 0.2392157, 1,
1.756727, -0.670595, -0.2810277, 1, 0, 0.2352941, 1,
1.774559, 1.131745, 1.55348, 1, 0, 0.227451, 1,
1.776401, -0.2376468, 1.17501, 1, 0, 0.2235294, 1,
1.802386, 0.6783767, 1.898134, 1, 0, 0.2156863, 1,
1.856925, 0.539434, 1.482781, 1, 0, 0.2117647, 1,
1.872506, -0.984606, 0.5145508, 1, 0, 0.2039216, 1,
1.881042, 0.2185319, 0.2500673, 1, 0, 0.1960784, 1,
1.892616, 0.7044566, 1.224443, 1, 0, 0.1921569, 1,
1.893155, 1.534844, -0.2834867, 1, 0, 0.1843137, 1,
1.961421, -0.1693375, 2.27194, 1, 0, 0.1803922, 1,
1.965722, 0.4694572, 1.138422, 1, 0, 0.172549, 1,
1.991674, 0.08606177, 3.377871, 1, 0, 0.1686275, 1,
1.993874, -0.6001081, 1.172253, 1, 0, 0.1607843, 1,
1.997755, -0.1922501, 1.259888, 1, 0, 0.1568628, 1,
2.019506, -1.779743, 1.2883, 1, 0, 0.1490196, 1,
2.026827, -1.222857, 1.071315, 1, 0, 0.145098, 1,
2.070546, 0.1350989, 1.503417, 1, 0, 0.1372549, 1,
2.098239, 1.085345, 1.527675, 1, 0, 0.1333333, 1,
2.110005, 0.2556161, 1.457808, 1, 0, 0.1254902, 1,
2.119205, -1.034257, 0.3957724, 1, 0, 0.1215686, 1,
2.161553, -0.2497875, 2.342032, 1, 0, 0.1137255, 1,
2.175784, 0.9416751, 1.33511, 1, 0, 0.1098039, 1,
2.1796, -0.4366735, 1.167485, 1, 0, 0.1019608, 1,
2.229174, -0.2601877, 3.296946, 1, 0, 0.09411765, 1,
2.22967, 0.09414425, 1.591928, 1, 0, 0.09019608, 1,
2.275093, -1.998604, 2.54537, 1, 0, 0.08235294, 1,
2.276398, 0.677877, 1.774915, 1, 0, 0.07843138, 1,
2.32306, 1.364078, 0.8462875, 1, 0, 0.07058824, 1,
2.420722, -0.5786231, 2.265294, 1, 0, 0.06666667, 1,
2.431813, -0.1344145, 5.536452, 1, 0, 0.05882353, 1,
2.441201, -1.097979, 1.910465, 1, 0, 0.05490196, 1,
2.464822, 0.754529, 1.513451, 1, 0, 0.04705882, 1,
2.50866, -0.3359026, 1.096943, 1, 0, 0.04313726, 1,
2.603161, 1.035529, 0.1171557, 1, 0, 0.03529412, 1,
2.628397, -0.6486349, 1.384513, 1, 0, 0.03137255, 1,
2.663627, 0.2698444, 1.44254, 1, 0, 0.02352941, 1,
2.939964, -1.246171, 0.9865817, 1, 0, 0.01960784, 1,
2.960935, 0.9636028, 1.664958, 1, 0, 0.01176471, 1,
3.664828, -0.6174817, -0.7446427, 1, 0, 0.007843138, 1
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
0.2933093, -4.888189, -7.41223, 0, -0.5, 0.5, 0.5,
0.2933093, -4.888189, -7.41223, 1, -0.5, 0.5, 0.5,
0.2933093, -4.888189, -7.41223, 1, 1.5, 0.5, 0.5,
0.2933093, -4.888189, -7.41223, 0, 1.5, 0.5, 0.5
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
-4.221154, -0.09092259, -7.41223, 0, -0.5, 0.5, 0.5,
-4.221154, -0.09092259, -7.41223, 1, -0.5, 0.5, 0.5,
-4.221154, -0.09092259, -7.41223, 1, 1.5, 0.5, 0.5,
-4.221154, -0.09092259, -7.41223, 0, 1.5, 0.5, 0.5
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
-4.221154, -4.888189, 0.0004611015, 0, -0.5, 0.5, 0.5,
-4.221154, -4.888189, 0.0004611015, 1, -0.5, 0.5, 0.5,
-4.221154, -4.888189, 0.0004611015, 1, 1.5, 0.5, 0.5,
-4.221154, -4.888189, 0.0004611015, 0, 1.5, 0.5, 0.5
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
-3, -3.781128, -5.701609,
3, -3.781128, -5.701609,
-3, -3.781128, -5.701609,
-3, -3.965638, -5.986713,
-2, -3.781128, -5.701609,
-2, -3.965638, -5.986713,
-1, -3.781128, -5.701609,
-1, -3.965638, -5.986713,
0, -3.781128, -5.701609,
0, -3.965638, -5.986713,
1, -3.781128, -5.701609,
1, -3.965638, -5.986713,
2, -3.781128, -5.701609,
2, -3.965638, -5.986713,
3, -3.781128, -5.701609,
3, -3.965638, -5.986713
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
-3, -4.334659, -6.55692, 0, -0.5, 0.5, 0.5,
-3, -4.334659, -6.55692, 1, -0.5, 0.5, 0.5,
-3, -4.334659, -6.55692, 1, 1.5, 0.5, 0.5,
-3, -4.334659, -6.55692, 0, 1.5, 0.5, 0.5,
-2, -4.334659, -6.55692, 0, -0.5, 0.5, 0.5,
-2, -4.334659, -6.55692, 1, -0.5, 0.5, 0.5,
-2, -4.334659, -6.55692, 1, 1.5, 0.5, 0.5,
-2, -4.334659, -6.55692, 0, 1.5, 0.5, 0.5,
-1, -4.334659, -6.55692, 0, -0.5, 0.5, 0.5,
-1, -4.334659, -6.55692, 1, -0.5, 0.5, 0.5,
-1, -4.334659, -6.55692, 1, 1.5, 0.5, 0.5,
-1, -4.334659, -6.55692, 0, 1.5, 0.5, 0.5,
0, -4.334659, -6.55692, 0, -0.5, 0.5, 0.5,
0, -4.334659, -6.55692, 1, -0.5, 0.5, 0.5,
0, -4.334659, -6.55692, 1, 1.5, 0.5, 0.5,
0, -4.334659, -6.55692, 0, 1.5, 0.5, 0.5,
1, -4.334659, -6.55692, 0, -0.5, 0.5, 0.5,
1, -4.334659, -6.55692, 1, -0.5, 0.5, 0.5,
1, -4.334659, -6.55692, 1, 1.5, 0.5, 0.5,
1, -4.334659, -6.55692, 0, 1.5, 0.5, 0.5,
2, -4.334659, -6.55692, 0, -0.5, 0.5, 0.5,
2, -4.334659, -6.55692, 1, -0.5, 0.5, 0.5,
2, -4.334659, -6.55692, 1, 1.5, 0.5, 0.5,
2, -4.334659, -6.55692, 0, 1.5, 0.5, 0.5,
3, -4.334659, -6.55692, 0, -0.5, 0.5, 0.5,
3, -4.334659, -6.55692, 1, -0.5, 0.5, 0.5,
3, -4.334659, -6.55692, 1, 1.5, 0.5, 0.5,
3, -4.334659, -6.55692, 0, 1.5, 0.5, 0.5
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
-3.179354, -2, -5.701609,
-3.179354, 2, -5.701609,
-3.179354, -2, -5.701609,
-3.352988, -2, -5.986713,
-3.179354, 0, -5.701609,
-3.352988, 0, -5.986713,
-3.179354, 2, -5.701609,
-3.352988, 2, -5.986713
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
"-2",
"0",
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
-3.700254, -2, -6.55692, 0, -0.5, 0.5, 0.5,
-3.700254, -2, -6.55692, 1, -0.5, 0.5, 0.5,
-3.700254, -2, -6.55692, 1, 1.5, 0.5, 0.5,
-3.700254, -2, -6.55692, 0, 1.5, 0.5, 0.5,
-3.700254, 0, -6.55692, 0, -0.5, 0.5, 0.5,
-3.700254, 0, -6.55692, 1, -0.5, 0.5, 0.5,
-3.700254, 0, -6.55692, 1, 1.5, 0.5, 0.5,
-3.700254, 0, -6.55692, 0, 1.5, 0.5, 0.5,
-3.700254, 2, -6.55692, 0, -0.5, 0.5, 0.5,
-3.700254, 2, -6.55692, 1, -0.5, 0.5, 0.5,
-3.700254, 2, -6.55692, 1, 1.5, 0.5, 0.5,
-3.700254, 2, -6.55692, 0, 1.5, 0.5, 0.5
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
-3.179354, -3.781128, -4,
-3.179354, -3.781128, 4,
-3.179354, -3.781128, -4,
-3.352988, -3.965638, -4,
-3.179354, -3.781128, -2,
-3.352988, -3.965638, -2,
-3.179354, -3.781128, 0,
-3.352988, -3.965638, 0,
-3.179354, -3.781128, 2,
-3.352988, -3.965638, 2,
-3.179354, -3.781128, 4,
-3.352988, -3.965638, 4
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
-3.700254, -4.334659, -4, 0, -0.5, 0.5, 0.5,
-3.700254, -4.334659, -4, 1, -0.5, 0.5, 0.5,
-3.700254, -4.334659, -4, 1, 1.5, 0.5, 0.5,
-3.700254, -4.334659, -4, 0, 1.5, 0.5, 0.5,
-3.700254, -4.334659, -2, 0, -0.5, 0.5, 0.5,
-3.700254, -4.334659, -2, 1, -0.5, 0.5, 0.5,
-3.700254, -4.334659, -2, 1, 1.5, 0.5, 0.5,
-3.700254, -4.334659, -2, 0, 1.5, 0.5, 0.5,
-3.700254, -4.334659, 0, 0, -0.5, 0.5, 0.5,
-3.700254, -4.334659, 0, 1, -0.5, 0.5, 0.5,
-3.700254, -4.334659, 0, 1, 1.5, 0.5, 0.5,
-3.700254, -4.334659, 0, 0, 1.5, 0.5, 0.5,
-3.700254, -4.334659, 2, 0, -0.5, 0.5, 0.5,
-3.700254, -4.334659, 2, 1, -0.5, 0.5, 0.5,
-3.700254, -4.334659, 2, 1, 1.5, 0.5, 0.5,
-3.700254, -4.334659, 2, 0, 1.5, 0.5, 0.5,
-3.700254, -4.334659, 4, 0, -0.5, 0.5, 0.5,
-3.700254, -4.334659, 4, 1, -0.5, 0.5, 0.5,
-3.700254, -4.334659, 4, 1, 1.5, 0.5, 0.5,
-3.700254, -4.334659, 4, 0, 1.5, 0.5, 0.5
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
-3.179354, -3.781128, -5.701609,
-3.179354, 3.599283, -5.701609,
-3.179354, -3.781128, 5.702531,
-3.179354, 3.599283, 5.702531,
-3.179354, -3.781128, -5.701609,
-3.179354, -3.781128, 5.702531,
-3.179354, 3.599283, -5.701609,
-3.179354, 3.599283, 5.702531,
-3.179354, -3.781128, -5.701609,
3.765973, -3.781128, -5.701609,
-3.179354, -3.781128, 5.702531,
3.765973, -3.781128, 5.702531,
-3.179354, 3.599283, -5.701609,
3.765973, 3.599283, -5.701609,
-3.179354, 3.599283, 5.702531,
3.765973, 3.599283, 5.702531,
3.765973, -3.781128, -5.701609,
3.765973, 3.599283, -5.701609,
3.765973, -3.781128, 5.702531,
3.765973, 3.599283, 5.702531,
3.765973, -3.781128, -5.701609,
3.765973, -3.781128, 5.702531,
3.765973, 3.599283, -5.701609,
3.765973, 3.599283, 5.702531
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
var radius = 8.146704;
var distance = 36.24561;
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
mvMatrix.translate( -0.2933093, 0.09092259, -0.0004611015 );
mvMatrix.scale( 1.268245, 1.19348, 0.772384 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.24561);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Jasmolin_II<-read.table("Jasmolin_II.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Jasmolin_II$V2
```

```
## Error in eval(expr, envir, enclos): object 'Jasmolin_II' not found
```

```r
y<-Jasmolin_II$V3
```

```
## Error in eval(expr, envir, enclos): object 'Jasmolin_II' not found
```

```r
z<-Jasmolin_II$V4
```

```
## Error in eval(expr, envir, enclos): object 'Jasmolin_II' not found
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
-3.078209, 0.3262266, -1.903904, 0, 0, 1, 1, 1,
-2.962933, -0.33885, -1.894761, 1, 0, 0, 1, 1,
-2.774732, 0.04324858, -1.007142, 1, 0, 0, 1, 1,
-2.746531, 0.8286703, -0.8777115, 1, 0, 0, 1, 1,
-2.735967, 0.1054936, -0.8281745, 1, 0, 0, 1, 1,
-2.707605, -1.565521, -2.535321, 1, 0, 0, 1, 1,
-2.647484, -1.000452, -1.436699, 0, 0, 0, 1, 1,
-2.582079, 0.6482397, -0.8043273, 0, 0, 0, 1, 1,
-2.571185, -0.02867462, -2.541414, 0, 0, 0, 1, 1,
-2.559182, 0.2793132, -1.904229, 0, 0, 0, 1, 1,
-2.530595, -1.899547, -1.521497, 0, 0, 0, 1, 1,
-2.369841, 0.3831304, -0.8727271, 0, 0, 0, 1, 1,
-2.318916, 0.6451864, -2.11129, 0, 0, 0, 1, 1,
-2.221765, 0.5651901, -2.285596, 1, 1, 1, 1, 1,
-2.183197, -1.120184, -1.816604, 1, 1, 1, 1, 1,
-2.106842, -0.2087016, -1.554125, 1, 1, 1, 1, 1,
-2.100575, -0.07809663, -2.523028, 1, 1, 1, 1, 1,
-2.091268, -0.1283502, -2.092837, 1, 1, 1, 1, 1,
-2.088135, 0.1105881, -0.8143194, 1, 1, 1, 1, 1,
-2.063891, 0.5932828, -0.8296192, 1, 1, 1, 1, 1,
-2.057455, 1.170297, -2.299628, 1, 1, 1, 1, 1,
-2.040639, -1.121168, -3.039056, 1, 1, 1, 1, 1,
-2.036019, -2.026475, -1.754491, 1, 1, 1, 1, 1,
-2.029546, -1.627476, -0.8683298, 1, 1, 1, 1, 1,
-2.023746, -0.7687262, -1.05933, 1, 1, 1, 1, 1,
-2.005762, 1.909294, -2.31366, 1, 1, 1, 1, 1,
-1.998448, 0.6462802, -1.410873, 1, 1, 1, 1, 1,
-1.971612, 0.05730994, -2.259768, 1, 1, 1, 1, 1,
-1.966412, -0.548589, -2.149232, 0, 0, 1, 1, 1,
-1.948201, -1.499201, -2.430663, 1, 0, 0, 1, 1,
-1.92189, 0.60026, -1.39629, 1, 0, 0, 1, 1,
-1.88389, 0.9776674, 0.9078856, 1, 0, 0, 1, 1,
-1.874326, 0.04329534, -2.568265, 1, 0, 0, 1, 1,
-1.866833, 1.591447, -1.285727, 1, 0, 0, 1, 1,
-1.836889, 0.6316341, -1.418452, 0, 0, 0, 1, 1,
-1.835556, 1.540944, -2.659496, 0, 0, 0, 1, 1,
-1.812263, -1.989307, -2.284055, 0, 0, 0, 1, 1,
-1.810891, 0.5563779, -1.985896, 0, 0, 0, 1, 1,
-1.794195, 0.2417803, -1.988962, 0, 0, 0, 1, 1,
-1.767208, 0.07907409, -2.008224, 0, 0, 0, 1, 1,
-1.764024, -0.003217702, -1.037689, 0, 0, 0, 1, 1,
-1.758075, 0.7384076, -1.745879, 1, 1, 1, 1, 1,
-1.740145, -0.842585, -2.596832, 1, 1, 1, 1, 1,
-1.735843, 0.5700432, -1.620317, 1, 1, 1, 1, 1,
-1.732028, 0.3707941, -0.6436532, 1, 1, 1, 1, 1,
-1.725563, 0.7503904, -1.330458, 1, 1, 1, 1, 1,
-1.712228, 0.9997618, -0.3856325, 1, 1, 1, 1, 1,
-1.683259, 2.037518, 1.613223, 1, 1, 1, 1, 1,
-1.677978, -1.196809, -2.379935, 1, 1, 1, 1, 1,
-1.664945, -0.8446403, -2.921731, 1, 1, 1, 1, 1,
-1.662524, -0.802652, -1.842537, 1, 1, 1, 1, 1,
-1.657734, -2.063784, -2.387608, 1, 1, 1, 1, 1,
-1.649456, 0.3482303, -1.937368, 1, 1, 1, 1, 1,
-1.642307, -0.3479967, -2.10884, 1, 1, 1, 1, 1,
-1.641947, -1.288773, -3.563286, 1, 1, 1, 1, 1,
-1.641086, 1.698908, 0.2641571, 1, 1, 1, 1, 1,
-1.633318, 2.263861, -0.5903499, 0, 0, 1, 1, 1,
-1.626371, 0.9008359, -1.493441, 1, 0, 0, 1, 1,
-1.621104, -0.8863255, -2.724521, 1, 0, 0, 1, 1,
-1.598849, -0.3488416, -2.29055, 1, 0, 0, 1, 1,
-1.595981, -1.481981, -4.349056, 1, 0, 0, 1, 1,
-1.594983, 0.7995808, -0.4722517, 1, 0, 0, 1, 1,
-1.578596, -1.676033, -2.651197, 0, 0, 0, 1, 1,
-1.561829, -0.6553559, -3.847689, 0, 0, 0, 1, 1,
-1.558918, 0.7762554, -1.926831, 0, 0, 0, 1, 1,
-1.553233, 0.3316873, -0.2235913, 0, 0, 0, 1, 1,
-1.548759, -0.3428794, -1.624415, 0, 0, 0, 1, 1,
-1.547613, -0.489133, -2.612877, 0, 0, 0, 1, 1,
-1.527101, -0.2984, -2.072755, 0, 0, 0, 1, 1,
-1.516925, 0.8390282, 0.3048105, 1, 1, 1, 1, 1,
-1.511353, 0.2290377, -1.207219, 1, 1, 1, 1, 1,
-1.510843, -0.4881477, -1.162214, 1, 1, 1, 1, 1,
-1.504654, 0.4501891, -0.1667186, 1, 1, 1, 1, 1,
-1.504575, 1.339494, -0.4155653, 1, 1, 1, 1, 1,
-1.468777, 0.823436, -0.8059897, 1, 1, 1, 1, 1,
-1.462536, 0.1619476, -0.1073911, 1, 1, 1, 1, 1,
-1.462175, 0.1466139, -1.446246, 1, 1, 1, 1, 1,
-1.460825, -0.4819181, -3.020334, 1, 1, 1, 1, 1,
-1.459945, 0.667238, -2.002069, 1, 1, 1, 1, 1,
-1.454532, -1.069871, -2.504231, 1, 1, 1, 1, 1,
-1.4526, -0.6339797, -2.076324, 1, 1, 1, 1, 1,
-1.448502, 0.8159524, -3.126534, 1, 1, 1, 1, 1,
-1.435364, 0.8578264, 0.02338878, 1, 1, 1, 1, 1,
-1.407618, 0.205855, -0.2416034, 1, 1, 1, 1, 1,
-1.405739, 0.357904, -0.893277, 0, 0, 1, 1, 1,
-1.403269, 0.9290509, -1.180126, 1, 0, 0, 1, 1,
-1.396986, -1.082329, -1.949188, 1, 0, 0, 1, 1,
-1.38622, 1.166311, -1.888393, 1, 0, 0, 1, 1,
-1.37931, 2.041266, -1.052381, 1, 0, 0, 1, 1,
-1.373892, 0.06066189, -0.9393303, 1, 0, 0, 1, 1,
-1.363791, -1.007066, -1.533682, 0, 0, 0, 1, 1,
-1.348851, -0.808183, -2.779326, 0, 0, 0, 1, 1,
-1.345369, -2.810591, -1.91191, 0, 0, 0, 1, 1,
-1.341102, 1.61571, -1.186203, 0, 0, 0, 1, 1,
-1.340143, 1.485108, -2.290657, 0, 0, 0, 1, 1,
-1.335972, 1.073048, -0.2095975, 0, 0, 0, 1, 1,
-1.335099, 1.624627, -0.4035901, 0, 0, 0, 1, 1,
-1.327894, -1.211476, -3.854928, 1, 1, 1, 1, 1,
-1.32651, -1.833581, -2.374167, 1, 1, 1, 1, 1,
-1.322113, 0.5479999, -0.9261617, 1, 1, 1, 1, 1,
-1.318776, -0.4482818, -1.416039, 1, 1, 1, 1, 1,
-1.312375, -0.9021862, -1.275951, 1, 1, 1, 1, 1,
-1.29598, 1.182701, -0.8309498, 1, 1, 1, 1, 1,
-1.289081, 0.4454418, -0.6349027, 1, 1, 1, 1, 1,
-1.28642, -1.510757, -0.8778411, 1, 1, 1, 1, 1,
-1.285784, -0.6984168, -1.296609, 1, 1, 1, 1, 1,
-1.271363, 0.1139804, -0.4546385, 1, 1, 1, 1, 1,
-1.269504, -1.701208, -2.47562, 1, 1, 1, 1, 1,
-1.268076, 0.4927321, -0.4358698, 1, 1, 1, 1, 1,
-1.261829, 1.273613, -2.374014, 1, 1, 1, 1, 1,
-1.259196, -1.748896, -0.9576461, 1, 1, 1, 1, 1,
-1.258479, 0.8056801, -1.755396, 1, 1, 1, 1, 1,
-1.256455, -1.318435, -0.9996991, 0, 0, 1, 1, 1,
-1.251444, -0.5533684, -1.842154, 1, 0, 0, 1, 1,
-1.243919, -1.09105, -1.463923, 1, 0, 0, 1, 1,
-1.238586, -0.1607949, -1.173311, 1, 0, 0, 1, 1,
-1.238256, 1.970259, -2.440398, 1, 0, 0, 1, 1,
-1.231186, -0.4360189, -2.873424, 1, 0, 0, 1, 1,
-1.227942, 0.4537875, 0.4478984, 0, 0, 0, 1, 1,
-1.220282, -0.5298471, -2.940688, 0, 0, 0, 1, 1,
-1.216374, -0.1772176, -2.59804, 0, 0, 0, 1, 1,
-1.214698, -1.101417, -2.004865, 0, 0, 0, 1, 1,
-1.214466, -1.470138, -2.150653, 0, 0, 0, 1, 1,
-1.214206, -1.900269, -1.111694, 0, 0, 0, 1, 1,
-1.207353, -2.147152, -2.638379, 0, 0, 0, 1, 1,
-1.205569, -0.5107323, -4.380397, 1, 1, 1, 1, 1,
-1.202919, 0.1497383, -2.330507, 1, 1, 1, 1, 1,
-1.199132, -0.5414443, -2.367136, 1, 1, 1, 1, 1,
-1.197624, 0.830803, -1.598593, 1, 1, 1, 1, 1,
-1.196092, 1.024514, -0.83661, 1, 1, 1, 1, 1,
-1.189593, 0.2911397, -2.896127, 1, 1, 1, 1, 1,
-1.185861, 0.5261144, -1.96131, 1, 1, 1, 1, 1,
-1.17778, 1.389437, -1.217317, 1, 1, 1, 1, 1,
-1.17733, 0.4288454, -3.10902, 1, 1, 1, 1, 1,
-1.171805, -0.5428044, -1.299586, 1, 1, 1, 1, 1,
-1.167358, 0.9875804, -3.308341, 1, 1, 1, 1, 1,
-1.166705, 0.2148163, -0.706758, 1, 1, 1, 1, 1,
-1.151085, -1.176117, -3.574882, 1, 1, 1, 1, 1,
-1.151044, -0.5360836, -1.658835, 1, 1, 1, 1, 1,
-1.141754, 0.1208066, -4.412341, 1, 1, 1, 1, 1,
-1.129295, -0.4251766, -0.6478171, 0, 0, 1, 1, 1,
-1.123346, -0.1198109, -1.086151, 1, 0, 0, 1, 1,
-1.121632, 0.1225871, -0.9898575, 1, 0, 0, 1, 1,
-1.110959, 0.04000171, -1.691259, 1, 0, 0, 1, 1,
-1.108002, -0.244272, -2.378147, 1, 0, 0, 1, 1,
-1.102885, -2.526948, -0.8960958, 1, 0, 0, 1, 1,
-1.089571, -0.02261945, -3.09844, 0, 0, 0, 1, 1,
-1.084152, 0.9676462, -1.090402, 0, 0, 0, 1, 1,
-1.075578, 1.241752, -0.9689091, 0, 0, 0, 1, 1,
-1.074878, -0.4154562, -3.664354, 0, 0, 0, 1, 1,
-1.055384, 0.9368161, -0.5506071, 0, 0, 0, 1, 1,
-1.044598, 1.376334, -0.3918045, 0, 0, 0, 1, 1,
-1.040262, -1.710229, -1.647484, 0, 0, 0, 1, 1,
-1.038661, 0.1485651, -2.198141, 1, 1, 1, 1, 1,
-1.034977, -1.225324, -3.057153, 1, 1, 1, 1, 1,
-1.030601, -0.6485975, -2.391207, 1, 1, 1, 1, 1,
-1.023611, 0.05123492, -2.34696, 1, 1, 1, 1, 1,
-0.9926373, 0.6572524, -1.713908, 1, 1, 1, 1, 1,
-0.992441, 1.371926, -1.530324, 1, 1, 1, 1, 1,
-0.9917198, -0.7624639, -1.960939, 1, 1, 1, 1, 1,
-0.9751772, 0.1678425, -0.9972216, 1, 1, 1, 1, 1,
-0.9743029, 1.062807, -0.002235551, 1, 1, 1, 1, 1,
-0.9730603, 0.9835905, -1.228055, 1, 1, 1, 1, 1,
-0.965197, -0.5491552, -3.747593, 1, 1, 1, 1, 1,
-0.9599454, 0.6223345, 0.1301634, 1, 1, 1, 1, 1,
-0.955672, -0.1137453, -0.5050113, 1, 1, 1, 1, 1,
-0.9524841, -0.1426414, -2.259315, 1, 1, 1, 1, 1,
-0.9509723, 0.4141831, -0.3575296, 1, 1, 1, 1, 1,
-0.9410763, 0.5984541, 0.4868701, 0, 0, 1, 1, 1,
-0.9387746, -0.2587216, -2.970371, 1, 0, 0, 1, 1,
-0.9350138, 1.121902, 0.2513002, 1, 0, 0, 1, 1,
-0.9317316, -0.158062, -3.011482, 1, 0, 0, 1, 1,
-0.9309738, 0.7964543, -3.961481, 1, 0, 0, 1, 1,
-0.9267439, 0.7038561, -0.08860726, 1, 0, 0, 1, 1,
-0.9174474, -0.1005491, -2.841498, 0, 0, 0, 1, 1,
-0.9148007, 1.428218, 0.01256031, 0, 0, 0, 1, 1,
-0.9146885, -0.5363596, -1.620054, 0, 0, 0, 1, 1,
-0.9064001, 0.8083653, -0.03890485, 0, 0, 0, 1, 1,
-0.903536, 0.2530008, 0.1926117, 0, 0, 0, 1, 1,
-0.9020242, -0.3845238, -0.3887661, 0, 0, 0, 1, 1,
-0.9014724, -1.72027, -2.812397, 0, 0, 0, 1, 1,
-0.8991075, 1.854048, -0.1915305, 1, 1, 1, 1, 1,
-0.8951215, 2.367993, -1.807825, 1, 1, 1, 1, 1,
-0.894242, 0.2095271, -1.943864, 1, 1, 1, 1, 1,
-0.8868716, -0.5517651, -2.968537, 1, 1, 1, 1, 1,
-0.8853232, -0.4682913, -0.8938919, 1, 1, 1, 1, 1,
-0.8749751, -1.052502, -1.383177, 1, 1, 1, 1, 1,
-0.8744113, 0.2269201, -0.3421908, 1, 1, 1, 1, 1,
-0.8735651, -1.204898, -1.465848, 1, 1, 1, 1, 1,
-0.8728749, -0.3208588, -3.107048, 1, 1, 1, 1, 1,
-0.8658369, -1.618222, -1.165646, 1, 1, 1, 1, 1,
-0.8521022, 0.738125, -0.138993, 1, 1, 1, 1, 1,
-0.8431035, -0.4759324, -2.618993, 1, 1, 1, 1, 1,
-0.8357186, -1.345485, -2.220291, 1, 1, 1, 1, 1,
-0.8335534, -0.4381876, -1.785271, 1, 1, 1, 1, 1,
-0.83163, 0.5950829, 0.5696604, 1, 1, 1, 1, 1,
-0.8311555, -1.671225, -1.230013, 0, 0, 1, 1, 1,
-0.8239886, -0.1297476, -1.868496, 1, 0, 0, 1, 1,
-0.8227701, 0.3351673, -0.863502, 1, 0, 0, 1, 1,
-0.8218353, -1.772181, -3.299247, 1, 0, 0, 1, 1,
-0.8203609, -0.5743496, -2.8416, 1, 0, 0, 1, 1,
-0.8186065, -0.7750993, -1.772786, 1, 0, 0, 1, 1,
-0.8109159, -0.8122011, -3.6018, 0, 0, 0, 1, 1,
-0.8103682, -1.058794, -2.632084, 0, 0, 0, 1, 1,
-0.8100917, 1.794358, 0.9959959, 0, 0, 0, 1, 1,
-0.8096979, 1.236878, 1.761906, 0, 0, 0, 1, 1,
-0.8084519, 0.210366, -1.817576, 0, 0, 0, 1, 1,
-0.7999963, 0.7274843, 0.8764033, 0, 0, 0, 1, 1,
-0.7912385, -1.196801, -2.641573, 0, 0, 0, 1, 1,
-0.790966, 0.3837927, -0.6170619, 1, 1, 1, 1, 1,
-0.7890757, -1.142131, -1.365981, 1, 1, 1, 1, 1,
-0.7817618, 0.9572842, -1.176727, 1, 1, 1, 1, 1,
-0.7763425, -2.08422, -2.765385, 1, 1, 1, 1, 1,
-0.771848, 0.4243482, 0.9254096, 1, 1, 1, 1, 1,
-0.7647579, 1.211793, -0.4962783, 1, 1, 1, 1, 1,
-0.7544779, -0.3504884, -3.346661, 1, 1, 1, 1, 1,
-0.7484474, -1.169577, -1.796807, 1, 1, 1, 1, 1,
-0.7471526, -1.127545, -3.204915, 1, 1, 1, 1, 1,
-0.7439986, 1.543383, -1.075073, 1, 1, 1, 1, 1,
-0.7427018, 0.2873024, -2.2072, 1, 1, 1, 1, 1,
-0.7421182, 0.9964716, -2.051485, 1, 1, 1, 1, 1,
-0.7397177, -1.335961, -2.991901, 1, 1, 1, 1, 1,
-0.739652, -0.3774756, -2.985002, 1, 1, 1, 1, 1,
-0.7347874, 0.2979813, -1.117147, 1, 1, 1, 1, 1,
-0.7344379, -0.8634032, -1.00517, 0, 0, 1, 1, 1,
-0.7216861, 0.1643758, -1.620398, 1, 0, 0, 1, 1,
-0.7213377, -1.333095, -3.059406, 1, 0, 0, 1, 1,
-0.7183329, -0.6097053, -0.9220549, 1, 0, 0, 1, 1,
-0.7179761, 0.8623463, -1.714097, 1, 0, 0, 1, 1,
-0.7120832, 0.138382, -1.980571, 1, 0, 0, 1, 1,
-0.708027, 0.4043712, -0.2304485, 0, 0, 0, 1, 1,
-0.7074218, -0.221911, -1.344822, 0, 0, 0, 1, 1,
-0.7006904, 1.005433, -1.474444, 0, 0, 0, 1, 1,
-0.6998104, -1.125197, -1.88892, 0, 0, 0, 1, 1,
-0.6917502, -2.268274, -3.132665, 0, 0, 0, 1, 1,
-0.6867206, 0.4571158, 0.4361771, 0, 0, 0, 1, 1,
-0.68396, 0.5936844, -1.241747, 0, 0, 0, 1, 1,
-0.6752859, 0.2525539, -0.414854, 1, 1, 1, 1, 1,
-0.6711675, 0.3435174, -0.2104508, 1, 1, 1, 1, 1,
-0.6631534, -0.02972309, -2.383117, 1, 1, 1, 1, 1,
-0.6608489, 1.266993, -0.03992742, 1, 1, 1, 1, 1,
-0.6558278, 0.92277, -0.5546338, 1, 1, 1, 1, 1,
-0.6497124, -0.3105117, -0.01229081, 1, 1, 1, 1, 1,
-0.6490301, -1.842375, -1.791589, 1, 1, 1, 1, 1,
-0.6483793, 0.475183, 0.7316728, 1, 1, 1, 1, 1,
-0.6483564, -1.389214, -2.575269, 1, 1, 1, 1, 1,
-0.6441772, 0.8640697, -0.6201858, 1, 1, 1, 1, 1,
-0.6419777, 0.8935702, -0.7790739, 1, 1, 1, 1, 1,
-0.6326498, -1.120534, -3.166706, 1, 1, 1, 1, 1,
-0.6318756, -0.8011142, -3.102407, 1, 1, 1, 1, 1,
-0.6309178, -1.300961, -3.954869, 1, 1, 1, 1, 1,
-0.6308944, 0.8494833, -0.7859282, 1, 1, 1, 1, 1,
-0.6289803, -1.09277, -3.76483, 0, 0, 1, 1, 1,
-0.6138132, 0.2410692, -2.146372, 1, 0, 0, 1, 1,
-0.6137433, -1.603645, -1.40567, 1, 0, 0, 1, 1,
-0.6112001, 0.05419837, -2.220196, 1, 0, 0, 1, 1,
-0.6017348, -0.3482668, -3.293281, 1, 0, 0, 1, 1,
-0.6017206, -0.9488451, -2.367667, 1, 0, 0, 1, 1,
-0.6009116, 1.863038, 0.1649704, 0, 0, 0, 1, 1,
-0.6008486, 0.6202777, 0.9971482, 0, 0, 0, 1, 1,
-0.591198, 2.276299, -1.150685, 0, 0, 0, 1, 1,
-0.581997, -0.03627591, -0.8732369, 0, 0, 0, 1, 1,
-0.5738422, 0.3352275, 0.3319896, 0, 0, 0, 1, 1,
-0.5719003, 0.2567756, -0.8673536, 0, 0, 0, 1, 1,
-0.5708331, 0.2166741, -1.487784, 0, 0, 0, 1, 1,
-0.568722, 0.8536792, -0.2699375, 1, 1, 1, 1, 1,
-0.5620036, -0.5201604, -2.969675, 1, 1, 1, 1, 1,
-0.5605992, -0.843946, -2.284726, 1, 1, 1, 1, 1,
-0.5596805, -0.2979435, -1.223911, 1, 1, 1, 1, 1,
-0.5577808, 0.4763724, 0.3466133, 1, 1, 1, 1, 1,
-0.5538818, 1.490637, -1.276337, 1, 1, 1, 1, 1,
-0.5500159, 0.06239082, 1.573985, 1, 1, 1, 1, 1,
-0.5482827, -0.8721949, -2.141174, 1, 1, 1, 1, 1,
-0.5455261, 0.704237, 1.432201, 1, 1, 1, 1, 1,
-0.543723, 0.4387431, -1.070499, 1, 1, 1, 1, 1,
-0.5436907, 0.6626362, 0.4257879, 1, 1, 1, 1, 1,
-0.5429693, 0.3130076, -2.358699, 1, 1, 1, 1, 1,
-0.5421472, 0.4079913, -0.5334021, 1, 1, 1, 1, 1,
-0.539784, -1.153179, -2.955353, 1, 1, 1, 1, 1,
-0.530229, 0.07035401, -0.410553, 1, 1, 1, 1, 1,
-0.5300455, 0.183924, -1.869367, 0, 0, 1, 1, 1,
-0.5263284, -0.09293284, -2.080287, 1, 0, 0, 1, 1,
-0.5193754, -2.213517, -3.093007, 1, 0, 0, 1, 1,
-0.5175373, -0.1551679, -3.291322, 1, 0, 0, 1, 1,
-0.5168597, 0.04425044, -0.7893874, 1, 0, 0, 1, 1,
-0.5157201, -0.2133397, -2.197836, 1, 0, 0, 1, 1,
-0.5155375, 1.600006, -0.1474887, 0, 0, 0, 1, 1,
-0.5125012, -0.7729718, -3.03199, 0, 0, 0, 1, 1,
-0.5083413, 0.1479561, -0.8723404, 0, 0, 0, 1, 1,
-0.5037282, -0.8959041, -2.029381, 0, 0, 0, 1, 1,
-0.5020762, 0.5985863, -1.824712, 0, 0, 0, 1, 1,
-0.5020022, -1.397609, -2.407188, 0, 0, 0, 1, 1,
-0.5000429, 1.15518, 0.8779119, 0, 0, 0, 1, 1,
-0.4966761, 0.1927093, -1.559819, 1, 1, 1, 1, 1,
-0.4928955, -1.053725, -4.083291, 1, 1, 1, 1, 1,
-0.4908487, 0.6265376, -0.4014826, 1, 1, 1, 1, 1,
-0.4903411, 0.03303134, -3.658009, 1, 1, 1, 1, 1,
-0.4886822, -1.291067, -2.947867, 1, 1, 1, 1, 1,
-0.4866847, 0.6375551, 0.5928235, 1, 1, 1, 1, 1,
-0.481383, -1.698826, -2.596931, 1, 1, 1, 1, 1,
-0.4788298, 0.5043749, -1.404594, 1, 1, 1, 1, 1,
-0.4730876, -0.2734463, -2.752212, 1, 1, 1, 1, 1,
-0.4721004, -0.4226679, -1.299975, 1, 1, 1, 1, 1,
-0.4700462, 1.597862, -2.128487, 1, 1, 1, 1, 1,
-0.4672391, 0.8156874, -1.371316, 1, 1, 1, 1, 1,
-0.4633524, 1.406634, -1.294166, 1, 1, 1, 1, 1,
-0.4632887, 1.39621, 0.07314131, 1, 1, 1, 1, 1,
-0.460733, -0.02589156, -2.405408, 1, 1, 1, 1, 1,
-0.4590601, -1.156993, -2.798583, 0, 0, 1, 1, 1,
-0.4581072, -0.6178982, -3.392901, 1, 0, 0, 1, 1,
-0.4561371, 0.1781057, -0.8618593, 1, 0, 0, 1, 1,
-0.4560649, 0.3133495, -1.972015, 1, 0, 0, 1, 1,
-0.4455187, 0.135953, -1.161534, 1, 0, 0, 1, 1,
-0.4434538, -0.2609895, -3.010524, 1, 0, 0, 1, 1,
-0.4421417, -0.6540591, -1.136761, 0, 0, 0, 1, 1,
-0.4398295, -0.7873138, -2.654617, 0, 0, 0, 1, 1,
-0.4389115, 0.4467367, -0.3056351, 0, 0, 0, 1, 1,
-0.4372549, -2.050193, -5.482946, 0, 0, 0, 1, 1,
-0.4332273, 0.8839344, 1.083106, 0, 0, 0, 1, 1,
-0.4330187, 1.506016, -0.6217684, 0, 0, 0, 1, 1,
-0.4291368, -0.7661704, -3.668101, 0, 0, 0, 1, 1,
-0.4271805, 0.9380066, 0.4905755, 1, 1, 1, 1, 1,
-0.4255698, -0.04644842, -2.64741, 1, 1, 1, 1, 1,
-0.4250377, -0.9183818, -3.677115, 1, 1, 1, 1, 1,
-0.4186502, -0.5917634, -2.136056, 1, 1, 1, 1, 1,
-0.4166282, 0.5790018, -1.815504, 1, 1, 1, 1, 1,
-0.4152975, -0.9782168, -1.829015, 1, 1, 1, 1, 1,
-0.4141125, 0.902352, 1.5012, 1, 1, 1, 1, 1,
-0.4106601, 0.9335898, 0.1998353, 1, 1, 1, 1, 1,
-0.4076558, -1.072474, -2.059966, 1, 1, 1, 1, 1,
-0.4065277, 0.8463385, -0.1242785, 1, 1, 1, 1, 1,
-0.4051449, 1.368319, -0.5706847, 1, 1, 1, 1, 1,
-0.4050099, -0.1886044, -0.7988225, 1, 1, 1, 1, 1,
-0.3963212, -0.5671918, -1.533992, 1, 1, 1, 1, 1,
-0.3944851, 1.284555, 1.030572, 1, 1, 1, 1, 1,
-0.3938394, 0.7862436, 1.255989, 1, 1, 1, 1, 1,
-0.3934982, 0.2166119, -1.63171, 0, 0, 1, 1, 1,
-0.3800451, -0.5091467, -2.236062, 1, 0, 0, 1, 1,
-0.3762667, -0.2185838, -2.266748, 1, 0, 0, 1, 1,
-0.373279, 0.9061751, 0.1669588, 1, 0, 0, 1, 1,
-0.3721465, 1.30146, -0.7210234, 1, 0, 0, 1, 1,
-0.3683065, -0.5116253, -3.393787, 1, 0, 0, 1, 1,
-0.3681794, -0.9464068, -2.802207, 0, 0, 0, 1, 1,
-0.3676096, -1.102028, -3.402529, 0, 0, 0, 1, 1,
-0.3625189, 1.430654, -0.8026114, 0, 0, 0, 1, 1,
-0.3583533, 2.03591, -1.259889, 0, 0, 0, 1, 1,
-0.357351, -0.7882437, -2.301471, 0, 0, 0, 1, 1,
-0.3569897, -0.703306, -3.947996, 0, 0, 0, 1, 1,
-0.3549587, 0.1893985, -0.585384, 0, 0, 0, 1, 1,
-0.3549027, -0.9564055, -2.242401, 1, 1, 1, 1, 1,
-0.3529984, 0.1398602, -2.712294, 1, 1, 1, 1, 1,
-0.3512189, -1.444021, -3.796473, 1, 1, 1, 1, 1,
-0.3460433, -0.6287382, -3.088971, 1, 1, 1, 1, 1,
-0.3450934, -0.5734553, -1.390994, 1, 1, 1, 1, 1,
-0.3408742, -0.7774894, -1.638705, 1, 1, 1, 1, 1,
-0.3327837, -0.3310437, -3.539502, 1, 1, 1, 1, 1,
-0.3269203, -0.6464584, -1.255519, 1, 1, 1, 1, 1,
-0.3261293, -0.3644456, -2.844725, 1, 1, 1, 1, 1,
-0.3244906, -0.05616114, -0.8759991, 1, 1, 1, 1, 1,
-0.3189626, -1.283054, -2.741355, 1, 1, 1, 1, 1,
-0.3154585, 0.2494158, -3.136157, 1, 1, 1, 1, 1,
-0.3145088, 0.2857895, 0.7514791, 1, 1, 1, 1, 1,
-0.308479, 0.4814619, -0.7540964, 1, 1, 1, 1, 1,
-0.3069, 0.2658631, 0.1038382, 1, 1, 1, 1, 1,
-0.3041137, 1.216498, 0.56481, 0, 0, 1, 1, 1,
-0.3035503, -1.771547, -3.564217, 1, 0, 0, 1, 1,
-0.3027847, -0.5275164, -2.238482, 1, 0, 0, 1, 1,
-0.2993578, -0.1272072, -1.633553, 1, 0, 0, 1, 1,
-0.2959184, -1.925392, -4.003944, 1, 0, 0, 1, 1,
-0.2934291, 0.5106625, 1.162305, 1, 0, 0, 1, 1,
-0.2920409, 0.1878904, -1.32542, 0, 0, 0, 1, 1,
-0.2872807, -0.3025555, -3.14369, 0, 0, 0, 1, 1,
-0.2853539, -0.2166059, -2.190238, 0, 0, 0, 1, 1,
-0.2810383, 2.190519, -1.570341, 0, 0, 0, 1, 1,
-0.2792979, -0.8996962, -1.884971, 0, 0, 0, 1, 1,
-0.2787991, 0.7552533, 0.8288867, 0, 0, 0, 1, 1,
-0.2776272, -2.30209, -3.261672, 0, 0, 0, 1, 1,
-0.2724846, -0.5247251, -3.209719, 1, 1, 1, 1, 1,
-0.2713604, 0.7139523, -0.7699938, 1, 1, 1, 1, 1,
-0.2711427, 0.07452572, -1.475453, 1, 1, 1, 1, 1,
-0.2673466, -0.7304472, -3.107324, 1, 1, 1, 1, 1,
-0.2598095, -0.6555225, -0.5454898, 1, 1, 1, 1, 1,
-0.2579555, -0.4350181, -2.501638, 1, 1, 1, 1, 1,
-0.2566158, 1.39219, 1.00263, 1, 1, 1, 1, 1,
-0.2485476, -1.201587, -3.319625, 1, 1, 1, 1, 1,
-0.2401149, -0.9709493, -3.332654, 1, 1, 1, 1, 1,
-0.2392626, -1.329997, -2.08461, 1, 1, 1, 1, 1,
-0.2383976, -1.490032, -3.435879, 1, 1, 1, 1, 1,
-0.2374964, -1.326432, -5.53553, 1, 1, 1, 1, 1,
-0.2372142, -0.3186214, -0.8723935, 1, 1, 1, 1, 1,
-0.2371299, 0.1792773, -2.210742, 1, 1, 1, 1, 1,
-0.2351819, 0.09184078, -1.624564, 1, 1, 1, 1, 1,
-0.2325483, -0.6317145, -3.412883, 0, 0, 1, 1, 1,
-0.2308371, 0.01838857, -0.6212613, 1, 0, 0, 1, 1,
-0.2259164, -0.3282209, -3.435433, 1, 0, 0, 1, 1,
-0.2243321, -3.673646, -3.168984, 1, 0, 0, 1, 1,
-0.2224899, -1.43512, -3.662418, 1, 0, 0, 1, 1,
-0.2205711, -0.4083637, -2.984384, 1, 0, 0, 1, 1,
-0.219918, 0.8232393, -0.4306916, 0, 0, 0, 1, 1,
-0.2182556, 0.9935132, 0.899128, 0, 0, 0, 1, 1,
-0.2173943, 1.350064, 0.1465852, 0, 0, 0, 1, 1,
-0.2155408, 1.343063, -1.455291, 0, 0, 0, 1, 1,
-0.212302, -0.2509453, -1.394093, 0, 0, 0, 1, 1,
-0.2120535, 0.4153334, 1.012404, 0, 0, 0, 1, 1,
-0.2080545, -1.199015, -5.043203, 0, 0, 0, 1, 1,
-0.207438, -1.66851, -3.725467, 1, 1, 1, 1, 1,
-0.2043569, -0.6107495, -2.626465, 1, 1, 1, 1, 1,
-0.2025741, -1.053861, -2.409735, 1, 1, 1, 1, 1,
-0.2013791, -0.2078543, -3.112389, 1, 1, 1, 1, 1,
-0.1980347, 1.265035, 0.3603506, 1, 1, 1, 1, 1,
-0.1976224, -0.4880533, -2.783151, 1, 1, 1, 1, 1,
-0.19699, -0.9560471, -2.937852, 1, 1, 1, 1, 1,
-0.1958925, -0.6642641, -1.783563, 1, 1, 1, 1, 1,
-0.1952149, 0.808691, -0.4860891, 1, 1, 1, 1, 1,
-0.1866409, 0.8468156, 0.9936025, 1, 1, 1, 1, 1,
-0.1851664, 2.036636, -0.6545041, 1, 1, 1, 1, 1,
-0.1851292, -0.1407546, -3.16032, 1, 1, 1, 1, 1,
-0.184119, -0.795505, -4.294863, 1, 1, 1, 1, 1,
-0.1837217, -0.6958466, -3.485634, 1, 1, 1, 1, 1,
-0.1833541, -0.4774983, -3.396113, 1, 1, 1, 1, 1,
-0.1807012, -0.8128356, -4.343242, 0, 0, 1, 1, 1,
-0.1782043, 0.5047243, -0.7800053, 1, 0, 0, 1, 1,
-0.1763105, 0.3824338, -0.1847481, 1, 0, 0, 1, 1,
-0.176294, 1.0144, 0.3745155, 1, 0, 0, 1, 1,
-0.1753314, -0.2145708, -2.528879, 1, 0, 0, 1, 1,
-0.173473, -0.4430128, -3.164823, 1, 0, 0, 1, 1,
-0.1723089, -0.08369966, -0.5040228, 0, 0, 0, 1, 1,
-0.1682009, 0.03381719, -2.977026, 0, 0, 0, 1, 1,
-0.1580969, -0.4030636, -2.516839, 0, 0, 0, 1, 1,
-0.1541568, -0.907133, -2.912611, 0, 0, 0, 1, 1,
-0.1531081, 0.6941285, 0.009713057, 0, 0, 0, 1, 1,
-0.1508357, 0.4454032, 0.08227808, 0, 0, 0, 1, 1,
-0.150701, 0.205635, 0.08876656, 0, 0, 0, 1, 1,
-0.1488858, -1.97809, -1.717766, 1, 1, 1, 1, 1,
-0.1455594, 0.4129845, -1.478686, 1, 1, 1, 1, 1,
-0.1453131, 1.56496, 1.031996, 1, 1, 1, 1, 1,
-0.1449248, 1.91512, 0.4609189, 1, 1, 1, 1, 1,
-0.144491, 0.9146743, -0.2309517, 1, 1, 1, 1, 1,
-0.137731, -0.1264433, -2.227137, 1, 1, 1, 1, 1,
-0.1366343, 1.170601, -0.2325237, 1, 1, 1, 1, 1,
-0.133821, 0.9173062, -1.171081, 1, 1, 1, 1, 1,
-0.1318336, -0.8479506, -1.511658, 1, 1, 1, 1, 1,
-0.1250765, -0.4875014, -2.551253, 1, 1, 1, 1, 1,
-0.1243758, -0.1041136, -1.471304, 1, 1, 1, 1, 1,
-0.1224621, -1.778598, -2.227077, 1, 1, 1, 1, 1,
-0.1168303, 0.3300626, 0.8351564, 1, 1, 1, 1, 1,
-0.1155613, 1.220116, -0.6142785, 1, 1, 1, 1, 1,
-0.1083992, -1.817525, -3.668203, 1, 1, 1, 1, 1,
-0.1042403, -0.6505902, -1.916451, 0, 0, 1, 1, 1,
-0.09884216, -1.390711, -2.934037, 1, 0, 0, 1, 1,
-0.0986538, 0.3529122, -0.05002045, 1, 0, 0, 1, 1,
-0.09710476, 1.865083, 0.0001476162, 1, 0, 0, 1, 1,
-0.09458529, 0.2533014, -0.7471964, 1, 0, 0, 1, 1,
-0.09440865, -1.079673, -3.793889, 1, 0, 0, 1, 1,
-0.09235413, -0.5967659, -2.614044, 0, 0, 0, 1, 1,
-0.09159397, -1.765587, -3.620737, 0, 0, 0, 1, 1,
-0.08967395, 0.9000503, 0.8609614, 0, 0, 0, 1, 1,
-0.08938912, 0.986033, -0.2629686, 0, 0, 0, 1, 1,
-0.08795656, 1.510833, 0.5787508, 0, 0, 0, 1, 1,
-0.0872684, 2.730879, 0.1425895, 0, 0, 0, 1, 1,
-0.08684106, 2.030829, -1.505893, 0, 0, 0, 1, 1,
-0.08561721, 0.889159, -0.7965644, 1, 1, 1, 1, 1,
-0.08167213, -1.726674, -3.604882, 1, 1, 1, 1, 1,
-0.0706915, 0.6215567, -1.910378, 1, 1, 1, 1, 1,
-0.06866118, 0.4733215, 0.7507724, 1, 1, 1, 1, 1,
-0.06736631, 0.348154, 1.030024, 1, 1, 1, 1, 1,
-0.06390817, -0.7559495, -1.594558, 1, 1, 1, 1, 1,
-0.06380112, 0.6306407, 1.422157, 1, 1, 1, 1, 1,
-0.06103253, -0.8627969, -2.638131, 1, 1, 1, 1, 1,
-0.05738773, 0.7836293, 0.3808769, 1, 1, 1, 1, 1,
-0.05732489, 0.140412, -2.028471, 1, 1, 1, 1, 1,
-0.05725021, 0.2741261, 0.2408158, 1, 1, 1, 1, 1,
-0.05650091, 0.7743934, -1.357726, 1, 1, 1, 1, 1,
-0.05522789, -0.892931, -1.935608, 1, 1, 1, 1, 1,
-0.05449883, 0.01182808, -0.8418188, 1, 1, 1, 1, 1,
-0.05215369, -0.07911985, -2.593448, 1, 1, 1, 1, 1,
-0.05056886, 0.3765458, 0.9924064, 0, 0, 1, 1, 1,
-0.04849336, 2.354977, 1.102972, 1, 0, 0, 1, 1,
-0.04323869, -0.04911156, -3.442995, 1, 0, 0, 1, 1,
-0.04027226, -0.0507326, -2.287894, 1, 0, 0, 1, 1,
-0.03835915, 0.5539315, 0.2814426, 1, 0, 0, 1, 1,
-0.03782935, -1.637634, -0.9985945, 1, 0, 0, 1, 1,
-0.03538489, -0.7526515, -2.281923, 0, 0, 0, 1, 1,
-0.03137999, -0.6454473, -4.554915, 0, 0, 0, 1, 1,
-0.03094972, 1.243556, -1.258652, 0, 0, 0, 1, 1,
-0.02606429, -0.3108635, -5.197491, 0, 0, 0, 1, 1,
-0.02520925, 0.6190699, -0.9498732, 0, 0, 0, 1, 1,
-0.01703784, -0.9957913, -3.219964, 0, 0, 0, 1, 1,
-0.01646, -0.8889816, -2.999496, 0, 0, 0, 1, 1,
-0.006393624, -0.7654985, -2.366145, 1, 1, 1, 1, 1,
-0.006295332, -0.5661833, -2.852581, 1, 1, 1, 1, 1,
-0.003681559, 0.5598205, -0.118304, 1, 1, 1, 1, 1,
-0.003434877, -0.3135187, -2.474707, 1, 1, 1, 1, 1,
-0.002889623, -1.950224, -3.004647, 1, 1, 1, 1, 1,
-0.002065566, -0.00585233, -2.453583, 1, 1, 1, 1, 1,
-0.0004400401, -0.1050525, -3.260195, 1, 1, 1, 1, 1,
0.001650712, -0.4685503, 2.869488, 1, 1, 1, 1, 1,
0.003121506, -0.246534, 3.137744, 1, 1, 1, 1, 1,
0.007394811, -1.649479, 3.151858, 1, 1, 1, 1, 1,
0.007849484, 0.8290278, -0.5086374, 1, 1, 1, 1, 1,
0.00846512, 1.47542, -0.2423897, 1, 1, 1, 1, 1,
0.009264387, 0.8691745, -0.6982866, 1, 1, 1, 1, 1,
0.01277013, -2.061996, 1.348782, 1, 1, 1, 1, 1,
0.01409831, 0.5197597, -0.5189324, 1, 1, 1, 1, 1,
0.02007099, 0.1859166, 1.076842, 0, 0, 1, 1, 1,
0.02230054, -0.1680503, 3.62536, 1, 0, 0, 1, 1,
0.02255412, -1.386893, 2.750508, 1, 0, 0, 1, 1,
0.02382773, 1.343841, 1.893796, 1, 0, 0, 1, 1,
0.02547835, 1.330739, -0.9521067, 1, 0, 0, 1, 1,
0.02692726, -0.3762463, 2.715724, 1, 0, 0, 1, 1,
0.0294544, 1.804784, -2.620508, 0, 0, 0, 1, 1,
0.03233141, 1.16821, -0.8196709, 0, 0, 0, 1, 1,
0.03675531, -0.6761624, 2.777214, 0, 0, 0, 1, 1,
0.0379265, 1.733078, 1.19271, 0, 0, 0, 1, 1,
0.03837161, 1.516588, -0.4791532, 0, 0, 0, 1, 1,
0.0445581, 1.435248, 0.2802755, 0, 0, 0, 1, 1,
0.04544459, 0.8608367, -0.2787337, 0, 0, 0, 1, 1,
0.05097719, -0.5135077, 3.361093, 1, 1, 1, 1, 1,
0.05140243, 1.24303, -0.4555327, 1, 1, 1, 1, 1,
0.0530675, -2.183491, 4.250836, 1, 1, 1, 1, 1,
0.0545728, -0.4817808, 1.42035, 1, 1, 1, 1, 1,
0.05548105, -0.06282789, 3.36555, 1, 1, 1, 1, 1,
0.0567167, -0.9301944, 3.561939, 1, 1, 1, 1, 1,
0.05919345, -0.7684664, 3.39977, 1, 1, 1, 1, 1,
0.05930169, 0.3515433, 0.06434789, 1, 1, 1, 1, 1,
0.06128697, -0.2964281, 2.924792, 1, 1, 1, 1, 1,
0.06827135, -1.177797, 3.485101, 1, 1, 1, 1, 1,
0.06934667, 1.371565, -0.5898036, 1, 1, 1, 1, 1,
0.07216397, -0.714829, 3.322435, 1, 1, 1, 1, 1,
0.07483978, 1.193774, 0.1558004, 1, 1, 1, 1, 1,
0.07507785, -0.1068123, 1.222798, 1, 1, 1, 1, 1,
0.07888517, 0.03632244, 1.196189, 1, 1, 1, 1, 1,
0.0799733, -0.3898481, 3.727666, 0, 0, 1, 1, 1,
0.08421779, 1.49273, -2.049042, 1, 0, 0, 1, 1,
0.08692062, 0.2227938, 0.4841819, 1, 0, 0, 1, 1,
0.08760182, 1.386037, -0.5889155, 1, 0, 0, 1, 1,
0.09031742, -0.2834237, 2.251211, 1, 0, 0, 1, 1,
0.09765939, 0.02994468, -0.2902058, 1, 0, 0, 1, 1,
0.09828395, 0.8584368, 1.914189, 0, 0, 0, 1, 1,
0.1007723, -0.2669872, 1.31171, 0, 0, 0, 1, 1,
0.1074768, -1.311874, 2.971485, 0, 0, 0, 1, 1,
0.1100995, -0.4531695, 2.259732, 0, 0, 0, 1, 1,
0.1141668, -1.387692, 3.331542, 0, 0, 0, 1, 1,
0.1147927, -1.808272, 4.03489, 0, 0, 0, 1, 1,
0.1180867, -0.6631559, 3.27067, 0, 0, 0, 1, 1,
0.1194623, 0.1865899, 0.03920993, 1, 1, 1, 1, 1,
0.1220253, -0.09611589, 2.848047, 1, 1, 1, 1, 1,
0.1223554, 1.527541, -0.9671535, 1, 1, 1, 1, 1,
0.1228884, 0.2851523, 1.011877, 1, 1, 1, 1, 1,
0.1237039, -0.2974578, 1.987734, 1, 1, 1, 1, 1,
0.1251264, 1.067829, -0.2931992, 1, 1, 1, 1, 1,
0.1275169, 1.277268, -2.388734, 1, 1, 1, 1, 1,
0.1278967, -0.9414799, 3.17086, 1, 1, 1, 1, 1,
0.1299665, 0.5704721, 1.056896, 1, 1, 1, 1, 1,
0.1313301, 1.029333, -1.336993, 1, 1, 1, 1, 1,
0.1325583, 0.1892253, 1.832756, 1, 1, 1, 1, 1,
0.1337412, -0.2965053, 3.312638, 1, 1, 1, 1, 1,
0.1351497, 0.9227738, 0.4697023, 1, 1, 1, 1, 1,
0.1478433, -1.696665, 2.063081, 1, 1, 1, 1, 1,
0.148047, 0.03985218, 2.49349, 1, 1, 1, 1, 1,
0.1530082, -0.4246308, 2.207683, 0, 0, 1, 1, 1,
0.1569419, -2.219835, 3.053916, 1, 0, 0, 1, 1,
0.1634003, 1.732823, 1.44378, 1, 0, 0, 1, 1,
0.1659234, -0.7886932, 2.779675, 1, 0, 0, 1, 1,
0.1714342, 0.0369858, 1.26035, 1, 0, 0, 1, 1,
0.1716336, -0.4743309, 3.427003, 1, 0, 0, 1, 1,
0.1728399, 0.863232, -0.8946075, 0, 0, 0, 1, 1,
0.1739148, 0.1977174, 1.216473, 0, 0, 0, 1, 1,
0.1749584, -1.368802, 2.801405, 0, 0, 0, 1, 1,
0.1795599, -0.9871127, 2.240904, 0, 0, 0, 1, 1,
0.1801112, -1.380802, 5.201719, 0, 0, 0, 1, 1,
0.1846625, -1.660979, 5.015874, 0, 0, 0, 1, 1,
0.1852721, 1.734569, 0.1640136, 0, 0, 0, 1, 1,
0.1897547, -1.11873, 2.533002, 1, 1, 1, 1, 1,
0.1950908, 1.053796, 0.3214146, 1, 1, 1, 1, 1,
0.1957806, 0.1719864, 0.2727744, 1, 1, 1, 1, 1,
0.1961093, 0.5960405, -0.2091892, 1, 1, 1, 1, 1,
0.1966017, -0.8172827, 4.832351, 1, 1, 1, 1, 1,
0.1977904, 2.242156, 0.2197912, 1, 1, 1, 1, 1,
0.1978213, -0.945094, 3.593804, 1, 1, 1, 1, 1,
0.2021321, 1.341982, -1.121318, 1, 1, 1, 1, 1,
0.2043367, 2.6193, -1.453046, 1, 1, 1, 1, 1,
0.2116665, 1.186507, 0.4567189, 1, 1, 1, 1, 1,
0.2131176, 0.1802999, 0.1049813, 1, 1, 1, 1, 1,
0.2202893, -0.5840963, 3.564271, 1, 1, 1, 1, 1,
0.2211978, -0.6155249, 2.718357, 1, 1, 1, 1, 1,
0.2236009, 0.3519057, 1.92767, 1, 1, 1, 1, 1,
0.2253779, 2.11513, 0.3222985, 1, 1, 1, 1, 1,
0.2263127, 0.5779863, 2.354672, 0, 0, 1, 1, 1,
0.2284219, 1.050326, -1.662566, 1, 0, 0, 1, 1,
0.2333191, -0.2671206, 3.900593, 1, 0, 0, 1, 1,
0.2341593, -0.3489577, 3.487863, 1, 0, 0, 1, 1,
0.2347646, 1.635716, 0.7121603, 1, 0, 0, 1, 1,
0.2376952, -0.2679812, 3.725544, 1, 0, 0, 1, 1,
0.2386418, -1.025456, 4.736383, 0, 0, 0, 1, 1,
0.2435225, -1.078265, 1.255479, 0, 0, 0, 1, 1,
0.2438083, -0.4212992, 3.51645, 0, 0, 0, 1, 1,
0.2451541, -0.9751671, 0.7077799, 0, 0, 0, 1, 1,
0.2474432, 0.8050463, 0.165121, 0, 0, 0, 1, 1,
0.2501107, 0.003465535, 3.802438, 0, 0, 0, 1, 1,
0.2507594, 0.5572886, -0.4695194, 0, 0, 0, 1, 1,
0.2561806, 0.6486012, 0.5261192, 1, 1, 1, 1, 1,
0.2591495, 0.6125291, -0.9940657, 1, 1, 1, 1, 1,
0.2592787, 1.491994, 0.5441743, 1, 1, 1, 1, 1,
0.2634303, 1.322917, -1.426998, 1, 1, 1, 1, 1,
0.2704018, -2.559675, 1.529119, 1, 1, 1, 1, 1,
0.2770013, -1.229053, 4.355755, 1, 1, 1, 1, 1,
0.278841, -0.5960519, 3.881201, 1, 1, 1, 1, 1,
0.2799176, 1.403119, 0.3854764, 1, 1, 1, 1, 1,
0.2821009, -1.204383, 1.336847, 1, 1, 1, 1, 1,
0.2872025, 1.648599, -1.786116, 1, 1, 1, 1, 1,
0.2909157, 1.086743, 0.7614728, 1, 1, 1, 1, 1,
0.2956011, -0.9095626, 4.09395, 1, 1, 1, 1, 1,
0.2970423, -0.2730179, 2.670321, 1, 1, 1, 1, 1,
0.2974216, -1.456416, 2.060099, 1, 1, 1, 1, 1,
0.3015571, 0.01355676, 1.835183, 1, 1, 1, 1, 1,
0.3026344, 0.0339839, 0.2672098, 0, 0, 1, 1, 1,
0.3068459, 1.772691, 0.3072442, 1, 0, 0, 1, 1,
0.308836, 0.2102907, 1.466105, 1, 0, 0, 1, 1,
0.310659, -1.070465, 2.55878, 1, 0, 0, 1, 1,
0.3135947, 0.8105152, 0.6364857, 1, 0, 0, 1, 1,
0.3152911, -0.02338389, 1.011537, 1, 0, 0, 1, 1,
0.3163905, -0.3063486, 1.249005, 0, 0, 0, 1, 1,
0.3188817, 0.4776003, 1.129336, 0, 0, 0, 1, 1,
0.3233721, -0.2251402, 1.649921, 0, 0, 0, 1, 1,
0.3243746, -0.05568652, 1.682792, 0, 0, 0, 1, 1,
0.3250366, 0.05843886, 2.120393, 0, 0, 0, 1, 1,
0.3278073, 0.7737454, 0.8116096, 0, 0, 0, 1, 1,
0.3305151, 0.9616725, 0.1766715, 0, 0, 0, 1, 1,
0.332073, 1.865897, 0.3520991, 1, 1, 1, 1, 1,
0.3325507, 0.2516946, 0.1033407, 1, 1, 1, 1, 1,
0.3377174, 1.050659, 0.9826808, 1, 1, 1, 1, 1,
0.3480701, -0.1406001, 2.875173, 1, 1, 1, 1, 1,
0.3552445, 1.535108, 0.2792902, 1, 1, 1, 1, 1,
0.3557218, -0.768597, 3.991348, 1, 1, 1, 1, 1,
0.3580548, -0.3681535, 2.843647, 1, 1, 1, 1, 1,
0.3600363, 0.03499794, 0.5650233, 1, 1, 1, 1, 1,
0.3653615, -1.708427, 2.313866, 1, 1, 1, 1, 1,
0.3704103, -0.0347361, 1.986914, 1, 1, 1, 1, 1,
0.3704453, -1.735354, 3.864748, 1, 1, 1, 1, 1,
0.3712049, 0.8315532, -0.2252982, 1, 1, 1, 1, 1,
0.3728426, 0.4452614, 1.071227, 1, 1, 1, 1, 1,
0.377941, 0.4500396, 0.8004083, 1, 1, 1, 1, 1,
0.3781029, -0.3741637, 3.321969, 1, 1, 1, 1, 1,
0.3790092, -1.0947, 1.315388, 0, 0, 1, 1, 1,
0.3803415, 1.039976, 0.3095573, 1, 0, 0, 1, 1,
0.3822981, 2.003938, 0.5991404, 1, 0, 0, 1, 1,
0.383024, 0.9049932, -0.2507954, 1, 0, 0, 1, 1,
0.4008605, -0.03933843, 1.143287, 1, 0, 0, 1, 1,
0.4012291, 0.6895843, 1.085821, 1, 0, 0, 1, 1,
0.4023371, 0.6028343, 0.5167016, 0, 0, 0, 1, 1,
0.407032, 0.4064372, 1.332107, 0, 0, 0, 1, 1,
0.4097829, -0.1180971, 1.34112, 0, 0, 0, 1, 1,
0.4127638, 0.6077092, 1.43336, 0, 0, 0, 1, 1,
0.4137952, -0.1980429, 1.860134, 0, 0, 0, 1, 1,
0.4148829, -0.2138181, 1.973731, 0, 0, 0, 1, 1,
0.4168611, -0.7753741, 2.191787, 0, 0, 0, 1, 1,
0.4174666, 0.6079367, 1.524335, 1, 1, 1, 1, 1,
0.4182184, 1.167126, 1.159992, 1, 1, 1, 1, 1,
0.4184536, 2.919167, -0.940608, 1, 1, 1, 1, 1,
0.4258881, -0.9700143, 1.365075, 1, 1, 1, 1, 1,
0.4264983, 0.3412787, 1.917384, 1, 1, 1, 1, 1,
0.4286388, -1.137324, 2.470314, 1, 1, 1, 1, 1,
0.4321634, -0.6453508, 2.69575, 1, 1, 1, 1, 1,
0.4330917, -0.5972217, 2.878115, 1, 1, 1, 1, 1,
0.4365853, -0.07638434, 1.211266, 1, 1, 1, 1, 1,
0.4392301, -0.3373843, 1.34785, 1, 1, 1, 1, 1,
0.4393881, 2.10733, 0.2673968, 1, 1, 1, 1, 1,
0.4403465, 1.048036, -0.6633659, 1, 1, 1, 1, 1,
0.4409424, -1.664292, 2.187675, 1, 1, 1, 1, 1,
0.4438747, 0.4863472, 1.139916, 1, 1, 1, 1, 1,
0.4478649, -0.8274264, 4.843815, 1, 1, 1, 1, 1,
0.4501099, 0.297628, 0.3552726, 0, 0, 1, 1, 1,
0.452409, -1.871865, 1.93812, 1, 0, 0, 1, 1,
0.4535118, -0.6138066, 1.349374, 1, 0, 0, 1, 1,
0.4536682, 1.128294, 0.1862927, 1, 0, 0, 1, 1,
0.4540865, 0.4302644, 2.208156, 1, 0, 0, 1, 1,
0.4542909, -0.6998122, 2.335898, 1, 0, 0, 1, 1,
0.4583552, -0.7026396, 1.602072, 0, 0, 0, 1, 1,
0.4614344, 1.452937, 0.2224045, 0, 0, 0, 1, 1,
0.463334, 0.2073176, -0.668415, 0, 0, 0, 1, 1,
0.4667653, -0.6540679, 1.720207, 0, 0, 0, 1, 1,
0.4708215, -0.669988, 3.318055, 0, 0, 0, 1, 1,
0.4712664, -2.864198, 2.649941, 0, 0, 0, 1, 1,
0.4714742, 1.219952, -0.08764629, 0, 0, 0, 1, 1,
0.473772, 0.1330829, 1.332887, 1, 1, 1, 1, 1,
0.4751922, 0.1960787, 0.355592, 1, 1, 1, 1, 1,
0.4756952, 1.021748, -0.6973594, 1, 1, 1, 1, 1,
0.4782111, -1.26696, 2.298419, 1, 1, 1, 1, 1,
0.4828502, -0.4427811, 3.337932, 1, 1, 1, 1, 1,
0.487861, 0.3697687, 1.040719, 1, 1, 1, 1, 1,
0.488565, 0.4251412, 2.490248, 1, 1, 1, 1, 1,
0.4887967, 0.1768267, 0.9077994, 1, 1, 1, 1, 1,
0.4915901, -0.8398753, 0.9622018, 1, 1, 1, 1, 1,
0.4922597, -0.4303542, 2.712992, 1, 1, 1, 1, 1,
0.4922604, -1.038393, 3.074995, 1, 1, 1, 1, 1,
0.4941645, 0.2392421, 2.36215, 1, 1, 1, 1, 1,
0.4944165, 1.27498, -1.191485, 1, 1, 1, 1, 1,
0.4944542, 0.7917337, 0.4807901, 1, 1, 1, 1, 1,
0.4994439, 1.113587, 0.5759448, 1, 1, 1, 1, 1,
0.501644, 1.959294, 1.344994, 0, 0, 1, 1, 1,
0.5042072, 0.9999784, -0.1652002, 1, 0, 0, 1, 1,
0.5104885, 0.1719229, 0.09694587, 1, 0, 0, 1, 1,
0.5128934, -0.03373455, 1.966569, 1, 0, 0, 1, 1,
0.5136393, 0.8568778, 0.5735098, 1, 0, 0, 1, 1,
0.5157311, -1.028061, 1.786089, 1, 0, 0, 1, 1,
0.5159853, 0.26998, 2.310606, 0, 0, 0, 1, 1,
0.5188873, 0.5952198, 0.3004357, 0, 0, 0, 1, 1,
0.5211468, -0.3681312, 0.6570129, 0, 0, 0, 1, 1,
0.5267845, -0.410952, 1.80455, 0, 0, 0, 1, 1,
0.5271673, -0.4253794, 1.142494, 0, 0, 0, 1, 1,
0.5326141, 1.060329, -1.573633, 0, 0, 0, 1, 1,
0.5393798, -2.232417, 3.236987, 0, 0, 0, 1, 1,
0.5401754, -0.2623659, 1.184976, 1, 1, 1, 1, 1,
0.5412318, 0.4124796, 1.955434, 1, 1, 1, 1, 1,
0.5441926, -0.309543, 2.579792, 1, 1, 1, 1, 1,
0.5495682, 0.8015908, 0.409632, 1, 1, 1, 1, 1,
0.5524858, -1.795873, 2.357878, 1, 1, 1, 1, 1,
0.5665116, -0.6687584, 3.264794, 1, 1, 1, 1, 1,
0.5761374, -0.236185, 2.285406, 1, 1, 1, 1, 1,
0.5781611, -0.7236663, 0.8068937, 1, 1, 1, 1, 1,
0.5785553, 0.3311126, 1.158394, 1, 1, 1, 1, 1,
0.5785972, -0.299842, 1.286268, 1, 1, 1, 1, 1,
0.5789844, 1.018246, 0.9137816, 1, 1, 1, 1, 1,
0.5860735, -0.02593505, -0.4982145, 1, 1, 1, 1, 1,
0.5919929, -0.5819214, 0.5799814, 1, 1, 1, 1, 1,
0.595196, -1.27905, 2.700162, 1, 1, 1, 1, 1,
0.5964904, 1.575199, 0.1752279, 1, 1, 1, 1, 1,
0.6012771, 0.7078811, 1.825714, 0, 0, 1, 1, 1,
0.6025266, -0.7960274, 1.918476, 1, 0, 0, 1, 1,
0.6034827, 1.022185, 1.091661, 1, 0, 0, 1, 1,
0.6035894, 1.113822, 0.7924935, 1, 0, 0, 1, 1,
0.6067514, -0.419069, 3.54998, 1, 0, 0, 1, 1,
0.6101391, -0.07737962, 2.370291, 1, 0, 0, 1, 1,
0.6155199, 0.870396, -0.1485693, 0, 0, 0, 1, 1,
0.617093, 1.224551, 1.135956, 0, 0, 0, 1, 1,
0.6199636, -0.7930654, 2.084243, 0, 0, 0, 1, 1,
0.6225735, -0.2742313, 1.505172, 0, 0, 0, 1, 1,
0.6242871, 1.269114, 1.434898, 0, 0, 0, 1, 1,
0.6251728, -1.034808, 2.580349, 0, 0, 0, 1, 1,
0.6287733, -0.9583029, 2.978834, 0, 0, 0, 1, 1,
0.639111, -0.3913096, 4.458469, 1, 1, 1, 1, 1,
0.6400903, 1.024966, -1.638218, 1, 1, 1, 1, 1,
0.6410519, -0.04302868, 3.413781, 1, 1, 1, 1, 1,
0.6411009, -0.3694275, 2.493517, 1, 1, 1, 1, 1,
0.6420418, 0.6856276, 0.5194073, 1, 1, 1, 1, 1,
0.642826, -0.7714034, 3.025506, 1, 1, 1, 1, 1,
0.6441771, -0.6024235, 1.506507, 1, 1, 1, 1, 1,
0.6442094, -0.1555701, 2.785869, 1, 1, 1, 1, 1,
0.6464294, 0.3881108, -0.1832465, 1, 1, 1, 1, 1,
0.6467973, 0.3960947, 0.072645, 1, 1, 1, 1, 1,
0.64818, 0.4540164, 0.9844881, 1, 1, 1, 1, 1,
0.6509131, -0.1922504, 1.940546, 1, 1, 1, 1, 1,
0.6533764, 0.6649227, 1.790052, 1, 1, 1, 1, 1,
0.6542971, -0.8537896, 2.226461, 1, 1, 1, 1, 1,
0.6551127, 0.1864261, 1.907091, 1, 1, 1, 1, 1,
0.6601985, -0.0187767, 2.563337, 0, 0, 1, 1, 1,
0.6628762, 0.9462892, -0.9207489, 1, 0, 0, 1, 1,
0.6631371, -1.548977, 2.996706, 1, 0, 0, 1, 1,
0.6647484, -1.352067, 2.611242, 1, 0, 0, 1, 1,
0.6768903, 0.4784171, 1.706417, 1, 0, 0, 1, 1,
0.6787345, -1.005713, 2.28086, 1, 0, 0, 1, 1,
0.6800777, 0.4922712, 0.09094352, 0, 0, 0, 1, 1,
0.6801307, 0.7807326, 1.022934, 0, 0, 0, 1, 1,
0.6807916, -1.173491, 4.703511, 0, 0, 0, 1, 1,
0.6905277, -0.1484383, 2.789944, 0, 0, 0, 1, 1,
0.6927172, 0.336951, 0.4490005, 0, 0, 0, 1, 1,
0.6938775, -0.8531029, 3.625553, 0, 0, 0, 1, 1,
0.6965702, 1.19226, 1.068748, 0, 0, 0, 1, 1,
0.6989695, -2.035363, 2.979838, 1, 1, 1, 1, 1,
0.7046959, -0.2115528, 3.196481, 1, 1, 1, 1, 1,
0.7090575, 0.9084463, 0.5210911, 1, 1, 1, 1, 1,
0.7189723, -0.2203163, 2.023192, 1, 1, 1, 1, 1,
0.7273109, 0.08270958, 1.666752, 1, 1, 1, 1, 1,
0.7307501, 0.3816294, 0.3141607, 1, 1, 1, 1, 1,
0.7357941, 0.228764, 0.6733926, 1, 1, 1, 1, 1,
0.7429529, 0.4280359, 1.382269, 1, 1, 1, 1, 1,
0.7440168, -0.5068028, 1.848733, 1, 1, 1, 1, 1,
0.7441763, -1.125391, 3.326951, 1, 1, 1, 1, 1,
0.7508215, 1.013331, 0.4777924, 1, 1, 1, 1, 1,
0.7528719, 0.1277693, 0.4817971, 1, 1, 1, 1, 1,
0.7557945, 0.6495382, 1.11028, 1, 1, 1, 1, 1,
0.7595112, -2.347079, 2.701823, 1, 1, 1, 1, 1,
0.7610436, -0.637527, 1.109221, 1, 1, 1, 1, 1,
0.7697479, 0.2942058, -0.5942483, 0, 0, 1, 1, 1,
0.783793, 0.7846554, 1.777858, 1, 0, 0, 1, 1,
0.7857209, -1.037865, 1.753398, 1, 0, 0, 1, 1,
0.7957594, -1.679312, 2.058771, 1, 0, 0, 1, 1,
0.8004066, 0.602806, -0.3449954, 1, 0, 0, 1, 1,
0.8040113, 0.3513303, 0.1783572, 1, 0, 0, 1, 1,
0.8046857, -0.07121653, 0.4961753, 0, 0, 0, 1, 1,
0.8060622, 1.583109, 1.569073, 0, 0, 0, 1, 1,
0.8109161, 0.6168749, 1.230049, 0, 0, 0, 1, 1,
0.8124319, 1.265553, 1.446786, 0, 0, 0, 1, 1,
0.8160341, -0.1608639, 2.505177, 0, 0, 0, 1, 1,
0.8200395, -0.04671778, 3.393808, 0, 0, 0, 1, 1,
0.8328772, -0.948153, 2.398024, 0, 0, 0, 1, 1,
0.8404508, 0.2358602, 2.538815, 1, 1, 1, 1, 1,
0.8491307, 0.1823366, 2.388113, 1, 1, 1, 1, 1,
0.8505518, 2.61709, 0.8259073, 1, 1, 1, 1, 1,
0.8542726, 0.3519854, 2.045439, 1, 1, 1, 1, 1,
0.8603525, 1.650016, 0.8669471, 1, 1, 1, 1, 1,
0.8620877, 0.4954305, 1.715723, 1, 1, 1, 1, 1,
0.8621921, 1.584492, 0.345468, 1, 1, 1, 1, 1,
0.8650377, 1.334462, -0.4885173, 1, 1, 1, 1, 1,
0.870689, -0.7089303, 2.164413, 1, 1, 1, 1, 1,
0.8742697, 0.2635602, 1.751229, 1, 1, 1, 1, 1,
0.8814174, 1.00919, 1.64714, 1, 1, 1, 1, 1,
0.8834794, 0.7809616, 1.258343, 1, 1, 1, 1, 1,
0.8894341, -0.5504984, 3.251694, 1, 1, 1, 1, 1,
0.8948317, -0.1257084, 0.6972789, 1, 1, 1, 1, 1,
0.8969034, 0.8606864, 2.879951, 1, 1, 1, 1, 1,
0.8971049, -0.5706044, 2.527294, 0, 0, 1, 1, 1,
0.8977845, -1.11425, 1.528811, 1, 0, 0, 1, 1,
0.8979399, 0.01841604, 0.2829355, 1, 0, 0, 1, 1,
0.8995327, -0.0199032, 1.16352, 1, 0, 0, 1, 1,
0.8999937, -0.5131794, 1.353911, 1, 0, 0, 1, 1,
0.9054478, -0.3499081, 1.447995, 1, 0, 0, 1, 1,
0.9058909, 0.2514861, 0.6196555, 0, 0, 0, 1, 1,
0.9128812, -1.075562, 3.027428, 0, 0, 0, 1, 1,
0.9225373, 0.5029923, 0.693792, 0, 0, 0, 1, 1,
0.9323055, 0.311196, 2.391952, 0, 0, 0, 1, 1,
0.9326564, 0.06320775, 0.8344566, 0, 0, 0, 1, 1,
0.9346503, 1.997083, -0.2846845, 0, 0, 0, 1, 1,
0.9429956, 0.3935187, 1.690354, 0, 0, 0, 1, 1,
0.9464404, 0.3892131, 1.016107, 1, 1, 1, 1, 1,
0.9496358, 0.2290149, 1.890065, 1, 1, 1, 1, 1,
0.9541152, 0.3345335, -1.309611, 1, 1, 1, 1, 1,
0.9586073, -0.5592477, 1.496581, 1, 1, 1, 1, 1,
0.9724333, -0.2874072, 2.581415, 1, 1, 1, 1, 1,
0.9755258, -0.5457856, 3.655961, 1, 1, 1, 1, 1,
0.9776033, 1.546585, -0.2792545, 1, 1, 1, 1, 1,
0.9860728, 1.143221, 0.2074313, 1, 1, 1, 1, 1,
0.9962947, -0.9684262, 3.612186, 1, 1, 1, 1, 1,
0.9971227, 0.9963141, 0.6362213, 1, 1, 1, 1, 1,
0.9979019, -1.222963, 0.3206522, 1, 1, 1, 1, 1,
1.000679, 0.2654262, -0.2564352, 1, 1, 1, 1, 1,
1.015893, -0.6758612, 2.50259, 1, 1, 1, 1, 1,
1.016058, 0.2256097, 2.418367, 1, 1, 1, 1, 1,
1.019676, 1.195289, 1.377862, 1, 1, 1, 1, 1,
1.02245, 0.7731175, 1.675558, 0, 0, 1, 1, 1,
1.025355, 0.6964547, 2.14064, 1, 0, 0, 1, 1,
1.0269, -0.1700896, 0.3021376, 1, 0, 0, 1, 1,
1.02853, 1.125366, -1.18797, 1, 0, 0, 1, 1,
1.039564, 2.30121, -0.7861238, 1, 0, 0, 1, 1,
1.041863, 0.4454471, 0.4893176, 1, 0, 0, 1, 1,
1.049401, -1.483397, 3.249362, 0, 0, 0, 1, 1,
1.049915, 0.4885914, 1.232619, 0, 0, 0, 1, 1,
1.050159, -0.4513499, 1.198, 0, 0, 0, 1, 1,
1.05224, 0.9091282, 1.96263, 0, 0, 0, 1, 1,
1.056254, -0.3682323, 2.11404, 0, 0, 0, 1, 1,
1.056657, 1.396801, -0.769451, 0, 0, 0, 1, 1,
1.057581, -0.5339152, 2.276242, 0, 0, 0, 1, 1,
1.059856, -0.4884034, 2.799432, 1, 1, 1, 1, 1,
1.062977, -0.3572829, 0.6951043, 1, 1, 1, 1, 1,
1.064346, 1.84121, 1.559441, 1, 1, 1, 1, 1,
1.064416, -0.547966, 0.6968968, 1, 1, 1, 1, 1,
1.06507, -0.4424474, 5.432671, 1, 1, 1, 1, 1,
1.069127, -1.280833, 2.432156, 1, 1, 1, 1, 1,
1.07733, 0.7027737, 1.488949, 1, 1, 1, 1, 1,
1.07812, 0.891355, -0.4920876, 1, 1, 1, 1, 1,
1.081087, -1.305028, 3.104492, 1, 1, 1, 1, 1,
1.085476, -0.9051934, 3.665159, 1, 1, 1, 1, 1,
1.08599, 0.4182087, 0.3135838, 1, 1, 1, 1, 1,
1.09895, -1.217841, 2.216497, 1, 1, 1, 1, 1,
1.100289, -0.05591852, 1.21239, 1, 1, 1, 1, 1,
1.104076, 0.8964195, 0.417122, 1, 1, 1, 1, 1,
1.107494, -0.03546227, 0.9939736, 1, 1, 1, 1, 1,
1.114673, 0.5746331, -0.1532164, 0, 0, 1, 1, 1,
1.12152, -1.048596, 2.529131, 1, 0, 0, 1, 1,
1.143463, -0.3976116, 1.683535, 1, 0, 0, 1, 1,
1.145842, 0.3807271, 1.708709, 1, 0, 0, 1, 1,
1.148959, -2.014528, 3.373121, 1, 0, 0, 1, 1,
1.149676, -0.2977882, -0.4297327, 1, 0, 0, 1, 1,
1.154412, 0.08229635, 1.059368, 0, 0, 0, 1, 1,
1.156083, 0.716389, 0.8844358, 0, 0, 0, 1, 1,
1.157428, 1.148811, -0.3513594, 0, 0, 0, 1, 1,
1.160229, -0.3431779, 1.95746, 0, 0, 0, 1, 1,
1.168948, -1.577865, 1.831415, 0, 0, 0, 1, 1,
1.172588, 1.143737, 0.2382516, 0, 0, 0, 1, 1,
1.178117, 0.7728402, 1.556487, 0, 0, 0, 1, 1,
1.179182, -0.6776695, 1.524033, 1, 1, 1, 1, 1,
1.18434, -0.9617435, 3.327092, 1, 1, 1, 1, 1,
1.190858, -1.863887, 2.618576, 1, 1, 1, 1, 1,
1.212019, 0.3401251, 1.413653, 1, 1, 1, 1, 1,
1.213778, -0.6802012, 1.13722, 1, 1, 1, 1, 1,
1.221192, -1.475162, 1.860471, 1, 1, 1, 1, 1,
1.222477, -1.394845, 1.529865, 1, 1, 1, 1, 1,
1.22375, -0.8585668, 1.372825, 1, 1, 1, 1, 1,
1.228849, 1.37084, 1.907974, 1, 1, 1, 1, 1,
1.232733, 0.9466177, 0.464043, 1, 1, 1, 1, 1,
1.237114, -0.4585546, 1.118747, 1, 1, 1, 1, 1,
1.237667, 0.1253372, 0.5223715, 1, 1, 1, 1, 1,
1.25629, 0.770467, -0.3033004, 1, 1, 1, 1, 1,
1.2631, 0.8971919, 0.7004572, 1, 1, 1, 1, 1,
1.26346, 3.491801, 0.1003087, 1, 1, 1, 1, 1,
1.270399, 0.458921, 0.8367566, 0, 0, 1, 1, 1,
1.270697, -1.084003, 3.762494, 1, 0, 0, 1, 1,
1.27151, 0.3382892, 1.703094, 1, 0, 0, 1, 1,
1.272439, 1.177883, 0.6675732, 1, 0, 0, 1, 1,
1.275221, -0.4499423, 1.381403, 1, 0, 0, 1, 1,
1.279385, -1.089858, 1.792536, 1, 0, 0, 1, 1,
1.293332, -0.393031, 2.087207, 0, 0, 0, 1, 1,
1.298954, -1.261821, 2.918826, 0, 0, 0, 1, 1,
1.316636, 1.136518, 1.519171, 0, 0, 0, 1, 1,
1.326135, -0.4542458, 1.976887, 0, 0, 0, 1, 1,
1.327863, 0.2013599, 1.756857, 0, 0, 0, 1, 1,
1.339125, -0.7752023, 1.70505, 0, 0, 0, 1, 1,
1.340791, -1.894679, 1.293101, 0, 0, 0, 1, 1,
1.343455, 1.230848, 0.2710485, 1, 1, 1, 1, 1,
1.348948, -1.970411, 1.030218, 1, 1, 1, 1, 1,
1.349083, 0.2656851, 0.2905512, 1, 1, 1, 1, 1,
1.349641, -0.260664, 1.005094, 1, 1, 1, 1, 1,
1.367838, -0.5673886, 3.540487, 1, 1, 1, 1, 1,
1.370118, 0.600319, 2.187232, 1, 1, 1, 1, 1,
1.372737, -1.042493, 2.769805, 1, 1, 1, 1, 1,
1.376809, -0.2879196, 2.573542, 1, 1, 1, 1, 1,
1.379486, -0.02569324, 2.082396, 1, 1, 1, 1, 1,
1.391361, -0.6500213, 2.643418, 1, 1, 1, 1, 1,
1.395208, -0.3548394, 3.014204, 1, 1, 1, 1, 1,
1.398379, 0.6266713, 1.090447, 1, 1, 1, 1, 1,
1.402342, -1.01733, 1.373167, 1, 1, 1, 1, 1,
1.404683, 1.16726, -0.8860767, 1, 1, 1, 1, 1,
1.411142, -1.631785, 1.585538, 1, 1, 1, 1, 1,
1.434799, 0.3751499, 0.1740198, 0, 0, 1, 1, 1,
1.441071, -0.9968763, 0.2852736, 1, 0, 0, 1, 1,
1.443981, 0.8418155, 0.5232782, 1, 0, 0, 1, 1,
1.449456, -2.203408, 1.404837, 1, 0, 0, 1, 1,
1.454816, -0.2871874, 1.407919, 1, 0, 0, 1, 1,
1.456592, -0.04460144, 2.090434, 1, 0, 0, 1, 1,
1.461273, 2.116977, 0.9949576, 0, 0, 0, 1, 1,
1.464727, -0.5893098, 1.716581, 0, 0, 0, 1, 1,
1.472086, -0.4883743, 2.642013, 0, 0, 0, 1, 1,
1.479466, 0.2201937, 0.6491531, 0, 0, 0, 1, 1,
1.48032, -0.1253342, 2.609345, 0, 0, 0, 1, 1,
1.487994, 0.8421768, -1.161217, 0, 0, 0, 1, 1,
1.495273, -0.7050813, 1.253395, 0, 0, 0, 1, 1,
1.498275, -0.5864299, 1.885759, 1, 1, 1, 1, 1,
1.514769, 1.792064, 0.1117283, 1, 1, 1, 1, 1,
1.527641, -0.03987376, 0.7249343, 1, 1, 1, 1, 1,
1.529678, 0.5312808, 1.984598, 1, 1, 1, 1, 1,
1.531104, 1.150641, 0.9786833, 1, 1, 1, 1, 1,
1.532051, 0.9143252, 1.206656, 1, 1, 1, 1, 1,
1.534009, 0.2762616, 1.317972, 1, 1, 1, 1, 1,
1.535382, 0.1931867, 0.5148211, 1, 1, 1, 1, 1,
1.54029, 0.395797, 1.44417, 1, 1, 1, 1, 1,
1.576012, 0.6770774, 2.751696, 1, 1, 1, 1, 1,
1.583384, 0.06391244, 2.394255, 1, 1, 1, 1, 1,
1.586196, 1.588466, 1.00615, 1, 1, 1, 1, 1,
1.599211, -1.307109, 1.568049, 1, 1, 1, 1, 1,
1.601664, -0.9969241, 1.802447, 1, 1, 1, 1, 1,
1.623707, -1.334409, 1.714024, 1, 1, 1, 1, 1,
1.631868, -0.5640535, 1.46412, 0, 0, 1, 1, 1,
1.639183, -1.890337, 0.3853228, 1, 0, 0, 1, 1,
1.663976, -0.7550722, 2.543479, 1, 0, 0, 1, 1,
1.676337, 1.425759, 0.4696882, 1, 0, 0, 1, 1,
1.677716, 1.693433, -1.145389, 1, 0, 0, 1, 1,
1.680616, -0.08343624, -0.688879, 1, 0, 0, 1, 1,
1.689707, -0.3051209, 3.811327, 0, 0, 0, 1, 1,
1.69389, -0.844299, 0.5965937, 0, 0, 0, 1, 1,
1.75548, 2.259763, -1.787987, 0, 0, 0, 1, 1,
1.756727, -0.670595, -0.2810277, 0, 0, 0, 1, 1,
1.774559, 1.131745, 1.55348, 0, 0, 0, 1, 1,
1.776401, -0.2376468, 1.17501, 0, 0, 0, 1, 1,
1.802386, 0.6783767, 1.898134, 0, 0, 0, 1, 1,
1.856925, 0.539434, 1.482781, 1, 1, 1, 1, 1,
1.872506, -0.984606, 0.5145508, 1, 1, 1, 1, 1,
1.881042, 0.2185319, 0.2500673, 1, 1, 1, 1, 1,
1.892616, 0.7044566, 1.224443, 1, 1, 1, 1, 1,
1.893155, 1.534844, -0.2834867, 1, 1, 1, 1, 1,
1.961421, -0.1693375, 2.27194, 1, 1, 1, 1, 1,
1.965722, 0.4694572, 1.138422, 1, 1, 1, 1, 1,
1.991674, 0.08606177, 3.377871, 1, 1, 1, 1, 1,
1.993874, -0.6001081, 1.172253, 1, 1, 1, 1, 1,
1.997755, -0.1922501, 1.259888, 1, 1, 1, 1, 1,
2.019506, -1.779743, 1.2883, 1, 1, 1, 1, 1,
2.026827, -1.222857, 1.071315, 1, 1, 1, 1, 1,
2.070546, 0.1350989, 1.503417, 1, 1, 1, 1, 1,
2.098239, 1.085345, 1.527675, 1, 1, 1, 1, 1,
2.110005, 0.2556161, 1.457808, 1, 1, 1, 1, 1,
2.119205, -1.034257, 0.3957724, 0, 0, 1, 1, 1,
2.161553, -0.2497875, 2.342032, 1, 0, 0, 1, 1,
2.175784, 0.9416751, 1.33511, 1, 0, 0, 1, 1,
2.1796, -0.4366735, 1.167485, 1, 0, 0, 1, 1,
2.229174, -0.2601877, 3.296946, 1, 0, 0, 1, 1,
2.22967, 0.09414425, 1.591928, 1, 0, 0, 1, 1,
2.275093, -1.998604, 2.54537, 0, 0, 0, 1, 1,
2.276398, 0.677877, 1.774915, 0, 0, 0, 1, 1,
2.32306, 1.364078, 0.8462875, 0, 0, 0, 1, 1,
2.420722, -0.5786231, 2.265294, 0, 0, 0, 1, 1,
2.431813, -0.1344145, 5.536452, 0, 0, 0, 1, 1,
2.441201, -1.097979, 1.910465, 0, 0, 0, 1, 1,
2.464822, 0.754529, 1.513451, 0, 0, 0, 1, 1,
2.50866, -0.3359026, 1.096943, 1, 1, 1, 1, 1,
2.603161, 1.035529, 0.1171557, 1, 1, 1, 1, 1,
2.628397, -0.6486349, 1.384513, 1, 1, 1, 1, 1,
2.663627, 0.2698444, 1.44254, 1, 1, 1, 1, 1,
2.939964, -1.246171, 0.9865817, 1, 1, 1, 1, 1,
2.960935, 0.9636028, 1.664958, 1, 1, 1, 1, 1,
3.664828, -0.6174817, -0.7446427, 1, 1, 1, 1, 1
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
var radius = 10.01125;
var distance = 35.16409;
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
mvMatrix.translate( -0.2933092, 0.09092236, -0.0004611015 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.16409);
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
