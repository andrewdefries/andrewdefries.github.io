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
-4.406254, 1.205573, 0.9167702, 1, 0, 0, 1,
-2.606902, -0.8678526, -3.025207, 1, 0.007843138, 0, 1,
-2.424659, -0.08457858, 0.2351703, 1, 0.01176471, 0, 1,
-2.409979, -1.281383, -3.591377, 1, 0.01960784, 0, 1,
-2.360225, 0.6338627, -1.824214, 1, 0.02352941, 0, 1,
-2.300973, 0.3634977, -1.701912, 1, 0.03137255, 0, 1,
-2.279309, 0.7058402, -1.137743, 1, 0.03529412, 0, 1,
-2.277818, -1.737794, -3.336155, 1, 0.04313726, 0, 1,
-2.275919, 1.754724, -0.7663496, 1, 0.04705882, 0, 1,
-2.27505, 0.2172292, -1.778231, 1, 0.05490196, 0, 1,
-2.262174, -0.5568906, -2.460899, 1, 0.05882353, 0, 1,
-2.235019, 0.3985667, -2.944757, 1, 0.06666667, 0, 1,
-2.223149, 0.7274497, -2.276595, 1, 0.07058824, 0, 1,
-2.204506, -0.3200045, 0.1398296, 1, 0.07843138, 0, 1,
-2.188854, -1.612859, -3.332528, 1, 0.08235294, 0, 1,
-2.15563, 0.1711605, -0.158663, 1, 0.09019608, 0, 1,
-2.13712, 0.5168367, 0.1621804, 1, 0.09411765, 0, 1,
-2.127352, -1.94529, -4.419947, 1, 0.1019608, 0, 1,
-2.089646, -0.943275, -2.026386, 1, 0.1098039, 0, 1,
-2.082462, 0.6153511, -0.8105984, 1, 0.1137255, 0, 1,
-2.070769, -0.4799506, -1.783392, 1, 0.1215686, 0, 1,
-2.061423, 1.240187, -2.264776, 1, 0.1254902, 0, 1,
-2.030507, -0.2802304, 0.2211413, 1, 0.1333333, 0, 1,
-2.02604, -2.597917, -1.035013, 1, 0.1372549, 0, 1,
-2.011103, 0.2082965, -2.793633, 1, 0.145098, 0, 1,
-2.004659, -0.9049321, -2.473694, 1, 0.1490196, 0, 1,
-1.988976, 1.194626, -2.224575, 1, 0.1568628, 0, 1,
-1.988643, -1.114129, -4.053604, 1, 0.1607843, 0, 1,
-1.971923, 0.7285061, 0.04903912, 1, 0.1686275, 0, 1,
-1.959134, 0.1533037, -0.2355636, 1, 0.172549, 0, 1,
-1.938688, -1.657761, -3.413197, 1, 0.1803922, 0, 1,
-1.937345, -1.34786, -3.133862, 1, 0.1843137, 0, 1,
-1.929136, -1.659111, -2.265067, 1, 0.1921569, 0, 1,
-1.922886, 1.022265, 0.07291463, 1, 0.1960784, 0, 1,
-1.922456, -0.2516442, -2.402101, 1, 0.2039216, 0, 1,
-1.916758, -1.665193, -3.149894, 1, 0.2117647, 0, 1,
-1.906486, 1.543705, -1.702682, 1, 0.2156863, 0, 1,
-1.905857, 1.386093, 1.066301, 1, 0.2235294, 0, 1,
-1.89988, 0.8062286, -2.674735, 1, 0.227451, 0, 1,
-1.896517, 1.151226, -0.5199035, 1, 0.2352941, 0, 1,
-1.841787, -1.064838, -1.881097, 1, 0.2392157, 0, 1,
-1.799952, 0.5800189, -1.349457, 1, 0.2470588, 0, 1,
-1.789747, 0.2701712, -0.6915394, 1, 0.2509804, 0, 1,
-1.753431, -0.2110214, -2.283991, 1, 0.2588235, 0, 1,
-1.747735, -0.8149053, -1.950396, 1, 0.2627451, 0, 1,
-1.743156, -1.004573, -1.916991, 1, 0.2705882, 0, 1,
-1.713306, 0.8419284, -1.542927, 1, 0.2745098, 0, 1,
-1.706958, 0.1146455, -3.662812, 1, 0.282353, 0, 1,
-1.690717, -0.481369, -1.159556, 1, 0.2862745, 0, 1,
-1.690694, 0.7848634, -0.4295771, 1, 0.2941177, 0, 1,
-1.670471, 0.5454744, -1.824033, 1, 0.3019608, 0, 1,
-1.66753, 1.316613, -0.6366528, 1, 0.3058824, 0, 1,
-1.656255, -0.9564114, -1.256162, 1, 0.3137255, 0, 1,
-1.653033, -0.5333265, 0.07094754, 1, 0.3176471, 0, 1,
-1.652455, 0.9480439, -1.060569, 1, 0.3254902, 0, 1,
-1.649277, 0.5163878, -0.3731598, 1, 0.3294118, 0, 1,
-1.634643, -0.1043538, -1.766271, 1, 0.3372549, 0, 1,
-1.624057, -0.9524163, -1.607849, 1, 0.3411765, 0, 1,
-1.619866, 1.142139, -1.005247, 1, 0.3490196, 0, 1,
-1.615635, -1.01434, -3.163601, 1, 0.3529412, 0, 1,
-1.61534, -1.044746, -2.525048, 1, 0.3607843, 0, 1,
-1.606027, -0.7143836, -0.7245072, 1, 0.3647059, 0, 1,
-1.605241, 0.5162655, -1.277082, 1, 0.372549, 0, 1,
-1.60366, 0.4971955, -2.078975, 1, 0.3764706, 0, 1,
-1.587336, -0.7039632, -0.6696425, 1, 0.3843137, 0, 1,
-1.581518, 0.1738224, -2.393047, 1, 0.3882353, 0, 1,
-1.539497, 1.289228, -1.734351, 1, 0.3960784, 0, 1,
-1.537532, 3.159739, -0.3650497, 1, 0.4039216, 0, 1,
-1.533778, -1.075889, -2.233612, 1, 0.4078431, 0, 1,
-1.532244, -0.03997372, -1.617902, 1, 0.4156863, 0, 1,
-1.508645, 0.337397, -1.928543, 1, 0.4196078, 0, 1,
-1.500913, 0.1021071, -1.500024, 1, 0.427451, 0, 1,
-1.500335, 0.9104542, -1.641141, 1, 0.4313726, 0, 1,
-1.471658, -0.6852403, -2.276632, 1, 0.4392157, 0, 1,
-1.458092, 1.007979, -1.487388, 1, 0.4431373, 0, 1,
-1.450852, 0.0920554, -0.4242002, 1, 0.4509804, 0, 1,
-1.446255, -0.6631928, -1.235651, 1, 0.454902, 0, 1,
-1.43915, 1.373667, 0.4584306, 1, 0.4627451, 0, 1,
-1.429592, 1.502694, -0.4404144, 1, 0.4666667, 0, 1,
-1.423871, -0.512681, -3.282944, 1, 0.4745098, 0, 1,
-1.413931, -1.222741, -1.171807, 1, 0.4784314, 0, 1,
-1.407442, 1.108267, -1.349546, 1, 0.4862745, 0, 1,
-1.401355, -0.2181686, -1.43064, 1, 0.4901961, 0, 1,
-1.394292, -2.897365, -4.570159, 1, 0.4980392, 0, 1,
-1.382288, -0.4245167, -0.8167284, 1, 0.5058824, 0, 1,
-1.376806, -1.668413, -1.042236, 1, 0.509804, 0, 1,
-1.371457, 0.9955894, -0.1428535, 1, 0.5176471, 0, 1,
-1.367831, -1.278056, -2.029936, 1, 0.5215687, 0, 1,
-1.34798, -0.4807337, -0.2361411, 1, 0.5294118, 0, 1,
-1.334352, 0.2076379, -1.809708, 1, 0.5333334, 0, 1,
-1.331586, 0.3444993, -1.055106, 1, 0.5411765, 0, 1,
-1.330443, -0.984821, -1.829599, 1, 0.5450981, 0, 1,
-1.319281, 0.846998, -1.164401, 1, 0.5529412, 0, 1,
-1.31831, -1.188522, -1.754849, 1, 0.5568628, 0, 1,
-1.318078, 0.1586167, -1.140702, 1, 0.5647059, 0, 1,
-1.31541, -0.843848, -2.633994, 1, 0.5686275, 0, 1,
-1.300919, 1.027812, -2.835944, 1, 0.5764706, 0, 1,
-1.294097, 0.9808864, -1.316814, 1, 0.5803922, 0, 1,
-1.290018, 0.1411681, -0.683066, 1, 0.5882353, 0, 1,
-1.285167, -2.792989, -4.615729, 1, 0.5921569, 0, 1,
-1.278264, -0.9052061, -1.164976, 1, 0.6, 0, 1,
-1.275802, 0.2654615, -1.509646, 1, 0.6078432, 0, 1,
-1.265849, 0.6127524, -1.658963, 1, 0.6117647, 0, 1,
-1.265504, 0.4996978, -1.451545, 1, 0.6196079, 0, 1,
-1.26199, -0.7898906, -3.364769, 1, 0.6235294, 0, 1,
-1.251698, -0.9599074, -2.134977, 1, 0.6313726, 0, 1,
-1.238585, 0.9130576, 0.92488, 1, 0.6352941, 0, 1,
-1.237533, -0.003505255, -2.649374, 1, 0.6431373, 0, 1,
-1.236917, 1.149781, -1.968869, 1, 0.6470588, 0, 1,
-1.233492, 1.423206, -2.942228, 1, 0.654902, 0, 1,
-1.228714, -0.05743467, -0.6442041, 1, 0.6588235, 0, 1,
-1.222698, 1.212439, 1.173953, 1, 0.6666667, 0, 1,
-1.204047, -0.6676801, -2.114789, 1, 0.6705883, 0, 1,
-1.203919, 0.9592188, -0.8912404, 1, 0.6784314, 0, 1,
-1.193763, -0.9596518, -2.568327, 1, 0.682353, 0, 1,
-1.186976, 1.233215, -1.032046, 1, 0.6901961, 0, 1,
-1.184422, -0.2084204, -1.346224, 1, 0.6941177, 0, 1,
-1.180235, 0.3722948, -1.58392, 1, 0.7019608, 0, 1,
-1.177805, -0.558982, -1.164421, 1, 0.7098039, 0, 1,
-1.169393, 0.2997119, -1.999522, 1, 0.7137255, 0, 1,
-1.160347, -1.18766, -1.031157, 1, 0.7215686, 0, 1,
-1.153877, -1.663725, -2.962986, 1, 0.7254902, 0, 1,
-1.14783, -0.6944609, -1.897107, 1, 0.7333333, 0, 1,
-1.138032, 0.04304208, -1.765054, 1, 0.7372549, 0, 1,
-1.135431, -2.362262, -2.678107, 1, 0.7450981, 0, 1,
-1.134582, -0.2386889, -0.8940577, 1, 0.7490196, 0, 1,
-1.133277, 0.06844792, -1.657816, 1, 0.7568628, 0, 1,
-1.132972, -0.2022255, -1.220293, 1, 0.7607843, 0, 1,
-1.128924, 0.946986, -1.508162, 1, 0.7686275, 0, 1,
-1.122347, -0.04293718, -0.6306654, 1, 0.772549, 0, 1,
-1.113584, 0.4393706, -0.002876481, 1, 0.7803922, 0, 1,
-1.099503, -1.053525, -3.510998, 1, 0.7843137, 0, 1,
-1.099393, -0.4710248, -1.703871, 1, 0.7921569, 0, 1,
-1.093828, -0.388453, -0.6054603, 1, 0.7960784, 0, 1,
-1.090801, -0.3086415, -3.377427, 1, 0.8039216, 0, 1,
-1.081956, -0.7024203, -0.3245803, 1, 0.8117647, 0, 1,
-1.080957, 0.1162115, -0.5281129, 1, 0.8156863, 0, 1,
-1.079207, -1.480203, -2.611591, 1, 0.8235294, 0, 1,
-1.069399, 0.911572, -2.689085, 1, 0.827451, 0, 1,
-1.06457, -0.2453171, 0.2707345, 1, 0.8352941, 0, 1,
-1.062652, -1.265174, -4.140882, 1, 0.8392157, 0, 1,
-1.057049, 0.02252059, -2.946925, 1, 0.8470588, 0, 1,
-1.055267, 0.9543006, 0.6478716, 1, 0.8509804, 0, 1,
-1.054689, -1.093102, -0.9639989, 1, 0.8588235, 0, 1,
-1.052626, -1.764744, -2.954259, 1, 0.8627451, 0, 1,
-1.050693, -0.7012292, -3.229753, 1, 0.8705882, 0, 1,
-1.043352, 1.575545, -1.351981, 1, 0.8745098, 0, 1,
-1.03277, -1.525684, -3.443814, 1, 0.8823529, 0, 1,
-1.030231, 0.08676, -2.273615, 1, 0.8862745, 0, 1,
-1.02711, 1.420361, -2.050557, 1, 0.8941177, 0, 1,
-1.025674, 1.483547, -0.3932343, 1, 0.8980392, 0, 1,
-1.023686, 0.8612797, -0.9631936, 1, 0.9058824, 0, 1,
-1.014028, -0.7842389, -2.414979, 1, 0.9137255, 0, 1,
-1.008509, 0.3523999, -5.260076, 1, 0.9176471, 0, 1,
-1.006517, 0.4141428, -2.175946, 1, 0.9254902, 0, 1,
-1.004692, -0.6043238, -1.979281, 1, 0.9294118, 0, 1,
-0.9992138, -2.657757, -3.277048, 1, 0.9372549, 0, 1,
-0.9970085, 1.824703, -0.4626975, 1, 0.9411765, 0, 1,
-0.9929424, -0.6548746, -0.03124284, 1, 0.9490196, 0, 1,
-0.989418, 0.3925431, -2.861773, 1, 0.9529412, 0, 1,
-0.9814186, -1.689648, -1.031745, 1, 0.9607843, 0, 1,
-0.9802093, -1.859593, -3.461368, 1, 0.9647059, 0, 1,
-0.9759164, 1.093035, -2.762486, 1, 0.972549, 0, 1,
-0.9753647, -1.317448, -0.2852317, 1, 0.9764706, 0, 1,
-0.9694667, 1.683421, -1.985828, 1, 0.9843137, 0, 1,
-0.9677937, -1.184775, -2.861926, 1, 0.9882353, 0, 1,
-0.9606749, 0.6667206, -0.4181716, 1, 0.9960784, 0, 1,
-0.9603116, 0.08036221, -1.149346, 0.9960784, 1, 0, 1,
-0.9591203, 0.1235602, -1.579195, 0.9921569, 1, 0, 1,
-0.9512916, -1.004426, -2.658696, 0.9843137, 1, 0, 1,
-0.9460644, -0.07059419, -1.238299, 0.9803922, 1, 0, 1,
-0.9441765, 0.9737199, -0.4481137, 0.972549, 1, 0, 1,
-0.930723, 0.133914, -1.115545, 0.9686275, 1, 0, 1,
-0.9292809, 0.5840195, -1.56033, 0.9607843, 1, 0, 1,
-0.9275498, 2.52411, -0.8773072, 0.9568627, 1, 0, 1,
-0.9266185, -0.8633734, -3.130017, 0.9490196, 1, 0, 1,
-0.9225335, -1.160238, -3.422843, 0.945098, 1, 0, 1,
-0.9087374, 0.9365005, -2.540535, 0.9372549, 1, 0, 1,
-0.9020603, -0.03716226, -1.414636, 0.9333333, 1, 0, 1,
-0.9019448, 0.7491012, -0.05404501, 0.9254902, 1, 0, 1,
-0.8986639, -0.5611269, -2.594731, 0.9215686, 1, 0, 1,
-0.8919811, -0.6180393, -2.515144, 0.9137255, 1, 0, 1,
-0.8904561, 0.7718844, -1.2228, 0.9098039, 1, 0, 1,
-0.8868414, 1.09552, -1.267653, 0.9019608, 1, 0, 1,
-0.8855098, 1.014533, 0.3618851, 0.8941177, 1, 0, 1,
-0.8816555, -0.8657635, -1.050143, 0.8901961, 1, 0, 1,
-0.8806304, 0.5749581, -0.1967775, 0.8823529, 1, 0, 1,
-0.8762745, -2.514987, -2.881901, 0.8784314, 1, 0, 1,
-0.8723117, -0.1227026, -2.217612, 0.8705882, 1, 0, 1,
-0.8703188, -1.549739, -0.6758816, 0.8666667, 1, 0, 1,
-0.8675848, 0.1991669, -2.578032, 0.8588235, 1, 0, 1,
-0.8661734, -1.260732, -2.370268, 0.854902, 1, 0, 1,
-0.8656703, 1.338133, -1.39827, 0.8470588, 1, 0, 1,
-0.8626891, 0.5117501, -0.5753089, 0.8431373, 1, 0, 1,
-0.8594811, 0.2162602, -1.290597, 0.8352941, 1, 0, 1,
-0.8552006, -0.5112932, -0.9946581, 0.8313726, 1, 0, 1,
-0.8542625, -0.2878437, -1.008251, 0.8235294, 1, 0, 1,
-0.8508109, 0.2904988, 0.03388362, 0.8196079, 1, 0, 1,
-0.8475375, -0.4973193, -1.907359, 0.8117647, 1, 0, 1,
-0.8397163, 0.337506, -1.707814, 0.8078431, 1, 0, 1,
-0.8378652, -0.3007887, -0.6029143, 0.8, 1, 0, 1,
-0.8328348, -0.3889906, -1.334013, 0.7921569, 1, 0, 1,
-0.8255935, -0.3441063, -1.741491, 0.7882353, 1, 0, 1,
-0.8248665, 0.6953503, -0.8803637, 0.7803922, 1, 0, 1,
-0.8191122, 0.4477293, 1.058029, 0.7764706, 1, 0, 1,
-0.8190968, -0.7812613, -3.354955, 0.7686275, 1, 0, 1,
-0.8188651, -0.6260992, -1.369723, 0.7647059, 1, 0, 1,
-0.8150886, -0.2318188, -2.379867, 0.7568628, 1, 0, 1,
-0.8108169, 0.7309314, 0.1749039, 0.7529412, 1, 0, 1,
-0.8103225, -1.835697, -3.647969, 0.7450981, 1, 0, 1,
-0.8101709, -0.2631404, -1.210224, 0.7411765, 1, 0, 1,
-0.8096542, 0.3877083, -0.7336801, 0.7333333, 1, 0, 1,
-0.8013744, 2.031467, -1.10786, 0.7294118, 1, 0, 1,
-0.7975634, -0.1139586, -1.96991, 0.7215686, 1, 0, 1,
-0.788334, 0.6222407, -2.816194, 0.7176471, 1, 0, 1,
-0.7871125, 0.8172118, -0.1474679, 0.7098039, 1, 0, 1,
-0.7835091, -0.08029272, 0.3758638, 0.7058824, 1, 0, 1,
-0.7787955, -0.5269705, -2.263837, 0.6980392, 1, 0, 1,
-0.7786737, -0.4316096, -2.011123, 0.6901961, 1, 0, 1,
-0.7687771, 0.7575243, -0.250203, 0.6862745, 1, 0, 1,
-0.7587551, -0.07860705, -1.831563, 0.6784314, 1, 0, 1,
-0.7536904, -0.05570027, -0.485812, 0.6745098, 1, 0, 1,
-0.7522702, 1.224007, -2.722962, 0.6666667, 1, 0, 1,
-0.7439866, 0.1932748, -2.199809, 0.6627451, 1, 0, 1,
-0.7414969, 0.1211702, -1.306299, 0.654902, 1, 0, 1,
-0.735419, -0.3402497, -2.360068, 0.6509804, 1, 0, 1,
-0.7344194, -2.018354, -2.530085, 0.6431373, 1, 0, 1,
-0.7336901, -1.499058, -4.270364, 0.6392157, 1, 0, 1,
-0.7298988, -2.564178, -4.330543, 0.6313726, 1, 0, 1,
-0.7249854, -1.336619, -1.285742, 0.627451, 1, 0, 1,
-0.7214532, 1.400243, -1.315259, 0.6196079, 1, 0, 1,
-0.7202881, 0.1756691, -2.431365, 0.6156863, 1, 0, 1,
-0.7171546, 0.2816783, -0.6558169, 0.6078432, 1, 0, 1,
-0.7145378, -0.3137533, -0.1960676, 0.6039216, 1, 0, 1,
-0.7116429, -1.053509, -2.267077, 0.5960785, 1, 0, 1,
-0.7101058, -0.3073336, -1.776327, 0.5882353, 1, 0, 1,
-0.7093246, 0.3081689, -2.229925, 0.5843138, 1, 0, 1,
-0.7076594, 0.0157181, -1.881783, 0.5764706, 1, 0, 1,
-0.7069795, -0.7115051, -1.407195, 0.572549, 1, 0, 1,
-0.7035949, -1.326895, -1.975519, 0.5647059, 1, 0, 1,
-0.7000411, -0.902994, -3.641215, 0.5607843, 1, 0, 1,
-0.6981573, 0.8433356, -0.9657508, 0.5529412, 1, 0, 1,
-0.6980184, 0.6736481, -3.010288, 0.5490196, 1, 0, 1,
-0.6960753, -1.131588, -1.768694, 0.5411765, 1, 0, 1,
-0.6939723, 0.2637623, 0.5255368, 0.5372549, 1, 0, 1,
-0.6936271, -0.3349123, -1.706847, 0.5294118, 1, 0, 1,
-0.6921853, 1.917898, 0.5715637, 0.5254902, 1, 0, 1,
-0.690993, -1.679296, -3.497862, 0.5176471, 1, 0, 1,
-0.6904331, 0.06822087, -1.196802, 0.5137255, 1, 0, 1,
-0.6870283, -0.06060957, -3.5547, 0.5058824, 1, 0, 1,
-0.6777241, 0.6143702, 0.3251476, 0.5019608, 1, 0, 1,
-0.6750437, 0.4035758, -1.730404, 0.4941176, 1, 0, 1,
-0.6745606, -0.302176, -2.676515, 0.4862745, 1, 0, 1,
-0.6616265, -2.029416, -2.006989, 0.4823529, 1, 0, 1,
-0.6597706, -1.462593, -2.563496, 0.4745098, 1, 0, 1,
-0.659134, 1.874567, -0.826743, 0.4705882, 1, 0, 1,
-0.6570018, 0.2472593, -2.460165, 0.4627451, 1, 0, 1,
-0.6542854, -0.3437929, -0.6069453, 0.4588235, 1, 0, 1,
-0.6482738, -0.5892854, -1.612648, 0.4509804, 1, 0, 1,
-0.6457976, -0.480386, -2.893001, 0.4470588, 1, 0, 1,
-0.6425981, -0.8125927, -2.610883, 0.4392157, 1, 0, 1,
-0.6394596, -0.3943897, -4.242215, 0.4352941, 1, 0, 1,
-0.6381309, -0.4511907, -1.685939, 0.427451, 1, 0, 1,
-0.6322521, 0.2426431, -2.516344, 0.4235294, 1, 0, 1,
-0.6236573, 0.2546977, -0.916227, 0.4156863, 1, 0, 1,
-0.6232576, 1.103594, -0.2083574, 0.4117647, 1, 0, 1,
-0.6228856, 0.3289622, -1.491183, 0.4039216, 1, 0, 1,
-0.6070333, -0.4046234, -2.052598, 0.3960784, 1, 0, 1,
-0.6046958, -0.004685757, -3.286456, 0.3921569, 1, 0, 1,
-0.6029943, -1.484794, -4.840061, 0.3843137, 1, 0, 1,
-0.5988511, 0.2779335, -2.220263, 0.3803922, 1, 0, 1,
-0.596378, -1.062183, -1.788024, 0.372549, 1, 0, 1,
-0.5953647, -0.2974793, -3.620341, 0.3686275, 1, 0, 1,
-0.5941633, -0.7821193, -2.010658, 0.3607843, 1, 0, 1,
-0.5902618, 0.5859655, -1.053151, 0.3568628, 1, 0, 1,
-0.586777, 1.458349, -0.1082829, 0.3490196, 1, 0, 1,
-0.5860332, -1.485565, -4.312532, 0.345098, 1, 0, 1,
-0.5772184, -0.9910812, -1.831701, 0.3372549, 1, 0, 1,
-0.5769038, 0.01230154, -0.9585632, 0.3333333, 1, 0, 1,
-0.5726623, 0.8413655, 0.06814084, 0.3254902, 1, 0, 1,
-0.5713758, -1.308813, -4.402607, 0.3215686, 1, 0, 1,
-0.5672252, -0.5008461, -2.904234, 0.3137255, 1, 0, 1,
-0.5665411, -0.2672321, -2.358447, 0.3098039, 1, 0, 1,
-0.5660753, -0.745253, -2.68923, 0.3019608, 1, 0, 1,
-0.5633485, -0.1888115, -0.7975647, 0.2941177, 1, 0, 1,
-0.5621644, 0.3046497, -1.627028, 0.2901961, 1, 0, 1,
-0.5599367, -0.2085613, -1.698337, 0.282353, 1, 0, 1,
-0.5478081, -1.419897, -2.788038, 0.2784314, 1, 0, 1,
-0.5430664, -0.7368892, -2.395982, 0.2705882, 1, 0, 1,
-0.5427481, -0.6237697, -3.335407, 0.2666667, 1, 0, 1,
-0.5408329, 0.5279652, 0.9320449, 0.2588235, 1, 0, 1,
-0.539958, -0.05854039, -0.9253237, 0.254902, 1, 0, 1,
-0.5376266, -0.4771604, -2.489261, 0.2470588, 1, 0, 1,
-0.5187068, 0.6365091, -0.07916563, 0.2431373, 1, 0, 1,
-0.5159287, 0.5801408, -1.695424, 0.2352941, 1, 0, 1,
-0.5130365, -0.005158363, -3.286241, 0.2313726, 1, 0, 1,
-0.5100238, 1.334062, -1.916395, 0.2235294, 1, 0, 1,
-0.5068076, -0.6433382, -2.235701, 0.2196078, 1, 0, 1,
-0.5041016, 0.2914276, -1.15879, 0.2117647, 1, 0, 1,
-0.5040075, 0.01172097, -2.622594, 0.2078431, 1, 0, 1,
-0.4998603, -1.423482, -0.9652502, 0.2, 1, 0, 1,
-0.4959293, 0.1331199, -3.127797, 0.1921569, 1, 0, 1,
-0.4948531, -0.2263456, -3.265865, 0.1882353, 1, 0, 1,
-0.4858977, 0.02672141, -0.3791938, 0.1803922, 1, 0, 1,
-0.4858667, 0.6263083, -0.2807957, 0.1764706, 1, 0, 1,
-0.4831089, 0.2118134, -1.091119, 0.1686275, 1, 0, 1,
-0.4825698, -2.269388, -1.350173, 0.1647059, 1, 0, 1,
-0.47721, -0.2142783, -0.210311, 0.1568628, 1, 0, 1,
-0.4738264, 1.391928, -0.3537351, 0.1529412, 1, 0, 1,
-0.4677665, 0.5923675, 0.8481984, 0.145098, 1, 0, 1,
-0.4668856, -0.2393364, -2.100694, 0.1411765, 1, 0, 1,
-0.4653206, 0.1867094, -2.680506, 0.1333333, 1, 0, 1,
-0.4622193, -0.09352493, -4.100948, 0.1294118, 1, 0, 1,
-0.4617381, 0.1289644, -1.753197, 0.1215686, 1, 0, 1,
-0.4615082, 1.293802, 0.897724, 0.1176471, 1, 0, 1,
-0.4614993, 0.6503398, -0.8422875, 0.1098039, 1, 0, 1,
-0.4596868, 0.8155411, -0.1668475, 0.1058824, 1, 0, 1,
-0.4539611, -1.168507, -2.10697, 0.09803922, 1, 0, 1,
-0.4535445, 0.6978485, 0.9697146, 0.09019608, 1, 0, 1,
-0.4534592, -0.1062281, -1.430956, 0.08627451, 1, 0, 1,
-0.4509223, 1.367888, -2.183692, 0.07843138, 1, 0, 1,
-0.4500243, 0.6406388, -1.231211, 0.07450981, 1, 0, 1,
-0.4461491, -1.054425, -2.854676, 0.06666667, 1, 0, 1,
-0.44563, -0.5617459, -1.633451, 0.0627451, 1, 0, 1,
-0.4437184, 0.9562334, -1.57907, 0.05490196, 1, 0, 1,
-0.4423925, -1.297371, -1.914187, 0.05098039, 1, 0, 1,
-0.4407944, 2.620809, 0.3152998, 0.04313726, 1, 0, 1,
-0.4399831, -1.54576, -2.547748, 0.03921569, 1, 0, 1,
-0.4391181, 0.2376928, -0.6414408, 0.03137255, 1, 0, 1,
-0.4352731, 0.9436226, -1.375568, 0.02745098, 1, 0, 1,
-0.433703, 0.9544615, -0.03085564, 0.01960784, 1, 0, 1,
-0.4319104, 0.5049137, -1.505884, 0.01568628, 1, 0, 1,
-0.4299676, -1.7006, -4.375198, 0.007843138, 1, 0, 1,
-0.4255703, -0.2049341, -1.714277, 0.003921569, 1, 0, 1,
-0.4244305, -0.7336075, -3.035393, 0, 1, 0.003921569, 1,
-0.4238816, -0.2657888, -3.494803, 0, 1, 0.01176471, 1,
-0.4230831, -1.799883, -3.995988, 0, 1, 0.01568628, 1,
-0.4206187, 0.4926434, -0.5841045, 0, 1, 0.02352941, 1,
-0.419812, -0.7340282, -2.357481, 0, 1, 0.02745098, 1,
-0.4196393, -0.886184, -2.482851, 0, 1, 0.03529412, 1,
-0.4136982, 0.4559425, -0.5619776, 0, 1, 0.03921569, 1,
-0.4135537, 1.226261, -0.9153735, 0, 1, 0.04705882, 1,
-0.4118846, 1.145309, -1.2959, 0, 1, 0.05098039, 1,
-0.4101868, 0.3576966, -1.014938, 0, 1, 0.05882353, 1,
-0.4087348, -1.172667, -5.607168, 0, 1, 0.0627451, 1,
-0.4081652, -0.6143658, -2.802777, 0, 1, 0.07058824, 1,
-0.4074138, -0.612625, -1.785636, 0, 1, 0.07450981, 1,
-0.3982864, 0.540327, -1.933156, 0, 1, 0.08235294, 1,
-0.393725, -0.272656, -2.726928, 0, 1, 0.08627451, 1,
-0.3931114, -0.4623218, -2.23136, 0, 1, 0.09411765, 1,
-0.3919435, 0.894967, -0.6152541, 0, 1, 0.1019608, 1,
-0.3897687, 0.8760034, 0.5891439, 0, 1, 0.1058824, 1,
-0.3888662, 0.9888964, -1.088906, 0, 1, 0.1137255, 1,
-0.3828651, -0.2523901, -1.459697, 0, 1, 0.1176471, 1,
-0.3817542, 0.8486019, -1.870422, 0, 1, 0.1254902, 1,
-0.3770554, -0.4669352, -3.09922, 0, 1, 0.1294118, 1,
-0.3769631, 1.432378, 0.4384481, 0, 1, 0.1372549, 1,
-0.375936, 1.006204, 0.5017557, 0, 1, 0.1411765, 1,
-0.3694015, -0.7442753, -2.400576, 0, 1, 0.1490196, 1,
-0.3648386, 1.468287, -0.8539525, 0, 1, 0.1529412, 1,
-0.3638127, 0.285014, -1.181618, 0, 1, 0.1607843, 1,
-0.3627928, -0.352485, -1.45421, 0, 1, 0.1647059, 1,
-0.3622626, -0.4247625, -2.749325, 0, 1, 0.172549, 1,
-0.3577365, 1.193384, 1.694742, 0, 1, 0.1764706, 1,
-0.3559707, 0.4577281, -0.6837045, 0, 1, 0.1843137, 1,
-0.3530771, 0.04218341, -1.590183, 0, 1, 0.1882353, 1,
-0.352421, -0.6450631, -0.5836165, 0, 1, 0.1960784, 1,
-0.3454995, -0.3141777, 0.4544198, 0, 1, 0.2039216, 1,
-0.3443006, -0.6012186, -4.345228, 0, 1, 0.2078431, 1,
-0.3393871, -0.03383931, -2.797841, 0, 1, 0.2156863, 1,
-0.3391439, 0.9945425, -0.8374111, 0, 1, 0.2196078, 1,
-0.3383621, -0.2389992, -3.990747, 0, 1, 0.227451, 1,
-0.3310117, -1.461269, -3.846185, 0, 1, 0.2313726, 1,
-0.3292263, 1.16421, -0.516804, 0, 1, 0.2392157, 1,
-0.328547, 0.1070762, -2.687658, 0, 1, 0.2431373, 1,
-0.3284945, -0.3158067, -0.9598611, 0, 1, 0.2509804, 1,
-0.327508, 0.4532477, -1.164735, 0, 1, 0.254902, 1,
-0.3261346, -0.03625638, -2.782025, 0, 1, 0.2627451, 1,
-0.3228635, -0.3623614, -2.674693, 0, 1, 0.2666667, 1,
-0.3219954, -0.4380088, -2.888664, 0, 1, 0.2745098, 1,
-0.3217045, 0.02400299, -2.072649, 0, 1, 0.2784314, 1,
-0.3187861, -0.4701657, -2.182978, 0, 1, 0.2862745, 1,
-0.3154974, -1.043354, -1.678576, 0, 1, 0.2901961, 1,
-0.3124885, -0.05000106, -1.429247, 0, 1, 0.2980392, 1,
-0.3120291, 0.04721145, -1.622301, 0, 1, 0.3058824, 1,
-0.311508, 0.6784286, 0.1425727, 0, 1, 0.3098039, 1,
-0.3092667, -0.9534645, -2.575581, 0, 1, 0.3176471, 1,
-0.3054637, 2.000663, -0.581098, 0, 1, 0.3215686, 1,
-0.3024513, -1.042382, -3.400307, 0, 1, 0.3294118, 1,
-0.299996, 1.07087, -1.02246, 0, 1, 0.3333333, 1,
-0.2990916, -1.482718, -2.873469, 0, 1, 0.3411765, 1,
-0.2971599, -0.5125566, -4.120032, 0, 1, 0.345098, 1,
-0.2925073, -0.2886205, -1.226556, 0, 1, 0.3529412, 1,
-0.2816994, 1.333084, -0.08895132, 0, 1, 0.3568628, 1,
-0.2799291, -0.9176761, -3.333174, 0, 1, 0.3647059, 1,
-0.274348, -0.9050819, -1.596213, 0, 1, 0.3686275, 1,
-0.2723529, 1.810107, -0.654731, 0, 1, 0.3764706, 1,
-0.2712362, 1.186363, -1.611608, 0, 1, 0.3803922, 1,
-0.2706199, 0.4148889, -2.167142, 0, 1, 0.3882353, 1,
-0.2672498, -0.5480999, -2.762545, 0, 1, 0.3921569, 1,
-0.2672399, -0.1927888, -4.515699, 0, 1, 0.4, 1,
-0.2658169, 1.796131, -1.322076, 0, 1, 0.4078431, 1,
-0.2639076, 0.1219904, -2.618964, 0, 1, 0.4117647, 1,
-0.2621752, 0.2929704, -2.71414, 0, 1, 0.4196078, 1,
-0.2603422, -0.009590001, -0.3791772, 0, 1, 0.4235294, 1,
-0.2532817, 1.040435, -0.2179012, 0, 1, 0.4313726, 1,
-0.2525387, 0.4338887, -0.9878691, 0, 1, 0.4352941, 1,
-0.2452864, -0.9593197, -2.566593, 0, 1, 0.4431373, 1,
-0.2404292, 0.5456803, 0.03739939, 0, 1, 0.4470588, 1,
-0.2368206, 0.4816344, -0.5976145, 0, 1, 0.454902, 1,
-0.2302449, 0.294152, -0.9645686, 0, 1, 0.4588235, 1,
-0.2294544, -1.119556, -1.847685, 0, 1, 0.4666667, 1,
-0.2284525, -0.1797128, -1.745078, 0, 1, 0.4705882, 1,
-0.2276711, -1.607183, -3.95158, 0, 1, 0.4784314, 1,
-0.2202636, 0.9042622, -1.400415, 0, 1, 0.4823529, 1,
-0.2186238, 0.590668, -0.3664925, 0, 1, 0.4901961, 1,
-0.2037274, 0.2205533, -0.6324858, 0, 1, 0.4941176, 1,
-0.2022609, -1.80582, -3.386158, 0, 1, 0.5019608, 1,
-0.1985966, 0.3181093, -1.111591, 0, 1, 0.509804, 1,
-0.196298, 1.873788, 0.2418541, 0, 1, 0.5137255, 1,
-0.1962701, 0.7689646, -0.4856645, 0, 1, 0.5215687, 1,
-0.1879456, 0.8237112, 0.9738574, 0, 1, 0.5254902, 1,
-0.1876469, 0.1579218, 1.464785, 0, 1, 0.5333334, 1,
-0.1850463, 1.251848, 1.412323, 0, 1, 0.5372549, 1,
-0.184051, 0.07742894, -1.640823, 0, 1, 0.5450981, 1,
-0.1837267, 1.018455, 0.3262042, 0, 1, 0.5490196, 1,
-0.1779522, -0.6231503, -2.323438, 0, 1, 0.5568628, 1,
-0.1776086, -0.2577944, -3.04299, 0, 1, 0.5607843, 1,
-0.175742, 0.08803712, -2.664294, 0, 1, 0.5686275, 1,
-0.1719815, -0.7638997, -4.217761, 0, 1, 0.572549, 1,
-0.1708527, 1.082836, -0.4632872, 0, 1, 0.5803922, 1,
-0.168967, -0.5200799, -3.883475, 0, 1, 0.5843138, 1,
-0.1686626, -0.7235086, -4.770359, 0, 1, 0.5921569, 1,
-0.1653186, -0.8549135, -1.365132, 0, 1, 0.5960785, 1,
-0.1650194, 0.5129157, -0.475266, 0, 1, 0.6039216, 1,
-0.1610189, 1.766944, -1.15029, 0, 1, 0.6117647, 1,
-0.1574036, 0.1134521, -0.959782, 0, 1, 0.6156863, 1,
-0.1561051, -1.85453, -4.430047, 0, 1, 0.6235294, 1,
-0.1549367, 0.7363669, 1.066358, 0, 1, 0.627451, 1,
-0.1520254, 0.1038239, -1.145404, 0, 1, 0.6352941, 1,
-0.1504487, -0.05199702, -1.578984, 0, 1, 0.6392157, 1,
-0.1452168, 0.3515296, 0.3081967, 0, 1, 0.6470588, 1,
-0.1414722, 1.512658, -0.3934142, 0, 1, 0.6509804, 1,
-0.1414715, -0.2597331, -3.499614, 0, 1, 0.6588235, 1,
-0.140832, -0.9248691, -5.316577, 0, 1, 0.6627451, 1,
-0.1398034, -0.6714357, -4.066494, 0, 1, 0.6705883, 1,
-0.1372166, -1.526803, -3.346694, 0, 1, 0.6745098, 1,
-0.136187, -0.1571335, -1.074923, 0, 1, 0.682353, 1,
-0.1339818, 1.310007, 1.580055, 0, 1, 0.6862745, 1,
-0.1225376, 0.5827242, -0.152979, 0, 1, 0.6941177, 1,
-0.117473, -2.266984, -3.005549, 0, 1, 0.7019608, 1,
-0.1151784, -1.05449, -1.124786, 0, 1, 0.7058824, 1,
-0.112716, 1.21207, -1.864781, 0, 1, 0.7137255, 1,
-0.1120142, 0.3286262, 1.144362, 0, 1, 0.7176471, 1,
-0.1110772, -1.257636, -3.017995, 0, 1, 0.7254902, 1,
-0.1069551, -0.5853614, -3.678218, 0, 1, 0.7294118, 1,
-0.1031841, -0.8730041, -1.917195, 0, 1, 0.7372549, 1,
-0.1017039, -1.622477, -2.690078, 0, 1, 0.7411765, 1,
-0.0999663, -0.4406546, -0.195649, 0, 1, 0.7490196, 1,
-0.09725396, -0.7072347, -1.993981, 0, 1, 0.7529412, 1,
-0.09538405, -0.9403103, -2.627871, 0, 1, 0.7607843, 1,
-0.09531613, 1.027576, -0.1704717, 0, 1, 0.7647059, 1,
-0.09297232, -2.952307, -3.533574, 0, 1, 0.772549, 1,
-0.0918714, 2.3897, 0.7399995, 0, 1, 0.7764706, 1,
-0.08693355, -0.2621601, -5.707601, 0, 1, 0.7843137, 1,
-0.08144812, 1.770652, -0.594029, 0, 1, 0.7882353, 1,
-0.07665646, -1.111605, -4.036489, 0, 1, 0.7960784, 1,
-0.07558861, 0.01439756, -0.02721701, 0, 1, 0.8039216, 1,
-0.07361218, 0.6002771, -0.5344403, 0, 1, 0.8078431, 1,
-0.07154325, 0.1721948, -0.3433574, 0, 1, 0.8156863, 1,
-0.06764314, -0.4715106, -3.559391, 0, 1, 0.8196079, 1,
-0.06605318, -0.3320548, -1.441805, 0, 1, 0.827451, 1,
-0.06292259, -2.406106, -3.376694, 0, 1, 0.8313726, 1,
-0.0527852, 0.8128829, -0.3771344, 0, 1, 0.8392157, 1,
-0.05060738, 0.5815909, 0.839125, 0, 1, 0.8431373, 1,
-0.04638884, -1.39672, -2.993584, 0, 1, 0.8509804, 1,
-0.04386134, -0.5893638, -2.843013, 0, 1, 0.854902, 1,
-0.04110903, -0.1841303, -2.521474, 0, 1, 0.8627451, 1,
-0.03813433, -0.5531361, -4.026002, 0, 1, 0.8666667, 1,
-0.0370896, 0.9908708, -0.7568113, 0, 1, 0.8745098, 1,
-0.03678761, -0.9650825, -2.815004, 0, 1, 0.8784314, 1,
-0.02467388, -1.246447, -1.880476, 0, 1, 0.8862745, 1,
-0.02452122, -0.5736021, -3.523658, 0, 1, 0.8901961, 1,
-0.02172345, -0.4274962, -4.65646, 0, 1, 0.8980392, 1,
-0.02165995, 0.00624785, -1.833534, 0, 1, 0.9058824, 1,
-0.01412669, 1.647902, 1.529789, 0, 1, 0.9098039, 1,
-0.01382675, 0.1274457, 1.287656, 0, 1, 0.9176471, 1,
-0.00994604, -1.485213, -1.813411, 0, 1, 0.9215686, 1,
-0.008658681, 2.169062, 1.539055, 0, 1, 0.9294118, 1,
-0.008060572, 0.9823911, 1.36948, 0, 1, 0.9333333, 1,
-0.007984772, -0.3662594, -3.388018, 0, 1, 0.9411765, 1,
-0.005613098, -0.1022438, -1.673321, 0, 1, 0.945098, 1,
-0.002853928, 0.0143017, -1.519947, 0, 1, 0.9529412, 1,
-0.00184908, 0.6720151, 0.655161, 0, 1, 0.9568627, 1,
-0.001153424, -2.232643, -3.662607, 0, 1, 0.9647059, 1,
-0.0007321322, -0.178243, -3.602274, 0, 1, 0.9686275, 1,
0.009711587, 0.9031851, 0.1572672, 0, 1, 0.9764706, 1,
0.01026981, -2.469652, 3.531324, 0, 1, 0.9803922, 1,
0.01113906, -0.9228213, 3.145641, 0, 1, 0.9882353, 1,
0.01353903, -0.2252957, 3.064344, 0, 1, 0.9921569, 1,
0.01403489, 0.03583026, 1.549959, 0, 1, 1, 1,
0.01861404, -0.4314573, 4.014235, 0, 0.9921569, 1, 1,
0.01961706, -1.171616, 3.478954, 0, 0.9882353, 1, 1,
0.02040068, 0.3917439, 0.1516468, 0, 0.9803922, 1, 1,
0.02364579, -0.3650136, 4.450134, 0, 0.9764706, 1, 1,
0.02373889, 0.7278546, 0.3894256, 0, 0.9686275, 1, 1,
0.02960525, 1.399409, 1.683602, 0, 0.9647059, 1, 1,
0.03434477, -0.6891649, 1.55438, 0, 0.9568627, 1, 1,
0.03496867, -0.398266, 2.764135, 0, 0.9529412, 1, 1,
0.03504297, 0.1400868, -0.4915141, 0, 0.945098, 1, 1,
0.04010973, -1.450345, 2.692132, 0, 0.9411765, 1, 1,
0.04386651, -2.932219, 2.459216, 0, 0.9333333, 1, 1,
0.04642761, -0.1091706, 1.755042, 0, 0.9294118, 1, 1,
0.04687225, 1.638497, -0.2876611, 0, 0.9215686, 1, 1,
0.04914599, -1.489518, 3.790462, 0, 0.9176471, 1, 1,
0.05059845, -0.8683118, 2.035266, 0, 0.9098039, 1, 1,
0.05812845, 0.2462383, 0.8629699, 0, 0.9058824, 1, 1,
0.06113847, 0.2092847, -0.0090188, 0, 0.8980392, 1, 1,
0.06280599, -0.8664602, 2.213997, 0, 0.8901961, 1, 1,
0.06286282, -0.4956082, 1.07797, 0, 0.8862745, 1, 1,
0.06540024, 0.04100876, 1.584605, 0, 0.8784314, 1, 1,
0.06735037, -0.7209342, 2.963334, 0, 0.8745098, 1, 1,
0.06966636, -0.5439, 3.608781, 0, 0.8666667, 1, 1,
0.07922779, 1.631025, 0.1387388, 0, 0.8627451, 1, 1,
0.08530827, 1.1759, 0.7525839, 0, 0.854902, 1, 1,
0.08544496, -1.734217, 3.415034, 0, 0.8509804, 1, 1,
0.08685648, -0.3589566, 3.940828, 0, 0.8431373, 1, 1,
0.08898979, -1.070954, 3.833838, 0, 0.8392157, 1, 1,
0.09068366, -1.076093, 2.200053, 0, 0.8313726, 1, 1,
0.09209777, -1.307742, 3.084401, 0, 0.827451, 1, 1,
0.09301927, -0.03519621, 1.020016, 0, 0.8196079, 1, 1,
0.09508704, 0.4772857, 0.7017056, 0, 0.8156863, 1, 1,
0.1029957, 0.181096, 0.6966571, 0, 0.8078431, 1, 1,
0.1041935, -0.1333375, 2.209766, 0, 0.8039216, 1, 1,
0.1067118, -1.060835, 3.061309, 0, 0.7960784, 1, 1,
0.1108345, -0.09912418, 2.683068, 0, 0.7882353, 1, 1,
0.1123378, -1.160533, 3.15202, 0, 0.7843137, 1, 1,
0.1181811, 0.1161804, 1.859264, 0, 0.7764706, 1, 1,
0.123559, -0.7721452, 2.422644, 0, 0.772549, 1, 1,
0.1244227, 0.3041231, -1.55285, 0, 0.7647059, 1, 1,
0.128522, 0.8605725, -0.9798983, 0, 0.7607843, 1, 1,
0.1290745, 0.8980606, 0.2125326, 0, 0.7529412, 1, 1,
0.1305882, 0.9911953, -0.169373, 0, 0.7490196, 1, 1,
0.1335974, -0.7945202, 2.96846, 0, 0.7411765, 1, 1,
0.1338701, -0.4421591, 3.16217, 0, 0.7372549, 1, 1,
0.1343938, 0.3362336, 0.795921, 0, 0.7294118, 1, 1,
0.1395016, 0.3800564, -1.092935, 0, 0.7254902, 1, 1,
0.1455465, 1.150459, 0.7701143, 0, 0.7176471, 1, 1,
0.1534281, 1.551689, -0.3803047, 0, 0.7137255, 1, 1,
0.1554368, -1.472885, 1.861294, 0, 0.7058824, 1, 1,
0.1566276, 1.586606, 0.3363282, 0, 0.6980392, 1, 1,
0.1576222, -0.9989874, 3.133953, 0, 0.6941177, 1, 1,
0.1590201, 0.896555, -0.07708739, 0, 0.6862745, 1, 1,
0.159077, -0.3616269, 1.450988, 0, 0.682353, 1, 1,
0.1646728, -0.3963607, 2.85173, 0, 0.6745098, 1, 1,
0.1646833, -0.856664, 3.022373, 0, 0.6705883, 1, 1,
0.1704669, -0.5538082, 2.837967, 0, 0.6627451, 1, 1,
0.1707131, -0.841076, 1.965441, 0, 0.6588235, 1, 1,
0.18001, 0.983988, -0.1814948, 0, 0.6509804, 1, 1,
0.1811035, 1.05847, -0.193622, 0, 0.6470588, 1, 1,
0.1833463, 0.0451205, 3.109928, 0, 0.6392157, 1, 1,
0.1834664, -0.4638525, 1.163289, 0, 0.6352941, 1, 1,
0.1847878, 2.421028, 1.182521, 0, 0.627451, 1, 1,
0.1865738, -0.1076011, 3.86181, 0, 0.6235294, 1, 1,
0.1872333, 0.8582348, 1.152168, 0, 0.6156863, 1, 1,
0.191968, 1.157288, 0.5885705, 0, 0.6117647, 1, 1,
0.199409, 1.269978, -0.8399073, 0, 0.6039216, 1, 1,
0.1994383, 0.7696387, -0.2129741, 0, 0.5960785, 1, 1,
0.2020061, -0.03822057, 0.73036, 0, 0.5921569, 1, 1,
0.2065867, 0.07950906, 0.8344685, 0, 0.5843138, 1, 1,
0.2072157, -0.5279843, 3.076311, 0, 0.5803922, 1, 1,
0.2099729, 1.082268, 0.2722009, 0, 0.572549, 1, 1,
0.2100265, -0.9689574, 2.83463, 0, 0.5686275, 1, 1,
0.2119883, 0.3095771, -0.2616853, 0, 0.5607843, 1, 1,
0.2130877, -2.033196, 1.692902, 0, 0.5568628, 1, 1,
0.2228997, 0.6705468, 0.7768424, 0, 0.5490196, 1, 1,
0.2282533, -0.6946632, 2.346686, 0, 0.5450981, 1, 1,
0.2299603, 1.22403, 0.1911091, 0, 0.5372549, 1, 1,
0.2306446, 1.024956, 1.212588, 0, 0.5333334, 1, 1,
0.2330419, 0.3196157, 1.517249, 0, 0.5254902, 1, 1,
0.2348544, 2.130826, -0.1680921, 0, 0.5215687, 1, 1,
0.2409902, 0.7632093, -0.3718201, 0, 0.5137255, 1, 1,
0.2447371, -1.189045, 2.137067, 0, 0.509804, 1, 1,
0.2467371, 2.448169, -0.7501532, 0, 0.5019608, 1, 1,
0.2484995, -1.337718, 4.153909, 0, 0.4941176, 1, 1,
0.2487047, -1.144303, 2.126487, 0, 0.4901961, 1, 1,
0.2504722, 0.6557572, 1.967892, 0, 0.4823529, 1, 1,
0.2507012, -0.4409006, 4.176172, 0, 0.4784314, 1, 1,
0.2544137, -0.3550359, 2.734331, 0, 0.4705882, 1, 1,
0.256504, -1.405275, 2.356259, 0, 0.4666667, 1, 1,
0.2574729, -0.7011352, 1.575331, 0, 0.4588235, 1, 1,
0.2613242, 1.73764, -1.642365, 0, 0.454902, 1, 1,
0.2614031, -1.491277, 2.741859, 0, 0.4470588, 1, 1,
0.2636987, -0.1832014, 2.122449, 0, 0.4431373, 1, 1,
0.2639072, 0.8419719, 0.9253089, 0, 0.4352941, 1, 1,
0.2680981, -0.928359, 1.756644, 0, 0.4313726, 1, 1,
0.2704809, 0.5864515, 1.420007, 0, 0.4235294, 1, 1,
0.2738733, 1.273894, 2.048689, 0, 0.4196078, 1, 1,
0.2746025, 2.506836, 0.9617949, 0, 0.4117647, 1, 1,
0.2780052, -0.215601, 3.645882, 0, 0.4078431, 1, 1,
0.282623, -0.127351, 0.09391761, 0, 0.4, 1, 1,
0.2846102, 0.2255869, 0.3998162, 0, 0.3921569, 1, 1,
0.284919, 0.7538633, 0.9508383, 0, 0.3882353, 1, 1,
0.286144, -1.95016, 1.037399, 0, 0.3803922, 1, 1,
0.286821, 0.3095877, -0.08131447, 0, 0.3764706, 1, 1,
0.2870701, 0.517162, 1.95999, 0, 0.3686275, 1, 1,
0.2888296, -1.020759, 3.246224, 0, 0.3647059, 1, 1,
0.2889237, -1.470826, 2.459261, 0, 0.3568628, 1, 1,
0.2911799, -0.1227654, 1.40582, 0, 0.3529412, 1, 1,
0.2952196, 1.093217, 0.680856, 0, 0.345098, 1, 1,
0.2952711, 0.3020996, -0.9165139, 0, 0.3411765, 1, 1,
0.2968479, 0.8192612, -0.1751553, 0, 0.3333333, 1, 1,
0.2991029, 0.7355979, 1.600462, 0, 0.3294118, 1, 1,
0.3007129, -0.7370165, 3.207399, 0, 0.3215686, 1, 1,
0.3035723, -0.7033347, 3.096321, 0, 0.3176471, 1, 1,
0.3071024, 1.359151, -0.6456305, 0, 0.3098039, 1, 1,
0.3085516, -0.1522735, 3.405823, 0, 0.3058824, 1, 1,
0.3099709, -0.3537236, 3.530666, 0, 0.2980392, 1, 1,
0.310884, 1.363901, 0.4123153, 0, 0.2901961, 1, 1,
0.3122411, -1.457802, 3.325018, 0, 0.2862745, 1, 1,
0.3172626, 1.421133, -2.108359, 0, 0.2784314, 1, 1,
0.3187512, 0.9120309, -0.4163735, 0, 0.2745098, 1, 1,
0.3205741, -0.4017978, 2.081386, 0, 0.2666667, 1, 1,
0.3219848, 0.9017302, -0.7992529, 0, 0.2627451, 1, 1,
0.3299188, 1.657623, 0.4531588, 0, 0.254902, 1, 1,
0.3300389, -0.7412584, 3.531692, 0, 0.2509804, 1, 1,
0.330288, 0.2623048, 1.631397, 0, 0.2431373, 1, 1,
0.3319691, 1.912567, 0.5769846, 0, 0.2392157, 1, 1,
0.3325829, 0.8613985, 1.723288, 0, 0.2313726, 1, 1,
0.3333567, 0.4964712, -0.1469788, 0, 0.227451, 1, 1,
0.3341842, 0.8744639, 1.215356, 0, 0.2196078, 1, 1,
0.3348967, -1.075071, 1.654963, 0, 0.2156863, 1, 1,
0.3392603, 1.476142, 0.7670968, 0, 0.2078431, 1, 1,
0.3455454, 0.09893163, 1.406972, 0, 0.2039216, 1, 1,
0.3455639, -0.2176524, 2.831564, 0, 0.1960784, 1, 1,
0.3470778, -0.9953207, 3.170719, 0, 0.1882353, 1, 1,
0.3504749, -0.4445603, 3.103532, 0, 0.1843137, 1, 1,
0.3610604, -0.1701437, 4.066928, 0, 0.1764706, 1, 1,
0.3646878, 1.245793, -0.6377504, 0, 0.172549, 1, 1,
0.3666959, 1.398886, -1.064493, 0, 0.1647059, 1, 1,
0.3706716, 1.637882, -1.916112, 0, 0.1607843, 1, 1,
0.3793828, -0.3729397, 1.239329, 0, 0.1529412, 1, 1,
0.3868395, -0.3466626, 1.567039, 0, 0.1490196, 1, 1,
0.3869084, 0.23732, 0.4251492, 0, 0.1411765, 1, 1,
0.3885728, 0.6985894, 0.8597215, 0, 0.1372549, 1, 1,
0.3886179, -1.237173, 3.159611, 0, 0.1294118, 1, 1,
0.3897643, -1.209459, -0.1828203, 0, 0.1254902, 1, 1,
0.3970042, -1.517666, 2.432471, 0, 0.1176471, 1, 1,
0.3980336, 0.2364384, -0.9209794, 0, 0.1137255, 1, 1,
0.4017892, -3.107887, 2.982735, 0, 0.1058824, 1, 1,
0.4047632, -2.53262, 2.555915, 0, 0.09803922, 1, 1,
0.4051918, -1.550463, 2.562022, 0, 0.09411765, 1, 1,
0.4064907, 0.4078351, -0.1921073, 0, 0.08627451, 1, 1,
0.4172793, -0.7936525, 2.02594, 0, 0.08235294, 1, 1,
0.4198371, 1.785173, 0.538294, 0, 0.07450981, 1, 1,
0.4237531, -1.079394, 0.9476236, 0, 0.07058824, 1, 1,
0.4243506, -0.6377166, 1.582197, 0, 0.0627451, 1, 1,
0.4271977, 0.5680056, 0.2100197, 0, 0.05882353, 1, 1,
0.4327176, 0.1094177, 1.862768, 0, 0.05098039, 1, 1,
0.4327336, -1.18413, 4.328103, 0, 0.04705882, 1, 1,
0.4351828, 1.999687, 0.8011244, 0, 0.03921569, 1, 1,
0.4412804, 0.9094234, -0.04029954, 0, 0.03529412, 1, 1,
0.4431771, 0.01225822, 0.6514381, 0, 0.02745098, 1, 1,
0.4444847, -0.6723419, 1.442272, 0, 0.02352941, 1, 1,
0.447188, -0.007698508, 2.122776, 0, 0.01568628, 1, 1,
0.4485701, 1.469229, 1.645719, 0, 0.01176471, 1, 1,
0.4503095, 0.1928108, 1.407955, 0, 0.003921569, 1, 1,
0.4597002, -0.7576055, 1.238558, 0.003921569, 0, 1, 1,
0.4622673, -0.8049917, 3.507425, 0.007843138, 0, 1, 1,
0.4631113, 0.7204788, 0.7247399, 0.01568628, 0, 1, 1,
0.4635478, 0.2505441, -1.167538, 0.01960784, 0, 1, 1,
0.4665335, 0.9305303, 1.116181, 0.02745098, 0, 1, 1,
0.4688706, 0.9937664, 1.278427, 0.03137255, 0, 1, 1,
0.4719527, -0.6185699, 1.586821, 0.03921569, 0, 1, 1,
0.473584, 0.3857472, 0.2760303, 0.04313726, 0, 1, 1,
0.4775126, -0.8345453, 1.688166, 0.05098039, 0, 1, 1,
0.4807638, -0.003333287, 2.67139, 0.05490196, 0, 1, 1,
0.4810126, 0.2141926, 1.310346, 0.0627451, 0, 1, 1,
0.4921065, 0.3918192, 0.1045535, 0.06666667, 0, 1, 1,
0.4933721, 0.3822646, -2.352044, 0.07450981, 0, 1, 1,
0.4990356, -0.8338965, 2.953156, 0.07843138, 0, 1, 1,
0.5039688, -0.8706702, 1.255664, 0.08627451, 0, 1, 1,
0.5102238, -1.605679, 1.037593, 0.09019608, 0, 1, 1,
0.5102258, -2.051642, 3.374631, 0.09803922, 0, 1, 1,
0.5124793, -0.3216169, 2.401, 0.1058824, 0, 1, 1,
0.5150149, -1.120324, 1.006892, 0.1098039, 0, 1, 1,
0.5191159, -0.2729391, 1.477046, 0.1176471, 0, 1, 1,
0.5200608, -1.583923, 2.227201, 0.1215686, 0, 1, 1,
0.5261209, -0.2672334, 2.462628, 0.1294118, 0, 1, 1,
0.5275593, 0.441287, -0.1272165, 0.1333333, 0, 1, 1,
0.5282742, 1.056479, -1.877519, 0.1411765, 0, 1, 1,
0.5310743, 1.229782, 1.70662, 0.145098, 0, 1, 1,
0.5357819, 0.04095929, 0.9842228, 0.1529412, 0, 1, 1,
0.5424481, 0.1950579, 1.679209, 0.1568628, 0, 1, 1,
0.5434697, 0.8717233, -0.3013888, 0.1647059, 0, 1, 1,
0.5489436, -0.5861085, 2.018093, 0.1686275, 0, 1, 1,
0.5497624, 0.2484712, 2.538167, 0.1764706, 0, 1, 1,
0.5519947, -0.04851583, 2.019814, 0.1803922, 0, 1, 1,
0.5525262, 1.312718, -0.3610363, 0.1882353, 0, 1, 1,
0.5536763, -0.6104311, 3.588663, 0.1921569, 0, 1, 1,
0.5566872, -0.02922511, 1.00335, 0.2, 0, 1, 1,
0.563176, 0.1072773, 0.04968845, 0.2078431, 0, 1, 1,
0.5668131, 1.614797, -0.100236, 0.2117647, 0, 1, 1,
0.5669763, 0.5010844, 1.051163, 0.2196078, 0, 1, 1,
0.5705059, 0.3818978, 1.131032, 0.2235294, 0, 1, 1,
0.5788009, 0.1674293, 0.488268, 0.2313726, 0, 1, 1,
0.5828764, 0.5276951, -0.7350522, 0.2352941, 0, 1, 1,
0.5835673, -1.615826, 1.562757, 0.2431373, 0, 1, 1,
0.5837485, 0.8739134, -0.9314567, 0.2470588, 0, 1, 1,
0.5849807, 0.2662511, 0.5578144, 0.254902, 0, 1, 1,
0.5856137, -1.076881, 1.403441, 0.2588235, 0, 1, 1,
0.5858786, 1.040212, 1.157431, 0.2666667, 0, 1, 1,
0.5896598, -0.8870173, 2.873994, 0.2705882, 0, 1, 1,
0.5925651, 0.0166448, 2.483274, 0.2784314, 0, 1, 1,
0.5946351, 1.414209, 0.6421654, 0.282353, 0, 1, 1,
0.5966311, -0.3073094, 0.442836, 0.2901961, 0, 1, 1,
0.5987832, 0.2976107, 0.8249938, 0.2941177, 0, 1, 1,
0.601202, 1.224431, -0.164485, 0.3019608, 0, 1, 1,
0.6064001, 0.804036, 0.03381797, 0.3098039, 0, 1, 1,
0.6064255, -1.382697, 2.344029, 0.3137255, 0, 1, 1,
0.6081816, -0.3338022, 0.8434089, 0.3215686, 0, 1, 1,
0.6098599, 0.9827139, -0.1342318, 0.3254902, 0, 1, 1,
0.6118486, 1.300293, 0.1108363, 0.3333333, 0, 1, 1,
0.6135337, -0.09746917, 2.070177, 0.3372549, 0, 1, 1,
0.6149353, -0.05083312, 1.406559, 0.345098, 0, 1, 1,
0.6164628, -1.108776, 2.868009, 0.3490196, 0, 1, 1,
0.6169528, -0.5504254, 2.244172, 0.3568628, 0, 1, 1,
0.6232055, -0.7450806, 1.627431, 0.3607843, 0, 1, 1,
0.6283363, -2.268515, 2.098323, 0.3686275, 0, 1, 1,
0.6285061, -0.6658956, 2.04241, 0.372549, 0, 1, 1,
0.6300033, 0.3492844, 3.705408, 0.3803922, 0, 1, 1,
0.6413218, -1.018407, 1.916121, 0.3843137, 0, 1, 1,
0.6416098, 0.254072, 2.341106, 0.3921569, 0, 1, 1,
0.6430892, 0.536664, 0.5993249, 0.3960784, 0, 1, 1,
0.6463736, 1.407414, 1.943687, 0.4039216, 0, 1, 1,
0.6476089, -1.979384, 4.070828, 0.4117647, 0, 1, 1,
0.650906, 1.062766, 0.915805, 0.4156863, 0, 1, 1,
0.6515697, 1.705748, 1.544883, 0.4235294, 0, 1, 1,
0.6559724, 0.5618026, 0.9482869, 0.427451, 0, 1, 1,
0.6570694, -0.481766, 1.499521, 0.4352941, 0, 1, 1,
0.6571901, 0.1503558, 1.16266, 0.4392157, 0, 1, 1,
0.6573674, 0.3900054, 1.845785, 0.4470588, 0, 1, 1,
0.6581175, 0.677743, 0.8524824, 0.4509804, 0, 1, 1,
0.6596078, -0.4145735, 1.32568, 0.4588235, 0, 1, 1,
0.6679122, 2.421136, -0.5983005, 0.4627451, 0, 1, 1,
0.6742576, -1.450822, 1.612842, 0.4705882, 0, 1, 1,
0.6771722, -0.2694135, 1.616469, 0.4745098, 0, 1, 1,
0.6774655, -0.5392274, 3.413222, 0.4823529, 0, 1, 1,
0.6781912, -0.7136644, 3.372985, 0.4862745, 0, 1, 1,
0.6787122, -0.07922679, 2.036183, 0.4941176, 0, 1, 1,
0.6914792, 1.693306, 0.2720419, 0.5019608, 0, 1, 1,
0.6919188, 0.1670646, 2.787244, 0.5058824, 0, 1, 1,
0.7084695, -1.286185, 3.58152, 0.5137255, 0, 1, 1,
0.7086459, 1.428502, 1.215184, 0.5176471, 0, 1, 1,
0.7150306, -1.520287, 1.617878, 0.5254902, 0, 1, 1,
0.7235076, -1.531895, 2.535978, 0.5294118, 0, 1, 1,
0.7263634, 0.3000819, 2.663174, 0.5372549, 0, 1, 1,
0.7282764, -2.432016, 0.4020846, 0.5411765, 0, 1, 1,
0.735453, -0.1019097, 2.502948, 0.5490196, 0, 1, 1,
0.7373931, -1.353755, 0.9888213, 0.5529412, 0, 1, 1,
0.7376746, -0.3090737, 0.9845992, 0.5607843, 0, 1, 1,
0.7415747, -0.3546163, 0.9631723, 0.5647059, 0, 1, 1,
0.7417786, -0.4186422, 1.846956, 0.572549, 0, 1, 1,
0.7518374, 0.239139, 2.551346, 0.5764706, 0, 1, 1,
0.7539344, -0.8559878, 2.800584, 0.5843138, 0, 1, 1,
0.7569289, 1.56756, -0.5146229, 0.5882353, 0, 1, 1,
0.7582382, -1.010183, 1.333509, 0.5960785, 0, 1, 1,
0.7596936, 0.7483913, 2.567306, 0.6039216, 0, 1, 1,
0.7603115, 0.9567748, -0.3153429, 0.6078432, 0, 1, 1,
0.7617457, -0.3645782, 3.644966, 0.6156863, 0, 1, 1,
0.7644722, 0.1611872, 0.06873185, 0.6196079, 0, 1, 1,
0.769579, 0.795675, -0.5221285, 0.627451, 0, 1, 1,
0.7703853, -0.9588049, 3.800586, 0.6313726, 0, 1, 1,
0.7717925, 0.7370105, 0.9185666, 0.6392157, 0, 1, 1,
0.7722411, 0.2720954, 1.338696, 0.6431373, 0, 1, 1,
0.7740191, 0.5398222, -0.4528395, 0.6509804, 0, 1, 1,
0.7744312, 0.1592881, 2.104408, 0.654902, 0, 1, 1,
0.7768978, -0.200214, 0.2747703, 0.6627451, 0, 1, 1,
0.7838753, 0.2690069, 1.865382, 0.6666667, 0, 1, 1,
0.7849497, -0.7929907, 3.965776, 0.6745098, 0, 1, 1,
0.7856232, 1.012072, -1.33424, 0.6784314, 0, 1, 1,
0.7872792, -0.3244596, 1.3514, 0.6862745, 0, 1, 1,
0.7912619, 0.8414422, -0.4851478, 0.6901961, 0, 1, 1,
0.7929261, -0.1662638, 2.538607, 0.6980392, 0, 1, 1,
0.7929549, 0.183067, 1.242407, 0.7058824, 0, 1, 1,
0.7949991, -0.8775029, 1.461154, 0.7098039, 0, 1, 1,
0.7992938, -0.7191017, 1.212411, 0.7176471, 0, 1, 1,
0.8026744, 0.2050855, 1.085745, 0.7215686, 0, 1, 1,
0.8091287, -0.2238837, 0.07108613, 0.7294118, 0, 1, 1,
0.8094335, 1.01329, 0.2686539, 0.7333333, 0, 1, 1,
0.8101805, 0.2137079, 0.4918769, 0.7411765, 0, 1, 1,
0.812753, -1.441387, 3.660908, 0.7450981, 0, 1, 1,
0.8140209, 1.185091, -0.3454167, 0.7529412, 0, 1, 1,
0.8148881, -2.240627, 2.904058, 0.7568628, 0, 1, 1,
0.8156368, 1.367733, 0.5679174, 0.7647059, 0, 1, 1,
0.8237253, -0.687034, 1.794436, 0.7686275, 0, 1, 1,
0.8257652, -0.7253956, 0.9945003, 0.7764706, 0, 1, 1,
0.8441491, -0.3714568, 2.386187, 0.7803922, 0, 1, 1,
0.8455744, 0.2671385, 0.7866406, 0.7882353, 0, 1, 1,
0.8468348, -0.862941, 1.820849, 0.7921569, 0, 1, 1,
0.8507541, -1.918125, 2.19814, 0.8, 0, 1, 1,
0.8527054, -0.1511213, 3.107876, 0.8078431, 0, 1, 1,
0.8541135, 2.118306, 0.7387795, 0.8117647, 0, 1, 1,
0.8627706, -0.6268685, 1.312239, 0.8196079, 0, 1, 1,
0.8641197, -1.664456, 1.790868, 0.8235294, 0, 1, 1,
0.8715625, -0.2706892, 0.8329312, 0.8313726, 0, 1, 1,
0.8784506, 0.8712421, 0.9793333, 0.8352941, 0, 1, 1,
0.879049, 0.223223, 0.4926125, 0.8431373, 0, 1, 1,
0.8798628, 0.354192, 1.838645, 0.8470588, 0, 1, 1,
0.8827366, -0.3157365, 1.716342, 0.854902, 0, 1, 1,
0.8847564, -0.727456, 1.84729, 0.8588235, 0, 1, 1,
0.8855698, 0.4811677, 0.8811163, 0.8666667, 0, 1, 1,
0.8874027, -0.713274, 1.681763, 0.8705882, 0, 1, 1,
0.8998671, 2.235375, -0.5664746, 0.8784314, 0, 1, 1,
0.9011958, 0.7811763, 1.58295, 0.8823529, 0, 1, 1,
0.9025601, -1.380086, 2.558631, 0.8901961, 0, 1, 1,
0.906889, -0.248524, 2.192742, 0.8941177, 0, 1, 1,
0.9146885, 1.642739, -1.19207, 0.9019608, 0, 1, 1,
0.9151928, 0.2462134, 1.50194, 0.9098039, 0, 1, 1,
0.9175865, 0.4276192, 1.607902, 0.9137255, 0, 1, 1,
0.9190353, 0.5146304, 1.748603, 0.9215686, 0, 1, 1,
0.9216138, -0.02974158, 1.289801, 0.9254902, 0, 1, 1,
0.9233714, -0.3940623, 1.911358, 0.9333333, 0, 1, 1,
0.9402658, -1.08091, 1.6135, 0.9372549, 0, 1, 1,
0.9424147, -0.3265509, 3.631879, 0.945098, 0, 1, 1,
0.951448, 2.393483, -1.082869, 0.9490196, 0, 1, 1,
0.955341, 1.271818, 0.7430367, 0.9568627, 0, 1, 1,
0.9614214, -0.4281935, 2.817775, 0.9607843, 0, 1, 1,
0.9692048, -0.1113491, 1.595901, 0.9686275, 0, 1, 1,
0.9763867, 0.740521, 1.823173, 0.972549, 0, 1, 1,
0.9817384, -0.004402531, 1.225485, 0.9803922, 0, 1, 1,
0.9819581, -1.265575, 3.161044, 0.9843137, 0, 1, 1,
0.9861733, -0.2547394, 2.58433, 0.9921569, 0, 1, 1,
0.9875582, 0.5753617, 1.393416, 0.9960784, 0, 1, 1,
0.992288, 0.8061044, 1.458414, 1, 0, 0.9960784, 1,
0.9924448, -1.703975, 2.946459, 1, 0, 0.9882353, 1,
0.9943715, 0.3658139, 1.786018, 1, 0, 0.9843137, 1,
0.9980153, 0.593554, 0.3606614, 1, 0, 0.9764706, 1,
1.000713, -0.5658818, 1.309605, 1, 0, 0.972549, 1,
1.003797, 1.325528, 0.2195175, 1, 0, 0.9647059, 1,
1.004012, 1.143912, 0.5433928, 1, 0, 0.9607843, 1,
1.011062, 0.4520583, 3.224878, 1, 0, 0.9529412, 1,
1.011898, 1.563775, 2.80405, 1, 0, 0.9490196, 1,
1.018145, -1.405308, 3.056982, 1, 0, 0.9411765, 1,
1.021413, 0.9808989, 1.596165, 1, 0, 0.9372549, 1,
1.025456, 1.806501, 0.3481388, 1, 0, 0.9294118, 1,
1.025581, 0.3462776, 2.332583, 1, 0, 0.9254902, 1,
1.027507, -0.06615449, 0.3700523, 1, 0, 0.9176471, 1,
1.035946, 0.8185268, 1.587816, 1, 0, 0.9137255, 1,
1.036686, 0.196547, 2.998571, 1, 0, 0.9058824, 1,
1.038993, -1.807401, 2.523499, 1, 0, 0.9019608, 1,
1.040439, 1.289395, 0.6265827, 1, 0, 0.8941177, 1,
1.04344, 0.3334206, 0.659282, 1, 0, 0.8862745, 1,
1.04517, -0.7019494, 1.984932, 1, 0, 0.8823529, 1,
1.046719, -0.5533144, 1.812528, 1, 0, 0.8745098, 1,
1.058338, -0.3333188, 3.226675, 1, 0, 0.8705882, 1,
1.063501, -0.3614491, 2.510607, 1, 0, 0.8627451, 1,
1.064771, -1.144329, 3.669641, 1, 0, 0.8588235, 1,
1.074187, -0.5793331, 2.923657, 1, 0, 0.8509804, 1,
1.086176, 0.03446102, 1.132935, 1, 0, 0.8470588, 1,
1.087314, 2.262337, -1.753963, 1, 0, 0.8392157, 1,
1.096539, -1.428736, 4.365856, 1, 0, 0.8352941, 1,
1.096827, 2.074735, -0.5139344, 1, 0, 0.827451, 1,
1.098814, 0.57028, 1.241089, 1, 0, 0.8235294, 1,
1.102738, 1.817691, 0.8351246, 1, 0, 0.8156863, 1,
1.1034, 1.240183, 3.054873, 1, 0, 0.8117647, 1,
1.106072, 0.9959416, -0.6686116, 1, 0, 0.8039216, 1,
1.106104, 0.318918, 1.358093, 1, 0, 0.7960784, 1,
1.10869, -0.1907376, 0.6379799, 1, 0, 0.7921569, 1,
1.10885, -1.282026, 1.952152, 1, 0, 0.7843137, 1,
1.115329, -0.4546839, 1.531782, 1, 0, 0.7803922, 1,
1.122414, -0.001845639, 1.618571, 1, 0, 0.772549, 1,
1.138137, -0.3486075, 1.209877, 1, 0, 0.7686275, 1,
1.139806, 0.3887625, 0.1041702, 1, 0, 0.7607843, 1,
1.140318, -0.9750805, 3.205009, 1, 0, 0.7568628, 1,
1.142657, 0.686752, 1.918866, 1, 0, 0.7490196, 1,
1.147291, -1.007045, 1.362114, 1, 0, 0.7450981, 1,
1.147834, 0.4242007, 2.129713, 1, 0, 0.7372549, 1,
1.150459, 0.2791601, 1.566673, 1, 0, 0.7333333, 1,
1.150748, -0.040105, 2.182743, 1, 0, 0.7254902, 1,
1.159515, 1.234988, 0.5720856, 1, 0, 0.7215686, 1,
1.161886, 0.3340025, 1.655681, 1, 0, 0.7137255, 1,
1.164443, -0.7541426, 3.821714, 1, 0, 0.7098039, 1,
1.16539, 0.3496628, 1.420835, 1, 0, 0.7019608, 1,
1.183459, -0.2954345, 1.4528, 1, 0, 0.6941177, 1,
1.192268, -0.1583046, 1.704928, 1, 0, 0.6901961, 1,
1.193287, 0.2191504, 2.713166, 1, 0, 0.682353, 1,
1.193866, 0.2576423, 1.560008, 1, 0, 0.6784314, 1,
1.193911, -1.068153, 2.039514, 1, 0, 0.6705883, 1,
1.19797, -0.7052912, 2.483902, 1, 0, 0.6666667, 1,
1.200884, 1.797843, -1.587043, 1, 0, 0.6588235, 1,
1.200933, -1.722362, 2.614881, 1, 0, 0.654902, 1,
1.203389, -2.049985, 1.281945, 1, 0, 0.6470588, 1,
1.214372, 1.492696, 2.010961, 1, 0, 0.6431373, 1,
1.2255, -0.1813172, 3.335257, 1, 0, 0.6352941, 1,
1.227969, -0.9395062, 3.239199, 1, 0, 0.6313726, 1,
1.245867, 2.383265, -0.220587, 1, 0, 0.6235294, 1,
1.254739, -0.1552936, 1.93453, 1, 0, 0.6196079, 1,
1.268599, -0.1609023, 0.05822236, 1, 0, 0.6117647, 1,
1.269139, 0.6430165, 2.376064, 1, 0, 0.6078432, 1,
1.269168, 0.02668823, 3.359229, 1, 0, 0.6, 1,
1.27168, 0.06837937, 1.517799, 1, 0, 0.5921569, 1,
1.278498, 0.6383023, 0.6917075, 1, 0, 0.5882353, 1,
1.299559, 1.054653, 2.445633, 1, 0, 0.5803922, 1,
1.303075, -1.412168, 2.934741, 1, 0, 0.5764706, 1,
1.307626, 0.541348, 0.351036, 1, 0, 0.5686275, 1,
1.309113, 0.8081197, 0.8198662, 1, 0, 0.5647059, 1,
1.312702, -2.024076, 2.057196, 1, 0, 0.5568628, 1,
1.325838, -0.0820578, 1.435993, 1, 0, 0.5529412, 1,
1.337637, -0.2579771, 4.325464, 1, 0, 0.5450981, 1,
1.350651, 1.698312, 0.8152694, 1, 0, 0.5411765, 1,
1.350971, 0.6030555, 1.558367, 1, 0, 0.5333334, 1,
1.354627, -0.8693435, 1.663496, 1, 0, 0.5294118, 1,
1.35861, -0.8374365, 2.449471, 1, 0, 0.5215687, 1,
1.359932, 0.1657524, 0.8796322, 1, 0, 0.5176471, 1,
1.37173, -0.1547462, 1.805006, 1, 0, 0.509804, 1,
1.374996, -0.476167, 1.610462, 1, 0, 0.5058824, 1,
1.378085, -0.07015599, 2.942563, 1, 0, 0.4980392, 1,
1.387003, 2.386767, -0.7585608, 1, 0, 0.4901961, 1,
1.395509, -1.848827, 2.526516, 1, 0, 0.4862745, 1,
1.399909, -0.6152882, 1.171021, 1, 0, 0.4784314, 1,
1.407526, -1.134897, 2.820215, 1, 0, 0.4745098, 1,
1.409339, -0.6062474, 2.560683, 1, 0, 0.4666667, 1,
1.419977, -0.9412233, 0.8635374, 1, 0, 0.4627451, 1,
1.471072, -2.494304, 3.171353, 1, 0, 0.454902, 1,
1.477705, 2.666253, -1.818005, 1, 0, 0.4509804, 1,
1.480904, 1.299536, 0.1277144, 1, 0, 0.4431373, 1,
1.49278, 0.4471948, 0.7855897, 1, 0, 0.4392157, 1,
1.504844, -0.1316887, 2.676574, 1, 0, 0.4313726, 1,
1.507527, -0.2732932, 1.934388, 1, 0, 0.427451, 1,
1.509471, -0.06906973, 1.566056, 1, 0, 0.4196078, 1,
1.513796, -0.1237863, 0.6540701, 1, 0, 0.4156863, 1,
1.516594, -1.604506, 3.550559, 1, 0, 0.4078431, 1,
1.524237, 0.09383982, 1.982568, 1, 0, 0.4039216, 1,
1.525263, 1.875024, 0.1300371, 1, 0, 0.3960784, 1,
1.538314, 0.02905239, 2.207305, 1, 0, 0.3882353, 1,
1.539644, -0.08328043, 0.6095082, 1, 0, 0.3843137, 1,
1.540245, -0.3209503, 2.026886, 1, 0, 0.3764706, 1,
1.561991, 1.370775, 0.7903347, 1, 0, 0.372549, 1,
1.56318, -0.2598054, 3.143808, 1, 0, 0.3647059, 1,
1.569894, -0.583995, 1.528367, 1, 0, 0.3607843, 1,
1.580882, -0.4284233, 3.362225, 1, 0, 0.3529412, 1,
1.589375, -0.0889412, 1.984469, 1, 0, 0.3490196, 1,
1.594292, 1.054624, 1.513735, 1, 0, 0.3411765, 1,
1.596457, -1.292436, 2.335388, 1, 0, 0.3372549, 1,
1.59885, -0.2828657, 2.675335, 1, 0, 0.3294118, 1,
1.62173, -0.01669501, 1.296286, 1, 0, 0.3254902, 1,
1.621815, -0.7178046, 1.821042, 1, 0, 0.3176471, 1,
1.63934, 0.2560875, 0.8413268, 1, 0, 0.3137255, 1,
1.664305, -1.372278, 2.656973, 1, 0, 0.3058824, 1,
1.669956, 0.1911073, 1.204278, 1, 0, 0.2980392, 1,
1.670725, -1.41131, 1.139992, 1, 0, 0.2941177, 1,
1.67615, -1.429005, 2.864784, 1, 0, 0.2862745, 1,
1.688222, -0.2796747, 1.430868, 1, 0, 0.282353, 1,
1.691365, 1.083828, 2.573558, 1, 0, 0.2745098, 1,
1.711655, -1.819453, 1.2778, 1, 0, 0.2705882, 1,
1.721358, 0.4310508, 0.8405586, 1, 0, 0.2627451, 1,
1.747715, 0.2480686, 3.000916, 1, 0, 0.2588235, 1,
1.751722, 0.1049301, 0.2146137, 1, 0, 0.2509804, 1,
1.765521, -2.925992, 2.724422, 1, 0, 0.2470588, 1,
1.790927, 0.3495232, 1.727777, 1, 0, 0.2392157, 1,
1.798437, 0.208282, 1.505795, 1, 0, 0.2352941, 1,
1.836829, 1.397594, 1.200678, 1, 0, 0.227451, 1,
1.84233, 1.197554, 1.116002, 1, 0, 0.2235294, 1,
1.845114, 0.6096392, 2.037443, 1, 0, 0.2156863, 1,
1.885756, 0.4835068, 2.834572, 1, 0, 0.2117647, 1,
1.886384, 0.4674016, 0.8761355, 1, 0, 0.2039216, 1,
1.887661, -0.2358635, 0.6318453, 1, 0, 0.1960784, 1,
1.903213, -0.2882048, 2.675712, 1, 0, 0.1921569, 1,
1.903228, 0.27208, 1.795526, 1, 0, 0.1843137, 1,
1.952208, 2.039032, 0.7036214, 1, 0, 0.1803922, 1,
1.966568, 1.356467, -0.03219902, 1, 0, 0.172549, 1,
1.996286, 0.7843106, 2.225882, 1, 0, 0.1686275, 1,
2.023393, 0.329718, 1.136537, 1, 0, 0.1607843, 1,
2.023431, 0.02699297, 1.858895, 1, 0, 0.1568628, 1,
2.032064, 1.108551, 2.559182, 1, 0, 0.1490196, 1,
2.102312, 0.1831474, 0.8916584, 1, 0, 0.145098, 1,
2.128575, -2.291205, -0.1316638, 1, 0, 0.1372549, 1,
2.128661, -0.6013253, 0.8824948, 1, 0, 0.1333333, 1,
2.1475, 0.8338649, 2.797324, 1, 0, 0.1254902, 1,
2.150972, 1.173479, 3.043306, 1, 0, 0.1215686, 1,
2.153267, 1.502512, 1.606541, 1, 0, 0.1137255, 1,
2.162829, -0.08652352, 3.080764, 1, 0, 0.1098039, 1,
2.166011, 1.316366, 1.392294, 1, 0, 0.1019608, 1,
2.244194, -0.4973542, 1.152279, 1, 0, 0.09411765, 1,
2.270746, 0.8697571, 2.403408, 1, 0, 0.09019608, 1,
2.308296, -0.3771051, 0.9962995, 1, 0, 0.08235294, 1,
2.314894, 0.4861872, 0.8768663, 1, 0, 0.07843138, 1,
2.324022, 0.5333825, 2.991444, 1, 0, 0.07058824, 1,
2.389264, -0.5005715, 1.179422, 1, 0, 0.06666667, 1,
2.442972, -0.8067467, 1.501445, 1, 0, 0.05882353, 1,
2.465751, 0.9154363, 0.2574385, 1, 0, 0.05490196, 1,
2.475323, 0.421556, 1.956719, 1, 0, 0.04705882, 1,
2.500501, -0.1894689, -0.114111, 1, 0, 0.04313726, 1,
2.512496, 0.0726677, 1.941484, 1, 0, 0.03529412, 1,
2.529587, -1.533376, 2.607991, 1, 0, 0.03137255, 1,
2.538362, 0.6089092, 0.2477862, 1, 0, 0.02352941, 1,
2.704119, -0.215974, 2.447647, 1, 0, 0.01960784, 1,
2.826903, 1.456312, 1.506169, 1, 0, 0.01176471, 1,
3.213507, -0.6118096, 0.4736686, 1, 0, 0.007843138, 1
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
-0.5963734, -4.17025, -7.429337, 0, -0.5, 0.5, 0.5,
-0.5963734, -4.17025, -7.429337, 1, -0.5, 0.5, 0.5,
-0.5963734, -4.17025, -7.429337, 1, 1.5, 0.5, 0.5,
-0.5963734, -4.17025, -7.429337, 0, 1.5, 0.5, 0.5
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
-5.697803, 0.02592587, -7.429337, 0, -0.5, 0.5, 0.5,
-5.697803, 0.02592587, -7.429337, 1, -0.5, 0.5, 0.5,
-5.697803, 0.02592587, -7.429337, 1, 1.5, 0.5, 0.5,
-5.697803, 0.02592587, -7.429337, 0, 1.5, 0.5, 0.5
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
-5.697803, -4.17025, -0.6287336, 0, -0.5, 0.5, 0.5,
-5.697803, -4.17025, -0.6287336, 1, -0.5, 0.5, 0.5,
-5.697803, -4.17025, -0.6287336, 1, 1.5, 0.5, 0.5,
-5.697803, -4.17025, -0.6287336, 0, 1.5, 0.5, 0.5
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
-4, -3.201902, -5.859967,
2, -3.201902, -5.859967,
-4, -3.201902, -5.859967,
-4, -3.363293, -6.121529,
-2, -3.201902, -5.859967,
-2, -3.363293, -6.121529,
0, -3.201902, -5.859967,
0, -3.363293, -6.121529,
2, -3.201902, -5.859967,
2, -3.363293, -6.121529
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
"-4",
"-2",
"0",
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
-4, -3.686076, -6.644652, 0, -0.5, 0.5, 0.5,
-4, -3.686076, -6.644652, 1, -0.5, 0.5, 0.5,
-4, -3.686076, -6.644652, 1, 1.5, 0.5, 0.5,
-4, -3.686076, -6.644652, 0, 1.5, 0.5, 0.5,
-2, -3.686076, -6.644652, 0, -0.5, 0.5, 0.5,
-2, -3.686076, -6.644652, 1, -0.5, 0.5, 0.5,
-2, -3.686076, -6.644652, 1, 1.5, 0.5, 0.5,
-2, -3.686076, -6.644652, 0, 1.5, 0.5, 0.5,
0, -3.686076, -6.644652, 0, -0.5, 0.5, 0.5,
0, -3.686076, -6.644652, 1, -0.5, 0.5, 0.5,
0, -3.686076, -6.644652, 1, 1.5, 0.5, 0.5,
0, -3.686076, -6.644652, 0, 1.5, 0.5, 0.5,
2, -3.686076, -6.644652, 0, -0.5, 0.5, 0.5,
2, -3.686076, -6.644652, 1, -0.5, 0.5, 0.5,
2, -3.686076, -6.644652, 1, 1.5, 0.5, 0.5,
2, -3.686076, -6.644652, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.52055, -3, -5.859967,
-4.52055, 3, -5.859967,
-4.52055, -3, -5.859967,
-4.716759, -3, -6.121529,
-4.52055, -2, -5.859967,
-4.716759, -2, -6.121529,
-4.52055, -1, -5.859967,
-4.716759, -1, -6.121529,
-4.52055, 0, -5.859967,
-4.716759, 0, -6.121529,
-4.52055, 1, -5.859967,
-4.716759, 1, -6.121529,
-4.52055, 2, -5.859967,
-4.716759, 2, -6.121529,
-4.52055, 3, -5.859967,
-4.716759, 3, -6.121529
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
-5.109177, -3, -6.644652, 0, -0.5, 0.5, 0.5,
-5.109177, -3, -6.644652, 1, -0.5, 0.5, 0.5,
-5.109177, -3, -6.644652, 1, 1.5, 0.5, 0.5,
-5.109177, -3, -6.644652, 0, 1.5, 0.5, 0.5,
-5.109177, -2, -6.644652, 0, -0.5, 0.5, 0.5,
-5.109177, -2, -6.644652, 1, -0.5, 0.5, 0.5,
-5.109177, -2, -6.644652, 1, 1.5, 0.5, 0.5,
-5.109177, -2, -6.644652, 0, 1.5, 0.5, 0.5,
-5.109177, -1, -6.644652, 0, -0.5, 0.5, 0.5,
-5.109177, -1, -6.644652, 1, -0.5, 0.5, 0.5,
-5.109177, -1, -6.644652, 1, 1.5, 0.5, 0.5,
-5.109177, -1, -6.644652, 0, 1.5, 0.5, 0.5,
-5.109177, 0, -6.644652, 0, -0.5, 0.5, 0.5,
-5.109177, 0, -6.644652, 1, -0.5, 0.5, 0.5,
-5.109177, 0, -6.644652, 1, 1.5, 0.5, 0.5,
-5.109177, 0, -6.644652, 0, 1.5, 0.5, 0.5,
-5.109177, 1, -6.644652, 0, -0.5, 0.5, 0.5,
-5.109177, 1, -6.644652, 1, -0.5, 0.5, 0.5,
-5.109177, 1, -6.644652, 1, 1.5, 0.5, 0.5,
-5.109177, 1, -6.644652, 0, 1.5, 0.5, 0.5,
-5.109177, 2, -6.644652, 0, -0.5, 0.5, 0.5,
-5.109177, 2, -6.644652, 1, -0.5, 0.5, 0.5,
-5.109177, 2, -6.644652, 1, 1.5, 0.5, 0.5,
-5.109177, 2, -6.644652, 0, 1.5, 0.5, 0.5,
-5.109177, 3, -6.644652, 0, -0.5, 0.5, 0.5,
-5.109177, 3, -6.644652, 1, -0.5, 0.5, 0.5,
-5.109177, 3, -6.644652, 1, 1.5, 0.5, 0.5,
-5.109177, 3, -6.644652, 0, 1.5, 0.5, 0.5
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
-4.52055, -3.201902, -4,
-4.52055, -3.201902, 4,
-4.52055, -3.201902, -4,
-4.716759, -3.363293, -4,
-4.52055, -3.201902, -2,
-4.716759, -3.363293, -2,
-4.52055, -3.201902, 0,
-4.716759, -3.363293, 0,
-4.52055, -3.201902, 2,
-4.716759, -3.363293, 2,
-4.52055, -3.201902, 4,
-4.716759, -3.363293, 4
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
-5.109177, -3.686076, -4, 0, -0.5, 0.5, 0.5,
-5.109177, -3.686076, -4, 1, -0.5, 0.5, 0.5,
-5.109177, -3.686076, -4, 1, 1.5, 0.5, 0.5,
-5.109177, -3.686076, -4, 0, 1.5, 0.5, 0.5,
-5.109177, -3.686076, -2, 0, -0.5, 0.5, 0.5,
-5.109177, -3.686076, -2, 1, -0.5, 0.5, 0.5,
-5.109177, -3.686076, -2, 1, 1.5, 0.5, 0.5,
-5.109177, -3.686076, -2, 0, 1.5, 0.5, 0.5,
-5.109177, -3.686076, 0, 0, -0.5, 0.5, 0.5,
-5.109177, -3.686076, 0, 1, -0.5, 0.5, 0.5,
-5.109177, -3.686076, 0, 1, 1.5, 0.5, 0.5,
-5.109177, -3.686076, 0, 0, 1.5, 0.5, 0.5,
-5.109177, -3.686076, 2, 0, -0.5, 0.5, 0.5,
-5.109177, -3.686076, 2, 1, -0.5, 0.5, 0.5,
-5.109177, -3.686076, 2, 1, 1.5, 0.5, 0.5,
-5.109177, -3.686076, 2, 0, 1.5, 0.5, 0.5,
-5.109177, -3.686076, 4, 0, -0.5, 0.5, 0.5,
-5.109177, -3.686076, 4, 1, -0.5, 0.5, 0.5,
-5.109177, -3.686076, 4, 1, 1.5, 0.5, 0.5,
-5.109177, -3.686076, 4, 0, 1.5, 0.5, 0.5
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
-4.52055, -3.201902, -5.859967,
-4.52055, 3.253753, -5.859967,
-4.52055, -3.201902, 4.6025,
-4.52055, 3.253753, 4.6025,
-4.52055, -3.201902, -5.859967,
-4.52055, -3.201902, 4.6025,
-4.52055, 3.253753, -5.859967,
-4.52055, 3.253753, 4.6025,
-4.52055, -3.201902, -5.859967,
3.327803, -3.201902, -5.859967,
-4.52055, -3.201902, 4.6025,
3.327803, -3.201902, 4.6025,
-4.52055, 3.253753, -5.859967,
3.327803, 3.253753, -5.859967,
-4.52055, 3.253753, 4.6025,
3.327803, 3.253753, 4.6025,
3.327803, -3.201902, -5.859967,
3.327803, 3.253753, -5.859967,
3.327803, -3.201902, 4.6025,
3.327803, 3.253753, 4.6025,
3.327803, -3.201902, -5.859967,
3.327803, -3.201902, 4.6025,
3.327803, 3.253753, -5.859967,
3.327803, 3.253753, 4.6025
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
var radius = 7.788347;
var distance = 34.65123;
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
mvMatrix.translate( 0.5963734, -0.02592587, 0.6287336 );
mvMatrix.scale( 1.072953, 1.304424, 0.8048688 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.65123);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Lipan<-read.table("Lipan.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Lipan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Lipan' not found
```

```r
y<-Lipan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Lipan' not found
```

```r
z<-Lipan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Lipan' not found
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
-4.406254, 1.205573, 0.9167702, 0, 0, 1, 1, 1,
-2.606902, -0.8678526, -3.025207, 1, 0, 0, 1, 1,
-2.424659, -0.08457858, 0.2351703, 1, 0, 0, 1, 1,
-2.409979, -1.281383, -3.591377, 1, 0, 0, 1, 1,
-2.360225, 0.6338627, -1.824214, 1, 0, 0, 1, 1,
-2.300973, 0.3634977, -1.701912, 1, 0, 0, 1, 1,
-2.279309, 0.7058402, -1.137743, 0, 0, 0, 1, 1,
-2.277818, -1.737794, -3.336155, 0, 0, 0, 1, 1,
-2.275919, 1.754724, -0.7663496, 0, 0, 0, 1, 1,
-2.27505, 0.2172292, -1.778231, 0, 0, 0, 1, 1,
-2.262174, -0.5568906, -2.460899, 0, 0, 0, 1, 1,
-2.235019, 0.3985667, -2.944757, 0, 0, 0, 1, 1,
-2.223149, 0.7274497, -2.276595, 0, 0, 0, 1, 1,
-2.204506, -0.3200045, 0.1398296, 1, 1, 1, 1, 1,
-2.188854, -1.612859, -3.332528, 1, 1, 1, 1, 1,
-2.15563, 0.1711605, -0.158663, 1, 1, 1, 1, 1,
-2.13712, 0.5168367, 0.1621804, 1, 1, 1, 1, 1,
-2.127352, -1.94529, -4.419947, 1, 1, 1, 1, 1,
-2.089646, -0.943275, -2.026386, 1, 1, 1, 1, 1,
-2.082462, 0.6153511, -0.8105984, 1, 1, 1, 1, 1,
-2.070769, -0.4799506, -1.783392, 1, 1, 1, 1, 1,
-2.061423, 1.240187, -2.264776, 1, 1, 1, 1, 1,
-2.030507, -0.2802304, 0.2211413, 1, 1, 1, 1, 1,
-2.02604, -2.597917, -1.035013, 1, 1, 1, 1, 1,
-2.011103, 0.2082965, -2.793633, 1, 1, 1, 1, 1,
-2.004659, -0.9049321, -2.473694, 1, 1, 1, 1, 1,
-1.988976, 1.194626, -2.224575, 1, 1, 1, 1, 1,
-1.988643, -1.114129, -4.053604, 1, 1, 1, 1, 1,
-1.971923, 0.7285061, 0.04903912, 0, 0, 1, 1, 1,
-1.959134, 0.1533037, -0.2355636, 1, 0, 0, 1, 1,
-1.938688, -1.657761, -3.413197, 1, 0, 0, 1, 1,
-1.937345, -1.34786, -3.133862, 1, 0, 0, 1, 1,
-1.929136, -1.659111, -2.265067, 1, 0, 0, 1, 1,
-1.922886, 1.022265, 0.07291463, 1, 0, 0, 1, 1,
-1.922456, -0.2516442, -2.402101, 0, 0, 0, 1, 1,
-1.916758, -1.665193, -3.149894, 0, 0, 0, 1, 1,
-1.906486, 1.543705, -1.702682, 0, 0, 0, 1, 1,
-1.905857, 1.386093, 1.066301, 0, 0, 0, 1, 1,
-1.89988, 0.8062286, -2.674735, 0, 0, 0, 1, 1,
-1.896517, 1.151226, -0.5199035, 0, 0, 0, 1, 1,
-1.841787, -1.064838, -1.881097, 0, 0, 0, 1, 1,
-1.799952, 0.5800189, -1.349457, 1, 1, 1, 1, 1,
-1.789747, 0.2701712, -0.6915394, 1, 1, 1, 1, 1,
-1.753431, -0.2110214, -2.283991, 1, 1, 1, 1, 1,
-1.747735, -0.8149053, -1.950396, 1, 1, 1, 1, 1,
-1.743156, -1.004573, -1.916991, 1, 1, 1, 1, 1,
-1.713306, 0.8419284, -1.542927, 1, 1, 1, 1, 1,
-1.706958, 0.1146455, -3.662812, 1, 1, 1, 1, 1,
-1.690717, -0.481369, -1.159556, 1, 1, 1, 1, 1,
-1.690694, 0.7848634, -0.4295771, 1, 1, 1, 1, 1,
-1.670471, 0.5454744, -1.824033, 1, 1, 1, 1, 1,
-1.66753, 1.316613, -0.6366528, 1, 1, 1, 1, 1,
-1.656255, -0.9564114, -1.256162, 1, 1, 1, 1, 1,
-1.653033, -0.5333265, 0.07094754, 1, 1, 1, 1, 1,
-1.652455, 0.9480439, -1.060569, 1, 1, 1, 1, 1,
-1.649277, 0.5163878, -0.3731598, 1, 1, 1, 1, 1,
-1.634643, -0.1043538, -1.766271, 0, 0, 1, 1, 1,
-1.624057, -0.9524163, -1.607849, 1, 0, 0, 1, 1,
-1.619866, 1.142139, -1.005247, 1, 0, 0, 1, 1,
-1.615635, -1.01434, -3.163601, 1, 0, 0, 1, 1,
-1.61534, -1.044746, -2.525048, 1, 0, 0, 1, 1,
-1.606027, -0.7143836, -0.7245072, 1, 0, 0, 1, 1,
-1.605241, 0.5162655, -1.277082, 0, 0, 0, 1, 1,
-1.60366, 0.4971955, -2.078975, 0, 0, 0, 1, 1,
-1.587336, -0.7039632, -0.6696425, 0, 0, 0, 1, 1,
-1.581518, 0.1738224, -2.393047, 0, 0, 0, 1, 1,
-1.539497, 1.289228, -1.734351, 0, 0, 0, 1, 1,
-1.537532, 3.159739, -0.3650497, 0, 0, 0, 1, 1,
-1.533778, -1.075889, -2.233612, 0, 0, 0, 1, 1,
-1.532244, -0.03997372, -1.617902, 1, 1, 1, 1, 1,
-1.508645, 0.337397, -1.928543, 1, 1, 1, 1, 1,
-1.500913, 0.1021071, -1.500024, 1, 1, 1, 1, 1,
-1.500335, 0.9104542, -1.641141, 1, 1, 1, 1, 1,
-1.471658, -0.6852403, -2.276632, 1, 1, 1, 1, 1,
-1.458092, 1.007979, -1.487388, 1, 1, 1, 1, 1,
-1.450852, 0.0920554, -0.4242002, 1, 1, 1, 1, 1,
-1.446255, -0.6631928, -1.235651, 1, 1, 1, 1, 1,
-1.43915, 1.373667, 0.4584306, 1, 1, 1, 1, 1,
-1.429592, 1.502694, -0.4404144, 1, 1, 1, 1, 1,
-1.423871, -0.512681, -3.282944, 1, 1, 1, 1, 1,
-1.413931, -1.222741, -1.171807, 1, 1, 1, 1, 1,
-1.407442, 1.108267, -1.349546, 1, 1, 1, 1, 1,
-1.401355, -0.2181686, -1.43064, 1, 1, 1, 1, 1,
-1.394292, -2.897365, -4.570159, 1, 1, 1, 1, 1,
-1.382288, -0.4245167, -0.8167284, 0, 0, 1, 1, 1,
-1.376806, -1.668413, -1.042236, 1, 0, 0, 1, 1,
-1.371457, 0.9955894, -0.1428535, 1, 0, 0, 1, 1,
-1.367831, -1.278056, -2.029936, 1, 0, 0, 1, 1,
-1.34798, -0.4807337, -0.2361411, 1, 0, 0, 1, 1,
-1.334352, 0.2076379, -1.809708, 1, 0, 0, 1, 1,
-1.331586, 0.3444993, -1.055106, 0, 0, 0, 1, 1,
-1.330443, -0.984821, -1.829599, 0, 0, 0, 1, 1,
-1.319281, 0.846998, -1.164401, 0, 0, 0, 1, 1,
-1.31831, -1.188522, -1.754849, 0, 0, 0, 1, 1,
-1.318078, 0.1586167, -1.140702, 0, 0, 0, 1, 1,
-1.31541, -0.843848, -2.633994, 0, 0, 0, 1, 1,
-1.300919, 1.027812, -2.835944, 0, 0, 0, 1, 1,
-1.294097, 0.9808864, -1.316814, 1, 1, 1, 1, 1,
-1.290018, 0.1411681, -0.683066, 1, 1, 1, 1, 1,
-1.285167, -2.792989, -4.615729, 1, 1, 1, 1, 1,
-1.278264, -0.9052061, -1.164976, 1, 1, 1, 1, 1,
-1.275802, 0.2654615, -1.509646, 1, 1, 1, 1, 1,
-1.265849, 0.6127524, -1.658963, 1, 1, 1, 1, 1,
-1.265504, 0.4996978, -1.451545, 1, 1, 1, 1, 1,
-1.26199, -0.7898906, -3.364769, 1, 1, 1, 1, 1,
-1.251698, -0.9599074, -2.134977, 1, 1, 1, 1, 1,
-1.238585, 0.9130576, 0.92488, 1, 1, 1, 1, 1,
-1.237533, -0.003505255, -2.649374, 1, 1, 1, 1, 1,
-1.236917, 1.149781, -1.968869, 1, 1, 1, 1, 1,
-1.233492, 1.423206, -2.942228, 1, 1, 1, 1, 1,
-1.228714, -0.05743467, -0.6442041, 1, 1, 1, 1, 1,
-1.222698, 1.212439, 1.173953, 1, 1, 1, 1, 1,
-1.204047, -0.6676801, -2.114789, 0, 0, 1, 1, 1,
-1.203919, 0.9592188, -0.8912404, 1, 0, 0, 1, 1,
-1.193763, -0.9596518, -2.568327, 1, 0, 0, 1, 1,
-1.186976, 1.233215, -1.032046, 1, 0, 0, 1, 1,
-1.184422, -0.2084204, -1.346224, 1, 0, 0, 1, 1,
-1.180235, 0.3722948, -1.58392, 1, 0, 0, 1, 1,
-1.177805, -0.558982, -1.164421, 0, 0, 0, 1, 1,
-1.169393, 0.2997119, -1.999522, 0, 0, 0, 1, 1,
-1.160347, -1.18766, -1.031157, 0, 0, 0, 1, 1,
-1.153877, -1.663725, -2.962986, 0, 0, 0, 1, 1,
-1.14783, -0.6944609, -1.897107, 0, 0, 0, 1, 1,
-1.138032, 0.04304208, -1.765054, 0, 0, 0, 1, 1,
-1.135431, -2.362262, -2.678107, 0, 0, 0, 1, 1,
-1.134582, -0.2386889, -0.8940577, 1, 1, 1, 1, 1,
-1.133277, 0.06844792, -1.657816, 1, 1, 1, 1, 1,
-1.132972, -0.2022255, -1.220293, 1, 1, 1, 1, 1,
-1.128924, 0.946986, -1.508162, 1, 1, 1, 1, 1,
-1.122347, -0.04293718, -0.6306654, 1, 1, 1, 1, 1,
-1.113584, 0.4393706, -0.002876481, 1, 1, 1, 1, 1,
-1.099503, -1.053525, -3.510998, 1, 1, 1, 1, 1,
-1.099393, -0.4710248, -1.703871, 1, 1, 1, 1, 1,
-1.093828, -0.388453, -0.6054603, 1, 1, 1, 1, 1,
-1.090801, -0.3086415, -3.377427, 1, 1, 1, 1, 1,
-1.081956, -0.7024203, -0.3245803, 1, 1, 1, 1, 1,
-1.080957, 0.1162115, -0.5281129, 1, 1, 1, 1, 1,
-1.079207, -1.480203, -2.611591, 1, 1, 1, 1, 1,
-1.069399, 0.911572, -2.689085, 1, 1, 1, 1, 1,
-1.06457, -0.2453171, 0.2707345, 1, 1, 1, 1, 1,
-1.062652, -1.265174, -4.140882, 0, 0, 1, 1, 1,
-1.057049, 0.02252059, -2.946925, 1, 0, 0, 1, 1,
-1.055267, 0.9543006, 0.6478716, 1, 0, 0, 1, 1,
-1.054689, -1.093102, -0.9639989, 1, 0, 0, 1, 1,
-1.052626, -1.764744, -2.954259, 1, 0, 0, 1, 1,
-1.050693, -0.7012292, -3.229753, 1, 0, 0, 1, 1,
-1.043352, 1.575545, -1.351981, 0, 0, 0, 1, 1,
-1.03277, -1.525684, -3.443814, 0, 0, 0, 1, 1,
-1.030231, 0.08676, -2.273615, 0, 0, 0, 1, 1,
-1.02711, 1.420361, -2.050557, 0, 0, 0, 1, 1,
-1.025674, 1.483547, -0.3932343, 0, 0, 0, 1, 1,
-1.023686, 0.8612797, -0.9631936, 0, 0, 0, 1, 1,
-1.014028, -0.7842389, -2.414979, 0, 0, 0, 1, 1,
-1.008509, 0.3523999, -5.260076, 1, 1, 1, 1, 1,
-1.006517, 0.4141428, -2.175946, 1, 1, 1, 1, 1,
-1.004692, -0.6043238, -1.979281, 1, 1, 1, 1, 1,
-0.9992138, -2.657757, -3.277048, 1, 1, 1, 1, 1,
-0.9970085, 1.824703, -0.4626975, 1, 1, 1, 1, 1,
-0.9929424, -0.6548746, -0.03124284, 1, 1, 1, 1, 1,
-0.989418, 0.3925431, -2.861773, 1, 1, 1, 1, 1,
-0.9814186, -1.689648, -1.031745, 1, 1, 1, 1, 1,
-0.9802093, -1.859593, -3.461368, 1, 1, 1, 1, 1,
-0.9759164, 1.093035, -2.762486, 1, 1, 1, 1, 1,
-0.9753647, -1.317448, -0.2852317, 1, 1, 1, 1, 1,
-0.9694667, 1.683421, -1.985828, 1, 1, 1, 1, 1,
-0.9677937, -1.184775, -2.861926, 1, 1, 1, 1, 1,
-0.9606749, 0.6667206, -0.4181716, 1, 1, 1, 1, 1,
-0.9603116, 0.08036221, -1.149346, 1, 1, 1, 1, 1,
-0.9591203, 0.1235602, -1.579195, 0, 0, 1, 1, 1,
-0.9512916, -1.004426, -2.658696, 1, 0, 0, 1, 1,
-0.9460644, -0.07059419, -1.238299, 1, 0, 0, 1, 1,
-0.9441765, 0.9737199, -0.4481137, 1, 0, 0, 1, 1,
-0.930723, 0.133914, -1.115545, 1, 0, 0, 1, 1,
-0.9292809, 0.5840195, -1.56033, 1, 0, 0, 1, 1,
-0.9275498, 2.52411, -0.8773072, 0, 0, 0, 1, 1,
-0.9266185, -0.8633734, -3.130017, 0, 0, 0, 1, 1,
-0.9225335, -1.160238, -3.422843, 0, 0, 0, 1, 1,
-0.9087374, 0.9365005, -2.540535, 0, 0, 0, 1, 1,
-0.9020603, -0.03716226, -1.414636, 0, 0, 0, 1, 1,
-0.9019448, 0.7491012, -0.05404501, 0, 0, 0, 1, 1,
-0.8986639, -0.5611269, -2.594731, 0, 0, 0, 1, 1,
-0.8919811, -0.6180393, -2.515144, 1, 1, 1, 1, 1,
-0.8904561, 0.7718844, -1.2228, 1, 1, 1, 1, 1,
-0.8868414, 1.09552, -1.267653, 1, 1, 1, 1, 1,
-0.8855098, 1.014533, 0.3618851, 1, 1, 1, 1, 1,
-0.8816555, -0.8657635, -1.050143, 1, 1, 1, 1, 1,
-0.8806304, 0.5749581, -0.1967775, 1, 1, 1, 1, 1,
-0.8762745, -2.514987, -2.881901, 1, 1, 1, 1, 1,
-0.8723117, -0.1227026, -2.217612, 1, 1, 1, 1, 1,
-0.8703188, -1.549739, -0.6758816, 1, 1, 1, 1, 1,
-0.8675848, 0.1991669, -2.578032, 1, 1, 1, 1, 1,
-0.8661734, -1.260732, -2.370268, 1, 1, 1, 1, 1,
-0.8656703, 1.338133, -1.39827, 1, 1, 1, 1, 1,
-0.8626891, 0.5117501, -0.5753089, 1, 1, 1, 1, 1,
-0.8594811, 0.2162602, -1.290597, 1, 1, 1, 1, 1,
-0.8552006, -0.5112932, -0.9946581, 1, 1, 1, 1, 1,
-0.8542625, -0.2878437, -1.008251, 0, 0, 1, 1, 1,
-0.8508109, 0.2904988, 0.03388362, 1, 0, 0, 1, 1,
-0.8475375, -0.4973193, -1.907359, 1, 0, 0, 1, 1,
-0.8397163, 0.337506, -1.707814, 1, 0, 0, 1, 1,
-0.8378652, -0.3007887, -0.6029143, 1, 0, 0, 1, 1,
-0.8328348, -0.3889906, -1.334013, 1, 0, 0, 1, 1,
-0.8255935, -0.3441063, -1.741491, 0, 0, 0, 1, 1,
-0.8248665, 0.6953503, -0.8803637, 0, 0, 0, 1, 1,
-0.8191122, 0.4477293, 1.058029, 0, 0, 0, 1, 1,
-0.8190968, -0.7812613, -3.354955, 0, 0, 0, 1, 1,
-0.8188651, -0.6260992, -1.369723, 0, 0, 0, 1, 1,
-0.8150886, -0.2318188, -2.379867, 0, 0, 0, 1, 1,
-0.8108169, 0.7309314, 0.1749039, 0, 0, 0, 1, 1,
-0.8103225, -1.835697, -3.647969, 1, 1, 1, 1, 1,
-0.8101709, -0.2631404, -1.210224, 1, 1, 1, 1, 1,
-0.8096542, 0.3877083, -0.7336801, 1, 1, 1, 1, 1,
-0.8013744, 2.031467, -1.10786, 1, 1, 1, 1, 1,
-0.7975634, -0.1139586, -1.96991, 1, 1, 1, 1, 1,
-0.788334, 0.6222407, -2.816194, 1, 1, 1, 1, 1,
-0.7871125, 0.8172118, -0.1474679, 1, 1, 1, 1, 1,
-0.7835091, -0.08029272, 0.3758638, 1, 1, 1, 1, 1,
-0.7787955, -0.5269705, -2.263837, 1, 1, 1, 1, 1,
-0.7786737, -0.4316096, -2.011123, 1, 1, 1, 1, 1,
-0.7687771, 0.7575243, -0.250203, 1, 1, 1, 1, 1,
-0.7587551, -0.07860705, -1.831563, 1, 1, 1, 1, 1,
-0.7536904, -0.05570027, -0.485812, 1, 1, 1, 1, 1,
-0.7522702, 1.224007, -2.722962, 1, 1, 1, 1, 1,
-0.7439866, 0.1932748, -2.199809, 1, 1, 1, 1, 1,
-0.7414969, 0.1211702, -1.306299, 0, 0, 1, 1, 1,
-0.735419, -0.3402497, -2.360068, 1, 0, 0, 1, 1,
-0.7344194, -2.018354, -2.530085, 1, 0, 0, 1, 1,
-0.7336901, -1.499058, -4.270364, 1, 0, 0, 1, 1,
-0.7298988, -2.564178, -4.330543, 1, 0, 0, 1, 1,
-0.7249854, -1.336619, -1.285742, 1, 0, 0, 1, 1,
-0.7214532, 1.400243, -1.315259, 0, 0, 0, 1, 1,
-0.7202881, 0.1756691, -2.431365, 0, 0, 0, 1, 1,
-0.7171546, 0.2816783, -0.6558169, 0, 0, 0, 1, 1,
-0.7145378, -0.3137533, -0.1960676, 0, 0, 0, 1, 1,
-0.7116429, -1.053509, -2.267077, 0, 0, 0, 1, 1,
-0.7101058, -0.3073336, -1.776327, 0, 0, 0, 1, 1,
-0.7093246, 0.3081689, -2.229925, 0, 0, 0, 1, 1,
-0.7076594, 0.0157181, -1.881783, 1, 1, 1, 1, 1,
-0.7069795, -0.7115051, -1.407195, 1, 1, 1, 1, 1,
-0.7035949, -1.326895, -1.975519, 1, 1, 1, 1, 1,
-0.7000411, -0.902994, -3.641215, 1, 1, 1, 1, 1,
-0.6981573, 0.8433356, -0.9657508, 1, 1, 1, 1, 1,
-0.6980184, 0.6736481, -3.010288, 1, 1, 1, 1, 1,
-0.6960753, -1.131588, -1.768694, 1, 1, 1, 1, 1,
-0.6939723, 0.2637623, 0.5255368, 1, 1, 1, 1, 1,
-0.6936271, -0.3349123, -1.706847, 1, 1, 1, 1, 1,
-0.6921853, 1.917898, 0.5715637, 1, 1, 1, 1, 1,
-0.690993, -1.679296, -3.497862, 1, 1, 1, 1, 1,
-0.6904331, 0.06822087, -1.196802, 1, 1, 1, 1, 1,
-0.6870283, -0.06060957, -3.5547, 1, 1, 1, 1, 1,
-0.6777241, 0.6143702, 0.3251476, 1, 1, 1, 1, 1,
-0.6750437, 0.4035758, -1.730404, 1, 1, 1, 1, 1,
-0.6745606, -0.302176, -2.676515, 0, 0, 1, 1, 1,
-0.6616265, -2.029416, -2.006989, 1, 0, 0, 1, 1,
-0.6597706, -1.462593, -2.563496, 1, 0, 0, 1, 1,
-0.659134, 1.874567, -0.826743, 1, 0, 0, 1, 1,
-0.6570018, 0.2472593, -2.460165, 1, 0, 0, 1, 1,
-0.6542854, -0.3437929, -0.6069453, 1, 0, 0, 1, 1,
-0.6482738, -0.5892854, -1.612648, 0, 0, 0, 1, 1,
-0.6457976, -0.480386, -2.893001, 0, 0, 0, 1, 1,
-0.6425981, -0.8125927, -2.610883, 0, 0, 0, 1, 1,
-0.6394596, -0.3943897, -4.242215, 0, 0, 0, 1, 1,
-0.6381309, -0.4511907, -1.685939, 0, 0, 0, 1, 1,
-0.6322521, 0.2426431, -2.516344, 0, 0, 0, 1, 1,
-0.6236573, 0.2546977, -0.916227, 0, 0, 0, 1, 1,
-0.6232576, 1.103594, -0.2083574, 1, 1, 1, 1, 1,
-0.6228856, 0.3289622, -1.491183, 1, 1, 1, 1, 1,
-0.6070333, -0.4046234, -2.052598, 1, 1, 1, 1, 1,
-0.6046958, -0.004685757, -3.286456, 1, 1, 1, 1, 1,
-0.6029943, -1.484794, -4.840061, 1, 1, 1, 1, 1,
-0.5988511, 0.2779335, -2.220263, 1, 1, 1, 1, 1,
-0.596378, -1.062183, -1.788024, 1, 1, 1, 1, 1,
-0.5953647, -0.2974793, -3.620341, 1, 1, 1, 1, 1,
-0.5941633, -0.7821193, -2.010658, 1, 1, 1, 1, 1,
-0.5902618, 0.5859655, -1.053151, 1, 1, 1, 1, 1,
-0.586777, 1.458349, -0.1082829, 1, 1, 1, 1, 1,
-0.5860332, -1.485565, -4.312532, 1, 1, 1, 1, 1,
-0.5772184, -0.9910812, -1.831701, 1, 1, 1, 1, 1,
-0.5769038, 0.01230154, -0.9585632, 1, 1, 1, 1, 1,
-0.5726623, 0.8413655, 0.06814084, 1, 1, 1, 1, 1,
-0.5713758, -1.308813, -4.402607, 0, 0, 1, 1, 1,
-0.5672252, -0.5008461, -2.904234, 1, 0, 0, 1, 1,
-0.5665411, -0.2672321, -2.358447, 1, 0, 0, 1, 1,
-0.5660753, -0.745253, -2.68923, 1, 0, 0, 1, 1,
-0.5633485, -0.1888115, -0.7975647, 1, 0, 0, 1, 1,
-0.5621644, 0.3046497, -1.627028, 1, 0, 0, 1, 1,
-0.5599367, -0.2085613, -1.698337, 0, 0, 0, 1, 1,
-0.5478081, -1.419897, -2.788038, 0, 0, 0, 1, 1,
-0.5430664, -0.7368892, -2.395982, 0, 0, 0, 1, 1,
-0.5427481, -0.6237697, -3.335407, 0, 0, 0, 1, 1,
-0.5408329, 0.5279652, 0.9320449, 0, 0, 0, 1, 1,
-0.539958, -0.05854039, -0.9253237, 0, 0, 0, 1, 1,
-0.5376266, -0.4771604, -2.489261, 0, 0, 0, 1, 1,
-0.5187068, 0.6365091, -0.07916563, 1, 1, 1, 1, 1,
-0.5159287, 0.5801408, -1.695424, 1, 1, 1, 1, 1,
-0.5130365, -0.005158363, -3.286241, 1, 1, 1, 1, 1,
-0.5100238, 1.334062, -1.916395, 1, 1, 1, 1, 1,
-0.5068076, -0.6433382, -2.235701, 1, 1, 1, 1, 1,
-0.5041016, 0.2914276, -1.15879, 1, 1, 1, 1, 1,
-0.5040075, 0.01172097, -2.622594, 1, 1, 1, 1, 1,
-0.4998603, -1.423482, -0.9652502, 1, 1, 1, 1, 1,
-0.4959293, 0.1331199, -3.127797, 1, 1, 1, 1, 1,
-0.4948531, -0.2263456, -3.265865, 1, 1, 1, 1, 1,
-0.4858977, 0.02672141, -0.3791938, 1, 1, 1, 1, 1,
-0.4858667, 0.6263083, -0.2807957, 1, 1, 1, 1, 1,
-0.4831089, 0.2118134, -1.091119, 1, 1, 1, 1, 1,
-0.4825698, -2.269388, -1.350173, 1, 1, 1, 1, 1,
-0.47721, -0.2142783, -0.210311, 1, 1, 1, 1, 1,
-0.4738264, 1.391928, -0.3537351, 0, 0, 1, 1, 1,
-0.4677665, 0.5923675, 0.8481984, 1, 0, 0, 1, 1,
-0.4668856, -0.2393364, -2.100694, 1, 0, 0, 1, 1,
-0.4653206, 0.1867094, -2.680506, 1, 0, 0, 1, 1,
-0.4622193, -0.09352493, -4.100948, 1, 0, 0, 1, 1,
-0.4617381, 0.1289644, -1.753197, 1, 0, 0, 1, 1,
-0.4615082, 1.293802, 0.897724, 0, 0, 0, 1, 1,
-0.4614993, 0.6503398, -0.8422875, 0, 0, 0, 1, 1,
-0.4596868, 0.8155411, -0.1668475, 0, 0, 0, 1, 1,
-0.4539611, -1.168507, -2.10697, 0, 0, 0, 1, 1,
-0.4535445, 0.6978485, 0.9697146, 0, 0, 0, 1, 1,
-0.4534592, -0.1062281, -1.430956, 0, 0, 0, 1, 1,
-0.4509223, 1.367888, -2.183692, 0, 0, 0, 1, 1,
-0.4500243, 0.6406388, -1.231211, 1, 1, 1, 1, 1,
-0.4461491, -1.054425, -2.854676, 1, 1, 1, 1, 1,
-0.44563, -0.5617459, -1.633451, 1, 1, 1, 1, 1,
-0.4437184, 0.9562334, -1.57907, 1, 1, 1, 1, 1,
-0.4423925, -1.297371, -1.914187, 1, 1, 1, 1, 1,
-0.4407944, 2.620809, 0.3152998, 1, 1, 1, 1, 1,
-0.4399831, -1.54576, -2.547748, 1, 1, 1, 1, 1,
-0.4391181, 0.2376928, -0.6414408, 1, 1, 1, 1, 1,
-0.4352731, 0.9436226, -1.375568, 1, 1, 1, 1, 1,
-0.433703, 0.9544615, -0.03085564, 1, 1, 1, 1, 1,
-0.4319104, 0.5049137, -1.505884, 1, 1, 1, 1, 1,
-0.4299676, -1.7006, -4.375198, 1, 1, 1, 1, 1,
-0.4255703, -0.2049341, -1.714277, 1, 1, 1, 1, 1,
-0.4244305, -0.7336075, -3.035393, 1, 1, 1, 1, 1,
-0.4238816, -0.2657888, -3.494803, 1, 1, 1, 1, 1,
-0.4230831, -1.799883, -3.995988, 0, 0, 1, 1, 1,
-0.4206187, 0.4926434, -0.5841045, 1, 0, 0, 1, 1,
-0.419812, -0.7340282, -2.357481, 1, 0, 0, 1, 1,
-0.4196393, -0.886184, -2.482851, 1, 0, 0, 1, 1,
-0.4136982, 0.4559425, -0.5619776, 1, 0, 0, 1, 1,
-0.4135537, 1.226261, -0.9153735, 1, 0, 0, 1, 1,
-0.4118846, 1.145309, -1.2959, 0, 0, 0, 1, 1,
-0.4101868, 0.3576966, -1.014938, 0, 0, 0, 1, 1,
-0.4087348, -1.172667, -5.607168, 0, 0, 0, 1, 1,
-0.4081652, -0.6143658, -2.802777, 0, 0, 0, 1, 1,
-0.4074138, -0.612625, -1.785636, 0, 0, 0, 1, 1,
-0.3982864, 0.540327, -1.933156, 0, 0, 0, 1, 1,
-0.393725, -0.272656, -2.726928, 0, 0, 0, 1, 1,
-0.3931114, -0.4623218, -2.23136, 1, 1, 1, 1, 1,
-0.3919435, 0.894967, -0.6152541, 1, 1, 1, 1, 1,
-0.3897687, 0.8760034, 0.5891439, 1, 1, 1, 1, 1,
-0.3888662, 0.9888964, -1.088906, 1, 1, 1, 1, 1,
-0.3828651, -0.2523901, -1.459697, 1, 1, 1, 1, 1,
-0.3817542, 0.8486019, -1.870422, 1, 1, 1, 1, 1,
-0.3770554, -0.4669352, -3.09922, 1, 1, 1, 1, 1,
-0.3769631, 1.432378, 0.4384481, 1, 1, 1, 1, 1,
-0.375936, 1.006204, 0.5017557, 1, 1, 1, 1, 1,
-0.3694015, -0.7442753, -2.400576, 1, 1, 1, 1, 1,
-0.3648386, 1.468287, -0.8539525, 1, 1, 1, 1, 1,
-0.3638127, 0.285014, -1.181618, 1, 1, 1, 1, 1,
-0.3627928, -0.352485, -1.45421, 1, 1, 1, 1, 1,
-0.3622626, -0.4247625, -2.749325, 1, 1, 1, 1, 1,
-0.3577365, 1.193384, 1.694742, 1, 1, 1, 1, 1,
-0.3559707, 0.4577281, -0.6837045, 0, 0, 1, 1, 1,
-0.3530771, 0.04218341, -1.590183, 1, 0, 0, 1, 1,
-0.352421, -0.6450631, -0.5836165, 1, 0, 0, 1, 1,
-0.3454995, -0.3141777, 0.4544198, 1, 0, 0, 1, 1,
-0.3443006, -0.6012186, -4.345228, 1, 0, 0, 1, 1,
-0.3393871, -0.03383931, -2.797841, 1, 0, 0, 1, 1,
-0.3391439, 0.9945425, -0.8374111, 0, 0, 0, 1, 1,
-0.3383621, -0.2389992, -3.990747, 0, 0, 0, 1, 1,
-0.3310117, -1.461269, -3.846185, 0, 0, 0, 1, 1,
-0.3292263, 1.16421, -0.516804, 0, 0, 0, 1, 1,
-0.328547, 0.1070762, -2.687658, 0, 0, 0, 1, 1,
-0.3284945, -0.3158067, -0.9598611, 0, 0, 0, 1, 1,
-0.327508, 0.4532477, -1.164735, 0, 0, 0, 1, 1,
-0.3261346, -0.03625638, -2.782025, 1, 1, 1, 1, 1,
-0.3228635, -0.3623614, -2.674693, 1, 1, 1, 1, 1,
-0.3219954, -0.4380088, -2.888664, 1, 1, 1, 1, 1,
-0.3217045, 0.02400299, -2.072649, 1, 1, 1, 1, 1,
-0.3187861, -0.4701657, -2.182978, 1, 1, 1, 1, 1,
-0.3154974, -1.043354, -1.678576, 1, 1, 1, 1, 1,
-0.3124885, -0.05000106, -1.429247, 1, 1, 1, 1, 1,
-0.3120291, 0.04721145, -1.622301, 1, 1, 1, 1, 1,
-0.311508, 0.6784286, 0.1425727, 1, 1, 1, 1, 1,
-0.3092667, -0.9534645, -2.575581, 1, 1, 1, 1, 1,
-0.3054637, 2.000663, -0.581098, 1, 1, 1, 1, 1,
-0.3024513, -1.042382, -3.400307, 1, 1, 1, 1, 1,
-0.299996, 1.07087, -1.02246, 1, 1, 1, 1, 1,
-0.2990916, -1.482718, -2.873469, 1, 1, 1, 1, 1,
-0.2971599, -0.5125566, -4.120032, 1, 1, 1, 1, 1,
-0.2925073, -0.2886205, -1.226556, 0, 0, 1, 1, 1,
-0.2816994, 1.333084, -0.08895132, 1, 0, 0, 1, 1,
-0.2799291, -0.9176761, -3.333174, 1, 0, 0, 1, 1,
-0.274348, -0.9050819, -1.596213, 1, 0, 0, 1, 1,
-0.2723529, 1.810107, -0.654731, 1, 0, 0, 1, 1,
-0.2712362, 1.186363, -1.611608, 1, 0, 0, 1, 1,
-0.2706199, 0.4148889, -2.167142, 0, 0, 0, 1, 1,
-0.2672498, -0.5480999, -2.762545, 0, 0, 0, 1, 1,
-0.2672399, -0.1927888, -4.515699, 0, 0, 0, 1, 1,
-0.2658169, 1.796131, -1.322076, 0, 0, 0, 1, 1,
-0.2639076, 0.1219904, -2.618964, 0, 0, 0, 1, 1,
-0.2621752, 0.2929704, -2.71414, 0, 0, 0, 1, 1,
-0.2603422, -0.009590001, -0.3791772, 0, 0, 0, 1, 1,
-0.2532817, 1.040435, -0.2179012, 1, 1, 1, 1, 1,
-0.2525387, 0.4338887, -0.9878691, 1, 1, 1, 1, 1,
-0.2452864, -0.9593197, -2.566593, 1, 1, 1, 1, 1,
-0.2404292, 0.5456803, 0.03739939, 1, 1, 1, 1, 1,
-0.2368206, 0.4816344, -0.5976145, 1, 1, 1, 1, 1,
-0.2302449, 0.294152, -0.9645686, 1, 1, 1, 1, 1,
-0.2294544, -1.119556, -1.847685, 1, 1, 1, 1, 1,
-0.2284525, -0.1797128, -1.745078, 1, 1, 1, 1, 1,
-0.2276711, -1.607183, -3.95158, 1, 1, 1, 1, 1,
-0.2202636, 0.9042622, -1.400415, 1, 1, 1, 1, 1,
-0.2186238, 0.590668, -0.3664925, 1, 1, 1, 1, 1,
-0.2037274, 0.2205533, -0.6324858, 1, 1, 1, 1, 1,
-0.2022609, -1.80582, -3.386158, 1, 1, 1, 1, 1,
-0.1985966, 0.3181093, -1.111591, 1, 1, 1, 1, 1,
-0.196298, 1.873788, 0.2418541, 1, 1, 1, 1, 1,
-0.1962701, 0.7689646, -0.4856645, 0, 0, 1, 1, 1,
-0.1879456, 0.8237112, 0.9738574, 1, 0, 0, 1, 1,
-0.1876469, 0.1579218, 1.464785, 1, 0, 0, 1, 1,
-0.1850463, 1.251848, 1.412323, 1, 0, 0, 1, 1,
-0.184051, 0.07742894, -1.640823, 1, 0, 0, 1, 1,
-0.1837267, 1.018455, 0.3262042, 1, 0, 0, 1, 1,
-0.1779522, -0.6231503, -2.323438, 0, 0, 0, 1, 1,
-0.1776086, -0.2577944, -3.04299, 0, 0, 0, 1, 1,
-0.175742, 0.08803712, -2.664294, 0, 0, 0, 1, 1,
-0.1719815, -0.7638997, -4.217761, 0, 0, 0, 1, 1,
-0.1708527, 1.082836, -0.4632872, 0, 0, 0, 1, 1,
-0.168967, -0.5200799, -3.883475, 0, 0, 0, 1, 1,
-0.1686626, -0.7235086, -4.770359, 0, 0, 0, 1, 1,
-0.1653186, -0.8549135, -1.365132, 1, 1, 1, 1, 1,
-0.1650194, 0.5129157, -0.475266, 1, 1, 1, 1, 1,
-0.1610189, 1.766944, -1.15029, 1, 1, 1, 1, 1,
-0.1574036, 0.1134521, -0.959782, 1, 1, 1, 1, 1,
-0.1561051, -1.85453, -4.430047, 1, 1, 1, 1, 1,
-0.1549367, 0.7363669, 1.066358, 1, 1, 1, 1, 1,
-0.1520254, 0.1038239, -1.145404, 1, 1, 1, 1, 1,
-0.1504487, -0.05199702, -1.578984, 1, 1, 1, 1, 1,
-0.1452168, 0.3515296, 0.3081967, 1, 1, 1, 1, 1,
-0.1414722, 1.512658, -0.3934142, 1, 1, 1, 1, 1,
-0.1414715, -0.2597331, -3.499614, 1, 1, 1, 1, 1,
-0.140832, -0.9248691, -5.316577, 1, 1, 1, 1, 1,
-0.1398034, -0.6714357, -4.066494, 1, 1, 1, 1, 1,
-0.1372166, -1.526803, -3.346694, 1, 1, 1, 1, 1,
-0.136187, -0.1571335, -1.074923, 1, 1, 1, 1, 1,
-0.1339818, 1.310007, 1.580055, 0, 0, 1, 1, 1,
-0.1225376, 0.5827242, -0.152979, 1, 0, 0, 1, 1,
-0.117473, -2.266984, -3.005549, 1, 0, 0, 1, 1,
-0.1151784, -1.05449, -1.124786, 1, 0, 0, 1, 1,
-0.112716, 1.21207, -1.864781, 1, 0, 0, 1, 1,
-0.1120142, 0.3286262, 1.144362, 1, 0, 0, 1, 1,
-0.1110772, -1.257636, -3.017995, 0, 0, 0, 1, 1,
-0.1069551, -0.5853614, -3.678218, 0, 0, 0, 1, 1,
-0.1031841, -0.8730041, -1.917195, 0, 0, 0, 1, 1,
-0.1017039, -1.622477, -2.690078, 0, 0, 0, 1, 1,
-0.0999663, -0.4406546, -0.195649, 0, 0, 0, 1, 1,
-0.09725396, -0.7072347, -1.993981, 0, 0, 0, 1, 1,
-0.09538405, -0.9403103, -2.627871, 0, 0, 0, 1, 1,
-0.09531613, 1.027576, -0.1704717, 1, 1, 1, 1, 1,
-0.09297232, -2.952307, -3.533574, 1, 1, 1, 1, 1,
-0.0918714, 2.3897, 0.7399995, 1, 1, 1, 1, 1,
-0.08693355, -0.2621601, -5.707601, 1, 1, 1, 1, 1,
-0.08144812, 1.770652, -0.594029, 1, 1, 1, 1, 1,
-0.07665646, -1.111605, -4.036489, 1, 1, 1, 1, 1,
-0.07558861, 0.01439756, -0.02721701, 1, 1, 1, 1, 1,
-0.07361218, 0.6002771, -0.5344403, 1, 1, 1, 1, 1,
-0.07154325, 0.1721948, -0.3433574, 1, 1, 1, 1, 1,
-0.06764314, -0.4715106, -3.559391, 1, 1, 1, 1, 1,
-0.06605318, -0.3320548, -1.441805, 1, 1, 1, 1, 1,
-0.06292259, -2.406106, -3.376694, 1, 1, 1, 1, 1,
-0.0527852, 0.8128829, -0.3771344, 1, 1, 1, 1, 1,
-0.05060738, 0.5815909, 0.839125, 1, 1, 1, 1, 1,
-0.04638884, -1.39672, -2.993584, 1, 1, 1, 1, 1,
-0.04386134, -0.5893638, -2.843013, 0, 0, 1, 1, 1,
-0.04110903, -0.1841303, -2.521474, 1, 0, 0, 1, 1,
-0.03813433, -0.5531361, -4.026002, 1, 0, 0, 1, 1,
-0.0370896, 0.9908708, -0.7568113, 1, 0, 0, 1, 1,
-0.03678761, -0.9650825, -2.815004, 1, 0, 0, 1, 1,
-0.02467388, -1.246447, -1.880476, 1, 0, 0, 1, 1,
-0.02452122, -0.5736021, -3.523658, 0, 0, 0, 1, 1,
-0.02172345, -0.4274962, -4.65646, 0, 0, 0, 1, 1,
-0.02165995, 0.00624785, -1.833534, 0, 0, 0, 1, 1,
-0.01412669, 1.647902, 1.529789, 0, 0, 0, 1, 1,
-0.01382675, 0.1274457, 1.287656, 0, 0, 0, 1, 1,
-0.00994604, -1.485213, -1.813411, 0, 0, 0, 1, 1,
-0.008658681, 2.169062, 1.539055, 0, 0, 0, 1, 1,
-0.008060572, 0.9823911, 1.36948, 1, 1, 1, 1, 1,
-0.007984772, -0.3662594, -3.388018, 1, 1, 1, 1, 1,
-0.005613098, -0.1022438, -1.673321, 1, 1, 1, 1, 1,
-0.002853928, 0.0143017, -1.519947, 1, 1, 1, 1, 1,
-0.00184908, 0.6720151, 0.655161, 1, 1, 1, 1, 1,
-0.001153424, -2.232643, -3.662607, 1, 1, 1, 1, 1,
-0.0007321322, -0.178243, -3.602274, 1, 1, 1, 1, 1,
0.009711587, 0.9031851, 0.1572672, 1, 1, 1, 1, 1,
0.01026981, -2.469652, 3.531324, 1, 1, 1, 1, 1,
0.01113906, -0.9228213, 3.145641, 1, 1, 1, 1, 1,
0.01353903, -0.2252957, 3.064344, 1, 1, 1, 1, 1,
0.01403489, 0.03583026, 1.549959, 1, 1, 1, 1, 1,
0.01861404, -0.4314573, 4.014235, 1, 1, 1, 1, 1,
0.01961706, -1.171616, 3.478954, 1, 1, 1, 1, 1,
0.02040068, 0.3917439, 0.1516468, 1, 1, 1, 1, 1,
0.02364579, -0.3650136, 4.450134, 0, 0, 1, 1, 1,
0.02373889, 0.7278546, 0.3894256, 1, 0, 0, 1, 1,
0.02960525, 1.399409, 1.683602, 1, 0, 0, 1, 1,
0.03434477, -0.6891649, 1.55438, 1, 0, 0, 1, 1,
0.03496867, -0.398266, 2.764135, 1, 0, 0, 1, 1,
0.03504297, 0.1400868, -0.4915141, 1, 0, 0, 1, 1,
0.04010973, -1.450345, 2.692132, 0, 0, 0, 1, 1,
0.04386651, -2.932219, 2.459216, 0, 0, 0, 1, 1,
0.04642761, -0.1091706, 1.755042, 0, 0, 0, 1, 1,
0.04687225, 1.638497, -0.2876611, 0, 0, 0, 1, 1,
0.04914599, -1.489518, 3.790462, 0, 0, 0, 1, 1,
0.05059845, -0.8683118, 2.035266, 0, 0, 0, 1, 1,
0.05812845, 0.2462383, 0.8629699, 0, 0, 0, 1, 1,
0.06113847, 0.2092847, -0.0090188, 1, 1, 1, 1, 1,
0.06280599, -0.8664602, 2.213997, 1, 1, 1, 1, 1,
0.06286282, -0.4956082, 1.07797, 1, 1, 1, 1, 1,
0.06540024, 0.04100876, 1.584605, 1, 1, 1, 1, 1,
0.06735037, -0.7209342, 2.963334, 1, 1, 1, 1, 1,
0.06966636, -0.5439, 3.608781, 1, 1, 1, 1, 1,
0.07922779, 1.631025, 0.1387388, 1, 1, 1, 1, 1,
0.08530827, 1.1759, 0.7525839, 1, 1, 1, 1, 1,
0.08544496, -1.734217, 3.415034, 1, 1, 1, 1, 1,
0.08685648, -0.3589566, 3.940828, 1, 1, 1, 1, 1,
0.08898979, -1.070954, 3.833838, 1, 1, 1, 1, 1,
0.09068366, -1.076093, 2.200053, 1, 1, 1, 1, 1,
0.09209777, -1.307742, 3.084401, 1, 1, 1, 1, 1,
0.09301927, -0.03519621, 1.020016, 1, 1, 1, 1, 1,
0.09508704, 0.4772857, 0.7017056, 1, 1, 1, 1, 1,
0.1029957, 0.181096, 0.6966571, 0, 0, 1, 1, 1,
0.1041935, -0.1333375, 2.209766, 1, 0, 0, 1, 1,
0.1067118, -1.060835, 3.061309, 1, 0, 0, 1, 1,
0.1108345, -0.09912418, 2.683068, 1, 0, 0, 1, 1,
0.1123378, -1.160533, 3.15202, 1, 0, 0, 1, 1,
0.1181811, 0.1161804, 1.859264, 1, 0, 0, 1, 1,
0.123559, -0.7721452, 2.422644, 0, 0, 0, 1, 1,
0.1244227, 0.3041231, -1.55285, 0, 0, 0, 1, 1,
0.128522, 0.8605725, -0.9798983, 0, 0, 0, 1, 1,
0.1290745, 0.8980606, 0.2125326, 0, 0, 0, 1, 1,
0.1305882, 0.9911953, -0.169373, 0, 0, 0, 1, 1,
0.1335974, -0.7945202, 2.96846, 0, 0, 0, 1, 1,
0.1338701, -0.4421591, 3.16217, 0, 0, 0, 1, 1,
0.1343938, 0.3362336, 0.795921, 1, 1, 1, 1, 1,
0.1395016, 0.3800564, -1.092935, 1, 1, 1, 1, 1,
0.1455465, 1.150459, 0.7701143, 1, 1, 1, 1, 1,
0.1534281, 1.551689, -0.3803047, 1, 1, 1, 1, 1,
0.1554368, -1.472885, 1.861294, 1, 1, 1, 1, 1,
0.1566276, 1.586606, 0.3363282, 1, 1, 1, 1, 1,
0.1576222, -0.9989874, 3.133953, 1, 1, 1, 1, 1,
0.1590201, 0.896555, -0.07708739, 1, 1, 1, 1, 1,
0.159077, -0.3616269, 1.450988, 1, 1, 1, 1, 1,
0.1646728, -0.3963607, 2.85173, 1, 1, 1, 1, 1,
0.1646833, -0.856664, 3.022373, 1, 1, 1, 1, 1,
0.1704669, -0.5538082, 2.837967, 1, 1, 1, 1, 1,
0.1707131, -0.841076, 1.965441, 1, 1, 1, 1, 1,
0.18001, 0.983988, -0.1814948, 1, 1, 1, 1, 1,
0.1811035, 1.05847, -0.193622, 1, 1, 1, 1, 1,
0.1833463, 0.0451205, 3.109928, 0, 0, 1, 1, 1,
0.1834664, -0.4638525, 1.163289, 1, 0, 0, 1, 1,
0.1847878, 2.421028, 1.182521, 1, 0, 0, 1, 1,
0.1865738, -0.1076011, 3.86181, 1, 0, 0, 1, 1,
0.1872333, 0.8582348, 1.152168, 1, 0, 0, 1, 1,
0.191968, 1.157288, 0.5885705, 1, 0, 0, 1, 1,
0.199409, 1.269978, -0.8399073, 0, 0, 0, 1, 1,
0.1994383, 0.7696387, -0.2129741, 0, 0, 0, 1, 1,
0.2020061, -0.03822057, 0.73036, 0, 0, 0, 1, 1,
0.2065867, 0.07950906, 0.8344685, 0, 0, 0, 1, 1,
0.2072157, -0.5279843, 3.076311, 0, 0, 0, 1, 1,
0.2099729, 1.082268, 0.2722009, 0, 0, 0, 1, 1,
0.2100265, -0.9689574, 2.83463, 0, 0, 0, 1, 1,
0.2119883, 0.3095771, -0.2616853, 1, 1, 1, 1, 1,
0.2130877, -2.033196, 1.692902, 1, 1, 1, 1, 1,
0.2228997, 0.6705468, 0.7768424, 1, 1, 1, 1, 1,
0.2282533, -0.6946632, 2.346686, 1, 1, 1, 1, 1,
0.2299603, 1.22403, 0.1911091, 1, 1, 1, 1, 1,
0.2306446, 1.024956, 1.212588, 1, 1, 1, 1, 1,
0.2330419, 0.3196157, 1.517249, 1, 1, 1, 1, 1,
0.2348544, 2.130826, -0.1680921, 1, 1, 1, 1, 1,
0.2409902, 0.7632093, -0.3718201, 1, 1, 1, 1, 1,
0.2447371, -1.189045, 2.137067, 1, 1, 1, 1, 1,
0.2467371, 2.448169, -0.7501532, 1, 1, 1, 1, 1,
0.2484995, -1.337718, 4.153909, 1, 1, 1, 1, 1,
0.2487047, -1.144303, 2.126487, 1, 1, 1, 1, 1,
0.2504722, 0.6557572, 1.967892, 1, 1, 1, 1, 1,
0.2507012, -0.4409006, 4.176172, 1, 1, 1, 1, 1,
0.2544137, -0.3550359, 2.734331, 0, 0, 1, 1, 1,
0.256504, -1.405275, 2.356259, 1, 0, 0, 1, 1,
0.2574729, -0.7011352, 1.575331, 1, 0, 0, 1, 1,
0.2613242, 1.73764, -1.642365, 1, 0, 0, 1, 1,
0.2614031, -1.491277, 2.741859, 1, 0, 0, 1, 1,
0.2636987, -0.1832014, 2.122449, 1, 0, 0, 1, 1,
0.2639072, 0.8419719, 0.9253089, 0, 0, 0, 1, 1,
0.2680981, -0.928359, 1.756644, 0, 0, 0, 1, 1,
0.2704809, 0.5864515, 1.420007, 0, 0, 0, 1, 1,
0.2738733, 1.273894, 2.048689, 0, 0, 0, 1, 1,
0.2746025, 2.506836, 0.9617949, 0, 0, 0, 1, 1,
0.2780052, -0.215601, 3.645882, 0, 0, 0, 1, 1,
0.282623, -0.127351, 0.09391761, 0, 0, 0, 1, 1,
0.2846102, 0.2255869, 0.3998162, 1, 1, 1, 1, 1,
0.284919, 0.7538633, 0.9508383, 1, 1, 1, 1, 1,
0.286144, -1.95016, 1.037399, 1, 1, 1, 1, 1,
0.286821, 0.3095877, -0.08131447, 1, 1, 1, 1, 1,
0.2870701, 0.517162, 1.95999, 1, 1, 1, 1, 1,
0.2888296, -1.020759, 3.246224, 1, 1, 1, 1, 1,
0.2889237, -1.470826, 2.459261, 1, 1, 1, 1, 1,
0.2911799, -0.1227654, 1.40582, 1, 1, 1, 1, 1,
0.2952196, 1.093217, 0.680856, 1, 1, 1, 1, 1,
0.2952711, 0.3020996, -0.9165139, 1, 1, 1, 1, 1,
0.2968479, 0.8192612, -0.1751553, 1, 1, 1, 1, 1,
0.2991029, 0.7355979, 1.600462, 1, 1, 1, 1, 1,
0.3007129, -0.7370165, 3.207399, 1, 1, 1, 1, 1,
0.3035723, -0.7033347, 3.096321, 1, 1, 1, 1, 1,
0.3071024, 1.359151, -0.6456305, 1, 1, 1, 1, 1,
0.3085516, -0.1522735, 3.405823, 0, 0, 1, 1, 1,
0.3099709, -0.3537236, 3.530666, 1, 0, 0, 1, 1,
0.310884, 1.363901, 0.4123153, 1, 0, 0, 1, 1,
0.3122411, -1.457802, 3.325018, 1, 0, 0, 1, 1,
0.3172626, 1.421133, -2.108359, 1, 0, 0, 1, 1,
0.3187512, 0.9120309, -0.4163735, 1, 0, 0, 1, 1,
0.3205741, -0.4017978, 2.081386, 0, 0, 0, 1, 1,
0.3219848, 0.9017302, -0.7992529, 0, 0, 0, 1, 1,
0.3299188, 1.657623, 0.4531588, 0, 0, 0, 1, 1,
0.3300389, -0.7412584, 3.531692, 0, 0, 0, 1, 1,
0.330288, 0.2623048, 1.631397, 0, 0, 0, 1, 1,
0.3319691, 1.912567, 0.5769846, 0, 0, 0, 1, 1,
0.3325829, 0.8613985, 1.723288, 0, 0, 0, 1, 1,
0.3333567, 0.4964712, -0.1469788, 1, 1, 1, 1, 1,
0.3341842, 0.8744639, 1.215356, 1, 1, 1, 1, 1,
0.3348967, -1.075071, 1.654963, 1, 1, 1, 1, 1,
0.3392603, 1.476142, 0.7670968, 1, 1, 1, 1, 1,
0.3455454, 0.09893163, 1.406972, 1, 1, 1, 1, 1,
0.3455639, -0.2176524, 2.831564, 1, 1, 1, 1, 1,
0.3470778, -0.9953207, 3.170719, 1, 1, 1, 1, 1,
0.3504749, -0.4445603, 3.103532, 1, 1, 1, 1, 1,
0.3610604, -0.1701437, 4.066928, 1, 1, 1, 1, 1,
0.3646878, 1.245793, -0.6377504, 1, 1, 1, 1, 1,
0.3666959, 1.398886, -1.064493, 1, 1, 1, 1, 1,
0.3706716, 1.637882, -1.916112, 1, 1, 1, 1, 1,
0.3793828, -0.3729397, 1.239329, 1, 1, 1, 1, 1,
0.3868395, -0.3466626, 1.567039, 1, 1, 1, 1, 1,
0.3869084, 0.23732, 0.4251492, 1, 1, 1, 1, 1,
0.3885728, 0.6985894, 0.8597215, 0, 0, 1, 1, 1,
0.3886179, -1.237173, 3.159611, 1, 0, 0, 1, 1,
0.3897643, -1.209459, -0.1828203, 1, 0, 0, 1, 1,
0.3970042, -1.517666, 2.432471, 1, 0, 0, 1, 1,
0.3980336, 0.2364384, -0.9209794, 1, 0, 0, 1, 1,
0.4017892, -3.107887, 2.982735, 1, 0, 0, 1, 1,
0.4047632, -2.53262, 2.555915, 0, 0, 0, 1, 1,
0.4051918, -1.550463, 2.562022, 0, 0, 0, 1, 1,
0.4064907, 0.4078351, -0.1921073, 0, 0, 0, 1, 1,
0.4172793, -0.7936525, 2.02594, 0, 0, 0, 1, 1,
0.4198371, 1.785173, 0.538294, 0, 0, 0, 1, 1,
0.4237531, -1.079394, 0.9476236, 0, 0, 0, 1, 1,
0.4243506, -0.6377166, 1.582197, 0, 0, 0, 1, 1,
0.4271977, 0.5680056, 0.2100197, 1, 1, 1, 1, 1,
0.4327176, 0.1094177, 1.862768, 1, 1, 1, 1, 1,
0.4327336, -1.18413, 4.328103, 1, 1, 1, 1, 1,
0.4351828, 1.999687, 0.8011244, 1, 1, 1, 1, 1,
0.4412804, 0.9094234, -0.04029954, 1, 1, 1, 1, 1,
0.4431771, 0.01225822, 0.6514381, 1, 1, 1, 1, 1,
0.4444847, -0.6723419, 1.442272, 1, 1, 1, 1, 1,
0.447188, -0.007698508, 2.122776, 1, 1, 1, 1, 1,
0.4485701, 1.469229, 1.645719, 1, 1, 1, 1, 1,
0.4503095, 0.1928108, 1.407955, 1, 1, 1, 1, 1,
0.4597002, -0.7576055, 1.238558, 1, 1, 1, 1, 1,
0.4622673, -0.8049917, 3.507425, 1, 1, 1, 1, 1,
0.4631113, 0.7204788, 0.7247399, 1, 1, 1, 1, 1,
0.4635478, 0.2505441, -1.167538, 1, 1, 1, 1, 1,
0.4665335, 0.9305303, 1.116181, 1, 1, 1, 1, 1,
0.4688706, 0.9937664, 1.278427, 0, 0, 1, 1, 1,
0.4719527, -0.6185699, 1.586821, 1, 0, 0, 1, 1,
0.473584, 0.3857472, 0.2760303, 1, 0, 0, 1, 1,
0.4775126, -0.8345453, 1.688166, 1, 0, 0, 1, 1,
0.4807638, -0.003333287, 2.67139, 1, 0, 0, 1, 1,
0.4810126, 0.2141926, 1.310346, 1, 0, 0, 1, 1,
0.4921065, 0.3918192, 0.1045535, 0, 0, 0, 1, 1,
0.4933721, 0.3822646, -2.352044, 0, 0, 0, 1, 1,
0.4990356, -0.8338965, 2.953156, 0, 0, 0, 1, 1,
0.5039688, -0.8706702, 1.255664, 0, 0, 0, 1, 1,
0.5102238, -1.605679, 1.037593, 0, 0, 0, 1, 1,
0.5102258, -2.051642, 3.374631, 0, 0, 0, 1, 1,
0.5124793, -0.3216169, 2.401, 0, 0, 0, 1, 1,
0.5150149, -1.120324, 1.006892, 1, 1, 1, 1, 1,
0.5191159, -0.2729391, 1.477046, 1, 1, 1, 1, 1,
0.5200608, -1.583923, 2.227201, 1, 1, 1, 1, 1,
0.5261209, -0.2672334, 2.462628, 1, 1, 1, 1, 1,
0.5275593, 0.441287, -0.1272165, 1, 1, 1, 1, 1,
0.5282742, 1.056479, -1.877519, 1, 1, 1, 1, 1,
0.5310743, 1.229782, 1.70662, 1, 1, 1, 1, 1,
0.5357819, 0.04095929, 0.9842228, 1, 1, 1, 1, 1,
0.5424481, 0.1950579, 1.679209, 1, 1, 1, 1, 1,
0.5434697, 0.8717233, -0.3013888, 1, 1, 1, 1, 1,
0.5489436, -0.5861085, 2.018093, 1, 1, 1, 1, 1,
0.5497624, 0.2484712, 2.538167, 1, 1, 1, 1, 1,
0.5519947, -0.04851583, 2.019814, 1, 1, 1, 1, 1,
0.5525262, 1.312718, -0.3610363, 1, 1, 1, 1, 1,
0.5536763, -0.6104311, 3.588663, 1, 1, 1, 1, 1,
0.5566872, -0.02922511, 1.00335, 0, 0, 1, 1, 1,
0.563176, 0.1072773, 0.04968845, 1, 0, 0, 1, 1,
0.5668131, 1.614797, -0.100236, 1, 0, 0, 1, 1,
0.5669763, 0.5010844, 1.051163, 1, 0, 0, 1, 1,
0.5705059, 0.3818978, 1.131032, 1, 0, 0, 1, 1,
0.5788009, 0.1674293, 0.488268, 1, 0, 0, 1, 1,
0.5828764, 0.5276951, -0.7350522, 0, 0, 0, 1, 1,
0.5835673, -1.615826, 1.562757, 0, 0, 0, 1, 1,
0.5837485, 0.8739134, -0.9314567, 0, 0, 0, 1, 1,
0.5849807, 0.2662511, 0.5578144, 0, 0, 0, 1, 1,
0.5856137, -1.076881, 1.403441, 0, 0, 0, 1, 1,
0.5858786, 1.040212, 1.157431, 0, 0, 0, 1, 1,
0.5896598, -0.8870173, 2.873994, 0, 0, 0, 1, 1,
0.5925651, 0.0166448, 2.483274, 1, 1, 1, 1, 1,
0.5946351, 1.414209, 0.6421654, 1, 1, 1, 1, 1,
0.5966311, -0.3073094, 0.442836, 1, 1, 1, 1, 1,
0.5987832, 0.2976107, 0.8249938, 1, 1, 1, 1, 1,
0.601202, 1.224431, -0.164485, 1, 1, 1, 1, 1,
0.6064001, 0.804036, 0.03381797, 1, 1, 1, 1, 1,
0.6064255, -1.382697, 2.344029, 1, 1, 1, 1, 1,
0.6081816, -0.3338022, 0.8434089, 1, 1, 1, 1, 1,
0.6098599, 0.9827139, -0.1342318, 1, 1, 1, 1, 1,
0.6118486, 1.300293, 0.1108363, 1, 1, 1, 1, 1,
0.6135337, -0.09746917, 2.070177, 1, 1, 1, 1, 1,
0.6149353, -0.05083312, 1.406559, 1, 1, 1, 1, 1,
0.6164628, -1.108776, 2.868009, 1, 1, 1, 1, 1,
0.6169528, -0.5504254, 2.244172, 1, 1, 1, 1, 1,
0.6232055, -0.7450806, 1.627431, 1, 1, 1, 1, 1,
0.6283363, -2.268515, 2.098323, 0, 0, 1, 1, 1,
0.6285061, -0.6658956, 2.04241, 1, 0, 0, 1, 1,
0.6300033, 0.3492844, 3.705408, 1, 0, 0, 1, 1,
0.6413218, -1.018407, 1.916121, 1, 0, 0, 1, 1,
0.6416098, 0.254072, 2.341106, 1, 0, 0, 1, 1,
0.6430892, 0.536664, 0.5993249, 1, 0, 0, 1, 1,
0.6463736, 1.407414, 1.943687, 0, 0, 0, 1, 1,
0.6476089, -1.979384, 4.070828, 0, 0, 0, 1, 1,
0.650906, 1.062766, 0.915805, 0, 0, 0, 1, 1,
0.6515697, 1.705748, 1.544883, 0, 0, 0, 1, 1,
0.6559724, 0.5618026, 0.9482869, 0, 0, 0, 1, 1,
0.6570694, -0.481766, 1.499521, 0, 0, 0, 1, 1,
0.6571901, 0.1503558, 1.16266, 0, 0, 0, 1, 1,
0.6573674, 0.3900054, 1.845785, 1, 1, 1, 1, 1,
0.6581175, 0.677743, 0.8524824, 1, 1, 1, 1, 1,
0.6596078, -0.4145735, 1.32568, 1, 1, 1, 1, 1,
0.6679122, 2.421136, -0.5983005, 1, 1, 1, 1, 1,
0.6742576, -1.450822, 1.612842, 1, 1, 1, 1, 1,
0.6771722, -0.2694135, 1.616469, 1, 1, 1, 1, 1,
0.6774655, -0.5392274, 3.413222, 1, 1, 1, 1, 1,
0.6781912, -0.7136644, 3.372985, 1, 1, 1, 1, 1,
0.6787122, -0.07922679, 2.036183, 1, 1, 1, 1, 1,
0.6914792, 1.693306, 0.2720419, 1, 1, 1, 1, 1,
0.6919188, 0.1670646, 2.787244, 1, 1, 1, 1, 1,
0.7084695, -1.286185, 3.58152, 1, 1, 1, 1, 1,
0.7086459, 1.428502, 1.215184, 1, 1, 1, 1, 1,
0.7150306, -1.520287, 1.617878, 1, 1, 1, 1, 1,
0.7235076, -1.531895, 2.535978, 1, 1, 1, 1, 1,
0.7263634, 0.3000819, 2.663174, 0, 0, 1, 1, 1,
0.7282764, -2.432016, 0.4020846, 1, 0, 0, 1, 1,
0.735453, -0.1019097, 2.502948, 1, 0, 0, 1, 1,
0.7373931, -1.353755, 0.9888213, 1, 0, 0, 1, 1,
0.7376746, -0.3090737, 0.9845992, 1, 0, 0, 1, 1,
0.7415747, -0.3546163, 0.9631723, 1, 0, 0, 1, 1,
0.7417786, -0.4186422, 1.846956, 0, 0, 0, 1, 1,
0.7518374, 0.239139, 2.551346, 0, 0, 0, 1, 1,
0.7539344, -0.8559878, 2.800584, 0, 0, 0, 1, 1,
0.7569289, 1.56756, -0.5146229, 0, 0, 0, 1, 1,
0.7582382, -1.010183, 1.333509, 0, 0, 0, 1, 1,
0.7596936, 0.7483913, 2.567306, 0, 0, 0, 1, 1,
0.7603115, 0.9567748, -0.3153429, 0, 0, 0, 1, 1,
0.7617457, -0.3645782, 3.644966, 1, 1, 1, 1, 1,
0.7644722, 0.1611872, 0.06873185, 1, 1, 1, 1, 1,
0.769579, 0.795675, -0.5221285, 1, 1, 1, 1, 1,
0.7703853, -0.9588049, 3.800586, 1, 1, 1, 1, 1,
0.7717925, 0.7370105, 0.9185666, 1, 1, 1, 1, 1,
0.7722411, 0.2720954, 1.338696, 1, 1, 1, 1, 1,
0.7740191, 0.5398222, -0.4528395, 1, 1, 1, 1, 1,
0.7744312, 0.1592881, 2.104408, 1, 1, 1, 1, 1,
0.7768978, -0.200214, 0.2747703, 1, 1, 1, 1, 1,
0.7838753, 0.2690069, 1.865382, 1, 1, 1, 1, 1,
0.7849497, -0.7929907, 3.965776, 1, 1, 1, 1, 1,
0.7856232, 1.012072, -1.33424, 1, 1, 1, 1, 1,
0.7872792, -0.3244596, 1.3514, 1, 1, 1, 1, 1,
0.7912619, 0.8414422, -0.4851478, 1, 1, 1, 1, 1,
0.7929261, -0.1662638, 2.538607, 1, 1, 1, 1, 1,
0.7929549, 0.183067, 1.242407, 0, 0, 1, 1, 1,
0.7949991, -0.8775029, 1.461154, 1, 0, 0, 1, 1,
0.7992938, -0.7191017, 1.212411, 1, 0, 0, 1, 1,
0.8026744, 0.2050855, 1.085745, 1, 0, 0, 1, 1,
0.8091287, -0.2238837, 0.07108613, 1, 0, 0, 1, 1,
0.8094335, 1.01329, 0.2686539, 1, 0, 0, 1, 1,
0.8101805, 0.2137079, 0.4918769, 0, 0, 0, 1, 1,
0.812753, -1.441387, 3.660908, 0, 0, 0, 1, 1,
0.8140209, 1.185091, -0.3454167, 0, 0, 0, 1, 1,
0.8148881, -2.240627, 2.904058, 0, 0, 0, 1, 1,
0.8156368, 1.367733, 0.5679174, 0, 0, 0, 1, 1,
0.8237253, -0.687034, 1.794436, 0, 0, 0, 1, 1,
0.8257652, -0.7253956, 0.9945003, 0, 0, 0, 1, 1,
0.8441491, -0.3714568, 2.386187, 1, 1, 1, 1, 1,
0.8455744, 0.2671385, 0.7866406, 1, 1, 1, 1, 1,
0.8468348, -0.862941, 1.820849, 1, 1, 1, 1, 1,
0.8507541, -1.918125, 2.19814, 1, 1, 1, 1, 1,
0.8527054, -0.1511213, 3.107876, 1, 1, 1, 1, 1,
0.8541135, 2.118306, 0.7387795, 1, 1, 1, 1, 1,
0.8627706, -0.6268685, 1.312239, 1, 1, 1, 1, 1,
0.8641197, -1.664456, 1.790868, 1, 1, 1, 1, 1,
0.8715625, -0.2706892, 0.8329312, 1, 1, 1, 1, 1,
0.8784506, 0.8712421, 0.9793333, 1, 1, 1, 1, 1,
0.879049, 0.223223, 0.4926125, 1, 1, 1, 1, 1,
0.8798628, 0.354192, 1.838645, 1, 1, 1, 1, 1,
0.8827366, -0.3157365, 1.716342, 1, 1, 1, 1, 1,
0.8847564, -0.727456, 1.84729, 1, 1, 1, 1, 1,
0.8855698, 0.4811677, 0.8811163, 1, 1, 1, 1, 1,
0.8874027, -0.713274, 1.681763, 0, 0, 1, 1, 1,
0.8998671, 2.235375, -0.5664746, 1, 0, 0, 1, 1,
0.9011958, 0.7811763, 1.58295, 1, 0, 0, 1, 1,
0.9025601, -1.380086, 2.558631, 1, 0, 0, 1, 1,
0.906889, -0.248524, 2.192742, 1, 0, 0, 1, 1,
0.9146885, 1.642739, -1.19207, 1, 0, 0, 1, 1,
0.9151928, 0.2462134, 1.50194, 0, 0, 0, 1, 1,
0.9175865, 0.4276192, 1.607902, 0, 0, 0, 1, 1,
0.9190353, 0.5146304, 1.748603, 0, 0, 0, 1, 1,
0.9216138, -0.02974158, 1.289801, 0, 0, 0, 1, 1,
0.9233714, -0.3940623, 1.911358, 0, 0, 0, 1, 1,
0.9402658, -1.08091, 1.6135, 0, 0, 0, 1, 1,
0.9424147, -0.3265509, 3.631879, 0, 0, 0, 1, 1,
0.951448, 2.393483, -1.082869, 1, 1, 1, 1, 1,
0.955341, 1.271818, 0.7430367, 1, 1, 1, 1, 1,
0.9614214, -0.4281935, 2.817775, 1, 1, 1, 1, 1,
0.9692048, -0.1113491, 1.595901, 1, 1, 1, 1, 1,
0.9763867, 0.740521, 1.823173, 1, 1, 1, 1, 1,
0.9817384, -0.004402531, 1.225485, 1, 1, 1, 1, 1,
0.9819581, -1.265575, 3.161044, 1, 1, 1, 1, 1,
0.9861733, -0.2547394, 2.58433, 1, 1, 1, 1, 1,
0.9875582, 0.5753617, 1.393416, 1, 1, 1, 1, 1,
0.992288, 0.8061044, 1.458414, 1, 1, 1, 1, 1,
0.9924448, -1.703975, 2.946459, 1, 1, 1, 1, 1,
0.9943715, 0.3658139, 1.786018, 1, 1, 1, 1, 1,
0.9980153, 0.593554, 0.3606614, 1, 1, 1, 1, 1,
1.000713, -0.5658818, 1.309605, 1, 1, 1, 1, 1,
1.003797, 1.325528, 0.2195175, 1, 1, 1, 1, 1,
1.004012, 1.143912, 0.5433928, 0, 0, 1, 1, 1,
1.011062, 0.4520583, 3.224878, 1, 0, 0, 1, 1,
1.011898, 1.563775, 2.80405, 1, 0, 0, 1, 1,
1.018145, -1.405308, 3.056982, 1, 0, 0, 1, 1,
1.021413, 0.9808989, 1.596165, 1, 0, 0, 1, 1,
1.025456, 1.806501, 0.3481388, 1, 0, 0, 1, 1,
1.025581, 0.3462776, 2.332583, 0, 0, 0, 1, 1,
1.027507, -0.06615449, 0.3700523, 0, 0, 0, 1, 1,
1.035946, 0.8185268, 1.587816, 0, 0, 0, 1, 1,
1.036686, 0.196547, 2.998571, 0, 0, 0, 1, 1,
1.038993, -1.807401, 2.523499, 0, 0, 0, 1, 1,
1.040439, 1.289395, 0.6265827, 0, 0, 0, 1, 1,
1.04344, 0.3334206, 0.659282, 0, 0, 0, 1, 1,
1.04517, -0.7019494, 1.984932, 1, 1, 1, 1, 1,
1.046719, -0.5533144, 1.812528, 1, 1, 1, 1, 1,
1.058338, -0.3333188, 3.226675, 1, 1, 1, 1, 1,
1.063501, -0.3614491, 2.510607, 1, 1, 1, 1, 1,
1.064771, -1.144329, 3.669641, 1, 1, 1, 1, 1,
1.074187, -0.5793331, 2.923657, 1, 1, 1, 1, 1,
1.086176, 0.03446102, 1.132935, 1, 1, 1, 1, 1,
1.087314, 2.262337, -1.753963, 1, 1, 1, 1, 1,
1.096539, -1.428736, 4.365856, 1, 1, 1, 1, 1,
1.096827, 2.074735, -0.5139344, 1, 1, 1, 1, 1,
1.098814, 0.57028, 1.241089, 1, 1, 1, 1, 1,
1.102738, 1.817691, 0.8351246, 1, 1, 1, 1, 1,
1.1034, 1.240183, 3.054873, 1, 1, 1, 1, 1,
1.106072, 0.9959416, -0.6686116, 1, 1, 1, 1, 1,
1.106104, 0.318918, 1.358093, 1, 1, 1, 1, 1,
1.10869, -0.1907376, 0.6379799, 0, 0, 1, 1, 1,
1.10885, -1.282026, 1.952152, 1, 0, 0, 1, 1,
1.115329, -0.4546839, 1.531782, 1, 0, 0, 1, 1,
1.122414, -0.001845639, 1.618571, 1, 0, 0, 1, 1,
1.138137, -0.3486075, 1.209877, 1, 0, 0, 1, 1,
1.139806, 0.3887625, 0.1041702, 1, 0, 0, 1, 1,
1.140318, -0.9750805, 3.205009, 0, 0, 0, 1, 1,
1.142657, 0.686752, 1.918866, 0, 0, 0, 1, 1,
1.147291, -1.007045, 1.362114, 0, 0, 0, 1, 1,
1.147834, 0.4242007, 2.129713, 0, 0, 0, 1, 1,
1.150459, 0.2791601, 1.566673, 0, 0, 0, 1, 1,
1.150748, -0.040105, 2.182743, 0, 0, 0, 1, 1,
1.159515, 1.234988, 0.5720856, 0, 0, 0, 1, 1,
1.161886, 0.3340025, 1.655681, 1, 1, 1, 1, 1,
1.164443, -0.7541426, 3.821714, 1, 1, 1, 1, 1,
1.16539, 0.3496628, 1.420835, 1, 1, 1, 1, 1,
1.183459, -0.2954345, 1.4528, 1, 1, 1, 1, 1,
1.192268, -0.1583046, 1.704928, 1, 1, 1, 1, 1,
1.193287, 0.2191504, 2.713166, 1, 1, 1, 1, 1,
1.193866, 0.2576423, 1.560008, 1, 1, 1, 1, 1,
1.193911, -1.068153, 2.039514, 1, 1, 1, 1, 1,
1.19797, -0.7052912, 2.483902, 1, 1, 1, 1, 1,
1.200884, 1.797843, -1.587043, 1, 1, 1, 1, 1,
1.200933, -1.722362, 2.614881, 1, 1, 1, 1, 1,
1.203389, -2.049985, 1.281945, 1, 1, 1, 1, 1,
1.214372, 1.492696, 2.010961, 1, 1, 1, 1, 1,
1.2255, -0.1813172, 3.335257, 1, 1, 1, 1, 1,
1.227969, -0.9395062, 3.239199, 1, 1, 1, 1, 1,
1.245867, 2.383265, -0.220587, 0, 0, 1, 1, 1,
1.254739, -0.1552936, 1.93453, 1, 0, 0, 1, 1,
1.268599, -0.1609023, 0.05822236, 1, 0, 0, 1, 1,
1.269139, 0.6430165, 2.376064, 1, 0, 0, 1, 1,
1.269168, 0.02668823, 3.359229, 1, 0, 0, 1, 1,
1.27168, 0.06837937, 1.517799, 1, 0, 0, 1, 1,
1.278498, 0.6383023, 0.6917075, 0, 0, 0, 1, 1,
1.299559, 1.054653, 2.445633, 0, 0, 0, 1, 1,
1.303075, -1.412168, 2.934741, 0, 0, 0, 1, 1,
1.307626, 0.541348, 0.351036, 0, 0, 0, 1, 1,
1.309113, 0.8081197, 0.8198662, 0, 0, 0, 1, 1,
1.312702, -2.024076, 2.057196, 0, 0, 0, 1, 1,
1.325838, -0.0820578, 1.435993, 0, 0, 0, 1, 1,
1.337637, -0.2579771, 4.325464, 1, 1, 1, 1, 1,
1.350651, 1.698312, 0.8152694, 1, 1, 1, 1, 1,
1.350971, 0.6030555, 1.558367, 1, 1, 1, 1, 1,
1.354627, -0.8693435, 1.663496, 1, 1, 1, 1, 1,
1.35861, -0.8374365, 2.449471, 1, 1, 1, 1, 1,
1.359932, 0.1657524, 0.8796322, 1, 1, 1, 1, 1,
1.37173, -0.1547462, 1.805006, 1, 1, 1, 1, 1,
1.374996, -0.476167, 1.610462, 1, 1, 1, 1, 1,
1.378085, -0.07015599, 2.942563, 1, 1, 1, 1, 1,
1.387003, 2.386767, -0.7585608, 1, 1, 1, 1, 1,
1.395509, -1.848827, 2.526516, 1, 1, 1, 1, 1,
1.399909, -0.6152882, 1.171021, 1, 1, 1, 1, 1,
1.407526, -1.134897, 2.820215, 1, 1, 1, 1, 1,
1.409339, -0.6062474, 2.560683, 1, 1, 1, 1, 1,
1.419977, -0.9412233, 0.8635374, 1, 1, 1, 1, 1,
1.471072, -2.494304, 3.171353, 0, 0, 1, 1, 1,
1.477705, 2.666253, -1.818005, 1, 0, 0, 1, 1,
1.480904, 1.299536, 0.1277144, 1, 0, 0, 1, 1,
1.49278, 0.4471948, 0.7855897, 1, 0, 0, 1, 1,
1.504844, -0.1316887, 2.676574, 1, 0, 0, 1, 1,
1.507527, -0.2732932, 1.934388, 1, 0, 0, 1, 1,
1.509471, -0.06906973, 1.566056, 0, 0, 0, 1, 1,
1.513796, -0.1237863, 0.6540701, 0, 0, 0, 1, 1,
1.516594, -1.604506, 3.550559, 0, 0, 0, 1, 1,
1.524237, 0.09383982, 1.982568, 0, 0, 0, 1, 1,
1.525263, 1.875024, 0.1300371, 0, 0, 0, 1, 1,
1.538314, 0.02905239, 2.207305, 0, 0, 0, 1, 1,
1.539644, -0.08328043, 0.6095082, 0, 0, 0, 1, 1,
1.540245, -0.3209503, 2.026886, 1, 1, 1, 1, 1,
1.561991, 1.370775, 0.7903347, 1, 1, 1, 1, 1,
1.56318, -0.2598054, 3.143808, 1, 1, 1, 1, 1,
1.569894, -0.583995, 1.528367, 1, 1, 1, 1, 1,
1.580882, -0.4284233, 3.362225, 1, 1, 1, 1, 1,
1.589375, -0.0889412, 1.984469, 1, 1, 1, 1, 1,
1.594292, 1.054624, 1.513735, 1, 1, 1, 1, 1,
1.596457, -1.292436, 2.335388, 1, 1, 1, 1, 1,
1.59885, -0.2828657, 2.675335, 1, 1, 1, 1, 1,
1.62173, -0.01669501, 1.296286, 1, 1, 1, 1, 1,
1.621815, -0.7178046, 1.821042, 1, 1, 1, 1, 1,
1.63934, 0.2560875, 0.8413268, 1, 1, 1, 1, 1,
1.664305, -1.372278, 2.656973, 1, 1, 1, 1, 1,
1.669956, 0.1911073, 1.204278, 1, 1, 1, 1, 1,
1.670725, -1.41131, 1.139992, 1, 1, 1, 1, 1,
1.67615, -1.429005, 2.864784, 0, 0, 1, 1, 1,
1.688222, -0.2796747, 1.430868, 1, 0, 0, 1, 1,
1.691365, 1.083828, 2.573558, 1, 0, 0, 1, 1,
1.711655, -1.819453, 1.2778, 1, 0, 0, 1, 1,
1.721358, 0.4310508, 0.8405586, 1, 0, 0, 1, 1,
1.747715, 0.2480686, 3.000916, 1, 0, 0, 1, 1,
1.751722, 0.1049301, 0.2146137, 0, 0, 0, 1, 1,
1.765521, -2.925992, 2.724422, 0, 0, 0, 1, 1,
1.790927, 0.3495232, 1.727777, 0, 0, 0, 1, 1,
1.798437, 0.208282, 1.505795, 0, 0, 0, 1, 1,
1.836829, 1.397594, 1.200678, 0, 0, 0, 1, 1,
1.84233, 1.197554, 1.116002, 0, 0, 0, 1, 1,
1.845114, 0.6096392, 2.037443, 0, 0, 0, 1, 1,
1.885756, 0.4835068, 2.834572, 1, 1, 1, 1, 1,
1.886384, 0.4674016, 0.8761355, 1, 1, 1, 1, 1,
1.887661, -0.2358635, 0.6318453, 1, 1, 1, 1, 1,
1.903213, -0.2882048, 2.675712, 1, 1, 1, 1, 1,
1.903228, 0.27208, 1.795526, 1, 1, 1, 1, 1,
1.952208, 2.039032, 0.7036214, 1, 1, 1, 1, 1,
1.966568, 1.356467, -0.03219902, 1, 1, 1, 1, 1,
1.996286, 0.7843106, 2.225882, 1, 1, 1, 1, 1,
2.023393, 0.329718, 1.136537, 1, 1, 1, 1, 1,
2.023431, 0.02699297, 1.858895, 1, 1, 1, 1, 1,
2.032064, 1.108551, 2.559182, 1, 1, 1, 1, 1,
2.102312, 0.1831474, 0.8916584, 1, 1, 1, 1, 1,
2.128575, -2.291205, -0.1316638, 1, 1, 1, 1, 1,
2.128661, -0.6013253, 0.8824948, 1, 1, 1, 1, 1,
2.1475, 0.8338649, 2.797324, 1, 1, 1, 1, 1,
2.150972, 1.173479, 3.043306, 0, 0, 1, 1, 1,
2.153267, 1.502512, 1.606541, 1, 0, 0, 1, 1,
2.162829, -0.08652352, 3.080764, 1, 0, 0, 1, 1,
2.166011, 1.316366, 1.392294, 1, 0, 0, 1, 1,
2.244194, -0.4973542, 1.152279, 1, 0, 0, 1, 1,
2.270746, 0.8697571, 2.403408, 1, 0, 0, 1, 1,
2.308296, -0.3771051, 0.9962995, 0, 0, 0, 1, 1,
2.314894, 0.4861872, 0.8768663, 0, 0, 0, 1, 1,
2.324022, 0.5333825, 2.991444, 0, 0, 0, 1, 1,
2.389264, -0.5005715, 1.179422, 0, 0, 0, 1, 1,
2.442972, -0.8067467, 1.501445, 0, 0, 0, 1, 1,
2.465751, 0.9154363, 0.2574385, 0, 0, 0, 1, 1,
2.475323, 0.421556, 1.956719, 0, 0, 0, 1, 1,
2.500501, -0.1894689, -0.114111, 1, 1, 1, 1, 1,
2.512496, 0.0726677, 1.941484, 1, 1, 1, 1, 1,
2.529587, -1.533376, 2.607991, 1, 1, 1, 1, 1,
2.538362, 0.6089092, 0.2477862, 1, 1, 1, 1, 1,
2.704119, -0.215974, 2.447647, 1, 1, 1, 1, 1,
2.826903, 1.456312, 1.506169, 1, 1, 1, 1, 1,
3.213507, -0.6118096, 0.4736686, 1, 1, 1, 1, 1
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
var radius = 9.663485;
var distance = 33.94258;
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
mvMatrix.translate( 0.5963736, -0.02592587, 0.6287336 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.94258);
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
