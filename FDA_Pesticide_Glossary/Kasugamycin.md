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
-2.912787, -0.3495987, -2.404776, 1, 0, 0, 1,
-2.78985, -0.1825027, -1.932148, 1, 0.007843138, 0, 1,
-2.74611, 0.780983, -1.718866, 1, 0.01176471, 0, 1,
-2.744176, 0.08824552, -1.949706, 1, 0.01960784, 0, 1,
-2.645769, -1.816888, -3.436368, 1, 0.02352941, 0, 1,
-2.555321, 0.1491574, -1.872356, 1, 0.03137255, 0, 1,
-2.461681, -0.1606826, -2.493524, 1, 0.03529412, 0, 1,
-2.428052, 1.111211, -0.7371888, 1, 0.04313726, 0, 1,
-2.424453, 1.131876, -2.07461, 1, 0.04705882, 0, 1,
-2.292365, 0.06275246, -1.196872, 1, 0.05490196, 0, 1,
-2.287774, 0.9727169, -1.597486, 1, 0.05882353, 0, 1,
-2.280663, 0.9355685, -1.028746, 1, 0.06666667, 0, 1,
-2.269933, -0.405397, -0.8157514, 1, 0.07058824, 0, 1,
-2.199037, -1.218327, -3.18691, 1, 0.07843138, 0, 1,
-2.196063, 0.1760333, -0.8170717, 1, 0.08235294, 0, 1,
-2.192105, -1.302843, -2.685437, 1, 0.09019608, 0, 1,
-2.176932, -1.378316, -1.980846, 1, 0.09411765, 0, 1,
-2.164629, 0.4251399, -0.5421344, 1, 0.1019608, 0, 1,
-2.161023, 0.7297359, -2.536064, 1, 0.1098039, 0, 1,
-2.156892, 0.2735475, -2.632756, 1, 0.1137255, 0, 1,
-2.145936, -0.6261972, -3.664184, 1, 0.1215686, 0, 1,
-2.143089, -0.3934075, -1.712557, 1, 0.1254902, 0, 1,
-2.081529, -0.06482919, -0.4621791, 1, 0.1333333, 0, 1,
-2.049332, 0.0436401, -2.519613, 1, 0.1372549, 0, 1,
-2.03604, 0.6142059, -1.684665, 1, 0.145098, 0, 1,
-2.009428, 1.273229, 0.45295, 1, 0.1490196, 0, 1,
-1.985097, 0.3572066, -2.041079, 1, 0.1568628, 0, 1,
-1.949796, 1.908551, -1.2271, 1, 0.1607843, 0, 1,
-1.920706, 1.765391, -1.281369, 1, 0.1686275, 0, 1,
-1.903552, 0.7312273, -0.3438408, 1, 0.172549, 0, 1,
-1.902558, -0.9793862, -0.5285956, 1, 0.1803922, 0, 1,
-1.887918, 1.179361, -1.504886, 1, 0.1843137, 0, 1,
-1.886331, -0.7254707, -2.618718, 1, 0.1921569, 0, 1,
-1.88485, 0.4901519, -1.136012, 1, 0.1960784, 0, 1,
-1.869694, 1.329686, -0.2170088, 1, 0.2039216, 0, 1,
-1.867737, 0.549814, -2.78138, 1, 0.2117647, 0, 1,
-1.851182, -0.2310757, -1.644707, 1, 0.2156863, 0, 1,
-1.850203, -0.7072601, -3.256127, 1, 0.2235294, 0, 1,
-1.802608, 0.2769742, -0.2734046, 1, 0.227451, 0, 1,
-1.793456, 0.3352382, -2.367378, 1, 0.2352941, 0, 1,
-1.793285, 0.2820079, -3.121191, 1, 0.2392157, 0, 1,
-1.781853, -0.0759233, -1.705574, 1, 0.2470588, 0, 1,
-1.777638, -1.542732, -1.437284, 1, 0.2509804, 0, 1,
-1.769145, -1.107319, -1.067332, 1, 0.2588235, 0, 1,
-1.764592, -0.5244414, -0.1134386, 1, 0.2627451, 0, 1,
-1.741908, 1.152616, -0.9206292, 1, 0.2705882, 0, 1,
-1.736976, 1.120186, -2.786395, 1, 0.2745098, 0, 1,
-1.730648, 0.4000378, -1.778356, 1, 0.282353, 0, 1,
-1.726219, -1.874371, -1.023052, 1, 0.2862745, 0, 1,
-1.701348, 0.148863, -2.469894, 1, 0.2941177, 0, 1,
-1.699874, 0.8338712, -3.593032, 1, 0.3019608, 0, 1,
-1.69383, -1.26311, -1.230942, 1, 0.3058824, 0, 1,
-1.693798, 0.8620641, -0.179662, 1, 0.3137255, 0, 1,
-1.692509, 0.276149, -2.153343, 1, 0.3176471, 0, 1,
-1.68858, 0.371016, -1.071865, 1, 0.3254902, 0, 1,
-1.677362, 0.6877765, -2.197623, 1, 0.3294118, 0, 1,
-1.674108, -0.7057324, -3.49015, 1, 0.3372549, 0, 1,
-1.66786, 0.8594546, -0.1182284, 1, 0.3411765, 0, 1,
-1.663028, 0.01394276, 0.4268276, 1, 0.3490196, 0, 1,
-1.627297, 1.471865, -0.8999808, 1, 0.3529412, 0, 1,
-1.610626, -0.7770419, -1.178872, 1, 0.3607843, 0, 1,
-1.607309, -0.146741, -2.022587, 1, 0.3647059, 0, 1,
-1.600116, 0.1481847, -1.012585, 1, 0.372549, 0, 1,
-1.593725, 0.3635645, -2.441968, 1, 0.3764706, 0, 1,
-1.588242, -0.7693706, -3.617026, 1, 0.3843137, 0, 1,
-1.582703, 1.51235, -0.2761662, 1, 0.3882353, 0, 1,
-1.574725, -0.7301638, -0.9711357, 1, 0.3960784, 0, 1,
-1.563316, -0.1363556, -2.803959, 1, 0.4039216, 0, 1,
-1.559679, 1.081127, -0.8649417, 1, 0.4078431, 0, 1,
-1.55707, -0.6215723, -2.905046, 1, 0.4156863, 0, 1,
-1.552651, 1.031888, -0.9671531, 1, 0.4196078, 0, 1,
-1.542958, -0.09733012, -0.8371191, 1, 0.427451, 0, 1,
-1.524114, 0.7719467, -2.379823, 1, 0.4313726, 0, 1,
-1.518125, 0.1442583, 0.5191143, 1, 0.4392157, 0, 1,
-1.516008, 1.304548, -1.419982, 1, 0.4431373, 0, 1,
-1.510412, -1.032145, -2.800884, 1, 0.4509804, 0, 1,
-1.50906, 0.9508205, -1.117189, 1, 0.454902, 0, 1,
-1.508991, 0.006223935, -0.2597131, 1, 0.4627451, 0, 1,
-1.505959, -0.4498113, -3.014905, 1, 0.4666667, 0, 1,
-1.499788, 0.7304142, -0.3939216, 1, 0.4745098, 0, 1,
-1.478314, -0.7231306, -1.04825, 1, 0.4784314, 0, 1,
-1.477262, 1.854109, 0.7636762, 1, 0.4862745, 0, 1,
-1.459307, -0.603946, -0.808875, 1, 0.4901961, 0, 1,
-1.448508, 0.808467, -1.084049, 1, 0.4980392, 0, 1,
-1.441155, 0.4305963, 0.3752597, 1, 0.5058824, 0, 1,
-1.44072, 0.4740932, -2.370244, 1, 0.509804, 0, 1,
-1.43594, 0.5471681, -0.8357084, 1, 0.5176471, 0, 1,
-1.431394, -0.3795514, -1.986289, 1, 0.5215687, 0, 1,
-1.426456, 2.460392, 0.1069283, 1, 0.5294118, 0, 1,
-1.420812, -0.7630298, -1.927221, 1, 0.5333334, 0, 1,
-1.410281, -0.6466627, -3.383431, 1, 0.5411765, 0, 1,
-1.397696, 0.1761254, -4.922952, 1, 0.5450981, 0, 1,
-1.387786, -0.4569087, -3.064891, 1, 0.5529412, 0, 1,
-1.37531, 0.7383366, -2.941289, 1, 0.5568628, 0, 1,
-1.374352, -1.90247, -2.994803, 1, 0.5647059, 0, 1,
-1.368331, -0.1884418, -2.184042, 1, 0.5686275, 0, 1,
-1.366328, 0.001991078, -1.500182, 1, 0.5764706, 0, 1,
-1.360159, -2.076138, -1.792033, 1, 0.5803922, 0, 1,
-1.356767, -1.690144, -1.833509, 1, 0.5882353, 0, 1,
-1.354159, 0.2293971, -2.652547, 1, 0.5921569, 0, 1,
-1.350996, 1.385355, -1.014321, 1, 0.6, 0, 1,
-1.348861, -1.570144, -1.737736, 1, 0.6078432, 0, 1,
-1.340817, -0.2185071, -1.774259, 1, 0.6117647, 0, 1,
-1.339392, 0.7936618, -0.724538, 1, 0.6196079, 0, 1,
-1.33598, 0.5952283, -0.03239878, 1, 0.6235294, 0, 1,
-1.335155, -0.2058622, -0.6739691, 1, 0.6313726, 0, 1,
-1.333284, 0.0572624, -1.288231, 1, 0.6352941, 0, 1,
-1.327333, 0.173214, -2.582606, 1, 0.6431373, 0, 1,
-1.323259, 1.121871, 0.1944431, 1, 0.6470588, 0, 1,
-1.317503, 1.116141, 0.7591261, 1, 0.654902, 0, 1,
-1.314984, -0.1793365, -1.868038, 1, 0.6588235, 0, 1,
-1.312091, 1.760937, -0.4162381, 1, 0.6666667, 0, 1,
-1.307394, 0.6888344, -2.638017, 1, 0.6705883, 0, 1,
-1.305753, 1.038924, -1.004799, 1, 0.6784314, 0, 1,
-1.305674, 0.8858403, -0.9211302, 1, 0.682353, 0, 1,
-1.305442, -0.2063002, -2.753359, 1, 0.6901961, 0, 1,
-1.303515, -0.06519284, -2.367865, 1, 0.6941177, 0, 1,
-1.295628, 0.8740644, -1.414117, 1, 0.7019608, 0, 1,
-1.283124, 0.3540038, -2.413268, 1, 0.7098039, 0, 1,
-1.279831, -0.2963648, -1.400876, 1, 0.7137255, 0, 1,
-1.268552, 0.1165313, -3.341233, 1, 0.7215686, 0, 1,
-1.245094, -0.1494289, -0.016476, 1, 0.7254902, 0, 1,
-1.238732, 0.4332117, -2.008876, 1, 0.7333333, 0, 1,
-1.227618, -0.6825339, -1.400896, 1, 0.7372549, 0, 1,
-1.222645, 0.6168315, -2.685317, 1, 0.7450981, 0, 1,
-1.221865, 1.892066, -1.783859, 1, 0.7490196, 0, 1,
-1.210917, -0.02563969, -2.87048, 1, 0.7568628, 0, 1,
-1.198297, -1.043579, -2.313533, 1, 0.7607843, 0, 1,
-1.192542, 1.751375, 0.1951088, 1, 0.7686275, 0, 1,
-1.186736, -1.89676, -2.456981, 1, 0.772549, 0, 1,
-1.158939, -0.3117358, -0.6584685, 1, 0.7803922, 0, 1,
-1.150782, 0.1140778, -2.169212, 1, 0.7843137, 0, 1,
-1.147299, -1.017143, -3.565443, 1, 0.7921569, 0, 1,
-1.138921, 0.2261465, -2.542177, 1, 0.7960784, 0, 1,
-1.137842, 0.5260904, 0.07252972, 1, 0.8039216, 0, 1,
-1.135742, 1.067176, -0.9999778, 1, 0.8117647, 0, 1,
-1.134079, 0.001135146, -2.077064, 1, 0.8156863, 0, 1,
-1.128623, -1.655859, -2.325303, 1, 0.8235294, 0, 1,
-1.12755, -0.05369832, -0.1842615, 1, 0.827451, 0, 1,
-1.119667, 0.4836297, -2.186995, 1, 0.8352941, 0, 1,
-1.09894, 1.029569, 1.840995, 1, 0.8392157, 0, 1,
-1.097888, 0.1252324, -0.1663752, 1, 0.8470588, 0, 1,
-1.095724, -0.5669595, -0.9859771, 1, 0.8509804, 0, 1,
-1.08944, -0.2526026, -3.650291, 1, 0.8588235, 0, 1,
-1.080191, 0.8248492, 0.2811938, 1, 0.8627451, 0, 1,
-1.079911, -0.2856162, -3.895891, 1, 0.8705882, 0, 1,
-1.073814, 0.6852853, -1.772256, 1, 0.8745098, 0, 1,
-1.070359, -0.2241984, -1.922422, 1, 0.8823529, 0, 1,
-1.065354, 1.480502, 0.2467692, 1, 0.8862745, 0, 1,
-1.062312, -1.847624, -1.677532, 1, 0.8941177, 0, 1,
-1.060981, 0.426081, -2.611475, 1, 0.8980392, 0, 1,
-1.054081, -0.2261913, -3.170182, 1, 0.9058824, 0, 1,
-1.048545, -0.9101282, -2.851925, 1, 0.9137255, 0, 1,
-1.044627, -1.18534, -1.980305, 1, 0.9176471, 0, 1,
-1.041195, 1.245462, -1.485192, 1, 0.9254902, 0, 1,
-1.037645, -0.1977161, -0.4704973, 1, 0.9294118, 0, 1,
-1.031401, -0.4010662, -1.219377, 1, 0.9372549, 0, 1,
-1.023942, -0.7189638, -2.856114, 1, 0.9411765, 0, 1,
-1.020249, 0.9460068, -1.373597, 1, 0.9490196, 0, 1,
-1.016247, -0.3657894, -4.21881, 1, 0.9529412, 0, 1,
-1.015512, -0.0526799, -1.138587, 1, 0.9607843, 0, 1,
-1.006336, 0.1029456, 0.9029195, 1, 0.9647059, 0, 1,
-1.00477, -0.05021808, -1.532879, 1, 0.972549, 0, 1,
-0.9948531, 2.96633, -1.743275, 1, 0.9764706, 0, 1,
-0.982274, -2.225091, -3.638749, 1, 0.9843137, 0, 1,
-0.9742742, -0.2297361, -2.249856, 1, 0.9882353, 0, 1,
-0.9713935, 1.159003, -1.622879, 1, 0.9960784, 0, 1,
-0.9682371, 0.7283647, -2.290933, 0.9960784, 1, 0, 1,
-0.9669378, 0.924479, -0.3785562, 0.9921569, 1, 0, 1,
-0.9653105, 0.7763051, 0.04123218, 0.9843137, 1, 0, 1,
-0.9619994, 0.4278912, -1.631913, 0.9803922, 1, 0, 1,
-0.9614747, -0.9196199, -2.923693, 0.972549, 1, 0, 1,
-0.9577952, -0.8354384, -2.275688, 0.9686275, 1, 0, 1,
-0.9569024, 0.1163549, -2.018932, 0.9607843, 1, 0, 1,
-0.9555672, -1.51773, -2.662747, 0.9568627, 1, 0, 1,
-0.9525412, 0.2166425, -0.732425, 0.9490196, 1, 0, 1,
-0.949006, -0.4221696, -1.05206, 0.945098, 1, 0, 1,
-0.946343, -1.185951, -2.449691, 0.9372549, 1, 0, 1,
-0.9396294, -0.06718893, -1.479156, 0.9333333, 1, 0, 1,
-0.9365925, 0.1780488, -0.6635235, 0.9254902, 1, 0, 1,
-0.9364607, -1.858673, -1.623221, 0.9215686, 1, 0, 1,
-0.9328476, -0.6971887, -1.629467, 0.9137255, 1, 0, 1,
-0.9303914, 1.102516, 0.6907537, 0.9098039, 1, 0, 1,
-0.9260669, 0.1339155, -0.8752846, 0.9019608, 1, 0, 1,
-0.9243068, -1.130084, -1.72647, 0.8941177, 1, 0, 1,
-0.9230095, 0.5804688, -3.395113, 0.8901961, 1, 0, 1,
-0.9222662, -0.100683, -1.079078, 0.8823529, 1, 0, 1,
-0.9180288, -2.353758, -2.532342, 0.8784314, 1, 0, 1,
-0.9180008, 1.49291, -0.6475677, 0.8705882, 1, 0, 1,
-0.917965, 0.4386976, -1.162154, 0.8666667, 1, 0, 1,
-0.9174064, -1.190496, -2.05597, 0.8588235, 1, 0, 1,
-0.9121681, 0.5620736, -2.063024, 0.854902, 1, 0, 1,
-0.9087158, 0.3786011, -0.8890812, 0.8470588, 1, 0, 1,
-0.899275, 0.8122403, -1.019991, 0.8431373, 1, 0, 1,
-0.8932284, -0.4107503, -1.117793, 0.8352941, 1, 0, 1,
-0.8913609, -0.4918558, -3.572671, 0.8313726, 1, 0, 1,
-0.8908097, -0.4370428, -2.927026, 0.8235294, 1, 0, 1,
-0.8875936, 0.01466902, -2.043423, 0.8196079, 1, 0, 1,
-0.882661, -1.60599, -3.76925, 0.8117647, 1, 0, 1,
-0.8794847, -0.4244006, -0.5830695, 0.8078431, 1, 0, 1,
-0.8789553, 0.4980152, -2.363624, 0.8, 1, 0, 1,
-0.8751141, -0.739913, -2.398096, 0.7921569, 1, 0, 1,
-0.8736934, 1.039775, -0.6250094, 0.7882353, 1, 0, 1,
-0.8711814, 0.7116737, -3.185555, 0.7803922, 1, 0, 1,
-0.8683059, -1.941821, -1.203187, 0.7764706, 1, 0, 1,
-0.8676343, -0.2099027, -0.6162309, 0.7686275, 1, 0, 1,
-0.8662552, -1.246764, -1.491336, 0.7647059, 1, 0, 1,
-0.8656113, 0.7785959, -1.314529, 0.7568628, 1, 0, 1,
-0.857897, -0.4660054, -2.18261, 0.7529412, 1, 0, 1,
-0.8564032, 0.6066229, -2.481455, 0.7450981, 1, 0, 1,
-0.8561039, -1.72284, -3.645988, 0.7411765, 1, 0, 1,
-0.8517323, 0.6962602, -0.8225396, 0.7333333, 1, 0, 1,
-0.8481846, 1.635756, 0.2258361, 0.7294118, 1, 0, 1,
-0.8476864, -1.131405, -4.262579, 0.7215686, 1, 0, 1,
-0.8476692, -0.0759052, -1.313634, 0.7176471, 1, 0, 1,
-0.8473485, -0.01459628, -1.29772, 0.7098039, 1, 0, 1,
-0.8443454, 1.415238, -1.665944, 0.7058824, 1, 0, 1,
-0.8384278, 0.06813475, -1.944208, 0.6980392, 1, 0, 1,
-0.8380232, -1.058428, -3.173662, 0.6901961, 1, 0, 1,
-0.8288157, -0.1883077, -1.99463, 0.6862745, 1, 0, 1,
-0.8284469, 0.9158022, -1.059391, 0.6784314, 1, 0, 1,
-0.8284169, -1.112669, -1.719401, 0.6745098, 1, 0, 1,
-0.8183445, -1.282979, -2.610376, 0.6666667, 1, 0, 1,
-0.8097484, 1.805907, -0.6436227, 0.6627451, 1, 0, 1,
-0.8091964, -0.6102181, -2.396315, 0.654902, 1, 0, 1,
-0.8075532, -0.3741032, -2.530555, 0.6509804, 1, 0, 1,
-0.8054709, -0.1723928, -2.332461, 0.6431373, 1, 0, 1,
-0.8043138, -1.078073, -2.173649, 0.6392157, 1, 0, 1,
-0.8012946, -1.872363, -1.42455, 0.6313726, 1, 0, 1,
-0.8004286, -0.4849724, -2.225296, 0.627451, 1, 0, 1,
-0.7976473, -0.464105, -1.011165, 0.6196079, 1, 0, 1,
-0.79229, 0.5826192, -1.385759, 0.6156863, 1, 0, 1,
-0.7852951, 0.962022, 0.7882948, 0.6078432, 1, 0, 1,
-0.7850558, 0.002389346, -2.212332, 0.6039216, 1, 0, 1,
-0.7844836, -1.43471, -2.698848, 0.5960785, 1, 0, 1,
-0.7843291, 1.153921, -0.3965687, 0.5882353, 1, 0, 1,
-0.782791, 1.647675, -0.196722, 0.5843138, 1, 0, 1,
-0.7744603, -1.215793, -2.075551, 0.5764706, 1, 0, 1,
-0.7705842, -0.7967871, -2.04294, 0.572549, 1, 0, 1,
-0.7695063, -0.6207232, -2.664428, 0.5647059, 1, 0, 1,
-0.7594776, -0.8345728, -1.758863, 0.5607843, 1, 0, 1,
-0.7556401, -0.5649979, -1.989102, 0.5529412, 1, 0, 1,
-0.7514623, 1.261209, 0.7797086, 0.5490196, 1, 0, 1,
-0.7501735, -0.4804381, -2.226977, 0.5411765, 1, 0, 1,
-0.7457209, 1.075504, -0.8253518, 0.5372549, 1, 0, 1,
-0.7450864, -0.5764536, -1.513385, 0.5294118, 1, 0, 1,
-0.7447175, 0.6602401, 0.3042504, 0.5254902, 1, 0, 1,
-0.7428851, -1.244847, -5.727259, 0.5176471, 1, 0, 1,
-0.7425451, -1.536119, -3.335744, 0.5137255, 1, 0, 1,
-0.7392287, -1.778198, -2.583873, 0.5058824, 1, 0, 1,
-0.7375553, 0.6209123, -0.8607835, 0.5019608, 1, 0, 1,
-0.7344207, 0.4762059, -0.8354735, 0.4941176, 1, 0, 1,
-0.733631, 0.1757584, -0.5350108, 0.4862745, 1, 0, 1,
-0.7332271, 3.302871, -0.8752739, 0.4823529, 1, 0, 1,
-0.7315181, -1.632011, -1.822344, 0.4745098, 1, 0, 1,
-0.731186, -0.5155768, -1.952249, 0.4705882, 1, 0, 1,
-0.7302907, 0.0601967, -2.51181, 0.4627451, 1, 0, 1,
-0.7281797, -1.107631, -2.504265, 0.4588235, 1, 0, 1,
-0.7249113, 0.8943433, -0.4104498, 0.4509804, 1, 0, 1,
-0.724763, 1.396387, -0.7191195, 0.4470588, 1, 0, 1,
-0.7228191, -0.1000794, -2.166289, 0.4392157, 1, 0, 1,
-0.7172426, 1.715949, -0.9492779, 0.4352941, 1, 0, 1,
-0.7165605, 1.875916, 0.05326728, 0.427451, 1, 0, 1,
-0.715867, 1.266957, -0.09002978, 0.4235294, 1, 0, 1,
-0.7137364, -0.2761153, -0.2736824, 0.4156863, 1, 0, 1,
-0.7121105, -0.1879911, -1.385428, 0.4117647, 1, 0, 1,
-0.7025455, 1.002794, 0.9745408, 0.4039216, 1, 0, 1,
-0.6941607, -1.444746, -4.505842, 0.3960784, 1, 0, 1,
-0.6793113, 1.156375, -1.032193, 0.3921569, 1, 0, 1,
-0.674282, -0.5570267, -2.287707, 0.3843137, 1, 0, 1,
-0.6727189, 0.6948478, -0.740658, 0.3803922, 1, 0, 1,
-0.667459, -0.4113621, -1.75717, 0.372549, 1, 0, 1,
-0.6634445, -0.9175047, -1.829121, 0.3686275, 1, 0, 1,
-0.6629294, 0.9123445, -1.322707, 0.3607843, 1, 0, 1,
-0.6610289, -0.2497665, -3.425309, 0.3568628, 1, 0, 1,
-0.6487681, 0.2436047, -1.082954, 0.3490196, 1, 0, 1,
-0.6397134, -0.8419359, -0.9062217, 0.345098, 1, 0, 1,
-0.6375307, 2.053039, -0.2527964, 0.3372549, 1, 0, 1,
-0.6366174, 0.4903038, 0.9395658, 0.3333333, 1, 0, 1,
-0.6272581, 0.8700573, -2.206254, 0.3254902, 1, 0, 1,
-0.6183559, 1.018015, -0.9913172, 0.3215686, 1, 0, 1,
-0.6161041, -0.1215318, -1.877168, 0.3137255, 1, 0, 1,
-0.60839, -0.1240321, -1.266774, 0.3098039, 1, 0, 1,
-0.6037241, -1.379504, -1.6099, 0.3019608, 1, 0, 1,
-0.6024277, 0.7066545, 0.4559381, 0.2941177, 1, 0, 1,
-0.5984747, 0.3479105, -1.981983, 0.2901961, 1, 0, 1,
-0.5978633, -0.4146931, -1.051996, 0.282353, 1, 0, 1,
-0.5955834, 1.258722, -0.9445096, 0.2784314, 1, 0, 1,
-0.5953842, -0.1006843, -2.350397, 0.2705882, 1, 0, 1,
-0.5924966, 0.05526254, -1.953776, 0.2666667, 1, 0, 1,
-0.585453, -0.4527193, -2.389437, 0.2588235, 1, 0, 1,
-0.5764615, 0.6764988, 0.6959258, 0.254902, 1, 0, 1,
-0.5740067, 0.8519092, -0.08571544, 0.2470588, 1, 0, 1,
-0.5736342, 1.022408, -0.708196, 0.2431373, 1, 0, 1,
-0.5706248, 0.5639817, -0.6508589, 0.2352941, 1, 0, 1,
-0.5683109, 0.4576843, -1.435096, 0.2313726, 1, 0, 1,
-0.5680851, 0.3569396, -2.875089, 0.2235294, 1, 0, 1,
-0.5676281, 0.5081711, -0.6394488, 0.2196078, 1, 0, 1,
-0.566586, -1.035897, -3.025913, 0.2117647, 1, 0, 1,
-0.5631308, -0.04611008, -2.65454, 0.2078431, 1, 0, 1,
-0.5566587, 0.828624, -2.24788, 0.2, 1, 0, 1,
-0.5521831, 0.4216497, -0.6000888, 0.1921569, 1, 0, 1,
-0.5503461, -0.4661728, -1.820715, 0.1882353, 1, 0, 1,
-0.5499121, -0.7711579, -3.168084, 0.1803922, 1, 0, 1,
-0.5498629, 0.3843692, -1.357061, 0.1764706, 1, 0, 1,
-0.548437, 2.055501, -0.01536673, 0.1686275, 1, 0, 1,
-0.545601, 0.1990454, -0.8322202, 0.1647059, 1, 0, 1,
-0.5359727, -1.616751, -3.340593, 0.1568628, 1, 0, 1,
-0.5354306, 0.8384186, -1.511832, 0.1529412, 1, 0, 1,
-0.5318526, 1.026809, -1.276765, 0.145098, 1, 0, 1,
-0.5288464, 1.57306, -1.649553, 0.1411765, 1, 0, 1,
-0.5277821, -0.4496657, -1.721684, 0.1333333, 1, 0, 1,
-0.5223011, -0.1452425, -1.808137, 0.1294118, 1, 0, 1,
-0.5202041, -0.1068984, -0.2684816, 0.1215686, 1, 0, 1,
-0.5187126, -1.308463, -2.675716, 0.1176471, 1, 0, 1,
-0.5123899, 1.535946, 0.187629, 0.1098039, 1, 0, 1,
-0.5091821, 1.329244, -0.9506407, 0.1058824, 1, 0, 1,
-0.5014268, -0.9515468, -1.558024, 0.09803922, 1, 0, 1,
-0.5006896, -0.5491539, -2.896418, 0.09019608, 1, 0, 1,
-0.4999524, 0.6503295, 0.9206637, 0.08627451, 1, 0, 1,
-0.4987509, 0.3831546, -1.518064, 0.07843138, 1, 0, 1,
-0.4957038, -1.581859, -3.609838, 0.07450981, 1, 0, 1,
-0.495066, -0.2345556, -3.147134, 0.06666667, 1, 0, 1,
-0.4907834, -1.592164, -3.065193, 0.0627451, 1, 0, 1,
-0.4903639, 0.01957402, -0.8779986, 0.05490196, 1, 0, 1,
-0.4900881, 1.056765, 0.03657082, 0.05098039, 1, 0, 1,
-0.4896709, -1.038568, -2.578198, 0.04313726, 1, 0, 1,
-0.4864815, -1.564231, -2.870642, 0.03921569, 1, 0, 1,
-0.4860106, -1.938664, -3.192976, 0.03137255, 1, 0, 1,
-0.4824528, -0.5952519, -1.96954, 0.02745098, 1, 0, 1,
-0.4813805, 1.71116, -0.1320976, 0.01960784, 1, 0, 1,
-0.478752, 1.705802, -0.1122961, 0.01568628, 1, 0, 1,
-0.4755381, -0.3381003, -2.730643, 0.007843138, 1, 0, 1,
-0.4707773, -0.1452039, -2.287771, 0.003921569, 1, 0, 1,
-0.468422, 1.255589, -0.4272048, 0, 1, 0.003921569, 1,
-0.4637607, 1.068283, -1.011922, 0, 1, 0.01176471, 1,
-0.4588071, 0.2314584, -1.516031, 0, 1, 0.01568628, 1,
-0.457294, 0.5882007, -0.5464699, 0, 1, 0.02352941, 1,
-0.4559593, -0.3582357, -3.461379, 0, 1, 0.02745098, 1,
-0.4547676, -0.7070329, -2.500971, 0, 1, 0.03529412, 1,
-0.4510635, -0.8305398, -2.655347, 0, 1, 0.03921569, 1,
-0.450046, -0.7842787, -2.633934, 0, 1, 0.04705882, 1,
-0.4473257, -0.6921766, -4.679551, 0, 1, 0.05098039, 1,
-0.4457338, -0.06920113, -2.706525, 0, 1, 0.05882353, 1,
-0.4424039, 0.8910117, 0.6868196, 0, 1, 0.0627451, 1,
-0.4339465, 1.235675, 0.1869059, 0, 1, 0.07058824, 1,
-0.4332692, -1.135562, -1.397964, 0, 1, 0.07450981, 1,
-0.4286704, -0.1650236, -3.149739, 0, 1, 0.08235294, 1,
-0.4253615, -0.1531105, -3.407474, 0, 1, 0.08627451, 1,
-0.4252047, 0.99912, 0.9774622, 0, 1, 0.09411765, 1,
-0.4232008, 1.763418, -0.8212293, 0, 1, 0.1019608, 1,
-0.4199632, 0.4298822, -0.8227323, 0, 1, 0.1058824, 1,
-0.4191259, 1.317761, 0.05021146, 0, 1, 0.1137255, 1,
-0.4143934, 0.4564613, -0.9950083, 0, 1, 0.1176471, 1,
-0.4113341, -1.197362, -3.382429, 0, 1, 0.1254902, 1,
-0.410599, 0.4466374, -1.871008, 0, 1, 0.1294118, 1,
-0.4098776, -1.417877, -2.474231, 0, 1, 0.1372549, 1,
-0.4078349, -2.058735, -3.892977, 0, 1, 0.1411765, 1,
-0.4046332, -0.932613, -3.964943, 0, 1, 0.1490196, 1,
-0.3983311, 0.9128312, -1.39193, 0, 1, 0.1529412, 1,
-0.3953319, 0.733326, -0.1430822, 0, 1, 0.1607843, 1,
-0.3936188, 0.1271102, -1.784505, 0, 1, 0.1647059, 1,
-0.3925188, 0.5492868, -0.3389726, 0, 1, 0.172549, 1,
-0.3916573, -1.126605, -3.334972, 0, 1, 0.1764706, 1,
-0.3869427, -0.6382568, -3.215296, 0, 1, 0.1843137, 1,
-0.3851179, -1.470783, -2.573576, 0, 1, 0.1882353, 1,
-0.3829965, -1.484195, -3.229331, 0, 1, 0.1960784, 1,
-0.3790555, 1.155843, -1.371727, 0, 1, 0.2039216, 1,
-0.3784218, 0.1609863, -0.8986945, 0, 1, 0.2078431, 1,
-0.3777263, -0.1443447, -2.580795, 0, 1, 0.2156863, 1,
-0.3766878, 0.4011312, -1.473386, 0, 1, 0.2196078, 1,
-0.3747085, 0.3417026, -0.5837705, 0, 1, 0.227451, 1,
-0.3724927, 0.5048203, -1.601666, 0, 1, 0.2313726, 1,
-0.3722948, -0.4554765, -2.461625, 0, 1, 0.2392157, 1,
-0.370355, -1.065874, -4.457205, 0, 1, 0.2431373, 1,
-0.3698073, -0.4154205, -2.161557, 0, 1, 0.2509804, 1,
-0.3693532, -0.3979735, -1.871361, 0, 1, 0.254902, 1,
-0.3633365, 1.569096, 1.373048, 0, 1, 0.2627451, 1,
-0.3613586, -0.2686389, -2.995683, 0, 1, 0.2666667, 1,
-0.3588407, 1.699268, -0.2088098, 0, 1, 0.2745098, 1,
-0.352399, 0.2606811, 0.2872463, 0, 1, 0.2784314, 1,
-0.3505533, 0.2405986, -1.447708, 0, 1, 0.2862745, 1,
-0.347589, -0.3998321, -2.552464, 0, 1, 0.2901961, 1,
-0.3417929, 2.073469, -0.6031399, 0, 1, 0.2980392, 1,
-0.3369804, -1.013343, -5.57897, 0, 1, 0.3058824, 1,
-0.332955, 0.6098847, -0.7088439, 0, 1, 0.3098039, 1,
-0.3329347, 0.728076, -0.1752401, 0, 1, 0.3176471, 1,
-0.3316045, 0.1291008, -1.170361, 0, 1, 0.3215686, 1,
-0.3301544, -0.1177883, -1.041935, 0, 1, 0.3294118, 1,
-0.3209905, -1.296278, -1.78277, 0, 1, 0.3333333, 1,
-0.319061, 0.08799799, 0.3611726, 0, 1, 0.3411765, 1,
-0.3113133, -0.2123643, -1.6608, 0, 1, 0.345098, 1,
-0.2972259, -0.1982968, -1.997273, 0, 1, 0.3529412, 1,
-0.2961667, 0.8851927, -2.78201, 0, 1, 0.3568628, 1,
-0.2946604, -1.071865, -4.355867, 0, 1, 0.3647059, 1,
-0.2754788, -0.8426313, -3.380123, 0, 1, 0.3686275, 1,
-0.2750317, 1.583824, 0.3898033, 0, 1, 0.3764706, 1,
-0.2724433, 0.8337907, 0.9598214, 0, 1, 0.3803922, 1,
-0.2695752, -0.3797365, -3.427336, 0, 1, 0.3882353, 1,
-0.2627294, -0.2325416, -2.704968, 0, 1, 0.3921569, 1,
-0.2544192, -0.02717005, -1.342242, 0, 1, 0.4, 1,
-0.254063, -0.5883611, -3.232028, 0, 1, 0.4078431, 1,
-0.25345, 0.3958972, 0.3108626, 0, 1, 0.4117647, 1,
-0.2475454, 1.097504, -0.9997697, 0, 1, 0.4196078, 1,
-0.2458121, 0.4420409, -0.4368804, 0, 1, 0.4235294, 1,
-0.2430901, 0.7259248, 0.7126729, 0, 1, 0.4313726, 1,
-0.2427001, 1.531056, -2.333341, 0, 1, 0.4352941, 1,
-0.2419206, 0.1139138, -0.2539668, 0, 1, 0.4431373, 1,
-0.2415204, -0.1624259, -1.648621, 0, 1, 0.4470588, 1,
-0.2306567, 1.101049, 0.8768426, 0, 1, 0.454902, 1,
-0.2301799, -1.226836, -2.739226, 0, 1, 0.4588235, 1,
-0.229164, -1.699207, -2.961792, 0, 1, 0.4666667, 1,
-0.2262171, 0.08006313, -0.3704467, 0, 1, 0.4705882, 1,
-0.2251268, -1.800473, -4.568532, 0, 1, 0.4784314, 1,
-0.2216226, -0.2784687, -2.396171, 0, 1, 0.4823529, 1,
-0.2198431, -0.6020927, -3.391321, 0, 1, 0.4901961, 1,
-0.2178959, -0.9061297, -3.554713, 0, 1, 0.4941176, 1,
-0.2100775, -0.5478365, -2.165523, 0, 1, 0.5019608, 1,
-0.2069198, -1.813194, -4.230576, 0, 1, 0.509804, 1,
-0.2016575, -0.5684893, -3.429991, 0, 1, 0.5137255, 1,
-0.1958927, -0.8436089, -3.42417, 0, 1, 0.5215687, 1,
-0.1938523, 0.2529306, -2.10021, 0, 1, 0.5254902, 1,
-0.1927031, 0.05549942, -0.8698353, 0, 1, 0.5333334, 1,
-0.1907698, -0.692058, -3.497463, 0, 1, 0.5372549, 1,
-0.1905013, -0.2399173, -2.687347, 0, 1, 0.5450981, 1,
-0.1879508, -1.53103, -2.213509, 0, 1, 0.5490196, 1,
-0.1870702, 0.2048073, -1.243633, 0, 1, 0.5568628, 1,
-0.1847497, -0.9457855, -2.607081, 0, 1, 0.5607843, 1,
-0.1801535, 0.2438633, -1.306646, 0, 1, 0.5686275, 1,
-0.1789623, -1.393679, -3.008335, 0, 1, 0.572549, 1,
-0.1783849, 0.9568731, 0.4278327, 0, 1, 0.5803922, 1,
-0.1759895, 0.4605096, -2.136455, 0, 1, 0.5843138, 1,
-0.1743197, 0.698447, -1.323857, 0, 1, 0.5921569, 1,
-0.1704038, -0.8375811, -2.373817, 0, 1, 0.5960785, 1,
-0.156377, -0.1040981, -0.3465238, 0, 1, 0.6039216, 1,
-0.1557371, -1.101154, -2.869407, 0, 1, 0.6117647, 1,
-0.1513962, 0.7306007, -0.5842814, 0, 1, 0.6156863, 1,
-0.1513008, 0.04542598, -1.191671, 0, 1, 0.6235294, 1,
-0.1460883, 2.039029, -0.8653116, 0, 1, 0.627451, 1,
-0.145161, 0.413719, -0.6482291, 0, 1, 0.6352941, 1,
-0.1440358, -0.3386844, -3.659167, 0, 1, 0.6392157, 1,
-0.1434381, -0.2440204, -2.277728, 0, 1, 0.6470588, 1,
-0.1423422, 0.6908562, 0.1203178, 0, 1, 0.6509804, 1,
-0.1402177, -0.2722783, -3.512903, 0, 1, 0.6588235, 1,
-0.1393124, 1.133021, -1.576769, 0, 1, 0.6627451, 1,
-0.1381603, 0.2214415, -1.161558, 0, 1, 0.6705883, 1,
-0.138031, 0.3755116, -1.242361, 0, 1, 0.6745098, 1,
-0.1341432, 0.2249745, 0.4733352, 0, 1, 0.682353, 1,
-0.1337865, 0.08299194, -2.480713, 0, 1, 0.6862745, 1,
-0.1335815, -0.3963767, -2.60366, 0, 1, 0.6941177, 1,
-0.1332246, 0.4872936, 0.9874285, 0, 1, 0.7019608, 1,
-0.1235138, -0.2754577, -3.057666, 0, 1, 0.7058824, 1,
-0.1178268, -0.4841407, -2.945076, 0, 1, 0.7137255, 1,
-0.1172653, 0.01816207, -2.861833, 0, 1, 0.7176471, 1,
-0.1146548, 1.829495, -0.59248, 0, 1, 0.7254902, 1,
-0.1143247, -0.9514465, -3.492624, 0, 1, 0.7294118, 1,
-0.1045657, 1.23366, 0.540717, 0, 1, 0.7372549, 1,
-0.102748, -1.056543, -4.556511, 0, 1, 0.7411765, 1,
-0.09949744, 0.7671176, 0.1936712, 0, 1, 0.7490196, 1,
-0.09949504, 0.282048, 0.6499771, 0, 1, 0.7529412, 1,
-0.09083761, 0.5503281, -0.8257853, 0, 1, 0.7607843, 1,
-0.09077284, -1.346859, -3.626543, 0, 1, 0.7647059, 1,
-0.08989596, -0.6840949, -3.017132, 0, 1, 0.772549, 1,
-0.08809105, -1.582331, -3.32885, 0, 1, 0.7764706, 1,
-0.08448683, 0.8022812, 1.408606, 0, 1, 0.7843137, 1,
-0.08425429, -2.042187, -2.616228, 0, 1, 0.7882353, 1,
-0.07944882, 0.5722834, 0.8132458, 0, 1, 0.7960784, 1,
-0.07727478, -0.6310468, -2.535641, 0, 1, 0.8039216, 1,
-0.07230871, -0.3532855, -3.440833, 0, 1, 0.8078431, 1,
-0.0710598, 1.741815, -0.446126, 0, 1, 0.8156863, 1,
-0.07079732, 0.200867, 0.9942063, 0, 1, 0.8196079, 1,
-0.06981312, -0.1487821, -2.714086, 0, 1, 0.827451, 1,
-0.06352837, -2.238335, -4.586246, 0, 1, 0.8313726, 1,
-0.06083681, 0.4479741, -1.35609, 0, 1, 0.8392157, 1,
-0.05991086, -0.07030973, -2.648775, 0, 1, 0.8431373, 1,
-0.05707061, 0.2092882, 0.2140566, 0, 1, 0.8509804, 1,
-0.05619416, 0.8462297, -0.274493, 0, 1, 0.854902, 1,
-0.05263373, -0.2016294, -5.301097, 0, 1, 0.8627451, 1,
-0.05227894, 0.5114913, -1.649181, 0, 1, 0.8666667, 1,
-0.05081327, -1.303151, -3.692547, 0, 1, 0.8745098, 1,
-0.04219618, 1.186621, -0.5265353, 0, 1, 0.8784314, 1,
-0.0403421, -1.125026, -3.232907, 0, 1, 0.8862745, 1,
-0.03456037, 0.4836639, 0.469927, 0, 1, 0.8901961, 1,
-0.03395098, -0.09475148, -3.116625, 0, 1, 0.8980392, 1,
-0.03241282, -1.138241, -4.087502, 0, 1, 0.9058824, 1,
-0.03189272, -0.8761941, -1.355955, 0, 1, 0.9098039, 1,
-0.02764206, -0.4839255, -2.162707, 0, 1, 0.9176471, 1,
-0.02592206, 1.727952, 1.777269, 0, 1, 0.9215686, 1,
-0.02321105, -1.076161, -2.74724, 0, 1, 0.9294118, 1,
-0.02151474, 0.6336692, -2.408316, 0, 1, 0.9333333, 1,
-0.02086777, 0.6916311, 0.2367905, 0, 1, 0.9411765, 1,
-0.02064866, 0.7600216, -0.5375369, 0, 1, 0.945098, 1,
-0.01974866, -0.09240701, -2.935963, 0, 1, 0.9529412, 1,
-0.01693184, 1.928824, -0.6269655, 0, 1, 0.9568627, 1,
-0.01644806, 0.516849, 2.418645, 0, 1, 0.9647059, 1,
-0.01055114, -0.6759288, -3.427176, 0, 1, 0.9686275, 1,
-0.008451053, -0.4048094, -2.357544, 0, 1, 0.9764706, 1,
-0.007900236, 0.8773518, 0.4183496, 0, 1, 0.9803922, 1,
-0.00787987, -1.335217, -3.136173, 0, 1, 0.9882353, 1,
0.002701941, -0.5254852, 1.199201, 0, 1, 0.9921569, 1,
0.006031644, -0.5660139, 5.132742, 0, 1, 1, 1,
0.008980417, 0.3193606, 0.05844733, 0, 0.9921569, 1, 1,
0.009668305, -0.525865, 2.551919, 0, 0.9882353, 1, 1,
0.009686496, 2.596683, -1.027516, 0, 0.9803922, 1, 1,
0.01080769, -1.984823, 1.95887, 0, 0.9764706, 1, 1,
0.01386828, -0.8011548, 0.4317861, 0, 0.9686275, 1, 1,
0.01422681, 1.359938, 1.401555, 0, 0.9647059, 1, 1,
0.01486138, 0.3498578, 0.3004763, 0, 0.9568627, 1, 1,
0.01505251, 1.736102, 0.4066088, 0, 0.9529412, 1, 1,
0.01721544, 0.4099338, -0.4834468, 0, 0.945098, 1, 1,
0.01735009, 0.4545182, 0.8749633, 0, 0.9411765, 1, 1,
0.03100834, -0.119349, 2.695609, 0, 0.9333333, 1, 1,
0.03392007, 2.20397, -0.462221, 0, 0.9294118, 1, 1,
0.03633245, -0.794501, 2.668551, 0, 0.9215686, 1, 1,
0.04012467, -0.9340995, 3.0326, 0, 0.9176471, 1, 1,
0.04342702, 1.479746, -0.8625827, 0, 0.9098039, 1, 1,
0.04480983, -0.4524597, 4.009119, 0, 0.9058824, 1, 1,
0.04835719, -1.443304, 3.430606, 0, 0.8980392, 1, 1,
0.04874293, -0.1856741, 1.321874, 0, 0.8901961, 1, 1,
0.04951201, 1.796539, 0.4382503, 0, 0.8862745, 1, 1,
0.05068316, -0.2626943, 2.813468, 0, 0.8784314, 1, 1,
0.06229538, -0.8435805, 2.780504, 0, 0.8745098, 1, 1,
0.06676693, 0.5783139, -0.934454, 0, 0.8666667, 1, 1,
0.06757343, 1.105331, -0.9365509, 0, 0.8627451, 1, 1,
0.06828326, 0.2510213, -0.4475006, 0, 0.854902, 1, 1,
0.06900164, 0.3895658, 2.236308, 0, 0.8509804, 1, 1,
0.07436945, 0.6394858, 0.7363421, 0, 0.8431373, 1, 1,
0.07535364, -0.6205679, 2.875859, 0, 0.8392157, 1, 1,
0.07823364, -2.499362, 3.902626, 0, 0.8313726, 1, 1,
0.08917291, 0.2866905, -0.3744747, 0, 0.827451, 1, 1,
0.08968361, 0.6630403, 0.8387264, 0, 0.8196079, 1, 1,
0.08974256, 2.453403, -1.13918, 0, 0.8156863, 1, 1,
0.09640943, -0.4582454, 1.738838, 0, 0.8078431, 1, 1,
0.09730572, -0.5616636, 3.594637, 0, 0.8039216, 1, 1,
0.1046855, 2.115583, -0.9419661, 0, 0.7960784, 1, 1,
0.1057828, 0.8442705, 1.178937, 0, 0.7882353, 1, 1,
0.1064981, -0.8641383, 2.329717, 0, 0.7843137, 1, 1,
0.1091619, -1.187709, 4.628123, 0, 0.7764706, 1, 1,
0.1141475, 0.6815718, 0.3268434, 0, 0.772549, 1, 1,
0.1208214, -0.2870665, 5.28576, 0, 0.7647059, 1, 1,
0.1239714, -0.6836378, 3.325348, 0, 0.7607843, 1, 1,
0.1249298, 1.825075, -0.8675089, 0, 0.7529412, 1, 1,
0.1258035, -0.5292447, 2.436063, 0, 0.7490196, 1, 1,
0.1282909, -0.7923943, 2.025197, 0, 0.7411765, 1, 1,
0.130742, 0.8156207, 1.071532, 0, 0.7372549, 1, 1,
0.1418189, -0.4210166, 1.616953, 0, 0.7294118, 1, 1,
0.1418571, -0.1466254, 1.349857, 0, 0.7254902, 1, 1,
0.1421662, 1.334031, 0.9133918, 0, 0.7176471, 1, 1,
0.1422932, 0.4996273, -0.9573026, 0, 0.7137255, 1, 1,
0.1423948, 0.9493595, 0.07124451, 0, 0.7058824, 1, 1,
0.1440945, -0.004960123, 0.8442674, 0, 0.6980392, 1, 1,
0.1477649, -1.653569, 3.012436, 0, 0.6941177, 1, 1,
0.1487004, -0.223908, 4.576018, 0, 0.6862745, 1, 1,
0.1512817, 0.1176077, 2.071315, 0, 0.682353, 1, 1,
0.1516995, -0.2428716, 2.866342, 0, 0.6745098, 1, 1,
0.1528263, -0.7069225, 3.393622, 0, 0.6705883, 1, 1,
0.1556625, 1.014578, 1.837113, 0, 0.6627451, 1, 1,
0.1564931, 0.8388184, 0.4970523, 0, 0.6588235, 1, 1,
0.1567035, -1.132529, 4.445318, 0, 0.6509804, 1, 1,
0.1569064, -0.8254585, 3.239868, 0, 0.6470588, 1, 1,
0.1569393, 0.07073629, -0.837545, 0, 0.6392157, 1, 1,
0.1570327, -0.5058702, 3.087774, 0, 0.6352941, 1, 1,
0.1579548, -0.4752562, 3.208942, 0, 0.627451, 1, 1,
0.1588917, -0.3188837, 3.753345, 0, 0.6235294, 1, 1,
0.1589839, 1.30114, -0.194964, 0, 0.6156863, 1, 1,
0.1598369, -0.3168481, 2.472738, 0, 0.6117647, 1, 1,
0.1625451, 2.511119, 0.1980547, 0, 0.6039216, 1, 1,
0.1639442, 1.005666, 0.6417856, 0, 0.5960785, 1, 1,
0.1662416, 0.3852899, 2.125777, 0, 0.5921569, 1, 1,
0.1677063, 0.08466467, 2.212081, 0, 0.5843138, 1, 1,
0.1742855, 0.1093577, 0.04725032, 0, 0.5803922, 1, 1,
0.1744743, 0.4426767, 1.250387, 0, 0.572549, 1, 1,
0.1831519, 0.8910968, 0.6699241, 0, 0.5686275, 1, 1,
0.1836873, -1.604795, 2.658992, 0, 0.5607843, 1, 1,
0.1842035, 0.0491951, 2.552107, 0, 0.5568628, 1, 1,
0.1865524, 1.129585, -1.1626, 0, 0.5490196, 1, 1,
0.1887149, 0.8494605, 1.240987, 0, 0.5450981, 1, 1,
0.1905902, -1.556587, 2.83641, 0, 0.5372549, 1, 1,
0.1906154, -1.240822, 2.737933, 0, 0.5333334, 1, 1,
0.1951749, 0.8363273, 0.176025, 0, 0.5254902, 1, 1,
0.1959939, -0.09016209, 1.911044, 0, 0.5215687, 1, 1,
0.2016762, 0.525014, 1.005313, 0, 0.5137255, 1, 1,
0.2020341, 0.8754024, 0.6356326, 0, 0.509804, 1, 1,
0.2074697, -0.6084895, 2.456469, 0, 0.5019608, 1, 1,
0.2128612, 0.4552171, 0.8288786, 0, 0.4941176, 1, 1,
0.2206919, 0.3648203, -0.4806459, 0, 0.4901961, 1, 1,
0.2222413, 1.369649, 1.028512, 0, 0.4823529, 1, 1,
0.2231036, 0.2962779, 0.6537351, 0, 0.4784314, 1, 1,
0.2232241, -1.117212, 4.077012, 0, 0.4705882, 1, 1,
0.2249857, 1.28488, 1.112018, 0, 0.4666667, 1, 1,
0.2254724, 1.889843, 0.7271834, 0, 0.4588235, 1, 1,
0.2261494, -1.261504, 2.484369, 0, 0.454902, 1, 1,
0.2266159, 0.3653735, 1.049929, 0, 0.4470588, 1, 1,
0.2282612, -0.4376812, 3.357525, 0, 0.4431373, 1, 1,
0.2317967, 0.1473818, 0.9338967, 0, 0.4352941, 1, 1,
0.2331979, -0.7523664, 2.80221, 0, 0.4313726, 1, 1,
0.2358817, 1.49586, -1.49945, 0, 0.4235294, 1, 1,
0.2478122, -0.0181824, 2.013484, 0, 0.4196078, 1, 1,
0.2493063, 2.151191, -0.1887308, 0, 0.4117647, 1, 1,
0.2517515, -0.04656129, 1.94045, 0, 0.4078431, 1, 1,
0.2529465, 0.5191165, -0.6674609, 0, 0.4, 1, 1,
0.2546184, 1.69468, 1.993811, 0, 0.3921569, 1, 1,
0.2616745, 2.122095, 0.300902, 0, 0.3882353, 1, 1,
0.2658542, 1.545566, -0.1487886, 0, 0.3803922, 1, 1,
0.266619, -0.07248588, 2.247314, 0, 0.3764706, 1, 1,
0.2720045, 0.5668514, 0.02442755, 0, 0.3686275, 1, 1,
0.2756242, -1.280487, 3.710344, 0, 0.3647059, 1, 1,
0.2763748, -0.2755724, 2.147168, 0, 0.3568628, 1, 1,
0.2771845, -1.035146, 1.501482, 0, 0.3529412, 1, 1,
0.2775251, -0.278919, 5.571237, 0, 0.345098, 1, 1,
0.2818552, 1.060748, 1.299797, 0, 0.3411765, 1, 1,
0.2826786, 1.01729, 1.371731, 0, 0.3333333, 1, 1,
0.2905876, 0.2404135, 2.296458, 0, 0.3294118, 1, 1,
0.2926149, -0.9239856, 3.022885, 0, 0.3215686, 1, 1,
0.2945502, 0.7734237, 0.7245275, 0, 0.3176471, 1, 1,
0.2990895, -1.709922, 2.368023, 0, 0.3098039, 1, 1,
0.3006359, -0.8860015, 3.773981, 0, 0.3058824, 1, 1,
0.3045132, 0.6197624, 0.1660737, 0, 0.2980392, 1, 1,
0.3067249, -1.338717, 1.706034, 0, 0.2901961, 1, 1,
0.3089144, -0.903788, 5.020069, 0, 0.2862745, 1, 1,
0.3217768, -0.4460189, 3.519272, 0, 0.2784314, 1, 1,
0.3234174, 0.1669769, 1.200723, 0, 0.2745098, 1, 1,
0.3270238, 0.09123572, 1.605288, 0, 0.2666667, 1, 1,
0.3287439, -0.9433252, 2.844486, 0, 0.2627451, 1, 1,
0.333145, 0.9593616, -1.954987, 0, 0.254902, 1, 1,
0.3445972, -0.1118977, 2.056486, 0, 0.2509804, 1, 1,
0.3453331, -0.5381839, 4.283164, 0, 0.2431373, 1, 1,
0.3475996, 0.7754368, 1.666806, 0, 0.2392157, 1, 1,
0.3485387, -0.2781273, 3.998482, 0, 0.2313726, 1, 1,
0.3500358, -0.4224848, 3.467492, 0, 0.227451, 1, 1,
0.3526933, -1.131888, 1.898733, 0, 0.2196078, 1, 1,
0.353431, 0.5668428, 1.892486, 0, 0.2156863, 1, 1,
0.3553844, 0.638733, -0.3806712, 0, 0.2078431, 1, 1,
0.3632143, 1.421236, 0.9269463, 0, 0.2039216, 1, 1,
0.3705783, 0.5294092, 3.954188, 0, 0.1960784, 1, 1,
0.3711909, 0.9722115, 0.3156406, 0, 0.1882353, 1, 1,
0.3778927, -0.4970942, 3.439744, 0, 0.1843137, 1, 1,
0.3819938, -1.906951, 4.081995, 0, 0.1764706, 1, 1,
0.3833108, 1.435516, 1.215561, 0, 0.172549, 1, 1,
0.3884559, -1.065499, 1.795484, 0, 0.1647059, 1, 1,
0.3916693, 0.2180529, 1.161568, 0, 0.1607843, 1, 1,
0.3933236, 0.2555708, 0.8627703, 0, 0.1529412, 1, 1,
0.3939593, -1.486545, 3.171735, 0, 0.1490196, 1, 1,
0.3941321, 0.361699, -0.4488067, 0, 0.1411765, 1, 1,
0.3978148, 1.307156, -1.204185, 0, 0.1372549, 1, 1,
0.3980733, 0.2251791, 0.1994373, 0, 0.1294118, 1, 1,
0.3983791, 0.1606339, 1.366422, 0, 0.1254902, 1, 1,
0.3997696, 1.247876, 1.268357, 0, 0.1176471, 1, 1,
0.4007909, -0.4123513, 1.225956, 0, 0.1137255, 1, 1,
0.40823, 0.315293, 0.8844821, 0, 0.1058824, 1, 1,
0.4158281, 0.8645861, 0.1053088, 0, 0.09803922, 1, 1,
0.4188676, -1.904573, 3.776891, 0, 0.09411765, 1, 1,
0.42644, 0.1079225, 0.6312973, 0, 0.08627451, 1, 1,
0.4357297, -0.4726929, 2.319185, 0, 0.08235294, 1, 1,
0.4416977, 0.5318746, 0.1017815, 0, 0.07450981, 1, 1,
0.4449553, 2.153196, 0.6299143, 0, 0.07058824, 1, 1,
0.4450785, 0.6700963, 3.152418, 0, 0.0627451, 1, 1,
0.4476285, 1.271595, -0.8112767, 0, 0.05882353, 1, 1,
0.4481305, 1.7233, -1.436471, 0, 0.05098039, 1, 1,
0.4484595, -1.138929, 2.785273, 0, 0.04705882, 1, 1,
0.4604418, 0.09379759, -0.8569297, 0, 0.03921569, 1, 1,
0.4615123, -0.7373087, 2.020295, 0, 0.03529412, 1, 1,
0.4632813, -0.001869543, -0.1236755, 0, 0.02745098, 1, 1,
0.467371, -1.84214, 4.595158, 0, 0.02352941, 1, 1,
0.4674312, -0.5971584, 3.364085, 0, 0.01568628, 1, 1,
0.467917, 0.2063531, 1.419179, 0, 0.01176471, 1, 1,
0.4703434, 1.240174, -0.5268976, 0, 0.003921569, 1, 1,
0.4725355, -0.1118755, 2.97817, 0.003921569, 0, 1, 1,
0.4778216, -0.3882755, 1.86303, 0.007843138, 0, 1, 1,
0.4781992, 0.3289306, 0.5377294, 0.01568628, 0, 1, 1,
0.4789867, -0.9287369, 1.359168, 0.01960784, 0, 1, 1,
0.4796738, 0.2048798, 2.716217, 0.02745098, 0, 1, 1,
0.4803676, -0.9379764, 4.063704, 0.03137255, 0, 1, 1,
0.4867914, 0.8468412, 1.439332, 0.03921569, 0, 1, 1,
0.4883877, -0.6766223, 1.101354, 0.04313726, 0, 1, 1,
0.4963955, 0.1186227, 1.484534, 0.05098039, 0, 1, 1,
0.4974119, -0.02511164, 3.127482, 0.05490196, 0, 1, 1,
0.4991153, -0.4538585, 0.9521606, 0.0627451, 0, 1, 1,
0.5030732, 1.834849, -0.6098185, 0.06666667, 0, 1, 1,
0.50433, -0.7435197, 2.844385, 0.07450981, 0, 1, 1,
0.5046282, -1.092988, 1.805014, 0.07843138, 0, 1, 1,
0.5063954, -0.07935452, 2.236473, 0.08627451, 0, 1, 1,
0.5071807, 1.159784, 1.695373, 0.09019608, 0, 1, 1,
0.5091435, -0.8122117, 1.868752, 0.09803922, 0, 1, 1,
0.5106261, 0.9129488, 1.406217, 0.1058824, 0, 1, 1,
0.5130267, 0.4947193, -0.02753477, 0.1098039, 0, 1, 1,
0.5161989, -1.812021, 3.945692, 0.1176471, 0, 1, 1,
0.5165169, 0.6630274, 1.419215, 0.1215686, 0, 1, 1,
0.5266714, 1.178911, 1.411044, 0.1294118, 0, 1, 1,
0.5282667, -0.07581755, 3.410921, 0.1333333, 0, 1, 1,
0.5350414, -0.2496545, 1.630794, 0.1411765, 0, 1, 1,
0.536347, 0.9271552, 1.127654, 0.145098, 0, 1, 1,
0.5376918, 1.153777, -0.1279376, 0.1529412, 0, 1, 1,
0.5441338, -0.2709883, 2.074796, 0.1568628, 0, 1, 1,
0.5441706, -0.2272972, 2.193607, 0.1647059, 0, 1, 1,
0.5452186, 1.058378, 0.5049732, 0.1686275, 0, 1, 1,
0.5468149, -0.07197526, 4.32138, 0.1764706, 0, 1, 1,
0.5504375, 0.4954047, 0.002062743, 0.1803922, 0, 1, 1,
0.5528299, -1.430189, 2.552881, 0.1882353, 0, 1, 1,
0.5541042, 0.2020864, 1.290615, 0.1921569, 0, 1, 1,
0.5567365, -0.5898709, 1.645965, 0.2, 0, 1, 1,
0.5572362, 0.5521963, 0.5942155, 0.2078431, 0, 1, 1,
0.5627824, 0.8639117, 0.1350701, 0.2117647, 0, 1, 1,
0.5642607, 1.371721, -0.785398, 0.2196078, 0, 1, 1,
0.5643913, -0.5862453, 3.406314, 0.2235294, 0, 1, 1,
0.5664682, -0.6329237, 3.153538, 0.2313726, 0, 1, 1,
0.570643, 1.709532, -0.852267, 0.2352941, 0, 1, 1,
0.5756748, 1.455424, -0.3952768, 0.2431373, 0, 1, 1,
0.5788667, 0.7313391, -0.9940915, 0.2470588, 0, 1, 1,
0.5792106, -0.5618725, 1.405376, 0.254902, 0, 1, 1,
0.5800383, -0.6179059, 3.540156, 0.2588235, 0, 1, 1,
0.5853657, -1.14172, 2.005433, 0.2666667, 0, 1, 1,
0.5883402, 1.001039, 0.89798, 0.2705882, 0, 1, 1,
0.5897905, -1.01654, 4.101804, 0.2784314, 0, 1, 1,
0.5909346, -1.685007, 3.347798, 0.282353, 0, 1, 1,
0.5912592, -0.5163538, 1.61128, 0.2901961, 0, 1, 1,
0.5931312, 0.1672277, -0.3753734, 0.2941177, 0, 1, 1,
0.5933841, 0.7140816, -0.5391908, 0.3019608, 0, 1, 1,
0.5946539, -1.552624, 3.041372, 0.3098039, 0, 1, 1,
0.5947158, -0.7577013, 1.020912, 0.3137255, 0, 1, 1,
0.5947292, -0.1786913, -0.04049517, 0.3215686, 0, 1, 1,
0.6126919, -2.326819, 2.967146, 0.3254902, 0, 1, 1,
0.6159381, 0.194015, 1.690932, 0.3333333, 0, 1, 1,
0.6200605, 2.272621, 0.7662493, 0.3372549, 0, 1, 1,
0.6360299, -2.228078, 2.693609, 0.345098, 0, 1, 1,
0.6399586, 1.82618, 1.083323, 0.3490196, 0, 1, 1,
0.6517564, 0.2850307, 2.177667, 0.3568628, 0, 1, 1,
0.6563789, -0.04217914, 1.562418, 0.3607843, 0, 1, 1,
0.6577863, -0.7993099, 1.911551, 0.3686275, 0, 1, 1,
0.6597118, -1.239614, 3.394515, 0.372549, 0, 1, 1,
0.6672835, -0.2317786, 2.294736, 0.3803922, 0, 1, 1,
0.6700992, -0.2622599, 3.666678, 0.3843137, 0, 1, 1,
0.6783924, -1.149651, 1.93001, 0.3921569, 0, 1, 1,
0.6836075, 0.09126507, 2.239637, 0.3960784, 0, 1, 1,
0.6859187, -1.354878, 2.028777, 0.4039216, 0, 1, 1,
0.6881692, 0.6005228, 0.656388, 0.4117647, 0, 1, 1,
0.6883394, 0.6469093, -0.4748052, 0.4156863, 0, 1, 1,
0.6903734, -1.32663, 2.61399, 0.4235294, 0, 1, 1,
0.6934636, -0.05325467, 0.8381768, 0.427451, 0, 1, 1,
0.694868, -0.58854, 2.279226, 0.4352941, 0, 1, 1,
0.6975813, 0.1323072, 0.002203185, 0.4392157, 0, 1, 1,
0.6983321, 0.681435, 1.066039, 0.4470588, 0, 1, 1,
0.6984419, -0.5929028, 1.03586, 0.4509804, 0, 1, 1,
0.7039558, -0.3140726, 0.7007618, 0.4588235, 0, 1, 1,
0.7041726, 0.8384123, 1.329728, 0.4627451, 0, 1, 1,
0.7103923, -0.2534828, 2.473428, 0.4705882, 0, 1, 1,
0.7142424, -0.5816552, 1.332317, 0.4745098, 0, 1, 1,
0.7152689, -0.7298071, 3.204232, 0.4823529, 0, 1, 1,
0.7164257, 1.484925, -0.1335959, 0.4862745, 0, 1, 1,
0.7173388, 0.2346483, 1.404257, 0.4941176, 0, 1, 1,
0.7263286, -0.7949486, 2.435895, 0.5019608, 0, 1, 1,
0.7280378, 0.776562, 0.1758185, 0.5058824, 0, 1, 1,
0.7305766, 1.46112, 0.282365, 0.5137255, 0, 1, 1,
0.7324932, -0.4795858, 1.965528, 0.5176471, 0, 1, 1,
0.7362336, -0.3570672, 0.18707, 0.5254902, 0, 1, 1,
0.7377785, 0.2938174, 1.505175, 0.5294118, 0, 1, 1,
0.738935, 1.234838, 0.6331412, 0.5372549, 0, 1, 1,
0.7410386, -1.255069, 0.4882141, 0.5411765, 0, 1, 1,
0.7419719, 0.2010096, 1.293714, 0.5490196, 0, 1, 1,
0.7493064, 0.7106242, 1.031504, 0.5529412, 0, 1, 1,
0.7607245, 0.04617684, 1.92513, 0.5607843, 0, 1, 1,
0.7717413, 0.8411322, 1.320316, 0.5647059, 0, 1, 1,
0.7731658, 2.22159, 0.4278078, 0.572549, 0, 1, 1,
0.7773572, -1.459745, 1.835569, 0.5764706, 0, 1, 1,
0.7797108, -0.8024662, 4.460683, 0.5843138, 0, 1, 1,
0.7807554, -0.8486551, 2.462315, 0.5882353, 0, 1, 1,
0.7820036, -0.08422914, 2.155632, 0.5960785, 0, 1, 1,
0.7847588, 0.01309518, 2.06051, 0.6039216, 0, 1, 1,
0.7860919, 0.7048708, -2.026982, 0.6078432, 0, 1, 1,
0.7956132, 1.698714, 1.854035, 0.6156863, 0, 1, 1,
0.799123, 2.307663, 1.331825, 0.6196079, 0, 1, 1,
0.7999316, -0.03082169, 0.8903267, 0.627451, 0, 1, 1,
0.8012529, 0.09129855, 0.9544206, 0.6313726, 0, 1, 1,
0.8022138, 0.1505854, 3.218843, 0.6392157, 0, 1, 1,
0.8029221, 0.6433918, 2.970347, 0.6431373, 0, 1, 1,
0.8104788, 0.1199041, 1.292321, 0.6509804, 0, 1, 1,
0.8112842, 0.9943273, 1.041871, 0.654902, 0, 1, 1,
0.813955, 1.515724, 0.0750249, 0.6627451, 0, 1, 1,
0.8225545, -0.02553904, 2.461258, 0.6666667, 0, 1, 1,
0.8304319, -1.387841, 0.08965672, 0.6745098, 0, 1, 1,
0.8389882, -0.450874, 1.469571, 0.6784314, 0, 1, 1,
0.8395551, -0.2404893, 4.0595, 0.6862745, 0, 1, 1,
0.8401626, 0.3990861, 3.331376, 0.6901961, 0, 1, 1,
0.8405193, -0.8984858, 2.174744, 0.6980392, 0, 1, 1,
0.840827, -2.960618, 2.852441, 0.7058824, 0, 1, 1,
0.8452546, 0.2096708, 1.177936, 0.7098039, 0, 1, 1,
0.8499519, 0.408603, 1.735292, 0.7176471, 0, 1, 1,
0.850404, 0.6238331, -0.2290565, 0.7215686, 0, 1, 1,
0.8506467, 0.1095994, 2.237087, 0.7294118, 0, 1, 1,
0.8579179, -1.262833, 2.525718, 0.7333333, 0, 1, 1,
0.8584598, -1.852008, 2.680672, 0.7411765, 0, 1, 1,
0.8605146, -0.6211131, 1.661012, 0.7450981, 0, 1, 1,
0.8625168, 1.543787, 2.016456, 0.7529412, 0, 1, 1,
0.8629614, -0.05613853, 1.242514, 0.7568628, 0, 1, 1,
0.8713621, 0.9153318, -1.56666, 0.7647059, 0, 1, 1,
0.8875456, 0.12891, 1.784401, 0.7686275, 0, 1, 1,
0.892696, 0.7174805, 1.241663, 0.7764706, 0, 1, 1,
0.8930785, 1.499746, 0.9411222, 0.7803922, 0, 1, 1,
0.8931679, 0.2935367, 0.6701471, 0.7882353, 0, 1, 1,
0.894309, -1.238396, 1.67802, 0.7921569, 0, 1, 1,
0.8943411, -0.7598677, 2.940992, 0.8, 0, 1, 1,
0.9016284, -1.127026, 1.788241, 0.8078431, 0, 1, 1,
0.901948, -0.1549838, 1.945818, 0.8117647, 0, 1, 1,
0.9020147, 1.454817, -0.1364471, 0.8196079, 0, 1, 1,
0.907876, -1.331655, 1.208211, 0.8235294, 0, 1, 1,
0.9093575, 1.142436, -0.6268464, 0.8313726, 0, 1, 1,
0.9114631, -1.030885, 3.250651, 0.8352941, 0, 1, 1,
0.9121103, 0.3796028, 1.468463, 0.8431373, 0, 1, 1,
0.9129878, 1.512405, 0.04101093, 0.8470588, 0, 1, 1,
0.9134421, -1.222241, 2.527586, 0.854902, 0, 1, 1,
0.9139274, -0.7986268, 2.572607, 0.8588235, 0, 1, 1,
0.9221213, 0.8320825, 2.555351, 0.8666667, 0, 1, 1,
0.9257952, 0.7266224, 2.204135, 0.8705882, 0, 1, 1,
0.9277381, -0.7710899, 2.451394, 0.8784314, 0, 1, 1,
0.9357311, 0.2803165, 1.596695, 0.8823529, 0, 1, 1,
0.9477734, -0.2267579, 1.923878, 0.8901961, 0, 1, 1,
0.9500437, 0.3053482, 1.277204, 0.8941177, 0, 1, 1,
0.9524859, 0.607887, 3.496616, 0.9019608, 0, 1, 1,
0.9556, -0.4343216, 2.278467, 0.9098039, 0, 1, 1,
0.9578738, 1.34976, 0.07006206, 0.9137255, 0, 1, 1,
0.9590208, 0.1997293, 3.0281, 0.9215686, 0, 1, 1,
0.9628297, -0.4270521, 3.211459, 0.9254902, 0, 1, 1,
0.9629855, -0.2383921, 2.310617, 0.9333333, 0, 1, 1,
0.9643451, -1.284284, 2.002342, 0.9372549, 0, 1, 1,
0.9667713, 1.359125, 1.117901, 0.945098, 0, 1, 1,
0.9672174, 1.707393, -0.5855349, 0.9490196, 0, 1, 1,
0.9788166, -1.458575, 2.089959, 0.9568627, 0, 1, 1,
0.9919243, -0.1081251, 1.47208, 0.9607843, 0, 1, 1,
1.008732, 0.07358401, 2.567087, 0.9686275, 0, 1, 1,
1.014293, -1.02686, 2.365835, 0.972549, 0, 1, 1,
1.01488, 0.7305894, 1.508862, 0.9803922, 0, 1, 1,
1.017818, 0.4746336, 1.152768, 0.9843137, 0, 1, 1,
1.018861, -0.4714467, 3.04208, 0.9921569, 0, 1, 1,
1.021773, 0.1581866, 2.813427, 0.9960784, 0, 1, 1,
1.024798, -0.4316732, 1.282032, 1, 0, 0.9960784, 1,
1.032501, 0.02867821, 2.249168, 1, 0, 0.9882353, 1,
1.039084, -0.8918405, 3.440305, 1, 0, 0.9843137, 1,
1.043186, 0.6362737, -1.576971, 1, 0, 0.9764706, 1,
1.043849, 0.2390202, 1.777932, 1, 0, 0.972549, 1,
1.044338, -1.139488, 0.9771701, 1, 0, 0.9647059, 1,
1.044932, -0.6016471, 0.8891512, 1, 0, 0.9607843, 1,
1.045945, -2.285195, 3.043717, 1, 0, 0.9529412, 1,
1.055605, -0.7541015, 3.906968, 1, 0, 0.9490196, 1,
1.06191, 1.453365, 0.5213463, 1, 0, 0.9411765, 1,
1.065804, 0.6354966, 0.04361962, 1, 0, 0.9372549, 1,
1.068453, -0.2830432, 2.844034, 1, 0, 0.9294118, 1,
1.068988, 0.6756829, -0.2915223, 1, 0, 0.9254902, 1,
1.076658, -0.2226113, 1.148148, 1, 0, 0.9176471, 1,
1.085597, 1.173821, -0.2714881, 1, 0, 0.9137255, 1,
1.086988, 1.621068, 1.329644, 1, 0, 0.9058824, 1,
1.092177, 0.6221538, 1.393516, 1, 0, 0.9019608, 1,
1.0949, -1.374021, 2.121093, 1, 0, 0.8941177, 1,
1.095331, 0.6281205, 0.8041244, 1, 0, 0.8862745, 1,
1.096495, 0.487043, 0.1331697, 1, 0, 0.8823529, 1,
1.099724, -0.3913659, 3.105872, 1, 0, 0.8745098, 1,
1.100066, -1.459798, 0.6265749, 1, 0, 0.8705882, 1,
1.107851, -0.1437502, 1.84938, 1, 0, 0.8627451, 1,
1.124921, -1.477728, 1.836318, 1, 0, 0.8588235, 1,
1.127938, 1.536831, -0.5245955, 1, 0, 0.8509804, 1,
1.132663, 0.5323402, 1.819575, 1, 0, 0.8470588, 1,
1.133258, 0.4375125, 2.585793, 1, 0, 0.8392157, 1,
1.134665, -1.085008, 2.541505, 1, 0, 0.8352941, 1,
1.138523, -1.890186, 3.291341, 1, 0, 0.827451, 1,
1.141235, 0.5469043, -0.188502, 1, 0, 0.8235294, 1,
1.141915, 0.4362666, 1.431067, 1, 0, 0.8156863, 1,
1.141953, 1.340768, -0.03947163, 1, 0, 0.8117647, 1,
1.154314, -1.239255, 2.318451, 1, 0, 0.8039216, 1,
1.165282, 0.1694269, 2.744565, 1, 0, 0.7960784, 1,
1.169542, 0.4270167, 2.0324, 1, 0, 0.7921569, 1,
1.173507, 0.02533932, 1.705352, 1, 0, 0.7843137, 1,
1.174883, -0.5044398, 1.304854, 1, 0, 0.7803922, 1,
1.181255, 1.508837, 0.8449048, 1, 0, 0.772549, 1,
1.209955, -0.5369194, 0.2319773, 1, 0, 0.7686275, 1,
1.213163, -1.55625, 3.191755, 1, 0, 0.7607843, 1,
1.216172, 1.072668, -0.5707626, 1, 0, 0.7568628, 1,
1.223763, -0.4273407, 1.411933, 1, 0, 0.7490196, 1,
1.230179, -0.4419831, 2.957852, 1, 0, 0.7450981, 1,
1.238188, -0.8557507, 3.266859, 1, 0, 0.7372549, 1,
1.240333, -1.977818, 3.145935, 1, 0, 0.7333333, 1,
1.244182, 2.521422, 0.8355333, 1, 0, 0.7254902, 1,
1.254786, -1.085291, 3.876641, 1, 0, 0.7215686, 1,
1.254898, -0.346523, 3.068995, 1, 0, 0.7137255, 1,
1.25995, 1.963254, 1.784263, 1, 0, 0.7098039, 1,
1.270043, -0.9554361, 2.545577, 1, 0, 0.7019608, 1,
1.273224, 0.04060939, 2.936093, 1, 0, 0.6941177, 1,
1.278634, -1.408393, 1.742545, 1, 0, 0.6901961, 1,
1.281502, -0.9706283, 1.775105, 1, 0, 0.682353, 1,
1.284163, -0.4753827, 3.569722, 1, 0, 0.6784314, 1,
1.289988, 0.9929535, 3.896145, 1, 0, 0.6705883, 1,
1.290639, 0.1633743, 0.7773443, 1, 0, 0.6666667, 1,
1.300508, -0.2304188, 0.4638981, 1, 0, 0.6588235, 1,
1.303573, 0.1506689, 1.952824, 1, 0, 0.654902, 1,
1.311883, 1.411063, 0.5139424, 1, 0, 0.6470588, 1,
1.312712, -1.309184, 2.063173, 1, 0, 0.6431373, 1,
1.322082, 0.9054232, 0.933655, 1, 0, 0.6352941, 1,
1.336742, -1.091662, 2.205695, 1, 0, 0.6313726, 1,
1.340138, -1.091633, 3.143488, 1, 0, 0.6235294, 1,
1.342961, 0.2221644, 1.860415, 1, 0, 0.6196079, 1,
1.348182, 0.372416, 1.10105, 1, 0, 0.6117647, 1,
1.352655, 0.7709461, 2.810261, 1, 0, 0.6078432, 1,
1.356666, 0.001501745, 1.884472, 1, 0, 0.6, 1,
1.364954, -0.312696, -0.06026841, 1, 0, 0.5921569, 1,
1.367028, -0.1859926, 0.2790605, 1, 0, 0.5882353, 1,
1.371636, -0.1526813, 1.469462, 1, 0, 0.5803922, 1,
1.372089, -0.3567555, 2.08789, 1, 0, 0.5764706, 1,
1.379352, -1.589078, 0.4480018, 1, 0, 0.5686275, 1,
1.382735, 1.07147, -1.205036, 1, 0, 0.5647059, 1,
1.384291, 2.497218, 0.9434085, 1, 0, 0.5568628, 1,
1.396382, -0.3860219, -0.1248895, 1, 0, 0.5529412, 1,
1.39975, -0.1239794, 2.17008, 1, 0, 0.5450981, 1,
1.409698, -1.105296, 2.785711, 1, 0, 0.5411765, 1,
1.41242, -2.197664, 2.169842, 1, 0, 0.5333334, 1,
1.413648, 0.5293553, 1.287003, 1, 0, 0.5294118, 1,
1.419052, 0.8651454, 1.037822, 1, 0, 0.5215687, 1,
1.422612, -1.267553, 2.783712, 1, 0, 0.5176471, 1,
1.44491, -0.7400378, 1.985175, 1, 0, 0.509804, 1,
1.457805, -1.088736, 2.569193, 1, 0, 0.5058824, 1,
1.471462, 2.318843, 0.2837475, 1, 0, 0.4980392, 1,
1.486888, -0.2990115, 2.408687, 1, 0, 0.4901961, 1,
1.48785, 1.129496, 1.289102, 1, 0, 0.4862745, 1,
1.488684, 1.590732, 0.6607432, 1, 0, 0.4784314, 1,
1.502234, 0.5925509, 1.649637, 1, 0, 0.4745098, 1,
1.513206, -0.2108642, 2.687506, 1, 0, 0.4666667, 1,
1.513868, -1.048109, 3.963953, 1, 0, 0.4627451, 1,
1.516601, 0.5754243, 1.301361, 1, 0, 0.454902, 1,
1.516786, 0.45665, 1.919713, 1, 0, 0.4509804, 1,
1.519609, 0.7929603, 1.529772, 1, 0, 0.4431373, 1,
1.524355, 0.3880429, 2.969666, 1, 0, 0.4392157, 1,
1.529222, -0.09964861, 1.543446, 1, 0, 0.4313726, 1,
1.534131, 0.8942987, 2.765057, 1, 0, 0.427451, 1,
1.535428, 0.1115468, 0.3052806, 1, 0, 0.4196078, 1,
1.541054, -0.3358499, 2.886654, 1, 0, 0.4156863, 1,
1.541529, 1.533735, 2.153321, 1, 0, 0.4078431, 1,
1.546076, 0.7455632, 0.9733189, 1, 0, 0.4039216, 1,
1.552298, -0.9399443, 2.056847, 1, 0, 0.3960784, 1,
1.561783, -0.3503763, 0.9740644, 1, 0, 0.3882353, 1,
1.567016, -0.2586829, 1.434805, 1, 0, 0.3843137, 1,
1.571666, 0.1092998, 0.9205627, 1, 0, 0.3764706, 1,
1.573321, 1.126491, 0.01180656, 1, 0, 0.372549, 1,
1.581789, -0.3603053, 2.692484, 1, 0, 0.3647059, 1,
1.583467, 0.5127686, 1.543483, 1, 0, 0.3607843, 1,
1.58887, -0.638421, 1.612061, 1, 0, 0.3529412, 1,
1.588899, -2.081223, 3.945078, 1, 0, 0.3490196, 1,
1.599038, -1.707428, 2.157629, 1, 0, 0.3411765, 1,
1.617267, 0.1888373, 3.353864, 1, 0, 0.3372549, 1,
1.620733, 0.3292131, 2.652674, 1, 0, 0.3294118, 1,
1.627699, 0.9478407, 0.8268675, 1, 0, 0.3254902, 1,
1.635638, -0.2187932, 1.487948, 1, 0, 0.3176471, 1,
1.640184, -0.2405752, 1.438646, 1, 0, 0.3137255, 1,
1.642029, -0.4518583, 1.903011, 1, 0, 0.3058824, 1,
1.66273, 0.1292569, 2.01329, 1, 0, 0.2980392, 1,
1.673226, 0.9643202, 0.7118058, 1, 0, 0.2941177, 1,
1.678782, -2.017787, 2.968895, 1, 0, 0.2862745, 1,
1.683161, 0.1631589, 2.597455, 1, 0, 0.282353, 1,
1.689127, 0.5669851, -0.9581136, 1, 0, 0.2745098, 1,
1.70511, -0.7474818, 3.754353, 1, 0, 0.2705882, 1,
1.713487, -1.48024, 2.609453, 1, 0, 0.2627451, 1,
1.740973, 0.09623646, 3.270681, 1, 0, 0.2588235, 1,
1.749793, -1.403163, 2.402736, 1, 0, 0.2509804, 1,
1.778154, 0.6726027, 2.539369, 1, 0, 0.2470588, 1,
1.778336, 2.173227, -0.04318951, 1, 0, 0.2392157, 1,
1.778378, -0.09106868, 2.532144, 1, 0, 0.2352941, 1,
1.783362, -0.07790502, 1.528155, 1, 0, 0.227451, 1,
1.788615, -0.1055247, 4.232772, 1, 0, 0.2235294, 1,
1.80468, 1.33949, 0.2109829, 1, 0, 0.2156863, 1,
1.816945, -0.6068748, 3.126039, 1, 0, 0.2117647, 1,
1.817933, 0.5935048, 0.5128568, 1, 0, 0.2039216, 1,
1.824407, 0.5296247, 0.7491984, 1, 0, 0.1960784, 1,
1.831069, -0.8847549, 1.181237, 1, 0, 0.1921569, 1,
1.858695, -1.663559, 3.832659, 1, 0, 0.1843137, 1,
1.865451, -1.030153, 2.032224, 1, 0, 0.1803922, 1,
1.868304, 1.266579, 0.8874351, 1, 0, 0.172549, 1,
1.878403, 0.3723814, -0.4812101, 1, 0, 0.1686275, 1,
1.888721, -0.1756575, 0.251229, 1, 0, 0.1607843, 1,
1.898525, -1.116121, 2.347656, 1, 0, 0.1568628, 1,
1.910295, 1.472203, 1.427452, 1, 0, 0.1490196, 1,
1.913321, -2.486272, 2.269199, 1, 0, 0.145098, 1,
1.915669, -0.7802687, 1.65832, 1, 0, 0.1372549, 1,
1.921025, 0.6331947, -0.7172677, 1, 0, 0.1333333, 1,
1.931338, -2.349775, 1.420408, 1, 0, 0.1254902, 1,
1.952394, -1.109629, 1.004792, 1, 0, 0.1215686, 1,
1.957965, -0.2789491, 0.1819119, 1, 0, 0.1137255, 1,
1.958609, 0.03966299, 0.8656619, 1, 0, 0.1098039, 1,
1.964944, 0.3703345, 1.084781, 1, 0, 0.1019608, 1,
2.050141, 0.6706417, 0.3482859, 1, 0, 0.09411765, 1,
2.070056, -0.1042643, 1.636129, 1, 0, 0.09019608, 1,
2.094347, -1.06038, 0.6230386, 1, 0, 0.08235294, 1,
2.117222, 1.299343, 1.751328, 1, 0, 0.07843138, 1,
2.134304, 0.05707784, 1.440311, 1, 0, 0.07058824, 1,
2.139117, 1.449027, 1.743825, 1, 0, 0.06666667, 1,
2.139884, 0.255762, 1.372924, 1, 0, 0.05882353, 1,
2.203083, 0.578205, 0.1266985, 1, 0, 0.05490196, 1,
2.203691, 1.556072, 0.23184, 1, 0, 0.04705882, 1,
2.213439, -0.6490083, 2.887444, 1, 0, 0.04313726, 1,
2.282849, -0.9153001, 1.647045, 1, 0, 0.03529412, 1,
2.506495, -2.280184, 1.479809, 1, 0, 0.03137255, 1,
2.583548, 1.145343, -1.105395, 1, 0, 0.02352941, 1,
2.741825, -0.6182133, 1.381211, 1, 0, 0.01960784, 1,
2.983326, 0.3733104, 1.147628, 1, 0, 0.01176471, 1,
3.478146, 0.5413519, 0.3726032, 1, 0, 0.007843138, 1
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
0.2826797, -4.022279, -7.642354, 0, -0.5, 0.5, 0.5,
0.2826797, -4.022279, -7.642354, 1, -0.5, 0.5, 0.5,
0.2826797, -4.022279, -7.642354, 1, 1.5, 0.5, 0.5,
0.2826797, -4.022279, -7.642354, 0, 1.5, 0.5, 0.5
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
-3.99605, 0.171127, -7.642354, 0, -0.5, 0.5, 0.5,
-3.99605, 0.171127, -7.642354, 1, -0.5, 0.5, 0.5,
-3.99605, 0.171127, -7.642354, 1, 1.5, 0.5, 0.5,
-3.99605, 0.171127, -7.642354, 0, 1.5, 0.5, 0.5
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
-3.99605, -4.022279, -0.07801104, 0, -0.5, 0.5, 0.5,
-3.99605, -4.022279, -0.07801104, 1, -0.5, 0.5, 0.5,
-3.99605, -4.022279, -0.07801104, 1, 1.5, 0.5, 0.5,
-3.99605, -4.022279, -0.07801104, 0, 1.5, 0.5, 0.5
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
-2, -3.05457, -5.896737,
3, -3.05457, -5.896737,
-2, -3.05457, -5.896737,
-2, -3.215855, -6.187673,
-1, -3.05457, -5.896737,
-1, -3.215855, -6.187673,
0, -3.05457, -5.896737,
0, -3.215855, -6.187673,
1, -3.05457, -5.896737,
1, -3.215855, -6.187673,
2, -3.05457, -5.896737,
2, -3.215855, -6.187673,
3, -3.05457, -5.896737,
3, -3.215855, -6.187673
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
-2, -3.538424, -6.769546, 0, -0.5, 0.5, 0.5,
-2, -3.538424, -6.769546, 1, -0.5, 0.5, 0.5,
-2, -3.538424, -6.769546, 1, 1.5, 0.5, 0.5,
-2, -3.538424, -6.769546, 0, 1.5, 0.5, 0.5,
-1, -3.538424, -6.769546, 0, -0.5, 0.5, 0.5,
-1, -3.538424, -6.769546, 1, -0.5, 0.5, 0.5,
-1, -3.538424, -6.769546, 1, 1.5, 0.5, 0.5,
-1, -3.538424, -6.769546, 0, 1.5, 0.5, 0.5,
0, -3.538424, -6.769546, 0, -0.5, 0.5, 0.5,
0, -3.538424, -6.769546, 1, -0.5, 0.5, 0.5,
0, -3.538424, -6.769546, 1, 1.5, 0.5, 0.5,
0, -3.538424, -6.769546, 0, 1.5, 0.5, 0.5,
1, -3.538424, -6.769546, 0, -0.5, 0.5, 0.5,
1, -3.538424, -6.769546, 1, -0.5, 0.5, 0.5,
1, -3.538424, -6.769546, 1, 1.5, 0.5, 0.5,
1, -3.538424, -6.769546, 0, 1.5, 0.5, 0.5,
2, -3.538424, -6.769546, 0, -0.5, 0.5, 0.5,
2, -3.538424, -6.769546, 1, -0.5, 0.5, 0.5,
2, -3.538424, -6.769546, 1, 1.5, 0.5, 0.5,
2, -3.538424, -6.769546, 0, 1.5, 0.5, 0.5,
3, -3.538424, -6.769546, 0, -0.5, 0.5, 0.5,
3, -3.538424, -6.769546, 1, -0.5, 0.5, 0.5,
3, -3.538424, -6.769546, 1, 1.5, 0.5, 0.5,
3, -3.538424, -6.769546, 0, 1.5, 0.5, 0.5
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
-3.008651, -2, -5.896737,
-3.008651, 3, -5.896737,
-3.008651, -2, -5.896737,
-3.173217, -2, -6.187673,
-3.008651, -1, -5.896737,
-3.173217, -1, -6.187673,
-3.008651, 0, -5.896737,
-3.173217, 0, -6.187673,
-3.008651, 1, -5.896737,
-3.173217, 1, -6.187673,
-3.008651, 2, -5.896737,
-3.173217, 2, -6.187673,
-3.008651, 3, -5.896737,
-3.173217, 3, -6.187673
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
-3.50235, -2, -6.769546, 0, -0.5, 0.5, 0.5,
-3.50235, -2, -6.769546, 1, -0.5, 0.5, 0.5,
-3.50235, -2, -6.769546, 1, 1.5, 0.5, 0.5,
-3.50235, -2, -6.769546, 0, 1.5, 0.5, 0.5,
-3.50235, -1, -6.769546, 0, -0.5, 0.5, 0.5,
-3.50235, -1, -6.769546, 1, -0.5, 0.5, 0.5,
-3.50235, -1, -6.769546, 1, 1.5, 0.5, 0.5,
-3.50235, -1, -6.769546, 0, 1.5, 0.5, 0.5,
-3.50235, 0, -6.769546, 0, -0.5, 0.5, 0.5,
-3.50235, 0, -6.769546, 1, -0.5, 0.5, 0.5,
-3.50235, 0, -6.769546, 1, 1.5, 0.5, 0.5,
-3.50235, 0, -6.769546, 0, 1.5, 0.5, 0.5,
-3.50235, 1, -6.769546, 0, -0.5, 0.5, 0.5,
-3.50235, 1, -6.769546, 1, -0.5, 0.5, 0.5,
-3.50235, 1, -6.769546, 1, 1.5, 0.5, 0.5,
-3.50235, 1, -6.769546, 0, 1.5, 0.5, 0.5,
-3.50235, 2, -6.769546, 0, -0.5, 0.5, 0.5,
-3.50235, 2, -6.769546, 1, -0.5, 0.5, 0.5,
-3.50235, 2, -6.769546, 1, 1.5, 0.5, 0.5,
-3.50235, 2, -6.769546, 0, 1.5, 0.5, 0.5,
-3.50235, 3, -6.769546, 0, -0.5, 0.5, 0.5,
-3.50235, 3, -6.769546, 1, -0.5, 0.5, 0.5,
-3.50235, 3, -6.769546, 1, 1.5, 0.5, 0.5,
-3.50235, 3, -6.769546, 0, 1.5, 0.5, 0.5
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
-3.008651, -3.05457, -4,
-3.008651, -3.05457, 4,
-3.008651, -3.05457, -4,
-3.173217, -3.215855, -4,
-3.008651, -3.05457, -2,
-3.173217, -3.215855, -2,
-3.008651, -3.05457, 0,
-3.173217, -3.215855, 0,
-3.008651, -3.05457, 2,
-3.173217, -3.215855, 2,
-3.008651, -3.05457, 4,
-3.173217, -3.215855, 4
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
-3.50235, -3.538424, -4, 0, -0.5, 0.5, 0.5,
-3.50235, -3.538424, -4, 1, -0.5, 0.5, 0.5,
-3.50235, -3.538424, -4, 1, 1.5, 0.5, 0.5,
-3.50235, -3.538424, -4, 0, 1.5, 0.5, 0.5,
-3.50235, -3.538424, -2, 0, -0.5, 0.5, 0.5,
-3.50235, -3.538424, -2, 1, -0.5, 0.5, 0.5,
-3.50235, -3.538424, -2, 1, 1.5, 0.5, 0.5,
-3.50235, -3.538424, -2, 0, 1.5, 0.5, 0.5,
-3.50235, -3.538424, 0, 0, -0.5, 0.5, 0.5,
-3.50235, -3.538424, 0, 1, -0.5, 0.5, 0.5,
-3.50235, -3.538424, 0, 1, 1.5, 0.5, 0.5,
-3.50235, -3.538424, 0, 0, 1.5, 0.5, 0.5,
-3.50235, -3.538424, 2, 0, -0.5, 0.5, 0.5,
-3.50235, -3.538424, 2, 1, -0.5, 0.5, 0.5,
-3.50235, -3.538424, 2, 1, 1.5, 0.5, 0.5,
-3.50235, -3.538424, 2, 0, 1.5, 0.5, 0.5,
-3.50235, -3.538424, 4, 0, -0.5, 0.5, 0.5,
-3.50235, -3.538424, 4, 1, -0.5, 0.5, 0.5,
-3.50235, -3.538424, 4, 1, 1.5, 0.5, 0.5,
-3.50235, -3.538424, 4, 0, 1.5, 0.5, 0.5
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
-3.008651, -3.05457, -5.896737,
-3.008651, 3.396824, -5.896737,
-3.008651, -3.05457, 5.740715,
-3.008651, 3.396824, 5.740715,
-3.008651, -3.05457, -5.896737,
-3.008651, -3.05457, 5.740715,
-3.008651, 3.396824, -5.896737,
-3.008651, 3.396824, 5.740715,
-3.008651, -3.05457, -5.896737,
3.57401, -3.05457, -5.896737,
-3.008651, -3.05457, 5.740715,
3.57401, -3.05457, 5.740715,
-3.008651, 3.396824, -5.896737,
3.57401, 3.396824, -5.896737,
-3.008651, 3.396824, 5.740715,
3.57401, 3.396824, 5.740715,
3.57401, -3.05457, -5.896737,
3.57401, 3.396824, -5.896737,
3.57401, -3.05457, 5.740715,
3.57401, 3.396824, 5.740715,
3.57401, -3.05457, -5.896737,
3.57401, -3.05457, 5.740715,
3.57401, 3.396824, -5.896737,
3.57401, 3.396824, 5.740715
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
var radius = 7.927088;
var distance = 35.26851;
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
mvMatrix.translate( -0.2826797, -0.171127, 0.07801104 );
mvMatrix.scale( 1.302045, 1.328538, 0.7364949 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.26851);
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
Kasugamycin<-read.table("Kasugamycin.xyz")
```

```
## Error in read.table("Kasugamycin.xyz"): no lines available in input
```

```r
x<-Kasugamycin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Kasugamycin' not found
```

```r
y<-Kasugamycin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Kasugamycin' not found
```

```r
z<-Kasugamycin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Kasugamycin' not found
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
-2.912787, -0.3495987, -2.404776, 0, 0, 1, 1, 1,
-2.78985, -0.1825027, -1.932148, 1, 0, 0, 1, 1,
-2.74611, 0.780983, -1.718866, 1, 0, 0, 1, 1,
-2.744176, 0.08824552, -1.949706, 1, 0, 0, 1, 1,
-2.645769, -1.816888, -3.436368, 1, 0, 0, 1, 1,
-2.555321, 0.1491574, -1.872356, 1, 0, 0, 1, 1,
-2.461681, -0.1606826, -2.493524, 0, 0, 0, 1, 1,
-2.428052, 1.111211, -0.7371888, 0, 0, 0, 1, 1,
-2.424453, 1.131876, -2.07461, 0, 0, 0, 1, 1,
-2.292365, 0.06275246, -1.196872, 0, 0, 0, 1, 1,
-2.287774, 0.9727169, -1.597486, 0, 0, 0, 1, 1,
-2.280663, 0.9355685, -1.028746, 0, 0, 0, 1, 1,
-2.269933, -0.405397, -0.8157514, 0, 0, 0, 1, 1,
-2.199037, -1.218327, -3.18691, 1, 1, 1, 1, 1,
-2.196063, 0.1760333, -0.8170717, 1, 1, 1, 1, 1,
-2.192105, -1.302843, -2.685437, 1, 1, 1, 1, 1,
-2.176932, -1.378316, -1.980846, 1, 1, 1, 1, 1,
-2.164629, 0.4251399, -0.5421344, 1, 1, 1, 1, 1,
-2.161023, 0.7297359, -2.536064, 1, 1, 1, 1, 1,
-2.156892, 0.2735475, -2.632756, 1, 1, 1, 1, 1,
-2.145936, -0.6261972, -3.664184, 1, 1, 1, 1, 1,
-2.143089, -0.3934075, -1.712557, 1, 1, 1, 1, 1,
-2.081529, -0.06482919, -0.4621791, 1, 1, 1, 1, 1,
-2.049332, 0.0436401, -2.519613, 1, 1, 1, 1, 1,
-2.03604, 0.6142059, -1.684665, 1, 1, 1, 1, 1,
-2.009428, 1.273229, 0.45295, 1, 1, 1, 1, 1,
-1.985097, 0.3572066, -2.041079, 1, 1, 1, 1, 1,
-1.949796, 1.908551, -1.2271, 1, 1, 1, 1, 1,
-1.920706, 1.765391, -1.281369, 0, 0, 1, 1, 1,
-1.903552, 0.7312273, -0.3438408, 1, 0, 0, 1, 1,
-1.902558, -0.9793862, -0.5285956, 1, 0, 0, 1, 1,
-1.887918, 1.179361, -1.504886, 1, 0, 0, 1, 1,
-1.886331, -0.7254707, -2.618718, 1, 0, 0, 1, 1,
-1.88485, 0.4901519, -1.136012, 1, 0, 0, 1, 1,
-1.869694, 1.329686, -0.2170088, 0, 0, 0, 1, 1,
-1.867737, 0.549814, -2.78138, 0, 0, 0, 1, 1,
-1.851182, -0.2310757, -1.644707, 0, 0, 0, 1, 1,
-1.850203, -0.7072601, -3.256127, 0, 0, 0, 1, 1,
-1.802608, 0.2769742, -0.2734046, 0, 0, 0, 1, 1,
-1.793456, 0.3352382, -2.367378, 0, 0, 0, 1, 1,
-1.793285, 0.2820079, -3.121191, 0, 0, 0, 1, 1,
-1.781853, -0.0759233, -1.705574, 1, 1, 1, 1, 1,
-1.777638, -1.542732, -1.437284, 1, 1, 1, 1, 1,
-1.769145, -1.107319, -1.067332, 1, 1, 1, 1, 1,
-1.764592, -0.5244414, -0.1134386, 1, 1, 1, 1, 1,
-1.741908, 1.152616, -0.9206292, 1, 1, 1, 1, 1,
-1.736976, 1.120186, -2.786395, 1, 1, 1, 1, 1,
-1.730648, 0.4000378, -1.778356, 1, 1, 1, 1, 1,
-1.726219, -1.874371, -1.023052, 1, 1, 1, 1, 1,
-1.701348, 0.148863, -2.469894, 1, 1, 1, 1, 1,
-1.699874, 0.8338712, -3.593032, 1, 1, 1, 1, 1,
-1.69383, -1.26311, -1.230942, 1, 1, 1, 1, 1,
-1.693798, 0.8620641, -0.179662, 1, 1, 1, 1, 1,
-1.692509, 0.276149, -2.153343, 1, 1, 1, 1, 1,
-1.68858, 0.371016, -1.071865, 1, 1, 1, 1, 1,
-1.677362, 0.6877765, -2.197623, 1, 1, 1, 1, 1,
-1.674108, -0.7057324, -3.49015, 0, 0, 1, 1, 1,
-1.66786, 0.8594546, -0.1182284, 1, 0, 0, 1, 1,
-1.663028, 0.01394276, 0.4268276, 1, 0, 0, 1, 1,
-1.627297, 1.471865, -0.8999808, 1, 0, 0, 1, 1,
-1.610626, -0.7770419, -1.178872, 1, 0, 0, 1, 1,
-1.607309, -0.146741, -2.022587, 1, 0, 0, 1, 1,
-1.600116, 0.1481847, -1.012585, 0, 0, 0, 1, 1,
-1.593725, 0.3635645, -2.441968, 0, 0, 0, 1, 1,
-1.588242, -0.7693706, -3.617026, 0, 0, 0, 1, 1,
-1.582703, 1.51235, -0.2761662, 0, 0, 0, 1, 1,
-1.574725, -0.7301638, -0.9711357, 0, 0, 0, 1, 1,
-1.563316, -0.1363556, -2.803959, 0, 0, 0, 1, 1,
-1.559679, 1.081127, -0.8649417, 0, 0, 0, 1, 1,
-1.55707, -0.6215723, -2.905046, 1, 1, 1, 1, 1,
-1.552651, 1.031888, -0.9671531, 1, 1, 1, 1, 1,
-1.542958, -0.09733012, -0.8371191, 1, 1, 1, 1, 1,
-1.524114, 0.7719467, -2.379823, 1, 1, 1, 1, 1,
-1.518125, 0.1442583, 0.5191143, 1, 1, 1, 1, 1,
-1.516008, 1.304548, -1.419982, 1, 1, 1, 1, 1,
-1.510412, -1.032145, -2.800884, 1, 1, 1, 1, 1,
-1.50906, 0.9508205, -1.117189, 1, 1, 1, 1, 1,
-1.508991, 0.006223935, -0.2597131, 1, 1, 1, 1, 1,
-1.505959, -0.4498113, -3.014905, 1, 1, 1, 1, 1,
-1.499788, 0.7304142, -0.3939216, 1, 1, 1, 1, 1,
-1.478314, -0.7231306, -1.04825, 1, 1, 1, 1, 1,
-1.477262, 1.854109, 0.7636762, 1, 1, 1, 1, 1,
-1.459307, -0.603946, -0.808875, 1, 1, 1, 1, 1,
-1.448508, 0.808467, -1.084049, 1, 1, 1, 1, 1,
-1.441155, 0.4305963, 0.3752597, 0, 0, 1, 1, 1,
-1.44072, 0.4740932, -2.370244, 1, 0, 0, 1, 1,
-1.43594, 0.5471681, -0.8357084, 1, 0, 0, 1, 1,
-1.431394, -0.3795514, -1.986289, 1, 0, 0, 1, 1,
-1.426456, 2.460392, 0.1069283, 1, 0, 0, 1, 1,
-1.420812, -0.7630298, -1.927221, 1, 0, 0, 1, 1,
-1.410281, -0.6466627, -3.383431, 0, 0, 0, 1, 1,
-1.397696, 0.1761254, -4.922952, 0, 0, 0, 1, 1,
-1.387786, -0.4569087, -3.064891, 0, 0, 0, 1, 1,
-1.37531, 0.7383366, -2.941289, 0, 0, 0, 1, 1,
-1.374352, -1.90247, -2.994803, 0, 0, 0, 1, 1,
-1.368331, -0.1884418, -2.184042, 0, 0, 0, 1, 1,
-1.366328, 0.001991078, -1.500182, 0, 0, 0, 1, 1,
-1.360159, -2.076138, -1.792033, 1, 1, 1, 1, 1,
-1.356767, -1.690144, -1.833509, 1, 1, 1, 1, 1,
-1.354159, 0.2293971, -2.652547, 1, 1, 1, 1, 1,
-1.350996, 1.385355, -1.014321, 1, 1, 1, 1, 1,
-1.348861, -1.570144, -1.737736, 1, 1, 1, 1, 1,
-1.340817, -0.2185071, -1.774259, 1, 1, 1, 1, 1,
-1.339392, 0.7936618, -0.724538, 1, 1, 1, 1, 1,
-1.33598, 0.5952283, -0.03239878, 1, 1, 1, 1, 1,
-1.335155, -0.2058622, -0.6739691, 1, 1, 1, 1, 1,
-1.333284, 0.0572624, -1.288231, 1, 1, 1, 1, 1,
-1.327333, 0.173214, -2.582606, 1, 1, 1, 1, 1,
-1.323259, 1.121871, 0.1944431, 1, 1, 1, 1, 1,
-1.317503, 1.116141, 0.7591261, 1, 1, 1, 1, 1,
-1.314984, -0.1793365, -1.868038, 1, 1, 1, 1, 1,
-1.312091, 1.760937, -0.4162381, 1, 1, 1, 1, 1,
-1.307394, 0.6888344, -2.638017, 0, 0, 1, 1, 1,
-1.305753, 1.038924, -1.004799, 1, 0, 0, 1, 1,
-1.305674, 0.8858403, -0.9211302, 1, 0, 0, 1, 1,
-1.305442, -0.2063002, -2.753359, 1, 0, 0, 1, 1,
-1.303515, -0.06519284, -2.367865, 1, 0, 0, 1, 1,
-1.295628, 0.8740644, -1.414117, 1, 0, 0, 1, 1,
-1.283124, 0.3540038, -2.413268, 0, 0, 0, 1, 1,
-1.279831, -0.2963648, -1.400876, 0, 0, 0, 1, 1,
-1.268552, 0.1165313, -3.341233, 0, 0, 0, 1, 1,
-1.245094, -0.1494289, -0.016476, 0, 0, 0, 1, 1,
-1.238732, 0.4332117, -2.008876, 0, 0, 0, 1, 1,
-1.227618, -0.6825339, -1.400896, 0, 0, 0, 1, 1,
-1.222645, 0.6168315, -2.685317, 0, 0, 0, 1, 1,
-1.221865, 1.892066, -1.783859, 1, 1, 1, 1, 1,
-1.210917, -0.02563969, -2.87048, 1, 1, 1, 1, 1,
-1.198297, -1.043579, -2.313533, 1, 1, 1, 1, 1,
-1.192542, 1.751375, 0.1951088, 1, 1, 1, 1, 1,
-1.186736, -1.89676, -2.456981, 1, 1, 1, 1, 1,
-1.158939, -0.3117358, -0.6584685, 1, 1, 1, 1, 1,
-1.150782, 0.1140778, -2.169212, 1, 1, 1, 1, 1,
-1.147299, -1.017143, -3.565443, 1, 1, 1, 1, 1,
-1.138921, 0.2261465, -2.542177, 1, 1, 1, 1, 1,
-1.137842, 0.5260904, 0.07252972, 1, 1, 1, 1, 1,
-1.135742, 1.067176, -0.9999778, 1, 1, 1, 1, 1,
-1.134079, 0.001135146, -2.077064, 1, 1, 1, 1, 1,
-1.128623, -1.655859, -2.325303, 1, 1, 1, 1, 1,
-1.12755, -0.05369832, -0.1842615, 1, 1, 1, 1, 1,
-1.119667, 0.4836297, -2.186995, 1, 1, 1, 1, 1,
-1.09894, 1.029569, 1.840995, 0, 0, 1, 1, 1,
-1.097888, 0.1252324, -0.1663752, 1, 0, 0, 1, 1,
-1.095724, -0.5669595, -0.9859771, 1, 0, 0, 1, 1,
-1.08944, -0.2526026, -3.650291, 1, 0, 0, 1, 1,
-1.080191, 0.8248492, 0.2811938, 1, 0, 0, 1, 1,
-1.079911, -0.2856162, -3.895891, 1, 0, 0, 1, 1,
-1.073814, 0.6852853, -1.772256, 0, 0, 0, 1, 1,
-1.070359, -0.2241984, -1.922422, 0, 0, 0, 1, 1,
-1.065354, 1.480502, 0.2467692, 0, 0, 0, 1, 1,
-1.062312, -1.847624, -1.677532, 0, 0, 0, 1, 1,
-1.060981, 0.426081, -2.611475, 0, 0, 0, 1, 1,
-1.054081, -0.2261913, -3.170182, 0, 0, 0, 1, 1,
-1.048545, -0.9101282, -2.851925, 0, 0, 0, 1, 1,
-1.044627, -1.18534, -1.980305, 1, 1, 1, 1, 1,
-1.041195, 1.245462, -1.485192, 1, 1, 1, 1, 1,
-1.037645, -0.1977161, -0.4704973, 1, 1, 1, 1, 1,
-1.031401, -0.4010662, -1.219377, 1, 1, 1, 1, 1,
-1.023942, -0.7189638, -2.856114, 1, 1, 1, 1, 1,
-1.020249, 0.9460068, -1.373597, 1, 1, 1, 1, 1,
-1.016247, -0.3657894, -4.21881, 1, 1, 1, 1, 1,
-1.015512, -0.0526799, -1.138587, 1, 1, 1, 1, 1,
-1.006336, 0.1029456, 0.9029195, 1, 1, 1, 1, 1,
-1.00477, -0.05021808, -1.532879, 1, 1, 1, 1, 1,
-0.9948531, 2.96633, -1.743275, 1, 1, 1, 1, 1,
-0.982274, -2.225091, -3.638749, 1, 1, 1, 1, 1,
-0.9742742, -0.2297361, -2.249856, 1, 1, 1, 1, 1,
-0.9713935, 1.159003, -1.622879, 1, 1, 1, 1, 1,
-0.9682371, 0.7283647, -2.290933, 1, 1, 1, 1, 1,
-0.9669378, 0.924479, -0.3785562, 0, 0, 1, 1, 1,
-0.9653105, 0.7763051, 0.04123218, 1, 0, 0, 1, 1,
-0.9619994, 0.4278912, -1.631913, 1, 0, 0, 1, 1,
-0.9614747, -0.9196199, -2.923693, 1, 0, 0, 1, 1,
-0.9577952, -0.8354384, -2.275688, 1, 0, 0, 1, 1,
-0.9569024, 0.1163549, -2.018932, 1, 0, 0, 1, 1,
-0.9555672, -1.51773, -2.662747, 0, 0, 0, 1, 1,
-0.9525412, 0.2166425, -0.732425, 0, 0, 0, 1, 1,
-0.949006, -0.4221696, -1.05206, 0, 0, 0, 1, 1,
-0.946343, -1.185951, -2.449691, 0, 0, 0, 1, 1,
-0.9396294, -0.06718893, -1.479156, 0, 0, 0, 1, 1,
-0.9365925, 0.1780488, -0.6635235, 0, 0, 0, 1, 1,
-0.9364607, -1.858673, -1.623221, 0, 0, 0, 1, 1,
-0.9328476, -0.6971887, -1.629467, 1, 1, 1, 1, 1,
-0.9303914, 1.102516, 0.6907537, 1, 1, 1, 1, 1,
-0.9260669, 0.1339155, -0.8752846, 1, 1, 1, 1, 1,
-0.9243068, -1.130084, -1.72647, 1, 1, 1, 1, 1,
-0.9230095, 0.5804688, -3.395113, 1, 1, 1, 1, 1,
-0.9222662, -0.100683, -1.079078, 1, 1, 1, 1, 1,
-0.9180288, -2.353758, -2.532342, 1, 1, 1, 1, 1,
-0.9180008, 1.49291, -0.6475677, 1, 1, 1, 1, 1,
-0.917965, 0.4386976, -1.162154, 1, 1, 1, 1, 1,
-0.9174064, -1.190496, -2.05597, 1, 1, 1, 1, 1,
-0.9121681, 0.5620736, -2.063024, 1, 1, 1, 1, 1,
-0.9087158, 0.3786011, -0.8890812, 1, 1, 1, 1, 1,
-0.899275, 0.8122403, -1.019991, 1, 1, 1, 1, 1,
-0.8932284, -0.4107503, -1.117793, 1, 1, 1, 1, 1,
-0.8913609, -0.4918558, -3.572671, 1, 1, 1, 1, 1,
-0.8908097, -0.4370428, -2.927026, 0, 0, 1, 1, 1,
-0.8875936, 0.01466902, -2.043423, 1, 0, 0, 1, 1,
-0.882661, -1.60599, -3.76925, 1, 0, 0, 1, 1,
-0.8794847, -0.4244006, -0.5830695, 1, 0, 0, 1, 1,
-0.8789553, 0.4980152, -2.363624, 1, 0, 0, 1, 1,
-0.8751141, -0.739913, -2.398096, 1, 0, 0, 1, 1,
-0.8736934, 1.039775, -0.6250094, 0, 0, 0, 1, 1,
-0.8711814, 0.7116737, -3.185555, 0, 0, 0, 1, 1,
-0.8683059, -1.941821, -1.203187, 0, 0, 0, 1, 1,
-0.8676343, -0.2099027, -0.6162309, 0, 0, 0, 1, 1,
-0.8662552, -1.246764, -1.491336, 0, 0, 0, 1, 1,
-0.8656113, 0.7785959, -1.314529, 0, 0, 0, 1, 1,
-0.857897, -0.4660054, -2.18261, 0, 0, 0, 1, 1,
-0.8564032, 0.6066229, -2.481455, 1, 1, 1, 1, 1,
-0.8561039, -1.72284, -3.645988, 1, 1, 1, 1, 1,
-0.8517323, 0.6962602, -0.8225396, 1, 1, 1, 1, 1,
-0.8481846, 1.635756, 0.2258361, 1, 1, 1, 1, 1,
-0.8476864, -1.131405, -4.262579, 1, 1, 1, 1, 1,
-0.8476692, -0.0759052, -1.313634, 1, 1, 1, 1, 1,
-0.8473485, -0.01459628, -1.29772, 1, 1, 1, 1, 1,
-0.8443454, 1.415238, -1.665944, 1, 1, 1, 1, 1,
-0.8384278, 0.06813475, -1.944208, 1, 1, 1, 1, 1,
-0.8380232, -1.058428, -3.173662, 1, 1, 1, 1, 1,
-0.8288157, -0.1883077, -1.99463, 1, 1, 1, 1, 1,
-0.8284469, 0.9158022, -1.059391, 1, 1, 1, 1, 1,
-0.8284169, -1.112669, -1.719401, 1, 1, 1, 1, 1,
-0.8183445, -1.282979, -2.610376, 1, 1, 1, 1, 1,
-0.8097484, 1.805907, -0.6436227, 1, 1, 1, 1, 1,
-0.8091964, -0.6102181, -2.396315, 0, 0, 1, 1, 1,
-0.8075532, -0.3741032, -2.530555, 1, 0, 0, 1, 1,
-0.8054709, -0.1723928, -2.332461, 1, 0, 0, 1, 1,
-0.8043138, -1.078073, -2.173649, 1, 0, 0, 1, 1,
-0.8012946, -1.872363, -1.42455, 1, 0, 0, 1, 1,
-0.8004286, -0.4849724, -2.225296, 1, 0, 0, 1, 1,
-0.7976473, -0.464105, -1.011165, 0, 0, 0, 1, 1,
-0.79229, 0.5826192, -1.385759, 0, 0, 0, 1, 1,
-0.7852951, 0.962022, 0.7882948, 0, 0, 0, 1, 1,
-0.7850558, 0.002389346, -2.212332, 0, 0, 0, 1, 1,
-0.7844836, -1.43471, -2.698848, 0, 0, 0, 1, 1,
-0.7843291, 1.153921, -0.3965687, 0, 0, 0, 1, 1,
-0.782791, 1.647675, -0.196722, 0, 0, 0, 1, 1,
-0.7744603, -1.215793, -2.075551, 1, 1, 1, 1, 1,
-0.7705842, -0.7967871, -2.04294, 1, 1, 1, 1, 1,
-0.7695063, -0.6207232, -2.664428, 1, 1, 1, 1, 1,
-0.7594776, -0.8345728, -1.758863, 1, 1, 1, 1, 1,
-0.7556401, -0.5649979, -1.989102, 1, 1, 1, 1, 1,
-0.7514623, 1.261209, 0.7797086, 1, 1, 1, 1, 1,
-0.7501735, -0.4804381, -2.226977, 1, 1, 1, 1, 1,
-0.7457209, 1.075504, -0.8253518, 1, 1, 1, 1, 1,
-0.7450864, -0.5764536, -1.513385, 1, 1, 1, 1, 1,
-0.7447175, 0.6602401, 0.3042504, 1, 1, 1, 1, 1,
-0.7428851, -1.244847, -5.727259, 1, 1, 1, 1, 1,
-0.7425451, -1.536119, -3.335744, 1, 1, 1, 1, 1,
-0.7392287, -1.778198, -2.583873, 1, 1, 1, 1, 1,
-0.7375553, 0.6209123, -0.8607835, 1, 1, 1, 1, 1,
-0.7344207, 0.4762059, -0.8354735, 1, 1, 1, 1, 1,
-0.733631, 0.1757584, -0.5350108, 0, 0, 1, 1, 1,
-0.7332271, 3.302871, -0.8752739, 1, 0, 0, 1, 1,
-0.7315181, -1.632011, -1.822344, 1, 0, 0, 1, 1,
-0.731186, -0.5155768, -1.952249, 1, 0, 0, 1, 1,
-0.7302907, 0.0601967, -2.51181, 1, 0, 0, 1, 1,
-0.7281797, -1.107631, -2.504265, 1, 0, 0, 1, 1,
-0.7249113, 0.8943433, -0.4104498, 0, 0, 0, 1, 1,
-0.724763, 1.396387, -0.7191195, 0, 0, 0, 1, 1,
-0.7228191, -0.1000794, -2.166289, 0, 0, 0, 1, 1,
-0.7172426, 1.715949, -0.9492779, 0, 0, 0, 1, 1,
-0.7165605, 1.875916, 0.05326728, 0, 0, 0, 1, 1,
-0.715867, 1.266957, -0.09002978, 0, 0, 0, 1, 1,
-0.7137364, -0.2761153, -0.2736824, 0, 0, 0, 1, 1,
-0.7121105, -0.1879911, -1.385428, 1, 1, 1, 1, 1,
-0.7025455, 1.002794, 0.9745408, 1, 1, 1, 1, 1,
-0.6941607, -1.444746, -4.505842, 1, 1, 1, 1, 1,
-0.6793113, 1.156375, -1.032193, 1, 1, 1, 1, 1,
-0.674282, -0.5570267, -2.287707, 1, 1, 1, 1, 1,
-0.6727189, 0.6948478, -0.740658, 1, 1, 1, 1, 1,
-0.667459, -0.4113621, -1.75717, 1, 1, 1, 1, 1,
-0.6634445, -0.9175047, -1.829121, 1, 1, 1, 1, 1,
-0.6629294, 0.9123445, -1.322707, 1, 1, 1, 1, 1,
-0.6610289, -0.2497665, -3.425309, 1, 1, 1, 1, 1,
-0.6487681, 0.2436047, -1.082954, 1, 1, 1, 1, 1,
-0.6397134, -0.8419359, -0.9062217, 1, 1, 1, 1, 1,
-0.6375307, 2.053039, -0.2527964, 1, 1, 1, 1, 1,
-0.6366174, 0.4903038, 0.9395658, 1, 1, 1, 1, 1,
-0.6272581, 0.8700573, -2.206254, 1, 1, 1, 1, 1,
-0.6183559, 1.018015, -0.9913172, 0, 0, 1, 1, 1,
-0.6161041, -0.1215318, -1.877168, 1, 0, 0, 1, 1,
-0.60839, -0.1240321, -1.266774, 1, 0, 0, 1, 1,
-0.6037241, -1.379504, -1.6099, 1, 0, 0, 1, 1,
-0.6024277, 0.7066545, 0.4559381, 1, 0, 0, 1, 1,
-0.5984747, 0.3479105, -1.981983, 1, 0, 0, 1, 1,
-0.5978633, -0.4146931, -1.051996, 0, 0, 0, 1, 1,
-0.5955834, 1.258722, -0.9445096, 0, 0, 0, 1, 1,
-0.5953842, -0.1006843, -2.350397, 0, 0, 0, 1, 1,
-0.5924966, 0.05526254, -1.953776, 0, 0, 0, 1, 1,
-0.585453, -0.4527193, -2.389437, 0, 0, 0, 1, 1,
-0.5764615, 0.6764988, 0.6959258, 0, 0, 0, 1, 1,
-0.5740067, 0.8519092, -0.08571544, 0, 0, 0, 1, 1,
-0.5736342, 1.022408, -0.708196, 1, 1, 1, 1, 1,
-0.5706248, 0.5639817, -0.6508589, 1, 1, 1, 1, 1,
-0.5683109, 0.4576843, -1.435096, 1, 1, 1, 1, 1,
-0.5680851, 0.3569396, -2.875089, 1, 1, 1, 1, 1,
-0.5676281, 0.5081711, -0.6394488, 1, 1, 1, 1, 1,
-0.566586, -1.035897, -3.025913, 1, 1, 1, 1, 1,
-0.5631308, -0.04611008, -2.65454, 1, 1, 1, 1, 1,
-0.5566587, 0.828624, -2.24788, 1, 1, 1, 1, 1,
-0.5521831, 0.4216497, -0.6000888, 1, 1, 1, 1, 1,
-0.5503461, -0.4661728, -1.820715, 1, 1, 1, 1, 1,
-0.5499121, -0.7711579, -3.168084, 1, 1, 1, 1, 1,
-0.5498629, 0.3843692, -1.357061, 1, 1, 1, 1, 1,
-0.548437, 2.055501, -0.01536673, 1, 1, 1, 1, 1,
-0.545601, 0.1990454, -0.8322202, 1, 1, 1, 1, 1,
-0.5359727, -1.616751, -3.340593, 1, 1, 1, 1, 1,
-0.5354306, 0.8384186, -1.511832, 0, 0, 1, 1, 1,
-0.5318526, 1.026809, -1.276765, 1, 0, 0, 1, 1,
-0.5288464, 1.57306, -1.649553, 1, 0, 0, 1, 1,
-0.5277821, -0.4496657, -1.721684, 1, 0, 0, 1, 1,
-0.5223011, -0.1452425, -1.808137, 1, 0, 0, 1, 1,
-0.5202041, -0.1068984, -0.2684816, 1, 0, 0, 1, 1,
-0.5187126, -1.308463, -2.675716, 0, 0, 0, 1, 1,
-0.5123899, 1.535946, 0.187629, 0, 0, 0, 1, 1,
-0.5091821, 1.329244, -0.9506407, 0, 0, 0, 1, 1,
-0.5014268, -0.9515468, -1.558024, 0, 0, 0, 1, 1,
-0.5006896, -0.5491539, -2.896418, 0, 0, 0, 1, 1,
-0.4999524, 0.6503295, 0.9206637, 0, 0, 0, 1, 1,
-0.4987509, 0.3831546, -1.518064, 0, 0, 0, 1, 1,
-0.4957038, -1.581859, -3.609838, 1, 1, 1, 1, 1,
-0.495066, -0.2345556, -3.147134, 1, 1, 1, 1, 1,
-0.4907834, -1.592164, -3.065193, 1, 1, 1, 1, 1,
-0.4903639, 0.01957402, -0.8779986, 1, 1, 1, 1, 1,
-0.4900881, 1.056765, 0.03657082, 1, 1, 1, 1, 1,
-0.4896709, -1.038568, -2.578198, 1, 1, 1, 1, 1,
-0.4864815, -1.564231, -2.870642, 1, 1, 1, 1, 1,
-0.4860106, -1.938664, -3.192976, 1, 1, 1, 1, 1,
-0.4824528, -0.5952519, -1.96954, 1, 1, 1, 1, 1,
-0.4813805, 1.71116, -0.1320976, 1, 1, 1, 1, 1,
-0.478752, 1.705802, -0.1122961, 1, 1, 1, 1, 1,
-0.4755381, -0.3381003, -2.730643, 1, 1, 1, 1, 1,
-0.4707773, -0.1452039, -2.287771, 1, 1, 1, 1, 1,
-0.468422, 1.255589, -0.4272048, 1, 1, 1, 1, 1,
-0.4637607, 1.068283, -1.011922, 1, 1, 1, 1, 1,
-0.4588071, 0.2314584, -1.516031, 0, 0, 1, 1, 1,
-0.457294, 0.5882007, -0.5464699, 1, 0, 0, 1, 1,
-0.4559593, -0.3582357, -3.461379, 1, 0, 0, 1, 1,
-0.4547676, -0.7070329, -2.500971, 1, 0, 0, 1, 1,
-0.4510635, -0.8305398, -2.655347, 1, 0, 0, 1, 1,
-0.450046, -0.7842787, -2.633934, 1, 0, 0, 1, 1,
-0.4473257, -0.6921766, -4.679551, 0, 0, 0, 1, 1,
-0.4457338, -0.06920113, -2.706525, 0, 0, 0, 1, 1,
-0.4424039, 0.8910117, 0.6868196, 0, 0, 0, 1, 1,
-0.4339465, 1.235675, 0.1869059, 0, 0, 0, 1, 1,
-0.4332692, -1.135562, -1.397964, 0, 0, 0, 1, 1,
-0.4286704, -0.1650236, -3.149739, 0, 0, 0, 1, 1,
-0.4253615, -0.1531105, -3.407474, 0, 0, 0, 1, 1,
-0.4252047, 0.99912, 0.9774622, 1, 1, 1, 1, 1,
-0.4232008, 1.763418, -0.8212293, 1, 1, 1, 1, 1,
-0.4199632, 0.4298822, -0.8227323, 1, 1, 1, 1, 1,
-0.4191259, 1.317761, 0.05021146, 1, 1, 1, 1, 1,
-0.4143934, 0.4564613, -0.9950083, 1, 1, 1, 1, 1,
-0.4113341, -1.197362, -3.382429, 1, 1, 1, 1, 1,
-0.410599, 0.4466374, -1.871008, 1, 1, 1, 1, 1,
-0.4098776, -1.417877, -2.474231, 1, 1, 1, 1, 1,
-0.4078349, -2.058735, -3.892977, 1, 1, 1, 1, 1,
-0.4046332, -0.932613, -3.964943, 1, 1, 1, 1, 1,
-0.3983311, 0.9128312, -1.39193, 1, 1, 1, 1, 1,
-0.3953319, 0.733326, -0.1430822, 1, 1, 1, 1, 1,
-0.3936188, 0.1271102, -1.784505, 1, 1, 1, 1, 1,
-0.3925188, 0.5492868, -0.3389726, 1, 1, 1, 1, 1,
-0.3916573, -1.126605, -3.334972, 1, 1, 1, 1, 1,
-0.3869427, -0.6382568, -3.215296, 0, 0, 1, 1, 1,
-0.3851179, -1.470783, -2.573576, 1, 0, 0, 1, 1,
-0.3829965, -1.484195, -3.229331, 1, 0, 0, 1, 1,
-0.3790555, 1.155843, -1.371727, 1, 0, 0, 1, 1,
-0.3784218, 0.1609863, -0.8986945, 1, 0, 0, 1, 1,
-0.3777263, -0.1443447, -2.580795, 1, 0, 0, 1, 1,
-0.3766878, 0.4011312, -1.473386, 0, 0, 0, 1, 1,
-0.3747085, 0.3417026, -0.5837705, 0, 0, 0, 1, 1,
-0.3724927, 0.5048203, -1.601666, 0, 0, 0, 1, 1,
-0.3722948, -0.4554765, -2.461625, 0, 0, 0, 1, 1,
-0.370355, -1.065874, -4.457205, 0, 0, 0, 1, 1,
-0.3698073, -0.4154205, -2.161557, 0, 0, 0, 1, 1,
-0.3693532, -0.3979735, -1.871361, 0, 0, 0, 1, 1,
-0.3633365, 1.569096, 1.373048, 1, 1, 1, 1, 1,
-0.3613586, -0.2686389, -2.995683, 1, 1, 1, 1, 1,
-0.3588407, 1.699268, -0.2088098, 1, 1, 1, 1, 1,
-0.352399, 0.2606811, 0.2872463, 1, 1, 1, 1, 1,
-0.3505533, 0.2405986, -1.447708, 1, 1, 1, 1, 1,
-0.347589, -0.3998321, -2.552464, 1, 1, 1, 1, 1,
-0.3417929, 2.073469, -0.6031399, 1, 1, 1, 1, 1,
-0.3369804, -1.013343, -5.57897, 1, 1, 1, 1, 1,
-0.332955, 0.6098847, -0.7088439, 1, 1, 1, 1, 1,
-0.3329347, 0.728076, -0.1752401, 1, 1, 1, 1, 1,
-0.3316045, 0.1291008, -1.170361, 1, 1, 1, 1, 1,
-0.3301544, -0.1177883, -1.041935, 1, 1, 1, 1, 1,
-0.3209905, -1.296278, -1.78277, 1, 1, 1, 1, 1,
-0.319061, 0.08799799, 0.3611726, 1, 1, 1, 1, 1,
-0.3113133, -0.2123643, -1.6608, 1, 1, 1, 1, 1,
-0.2972259, -0.1982968, -1.997273, 0, 0, 1, 1, 1,
-0.2961667, 0.8851927, -2.78201, 1, 0, 0, 1, 1,
-0.2946604, -1.071865, -4.355867, 1, 0, 0, 1, 1,
-0.2754788, -0.8426313, -3.380123, 1, 0, 0, 1, 1,
-0.2750317, 1.583824, 0.3898033, 1, 0, 0, 1, 1,
-0.2724433, 0.8337907, 0.9598214, 1, 0, 0, 1, 1,
-0.2695752, -0.3797365, -3.427336, 0, 0, 0, 1, 1,
-0.2627294, -0.2325416, -2.704968, 0, 0, 0, 1, 1,
-0.2544192, -0.02717005, -1.342242, 0, 0, 0, 1, 1,
-0.254063, -0.5883611, -3.232028, 0, 0, 0, 1, 1,
-0.25345, 0.3958972, 0.3108626, 0, 0, 0, 1, 1,
-0.2475454, 1.097504, -0.9997697, 0, 0, 0, 1, 1,
-0.2458121, 0.4420409, -0.4368804, 0, 0, 0, 1, 1,
-0.2430901, 0.7259248, 0.7126729, 1, 1, 1, 1, 1,
-0.2427001, 1.531056, -2.333341, 1, 1, 1, 1, 1,
-0.2419206, 0.1139138, -0.2539668, 1, 1, 1, 1, 1,
-0.2415204, -0.1624259, -1.648621, 1, 1, 1, 1, 1,
-0.2306567, 1.101049, 0.8768426, 1, 1, 1, 1, 1,
-0.2301799, -1.226836, -2.739226, 1, 1, 1, 1, 1,
-0.229164, -1.699207, -2.961792, 1, 1, 1, 1, 1,
-0.2262171, 0.08006313, -0.3704467, 1, 1, 1, 1, 1,
-0.2251268, -1.800473, -4.568532, 1, 1, 1, 1, 1,
-0.2216226, -0.2784687, -2.396171, 1, 1, 1, 1, 1,
-0.2198431, -0.6020927, -3.391321, 1, 1, 1, 1, 1,
-0.2178959, -0.9061297, -3.554713, 1, 1, 1, 1, 1,
-0.2100775, -0.5478365, -2.165523, 1, 1, 1, 1, 1,
-0.2069198, -1.813194, -4.230576, 1, 1, 1, 1, 1,
-0.2016575, -0.5684893, -3.429991, 1, 1, 1, 1, 1,
-0.1958927, -0.8436089, -3.42417, 0, 0, 1, 1, 1,
-0.1938523, 0.2529306, -2.10021, 1, 0, 0, 1, 1,
-0.1927031, 0.05549942, -0.8698353, 1, 0, 0, 1, 1,
-0.1907698, -0.692058, -3.497463, 1, 0, 0, 1, 1,
-0.1905013, -0.2399173, -2.687347, 1, 0, 0, 1, 1,
-0.1879508, -1.53103, -2.213509, 1, 0, 0, 1, 1,
-0.1870702, 0.2048073, -1.243633, 0, 0, 0, 1, 1,
-0.1847497, -0.9457855, -2.607081, 0, 0, 0, 1, 1,
-0.1801535, 0.2438633, -1.306646, 0, 0, 0, 1, 1,
-0.1789623, -1.393679, -3.008335, 0, 0, 0, 1, 1,
-0.1783849, 0.9568731, 0.4278327, 0, 0, 0, 1, 1,
-0.1759895, 0.4605096, -2.136455, 0, 0, 0, 1, 1,
-0.1743197, 0.698447, -1.323857, 0, 0, 0, 1, 1,
-0.1704038, -0.8375811, -2.373817, 1, 1, 1, 1, 1,
-0.156377, -0.1040981, -0.3465238, 1, 1, 1, 1, 1,
-0.1557371, -1.101154, -2.869407, 1, 1, 1, 1, 1,
-0.1513962, 0.7306007, -0.5842814, 1, 1, 1, 1, 1,
-0.1513008, 0.04542598, -1.191671, 1, 1, 1, 1, 1,
-0.1460883, 2.039029, -0.8653116, 1, 1, 1, 1, 1,
-0.145161, 0.413719, -0.6482291, 1, 1, 1, 1, 1,
-0.1440358, -0.3386844, -3.659167, 1, 1, 1, 1, 1,
-0.1434381, -0.2440204, -2.277728, 1, 1, 1, 1, 1,
-0.1423422, 0.6908562, 0.1203178, 1, 1, 1, 1, 1,
-0.1402177, -0.2722783, -3.512903, 1, 1, 1, 1, 1,
-0.1393124, 1.133021, -1.576769, 1, 1, 1, 1, 1,
-0.1381603, 0.2214415, -1.161558, 1, 1, 1, 1, 1,
-0.138031, 0.3755116, -1.242361, 1, 1, 1, 1, 1,
-0.1341432, 0.2249745, 0.4733352, 1, 1, 1, 1, 1,
-0.1337865, 0.08299194, -2.480713, 0, 0, 1, 1, 1,
-0.1335815, -0.3963767, -2.60366, 1, 0, 0, 1, 1,
-0.1332246, 0.4872936, 0.9874285, 1, 0, 0, 1, 1,
-0.1235138, -0.2754577, -3.057666, 1, 0, 0, 1, 1,
-0.1178268, -0.4841407, -2.945076, 1, 0, 0, 1, 1,
-0.1172653, 0.01816207, -2.861833, 1, 0, 0, 1, 1,
-0.1146548, 1.829495, -0.59248, 0, 0, 0, 1, 1,
-0.1143247, -0.9514465, -3.492624, 0, 0, 0, 1, 1,
-0.1045657, 1.23366, 0.540717, 0, 0, 0, 1, 1,
-0.102748, -1.056543, -4.556511, 0, 0, 0, 1, 1,
-0.09949744, 0.7671176, 0.1936712, 0, 0, 0, 1, 1,
-0.09949504, 0.282048, 0.6499771, 0, 0, 0, 1, 1,
-0.09083761, 0.5503281, -0.8257853, 0, 0, 0, 1, 1,
-0.09077284, -1.346859, -3.626543, 1, 1, 1, 1, 1,
-0.08989596, -0.6840949, -3.017132, 1, 1, 1, 1, 1,
-0.08809105, -1.582331, -3.32885, 1, 1, 1, 1, 1,
-0.08448683, 0.8022812, 1.408606, 1, 1, 1, 1, 1,
-0.08425429, -2.042187, -2.616228, 1, 1, 1, 1, 1,
-0.07944882, 0.5722834, 0.8132458, 1, 1, 1, 1, 1,
-0.07727478, -0.6310468, -2.535641, 1, 1, 1, 1, 1,
-0.07230871, -0.3532855, -3.440833, 1, 1, 1, 1, 1,
-0.0710598, 1.741815, -0.446126, 1, 1, 1, 1, 1,
-0.07079732, 0.200867, 0.9942063, 1, 1, 1, 1, 1,
-0.06981312, -0.1487821, -2.714086, 1, 1, 1, 1, 1,
-0.06352837, -2.238335, -4.586246, 1, 1, 1, 1, 1,
-0.06083681, 0.4479741, -1.35609, 1, 1, 1, 1, 1,
-0.05991086, -0.07030973, -2.648775, 1, 1, 1, 1, 1,
-0.05707061, 0.2092882, 0.2140566, 1, 1, 1, 1, 1,
-0.05619416, 0.8462297, -0.274493, 0, 0, 1, 1, 1,
-0.05263373, -0.2016294, -5.301097, 1, 0, 0, 1, 1,
-0.05227894, 0.5114913, -1.649181, 1, 0, 0, 1, 1,
-0.05081327, -1.303151, -3.692547, 1, 0, 0, 1, 1,
-0.04219618, 1.186621, -0.5265353, 1, 0, 0, 1, 1,
-0.0403421, -1.125026, -3.232907, 1, 0, 0, 1, 1,
-0.03456037, 0.4836639, 0.469927, 0, 0, 0, 1, 1,
-0.03395098, -0.09475148, -3.116625, 0, 0, 0, 1, 1,
-0.03241282, -1.138241, -4.087502, 0, 0, 0, 1, 1,
-0.03189272, -0.8761941, -1.355955, 0, 0, 0, 1, 1,
-0.02764206, -0.4839255, -2.162707, 0, 0, 0, 1, 1,
-0.02592206, 1.727952, 1.777269, 0, 0, 0, 1, 1,
-0.02321105, -1.076161, -2.74724, 0, 0, 0, 1, 1,
-0.02151474, 0.6336692, -2.408316, 1, 1, 1, 1, 1,
-0.02086777, 0.6916311, 0.2367905, 1, 1, 1, 1, 1,
-0.02064866, 0.7600216, -0.5375369, 1, 1, 1, 1, 1,
-0.01974866, -0.09240701, -2.935963, 1, 1, 1, 1, 1,
-0.01693184, 1.928824, -0.6269655, 1, 1, 1, 1, 1,
-0.01644806, 0.516849, 2.418645, 1, 1, 1, 1, 1,
-0.01055114, -0.6759288, -3.427176, 1, 1, 1, 1, 1,
-0.008451053, -0.4048094, -2.357544, 1, 1, 1, 1, 1,
-0.007900236, 0.8773518, 0.4183496, 1, 1, 1, 1, 1,
-0.00787987, -1.335217, -3.136173, 1, 1, 1, 1, 1,
0.002701941, -0.5254852, 1.199201, 1, 1, 1, 1, 1,
0.006031644, -0.5660139, 5.132742, 1, 1, 1, 1, 1,
0.008980417, 0.3193606, 0.05844733, 1, 1, 1, 1, 1,
0.009668305, -0.525865, 2.551919, 1, 1, 1, 1, 1,
0.009686496, 2.596683, -1.027516, 1, 1, 1, 1, 1,
0.01080769, -1.984823, 1.95887, 0, 0, 1, 1, 1,
0.01386828, -0.8011548, 0.4317861, 1, 0, 0, 1, 1,
0.01422681, 1.359938, 1.401555, 1, 0, 0, 1, 1,
0.01486138, 0.3498578, 0.3004763, 1, 0, 0, 1, 1,
0.01505251, 1.736102, 0.4066088, 1, 0, 0, 1, 1,
0.01721544, 0.4099338, -0.4834468, 1, 0, 0, 1, 1,
0.01735009, 0.4545182, 0.8749633, 0, 0, 0, 1, 1,
0.03100834, -0.119349, 2.695609, 0, 0, 0, 1, 1,
0.03392007, 2.20397, -0.462221, 0, 0, 0, 1, 1,
0.03633245, -0.794501, 2.668551, 0, 0, 0, 1, 1,
0.04012467, -0.9340995, 3.0326, 0, 0, 0, 1, 1,
0.04342702, 1.479746, -0.8625827, 0, 0, 0, 1, 1,
0.04480983, -0.4524597, 4.009119, 0, 0, 0, 1, 1,
0.04835719, -1.443304, 3.430606, 1, 1, 1, 1, 1,
0.04874293, -0.1856741, 1.321874, 1, 1, 1, 1, 1,
0.04951201, 1.796539, 0.4382503, 1, 1, 1, 1, 1,
0.05068316, -0.2626943, 2.813468, 1, 1, 1, 1, 1,
0.06229538, -0.8435805, 2.780504, 1, 1, 1, 1, 1,
0.06676693, 0.5783139, -0.934454, 1, 1, 1, 1, 1,
0.06757343, 1.105331, -0.9365509, 1, 1, 1, 1, 1,
0.06828326, 0.2510213, -0.4475006, 1, 1, 1, 1, 1,
0.06900164, 0.3895658, 2.236308, 1, 1, 1, 1, 1,
0.07436945, 0.6394858, 0.7363421, 1, 1, 1, 1, 1,
0.07535364, -0.6205679, 2.875859, 1, 1, 1, 1, 1,
0.07823364, -2.499362, 3.902626, 1, 1, 1, 1, 1,
0.08917291, 0.2866905, -0.3744747, 1, 1, 1, 1, 1,
0.08968361, 0.6630403, 0.8387264, 1, 1, 1, 1, 1,
0.08974256, 2.453403, -1.13918, 1, 1, 1, 1, 1,
0.09640943, -0.4582454, 1.738838, 0, 0, 1, 1, 1,
0.09730572, -0.5616636, 3.594637, 1, 0, 0, 1, 1,
0.1046855, 2.115583, -0.9419661, 1, 0, 0, 1, 1,
0.1057828, 0.8442705, 1.178937, 1, 0, 0, 1, 1,
0.1064981, -0.8641383, 2.329717, 1, 0, 0, 1, 1,
0.1091619, -1.187709, 4.628123, 1, 0, 0, 1, 1,
0.1141475, 0.6815718, 0.3268434, 0, 0, 0, 1, 1,
0.1208214, -0.2870665, 5.28576, 0, 0, 0, 1, 1,
0.1239714, -0.6836378, 3.325348, 0, 0, 0, 1, 1,
0.1249298, 1.825075, -0.8675089, 0, 0, 0, 1, 1,
0.1258035, -0.5292447, 2.436063, 0, 0, 0, 1, 1,
0.1282909, -0.7923943, 2.025197, 0, 0, 0, 1, 1,
0.130742, 0.8156207, 1.071532, 0, 0, 0, 1, 1,
0.1418189, -0.4210166, 1.616953, 1, 1, 1, 1, 1,
0.1418571, -0.1466254, 1.349857, 1, 1, 1, 1, 1,
0.1421662, 1.334031, 0.9133918, 1, 1, 1, 1, 1,
0.1422932, 0.4996273, -0.9573026, 1, 1, 1, 1, 1,
0.1423948, 0.9493595, 0.07124451, 1, 1, 1, 1, 1,
0.1440945, -0.004960123, 0.8442674, 1, 1, 1, 1, 1,
0.1477649, -1.653569, 3.012436, 1, 1, 1, 1, 1,
0.1487004, -0.223908, 4.576018, 1, 1, 1, 1, 1,
0.1512817, 0.1176077, 2.071315, 1, 1, 1, 1, 1,
0.1516995, -0.2428716, 2.866342, 1, 1, 1, 1, 1,
0.1528263, -0.7069225, 3.393622, 1, 1, 1, 1, 1,
0.1556625, 1.014578, 1.837113, 1, 1, 1, 1, 1,
0.1564931, 0.8388184, 0.4970523, 1, 1, 1, 1, 1,
0.1567035, -1.132529, 4.445318, 1, 1, 1, 1, 1,
0.1569064, -0.8254585, 3.239868, 1, 1, 1, 1, 1,
0.1569393, 0.07073629, -0.837545, 0, 0, 1, 1, 1,
0.1570327, -0.5058702, 3.087774, 1, 0, 0, 1, 1,
0.1579548, -0.4752562, 3.208942, 1, 0, 0, 1, 1,
0.1588917, -0.3188837, 3.753345, 1, 0, 0, 1, 1,
0.1589839, 1.30114, -0.194964, 1, 0, 0, 1, 1,
0.1598369, -0.3168481, 2.472738, 1, 0, 0, 1, 1,
0.1625451, 2.511119, 0.1980547, 0, 0, 0, 1, 1,
0.1639442, 1.005666, 0.6417856, 0, 0, 0, 1, 1,
0.1662416, 0.3852899, 2.125777, 0, 0, 0, 1, 1,
0.1677063, 0.08466467, 2.212081, 0, 0, 0, 1, 1,
0.1742855, 0.1093577, 0.04725032, 0, 0, 0, 1, 1,
0.1744743, 0.4426767, 1.250387, 0, 0, 0, 1, 1,
0.1831519, 0.8910968, 0.6699241, 0, 0, 0, 1, 1,
0.1836873, -1.604795, 2.658992, 1, 1, 1, 1, 1,
0.1842035, 0.0491951, 2.552107, 1, 1, 1, 1, 1,
0.1865524, 1.129585, -1.1626, 1, 1, 1, 1, 1,
0.1887149, 0.8494605, 1.240987, 1, 1, 1, 1, 1,
0.1905902, -1.556587, 2.83641, 1, 1, 1, 1, 1,
0.1906154, -1.240822, 2.737933, 1, 1, 1, 1, 1,
0.1951749, 0.8363273, 0.176025, 1, 1, 1, 1, 1,
0.1959939, -0.09016209, 1.911044, 1, 1, 1, 1, 1,
0.2016762, 0.525014, 1.005313, 1, 1, 1, 1, 1,
0.2020341, 0.8754024, 0.6356326, 1, 1, 1, 1, 1,
0.2074697, -0.6084895, 2.456469, 1, 1, 1, 1, 1,
0.2128612, 0.4552171, 0.8288786, 1, 1, 1, 1, 1,
0.2206919, 0.3648203, -0.4806459, 1, 1, 1, 1, 1,
0.2222413, 1.369649, 1.028512, 1, 1, 1, 1, 1,
0.2231036, 0.2962779, 0.6537351, 1, 1, 1, 1, 1,
0.2232241, -1.117212, 4.077012, 0, 0, 1, 1, 1,
0.2249857, 1.28488, 1.112018, 1, 0, 0, 1, 1,
0.2254724, 1.889843, 0.7271834, 1, 0, 0, 1, 1,
0.2261494, -1.261504, 2.484369, 1, 0, 0, 1, 1,
0.2266159, 0.3653735, 1.049929, 1, 0, 0, 1, 1,
0.2282612, -0.4376812, 3.357525, 1, 0, 0, 1, 1,
0.2317967, 0.1473818, 0.9338967, 0, 0, 0, 1, 1,
0.2331979, -0.7523664, 2.80221, 0, 0, 0, 1, 1,
0.2358817, 1.49586, -1.49945, 0, 0, 0, 1, 1,
0.2478122, -0.0181824, 2.013484, 0, 0, 0, 1, 1,
0.2493063, 2.151191, -0.1887308, 0, 0, 0, 1, 1,
0.2517515, -0.04656129, 1.94045, 0, 0, 0, 1, 1,
0.2529465, 0.5191165, -0.6674609, 0, 0, 0, 1, 1,
0.2546184, 1.69468, 1.993811, 1, 1, 1, 1, 1,
0.2616745, 2.122095, 0.300902, 1, 1, 1, 1, 1,
0.2658542, 1.545566, -0.1487886, 1, 1, 1, 1, 1,
0.266619, -0.07248588, 2.247314, 1, 1, 1, 1, 1,
0.2720045, 0.5668514, 0.02442755, 1, 1, 1, 1, 1,
0.2756242, -1.280487, 3.710344, 1, 1, 1, 1, 1,
0.2763748, -0.2755724, 2.147168, 1, 1, 1, 1, 1,
0.2771845, -1.035146, 1.501482, 1, 1, 1, 1, 1,
0.2775251, -0.278919, 5.571237, 1, 1, 1, 1, 1,
0.2818552, 1.060748, 1.299797, 1, 1, 1, 1, 1,
0.2826786, 1.01729, 1.371731, 1, 1, 1, 1, 1,
0.2905876, 0.2404135, 2.296458, 1, 1, 1, 1, 1,
0.2926149, -0.9239856, 3.022885, 1, 1, 1, 1, 1,
0.2945502, 0.7734237, 0.7245275, 1, 1, 1, 1, 1,
0.2990895, -1.709922, 2.368023, 1, 1, 1, 1, 1,
0.3006359, -0.8860015, 3.773981, 0, 0, 1, 1, 1,
0.3045132, 0.6197624, 0.1660737, 1, 0, 0, 1, 1,
0.3067249, -1.338717, 1.706034, 1, 0, 0, 1, 1,
0.3089144, -0.903788, 5.020069, 1, 0, 0, 1, 1,
0.3217768, -0.4460189, 3.519272, 1, 0, 0, 1, 1,
0.3234174, 0.1669769, 1.200723, 1, 0, 0, 1, 1,
0.3270238, 0.09123572, 1.605288, 0, 0, 0, 1, 1,
0.3287439, -0.9433252, 2.844486, 0, 0, 0, 1, 1,
0.333145, 0.9593616, -1.954987, 0, 0, 0, 1, 1,
0.3445972, -0.1118977, 2.056486, 0, 0, 0, 1, 1,
0.3453331, -0.5381839, 4.283164, 0, 0, 0, 1, 1,
0.3475996, 0.7754368, 1.666806, 0, 0, 0, 1, 1,
0.3485387, -0.2781273, 3.998482, 0, 0, 0, 1, 1,
0.3500358, -0.4224848, 3.467492, 1, 1, 1, 1, 1,
0.3526933, -1.131888, 1.898733, 1, 1, 1, 1, 1,
0.353431, 0.5668428, 1.892486, 1, 1, 1, 1, 1,
0.3553844, 0.638733, -0.3806712, 1, 1, 1, 1, 1,
0.3632143, 1.421236, 0.9269463, 1, 1, 1, 1, 1,
0.3705783, 0.5294092, 3.954188, 1, 1, 1, 1, 1,
0.3711909, 0.9722115, 0.3156406, 1, 1, 1, 1, 1,
0.3778927, -0.4970942, 3.439744, 1, 1, 1, 1, 1,
0.3819938, -1.906951, 4.081995, 1, 1, 1, 1, 1,
0.3833108, 1.435516, 1.215561, 1, 1, 1, 1, 1,
0.3884559, -1.065499, 1.795484, 1, 1, 1, 1, 1,
0.3916693, 0.2180529, 1.161568, 1, 1, 1, 1, 1,
0.3933236, 0.2555708, 0.8627703, 1, 1, 1, 1, 1,
0.3939593, -1.486545, 3.171735, 1, 1, 1, 1, 1,
0.3941321, 0.361699, -0.4488067, 1, 1, 1, 1, 1,
0.3978148, 1.307156, -1.204185, 0, 0, 1, 1, 1,
0.3980733, 0.2251791, 0.1994373, 1, 0, 0, 1, 1,
0.3983791, 0.1606339, 1.366422, 1, 0, 0, 1, 1,
0.3997696, 1.247876, 1.268357, 1, 0, 0, 1, 1,
0.4007909, -0.4123513, 1.225956, 1, 0, 0, 1, 1,
0.40823, 0.315293, 0.8844821, 1, 0, 0, 1, 1,
0.4158281, 0.8645861, 0.1053088, 0, 0, 0, 1, 1,
0.4188676, -1.904573, 3.776891, 0, 0, 0, 1, 1,
0.42644, 0.1079225, 0.6312973, 0, 0, 0, 1, 1,
0.4357297, -0.4726929, 2.319185, 0, 0, 0, 1, 1,
0.4416977, 0.5318746, 0.1017815, 0, 0, 0, 1, 1,
0.4449553, 2.153196, 0.6299143, 0, 0, 0, 1, 1,
0.4450785, 0.6700963, 3.152418, 0, 0, 0, 1, 1,
0.4476285, 1.271595, -0.8112767, 1, 1, 1, 1, 1,
0.4481305, 1.7233, -1.436471, 1, 1, 1, 1, 1,
0.4484595, -1.138929, 2.785273, 1, 1, 1, 1, 1,
0.4604418, 0.09379759, -0.8569297, 1, 1, 1, 1, 1,
0.4615123, -0.7373087, 2.020295, 1, 1, 1, 1, 1,
0.4632813, -0.001869543, -0.1236755, 1, 1, 1, 1, 1,
0.467371, -1.84214, 4.595158, 1, 1, 1, 1, 1,
0.4674312, -0.5971584, 3.364085, 1, 1, 1, 1, 1,
0.467917, 0.2063531, 1.419179, 1, 1, 1, 1, 1,
0.4703434, 1.240174, -0.5268976, 1, 1, 1, 1, 1,
0.4725355, -0.1118755, 2.97817, 1, 1, 1, 1, 1,
0.4778216, -0.3882755, 1.86303, 1, 1, 1, 1, 1,
0.4781992, 0.3289306, 0.5377294, 1, 1, 1, 1, 1,
0.4789867, -0.9287369, 1.359168, 1, 1, 1, 1, 1,
0.4796738, 0.2048798, 2.716217, 1, 1, 1, 1, 1,
0.4803676, -0.9379764, 4.063704, 0, 0, 1, 1, 1,
0.4867914, 0.8468412, 1.439332, 1, 0, 0, 1, 1,
0.4883877, -0.6766223, 1.101354, 1, 0, 0, 1, 1,
0.4963955, 0.1186227, 1.484534, 1, 0, 0, 1, 1,
0.4974119, -0.02511164, 3.127482, 1, 0, 0, 1, 1,
0.4991153, -0.4538585, 0.9521606, 1, 0, 0, 1, 1,
0.5030732, 1.834849, -0.6098185, 0, 0, 0, 1, 1,
0.50433, -0.7435197, 2.844385, 0, 0, 0, 1, 1,
0.5046282, -1.092988, 1.805014, 0, 0, 0, 1, 1,
0.5063954, -0.07935452, 2.236473, 0, 0, 0, 1, 1,
0.5071807, 1.159784, 1.695373, 0, 0, 0, 1, 1,
0.5091435, -0.8122117, 1.868752, 0, 0, 0, 1, 1,
0.5106261, 0.9129488, 1.406217, 0, 0, 0, 1, 1,
0.5130267, 0.4947193, -0.02753477, 1, 1, 1, 1, 1,
0.5161989, -1.812021, 3.945692, 1, 1, 1, 1, 1,
0.5165169, 0.6630274, 1.419215, 1, 1, 1, 1, 1,
0.5266714, 1.178911, 1.411044, 1, 1, 1, 1, 1,
0.5282667, -0.07581755, 3.410921, 1, 1, 1, 1, 1,
0.5350414, -0.2496545, 1.630794, 1, 1, 1, 1, 1,
0.536347, 0.9271552, 1.127654, 1, 1, 1, 1, 1,
0.5376918, 1.153777, -0.1279376, 1, 1, 1, 1, 1,
0.5441338, -0.2709883, 2.074796, 1, 1, 1, 1, 1,
0.5441706, -0.2272972, 2.193607, 1, 1, 1, 1, 1,
0.5452186, 1.058378, 0.5049732, 1, 1, 1, 1, 1,
0.5468149, -0.07197526, 4.32138, 1, 1, 1, 1, 1,
0.5504375, 0.4954047, 0.002062743, 1, 1, 1, 1, 1,
0.5528299, -1.430189, 2.552881, 1, 1, 1, 1, 1,
0.5541042, 0.2020864, 1.290615, 1, 1, 1, 1, 1,
0.5567365, -0.5898709, 1.645965, 0, 0, 1, 1, 1,
0.5572362, 0.5521963, 0.5942155, 1, 0, 0, 1, 1,
0.5627824, 0.8639117, 0.1350701, 1, 0, 0, 1, 1,
0.5642607, 1.371721, -0.785398, 1, 0, 0, 1, 1,
0.5643913, -0.5862453, 3.406314, 1, 0, 0, 1, 1,
0.5664682, -0.6329237, 3.153538, 1, 0, 0, 1, 1,
0.570643, 1.709532, -0.852267, 0, 0, 0, 1, 1,
0.5756748, 1.455424, -0.3952768, 0, 0, 0, 1, 1,
0.5788667, 0.7313391, -0.9940915, 0, 0, 0, 1, 1,
0.5792106, -0.5618725, 1.405376, 0, 0, 0, 1, 1,
0.5800383, -0.6179059, 3.540156, 0, 0, 0, 1, 1,
0.5853657, -1.14172, 2.005433, 0, 0, 0, 1, 1,
0.5883402, 1.001039, 0.89798, 0, 0, 0, 1, 1,
0.5897905, -1.01654, 4.101804, 1, 1, 1, 1, 1,
0.5909346, -1.685007, 3.347798, 1, 1, 1, 1, 1,
0.5912592, -0.5163538, 1.61128, 1, 1, 1, 1, 1,
0.5931312, 0.1672277, -0.3753734, 1, 1, 1, 1, 1,
0.5933841, 0.7140816, -0.5391908, 1, 1, 1, 1, 1,
0.5946539, -1.552624, 3.041372, 1, 1, 1, 1, 1,
0.5947158, -0.7577013, 1.020912, 1, 1, 1, 1, 1,
0.5947292, -0.1786913, -0.04049517, 1, 1, 1, 1, 1,
0.6126919, -2.326819, 2.967146, 1, 1, 1, 1, 1,
0.6159381, 0.194015, 1.690932, 1, 1, 1, 1, 1,
0.6200605, 2.272621, 0.7662493, 1, 1, 1, 1, 1,
0.6360299, -2.228078, 2.693609, 1, 1, 1, 1, 1,
0.6399586, 1.82618, 1.083323, 1, 1, 1, 1, 1,
0.6517564, 0.2850307, 2.177667, 1, 1, 1, 1, 1,
0.6563789, -0.04217914, 1.562418, 1, 1, 1, 1, 1,
0.6577863, -0.7993099, 1.911551, 0, 0, 1, 1, 1,
0.6597118, -1.239614, 3.394515, 1, 0, 0, 1, 1,
0.6672835, -0.2317786, 2.294736, 1, 0, 0, 1, 1,
0.6700992, -0.2622599, 3.666678, 1, 0, 0, 1, 1,
0.6783924, -1.149651, 1.93001, 1, 0, 0, 1, 1,
0.6836075, 0.09126507, 2.239637, 1, 0, 0, 1, 1,
0.6859187, -1.354878, 2.028777, 0, 0, 0, 1, 1,
0.6881692, 0.6005228, 0.656388, 0, 0, 0, 1, 1,
0.6883394, 0.6469093, -0.4748052, 0, 0, 0, 1, 1,
0.6903734, -1.32663, 2.61399, 0, 0, 0, 1, 1,
0.6934636, -0.05325467, 0.8381768, 0, 0, 0, 1, 1,
0.694868, -0.58854, 2.279226, 0, 0, 0, 1, 1,
0.6975813, 0.1323072, 0.002203185, 0, 0, 0, 1, 1,
0.6983321, 0.681435, 1.066039, 1, 1, 1, 1, 1,
0.6984419, -0.5929028, 1.03586, 1, 1, 1, 1, 1,
0.7039558, -0.3140726, 0.7007618, 1, 1, 1, 1, 1,
0.7041726, 0.8384123, 1.329728, 1, 1, 1, 1, 1,
0.7103923, -0.2534828, 2.473428, 1, 1, 1, 1, 1,
0.7142424, -0.5816552, 1.332317, 1, 1, 1, 1, 1,
0.7152689, -0.7298071, 3.204232, 1, 1, 1, 1, 1,
0.7164257, 1.484925, -0.1335959, 1, 1, 1, 1, 1,
0.7173388, 0.2346483, 1.404257, 1, 1, 1, 1, 1,
0.7263286, -0.7949486, 2.435895, 1, 1, 1, 1, 1,
0.7280378, 0.776562, 0.1758185, 1, 1, 1, 1, 1,
0.7305766, 1.46112, 0.282365, 1, 1, 1, 1, 1,
0.7324932, -0.4795858, 1.965528, 1, 1, 1, 1, 1,
0.7362336, -0.3570672, 0.18707, 1, 1, 1, 1, 1,
0.7377785, 0.2938174, 1.505175, 1, 1, 1, 1, 1,
0.738935, 1.234838, 0.6331412, 0, 0, 1, 1, 1,
0.7410386, -1.255069, 0.4882141, 1, 0, 0, 1, 1,
0.7419719, 0.2010096, 1.293714, 1, 0, 0, 1, 1,
0.7493064, 0.7106242, 1.031504, 1, 0, 0, 1, 1,
0.7607245, 0.04617684, 1.92513, 1, 0, 0, 1, 1,
0.7717413, 0.8411322, 1.320316, 1, 0, 0, 1, 1,
0.7731658, 2.22159, 0.4278078, 0, 0, 0, 1, 1,
0.7773572, -1.459745, 1.835569, 0, 0, 0, 1, 1,
0.7797108, -0.8024662, 4.460683, 0, 0, 0, 1, 1,
0.7807554, -0.8486551, 2.462315, 0, 0, 0, 1, 1,
0.7820036, -0.08422914, 2.155632, 0, 0, 0, 1, 1,
0.7847588, 0.01309518, 2.06051, 0, 0, 0, 1, 1,
0.7860919, 0.7048708, -2.026982, 0, 0, 0, 1, 1,
0.7956132, 1.698714, 1.854035, 1, 1, 1, 1, 1,
0.799123, 2.307663, 1.331825, 1, 1, 1, 1, 1,
0.7999316, -0.03082169, 0.8903267, 1, 1, 1, 1, 1,
0.8012529, 0.09129855, 0.9544206, 1, 1, 1, 1, 1,
0.8022138, 0.1505854, 3.218843, 1, 1, 1, 1, 1,
0.8029221, 0.6433918, 2.970347, 1, 1, 1, 1, 1,
0.8104788, 0.1199041, 1.292321, 1, 1, 1, 1, 1,
0.8112842, 0.9943273, 1.041871, 1, 1, 1, 1, 1,
0.813955, 1.515724, 0.0750249, 1, 1, 1, 1, 1,
0.8225545, -0.02553904, 2.461258, 1, 1, 1, 1, 1,
0.8304319, -1.387841, 0.08965672, 1, 1, 1, 1, 1,
0.8389882, -0.450874, 1.469571, 1, 1, 1, 1, 1,
0.8395551, -0.2404893, 4.0595, 1, 1, 1, 1, 1,
0.8401626, 0.3990861, 3.331376, 1, 1, 1, 1, 1,
0.8405193, -0.8984858, 2.174744, 1, 1, 1, 1, 1,
0.840827, -2.960618, 2.852441, 0, 0, 1, 1, 1,
0.8452546, 0.2096708, 1.177936, 1, 0, 0, 1, 1,
0.8499519, 0.408603, 1.735292, 1, 0, 0, 1, 1,
0.850404, 0.6238331, -0.2290565, 1, 0, 0, 1, 1,
0.8506467, 0.1095994, 2.237087, 1, 0, 0, 1, 1,
0.8579179, -1.262833, 2.525718, 1, 0, 0, 1, 1,
0.8584598, -1.852008, 2.680672, 0, 0, 0, 1, 1,
0.8605146, -0.6211131, 1.661012, 0, 0, 0, 1, 1,
0.8625168, 1.543787, 2.016456, 0, 0, 0, 1, 1,
0.8629614, -0.05613853, 1.242514, 0, 0, 0, 1, 1,
0.8713621, 0.9153318, -1.56666, 0, 0, 0, 1, 1,
0.8875456, 0.12891, 1.784401, 0, 0, 0, 1, 1,
0.892696, 0.7174805, 1.241663, 0, 0, 0, 1, 1,
0.8930785, 1.499746, 0.9411222, 1, 1, 1, 1, 1,
0.8931679, 0.2935367, 0.6701471, 1, 1, 1, 1, 1,
0.894309, -1.238396, 1.67802, 1, 1, 1, 1, 1,
0.8943411, -0.7598677, 2.940992, 1, 1, 1, 1, 1,
0.9016284, -1.127026, 1.788241, 1, 1, 1, 1, 1,
0.901948, -0.1549838, 1.945818, 1, 1, 1, 1, 1,
0.9020147, 1.454817, -0.1364471, 1, 1, 1, 1, 1,
0.907876, -1.331655, 1.208211, 1, 1, 1, 1, 1,
0.9093575, 1.142436, -0.6268464, 1, 1, 1, 1, 1,
0.9114631, -1.030885, 3.250651, 1, 1, 1, 1, 1,
0.9121103, 0.3796028, 1.468463, 1, 1, 1, 1, 1,
0.9129878, 1.512405, 0.04101093, 1, 1, 1, 1, 1,
0.9134421, -1.222241, 2.527586, 1, 1, 1, 1, 1,
0.9139274, -0.7986268, 2.572607, 1, 1, 1, 1, 1,
0.9221213, 0.8320825, 2.555351, 1, 1, 1, 1, 1,
0.9257952, 0.7266224, 2.204135, 0, 0, 1, 1, 1,
0.9277381, -0.7710899, 2.451394, 1, 0, 0, 1, 1,
0.9357311, 0.2803165, 1.596695, 1, 0, 0, 1, 1,
0.9477734, -0.2267579, 1.923878, 1, 0, 0, 1, 1,
0.9500437, 0.3053482, 1.277204, 1, 0, 0, 1, 1,
0.9524859, 0.607887, 3.496616, 1, 0, 0, 1, 1,
0.9556, -0.4343216, 2.278467, 0, 0, 0, 1, 1,
0.9578738, 1.34976, 0.07006206, 0, 0, 0, 1, 1,
0.9590208, 0.1997293, 3.0281, 0, 0, 0, 1, 1,
0.9628297, -0.4270521, 3.211459, 0, 0, 0, 1, 1,
0.9629855, -0.2383921, 2.310617, 0, 0, 0, 1, 1,
0.9643451, -1.284284, 2.002342, 0, 0, 0, 1, 1,
0.9667713, 1.359125, 1.117901, 0, 0, 0, 1, 1,
0.9672174, 1.707393, -0.5855349, 1, 1, 1, 1, 1,
0.9788166, -1.458575, 2.089959, 1, 1, 1, 1, 1,
0.9919243, -0.1081251, 1.47208, 1, 1, 1, 1, 1,
1.008732, 0.07358401, 2.567087, 1, 1, 1, 1, 1,
1.014293, -1.02686, 2.365835, 1, 1, 1, 1, 1,
1.01488, 0.7305894, 1.508862, 1, 1, 1, 1, 1,
1.017818, 0.4746336, 1.152768, 1, 1, 1, 1, 1,
1.018861, -0.4714467, 3.04208, 1, 1, 1, 1, 1,
1.021773, 0.1581866, 2.813427, 1, 1, 1, 1, 1,
1.024798, -0.4316732, 1.282032, 1, 1, 1, 1, 1,
1.032501, 0.02867821, 2.249168, 1, 1, 1, 1, 1,
1.039084, -0.8918405, 3.440305, 1, 1, 1, 1, 1,
1.043186, 0.6362737, -1.576971, 1, 1, 1, 1, 1,
1.043849, 0.2390202, 1.777932, 1, 1, 1, 1, 1,
1.044338, -1.139488, 0.9771701, 1, 1, 1, 1, 1,
1.044932, -0.6016471, 0.8891512, 0, 0, 1, 1, 1,
1.045945, -2.285195, 3.043717, 1, 0, 0, 1, 1,
1.055605, -0.7541015, 3.906968, 1, 0, 0, 1, 1,
1.06191, 1.453365, 0.5213463, 1, 0, 0, 1, 1,
1.065804, 0.6354966, 0.04361962, 1, 0, 0, 1, 1,
1.068453, -0.2830432, 2.844034, 1, 0, 0, 1, 1,
1.068988, 0.6756829, -0.2915223, 0, 0, 0, 1, 1,
1.076658, -0.2226113, 1.148148, 0, 0, 0, 1, 1,
1.085597, 1.173821, -0.2714881, 0, 0, 0, 1, 1,
1.086988, 1.621068, 1.329644, 0, 0, 0, 1, 1,
1.092177, 0.6221538, 1.393516, 0, 0, 0, 1, 1,
1.0949, -1.374021, 2.121093, 0, 0, 0, 1, 1,
1.095331, 0.6281205, 0.8041244, 0, 0, 0, 1, 1,
1.096495, 0.487043, 0.1331697, 1, 1, 1, 1, 1,
1.099724, -0.3913659, 3.105872, 1, 1, 1, 1, 1,
1.100066, -1.459798, 0.6265749, 1, 1, 1, 1, 1,
1.107851, -0.1437502, 1.84938, 1, 1, 1, 1, 1,
1.124921, -1.477728, 1.836318, 1, 1, 1, 1, 1,
1.127938, 1.536831, -0.5245955, 1, 1, 1, 1, 1,
1.132663, 0.5323402, 1.819575, 1, 1, 1, 1, 1,
1.133258, 0.4375125, 2.585793, 1, 1, 1, 1, 1,
1.134665, -1.085008, 2.541505, 1, 1, 1, 1, 1,
1.138523, -1.890186, 3.291341, 1, 1, 1, 1, 1,
1.141235, 0.5469043, -0.188502, 1, 1, 1, 1, 1,
1.141915, 0.4362666, 1.431067, 1, 1, 1, 1, 1,
1.141953, 1.340768, -0.03947163, 1, 1, 1, 1, 1,
1.154314, -1.239255, 2.318451, 1, 1, 1, 1, 1,
1.165282, 0.1694269, 2.744565, 1, 1, 1, 1, 1,
1.169542, 0.4270167, 2.0324, 0, 0, 1, 1, 1,
1.173507, 0.02533932, 1.705352, 1, 0, 0, 1, 1,
1.174883, -0.5044398, 1.304854, 1, 0, 0, 1, 1,
1.181255, 1.508837, 0.8449048, 1, 0, 0, 1, 1,
1.209955, -0.5369194, 0.2319773, 1, 0, 0, 1, 1,
1.213163, -1.55625, 3.191755, 1, 0, 0, 1, 1,
1.216172, 1.072668, -0.5707626, 0, 0, 0, 1, 1,
1.223763, -0.4273407, 1.411933, 0, 0, 0, 1, 1,
1.230179, -0.4419831, 2.957852, 0, 0, 0, 1, 1,
1.238188, -0.8557507, 3.266859, 0, 0, 0, 1, 1,
1.240333, -1.977818, 3.145935, 0, 0, 0, 1, 1,
1.244182, 2.521422, 0.8355333, 0, 0, 0, 1, 1,
1.254786, -1.085291, 3.876641, 0, 0, 0, 1, 1,
1.254898, -0.346523, 3.068995, 1, 1, 1, 1, 1,
1.25995, 1.963254, 1.784263, 1, 1, 1, 1, 1,
1.270043, -0.9554361, 2.545577, 1, 1, 1, 1, 1,
1.273224, 0.04060939, 2.936093, 1, 1, 1, 1, 1,
1.278634, -1.408393, 1.742545, 1, 1, 1, 1, 1,
1.281502, -0.9706283, 1.775105, 1, 1, 1, 1, 1,
1.284163, -0.4753827, 3.569722, 1, 1, 1, 1, 1,
1.289988, 0.9929535, 3.896145, 1, 1, 1, 1, 1,
1.290639, 0.1633743, 0.7773443, 1, 1, 1, 1, 1,
1.300508, -0.2304188, 0.4638981, 1, 1, 1, 1, 1,
1.303573, 0.1506689, 1.952824, 1, 1, 1, 1, 1,
1.311883, 1.411063, 0.5139424, 1, 1, 1, 1, 1,
1.312712, -1.309184, 2.063173, 1, 1, 1, 1, 1,
1.322082, 0.9054232, 0.933655, 1, 1, 1, 1, 1,
1.336742, -1.091662, 2.205695, 1, 1, 1, 1, 1,
1.340138, -1.091633, 3.143488, 0, 0, 1, 1, 1,
1.342961, 0.2221644, 1.860415, 1, 0, 0, 1, 1,
1.348182, 0.372416, 1.10105, 1, 0, 0, 1, 1,
1.352655, 0.7709461, 2.810261, 1, 0, 0, 1, 1,
1.356666, 0.001501745, 1.884472, 1, 0, 0, 1, 1,
1.364954, -0.312696, -0.06026841, 1, 0, 0, 1, 1,
1.367028, -0.1859926, 0.2790605, 0, 0, 0, 1, 1,
1.371636, -0.1526813, 1.469462, 0, 0, 0, 1, 1,
1.372089, -0.3567555, 2.08789, 0, 0, 0, 1, 1,
1.379352, -1.589078, 0.4480018, 0, 0, 0, 1, 1,
1.382735, 1.07147, -1.205036, 0, 0, 0, 1, 1,
1.384291, 2.497218, 0.9434085, 0, 0, 0, 1, 1,
1.396382, -0.3860219, -0.1248895, 0, 0, 0, 1, 1,
1.39975, -0.1239794, 2.17008, 1, 1, 1, 1, 1,
1.409698, -1.105296, 2.785711, 1, 1, 1, 1, 1,
1.41242, -2.197664, 2.169842, 1, 1, 1, 1, 1,
1.413648, 0.5293553, 1.287003, 1, 1, 1, 1, 1,
1.419052, 0.8651454, 1.037822, 1, 1, 1, 1, 1,
1.422612, -1.267553, 2.783712, 1, 1, 1, 1, 1,
1.44491, -0.7400378, 1.985175, 1, 1, 1, 1, 1,
1.457805, -1.088736, 2.569193, 1, 1, 1, 1, 1,
1.471462, 2.318843, 0.2837475, 1, 1, 1, 1, 1,
1.486888, -0.2990115, 2.408687, 1, 1, 1, 1, 1,
1.48785, 1.129496, 1.289102, 1, 1, 1, 1, 1,
1.488684, 1.590732, 0.6607432, 1, 1, 1, 1, 1,
1.502234, 0.5925509, 1.649637, 1, 1, 1, 1, 1,
1.513206, -0.2108642, 2.687506, 1, 1, 1, 1, 1,
1.513868, -1.048109, 3.963953, 1, 1, 1, 1, 1,
1.516601, 0.5754243, 1.301361, 0, 0, 1, 1, 1,
1.516786, 0.45665, 1.919713, 1, 0, 0, 1, 1,
1.519609, 0.7929603, 1.529772, 1, 0, 0, 1, 1,
1.524355, 0.3880429, 2.969666, 1, 0, 0, 1, 1,
1.529222, -0.09964861, 1.543446, 1, 0, 0, 1, 1,
1.534131, 0.8942987, 2.765057, 1, 0, 0, 1, 1,
1.535428, 0.1115468, 0.3052806, 0, 0, 0, 1, 1,
1.541054, -0.3358499, 2.886654, 0, 0, 0, 1, 1,
1.541529, 1.533735, 2.153321, 0, 0, 0, 1, 1,
1.546076, 0.7455632, 0.9733189, 0, 0, 0, 1, 1,
1.552298, -0.9399443, 2.056847, 0, 0, 0, 1, 1,
1.561783, -0.3503763, 0.9740644, 0, 0, 0, 1, 1,
1.567016, -0.2586829, 1.434805, 0, 0, 0, 1, 1,
1.571666, 0.1092998, 0.9205627, 1, 1, 1, 1, 1,
1.573321, 1.126491, 0.01180656, 1, 1, 1, 1, 1,
1.581789, -0.3603053, 2.692484, 1, 1, 1, 1, 1,
1.583467, 0.5127686, 1.543483, 1, 1, 1, 1, 1,
1.58887, -0.638421, 1.612061, 1, 1, 1, 1, 1,
1.588899, -2.081223, 3.945078, 1, 1, 1, 1, 1,
1.599038, -1.707428, 2.157629, 1, 1, 1, 1, 1,
1.617267, 0.1888373, 3.353864, 1, 1, 1, 1, 1,
1.620733, 0.3292131, 2.652674, 1, 1, 1, 1, 1,
1.627699, 0.9478407, 0.8268675, 1, 1, 1, 1, 1,
1.635638, -0.2187932, 1.487948, 1, 1, 1, 1, 1,
1.640184, -0.2405752, 1.438646, 1, 1, 1, 1, 1,
1.642029, -0.4518583, 1.903011, 1, 1, 1, 1, 1,
1.66273, 0.1292569, 2.01329, 1, 1, 1, 1, 1,
1.673226, 0.9643202, 0.7118058, 1, 1, 1, 1, 1,
1.678782, -2.017787, 2.968895, 0, 0, 1, 1, 1,
1.683161, 0.1631589, 2.597455, 1, 0, 0, 1, 1,
1.689127, 0.5669851, -0.9581136, 1, 0, 0, 1, 1,
1.70511, -0.7474818, 3.754353, 1, 0, 0, 1, 1,
1.713487, -1.48024, 2.609453, 1, 0, 0, 1, 1,
1.740973, 0.09623646, 3.270681, 1, 0, 0, 1, 1,
1.749793, -1.403163, 2.402736, 0, 0, 0, 1, 1,
1.778154, 0.6726027, 2.539369, 0, 0, 0, 1, 1,
1.778336, 2.173227, -0.04318951, 0, 0, 0, 1, 1,
1.778378, -0.09106868, 2.532144, 0, 0, 0, 1, 1,
1.783362, -0.07790502, 1.528155, 0, 0, 0, 1, 1,
1.788615, -0.1055247, 4.232772, 0, 0, 0, 1, 1,
1.80468, 1.33949, 0.2109829, 0, 0, 0, 1, 1,
1.816945, -0.6068748, 3.126039, 1, 1, 1, 1, 1,
1.817933, 0.5935048, 0.5128568, 1, 1, 1, 1, 1,
1.824407, 0.5296247, 0.7491984, 1, 1, 1, 1, 1,
1.831069, -0.8847549, 1.181237, 1, 1, 1, 1, 1,
1.858695, -1.663559, 3.832659, 1, 1, 1, 1, 1,
1.865451, -1.030153, 2.032224, 1, 1, 1, 1, 1,
1.868304, 1.266579, 0.8874351, 1, 1, 1, 1, 1,
1.878403, 0.3723814, -0.4812101, 1, 1, 1, 1, 1,
1.888721, -0.1756575, 0.251229, 1, 1, 1, 1, 1,
1.898525, -1.116121, 2.347656, 1, 1, 1, 1, 1,
1.910295, 1.472203, 1.427452, 1, 1, 1, 1, 1,
1.913321, -2.486272, 2.269199, 1, 1, 1, 1, 1,
1.915669, -0.7802687, 1.65832, 1, 1, 1, 1, 1,
1.921025, 0.6331947, -0.7172677, 1, 1, 1, 1, 1,
1.931338, -2.349775, 1.420408, 1, 1, 1, 1, 1,
1.952394, -1.109629, 1.004792, 0, 0, 1, 1, 1,
1.957965, -0.2789491, 0.1819119, 1, 0, 0, 1, 1,
1.958609, 0.03966299, 0.8656619, 1, 0, 0, 1, 1,
1.964944, 0.3703345, 1.084781, 1, 0, 0, 1, 1,
2.050141, 0.6706417, 0.3482859, 1, 0, 0, 1, 1,
2.070056, -0.1042643, 1.636129, 1, 0, 0, 1, 1,
2.094347, -1.06038, 0.6230386, 0, 0, 0, 1, 1,
2.117222, 1.299343, 1.751328, 0, 0, 0, 1, 1,
2.134304, 0.05707784, 1.440311, 0, 0, 0, 1, 1,
2.139117, 1.449027, 1.743825, 0, 0, 0, 1, 1,
2.139884, 0.255762, 1.372924, 0, 0, 0, 1, 1,
2.203083, 0.578205, 0.1266985, 0, 0, 0, 1, 1,
2.203691, 1.556072, 0.23184, 0, 0, 0, 1, 1,
2.213439, -0.6490083, 2.887444, 1, 1, 1, 1, 1,
2.282849, -0.9153001, 1.647045, 1, 1, 1, 1, 1,
2.506495, -2.280184, 1.479809, 1, 1, 1, 1, 1,
2.583548, 1.145343, -1.105395, 1, 1, 1, 1, 1,
2.741825, -0.6182133, 1.381211, 1, 1, 1, 1, 1,
2.983326, 0.3733104, 1.147628, 1, 1, 1, 1, 1,
3.478146, 0.5413519, 0.3726032, 1, 1, 1, 1, 1
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
var radius = 9.769942;
var distance = 34.31651;
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
mvMatrix.translate( -0.2826797, -0.1711271, 0.07801104 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.31651);
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
