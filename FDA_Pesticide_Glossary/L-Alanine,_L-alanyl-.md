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
-3.252553, -0.8331983, -1.741429, 1, 0, 0, 1,
-2.766822, 1.343188, -1.164276, 1, 0.007843138, 0, 1,
-2.742195, -0.178367, -3.165264, 1, 0.01176471, 0, 1,
-2.737416, 0.5097412, -0.164489, 1, 0.01960784, 0, 1,
-2.681323, 0.5451923, -1.381623, 1, 0.02352941, 0, 1,
-2.599738, -0.1307384, -0.8031514, 1, 0.03137255, 0, 1,
-2.429836, 0.06780019, -0.2948824, 1, 0.03529412, 0, 1,
-2.4111, 0.7672861, -1.625104, 1, 0.04313726, 0, 1,
-2.276643, 0.906537, -1.4712, 1, 0.04705882, 0, 1,
-2.19096, 0.0985831, -2.253146, 1, 0.05490196, 0, 1,
-2.115802, 0.7298384, -1.176986, 1, 0.05882353, 0, 1,
-2.111822, -1.834576, -2.559739, 1, 0.06666667, 0, 1,
-2.107879, -1.301592, -2.918823, 1, 0.07058824, 0, 1,
-2.099916, -1.455288, -3.506526, 1, 0.07843138, 0, 1,
-2.089681, -0.7641923, -2.276694, 1, 0.08235294, 0, 1,
-2.055379, -1.117356, -3.029293, 1, 0.09019608, 0, 1,
-2.052294, -1.078501, -0.6394978, 1, 0.09411765, 0, 1,
-2.040346, -0.8159779, -2.048522, 1, 0.1019608, 0, 1,
-2.030561, 0.1205441, -2.932747, 1, 0.1098039, 0, 1,
-2.025096, 0.8809772, -2.929978, 1, 0.1137255, 0, 1,
-2.019062, -1.284698, -2.637243, 1, 0.1215686, 0, 1,
-2.015525, 1.576061, -1.316254, 1, 0.1254902, 0, 1,
-1.986218, 0.582602, -3.266569, 1, 0.1333333, 0, 1,
-1.983083, 0.04583299, -0.8723885, 1, 0.1372549, 0, 1,
-1.979317, 1.163902, -2.20297, 1, 0.145098, 0, 1,
-1.970846, 0.4570832, -1.138847, 1, 0.1490196, 0, 1,
-1.940146, 0.06123392, -1.763211, 1, 0.1568628, 0, 1,
-1.933732, -0.5510862, -1.243229, 1, 0.1607843, 0, 1,
-1.931099, -0.04136979, 0.1070662, 1, 0.1686275, 0, 1,
-1.918987, -1.656459, -0.5617387, 1, 0.172549, 0, 1,
-1.908897, 1.408899, -1.186782, 1, 0.1803922, 0, 1,
-1.879524, 1.116673, -1.476244, 1, 0.1843137, 0, 1,
-1.876855, -0.6629873, -2.055985, 1, 0.1921569, 0, 1,
-1.856099, 2.406752, 0.1642577, 1, 0.1960784, 0, 1,
-1.830627, 0.5027286, -1.623234, 1, 0.2039216, 0, 1,
-1.829839, 0.467786, -0.08491252, 1, 0.2117647, 0, 1,
-1.826685, 0.1793742, -2.416148, 1, 0.2156863, 0, 1,
-1.820426, -1.533738, -2.640959, 1, 0.2235294, 0, 1,
-1.820008, -1.218318, -1.457917, 1, 0.227451, 0, 1,
-1.819172, 0.5085716, -1.544214, 1, 0.2352941, 0, 1,
-1.814764, 1.10618, -3.08589, 1, 0.2392157, 0, 1,
-1.812711, 0.2175188, -3.938242, 1, 0.2470588, 0, 1,
-1.807848, 0.8251435, -0.9315062, 1, 0.2509804, 0, 1,
-1.797948, -0.08504453, -1.833124, 1, 0.2588235, 0, 1,
-1.794813, -1.831255, -2.556534, 1, 0.2627451, 0, 1,
-1.781738, -0.5986884, -2.083318, 1, 0.2705882, 0, 1,
-1.765834, -1.374109, -2.396994, 1, 0.2745098, 0, 1,
-1.755749, -0.02866036, -1.780506, 1, 0.282353, 0, 1,
-1.752801, 0.404459, -1.167771, 1, 0.2862745, 0, 1,
-1.743644, -0.1145221, -0.3318858, 1, 0.2941177, 0, 1,
-1.722409, 0.6949855, -2.052585, 1, 0.3019608, 0, 1,
-1.705917, 0.8285095, -0.8378502, 1, 0.3058824, 0, 1,
-1.703989, -0.3279653, -2.391848, 1, 0.3137255, 0, 1,
-1.698977, 0.003750151, -2.403585, 1, 0.3176471, 0, 1,
-1.689974, 0.4664595, -0.7552585, 1, 0.3254902, 0, 1,
-1.687727, 1.129603, 0.4283647, 1, 0.3294118, 0, 1,
-1.681555, 0.2645975, -2.152266, 1, 0.3372549, 0, 1,
-1.678338, -0.5100149, 0.02547019, 1, 0.3411765, 0, 1,
-1.677, 1.033748, -1.170974, 1, 0.3490196, 0, 1,
-1.675893, 0.174153, -2.579365, 1, 0.3529412, 0, 1,
-1.664883, 1.614344, -2.405639, 1, 0.3607843, 0, 1,
-1.660353, -2.128038, -3.791718, 1, 0.3647059, 0, 1,
-1.657628, 0.6546418, -0.3109367, 1, 0.372549, 0, 1,
-1.653481, -0.8708321, -2.201366, 1, 0.3764706, 0, 1,
-1.630653, -0.0407095, -1.411902, 1, 0.3843137, 0, 1,
-1.62088, 0.4722798, -1.845015, 1, 0.3882353, 0, 1,
-1.589202, 0.2912786, -2.230635, 1, 0.3960784, 0, 1,
-1.581383, 0.4133, -0.2553545, 1, 0.4039216, 0, 1,
-1.555167, 0.7414842, -0.230223, 1, 0.4078431, 0, 1,
-1.554405, 0.2681338, -2.198274, 1, 0.4156863, 0, 1,
-1.529725, 1.616213, -0.4488203, 1, 0.4196078, 0, 1,
-1.52809, 1.628, -0.8407568, 1, 0.427451, 0, 1,
-1.515219, -0.4325292, -2.97425, 1, 0.4313726, 0, 1,
-1.506603, -0.9217595, -2.303662, 1, 0.4392157, 0, 1,
-1.504051, -0.340649, -1.284789, 1, 0.4431373, 0, 1,
-1.503209, -0.3419891, -2.139395, 1, 0.4509804, 0, 1,
-1.502553, -2.230297, -2.656662, 1, 0.454902, 0, 1,
-1.497423, -0.7820912, -0.9905095, 1, 0.4627451, 0, 1,
-1.472679, 0.1427694, -2.001615, 1, 0.4666667, 0, 1,
-1.466945, -0.2558078, -1.872612, 1, 0.4745098, 0, 1,
-1.433618, 0.4403079, -1.260543, 1, 0.4784314, 0, 1,
-1.427448, -0.7947292, -2.79789, 1, 0.4862745, 0, 1,
-1.419693, 1.550708, -1.753719, 1, 0.4901961, 0, 1,
-1.419276, -0.9767814, -2.883808, 1, 0.4980392, 0, 1,
-1.410504, 0.09676613, -3.783154, 1, 0.5058824, 0, 1,
-1.409696, 0.9544188, -1.031022, 1, 0.509804, 0, 1,
-1.389409, -0.9685808, -1.745354, 1, 0.5176471, 0, 1,
-1.386966, 1.594083, 0.7099231, 1, 0.5215687, 0, 1,
-1.377499, -1.58723, -2.799062, 1, 0.5294118, 0, 1,
-1.365414, 0.1449681, -1.678524, 1, 0.5333334, 0, 1,
-1.357604, 0.4880551, -2.032436, 1, 0.5411765, 0, 1,
-1.350441, 0.005854649, -3.193688, 1, 0.5450981, 0, 1,
-1.347602, -1.413454, -0.9448368, 1, 0.5529412, 0, 1,
-1.339915, -0.9335694, -3.767808, 1, 0.5568628, 0, 1,
-1.32978, 0.0464411, -1.097937, 1, 0.5647059, 0, 1,
-1.325198, 1.040761, -2.864088, 1, 0.5686275, 0, 1,
-1.319434, 0.305088, -0.9353099, 1, 0.5764706, 0, 1,
-1.28924, 0.6844657, -0.6394327, 1, 0.5803922, 0, 1,
-1.284278, 1.120586, -0.3155402, 1, 0.5882353, 0, 1,
-1.273285, -0.8271391, -0.7230237, 1, 0.5921569, 0, 1,
-1.264616, 1.440126, 0.07793324, 1, 0.6, 0, 1,
-1.257601, -0.1462724, -2.122826, 1, 0.6078432, 0, 1,
-1.253789, -0.9126912, -1.887908, 1, 0.6117647, 0, 1,
-1.253378, -0.6226628, -2.644144, 1, 0.6196079, 0, 1,
-1.252667, -0.1075922, -3.482777, 1, 0.6235294, 0, 1,
-1.248751, 0.7347609, -2.672395, 1, 0.6313726, 0, 1,
-1.246417, 1.928996, 0.2336123, 1, 0.6352941, 0, 1,
-1.243196, -0.03580408, -0.4852577, 1, 0.6431373, 0, 1,
-1.240267, 1.833457, -0.4824764, 1, 0.6470588, 0, 1,
-1.234728, -0.4720038, -2.105596, 1, 0.654902, 0, 1,
-1.232801, -0.2270604, -1.079739, 1, 0.6588235, 0, 1,
-1.230369, -0.9670858, -1.976182, 1, 0.6666667, 0, 1,
-1.219833, 0.07156254, -0.4645858, 1, 0.6705883, 0, 1,
-1.219024, -1.117834, -2.649728, 1, 0.6784314, 0, 1,
-1.214851, 0.4874294, -1.414784, 1, 0.682353, 0, 1,
-1.205512, -0.3866812, -1.958276, 1, 0.6901961, 0, 1,
-1.195055, 1.140784, 1.110949, 1, 0.6941177, 0, 1,
-1.194964, 0.1862561, -1.244779, 1, 0.7019608, 0, 1,
-1.192772, 0.2393797, -2.453806, 1, 0.7098039, 0, 1,
-1.192348, -0.5568193, -1.438934, 1, 0.7137255, 0, 1,
-1.190917, -0.3680548, -1.692872, 1, 0.7215686, 0, 1,
-1.172771, -1.161411, -1.253904, 1, 0.7254902, 0, 1,
-1.166464, 0.7491115, -0.7249243, 1, 0.7333333, 0, 1,
-1.154635, -0.6790123, -1.931506, 1, 0.7372549, 0, 1,
-1.153153, 1.813016, -0.8631893, 1, 0.7450981, 0, 1,
-1.149394, -0.5592914, -0.4585121, 1, 0.7490196, 0, 1,
-1.148476, -1.086547, -2.162886, 1, 0.7568628, 0, 1,
-1.146781, 2.484854, -0.08280484, 1, 0.7607843, 0, 1,
-1.145911, 0.9396486, -0.3005308, 1, 0.7686275, 0, 1,
-1.1342, 0.3855094, -0.5419606, 1, 0.772549, 0, 1,
-1.123698, -0.8129403, -2.614882, 1, 0.7803922, 0, 1,
-1.122876, 0.06389999, -2.233934, 1, 0.7843137, 0, 1,
-1.117106, 0.4670475, -2.027192, 1, 0.7921569, 0, 1,
-1.116488, -1.912716, -1.896859, 1, 0.7960784, 0, 1,
-1.110677, -0.06195506, -0.8173004, 1, 0.8039216, 0, 1,
-1.106997, 3.023855, -0.1591411, 1, 0.8117647, 0, 1,
-1.104185, -0.2623961, -1.830291, 1, 0.8156863, 0, 1,
-1.101077, 0.3140697, -0.04300877, 1, 0.8235294, 0, 1,
-1.098907, -1.617634, -2.302336, 1, 0.827451, 0, 1,
-1.097964, -0.6727629, -3.229657, 1, 0.8352941, 0, 1,
-1.091642, 1.193515, -1.901936, 1, 0.8392157, 0, 1,
-1.079435, -0.9545627, -0.1407333, 1, 0.8470588, 0, 1,
-1.07917, -0.2251481, -0.892895, 1, 0.8509804, 0, 1,
-1.07062, 2.034818, -0.04914529, 1, 0.8588235, 0, 1,
-1.06787, 1.050084, -1.655953, 1, 0.8627451, 0, 1,
-1.062713, -0.1398265, -2.694483, 1, 0.8705882, 0, 1,
-1.055981, 1.442267, 1.189833, 1, 0.8745098, 0, 1,
-1.055281, 0.1950313, 0.06249989, 1, 0.8823529, 0, 1,
-1.052188, 0.2617617, -1.611977, 1, 0.8862745, 0, 1,
-1.048625, 2.005181, 1.248853, 1, 0.8941177, 0, 1,
-1.04845, 0.4577008, -1.055919, 1, 0.8980392, 0, 1,
-1.041425, 0.8138567, -0.3310929, 1, 0.9058824, 0, 1,
-1.038722, -0.934076, -2.945584, 1, 0.9137255, 0, 1,
-1.038246, 0.1635772, -0.9495528, 1, 0.9176471, 0, 1,
-1.035874, 0.8653418, 0.9052381, 1, 0.9254902, 0, 1,
-1.021526, -0.4925429, -2.861691, 1, 0.9294118, 0, 1,
-1.0201, -0.09985296, -1.930035, 1, 0.9372549, 0, 1,
-1.015693, -0.7524824, -1.9797, 1, 0.9411765, 0, 1,
-1.014095, 1.153661, -0.1870081, 1, 0.9490196, 0, 1,
-1.002224, 0.4418812, -2.122052, 1, 0.9529412, 0, 1,
-1.001415, -2.479259, -3.159782, 1, 0.9607843, 0, 1,
-1.000923, 0.39678, -1.652234, 1, 0.9647059, 0, 1,
-0.9984071, 0.2422861, -2.801614, 1, 0.972549, 0, 1,
-0.9966119, 0.9680069, 0.2924438, 1, 0.9764706, 0, 1,
-0.9960703, 0.4223145, -3.65052, 1, 0.9843137, 0, 1,
-0.9852171, 0.8098834, -1.21219, 1, 0.9882353, 0, 1,
-0.9842716, 0.01869305, -1.927504, 1, 0.9960784, 0, 1,
-0.9834912, 0.4270796, -1.631241, 0.9960784, 1, 0, 1,
-0.9773272, -1.145546, -2.351644, 0.9921569, 1, 0, 1,
-0.9744309, -0.05790307, -2.052852, 0.9843137, 1, 0, 1,
-0.972363, 0.3999726, -1.070267, 0.9803922, 1, 0, 1,
-0.9682652, 0.4748704, -1.28502, 0.972549, 1, 0, 1,
-0.9655539, -0.9295393, -1.786493, 0.9686275, 1, 0, 1,
-0.9646423, -0.6542007, -0.952472, 0.9607843, 1, 0, 1,
-0.955206, -0.1265586, -3.292684, 0.9568627, 1, 0, 1,
-0.9532113, -2.861571, -2.307576, 0.9490196, 1, 0, 1,
-0.9514725, 0.2129533, -0.2161298, 0.945098, 1, 0, 1,
-0.947606, 1.137555, -0.9512544, 0.9372549, 1, 0, 1,
-0.9374712, -0.1350054, -2.51042, 0.9333333, 1, 0, 1,
-0.9362605, 0.2657719, 0.1675574, 0.9254902, 1, 0, 1,
-0.9334155, -0.0196255, -1.823599, 0.9215686, 1, 0, 1,
-0.9274623, -0.3076406, -2.481671, 0.9137255, 1, 0, 1,
-0.9236999, -0.5330867, -0.4273939, 0.9098039, 1, 0, 1,
-0.9220226, 0.2742966, -0.9315776, 0.9019608, 1, 0, 1,
-0.921574, 0.04636217, -1.808144, 0.8941177, 1, 0, 1,
-0.9167001, 1.034665, -0.09971189, 0.8901961, 1, 0, 1,
-0.9133819, -0.5219399, -1.544211, 0.8823529, 1, 0, 1,
-0.8984221, 0.02601709, -0.8743873, 0.8784314, 1, 0, 1,
-0.8971093, 0.6148348, -1.224162, 0.8705882, 1, 0, 1,
-0.8917048, -1.335703, -3.773518, 0.8666667, 1, 0, 1,
-0.889306, 0.5531748, -2.296594, 0.8588235, 1, 0, 1,
-0.8890598, -1.008816, -3.548677, 0.854902, 1, 0, 1,
-0.8886105, -0.494856, -0.6165571, 0.8470588, 1, 0, 1,
-0.8847844, -2.106785, -3.825121, 0.8431373, 1, 0, 1,
-0.8841482, -0.3931678, -1.41363, 0.8352941, 1, 0, 1,
-0.8826319, 1.647765, -1.84998, 0.8313726, 1, 0, 1,
-0.874431, -0.3369518, -2.262147, 0.8235294, 1, 0, 1,
-0.8727494, 1.487748, 0.2648396, 0.8196079, 1, 0, 1,
-0.8720632, -1.25978, -3.670423, 0.8117647, 1, 0, 1,
-0.8714374, -1.769443, -5.310099, 0.8078431, 1, 0, 1,
-0.8711337, 0.5751202, -0.5826152, 0.8, 1, 0, 1,
-0.8650069, 0.5777318, -1.833251, 0.7921569, 1, 0, 1,
-0.8647716, 0.3475242, -0.3482609, 0.7882353, 1, 0, 1,
-0.8623747, -0.1247169, -1.15955, 0.7803922, 1, 0, 1,
-0.8572069, -0.06769071, -2.291014, 0.7764706, 1, 0, 1,
-0.8569131, -0.5579643, -1.425547, 0.7686275, 1, 0, 1,
-0.8523428, 1.302266, -1.561012, 0.7647059, 1, 0, 1,
-0.843015, 0.1312495, -0.4845825, 0.7568628, 1, 0, 1,
-0.8423113, 1.082183, 0.2508252, 0.7529412, 1, 0, 1,
-0.8407932, 1.697792, -0.1194245, 0.7450981, 1, 0, 1,
-0.8333827, 0.4465043, -0.815691, 0.7411765, 1, 0, 1,
-0.8311527, -1.002895, -2.723225, 0.7333333, 1, 0, 1,
-0.8302535, 0.2290009, -0.9444686, 0.7294118, 1, 0, 1,
-0.8292311, -0.2881757, -3.877192, 0.7215686, 1, 0, 1,
-0.8167003, 0.08236356, -1.332146, 0.7176471, 1, 0, 1,
-0.8162462, 1.038164, -1.47807, 0.7098039, 1, 0, 1,
-0.8116342, -0.05780363, -2.75623, 0.7058824, 1, 0, 1,
-0.8043982, -0.8564701, -2.714428, 0.6980392, 1, 0, 1,
-0.8036581, 0.2271721, 0.08008742, 0.6901961, 1, 0, 1,
-0.8019796, 1.800275, 0.04379474, 0.6862745, 1, 0, 1,
-0.8006172, 0.7756414, -2.297968, 0.6784314, 1, 0, 1,
-0.7999073, 0.5923069, -2.058532, 0.6745098, 1, 0, 1,
-0.7995585, -0.8184091, -2.267137, 0.6666667, 1, 0, 1,
-0.7862538, -1.374598, -2.465505, 0.6627451, 1, 0, 1,
-0.7845674, 2.405575, -1.487766, 0.654902, 1, 0, 1,
-0.7798849, -0.3479984, -1.921861, 0.6509804, 1, 0, 1,
-0.7753354, -0.3499341, -1.705159, 0.6431373, 1, 0, 1,
-0.7742746, 0.5966851, -1.005695, 0.6392157, 1, 0, 1,
-0.7716736, -0.5390454, -3.40582, 0.6313726, 1, 0, 1,
-0.770516, -1.260193, -2.89215, 0.627451, 1, 0, 1,
-0.7697992, -1.263022, -3.014845, 0.6196079, 1, 0, 1,
-0.7690194, -1.950944, -2.168299, 0.6156863, 1, 0, 1,
-0.7658731, -0.1827429, -1.465537, 0.6078432, 1, 0, 1,
-0.7656831, -0.5003501, -4.505938, 0.6039216, 1, 0, 1,
-0.7626877, -1.125465, -2.255154, 0.5960785, 1, 0, 1,
-0.7619562, 0.8276678, -1.971085, 0.5882353, 1, 0, 1,
-0.7605301, -0.04345291, -0.1227582, 0.5843138, 1, 0, 1,
-0.7598538, -0.07499234, -1.748331, 0.5764706, 1, 0, 1,
-0.7538368, 1.395258, -1.25724, 0.572549, 1, 0, 1,
-0.7472589, 0.05465246, -1.848191, 0.5647059, 1, 0, 1,
-0.7362276, 0.2132022, -1.837932, 0.5607843, 1, 0, 1,
-0.726723, 1.680437, -0.6171914, 0.5529412, 1, 0, 1,
-0.7183114, 2.1773, 1.092682, 0.5490196, 1, 0, 1,
-0.7152435, 1.773179, 0.9749156, 0.5411765, 1, 0, 1,
-0.7092505, 0.1945276, -1.244224, 0.5372549, 1, 0, 1,
-0.7075957, -0.5213507, -2.844079, 0.5294118, 1, 0, 1,
-0.7061753, 1.089651, -2.020325, 0.5254902, 1, 0, 1,
-0.702685, -0.1662339, -3.486982, 0.5176471, 1, 0, 1,
-0.7025576, -0.1039868, -1.280518, 0.5137255, 1, 0, 1,
-0.6896225, -2.06902, -1.856078, 0.5058824, 1, 0, 1,
-0.6883323, -0.9638426, -3.63756, 0.5019608, 1, 0, 1,
-0.6843137, -0.4060296, -1.20228, 0.4941176, 1, 0, 1,
-0.6792447, 0.8188829, -0.4016087, 0.4862745, 1, 0, 1,
-0.6791973, 0.3596464, -2.250004, 0.4823529, 1, 0, 1,
-0.6749594, -1.388193, -4.364309, 0.4745098, 1, 0, 1,
-0.6746777, -1.324315, -3.732073, 0.4705882, 1, 0, 1,
-0.6743427, 1.061623, 0.9513298, 0.4627451, 1, 0, 1,
-0.6700472, -0.02685854, -2.558695, 0.4588235, 1, 0, 1,
-0.6697546, 0.02447867, -0.4754752, 0.4509804, 1, 0, 1,
-0.6681167, 1.254267, -0.9086975, 0.4470588, 1, 0, 1,
-0.6668105, 1.93199, 0.2156153, 0.4392157, 1, 0, 1,
-0.6617128, 0.2194045, -0.8370288, 0.4352941, 1, 0, 1,
-0.6610264, -0.6930968, -1.71531, 0.427451, 1, 0, 1,
-0.6593462, 0.7680078, -0.2177201, 0.4235294, 1, 0, 1,
-0.6543162, 0.6854842, 0.5748779, 0.4156863, 1, 0, 1,
-0.6512758, -0.9987575, -3.11304, 0.4117647, 1, 0, 1,
-0.6494021, -2.240351, -1.975679, 0.4039216, 1, 0, 1,
-0.6486903, -1.81971, -1.517044, 0.3960784, 1, 0, 1,
-0.6473457, -0.2074856, -3.70823, 0.3921569, 1, 0, 1,
-0.6455448, 0.04254475, -2.379458, 0.3843137, 1, 0, 1,
-0.6437845, -1.29179, -2.219614, 0.3803922, 1, 0, 1,
-0.6437612, 0.6788716, 1.089193, 0.372549, 1, 0, 1,
-0.6419474, 0.7713802, -1.285302, 0.3686275, 1, 0, 1,
-0.6392071, -0.8318614, -1.130885, 0.3607843, 1, 0, 1,
-0.6369782, 0.6462399, -0.1062001, 0.3568628, 1, 0, 1,
-0.6344672, -0.630836, -1.200505, 0.3490196, 1, 0, 1,
-0.6283759, 0.7928733, 0.6210021, 0.345098, 1, 0, 1,
-0.6270186, -1.143491, -2.108292, 0.3372549, 1, 0, 1,
-0.6247011, 1.14521, 0.5874159, 0.3333333, 1, 0, 1,
-0.6227207, -1.116135, -2.745001, 0.3254902, 1, 0, 1,
-0.6201754, -0.2145475, -1.406048, 0.3215686, 1, 0, 1,
-0.620025, -0.1108603, -4.106845, 0.3137255, 1, 0, 1,
-0.6171728, 0.6433455, -3.587303, 0.3098039, 1, 0, 1,
-0.613314, -0.7592461, -2.5956, 0.3019608, 1, 0, 1,
-0.6074633, 1.553222, 2.102029, 0.2941177, 1, 0, 1,
-0.6011177, -0.692456, -2.10068, 0.2901961, 1, 0, 1,
-0.6010357, 0.04007947, 0.08662478, 0.282353, 1, 0, 1,
-0.6009961, -1.129739, -2.925302, 0.2784314, 1, 0, 1,
-0.5999984, -0.9275678, -3.906692, 0.2705882, 1, 0, 1,
-0.5986875, 0.2669588, -2.787545, 0.2666667, 1, 0, 1,
-0.597047, -0.1678923, -2.010579, 0.2588235, 1, 0, 1,
-0.5940435, 0.4269499, -0.1489003, 0.254902, 1, 0, 1,
-0.5912973, 0.3355077, -1.868419, 0.2470588, 1, 0, 1,
-0.5892826, -1.60547, -3.572, 0.2431373, 1, 0, 1,
-0.5854419, 0.5224342, -1.490983, 0.2352941, 1, 0, 1,
-0.5846561, 0.06399753, -0.3905123, 0.2313726, 1, 0, 1,
-0.5827395, 2.646507, -0.9520779, 0.2235294, 1, 0, 1,
-0.5822501, -1.450376, -3.932516, 0.2196078, 1, 0, 1,
-0.5771911, -0.7974564, -3.69811, 0.2117647, 1, 0, 1,
-0.5770043, -0.754167, -1.339337, 0.2078431, 1, 0, 1,
-0.5757552, 0.6061407, -1.230763, 0.2, 1, 0, 1,
-0.5718388, 1.059846, 1.228632, 0.1921569, 1, 0, 1,
-0.5702121, 0.1785683, 0.2538745, 0.1882353, 1, 0, 1,
-0.5620235, -0.9463218, -2.176709, 0.1803922, 1, 0, 1,
-0.55478, 0.6248992, -1.680283, 0.1764706, 1, 0, 1,
-0.5532264, -1.065143, -3.430946, 0.1686275, 1, 0, 1,
-0.5532249, -0.2077435, -2.144029, 0.1647059, 1, 0, 1,
-0.5487595, -1.65079, -3.346422, 0.1568628, 1, 0, 1,
-0.5441924, 1.019288, -1.061817, 0.1529412, 1, 0, 1,
-0.5431452, -1.270669, -2.644215, 0.145098, 1, 0, 1,
-0.5427105, -1.130044, -3.246467, 0.1411765, 1, 0, 1,
-0.5377277, 0.04803966, -0.8000245, 0.1333333, 1, 0, 1,
-0.5342155, -0.8761578, -2.3666, 0.1294118, 1, 0, 1,
-0.5337285, 0.03523576, -0.97019, 0.1215686, 1, 0, 1,
-0.531163, -1.198887, -2.247135, 0.1176471, 1, 0, 1,
-0.5291004, -0.4396488, -0.7977396, 0.1098039, 1, 0, 1,
-0.525854, 0.2579245, -2.146261, 0.1058824, 1, 0, 1,
-0.5216143, -0.1528502, -0.9888865, 0.09803922, 1, 0, 1,
-0.5210385, -0.7153473, -2.816776, 0.09019608, 1, 0, 1,
-0.5158734, -1.779299, -2.970662, 0.08627451, 1, 0, 1,
-0.5127467, 0.9109095, -2.292247, 0.07843138, 1, 0, 1,
-0.5127458, 0.09979306, -1.703859, 0.07450981, 1, 0, 1,
-0.5105586, -0.6035594, -2.252071, 0.06666667, 1, 0, 1,
-0.5039674, 0.2515832, -3.366514, 0.0627451, 1, 0, 1,
-0.5030175, -0.7901344, -1.577631, 0.05490196, 1, 0, 1,
-0.5020648, -0.7492664, -2.526402, 0.05098039, 1, 0, 1,
-0.5010972, -0.4786898, -1.311682, 0.04313726, 1, 0, 1,
-0.4937537, 0.3734206, -0.628659, 0.03921569, 1, 0, 1,
-0.4924628, 1.194069, -0.2573689, 0.03137255, 1, 0, 1,
-0.4913268, 0.9226755, -1.229004, 0.02745098, 1, 0, 1,
-0.4858162, -0.3013748, -1.044023, 0.01960784, 1, 0, 1,
-0.4841176, -0.1100393, -0.3647744, 0.01568628, 1, 0, 1,
-0.4827484, -1.670203, -3.710036, 0.007843138, 1, 0, 1,
-0.4819025, 0.2159497, -0.631484, 0.003921569, 1, 0, 1,
-0.4800526, -0.1827431, -3.168007, 0, 1, 0.003921569, 1,
-0.4758985, -1.116226, -2.806494, 0, 1, 0.01176471, 1,
-0.4735858, -0.2519074, -1.902265, 0, 1, 0.01568628, 1,
-0.4710332, 0.4098929, -3.115669, 0, 1, 0.02352941, 1,
-0.4638669, -0.3658353, -3.056592, 0, 1, 0.02745098, 1,
-0.4508044, -1.39783, -2.541475, 0, 1, 0.03529412, 1,
-0.4500786, -0.6754793, -2.604498, 0, 1, 0.03921569, 1,
-0.4442646, -0.802429, -1.194073, 0, 1, 0.04705882, 1,
-0.4416946, 1.360507, 0.3859385, 0, 1, 0.05098039, 1,
-0.4407324, 0.249075, -1.57461, 0, 1, 0.05882353, 1,
-0.4392026, 0.3845967, -1.602849, 0, 1, 0.0627451, 1,
-0.437774, -0.5654097, -4.21451, 0, 1, 0.07058824, 1,
-0.4373123, -0.7526699, -1.885978, 0, 1, 0.07450981, 1,
-0.4356423, -0.07282574, -1.145245, 0, 1, 0.08235294, 1,
-0.4324314, 1.227701, -0.4131511, 0, 1, 0.08627451, 1,
-0.4322335, 0.9331375, -0.3429429, 0, 1, 0.09411765, 1,
-0.4237851, 0.5413685, -0.7798413, 0, 1, 0.1019608, 1,
-0.4232079, 0.2293067, -0.6066246, 0, 1, 0.1058824, 1,
-0.4200809, 0.9565012, 0.99855, 0, 1, 0.1137255, 1,
-0.4150599, 0.02462479, -2.937352, 0, 1, 0.1176471, 1,
-0.4110669, -0.848027, -1.576803, 0, 1, 0.1254902, 1,
-0.4110546, -0.9473829, -2.138205, 0, 1, 0.1294118, 1,
-0.4096151, -2.217397, -3.943781, 0, 1, 0.1372549, 1,
-0.4090183, 0.6280689, -0.3578525, 0, 1, 0.1411765, 1,
-0.4085072, -0.1324237, -2.423432, 0, 1, 0.1490196, 1,
-0.4049273, -0.09080172, -1.769061, 0, 1, 0.1529412, 1,
-0.404462, -0.4178741, -2.44141, 0, 1, 0.1607843, 1,
-0.3977962, -0.784084, -1.261122, 0, 1, 0.1647059, 1,
-0.3961639, 2.193925, 1.005677, 0, 1, 0.172549, 1,
-0.3897989, -0.2958828, -2.728848, 0, 1, 0.1764706, 1,
-0.389048, 0.891225, -0.2551194, 0, 1, 0.1843137, 1,
-0.3874676, -0.2971395, -4.666943, 0, 1, 0.1882353, 1,
-0.3816956, 1.221194, -0.7089546, 0, 1, 0.1960784, 1,
-0.3814792, -0.6877194, -2.152916, 0, 1, 0.2039216, 1,
-0.3805933, 1.669992, 0.2384299, 0, 1, 0.2078431, 1,
-0.3798967, -0.6550905, -2.204601, 0, 1, 0.2156863, 1,
-0.3767559, -0.4931228, -2.331902, 0, 1, 0.2196078, 1,
-0.3747226, 0.1830251, -1.115953, 0, 1, 0.227451, 1,
-0.3733751, -0.8663418, -1.667869, 0, 1, 0.2313726, 1,
-0.3726963, -0.5932195, -5.566478, 0, 1, 0.2392157, 1,
-0.3691634, 0.3597429, -0.8720655, 0, 1, 0.2431373, 1,
-0.3681409, -0.960327, -3.84208, 0, 1, 0.2509804, 1,
-0.3680746, 0.3003539, 0.6185119, 0, 1, 0.254902, 1,
-0.367909, -0.920858, -3.605494, 0, 1, 0.2627451, 1,
-0.365521, -0.303274, -1.805994, 0, 1, 0.2666667, 1,
-0.3597504, 0.4850618, -0.1230613, 0, 1, 0.2745098, 1,
-0.3585155, 2.025531, 0.9515716, 0, 1, 0.2784314, 1,
-0.3563654, -1.289649, -3.586533, 0, 1, 0.2862745, 1,
-0.3492186, 1.798617, -1.192498, 0, 1, 0.2901961, 1,
-0.3467656, -0.6937069, -2.397642, 0, 1, 0.2980392, 1,
-0.3458498, -1.319739, -3.083438, 0, 1, 0.3058824, 1,
-0.3389977, -0.05122974, -3.235657, 0, 1, 0.3098039, 1,
-0.3386286, 0.4603178, -1.142409, 0, 1, 0.3176471, 1,
-0.3361275, 1.070568, -1.618785, 0, 1, 0.3215686, 1,
-0.3356219, 0.3023228, -0.9085782, 0, 1, 0.3294118, 1,
-0.3281461, 1.767328, -1.340663, 0, 1, 0.3333333, 1,
-0.3210998, -1.031631, -3.947381, 0, 1, 0.3411765, 1,
-0.3183363, 0.7291881, -0.9636375, 0, 1, 0.345098, 1,
-0.3173086, -0.2902831, -1.853039, 0, 1, 0.3529412, 1,
-0.3161665, -0.4539129, -3.37066, 0, 1, 0.3568628, 1,
-0.3114389, -0.48282, -1.833754, 0, 1, 0.3647059, 1,
-0.3094054, -0.4472022, -1.949893, 0, 1, 0.3686275, 1,
-0.3062085, -0.4921239, -2.889208, 0, 1, 0.3764706, 1,
-0.3061545, -1.942526, -2.466078, 0, 1, 0.3803922, 1,
-0.3059435, -0.3397488, -4.831262, 0, 1, 0.3882353, 1,
-0.3052431, -0.3966398, -2.209273, 0, 1, 0.3921569, 1,
-0.3045322, -0.4853111, -3.407213, 0, 1, 0.4, 1,
-0.3024797, 0.8635671, -0.8022228, 0, 1, 0.4078431, 1,
-0.3012609, -1.978807, -2.742722, 0, 1, 0.4117647, 1,
-0.3007486, -0.4106014, -1.61058, 0, 1, 0.4196078, 1,
-0.2973154, -1.299276, -1.255281, 0, 1, 0.4235294, 1,
-0.2963721, -0.7732356, -2.808401, 0, 1, 0.4313726, 1,
-0.2940391, -0.2335857, -1.633952, 0, 1, 0.4352941, 1,
-0.2847861, -0.2700015, -0.5655864, 0, 1, 0.4431373, 1,
-0.2837809, -0.2989613, -2.568172, 0, 1, 0.4470588, 1,
-0.282767, -0.1331014, -3.321287, 0, 1, 0.454902, 1,
-0.2826762, 0.4249525, 0.6953778, 0, 1, 0.4588235, 1,
-0.2784248, 0.788066, -0.5189562, 0, 1, 0.4666667, 1,
-0.2734437, -0.001466071, -1.247459, 0, 1, 0.4705882, 1,
-0.2725121, 0.276129, -1.583077, 0, 1, 0.4784314, 1,
-0.2713288, 0.5082742, 0.1715069, 0, 1, 0.4823529, 1,
-0.2709426, -0.6453235, -4.774941, 0, 1, 0.4901961, 1,
-0.270911, -0.6130756, -1.354286, 0, 1, 0.4941176, 1,
-0.2636857, 0.04192903, -0.8466189, 0, 1, 0.5019608, 1,
-0.2632417, -2.051301, -0.6144059, 0, 1, 0.509804, 1,
-0.2587411, 2.475818, -0.1820819, 0, 1, 0.5137255, 1,
-0.2548846, -1.111819, -2.356503, 0, 1, 0.5215687, 1,
-0.2532729, 0.004044505, -2.286452, 0, 1, 0.5254902, 1,
-0.2492406, 0.2950374, -1.521061, 0, 1, 0.5333334, 1,
-0.2481196, -0.3147893, -3.471303, 0, 1, 0.5372549, 1,
-0.2443045, -0.947845, -4.612297, 0, 1, 0.5450981, 1,
-0.243344, 0.779411, -1.724361, 0, 1, 0.5490196, 1,
-0.2377778, -0.1111502, -3.035062, 0, 1, 0.5568628, 1,
-0.2328733, 0.7148013, 0.6396118, 0, 1, 0.5607843, 1,
-0.2272686, 0.7501267, -0.5671654, 0, 1, 0.5686275, 1,
-0.2260381, 1.051957, -0.2095113, 0, 1, 0.572549, 1,
-0.2248224, 1.058049, 0.3543774, 0, 1, 0.5803922, 1,
-0.2219671, 0.5095865, -0.5619766, 0, 1, 0.5843138, 1,
-0.2194225, 0.6330682, -0.8548622, 0, 1, 0.5921569, 1,
-0.2161873, -2.351277, -3.381927, 0, 1, 0.5960785, 1,
-0.2119825, -0.769826, -2.28676, 0, 1, 0.6039216, 1,
-0.2098323, 0.6533669, -1.095801, 0, 1, 0.6117647, 1,
-0.2081626, -0.2933311, -4.477292, 0, 1, 0.6156863, 1,
-0.2073732, 0.2283166, -1.97889, 0, 1, 0.6235294, 1,
-0.2054858, 1.29489, -0.6875018, 0, 1, 0.627451, 1,
-0.2008587, -1.052495, -1.44354, 0, 1, 0.6352941, 1,
-0.1997774, -1.5058, -3.1738, 0, 1, 0.6392157, 1,
-0.1973332, -1.559415, -2.020527, 0, 1, 0.6470588, 1,
-0.195422, 0.8994767, -1.247981, 0, 1, 0.6509804, 1,
-0.1935476, 0.8274173, 0.05111341, 0, 1, 0.6588235, 1,
-0.1903482, 0.689966, -0.4752461, 0, 1, 0.6627451, 1,
-0.1884602, 1.511947, 0.4007832, 0, 1, 0.6705883, 1,
-0.1880846, 1.340858, -0.8646066, 0, 1, 0.6745098, 1,
-0.1872891, -0.8534359, -2.543171, 0, 1, 0.682353, 1,
-0.1817858, -0.4781139, -2.755641, 0, 1, 0.6862745, 1,
-0.1809529, 0.5852645, -0.8324916, 0, 1, 0.6941177, 1,
-0.1800325, 0.3668242, 0.8664331, 0, 1, 0.7019608, 1,
-0.1797448, -1.301512, -2.724244, 0, 1, 0.7058824, 1,
-0.1795584, 1.56436, -1.275024, 0, 1, 0.7137255, 1,
-0.1794214, 1.773912, -1.725174, 0, 1, 0.7176471, 1,
-0.1767499, -0.5728106, -3.759834, 0, 1, 0.7254902, 1,
-0.1725334, -0.4849203, -1.659978, 0, 1, 0.7294118, 1,
-0.1680307, -0.3810779, -1.855512, 0, 1, 0.7372549, 1,
-0.1680207, -0.5020459, -2.817561, 0, 1, 0.7411765, 1,
-0.1666719, 1.329984, 0.2799551, 0, 1, 0.7490196, 1,
-0.1605587, -0.02691014, -1.892041, 0, 1, 0.7529412, 1,
-0.1602879, -2.088082, -2.066631, 0, 1, 0.7607843, 1,
-0.1593037, -0.6137552, -1.832342, 0, 1, 0.7647059, 1,
-0.1573179, 0.8966436, -0.2554262, 0, 1, 0.772549, 1,
-0.1512933, 1.532883, 0.3638813, 0, 1, 0.7764706, 1,
-0.1506893, -0.5533808, -4.262283, 0, 1, 0.7843137, 1,
-0.1467014, -0.005910988, -0.6480889, 0, 1, 0.7882353, 1,
-0.1462315, -0.3382496, -3.69542, 0, 1, 0.7960784, 1,
-0.1434459, 0.9919974, -0.4371937, 0, 1, 0.8039216, 1,
-0.1424246, 0.2234094, -0.9923837, 0, 1, 0.8078431, 1,
-0.1421059, -0.6046998, -1.637597, 0, 1, 0.8156863, 1,
-0.1414922, 0.9576158, 0.1038995, 0, 1, 0.8196079, 1,
-0.1411149, -0.1050247, -3.210643, 0, 1, 0.827451, 1,
-0.1408463, -1.370108, -4.731392, 0, 1, 0.8313726, 1,
-0.1360649, -1.711843, -3.819252, 0, 1, 0.8392157, 1,
-0.1351806, -0.6394369, -3.656656, 0, 1, 0.8431373, 1,
-0.1298222, -0.3997948, -3.871463, 0, 1, 0.8509804, 1,
-0.1271823, 0.3263226, -0.1105018, 0, 1, 0.854902, 1,
-0.1225528, 0.4162082, 0.1236939, 0, 1, 0.8627451, 1,
-0.1222917, 0.4498522, -0.7489769, 0, 1, 0.8666667, 1,
-0.117755, -0.721488, -2.420128, 0, 1, 0.8745098, 1,
-0.1158341, 0.5227523, -1.477286, 0, 1, 0.8784314, 1,
-0.1138645, -1.275388, -1.849704, 0, 1, 0.8862745, 1,
-0.1129485, 0.05653311, -0.1827, 0, 1, 0.8901961, 1,
-0.1089931, -0.1877508, -2.363032, 0, 1, 0.8980392, 1,
-0.1051939, 1.198635, -0.9513925, 0, 1, 0.9058824, 1,
-0.09969136, 0.425528, -0.3502432, 0, 1, 0.9098039, 1,
-0.09714199, -0.2837557, -2.607052, 0, 1, 0.9176471, 1,
-0.09693393, -1.555374, -1.847885, 0, 1, 0.9215686, 1,
-0.09307009, -0.5670716, -1.559353, 0, 1, 0.9294118, 1,
-0.08953213, 0.5312784, 0.5622491, 0, 1, 0.9333333, 1,
-0.08912676, -0.5274478, -3.468656, 0, 1, 0.9411765, 1,
-0.08290594, 0.3712237, -0.9106765, 0, 1, 0.945098, 1,
-0.0827518, -0.3789176, -1.584661, 0, 1, 0.9529412, 1,
-0.07295519, -1.513931, -4.665289, 0, 1, 0.9568627, 1,
-0.04613897, 1.313391, -1.988105, 0, 1, 0.9647059, 1,
-0.04314603, -1.416298, -1.100681, 0, 1, 0.9686275, 1,
-0.04272517, 0.8833313, 0.2366671, 0, 1, 0.9764706, 1,
-0.04175613, 0.7652964, 1.347778, 0, 1, 0.9803922, 1,
-0.04158632, -0.07228699, -1.087136, 0, 1, 0.9882353, 1,
-0.04131623, 0.2350807, -0.1848427, 0, 1, 0.9921569, 1,
-0.03744195, 0.4170806, -0.02995146, 0, 1, 1, 1,
-0.02643509, -0.8749287, -3.300309, 0, 0.9921569, 1, 1,
-0.02574071, 1.052494, -0.9284626, 0, 0.9882353, 1, 1,
-0.02485959, -0.1281375, -3.168316, 0, 0.9803922, 1, 1,
-0.0236483, -0.3814532, -4.0635, 0, 0.9764706, 1, 1,
-0.02093114, 1.866951, -0.6467759, 0, 0.9686275, 1, 1,
-0.0207759, -0.6237764, -2.377763, 0, 0.9647059, 1, 1,
-0.01997202, 0.1746248, -0.2241465, 0, 0.9568627, 1, 1,
-0.01972847, -0.4883173, -3.185963, 0, 0.9529412, 1, 1,
-0.01724049, -0.2091163, -2.125836, 0, 0.945098, 1, 1,
-0.01459774, 0.2810376, 1.176136, 0, 0.9411765, 1, 1,
-0.01183645, 2.94342, 1.817562, 0, 0.9333333, 1, 1,
-0.01059766, 1.752299, 1.417029, 0, 0.9294118, 1, 1,
-0.005236675, 1.726721, 0.7516506, 0, 0.9215686, 1, 1,
-0.0003188628, 1.001401, 0.8660427, 0, 0.9176471, 1, 1,
0.0008419766, -0.04711946, 3.834684, 0, 0.9098039, 1, 1,
0.001343629, -0.3016329, 4.177426, 0, 0.9058824, 1, 1,
0.002719013, -0.2696553, 2.151219, 0, 0.8980392, 1, 1,
0.002789421, -1.272766, 2.920038, 0, 0.8901961, 1, 1,
0.004734562, -1.096195, 3.603448, 0, 0.8862745, 1, 1,
0.005562109, -1.794491, 0.794246, 0, 0.8784314, 1, 1,
0.005819743, -0.7157453, 2.153657, 0, 0.8745098, 1, 1,
0.011745, -0.9536399, 3.897241, 0, 0.8666667, 1, 1,
0.01193672, 0.4412279, 0.9630122, 0, 0.8627451, 1, 1,
0.01280797, -0.1397711, 3.004938, 0, 0.854902, 1, 1,
0.01824684, 0.750253, -0.0169483, 0, 0.8509804, 1, 1,
0.01895853, -0.1762528, 3.045813, 0, 0.8431373, 1, 1,
0.0259608, -0.02598427, 2.471548, 0, 0.8392157, 1, 1,
0.02766871, 0.4771129, 0.7192677, 0, 0.8313726, 1, 1,
0.02802211, -0.4913262, 1.510484, 0, 0.827451, 1, 1,
0.02861293, 0.7449598, -0.2439504, 0, 0.8196079, 1, 1,
0.03091605, -0.2894978, 3.995781, 0, 0.8156863, 1, 1,
0.03232604, -0.4980892, 3.720628, 0, 0.8078431, 1, 1,
0.03594256, 0.5723519, -0.9588151, 0, 0.8039216, 1, 1,
0.03733391, -0.3668487, 3.159498, 0, 0.7960784, 1, 1,
0.04485049, -0.6359381, 3.90532, 0, 0.7882353, 1, 1,
0.04516384, 0.6082856, -0.3326479, 0, 0.7843137, 1, 1,
0.0473414, 2.127928, 1.478479, 0, 0.7764706, 1, 1,
0.04775403, -0.2940435, 2.918133, 0, 0.772549, 1, 1,
0.04906545, 0.273717, -0.4258751, 0, 0.7647059, 1, 1,
0.05428324, 0.5937018, 1.068961, 0, 0.7607843, 1, 1,
0.05449473, -0.4163406, 3.261722, 0, 0.7529412, 1, 1,
0.06432556, -0.1077358, 3.232532, 0, 0.7490196, 1, 1,
0.06460994, 0.05001417, 0.3318172, 0, 0.7411765, 1, 1,
0.0666113, -0.7690572, 3.44962, 0, 0.7372549, 1, 1,
0.06795915, 0.7133768, -0.7793012, 0, 0.7294118, 1, 1,
0.07344754, -1.288217, 3.970693, 0, 0.7254902, 1, 1,
0.07639558, -0.8295881, 4.211547, 0, 0.7176471, 1, 1,
0.07972661, -0.06887397, 1.749868, 0, 0.7137255, 1, 1,
0.08862177, -0.3888035, 3.451446, 0, 0.7058824, 1, 1,
0.08983716, -0.7688614, 1.092422, 0, 0.6980392, 1, 1,
0.08985457, 0.2834047, 0.3646089, 0, 0.6941177, 1, 1,
0.09027422, -0.05999366, 2.537989, 0, 0.6862745, 1, 1,
0.09574716, -0.519872, 3.996739, 0, 0.682353, 1, 1,
0.09597404, -0.1352592, 0.9880679, 0, 0.6745098, 1, 1,
0.09741512, 1.414708, -0.7298982, 0, 0.6705883, 1, 1,
0.09931172, 1.575929, -0.01749144, 0, 0.6627451, 1, 1,
0.09943978, 0.8856459, 0.7456206, 0, 0.6588235, 1, 1,
0.1004529, -1.077038, 2.267452, 0, 0.6509804, 1, 1,
0.1028614, 1.274323, 1.626454, 0, 0.6470588, 1, 1,
0.1035634, -0.4687964, 3.321114, 0, 0.6392157, 1, 1,
0.1046449, -0.04026592, 2.132958, 0, 0.6352941, 1, 1,
0.104647, 1.278142, 1.246598, 0, 0.627451, 1, 1,
0.104778, 0.2814884, 0.5794496, 0, 0.6235294, 1, 1,
0.1057158, 0.885152, -1.225026, 0, 0.6156863, 1, 1,
0.1062604, 2.242115, 1.167072, 0, 0.6117647, 1, 1,
0.1121933, -0.3771774, 2.9249, 0, 0.6039216, 1, 1,
0.1136652, 1.534609, 0.8082392, 0, 0.5960785, 1, 1,
0.1143423, -0.1987685, 3.522924, 0, 0.5921569, 1, 1,
0.1149006, -1.003297, 2.599866, 0, 0.5843138, 1, 1,
0.1175336, 0.05420583, -0.3757277, 0, 0.5803922, 1, 1,
0.1205101, 0.5659627, -0.7650716, 0, 0.572549, 1, 1,
0.1206141, -0.5611219, 2.527698, 0, 0.5686275, 1, 1,
0.1210001, -2.292447, 3.069089, 0, 0.5607843, 1, 1,
0.1224582, 0.845272, 0.1900605, 0, 0.5568628, 1, 1,
0.1251084, -0.4275423, 3.300439, 0, 0.5490196, 1, 1,
0.1256584, -0.223499, 2.22737, 0, 0.5450981, 1, 1,
0.1283645, 0.4686988, 2.201372, 0, 0.5372549, 1, 1,
0.1317522, -0.6699271, 3.520443, 0, 0.5333334, 1, 1,
0.1324431, -1.650586, 3.54249, 0, 0.5254902, 1, 1,
0.1389422, 0.143169, 1.457608, 0, 0.5215687, 1, 1,
0.1428596, 0.261733, 0.651293, 0, 0.5137255, 1, 1,
0.1451473, 0.1714681, 0.4248076, 0, 0.509804, 1, 1,
0.1482042, 1.045218, 1.547969, 0, 0.5019608, 1, 1,
0.1483241, -0.3573314, 2.498135, 0, 0.4941176, 1, 1,
0.1495148, -2.127555, 2.98718, 0, 0.4901961, 1, 1,
0.1516642, -0.03893824, 2.945642, 0, 0.4823529, 1, 1,
0.1553264, -0.9993533, 4.076171, 0, 0.4784314, 1, 1,
0.1691166, 1.35774, 0.3404842, 0, 0.4705882, 1, 1,
0.1795462, 0.1476116, 1.074806, 0, 0.4666667, 1, 1,
0.1795732, -0.4333635, 3.532838, 0, 0.4588235, 1, 1,
0.181589, 0.1239299, 2.446138, 0, 0.454902, 1, 1,
0.1836283, 0.8020176, 0.9953976, 0, 0.4470588, 1, 1,
0.1836457, -0.2381955, 2.842761, 0, 0.4431373, 1, 1,
0.1853935, 0.1308058, -0.7051458, 0, 0.4352941, 1, 1,
0.1865875, 0.303716, 0.3455115, 0, 0.4313726, 1, 1,
0.1883073, -1.231237, 3.347916, 0, 0.4235294, 1, 1,
0.1951521, -0.3764801, 1.733216, 0, 0.4196078, 1, 1,
0.1968843, 0.9458163, 0.9967726, 0, 0.4117647, 1, 1,
0.206633, 0.36881, -0.5958316, 0, 0.4078431, 1, 1,
0.2096731, 0.7230984, 0.2241892, 0, 0.4, 1, 1,
0.20977, 0.2460003, 2.247489, 0, 0.3921569, 1, 1,
0.212131, -1.802828, 3.55214, 0, 0.3882353, 1, 1,
0.21827, 0.5993308, 1.251819, 0, 0.3803922, 1, 1,
0.2183567, -0.03077949, 0.01533364, 0, 0.3764706, 1, 1,
0.2204977, -1.90435, 3.922699, 0, 0.3686275, 1, 1,
0.2253541, -0.5112274, 0.9250335, 0, 0.3647059, 1, 1,
0.2273552, 0.9324008, -0.372713, 0, 0.3568628, 1, 1,
0.2405587, 0.1295418, 0.314538, 0, 0.3529412, 1, 1,
0.2415893, -0.4103012, 3.32743, 0, 0.345098, 1, 1,
0.244532, 0.2023678, 2.606862, 0, 0.3411765, 1, 1,
0.2456723, 0.04420974, 0.8777186, 0, 0.3333333, 1, 1,
0.2541358, 0.1838068, 0.3967832, 0, 0.3294118, 1, 1,
0.2567084, -0.2078478, 2.800492, 0, 0.3215686, 1, 1,
0.257943, 0.06273189, -0.1156967, 0, 0.3176471, 1, 1,
0.2586427, -1.531569, 3.060001, 0, 0.3098039, 1, 1,
0.2588389, -1.822127, 3.293162, 0, 0.3058824, 1, 1,
0.2593862, 0.7675241, 2.029598, 0, 0.2980392, 1, 1,
0.263553, 1.302281, -0.4971833, 0, 0.2901961, 1, 1,
0.2643928, 1.604857, 1.553592, 0, 0.2862745, 1, 1,
0.2662226, 1.001745, 0.653787, 0, 0.2784314, 1, 1,
0.2664078, -0.749657, 2.255689, 0, 0.2745098, 1, 1,
0.2668965, 0.7332084, 2.061308, 0, 0.2666667, 1, 1,
0.2674645, 0.4969003, -0.7584535, 0, 0.2627451, 1, 1,
0.2683333, -1.473981, 4.402676, 0, 0.254902, 1, 1,
0.2685855, -0.6309348, 3.055655, 0, 0.2509804, 1, 1,
0.272056, 0.2800746, 1.540048, 0, 0.2431373, 1, 1,
0.2745573, 0.01349717, 2.72852, 0, 0.2392157, 1, 1,
0.2767413, 1.208375, -1.408131, 0, 0.2313726, 1, 1,
0.2780939, 0.206727, 1.772117, 0, 0.227451, 1, 1,
0.2795802, -0.01076289, 2.726548, 0, 0.2196078, 1, 1,
0.2806932, 0.6543468, 2.678811, 0, 0.2156863, 1, 1,
0.2859113, -0.2825577, 3.781432, 0, 0.2078431, 1, 1,
0.2861734, 0.651377, 0.09360024, 0, 0.2039216, 1, 1,
0.291654, -0.09890211, 0.9631572, 0, 0.1960784, 1, 1,
0.292232, -0.4944191, 3.334928, 0, 0.1882353, 1, 1,
0.3013104, 0.9561197, -0.1750637, 0, 0.1843137, 1, 1,
0.3047308, 0.8815639, 1.201638, 0, 0.1764706, 1, 1,
0.3063774, -0.4257967, 2.405379, 0, 0.172549, 1, 1,
0.3081227, -0.5472369, 2.188406, 0, 0.1647059, 1, 1,
0.310211, 0.03756868, 0.646351, 0, 0.1607843, 1, 1,
0.3118415, 1.079238, -0.1755094, 0, 0.1529412, 1, 1,
0.3189161, 0.2085196, 1.49438, 0, 0.1490196, 1, 1,
0.3191494, 0.3595149, 1.823392, 0, 0.1411765, 1, 1,
0.3199935, 0.06588742, 0.502377, 0, 0.1372549, 1, 1,
0.3203419, -1.127054, 2.257357, 0, 0.1294118, 1, 1,
0.3265224, -0.321198, 1.301749, 0, 0.1254902, 1, 1,
0.3272008, 0.264662, 0.8942046, 0, 0.1176471, 1, 1,
0.3456384, 0.2343401, 2.013471, 0, 0.1137255, 1, 1,
0.3458047, -0.3409727, 2.356379, 0, 0.1058824, 1, 1,
0.3470095, -0.3623189, 2.496703, 0, 0.09803922, 1, 1,
0.3534273, -0.3105257, 2.250546, 0, 0.09411765, 1, 1,
0.3605789, -1.377886, 1.928821, 0, 0.08627451, 1, 1,
0.3610056, -0.2654714, 2.195009, 0, 0.08235294, 1, 1,
0.3623246, -0.02547609, 0.5657064, 0, 0.07450981, 1, 1,
0.3626089, -0.3270706, 2.426151, 0, 0.07058824, 1, 1,
0.3637448, 1.668281, 1.313059, 0, 0.0627451, 1, 1,
0.371457, -0.2532173, 1.928643, 0, 0.05882353, 1, 1,
0.3735568, 0.4478065, 1.855968, 0, 0.05098039, 1, 1,
0.3751897, 0.0001085188, 2.575638, 0, 0.04705882, 1, 1,
0.3774638, -1.302132, 2.442857, 0, 0.03921569, 1, 1,
0.3800695, -1.837725, 1.274616, 0, 0.03529412, 1, 1,
0.3801964, 0.08286017, 1.834746, 0, 0.02745098, 1, 1,
0.3832787, 0.4658179, 0.6525387, 0, 0.02352941, 1, 1,
0.3851188, 0.7018502, 0.5809295, 0, 0.01568628, 1, 1,
0.3854161, 0.6216733, 0.005101758, 0, 0.01176471, 1, 1,
0.3855106, 0.8720387, -0.1751339, 0, 0.003921569, 1, 1,
0.3878362, 1.383753, -0.389043, 0.003921569, 0, 1, 1,
0.3891491, 1.866739, 0.3340028, 0.007843138, 0, 1, 1,
0.3945068, -1.073262, 3.719005, 0.01568628, 0, 1, 1,
0.3960773, -0.568046, 2.41123, 0.01960784, 0, 1, 1,
0.396785, -0.1716305, 3.56321, 0.02745098, 0, 1, 1,
0.3979401, 0.1474042, 2.335884, 0.03137255, 0, 1, 1,
0.3979696, -0.6651899, 2.536881, 0.03921569, 0, 1, 1,
0.3995928, 1.041091, -0.4074986, 0.04313726, 0, 1, 1,
0.4010717, -0.8500056, 1.488079, 0.05098039, 0, 1, 1,
0.4050857, 0.4780211, -0.1093718, 0.05490196, 0, 1, 1,
0.4051986, 0.3952532, 1.136572, 0.0627451, 0, 1, 1,
0.4059614, -0.6076707, 2.829066, 0.06666667, 0, 1, 1,
0.4079885, 1.07723, 0.9604939, 0.07450981, 0, 1, 1,
0.4082794, 0.2659486, 1.109239, 0.07843138, 0, 1, 1,
0.4084131, -0.3152953, 2.754917, 0.08627451, 0, 1, 1,
0.4125142, 1.442329, 1.367553, 0.09019608, 0, 1, 1,
0.4144805, 0.7839245, 0.6371876, 0.09803922, 0, 1, 1,
0.4185809, 1.291941, 0.3679811, 0.1058824, 0, 1, 1,
0.4192032, -0.3328557, 3.728976, 0.1098039, 0, 1, 1,
0.419323, -1.184504, 2.84206, 0.1176471, 0, 1, 1,
0.4218072, -0.5524946, 3.285838, 0.1215686, 0, 1, 1,
0.4258915, 0.4600453, 2.399347, 0.1294118, 0, 1, 1,
0.4259421, 0.1702392, 1.120978, 0.1333333, 0, 1, 1,
0.4259643, -0.2103435, 1.45438, 0.1411765, 0, 1, 1,
0.4266387, 0.5666107, 0.136428, 0.145098, 0, 1, 1,
0.4273611, 0.5500543, 1.293093, 0.1529412, 0, 1, 1,
0.4288139, -0.2092551, 2.33589, 0.1568628, 0, 1, 1,
0.435971, -0.138904, 3.522941, 0.1647059, 0, 1, 1,
0.4361402, -0.5888166, 2.005677, 0.1686275, 0, 1, 1,
0.4365402, -0.171934, 2.065373, 0.1764706, 0, 1, 1,
0.4380852, 0.1240485, 0.3412464, 0.1803922, 0, 1, 1,
0.4420095, -1.236278, 2.800804, 0.1882353, 0, 1, 1,
0.4463811, 0.7970365, 0.5163255, 0.1921569, 0, 1, 1,
0.449844, -0.6019863, 2.719949, 0.2, 0, 1, 1,
0.4499227, 0.3537792, 1.769352, 0.2078431, 0, 1, 1,
0.4509254, -1.218578, 2.643595, 0.2117647, 0, 1, 1,
0.4524318, 0.3000699, 1.331326, 0.2196078, 0, 1, 1,
0.4530652, -1.216969, 3.529972, 0.2235294, 0, 1, 1,
0.4604381, 1.821455, 0.5493997, 0.2313726, 0, 1, 1,
0.4658091, 0.6815575, -0.5969756, 0.2352941, 0, 1, 1,
0.4685571, -0.7925618, 0.621992, 0.2431373, 0, 1, 1,
0.4709807, -0.4911979, 3.963541, 0.2470588, 0, 1, 1,
0.476362, 0.3990261, 1.027852, 0.254902, 0, 1, 1,
0.4809718, 1.529612, 3.52324, 0.2588235, 0, 1, 1,
0.4820724, 0.5656999, 0.6898972, 0.2666667, 0, 1, 1,
0.485053, 0.3011248, 0.6433547, 0.2705882, 0, 1, 1,
0.4857503, -0.69584, 3.880164, 0.2784314, 0, 1, 1,
0.4873593, 0.606563, 1.910926, 0.282353, 0, 1, 1,
0.4894295, 0.2131366, 1.435826, 0.2901961, 0, 1, 1,
0.4904761, 0.9600511, 0.8347612, 0.2941177, 0, 1, 1,
0.4905295, -0.4304893, 3.900021, 0.3019608, 0, 1, 1,
0.4926458, 0.3182664, 0.7074866, 0.3098039, 0, 1, 1,
0.4961584, -0.1261798, 2.467886, 0.3137255, 0, 1, 1,
0.4998649, 0.8197021, 2.785689, 0.3215686, 0, 1, 1,
0.4999372, 0.6268706, 0.9050623, 0.3254902, 0, 1, 1,
0.5000014, -0.1717569, 3.375612, 0.3333333, 0, 1, 1,
0.5003463, 0.1537685, 1.424713, 0.3372549, 0, 1, 1,
0.5066851, 1.285521, -0.06740589, 0.345098, 0, 1, 1,
0.5116596, 0.08585332, 2.016613, 0.3490196, 0, 1, 1,
0.5140067, -0.226358, 2.108722, 0.3568628, 0, 1, 1,
0.5190872, 0.9707541, 0.8743328, 0.3607843, 0, 1, 1,
0.5217753, -0.4440339, 3.088859, 0.3686275, 0, 1, 1,
0.5224686, 0.8665959, -0.1491414, 0.372549, 0, 1, 1,
0.52733, 0.2569321, 0.4623517, 0.3803922, 0, 1, 1,
0.5276631, 0.05345491, 4.131577, 0.3843137, 0, 1, 1,
0.539259, -0.1859588, 1.646067, 0.3921569, 0, 1, 1,
0.5497467, 1.501773, 2.161552, 0.3960784, 0, 1, 1,
0.5532347, -0.05676101, 1.579042, 0.4039216, 0, 1, 1,
0.5533828, 1.078972, -1.390276, 0.4117647, 0, 1, 1,
0.557245, 1.133583, 1.386647, 0.4156863, 0, 1, 1,
0.5581993, -0.1499971, 2.019073, 0.4235294, 0, 1, 1,
0.5679265, 0.9646946, 2.284654, 0.427451, 0, 1, 1,
0.5691494, 1.543893, 0.2764659, 0.4352941, 0, 1, 1,
0.5831915, 0.8557077, -0.6597244, 0.4392157, 0, 1, 1,
0.5842053, 0.7543684, 0.7280533, 0.4470588, 0, 1, 1,
0.5856844, -2.541162, 2.792253, 0.4509804, 0, 1, 1,
0.588282, 1.160144, -1.146255, 0.4588235, 0, 1, 1,
0.5885423, -0.9243154, 0.8774998, 0.4627451, 0, 1, 1,
0.5890183, -0.2573641, 2.769461, 0.4705882, 0, 1, 1,
0.5907208, 0.3693546, 2.168153, 0.4745098, 0, 1, 1,
0.590925, 0.1149123, 1.158529, 0.4823529, 0, 1, 1,
0.5949395, 0.492133, 0.9752691, 0.4862745, 0, 1, 1,
0.5967215, 0.8944288, 0.553211, 0.4941176, 0, 1, 1,
0.6025121, 0.006456041, 1.335507, 0.5019608, 0, 1, 1,
0.6027446, -0.6257344, 0.04152405, 0.5058824, 0, 1, 1,
0.603, -1.282871, 1.778824, 0.5137255, 0, 1, 1,
0.6036835, 0.6204333, 0.9025356, 0.5176471, 0, 1, 1,
0.6064108, -0.08175883, 0.14302, 0.5254902, 0, 1, 1,
0.6064744, -0.250047, 1.917575, 0.5294118, 0, 1, 1,
0.6074038, -0.6789253, 3.510222, 0.5372549, 0, 1, 1,
0.6088641, -2.549272, 1.942235, 0.5411765, 0, 1, 1,
0.6135278, 0.5057108, 0.9187049, 0.5490196, 0, 1, 1,
0.6236667, -0.1003087, 2.472173, 0.5529412, 0, 1, 1,
0.6255212, -0.5166305, 3.409517, 0.5607843, 0, 1, 1,
0.6260768, -0.1399373, 3.257097, 0.5647059, 0, 1, 1,
0.6261075, -0.2460096, 3.530155, 0.572549, 0, 1, 1,
0.6318758, -0.03139566, 2.300401, 0.5764706, 0, 1, 1,
0.6363412, 0.006043384, 3.208756, 0.5843138, 0, 1, 1,
0.6392961, 0.3096594, 2.433842, 0.5882353, 0, 1, 1,
0.646278, 1.178486, 0.972661, 0.5960785, 0, 1, 1,
0.6482391, -0.5361024, 2.987029, 0.6039216, 0, 1, 1,
0.6551062, 0.9221207, -0.132594, 0.6078432, 0, 1, 1,
0.6598594, 1.28884, -0.7967811, 0.6156863, 0, 1, 1,
0.6627402, -2.289871, 1.798804, 0.6196079, 0, 1, 1,
0.6643752, -1.157076, 2.309006, 0.627451, 0, 1, 1,
0.6655877, -0.4545192, 2.975048, 0.6313726, 0, 1, 1,
0.6715326, -0.2581646, 2.887553, 0.6392157, 0, 1, 1,
0.6787753, -0.3165249, 1.93717, 0.6431373, 0, 1, 1,
0.6792687, 0.5686179, 1.970319, 0.6509804, 0, 1, 1,
0.6803929, -0.3519289, 2.301886, 0.654902, 0, 1, 1,
0.6844217, -0.6124988, 2.234274, 0.6627451, 0, 1, 1,
0.6874188, -0.7099727, 3.160534, 0.6666667, 0, 1, 1,
0.6874492, -0.9151009, 2.641837, 0.6745098, 0, 1, 1,
0.6938178, -0.2893354, 2.886164, 0.6784314, 0, 1, 1,
0.6964042, -0.916656, 1.736435, 0.6862745, 0, 1, 1,
0.700061, -0.3775413, 1.864507, 0.6901961, 0, 1, 1,
0.7020665, 0.9962521, -0.2265352, 0.6980392, 0, 1, 1,
0.7024231, -1.121919, 0.7107221, 0.7058824, 0, 1, 1,
0.7035758, 0.2199693, 1.197495, 0.7098039, 0, 1, 1,
0.7159873, -1.2212, 1.915721, 0.7176471, 0, 1, 1,
0.7193245, -0.3263785, 1.235551, 0.7215686, 0, 1, 1,
0.7256704, -0.0338677, 1.106237, 0.7294118, 0, 1, 1,
0.7335845, 0.08094127, 0.4334261, 0.7333333, 0, 1, 1,
0.7361894, -0.8715535, 3.054566, 0.7411765, 0, 1, 1,
0.7411558, -0.2892963, 0.2351211, 0.7450981, 0, 1, 1,
0.7420811, -0.9887921, 3.175825, 0.7529412, 0, 1, 1,
0.7429042, 0.2575098, 2.590013, 0.7568628, 0, 1, 1,
0.7429385, 0.2304017, 1.329745, 0.7647059, 0, 1, 1,
0.7446477, 0.8699447, 0.2900851, 0.7686275, 0, 1, 1,
0.7449687, -1.105094, 2.644713, 0.7764706, 0, 1, 1,
0.7463762, 1.63059, 0.4567696, 0.7803922, 0, 1, 1,
0.7464547, -0.7255315, 1.798862, 0.7882353, 0, 1, 1,
0.7511151, -0.005354554, -0.3374138, 0.7921569, 0, 1, 1,
0.751415, 0.2951052, 0.4994619, 0.8, 0, 1, 1,
0.7540486, -0.0640243, 0.6947494, 0.8078431, 0, 1, 1,
0.7549706, 0.04937233, 3.530323, 0.8117647, 0, 1, 1,
0.7572821, 0.783107, -0.5359468, 0.8196079, 0, 1, 1,
0.7614109, -1.182432, 3.503097, 0.8235294, 0, 1, 1,
0.7662546, -0.3151509, 2.265394, 0.8313726, 0, 1, 1,
0.7668506, -1.060732, 3.451784, 0.8352941, 0, 1, 1,
0.7689022, -1.423201, 3.963804, 0.8431373, 0, 1, 1,
0.7731732, 1.077881, 0.2041695, 0.8470588, 0, 1, 1,
0.7758704, 1.457804, 1.205045, 0.854902, 0, 1, 1,
0.7797706, -0.7632995, 4.310734, 0.8588235, 0, 1, 1,
0.7799978, 0.6903239, 2.523811, 0.8666667, 0, 1, 1,
0.7841901, 0.03809023, 1.411938, 0.8705882, 0, 1, 1,
0.7848916, -0.0100185, 2.472789, 0.8784314, 0, 1, 1,
0.785803, 0.7622195, 1.038806, 0.8823529, 0, 1, 1,
0.7869146, -0.1741205, 1.84167, 0.8901961, 0, 1, 1,
0.7904614, 1.695221, 2.746465, 0.8941177, 0, 1, 1,
0.7928675, 1.582561, -0.7015735, 0.9019608, 0, 1, 1,
0.8017099, -0.9422594, 2.183675, 0.9098039, 0, 1, 1,
0.8108619, -0.1220383, 2.144759, 0.9137255, 0, 1, 1,
0.8172379, 0.2316528, 0.264298, 0.9215686, 0, 1, 1,
0.8204538, 0.08272119, 1.942624, 0.9254902, 0, 1, 1,
0.820489, -0.2866971, 4.531113, 0.9333333, 0, 1, 1,
0.8230383, -0.1884354, 1.213387, 0.9372549, 0, 1, 1,
0.8304476, -1.263294, 3.034285, 0.945098, 0, 1, 1,
0.8328177, 1.545045, 0.7035371, 0.9490196, 0, 1, 1,
0.8347998, -0.05177957, 1.767588, 0.9568627, 0, 1, 1,
0.8431764, 1.685066, 0.7170104, 0.9607843, 0, 1, 1,
0.8534006, -2.127535, 2.2848, 0.9686275, 0, 1, 1,
0.8538498, -1.741594, 3.034513, 0.972549, 0, 1, 1,
0.8544239, -0.9129544, 3.508313, 0.9803922, 0, 1, 1,
0.8558872, -0.2442731, 2.565023, 0.9843137, 0, 1, 1,
0.8684826, 0.2040465, 1.552056, 0.9921569, 0, 1, 1,
0.8689557, -2.768291, 3.630996, 0.9960784, 0, 1, 1,
0.8696622, 0.4115931, 0.5807361, 1, 0, 0.9960784, 1,
0.8737954, -1.16097, 3.078539, 1, 0, 0.9882353, 1,
0.8740062, 0.5594944, 0.07595526, 1, 0, 0.9843137, 1,
0.8785549, -0.8686994, 1.964772, 1, 0, 0.9764706, 1,
0.8785709, -0.8879077, 2.64147, 1, 0, 0.972549, 1,
0.8848156, 1.481941, 1.267165, 1, 0, 0.9647059, 1,
0.8871402, 0.2923531, 1.628884, 1, 0, 0.9607843, 1,
0.889416, -0.2776262, 1.77881, 1, 0, 0.9529412, 1,
0.8904899, -0.6557506, -0.0686639, 1, 0, 0.9490196, 1,
0.8908851, 0.2679458, 0.2359518, 1, 0, 0.9411765, 1,
0.8935773, 1.3809, 0.9212548, 1, 0, 0.9372549, 1,
0.8968574, 1.259668, 1.554988, 1, 0, 0.9294118, 1,
0.8980503, -0.9522347, 3.219209, 1, 0, 0.9254902, 1,
0.8983785, 1.926313, 0.8682693, 1, 0, 0.9176471, 1,
0.900637, 0.2083352, -0.1380403, 1, 0, 0.9137255, 1,
0.9048193, -0.01635564, 2.02935, 1, 0, 0.9058824, 1,
0.9124624, -1.126893, 2.213326, 1, 0, 0.9019608, 1,
0.9138753, 1.346233, -0.6191619, 1, 0, 0.8941177, 1,
0.9145764, -0.4630919, 1.716687, 1, 0, 0.8862745, 1,
0.9210361, 2.061573, 0.172446, 1, 0, 0.8823529, 1,
0.9233277, -0.01978713, 1.18848, 1, 0, 0.8745098, 1,
0.9352913, -0.1126461, 2.071247, 1, 0, 0.8705882, 1,
0.9438355, 0.5108675, 1.464265, 1, 0, 0.8627451, 1,
0.9500807, -0.9689154, 1.32116, 1, 0, 0.8588235, 1,
0.9501241, 1.167731, 1.761513, 1, 0, 0.8509804, 1,
0.9513705, -0.09365622, 1.49811, 1, 0, 0.8470588, 1,
0.9761059, 0.4227779, 2.587569, 1, 0, 0.8392157, 1,
0.9762601, 0.6880811, 1.477989, 1, 0, 0.8352941, 1,
0.9805756, -0.2709372, 1.153703, 1, 0, 0.827451, 1,
0.983664, -0.3673975, 3.020212, 1, 0, 0.8235294, 1,
0.9899586, -0.969446, 1.802765, 1, 0, 0.8156863, 1,
0.9930609, 0.005631548, 1.096586, 1, 0, 0.8117647, 1,
0.9975031, -0.1064515, 2.841661, 1, 0, 0.8039216, 1,
0.9989442, -2.585691, 2.081615, 1, 0, 0.7960784, 1,
1.023169, 0.8565637, 0.4224204, 1, 0, 0.7921569, 1,
1.028699, 0.4830344, -0.1804398, 1, 0, 0.7843137, 1,
1.03664, 0.4110385, 1.991352, 1, 0, 0.7803922, 1,
1.039242, -2.309242, 2.884501, 1, 0, 0.772549, 1,
1.042851, 0.5670564, 2.036026, 1, 0, 0.7686275, 1,
1.045265, 0.8184378, 0.7278523, 1, 0, 0.7607843, 1,
1.049914, 0.6526159, 2.45675, 1, 0, 0.7568628, 1,
1.069625, -0.25541, 1.912793, 1, 0, 0.7490196, 1,
1.082924, -1.754613, 3.390118, 1, 0, 0.7450981, 1,
1.084289, -0.2789631, 1.945961, 1, 0, 0.7372549, 1,
1.092494, -0.8337418, 1.22021, 1, 0, 0.7333333, 1,
1.105101, 0.1545883, 2.005944, 1, 0, 0.7254902, 1,
1.106052, 0.8211511, 0.4407196, 1, 0, 0.7215686, 1,
1.121453, -1.218891, 1.655567, 1, 0, 0.7137255, 1,
1.122717, -1.624874, 1.694539, 1, 0, 0.7098039, 1,
1.125358, -0.2513824, 2.550721, 1, 0, 0.7019608, 1,
1.127287, -0.8367466, 1.334384, 1, 0, 0.6941177, 1,
1.131245, 0.7701978, 0.9330842, 1, 0, 0.6901961, 1,
1.137584, -0.07132541, 2.938158, 1, 0, 0.682353, 1,
1.14096, -1.433743, 2.007388, 1, 0, 0.6784314, 1,
1.14349, 0.7764216, 2.342908, 1, 0, 0.6705883, 1,
1.145111, 0.55065, -0.09483085, 1, 0, 0.6666667, 1,
1.146385, 0.9216492, 0.5219724, 1, 0, 0.6588235, 1,
1.149769, -1.223237, 0.0573545, 1, 0, 0.654902, 1,
1.151899, 0.3235259, 0.7387627, 1, 0, 0.6470588, 1,
1.155389, -0.9728113, 2.15083, 1, 0, 0.6431373, 1,
1.163508, -0.6822664, 4.102154, 1, 0, 0.6352941, 1,
1.17302, 0.8267713, 0.3944903, 1, 0, 0.6313726, 1,
1.173772, 1.735446, 0.7294971, 1, 0, 0.6235294, 1,
1.174134, -0.4823905, 3.719331, 1, 0, 0.6196079, 1,
1.178988, -0.5189294, 0.6547437, 1, 0, 0.6117647, 1,
1.183415, 0.03949017, -0.1949948, 1, 0, 0.6078432, 1,
1.200896, -0.7240605, 2.894673, 1, 0, 0.6, 1,
1.201134, 1.363416, -0.06984524, 1, 0, 0.5921569, 1,
1.202628, -0.5738245, 3.030758, 1, 0, 0.5882353, 1,
1.208993, -1.733758, 1.581823, 1, 0, 0.5803922, 1,
1.218004, -0.779482, 5.304815, 1, 0, 0.5764706, 1,
1.235243, -0.2613637, 0.3774718, 1, 0, 0.5686275, 1,
1.238926, 1.404781, 0.8589894, 1, 0, 0.5647059, 1,
1.249924, 1.422175, -0.8848873, 1, 0, 0.5568628, 1,
1.250358, 1.238673, 2.517595, 1, 0, 0.5529412, 1,
1.257782, -1.605134, 2.643328, 1, 0, 0.5450981, 1,
1.258486, -0.1920766, 2.214496, 1, 0, 0.5411765, 1,
1.270721, -0.5154594, 1.916271, 1, 0, 0.5333334, 1,
1.287048, 0.2227041, 0.9100061, 1, 0, 0.5294118, 1,
1.287187, -0.5745907, 2.633962, 1, 0, 0.5215687, 1,
1.314768, 0.2462167, 2.899312, 1, 0, 0.5176471, 1,
1.318321, -0.3985832, 2.366411, 1, 0, 0.509804, 1,
1.332262, 0.06369688, 2.705678, 1, 0, 0.5058824, 1,
1.336179, -2.079873, 2.657411, 1, 0, 0.4980392, 1,
1.341964, 2.031692, -0.7642418, 1, 0, 0.4901961, 1,
1.347975, -1.780883, 2.257619, 1, 0, 0.4862745, 1,
1.348261, 1.264021, 2.472895, 1, 0, 0.4784314, 1,
1.357815, -1.180488, 3.241551, 1, 0, 0.4745098, 1,
1.359294, -0.6864625, 3.210387, 1, 0, 0.4666667, 1,
1.369941, 0.4391674, 0.7652162, 1, 0, 0.4627451, 1,
1.391217, -0.9290526, 2.065704, 1, 0, 0.454902, 1,
1.395174, 0.9336016, 0.4355102, 1, 0, 0.4509804, 1,
1.402874, -0.5397231, 1.37121, 1, 0, 0.4431373, 1,
1.404366, -0.2128109, 1.646928, 1, 0, 0.4392157, 1,
1.409126, 1.374026, 1.318616, 1, 0, 0.4313726, 1,
1.417267, 1.469073, 1.269832, 1, 0, 0.427451, 1,
1.418566, -0.6981298, 3.769551, 1, 0, 0.4196078, 1,
1.427794, -1.723234, 1.951805, 1, 0, 0.4156863, 1,
1.430338, 2.097759, 1.815631, 1, 0, 0.4078431, 1,
1.43705, 0.03358094, 1.291221, 1, 0, 0.4039216, 1,
1.442016, -0.4009353, 1.881247, 1, 0, 0.3960784, 1,
1.442297, 1.416284, -0.5952483, 1, 0, 0.3882353, 1,
1.443865, 1.000982, -0.01878591, 1, 0, 0.3843137, 1,
1.4538, -1.092368, 1.76438, 1, 0, 0.3764706, 1,
1.475541, 0.0437861, 1.877993, 1, 0, 0.372549, 1,
1.482508, -0.5785705, 2.692045, 1, 0, 0.3647059, 1,
1.488679, -0.129515, 0.9063751, 1, 0, 0.3607843, 1,
1.501221, 0.1178726, 1.202314, 1, 0, 0.3529412, 1,
1.505669, 0.08852489, 1.99905, 1, 0, 0.3490196, 1,
1.508824, -0.02649204, 1.001837, 1, 0, 0.3411765, 1,
1.511708, 0.8067216, 1.480009, 1, 0, 0.3372549, 1,
1.518986, 0.1345132, 1.204591, 1, 0, 0.3294118, 1,
1.543761, -0.7829171, 2.771618, 1, 0, 0.3254902, 1,
1.544329, 0.2828602, 0.2939824, 1, 0, 0.3176471, 1,
1.54523, -0.242483, 2.571513, 1, 0, 0.3137255, 1,
1.558393, -0.3810507, -0.7207144, 1, 0, 0.3058824, 1,
1.573019, 1.842819, 1.814948, 1, 0, 0.2980392, 1,
1.589225, -2.178715, 3.103755, 1, 0, 0.2941177, 1,
1.598486, -0.120826, 1.068944, 1, 0, 0.2862745, 1,
1.606552, -1.19838, 1.204027, 1, 0, 0.282353, 1,
1.607783, -0.05746679, 1.279849, 1, 0, 0.2745098, 1,
1.634235, 0.4371677, 1.164446, 1, 0, 0.2705882, 1,
1.640523, -0.3616773, 1.728155, 1, 0, 0.2627451, 1,
1.672073, -0.9233842, 0.864688, 1, 0, 0.2588235, 1,
1.672932, -1.486733, 2.122399, 1, 0, 0.2509804, 1,
1.680282, 0.4402652, 0.7268826, 1, 0, 0.2470588, 1,
1.681784, -0.7851896, 1.762946, 1, 0, 0.2392157, 1,
1.694379, -2.575362, 1.932985, 1, 0, 0.2352941, 1,
1.712899, -0.3294714, 2.620165, 1, 0, 0.227451, 1,
1.721848, 0.2041396, 2.021131, 1, 0, 0.2235294, 1,
1.725038, -0.247198, 3.482407, 1, 0, 0.2156863, 1,
1.76274, 3.167162, 1.815381, 1, 0, 0.2117647, 1,
1.766243, -0.1505038, 2.166384, 1, 0, 0.2039216, 1,
1.768849, 0.02610167, 0.8419012, 1, 0, 0.1960784, 1,
1.769829, 0.9975652, 0.8133371, 1, 0, 0.1921569, 1,
1.785507, 0.645697, 2.13593, 1, 0, 0.1843137, 1,
1.786509, -1.242059, 0.2844607, 1, 0, 0.1803922, 1,
1.790007, 1.808765, 2.176235, 1, 0, 0.172549, 1,
1.832502, 0.5239369, 0.1485773, 1, 0, 0.1686275, 1,
1.853982, -0.6700287, 2.149483, 1, 0, 0.1607843, 1,
1.85921, 1.147539, -0.09863532, 1, 0, 0.1568628, 1,
1.865542, -0.09541608, 0.4622828, 1, 0, 0.1490196, 1,
1.893421, 0.954667, 2.035309, 1, 0, 0.145098, 1,
1.903695, 1.375938, 0.3316965, 1, 0, 0.1372549, 1,
1.906706, -0.7355498, 2.245315, 1, 0, 0.1333333, 1,
1.912195, -0.8190368, 0.6287861, 1, 0, 0.1254902, 1,
1.917183, -0.1748432, 2.40919, 1, 0, 0.1215686, 1,
1.92105, 0.5582954, -0.5453244, 1, 0, 0.1137255, 1,
1.955132, 2.581086, -0.2077703, 1, 0, 0.1098039, 1,
1.972331, 1.120561, -0.3238056, 1, 0, 0.1019608, 1,
1.976947, 0.4811095, -0.08050705, 1, 0, 0.09411765, 1,
1.994355, 0.5773197, 4.284759, 1, 0, 0.09019608, 1,
2.098776, -0.243513, 2.170126, 1, 0, 0.08235294, 1,
2.119568, 0.2710948, 2.276598, 1, 0, 0.07843138, 1,
2.167688, -1.171272, 1.313249, 1, 0, 0.07058824, 1,
2.17569, 1.360022, 2.024126, 1, 0, 0.06666667, 1,
2.244924, -0.8383429, 3.777453, 1, 0, 0.05882353, 1,
2.280797, -0.720355, 3.384327, 1, 0, 0.05490196, 1,
2.324581, -0.2319995, -0.03143496, 1, 0, 0.04705882, 1,
2.354586, 2.028159, 0.4076695, 1, 0, 0.04313726, 1,
2.395355, 0.2858044, -0.2816137, 1, 0, 0.03529412, 1,
2.414495, 0.1001421, 1.354525, 1, 0, 0.03137255, 1,
2.588571, 0.5230172, 4.170043, 1, 0, 0.02352941, 1,
2.654971, -0.6621541, 1.521364, 1, 0, 0.01960784, 1,
2.678042, -1.985218, 1.890654, 1, 0, 0.01176471, 1,
2.899726, -0.1523318, 1.011081, 1, 0, 0.007843138, 1
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
-0.1764135, -3.883442, -7.409163, 0, -0.5, 0.5, 0.5,
-0.1764135, -3.883442, -7.409163, 1, -0.5, 0.5, 0.5,
-0.1764135, -3.883442, -7.409163, 1, 1.5, 0.5, 0.5,
-0.1764135, -3.883442, -7.409163, 0, 1.5, 0.5, 0.5
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
-4.295365, 0.1527954, -7.409163, 0, -0.5, 0.5, 0.5,
-4.295365, 0.1527954, -7.409163, 1, -0.5, 0.5, 0.5,
-4.295365, 0.1527954, -7.409163, 1, 1.5, 0.5, 0.5,
-4.295365, 0.1527954, -7.409163, 0, 1.5, 0.5, 0.5
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
-4.295365, -3.883442, -0.1308317, 0, -0.5, 0.5, 0.5,
-4.295365, -3.883442, -0.1308317, 1, -0.5, 0.5, 0.5,
-4.295365, -3.883442, -0.1308317, 1, 1.5, 0.5, 0.5,
-4.295365, -3.883442, -0.1308317, 0, 1.5, 0.5, 0.5
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
-3, -2.952002, -5.729548,
2, -2.952002, -5.729548,
-3, -2.952002, -5.729548,
-3, -3.107242, -6.009483,
-2, -2.952002, -5.729548,
-2, -3.107242, -6.009483,
-1, -2.952002, -5.729548,
-1, -3.107242, -6.009483,
0, -2.952002, -5.729548,
0, -3.107242, -6.009483,
1, -2.952002, -5.729548,
1, -3.107242, -6.009483,
2, -2.952002, -5.729548,
2, -3.107242, -6.009483
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
-3, -3.417722, -6.569355, 0, -0.5, 0.5, 0.5,
-3, -3.417722, -6.569355, 1, -0.5, 0.5, 0.5,
-3, -3.417722, -6.569355, 1, 1.5, 0.5, 0.5,
-3, -3.417722, -6.569355, 0, 1.5, 0.5, 0.5,
-2, -3.417722, -6.569355, 0, -0.5, 0.5, 0.5,
-2, -3.417722, -6.569355, 1, -0.5, 0.5, 0.5,
-2, -3.417722, -6.569355, 1, 1.5, 0.5, 0.5,
-2, -3.417722, -6.569355, 0, 1.5, 0.5, 0.5,
-1, -3.417722, -6.569355, 0, -0.5, 0.5, 0.5,
-1, -3.417722, -6.569355, 1, -0.5, 0.5, 0.5,
-1, -3.417722, -6.569355, 1, 1.5, 0.5, 0.5,
-1, -3.417722, -6.569355, 0, 1.5, 0.5, 0.5,
0, -3.417722, -6.569355, 0, -0.5, 0.5, 0.5,
0, -3.417722, -6.569355, 1, -0.5, 0.5, 0.5,
0, -3.417722, -6.569355, 1, 1.5, 0.5, 0.5,
0, -3.417722, -6.569355, 0, 1.5, 0.5, 0.5,
1, -3.417722, -6.569355, 0, -0.5, 0.5, 0.5,
1, -3.417722, -6.569355, 1, -0.5, 0.5, 0.5,
1, -3.417722, -6.569355, 1, 1.5, 0.5, 0.5,
1, -3.417722, -6.569355, 0, 1.5, 0.5, 0.5,
2, -3.417722, -6.569355, 0, -0.5, 0.5, 0.5,
2, -3.417722, -6.569355, 1, -0.5, 0.5, 0.5,
2, -3.417722, -6.569355, 1, 1.5, 0.5, 0.5,
2, -3.417722, -6.569355, 0, 1.5, 0.5, 0.5
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
-3.344838, -2, -5.729548,
-3.344838, 3, -5.729548,
-3.344838, -2, -5.729548,
-3.503259, -2, -6.009483,
-3.344838, -1, -5.729548,
-3.503259, -1, -6.009483,
-3.344838, 0, -5.729548,
-3.503259, 0, -6.009483,
-3.344838, 1, -5.729548,
-3.503259, 1, -6.009483,
-3.344838, 2, -5.729548,
-3.503259, 2, -6.009483,
-3.344838, 3, -5.729548,
-3.503259, 3, -6.009483
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
-3.820101, -2, -6.569355, 0, -0.5, 0.5, 0.5,
-3.820101, -2, -6.569355, 1, -0.5, 0.5, 0.5,
-3.820101, -2, -6.569355, 1, 1.5, 0.5, 0.5,
-3.820101, -2, -6.569355, 0, 1.5, 0.5, 0.5,
-3.820101, -1, -6.569355, 0, -0.5, 0.5, 0.5,
-3.820101, -1, -6.569355, 1, -0.5, 0.5, 0.5,
-3.820101, -1, -6.569355, 1, 1.5, 0.5, 0.5,
-3.820101, -1, -6.569355, 0, 1.5, 0.5, 0.5,
-3.820101, 0, -6.569355, 0, -0.5, 0.5, 0.5,
-3.820101, 0, -6.569355, 1, -0.5, 0.5, 0.5,
-3.820101, 0, -6.569355, 1, 1.5, 0.5, 0.5,
-3.820101, 0, -6.569355, 0, 1.5, 0.5, 0.5,
-3.820101, 1, -6.569355, 0, -0.5, 0.5, 0.5,
-3.820101, 1, -6.569355, 1, -0.5, 0.5, 0.5,
-3.820101, 1, -6.569355, 1, 1.5, 0.5, 0.5,
-3.820101, 1, -6.569355, 0, 1.5, 0.5, 0.5,
-3.820101, 2, -6.569355, 0, -0.5, 0.5, 0.5,
-3.820101, 2, -6.569355, 1, -0.5, 0.5, 0.5,
-3.820101, 2, -6.569355, 1, 1.5, 0.5, 0.5,
-3.820101, 2, -6.569355, 0, 1.5, 0.5, 0.5,
-3.820101, 3, -6.569355, 0, -0.5, 0.5, 0.5,
-3.820101, 3, -6.569355, 1, -0.5, 0.5, 0.5,
-3.820101, 3, -6.569355, 1, 1.5, 0.5, 0.5,
-3.820101, 3, -6.569355, 0, 1.5, 0.5, 0.5
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
-3.344838, -2.952002, -4,
-3.344838, -2.952002, 4,
-3.344838, -2.952002, -4,
-3.503259, -3.107242, -4,
-3.344838, -2.952002, -2,
-3.503259, -3.107242, -2,
-3.344838, -2.952002, 0,
-3.503259, -3.107242, 0,
-3.344838, -2.952002, 2,
-3.503259, -3.107242, 2,
-3.344838, -2.952002, 4,
-3.503259, -3.107242, 4
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
-3.820101, -3.417722, -4, 0, -0.5, 0.5, 0.5,
-3.820101, -3.417722, -4, 1, -0.5, 0.5, 0.5,
-3.820101, -3.417722, -4, 1, 1.5, 0.5, 0.5,
-3.820101, -3.417722, -4, 0, 1.5, 0.5, 0.5,
-3.820101, -3.417722, -2, 0, -0.5, 0.5, 0.5,
-3.820101, -3.417722, -2, 1, -0.5, 0.5, 0.5,
-3.820101, -3.417722, -2, 1, 1.5, 0.5, 0.5,
-3.820101, -3.417722, -2, 0, 1.5, 0.5, 0.5,
-3.820101, -3.417722, 0, 0, -0.5, 0.5, 0.5,
-3.820101, -3.417722, 0, 1, -0.5, 0.5, 0.5,
-3.820101, -3.417722, 0, 1, 1.5, 0.5, 0.5,
-3.820101, -3.417722, 0, 0, 1.5, 0.5, 0.5,
-3.820101, -3.417722, 2, 0, -0.5, 0.5, 0.5,
-3.820101, -3.417722, 2, 1, -0.5, 0.5, 0.5,
-3.820101, -3.417722, 2, 1, 1.5, 0.5, 0.5,
-3.820101, -3.417722, 2, 0, 1.5, 0.5, 0.5,
-3.820101, -3.417722, 4, 0, -0.5, 0.5, 0.5,
-3.820101, -3.417722, 4, 1, -0.5, 0.5, 0.5,
-3.820101, -3.417722, 4, 1, 1.5, 0.5, 0.5,
-3.820101, -3.417722, 4, 0, 1.5, 0.5, 0.5
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
-3.344838, -2.952002, -5.729548,
-3.344838, 3.257593, -5.729548,
-3.344838, -2.952002, 5.467884,
-3.344838, 3.257593, 5.467884,
-3.344838, -2.952002, -5.729548,
-3.344838, -2.952002, 5.467884,
-3.344838, 3.257593, -5.729548,
-3.344838, 3.257593, 5.467884,
-3.344838, -2.952002, -5.729548,
2.992011, -2.952002, -5.729548,
-3.344838, -2.952002, 5.467884,
2.992011, -2.952002, 5.467884,
-3.344838, 3.257593, -5.729548,
2.992011, 3.257593, -5.729548,
-3.344838, 3.257593, 5.467884,
2.992011, 3.257593, 5.467884,
2.992011, -2.952002, -5.729548,
2.992011, 3.257593, -5.729548,
2.992011, -2.952002, 5.467884,
2.992011, 3.257593, 5.467884,
2.992011, -2.952002, -5.729548,
2.992011, -2.952002, 5.467884,
2.992011, 3.257593, -5.729548,
2.992011, 3.257593, 5.467884
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
var radius = 7.628585;
var distance = 33.94044;
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
mvMatrix.translate( 0.1764135, -0.1527954, 0.1308317 );
mvMatrix.scale( 1.301621, 1.328295, 0.7366132 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.94044);
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


