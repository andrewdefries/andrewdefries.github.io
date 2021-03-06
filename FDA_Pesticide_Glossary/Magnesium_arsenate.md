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
-3.106335, -0.8437198, -1.858788, 1, 0, 0, 1,
-3.004445, -1.760824, -1.655334, 1, 0.007843138, 0, 1,
-2.78392, -0.1349197, -1.513852, 1, 0.01176471, 0, 1,
-2.724714, -1.032035, -0.4474806, 1, 0.01960784, 0, 1,
-2.621638, 1.079521, 0.1792976, 1, 0.02352941, 0, 1,
-2.513176, -0.449725, -0.9058647, 1, 0.03137255, 0, 1,
-2.467275, -1.31739, -2.058211, 1, 0.03529412, 0, 1,
-2.389131, 0.932278, -1.008653, 1, 0.04313726, 0, 1,
-2.363057, -0.8973733, -2.867549, 1, 0.04705882, 0, 1,
-2.302555, 1.835655, 0.4892074, 1, 0.05490196, 0, 1,
-2.282381, -1.127642, -2.021508, 1, 0.05882353, 0, 1,
-2.17608, -1.373, -1.321136, 1, 0.06666667, 0, 1,
-2.167878, 0.7703273, -2.056489, 1, 0.07058824, 0, 1,
-2.122886, 0.128116, -0.9246158, 1, 0.07843138, 0, 1,
-2.114872, -2.365975, -3.516439, 1, 0.08235294, 0, 1,
-2.069782, -0.1113434, -2.065775, 1, 0.09019608, 0, 1,
-2.04453, 0.0360846, -1.075032, 1, 0.09411765, 0, 1,
-2.025567, 0.4392414, -0.030397, 1, 0.1019608, 0, 1,
-2.024333, 0.3133438, -2.79091, 1, 0.1098039, 0, 1,
-2.008919, -1.301063, -2.605573, 1, 0.1137255, 0, 1,
-1.998593, 0.7014503, 0.7757749, 1, 0.1215686, 0, 1,
-1.922603, -2.751111, -0.9598289, 1, 0.1254902, 0, 1,
-1.917779, -0.1091428, -2.975751, 1, 0.1333333, 0, 1,
-1.912845, -0.3073842, -2.829339, 1, 0.1372549, 0, 1,
-1.909328, 1.329372, -3.017841, 1, 0.145098, 0, 1,
-1.888288, -0.5075957, -3.670637, 1, 0.1490196, 0, 1,
-1.862396, -0.6400706, -1.969107, 1, 0.1568628, 0, 1,
-1.862117, -0.5397666, -3.482577, 1, 0.1607843, 0, 1,
-1.841717, -0.1693773, -2.137978, 1, 0.1686275, 0, 1,
-1.836852, -0.5428102, -2.078825, 1, 0.172549, 0, 1,
-1.828374, 0.5006925, -1.288666, 1, 0.1803922, 0, 1,
-1.826253, 0.6607574, -1.12088, 1, 0.1843137, 0, 1,
-1.815261, 2.888672, -0.8973522, 1, 0.1921569, 0, 1,
-1.788828, 1.428908, -1.568006, 1, 0.1960784, 0, 1,
-1.767542, 0.5044017, -0.05035936, 1, 0.2039216, 0, 1,
-1.766834, -0.3763976, 1.243048, 1, 0.2117647, 0, 1,
-1.758186, 0.1868117, -2.847308, 1, 0.2156863, 0, 1,
-1.757475, -0.1630981, -0.0788838, 1, 0.2235294, 0, 1,
-1.746521, 0.3285461, -1.900361, 1, 0.227451, 0, 1,
-1.745174, 0.4449137, -1.061946, 1, 0.2352941, 0, 1,
-1.736494, 0.9134549, 0.1595488, 1, 0.2392157, 0, 1,
-1.732163, -1.557616, -1.399732, 1, 0.2470588, 0, 1,
-1.730509, 0.3116024, -3.163465, 1, 0.2509804, 0, 1,
-1.715073, 0.4633802, -1.013432, 1, 0.2588235, 0, 1,
-1.701754, 0.1614857, -1.171118, 1, 0.2627451, 0, 1,
-1.69555, 0.125797, -2.669794, 1, 0.2705882, 0, 1,
-1.684475, 0.484184, -2.100709, 1, 0.2745098, 0, 1,
-1.678863, 0.09867901, -0.5639725, 1, 0.282353, 0, 1,
-1.670442, 0.4017586, -0.4963863, 1, 0.2862745, 0, 1,
-1.665581, 0.3629363, -0.5173232, 1, 0.2941177, 0, 1,
-1.662291, 0.3000131, -1.030208, 1, 0.3019608, 0, 1,
-1.627449, 0.6938102, -2.530117, 1, 0.3058824, 0, 1,
-1.626462, 0.717652, -0.3537383, 1, 0.3137255, 0, 1,
-1.62252, -0.1565858, -1.871279, 1, 0.3176471, 0, 1,
-1.618488, -0.084584, -1.253855, 1, 0.3254902, 0, 1,
-1.607545, 1.920554, 0.5498823, 1, 0.3294118, 0, 1,
-1.562652, 0.1015431, -3.106155, 1, 0.3372549, 0, 1,
-1.56207, 1.670871, 0.2688468, 1, 0.3411765, 0, 1,
-1.555137, -0.1976292, -2.974192, 1, 0.3490196, 0, 1,
-1.536642, 0.04113282, -1.325269, 1, 0.3529412, 0, 1,
-1.529111, 0.3518268, -0.761107, 1, 0.3607843, 0, 1,
-1.528841, -0.1994774, -2.072338, 1, 0.3647059, 0, 1,
-1.49837, -0.8653116, -1.276709, 1, 0.372549, 0, 1,
-1.483122, -0.2528441, -0.696525, 1, 0.3764706, 0, 1,
-1.482385, -0.7259151, -2.490491, 1, 0.3843137, 0, 1,
-1.471, -0.1374627, -1.77092, 1, 0.3882353, 0, 1,
-1.470618, 2.416104, -0.09184027, 1, 0.3960784, 0, 1,
-1.459018, -1.049867, -1.791853, 1, 0.4039216, 0, 1,
-1.444712, 0.6102926, 0.9617071, 1, 0.4078431, 0, 1,
-1.441899, -0.5887612, -1.859052, 1, 0.4156863, 0, 1,
-1.440968, -0.5997825, -2.408622, 1, 0.4196078, 0, 1,
-1.436744, -2.30536, -1.075162, 1, 0.427451, 0, 1,
-1.428503, -0.2493344, -2.277476, 1, 0.4313726, 0, 1,
-1.428123, 0.6538581, -1.261027, 1, 0.4392157, 0, 1,
-1.423307, -3.049821, -1.655621, 1, 0.4431373, 0, 1,
-1.414188, -1.091662, -2.827712, 1, 0.4509804, 0, 1,
-1.39782, 3.335549, 0.0694878, 1, 0.454902, 0, 1,
-1.393019, 0.1105527, -1.363093, 1, 0.4627451, 0, 1,
-1.373683, 0.8145549, -0.8111282, 1, 0.4666667, 0, 1,
-1.372395, 1.08475, 0.05143515, 1, 0.4745098, 0, 1,
-1.357665, -0.6844646, -1.946447, 1, 0.4784314, 0, 1,
-1.353395, 2.145786, -2.467237, 1, 0.4862745, 0, 1,
-1.344365, 0.6841099, -0.8539279, 1, 0.4901961, 0, 1,
-1.339075, -1.285149, -2.15848, 1, 0.4980392, 0, 1,
-1.331716, -0.3114202, -0.6370559, 1, 0.5058824, 0, 1,
-1.33129, -1.728735, -1.537454, 1, 0.509804, 0, 1,
-1.326811, 0.2807613, -2.106403, 1, 0.5176471, 0, 1,
-1.323977, -0.06260882, -1.988011, 1, 0.5215687, 0, 1,
-1.320969, 0.01824112, -1.609974, 1, 0.5294118, 0, 1,
-1.299453, 0.3167847, -0.9432492, 1, 0.5333334, 0, 1,
-1.293566, 0.0499439, -1.474979, 1, 0.5411765, 0, 1,
-1.279482, -1.198308, -2.061649, 1, 0.5450981, 0, 1,
-1.275901, 0.7735366, -1.348988, 1, 0.5529412, 0, 1,
-1.273518, -0.5453213, -2.858902, 1, 0.5568628, 0, 1,
-1.258046, 0.6146514, -1.64563, 1, 0.5647059, 0, 1,
-1.244155, 0.05161736, -0.6690043, 1, 0.5686275, 0, 1,
-1.22945, -0.7804101, -1.849708, 1, 0.5764706, 0, 1,
-1.222743, -0.4804002, -1.893196, 1, 0.5803922, 0, 1,
-1.221265, 0.9738856, -1.86951, 1, 0.5882353, 0, 1,
-1.216553, 2.841152, -0.2628511, 1, 0.5921569, 0, 1,
-1.212439, -0.1816064, -2.237155, 1, 0.6, 0, 1,
-1.212225, -0.002487391, 0.3907973, 1, 0.6078432, 0, 1,
-1.20999, 0.374611, -1.016667, 1, 0.6117647, 0, 1,
-1.202834, 0.3169516, 1.132001, 1, 0.6196079, 0, 1,
-1.202307, -0.03472282, -0.3270321, 1, 0.6235294, 0, 1,
-1.201423, -0.04924378, -1.992863, 1, 0.6313726, 0, 1,
-1.192094, -0.1745706, -3.662366, 1, 0.6352941, 0, 1,
-1.189964, -0.06143184, -1.678948, 1, 0.6431373, 0, 1,
-1.189476, 0.5075916, -1.395598, 1, 0.6470588, 0, 1,
-1.186457, 0.04486949, -0.3640819, 1, 0.654902, 0, 1,
-1.181523, 1.166144, -1.885049, 1, 0.6588235, 0, 1,
-1.172475, -0.5050174, -1.38295, 1, 0.6666667, 0, 1,
-1.147777, 0.511456, -1.093816, 1, 0.6705883, 0, 1,
-1.137518, -1.15014, -4.44528, 1, 0.6784314, 0, 1,
-1.135846, -0.9289451, -2.912636, 1, 0.682353, 0, 1,
-1.13002, -1.233189, -1.026933, 1, 0.6901961, 0, 1,
-1.127993, -0.1651458, -2.762064, 1, 0.6941177, 0, 1,
-1.124837, -1.185693, -1.517408, 1, 0.7019608, 0, 1,
-1.113341, -2.220598, -3.45045, 1, 0.7098039, 0, 1,
-1.108122, 0.3936894, -0.6269164, 1, 0.7137255, 0, 1,
-1.106861, 0.3120285, -1.213325, 1, 0.7215686, 0, 1,
-1.10637, 0.5380545, -1.717167, 1, 0.7254902, 0, 1,
-1.101991, 1.412552, -1.758882, 1, 0.7333333, 0, 1,
-1.101365, 1.349521, 0.2016213, 1, 0.7372549, 0, 1,
-1.087653, -0.633397, -1.07956, 1, 0.7450981, 0, 1,
-1.086896, -1.016526, -2.4038, 1, 0.7490196, 0, 1,
-1.084216, -1.70705, -2.979421, 1, 0.7568628, 0, 1,
-1.072832, -0.2584696, -1.347317, 1, 0.7607843, 0, 1,
-1.072214, -0.06663977, -0.128497, 1, 0.7686275, 0, 1,
-1.070974, 1.434631, 0.1093834, 1, 0.772549, 0, 1,
-1.070555, -1.292817, 0.03362529, 1, 0.7803922, 0, 1,
-1.067916, 1.322469, -1.593, 1, 0.7843137, 0, 1,
-1.064589, -0.225599, 0.6280019, 1, 0.7921569, 0, 1,
-1.060035, 1.60348, 0.6190836, 1, 0.7960784, 0, 1,
-1.05784, 0.6033629, -2.458453, 1, 0.8039216, 0, 1,
-1.052717, -1.073396, -1.062445, 1, 0.8117647, 0, 1,
-1.052203, -0.9219487, -1.569701, 1, 0.8156863, 0, 1,
-1.03551, 0.342986, -2.204634, 1, 0.8235294, 0, 1,
-1.032646, 0.3150251, 1.07466, 1, 0.827451, 0, 1,
-1.024427, 1.137704, -0.7605575, 1, 0.8352941, 0, 1,
-1.024218, -0.9012063, -0.9748635, 1, 0.8392157, 0, 1,
-1.020565, -1.288728, -2.302945, 1, 0.8470588, 0, 1,
-1.018408, 2.227851, -0.4607168, 1, 0.8509804, 0, 1,
-1.016857, -0.5749898, -1.746105, 1, 0.8588235, 0, 1,
-1.014755, -0.2597836, -1.983096, 1, 0.8627451, 0, 1,
-0.9964451, 1.045526, -0.1789433, 1, 0.8705882, 0, 1,
-0.9793714, 2.171603, 2.38026, 1, 0.8745098, 0, 1,
-0.9773172, -0.6843435, -2.586458, 1, 0.8823529, 0, 1,
-0.9759336, -0.5061145, -3.204242, 1, 0.8862745, 0, 1,
-0.972698, -0.7654489, -5.340407, 1, 0.8941177, 0, 1,
-0.972432, 1.896702, -0.01305718, 1, 0.8980392, 0, 1,
-0.9681495, -0.1059055, -0.2661535, 1, 0.9058824, 0, 1,
-0.9570405, -0.4187405, -1.676312, 1, 0.9137255, 0, 1,
-0.9555347, -0.586484, -2.599932, 1, 0.9176471, 0, 1,
-0.9488328, -0.6170666, -2.503698, 1, 0.9254902, 0, 1,
-0.9470966, -0.2268151, -1.505109, 1, 0.9294118, 0, 1,
-0.9460794, 0.8037391, -1.180033, 1, 0.9372549, 0, 1,
-0.9456631, 0.07949492, -2.558136, 1, 0.9411765, 0, 1,
-0.9333757, 1.113588, -0.3480614, 1, 0.9490196, 0, 1,
-0.9293221, -0.6723583, -3.501596, 1, 0.9529412, 0, 1,
-0.9227905, -1.195726, -2.820771, 1, 0.9607843, 0, 1,
-0.9195676, 0.03935, -1.528779, 1, 0.9647059, 0, 1,
-0.919527, -0.9909517, -2.56149, 1, 0.972549, 0, 1,
-0.909126, 0.3817574, -1.199106, 1, 0.9764706, 0, 1,
-0.9045886, 1.131323, -1.329002, 1, 0.9843137, 0, 1,
-0.8936594, -0.1449721, -1.82079, 1, 0.9882353, 0, 1,
-0.8862173, 0.885314, -0.5077315, 1, 0.9960784, 0, 1,
-0.8856891, -2.560118, -2.094437, 0.9960784, 1, 0, 1,
-0.8829967, 0.964039, -0.711293, 0.9921569, 1, 0, 1,
-0.8765965, -0.9189447, -2.357164, 0.9843137, 1, 0, 1,
-0.8731986, 0.2479182, -1.612366, 0.9803922, 1, 0, 1,
-0.8715112, 0.7190511, 0.01291615, 0.972549, 1, 0, 1,
-0.8677571, 0.4651566, -1.454797, 0.9686275, 1, 0, 1,
-0.8652136, 0.2788472, -0.2113257, 0.9607843, 1, 0, 1,
-0.8603092, -0.170689, -1.344887, 0.9568627, 1, 0, 1,
-0.8596988, -0.7411937, -2.643184, 0.9490196, 1, 0, 1,
-0.8569222, 0.9955211, -0.4581114, 0.945098, 1, 0, 1,
-0.8567072, -1.163711, -4.273119, 0.9372549, 1, 0, 1,
-0.8467925, 0.4708883, -1.641417, 0.9333333, 1, 0, 1,
-0.8462512, 1.28909, -1.215226, 0.9254902, 1, 0, 1,
-0.8433877, -0.7314626, -2.89959, 0.9215686, 1, 0, 1,
-0.8424596, 0.1613468, -2.766426, 0.9137255, 1, 0, 1,
-0.8402146, 0.4509895, -1.618186, 0.9098039, 1, 0, 1,
-0.8399912, -0.6348299, -1.655595, 0.9019608, 1, 0, 1,
-0.8399807, 0.2266334, -2.342276, 0.8941177, 1, 0, 1,
-0.8322972, 0.8244976, 0.6372374, 0.8901961, 1, 0, 1,
-0.8318207, -0.8001416, -0.9763081, 0.8823529, 1, 0, 1,
-0.826229, -1.174549, -3.834411, 0.8784314, 1, 0, 1,
-0.8245254, -0.208398, -2.289457, 0.8705882, 1, 0, 1,
-0.8217283, 0.4416451, -0.7733294, 0.8666667, 1, 0, 1,
-0.8096746, 0.6549297, -1.13358, 0.8588235, 1, 0, 1,
-0.8092423, 1.573227, -1.788742, 0.854902, 1, 0, 1,
-0.8083118, 0.177553, -1.224675, 0.8470588, 1, 0, 1,
-0.8048406, -1.189071, -2.083681, 0.8431373, 1, 0, 1,
-0.8045808, 0.5207419, -1.07979, 0.8352941, 1, 0, 1,
-0.8020191, 0.3728849, -0.6964266, 0.8313726, 1, 0, 1,
-0.7953466, -1.274269, -1.459948, 0.8235294, 1, 0, 1,
-0.7886449, 1.255988, -2.074239, 0.8196079, 1, 0, 1,
-0.787819, -1.399725, -2.815502, 0.8117647, 1, 0, 1,
-0.7827311, -2.720649, -1.785009, 0.8078431, 1, 0, 1,
-0.7816561, -1.075017, -1.790871, 0.8, 1, 0, 1,
-0.7816389, -0.4382694, -1.864625, 0.7921569, 1, 0, 1,
-0.7783759, -0.0141386, -1.139965, 0.7882353, 1, 0, 1,
-0.7777085, -0.5200009, -2.074328, 0.7803922, 1, 0, 1,
-0.7753347, 1.043201, 0.156304, 0.7764706, 1, 0, 1,
-0.7714441, -0.1928947, -1.101294, 0.7686275, 1, 0, 1,
-0.7623532, 0.8041889, -1.04566, 0.7647059, 1, 0, 1,
-0.7583785, 1.189857, 0.9578515, 0.7568628, 1, 0, 1,
-0.7558595, -1.297098, -2.775169, 0.7529412, 1, 0, 1,
-0.7491951, -1.064538, -2.326908, 0.7450981, 1, 0, 1,
-0.7457365, -0.0002852411, -1.784901, 0.7411765, 1, 0, 1,
-0.7446802, 0.9695678, -0.3879808, 0.7333333, 1, 0, 1,
-0.7445679, -1.531296, -2.753502, 0.7294118, 1, 0, 1,
-0.7426818, -0.5277017, -1.080292, 0.7215686, 1, 0, 1,
-0.74185, -1.528621, -3.002953, 0.7176471, 1, 0, 1,
-0.7399392, 0.8683422, 0.03730766, 0.7098039, 1, 0, 1,
-0.7312977, 0.6938924, -1.535933, 0.7058824, 1, 0, 1,
-0.729823, -0.5966375, -1.513012, 0.6980392, 1, 0, 1,
-0.7252636, -0.741644, -3.171066, 0.6901961, 1, 0, 1,
-0.7224897, -1.592891, -3.178614, 0.6862745, 1, 0, 1,
-0.7214664, 0.9488578, -1.039911, 0.6784314, 1, 0, 1,
-0.7202372, -2.150639, -3.776405, 0.6745098, 1, 0, 1,
-0.7123194, 0.3607127, -0.7609578, 0.6666667, 1, 0, 1,
-0.7108969, -0.2809128, -2.678644, 0.6627451, 1, 0, 1,
-0.7087192, 2.253925, 1.881444, 0.654902, 1, 0, 1,
-0.7071289, -0.9882883, -2.784238, 0.6509804, 1, 0, 1,
-0.7031266, 0.6926693, 0.901767, 0.6431373, 1, 0, 1,
-0.7013468, -0.5723814, -2.253383, 0.6392157, 1, 0, 1,
-0.6997671, -1.652607, -2.57394, 0.6313726, 1, 0, 1,
-0.6951125, 1.153735, -1.775592, 0.627451, 1, 0, 1,
-0.6934366, 0.8649106, -0.1621336, 0.6196079, 1, 0, 1,
-0.6832573, 0.07745618, -1.338179, 0.6156863, 1, 0, 1,
-0.6828409, 1.185507, -1.08472, 0.6078432, 1, 0, 1,
-0.6756568, 0.7176874, -0.3323302, 0.6039216, 1, 0, 1,
-0.6734307, -0.4514431, -1.398892, 0.5960785, 1, 0, 1,
-0.6722238, -0.9088671, -1.263827, 0.5882353, 1, 0, 1,
-0.6650857, 0.4712527, -1.429221, 0.5843138, 1, 0, 1,
-0.6572028, -0.4112134, -2.915535, 0.5764706, 1, 0, 1,
-0.6549621, 0.01597261, -1.580042, 0.572549, 1, 0, 1,
-0.6532899, 0.9580676, -0.982836, 0.5647059, 1, 0, 1,
-0.6521469, 0.166896, -1.218691, 0.5607843, 1, 0, 1,
-0.6432534, -0.8476869, -1.953525, 0.5529412, 1, 0, 1,
-0.6416573, -0.9453233, -2.342645, 0.5490196, 1, 0, 1,
-0.6412913, 1.097579, -1.207801, 0.5411765, 1, 0, 1,
-0.6397384, -1.787924, -2.600516, 0.5372549, 1, 0, 1,
-0.6394756, 0.514259, -0.8151546, 0.5294118, 1, 0, 1,
-0.6329231, -2.371886, -3.935651, 0.5254902, 1, 0, 1,
-0.6323461, 1.757429, -0.1266851, 0.5176471, 1, 0, 1,
-0.6310446, 2.001029, -1.461722, 0.5137255, 1, 0, 1,
-0.6305879, -0.840363, -2.018487, 0.5058824, 1, 0, 1,
-0.6278661, -0.6150021, -2.002888, 0.5019608, 1, 0, 1,
-0.6219133, -0.4164979, -1.030138, 0.4941176, 1, 0, 1,
-0.6146312, 0.7654508, 0.09443089, 0.4862745, 1, 0, 1,
-0.6103702, -0.9964553, -2.569144, 0.4823529, 1, 0, 1,
-0.6101008, -0.1746213, -2.626861, 0.4745098, 1, 0, 1,
-0.60865, -1.800662, -2.194445, 0.4705882, 1, 0, 1,
-0.6064747, -0.3369733, -2.234138, 0.4627451, 1, 0, 1,
-0.6061878, 1.213049, -0.9141374, 0.4588235, 1, 0, 1,
-0.6039555, -0.315514, -1.42148, 0.4509804, 1, 0, 1,
-0.6025893, -0.6456772, -2.184938, 0.4470588, 1, 0, 1,
-0.6005815, 0.2656549, -1.823424, 0.4392157, 1, 0, 1,
-0.5995604, -1.302774, -3.763386, 0.4352941, 1, 0, 1,
-0.5988765, -0.7915505, -3.976948, 0.427451, 1, 0, 1,
-0.5886708, 1.627008, 0.7745566, 0.4235294, 1, 0, 1,
-0.5802611, 0.4874938, 0.3223121, 0.4156863, 1, 0, 1,
-0.5780532, 0.000123283, -2.289739, 0.4117647, 1, 0, 1,
-0.5753514, -1.010061, -4.587709, 0.4039216, 1, 0, 1,
-0.5751096, 0.04659958, 0.2032602, 0.3960784, 1, 0, 1,
-0.5685573, 1.248354, -0.3323985, 0.3921569, 1, 0, 1,
-0.5623984, -0.3374155, -2.657947, 0.3843137, 1, 0, 1,
-0.5597522, 0.7057089, -2.592625, 0.3803922, 1, 0, 1,
-0.5586733, -0.647998, -2.658874, 0.372549, 1, 0, 1,
-0.5583541, -0.2348511, -2.490556, 0.3686275, 1, 0, 1,
-0.5569555, 0.1178744, -1.34338, 0.3607843, 1, 0, 1,
-0.5534122, 2.7025, 0.4002944, 0.3568628, 1, 0, 1,
-0.5508151, 0.7388899, -1.233857, 0.3490196, 1, 0, 1,
-0.5446729, 0.7636343, -1.244699, 0.345098, 1, 0, 1,
-0.5404844, 0.5207245, -1.030311, 0.3372549, 1, 0, 1,
-0.5373411, 0.1831015, -0.7069055, 0.3333333, 1, 0, 1,
-0.536607, -0.08194014, -1.115041, 0.3254902, 1, 0, 1,
-0.5281721, -0.0898497, 0.2274735, 0.3215686, 1, 0, 1,
-0.5259956, 0.4737633, -1.047616, 0.3137255, 1, 0, 1,
-0.5255102, 0.04335571, -2.67976, 0.3098039, 1, 0, 1,
-0.5247594, -0.04953046, -1.970322, 0.3019608, 1, 0, 1,
-0.5220427, -0.4009586, -1.898158, 0.2941177, 1, 0, 1,
-0.5213091, -0.9140601, -3.835004, 0.2901961, 1, 0, 1,
-0.5193412, 0.3442298, -0.8154504, 0.282353, 1, 0, 1,
-0.5150343, 0.04368403, 0.07856931, 0.2784314, 1, 0, 1,
-0.5127371, -1.324492, -3.237256, 0.2705882, 1, 0, 1,
-0.5120904, -0.9368849, -2.710343, 0.2666667, 1, 0, 1,
-0.5100902, -1.819854, -3.216465, 0.2588235, 1, 0, 1,
-0.5072039, -1.281517, -1.719492, 0.254902, 1, 0, 1,
-0.5007254, -0.8915107, -2.848955, 0.2470588, 1, 0, 1,
-0.4981466, -0.2046794, -4.358293, 0.2431373, 1, 0, 1,
-0.4952244, -1.489695, -4.055086, 0.2352941, 1, 0, 1,
-0.492999, 1.520525, 0.6293341, 0.2313726, 1, 0, 1,
-0.4928389, -0.02509275, 0.03799146, 0.2235294, 1, 0, 1,
-0.4906284, -0.1259527, -0.5917489, 0.2196078, 1, 0, 1,
-0.4902768, -1.166304, -0.7760009, 0.2117647, 1, 0, 1,
-0.4888095, -0.04926795, -1.53932, 0.2078431, 1, 0, 1,
-0.4883494, -1.198117, -2.599989, 0.2, 1, 0, 1,
-0.4865321, 0.3837667, -0.2120098, 0.1921569, 1, 0, 1,
-0.4794993, 1.364279, -1.302126, 0.1882353, 1, 0, 1,
-0.4788921, 0.4774318, 0.2248513, 0.1803922, 1, 0, 1,
-0.476992, 0.02872234, -0.47401, 0.1764706, 1, 0, 1,
-0.4759858, -0.09584936, -1.360079, 0.1686275, 1, 0, 1,
-0.4725306, -1.257282, -3.949857, 0.1647059, 1, 0, 1,
-0.4725186, 0.5969728, -0.3881502, 0.1568628, 1, 0, 1,
-0.4714287, 0.7189326, -0.7567527, 0.1529412, 1, 0, 1,
-0.4696915, -0.991296, -2.978509, 0.145098, 1, 0, 1,
-0.4696539, -0.1991631, -3.020193, 0.1411765, 1, 0, 1,
-0.4694896, 1.844878, -0.2334428, 0.1333333, 1, 0, 1,
-0.4689704, 0.3772173, -0.4794739, 0.1294118, 1, 0, 1,
-0.4683937, 1.351863, -2.020701, 0.1215686, 1, 0, 1,
-0.4658903, 0.5893884, -0.965684, 0.1176471, 1, 0, 1,
-0.4626005, -0.1088316, -3.172937, 0.1098039, 1, 0, 1,
-0.46236, 0.163069, -1.396924, 0.1058824, 1, 0, 1,
-0.4579507, 1.829384, -0.6516213, 0.09803922, 1, 0, 1,
-0.4562923, 0.4591565, -1.510801, 0.09019608, 1, 0, 1,
-0.455712, -0.3055375, -3.498267, 0.08627451, 1, 0, 1,
-0.4540213, 1.097966, -1.398012, 0.07843138, 1, 0, 1,
-0.453627, 2.522512, -1.646706, 0.07450981, 1, 0, 1,
-0.453613, 1.400913, -0.6559802, 0.06666667, 1, 0, 1,
-0.4514355, -0.4932849, -2.91518, 0.0627451, 1, 0, 1,
-0.4508391, -0.05998607, -1.128604, 0.05490196, 1, 0, 1,
-0.4483894, -1.093352, -2.529829, 0.05098039, 1, 0, 1,
-0.4441103, 1.235585, 0.5573547, 0.04313726, 1, 0, 1,
-0.442383, 0.2954949, -0.7203048, 0.03921569, 1, 0, 1,
-0.438101, -0.9687518, -1.800007, 0.03137255, 1, 0, 1,
-0.4299844, -0.5160955, -3.371744, 0.02745098, 1, 0, 1,
-0.4279093, 1.440014, -1.459528, 0.01960784, 1, 0, 1,
-0.4273461, -0.5632166, -2.766348, 0.01568628, 1, 0, 1,
-0.4249698, -0.8375458, -3.266933, 0.007843138, 1, 0, 1,
-0.4222564, -0.6926779, -2.768198, 0.003921569, 1, 0, 1,
-0.4169774, 1.038103, 0.6306356, 0, 1, 0.003921569, 1,
-0.4157915, 0.4149062, -1.293839, 0, 1, 0.01176471, 1,
-0.4143698, -0.15408, -3.700821, 0, 1, 0.01568628, 1,
-0.4058871, 1.931376, -0.3239449, 0, 1, 0.02352941, 1,
-0.4036077, 0.9136419, -0.05296193, 0, 1, 0.02745098, 1,
-0.3955552, -1.069343, -0.7064388, 0, 1, 0.03529412, 1,
-0.3946223, -0.09318663, -2.219035, 0, 1, 0.03921569, 1,
-0.3941875, 0.8898076, 1.041233, 0, 1, 0.04705882, 1,
-0.3922817, 0.7722663, 0.8287315, 0, 1, 0.05098039, 1,
-0.3911827, 0.6188036, -1.033992, 0, 1, 0.05882353, 1,
-0.3884217, 1.283871, -0.3470605, 0, 1, 0.0627451, 1,
-0.3862101, 1.551316, 0.8098127, 0, 1, 0.07058824, 1,
-0.3838073, 0.4228661, -0.3070185, 0, 1, 0.07450981, 1,
-0.3831471, 1.168647, 1.191175, 0, 1, 0.08235294, 1,
-0.3673482, -2.172457, -3.599688, 0, 1, 0.08627451, 1,
-0.3663995, -0.4599383, -2.884908, 0, 1, 0.09411765, 1,
-0.3657531, 0.4007203, -0.4255361, 0, 1, 0.1019608, 1,
-0.3651537, 0.08284371, -2.091578, 0, 1, 0.1058824, 1,
-0.3646928, 0.1363797, -0.1759169, 0, 1, 0.1137255, 1,
-0.3563597, -0.597287, -0.8939775, 0, 1, 0.1176471, 1,
-0.3557867, 0.909111, 0.7574978, 0, 1, 0.1254902, 1,
-0.3548681, -1.507657, -2.78839, 0, 1, 0.1294118, 1,
-0.3484176, 0.563774, -0.07925174, 0, 1, 0.1372549, 1,
-0.3484124, 0.3531619, -1.709671, 0, 1, 0.1411765, 1,
-0.3478307, 0.8074896, 1.422792, 0, 1, 0.1490196, 1,
-0.3476242, 1.70707, 0.6899008, 0, 1, 0.1529412, 1,
-0.345815, -0.3539089, -0.6527998, 0, 1, 0.1607843, 1,
-0.3445722, -1.804931, -2.671165, 0, 1, 0.1647059, 1,
-0.3412913, 1.768557, 1.606559, 0, 1, 0.172549, 1,
-0.3380756, 1.506379, -0.6950011, 0, 1, 0.1764706, 1,
-0.337595, -1.480841, -1.677426, 0, 1, 0.1843137, 1,
-0.3361597, 1.453545, 0.09644399, 0, 1, 0.1882353, 1,
-0.3348123, 0.8133088, -1.753723, 0, 1, 0.1960784, 1,
-0.3332326, 0.7356646, -0.5994429, 0, 1, 0.2039216, 1,
-0.3320255, 0.6759868, 0.4530214, 0, 1, 0.2078431, 1,
-0.3306762, 0.9239224, -0.1376936, 0, 1, 0.2156863, 1,
-0.3212357, -0.5431978, -2.747684, 0, 1, 0.2196078, 1,
-0.319378, 0.2351751, -1.754621, 0, 1, 0.227451, 1,
-0.3192666, -0.9391496, -3.961835, 0, 1, 0.2313726, 1,
-0.3167742, 0.9112647, -1.687023, 0, 1, 0.2392157, 1,
-0.3145573, -1.594293, -4.449421, 0, 1, 0.2431373, 1,
-0.3139958, 0.6336417, -2.034194, 0, 1, 0.2509804, 1,
-0.3118182, 0.3726859, -1.009289, 0, 1, 0.254902, 1,
-0.3109112, -0.5934573, -2.844467, 0, 1, 0.2627451, 1,
-0.3099777, 0.8458008, -1.32702, 0, 1, 0.2666667, 1,
-0.3049968, -1.020059, -3.024794, 0, 1, 0.2745098, 1,
-0.3006361, -0.8623843, -0.347066, 0, 1, 0.2784314, 1,
-0.2997578, 0.5934095, 0.2398586, 0, 1, 0.2862745, 1,
-0.2956986, 1.309979, 0.4782297, 0, 1, 0.2901961, 1,
-0.2903052, 0.1301122, -0.8470794, 0, 1, 0.2980392, 1,
-0.290091, -0.6215286, -1.49608, 0, 1, 0.3058824, 1,
-0.2894364, 0.03709805, -2.33533, 0, 1, 0.3098039, 1,
-0.2881398, 1.572756, 0.4849666, 0, 1, 0.3176471, 1,
-0.2838319, -1.357833, -3.808882, 0, 1, 0.3215686, 1,
-0.2820757, 0.820262, -2.888211, 0, 1, 0.3294118, 1,
-0.2809173, -0.515057, -1.739938, 0, 1, 0.3333333, 1,
-0.2793523, -1.146925, -2.565193, 0, 1, 0.3411765, 1,
-0.2792875, 0.7243433, -0.3305848, 0, 1, 0.345098, 1,
-0.2759832, 1.584212, -0.5521392, 0, 1, 0.3529412, 1,
-0.2709813, 0.9402506, 0.007611436, 0, 1, 0.3568628, 1,
-0.2708617, 0.8114836, 0.4746703, 0, 1, 0.3647059, 1,
-0.2690711, 0.2062031, 0.4047179, 0, 1, 0.3686275, 1,
-0.2604873, -0.4667838, -1.399949, 0, 1, 0.3764706, 1,
-0.2585542, 0.2023323, -0.1676971, 0, 1, 0.3803922, 1,
-0.254242, -0.332788, -1.960343, 0, 1, 0.3882353, 1,
-0.2528492, 0.1264261, -1.084021, 0, 1, 0.3921569, 1,
-0.2500951, 1.724628, 0.1508079, 0, 1, 0.4, 1,
-0.2493901, 0.8206246, -0.7624133, 0, 1, 0.4078431, 1,
-0.2450615, -0.9770087, -2.185114, 0, 1, 0.4117647, 1,
-0.243881, -1.092567, -2.926624, 0, 1, 0.4196078, 1,
-0.2409169, -0.04936165, -2.127052, 0, 1, 0.4235294, 1,
-0.240001, 1.5966, 0.9807692, 0, 1, 0.4313726, 1,
-0.238554, 0.2650597, -1.18392, 0, 1, 0.4352941, 1,
-0.2366589, 0.001063716, -0.3928169, 0, 1, 0.4431373, 1,
-0.234617, 0.01569382, -2.231978, 0, 1, 0.4470588, 1,
-0.2301938, -0.3280776, -3.588855, 0, 1, 0.454902, 1,
-0.2299921, 0.5524171, 0.281525, 0, 1, 0.4588235, 1,
-0.2277982, -0.243778, -1.676902, 0, 1, 0.4666667, 1,
-0.2259501, -1.453211, -2.894362, 0, 1, 0.4705882, 1,
-0.2223597, 2.119378, 0.5408798, 0, 1, 0.4784314, 1,
-0.22015, 0.2423605, -0.9145999, 0, 1, 0.4823529, 1,
-0.2189541, 0.5849698, -0.3867271, 0, 1, 0.4901961, 1,
-0.2188312, 0.7649079, 0.1307537, 0, 1, 0.4941176, 1,
-0.2150663, -0.5957876, -2.219982, 0, 1, 0.5019608, 1,
-0.2147311, -1.224494, -2.951546, 0, 1, 0.509804, 1,
-0.2072276, -1.229568, -4.074681, 0, 1, 0.5137255, 1,
-0.2056812, -1.132024, -2.127753, 0, 1, 0.5215687, 1,
-0.2035544, -0.7367613, -3.371172, 0, 1, 0.5254902, 1,
-0.2031543, 0.1152447, -1.962196, 0, 1, 0.5333334, 1,
-0.1998198, 0.137609, -0.8468212, 0, 1, 0.5372549, 1,
-0.1937284, 0.5534081, 0.8371668, 0, 1, 0.5450981, 1,
-0.1918068, 0.7703196, 0.3577276, 0, 1, 0.5490196, 1,
-0.19179, 0.7686512, 0.7945717, 0, 1, 0.5568628, 1,
-0.1862121, 0.3805029, 0.3566515, 0, 1, 0.5607843, 1,
-0.1826448, 0.7789931, 0.22804, 0, 1, 0.5686275, 1,
-0.1817773, 3.439058, -1.279399, 0, 1, 0.572549, 1,
-0.1806884, 1.279845, -2.393084, 0, 1, 0.5803922, 1,
-0.1760458, -0.8243166, -3.252217, 0, 1, 0.5843138, 1,
-0.1730036, 0.8059156, 0.3131256, 0, 1, 0.5921569, 1,
-0.1712201, -0.6880406, -1.235539, 0, 1, 0.5960785, 1,
-0.1698093, -1.202565, -3.146195, 0, 1, 0.6039216, 1,
-0.1688614, -1.396111, -2.661457, 0, 1, 0.6117647, 1,
-0.1662052, 0.5078789, 0.6286351, 0, 1, 0.6156863, 1,
-0.1624069, 0.4968733, 0.744378, 0, 1, 0.6235294, 1,
-0.1601608, -0.1213848, -4.658939, 0, 1, 0.627451, 1,
-0.1562922, -0.06870925, -3.038103, 0, 1, 0.6352941, 1,
-0.1550769, 2.155132, -0.716382, 0, 1, 0.6392157, 1,
-0.1537814, 0.5699325, 0.2437237, 0, 1, 0.6470588, 1,
-0.1499766, -1.643415, -5.343877, 0, 1, 0.6509804, 1,
-0.1473233, -0.5238142, -3.049642, 0, 1, 0.6588235, 1,
-0.1435891, 0.3652548, -0.1100147, 0, 1, 0.6627451, 1,
-0.1392688, 0.908846, -1.633262, 0, 1, 0.6705883, 1,
-0.1372943, 0.186255, -0.4306373, 0, 1, 0.6745098, 1,
-0.1363136, -1.059398, -2.963403, 0, 1, 0.682353, 1,
-0.1355201, -0.4742471, -4.06274, 0, 1, 0.6862745, 1,
-0.132822, 0.1636041, -0.6401479, 0, 1, 0.6941177, 1,
-0.132234, 1.819244, 0.3070113, 0, 1, 0.7019608, 1,
-0.1301051, -0.6650845, -3.808228, 0, 1, 0.7058824, 1,
-0.1296474, 0.7948616, 1.78319, 0, 1, 0.7137255, 1,
-0.1289284, -0.6570462, -3.245023, 0, 1, 0.7176471, 1,
-0.1284422, 0.4045114, -1.473212, 0, 1, 0.7254902, 1,
-0.1230227, -0.9383355, -2.531429, 0, 1, 0.7294118, 1,
-0.121981, -0.05912661, -3.573431, 0, 1, 0.7372549, 1,
-0.1177182, 0.667069, -0.05341899, 0, 1, 0.7411765, 1,
-0.1171685, 1.048943, 1.410285, 0, 1, 0.7490196, 1,
-0.1152646, -0.2593284, -2.021132, 0, 1, 0.7529412, 1,
-0.1069261, -1.289284, -3.204658, 0, 1, 0.7607843, 1,
-0.09960119, -0.5488417, -2.518893, 0, 1, 0.7647059, 1,
-0.09622408, -0.7823244, -3.548303, 0, 1, 0.772549, 1,
-0.09609559, -1.090551, -3.011489, 0, 1, 0.7764706, 1,
-0.09305912, -0.0462411, -3.10102, 0, 1, 0.7843137, 1,
-0.08262327, 0.5519071, -0.5894476, 0, 1, 0.7882353, 1,
-0.0805822, 0.8616223, -0.3754602, 0, 1, 0.7960784, 1,
-0.08016749, 2.818956, 1.585927, 0, 1, 0.8039216, 1,
-0.07735109, 0.7110643, 1.921394, 0, 1, 0.8078431, 1,
-0.07730126, -0.3588152, -1.915701, 0, 1, 0.8156863, 1,
-0.07394265, 0.1395507, -0.4205529, 0, 1, 0.8196079, 1,
-0.07277178, -0.6559343, -1.118418, 0, 1, 0.827451, 1,
-0.06156781, -0.1071124, -3.885755, 0, 1, 0.8313726, 1,
-0.06026158, 0.2337459, -1.270883, 0, 1, 0.8392157, 1,
-0.05836844, -0.1359093, -5.053445, 0, 1, 0.8431373, 1,
-0.05722793, 2.044254, -0.5090896, 0, 1, 0.8509804, 1,
-0.05307898, -0.4083672, -3.166049, 0, 1, 0.854902, 1,
-0.05097148, -0.7155558, -1.478838, 0, 1, 0.8627451, 1,
-0.04996235, -0.2037742, -2.170675, 0, 1, 0.8666667, 1,
-0.04953535, -0.5371066, -2.851392, 0, 1, 0.8745098, 1,
-0.04876471, 0.006314341, -0.7908788, 0, 1, 0.8784314, 1,
-0.04862437, 0.5901693, -1.099837, 0, 1, 0.8862745, 1,
-0.04760954, -1.632906, -5.01993, 0, 1, 0.8901961, 1,
-0.04508802, 2.039696, -0.2885424, 0, 1, 0.8980392, 1,
-0.04137848, 1.036801, 1.467032, 0, 1, 0.9058824, 1,
-0.02684128, 0.1745628, -0.3660465, 0, 1, 0.9098039, 1,
-0.02491573, 0.1554284, 1.428611, 0, 1, 0.9176471, 1,
-0.01903917, -0.7275251, -1.997033, 0, 1, 0.9215686, 1,
-0.01857862, 0.7749351, -0.7249052, 0, 1, 0.9294118, 1,
-0.01493236, 0.08181395, 0.3607248, 0, 1, 0.9333333, 1,
-0.01408244, -0.1360887, -3.58655, 0, 1, 0.9411765, 1,
-0.01405709, -0.6532851, -3.256273, 0, 1, 0.945098, 1,
-0.01325956, 0.2841242, 0.5540515, 0, 1, 0.9529412, 1,
-0.01082805, -0.3545611, -2.153648, 0, 1, 0.9568627, 1,
-0.01056862, -0.1855756, -1.739083, 0, 1, 0.9647059, 1,
-0.009588192, 1.08872, -0.3347177, 0, 1, 0.9686275, 1,
-0.006003623, 2.030919, 0.1843051, 0, 1, 0.9764706, 1,
-0.00395624, 0.2492723, -0.4917881, 0, 1, 0.9803922, 1,
-0.003282453, 1.220757, 0.1317448, 0, 1, 0.9882353, 1,
0.003812342, -2.242538, 1.565592, 0, 1, 0.9921569, 1,
0.01034484, -0.4793232, 2.811872, 0, 1, 1, 1,
0.01150544, -1.253541, 1.057412, 0, 0.9921569, 1, 1,
0.01262794, -0.8542485, 2.451602, 0, 0.9882353, 1, 1,
0.01349038, -0.2086046, 1.099262, 0, 0.9803922, 1, 1,
0.01497248, -0.7930596, 3.755946, 0, 0.9764706, 1, 1,
0.01755183, -1.11498, 2.796998, 0, 0.9686275, 1, 1,
0.02213736, 0.7284128, 1.123136, 0, 0.9647059, 1, 1,
0.02319412, -1.317813, 2.051743, 0, 0.9568627, 1, 1,
0.02453269, -0.6474575, 4.807745, 0, 0.9529412, 1, 1,
0.02508955, 1.422587, 2.89585, 0, 0.945098, 1, 1,
0.02566458, 0.3579957, 0.5533854, 0, 0.9411765, 1, 1,
0.02696855, 0.1867606, -0.2863063, 0, 0.9333333, 1, 1,
0.03154033, 1.57298, 0.9435595, 0, 0.9294118, 1, 1,
0.03169471, -0.2759598, 2.454909, 0, 0.9215686, 1, 1,
0.03848866, 0.1558714, -0.6100432, 0, 0.9176471, 1, 1,
0.04183091, -0.4563099, 4.392733, 0, 0.9098039, 1, 1,
0.04212875, 0.7765962, 1.859932, 0, 0.9058824, 1, 1,
0.04644518, -0.5268997, 2.651045, 0, 0.8980392, 1, 1,
0.04991167, 0.03099077, 0.858502, 0, 0.8901961, 1, 1,
0.05066461, -0.01827474, 2.576109, 0, 0.8862745, 1, 1,
0.05080893, 0.276683, 1.088227, 0, 0.8784314, 1, 1,
0.05121721, 0.3065763, 0.8229657, 0, 0.8745098, 1, 1,
0.05764151, 0.260923, 1.885509, 0, 0.8666667, 1, 1,
0.05780055, -0.7416708, 1.758505, 0, 0.8627451, 1, 1,
0.0580151, 0.3304708, -0.6122953, 0, 0.854902, 1, 1,
0.06004742, 0.6841255, -1.052897, 0, 0.8509804, 1, 1,
0.06477328, 0.6969068, 0.2200645, 0, 0.8431373, 1, 1,
0.0731708, 0.9532812, -0.579616, 0, 0.8392157, 1, 1,
0.07381032, -0.804692, 3.919658, 0, 0.8313726, 1, 1,
0.0751056, 0.8361539, -0.02568716, 0, 0.827451, 1, 1,
0.08202763, 0.4252363, -0.5780957, 0, 0.8196079, 1, 1,
0.08474607, -1.421819, 2.072519, 0, 0.8156863, 1, 1,
0.08650162, 0.07368952, 2.042962, 0, 0.8078431, 1, 1,
0.08760029, -0.0385799, 2.298591, 0, 0.8039216, 1, 1,
0.08898184, 0.6092888, 1.770684, 0, 0.7960784, 1, 1,
0.08996674, 0.7764234, -0.6983361, 0, 0.7882353, 1, 1,
0.09091325, -1.020344, 2.317558, 0, 0.7843137, 1, 1,
0.09507312, 1.228102, -0.3465078, 0, 0.7764706, 1, 1,
0.0968162, 0.3238235, 1.318569, 0, 0.772549, 1, 1,
0.1040346, 0.6876912, -0.5301973, 0, 0.7647059, 1, 1,
0.1045878, -0.05889116, 2.274742, 0, 0.7607843, 1, 1,
0.1098434, -1.429291, 5.070374, 0, 0.7529412, 1, 1,
0.1099472, -0.8079098, 0.2223089, 0, 0.7490196, 1, 1,
0.1104914, 0.07731256, -0.9261221, 0, 0.7411765, 1, 1,
0.1111374, 0.1519263, 1.49594, 0, 0.7372549, 1, 1,
0.1164274, -0.01915473, 1.826756, 0, 0.7294118, 1, 1,
0.1169558, -0.2950034, 2.268621, 0, 0.7254902, 1, 1,
0.1200063, -1.628252, 5.060914, 0, 0.7176471, 1, 1,
0.1223826, 2.286681, 0.4625549, 0, 0.7137255, 1, 1,
0.1248957, -0.6708099, 2.658031, 0, 0.7058824, 1, 1,
0.1251592, 0.5399551, 1.173454, 0, 0.6980392, 1, 1,
0.1252859, -1.387625, 3.739728, 0, 0.6941177, 1, 1,
0.1286417, -0.09275089, 1.392277, 0, 0.6862745, 1, 1,
0.1292529, 0.2022936, -1.000189, 0, 0.682353, 1, 1,
0.1300861, 0.03700472, 1.304338, 0, 0.6745098, 1, 1,
0.1311742, 0.8313537, 0.8544415, 0, 0.6705883, 1, 1,
0.139815, -0.6788028, 2.915926, 0, 0.6627451, 1, 1,
0.1438725, 0.6009495, 0.8415549, 0, 0.6588235, 1, 1,
0.1463184, -0.3775055, 3.232611, 0, 0.6509804, 1, 1,
0.1463203, -0.4609069, 3.629139, 0, 0.6470588, 1, 1,
0.1487137, -0.3389492, 4.291737, 0, 0.6392157, 1, 1,
0.1556237, -0.6119117, 3.371727, 0, 0.6352941, 1, 1,
0.1557764, 0.8362277, 0.1164878, 0, 0.627451, 1, 1,
0.1558553, 0.1146209, 0.2685784, 0, 0.6235294, 1, 1,
0.1559522, -1.015046, 3.289216, 0, 0.6156863, 1, 1,
0.1574278, -1.235729, 2.392295, 0, 0.6117647, 1, 1,
0.1656035, 0.3781628, -2.026049, 0, 0.6039216, 1, 1,
0.1672421, -0.2026086, 2.841624, 0, 0.5960785, 1, 1,
0.1782208, -1.310082, 3.154248, 0, 0.5921569, 1, 1,
0.1784984, -0.7631703, 2.31496, 0, 0.5843138, 1, 1,
0.1790568, -0.3119227, 3.217478, 0, 0.5803922, 1, 1,
0.1794585, 0.05534045, 2.934844, 0, 0.572549, 1, 1,
0.1828469, 0.4552613, -0.1339366, 0, 0.5686275, 1, 1,
0.1842115, 0.6026901, 0.4729691, 0, 0.5607843, 1, 1,
0.1947901, 0.05621579, 1.744208, 0, 0.5568628, 1, 1,
0.1949724, -1.589519, 2.675505, 0, 0.5490196, 1, 1,
0.1955899, 0.4548939, 0.9991411, 0, 0.5450981, 1, 1,
0.2055928, -0.2758409, 2.248284, 0, 0.5372549, 1, 1,
0.2058306, 1.217667, -0.08414262, 0, 0.5333334, 1, 1,
0.2066449, -0.9601372, 3.545852, 0, 0.5254902, 1, 1,
0.2073047, -0.1436009, 1.586197, 0, 0.5215687, 1, 1,
0.2090751, 1.154551, 1.947721, 0, 0.5137255, 1, 1,
0.2108086, -0.5333872, 2.872154, 0, 0.509804, 1, 1,
0.2119856, 0.3629538, -0.4733349, 0, 0.5019608, 1, 1,
0.2134017, -0.6766905, 3.494924, 0, 0.4941176, 1, 1,
0.2169004, 0.3581463, 0.5051298, 0, 0.4901961, 1, 1,
0.2190472, -2.06834, 2.183257, 0, 0.4823529, 1, 1,
0.219911, 0.2035069, 1.9735, 0, 0.4784314, 1, 1,
0.2227868, 0.1043507, -1.412064, 0, 0.4705882, 1, 1,
0.2304378, -0.426057, 2.013286, 0, 0.4666667, 1, 1,
0.2307335, 0.8957579, 1.285258, 0, 0.4588235, 1, 1,
0.2326802, -1.674522, 2.752321, 0, 0.454902, 1, 1,
0.2366488, -1.579402, 3.64971, 0, 0.4470588, 1, 1,
0.2420276, 1.091431, -2.009859, 0, 0.4431373, 1, 1,
0.2487415, -0.7168394, 4.659684, 0, 0.4352941, 1, 1,
0.2487656, 1.410386, -0.2493448, 0, 0.4313726, 1, 1,
0.2513991, 0.6806952, 3.039077, 0, 0.4235294, 1, 1,
0.2527929, 0.2408727, -1.076794, 0, 0.4196078, 1, 1,
0.2537149, -1.931492, 2.176012, 0, 0.4117647, 1, 1,
0.2577869, 0.1935881, 1.260692, 0, 0.4078431, 1, 1,
0.258086, 1.560322, -0.8731197, 0, 0.4, 1, 1,
0.2592387, -2.27185, 2.918135, 0, 0.3921569, 1, 1,
0.2632214, -0.1801293, 1.44862, 0, 0.3882353, 1, 1,
0.2648339, 0.08672632, 0.5375484, 0, 0.3803922, 1, 1,
0.2649105, -0.5163791, 2.86547, 0, 0.3764706, 1, 1,
0.267616, -1.307806, 4.486843, 0, 0.3686275, 1, 1,
0.2707041, -0.6282478, 2.227324, 0, 0.3647059, 1, 1,
0.2750506, -2.738927, 3.379493, 0, 0.3568628, 1, 1,
0.2752858, 0.7787716, 0.20825, 0, 0.3529412, 1, 1,
0.2778599, -1.530615, 3.796567, 0, 0.345098, 1, 1,
0.2784791, -1.168282, 4.668567, 0, 0.3411765, 1, 1,
0.278596, -0.6976239, 4.131659, 0, 0.3333333, 1, 1,
0.2788918, -0.4727594, -0.555958, 0, 0.3294118, 1, 1,
0.2824003, -1.262099, 1.447251, 0, 0.3215686, 1, 1,
0.2826595, 0.4974096, 0.08325906, 0, 0.3176471, 1, 1,
0.2840432, 1.111817, -1.750491, 0, 0.3098039, 1, 1,
0.28981, -0.9314024, 4.704387, 0, 0.3058824, 1, 1,
0.2906137, -0.4748269, 1.714302, 0, 0.2980392, 1, 1,
0.2973468, 0.8310567, 1.15728, 0, 0.2901961, 1, 1,
0.2994415, 2.564074, -0.7397719, 0, 0.2862745, 1, 1,
0.3012162, 0.8311982, 1.313849, 0, 0.2784314, 1, 1,
0.3051904, -0.181377, 2.195151, 0, 0.2745098, 1, 1,
0.3059356, 0.8926395, 0.1501584, 0, 0.2666667, 1, 1,
0.3068893, 0.9894044, 0.6369659, 0, 0.2627451, 1, 1,
0.3130556, 0.335856, -0.2114207, 0, 0.254902, 1, 1,
0.3150943, -0.3384547, 1.620754, 0, 0.2509804, 1, 1,
0.3181572, 1.090619, -0.5862063, 0, 0.2431373, 1, 1,
0.3195545, -0.1986119, 3.473354, 0, 0.2392157, 1, 1,
0.3218956, -1.053897, 2.778293, 0, 0.2313726, 1, 1,
0.3254974, -0.1792851, 1.716621, 0, 0.227451, 1, 1,
0.3420339, 0.2276996, 2.023089, 0, 0.2196078, 1, 1,
0.3437086, 0.07874136, 1.784411, 0, 0.2156863, 1, 1,
0.3444614, -0.1960761, 3.361415, 0, 0.2078431, 1, 1,
0.3486542, 0.19236, 1.868273, 0, 0.2039216, 1, 1,
0.3487191, -0.150165, 0.3458776, 0, 0.1960784, 1, 1,
0.3488262, -1.053944, 2.689193, 0, 0.1882353, 1, 1,
0.3509761, -0.4665443, 1.784518, 0, 0.1843137, 1, 1,
0.3527647, 0.3380277, 0.8711237, 0, 0.1764706, 1, 1,
0.3537268, -0.2362761, 2.110994, 0, 0.172549, 1, 1,
0.3539431, 0.638696, -1.704737, 0, 0.1647059, 1, 1,
0.3615905, -0.09179986, 3.465965, 0, 0.1607843, 1, 1,
0.3621301, 0.1393324, 2.051042, 0, 0.1529412, 1, 1,
0.3645389, 0.4235958, 1.80505, 0, 0.1490196, 1, 1,
0.3649521, -2.215888, 3.148628, 0, 0.1411765, 1, 1,
0.3651589, -1.89364, 3.044316, 0, 0.1372549, 1, 1,
0.3668278, 0.885329, 0.2434469, 0, 0.1294118, 1, 1,
0.3685502, -0.1555854, 1.19076, 0, 0.1254902, 1, 1,
0.3693835, -1.745792, 3.366123, 0, 0.1176471, 1, 1,
0.3697437, 1.342155, 0.1602156, 0, 0.1137255, 1, 1,
0.3715335, -0.6810309, 1.7539, 0, 0.1058824, 1, 1,
0.3752968, 0.7597219, 1.374215, 0, 0.09803922, 1, 1,
0.3793491, 1.709532, 1.091737, 0, 0.09411765, 1, 1,
0.3807347, -1.887614, 1.725666, 0, 0.08627451, 1, 1,
0.3811608, 1.366762, 1.701441, 0, 0.08235294, 1, 1,
0.3832481, -1.580963, 4.033092, 0, 0.07450981, 1, 1,
0.3871661, 0.9429231, 0.2807267, 0, 0.07058824, 1, 1,
0.3882341, -0.6722118, 0.1938293, 0, 0.0627451, 1, 1,
0.3933664, -0.3083128, 2.927531, 0, 0.05882353, 1, 1,
0.3935947, -1.073918, 3.5813, 0, 0.05098039, 1, 1,
0.395526, 1.337218, -0.4299597, 0, 0.04705882, 1, 1,
0.3992639, -0.7309325, 3.088529, 0, 0.03921569, 1, 1,
0.400989, -0.5602943, 2.455304, 0, 0.03529412, 1, 1,
0.4015308, 1.130832, 0.04137975, 0, 0.02745098, 1, 1,
0.4098998, 0.8311939, 0.4167027, 0, 0.02352941, 1, 1,
0.4119915, -1.545158, 4.459252, 0, 0.01568628, 1, 1,
0.418508, 1.797486, -0.09028112, 0, 0.01176471, 1, 1,
0.4195812, 0.09607996, 2.349747, 0, 0.003921569, 1, 1,
0.4206357, 0.4806572, -0.3101066, 0.003921569, 0, 1, 1,
0.4216245, -0.03297769, 3.281675, 0.007843138, 0, 1, 1,
0.4277175, -1.318784, 1.993573, 0.01568628, 0, 1, 1,
0.4350451, 0.1887174, 0.5664662, 0.01960784, 0, 1, 1,
0.4352173, 0.1649621, 2.198374, 0.02745098, 0, 1, 1,
0.4391893, 0.6969008, 0.8988688, 0.03137255, 0, 1, 1,
0.4429497, -1.341256, 3.201553, 0.03921569, 0, 1, 1,
0.4445976, -1.371008, 3.564476, 0.04313726, 0, 1, 1,
0.4464264, 0.08107308, 0.2287115, 0.05098039, 0, 1, 1,
0.4498072, 2.53011, -0.3824339, 0.05490196, 0, 1, 1,
0.4600193, 0.3730415, 1.516963, 0.0627451, 0, 1, 1,
0.4614111, 0.3284935, 1.580218, 0.06666667, 0, 1, 1,
0.461686, -0.4024161, 2.885378, 0.07450981, 0, 1, 1,
0.4653367, 0.7543028, -0.03724983, 0.07843138, 0, 1, 1,
0.466248, -2.034292, 2.389543, 0.08627451, 0, 1, 1,
0.4666066, -0.3732179, 2.833577, 0.09019608, 0, 1, 1,
0.4686859, -1.841418, 3.316492, 0.09803922, 0, 1, 1,
0.4722729, -0.04205991, 0.2019078, 0.1058824, 0, 1, 1,
0.4745511, -1.839428, 2.113656, 0.1098039, 0, 1, 1,
0.4756608, -0.3585744, 1.955114, 0.1176471, 0, 1, 1,
0.4767522, -2.053064, 2.483324, 0.1215686, 0, 1, 1,
0.4773482, 1.286775, 0.4649283, 0.1294118, 0, 1, 1,
0.4789576, 2.033778, 2.344662, 0.1333333, 0, 1, 1,
0.4801495, 0.9463982, 0.4662053, 0.1411765, 0, 1, 1,
0.4804682, 0.4046031, -0.3702997, 0.145098, 0, 1, 1,
0.483382, -0.524154, 2.460882, 0.1529412, 0, 1, 1,
0.4835668, -0.01516485, 0.6392513, 0.1568628, 0, 1, 1,
0.4835759, -0.6385002, 3.289038, 0.1647059, 0, 1, 1,
0.489026, -0.4932283, 2.260154, 0.1686275, 0, 1, 1,
0.4901171, -0.5521686, 2.543296, 0.1764706, 0, 1, 1,
0.4937726, 0.760087, 0.7170855, 0.1803922, 0, 1, 1,
0.4941825, -0.5703275, 1.576405, 0.1882353, 0, 1, 1,
0.4952398, 0.03330351, 0.6130276, 0.1921569, 0, 1, 1,
0.4980419, 0.04559651, 1.76257, 0.2, 0, 1, 1,
0.5054817, 0.4485027, 1.330307, 0.2078431, 0, 1, 1,
0.5057157, -0.7161666, 2.178695, 0.2117647, 0, 1, 1,
0.5072532, -0.7208012, 3.511573, 0.2196078, 0, 1, 1,
0.5090868, -0.3729356, 2.205469, 0.2235294, 0, 1, 1,
0.5099304, 1.647598, -0.1571494, 0.2313726, 0, 1, 1,
0.5148268, 0.5822831, 0.7182543, 0.2352941, 0, 1, 1,
0.5188325, -0.1759233, 1.965952, 0.2431373, 0, 1, 1,
0.5205953, -0.9881797, 0.9482424, 0.2470588, 0, 1, 1,
0.522882, 1.611097, 1.513875, 0.254902, 0, 1, 1,
0.5288577, 0.4823675, 1.332186, 0.2588235, 0, 1, 1,
0.5318353, 1.52092, 0.7811028, 0.2666667, 0, 1, 1,
0.5328323, 1.599878, 1.305047, 0.2705882, 0, 1, 1,
0.53499, -0.8662614, 1.747404, 0.2784314, 0, 1, 1,
0.5375556, -0.654651, 2.555981, 0.282353, 0, 1, 1,
0.5377694, -1.182688, 3.296499, 0.2901961, 0, 1, 1,
0.5431672, 0.8332288, 0.309202, 0.2941177, 0, 1, 1,
0.5451972, 0.9889134, -0.2197184, 0.3019608, 0, 1, 1,
0.5473088, 2.016407, 1.462707, 0.3098039, 0, 1, 1,
0.5552949, -0.7682306, 2.025496, 0.3137255, 0, 1, 1,
0.5562268, 0.3639016, -1.026836, 0.3215686, 0, 1, 1,
0.5578097, -0.770777, 3.353935, 0.3254902, 0, 1, 1,
0.5613167, 0.5929733, 1.74527, 0.3333333, 0, 1, 1,
0.5620675, 0.5304222, 0.983061, 0.3372549, 0, 1, 1,
0.5655472, 1.127875, -0.1266735, 0.345098, 0, 1, 1,
0.5683126, -0.46843, 2.958352, 0.3490196, 0, 1, 1,
0.5758955, -1.113761, 2.287054, 0.3568628, 0, 1, 1,
0.5776852, 0.4528014, -1.763574, 0.3607843, 0, 1, 1,
0.5879222, -0.903674, 2.587859, 0.3686275, 0, 1, 1,
0.5893111, 0.914043, 1.113654, 0.372549, 0, 1, 1,
0.5936134, -0.6069663, 1.958362, 0.3803922, 0, 1, 1,
0.5947638, 0.9046496, -0.7555272, 0.3843137, 0, 1, 1,
0.6042245, -1.941522, 2.772434, 0.3921569, 0, 1, 1,
0.6075633, -0.2487781, 3.068968, 0.3960784, 0, 1, 1,
0.6076323, 0.5459703, 2.761175, 0.4039216, 0, 1, 1,
0.6086476, -0.4463396, 1.680515, 0.4117647, 0, 1, 1,
0.6132565, 0.9648294, -0.5062659, 0.4156863, 0, 1, 1,
0.6187446, 0.8646228, 0.9008316, 0.4235294, 0, 1, 1,
0.622035, -1.755247, 3.346472, 0.427451, 0, 1, 1,
0.6222757, -1.200572, 1.141887, 0.4352941, 0, 1, 1,
0.6239068, 0.1911462, 0.7452492, 0.4392157, 0, 1, 1,
0.6251923, -1.390007, 2.763551, 0.4470588, 0, 1, 1,
0.6316612, 0.4471817, 2.010312, 0.4509804, 0, 1, 1,
0.6427201, 1.26661, 2.055233, 0.4588235, 0, 1, 1,
0.6445141, -1.216691, 1.958899, 0.4627451, 0, 1, 1,
0.6495675, 0.2157398, -0.1060771, 0.4705882, 0, 1, 1,
0.650647, -0.5734515, 2.612181, 0.4745098, 0, 1, 1,
0.6534034, 1.599329, 1.44632, 0.4823529, 0, 1, 1,
0.6556512, -1.346162, 3.160979, 0.4862745, 0, 1, 1,
0.6639425, -1.015991, 1.532338, 0.4941176, 0, 1, 1,
0.6659265, -0.3396959, 1.441809, 0.5019608, 0, 1, 1,
0.6660915, 0.03993629, -0.9328538, 0.5058824, 0, 1, 1,
0.6704013, 0.9016981, 1.770405, 0.5137255, 0, 1, 1,
0.6733539, 0.1604054, 0.7031909, 0.5176471, 0, 1, 1,
0.677094, 1.402249, 1.154517, 0.5254902, 0, 1, 1,
0.6830832, 1.1812, -0.6261565, 0.5294118, 0, 1, 1,
0.6836331, 0.2825011, 1.087662, 0.5372549, 0, 1, 1,
0.6883392, 0.2468816, 1.354811, 0.5411765, 0, 1, 1,
0.6916176, -0.4231621, 1.854188, 0.5490196, 0, 1, 1,
0.6950844, -1.32238, 1.465596, 0.5529412, 0, 1, 1,
0.6957343, -0.9686452, 2.606301, 0.5607843, 0, 1, 1,
0.6974091, 0.01599236, 2.253321, 0.5647059, 0, 1, 1,
0.6981294, -1.561076, 3.740745, 0.572549, 0, 1, 1,
0.699989, -0.5594131, 3.975035, 0.5764706, 0, 1, 1,
0.7070403, 0.2338852, -0.2296474, 0.5843138, 0, 1, 1,
0.7141073, -2.631656, 3.210229, 0.5882353, 0, 1, 1,
0.7161838, -0.2995254, 2.698139, 0.5960785, 0, 1, 1,
0.7205788, 0.5258163, -1.656399, 0.6039216, 0, 1, 1,
0.7208155, 1.379887, 0.8787636, 0.6078432, 0, 1, 1,
0.7213866, -0.03991193, 1.305379, 0.6156863, 0, 1, 1,
0.7222057, 0.01320662, 2.547761, 0.6196079, 0, 1, 1,
0.7241636, 1.590011, 0.1929526, 0.627451, 0, 1, 1,
0.7283567, 0.231454, 1.210026, 0.6313726, 0, 1, 1,
0.7317345, 0.9952179, 2.386642, 0.6392157, 0, 1, 1,
0.7321699, 0.7206138, -0.8155037, 0.6431373, 0, 1, 1,
0.7327557, -2.303539, 1.630227, 0.6509804, 0, 1, 1,
0.7393036, 0.397234, 0.2825788, 0.654902, 0, 1, 1,
0.7409191, -0.4065787, 2.394419, 0.6627451, 0, 1, 1,
0.7439767, 2.985589, 1.524106, 0.6666667, 0, 1, 1,
0.744031, 3.056677, -0.1738665, 0.6745098, 0, 1, 1,
0.7466942, -0.5930283, 1.254614, 0.6784314, 0, 1, 1,
0.7543954, -1.024295, 3.955309, 0.6862745, 0, 1, 1,
0.7546096, -0.7399815, 1.859534, 0.6901961, 0, 1, 1,
0.7566556, -0.2233597, 2.258974, 0.6980392, 0, 1, 1,
0.765333, -0.4060123, 1.435182, 0.7058824, 0, 1, 1,
0.7661812, -2.008625, 2.506721, 0.7098039, 0, 1, 1,
0.7678512, -0.3976157, 2.19468, 0.7176471, 0, 1, 1,
0.7686173, -2.526145, 3.222707, 0.7215686, 0, 1, 1,
0.7698641, -1.672643, 4.352399, 0.7294118, 0, 1, 1,
0.7745222, 0.9735259, -0.2132093, 0.7333333, 0, 1, 1,
0.7770828, -0.9463093, 1.779947, 0.7411765, 0, 1, 1,
0.7794091, 2.725426, 0.8436891, 0.7450981, 0, 1, 1,
0.7860838, -1.075523, 2.057479, 0.7529412, 0, 1, 1,
0.8028606, 0.4606124, 1.224459, 0.7568628, 0, 1, 1,
0.8044907, 0.7202951, 2.360587, 0.7647059, 0, 1, 1,
0.8078018, 1.294689, 1.694082, 0.7686275, 0, 1, 1,
0.8086779, -0.2230978, 1.336571, 0.7764706, 0, 1, 1,
0.8091883, 0.2587895, 0.5847778, 0.7803922, 0, 1, 1,
0.8121609, -0.1244582, -0.01078747, 0.7882353, 0, 1, 1,
0.8143699, 0.781158, 1.310468, 0.7921569, 0, 1, 1,
0.8304606, -1.431348, 2.463603, 0.8, 0, 1, 1,
0.8319039, -0.8279445, 1.839772, 0.8078431, 0, 1, 1,
0.8328578, 0.5657818, 0.9695334, 0.8117647, 0, 1, 1,
0.8459858, 0.438238, 0.4792129, 0.8196079, 0, 1, 1,
0.8477564, 0.4854685, 0.5192084, 0.8235294, 0, 1, 1,
0.8529302, 0.2934134, 1.501958, 0.8313726, 0, 1, 1,
0.8557628, -0.1895814, 1.205589, 0.8352941, 0, 1, 1,
0.8558008, 0.8612385, 1.445172, 0.8431373, 0, 1, 1,
0.856577, 1.100247, 1.726871, 0.8470588, 0, 1, 1,
0.8599161, -0.3581591, 3.489769, 0.854902, 0, 1, 1,
0.8634536, 0.4113663, 1.420167, 0.8588235, 0, 1, 1,
0.8684525, -1.161896, 4.845075, 0.8666667, 0, 1, 1,
0.869638, 1.463816, 0.814662, 0.8705882, 0, 1, 1,
0.8723316, -0.6107747, 0.5218238, 0.8784314, 0, 1, 1,
0.8728216, -0.1060161, 0.301058, 0.8823529, 0, 1, 1,
0.8780501, -0.3613748, 0.990908, 0.8901961, 0, 1, 1,
0.8880264, 1.469779, -0.4800089, 0.8941177, 0, 1, 1,
0.8885437, 0.5681055, 1.052464, 0.9019608, 0, 1, 1,
0.8977301, 0.9339167, 1.02678, 0.9098039, 0, 1, 1,
0.9025697, -0.09433866, 2.033256, 0.9137255, 0, 1, 1,
0.9185001, -0.7890413, 2.718392, 0.9215686, 0, 1, 1,
0.9189058, -1.060061, 3.345094, 0.9254902, 0, 1, 1,
0.9231774, -0.646338, 2.570379, 0.9333333, 0, 1, 1,
0.9251528, 1.001413, 1.115328, 0.9372549, 0, 1, 1,
0.9273308, -0.3133118, 0.7990017, 0.945098, 0, 1, 1,
0.9314117, -0.09548667, 1.750957, 0.9490196, 0, 1, 1,
0.938705, 0.1223706, 0.203604, 0.9568627, 0, 1, 1,
0.9395781, 1.199251, 2.620009, 0.9607843, 0, 1, 1,
0.940321, -0.7650619, 1.896959, 0.9686275, 0, 1, 1,
0.942776, -1.257263, 3.090342, 0.972549, 0, 1, 1,
0.9432468, 0.9933964, 1.894054, 0.9803922, 0, 1, 1,
0.9444292, -0.7398513, 0.9345832, 0.9843137, 0, 1, 1,
0.951071, 0.2868169, 2.736989, 0.9921569, 0, 1, 1,
0.9549241, 0.02474152, 1.555731, 0.9960784, 0, 1, 1,
0.9554679, -0.162727, 3.030411, 1, 0, 0.9960784, 1,
0.9591331, -0.3871504, 1.542886, 1, 0, 0.9882353, 1,
0.9639133, 1.334191, 0.7600729, 1, 0, 0.9843137, 1,
0.966462, 0.8217424, 0.955371, 1, 0, 0.9764706, 1,
0.9708822, 2.289371, 0.7021446, 1, 0, 0.972549, 1,
0.9767138, 1.271593, 0.4938408, 1, 0, 0.9647059, 1,
0.9822552, -1.235821, 4.070621, 1, 0, 0.9607843, 1,
0.9873172, 0.6061127, 1.570777, 1, 0, 0.9529412, 1,
0.995872, 0.7549546, -0.04379868, 1, 0, 0.9490196, 1,
1.003778, -0.4469722, 0.1755834, 1, 0, 0.9411765, 1,
1.004259, -0.2710028, 2.130493, 1, 0, 0.9372549, 1,
1.008131, -1.068454, 0.6508611, 1, 0, 0.9294118, 1,
1.023067, 0.04789315, 0.2063848, 1, 0, 0.9254902, 1,
1.024216, -0.1039957, 3.839466, 1, 0, 0.9176471, 1,
1.02905, -0.5644671, 3.053735, 1, 0, 0.9137255, 1,
1.034588, 2.020511, 1.55972, 1, 0, 0.9058824, 1,
1.034846, -1.899357, 4.01234, 1, 0, 0.9019608, 1,
1.055789, 1.368551, 1.286851, 1, 0, 0.8941177, 1,
1.059241, -0.7818984, 0.1176817, 1, 0, 0.8862745, 1,
1.061717, -0.4854801, 2.689172, 1, 0, 0.8823529, 1,
1.06358, -1.170143, 1.721048, 1, 0, 0.8745098, 1,
1.063901, -0.04559711, 1.673609, 1, 0, 0.8705882, 1,
1.067116, -0.441392, 2.298052, 1, 0, 0.8627451, 1,
1.070125, 0.5662034, 0.2772539, 1, 0, 0.8588235, 1,
1.073327, 0.0519125, 3.542782, 1, 0, 0.8509804, 1,
1.085734, 0.4144719, 0.8549556, 1, 0, 0.8470588, 1,
1.087168, -2.60844, 2.806868, 1, 0, 0.8392157, 1,
1.087964, 0.8116887, 1.606593, 1, 0, 0.8352941, 1,
1.092587, -0.7797446, 0.4756618, 1, 0, 0.827451, 1,
1.094466, -1.451975, 3.788584, 1, 0, 0.8235294, 1,
1.099442, 0.7372711, 2.123195, 1, 0, 0.8156863, 1,
1.109493, -1.755902, 2.838068, 1, 0, 0.8117647, 1,
1.112363, -0.2579327, -0.01966623, 1, 0, 0.8039216, 1,
1.122908, 0.2064596, 1.392132, 1, 0, 0.7960784, 1,
1.124331, -1.448497, 4.049019, 1, 0, 0.7921569, 1,
1.130401, -0.04857793, 0.790023, 1, 0, 0.7843137, 1,
1.131999, -1.351958, 2.06596, 1, 0, 0.7803922, 1,
1.135682, 2.116373, -1.273389, 1, 0, 0.772549, 1,
1.140302, 1.010208, 0.7266617, 1, 0, 0.7686275, 1,
1.14249, 1.072759, 0.3484422, 1, 0, 0.7607843, 1,
1.151817, 1.162893, 1.371896, 1, 0, 0.7568628, 1,
1.165304, -0.6237209, 1.805325, 1, 0, 0.7490196, 1,
1.165583, 0.8172361, -0.06341248, 1, 0, 0.7450981, 1,
1.170432, 0.2597693, 0.6375117, 1, 0, 0.7372549, 1,
1.175152, -0.6941025, 1.968121, 1, 0, 0.7333333, 1,
1.180862, -1.387105, 2.196812, 1, 0, 0.7254902, 1,
1.182343, 0.4112379, -0.958914, 1, 0, 0.7215686, 1,
1.184631, 0.716091, 2.103606, 1, 0, 0.7137255, 1,
1.187614, -0.9083263, 4.97102, 1, 0, 0.7098039, 1,
1.189923, 1.596983, -0.6487322, 1, 0, 0.7019608, 1,
1.19645, -2.073219, 3.958057, 1, 0, 0.6941177, 1,
1.203827, -0.7361674, 3.105886, 1, 0, 0.6901961, 1,
1.22304, -0.7919577, 1.18144, 1, 0, 0.682353, 1,
1.227131, -1.257714, 2.975272, 1, 0, 0.6784314, 1,
1.227855, 0.3936525, -0.9237605, 1, 0, 0.6705883, 1,
1.230191, -1.446744, 1.159006, 1, 0, 0.6666667, 1,
1.231457, -0.3583372, 0.2737457, 1, 0, 0.6588235, 1,
1.232865, -0.6542032, 1.391303, 1, 0, 0.654902, 1,
1.243062, 0.6621911, 2.879553, 1, 0, 0.6470588, 1,
1.260161, -0.4998389, 1.309448, 1, 0, 0.6431373, 1,
1.26798, -0.442888, 2.877187, 1, 0, 0.6352941, 1,
1.270864, 2.731169, 0.06844968, 1, 0, 0.6313726, 1,
1.273879, -0.0644303, 0.8621074, 1, 0, 0.6235294, 1,
1.274925, 0.7113438, 1.37594, 1, 0, 0.6196079, 1,
1.278531, -0.696784, 2.337249, 1, 0, 0.6117647, 1,
1.292704, -0.014913, 1.085649, 1, 0, 0.6078432, 1,
1.292806, -0.550279, 1.542682, 1, 0, 0.6, 1,
1.300847, -1.179857, 3.400494, 1, 0, 0.5921569, 1,
1.314165, 0.2939991, 1.51025, 1, 0, 0.5882353, 1,
1.317227, -0.9552894, 0.6508714, 1, 0, 0.5803922, 1,
1.318389, 1.407833, 0.7517953, 1, 0, 0.5764706, 1,
1.3233, -0.4951837, 1.33636, 1, 0, 0.5686275, 1,
1.352064, 0.3627917, 2.426496, 1, 0, 0.5647059, 1,
1.352904, -0.5231858, 2.634563, 1, 0, 0.5568628, 1,
1.356091, 0.458085, 1.224039, 1, 0, 0.5529412, 1,
1.36558, 0.6646491, 2.125352, 1, 0, 0.5450981, 1,
1.376547, -1.930105, 2.745815, 1, 0, 0.5411765, 1,
1.389114, 0.7588344, 1.42715, 1, 0, 0.5333334, 1,
1.391207, -0.9230072, 2.400621, 1, 0, 0.5294118, 1,
1.393426, 0.05385244, 1.15637, 1, 0, 0.5215687, 1,
1.40462, 1.013326, 0.06805448, 1, 0, 0.5176471, 1,
1.411332, 0.5503681, 0.84341, 1, 0, 0.509804, 1,
1.414514, 0.4368542, 1.662048, 1, 0, 0.5058824, 1,
1.428821, 0.2279689, 0.859541, 1, 0, 0.4980392, 1,
1.42922, 0.4197056, 1.291731, 1, 0, 0.4901961, 1,
1.430606, -0.5122771, 2.601025, 1, 0, 0.4862745, 1,
1.430609, -1.148319, 1.61169, 1, 0, 0.4784314, 1,
1.438914, -1.206268, 1.039158, 1, 0, 0.4745098, 1,
1.460477, 0.3950517, -0.3752205, 1, 0, 0.4666667, 1,
1.468971, 0.01866681, 1.41169, 1, 0, 0.4627451, 1,
1.473035, -0.2114908, 2.087981, 1, 0, 0.454902, 1,
1.47554, -0.2249597, 2.386178, 1, 0, 0.4509804, 1,
1.476206, 0.1634915, 0.7316518, 1, 0, 0.4431373, 1,
1.47666, 1.264875, 1.62224, 1, 0, 0.4392157, 1,
1.50772, 0.7023366, -0.1278253, 1, 0, 0.4313726, 1,
1.512435, 0.4765848, 1.385814, 1, 0, 0.427451, 1,
1.517336, -1.472153, 2.358844, 1, 0, 0.4196078, 1,
1.524485, -1.709953, 2.203594, 1, 0, 0.4156863, 1,
1.535422, -2.018848, 3.231918, 1, 0, 0.4078431, 1,
1.538646, -1.41034, 2.363264, 1, 0, 0.4039216, 1,
1.538702, 0.3056667, 1.007321, 1, 0, 0.3960784, 1,
1.540219, 0.8587922, -1.574327, 1, 0, 0.3882353, 1,
1.548544, 1.376254, 0.05175094, 1, 0, 0.3843137, 1,
1.558282, -1.441345, 2.390918, 1, 0, 0.3764706, 1,
1.55877, 1.023187, 1.660666, 1, 0, 0.372549, 1,
1.561736, 0.1387957, 3.228429, 1, 0, 0.3647059, 1,
1.561998, 0.3067791, 2.506933, 1, 0, 0.3607843, 1,
1.569316, 1.361767, 2.564314, 1, 0, 0.3529412, 1,
1.573936, -0.5189309, 0.7463197, 1, 0, 0.3490196, 1,
1.580912, 0.7110125, 1.465935, 1, 0, 0.3411765, 1,
1.600284, -1.015843, 0.67794, 1, 0, 0.3372549, 1,
1.620242, -0.06764201, 2.700072, 1, 0, 0.3294118, 1,
1.624302, -0.2598906, 2.15907, 1, 0, 0.3254902, 1,
1.63284, 0.6314331, 0.4895903, 1, 0, 0.3176471, 1,
1.638934, -0.1653138, 2.161731, 1, 0, 0.3137255, 1,
1.639707, -0.7864793, 1.288906, 1, 0, 0.3058824, 1,
1.658954, -0.5772231, 1.630711, 1, 0, 0.2980392, 1,
1.678063, 0.6557257, 0.2747331, 1, 0, 0.2941177, 1,
1.690643, 2.447833, 1.613582, 1, 0, 0.2862745, 1,
1.693739, -1.140363, 2.278183, 1, 0, 0.282353, 1,
1.698757, -0.01982907, 1.603566, 1, 0, 0.2745098, 1,
1.709227, -1.127539, 1.126977, 1, 0, 0.2705882, 1,
1.71099, -0.5611068, 2.449437, 1, 0, 0.2627451, 1,
1.713505, 1.500659, -0.4664517, 1, 0, 0.2588235, 1,
1.721997, 0.1271061, -0.1493814, 1, 0, 0.2509804, 1,
1.734497, 0.2462488, 0.5347368, 1, 0, 0.2470588, 1,
1.734576, 0.5961163, -0.9485599, 1, 0, 0.2392157, 1,
1.743153, 2.224507, 0.1642278, 1, 0, 0.2352941, 1,
1.753169, -0.4223417, 2.212962, 1, 0, 0.227451, 1,
1.75905, 0.3162287, 1.40525, 1, 0, 0.2235294, 1,
1.761065, -1.091741, 1.543081, 1, 0, 0.2156863, 1,
1.765906, -0.957809, 2.576323, 1, 0, 0.2117647, 1,
1.797653, -1.204486, 2.981261, 1, 0, 0.2039216, 1,
1.801213, 0.9891795, 0.7413532, 1, 0, 0.1960784, 1,
1.803874, -1.549709, 0.673319, 1, 0, 0.1921569, 1,
1.822337, -1.616887, 4.038592, 1, 0, 0.1843137, 1,
1.832865, 1.960701, 1.414147, 1, 0, 0.1803922, 1,
1.896018, -0.9502174, 2.407224, 1, 0, 0.172549, 1,
1.903991, -0.9046373, 0.32779, 1, 0, 0.1686275, 1,
1.933458, 0.02523453, 2.309794, 1, 0, 0.1607843, 1,
1.995232, 0.9213033, 0.5942122, 1, 0, 0.1568628, 1,
2.017402, -0.7113578, -0.2709393, 1, 0, 0.1490196, 1,
2.038067, 1.155987, 3.394747, 1, 0, 0.145098, 1,
2.045899, 0.4289109, 1.384015, 1, 0, 0.1372549, 1,
2.05296, 0.7211363, 1.216297, 1, 0, 0.1333333, 1,
2.062449, -1.306759, 1.441091, 1, 0, 0.1254902, 1,
2.065549, -0.7276949, 2.471751, 1, 0, 0.1215686, 1,
2.078751, -0.4130213, 3.393019, 1, 0, 0.1137255, 1,
2.129951, 1.974485, 0.68097, 1, 0, 0.1098039, 1,
2.136504, -1.520865, 4.192149, 1, 0, 0.1019608, 1,
2.147858, -0.7344756, 2.430998, 1, 0, 0.09411765, 1,
2.15019, -0.6800425, 1.918186, 1, 0, 0.09019608, 1,
2.190311, 0.7040265, 0.7998264, 1, 0, 0.08235294, 1,
2.225628, -1.843203, 0.02752326, 1, 0, 0.07843138, 1,
2.286801, 0.2878818, 1.722931, 1, 0, 0.07058824, 1,
2.29201, 0.208133, 0.8588066, 1, 0, 0.06666667, 1,
2.300833, -0.8708949, 1.863059, 1, 0, 0.05882353, 1,
2.351615, 0.9513523, 0.07938714, 1, 0, 0.05490196, 1,
2.402582, 0.9735129, 2.493722, 1, 0, 0.04705882, 1,
2.420723, 1.424875, 1.08628, 1, 0, 0.04313726, 1,
2.427133, -0.8825616, 1.945456, 1, 0, 0.03529412, 1,
2.500123, -0.5950181, 1.291348, 1, 0, 0.03137255, 1,
2.568714, 0.5545114, 1.698776, 1, 0, 0.02352941, 1,
2.78072, 0.6327916, 1.61077, 1, 0, 0.01960784, 1,
2.847738, 0.4017451, 1.563819, 1, 0, 0.01176471, 1,
2.879536, 1.69405, 0.4804497, 1, 0, 0.007843138, 1
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
-0.1133995, -4.149686, -7.109092, 0, -0.5, 0.5, 0.5,
-0.1133995, -4.149686, -7.109092, 1, -0.5, 0.5, 0.5,
-0.1133995, -4.149686, -7.109092, 1, 1.5, 0.5, 0.5,
-0.1133995, -4.149686, -7.109092, 0, 1.5, 0.5, 0.5
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
-4.12094, 0.1946186, -7.109092, 0, -0.5, 0.5, 0.5,
-4.12094, 0.1946186, -7.109092, 1, -0.5, 0.5, 0.5,
-4.12094, 0.1946186, -7.109092, 1, 1.5, 0.5, 0.5,
-4.12094, 0.1946186, -7.109092, 0, 1.5, 0.5, 0.5
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
-4.12094, -4.149686, -0.1367517, 0, -0.5, 0.5, 0.5,
-4.12094, -4.149686, -0.1367517, 1, -0.5, 0.5, 0.5,
-4.12094, -4.149686, -0.1367517, 1, 1.5, 0.5, 0.5,
-4.12094, -4.149686, -0.1367517, 0, 1.5, 0.5, 0.5
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
-3, -3.147154, -5.500091,
2, -3.147154, -5.500091,
-3, -3.147154, -5.500091,
-3, -3.314243, -5.768258,
-2, -3.147154, -5.500091,
-2, -3.314243, -5.768258,
-1, -3.147154, -5.500091,
-1, -3.314243, -5.768258,
0, -3.147154, -5.500091,
0, -3.314243, -5.768258,
1, -3.147154, -5.500091,
1, -3.314243, -5.768258,
2, -3.147154, -5.500091,
2, -3.314243, -5.768258
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
-3, -3.64842, -6.304592, 0, -0.5, 0.5, 0.5,
-3, -3.64842, -6.304592, 1, -0.5, 0.5, 0.5,
-3, -3.64842, -6.304592, 1, 1.5, 0.5, 0.5,
-3, -3.64842, -6.304592, 0, 1.5, 0.5, 0.5,
-2, -3.64842, -6.304592, 0, -0.5, 0.5, 0.5,
-2, -3.64842, -6.304592, 1, -0.5, 0.5, 0.5,
-2, -3.64842, -6.304592, 1, 1.5, 0.5, 0.5,
-2, -3.64842, -6.304592, 0, 1.5, 0.5, 0.5,
-1, -3.64842, -6.304592, 0, -0.5, 0.5, 0.5,
-1, -3.64842, -6.304592, 1, -0.5, 0.5, 0.5,
-1, -3.64842, -6.304592, 1, 1.5, 0.5, 0.5,
-1, -3.64842, -6.304592, 0, 1.5, 0.5, 0.5,
0, -3.64842, -6.304592, 0, -0.5, 0.5, 0.5,
0, -3.64842, -6.304592, 1, -0.5, 0.5, 0.5,
0, -3.64842, -6.304592, 1, 1.5, 0.5, 0.5,
0, -3.64842, -6.304592, 0, 1.5, 0.5, 0.5,
1, -3.64842, -6.304592, 0, -0.5, 0.5, 0.5,
1, -3.64842, -6.304592, 1, -0.5, 0.5, 0.5,
1, -3.64842, -6.304592, 1, 1.5, 0.5, 0.5,
1, -3.64842, -6.304592, 0, 1.5, 0.5, 0.5,
2, -3.64842, -6.304592, 0, -0.5, 0.5, 0.5,
2, -3.64842, -6.304592, 1, -0.5, 0.5, 0.5,
2, -3.64842, -6.304592, 1, 1.5, 0.5, 0.5,
2, -3.64842, -6.304592, 0, 1.5, 0.5, 0.5
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
-3.196123, -3, -5.500091,
-3.196123, 3, -5.500091,
-3.196123, -3, -5.500091,
-3.350259, -3, -5.768258,
-3.196123, -2, -5.500091,
-3.350259, -2, -5.768258,
-3.196123, -1, -5.500091,
-3.350259, -1, -5.768258,
-3.196123, 0, -5.500091,
-3.350259, 0, -5.768258,
-3.196123, 1, -5.500091,
-3.350259, 1, -5.768258,
-3.196123, 2, -5.500091,
-3.350259, 2, -5.768258,
-3.196123, 3, -5.500091,
-3.350259, 3, -5.768258
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
-3.658532, -3, -6.304592, 0, -0.5, 0.5, 0.5,
-3.658532, -3, -6.304592, 1, -0.5, 0.5, 0.5,
-3.658532, -3, -6.304592, 1, 1.5, 0.5, 0.5,
-3.658532, -3, -6.304592, 0, 1.5, 0.5, 0.5,
-3.658532, -2, -6.304592, 0, -0.5, 0.5, 0.5,
-3.658532, -2, -6.304592, 1, -0.5, 0.5, 0.5,
-3.658532, -2, -6.304592, 1, 1.5, 0.5, 0.5,
-3.658532, -2, -6.304592, 0, 1.5, 0.5, 0.5,
-3.658532, -1, -6.304592, 0, -0.5, 0.5, 0.5,
-3.658532, -1, -6.304592, 1, -0.5, 0.5, 0.5,
-3.658532, -1, -6.304592, 1, 1.5, 0.5, 0.5,
-3.658532, -1, -6.304592, 0, 1.5, 0.5, 0.5,
-3.658532, 0, -6.304592, 0, -0.5, 0.5, 0.5,
-3.658532, 0, -6.304592, 1, -0.5, 0.5, 0.5,
-3.658532, 0, -6.304592, 1, 1.5, 0.5, 0.5,
-3.658532, 0, -6.304592, 0, 1.5, 0.5, 0.5,
-3.658532, 1, -6.304592, 0, -0.5, 0.5, 0.5,
-3.658532, 1, -6.304592, 1, -0.5, 0.5, 0.5,
-3.658532, 1, -6.304592, 1, 1.5, 0.5, 0.5,
-3.658532, 1, -6.304592, 0, 1.5, 0.5, 0.5,
-3.658532, 2, -6.304592, 0, -0.5, 0.5, 0.5,
-3.658532, 2, -6.304592, 1, -0.5, 0.5, 0.5,
-3.658532, 2, -6.304592, 1, 1.5, 0.5, 0.5,
-3.658532, 2, -6.304592, 0, 1.5, 0.5, 0.5,
-3.658532, 3, -6.304592, 0, -0.5, 0.5, 0.5,
-3.658532, 3, -6.304592, 1, -0.5, 0.5, 0.5,
-3.658532, 3, -6.304592, 1, 1.5, 0.5, 0.5,
-3.658532, 3, -6.304592, 0, 1.5, 0.5, 0.5
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
-3.196123, -3.147154, -4,
-3.196123, -3.147154, 4,
-3.196123, -3.147154, -4,
-3.350259, -3.314243, -4,
-3.196123, -3.147154, -2,
-3.350259, -3.314243, -2,
-3.196123, -3.147154, 0,
-3.350259, -3.314243, 0,
-3.196123, -3.147154, 2,
-3.350259, -3.314243, 2,
-3.196123, -3.147154, 4,
-3.350259, -3.314243, 4
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
-3.658532, -3.64842, -4, 0, -0.5, 0.5, 0.5,
-3.658532, -3.64842, -4, 1, -0.5, 0.5, 0.5,
-3.658532, -3.64842, -4, 1, 1.5, 0.5, 0.5,
-3.658532, -3.64842, -4, 0, 1.5, 0.5, 0.5,
-3.658532, -3.64842, -2, 0, -0.5, 0.5, 0.5,
-3.658532, -3.64842, -2, 1, -0.5, 0.5, 0.5,
-3.658532, -3.64842, -2, 1, 1.5, 0.5, 0.5,
-3.658532, -3.64842, -2, 0, 1.5, 0.5, 0.5,
-3.658532, -3.64842, 0, 0, -0.5, 0.5, 0.5,
-3.658532, -3.64842, 0, 1, -0.5, 0.5, 0.5,
-3.658532, -3.64842, 0, 1, 1.5, 0.5, 0.5,
-3.658532, -3.64842, 0, 0, 1.5, 0.5, 0.5,
-3.658532, -3.64842, 2, 0, -0.5, 0.5, 0.5,
-3.658532, -3.64842, 2, 1, -0.5, 0.5, 0.5,
-3.658532, -3.64842, 2, 1, 1.5, 0.5, 0.5,
-3.658532, -3.64842, 2, 0, 1.5, 0.5, 0.5,
-3.658532, -3.64842, 4, 0, -0.5, 0.5, 0.5,
-3.658532, -3.64842, 4, 1, -0.5, 0.5, 0.5,
-3.658532, -3.64842, 4, 1, 1.5, 0.5, 0.5,
-3.658532, -3.64842, 4, 0, 1.5, 0.5, 0.5
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
-3.196123, -3.147154, -5.500091,
-3.196123, 3.536391, -5.500091,
-3.196123, -3.147154, 5.226587,
-3.196123, 3.536391, 5.226587,
-3.196123, -3.147154, -5.500091,
-3.196123, -3.147154, 5.226587,
-3.196123, 3.536391, -5.500091,
-3.196123, 3.536391, 5.226587,
-3.196123, -3.147154, -5.500091,
2.969324, -3.147154, -5.500091,
-3.196123, -3.147154, 5.226587,
2.969324, -3.147154, 5.226587,
-3.196123, 3.536391, -5.500091,
2.969324, 3.536391, -5.500091,
-3.196123, 3.536391, 5.226587,
2.969324, 3.536391, 5.226587,
2.969324, -3.147154, -5.500091,
2.969324, 3.536391, -5.500091,
2.969324, -3.147154, 5.226587,
2.969324, 3.536391, 5.226587,
2.969324, -3.147154, -5.500091,
2.969324, -3.147154, 5.226587,
2.969324, 3.536391, -5.500091,
2.969324, 3.536391, 5.226587
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
var radius = 7.508917;
var distance = 33.40802;
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
mvMatrix.translate( 0.1133995, -0.1946186, 0.1367517 );
mvMatrix.scale( 1.316821, 1.214743, 0.7568781 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.40802);
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
Magnesium_arsenate<-read.table("Magnesium_arsenate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Magnesium_arsenate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Magnesium_arsenate' not found
```

```r
y<-Magnesium_arsenate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Magnesium_arsenate' not found
```

```r
z<-Magnesium_arsenate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Magnesium_arsenate' not found
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
-3.106335, -0.8437198, -1.858788, 0, 0, 1, 1, 1,
-3.004445, -1.760824, -1.655334, 1, 0, 0, 1, 1,
-2.78392, -0.1349197, -1.513852, 1, 0, 0, 1, 1,
-2.724714, -1.032035, -0.4474806, 1, 0, 0, 1, 1,
-2.621638, 1.079521, 0.1792976, 1, 0, 0, 1, 1,
-2.513176, -0.449725, -0.9058647, 1, 0, 0, 1, 1,
-2.467275, -1.31739, -2.058211, 0, 0, 0, 1, 1,
-2.389131, 0.932278, -1.008653, 0, 0, 0, 1, 1,
-2.363057, -0.8973733, -2.867549, 0, 0, 0, 1, 1,
-2.302555, 1.835655, 0.4892074, 0, 0, 0, 1, 1,
-2.282381, -1.127642, -2.021508, 0, 0, 0, 1, 1,
-2.17608, -1.373, -1.321136, 0, 0, 0, 1, 1,
-2.167878, 0.7703273, -2.056489, 0, 0, 0, 1, 1,
-2.122886, 0.128116, -0.9246158, 1, 1, 1, 1, 1,
-2.114872, -2.365975, -3.516439, 1, 1, 1, 1, 1,
-2.069782, -0.1113434, -2.065775, 1, 1, 1, 1, 1,
-2.04453, 0.0360846, -1.075032, 1, 1, 1, 1, 1,
-2.025567, 0.4392414, -0.030397, 1, 1, 1, 1, 1,
-2.024333, 0.3133438, -2.79091, 1, 1, 1, 1, 1,
-2.008919, -1.301063, -2.605573, 1, 1, 1, 1, 1,
-1.998593, 0.7014503, 0.7757749, 1, 1, 1, 1, 1,
-1.922603, -2.751111, -0.9598289, 1, 1, 1, 1, 1,
-1.917779, -0.1091428, -2.975751, 1, 1, 1, 1, 1,
-1.912845, -0.3073842, -2.829339, 1, 1, 1, 1, 1,
-1.909328, 1.329372, -3.017841, 1, 1, 1, 1, 1,
-1.888288, -0.5075957, -3.670637, 1, 1, 1, 1, 1,
-1.862396, -0.6400706, -1.969107, 1, 1, 1, 1, 1,
-1.862117, -0.5397666, -3.482577, 1, 1, 1, 1, 1,
-1.841717, -0.1693773, -2.137978, 0, 0, 1, 1, 1,
-1.836852, -0.5428102, -2.078825, 1, 0, 0, 1, 1,
-1.828374, 0.5006925, -1.288666, 1, 0, 0, 1, 1,
-1.826253, 0.6607574, -1.12088, 1, 0, 0, 1, 1,
-1.815261, 2.888672, -0.8973522, 1, 0, 0, 1, 1,
-1.788828, 1.428908, -1.568006, 1, 0, 0, 1, 1,
-1.767542, 0.5044017, -0.05035936, 0, 0, 0, 1, 1,
-1.766834, -0.3763976, 1.243048, 0, 0, 0, 1, 1,
-1.758186, 0.1868117, -2.847308, 0, 0, 0, 1, 1,
-1.757475, -0.1630981, -0.0788838, 0, 0, 0, 1, 1,
-1.746521, 0.3285461, -1.900361, 0, 0, 0, 1, 1,
-1.745174, 0.4449137, -1.061946, 0, 0, 0, 1, 1,
-1.736494, 0.9134549, 0.1595488, 0, 0, 0, 1, 1,
-1.732163, -1.557616, -1.399732, 1, 1, 1, 1, 1,
-1.730509, 0.3116024, -3.163465, 1, 1, 1, 1, 1,
-1.715073, 0.4633802, -1.013432, 1, 1, 1, 1, 1,
-1.701754, 0.1614857, -1.171118, 1, 1, 1, 1, 1,
-1.69555, 0.125797, -2.669794, 1, 1, 1, 1, 1,
-1.684475, 0.484184, -2.100709, 1, 1, 1, 1, 1,
-1.678863, 0.09867901, -0.5639725, 1, 1, 1, 1, 1,
-1.670442, 0.4017586, -0.4963863, 1, 1, 1, 1, 1,
-1.665581, 0.3629363, -0.5173232, 1, 1, 1, 1, 1,
-1.662291, 0.3000131, -1.030208, 1, 1, 1, 1, 1,
-1.627449, 0.6938102, -2.530117, 1, 1, 1, 1, 1,
-1.626462, 0.717652, -0.3537383, 1, 1, 1, 1, 1,
-1.62252, -0.1565858, -1.871279, 1, 1, 1, 1, 1,
-1.618488, -0.084584, -1.253855, 1, 1, 1, 1, 1,
-1.607545, 1.920554, 0.5498823, 1, 1, 1, 1, 1,
-1.562652, 0.1015431, -3.106155, 0, 0, 1, 1, 1,
-1.56207, 1.670871, 0.2688468, 1, 0, 0, 1, 1,
-1.555137, -0.1976292, -2.974192, 1, 0, 0, 1, 1,
-1.536642, 0.04113282, -1.325269, 1, 0, 0, 1, 1,
-1.529111, 0.3518268, -0.761107, 1, 0, 0, 1, 1,
-1.528841, -0.1994774, -2.072338, 1, 0, 0, 1, 1,
-1.49837, -0.8653116, -1.276709, 0, 0, 0, 1, 1,
-1.483122, -0.2528441, -0.696525, 0, 0, 0, 1, 1,
-1.482385, -0.7259151, -2.490491, 0, 0, 0, 1, 1,
-1.471, -0.1374627, -1.77092, 0, 0, 0, 1, 1,
-1.470618, 2.416104, -0.09184027, 0, 0, 0, 1, 1,
-1.459018, -1.049867, -1.791853, 0, 0, 0, 1, 1,
-1.444712, 0.6102926, 0.9617071, 0, 0, 0, 1, 1,
-1.441899, -0.5887612, -1.859052, 1, 1, 1, 1, 1,
-1.440968, -0.5997825, -2.408622, 1, 1, 1, 1, 1,
-1.436744, -2.30536, -1.075162, 1, 1, 1, 1, 1,
-1.428503, -0.2493344, -2.277476, 1, 1, 1, 1, 1,
-1.428123, 0.6538581, -1.261027, 1, 1, 1, 1, 1,
-1.423307, -3.049821, -1.655621, 1, 1, 1, 1, 1,
-1.414188, -1.091662, -2.827712, 1, 1, 1, 1, 1,
-1.39782, 3.335549, 0.0694878, 1, 1, 1, 1, 1,
-1.393019, 0.1105527, -1.363093, 1, 1, 1, 1, 1,
-1.373683, 0.8145549, -0.8111282, 1, 1, 1, 1, 1,
-1.372395, 1.08475, 0.05143515, 1, 1, 1, 1, 1,
-1.357665, -0.6844646, -1.946447, 1, 1, 1, 1, 1,
-1.353395, 2.145786, -2.467237, 1, 1, 1, 1, 1,
-1.344365, 0.6841099, -0.8539279, 1, 1, 1, 1, 1,
-1.339075, -1.285149, -2.15848, 1, 1, 1, 1, 1,
-1.331716, -0.3114202, -0.6370559, 0, 0, 1, 1, 1,
-1.33129, -1.728735, -1.537454, 1, 0, 0, 1, 1,
-1.326811, 0.2807613, -2.106403, 1, 0, 0, 1, 1,
-1.323977, -0.06260882, -1.988011, 1, 0, 0, 1, 1,
-1.320969, 0.01824112, -1.609974, 1, 0, 0, 1, 1,
-1.299453, 0.3167847, -0.9432492, 1, 0, 0, 1, 1,
-1.293566, 0.0499439, -1.474979, 0, 0, 0, 1, 1,
-1.279482, -1.198308, -2.061649, 0, 0, 0, 1, 1,
-1.275901, 0.7735366, -1.348988, 0, 0, 0, 1, 1,
-1.273518, -0.5453213, -2.858902, 0, 0, 0, 1, 1,
-1.258046, 0.6146514, -1.64563, 0, 0, 0, 1, 1,
-1.244155, 0.05161736, -0.6690043, 0, 0, 0, 1, 1,
-1.22945, -0.7804101, -1.849708, 0, 0, 0, 1, 1,
-1.222743, -0.4804002, -1.893196, 1, 1, 1, 1, 1,
-1.221265, 0.9738856, -1.86951, 1, 1, 1, 1, 1,
-1.216553, 2.841152, -0.2628511, 1, 1, 1, 1, 1,
-1.212439, -0.1816064, -2.237155, 1, 1, 1, 1, 1,
-1.212225, -0.002487391, 0.3907973, 1, 1, 1, 1, 1,
-1.20999, 0.374611, -1.016667, 1, 1, 1, 1, 1,
-1.202834, 0.3169516, 1.132001, 1, 1, 1, 1, 1,
-1.202307, -0.03472282, -0.3270321, 1, 1, 1, 1, 1,
-1.201423, -0.04924378, -1.992863, 1, 1, 1, 1, 1,
-1.192094, -0.1745706, -3.662366, 1, 1, 1, 1, 1,
-1.189964, -0.06143184, -1.678948, 1, 1, 1, 1, 1,
-1.189476, 0.5075916, -1.395598, 1, 1, 1, 1, 1,
-1.186457, 0.04486949, -0.3640819, 1, 1, 1, 1, 1,
-1.181523, 1.166144, -1.885049, 1, 1, 1, 1, 1,
-1.172475, -0.5050174, -1.38295, 1, 1, 1, 1, 1,
-1.147777, 0.511456, -1.093816, 0, 0, 1, 1, 1,
-1.137518, -1.15014, -4.44528, 1, 0, 0, 1, 1,
-1.135846, -0.9289451, -2.912636, 1, 0, 0, 1, 1,
-1.13002, -1.233189, -1.026933, 1, 0, 0, 1, 1,
-1.127993, -0.1651458, -2.762064, 1, 0, 0, 1, 1,
-1.124837, -1.185693, -1.517408, 1, 0, 0, 1, 1,
-1.113341, -2.220598, -3.45045, 0, 0, 0, 1, 1,
-1.108122, 0.3936894, -0.6269164, 0, 0, 0, 1, 1,
-1.106861, 0.3120285, -1.213325, 0, 0, 0, 1, 1,
-1.10637, 0.5380545, -1.717167, 0, 0, 0, 1, 1,
-1.101991, 1.412552, -1.758882, 0, 0, 0, 1, 1,
-1.101365, 1.349521, 0.2016213, 0, 0, 0, 1, 1,
-1.087653, -0.633397, -1.07956, 0, 0, 0, 1, 1,
-1.086896, -1.016526, -2.4038, 1, 1, 1, 1, 1,
-1.084216, -1.70705, -2.979421, 1, 1, 1, 1, 1,
-1.072832, -0.2584696, -1.347317, 1, 1, 1, 1, 1,
-1.072214, -0.06663977, -0.128497, 1, 1, 1, 1, 1,
-1.070974, 1.434631, 0.1093834, 1, 1, 1, 1, 1,
-1.070555, -1.292817, 0.03362529, 1, 1, 1, 1, 1,
-1.067916, 1.322469, -1.593, 1, 1, 1, 1, 1,
-1.064589, -0.225599, 0.6280019, 1, 1, 1, 1, 1,
-1.060035, 1.60348, 0.6190836, 1, 1, 1, 1, 1,
-1.05784, 0.6033629, -2.458453, 1, 1, 1, 1, 1,
-1.052717, -1.073396, -1.062445, 1, 1, 1, 1, 1,
-1.052203, -0.9219487, -1.569701, 1, 1, 1, 1, 1,
-1.03551, 0.342986, -2.204634, 1, 1, 1, 1, 1,
-1.032646, 0.3150251, 1.07466, 1, 1, 1, 1, 1,
-1.024427, 1.137704, -0.7605575, 1, 1, 1, 1, 1,
-1.024218, -0.9012063, -0.9748635, 0, 0, 1, 1, 1,
-1.020565, -1.288728, -2.302945, 1, 0, 0, 1, 1,
-1.018408, 2.227851, -0.4607168, 1, 0, 0, 1, 1,
-1.016857, -0.5749898, -1.746105, 1, 0, 0, 1, 1,
-1.014755, -0.2597836, -1.983096, 1, 0, 0, 1, 1,
-0.9964451, 1.045526, -0.1789433, 1, 0, 0, 1, 1,
-0.9793714, 2.171603, 2.38026, 0, 0, 0, 1, 1,
-0.9773172, -0.6843435, -2.586458, 0, 0, 0, 1, 1,
-0.9759336, -0.5061145, -3.204242, 0, 0, 0, 1, 1,
-0.972698, -0.7654489, -5.340407, 0, 0, 0, 1, 1,
-0.972432, 1.896702, -0.01305718, 0, 0, 0, 1, 1,
-0.9681495, -0.1059055, -0.2661535, 0, 0, 0, 1, 1,
-0.9570405, -0.4187405, -1.676312, 0, 0, 0, 1, 1,
-0.9555347, -0.586484, -2.599932, 1, 1, 1, 1, 1,
-0.9488328, -0.6170666, -2.503698, 1, 1, 1, 1, 1,
-0.9470966, -0.2268151, -1.505109, 1, 1, 1, 1, 1,
-0.9460794, 0.8037391, -1.180033, 1, 1, 1, 1, 1,
-0.9456631, 0.07949492, -2.558136, 1, 1, 1, 1, 1,
-0.9333757, 1.113588, -0.3480614, 1, 1, 1, 1, 1,
-0.9293221, -0.6723583, -3.501596, 1, 1, 1, 1, 1,
-0.9227905, -1.195726, -2.820771, 1, 1, 1, 1, 1,
-0.9195676, 0.03935, -1.528779, 1, 1, 1, 1, 1,
-0.919527, -0.9909517, -2.56149, 1, 1, 1, 1, 1,
-0.909126, 0.3817574, -1.199106, 1, 1, 1, 1, 1,
-0.9045886, 1.131323, -1.329002, 1, 1, 1, 1, 1,
-0.8936594, -0.1449721, -1.82079, 1, 1, 1, 1, 1,
-0.8862173, 0.885314, -0.5077315, 1, 1, 1, 1, 1,
-0.8856891, -2.560118, -2.094437, 1, 1, 1, 1, 1,
-0.8829967, 0.964039, -0.711293, 0, 0, 1, 1, 1,
-0.8765965, -0.9189447, -2.357164, 1, 0, 0, 1, 1,
-0.8731986, 0.2479182, -1.612366, 1, 0, 0, 1, 1,
-0.8715112, 0.7190511, 0.01291615, 1, 0, 0, 1, 1,
-0.8677571, 0.4651566, -1.454797, 1, 0, 0, 1, 1,
-0.8652136, 0.2788472, -0.2113257, 1, 0, 0, 1, 1,
-0.8603092, -0.170689, -1.344887, 0, 0, 0, 1, 1,
-0.8596988, -0.7411937, -2.643184, 0, 0, 0, 1, 1,
-0.8569222, 0.9955211, -0.4581114, 0, 0, 0, 1, 1,
-0.8567072, -1.163711, -4.273119, 0, 0, 0, 1, 1,
-0.8467925, 0.4708883, -1.641417, 0, 0, 0, 1, 1,
-0.8462512, 1.28909, -1.215226, 0, 0, 0, 1, 1,
-0.8433877, -0.7314626, -2.89959, 0, 0, 0, 1, 1,
-0.8424596, 0.1613468, -2.766426, 1, 1, 1, 1, 1,
-0.8402146, 0.4509895, -1.618186, 1, 1, 1, 1, 1,
-0.8399912, -0.6348299, -1.655595, 1, 1, 1, 1, 1,
-0.8399807, 0.2266334, -2.342276, 1, 1, 1, 1, 1,
-0.8322972, 0.8244976, 0.6372374, 1, 1, 1, 1, 1,
-0.8318207, -0.8001416, -0.9763081, 1, 1, 1, 1, 1,
-0.826229, -1.174549, -3.834411, 1, 1, 1, 1, 1,
-0.8245254, -0.208398, -2.289457, 1, 1, 1, 1, 1,
-0.8217283, 0.4416451, -0.7733294, 1, 1, 1, 1, 1,
-0.8096746, 0.6549297, -1.13358, 1, 1, 1, 1, 1,
-0.8092423, 1.573227, -1.788742, 1, 1, 1, 1, 1,
-0.8083118, 0.177553, -1.224675, 1, 1, 1, 1, 1,
-0.8048406, -1.189071, -2.083681, 1, 1, 1, 1, 1,
-0.8045808, 0.5207419, -1.07979, 1, 1, 1, 1, 1,
-0.8020191, 0.3728849, -0.6964266, 1, 1, 1, 1, 1,
-0.7953466, -1.274269, -1.459948, 0, 0, 1, 1, 1,
-0.7886449, 1.255988, -2.074239, 1, 0, 0, 1, 1,
-0.787819, -1.399725, -2.815502, 1, 0, 0, 1, 1,
-0.7827311, -2.720649, -1.785009, 1, 0, 0, 1, 1,
-0.7816561, -1.075017, -1.790871, 1, 0, 0, 1, 1,
-0.7816389, -0.4382694, -1.864625, 1, 0, 0, 1, 1,
-0.7783759, -0.0141386, -1.139965, 0, 0, 0, 1, 1,
-0.7777085, -0.5200009, -2.074328, 0, 0, 0, 1, 1,
-0.7753347, 1.043201, 0.156304, 0, 0, 0, 1, 1,
-0.7714441, -0.1928947, -1.101294, 0, 0, 0, 1, 1,
-0.7623532, 0.8041889, -1.04566, 0, 0, 0, 1, 1,
-0.7583785, 1.189857, 0.9578515, 0, 0, 0, 1, 1,
-0.7558595, -1.297098, -2.775169, 0, 0, 0, 1, 1,
-0.7491951, -1.064538, -2.326908, 1, 1, 1, 1, 1,
-0.7457365, -0.0002852411, -1.784901, 1, 1, 1, 1, 1,
-0.7446802, 0.9695678, -0.3879808, 1, 1, 1, 1, 1,
-0.7445679, -1.531296, -2.753502, 1, 1, 1, 1, 1,
-0.7426818, -0.5277017, -1.080292, 1, 1, 1, 1, 1,
-0.74185, -1.528621, -3.002953, 1, 1, 1, 1, 1,
-0.7399392, 0.8683422, 0.03730766, 1, 1, 1, 1, 1,
-0.7312977, 0.6938924, -1.535933, 1, 1, 1, 1, 1,
-0.729823, -0.5966375, -1.513012, 1, 1, 1, 1, 1,
-0.7252636, -0.741644, -3.171066, 1, 1, 1, 1, 1,
-0.7224897, -1.592891, -3.178614, 1, 1, 1, 1, 1,
-0.7214664, 0.9488578, -1.039911, 1, 1, 1, 1, 1,
-0.7202372, -2.150639, -3.776405, 1, 1, 1, 1, 1,
-0.7123194, 0.3607127, -0.7609578, 1, 1, 1, 1, 1,
-0.7108969, -0.2809128, -2.678644, 1, 1, 1, 1, 1,
-0.7087192, 2.253925, 1.881444, 0, 0, 1, 1, 1,
-0.7071289, -0.9882883, -2.784238, 1, 0, 0, 1, 1,
-0.7031266, 0.6926693, 0.901767, 1, 0, 0, 1, 1,
-0.7013468, -0.5723814, -2.253383, 1, 0, 0, 1, 1,
-0.6997671, -1.652607, -2.57394, 1, 0, 0, 1, 1,
-0.6951125, 1.153735, -1.775592, 1, 0, 0, 1, 1,
-0.6934366, 0.8649106, -0.1621336, 0, 0, 0, 1, 1,
-0.6832573, 0.07745618, -1.338179, 0, 0, 0, 1, 1,
-0.6828409, 1.185507, -1.08472, 0, 0, 0, 1, 1,
-0.6756568, 0.7176874, -0.3323302, 0, 0, 0, 1, 1,
-0.6734307, -0.4514431, -1.398892, 0, 0, 0, 1, 1,
-0.6722238, -0.9088671, -1.263827, 0, 0, 0, 1, 1,
-0.6650857, 0.4712527, -1.429221, 0, 0, 0, 1, 1,
-0.6572028, -0.4112134, -2.915535, 1, 1, 1, 1, 1,
-0.6549621, 0.01597261, -1.580042, 1, 1, 1, 1, 1,
-0.6532899, 0.9580676, -0.982836, 1, 1, 1, 1, 1,
-0.6521469, 0.166896, -1.218691, 1, 1, 1, 1, 1,
-0.6432534, -0.8476869, -1.953525, 1, 1, 1, 1, 1,
-0.6416573, -0.9453233, -2.342645, 1, 1, 1, 1, 1,
-0.6412913, 1.097579, -1.207801, 1, 1, 1, 1, 1,
-0.6397384, -1.787924, -2.600516, 1, 1, 1, 1, 1,
-0.6394756, 0.514259, -0.8151546, 1, 1, 1, 1, 1,
-0.6329231, -2.371886, -3.935651, 1, 1, 1, 1, 1,
-0.6323461, 1.757429, -0.1266851, 1, 1, 1, 1, 1,
-0.6310446, 2.001029, -1.461722, 1, 1, 1, 1, 1,
-0.6305879, -0.840363, -2.018487, 1, 1, 1, 1, 1,
-0.6278661, -0.6150021, -2.002888, 1, 1, 1, 1, 1,
-0.6219133, -0.4164979, -1.030138, 1, 1, 1, 1, 1,
-0.6146312, 0.7654508, 0.09443089, 0, 0, 1, 1, 1,
-0.6103702, -0.9964553, -2.569144, 1, 0, 0, 1, 1,
-0.6101008, -0.1746213, -2.626861, 1, 0, 0, 1, 1,
-0.60865, -1.800662, -2.194445, 1, 0, 0, 1, 1,
-0.6064747, -0.3369733, -2.234138, 1, 0, 0, 1, 1,
-0.6061878, 1.213049, -0.9141374, 1, 0, 0, 1, 1,
-0.6039555, -0.315514, -1.42148, 0, 0, 0, 1, 1,
-0.6025893, -0.6456772, -2.184938, 0, 0, 0, 1, 1,
-0.6005815, 0.2656549, -1.823424, 0, 0, 0, 1, 1,
-0.5995604, -1.302774, -3.763386, 0, 0, 0, 1, 1,
-0.5988765, -0.7915505, -3.976948, 0, 0, 0, 1, 1,
-0.5886708, 1.627008, 0.7745566, 0, 0, 0, 1, 1,
-0.5802611, 0.4874938, 0.3223121, 0, 0, 0, 1, 1,
-0.5780532, 0.000123283, -2.289739, 1, 1, 1, 1, 1,
-0.5753514, -1.010061, -4.587709, 1, 1, 1, 1, 1,
-0.5751096, 0.04659958, 0.2032602, 1, 1, 1, 1, 1,
-0.5685573, 1.248354, -0.3323985, 1, 1, 1, 1, 1,
-0.5623984, -0.3374155, -2.657947, 1, 1, 1, 1, 1,
-0.5597522, 0.7057089, -2.592625, 1, 1, 1, 1, 1,
-0.5586733, -0.647998, -2.658874, 1, 1, 1, 1, 1,
-0.5583541, -0.2348511, -2.490556, 1, 1, 1, 1, 1,
-0.5569555, 0.1178744, -1.34338, 1, 1, 1, 1, 1,
-0.5534122, 2.7025, 0.4002944, 1, 1, 1, 1, 1,
-0.5508151, 0.7388899, -1.233857, 1, 1, 1, 1, 1,
-0.5446729, 0.7636343, -1.244699, 1, 1, 1, 1, 1,
-0.5404844, 0.5207245, -1.030311, 1, 1, 1, 1, 1,
-0.5373411, 0.1831015, -0.7069055, 1, 1, 1, 1, 1,
-0.536607, -0.08194014, -1.115041, 1, 1, 1, 1, 1,
-0.5281721, -0.0898497, 0.2274735, 0, 0, 1, 1, 1,
-0.5259956, 0.4737633, -1.047616, 1, 0, 0, 1, 1,
-0.5255102, 0.04335571, -2.67976, 1, 0, 0, 1, 1,
-0.5247594, -0.04953046, -1.970322, 1, 0, 0, 1, 1,
-0.5220427, -0.4009586, -1.898158, 1, 0, 0, 1, 1,
-0.5213091, -0.9140601, -3.835004, 1, 0, 0, 1, 1,
-0.5193412, 0.3442298, -0.8154504, 0, 0, 0, 1, 1,
-0.5150343, 0.04368403, 0.07856931, 0, 0, 0, 1, 1,
-0.5127371, -1.324492, -3.237256, 0, 0, 0, 1, 1,
-0.5120904, -0.9368849, -2.710343, 0, 0, 0, 1, 1,
-0.5100902, -1.819854, -3.216465, 0, 0, 0, 1, 1,
-0.5072039, -1.281517, -1.719492, 0, 0, 0, 1, 1,
-0.5007254, -0.8915107, -2.848955, 0, 0, 0, 1, 1,
-0.4981466, -0.2046794, -4.358293, 1, 1, 1, 1, 1,
-0.4952244, -1.489695, -4.055086, 1, 1, 1, 1, 1,
-0.492999, 1.520525, 0.6293341, 1, 1, 1, 1, 1,
-0.4928389, -0.02509275, 0.03799146, 1, 1, 1, 1, 1,
-0.4906284, -0.1259527, -0.5917489, 1, 1, 1, 1, 1,
-0.4902768, -1.166304, -0.7760009, 1, 1, 1, 1, 1,
-0.4888095, -0.04926795, -1.53932, 1, 1, 1, 1, 1,
-0.4883494, -1.198117, -2.599989, 1, 1, 1, 1, 1,
-0.4865321, 0.3837667, -0.2120098, 1, 1, 1, 1, 1,
-0.4794993, 1.364279, -1.302126, 1, 1, 1, 1, 1,
-0.4788921, 0.4774318, 0.2248513, 1, 1, 1, 1, 1,
-0.476992, 0.02872234, -0.47401, 1, 1, 1, 1, 1,
-0.4759858, -0.09584936, -1.360079, 1, 1, 1, 1, 1,
-0.4725306, -1.257282, -3.949857, 1, 1, 1, 1, 1,
-0.4725186, 0.5969728, -0.3881502, 1, 1, 1, 1, 1,
-0.4714287, 0.7189326, -0.7567527, 0, 0, 1, 1, 1,
-0.4696915, -0.991296, -2.978509, 1, 0, 0, 1, 1,
-0.4696539, -0.1991631, -3.020193, 1, 0, 0, 1, 1,
-0.4694896, 1.844878, -0.2334428, 1, 0, 0, 1, 1,
-0.4689704, 0.3772173, -0.4794739, 1, 0, 0, 1, 1,
-0.4683937, 1.351863, -2.020701, 1, 0, 0, 1, 1,
-0.4658903, 0.5893884, -0.965684, 0, 0, 0, 1, 1,
-0.4626005, -0.1088316, -3.172937, 0, 0, 0, 1, 1,
-0.46236, 0.163069, -1.396924, 0, 0, 0, 1, 1,
-0.4579507, 1.829384, -0.6516213, 0, 0, 0, 1, 1,
-0.4562923, 0.4591565, -1.510801, 0, 0, 0, 1, 1,
-0.455712, -0.3055375, -3.498267, 0, 0, 0, 1, 1,
-0.4540213, 1.097966, -1.398012, 0, 0, 0, 1, 1,
-0.453627, 2.522512, -1.646706, 1, 1, 1, 1, 1,
-0.453613, 1.400913, -0.6559802, 1, 1, 1, 1, 1,
-0.4514355, -0.4932849, -2.91518, 1, 1, 1, 1, 1,
-0.4508391, -0.05998607, -1.128604, 1, 1, 1, 1, 1,
-0.4483894, -1.093352, -2.529829, 1, 1, 1, 1, 1,
-0.4441103, 1.235585, 0.5573547, 1, 1, 1, 1, 1,
-0.442383, 0.2954949, -0.7203048, 1, 1, 1, 1, 1,
-0.438101, -0.9687518, -1.800007, 1, 1, 1, 1, 1,
-0.4299844, -0.5160955, -3.371744, 1, 1, 1, 1, 1,
-0.4279093, 1.440014, -1.459528, 1, 1, 1, 1, 1,
-0.4273461, -0.5632166, -2.766348, 1, 1, 1, 1, 1,
-0.4249698, -0.8375458, -3.266933, 1, 1, 1, 1, 1,
-0.4222564, -0.6926779, -2.768198, 1, 1, 1, 1, 1,
-0.4169774, 1.038103, 0.6306356, 1, 1, 1, 1, 1,
-0.4157915, 0.4149062, -1.293839, 1, 1, 1, 1, 1,
-0.4143698, -0.15408, -3.700821, 0, 0, 1, 1, 1,
-0.4058871, 1.931376, -0.3239449, 1, 0, 0, 1, 1,
-0.4036077, 0.9136419, -0.05296193, 1, 0, 0, 1, 1,
-0.3955552, -1.069343, -0.7064388, 1, 0, 0, 1, 1,
-0.3946223, -0.09318663, -2.219035, 1, 0, 0, 1, 1,
-0.3941875, 0.8898076, 1.041233, 1, 0, 0, 1, 1,
-0.3922817, 0.7722663, 0.8287315, 0, 0, 0, 1, 1,
-0.3911827, 0.6188036, -1.033992, 0, 0, 0, 1, 1,
-0.3884217, 1.283871, -0.3470605, 0, 0, 0, 1, 1,
-0.3862101, 1.551316, 0.8098127, 0, 0, 0, 1, 1,
-0.3838073, 0.4228661, -0.3070185, 0, 0, 0, 1, 1,
-0.3831471, 1.168647, 1.191175, 0, 0, 0, 1, 1,
-0.3673482, -2.172457, -3.599688, 0, 0, 0, 1, 1,
-0.3663995, -0.4599383, -2.884908, 1, 1, 1, 1, 1,
-0.3657531, 0.4007203, -0.4255361, 1, 1, 1, 1, 1,
-0.3651537, 0.08284371, -2.091578, 1, 1, 1, 1, 1,
-0.3646928, 0.1363797, -0.1759169, 1, 1, 1, 1, 1,
-0.3563597, -0.597287, -0.8939775, 1, 1, 1, 1, 1,
-0.3557867, 0.909111, 0.7574978, 1, 1, 1, 1, 1,
-0.3548681, -1.507657, -2.78839, 1, 1, 1, 1, 1,
-0.3484176, 0.563774, -0.07925174, 1, 1, 1, 1, 1,
-0.3484124, 0.3531619, -1.709671, 1, 1, 1, 1, 1,
-0.3478307, 0.8074896, 1.422792, 1, 1, 1, 1, 1,
-0.3476242, 1.70707, 0.6899008, 1, 1, 1, 1, 1,
-0.345815, -0.3539089, -0.6527998, 1, 1, 1, 1, 1,
-0.3445722, -1.804931, -2.671165, 1, 1, 1, 1, 1,
-0.3412913, 1.768557, 1.606559, 1, 1, 1, 1, 1,
-0.3380756, 1.506379, -0.6950011, 1, 1, 1, 1, 1,
-0.337595, -1.480841, -1.677426, 0, 0, 1, 1, 1,
-0.3361597, 1.453545, 0.09644399, 1, 0, 0, 1, 1,
-0.3348123, 0.8133088, -1.753723, 1, 0, 0, 1, 1,
-0.3332326, 0.7356646, -0.5994429, 1, 0, 0, 1, 1,
-0.3320255, 0.6759868, 0.4530214, 1, 0, 0, 1, 1,
-0.3306762, 0.9239224, -0.1376936, 1, 0, 0, 1, 1,
-0.3212357, -0.5431978, -2.747684, 0, 0, 0, 1, 1,
-0.319378, 0.2351751, -1.754621, 0, 0, 0, 1, 1,
-0.3192666, -0.9391496, -3.961835, 0, 0, 0, 1, 1,
-0.3167742, 0.9112647, -1.687023, 0, 0, 0, 1, 1,
-0.3145573, -1.594293, -4.449421, 0, 0, 0, 1, 1,
-0.3139958, 0.6336417, -2.034194, 0, 0, 0, 1, 1,
-0.3118182, 0.3726859, -1.009289, 0, 0, 0, 1, 1,
-0.3109112, -0.5934573, -2.844467, 1, 1, 1, 1, 1,
-0.3099777, 0.8458008, -1.32702, 1, 1, 1, 1, 1,
-0.3049968, -1.020059, -3.024794, 1, 1, 1, 1, 1,
-0.3006361, -0.8623843, -0.347066, 1, 1, 1, 1, 1,
-0.2997578, 0.5934095, 0.2398586, 1, 1, 1, 1, 1,
-0.2956986, 1.309979, 0.4782297, 1, 1, 1, 1, 1,
-0.2903052, 0.1301122, -0.8470794, 1, 1, 1, 1, 1,
-0.290091, -0.6215286, -1.49608, 1, 1, 1, 1, 1,
-0.2894364, 0.03709805, -2.33533, 1, 1, 1, 1, 1,
-0.2881398, 1.572756, 0.4849666, 1, 1, 1, 1, 1,
-0.2838319, -1.357833, -3.808882, 1, 1, 1, 1, 1,
-0.2820757, 0.820262, -2.888211, 1, 1, 1, 1, 1,
-0.2809173, -0.515057, -1.739938, 1, 1, 1, 1, 1,
-0.2793523, -1.146925, -2.565193, 1, 1, 1, 1, 1,
-0.2792875, 0.7243433, -0.3305848, 1, 1, 1, 1, 1,
-0.2759832, 1.584212, -0.5521392, 0, 0, 1, 1, 1,
-0.2709813, 0.9402506, 0.007611436, 1, 0, 0, 1, 1,
-0.2708617, 0.8114836, 0.4746703, 1, 0, 0, 1, 1,
-0.2690711, 0.2062031, 0.4047179, 1, 0, 0, 1, 1,
-0.2604873, -0.4667838, -1.399949, 1, 0, 0, 1, 1,
-0.2585542, 0.2023323, -0.1676971, 1, 0, 0, 1, 1,
-0.254242, -0.332788, -1.960343, 0, 0, 0, 1, 1,
-0.2528492, 0.1264261, -1.084021, 0, 0, 0, 1, 1,
-0.2500951, 1.724628, 0.1508079, 0, 0, 0, 1, 1,
-0.2493901, 0.8206246, -0.7624133, 0, 0, 0, 1, 1,
-0.2450615, -0.9770087, -2.185114, 0, 0, 0, 1, 1,
-0.243881, -1.092567, -2.926624, 0, 0, 0, 1, 1,
-0.2409169, -0.04936165, -2.127052, 0, 0, 0, 1, 1,
-0.240001, 1.5966, 0.9807692, 1, 1, 1, 1, 1,
-0.238554, 0.2650597, -1.18392, 1, 1, 1, 1, 1,
-0.2366589, 0.001063716, -0.3928169, 1, 1, 1, 1, 1,
-0.234617, 0.01569382, -2.231978, 1, 1, 1, 1, 1,
-0.2301938, -0.3280776, -3.588855, 1, 1, 1, 1, 1,
-0.2299921, 0.5524171, 0.281525, 1, 1, 1, 1, 1,
-0.2277982, -0.243778, -1.676902, 1, 1, 1, 1, 1,
-0.2259501, -1.453211, -2.894362, 1, 1, 1, 1, 1,
-0.2223597, 2.119378, 0.5408798, 1, 1, 1, 1, 1,
-0.22015, 0.2423605, -0.9145999, 1, 1, 1, 1, 1,
-0.2189541, 0.5849698, -0.3867271, 1, 1, 1, 1, 1,
-0.2188312, 0.7649079, 0.1307537, 1, 1, 1, 1, 1,
-0.2150663, -0.5957876, -2.219982, 1, 1, 1, 1, 1,
-0.2147311, -1.224494, -2.951546, 1, 1, 1, 1, 1,
-0.2072276, -1.229568, -4.074681, 1, 1, 1, 1, 1,
-0.2056812, -1.132024, -2.127753, 0, 0, 1, 1, 1,
-0.2035544, -0.7367613, -3.371172, 1, 0, 0, 1, 1,
-0.2031543, 0.1152447, -1.962196, 1, 0, 0, 1, 1,
-0.1998198, 0.137609, -0.8468212, 1, 0, 0, 1, 1,
-0.1937284, 0.5534081, 0.8371668, 1, 0, 0, 1, 1,
-0.1918068, 0.7703196, 0.3577276, 1, 0, 0, 1, 1,
-0.19179, 0.7686512, 0.7945717, 0, 0, 0, 1, 1,
-0.1862121, 0.3805029, 0.3566515, 0, 0, 0, 1, 1,
-0.1826448, 0.7789931, 0.22804, 0, 0, 0, 1, 1,
-0.1817773, 3.439058, -1.279399, 0, 0, 0, 1, 1,
-0.1806884, 1.279845, -2.393084, 0, 0, 0, 1, 1,
-0.1760458, -0.8243166, -3.252217, 0, 0, 0, 1, 1,
-0.1730036, 0.8059156, 0.3131256, 0, 0, 0, 1, 1,
-0.1712201, -0.6880406, -1.235539, 1, 1, 1, 1, 1,
-0.1698093, -1.202565, -3.146195, 1, 1, 1, 1, 1,
-0.1688614, -1.396111, -2.661457, 1, 1, 1, 1, 1,
-0.1662052, 0.5078789, 0.6286351, 1, 1, 1, 1, 1,
-0.1624069, 0.4968733, 0.744378, 1, 1, 1, 1, 1,
-0.1601608, -0.1213848, -4.658939, 1, 1, 1, 1, 1,
-0.1562922, -0.06870925, -3.038103, 1, 1, 1, 1, 1,
-0.1550769, 2.155132, -0.716382, 1, 1, 1, 1, 1,
-0.1537814, 0.5699325, 0.2437237, 1, 1, 1, 1, 1,
-0.1499766, -1.643415, -5.343877, 1, 1, 1, 1, 1,
-0.1473233, -0.5238142, -3.049642, 1, 1, 1, 1, 1,
-0.1435891, 0.3652548, -0.1100147, 1, 1, 1, 1, 1,
-0.1392688, 0.908846, -1.633262, 1, 1, 1, 1, 1,
-0.1372943, 0.186255, -0.4306373, 1, 1, 1, 1, 1,
-0.1363136, -1.059398, -2.963403, 1, 1, 1, 1, 1,
-0.1355201, -0.4742471, -4.06274, 0, 0, 1, 1, 1,
-0.132822, 0.1636041, -0.6401479, 1, 0, 0, 1, 1,
-0.132234, 1.819244, 0.3070113, 1, 0, 0, 1, 1,
-0.1301051, -0.6650845, -3.808228, 1, 0, 0, 1, 1,
-0.1296474, 0.7948616, 1.78319, 1, 0, 0, 1, 1,
-0.1289284, -0.6570462, -3.245023, 1, 0, 0, 1, 1,
-0.1284422, 0.4045114, -1.473212, 0, 0, 0, 1, 1,
-0.1230227, -0.9383355, -2.531429, 0, 0, 0, 1, 1,
-0.121981, -0.05912661, -3.573431, 0, 0, 0, 1, 1,
-0.1177182, 0.667069, -0.05341899, 0, 0, 0, 1, 1,
-0.1171685, 1.048943, 1.410285, 0, 0, 0, 1, 1,
-0.1152646, -0.2593284, -2.021132, 0, 0, 0, 1, 1,
-0.1069261, -1.289284, -3.204658, 0, 0, 0, 1, 1,
-0.09960119, -0.5488417, -2.518893, 1, 1, 1, 1, 1,
-0.09622408, -0.7823244, -3.548303, 1, 1, 1, 1, 1,
-0.09609559, -1.090551, -3.011489, 1, 1, 1, 1, 1,
-0.09305912, -0.0462411, -3.10102, 1, 1, 1, 1, 1,
-0.08262327, 0.5519071, -0.5894476, 1, 1, 1, 1, 1,
-0.0805822, 0.8616223, -0.3754602, 1, 1, 1, 1, 1,
-0.08016749, 2.818956, 1.585927, 1, 1, 1, 1, 1,
-0.07735109, 0.7110643, 1.921394, 1, 1, 1, 1, 1,
-0.07730126, -0.3588152, -1.915701, 1, 1, 1, 1, 1,
-0.07394265, 0.1395507, -0.4205529, 1, 1, 1, 1, 1,
-0.07277178, -0.6559343, -1.118418, 1, 1, 1, 1, 1,
-0.06156781, -0.1071124, -3.885755, 1, 1, 1, 1, 1,
-0.06026158, 0.2337459, -1.270883, 1, 1, 1, 1, 1,
-0.05836844, -0.1359093, -5.053445, 1, 1, 1, 1, 1,
-0.05722793, 2.044254, -0.5090896, 1, 1, 1, 1, 1,
-0.05307898, -0.4083672, -3.166049, 0, 0, 1, 1, 1,
-0.05097148, -0.7155558, -1.478838, 1, 0, 0, 1, 1,
-0.04996235, -0.2037742, -2.170675, 1, 0, 0, 1, 1,
-0.04953535, -0.5371066, -2.851392, 1, 0, 0, 1, 1,
-0.04876471, 0.006314341, -0.7908788, 1, 0, 0, 1, 1,
-0.04862437, 0.5901693, -1.099837, 1, 0, 0, 1, 1,
-0.04760954, -1.632906, -5.01993, 0, 0, 0, 1, 1,
-0.04508802, 2.039696, -0.2885424, 0, 0, 0, 1, 1,
-0.04137848, 1.036801, 1.467032, 0, 0, 0, 1, 1,
-0.02684128, 0.1745628, -0.3660465, 0, 0, 0, 1, 1,
-0.02491573, 0.1554284, 1.428611, 0, 0, 0, 1, 1,
-0.01903917, -0.7275251, -1.997033, 0, 0, 0, 1, 1,
-0.01857862, 0.7749351, -0.7249052, 0, 0, 0, 1, 1,
-0.01493236, 0.08181395, 0.3607248, 1, 1, 1, 1, 1,
-0.01408244, -0.1360887, -3.58655, 1, 1, 1, 1, 1,
-0.01405709, -0.6532851, -3.256273, 1, 1, 1, 1, 1,
-0.01325956, 0.2841242, 0.5540515, 1, 1, 1, 1, 1,
-0.01082805, -0.3545611, -2.153648, 1, 1, 1, 1, 1,
-0.01056862, -0.1855756, -1.739083, 1, 1, 1, 1, 1,
-0.009588192, 1.08872, -0.3347177, 1, 1, 1, 1, 1,
-0.006003623, 2.030919, 0.1843051, 1, 1, 1, 1, 1,
-0.00395624, 0.2492723, -0.4917881, 1, 1, 1, 1, 1,
-0.003282453, 1.220757, 0.1317448, 1, 1, 1, 1, 1,
0.003812342, -2.242538, 1.565592, 1, 1, 1, 1, 1,
0.01034484, -0.4793232, 2.811872, 1, 1, 1, 1, 1,
0.01150544, -1.253541, 1.057412, 1, 1, 1, 1, 1,
0.01262794, -0.8542485, 2.451602, 1, 1, 1, 1, 1,
0.01349038, -0.2086046, 1.099262, 1, 1, 1, 1, 1,
0.01497248, -0.7930596, 3.755946, 0, 0, 1, 1, 1,
0.01755183, -1.11498, 2.796998, 1, 0, 0, 1, 1,
0.02213736, 0.7284128, 1.123136, 1, 0, 0, 1, 1,
0.02319412, -1.317813, 2.051743, 1, 0, 0, 1, 1,
0.02453269, -0.6474575, 4.807745, 1, 0, 0, 1, 1,
0.02508955, 1.422587, 2.89585, 1, 0, 0, 1, 1,
0.02566458, 0.3579957, 0.5533854, 0, 0, 0, 1, 1,
0.02696855, 0.1867606, -0.2863063, 0, 0, 0, 1, 1,
0.03154033, 1.57298, 0.9435595, 0, 0, 0, 1, 1,
0.03169471, -0.2759598, 2.454909, 0, 0, 0, 1, 1,
0.03848866, 0.1558714, -0.6100432, 0, 0, 0, 1, 1,
0.04183091, -0.4563099, 4.392733, 0, 0, 0, 1, 1,
0.04212875, 0.7765962, 1.859932, 0, 0, 0, 1, 1,
0.04644518, -0.5268997, 2.651045, 1, 1, 1, 1, 1,
0.04991167, 0.03099077, 0.858502, 1, 1, 1, 1, 1,
0.05066461, -0.01827474, 2.576109, 1, 1, 1, 1, 1,
0.05080893, 0.276683, 1.088227, 1, 1, 1, 1, 1,
0.05121721, 0.3065763, 0.8229657, 1, 1, 1, 1, 1,
0.05764151, 0.260923, 1.885509, 1, 1, 1, 1, 1,
0.05780055, -0.7416708, 1.758505, 1, 1, 1, 1, 1,
0.0580151, 0.3304708, -0.6122953, 1, 1, 1, 1, 1,
0.06004742, 0.6841255, -1.052897, 1, 1, 1, 1, 1,
0.06477328, 0.6969068, 0.2200645, 1, 1, 1, 1, 1,
0.0731708, 0.9532812, -0.579616, 1, 1, 1, 1, 1,
0.07381032, -0.804692, 3.919658, 1, 1, 1, 1, 1,
0.0751056, 0.8361539, -0.02568716, 1, 1, 1, 1, 1,
0.08202763, 0.4252363, -0.5780957, 1, 1, 1, 1, 1,
0.08474607, -1.421819, 2.072519, 1, 1, 1, 1, 1,
0.08650162, 0.07368952, 2.042962, 0, 0, 1, 1, 1,
0.08760029, -0.0385799, 2.298591, 1, 0, 0, 1, 1,
0.08898184, 0.6092888, 1.770684, 1, 0, 0, 1, 1,
0.08996674, 0.7764234, -0.6983361, 1, 0, 0, 1, 1,
0.09091325, -1.020344, 2.317558, 1, 0, 0, 1, 1,
0.09507312, 1.228102, -0.3465078, 1, 0, 0, 1, 1,
0.0968162, 0.3238235, 1.318569, 0, 0, 0, 1, 1,
0.1040346, 0.6876912, -0.5301973, 0, 0, 0, 1, 1,
0.1045878, -0.05889116, 2.274742, 0, 0, 0, 1, 1,
0.1098434, -1.429291, 5.070374, 0, 0, 0, 1, 1,
0.1099472, -0.8079098, 0.2223089, 0, 0, 0, 1, 1,
0.1104914, 0.07731256, -0.9261221, 0, 0, 0, 1, 1,
0.1111374, 0.1519263, 1.49594, 0, 0, 0, 1, 1,
0.1164274, -0.01915473, 1.826756, 1, 1, 1, 1, 1,
0.1169558, -0.2950034, 2.268621, 1, 1, 1, 1, 1,
0.1200063, -1.628252, 5.060914, 1, 1, 1, 1, 1,
0.1223826, 2.286681, 0.4625549, 1, 1, 1, 1, 1,
0.1248957, -0.6708099, 2.658031, 1, 1, 1, 1, 1,
0.1251592, 0.5399551, 1.173454, 1, 1, 1, 1, 1,
0.1252859, -1.387625, 3.739728, 1, 1, 1, 1, 1,
0.1286417, -0.09275089, 1.392277, 1, 1, 1, 1, 1,
0.1292529, 0.2022936, -1.000189, 1, 1, 1, 1, 1,
0.1300861, 0.03700472, 1.304338, 1, 1, 1, 1, 1,
0.1311742, 0.8313537, 0.8544415, 1, 1, 1, 1, 1,
0.139815, -0.6788028, 2.915926, 1, 1, 1, 1, 1,
0.1438725, 0.6009495, 0.8415549, 1, 1, 1, 1, 1,
0.1463184, -0.3775055, 3.232611, 1, 1, 1, 1, 1,
0.1463203, -0.4609069, 3.629139, 1, 1, 1, 1, 1,
0.1487137, -0.3389492, 4.291737, 0, 0, 1, 1, 1,
0.1556237, -0.6119117, 3.371727, 1, 0, 0, 1, 1,
0.1557764, 0.8362277, 0.1164878, 1, 0, 0, 1, 1,
0.1558553, 0.1146209, 0.2685784, 1, 0, 0, 1, 1,
0.1559522, -1.015046, 3.289216, 1, 0, 0, 1, 1,
0.1574278, -1.235729, 2.392295, 1, 0, 0, 1, 1,
0.1656035, 0.3781628, -2.026049, 0, 0, 0, 1, 1,
0.1672421, -0.2026086, 2.841624, 0, 0, 0, 1, 1,
0.1782208, -1.310082, 3.154248, 0, 0, 0, 1, 1,
0.1784984, -0.7631703, 2.31496, 0, 0, 0, 1, 1,
0.1790568, -0.3119227, 3.217478, 0, 0, 0, 1, 1,
0.1794585, 0.05534045, 2.934844, 0, 0, 0, 1, 1,
0.1828469, 0.4552613, -0.1339366, 0, 0, 0, 1, 1,
0.1842115, 0.6026901, 0.4729691, 1, 1, 1, 1, 1,
0.1947901, 0.05621579, 1.744208, 1, 1, 1, 1, 1,
0.1949724, -1.589519, 2.675505, 1, 1, 1, 1, 1,
0.1955899, 0.4548939, 0.9991411, 1, 1, 1, 1, 1,
0.2055928, -0.2758409, 2.248284, 1, 1, 1, 1, 1,
0.2058306, 1.217667, -0.08414262, 1, 1, 1, 1, 1,
0.2066449, -0.9601372, 3.545852, 1, 1, 1, 1, 1,
0.2073047, -0.1436009, 1.586197, 1, 1, 1, 1, 1,
0.2090751, 1.154551, 1.947721, 1, 1, 1, 1, 1,
0.2108086, -0.5333872, 2.872154, 1, 1, 1, 1, 1,
0.2119856, 0.3629538, -0.4733349, 1, 1, 1, 1, 1,
0.2134017, -0.6766905, 3.494924, 1, 1, 1, 1, 1,
0.2169004, 0.3581463, 0.5051298, 1, 1, 1, 1, 1,
0.2190472, -2.06834, 2.183257, 1, 1, 1, 1, 1,
0.219911, 0.2035069, 1.9735, 1, 1, 1, 1, 1,
0.2227868, 0.1043507, -1.412064, 0, 0, 1, 1, 1,
0.2304378, -0.426057, 2.013286, 1, 0, 0, 1, 1,
0.2307335, 0.8957579, 1.285258, 1, 0, 0, 1, 1,
0.2326802, -1.674522, 2.752321, 1, 0, 0, 1, 1,
0.2366488, -1.579402, 3.64971, 1, 0, 0, 1, 1,
0.2420276, 1.091431, -2.009859, 1, 0, 0, 1, 1,
0.2487415, -0.7168394, 4.659684, 0, 0, 0, 1, 1,
0.2487656, 1.410386, -0.2493448, 0, 0, 0, 1, 1,
0.2513991, 0.6806952, 3.039077, 0, 0, 0, 1, 1,
0.2527929, 0.2408727, -1.076794, 0, 0, 0, 1, 1,
0.2537149, -1.931492, 2.176012, 0, 0, 0, 1, 1,
0.2577869, 0.1935881, 1.260692, 0, 0, 0, 1, 1,
0.258086, 1.560322, -0.8731197, 0, 0, 0, 1, 1,
0.2592387, -2.27185, 2.918135, 1, 1, 1, 1, 1,
0.2632214, -0.1801293, 1.44862, 1, 1, 1, 1, 1,
0.2648339, 0.08672632, 0.5375484, 1, 1, 1, 1, 1,
0.2649105, -0.5163791, 2.86547, 1, 1, 1, 1, 1,
0.267616, -1.307806, 4.486843, 1, 1, 1, 1, 1,
0.2707041, -0.6282478, 2.227324, 1, 1, 1, 1, 1,
0.2750506, -2.738927, 3.379493, 1, 1, 1, 1, 1,
0.2752858, 0.7787716, 0.20825, 1, 1, 1, 1, 1,
0.2778599, -1.530615, 3.796567, 1, 1, 1, 1, 1,
0.2784791, -1.168282, 4.668567, 1, 1, 1, 1, 1,
0.278596, -0.6976239, 4.131659, 1, 1, 1, 1, 1,
0.2788918, -0.4727594, -0.555958, 1, 1, 1, 1, 1,
0.2824003, -1.262099, 1.447251, 1, 1, 1, 1, 1,
0.2826595, 0.4974096, 0.08325906, 1, 1, 1, 1, 1,
0.2840432, 1.111817, -1.750491, 1, 1, 1, 1, 1,
0.28981, -0.9314024, 4.704387, 0, 0, 1, 1, 1,
0.2906137, -0.4748269, 1.714302, 1, 0, 0, 1, 1,
0.2973468, 0.8310567, 1.15728, 1, 0, 0, 1, 1,
0.2994415, 2.564074, -0.7397719, 1, 0, 0, 1, 1,
0.3012162, 0.8311982, 1.313849, 1, 0, 0, 1, 1,
0.3051904, -0.181377, 2.195151, 1, 0, 0, 1, 1,
0.3059356, 0.8926395, 0.1501584, 0, 0, 0, 1, 1,
0.3068893, 0.9894044, 0.6369659, 0, 0, 0, 1, 1,
0.3130556, 0.335856, -0.2114207, 0, 0, 0, 1, 1,
0.3150943, -0.3384547, 1.620754, 0, 0, 0, 1, 1,
0.3181572, 1.090619, -0.5862063, 0, 0, 0, 1, 1,
0.3195545, -0.1986119, 3.473354, 0, 0, 0, 1, 1,
0.3218956, -1.053897, 2.778293, 0, 0, 0, 1, 1,
0.3254974, -0.1792851, 1.716621, 1, 1, 1, 1, 1,
0.3420339, 0.2276996, 2.023089, 1, 1, 1, 1, 1,
0.3437086, 0.07874136, 1.784411, 1, 1, 1, 1, 1,
0.3444614, -0.1960761, 3.361415, 1, 1, 1, 1, 1,
0.3486542, 0.19236, 1.868273, 1, 1, 1, 1, 1,
0.3487191, -0.150165, 0.3458776, 1, 1, 1, 1, 1,
0.3488262, -1.053944, 2.689193, 1, 1, 1, 1, 1,
0.3509761, -0.4665443, 1.784518, 1, 1, 1, 1, 1,
0.3527647, 0.3380277, 0.8711237, 1, 1, 1, 1, 1,
0.3537268, -0.2362761, 2.110994, 1, 1, 1, 1, 1,
0.3539431, 0.638696, -1.704737, 1, 1, 1, 1, 1,
0.3615905, -0.09179986, 3.465965, 1, 1, 1, 1, 1,
0.3621301, 0.1393324, 2.051042, 1, 1, 1, 1, 1,
0.3645389, 0.4235958, 1.80505, 1, 1, 1, 1, 1,
0.3649521, -2.215888, 3.148628, 1, 1, 1, 1, 1,
0.3651589, -1.89364, 3.044316, 0, 0, 1, 1, 1,
0.3668278, 0.885329, 0.2434469, 1, 0, 0, 1, 1,
0.3685502, -0.1555854, 1.19076, 1, 0, 0, 1, 1,
0.3693835, -1.745792, 3.366123, 1, 0, 0, 1, 1,
0.3697437, 1.342155, 0.1602156, 1, 0, 0, 1, 1,
0.3715335, -0.6810309, 1.7539, 1, 0, 0, 1, 1,
0.3752968, 0.7597219, 1.374215, 0, 0, 0, 1, 1,
0.3793491, 1.709532, 1.091737, 0, 0, 0, 1, 1,
0.3807347, -1.887614, 1.725666, 0, 0, 0, 1, 1,
0.3811608, 1.366762, 1.701441, 0, 0, 0, 1, 1,
0.3832481, -1.580963, 4.033092, 0, 0, 0, 1, 1,
0.3871661, 0.9429231, 0.2807267, 0, 0, 0, 1, 1,
0.3882341, -0.6722118, 0.1938293, 0, 0, 0, 1, 1,
0.3933664, -0.3083128, 2.927531, 1, 1, 1, 1, 1,
0.3935947, -1.073918, 3.5813, 1, 1, 1, 1, 1,
0.395526, 1.337218, -0.4299597, 1, 1, 1, 1, 1,
0.3992639, -0.7309325, 3.088529, 1, 1, 1, 1, 1,
0.400989, -0.5602943, 2.455304, 1, 1, 1, 1, 1,
0.4015308, 1.130832, 0.04137975, 1, 1, 1, 1, 1,
0.4098998, 0.8311939, 0.4167027, 1, 1, 1, 1, 1,
0.4119915, -1.545158, 4.459252, 1, 1, 1, 1, 1,
0.418508, 1.797486, -0.09028112, 1, 1, 1, 1, 1,
0.4195812, 0.09607996, 2.349747, 1, 1, 1, 1, 1,
0.4206357, 0.4806572, -0.3101066, 1, 1, 1, 1, 1,
0.4216245, -0.03297769, 3.281675, 1, 1, 1, 1, 1,
0.4277175, -1.318784, 1.993573, 1, 1, 1, 1, 1,
0.4350451, 0.1887174, 0.5664662, 1, 1, 1, 1, 1,
0.4352173, 0.1649621, 2.198374, 1, 1, 1, 1, 1,
0.4391893, 0.6969008, 0.8988688, 0, 0, 1, 1, 1,
0.4429497, -1.341256, 3.201553, 1, 0, 0, 1, 1,
0.4445976, -1.371008, 3.564476, 1, 0, 0, 1, 1,
0.4464264, 0.08107308, 0.2287115, 1, 0, 0, 1, 1,
0.4498072, 2.53011, -0.3824339, 1, 0, 0, 1, 1,
0.4600193, 0.3730415, 1.516963, 1, 0, 0, 1, 1,
0.4614111, 0.3284935, 1.580218, 0, 0, 0, 1, 1,
0.461686, -0.4024161, 2.885378, 0, 0, 0, 1, 1,
0.4653367, 0.7543028, -0.03724983, 0, 0, 0, 1, 1,
0.466248, -2.034292, 2.389543, 0, 0, 0, 1, 1,
0.4666066, -0.3732179, 2.833577, 0, 0, 0, 1, 1,
0.4686859, -1.841418, 3.316492, 0, 0, 0, 1, 1,
0.4722729, -0.04205991, 0.2019078, 0, 0, 0, 1, 1,
0.4745511, -1.839428, 2.113656, 1, 1, 1, 1, 1,
0.4756608, -0.3585744, 1.955114, 1, 1, 1, 1, 1,
0.4767522, -2.053064, 2.483324, 1, 1, 1, 1, 1,
0.4773482, 1.286775, 0.4649283, 1, 1, 1, 1, 1,
0.4789576, 2.033778, 2.344662, 1, 1, 1, 1, 1,
0.4801495, 0.9463982, 0.4662053, 1, 1, 1, 1, 1,
0.4804682, 0.4046031, -0.3702997, 1, 1, 1, 1, 1,
0.483382, -0.524154, 2.460882, 1, 1, 1, 1, 1,
0.4835668, -0.01516485, 0.6392513, 1, 1, 1, 1, 1,
0.4835759, -0.6385002, 3.289038, 1, 1, 1, 1, 1,
0.489026, -0.4932283, 2.260154, 1, 1, 1, 1, 1,
0.4901171, -0.5521686, 2.543296, 1, 1, 1, 1, 1,
0.4937726, 0.760087, 0.7170855, 1, 1, 1, 1, 1,
0.4941825, -0.5703275, 1.576405, 1, 1, 1, 1, 1,
0.4952398, 0.03330351, 0.6130276, 1, 1, 1, 1, 1,
0.4980419, 0.04559651, 1.76257, 0, 0, 1, 1, 1,
0.5054817, 0.4485027, 1.330307, 1, 0, 0, 1, 1,
0.5057157, -0.7161666, 2.178695, 1, 0, 0, 1, 1,
0.5072532, -0.7208012, 3.511573, 1, 0, 0, 1, 1,
0.5090868, -0.3729356, 2.205469, 1, 0, 0, 1, 1,
0.5099304, 1.647598, -0.1571494, 1, 0, 0, 1, 1,
0.5148268, 0.5822831, 0.7182543, 0, 0, 0, 1, 1,
0.5188325, -0.1759233, 1.965952, 0, 0, 0, 1, 1,
0.5205953, -0.9881797, 0.9482424, 0, 0, 0, 1, 1,
0.522882, 1.611097, 1.513875, 0, 0, 0, 1, 1,
0.5288577, 0.4823675, 1.332186, 0, 0, 0, 1, 1,
0.5318353, 1.52092, 0.7811028, 0, 0, 0, 1, 1,
0.5328323, 1.599878, 1.305047, 0, 0, 0, 1, 1,
0.53499, -0.8662614, 1.747404, 1, 1, 1, 1, 1,
0.5375556, -0.654651, 2.555981, 1, 1, 1, 1, 1,
0.5377694, -1.182688, 3.296499, 1, 1, 1, 1, 1,
0.5431672, 0.8332288, 0.309202, 1, 1, 1, 1, 1,
0.5451972, 0.9889134, -0.2197184, 1, 1, 1, 1, 1,
0.5473088, 2.016407, 1.462707, 1, 1, 1, 1, 1,
0.5552949, -0.7682306, 2.025496, 1, 1, 1, 1, 1,
0.5562268, 0.3639016, -1.026836, 1, 1, 1, 1, 1,
0.5578097, -0.770777, 3.353935, 1, 1, 1, 1, 1,
0.5613167, 0.5929733, 1.74527, 1, 1, 1, 1, 1,
0.5620675, 0.5304222, 0.983061, 1, 1, 1, 1, 1,
0.5655472, 1.127875, -0.1266735, 1, 1, 1, 1, 1,
0.5683126, -0.46843, 2.958352, 1, 1, 1, 1, 1,
0.5758955, -1.113761, 2.287054, 1, 1, 1, 1, 1,
0.5776852, 0.4528014, -1.763574, 1, 1, 1, 1, 1,
0.5879222, -0.903674, 2.587859, 0, 0, 1, 1, 1,
0.5893111, 0.914043, 1.113654, 1, 0, 0, 1, 1,
0.5936134, -0.6069663, 1.958362, 1, 0, 0, 1, 1,
0.5947638, 0.9046496, -0.7555272, 1, 0, 0, 1, 1,
0.6042245, -1.941522, 2.772434, 1, 0, 0, 1, 1,
0.6075633, -0.2487781, 3.068968, 1, 0, 0, 1, 1,
0.6076323, 0.5459703, 2.761175, 0, 0, 0, 1, 1,
0.6086476, -0.4463396, 1.680515, 0, 0, 0, 1, 1,
0.6132565, 0.9648294, -0.5062659, 0, 0, 0, 1, 1,
0.6187446, 0.8646228, 0.9008316, 0, 0, 0, 1, 1,
0.622035, -1.755247, 3.346472, 0, 0, 0, 1, 1,
0.6222757, -1.200572, 1.141887, 0, 0, 0, 1, 1,
0.6239068, 0.1911462, 0.7452492, 0, 0, 0, 1, 1,
0.6251923, -1.390007, 2.763551, 1, 1, 1, 1, 1,
0.6316612, 0.4471817, 2.010312, 1, 1, 1, 1, 1,
0.6427201, 1.26661, 2.055233, 1, 1, 1, 1, 1,
0.6445141, -1.216691, 1.958899, 1, 1, 1, 1, 1,
0.6495675, 0.2157398, -0.1060771, 1, 1, 1, 1, 1,
0.650647, -0.5734515, 2.612181, 1, 1, 1, 1, 1,
0.6534034, 1.599329, 1.44632, 1, 1, 1, 1, 1,
0.6556512, -1.346162, 3.160979, 1, 1, 1, 1, 1,
0.6639425, -1.015991, 1.532338, 1, 1, 1, 1, 1,
0.6659265, -0.3396959, 1.441809, 1, 1, 1, 1, 1,
0.6660915, 0.03993629, -0.9328538, 1, 1, 1, 1, 1,
0.6704013, 0.9016981, 1.770405, 1, 1, 1, 1, 1,
0.6733539, 0.1604054, 0.7031909, 1, 1, 1, 1, 1,
0.677094, 1.402249, 1.154517, 1, 1, 1, 1, 1,
0.6830832, 1.1812, -0.6261565, 1, 1, 1, 1, 1,
0.6836331, 0.2825011, 1.087662, 0, 0, 1, 1, 1,
0.6883392, 0.2468816, 1.354811, 1, 0, 0, 1, 1,
0.6916176, -0.4231621, 1.854188, 1, 0, 0, 1, 1,
0.6950844, -1.32238, 1.465596, 1, 0, 0, 1, 1,
0.6957343, -0.9686452, 2.606301, 1, 0, 0, 1, 1,
0.6974091, 0.01599236, 2.253321, 1, 0, 0, 1, 1,
0.6981294, -1.561076, 3.740745, 0, 0, 0, 1, 1,
0.699989, -0.5594131, 3.975035, 0, 0, 0, 1, 1,
0.7070403, 0.2338852, -0.2296474, 0, 0, 0, 1, 1,
0.7141073, -2.631656, 3.210229, 0, 0, 0, 1, 1,
0.7161838, -0.2995254, 2.698139, 0, 0, 0, 1, 1,
0.7205788, 0.5258163, -1.656399, 0, 0, 0, 1, 1,
0.7208155, 1.379887, 0.8787636, 0, 0, 0, 1, 1,
0.7213866, -0.03991193, 1.305379, 1, 1, 1, 1, 1,
0.7222057, 0.01320662, 2.547761, 1, 1, 1, 1, 1,
0.7241636, 1.590011, 0.1929526, 1, 1, 1, 1, 1,
0.7283567, 0.231454, 1.210026, 1, 1, 1, 1, 1,
0.7317345, 0.9952179, 2.386642, 1, 1, 1, 1, 1,
0.7321699, 0.7206138, -0.8155037, 1, 1, 1, 1, 1,
0.7327557, -2.303539, 1.630227, 1, 1, 1, 1, 1,
0.7393036, 0.397234, 0.2825788, 1, 1, 1, 1, 1,
0.7409191, -0.4065787, 2.394419, 1, 1, 1, 1, 1,
0.7439767, 2.985589, 1.524106, 1, 1, 1, 1, 1,
0.744031, 3.056677, -0.1738665, 1, 1, 1, 1, 1,
0.7466942, -0.5930283, 1.254614, 1, 1, 1, 1, 1,
0.7543954, -1.024295, 3.955309, 1, 1, 1, 1, 1,
0.7546096, -0.7399815, 1.859534, 1, 1, 1, 1, 1,
0.7566556, -0.2233597, 2.258974, 1, 1, 1, 1, 1,
0.765333, -0.4060123, 1.435182, 0, 0, 1, 1, 1,
0.7661812, -2.008625, 2.506721, 1, 0, 0, 1, 1,
0.7678512, -0.3976157, 2.19468, 1, 0, 0, 1, 1,
0.7686173, -2.526145, 3.222707, 1, 0, 0, 1, 1,
0.7698641, -1.672643, 4.352399, 1, 0, 0, 1, 1,
0.7745222, 0.9735259, -0.2132093, 1, 0, 0, 1, 1,
0.7770828, -0.9463093, 1.779947, 0, 0, 0, 1, 1,
0.7794091, 2.725426, 0.8436891, 0, 0, 0, 1, 1,
0.7860838, -1.075523, 2.057479, 0, 0, 0, 1, 1,
0.8028606, 0.4606124, 1.224459, 0, 0, 0, 1, 1,
0.8044907, 0.7202951, 2.360587, 0, 0, 0, 1, 1,
0.8078018, 1.294689, 1.694082, 0, 0, 0, 1, 1,
0.8086779, -0.2230978, 1.336571, 0, 0, 0, 1, 1,
0.8091883, 0.2587895, 0.5847778, 1, 1, 1, 1, 1,
0.8121609, -0.1244582, -0.01078747, 1, 1, 1, 1, 1,
0.8143699, 0.781158, 1.310468, 1, 1, 1, 1, 1,
0.8304606, -1.431348, 2.463603, 1, 1, 1, 1, 1,
0.8319039, -0.8279445, 1.839772, 1, 1, 1, 1, 1,
0.8328578, 0.5657818, 0.9695334, 1, 1, 1, 1, 1,
0.8459858, 0.438238, 0.4792129, 1, 1, 1, 1, 1,
0.8477564, 0.4854685, 0.5192084, 1, 1, 1, 1, 1,
0.8529302, 0.2934134, 1.501958, 1, 1, 1, 1, 1,
0.8557628, -0.1895814, 1.205589, 1, 1, 1, 1, 1,
0.8558008, 0.8612385, 1.445172, 1, 1, 1, 1, 1,
0.856577, 1.100247, 1.726871, 1, 1, 1, 1, 1,
0.8599161, -0.3581591, 3.489769, 1, 1, 1, 1, 1,
0.8634536, 0.4113663, 1.420167, 1, 1, 1, 1, 1,
0.8684525, -1.161896, 4.845075, 1, 1, 1, 1, 1,
0.869638, 1.463816, 0.814662, 0, 0, 1, 1, 1,
0.8723316, -0.6107747, 0.5218238, 1, 0, 0, 1, 1,
0.8728216, -0.1060161, 0.301058, 1, 0, 0, 1, 1,
0.8780501, -0.3613748, 0.990908, 1, 0, 0, 1, 1,
0.8880264, 1.469779, -0.4800089, 1, 0, 0, 1, 1,
0.8885437, 0.5681055, 1.052464, 1, 0, 0, 1, 1,
0.8977301, 0.9339167, 1.02678, 0, 0, 0, 1, 1,
0.9025697, -0.09433866, 2.033256, 0, 0, 0, 1, 1,
0.9185001, -0.7890413, 2.718392, 0, 0, 0, 1, 1,
0.9189058, -1.060061, 3.345094, 0, 0, 0, 1, 1,
0.9231774, -0.646338, 2.570379, 0, 0, 0, 1, 1,
0.9251528, 1.001413, 1.115328, 0, 0, 0, 1, 1,
0.9273308, -0.3133118, 0.7990017, 0, 0, 0, 1, 1,
0.9314117, -0.09548667, 1.750957, 1, 1, 1, 1, 1,
0.938705, 0.1223706, 0.203604, 1, 1, 1, 1, 1,
0.9395781, 1.199251, 2.620009, 1, 1, 1, 1, 1,
0.940321, -0.7650619, 1.896959, 1, 1, 1, 1, 1,
0.942776, -1.257263, 3.090342, 1, 1, 1, 1, 1,
0.9432468, 0.9933964, 1.894054, 1, 1, 1, 1, 1,
0.9444292, -0.7398513, 0.9345832, 1, 1, 1, 1, 1,
0.951071, 0.2868169, 2.736989, 1, 1, 1, 1, 1,
0.9549241, 0.02474152, 1.555731, 1, 1, 1, 1, 1,
0.9554679, -0.162727, 3.030411, 1, 1, 1, 1, 1,
0.9591331, -0.3871504, 1.542886, 1, 1, 1, 1, 1,
0.9639133, 1.334191, 0.7600729, 1, 1, 1, 1, 1,
0.966462, 0.8217424, 0.955371, 1, 1, 1, 1, 1,
0.9708822, 2.289371, 0.7021446, 1, 1, 1, 1, 1,
0.9767138, 1.271593, 0.4938408, 1, 1, 1, 1, 1,
0.9822552, -1.235821, 4.070621, 0, 0, 1, 1, 1,
0.9873172, 0.6061127, 1.570777, 1, 0, 0, 1, 1,
0.995872, 0.7549546, -0.04379868, 1, 0, 0, 1, 1,
1.003778, -0.4469722, 0.1755834, 1, 0, 0, 1, 1,
1.004259, -0.2710028, 2.130493, 1, 0, 0, 1, 1,
1.008131, -1.068454, 0.6508611, 1, 0, 0, 1, 1,
1.023067, 0.04789315, 0.2063848, 0, 0, 0, 1, 1,
1.024216, -0.1039957, 3.839466, 0, 0, 0, 1, 1,
1.02905, -0.5644671, 3.053735, 0, 0, 0, 1, 1,
1.034588, 2.020511, 1.55972, 0, 0, 0, 1, 1,
1.034846, -1.899357, 4.01234, 0, 0, 0, 1, 1,
1.055789, 1.368551, 1.286851, 0, 0, 0, 1, 1,
1.059241, -0.7818984, 0.1176817, 0, 0, 0, 1, 1,
1.061717, -0.4854801, 2.689172, 1, 1, 1, 1, 1,
1.06358, -1.170143, 1.721048, 1, 1, 1, 1, 1,
1.063901, -0.04559711, 1.673609, 1, 1, 1, 1, 1,
1.067116, -0.441392, 2.298052, 1, 1, 1, 1, 1,
1.070125, 0.5662034, 0.2772539, 1, 1, 1, 1, 1,
1.073327, 0.0519125, 3.542782, 1, 1, 1, 1, 1,
1.085734, 0.4144719, 0.8549556, 1, 1, 1, 1, 1,
1.087168, -2.60844, 2.806868, 1, 1, 1, 1, 1,
1.087964, 0.8116887, 1.606593, 1, 1, 1, 1, 1,
1.092587, -0.7797446, 0.4756618, 1, 1, 1, 1, 1,
1.094466, -1.451975, 3.788584, 1, 1, 1, 1, 1,
1.099442, 0.7372711, 2.123195, 1, 1, 1, 1, 1,
1.109493, -1.755902, 2.838068, 1, 1, 1, 1, 1,
1.112363, -0.2579327, -0.01966623, 1, 1, 1, 1, 1,
1.122908, 0.2064596, 1.392132, 1, 1, 1, 1, 1,
1.124331, -1.448497, 4.049019, 0, 0, 1, 1, 1,
1.130401, -0.04857793, 0.790023, 1, 0, 0, 1, 1,
1.131999, -1.351958, 2.06596, 1, 0, 0, 1, 1,
1.135682, 2.116373, -1.273389, 1, 0, 0, 1, 1,
1.140302, 1.010208, 0.7266617, 1, 0, 0, 1, 1,
1.14249, 1.072759, 0.3484422, 1, 0, 0, 1, 1,
1.151817, 1.162893, 1.371896, 0, 0, 0, 1, 1,
1.165304, -0.6237209, 1.805325, 0, 0, 0, 1, 1,
1.165583, 0.8172361, -0.06341248, 0, 0, 0, 1, 1,
1.170432, 0.2597693, 0.6375117, 0, 0, 0, 1, 1,
1.175152, -0.6941025, 1.968121, 0, 0, 0, 1, 1,
1.180862, -1.387105, 2.196812, 0, 0, 0, 1, 1,
1.182343, 0.4112379, -0.958914, 0, 0, 0, 1, 1,
1.184631, 0.716091, 2.103606, 1, 1, 1, 1, 1,
1.187614, -0.9083263, 4.97102, 1, 1, 1, 1, 1,
1.189923, 1.596983, -0.6487322, 1, 1, 1, 1, 1,
1.19645, -2.073219, 3.958057, 1, 1, 1, 1, 1,
1.203827, -0.7361674, 3.105886, 1, 1, 1, 1, 1,
1.22304, -0.7919577, 1.18144, 1, 1, 1, 1, 1,
1.227131, -1.257714, 2.975272, 1, 1, 1, 1, 1,
1.227855, 0.3936525, -0.9237605, 1, 1, 1, 1, 1,
1.230191, -1.446744, 1.159006, 1, 1, 1, 1, 1,
1.231457, -0.3583372, 0.2737457, 1, 1, 1, 1, 1,
1.232865, -0.6542032, 1.391303, 1, 1, 1, 1, 1,
1.243062, 0.6621911, 2.879553, 1, 1, 1, 1, 1,
1.260161, -0.4998389, 1.309448, 1, 1, 1, 1, 1,
1.26798, -0.442888, 2.877187, 1, 1, 1, 1, 1,
1.270864, 2.731169, 0.06844968, 1, 1, 1, 1, 1,
1.273879, -0.0644303, 0.8621074, 0, 0, 1, 1, 1,
1.274925, 0.7113438, 1.37594, 1, 0, 0, 1, 1,
1.278531, -0.696784, 2.337249, 1, 0, 0, 1, 1,
1.292704, -0.014913, 1.085649, 1, 0, 0, 1, 1,
1.292806, -0.550279, 1.542682, 1, 0, 0, 1, 1,
1.300847, -1.179857, 3.400494, 1, 0, 0, 1, 1,
1.314165, 0.2939991, 1.51025, 0, 0, 0, 1, 1,
1.317227, -0.9552894, 0.6508714, 0, 0, 0, 1, 1,
1.318389, 1.407833, 0.7517953, 0, 0, 0, 1, 1,
1.3233, -0.4951837, 1.33636, 0, 0, 0, 1, 1,
1.352064, 0.3627917, 2.426496, 0, 0, 0, 1, 1,
1.352904, -0.5231858, 2.634563, 0, 0, 0, 1, 1,
1.356091, 0.458085, 1.224039, 0, 0, 0, 1, 1,
1.36558, 0.6646491, 2.125352, 1, 1, 1, 1, 1,
1.376547, -1.930105, 2.745815, 1, 1, 1, 1, 1,
1.389114, 0.7588344, 1.42715, 1, 1, 1, 1, 1,
1.391207, -0.9230072, 2.400621, 1, 1, 1, 1, 1,
1.393426, 0.05385244, 1.15637, 1, 1, 1, 1, 1,
1.40462, 1.013326, 0.06805448, 1, 1, 1, 1, 1,
1.411332, 0.5503681, 0.84341, 1, 1, 1, 1, 1,
1.414514, 0.4368542, 1.662048, 1, 1, 1, 1, 1,
1.428821, 0.2279689, 0.859541, 1, 1, 1, 1, 1,
1.42922, 0.4197056, 1.291731, 1, 1, 1, 1, 1,
1.430606, -0.5122771, 2.601025, 1, 1, 1, 1, 1,
1.430609, -1.148319, 1.61169, 1, 1, 1, 1, 1,
1.438914, -1.206268, 1.039158, 1, 1, 1, 1, 1,
1.460477, 0.3950517, -0.3752205, 1, 1, 1, 1, 1,
1.468971, 0.01866681, 1.41169, 1, 1, 1, 1, 1,
1.473035, -0.2114908, 2.087981, 0, 0, 1, 1, 1,
1.47554, -0.2249597, 2.386178, 1, 0, 0, 1, 1,
1.476206, 0.1634915, 0.7316518, 1, 0, 0, 1, 1,
1.47666, 1.264875, 1.62224, 1, 0, 0, 1, 1,
1.50772, 0.7023366, -0.1278253, 1, 0, 0, 1, 1,
1.512435, 0.4765848, 1.385814, 1, 0, 0, 1, 1,
1.517336, -1.472153, 2.358844, 0, 0, 0, 1, 1,
1.524485, -1.709953, 2.203594, 0, 0, 0, 1, 1,
1.535422, -2.018848, 3.231918, 0, 0, 0, 1, 1,
1.538646, -1.41034, 2.363264, 0, 0, 0, 1, 1,
1.538702, 0.3056667, 1.007321, 0, 0, 0, 1, 1,
1.540219, 0.8587922, -1.574327, 0, 0, 0, 1, 1,
1.548544, 1.376254, 0.05175094, 0, 0, 0, 1, 1,
1.558282, -1.441345, 2.390918, 1, 1, 1, 1, 1,
1.55877, 1.023187, 1.660666, 1, 1, 1, 1, 1,
1.561736, 0.1387957, 3.228429, 1, 1, 1, 1, 1,
1.561998, 0.3067791, 2.506933, 1, 1, 1, 1, 1,
1.569316, 1.361767, 2.564314, 1, 1, 1, 1, 1,
1.573936, -0.5189309, 0.7463197, 1, 1, 1, 1, 1,
1.580912, 0.7110125, 1.465935, 1, 1, 1, 1, 1,
1.600284, -1.015843, 0.67794, 1, 1, 1, 1, 1,
1.620242, -0.06764201, 2.700072, 1, 1, 1, 1, 1,
1.624302, -0.2598906, 2.15907, 1, 1, 1, 1, 1,
1.63284, 0.6314331, 0.4895903, 1, 1, 1, 1, 1,
1.638934, -0.1653138, 2.161731, 1, 1, 1, 1, 1,
1.639707, -0.7864793, 1.288906, 1, 1, 1, 1, 1,
1.658954, -0.5772231, 1.630711, 1, 1, 1, 1, 1,
1.678063, 0.6557257, 0.2747331, 1, 1, 1, 1, 1,
1.690643, 2.447833, 1.613582, 0, 0, 1, 1, 1,
1.693739, -1.140363, 2.278183, 1, 0, 0, 1, 1,
1.698757, -0.01982907, 1.603566, 1, 0, 0, 1, 1,
1.709227, -1.127539, 1.126977, 1, 0, 0, 1, 1,
1.71099, -0.5611068, 2.449437, 1, 0, 0, 1, 1,
1.713505, 1.500659, -0.4664517, 1, 0, 0, 1, 1,
1.721997, 0.1271061, -0.1493814, 0, 0, 0, 1, 1,
1.734497, 0.2462488, 0.5347368, 0, 0, 0, 1, 1,
1.734576, 0.5961163, -0.9485599, 0, 0, 0, 1, 1,
1.743153, 2.224507, 0.1642278, 0, 0, 0, 1, 1,
1.753169, -0.4223417, 2.212962, 0, 0, 0, 1, 1,
1.75905, 0.3162287, 1.40525, 0, 0, 0, 1, 1,
1.761065, -1.091741, 1.543081, 0, 0, 0, 1, 1,
1.765906, -0.957809, 2.576323, 1, 1, 1, 1, 1,
1.797653, -1.204486, 2.981261, 1, 1, 1, 1, 1,
1.801213, 0.9891795, 0.7413532, 1, 1, 1, 1, 1,
1.803874, -1.549709, 0.673319, 1, 1, 1, 1, 1,
1.822337, -1.616887, 4.038592, 1, 1, 1, 1, 1,
1.832865, 1.960701, 1.414147, 1, 1, 1, 1, 1,
1.896018, -0.9502174, 2.407224, 1, 1, 1, 1, 1,
1.903991, -0.9046373, 0.32779, 1, 1, 1, 1, 1,
1.933458, 0.02523453, 2.309794, 1, 1, 1, 1, 1,
1.995232, 0.9213033, 0.5942122, 1, 1, 1, 1, 1,
2.017402, -0.7113578, -0.2709393, 1, 1, 1, 1, 1,
2.038067, 1.155987, 3.394747, 1, 1, 1, 1, 1,
2.045899, 0.4289109, 1.384015, 1, 1, 1, 1, 1,
2.05296, 0.7211363, 1.216297, 1, 1, 1, 1, 1,
2.062449, -1.306759, 1.441091, 1, 1, 1, 1, 1,
2.065549, -0.7276949, 2.471751, 0, 0, 1, 1, 1,
2.078751, -0.4130213, 3.393019, 1, 0, 0, 1, 1,
2.129951, 1.974485, 0.68097, 1, 0, 0, 1, 1,
2.136504, -1.520865, 4.192149, 1, 0, 0, 1, 1,
2.147858, -0.7344756, 2.430998, 1, 0, 0, 1, 1,
2.15019, -0.6800425, 1.918186, 1, 0, 0, 1, 1,
2.190311, 0.7040265, 0.7998264, 0, 0, 0, 1, 1,
2.225628, -1.843203, 0.02752326, 0, 0, 0, 1, 1,
2.286801, 0.2878818, 1.722931, 0, 0, 0, 1, 1,
2.29201, 0.208133, 0.8588066, 0, 0, 0, 1, 1,
2.300833, -0.8708949, 1.863059, 0, 0, 0, 1, 1,
2.351615, 0.9513523, 0.07938714, 0, 0, 0, 1, 1,
2.402582, 0.9735129, 2.493722, 0, 0, 0, 1, 1,
2.420723, 1.424875, 1.08628, 1, 1, 1, 1, 1,
2.427133, -0.8825616, 1.945456, 1, 1, 1, 1, 1,
2.500123, -0.5950181, 1.291348, 1, 1, 1, 1, 1,
2.568714, 0.5545114, 1.698776, 1, 1, 1, 1, 1,
2.78072, 0.6327916, 1.61077, 1, 1, 1, 1, 1,
2.847738, 0.4017451, 1.563819, 1, 1, 1, 1, 1,
2.879536, 1.69405, 0.4804497, 1, 1, 1, 1, 1
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
var radius = 9.365336;
var distance = 32.89534;
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
mvMatrix.translate( 0.1133995, -0.1946187, 0.1367517 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.89534);
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
