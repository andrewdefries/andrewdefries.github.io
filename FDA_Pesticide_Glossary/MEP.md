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
-2.629787, -0.7255433, -3.201396, 1, 0, 0, 1,
-2.577345, 2.287128, -1.021995, 1, 0.007843138, 0, 1,
-2.57714, 0.2739637, -1.594849, 1, 0.01176471, 0, 1,
-2.492505, -0.5877051, -2.212379, 1, 0.01960784, 0, 1,
-2.443464, -1.934114, -1.409675, 1, 0.02352941, 0, 1,
-2.436341, 0.9441932, -1.817693, 1, 0.03137255, 0, 1,
-2.432269, 1.274704, -0.4999651, 1, 0.03529412, 0, 1,
-2.41359, 0.1801396, -0.5683182, 1, 0.04313726, 0, 1,
-2.362864, -0.09691058, -1.250847, 1, 0.04705882, 0, 1,
-2.362735, 0.8107674, 0.218637, 1, 0.05490196, 0, 1,
-2.328863, -0.1481933, -1.520379, 1, 0.05882353, 0, 1,
-2.328685, 0.3786703, -2.058444, 1, 0.06666667, 0, 1,
-2.286788, -0.7306883, -1.08493, 1, 0.07058824, 0, 1,
-2.246991, -0.9867913, -3.363958, 1, 0.07843138, 0, 1,
-2.211147, 0.1258292, -2.022745, 1, 0.08235294, 0, 1,
-2.201639, 1.213918, -1.778992, 1, 0.09019608, 0, 1,
-2.176442, 1.205216, -1.055264, 1, 0.09411765, 0, 1,
-2.130404, -0.2484252, 0.3298348, 1, 0.1019608, 0, 1,
-2.126651, 0.5956904, -0.07701615, 1, 0.1098039, 0, 1,
-2.113205, 1.184195, -1.453416, 1, 0.1137255, 0, 1,
-2.100481, -0.1752609, -1.789194, 1, 0.1215686, 0, 1,
-2.060356, 0.3683125, -0.966813, 1, 0.1254902, 0, 1,
-2.017541, -0.8917137, -3.147713, 1, 0.1333333, 0, 1,
-1.969969, -1.473471, -1.72464, 1, 0.1372549, 0, 1,
-1.961226, 0.8352392, -0.2397822, 1, 0.145098, 0, 1,
-1.950696, 0.1753502, -3.154586, 1, 0.1490196, 0, 1,
-1.933315, -0.2375935, -0.4112092, 1, 0.1568628, 0, 1,
-1.895613, 2.295682, 0.8049077, 1, 0.1607843, 0, 1,
-1.891547, -0.6991836, -1.47644, 1, 0.1686275, 0, 1,
-1.880512, -0.3107325, -0.9356816, 1, 0.172549, 0, 1,
-1.859379, -0.534736, -2.952008, 1, 0.1803922, 0, 1,
-1.851321, 0.1703932, -1.49228, 1, 0.1843137, 0, 1,
-1.850907, 2.380627, -0.8568963, 1, 0.1921569, 0, 1,
-1.844751, 0.4374858, -0.686694, 1, 0.1960784, 0, 1,
-1.838277, 0.7299929, -1.535726, 1, 0.2039216, 0, 1,
-1.837848, 2.042449, -1.079313, 1, 0.2117647, 0, 1,
-1.829532, -1.458636, -2.201867, 1, 0.2156863, 0, 1,
-1.803907, -0.4444212, -2.412614, 1, 0.2235294, 0, 1,
-1.765052, 1.550637, 0.2544014, 1, 0.227451, 0, 1,
-1.76164, 0.9509007, -1.415431, 1, 0.2352941, 0, 1,
-1.755101, 1.705894, -0.8635109, 1, 0.2392157, 0, 1,
-1.754399, -0.1707832, -2.540065, 1, 0.2470588, 0, 1,
-1.74344, -0.08664751, -1.650302, 1, 0.2509804, 0, 1,
-1.720888, 0.07088705, -1.431869, 1, 0.2588235, 0, 1,
-1.715273, -1.090251, -2.216784, 1, 0.2627451, 0, 1,
-1.701286, 0.2068876, -2.166658, 1, 0.2705882, 0, 1,
-1.687422, 0.03946528, -1.747034, 1, 0.2745098, 0, 1,
-1.674222, -0.4956418, -1.587195, 1, 0.282353, 0, 1,
-1.665133, -1.211104, -0.5651827, 1, 0.2862745, 0, 1,
-1.664492, 0.2496039, -2.197847, 1, 0.2941177, 0, 1,
-1.63741, -0.8269995, -1.405375, 1, 0.3019608, 0, 1,
-1.627722, -0.6380553, -0.7967576, 1, 0.3058824, 0, 1,
-1.623976, -0.3949299, -0.2652613, 1, 0.3137255, 0, 1,
-1.620779, 0.2646935, -0.9285607, 1, 0.3176471, 0, 1,
-1.610175, -0.5114765, -2.559559, 1, 0.3254902, 0, 1,
-1.607211, -0.5818654, -0.872779, 1, 0.3294118, 0, 1,
-1.596306, 0.6945441, -1.653428, 1, 0.3372549, 0, 1,
-1.591171, -0.6885911, -0.8361945, 1, 0.3411765, 0, 1,
-1.589831, 0.2876924, -2.19219, 1, 0.3490196, 0, 1,
-1.579114, 0.3487781, -3.848695, 1, 0.3529412, 0, 1,
-1.576168, 0.3910447, -1.926624, 1, 0.3607843, 0, 1,
-1.553175, -0.5984049, -1.144092, 1, 0.3647059, 0, 1,
-1.521894, 1.493174, -1.276924, 1, 0.372549, 0, 1,
-1.509141, -0.8281645, -0.421701, 1, 0.3764706, 0, 1,
-1.507485, 0.2205092, -0.9860438, 1, 0.3843137, 0, 1,
-1.502499, -0.6431022, -1.654525, 1, 0.3882353, 0, 1,
-1.499604, -0.5696003, -4.116708, 1, 0.3960784, 0, 1,
-1.492048, -0.477827, -1.775237, 1, 0.4039216, 0, 1,
-1.477082, -1.76774, -1.393079, 1, 0.4078431, 0, 1,
-1.476408, -2.088358, -2.556201, 1, 0.4156863, 0, 1,
-1.468596, 0.5689821, -0.3225848, 1, 0.4196078, 0, 1,
-1.463125, 1.276076, -1.407186, 1, 0.427451, 0, 1,
-1.460657, -0.4635925, -3.525802, 1, 0.4313726, 0, 1,
-1.459985, -1.338645, -2.524087, 1, 0.4392157, 0, 1,
-1.459326, 0.1613526, -1.63665, 1, 0.4431373, 0, 1,
-1.456635, 0.3484556, -2.90031, 1, 0.4509804, 0, 1,
-1.454862, 0.4256712, -0.7984915, 1, 0.454902, 0, 1,
-1.441135, -0.5464365, -1.232135, 1, 0.4627451, 0, 1,
-1.439311, 0.4574747, -1.341949, 1, 0.4666667, 0, 1,
-1.436373, -1.047692, -2.180562, 1, 0.4745098, 0, 1,
-1.435573, 0.2110503, -1.295946, 1, 0.4784314, 0, 1,
-1.435033, 1.634448, 0.5684497, 1, 0.4862745, 0, 1,
-1.428387, -0.4087731, -0.5868499, 1, 0.4901961, 0, 1,
-1.420008, 1.918308, 0.4917465, 1, 0.4980392, 0, 1,
-1.418612, -0.3225075, -2.376435, 1, 0.5058824, 0, 1,
-1.416425, -0.723369, -0.9592839, 1, 0.509804, 0, 1,
-1.410779, 0.5653727, 0.8944483, 1, 0.5176471, 0, 1,
-1.394106, -1.316348, -2.673182, 1, 0.5215687, 0, 1,
-1.391415, 0.3640157, -0.9857029, 1, 0.5294118, 0, 1,
-1.388821, 0.398595, -3.206701, 1, 0.5333334, 0, 1,
-1.382577, -1.222742, -1.310435, 1, 0.5411765, 0, 1,
-1.367552, -0.266758, -2.272293, 1, 0.5450981, 0, 1,
-1.364675, 1.010495, -0.5794926, 1, 0.5529412, 0, 1,
-1.355826, -1.422408, -4.143567, 1, 0.5568628, 0, 1,
-1.341401, 1.384267, -0.9125258, 1, 0.5647059, 0, 1,
-1.327885, 1.704326, 0.4029892, 1, 0.5686275, 0, 1,
-1.32483, 0.9374765, -0.02194145, 1, 0.5764706, 0, 1,
-1.323345, 0.7040118, -0.3961458, 1, 0.5803922, 0, 1,
-1.318004, 0.3529417, -0.3400143, 1, 0.5882353, 0, 1,
-1.315508, -1.921259, -3.225809, 1, 0.5921569, 0, 1,
-1.312831, -0.4736551, -1.63607, 1, 0.6, 0, 1,
-1.307052, 0.8521349, -1.897079, 1, 0.6078432, 0, 1,
-1.305933, -0.04183766, 0.2226999, 1, 0.6117647, 0, 1,
-1.299858, 1.592161, -2.375213, 1, 0.6196079, 0, 1,
-1.297354, -0.4302819, -0.9018146, 1, 0.6235294, 0, 1,
-1.28039, -1.190373, -2.542847, 1, 0.6313726, 0, 1,
-1.270759, 1.955005, -0.9221275, 1, 0.6352941, 0, 1,
-1.262251, -0.5625237, -2.074128, 1, 0.6431373, 0, 1,
-1.261361, 0.2989807, -0.9224151, 1, 0.6470588, 0, 1,
-1.258889, -1.546442, -1.763726, 1, 0.654902, 0, 1,
-1.251232, -1.458875, -1.182769, 1, 0.6588235, 0, 1,
-1.248662, -1.994209, -4.777728, 1, 0.6666667, 0, 1,
-1.241608, 0.6098297, -0.5667883, 1, 0.6705883, 0, 1,
-1.240702, -0.1474407, -0.2881734, 1, 0.6784314, 0, 1,
-1.240315, -1.616149, -1.552318, 1, 0.682353, 0, 1,
-1.23395, -0.6617419, -1.536716, 1, 0.6901961, 0, 1,
-1.232027, 0.5919241, -1.068232, 1, 0.6941177, 0, 1,
-1.226224, 0.1830814, -3.277204, 1, 0.7019608, 0, 1,
-1.207849, 0.2067143, -1.69679, 1, 0.7098039, 0, 1,
-1.20667, 0.7825475, -1.928961, 1, 0.7137255, 0, 1,
-1.199579, -1.02159, -2.156187, 1, 0.7215686, 0, 1,
-1.192734, -0.1907499, -2.245091, 1, 0.7254902, 0, 1,
-1.190146, 1.020267, 0.7318757, 1, 0.7333333, 0, 1,
-1.190043, -0.1551555, -3.185625, 1, 0.7372549, 0, 1,
-1.186303, 0.7044846, -1.191211, 1, 0.7450981, 0, 1,
-1.178849, -1.619937, -1.790041, 1, 0.7490196, 0, 1,
-1.176062, 0.1947345, -0.6922458, 1, 0.7568628, 0, 1,
-1.174184, -0.9768899, 0.02604123, 1, 0.7607843, 0, 1,
-1.172131, 0.4914018, -1.427589, 1, 0.7686275, 0, 1,
-1.16967, 0.4551551, -2.034071, 1, 0.772549, 0, 1,
-1.164464, -0.6728166, -4.069764, 1, 0.7803922, 0, 1,
-1.156792, 1.979781, -1.523739, 1, 0.7843137, 0, 1,
-1.14339, 0.3407589, 0.4541776, 1, 0.7921569, 0, 1,
-1.1428, -0.7034547, -0.5760794, 1, 0.7960784, 0, 1,
-1.142103, -2.387519, -2.032367, 1, 0.8039216, 0, 1,
-1.139636, 0.4696459, 0.8022251, 1, 0.8117647, 0, 1,
-1.138424, 0.3673239, -1.826152, 1, 0.8156863, 0, 1,
-1.133649, -0.6444116, -1.720327, 1, 0.8235294, 0, 1,
-1.132897, -0.7257202, -1.405762, 1, 0.827451, 0, 1,
-1.125354, 0.3522557, -2.050018, 1, 0.8352941, 0, 1,
-1.123813, 0.1647054, -1.159849, 1, 0.8392157, 0, 1,
-1.105719, -0.3632239, -1.939039, 1, 0.8470588, 0, 1,
-1.097208, 0.2946337, -1.838453, 1, 0.8509804, 0, 1,
-1.094893, 0.2345119, -3.158583, 1, 0.8588235, 0, 1,
-1.091283, 1.137198, -0.6566319, 1, 0.8627451, 0, 1,
-1.083631, 0.6318374, 0.09134996, 1, 0.8705882, 0, 1,
-1.083411, -1.144132, -1.426044, 1, 0.8745098, 0, 1,
-1.063363, -0.2949461, -3.673482, 1, 0.8823529, 0, 1,
-1.057619, 0.05989015, -2.983028, 1, 0.8862745, 0, 1,
-1.051083, 0.110184, -1.238302, 1, 0.8941177, 0, 1,
-1.048539, 0.7917809, 1.231102, 1, 0.8980392, 0, 1,
-1.04796, 0.3332888, -3.582603, 1, 0.9058824, 0, 1,
-1.042607, -1.116846, -2.67047, 1, 0.9137255, 0, 1,
-1.042507, 0.6446393, -1.115296, 1, 0.9176471, 0, 1,
-1.042184, -0.2854808, -3.087957, 1, 0.9254902, 0, 1,
-1.040326, -0.2243326, -1.488765, 1, 0.9294118, 0, 1,
-1.039468, 0.01204812, 0.3610148, 1, 0.9372549, 0, 1,
-1.029879, 0.626176, -0.4294543, 1, 0.9411765, 0, 1,
-1.029622, 0.7119396, -2.25543, 1, 0.9490196, 0, 1,
-1.027689, -0.5005294, -2.980174, 1, 0.9529412, 0, 1,
-1.026224, 0.2295787, -1.731543, 1, 0.9607843, 0, 1,
-1.023219, -0.2382114, -3.394213, 1, 0.9647059, 0, 1,
-1.015727, 0.3838351, -0.1778868, 1, 0.972549, 0, 1,
-1.013781, -0.4485174, -1.331048, 1, 0.9764706, 0, 1,
-1.010826, 0.3016549, -0.583962, 1, 0.9843137, 0, 1,
-1.009532, 0.7022947, -1.130931, 1, 0.9882353, 0, 1,
-1.007508, 0.871567, -0.4464615, 1, 0.9960784, 0, 1,
-0.9980199, -0.6822006, -0.5338784, 0.9960784, 1, 0, 1,
-0.9942979, -0.04858259, -1.143629, 0.9921569, 1, 0, 1,
-0.9908355, -0.4179071, -3.341749, 0.9843137, 1, 0, 1,
-0.9896246, 0.8074337, -0.09953512, 0.9803922, 1, 0, 1,
-0.9856924, 0.5361772, -2.156212, 0.972549, 1, 0, 1,
-0.9852275, 0.9728877, -0.3630011, 0.9686275, 1, 0, 1,
-0.985077, -0.6582727, -2.43681, 0.9607843, 1, 0, 1,
-0.9838706, 0.6335289, -1.015533, 0.9568627, 1, 0, 1,
-0.9820783, 1.309464, -0.3690475, 0.9490196, 1, 0, 1,
-0.9794506, -0.859789, -2.501198, 0.945098, 1, 0, 1,
-0.9764006, -0.8675204, -0.5811136, 0.9372549, 1, 0, 1,
-0.9756138, -0.5943078, -2.034503, 0.9333333, 1, 0, 1,
-0.9716865, -0.6351187, -1.939453, 0.9254902, 1, 0, 1,
-0.9664765, -0.3633549, -0.0537522, 0.9215686, 1, 0, 1,
-0.9626551, -1.10995, -3.280389, 0.9137255, 1, 0, 1,
-0.9608306, 0.2692787, -0.1862189, 0.9098039, 1, 0, 1,
-0.9513017, -0.1658819, -1.761765, 0.9019608, 1, 0, 1,
-0.9388328, -0.7931327, -1.730422, 0.8941177, 1, 0, 1,
-0.9335179, -0.5426292, -2.515152, 0.8901961, 1, 0, 1,
-0.9258514, -2.498409, -3.867157, 0.8823529, 1, 0, 1,
-0.9194196, -0.5124954, -2.578394, 0.8784314, 1, 0, 1,
-0.9132494, 0.02456708, -1.723585, 0.8705882, 1, 0, 1,
-0.9116552, -0.09222887, -1.381263, 0.8666667, 1, 0, 1,
-0.911121, 0.9074277, -2.632015, 0.8588235, 1, 0, 1,
-0.8999934, -0.3687616, -0.7715213, 0.854902, 1, 0, 1,
-0.8974015, 0.3864551, 0.5909882, 0.8470588, 1, 0, 1,
-0.8902643, 0.8209815, -0.9796706, 0.8431373, 1, 0, 1,
-0.8872282, -0.02781906, -2.547851, 0.8352941, 1, 0, 1,
-0.883285, 1.323224, -1.74422, 0.8313726, 1, 0, 1,
-0.8638322, -0.02470663, -2.348303, 0.8235294, 1, 0, 1,
-0.8615776, -0.4033027, -3.165034, 0.8196079, 1, 0, 1,
-0.858095, 1.475959, -0.3529656, 0.8117647, 1, 0, 1,
-0.8577271, -0.06571765, -2.051629, 0.8078431, 1, 0, 1,
-0.8470498, 0.5470657, -0.7424152, 0.8, 1, 0, 1,
-0.8449163, -0.5237946, -0.04618522, 0.7921569, 1, 0, 1,
-0.8393813, 0.2411546, -2.3143, 0.7882353, 1, 0, 1,
-0.836603, 0.9874603, -0.7787251, 0.7803922, 1, 0, 1,
-0.8353834, -0.7888034, -2.292742, 0.7764706, 1, 0, 1,
-0.8296807, 0.841095, -2.655836, 0.7686275, 1, 0, 1,
-0.8265606, 0.3815951, -1.305638, 0.7647059, 1, 0, 1,
-0.8241397, 0.04023013, -3.310834, 0.7568628, 1, 0, 1,
-0.8236366, -0.1377035, -3.880837, 0.7529412, 1, 0, 1,
-0.8226342, 0.8161258, 0.1512918, 0.7450981, 1, 0, 1,
-0.8225141, -0.1324231, -2.806498, 0.7411765, 1, 0, 1,
-0.8172499, -1.5367, -3.405317, 0.7333333, 1, 0, 1,
-0.8169612, -1.395148, -1.56145, 0.7294118, 1, 0, 1,
-0.816541, 0.1913707, -1.30496, 0.7215686, 1, 0, 1,
-0.8093969, 0.689613, -1.256686, 0.7176471, 1, 0, 1,
-0.8047327, -0.2392938, -2.212278, 0.7098039, 1, 0, 1,
-0.8033907, -1.91955, -2.800957, 0.7058824, 1, 0, 1,
-0.8002925, 1.136967, -0.1051741, 0.6980392, 1, 0, 1,
-0.7947702, -0.7062798, -2.111994, 0.6901961, 1, 0, 1,
-0.7942708, 0.8310258, -0.9180542, 0.6862745, 1, 0, 1,
-0.7851226, -0.2742243, -2.326149, 0.6784314, 1, 0, 1,
-0.7754399, 0.1290037, -1.313177, 0.6745098, 1, 0, 1,
-0.7751321, 0.3892938, -0.8204199, 0.6666667, 1, 0, 1,
-0.7687221, -0.2106739, -1.727633, 0.6627451, 1, 0, 1,
-0.7670598, -1.067836, -2.164174, 0.654902, 1, 0, 1,
-0.766886, -0.3501751, -2.743634, 0.6509804, 1, 0, 1,
-0.7579186, -2.296499, -1.879044, 0.6431373, 1, 0, 1,
-0.7533592, -0.6838086, -1.076786, 0.6392157, 1, 0, 1,
-0.7516826, 0.7205602, 0.36669, 0.6313726, 1, 0, 1,
-0.745739, 0.1719281, -2.080517, 0.627451, 1, 0, 1,
-0.7387456, 1.560833, -0.2435995, 0.6196079, 1, 0, 1,
-0.7379219, -1.36564, -4.064539, 0.6156863, 1, 0, 1,
-0.7363728, -0.1536009, -1.881166, 0.6078432, 1, 0, 1,
-0.7352636, -0.04321108, -1.046164, 0.6039216, 1, 0, 1,
-0.7328298, 0.07966886, -1.215564, 0.5960785, 1, 0, 1,
-0.7316113, -1.5937, -3.886597, 0.5882353, 1, 0, 1,
-0.7291481, -0.3470449, -1.693709, 0.5843138, 1, 0, 1,
-0.7283193, 0.356218, -0.7435158, 0.5764706, 1, 0, 1,
-0.7249928, -1.103038, -1.735523, 0.572549, 1, 0, 1,
-0.7247836, 0.5068134, -0.1050166, 0.5647059, 1, 0, 1,
-0.7215132, -0.9659638, -1.699825, 0.5607843, 1, 0, 1,
-0.7191554, -0.4764808, -2.193438, 0.5529412, 1, 0, 1,
-0.717723, -0.8557512, -2.226009, 0.5490196, 1, 0, 1,
-0.7141422, -0.2922042, -1.10124, 0.5411765, 1, 0, 1,
-0.7128544, 1.117103, -0.8908745, 0.5372549, 1, 0, 1,
-0.7102504, 1.474385, -0.4096217, 0.5294118, 1, 0, 1,
-0.7054546, -0.4805467, 0.1309704, 0.5254902, 1, 0, 1,
-0.7015398, -1.663902, -2.498243, 0.5176471, 1, 0, 1,
-0.6958356, 1.395069, 0.2716832, 0.5137255, 1, 0, 1,
-0.6928194, 0.5942308, -1.370496, 0.5058824, 1, 0, 1,
-0.691485, -1.083296, -1.025965, 0.5019608, 1, 0, 1,
-0.6887445, -0.5684295, -2.64098, 0.4941176, 1, 0, 1,
-0.6874456, -1.283843, -2.43675, 0.4862745, 1, 0, 1,
-0.6817178, -0.2312277, -2.946066, 0.4823529, 1, 0, 1,
-0.6814896, 1.99372, -1.415098, 0.4745098, 1, 0, 1,
-0.680254, -0.6125534, -2.452532, 0.4705882, 1, 0, 1,
-0.6740441, 0.1699819, -0.0637837, 0.4627451, 1, 0, 1,
-0.6729671, -0.3849773, -1.659411, 0.4588235, 1, 0, 1,
-0.671877, 1.142374, -1.113353, 0.4509804, 1, 0, 1,
-0.6658025, -0.2055036, -0.6298054, 0.4470588, 1, 0, 1,
-0.6505406, 1.690008, 0.0733032, 0.4392157, 1, 0, 1,
-0.6495671, 0.8151408, 0.2917668, 0.4352941, 1, 0, 1,
-0.6469772, -0.8273974, -2.961574, 0.427451, 1, 0, 1,
-0.6454627, 2.02433, -0.7935072, 0.4235294, 1, 0, 1,
-0.6420532, 1.129162, -0.8267827, 0.4156863, 1, 0, 1,
-0.637813, 1.295542, -0.9793503, 0.4117647, 1, 0, 1,
-0.6370963, 1.267327, -1.276338, 0.4039216, 1, 0, 1,
-0.635086, 1.135684, -0.2350087, 0.3960784, 1, 0, 1,
-0.6333426, 0.4008146, -2.344341, 0.3921569, 1, 0, 1,
-0.6302451, 2.636429, -0.1829821, 0.3843137, 1, 0, 1,
-0.6301792, -0.5580558, -3.645703, 0.3803922, 1, 0, 1,
-0.6274568, -0.3998708, -0.1295029, 0.372549, 1, 0, 1,
-0.6248924, 0.1494477, -1.457249, 0.3686275, 1, 0, 1,
-0.622498, 1.601017, -0.388766, 0.3607843, 1, 0, 1,
-0.6217424, 0.2651391, -0.9179046, 0.3568628, 1, 0, 1,
-0.6199213, -1.000087, -2.196922, 0.3490196, 1, 0, 1,
-0.6140717, 1.661053, -0.4609447, 0.345098, 1, 0, 1,
-0.6114559, 0.3602436, -1.915347, 0.3372549, 1, 0, 1,
-0.6087241, 0.02605838, -2.723005, 0.3333333, 1, 0, 1,
-0.6072932, 0.7836682, -0.5060089, 0.3254902, 1, 0, 1,
-0.6058418, 0.6133589, -1.640938, 0.3215686, 1, 0, 1,
-0.6055245, 0.238406, -1.213091, 0.3137255, 1, 0, 1,
-0.6053227, -1.024267, -3.571821, 0.3098039, 1, 0, 1,
-0.6044564, -1.673374, -2.02366, 0.3019608, 1, 0, 1,
-0.6035672, -0.4110698, -2.377928, 0.2941177, 1, 0, 1,
-0.6018463, 0.4860854, -0.04589521, 0.2901961, 1, 0, 1,
-0.6007676, 1.727931, -1.240742, 0.282353, 1, 0, 1,
-0.5996868, -0.6768785, -1.917395, 0.2784314, 1, 0, 1,
-0.5980508, 0.9109806, 0.856454, 0.2705882, 1, 0, 1,
-0.5873914, -0.6053161, -2.809338, 0.2666667, 1, 0, 1,
-0.5844884, -1.173042, -3.20762, 0.2588235, 1, 0, 1,
-0.5804633, -1.607667, -3.054201, 0.254902, 1, 0, 1,
-0.579969, -1.013217, -3.112206, 0.2470588, 1, 0, 1,
-0.5788687, -0.3501179, -2.830649, 0.2431373, 1, 0, 1,
-0.570793, 1.322459, -0.3420688, 0.2352941, 1, 0, 1,
-0.5702487, -0.8237748, -2.455764, 0.2313726, 1, 0, 1,
-0.5692432, -2.222166, -3.459524, 0.2235294, 1, 0, 1,
-0.5689004, -0.8140092, -0.6567842, 0.2196078, 1, 0, 1,
-0.5658318, -1.37478, -3.143418, 0.2117647, 1, 0, 1,
-0.5614144, 0.961262, -0.2259566, 0.2078431, 1, 0, 1,
-0.5613194, 0.5645352, -1.075363, 0.2, 1, 0, 1,
-0.5602171, 1.458399, -0.7283825, 0.1921569, 1, 0, 1,
-0.559445, -0.6409192, -2.956371, 0.1882353, 1, 0, 1,
-0.5541684, -0.6173463, -1.606946, 0.1803922, 1, 0, 1,
-0.5505883, 0.08927886, -1.820701, 0.1764706, 1, 0, 1,
-0.5439934, -0.3943539, -1.213148, 0.1686275, 1, 0, 1,
-0.5376465, 1.708224, 0.3821909, 0.1647059, 1, 0, 1,
-0.5356491, 1.643368, 0.3153222, 0.1568628, 1, 0, 1,
-0.5321195, -1.012987, -3.32893, 0.1529412, 1, 0, 1,
-0.5261695, 0.73, -1.353335, 0.145098, 1, 0, 1,
-0.5260602, 0.5483793, -0.4900041, 0.1411765, 1, 0, 1,
-0.5236013, -0.00580207, -0.9728727, 0.1333333, 1, 0, 1,
-0.5231451, -0.5289572, -2.816494, 0.1294118, 1, 0, 1,
-0.5160722, -1.648487, -2.515666, 0.1215686, 1, 0, 1,
-0.5133803, 0.309925, -1.295135, 0.1176471, 1, 0, 1,
-0.5111243, 0.5838075, -0.03985534, 0.1098039, 1, 0, 1,
-0.5095071, 1.861797, -0.5736391, 0.1058824, 1, 0, 1,
-0.5033021, -0.8871183, -5.492166, 0.09803922, 1, 0, 1,
-0.4942607, -0.4414693, -3.510479, 0.09019608, 1, 0, 1,
-0.4884882, -0.4935771, -1.055468, 0.08627451, 1, 0, 1,
-0.4881432, -0.002875522, -0.1059989, 0.07843138, 1, 0, 1,
-0.4863073, -0.3662819, -2.41907, 0.07450981, 1, 0, 1,
-0.4857031, -1.408081, -3.939107, 0.06666667, 1, 0, 1,
-0.4855662, -1.001867, -3.228397, 0.0627451, 1, 0, 1,
-0.4818191, 0.7676663, -1.44246, 0.05490196, 1, 0, 1,
-0.481725, -0.4637115, -2.25702, 0.05098039, 1, 0, 1,
-0.4807907, 1.908219, 0.8730248, 0.04313726, 1, 0, 1,
-0.476606, 0.3559293, -0.7866926, 0.03921569, 1, 0, 1,
-0.4737445, 1.372141, -0.5974763, 0.03137255, 1, 0, 1,
-0.4725837, -0.3715279, -1.175828, 0.02745098, 1, 0, 1,
-0.4707997, 0.4916798, 0.1276528, 0.01960784, 1, 0, 1,
-0.469212, -0.1716971, -2.303772, 0.01568628, 1, 0, 1,
-0.4594732, 1.319322, -1.079592, 0.007843138, 1, 0, 1,
-0.4593991, -0.01459168, -0.4892043, 0.003921569, 1, 0, 1,
-0.4499263, -1.26722, -3.154213, 0, 1, 0.003921569, 1,
-0.4470009, -0.1910885, -2.019551, 0, 1, 0.01176471, 1,
-0.4435612, 1.524406, 0.4131504, 0, 1, 0.01568628, 1,
-0.4383186, -0.4930244, -1.961694, 0, 1, 0.02352941, 1,
-0.435409, 1.183688, 0.4573288, 0, 1, 0.02745098, 1,
-0.435367, -0.1366708, -2.687329, 0, 1, 0.03529412, 1,
-0.4341612, 1.182631, -0.3840688, 0, 1, 0.03921569, 1,
-0.4318546, 0.285096, -1.1911, 0, 1, 0.04705882, 1,
-0.4265302, 1.404039, 1.436582, 0, 1, 0.05098039, 1,
-0.412836, 1.448421, 1.141451, 0, 1, 0.05882353, 1,
-0.411188, 1.094661, 2.168108, 0, 1, 0.0627451, 1,
-0.4107287, -1.370608, -3.072434, 0, 1, 0.07058824, 1,
-0.4104342, 0.7392057, -0.1677412, 0, 1, 0.07450981, 1,
-0.4060574, -0.4698083, -2.6282, 0, 1, 0.08235294, 1,
-0.4048681, 2.617081, 0.6914474, 0, 1, 0.08627451, 1,
-0.4039218, -0.1879672, -3.038389, 0, 1, 0.09411765, 1,
-0.4020468, 1.251058, -0.04099288, 0, 1, 0.1019608, 1,
-0.3999035, 0.1945285, -1.026743, 0, 1, 0.1058824, 1,
-0.3955348, -1.803948, -2.479346, 0, 1, 0.1137255, 1,
-0.3949513, -0.9675136, -1.560707, 0, 1, 0.1176471, 1,
-0.3945428, -1.212492, -3.906049, 0, 1, 0.1254902, 1,
-0.393338, -0.4764868, -3.173476, 0, 1, 0.1294118, 1,
-0.3930854, -0.9826014, -1.939374, 0, 1, 0.1372549, 1,
-0.3917747, -0.04405354, -3.018224, 0, 1, 0.1411765, 1,
-0.3868241, -0.3650977, -2.572192, 0, 1, 0.1490196, 1,
-0.3785676, -0.08539425, -2.974621, 0, 1, 0.1529412, 1,
-0.3755647, 0.1879957, 0.79058, 0, 1, 0.1607843, 1,
-0.3726532, -0.6446424, -2.556015, 0, 1, 0.1647059, 1,
-0.3697087, -2.090748, -4.540723, 0, 1, 0.172549, 1,
-0.3628476, -0.1694632, -2.215963, 0, 1, 0.1764706, 1,
-0.3605063, 0.8828819, 0.7820234, 0, 1, 0.1843137, 1,
-0.3491565, -0.8330494, -2.040858, 0, 1, 0.1882353, 1,
-0.3467954, -0.5920264, -2.947756, 0, 1, 0.1960784, 1,
-0.3438629, -0.2304323, -3.278682, 0, 1, 0.2039216, 1,
-0.3356153, -1.601453, -1.818278, 0, 1, 0.2078431, 1,
-0.3333444, -1.414539, -3.820138, 0, 1, 0.2156863, 1,
-0.3292713, -1.76661, -3.408803, 0, 1, 0.2196078, 1,
-0.32612, -0.8601508, -1.014953, 0, 1, 0.227451, 1,
-0.3260559, 0.3694739, -0.1778036, 0, 1, 0.2313726, 1,
-0.3258305, -1.460496, -2.868775, 0, 1, 0.2392157, 1,
-0.3223158, -1.931087, -2.490254, 0, 1, 0.2431373, 1,
-0.3201767, -0.2433193, -1.80713, 0, 1, 0.2509804, 1,
-0.3185476, -2.178627, -3.358155, 0, 1, 0.254902, 1,
-0.3125899, 0.963869, 0.1196163, 0, 1, 0.2627451, 1,
-0.3101234, -2.502793, -5.371471, 0, 1, 0.2666667, 1,
-0.3092504, 0.9702786, -1.552664, 0, 1, 0.2745098, 1,
-0.3092447, -0.6671389, -2.335351, 0, 1, 0.2784314, 1,
-0.3083769, 0.6872737, -1.800197, 0, 1, 0.2862745, 1,
-0.3058498, 0.2485135, -2.06284, 0, 1, 0.2901961, 1,
-0.3042092, 0.8571601, 1.621296, 0, 1, 0.2980392, 1,
-0.2992451, -1.253087, -0.8777775, 0, 1, 0.3058824, 1,
-0.2984864, 1.087996, -0.6144068, 0, 1, 0.3098039, 1,
-0.290083, -0.4169888, -2.264304, 0, 1, 0.3176471, 1,
-0.2893761, 0.7971398, -0.9491718, 0, 1, 0.3215686, 1,
-0.2880487, -0.4575893, -3.934118, 0, 1, 0.3294118, 1,
-0.2850286, -0.304433, -1.7458, 0, 1, 0.3333333, 1,
-0.284355, -0.7205581, -4.369418, 0, 1, 0.3411765, 1,
-0.2796012, -0.4741772, -2.956509, 0, 1, 0.345098, 1,
-0.2788666, 0.8209215, 0.4519097, 0, 1, 0.3529412, 1,
-0.278794, 0.523114, -0.8211053, 0, 1, 0.3568628, 1,
-0.2777444, -0.335308, -1.557243, 0, 1, 0.3647059, 1,
-0.2760481, -0.1320409, -1.463203, 0, 1, 0.3686275, 1,
-0.2679598, -1.020379, -0.800409, 0, 1, 0.3764706, 1,
-0.2612971, -0.6700585, -2.016664, 0, 1, 0.3803922, 1,
-0.2612771, -1.425216, -2.519355, 0, 1, 0.3882353, 1,
-0.2487537, -0.1193596, -3.171259, 0, 1, 0.3921569, 1,
-0.2485711, 0.07520383, -0.3328029, 0, 1, 0.4, 1,
-0.2482741, 1.700321, 0.2504904, 0, 1, 0.4078431, 1,
-0.2463845, -0.643405, -3.118825, 0, 1, 0.4117647, 1,
-0.2417225, 2.73945, 0.2426434, 0, 1, 0.4196078, 1,
-0.2385064, -0.2026084, -2.354251, 0, 1, 0.4235294, 1,
-0.2355967, -0.09439801, -1.869658, 0, 1, 0.4313726, 1,
-0.2256399, 0.7351323, -0.7325211, 0, 1, 0.4352941, 1,
-0.2218311, 1.049424, 0.1988585, 0, 1, 0.4431373, 1,
-0.221087, 0.952822, -0.7030155, 0, 1, 0.4470588, 1,
-0.2176006, -0.4950303, -3.342854, 0, 1, 0.454902, 1,
-0.2151877, 0.3991277, -0.7402864, 0, 1, 0.4588235, 1,
-0.2065834, 0.2401281, 0.2525799, 0, 1, 0.4666667, 1,
-0.2034321, -0.463688, -2.185972, 0, 1, 0.4705882, 1,
-0.2025061, 0.7374216, -0.9286069, 0, 1, 0.4784314, 1,
-0.2016639, 0.650253, -1.478756, 0, 1, 0.4823529, 1,
-0.1994451, 0.8687018, 0.8828033, 0, 1, 0.4901961, 1,
-0.1982502, 2.155218, -0.5626515, 0, 1, 0.4941176, 1,
-0.1961233, 1.740478, 0.3183177, 0, 1, 0.5019608, 1,
-0.1950298, 1.977106, 1.316343, 0, 1, 0.509804, 1,
-0.1903701, -1.22015, -1.057934, 0, 1, 0.5137255, 1,
-0.1903613, 0.06543121, -0.2728283, 0, 1, 0.5215687, 1,
-0.187722, -1.406125, -3.002937, 0, 1, 0.5254902, 1,
-0.1869093, -0.01435104, -3.878869, 0, 1, 0.5333334, 1,
-0.1789772, -0.7055482, -3.874139, 0, 1, 0.5372549, 1,
-0.1775991, 0.1025767, -1.013989, 0, 1, 0.5450981, 1,
-0.1765348, 0.1223922, 0.5843742, 0, 1, 0.5490196, 1,
-0.1764178, -0.02289529, -1.465363, 0, 1, 0.5568628, 1,
-0.1749566, -1.226558, -4.06731, 0, 1, 0.5607843, 1,
-0.1741677, 0.006490387, -1.953634, 0, 1, 0.5686275, 1,
-0.1740727, -0.5669976, -2.13773, 0, 1, 0.572549, 1,
-0.1721451, 0.1019744, -0.9257622, 0, 1, 0.5803922, 1,
-0.1717428, -1.492488, -1.453434, 0, 1, 0.5843138, 1,
-0.1707619, -0.03006627, -2.325488, 0, 1, 0.5921569, 1,
-0.1679858, -1.014015, -3.083714, 0, 1, 0.5960785, 1,
-0.1631332, 1.90387, 0.517505, 0, 1, 0.6039216, 1,
-0.1624858, -1.411506, -3.638304, 0, 1, 0.6117647, 1,
-0.1586459, 1.178585, -0.3605019, 0, 1, 0.6156863, 1,
-0.1586324, 2.096378, -2.100207, 0, 1, 0.6235294, 1,
-0.1434089, 0.08467921, 1.131534, 0, 1, 0.627451, 1,
-0.1430187, -0.9145435, -3.226801, 0, 1, 0.6352941, 1,
-0.1415709, -0.6899926, -3.051541, 0, 1, 0.6392157, 1,
-0.1414183, 0.2752633, -0.6946319, 0, 1, 0.6470588, 1,
-0.1412217, -0.03022884, -2.457763, 0, 1, 0.6509804, 1,
-0.1396992, -1.042033, -2.637352, 0, 1, 0.6588235, 1,
-0.1372081, 0.08044713, 0.02892779, 0, 1, 0.6627451, 1,
-0.1330539, -1.547335, -3.161703, 0, 1, 0.6705883, 1,
-0.1319999, -0.1505471, -2.526006, 0, 1, 0.6745098, 1,
-0.1294672, -0.5170064, -3.748675, 0, 1, 0.682353, 1,
-0.1283377, -2.05951, -3.384416, 0, 1, 0.6862745, 1,
-0.1262515, 1.807581, -0.9900023, 0, 1, 0.6941177, 1,
-0.124793, 0.2723629, -1.756298, 0, 1, 0.7019608, 1,
-0.1234355, -0.642751, -1.858957, 0, 1, 0.7058824, 1,
-0.1188117, 0.1051539, -1.196135, 0, 1, 0.7137255, 1,
-0.1125758, 0.8424221, 0.9296556, 0, 1, 0.7176471, 1,
-0.1099619, 0.411311, -2.359473, 0, 1, 0.7254902, 1,
-0.1081708, -0.3115183, -1.500424, 0, 1, 0.7294118, 1,
-0.1063955, 1.036525, -0.2268175, 0, 1, 0.7372549, 1,
-0.1054053, 1.469207, 0.4157943, 0, 1, 0.7411765, 1,
-0.1050005, -0.0009890328, -2.205394, 0, 1, 0.7490196, 1,
-0.1019472, 0.9697008, 0.3811421, 0, 1, 0.7529412, 1,
-0.1010393, -2.830159, -2.629953, 0, 1, 0.7607843, 1,
-0.1000536, -0.8930272, -4.307937, 0, 1, 0.7647059, 1,
-0.09929853, 0.6274698, -1.456276, 0, 1, 0.772549, 1,
-0.09408902, 0.4489296, -0.7700353, 0, 1, 0.7764706, 1,
-0.0928737, 0.9297932, 2.371253, 0, 1, 0.7843137, 1,
-0.0923443, -0.4451637, -3.502066, 0, 1, 0.7882353, 1,
-0.09094574, -0.1623526, -1.513461, 0, 1, 0.7960784, 1,
-0.08705747, 1.249127, -1.478577, 0, 1, 0.8039216, 1,
-0.08683448, 2.230815, 0.8408807, 0, 1, 0.8078431, 1,
-0.0861013, -0.6924853, -3.339127, 0, 1, 0.8156863, 1,
-0.07782587, -0.3447759, -1.280882, 0, 1, 0.8196079, 1,
-0.07220189, 0.0405589, -2.763378, 0, 1, 0.827451, 1,
-0.0701334, -0.4619846, -2.917951, 0, 1, 0.8313726, 1,
-0.06846858, 0.9931661, -0.6603258, 0, 1, 0.8392157, 1,
-0.06810568, -2.333104, -3.017133, 0, 1, 0.8431373, 1,
-0.06705108, 0.5175492, -0.7839708, 0, 1, 0.8509804, 1,
-0.06651425, -0.7335994, -4.235291, 0, 1, 0.854902, 1,
-0.06612576, 0.3344602, -0.9960229, 0, 1, 0.8627451, 1,
-0.06563745, 0.746505, 0.9733298, 0, 1, 0.8666667, 1,
-0.06497183, 2.811293, 1.502439, 0, 1, 0.8745098, 1,
-0.06386413, -0.4284727, -3.205729, 0, 1, 0.8784314, 1,
-0.05982027, -1.253473, -3.309426, 0, 1, 0.8862745, 1,
-0.05849166, 0.9800247, 0.5819576, 0, 1, 0.8901961, 1,
-0.05001155, -1.182732, -3.302061, 0, 1, 0.8980392, 1,
-0.04960057, 1.663134, 0.5506819, 0, 1, 0.9058824, 1,
-0.04880254, 0.04953278, -1.977173, 0, 1, 0.9098039, 1,
-0.04475167, -0.6082261, -3.029467, 0, 1, 0.9176471, 1,
-0.04369672, -1.20749, -2.918298, 0, 1, 0.9215686, 1,
-0.04019369, 0.2595624, -0.202535, 0, 1, 0.9294118, 1,
-0.03655731, -1.154001, -2.359995, 0, 1, 0.9333333, 1,
-0.03338575, -0.6309788, -3.270151, 0, 1, 0.9411765, 1,
-0.02689007, 0.5651343, 0.2750723, 0, 1, 0.945098, 1,
-0.02351287, -0.2028062, -3.746941, 0, 1, 0.9529412, 1,
-0.02140905, -0.1523459, -2.237529, 0, 1, 0.9568627, 1,
-0.01940133, -0.2105772, -2.158983, 0, 1, 0.9647059, 1,
-0.01620683, 1.155551, -0.888645, 0, 1, 0.9686275, 1,
-0.0155841, -1.007203, -2.840377, 0, 1, 0.9764706, 1,
-0.01309424, -0.2025674, -3.960398, 0, 1, 0.9803922, 1,
-0.01220263, -0.0853014, -0.9990134, 0, 1, 0.9882353, 1,
-0.009195951, 1.991161, -0.2181584, 0, 1, 0.9921569, 1,
-0.007601929, -0.1374979, -2.497628, 0, 1, 1, 1,
-0.00691649, -0.5626513, -2.073578, 0, 0.9921569, 1, 1,
-0.005680738, -0.5707116, -2.832695, 0, 0.9882353, 1, 1,
-0.005026244, 0.2469849, 1.82896, 0, 0.9803922, 1, 1,
-0.003219099, 2.049335, 0.6070086, 0, 0.9764706, 1, 1,
-0.002593484, 0.5231647, 0.4235742, 0, 0.9686275, 1, 1,
0.0009949706, -0.9560264, 4.86952, 0, 0.9647059, 1, 1,
0.00715996, -0.3557258, 3.52542, 0, 0.9568627, 1, 1,
0.007228683, 1.185291, -0.2098322, 0, 0.9529412, 1, 1,
0.01385052, -0.3688606, 2.300579, 0, 0.945098, 1, 1,
0.01455765, 0.8393411, 1.090723, 0, 0.9411765, 1, 1,
0.01619118, 1.602759, -4.081803, 0, 0.9333333, 1, 1,
0.01644687, 0.8757738, -1.887171, 0, 0.9294118, 1, 1,
0.02254879, 0.2666223, -1.053996, 0, 0.9215686, 1, 1,
0.02534324, -0.1171954, 2.332377, 0, 0.9176471, 1, 1,
0.02969594, -0.3645085, 2.980972, 0, 0.9098039, 1, 1,
0.03227126, 0.8085459, 2.052589, 0, 0.9058824, 1, 1,
0.03494208, -0.7988833, 2.895592, 0, 0.8980392, 1, 1,
0.04164537, 0.3047778, 0.07933307, 0, 0.8901961, 1, 1,
0.04181345, 0.8626101, 0.7420403, 0, 0.8862745, 1, 1,
0.04353477, -1.170677, 1.861378, 0, 0.8784314, 1, 1,
0.04696089, 0.2303322, -0.1935157, 0, 0.8745098, 1, 1,
0.04761893, 0.1305015, -0.5516037, 0, 0.8666667, 1, 1,
0.04836492, 0.0968029, -0.5849311, 0, 0.8627451, 1, 1,
0.05183587, -1.86266, 2.848922, 0, 0.854902, 1, 1,
0.05410242, -0.9340329, 4.007813, 0, 0.8509804, 1, 1,
0.05520024, 0.6208735, 0.5226115, 0, 0.8431373, 1, 1,
0.05543078, -1.101514, 4.131418, 0, 0.8392157, 1, 1,
0.05580526, -2.030218, 3.398545, 0, 0.8313726, 1, 1,
0.06039642, 0.4284461, -0.7532414, 0, 0.827451, 1, 1,
0.06323223, -0.7256572, 4.05093, 0, 0.8196079, 1, 1,
0.06600625, -0.4779627, 2.980618, 0, 0.8156863, 1, 1,
0.07045666, -0.4472215, 3.217937, 0, 0.8078431, 1, 1,
0.07119113, 0.5255651, 1.377653, 0, 0.8039216, 1, 1,
0.07212965, -2.071773, 1.567783, 0, 0.7960784, 1, 1,
0.07283507, 0.1514637, -0.4255597, 0, 0.7882353, 1, 1,
0.07516562, 0.08158075, 1.734106, 0, 0.7843137, 1, 1,
0.07574369, -1.142336, 2.756916, 0, 0.7764706, 1, 1,
0.08103404, 1.088485, 1.132451, 0, 0.772549, 1, 1,
0.08260417, -0.762032, 3.605152, 0, 0.7647059, 1, 1,
0.0848901, 0.03495258, 1.801116, 0, 0.7607843, 1, 1,
0.0882024, -1.830453, 3.855187, 0, 0.7529412, 1, 1,
0.08846404, -0.1824446, 3.037566, 0, 0.7490196, 1, 1,
0.09075291, 0.2323716, 0.1994437, 0, 0.7411765, 1, 1,
0.09621785, -1.584039, 2.785647, 0, 0.7372549, 1, 1,
0.1064027, -0.185898, 2.842116, 0, 0.7294118, 1, 1,
0.1192376, 0.2385885, 0.9087441, 0, 0.7254902, 1, 1,
0.1213123, 1.194881, 0.6657883, 0, 0.7176471, 1, 1,
0.1222093, -0.4028921, 3.529819, 0, 0.7137255, 1, 1,
0.1253681, 0.4820733, 1.983989, 0, 0.7058824, 1, 1,
0.1254897, -0.2609278, 4.439971, 0, 0.6980392, 1, 1,
0.1255761, -0.3020577, 3.229729, 0, 0.6941177, 1, 1,
0.1276462, 1.44858, 1.326634, 0, 0.6862745, 1, 1,
0.1300941, 0.6278796, 0.5179648, 0, 0.682353, 1, 1,
0.1313426, 1.250652, -1.76422, 0, 0.6745098, 1, 1,
0.1338549, -1.264587, 2.130709, 0, 0.6705883, 1, 1,
0.1434433, 0.7703595, -0.03248713, 0, 0.6627451, 1, 1,
0.1512818, 0.4393269, 3.479033, 0, 0.6588235, 1, 1,
0.1552742, 0.9235662, 0.08227017, 0, 0.6509804, 1, 1,
0.1557736, -0.2171531, 2.147058, 0, 0.6470588, 1, 1,
0.1581338, 1.539656, 0.08964111, 0, 0.6392157, 1, 1,
0.1589854, -0.2459765, 4.078905, 0, 0.6352941, 1, 1,
0.1645457, 1.343181, -1.003029, 0, 0.627451, 1, 1,
0.1654447, 0.4011819, 0.5712073, 0, 0.6235294, 1, 1,
0.1800413, 1.812441, 0.09124313, 0, 0.6156863, 1, 1,
0.1863956, 0.7129584, 1.259552, 0, 0.6117647, 1, 1,
0.1875569, -0.4294497, 1.720016, 0, 0.6039216, 1, 1,
0.1901285, -0.3024566, 2.841416, 0, 0.5960785, 1, 1,
0.1912663, 0.3124557, 1.553324, 0, 0.5921569, 1, 1,
0.1923207, 0.1024103, 0.6481285, 0, 0.5843138, 1, 1,
0.1967541, 0.5668185, -0.3667926, 0, 0.5803922, 1, 1,
0.1988959, 1.178246, 0.4503932, 0, 0.572549, 1, 1,
0.2032822, -1.387773, 3.525277, 0, 0.5686275, 1, 1,
0.2038008, 0.1559645, 2.615059, 0, 0.5607843, 1, 1,
0.2045867, 1.812424, -0.9968129, 0, 0.5568628, 1, 1,
0.2050156, 0.433205, 0.749792, 0, 0.5490196, 1, 1,
0.2086905, -1.209296, 2.334118, 0, 0.5450981, 1, 1,
0.2110252, 0.9584659, 0.5650769, 0, 0.5372549, 1, 1,
0.2111623, 0.2784924, 1.217086, 0, 0.5333334, 1, 1,
0.214612, -0.3802215, 1.335329, 0, 0.5254902, 1, 1,
0.2164969, 1.295121, 0.2824269, 0, 0.5215687, 1, 1,
0.219197, 1.915135, -1.857818, 0, 0.5137255, 1, 1,
0.220978, -1.024331, 3.166918, 0, 0.509804, 1, 1,
0.221394, 0.07544627, 1.508093, 0, 0.5019608, 1, 1,
0.2287594, 0.4952581, 0.798027, 0, 0.4941176, 1, 1,
0.2293178, 0.0285083, 2.332594, 0, 0.4901961, 1, 1,
0.231193, -0.9737465, 3.977421, 0, 0.4823529, 1, 1,
0.2319067, -1.290957, 3.304419, 0, 0.4784314, 1, 1,
0.2352869, 0.3454353, 1.089248, 0, 0.4705882, 1, 1,
0.2401353, -0.02610445, 0.03911199, 0, 0.4666667, 1, 1,
0.243309, -2.1498, 4.631182, 0, 0.4588235, 1, 1,
0.2503057, -0.9339846, 4.237471, 0, 0.454902, 1, 1,
0.2521943, 0.7840027, 0.3011735, 0, 0.4470588, 1, 1,
0.2534222, -1.134838, 2.47818, 0, 0.4431373, 1, 1,
0.2544764, -0.6281841, 3.619318, 0, 0.4352941, 1, 1,
0.2585701, 0.3623093, 1.146452, 0, 0.4313726, 1, 1,
0.2623292, 1.864242, 0.1638733, 0, 0.4235294, 1, 1,
0.2646829, 0.2469268, -0.1072587, 0, 0.4196078, 1, 1,
0.2672606, 0.9114437, 0.558983, 0, 0.4117647, 1, 1,
0.2739718, -0.4435077, 2.081423, 0, 0.4078431, 1, 1,
0.2774558, -1.855054, 4.131884, 0, 0.4, 1, 1,
0.2832687, 0.09063165, -0.4572911, 0, 0.3921569, 1, 1,
0.2866403, 1.747043, -1.255855, 0, 0.3882353, 1, 1,
0.2873483, 0.03889354, 1.18867, 0, 0.3803922, 1, 1,
0.2921506, 0.4623299, 1.839504, 0, 0.3764706, 1, 1,
0.2921804, 0.8965096, -0.8073751, 0, 0.3686275, 1, 1,
0.2947588, -0.5338628, 3.457455, 0, 0.3647059, 1, 1,
0.2955501, 1.013757, 1.027235, 0, 0.3568628, 1, 1,
0.3048339, -0.4892824, 2.73664, 0, 0.3529412, 1, 1,
0.3095791, -0.2801968, 2.322467, 0, 0.345098, 1, 1,
0.3116371, 0.5350457, -0.2257878, 0, 0.3411765, 1, 1,
0.3131143, -1.453297, 2.274529, 0, 0.3333333, 1, 1,
0.3162902, -0.8565696, 3.004697, 0, 0.3294118, 1, 1,
0.3175207, -0.3649386, 2.004663, 0, 0.3215686, 1, 1,
0.3215464, -1.356751, 5.652277, 0, 0.3176471, 1, 1,
0.3241116, 1.823373, 0.1229674, 0, 0.3098039, 1, 1,
0.3266237, -1.27641, 3.183829, 0, 0.3058824, 1, 1,
0.3334871, 0.1698677, -0.683659, 0, 0.2980392, 1, 1,
0.3434025, 0.5395982, 0.8656139, 0, 0.2901961, 1, 1,
0.3457593, 0.1728416, 0.8529623, 0, 0.2862745, 1, 1,
0.3474307, 0.8116521, 0.4527771, 0, 0.2784314, 1, 1,
0.3475455, 1.262159, 0.8967879, 0, 0.2745098, 1, 1,
0.3477624, 1.107042, -0.1571192, 0, 0.2666667, 1, 1,
0.3485433, 0.536916, 2.227619, 0, 0.2627451, 1, 1,
0.3491771, 1.184618, 0.2383937, 0, 0.254902, 1, 1,
0.353186, 0.1081199, -0.02968052, 0, 0.2509804, 1, 1,
0.3571377, -0.3286527, 2.626394, 0, 0.2431373, 1, 1,
0.3609571, -0.5449174, 1.727289, 0, 0.2392157, 1, 1,
0.367819, 0.1843902, 1.950548, 0, 0.2313726, 1, 1,
0.3706728, -0.7350172, 2.027841, 0, 0.227451, 1, 1,
0.3709834, 0.4233259, -1.291661, 0, 0.2196078, 1, 1,
0.3738772, -1.366437, 5.029244, 0, 0.2156863, 1, 1,
0.3756702, -0.423624, 3.860627, 0, 0.2078431, 1, 1,
0.3812135, 0.5180762, 1.351892, 0, 0.2039216, 1, 1,
0.3844712, -1.495772, 3.769667, 0, 0.1960784, 1, 1,
0.3867562, 0.3275757, 0.9174796, 0, 0.1882353, 1, 1,
0.3877519, -0.6213109, 2.635378, 0, 0.1843137, 1, 1,
0.3883555, 0.6941395, -0.8100506, 0, 0.1764706, 1, 1,
0.3895257, -0.2786574, 2.053979, 0, 0.172549, 1, 1,
0.3926458, 0.103301, 2.66983, 0, 0.1647059, 1, 1,
0.3951193, 0.4951686, 1.539567, 0, 0.1607843, 1, 1,
0.4011163, 1.155437, 0.3188128, 0, 0.1529412, 1, 1,
0.4016285, 0.133124, 1.617468, 0, 0.1490196, 1, 1,
0.4031372, -1.088307, 2.069306, 0, 0.1411765, 1, 1,
0.4099094, -0.54707, 3.392041, 0, 0.1372549, 1, 1,
0.4151018, -1.432588, 5.580354, 0, 0.1294118, 1, 1,
0.4167743, -1.24404, 2.805163, 0, 0.1254902, 1, 1,
0.4175512, -1.387536, 2.728354, 0, 0.1176471, 1, 1,
0.4179384, 0.2528221, 1.377318, 0, 0.1137255, 1, 1,
0.4180731, -0.5537353, 2.768074, 0, 0.1058824, 1, 1,
0.4218919, 1.316348, -0.4646639, 0, 0.09803922, 1, 1,
0.4239777, -0.0756379, 1.432747, 0, 0.09411765, 1, 1,
0.4244907, 1.5271, 0.6689199, 0, 0.08627451, 1, 1,
0.4314789, 0.02037463, 1.937574, 0, 0.08235294, 1, 1,
0.4344076, 0.6517676, -0.1770198, 0, 0.07450981, 1, 1,
0.4350536, 0.7225153, -1.19712, 0, 0.07058824, 1, 1,
0.4360093, 0.1736355, 1.818381, 0, 0.0627451, 1, 1,
0.4410116, 0.137762, 1.186393, 0, 0.05882353, 1, 1,
0.4417036, 0.8566079, 1.327669, 0, 0.05098039, 1, 1,
0.4445788, 0.009197508, 2.31029, 0, 0.04705882, 1, 1,
0.4458147, 0.4491329, 2.539756, 0, 0.03921569, 1, 1,
0.4483352, -0.9524747, 1.251362, 0, 0.03529412, 1, 1,
0.4596566, 1.773142, 1.03063, 0, 0.02745098, 1, 1,
0.4604108, -0.03803303, 2.791386, 0, 0.02352941, 1, 1,
0.4610038, -0.8525012, 3.298342, 0, 0.01568628, 1, 1,
0.4611717, -0.3790005, 2.671289, 0, 0.01176471, 1, 1,
0.4623365, 1.200705, 0.9288777, 0, 0.003921569, 1, 1,
0.4628496, -0.2904541, 0.9405812, 0.003921569, 0, 1, 1,
0.4653505, 1.184065, 0.5637547, 0.007843138, 0, 1, 1,
0.4653514, 1.973257, 0.7000398, 0.01568628, 0, 1, 1,
0.467023, 0.2701388, 1.026381, 0.01960784, 0, 1, 1,
0.471692, -0.2928167, 2.791421, 0.02745098, 0, 1, 1,
0.4751559, 1.594204, 0.702301, 0.03137255, 0, 1, 1,
0.4792943, -1.531412, 0.9632941, 0.03921569, 0, 1, 1,
0.483117, -0.232325, 2.970106, 0.04313726, 0, 1, 1,
0.4840382, -2.81138, 1.773394, 0.05098039, 0, 1, 1,
0.4850239, 0.7725872, 0.5590388, 0.05490196, 0, 1, 1,
0.4868873, 0.8670849, -1.157509, 0.0627451, 0, 1, 1,
0.4878122, -1.378922, 2.939816, 0.06666667, 0, 1, 1,
0.4881074, 0.08403751, 0.01920741, 0.07450981, 0, 1, 1,
0.4955511, 1.891408, 0.0605772, 0.07843138, 0, 1, 1,
0.4958104, -0.3184923, 2.460443, 0.08627451, 0, 1, 1,
0.4966331, -0.4580926, 2.136094, 0.09019608, 0, 1, 1,
0.4978321, -0.296086, 2.267965, 0.09803922, 0, 1, 1,
0.4980941, 1.332392, -0.3444658, 0.1058824, 0, 1, 1,
0.4996009, 0.5828505, 1.109167, 0.1098039, 0, 1, 1,
0.5106205, -1.123703, 1.029767, 0.1176471, 0, 1, 1,
0.5112661, 0.8746445, 1.591491, 0.1215686, 0, 1, 1,
0.5186475, -0.5666947, 2.021742, 0.1294118, 0, 1, 1,
0.5200862, -0.06670503, 1.15983, 0.1333333, 0, 1, 1,
0.5232162, 1.088278, -1.091921, 0.1411765, 0, 1, 1,
0.543521, -0.7892745, 1.442308, 0.145098, 0, 1, 1,
0.5510636, -1.743267, 5.830739, 0.1529412, 0, 1, 1,
0.5585173, -0.08824179, 1.814265, 0.1568628, 0, 1, 1,
0.5623538, -0.4591258, 2.133571, 0.1647059, 0, 1, 1,
0.5670503, 0.4058885, 2.26488, 0.1686275, 0, 1, 1,
0.5694758, -0.8552722, 2.616479, 0.1764706, 0, 1, 1,
0.5699294, 1.444032, -0.6472136, 0.1803922, 0, 1, 1,
0.5757544, 0.7111759, 0.2996818, 0.1882353, 0, 1, 1,
0.5764485, -0.4030867, 1.157169, 0.1921569, 0, 1, 1,
0.5770444, 1.18356, 2.473782, 0.2, 0, 1, 1,
0.5852632, -0.2716376, 1.960236, 0.2078431, 0, 1, 1,
0.5866969, -0.5539085, 1.368132, 0.2117647, 0, 1, 1,
0.5872442, 0.6280083, 2.500556, 0.2196078, 0, 1, 1,
0.5882015, 1.771683, 0.7798347, 0.2235294, 0, 1, 1,
0.5896311, -0.2854917, 1.552419, 0.2313726, 0, 1, 1,
0.5915318, 0.5372878, 2.339887, 0.2352941, 0, 1, 1,
0.5939182, 0.5338305, 2.472102, 0.2431373, 0, 1, 1,
0.5978584, 0.8909441, 0.02099101, 0.2470588, 0, 1, 1,
0.5978917, 0.4090113, -0.6224858, 0.254902, 0, 1, 1,
0.6010202, 0.8418257, 1.809129, 0.2588235, 0, 1, 1,
0.6078171, -0.610397, 1.43317, 0.2666667, 0, 1, 1,
0.6104015, -0.6351227, 0.3831436, 0.2705882, 0, 1, 1,
0.6120067, 0.1421883, 3.679117, 0.2784314, 0, 1, 1,
0.6244889, -0.9388428, 0.9899148, 0.282353, 0, 1, 1,
0.6267492, -1.099381, 2.562998, 0.2901961, 0, 1, 1,
0.6277554, 0.1552545, 0.03732698, 0.2941177, 0, 1, 1,
0.6279477, -1.167921, 2.710424, 0.3019608, 0, 1, 1,
0.6323227, 1.710825, 2.340825, 0.3098039, 0, 1, 1,
0.6341529, 0.02064408, 2.886631, 0.3137255, 0, 1, 1,
0.6363596, -1.983329, 4.144834, 0.3215686, 0, 1, 1,
0.6365755, -1.304106, 1.2655, 0.3254902, 0, 1, 1,
0.6450006, -0.154511, 3.377655, 0.3333333, 0, 1, 1,
0.6476233, 0.350388, 3.182482, 0.3372549, 0, 1, 1,
0.6514705, 0.3242294, 1.19386, 0.345098, 0, 1, 1,
0.653053, 0.4143697, 1.56472, 0.3490196, 0, 1, 1,
0.6543799, 0.2394017, -0.4237833, 0.3568628, 0, 1, 1,
0.6554123, -0.7296911, 3.096873, 0.3607843, 0, 1, 1,
0.6599767, -0.2918458, 0.9854023, 0.3686275, 0, 1, 1,
0.6654274, 0.5967045, 0.7606497, 0.372549, 0, 1, 1,
0.6654859, -1.177384, 2.756457, 0.3803922, 0, 1, 1,
0.6692948, 0.4690799, 0.6185761, 0.3843137, 0, 1, 1,
0.6720694, -0.2127585, 2.251237, 0.3921569, 0, 1, 1,
0.6753809, -0.9716211, 3.126535, 0.3960784, 0, 1, 1,
0.6759815, 0.7531872, -1.147869, 0.4039216, 0, 1, 1,
0.6813453, -2.818809, 5.568778, 0.4117647, 0, 1, 1,
0.6850207, -0.5958735, 1.688857, 0.4156863, 0, 1, 1,
0.6886763, 0.15008, 1.750516, 0.4235294, 0, 1, 1,
0.6925955, 0.06746596, 1.437108, 0.427451, 0, 1, 1,
0.6930777, -0.5172642, 4.069888, 0.4352941, 0, 1, 1,
0.6980072, 0.6942487, 1.677628, 0.4392157, 0, 1, 1,
0.6980529, 0.3553531, 1.311892, 0.4470588, 0, 1, 1,
0.7018245, 1.528856, 0.8422724, 0.4509804, 0, 1, 1,
0.7092495, 0.905646, 0.5066828, 0.4588235, 0, 1, 1,
0.7099009, 0.3588563, 1.084319, 0.4627451, 0, 1, 1,
0.7118716, -0.9200908, 2.058875, 0.4705882, 0, 1, 1,
0.7139931, -0.00150318, 2.925839, 0.4745098, 0, 1, 1,
0.7145232, -1.521404, 1.501757, 0.4823529, 0, 1, 1,
0.7177581, 0.4348722, 2.922521, 0.4862745, 0, 1, 1,
0.7201296, 0.5953346, -0.05694251, 0.4941176, 0, 1, 1,
0.7272509, -1.971729, 4.309973, 0.5019608, 0, 1, 1,
0.7436417, -0.3869043, 2.947794, 0.5058824, 0, 1, 1,
0.7458792, -0.1376469, 1.934115, 0.5137255, 0, 1, 1,
0.7477648, -0.7211558, 2.14954, 0.5176471, 0, 1, 1,
0.7516023, 0.9052978, 0.6182932, 0.5254902, 0, 1, 1,
0.7533227, -0.2795748, 2.059799, 0.5294118, 0, 1, 1,
0.7569427, 0.1791771, 0.4087859, 0.5372549, 0, 1, 1,
0.7625448, 0.6115562, 2.274827, 0.5411765, 0, 1, 1,
0.7653431, 1.270229, 1.072622, 0.5490196, 0, 1, 1,
0.7702472, 0.06597891, 0.2120521, 0.5529412, 0, 1, 1,
0.7774825, -0.2284876, 2.188005, 0.5607843, 0, 1, 1,
0.7805944, 0.7643179, -0.7474023, 0.5647059, 0, 1, 1,
0.7808874, -0.8634906, 4.148669, 0.572549, 0, 1, 1,
0.78146, 1.394204, 0.5336707, 0.5764706, 0, 1, 1,
0.7871699, 0.6095446, 0.9800991, 0.5843138, 0, 1, 1,
0.7928117, 0.142333, 1.555336, 0.5882353, 0, 1, 1,
0.7933382, 0.3054283, 1.532118, 0.5960785, 0, 1, 1,
0.7947577, 0.1584425, 2.504843, 0.6039216, 0, 1, 1,
0.7951758, 0.1132872, 1.843137, 0.6078432, 0, 1, 1,
0.7953867, -0.2128295, 1.581563, 0.6156863, 0, 1, 1,
0.7956482, 1.566341, -0.1596891, 0.6196079, 0, 1, 1,
0.7968591, -0.3921541, 2.864716, 0.627451, 0, 1, 1,
0.7978557, 1.053067, -0.2452412, 0.6313726, 0, 1, 1,
0.8021238, -0.4992409, 3.619147, 0.6392157, 0, 1, 1,
0.8037198, 0.190344, 2.290622, 0.6431373, 0, 1, 1,
0.8102471, -0.4597694, 1.723297, 0.6509804, 0, 1, 1,
0.8105326, 1.057595, 0.5260742, 0.654902, 0, 1, 1,
0.8121706, -0.3765182, 0.8831031, 0.6627451, 0, 1, 1,
0.8144533, 0.05400982, 1.341288, 0.6666667, 0, 1, 1,
0.8163843, -1.219139, 4.177886, 0.6745098, 0, 1, 1,
0.8205997, -0.5946615, 0.8689333, 0.6784314, 0, 1, 1,
0.8244216, 1.449499, -0.5318962, 0.6862745, 0, 1, 1,
0.8260128, -1.4007, 3.105993, 0.6901961, 0, 1, 1,
0.8291213, -1.295441, 3.771194, 0.6980392, 0, 1, 1,
0.8327555, -1.190715, 1.25662, 0.7058824, 0, 1, 1,
0.8329399, -0.2685736, 2.791879, 0.7098039, 0, 1, 1,
0.8330377, 1.419988, -1.679616, 0.7176471, 0, 1, 1,
0.8345158, 1.533297, 1.166725, 0.7215686, 0, 1, 1,
0.8355502, 0.357617, 0.8979074, 0.7294118, 0, 1, 1,
0.84081, 0.9239813, 1.772354, 0.7333333, 0, 1, 1,
0.842702, -0.01910667, 2.207754, 0.7411765, 0, 1, 1,
0.8429509, -1.213995, 1.17641, 0.7450981, 0, 1, 1,
0.8434447, -0.3507299, 0.5878392, 0.7529412, 0, 1, 1,
0.8466355, -1.714604, 2.52768, 0.7568628, 0, 1, 1,
0.8570538, 0.4014195, -0.6103559, 0.7647059, 0, 1, 1,
0.8572747, 1.091236, 0.8413306, 0.7686275, 0, 1, 1,
0.8604425, -0.729633, 2.090329, 0.7764706, 0, 1, 1,
0.8644258, 1.339772, 0.8207385, 0.7803922, 0, 1, 1,
0.8704998, -1.01742, 2.204366, 0.7882353, 0, 1, 1,
0.8712454, 0.10965, 0.9429684, 0.7921569, 0, 1, 1,
0.8715966, -0.07200389, 0.9795121, 0.8, 0, 1, 1,
0.8723686, -1.739623, 3.180277, 0.8078431, 0, 1, 1,
0.8737034, 1.716067, 0.06660608, 0.8117647, 0, 1, 1,
0.874763, 0.5779989, -0.1328013, 0.8196079, 0, 1, 1,
0.8753107, 0.8591172, -0.2074502, 0.8235294, 0, 1, 1,
0.8787452, 1.849286, -0.3193851, 0.8313726, 0, 1, 1,
0.8794717, -0.8640368, 2.626828, 0.8352941, 0, 1, 1,
0.881614, -0.228094, 2.274373, 0.8431373, 0, 1, 1,
0.8825698, -0.98298, 1.61946, 0.8470588, 0, 1, 1,
0.8840837, -0.7076562, 1.855028, 0.854902, 0, 1, 1,
0.8894714, -0.5910859, 1.10147, 0.8588235, 0, 1, 1,
0.892175, -0.461583, 3.199574, 0.8666667, 0, 1, 1,
0.9042808, -2.836131, 3.043189, 0.8705882, 0, 1, 1,
0.9116033, 0.1208182, 1.808101, 0.8784314, 0, 1, 1,
0.9257355, 1.030768, -0.06291608, 0.8823529, 0, 1, 1,
0.9304686, 0.3893879, 0.06132799, 0.8901961, 0, 1, 1,
0.9413814, -0.609439, 0.9553459, 0.8941177, 0, 1, 1,
0.9466087, -1.56134, 3.513075, 0.9019608, 0, 1, 1,
0.952215, -0.774526, 2.201195, 0.9098039, 0, 1, 1,
0.9539434, 0.1059429, 1.613151, 0.9137255, 0, 1, 1,
0.9581608, 0.3989745, 0.230633, 0.9215686, 0, 1, 1,
0.9587227, 0.7169343, 1.119182, 0.9254902, 0, 1, 1,
0.9592822, 1.131441, -0.3845326, 0.9333333, 0, 1, 1,
0.9604902, -0.5140782, 1.533162, 0.9372549, 0, 1, 1,
0.9646139, -1.763847, 2.236481, 0.945098, 0, 1, 1,
0.9657799, -0.2235817, 2.664541, 0.9490196, 0, 1, 1,
0.9701573, -0.7360551, 2.27936, 0.9568627, 0, 1, 1,
0.9727551, -0.2532502, 0.3393783, 0.9607843, 0, 1, 1,
0.9764404, -0.7470572, 2.063518, 0.9686275, 0, 1, 1,
0.9779304, 0.7469661, -1.655123, 0.972549, 0, 1, 1,
0.9802127, 0.544727, -1.158953, 0.9803922, 0, 1, 1,
0.9817818, -0.2269762, 1.129661, 0.9843137, 0, 1, 1,
0.9820163, 1.401187, 1.137224, 0.9921569, 0, 1, 1,
0.9942702, 0.4305794, 1.942884, 0.9960784, 0, 1, 1,
0.9951978, -0.8078203, 3.483428, 1, 0, 0.9960784, 1,
1.000402, 0.278554, 1.584289, 1, 0, 0.9882353, 1,
1.000682, -0.05763532, 2.491882, 1, 0, 0.9843137, 1,
1.002108, 1.000298, 1.393839, 1, 0, 0.9764706, 1,
1.00321, 1.70698, 0.146352, 1, 0, 0.972549, 1,
1.004676, -0.7736908, 2.381249, 1, 0, 0.9647059, 1,
1.012949, 0.1791984, -0.1184571, 1, 0, 0.9607843, 1,
1.016561, 0.4710722, 0.8796706, 1, 0, 0.9529412, 1,
1.027972, 0.01109335, 0.2146479, 1, 0, 0.9490196, 1,
1.030606, 1.839212, 1.340764, 1, 0, 0.9411765, 1,
1.031099, -0.4515215, 1.847084, 1, 0, 0.9372549, 1,
1.042141, -0.03293414, 0.3267306, 1, 0, 0.9294118, 1,
1.048852, -0.5056457, 2.641438, 1, 0, 0.9254902, 1,
1.072383, 1.046347, 2.2196, 1, 0, 0.9176471, 1,
1.074192, 0.3829714, 0.787577, 1, 0, 0.9137255, 1,
1.086748, -1.093311, 2.813917, 1, 0, 0.9058824, 1,
1.088673, 1.795676, -0.8839567, 1, 0, 0.9019608, 1,
1.103639, -2.414716, 1.545867, 1, 0, 0.8941177, 1,
1.104289, -0.1631241, 2.712206, 1, 0, 0.8862745, 1,
1.109402, -0.1996646, 1.40434, 1, 0, 0.8823529, 1,
1.111551, 1.101267, -0.7096989, 1, 0, 0.8745098, 1,
1.121869, -0.9885377, 1.798445, 1, 0, 0.8705882, 1,
1.122015, 1.745086, 0.1840108, 1, 0, 0.8627451, 1,
1.127782, 1.535628, 0.660633, 1, 0, 0.8588235, 1,
1.130109, -0.134296, 3.292669, 1, 0, 0.8509804, 1,
1.135104, -1.205924, 3.604761, 1, 0, 0.8470588, 1,
1.141127, -1.147982, 0.3640766, 1, 0, 0.8392157, 1,
1.14258, 0.14941, -0.6965209, 1, 0, 0.8352941, 1,
1.142814, -0.6137325, 1.926514, 1, 0, 0.827451, 1,
1.145093, 0.6640024, 0.9316227, 1, 0, 0.8235294, 1,
1.146428, -0.9255285, 1.893063, 1, 0, 0.8156863, 1,
1.148402, -0.6753464, 2.141471, 1, 0, 0.8117647, 1,
1.151518, -0.4908335, 1.829037, 1, 0, 0.8039216, 1,
1.158345, -0.009453507, 2.469563, 1, 0, 0.7960784, 1,
1.170635, -0.2438458, 0.7156342, 1, 0, 0.7921569, 1,
1.179398, 1.014722, 1.471845, 1, 0, 0.7843137, 1,
1.193767, -0.6209373, 2.732282, 1, 0, 0.7803922, 1,
1.198302, 1.587922, 0.3096092, 1, 0, 0.772549, 1,
1.213377, -0.05039468, 1.760166, 1, 0, 0.7686275, 1,
1.213409, -0.7575694, 3.125335, 1, 0, 0.7607843, 1,
1.214386, -1.273342, 2.410512, 1, 0, 0.7568628, 1,
1.214418, 1.075365, 1.798456, 1, 0, 0.7490196, 1,
1.233178, 0.215846, 0.9445407, 1, 0, 0.7450981, 1,
1.238142, -0.1240505, 0.5459426, 1, 0, 0.7372549, 1,
1.244719, -1.704982, 2.71405, 1, 0, 0.7333333, 1,
1.248376, 1.709946, 0.2152399, 1, 0, 0.7254902, 1,
1.24996, -0.9738853, 3.268261, 1, 0, 0.7215686, 1,
1.254085, -1.63163, 1.130857, 1, 0, 0.7137255, 1,
1.260195, 0.04214203, 1.377671, 1, 0, 0.7098039, 1,
1.262816, -0.33645, 1.238049, 1, 0, 0.7019608, 1,
1.265697, 0.5483994, -0.8500213, 1, 0, 0.6941177, 1,
1.266151, -1.252488, 2.165016, 1, 0, 0.6901961, 1,
1.267394, 0.8877786, 1.350263, 1, 0, 0.682353, 1,
1.276292, -0.3305049, 1.020669, 1, 0, 0.6784314, 1,
1.284056, -0.3131706, 1.028345, 1, 0, 0.6705883, 1,
1.289388, 0.9361115, 0.3244738, 1, 0, 0.6666667, 1,
1.291344, -2.514758, 2.832561, 1, 0, 0.6588235, 1,
1.293539, 1.475032, 0.1322847, 1, 0, 0.654902, 1,
1.310513, 0.1047526, 1.445264, 1, 0, 0.6470588, 1,
1.310786, 0.7582208, 0.1467201, 1, 0, 0.6431373, 1,
1.312284, -1.376789, 3.22972, 1, 0, 0.6352941, 1,
1.312465, 1.497286, 1.372158, 1, 0, 0.6313726, 1,
1.316885, -1.773444, 3.944187, 1, 0, 0.6235294, 1,
1.31826, -0.8124561, 3.113542, 1, 0, 0.6196079, 1,
1.321664, -1.152308, 2.042842, 1, 0, 0.6117647, 1,
1.322978, 1.847819, 0.6639332, 1, 0, 0.6078432, 1,
1.331719, -1.672579, 2.286143, 1, 0, 0.6, 1,
1.33266, -0.5947939, 2.812083, 1, 0, 0.5921569, 1,
1.338408, 0.7491894, 0.267954, 1, 0, 0.5882353, 1,
1.340606, 0.7957191, 1.16302, 1, 0, 0.5803922, 1,
1.345631, -0.4327506, 2.913645, 1, 0, 0.5764706, 1,
1.350065, 0.5663556, 0.309769, 1, 0, 0.5686275, 1,
1.354426, -1.2592, 1.698341, 1, 0, 0.5647059, 1,
1.357754, -0.5474273, -0.2229264, 1, 0, 0.5568628, 1,
1.360264, -0.7517319, 2.801954, 1, 0, 0.5529412, 1,
1.364789, -0.826097, 2.676743, 1, 0, 0.5450981, 1,
1.380626, -0.3839155, 3.775443, 1, 0, 0.5411765, 1,
1.382942, -1.328424, 1.24771, 1, 0, 0.5333334, 1,
1.385076, 0.0149251, 0.7222086, 1, 0, 0.5294118, 1,
1.401684, -1.927859, 1.853122, 1, 0, 0.5215687, 1,
1.405938, 0.235535, 2.341068, 1, 0, 0.5176471, 1,
1.406399, -1.523051, 3.132058, 1, 0, 0.509804, 1,
1.40719, -0.6391228, 1.636517, 1, 0, 0.5058824, 1,
1.408218, 0.2588241, 0.4122325, 1, 0, 0.4980392, 1,
1.41131, 0.2524867, 1.040443, 1, 0, 0.4901961, 1,
1.414216, 0.9692389, 0.9080427, 1, 0, 0.4862745, 1,
1.426281, -0.7600523, 3.249014, 1, 0, 0.4784314, 1,
1.427835, 0.1721015, 0.8808019, 1, 0, 0.4745098, 1,
1.433078, 1.135661, -0.8857068, 1, 0, 0.4666667, 1,
1.433716, -1.725243, 2.609506, 1, 0, 0.4627451, 1,
1.442734, 0.04380347, 2.551075, 1, 0, 0.454902, 1,
1.452367, -0.9145808, 2.982726, 1, 0, 0.4509804, 1,
1.456306, 0.6652398, -0.8347366, 1, 0, 0.4431373, 1,
1.465259, 0.1442546, 0.8878443, 1, 0, 0.4392157, 1,
1.469455, 0.9814001, 1.638427, 1, 0, 0.4313726, 1,
1.480505, -0.2193166, 3.73417, 1, 0, 0.427451, 1,
1.489063, 1.210463, 1.967147, 1, 0, 0.4196078, 1,
1.494681, 0.5350066, 1.81561, 1, 0, 0.4156863, 1,
1.505038, -0.5644162, 3.425347, 1, 0, 0.4078431, 1,
1.505583, 0.3038902, 1.416025, 1, 0, 0.4039216, 1,
1.516803, 0.3661697, 2.524791, 1, 0, 0.3960784, 1,
1.517179, 2.13926, 0.08212233, 1, 0, 0.3882353, 1,
1.522213, -1.930724, 3.600965, 1, 0, 0.3843137, 1,
1.522837, 0.3329822, 2.144659, 1, 0, 0.3764706, 1,
1.534304, 1.17445, -0.1456629, 1, 0, 0.372549, 1,
1.537852, 0.05922426, 2.660213, 1, 0, 0.3647059, 1,
1.54298, 0.3178364, 2.686044, 1, 0, 0.3607843, 1,
1.544338, 0.8105909, 0.8568986, 1, 0, 0.3529412, 1,
1.553685, 1.169863, 1.06417, 1, 0, 0.3490196, 1,
1.562582, -0.5634214, 1.527695, 1, 0, 0.3411765, 1,
1.575461, -1.533898, 1.952118, 1, 0, 0.3372549, 1,
1.588832, 0.9219465, 2.05198, 1, 0, 0.3294118, 1,
1.591427, 0.2009699, 1.797027, 1, 0, 0.3254902, 1,
1.637862, 1.517953, -0.3817547, 1, 0, 0.3176471, 1,
1.647303, 0.8649613, 1.423881, 1, 0, 0.3137255, 1,
1.652035, 0.7724836, 0.6349168, 1, 0, 0.3058824, 1,
1.657814, 0.3279322, 0.3680878, 1, 0, 0.2980392, 1,
1.667954, 0.8410559, 0.08003822, 1, 0, 0.2941177, 1,
1.676008, 1.181162, -0.1530078, 1, 0, 0.2862745, 1,
1.682034, 0.4753675, 2.680455, 1, 0, 0.282353, 1,
1.703265, -0.1743966, 1.934732, 1, 0, 0.2745098, 1,
1.704715, 1.816665, 2.63655, 1, 0, 0.2705882, 1,
1.717072, 0.1649301, 1.903769, 1, 0, 0.2627451, 1,
1.736937, 0.760096, 3.212117, 1, 0, 0.2588235, 1,
1.739465, 0.6352712, 0.8438443, 1, 0, 0.2509804, 1,
1.741117, 0.6380179, 0.2550157, 1, 0, 0.2470588, 1,
1.741338, 0.1878688, 3.069909, 1, 0, 0.2392157, 1,
1.772476, -0.8302723, 3.946933, 1, 0, 0.2352941, 1,
1.786501, -0.4890321, 2.487956, 1, 0, 0.227451, 1,
1.803439, -0.08363363, 1.762347, 1, 0, 0.2235294, 1,
1.822173, 0.4913698, 0.893371, 1, 0, 0.2156863, 1,
1.839946, 0.3362788, 1.796119, 1, 0, 0.2117647, 1,
1.846931, -0.5043956, 1.394327, 1, 0, 0.2039216, 1,
1.851073, 0.6238487, 1.670744, 1, 0, 0.1960784, 1,
1.852962, 1.207946, -0.2144835, 1, 0, 0.1921569, 1,
1.855677, -0.249498, 1.631569, 1, 0, 0.1843137, 1,
1.890004, 0.03071492, 0.2635024, 1, 0, 0.1803922, 1,
1.908864, 0.495234, 4.532167, 1, 0, 0.172549, 1,
1.909196, 0.00539509, 1.471498, 1, 0, 0.1686275, 1,
1.925313, 0.3768494, 3.111489, 1, 0, 0.1607843, 1,
1.928011, -0.8558761, 0.3662561, 1, 0, 0.1568628, 1,
1.933484, 0.2230084, 2.660024, 1, 0, 0.1490196, 1,
1.967628, 0.07629693, 1.702223, 1, 0, 0.145098, 1,
1.969322, -2.172024, 1.808115, 1, 0, 0.1372549, 1,
1.980727, -0.528253, 0.1934385, 1, 0, 0.1333333, 1,
1.990597, -0.4110071, 1.582755, 1, 0, 0.1254902, 1,
2.002196, 1.204197, 0.7834312, 1, 0, 0.1215686, 1,
2.033824, -0.1441141, 1.889797, 1, 0, 0.1137255, 1,
2.050513, 0.5014657, 2.249843, 1, 0, 0.1098039, 1,
2.066508, 0.4223913, 3.776226, 1, 0, 0.1019608, 1,
2.116809, 1.736455, 0.966056, 1, 0, 0.09411765, 1,
2.134783, -1.152955, 2.774407, 1, 0, 0.09019608, 1,
2.161764, -0.159898, 1.943245, 1, 0, 0.08235294, 1,
2.185335, 0.1383794, 3.647289, 1, 0, 0.07843138, 1,
2.185776, 0.609474, 0.7469045, 1, 0, 0.07058824, 1,
2.273774, -0.6620284, 0.6455509, 1, 0, 0.06666667, 1,
2.312863, 1.478658, -0.5961607, 1, 0, 0.05882353, 1,
2.371249, -1.414231, 3.634872, 1, 0, 0.05490196, 1,
2.406336, -0.2340287, 2.402281, 1, 0, 0.04705882, 1,
2.452531, -0.8707396, 1.951922, 1, 0, 0.04313726, 1,
2.668998, -1.399871, 3.120621, 1, 0, 0.03529412, 1,
2.802371, 1.053757, 0.056761, 1, 0, 0.03137255, 1,
2.948797, -0.4426073, 2.799037, 1, 0, 0.02352941, 1,
3.493673, 1.737084, -0.7150815, 1, 0, 0.01960784, 1,
3.785962, -0.4003918, 1.363705, 1, 0, 0.01176471, 1,
3.889574, 0.5421289, 2.973078, 1, 0, 0.007843138, 1
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
0.6298935, -3.793369, -7.411398, 0, -0.5, 0.5, 0.5,
0.6298935, -3.793369, -7.411398, 1, -0.5, 0.5, 0.5,
0.6298935, -3.793369, -7.411398, 1, 1.5, 0.5, 0.5,
0.6298935, -3.793369, -7.411398, 0, 1.5, 0.5, 0.5
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
-3.734819, -0.01241899, -7.411398, 0, -0.5, 0.5, 0.5,
-3.734819, -0.01241899, -7.411398, 1, -0.5, 0.5, 0.5,
-3.734819, -0.01241899, -7.411398, 1, 1.5, 0.5, 0.5,
-3.734819, -0.01241899, -7.411398, 0, 1.5, 0.5, 0.5
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
-3.734819, -3.793369, 0.169287, 0, -0.5, 0.5, 0.5,
-3.734819, -3.793369, 0.169287, 1, -0.5, 0.5, 0.5,
-3.734819, -3.793369, 0.169287, 1, 1.5, 0.5, 0.5,
-3.734819, -3.793369, 0.169287, 0, 1.5, 0.5, 0.5
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
-2, -2.920842, -5.662009,
3, -2.920842, -5.662009,
-2, -2.920842, -5.662009,
-2, -3.066263, -5.953574,
-1, -2.920842, -5.662009,
-1, -3.066263, -5.953574,
0, -2.920842, -5.662009,
0, -3.066263, -5.953574,
1, -2.920842, -5.662009,
1, -3.066263, -5.953574,
2, -2.920842, -5.662009,
2, -3.066263, -5.953574,
3, -2.920842, -5.662009,
3, -3.066263, -5.953574
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
-2, -3.357106, -6.536704, 0, -0.5, 0.5, 0.5,
-2, -3.357106, -6.536704, 1, -0.5, 0.5, 0.5,
-2, -3.357106, -6.536704, 1, 1.5, 0.5, 0.5,
-2, -3.357106, -6.536704, 0, 1.5, 0.5, 0.5,
-1, -3.357106, -6.536704, 0, -0.5, 0.5, 0.5,
-1, -3.357106, -6.536704, 1, -0.5, 0.5, 0.5,
-1, -3.357106, -6.536704, 1, 1.5, 0.5, 0.5,
-1, -3.357106, -6.536704, 0, 1.5, 0.5, 0.5,
0, -3.357106, -6.536704, 0, -0.5, 0.5, 0.5,
0, -3.357106, -6.536704, 1, -0.5, 0.5, 0.5,
0, -3.357106, -6.536704, 1, 1.5, 0.5, 0.5,
0, -3.357106, -6.536704, 0, 1.5, 0.5, 0.5,
1, -3.357106, -6.536704, 0, -0.5, 0.5, 0.5,
1, -3.357106, -6.536704, 1, -0.5, 0.5, 0.5,
1, -3.357106, -6.536704, 1, 1.5, 0.5, 0.5,
1, -3.357106, -6.536704, 0, 1.5, 0.5, 0.5,
2, -3.357106, -6.536704, 0, -0.5, 0.5, 0.5,
2, -3.357106, -6.536704, 1, -0.5, 0.5, 0.5,
2, -3.357106, -6.536704, 1, 1.5, 0.5, 0.5,
2, -3.357106, -6.536704, 0, 1.5, 0.5, 0.5,
3, -3.357106, -6.536704, 0, -0.5, 0.5, 0.5,
3, -3.357106, -6.536704, 1, -0.5, 0.5, 0.5,
3, -3.357106, -6.536704, 1, 1.5, 0.5, 0.5,
3, -3.357106, -6.536704, 0, 1.5, 0.5, 0.5
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
-2.727577, -2, -5.662009,
-2.727577, 2, -5.662009,
-2.727577, -2, -5.662009,
-2.895451, -2, -5.953574,
-2.727577, -1, -5.662009,
-2.895451, -1, -5.953574,
-2.727577, 0, -5.662009,
-2.895451, 0, -5.953574,
-2.727577, 1, -5.662009,
-2.895451, 1, -5.953574,
-2.727577, 2, -5.662009,
-2.895451, 2, -5.953574
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
-3.231198, -2, -6.536704, 0, -0.5, 0.5, 0.5,
-3.231198, -2, -6.536704, 1, -0.5, 0.5, 0.5,
-3.231198, -2, -6.536704, 1, 1.5, 0.5, 0.5,
-3.231198, -2, -6.536704, 0, 1.5, 0.5, 0.5,
-3.231198, -1, -6.536704, 0, -0.5, 0.5, 0.5,
-3.231198, -1, -6.536704, 1, -0.5, 0.5, 0.5,
-3.231198, -1, -6.536704, 1, 1.5, 0.5, 0.5,
-3.231198, -1, -6.536704, 0, 1.5, 0.5, 0.5,
-3.231198, 0, -6.536704, 0, -0.5, 0.5, 0.5,
-3.231198, 0, -6.536704, 1, -0.5, 0.5, 0.5,
-3.231198, 0, -6.536704, 1, 1.5, 0.5, 0.5,
-3.231198, 0, -6.536704, 0, 1.5, 0.5, 0.5,
-3.231198, 1, -6.536704, 0, -0.5, 0.5, 0.5,
-3.231198, 1, -6.536704, 1, -0.5, 0.5, 0.5,
-3.231198, 1, -6.536704, 1, 1.5, 0.5, 0.5,
-3.231198, 1, -6.536704, 0, 1.5, 0.5, 0.5,
-3.231198, 2, -6.536704, 0, -0.5, 0.5, 0.5,
-3.231198, 2, -6.536704, 1, -0.5, 0.5, 0.5,
-3.231198, 2, -6.536704, 1, 1.5, 0.5, 0.5,
-3.231198, 2, -6.536704, 0, 1.5, 0.5, 0.5
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
-2.727577, -2.920842, -4,
-2.727577, -2.920842, 4,
-2.727577, -2.920842, -4,
-2.895451, -3.066263, -4,
-2.727577, -2.920842, -2,
-2.895451, -3.066263, -2,
-2.727577, -2.920842, 0,
-2.895451, -3.066263, 0,
-2.727577, -2.920842, 2,
-2.895451, -3.066263, 2,
-2.727577, -2.920842, 4,
-2.895451, -3.066263, 4
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
-3.231198, -3.357106, -4, 0, -0.5, 0.5, 0.5,
-3.231198, -3.357106, -4, 1, -0.5, 0.5, 0.5,
-3.231198, -3.357106, -4, 1, 1.5, 0.5, 0.5,
-3.231198, -3.357106, -4, 0, 1.5, 0.5, 0.5,
-3.231198, -3.357106, -2, 0, -0.5, 0.5, 0.5,
-3.231198, -3.357106, -2, 1, -0.5, 0.5, 0.5,
-3.231198, -3.357106, -2, 1, 1.5, 0.5, 0.5,
-3.231198, -3.357106, -2, 0, 1.5, 0.5, 0.5,
-3.231198, -3.357106, 0, 0, -0.5, 0.5, 0.5,
-3.231198, -3.357106, 0, 1, -0.5, 0.5, 0.5,
-3.231198, -3.357106, 0, 1, 1.5, 0.5, 0.5,
-3.231198, -3.357106, 0, 0, 1.5, 0.5, 0.5,
-3.231198, -3.357106, 2, 0, -0.5, 0.5, 0.5,
-3.231198, -3.357106, 2, 1, -0.5, 0.5, 0.5,
-3.231198, -3.357106, 2, 1, 1.5, 0.5, 0.5,
-3.231198, -3.357106, 2, 0, 1.5, 0.5, 0.5,
-3.231198, -3.357106, 4, 0, -0.5, 0.5, 0.5,
-3.231198, -3.357106, 4, 1, -0.5, 0.5, 0.5,
-3.231198, -3.357106, 4, 1, 1.5, 0.5, 0.5,
-3.231198, -3.357106, 4, 0, 1.5, 0.5, 0.5
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
-2.727577, -2.920842, -5.662009,
-2.727577, 2.896004, -5.662009,
-2.727577, -2.920842, 6.000583,
-2.727577, 2.896004, 6.000583,
-2.727577, -2.920842, -5.662009,
-2.727577, -2.920842, 6.000583,
-2.727577, 2.896004, -5.662009,
-2.727577, 2.896004, 6.000583,
-2.727577, -2.920842, -5.662009,
3.987365, -2.920842, -5.662009,
-2.727577, -2.920842, 6.000583,
3.987365, -2.920842, 6.000583,
-2.727577, 2.896004, -5.662009,
3.987365, 2.896004, -5.662009,
-2.727577, 2.896004, 6.000583,
3.987365, 2.896004, 6.000583,
3.987365, -2.920842, -5.662009,
3.987365, 2.896004, -5.662009,
3.987365, -2.920842, 6.000583,
3.987365, 2.896004, 6.000583,
3.987365, -2.920842, -5.662009,
3.987365, -2.920842, 6.000583,
3.987365, 2.896004, -5.662009,
3.987365, 2.896004, 6.000583
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
var radius = 7.82864;
var distance = 34.8305;
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
mvMatrix.translate( -0.6298935, 0.01241899, -0.169287 );
mvMatrix.scale( 1.260544, 1.455166, 0.7257802 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.8305);
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
MEP<-read.table("MEP.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-MEP$V2
```

```
## Error in eval(expr, envir, enclos): object 'MEP' not found
```

```r
y<-MEP$V3
```

```
## Error in eval(expr, envir, enclos): object 'MEP' not found
```

```r
z<-MEP$V4
```

```
## Error in eval(expr, envir, enclos): object 'MEP' not found
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
-2.629787, -0.7255433, -3.201396, 0, 0, 1, 1, 1,
-2.577345, 2.287128, -1.021995, 1, 0, 0, 1, 1,
-2.57714, 0.2739637, -1.594849, 1, 0, 0, 1, 1,
-2.492505, -0.5877051, -2.212379, 1, 0, 0, 1, 1,
-2.443464, -1.934114, -1.409675, 1, 0, 0, 1, 1,
-2.436341, 0.9441932, -1.817693, 1, 0, 0, 1, 1,
-2.432269, 1.274704, -0.4999651, 0, 0, 0, 1, 1,
-2.41359, 0.1801396, -0.5683182, 0, 0, 0, 1, 1,
-2.362864, -0.09691058, -1.250847, 0, 0, 0, 1, 1,
-2.362735, 0.8107674, 0.218637, 0, 0, 0, 1, 1,
-2.328863, -0.1481933, -1.520379, 0, 0, 0, 1, 1,
-2.328685, 0.3786703, -2.058444, 0, 0, 0, 1, 1,
-2.286788, -0.7306883, -1.08493, 0, 0, 0, 1, 1,
-2.246991, -0.9867913, -3.363958, 1, 1, 1, 1, 1,
-2.211147, 0.1258292, -2.022745, 1, 1, 1, 1, 1,
-2.201639, 1.213918, -1.778992, 1, 1, 1, 1, 1,
-2.176442, 1.205216, -1.055264, 1, 1, 1, 1, 1,
-2.130404, -0.2484252, 0.3298348, 1, 1, 1, 1, 1,
-2.126651, 0.5956904, -0.07701615, 1, 1, 1, 1, 1,
-2.113205, 1.184195, -1.453416, 1, 1, 1, 1, 1,
-2.100481, -0.1752609, -1.789194, 1, 1, 1, 1, 1,
-2.060356, 0.3683125, -0.966813, 1, 1, 1, 1, 1,
-2.017541, -0.8917137, -3.147713, 1, 1, 1, 1, 1,
-1.969969, -1.473471, -1.72464, 1, 1, 1, 1, 1,
-1.961226, 0.8352392, -0.2397822, 1, 1, 1, 1, 1,
-1.950696, 0.1753502, -3.154586, 1, 1, 1, 1, 1,
-1.933315, -0.2375935, -0.4112092, 1, 1, 1, 1, 1,
-1.895613, 2.295682, 0.8049077, 1, 1, 1, 1, 1,
-1.891547, -0.6991836, -1.47644, 0, 0, 1, 1, 1,
-1.880512, -0.3107325, -0.9356816, 1, 0, 0, 1, 1,
-1.859379, -0.534736, -2.952008, 1, 0, 0, 1, 1,
-1.851321, 0.1703932, -1.49228, 1, 0, 0, 1, 1,
-1.850907, 2.380627, -0.8568963, 1, 0, 0, 1, 1,
-1.844751, 0.4374858, -0.686694, 1, 0, 0, 1, 1,
-1.838277, 0.7299929, -1.535726, 0, 0, 0, 1, 1,
-1.837848, 2.042449, -1.079313, 0, 0, 0, 1, 1,
-1.829532, -1.458636, -2.201867, 0, 0, 0, 1, 1,
-1.803907, -0.4444212, -2.412614, 0, 0, 0, 1, 1,
-1.765052, 1.550637, 0.2544014, 0, 0, 0, 1, 1,
-1.76164, 0.9509007, -1.415431, 0, 0, 0, 1, 1,
-1.755101, 1.705894, -0.8635109, 0, 0, 0, 1, 1,
-1.754399, -0.1707832, -2.540065, 1, 1, 1, 1, 1,
-1.74344, -0.08664751, -1.650302, 1, 1, 1, 1, 1,
-1.720888, 0.07088705, -1.431869, 1, 1, 1, 1, 1,
-1.715273, -1.090251, -2.216784, 1, 1, 1, 1, 1,
-1.701286, 0.2068876, -2.166658, 1, 1, 1, 1, 1,
-1.687422, 0.03946528, -1.747034, 1, 1, 1, 1, 1,
-1.674222, -0.4956418, -1.587195, 1, 1, 1, 1, 1,
-1.665133, -1.211104, -0.5651827, 1, 1, 1, 1, 1,
-1.664492, 0.2496039, -2.197847, 1, 1, 1, 1, 1,
-1.63741, -0.8269995, -1.405375, 1, 1, 1, 1, 1,
-1.627722, -0.6380553, -0.7967576, 1, 1, 1, 1, 1,
-1.623976, -0.3949299, -0.2652613, 1, 1, 1, 1, 1,
-1.620779, 0.2646935, -0.9285607, 1, 1, 1, 1, 1,
-1.610175, -0.5114765, -2.559559, 1, 1, 1, 1, 1,
-1.607211, -0.5818654, -0.872779, 1, 1, 1, 1, 1,
-1.596306, 0.6945441, -1.653428, 0, 0, 1, 1, 1,
-1.591171, -0.6885911, -0.8361945, 1, 0, 0, 1, 1,
-1.589831, 0.2876924, -2.19219, 1, 0, 0, 1, 1,
-1.579114, 0.3487781, -3.848695, 1, 0, 0, 1, 1,
-1.576168, 0.3910447, -1.926624, 1, 0, 0, 1, 1,
-1.553175, -0.5984049, -1.144092, 1, 0, 0, 1, 1,
-1.521894, 1.493174, -1.276924, 0, 0, 0, 1, 1,
-1.509141, -0.8281645, -0.421701, 0, 0, 0, 1, 1,
-1.507485, 0.2205092, -0.9860438, 0, 0, 0, 1, 1,
-1.502499, -0.6431022, -1.654525, 0, 0, 0, 1, 1,
-1.499604, -0.5696003, -4.116708, 0, 0, 0, 1, 1,
-1.492048, -0.477827, -1.775237, 0, 0, 0, 1, 1,
-1.477082, -1.76774, -1.393079, 0, 0, 0, 1, 1,
-1.476408, -2.088358, -2.556201, 1, 1, 1, 1, 1,
-1.468596, 0.5689821, -0.3225848, 1, 1, 1, 1, 1,
-1.463125, 1.276076, -1.407186, 1, 1, 1, 1, 1,
-1.460657, -0.4635925, -3.525802, 1, 1, 1, 1, 1,
-1.459985, -1.338645, -2.524087, 1, 1, 1, 1, 1,
-1.459326, 0.1613526, -1.63665, 1, 1, 1, 1, 1,
-1.456635, 0.3484556, -2.90031, 1, 1, 1, 1, 1,
-1.454862, 0.4256712, -0.7984915, 1, 1, 1, 1, 1,
-1.441135, -0.5464365, -1.232135, 1, 1, 1, 1, 1,
-1.439311, 0.4574747, -1.341949, 1, 1, 1, 1, 1,
-1.436373, -1.047692, -2.180562, 1, 1, 1, 1, 1,
-1.435573, 0.2110503, -1.295946, 1, 1, 1, 1, 1,
-1.435033, 1.634448, 0.5684497, 1, 1, 1, 1, 1,
-1.428387, -0.4087731, -0.5868499, 1, 1, 1, 1, 1,
-1.420008, 1.918308, 0.4917465, 1, 1, 1, 1, 1,
-1.418612, -0.3225075, -2.376435, 0, 0, 1, 1, 1,
-1.416425, -0.723369, -0.9592839, 1, 0, 0, 1, 1,
-1.410779, 0.5653727, 0.8944483, 1, 0, 0, 1, 1,
-1.394106, -1.316348, -2.673182, 1, 0, 0, 1, 1,
-1.391415, 0.3640157, -0.9857029, 1, 0, 0, 1, 1,
-1.388821, 0.398595, -3.206701, 1, 0, 0, 1, 1,
-1.382577, -1.222742, -1.310435, 0, 0, 0, 1, 1,
-1.367552, -0.266758, -2.272293, 0, 0, 0, 1, 1,
-1.364675, 1.010495, -0.5794926, 0, 0, 0, 1, 1,
-1.355826, -1.422408, -4.143567, 0, 0, 0, 1, 1,
-1.341401, 1.384267, -0.9125258, 0, 0, 0, 1, 1,
-1.327885, 1.704326, 0.4029892, 0, 0, 0, 1, 1,
-1.32483, 0.9374765, -0.02194145, 0, 0, 0, 1, 1,
-1.323345, 0.7040118, -0.3961458, 1, 1, 1, 1, 1,
-1.318004, 0.3529417, -0.3400143, 1, 1, 1, 1, 1,
-1.315508, -1.921259, -3.225809, 1, 1, 1, 1, 1,
-1.312831, -0.4736551, -1.63607, 1, 1, 1, 1, 1,
-1.307052, 0.8521349, -1.897079, 1, 1, 1, 1, 1,
-1.305933, -0.04183766, 0.2226999, 1, 1, 1, 1, 1,
-1.299858, 1.592161, -2.375213, 1, 1, 1, 1, 1,
-1.297354, -0.4302819, -0.9018146, 1, 1, 1, 1, 1,
-1.28039, -1.190373, -2.542847, 1, 1, 1, 1, 1,
-1.270759, 1.955005, -0.9221275, 1, 1, 1, 1, 1,
-1.262251, -0.5625237, -2.074128, 1, 1, 1, 1, 1,
-1.261361, 0.2989807, -0.9224151, 1, 1, 1, 1, 1,
-1.258889, -1.546442, -1.763726, 1, 1, 1, 1, 1,
-1.251232, -1.458875, -1.182769, 1, 1, 1, 1, 1,
-1.248662, -1.994209, -4.777728, 1, 1, 1, 1, 1,
-1.241608, 0.6098297, -0.5667883, 0, 0, 1, 1, 1,
-1.240702, -0.1474407, -0.2881734, 1, 0, 0, 1, 1,
-1.240315, -1.616149, -1.552318, 1, 0, 0, 1, 1,
-1.23395, -0.6617419, -1.536716, 1, 0, 0, 1, 1,
-1.232027, 0.5919241, -1.068232, 1, 0, 0, 1, 1,
-1.226224, 0.1830814, -3.277204, 1, 0, 0, 1, 1,
-1.207849, 0.2067143, -1.69679, 0, 0, 0, 1, 1,
-1.20667, 0.7825475, -1.928961, 0, 0, 0, 1, 1,
-1.199579, -1.02159, -2.156187, 0, 0, 0, 1, 1,
-1.192734, -0.1907499, -2.245091, 0, 0, 0, 1, 1,
-1.190146, 1.020267, 0.7318757, 0, 0, 0, 1, 1,
-1.190043, -0.1551555, -3.185625, 0, 0, 0, 1, 1,
-1.186303, 0.7044846, -1.191211, 0, 0, 0, 1, 1,
-1.178849, -1.619937, -1.790041, 1, 1, 1, 1, 1,
-1.176062, 0.1947345, -0.6922458, 1, 1, 1, 1, 1,
-1.174184, -0.9768899, 0.02604123, 1, 1, 1, 1, 1,
-1.172131, 0.4914018, -1.427589, 1, 1, 1, 1, 1,
-1.16967, 0.4551551, -2.034071, 1, 1, 1, 1, 1,
-1.164464, -0.6728166, -4.069764, 1, 1, 1, 1, 1,
-1.156792, 1.979781, -1.523739, 1, 1, 1, 1, 1,
-1.14339, 0.3407589, 0.4541776, 1, 1, 1, 1, 1,
-1.1428, -0.7034547, -0.5760794, 1, 1, 1, 1, 1,
-1.142103, -2.387519, -2.032367, 1, 1, 1, 1, 1,
-1.139636, 0.4696459, 0.8022251, 1, 1, 1, 1, 1,
-1.138424, 0.3673239, -1.826152, 1, 1, 1, 1, 1,
-1.133649, -0.6444116, -1.720327, 1, 1, 1, 1, 1,
-1.132897, -0.7257202, -1.405762, 1, 1, 1, 1, 1,
-1.125354, 0.3522557, -2.050018, 1, 1, 1, 1, 1,
-1.123813, 0.1647054, -1.159849, 0, 0, 1, 1, 1,
-1.105719, -0.3632239, -1.939039, 1, 0, 0, 1, 1,
-1.097208, 0.2946337, -1.838453, 1, 0, 0, 1, 1,
-1.094893, 0.2345119, -3.158583, 1, 0, 0, 1, 1,
-1.091283, 1.137198, -0.6566319, 1, 0, 0, 1, 1,
-1.083631, 0.6318374, 0.09134996, 1, 0, 0, 1, 1,
-1.083411, -1.144132, -1.426044, 0, 0, 0, 1, 1,
-1.063363, -0.2949461, -3.673482, 0, 0, 0, 1, 1,
-1.057619, 0.05989015, -2.983028, 0, 0, 0, 1, 1,
-1.051083, 0.110184, -1.238302, 0, 0, 0, 1, 1,
-1.048539, 0.7917809, 1.231102, 0, 0, 0, 1, 1,
-1.04796, 0.3332888, -3.582603, 0, 0, 0, 1, 1,
-1.042607, -1.116846, -2.67047, 0, 0, 0, 1, 1,
-1.042507, 0.6446393, -1.115296, 1, 1, 1, 1, 1,
-1.042184, -0.2854808, -3.087957, 1, 1, 1, 1, 1,
-1.040326, -0.2243326, -1.488765, 1, 1, 1, 1, 1,
-1.039468, 0.01204812, 0.3610148, 1, 1, 1, 1, 1,
-1.029879, 0.626176, -0.4294543, 1, 1, 1, 1, 1,
-1.029622, 0.7119396, -2.25543, 1, 1, 1, 1, 1,
-1.027689, -0.5005294, -2.980174, 1, 1, 1, 1, 1,
-1.026224, 0.2295787, -1.731543, 1, 1, 1, 1, 1,
-1.023219, -0.2382114, -3.394213, 1, 1, 1, 1, 1,
-1.015727, 0.3838351, -0.1778868, 1, 1, 1, 1, 1,
-1.013781, -0.4485174, -1.331048, 1, 1, 1, 1, 1,
-1.010826, 0.3016549, -0.583962, 1, 1, 1, 1, 1,
-1.009532, 0.7022947, -1.130931, 1, 1, 1, 1, 1,
-1.007508, 0.871567, -0.4464615, 1, 1, 1, 1, 1,
-0.9980199, -0.6822006, -0.5338784, 1, 1, 1, 1, 1,
-0.9942979, -0.04858259, -1.143629, 0, 0, 1, 1, 1,
-0.9908355, -0.4179071, -3.341749, 1, 0, 0, 1, 1,
-0.9896246, 0.8074337, -0.09953512, 1, 0, 0, 1, 1,
-0.9856924, 0.5361772, -2.156212, 1, 0, 0, 1, 1,
-0.9852275, 0.9728877, -0.3630011, 1, 0, 0, 1, 1,
-0.985077, -0.6582727, -2.43681, 1, 0, 0, 1, 1,
-0.9838706, 0.6335289, -1.015533, 0, 0, 0, 1, 1,
-0.9820783, 1.309464, -0.3690475, 0, 0, 0, 1, 1,
-0.9794506, -0.859789, -2.501198, 0, 0, 0, 1, 1,
-0.9764006, -0.8675204, -0.5811136, 0, 0, 0, 1, 1,
-0.9756138, -0.5943078, -2.034503, 0, 0, 0, 1, 1,
-0.9716865, -0.6351187, -1.939453, 0, 0, 0, 1, 1,
-0.9664765, -0.3633549, -0.0537522, 0, 0, 0, 1, 1,
-0.9626551, -1.10995, -3.280389, 1, 1, 1, 1, 1,
-0.9608306, 0.2692787, -0.1862189, 1, 1, 1, 1, 1,
-0.9513017, -0.1658819, -1.761765, 1, 1, 1, 1, 1,
-0.9388328, -0.7931327, -1.730422, 1, 1, 1, 1, 1,
-0.9335179, -0.5426292, -2.515152, 1, 1, 1, 1, 1,
-0.9258514, -2.498409, -3.867157, 1, 1, 1, 1, 1,
-0.9194196, -0.5124954, -2.578394, 1, 1, 1, 1, 1,
-0.9132494, 0.02456708, -1.723585, 1, 1, 1, 1, 1,
-0.9116552, -0.09222887, -1.381263, 1, 1, 1, 1, 1,
-0.911121, 0.9074277, -2.632015, 1, 1, 1, 1, 1,
-0.8999934, -0.3687616, -0.7715213, 1, 1, 1, 1, 1,
-0.8974015, 0.3864551, 0.5909882, 1, 1, 1, 1, 1,
-0.8902643, 0.8209815, -0.9796706, 1, 1, 1, 1, 1,
-0.8872282, -0.02781906, -2.547851, 1, 1, 1, 1, 1,
-0.883285, 1.323224, -1.74422, 1, 1, 1, 1, 1,
-0.8638322, -0.02470663, -2.348303, 0, 0, 1, 1, 1,
-0.8615776, -0.4033027, -3.165034, 1, 0, 0, 1, 1,
-0.858095, 1.475959, -0.3529656, 1, 0, 0, 1, 1,
-0.8577271, -0.06571765, -2.051629, 1, 0, 0, 1, 1,
-0.8470498, 0.5470657, -0.7424152, 1, 0, 0, 1, 1,
-0.8449163, -0.5237946, -0.04618522, 1, 0, 0, 1, 1,
-0.8393813, 0.2411546, -2.3143, 0, 0, 0, 1, 1,
-0.836603, 0.9874603, -0.7787251, 0, 0, 0, 1, 1,
-0.8353834, -0.7888034, -2.292742, 0, 0, 0, 1, 1,
-0.8296807, 0.841095, -2.655836, 0, 0, 0, 1, 1,
-0.8265606, 0.3815951, -1.305638, 0, 0, 0, 1, 1,
-0.8241397, 0.04023013, -3.310834, 0, 0, 0, 1, 1,
-0.8236366, -0.1377035, -3.880837, 0, 0, 0, 1, 1,
-0.8226342, 0.8161258, 0.1512918, 1, 1, 1, 1, 1,
-0.8225141, -0.1324231, -2.806498, 1, 1, 1, 1, 1,
-0.8172499, -1.5367, -3.405317, 1, 1, 1, 1, 1,
-0.8169612, -1.395148, -1.56145, 1, 1, 1, 1, 1,
-0.816541, 0.1913707, -1.30496, 1, 1, 1, 1, 1,
-0.8093969, 0.689613, -1.256686, 1, 1, 1, 1, 1,
-0.8047327, -0.2392938, -2.212278, 1, 1, 1, 1, 1,
-0.8033907, -1.91955, -2.800957, 1, 1, 1, 1, 1,
-0.8002925, 1.136967, -0.1051741, 1, 1, 1, 1, 1,
-0.7947702, -0.7062798, -2.111994, 1, 1, 1, 1, 1,
-0.7942708, 0.8310258, -0.9180542, 1, 1, 1, 1, 1,
-0.7851226, -0.2742243, -2.326149, 1, 1, 1, 1, 1,
-0.7754399, 0.1290037, -1.313177, 1, 1, 1, 1, 1,
-0.7751321, 0.3892938, -0.8204199, 1, 1, 1, 1, 1,
-0.7687221, -0.2106739, -1.727633, 1, 1, 1, 1, 1,
-0.7670598, -1.067836, -2.164174, 0, 0, 1, 1, 1,
-0.766886, -0.3501751, -2.743634, 1, 0, 0, 1, 1,
-0.7579186, -2.296499, -1.879044, 1, 0, 0, 1, 1,
-0.7533592, -0.6838086, -1.076786, 1, 0, 0, 1, 1,
-0.7516826, 0.7205602, 0.36669, 1, 0, 0, 1, 1,
-0.745739, 0.1719281, -2.080517, 1, 0, 0, 1, 1,
-0.7387456, 1.560833, -0.2435995, 0, 0, 0, 1, 1,
-0.7379219, -1.36564, -4.064539, 0, 0, 0, 1, 1,
-0.7363728, -0.1536009, -1.881166, 0, 0, 0, 1, 1,
-0.7352636, -0.04321108, -1.046164, 0, 0, 0, 1, 1,
-0.7328298, 0.07966886, -1.215564, 0, 0, 0, 1, 1,
-0.7316113, -1.5937, -3.886597, 0, 0, 0, 1, 1,
-0.7291481, -0.3470449, -1.693709, 0, 0, 0, 1, 1,
-0.7283193, 0.356218, -0.7435158, 1, 1, 1, 1, 1,
-0.7249928, -1.103038, -1.735523, 1, 1, 1, 1, 1,
-0.7247836, 0.5068134, -0.1050166, 1, 1, 1, 1, 1,
-0.7215132, -0.9659638, -1.699825, 1, 1, 1, 1, 1,
-0.7191554, -0.4764808, -2.193438, 1, 1, 1, 1, 1,
-0.717723, -0.8557512, -2.226009, 1, 1, 1, 1, 1,
-0.7141422, -0.2922042, -1.10124, 1, 1, 1, 1, 1,
-0.7128544, 1.117103, -0.8908745, 1, 1, 1, 1, 1,
-0.7102504, 1.474385, -0.4096217, 1, 1, 1, 1, 1,
-0.7054546, -0.4805467, 0.1309704, 1, 1, 1, 1, 1,
-0.7015398, -1.663902, -2.498243, 1, 1, 1, 1, 1,
-0.6958356, 1.395069, 0.2716832, 1, 1, 1, 1, 1,
-0.6928194, 0.5942308, -1.370496, 1, 1, 1, 1, 1,
-0.691485, -1.083296, -1.025965, 1, 1, 1, 1, 1,
-0.6887445, -0.5684295, -2.64098, 1, 1, 1, 1, 1,
-0.6874456, -1.283843, -2.43675, 0, 0, 1, 1, 1,
-0.6817178, -0.2312277, -2.946066, 1, 0, 0, 1, 1,
-0.6814896, 1.99372, -1.415098, 1, 0, 0, 1, 1,
-0.680254, -0.6125534, -2.452532, 1, 0, 0, 1, 1,
-0.6740441, 0.1699819, -0.0637837, 1, 0, 0, 1, 1,
-0.6729671, -0.3849773, -1.659411, 1, 0, 0, 1, 1,
-0.671877, 1.142374, -1.113353, 0, 0, 0, 1, 1,
-0.6658025, -0.2055036, -0.6298054, 0, 0, 0, 1, 1,
-0.6505406, 1.690008, 0.0733032, 0, 0, 0, 1, 1,
-0.6495671, 0.8151408, 0.2917668, 0, 0, 0, 1, 1,
-0.6469772, -0.8273974, -2.961574, 0, 0, 0, 1, 1,
-0.6454627, 2.02433, -0.7935072, 0, 0, 0, 1, 1,
-0.6420532, 1.129162, -0.8267827, 0, 0, 0, 1, 1,
-0.637813, 1.295542, -0.9793503, 1, 1, 1, 1, 1,
-0.6370963, 1.267327, -1.276338, 1, 1, 1, 1, 1,
-0.635086, 1.135684, -0.2350087, 1, 1, 1, 1, 1,
-0.6333426, 0.4008146, -2.344341, 1, 1, 1, 1, 1,
-0.6302451, 2.636429, -0.1829821, 1, 1, 1, 1, 1,
-0.6301792, -0.5580558, -3.645703, 1, 1, 1, 1, 1,
-0.6274568, -0.3998708, -0.1295029, 1, 1, 1, 1, 1,
-0.6248924, 0.1494477, -1.457249, 1, 1, 1, 1, 1,
-0.622498, 1.601017, -0.388766, 1, 1, 1, 1, 1,
-0.6217424, 0.2651391, -0.9179046, 1, 1, 1, 1, 1,
-0.6199213, -1.000087, -2.196922, 1, 1, 1, 1, 1,
-0.6140717, 1.661053, -0.4609447, 1, 1, 1, 1, 1,
-0.6114559, 0.3602436, -1.915347, 1, 1, 1, 1, 1,
-0.6087241, 0.02605838, -2.723005, 1, 1, 1, 1, 1,
-0.6072932, 0.7836682, -0.5060089, 1, 1, 1, 1, 1,
-0.6058418, 0.6133589, -1.640938, 0, 0, 1, 1, 1,
-0.6055245, 0.238406, -1.213091, 1, 0, 0, 1, 1,
-0.6053227, -1.024267, -3.571821, 1, 0, 0, 1, 1,
-0.6044564, -1.673374, -2.02366, 1, 0, 0, 1, 1,
-0.6035672, -0.4110698, -2.377928, 1, 0, 0, 1, 1,
-0.6018463, 0.4860854, -0.04589521, 1, 0, 0, 1, 1,
-0.6007676, 1.727931, -1.240742, 0, 0, 0, 1, 1,
-0.5996868, -0.6768785, -1.917395, 0, 0, 0, 1, 1,
-0.5980508, 0.9109806, 0.856454, 0, 0, 0, 1, 1,
-0.5873914, -0.6053161, -2.809338, 0, 0, 0, 1, 1,
-0.5844884, -1.173042, -3.20762, 0, 0, 0, 1, 1,
-0.5804633, -1.607667, -3.054201, 0, 0, 0, 1, 1,
-0.579969, -1.013217, -3.112206, 0, 0, 0, 1, 1,
-0.5788687, -0.3501179, -2.830649, 1, 1, 1, 1, 1,
-0.570793, 1.322459, -0.3420688, 1, 1, 1, 1, 1,
-0.5702487, -0.8237748, -2.455764, 1, 1, 1, 1, 1,
-0.5692432, -2.222166, -3.459524, 1, 1, 1, 1, 1,
-0.5689004, -0.8140092, -0.6567842, 1, 1, 1, 1, 1,
-0.5658318, -1.37478, -3.143418, 1, 1, 1, 1, 1,
-0.5614144, 0.961262, -0.2259566, 1, 1, 1, 1, 1,
-0.5613194, 0.5645352, -1.075363, 1, 1, 1, 1, 1,
-0.5602171, 1.458399, -0.7283825, 1, 1, 1, 1, 1,
-0.559445, -0.6409192, -2.956371, 1, 1, 1, 1, 1,
-0.5541684, -0.6173463, -1.606946, 1, 1, 1, 1, 1,
-0.5505883, 0.08927886, -1.820701, 1, 1, 1, 1, 1,
-0.5439934, -0.3943539, -1.213148, 1, 1, 1, 1, 1,
-0.5376465, 1.708224, 0.3821909, 1, 1, 1, 1, 1,
-0.5356491, 1.643368, 0.3153222, 1, 1, 1, 1, 1,
-0.5321195, -1.012987, -3.32893, 0, 0, 1, 1, 1,
-0.5261695, 0.73, -1.353335, 1, 0, 0, 1, 1,
-0.5260602, 0.5483793, -0.4900041, 1, 0, 0, 1, 1,
-0.5236013, -0.00580207, -0.9728727, 1, 0, 0, 1, 1,
-0.5231451, -0.5289572, -2.816494, 1, 0, 0, 1, 1,
-0.5160722, -1.648487, -2.515666, 1, 0, 0, 1, 1,
-0.5133803, 0.309925, -1.295135, 0, 0, 0, 1, 1,
-0.5111243, 0.5838075, -0.03985534, 0, 0, 0, 1, 1,
-0.5095071, 1.861797, -0.5736391, 0, 0, 0, 1, 1,
-0.5033021, -0.8871183, -5.492166, 0, 0, 0, 1, 1,
-0.4942607, -0.4414693, -3.510479, 0, 0, 0, 1, 1,
-0.4884882, -0.4935771, -1.055468, 0, 0, 0, 1, 1,
-0.4881432, -0.002875522, -0.1059989, 0, 0, 0, 1, 1,
-0.4863073, -0.3662819, -2.41907, 1, 1, 1, 1, 1,
-0.4857031, -1.408081, -3.939107, 1, 1, 1, 1, 1,
-0.4855662, -1.001867, -3.228397, 1, 1, 1, 1, 1,
-0.4818191, 0.7676663, -1.44246, 1, 1, 1, 1, 1,
-0.481725, -0.4637115, -2.25702, 1, 1, 1, 1, 1,
-0.4807907, 1.908219, 0.8730248, 1, 1, 1, 1, 1,
-0.476606, 0.3559293, -0.7866926, 1, 1, 1, 1, 1,
-0.4737445, 1.372141, -0.5974763, 1, 1, 1, 1, 1,
-0.4725837, -0.3715279, -1.175828, 1, 1, 1, 1, 1,
-0.4707997, 0.4916798, 0.1276528, 1, 1, 1, 1, 1,
-0.469212, -0.1716971, -2.303772, 1, 1, 1, 1, 1,
-0.4594732, 1.319322, -1.079592, 1, 1, 1, 1, 1,
-0.4593991, -0.01459168, -0.4892043, 1, 1, 1, 1, 1,
-0.4499263, -1.26722, -3.154213, 1, 1, 1, 1, 1,
-0.4470009, -0.1910885, -2.019551, 1, 1, 1, 1, 1,
-0.4435612, 1.524406, 0.4131504, 0, 0, 1, 1, 1,
-0.4383186, -0.4930244, -1.961694, 1, 0, 0, 1, 1,
-0.435409, 1.183688, 0.4573288, 1, 0, 0, 1, 1,
-0.435367, -0.1366708, -2.687329, 1, 0, 0, 1, 1,
-0.4341612, 1.182631, -0.3840688, 1, 0, 0, 1, 1,
-0.4318546, 0.285096, -1.1911, 1, 0, 0, 1, 1,
-0.4265302, 1.404039, 1.436582, 0, 0, 0, 1, 1,
-0.412836, 1.448421, 1.141451, 0, 0, 0, 1, 1,
-0.411188, 1.094661, 2.168108, 0, 0, 0, 1, 1,
-0.4107287, -1.370608, -3.072434, 0, 0, 0, 1, 1,
-0.4104342, 0.7392057, -0.1677412, 0, 0, 0, 1, 1,
-0.4060574, -0.4698083, -2.6282, 0, 0, 0, 1, 1,
-0.4048681, 2.617081, 0.6914474, 0, 0, 0, 1, 1,
-0.4039218, -0.1879672, -3.038389, 1, 1, 1, 1, 1,
-0.4020468, 1.251058, -0.04099288, 1, 1, 1, 1, 1,
-0.3999035, 0.1945285, -1.026743, 1, 1, 1, 1, 1,
-0.3955348, -1.803948, -2.479346, 1, 1, 1, 1, 1,
-0.3949513, -0.9675136, -1.560707, 1, 1, 1, 1, 1,
-0.3945428, -1.212492, -3.906049, 1, 1, 1, 1, 1,
-0.393338, -0.4764868, -3.173476, 1, 1, 1, 1, 1,
-0.3930854, -0.9826014, -1.939374, 1, 1, 1, 1, 1,
-0.3917747, -0.04405354, -3.018224, 1, 1, 1, 1, 1,
-0.3868241, -0.3650977, -2.572192, 1, 1, 1, 1, 1,
-0.3785676, -0.08539425, -2.974621, 1, 1, 1, 1, 1,
-0.3755647, 0.1879957, 0.79058, 1, 1, 1, 1, 1,
-0.3726532, -0.6446424, -2.556015, 1, 1, 1, 1, 1,
-0.3697087, -2.090748, -4.540723, 1, 1, 1, 1, 1,
-0.3628476, -0.1694632, -2.215963, 1, 1, 1, 1, 1,
-0.3605063, 0.8828819, 0.7820234, 0, 0, 1, 1, 1,
-0.3491565, -0.8330494, -2.040858, 1, 0, 0, 1, 1,
-0.3467954, -0.5920264, -2.947756, 1, 0, 0, 1, 1,
-0.3438629, -0.2304323, -3.278682, 1, 0, 0, 1, 1,
-0.3356153, -1.601453, -1.818278, 1, 0, 0, 1, 1,
-0.3333444, -1.414539, -3.820138, 1, 0, 0, 1, 1,
-0.3292713, -1.76661, -3.408803, 0, 0, 0, 1, 1,
-0.32612, -0.8601508, -1.014953, 0, 0, 0, 1, 1,
-0.3260559, 0.3694739, -0.1778036, 0, 0, 0, 1, 1,
-0.3258305, -1.460496, -2.868775, 0, 0, 0, 1, 1,
-0.3223158, -1.931087, -2.490254, 0, 0, 0, 1, 1,
-0.3201767, -0.2433193, -1.80713, 0, 0, 0, 1, 1,
-0.3185476, -2.178627, -3.358155, 0, 0, 0, 1, 1,
-0.3125899, 0.963869, 0.1196163, 1, 1, 1, 1, 1,
-0.3101234, -2.502793, -5.371471, 1, 1, 1, 1, 1,
-0.3092504, 0.9702786, -1.552664, 1, 1, 1, 1, 1,
-0.3092447, -0.6671389, -2.335351, 1, 1, 1, 1, 1,
-0.3083769, 0.6872737, -1.800197, 1, 1, 1, 1, 1,
-0.3058498, 0.2485135, -2.06284, 1, 1, 1, 1, 1,
-0.3042092, 0.8571601, 1.621296, 1, 1, 1, 1, 1,
-0.2992451, -1.253087, -0.8777775, 1, 1, 1, 1, 1,
-0.2984864, 1.087996, -0.6144068, 1, 1, 1, 1, 1,
-0.290083, -0.4169888, -2.264304, 1, 1, 1, 1, 1,
-0.2893761, 0.7971398, -0.9491718, 1, 1, 1, 1, 1,
-0.2880487, -0.4575893, -3.934118, 1, 1, 1, 1, 1,
-0.2850286, -0.304433, -1.7458, 1, 1, 1, 1, 1,
-0.284355, -0.7205581, -4.369418, 1, 1, 1, 1, 1,
-0.2796012, -0.4741772, -2.956509, 1, 1, 1, 1, 1,
-0.2788666, 0.8209215, 0.4519097, 0, 0, 1, 1, 1,
-0.278794, 0.523114, -0.8211053, 1, 0, 0, 1, 1,
-0.2777444, -0.335308, -1.557243, 1, 0, 0, 1, 1,
-0.2760481, -0.1320409, -1.463203, 1, 0, 0, 1, 1,
-0.2679598, -1.020379, -0.800409, 1, 0, 0, 1, 1,
-0.2612971, -0.6700585, -2.016664, 1, 0, 0, 1, 1,
-0.2612771, -1.425216, -2.519355, 0, 0, 0, 1, 1,
-0.2487537, -0.1193596, -3.171259, 0, 0, 0, 1, 1,
-0.2485711, 0.07520383, -0.3328029, 0, 0, 0, 1, 1,
-0.2482741, 1.700321, 0.2504904, 0, 0, 0, 1, 1,
-0.2463845, -0.643405, -3.118825, 0, 0, 0, 1, 1,
-0.2417225, 2.73945, 0.2426434, 0, 0, 0, 1, 1,
-0.2385064, -0.2026084, -2.354251, 0, 0, 0, 1, 1,
-0.2355967, -0.09439801, -1.869658, 1, 1, 1, 1, 1,
-0.2256399, 0.7351323, -0.7325211, 1, 1, 1, 1, 1,
-0.2218311, 1.049424, 0.1988585, 1, 1, 1, 1, 1,
-0.221087, 0.952822, -0.7030155, 1, 1, 1, 1, 1,
-0.2176006, -0.4950303, -3.342854, 1, 1, 1, 1, 1,
-0.2151877, 0.3991277, -0.7402864, 1, 1, 1, 1, 1,
-0.2065834, 0.2401281, 0.2525799, 1, 1, 1, 1, 1,
-0.2034321, -0.463688, -2.185972, 1, 1, 1, 1, 1,
-0.2025061, 0.7374216, -0.9286069, 1, 1, 1, 1, 1,
-0.2016639, 0.650253, -1.478756, 1, 1, 1, 1, 1,
-0.1994451, 0.8687018, 0.8828033, 1, 1, 1, 1, 1,
-0.1982502, 2.155218, -0.5626515, 1, 1, 1, 1, 1,
-0.1961233, 1.740478, 0.3183177, 1, 1, 1, 1, 1,
-0.1950298, 1.977106, 1.316343, 1, 1, 1, 1, 1,
-0.1903701, -1.22015, -1.057934, 1, 1, 1, 1, 1,
-0.1903613, 0.06543121, -0.2728283, 0, 0, 1, 1, 1,
-0.187722, -1.406125, -3.002937, 1, 0, 0, 1, 1,
-0.1869093, -0.01435104, -3.878869, 1, 0, 0, 1, 1,
-0.1789772, -0.7055482, -3.874139, 1, 0, 0, 1, 1,
-0.1775991, 0.1025767, -1.013989, 1, 0, 0, 1, 1,
-0.1765348, 0.1223922, 0.5843742, 1, 0, 0, 1, 1,
-0.1764178, -0.02289529, -1.465363, 0, 0, 0, 1, 1,
-0.1749566, -1.226558, -4.06731, 0, 0, 0, 1, 1,
-0.1741677, 0.006490387, -1.953634, 0, 0, 0, 1, 1,
-0.1740727, -0.5669976, -2.13773, 0, 0, 0, 1, 1,
-0.1721451, 0.1019744, -0.9257622, 0, 0, 0, 1, 1,
-0.1717428, -1.492488, -1.453434, 0, 0, 0, 1, 1,
-0.1707619, -0.03006627, -2.325488, 0, 0, 0, 1, 1,
-0.1679858, -1.014015, -3.083714, 1, 1, 1, 1, 1,
-0.1631332, 1.90387, 0.517505, 1, 1, 1, 1, 1,
-0.1624858, -1.411506, -3.638304, 1, 1, 1, 1, 1,
-0.1586459, 1.178585, -0.3605019, 1, 1, 1, 1, 1,
-0.1586324, 2.096378, -2.100207, 1, 1, 1, 1, 1,
-0.1434089, 0.08467921, 1.131534, 1, 1, 1, 1, 1,
-0.1430187, -0.9145435, -3.226801, 1, 1, 1, 1, 1,
-0.1415709, -0.6899926, -3.051541, 1, 1, 1, 1, 1,
-0.1414183, 0.2752633, -0.6946319, 1, 1, 1, 1, 1,
-0.1412217, -0.03022884, -2.457763, 1, 1, 1, 1, 1,
-0.1396992, -1.042033, -2.637352, 1, 1, 1, 1, 1,
-0.1372081, 0.08044713, 0.02892779, 1, 1, 1, 1, 1,
-0.1330539, -1.547335, -3.161703, 1, 1, 1, 1, 1,
-0.1319999, -0.1505471, -2.526006, 1, 1, 1, 1, 1,
-0.1294672, -0.5170064, -3.748675, 1, 1, 1, 1, 1,
-0.1283377, -2.05951, -3.384416, 0, 0, 1, 1, 1,
-0.1262515, 1.807581, -0.9900023, 1, 0, 0, 1, 1,
-0.124793, 0.2723629, -1.756298, 1, 0, 0, 1, 1,
-0.1234355, -0.642751, -1.858957, 1, 0, 0, 1, 1,
-0.1188117, 0.1051539, -1.196135, 1, 0, 0, 1, 1,
-0.1125758, 0.8424221, 0.9296556, 1, 0, 0, 1, 1,
-0.1099619, 0.411311, -2.359473, 0, 0, 0, 1, 1,
-0.1081708, -0.3115183, -1.500424, 0, 0, 0, 1, 1,
-0.1063955, 1.036525, -0.2268175, 0, 0, 0, 1, 1,
-0.1054053, 1.469207, 0.4157943, 0, 0, 0, 1, 1,
-0.1050005, -0.0009890328, -2.205394, 0, 0, 0, 1, 1,
-0.1019472, 0.9697008, 0.3811421, 0, 0, 0, 1, 1,
-0.1010393, -2.830159, -2.629953, 0, 0, 0, 1, 1,
-0.1000536, -0.8930272, -4.307937, 1, 1, 1, 1, 1,
-0.09929853, 0.6274698, -1.456276, 1, 1, 1, 1, 1,
-0.09408902, 0.4489296, -0.7700353, 1, 1, 1, 1, 1,
-0.0928737, 0.9297932, 2.371253, 1, 1, 1, 1, 1,
-0.0923443, -0.4451637, -3.502066, 1, 1, 1, 1, 1,
-0.09094574, -0.1623526, -1.513461, 1, 1, 1, 1, 1,
-0.08705747, 1.249127, -1.478577, 1, 1, 1, 1, 1,
-0.08683448, 2.230815, 0.8408807, 1, 1, 1, 1, 1,
-0.0861013, -0.6924853, -3.339127, 1, 1, 1, 1, 1,
-0.07782587, -0.3447759, -1.280882, 1, 1, 1, 1, 1,
-0.07220189, 0.0405589, -2.763378, 1, 1, 1, 1, 1,
-0.0701334, -0.4619846, -2.917951, 1, 1, 1, 1, 1,
-0.06846858, 0.9931661, -0.6603258, 1, 1, 1, 1, 1,
-0.06810568, -2.333104, -3.017133, 1, 1, 1, 1, 1,
-0.06705108, 0.5175492, -0.7839708, 1, 1, 1, 1, 1,
-0.06651425, -0.7335994, -4.235291, 0, 0, 1, 1, 1,
-0.06612576, 0.3344602, -0.9960229, 1, 0, 0, 1, 1,
-0.06563745, 0.746505, 0.9733298, 1, 0, 0, 1, 1,
-0.06497183, 2.811293, 1.502439, 1, 0, 0, 1, 1,
-0.06386413, -0.4284727, -3.205729, 1, 0, 0, 1, 1,
-0.05982027, -1.253473, -3.309426, 1, 0, 0, 1, 1,
-0.05849166, 0.9800247, 0.5819576, 0, 0, 0, 1, 1,
-0.05001155, -1.182732, -3.302061, 0, 0, 0, 1, 1,
-0.04960057, 1.663134, 0.5506819, 0, 0, 0, 1, 1,
-0.04880254, 0.04953278, -1.977173, 0, 0, 0, 1, 1,
-0.04475167, -0.6082261, -3.029467, 0, 0, 0, 1, 1,
-0.04369672, -1.20749, -2.918298, 0, 0, 0, 1, 1,
-0.04019369, 0.2595624, -0.202535, 0, 0, 0, 1, 1,
-0.03655731, -1.154001, -2.359995, 1, 1, 1, 1, 1,
-0.03338575, -0.6309788, -3.270151, 1, 1, 1, 1, 1,
-0.02689007, 0.5651343, 0.2750723, 1, 1, 1, 1, 1,
-0.02351287, -0.2028062, -3.746941, 1, 1, 1, 1, 1,
-0.02140905, -0.1523459, -2.237529, 1, 1, 1, 1, 1,
-0.01940133, -0.2105772, -2.158983, 1, 1, 1, 1, 1,
-0.01620683, 1.155551, -0.888645, 1, 1, 1, 1, 1,
-0.0155841, -1.007203, -2.840377, 1, 1, 1, 1, 1,
-0.01309424, -0.2025674, -3.960398, 1, 1, 1, 1, 1,
-0.01220263, -0.0853014, -0.9990134, 1, 1, 1, 1, 1,
-0.009195951, 1.991161, -0.2181584, 1, 1, 1, 1, 1,
-0.007601929, -0.1374979, -2.497628, 1, 1, 1, 1, 1,
-0.00691649, -0.5626513, -2.073578, 1, 1, 1, 1, 1,
-0.005680738, -0.5707116, -2.832695, 1, 1, 1, 1, 1,
-0.005026244, 0.2469849, 1.82896, 1, 1, 1, 1, 1,
-0.003219099, 2.049335, 0.6070086, 0, 0, 1, 1, 1,
-0.002593484, 0.5231647, 0.4235742, 1, 0, 0, 1, 1,
0.0009949706, -0.9560264, 4.86952, 1, 0, 0, 1, 1,
0.00715996, -0.3557258, 3.52542, 1, 0, 0, 1, 1,
0.007228683, 1.185291, -0.2098322, 1, 0, 0, 1, 1,
0.01385052, -0.3688606, 2.300579, 1, 0, 0, 1, 1,
0.01455765, 0.8393411, 1.090723, 0, 0, 0, 1, 1,
0.01619118, 1.602759, -4.081803, 0, 0, 0, 1, 1,
0.01644687, 0.8757738, -1.887171, 0, 0, 0, 1, 1,
0.02254879, 0.2666223, -1.053996, 0, 0, 0, 1, 1,
0.02534324, -0.1171954, 2.332377, 0, 0, 0, 1, 1,
0.02969594, -0.3645085, 2.980972, 0, 0, 0, 1, 1,
0.03227126, 0.8085459, 2.052589, 0, 0, 0, 1, 1,
0.03494208, -0.7988833, 2.895592, 1, 1, 1, 1, 1,
0.04164537, 0.3047778, 0.07933307, 1, 1, 1, 1, 1,
0.04181345, 0.8626101, 0.7420403, 1, 1, 1, 1, 1,
0.04353477, -1.170677, 1.861378, 1, 1, 1, 1, 1,
0.04696089, 0.2303322, -0.1935157, 1, 1, 1, 1, 1,
0.04761893, 0.1305015, -0.5516037, 1, 1, 1, 1, 1,
0.04836492, 0.0968029, -0.5849311, 1, 1, 1, 1, 1,
0.05183587, -1.86266, 2.848922, 1, 1, 1, 1, 1,
0.05410242, -0.9340329, 4.007813, 1, 1, 1, 1, 1,
0.05520024, 0.6208735, 0.5226115, 1, 1, 1, 1, 1,
0.05543078, -1.101514, 4.131418, 1, 1, 1, 1, 1,
0.05580526, -2.030218, 3.398545, 1, 1, 1, 1, 1,
0.06039642, 0.4284461, -0.7532414, 1, 1, 1, 1, 1,
0.06323223, -0.7256572, 4.05093, 1, 1, 1, 1, 1,
0.06600625, -0.4779627, 2.980618, 1, 1, 1, 1, 1,
0.07045666, -0.4472215, 3.217937, 0, 0, 1, 1, 1,
0.07119113, 0.5255651, 1.377653, 1, 0, 0, 1, 1,
0.07212965, -2.071773, 1.567783, 1, 0, 0, 1, 1,
0.07283507, 0.1514637, -0.4255597, 1, 0, 0, 1, 1,
0.07516562, 0.08158075, 1.734106, 1, 0, 0, 1, 1,
0.07574369, -1.142336, 2.756916, 1, 0, 0, 1, 1,
0.08103404, 1.088485, 1.132451, 0, 0, 0, 1, 1,
0.08260417, -0.762032, 3.605152, 0, 0, 0, 1, 1,
0.0848901, 0.03495258, 1.801116, 0, 0, 0, 1, 1,
0.0882024, -1.830453, 3.855187, 0, 0, 0, 1, 1,
0.08846404, -0.1824446, 3.037566, 0, 0, 0, 1, 1,
0.09075291, 0.2323716, 0.1994437, 0, 0, 0, 1, 1,
0.09621785, -1.584039, 2.785647, 0, 0, 0, 1, 1,
0.1064027, -0.185898, 2.842116, 1, 1, 1, 1, 1,
0.1192376, 0.2385885, 0.9087441, 1, 1, 1, 1, 1,
0.1213123, 1.194881, 0.6657883, 1, 1, 1, 1, 1,
0.1222093, -0.4028921, 3.529819, 1, 1, 1, 1, 1,
0.1253681, 0.4820733, 1.983989, 1, 1, 1, 1, 1,
0.1254897, -0.2609278, 4.439971, 1, 1, 1, 1, 1,
0.1255761, -0.3020577, 3.229729, 1, 1, 1, 1, 1,
0.1276462, 1.44858, 1.326634, 1, 1, 1, 1, 1,
0.1300941, 0.6278796, 0.5179648, 1, 1, 1, 1, 1,
0.1313426, 1.250652, -1.76422, 1, 1, 1, 1, 1,
0.1338549, -1.264587, 2.130709, 1, 1, 1, 1, 1,
0.1434433, 0.7703595, -0.03248713, 1, 1, 1, 1, 1,
0.1512818, 0.4393269, 3.479033, 1, 1, 1, 1, 1,
0.1552742, 0.9235662, 0.08227017, 1, 1, 1, 1, 1,
0.1557736, -0.2171531, 2.147058, 1, 1, 1, 1, 1,
0.1581338, 1.539656, 0.08964111, 0, 0, 1, 1, 1,
0.1589854, -0.2459765, 4.078905, 1, 0, 0, 1, 1,
0.1645457, 1.343181, -1.003029, 1, 0, 0, 1, 1,
0.1654447, 0.4011819, 0.5712073, 1, 0, 0, 1, 1,
0.1800413, 1.812441, 0.09124313, 1, 0, 0, 1, 1,
0.1863956, 0.7129584, 1.259552, 1, 0, 0, 1, 1,
0.1875569, -0.4294497, 1.720016, 0, 0, 0, 1, 1,
0.1901285, -0.3024566, 2.841416, 0, 0, 0, 1, 1,
0.1912663, 0.3124557, 1.553324, 0, 0, 0, 1, 1,
0.1923207, 0.1024103, 0.6481285, 0, 0, 0, 1, 1,
0.1967541, 0.5668185, -0.3667926, 0, 0, 0, 1, 1,
0.1988959, 1.178246, 0.4503932, 0, 0, 0, 1, 1,
0.2032822, -1.387773, 3.525277, 0, 0, 0, 1, 1,
0.2038008, 0.1559645, 2.615059, 1, 1, 1, 1, 1,
0.2045867, 1.812424, -0.9968129, 1, 1, 1, 1, 1,
0.2050156, 0.433205, 0.749792, 1, 1, 1, 1, 1,
0.2086905, -1.209296, 2.334118, 1, 1, 1, 1, 1,
0.2110252, 0.9584659, 0.5650769, 1, 1, 1, 1, 1,
0.2111623, 0.2784924, 1.217086, 1, 1, 1, 1, 1,
0.214612, -0.3802215, 1.335329, 1, 1, 1, 1, 1,
0.2164969, 1.295121, 0.2824269, 1, 1, 1, 1, 1,
0.219197, 1.915135, -1.857818, 1, 1, 1, 1, 1,
0.220978, -1.024331, 3.166918, 1, 1, 1, 1, 1,
0.221394, 0.07544627, 1.508093, 1, 1, 1, 1, 1,
0.2287594, 0.4952581, 0.798027, 1, 1, 1, 1, 1,
0.2293178, 0.0285083, 2.332594, 1, 1, 1, 1, 1,
0.231193, -0.9737465, 3.977421, 1, 1, 1, 1, 1,
0.2319067, -1.290957, 3.304419, 1, 1, 1, 1, 1,
0.2352869, 0.3454353, 1.089248, 0, 0, 1, 1, 1,
0.2401353, -0.02610445, 0.03911199, 1, 0, 0, 1, 1,
0.243309, -2.1498, 4.631182, 1, 0, 0, 1, 1,
0.2503057, -0.9339846, 4.237471, 1, 0, 0, 1, 1,
0.2521943, 0.7840027, 0.3011735, 1, 0, 0, 1, 1,
0.2534222, -1.134838, 2.47818, 1, 0, 0, 1, 1,
0.2544764, -0.6281841, 3.619318, 0, 0, 0, 1, 1,
0.2585701, 0.3623093, 1.146452, 0, 0, 0, 1, 1,
0.2623292, 1.864242, 0.1638733, 0, 0, 0, 1, 1,
0.2646829, 0.2469268, -0.1072587, 0, 0, 0, 1, 1,
0.2672606, 0.9114437, 0.558983, 0, 0, 0, 1, 1,
0.2739718, -0.4435077, 2.081423, 0, 0, 0, 1, 1,
0.2774558, -1.855054, 4.131884, 0, 0, 0, 1, 1,
0.2832687, 0.09063165, -0.4572911, 1, 1, 1, 1, 1,
0.2866403, 1.747043, -1.255855, 1, 1, 1, 1, 1,
0.2873483, 0.03889354, 1.18867, 1, 1, 1, 1, 1,
0.2921506, 0.4623299, 1.839504, 1, 1, 1, 1, 1,
0.2921804, 0.8965096, -0.8073751, 1, 1, 1, 1, 1,
0.2947588, -0.5338628, 3.457455, 1, 1, 1, 1, 1,
0.2955501, 1.013757, 1.027235, 1, 1, 1, 1, 1,
0.3048339, -0.4892824, 2.73664, 1, 1, 1, 1, 1,
0.3095791, -0.2801968, 2.322467, 1, 1, 1, 1, 1,
0.3116371, 0.5350457, -0.2257878, 1, 1, 1, 1, 1,
0.3131143, -1.453297, 2.274529, 1, 1, 1, 1, 1,
0.3162902, -0.8565696, 3.004697, 1, 1, 1, 1, 1,
0.3175207, -0.3649386, 2.004663, 1, 1, 1, 1, 1,
0.3215464, -1.356751, 5.652277, 1, 1, 1, 1, 1,
0.3241116, 1.823373, 0.1229674, 1, 1, 1, 1, 1,
0.3266237, -1.27641, 3.183829, 0, 0, 1, 1, 1,
0.3334871, 0.1698677, -0.683659, 1, 0, 0, 1, 1,
0.3434025, 0.5395982, 0.8656139, 1, 0, 0, 1, 1,
0.3457593, 0.1728416, 0.8529623, 1, 0, 0, 1, 1,
0.3474307, 0.8116521, 0.4527771, 1, 0, 0, 1, 1,
0.3475455, 1.262159, 0.8967879, 1, 0, 0, 1, 1,
0.3477624, 1.107042, -0.1571192, 0, 0, 0, 1, 1,
0.3485433, 0.536916, 2.227619, 0, 0, 0, 1, 1,
0.3491771, 1.184618, 0.2383937, 0, 0, 0, 1, 1,
0.353186, 0.1081199, -0.02968052, 0, 0, 0, 1, 1,
0.3571377, -0.3286527, 2.626394, 0, 0, 0, 1, 1,
0.3609571, -0.5449174, 1.727289, 0, 0, 0, 1, 1,
0.367819, 0.1843902, 1.950548, 0, 0, 0, 1, 1,
0.3706728, -0.7350172, 2.027841, 1, 1, 1, 1, 1,
0.3709834, 0.4233259, -1.291661, 1, 1, 1, 1, 1,
0.3738772, -1.366437, 5.029244, 1, 1, 1, 1, 1,
0.3756702, -0.423624, 3.860627, 1, 1, 1, 1, 1,
0.3812135, 0.5180762, 1.351892, 1, 1, 1, 1, 1,
0.3844712, -1.495772, 3.769667, 1, 1, 1, 1, 1,
0.3867562, 0.3275757, 0.9174796, 1, 1, 1, 1, 1,
0.3877519, -0.6213109, 2.635378, 1, 1, 1, 1, 1,
0.3883555, 0.6941395, -0.8100506, 1, 1, 1, 1, 1,
0.3895257, -0.2786574, 2.053979, 1, 1, 1, 1, 1,
0.3926458, 0.103301, 2.66983, 1, 1, 1, 1, 1,
0.3951193, 0.4951686, 1.539567, 1, 1, 1, 1, 1,
0.4011163, 1.155437, 0.3188128, 1, 1, 1, 1, 1,
0.4016285, 0.133124, 1.617468, 1, 1, 1, 1, 1,
0.4031372, -1.088307, 2.069306, 1, 1, 1, 1, 1,
0.4099094, -0.54707, 3.392041, 0, 0, 1, 1, 1,
0.4151018, -1.432588, 5.580354, 1, 0, 0, 1, 1,
0.4167743, -1.24404, 2.805163, 1, 0, 0, 1, 1,
0.4175512, -1.387536, 2.728354, 1, 0, 0, 1, 1,
0.4179384, 0.2528221, 1.377318, 1, 0, 0, 1, 1,
0.4180731, -0.5537353, 2.768074, 1, 0, 0, 1, 1,
0.4218919, 1.316348, -0.4646639, 0, 0, 0, 1, 1,
0.4239777, -0.0756379, 1.432747, 0, 0, 0, 1, 1,
0.4244907, 1.5271, 0.6689199, 0, 0, 0, 1, 1,
0.4314789, 0.02037463, 1.937574, 0, 0, 0, 1, 1,
0.4344076, 0.6517676, -0.1770198, 0, 0, 0, 1, 1,
0.4350536, 0.7225153, -1.19712, 0, 0, 0, 1, 1,
0.4360093, 0.1736355, 1.818381, 0, 0, 0, 1, 1,
0.4410116, 0.137762, 1.186393, 1, 1, 1, 1, 1,
0.4417036, 0.8566079, 1.327669, 1, 1, 1, 1, 1,
0.4445788, 0.009197508, 2.31029, 1, 1, 1, 1, 1,
0.4458147, 0.4491329, 2.539756, 1, 1, 1, 1, 1,
0.4483352, -0.9524747, 1.251362, 1, 1, 1, 1, 1,
0.4596566, 1.773142, 1.03063, 1, 1, 1, 1, 1,
0.4604108, -0.03803303, 2.791386, 1, 1, 1, 1, 1,
0.4610038, -0.8525012, 3.298342, 1, 1, 1, 1, 1,
0.4611717, -0.3790005, 2.671289, 1, 1, 1, 1, 1,
0.4623365, 1.200705, 0.9288777, 1, 1, 1, 1, 1,
0.4628496, -0.2904541, 0.9405812, 1, 1, 1, 1, 1,
0.4653505, 1.184065, 0.5637547, 1, 1, 1, 1, 1,
0.4653514, 1.973257, 0.7000398, 1, 1, 1, 1, 1,
0.467023, 0.2701388, 1.026381, 1, 1, 1, 1, 1,
0.471692, -0.2928167, 2.791421, 1, 1, 1, 1, 1,
0.4751559, 1.594204, 0.702301, 0, 0, 1, 1, 1,
0.4792943, -1.531412, 0.9632941, 1, 0, 0, 1, 1,
0.483117, -0.232325, 2.970106, 1, 0, 0, 1, 1,
0.4840382, -2.81138, 1.773394, 1, 0, 0, 1, 1,
0.4850239, 0.7725872, 0.5590388, 1, 0, 0, 1, 1,
0.4868873, 0.8670849, -1.157509, 1, 0, 0, 1, 1,
0.4878122, -1.378922, 2.939816, 0, 0, 0, 1, 1,
0.4881074, 0.08403751, 0.01920741, 0, 0, 0, 1, 1,
0.4955511, 1.891408, 0.0605772, 0, 0, 0, 1, 1,
0.4958104, -0.3184923, 2.460443, 0, 0, 0, 1, 1,
0.4966331, -0.4580926, 2.136094, 0, 0, 0, 1, 1,
0.4978321, -0.296086, 2.267965, 0, 0, 0, 1, 1,
0.4980941, 1.332392, -0.3444658, 0, 0, 0, 1, 1,
0.4996009, 0.5828505, 1.109167, 1, 1, 1, 1, 1,
0.5106205, -1.123703, 1.029767, 1, 1, 1, 1, 1,
0.5112661, 0.8746445, 1.591491, 1, 1, 1, 1, 1,
0.5186475, -0.5666947, 2.021742, 1, 1, 1, 1, 1,
0.5200862, -0.06670503, 1.15983, 1, 1, 1, 1, 1,
0.5232162, 1.088278, -1.091921, 1, 1, 1, 1, 1,
0.543521, -0.7892745, 1.442308, 1, 1, 1, 1, 1,
0.5510636, -1.743267, 5.830739, 1, 1, 1, 1, 1,
0.5585173, -0.08824179, 1.814265, 1, 1, 1, 1, 1,
0.5623538, -0.4591258, 2.133571, 1, 1, 1, 1, 1,
0.5670503, 0.4058885, 2.26488, 1, 1, 1, 1, 1,
0.5694758, -0.8552722, 2.616479, 1, 1, 1, 1, 1,
0.5699294, 1.444032, -0.6472136, 1, 1, 1, 1, 1,
0.5757544, 0.7111759, 0.2996818, 1, 1, 1, 1, 1,
0.5764485, -0.4030867, 1.157169, 1, 1, 1, 1, 1,
0.5770444, 1.18356, 2.473782, 0, 0, 1, 1, 1,
0.5852632, -0.2716376, 1.960236, 1, 0, 0, 1, 1,
0.5866969, -0.5539085, 1.368132, 1, 0, 0, 1, 1,
0.5872442, 0.6280083, 2.500556, 1, 0, 0, 1, 1,
0.5882015, 1.771683, 0.7798347, 1, 0, 0, 1, 1,
0.5896311, -0.2854917, 1.552419, 1, 0, 0, 1, 1,
0.5915318, 0.5372878, 2.339887, 0, 0, 0, 1, 1,
0.5939182, 0.5338305, 2.472102, 0, 0, 0, 1, 1,
0.5978584, 0.8909441, 0.02099101, 0, 0, 0, 1, 1,
0.5978917, 0.4090113, -0.6224858, 0, 0, 0, 1, 1,
0.6010202, 0.8418257, 1.809129, 0, 0, 0, 1, 1,
0.6078171, -0.610397, 1.43317, 0, 0, 0, 1, 1,
0.6104015, -0.6351227, 0.3831436, 0, 0, 0, 1, 1,
0.6120067, 0.1421883, 3.679117, 1, 1, 1, 1, 1,
0.6244889, -0.9388428, 0.9899148, 1, 1, 1, 1, 1,
0.6267492, -1.099381, 2.562998, 1, 1, 1, 1, 1,
0.6277554, 0.1552545, 0.03732698, 1, 1, 1, 1, 1,
0.6279477, -1.167921, 2.710424, 1, 1, 1, 1, 1,
0.6323227, 1.710825, 2.340825, 1, 1, 1, 1, 1,
0.6341529, 0.02064408, 2.886631, 1, 1, 1, 1, 1,
0.6363596, -1.983329, 4.144834, 1, 1, 1, 1, 1,
0.6365755, -1.304106, 1.2655, 1, 1, 1, 1, 1,
0.6450006, -0.154511, 3.377655, 1, 1, 1, 1, 1,
0.6476233, 0.350388, 3.182482, 1, 1, 1, 1, 1,
0.6514705, 0.3242294, 1.19386, 1, 1, 1, 1, 1,
0.653053, 0.4143697, 1.56472, 1, 1, 1, 1, 1,
0.6543799, 0.2394017, -0.4237833, 1, 1, 1, 1, 1,
0.6554123, -0.7296911, 3.096873, 1, 1, 1, 1, 1,
0.6599767, -0.2918458, 0.9854023, 0, 0, 1, 1, 1,
0.6654274, 0.5967045, 0.7606497, 1, 0, 0, 1, 1,
0.6654859, -1.177384, 2.756457, 1, 0, 0, 1, 1,
0.6692948, 0.4690799, 0.6185761, 1, 0, 0, 1, 1,
0.6720694, -0.2127585, 2.251237, 1, 0, 0, 1, 1,
0.6753809, -0.9716211, 3.126535, 1, 0, 0, 1, 1,
0.6759815, 0.7531872, -1.147869, 0, 0, 0, 1, 1,
0.6813453, -2.818809, 5.568778, 0, 0, 0, 1, 1,
0.6850207, -0.5958735, 1.688857, 0, 0, 0, 1, 1,
0.6886763, 0.15008, 1.750516, 0, 0, 0, 1, 1,
0.6925955, 0.06746596, 1.437108, 0, 0, 0, 1, 1,
0.6930777, -0.5172642, 4.069888, 0, 0, 0, 1, 1,
0.6980072, 0.6942487, 1.677628, 0, 0, 0, 1, 1,
0.6980529, 0.3553531, 1.311892, 1, 1, 1, 1, 1,
0.7018245, 1.528856, 0.8422724, 1, 1, 1, 1, 1,
0.7092495, 0.905646, 0.5066828, 1, 1, 1, 1, 1,
0.7099009, 0.3588563, 1.084319, 1, 1, 1, 1, 1,
0.7118716, -0.9200908, 2.058875, 1, 1, 1, 1, 1,
0.7139931, -0.00150318, 2.925839, 1, 1, 1, 1, 1,
0.7145232, -1.521404, 1.501757, 1, 1, 1, 1, 1,
0.7177581, 0.4348722, 2.922521, 1, 1, 1, 1, 1,
0.7201296, 0.5953346, -0.05694251, 1, 1, 1, 1, 1,
0.7272509, -1.971729, 4.309973, 1, 1, 1, 1, 1,
0.7436417, -0.3869043, 2.947794, 1, 1, 1, 1, 1,
0.7458792, -0.1376469, 1.934115, 1, 1, 1, 1, 1,
0.7477648, -0.7211558, 2.14954, 1, 1, 1, 1, 1,
0.7516023, 0.9052978, 0.6182932, 1, 1, 1, 1, 1,
0.7533227, -0.2795748, 2.059799, 1, 1, 1, 1, 1,
0.7569427, 0.1791771, 0.4087859, 0, 0, 1, 1, 1,
0.7625448, 0.6115562, 2.274827, 1, 0, 0, 1, 1,
0.7653431, 1.270229, 1.072622, 1, 0, 0, 1, 1,
0.7702472, 0.06597891, 0.2120521, 1, 0, 0, 1, 1,
0.7774825, -0.2284876, 2.188005, 1, 0, 0, 1, 1,
0.7805944, 0.7643179, -0.7474023, 1, 0, 0, 1, 1,
0.7808874, -0.8634906, 4.148669, 0, 0, 0, 1, 1,
0.78146, 1.394204, 0.5336707, 0, 0, 0, 1, 1,
0.7871699, 0.6095446, 0.9800991, 0, 0, 0, 1, 1,
0.7928117, 0.142333, 1.555336, 0, 0, 0, 1, 1,
0.7933382, 0.3054283, 1.532118, 0, 0, 0, 1, 1,
0.7947577, 0.1584425, 2.504843, 0, 0, 0, 1, 1,
0.7951758, 0.1132872, 1.843137, 0, 0, 0, 1, 1,
0.7953867, -0.2128295, 1.581563, 1, 1, 1, 1, 1,
0.7956482, 1.566341, -0.1596891, 1, 1, 1, 1, 1,
0.7968591, -0.3921541, 2.864716, 1, 1, 1, 1, 1,
0.7978557, 1.053067, -0.2452412, 1, 1, 1, 1, 1,
0.8021238, -0.4992409, 3.619147, 1, 1, 1, 1, 1,
0.8037198, 0.190344, 2.290622, 1, 1, 1, 1, 1,
0.8102471, -0.4597694, 1.723297, 1, 1, 1, 1, 1,
0.8105326, 1.057595, 0.5260742, 1, 1, 1, 1, 1,
0.8121706, -0.3765182, 0.8831031, 1, 1, 1, 1, 1,
0.8144533, 0.05400982, 1.341288, 1, 1, 1, 1, 1,
0.8163843, -1.219139, 4.177886, 1, 1, 1, 1, 1,
0.8205997, -0.5946615, 0.8689333, 1, 1, 1, 1, 1,
0.8244216, 1.449499, -0.5318962, 1, 1, 1, 1, 1,
0.8260128, -1.4007, 3.105993, 1, 1, 1, 1, 1,
0.8291213, -1.295441, 3.771194, 1, 1, 1, 1, 1,
0.8327555, -1.190715, 1.25662, 0, 0, 1, 1, 1,
0.8329399, -0.2685736, 2.791879, 1, 0, 0, 1, 1,
0.8330377, 1.419988, -1.679616, 1, 0, 0, 1, 1,
0.8345158, 1.533297, 1.166725, 1, 0, 0, 1, 1,
0.8355502, 0.357617, 0.8979074, 1, 0, 0, 1, 1,
0.84081, 0.9239813, 1.772354, 1, 0, 0, 1, 1,
0.842702, -0.01910667, 2.207754, 0, 0, 0, 1, 1,
0.8429509, -1.213995, 1.17641, 0, 0, 0, 1, 1,
0.8434447, -0.3507299, 0.5878392, 0, 0, 0, 1, 1,
0.8466355, -1.714604, 2.52768, 0, 0, 0, 1, 1,
0.8570538, 0.4014195, -0.6103559, 0, 0, 0, 1, 1,
0.8572747, 1.091236, 0.8413306, 0, 0, 0, 1, 1,
0.8604425, -0.729633, 2.090329, 0, 0, 0, 1, 1,
0.8644258, 1.339772, 0.8207385, 1, 1, 1, 1, 1,
0.8704998, -1.01742, 2.204366, 1, 1, 1, 1, 1,
0.8712454, 0.10965, 0.9429684, 1, 1, 1, 1, 1,
0.8715966, -0.07200389, 0.9795121, 1, 1, 1, 1, 1,
0.8723686, -1.739623, 3.180277, 1, 1, 1, 1, 1,
0.8737034, 1.716067, 0.06660608, 1, 1, 1, 1, 1,
0.874763, 0.5779989, -0.1328013, 1, 1, 1, 1, 1,
0.8753107, 0.8591172, -0.2074502, 1, 1, 1, 1, 1,
0.8787452, 1.849286, -0.3193851, 1, 1, 1, 1, 1,
0.8794717, -0.8640368, 2.626828, 1, 1, 1, 1, 1,
0.881614, -0.228094, 2.274373, 1, 1, 1, 1, 1,
0.8825698, -0.98298, 1.61946, 1, 1, 1, 1, 1,
0.8840837, -0.7076562, 1.855028, 1, 1, 1, 1, 1,
0.8894714, -0.5910859, 1.10147, 1, 1, 1, 1, 1,
0.892175, -0.461583, 3.199574, 1, 1, 1, 1, 1,
0.9042808, -2.836131, 3.043189, 0, 0, 1, 1, 1,
0.9116033, 0.1208182, 1.808101, 1, 0, 0, 1, 1,
0.9257355, 1.030768, -0.06291608, 1, 0, 0, 1, 1,
0.9304686, 0.3893879, 0.06132799, 1, 0, 0, 1, 1,
0.9413814, -0.609439, 0.9553459, 1, 0, 0, 1, 1,
0.9466087, -1.56134, 3.513075, 1, 0, 0, 1, 1,
0.952215, -0.774526, 2.201195, 0, 0, 0, 1, 1,
0.9539434, 0.1059429, 1.613151, 0, 0, 0, 1, 1,
0.9581608, 0.3989745, 0.230633, 0, 0, 0, 1, 1,
0.9587227, 0.7169343, 1.119182, 0, 0, 0, 1, 1,
0.9592822, 1.131441, -0.3845326, 0, 0, 0, 1, 1,
0.9604902, -0.5140782, 1.533162, 0, 0, 0, 1, 1,
0.9646139, -1.763847, 2.236481, 0, 0, 0, 1, 1,
0.9657799, -0.2235817, 2.664541, 1, 1, 1, 1, 1,
0.9701573, -0.7360551, 2.27936, 1, 1, 1, 1, 1,
0.9727551, -0.2532502, 0.3393783, 1, 1, 1, 1, 1,
0.9764404, -0.7470572, 2.063518, 1, 1, 1, 1, 1,
0.9779304, 0.7469661, -1.655123, 1, 1, 1, 1, 1,
0.9802127, 0.544727, -1.158953, 1, 1, 1, 1, 1,
0.9817818, -0.2269762, 1.129661, 1, 1, 1, 1, 1,
0.9820163, 1.401187, 1.137224, 1, 1, 1, 1, 1,
0.9942702, 0.4305794, 1.942884, 1, 1, 1, 1, 1,
0.9951978, -0.8078203, 3.483428, 1, 1, 1, 1, 1,
1.000402, 0.278554, 1.584289, 1, 1, 1, 1, 1,
1.000682, -0.05763532, 2.491882, 1, 1, 1, 1, 1,
1.002108, 1.000298, 1.393839, 1, 1, 1, 1, 1,
1.00321, 1.70698, 0.146352, 1, 1, 1, 1, 1,
1.004676, -0.7736908, 2.381249, 1, 1, 1, 1, 1,
1.012949, 0.1791984, -0.1184571, 0, 0, 1, 1, 1,
1.016561, 0.4710722, 0.8796706, 1, 0, 0, 1, 1,
1.027972, 0.01109335, 0.2146479, 1, 0, 0, 1, 1,
1.030606, 1.839212, 1.340764, 1, 0, 0, 1, 1,
1.031099, -0.4515215, 1.847084, 1, 0, 0, 1, 1,
1.042141, -0.03293414, 0.3267306, 1, 0, 0, 1, 1,
1.048852, -0.5056457, 2.641438, 0, 0, 0, 1, 1,
1.072383, 1.046347, 2.2196, 0, 0, 0, 1, 1,
1.074192, 0.3829714, 0.787577, 0, 0, 0, 1, 1,
1.086748, -1.093311, 2.813917, 0, 0, 0, 1, 1,
1.088673, 1.795676, -0.8839567, 0, 0, 0, 1, 1,
1.103639, -2.414716, 1.545867, 0, 0, 0, 1, 1,
1.104289, -0.1631241, 2.712206, 0, 0, 0, 1, 1,
1.109402, -0.1996646, 1.40434, 1, 1, 1, 1, 1,
1.111551, 1.101267, -0.7096989, 1, 1, 1, 1, 1,
1.121869, -0.9885377, 1.798445, 1, 1, 1, 1, 1,
1.122015, 1.745086, 0.1840108, 1, 1, 1, 1, 1,
1.127782, 1.535628, 0.660633, 1, 1, 1, 1, 1,
1.130109, -0.134296, 3.292669, 1, 1, 1, 1, 1,
1.135104, -1.205924, 3.604761, 1, 1, 1, 1, 1,
1.141127, -1.147982, 0.3640766, 1, 1, 1, 1, 1,
1.14258, 0.14941, -0.6965209, 1, 1, 1, 1, 1,
1.142814, -0.6137325, 1.926514, 1, 1, 1, 1, 1,
1.145093, 0.6640024, 0.9316227, 1, 1, 1, 1, 1,
1.146428, -0.9255285, 1.893063, 1, 1, 1, 1, 1,
1.148402, -0.6753464, 2.141471, 1, 1, 1, 1, 1,
1.151518, -0.4908335, 1.829037, 1, 1, 1, 1, 1,
1.158345, -0.009453507, 2.469563, 1, 1, 1, 1, 1,
1.170635, -0.2438458, 0.7156342, 0, 0, 1, 1, 1,
1.179398, 1.014722, 1.471845, 1, 0, 0, 1, 1,
1.193767, -0.6209373, 2.732282, 1, 0, 0, 1, 1,
1.198302, 1.587922, 0.3096092, 1, 0, 0, 1, 1,
1.213377, -0.05039468, 1.760166, 1, 0, 0, 1, 1,
1.213409, -0.7575694, 3.125335, 1, 0, 0, 1, 1,
1.214386, -1.273342, 2.410512, 0, 0, 0, 1, 1,
1.214418, 1.075365, 1.798456, 0, 0, 0, 1, 1,
1.233178, 0.215846, 0.9445407, 0, 0, 0, 1, 1,
1.238142, -0.1240505, 0.5459426, 0, 0, 0, 1, 1,
1.244719, -1.704982, 2.71405, 0, 0, 0, 1, 1,
1.248376, 1.709946, 0.2152399, 0, 0, 0, 1, 1,
1.24996, -0.9738853, 3.268261, 0, 0, 0, 1, 1,
1.254085, -1.63163, 1.130857, 1, 1, 1, 1, 1,
1.260195, 0.04214203, 1.377671, 1, 1, 1, 1, 1,
1.262816, -0.33645, 1.238049, 1, 1, 1, 1, 1,
1.265697, 0.5483994, -0.8500213, 1, 1, 1, 1, 1,
1.266151, -1.252488, 2.165016, 1, 1, 1, 1, 1,
1.267394, 0.8877786, 1.350263, 1, 1, 1, 1, 1,
1.276292, -0.3305049, 1.020669, 1, 1, 1, 1, 1,
1.284056, -0.3131706, 1.028345, 1, 1, 1, 1, 1,
1.289388, 0.9361115, 0.3244738, 1, 1, 1, 1, 1,
1.291344, -2.514758, 2.832561, 1, 1, 1, 1, 1,
1.293539, 1.475032, 0.1322847, 1, 1, 1, 1, 1,
1.310513, 0.1047526, 1.445264, 1, 1, 1, 1, 1,
1.310786, 0.7582208, 0.1467201, 1, 1, 1, 1, 1,
1.312284, -1.376789, 3.22972, 1, 1, 1, 1, 1,
1.312465, 1.497286, 1.372158, 1, 1, 1, 1, 1,
1.316885, -1.773444, 3.944187, 0, 0, 1, 1, 1,
1.31826, -0.8124561, 3.113542, 1, 0, 0, 1, 1,
1.321664, -1.152308, 2.042842, 1, 0, 0, 1, 1,
1.322978, 1.847819, 0.6639332, 1, 0, 0, 1, 1,
1.331719, -1.672579, 2.286143, 1, 0, 0, 1, 1,
1.33266, -0.5947939, 2.812083, 1, 0, 0, 1, 1,
1.338408, 0.7491894, 0.267954, 0, 0, 0, 1, 1,
1.340606, 0.7957191, 1.16302, 0, 0, 0, 1, 1,
1.345631, -0.4327506, 2.913645, 0, 0, 0, 1, 1,
1.350065, 0.5663556, 0.309769, 0, 0, 0, 1, 1,
1.354426, -1.2592, 1.698341, 0, 0, 0, 1, 1,
1.357754, -0.5474273, -0.2229264, 0, 0, 0, 1, 1,
1.360264, -0.7517319, 2.801954, 0, 0, 0, 1, 1,
1.364789, -0.826097, 2.676743, 1, 1, 1, 1, 1,
1.380626, -0.3839155, 3.775443, 1, 1, 1, 1, 1,
1.382942, -1.328424, 1.24771, 1, 1, 1, 1, 1,
1.385076, 0.0149251, 0.7222086, 1, 1, 1, 1, 1,
1.401684, -1.927859, 1.853122, 1, 1, 1, 1, 1,
1.405938, 0.235535, 2.341068, 1, 1, 1, 1, 1,
1.406399, -1.523051, 3.132058, 1, 1, 1, 1, 1,
1.40719, -0.6391228, 1.636517, 1, 1, 1, 1, 1,
1.408218, 0.2588241, 0.4122325, 1, 1, 1, 1, 1,
1.41131, 0.2524867, 1.040443, 1, 1, 1, 1, 1,
1.414216, 0.9692389, 0.9080427, 1, 1, 1, 1, 1,
1.426281, -0.7600523, 3.249014, 1, 1, 1, 1, 1,
1.427835, 0.1721015, 0.8808019, 1, 1, 1, 1, 1,
1.433078, 1.135661, -0.8857068, 1, 1, 1, 1, 1,
1.433716, -1.725243, 2.609506, 1, 1, 1, 1, 1,
1.442734, 0.04380347, 2.551075, 0, 0, 1, 1, 1,
1.452367, -0.9145808, 2.982726, 1, 0, 0, 1, 1,
1.456306, 0.6652398, -0.8347366, 1, 0, 0, 1, 1,
1.465259, 0.1442546, 0.8878443, 1, 0, 0, 1, 1,
1.469455, 0.9814001, 1.638427, 1, 0, 0, 1, 1,
1.480505, -0.2193166, 3.73417, 1, 0, 0, 1, 1,
1.489063, 1.210463, 1.967147, 0, 0, 0, 1, 1,
1.494681, 0.5350066, 1.81561, 0, 0, 0, 1, 1,
1.505038, -0.5644162, 3.425347, 0, 0, 0, 1, 1,
1.505583, 0.3038902, 1.416025, 0, 0, 0, 1, 1,
1.516803, 0.3661697, 2.524791, 0, 0, 0, 1, 1,
1.517179, 2.13926, 0.08212233, 0, 0, 0, 1, 1,
1.522213, -1.930724, 3.600965, 0, 0, 0, 1, 1,
1.522837, 0.3329822, 2.144659, 1, 1, 1, 1, 1,
1.534304, 1.17445, -0.1456629, 1, 1, 1, 1, 1,
1.537852, 0.05922426, 2.660213, 1, 1, 1, 1, 1,
1.54298, 0.3178364, 2.686044, 1, 1, 1, 1, 1,
1.544338, 0.8105909, 0.8568986, 1, 1, 1, 1, 1,
1.553685, 1.169863, 1.06417, 1, 1, 1, 1, 1,
1.562582, -0.5634214, 1.527695, 1, 1, 1, 1, 1,
1.575461, -1.533898, 1.952118, 1, 1, 1, 1, 1,
1.588832, 0.9219465, 2.05198, 1, 1, 1, 1, 1,
1.591427, 0.2009699, 1.797027, 1, 1, 1, 1, 1,
1.637862, 1.517953, -0.3817547, 1, 1, 1, 1, 1,
1.647303, 0.8649613, 1.423881, 1, 1, 1, 1, 1,
1.652035, 0.7724836, 0.6349168, 1, 1, 1, 1, 1,
1.657814, 0.3279322, 0.3680878, 1, 1, 1, 1, 1,
1.667954, 0.8410559, 0.08003822, 1, 1, 1, 1, 1,
1.676008, 1.181162, -0.1530078, 0, 0, 1, 1, 1,
1.682034, 0.4753675, 2.680455, 1, 0, 0, 1, 1,
1.703265, -0.1743966, 1.934732, 1, 0, 0, 1, 1,
1.704715, 1.816665, 2.63655, 1, 0, 0, 1, 1,
1.717072, 0.1649301, 1.903769, 1, 0, 0, 1, 1,
1.736937, 0.760096, 3.212117, 1, 0, 0, 1, 1,
1.739465, 0.6352712, 0.8438443, 0, 0, 0, 1, 1,
1.741117, 0.6380179, 0.2550157, 0, 0, 0, 1, 1,
1.741338, 0.1878688, 3.069909, 0, 0, 0, 1, 1,
1.772476, -0.8302723, 3.946933, 0, 0, 0, 1, 1,
1.786501, -0.4890321, 2.487956, 0, 0, 0, 1, 1,
1.803439, -0.08363363, 1.762347, 0, 0, 0, 1, 1,
1.822173, 0.4913698, 0.893371, 0, 0, 0, 1, 1,
1.839946, 0.3362788, 1.796119, 1, 1, 1, 1, 1,
1.846931, -0.5043956, 1.394327, 1, 1, 1, 1, 1,
1.851073, 0.6238487, 1.670744, 1, 1, 1, 1, 1,
1.852962, 1.207946, -0.2144835, 1, 1, 1, 1, 1,
1.855677, -0.249498, 1.631569, 1, 1, 1, 1, 1,
1.890004, 0.03071492, 0.2635024, 1, 1, 1, 1, 1,
1.908864, 0.495234, 4.532167, 1, 1, 1, 1, 1,
1.909196, 0.00539509, 1.471498, 1, 1, 1, 1, 1,
1.925313, 0.3768494, 3.111489, 1, 1, 1, 1, 1,
1.928011, -0.8558761, 0.3662561, 1, 1, 1, 1, 1,
1.933484, 0.2230084, 2.660024, 1, 1, 1, 1, 1,
1.967628, 0.07629693, 1.702223, 1, 1, 1, 1, 1,
1.969322, -2.172024, 1.808115, 1, 1, 1, 1, 1,
1.980727, -0.528253, 0.1934385, 1, 1, 1, 1, 1,
1.990597, -0.4110071, 1.582755, 1, 1, 1, 1, 1,
2.002196, 1.204197, 0.7834312, 0, 0, 1, 1, 1,
2.033824, -0.1441141, 1.889797, 1, 0, 0, 1, 1,
2.050513, 0.5014657, 2.249843, 1, 0, 0, 1, 1,
2.066508, 0.4223913, 3.776226, 1, 0, 0, 1, 1,
2.116809, 1.736455, 0.966056, 1, 0, 0, 1, 1,
2.134783, -1.152955, 2.774407, 1, 0, 0, 1, 1,
2.161764, -0.159898, 1.943245, 0, 0, 0, 1, 1,
2.185335, 0.1383794, 3.647289, 0, 0, 0, 1, 1,
2.185776, 0.609474, 0.7469045, 0, 0, 0, 1, 1,
2.273774, -0.6620284, 0.6455509, 0, 0, 0, 1, 1,
2.312863, 1.478658, -0.5961607, 0, 0, 0, 1, 1,
2.371249, -1.414231, 3.634872, 0, 0, 0, 1, 1,
2.406336, -0.2340287, 2.402281, 0, 0, 0, 1, 1,
2.452531, -0.8707396, 1.951922, 1, 1, 1, 1, 1,
2.668998, -1.399871, 3.120621, 1, 1, 1, 1, 1,
2.802371, 1.053757, 0.056761, 1, 1, 1, 1, 1,
2.948797, -0.4426073, 2.799037, 1, 1, 1, 1, 1,
3.493673, 1.737084, -0.7150815, 1, 1, 1, 1, 1,
3.785962, -0.4003918, 1.363705, 1, 1, 1, 1, 1,
3.889574, 0.5421289, 2.973078, 1, 1, 1, 1, 1
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
var radius = 9.661269;
var distance = 33.9348;
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
mvMatrix.translate( -0.6298935, 0.01241899, -0.169287 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.9348);
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
