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
-3.047875, 1.110287, -2.332105, 1, 0, 0, 1,
-3.018846, 0.345155, -1.706433, 1, 0.007843138, 0, 1,
-2.96746, -0.6314936, -1.767158, 1, 0.01176471, 0, 1,
-2.65763, 1.050449, -2.314324, 1, 0.01960784, 0, 1,
-2.631162, -0.6137578, -1.308391, 1, 0.02352941, 0, 1,
-2.501493, 0.4636278, -3.330514, 1, 0.03137255, 0, 1,
-2.433171, 0.2586811, -2.132057, 1, 0.03529412, 0, 1,
-2.36373, -0.708035, -1.385948, 1, 0.04313726, 0, 1,
-2.292952, -0.1103439, 0.04629498, 1, 0.04705882, 0, 1,
-2.26516, 0.459055, -2.431141, 1, 0.05490196, 0, 1,
-2.227872, 0.002043211, -1.056822, 1, 0.05882353, 0, 1,
-2.201154, 1.129735, -2.207456, 1, 0.06666667, 0, 1,
-2.178127, -0.9475765, -3.230957, 1, 0.07058824, 0, 1,
-2.167772, 0.4527635, -1.586812, 1, 0.07843138, 0, 1,
-2.109167, -0.0429444, 0.277677, 1, 0.08235294, 0, 1,
-2.092289, 0.01560644, -2.888366, 1, 0.09019608, 0, 1,
-2.089947, -0.06194714, -2.993423, 1, 0.09411765, 0, 1,
-2.048924, -1.362123, -1.428299, 1, 0.1019608, 0, 1,
-2.016222, 2.519378, -1.39341, 1, 0.1098039, 0, 1,
-2.00643, -0.4789712, -0.5807822, 1, 0.1137255, 0, 1,
-1.990182, -0.7752739, -0.6494037, 1, 0.1215686, 0, 1,
-1.984546, 1.512402, -0.1647243, 1, 0.1254902, 0, 1,
-1.970652, -0.2889892, -2.116798, 1, 0.1333333, 0, 1,
-1.959168, 1.005107, -1.499906, 1, 0.1372549, 0, 1,
-1.928304, -0.6824069, -1.835251, 1, 0.145098, 0, 1,
-1.898614, -1.540813, -1.675102, 1, 0.1490196, 0, 1,
-1.894976, -1.335297, -1.32934, 1, 0.1568628, 0, 1,
-1.839401, -0.6108934, -0.3781607, 1, 0.1607843, 0, 1,
-1.838893, -0.09601526, -2.587417, 1, 0.1686275, 0, 1,
-1.798899, 0.136429, -0.5022071, 1, 0.172549, 0, 1,
-1.794167, -0.1287457, -1.599317, 1, 0.1803922, 0, 1,
-1.774743, 2.004794, -2.392293, 1, 0.1843137, 0, 1,
-1.756315, 0.3479772, -1.054103, 1, 0.1921569, 0, 1,
-1.732558, -0.254033, -2.5149, 1, 0.1960784, 0, 1,
-1.714226, -0.4205726, -3.783079, 1, 0.2039216, 0, 1,
-1.712536, 0.2882143, -0.7906399, 1, 0.2117647, 0, 1,
-1.705269, -2.165433, -2.185179, 1, 0.2156863, 0, 1,
-1.701367, 0.5862403, -0.651824, 1, 0.2235294, 0, 1,
-1.690236, 1.770809, -1.955755, 1, 0.227451, 0, 1,
-1.683508, 1.076815, -1.089073, 1, 0.2352941, 0, 1,
-1.67622, 1.086012, -1.458841, 1, 0.2392157, 0, 1,
-1.67178, -0.2992354, -2.004336, 1, 0.2470588, 0, 1,
-1.66342, 1.270293, -1.648388, 1, 0.2509804, 0, 1,
-1.654534, -0.174437, -1.168966, 1, 0.2588235, 0, 1,
-1.653278, 0.1884932, -2.97772, 1, 0.2627451, 0, 1,
-1.647411, 0.9539998, -2.010695, 1, 0.2705882, 0, 1,
-1.638765, -1.30859, -2.073219, 1, 0.2745098, 0, 1,
-1.638635, 0.2520241, -0.5884543, 1, 0.282353, 0, 1,
-1.632916, 0.3966232, -0.5148526, 1, 0.2862745, 0, 1,
-1.607718, 0.7284171, 0.05505524, 1, 0.2941177, 0, 1,
-1.591072, 1.876999, -0.7858501, 1, 0.3019608, 0, 1,
-1.585819, -0.793428, -3.623842, 1, 0.3058824, 0, 1,
-1.584799, -0.1861382, -3.873062, 1, 0.3137255, 0, 1,
-1.577734, -0.00232643, -1.601319, 1, 0.3176471, 0, 1,
-1.560117, -1.638004, -4.120108, 1, 0.3254902, 0, 1,
-1.537393, -0.2574679, -3.393178, 1, 0.3294118, 0, 1,
-1.523865, -0.2924304, -0.5989149, 1, 0.3372549, 0, 1,
-1.514434, 2.114666, -1.513089, 1, 0.3411765, 0, 1,
-1.497383, 1.530146, 0.5930549, 1, 0.3490196, 0, 1,
-1.493595, 0.1550686, -1.234781, 1, 0.3529412, 0, 1,
-1.476466, 1.469074, -1.600487, 1, 0.3607843, 0, 1,
-1.465235, -0.766771, -2.348464, 1, 0.3647059, 0, 1,
-1.457654, 0.04432596, -3.117547, 1, 0.372549, 0, 1,
-1.45714, 1.437573, 0.1241779, 1, 0.3764706, 0, 1,
-1.455125, -0.2218915, -1.058515, 1, 0.3843137, 0, 1,
-1.447459, 0.4632893, 0.4199951, 1, 0.3882353, 0, 1,
-1.441282, 0.4010574, -0.6863046, 1, 0.3960784, 0, 1,
-1.422633, 0.85944, 0.08317716, 1, 0.4039216, 0, 1,
-1.416541, 1.971702, -0.2898465, 1, 0.4078431, 0, 1,
-1.415674, -0.5411969, -1.96585, 1, 0.4156863, 0, 1,
-1.4135, -0.8480945, -2.019987, 1, 0.4196078, 0, 1,
-1.413201, -0.1079804, -1.273137, 1, 0.427451, 0, 1,
-1.412444, 1.167905, -1.350645, 1, 0.4313726, 0, 1,
-1.412408, 2.294696, 0.2806822, 1, 0.4392157, 0, 1,
-1.409975, 0.04130636, -1.730013, 1, 0.4431373, 0, 1,
-1.393009, 1.32672, 0.176121, 1, 0.4509804, 0, 1,
-1.390816, -1.685074, -2.064599, 1, 0.454902, 0, 1,
-1.388843, -1.473341, -1.108601, 1, 0.4627451, 0, 1,
-1.37384, 0.07311792, -0.3967569, 1, 0.4666667, 0, 1,
-1.351238, -2.354708, -2.971609, 1, 0.4745098, 0, 1,
-1.348763, -0.8854906, -2.535402, 1, 0.4784314, 0, 1,
-1.334881, -0.01130339, -0.7936721, 1, 0.4862745, 0, 1,
-1.333273, -1.501645, -1.347261, 1, 0.4901961, 0, 1,
-1.33171, -0.8391401, -0.6302959, 1, 0.4980392, 0, 1,
-1.326122, -0.05250255, -2.826302, 1, 0.5058824, 0, 1,
-1.324798, 0.1365175, -1.045302, 1, 0.509804, 0, 1,
-1.31932, 1.085038, 0.887732, 1, 0.5176471, 0, 1,
-1.311842, -0.4227368, -0.9110579, 1, 0.5215687, 0, 1,
-1.292079, 1.137275, -2.949367, 1, 0.5294118, 0, 1,
-1.291445, 0.8995029, -0.9164322, 1, 0.5333334, 0, 1,
-1.290492, -0.05286772, -2.234668, 1, 0.5411765, 0, 1,
-1.289126, 0.6667897, -1.097216, 1, 0.5450981, 0, 1,
-1.282347, 0.506259, 0.5237182, 1, 0.5529412, 0, 1,
-1.279116, 0.004046437, -2.180788, 1, 0.5568628, 0, 1,
-1.263475, 0.8733342, -2.105163, 1, 0.5647059, 0, 1,
-1.262488, 0.09852296, -3.25831, 1, 0.5686275, 0, 1,
-1.262327, 0.4422933, -1.314544, 1, 0.5764706, 0, 1,
-1.254069, 0.9962484, -0.1649592, 1, 0.5803922, 0, 1,
-1.253221, 1.227509, -1.779612, 1, 0.5882353, 0, 1,
-1.250564, 1.619294, -0.3649885, 1, 0.5921569, 0, 1,
-1.248257, 0.4507658, -1.933006, 1, 0.6, 0, 1,
-1.24331, 0.2224722, 0.3913813, 1, 0.6078432, 0, 1,
-1.241797, -1.340067, -2.49102, 1, 0.6117647, 0, 1,
-1.237699, 1.049473, -0.5120252, 1, 0.6196079, 0, 1,
-1.233776, 0.7726962, -1.407963, 1, 0.6235294, 0, 1,
-1.230524, -1.241464, -2.125486, 1, 0.6313726, 0, 1,
-1.214461, 0.02680007, -1.949279, 1, 0.6352941, 0, 1,
-1.21443, -1.099447, -0.875643, 1, 0.6431373, 0, 1,
-1.212966, -0.1793033, -1.866943, 1, 0.6470588, 0, 1,
-1.20699, -0.2259419, -1.354636, 1, 0.654902, 0, 1,
-1.205693, -0.6343931, -2.345607, 1, 0.6588235, 0, 1,
-1.204499, -0.1084079, -3.034072, 1, 0.6666667, 0, 1,
-1.203647, -0.5081008, -3.154098, 1, 0.6705883, 0, 1,
-1.200287, -0.2055601, -0.08975242, 1, 0.6784314, 0, 1,
-1.199764, 0.1120692, -2.629881, 1, 0.682353, 0, 1,
-1.197654, 0.7560463, -1.853796, 1, 0.6901961, 0, 1,
-1.196173, 0.514258, 0.352589, 1, 0.6941177, 0, 1,
-1.194463, -0.8293098, -1.268501, 1, 0.7019608, 0, 1,
-1.186823, 0.4399036, -1.511934, 1, 0.7098039, 0, 1,
-1.179627, 1.918104, -0.2836664, 1, 0.7137255, 0, 1,
-1.17765, -1.052519, -3.569418, 1, 0.7215686, 0, 1,
-1.176103, 0.7918739, -0.2263961, 1, 0.7254902, 0, 1,
-1.17609, 0.1597185, -1.381386, 1, 0.7333333, 0, 1,
-1.175841, -1.071232, -2.411304, 1, 0.7372549, 0, 1,
-1.174485, -1.053094, -2.915137, 1, 0.7450981, 0, 1,
-1.174057, 1.391904, 1.289549, 1, 0.7490196, 0, 1,
-1.173754, -2.71423, -3.616261, 1, 0.7568628, 0, 1,
-1.160247, 0.1496231, -1.35622, 1, 0.7607843, 0, 1,
-1.160232, 0.139117, -1.063242, 1, 0.7686275, 0, 1,
-1.147277, 0.16311, -1.064546, 1, 0.772549, 0, 1,
-1.145428, -0.3178332, -2.167373, 1, 0.7803922, 0, 1,
-1.132399, -1.556954, -3.185388, 1, 0.7843137, 0, 1,
-1.129922, 0.6464088, -1.443802, 1, 0.7921569, 0, 1,
-1.127399, -0.8822666, -1.349749, 1, 0.7960784, 0, 1,
-1.127308, -0.9990475, -2.436827, 1, 0.8039216, 0, 1,
-1.117384, -0.5782343, -2.47, 1, 0.8117647, 0, 1,
-1.110366, -1.096722, -1.862049, 1, 0.8156863, 0, 1,
-1.10571, 1.328788, 0.3584515, 1, 0.8235294, 0, 1,
-1.104772, -0.4091774, -2.355151, 1, 0.827451, 0, 1,
-1.100693, 0.6835608, -1.031721, 1, 0.8352941, 0, 1,
-1.090214, -2.091506, -2.410108, 1, 0.8392157, 0, 1,
-1.08989, 1.157864, 1.29722, 1, 0.8470588, 0, 1,
-1.088894, 0.2551593, -2.027879, 1, 0.8509804, 0, 1,
-1.087292, 2.094601, -1.486331, 1, 0.8588235, 0, 1,
-1.082803, -1.039881, -3.065546, 1, 0.8627451, 0, 1,
-1.074535, -0.4685134, -2.298587, 1, 0.8705882, 0, 1,
-1.073823, 0.9622371, -0.7802839, 1, 0.8745098, 0, 1,
-1.071163, 0.8458844, -0.3971872, 1, 0.8823529, 0, 1,
-1.063652, -0.112766, -1.075894, 1, 0.8862745, 0, 1,
-1.061512, 0.5977611, -2.5383, 1, 0.8941177, 0, 1,
-1.060968, -1.408217, -3.361497, 1, 0.8980392, 0, 1,
-1.052657, -0.1505512, -0.0009758945, 1, 0.9058824, 0, 1,
-1.050051, 0.9108779, 0.6473763, 1, 0.9137255, 0, 1,
-1.047673, -0.8230555, -1.682233, 1, 0.9176471, 0, 1,
-1.047061, 1.834384, -1.176994, 1, 0.9254902, 0, 1,
-1.045761, 0.3371087, -1.190272, 1, 0.9294118, 0, 1,
-1.042787, 1.031907, -0.3652783, 1, 0.9372549, 0, 1,
-1.034974, -0.3910574, -2.538954, 1, 0.9411765, 0, 1,
-1.034446, 0.5451648, -1.517837, 1, 0.9490196, 0, 1,
-1.027721, 1.649302, 1.651355, 1, 0.9529412, 0, 1,
-1.02685, -0.5856492, -2.572795, 1, 0.9607843, 0, 1,
-1.016579, -0.402812, -1.515872, 1, 0.9647059, 0, 1,
-1.01604, 0.6460719, -0.8750095, 1, 0.972549, 0, 1,
-1.015258, 1.619205, 0.5432951, 1, 0.9764706, 0, 1,
-1.008764, 1.652653, 0.1055283, 1, 0.9843137, 0, 1,
-1.004429, 0.3841617, -0.7122517, 1, 0.9882353, 0, 1,
-1.003876, 0.287119, -1.188499, 1, 0.9960784, 0, 1,
-1.000345, 1.991934, -0.9439421, 0.9960784, 1, 0, 1,
-0.9936405, -0.8158506, -2.377517, 0.9921569, 1, 0, 1,
-0.9933514, 1.549517, -2.110577, 0.9843137, 1, 0, 1,
-0.9893867, -2.310615, -3.419961, 0.9803922, 1, 0, 1,
-0.9879529, -0.628336, -0.050164, 0.972549, 1, 0, 1,
-0.9873776, 0.7973203, 0.1304801, 0.9686275, 1, 0, 1,
-0.984561, 0.06708063, 0.2412926, 0.9607843, 1, 0, 1,
-0.9827432, -0.1250818, -1.724084, 0.9568627, 1, 0, 1,
-0.9749875, -0.1243594, -2.021631, 0.9490196, 1, 0, 1,
-0.9749146, -1.007789, -3.113886, 0.945098, 1, 0, 1,
-0.9739954, 2.34126, 1.01455, 0.9372549, 1, 0, 1,
-0.9725137, 0.250138, -1.877861, 0.9333333, 1, 0, 1,
-0.9693713, 0.819018, -2.372501, 0.9254902, 1, 0, 1,
-0.9610983, 0.4383192, -1.870451, 0.9215686, 1, 0, 1,
-0.9595214, -0.8288645, -3.147507, 0.9137255, 1, 0, 1,
-0.9532155, -0.9435882, -2.671965, 0.9098039, 1, 0, 1,
-0.9447805, -1.540104, -3.634172, 0.9019608, 1, 0, 1,
-0.942945, 0.6455014, -1.149266, 0.8941177, 1, 0, 1,
-0.9424326, 0.5189439, -0.7860259, 0.8901961, 1, 0, 1,
-0.9355741, 1.234017, 0.2837378, 0.8823529, 1, 0, 1,
-0.926482, 0.4372616, -1.138431, 0.8784314, 1, 0, 1,
-0.9243948, 1.10784, -0.4312168, 0.8705882, 1, 0, 1,
-0.9241282, -0.8691806, -3.065548, 0.8666667, 1, 0, 1,
-0.919996, 0.7628611, -1.198059, 0.8588235, 1, 0, 1,
-0.9181643, -0.299492, -2.101496, 0.854902, 1, 0, 1,
-0.9167604, 0.3861564, -2.135814, 0.8470588, 1, 0, 1,
-0.9139773, 0.01286016, -1.490712, 0.8431373, 1, 0, 1,
-0.907334, 1.085731, -1.412747, 0.8352941, 1, 0, 1,
-0.9065723, 1.745137, -0.2583721, 0.8313726, 1, 0, 1,
-0.8955726, -0.8364468, -3.229822, 0.8235294, 1, 0, 1,
-0.8890569, -0.3476607, -3.249418, 0.8196079, 1, 0, 1,
-0.8859499, -2.060149, -1.61797, 0.8117647, 1, 0, 1,
-0.8855782, 0.3330221, -0.6475164, 0.8078431, 1, 0, 1,
-0.8853163, 0.732857, -1.716655, 0.8, 1, 0, 1,
-0.8852485, -0.5953602, -2.483047, 0.7921569, 1, 0, 1,
-0.8817501, 0.5769057, 0.7406146, 0.7882353, 1, 0, 1,
-0.8729014, 0.6946726, 0.01307094, 0.7803922, 1, 0, 1,
-0.8622561, -0.9919679, -1.585347, 0.7764706, 1, 0, 1,
-0.8596057, 1.018685, 0.9584412, 0.7686275, 1, 0, 1,
-0.8578051, -0.1951449, -1.729078, 0.7647059, 1, 0, 1,
-0.8551905, 1.462283, -0.9038169, 0.7568628, 1, 0, 1,
-0.8524842, 0.0949031, -2.954223, 0.7529412, 1, 0, 1,
-0.8514131, -0.8496786, -2.484808, 0.7450981, 1, 0, 1,
-0.8399847, -0.5402135, -1.103927, 0.7411765, 1, 0, 1,
-0.8364987, -0.4623376, -1.33435, 0.7333333, 1, 0, 1,
-0.8355219, 0.5519834, -0.8224475, 0.7294118, 1, 0, 1,
-0.8332811, -0.4818217, -2.027626, 0.7215686, 1, 0, 1,
-0.8331282, 1.072274, -1.06748, 0.7176471, 1, 0, 1,
-0.82833, -0.4264799, -3.044154, 0.7098039, 1, 0, 1,
-0.8251147, 0.3304058, -2.101242, 0.7058824, 1, 0, 1,
-0.8198931, -2.211751, -1.490663, 0.6980392, 1, 0, 1,
-0.8144438, 0.7838463, -0.987444, 0.6901961, 1, 0, 1,
-0.8093261, 0.4318959, -1.281843, 0.6862745, 1, 0, 1,
-0.8089436, 0.3237409, -2.565884, 0.6784314, 1, 0, 1,
-0.8004087, -0.4566283, -2.801737, 0.6745098, 1, 0, 1,
-0.797424, -0.5630927, -3.106457, 0.6666667, 1, 0, 1,
-0.7965317, -1.122293, -2.159361, 0.6627451, 1, 0, 1,
-0.7911887, 1.464061, 1.042534, 0.654902, 1, 0, 1,
-0.7877991, -0.1378954, -1.458475, 0.6509804, 1, 0, 1,
-0.7834379, 0.9770544, -0.3526329, 0.6431373, 1, 0, 1,
-0.7755747, -1.010589, -1.563276, 0.6392157, 1, 0, 1,
-0.7732871, -0.1418162, -2.27107, 0.6313726, 1, 0, 1,
-0.7716148, 0.4699374, 0.6804481, 0.627451, 1, 0, 1,
-0.7667005, 1.429057, -0.1557371, 0.6196079, 1, 0, 1,
-0.757094, 0.3101153, 0.6711337, 0.6156863, 1, 0, 1,
-0.7567218, -0.4578622, -1.012527, 0.6078432, 1, 0, 1,
-0.7560757, 0.5771472, 0.08853476, 0.6039216, 1, 0, 1,
-0.7476674, -0.2835734, -3.538139, 0.5960785, 1, 0, 1,
-0.7449642, 0.979686, -1.131953, 0.5882353, 1, 0, 1,
-0.7439306, -0.4238654, -3.043797, 0.5843138, 1, 0, 1,
-0.7430435, 1.763405, -0.218897, 0.5764706, 1, 0, 1,
-0.7424878, 0.5281281, -0.5774856, 0.572549, 1, 0, 1,
-0.7295577, -1.366092, -0.5384337, 0.5647059, 1, 0, 1,
-0.7252049, 0.8901622, -0.1004486, 0.5607843, 1, 0, 1,
-0.7247385, -1.585479, -3.412716, 0.5529412, 1, 0, 1,
-0.7134145, 0.9827823, -1.498013, 0.5490196, 1, 0, 1,
-0.7124267, -0.2517618, -1.414741, 0.5411765, 1, 0, 1,
-0.7118853, -2.352376, -2.89694, 0.5372549, 1, 0, 1,
-0.711532, 0.0687542, -1.547371, 0.5294118, 1, 0, 1,
-0.7109739, 0.3785934, 0.953233, 0.5254902, 1, 0, 1,
-0.7060786, -0.242398, -3.388825, 0.5176471, 1, 0, 1,
-0.6999733, -0.7808664, -1.886672, 0.5137255, 1, 0, 1,
-0.6986301, 0.02802438, -2.62864, 0.5058824, 1, 0, 1,
-0.6941043, 0.1746978, -0.4332973, 0.5019608, 1, 0, 1,
-0.6850301, -0.3925799, -1.2295, 0.4941176, 1, 0, 1,
-0.6836861, 0.1453934, -0.7958894, 0.4862745, 1, 0, 1,
-0.6831037, 0.2159316, -1.35672, 0.4823529, 1, 0, 1,
-0.6824593, -1.087651, -1.857443, 0.4745098, 1, 0, 1,
-0.6799429, 0.9646471, -1.431498, 0.4705882, 1, 0, 1,
-0.675527, -2.275098, -3.270042, 0.4627451, 1, 0, 1,
-0.6713076, -0.5300443, -0.6032571, 0.4588235, 1, 0, 1,
-0.6711484, -0.5072926, -3.969557, 0.4509804, 1, 0, 1,
-0.6710262, 1.352975, 0.01509183, 0.4470588, 1, 0, 1,
-0.6688396, 0.7002098, -2.481536, 0.4392157, 1, 0, 1,
-0.666631, 0.5765836, -1.513569, 0.4352941, 1, 0, 1,
-0.6657285, 0.1062549, -1.904825, 0.427451, 1, 0, 1,
-0.6643552, 0.6735286, -1.913635, 0.4235294, 1, 0, 1,
-0.6595804, 0.07001261, -1.358346, 0.4156863, 1, 0, 1,
-0.6582091, 0.5569935, -0.813283, 0.4117647, 1, 0, 1,
-0.6575208, 1.472202, -0.739855, 0.4039216, 1, 0, 1,
-0.6524469, -0.7560772, -2.867837, 0.3960784, 1, 0, 1,
-0.6464515, -1.150881, -0.7281193, 0.3921569, 1, 0, 1,
-0.6446499, 0.7884569, -0.3505447, 0.3843137, 1, 0, 1,
-0.6434016, -0.145658, -2.034296, 0.3803922, 1, 0, 1,
-0.6415214, 0.02245426, -0.2102364, 0.372549, 1, 0, 1,
-0.6399486, 0.1141522, -0.3199023, 0.3686275, 1, 0, 1,
-0.6375188, -1.119436, -3.122793, 0.3607843, 1, 0, 1,
-0.6364924, -1.12905, -1.546287, 0.3568628, 1, 0, 1,
-0.6309567, -0.9010616, -3.407666, 0.3490196, 1, 0, 1,
-0.6292985, 0.3225408, 0.4143677, 0.345098, 1, 0, 1,
-0.6191213, -0.506129, -3.256646, 0.3372549, 1, 0, 1,
-0.614869, 1.132259, 0.6651391, 0.3333333, 1, 0, 1,
-0.6119724, 0.6095818, 1.010372, 0.3254902, 1, 0, 1,
-0.6106406, -2.140047, -3.025729, 0.3215686, 1, 0, 1,
-0.6101096, 1.686666, -0.7862091, 0.3137255, 1, 0, 1,
-0.608408, 0.380705, -0.09987799, 0.3098039, 1, 0, 1,
-0.6004469, -1.579816, -2.578141, 0.3019608, 1, 0, 1,
-0.5989547, -0.4727794, -0.3817228, 0.2941177, 1, 0, 1,
-0.5964435, 0.9149426, -0.6145143, 0.2901961, 1, 0, 1,
-0.5961572, -1.425279, -2.545125, 0.282353, 1, 0, 1,
-0.5912029, 1.256544, -0.4189604, 0.2784314, 1, 0, 1,
-0.5856116, -0.4907799, -2.573399, 0.2705882, 1, 0, 1,
-0.5853794, 1.426543, 0.138162, 0.2666667, 1, 0, 1,
-0.5847819, 0.3485142, 0.6825068, 0.2588235, 1, 0, 1,
-0.5722012, 0.1636923, -1.387016, 0.254902, 1, 0, 1,
-0.5710984, 0.4737976, -0.1887832, 0.2470588, 1, 0, 1,
-0.5690125, -0.9668377, -3.350988, 0.2431373, 1, 0, 1,
-0.5687522, 0.6944749, -1.368732, 0.2352941, 1, 0, 1,
-0.5588778, 1.413928, 1.112421, 0.2313726, 1, 0, 1,
-0.5556624, 2.311558, -0.3437625, 0.2235294, 1, 0, 1,
-0.5510003, -0.5203871, -3.521091, 0.2196078, 1, 0, 1,
-0.5444001, -0.2653631, -1.101418, 0.2117647, 1, 0, 1,
-0.5430786, -0.6696779, -1.912093, 0.2078431, 1, 0, 1,
-0.5412494, 0.7764027, -0.4500556, 0.2, 1, 0, 1,
-0.5399019, -0.6939564, -0.343147, 0.1921569, 1, 0, 1,
-0.5361943, -1.204426, -2.470433, 0.1882353, 1, 0, 1,
-0.5340994, -0.5461112, -2.278143, 0.1803922, 1, 0, 1,
-0.5321214, -1.045714, -2.688113, 0.1764706, 1, 0, 1,
-0.531527, 1.452758, -0.9824833, 0.1686275, 1, 0, 1,
-0.5299344, -0.6681743, -1.806037, 0.1647059, 1, 0, 1,
-0.5273998, -0.2958774, -1.199123, 0.1568628, 1, 0, 1,
-0.526875, -1.04387, -2.520842, 0.1529412, 1, 0, 1,
-0.5234748, -0.08925276, -2.422238, 0.145098, 1, 0, 1,
-0.518984, -0.7184671, -3.484582, 0.1411765, 1, 0, 1,
-0.5160325, 0.1300341, -0.9221501, 0.1333333, 1, 0, 1,
-0.5126476, 1.081638, -0.05578139, 0.1294118, 1, 0, 1,
-0.511915, 1.495897, -1.582519, 0.1215686, 1, 0, 1,
-0.5097107, 1.642087, -0.1298143, 0.1176471, 1, 0, 1,
-0.5074495, -0.6044065, -4.131558, 0.1098039, 1, 0, 1,
-0.5043183, 1.765841, -1.382917, 0.1058824, 1, 0, 1,
-0.5013045, 1.478154, 0.00282709, 0.09803922, 1, 0, 1,
-0.4950529, -1.134544, -1.358502, 0.09019608, 1, 0, 1,
-0.4925452, -0.4945495, -3.645072, 0.08627451, 1, 0, 1,
-0.4916441, 0.818748, -0.8273201, 0.07843138, 1, 0, 1,
-0.489383, 0.2195197, -1.863904, 0.07450981, 1, 0, 1,
-0.4825315, -1.41467, -3.826375, 0.06666667, 1, 0, 1,
-0.4817303, 1.19246, 0.1716, 0.0627451, 1, 0, 1,
-0.4789108, 0.9386807, 0.3487315, 0.05490196, 1, 0, 1,
-0.4766764, 0.2751315, 0.1822648, 0.05098039, 1, 0, 1,
-0.4748339, 0.6451157, -1.664519, 0.04313726, 1, 0, 1,
-0.4728153, 1.217443, -0.6168792, 0.03921569, 1, 0, 1,
-0.472258, -0.3808061, -1.890387, 0.03137255, 1, 0, 1,
-0.4676396, 0.4676617, -1.745467, 0.02745098, 1, 0, 1,
-0.463478, 2.514797, 1.051096, 0.01960784, 1, 0, 1,
-0.4579804, 2.279332, 0.4062892, 0.01568628, 1, 0, 1,
-0.4576783, 1.149008, -0.8820956, 0.007843138, 1, 0, 1,
-0.4573468, -1.064754, -2.755331, 0.003921569, 1, 0, 1,
-0.4556916, 0.1786512, -1.246736, 0, 1, 0.003921569, 1,
-0.4532, -0.04125279, -1.704534, 0, 1, 0.01176471, 1,
-0.4517261, -0.5901251, -3.836005, 0, 1, 0.01568628, 1,
-0.4516041, 0.00639128, -0.199007, 0, 1, 0.02352941, 1,
-0.4473668, -1.020896, -1.291728, 0, 1, 0.02745098, 1,
-0.4369197, -1.419196, -3.828945, 0, 1, 0.03529412, 1,
-0.4340107, 0.3794158, -1.90729, 0, 1, 0.03921569, 1,
-0.4331367, 1.431059, -0.3995991, 0, 1, 0.04705882, 1,
-0.4273304, -2.364026, -4.946056, 0, 1, 0.05098039, 1,
-0.4273212, 1.206594, -1.132038, 0, 1, 0.05882353, 1,
-0.4263779, -0.02721138, -1.770878, 0, 1, 0.0627451, 1,
-0.426145, 0.4747933, -0.943523, 0, 1, 0.07058824, 1,
-0.4253807, -0.6721447, -2.301869, 0, 1, 0.07450981, 1,
-0.4233541, 1.849045, -0.2029705, 0, 1, 0.08235294, 1,
-0.4214142, -0.4455024, -2.02795, 0, 1, 0.08627451, 1,
-0.4202644, -0.7271293, -4.950144, 0, 1, 0.09411765, 1,
-0.4199069, -0.4062082, -4.598721, 0, 1, 0.1019608, 1,
-0.4190724, -0.2382312, -2.293521, 0, 1, 0.1058824, 1,
-0.405838, -0.7157537, -3.16432, 0, 1, 0.1137255, 1,
-0.4054061, -0.01835369, -1.336482, 0, 1, 0.1176471, 1,
-0.4025234, -0.7230232, -3.417017, 0, 1, 0.1254902, 1,
-0.3978988, -1.928044, -1.087795, 0, 1, 0.1294118, 1,
-0.3978011, -0.9958057, -3.029375, 0, 1, 0.1372549, 1,
-0.3963361, -0.7010661, -1.972023, 0, 1, 0.1411765, 1,
-0.3937001, -1.352956, -2.577736, 0, 1, 0.1490196, 1,
-0.3921316, 1.353725, -0.4924591, 0, 1, 0.1529412, 1,
-0.3876175, -1.697544, -4.329215, 0, 1, 0.1607843, 1,
-0.3870752, -1.278013, -2.325911, 0, 1, 0.1647059, 1,
-0.3825276, 0.09207257, -0.366622, 0, 1, 0.172549, 1,
-0.3816063, -1.637502, -3.430071, 0, 1, 0.1764706, 1,
-0.381488, -0.09120779, -2.686732, 0, 1, 0.1843137, 1,
-0.3811271, -0.1919166, -1.354872, 0, 1, 0.1882353, 1,
-0.3807931, -0.5102078, -1.893454, 0, 1, 0.1960784, 1,
-0.3806362, 1.000288, -0.3093928, 0, 1, 0.2039216, 1,
-0.380506, 0.5118899, 1.263333, 0, 1, 0.2078431, 1,
-0.377458, -1.096929, -3.840214, 0, 1, 0.2156863, 1,
-0.3758343, -0.9998172, -4.075867, 0, 1, 0.2196078, 1,
-0.3754966, -0.3430694, -3.393068, 0, 1, 0.227451, 1,
-0.3681695, -0.1148867, -1.314187, 0, 1, 0.2313726, 1,
-0.3665738, 1.661292, -0.7845301, 0, 1, 0.2392157, 1,
-0.3658659, -0.157698, -1.375562, 0, 1, 0.2431373, 1,
-0.3651628, 2.070784, 0.4239205, 0, 1, 0.2509804, 1,
-0.3631365, -0.9928642, -3.129082, 0, 1, 0.254902, 1,
-0.3621959, 0.1058202, -0.6295139, 0, 1, 0.2627451, 1,
-0.3606445, 0.00212426, -0.8563356, 0, 1, 0.2666667, 1,
-0.3597772, -1.234892, -1.861053, 0, 1, 0.2745098, 1,
-0.3521623, 1.118629, -0.2648224, 0, 1, 0.2784314, 1,
-0.3507942, 0.6038175, -0.6307384, 0, 1, 0.2862745, 1,
-0.3500778, -0.5679492, -1.679157, 0, 1, 0.2901961, 1,
-0.3477544, -1.199981, -3.344581, 0, 1, 0.2980392, 1,
-0.3447779, -1.674932, -3.686922, 0, 1, 0.3058824, 1,
-0.3423527, 0.08077456, -2.638518, 0, 1, 0.3098039, 1,
-0.3421419, 0.9326966, -1.207991, 0, 1, 0.3176471, 1,
-0.339108, -0.9070986, -0.2861473, 0, 1, 0.3215686, 1,
-0.3373346, -1.350168, -3.539237, 0, 1, 0.3294118, 1,
-0.3368171, 1.09557, -0.6199273, 0, 1, 0.3333333, 1,
-0.3352557, -0.4207699, -2.410376, 0, 1, 0.3411765, 1,
-0.333335, 1.012362, 1.532918, 0, 1, 0.345098, 1,
-0.3303086, -0.6309446, -2.725837, 0, 1, 0.3529412, 1,
-0.3293231, 2.123381, 1.585922, 0, 1, 0.3568628, 1,
-0.3288443, 1.372508, 0.566291, 0, 1, 0.3647059, 1,
-0.3263279, 1.930337, 1.700471, 0, 1, 0.3686275, 1,
-0.3190854, -0.02896607, -1.818461, 0, 1, 0.3764706, 1,
-0.3185649, 0.7467104, -1.413432, 0, 1, 0.3803922, 1,
-0.3081066, -0.40298, -2.887074, 0, 1, 0.3882353, 1,
-0.303585, -0.6779575, -1.257772, 0, 1, 0.3921569, 1,
-0.3003147, -0.5789282, -4.651795, 0, 1, 0.4, 1,
-0.3002777, 0.2522884, -1.171192, 0, 1, 0.4078431, 1,
-0.2987352, 1.306336, 0.04414419, 0, 1, 0.4117647, 1,
-0.2957683, -1.72203, -3.031699, 0, 1, 0.4196078, 1,
-0.2949342, -1.682309, -2.178275, 0, 1, 0.4235294, 1,
-0.2939895, 0.7003928, 0.4457949, 0, 1, 0.4313726, 1,
-0.2846948, -0.5131347, -4.203166, 0, 1, 0.4352941, 1,
-0.278622, 0.1437689, -1.418974, 0, 1, 0.4431373, 1,
-0.2742656, -1.758135, -3.327067, 0, 1, 0.4470588, 1,
-0.2720642, -0.6413616, -2.289842, 0, 1, 0.454902, 1,
-0.2716334, 0.04707452, -2.216798, 0, 1, 0.4588235, 1,
-0.270462, 0.7795596, -1.349291, 0, 1, 0.4666667, 1,
-0.2698526, 0.3991735, -0.3888627, 0, 1, 0.4705882, 1,
-0.2683033, -0.4791404, -3.639719, 0, 1, 0.4784314, 1,
-0.2676614, 1.53813, 2.583102, 0, 1, 0.4823529, 1,
-0.2670163, -0.08633985, -2.715312, 0, 1, 0.4901961, 1,
-0.2642764, -0.418613, -3.072353, 0, 1, 0.4941176, 1,
-0.2617176, 0.9338689, -1.432757, 0, 1, 0.5019608, 1,
-0.2615139, 1.006799, -1.614229, 0, 1, 0.509804, 1,
-0.2604084, 1.645305, -1.099057, 0, 1, 0.5137255, 1,
-0.2594241, -0.6487861, -1.905227, 0, 1, 0.5215687, 1,
-0.2583459, -1.046699, -3.912122, 0, 1, 0.5254902, 1,
-0.2575307, -0.586628, -1.677946, 0, 1, 0.5333334, 1,
-0.2529362, -2.024609, -2.792172, 0, 1, 0.5372549, 1,
-0.2524384, -0.4792278, -2.929813, 0, 1, 0.5450981, 1,
-0.2510096, 1.277564, -1.042505, 0, 1, 0.5490196, 1,
-0.2508213, 1.852288, -0.3851545, 0, 1, 0.5568628, 1,
-0.2490569, 0.2839692, 0.7628927, 0, 1, 0.5607843, 1,
-0.2445353, -0.613641, -1.701099, 0, 1, 0.5686275, 1,
-0.2437894, 1.46413, 0.9301731, 0, 1, 0.572549, 1,
-0.2382542, -1.290341, -3.541499, 0, 1, 0.5803922, 1,
-0.2376392, 0.655268, -0.9691442, 0, 1, 0.5843138, 1,
-0.2367057, 0.7617772, -0.9281493, 0, 1, 0.5921569, 1,
-0.2355312, -1.247098, -2.625546, 0, 1, 0.5960785, 1,
-0.2321761, -2.042828, -2.535634, 0, 1, 0.6039216, 1,
-0.2289669, -0.2767673, -1.597309, 0, 1, 0.6117647, 1,
-0.2279019, 0.2226078, -1.916264, 0, 1, 0.6156863, 1,
-0.2223427, -0.4482425, -3.907644, 0, 1, 0.6235294, 1,
-0.2219656, 0.276191, -1.190087, 0, 1, 0.627451, 1,
-0.22167, 0.5977564, 0.5869298, 0, 1, 0.6352941, 1,
-0.2210391, 1.08135, 1.783832, 0, 1, 0.6392157, 1,
-0.2165266, 0.3575526, 1.495304, 0, 1, 0.6470588, 1,
-0.2108555, -0.04946104, -3.273729, 0, 1, 0.6509804, 1,
-0.2090964, 0.6738878, -1.355644, 0, 1, 0.6588235, 1,
-0.2067823, -0.4816416, -1.742732, 0, 1, 0.6627451, 1,
-0.2057838, -2.543326, -3.035565, 0, 1, 0.6705883, 1,
-0.205641, 0.10967, -1.423618, 0, 1, 0.6745098, 1,
-0.2048651, 1.028517, 0.5742263, 0, 1, 0.682353, 1,
-0.2040824, 1.113669, -0.1757458, 0, 1, 0.6862745, 1,
-0.2033748, 0.4123943, 0.646727, 0, 1, 0.6941177, 1,
-0.2032133, 0.2206533, -0.5839448, 0, 1, 0.7019608, 1,
-0.2030702, -0.3714042, -1.768093, 0, 1, 0.7058824, 1,
-0.2011994, -0.3871813, -2.536726, 0, 1, 0.7137255, 1,
-0.1968921, -0.4417502, -3.198571, 0, 1, 0.7176471, 1,
-0.1965562, 1.222783, -2.863629, 0, 1, 0.7254902, 1,
-0.1924566, -0.5561129, -3.540273, 0, 1, 0.7294118, 1,
-0.1866821, 0.8389824, -1.932985, 0, 1, 0.7372549, 1,
-0.1849553, 0.01424166, -0.9534461, 0, 1, 0.7411765, 1,
-0.1832459, 1.477416, -0.3620393, 0, 1, 0.7490196, 1,
-0.181175, -0.2021612, -0.817079, 0, 1, 0.7529412, 1,
-0.1791999, -1.571043, -1.964034, 0, 1, 0.7607843, 1,
-0.1774887, 1.010473, 0.2360153, 0, 1, 0.7647059, 1,
-0.1730527, -1.663887, -1.922486, 0, 1, 0.772549, 1,
-0.1717255, 0.945136, -0.5328379, 0, 1, 0.7764706, 1,
-0.1686719, -0.02263833, -0.7958523, 0, 1, 0.7843137, 1,
-0.1681397, 2.371705, -1.456393, 0, 1, 0.7882353, 1,
-0.1645538, -0.4979966, -3.43271, 0, 1, 0.7960784, 1,
-0.1633077, 0.3085414, -0.1455855, 0, 1, 0.8039216, 1,
-0.1594558, 0.3282917, -0.8154694, 0, 1, 0.8078431, 1,
-0.156379, 0.2234273, -1.453772, 0, 1, 0.8156863, 1,
-0.156142, -2.275157, -3.133192, 0, 1, 0.8196079, 1,
-0.1480198, -1.050485, -3.978616, 0, 1, 0.827451, 1,
-0.1465323, 0.2689178, -1.689028, 0, 1, 0.8313726, 1,
-0.1410587, -0.6641309, -2.770476, 0, 1, 0.8392157, 1,
-0.1375679, 0.3618572, -1.079688, 0, 1, 0.8431373, 1,
-0.1372992, -0.3547514, -0.5269619, 0, 1, 0.8509804, 1,
-0.1348237, -0.02986242, -2.253102, 0, 1, 0.854902, 1,
-0.1323211, -0.8060451, -3.123971, 0, 1, 0.8627451, 1,
-0.1304493, -0.9644865, -2.722851, 0, 1, 0.8666667, 1,
-0.1302802, -1.220558, -3.460421, 0, 1, 0.8745098, 1,
-0.1277588, -0.0621842, -2.756428, 0, 1, 0.8784314, 1,
-0.1251795, 2.086082, -1.439043, 0, 1, 0.8862745, 1,
-0.1194903, 0.257322, -0.9935961, 0, 1, 0.8901961, 1,
-0.1187618, -0.3938136, -2.406281, 0, 1, 0.8980392, 1,
-0.117595, -0.1749658, -2.144877, 0, 1, 0.9058824, 1,
-0.1151249, 0.4895867, 0.1087531, 0, 1, 0.9098039, 1,
-0.1131757, -2.070965, -2.352257, 0, 1, 0.9176471, 1,
-0.112975, -0.1292731, -4.671161, 0, 1, 0.9215686, 1,
-0.1121172, -0.4500032, -4.41955, 0, 1, 0.9294118, 1,
-0.1085139, 0.1160756, -0.09879945, 0, 1, 0.9333333, 1,
-0.1056702, 0.2266888, -0.4889756, 0, 1, 0.9411765, 1,
-0.1004829, 0.4589235, 0.2972217, 0, 1, 0.945098, 1,
-0.09583697, 0.212832, -1.93726, 0, 1, 0.9529412, 1,
-0.0937702, -1.870704, -3.275569, 0, 1, 0.9568627, 1,
-0.08930736, 1.284834, -2.232839, 0, 1, 0.9647059, 1,
-0.08559498, -1.132262, -2.45112, 0, 1, 0.9686275, 1,
-0.08340728, -0.3772666, -4.346985, 0, 1, 0.9764706, 1,
-0.08320406, -1.041763, -1.231936, 0, 1, 0.9803922, 1,
-0.08292091, 0.6304263, -0.18105, 0, 1, 0.9882353, 1,
-0.08028411, 0.1954942, -0.0662981, 0, 1, 0.9921569, 1,
-0.0724971, -0.9928472, -2.482498, 0, 1, 1, 1,
-0.07186095, 1.149085, -1.868465, 0, 0.9921569, 1, 1,
-0.07102186, -0.9057211, -2.297471, 0, 0.9882353, 1, 1,
-0.07087188, 1.303888, 0.2921864, 0, 0.9803922, 1, 1,
-0.06990672, 1.280574, 0.39662, 0, 0.9764706, 1, 1,
-0.06699359, -0.4336735, -3.763579, 0, 0.9686275, 1, 1,
-0.06434525, -0.6545177, -3.35304, 0, 0.9647059, 1, 1,
-0.06293935, 0.1956876, 1.328361, 0, 0.9568627, 1, 1,
-0.06220258, 0.7951761, -1.080938, 0, 0.9529412, 1, 1,
-0.06138092, 1.077664, 0.05581953, 0, 0.945098, 1, 1,
-0.05738525, -1.378397, -2.981954, 0, 0.9411765, 1, 1,
-0.05605439, -0.3175369, -2.430351, 0, 0.9333333, 1, 1,
-0.04852314, 0.3437898, -2.069992, 0, 0.9294118, 1, 1,
-0.04422009, 0.6775588, -0.1805754, 0, 0.9215686, 1, 1,
-0.04359153, 0.3907453, 0.7541384, 0, 0.9176471, 1, 1,
-0.04063689, -1.325793, -2.420075, 0, 0.9098039, 1, 1,
-0.03133635, -0.01117848, -1.025213, 0, 0.9058824, 1, 1,
-0.02321126, 0.8208123, 0.5788432, 0, 0.8980392, 1, 1,
-0.0218848, -0.1958937, -3.531599, 0, 0.8901961, 1, 1,
-0.01757806, 1.160267, -0.1838597, 0, 0.8862745, 1, 1,
-0.01609189, -0.6640888, -3.077285, 0, 0.8784314, 1, 1,
-0.01318719, -1.851086, -2.641715, 0, 0.8745098, 1, 1,
-0.01259463, -0.9527174, -2.85659, 0, 0.8666667, 1, 1,
-0.007296891, 0.7544329, 0.6821225, 0, 0.8627451, 1, 1,
-0.006147722, 1.319638, -0.3083305, 0, 0.854902, 1, 1,
-0.005980767, 2.075329, -0.8530582, 0, 0.8509804, 1, 1,
-0.0005159127, 1.402787, 0.3151865, 0, 0.8431373, 1, 1,
1.860215e-05, -0.5492297, 4.460786, 0, 0.8392157, 1, 1,
8.738941e-05, -0.3704163, 1.721679, 0, 0.8313726, 1, 1,
0.003240134, -0.1715038, 3.226407, 0, 0.827451, 1, 1,
0.005530786, 0.09204205, 1.64918, 0, 0.8196079, 1, 1,
0.006513329, -0.2230537, 3.681129, 0, 0.8156863, 1, 1,
0.008565116, 1.637734, 0.172127, 0, 0.8078431, 1, 1,
0.01147966, -2.880286, 4.014431, 0, 0.8039216, 1, 1,
0.01160785, 1.248007, -0.2165213, 0, 0.7960784, 1, 1,
0.01587843, -0.8329962, 2.705514, 0, 0.7882353, 1, 1,
0.01625005, 0.6774667, -0.6946024, 0, 0.7843137, 1, 1,
0.01837747, -0.1842595, 3.793291, 0, 0.7764706, 1, 1,
0.0211823, 0.3890271, 1.432103, 0, 0.772549, 1, 1,
0.02169574, 0.02473075, 1.40358, 0, 0.7647059, 1, 1,
0.02336587, 2.308496, 0.04327511, 0, 0.7607843, 1, 1,
0.03148146, 1.214935, -0.9135477, 0, 0.7529412, 1, 1,
0.03589957, -0.5071701, 2.006744, 0, 0.7490196, 1, 1,
0.03879758, 0.8018309, -0.9702466, 0, 0.7411765, 1, 1,
0.03942353, -1.494536, 2.708993, 0, 0.7372549, 1, 1,
0.04227279, -0.4628369, 2.385378, 0, 0.7294118, 1, 1,
0.04382293, -1.346898, 1.639279, 0, 0.7254902, 1, 1,
0.04550418, 0.1793188, -0.5855237, 0, 0.7176471, 1, 1,
0.04993029, -1.482072, 3.361537, 0, 0.7137255, 1, 1,
0.05140587, -0.6790864, 2.024064, 0, 0.7058824, 1, 1,
0.06065109, -1.243789, 1.792618, 0, 0.6980392, 1, 1,
0.0637163, 0.2041847, 0.3292201, 0, 0.6941177, 1, 1,
0.06419516, -0.2258196, 3.614878, 0, 0.6862745, 1, 1,
0.06740858, 1.436561, 0.7417542, 0, 0.682353, 1, 1,
0.0677553, -0.8354923, 1.677923, 0, 0.6745098, 1, 1,
0.06936386, 0.2812772, 0.4965414, 0, 0.6705883, 1, 1,
0.07117151, -0.4094004, 3.131322, 0, 0.6627451, 1, 1,
0.07189674, -0.2646669, 0.4296587, 0, 0.6588235, 1, 1,
0.07312436, 1.987014, 0.3130818, 0, 0.6509804, 1, 1,
0.07419097, -0.3733073, 2.488244, 0, 0.6470588, 1, 1,
0.07765315, -0.8539045, 4.437089, 0, 0.6392157, 1, 1,
0.07833105, 1.620633, 1.392651, 0, 0.6352941, 1, 1,
0.08424195, 1.756346, -0.2928351, 0, 0.627451, 1, 1,
0.08598122, 0.4821079, 1.296326, 0, 0.6235294, 1, 1,
0.08776161, 0.6921751, -0.6408139, 0, 0.6156863, 1, 1,
0.08797466, 0.2540353, 0.7415802, 0, 0.6117647, 1, 1,
0.08973381, 1.0989, -1.480992, 0, 0.6039216, 1, 1,
0.09039823, 0.2957135, 1.316748, 0, 0.5960785, 1, 1,
0.09540121, 0.8011904, -0.7372082, 0, 0.5921569, 1, 1,
0.09541334, 0.6839481, 0.05685597, 0, 0.5843138, 1, 1,
0.09576382, 1.358773, -0.001894547, 0, 0.5803922, 1, 1,
0.09636397, -0.2502927, 4.312667, 0, 0.572549, 1, 1,
0.09678958, -0.8245175, 1.905375, 0, 0.5686275, 1, 1,
0.09747157, 1.296744, 0.588998, 0, 0.5607843, 1, 1,
0.1041715, 1.559333, 0.5227661, 0, 0.5568628, 1, 1,
0.1043252, 1.759844, 0.6702681, 0, 0.5490196, 1, 1,
0.1045383, 1.675483, -0.3544786, 0, 0.5450981, 1, 1,
0.1054009, -0.8753589, 3.721916, 0, 0.5372549, 1, 1,
0.1067702, -0.9491898, 2.823352, 0, 0.5333334, 1, 1,
0.1069099, 0.3388979, 0.08279515, 0, 0.5254902, 1, 1,
0.1137861, 1.6677, -0.1034807, 0, 0.5215687, 1, 1,
0.113814, -0.3663194, 3.695346, 0, 0.5137255, 1, 1,
0.114138, 0.5781528, 2.243619, 0, 0.509804, 1, 1,
0.1141447, -0.521208, 2.509887, 0, 0.5019608, 1, 1,
0.1152291, -0.287708, 2.731283, 0, 0.4941176, 1, 1,
0.1163359, 1.121589, 1.062745, 0, 0.4901961, 1, 1,
0.1193308, -0.9032978, 4.390656, 0, 0.4823529, 1, 1,
0.1206477, 0.6678186, -0.4184292, 0, 0.4784314, 1, 1,
0.1215964, -0.8739721, 2.334087, 0, 0.4705882, 1, 1,
0.1227362, -0.6584946, 3.587772, 0, 0.4666667, 1, 1,
0.1229478, -0.8606651, 1.54321, 0, 0.4588235, 1, 1,
0.1329048, -0.6130134, 3.907156, 0, 0.454902, 1, 1,
0.1339603, -1.630921, 3.966055, 0, 0.4470588, 1, 1,
0.1366773, -0.1615291, 1.966127, 0, 0.4431373, 1, 1,
0.1392691, -1.007315, 4.829498, 0, 0.4352941, 1, 1,
0.1399861, -1.28259, 1.495513, 0, 0.4313726, 1, 1,
0.1416129, -0.9629511, 3.496633, 0, 0.4235294, 1, 1,
0.1471905, -0.03692119, 2.20933, 0, 0.4196078, 1, 1,
0.1497968, 1.807669, -0.2083873, 0, 0.4117647, 1, 1,
0.1500802, 0.4317296, -0.3741, 0, 0.4078431, 1, 1,
0.1542075, -0.6075991, 5.181887, 0, 0.4, 1, 1,
0.1600558, -0.9361001, 3.866476, 0, 0.3921569, 1, 1,
0.1610856, 1.818923, -0.3259433, 0, 0.3882353, 1, 1,
0.1620562, -0.6308089, 3.724816, 0, 0.3803922, 1, 1,
0.1635668, -0.1113927, 1.799523, 0, 0.3764706, 1, 1,
0.165896, -0.9732749, 2.543743, 0, 0.3686275, 1, 1,
0.1681256, 0.7219906, -0.04852013, 0, 0.3647059, 1, 1,
0.1684003, 0.4441184, -1.454445, 0, 0.3568628, 1, 1,
0.1719457, 1.32047, 1.207894, 0, 0.3529412, 1, 1,
0.1722757, -0.1879774, 2.11096, 0, 0.345098, 1, 1,
0.172615, 0.02516895, 1.202783, 0, 0.3411765, 1, 1,
0.1742703, 1.21832, -0.1862745, 0, 0.3333333, 1, 1,
0.1792246, 1.754081, -1.318816, 0, 0.3294118, 1, 1,
0.1798005, -0.1065723, 2.456746, 0, 0.3215686, 1, 1,
0.1809955, -1.642804, 4.645094, 0, 0.3176471, 1, 1,
0.1887439, -1.864802, 3.059562, 0, 0.3098039, 1, 1,
0.1896042, 1.994684, 2.912551, 0, 0.3058824, 1, 1,
0.191059, -0.8020697, 5.400233, 0, 0.2980392, 1, 1,
0.1929753, 0.9479647, -0.1345744, 0, 0.2901961, 1, 1,
0.1933835, 1.798832, -0.9349661, 0, 0.2862745, 1, 1,
0.1976237, -0.7065651, 2.22882, 0, 0.2784314, 1, 1,
0.2023848, 0.6458378, 0.4639584, 0, 0.2745098, 1, 1,
0.2031965, -0.7962177, 3.306112, 0, 0.2666667, 1, 1,
0.2040689, 0.0860353, 0.1411826, 0, 0.2627451, 1, 1,
0.2046843, 0.7975955, -0.6323104, 0, 0.254902, 1, 1,
0.2129972, -0.2902386, 3.875271, 0, 0.2509804, 1, 1,
0.2137104, 0.7525575, -0.7856066, 0, 0.2431373, 1, 1,
0.214947, -0.3379031, 2.833658, 0, 0.2392157, 1, 1,
0.2218729, 0.4198531, 1.962593, 0, 0.2313726, 1, 1,
0.2248625, 0.3712545, 0.4177859, 0, 0.227451, 1, 1,
0.2262996, -1.244047, 3.523207, 0, 0.2196078, 1, 1,
0.2272363, -0.02679117, 0.8633117, 0, 0.2156863, 1, 1,
0.2277679, 0.5423382, 0.3507843, 0, 0.2078431, 1, 1,
0.2296414, 1.120271, -0.8733282, 0, 0.2039216, 1, 1,
0.2315856, -0.9893498, 2.331319, 0, 0.1960784, 1, 1,
0.2416134, 0.7446484, 1.505253, 0, 0.1882353, 1, 1,
0.2425091, 0.03937529, 0.1578459, 0, 0.1843137, 1, 1,
0.2431351, 0.3804885, -0.5970677, 0, 0.1764706, 1, 1,
0.2475763, -0.07622853, 2.03447, 0, 0.172549, 1, 1,
0.251003, 0.9455889, 0.04869553, 0, 0.1647059, 1, 1,
0.2580906, -0.09895213, 2.124176, 0, 0.1607843, 1, 1,
0.2583703, 0.4688642, 1.04929, 0, 0.1529412, 1, 1,
0.2686678, 0.3431975, 1.73545, 0, 0.1490196, 1, 1,
0.2709676, -0.3695155, 1.148886, 0, 0.1411765, 1, 1,
0.2730096, 1.802427, -1.183198, 0, 0.1372549, 1, 1,
0.2753691, 0.2540257, 0.7064771, 0, 0.1294118, 1, 1,
0.2776098, 1.530759, 0.8073542, 0, 0.1254902, 1, 1,
0.2846638, -0.3240057, 1.954373, 0, 0.1176471, 1, 1,
0.2882161, -0.6035841, 3.947267, 0, 0.1137255, 1, 1,
0.2901438, 0.791775, 2.573413, 0, 0.1058824, 1, 1,
0.2914961, 0.2548669, -1.294135, 0, 0.09803922, 1, 1,
0.3014319, -1.041007, 2.450117, 0, 0.09411765, 1, 1,
0.3056473, 0.3675998, 1.01479, 0, 0.08627451, 1, 1,
0.315405, -0.6352105, 1.196675, 0, 0.08235294, 1, 1,
0.3169351, 0.2744106, 0.9684687, 0, 0.07450981, 1, 1,
0.3170652, 0.8036889, 0.02252718, 0, 0.07058824, 1, 1,
0.3206533, -0.1299359, 1.1199, 0, 0.0627451, 1, 1,
0.322534, 0.7200762, 1.906775, 0, 0.05882353, 1, 1,
0.3283491, 0.2144961, 1.355535, 0, 0.05098039, 1, 1,
0.3347623, -2.290973, 4.416749, 0, 0.04705882, 1, 1,
0.3431543, -1.222328, 1.181929, 0, 0.03921569, 1, 1,
0.3465849, -1.94028, 5.216576, 0, 0.03529412, 1, 1,
0.3497237, -0.01411162, 1.674503, 0, 0.02745098, 1, 1,
0.363196, -1.146893, 2.801639, 0, 0.02352941, 1, 1,
0.3635677, -2.063243, 1.811708, 0, 0.01568628, 1, 1,
0.3636218, 0.1362838, 1.150802, 0, 0.01176471, 1, 1,
0.3639696, -0.05471646, 2.638494, 0, 0.003921569, 1, 1,
0.3645279, -0.5353044, 3.153352, 0.003921569, 0, 1, 1,
0.3727662, 1.184591, -0.7628093, 0.007843138, 0, 1, 1,
0.3790797, 0.4763086, 0.6799669, 0.01568628, 0, 1, 1,
0.3792612, 0.9825802, -0.1700188, 0.01960784, 0, 1, 1,
0.380187, 0.1549352, 0.8969522, 0.02745098, 0, 1, 1,
0.3824361, 0.40003, 0.9877127, 0.03137255, 0, 1, 1,
0.3852669, 0.2621794, 0.2406926, 0.03921569, 0, 1, 1,
0.3886308, -0.4229764, 3.112794, 0.04313726, 0, 1, 1,
0.3903496, -0.1423183, 3.122482, 0.05098039, 0, 1, 1,
0.3911732, 1.134926, 1.174106, 0.05490196, 0, 1, 1,
0.3965149, -0.1338868, 2.651641, 0.0627451, 0, 1, 1,
0.4018886, 0.8512457, 1.968289, 0.06666667, 0, 1, 1,
0.4022781, 0.8872411, 0.3329166, 0.07450981, 0, 1, 1,
0.4068961, -0.6016405, 0.9049935, 0.07843138, 0, 1, 1,
0.4070776, -1.005098, 3.44482, 0.08627451, 0, 1, 1,
0.4077325, -0.8090207, 3.427599, 0.09019608, 0, 1, 1,
0.4094196, 1.915884, 0.5280544, 0.09803922, 0, 1, 1,
0.4157128, -0.09782581, 3.087523, 0.1058824, 0, 1, 1,
0.4169467, 0.2294968, -0.8239182, 0.1098039, 0, 1, 1,
0.4185356, 0.2411579, 2.594634, 0.1176471, 0, 1, 1,
0.4186405, -1.405843, 4.871364, 0.1215686, 0, 1, 1,
0.4232354, 0.1073989, 0.674838, 0.1294118, 0, 1, 1,
0.4233209, -0.7170541, 3.380164, 0.1333333, 0, 1, 1,
0.4237879, -0.9867714, 2.020947, 0.1411765, 0, 1, 1,
0.4246827, 1.755885, 0.9508362, 0.145098, 0, 1, 1,
0.4271398, 0.4378847, -0.7515615, 0.1529412, 0, 1, 1,
0.4280179, -0.3564904, 2.21646, 0.1568628, 0, 1, 1,
0.4283862, -0.1544323, 2.749871, 0.1647059, 0, 1, 1,
0.4291681, -1.679562, 3.371788, 0.1686275, 0, 1, 1,
0.4328231, -1.761184, 2.058842, 0.1764706, 0, 1, 1,
0.4363334, 0.4123503, 0.07189338, 0.1803922, 0, 1, 1,
0.4379866, -0.632036, 3.207141, 0.1882353, 0, 1, 1,
0.4397457, 1.7768, -1.048756, 0.1921569, 0, 1, 1,
0.4419164, -0.1878077, 2.032911, 0.2, 0, 1, 1,
0.4487714, -0.8195144, 2.71024, 0.2078431, 0, 1, 1,
0.4505534, 0.3544764, -0.8472912, 0.2117647, 0, 1, 1,
0.4557767, 0.7086302, 1.001854, 0.2196078, 0, 1, 1,
0.4582858, 1.846251, -1.899481, 0.2235294, 0, 1, 1,
0.4584837, -0.1039724, 1.510966, 0.2313726, 0, 1, 1,
0.4628204, 0.5428296, -0.9613333, 0.2352941, 0, 1, 1,
0.4660444, 0.8113019, 1.337492, 0.2431373, 0, 1, 1,
0.4661754, -1.599162, 2.852567, 0.2470588, 0, 1, 1,
0.4686324, 0.1332688, 1.686952, 0.254902, 0, 1, 1,
0.4719989, -2.056943, 1.621343, 0.2588235, 0, 1, 1,
0.4740937, 0.1065056, 1.323146, 0.2666667, 0, 1, 1,
0.478218, 0.1791479, 0.5346592, 0.2705882, 0, 1, 1,
0.4789003, -0.6440761, 4.199649, 0.2784314, 0, 1, 1,
0.4810855, -0.6194449, 2.906565, 0.282353, 0, 1, 1,
0.4820118, -0.0919328, 0.5245721, 0.2901961, 0, 1, 1,
0.4842492, -0.7684324, 2.871962, 0.2941177, 0, 1, 1,
0.4876954, -0.03736038, 1.322571, 0.3019608, 0, 1, 1,
0.4887656, -0.6131132, 2.339963, 0.3098039, 0, 1, 1,
0.4888437, 0.9761522, 0.07708558, 0.3137255, 0, 1, 1,
0.4894339, -1.031243, 2.321399, 0.3215686, 0, 1, 1,
0.4970367, 1.186364, 0.5269877, 0.3254902, 0, 1, 1,
0.5022307, -0.6606569, 2.159916, 0.3333333, 0, 1, 1,
0.5163158, -0.4092412, 3.105226, 0.3372549, 0, 1, 1,
0.5178221, -0.1169407, 3.312959, 0.345098, 0, 1, 1,
0.5233102, -0.6137958, 3.966395, 0.3490196, 0, 1, 1,
0.5281779, 0.7340763, 1.736123, 0.3568628, 0, 1, 1,
0.5290595, -1.592066, 3.320857, 0.3607843, 0, 1, 1,
0.5300338, 0.2893293, -0.2099224, 0.3686275, 0, 1, 1,
0.5307585, -0.4921114, 3.519219, 0.372549, 0, 1, 1,
0.5313877, 0.4411867, -0.009022482, 0.3803922, 0, 1, 1,
0.5342582, -2.0385, 3.518472, 0.3843137, 0, 1, 1,
0.5383036, 0.05963296, 2.208534, 0.3921569, 0, 1, 1,
0.5408113, -1.421106, 2.030079, 0.3960784, 0, 1, 1,
0.5445233, 0.9669637, 0.3376516, 0.4039216, 0, 1, 1,
0.546984, 0.4018096, 1.261162, 0.4117647, 0, 1, 1,
0.5496649, 0.05322737, 0.967545, 0.4156863, 0, 1, 1,
0.5512974, 1.672209, -0.1610216, 0.4235294, 0, 1, 1,
0.5517576, -0.9401345, 2.654841, 0.427451, 0, 1, 1,
0.5521578, -0.8241796, 2.237936, 0.4352941, 0, 1, 1,
0.5611078, 0.8383321, -0.4202303, 0.4392157, 0, 1, 1,
0.5702022, -0.08990356, 3.113323, 0.4470588, 0, 1, 1,
0.5723416, 0.3046312, 1.777585, 0.4509804, 0, 1, 1,
0.5802961, -0.5914542, 3.992802, 0.4588235, 0, 1, 1,
0.5896706, -0.5277509, 2.882024, 0.4627451, 0, 1, 1,
0.5896767, -0.5916858, 1.849462, 0.4705882, 0, 1, 1,
0.5950998, 0.162911, 0.7941763, 0.4745098, 0, 1, 1,
0.6147402, -1.243075, 3.428998, 0.4823529, 0, 1, 1,
0.6191044, 1.210598, 0.6149602, 0.4862745, 0, 1, 1,
0.6215279, 1.874009, 1.369156, 0.4941176, 0, 1, 1,
0.6258623, -0.4654955, 1.338084, 0.5019608, 0, 1, 1,
0.6274835, 1.581333, -0.06589005, 0.5058824, 0, 1, 1,
0.631198, 1.704362, 1.939035, 0.5137255, 0, 1, 1,
0.6355167, -0.6709408, 5.242096, 0.5176471, 0, 1, 1,
0.6356363, 2.793549, -1.058894, 0.5254902, 0, 1, 1,
0.6425548, 0.7541462, 1.677966, 0.5294118, 0, 1, 1,
0.6523859, -0.5133425, 1.608776, 0.5372549, 0, 1, 1,
0.661788, 0.696843, 1.114056, 0.5411765, 0, 1, 1,
0.6635077, 0.05833936, 0.7889698, 0.5490196, 0, 1, 1,
0.6670651, 0.2167048, -0.06692713, 0.5529412, 0, 1, 1,
0.6690283, 0.2219383, 1.017571, 0.5607843, 0, 1, 1,
0.6710168, -2.815155, 2.039719, 0.5647059, 0, 1, 1,
0.674269, 0.2630565, -0.7710235, 0.572549, 0, 1, 1,
0.6788579, 1.198499, 1.598866, 0.5764706, 0, 1, 1,
0.6818938, -1.562816, 2.334519, 0.5843138, 0, 1, 1,
0.686523, -0.1159424, 3.896285, 0.5882353, 0, 1, 1,
0.6894553, 0.5342339, 3.452283, 0.5960785, 0, 1, 1,
0.6894891, -0.881942, 1.780613, 0.6039216, 0, 1, 1,
0.6913824, -1.117478, 3.775959, 0.6078432, 0, 1, 1,
0.6947491, -0.542585, 1.973016, 0.6156863, 0, 1, 1,
0.7005017, -1.720434, 4.546339, 0.6196079, 0, 1, 1,
0.7010028, 0.01344548, 1.963199, 0.627451, 0, 1, 1,
0.7047349, -0.789521, 3.255194, 0.6313726, 0, 1, 1,
0.7120011, 1.199396, 0.9728982, 0.6392157, 0, 1, 1,
0.7153997, -0.998411, 4.196384, 0.6431373, 0, 1, 1,
0.7180535, 0.6786438, 1.439034, 0.6509804, 0, 1, 1,
0.7241, 1.583726, 0.7635821, 0.654902, 0, 1, 1,
0.7242646, 1.035034, 2.016359, 0.6627451, 0, 1, 1,
0.7268174, 2.033499, 0.9301714, 0.6666667, 0, 1, 1,
0.7276625, -0.1229929, 3.89627, 0.6745098, 0, 1, 1,
0.72943, 0.2774288, 2.522648, 0.6784314, 0, 1, 1,
0.735468, 0.2526385, 0.815874, 0.6862745, 0, 1, 1,
0.7436081, 0.8016658, -0.7125089, 0.6901961, 0, 1, 1,
0.7492515, -0.2871491, 1.75758, 0.6980392, 0, 1, 1,
0.7496908, 0.1573732, 0.2848237, 0.7058824, 0, 1, 1,
0.7535127, 0.7303616, 0.6813681, 0.7098039, 0, 1, 1,
0.7554166, -0.6580164, 2.92827, 0.7176471, 0, 1, 1,
0.7557642, -1.129039, 1.638097, 0.7215686, 0, 1, 1,
0.7564501, -1.443218, 2.867068, 0.7294118, 0, 1, 1,
0.758389, -0.8319138, 2.175141, 0.7333333, 0, 1, 1,
0.7604429, -1.323277, 3.782548, 0.7411765, 0, 1, 1,
0.7605397, 1.120444, -0.2977414, 0.7450981, 0, 1, 1,
0.7605622, -0.9804758, 2.382422, 0.7529412, 0, 1, 1,
0.765054, -1.380943, 1.95627, 0.7568628, 0, 1, 1,
0.7684116, 0.7178187, 1.472684, 0.7647059, 0, 1, 1,
0.7716684, 0.7121794, 1.854722, 0.7686275, 0, 1, 1,
0.7720416, -1.413206, 2.705066, 0.7764706, 0, 1, 1,
0.7749035, 0.5234372, 0.7231588, 0.7803922, 0, 1, 1,
0.7749749, -0.1736673, 2.022632, 0.7882353, 0, 1, 1,
0.7766267, -0.3584907, 3.881555, 0.7921569, 0, 1, 1,
0.7771364, 0.09022176, 1.967067, 0.8, 0, 1, 1,
0.777797, 0.1184959, 4.395474, 0.8078431, 0, 1, 1,
0.7779469, -1.085136, 2.657062, 0.8117647, 0, 1, 1,
0.7816503, -0.5751023, 0.9019743, 0.8196079, 0, 1, 1,
0.7832047, -0.5752143, 1.430445, 0.8235294, 0, 1, 1,
0.7852673, 0.7887982, 2.262319, 0.8313726, 0, 1, 1,
0.7891429, -0.7255943, 2.308786, 0.8352941, 0, 1, 1,
0.8007111, 0.3301457, 0.1810823, 0.8431373, 0, 1, 1,
0.8009504, 0.3093519, 0.6365758, 0.8470588, 0, 1, 1,
0.8029215, 2.447206, -0.2125266, 0.854902, 0, 1, 1,
0.8059635, 0.1169106, 1.289747, 0.8588235, 0, 1, 1,
0.8185011, -0.6854851, 0.547344, 0.8666667, 0, 1, 1,
0.8214594, 0.02675114, 1.634585, 0.8705882, 0, 1, 1,
0.8291366, -1.522663, 3.424179, 0.8784314, 0, 1, 1,
0.8316298, -0.08839472, 2.117266, 0.8823529, 0, 1, 1,
0.8329467, 1.071485, 0.7043684, 0.8901961, 0, 1, 1,
0.8355148, -2.277124, 2.972483, 0.8941177, 0, 1, 1,
0.8363381, -2.241194, 2.446357, 0.9019608, 0, 1, 1,
0.8374768, 0.7359031, 2.009308, 0.9098039, 0, 1, 1,
0.8467851, 0.3142462, 2.691274, 0.9137255, 0, 1, 1,
0.8532693, -0.2697675, 0.2429273, 0.9215686, 0, 1, 1,
0.8662539, 1.280958, -0.2507192, 0.9254902, 0, 1, 1,
0.8691388, -1.472838, 1.572264, 0.9333333, 0, 1, 1,
0.8765703, 1.187452, 0.4874625, 0.9372549, 0, 1, 1,
0.8789643, 0.3002993, -0.05910774, 0.945098, 0, 1, 1,
0.8824655, -1.910869, 2.425442, 0.9490196, 0, 1, 1,
0.8852528, -0.06599828, 2.423424, 0.9568627, 0, 1, 1,
0.8873001, -0.8019832, 2.456052, 0.9607843, 0, 1, 1,
0.8932947, -0.360461, 2.226741, 0.9686275, 0, 1, 1,
0.895945, -1.603395, 0.9418177, 0.972549, 0, 1, 1,
0.8963296, -0.09302127, 1.525417, 0.9803922, 0, 1, 1,
0.8987571, 1.41435, 1.275629, 0.9843137, 0, 1, 1,
0.9001049, 0.2248121, -0.138443, 0.9921569, 0, 1, 1,
0.9037253, -1.019511, 3.748921, 0.9960784, 0, 1, 1,
0.9262896, 0.4750994, 0.8219519, 1, 0, 0.9960784, 1,
0.927285, 0.08337756, 2.860189, 1, 0, 0.9882353, 1,
0.9281245, -0.7514259, 2.451188, 1, 0, 0.9843137, 1,
0.9318234, 0.6448057, 0.234751, 1, 0, 0.9764706, 1,
0.93375, -0.07847949, 1.803221, 1, 0, 0.972549, 1,
0.934586, -0.9359461, 3.948584, 1, 0, 0.9647059, 1,
0.9385993, -1.038887, 2.972099, 1, 0, 0.9607843, 1,
0.9405233, 1.419876, 1.380965, 1, 0, 0.9529412, 1,
0.9494302, -0.2822637, 1.650437, 1, 0, 0.9490196, 1,
0.9617819, -1.116133, 1.782933, 1, 0, 0.9411765, 1,
0.9676559, -2.441111, 1.488548, 1, 0, 0.9372549, 1,
0.9684457, -0.5885187, 2.380218, 1, 0, 0.9294118, 1,
0.973169, 1.685174, -0.182611, 1, 0, 0.9254902, 1,
0.9795805, 0.9059061, -0.3268407, 1, 0, 0.9176471, 1,
0.9828829, -0.1100644, 0.8692364, 1, 0, 0.9137255, 1,
0.9834103, 0.4408092, 1.888973, 1, 0, 0.9058824, 1,
0.9880567, 0.3077974, 1.105896, 1, 0, 0.9019608, 1,
0.9907702, -0.832436, 3.112143, 1, 0, 0.8941177, 1,
0.9991885, -0.6071671, 1.643231, 1, 0, 0.8862745, 1,
1.003082, -1.626938, 1.483894, 1, 0, 0.8823529, 1,
1.010776, 0.4249935, 0.07969187, 1, 0, 0.8745098, 1,
1.017994, 1.833639, 1.471647, 1, 0, 0.8705882, 1,
1.019004, -0.03946541, 1.762287, 1, 0, 0.8627451, 1,
1.020175, -0.9716858, 1.54367, 1, 0, 0.8588235, 1,
1.023623, 0.02526415, 1.008257, 1, 0, 0.8509804, 1,
1.026345, -0.5256184, 2.277081, 1, 0, 0.8470588, 1,
1.034219, 0.761783, 0.3488783, 1, 0, 0.8392157, 1,
1.039924, -0.3868288, -0.002750337, 1, 0, 0.8352941, 1,
1.043092, -1.163655, 3.47437, 1, 0, 0.827451, 1,
1.045844, 1.535359, 0.6047158, 1, 0, 0.8235294, 1,
1.050862, 0.6925535, 0.7316888, 1, 0, 0.8156863, 1,
1.056257, 0.859452, 1.544302, 1, 0, 0.8117647, 1,
1.060786, -0.2181819, 1.320704, 1, 0, 0.8039216, 1,
1.066764, 0.139965, 0.3692605, 1, 0, 0.7960784, 1,
1.070284, -1.034977, 1.719581, 1, 0, 0.7921569, 1,
1.075685, 0.6916354, 2.791992, 1, 0, 0.7843137, 1,
1.076135, 0.2590179, 1.996788, 1, 0, 0.7803922, 1,
1.078496, -0.663646, 1.86509, 1, 0, 0.772549, 1,
1.081276, -0.08949292, 2.696416, 1, 0, 0.7686275, 1,
1.088303, -0.04482407, -0.02784326, 1, 0, 0.7607843, 1,
1.089308, 0.1396988, 2.901037, 1, 0, 0.7568628, 1,
1.098258, 0.3039363, 0.4326047, 1, 0, 0.7490196, 1,
1.103148, -0.9366581, 3.187836, 1, 0, 0.7450981, 1,
1.111464, -0.6392251, 1.806071, 1, 0, 0.7372549, 1,
1.119959, -0.1125784, 2.054405, 1, 0, 0.7333333, 1,
1.120904, 0.01084358, 3.035062, 1, 0, 0.7254902, 1,
1.121165, 0.8396502, 0.4031335, 1, 0, 0.7215686, 1,
1.123125, 1.351325, 1.211397, 1, 0, 0.7137255, 1,
1.123421, -2.265061, 2.735378, 1, 0, 0.7098039, 1,
1.125981, 0.14709, 1.616371, 1, 0, 0.7019608, 1,
1.146292, -0.09198788, 1.830129, 1, 0, 0.6941177, 1,
1.148985, -0.6503152, 0.5670708, 1, 0, 0.6901961, 1,
1.149306, -0.3455833, -0.0287469, 1, 0, 0.682353, 1,
1.154355, -0.4504171, 2.872307, 1, 0, 0.6784314, 1,
1.161856, 0.9858841, 1.277865, 1, 0, 0.6705883, 1,
1.166999, 0.3499771, 0.6736316, 1, 0, 0.6666667, 1,
1.167341, -1.963583, 1.045522, 1, 0, 0.6588235, 1,
1.168236, 0.8967243, 0.7053127, 1, 0, 0.654902, 1,
1.175755, -1.392681, 1.579992, 1, 0, 0.6470588, 1,
1.183056, -0.4882606, 1.820955, 1, 0, 0.6431373, 1,
1.19358, 1.113121, 0.4405916, 1, 0, 0.6352941, 1,
1.203825, 1.350768, 0.6843084, 1, 0, 0.6313726, 1,
1.213017, 0.5660349, 0.4095256, 1, 0, 0.6235294, 1,
1.213999, 0.08463148, 1.243478, 1, 0, 0.6196079, 1,
1.222645, 0.6136262, 2.412881, 1, 0, 0.6117647, 1,
1.224704, 0.6785551, 2.263781, 1, 0, 0.6078432, 1,
1.230005, -0.5476254, 1.948163, 1, 0, 0.6, 1,
1.234325, -0.6410203, 2.432411, 1, 0, 0.5921569, 1,
1.239833, -0.1377789, -0.4374219, 1, 0, 0.5882353, 1,
1.246034, -0.4505208, 2.218422, 1, 0, 0.5803922, 1,
1.248062, 2.081233, 0.7835798, 1, 0, 0.5764706, 1,
1.249564, -0.3744591, 0.04630103, 1, 0, 0.5686275, 1,
1.25285, -0.3918085, 1.39504, 1, 0, 0.5647059, 1,
1.259051, 0.7731143, 0.823759, 1, 0, 0.5568628, 1,
1.268441, -0.8571259, 2.320941, 1, 0, 0.5529412, 1,
1.268455, -0.9556248, 1.120827, 1, 0, 0.5450981, 1,
1.272215, -0.2001129, 2.177969, 1, 0, 0.5411765, 1,
1.277818, -0.1640413, 3.208098, 1, 0, 0.5333334, 1,
1.289178, -0.9230923, 1.465586, 1, 0, 0.5294118, 1,
1.296221, 0.7252834, 1.146971, 1, 0, 0.5215687, 1,
1.302943, 1.809026, -0.5929493, 1, 0, 0.5176471, 1,
1.30884, -0.9563352, 1.732197, 1, 0, 0.509804, 1,
1.31964, -1.046261, 5.024914, 1, 0, 0.5058824, 1,
1.323061, 2.959173, -0.2410687, 1, 0, 0.4980392, 1,
1.32838, -0.5184313, 1.067524, 1, 0, 0.4901961, 1,
1.333927, 0.08022186, 0.44616, 1, 0, 0.4862745, 1,
1.337128, 1.002318, 1.078728, 1, 0, 0.4784314, 1,
1.337174, -0.9196343, 2.584812, 1, 0, 0.4745098, 1,
1.350123, -0.4403251, 2.646968, 1, 0, 0.4666667, 1,
1.357579, -0.5375684, 1.585478, 1, 0, 0.4627451, 1,
1.360724, 2.129737, 1.580412, 1, 0, 0.454902, 1,
1.365567, 0.7471315, 1.903231, 1, 0, 0.4509804, 1,
1.371256, 0.6413698, 0.6865788, 1, 0, 0.4431373, 1,
1.378625, -0.4731404, 1.783394, 1, 0, 0.4392157, 1,
1.386235, -1.190829, 1.641973, 1, 0, 0.4313726, 1,
1.420386, 0.4740873, 2.34666, 1, 0, 0.427451, 1,
1.420685, -1.289587, 1.724048, 1, 0, 0.4196078, 1,
1.429496, -0.5577909, 1.651866, 1, 0, 0.4156863, 1,
1.442876, 0.866397, 1.629335, 1, 0, 0.4078431, 1,
1.451987, 0.8980965, 1.299834, 1, 0, 0.4039216, 1,
1.460978, -0.05543975, 1.347308, 1, 0, 0.3960784, 1,
1.463598, 0.598537, 1.00327, 1, 0, 0.3882353, 1,
1.467559, -1.481, 2.718714, 1, 0, 0.3843137, 1,
1.486229, 1.112334, 1.331931, 1, 0, 0.3764706, 1,
1.497694, -0.5253384, -1.069402, 1, 0, 0.372549, 1,
1.499774, -0.5464829, 0.4818319, 1, 0, 0.3647059, 1,
1.504926, -1.518064, 3.187995, 1, 0, 0.3607843, 1,
1.512403, -0.9575076, 2.093513, 1, 0, 0.3529412, 1,
1.515067, -0.3136406, 3.173568, 1, 0, 0.3490196, 1,
1.516493, -0.2560649, -0.361142, 1, 0, 0.3411765, 1,
1.52665, -1.784216, 1.612483, 1, 0, 0.3372549, 1,
1.537431, -0.5106153, 2.413016, 1, 0, 0.3294118, 1,
1.552763, -0.3805779, 2.731952, 1, 0, 0.3254902, 1,
1.567059, -0.5771357, 1.280917, 1, 0, 0.3176471, 1,
1.570769, -0.08014728, 2.248716, 1, 0, 0.3137255, 1,
1.572159, -0.841279, 1.458159, 1, 0, 0.3058824, 1,
1.573834, -0.2850733, 1.077284, 1, 0, 0.2980392, 1,
1.575335, 3.172349, 0.157032, 1, 0, 0.2941177, 1,
1.615241, 0.5689806, 1.098901, 1, 0, 0.2862745, 1,
1.617304, -0.5534916, 2.923748, 1, 0, 0.282353, 1,
1.632658, 0.616455, 1.3826, 1, 0, 0.2745098, 1,
1.643773, -1.141878, 1.889337, 1, 0, 0.2705882, 1,
1.659097, -0.3298156, 2.148237, 1, 0, 0.2627451, 1,
1.671311, -0.3286592, 3.31746, 1, 0, 0.2588235, 1,
1.678166, -0.3846672, 0.1113593, 1, 0, 0.2509804, 1,
1.683542, 0.8646564, -0.170244, 1, 0, 0.2470588, 1,
1.721494, -0.4069527, 2.001731, 1, 0, 0.2392157, 1,
1.731847, -0.4251418, 1.990608, 1, 0, 0.2352941, 1,
1.73496, -0.4333809, 0.4129546, 1, 0, 0.227451, 1,
1.740541, 1.408613, 0.1951308, 1, 0, 0.2235294, 1,
1.75063, 0.7947574, 0.1125791, 1, 0, 0.2156863, 1,
1.778677, -0.1343726, -0.3425597, 1, 0, 0.2117647, 1,
1.795705, 0.5607132, 1.296997, 1, 0, 0.2039216, 1,
1.8075, -1.885925, 2.544943, 1, 0, 0.1960784, 1,
1.811586, -0.0662698, 1.401246, 1, 0, 0.1921569, 1,
1.817129, -0.8956769, 0.8201014, 1, 0, 0.1843137, 1,
1.836213, 1.888635, -0.1593762, 1, 0, 0.1803922, 1,
1.836958, 0.8343745, 2.692322, 1, 0, 0.172549, 1,
1.843923, -0.8340824, 2.492839, 1, 0, 0.1686275, 1,
1.898856, -0.2679399, 3.260546, 1, 0, 0.1607843, 1,
1.906848, 1.005818, 0.4627703, 1, 0, 0.1568628, 1,
1.914838, -0.489247, 0.9417767, 1, 0, 0.1490196, 1,
1.963433, -0.8134292, 0.2241535, 1, 0, 0.145098, 1,
1.999172, -2.072463, 2.933161, 1, 0, 0.1372549, 1,
2.005121, 0.3851822, 2.369839, 1, 0, 0.1333333, 1,
2.005264, -1.902897, 2.795747, 1, 0, 0.1254902, 1,
2.01772, 0.4591785, 2.969452, 1, 0, 0.1215686, 1,
2.022233, -1.002591, 0.4047607, 1, 0, 0.1137255, 1,
2.029678, -1.216774, 1.598948, 1, 0, 0.1098039, 1,
2.042776, -0.08230369, 2.223301, 1, 0, 0.1019608, 1,
2.11112, 2.312879, 0.4407483, 1, 0, 0.09411765, 1,
2.122271, 0.09854474, 0.8130276, 1, 0, 0.09019608, 1,
2.139383, -1.639678, 3.652331, 1, 0, 0.08235294, 1,
2.213016, -0.3475653, 0.7525658, 1, 0, 0.07843138, 1,
2.216143, -1.265327, 1.967539, 1, 0, 0.07058824, 1,
2.271464, -0.06328409, 1.196111, 1, 0, 0.06666667, 1,
2.292264, -0.1536352, 1.939349, 1, 0, 0.05882353, 1,
2.304804, -1.181071, 0.7934359, 1, 0, 0.05490196, 1,
2.318795, -0.4492899, 1.983187, 1, 0, 0.04705882, 1,
2.338198, -0.06267574, -0.6366115, 1, 0, 0.04313726, 1,
2.435701, 0.9543076, 3.055836, 1, 0, 0.03529412, 1,
2.451604, -0.6891966, 2.252086, 1, 0, 0.03137255, 1,
2.475365, -0.9034032, 3.244536, 1, 0, 0.02352941, 1,
2.516623, -0.9278226, 4.429847, 1, 0, 0.01960784, 1,
2.565476, -1.329657, 1.36617, 1, 0, 0.01176471, 1,
3.001829, 1.83343, 1.700616, 1, 0, 0.007843138, 1
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
-0.02302289, -3.906208, -6.704533, 0, -0.5, 0.5, 0.5,
-0.02302289, -3.906208, -6.704533, 1, -0.5, 0.5, 0.5,
-0.02302289, -3.906208, -6.704533, 1, 1.5, 0.5, 0.5,
-0.02302289, -3.906208, -6.704533, 0, 1.5, 0.5, 0.5
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
-4.0733, 0.1460314, -6.704533, 0, -0.5, 0.5, 0.5,
-4.0733, 0.1460314, -6.704533, 1, -0.5, 0.5, 0.5,
-4.0733, 0.1460314, -6.704533, 1, 1.5, 0.5, 0.5,
-4.0733, 0.1460314, -6.704533, 0, 1.5, 0.5, 0.5
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
-4.0733, -3.906208, 0.2250443, 0, -0.5, 0.5, 0.5,
-4.0733, -3.906208, 0.2250443, 1, -0.5, 0.5, 0.5,
-4.0733, -3.906208, 0.2250443, 1, 1.5, 0.5, 0.5,
-4.0733, -3.906208, 0.2250443, 0, 1.5, 0.5, 0.5
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
-3, -2.971076, -5.1054,
3, -2.971076, -5.1054,
-3, -2.971076, -5.1054,
-3, -3.126931, -5.371922,
-2, -2.971076, -5.1054,
-2, -3.126931, -5.371922,
-1, -2.971076, -5.1054,
-1, -3.126931, -5.371922,
0, -2.971076, -5.1054,
0, -3.126931, -5.371922,
1, -2.971076, -5.1054,
1, -3.126931, -5.371922,
2, -2.971076, -5.1054,
2, -3.126931, -5.371922,
3, -2.971076, -5.1054,
3, -3.126931, -5.371922
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
-3, -3.438642, -5.904966, 0, -0.5, 0.5, 0.5,
-3, -3.438642, -5.904966, 1, -0.5, 0.5, 0.5,
-3, -3.438642, -5.904966, 1, 1.5, 0.5, 0.5,
-3, -3.438642, -5.904966, 0, 1.5, 0.5, 0.5,
-2, -3.438642, -5.904966, 0, -0.5, 0.5, 0.5,
-2, -3.438642, -5.904966, 1, -0.5, 0.5, 0.5,
-2, -3.438642, -5.904966, 1, 1.5, 0.5, 0.5,
-2, -3.438642, -5.904966, 0, 1.5, 0.5, 0.5,
-1, -3.438642, -5.904966, 0, -0.5, 0.5, 0.5,
-1, -3.438642, -5.904966, 1, -0.5, 0.5, 0.5,
-1, -3.438642, -5.904966, 1, 1.5, 0.5, 0.5,
-1, -3.438642, -5.904966, 0, 1.5, 0.5, 0.5,
0, -3.438642, -5.904966, 0, -0.5, 0.5, 0.5,
0, -3.438642, -5.904966, 1, -0.5, 0.5, 0.5,
0, -3.438642, -5.904966, 1, 1.5, 0.5, 0.5,
0, -3.438642, -5.904966, 0, 1.5, 0.5, 0.5,
1, -3.438642, -5.904966, 0, -0.5, 0.5, 0.5,
1, -3.438642, -5.904966, 1, -0.5, 0.5, 0.5,
1, -3.438642, -5.904966, 1, 1.5, 0.5, 0.5,
1, -3.438642, -5.904966, 0, 1.5, 0.5, 0.5,
2, -3.438642, -5.904966, 0, -0.5, 0.5, 0.5,
2, -3.438642, -5.904966, 1, -0.5, 0.5, 0.5,
2, -3.438642, -5.904966, 1, 1.5, 0.5, 0.5,
2, -3.438642, -5.904966, 0, 1.5, 0.5, 0.5,
3, -3.438642, -5.904966, 0, -0.5, 0.5, 0.5,
3, -3.438642, -5.904966, 1, -0.5, 0.5, 0.5,
3, -3.438642, -5.904966, 1, 1.5, 0.5, 0.5,
3, -3.438642, -5.904966, 0, 1.5, 0.5, 0.5
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
-3.138621, -2, -5.1054,
-3.138621, 3, -5.1054,
-3.138621, -2, -5.1054,
-3.294401, -2, -5.371922,
-3.138621, -1, -5.1054,
-3.294401, -1, -5.371922,
-3.138621, 0, -5.1054,
-3.294401, 0, -5.371922,
-3.138621, 1, -5.1054,
-3.294401, 1, -5.371922,
-3.138621, 2, -5.1054,
-3.294401, 2, -5.371922,
-3.138621, 3, -5.1054,
-3.294401, 3, -5.371922
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
-3.60596, -2, -5.904966, 0, -0.5, 0.5, 0.5,
-3.60596, -2, -5.904966, 1, -0.5, 0.5, 0.5,
-3.60596, -2, -5.904966, 1, 1.5, 0.5, 0.5,
-3.60596, -2, -5.904966, 0, 1.5, 0.5, 0.5,
-3.60596, -1, -5.904966, 0, -0.5, 0.5, 0.5,
-3.60596, -1, -5.904966, 1, -0.5, 0.5, 0.5,
-3.60596, -1, -5.904966, 1, 1.5, 0.5, 0.5,
-3.60596, -1, -5.904966, 0, 1.5, 0.5, 0.5,
-3.60596, 0, -5.904966, 0, -0.5, 0.5, 0.5,
-3.60596, 0, -5.904966, 1, -0.5, 0.5, 0.5,
-3.60596, 0, -5.904966, 1, 1.5, 0.5, 0.5,
-3.60596, 0, -5.904966, 0, 1.5, 0.5, 0.5,
-3.60596, 1, -5.904966, 0, -0.5, 0.5, 0.5,
-3.60596, 1, -5.904966, 1, -0.5, 0.5, 0.5,
-3.60596, 1, -5.904966, 1, 1.5, 0.5, 0.5,
-3.60596, 1, -5.904966, 0, 1.5, 0.5, 0.5,
-3.60596, 2, -5.904966, 0, -0.5, 0.5, 0.5,
-3.60596, 2, -5.904966, 1, -0.5, 0.5, 0.5,
-3.60596, 2, -5.904966, 1, 1.5, 0.5, 0.5,
-3.60596, 2, -5.904966, 0, 1.5, 0.5, 0.5,
-3.60596, 3, -5.904966, 0, -0.5, 0.5, 0.5,
-3.60596, 3, -5.904966, 1, -0.5, 0.5, 0.5,
-3.60596, 3, -5.904966, 1, 1.5, 0.5, 0.5,
-3.60596, 3, -5.904966, 0, 1.5, 0.5, 0.5
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
-3.138621, -2.971076, -4,
-3.138621, -2.971076, 4,
-3.138621, -2.971076, -4,
-3.294401, -3.126931, -4,
-3.138621, -2.971076, -2,
-3.294401, -3.126931, -2,
-3.138621, -2.971076, 0,
-3.294401, -3.126931, 0,
-3.138621, -2.971076, 2,
-3.294401, -3.126931, 2,
-3.138621, -2.971076, 4,
-3.294401, -3.126931, 4
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
-3.60596, -3.438642, -4, 0, -0.5, 0.5, 0.5,
-3.60596, -3.438642, -4, 1, -0.5, 0.5, 0.5,
-3.60596, -3.438642, -4, 1, 1.5, 0.5, 0.5,
-3.60596, -3.438642, -4, 0, 1.5, 0.5, 0.5,
-3.60596, -3.438642, -2, 0, -0.5, 0.5, 0.5,
-3.60596, -3.438642, -2, 1, -0.5, 0.5, 0.5,
-3.60596, -3.438642, -2, 1, 1.5, 0.5, 0.5,
-3.60596, -3.438642, -2, 0, 1.5, 0.5, 0.5,
-3.60596, -3.438642, 0, 0, -0.5, 0.5, 0.5,
-3.60596, -3.438642, 0, 1, -0.5, 0.5, 0.5,
-3.60596, -3.438642, 0, 1, 1.5, 0.5, 0.5,
-3.60596, -3.438642, 0, 0, 1.5, 0.5, 0.5,
-3.60596, -3.438642, 2, 0, -0.5, 0.5, 0.5,
-3.60596, -3.438642, 2, 1, -0.5, 0.5, 0.5,
-3.60596, -3.438642, 2, 1, 1.5, 0.5, 0.5,
-3.60596, -3.438642, 2, 0, 1.5, 0.5, 0.5,
-3.60596, -3.438642, 4, 0, -0.5, 0.5, 0.5,
-3.60596, -3.438642, 4, 1, -0.5, 0.5, 0.5,
-3.60596, -3.438642, 4, 1, 1.5, 0.5, 0.5,
-3.60596, -3.438642, 4, 0, 1.5, 0.5, 0.5
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
-3.138621, -2.971076, -5.1054,
-3.138621, 3.263139, -5.1054,
-3.138621, -2.971076, 5.555489,
-3.138621, 3.263139, 5.555489,
-3.138621, -2.971076, -5.1054,
-3.138621, -2.971076, 5.555489,
-3.138621, 3.263139, -5.1054,
-3.138621, 3.263139, 5.555489,
-3.138621, -2.971076, -5.1054,
3.092575, -2.971076, -5.1054,
-3.138621, -2.971076, 5.555489,
3.092575, -2.971076, 5.555489,
-3.138621, 3.263139, -5.1054,
3.092575, 3.263139, -5.1054,
-3.138621, 3.263139, 5.555489,
3.092575, 3.263139, 5.555489,
3.092575, -2.971076, -5.1054,
3.092575, 3.263139, -5.1054,
3.092575, -2.971076, 5.555489,
3.092575, 3.263139, 5.555489,
3.092575, -2.971076, -5.1054,
3.092575, -2.971076, 5.555489,
3.092575, 3.263139, -5.1054,
3.092575, 3.263139, 5.555489
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
var radius = 7.386474;
var distance = 32.86325;
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
mvMatrix.translate( 0.02302289, -0.1460314, -0.2250443 );
mvMatrix.scale( 1.28168, 1.28106, 0.7491308 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.86325);
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
Kaptan<-read.table("Kaptan.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Kaptan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Kaptan' not found
```

```r
y<-Kaptan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Kaptan' not found
```

```r
z<-Kaptan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Kaptan' not found
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
-3.047875, 1.110287, -2.332105, 0, 0, 1, 1, 1,
-3.018846, 0.345155, -1.706433, 1, 0, 0, 1, 1,
-2.96746, -0.6314936, -1.767158, 1, 0, 0, 1, 1,
-2.65763, 1.050449, -2.314324, 1, 0, 0, 1, 1,
-2.631162, -0.6137578, -1.308391, 1, 0, 0, 1, 1,
-2.501493, 0.4636278, -3.330514, 1, 0, 0, 1, 1,
-2.433171, 0.2586811, -2.132057, 0, 0, 0, 1, 1,
-2.36373, -0.708035, -1.385948, 0, 0, 0, 1, 1,
-2.292952, -0.1103439, 0.04629498, 0, 0, 0, 1, 1,
-2.26516, 0.459055, -2.431141, 0, 0, 0, 1, 1,
-2.227872, 0.002043211, -1.056822, 0, 0, 0, 1, 1,
-2.201154, 1.129735, -2.207456, 0, 0, 0, 1, 1,
-2.178127, -0.9475765, -3.230957, 0, 0, 0, 1, 1,
-2.167772, 0.4527635, -1.586812, 1, 1, 1, 1, 1,
-2.109167, -0.0429444, 0.277677, 1, 1, 1, 1, 1,
-2.092289, 0.01560644, -2.888366, 1, 1, 1, 1, 1,
-2.089947, -0.06194714, -2.993423, 1, 1, 1, 1, 1,
-2.048924, -1.362123, -1.428299, 1, 1, 1, 1, 1,
-2.016222, 2.519378, -1.39341, 1, 1, 1, 1, 1,
-2.00643, -0.4789712, -0.5807822, 1, 1, 1, 1, 1,
-1.990182, -0.7752739, -0.6494037, 1, 1, 1, 1, 1,
-1.984546, 1.512402, -0.1647243, 1, 1, 1, 1, 1,
-1.970652, -0.2889892, -2.116798, 1, 1, 1, 1, 1,
-1.959168, 1.005107, -1.499906, 1, 1, 1, 1, 1,
-1.928304, -0.6824069, -1.835251, 1, 1, 1, 1, 1,
-1.898614, -1.540813, -1.675102, 1, 1, 1, 1, 1,
-1.894976, -1.335297, -1.32934, 1, 1, 1, 1, 1,
-1.839401, -0.6108934, -0.3781607, 1, 1, 1, 1, 1,
-1.838893, -0.09601526, -2.587417, 0, 0, 1, 1, 1,
-1.798899, 0.136429, -0.5022071, 1, 0, 0, 1, 1,
-1.794167, -0.1287457, -1.599317, 1, 0, 0, 1, 1,
-1.774743, 2.004794, -2.392293, 1, 0, 0, 1, 1,
-1.756315, 0.3479772, -1.054103, 1, 0, 0, 1, 1,
-1.732558, -0.254033, -2.5149, 1, 0, 0, 1, 1,
-1.714226, -0.4205726, -3.783079, 0, 0, 0, 1, 1,
-1.712536, 0.2882143, -0.7906399, 0, 0, 0, 1, 1,
-1.705269, -2.165433, -2.185179, 0, 0, 0, 1, 1,
-1.701367, 0.5862403, -0.651824, 0, 0, 0, 1, 1,
-1.690236, 1.770809, -1.955755, 0, 0, 0, 1, 1,
-1.683508, 1.076815, -1.089073, 0, 0, 0, 1, 1,
-1.67622, 1.086012, -1.458841, 0, 0, 0, 1, 1,
-1.67178, -0.2992354, -2.004336, 1, 1, 1, 1, 1,
-1.66342, 1.270293, -1.648388, 1, 1, 1, 1, 1,
-1.654534, -0.174437, -1.168966, 1, 1, 1, 1, 1,
-1.653278, 0.1884932, -2.97772, 1, 1, 1, 1, 1,
-1.647411, 0.9539998, -2.010695, 1, 1, 1, 1, 1,
-1.638765, -1.30859, -2.073219, 1, 1, 1, 1, 1,
-1.638635, 0.2520241, -0.5884543, 1, 1, 1, 1, 1,
-1.632916, 0.3966232, -0.5148526, 1, 1, 1, 1, 1,
-1.607718, 0.7284171, 0.05505524, 1, 1, 1, 1, 1,
-1.591072, 1.876999, -0.7858501, 1, 1, 1, 1, 1,
-1.585819, -0.793428, -3.623842, 1, 1, 1, 1, 1,
-1.584799, -0.1861382, -3.873062, 1, 1, 1, 1, 1,
-1.577734, -0.00232643, -1.601319, 1, 1, 1, 1, 1,
-1.560117, -1.638004, -4.120108, 1, 1, 1, 1, 1,
-1.537393, -0.2574679, -3.393178, 1, 1, 1, 1, 1,
-1.523865, -0.2924304, -0.5989149, 0, 0, 1, 1, 1,
-1.514434, 2.114666, -1.513089, 1, 0, 0, 1, 1,
-1.497383, 1.530146, 0.5930549, 1, 0, 0, 1, 1,
-1.493595, 0.1550686, -1.234781, 1, 0, 0, 1, 1,
-1.476466, 1.469074, -1.600487, 1, 0, 0, 1, 1,
-1.465235, -0.766771, -2.348464, 1, 0, 0, 1, 1,
-1.457654, 0.04432596, -3.117547, 0, 0, 0, 1, 1,
-1.45714, 1.437573, 0.1241779, 0, 0, 0, 1, 1,
-1.455125, -0.2218915, -1.058515, 0, 0, 0, 1, 1,
-1.447459, 0.4632893, 0.4199951, 0, 0, 0, 1, 1,
-1.441282, 0.4010574, -0.6863046, 0, 0, 0, 1, 1,
-1.422633, 0.85944, 0.08317716, 0, 0, 0, 1, 1,
-1.416541, 1.971702, -0.2898465, 0, 0, 0, 1, 1,
-1.415674, -0.5411969, -1.96585, 1, 1, 1, 1, 1,
-1.4135, -0.8480945, -2.019987, 1, 1, 1, 1, 1,
-1.413201, -0.1079804, -1.273137, 1, 1, 1, 1, 1,
-1.412444, 1.167905, -1.350645, 1, 1, 1, 1, 1,
-1.412408, 2.294696, 0.2806822, 1, 1, 1, 1, 1,
-1.409975, 0.04130636, -1.730013, 1, 1, 1, 1, 1,
-1.393009, 1.32672, 0.176121, 1, 1, 1, 1, 1,
-1.390816, -1.685074, -2.064599, 1, 1, 1, 1, 1,
-1.388843, -1.473341, -1.108601, 1, 1, 1, 1, 1,
-1.37384, 0.07311792, -0.3967569, 1, 1, 1, 1, 1,
-1.351238, -2.354708, -2.971609, 1, 1, 1, 1, 1,
-1.348763, -0.8854906, -2.535402, 1, 1, 1, 1, 1,
-1.334881, -0.01130339, -0.7936721, 1, 1, 1, 1, 1,
-1.333273, -1.501645, -1.347261, 1, 1, 1, 1, 1,
-1.33171, -0.8391401, -0.6302959, 1, 1, 1, 1, 1,
-1.326122, -0.05250255, -2.826302, 0, 0, 1, 1, 1,
-1.324798, 0.1365175, -1.045302, 1, 0, 0, 1, 1,
-1.31932, 1.085038, 0.887732, 1, 0, 0, 1, 1,
-1.311842, -0.4227368, -0.9110579, 1, 0, 0, 1, 1,
-1.292079, 1.137275, -2.949367, 1, 0, 0, 1, 1,
-1.291445, 0.8995029, -0.9164322, 1, 0, 0, 1, 1,
-1.290492, -0.05286772, -2.234668, 0, 0, 0, 1, 1,
-1.289126, 0.6667897, -1.097216, 0, 0, 0, 1, 1,
-1.282347, 0.506259, 0.5237182, 0, 0, 0, 1, 1,
-1.279116, 0.004046437, -2.180788, 0, 0, 0, 1, 1,
-1.263475, 0.8733342, -2.105163, 0, 0, 0, 1, 1,
-1.262488, 0.09852296, -3.25831, 0, 0, 0, 1, 1,
-1.262327, 0.4422933, -1.314544, 0, 0, 0, 1, 1,
-1.254069, 0.9962484, -0.1649592, 1, 1, 1, 1, 1,
-1.253221, 1.227509, -1.779612, 1, 1, 1, 1, 1,
-1.250564, 1.619294, -0.3649885, 1, 1, 1, 1, 1,
-1.248257, 0.4507658, -1.933006, 1, 1, 1, 1, 1,
-1.24331, 0.2224722, 0.3913813, 1, 1, 1, 1, 1,
-1.241797, -1.340067, -2.49102, 1, 1, 1, 1, 1,
-1.237699, 1.049473, -0.5120252, 1, 1, 1, 1, 1,
-1.233776, 0.7726962, -1.407963, 1, 1, 1, 1, 1,
-1.230524, -1.241464, -2.125486, 1, 1, 1, 1, 1,
-1.214461, 0.02680007, -1.949279, 1, 1, 1, 1, 1,
-1.21443, -1.099447, -0.875643, 1, 1, 1, 1, 1,
-1.212966, -0.1793033, -1.866943, 1, 1, 1, 1, 1,
-1.20699, -0.2259419, -1.354636, 1, 1, 1, 1, 1,
-1.205693, -0.6343931, -2.345607, 1, 1, 1, 1, 1,
-1.204499, -0.1084079, -3.034072, 1, 1, 1, 1, 1,
-1.203647, -0.5081008, -3.154098, 0, 0, 1, 1, 1,
-1.200287, -0.2055601, -0.08975242, 1, 0, 0, 1, 1,
-1.199764, 0.1120692, -2.629881, 1, 0, 0, 1, 1,
-1.197654, 0.7560463, -1.853796, 1, 0, 0, 1, 1,
-1.196173, 0.514258, 0.352589, 1, 0, 0, 1, 1,
-1.194463, -0.8293098, -1.268501, 1, 0, 0, 1, 1,
-1.186823, 0.4399036, -1.511934, 0, 0, 0, 1, 1,
-1.179627, 1.918104, -0.2836664, 0, 0, 0, 1, 1,
-1.17765, -1.052519, -3.569418, 0, 0, 0, 1, 1,
-1.176103, 0.7918739, -0.2263961, 0, 0, 0, 1, 1,
-1.17609, 0.1597185, -1.381386, 0, 0, 0, 1, 1,
-1.175841, -1.071232, -2.411304, 0, 0, 0, 1, 1,
-1.174485, -1.053094, -2.915137, 0, 0, 0, 1, 1,
-1.174057, 1.391904, 1.289549, 1, 1, 1, 1, 1,
-1.173754, -2.71423, -3.616261, 1, 1, 1, 1, 1,
-1.160247, 0.1496231, -1.35622, 1, 1, 1, 1, 1,
-1.160232, 0.139117, -1.063242, 1, 1, 1, 1, 1,
-1.147277, 0.16311, -1.064546, 1, 1, 1, 1, 1,
-1.145428, -0.3178332, -2.167373, 1, 1, 1, 1, 1,
-1.132399, -1.556954, -3.185388, 1, 1, 1, 1, 1,
-1.129922, 0.6464088, -1.443802, 1, 1, 1, 1, 1,
-1.127399, -0.8822666, -1.349749, 1, 1, 1, 1, 1,
-1.127308, -0.9990475, -2.436827, 1, 1, 1, 1, 1,
-1.117384, -0.5782343, -2.47, 1, 1, 1, 1, 1,
-1.110366, -1.096722, -1.862049, 1, 1, 1, 1, 1,
-1.10571, 1.328788, 0.3584515, 1, 1, 1, 1, 1,
-1.104772, -0.4091774, -2.355151, 1, 1, 1, 1, 1,
-1.100693, 0.6835608, -1.031721, 1, 1, 1, 1, 1,
-1.090214, -2.091506, -2.410108, 0, 0, 1, 1, 1,
-1.08989, 1.157864, 1.29722, 1, 0, 0, 1, 1,
-1.088894, 0.2551593, -2.027879, 1, 0, 0, 1, 1,
-1.087292, 2.094601, -1.486331, 1, 0, 0, 1, 1,
-1.082803, -1.039881, -3.065546, 1, 0, 0, 1, 1,
-1.074535, -0.4685134, -2.298587, 1, 0, 0, 1, 1,
-1.073823, 0.9622371, -0.7802839, 0, 0, 0, 1, 1,
-1.071163, 0.8458844, -0.3971872, 0, 0, 0, 1, 1,
-1.063652, -0.112766, -1.075894, 0, 0, 0, 1, 1,
-1.061512, 0.5977611, -2.5383, 0, 0, 0, 1, 1,
-1.060968, -1.408217, -3.361497, 0, 0, 0, 1, 1,
-1.052657, -0.1505512, -0.0009758945, 0, 0, 0, 1, 1,
-1.050051, 0.9108779, 0.6473763, 0, 0, 0, 1, 1,
-1.047673, -0.8230555, -1.682233, 1, 1, 1, 1, 1,
-1.047061, 1.834384, -1.176994, 1, 1, 1, 1, 1,
-1.045761, 0.3371087, -1.190272, 1, 1, 1, 1, 1,
-1.042787, 1.031907, -0.3652783, 1, 1, 1, 1, 1,
-1.034974, -0.3910574, -2.538954, 1, 1, 1, 1, 1,
-1.034446, 0.5451648, -1.517837, 1, 1, 1, 1, 1,
-1.027721, 1.649302, 1.651355, 1, 1, 1, 1, 1,
-1.02685, -0.5856492, -2.572795, 1, 1, 1, 1, 1,
-1.016579, -0.402812, -1.515872, 1, 1, 1, 1, 1,
-1.01604, 0.6460719, -0.8750095, 1, 1, 1, 1, 1,
-1.015258, 1.619205, 0.5432951, 1, 1, 1, 1, 1,
-1.008764, 1.652653, 0.1055283, 1, 1, 1, 1, 1,
-1.004429, 0.3841617, -0.7122517, 1, 1, 1, 1, 1,
-1.003876, 0.287119, -1.188499, 1, 1, 1, 1, 1,
-1.000345, 1.991934, -0.9439421, 1, 1, 1, 1, 1,
-0.9936405, -0.8158506, -2.377517, 0, 0, 1, 1, 1,
-0.9933514, 1.549517, -2.110577, 1, 0, 0, 1, 1,
-0.9893867, -2.310615, -3.419961, 1, 0, 0, 1, 1,
-0.9879529, -0.628336, -0.050164, 1, 0, 0, 1, 1,
-0.9873776, 0.7973203, 0.1304801, 1, 0, 0, 1, 1,
-0.984561, 0.06708063, 0.2412926, 1, 0, 0, 1, 1,
-0.9827432, -0.1250818, -1.724084, 0, 0, 0, 1, 1,
-0.9749875, -0.1243594, -2.021631, 0, 0, 0, 1, 1,
-0.9749146, -1.007789, -3.113886, 0, 0, 0, 1, 1,
-0.9739954, 2.34126, 1.01455, 0, 0, 0, 1, 1,
-0.9725137, 0.250138, -1.877861, 0, 0, 0, 1, 1,
-0.9693713, 0.819018, -2.372501, 0, 0, 0, 1, 1,
-0.9610983, 0.4383192, -1.870451, 0, 0, 0, 1, 1,
-0.9595214, -0.8288645, -3.147507, 1, 1, 1, 1, 1,
-0.9532155, -0.9435882, -2.671965, 1, 1, 1, 1, 1,
-0.9447805, -1.540104, -3.634172, 1, 1, 1, 1, 1,
-0.942945, 0.6455014, -1.149266, 1, 1, 1, 1, 1,
-0.9424326, 0.5189439, -0.7860259, 1, 1, 1, 1, 1,
-0.9355741, 1.234017, 0.2837378, 1, 1, 1, 1, 1,
-0.926482, 0.4372616, -1.138431, 1, 1, 1, 1, 1,
-0.9243948, 1.10784, -0.4312168, 1, 1, 1, 1, 1,
-0.9241282, -0.8691806, -3.065548, 1, 1, 1, 1, 1,
-0.919996, 0.7628611, -1.198059, 1, 1, 1, 1, 1,
-0.9181643, -0.299492, -2.101496, 1, 1, 1, 1, 1,
-0.9167604, 0.3861564, -2.135814, 1, 1, 1, 1, 1,
-0.9139773, 0.01286016, -1.490712, 1, 1, 1, 1, 1,
-0.907334, 1.085731, -1.412747, 1, 1, 1, 1, 1,
-0.9065723, 1.745137, -0.2583721, 1, 1, 1, 1, 1,
-0.8955726, -0.8364468, -3.229822, 0, 0, 1, 1, 1,
-0.8890569, -0.3476607, -3.249418, 1, 0, 0, 1, 1,
-0.8859499, -2.060149, -1.61797, 1, 0, 0, 1, 1,
-0.8855782, 0.3330221, -0.6475164, 1, 0, 0, 1, 1,
-0.8853163, 0.732857, -1.716655, 1, 0, 0, 1, 1,
-0.8852485, -0.5953602, -2.483047, 1, 0, 0, 1, 1,
-0.8817501, 0.5769057, 0.7406146, 0, 0, 0, 1, 1,
-0.8729014, 0.6946726, 0.01307094, 0, 0, 0, 1, 1,
-0.8622561, -0.9919679, -1.585347, 0, 0, 0, 1, 1,
-0.8596057, 1.018685, 0.9584412, 0, 0, 0, 1, 1,
-0.8578051, -0.1951449, -1.729078, 0, 0, 0, 1, 1,
-0.8551905, 1.462283, -0.9038169, 0, 0, 0, 1, 1,
-0.8524842, 0.0949031, -2.954223, 0, 0, 0, 1, 1,
-0.8514131, -0.8496786, -2.484808, 1, 1, 1, 1, 1,
-0.8399847, -0.5402135, -1.103927, 1, 1, 1, 1, 1,
-0.8364987, -0.4623376, -1.33435, 1, 1, 1, 1, 1,
-0.8355219, 0.5519834, -0.8224475, 1, 1, 1, 1, 1,
-0.8332811, -0.4818217, -2.027626, 1, 1, 1, 1, 1,
-0.8331282, 1.072274, -1.06748, 1, 1, 1, 1, 1,
-0.82833, -0.4264799, -3.044154, 1, 1, 1, 1, 1,
-0.8251147, 0.3304058, -2.101242, 1, 1, 1, 1, 1,
-0.8198931, -2.211751, -1.490663, 1, 1, 1, 1, 1,
-0.8144438, 0.7838463, -0.987444, 1, 1, 1, 1, 1,
-0.8093261, 0.4318959, -1.281843, 1, 1, 1, 1, 1,
-0.8089436, 0.3237409, -2.565884, 1, 1, 1, 1, 1,
-0.8004087, -0.4566283, -2.801737, 1, 1, 1, 1, 1,
-0.797424, -0.5630927, -3.106457, 1, 1, 1, 1, 1,
-0.7965317, -1.122293, -2.159361, 1, 1, 1, 1, 1,
-0.7911887, 1.464061, 1.042534, 0, 0, 1, 1, 1,
-0.7877991, -0.1378954, -1.458475, 1, 0, 0, 1, 1,
-0.7834379, 0.9770544, -0.3526329, 1, 0, 0, 1, 1,
-0.7755747, -1.010589, -1.563276, 1, 0, 0, 1, 1,
-0.7732871, -0.1418162, -2.27107, 1, 0, 0, 1, 1,
-0.7716148, 0.4699374, 0.6804481, 1, 0, 0, 1, 1,
-0.7667005, 1.429057, -0.1557371, 0, 0, 0, 1, 1,
-0.757094, 0.3101153, 0.6711337, 0, 0, 0, 1, 1,
-0.7567218, -0.4578622, -1.012527, 0, 0, 0, 1, 1,
-0.7560757, 0.5771472, 0.08853476, 0, 0, 0, 1, 1,
-0.7476674, -0.2835734, -3.538139, 0, 0, 0, 1, 1,
-0.7449642, 0.979686, -1.131953, 0, 0, 0, 1, 1,
-0.7439306, -0.4238654, -3.043797, 0, 0, 0, 1, 1,
-0.7430435, 1.763405, -0.218897, 1, 1, 1, 1, 1,
-0.7424878, 0.5281281, -0.5774856, 1, 1, 1, 1, 1,
-0.7295577, -1.366092, -0.5384337, 1, 1, 1, 1, 1,
-0.7252049, 0.8901622, -0.1004486, 1, 1, 1, 1, 1,
-0.7247385, -1.585479, -3.412716, 1, 1, 1, 1, 1,
-0.7134145, 0.9827823, -1.498013, 1, 1, 1, 1, 1,
-0.7124267, -0.2517618, -1.414741, 1, 1, 1, 1, 1,
-0.7118853, -2.352376, -2.89694, 1, 1, 1, 1, 1,
-0.711532, 0.0687542, -1.547371, 1, 1, 1, 1, 1,
-0.7109739, 0.3785934, 0.953233, 1, 1, 1, 1, 1,
-0.7060786, -0.242398, -3.388825, 1, 1, 1, 1, 1,
-0.6999733, -0.7808664, -1.886672, 1, 1, 1, 1, 1,
-0.6986301, 0.02802438, -2.62864, 1, 1, 1, 1, 1,
-0.6941043, 0.1746978, -0.4332973, 1, 1, 1, 1, 1,
-0.6850301, -0.3925799, -1.2295, 1, 1, 1, 1, 1,
-0.6836861, 0.1453934, -0.7958894, 0, 0, 1, 1, 1,
-0.6831037, 0.2159316, -1.35672, 1, 0, 0, 1, 1,
-0.6824593, -1.087651, -1.857443, 1, 0, 0, 1, 1,
-0.6799429, 0.9646471, -1.431498, 1, 0, 0, 1, 1,
-0.675527, -2.275098, -3.270042, 1, 0, 0, 1, 1,
-0.6713076, -0.5300443, -0.6032571, 1, 0, 0, 1, 1,
-0.6711484, -0.5072926, -3.969557, 0, 0, 0, 1, 1,
-0.6710262, 1.352975, 0.01509183, 0, 0, 0, 1, 1,
-0.6688396, 0.7002098, -2.481536, 0, 0, 0, 1, 1,
-0.666631, 0.5765836, -1.513569, 0, 0, 0, 1, 1,
-0.6657285, 0.1062549, -1.904825, 0, 0, 0, 1, 1,
-0.6643552, 0.6735286, -1.913635, 0, 0, 0, 1, 1,
-0.6595804, 0.07001261, -1.358346, 0, 0, 0, 1, 1,
-0.6582091, 0.5569935, -0.813283, 1, 1, 1, 1, 1,
-0.6575208, 1.472202, -0.739855, 1, 1, 1, 1, 1,
-0.6524469, -0.7560772, -2.867837, 1, 1, 1, 1, 1,
-0.6464515, -1.150881, -0.7281193, 1, 1, 1, 1, 1,
-0.6446499, 0.7884569, -0.3505447, 1, 1, 1, 1, 1,
-0.6434016, -0.145658, -2.034296, 1, 1, 1, 1, 1,
-0.6415214, 0.02245426, -0.2102364, 1, 1, 1, 1, 1,
-0.6399486, 0.1141522, -0.3199023, 1, 1, 1, 1, 1,
-0.6375188, -1.119436, -3.122793, 1, 1, 1, 1, 1,
-0.6364924, -1.12905, -1.546287, 1, 1, 1, 1, 1,
-0.6309567, -0.9010616, -3.407666, 1, 1, 1, 1, 1,
-0.6292985, 0.3225408, 0.4143677, 1, 1, 1, 1, 1,
-0.6191213, -0.506129, -3.256646, 1, 1, 1, 1, 1,
-0.614869, 1.132259, 0.6651391, 1, 1, 1, 1, 1,
-0.6119724, 0.6095818, 1.010372, 1, 1, 1, 1, 1,
-0.6106406, -2.140047, -3.025729, 0, 0, 1, 1, 1,
-0.6101096, 1.686666, -0.7862091, 1, 0, 0, 1, 1,
-0.608408, 0.380705, -0.09987799, 1, 0, 0, 1, 1,
-0.6004469, -1.579816, -2.578141, 1, 0, 0, 1, 1,
-0.5989547, -0.4727794, -0.3817228, 1, 0, 0, 1, 1,
-0.5964435, 0.9149426, -0.6145143, 1, 0, 0, 1, 1,
-0.5961572, -1.425279, -2.545125, 0, 0, 0, 1, 1,
-0.5912029, 1.256544, -0.4189604, 0, 0, 0, 1, 1,
-0.5856116, -0.4907799, -2.573399, 0, 0, 0, 1, 1,
-0.5853794, 1.426543, 0.138162, 0, 0, 0, 1, 1,
-0.5847819, 0.3485142, 0.6825068, 0, 0, 0, 1, 1,
-0.5722012, 0.1636923, -1.387016, 0, 0, 0, 1, 1,
-0.5710984, 0.4737976, -0.1887832, 0, 0, 0, 1, 1,
-0.5690125, -0.9668377, -3.350988, 1, 1, 1, 1, 1,
-0.5687522, 0.6944749, -1.368732, 1, 1, 1, 1, 1,
-0.5588778, 1.413928, 1.112421, 1, 1, 1, 1, 1,
-0.5556624, 2.311558, -0.3437625, 1, 1, 1, 1, 1,
-0.5510003, -0.5203871, -3.521091, 1, 1, 1, 1, 1,
-0.5444001, -0.2653631, -1.101418, 1, 1, 1, 1, 1,
-0.5430786, -0.6696779, -1.912093, 1, 1, 1, 1, 1,
-0.5412494, 0.7764027, -0.4500556, 1, 1, 1, 1, 1,
-0.5399019, -0.6939564, -0.343147, 1, 1, 1, 1, 1,
-0.5361943, -1.204426, -2.470433, 1, 1, 1, 1, 1,
-0.5340994, -0.5461112, -2.278143, 1, 1, 1, 1, 1,
-0.5321214, -1.045714, -2.688113, 1, 1, 1, 1, 1,
-0.531527, 1.452758, -0.9824833, 1, 1, 1, 1, 1,
-0.5299344, -0.6681743, -1.806037, 1, 1, 1, 1, 1,
-0.5273998, -0.2958774, -1.199123, 1, 1, 1, 1, 1,
-0.526875, -1.04387, -2.520842, 0, 0, 1, 1, 1,
-0.5234748, -0.08925276, -2.422238, 1, 0, 0, 1, 1,
-0.518984, -0.7184671, -3.484582, 1, 0, 0, 1, 1,
-0.5160325, 0.1300341, -0.9221501, 1, 0, 0, 1, 1,
-0.5126476, 1.081638, -0.05578139, 1, 0, 0, 1, 1,
-0.511915, 1.495897, -1.582519, 1, 0, 0, 1, 1,
-0.5097107, 1.642087, -0.1298143, 0, 0, 0, 1, 1,
-0.5074495, -0.6044065, -4.131558, 0, 0, 0, 1, 1,
-0.5043183, 1.765841, -1.382917, 0, 0, 0, 1, 1,
-0.5013045, 1.478154, 0.00282709, 0, 0, 0, 1, 1,
-0.4950529, -1.134544, -1.358502, 0, 0, 0, 1, 1,
-0.4925452, -0.4945495, -3.645072, 0, 0, 0, 1, 1,
-0.4916441, 0.818748, -0.8273201, 0, 0, 0, 1, 1,
-0.489383, 0.2195197, -1.863904, 1, 1, 1, 1, 1,
-0.4825315, -1.41467, -3.826375, 1, 1, 1, 1, 1,
-0.4817303, 1.19246, 0.1716, 1, 1, 1, 1, 1,
-0.4789108, 0.9386807, 0.3487315, 1, 1, 1, 1, 1,
-0.4766764, 0.2751315, 0.1822648, 1, 1, 1, 1, 1,
-0.4748339, 0.6451157, -1.664519, 1, 1, 1, 1, 1,
-0.4728153, 1.217443, -0.6168792, 1, 1, 1, 1, 1,
-0.472258, -0.3808061, -1.890387, 1, 1, 1, 1, 1,
-0.4676396, 0.4676617, -1.745467, 1, 1, 1, 1, 1,
-0.463478, 2.514797, 1.051096, 1, 1, 1, 1, 1,
-0.4579804, 2.279332, 0.4062892, 1, 1, 1, 1, 1,
-0.4576783, 1.149008, -0.8820956, 1, 1, 1, 1, 1,
-0.4573468, -1.064754, -2.755331, 1, 1, 1, 1, 1,
-0.4556916, 0.1786512, -1.246736, 1, 1, 1, 1, 1,
-0.4532, -0.04125279, -1.704534, 1, 1, 1, 1, 1,
-0.4517261, -0.5901251, -3.836005, 0, 0, 1, 1, 1,
-0.4516041, 0.00639128, -0.199007, 1, 0, 0, 1, 1,
-0.4473668, -1.020896, -1.291728, 1, 0, 0, 1, 1,
-0.4369197, -1.419196, -3.828945, 1, 0, 0, 1, 1,
-0.4340107, 0.3794158, -1.90729, 1, 0, 0, 1, 1,
-0.4331367, 1.431059, -0.3995991, 1, 0, 0, 1, 1,
-0.4273304, -2.364026, -4.946056, 0, 0, 0, 1, 1,
-0.4273212, 1.206594, -1.132038, 0, 0, 0, 1, 1,
-0.4263779, -0.02721138, -1.770878, 0, 0, 0, 1, 1,
-0.426145, 0.4747933, -0.943523, 0, 0, 0, 1, 1,
-0.4253807, -0.6721447, -2.301869, 0, 0, 0, 1, 1,
-0.4233541, 1.849045, -0.2029705, 0, 0, 0, 1, 1,
-0.4214142, -0.4455024, -2.02795, 0, 0, 0, 1, 1,
-0.4202644, -0.7271293, -4.950144, 1, 1, 1, 1, 1,
-0.4199069, -0.4062082, -4.598721, 1, 1, 1, 1, 1,
-0.4190724, -0.2382312, -2.293521, 1, 1, 1, 1, 1,
-0.405838, -0.7157537, -3.16432, 1, 1, 1, 1, 1,
-0.4054061, -0.01835369, -1.336482, 1, 1, 1, 1, 1,
-0.4025234, -0.7230232, -3.417017, 1, 1, 1, 1, 1,
-0.3978988, -1.928044, -1.087795, 1, 1, 1, 1, 1,
-0.3978011, -0.9958057, -3.029375, 1, 1, 1, 1, 1,
-0.3963361, -0.7010661, -1.972023, 1, 1, 1, 1, 1,
-0.3937001, -1.352956, -2.577736, 1, 1, 1, 1, 1,
-0.3921316, 1.353725, -0.4924591, 1, 1, 1, 1, 1,
-0.3876175, -1.697544, -4.329215, 1, 1, 1, 1, 1,
-0.3870752, -1.278013, -2.325911, 1, 1, 1, 1, 1,
-0.3825276, 0.09207257, -0.366622, 1, 1, 1, 1, 1,
-0.3816063, -1.637502, -3.430071, 1, 1, 1, 1, 1,
-0.381488, -0.09120779, -2.686732, 0, 0, 1, 1, 1,
-0.3811271, -0.1919166, -1.354872, 1, 0, 0, 1, 1,
-0.3807931, -0.5102078, -1.893454, 1, 0, 0, 1, 1,
-0.3806362, 1.000288, -0.3093928, 1, 0, 0, 1, 1,
-0.380506, 0.5118899, 1.263333, 1, 0, 0, 1, 1,
-0.377458, -1.096929, -3.840214, 1, 0, 0, 1, 1,
-0.3758343, -0.9998172, -4.075867, 0, 0, 0, 1, 1,
-0.3754966, -0.3430694, -3.393068, 0, 0, 0, 1, 1,
-0.3681695, -0.1148867, -1.314187, 0, 0, 0, 1, 1,
-0.3665738, 1.661292, -0.7845301, 0, 0, 0, 1, 1,
-0.3658659, -0.157698, -1.375562, 0, 0, 0, 1, 1,
-0.3651628, 2.070784, 0.4239205, 0, 0, 0, 1, 1,
-0.3631365, -0.9928642, -3.129082, 0, 0, 0, 1, 1,
-0.3621959, 0.1058202, -0.6295139, 1, 1, 1, 1, 1,
-0.3606445, 0.00212426, -0.8563356, 1, 1, 1, 1, 1,
-0.3597772, -1.234892, -1.861053, 1, 1, 1, 1, 1,
-0.3521623, 1.118629, -0.2648224, 1, 1, 1, 1, 1,
-0.3507942, 0.6038175, -0.6307384, 1, 1, 1, 1, 1,
-0.3500778, -0.5679492, -1.679157, 1, 1, 1, 1, 1,
-0.3477544, -1.199981, -3.344581, 1, 1, 1, 1, 1,
-0.3447779, -1.674932, -3.686922, 1, 1, 1, 1, 1,
-0.3423527, 0.08077456, -2.638518, 1, 1, 1, 1, 1,
-0.3421419, 0.9326966, -1.207991, 1, 1, 1, 1, 1,
-0.339108, -0.9070986, -0.2861473, 1, 1, 1, 1, 1,
-0.3373346, -1.350168, -3.539237, 1, 1, 1, 1, 1,
-0.3368171, 1.09557, -0.6199273, 1, 1, 1, 1, 1,
-0.3352557, -0.4207699, -2.410376, 1, 1, 1, 1, 1,
-0.333335, 1.012362, 1.532918, 1, 1, 1, 1, 1,
-0.3303086, -0.6309446, -2.725837, 0, 0, 1, 1, 1,
-0.3293231, 2.123381, 1.585922, 1, 0, 0, 1, 1,
-0.3288443, 1.372508, 0.566291, 1, 0, 0, 1, 1,
-0.3263279, 1.930337, 1.700471, 1, 0, 0, 1, 1,
-0.3190854, -0.02896607, -1.818461, 1, 0, 0, 1, 1,
-0.3185649, 0.7467104, -1.413432, 1, 0, 0, 1, 1,
-0.3081066, -0.40298, -2.887074, 0, 0, 0, 1, 1,
-0.303585, -0.6779575, -1.257772, 0, 0, 0, 1, 1,
-0.3003147, -0.5789282, -4.651795, 0, 0, 0, 1, 1,
-0.3002777, 0.2522884, -1.171192, 0, 0, 0, 1, 1,
-0.2987352, 1.306336, 0.04414419, 0, 0, 0, 1, 1,
-0.2957683, -1.72203, -3.031699, 0, 0, 0, 1, 1,
-0.2949342, -1.682309, -2.178275, 0, 0, 0, 1, 1,
-0.2939895, 0.7003928, 0.4457949, 1, 1, 1, 1, 1,
-0.2846948, -0.5131347, -4.203166, 1, 1, 1, 1, 1,
-0.278622, 0.1437689, -1.418974, 1, 1, 1, 1, 1,
-0.2742656, -1.758135, -3.327067, 1, 1, 1, 1, 1,
-0.2720642, -0.6413616, -2.289842, 1, 1, 1, 1, 1,
-0.2716334, 0.04707452, -2.216798, 1, 1, 1, 1, 1,
-0.270462, 0.7795596, -1.349291, 1, 1, 1, 1, 1,
-0.2698526, 0.3991735, -0.3888627, 1, 1, 1, 1, 1,
-0.2683033, -0.4791404, -3.639719, 1, 1, 1, 1, 1,
-0.2676614, 1.53813, 2.583102, 1, 1, 1, 1, 1,
-0.2670163, -0.08633985, -2.715312, 1, 1, 1, 1, 1,
-0.2642764, -0.418613, -3.072353, 1, 1, 1, 1, 1,
-0.2617176, 0.9338689, -1.432757, 1, 1, 1, 1, 1,
-0.2615139, 1.006799, -1.614229, 1, 1, 1, 1, 1,
-0.2604084, 1.645305, -1.099057, 1, 1, 1, 1, 1,
-0.2594241, -0.6487861, -1.905227, 0, 0, 1, 1, 1,
-0.2583459, -1.046699, -3.912122, 1, 0, 0, 1, 1,
-0.2575307, -0.586628, -1.677946, 1, 0, 0, 1, 1,
-0.2529362, -2.024609, -2.792172, 1, 0, 0, 1, 1,
-0.2524384, -0.4792278, -2.929813, 1, 0, 0, 1, 1,
-0.2510096, 1.277564, -1.042505, 1, 0, 0, 1, 1,
-0.2508213, 1.852288, -0.3851545, 0, 0, 0, 1, 1,
-0.2490569, 0.2839692, 0.7628927, 0, 0, 0, 1, 1,
-0.2445353, -0.613641, -1.701099, 0, 0, 0, 1, 1,
-0.2437894, 1.46413, 0.9301731, 0, 0, 0, 1, 1,
-0.2382542, -1.290341, -3.541499, 0, 0, 0, 1, 1,
-0.2376392, 0.655268, -0.9691442, 0, 0, 0, 1, 1,
-0.2367057, 0.7617772, -0.9281493, 0, 0, 0, 1, 1,
-0.2355312, -1.247098, -2.625546, 1, 1, 1, 1, 1,
-0.2321761, -2.042828, -2.535634, 1, 1, 1, 1, 1,
-0.2289669, -0.2767673, -1.597309, 1, 1, 1, 1, 1,
-0.2279019, 0.2226078, -1.916264, 1, 1, 1, 1, 1,
-0.2223427, -0.4482425, -3.907644, 1, 1, 1, 1, 1,
-0.2219656, 0.276191, -1.190087, 1, 1, 1, 1, 1,
-0.22167, 0.5977564, 0.5869298, 1, 1, 1, 1, 1,
-0.2210391, 1.08135, 1.783832, 1, 1, 1, 1, 1,
-0.2165266, 0.3575526, 1.495304, 1, 1, 1, 1, 1,
-0.2108555, -0.04946104, -3.273729, 1, 1, 1, 1, 1,
-0.2090964, 0.6738878, -1.355644, 1, 1, 1, 1, 1,
-0.2067823, -0.4816416, -1.742732, 1, 1, 1, 1, 1,
-0.2057838, -2.543326, -3.035565, 1, 1, 1, 1, 1,
-0.205641, 0.10967, -1.423618, 1, 1, 1, 1, 1,
-0.2048651, 1.028517, 0.5742263, 1, 1, 1, 1, 1,
-0.2040824, 1.113669, -0.1757458, 0, 0, 1, 1, 1,
-0.2033748, 0.4123943, 0.646727, 1, 0, 0, 1, 1,
-0.2032133, 0.2206533, -0.5839448, 1, 0, 0, 1, 1,
-0.2030702, -0.3714042, -1.768093, 1, 0, 0, 1, 1,
-0.2011994, -0.3871813, -2.536726, 1, 0, 0, 1, 1,
-0.1968921, -0.4417502, -3.198571, 1, 0, 0, 1, 1,
-0.1965562, 1.222783, -2.863629, 0, 0, 0, 1, 1,
-0.1924566, -0.5561129, -3.540273, 0, 0, 0, 1, 1,
-0.1866821, 0.8389824, -1.932985, 0, 0, 0, 1, 1,
-0.1849553, 0.01424166, -0.9534461, 0, 0, 0, 1, 1,
-0.1832459, 1.477416, -0.3620393, 0, 0, 0, 1, 1,
-0.181175, -0.2021612, -0.817079, 0, 0, 0, 1, 1,
-0.1791999, -1.571043, -1.964034, 0, 0, 0, 1, 1,
-0.1774887, 1.010473, 0.2360153, 1, 1, 1, 1, 1,
-0.1730527, -1.663887, -1.922486, 1, 1, 1, 1, 1,
-0.1717255, 0.945136, -0.5328379, 1, 1, 1, 1, 1,
-0.1686719, -0.02263833, -0.7958523, 1, 1, 1, 1, 1,
-0.1681397, 2.371705, -1.456393, 1, 1, 1, 1, 1,
-0.1645538, -0.4979966, -3.43271, 1, 1, 1, 1, 1,
-0.1633077, 0.3085414, -0.1455855, 1, 1, 1, 1, 1,
-0.1594558, 0.3282917, -0.8154694, 1, 1, 1, 1, 1,
-0.156379, 0.2234273, -1.453772, 1, 1, 1, 1, 1,
-0.156142, -2.275157, -3.133192, 1, 1, 1, 1, 1,
-0.1480198, -1.050485, -3.978616, 1, 1, 1, 1, 1,
-0.1465323, 0.2689178, -1.689028, 1, 1, 1, 1, 1,
-0.1410587, -0.6641309, -2.770476, 1, 1, 1, 1, 1,
-0.1375679, 0.3618572, -1.079688, 1, 1, 1, 1, 1,
-0.1372992, -0.3547514, -0.5269619, 1, 1, 1, 1, 1,
-0.1348237, -0.02986242, -2.253102, 0, 0, 1, 1, 1,
-0.1323211, -0.8060451, -3.123971, 1, 0, 0, 1, 1,
-0.1304493, -0.9644865, -2.722851, 1, 0, 0, 1, 1,
-0.1302802, -1.220558, -3.460421, 1, 0, 0, 1, 1,
-0.1277588, -0.0621842, -2.756428, 1, 0, 0, 1, 1,
-0.1251795, 2.086082, -1.439043, 1, 0, 0, 1, 1,
-0.1194903, 0.257322, -0.9935961, 0, 0, 0, 1, 1,
-0.1187618, -0.3938136, -2.406281, 0, 0, 0, 1, 1,
-0.117595, -0.1749658, -2.144877, 0, 0, 0, 1, 1,
-0.1151249, 0.4895867, 0.1087531, 0, 0, 0, 1, 1,
-0.1131757, -2.070965, -2.352257, 0, 0, 0, 1, 1,
-0.112975, -0.1292731, -4.671161, 0, 0, 0, 1, 1,
-0.1121172, -0.4500032, -4.41955, 0, 0, 0, 1, 1,
-0.1085139, 0.1160756, -0.09879945, 1, 1, 1, 1, 1,
-0.1056702, 0.2266888, -0.4889756, 1, 1, 1, 1, 1,
-0.1004829, 0.4589235, 0.2972217, 1, 1, 1, 1, 1,
-0.09583697, 0.212832, -1.93726, 1, 1, 1, 1, 1,
-0.0937702, -1.870704, -3.275569, 1, 1, 1, 1, 1,
-0.08930736, 1.284834, -2.232839, 1, 1, 1, 1, 1,
-0.08559498, -1.132262, -2.45112, 1, 1, 1, 1, 1,
-0.08340728, -0.3772666, -4.346985, 1, 1, 1, 1, 1,
-0.08320406, -1.041763, -1.231936, 1, 1, 1, 1, 1,
-0.08292091, 0.6304263, -0.18105, 1, 1, 1, 1, 1,
-0.08028411, 0.1954942, -0.0662981, 1, 1, 1, 1, 1,
-0.0724971, -0.9928472, -2.482498, 1, 1, 1, 1, 1,
-0.07186095, 1.149085, -1.868465, 1, 1, 1, 1, 1,
-0.07102186, -0.9057211, -2.297471, 1, 1, 1, 1, 1,
-0.07087188, 1.303888, 0.2921864, 1, 1, 1, 1, 1,
-0.06990672, 1.280574, 0.39662, 0, 0, 1, 1, 1,
-0.06699359, -0.4336735, -3.763579, 1, 0, 0, 1, 1,
-0.06434525, -0.6545177, -3.35304, 1, 0, 0, 1, 1,
-0.06293935, 0.1956876, 1.328361, 1, 0, 0, 1, 1,
-0.06220258, 0.7951761, -1.080938, 1, 0, 0, 1, 1,
-0.06138092, 1.077664, 0.05581953, 1, 0, 0, 1, 1,
-0.05738525, -1.378397, -2.981954, 0, 0, 0, 1, 1,
-0.05605439, -0.3175369, -2.430351, 0, 0, 0, 1, 1,
-0.04852314, 0.3437898, -2.069992, 0, 0, 0, 1, 1,
-0.04422009, 0.6775588, -0.1805754, 0, 0, 0, 1, 1,
-0.04359153, 0.3907453, 0.7541384, 0, 0, 0, 1, 1,
-0.04063689, -1.325793, -2.420075, 0, 0, 0, 1, 1,
-0.03133635, -0.01117848, -1.025213, 0, 0, 0, 1, 1,
-0.02321126, 0.8208123, 0.5788432, 1, 1, 1, 1, 1,
-0.0218848, -0.1958937, -3.531599, 1, 1, 1, 1, 1,
-0.01757806, 1.160267, -0.1838597, 1, 1, 1, 1, 1,
-0.01609189, -0.6640888, -3.077285, 1, 1, 1, 1, 1,
-0.01318719, -1.851086, -2.641715, 1, 1, 1, 1, 1,
-0.01259463, -0.9527174, -2.85659, 1, 1, 1, 1, 1,
-0.007296891, 0.7544329, 0.6821225, 1, 1, 1, 1, 1,
-0.006147722, 1.319638, -0.3083305, 1, 1, 1, 1, 1,
-0.005980767, 2.075329, -0.8530582, 1, 1, 1, 1, 1,
-0.0005159127, 1.402787, 0.3151865, 1, 1, 1, 1, 1,
1.860215e-05, -0.5492297, 4.460786, 1, 1, 1, 1, 1,
8.738941e-05, -0.3704163, 1.721679, 1, 1, 1, 1, 1,
0.003240134, -0.1715038, 3.226407, 1, 1, 1, 1, 1,
0.005530786, 0.09204205, 1.64918, 1, 1, 1, 1, 1,
0.006513329, -0.2230537, 3.681129, 1, 1, 1, 1, 1,
0.008565116, 1.637734, 0.172127, 0, 0, 1, 1, 1,
0.01147966, -2.880286, 4.014431, 1, 0, 0, 1, 1,
0.01160785, 1.248007, -0.2165213, 1, 0, 0, 1, 1,
0.01587843, -0.8329962, 2.705514, 1, 0, 0, 1, 1,
0.01625005, 0.6774667, -0.6946024, 1, 0, 0, 1, 1,
0.01837747, -0.1842595, 3.793291, 1, 0, 0, 1, 1,
0.0211823, 0.3890271, 1.432103, 0, 0, 0, 1, 1,
0.02169574, 0.02473075, 1.40358, 0, 0, 0, 1, 1,
0.02336587, 2.308496, 0.04327511, 0, 0, 0, 1, 1,
0.03148146, 1.214935, -0.9135477, 0, 0, 0, 1, 1,
0.03589957, -0.5071701, 2.006744, 0, 0, 0, 1, 1,
0.03879758, 0.8018309, -0.9702466, 0, 0, 0, 1, 1,
0.03942353, -1.494536, 2.708993, 0, 0, 0, 1, 1,
0.04227279, -0.4628369, 2.385378, 1, 1, 1, 1, 1,
0.04382293, -1.346898, 1.639279, 1, 1, 1, 1, 1,
0.04550418, 0.1793188, -0.5855237, 1, 1, 1, 1, 1,
0.04993029, -1.482072, 3.361537, 1, 1, 1, 1, 1,
0.05140587, -0.6790864, 2.024064, 1, 1, 1, 1, 1,
0.06065109, -1.243789, 1.792618, 1, 1, 1, 1, 1,
0.0637163, 0.2041847, 0.3292201, 1, 1, 1, 1, 1,
0.06419516, -0.2258196, 3.614878, 1, 1, 1, 1, 1,
0.06740858, 1.436561, 0.7417542, 1, 1, 1, 1, 1,
0.0677553, -0.8354923, 1.677923, 1, 1, 1, 1, 1,
0.06936386, 0.2812772, 0.4965414, 1, 1, 1, 1, 1,
0.07117151, -0.4094004, 3.131322, 1, 1, 1, 1, 1,
0.07189674, -0.2646669, 0.4296587, 1, 1, 1, 1, 1,
0.07312436, 1.987014, 0.3130818, 1, 1, 1, 1, 1,
0.07419097, -0.3733073, 2.488244, 1, 1, 1, 1, 1,
0.07765315, -0.8539045, 4.437089, 0, 0, 1, 1, 1,
0.07833105, 1.620633, 1.392651, 1, 0, 0, 1, 1,
0.08424195, 1.756346, -0.2928351, 1, 0, 0, 1, 1,
0.08598122, 0.4821079, 1.296326, 1, 0, 0, 1, 1,
0.08776161, 0.6921751, -0.6408139, 1, 0, 0, 1, 1,
0.08797466, 0.2540353, 0.7415802, 1, 0, 0, 1, 1,
0.08973381, 1.0989, -1.480992, 0, 0, 0, 1, 1,
0.09039823, 0.2957135, 1.316748, 0, 0, 0, 1, 1,
0.09540121, 0.8011904, -0.7372082, 0, 0, 0, 1, 1,
0.09541334, 0.6839481, 0.05685597, 0, 0, 0, 1, 1,
0.09576382, 1.358773, -0.001894547, 0, 0, 0, 1, 1,
0.09636397, -0.2502927, 4.312667, 0, 0, 0, 1, 1,
0.09678958, -0.8245175, 1.905375, 0, 0, 0, 1, 1,
0.09747157, 1.296744, 0.588998, 1, 1, 1, 1, 1,
0.1041715, 1.559333, 0.5227661, 1, 1, 1, 1, 1,
0.1043252, 1.759844, 0.6702681, 1, 1, 1, 1, 1,
0.1045383, 1.675483, -0.3544786, 1, 1, 1, 1, 1,
0.1054009, -0.8753589, 3.721916, 1, 1, 1, 1, 1,
0.1067702, -0.9491898, 2.823352, 1, 1, 1, 1, 1,
0.1069099, 0.3388979, 0.08279515, 1, 1, 1, 1, 1,
0.1137861, 1.6677, -0.1034807, 1, 1, 1, 1, 1,
0.113814, -0.3663194, 3.695346, 1, 1, 1, 1, 1,
0.114138, 0.5781528, 2.243619, 1, 1, 1, 1, 1,
0.1141447, -0.521208, 2.509887, 1, 1, 1, 1, 1,
0.1152291, -0.287708, 2.731283, 1, 1, 1, 1, 1,
0.1163359, 1.121589, 1.062745, 1, 1, 1, 1, 1,
0.1193308, -0.9032978, 4.390656, 1, 1, 1, 1, 1,
0.1206477, 0.6678186, -0.4184292, 1, 1, 1, 1, 1,
0.1215964, -0.8739721, 2.334087, 0, 0, 1, 1, 1,
0.1227362, -0.6584946, 3.587772, 1, 0, 0, 1, 1,
0.1229478, -0.8606651, 1.54321, 1, 0, 0, 1, 1,
0.1329048, -0.6130134, 3.907156, 1, 0, 0, 1, 1,
0.1339603, -1.630921, 3.966055, 1, 0, 0, 1, 1,
0.1366773, -0.1615291, 1.966127, 1, 0, 0, 1, 1,
0.1392691, -1.007315, 4.829498, 0, 0, 0, 1, 1,
0.1399861, -1.28259, 1.495513, 0, 0, 0, 1, 1,
0.1416129, -0.9629511, 3.496633, 0, 0, 0, 1, 1,
0.1471905, -0.03692119, 2.20933, 0, 0, 0, 1, 1,
0.1497968, 1.807669, -0.2083873, 0, 0, 0, 1, 1,
0.1500802, 0.4317296, -0.3741, 0, 0, 0, 1, 1,
0.1542075, -0.6075991, 5.181887, 0, 0, 0, 1, 1,
0.1600558, -0.9361001, 3.866476, 1, 1, 1, 1, 1,
0.1610856, 1.818923, -0.3259433, 1, 1, 1, 1, 1,
0.1620562, -0.6308089, 3.724816, 1, 1, 1, 1, 1,
0.1635668, -0.1113927, 1.799523, 1, 1, 1, 1, 1,
0.165896, -0.9732749, 2.543743, 1, 1, 1, 1, 1,
0.1681256, 0.7219906, -0.04852013, 1, 1, 1, 1, 1,
0.1684003, 0.4441184, -1.454445, 1, 1, 1, 1, 1,
0.1719457, 1.32047, 1.207894, 1, 1, 1, 1, 1,
0.1722757, -0.1879774, 2.11096, 1, 1, 1, 1, 1,
0.172615, 0.02516895, 1.202783, 1, 1, 1, 1, 1,
0.1742703, 1.21832, -0.1862745, 1, 1, 1, 1, 1,
0.1792246, 1.754081, -1.318816, 1, 1, 1, 1, 1,
0.1798005, -0.1065723, 2.456746, 1, 1, 1, 1, 1,
0.1809955, -1.642804, 4.645094, 1, 1, 1, 1, 1,
0.1887439, -1.864802, 3.059562, 1, 1, 1, 1, 1,
0.1896042, 1.994684, 2.912551, 0, 0, 1, 1, 1,
0.191059, -0.8020697, 5.400233, 1, 0, 0, 1, 1,
0.1929753, 0.9479647, -0.1345744, 1, 0, 0, 1, 1,
0.1933835, 1.798832, -0.9349661, 1, 0, 0, 1, 1,
0.1976237, -0.7065651, 2.22882, 1, 0, 0, 1, 1,
0.2023848, 0.6458378, 0.4639584, 1, 0, 0, 1, 1,
0.2031965, -0.7962177, 3.306112, 0, 0, 0, 1, 1,
0.2040689, 0.0860353, 0.1411826, 0, 0, 0, 1, 1,
0.2046843, 0.7975955, -0.6323104, 0, 0, 0, 1, 1,
0.2129972, -0.2902386, 3.875271, 0, 0, 0, 1, 1,
0.2137104, 0.7525575, -0.7856066, 0, 0, 0, 1, 1,
0.214947, -0.3379031, 2.833658, 0, 0, 0, 1, 1,
0.2218729, 0.4198531, 1.962593, 0, 0, 0, 1, 1,
0.2248625, 0.3712545, 0.4177859, 1, 1, 1, 1, 1,
0.2262996, -1.244047, 3.523207, 1, 1, 1, 1, 1,
0.2272363, -0.02679117, 0.8633117, 1, 1, 1, 1, 1,
0.2277679, 0.5423382, 0.3507843, 1, 1, 1, 1, 1,
0.2296414, 1.120271, -0.8733282, 1, 1, 1, 1, 1,
0.2315856, -0.9893498, 2.331319, 1, 1, 1, 1, 1,
0.2416134, 0.7446484, 1.505253, 1, 1, 1, 1, 1,
0.2425091, 0.03937529, 0.1578459, 1, 1, 1, 1, 1,
0.2431351, 0.3804885, -0.5970677, 1, 1, 1, 1, 1,
0.2475763, -0.07622853, 2.03447, 1, 1, 1, 1, 1,
0.251003, 0.9455889, 0.04869553, 1, 1, 1, 1, 1,
0.2580906, -0.09895213, 2.124176, 1, 1, 1, 1, 1,
0.2583703, 0.4688642, 1.04929, 1, 1, 1, 1, 1,
0.2686678, 0.3431975, 1.73545, 1, 1, 1, 1, 1,
0.2709676, -0.3695155, 1.148886, 1, 1, 1, 1, 1,
0.2730096, 1.802427, -1.183198, 0, 0, 1, 1, 1,
0.2753691, 0.2540257, 0.7064771, 1, 0, 0, 1, 1,
0.2776098, 1.530759, 0.8073542, 1, 0, 0, 1, 1,
0.2846638, -0.3240057, 1.954373, 1, 0, 0, 1, 1,
0.2882161, -0.6035841, 3.947267, 1, 0, 0, 1, 1,
0.2901438, 0.791775, 2.573413, 1, 0, 0, 1, 1,
0.2914961, 0.2548669, -1.294135, 0, 0, 0, 1, 1,
0.3014319, -1.041007, 2.450117, 0, 0, 0, 1, 1,
0.3056473, 0.3675998, 1.01479, 0, 0, 0, 1, 1,
0.315405, -0.6352105, 1.196675, 0, 0, 0, 1, 1,
0.3169351, 0.2744106, 0.9684687, 0, 0, 0, 1, 1,
0.3170652, 0.8036889, 0.02252718, 0, 0, 0, 1, 1,
0.3206533, -0.1299359, 1.1199, 0, 0, 0, 1, 1,
0.322534, 0.7200762, 1.906775, 1, 1, 1, 1, 1,
0.3283491, 0.2144961, 1.355535, 1, 1, 1, 1, 1,
0.3347623, -2.290973, 4.416749, 1, 1, 1, 1, 1,
0.3431543, -1.222328, 1.181929, 1, 1, 1, 1, 1,
0.3465849, -1.94028, 5.216576, 1, 1, 1, 1, 1,
0.3497237, -0.01411162, 1.674503, 1, 1, 1, 1, 1,
0.363196, -1.146893, 2.801639, 1, 1, 1, 1, 1,
0.3635677, -2.063243, 1.811708, 1, 1, 1, 1, 1,
0.3636218, 0.1362838, 1.150802, 1, 1, 1, 1, 1,
0.3639696, -0.05471646, 2.638494, 1, 1, 1, 1, 1,
0.3645279, -0.5353044, 3.153352, 1, 1, 1, 1, 1,
0.3727662, 1.184591, -0.7628093, 1, 1, 1, 1, 1,
0.3790797, 0.4763086, 0.6799669, 1, 1, 1, 1, 1,
0.3792612, 0.9825802, -0.1700188, 1, 1, 1, 1, 1,
0.380187, 0.1549352, 0.8969522, 1, 1, 1, 1, 1,
0.3824361, 0.40003, 0.9877127, 0, 0, 1, 1, 1,
0.3852669, 0.2621794, 0.2406926, 1, 0, 0, 1, 1,
0.3886308, -0.4229764, 3.112794, 1, 0, 0, 1, 1,
0.3903496, -0.1423183, 3.122482, 1, 0, 0, 1, 1,
0.3911732, 1.134926, 1.174106, 1, 0, 0, 1, 1,
0.3965149, -0.1338868, 2.651641, 1, 0, 0, 1, 1,
0.4018886, 0.8512457, 1.968289, 0, 0, 0, 1, 1,
0.4022781, 0.8872411, 0.3329166, 0, 0, 0, 1, 1,
0.4068961, -0.6016405, 0.9049935, 0, 0, 0, 1, 1,
0.4070776, -1.005098, 3.44482, 0, 0, 0, 1, 1,
0.4077325, -0.8090207, 3.427599, 0, 0, 0, 1, 1,
0.4094196, 1.915884, 0.5280544, 0, 0, 0, 1, 1,
0.4157128, -0.09782581, 3.087523, 0, 0, 0, 1, 1,
0.4169467, 0.2294968, -0.8239182, 1, 1, 1, 1, 1,
0.4185356, 0.2411579, 2.594634, 1, 1, 1, 1, 1,
0.4186405, -1.405843, 4.871364, 1, 1, 1, 1, 1,
0.4232354, 0.1073989, 0.674838, 1, 1, 1, 1, 1,
0.4233209, -0.7170541, 3.380164, 1, 1, 1, 1, 1,
0.4237879, -0.9867714, 2.020947, 1, 1, 1, 1, 1,
0.4246827, 1.755885, 0.9508362, 1, 1, 1, 1, 1,
0.4271398, 0.4378847, -0.7515615, 1, 1, 1, 1, 1,
0.4280179, -0.3564904, 2.21646, 1, 1, 1, 1, 1,
0.4283862, -0.1544323, 2.749871, 1, 1, 1, 1, 1,
0.4291681, -1.679562, 3.371788, 1, 1, 1, 1, 1,
0.4328231, -1.761184, 2.058842, 1, 1, 1, 1, 1,
0.4363334, 0.4123503, 0.07189338, 1, 1, 1, 1, 1,
0.4379866, -0.632036, 3.207141, 1, 1, 1, 1, 1,
0.4397457, 1.7768, -1.048756, 1, 1, 1, 1, 1,
0.4419164, -0.1878077, 2.032911, 0, 0, 1, 1, 1,
0.4487714, -0.8195144, 2.71024, 1, 0, 0, 1, 1,
0.4505534, 0.3544764, -0.8472912, 1, 0, 0, 1, 1,
0.4557767, 0.7086302, 1.001854, 1, 0, 0, 1, 1,
0.4582858, 1.846251, -1.899481, 1, 0, 0, 1, 1,
0.4584837, -0.1039724, 1.510966, 1, 0, 0, 1, 1,
0.4628204, 0.5428296, -0.9613333, 0, 0, 0, 1, 1,
0.4660444, 0.8113019, 1.337492, 0, 0, 0, 1, 1,
0.4661754, -1.599162, 2.852567, 0, 0, 0, 1, 1,
0.4686324, 0.1332688, 1.686952, 0, 0, 0, 1, 1,
0.4719989, -2.056943, 1.621343, 0, 0, 0, 1, 1,
0.4740937, 0.1065056, 1.323146, 0, 0, 0, 1, 1,
0.478218, 0.1791479, 0.5346592, 0, 0, 0, 1, 1,
0.4789003, -0.6440761, 4.199649, 1, 1, 1, 1, 1,
0.4810855, -0.6194449, 2.906565, 1, 1, 1, 1, 1,
0.4820118, -0.0919328, 0.5245721, 1, 1, 1, 1, 1,
0.4842492, -0.7684324, 2.871962, 1, 1, 1, 1, 1,
0.4876954, -0.03736038, 1.322571, 1, 1, 1, 1, 1,
0.4887656, -0.6131132, 2.339963, 1, 1, 1, 1, 1,
0.4888437, 0.9761522, 0.07708558, 1, 1, 1, 1, 1,
0.4894339, -1.031243, 2.321399, 1, 1, 1, 1, 1,
0.4970367, 1.186364, 0.5269877, 1, 1, 1, 1, 1,
0.5022307, -0.6606569, 2.159916, 1, 1, 1, 1, 1,
0.5163158, -0.4092412, 3.105226, 1, 1, 1, 1, 1,
0.5178221, -0.1169407, 3.312959, 1, 1, 1, 1, 1,
0.5233102, -0.6137958, 3.966395, 1, 1, 1, 1, 1,
0.5281779, 0.7340763, 1.736123, 1, 1, 1, 1, 1,
0.5290595, -1.592066, 3.320857, 1, 1, 1, 1, 1,
0.5300338, 0.2893293, -0.2099224, 0, 0, 1, 1, 1,
0.5307585, -0.4921114, 3.519219, 1, 0, 0, 1, 1,
0.5313877, 0.4411867, -0.009022482, 1, 0, 0, 1, 1,
0.5342582, -2.0385, 3.518472, 1, 0, 0, 1, 1,
0.5383036, 0.05963296, 2.208534, 1, 0, 0, 1, 1,
0.5408113, -1.421106, 2.030079, 1, 0, 0, 1, 1,
0.5445233, 0.9669637, 0.3376516, 0, 0, 0, 1, 1,
0.546984, 0.4018096, 1.261162, 0, 0, 0, 1, 1,
0.5496649, 0.05322737, 0.967545, 0, 0, 0, 1, 1,
0.5512974, 1.672209, -0.1610216, 0, 0, 0, 1, 1,
0.5517576, -0.9401345, 2.654841, 0, 0, 0, 1, 1,
0.5521578, -0.8241796, 2.237936, 0, 0, 0, 1, 1,
0.5611078, 0.8383321, -0.4202303, 0, 0, 0, 1, 1,
0.5702022, -0.08990356, 3.113323, 1, 1, 1, 1, 1,
0.5723416, 0.3046312, 1.777585, 1, 1, 1, 1, 1,
0.5802961, -0.5914542, 3.992802, 1, 1, 1, 1, 1,
0.5896706, -0.5277509, 2.882024, 1, 1, 1, 1, 1,
0.5896767, -0.5916858, 1.849462, 1, 1, 1, 1, 1,
0.5950998, 0.162911, 0.7941763, 1, 1, 1, 1, 1,
0.6147402, -1.243075, 3.428998, 1, 1, 1, 1, 1,
0.6191044, 1.210598, 0.6149602, 1, 1, 1, 1, 1,
0.6215279, 1.874009, 1.369156, 1, 1, 1, 1, 1,
0.6258623, -0.4654955, 1.338084, 1, 1, 1, 1, 1,
0.6274835, 1.581333, -0.06589005, 1, 1, 1, 1, 1,
0.631198, 1.704362, 1.939035, 1, 1, 1, 1, 1,
0.6355167, -0.6709408, 5.242096, 1, 1, 1, 1, 1,
0.6356363, 2.793549, -1.058894, 1, 1, 1, 1, 1,
0.6425548, 0.7541462, 1.677966, 1, 1, 1, 1, 1,
0.6523859, -0.5133425, 1.608776, 0, 0, 1, 1, 1,
0.661788, 0.696843, 1.114056, 1, 0, 0, 1, 1,
0.6635077, 0.05833936, 0.7889698, 1, 0, 0, 1, 1,
0.6670651, 0.2167048, -0.06692713, 1, 0, 0, 1, 1,
0.6690283, 0.2219383, 1.017571, 1, 0, 0, 1, 1,
0.6710168, -2.815155, 2.039719, 1, 0, 0, 1, 1,
0.674269, 0.2630565, -0.7710235, 0, 0, 0, 1, 1,
0.6788579, 1.198499, 1.598866, 0, 0, 0, 1, 1,
0.6818938, -1.562816, 2.334519, 0, 0, 0, 1, 1,
0.686523, -0.1159424, 3.896285, 0, 0, 0, 1, 1,
0.6894553, 0.5342339, 3.452283, 0, 0, 0, 1, 1,
0.6894891, -0.881942, 1.780613, 0, 0, 0, 1, 1,
0.6913824, -1.117478, 3.775959, 0, 0, 0, 1, 1,
0.6947491, -0.542585, 1.973016, 1, 1, 1, 1, 1,
0.7005017, -1.720434, 4.546339, 1, 1, 1, 1, 1,
0.7010028, 0.01344548, 1.963199, 1, 1, 1, 1, 1,
0.7047349, -0.789521, 3.255194, 1, 1, 1, 1, 1,
0.7120011, 1.199396, 0.9728982, 1, 1, 1, 1, 1,
0.7153997, -0.998411, 4.196384, 1, 1, 1, 1, 1,
0.7180535, 0.6786438, 1.439034, 1, 1, 1, 1, 1,
0.7241, 1.583726, 0.7635821, 1, 1, 1, 1, 1,
0.7242646, 1.035034, 2.016359, 1, 1, 1, 1, 1,
0.7268174, 2.033499, 0.9301714, 1, 1, 1, 1, 1,
0.7276625, -0.1229929, 3.89627, 1, 1, 1, 1, 1,
0.72943, 0.2774288, 2.522648, 1, 1, 1, 1, 1,
0.735468, 0.2526385, 0.815874, 1, 1, 1, 1, 1,
0.7436081, 0.8016658, -0.7125089, 1, 1, 1, 1, 1,
0.7492515, -0.2871491, 1.75758, 1, 1, 1, 1, 1,
0.7496908, 0.1573732, 0.2848237, 0, 0, 1, 1, 1,
0.7535127, 0.7303616, 0.6813681, 1, 0, 0, 1, 1,
0.7554166, -0.6580164, 2.92827, 1, 0, 0, 1, 1,
0.7557642, -1.129039, 1.638097, 1, 0, 0, 1, 1,
0.7564501, -1.443218, 2.867068, 1, 0, 0, 1, 1,
0.758389, -0.8319138, 2.175141, 1, 0, 0, 1, 1,
0.7604429, -1.323277, 3.782548, 0, 0, 0, 1, 1,
0.7605397, 1.120444, -0.2977414, 0, 0, 0, 1, 1,
0.7605622, -0.9804758, 2.382422, 0, 0, 0, 1, 1,
0.765054, -1.380943, 1.95627, 0, 0, 0, 1, 1,
0.7684116, 0.7178187, 1.472684, 0, 0, 0, 1, 1,
0.7716684, 0.7121794, 1.854722, 0, 0, 0, 1, 1,
0.7720416, -1.413206, 2.705066, 0, 0, 0, 1, 1,
0.7749035, 0.5234372, 0.7231588, 1, 1, 1, 1, 1,
0.7749749, -0.1736673, 2.022632, 1, 1, 1, 1, 1,
0.7766267, -0.3584907, 3.881555, 1, 1, 1, 1, 1,
0.7771364, 0.09022176, 1.967067, 1, 1, 1, 1, 1,
0.777797, 0.1184959, 4.395474, 1, 1, 1, 1, 1,
0.7779469, -1.085136, 2.657062, 1, 1, 1, 1, 1,
0.7816503, -0.5751023, 0.9019743, 1, 1, 1, 1, 1,
0.7832047, -0.5752143, 1.430445, 1, 1, 1, 1, 1,
0.7852673, 0.7887982, 2.262319, 1, 1, 1, 1, 1,
0.7891429, -0.7255943, 2.308786, 1, 1, 1, 1, 1,
0.8007111, 0.3301457, 0.1810823, 1, 1, 1, 1, 1,
0.8009504, 0.3093519, 0.6365758, 1, 1, 1, 1, 1,
0.8029215, 2.447206, -0.2125266, 1, 1, 1, 1, 1,
0.8059635, 0.1169106, 1.289747, 1, 1, 1, 1, 1,
0.8185011, -0.6854851, 0.547344, 1, 1, 1, 1, 1,
0.8214594, 0.02675114, 1.634585, 0, 0, 1, 1, 1,
0.8291366, -1.522663, 3.424179, 1, 0, 0, 1, 1,
0.8316298, -0.08839472, 2.117266, 1, 0, 0, 1, 1,
0.8329467, 1.071485, 0.7043684, 1, 0, 0, 1, 1,
0.8355148, -2.277124, 2.972483, 1, 0, 0, 1, 1,
0.8363381, -2.241194, 2.446357, 1, 0, 0, 1, 1,
0.8374768, 0.7359031, 2.009308, 0, 0, 0, 1, 1,
0.8467851, 0.3142462, 2.691274, 0, 0, 0, 1, 1,
0.8532693, -0.2697675, 0.2429273, 0, 0, 0, 1, 1,
0.8662539, 1.280958, -0.2507192, 0, 0, 0, 1, 1,
0.8691388, -1.472838, 1.572264, 0, 0, 0, 1, 1,
0.8765703, 1.187452, 0.4874625, 0, 0, 0, 1, 1,
0.8789643, 0.3002993, -0.05910774, 0, 0, 0, 1, 1,
0.8824655, -1.910869, 2.425442, 1, 1, 1, 1, 1,
0.8852528, -0.06599828, 2.423424, 1, 1, 1, 1, 1,
0.8873001, -0.8019832, 2.456052, 1, 1, 1, 1, 1,
0.8932947, -0.360461, 2.226741, 1, 1, 1, 1, 1,
0.895945, -1.603395, 0.9418177, 1, 1, 1, 1, 1,
0.8963296, -0.09302127, 1.525417, 1, 1, 1, 1, 1,
0.8987571, 1.41435, 1.275629, 1, 1, 1, 1, 1,
0.9001049, 0.2248121, -0.138443, 1, 1, 1, 1, 1,
0.9037253, -1.019511, 3.748921, 1, 1, 1, 1, 1,
0.9262896, 0.4750994, 0.8219519, 1, 1, 1, 1, 1,
0.927285, 0.08337756, 2.860189, 1, 1, 1, 1, 1,
0.9281245, -0.7514259, 2.451188, 1, 1, 1, 1, 1,
0.9318234, 0.6448057, 0.234751, 1, 1, 1, 1, 1,
0.93375, -0.07847949, 1.803221, 1, 1, 1, 1, 1,
0.934586, -0.9359461, 3.948584, 1, 1, 1, 1, 1,
0.9385993, -1.038887, 2.972099, 0, 0, 1, 1, 1,
0.9405233, 1.419876, 1.380965, 1, 0, 0, 1, 1,
0.9494302, -0.2822637, 1.650437, 1, 0, 0, 1, 1,
0.9617819, -1.116133, 1.782933, 1, 0, 0, 1, 1,
0.9676559, -2.441111, 1.488548, 1, 0, 0, 1, 1,
0.9684457, -0.5885187, 2.380218, 1, 0, 0, 1, 1,
0.973169, 1.685174, -0.182611, 0, 0, 0, 1, 1,
0.9795805, 0.9059061, -0.3268407, 0, 0, 0, 1, 1,
0.9828829, -0.1100644, 0.8692364, 0, 0, 0, 1, 1,
0.9834103, 0.4408092, 1.888973, 0, 0, 0, 1, 1,
0.9880567, 0.3077974, 1.105896, 0, 0, 0, 1, 1,
0.9907702, -0.832436, 3.112143, 0, 0, 0, 1, 1,
0.9991885, -0.6071671, 1.643231, 0, 0, 0, 1, 1,
1.003082, -1.626938, 1.483894, 1, 1, 1, 1, 1,
1.010776, 0.4249935, 0.07969187, 1, 1, 1, 1, 1,
1.017994, 1.833639, 1.471647, 1, 1, 1, 1, 1,
1.019004, -0.03946541, 1.762287, 1, 1, 1, 1, 1,
1.020175, -0.9716858, 1.54367, 1, 1, 1, 1, 1,
1.023623, 0.02526415, 1.008257, 1, 1, 1, 1, 1,
1.026345, -0.5256184, 2.277081, 1, 1, 1, 1, 1,
1.034219, 0.761783, 0.3488783, 1, 1, 1, 1, 1,
1.039924, -0.3868288, -0.002750337, 1, 1, 1, 1, 1,
1.043092, -1.163655, 3.47437, 1, 1, 1, 1, 1,
1.045844, 1.535359, 0.6047158, 1, 1, 1, 1, 1,
1.050862, 0.6925535, 0.7316888, 1, 1, 1, 1, 1,
1.056257, 0.859452, 1.544302, 1, 1, 1, 1, 1,
1.060786, -0.2181819, 1.320704, 1, 1, 1, 1, 1,
1.066764, 0.139965, 0.3692605, 1, 1, 1, 1, 1,
1.070284, -1.034977, 1.719581, 0, 0, 1, 1, 1,
1.075685, 0.6916354, 2.791992, 1, 0, 0, 1, 1,
1.076135, 0.2590179, 1.996788, 1, 0, 0, 1, 1,
1.078496, -0.663646, 1.86509, 1, 0, 0, 1, 1,
1.081276, -0.08949292, 2.696416, 1, 0, 0, 1, 1,
1.088303, -0.04482407, -0.02784326, 1, 0, 0, 1, 1,
1.089308, 0.1396988, 2.901037, 0, 0, 0, 1, 1,
1.098258, 0.3039363, 0.4326047, 0, 0, 0, 1, 1,
1.103148, -0.9366581, 3.187836, 0, 0, 0, 1, 1,
1.111464, -0.6392251, 1.806071, 0, 0, 0, 1, 1,
1.119959, -0.1125784, 2.054405, 0, 0, 0, 1, 1,
1.120904, 0.01084358, 3.035062, 0, 0, 0, 1, 1,
1.121165, 0.8396502, 0.4031335, 0, 0, 0, 1, 1,
1.123125, 1.351325, 1.211397, 1, 1, 1, 1, 1,
1.123421, -2.265061, 2.735378, 1, 1, 1, 1, 1,
1.125981, 0.14709, 1.616371, 1, 1, 1, 1, 1,
1.146292, -0.09198788, 1.830129, 1, 1, 1, 1, 1,
1.148985, -0.6503152, 0.5670708, 1, 1, 1, 1, 1,
1.149306, -0.3455833, -0.0287469, 1, 1, 1, 1, 1,
1.154355, -0.4504171, 2.872307, 1, 1, 1, 1, 1,
1.161856, 0.9858841, 1.277865, 1, 1, 1, 1, 1,
1.166999, 0.3499771, 0.6736316, 1, 1, 1, 1, 1,
1.167341, -1.963583, 1.045522, 1, 1, 1, 1, 1,
1.168236, 0.8967243, 0.7053127, 1, 1, 1, 1, 1,
1.175755, -1.392681, 1.579992, 1, 1, 1, 1, 1,
1.183056, -0.4882606, 1.820955, 1, 1, 1, 1, 1,
1.19358, 1.113121, 0.4405916, 1, 1, 1, 1, 1,
1.203825, 1.350768, 0.6843084, 1, 1, 1, 1, 1,
1.213017, 0.5660349, 0.4095256, 0, 0, 1, 1, 1,
1.213999, 0.08463148, 1.243478, 1, 0, 0, 1, 1,
1.222645, 0.6136262, 2.412881, 1, 0, 0, 1, 1,
1.224704, 0.6785551, 2.263781, 1, 0, 0, 1, 1,
1.230005, -0.5476254, 1.948163, 1, 0, 0, 1, 1,
1.234325, -0.6410203, 2.432411, 1, 0, 0, 1, 1,
1.239833, -0.1377789, -0.4374219, 0, 0, 0, 1, 1,
1.246034, -0.4505208, 2.218422, 0, 0, 0, 1, 1,
1.248062, 2.081233, 0.7835798, 0, 0, 0, 1, 1,
1.249564, -0.3744591, 0.04630103, 0, 0, 0, 1, 1,
1.25285, -0.3918085, 1.39504, 0, 0, 0, 1, 1,
1.259051, 0.7731143, 0.823759, 0, 0, 0, 1, 1,
1.268441, -0.8571259, 2.320941, 0, 0, 0, 1, 1,
1.268455, -0.9556248, 1.120827, 1, 1, 1, 1, 1,
1.272215, -0.2001129, 2.177969, 1, 1, 1, 1, 1,
1.277818, -0.1640413, 3.208098, 1, 1, 1, 1, 1,
1.289178, -0.9230923, 1.465586, 1, 1, 1, 1, 1,
1.296221, 0.7252834, 1.146971, 1, 1, 1, 1, 1,
1.302943, 1.809026, -0.5929493, 1, 1, 1, 1, 1,
1.30884, -0.9563352, 1.732197, 1, 1, 1, 1, 1,
1.31964, -1.046261, 5.024914, 1, 1, 1, 1, 1,
1.323061, 2.959173, -0.2410687, 1, 1, 1, 1, 1,
1.32838, -0.5184313, 1.067524, 1, 1, 1, 1, 1,
1.333927, 0.08022186, 0.44616, 1, 1, 1, 1, 1,
1.337128, 1.002318, 1.078728, 1, 1, 1, 1, 1,
1.337174, -0.9196343, 2.584812, 1, 1, 1, 1, 1,
1.350123, -0.4403251, 2.646968, 1, 1, 1, 1, 1,
1.357579, -0.5375684, 1.585478, 1, 1, 1, 1, 1,
1.360724, 2.129737, 1.580412, 0, 0, 1, 1, 1,
1.365567, 0.7471315, 1.903231, 1, 0, 0, 1, 1,
1.371256, 0.6413698, 0.6865788, 1, 0, 0, 1, 1,
1.378625, -0.4731404, 1.783394, 1, 0, 0, 1, 1,
1.386235, -1.190829, 1.641973, 1, 0, 0, 1, 1,
1.420386, 0.4740873, 2.34666, 1, 0, 0, 1, 1,
1.420685, -1.289587, 1.724048, 0, 0, 0, 1, 1,
1.429496, -0.5577909, 1.651866, 0, 0, 0, 1, 1,
1.442876, 0.866397, 1.629335, 0, 0, 0, 1, 1,
1.451987, 0.8980965, 1.299834, 0, 0, 0, 1, 1,
1.460978, -0.05543975, 1.347308, 0, 0, 0, 1, 1,
1.463598, 0.598537, 1.00327, 0, 0, 0, 1, 1,
1.467559, -1.481, 2.718714, 0, 0, 0, 1, 1,
1.486229, 1.112334, 1.331931, 1, 1, 1, 1, 1,
1.497694, -0.5253384, -1.069402, 1, 1, 1, 1, 1,
1.499774, -0.5464829, 0.4818319, 1, 1, 1, 1, 1,
1.504926, -1.518064, 3.187995, 1, 1, 1, 1, 1,
1.512403, -0.9575076, 2.093513, 1, 1, 1, 1, 1,
1.515067, -0.3136406, 3.173568, 1, 1, 1, 1, 1,
1.516493, -0.2560649, -0.361142, 1, 1, 1, 1, 1,
1.52665, -1.784216, 1.612483, 1, 1, 1, 1, 1,
1.537431, -0.5106153, 2.413016, 1, 1, 1, 1, 1,
1.552763, -0.3805779, 2.731952, 1, 1, 1, 1, 1,
1.567059, -0.5771357, 1.280917, 1, 1, 1, 1, 1,
1.570769, -0.08014728, 2.248716, 1, 1, 1, 1, 1,
1.572159, -0.841279, 1.458159, 1, 1, 1, 1, 1,
1.573834, -0.2850733, 1.077284, 1, 1, 1, 1, 1,
1.575335, 3.172349, 0.157032, 1, 1, 1, 1, 1,
1.615241, 0.5689806, 1.098901, 0, 0, 1, 1, 1,
1.617304, -0.5534916, 2.923748, 1, 0, 0, 1, 1,
1.632658, 0.616455, 1.3826, 1, 0, 0, 1, 1,
1.643773, -1.141878, 1.889337, 1, 0, 0, 1, 1,
1.659097, -0.3298156, 2.148237, 1, 0, 0, 1, 1,
1.671311, -0.3286592, 3.31746, 1, 0, 0, 1, 1,
1.678166, -0.3846672, 0.1113593, 0, 0, 0, 1, 1,
1.683542, 0.8646564, -0.170244, 0, 0, 0, 1, 1,
1.721494, -0.4069527, 2.001731, 0, 0, 0, 1, 1,
1.731847, -0.4251418, 1.990608, 0, 0, 0, 1, 1,
1.73496, -0.4333809, 0.4129546, 0, 0, 0, 1, 1,
1.740541, 1.408613, 0.1951308, 0, 0, 0, 1, 1,
1.75063, 0.7947574, 0.1125791, 0, 0, 0, 1, 1,
1.778677, -0.1343726, -0.3425597, 1, 1, 1, 1, 1,
1.795705, 0.5607132, 1.296997, 1, 1, 1, 1, 1,
1.8075, -1.885925, 2.544943, 1, 1, 1, 1, 1,
1.811586, -0.0662698, 1.401246, 1, 1, 1, 1, 1,
1.817129, -0.8956769, 0.8201014, 1, 1, 1, 1, 1,
1.836213, 1.888635, -0.1593762, 1, 1, 1, 1, 1,
1.836958, 0.8343745, 2.692322, 1, 1, 1, 1, 1,
1.843923, -0.8340824, 2.492839, 1, 1, 1, 1, 1,
1.898856, -0.2679399, 3.260546, 1, 1, 1, 1, 1,
1.906848, 1.005818, 0.4627703, 1, 1, 1, 1, 1,
1.914838, -0.489247, 0.9417767, 1, 1, 1, 1, 1,
1.963433, -0.8134292, 0.2241535, 1, 1, 1, 1, 1,
1.999172, -2.072463, 2.933161, 1, 1, 1, 1, 1,
2.005121, 0.3851822, 2.369839, 1, 1, 1, 1, 1,
2.005264, -1.902897, 2.795747, 1, 1, 1, 1, 1,
2.01772, 0.4591785, 2.969452, 0, 0, 1, 1, 1,
2.022233, -1.002591, 0.4047607, 1, 0, 0, 1, 1,
2.029678, -1.216774, 1.598948, 1, 0, 0, 1, 1,
2.042776, -0.08230369, 2.223301, 1, 0, 0, 1, 1,
2.11112, 2.312879, 0.4407483, 1, 0, 0, 1, 1,
2.122271, 0.09854474, 0.8130276, 1, 0, 0, 1, 1,
2.139383, -1.639678, 3.652331, 0, 0, 0, 1, 1,
2.213016, -0.3475653, 0.7525658, 0, 0, 0, 1, 1,
2.216143, -1.265327, 1.967539, 0, 0, 0, 1, 1,
2.271464, -0.06328409, 1.196111, 0, 0, 0, 1, 1,
2.292264, -0.1536352, 1.939349, 0, 0, 0, 1, 1,
2.304804, -1.181071, 0.7934359, 0, 0, 0, 1, 1,
2.318795, -0.4492899, 1.983187, 0, 0, 0, 1, 1,
2.338198, -0.06267574, -0.6366115, 1, 1, 1, 1, 1,
2.435701, 0.9543076, 3.055836, 1, 1, 1, 1, 1,
2.451604, -0.6891966, 2.252086, 1, 1, 1, 1, 1,
2.475365, -0.9034032, 3.244536, 1, 1, 1, 1, 1,
2.516623, -0.9278226, 4.429847, 1, 1, 1, 1, 1,
2.565476, -1.329657, 1.36617, 1, 1, 1, 1, 1,
3.001829, 1.83343, 1.700616, 1, 1, 1, 1, 1
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
var radius = 9.238928;
var distance = 32.45134;
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
mvMatrix.translate( 0.02302313, -0.1460314, -0.2250443 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.45134);
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
