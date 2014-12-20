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
-2.868084, 0.2359243, -1.367504, 1, 0, 0, 1,
-2.819033, -1.026785, -2.41022, 1, 0.007843138, 0, 1,
-2.775515, -0.1446234, -2.154462, 1, 0.01176471, 0, 1,
-2.570785, -0.4173238, 1.224464, 1, 0.01960784, 0, 1,
-2.487915, -0.1185189, 0.3833207, 1, 0.02352941, 0, 1,
-2.444965, -0.6556067, -1.93176, 1, 0.03137255, 0, 1,
-2.411245, -0.7614905, 0.7940412, 1, 0.03529412, 0, 1,
-2.387632, 1.06777, -2.170089, 1, 0.04313726, 0, 1,
-2.295791, 1.817084, -1.713435, 1, 0.04705882, 0, 1,
-2.223578, 0.7665505, -0.1208466, 1, 0.05490196, 0, 1,
-2.222899, 0.05959017, 0.2589316, 1, 0.05882353, 0, 1,
-2.221964, 0.7938074, -1.476874, 1, 0.06666667, 0, 1,
-2.191253, -0.2987639, -0.7236222, 1, 0.07058824, 0, 1,
-2.166719, 0.348298, -1.480882, 1, 0.07843138, 0, 1,
-2.150789, -0.3204755, -0.7757085, 1, 0.08235294, 0, 1,
-2.12628, -0.8215975, -2.340527, 1, 0.09019608, 0, 1,
-2.123715, 0.06980963, -0.6449972, 1, 0.09411765, 0, 1,
-2.112916, 1.114677, 0.4721641, 1, 0.1019608, 0, 1,
-2.103646, 0.5836886, -2.127381, 1, 0.1098039, 0, 1,
-2.101404, -0.3028023, -2.096216, 1, 0.1137255, 0, 1,
-2.098133, 0.0167441, -1.790063, 1, 0.1215686, 0, 1,
-2.091336, 0.1789981, -1.297118, 1, 0.1254902, 0, 1,
-2.063069, -1.088447, -2.35394, 1, 0.1333333, 0, 1,
-2.062295, 0.5604793, -1.026806, 1, 0.1372549, 0, 1,
-2.006481, 1.404858, -2.372188, 1, 0.145098, 0, 1,
-1.954827, -2.033279, -3.282919, 1, 0.1490196, 0, 1,
-1.946927, 0.6477232, -0.1051281, 1, 0.1568628, 0, 1,
-1.91336, -2.734603, -0.8692753, 1, 0.1607843, 0, 1,
-1.909187, 0.958994, -0.4784989, 1, 0.1686275, 0, 1,
-1.908142, 0.6335259, -2.108209, 1, 0.172549, 0, 1,
-1.905133, 1.810891, 0.3351958, 1, 0.1803922, 0, 1,
-1.891136, 0.08188316, -1.947893, 1, 0.1843137, 0, 1,
-1.887383, 0.07224397, -1.337486, 1, 0.1921569, 0, 1,
-1.863638, -0.09807841, -0.847301, 1, 0.1960784, 0, 1,
-1.861924, 0.9840556, -2.88305, 1, 0.2039216, 0, 1,
-1.855428, -0.8900499, -0.01542383, 1, 0.2117647, 0, 1,
-1.821758, 0.4362582, -1.917162, 1, 0.2156863, 0, 1,
-1.813648, -0.3693789, -1.184726, 1, 0.2235294, 0, 1,
-1.794489, 0.6540875, -1.460405, 1, 0.227451, 0, 1,
-1.786532, -0.7884499, -1.711016, 1, 0.2352941, 0, 1,
-1.782687, 1.038819, -0.4199666, 1, 0.2392157, 0, 1,
-1.778117, 0.5684181, -0.8248654, 1, 0.2470588, 0, 1,
-1.768364, 1.725502, -1.009025, 1, 0.2509804, 0, 1,
-1.742204, -1.474815, -2.629207, 1, 0.2588235, 0, 1,
-1.737506, 0.743144, -0.5977628, 1, 0.2627451, 0, 1,
-1.727927, 0.622021, -1.70604, 1, 0.2705882, 0, 1,
-1.712439, 0.8717614, -1.210064, 1, 0.2745098, 0, 1,
-1.686339, 0.2606268, -2.004359, 1, 0.282353, 0, 1,
-1.683818, 0.8849246, -0.9287469, 1, 0.2862745, 0, 1,
-1.652028, -0.8728077, -4.493928, 1, 0.2941177, 0, 1,
-1.643235, 0.06626564, 0.103636, 1, 0.3019608, 0, 1,
-1.624239, 1.233578, -0.7526387, 1, 0.3058824, 0, 1,
-1.610717, 1.516873, -0.5253252, 1, 0.3137255, 0, 1,
-1.593807, -0.9320294, -1.590912, 1, 0.3176471, 0, 1,
-1.575315, -0.5528975, -1.404508, 1, 0.3254902, 0, 1,
-1.573772, -0.4962312, -0.7808728, 1, 0.3294118, 0, 1,
-1.570851, -0.07441224, -1.402407, 1, 0.3372549, 0, 1,
-1.569022, -0.8125028, -0.736541, 1, 0.3411765, 0, 1,
-1.567702, 2.379394, -0.6165262, 1, 0.3490196, 0, 1,
-1.561557, -0.6530006, -1.338425, 1, 0.3529412, 0, 1,
-1.546007, -0.2005559, -0.908374, 1, 0.3607843, 0, 1,
-1.531407, -0.4461513, -2.101393, 1, 0.3647059, 0, 1,
-1.526599, 0.8052441, 0.7335734, 1, 0.372549, 0, 1,
-1.525235, -1.507535, -3.393276, 1, 0.3764706, 0, 1,
-1.522762, 0.8646201, -1.271032, 1, 0.3843137, 0, 1,
-1.520472, -0.8766537, -3.355652, 1, 0.3882353, 0, 1,
-1.519262, 0.9684381, -0.4565783, 1, 0.3960784, 0, 1,
-1.518272, 0.1433849, -1.040346, 1, 0.4039216, 0, 1,
-1.477113, -0.06810011, -2.300767, 1, 0.4078431, 0, 1,
-1.466481, 0.8288801, -0.4108892, 1, 0.4156863, 0, 1,
-1.461161, -1.60137, -3.251718, 1, 0.4196078, 0, 1,
-1.458983, 0.5345523, -0.9807172, 1, 0.427451, 0, 1,
-1.457004, 0.2569923, -0.9694647, 1, 0.4313726, 0, 1,
-1.455013, -0.8447636, -2.43359, 1, 0.4392157, 0, 1,
-1.451222, 0.04432348, -2.522738, 1, 0.4431373, 0, 1,
-1.437065, -0.5281621, -1.700746, 1, 0.4509804, 0, 1,
-1.435857, -2.219575, -2.873307, 1, 0.454902, 0, 1,
-1.428775, 1.581965, 0.2081712, 1, 0.4627451, 0, 1,
-1.414392, -0.158871, -2.63763, 1, 0.4666667, 0, 1,
-1.414232, 2.031338, 0.05553718, 1, 0.4745098, 0, 1,
-1.405647, -0.647175, -2.547644, 1, 0.4784314, 0, 1,
-1.40564, 0.2240634, -2.196514, 1, 0.4862745, 0, 1,
-1.399552, 1.789938, -1.765797, 1, 0.4901961, 0, 1,
-1.389918, -0.9449174, -1.508773, 1, 0.4980392, 0, 1,
-1.389566, -0.659175, -1.677311, 1, 0.5058824, 0, 1,
-1.387091, 0.312015, -3.250695, 1, 0.509804, 0, 1,
-1.364945, -0.5961332, -1.803818, 1, 0.5176471, 0, 1,
-1.356281, -0.4577847, -2.240846, 1, 0.5215687, 0, 1,
-1.351308, 0.7951759, -1.038737, 1, 0.5294118, 0, 1,
-1.351205, 0.1441464, -2.054322, 1, 0.5333334, 0, 1,
-1.34216, 0.6090553, 0.1315508, 1, 0.5411765, 0, 1,
-1.333592, -1.13306, -2.141428, 1, 0.5450981, 0, 1,
-1.333085, 0.02897085, -1.042829, 1, 0.5529412, 0, 1,
-1.330043, -0.8032278, -1.147814, 1, 0.5568628, 0, 1,
-1.316867, -1.152232, -2.844149, 1, 0.5647059, 0, 1,
-1.309844, -1.148487, -3.030637, 1, 0.5686275, 0, 1,
-1.305316, -0.5881947, -1.272255, 1, 0.5764706, 0, 1,
-1.298348, 0.28352, -1.236439, 1, 0.5803922, 0, 1,
-1.2947, 0.2061819, -0.1170658, 1, 0.5882353, 0, 1,
-1.29329, -0.394309, -3.988847, 1, 0.5921569, 0, 1,
-1.291999, -0.4149333, -1.386423, 1, 0.6, 0, 1,
-1.287754, -0.08850734, -3.362165, 1, 0.6078432, 0, 1,
-1.287568, -1.545071, -0.3989875, 1, 0.6117647, 0, 1,
-1.284693, -0.6826844, -1.595226, 1, 0.6196079, 0, 1,
-1.272197, -1.059038, -2.396866, 1, 0.6235294, 0, 1,
-1.267848, 1.544063, -0.9534032, 1, 0.6313726, 0, 1,
-1.264588, -1.890776, -2.207243, 1, 0.6352941, 0, 1,
-1.263073, -0.5814049, -3.046871, 1, 0.6431373, 0, 1,
-1.261008, 0.1050144, -0.006787108, 1, 0.6470588, 0, 1,
-1.260308, 0.7016485, -1.371476, 1, 0.654902, 0, 1,
-1.256739, -0.574863, -2.074053, 1, 0.6588235, 0, 1,
-1.253172, 0.2857035, -1.941712, 1, 0.6666667, 0, 1,
-1.247398, -0.958595, -1.656893, 1, 0.6705883, 0, 1,
-1.239259, -1.523463, -2.331858, 1, 0.6784314, 0, 1,
-1.238834, 0.9996693, 0.1861162, 1, 0.682353, 0, 1,
-1.234122, 0.7597725, -0.7987682, 1, 0.6901961, 0, 1,
-1.233837, 0.152307, -2.753705, 1, 0.6941177, 0, 1,
-1.228859, 0.2847632, -0.6418334, 1, 0.7019608, 0, 1,
-1.217987, -0.01887953, 0.04107971, 1, 0.7098039, 0, 1,
-1.21439, 0.939118, -2.517972, 1, 0.7137255, 0, 1,
-1.213172, 0.1588573, -1.490206, 1, 0.7215686, 0, 1,
-1.20384, 1.551412, 1.585961, 1, 0.7254902, 0, 1,
-1.203017, 1.54705, -1.291623, 1, 0.7333333, 0, 1,
-1.191536, 0.8867928, -1.352774, 1, 0.7372549, 0, 1,
-1.191462, -1.6246, -3.019543, 1, 0.7450981, 0, 1,
-1.190744, -0.9294152, -1.396828, 1, 0.7490196, 0, 1,
-1.177979, -0.3512638, -2.929425, 1, 0.7568628, 0, 1,
-1.176207, 0.6797165, -1.169927, 1, 0.7607843, 0, 1,
-1.169389, -0.5135611, -1.990902, 1, 0.7686275, 0, 1,
-1.168333, 0.6511252, -0.113398, 1, 0.772549, 0, 1,
-1.165833, 0.6336356, 0.658991, 1, 0.7803922, 0, 1,
-1.164855, -0.882458, -1.858414, 1, 0.7843137, 0, 1,
-1.16173, -0.1221691, -3.067199, 1, 0.7921569, 0, 1,
-1.154116, 1.377384, -0.2810723, 1, 0.7960784, 0, 1,
-1.141663, -1.78205, -3.680165, 1, 0.8039216, 0, 1,
-1.140913, 0.6091636, -0.8742474, 1, 0.8117647, 0, 1,
-1.138403, 1.821314, 0.1165994, 1, 0.8156863, 0, 1,
-1.13658, -0.004876999, -2.864784, 1, 0.8235294, 0, 1,
-1.129489, 0.1919088, 0.3155565, 1, 0.827451, 0, 1,
-1.127252, -0.6193393, -1.70566, 1, 0.8352941, 0, 1,
-1.121327, -1.122244, -1.413928, 1, 0.8392157, 0, 1,
-1.119083, 0.3148617, -3.476334, 1, 0.8470588, 0, 1,
-1.117484, 0.1685029, -2.588508, 1, 0.8509804, 0, 1,
-1.112173, 1.457676, 0.9237632, 1, 0.8588235, 0, 1,
-1.109283, 1.363747, 1.269855, 1, 0.8627451, 0, 1,
-1.104153, -0.7379054, -1.400645, 1, 0.8705882, 0, 1,
-1.102723, 2.780406, -0.7219367, 1, 0.8745098, 0, 1,
-1.096937, 1.094306, -0.2077698, 1, 0.8823529, 0, 1,
-1.092697, 0.009107309, -1.121694, 1, 0.8862745, 0, 1,
-1.092578, -0.259354, -3.668146, 1, 0.8941177, 0, 1,
-1.092113, 1.800934, 1.277338, 1, 0.8980392, 0, 1,
-1.091656, -0.7138406, -2.591705, 1, 0.9058824, 0, 1,
-1.080399, -0.9450708, -3.52515, 1, 0.9137255, 0, 1,
-1.06222, 1.247035, 0.1277955, 1, 0.9176471, 0, 1,
-1.057218, -0.3884314, -0.3381712, 1, 0.9254902, 0, 1,
-1.056311, 0.2175815, 0.1406581, 1, 0.9294118, 0, 1,
-1.052973, -1.246983, -2.232691, 1, 0.9372549, 0, 1,
-1.050359, -1.736393, -3.201879, 1, 0.9411765, 0, 1,
-1.046653, -2.311174, -1.715598, 1, 0.9490196, 0, 1,
-1.040717, 0.4880207, -1.857888, 1, 0.9529412, 0, 1,
-1.037874, 0.4853868, -0.9335937, 1, 0.9607843, 0, 1,
-1.033115, 0.6455153, 0.6613693, 1, 0.9647059, 0, 1,
-1.023974, -0.3928188, -0.6991252, 1, 0.972549, 0, 1,
-1.023378, 0.9776456, -0.5954167, 1, 0.9764706, 0, 1,
-1.02046, -0.3005394, -1.355706, 1, 0.9843137, 0, 1,
-1.003364, 0.09692676, -1.936067, 1, 0.9882353, 0, 1,
-1.000916, -1.665389, -2.277483, 1, 0.9960784, 0, 1,
-0.9927965, -0.7296497, -2.388967, 0.9960784, 1, 0, 1,
-0.9907417, 0.5301941, -1.192461, 0.9921569, 1, 0, 1,
-0.9826242, 0.7750501, -0.5640349, 0.9843137, 1, 0, 1,
-0.9740833, 0.6838136, -0.317451, 0.9803922, 1, 0, 1,
-0.9659382, -0.5286921, -1.650443, 0.972549, 1, 0, 1,
-0.9612948, 0.4427134, -1.394705, 0.9686275, 1, 0, 1,
-0.9607165, -0.8845166, -1.094449, 0.9607843, 1, 0, 1,
-0.958736, 0.3088619, -0.8305821, 0.9568627, 1, 0, 1,
-0.9540328, 1.917208, -0.4101037, 0.9490196, 1, 0, 1,
-0.9489367, -1.831967, -2.131129, 0.945098, 1, 0, 1,
-0.9480429, -0.04843458, -3.134067, 0.9372549, 1, 0, 1,
-0.9462333, 2.447664, 0.5496348, 0.9333333, 1, 0, 1,
-0.9457407, 0.6966292, 0.9609444, 0.9254902, 1, 0, 1,
-0.9398547, 0.1632387, 1.181183, 0.9215686, 1, 0, 1,
-0.9325537, 0.0009470861, -2.188193, 0.9137255, 1, 0, 1,
-0.9282064, 0.3012532, -1.058583, 0.9098039, 1, 0, 1,
-0.9276818, -0.7890907, -4.093751, 0.9019608, 1, 0, 1,
-0.913184, 0.2440727, 0.3152478, 0.8941177, 1, 0, 1,
-0.9089254, -1.943584, -4.870523, 0.8901961, 1, 0, 1,
-0.9082476, -0.04169956, -0.2207583, 0.8823529, 1, 0, 1,
-0.9081602, 1.337428, -0.5370132, 0.8784314, 1, 0, 1,
-0.9074575, 0.4518726, -0.6701594, 0.8705882, 1, 0, 1,
-0.9067228, -0.9288901, -1.789207, 0.8666667, 1, 0, 1,
-0.9044548, -0.428344, -1.505588, 0.8588235, 1, 0, 1,
-0.9043415, 0.5800486, -0.4636186, 0.854902, 1, 0, 1,
-0.9039283, 0.09205811, -1.810071, 0.8470588, 1, 0, 1,
-0.8977872, 1.434061, -0.3815125, 0.8431373, 1, 0, 1,
-0.8973199, -0.07360552, -2.21828, 0.8352941, 1, 0, 1,
-0.8940873, 0.7536117, -0.4563189, 0.8313726, 1, 0, 1,
-0.8935823, 0.7418596, -0.1624603, 0.8235294, 1, 0, 1,
-0.8930854, -2.005466, -5.223142, 0.8196079, 1, 0, 1,
-0.877198, -1.155101, -2.154821, 0.8117647, 1, 0, 1,
-0.8666105, 1.34647, -1.144174, 0.8078431, 1, 0, 1,
-0.8614942, 0.8384699, -0.5813913, 0.8, 1, 0, 1,
-0.8606304, -0.4232767, -2.734873, 0.7921569, 1, 0, 1,
-0.8575143, 0.737792, 0.4923788, 0.7882353, 1, 0, 1,
-0.8541492, -0.2508238, -0.8587406, 0.7803922, 1, 0, 1,
-0.8365932, -1.322126, -2.880908, 0.7764706, 1, 0, 1,
-0.8321328, 0.5212341, -0.6515095, 0.7686275, 1, 0, 1,
-0.8241714, -0.7288997, -1.246195, 0.7647059, 1, 0, 1,
-0.8230171, -2.084118, -1.852897, 0.7568628, 1, 0, 1,
-0.82291, -2.386171, -2.686306, 0.7529412, 1, 0, 1,
-0.8196044, 0.1338915, -1.834899, 0.7450981, 1, 0, 1,
-0.8178363, 1.072518, -1.240986, 0.7411765, 1, 0, 1,
-0.8098946, 0.9670398, -0.2262549, 0.7333333, 1, 0, 1,
-0.8060697, -0.07264648, 0.4664491, 0.7294118, 1, 0, 1,
-0.7982371, -1.036836, -1.904391, 0.7215686, 1, 0, 1,
-0.7961094, -0.5248876, -1.711674, 0.7176471, 1, 0, 1,
-0.7892581, 0.7185199, -2.443518, 0.7098039, 1, 0, 1,
-0.7863396, -0.3645202, -3.277926, 0.7058824, 1, 0, 1,
-0.780095, 0.2173847, -1.700528, 0.6980392, 1, 0, 1,
-0.7789878, -0.8959741, -2.067827, 0.6901961, 1, 0, 1,
-0.7717637, -0.6305336, -3.257233, 0.6862745, 1, 0, 1,
-0.7701732, -0.1590885, -4.149752, 0.6784314, 1, 0, 1,
-0.7655094, 1.232394, -0.235965, 0.6745098, 1, 0, 1,
-0.7545773, 2.158509, 0.5784326, 0.6666667, 1, 0, 1,
-0.753367, 1.969995, -1.858771, 0.6627451, 1, 0, 1,
-0.7520597, 1.680622, -0.3522565, 0.654902, 1, 0, 1,
-0.7500647, 0.1214914, -0.1400955, 0.6509804, 1, 0, 1,
-0.749023, 0.4318737, -1.525825, 0.6431373, 1, 0, 1,
-0.7390765, 1.201375, 1.120529, 0.6392157, 1, 0, 1,
-0.7388328, -0.9057994, -2.516969, 0.6313726, 1, 0, 1,
-0.7320439, 0.1147092, -1.399342, 0.627451, 1, 0, 1,
-0.7304978, -1.949962, -5.34977, 0.6196079, 1, 0, 1,
-0.7298803, -0.4620361, -3.410605, 0.6156863, 1, 0, 1,
-0.7290936, -0.9822626, -2.710244, 0.6078432, 1, 0, 1,
-0.7285748, 0.493972, -1.808508, 0.6039216, 1, 0, 1,
-0.7281767, -0.06235353, -2.853591, 0.5960785, 1, 0, 1,
-0.7266163, 0.1253709, -1.015926, 0.5882353, 1, 0, 1,
-0.7249162, -0.1696399, -0.8742113, 0.5843138, 1, 0, 1,
-0.7232774, 1.109738, -1.722421, 0.5764706, 1, 0, 1,
-0.7203645, -0.187838, -0.8054284, 0.572549, 1, 0, 1,
-0.7183673, -0.7704756, -3.51017, 0.5647059, 1, 0, 1,
-0.7162688, -0.5798317, -3.100887, 0.5607843, 1, 0, 1,
-0.7089239, -0.04547879, -2.956959, 0.5529412, 1, 0, 1,
-0.7056507, -1.839082, -3.881322, 0.5490196, 1, 0, 1,
-0.7047808, 2.109784, -0.6925241, 0.5411765, 1, 0, 1,
-0.7035121, -0.1888728, -2.525387, 0.5372549, 1, 0, 1,
-0.6948941, -1.300915, -0.120453, 0.5294118, 1, 0, 1,
-0.6893932, 0.9592046, -1.123325, 0.5254902, 1, 0, 1,
-0.6850818, -1.217562, -4.096898, 0.5176471, 1, 0, 1,
-0.6848894, -0.1814195, -2.106974, 0.5137255, 1, 0, 1,
-0.6815531, -1.41187, -2.350608, 0.5058824, 1, 0, 1,
-0.6791629, 0.1709081, -1.672514, 0.5019608, 1, 0, 1,
-0.6662078, 0.03989633, -1.952239, 0.4941176, 1, 0, 1,
-0.6644368, 1.744734, -1.394415, 0.4862745, 1, 0, 1,
-0.6640908, -1.971819, -3.399435, 0.4823529, 1, 0, 1,
-0.6620156, 1.647761, -0.6373624, 0.4745098, 1, 0, 1,
-0.6586621, -1.219869, -2.210944, 0.4705882, 1, 0, 1,
-0.6550925, 2.286598, 0.6759384, 0.4627451, 1, 0, 1,
-0.6541482, 0.6169845, -1.618692, 0.4588235, 1, 0, 1,
-0.6527257, -1.524134, -2.629884, 0.4509804, 1, 0, 1,
-0.6518698, 0.7212548, -0.8740554, 0.4470588, 1, 0, 1,
-0.6424686, -0.4024543, -1.12025, 0.4392157, 1, 0, 1,
-0.6369565, 1.154399, 1.667737, 0.4352941, 1, 0, 1,
-0.6363647, 0.09085816, -0.9497759, 0.427451, 1, 0, 1,
-0.6335232, -0.07752212, -1.327783, 0.4235294, 1, 0, 1,
-0.6333794, -2.180316, -3.581832, 0.4156863, 1, 0, 1,
-0.6305705, 0.3523661, 0.6701508, 0.4117647, 1, 0, 1,
-0.6281295, 0.5613132, -0.5058846, 0.4039216, 1, 0, 1,
-0.6277344, -0.8249968, -4.577738, 0.3960784, 1, 0, 1,
-0.6263074, -1.167732, -1.928808, 0.3921569, 1, 0, 1,
-0.6204938, 2.422574, -0.9190526, 0.3843137, 1, 0, 1,
-0.6198338, 0.5171107, -0.5133154, 0.3803922, 1, 0, 1,
-0.6194202, -0.6314241, -2.427888, 0.372549, 1, 0, 1,
-0.6168145, 0.6980602, -1.246875, 0.3686275, 1, 0, 1,
-0.6124948, 0.5664096, -0.6786348, 0.3607843, 1, 0, 1,
-0.6071278, 0.207816, -2.572486, 0.3568628, 1, 0, 1,
-0.6005493, 0.8150192, -0.9975479, 0.3490196, 1, 0, 1,
-0.5996303, 0.06783884, -1.860565, 0.345098, 1, 0, 1,
-0.5968049, 0.007502487, -1.488177, 0.3372549, 1, 0, 1,
-0.5936448, 0.9152902, -1.490946, 0.3333333, 1, 0, 1,
-0.5880107, 0.04681623, -2.436457, 0.3254902, 1, 0, 1,
-0.5828961, -0.5273864, -0.8112593, 0.3215686, 1, 0, 1,
-0.5785208, 1.151853, -2.327892, 0.3137255, 1, 0, 1,
-0.572942, -2.000962, -2.987636, 0.3098039, 1, 0, 1,
-0.570719, 0.8060692, -1.484343, 0.3019608, 1, 0, 1,
-0.5652771, -0.4936427, -2.773437, 0.2941177, 1, 0, 1,
-0.5645799, -0.7752685, -1.283557, 0.2901961, 1, 0, 1,
-0.5641407, -0.0835133, -2.658472, 0.282353, 1, 0, 1,
-0.5589842, -1.425783, -4.622222, 0.2784314, 1, 0, 1,
-0.5528145, 0.5696486, -0.8697425, 0.2705882, 1, 0, 1,
-0.5523432, -0.4081317, -0.7166133, 0.2666667, 1, 0, 1,
-0.5507972, -0.5437066, -0.8046836, 0.2588235, 1, 0, 1,
-0.5470119, -0.08518511, -3.675298, 0.254902, 1, 0, 1,
-0.5449452, 0.8472463, -1.223934, 0.2470588, 1, 0, 1,
-0.5420333, -0.1960636, -1.805466, 0.2431373, 1, 0, 1,
-0.5416304, -0.3474104, -1.36766, 0.2352941, 1, 0, 1,
-0.5402329, -0.02239107, -2.85717, 0.2313726, 1, 0, 1,
-0.5392068, 0.4472381, 0.5642461, 0.2235294, 1, 0, 1,
-0.5383905, -0.1496965, -2.852771, 0.2196078, 1, 0, 1,
-0.5372198, 1.162414, -1.329704, 0.2117647, 1, 0, 1,
-0.5340621, 1.20773, -0.6770372, 0.2078431, 1, 0, 1,
-0.5314333, 1.51576, 0.1190148, 0.2, 1, 0, 1,
-0.5300221, 0.964757, -0.9285771, 0.1921569, 1, 0, 1,
-0.5270367, 1.073161, 0.5411427, 0.1882353, 1, 0, 1,
-0.5260636, 0.6770592, -0.6775979, 0.1803922, 1, 0, 1,
-0.523303, 0.5780277, -0.4102349, 0.1764706, 1, 0, 1,
-0.5211138, -0.08296593, -1.014608, 0.1686275, 1, 0, 1,
-0.5205178, -0.05201593, -1.741253, 0.1647059, 1, 0, 1,
-0.51926, -0.8803402, -2.86691, 0.1568628, 1, 0, 1,
-0.5186982, 0.9074815, -0.2494486, 0.1529412, 1, 0, 1,
-0.5176349, -0.944352, -3.008473, 0.145098, 1, 0, 1,
-0.5169821, 1.170871, -1.557542, 0.1411765, 1, 0, 1,
-0.5167895, -0.393806, -1.091465, 0.1333333, 1, 0, 1,
-0.5155352, -1.062374, -4.41715, 0.1294118, 1, 0, 1,
-0.5086987, -1.188545, -3.603749, 0.1215686, 1, 0, 1,
-0.4976288, -1.031006, -2.360551, 0.1176471, 1, 0, 1,
-0.4967601, -0.2847319, -0.7954666, 0.1098039, 1, 0, 1,
-0.4949584, 0.562169, -0.06480659, 0.1058824, 1, 0, 1,
-0.4915213, 1.596641, -0.5007901, 0.09803922, 1, 0, 1,
-0.4843157, 0.1200045, -1.396636, 0.09019608, 1, 0, 1,
-0.4840345, 2.687322, -0.009424702, 0.08627451, 1, 0, 1,
-0.4771642, -0.0008103212, -2.452743, 0.07843138, 1, 0, 1,
-0.4771441, -2.207508, -3.386154, 0.07450981, 1, 0, 1,
-0.4764403, 0.4217698, -2.010752, 0.06666667, 1, 0, 1,
-0.4755725, 0.1709568, -1.817636, 0.0627451, 1, 0, 1,
-0.4740248, -1.379798, -2.943427, 0.05490196, 1, 0, 1,
-0.4735474, 0.3468687, -0.2384165, 0.05098039, 1, 0, 1,
-0.4701203, -0.1483202, -3.86306, 0.04313726, 1, 0, 1,
-0.4651984, -0.7513323, -3.627587, 0.03921569, 1, 0, 1,
-0.4518043, 0.3432268, 0.5838396, 0.03137255, 1, 0, 1,
-0.4503218, 0.5250474, -0.5815434, 0.02745098, 1, 0, 1,
-0.4498583, -1.199878, -0.8097298, 0.01960784, 1, 0, 1,
-0.44946, -0.6278436, -2.439184, 0.01568628, 1, 0, 1,
-0.4494047, -0.8450963, -4.909234, 0.007843138, 1, 0, 1,
-0.4484201, -0.9204386, -3.78654, 0.003921569, 1, 0, 1,
-0.4476811, -0.4158008, -1.559511, 0, 1, 0.003921569, 1,
-0.444641, -1.309431, -2.775156, 0, 1, 0.01176471, 1,
-0.4434056, 1.17493, 0.666828, 0, 1, 0.01568628, 1,
-0.440816, 0.1611449, -0.9464103, 0, 1, 0.02352941, 1,
-0.4390789, -0.2786959, -2.296996, 0, 1, 0.02745098, 1,
-0.4290788, -0.08907803, 0.08427654, 0, 1, 0.03529412, 1,
-0.4230623, 2.048465, 2.68168, 0, 1, 0.03921569, 1,
-0.422174, -1.14498, -3.968788, 0, 1, 0.04705882, 1,
-0.4157425, -0.3671626, -2.345409, 0, 1, 0.05098039, 1,
-0.4150487, -1.037252, -4.296741, 0, 1, 0.05882353, 1,
-0.4132001, -0.06363456, -0.3970501, 0, 1, 0.0627451, 1,
-0.4103959, 0.8485952, 0.1162981, 0, 1, 0.07058824, 1,
-0.4052296, 0.413957, -1.868242, 0, 1, 0.07450981, 1,
-0.4025527, -1.304092, -2.077621, 0, 1, 0.08235294, 1,
-0.3990194, -0.4303336, -3.064721, 0, 1, 0.08627451, 1,
-0.3966507, 0.3827713, -1.891225, 0, 1, 0.09411765, 1,
-0.3958507, -0.5238469, -2.666041, 0, 1, 0.1019608, 1,
-0.3892917, 0.6281528, 0.7390857, 0, 1, 0.1058824, 1,
-0.3842547, -1.189775, -2.429822, 0, 1, 0.1137255, 1,
-0.3826684, 0.894114, -0.2356211, 0, 1, 0.1176471, 1,
-0.3822285, 0.05611777, -2.417988, 0, 1, 0.1254902, 1,
-0.3763839, -0.05877768, -0.928213, 0, 1, 0.1294118, 1,
-0.3752814, 0.1050172, -2.4338, 0, 1, 0.1372549, 1,
-0.3732912, 1.272623, -1.091962, 0, 1, 0.1411765, 1,
-0.3567633, 0.7350532, -0.3105364, 0, 1, 0.1490196, 1,
-0.3545558, -1.328789, -2.929738, 0, 1, 0.1529412, 1,
-0.3543719, 0.1966132, -1.346922, 0, 1, 0.1607843, 1,
-0.3537017, -0.9002408, -1.384009, 0, 1, 0.1647059, 1,
-0.3416275, 1.193989, -0.796244, 0, 1, 0.172549, 1,
-0.3376607, -1.646572, -2.629768, 0, 1, 0.1764706, 1,
-0.3325634, -0.545639, -3.076646, 0, 1, 0.1843137, 1,
-0.3301813, -0.8435048, -3.33891, 0, 1, 0.1882353, 1,
-0.3285294, 0.9118945, -0.4876954, 0, 1, 0.1960784, 1,
-0.3264304, -0.3693905, -3.19724, 0, 1, 0.2039216, 1,
-0.3247388, 0.9615822, 0.7728673, 0, 1, 0.2078431, 1,
-0.3179424, 0.07955777, -1.255769, 0, 1, 0.2156863, 1,
-0.3126008, -0.03424961, -1.356272, 0, 1, 0.2196078, 1,
-0.3123193, 0.5153226, 0.4812247, 0, 1, 0.227451, 1,
-0.3117411, 0.3164347, -1.544937, 0, 1, 0.2313726, 1,
-0.3003119, -1.442658, -2.963082, 0, 1, 0.2392157, 1,
-0.2994869, -1.249953, -3.530998, 0, 1, 0.2431373, 1,
-0.2962343, -0.02098144, -1.403806, 0, 1, 0.2509804, 1,
-0.2953848, -0.614502, -3.414108, 0, 1, 0.254902, 1,
-0.2946254, 0.3445807, -0.2578757, 0, 1, 0.2627451, 1,
-0.2923579, -0.2667401, -3.07757, 0, 1, 0.2666667, 1,
-0.2902789, -0.2273531, -0.6146926, 0, 1, 0.2745098, 1,
-0.2861819, -0.2420149, -3.748173, 0, 1, 0.2784314, 1,
-0.2730906, -0.4741978, -3.204192, 0, 1, 0.2862745, 1,
-0.2699451, 2.072158, 1.5899, 0, 1, 0.2901961, 1,
-0.264206, 0.01175703, -2.41021, 0, 1, 0.2980392, 1,
-0.2623094, -0.6046671, -2.945424, 0, 1, 0.3058824, 1,
-0.2613001, 1.078882, -0.4274965, 0, 1, 0.3098039, 1,
-0.2607772, -0.3211535, -0.06547365, 0, 1, 0.3176471, 1,
-0.2605551, -0.4470982, -2.604178, 0, 1, 0.3215686, 1,
-0.2604283, 2.646483, -0.432612, 0, 1, 0.3294118, 1,
-0.2601542, 0.4127571, -0.9580336, 0, 1, 0.3333333, 1,
-0.2487589, 0.5629246, -0.8202463, 0, 1, 0.3411765, 1,
-0.2430409, -3.083193, -3.444012, 0, 1, 0.345098, 1,
-0.2419703, 0.4914255, -1.433633, 0, 1, 0.3529412, 1,
-0.2414057, 2.233982, 0.5944863, 0, 1, 0.3568628, 1,
-0.2411188, -0.5796388, -2.65667, 0, 1, 0.3647059, 1,
-0.2373309, -0.69919, -4.043794, 0, 1, 0.3686275, 1,
-0.2356036, 0.553124, 0.1919935, 0, 1, 0.3764706, 1,
-0.2346704, -0.7181708, -2.41015, 0, 1, 0.3803922, 1,
-0.2332328, 0.2098056, -1.158508, 0, 1, 0.3882353, 1,
-0.232419, -0.1248958, -2.363863, 0, 1, 0.3921569, 1,
-0.2289061, 1.02505, 0.5039276, 0, 1, 0.4, 1,
-0.2251261, -0.1712165, -2.903476, 0, 1, 0.4078431, 1,
-0.2123667, 0.3919099, -0.3557616, 0, 1, 0.4117647, 1,
-0.2118107, 0.3515179, -2.32179, 0, 1, 0.4196078, 1,
-0.2112773, 0.02749188, -1.558085, 0, 1, 0.4235294, 1,
-0.2046117, 1.335896, -0.5588962, 0, 1, 0.4313726, 1,
-0.2005673, -0.2133228, -2.107513, 0, 1, 0.4352941, 1,
-0.1992154, -0.9516305, -1.924639, 0, 1, 0.4431373, 1,
-0.1922066, 1.709111, 1.196482, 0, 1, 0.4470588, 1,
-0.1895692, -1.006803, -3.761446, 0, 1, 0.454902, 1,
-0.188592, -0.9566622, -4.534414, 0, 1, 0.4588235, 1,
-0.1870531, -1.263456, -4.065173, 0, 1, 0.4666667, 1,
-0.185424, 0.6044276, -0.1256756, 0, 1, 0.4705882, 1,
-0.1854144, 0.004078115, -2.283947, 0, 1, 0.4784314, 1,
-0.1826838, -0.58337, -2.30819, 0, 1, 0.4823529, 1,
-0.1801551, 1.795235, -0.05062516, 0, 1, 0.4901961, 1,
-0.1784143, 0.2878144, -1.91664, 0, 1, 0.4941176, 1,
-0.1774345, 1.843398, -0.552972, 0, 1, 0.5019608, 1,
-0.1769381, 0.3623099, -0.6855779, 0, 1, 0.509804, 1,
-0.1765993, 0.7333943, 0.3920195, 0, 1, 0.5137255, 1,
-0.1758959, 0.8968883, 0.3052326, 0, 1, 0.5215687, 1,
-0.1750178, -0.3583165, -2.714687, 0, 1, 0.5254902, 1,
-0.1747736, 0.4013804, 0.170635, 0, 1, 0.5333334, 1,
-0.1737349, -0.7919707, -2.862613, 0, 1, 0.5372549, 1,
-0.1667659, 2.136377, 0.4824286, 0, 1, 0.5450981, 1,
-0.1659347, 0.1030868, -0.365469, 0, 1, 0.5490196, 1,
-0.1651539, 0.4809176, 0.2113826, 0, 1, 0.5568628, 1,
-0.1649569, 1.302142, 0.6480365, 0, 1, 0.5607843, 1,
-0.1647337, -0.2482573, -3.218864, 0, 1, 0.5686275, 1,
-0.1645358, -0.8524135, -1.731428, 0, 1, 0.572549, 1,
-0.1609449, -1.097358, -1.740581, 0, 1, 0.5803922, 1,
-0.1576471, 0.08980898, -1.039853, 0, 1, 0.5843138, 1,
-0.1559097, 0.1261674, -3.796165, 0, 1, 0.5921569, 1,
-0.1474903, -0.8905195, -2.922372, 0, 1, 0.5960785, 1,
-0.1423313, 0.594015, -0.3625814, 0, 1, 0.6039216, 1,
-0.1335969, -1.527042, -2.437774, 0, 1, 0.6117647, 1,
-0.1298099, -0.8031591, -5.702355, 0, 1, 0.6156863, 1,
-0.1291232, -2.111908, -3.934231, 0, 1, 0.6235294, 1,
-0.1188951, -0.4723034, -3.146117, 0, 1, 0.627451, 1,
-0.1167685, 1.316089, -0.3493144, 0, 1, 0.6352941, 1,
-0.1162718, -0.07493494, -2.888271, 0, 1, 0.6392157, 1,
-0.1146262, 1.699586, 0.9208176, 0, 1, 0.6470588, 1,
-0.1144866, 0.7715254, 0.688614, 0, 1, 0.6509804, 1,
-0.1141646, -0.2367328, -3.885691, 0, 1, 0.6588235, 1,
-0.1139911, -1.086525, -3.525661, 0, 1, 0.6627451, 1,
-0.1127592, 0.8231001, 0.481838, 0, 1, 0.6705883, 1,
-0.1107255, 0.7327774, 0.1605816, 0, 1, 0.6745098, 1,
-0.1102338, -0.0697685, -3.045651, 0, 1, 0.682353, 1,
-0.1090444, 0.8411817, -0.6482754, 0, 1, 0.6862745, 1,
-0.1066244, 1.319723, 0.08148968, 0, 1, 0.6941177, 1,
-0.1016091, 0.7709206, -0.05171182, 0, 1, 0.7019608, 1,
-0.1012822, 1.003036, 1.607304, 0, 1, 0.7058824, 1,
-0.09860095, 1.209711, -0.9807224, 0, 1, 0.7137255, 1,
-0.09511582, -1.663433, -1.900676, 0, 1, 0.7176471, 1,
-0.09491204, 0.5402018, -1.101377, 0, 1, 0.7254902, 1,
-0.09421661, 0.8222686, -1.383517, 0, 1, 0.7294118, 1,
-0.09006544, 1.294575, -0.9381009, 0, 1, 0.7372549, 1,
-0.08983919, -0.5448604, -4.924599, 0, 1, 0.7411765, 1,
-0.08684288, 1.448485, -0.4500666, 0, 1, 0.7490196, 1,
-0.08453837, -0.3716672, -5.210745, 0, 1, 0.7529412, 1,
-0.08195334, 0.2476778, -1.02461, 0, 1, 0.7607843, 1,
-0.07709017, -0.5386112, -2.392883, 0, 1, 0.7647059, 1,
-0.0770897, 0.7341354, 0.1681577, 0, 1, 0.772549, 1,
-0.07683685, 0.1130435, -0.6439946, 0, 1, 0.7764706, 1,
-0.07665342, -0.2822203, -2.716893, 0, 1, 0.7843137, 1,
-0.07501515, -2.217069, -3.385958, 0, 1, 0.7882353, 1,
-0.07214203, 1.956876, -0.643632, 0, 1, 0.7960784, 1,
-0.0720826, -0.8694587, -2.926723, 0, 1, 0.8039216, 1,
-0.0699644, -1.072086, -1.549923, 0, 1, 0.8078431, 1,
-0.06301923, -0.3160791, -3.679213, 0, 1, 0.8156863, 1,
-0.06210077, 0.2195273, 0.675371, 0, 1, 0.8196079, 1,
-0.06021928, -1.168797, -3.257523, 0, 1, 0.827451, 1,
-0.05787844, -0.623252, -1.895553, 0, 1, 0.8313726, 1,
-0.05704324, -1.29601, -4.306814, 0, 1, 0.8392157, 1,
-0.05068552, 1.375983, -0.08840254, 0, 1, 0.8431373, 1,
-0.04940981, 1.377524, 0.6012554, 0, 1, 0.8509804, 1,
-0.04904532, 1.166621, 1.0092, 0, 1, 0.854902, 1,
-0.04771212, 1.16888, 0.9986084, 0, 1, 0.8627451, 1,
-0.04620543, 0.4155112, 1.280966, 0, 1, 0.8666667, 1,
-0.04358738, 1.308892, -1.019313, 0, 1, 0.8745098, 1,
-0.04159667, -0.7930748, -2.299139, 0, 1, 0.8784314, 1,
-0.04116376, 1.393756, -0.3494759, 0, 1, 0.8862745, 1,
-0.03919416, -1.854825, -2.921362, 0, 1, 0.8901961, 1,
-0.03598594, 1.685424, 0.7032562, 0, 1, 0.8980392, 1,
-0.0339846, 1.706729, 0.5603763, 0, 1, 0.9058824, 1,
-0.03129539, -0.348942, -4.319941, 0, 1, 0.9098039, 1,
-0.02575385, -0.7243063, -2.059406, 0, 1, 0.9176471, 1,
-0.02567302, -3.880877, -1.631103, 0, 1, 0.9215686, 1,
-0.01960538, -0.08983504, -2.771127, 0, 1, 0.9294118, 1,
-0.01912604, -0.6104365, -1.518977, 0, 1, 0.9333333, 1,
-0.0156665, 1.223735, 1.471615, 0, 1, 0.9411765, 1,
-0.01503124, 0.2290682, -2.629613, 0, 1, 0.945098, 1,
-0.01249292, 0.507853, 0.05275329, 0, 1, 0.9529412, 1,
-0.005228595, 0.131703, 0.7678755, 0, 1, 0.9568627, 1,
-0.002469769, 0.3637507, 0.6670175, 0, 1, 0.9647059, 1,
-0.001122506, -0.02060899, -4.117465, 0, 1, 0.9686275, 1,
0.004334621, 0.3346573, -1.367083, 0, 1, 0.9764706, 1,
0.004834739, -0.4529563, 3.875313, 0, 1, 0.9803922, 1,
0.00533768, -0.5030411, 1.149896, 0, 1, 0.9882353, 1,
0.008433416, -0.2574852, 4.245499, 0, 1, 0.9921569, 1,
0.01080115, 0.4918655, -0.05552593, 0, 1, 1, 1,
0.01642248, 0.986674, -0.5785998, 0, 0.9921569, 1, 1,
0.01799581, 1.641478, 1.423517, 0, 0.9882353, 1, 1,
0.01813697, 1.016804, 0.3614835, 0, 0.9803922, 1, 1,
0.01943865, 2.243, -1.449466, 0, 0.9764706, 1, 1,
0.01971177, 0.9264704, 1.293662, 0, 0.9686275, 1, 1,
0.02447687, -0.5985492, 3.559756, 0, 0.9647059, 1, 1,
0.02472016, 0.09711315, 1.759434, 0, 0.9568627, 1, 1,
0.02521813, 1.142597, 0.2244987, 0, 0.9529412, 1, 1,
0.02860753, -0.4639318, 3.090569, 0, 0.945098, 1, 1,
0.02928114, -0.03347507, 3.104938, 0, 0.9411765, 1, 1,
0.03129198, -1.016837, 5.42803, 0, 0.9333333, 1, 1,
0.03148274, -0.1885363, 2.03691, 0, 0.9294118, 1, 1,
0.03415778, -2.182609, 3.914527, 0, 0.9215686, 1, 1,
0.0347616, 0.9980788, 1.249351, 0, 0.9176471, 1, 1,
0.03603544, 1.810781, -1.360592, 0, 0.9098039, 1, 1,
0.0361639, -0.3096615, 2.945044, 0, 0.9058824, 1, 1,
0.04505887, -1.457366, 4.790927, 0, 0.8980392, 1, 1,
0.05289234, 0.6120557, 0.4329663, 0, 0.8901961, 1, 1,
0.05667828, 0.1950194, -0.07021945, 0, 0.8862745, 1, 1,
0.06029841, -0.1295424, 1.403846, 0, 0.8784314, 1, 1,
0.0710315, 0.446035, -0.6032796, 0, 0.8745098, 1, 1,
0.07174153, 1.323919, 0.266211, 0, 0.8666667, 1, 1,
0.07561549, -0.5236794, 3.901259, 0, 0.8627451, 1, 1,
0.07595971, 1.265965, -1.106277, 0, 0.854902, 1, 1,
0.08008293, 1.408351, -0.2764251, 0, 0.8509804, 1, 1,
0.08044657, -0.3886434, 2.977053, 0, 0.8431373, 1, 1,
0.08194977, 0.756251, 0.0708511, 0, 0.8392157, 1, 1,
0.08351614, -0.2125527, 3.103535, 0, 0.8313726, 1, 1,
0.08510505, 2.09669, -0.298991, 0, 0.827451, 1, 1,
0.08575173, -0.185715, 1.738813, 0, 0.8196079, 1, 1,
0.08689497, -0.6335343, 3.272854, 0, 0.8156863, 1, 1,
0.08798542, 0.2546735, -0.6345929, 0, 0.8078431, 1, 1,
0.08829623, 0.2116376, -0.2864114, 0, 0.8039216, 1, 1,
0.0901516, -0.07590647, 4.046352, 0, 0.7960784, 1, 1,
0.09203666, -0.1825324, 4.491841, 0, 0.7882353, 1, 1,
0.09219041, -0.8378403, 2.518566, 0, 0.7843137, 1, 1,
0.09594437, 1.358992, 0.2112411, 0, 0.7764706, 1, 1,
0.09965961, -1.345167, 3.242326, 0, 0.772549, 1, 1,
0.1007592, -0.7740898, 4.36805, 0, 0.7647059, 1, 1,
0.1008717, 0.07900638, 3.610628, 0, 0.7607843, 1, 1,
0.104276, -0.3549533, 1.29213, 0, 0.7529412, 1, 1,
0.1043841, -1.586862, 2.988035, 0, 0.7490196, 1, 1,
0.1059242, 0.5611014, 1.385416, 0, 0.7411765, 1, 1,
0.1061696, -0.3634057, 2.20419, 0, 0.7372549, 1, 1,
0.1069375, 0.7501447, 0.1695425, 0, 0.7294118, 1, 1,
0.1097132, -0.2418033, 2.065528, 0, 0.7254902, 1, 1,
0.1107998, -0.6733475, 4.320294, 0, 0.7176471, 1, 1,
0.113057, -0.579598, 2.298364, 0, 0.7137255, 1, 1,
0.1156698, -0.5002613, 4.027659, 0, 0.7058824, 1, 1,
0.1175164, -0.9494412, 2.883127, 0, 0.6980392, 1, 1,
0.1176147, -0.7835175, 2.352633, 0, 0.6941177, 1, 1,
0.1195538, -0.4039687, 3.369357, 0, 0.6862745, 1, 1,
0.1229705, -1.275558, 2.987086, 0, 0.682353, 1, 1,
0.124594, -0.4252749, 1.117002, 0, 0.6745098, 1, 1,
0.1281109, -0.3655085, 2.100064, 0, 0.6705883, 1, 1,
0.1290765, -0.237848, 1.924258, 0, 0.6627451, 1, 1,
0.1308163, -0.6590586, 4.566149, 0, 0.6588235, 1, 1,
0.1324696, 1.203803, -0.2528906, 0, 0.6509804, 1, 1,
0.1370247, 0.2446049, 0.7334754, 0, 0.6470588, 1, 1,
0.1452621, -0.4143702, 3.078773, 0, 0.6392157, 1, 1,
0.1453944, -0.1203008, 1.910841, 0, 0.6352941, 1, 1,
0.1460468, 0.841157, 1.011913, 0, 0.627451, 1, 1,
0.1496211, -2.062714, 2.511897, 0, 0.6235294, 1, 1,
0.1544311, 0.09473839, 2.1239, 0, 0.6156863, 1, 1,
0.1579729, 1.150772, -2.328454, 0, 0.6117647, 1, 1,
0.16309, -1.035576, -0.1687016, 0, 0.6039216, 1, 1,
0.16699, 0.9576507, 0.6061828, 0, 0.5960785, 1, 1,
0.1671034, 0.6137519, -1.657702, 0, 0.5921569, 1, 1,
0.1694842, 2.530604, 0.3961289, 0, 0.5843138, 1, 1,
0.1724204, 0.9987483, 1.407145, 0, 0.5803922, 1, 1,
0.1729523, 1.544832, 0.02530123, 0, 0.572549, 1, 1,
0.175339, 2.065517, -1.715244, 0, 0.5686275, 1, 1,
0.1767475, -0.2283502, 0.7813598, 0, 0.5607843, 1, 1,
0.1776226, 0.04118117, 2.249331, 0, 0.5568628, 1, 1,
0.1892812, 0.3923607, 1.773076, 0, 0.5490196, 1, 1,
0.1948676, -2.231428, 2.412368, 0, 0.5450981, 1, 1,
0.1981954, -0.4389676, 1.002156, 0, 0.5372549, 1, 1,
0.1984393, 0.7084948, 0.4341653, 0, 0.5333334, 1, 1,
0.2015808, -0.9656854, 3.178537, 0, 0.5254902, 1, 1,
0.2026389, -1.625011, 1.31218, 0, 0.5215687, 1, 1,
0.2026762, -1.069361, 2.445886, 0, 0.5137255, 1, 1,
0.206631, 1.61751, 0.8193576, 0, 0.509804, 1, 1,
0.2097435, 0.02741033, 2.248419, 0, 0.5019608, 1, 1,
0.2106928, -0.4202417, 3.427029, 0, 0.4941176, 1, 1,
0.2110574, 1.559122, -0.04639034, 0, 0.4901961, 1, 1,
0.2151577, 2.699259, 1.189592, 0, 0.4823529, 1, 1,
0.2161437, -0.03852643, 0.8852705, 0, 0.4784314, 1, 1,
0.2174007, 0.604987, -1.201444, 0, 0.4705882, 1, 1,
0.2176313, 0.7168311, -0.912466, 0, 0.4666667, 1, 1,
0.2197442, 0.09058585, 1.719309, 0, 0.4588235, 1, 1,
0.2244228, -0.4490816, 3.909783, 0, 0.454902, 1, 1,
0.2258885, -0.3388152, 3.091231, 0, 0.4470588, 1, 1,
0.2283503, 0.1749068, -0.09067525, 0, 0.4431373, 1, 1,
0.2467662, 0.957468, -0.4448929, 0, 0.4352941, 1, 1,
0.2492111, 0.05430495, 3.56474, 0, 0.4313726, 1, 1,
0.2509058, -0.6458557, 1.989138, 0, 0.4235294, 1, 1,
0.2540524, -0.6518483, 0.8584312, 0, 0.4196078, 1, 1,
0.2552332, 0.7902589, -0.4316693, 0, 0.4117647, 1, 1,
0.2581593, 0.5741946, 0.4966954, 0, 0.4078431, 1, 1,
0.2583637, -0.07826968, 2.406125, 0, 0.4, 1, 1,
0.2587971, -0.1468437, 2.221392, 0, 0.3921569, 1, 1,
0.2594512, -2.822156, 1.631457, 0, 0.3882353, 1, 1,
0.2623169, 0.5310357, 0.4032054, 0, 0.3803922, 1, 1,
0.2662333, 0.1375875, 0.363716, 0, 0.3764706, 1, 1,
0.2668338, 0.2666751, -0.4320181, 0, 0.3686275, 1, 1,
0.2683683, 1.405687, -0.872188, 0, 0.3647059, 1, 1,
0.2702171, -0.6953322, 3.595283, 0, 0.3568628, 1, 1,
0.2706438, 0.2924885, 0.3634571, 0, 0.3529412, 1, 1,
0.2718099, -0.3706651, 4.495378, 0, 0.345098, 1, 1,
0.2722321, -1.061951, 3.389733, 0, 0.3411765, 1, 1,
0.2764961, 0.3182386, -0.01484788, 0, 0.3333333, 1, 1,
0.2765216, -1.044005, 3.181068, 0, 0.3294118, 1, 1,
0.281831, 2.129328, -0.2814529, 0, 0.3215686, 1, 1,
0.2836677, -0.75972, 3.098747, 0, 0.3176471, 1, 1,
0.2880266, -0.9097168, 2.226754, 0, 0.3098039, 1, 1,
0.2896557, 0.7353988, -0.8384982, 0, 0.3058824, 1, 1,
0.289692, -1.115082, 3.544532, 0, 0.2980392, 1, 1,
0.291624, 1.33625, -0.7950295, 0, 0.2901961, 1, 1,
0.2917176, -0.5361165, 2.352584, 0, 0.2862745, 1, 1,
0.2917887, -1.077902, 2.854967, 0, 0.2784314, 1, 1,
0.2926111, 0.02894361, 0.6318818, 0, 0.2745098, 1, 1,
0.2940624, -0.6067981, 2.242063, 0, 0.2666667, 1, 1,
0.2961735, -1.007323, 3.128906, 0, 0.2627451, 1, 1,
0.2963976, -0.2195264, 1.377123, 0, 0.254902, 1, 1,
0.2966949, 0.6129541, 1.556131, 0, 0.2509804, 1, 1,
0.3002024, 0.001511889, 1.612431, 0, 0.2431373, 1, 1,
0.3003153, -1.027556, 1.931746, 0, 0.2392157, 1, 1,
0.302166, -0.4990726, 2.57806, 0, 0.2313726, 1, 1,
0.3072451, -0.8860402, 4.10436, 0, 0.227451, 1, 1,
0.3074639, 1.18716, 0.7666092, 0, 0.2196078, 1, 1,
0.3098455, -0.1993191, 3.065127, 0, 0.2156863, 1, 1,
0.3110359, -0.2982984, 2.031084, 0, 0.2078431, 1, 1,
0.3125036, 1.120922, -0.03973098, 0, 0.2039216, 1, 1,
0.3125895, -0.1317615, 3.25672, 0, 0.1960784, 1, 1,
0.313737, -0.739844, 2.183303, 0, 0.1882353, 1, 1,
0.3154427, 0.6350686, -0.193948, 0, 0.1843137, 1, 1,
0.3177928, -1.15337, 2.25813, 0, 0.1764706, 1, 1,
0.32317, -0.1675407, 1.828912, 0, 0.172549, 1, 1,
0.328535, -0.8071602, 1.563825, 0, 0.1647059, 1, 1,
0.3299583, -0.264882, 2.76121, 0, 0.1607843, 1, 1,
0.3307378, 0.3509607, 0.7186275, 0, 0.1529412, 1, 1,
0.3316634, -0.6783198, 3.438927, 0, 0.1490196, 1, 1,
0.3351445, 0.489163, 1.200387, 0, 0.1411765, 1, 1,
0.340723, 0.6798526, -1.09521, 0, 0.1372549, 1, 1,
0.3433006, 0.9862102, -0.2252724, 0, 0.1294118, 1, 1,
0.348216, -0.471797, 2.715156, 0, 0.1254902, 1, 1,
0.356109, -2.171261, 5.661524, 0, 0.1176471, 1, 1,
0.3573458, -1.564969, 3.018008, 0, 0.1137255, 1, 1,
0.3590372, -1.336951, 3.942874, 0, 0.1058824, 1, 1,
0.3594466, 0.2552001, -0.8073755, 0, 0.09803922, 1, 1,
0.3654409, -1.072882, 3.710387, 0, 0.09411765, 1, 1,
0.3662076, -1.20697, 3.31851, 0, 0.08627451, 1, 1,
0.3681153, 1.806322, -0.900499, 0, 0.08235294, 1, 1,
0.3692585, 0.9429274, 1.261334, 0, 0.07450981, 1, 1,
0.3734507, 0.2395294, 0.5919987, 0, 0.07058824, 1, 1,
0.3766507, -0.4953291, 1.852735, 0, 0.0627451, 1, 1,
0.3791415, -0.2546776, 1.529748, 0, 0.05882353, 1, 1,
0.3811797, -1.433118, 2.896333, 0, 0.05098039, 1, 1,
0.381626, 1.669038, 0.4477926, 0, 0.04705882, 1, 1,
0.3836744, 0.7834246, 1.024773, 0, 0.03921569, 1, 1,
0.3853099, -1.532331, 2.688516, 0, 0.03529412, 1, 1,
0.3853878, -1.944986, 3.123237, 0, 0.02745098, 1, 1,
0.3955548, -0.7188812, 0.9948448, 0, 0.02352941, 1, 1,
0.3979484, -1.714422, 2.202561, 0, 0.01568628, 1, 1,
0.3985749, 0.6661158, -0.1970868, 0, 0.01176471, 1, 1,
0.4029296, 0.02864037, -0.2191098, 0, 0.003921569, 1, 1,
0.4059277, 1.974799, 0.2296651, 0.003921569, 0, 1, 1,
0.4090953, -0.1535846, 0.4815354, 0.007843138, 0, 1, 1,
0.4104965, 0.4846293, -0.5280997, 0.01568628, 0, 1, 1,
0.4132625, -1.482521, 1.742017, 0.01960784, 0, 1, 1,
0.4189413, 0.6397147, 1.39777, 0.02745098, 0, 1, 1,
0.4249738, -0.9656008, 2.135183, 0.03137255, 0, 1, 1,
0.4250428, -0.8317662, 3.487951, 0.03921569, 0, 1, 1,
0.426662, -0.5993533, 3.139141, 0.04313726, 0, 1, 1,
0.4271954, 1.197554, 0.4167199, 0.05098039, 0, 1, 1,
0.4297103, -0.6846927, 1.606964, 0.05490196, 0, 1, 1,
0.4301506, 1.241771, 0.500379, 0.0627451, 0, 1, 1,
0.4367667, 0.6941364, -0.2844522, 0.06666667, 0, 1, 1,
0.4405919, 0.4183921, 0.9769638, 0.07450981, 0, 1, 1,
0.4421759, -1.749468, 2.721434, 0.07843138, 0, 1, 1,
0.445117, 1.763154, 0.4864949, 0.08627451, 0, 1, 1,
0.447067, 0.3100773, 1.387736, 0.09019608, 0, 1, 1,
0.4487899, 1.315429, -0.280304, 0.09803922, 0, 1, 1,
0.4511754, -2.612222, 2.849419, 0.1058824, 0, 1, 1,
0.4518093, 1.352835, 0.7271535, 0.1098039, 0, 1, 1,
0.4545304, 1.632113, 0.6966746, 0.1176471, 0, 1, 1,
0.4567606, -0.9598719, 1.650896, 0.1215686, 0, 1, 1,
0.4594474, -0.1572188, 2.18922, 0.1294118, 0, 1, 1,
0.460191, 0.2408786, 0.8964202, 0.1333333, 0, 1, 1,
0.4628819, 0.897565, -1.539431, 0.1411765, 0, 1, 1,
0.4646646, -0.1907474, 2.522369, 0.145098, 0, 1, 1,
0.4649207, -0.4556993, 2.818107, 0.1529412, 0, 1, 1,
0.4663354, 1.464406, -0.7274341, 0.1568628, 0, 1, 1,
0.4689049, 0.7622755, 1.171459, 0.1647059, 0, 1, 1,
0.4719538, -0.4367465, 0.6879478, 0.1686275, 0, 1, 1,
0.4812526, 0.6676002, -0.3225318, 0.1764706, 0, 1, 1,
0.4862839, -0.8001683, 3.43686, 0.1803922, 0, 1, 1,
0.4867081, -0.4375055, 1.363724, 0.1882353, 0, 1, 1,
0.4896763, 0.7245087, 1.170198, 0.1921569, 0, 1, 1,
0.4903668, 0.7001541, 0.1043454, 0.2, 0, 1, 1,
0.4965437, -1.928321, 2.786472, 0.2078431, 0, 1, 1,
0.4979345, 1.431756, 0.8334264, 0.2117647, 0, 1, 1,
0.4981408, 0.5386175, 0.1043326, 0.2196078, 0, 1, 1,
0.5037183, 1.564985, 0.06811111, 0.2235294, 0, 1, 1,
0.5046778, 0.5941929, 1.457975, 0.2313726, 0, 1, 1,
0.5090923, 0.6511087, 0.8124624, 0.2352941, 0, 1, 1,
0.5144338, -0.1995256, 0.3350704, 0.2431373, 0, 1, 1,
0.5156813, -1.423302, 2.588922, 0.2470588, 0, 1, 1,
0.5175037, 0.445294, -0.3814873, 0.254902, 0, 1, 1,
0.5191211, -0.2240322, 2.989352, 0.2588235, 0, 1, 1,
0.5193455, 1.528448, 0.7737979, 0.2666667, 0, 1, 1,
0.5205017, -1.319621, 3.011651, 0.2705882, 0, 1, 1,
0.5302622, 0.4177051, 1.849543, 0.2784314, 0, 1, 1,
0.5358185, 0.808367, -0.5509844, 0.282353, 0, 1, 1,
0.5430814, -0.9830328, 3.669873, 0.2901961, 0, 1, 1,
0.5475421, 0.4664536, 1.862646, 0.2941177, 0, 1, 1,
0.5482935, -0.8175761, 2.765992, 0.3019608, 0, 1, 1,
0.5490448, -0.2237336, 3.325553, 0.3098039, 0, 1, 1,
0.5509102, -0.1526971, 2.922323, 0.3137255, 0, 1, 1,
0.5510464, -1.012798, 1.705712, 0.3215686, 0, 1, 1,
0.5512034, -1.327743, 1.351763, 0.3254902, 0, 1, 1,
0.5528874, 1.54921, 0.1737151, 0.3333333, 0, 1, 1,
0.5547764, 2.101012, 0.729907, 0.3372549, 0, 1, 1,
0.5556091, -0.3429363, 2.950313, 0.345098, 0, 1, 1,
0.5631461, 0.001754136, 1.726436, 0.3490196, 0, 1, 1,
0.5634627, -0.9129385, 3.733723, 0.3568628, 0, 1, 1,
0.5642669, 0.2804643, 1.747975, 0.3607843, 0, 1, 1,
0.567525, -1.962104, 2.216605, 0.3686275, 0, 1, 1,
0.5765445, -0.1414815, 2.894719, 0.372549, 0, 1, 1,
0.5782207, -0.188137, 2.14711, 0.3803922, 0, 1, 1,
0.5800046, 0.2047585, 2.592784, 0.3843137, 0, 1, 1,
0.5801147, -0.4594105, 3.285452, 0.3921569, 0, 1, 1,
0.5835333, 0.1619098, 0.5140168, 0.3960784, 0, 1, 1,
0.5864313, -0.6028649, 3.486853, 0.4039216, 0, 1, 1,
0.5893313, 0.445214, 0.9109523, 0.4117647, 0, 1, 1,
0.5920846, 0.2786217, 1.158694, 0.4156863, 0, 1, 1,
0.5921852, -1.307491, 2.476406, 0.4235294, 0, 1, 1,
0.598411, 0.5531774, 0.805348, 0.427451, 0, 1, 1,
0.6022431, -0.2661171, 1.503631, 0.4352941, 0, 1, 1,
0.60456, 0.1021814, 1.765758, 0.4392157, 0, 1, 1,
0.6133932, -0.2358264, 1.713806, 0.4470588, 0, 1, 1,
0.6161807, 0.3671741, 1.434767, 0.4509804, 0, 1, 1,
0.6244144, 0.5941445, 0.223842, 0.4588235, 0, 1, 1,
0.6249052, 0.6431077, 2.343866, 0.4627451, 0, 1, 1,
0.6337355, -0.7146434, 3.940336, 0.4705882, 0, 1, 1,
0.6384196, -2.461202, 3.216311, 0.4745098, 0, 1, 1,
0.6388942, -1.000201, 2.485236, 0.4823529, 0, 1, 1,
0.6409476, -0.4716064, 2.375937, 0.4862745, 0, 1, 1,
0.6416921, 0.6232266, 2.132646, 0.4941176, 0, 1, 1,
0.6434393, 0.7979016, 1.464905, 0.5019608, 0, 1, 1,
0.6517434, -0.147496, 1.764633, 0.5058824, 0, 1, 1,
0.6527725, 1.876626, -0.2835658, 0.5137255, 0, 1, 1,
0.657189, -1.501707, 4.530067, 0.5176471, 0, 1, 1,
0.6592584, 0.9743846, 1.501939, 0.5254902, 0, 1, 1,
0.6620424, 0.9467523, 1.458434, 0.5294118, 0, 1, 1,
0.6650959, 0.877773, 1.395128, 0.5372549, 0, 1, 1,
0.67069, 0.2141616, 1.804658, 0.5411765, 0, 1, 1,
0.6729268, -0.04623579, 2.151639, 0.5490196, 0, 1, 1,
0.6749182, 1.819949, 0.8842971, 0.5529412, 0, 1, 1,
0.6755531, 0.6199474, 0.7078677, 0.5607843, 0, 1, 1,
0.6778455, 0.191899, 1.377224, 0.5647059, 0, 1, 1,
0.6790082, 0.03963981, 1.332928, 0.572549, 0, 1, 1,
0.6799009, -0.799456, 1.509362, 0.5764706, 0, 1, 1,
0.6804683, -0.8969907, 2.126894, 0.5843138, 0, 1, 1,
0.6830299, -0.1552003, 2.412397, 0.5882353, 0, 1, 1,
0.6913199, -0.6166793, 3.799568, 0.5960785, 0, 1, 1,
0.6938143, 0.09664414, 2.348735, 0.6039216, 0, 1, 1,
0.6949412, -0.1067947, -0.03453429, 0.6078432, 0, 1, 1,
0.6950127, 1.572968, -0.3667139, 0.6156863, 0, 1, 1,
0.6968629, -0.9227177, 1.620516, 0.6196079, 0, 1, 1,
0.7039244, -0.3662569, 2.348309, 0.627451, 0, 1, 1,
0.7066436, 0.2420855, 2.822464, 0.6313726, 0, 1, 1,
0.71343, -1.00762, 3.335029, 0.6392157, 0, 1, 1,
0.7196957, -0.494783, 0.9115918, 0.6431373, 0, 1, 1,
0.721451, -0.3132287, 2.533164, 0.6509804, 0, 1, 1,
0.7235262, 0.8730668, 1.98926, 0.654902, 0, 1, 1,
0.729069, -1.163351, 2.635014, 0.6627451, 0, 1, 1,
0.7303544, 0.838278, 1.333801, 0.6666667, 0, 1, 1,
0.7321938, -1.231787, 3.126677, 0.6745098, 0, 1, 1,
0.7335054, 0.8229164, 1.634914, 0.6784314, 0, 1, 1,
0.734256, -0.5443253, 3.303896, 0.6862745, 0, 1, 1,
0.7346534, 0.03401444, 0.6744025, 0.6901961, 0, 1, 1,
0.7388845, 1.482496, 1.020347, 0.6980392, 0, 1, 1,
0.7414383, -1.071596, 2.496478, 0.7058824, 0, 1, 1,
0.7436393, 0.470037, 0.9835759, 0.7098039, 0, 1, 1,
0.7458212, -0.417913, 3.214015, 0.7176471, 0, 1, 1,
0.7512701, 0.4777629, 1.609702, 0.7215686, 0, 1, 1,
0.7592747, -0.456166, 2.875848, 0.7294118, 0, 1, 1,
0.7609935, 1.392606, 0.1844755, 0.7333333, 0, 1, 1,
0.7786494, -0.3270226, 2.492335, 0.7411765, 0, 1, 1,
0.7791083, 1.09217, 0.5411329, 0.7450981, 0, 1, 1,
0.7817793, -0.2890746, 1.414267, 0.7529412, 0, 1, 1,
0.7834434, 1.330566, -0.4151149, 0.7568628, 0, 1, 1,
0.7860124, 1.507945, 0.1864229, 0.7647059, 0, 1, 1,
0.7870544, 0.1290479, 1.530718, 0.7686275, 0, 1, 1,
0.7891389, 0.4029653, 1.344984, 0.7764706, 0, 1, 1,
0.791053, 1.605766, -0.3132081, 0.7803922, 0, 1, 1,
0.7920074, -0.2709904, 2.972239, 0.7882353, 0, 1, 1,
0.7922887, 0.06488205, 1.586369, 0.7921569, 0, 1, 1,
0.7923729, -1.562991, 2.599761, 0.8, 0, 1, 1,
0.7985387, 0.1983681, 0.5428113, 0.8078431, 0, 1, 1,
0.8007907, 0.689848, 1.651879, 0.8117647, 0, 1, 1,
0.8052503, -0.5859296, 1.534279, 0.8196079, 0, 1, 1,
0.8068569, -0.1094849, 2.783696, 0.8235294, 0, 1, 1,
0.8072392, 1.354774, -0.3946662, 0.8313726, 0, 1, 1,
0.8116237, -0.007572745, 2.296177, 0.8352941, 0, 1, 1,
0.8116803, 1.057033, -0.2470363, 0.8431373, 0, 1, 1,
0.8190444, -0.5809394, 3.546242, 0.8470588, 0, 1, 1,
0.8220644, 0.9643947, -0.4155744, 0.854902, 0, 1, 1,
0.831546, 0.3702321, 1.899093, 0.8588235, 0, 1, 1,
0.8338322, 0.3676277, 2.284285, 0.8666667, 0, 1, 1,
0.8389653, -0.2067466, 3.408901, 0.8705882, 0, 1, 1,
0.8393134, 0.5152128, -0.06241986, 0.8784314, 0, 1, 1,
0.8414441, -0.4509005, 1.471355, 0.8823529, 0, 1, 1,
0.8444323, 0.06897853, 1.935738, 0.8901961, 0, 1, 1,
0.8457503, -0.4877704, 3.202098, 0.8941177, 0, 1, 1,
0.8495715, -0.5794801, 1.495492, 0.9019608, 0, 1, 1,
0.8509407, 0.06050284, 2.920888, 0.9098039, 0, 1, 1,
0.857812, -0.883642, 2.363283, 0.9137255, 0, 1, 1,
0.8597403, 0.3603358, -0.3704586, 0.9215686, 0, 1, 1,
0.8627526, -1.695194, 3.393746, 0.9254902, 0, 1, 1,
0.8654242, 0.819029, 0.7522578, 0.9333333, 0, 1, 1,
0.8671464, -0.08636835, 1.538651, 0.9372549, 0, 1, 1,
0.8672117, 0.08511852, 1.827592, 0.945098, 0, 1, 1,
0.8712934, 1.879774, -1.096323, 0.9490196, 0, 1, 1,
0.8740569, 0.5566562, 2.37772, 0.9568627, 0, 1, 1,
0.8788202, 1.361181, 0.9278263, 0.9607843, 0, 1, 1,
0.8868046, -0.2291766, 0.5236241, 0.9686275, 0, 1, 1,
0.8933542, 0.3386456, 0.5411533, 0.972549, 0, 1, 1,
0.8951735, 0.2800944, 2.887067, 0.9803922, 0, 1, 1,
0.9012572, -0.6971874, 1.991268, 0.9843137, 0, 1, 1,
0.9094112, -0.5940511, 2.193924, 0.9921569, 0, 1, 1,
0.9157039, 0.1476227, 0.6837857, 0.9960784, 0, 1, 1,
0.9236651, 0.6822757, 1.735975, 1, 0, 0.9960784, 1,
0.9264065, 1.380161, 1.80854, 1, 0, 0.9882353, 1,
0.9295487, 0.1982765, 1.655346, 1, 0, 0.9843137, 1,
0.9357135, -0.7876359, 1.914355, 1, 0, 0.9764706, 1,
0.9381284, 0.07358117, 0.6630613, 1, 0, 0.972549, 1,
0.9472036, -0.7615998, 2.862507, 1, 0, 0.9647059, 1,
0.9520206, -0.5224571, -0.1085764, 1, 0, 0.9607843, 1,
0.9545091, -1.096995, 1.224495, 1, 0, 0.9529412, 1,
0.9579551, 0.1435342, 1.894783, 1, 0, 0.9490196, 1,
0.958465, 0.9552593, 2.751341, 1, 0, 0.9411765, 1,
0.9638513, -1.511783, 3.109596, 1, 0, 0.9372549, 1,
0.9645038, 0.1272891, 1.410653, 1, 0, 0.9294118, 1,
0.9647252, 0.2810991, 1.31381, 1, 0, 0.9254902, 1,
0.9657539, -0.3055306, 2.087106, 1, 0, 0.9176471, 1,
0.9663933, -0.03246115, 1.022225, 1, 0, 0.9137255, 1,
0.9679509, 0.4698384, 1.061436, 1, 0, 0.9058824, 1,
0.9754675, -0.7958183, 2.045545, 1, 0, 0.9019608, 1,
0.982145, 0.354084, 2.535395, 1, 0, 0.8941177, 1,
0.9845549, -0.1270162, 0.6154048, 1, 0, 0.8862745, 1,
0.9921774, -0.5622454, 1.488408, 1, 0, 0.8823529, 1,
0.9929497, 0.07649727, 0.6416337, 1, 0, 0.8745098, 1,
0.9992547, 0.01180264, 1.253243, 1, 0, 0.8705882, 1,
1.000501, 0.1296487, 2.602127, 1, 0, 0.8627451, 1,
1.002412, 0.9480212, -0.2628247, 1, 0, 0.8588235, 1,
1.005244, -0.01052338, 1.336053, 1, 0, 0.8509804, 1,
1.0114, 0.4270654, 2.135899, 1, 0, 0.8470588, 1,
1.012983, 0.2422535, 0.1964993, 1, 0, 0.8392157, 1,
1.031713, -1.555756, 2.413934, 1, 0, 0.8352941, 1,
1.038387, 2.280943, 1.340219, 1, 0, 0.827451, 1,
1.040094, 0.6001727, 0.7685245, 1, 0, 0.8235294, 1,
1.041261, -0.4846703, 0.2400642, 1, 0, 0.8156863, 1,
1.049551, -0.7394291, 3.644988, 1, 0, 0.8117647, 1,
1.053077, -0.6724822, 1.253386, 1, 0, 0.8039216, 1,
1.063793, 1.777823, 0.5472676, 1, 0, 0.7960784, 1,
1.068406, 0.3791554, 1.147167, 1, 0, 0.7921569, 1,
1.068562, -0.7653388, 2.548807, 1, 0, 0.7843137, 1,
1.073388, -0.3693169, 1.894057, 1, 0, 0.7803922, 1,
1.084861, 0.578595, 0.02648339, 1, 0, 0.772549, 1,
1.09199, -1.281824, 1.15672, 1, 0, 0.7686275, 1,
1.098876, -0.1937379, 0.06540064, 1, 0, 0.7607843, 1,
1.099836, 0.5675306, 0.9595171, 1, 0, 0.7568628, 1,
1.100547, -0.6698497, 2.061079, 1, 0, 0.7490196, 1,
1.11112, 0.1157233, 0.1046284, 1, 0, 0.7450981, 1,
1.116421, -1.270868, 2.417104, 1, 0, 0.7372549, 1,
1.121946, -0.03114031, 1.994023, 1, 0, 0.7333333, 1,
1.124428, -1.560525, 2.156022, 1, 0, 0.7254902, 1,
1.135406, 0.5075903, 0.1745804, 1, 0, 0.7215686, 1,
1.139655, -1.161868, 2.492343, 1, 0, 0.7137255, 1,
1.142611, -0.9040945, 1.704639, 1, 0, 0.7098039, 1,
1.143712, -0.8375787, 1.424258, 1, 0, 0.7019608, 1,
1.146746, -1.826398, 2.137412, 1, 0, 0.6941177, 1,
1.14763, 0.5533291, 2.738457, 1, 0, 0.6901961, 1,
1.158005, -0.0601016, 0.4052078, 1, 0, 0.682353, 1,
1.15891, 0.1380055, 0.8019153, 1, 0, 0.6784314, 1,
1.159022, 0.8625758, 0.8852261, 1, 0, 0.6705883, 1,
1.163489, -0.9461518, 2.463821, 1, 0, 0.6666667, 1,
1.169399, -0.6656173, 2.25924, 1, 0, 0.6588235, 1,
1.172369, 1.79196, 1.048617, 1, 0, 0.654902, 1,
1.174472, -0.776427, 0.9967873, 1, 0, 0.6470588, 1,
1.176393, 0.9754971, 0.5915073, 1, 0, 0.6431373, 1,
1.1824, 0.1412163, -0.7164939, 1, 0, 0.6352941, 1,
1.184571, 2.002999, 0.2060481, 1, 0, 0.6313726, 1,
1.186627, -2.49699, 2.44996, 1, 0, 0.6235294, 1,
1.196453, 0.7368034, 0.6848326, 1, 0, 0.6196079, 1,
1.198708, 0.3705408, 1.336381, 1, 0, 0.6117647, 1,
1.207815, -2.179762, 2.834558, 1, 0, 0.6078432, 1,
1.21005, -1.986795, 3.510174, 1, 0, 0.6, 1,
1.222296, 1.119216, 1.519501, 1, 0, 0.5921569, 1,
1.223568, 0.8949861, 1.54967, 1, 0, 0.5882353, 1,
1.223954, -1.364594, 4.977376, 1, 0, 0.5803922, 1,
1.228171, 1.567838, 0.8598077, 1, 0, 0.5764706, 1,
1.231996, -0.2331423, 0.2949805, 1, 0, 0.5686275, 1,
1.23228, 0.3232733, 2.682605, 1, 0, 0.5647059, 1,
1.24272, -0.04876406, 1.70296, 1, 0, 0.5568628, 1,
1.247475, 0.5260574, 2.292093, 1, 0, 0.5529412, 1,
1.249279, -1.026381, 2.135566, 1, 0, 0.5450981, 1,
1.255967, 0.1700346, 2.166317, 1, 0, 0.5411765, 1,
1.25647, -0.40186, 0.6790171, 1, 0, 0.5333334, 1,
1.259716, 0.8231639, 1.332141, 1, 0, 0.5294118, 1,
1.263996, 2.09749, -1.106043, 1, 0, 0.5215687, 1,
1.274466, -0.04903242, 1.487884, 1, 0, 0.5176471, 1,
1.302583, -1.416661, 1.857397, 1, 0, 0.509804, 1,
1.308669, -0.7179338, 1.665551, 1, 0, 0.5058824, 1,
1.315838, -0.3598314, -0.2610307, 1, 0, 0.4980392, 1,
1.327802, 2.248122, 2.357129, 1, 0, 0.4901961, 1,
1.335302, -2.055165, 0.8944646, 1, 0, 0.4862745, 1,
1.33598, 0.5975055, -0.09027749, 1, 0, 0.4784314, 1,
1.353526, 1.38286, 0.02779196, 1, 0, 0.4745098, 1,
1.355125, -1.064777, 2.994452, 1, 0, 0.4666667, 1,
1.356142, -0.07812778, 0.5914426, 1, 0, 0.4627451, 1,
1.363412, -1.232, 2.182389, 1, 0, 0.454902, 1,
1.367773, 0.1216493, 0.8198985, 1, 0, 0.4509804, 1,
1.371766, 0.316162, 1.760979, 1, 0, 0.4431373, 1,
1.38533, 1.375276, 0.4138654, 1, 0, 0.4392157, 1,
1.38787, -0.4979273, 2.116768, 1, 0, 0.4313726, 1,
1.388509, 0.4301524, 1.626549, 1, 0, 0.427451, 1,
1.390514, 0.6225741, 3.059654, 1, 0, 0.4196078, 1,
1.39207, -0.4318818, 2.013877, 1, 0, 0.4156863, 1,
1.392646, 0.5184401, 1.464933, 1, 0, 0.4078431, 1,
1.396602, -0.5773891, 2.074149, 1, 0, 0.4039216, 1,
1.408491, -1.136861, 3.056153, 1, 0, 0.3960784, 1,
1.411828, 1.093276, 1.360532, 1, 0, 0.3882353, 1,
1.419605, -1.972322, 3.168647, 1, 0, 0.3843137, 1,
1.449455, -1.319979, 2.987889, 1, 0, 0.3764706, 1,
1.465841, -0.8120122, 3.303494, 1, 0, 0.372549, 1,
1.476539, 0.160514, 1.114465, 1, 0, 0.3647059, 1,
1.484211, 1.892878, 0.6453139, 1, 0, 0.3607843, 1,
1.485865, -0.1095413, -0.3488393, 1, 0, 0.3529412, 1,
1.486572, 1.558861, 0.5102746, 1, 0, 0.3490196, 1,
1.488232, -0.354431, 1.015142, 1, 0, 0.3411765, 1,
1.501753, 0.4573065, 0.5068005, 1, 0, 0.3372549, 1,
1.508693, -1.035184, 0.5919523, 1, 0, 0.3294118, 1,
1.523404, -0.2056873, 1.241272, 1, 0, 0.3254902, 1,
1.537417, 0.7177534, 1.512273, 1, 0, 0.3176471, 1,
1.53823, 1.564354, 2.709019, 1, 0, 0.3137255, 1,
1.553807, 0.1248097, 1.578531, 1, 0, 0.3058824, 1,
1.603097, 1.292137, 0.5929162, 1, 0, 0.2980392, 1,
1.609059, -0.6977487, 2.788939, 1, 0, 0.2941177, 1,
1.618335, -0.3778855, 1.129278, 1, 0, 0.2862745, 1,
1.623004, -2.061774, 3.744476, 1, 0, 0.282353, 1,
1.64948, 2.112214, 0.3466309, 1, 0, 0.2745098, 1,
1.652914, 0.5691864, 1.257619, 1, 0, 0.2705882, 1,
1.708458, 0.1859062, 0.005351697, 1, 0, 0.2627451, 1,
1.719134, -0.1843816, 1.453604, 1, 0, 0.2588235, 1,
1.72202, 2.101303, -0.6496583, 1, 0, 0.2509804, 1,
1.726045, -0.1607379, 2.108317, 1, 0, 0.2470588, 1,
1.730523, 0.8087342, -0.2196869, 1, 0, 0.2392157, 1,
1.733003, 0.2951329, 2.330962, 1, 0, 0.2352941, 1,
1.758871, 0.5167381, 3.116843, 1, 0, 0.227451, 1,
1.76306, 0.4035847, 2.545366, 1, 0, 0.2235294, 1,
1.771266, 0.8066083, -0.01832332, 1, 0, 0.2156863, 1,
1.789666, 1.219097, -1.004547, 1, 0, 0.2117647, 1,
1.794159, -0.05261545, 2.252763, 1, 0, 0.2039216, 1,
1.797398, 0.2732588, 1.976551, 1, 0, 0.1960784, 1,
1.802555, -1.44256, 3.181765, 1, 0, 0.1921569, 1,
1.81897, 1.395104, -0.885377, 1, 0, 0.1843137, 1,
1.839251, 0.4908867, 1.964751, 1, 0, 0.1803922, 1,
1.859836, -0.9315575, 1.140148, 1, 0, 0.172549, 1,
1.863286, -0.8798639, 1.634385, 1, 0, 0.1686275, 1,
1.86594, 1.403629, 0.5890012, 1, 0, 0.1607843, 1,
1.877325, 0.567585, 2.628924, 1, 0, 0.1568628, 1,
1.896711, -0.4210944, 1.32303, 1, 0, 0.1490196, 1,
1.913767, 1.861133, 1.047295, 1, 0, 0.145098, 1,
1.91775, 1.158183, 1.642249, 1, 0, 0.1372549, 1,
1.927593, -0.5250542, 1.050388, 1, 0, 0.1333333, 1,
1.950139, 0.3041343, 1.683833, 1, 0, 0.1254902, 1,
1.975374, 1.418914, 2.55907, 1, 0, 0.1215686, 1,
1.985573, 2.973299, 1.810254, 1, 0, 0.1137255, 1,
1.994344, 0.9576873, 0.8594837, 1, 0, 0.1098039, 1,
2.07103, -0.9417995, 1.394358, 1, 0, 0.1019608, 1,
2.088538, -0.03717902, -0.1475843, 1, 0, 0.09411765, 1,
2.100988, 0.8963218, 1.659974, 1, 0, 0.09019608, 1,
2.126172, -1.166659, 2.061902, 1, 0, 0.08235294, 1,
2.138552, 1.343616, 0.1240233, 1, 0, 0.07843138, 1,
2.148198, -1.38441, 3.039388, 1, 0, 0.07058824, 1,
2.153294, -0.1588764, 3.273629, 1, 0, 0.06666667, 1,
2.15519, 1.528873, 1.596298, 1, 0, 0.05882353, 1,
2.257278, -1.108621, 1.884971, 1, 0, 0.05490196, 1,
2.301386, -0.6687189, 2.147485, 1, 0, 0.04705882, 1,
2.316397, 0.6174343, 5.523784, 1, 0, 0.04313726, 1,
2.458442, 1.442893, 1.889847, 1, 0, 0.03529412, 1,
2.515308, 1.039072, 1.31573, 1, 0, 0.03137255, 1,
2.580062, -0.3077292, 1.436748, 1, 0, 0.02352941, 1,
2.752181, -0.04543977, 0.520725, 1, 0, 0.01960784, 1,
2.912817, 0.3423492, 2.412174, 1, 0, 0.01176471, 1,
2.954253, 1.057705, 1.595021, 1, 0, 0.007843138, 1
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
0.04308438, -5.04266, -7.628532, 0, -0.5, 0.5, 0.5,
0.04308438, -5.04266, -7.628532, 1, -0.5, 0.5, 0.5,
0.04308438, -5.04266, -7.628532, 1, 1.5, 0.5, 0.5,
0.04308438, -5.04266, -7.628532, 0, 1.5, 0.5, 0.5
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
-3.85497, -0.4537892, -7.628532, 0, -0.5, 0.5, 0.5,
-3.85497, -0.4537892, -7.628532, 1, -0.5, 0.5, 0.5,
-3.85497, -0.4537892, -7.628532, 1, 1.5, 0.5, 0.5,
-3.85497, -0.4537892, -7.628532, 0, 1.5, 0.5, 0.5
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
-3.85497, -5.04266, -0.02041554, 0, -0.5, 0.5, 0.5,
-3.85497, -5.04266, -0.02041554, 1, -0.5, 0.5, 0.5,
-3.85497, -5.04266, -0.02041554, 1, 1.5, 0.5, 0.5,
-3.85497, -5.04266, -0.02041554, 0, 1.5, 0.5, 0.5
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
-2, -3.98369, -5.872813,
2, -3.98369, -5.872813,
-2, -3.98369, -5.872813,
-2, -4.160185, -6.165433,
-1, -3.98369, -5.872813,
-1, -4.160185, -6.165433,
0, -3.98369, -5.872813,
0, -4.160185, -6.165433,
1, -3.98369, -5.872813,
1, -4.160185, -6.165433,
2, -3.98369, -5.872813,
2, -4.160185, -6.165433
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
-2, -4.513175, -6.750673, 0, -0.5, 0.5, 0.5,
-2, -4.513175, -6.750673, 1, -0.5, 0.5, 0.5,
-2, -4.513175, -6.750673, 1, 1.5, 0.5, 0.5,
-2, -4.513175, -6.750673, 0, 1.5, 0.5, 0.5,
-1, -4.513175, -6.750673, 0, -0.5, 0.5, 0.5,
-1, -4.513175, -6.750673, 1, -0.5, 0.5, 0.5,
-1, -4.513175, -6.750673, 1, 1.5, 0.5, 0.5,
-1, -4.513175, -6.750673, 0, 1.5, 0.5, 0.5,
0, -4.513175, -6.750673, 0, -0.5, 0.5, 0.5,
0, -4.513175, -6.750673, 1, -0.5, 0.5, 0.5,
0, -4.513175, -6.750673, 1, 1.5, 0.5, 0.5,
0, -4.513175, -6.750673, 0, 1.5, 0.5, 0.5,
1, -4.513175, -6.750673, 0, -0.5, 0.5, 0.5,
1, -4.513175, -6.750673, 1, -0.5, 0.5, 0.5,
1, -4.513175, -6.750673, 1, 1.5, 0.5, 0.5,
1, -4.513175, -6.750673, 0, 1.5, 0.5, 0.5,
2, -4.513175, -6.750673, 0, -0.5, 0.5, 0.5,
2, -4.513175, -6.750673, 1, -0.5, 0.5, 0.5,
2, -4.513175, -6.750673, 1, 1.5, 0.5, 0.5,
2, -4.513175, -6.750673, 0, 1.5, 0.5, 0.5
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
-2.955419, -3, -5.872813,
-2.955419, 2, -5.872813,
-2.955419, -3, -5.872813,
-3.105344, -3, -6.165433,
-2.955419, -2, -5.872813,
-3.105344, -2, -6.165433,
-2.955419, -1, -5.872813,
-3.105344, -1, -6.165433,
-2.955419, 0, -5.872813,
-3.105344, 0, -6.165433,
-2.955419, 1, -5.872813,
-3.105344, 1, -6.165433,
-2.955419, 2, -5.872813,
-3.105344, 2, -6.165433
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
-3.405195, -3, -6.750673, 0, -0.5, 0.5, 0.5,
-3.405195, -3, -6.750673, 1, -0.5, 0.5, 0.5,
-3.405195, -3, -6.750673, 1, 1.5, 0.5, 0.5,
-3.405195, -3, -6.750673, 0, 1.5, 0.5, 0.5,
-3.405195, -2, -6.750673, 0, -0.5, 0.5, 0.5,
-3.405195, -2, -6.750673, 1, -0.5, 0.5, 0.5,
-3.405195, -2, -6.750673, 1, 1.5, 0.5, 0.5,
-3.405195, -2, -6.750673, 0, 1.5, 0.5, 0.5,
-3.405195, -1, -6.750673, 0, -0.5, 0.5, 0.5,
-3.405195, -1, -6.750673, 1, -0.5, 0.5, 0.5,
-3.405195, -1, -6.750673, 1, 1.5, 0.5, 0.5,
-3.405195, -1, -6.750673, 0, 1.5, 0.5, 0.5,
-3.405195, 0, -6.750673, 0, -0.5, 0.5, 0.5,
-3.405195, 0, -6.750673, 1, -0.5, 0.5, 0.5,
-3.405195, 0, -6.750673, 1, 1.5, 0.5, 0.5,
-3.405195, 0, -6.750673, 0, 1.5, 0.5, 0.5,
-3.405195, 1, -6.750673, 0, -0.5, 0.5, 0.5,
-3.405195, 1, -6.750673, 1, -0.5, 0.5, 0.5,
-3.405195, 1, -6.750673, 1, 1.5, 0.5, 0.5,
-3.405195, 1, -6.750673, 0, 1.5, 0.5, 0.5,
-3.405195, 2, -6.750673, 0, -0.5, 0.5, 0.5,
-3.405195, 2, -6.750673, 1, -0.5, 0.5, 0.5,
-3.405195, 2, -6.750673, 1, 1.5, 0.5, 0.5,
-3.405195, 2, -6.750673, 0, 1.5, 0.5, 0.5
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
-2.955419, -3.98369, -4,
-2.955419, -3.98369, 4,
-2.955419, -3.98369, -4,
-3.105344, -4.160185, -4,
-2.955419, -3.98369, -2,
-3.105344, -4.160185, -2,
-2.955419, -3.98369, 0,
-3.105344, -4.160185, 0,
-2.955419, -3.98369, 2,
-3.105344, -4.160185, 2,
-2.955419, -3.98369, 4,
-3.105344, -4.160185, 4
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
-3.405195, -4.513175, -4, 0, -0.5, 0.5, 0.5,
-3.405195, -4.513175, -4, 1, -0.5, 0.5, 0.5,
-3.405195, -4.513175, -4, 1, 1.5, 0.5, 0.5,
-3.405195, -4.513175, -4, 0, 1.5, 0.5, 0.5,
-3.405195, -4.513175, -2, 0, -0.5, 0.5, 0.5,
-3.405195, -4.513175, -2, 1, -0.5, 0.5, 0.5,
-3.405195, -4.513175, -2, 1, 1.5, 0.5, 0.5,
-3.405195, -4.513175, -2, 0, 1.5, 0.5, 0.5,
-3.405195, -4.513175, 0, 0, -0.5, 0.5, 0.5,
-3.405195, -4.513175, 0, 1, -0.5, 0.5, 0.5,
-3.405195, -4.513175, 0, 1, 1.5, 0.5, 0.5,
-3.405195, -4.513175, 0, 0, 1.5, 0.5, 0.5,
-3.405195, -4.513175, 2, 0, -0.5, 0.5, 0.5,
-3.405195, -4.513175, 2, 1, -0.5, 0.5, 0.5,
-3.405195, -4.513175, 2, 1, 1.5, 0.5, 0.5,
-3.405195, -4.513175, 2, 0, 1.5, 0.5, 0.5,
-3.405195, -4.513175, 4, 0, -0.5, 0.5, 0.5,
-3.405195, -4.513175, 4, 1, -0.5, 0.5, 0.5,
-3.405195, -4.513175, 4, 1, 1.5, 0.5, 0.5,
-3.405195, -4.513175, 4, 0, 1.5, 0.5, 0.5
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
-2.955419, -3.98369, -5.872813,
-2.955419, 3.076111, -5.872813,
-2.955419, -3.98369, 5.831982,
-2.955419, 3.076111, 5.831982,
-2.955419, -3.98369, -5.872813,
-2.955419, -3.98369, 5.831982,
-2.955419, 3.076111, -5.872813,
-2.955419, 3.076111, 5.831982,
-2.955419, -3.98369, -5.872813,
3.041588, -3.98369, -5.872813,
-2.955419, -3.98369, 5.831982,
3.041588, -3.98369, 5.831982,
-2.955419, 3.076111, -5.872813,
3.041588, 3.076111, -5.872813,
-2.955419, 3.076111, 5.831982,
3.041588, 3.076111, 5.831982,
3.041588, -3.98369, -5.872813,
3.041588, 3.076111, -5.872813,
3.041588, -3.98369, 5.831982,
3.041588, 3.076111, 5.831982,
3.041588, -3.98369, -5.872813,
3.041588, -3.98369, 5.831982,
3.041588, 3.076111, -5.872813,
3.041588, 3.076111, 5.831982
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
var radius = 7.970581;
var distance = 35.46202;
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
mvMatrix.translate( -0.04308438, 0.4537892, 0.02041554 );
mvMatrix.scale( 1.437042, 1.220707, 0.7362751 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.46202);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Mesotrione<-read.table("Mesotrione.xyz")
```

```
## Error in read.table("Mesotrione.xyz"): no lines available in input
```

```r
x<-Mesotrione$V2
```

```
## Error in eval(expr, envir, enclos): object 'Mesotrione' not found
```

```r
y<-Mesotrione$V3
```

```
## Error in eval(expr, envir, enclos): object 'Mesotrione' not found
```

```r
z<-Mesotrione$V4
```

```
## Error in eval(expr, envir, enclos): object 'Mesotrione' not found
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
-2.868084, 0.2359243, -1.367504, 0, 0, 1, 1, 1,
-2.819033, -1.026785, -2.41022, 1, 0, 0, 1, 1,
-2.775515, -0.1446234, -2.154462, 1, 0, 0, 1, 1,
-2.570785, -0.4173238, 1.224464, 1, 0, 0, 1, 1,
-2.487915, -0.1185189, 0.3833207, 1, 0, 0, 1, 1,
-2.444965, -0.6556067, -1.93176, 1, 0, 0, 1, 1,
-2.411245, -0.7614905, 0.7940412, 0, 0, 0, 1, 1,
-2.387632, 1.06777, -2.170089, 0, 0, 0, 1, 1,
-2.295791, 1.817084, -1.713435, 0, 0, 0, 1, 1,
-2.223578, 0.7665505, -0.1208466, 0, 0, 0, 1, 1,
-2.222899, 0.05959017, 0.2589316, 0, 0, 0, 1, 1,
-2.221964, 0.7938074, -1.476874, 0, 0, 0, 1, 1,
-2.191253, -0.2987639, -0.7236222, 0, 0, 0, 1, 1,
-2.166719, 0.348298, -1.480882, 1, 1, 1, 1, 1,
-2.150789, -0.3204755, -0.7757085, 1, 1, 1, 1, 1,
-2.12628, -0.8215975, -2.340527, 1, 1, 1, 1, 1,
-2.123715, 0.06980963, -0.6449972, 1, 1, 1, 1, 1,
-2.112916, 1.114677, 0.4721641, 1, 1, 1, 1, 1,
-2.103646, 0.5836886, -2.127381, 1, 1, 1, 1, 1,
-2.101404, -0.3028023, -2.096216, 1, 1, 1, 1, 1,
-2.098133, 0.0167441, -1.790063, 1, 1, 1, 1, 1,
-2.091336, 0.1789981, -1.297118, 1, 1, 1, 1, 1,
-2.063069, -1.088447, -2.35394, 1, 1, 1, 1, 1,
-2.062295, 0.5604793, -1.026806, 1, 1, 1, 1, 1,
-2.006481, 1.404858, -2.372188, 1, 1, 1, 1, 1,
-1.954827, -2.033279, -3.282919, 1, 1, 1, 1, 1,
-1.946927, 0.6477232, -0.1051281, 1, 1, 1, 1, 1,
-1.91336, -2.734603, -0.8692753, 1, 1, 1, 1, 1,
-1.909187, 0.958994, -0.4784989, 0, 0, 1, 1, 1,
-1.908142, 0.6335259, -2.108209, 1, 0, 0, 1, 1,
-1.905133, 1.810891, 0.3351958, 1, 0, 0, 1, 1,
-1.891136, 0.08188316, -1.947893, 1, 0, 0, 1, 1,
-1.887383, 0.07224397, -1.337486, 1, 0, 0, 1, 1,
-1.863638, -0.09807841, -0.847301, 1, 0, 0, 1, 1,
-1.861924, 0.9840556, -2.88305, 0, 0, 0, 1, 1,
-1.855428, -0.8900499, -0.01542383, 0, 0, 0, 1, 1,
-1.821758, 0.4362582, -1.917162, 0, 0, 0, 1, 1,
-1.813648, -0.3693789, -1.184726, 0, 0, 0, 1, 1,
-1.794489, 0.6540875, -1.460405, 0, 0, 0, 1, 1,
-1.786532, -0.7884499, -1.711016, 0, 0, 0, 1, 1,
-1.782687, 1.038819, -0.4199666, 0, 0, 0, 1, 1,
-1.778117, 0.5684181, -0.8248654, 1, 1, 1, 1, 1,
-1.768364, 1.725502, -1.009025, 1, 1, 1, 1, 1,
-1.742204, -1.474815, -2.629207, 1, 1, 1, 1, 1,
-1.737506, 0.743144, -0.5977628, 1, 1, 1, 1, 1,
-1.727927, 0.622021, -1.70604, 1, 1, 1, 1, 1,
-1.712439, 0.8717614, -1.210064, 1, 1, 1, 1, 1,
-1.686339, 0.2606268, -2.004359, 1, 1, 1, 1, 1,
-1.683818, 0.8849246, -0.9287469, 1, 1, 1, 1, 1,
-1.652028, -0.8728077, -4.493928, 1, 1, 1, 1, 1,
-1.643235, 0.06626564, 0.103636, 1, 1, 1, 1, 1,
-1.624239, 1.233578, -0.7526387, 1, 1, 1, 1, 1,
-1.610717, 1.516873, -0.5253252, 1, 1, 1, 1, 1,
-1.593807, -0.9320294, -1.590912, 1, 1, 1, 1, 1,
-1.575315, -0.5528975, -1.404508, 1, 1, 1, 1, 1,
-1.573772, -0.4962312, -0.7808728, 1, 1, 1, 1, 1,
-1.570851, -0.07441224, -1.402407, 0, 0, 1, 1, 1,
-1.569022, -0.8125028, -0.736541, 1, 0, 0, 1, 1,
-1.567702, 2.379394, -0.6165262, 1, 0, 0, 1, 1,
-1.561557, -0.6530006, -1.338425, 1, 0, 0, 1, 1,
-1.546007, -0.2005559, -0.908374, 1, 0, 0, 1, 1,
-1.531407, -0.4461513, -2.101393, 1, 0, 0, 1, 1,
-1.526599, 0.8052441, 0.7335734, 0, 0, 0, 1, 1,
-1.525235, -1.507535, -3.393276, 0, 0, 0, 1, 1,
-1.522762, 0.8646201, -1.271032, 0, 0, 0, 1, 1,
-1.520472, -0.8766537, -3.355652, 0, 0, 0, 1, 1,
-1.519262, 0.9684381, -0.4565783, 0, 0, 0, 1, 1,
-1.518272, 0.1433849, -1.040346, 0, 0, 0, 1, 1,
-1.477113, -0.06810011, -2.300767, 0, 0, 0, 1, 1,
-1.466481, 0.8288801, -0.4108892, 1, 1, 1, 1, 1,
-1.461161, -1.60137, -3.251718, 1, 1, 1, 1, 1,
-1.458983, 0.5345523, -0.9807172, 1, 1, 1, 1, 1,
-1.457004, 0.2569923, -0.9694647, 1, 1, 1, 1, 1,
-1.455013, -0.8447636, -2.43359, 1, 1, 1, 1, 1,
-1.451222, 0.04432348, -2.522738, 1, 1, 1, 1, 1,
-1.437065, -0.5281621, -1.700746, 1, 1, 1, 1, 1,
-1.435857, -2.219575, -2.873307, 1, 1, 1, 1, 1,
-1.428775, 1.581965, 0.2081712, 1, 1, 1, 1, 1,
-1.414392, -0.158871, -2.63763, 1, 1, 1, 1, 1,
-1.414232, 2.031338, 0.05553718, 1, 1, 1, 1, 1,
-1.405647, -0.647175, -2.547644, 1, 1, 1, 1, 1,
-1.40564, 0.2240634, -2.196514, 1, 1, 1, 1, 1,
-1.399552, 1.789938, -1.765797, 1, 1, 1, 1, 1,
-1.389918, -0.9449174, -1.508773, 1, 1, 1, 1, 1,
-1.389566, -0.659175, -1.677311, 0, 0, 1, 1, 1,
-1.387091, 0.312015, -3.250695, 1, 0, 0, 1, 1,
-1.364945, -0.5961332, -1.803818, 1, 0, 0, 1, 1,
-1.356281, -0.4577847, -2.240846, 1, 0, 0, 1, 1,
-1.351308, 0.7951759, -1.038737, 1, 0, 0, 1, 1,
-1.351205, 0.1441464, -2.054322, 1, 0, 0, 1, 1,
-1.34216, 0.6090553, 0.1315508, 0, 0, 0, 1, 1,
-1.333592, -1.13306, -2.141428, 0, 0, 0, 1, 1,
-1.333085, 0.02897085, -1.042829, 0, 0, 0, 1, 1,
-1.330043, -0.8032278, -1.147814, 0, 0, 0, 1, 1,
-1.316867, -1.152232, -2.844149, 0, 0, 0, 1, 1,
-1.309844, -1.148487, -3.030637, 0, 0, 0, 1, 1,
-1.305316, -0.5881947, -1.272255, 0, 0, 0, 1, 1,
-1.298348, 0.28352, -1.236439, 1, 1, 1, 1, 1,
-1.2947, 0.2061819, -0.1170658, 1, 1, 1, 1, 1,
-1.29329, -0.394309, -3.988847, 1, 1, 1, 1, 1,
-1.291999, -0.4149333, -1.386423, 1, 1, 1, 1, 1,
-1.287754, -0.08850734, -3.362165, 1, 1, 1, 1, 1,
-1.287568, -1.545071, -0.3989875, 1, 1, 1, 1, 1,
-1.284693, -0.6826844, -1.595226, 1, 1, 1, 1, 1,
-1.272197, -1.059038, -2.396866, 1, 1, 1, 1, 1,
-1.267848, 1.544063, -0.9534032, 1, 1, 1, 1, 1,
-1.264588, -1.890776, -2.207243, 1, 1, 1, 1, 1,
-1.263073, -0.5814049, -3.046871, 1, 1, 1, 1, 1,
-1.261008, 0.1050144, -0.006787108, 1, 1, 1, 1, 1,
-1.260308, 0.7016485, -1.371476, 1, 1, 1, 1, 1,
-1.256739, -0.574863, -2.074053, 1, 1, 1, 1, 1,
-1.253172, 0.2857035, -1.941712, 1, 1, 1, 1, 1,
-1.247398, -0.958595, -1.656893, 0, 0, 1, 1, 1,
-1.239259, -1.523463, -2.331858, 1, 0, 0, 1, 1,
-1.238834, 0.9996693, 0.1861162, 1, 0, 0, 1, 1,
-1.234122, 0.7597725, -0.7987682, 1, 0, 0, 1, 1,
-1.233837, 0.152307, -2.753705, 1, 0, 0, 1, 1,
-1.228859, 0.2847632, -0.6418334, 1, 0, 0, 1, 1,
-1.217987, -0.01887953, 0.04107971, 0, 0, 0, 1, 1,
-1.21439, 0.939118, -2.517972, 0, 0, 0, 1, 1,
-1.213172, 0.1588573, -1.490206, 0, 0, 0, 1, 1,
-1.20384, 1.551412, 1.585961, 0, 0, 0, 1, 1,
-1.203017, 1.54705, -1.291623, 0, 0, 0, 1, 1,
-1.191536, 0.8867928, -1.352774, 0, 0, 0, 1, 1,
-1.191462, -1.6246, -3.019543, 0, 0, 0, 1, 1,
-1.190744, -0.9294152, -1.396828, 1, 1, 1, 1, 1,
-1.177979, -0.3512638, -2.929425, 1, 1, 1, 1, 1,
-1.176207, 0.6797165, -1.169927, 1, 1, 1, 1, 1,
-1.169389, -0.5135611, -1.990902, 1, 1, 1, 1, 1,
-1.168333, 0.6511252, -0.113398, 1, 1, 1, 1, 1,
-1.165833, 0.6336356, 0.658991, 1, 1, 1, 1, 1,
-1.164855, -0.882458, -1.858414, 1, 1, 1, 1, 1,
-1.16173, -0.1221691, -3.067199, 1, 1, 1, 1, 1,
-1.154116, 1.377384, -0.2810723, 1, 1, 1, 1, 1,
-1.141663, -1.78205, -3.680165, 1, 1, 1, 1, 1,
-1.140913, 0.6091636, -0.8742474, 1, 1, 1, 1, 1,
-1.138403, 1.821314, 0.1165994, 1, 1, 1, 1, 1,
-1.13658, -0.004876999, -2.864784, 1, 1, 1, 1, 1,
-1.129489, 0.1919088, 0.3155565, 1, 1, 1, 1, 1,
-1.127252, -0.6193393, -1.70566, 1, 1, 1, 1, 1,
-1.121327, -1.122244, -1.413928, 0, 0, 1, 1, 1,
-1.119083, 0.3148617, -3.476334, 1, 0, 0, 1, 1,
-1.117484, 0.1685029, -2.588508, 1, 0, 0, 1, 1,
-1.112173, 1.457676, 0.9237632, 1, 0, 0, 1, 1,
-1.109283, 1.363747, 1.269855, 1, 0, 0, 1, 1,
-1.104153, -0.7379054, -1.400645, 1, 0, 0, 1, 1,
-1.102723, 2.780406, -0.7219367, 0, 0, 0, 1, 1,
-1.096937, 1.094306, -0.2077698, 0, 0, 0, 1, 1,
-1.092697, 0.009107309, -1.121694, 0, 0, 0, 1, 1,
-1.092578, -0.259354, -3.668146, 0, 0, 0, 1, 1,
-1.092113, 1.800934, 1.277338, 0, 0, 0, 1, 1,
-1.091656, -0.7138406, -2.591705, 0, 0, 0, 1, 1,
-1.080399, -0.9450708, -3.52515, 0, 0, 0, 1, 1,
-1.06222, 1.247035, 0.1277955, 1, 1, 1, 1, 1,
-1.057218, -0.3884314, -0.3381712, 1, 1, 1, 1, 1,
-1.056311, 0.2175815, 0.1406581, 1, 1, 1, 1, 1,
-1.052973, -1.246983, -2.232691, 1, 1, 1, 1, 1,
-1.050359, -1.736393, -3.201879, 1, 1, 1, 1, 1,
-1.046653, -2.311174, -1.715598, 1, 1, 1, 1, 1,
-1.040717, 0.4880207, -1.857888, 1, 1, 1, 1, 1,
-1.037874, 0.4853868, -0.9335937, 1, 1, 1, 1, 1,
-1.033115, 0.6455153, 0.6613693, 1, 1, 1, 1, 1,
-1.023974, -0.3928188, -0.6991252, 1, 1, 1, 1, 1,
-1.023378, 0.9776456, -0.5954167, 1, 1, 1, 1, 1,
-1.02046, -0.3005394, -1.355706, 1, 1, 1, 1, 1,
-1.003364, 0.09692676, -1.936067, 1, 1, 1, 1, 1,
-1.000916, -1.665389, -2.277483, 1, 1, 1, 1, 1,
-0.9927965, -0.7296497, -2.388967, 1, 1, 1, 1, 1,
-0.9907417, 0.5301941, -1.192461, 0, 0, 1, 1, 1,
-0.9826242, 0.7750501, -0.5640349, 1, 0, 0, 1, 1,
-0.9740833, 0.6838136, -0.317451, 1, 0, 0, 1, 1,
-0.9659382, -0.5286921, -1.650443, 1, 0, 0, 1, 1,
-0.9612948, 0.4427134, -1.394705, 1, 0, 0, 1, 1,
-0.9607165, -0.8845166, -1.094449, 1, 0, 0, 1, 1,
-0.958736, 0.3088619, -0.8305821, 0, 0, 0, 1, 1,
-0.9540328, 1.917208, -0.4101037, 0, 0, 0, 1, 1,
-0.9489367, -1.831967, -2.131129, 0, 0, 0, 1, 1,
-0.9480429, -0.04843458, -3.134067, 0, 0, 0, 1, 1,
-0.9462333, 2.447664, 0.5496348, 0, 0, 0, 1, 1,
-0.9457407, 0.6966292, 0.9609444, 0, 0, 0, 1, 1,
-0.9398547, 0.1632387, 1.181183, 0, 0, 0, 1, 1,
-0.9325537, 0.0009470861, -2.188193, 1, 1, 1, 1, 1,
-0.9282064, 0.3012532, -1.058583, 1, 1, 1, 1, 1,
-0.9276818, -0.7890907, -4.093751, 1, 1, 1, 1, 1,
-0.913184, 0.2440727, 0.3152478, 1, 1, 1, 1, 1,
-0.9089254, -1.943584, -4.870523, 1, 1, 1, 1, 1,
-0.9082476, -0.04169956, -0.2207583, 1, 1, 1, 1, 1,
-0.9081602, 1.337428, -0.5370132, 1, 1, 1, 1, 1,
-0.9074575, 0.4518726, -0.6701594, 1, 1, 1, 1, 1,
-0.9067228, -0.9288901, -1.789207, 1, 1, 1, 1, 1,
-0.9044548, -0.428344, -1.505588, 1, 1, 1, 1, 1,
-0.9043415, 0.5800486, -0.4636186, 1, 1, 1, 1, 1,
-0.9039283, 0.09205811, -1.810071, 1, 1, 1, 1, 1,
-0.8977872, 1.434061, -0.3815125, 1, 1, 1, 1, 1,
-0.8973199, -0.07360552, -2.21828, 1, 1, 1, 1, 1,
-0.8940873, 0.7536117, -0.4563189, 1, 1, 1, 1, 1,
-0.8935823, 0.7418596, -0.1624603, 0, 0, 1, 1, 1,
-0.8930854, -2.005466, -5.223142, 1, 0, 0, 1, 1,
-0.877198, -1.155101, -2.154821, 1, 0, 0, 1, 1,
-0.8666105, 1.34647, -1.144174, 1, 0, 0, 1, 1,
-0.8614942, 0.8384699, -0.5813913, 1, 0, 0, 1, 1,
-0.8606304, -0.4232767, -2.734873, 1, 0, 0, 1, 1,
-0.8575143, 0.737792, 0.4923788, 0, 0, 0, 1, 1,
-0.8541492, -0.2508238, -0.8587406, 0, 0, 0, 1, 1,
-0.8365932, -1.322126, -2.880908, 0, 0, 0, 1, 1,
-0.8321328, 0.5212341, -0.6515095, 0, 0, 0, 1, 1,
-0.8241714, -0.7288997, -1.246195, 0, 0, 0, 1, 1,
-0.8230171, -2.084118, -1.852897, 0, 0, 0, 1, 1,
-0.82291, -2.386171, -2.686306, 0, 0, 0, 1, 1,
-0.8196044, 0.1338915, -1.834899, 1, 1, 1, 1, 1,
-0.8178363, 1.072518, -1.240986, 1, 1, 1, 1, 1,
-0.8098946, 0.9670398, -0.2262549, 1, 1, 1, 1, 1,
-0.8060697, -0.07264648, 0.4664491, 1, 1, 1, 1, 1,
-0.7982371, -1.036836, -1.904391, 1, 1, 1, 1, 1,
-0.7961094, -0.5248876, -1.711674, 1, 1, 1, 1, 1,
-0.7892581, 0.7185199, -2.443518, 1, 1, 1, 1, 1,
-0.7863396, -0.3645202, -3.277926, 1, 1, 1, 1, 1,
-0.780095, 0.2173847, -1.700528, 1, 1, 1, 1, 1,
-0.7789878, -0.8959741, -2.067827, 1, 1, 1, 1, 1,
-0.7717637, -0.6305336, -3.257233, 1, 1, 1, 1, 1,
-0.7701732, -0.1590885, -4.149752, 1, 1, 1, 1, 1,
-0.7655094, 1.232394, -0.235965, 1, 1, 1, 1, 1,
-0.7545773, 2.158509, 0.5784326, 1, 1, 1, 1, 1,
-0.753367, 1.969995, -1.858771, 1, 1, 1, 1, 1,
-0.7520597, 1.680622, -0.3522565, 0, 0, 1, 1, 1,
-0.7500647, 0.1214914, -0.1400955, 1, 0, 0, 1, 1,
-0.749023, 0.4318737, -1.525825, 1, 0, 0, 1, 1,
-0.7390765, 1.201375, 1.120529, 1, 0, 0, 1, 1,
-0.7388328, -0.9057994, -2.516969, 1, 0, 0, 1, 1,
-0.7320439, 0.1147092, -1.399342, 1, 0, 0, 1, 1,
-0.7304978, -1.949962, -5.34977, 0, 0, 0, 1, 1,
-0.7298803, -0.4620361, -3.410605, 0, 0, 0, 1, 1,
-0.7290936, -0.9822626, -2.710244, 0, 0, 0, 1, 1,
-0.7285748, 0.493972, -1.808508, 0, 0, 0, 1, 1,
-0.7281767, -0.06235353, -2.853591, 0, 0, 0, 1, 1,
-0.7266163, 0.1253709, -1.015926, 0, 0, 0, 1, 1,
-0.7249162, -0.1696399, -0.8742113, 0, 0, 0, 1, 1,
-0.7232774, 1.109738, -1.722421, 1, 1, 1, 1, 1,
-0.7203645, -0.187838, -0.8054284, 1, 1, 1, 1, 1,
-0.7183673, -0.7704756, -3.51017, 1, 1, 1, 1, 1,
-0.7162688, -0.5798317, -3.100887, 1, 1, 1, 1, 1,
-0.7089239, -0.04547879, -2.956959, 1, 1, 1, 1, 1,
-0.7056507, -1.839082, -3.881322, 1, 1, 1, 1, 1,
-0.7047808, 2.109784, -0.6925241, 1, 1, 1, 1, 1,
-0.7035121, -0.1888728, -2.525387, 1, 1, 1, 1, 1,
-0.6948941, -1.300915, -0.120453, 1, 1, 1, 1, 1,
-0.6893932, 0.9592046, -1.123325, 1, 1, 1, 1, 1,
-0.6850818, -1.217562, -4.096898, 1, 1, 1, 1, 1,
-0.6848894, -0.1814195, -2.106974, 1, 1, 1, 1, 1,
-0.6815531, -1.41187, -2.350608, 1, 1, 1, 1, 1,
-0.6791629, 0.1709081, -1.672514, 1, 1, 1, 1, 1,
-0.6662078, 0.03989633, -1.952239, 1, 1, 1, 1, 1,
-0.6644368, 1.744734, -1.394415, 0, 0, 1, 1, 1,
-0.6640908, -1.971819, -3.399435, 1, 0, 0, 1, 1,
-0.6620156, 1.647761, -0.6373624, 1, 0, 0, 1, 1,
-0.6586621, -1.219869, -2.210944, 1, 0, 0, 1, 1,
-0.6550925, 2.286598, 0.6759384, 1, 0, 0, 1, 1,
-0.6541482, 0.6169845, -1.618692, 1, 0, 0, 1, 1,
-0.6527257, -1.524134, -2.629884, 0, 0, 0, 1, 1,
-0.6518698, 0.7212548, -0.8740554, 0, 0, 0, 1, 1,
-0.6424686, -0.4024543, -1.12025, 0, 0, 0, 1, 1,
-0.6369565, 1.154399, 1.667737, 0, 0, 0, 1, 1,
-0.6363647, 0.09085816, -0.9497759, 0, 0, 0, 1, 1,
-0.6335232, -0.07752212, -1.327783, 0, 0, 0, 1, 1,
-0.6333794, -2.180316, -3.581832, 0, 0, 0, 1, 1,
-0.6305705, 0.3523661, 0.6701508, 1, 1, 1, 1, 1,
-0.6281295, 0.5613132, -0.5058846, 1, 1, 1, 1, 1,
-0.6277344, -0.8249968, -4.577738, 1, 1, 1, 1, 1,
-0.6263074, -1.167732, -1.928808, 1, 1, 1, 1, 1,
-0.6204938, 2.422574, -0.9190526, 1, 1, 1, 1, 1,
-0.6198338, 0.5171107, -0.5133154, 1, 1, 1, 1, 1,
-0.6194202, -0.6314241, -2.427888, 1, 1, 1, 1, 1,
-0.6168145, 0.6980602, -1.246875, 1, 1, 1, 1, 1,
-0.6124948, 0.5664096, -0.6786348, 1, 1, 1, 1, 1,
-0.6071278, 0.207816, -2.572486, 1, 1, 1, 1, 1,
-0.6005493, 0.8150192, -0.9975479, 1, 1, 1, 1, 1,
-0.5996303, 0.06783884, -1.860565, 1, 1, 1, 1, 1,
-0.5968049, 0.007502487, -1.488177, 1, 1, 1, 1, 1,
-0.5936448, 0.9152902, -1.490946, 1, 1, 1, 1, 1,
-0.5880107, 0.04681623, -2.436457, 1, 1, 1, 1, 1,
-0.5828961, -0.5273864, -0.8112593, 0, 0, 1, 1, 1,
-0.5785208, 1.151853, -2.327892, 1, 0, 0, 1, 1,
-0.572942, -2.000962, -2.987636, 1, 0, 0, 1, 1,
-0.570719, 0.8060692, -1.484343, 1, 0, 0, 1, 1,
-0.5652771, -0.4936427, -2.773437, 1, 0, 0, 1, 1,
-0.5645799, -0.7752685, -1.283557, 1, 0, 0, 1, 1,
-0.5641407, -0.0835133, -2.658472, 0, 0, 0, 1, 1,
-0.5589842, -1.425783, -4.622222, 0, 0, 0, 1, 1,
-0.5528145, 0.5696486, -0.8697425, 0, 0, 0, 1, 1,
-0.5523432, -0.4081317, -0.7166133, 0, 0, 0, 1, 1,
-0.5507972, -0.5437066, -0.8046836, 0, 0, 0, 1, 1,
-0.5470119, -0.08518511, -3.675298, 0, 0, 0, 1, 1,
-0.5449452, 0.8472463, -1.223934, 0, 0, 0, 1, 1,
-0.5420333, -0.1960636, -1.805466, 1, 1, 1, 1, 1,
-0.5416304, -0.3474104, -1.36766, 1, 1, 1, 1, 1,
-0.5402329, -0.02239107, -2.85717, 1, 1, 1, 1, 1,
-0.5392068, 0.4472381, 0.5642461, 1, 1, 1, 1, 1,
-0.5383905, -0.1496965, -2.852771, 1, 1, 1, 1, 1,
-0.5372198, 1.162414, -1.329704, 1, 1, 1, 1, 1,
-0.5340621, 1.20773, -0.6770372, 1, 1, 1, 1, 1,
-0.5314333, 1.51576, 0.1190148, 1, 1, 1, 1, 1,
-0.5300221, 0.964757, -0.9285771, 1, 1, 1, 1, 1,
-0.5270367, 1.073161, 0.5411427, 1, 1, 1, 1, 1,
-0.5260636, 0.6770592, -0.6775979, 1, 1, 1, 1, 1,
-0.523303, 0.5780277, -0.4102349, 1, 1, 1, 1, 1,
-0.5211138, -0.08296593, -1.014608, 1, 1, 1, 1, 1,
-0.5205178, -0.05201593, -1.741253, 1, 1, 1, 1, 1,
-0.51926, -0.8803402, -2.86691, 1, 1, 1, 1, 1,
-0.5186982, 0.9074815, -0.2494486, 0, 0, 1, 1, 1,
-0.5176349, -0.944352, -3.008473, 1, 0, 0, 1, 1,
-0.5169821, 1.170871, -1.557542, 1, 0, 0, 1, 1,
-0.5167895, -0.393806, -1.091465, 1, 0, 0, 1, 1,
-0.5155352, -1.062374, -4.41715, 1, 0, 0, 1, 1,
-0.5086987, -1.188545, -3.603749, 1, 0, 0, 1, 1,
-0.4976288, -1.031006, -2.360551, 0, 0, 0, 1, 1,
-0.4967601, -0.2847319, -0.7954666, 0, 0, 0, 1, 1,
-0.4949584, 0.562169, -0.06480659, 0, 0, 0, 1, 1,
-0.4915213, 1.596641, -0.5007901, 0, 0, 0, 1, 1,
-0.4843157, 0.1200045, -1.396636, 0, 0, 0, 1, 1,
-0.4840345, 2.687322, -0.009424702, 0, 0, 0, 1, 1,
-0.4771642, -0.0008103212, -2.452743, 0, 0, 0, 1, 1,
-0.4771441, -2.207508, -3.386154, 1, 1, 1, 1, 1,
-0.4764403, 0.4217698, -2.010752, 1, 1, 1, 1, 1,
-0.4755725, 0.1709568, -1.817636, 1, 1, 1, 1, 1,
-0.4740248, -1.379798, -2.943427, 1, 1, 1, 1, 1,
-0.4735474, 0.3468687, -0.2384165, 1, 1, 1, 1, 1,
-0.4701203, -0.1483202, -3.86306, 1, 1, 1, 1, 1,
-0.4651984, -0.7513323, -3.627587, 1, 1, 1, 1, 1,
-0.4518043, 0.3432268, 0.5838396, 1, 1, 1, 1, 1,
-0.4503218, 0.5250474, -0.5815434, 1, 1, 1, 1, 1,
-0.4498583, -1.199878, -0.8097298, 1, 1, 1, 1, 1,
-0.44946, -0.6278436, -2.439184, 1, 1, 1, 1, 1,
-0.4494047, -0.8450963, -4.909234, 1, 1, 1, 1, 1,
-0.4484201, -0.9204386, -3.78654, 1, 1, 1, 1, 1,
-0.4476811, -0.4158008, -1.559511, 1, 1, 1, 1, 1,
-0.444641, -1.309431, -2.775156, 1, 1, 1, 1, 1,
-0.4434056, 1.17493, 0.666828, 0, 0, 1, 1, 1,
-0.440816, 0.1611449, -0.9464103, 1, 0, 0, 1, 1,
-0.4390789, -0.2786959, -2.296996, 1, 0, 0, 1, 1,
-0.4290788, -0.08907803, 0.08427654, 1, 0, 0, 1, 1,
-0.4230623, 2.048465, 2.68168, 1, 0, 0, 1, 1,
-0.422174, -1.14498, -3.968788, 1, 0, 0, 1, 1,
-0.4157425, -0.3671626, -2.345409, 0, 0, 0, 1, 1,
-0.4150487, -1.037252, -4.296741, 0, 0, 0, 1, 1,
-0.4132001, -0.06363456, -0.3970501, 0, 0, 0, 1, 1,
-0.4103959, 0.8485952, 0.1162981, 0, 0, 0, 1, 1,
-0.4052296, 0.413957, -1.868242, 0, 0, 0, 1, 1,
-0.4025527, -1.304092, -2.077621, 0, 0, 0, 1, 1,
-0.3990194, -0.4303336, -3.064721, 0, 0, 0, 1, 1,
-0.3966507, 0.3827713, -1.891225, 1, 1, 1, 1, 1,
-0.3958507, -0.5238469, -2.666041, 1, 1, 1, 1, 1,
-0.3892917, 0.6281528, 0.7390857, 1, 1, 1, 1, 1,
-0.3842547, -1.189775, -2.429822, 1, 1, 1, 1, 1,
-0.3826684, 0.894114, -0.2356211, 1, 1, 1, 1, 1,
-0.3822285, 0.05611777, -2.417988, 1, 1, 1, 1, 1,
-0.3763839, -0.05877768, -0.928213, 1, 1, 1, 1, 1,
-0.3752814, 0.1050172, -2.4338, 1, 1, 1, 1, 1,
-0.3732912, 1.272623, -1.091962, 1, 1, 1, 1, 1,
-0.3567633, 0.7350532, -0.3105364, 1, 1, 1, 1, 1,
-0.3545558, -1.328789, -2.929738, 1, 1, 1, 1, 1,
-0.3543719, 0.1966132, -1.346922, 1, 1, 1, 1, 1,
-0.3537017, -0.9002408, -1.384009, 1, 1, 1, 1, 1,
-0.3416275, 1.193989, -0.796244, 1, 1, 1, 1, 1,
-0.3376607, -1.646572, -2.629768, 1, 1, 1, 1, 1,
-0.3325634, -0.545639, -3.076646, 0, 0, 1, 1, 1,
-0.3301813, -0.8435048, -3.33891, 1, 0, 0, 1, 1,
-0.3285294, 0.9118945, -0.4876954, 1, 0, 0, 1, 1,
-0.3264304, -0.3693905, -3.19724, 1, 0, 0, 1, 1,
-0.3247388, 0.9615822, 0.7728673, 1, 0, 0, 1, 1,
-0.3179424, 0.07955777, -1.255769, 1, 0, 0, 1, 1,
-0.3126008, -0.03424961, -1.356272, 0, 0, 0, 1, 1,
-0.3123193, 0.5153226, 0.4812247, 0, 0, 0, 1, 1,
-0.3117411, 0.3164347, -1.544937, 0, 0, 0, 1, 1,
-0.3003119, -1.442658, -2.963082, 0, 0, 0, 1, 1,
-0.2994869, -1.249953, -3.530998, 0, 0, 0, 1, 1,
-0.2962343, -0.02098144, -1.403806, 0, 0, 0, 1, 1,
-0.2953848, -0.614502, -3.414108, 0, 0, 0, 1, 1,
-0.2946254, 0.3445807, -0.2578757, 1, 1, 1, 1, 1,
-0.2923579, -0.2667401, -3.07757, 1, 1, 1, 1, 1,
-0.2902789, -0.2273531, -0.6146926, 1, 1, 1, 1, 1,
-0.2861819, -0.2420149, -3.748173, 1, 1, 1, 1, 1,
-0.2730906, -0.4741978, -3.204192, 1, 1, 1, 1, 1,
-0.2699451, 2.072158, 1.5899, 1, 1, 1, 1, 1,
-0.264206, 0.01175703, -2.41021, 1, 1, 1, 1, 1,
-0.2623094, -0.6046671, -2.945424, 1, 1, 1, 1, 1,
-0.2613001, 1.078882, -0.4274965, 1, 1, 1, 1, 1,
-0.2607772, -0.3211535, -0.06547365, 1, 1, 1, 1, 1,
-0.2605551, -0.4470982, -2.604178, 1, 1, 1, 1, 1,
-0.2604283, 2.646483, -0.432612, 1, 1, 1, 1, 1,
-0.2601542, 0.4127571, -0.9580336, 1, 1, 1, 1, 1,
-0.2487589, 0.5629246, -0.8202463, 1, 1, 1, 1, 1,
-0.2430409, -3.083193, -3.444012, 1, 1, 1, 1, 1,
-0.2419703, 0.4914255, -1.433633, 0, 0, 1, 1, 1,
-0.2414057, 2.233982, 0.5944863, 1, 0, 0, 1, 1,
-0.2411188, -0.5796388, -2.65667, 1, 0, 0, 1, 1,
-0.2373309, -0.69919, -4.043794, 1, 0, 0, 1, 1,
-0.2356036, 0.553124, 0.1919935, 1, 0, 0, 1, 1,
-0.2346704, -0.7181708, -2.41015, 1, 0, 0, 1, 1,
-0.2332328, 0.2098056, -1.158508, 0, 0, 0, 1, 1,
-0.232419, -0.1248958, -2.363863, 0, 0, 0, 1, 1,
-0.2289061, 1.02505, 0.5039276, 0, 0, 0, 1, 1,
-0.2251261, -0.1712165, -2.903476, 0, 0, 0, 1, 1,
-0.2123667, 0.3919099, -0.3557616, 0, 0, 0, 1, 1,
-0.2118107, 0.3515179, -2.32179, 0, 0, 0, 1, 1,
-0.2112773, 0.02749188, -1.558085, 0, 0, 0, 1, 1,
-0.2046117, 1.335896, -0.5588962, 1, 1, 1, 1, 1,
-0.2005673, -0.2133228, -2.107513, 1, 1, 1, 1, 1,
-0.1992154, -0.9516305, -1.924639, 1, 1, 1, 1, 1,
-0.1922066, 1.709111, 1.196482, 1, 1, 1, 1, 1,
-0.1895692, -1.006803, -3.761446, 1, 1, 1, 1, 1,
-0.188592, -0.9566622, -4.534414, 1, 1, 1, 1, 1,
-0.1870531, -1.263456, -4.065173, 1, 1, 1, 1, 1,
-0.185424, 0.6044276, -0.1256756, 1, 1, 1, 1, 1,
-0.1854144, 0.004078115, -2.283947, 1, 1, 1, 1, 1,
-0.1826838, -0.58337, -2.30819, 1, 1, 1, 1, 1,
-0.1801551, 1.795235, -0.05062516, 1, 1, 1, 1, 1,
-0.1784143, 0.2878144, -1.91664, 1, 1, 1, 1, 1,
-0.1774345, 1.843398, -0.552972, 1, 1, 1, 1, 1,
-0.1769381, 0.3623099, -0.6855779, 1, 1, 1, 1, 1,
-0.1765993, 0.7333943, 0.3920195, 1, 1, 1, 1, 1,
-0.1758959, 0.8968883, 0.3052326, 0, 0, 1, 1, 1,
-0.1750178, -0.3583165, -2.714687, 1, 0, 0, 1, 1,
-0.1747736, 0.4013804, 0.170635, 1, 0, 0, 1, 1,
-0.1737349, -0.7919707, -2.862613, 1, 0, 0, 1, 1,
-0.1667659, 2.136377, 0.4824286, 1, 0, 0, 1, 1,
-0.1659347, 0.1030868, -0.365469, 1, 0, 0, 1, 1,
-0.1651539, 0.4809176, 0.2113826, 0, 0, 0, 1, 1,
-0.1649569, 1.302142, 0.6480365, 0, 0, 0, 1, 1,
-0.1647337, -0.2482573, -3.218864, 0, 0, 0, 1, 1,
-0.1645358, -0.8524135, -1.731428, 0, 0, 0, 1, 1,
-0.1609449, -1.097358, -1.740581, 0, 0, 0, 1, 1,
-0.1576471, 0.08980898, -1.039853, 0, 0, 0, 1, 1,
-0.1559097, 0.1261674, -3.796165, 0, 0, 0, 1, 1,
-0.1474903, -0.8905195, -2.922372, 1, 1, 1, 1, 1,
-0.1423313, 0.594015, -0.3625814, 1, 1, 1, 1, 1,
-0.1335969, -1.527042, -2.437774, 1, 1, 1, 1, 1,
-0.1298099, -0.8031591, -5.702355, 1, 1, 1, 1, 1,
-0.1291232, -2.111908, -3.934231, 1, 1, 1, 1, 1,
-0.1188951, -0.4723034, -3.146117, 1, 1, 1, 1, 1,
-0.1167685, 1.316089, -0.3493144, 1, 1, 1, 1, 1,
-0.1162718, -0.07493494, -2.888271, 1, 1, 1, 1, 1,
-0.1146262, 1.699586, 0.9208176, 1, 1, 1, 1, 1,
-0.1144866, 0.7715254, 0.688614, 1, 1, 1, 1, 1,
-0.1141646, -0.2367328, -3.885691, 1, 1, 1, 1, 1,
-0.1139911, -1.086525, -3.525661, 1, 1, 1, 1, 1,
-0.1127592, 0.8231001, 0.481838, 1, 1, 1, 1, 1,
-0.1107255, 0.7327774, 0.1605816, 1, 1, 1, 1, 1,
-0.1102338, -0.0697685, -3.045651, 1, 1, 1, 1, 1,
-0.1090444, 0.8411817, -0.6482754, 0, 0, 1, 1, 1,
-0.1066244, 1.319723, 0.08148968, 1, 0, 0, 1, 1,
-0.1016091, 0.7709206, -0.05171182, 1, 0, 0, 1, 1,
-0.1012822, 1.003036, 1.607304, 1, 0, 0, 1, 1,
-0.09860095, 1.209711, -0.9807224, 1, 0, 0, 1, 1,
-0.09511582, -1.663433, -1.900676, 1, 0, 0, 1, 1,
-0.09491204, 0.5402018, -1.101377, 0, 0, 0, 1, 1,
-0.09421661, 0.8222686, -1.383517, 0, 0, 0, 1, 1,
-0.09006544, 1.294575, -0.9381009, 0, 0, 0, 1, 1,
-0.08983919, -0.5448604, -4.924599, 0, 0, 0, 1, 1,
-0.08684288, 1.448485, -0.4500666, 0, 0, 0, 1, 1,
-0.08453837, -0.3716672, -5.210745, 0, 0, 0, 1, 1,
-0.08195334, 0.2476778, -1.02461, 0, 0, 0, 1, 1,
-0.07709017, -0.5386112, -2.392883, 1, 1, 1, 1, 1,
-0.0770897, 0.7341354, 0.1681577, 1, 1, 1, 1, 1,
-0.07683685, 0.1130435, -0.6439946, 1, 1, 1, 1, 1,
-0.07665342, -0.2822203, -2.716893, 1, 1, 1, 1, 1,
-0.07501515, -2.217069, -3.385958, 1, 1, 1, 1, 1,
-0.07214203, 1.956876, -0.643632, 1, 1, 1, 1, 1,
-0.0720826, -0.8694587, -2.926723, 1, 1, 1, 1, 1,
-0.0699644, -1.072086, -1.549923, 1, 1, 1, 1, 1,
-0.06301923, -0.3160791, -3.679213, 1, 1, 1, 1, 1,
-0.06210077, 0.2195273, 0.675371, 1, 1, 1, 1, 1,
-0.06021928, -1.168797, -3.257523, 1, 1, 1, 1, 1,
-0.05787844, -0.623252, -1.895553, 1, 1, 1, 1, 1,
-0.05704324, -1.29601, -4.306814, 1, 1, 1, 1, 1,
-0.05068552, 1.375983, -0.08840254, 1, 1, 1, 1, 1,
-0.04940981, 1.377524, 0.6012554, 1, 1, 1, 1, 1,
-0.04904532, 1.166621, 1.0092, 0, 0, 1, 1, 1,
-0.04771212, 1.16888, 0.9986084, 1, 0, 0, 1, 1,
-0.04620543, 0.4155112, 1.280966, 1, 0, 0, 1, 1,
-0.04358738, 1.308892, -1.019313, 1, 0, 0, 1, 1,
-0.04159667, -0.7930748, -2.299139, 1, 0, 0, 1, 1,
-0.04116376, 1.393756, -0.3494759, 1, 0, 0, 1, 1,
-0.03919416, -1.854825, -2.921362, 0, 0, 0, 1, 1,
-0.03598594, 1.685424, 0.7032562, 0, 0, 0, 1, 1,
-0.0339846, 1.706729, 0.5603763, 0, 0, 0, 1, 1,
-0.03129539, -0.348942, -4.319941, 0, 0, 0, 1, 1,
-0.02575385, -0.7243063, -2.059406, 0, 0, 0, 1, 1,
-0.02567302, -3.880877, -1.631103, 0, 0, 0, 1, 1,
-0.01960538, -0.08983504, -2.771127, 0, 0, 0, 1, 1,
-0.01912604, -0.6104365, -1.518977, 1, 1, 1, 1, 1,
-0.0156665, 1.223735, 1.471615, 1, 1, 1, 1, 1,
-0.01503124, 0.2290682, -2.629613, 1, 1, 1, 1, 1,
-0.01249292, 0.507853, 0.05275329, 1, 1, 1, 1, 1,
-0.005228595, 0.131703, 0.7678755, 1, 1, 1, 1, 1,
-0.002469769, 0.3637507, 0.6670175, 1, 1, 1, 1, 1,
-0.001122506, -0.02060899, -4.117465, 1, 1, 1, 1, 1,
0.004334621, 0.3346573, -1.367083, 1, 1, 1, 1, 1,
0.004834739, -0.4529563, 3.875313, 1, 1, 1, 1, 1,
0.00533768, -0.5030411, 1.149896, 1, 1, 1, 1, 1,
0.008433416, -0.2574852, 4.245499, 1, 1, 1, 1, 1,
0.01080115, 0.4918655, -0.05552593, 1, 1, 1, 1, 1,
0.01642248, 0.986674, -0.5785998, 1, 1, 1, 1, 1,
0.01799581, 1.641478, 1.423517, 1, 1, 1, 1, 1,
0.01813697, 1.016804, 0.3614835, 1, 1, 1, 1, 1,
0.01943865, 2.243, -1.449466, 0, 0, 1, 1, 1,
0.01971177, 0.9264704, 1.293662, 1, 0, 0, 1, 1,
0.02447687, -0.5985492, 3.559756, 1, 0, 0, 1, 1,
0.02472016, 0.09711315, 1.759434, 1, 0, 0, 1, 1,
0.02521813, 1.142597, 0.2244987, 1, 0, 0, 1, 1,
0.02860753, -0.4639318, 3.090569, 1, 0, 0, 1, 1,
0.02928114, -0.03347507, 3.104938, 0, 0, 0, 1, 1,
0.03129198, -1.016837, 5.42803, 0, 0, 0, 1, 1,
0.03148274, -0.1885363, 2.03691, 0, 0, 0, 1, 1,
0.03415778, -2.182609, 3.914527, 0, 0, 0, 1, 1,
0.0347616, 0.9980788, 1.249351, 0, 0, 0, 1, 1,
0.03603544, 1.810781, -1.360592, 0, 0, 0, 1, 1,
0.0361639, -0.3096615, 2.945044, 0, 0, 0, 1, 1,
0.04505887, -1.457366, 4.790927, 1, 1, 1, 1, 1,
0.05289234, 0.6120557, 0.4329663, 1, 1, 1, 1, 1,
0.05667828, 0.1950194, -0.07021945, 1, 1, 1, 1, 1,
0.06029841, -0.1295424, 1.403846, 1, 1, 1, 1, 1,
0.0710315, 0.446035, -0.6032796, 1, 1, 1, 1, 1,
0.07174153, 1.323919, 0.266211, 1, 1, 1, 1, 1,
0.07561549, -0.5236794, 3.901259, 1, 1, 1, 1, 1,
0.07595971, 1.265965, -1.106277, 1, 1, 1, 1, 1,
0.08008293, 1.408351, -0.2764251, 1, 1, 1, 1, 1,
0.08044657, -0.3886434, 2.977053, 1, 1, 1, 1, 1,
0.08194977, 0.756251, 0.0708511, 1, 1, 1, 1, 1,
0.08351614, -0.2125527, 3.103535, 1, 1, 1, 1, 1,
0.08510505, 2.09669, -0.298991, 1, 1, 1, 1, 1,
0.08575173, -0.185715, 1.738813, 1, 1, 1, 1, 1,
0.08689497, -0.6335343, 3.272854, 1, 1, 1, 1, 1,
0.08798542, 0.2546735, -0.6345929, 0, 0, 1, 1, 1,
0.08829623, 0.2116376, -0.2864114, 1, 0, 0, 1, 1,
0.0901516, -0.07590647, 4.046352, 1, 0, 0, 1, 1,
0.09203666, -0.1825324, 4.491841, 1, 0, 0, 1, 1,
0.09219041, -0.8378403, 2.518566, 1, 0, 0, 1, 1,
0.09594437, 1.358992, 0.2112411, 1, 0, 0, 1, 1,
0.09965961, -1.345167, 3.242326, 0, 0, 0, 1, 1,
0.1007592, -0.7740898, 4.36805, 0, 0, 0, 1, 1,
0.1008717, 0.07900638, 3.610628, 0, 0, 0, 1, 1,
0.104276, -0.3549533, 1.29213, 0, 0, 0, 1, 1,
0.1043841, -1.586862, 2.988035, 0, 0, 0, 1, 1,
0.1059242, 0.5611014, 1.385416, 0, 0, 0, 1, 1,
0.1061696, -0.3634057, 2.20419, 0, 0, 0, 1, 1,
0.1069375, 0.7501447, 0.1695425, 1, 1, 1, 1, 1,
0.1097132, -0.2418033, 2.065528, 1, 1, 1, 1, 1,
0.1107998, -0.6733475, 4.320294, 1, 1, 1, 1, 1,
0.113057, -0.579598, 2.298364, 1, 1, 1, 1, 1,
0.1156698, -0.5002613, 4.027659, 1, 1, 1, 1, 1,
0.1175164, -0.9494412, 2.883127, 1, 1, 1, 1, 1,
0.1176147, -0.7835175, 2.352633, 1, 1, 1, 1, 1,
0.1195538, -0.4039687, 3.369357, 1, 1, 1, 1, 1,
0.1229705, -1.275558, 2.987086, 1, 1, 1, 1, 1,
0.124594, -0.4252749, 1.117002, 1, 1, 1, 1, 1,
0.1281109, -0.3655085, 2.100064, 1, 1, 1, 1, 1,
0.1290765, -0.237848, 1.924258, 1, 1, 1, 1, 1,
0.1308163, -0.6590586, 4.566149, 1, 1, 1, 1, 1,
0.1324696, 1.203803, -0.2528906, 1, 1, 1, 1, 1,
0.1370247, 0.2446049, 0.7334754, 1, 1, 1, 1, 1,
0.1452621, -0.4143702, 3.078773, 0, 0, 1, 1, 1,
0.1453944, -0.1203008, 1.910841, 1, 0, 0, 1, 1,
0.1460468, 0.841157, 1.011913, 1, 0, 0, 1, 1,
0.1496211, -2.062714, 2.511897, 1, 0, 0, 1, 1,
0.1544311, 0.09473839, 2.1239, 1, 0, 0, 1, 1,
0.1579729, 1.150772, -2.328454, 1, 0, 0, 1, 1,
0.16309, -1.035576, -0.1687016, 0, 0, 0, 1, 1,
0.16699, 0.9576507, 0.6061828, 0, 0, 0, 1, 1,
0.1671034, 0.6137519, -1.657702, 0, 0, 0, 1, 1,
0.1694842, 2.530604, 0.3961289, 0, 0, 0, 1, 1,
0.1724204, 0.9987483, 1.407145, 0, 0, 0, 1, 1,
0.1729523, 1.544832, 0.02530123, 0, 0, 0, 1, 1,
0.175339, 2.065517, -1.715244, 0, 0, 0, 1, 1,
0.1767475, -0.2283502, 0.7813598, 1, 1, 1, 1, 1,
0.1776226, 0.04118117, 2.249331, 1, 1, 1, 1, 1,
0.1892812, 0.3923607, 1.773076, 1, 1, 1, 1, 1,
0.1948676, -2.231428, 2.412368, 1, 1, 1, 1, 1,
0.1981954, -0.4389676, 1.002156, 1, 1, 1, 1, 1,
0.1984393, 0.7084948, 0.4341653, 1, 1, 1, 1, 1,
0.2015808, -0.9656854, 3.178537, 1, 1, 1, 1, 1,
0.2026389, -1.625011, 1.31218, 1, 1, 1, 1, 1,
0.2026762, -1.069361, 2.445886, 1, 1, 1, 1, 1,
0.206631, 1.61751, 0.8193576, 1, 1, 1, 1, 1,
0.2097435, 0.02741033, 2.248419, 1, 1, 1, 1, 1,
0.2106928, -0.4202417, 3.427029, 1, 1, 1, 1, 1,
0.2110574, 1.559122, -0.04639034, 1, 1, 1, 1, 1,
0.2151577, 2.699259, 1.189592, 1, 1, 1, 1, 1,
0.2161437, -0.03852643, 0.8852705, 1, 1, 1, 1, 1,
0.2174007, 0.604987, -1.201444, 0, 0, 1, 1, 1,
0.2176313, 0.7168311, -0.912466, 1, 0, 0, 1, 1,
0.2197442, 0.09058585, 1.719309, 1, 0, 0, 1, 1,
0.2244228, -0.4490816, 3.909783, 1, 0, 0, 1, 1,
0.2258885, -0.3388152, 3.091231, 1, 0, 0, 1, 1,
0.2283503, 0.1749068, -0.09067525, 1, 0, 0, 1, 1,
0.2467662, 0.957468, -0.4448929, 0, 0, 0, 1, 1,
0.2492111, 0.05430495, 3.56474, 0, 0, 0, 1, 1,
0.2509058, -0.6458557, 1.989138, 0, 0, 0, 1, 1,
0.2540524, -0.6518483, 0.8584312, 0, 0, 0, 1, 1,
0.2552332, 0.7902589, -0.4316693, 0, 0, 0, 1, 1,
0.2581593, 0.5741946, 0.4966954, 0, 0, 0, 1, 1,
0.2583637, -0.07826968, 2.406125, 0, 0, 0, 1, 1,
0.2587971, -0.1468437, 2.221392, 1, 1, 1, 1, 1,
0.2594512, -2.822156, 1.631457, 1, 1, 1, 1, 1,
0.2623169, 0.5310357, 0.4032054, 1, 1, 1, 1, 1,
0.2662333, 0.1375875, 0.363716, 1, 1, 1, 1, 1,
0.2668338, 0.2666751, -0.4320181, 1, 1, 1, 1, 1,
0.2683683, 1.405687, -0.872188, 1, 1, 1, 1, 1,
0.2702171, -0.6953322, 3.595283, 1, 1, 1, 1, 1,
0.2706438, 0.2924885, 0.3634571, 1, 1, 1, 1, 1,
0.2718099, -0.3706651, 4.495378, 1, 1, 1, 1, 1,
0.2722321, -1.061951, 3.389733, 1, 1, 1, 1, 1,
0.2764961, 0.3182386, -0.01484788, 1, 1, 1, 1, 1,
0.2765216, -1.044005, 3.181068, 1, 1, 1, 1, 1,
0.281831, 2.129328, -0.2814529, 1, 1, 1, 1, 1,
0.2836677, -0.75972, 3.098747, 1, 1, 1, 1, 1,
0.2880266, -0.9097168, 2.226754, 1, 1, 1, 1, 1,
0.2896557, 0.7353988, -0.8384982, 0, 0, 1, 1, 1,
0.289692, -1.115082, 3.544532, 1, 0, 0, 1, 1,
0.291624, 1.33625, -0.7950295, 1, 0, 0, 1, 1,
0.2917176, -0.5361165, 2.352584, 1, 0, 0, 1, 1,
0.2917887, -1.077902, 2.854967, 1, 0, 0, 1, 1,
0.2926111, 0.02894361, 0.6318818, 1, 0, 0, 1, 1,
0.2940624, -0.6067981, 2.242063, 0, 0, 0, 1, 1,
0.2961735, -1.007323, 3.128906, 0, 0, 0, 1, 1,
0.2963976, -0.2195264, 1.377123, 0, 0, 0, 1, 1,
0.2966949, 0.6129541, 1.556131, 0, 0, 0, 1, 1,
0.3002024, 0.001511889, 1.612431, 0, 0, 0, 1, 1,
0.3003153, -1.027556, 1.931746, 0, 0, 0, 1, 1,
0.302166, -0.4990726, 2.57806, 0, 0, 0, 1, 1,
0.3072451, -0.8860402, 4.10436, 1, 1, 1, 1, 1,
0.3074639, 1.18716, 0.7666092, 1, 1, 1, 1, 1,
0.3098455, -0.1993191, 3.065127, 1, 1, 1, 1, 1,
0.3110359, -0.2982984, 2.031084, 1, 1, 1, 1, 1,
0.3125036, 1.120922, -0.03973098, 1, 1, 1, 1, 1,
0.3125895, -0.1317615, 3.25672, 1, 1, 1, 1, 1,
0.313737, -0.739844, 2.183303, 1, 1, 1, 1, 1,
0.3154427, 0.6350686, -0.193948, 1, 1, 1, 1, 1,
0.3177928, -1.15337, 2.25813, 1, 1, 1, 1, 1,
0.32317, -0.1675407, 1.828912, 1, 1, 1, 1, 1,
0.328535, -0.8071602, 1.563825, 1, 1, 1, 1, 1,
0.3299583, -0.264882, 2.76121, 1, 1, 1, 1, 1,
0.3307378, 0.3509607, 0.7186275, 1, 1, 1, 1, 1,
0.3316634, -0.6783198, 3.438927, 1, 1, 1, 1, 1,
0.3351445, 0.489163, 1.200387, 1, 1, 1, 1, 1,
0.340723, 0.6798526, -1.09521, 0, 0, 1, 1, 1,
0.3433006, 0.9862102, -0.2252724, 1, 0, 0, 1, 1,
0.348216, -0.471797, 2.715156, 1, 0, 0, 1, 1,
0.356109, -2.171261, 5.661524, 1, 0, 0, 1, 1,
0.3573458, -1.564969, 3.018008, 1, 0, 0, 1, 1,
0.3590372, -1.336951, 3.942874, 1, 0, 0, 1, 1,
0.3594466, 0.2552001, -0.8073755, 0, 0, 0, 1, 1,
0.3654409, -1.072882, 3.710387, 0, 0, 0, 1, 1,
0.3662076, -1.20697, 3.31851, 0, 0, 0, 1, 1,
0.3681153, 1.806322, -0.900499, 0, 0, 0, 1, 1,
0.3692585, 0.9429274, 1.261334, 0, 0, 0, 1, 1,
0.3734507, 0.2395294, 0.5919987, 0, 0, 0, 1, 1,
0.3766507, -0.4953291, 1.852735, 0, 0, 0, 1, 1,
0.3791415, -0.2546776, 1.529748, 1, 1, 1, 1, 1,
0.3811797, -1.433118, 2.896333, 1, 1, 1, 1, 1,
0.381626, 1.669038, 0.4477926, 1, 1, 1, 1, 1,
0.3836744, 0.7834246, 1.024773, 1, 1, 1, 1, 1,
0.3853099, -1.532331, 2.688516, 1, 1, 1, 1, 1,
0.3853878, -1.944986, 3.123237, 1, 1, 1, 1, 1,
0.3955548, -0.7188812, 0.9948448, 1, 1, 1, 1, 1,
0.3979484, -1.714422, 2.202561, 1, 1, 1, 1, 1,
0.3985749, 0.6661158, -0.1970868, 1, 1, 1, 1, 1,
0.4029296, 0.02864037, -0.2191098, 1, 1, 1, 1, 1,
0.4059277, 1.974799, 0.2296651, 1, 1, 1, 1, 1,
0.4090953, -0.1535846, 0.4815354, 1, 1, 1, 1, 1,
0.4104965, 0.4846293, -0.5280997, 1, 1, 1, 1, 1,
0.4132625, -1.482521, 1.742017, 1, 1, 1, 1, 1,
0.4189413, 0.6397147, 1.39777, 1, 1, 1, 1, 1,
0.4249738, -0.9656008, 2.135183, 0, 0, 1, 1, 1,
0.4250428, -0.8317662, 3.487951, 1, 0, 0, 1, 1,
0.426662, -0.5993533, 3.139141, 1, 0, 0, 1, 1,
0.4271954, 1.197554, 0.4167199, 1, 0, 0, 1, 1,
0.4297103, -0.6846927, 1.606964, 1, 0, 0, 1, 1,
0.4301506, 1.241771, 0.500379, 1, 0, 0, 1, 1,
0.4367667, 0.6941364, -0.2844522, 0, 0, 0, 1, 1,
0.4405919, 0.4183921, 0.9769638, 0, 0, 0, 1, 1,
0.4421759, -1.749468, 2.721434, 0, 0, 0, 1, 1,
0.445117, 1.763154, 0.4864949, 0, 0, 0, 1, 1,
0.447067, 0.3100773, 1.387736, 0, 0, 0, 1, 1,
0.4487899, 1.315429, -0.280304, 0, 0, 0, 1, 1,
0.4511754, -2.612222, 2.849419, 0, 0, 0, 1, 1,
0.4518093, 1.352835, 0.7271535, 1, 1, 1, 1, 1,
0.4545304, 1.632113, 0.6966746, 1, 1, 1, 1, 1,
0.4567606, -0.9598719, 1.650896, 1, 1, 1, 1, 1,
0.4594474, -0.1572188, 2.18922, 1, 1, 1, 1, 1,
0.460191, 0.2408786, 0.8964202, 1, 1, 1, 1, 1,
0.4628819, 0.897565, -1.539431, 1, 1, 1, 1, 1,
0.4646646, -0.1907474, 2.522369, 1, 1, 1, 1, 1,
0.4649207, -0.4556993, 2.818107, 1, 1, 1, 1, 1,
0.4663354, 1.464406, -0.7274341, 1, 1, 1, 1, 1,
0.4689049, 0.7622755, 1.171459, 1, 1, 1, 1, 1,
0.4719538, -0.4367465, 0.6879478, 1, 1, 1, 1, 1,
0.4812526, 0.6676002, -0.3225318, 1, 1, 1, 1, 1,
0.4862839, -0.8001683, 3.43686, 1, 1, 1, 1, 1,
0.4867081, -0.4375055, 1.363724, 1, 1, 1, 1, 1,
0.4896763, 0.7245087, 1.170198, 1, 1, 1, 1, 1,
0.4903668, 0.7001541, 0.1043454, 0, 0, 1, 1, 1,
0.4965437, -1.928321, 2.786472, 1, 0, 0, 1, 1,
0.4979345, 1.431756, 0.8334264, 1, 0, 0, 1, 1,
0.4981408, 0.5386175, 0.1043326, 1, 0, 0, 1, 1,
0.5037183, 1.564985, 0.06811111, 1, 0, 0, 1, 1,
0.5046778, 0.5941929, 1.457975, 1, 0, 0, 1, 1,
0.5090923, 0.6511087, 0.8124624, 0, 0, 0, 1, 1,
0.5144338, -0.1995256, 0.3350704, 0, 0, 0, 1, 1,
0.5156813, -1.423302, 2.588922, 0, 0, 0, 1, 1,
0.5175037, 0.445294, -0.3814873, 0, 0, 0, 1, 1,
0.5191211, -0.2240322, 2.989352, 0, 0, 0, 1, 1,
0.5193455, 1.528448, 0.7737979, 0, 0, 0, 1, 1,
0.5205017, -1.319621, 3.011651, 0, 0, 0, 1, 1,
0.5302622, 0.4177051, 1.849543, 1, 1, 1, 1, 1,
0.5358185, 0.808367, -0.5509844, 1, 1, 1, 1, 1,
0.5430814, -0.9830328, 3.669873, 1, 1, 1, 1, 1,
0.5475421, 0.4664536, 1.862646, 1, 1, 1, 1, 1,
0.5482935, -0.8175761, 2.765992, 1, 1, 1, 1, 1,
0.5490448, -0.2237336, 3.325553, 1, 1, 1, 1, 1,
0.5509102, -0.1526971, 2.922323, 1, 1, 1, 1, 1,
0.5510464, -1.012798, 1.705712, 1, 1, 1, 1, 1,
0.5512034, -1.327743, 1.351763, 1, 1, 1, 1, 1,
0.5528874, 1.54921, 0.1737151, 1, 1, 1, 1, 1,
0.5547764, 2.101012, 0.729907, 1, 1, 1, 1, 1,
0.5556091, -0.3429363, 2.950313, 1, 1, 1, 1, 1,
0.5631461, 0.001754136, 1.726436, 1, 1, 1, 1, 1,
0.5634627, -0.9129385, 3.733723, 1, 1, 1, 1, 1,
0.5642669, 0.2804643, 1.747975, 1, 1, 1, 1, 1,
0.567525, -1.962104, 2.216605, 0, 0, 1, 1, 1,
0.5765445, -0.1414815, 2.894719, 1, 0, 0, 1, 1,
0.5782207, -0.188137, 2.14711, 1, 0, 0, 1, 1,
0.5800046, 0.2047585, 2.592784, 1, 0, 0, 1, 1,
0.5801147, -0.4594105, 3.285452, 1, 0, 0, 1, 1,
0.5835333, 0.1619098, 0.5140168, 1, 0, 0, 1, 1,
0.5864313, -0.6028649, 3.486853, 0, 0, 0, 1, 1,
0.5893313, 0.445214, 0.9109523, 0, 0, 0, 1, 1,
0.5920846, 0.2786217, 1.158694, 0, 0, 0, 1, 1,
0.5921852, -1.307491, 2.476406, 0, 0, 0, 1, 1,
0.598411, 0.5531774, 0.805348, 0, 0, 0, 1, 1,
0.6022431, -0.2661171, 1.503631, 0, 0, 0, 1, 1,
0.60456, 0.1021814, 1.765758, 0, 0, 0, 1, 1,
0.6133932, -0.2358264, 1.713806, 1, 1, 1, 1, 1,
0.6161807, 0.3671741, 1.434767, 1, 1, 1, 1, 1,
0.6244144, 0.5941445, 0.223842, 1, 1, 1, 1, 1,
0.6249052, 0.6431077, 2.343866, 1, 1, 1, 1, 1,
0.6337355, -0.7146434, 3.940336, 1, 1, 1, 1, 1,
0.6384196, -2.461202, 3.216311, 1, 1, 1, 1, 1,
0.6388942, -1.000201, 2.485236, 1, 1, 1, 1, 1,
0.6409476, -0.4716064, 2.375937, 1, 1, 1, 1, 1,
0.6416921, 0.6232266, 2.132646, 1, 1, 1, 1, 1,
0.6434393, 0.7979016, 1.464905, 1, 1, 1, 1, 1,
0.6517434, -0.147496, 1.764633, 1, 1, 1, 1, 1,
0.6527725, 1.876626, -0.2835658, 1, 1, 1, 1, 1,
0.657189, -1.501707, 4.530067, 1, 1, 1, 1, 1,
0.6592584, 0.9743846, 1.501939, 1, 1, 1, 1, 1,
0.6620424, 0.9467523, 1.458434, 1, 1, 1, 1, 1,
0.6650959, 0.877773, 1.395128, 0, 0, 1, 1, 1,
0.67069, 0.2141616, 1.804658, 1, 0, 0, 1, 1,
0.6729268, -0.04623579, 2.151639, 1, 0, 0, 1, 1,
0.6749182, 1.819949, 0.8842971, 1, 0, 0, 1, 1,
0.6755531, 0.6199474, 0.7078677, 1, 0, 0, 1, 1,
0.6778455, 0.191899, 1.377224, 1, 0, 0, 1, 1,
0.6790082, 0.03963981, 1.332928, 0, 0, 0, 1, 1,
0.6799009, -0.799456, 1.509362, 0, 0, 0, 1, 1,
0.6804683, -0.8969907, 2.126894, 0, 0, 0, 1, 1,
0.6830299, -0.1552003, 2.412397, 0, 0, 0, 1, 1,
0.6913199, -0.6166793, 3.799568, 0, 0, 0, 1, 1,
0.6938143, 0.09664414, 2.348735, 0, 0, 0, 1, 1,
0.6949412, -0.1067947, -0.03453429, 0, 0, 0, 1, 1,
0.6950127, 1.572968, -0.3667139, 1, 1, 1, 1, 1,
0.6968629, -0.9227177, 1.620516, 1, 1, 1, 1, 1,
0.7039244, -0.3662569, 2.348309, 1, 1, 1, 1, 1,
0.7066436, 0.2420855, 2.822464, 1, 1, 1, 1, 1,
0.71343, -1.00762, 3.335029, 1, 1, 1, 1, 1,
0.7196957, -0.494783, 0.9115918, 1, 1, 1, 1, 1,
0.721451, -0.3132287, 2.533164, 1, 1, 1, 1, 1,
0.7235262, 0.8730668, 1.98926, 1, 1, 1, 1, 1,
0.729069, -1.163351, 2.635014, 1, 1, 1, 1, 1,
0.7303544, 0.838278, 1.333801, 1, 1, 1, 1, 1,
0.7321938, -1.231787, 3.126677, 1, 1, 1, 1, 1,
0.7335054, 0.8229164, 1.634914, 1, 1, 1, 1, 1,
0.734256, -0.5443253, 3.303896, 1, 1, 1, 1, 1,
0.7346534, 0.03401444, 0.6744025, 1, 1, 1, 1, 1,
0.7388845, 1.482496, 1.020347, 1, 1, 1, 1, 1,
0.7414383, -1.071596, 2.496478, 0, 0, 1, 1, 1,
0.7436393, 0.470037, 0.9835759, 1, 0, 0, 1, 1,
0.7458212, -0.417913, 3.214015, 1, 0, 0, 1, 1,
0.7512701, 0.4777629, 1.609702, 1, 0, 0, 1, 1,
0.7592747, -0.456166, 2.875848, 1, 0, 0, 1, 1,
0.7609935, 1.392606, 0.1844755, 1, 0, 0, 1, 1,
0.7786494, -0.3270226, 2.492335, 0, 0, 0, 1, 1,
0.7791083, 1.09217, 0.5411329, 0, 0, 0, 1, 1,
0.7817793, -0.2890746, 1.414267, 0, 0, 0, 1, 1,
0.7834434, 1.330566, -0.4151149, 0, 0, 0, 1, 1,
0.7860124, 1.507945, 0.1864229, 0, 0, 0, 1, 1,
0.7870544, 0.1290479, 1.530718, 0, 0, 0, 1, 1,
0.7891389, 0.4029653, 1.344984, 0, 0, 0, 1, 1,
0.791053, 1.605766, -0.3132081, 1, 1, 1, 1, 1,
0.7920074, -0.2709904, 2.972239, 1, 1, 1, 1, 1,
0.7922887, 0.06488205, 1.586369, 1, 1, 1, 1, 1,
0.7923729, -1.562991, 2.599761, 1, 1, 1, 1, 1,
0.7985387, 0.1983681, 0.5428113, 1, 1, 1, 1, 1,
0.8007907, 0.689848, 1.651879, 1, 1, 1, 1, 1,
0.8052503, -0.5859296, 1.534279, 1, 1, 1, 1, 1,
0.8068569, -0.1094849, 2.783696, 1, 1, 1, 1, 1,
0.8072392, 1.354774, -0.3946662, 1, 1, 1, 1, 1,
0.8116237, -0.007572745, 2.296177, 1, 1, 1, 1, 1,
0.8116803, 1.057033, -0.2470363, 1, 1, 1, 1, 1,
0.8190444, -0.5809394, 3.546242, 1, 1, 1, 1, 1,
0.8220644, 0.9643947, -0.4155744, 1, 1, 1, 1, 1,
0.831546, 0.3702321, 1.899093, 1, 1, 1, 1, 1,
0.8338322, 0.3676277, 2.284285, 1, 1, 1, 1, 1,
0.8389653, -0.2067466, 3.408901, 0, 0, 1, 1, 1,
0.8393134, 0.5152128, -0.06241986, 1, 0, 0, 1, 1,
0.8414441, -0.4509005, 1.471355, 1, 0, 0, 1, 1,
0.8444323, 0.06897853, 1.935738, 1, 0, 0, 1, 1,
0.8457503, -0.4877704, 3.202098, 1, 0, 0, 1, 1,
0.8495715, -0.5794801, 1.495492, 1, 0, 0, 1, 1,
0.8509407, 0.06050284, 2.920888, 0, 0, 0, 1, 1,
0.857812, -0.883642, 2.363283, 0, 0, 0, 1, 1,
0.8597403, 0.3603358, -0.3704586, 0, 0, 0, 1, 1,
0.8627526, -1.695194, 3.393746, 0, 0, 0, 1, 1,
0.8654242, 0.819029, 0.7522578, 0, 0, 0, 1, 1,
0.8671464, -0.08636835, 1.538651, 0, 0, 0, 1, 1,
0.8672117, 0.08511852, 1.827592, 0, 0, 0, 1, 1,
0.8712934, 1.879774, -1.096323, 1, 1, 1, 1, 1,
0.8740569, 0.5566562, 2.37772, 1, 1, 1, 1, 1,
0.8788202, 1.361181, 0.9278263, 1, 1, 1, 1, 1,
0.8868046, -0.2291766, 0.5236241, 1, 1, 1, 1, 1,
0.8933542, 0.3386456, 0.5411533, 1, 1, 1, 1, 1,
0.8951735, 0.2800944, 2.887067, 1, 1, 1, 1, 1,
0.9012572, -0.6971874, 1.991268, 1, 1, 1, 1, 1,
0.9094112, -0.5940511, 2.193924, 1, 1, 1, 1, 1,
0.9157039, 0.1476227, 0.6837857, 1, 1, 1, 1, 1,
0.9236651, 0.6822757, 1.735975, 1, 1, 1, 1, 1,
0.9264065, 1.380161, 1.80854, 1, 1, 1, 1, 1,
0.9295487, 0.1982765, 1.655346, 1, 1, 1, 1, 1,
0.9357135, -0.7876359, 1.914355, 1, 1, 1, 1, 1,
0.9381284, 0.07358117, 0.6630613, 1, 1, 1, 1, 1,
0.9472036, -0.7615998, 2.862507, 1, 1, 1, 1, 1,
0.9520206, -0.5224571, -0.1085764, 0, 0, 1, 1, 1,
0.9545091, -1.096995, 1.224495, 1, 0, 0, 1, 1,
0.9579551, 0.1435342, 1.894783, 1, 0, 0, 1, 1,
0.958465, 0.9552593, 2.751341, 1, 0, 0, 1, 1,
0.9638513, -1.511783, 3.109596, 1, 0, 0, 1, 1,
0.9645038, 0.1272891, 1.410653, 1, 0, 0, 1, 1,
0.9647252, 0.2810991, 1.31381, 0, 0, 0, 1, 1,
0.9657539, -0.3055306, 2.087106, 0, 0, 0, 1, 1,
0.9663933, -0.03246115, 1.022225, 0, 0, 0, 1, 1,
0.9679509, 0.4698384, 1.061436, 0, 0, 0, 1, 1,
0.9754675, -0.7958183, 2.045545, 0, 0, 0, 1, 1,
0.982145, 0.354084, 2.535395, 0, 0, 0, 1, 1,
0.9845549, -0.1270162, 0.6154048, 0, 0, 0, 1, 1,
0.9921774, -0.5622454, 1.488408, 1, 1, 1, 1, 1,
0.9929497, 0.07649727, 0.6416337, 1, 1, 1, 1, 1,
0.9992547, 0.01180264, 1.253243, 1, 1, 1, 1, 1,
1.000501, 0.1296487, 2.602127, 1, 1, 1, 1, 1,
1.002412, 0.9480212, -0.2628247, 1, 1, 1, 1, 1,
1.005244, -0.01052338, 1.336053, 1, 1, 1, 1, 1,
1.0114, 0.4270654, 2.135899, 1, 1, 1, 1, 1,
1.012983, 0.2422535, 0.1964993, 1, 1, 1, 1, 1,
1.031713, -1.555756, 2.413934, 1, 1, 1, 1, 1,
1.038387, 2.280943, 1.340219, 1, 1, 1, 1, 1,
1.040094, 0.6001727, 0.7685245, 1, 1, 1, 1, 1,
1.041261, -0.4846703, 0.2400642, 1, 1, 1, 1, 1,
1.049551, -0.7394291, 3.644988, 1, 1, 1, 1, 1,
1.053077, -0.6724822, 1.253386, 1, 1, 1, 1, 1,
1.063793, 1.777823, 0.5472676, 1, 1, 1, 1, 1,
1.068406, 0.3791554, 1.147167, 0, 0, 1, 1, 1,
1.068562, -0.7653388, 2.548807, 1, 0, 0, 1, 1,
1.073388, -0.3693169, 1.894057, 1, 0, 0, 1, 1,
1.084861, 0.578595, 0.02648339, 1, 0, 0, 1, 1,
1.09199, -1.281824, 1.15672, 1, 0, 0, 1, 1,
1.098876, -0.1937379, 0.06540064, 1, 0, 0, 1, 1,
1.099836, 0.5675306, 0.9595171, 0, 0, 0, 1, 1,
1.100547, -0.6698497, 2.061079, 0, 0, 0, 1, 1,
1.11112, 0.1157233, 0.1046284, 0, 0, 0, 1, 1,
1.116421, -1.270868, 2.417104, 0, 0, 0, 1, 1,
1.121946, -0.03114031, 1.994023, 0, 0, 0, 1, 1,
1.124428, -1.560525, 2.156022, 0, 0, 0, 1, 1,
1.135406, 0.5075903, 0.1745804, 0, 0, 0, 1, 1,
1.139655, -1.161868, 2.492343, 1, 1, 1, 1, 1,
1.142611, -0.9040945, 1.704639, 1, 1, 1, 1, 1,
1.143712, -0.8375787, 1.424258, 1, 1, 1, 1, 1,
1.146746, -1.826398, 2.137412, 1, 1, 1, 1, 1,
1.14763, 0.5533291, 2.738457, 1, 1, 1, 1, 1,
1.158005, -0.0601016, 0.4052078, 1, 1, 1, 1, 1,
1.15891, 0.1380055, 0.8019153, 1, 1, 1, 1, 1,
1.159022, 0.8625758, 0.8852261, 1, 1, 1, 1, 1,
1.163489, -0.9461518, 2.463821, 1, 1, 1, 1, 1,
1.169399, -0.6656173, 2.25924, 1, 1, 1, 1, 1,
1.172369, 1.79196, 1.048617, 1, 1, 1, 1, 1,
1.174472, -0.776427, 0.9967873, 1, 1, 1, 1, 1,
1.176393, 0.9754971, 0.5915073, 1, 1, 1, 1, 1,
1.1824, 0.1412163, -0.7164939, 1, 1, 1, 1, 1,
1.184571, 2.002999, 0.2060481, 1, 1, 1, 1, 1,
1.186627, -2.49699, 2.44996, 0, 0, 1, 1, 1,
1.196453, 0.7368034, 0.6848326, 1, 0, 0, 1, 1,
1.198708, 0.3705408, 1.336381, 1, 0, 0, 1, 1,
1.207815, -2.179762, 2.834558, 1, 0, 0, 1, 1,
1.21005, -1.986795, 3.510174, 1, 0, 0, 1, 1,
1.222296, 1.119216, 1.519501, 1, 0, 0, 1, 1,
1.223568, 0.8949861, 1.54967, 0, 0, 0, 1, 1,
1.223954, -1.364594, 4.977376, 0, 0, 0, 1, 1,
1.228171, 1.567838, 0.8598077, 0, 0, 0, 1, 1,
1.231996, -0.2331423, 0.2949805, 0, 0, 0, 1, 1,
1.23228, 0.3232733, 2.682605, 0, 0, 0, 1, 1,
1.24272, -0.04876406, 1.70296, 0, 0, 0, 1, 1,
1.247475, 0.5260574, 2.292093, 0, 0, 0, 1, 1,
1.249279, -1.026381, 2.135566, 1, 1, 1, 1, 1,
1.255967, 0.1700346, 2.166317, 1, 1, 1, 1, 1,
1.25647, -0.40186, 0.6790171, 1, 1, 1, 1, 1,
1.259716, 0.8231639, 1.332141, 1, 1, 1, 1, 1,
1.263996, 2.09749, -1.106043, 1, 1, 1, 1, 1,
1.274466, -0.04903242, 1.487884, 1, 1, 1, 1, 1,
1.302583, -1.416661, 1.857397, 1, 1, 1, 1, 1,
1.308669, -0.7179338, 1.665551, 1, 1, 1, 1, 1,
1.315838, -0.3598314, -0.2610307, 1, 1, 1, 1, 1,
1.327802, 2.248122, 2.357129, 1, 1, 1, 1, 1,
1.335302, -2.055165, 0.8944646, 1, 1, 1, 1, 1,
1.33598, 0.5975055, -0.09027749, 1, 1, 1, 1, 1,
1.353526, 1.38286, 0.02779196, 1, 1, 1, 1, 1,
1.355125, -1.064777, 2.994452, 1, 1, 1, 1, 1,
1.356142, -0.07812778, 0.5914426, 1, 1, 1, 1, 1,
1.363412, -1.232, 2.182389, 0, 0, 1, 1, 1,
1.367773, 0.1216493, 0.8198985, 1, 0, 0, 1, 1,
1.371766, 0.316162, 1.760979, 1, 0, 0, 1, 1,
1.38533, 1.375276, 0.4138654, 1, 0, 0, 1, 1,
1.38787, -0.4979273, 2.116768, 1, 0, 0, 1, 1,
1.388509, 0.4301524, 1.626549, 1, 0, 0, 1, 1,
1.390514, 0.6225741, 3.059654, 0, 0, 0, 1, 1,
1.39207, -0.4318818, 2.013877, 0, 0, 0, 1, 1,
1.392646, 0.5184401, 1.464933, 0, 0, 0, 1, 1,
1.396602, -0.5773891, 2.074149, 0, 0, 0, 1, 1,
1.408491, -1.136861, 3.056153, 0, 0, 0, 1, 1,
1.411828, 1.093276, 1.360532, 0, 0, 0, 1, 1,
1.419605, -1.972322, 3.168647, 0, 0, 0, 1, 1,
1.449455, -1.319979, 2.987889, 1, 1, 1, 1, 1,
1.465841, -0.8120122, 3.303494, 1, 1, 1, 1, 1,
1.476539, 0.160514, 1.114465, 1, 1, 1, 1, 1,
1.484211, 1.892878, 0.6453139, 1, 1, 1, 1, 1,
1.485865, -0.1095413, -0.3488393, 1, 1, 1, 1, 1,
1.486572, 1.558861, 0.5102746, 1, 1, 1, 1, 1,
1.488232, -0.354431, 1.015142, 1, 1, 1, 1, 1,
1.501753, 0.4573065, 0.5068005, 1, 1, 1, 1, 1,
1.508693, -1.035184, 0.5919523, 1, 1, 1, 1, 1,
1.523404, -0.2056873, 1.241272, 1, 1, 1, 1, 1,
1.537417, 0.7177534, 1.512273, 1, 1, 1, 1, 1,
1.53823, 1.564354, 2.709019, 1, 1, 1, 1, 1,
1.553807, 0.1248097, 1.578531, 1, 1, 1, 1, 1,
1.603097, 1.292137, 0.5929162, 1, 1, 1, 1, 1,
1.609059, -0.6977487, 2.788939, 1, 1, 1, 1, 1,
1.618335, -0.3778855, 1.129278, 0, 0, 1, 1, 1,
1.623004, -2.061774, 3.744476, 1, 0, 0, 1, 1,
1.64948, 2.112214, 0.3466309, 1, 0, 0, 1, 1,
1.652914, 0.5691864, 1.257619, 1, 0, 0, 1, 1,
1.708458, 0.1859062, 0.005351697, 1, 0, 0, 1, 1,
1.719134, -0.1843816, 1.453604, 1, 0, 0, 1, 1,
1.72202, 2.101303, -0.6496583, 0, 0, 0, 1, 1,
1.726045, -0.1607379, 2.108317, 0, 0, 0, 1, 1,
1.730523, 0.8087342, -0.2196869, 0, 0, 0, 1, 1,
1.733003, 0.2951329, 2.330962, 0, 0, 0, 1, 1,
1.758871, 0.5167381, 3.116843, 0, 0, 0, 1, 1,
1.76306, 0.4035847, 2.545366, 0, 0, 0, 1, 1,
1.771266, 0.8066083, -0.01832332, 0, 0, 0, 1, 1,
1.789666, 1.219097, -1.004547, 1, 1, 1, 1, 1,
1.794159, -0.05261545, 2.252763, 1, 1, 1, 1, 1,
1.797398, 0.2732588, 1.976551, 1, 1, 1, 1, 1,
1.802555, -1.44256, 3.181765, 1, 1, 1, 1, 1,
1.81897, 1.395104, -0.885377, 1, 1, 1, 1, 1,
1.839251, 0.4908867, 1.964751, 1, 1, 1, 1, 1,
1.859836, -0.9315575, 1.140148, 1, 1, 1, 1, 1,
1.863286, -0.8798639, 1.634385, 1, 1, 1, 1, 1,
1.86594, 1.403629, 0.5890012, 1, 1, 1, 1, 1,
1.877325, 0.567585, 2.628924, 1, 1, 1, 1, 1,
1.896711, -0.4210944, 1.32303, 1, 1, 1, 1, 1,
1.913767, 1.861133, 1.047295, 1, 1, 1, 1, 1,
1.91775, 1.158183, 1.642249, 1, 1, 1, 1, 1,
1.927593, -0.5250542, 1.050388, 1, 1, 1, 1, 1,
1.950139, 0.3041343, 1.683833, 1, 1, 1, 1, 1,
1.975374, 1.418914, 2.55907, 0, 0, 1, 1, 1,
1.985573, 2.973299, 1.810254, 1, 0, 0, 1, 1,
1.994344, 0.9576873, 0.8594837, 1, 0, 0, 1, 1,
2.07103, -0.9417995, 1.394358, 1, 0, 0, 1, 1,
2.088538, -0.03717902, -0.1475843, 1, 0, 0, 1, 1,
2.100988, 0.8963218, 1.659974, 1, 0, 0, 1, 1,
2.126172, -1.166659, 2.061902, 0, 0, 0, 1, 1,
2.138552, 1.343616, 0.1240233, 0, 0, 0, 1, 1,
2.148198, -1.38441, 3.039388, 0, 0, 0, 1, 1,
2.153294, -0.1588764, 3.273629, 0, 0, 0, 1, 1,
2.15519, 1.528873, 1.596298, 0, 0, 0, 1, 1,
2.257278, -1.108621, 1.884971, 0, 0, 0, 1, 1,
2.301386, -0.6687189, 2.147485, 0, 0, 0, 1, 1,
2.316397, 0.6174343, 5.523784, 1, 1, 1, 1, 1,
2.458442, 1.442893, 1.889847, 1, 1, 1, 1, 1,
2.515308, 1.039072, 1.31573, 1, 1, 1, 1, 1,
2.580062, -0.3077292, 1.436748, 1, 1, 1, 1, 1,
2.752181, -0.04543977, 0.520725, 1, 1, 1, 1, 1,
2.912817, 0.3423492, 2.412174, 1, 1, 1, 1, 1,
2.954253, 1.057705, 1.595021, 1, 1, 1, 1, 1
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
var radius = 9.810659;
var distance = 34.45953;
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
mvMatrix.translate( -0.04308438, 0.4537894, 0.02041554 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.45953);
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
