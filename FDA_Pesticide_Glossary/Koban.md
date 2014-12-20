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
-3.082043, 0.2290536, -1.601654, 1, 0, 0, 1,
-2.919668, 0.3766233, 0.190849, 1, 0.007843138, 0, 1,
-2.745677, -1.769535, -2.436451, 1, 0.01176471, 0, 1,
-2.737396, -1.456476, -0.9051696, 1, 0.01960784, 0, 1,
-2.621302, -0.4736909, -1.693803, 1, 0.02352941, 0, 1,
-2.602823, 0.4226684, -2.322045, 1, 0.03137255, 0, 1,
-2.576425, 0.2039937, -1.622779, 1, 0.03529412, 0, 1,
-2.540603, -0.3927535, -3.006597, 1, 0.04313726, 0, 1,
-2.47604, 1.016059, -0.5351172, 1, 0.04705882, 0, 1,
-2.448848, 0.7067248, -1.272726, 1, 0.05490196, 0, 1,
-2.368612, 1.365945, -0.2305854, 1, 0.05882353, 0, 1,
-2.337846, 0.06734069, -0.7907724, 1, 0.06666667, 0, 1,
-2.27382, 1.156012, -1.825722, 1, 0.07058824, 0, 1,
-2.235772, 0.3541332, 0.1197332, 1, 0.07843138, 0, 1,
-2.233968, 2.071297, -1.164766, 1, 0.08235294, 0, 1,
-2.219901, -0.2890099, -2.650791, 1, 0.09019608, 0, 1,
-2.201349, 0.5721977, -0.08081698, 1, 0.09411765, 0, 1,
-2.194444, 2.505037, -2.868149, 1, 0.1019608, 0, 1,
-2.174843, 0.9822841, 0.9230808, 1, 0.1098039, 0, 1,
-2.169071, -0.6786117, -0.7617663, 1, 0.1137255, 0, 1,
-2.109245, 0.1508135, -1.813437, 1, 0.1215686, 0, 1,
-2.095709, -1.338744, -1.674943, 1, 0.1254902, 0, 1,
-2.095449, 0.2811604, -1.261765, 1, 0.1333333, 0, 1,
-2.072703, 0.07006716, -1.60816, 1, 0.1372549, 0, 1,
-2.049527, -0.1270247, -0.3672753, 1, 0.145098, 0, 1,
-2.017702, -1.196282, -2.004632, 1, 0.1490196, 0, 1,
-1.983406, 0.2824981, -2.134024, 1, 0.1568628, 0, 1,
-1.980235, -0.7784967, -3.330867, 1, 0.1607843, 0, 1,
-1.971845, 1.13755, -3.531904, 1, 0.1686275, 0, 1,
-1.959333, -1.506627, -1.552397, 1, 0.172549, 0, 1,
-1.939065, -1.064009, -3.710743, 1, 0.1803922, 0, 1,
-1.934394, -0.7706723, -2.946863, 1, 0.1843137, 0, 1,
-1.924905, 0.07147118, -2.842085, 1, 0.1921569, 0, 1,
-1.915417, -0.4300007, -1.764236, 1, 0.1960784, 0, 1,
-1.873852, 1.26778, -2.306553, 1, 0.2039216, 0, 1,
-1.872862, -1.021217, -0.2314925, 1, 0.2117647, 0, 1,
-1.856825, -0.2252856, -0.0145069, 1, 0.2156863, 0, 1,
-1.84693, 1.109422, -0.284798, 1, 0.2235294, 0, 1,
-1.838373, 2.04206, -0.6851266, 1, 0.227451, 0, 1,
-1.82539, -0.3585094, -0.3134692, 1, 0.2352941, 0, 1,
-1.813372, 0.8195602, -0.3151384, 1, 0.2392157, 0, 1,
-1.80998, 0.2441037, -0.7117854, 1, 0.2470588, 0, 1,
-1.802014, -0.7566459, -1.612024, 1, 0.2509804, 0, 1,
-1.795033, -0.5089985, -2.545881, 1, 0.2588235, 0, 1,
-1.782701, -0.06648411, -2.286732, 1, 0.2627451, 0, 1,
-1.738358, -0.7083107, -1.380324, 1, 0.2705882, 0, 1,
-1.728626, 0.7064728, -1.567369, 1, 0.2745098, 0, 1,
-1.723543, 1.056796, 0.7745367, 1, 0.282353, 0, 1,
-1.722001, -1.767996, -3.142463, 1, 0.2862745, 0, 1,
-1.721663, 0.06425671, -0.6892784, 1, 0.2941177, 0, 1,
-1.716298, -0.847291, -2.933173, 1, 0.3019608, 0, 1,
-1.702736, -0.4693071, -1.045413, 1, 0.3058824, 0, 1,
-1.671912, 1.017382, -0.4136826, 1, 0.3137255, 0, 1,
-1.660572, 0.9813367, -0.9193555, 1, 0.3176471, 0, 1,
-1.655987, -0.7452998, -3.078558, 1, 0.3254902, 0, 1,
-1.638822, -0.954239, -3.211012, 1, 0.3294118, 0, 1,
-1.627429, 0.877179, -1.329448, 1, 0.3372549, 0, 1,
-1.616427, 0.447636, -0.6403477, 1, 0.3411765, 0, 1,
-1.603279, 0.7958835, -1.19371, 1, 0.3490196, 0, 1,
-1.595233, 0.9573612, -0.7983237, 1, 0.3529412, 0, 1,
-1.579404, -0.4012769, -2.989783, 1, 0.3607843, 0, 1,
-1.572818, -1.910826, -1.518611, 1, 0.3647059, 0, 1,
-1.56972, 0.9257296, -0.6997614, 1, 0.372549, 0, 1,
-1.568387, -0.6882809, -1.106679, 1, 0.3764706, 0, 1,
-1.563259, 2.323124, 0.7183418, 1, 0.3843137, 0, 1,
-1.561972, -1.405721, -2.05279, 1, 0.3882353, 0, 1,
-1.551488, -0.7137163, -1.56171, 1, 0.3960784, 0, 1,
-1.54502, 0.6913899, -1.06349, 1, 0.4039216, 0, 1,
-1.538018, -2.464449, -0.2369637, 1, 0.4078431, 0, 1,
-1.534985, -1.811413, -2.547842, 1, 0.4156863, 0, 1,
-1.531801, -0.6519452, -1.738476, 1, 0.4196078, 0, 1,
-1.529831, 0.8387601, 0.2629768, 1, 0.427451, 0, 1,
-1.528787, 1.606999, -0.907062, 1, 0.4313726, 0, 1,
-1.526707, 0.8257453, -0.5960627, 1, 0.4392157, 0, 1,
-1.519084, -0.09384108, -1.86489, 1, 0.4431373, 0, 1,
-1.518063, -0.3414829, -1.869923, 1, 0.4509804, 0, 1,
-1.492382, -0.2115749, -3.492259, 1, 0.454902, 0, 1,
-1.481923, 0.6387196, -1.825182, 1, 0.4627451, 0, 1,
-1.47313, 0.7331027, -1.682554, 1, 0.4666667, 0, 1,
-1.471103, 0.5661082, 0.6553515, 1, 0.4745098, 0, 1,
-1.468985, -0.1644046, -1.475372, 1, 0.4784314, 0, 1,
-1.468842, 1.282274, 1.166539, 1, 0.4862745, 0, 1,
-1.461634, 0.4368685, -0.1638089, 1, 0.4901961, 0, 1,
-1.460526, -0.7124645, -1.365959, 1, 0.4980392, 0, 1,
-1.454955, 1.535697, -0.3093991, 1, 0.5058824, 0, 1,
-1.441173, 1.997807, 1.397434, 1, 0.509804, 0, 1,
-1.440718, 0.3389542, -1.781079, 1, 0.5176471, 0, 1,
-1.440508, 2.262268, -1.323196, 1, 0.5215687, 0, 1,
-1.439233, -0.4407597, -2.588443, 1, 0.5294118, 0, 1,
-1.433259, -0.4146422, -2.38475, 1, 0.5333334, 0, 1,
-1.429303, -1.174847, -3.044938, 1, 0.5411765, 0, 1,
-1.427791, 0.4326558, -3.043701, 1, 0.5450981, 0, 1,
-1.421094, -0.3316744, -2.340956, 1, 0.5529412, 0, 1,
-1.413344, 1.506856, 0.280784, 1, 0.5568628, 0, 1,
-1.412341, -0.4029384, -2.723833, 1, 0.5647059, 0, 1,
-1.412174, 0.0138863, -1.295177, 1, 0.5686275, 0, 1,
-1.408249, -0.7904803, -4.50386, 1, 0.5764706, 0, 1,
-1.392277, -0.291976, -2.14798, 1, 0.5803922, 0, 1,
-1.386182, 1.314961, -3.058995, 1, 0.5882353, 0, 1,
-1.37314, 1.052046, -0.7499374, 1, 0.5921569, 0, 1,
-1.366154, 1.039608, -0.217716, 1, 0.6, 0, 1,
-1.359876, 0.2703639, -2.070851, 1, 0.6078432, 0, 1,
-1.352076, -0.2558228, -1.580534, 1, 0.6117647, 0, 1,
-1.351364, 1.119942, -0.3613856, 1, 0.6196079, 0, 1,
-1.349879, 0.004710073, -2.195596, 1, 0.6235294, 0, 1,
-1.344975, -1.054436, -1.952934, 1, 0.6313726, 0, 1,
-1.340822, 0.1371278, -0.9940561, 1, 0.6352941, 0, 1,
-1.338817, 0.9039197, 0.6455511, 1, 0.6431373, 0, 1,
-1.336924, -0.2202886, -1.335891, 1, 0.6470588, 0, 1,
-1.332775, -0.1661949, -0.9298244, 1, 0.654902, 0, 1,
-1.304868, -0.7086315, -1.673347, 1, 0.6588235, 0, 1,
-1.301644, 1.355144, -0.6521004, 1, 0.6666667, 0, 1,
-1.300414, -0.9415671, -3.205926, 1, 0.6705883, 0, 1,
-1.296761, 0.38263, -0.4650037, 1, 0.6784314, 0, 1,
-1.290957, -1.164672, -1.755952, 1, 0.682353, 0, 1,
-1.284456, 0.08422507, -1.104267, 1, 0.6901961, 0, 1,
-1.283099, -1.066, -0.9549018, 1, 0.6941177, 0, 1,
-1.277748, -0.6152065, -1.272908, 1, 0.7019608, 0, 1,
-1.275112, -1.405449, -2.063647, 1, 0.7098039, 0, 1,
-1.266839, 1.073594, -1.041243, 1, 0.7137255, 0, 1,
-1.255545, -1.049602, -1.176582, 1, 0.7215686, 0, 1,
-1.250105, 0.3659373, -1.836385, 1, 0.7254902, 0, 1,
-1.24721, 1.678744, -2.104417, 1, 0.7333333, 0, 1,
-1.240582, -0.1258382, -2.665974, 1, 0.7372549, 0, 1,
-1.240385, 0.07762801, -1.026097, 1, 0.7450981, 0, 1,
-1.235624, -1.279243, -2.687828, 1, 0.7490196, 0, 1,
-1.233344, 0.05693509, -1.796708, 1, 0.7568628, 0, 1,
-1.226442, 0.8592671, -0.5850399, 1, 0.7607843, 0, 1,
-1.226251, 0.7992387, -0.688819, 1, 0.7686275, 0, 1,
-1.224055, -0.08353201, -1.784861, 1, 0.772549, 0, 1,
-1.218843, 0.1689506, -1.860454, 1, 0.7803922, 0, 1,
-1.215591, 0.1867708, 0.08929061, 1, 0.7843137, 0, 1,
-1.197278, 1.119095, 0.1999425, 1, 0.7921569, 0, 1,
-1.184839, 0.2103338, -1.708934, 1, 0.7960784, 0, 1,
-1.181308, -0.7439953, -2.566445, 1, 0.8039216, 0, 1,
-1.179731, -1.982716, -3.056852, 1, 0.8117647, 0, 1,
-1.175612, -1.431046, -2.617392, 1, 0.8156863, 0, 1,
-1.163514, -1.101377, -4.881998, 1, 0.8235294, 0, 1,
-1.162881, -0.8436589, -1.928011, 1, 0.827451, 0, 1,
-1.161129, 0.5489025, -1.410526, 1, 0.8352941, 0, 1,
-1.158579, 0.1565549, -0.6693412, 1, 0.8392157, 0, 1,
-1.158571, -0.3978582, -2.381605, 1, 0.8470588, 0, 1,
-1.158088, -1.301192, -2.697528, 1, 0.8509804, 0, 1,
-1.155928, 0.5958063, -1.330367, 1, 0.8588235, 0, 1,
-1.133138, 0.0556733, -2.830894, 1, 0.8627451, 0, 1,
-1.131697, 1.795124, 1.036838, 1, 0.8705882, 0, 1,
-1.12466, -0.7795222, -2.545818, 1, 0.8745098, 0, 1,
-1.119604, -0.416124, -1.612269, 1, 0.8823529, 0, 1,
-1.114503, -0.5517765, -2.995028, 1, 0.8862745, 0, 1,
-1.114112, 0.8726015, 0.7324256, 1, 0.8941177, 0, 1,
-1.103666, 0.07115634, -2.155993, 1, 0.8980392, 0, 1,
-1.101549, -1.664275, -2.272192, 1, 0.9058824, 0, 1,
-1.099985, 1.670395, 0.5767568, 1, 0.9137255, 0, 1,
-1.082152, 0.1658515, -0.4053825, 1, 0.9176471, 0, 1,
-1.077747, 1.040537, 0.2301908, 1, 0.9254902, 0, 1,
-1.063393, -1.424091, -2.278828, 1, 0.9294118, 0, 1,
-1.044439, -0.1759086, -1.002686, 1, 0.9372549, 0, 1,
-1.041113, 1.511526, -0.2311936, 1, 0.9411765, 0, 1,
-1.027558, -1.000313, -1.723886, 1, 0.9490196, 0, 1,
-1.027435, -0.1550109, -3.546011, 1, 0.9529412, 0, 1,
-1.027357, 0.1271709, -0.9169238, 1, 0.9607843, 0, 1,
-1.020612, 1.987077, -0.8440669, 1, 0.9647059, 0, 1,
-1.019808, 0.03938581, -2.995477, 1, 0.972549, 0, 1,
-1.016748, -0.8614281, -4.080538, 1, 0.9764706, 0, 1,
-1.016657, -0.4612913, -1.949907, 1, 0.9843137, 0, 1,
-1.01527, 1.018037, -0.475773, 1, 0.9882353, 0, 1,
-1.012891, -1.248592, -1.64301, 1, 0.9960784, 0, 1,
-1.005862, -0.8716545, -3.463292, 0.9960784, 1, 0, 1,
-1.005809, 1.291903, -0.05751991, 0.9921569, 1, 0, 1,
-1.003494, 0.356865, -1.866841, 0.9843137, 1, 0, 1,
-1.000884, -0.1023082, -0.4114161, 0.9803922, 1, 0, 1,
-0.9954354, -0.8267508, 0.2683627, 0.972549, 1, 0, 1,
-0.9861538, -0.2398134, -1.429663, 0.9686275, 1, 0, 1,
-0.9857336, -1.765952, -4.110746, 0.9607843, 1, 0, 1,
-0.9837745, -1.426758, -1.707279, 0.9568627, 1, 0, 1,
-0.9750522, 1.509037, -0.6078001, 0.9490196, 1, 0, 1,
-0.9662936, -1.082249, -1.230926, 0.945098, 1, 0, 1,
-0.9608197, -0.5141849, -1.547621, 0.9372549, 1, 0, 1,
-0.9569888, 0.7783613, -1.96844, 0.9333333, 1, 0, 1,
-0.955641, 0.2406711, -1.18925, 0.9254902, 1, 0, 1,
-0.9446736, 1.390435, -1.482231, 0.9215686, 1, 0, 1,
-0.940393, -0.7583916, -3.776515, 0.9137255, 1, 0, 1,
-0.9376037, -1.930971, -2.548237, 0.9098039, 1, 0, 1,
-0.9361665, -1.305065, -0.7480807, 0.9019608, 1, 0, 1,
-0.9340933, -1.05633, -1.584353, 0.8941177, 1, 0, 1,
-0.9301339, -1.907465, -2.188982, 0.8901961, 1, 0, 1,
-0.9271652, -0.1202396, -1.886477, 0.8823529, 1, 0, 1,
-0.9231417, -0.1653807, -2.365844, 0.8784314, 1, 0, 1,
-0.9026042, 0.1156456, -1.51103, 0.8705882, 1, 0, 1,
-0.9019617, 0.7735396, -1.784678, 0.8666667, 1, 0, 1,
-0.9011165, -0.1188275, -0.9034645, 0.8588235, 1, 0, 1,
-0.8842545, 1.016187, -0.4251781, 0.854902, 1, 0, 1,
-0.8825535, 1.207792, -1.753145, 0.8470588, 1, 0, 1,
-0.8821403, 0.6247648, -1.666537, 0.8431373, 1, 0, 1,
-0.8757656, 0.4798335, -1.75769, 0.8352941, 1, 0, 1,
-0.8744574, -0.3672256, -2.108505, 0.8313726, 1, 0, 1,
-0.873711, -1.400528, -1.782686, 0.8235294, 1, 0, 1,
-0.8679803, 0.9626787, -0.6764954, 0.8196079, 1, 0, 1,
-0.8591199, -0.4347457, -2.239928, 0.8117647, 1, 0, 1,
-0.8571675, 0.5127296, -0.2531234, 0.8078431, 1, 0, 1,
-0.8570795, -0.550231, -0.9962677, 0.8, 1, 0, 1,
-0.8566965, 2.423854, -0.3524195, 0.7921569, 1, 0, 1,
-0.852349, -0.9210001, -1.545271, 0.7882353, 1, 0, 1,
-0.8502977, -0.1299345, -2.875165, 0.7803922, 1, 0, 1,
-0.8480893, -0.09370186, -1.894455, 0.7764706, 1, 0, 1,
-0.8420109, -1.393109, -3.335919, 0.7686275, 1, 0, 1,
-0.8381107, 2.358226, -1.06777, 0.7647059, 1, 0, 1,
-0.8364466, 0.5268988, -0.4215606, 0.7568628, 1, 0, 1,
-0.8261517, 0.03644744, -1.932486, 0.7529412, 1, 0, 1,
-0.825516, -0.3285221, -3.336629, 0.7450981, 1, 0, 1,
-0.822662, -0.8011303, -2.025349, 0.7411765, 1, 0, 1,
-0.8185487, -0.5297278, -2.807802, 0.7333333, 1, 0, 1,
-0.8043756, 0.8423105, -0.8215104, 0.7294118, 1, 0, 1,
-0.8034928, 0.6722822, -0.5661113, 0.7215686, 1, 0, 1,
-0.8025153, -0.6187392, -1.39695, 0.7176471, 1, 0, 1,
-0.8009886, -0.6688396, -1.324982, 0.7098039, 1, 0, 1,
-0.8002299, 0.5951605, -1.213217, 0.7058824, 1, 0, 1,
-0.8000732, -0.485881, -2.109275, 0.6980392, 1, 0, 1,
-0.7998115, -1.444516, -1.097687, 0.6901961, 1, 0, 1,
-0.7992588, 0.6493649, -0.5087157, 0.6862745, 1, 0, 1,
-0.7941748, 0.02335091, -2.619615, 0.6784314, 1, 0, 1,
-0.7933142, -0.536096, -3.036076, 0.6745098, 1, 0, 1,
-0.787558, 0.09607656, -2.478998, 0.6666667, 1, 0, 1,
-0.7856315, 1.545268, -1.646602, 0.6627451, 1, 0, 1,
-0.7851419, -0.2695215, 0.6794068, 0.654902, 1, 0, 1,
-0.7844875, -0.4400685, -1.39783, 0.6509804, 1, 0, 1,
-0.7826672, -1.494287, -3.537126, 0.6431373, 1, 0, 1,
-0.781487, 1.2575, 0.8153212, 0.6392157, 1, 0, 1,
-0.7698925, -0.8033766, -3.309063, 0.6313726, 1, 0, 1,
-0.7592807, -0.9667423, -1.633639, 0.627451, 1, 0, 1,
-0.7568328, 0.5555833, -0.01315786, 0.6196079, 1, 0, 1,
-0.7534722, 0.2219924, -0.01432327, 0.6156863, 1, 0, 1,
-0.7530182, -0.1549428, -3.124806, 0.6078432, 1, 0, 1,
-0.7465717, -0.5559703, -2.062248, 0.6039216, 1, 0, 1,
-0.7437554, -0.9923558, -2.549436, 0.5960785, 1, 0, 1,
-0.742914, 1.735438, -0.6696293, 0.5882353, 1, 0, 1,
-0.7414721, 1.910658, 0.3565886, 0.5843138, 1, 0, 1,
-0.7409687, 1.028766, -1.079371, 0.5764706, 1, 0, 1,
-0.7400581, 0.7716594, 0.3340408, 0.572549, 1, 0, 1,
-0.739981, 0.1634713, -2.03453, 0.5647059, 1, 0, 1,
-0.7376291, 1.21072, -0.8020373, 0.5607843, 1, 0, 1,
-0.7361993, -0.6307869, -2.736568, 0.5529412, 1, 0, 1,
-0.7281588, 0.197991, -1.276582, 0.5490196, 1, 0, 1,
-0.7266591, -0.5568494, -2.116131, 0.5411765, 1, 0, 1,
-0.7199247, -1.27663, -3.340673, 0.5372549, 1, 0, 1,
-0.7188907, 0.5657001, 0.3283547, 0.5294118, 1, 0, 1,
-0.7119203, -1.704718, -0.7270696, 0.5254902, 1, 0, 1,
-0.7110444, -0.735674, -2.290395, 0.5176471, 1, 0, 1,
-0.7104765, -0.6510082, -2.642949, 0.5137255, 1, 0, 1,
-0.7046109, -0.5660522, -1.654415, 0.5058824, 1, 0, 1,
-0.7009493, 0.4748304, -0.1117767, 0.5019608, 1, 0, 1,
-0.6990791, 0.8284264, -1.513194, 0.4941176, 1, 0, 1,
-0.6902817, 0.641948, -1.626739, 0.4862745, 1, 0, 1,
-0.6827207, 0.9606283, -0.8655364, 0.4823529, 1, 0, 1,
-0.6799105, -1.149874, -3.157647, 0.4745098, 1, 0, 1,
-0.6762123, 1.677969, -0.1662622, 0.4705882, 1, 0, 1,
-0.675064, 1.167008, -1.433198, 0.4627451, 1, 0, 1,
-0.6746367, 1.375485, -2.010127, 0.4588235, 1, 0, 1,
-0.6743519, 0.1483585, 0.1064831, 0.4509804, 1, 0, 1,
-0.6710504, 1.10466, 1.110601, 0.4470588, 1, 0, 1,
-0.6699759, -0.1856051, -2.614317, 0.4392157, 1, 0, 1,
-0.6594106, -0.7261905, -1.855683, 0.4352941, 1, 0, 1,
-0.6581689, -1.875363, -2.455207, 0.427451, 1, 0, 1,
-0.6572612, -0.4754215, -2.643852, 0.4235294, 1, 0, 1,
-0.6535416, 1.787559, 0.6183249, 0.4156863, 1, 0, 1,
-0.6476896, 0.05170103, -1.288743, 0.4117647, 1, 0, 1,
-0.6396734, 0.3309914, -1.540405, 0.4039216, 1, 0, 1,
-0.6392727, 0.4520163, -1.2958, 0.3960784, 1, 0, 1,
-0.6375377, -0.2950892, -2.765143, 0.3921569, 1, 0, 1,
-0.6357431, 0.6710977, 0.3026937, 0.3843137, 1, 0, 1,
-0.6335443, 0.5081378, -1.931422, 0.3803922, 1, 0, 1,
-0.6294408, -1.95823, -3.879503, 0.372549, 1, 0, 1,
-0.6265464, 0.5796053, 0.2828807, 0.3686275, 1, 0, 1,
-0.625094, -0.9516929, -2.33847, 0.3607843, 1, 0, 1,
-0.625008, -0.3497738, -2.606582, 0.3568628, 1, 0, 1,
-0.6247447, -1.049545, -1.663483, 0.3490196, 1, 0, 1,
-0.6244815, -0.3468606, -2.115532, 0.345098, 1, 0, 1,
-0.6230729, 1.349374, -0.7547301, 0.3372549, 1, 0, 1,
-0.6226946, 1.965369, -0.4206759, 0.3333333, 1, 0, 1,
-0.6224617, 0.2440392, -2.556151, 0.3254902, 1, 0, 1,
-0.6217849, 2.720062, -1.013268, 0.3215686, 1, 0, 1,
-0.6202174, -1.510951, -1.819231, 0.3137255, 1, 0, 1,
-0.6141916, 2.054941, -0.6964239, 0.3098039, 1, 0, 1,
-0.6129087, -1.467481, -2.807326, 0.3019608, 1, 0, 1,
-0.6127281, -0.3699477, -1.441135, 0.2941177, 1, 0, 1,
-0.6109886, 1.564472, -0.4294313, 0.2901961, 1, 0, 1,
-0.6088357, 0.01194301, -1.052283, 0.282353, 1, 0, 1,
-0.6013238, 0.08004184, 0.4606149, 0.2784314, 1, 0, 1,
-0.6012065, 0.4932663, 0.6481059, 0.2705882, 1, 0, 1,
-0.5956992, -1.119626, -2.78607, 0.2666667, 1, 0, 1,
-0.5903078, -0.3854385, -2.296243, 0.2588235, 1, 0, 1,
-0.5886567, 0.3083942, -1.668325, 0.254902, 1, 0, 1,
-0.5866822, -0.5251054, -2.488486, 0.2470588, 1, 0, 1,
-0.5814159, 0.8167974, 0.3457274, 0.2431373, 1, 0, 1,
-0.5774418, -1.323183, -4.187781, 0.2352941, 1, 0, 1,
-0.5711873, 0.1181202, -4.458719, 0.2313726, 1, 0, 1,
-0.5666716, -0.08577501, -2.511457, 0.2235294, 1, 0, 1,
-0.5522345, 1.409279, -0.7296765, 0.2196078, 1, 0, 1,
-0.5522081, 0.05795336, -2.09805, 0.2117647, 1, 0, 1,
-0.5466375, -0.3301095, -2.372864, 0.2078431, 1, 0, 1,
-0.5451815, 0.1846491, -1.960026, 0.2, 1, 0, 1,
-0.5420356, 0.3942492, -1.676751, 0.1921569, 1, 0, 1,
-0.5401085, 0.2947292, -0.278219, 0.1882353, 1, 0, 1,
-0.5369075, -0.6608453, -0.4954607, 0.1803922, 1, 0, 1,
-0.5317041, -0.5527423, -2.249479, 0.1764706, 1, 0, 1,
-0.5268177, -0.933808, -1.199563, 0.1686275, 1, 0, 1,
-0.5266877, -0.08659302, -3.033299, 0.1647059, 1, 0, 1,
-0.5239482, -0.9328625, -2.107965, 0.1568628, 1, 0, 1,
-0.5221657, 1.969895, -0.8871623, 0.1529412, 1, 0, 1,
-0.5204009, -0.4922388, -2.219105, 0.145098, 1, 0, 1,
-0.5181414, -0.1329682, -0.07049626, 0.1411765, 1, 0, 1,
-0.5171559, 1.09182, -0.4685066, 0.1333333, 1, 0, 1,
-0.5133524, 1.798439, -0.5898878, 0.1294118, 1, 0, 1,
-0.508271, 1.488056, -0.3731282, 0.1215686, 1, 0, 1,
-0.50762, 1.677556, -1.075712, 0.1176471, 1, 0, 1,
-0.5070702, -0.6210321, -1.672356, 0.1098039, 1, 0, 1,
-0.5064049, -0.7366069, -0.8594989, 0.1058824, 1, 0, 1,
-0.5050231, 1.830933, 1.467569, 0.09803922, 1, 0, 1,
-0.5032675, -0.4779038, -2.325322, 0.09019608, 1, 0, 1,
-0.5007054, 0.8731061, -1.060759, 0.08627451, 1, 0, 1,
-0.5002769, 1.160724, -1.60089, 0.07843138, 1, 0, 1,
-0.4950759, 0.4419038, -2.609462, 0.07450981, 1, 0, 1,
-0.4934807, -1.115946, -2.973501, 0.06666667, 1, 0, 1,
-0.4920393, 0.1359283, -1.748836, 0.0627451, 1, 0, 1,
-0.4912906, -1.461033, -1.427477, 0.05490196, 1, 0, 1,
-0.4898299, -0.02139854, -1.37704, 0.05098039, 1, 0, 1,
-0.4846042, 0.93391, -1.76342, 0.04313726, 1, 0, 1,
-0.4792447, 0.07651552, -2.348556, 0.03921569, 1, 0, 1,
-0.4759849, -1.522025, -2.999707, 0.03137255, 1, 0, 1,
-0.4742157, -1.886821, -2.359246, 0.02745098, 1, 0, 1,
-0.473219, 0.5205792, -0.3597109, 0.01960784, 1, 0, 1,
-0.468379, 0.4599651, -0.323249, 0.01568628, 1, 0, 1,
-0.4532433, -1.605536, -3.703959, 0.007843138, 1, 0, 1,
-0.4526734, 0.01883998, -2.248388, 0.003921569, 1, 0, 1,
-0.4482781, 0.9338042, -1.970194, 0, 1, 0.003921569, 1,
-0.447165, -1.134645, -2.157459, 0, 1, 0.01176471, 1,
-0.4440398, -1.03858, -4.454807, 0, 1, 0.01568628, 1,
-0.4417715, -1.352755, -4.742976, 0, 1, 0.02352941, 1,
-0.4270663, -0.9117554, -2.707271, 0, 1, 0.02745098, 1,
-0.4254974, -1.229959, -2.69506, 0, 1, 0.03529412, 1,
-0.4236834, -1.426402, -3.884415, 0, 1, 0.03921569, 1,
-0.4231434, 2.11358, -0.5124059, 0, 1, 0.04705882, 1,
-0.4086203, -0.0601693, -2.790601, 0, 1, 0.05098039, 1,
-0.405564, 0.2619807, -1.602529, 0, 1, 0.05882353, 1,
-0.405366, 0.08550261, -0.1297499, 0, 1, 0.0627451, 1,
-0.4040971, -0.6479039, -3.243499, 0, 1, 0.07058824, 1,
-0.3996088, 0.7026077, 0.1059563, 0, 1, 0.07450981, 1,
-0.3982925, 0.3557424, 0.6466566, 0, 1, 0.08235294, 1,
-0.3978028, -0.7250733, -3.059631, 0, 1, 0.08627451, 1,
-0.3929736, 1.134505, -0.4890943, 0, 1, 0.09411765, 1,
-0.3880908, -0.5396147, -3.627668, 0, 1, 0.1019608, 1,
-0.3805407, -0.1749002, -2.7413, 0, 1, 0.1058824, 1,
-0.3772652, 1.274246, 0.3458116, 0, 1, 0.1137255, 1,
-0.3771883, 0.5260065, -0.001623714, 0, 1, 0.1176471, 1,
-0.3767796, -0.9980125, -2.955736, 0, 1, 0.1254902, 1,
-0.3744582, -1.527739, -2.445662, 0, 1, 0.1294118, 1,
-0.3724562, -1.072541, -1.201289, 0, 1, 0.1372549, 1,
-0.371516, -0.9395896, -3.007287, 0, 1, 0.1411765, 1,
-0.3662445, 0.7146403, 1.775008, 0, 1, 0.1490196, 1,
-0.363148, 0.3603677, -1.809868, 0, 1, 0.1529412, 1,
-0.3592186, -0.3698922, -1.362062, 0, 1, 0.1607843, 1,
-0.3587423, -1.292011, -2.815728, 0, 1, 0.1647059, 1,
-0.3528498, -0.9954497, -2.895599, 0, 1, 0.172549, 1,
-0.3520143, 1.735825, -0.5728716, 0, 1, 0.1764706, 1,
-0.3518777, 0.1573778, -1.209384, 0, 1, 0.1843137, 1,
-0.3514637, 0.6198092, 0.2730637, 0, 1, 0.1882353, 1,
-0.3436841, 0.1153592, -3.272727, 0, 1, 0.1960784, 1,
-0.341604, -0.5973627, -2.545966, 0, 1, 0.2039216, 1,
-0.3389814, -0.3191884, -0.7891389, 0, 1, 0.2078431, 1,
-0.3370567, -0.6098132, -1.477178, 0, 1, 0.2156863, 1,
-0.3333433, -0.008637409, -2.704038, 0, 1, 0.2196078, 1,
-0.3326383, -0.4555179, -1.839857, 0, 1, 0.227451, 1,
-0.3311196, 0.4004587, -0.9201667, 0, 1, 0.2313726, 1,
-0.3298175, 0.09009203, -0.1889017, 0, 1, 0.2392157, 1,
-0.3207565, -0.5767673, -2.026684, 0, 1, 0.2431373, 1,
-0.3189897, -0.1474082, -4.23056, 0, 1, 0.2509804, 1,
-0.3152462, 0.548723, 1.414127, 0, 1, 0.254902, 1,
-0.3149913, 1.507143, 0.4212814, 0, 1, 0.2627451, 1,
-0.3117331, -1.571621, -3.471097, 0, 1, 0.2666667, 1,
-0.3051582, 0.72671, 1.528235, 0, 1, 0.2745098, 1,
-0.3008292, -0.5755445, -2.867989, 0, 1, 0.2784314, 1,
-0.29542, 0.8461871, 0.3197262, 0, 1, 0.2862745, 1,
-0.2949464, 0.4219193, -0.5094981, 0, 1, 0.2901961, 1,
-0.2921531, 0.1553092, -1.200389, 0, 1, 0.2980392, 1,
-0.2879737, -1.188032, -1.894432, 0, 1, 0.3058824, 1,
-0.2847297, 0.2186424, -1.752106, 0, 1, 0.3098039, 1,
-0.2842872, 1.076067, 0.3669285, 0, 1, 0.3176471, 1,
-0.2827417, -0.9040567, -2.573749, 0, 1, 0.3215686, 1,
-0.2685074, -1.025365, -4.413268, 0, 1, 0.3294118, 1,
-0.2631625, 1.592323, -0.9595419, 0, 1, 0.3333333, 1,
-0.2593152, -0.6778386, -2.208055, 0, 1, 0.3411765, 1,
-0.2589963, 0.8436058, -0.3895663, 0, 1, 0.345098, 1,
-0.2511318, 1.367232, -0.2404281, 0, 1, 0.3529412, 1,
-0.2488929, -0.7985766, -2.885263, 0, 1, 0.3568628, 1,
-0.2424928, -0.2136951, -3.157773, 0, 1, 0.3647059, 1,
-0.2416898, -1.071305, -2.351027, 0, 1, 0.3686275, 1,
-0.2416867, 0.4340045, 0.9165523, 0, 1, 0.3764706, 1,
-0.2395431, -0.7220445, -4.06727, 0, 1, 0.3803922, 1,
-0.2394775, -1.838065, -3.05011, 0, 1, 0.3882353, 1,
-0.2353885, -1.151691, -3.291723, 0, 1, 0.3921569, 1,
-0.2344162, -1.554005, -1.640084, 0, 1, 0.4, 1,
-0.2333617, 2.082428, -0.8984545, 0, 1, 0.4078431, 1,
-0.2315887, -0.1366269, -4.574494, 0, 1, 0.4117647, 1,
-0.2306453, -0.3719782, -1.695712, 0, 1, 0.4196078, 1,
-0.2303219, 0.6642987, -1.147158, 0, 1, 0.4235294, 1,
-0.2295516, 0.06390127, -1.204709, 0, 1, 0.4313726, 1,
-0.2281492, -1.112888, -2.618889, 0, 1, 0.4352941, 1,
-0.2247404, 1.433372, -0.7088712, 0, 1, 0.4431373, 1,
-0.2184974, -0.02459009, -1.318156, 0, 1, 0.4470588, 1,
-0.2181622, 0.5879793, 0.6840496, 0, 1, 0.454902, 1,
-0.2153021, 0.2184484, 0.5953555, 0, 1, 0.4588235, 1,
-0.2139568, 0.4043903, -0.07857639, 0, 1, 0.4666667, 1,
-0.212405, 0.2510372, 0.6237274, 0, 1, 0.4705882, 1,
-0.2114116, 1.474515, 0.6070713, 0, 1, 0.4784314, 1,
-0.2077779, -0.4445404, -1.544128, 0, 1, 0.4823529, 1,
-0.2073124, 1.627631, -0.08844966, 0, 1, 0.4901961, 1,
-0.204638, 1.270627, -0.7800334, 0, 1, 0.4941176, 1,
-0.1997054, 0.7909443, 1.079235, 0, 1, 0.5019608, 1,
-0.1994593, 1.158748, 0.5356317, 0, 1, 0.509804, 1,
-0.1961434, -0.491521, -2.506825, 0, 1, 0.5137255, 1,
-0.1955187, -0.5012687, -3.750922, 0, 1, 0.5215687, 1,
-0.1913035, -1.241535, -1.439293, 0, 1, 0.5254902, 1,
-0.1911569, 0.3864111, -0.6935872, 0, 1, 0.5333334, 1,
-0.1896914, -0.7681531, -1.949324, 0, 1, 0.5372549, 1,
-0.1871829, 0.04768407, -0.4679573, 0, 1, 0.5450981, 1,
-0.1855004, -0.9666693, -3.968059, 0, 1, 0.5490196, 1,
-0.1832201, -1.061694, -2.553573, 0, 1, 0.5568628, 1,
-0.1828119, 0.07387543, -1.560571, 0, 1, 0.5607843, 1,
-0.1822029, 1.123115, 0.5147861, 0, 1, 0.5686275, 1,
-0.1793669, -0.1929186, -2.722982, 0, 1, 0.572549, 1,
-0.1769284, -0.5433906, -2.869693, 0, 1, 0.5803922, 1,
-0.1749208, -1.205612, -4.575619, 0, 1, 0.5843138, 1,
-0.1715339, -0.3806582, -2.221853, 0, 1, 0.5921569, 1,
-0.1709204, 1.328976, -1.057947, 0, 1, 0.5960785, 1,
-0.1694355, -1.317744, -2.527512, 0, 1, 0.6039216, 1,
-0.1654335, -0.2985085, -3.979072, 0, 1, 0.6117647, 1,
-0.1616492, 1.099554, 0.4112144, 0, 1, 0.6156863, 1,
-0.1601903, 1.223988, -0.6695083, 0, 1, 0.6235294, 1,
-0.1578116, 0.5828868, 0.2928239, 0, 1, 0.627451, 1,
-0.1535958, 0.5819351, -1.080053, 0, 1, 0.6352941, 1,
-0.1525675, -1.229079, -2.877885, 0, 1, 0.6392157, 1,
-0.1516876, 1.249799, -2.221592, 0, 1, 0.6470588, 1,
-0.1503244, 0.6973166, 1.982808, 0, 1, 0.6509804, 1,
-0.1492491, -0.1888274, -3.676749, 0, 1, 0.6588235, 1,
-0.1480922, -0.7700806, -2.085955, 0, 1, 0.6627451, 1,
-0.1474502, -1.253561, -2.067826, 0, 1, 0.6705883, 1,
-0.1386012, -0.993478, -3.877387, 0, 1, 0.6745098, 1,
-0.1356906, 1.0376, -1.335597, 0, 1, 0.682353, 1,
-0.1326287, -0.6290923, -4.104168, 0, 1, 0.6862745, 1,
-0.1268482, -0.3487442, -2.375314, 0, 1, 0.6941177, 1,
-0.124301, 1.684077, -1.546717, 0, 1, 0.7019608, 1,
-0.1240367, -2.2608, -4.245226, 0, 1, 0.7058824, 1,
-0.1237741, 0.1145982, -1.251634, 0, 1, 0.7137255, 1,
-0.1160326, -1.624968, -3.506984, 0, 1, 0.7176471, 1,
-0.1137278, -0.3443243, -3.185679, 0, 1, 0.7254902, 1,
-0.1121258, -0.5320892, -4.135406, 0, 1, 0.7294118, 1,
-0.1112874, -0.08569379, -2.143006, 0, 1, 0.7372549, 1,
-0.1101776, -1.033673, -5.880427, 0, 1, 0.7411765, 1,
-0.1061579, -1.059437, -1.951573, 0, 1, 0.7490196, 1,
-0.1055149, 1.581554, 1.084798, 0, 1, 0.7529412, 1,
-0.09808329, -0.8950465, -3.21554, 0, 1, 0.7607843, 1,
-0.09423655, 0.3523002, -1.945659, 0, 1, 0.7647059, 1,
-0.08788775, 1.015114, 0.8669338, 0, 1, 0.772549, 1,
-0.08703402, 0.2782128, -0.9775003, 0, 1, 0.7764706, 1,
-0.08212383, -0.4668952, -2.24759, 0, 1, 0.7843137, 1,
-0.07907622, 0.9870855, -0.1485294, 0, 1, 0.7882353, 1,
-0.07855698, 0.6653141, 0.09215692, 0, 1, 0.7960784, 1,
-0.07780466, 1.926458, 1.249565, 0, 1, 0.8039216, 1,
-0.07521395, 0.1317574, -1.151981, 0, 1, 0.8078431, 1,
-0.07351396, 1.429851, -2.02023, 0, 1, 0.8156863, 1,
-0.06774526, 1.40867, -1.051354, 0, 1, 0.8196079, 1,
-0.06360792, -0.7216269, -3.66114, 0, 1, 0.827451, 1,
-0.061858, 1.709962, 0.6832991, 0, 1, 0.8313726, 1,
-0.05622755, -0.7559496, -3.281169, 0, 1, 0.8392157, 1,
-0.05590853, -1.533107, -1.416691, 0, 1, 0.8431373, 1,
-0.05176417, 0.1241004, -1.585536, 0, 1, 0.8509804, 1,
-0.05142301, 0.7581728, -0.5173336, 0, 1, 0.854902, 1,
-0.05099125, -0.5207373, -5.22234, 0, 1, 0.8627451, 1,
-0.04942836, 0.6445454, -0.9232526, 0, 1, 0.8666667, 1,
-0.04604822, -0.7076076, -4.592806, 0, 1, 0.8745098, 1,
-0.04283073, -0.7415673, -2.946902, 0, 1, 0.8784314, 1,
-0.04137556, -1.305721, -1.834291, 0, 1, 0.8862745, 1,
-0.04038246, 0.817753, -0.7073389, 0, 1, 0.8901961, 1,
-0.03696927, -0.005845421, -1.096181, 0, 1, 0.8980392, 1,
-0.03680604, 1.224503, 0.7942047, 0, 1, 0.9058824, 1,
-0.036488, -2.094257, -3.375329, 0, 1, 0.9098039, 1,
-0.0261282, 1.227962, -0.6819853, 0, 1, 0.9176471, 1,
-0.02397182, 0.7805575, 0.7669597, 0, 1, 0.9215686, 1,
-0.0228594, 0.3281106, -0.2614787, 0, 1, 0.9294118, 1,
-0.01675869, 0.821829, 0.2033723, 0, 1, 0.9333333, 1,
-0.01491698, -0.1589559, -4.084189, 0, 1, 0.9411765, 1,
-0.006699286, 0.8864538, 1.416976, 0, 1, 0.945098, 1,
-0.005869125, -0.4277278, -3.673092, 0, 1, 0.9529412, 1,
-0.005395677, -0.2311765, -2.940649, 0, 1, 0.9568627, 1,
-0.004389741, -1.884805, -2.906432, 0, 1, 0.9647059, 1,
-0.001720861, 0.1668842, -0.327113, 0, 1, 0.9686275, 1,
-7.593977e-05, -0.4791469, -3.202662, 0, 1, 0.9764706, 1,
0.0002284924, 0.6069861, 0.2758638, 0, 1, 0.9803922, 1,
0.003972275, -0.2026132, 3.681659, 0, 1, 0.9882353, 1,
0.008139026, -0.789246, 2.174673, 0, 1, 0.9921569, 1,
0.009380118, -0.609137, 2.17473, 0, 1, 1, 1,
0.01710148, -0.06324492, 2.542717, 0, 0.9921569, 1, 1,
0.01876383, -1.008877, 3.202914, 0, 0.9882353, 1, 1,
0.02062557, -1.049515, 3.248791, 0, 0.9803922, 1, 1,
0.02273278, -0.2977531, 1.162478, 0, 0.9764706, 1, 1,
0.02457234, -1.203597, 2.664188, 0, 0.9686275, 1, 1,
0.02499172, 0.4454032, 0.3608685, 0, 0.9647059, 1, 1,
0.02889249, -0.2669368, 1.993258, 0, 0.9568627, 1, 1,
0.03415794, -0.2830088, 1.434653, 0, 0.9529412, 1, 1,
0.03443015, 0.3833612, 1.386603, 0, 0.945098, 1, 1,
0.04110299, 0.8031111, -0.5746867, 0, 0.9411765, 1, 1,
0.04182351, 0.8751147, -0.5645983, 0, 0.9333333, 1, 1,
0.04941751, -0.3045643, 1.56298, 0, 0.9294118, 1, 1,
0.04989981, 0.7774798, 0.8187624, 0, 0.9215686, 1, 1,
0.05813651, -0.2394986, 1.842338, 0, 0.9176471, 1, 1,
0.06110661, -1.043314, 4.020367, 0, 0.9098039, 1, 1,
0.06404545, -0.9336842, 3.394296, 0, 0.9058824, 1, 1,
0.0644197, 0.2350672, -1.092151, 0, 0.8980392, 1, 1,
0.06609385, 0.3841397, -0.3046003, 0, 0.8901961, 1, 1,
0.06833433, -0.3891676, 3.552921, 0, 0.8862745, 1, 1,
0.07166097, -1.744689, 4.122364, 0, 0.8784314, 1, 1,
0.0769166, -1.648124, 2.599245, 0, 0.8745098, 1, 1,
0.07919581, 1.031825, -0.4045872, 0, 0.8666667, 1, 1,
0.08109626, 1.158329, -1.027594, 0, 0.8627451, 1, 1,
0.08649106, -0.3961068, 3.291531, 0, 0.854902, 1, 1,
0.09035948, 0.6940076, 0.8570727, 0, 0.8509804, 1, 1,
0.09162655, -1.933761, 4.980466, 0, 0.8431373, 1, 1,
0.09274922, 0.2226039, 1.244369, 0, 0.8392157, 1, 1,
0.09531614, -0.1377281, 1.749055, 0, 0.8313726, 1, 1,
0.09825091, -1.109688, 3.190774, 0, 0.827451, 1, 1,
0.101244, -1.159662, 3.693997, 0, 0.8196079, 1, 1,
0.1044815, -0.1220266, 3.03421, 0, 0.8156863, 1, 1,
0.113333, -0.7075843, 2.945145, 0, 0.8078431, 1, 1,
0.1157429, -0.4339355, 2.138299, 0, 0.8039216, 1, 1,
0.1158696, 0.4479873, 0.3153216, 0, 0.7960784, 1, 1,
0.1203094, -0.3893536, 2.178197, 0, 0.7882353, 1, 1,
0.1213411, 0.748442, 2.166625, 0, 0.7843137, 1, 1,
0.121718, 1.053928, -0.0009009508, 0, 0.7764706, 1, 1,
0.1220686, -1.365569, 1.990647, 0, 0.772549, 1, 1,
0.1222534, 0.3167468, 0.7587343, 0, 0.7647059, 1, 1,
0.125536, 0.3250796, 1.115043, 0, 0.7607843, 1, 1,
0.1275439, 0.4445651, -0.6518652, 0, 0.7529412, 1, 1,
0.1299556, -0.6982104, 3.138754, 0, 0.7490196, 1, 1,
0.1308913, -1.506388, 3.411041, 0, 0.7411765, 1, 1,
0.131138, -0.5820606, 4.061137, 0, 0.7372549, 1, 1,
0.1416357, 0.3257399, 0.9391184, 0, 0.7294118, 1, 1,
0.1435528, 0.7212424, -0.109978, 0, 0.7254902, 1, 1,
0.1440121, -0.1124933, 2.260453, 0, 0.7176471, 1, 1,
0.1473468, 0.879426, -0.2256407, 0, 0.7137255, 1, 1,
0.1488365, -0.6490834, 3.767123, 0, 0.7058824, 1, 1,
0.1539999, -0.8240316, 2.691111, 0, 0.6980392, 1, 1,
0.1551198, -1.362814, 2.190982, 0, 0.6941177, 1, 1,
0.1568938, 0.307454, -0.4588128, 0, 0.6862745, 1, 1,
0.1621613, -0.8245386, 3.551378, 0, 0.682353, 1, 1,
0.1649727, 0.792737, -1.83183, 0, 0.6745098, 1, 1,
0.1708961, -1.306491, 3.470083, 0, 0.6705883, 1, 1,
0.1725556, -0.8845531, 2.343309, 0, 0.6627451, 1, 1,
0.1727257, 0.1218921, 1.037057, 0, 0.6588235, 1, 1,
0.1793549, -0.3783758, 4.2672, 0, 0.6509804, 1, 1,
0.1821736, -0.08072916, 2.97539, 0, 0.6470588, 1, 1,
0.1829179, -0.2587887, 3.614119, 0, 0.6392157, 1, 1,
0.1831837, -0.8704914, 3.10061, 0, 0.6352941, 1, 1,
0.1847367, -1.737247, 3.036013, 0, 0.627451, 1, 1,
0.1863617, -1.450827, 2.49068, 0, 0.6235294, 1, 1,
0.1883161, 0.3906249, 0.7616666, 0, 0.6156863, 1, 1,
0.1884104, 0.1885369, 1.060296, 0, 0.6117647, 1, 1,
0.1885633, 0.6866777, 0.7180999, 0, 0.6039216, 1, 1,
0.1890785, -0.9799703, 2.89767, 0, 0.5960785, 1, 1,
0.1905984, 0.01592657, -0.2069814, 0, 0.5921569, 1, 1,
0.1912076, -0.6515699, 2.573794, 0, 0.5843138, 1, 1,
0.1918451, -1.261068, 1.804255, 0, 0.5803922, 1, 1,
0.1989991, -0.9093968, 1.762832, 0, 0.572549, 1, 1,
0.200099, 2.131543, 0.7966556, 0, 0.5686275, 1, 1,
0.2023408, 0.5057328, -0.02914295, 0, 0.5607843, 1, 1,
0.2029164, -0.7374207, 2.291936, 0, 0.5568628, 1, 1,
0.2164397, 0.670307, 0.6713321, 0, 0.5490196, 1, 1,
0.217163, -1.29586, 2.665913, 0, 0.5450981, 1, 1,
0.2197887, -0.04728064, 2.907273, 0, 0.5372549, 1, 1,
0.2219473, -0.03819206, 0.8250532, 0, 0.5333334, 1, 1,
0.2282429, 0.3813249, -0.3777247, 0, 0.5254902, 1, 1,
0.2300879, 1.685272, 1.574644, 0, 0.5215687, 1, 1,
0.2319055, 1.792938, -1.410108, 0, 0.5137255, 1, 1,
0.2320117, 0.04071726, -0.9839478, 0, 0.509804, 1, 1,
0.2334685, -0.120152, 1.559129, 0, 0.5019608, 1, 1,
0.233819, 0.01429152, 0.8211424, 0, 0.4941176, 1, 1,
0.2342578, -0.3648921, 2.884551, 0, 0.4901961, 1, 1,
0.2344433, -1.602947, 1.631952, 0, 0.4823529, 1, 1,
0.2374169, 0.006869854, 3.116931, 0, 0.4784314, 1, 1,
0.2415036, 1.162192, -0.3714941, 0, 0.4705882, 1, 1,
0.2425998, -0.4570862, 1.809937, 0, 0.4666667, 1, 1,
0.2467135, 2.014542, -0.04304893, 0, 0.4588235, 1, 1,
0.2501603, 0.2225396, -0.542374, 0, 0.454902, 1, 1,
0.251806, -0.2889239, 2.831954, 0, 0.4470588, 1, 1,
0.2546376, -1.1622, 1.398113, 0, 0.4431373, 1, 1,
0.2557682, -0.3656615, 2.766854, 0, 0.4352941, 1, 1,
0.2583585, -0.259324, 0.5820915, 0, 0.4313726, 1, 1,
0.2603085, -0.213733, 4.173016, 0, 0.4235294, 1, 1,
0.2649148, 1.326979, 2.565557, 0, 0.4196078, 1, 1,
0.2727797, 0.6923662, 0.1025597, 0, 0.4117647, 1, 1,
0.2743225, -1.574527, 3.285213, 0, 0.4078431, 1, 1,
0.2770323, 0.2877161, 2.161679, 0, 0.4, 1, 1,
0.2784869, -1.692242, 3.581982, 0, 0.3921569, 1, 1,
0.2821298, 1.04941, 0.7814352, 0, 0.3882353, 1, 1,
0.2883994, -1.847498, 3.376894, 0, 0.3803922, 1, 1,
0.2938817, 0.8370199, -0.8296552, 0, 0.3764706, 1, 1,
0.2948515, 0.8694655, 0.3659972, 0, 0.3686275, 1, 1,
0.2950903, -0.8147255, 1.960961, 0, 0.3647059, 1, 1,
0.2953809, 0.4492562, 1.304047, 0, 0.3568628, 1, 1,
0.2961812, -0.2752744, 2.878876, 0, 0.3529412, 1, 1,
0.2962351, -0.3599346, 2.867604, 0, 0.345098, 1, 1,
0.297173, 0.3418099, 0.1299995, 0, 0.3411765, 1, 1,
0.3003619, -2.141073, 2.466493, 0, 0.3333333, 1, 1,
0.3017356, -1.962101, 3.116732, 0, 0.3294118, 1, 1,
0.3019032, 1.516052, -0.3805852, 0, 0.3215686, 1, 1,
0.3035096, 0.7200358, 0.4262101, 0, 0.3176471, 1, 1,
0.3069403, -0.6814802, 4.179619, 0, 0.3098039, 1, 1,
0.3081538, 0.2430378, 2.647969, 0, 0.3058824, 1, 1,
0.3113104, -1.249318, 1.995648, 0, 0.2980392, 1, 1,
0.3119219, -0.385861, 2.895517, 0, 0.2901961, 1, 1,
0.3142199, 0.3549866, 0.5206894, 0, 0.2862745, 1, 1,
0.3153106, 0.4067677, -0.1118311, 0, 0.2784314, 1, 1,
0.3180028, -1.239825, 3.249321, 0, 0.2745098, 1, 1,
0.3180999, -0.2634052, 2.415553, 0, 0.2666667, 1, 1,
0.3201067, 0.5264384, 0.195062, 0, 0.2627451, 1, 1,
0.3248519, 1.256004, -0.7906172, 0, 0.254902, 1, 1,
0.3289056, 1.267727, 1.072459, 0, 0.2509804, 1, 1,
0.3294576, 0.6549056, -1.132385, 0, 0.2431373, 1, 1,
0.3294941, 0.2436295, 1.567947, 0, 0.2392157, 1, 1,
0.3309232, 0.6190015, 0.8908595, 0, 0.2313726, 1, 1,
0.3344007, -0.3051047, 2.409532, 0, 0.227451, 1, 1,
0.334471, -1.061503, 4.652629, 0, 0.2196078, 1, 1,
0.3355489, -2.376115, 3.344538, 0, 0.2156863, 1, 1,
0.33666, 1.163323, -0.3134337, 0, 0.2078431, 1, 1,
0.3367601, -0.6954765, 3.134373, 0, 0.2039216, 1, 1,
0.3369513, 1.484187, 2.737481, 0, 0.1960784, 1, 1,
0.3415296, 0.08237902, 1.51656, 0, 0.1882353, 1, 1,
0.3456999, -0.2088875, 1.336447, 0, 0.1843137, 1, 1,
0.347707, -0.5135904, 2.41755, 0, 0.1764706, 1, 1,
0.3480436, 1.100454, -0.8861389, 0, 0.172549, 1, 1,
0.3481556, -1.276866, 1.745294, 0, 0.1647059, 1, 1,
0.3549659, 0.6605462, -0.3468504, 0, 0.1607843, 1, 1,
0.3560344, -0.2442394, 1.923299, 0, 0.1529412, 1, 1,
0.356534, 1.085235, -1.55201, 0, 0.1490196, 1, 1,
0.3580076, 1.295822, 2.320363, 0, 0.1411765, 1, 1,
0.36696, 0.2432411, 1.003348, 0, 0.1372549, 1, 1,
0.3726813, 0.3725772, 0.9286297, 0, 0.1294118, 1, 1,
0.3728353, 1.549745, 0.3797562, 0, 0.1254902, 1, 1,
0.3739068, -0.02148794, 1.717332, 0, 0.1176471, 1, 1,
0.3763188, 1.243493, -0.2235172, 0, 0.1137255, 1, 1,
0.377498, 0.2886044, 0.06524011, 0, 0.1058824, 1, 1,
0.3816606, 1.085391, 1.744288, 0, 0.09803922, 1, 1,
0.3828075, 1.290984, -0.5003824, 0, 0.09411765, 1, 1,
0.3837854, 0.4221477, -0.03614155, 0, 0.08627451, 1, 1,
0.3847975, -0.1241672, 2.403128, 0, 0.08235294, 1, 1,
0.3872995, -0.8676829, 1.841289, 0, 0.07450981, 1, 1,
0.3885505, -1.333582, 3.563028, 0, 0.07058824, 1, 1,
0.3922503, -0.75441, 3.173457, 0, 0.0627451, 1, 1,
0.3950377, 1.557366, -0.4686691, 0, 0.05882353, 1, 1,
0.3955661, 1.070763, -0.703477, 0, 0.05098039, 1, 1,
0.3965675, 0.3078369, 1.893919, 0, 0.04705882, 1, 1,
0.3965755, -0.6362056, 2.138012, 0, 0.03921569, 1, 1,
0.3987419, -1.593426, 3.706916, 0, 0.03529412, 1, 1,
0.4048801, 0.2268117, 1.049339, 0, 0.02745098, 1, 1,
0.4074723, 1.576126, 0.262605, 0, 0.02352941, 1, 1,
0.4116467, 1.223649, 1.562514, 0, 0.01568628, 1, 1,
0.4159717, 0.4236898, -1.100398, 0, 0.01176471, 1, 1,
0.4164894, -1.506485, 1.234269, 0, 0.003921569, 1, 1,
0.4169627, -1.167826, 4.750005, 0.003921569, 0, 1, 1,
0.424038, 0.009088372, 1.797577, 0.007843138, 0, 1, 1,
0.4257042, -2.449745, 3.454446, 0.01568628, 0, 1, 1,
0.4332089, -0.7859128, 1.06669, 0.01960784, 0, 1, 1,
0.4347874, 0.2321744, 0.1352884, 0.02745098, 0, 1, 1,
0.4383028, 0.08474455, 3.210917, 0.03137255, 0, 1, 1,
0.4425075, 0.1004111, 1.227181, 0.03921569, 0, 1, 1,
0.4448942, -0.9071571, 2.866009, 0.04313726, 0, 1, 1,
0.4478646, -1.477493, 2.527866, 0.05098039, 0, 1, 1,
0.4493272, -0.6360073, 1.813605, 0.05490196, 0, 1, 1,
0.4526567, -0.008690499, 2.042469, 0.0627451, 0, 1, 1,
0.4620458, -0.638088, 0.1925342, 0.06666667, 0, 1, 1,
0.4658422, -1.13175, 3.823766, 0.07450981, 0, 1, 1,
0.4718439, -0.3123686, 1.224372, 0.07843138, 0, 1, 1,
0.4751221, 0.4411883, 1.099302, 0.08627451, 0, 1, 1,
0.4804823, -0.2419222, 3.883155, 0.09019608, 0, 1, 1,
0.4811886, 1.571426, -0.8956869, 0.09803922, 0, 1, 1,
0.4856102, -0.5117034, 1.931773, 0.1058824, 0, 1, 1,
0.4863709, -0.1294989, 2.653309, 0.1098039, 0, 1, 1,
0.4875604, 0.8826788, 1.154154, 0.1176471, 0, 1, 1,
0.4878955, -0.4268273, 4.863234, 0.1215686, 0, 1, 1,
0.4891146, 0.1440846, 0.6636798, 0.1294118, 0, 1, 1,
0.4903751, 0.2354655, 2.139907, 0.1333333, 0, 1, 1,
0.4909433, 0.1634814, 2.690765, 0.1411765, 0, 1, 1,
0.4934757, 1.065379, 1.327973, 0.145098, 0, 1, 1,
0.4953335, 0.7515492, 2.606433, 0.1529412, 0, 1, 1,
0.4979923, -0.1501028, 3.62534, 0.1568628, 0, 1, 1,
0.4984056, -0.2200636, 0.8948109, 0.1647059, 0, 1, 1,
0.5003702, -0.255705, 3.354946, 0.1686275, 0, 1, 1,
0.5050694, -0.2733101, 3.27059, 0.1764706, 0, 1, 1,
0.5147644, -0.09655651, 0.2692183, 0.1803922, 0, 1, 1,
0.5156885, -0.4917574, 3.614436, 0.1882353, 0, 1, 1,
0.5174559, -0.5711873, 2.837136, 0.1921569, 0, 1, 1,
0.5181996, 1.400197, 0.7225182, 0.2, 0, 1, 1,
0.5200391, -0.347244, 2.323339, 0.2078431, 0, 1, 1,
0.5202495, 1.243227, 2.129317, 0.2117647, 0, 1, 1,
0.5221364, 0.6210808, -0.4940717, 0.2196078, 0, 1, 1,
0.5231994, -0.6451293, 3.07023, 0.2235294, 0, 1, 1,
0.5238063, 0.2076216, 1.727597, 0.2313726, 0, 1, 1,
0.524186, 0.6520146, -0.1057619, 0.2352941, 0, 1, 1,
0.5254423, 0.8180161, 2.974973, 0.2431373, 0, 1, 1,
0.5275746, -0.4621603, 1.865276, 0.2470588, 0, 1, 1,
0.5318929, 0.3752472, 1.196574, 0.254902, 0, 1, 1,
0.5372988, 1.279117, -0.04357103, 0.2588235, 0, 1, 1,
0.5379452, 0.9391256, 1.207332, 0.2666667, 0, 1, 1,
0.5437156, 0.2455163, 0.0904425, 0.2705882, 0, 1, 1,
0.5449784, 0.8211465, 1.988595, 0.2784314, 0, 1, 1,
0.5457268, 1.172135, 0.79735, 0.282353, 0, 1, 1,
0.5490497, -0.8162421, 1.859622, 0.2901961, 0, 1, 1,
0.5496876, 1.04951, 1.268754, 0.2941177, 0, 1, 1,
0.5535755, 0.06788436, 1.182344, 0.3019608, 0, 1, 1,
0.5572165, 0.0543419, 0.4145805, 0.3098039, 0, 1, 1,
0.5641113, 1.248704, -0.3312318, 0.3137255, 0, 1, 1,
0.5641519, 0.6267373, -0.6324949, 0.3215686, 0, 1, 1,
0.565078, -0.1910651, 3.080113, 0.3254902, 0, 1, 1,
0.5675376, -0.7630901, 2.136638, 0.3333333, 0, 1, 1,
0.5688356, -0.6720702, 2.078273, 0.3372549, 0, 1, 1,
0.5710958, -0.250392, 2.436747, 0.345098, 0, 1, 1,
0.5771563, -0.6207873, 2.91627, 0.3490196, 0, 1, 1,
0.58368, 0.02210667, 0.9600891, 0.3568628, 0, 1, 1,
0.590947, -0.6795914, 0.5687502, 0.3607843, 0, 1, 1,
0.5910695, 0.6196268, -0.4419619, 0.3686275, 0, 1, 1,
0.5946459, -0.8126922, 1.907848, 0.372549, 0, 1, 1,
0.6020154, 0.4223987, 1.102086, 0.3803922, 0, 1, 1,
0.6058732, -2.39957, 3.508545, 0.3843137, 0, 1, 1,
0.6130751, 0.809889, 0.08828563, 0.3921569, 0, 1, 1,
0.6172283, 0.9492414, 0.9138355, 0.3960784, 0, 1, 1,
0.6192231, -1.614282, 3.054949, 0.4039216, 0, 1, 1,
0.6192467, 1.448252, -0.2723073, 0.4117647, 0, 1, 1,
0.6197837, 0.2348151, -0.06357559, 0.4156863, 0, 1, 1,
0.6202452, 0.6741065, 0.5394444, 0.4235294, 0, 1, 1,
0.6221178, -1.998706, 2.127206, 0.427451, 0, 1, 1,
0.6223572, 0.2493885, 1.740823, 0.4352941, 0, 1, 1,
0.6245759, 0.524111, 0.1357569, 0.4392157, 0, 1, 1,
0.6288055, 1.644028, 0.2406821, 0.4470588, 0, 1, 1,
0.629679, 0.3726626, 3.234375, 0.4509804, 0, 1, 1,
0.6359004, 0.4120189, 0.9910435, 0.4588235, 0, 1, 1,
0.6378411, -0.4833394, 3.194176, 0.4627451, 0, 1, 1,
0.6469522, -0.860259, 1.729656, 0.4705882, 0, 1, 1,
0.6564495, 0.8841742, 1.731128, 0.4745098, 0, 1, 1,
0.6597228, 0.02726339, 0.5908699, 0.4823529, 0, 1, 1,
0.6664538, 1.241546, 0.2516095, 0.4862745, 0, 1, 1,
0.6738452, 0.08079761, 2.131337, 0.4941176, 0, 1, 1,
0.6747308, -0.7754242, 2.541883, 0.5019608, 0, 1, 1,
0.6767559, -0.1761555, 1.894808, 0.5058824, 0, 1, 1,
0.6809216, -0.2686743, 2.865388, 0.5137255, 0, 1, 1,
0.6819369, 0.1864099, 1.72754, 0.5176471, 0, 1, 1,
0.6840673, -0.3868788, 3.304978, 0.5254902, 0, 1, 1,
0.6862449, 0.1515295, -1.313332, 0.5294118, 0, 1, 1,
0.6863389, 1.612235, 1.744951, 0.5372549, 0, 1, 1,
0.686923, 1.546678, -0.2290023, 0.5411765, 0, 1, 1,
0.6911731, 1.159325, 0.9193423, 0.5490196, 0, 1, 1,
0.6914012, 0.5638388, 3.67742, 0.5529412, 0, 1, 1,
0.6921948, -0.3219744, 0.8872022, 0.5607843, 0, 1, 1,
0.6992975, -0.2470237, 2.664887, 0.5647059, 0, 1, 1,
0.7006101, 1.071798, 1.413196, 0.572549, 0, 1, 1,
0.7055333, 0.6595555, 0.4367614, 0.5764706, 0, 1, 1,
0.7088065, 1.100125, 1.287295, 0.5843138, 0, 1, 1,
0.7121966, -1.028476, 3.546774, 0.5882353, 0, 1, 1,
0.7146303, -0.1514397, 1.827118, 0.5960785, 0, 1, 1,
0.7252893, 2.283038, -0.1837477, 0.6039216, 0, 1, 1,
0.7253242, -2.503489, 2.25146, 0.6078432, 0, 1, 1,
0.7301137, -0.6847461, 2.459833, 0.6156863, 0, 1, 1,
0.7323751, -0.09421737, 1.40527, 0.6196079, 0, 1, 1,
0.7354648, 0.9957355, 0.4360822, 0.627451, 0, 1, 1,
0.7377315, -0.4358833, 2.717177, 0.6313726, 0, 1, 1,
0.7378318, -0.7275497, 2.94428, 0.6392157, 0, 1, 1,
0.7389047, 0.4100936, 0.4612646, 0.6431373, 0, 1, 1,
0.7458029, 2.027814, -0.240929, 0.6509804, 0, 1, 1,
0.7525278, 0.2206686, 1.27321, 0.654902, 0, 1, 1,
0.7561375, -0.4156915, 3.650509, 0.6627451, 0, 1, 1,
0.7564496, 1.000584, 3.266127, 0.6666667, 0, 1, 1,
0.7566953, 0.1598113, -0.2698677, 0.6745098, 0, 1, 1,
0.7570372, 0.2516198, 3.202683, 0.6784314, 0, 1, 1,
0.7595845, -0.6249116, 2.808845, 0.6862745, 0, 1, 1,
0.7688636, 1.084561, 0.6637241, 0.6901961, 0, 1, 1,
0.7744557, 0.2361348, 1.434785, 0.6980392, 0, 1, 1,
0.7770299, 0.5592709, 0.5186569, 0.7058824, 0, 1, 1,
0.7815874, 0.243937, 1.65395, 0.7098039, 0, 1, 1,
0.7838991, -0.4805956, 1.728394, 0.7176471, 0, 1, 1,
0.7848907, -2.916945, 4.125179, 0.7215686, 0, 1, 1,
0.7880751, 1.32648, 0.618793, 0.7294118, 0, 1, 1,
0.797107, 0.7132586, 0.671016, 0.7333333, 0, 1, 1,
0.8005071, 0.7223505, 0.8547887, 0.7411765, 0, 1, 1,
0.8016518, 0.5385533, 2.061139, 0.7450981, 0, 1, 1,
0.8037341, 0.8054836, 1.492682, 0.7529412, 0, 1, 1,
0.8079905, 0.4500745, 0.2507164, 0.7568628, 0, 1, 1,
0.8102888, 1.557608, 1.353426, 0.7647059, 0, 1, 1,
0.8123708, -0.2561699, 3.869617, 0.7686275, 0, 1, 1,
0.8135068, 1.566988, -0.5721591, 0.7764706, 0, 1, 1,
0.8172423, -0.7367058, 1.765643, 0.7803922, 0, 1, 1,
0.8211631, -1.431448, 3.179224, 0.7882353, 0, 1, 1,
0.8229585, 0.8405079, -0.04222016, 0.7921569, 0, 1, 1,
0.8239282, 0.4136931, 0.03003363, 0.8, 0, 1, 1,
0.8246164, -0.4661987, 0.255816, 0.8078431, 0, 1, 1,
0.8272588, 0.653184, 0.7086282, 0.8117647, 0, 1, 1,
0.8288614, 0.9659498, 2.46054, 0.8196079, 0, 1, 1,
0.8307303, -1.71265, 2.166106, 0.8235294, 0, 1, 1,
0.8314162, -0.2059656, 0.2937848, 0.8313726, 0, 1, 1,
0.8325329, -0.6555364, 2.775047, 0.8352941, 0, 1, 1,
0.8347397, -0.5294144, 0.6515241, 0.8431373, 0, 1, 1,
0.8358217, -0.2001699, 0.9173237, 0.8470588, 0, 1, 1,
0.8398688, 0.9217761, 0.1572302, 0.854902, 0, 1, 1,
0.8419434, 0.8604617, -0.07334515, 0.8588235, 0, 1, 1,
0.8608459, 1.0914, 1.481654, 0.8666667, 0, 1, 1,
0.8673927, 1.058591, -0.01306297, 0.8705882, 0, 1, 1,
0.8684217, -0.7021503, 2.178854, 0.8784314, 0, 1, 1,
0.8734457, -0.8399845, 1.541568, 0.8823529, 0, 1, 1,
0.8750897, -1.253791, 1.393242, 0.8901961, 0, 1, 1,
0.8863399, 1.345648, -0.348632, 0.8941177, 0, 1, 1,
0.8942683, -0.8552467, 1.176562, 0.9019608, 0, 1, 1,
0.8950897, -0.5435345, 2.661905, 0.9098039, 0, 1, 1,
0.8950916, -0.9629827, 1.986583, 0.9137255, 0, 1, 1,
0.8961498, 0.9974156, -0.7144794, 0.9215686, 0, 1, 1,
0.8979583, 0.1840073, 0.1533822, 0.9254902, 0, 1, 1,
0.8993948, -2.375371, 2.098329, 0.9333333, 0, 1, 1,
0.9023526, -0.2532166, 2.597204, 0.9372549, 0, 1, 1,
0.9146656, 0.7103522, 0.8292263, 0.945098, 0, 1, 1,
0.9167805, 0.6698241, 2.058352, 0.9490196, 0, 1, 1,
0.9235148, -0.09186367, 2.645505, 0.9568627, 0, 1, 1,
0.9251719, 1.519182, 2.204156, 0.9607843, 0, 1, 1,
0.933636, -0.4636449, 2.090336, 0.9686275, 0, 1, 1,
0.9390512, -0.7464831, 1.66584, 0.972549, 0, 1, 1,
0.941391, 0.8832939, 1.252365, 0.9803922, 0, 1, 1,
0.9497336, 0.05307848, 2.085675, 0.9843137, 0, 1, 1,
0.9523849, -0.1365811, -0.2035651, 0.9921569, 0, 1, 1,
0.9581787, 1.093576, 2.335346, 0.9960784, 0, 1, 1,
0.958868, -0.8123705, 0.858431, 1, 0, 0.9960784, 1,
0.9668166, -0.5573274, 3.693296, 1, 0, 0.9882353, 1,
0.9681827, -0.2407936, 1.142974, 1, 0, 0.9843137, 1,
0.980015, -0.3938777, 2.804849, 1, 0, 0.9764706, 1,
0.9862717, 0.1052753, 0.6645457, 1, 0, 0.972549, 1,
0.9863932, -1.12219, 2.481047, 1, 0, 0.9647059, 1,
0.9926975, -0.502174, 1.229053, 1, 0, 0.9607843, 1,
0.9964831, -0.03067198, 2.338213, 1, 0, 0.9529412, 1,
0.9976988, -0.7391484, 1.736879, 1, 0, 0.9490196, 1,
1.006153, -1.567341, 3.382791, 1, 0, 0.9411765, 1,
1.009583, -2.101102, 4.776562, 1, 0, 0.9372549, 1,
1.010134, 1.271975, 0.2106947, 1, 0, 0.9294118, 1,
1.023518, -1.190834, 1.903748, 1, 0, 0.9254902, 1,
1.024678, 0.07734356, 1.957631, 1, 0, 0.9176471, 1,
1.026546, -0.1330971, 1.752054, 1, 0, 0.9137255, 1,
1.030138, -1.825015, 3.272115, 1, 0, 0.9058824, 1,
1.035089, 1.300573, -0.9099689, 1, 0, 0.9019608, 1,
1.037284, -0.4299, 4.704069, 1, 0, 0.8941177, 1,
1.038636, 0.9349208, 1.631387, 1, 0, 0.8862745, 1,
1.039341, -0.2110435, 2.14063, 1, 0, 0.8823529, 1,
1.04127, 0.2281791, 0.4093325, 1, 0, 0.8745098, 1,
1.054362, 0.1860321, 2.806967, 1, 0, 0.8705882, 1,
1.054372, -0.4040601, 1.140697, 1, 0, 0.8627451, 1,
1.059243, -0.2589443, 1.98713, 1, 0, 0.8588235, 1,
1.060886, -0.2598211, 0.3820648, 1, 0, 0.8509804, 1,
1.065452, 0.04281981, 2.148148, 1, 0, 0.8470588, 1,
1.071751, -0.8119892, 1.806896, 1, 0, 0.8392157, 1,
1.077471, -1.961323, 2.681265, 1, 0, 0.8352941, 1,
1.077856, 0.129024, 2.441122, 1, 0, 0.827451, 1,
1.093745, 0.7035493, 0.7505926, 1, 0, 0.8235294, 1,
1.093887, 0.04987525, 1.304528, 1, 0, 0.8156863, 1,
1.095447, 0.2602038, 0.8752897, 1, 0, 0.8117647, 1,
1.096202, -1.48132, 3.997145, 1, 0, 0.8039216, 1,
1.101579, 1.347362, 1.970396, 1, 0, 0.7960784, 1,
1.106631, -0.2230569, 1.71306, 1, 0, 0.7921569, 1,
1.111652, -1.437859, 2.482683, 1, 0, 0.7843137, 1,
1.111746, 0.5145794, -0.431382, 1, 0, 0.7803922, 1,
1.112664, -1.251336, 2.155894, 1, 0, 0.772549, 1,
1.114936, 2.142841, 0.9947437, 1, 0, 0.7686275, 1,
1.121551, 0.05418441, 0.7866926, 1, 0, 0.7607843, 1,
1.122727, 0.5759127, 0.5859079, 1, 0, 0.7568628, 1,
1.122858, -1.955794, 4.408635, 1, 0, 0.7490196, 1,
1.133858, 0.5768319, 1.773259, 1, 0, 0.7450981, 1,
1.135421, 2.134997, 1.361804, 1, 0, 0.7372549, 1,
1.136189, 0.5354032, 1.642558, 1, 0, 0.7333333, 1,
1.137364, -0.7676827, 0.6739742, 1, 0, 0.7254902, 1,
1.142028, -0.3253859, 2.942255, 1, 0, 0.7215686, 1,
1.142563, 0.4641739, 2.551, 1, 0, 0.7137255, 1,
1.146528, 0.2346604, 0.2284488, 1, 0, 0.7098039, 1,
1.150383, 1.259208, -0.1686958, 1, 0, 0.7019608, 1,
1.151484, -0.9807912, 1.875792, 1, 0, 0.6941177, 1,
1.152436, -2.094067, 3.343995, 1, 0, 0.6901961, 1,
1.156425, 1.476271, 0.4254377, 1, 0, 0.682353, 1,
1.163596, 0.020629, 0.8183028, 1, 0, 0.6784314, 1,
1.163827, -1.82479, 2.353235, 1, 0, 0.6705883, 1,
1.170665, 2.02121, 1.323256, 1, 0, 0.6666667, 1,
1.18434, -0.1449373, 2.627877, 1, 0, 0.6588235, 1,
1.19533, 0.07726043, 3.185283, 1, 0, 0.654902, 1,
1.195451, 0.3970081, 1.223064, 1, 0, 0.6470588, 1,
1.19805, -0.1719742, 0.6194646, 1, 0, 0.6431373, 1,
1.201287, 0.8507677, 1.595908, 1, 0, 0.6352941, 1,
1.206404, 0.1929786, 1.302408, 1, 0, 0.6313726, 1,
1.208879, 1.498944, 0.207077, 1, 0, 0.6235294, 1,
1.211095, 0.2443766, 0.5621177, 1, 0, 0.6196079, 1,
1.216005, -0.5230575, 3.034372, 1, 0, 0.6117647, 1,
1.216301, -0.2155951, 2.955187, 1, 0, 0.6078432, 1,
1.220847, 0.2603076, 1.483546, 1, 0, 0.6, 1,
1.221756, -1.575861, 2.778546, 1, 0, 0.5921569, 1,
1.222493, -1.027081, 0.3044547, 1, 0, 0.5882353, 1,
1.225163, 0.2908557, 2.463507, 1, 0, 0.5803922, 1,
1.229008, 1.150939, 0.9779512, 1, 0, 0.5764706, 1,
1.234496, 1.18693, 0.9073966, 1, 0, 0.5686275, 1,
1.246902, -0.6071423, 2.979775, 1, 0, 0.5647059, 1,
1.251876, -0.9388609, 1.88241, 1, 0, 0.5568628, 1,
1.257835, 0.9413078, 0.7926027, 1, 0, 0.5529412, 1,
1.262825, 1.044241, 0.2388735, 1, 0, 0.5450981, 1,
1.278532, -0.1589529, 1.130128, 1, 0, 0.5411765, 1,
1.283668, -1.451649, 1.29808, 1, 0, 0.5333334, 1,
1.294173, 1.497376, 0.9316683, 1, 0, 0.5294118, 1,
1.29555, -1.194513, 1.999467, 1, 0, 0.5215687, 1,
1.299423, 1.431952, 0.2229155, 1, 0, 0.5176471, 1,
1.299836, 0.9875923, 1.07048, 1, 0, 0.509804, 1,
1.313761, -0.5158591, 1.965344, 1, 0, 0.5058824, 1,
1.335413, -1.473556, 1.147883, 1, 0, 0.4980392, 1,
1.342215, -0.6027608, -0.2922021, 1, 0, 0.4901961, 1,
1.352812, 0.2409253, 1.28283, 1, 0, 0.4862745, 1,
1.358621, -0.4058765, 1.578487, 1, 0, 0.4784314, 1,
1.360872, 0.134855, 1.241726, 1, 0, 0.4745098, 1,
1.363494, 1.464864, 1.977319, 1, 0, 0.4666667, 1,
1.367071, 0.3722748, -0.09809799, 1, 0, 0.4627451, 1,
1.371367, -0.5741515, 1.536922, 1, 0, 0.454902, 1,
1.373549, -0.524004, 2.060026, 1, 0, 0.4509804, 1,
1.377539, 1.035887, -0.1818929, 1, 0, 0.4431373, 1,
1.379469, -1.256495, 0.35782, 1, 0, 0.4392157, 1,
1.380674, -0.818637, 1.885576, 1, 0, 0.4313726, 1,
1.385286, 0.216618, 1.438382, 1, 0, 0.427451, 1,
1.39499, 0.3283626, 1.183914, 1, 0, 0.4196078, 1,
1.397152, -1.041091, 1.355472, 1, 0, 0.4156863, 1,
1.398386, 1.129089, 0.4367805, 1, 0, 0.4078431, 1,
1.403696, -1.202144, 2.293625, 1, 0, 0.4039216, 1,
1.412477, 0.4499833, -1.224737, 1, 0, 0.3960784, 1,
1.416648, 2.064106, -0.2547387, 1, 0, 0.3882353, 1,
1.417356, 1.123641, 0.711633, 1, 0, 0.3843137, 1,
1.417548, -1.078254, 1.729463, 1, 0, 0.3764706, 1,
1.425526, 1.972544, -0.341008, 1, 0, 0.372549, 1,
1.426315, -0.8956844, 0.957062, 1, 0, 0.3647059, 1,
1.436697, 1.308731, 2.036457, 1, 0, 0.3607843, 1,
1.440986, -1.593851, 2.006696, 1, 0, 0.3529412, 1,
1.467225, 1.384648, 0.464655, 1, 0, 0.3490196, 1,
1.476691, 1.057388, 0.5655866, 1, 0, 0.3411765, 1,
1.484025, 0.8393844, 1.171798, 1, 0, 0.3372549, 1,
1.4893, -1.777753, 3.327696, 1, 0, 0.3294118, 1,
1.494692, -0.2775895, 1.757067, 1, 0, 0.3254902, 1,
1.500699, 2.158782, -1.051768, 1, 0, 0.3176471, 1,
1.506044, 0.2440153, 0.1629764, 1, 0, 0.3137255, 1,
1.509614, 0.4004946, 2.097805, 1, 0, 0.3058824, 1,
1.51543, 0.09127988, 4.600439, 1, 0, 0.2980392, 1,
1.526185, -1.183384, 2.086569, 1, 0, 0.2941177, 1,
1.535748, 0.671787, 0.3803647, 1, 0, 0.2862745, 1,
1.546186, 0.338692, 2.749871, 1, 0, 0.282353, 1,
1.546455, -0.1191644, 1.379953, 1, 0, 0.2745098, 1,
1.560111, 1.506872, -1.310488, 1, 0, 0.2705882, 1,
1.563795, 1.361933, 1.147747, 1, 0, 0.2627451, 1,
1.564671, -1.188925, 3.589081, 1, 0, 0.2588235, 1,
1.583753, -1.554841, 2.478247, 1, 0, 0.2509804, 1,
1.59358, -1.030959, 1.63641, 1, 0, 0.2470588, 1,
1.598739, -0.5015616, -0.1392401, 1, 0, 0.2392157, 1,
1.64896, 0.268655, 1.612597, 1, 0, 0.2352941, 1,
1.654236, -0.7488237, 1.052068, 1, 0, 0.227451, 1,
1.678444, -1.949605, 3.600838, 1, 0, 0.2235294, 1,
1.686358, 0.5689056, 0.2694911, 1, 0, 0.2156863, 1,
1.687558, 2.022776, 0.9765375, 1, 0, 0.2117647, 1,
1.708816, 0.6570166, 1.851067, 1, 0, 0.2039216, 1,
1.723715, -0.9432971, 3.116604, 1, 0, 0.1960784, 1,
1.725518, 0.5392049, 1.074542, 1, 0, 0.1921569, 1,
1.728038, -2.145972, 2.465383, 1, 0, 0.1843137, 1,
1.734549, 0.6916998, 0.8114398, 1, 0, 0.1803922, 1,
1.739602, -0.8847036, 2.073356, 1, 0, 0.172549, 1,
1.773502, 0.4535417, 1.131191, 1, 0, 0.1686275, 1,
1.775249, -1.496622, 3.196898, 1, 0, 0.1607843, 1,
1.813739, 0.4605294, 1.668237, 1, 0, 0.1568628, 1,
1.836424, -1.120331, 1.566046, 1, 0, 0.1490196, 1,
1.866648, 0.1538483, -0.4339088, 1, 0, 0.145098, 1,
1.911941, -0.03638947, 1.118667, 1, 0, 0.1372549, 1,
1.96459, 0.362805, 1.706254, 1, 0, 0.1333333, 1,
1.966943, 0.08339419, 1.842013, 1, 0, 0.1254902, 1,
1.969926, -1.056574, 1.552908, 1, 0, 0.1215686, 1,
1.990725, -0.5434049, 0.1175223, 1, 0, 0.1137255, 1,
2.006002, -0.3134243, 3.082182, 1, 0, 0.1098039, 1,
2.013944, -1.389802, 3.343258, 1, 0, 0.1019608, 1,
2.025177, -1.430626, 1.959604, 1, 0, 0.09411765, 1,
2.066027, -2.011278, 1.349726, 1, 0, 0.09019608, 1,
2.087912, -0.4452905, 1.947295, 1, 0, 0.08235294, 1,
2.105195, -0.3739564, 0.6439097, 1, 0, 0.07843138, 1,
2.141373, 0.01458214, 1.126967, 1, 0, 0.07058824, 1,
2.147432, -1.318044, 1.223889, 1, 0, 0.06666667, 1,
2.21242, 0.02538984, -0.1515379, 1, 0, 0.05882353, 1,
2.230272, -1.582387, 2.936836, 1, 0, 0.05490196, 1,
2.249206, -0.7519983, 3.38756, 1, 0, 0.04705882, 1,
2.260912, 0.6853735, 0.7386305, 1, 0, 0.04313726, 1,
2.600494, 1.231978, 0.4983739, 1, 0, 0.03529412, 1,
2.6376, -1.270356, 2.002877, 1, 0, 0.03137255, 1,
2.685847, -0.7510929, 0.8074336, 1, 0, 0.02352941, 1,
2.816132, -0.01132133, 1.502012, 1, 0, 0.01960784, 1,
2.841361, 0.7213815, -0.4400012, 1, 0, 0.01176471, 1,
3.288396, -0.7185639, 1.832222, 1, 0, 0.007843138, 1
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
0.1031766, -3.872417, -7.721349, 0, -0.5, 0.5, 0.5,
0.1031766, -3.872417, -7.721349, 1, -0.5, 0.5, 0.5,
0.1031766, -3.872417, -7.721349, 1, 1.5, 0.5, 0.5,
0.1031766, -3.872417, -7.721349, 0, 1.5, 0.5, 0.5
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
-4.161832, -0.09844136, -7.721349, 0, -0.5, 0.5, 0.5,
-4.161832, -0.09844136, -7.721349, 1, -0.5, 0.5, 0.5,
-4.161832, -0.09844136, -7.721349, 1, 1.5, 0.5, 0.5,
-4.161832, -0.09844136, -7.721349, 0, 1.5, 0.5, 0.5
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
-4.161832, -3.872417, -0.4499807, 0, -0.5, 0.5, 0.5,
-4.161832, -3.872417, -0.4499807, 1, -0.5, 0.5, 0.5,
-4.161832, -3.872417, -0.4499807, 1, 1.5, 0.5, 0.5,
-4.161832, -3.872417, -0.4499807, 0, 1.5, 0.5, 0.5
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
-3, -3.0015, -6.043341,
3, -3.0015, -6.043341,
-3, -3.0015, -6.043341,
-3, -3.146652, -6.323009,
-2, -3.0015, -6.043341,
-2, -3.146652, -6.323009,
-1, -3.0015, -6.043341,
-1, -3.146652, -6.323009,
0, -3.0015, -6.043341,
0, -3.146652, -6.323009,
1, -3.0015, -6.043341,
1, -3.146652, -6.323009,
2, -3.0015, -6.043341,
2, -3.146652, -6.323009,
3, -3.0015, -6.043341,
3, -3.146652, -6.323009
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
-3, -3.436958, -6.882345, 0, -0.5, 0.5, 0.5,
-3, -3.436958, -6.882345, 1, -0.5, 0.5, 0.5,
-3, -3.436958, -6.882345, 1, 1.5, 0.5, 0.5,
-3, -3.436958, -6.882345, 0, 1.5, 0.5, 0.5,
-2, -3.436958, -6.882345, 0, -0.5, 0.5, 0.5,
-2, -3.436958, -6.882345, 1, -0.5, 0.5, 0.5,
-2, -3.436958, -6.882345, 1, 1.5, 0.5, 0.5,
-2, -3.436958, -6.882345, 0, 1.5, 0.5, 0.5,
-1, -3.436958, -6.882345, 0, -0.5, 0.5, 0.5,
-1, -3.436958, -6.882345, 1, -0.5, 0.5, 0.5,
-1, -3.436958, -6.882345, 1, 1.5, 0.5, 0.5,
-1, -3.436958, -6.882345, 0, 1.5, 0.5, 0.5,
0, -3.436958, -6.882345, 0, -0.5, 0.5, 0.5,
0, -3.436958, -6.882345, 1, -0.5, 0.5, 0.5,
0, -3.436958, -6.882345, 1, 1.5, 0.5, 0.5,
0, -3.436958, -6.882345, 0, 1.5, 0.5, 0.5,
1, -3.436958, -6.882345, 0, -0.5, 0.5, 0.5,
1, -3.436958, -6.882345, 1, -0.5, 0.5, 0.5,
1, -3.436958, -6.882345, 1, 1.5, 0.5, 0.5,
1, -3.436958, -6.882345, 0, 1.5, 0.5, 0.5,
2, -3.436958, -6.882345, 0, -0.5, 0.5, 0.5,
2, -3.436958, -6.882345, 1, -0.5, 0.5, 0.5,
2, -3.436958, -6.882345, 1, 1.5, 0.5, 0.5,
2, -3.436958, -6.882345, 0, 1.5, 0.5, 0.5,
3, -3.436958, -6.882345, 0, -0.5, 0.5, 0.5,
3, -3.436958, -6.882345, 1, -0.5, 0.5, 0.5,
3, -3.436958, -6.882345, 1, 1.5, 0.5, 0.5,
3, -3.436958, -6.882345, 0, 1.5, 0.5, 0.5
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
-3.177599, -2, -6.043341,
-3.177599, 2, -6.043341,
-3.177599, -2, -6.043341,
-3.341638, -2, -6.323009,
-3.177599, -1, -6.043341,
-3.341638, -1, -6.323009,
-3.177599, 0, -6.043341,
-3.341638, 0, -6.323009,
-3.177599, 1, -6.043341,
-3.341638, 1, -6.323009,
-3.177599, 2, -6.043341,
-3.341638, 2, -6.323009
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
-3.669716, -2, -6.882345, 0, -0.5, 0.5, 0.5,
-3.669716, -2, -6.882345, 1, -0.5, 0.5, 0.5,
-3.669716, -2, -6.882345, 1, 1.5, 0.5, 0.5,
-3.669716, -2, -6.882345, 0, 1.5, 0.5, 0.5,
-3.669716, -1, -6.882345, 0, -0.5, 0.5, 0.5,
-3.669716, -1, -6.882345, 1, -0.5, 0.5, 0.5,
-3.669716, -1, -6.882345, 1, 1.5, 0.5, 0.5,
-3.669716, -1, -6.882345, 0, 1.5, 0.5, 0.5,
-3.669716, 0, -6.882345, 0, -0.5, 0.5, 0.5,
-3.669716, 0, -6.882345, 1, -0.5, 0.5, 0.5,
-3.669716, 0, -6.882345, 1, 1.5, 0.5, 0.5,
-3.669716, 0, -6.882345, 0, 1.5, 0.5, 0.5,
-3.669716, 1, -6.882345, 0, -0.5, 0.5, 0.5,
-3.669716, 1, -6.882345, 1, -0.5, 0.5, 0.5,
-3.669716, 1, -6.882345, 1, 1.5, 0.5, 0.5,
-3.669716, 1, -6.882345, 0, 1.5, 0.5, 0.5,
-3.669716, 2, -6.882345, 0, -0.5, 0.5, 0.5,
-3.669716, 2, -6.882345, 1, -0.5, 0.5, 0.5,
-3.669716, 2, -6.882345, 1, 1.5, 0.5, 0.5,
-3.669716, 2, -6.882345, 0, 1.5, 0.5, 0.5
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
-3.177599, -3.0015, -4,
-3.177599, -3.0015, 4,
-3.177599, -3.0015, -4,
-3.341638, -3.146652, -4,
-3.177599, -3.0015, -2,
-3.341638, -3.146652, -2,
-3.177599, -3.0015, 0,
-3.341638, -3.146652, 0,
-3.177599, -3.0015, 2,
-3.341638, -3.146652, 2,
-3.177599, -3.0015, 4,
-3.341638, -3.146652, 4
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
-3.669716, -3.436958, -4, 0, -0.5, 0.5, 0.5,
-3.669716, -3.436958, -4, 1, -0.5, 0.5, 0.5,
-3.669716, -3.436958, -4, 1, 1.5, 0.5, 0.5,
-3.669716, -3.436958, -4, 0, 1.5, 0.5, 0.5,
-3.669716, -3.436958, -2, 0, -0.5, 0.5, 0.5,
-3.669716, -3.436958, -2, 1, -0.5, 0.5, 0.5,
-3.669716, -3.436958, -2, 1, 1.5, 0.5, 0.5,
-3.669716, -3.436958, -2, 0, 1.5, 0.5, 0.5,
-3.669716, -3.436958, 0, 0, -0.5, 0.5, 0.5,
-3.669716, -3.436958, 0, 1, -0.5, 0.5, 0.5,
-3.669716, -3.436958, 0, 1, 1.5, 0.5, 0.5,
-3.669716, -3.436958, 0, 0, 1.5, 0.5, 0.5,
-3.669716, -3.436958, 2, 0, -0.5, 0.5, 0.5,
-3.669716, -3.436958, 2, 1, -0.5, 0.5, 0.5,
-3.669716, -3.436958, 2, 1, 1.5, 0.5, 0.5,
-3.669716, -3.436958, 2, 0, 1.5, 0.5, 0.5,
-3.669716, -3.436958, 4, 0, -0.5, 0.5, 0.5,
-3.669716, -3.436958, 4, 1, -0.5, 0.5, 0.5,
-3.669716, -3.436958, 4, 1, 1.5, 0.5, 0.5,
-3.669716, -3.436958, 4, 0, 1.5, 0.5, 0.5
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
-3.177599, -3.0015, -6.043341,
-3.177599, 2.804617, -6.043341,
-3.177599, -3.0015, 5.143379,
-3.177599, 2.804617, 5.143379,
-3.177599, -3.0015, -6.043341,
-3.177599, -3.0015, 5.143379,
-3.177599, 2.804617, -6.043341,
-3.177599, 2.804617, 5.143379,
-3.177599, -3.0015, -6.043341,
3.383953, -3.0015, -6.043341,
-3.177599, -3.0015, 5.143379,
3.383953, -3.0015, 5.143379,
-3.177599, 2.804617, -6.043341,
3.383953, 2.804617, -6.043341,
-3.177599, 2.804617, 5.143379,
3.383953, 2.804617, 5.143379,
3.383953, -3.0015, -6.043341,
3.383953, 2.804617, -6.043341,
3.383953, -3.0015, 5.143379,
3.383953, 2.804617, 5.143379,
3.383953, -3.0015, -6.043341,
3.383953, -3.0015, 5.143379,
3.383953, 2.804617, -6.043341,
3.383953, 2.804617, 5.143379
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
var radius = 7.587555;
var distance = 33.75789;
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
mvMatrix.translate( -0.1031766, 0.09844136, 0.4499807 );
mvMatrix.scale( 1.250286, 1.412961, 0.7333529 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.75789);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Koban<-read.table("Koban.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Koban$V2
```

```
## Error in eval(expr, envir, enclos): object 'Koban' not found
```

```r
y<-Koban$V3
```

```
## Error in eval(expr, envir, enclos): object 'Koban' not found
```

```r
z<-Koban$V4
```

```
## Error in eval(expr, envir, enclos): object 'Koban' not found
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
-3.082043, 0.2290536, -1.601654, 0, 0, 1, 1, 1,
-2.919668, 0.3766233, 0.190849, 1, 0, 0, 1, 1,
-2.745677, -1.769535, -2.436451, 1, 0, 0, 1, 1,
-2.737396, -1.456476, -0.9051696, 1, 0, 0, 1, 1,
-2.621302, -0.4736909, -1.693803, 1, 0, 0, 1, 1,
-2.602823, 0.4226684, -2.322045, 1, 0, 0, 1, 1,
-2.576425, 0.2039937, -1.622779, 0, 0, 0, 1, 1,
-2.540603, -0.3927535, -3.006597, 0, 0, 0, 1, 1,
-2.47604, 1.016059, -0.5351172, 0, 0, 0, 1, 1,
-2.448848, 0.7067248, -1.272726, 0, 0, 0, 1, 1,
-2.368612, 1.365945, -0.2305854, 0, 0, 0, 1, 1,
-2.337846, 0.06734069, -0.7907724, 0, 0, 0, 1, 1,
-2.27382, 1.156012, -1.825722, 0, 0, 0, 1, 1,
-2.235772, 0.3541332, 0.1197332, 1, 1, 1, 1, 1,
-2.233968, 2.071297, -1.164766, 1, 1, 1, 1, 1,
-2.219901, -0.2890099, -2.650791, 1, 1, 1, 1, 1,
-2.201349, 0.5721977, -0.08081698, 1, 1, 1, 1, 1,
-2.194444, 2.505037, -2.868149, 1, 1, 1, 1, 1,
-2.174843, 0.9822841, 0.9230808, 1, 1, 1, 1, 1,
-2.169071, -0.6786117, -0.7617663, 1, 1, 1, 1, 1,
-2.109245, 0.1508135, -1.813437, 1, 1, 1, 1, 1,
-2.095709, -1.338744, -1.674943, 1, 1, 1, 1, 1,
-2.095449, 0.2811604, -1.261765, 1, 1, 1, 1, 1,
-2.072703, 0.07006716, -1.60816, 1, 1, 1, 1, 1,
-2.049527, -0.1270247, -0.3672753, 1, 1, 1, 1, 1,
-2.017702, -1.196282, -2.004632, 1, 1, 1, 1, 1,
-1.983406, 0.2824981, -2.134024, 1, 1, 1, 1, 1,
-1.980235, -0.7784967, -3.330867, 1, 1, 1, 1, 1,
-1.971845, 1.13755, -3.531904, 0, 0, 1, 1, 1,
-1.959333, -1.506627, -1.552397, 1, 0, 0, 1, 1,
-1.939065, -1.064009, -3.710743, 1, 0, 0, 1, 1,
-1.934394, -0.7706723, -2.946863, 1, 0, 0, 1, 1,
-1.924905, 0.07147118, -2.842085, 1, 0, 0, 1, 1,
-1.915417, -0.4300007, -1.764236, 1, 0, 0, 1, 1,
-1.873852, 1.26778, -2.306553, 0, 0, 0, 1, 1,
-1.872862, -1.021217, -0.2314925, 0, 0, 0, 1, 1,
-1.856825, -0.2252856, -0.0145069, 0, 0, 0, 1, 1,
-1.84693, 1.109422, -0.284798, 0, 0, 0, 1, 1,
-1.838373, 2.04206, -0.6851266, 0, 0, 0, 1, 1,
-1.82539, -0.3585094, -0.3134692, 0, 0, 0, 1, 1,
-1.813372, 0.8195602, -0.3151384, 0, 0, 0, 1, 1,
-1.80998, 0.2441037, -0.7117854, 1, 1, 1, 1, 1,
-1.802014, -0.7566459, -1.612024, 1, 1, 1, 1, 1,
-1.795033, -0.5089985, -2.545881, 1, 1, 1, 1, 1,
-1.782701, -0.06648411, -2.286732, 1, 1, 1, 1, 1,
-1.738358, -0.7083107, -1.380324, 1, 1, 1, 1, 1,
-1.728626, 0.7064728, -1.567369, 1, 1, 1, 1, 1,
-1.723543, 1.056796, 0.7745367, 1, 1, 1, 1, 1,
-1.722001, -1.767996, -3.142463, 1, 1, 1, 1, 1,
-1.721663, 0.06425671, -0.6892784, 1, 1, 1, 1, 1,
-1.716298, -0.847291, -2.933173, 1, 1, 1, 1, 1,
-1.702736, -0.4693071, -1.045413, 1, 1, 1, 1, 1,
-1.671912, 1.017382, -0.4136826, 1, 1, 1, 1, 1,
-1.660572, 0.9813367, -0.9193555, 1, 1, 1, 1, 1,
-1.655987, -0.7452998, -3.078558, 1, 1, 1, 1, 1,
-1.638822, -0.954239, -3.211012, 1, 1, 1, 1, 1,
-1.627429, 0.877179, -1.329448, 0, 0, 1, 1, 1,
-1.616427, 0.447636, -0.6403477, 1, 0, 0, 1, 1,
-1.603279, 0.7958835, -1.19371, 1, 0, 0, 1, 1,
-1.595233, 0.9573612, -0.7983237, 1, 0, 0, 1, 1,
-1.579404, -0.4012769, -2.989783, 1, 0, 0, 1, 1,
-1.572818, -1.910826, -1.518611, 1, 0, 0, 1, 1,
-1.56972, 0.9257296, -0.6997614, 0, 0, 0, 1, 1,
-1.568387, -0.6882809, -1.106679, 0, 0, 0, 1, 1,
-1.563259, 2.323124, 0.7183418, 0, 0, 0, 1, 1,
-1.561972, -1.405721, -2.05279, 0, 0, 0, 1, 1,
-1.551488, -0.7137163, -1.56171, 0, 0, 0, 1, 1,
-1.54502, 0.6913899, -1.06349, 0, 0, 0, 1, 1,
-1.538018, -2.464449, -0.2369637, 0, 0, 0, 1, 1,
-1.534985, -1.811413, -2.547842, 1, 1, 1, 1, 1,
-1.531801, -0.6519452, -1.738476, 1, 1, 1, 1, 1,
-1.529831, 0.8387601, 0.2629768, 1, 1, 1, 1, 1,
-1.528787, 1.606999, -0.907062, 1, 1, 1, 1, 1,
-1.526707, 0.8257453, -0.5960627, 1, 1, 1, 1, 1,
-1.519084, -0.09384108, -1.86489, 1, 1, 1, 1, 1,
-1.518063, -0.3414829, -1.869923, 1, 1, 1, 1, 1,
-1.492382, -0.2115749, -3.492259, 1, 1, 1, 1, 1,
-1.481923, 0.6387196, -1.825182, 1, 1, 1, 1, 1,
-1.47313, 0.7331027, -1.682554, 1, 1, 1, 1, 1,
-1.471103, 0.5661082, 0.6553515, 1, 1, 1, 1, 1,
-1.468985, -0.1644046, -1.475372, 1, 1, 1, 1, 1,
-1.468842, 1.282274, 1.166539, 1, 1, 1, 1, 1,
-1.461634, 0.4368685, -0.1638089, 1, 1, 1, 1, 1,
-1.460526, -0.7124645, -1.365959, 1, 1, 1, 1, 1,
-1.454955, 1.535697, -0.3093991, 0, 0, 1, 1, 1,
-1.441173, 1.997807, 1.397434, 1, 0, 0, 1, 1,
-1.440718, 0.3389542, -1.781079, 1, 0, 0, 1, 1,
-1.440508, 2.262268, -1.323196, 1, 0, 0, 1, 1,
-1.439233, -0.4407597, -2.588443, 1, 0, 0, 1, 1,
-1.433259, -0.4146422, -2.38475, 1, 0, 0, 1, 1,
-1.429303, -1.174847, -3.044938, 0, 0, 0, 1, 1,
-1.427791, 0.4326558, -3.043701, 0, 0, 0, 1, 1,
-1.421094, -0.3316744, -2.340956, 0, 0, 0, 1, 1,
-1.413344, 1.506856, 0.280784, 0, 0, 0, 1, 1,
-1.412341, -0.4029384, -2.723833, 0, 0, 0, 1, 1,
-1.412174, 0.0138863, -1.295177, 0, 0, 0, 1, 1,
-1.408249, -0.7904803, -4.50386, 0, 0, 0, 1, 1,
-1.392277, -0.291976, -2.14798, 1, 1, 1, 1, 1,
-1.386182, 1.314961, -3.058995, 1, 1, 1, 1, 1,
-1.37314, 1.052046, -0.7499374, 1, 1, 1, 1, 1,
-1.366154, 1.039608, -0.217716, 1, 1, 1, 1, 1,
-1.359876, 0.2703639, -2.070851, 1, 1, 1, 1, 1,
-1.352076, -0.2558228, -1.580534, 1, 1, 1, 1, 1,
-1.351364, 1.119942, -0.3613856, 1, 1, 1, 1, 1,
-1.349879, 0.004710073, -2.195596, 1, 1, 1, 1, 1,
-1.344975, -1.054436, -1.952934, 1, 1, 1, 1, 1,
-1.340822, 0.1371278, -0.9940561, 1, 1, 1, 1, 1,
-1.338817, 0.9039197, 0.6455511, 1, 1, 1, 1, 1,
-1.336924, -0.2202886, -1.335891, 1, 1, 1, 1, 1,
-1.332775, -0.1661949, -0.9298244, 1, 1, 1, 1, 1,
-1.304868, -0.7086315, -1.673347, 1, 1, 1, 1, 1,
-1.301644, 1.355144, -0.6521004, 1, 1, 1, 1, 1,
-1.300414, -0.9415671, -3.205926, 0, 0, 1, 1, 1,
-1.296761, 0.38263, -0.4650037, 1, 0, 0, 1, 1,
-1.290957, -1.164672, -1.755952, 1, 0, 0, 1, 1,
-1.284456, 0.08422507, -1.104267, 1, 0, 0, 1, 1,
-1.283099, -1.066, -0.9549018, 1, 0, 0, 1, 1,
-1.277748, -0.6152065, -1.272908, 1, 0, 0, 1, 1,
-1.275112, -1.405449, -2.063647, 0, 0, 0, 1, 1,
-1.266839, 1.073594, -1.041243, 0, 0, 0, 1, 1,
-1.255545, -1.049602, -1.176582, 0, 0, 0, 1, 1,
-1.250105, 0.3659373, -1.836385, 0, 0, 0, 1, 1,
-1.24721, 1.678744, -2.104417, 0, 0, 0, 1, 1,
-1.240582, -0.1258382, -2.665974, 0, 0, 0, 1, 1,
-1.240385, 0.07762801, -1.026097, 0, 0, 0, 1, 1,
-1.235624, -1.279243, -2.687828, 1, 1, 1, 1, 1,
-1.233344, 0.05693509, -1.796708, 1, 1, 1, 1, 1,
-1.226442, 0.8592671, -0.5850399, 1, 1, 1, 1, 1,
-1.226251, 0.7992387, -0.688819, 1, 1, 1, 1, 1,
-1.224055, -0.08353201, -1.784861, 1, 1, 1, 1, 1,
-1.218843, 0.1689506, -1.860454, 1, 1, 1, 1, 1,
-1.215591, 0.1867708, 0.08929061, 1, 1, 1, 1, 1,
-1.197278, 1.119095, 0.1999425, 1, 1, 1, 1, 1,
-1.184839, 0.2103338, -1.708934, 1, 1, 1, 1, 1,
-1.181308, -0.7439953, -2.566445, 1, 1, 1, 1, 1,
-1.179731, -1.982716, -3.056852, 1, 1, 1, 1, 1,
-1.175612, -1.431046, -2.617392, 1, 1, 1, 1, 1,
-1.163514, -1.101377, -4.881998, 1, 1, 1, 1, 1,
-1.162881, -0.8436589, -1.928011, 1, 1, 1, 1, 1,
-1.161129, 0.5489025, -1.410526, 1, 1, 1, 1, 1,
-1.158579, 0.1565549, -0.6693412, 0, 0, 1, 1, 1,
-1.158571, -0.3978582, -2.381605, 1, 0, 0, 1, 1,
-1.158088, -1.301192, -2.697528, 1, 0, 0, 1, 1,
-1.155928, 0.5958063, -1.330367, 1, 0, 0, 1, 1,
-1.133138, 0.0556733, -2.830894, 1, 0, 0, 1, 1,
-1.131697, 1.795124, 1.036838, 1, 0, 0, 1, 1,
-1.12466, -0.7795222, -2.545818, 0, 0, 0, 1, 1,
-1.119604, -0.416124, -1.612269, 0, 0, 0, 1, 1,
-1.114503, -0.5517765, -2.995028, 0, 0, 0, 1, 1,
-1.114112, 0.8726015, 0.7324256, 0, 0, 0, 1, 1,
-1.103666, 0.07115634, -2.155993, 0, 0, 0, 1, 1,
-1.101549, -1.664275, -2.272192, 0, 0, 0, 1, 1,
-1.099985, 1.670395, 0.5767568, 0, 0, 0, 1, 1,
-1.082152, 0.1658515, -0.4053825, 1, 1, 1, 1, 1,
-1.077747, 1.040537, 0.2301908, 1, 1, 1, 1, 1,
-1.063393, -1.424091, -2.278828, 1, 1, 1, 1, 1,
-1.044439, -0.1759086, -1.002686, 1, 1, 1, 1, 1,
-1.041113, 1.511526, -0.2311936, 1, 1, 1, 1, 1,
-1.027558, -1.000313, -1.723886, 1, 1, 1, 1, 1,
-1.027435, -0.1550109, -3.546011, 1, 1, 1, 1, 1,
-1.027357, 0.1271709, -0.9169238, 1, 1, 1, 1, 1,
-1.020612, 1.987077, -0.8440669, 1, 1, 1, 1, 1,
-1.019808, 0.03938581, -2.995477, 1, 1, 1, 1, 1,
-1.016748, -0.8614281, -4.080538, 1, 1, 1, 1, 1,
-1.016657, -0.4612913, -1.949907, 1, 1, 1, 1, 1,
-1.01527, 1.018037, -0.475773, 1, 1, 1, 1, 1,
-1.012891, -1.248592, -1.64301, 1, 1, 1, 1, 1,
-1.005862, -0.8716545, -3.463292, 1, 1, 1, 1, 1,
-1.005809, 1.291903, -0.05751991, 0, 0, 1, 1, 1,
-1.003494, 0.356865, -1.866841, 1, 0, 0, 1, 1,
-1.000884, -0.1023082, -0.4114161, 1, 0, 0, 1, 1,
-0.9954354, -0.8267508, 0.2683627, 1, 0, 0, 1, 1,
-0.9861538, -0.2398134, -1.429663, 1, 0, 0, 1, 1,
-0.9857336, -1.765952, -4.110746, 1, 0, 0, 1, 1,
-0.9837745, -1.426758, -1.707279, 0, 0, 0, 1, 1,
-0.9750522, 1.509037, -0.6078001, 0, 0, 0, 1, 1,
-0.9662936, -1.082249, -1.230926, 0, 0, 0, 1, 1,
-0.9608197, -0.5141849, -1.547621, 0, 0, 0, 1, 1,
-0.9569888, 0.7783613, -1.96844, 0, 0, 0, 1, 1,
-0.955641, 0.2406711, -1.18925, 0, 0, 0, 1, 1,
-0.9446736, 1.390435, -1.482231, 0, 0, 0, 1, 1,
-0.940393, -0.7583916, -3.776515, 1, 1, 1, 1, 1,
-0.9376037, -1.930971, -2.548237, 1, 1, 1, 1, 1,
-0.9361665, -1.305065, -0.7480807, 1, 1, 1, 1, 1,
-0.9340933, -1.05633, -1.584353, 1, 1, 1, 1, 1,
-0.9301339, -1.907465, -2.188982, 1, 1, 1, 1, 1,
-0.9271652, -0.1202396, -1.886477, 1, 1, 1, 1, 1,
-0.9231417, -0.1653807, -2.365844, 1, 1, 1, 1, 1,
-0.9026042, 0.1156456, -1.51103, 1, 1, 1, 1, 1,
-0.9019617, 0.7735396, -1.784678, 1, 1, 1, 1, 1,
-0.9011165, -0.1188275, -0.9034645, 1, 1, 1, 1, 1,
-0.8842545, 1.016187, -0.4251781, 1, 1, 1, 1, 1,
-0.8825535, 1.207792, -1.753145, 1, 1, 1, 1, 1,
-0.8821403, 0.6247648, -1.666537, 1, 1, 1, 1, 1,
-0.8757656, 0.4798335, -1.75769, 1, 1, 1, 1, 1,
-0.8744574, -0.3672256, -2.108505, 1, 1, 1, 1, 1,
-0.873711, -1.400528, -1.782686, 0, 0, 1, 1, 1,
-0.8679803, 0.9626787, -0.6764954, 1, 0, 0, 1, 1,
-0.8591199, -0.4347457, -2.239928, 1, 0, 0, 1, 1,
-0.8571675, 0.5127296, -0.2531234, 1, 0, 0, 1, 1,
-0.8570795, -0.550231, -0.9962677, 1, 0, 0, 1, 1,
-0.8566965, 2.423854, -0.3524195, 1, 0, 0, 1, 1,
-0.852349, -0.9210001, -1.545271, 0, 0, 0, 1, 1,
-0.8502977, -0.1299345, -2.875165, 0, 0, 0, 1, 1,
-0.8480893, -0.09370186, -1.894455, 0, 0, 0, 1, 1,
-0.8420109, -1.393109, -3.335919, 0, 0, 0, 1, 1,
-0.8381107, 2.358226, -1.06777, 0, 0, 0, 1, 1,
-0.8364466, 0.5268988, -0.4215606, 0, 0, 0, 1, 1,
-0.8261517, 0.03644744, -1.932486, 0, 0, 0, 1, 1,
-0.825516, -0.3285221, -3.336629, 1, 1, 1, 1, 1,
-0.822662, -0.8011303, -2.025349, 1, 1, 1, 1, 1,
-0.8185487, -0.5297278, -2.807802, 1, 1, 1, 1, 1,
-0.8043756, 0.8423105, -0.8215104, 1, 1, 1, 1, 1,
-0.8034928, 0.6722822, -0.5661113, 1, 1, 1, 1, 1,
-0.8025153, -0.6187392, -1.39695, 1, 1, 1, 1, 1,
-0.8009886, -0.6688396, -1.324982, 1, 1, 1, 1, 1,
-0.8002299, 0.5951605, -1.213217, 1, 1, 1, 1, 1,
-0.8000732, -0.485881, -2.109275, 1, 1, 1, 1, 1,
-0.7998115, -1.444516, -1.097687, 1, 1, 1, 1, 1,
-0.7992588, 0.6493649, -0.5087157, 1, 1, 1, 1, 1,
-0.7941748, 0.02335091, -2.619615, 1, 1, 1, 1, 1,
-0.7933142, -0.536096, -3.036076, 1, 1, 1, 1, 1,
-0.787558, 0.09607656, -2.478998, 1, 1, 1, 1, 1,
-0.7856315, 1.545268, -1.646602, 1, 1, 1, 1, 1,
-0.7851419, -0.2695215, 0.6794068, 0, 0, 1, 1, 1,
-0.7844875, -0.4400685, -1.39783, 1, 0, 0, 1, 1,
-0.7826672, -1.494287, -3.537126, 1, 0, 0, 1, 1,
-0.781487, 1.2575, 0.8153212, 1, 0, 0, 1, 1,
-0.7698925, -0.8033766, -3.309063, 1, 0, 0, 1, 1,
-0.7592807, -0.9667423, -1.633639, 1, 0, 0, 1, 1,
-0.7568328, 0.5555833, -0.01315786, 0, 0, 0, 1, 1,
-0.7534722, 0.2219924, -0.01432327, 0, 0, 0, 1, 1,
-0.7530182, -0.1549428, -3.124806, 0, 0, 0, 1, 1,
-0.7465717, -0.5559703, -2.062248, 0, 0, 0, 1, 1,
-0.7437554, -0.9923558, -2.549436, 0, 0, 0, 1, 1,
-0.742914, 1.735438, -0.6696293, 0, 0, 0, 1, 1,
-0.7414721, 1.910658, 0.3565886, 0, 0, 0, 1, 1,
-0.7409687, 1.028766, -1.079371, 1, 1, 1, 1, 1,
-0.7400581, 0.7716594, 0.3340408, 1, 1, 1, 1, 1,
-0.739981, 0.1634713, -2.03453, 1, 1, 1, 1, 1,
-0.7376291, 1.21072, -0.8020373, 1, 1, 1, 1, 1,
-0.7361993, -0.6307869, -2.736568, 1, 1, 1, 1, 1,
-0.7281588, 0.197991, -1.276582, 1, 1, 1, 1, 1,
-0.7266591, -0.5568494, -2.116131, 1, 1, 1, 1, 1,
-0.7199247, -1.27663, -3.340673, 1, 1, 1, 1, 1,
-0.7188907, 0.5657001, 0.3283547, 1, 1, 1, 1, 1,
-0.7119203, -1.704718, -0.7270696, 1, 1, 1, 1, 1,
-0.7110444, -0.735674, -2.290395, 1, 1, 1, 1, 1,
-0.7104765, -0.6510082, -2.642949, 1, 1, 1, 1, 1,
-0.7046109, -0.5660522, -1.654415, 1, 1, 1, 1, 1,
-0.7009493, 0.4748304, -0.1117767, 1, 1, 1, 1, 1,
-0.6990791, 0.8284264, -1.513194, 1, 1, 1, 1, 1,
-0.6902817, 0.641948, -1.626739, 0, 0, 1, 1, 1,
-0.6827207, 0.9606283, -0.8655364, 1, 0, 0, 1, 1,
-0.6799105, -1.149874, -3.157647, 1, 0, 0, 1, 1,
-0.6762123, 1.677969, -0.1662622, 1, 0, 0, 1, 1,
-0.675064, 1.167008, -1.433198, 1, 0, 0, 1, 1,
-0.6746367, 1.375485, -2.010127, 1, 0, 0, 1, 1,
-0.6743519, 0.1483585, 0.1064831, 0, 0, 0, 1, 1,
-0.6710504, 1.10466, 1.110601, 0, 0, 0, 1, 1,
-0.6699759, -0.1856051, -2.614317, 0, 0, 0, 1, 1,
-0.6594106, -0.7261905, -1.855683, 0, 0, 0, 1, 1,
-0.6581689, -1.875363, -2.455207, 0, 0, 0, 1, 1,
-0.6572612, -0.4754215, -2.643852, 0, 0, 0, 1, 1,
-0.6535416, 1.787559, 0.6183249, 0, 0, 0, 1, 1,
-0.6476896, 0.05170103, -1.288743, 1, 1, 1, 1, 1,
-0.6396734, 0.3309914, -1.540405, 1, 1, 1, 1, 1,
-0.6392727, 0.4520163, -1.2958, 1, 1, 1, 1, 1,
-0.6375377, -0.2950892, -2.765143, 1, 1, 1, 1, 1,
-0.6357431, 0.6710977, 0.3026937, 1, 1, 1, 1, 1,
-0.6335443, 0.5081378, -1.931422, 1, 1, 1, 1, 1,
-0.6294408, -1.95823, -3.879503, 1, 1, 1, 1, 1,
-0.6265464, 0.5796053, 0.2828807, 1, 1, 1, 1, 1,
-0.625094, -0.9516929, -2.33847, 1, 1, 1, 1, 1,
-0.625008, -0.3497738, -2.606582, 1, 1, 1, 1, 1,
-0.6247447, -1.049545, -1.663483, 1, 1, 1, 1, 1,
-0.6244815, -0.3468606, -2.115532, 1, 1, 1, 1, 1,
-0.6230729, 1.349374, -0.7547301, 1, 1, 1, 1, 1,
-0.6226946, 1.965369, -0.4206759, 1, 1, 1, 1, 1,
-0.6224617, 0.2440392, -2.556151, 1, 1, 1, 1, 1,
-0.6217849, 2.720062, -1.013268, 0, 0, 1, 1, 1,
-0.6202174, -1.510951, -1.819231, 1, 0, 0, 1, 1,
-0.6141916, 2.054941, -0.6964239, 1, 0, 0, 1, 1,
-0.6129087, -1.467481, -2.807326, 1, 0, 0, 1, 1,
-0.6127281, -0.3699477, -1.441135, 1, 0, 0, 1, 1,
-0.6109886, 1.564472, -0.4294313, 1, 0, 0, 1, 1,
-0.6088357, 0.01194301, -1.052283, 0, 0, 0, 1, 1,
-0.6013238, 0.08004184, 0.4606149, 0, 0, 0, 1, 1,
-0.6012065, 0.4932663, 0.6481059, 0, 0, 0, 1, 1,
-0.5956992, -1.119626, -2.78607, 0, 0, 0, 1, 1,
-0.5903078, -0.3854385, -2.296243, 0, 0, 0, 1, 1,
-0.5886567, 0.3083942, -1.668325, 0, 0, 0, 1, 1,
-0.5866822, -0.5251054, -2.488486, 0, 0, 0, 1, 1,
-0.5814159, 0.8167974, 0.3457274, 1, 1, 1, 1, 1,
-0.5774418, -1.323183, -4.187781, 1, 1, 1, 1, 1,
-0.5711873, 0.1181202, -4.458719, 1, 1, 1, 1, 1,
-0.5666716, -0.08577501, -2.511457, 1, 1, 1, 1, 1,
-0.5522345, 1.409279, -0.7296765, 1, 1, 1, 1, 1,
-0.5522081, 0.05795336, -2.09805, 1, 1, 1, 1, 1,
-0.5466375, -0.3301095, -2.372864, 1, 1, 1, 1, 1,
-0.5451815, 0.1846491, -1.960026, 1, 1, 1, 1, 1,
-0.5420356, 0.3942492, -1.676751, 1, 1, 1, 1, 1,
-0.5401085, 0.2947292, -0.278219, 1, 1, 1, 1, 1,
-0.5369075, -0.6608453, -0.4954607, 1, 1, 1, 1, 1,
-0.5317041, -0.5527423, -2.249479, 1, 1, 1, 1, 1,
-0.5268177, -0.933808, -1.199563, 1, 1, 1, 1, 1,
-0.5266877, -0.08659302, -3.033299, 1, 1, 1, 1, 1,
-0.5239482, -0.9328625, -2.107965, 1, 1, 1, 1, 1,
-0.5221657, 1.969895, -0.8871623, 0, 0, 1, 1, 1,
-0.5204009, -0.4922388, -2.219105, 1, 0, 0, 1, 1,
-0.5181414, -0.1329682, -0.07049626, 1, 0, 0, 1, 1,
-0.5171559, 1.09182, -0.4685066, 1, 0, 0, 1, 1,
-0.5133524, 1.798439, -0.5898878, 1, 0, 0, 1, 1,
-0.508271, 1.488056, -0.3731282, 1, 0, 0, 1, 1,
-0.50762, 1.677556, -1.075712, 0, 0, 0, 1, 1,
-0.5070702, -0.6210321, -1.672356, 0, 0, 0, 1, 1,
-0.5064049, -0.7366069, -0.8594989, 0, 0, 0, 1, 1,
-0.5050231, 1.830933, 1.467569, 0, 0, 0, 1, 1,
-0.5032675, -0.4779038, -2.325322, 0, 0, 0, 1, 1,
-0.5007054, 0.8731061, -1.060759, 0, 0, 0, 1, 1,
-0.5002769, 1.160724, -1.60089, 0, 0, 0, 1, 1,
-0.4950759, 0.4419038, -2.609462, 1, 1, 1, 1, 1,
-0.4934807, -1.115946, -2.973501, 1, 1, 1, 1, 1,
-0.4920393, 0.1359283, -1.748836, 1, 1, 1, 1, 1,
-0.4912906, -1.461033, -1.427477, 1, 1, 1, 1, 1,
-0.4898299, -0.02139854, -1.37704, 1, 1, 1, 1, 1,
-0.4846042, 0.93391, -1.76342, 1, 1, 1, 1, 1,
-0.4792447, 0.07651552, -2.348556, 1, 1, 1, 1, 1,
-0.4759849, -1.522025, -2.999707, 1, 1, 1, 1, 1,
-0.4742157, -1.886821, -2.359246, 1, 1, 1, 1, 1,
-0.473219, 0.5205792, -0.3597109, 1, 1, 1, 1, 1,
-0.468379, 0.4599651, -0.323249, 1, 1, 1, 1, 1,
-0.4532433, -1.605536, -3.703959, 1, 1, 1, 1, 1,
-0.4526734, 0.01883998, -2.248388, 1, 1, 1, 1, 1,
-0.4482781, 0.9338042, -1.970194, 1, 1, 1, 1, 1,
-0.447165, -1.134645, -2.157459, 1, 1, 1, 1, 1,
-0.4440398, -1.03858, -4.454807, 0, 0, 1, 1, 1,
-0.4417715, -1.352755, -4.742976, 1, 0, 0, 1, 1,
-0.4270663, -0.9117554, -2.707271, 1, 0, 0, 1, 1,
-0.4254974, -1.229959, -2.69506, 1, 0, 0, 1, 1,
-0.4236834, -1.426402, -3.884415, 1, 0, 0, 1, 1,
-0.4231434, 2.11358, -0.5124059, 1, 0, 0, 1, 1,
-0.4086203, -0.0601693, -2.790601, 0, 0, 0, 1, 1,
-0.405564, 0.2619807, -1.602529, 0, 0, 0, 1, 1,
-0.405366, 0.08550261, -0.1297499, 0, 0, 0, 1, 1,
-0.4040971, -0.6479039, -3.243499, 0, 0, 0, 1, 1,
-0.3996088, 0.7026077, 0.1059563, 0, 0, 0, 1, 1,
-0.3982925, 0.3557424, 0.6466566, 0, 0, 0, 1, 1,
-0.3978028, -0.7250733, -3.059631, 0, 0, 0, 1, 1,
-0.3929736, 1.134505, -0.4890943, 1, 1, 1, 1, 1,
-0.3880908, -0.5396147, -3.627668, 1, 1, 1, 1, 1,
-0.3805407, -0.1749002, -2.7413, 1, 1, 1, 1, 1,
-0.3772652, 1.274246, 0.3458116, 1, 1, 1, 1, 1,
-0.3771883, 0.5260065, -0.001623714, 1, 1, 1, 1, 1,
-0.3767796, -0.9980125, -2.955736, 1, 1, 1, 1, 1,
-0.3744582, -1.527739, -2.445662, 1, 1, 1, 1, 1,
-0.3724562, -1.072541, -1.201289, 1, 1, 1, 1, 1,
-0.371516, -0.9395896, -3.007287, 1, 1, 1, 1, 1,
-0.3662445, 0.7146403, 1.775008, 1, 1, 1, 1, 1,
-0.363148, 0.3603677, -1.809868, 1, 1, 1, 1, 1,
-0.3592186, -0.3698922, -1.362062, 1, 1, 1, 1, 1,
-0.3587423, -1.292011, -2.815728, 1, 1, 1, 1, 1,
-0.3528498, -0.9954497, -2.895599, 1, 1, 1, 1, 1,
-0.3520143, 1.735825, -0.5728716, 1, 1, 1, 1, 1,
-0.3518777, 0.1573778, -1.209384, 0, 0, 1, 1, 1,
-0.3514637, 0.6198092, 0.2730637, 1, 0, 0, 1, 1,
-0.3436841, 0.1153592, -3.272727, 1, 0, 0, 1, 1,
-0.341604, -0.5973627, -2.545966, 1, 0, 0, 1, 1,
-0.3389814, -0.3191884, -0.7891389, 1, 0, 0, 1, 1,
-0.3370567, -0.6098132, -1.477178, 1, 0, 0, 1, 1,
-0.3333433, -0.008637409, -2.704038, 0, 0, 0, 1, 1,
-0.3326383, -0.4555179, -1.839857, 0, 0, 0, 1, 1,
-0.3311196, 0.4004587, -0.9201667, 0, 0, 0, 1, 1,
-0.3298175, 0.09009203, -0.1889017, 0, 0, 0, 1, 1,
-0.3207565, -0.5767673, -2.026684, 0, 0, 0, 1, 1,
-0.3189897, -0.1474082, -4.23056, 0, 0, 0, 1, 1,
-0.3152462, 0.548723, 1.414127, 0, 0, 0, 1, 1,
-0.3149913, 1.507143, 0.4212814, 1, 1, 1, 1, 1,
-0.3117331, -1.571621, -3.471097, 1, 1, 1, 1, 1,
-0.3051582, 0.72671, 1.528235, 1, 1, 1, 1, 1,
-0.3008292, -0.5755445, -2.867989, 1, 1, 1, 1, 1,
-0.29542, 0.8461871, 0.3197262, 1, 1, 1, 1, 1,
-0.2949464, 0.4219193, -0.5094981, 1, 1, 1, 1, 1,
-0.2921531, 0.1553092, -1.200389, 1, 1, 1, 1, 1,
-0.2879737, -1.188032, -1.894432, 1, 1, 1, 1, 1,
-0.2847297, 0.2186424, -1.752106, 1, 1, 1, 1, 1,
-0.2842872, 1.076067, 0.3669285, 1, 1, 1, 1, 1,
-0.2827417, -0.9040567, -2.573749, 1, 1, 1, 1, 1,
-0.2685074, -1.025365, -4.413268, 1, 1, 1, 1, 1,
-0.2631625, 1.592323, -0.9595419, 1, 1, 1, 1, 1,
-0.2593152, -0.6778386, -2.208055, 1, 1, 1, 1, 1,
-0.2589963, 0.8436058, -0.3895663, 1, 1, 1, 1, 1,
-0.2511318, 1.367232, -0.2404281, 0, 0, 1, 1, 1,
-0.2488929, -0.7985766, -2.885263, 1, 0, 0, 1, 1,
-0.2424928, -0.2136951, -3.157773, 1, 0, 0, 1, 1,
-0.2416898, -1.071305, -2.351027, 1, 0, 0, 1, 1,
-0.2416867, 0.4340045, 0.9165523, 1, 0, 0, 1, 1,
-0.2395431, -0.7220445, -4.06727, 1, 0, 0, 1, 1,
-0.2394775, -1.838065, -3.05011, 0, 0, 0, 1, 1,
-0.2353885, -1.151691, -3.291723, 0, 0, 0, 1, 1,
-0.2344162, -1.554005, -1.640084, 0, 0, 0, 1, 1,
-0.2333617, 2.082428, -0.8984545, 0, 0, 0, 1, 1,
-0.2315887, -0.1366269, -4.574494, 0, 0, 0, 1, 1,
-0.2306453, -0.3719782, -1.695712, 0, 0, 0, 1, 1,
-0.2303219, 0.6642987, -1.147158, 0, 0, 0, 1, 1,
-0.2295516, 0.06390127, -1.204709, 1, 1, 1, 1, 1,
-0.2281492, -1.112888, -2.618889, 1, 1, 1, 1, 1,
-0.2247404, 1.433372, -0.7088712, 1, 1, 1, 1, 1,
-0.2184974, -0.02459009, -1.318156, 1, 1, 1, 1, 1,
-0.2181622, 0.5879793, 0.6840496, 1, 1, 1, 1, 1,
-0.2153021, 0.2184484, 0.5953555, 1, 1, 1, 1, 1,
-0.2139568, 0.4043903, -0.07857639, 1, 1, 1, 1, 1,
-0.212405, 0.2510372, 0.6237274, 1, 1, 1, 1, 1,
-0.2114116, 1.474515, 0.6070713, 1, 1, 1, 1, 1,
-0.2077779, -0.4445404, -1.544128, 1, 1, 1, 1, 1,
-0.2073124, 1.627631, -0.08844966, 1, 1, 1, 1, 1,
-0.204638, 1.270627, -0.7800334, 1, 1, 1, 1, 1,
-0.1997054, 0.7909443, 1.079235, 1, 1, 1, 1, 1,
-0.1994593, 1.158748, 0.5356317, 1, 1, 1, 1, 1,
-0.1961434, -0.491521, -2.506825, 1, 1, 1, 1, 1,
-0.1955187, -0.5012687, -3.750922, 0, 0, 1, 1, 1,
-0.1913035, -1.241535, -1.439293, 1, 0, 0, 1, 1,
-0.1911569, 0.3864111, -0.6935872, 1, 0, 0, 1, 1,
-0.1896914, -0.7681531, -1.949324, 1, 0, 0, 1, 1,
-0.1871829, 0.04768407, -0.4679573, 1, 0, 0, 1, 1,
-0.1855004, -0.9666693, -3.968059, 1, 0, 0, 1, 1,
-0.1832201, -1.061694, -2.553573, 0, 0, 0, 1, 1,
-0.1828119, 0.07387543, -1.560571, 0, 0, 0, 1, 1,
-0.1822029, 1.123115, 0.5147861, 0, 0, 0, 1, 1,
-0.1793669, -0.1929186, -2.722982, 0, 0, 0, 1, 1,
-0.1769284, -0.5433906, -2.869693, 0, 0, 0, 1, 1,
-0.1749208, -1.205612, -4.575619, 0, 0, 0, 1, 1,
-0.1715339, -0.3806582, -2.221853, 0, 0, 0, 1, 1,
-0.1709204, 1.328976, -1.057947, 1, 1, 1, 1, 1,
-0.1694355, -1.317744, -2.527512, 1, 1, 1, 1, 1,
-0.1654335, -0.2985085, -3.979072, 1, 1, 1, 1, 1,
-0.1616492, 1.099554, 0.4112144, 1, 1, 1, 1, 1,
-0.1601903, 1.223988, -0.6695083, 1, 1, 1, 1, 1,
-0.1578116, 0.5828868, 0.2928239, 1, 1, 1, 1, 1,
-0.1535958, 0.5819351, -1.080053, 1, 1, 1, 1, 1,
-0.1525675, -1.229079, -2.877885, 1, 1, 1, 1, 1,
-0.1516876, 1.249799, -2.221592, 1, 1, 1, 1, 1,
-0.1503244, 0.6973166, 1.982808, 1, 1, 1, 1, 1,
-0.1492491, -0.1888274, -3.676749, 1, 1, 1, 1, 1,
-0.1480922, -0.7700806, -2.085955, 1, 1, 1, 1, 1,
-0.1474502, -1.253561, -2.067826, 1, 1, 1, 1, 1,
-0.1386012, -0.993478, -3.877387, 1, 1, 1, 1, 1,
-0.1356906, 1.0376, -1.335597, 1, 1, 1, 1, 1,
-0.1326287, -0.6290923, -4.104168, 0, 0, 1, 1, 1,
-0.1268482, -0.3487442, -2.375314, 1, 0, 0, 1, 1,
-0.124301, 1.684077, -1.546717, 1, 0, 0, 1, 1,
-0.1240367, -2.2608, -4.245226, 1, 0, 0, 1, 1,
-0.1237741, 0.1145982, -1.251634, 1, 0, 0, 1, 1,
-0.1160326, -1.624968, -3.506984, 1, 0, 0, 1, 1,
-0.1137278, -0.3443243, -3.185679, 0, 0, 0, 1, 1,
-0.1121258, -0.5320892, -4.135406, 0, 0, 0, 1, 1,
-0.1112874, -0.08569379, -2.143006, 0, 0, 0, 1, 1,
-0.1101776, -1.033673, -5.880427, 0, 0, 0, 1, 1,
-0.1061579, -1.059437, -1.951573, 0, 0, 0, 1, 1,
-0.1055149, 1.581554, 1.084798, 0, 0, 0, 1, 1,
-0.09808329, -0.8950465, -3.21554, 0, 0, 0, 1, 1,
-0.09423655, 0.3523002, -1.945659, 1, 1, 1, 1, 1,
-0.08788775, 1.015114, 0.8669338, 1, 1, 1, 1, 1,
-0.08703402, 0.2782128, -0.9775003, 1, 1, 1, 1, 1,
-0.08212383, -0.4668952, -2.24759, 1, 1, 1, 1, 1,
-0.07907622, 0.9870855, -0.1485294, 1, 1, 1, 1, 1,
-0.07855698, 0.6653141, 0.09215692, 1, 1, 1, 1, 1,
-0.07780466, 1.926458, 1.249565, 1, 1, 1, 1, 1,
-0.07521395, 0.1317574, -1.151981, 1, 1, 1, 1, 1,
-0.07351396, 1.429851, -2.02023, 1, 1, 1, 1, 1,
-0.06774526, 1.40867, -1.051354, 1, 1, 1, 1, 1,
-0.06360792, -0.7216269, -3.66114, 1, 1, 1, 1, 1,
-0.061858, 1.709962, 0.6832991, 1, 1, 1, 1, 1,
-0.05622755, -0.7559496, -3.281169, 1, 1, 1, 1, 1,
-0.05590853, -1.533107, -1.416691, 1, 1, 1, 1, 1,
-0.05176417, 0.1241004, -1.585536, 1, 1, 1, 1, 1,
-0.05142301, 0.7581728, -0.5173336, 0, 0, 1, 1, 1,
-0.05099125, -0.5207373, -5.22234, 1, 0, 0, 1, 1,
-0.04942836, 0.6445454, -0.9232526, 1, 0, 0, 1, 1,
-0.04604822, -0.7076076, -4.592806, 1, 0, 0, 1, 1,
-0.04283073, -0.7415673, -2.946902, 1, 0, 0, 1, 1,
-0.04137556, -1.305721, -1.834291, 1, 0, 0, 1, 1,
-0.04038246, 0.817753, -0.7073389, 0, 0, 0, 1, 1,
-0.03696927, -0.005845421, -1.096181, 0, 0, 0, 1, 1,
-0.03680604, 1.224503, 0.7942047, 0, 0, 0, 1, 1,
-0.036488, -2.094257, -3.375329, 0, 0, 0, 1, 1,
-0.0261282, 1.227962, -0.6819853, 0, 0, 0, 1, 1,
-0.02397182, 0.7805575, 0.7669597, 0, 0, 0, 1, 1,
-0.0228594, 0.3281106, -0.2614787, 0, 0, 0, 1, 1,
-0.01675869, 0.821829, 0.2033723, 1, 1, 1, 1, 1,
-0.01491698, -0.1589559, -4.084189, 1, 1, 1, 1, 1,
-0.006699286, 0.8864538, 1.416976, 1, 1, 1, 1, 1,
-0.005869125, -0.4277278, -3.673092, 1, 1, 1, 1, 1,
-0.005395677, -0.2311765, -2.940649, 1, 1, 1, 1, 1,
-0.004389741, -1.884805, -2.906432, 1, 1, 1, 1, 1,
-0.001720861, 0.1668842, -0.327113, 1, 1, 1, 1, 1,
-7.593977e-05, -0.4791469, -3.202662, 1, 1, 1, 1, 1,
0.0002284924, 0.6069861, 0.2758638, 1, 1, 1, 1, 1,
0.003972275, -0.2026132, 3.681659, 1, 1, 1, 1, 1,
0.008139026, -0.789246, 2.174673, 1, 1, 1, 1, 1,
0.009380118, -0.609137, 2.17473, 1, 1, 1, 1, 1,
0.01710148, -0.06324492, 2.542717, 1, 1, 1, 1, 1,
0.01876383, -1.008877, 3.202914, 1, 1, 1, 1, 1,
0.02062557, -1.049515, 3.248791, 1, 1, 1, 1, 1,
0.02273278, -0.2977531, 1.162478, 0, 0, 1, 1, 1,
0.02457234, -1.203597, 2.664188, 1, 0, 0, 1, 1,
0.02499172, 0.4454032, 0.3608685, 1, 0, 0, 1, 1,
0.02889249, -0.2669368, 1.993258, 1, 0, 0, 1, 1,
0.03415794, -0.2830088, 1.434653, 1, 0, 0, 1, 1,
0.03443015, 0.3833612, 1.386603, 1, 0, 0, 1, 1,
0.04110299, 0.8031111, -0.5746867, 0, 0, 0, 1, 1,
0.04182351, 0.8751147, -0.5645983, 0, 0, 0, 1, 1,
0.04941751, -0.3045643, 1.56298, 0, 0, 0, 1, 1,
0.04989981, 0.7774798, 0.8187624, 0, 0, 0, 1, 1,
0.05813651, -0.2394986, 1.842338, 0, 0, 0, 1, 1,
0.06110661, -1.043314, 4.020367, 0, 0, 0, 1, 1,
0.06404545, -0.9336842, 3.394296, 0, 0, 0, 1, 1,
0.0644197, 0.2350672, -1.092151, 1, 1, 1, 1, 1,
0.06609385, 0.3841397, -0.3046003, 1, 1, 1, 1, 1,
0.06833433, -0.3891676, 3.552921, 1, 1, 1, 1, 1,
0.07166097, -1.744689, 4.122364, 1, 1, 1, 1, 1,
0.0769166, -1.648124, 2.599245, 1, 1, 1, 1, 1,
0.07919581, 1.031825, -0.4045872, 1, 1, 1, 1, 1,
0.08109626, 1.158329, -1.027594, 1, 1, 1, 1, 1,
0.08649106, -0.3961068, 3.291531, 1, 1, 1, 1, 1,
0.09035948, 0.6940076, 0.8570727, 1, 1, 1, 1, 1,
0.09162655, -1.933761, 4.980466, 1, 1, 1, 1, 1,
0.09274922, 0.2226039, 1.244369, 1, 1, 1, 1, 1,
0.09531614, -0.1377281, 1.749055, 1, 1, 1, 1, 1,
0.09825091, -1.109688, 3.190774, 1, 1, 1, 1, 1,
0.101244, -1.159662, 3.693997, 1, 1, 1, 1, 1,
0.1044815, -0.1220266, 3.03421, 1, 1, 1, 1, 1,
0.113333, -0.7075843, 2.945145, 0, 0, 1, 1, 1,
0.1157429, -0.4339355, 2.138299, 1, 0, 0, 1, 1,
0.1158696, 0.4479873, 0.3153216, 1, 0, 0, 1, 1,
0.1203094, -0.3893536, 2.178197, 1, 0, 0, 1, 1,
0.1213411, 0.748442, 2.166625, 1, 0, 0, 1, 1,
0.121718, 1.053928, -0.0009009508, 1, 0, 0, 1, 1,
0.1220686, -1.365569, 1.990647, 0, 0, 0, 1, 1,
0.1222534, 0.3167468, 0.7587343, 0, 0, 0, 1, 1,
0.125536, 0.3250796, 1.115043, 0, 0, 0, 1, 1,
0.1275439, 0.4445651, -0.6518652, 0, 0, 0, 1, 1,
0.1299556, -0.6982104, 3.138754, 0, 0, 0, 1, 1,
0.1308913, -1.506388, 3.411041, 0, 0, 0, 1, 1,
0.131138, -0.5820606, 4.061137, 0, 0, 0, 1, 1,
0.1416357, 0.3257399, 0.9391184, 1, 1, 1, 1, 1,
0.1435528, 0.7212424, -0.109978, 1, 1, 1, 1, 1,
0.1440121, -0.1124933, 2.260453, 1, 1, 1, 1, 1,
0.1473468, 0.879426, -0.2256407, 1, 1, 1, 1, 1,
0.1488365, -0.6490834, 3.767123, 1, 1, 1, 1, 1,
0.1539999, -0.8240316, 2.691111, 1, 1, 1, 1, 1,
0.1551198, -1.362814, 2.190982, 1, 1, 1, 1, 1,
0.1568938, 0.307454, -0.4588128, 1, 1, 1, 1, 1,
0.1621613, -0.8245386, 3.551378, 1, 1, 1, 1, 1,
0.1649727, 0.792737, -1.83183, 1, 1, 1, 1, 1,
0.1708961, -1.306491, 3.470083, 1, 1, 1, 1, 1,
0.1725556, -0.8845531, 2.343309, 1, 1, 1, 1, 1,
0.1727257, 0.1218921, 1.037057, 1, 1, 1, 1, 1,
0.1793549, -0.3783758, 4.2672, 1, 1, 1, 1, 1,
0.1821736, -0.08072916, 2.97539, 1, 1, 1, 1, 1,
0.1829179, -0.2587887, 3.614119, 0, 0, 1, 1, 1,
0.1831837, -0.8704914, 3.10061, 1, 0, 0, 1, 1,
0.1847367, -1.737247, 3.036013, 1, 0, 0, 1, 1,
0.1863617, -1.450827, 2.49068, 1, 0, 0, 1, 1,
0.1883161, 0.3906249, 0.7616666, 1, 0, 0, 1, 1,
0.1884104, 0.1885369, 1.060296, 1, 0, 0, 1, 1,
0.1885633, 0.6866777, 0.7180999, 0, 0, 0, 1, 1,
0.1890785, -0.9799703, 2.89767, 0, 0, 0, 1, 1,
0.1905984, 0.01592657, -0.2069814, 0, 0, 0, 1, 1,
0.1912076, -0.6515699, 2.573794, 0, 0, 0, 1, 1,
0.1918451, -1.261068, 1.804255, 0, 0, 0, 1, 1,
0.1989991, -0.9093968, 1.762832, 0, 0, 0, 1, 1,
0.200099, 2.131543, 0.7966556, 0, 0, 0, 1, 1,
0.2023408, 0.5057328, -0.02914295, 1, 1, 1, 1, 1,
0.2029164, -0.7374207, 2.291936, 1, 1, 1, 1, 1,
0.2164397, 0.670307, 0.6713321, 1, 1, 1, 1, 1,
0.217163, -1.29586, 2.665913, 1, 1, 1, 1, 1,
0.2197887, -0.04728064, 2.907273, 1, 1, 1, 1, 1,
0.2219473, -0.03819206, 0.8250532, 1, 1, 1, 1, 1,
0.2282429, 0.3813249, -0.3777247, 1, 1, 1, 1, 1,
0.2300879, 1.685272, 1.574644, 1, 1, 1, 1, 1,
0.2319055, 1.792938, -1.410108, 1, 1, 1, 1, 1,
0.2320117, 0.04071726, -0.9839478, 1, 1, 1, 1, 1,
0.2334685, -0.120152, 1.559129, 1, 1, 1, 1, 1,
0.233819, 0.01429152, 0.8211424, 1, 1, 1, 1, 1,
0.2342578, -0.3648921, 2.884551, 1, 1, 1, 1, 1,
0.2344433, -1.602947, 1.631952, 1, 1, 1, 1, 1,
0.2374169, 0.006869854, 3.116931, 1, 1, 1, 1, 1,
0.2415036, 1.162192, -0.3714941, 0, 0, 1, 1, 1,
0.2425998, -0.4570862, 1.809937, 1, 0, 0, 1, 1,
0.2467135, 2.014542, -0.04304893, 1, 0, 0, 1, 1,
0.2501603, 0.2225396, -0.542374, 1, 0, 0, 1, 1,
0.251806, -0.2889239, 2.831954, 1, 0, 0, 1, 1,
0.2546376, -1.1622, 1.398113, 1, 0, 0, 1, 1,
0.2557682, -0.3656615, 2.766854, 0, 0, 0, 1, 1,
0.2583585, -0.259324, 0.5820915, 0, 0, 0, 1, 1,
0.2603085, -0.213733, 4.173016, 0, 0, 0, 1, 1,
0.2649148, 1.326979, 2.565557, 0, 0, 0, 1, 1,
0.2727797, 0.6923662, 0.1025597, 0, 0, 0, 1, 1,
0.2743225, -1.574527, 3.285213, 0, 0, 0, 1, 1,
0.2770323, 0.2877161, 2.161679, 0, 0, 0, 1, 1,
0.2784869, -1.692242, 3.581982, 1, 1, 1, 1, 1,
0.2821298, 1.04941, 0.7814352, 1, 1, 1, 1, 1,
0.2883994, -1.847498, 3.376894, 1, 1, 1, 1, 1,
0.2938817, 0.8370199, -0.8296552, 1, 1, 1, 1, 1,
0.2948515, 0.8694655, 0.3659972, 1, 1, 1, 1, 1,
0.2950903, -0.8147255, 1.960961, 1, 1, 1, 1, 1,
0.2953809, 0.4492562, 1.304047, 1, 1, 1, 1, 1,
0.2961812, -0.2752744, 2.878876, 1, 1, 1, 1, 1,
0.2962351, -0.3599346, 2.867604, 1, 1, 1, 1, 1,
0.297173, 0.3418099, 0.1299995, 1, 1, 1, 1, 1,
0.3003619, -2.141073, 2.466493, 1, 1, 1, 1, 1,
0.3017356, -1.962101, 3.116732, 1, 1, 1, 1, 1,
0.3019032, 1.516052, -0.3805852, 1, 1, 1, 1, 1,
0.3035096, 0.7200358, 0.4262101, 1, 1, 1, 1, 1,
0.3069403, -0.6814802, 4.179619, 1, 1, 1, 1, 1,
0.3081538, 0.2430378, 2.647969, 0, 0, 1, 1, 1,
0.3113104, -1.249318, 1.995648, 1, 0, 0, 1, 1,
0.3119219, -0.385861, 2.895517, 1, 0, 0, 1, 1,
0.3142199, 0.3549866, 0.5206894, 1, 0, 0, 1, 1,
0.3153106, 0.4067677, -0.1118311, 1, 0, 0, 1, 1,
0.3180028, -1.239825, 3.249321, 1, 0, 0, 1, 1,
0.3180999, -0.2634052, 2.415553, 0, 0, 0, 1, 1,
0.3201067, 0.5264384, 0.195062, 0, 0, 0, 1, 1,
0.3248519, 1.256004, -0.7906172, 0, 0, 0, 1, 1,
0.3289056, 1.267727, 1.072459, 0, 0, 0, 1, 1,
0.3294576, 0.6549056, -1.132385, 0, 0, 0, 1, 1,
0.3294941, 0.2436295, 1.567947, 0, 0, 0, 1, 1,
0.3309232, 0.6190015, 0.8908595, 0, 0, 0, 1, 1,
0.3344007, -0.3051047, 2.409532, 1, 1, 1, 1, 1,
0.334471, -1.061503, 4.652629, 1, 1, 1, 1, 1,
0.3355489, -2.376115, 3.344538, 1, 1, 1, 1, 1,
0.33666, 1.163323, -0.3134337, 1, 1, 1, 1, 1,
0.3367601, -0.6954765, 3.134373, 1, 1, 1, 1, 1,
0.3369513, 1.484187, 2.737481, 1, 1, 1, 1, 1,
0.3415296, 0.08237902, 1.51656, 1, 1, 1, 1, 1,
0.3456999, -0.2088875, 1.336447, 1, 1, 1, 1, 1,
0.347707, -0.5135904, 2.41755, 1, 1, 1, 1, 1,
0.3480436, 1.100454, -0.8861389, 1, 1, 1, 1, 1,
0.3481556, -1.276866, 1.745294, 1, 1, 1, 1, 1,
0.3549659, 0.6605462, -0.3468504, 1, 1, 1, 1, 1,
0.3560344, -0.2442394, 1.923299, 1, 1, 1, 1, 1,
0.356534, 1.085235, -1.55201, 1, 1, 1, 1, 1,
0.3580076, 1.295822, 2.320363, 1, 1, 1, 1, 1,
0.36696, 0.2432411, 1.003348, 0, 0, 1, 1, 1,
0.3726813, 0.3725772, 0.9286297, 1, 0, 0, 1, 1,
0.3728353, 1.549745, 0.3797562, 1, 0, 0, 1, 1,
0.3739068, -0.02148794, 1.717332, 1, 0, 0, 1, 1,
0.3763188, 1.243493, -0.2235172, 1, 0, 0, 1, 1,
0.377498, 0.2886044, 0.06524011, 1, 0, 0, 1, 1,
0.3816606, 1.085391, 1.744288, 0, 0, 0, 1, 1,
0.3828075, 1.290984, -0.5003824, 0, 0, 0, 1, 1,
0.3837854, 0.4221477, -0.03614155, 0, 0, 0, 1, 1,
0.3847975, -0.1241672, 2.403128, 0, 0, 0, 1, 1,
0.3872995, -0.8676829, 1.841289, 0, 0, 0, 1, 1,
0.3885505, -1.333582, 3.563028, 0, 0, 0, 1, 1,
0.3922503, -0.75441, 3.173457, 0, 0, 0, 1, 1,
0.3950377, 1.557366, -0.4686691, 1, 1, 1, 1, 1,
0.3955661, 1.070763, -0.703477, 1, 1, 1, 1, 1,
0.3965675, 0.3078369, 1.893919, 1, 1, 1, 1, 1,
0.3965755, -0.6362056, 2.138012, 1, 1, 1, 1, 1,
0.3987419, -1.593426, 3.706916, 1, 1, 1, 1, 1,
0.4048801, 0.2268117, 1.049339, 1, 1, 1, 1, 1,
0.4074723, 1.576126, 0.262605, 1, 1, 1, 1, 1,
0.4116467, 1.223649, 1.562514, 1, 1, 1, 1, 1,
0.4159717, 0.4236898, -1.100398, 1, 1, 1, 1, 1,
0.4164894, -1.506485, 1.234269, 1, 1, 1, 1, 1,
0.4169627, -1.167826, 4.750005, 1, 1, 1, 1, 1,
0.424038, 0.009088372, 1.797577, 1, 1, 1, 1, 1,
0.4257042, -2.449745, 3.454446, 1, 1, 1, 1, 1,
0.4332089, -0.7859128, 1.06669, 1, 1, 1, 1, 1,
0.4347874, 0.2321744, 0.1352884, 1, 1, 1, 1, 1,
0.4383028, 0.08474455, 3.210917, 0, 0, 1, 1, 1,
0.4425075, 0.1004111, 1.227181, 1, 0, 0, 1, 1,
0.4448942, -0.9071571, 2.866009, 1, 0, 0, 1, 1,
0.4478646, -1.477493, 2.527866, 1, 0, 0, 1, 1,
0.4493272, -0.6360073, 1.813605, 1, 0, 0, 1, 1,
0.4526567, -0.008690499, 2.042469, 1, 0, 0, 1, 1,
0.4620458, -0.638088, 0.1925342, 0, 0, 0, 1, 1,
0.4658422, -1.13175, 3.823766, 0, 0, 0, 1, 1,
0.4718439, -0.3123686, 1.224372, 0, 0, 0, 1, 1,
0.4751221, 0.4411883, 1.099302, 0, 0, 0, 1, 1,
0.4804823, -0.2419222, 3.883155, 0, 0, 0, 1, 1,
0.4811886, 1.571426, -0.8956869, 0, 0, 0, 1, 1,
0.4856102, -0.5117034, 1.931773, 0, 0, 0, 1, 1,
0.4863709, -0.1294989, 2.653309, 1, 1, 1, 1, 1,
0.4875604, 0.8826788, 1.154154, 1, 1, 1, 1, 1,
0.4878955, -0.4268273, 4.863234, 1, 1, 1, 1, 1,
0.4891146, 0.1440846, 0.6636798, 1, 1, 1, 1, 1,
0.4903751, 0.2354655, 2.139907, 1, 1, 1, 1, 1,
0.4909433, 0.1634814, 2.690765, 1, 1, 1, 1, 1,
0.4934757, 1.065379, 1.327973, 1, 1, 1, 1, 1,
0.4953335, 0.7515492, 2.606433, 1, 1, 1, 1, 1,
0.4979923, -0.1501028, 3.62534, 1, 1, 1, 1, 1,
0.4984056, -0.2200636, 0.8948109, 1, 1, 1, 1, 1,
0.5003702, -0.255705, 3.354946, 1, 1, 1, 1, 1,
0.5050694, -0.2733101, 3.27059, 1, 1, 1, 1, 1,
0.5147644, -0.09655651, 0.2692183, 1, 1, 1, 1, 1,
0.5156885, -0.4917574, 3.614436, 1, 1, 1, 1, 1,
0.5174559, -0.5711873, 2.837136, 1, 1, 1, 1, 1,
0.5181996, 1.400197, 0.7225182, 0, 0, 1, 1, 1,
0.5200391, -0.347244, 2.323339, 1, 0, 0, 1, 1,
0.5202495, 1.243227, 2.129317, 1, 0, 0, 1, 1,
0.5221364, 0.6210808, -0.4940717, 1, 0, 0, 1, 1,
0.5231994, -0.6451293, 3.07023, 1, 0, 0, 1, 1,
0.5238063, 0.2076216, 1.727597, 1, 0, 0, 1, 1,
0.524186, 0.6520146, -0.1057619, 0, 0, 0, 1, 1,
0.5254423, 0.8180161, 2.974973, 0, 0, 0, 1, 1,
0.5275746, -0.4621603, 1.865276, 0, 0, 0, 1, 1,
0.5318929, 0.3752472, 1.196574, 0, 0, 0, 1, 1,
0.5372988, 1.279117, -0.04357103, 0, 0, 0, 1, 1,
0.5379452, 0.9391256, 1.207332, 0, 0, 0, 1, 1,
0.5437156, 0.2455163, 0.0904425, 0, 0, 0, 1, 1,
0.5449784, 0.8211465, 1.988595, 1, 1, 1, 1, 1,
0.5457268, 1.172135, 0.79735, 1, 1, 1, 1, 1,
0.5490497, -0.8162421, 1.859622, 1, 1, 1, 1, 1,
0.5496876, 1.04951, 1.268754, 1, 1, 1, 1, 1,
0.5535755, 0.06788436, 1.182344, 1, 1, 1, 1, 1,
0.5572165, 0.0543419, 0.4145805, 1, 1, 1, 1, 1,
0.5641113, 1.248704, -0.3312318, 1, 1, 1, 1, 1,
0.5641519, 0.6267373, -0.6324949, 1, 1, 1, 1, 1,
0.565078, -0.1910651, 3.080113, 1, 1, 1, 1, 1,
0.5675376, -0.7630901, 2.136638, 1, 1, 1, 1, 1,
0.5688356, -0.6720702, 2.078273, 1, 1, 1, 1, 1,
0.5710958, -0.250392, 2.436747, 1, 1, 1, 1, 1,
0.5771563, -0.6207873, 2.91627, 1, 1, 1, 1, 1,
0.58368, 0.02210667, 0.9600891, 1, 1, 1, 1, 1,
0.590947, -0.6795914, 0.5687502, 1, 1, 1, 1, 1,
0.5910695, 0.6196268, -0.4419619, 0, 0, 1, 1, 1,
0.5946459, -0.8126922, 1.907848, 1, 0, 0, 1, 1,
0.6020154, 0.4223987, 1.102086, 1, 0, 0, 1, 1,
0.6058732, -2.39957, 3.508545, 1, 0, 0, 1, 1,
0.6130751, 0.809889, 0.08828563, 1, 0, 0, 1, 1,
0.6172283, 0.9492414, 0.9138355, 1, 0, 0, 1, 1,
0.6192231, -1.614282, 3.054949, 0, 0, 0, 1, 1,
0.6192467, 1.448252, -0.2723073, 0, 0, 0, 1, 1,
0.6197837, 0.2348151, -0.06357559, 0, 0, 0, 1, 1,
0.6202452, 0.6741065, 0.5394444, 0, 0, 0, 1, 1,
0.6221178, -1.998706, 2.127206, 0, 0, 0, 1, 1,
0.6223572, 0.2493885, 1.740823, 0, 0, 0, 1, 1,
0.6245759, 0.524111, 0.1357569, 0, 0, 0, 1, 1,
0.6288055, 1.644028, 0.2406821, 1, 1, 1, 1, 1,
0.629679, 0.3726626, 3.234375, 1, 1, 1, 1, 1,
0.6359004, 0.4120189, 0.9910435, 1, 1, 1, 1, 1,
0.6378411, -0.4833394, 3.194176, 1, 1, 1, 1, 1,
0.6469522, -0.860259, 1.729656, 1, 1, 1, 1, 1,
0.6564495, 0.8841742, 1.731128, 1, 1, 1, 1, 1,
0.6597228, 0.02726339, 0.5908699, 1, 1, 1, 1, 1,
0.6664538, 1.241546, 0.2516095, 1, 1, 1, 1, 1,
0.6738452, 0.08079761, 2.131337, 1, 1, 1, 1, 1,
0.6747308, -0.7754242, 2.541883, 1, 1, 1, 1, 1,
0.6767559, -0.1761555, 1.894808, 1, 1, 1, 1, 1,
0.6809216, -0.2686743, 2.865388, 1, 1, 1, 1, 1,
0.6819369, 0.1864099, 1.72754, 1, 1, 1, 1, 1,
0.6840673, -0.3868788, 3.304978, 1, 1, 1, 1, 1,
0.6862449, 0.1515295, -1.313332, 1, 1, 1, 1, 1,
0.6863389, 1.612235, 1.744951, 0, 0, 1, 1, 1,
0.686923, 1.546678, -0.2290023, 1, 0, 0, 1, 1,
0.6911731, 1.159325, 0.9193423, 1, 0, 0, 1, 1,
0.6914012, 0.5638388, 3.67742, 1, 0, 0, 1, 1,
0.6921948, -0.3219744, 0.8872022, 1, 0, 0, 1, 1,
0.6992975, -0.2470237, 2.664887, 1, 0, 0, 1, 1,
0.7006101, 1.071798, 1.413196, 0, 0, 0, 1, 1,
0.7055333, 0.6595555, 0.4367614, 0, 0, 0, 1, 1,
0.7088065, 1.100125, 1.287295, 0, 0, 0, 1, 1,
0.7121966, -1.028476, 3.546774, 0, 0, 0, 1, 1,
0.7146303, -0.1514397, 1.827118, 0, 0, 0, 1, 1,
0.7252893, 2.283038, -0.1837477, 0, 0, 0, 1, 1,
0.7253242, -2.503489, 2.25146, 0, 0, 0, 1, 1,
0.7301137, -0.6847461, 2.459833, 1, 1, 1, 1, 1,
0.7323751, -0.09421737, 1.40527, 1, 1, 1, 1, 1,
0.7354648, 0.9957355, 0.4360822, 1, 1, 1, 1, 1,
0.7377315, -0.4358833, 2.717177, 1, 1, 1, 1, 1,
0.7378318, -0.7275497, 2.94428, 1, 1, 1, 1, 1,
0.7389047, 0.4100936, 0.4612646, 1, 1, 1, 1, 1,
0.7458029, 2.027814, -0.240929, 1, 1, 1, 1, 1,
0.7525278, 0.2206686, 1.27321, 1, 1, 1, 1, 1,
0.7561375, -0.4156915, 3.650509, 1, 1, 1, 1, 1,
0.7564496, 1.000584, 3.266127, 1, 1, 1, 1, 1,
0.7566953, 0.1598113, -0.2698677, 1, 1, 1, 1, 1,
0.7570372, 0.2516198, 3.202683, 1, 1, 1, 1, 1,
0.7595845, -0.6249116, 2.808845, 1, 1, 1, 1, 1,
0.7688636, 1.084561, 0.6637241, 1, 1, 1, 1, 1,
0.7744557, 0.2361348, 1.434785, 1, 1, 1, 1, 1,
0.7770299, 0.5592709, 0.5186569, 0, 0, 1, 1, 1,
0.7815874, 0.243937, 1.65395, 1, 0, 0, 1, 1,
0.7838991, -0.4805956, 1.728394, 1, 0, 0, 1, 1,
0.7848907, -2.916945, 4.125179, 1, 0, 0, 1, 1,
0.7880751, 1.32648, 0.618793, 1, 0, 0, 1, 1,
0.797107, 0.7132586, 0.671016, 1, 0, 0, 1, 1,
0.8005071, 0.7223505, 0.8547887, 0, 0, 0, 1, 1,
0.8016518, 0.5385533, 2.061139, 0, 0, 0, 1, 1,
0.8037341, 0.8054836, 1.492682, 0, 0, 0, 1, 1,
0.8079905, 0.4500745, 0.2507164, 0, 0, 0, 1, 1,
0.8102888, 1.557608, 1.353426, 0, 0, 0, 1, 1,
0.8123708, -0.2561699, 3.869617, 0, 0, 0, 1, 1,
0.8135068, 1.566988, -0.5721591, 0, 0, 0, 1, 1,
0.8172423, -0.7367058, 1.765643, 1, 1, 1, 1, 1,
0.8211631, -1.431448, 3.179224, 1, 1, 1, 1, 1,
0.8229585, 0.8405079, -0.04222016, 1, 1, 1, 1, 1,
0.8239282, 0.4136931, 0.03003363, 1, 1, 1, 1, 1,
0.8246164, -0.4661987, 0.255816, 1, 1, 1, 1, 1,
0.8272588, 0.653184, 0.7086282, 1, 1, 1, 1, 1,
0.8288614, 0.9659498, 2.46054, 1, 1, 1, 1, 1,
0.8307303, -1.71265, 2.166106, 1, 1, 1, 1, 1,
0.8314162, -0.2059656, 0.2937848, 1, 1, 1, 1, 1,
0.8325329, -0.6555364, 2.775047, 1, 1, 1, 1, 1,
0.8347397, -0.5294144, 0.6515241, 1, 1, 1, 1, 1,
0.8358217, -0.2001699, 0.9173237, 1, 1, 1, 1, 1,
0.8398688, 0.9217761, 0.1572302, 1, 1, 1, 1, 1,
0.8419434, 0.8604617, -0.07334515, 1, 1, 1, 1, 1,
0.8608459, 1.0914, 1.481654, 1, 1, 1, 1, 1,
0.8673927, 1.058591, -0.01306297, 0, 0, 1, 1, 1,
0.8684217, -0.7021503, 2.178854, 1, 0, 0, 1, 1,
0.8734457, -0.8399845, 1.541568, 1, 0, 0, 1, 1,
0.8750897, -1.253791, 1.393242, 1, 0, 0, 1, 1,
0.8863399, 1.345648, -0.348632, 1, 0, 0, 1, 1,
0.8942683, -0.8552467, 1.176562, 1, 0, 0, 1, 1,
0.8950897, -0.5435345, 2.661905, 0, 0, 0, 1, 1,
0.8950916, -0.9629827, 1.986583, 0, 0, 0, 1, 1,
0.8961498, 0.9974156, -0.7144794, 0, 0, 0, 1, 1,
0.8979583, 0.1840073, 0.1533822, 0, 0, 0, 1, 1,
0.8993948, -2.375371, 2.098329, 0, 0, 0, 1, 1,
0.9023526, -0.2532166, 2.597204, 0, 0, 0, 1, 1,
0.9146656, 0.7103522, 0.8292263, 0, 0, 0, 1, 1,
0.9167805, 0.6698241, 2.058352, 1, 1, 1, 1, 1,
0.9235148, -0.09186367, 2.645505, 1, 1, 1, 1, 1,
0.9251719, 1.519182, 2.204156, 1, 1, 1, 1, 1,
0.933636, -0.4636449, 2.090336, 1, 1, 1, 1, 1,
0.9390512, -0.7464831, 1.66584, 1, 1, 1, 1, 1,
0.941391, 0.8832939, 1.252365, 1, 1, 1, 1, 1,
0.9497336, 0.05307848, 2.085675, 1, 1, 1, 1, 1,
0.9523849, -0.1365811, -0.2035651, 1, 1, 1, 1, 1,
0.9581787, 1.093576, 2.335346, 1, 1, 1, 1, 1,
0.958868, -0.8123705, 0.858431, 1, 1, 1, 1, 1,
0.9668166, -0.5573274, 3.693296, 1, 1, 1, 1, 1,
0.9681827, -0.2407936, 1.142974, 1, 1, 1, 1, 1,
0.980015, -0.3938777, 2.804849, 1, 1, 1, 1, 1,
0.9862717, 0.1052753, 0.6645457, 1, 1, 1, 1, 1,
0.9863932, -1.12219, 2.481047, 1, 1, 1, 1, 1,
0.9926975, -0.502174, 1.229053, 0, 0, 1, 1, 1,
0.9964831, -0.03067198, 2.338213, 1, 0, 0, 1, 1,
0.9976988, -0.7391484, 1.736879, 1, 0, 0, 1, 1,
1.006153, -1.567341, 3.382791, 1, 0, 0, 1, 1,
1.009583, -2.101102, 4.776562, 1, 0, 0, 1, 1,
1.010134, 1.271975, 0.2106947, 1, 0, 0, 1, 1,
1.023518, -1.190834, 1.903748, 0, 0, 0, 1, 1,
1.024678, 0.07734356, 1.957631, 0, 0, 0, 1, 1,
1.026546, -0.1330971, 1.752054, 0, 0, 0, 1, 1,
1.030138, -1.825015, 3.272115, 0, 0, 0, 1, 1,
1.035089, 1.300573, -0.9099689, 0, 0, 0, 1, 1,
1.037284, -0.4299, 4.704069, 0, 0, 0, 1, 1,
1.038636, 0.9349208, 1.631387, 0, 0, 0, 1, 1,
1.039341, -0.2110435, 2.14063, 1, 1, 1, 1, 1,
1.04127, 0.2281791, 0.4093325, 1, 1, 1, 1, 1,
1.054362, 0.1860321, 2.806967, 1, 1, 1, 1, 1,
1.054372, -0.4040601, 1.140697, 1, 1, 1, 1, 1,
1.059243, -0.2589443, 1.98713, 1, 1, 1, 1, 1,
1.060886, -0.2598211, 0.3820648, 1, 1, 1, 1, 1,
1.065452, 0.04281981, 2.148148, 1, 1, 1, 1, 1,
1.071751, -0.8119892, 1.806896, 1, 1, 1, 1, 1,
1.077471, -1.961323, 2.681265, 1, 1, 1, 1, 1,
1.077856, 0.129024, 2.441122, 1, 1, 1, 1, 1,
1.093745, 0.7035493, 0.7505926, 1, 1, 1, 1, 1,
1.093887, 0.04987525, 1.304528, 1, 1, 1, 1, 1,
1.095447, 0.2602038, 0.8752897, 1, 1, 1, 1, 1,
1.096202, -1.48132, 3.997145, 1, 1, 1, 1, 1,
1.101579, 1.347362, 1.970396, 1, 1, 1, 1, 1,
1.106631, -0.2230569, 1.71306, 0, 0, 1, 1, 1,
1.111652, -1.437859, 2.482683, 1, 0, 0, 1, 1,
1.111746, 0.5145794, -0.431382, 1, 0, 0, 1, 1,
1.112664, -1.251336, 2.155894, 1, 0, 0, 1, 1,
1.114936, 2.142841, 0.9947437, 1, 0, 0, 1, 1,
1.121551, 0.05418441, 0.7866926, 1, 0, 0, 1, 1,
1.122727, 0.5759127, 0.5859079, 0, 0, 0, 1, 1,
1.122858, -1.955794, 4.408635, 0, 0, 0, 1, 1,
1.133858, 0.5768319, 1.773259, 0, 0, 0, 1, 1,
1.135421, 2.134997, 1.361804, 0, 0, 0, 1, 1,
1.136189, 0.5354032, 1.642558, 0, 0, 0, 1, 1,
1.137364, -0.7676827, 0.6739742, 0, 0, 0, 1, 1,
1.142028, -0.3253859, 2.942255, 0, 0, 0, 1, 1,
1.142563, 0.4641739, 2.551, 1, 1, 1, 1, 1,
1.146528, 0.2346604, 0.2284488, 1, 1, 1, 1, 1,
1.150383, 1.259208, -0.1686958, 1, 1, 1, 1, 1,
1.151484, -0.9807912, 1.875792, 1, 1, 1, 1, 1,
1.152436, -2.094067, 3.343995, 1, 1, 1, 1, 1,
1.156425, 1.476271, 0.4254377, 1, 1, 1, 1, 1,
1.163596, 0.020629, 0.8183028, 1, 1, 1, 1, 1,
1.163827, -1.82479, 2.353235, 1, 1, 1, 1, 1,
1.170665, 2.02121, 1.323256, 1, 1, 1, 1, 1,
1.18434, -0.1449373, 2.627877, 1, 1, 1, 1, 1,
1.19533, 0.07726043, 3.185283, 1, 1, 1, 1, 1,
1.195451, 0.3970081, 1.223064, 1, 1, 1, 1, 1,
1.19805, -0.1719742, 0.6194646, 1, 1, 1, 1, 1,
1.201287, 0.8507677, 1.595908, 1, 1, 1, 1, 1,
1.206404, 0.1929786, 1.302408, 1, 1, 1, 1, 1,
1.208879, 1.498944, 0.207077, 0, 0, 1, 1, 1,
1.211095, 0.2443766, 0.5621177, 1, 0, 0, 1, 1,
1.216005, -0.5230575, 3.034372, 1, 0, 0, 1, 1,
1.216301, -0.2155951, 2.955187, 1, 0, 0, 1, 1,
1.220847, 0.2603076, 1.483546, 1, 0, 0, 1, 1,
1.221756, -1.575861, 2.778546, 1, 0, 0, 1, 1,
1.222493, -1.027081, 0.3044547, 0, 0, 0, 1, 1,
1.225163, 0.2908557, 2.463507, 0, 0, 0, 1, 1,
1.229008, 1.150939, 0.9779512, 0, 0, 0, 1, 1,
1.234496, 1.18693, 0.9073966, 0, 0, 0, 1, 1,
1.246902, -0.6071423, 2.979775, 0, 0, 0, 1, 1,
1.251876, -0.9388609, 1.88241, 0, 0, 0, 1, 1,
1.257835, 0.9413078, 0.7926027, 0, 0, 0, 1, 1,
1.262825, 1.044241, 0.2388735, 1, 1, 1, 1, 1,
1.278532, -0.1589529, 1.130128, 1, 1, 1, 1, 1,
1.283668, -1.451649, 1.29808, 1, 1, 1, 1, 1,
1.294173, 1.497376, 0.9316683, 1, 1, 1, 1, 1,
1.29555, -1.194513, 1.999467, 1, 1, 1, 1, 1,
1.299423, 1.431952, 0.2229155, 1, 1, 1, 1, 1,
1.299836, 0.9875923, 1.07048, 1, 1, 1, 1, 1,
1.313761, -0.5158591, 1.965344, 1, 1, 1, 1, 1,
1.335413, -1.473556, 1.147883, 1, 1, 1, 1, 1,
1.342215, -0.6027608, -0.2922021, 1, 1, 1, 1, 1,
1.352812, 0.2409253, 1.28283, 1, 1, 1, 1, 1,
1.358621, -0.4058765, 1.578487, 1, 1, 1, 1, 1,
1.360872, 0.134855, 1.241726, 1, 1, 1, 1, 1,
1.363494, 1.464864, 1.977319, 1, 1, 1, 1, 1,
1.367071, 0.3722748, -0.09809799, 1, 1, 1, 1, 1,
1.371367, -0.5741515, 1.536922, 0, 0, 1, 1, 1,
1.373549, -0.524004, 2.060026, 1, 0, 0, 1, 1,
1.377539, 1.035887, -0.1818929, 1, 0, 0, 1, 1,
1.379469, -1.256495, 0.35782, 1, 0, 0, 1, 1,
1.380674, -0.818637, 1.885576, 1, 0, 0, 1, 1,
1.385286, 0.216618, 1.438382, 1, 0, 0, 1, 1,
1.39499, 0.3283626, 1.183914, 0, 0, 0, 1, 1,
1.397152, -1.041091, 1.355472, 0, 0, 0, 1, 1,
1.398386, 1.129089, 0.4367805, 0, 0, 0, 1, 1,
1.403696, -1.202144, 2.293625, 0, 0, 0, 1, 1,
1.412477, 0.4499833, -1.224737, 0, 0, 0, 1, 1,
1.416648, 2.064106, -0.2547387, 0, 0, 0, 1, 1,
1.417356, 1.123641, 0.711633, 0, 0, 0, 1, 1,
1.417548, -1.078254, 1.729463, 1, 1, 1, 1, 1,
1.425526, 1.972544, -0.341008, 1, 1, 1, 1, 1,
1.426315, -0.8956844, 0.957062, 1, 1, 1, 1, 1,
1.436697, 1.308731, 2.036457, 1, 1, 1, 1, 1,
1.440986, -1.593851, 2.006696, 1, 1, 1, 1, 1,
1.467225, 1.384648, 0.464655, 1, 1, 1, 1, 1,
1.476691, 1.057388, 0.5655866, 1, 1, 1, 1, 1,
1.484025, 0.8393844, 1.171798, 1, 1, 1, 1, 1,
1.4893, -1.777753, 3.327696, 1, 1, 1, 1, 1,
1.494692, -0.2775895, 1.757067, 1, 1, 1, 1, 1,
1.500699, 2.158782, -1.051768, 1, 1, 1, 1, 1,
1.506044, 0.2440153, 0.1629764, 1, 1, 1, 1, 1,
1.509614, 0.4004946, 2.097805, 1, 1, 1, 1, 1,
1.51543, 0.09127988, 4.600439, 1, 1, 1, 1, 1,
1.526185, -1.183384, 2.086569, 1, 1, 1, 1, 1,
1.535748, 0.671787, 0.3803647, 0, 0, 1, 1, 1,
1.546186, 0.338692, 2.749871, 1, 0, 0, 1, 1,
1.546455, -0.1191644, 1.379953, 1, 0, 0, 1, 1,
1.560111, 1.506872, -1.310488, 1, 0, 0, 1, 1,
1.563795, 1.361933, 1.147747, 1, 0, 0, 1, 1,
1.564671, -1.188925, 3.589081, 1, 0, 0, 1, 1,
1.583753, -1.554841, 2.478247, 0, 0, 0, 1, 1,
1.59358, -1.030959, 1.63641, 0, 0, 0, 1, 1,
1.598739, -0.5015616, -0.1392401, 0, 0, 0, 1, 1,
1.64896, 0.268655, 1.612597, 0, 0, 0, 1, 1,
1.654236, -0.7488237, 1.052068, 0, 0, 0, 1, 1,
1.678444, -1.949605, 3.600838, 0, 0, 0, 1, 1,
1.686358, 0.5689056, 0.2694911, 0, 0, 0, 1, 1,
1.687558, 2.022776, 0.9765375, 1, 1, 1, 1, 1,
1.708816, 0.6570166, 1.851067, 1, 1, 1, 1, 1,
1.723715, -0.9432971, 3.116604, 1, 1, 1, 1, 1,
1.725518, 0.5392049, 1.074542, 1, 1, 1, 1, 1,
1.728038, -2.145972, 2.465383, 1, 1, 1, 1, 1,
1.734549, 0.6916998, 0.8114398, 1, 1, 1, 1, 1,
1.739602, -0.8847036, 2.073356, 1, 1, 1, 1, 1,
1.773502, 0.4535417, 1.131191, 1, 1, 1, 1, 1,
1.775249, -1.496622, 3.196898, 1, 1, 1, 1, 1,
1.813739, 0.4605294, 1.668237, 1, 1, 1, 1, 1,
1.836424, -1.120331, 1.566046, 1, 1, 1, 1, 1,
1.866648, 0.1538483, -0.4339088, 1, 1, 1, 1, 1,
1.911941, -0.03638947, 1.118667, 1, 1, 1, 1, 1,
1.96459, 0.362805, 1.706254, 1, 1, 1, 1, 1,
1.966943, 0.08339419, 1.842013, 1, 1, 1, 1, 1,
1.969926, -1.056574, 1.552908, 0, 0, 1, 1, 1,
1.990725, -0.5434049, 0.1175223, 1, 0, 0, 1, 1,
2.006002, -0.3134243, 3.082182, 1, 0, 0, 1, 1,
2.013944, -1.389802, 3.343258, 1, 0, 0, 1, 1,
2.025177, -1.430626, 1.959604, 1, 0, 0, 1, 1,
2.066027, -2.011278, 1.349726, 1, 0, 0, 1, 1,
2.087912, -0.4452905, 1.947295, 0, 0, 0, 1, 1,
2.105195, -0.3739564, 0.6439097, 0, 0, 0, 1, 1,
2.141373, 0.01458214, 1.126967, 0, 0, 0, 1, 1,
2.147432, -1.318044, 1.223889, 0, 0, 0, 1, 1,
2.21242, 0.02538984, -0.1515379, 0, 0, 0, 1, 1,
2.230272, -1.582387, 2.936836, 0, 0, 0, 1, 1,
2.249206, -0.7519983, 3.38756, 0, 0, 0, 1, 1,
2.260912, 0.6853735, 0.7386305, 1, 1, 1, 1, 1,
2.600494, 1.231978, 0.4983739, 1, 1, 1, 1, 1,
2.6376, -1.270356, 2.002877, 1, 1, 1, 1, 1,
2.685847, -0.7510929, 0.8074336, 1, 1, 1, 1, 1,
2.816132, -0.01132133, 1.502012, 1, 1, 1, 1, 1,
2.841361, 0.7213815, -0.4400012, 1, 1, 1, 1, 1,
3.288396, -0.7185639, 1.832222, 1, 1, 1, 1, 1
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
var radius = 9.427178;
var distance = 33.11256;
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
mvMatrix.translate( -0.1031766, 0.09844136, 0.4499807 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.11256);
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
