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
-2.698713, -0.4645482, -2.129668, 1, 0, 0, 1,
-2.640146, 0.09498511, -2.128636, 1, 0.007843138, 0, 1,
-2.629459, -2.006255, -0.573546, 1, 0.01176471, 0, 1,
-2.60624, 0.2614269, -0.7743611, 1, 0.01960784, 0, 1,
-2.585674, 1.175014, -0.01045659, 1, 0.02352941, 0, 1,
-2.582728, 1.229168, -1.378839, 1, 0.03137255, 0, 1,
-2.578025, 0.6314372, -1.036128, 1, 0.03529412, 0, 1,
-2.553402, -0.2164657, -3.182225, 1, 0.04313726, 0, 1,
-2.527369, -0.9479955, -2.819357, 1, 0.04705882, 0, 1,
-2.440981, 0.2010297, -0.9045843, 1, 0.05490196, 0, 1,
-2.365594, 0.3894846, -2.375641, 1, 0.05882353, 0, 1,
-2.320657, 1.179167, -0.4268206, 1, 0.06666667, 0, 1,
-2.319706, -3.193292, -2.23519, 1, 0.07058824, 0, 1,
-2.234879, -1.488601, -2.241915, 1, 0.07843138, 0, 1,
-2.15691, 0.4128971, -0.8995212, 1, 0.08235294, 0, 1,
-2.093511, -0.3231179, -2.288476, 1, 0.09019608, 0, 1,
-2.086115, -0.6794937, -1.620898, 1, 0.09411765, 0, 1,
-2.06073, 2.995659, -2.202837, 1, 0.1019608, 0, 1,
-2.041568, -1.069864, -1.209108, 1, 0.1098039, 0, 1,
-2.013844, -0.8372088, -1.462065, 1, 0.1137255, 0, 1,
-1.996061, 0.3550409, -0.4788348, 1, 0.1215686, 0, 1,
-1.981026, 0.1590254, -1.492615, 1, 0.1254902, 0, 1,
-1.974505, -1.190459, -2.652377, 1, 0.1333333, 0, 1,
-1.930803, 1.689955, 0.5770819, 1, 0.1372549, 0, 1,
-1.913368, 0.4622284, -2.724788, 1, 0.145098, 0, 1,
-1.897696, 0.5344181, -1.321178, 1, 0.1490196, 0, 1,
-1.892076, 1.794001, 0.5061249, 1, 0.1568628, 0, 1,
-1.87102, 0.574035, -2.772319, 1, 0.1607843, 0, 1,
-1.82297, -0.7046939, -1.985849, 1, 0.1686275, 0, 1,
-1.816029, -0.2032309, -0.9413339, 1, 0.172549, 0, 1,
-1.808152, 1.97696, -2.519629, 1, 0.1803922, 0, 1,
-1.805001, -0.1020013, -1.163508, 1, 0.1843137, 0, 1,
-1.799539, 0.002286213, 0.03853057, 1, 0.1921569, 0, 1,
-1.791581, 0.06437661, -2.795803, 1, 0.1960784, 0, 1,
-1.783864, 0.7363265, -1.328872, 1, 0.2039216, 0, 1,
-1.711483, 0.81611, -1.559504, 1, 0.2117647, 0, 1,
-1.706242, -0.864252, -0.7051987, 1, 0.2156863, 0, 1,
-1.68958, 0.4575327, -0.3954502, 1, 0.2235294, 0, 1,
-1.660845, -1.951391, -3.593994, 1, 0.227451, 0, 1,
-1.655762, -0.7655867, -2.315584, 1, 0.2352941, 0, 1,
-1.653041, -1.403988, -3.089921, 1, 0.2392157, 0, 1,
-1.652964, 2.58086, -2.038807, 1, 0.2470588, 0, 1,
-1.637506, -0.3446585, -0.608144, 1, 0.2509804, 0, 1,
-1.636132, -0.6448981, -4.126665, 1, 0.2588235, 0, 1,
-1.636122, -0.9730975, -1.641306, 1, 0.2627451, 0, 1,
-1.613633, 0.9740537, -2.00824, 1, 0.2705882, 0, 1,
-1.613431, 0.9118045, -0.2746971, 1, 0.2745098, 0, 1,
-1.598349, 0.7086433, -1.374649, 1, 0.282353, 0, 1,
-1.570812, -0.7548587, -3.677831, 1, 0.2862745, 0, 1,
-1.567882, 1.567104, -2.421084, 1, 0.2941177, 0, 1,
-1.537282, 0.3189501, -2.813387, 1, 0.3019608, 0, 1,
-1.531691, -0.2751988, -2.144978, 1, 0.3058824, 0, 1,
-1.528128, 1.232558, -0.7660299, 1, 0.3137255, 0, 1,
-1.482025, 0.8662575, 0.5352334, 1, 0.3176471, 0, 1,
-1.470862, -0.7132106, -2.426771, 1, 0.3254902, 0, 1,
-1.466196, -0.03026615, -4.078253, 1, 0.3294118, 0, 1,
-1.465672, 1.062058, -1.313572, 1, 0.3372549, 0, 1,
-1.453764, -0.595542, -1.084657, 1, 0.3411765, 0, 1,
-1.452117, 0.6623311, -1.355143, 1, 0.3490196, 0, 1,
-1.440433, -0.1598879, 0.3848927, 1, 0.3529412, 0, 1,
-1.425802, -2.818136, -2.1428, 1, 0.3607843, 0, 1,
-1.42416, -0.5429309, -0.943734, 1, 0.3647059, 0, 1,
-1.418975, -0.5198579, -0.8561788, 1, 0.372549, 0, 1,
-1.407608, -0.418704, -4.51846, 1, 0.3764706, 0, 1,
-1.406712, 1.76948, -0.215328, 1, 0.3843137, 0, 1,
-1.40593, 0.1642238, -0.9504843, 1, 0.3882353, 0, 1,
-1.383975, 2.122339, -1.030851, 1, 0.3960784, 0, 1,
-1.381572, -1.331167, -1.971838, 1, 0.4039216, 0, 1,
-1.38148, -0.2818419, -1.288998, 1, 0.4078431, 0, 1,
-1.363939, -1.450256, -3.026525, 1, 0.4156863, 0, 1,
-1.363121, -0.5864936, -1.113681, 1, 0.4196078, 0, 1,
-1.362205, -0.2332158, -3.373826, 1, 0.427451, 0, 1,
-1.35784, 0.8735637, -1.273475, 1, 0.4313726, 0, 1,
-1.354991, 1.00985, 0.7982152, 1, 0.4392157, 0, 1,
-1.348211, -1.215991, -1.562912, 1, 0.4431373, 0, 1,
-1.341262, -0.09905089, -1.984747, 1, 0.4509804, 0, 1,
-1.336967, 0.5201226, -2.3132, 1, 0.454902, 0, 1,
-1.330101, -0.8530273, -1.594841, 1, 0.4627451, 0, 1,
-1.325484, 1.837704, -0.2848613, 1, 0.4666667, 0, 1,
-1.324628, -0.02849593, -1.71828, 1, 0.4745098, 0, 1,
-1.311633, -0.6798876, -1.998335, 1, 0.4784314, 0, 1,
-1.309873, 0.2777538, -1.972808, 1, 0.4862745, 0, 1,
-1.308405, 1.091397, -0.8253803, 1, 0.4901961, 0, 1,
-1.304073, 1.574978, 0.163578, 1, 0.4980392, 0, 1,
-1.292938, 0.4267367, -1.334682, 1, 0.5058824, 0, 1,
-1.282608, 0.4681525, -0.9095036, 1, 0.509804, 0, 1,
-1.276573, -1.165002, -1.805473, 1, 0.5176471, 0, 1,
-1.272743, 0.5282559, -0.6335168, 1, 0.5215687, 0, 1,
-1.269317, -1.520603, -2.178137, 1, 0.5294118, 0, 1,
-1.267766, -0.4595346, -1.566107, 1, 0.5333334, 0, 1,
-1.259116, 1.327956, -0.08821574, 1, 0.5411765, 0, 1,
-1.25635, -3.526951, -2.445143, 1, 0.5450981, 0, 1,
-1.249401, 1.291472, -0.4363347, 1, 0.5529412, 0, 1,
-1.241709, -0.6458918, -3.002256, 1, 0.5568628, 0, 1,
-1.238438, -1.744381, -3.366739, 1, 0.5647059, 0, 1,
-1.225906, -0.1996107, -1.880749, 1, 0.5686275, 0, 1,
-1.222232, 0.3618009, -2.590889, 1, 0.5764706, 0, 1,
-1.221919, 0.9188514, 1.5818, 1, 0.5803922, 0, 1,
-1.213988, 0.4122303, -1.017268, 1, 0.5882353, 0, 1,
-1.206676, 1.358686, -2.231991, 1, 0.5921569, 0, 1,
-1.203605, -1.072226, -2.488465, 1, 0.6, 0, 1,
-1.202496, -0.2098915, -2.100727, 1, 0.6078432, 0, 1,
-1.201766, -0.8186076, -2.545175, 1, 0.6117647, 0, 1,
-1.201195, -0.5772602, -2.111959, 1, 0.6196079, 0, 1,
-1.195821, -1.777787, -4.127494, 1, 0.6235294, 0, 1,
-1.193557, -2.232637, -3.624995, 1, 0.6313726, 0, 1,
-1.189474, -0.1911743, -2.465592, 1, 0.6352941, 0, 1,
-1.187636, -0.8129455, -1.550199, 1, 0.6431373, 0, 1,
-1.186359, -1.650508, -4.475728, 1, 0.6470588, 0, 1,
-1.183745, -0.2085719, -2.293607, 1, 0.654902, 0, 1,
-1.17033, 1.15323, -0.4727903, 1, 0.6588235, 0, 1,
-1.169466, 0.4115842, 0.7488807, 1, 0.6666667, 0, 1,
-1.166891, 0.7327586, 0.4561752, 1, 0.6705883, 0, 1,
-1.160484, -1.138759, -2.298841, 1, 0.6784314, 0, 1,
-1.15915, -0.3082488, -1.91883, 1, 0.682353, 0, 1,
-1.155974, -1.889696, -4.127694, 1, 0.6901961, 0, 1,
-1.154053, -0.4249623, -2.886135, 1, 0.6941177, 0, 1,
-1.153255, 0.4439289, -1.553423, 1, 0.7019608, 0, 1,
-1.149814, 0.5867175, -1.302135, 1, 0.7098039, 0, 1,
-1.14674, 1.124311, -2.490646, 1, 0.7137255, 0, 1,
-1.139338, -0.8826729, -3.417866, 1, 0.7215686, 0, 1,
-1.131068, 0.6608108, -1.286622, 1, 0.7254902, 0, 1,
-1.131015, -0.1287364, -0.8846617, 1, 0.7333333, 0, 1,
-1.130608, 2.203469, -0.9866408, 1, 0.7372549, 0, 1,
-1.12881, 1.005916, -1.912262, 1, 0.7450981, 0, 1,
-1.121005, -0.09193454, -0.9560195, 1, 0.7490196, 0, 1,
-1.114093, 1.688529, 0.1934748, 1, 0.7568628, 0, 1,
-1.109996, 0.03222221, -2.798568, 1, 0.7607843, 0, 1,
-1.103366, -0.348334, -2.813857, 1, 0.7686275, 0, 1,
-1.102509, 0.5601479, -0.678191, 1, 0.772549, 0, 1,
-1.101327, 0.588478, -1.290588, 1, 0.7803922, 0, 1,
-1.101219, -1.012294, -1.769034, 1, 0.7843137, 0, 1,
-1.093049, -0.7896928, -3.00177, 1, 0.7921569, 0, 1,
-1.088695, -0.6571975, -0.1818732, 1, 0.7960784, 0, 1,
-1.088086, -1.441522, -2.495087, 1, 0.8039216, 0, 1,
-1.086321, 0.8130296, -1.1235, 1, 0.8117647, 0, 1,
-1.082448, -1.91067, -3.590947, 1, 0.8156863, 0, 1,
-1.081543, 1.45386, -0.7436568, 1, 0.8235294, 0, 1,
-1.064294, -1.135279, -1.917266, 1, 0.827451, 0, 1,
-1.061565, -0.0877777, -1.126531, 1, 0.8352941, 0, 1,
-1.054964, -0.9374119, -1.81003, 1, 0.8392157, 0, 1,
-1.0516, 1.041367, -2.662307, 1, 0.8470588, 0, 1,
-1.050464, -0.8491597, -3.883259, 1, 0.8509804, 0, 1,
-1.050285, -1.885899, -1.80133, 1, 0.8588235, 0, 1,
-1.037413, -0.5848851, -2.545794, 1, 0.8627451, 0, 1,
-1.036525, 0.6566522, -1.544206, 1, 0.8705882, 0, 1,
-1.002268, -1.048555, -1.725882, 1, 0.8745098, 0, 1,
-0.9980152, -1.076109, -2.50111, 1, 0.8823529, 0, 1,
-0.9965815, 0.2870876, -0.5564526, 1, 0.8862745, 0, 1,
-0.9899268, -0.9367235, -2.903199, 1, 0.8941177, 0, 1,
-0.9854468, -0.8376491, -1.236368, 1, 0.8980392, 0, 1,
-0.9675595, -0.4500333, -1.514947, 1, 0.9058824, 0, 1,
-0.9667441, 0.6720362, -1.198803, 1, 0.9137255, 0, 1,
-0.9663297, -0.2913346, -1.221679, 1, 0.9176471, 0, 1,
-0.9657586, 1.571835, 1.148974, 1, 0.9254902, 0, 1,
-0.9585115, -0.5035636, -3.044115, 1, 0.9294118, 0, 1,
-0.9582737, -0.07340758, -1.527023, 1, 0.9372549, 0, 1,
-0.955909, 0.05240463, 0.6311321, 1, 0.9411765, 0, 1,
-0.9514808, 0.3678842, -2.515993, 1, 0.9490196, 0, 1,
-0.9497582, -1.125085, -1.064275, 1, 0.9529412, 0, 1,
-0.9492177, 0.3894002, -0.3781027, 1, 0.9607843, 0, 1,
-0.946184, -0.7028588, -1.620777, 1, 0.9647059, 0, 1,
-0.9437238, 0.7884407, -1.771527, 1, 0.972549, 0, 1,
-0.9421687, 0.4685814, -1.489726, 1, 0.9764706, 0, 1,
-0.9324212, 0.9342814, -1.20202, 1, 0.9843137, 0, 1,
-0.9311816, -0.5732497, -3.5206, 1, 0.9882353, 0, 1,
-0.9250124, 0.005633798, -2.717727, 1, 0.9960784, 0, 1,
-0.9234825, 0.9147497, -1.372791, 0.9960784, 1, 0, 1,
-0.9201697, -0.1446355, -1.424571, 0.9921569, 1, 0, 1,
-0.9187126, 0.6439403, -2.165522, 0.9843137, 1, 0, 1,
-0.9131035, 0.2841972, -0.9183975, 0.9803922, 1, 0, 1,
-0.9113613, 1.785911, 0.3854344, 0.972549, 1, 0, 1,
-0.9058057, 0.3370509, -2.292614, 0.9686275, 1, 0, 1,
-0.9048527, 1.520504, 0.445955, 0.9607843, 1, 0, 1,
-0.9033347, -0.2981583, -2.784055, 0.9568627, 1, 0, 1,
-0.8955055, 0.05940279, -1.497003, 0.9490196, 1, 0, 1,
-0.8870442, 0.9627333, -0.1293699, 0.945098, 1, 0, 1,
-0.8795692, 1.586105, 1.122699, 0.9372549, 1, 0, 1,
-0.877878, 0.5115487, -0.9221884, 0.9333333, 1, 0, 1,
-0.8778477, 0.01768026, -0.4914726, 0.9254902, 1, 0, 1,
-0.8746312, 1.11517, 0.3996737, 0.9215686, 1, 0, 1,
-0.8739415, 0.7874696, -1.13248, 0.9137255, 1, 0, 1,
-0.8694937, 2.589386, 0.2459719, 0.9098039, 1, 0, 1,
-0.8637311, 1.578897, -0.2241513, 0.9019608, 1, 0, 1,
-0.8615705, 0.9388112, 1.695985, 0.8941177, 1, 0, 1,
-0.8552241, -0.1188839, -2.270302, 0.8901961, 1, 0, 1,
-0.854996, 0.2492461, -1.293271, 0.8823529, 1, 0, 1,
-0.8544464, -1.927844, -3.56145, 0.8784314, 1, 0, 1,
-0.8526084, -1.395606, -1.218344, 0.8705882, 1, 0, 1,
-0.8511564, 0.3671259, -1.654523, 0.8666667, 1, 0, 1,
-0.8506949, 1.296164, 0.3931777, 0.8588235, 1, 0, 1,
-0.8495426, -1.091273, -4.294603, 0.854902, 1, 0, 1,
-0.8465476, 1.547826, 0.5116983, 0.8470588, 1, 0, 1,
-0.8391473, 2.142151, -0.419528, 0.8431373, 1, 0, 1,
-0.8391386, 0.3922661, -0.6661545, 0.8352941, 1, 0, 1,
-0.8282865, 1.922919, -1.944628, 0.8313726, 1, 0, 1,
-0.821364, 0.7902779, -0.892463, 0.8235294, 1, 0, 1,
-0.820039, -1.589769, -4.491117, 0.8196079, 1, 0, 1,
-0.8198999, 0.5596532, -0.8235974, 0.8117647, 1, 0, 1,
-0.8198628, 0.3932112, -2.283594, 0.8078431, 1, 0, 1,
-0.8196201, -1.41726, -2.130151, 0.8, 1, 0, 1,
-0.817116, 1.53629, 0.407801, 0.7921569, 1, 0, 1,
-0.8128927, 0.6921, -1.215465, 0.7882353, 1, 0, 1,
-0.809959, -1.102281, 0.2115118, 0.7803922, 1, 0, 1,
-0.8065792, -1.196918, -3.876304, 0.7764706, 1, 0, 1,
-0.8026645, 0.2834164, -2.147996, 0.7686275, 1, 0, 1,
-0.7958452, 0.6807004, 0.118627, 0.7647059, 1, 0, 1,
-0.7904235, 0.4325121, -1.175084, 0.7568628, 1, 0, 1,
-0.7787797, 1.656419, -0.1331248, 0.7529412, 1, 0, 1,
-0.7783172, 0.1851609, 0.1755004, 0.7450981, 1, 0, 1,
-0.7710196, 1.08822, -1.616273, 0.7411765, 1, 0, 1,
-0.7702459, 0.3030578, -2.520428, 0.7333333, 1, 0, 1,
-0.7690611, -0.8132731, -2.760119, 0.7294118, 1, 0, 1,
-0.7654155, 0.9107329, -0.3272856, 0.7215686, 1, 0, 1,
-0.758858, -0.5300794, -3.649688, 0.7176471, 1, 0, 1,
-0.7587976, -0.9951106, -0.4601913, 0.7098039, 1, 0, 1,
-0.754617, 0.9961711, -1.437378, 0.7058824, 1, 0, 1,
-0.7545662, 0.2240478, -2.372353, 0.6980392, 1, 0, 1,
-0.7497228, 1.226401, 0.07321772, 0.6901961, 1, 0, 1,
-0.7434314, -0.2784742, 0.03322634, 0.6862745, 1, 0, 1,
-0.74283, -0.5175132, -2.843207, 0.6784314, 1, 0, 1,
-0.7425202, -0.5817695, 0.1818748, 0.6745098, 1, 0, 1,
-0.7420209, 0.1777509, -2.459914, 0.6666667, 1, 0, 1,
-0.7409011, 0.04172124, -1.108667, 0.6627451, 1, 0, 1,
-0.7404565, 0.2814588, -1.01488, 0.654902, 1, 0, 1,
-0.7356039, -0.002408984, -0.6572131, 0.6509804, 1, 0, 1,
-0.7335159, 0.2917936, -0.7866915, 0.6431373, 1, 0, 1,
-0.733448, -1.434261, -3.228752, 0.6392157, 1, 0, 1,
-0.732634, -0.09512524, -2.008688, 0.6313726, 1, 0, 1,
-0.7324029, 0.7487122, -1.564436, 0.627451, 1, 0, 1,
-0.7307701, -0.7948828, -2.295592, 0.6196079, 1, 0, 1,
-0.7289886, 0.4842494, -1.094773, 0.6156863, 1, 0, 1,
-0.7273983, -0.03792618, -2.376599, 0.6078432, 1, 0, 1,
-0.7270293, 0.8087362, 0.6147718, 0.6039216, 1, 0, 1,
-0.7233979, -0.8565629, -2.222899, 0.5960785, 1, 0, 1,
-0.7228915, -0.5657316, -1.779518, 0.5882353, 1, 0, 1,
-0.7218556, -1.893345, -2.072091, 0.5843138, 1, 0, 1,
-0.7062694, -0.2257898, -2.001128, 0.5764706, 1, 0, 1,
-0.7037686, -0.7363589, -3.46826, 0.572549, 1, 0, 1,
-0.7030039, 0.1718192, -2.445547, 0.5647059, 1, 0, 1,
-0.6997656, -0.4951279, -1.766718, 0.5607843, 1, 0, 1,
-0.6950359, -1.451102, -1.823071, 0.5529412, 1, 0, 1,
-0.6941674, 0.8251959, -0.2952103, 0.5490196, 1, 0, 1,
-0.6865657, 0.509696, -2.00907, 0.5411765, 1, 0, 1,
-0.6853484, 1.10039, 0.3186226, 0.5372549, 1, 0, 1,
-0.6825044, 0.6207662, -1.481004, 0.5294118, 1, 0, 1,
-0.679695, 0.6432917, -0.8427628, 0.5254902, 1, 0, 1,
-0.6787235, -0.1855869, -1.816271, 0.5176471, 1, 0, 1,
-0.6776085, 1.205576, -0.1258198, 0.5137255, 1, 0, 1,
-0.6744814, 0.4531332, -0.2653807, 0.5058824, 1, 0, 1,
-0.6690284, 1.209248, -0.5405024, 0.5019608, 1, 0, 1,
-0.6678023, -0.5082766, -1.958845, 0.4941176, 1, 0, 1,
-0.6508964, 1.362672, -0.6118724, 0.4862745, 1, 0, 1,
-0.6467656, 0.3748389, -1.093661, 0.4823529, 1, 0, 1,
-0.6406425, 0.3225552, 0.005472835, 0.4745098, 1, 0, 1,
-0.6400267, -1.107461, -3.630643, 0.4705882, 1, 0, 1,
-0.6386053, 1.005267, -0.7401278, 0.4627451, 1, 0, 1,
-0.6298056, -0.7650036, -3.738979, 0.4588235, 1, 0, 1,
-0.6297485, -1.09219, -1.567455, 0.4509804, 1, 0, 1,
-0.6250291, 0.9431729, 1.344016, 0.4470588, 1, 0, 1,
-0.6116704, -1.724139, -1.609699, 0.4392157, 1, 0, 1,
-0.6107672, 1.421589, 0.2185815, 0.4352941, 1, 0, 1,
-0.6096451, 1.085616, -0.2251734, 0.427451, 1, 0, 1,
-0.6084623, -1.752657, -3.272932, 0.4235294, 1, 0, 1,
-0.6084157, 1.44181, -1.285205, 0.4156863, 1, 0, 1,
-0.6076027, -2.227985, -3.14022, 0.4117647, 1, 0, 1,
-0.6057826, 0.181827, 0.31223, 0.4039216, 1, 0, 1,
-0.6044264, 1.012131, -0.6155504, 0.3960784, 1, 0, 1,
-0.6039969, -0.06194282, -2.931523, 0.3921569, 1, 0, 1,
-0.6031178, -1.203786, -3.02186, 0.3843137, 1, 0, 1,
-0.6014426, 0.6096485, -1.779154, 0.3803922, 1, 0, 1,
-0.6008277, 0.062964, 0.02316249, 0.372549, 1, 0, 1,
-0.5997666, -0.4375957, -2.647734, 0.3686275, 1, 0, 1,
-0.5959516, -1.675486, -1.573312, 0.3607843, 1, 0, 1,
-0.5947278, 0.4030245, -0.4339103, 0.3568628, 1, 0, 1,
-0.5910838, -1.257083, -2.078084, 0.3490196, 1, 0, 1,
-0.5879685, 0.2377037, -2.550643, 0.345098, 1, 0, 1,
-0.5879212, -1.030534, -3.207014, 0.3372549, 1, 0, 1,
-0.5858912, 1.175134, 0.4847709, 0.3333333, 1, 0, 1,
-0.5831892, 0.1837709, -0.8341779, 0.3254902, 1, 0, 1,
-0.5784437, -2.270181, -2.976223, 0.3215686, 1, 0, 1,
-0.5779473, -1.788868, -2.952223, 0.3137255, 1, 0, 1,
-0.5736379, -1.076573, -4.473041, 0.3098039, 1, 0, 1,
-0.5696546, -0.4284263, -0.3088362, 0.3019608, 1, 0, 1,
-0.5591762, 1.155906, -1.041362, 0.2941177, 1, 0, 1,
-0.5505669, -0.572641, -3.392846, 0.2901961, 1, 0, 1,
-0.5478308, -0.8813455, -3.422209, 0.282353, 1, 0, 1,
-0.5476331, 0.2323382, 1.172919, 0.2784314, 1, 0, 1,
-0.5452886, -0.1322662, -1.758371, 0.2705882, 1, 0, 1,
-0.5451527, -1.779657, -4.295817, 0.2666667, 1, 0, 1,
-0.5450898, -0.6559105, -3.093447, 0.2588235, 1, 0, 1,
-0.5443501, 0.4173068, -1.436024, 0.254902, 1, 0, 1,
-0.5427096, 0.2593111, 0.2816599, 0.2470588, 1, 0, 1,
-0.5368416, -0.8444508, -2.262709, 0.2431373, 1, 0, 1,
-0.5367623, 0.5569706, 1.291376, 0.2352941, 1, 0, 1,
-0.533531, 0.5438531, -0.8586771, 0.2313726, 1, 0, 1,
-0.5255356, -1.873066, -4.691894, 0.2235294, 1, 0, 1,
-0.5236521, 0.3346238, -2.628449, 0.2196078, 1, 0, 1,
-0.521262, -0.7014938, -2.425741, 0.2117647, 1, 0, 1,
-0.5167254, 0.2883002, -2.02812, 0.2078431, 1, 0, 1,
-0.5145312, -0.8899155, -0.9057728, 0.2, 1, 0, 1,
-0.5095217, 0.7989576, 0.4581341, 0.1921569, 1, 0, 1,
-0.5079, -0.1446165, -2.968222, 0.1882353, 1, 0, 1,
-0.5077717, -0.369873, -3.125325, 0.1803922, 1, 0, 1,
-0.5053149, -1.569183, -1.00327, 0.1764706, 1, 0, 1,
-0.499865, -0.6696919, -1.730684, 0.1686275, 1, 0, 1,
-0.4993725, 0.5808761, -0.5244159, 0.1647059, 1, 0, 1,
-0.4982853, 0.6488979, 0.5049525, 0.1568628, 1, 0, 1,
-0.482239, 1.216169, 0.6463807, 0.1529412, 1, 0, 1,
-0.4811491, 0.2257815, -1.369701, 0.145098, 1, 0, 1,
-0.4803206, 0.1579719, -1.2301, 0.1411765, 1, 0, 1,
-0.4802265, 1.500644, -0.02305367, 0.1333333, 1, 0, 1,
-0.4793771, -0.3142325, -2.65131, 0.1294118, 1, 0, 1,
-0.4753693, -0.8542275, -3.584548, 0.1215686, 1, 0, 1,
-0.4689054, -0.9022102, -3.636064, 0.1176471, 1, 0, 1,
-0.4662908, 0.06515539, -1.23666, 0.1098039, 1, 0, 1,
-0.4627541, -0.247163, -1.922136, 0.1058824, 1, 0, 1,
-0.4616354, 0.0707977, -0.6588398, 0.09803922, 1, 0, 1,
-0.4580893, 0.1551282, -0.6103665, 0.09019608, 1, 0, 1,
-0.4554134, 1.008098, -0.5430495, 0.08627451, 1, 0, 1,
-0.4540416, 0.8896651, -0.3916818, 0.07843138, 1, 0, 1,
-0.4528905, -0.07293039, -3.225399, 0.07450981, 1, 0, 1,
-0.4508464, 0.2009373, -3.568537, 0.06666667, 1, 0, 1,
-0.4490209, -1.565189, -1.524172, 0.0627451, 1, 0, 1,
-0.4464356, 0.8515655, -1.693357, 0.05490196, 1, 0, 1,
-0.4424582, 1.168964, 0.8282561, 0.05098039, 1, 0, 1,
-0.4406936, -0.4041323, -2.415773, 0.04313726, 1, 0, 1,
-0.4368184, 2.83837, -0.9017823, 0.03921569, 1, 0, 1,
-0.4353831, -0.8458128, -4.079723, 0.03137255, 1, 0, 1,
-0.4335179, 0.8806238, 0.4721372, 0.02745098, 1, 0, 1,
-0.42994, 0.6787744, -1.410727, 0.01960784, 1, 0, 1,
-0.4289946, -0.4282024, -3.100338, 0.01568628, 1, 0, 1,
-0.4275013, -0.3510608, -1.753084, 0.007843138, 1, 0, 1,
-0.4273078, -0.4024115, -1.555779, 0.003921569, 1, 0, 1,
-0.4257624, 2.38324, 0.5825653, 0, 1, 0.003921569, 1,
-0.4210754, -0.7148819, -1.91389, 0, 1, 0.01176471, 1,
-0.4201929, -0.9906204, -1.470932, 0, 1, 0.01568628, 1,
-0.4201306, -1.33705, -4.265656, 0, 1, 0.02352941, 1,
-0.4096143, 0.2607383, -0.91604, 0, 1, 0.02745098, 1,
-0.4071887, 1.746282, -1.14345, 0, 1, 0.03529412, 1,
-0.3993712, -0.3289021, -0.5351925, 0, 1, 0.03921569, 1,
-0.3974312, 0.6241074, -0.2521645, 0, 1, 0.04705882, 1,
-0.3958634, -0.02937126, -2.221704, 0, 1, 0.05098039, 1,
-0.3941252, -0.9098029, -3.668807, 0, 1, 0.05882353, 1,
-0.391011, -1.079682, -2.03069, 0, 1, 0.0627451, 1,
-0.3900346, 0.04244855, -1.733793, 0, 1, 0.07058824, 1,
-0.3880723, 0.9454163, -1.849876, 0, 1, 0.07450981, 1,
-0.3847432, -0.5664954, -2.062863, 0, 1, 0.08235294, 1,
-0.3833682, 1.537771, 1.378855, 0, 1, 0.08627451, 1,
-0.3808376, 0.05660077, -1.306649, 0, 1, 0.09411765, 1,
-0.3782543, -0.7676468, -1.761449, 0, 1, 0.1019608, 1,
-0.3732059, 0.5623796, 0.1680773, 0, 1, 0.1058824, 1,
-0.3653982, -0.3833739, -1.887423, 0, 1, 0.1137255, 1,
-0.3647084, 1.699392, -0.1054676, 0, 1, 0.1176471, 1,
-0.3643503, 1.520456, 0.401243, 0, 1, 0.1254902, 1,
-0.3631058, -0.2878996, -2.416481, 0, 1, 0.1294118, 1,
-0.3625405, -0.1445162, -2.963086, 0, 1, 0.1372549, 1,
-0.3606316, 0.8264343, 1.801706, 0, 1, 0.1411765, 1,
-0.3593631, -0.2042164, -2.487754, 0, 1, 0.1490196, 1,
-0.3580305, -1.294493, -2.25378, 0, 1, 0.1529412, 1,
-0.3562696, -0.3469133, -0.1293181, 0, 1, 0.1607843, 1,
-0.3549803, -0.6161441, 1.195289, 0, 1, 0.1647059, 1,
-0.3461643, 1.307266, -0.7942858, 0, 1, 0.172549, 1,
-0.345052, 1.647686, -0.2802769, 0, 1, 0.1764706, 1,
-0.3408626, 0.7220783, 0.2611385, 0, 1, 0.1843137, 1,
-0.3391661, 0.4237617, -1.753717, 0, 1, 0.1882353, 1,
-0.3367274, -0.1543496, -3.70627, 0, 1, 0.1960784, 1,
-0.3364818, 1.127717, 0.7857106, 0, 1, 0.2039216, 1,
-0.3347729, -0.5413944, -0.8252269, 0, 1, 0.2078431, 1,
-0.3340865, -0.3359476, -2.200208, 0, 1, 0.2156863, 1,
-0.3312264, 0.05412011, -2.177462, 0, 1, 0.2196078, 1,
-0.328818, 0.8779543, 0.9410079, 0, 1, 0.227451, 1,
-0.3287168, -0.1787764, -1.244459, 0, 1, 0.2313726, 1,
-0.3265748, 0.1586912, -0.2749423, 0, 1, 0.2392157, 1,
-0.3256965, 0.5513791, -1.13137, 0, 1, 0.2431373, 1,
-0.3242169, -0.01953362, -3.002573, 0, 1, 0.2509804, 1,
-0.3226788, 0.03803083, -4.317443, 0, 1, 0.254902, 1,
-0.3177966, -0.3469424, -1.894094, 0, 1, 0.2627451, 1,
-0.3174948, -0.7802073, -4.022532, 0, 1, 0.2666667, 1,
-0.3133094, -2.038489, -1.611256, 0, 1, 0.2745098, 1,
-0.3132244, 0.4821504, -0.4067351, 0, 1, 0.2784314, 1,
-0.3128062, 0.1087518, 0.01992722, 0, 1, 0.2862745, 1,
-0.3066011, 0.2434711, -0.7203373, 0, 1, 0.2901961, 1,
-0.3041705, -1.740441, -1.92115, 0, 1, 0.2980392, 1,
-0.2988838, -0.8676839, -3.546344, 0, 1, 0.3058824, 1,
-0.2961844, -2.137689, -1.459219, 0, 1, 0.3098039, 1,
-0.2840095, 1.429168, -0.3828647, 0, 1, 0.3176471, 1,
-0.2830876, 0.4328184, 1.22867, 0, 1, 0.3215686, 1,
-0.2829342, -0.4508771, -1.503265, 0, 1, 0.3294118, 1,
-0.2824559, -0.7284822, -2.453479, 0, 1, 0.3333333, 1,
-0.2823966, 0.1612948, -2.08787, 0, 1, 0.3411765, 1,
-0.2823615, -2.069217, -3.587189, 0, 1, 0.345098, 1,
-0.2811071, -0.3132052, -0.833784, 0, 1, 0.3529412, 1,
-0.2757908, 0.3180182, -2.109919, 0, 1, 0.3568628, 1,
-0.2727381, -1.319719, -2.636337, 0, 1, 0.3647059, 1,
-0.271478, 0.6162165, -0.08798926, 0, 1, 0.3686275, 1,
-0.271054, -1.644474, -2.594697, 0, 1, 0.3764706, 1,
-0.2687203, -0.172463, -1.787932, 0, 1, 0.3803922, 1,
-0.2653353, 0.04588009, -1.155678, 0, 1, 0.3882353, 1,
-0.2604779, 0.2391188, -1.709522, 0, 1, 0.3921569, 1,
-0.2561894, -0.1450031, -3.077017, 0, 1, 0.4, 1,
-0.2538001, -0.9238183, -1.514981, 0, 1, 0.4078431, 1,
-0.2521662, 0.2525626, -0.848339, 0, 1, 0.4117647, 1,
-0.2519698, 1.880608, -0.5790055, 0, 1, 0.4196078, 1,
-0.2452137, 1.700019, -0.5849763, 0, 1, 0.4235294, 1,
-0.2369679, -2.337002, -1.549684, 0, 1, 0.4313726, 1,
-0.2320662, -0.1663165, -0.5789493, 0, 1, 0.4352941, 1,
-0.2295866, -1.08463, -2.129556, 0, 1, 0.4431373, 1,
-0.2293014, 0.2345437, 1.18245, 0, 1, 0.4470588, 1,
-0.223329, 0.2115456, -1.657182, 0, 1, 0.454902, 1,
-0.2218473, 0.1786214, -0.9494434, 0, 1, 0.4588235, 1,
-0.2190088, -1.633694, -3.444205, 0, 1, 0.4666667, 1,
-0.2165788, -0.6669549, -4.183071, 0, 1, 0.4705882, 1,
-0.2164453, 0.1496824, -1.615896, 0, 1, 0.4784314, 1,
-0.2146643, 0.7214077, -0.3515224, 0, 1, 0.4823529, 1,
-0.2139788, 0.1623274, -0.7843565, 0, 1, 0.4901961, 1,
-0.2136561, 0.132946, -2.16849, 0, 1, 0.4941176, 1,
-0.2102438, -0.4892257, -0.3757402, 0, 1, 0.5019608, 1,
-0.2083283, 0.09142675, -1.198651, 0, 1, 0.509804, 1,
-0.2033378, 1.230847, 0.3566794, 0, 1, 0.5137255, 1,
-0.2031902, -0.2132494, -3.950512, 0, 1, 0.5215687, 1,
-0.2013866, 1.069183, 0.01893934, 0, 1, 0.5254902, 1,
-0.197934, 0.6020514, -1.346524, 0, 1, 0.5333334, 1,
-0.1975037, -1.448666, -3.404688, 0, 1, 0.5372549, 1,
-0.1965447, -1.264845, -3.6968, 0, 1, 0.5450981, 1,
-0.1941689, -0.8084197, -3.087739, 0, 1, 0.5490196, 1,
-0.1922564, 0.5134947, -0.9385546, 0, 1, 0.5568628, 1,
-0.1895321, -0.07473813, -1.902997, 0, 1, 0.5607843, 1,
-0.1820873, 2.304567, 0.7390606, 0, 1, 0.5686275, 1,
-0.1800759, -0.372972, -4.537017, 0, 1, 0.572549, 1,
-0.1795246, -0.4077227, -2.32575, 0, 1, 0.5803922, 1,
-0.1761586, 0.3816867, -1.110732, 0, 1, 0.5843138, 1,
-0.1752949, -0.9743665, -1.475975, 0, 1, 0.5921569, 1,
-0.1721297, -0.4729764, -3.642245, 0, 1, 0.5960785, 1,
-0.1679147, -0.5783652, -2.956879, 0, 1, 0.6039216, 1,
-0.1643556, 0.471813, 0.4735827, 0, 1, 0.6117647, 1,
-0.1639033, 1.001886, -1.132951, 0, 1, 0.6156863, 1,
-0.1630051, -0.22689, -2.971518, 0, 1, 0.6235294, 1,
-0.1615298, -0.4817125, -2.879164, 0, 1, 0.627451, 1,
-0.1507788, 1.341526, -0.6120549, 0, 1, 0.6352941, 1,
-0.1507567, 0.8632988, 0.8563084, 0, 1, 0.6392157, 1,
-0.1504052, 1.275983, 0.1535364, 0, 1, 0.6470588, 1,
-0.1448689, -0.9617722, -4.110072, 0, 1, 0.6509804, 1,
-0.1439756, -0.7819805, -4.458611, 0, 1, 0.6588235, 1,
-0.1398336, 0.0508822, -0.4925415, 0, 1, 0.6627451, 1,
-0.1278892, -0.08280323, -0.6374726, 0, 1, 0.6705883, 1,
-0.1254109, 0.05992236, -0.02961272, 0, 1, 0.6745098, 1,
-0.1246428, -1.664614, -1.799983, 0, 1, 0.682353, 1,
-0.1196929, 0.3509945, 0.9298446, 0, 1, 0.6862745, 1,
-0.118565, -1.536467, -2.287634, 0, 1, 0.6941177, 1,
-0.1180559, 1.491444, -2.210419, 0, 1, 0.7019608, 1,
-0.116438, 0.2511981, 1.009211, 0, 1, 0.7058824, 1,
-0.1110387, -2.505773, -2.096013, 0, 1, 0.7137255, 1,
-0.1106993, -0.8486124, -2.497285, 0, 1, 0.7176471, 1,
-0.1089109, 1.736079, -0.7093126, 0, 1, 0.7254902, 1,
-0.108603, -0.5324461, -0.3852765, 0, 1, 0.7294118, 1,
-0.10378, 0.7827681, -0.4932633, 0, 1, 0.7372549, 1,
-0.1012637, 0.5715397, 0.07959811, 0, 1, 0.7411765, 1,
-0.1004714, 0.6097134, -0.84364, 0, 1, 0.7490196, 1,
-0.09996967, 0.04854494, -0.0482513, 0, 1, 0.7529412, 1,
-0.09409752, -0.005550792, -0.7907196, 0, 1, 0.7607843, 1,
-0.09165046, 0.5081953, -1.566835, 0, 1, 0.7647059, 1,
-0.08568746, -0.7846527, -3.472365, 0, 1, 0.772549, 1,
-0.08559872, -1.584604, -3.54855, 0, 1, 0.7764706, 1,
-0.07868143, -0.5554528, -3.131719, 0, 1, 0.7843137, 1,
-0.06687648, -0.4519963, -4.555802, 0, 1, 0.7882353, 1,
-0.06007873, 0.5550283, -0.5177749, 0, 1, 0.7960784, 1,
-0.05648596, 0.7802647, -1.291426, 0, 1, 0.8039216, 1,
-0.05621649, -1.120075, -2.788715, 0, 1, 0.8078431, 1,
-0.05296693, -0.2153212, -1.832728, 0, 1, 0.8156863, 1,
-0.0525259, 0.8179917, 0.9247928, 0, 1, 0.8196079, 1,
-0.04578513, -0.04871885, -2.772172, 0, 1, 0.827451, 1,
-0.0417008, 0.296556, 0.3692971, 0, 1, 0.8313726, 1,
-0.04080348, 2.035617, -0.1731084, 0, 1, 0.8392157, 1,
-0.03791184, -0.0300424, -1.161862, 0, 1, 0.8431373, 1,
-0.03645349, 1.599759, 1.227803, 0, 1, 0.8509804, 1,
-0.03262851, -0.1607997, -1.311471, 0, 1, 0.854902, 1,
-0.02619318, 0.0657927, 0.3656816, 0, 1, 0.8627451, 1,
-0.02524075, -1.058361, -2.244128, 0, 1, 0.8666667, 1,
-0.02431172, 0.4629227, 1.842834, 0, 1, 0.8745098, 1,
-0.02239302, -0.290009, -4.652281, 0, 1, 0.8784314, 1,
-0.02196214, -0.6427321, -3.331914, 0, 1, 0.8862745, 1,
-0.01877477, 0.1401529, 0.1496448, 0, 1, 0.8901961, 1,
-0.01801808, 1.268887, -0.6558008, 0, 1, 0.8980392, 1,
-0.01609138, 0.1232564, 0.6202193, 0, 1, 0.9058824, 1,
-0.01593494, 1.394722, 0.1266743, 0, 1, 0.9098039, 1,
-0.01552903, 0.1560193, -0.5835402, 0, 1, 0.9176471, 1,
-0.01293753, 1.210806, -0.6309808, 0, 1, 0.9215686, 1,
-0.008165658, 0.6577069, 0.9546522, 0, 1, 0.9294118, 1,
-0.007487397, 0.308531, -0.04348065, 0, 1, 0.9333333, 1,
-0.006656069, -0.3067571, -2.344139, 0, 1, 0.9411765, 1,
-0.002457792, -0.5670254, -3.535623, 0, 1, 0.945098, 1,
-0.001582832, 0.9650052, 0.7470862, 0, 1, 0.9529412, 1,
0.003068448, -0.1582066, 2.958644, 0, 1, 0.9568627, 1,
0.006800872, -0.37762, 2.64216, 0, 1, 0.9647059, 1,
0.007254759, -1.451426, 4.319294, 0, 1, 0.9686275, 1,
0.008385776, 2.539009, 0.4521849, 0, 1, 0.9764706, 1,
0.01305826, 1.10523, 0.1013118, 0, 1, 0.9803922, 1,
0.01592943, -0.07178928, 1.901286, 0, 1, 0.9882353, 1,
0.01984823, 0.9880085, 1.465915, 0, 1, 0.9921569, 1,
0.02000245, -0.7939943, 2.491757, 0, 1, 1, 1,
0.02193268, -0.6751462, 2.681537, 0, 0.9921569, 1, 1,
0.02196174, 0.9610198, 0.8648469, 0, 0.9882353, 1, 1,
0.02748228, 0.9115312, 2.33591, 0, 0.9803922, 1, 1,
0.03411407, 1.761839, -0.01651872, 0, 0.9764706, 1, 1,
0.03531617, -0.3157305, 3.059682, 0, 0.9686275, 1, 1,
0.03869262, 1.266561, -0.224253, 0, 0.9647059, 1, 1,
0.04597973, -1.249216, 2.862089, 0, 0.9568627, 1, 1,
0.04828564, -0.3115959, 3.265474, 0, 0.9529412, 1, 1,
0.04897556, 0.7628784, 0.5128923, 0, 0.945098, 1, 1,
0.0505855, -1.815971, 4.080431, 0, 0.9411765, 1, 1,
0.05336591, 0.8872651, -1.226178, 0, 0.9333333, 1, 1,
0.06252158, 1.779185, -0.6250286, 0, 0.9294118, 1, 1,
0.0628773, 0.1349405, -0.2620116, 0, 0.9215686, 1, 1,
0.06871285, -0.5202844, 3.133977, 0, 0.9176471, 1, 1,
0.07026885, 0.3292726, 0.3071537, 0, 0.9098039, 1, 1,
0.07379939, 0.0503936, 0.2043421, 0, 0.9058824, 1, 1,
0.07598432, -0.8037746, 2.449513, 0, 0.8980392, 1, 1,
0.07741307, 1.11479, -0.5676546, 0, 0.8901961, 1, 1,
0.07884067, -1.004351, 1.666631, 0, 0.8862745, 1, 1,
0.0790198, -0.6180624, 2.729007, 0, 0.8784314, 1, 1,
0.08074967, -0.6057221, 3.027019, 0, 0.8745098, 1, 1,
0.08190226, 1.695519, 0.9702232, 0, 0.8666667, 1, 1,
0.0826993, 0.3571752, 0.01287811, 0, 0.8627451, 1, 1,
0.08892822, 0.060139, 2.459543, 0, 0.854902, 1, 1,
0.09001251, 0.2284706, -1.449694, 0, 0.8509804, 1, 1,
0.09664065, -0.3552988, 2.475795, 0, 0.8431373, 1, 1,
0.09682757, 0.109857, 1.169994, 0, 0.8392157, 1, 1,
0.09788454, -0.7944763, 1.584106, 0, 0.8313726, 1, 1,
0.0992877, -1.964083, 3.222392, 0, 0.827451, 1, 1,
0.09954096, -1.097574, 3.398354, 0, 0.8196079, 1, 1,
0.1005175, -0.1993812, 3.441605, 0, 0.8156863, 1, 1,
0.1013681, -0.1955616, 2.369511, 0, 0.8078431, 1, 1,
0.1049805, 1.169007, 1.175994, 0, 0.8039216, 1, 1,
0.1050677, -0.6524354, 1.950471, 0, 0.7960784, 1, 1,
0.1076707, 1.223722, 3.163427, 0, 0.7882353, 1, 1,
0.1120961, -1.724981, 4.62973, 0, 0.7843137, 1, 1,
0.1201297, 0.5541878, -0.4935325, 0, 0.7764706, 1, 1,
0.1239644, 0.7371166, -0.2988029, 0, 0.772549, 1, 1,
0.1265199, -0.233619, 1.491687, 0, 0.7647059, 1, 1,
0.1305822, -0.7791778, 2.046563, 0, 0.7607843, 1, 1,
0.1336982, 1.648387, -0.6579748, 0, 0.7529412, 1, 1,
0.138592, 0.5160896, 1.324365, 0, 0.7490196, 1, 1,
0.1448629, -0.8351884, 3.99503, 0, 0.7411765, 1, 1,
0.1451454, 0.2572584, 1.028342, 0, 0.7372549, 1, 1,
0.1457186, -1.353122, 3.192346, 0, 0.7294118, 1, 1,
0.1468526, 1.197679, 0.9467524, 0, 0.7254902, 1, 1,
0.1473431, 0.8985781, 0.2050435, 0, 0.7176471, 1, 1,
0.147579, -2.155496, 4.124398, 0, 0.7137255, 1, 1,
0.1504646, -0.1734571, -0.8494372, 0, 0.7058824, 1, 1,
0.1524952, -0.1805059, 1.798583, 0, 0.6980392, 1, 1,
0.1539584, 0.3239673, 0.05816697, 0, 0.6941177, 1, 1,
0.1613796, 0.2034108, 2.172569, 0, 0.6862745, 1, 1,
0.1614926, 0.6586964, -0.3489247, 0, 0.682353, 1, 1,
0.1617065, 0.9574548, 0.7926077, 0, 0.6745098, 1, 1,
0.1640476, -0.2986389, 3.637148, 0, 0.6705883, 1, 1,
0.1665653, -0.3467544, 2.907077, 0, 0.6627451, 1, 1,
0.1704766, 1.250656, 0.3950395, 0, 0.6588235, 1, 1,
0.173077, -1.214859, 2.949294, 0, 0.6509804, 1, 1,
0.1753432, 1.620997, -0.8877587, 0, 0.6470588, 1, 1,
0.1761616, 0.1439896, 1.45477, 0, 0.6392157, 1, 1,
0.1776487, -1.491603, 3.744674, 0, 0.6352941, 1, 1,
0.1803699, 0.7041778, 0.2961117, 0, 0.627451, 1, 1,
0.1806974, -2.285243, 2.742493, 0, 0.6235294, 1, 1,
0.1821249, 0.743904, 0.7991612, 0, 0.6156863, 1, 1,
0.1829261, 0.6222172, -1.50227, 0, 0.6117647, 1, 1,
0.1837168, 0.02384716, 2.228031, 0, 0.6039216, 1, 1,
0.1862072, -1.329298, 2.332461, 0, 0.5960785, 1, 1,
0.1870925, 0.2327253, 0.465084, 0, 0.5921569, 1, 1,
0.1907744, 1.123469, -0.4610536, 0, 0.5843138, 1, 1,
0.1933369, 1.740277, -1.127927, 0, 0.5803922, 1, 1,
0.1941056, -1.079137, 1.517951, 0, 0.572549, 1, 1,
0.1975059, -0.9435195, 4.464063, 0, 0.5686275, 1, 1,
0.2015264, 1.059542, 0.9261796, 0, 0.5607843, 1, 1,
0.2063486, 1.959666, -0.376072, 0, 0.5568628, 1, 1,
0.2106921, -0.6846211, 2.201561, 0, 0.5490196, 1, 1,
0.2152461, -0.2877029, 2.486373, 0, 0.5450981, 1, 1,
0.2202983, 0.02457344, 0.6281812, 0, 0.5372549, 1, 1,
0.2213466, -0.2134382, 1.468599, 0, 0.5333334, 1, 1,
0.2234435, -0.5142247, 0.1707812, 0, 0.5254902, 1, 1,
0.2252097, -0.4689432, 3.249537, 0, 0.5215687, 1, 1,
0.2256073, -1.146005, 2.274676, 0, 0.5137255, 1, 1,
0.2278203, 0.3896502, -0.2808933, 0, 0.509804, 1, 1,
0.2283772, 1.39902, 0.7045567, 0, 0.5019608, 1, 1,
0.2335601, -1.092621, 3.894868, 0, 0.4941176, 1, 1,
0.2339938, -0.2329027, 2.792115, 0, 0.4901961, 1, 1,
0.2433458, -0.9383856, 3.227844, 0, 0.4823529, 1, 1,
0.2451827, -0.8505139, 5.051129, 0, 0.4784314, 1, 1,
0.250024, 0.7569722, 0.06970645, 0, 0.4705882, 1, 1,
0.2521796, -0.5532363, 2.132399, 0, 0.4666667, 1, 1,
0.252529, -0.8814863, 2.109713, 0, 0.4588235, 1, 1,
0.2533562, -1.259754, 3.873799, 0, 0.454902, 1, 1,
0.2590947, -1.216099, 1.645595, 0, 0.4470588, 1, 1,
0.2629938, -0.08800901, 1.50716, 0, 0.4431373, 1, 1,
0.2651398, -0.2538228, 1.55925, 0, 0.4352941, 1, 1,
0.2666465, -0.4877968, 4.123301, 0, 0.4313726, 1, 1,
0.2680154, -0.7210801, 1.535189, 0, 0.4235294, 1, 1,
0.2700273, -0.955682, 1.973936, 0, 0.4196078, 1, 1,
0.2781892, 0.03307796, 0.6904634, 0, 0.4117647, 1, 1,
0.2847806, 0.7662346, -0.3786417, 0, 0.4078431, 1, 1,
0.285818, 0.2307828, 0.4356838, 0, 0.4, 1, 1,
0.2875752, -0.4750452, 3.200855, 0, 0.3921569, 1, 1,
0.2880364, 0.5449449, 0.5627793, 0, 0.3882353, 1, 1,
0.2894384, 0.9025226, -0.1893267, 0, 0.3803922, 1, 1,
0.2940679, 0.6764886, -0.02784298, 0, 0.3764706, 1, 1,
0.2944916, -1.357773, 2.796523, 0, 0.3686275, 1, 1,
0.2965869, 0.5448299, 0.1480939, 0, 0.3647059, 1, 1,
0.3005755, 0.1281727, 1.092513, 0, 0.3568628, 1, 1,
0.3010285, -1.874669, 2.182307, 0, 0.3529412, 1, 1,
0.3020583, 0.01476602, 1.238702, 0, 0.345098, 1, 1,
0.303146, -0.2285335, 1.261842, 0, 0.3411765, 1, 1,
0.3043703, -0.08437367, 2.436694, 0, 0.3333333, 1, 1,
0.3045637, -1.622817, 3.730353, 0, 0.3294118, 1, 1,
0.3046832, 0.1735774, 1.877258, 0, 0.3215686, 1, 1,
0.3075984, -0.9381695, 3.360371, 0, 0.3176471, 1, 1,
0.3091446, -0.6982456, 1.258799, 0, 0.3098039, 1, 1,
0.3093757, -0.7443676, 3.789839, 0, 0.3058824, 1, 1,
0.3134227, -0.6149495, 1.522319, 0, 0.2980392, 1, 1,
0.3150903, -0.6991475, 0.6131829, 0, 0.2901961, 1, 1,
0.3173705, -1.38616, 4.037098, 0, 0.2862745, 1, 1,
0.3201427, -0.3223947, 2.31681, 0, 0.2784314, 1, 1,
0.3247185, 0.3203208, 1.451084, 0, 0.2745098, 1, 1,
0.3285526, -0.4256144, 3.321106, 0, 0.2666667, 1, 1,
0.3300276, 0.1450906, 1.31169, 0, 0.2627451, 1, 1,
0.3349753, 0.7829517, -1.805526, 0, 0.254902, 1, 1,
0.3364778, 1.013914, 0.595338, 0, 0.2509804, 1, 1,
0.3365414, 2.259098, 0.9504398, 0, 0.2431373, 1, 1,
0.338075, 0.1350358, -0.1267908, 0, 0.2392157, 1, 1,
0.3397586, 0.5353488, 1.07343, 0, 0.2313726, 1, 1,
0.340894, 0.782854, 2.900054, 0, 0.227451, 1, 1,
0.3441521, 0.5145234, 0.9409377, 0, 0.2196078, 1, 1,
0.344974, -1.199626, 4.149754, 0, 0.2156863, 1, 1,
0.3490574, -0.1401172, 2.586169, 0, 0.2078431, 1, 1,
0.3518513, -0.2129173, 1.309186, 0, 0.2039216, 1, 1,
0.3586347, 0.1308452, 0.7404775, 0, 0.1960784, 1, 1,
0.3596869, 0.2846909, 0.3750678, 0, 0.1882353, 1, 1,
0.364839, 0.05854368, 2.883487, 0, 0.1843137, 1, 1,
0.3662852, -0.6411304, 4.07844, 0, 0.1764706, 1, 1,
0.3688222, 0.01380364, 1.371659, 0, 0.172549, 1, 1,
0.3707372, -1.866939, 2.07176, 0, 0.1647059, 1, 1,
0.3714411, 0.370061, 0.8140193, 0, 0.1607843, 1, 1,
0.3719934, -1.772724, 4.671488, 0, 0.1529412, 1, 1,
0.3724517, 0.9954745, 0.1180899, 0, 0.1490196, 1, 1,
0.380578, -1.103189, 2.150134, 0, 0.1411765, 1, 1,
0.3806287, -1.387942, 2.651331, 0, 0.1372549, 1, 1,
0.3842311, -0.07236442, 1.364477, 0, 0.1294118, 1, 1,
0.3846298, 0.0243535, 0.3653894, 0, 0.1254902, 1, 1,
0.3846791, 0.4759048, -1.10324, 0, 0.1176471, 1, 1,
0.3852658, -0.3908485, 3.071533, 0, 0.1137255, 1, 1,
0.3873051, -1.143748, 3.912059, 0, 0.1058824, 1, 1,
0.388156, -0.3646924, 2.55866, 0, 0.09803922, 1, 1,
0.3919424, 1.158972, 1.469779, 0, 0.09411765, 1, 1,
0.3932593, 1.475313, -1.090657, 0, 0.08627451, 1, 1,
0.3949805, 0.2609385, 1.24, 0, 0.08235294, 1, 1,
0.4014773, 0.6216639, 1.900284, 0, 0.07450981, 1, 1,
0.4026025, 0.4135416, 0.4409043, 0, 0.07058824, 1, 1,
0.4027742, -1.26091, 3.33687, 0, 0.0627451, 1, 1,
0.4027905, -2.027062, 2.409589, 0, 0.05882353, 1, 1,
0.4124318, -1.143249, 3.712208, 0, 0.05098039, 1, 1,
0.4130377, -0.2961355, 2.008659, 0, 0.04705882, 1, 1,
0.4163263, -0.1355511, 0.4184619, 0, 0.03921569, 1, 1,
0.4169643, -0.4207945, 1.900037, 0, 0.03529412, 1, 1,
0.417875, 1.232437, 0.006421709, 0, 0.02745098, 1, 1,
0.4205372, 1.719029, 0.9465787, 0, 0.02352941, 1, 1,
0.4214295, 1.019803, -0.5475304, 0, 0.01568628, 1, 1,
0.423933, 0.6560001, 1.013187, 0, 0.01176471, 1, 1,
0.4279902, -0.443364, 2.185181, 0, 0.003921569, 1, 1,
0.4345621, -1.604054, 2.495687, 0.003921569, 0, 1, 1,
0.4366134, -1.20701, 3.852993, 0.007843138, 0, 1, 1,
0.4374284, 0.2855522, 3.247789, 0.01568628, 0, 1, 1,
0.4380462, -0.7742689, 1.787465, 0.01960784, 0, 1, 1,
0.4383856, -0.04803997, 2.884046, 0.02745098, 0, 1, 1,
0.4558491, -0.3287111, 2.597605, 0.03137255, 0, 1, 1,
0.4560577, 0.5152561, 1.636952, 0.03921569, 0, 1, 1,
0.463491, 1.396787, -0.766188, 0.04313726, 0, 1, 1,
0.4717942, -0.04786919, 1.430656, 0.05098039, 0, 1, 1,
0.4739277, 0.5159389, -0.05991275, 0.05490196, 0, 1, 1,
0.4754313, -0.1183178, 2.833699, 0.0627451, 0, 1, 1,
0.477993, 1.480024, -0.7813481, 0.06666667, 0, 1, 1,
0.4813465, 0.4479858, 0.1242392, 0.07450981, 0, 1, 1,
0.4825568, 0.2701974, 0.258403, 0.07843138, 0, 1, 1,
0.4841267, -1.001333, 2.104405, 0.08627451, 0, 1, 1,
0.484558, 1.022941, 0.0203535, 0.09019608, 0, 1, 1,
0.485676, -1.112359, 2.560267, 0.09803922, 0, 1, 1,
0.4896967, 0.49698, 0.4910868, 0.1058824, 0, 1, 1,
0.4916253, 0.006197863, 2.370075, 0.1098039, 0, 1, 1,
0.4987268, -1.445653, 3.050307, 0.1176471, 0, 1, 1,
0.502822, 1.059628, 1.041376, 0.1215686, 0, 1, 1,
0.5032446, 1.096603, 0.9912695, 0.1294118, 0, 1, 1,
0.5045936, 0.3792125, 0.2345298, 0.1333333, 0, 1, 1,
0.5115626, 0.3933656, 1.170169, 0.1411765, 0, 1, 1,
0.5119193, -1.107742, 4.123554, 0.145098, 0, 1, 1,
0.5141352, 0.9310445, 1.257811, 0.1529412, 0, 1, 1,
0.5158532, -0.920602, 3.38173, 0.1568628, 0, 1, 1,
0.5264183, -1.522247, 3.27711, 0.1647059, 0, 1, 1,
0.537568, -0.01688013, 2.480473, 0.1686275, 0, 1, 1,
0.5379776, 1.435694, -0.1078714, 0.1764706, 0, 1, 1,
0.5391242, -0.3344151, 1.999061, 0.1803922, 0, 1, 1,
0.5438117, 0.1295507, 1.080295, 0.1882353, 0, 1, 1,
0.5470876, 1.097638, 1.703752, 0.1921569, 0, 1, 1,
0.547666, 1.292314, 0.8887944, 0.2, 0, 1, 1,
0.5485201, -0.3588407, 0.9136569, 0.2078431, 0, 1, 1,
0.5556294, 0.2060843, -0.2454924, 0.2117647, 0, 1, 1,
0.5573171, 0.7634006, 0.5603003, 0.2196078, 0, 1, 1,
0.5588009, 0.7480531, 1.574452, 0.2235294, 0, 1, 1,
0.5588465, -0.02179054, 2.114711, 0.2313726, 0, 1, 1,
0.5595955, -0.1200299, 3.168869, 0.2352941, 0, 1, 1,
0.5639715, 1.252837, -1.658624, 0.2431373, 0, 1, 1,
0.568521, 0.6984181, -0.9672285, 0.2470588, 0, 1, 1,
0.5686417, -0.150128, 0.1764718, 0.254902, 0, 1, 1,
0.56881, -0.005410619, 1.462794, 0.2588235, 0, 1, 1,
0.5816968, -0.4120232, 1.845751, 0.2666667, 0, 1, 1,
0.5820956, 0.8366606, -0.3114031, 0.2705882, 0, 1, 1,
0.5933375, 0.8395156, 0.1062944, 0.2784314, 0, 1, 1,
0.5956459, 0.4560513, -0.3785239, 0.282353, 0, 1, 1,
0.5958286, 1.265503, 1.309472, 0.2901961, 0, 1, 1,
0.5959023, -0.09449785, 2.522015, 0.2941177, 0, 1, 1,
0.6003569, 0.1473362, 1.529093, 0.3019608, 0, 1, 1,
0.6034345, 1.378599, 0.2918842, 0.3098039, 0, 1, 1,
0.603621, -1.569736, 1.957923, 0.3137255, 0, 1, 1,
0.611142, 0.006077376, 1.115404, 0.3215686, 0, 1, 1,
0.6115493, -0.6128987, 1.969398, 0.3254902, 0, 1, 1,
0.6162519, 0.9421, -0.2540428, 0.3333333, 0, 1, 1,
0.6162996, -1.152707, 2.061031, 0.3372549, 0, 1, 1,
0.6304027, 1.05336, 0.1765621, 0.345098, 0, 1, 1,
0.6358097, 0.3680876, 2.078619, 0.3490196, 0, 1, 1,
0.6364979, -0.8548886, 3.663996, 0.3568628, 0, 1, 1,
0.6385362, -1.177584, 3.348446, 0.3607843, 0, 1, 1,
0.6390399, -0.7364784, 2.333615, 0.3686275, 0, 1, 1,
0.6440207, -0.7173811, 3.45211, 0.372549, 0, 1, 1,
0.6480213, 0.1080325, 2.337873, 0.3803922, 0, 1, 1,
0.6627011, 0.977975, 0.9705157, 0.3843137, 0, 1, 1,
0.6665042, 0.743452, 0.888565, 0.3921569, 0, 1, 1,
0.6677605, 0.9266129, 0.7474137, 0.3960784, 0, 1, 1,
0.6691341, 0.2539656, 0.311019, 0.4039216, 0, 1, 1,
0.6733835, 0.2861217, 0.9608892, 0.4117647, 0, 1, 1,
0.6750517, -0.8963104, 2.595076, 0.4156863, 0, 1, 1,
0.6792947, -1.983654, 2.225074, 0.4235294, 0, 1, 1,
0.6800921, 1.149883, 1.283983, 0.427451, 0, 1, 1,
0.6810836, -2.301909, 4.229797, 0.4352941, 0, 1, 1,
0.683497, 0.9672101, -0.4174743, 0.4392157, 0, 1, 1,
0.6855404, 0.6555979, 0.3166072, 0.4470588, 0, 1, 1,
0.6884537, -0.7265216, 1.328447, 0.4509804, 0, 1, 1,
0.6899681, -1.037598, 3.402079, 0.4588235, 0, 1, 1,
0.6921955, -0.7684478, 2.810607, 0.4627451, 0, 1, 1,
0.6931271, 0.4250894, 0.8261914, 0.4705882, 0, 1, 1,
0.696224, 1.163897, -1.438396, 0.4745098, 0, 1, 1,
0.6982527, -0.4057845, 2.147778, 0.4823529, 0, 1, 1,
0.6987736, -0.5525078, 0.4684227, 0.4862745, 0, 1, 1,
0.7071229, 1.563895, 0.9650091, 0.4941176, 0, 1, 1,
0.7101571, -1.010774, 1.726472, 0.5019608, 0, 1, 1,
0.7174098, -1.008868, 4.338573, 0.5058824, 0, 1, 1,
0.7205737, -0.1069722, 1.701237, 0.5137255, 0, 1, 1,
0.722366, -0.8290819, 2.202758, 0.5176471, 0, 1, 1,
0.7291643, 0.859165, 2.24874, 0.5254902, 0, 1, 1,
0.7295475, 0.4017237, 0.9546286, 0.5294118, 0, 1, 1,
0.7301468, 1.727392, 1.068272, 0.5372549, 0, 1, 1,
0.7340131, -0.2970814, 0.6810383, 0.5411765, 0, 1, 1,
0.7389045, 0.837957, 4.044395, 0.5490196, 0, 1, 1,
0.7419181, 0.05000002, 2.31538, 0.5529412, 0, 1, 1,
0.7524748, 1.388255, 1.69663, 0.5607843, 0, 1, 1,
0.7526443, -0.952131, 0.9293705, 0.5647059, 0, 1, 1,
0.7599776, 0.02955174, -1.495556, 0.572549, 0, 1, 1,
0.7719657, 0.01654521, 2.060961, 0.5764706, 0, 1, 1,
0.7750496, -0.3846343, 3.502831, 0.5843138, 0, 1, 1,
0.776531, -0.7843111, 2.069974, 0.5882353, 0, 1, 1,
0.7793788, -1.588658, 3.307002, 0.5960785, 0, 1, 1,
0.7849306, 0.4636362, 0.3556629, 0.6039216, 0, 1, 1,
0.7858782, -0.1956665, 3.278331, 0.6078432, 0, 1, 1,
0.7875462, 0.2544282, 1.642991, 0.6156863, 0, 1, 1,
0.7881509, -0.8884567, 2.339512, 0.6196079, 0, 1, 1,
0.7883398, 1.535716, 1.629177, 0.627451, 0, 1, 1,
0.7889389, 1.452965, -0.1097301, 0.6313726, 0, 1, 1,
0.7907615, -0.6489459, 0.7179464, 0.6392157, 0, 1, 1,
0.7982602, 0.1385595, 0.705568, 0.6431373, 0, 1, 1,
0.799505, 1.107924, 1.381712, 0.6509804, 0, 1, 1,
0.8052943, -0.864038, 1.970304, 0.654902, 0, 1, 1,
0.8063673, -0.8163583, 2.942692, 0.6627451, 0, 1, 1,
0.8186939, -0.3186941, 1.592569, 0.6666667, 0, 1, 1,
0.8210394, 0.2411652, 0.345803, 0.6745098, 0, 1, 1,
0.8213375, 0.8744779, -0.3254225, 0.6784314, 0, 1, 1,
0.8248596, 0.6921299, 2.197906, 0.6862745, 0, 1, 1,
0.8309038, -1.401049, 1.015972, 0.6901961, 0, 1, 1,
0.8311101, -0.2555158, 1.932419, 0.6980392, 0, 1, 1,
0.8377603, 0.1728107, 0.7556561, 0.7058824, 0, 1, 1,
0.8379397, 1.346955, -0.3749254, 0.7098039, 0, 1, 1,
0.8400379, -1.566631, 2.465052, 0.7176471, 0, 1, 1,
0.8401303, 0.4225008, 0.782224, 0.7215686, 0, 1, 1,
0.8410701, -0.1519974, 1.408832, 0.7294118, 0, 1, 1,
0.8416286, -1.001922, 2.057424, 0.7333333, 0, 1, 1,
0.8451552, 1.514621, 0.7215731, 0.7411765, 0, 1, 1,
0.8530059, -0.9949766, 1.685571, 0.7450981, 0, 1, 1,
0.8532816, -0.3398157, 1.777431, 0.7529412, 0, 1, 1,
0.8547072, -2.09, 2.422363, 0.7568628, 0, 1, 1,
0.8552818, 2.014809, 2.798828, 0.7647059, 0, 1, 1,
0.8554828, 0.2624927, 1.021108, 0.7686275, 0, 1, 1,
0.8575949, -1.335018, 1.32253, 0.7764706, 0, 1, 1,
0.859751, -0.6101881, 3.073749, 0.7803922, 0, 1, 1,
0.8672647, 1.259357, 1.120614, 0.7882353, 0, 1, 1,
0.8741551, -1.243137, 1.016783, 0.7921569, 0, 1, 1,
0.8754063, -0.4186759, 2.347618, 0.8, 0, 1, 1,
0.8759418, 0.2664283, 0.8652822, 0.8078431, 0, 1, 1,
0.8862531, 0.5971628, 1.199867, 0.8117647, 0, 1, 1,
0.8876899, -0.6036422, 0.7752328, 0.8196079, 0, 1, 1,
0.8914649, 0.1532589, 1.16158, 0.8235294, 0, 1, 1,
0.8967398, -2.357812, 1.357152, 0.8313726, 0, 1, 1,
0.8968237, -0.6517714, 3.780882, 0.8352941, 0, 1, 1,
0.9001592, 1.974763, -0.194924, 0.8431373, 0, 1, 1,
0.9063528, -1.104031, 2.645257, 0.8470588, 0, 1, 1,
0.9087272, -0.4461125, 1.040735, 0.854902, 0, 1, 1,
0.9148065, -1.19108, 2.700043, 0.8588235, 0, 1, 1,
0.9153677, -1.852069, 2.907482, 0.8666667, 0, 1, 1,
0.9157737, -0.5450208, 2.351022, 0.8705882, 0, 1, 1,
0.9165446, 0.9879109, 1.212684, 0.8784314, 0, 1, 1,
0.917497, -0.5139226, 4.447322, 0.8823529, 0, 1, 1,
0.9196586, 0.1302864, 3.031563, 0.8901961, 0, 1, 1,
0.9249689, 0.1625399, 3.156027, 0.8941177, 0, 1, 1,
0.9268745, -0.4416373, 1.786987, 0.9019608, 0, 1, 1,
0.9272669, -1.456512, 3.674815, 0.9098039, 0, 1, 1,
0.9292336, 1.379712, 1.094201, 0.9137255, 0, 1, 1,
0.9295185, -1.757017, 3.457695, 0.9215686, 0, 1, 1,
0.9303461, -0.1334138, 1.310239, 0.9254902, 0, 1, 1,
0.9352399, 0.8602362, 1.188141, 0.9333333, 0, 1, 1,
0.937757, 0.121472, 0.9152625, 0.9372549, 0, 1, 1,
0.9431357, 0.02978412, 1.061061, 0.945098, 0, 1, 1,
0.9432618, -0.263618, 2.511194, 0.9490196, 0, 1, 1,
0.9458137, -0.2966715, 1.298884, 0.9568627, 0, 1, 1,
0.953274, 1.16419, 1.776342, 0.9607843, 0, 1, 1,
0.953895, -0.185605, 0.7740267, 0.9686275, 0, 1, 1,
0.9547185, 0.512899, 2.437023, 0.972549, 0, 1, 1,
0.9581866, -1.670775, 2.435831, 0.9803922, 0, 1, 1,
0.9619672, 0.5585253, 1.923847, 0.9843137, 0, 1, 1,
0.9626583, 0.7276698, 0.2634411, 0.9921569, 0, 1, 1,
0.9678282, 0.6053238, 0.5331299, 0.9960784, 0, 1, 1,
0.9729748, -0.9870462, 1.459452, 1, 0, 0.9960784, 1,
0.9745048, 0.5430848, 1.712553, 1, 0, 0.9882353, 1,
0.9795653, 1.088409, 0.04073082, 1, 0, 0.9843137, 1,
0.9806161, 0.9726394, 0.3692144, 1, 0, 0.9764706, 1,
0.9809719, -0.1842889, 2.100075, 1, 0, 0.972549, 1,
0.9931987, -1.244739, 2.584324, 1, 0, 0.9647059, 1,
0.9939881, -0.1750451, 2.090186, 1, 0, 0.9607843, 1,
1.004744, -2.630352, 2.33864, 1, 0, 0.9529412, 1,
1.013823, 0.7336194, 1.846064, 1, 0, 0.9490196, 1,
1.013852, -1.169631, 4.162652, 1, 0, 0.9411765, 1,
1.014041, 0.8555018, -0.8793157, 1, 0, 0.9372549, 1,
1.01912, 0.7032109, 0.1634364, 1, 0, 0.9294118, 1,
1.020467, -1.285526, 1.718007, 1, 0, 0.9254902, 1,
1.022759, -0.2856569, 2.868934, 1, 0, 0.9176471, 1,
1.024302, 0.615773, 1.113736, 1, 0, 0.9137255, 1,
1.024463, -0.2708794, 0.4683866, 1, 0, 0.9058824, 1,
1.031104, 0.08976022, 1.142465, 1, 0, 0.9019608, 1,
1.032601, -0.147496, 1.216521, 1, 0, 0.8941177, 1,
1.038327, 0.2175473, 1.450611, 1, 0, 0.8862745, 1,
1.04598, -0.5148572, 1.440723, 1, 0, 0.8823529, 1,
1.046105, 0.01820455, 1.927156, 1, 0, 0.8745098, 1,
1.046343, -1.772654, 3.061487, 1, 0, 0.8705882, 1,
1.046363, 0.8047995, 0.8493175, 1, 0, 0.8627451, 1,
1.048784, 0.442032, 1.609596, 1, 0, 0.8588235, 1,
1.057564, -1.072835, 4.150788, 1, 0, 0.8509804, 1,
1.065415, 0.6217448, 1.466519, 1, 0, 0.8470588, 1,
1.066728, 0.0245061, 0.8475496, 1, 0, 0.8392157, 1,
1.074428, -0.3530326, 2.274059, 1, 0, 0.8352941, 1,
1.075003, -0.0523735, 2.549407, 1, 0, 0.827451, 1,
1.080661, 0.4978023, 0.3200805, 1, 0, 0.8235294, 1,
1.083122, -0.5952516, 2.350214, 1, 0, 0.8156863, 1,
1.085585, -1.204525, 1.300054, 1, 0, 0.8117647, 1,
1.093562, 0.5103105, 2.612162, 1, 0, 0.8039216, 1,
1.094764, 1.093636, 1.091855, 1, 0, 0.7960784, 1,
1.096059, 0.4072103, 1.239384, 1, 0, 0.7921569, 1,
1.10488, -1.380807, 1.87364, 1, 0, 0.7843137, 1,
1.105627, 0.3533742, 1.279642, 1, 0, 0.7803922, 1,
1.107596, 1.016862, 1.935432, 1, 0, 0.772549, 1,
1.108795, 0.6118149, 2.160142, 1, 0, 0.7686275, 1,
1.110408, 0.2300189, 0.6679475, 1, 0, 0.7607843, 1,
1.113384, -0.2384136, 1.808555, 1, 0, 0.7568628, 1,
1.115536, 1.622113, 1.42929, 1, 0, 0.7490196, 1,
1.124633, -1.55538, 4.982313, 1, 0, 0.7450981, 1,
1.131992, 0.268802, 1.034827, 1, 0, 0.7372549, 1,
1.139013, 0.5452991, 1.697848, 1, 0, 0.7333333, 1,
1.144594, 0.7573547, 1.312892, 1, 0, 0.7254902, 1,
1.145545, -0.6445568, 2.107864, 1, 0, 0.7215686, 1,
1.154135, 2.544483, 2.680367, 1, 0, 0.7137255, 1,
1.155405, 0.7660624, 3.102105, 1, 0, 0.7098039, 1,
1.156441, -1.464269, 1.311551, 1, 0, 0.7019608, 1,
1.1596, 0.4047802, 2.400322, 1, 0, 0.6941177, 1,
1.167014, -0.1496837, 2.086588, 1, 0, 0.6901961, 1,
1.169468, 1.646472, 1.245477, 1, 0, 0.682353, 1,
1.172024, -1.032005, 2.067678, 1, 0, 0.6784314, 1,
1.177601, 0.8335198, -0.3559333, 1, 0, 0.6705883, 1,
1.181406, 1.98001, 2.572093, 1, 0, 0.6666667, 1,
1.188564, 0.1373447, 2.090356, 1, 0, 0.6588235, 1,
1.202683, -0.8752754, 2.851408, 1, 0, 0.654902, 1,
1.205496, -0.1640564, 1.88452, 1, 0, 0.6470588, 1,
1.212257, 0.9671291, 1.670139, 1, 0, 0.6431373, 1,
1.218983, -0.548431, 1.266036, 1, 0, 0.6352941, 1,
1.233239, 0.1852026, 0.4458267, 1, 0, 0.6313726, 1,
1.233409, -1.253099, 4.072537, 1, 0, 0.6235294, 1,
1.268915, 0.7229607, 0.2246528, 1, 0, 0.6196079, 1,
1.272277, 0.8438347, 1.78294, 1, 0, 0.6117647, 1,
1.28237, 1.39606, 0.8487024, 1, 0, 0.6078432, 1,
1.282601, 0.3051354, 0.8295176, 1, 0, 0.6, 1,
1.282822, -0.0011231, 2.049743, 1, 0, 0.5921569, 1,
1.298038, -0.8321795, 2.114862, 1, 0, 0.5882353, 1,
1.299979, 0.149248, 0.2830026, 1, 0, 0.5803922, 1,
1.31065, 1.548328, 0.5513971, 1, 0, 0.5764706, 1,
1.31706, -0.165572, 1.722669, 1, 0, 0.5686275, 1,
1.322113, 0.1669514, 1.647622, 1, 0, 0.5647059, 1,
1.322431, -0.9783567, -0.5208318, 1, 0, 0.5568628, 1,
1.330297, -1.010917, 1.207285, 1, 0, 0.5529412, 1,
1.346967, -0.9646924, 2.934433, 1, 0, 0.5450981, 1,
1.354743, -0.4662123, 2.849254, 1, 0, 0.5411765, 1,
1.362188, 0.06655553, 1.852946, 1, 0, 0.5333334, 1,
1.365693, 1.1359, -0.4685321, 1, 0, 0.5294118, 1,
1.374161, -2.194624, 3.719848, 1, 0, 0.5215687, 1,
1.374758, -1.176056, 3.822989, 1, 0, 0.5176471, 1,
1.384646, 0.4221418, 1.906999, 1, 0, 0.509804, 1,
1.388003, 0.9189112, 2.22494, 1, 0, 0.5058824, 1,
1.388782, 1.241927, 1.348639, 1, 0, 0.4980392, 1,
1.420006, 1.080769, 1.265282, 1, 0, 0.4901961, 1,
1.435779, 1.456968, 0.7974315, 1, 0, 0.4862745, 1,
1.446239, -0.5328188, 4.039284, 1, 0, 0.4784314, 1,
1.466837, -1.386347, 2.53951, 1, 0, 0.4745098, 1,
1.476755, -1.526902, 2.21416, 1, 0, 0.4666667, 1,
1.480422, 0.8335949, 2.17122, 1, 0, 0.4627451, 1,
1.481346, -0.380212, 1.201864, 1, 0, 0.454902, 1,
1.482533, 0.7952204, -0.9507053, 1, 0, 0.4509804, 1,
1.517896, -0.5852043, 3.109544, 1, 0, 0.4431373, 1,
1.521054, 1.794016, -0.6469856, 1, 0, 0.4392157, 1,
1.533066, 0.0163692, 2.523727, 1, 0, 0.4313726, 1,
1.540298, 0.3023539, 1.305877, 1, 0, 0.427451, 1,
1.5484, -0.06573799, 0.4609584, 1, 0, 0.4196078, 1,
1.549354, -0.1150989, 2.126954, 1, 0, 0.4156863, 1,
1.550738, 0.02434379, 1.397652, 1, 0, 0.4078431, 1,
1.551745, -0.3921797, 0.5742037, 1, 0, 0.4039216, 1,
1.569892, 0.7524146, 0.135742, 1, 0, 0.3960784, 1,
1.57452, -0.9518059, 1.13471, 1, 0, 0.3882353, 1,
1.596907, 1.028489, -0.8939367, 1, 0, 0.3843137, 1,
1.602675, -1.308128, 1.475497, 1, 0, 0.3764706, 1,
1.604324, -0.2541128, 1.632915, 1, 0, 0.372549, 1,
1.611059, -0.7759746, 1.495932, 1, 0, 0.3647059, 1,
1.61766, 0.5956142, 0.2700485, 1, 0, 0.3607843, 1,
1.626819, -0.1067422, 1.19212, 1, 0, 0.3529412, 1,
1.627248, -1.949533, 0.9483323, 1, 0, 0.3490196, 1,
1.634905, 0.3847334, 1.097719, 1, 0, 0.3411765, 1,
1.639708, -1.051736, 2.416245, 1, 0, 0.3372549, 1,
1.652521, -1.506199, 2.163428, 1, 0, 0.3294118, 1,
1.669017, -0.06833343, 1.593479, 1, 0, 0.3254902, 1,
1.688553, -1.255536, 2.87717, 1, 0, 0.3176471, 1,
1.688771, 1.563136, 0.8263393, 1, 0, 0.3137255, 1,
1.693701, 0.5302638, 1.338251, 1, 0, 0.3058824, 1,
1.718558, -1.385051, 1.951518, 1, 0, 0.2980392, 1,
1.72457, -1.907291, 2.491107, 1, 0, 0.2941177, 1,
1.734522, -0.421793, 2.198473, 1, 0, 0.2862745, 1,
1.736199, -1.384483, 2.982586, 1, 0, 0.282353, 1,
1.739965, 0.2953778, 3.279211, 1, 0, 0.2745098, 1,
1.777431, 0.3972033, 1.37941, 1, 0, 0.2705882, 1,
1.784639, -1.821008, 2.61145, 1, 0, 0.2627451, 1,
1.792087, 0.01134756, 1.001158, 1, 0, 0.2588235, 1,
1.796299, -0.6176765, 3.360318, 1, 0, 0.2509804, 1,
1.80073, -0.6997448, 2.599457, 1, 0, 0.2470588, 1,
1.809096, 0.8559724, 1.808935, 1, 0, 0.2392157, 1,
1.809358, 0.7820685, 1.172951, 1, 0, 0.2352941, 1,
1.820166, -0.3260589, 0.7264068, 1, 0, 0.227451, 1,
1.822239, 2.205231, 2.308362, 1, 0, 0.2235294, 1,
1.853848, 0.3430233, 0.4245837, 1, 0, 0.2156863, 1,
1.859075, 0.9065604, 0.526146, 1, 0, 0.2117647, 1,
1.864898, 0.7638789, 0.9785689, 1, 0, 0.2039216, 1,
1.882376, 0.6740351, 0.8692344, 1, 0, 0.1960784, 1,
1.888928, 0.08431513, 1.347719, 1, 0, 0.1921569, 1,
1.894432, -0.3014944, 1.004828, 1, 0, 0.1843137, 1,
1.963035, -0.9601137, 2.608263, 1, 0, 0.1803922, 1,
1.978004, 0.6103014, 0.9662938, 1, 0, 0.172549, 1,
1.981207, 0.5445515, 2.998165, 1, 0, 0.1686275, 1,
1.983333, 2.461073, -0.3332286, 1, 0, 0.1607843, 1,
1.988633, -0.1377095, 1.562403, 1, 0, 0.1568628, 1,
1.995686, -0.2851551, 2.178864, 1, 0, 0.1490196, 1,
2.008512, -0.03387307, 2.460447, 1, 0, 0.145098, 1,
2.01182, 0.5082541, 2.715656, 1, 0, 0.1372549, 1,
2.018186, 1.078162, -0.03651822, 1, 0, 0.1333333, 1,
2.084397, 1.121339, 0.6738883, 1, 0, 0.1254902, 1,
2.100578, -0.8501526, 2.69312, 1, 0, 0.1215686, 1,
2.117774, -1.238781, 2.211026, 1, 0, 0.1137255, 1,
2.142362, 1.778977, 2.059222, 1, 0, 0.1098039, 1,
2.225715, -0.2614573, 1.748973, 1, 0, 0.1019608, 1,
2.240371, 1.80842, -0.7514984, 1, 0, 0.09411765, 1,
2.253917, -0.4230279, 2.999028, 1, 0, 0.09019608, 1,
2.25848, -0.665024, 3.207242, 1, 0, 0.08235294, 1,
2.280513, -0.2861231, 0.9033142, 1, 0, 0.07843138, 1,
2.36111, 0.5552465, 0.5263882, 1, 0, 0.07058824, 1,
2.374262, -1.573986, 2.418701, 1, 0, 0.06666667, 1,
2.393363, -0.5797943, 0.7184, 1, 0, 0.05882353, 1,
2.408211, -1.247359, 2.180754, 1, 0, 0.05490196, 1,
2.418597, 1.824808, 0.8664401, 1, 0, 0.04705882, 1,
2.512047, -0.3814544, 1.718033, 1, 0, 0.04313726, 1,
2.535783, 0.7041138, 1.610664, 1, 0, 0.03529412, 1,
2.755832, -0.8727247, 2.190055, 1, 0, 0.03137255, 1,
2.780257, -0.7507127, 1.670359, 1, 0, 0.02352941, 1,
2.897255, -1.081223, 1.439035, 1, 0, 0.01960784, 1,
3.145692, 0.06347155, 2.014891, 1, 0, 0.01176471, 1,
3.619551, -1.208541, 2.67292, 1, 0, 0.007843138, 1
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
0.4604189, -4.632533, -6.343337, 0, -0.5, 0.5, 0.5,
0.4604189, -4.632533, -6.343337, 1, -0.5, 0.5, 0.5,
0.4604189, -4.632533, -6.343337, 1, 1.5, 0.5, 0.5,
0.4604189, -4.632533, -6.343337, 0, 1.5, 0.5, 0.5
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
-3.769659, -0.265646, -6.343337, 0, -0.5, 0.5, 0.5,
-3.769659, -0.265646, -6.343337, 1, -0.5, 0.5, 0.5,
-3.769659, -0.265646, -6.343337, 1, 1.5, 0.5, 0.5,
-3.769659, -0.265646, -6.343337, 0, 1.5, 0.5, 0.5
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
-3.769659, -4.632533, 0.1796174, 0, -0.5, 0.5, 0.5,
-3.769659, -4.632533, 0.1796174, 1, -0.5, 0.5, 0.5,
-3.769659, -4.632533, 0.1796174, 1, 1.5, 0.5, 0.5,
-3.769659, -4.632533, 0.1796174, 0, 1.5, 0.5, 0.5
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
-2, -3.62479, -4.838039,
3, -3.62479, -4.838039,
-2, -3.62479, -4.838039,
-2, -3.792747, -5.088922,
-1, -3.62479, -4.838039,
-1, -3.792747, -5.088922,
0, -3.62479, -4.838039,
0, -3.792747, -5.088922,
1, -3.62479, -4.838039,
1, -3.792747, -5.088922,
2, -3.62479, -4.838039,
2, -3.792747, -5.088922,
3, -3.62479, -4.838039,
3, -3.792747, -5.088922
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
-2, -4.128662, -5.590688, 0, -0.5, 0.5, 0.5,
-2, -4.128662, -5.590688, 1, -0.5, 0.5, 0.5,
-2, -4.128662, -5.590688, 1, 1.5, 0.5, 0.5,
-2, -4.128662, -5.590688, 0, 1.5, 0.5, 0.5,
-1, -4.128662, -5.590688, 0, -0.5, 0.5, 0.5,
-1, -4.128662, -5.590688, 1, -0.5, 0.5, 0.5,
-1, -4.128662, -5.590688, 1, 1.5, 0.5, 0.5,
-1, -4.128662, -5.590688, 0, 1.5, 0.5, 0.5,
0, -4.128662, -5.590688, 0, -0.5, 0.5, 0.5,
0, -4.128662, -5.590688, 1, -0.5, 0.5, 0.5,
0, -4.128662, -5.590688, 1, 1.5, 0.5, 0.5,
0, -4.128662, -5.590688, 0, 1.5, 0.5, 0.5,
1, -4.128662, -5.590688, 0, -0.5, 0.5, 0.5,
1, -4.128662, -5.590688, 1, -0.5, 0.5, 0.5,
1, -4.128662, -5.590688, 1, 1.5, 0.5, 0.5,
1, -4.128662, -5.590688, 0, 1.5, 0.5, 0.5,
2, -4.128662, -5.590688, 0, -0.5, 0.5, 0.5,
2, -4.128662, -5.590688, 1, -0.5, 0.5, 0.5,
2, -4.128662, -5.590688, 1, 1.5, 0.5, 0.5,
2, -4.128662, -5.590688, 0, 1.5, 0.5, 0.5,
3, -4.128662, -5.590688, 0, -0.5, 0.5, 0.5,
3, -4.128662, -5.590688, 1, -0.5, 0.5, 0.5,
3, -4.128662, -5.590688, 1, 1.5, 0.5, 0.5,
3, -4.128662, -5.590688, 0, 1.5, 0.5, 0.5
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
-2.793487, -3, -4.838039,
-2.793487, 2, -4.838039,
-2.793487, -3, -4.838039,
-2.956182, -3, -5.088922,
-2.793487, -2, -4.838039,
-2.956182, -2, -5.088922,
-2.793487, -1, -4.838039,
-2.956182, -1, -5.088922,
-2.793487, 0, -4.838039,
-2.956182, 0, -5.088922,
-2.793487, 1, -4.838039,
-2.956182, 1, -5.088922,
-2.793487, 2, -4.838039,
-2.956182, 2, -5.088922
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
-3.281573, -3, -5.590688, 0, -0.5, 0.5, 0.5,
-3.281573, -3, -5.590688, 1, -0.5, 0.5, 0.5,
-3.281573, -3, -5.590688, 1, 1.5, 0.5, 0.5,
-3.281573, -3, -5.590688, 0, 1.5, 0.5, 0.5,
-3.281573, -2, -5.590688, 0, -0.5, 0.5, 0.5,
-3.281573, -2, -5.590688, 1, -0.5, 0.5, 0.5,
-3.281573, -2, -5.590688, 1, 1.5, 0.5, 0.5,
-3.281573, -2, -5.590688, 0, 1.5, 0.5, 0.5,
-3.281573, -1, -5.590688, 0, -0.5, 0.5, 0.5,
-3.281573, -1, -5.590688, 1, -0.5, 0.5, 0.5,
-3.281573, -1, -5.590688, 1, 1.5, 0.5, 0.5,
-3.281573, -1, -5.590688, 0, 1.5, 0.5, 0.5,
-3.281573, 0, -5.590688, 0, -0.5, 0.5, 0.5,
-3.281573, 0, -5.590688, 1, -0.5, 0.5, 0.5,
-3.281573, 0, -5.590688, 1, 1.5, 0.5, 0.5,
-3.281573, 0, -5.590688, 0, 1.5, 0.5, 0.5,
-3.281573, 1, -5.590688, 0, -0.5, 0.5, 0.5,
-3.281573, 1, -5.590688, 1, -0.5, 0.5, 0.5,
-3.281573, 1, -5.590688, 1, 1.5, 0.5, 0.5,
-3.281573, 1, -5.590688, 0, 1.5, 0.5, 0.5,
-3.281573, 2, -5.590688, 0, -0.5, 0.5, 0.5,
-3.281573, 2, -5.590688, 1, -0.5, 0.5, 0.5,
-3.281573, 2, -5.590688, 1, 1.5, 0.5, 0.5,
-3.281573, 2, -5.590688, 0, 1.5, 0.5, 0.5
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
-2.793487, -3.62479, -4,
-2.793487, -3.62479, 4,
-2.793487, -3.62479, -4,
-2.956182, -3.792747, -4,
-2.793487, -3.62479, -2,
-2.956182, -3.792747, -2,
-2.793487, -3.62479, 0,
-2.956182, -3.792747, 0,
-2.793487, -3.62479, 2,
-2.956182, -3.792747, 2,
-2.793487, -3.62479, 4,
-2.956182, -3.792747, 4
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
-3.281573, -4.128662, -4, 0, -0.5, 0.5, 0.5,
-3.281573, -4.128662, -4, 1, -0.5, 0.5, 0.5,
-3.281573, -4.128662, -4, 1, 1.5, 0.5, 0.5,
-3.281573, -4.128662, -4, 0, 1.5, 0.5, 0.5,
-3.281573, -4.128662, -2, 0, -0.5, 0.5, 0.5,
-3.281573, -4.128662, -2, 1, -0.5, 0.5, 0.5,
-3.281573, -4.128662, -2, 1, 1.5, 0.5, 0.5,
-3.281573, -4.128662, -2, 0, 1.5, 0.5, 0.5,
-3.281573, -4.128662, 0, 0, -0.5, 0.5, 0.5,
-3.281573, -4.128662, 0, 1, -0.5, 0.5, 0.5,
-3.281573, -4.128662, 0, 1, 1.5, 0.5, 0.5,
-3.281573, -4.128662, 0, 0, 1.5, 0.5, 0.5,
-3.281573, -4.128662, 2, 0, -0.5, 0.5, 0.5,
-3.281573, -4.128662, 2, 1, -0.5, 0.5, 0.5,
-3.281573, -4.128662, 2, 1, 1.5, 0.5, 0.5,
-3.281573, -4.128662, 2, 0, 1.5, 0.5, 0.5,
-3.281573, -4.128662, 4, 0, -0.5, 0.5, 0.5,
-3.281573, -4.128662, 4, 1, -0.5, 0.5, 0.5,
-3.281573, -4.128662, 4, 1, 1.5, 0.5, 0.5,
-3.281573, -4.128662, 4, 0, 1.5, 0.5, 0.5
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
-2.793487, -3.62479, -4.838039,
-2.793487, 3.093498, -4.838039,
-2.793487, -3.62479, 5.197274,
-2.793487, 3.093498, 5.197274,
-2.793487, -3.62479, -4.838039,
-2.793487, -3.62479, 5.197274,
-2.793487, 3.093498, -4.838039,
-2.793487, 3.093498, 5.197274,
-2.793487, -3.62479, -4.838039,
3.714325, -3.62479, -4.838039,
-2.793487, -3.62479, 5.197274,
3.714325, -3.62479, 5.197274,
-2.793487, 3.093498, -4.838039,
3.714325, 3.093498, -4.838039,
-2.793487, 3.093498, 5.197274,
3.714325, 3.093498, 5.197274,
3.714325, -3.62479, -4.838039,
3.714325, 3.093498, -4.838039,
3.714325, -3.62479, 5.197274,
3.714325, 3.093498, 5.197274,
3.714325, -3.62479, -4.838039,
3.714325, -3.62479, 5.197274,
3.714325, 3.093498, -4.838039,
3.714325, 3.093498, 5.197274
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
var radius = 7.32536;
var distance = 32.59135;
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
mvMatrix.translate( -0.4604189, 0.265646, -0.1796174 );
mvMatrix.scale( 1.217049, 1.17892, 0.7892451 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.59135);
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
Methamidophos<-read.table("Methamidophos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methamidophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methamidophos' not found
```

```r
y<-Methamidophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methamidophos' not found
```

```r
z<-Methamidophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methamidophos' not found
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
-2.698713, -0.4645482, -2.129668, 0, 0, 1, 1, 1,
-2.640146, 0.09498511, -2.128636, 1, 0, 0, 1, 1,
-2.629459, -2.006255, -0.573546, 1, 0, 0, 1, 1,
-2.60624, 0.2614269, -0.7743611, 1, 0, 0, 1, 1,
-2.585674, 1.175014, -0.01045659, 1, 0, 0, 1, 1,
-2.582728, 1.229168, -1.378839, 1, 0, 0, 1, 1,
-2.578025, 0.6314372, -1.036128, 0, 0, 0, 1, 1,
-2.553402, -0.2164657, -3.182225, 0, 0, 0, 1, 1,
-2.527369, -0.9479955, -2.819357, 0, 0, 0, 1, 1,
-2.440981, 0.2010297, -0.9045843, 0, 0, 0, 1, 1,
-2.365594, 0.3894846, -2.375641, 0, 0, 0, 1, 1,
-2.320657, 1.179167, -0.4268206, 0, 0, 0, 1, 1,
-2.319706, -3.193292, -2.23519, 0, 0, 0, 1, 1,
-2.234879, -1.488601, -2.241915, 1, 1, 1, 1, 1,
-2.15691, 0.4128971, -0.8995212, 1, 1, 1, 1, 1,
-2.093511, -0.3231179, -2.288476, 1, 1, 1, 1, 1,
-2.086115, -0.6794937, -1.620898, 1, 1, 1, 1, 1,
-2.06073, 2.995659, -2.202837, 1, 1, 1, 1, 1,
-2.041568, -1.069864, -1.209108, 1, 1, 1, 1, 1,
-2.013844, -0.8372088, -1.462065, 1, 1, 1, 1, 1,
-1.996061, 0.3550409, -0.4788348, 1, 1, 1, 1, 1,
-1.981026, 0.1590254, -1.492615, 1, 1, 1, 1, 1,
-1.974505, -1.190459, -2.652377, 1, 1, 1, 1, 1,
-1.930803, 1.689955, 0.5770819, 1, 1, 1, 1, 1,
-1.913368, 0.4622284, -2.724788, 1, 1, 1, 1, 1,
-1.897696, 0.5344181, -1.321178, 1, 1, 1, 1, 1,
-1.892076, 1.794001, 0.5061249, 1, 1, 1, 1, 1,
-1.87102, 0.574035, -2.772319, 1, 1, 1, 1, 1,
-1.82297, -0.7046939, -1.985849, 0, 0, 1, 1, 1,
-1.816029, -0.2032309, -0.9413339, 1, 0, 0, 1, 1,
-1.808152, 1.97696, -2.519629, 1, 0, 0, 1, 1,
-1.805001, -0.1020013, -1.163508, 1, 0, 0, 1, 1,
-1.799539, 0.002286213, 0.03853057, 1, 0, 0, 1, 1,
-1.791581, 0.06437661, -2.795803, 1, 0, 0, 1, 1,
-1.783864, 0.7363265, -1.328872, 0, 0, 0, 1, 1,
-1.711483, 0.81611, -1.559504, 0, 0, 0, 1, 1,
-1.706242, -0.864252, -0.7051987, 0, 0, 0, 1, 1,
-1.68958, 0.4575327, -0.3954502, 0, 0, 0, 1, 1,
-1.660845, -1.951391, -3.593994, 0, 0, 0, 1, 1,
-1.655762, -0.7655867, -2.315584, 0, 0, 0, 1, 1,
-1.653041, -1.403988, -3.089921, 0, 0, 0, 1, 1,
-1.652964, 2.58086, -2.038807, 1, 1, 1, 1, 1,
-1.637506, -0.3446585, -0.608144, 1, 1, 1, 1, 1,
-1.636132, -0.6448981, -4.126665, 1, 1, 1, 1, 1,
-1.636122, -0.9730975, -1.641306, 1, 1, 1, 1, 1,
-1.613633, 0.9740537, -2.00824, 1, 1, 1, 1, 1,
-1.613431, 0.9118045, -0.2746971, 1, 1, 1, 1, 1,
-1.598349, 0.7086433, -1.374649, 1, 1, 1, 1, 1,
-1.570812, -0.7548587, -3.677831, 1, 1, 1, 1, 1,
-1.567882, 1.567104, -2.421084, 1, 1, 1, 1, 1,
-1.537282, 0.3189501, -2.813387, 1, 1, 1, 1, 1,
-1.531691, -0.2751988, -2.144978, 1, 1, 1, 1, 1,
-1.528128, 1.232558, -0.7660299, 1, 1, 1, 1, 1,
-1.482025, 0.8662575, 0.5352334, 1, 1, 1, 1, 1,
-1.470862, -0.7132106, -2.426771, 1, 1, 1, 1, 1,
-1.466196, -0.03026615, -4.078253, 1, 1, 1, 1, 1,
-1.465672, 1.062058, -1.313572, 0, 0, 1, 1, 1,
-1.453764, -0.595542, -1.084657, 1, 0, 0, 1, 1,
-1.452117, 0.6623311, -1.355143, 1, 0, 0, 1, 1,
-1.440433, -0.1598879, 0.3848927, 1, 0, 0, 1, 1,
-1.425802, -2.818136, -2.1428, 1, 0, 0, 1, 1,
-1.42416, -0.5429309, -0.943734, 1, 0, 0, 1, 1,
-1.418975, -0.5198579, -0.8561788, 0, 0, 0, 1, 1,
-1.407608, -0.418704, -4.51846, 0, 0, 0, 1, 1,
-1.406712, 1.76948, -0.215328, 0, 0, 0, 1, 1,
-1.40593, 0.1642238, -0.9504843, 0, 0, 0, 1, 1,
-1.383975, 2.122339, -1.030851, 0, 0, 0, 1, 1,
-1.381572, -1.331167, -1.971838, 0, 0, 0, 1, 1,
-1.38148, -0.2818419, -1.288998, 0, 0, 0, 1, 1,
-1.363939, -1.450256, -3.026525, 1, 1, 1, 1, 1,
-1.363121, -0.5864936, -1.113681, 1, 1, 1, 1, 1,
-1.362205, -0.2332158, -3.373826, 1, 1, 1, 1, 1,
-1.35784, 0.8735637, -1.273475, 1, 1, 1, 1, 1,
-1.354991, 1.00985, 0.7982152, 1, 1, 1, 1, 1,
-1.348211, -1.215991, -1.562912, 1, 1, 1, 1, 1,
-1.341262, -0.09905089, -1.984747, 1, 1, 1, 1, 1,
-1.336967, 0.5201226, -2.3132, 1, 1, 1, 1, 1,
-1.330101, -0.8530273, -1.594841, 1, 1, 1, 1, 1,
-1.325484, 1.837704, -0.2848613, 1, 1, 1, 1, 1,
-1.324628, -0.02849593, -1.71828, 1, 1, 1, 1, 1,
-1.311633, -0.6798876, -1.998335, 1, 1, 1, 1, 1,
-1.309873, 0.2777538, -1.972808, 1, 1, 1, 1, 1,
-1.308405, 1.091397, -0.8253803, 1, 1, 1, 1, 1,
-1.304073, 1.574978, 0.163578, 1, 1, 1, 1, 1,
-1.292938, 0.4267367, -1.334682, 0, 0, 1, 1, 1,
-1.282608, 0.4681525, -0.9095036, 1, 0, 0, 1, 1,
-1.276573, -1.165002, -1.805473, 1, 0, 0, 1, 1,
-1.272743, 0.5282559, -0.6335168, 1, 0, 0, 1, 1,
-1.269317, -1.520603, -2.178137, 1, 0, 0, 1, 1,
-1.267766, -0.4595346, -1.566107, 1, 0, 0, 1, 1,
-1.259116, 1.327956, -0.08821574, 0, 0, 0, 1, 1,
-1.25635, -3.526951, -2.445143, 0, 0, 0, 1, 1,
-1.249401, 1.291472, -0.4363347, 0, 0, 0, 1, 1,
-1.241709, -0.6458918, -3.002256, 0, 0, 0, 1, 1,
-1.238438, -1.744381, -3.366739, 0, 0, 0, 1, 1,
-1.225906, -0.1996107, -1.880749, 0, 0, 0, 1, 1,
-1.222232, 0.3618009, -2.590889, 0, 0, 0, 1, 1,
-1.221919, 0.9188514, 1.5818, 1, 1, 1, 1, 1,
-1.213988, 0.4122303, -1.017268, 1, 1, 1, 1, 1,
-1.206676, 1.358686, -2.231991, 1, 1, 1, 1, 1,
-1.203605, -1.072226, -2.488465, 1, 1, 1, 1, 1,
-1.202496, -0.2098915, -2.100727, 1, 1, 1, 1, 1,
-1.201766, -0.8186076, -2.545175, 1, 1, 1, 1, 1,
-1.201195, -0.5772602, -2.111959, 1, 1, 1, 1, 1,
-1.195821, -1.777787, -4.127494, 1, 1, 1, 1, 1,
-1.193557, -2.232637, -3.624995, 1, 1, 1, 1, 1,
-1.189474, -0.1911743, -2.465592, 1, 1, 1, 1, 1,
-1.187636, -0.8129455, -1.550199, 1, 1, 1, 1, 1,
-1.186359, -1.650508, -4.475728, 1, 1, 1, 1, 1,
-1.183745, -0.2085719, -2.293607, 1, 1, 1, 1, 1,
-1.17033, 1.15323, -0.4727903, 1, 1, 1, 1, 1,
-1.169466, 0.4115842, 0.7488807, 1, 1, 1, 1, 1,
-1.166891, 0.7327586, 0.4561752, 0, 0, 1, 1, 1,
-1.160484, -1.138759, -2.298841, 1, 0, 0, 1, 1,
-1.15915, -0.3082488, -1.91883, 1, 0, 0, 1, 1,
-1.155974, -1.889696, -4.127694, 1, 0, 0, 1, 1,
-1.154053, -0.4249623, -2.886135, 1, 0, 0, 1, 1,
-1.153255, 0.4439289, -1.553423, 1, 0, 0, 1, 1,
-1.149814, 0.5867175, -1.302135, 0, 0, 0, 1, 1,
-1.14674, 1.124311, -2.490646, 0, 0, 0, 1, 1,
-1.139338, -0.8826729, -3.417866, 0, 0, 0, 1, 1,
-1.131068, 0.6608108, -1.286622, 0, 0, 0, 1, 1,
-1.131015, -0.1287364, -0.8846617, 0, 0, 0, 1, 1,
-1.130608, 2.203469, -0.9866408, 0, 0, 0, 1, 1,
-1.12881, 1.005916, -1.912262, 0, 0, 0, 1, 1,
-1.121005, -0.09193454, -0.9560195, 1, 1, 1, 1, 1,
-1.114093, 1.688529, 0.1934748, 1, 1, 1, 1, 1,
-1.109996, 0.03222221, -2.798568, 1, 1, 1, 1, 1,
-1.103366, -0.348334, -2.813857, 1, 1, 1, 1, 1,
-1.102509, 0.5601479, -0.678191, 1, 1, 1, 1, 1,
-1.101327, 0.588478, -1.290588, 1, 1, 1, 1, 1,
-1.101219, -1.012294, -1.769034, 1, 1, 1, 1, 1,
-1.093049, -0.7896928, -3.00177, 1, 1, 1, 1, 1,
-1.088695, -0.6571975, -0.1818732, 1, 1, 1, 1, 1,
-1.088086, -1.441522, -2.495087, 1, 1, 1, 1, 1,
-1.086321, 0.8130296, -1.1235, 1, 1, 1, 1, 1,
-1.082448, -1.91067, -3.590947, 1, 1, 1, 1, 1,
-1.081543, 1.45386, -0.7436568, 1, 1, 1, 1, 1,
-1.064294, -1.135279, -1.917266, 1, 1, 1, 1, 1,
-1.061565, -0.0877777, -1.126531, 1, 1, 1, 1, 1,
-1.054964, -0.9374119, -1.81003, 0, 0, 1, 1, 1,
-1.0516, 1.041367, -2.662307, 1, 0, 0, 1, 1,
-1.050464, -0.8491597, -3.883259, 1, 0, 0, 1, 1,
-1.050285, -1.885899, -1.80133, 1, 0, 0, 1, 1,
-1.037413, -0.5848851, -2.545794, 1, 0, 0, 1, 1,
-1.036525, 0.6566522, -1.544206, 1, 0, 0, 1, 1,
-1.002268, -1.048555, -1.725882, 0, 0, 0, 1, 1,
-0.9980152, -1.076109, -2.50111, 0, 0, 0, 1, 1,
-0.9965815, 0.2870876, -0.5564526, 0, 0, 0, 1, 1,
-0.9899268, -0.9367235, -2.903199, 0, 0, 0, 1, 1,
-0.9854468, -0.8376491, -1.236368, 0, 0, 0, 1, 1,
-0.9675595, -0.4500333, -1.514947, 0, 0, 0, 1, 1,
-0.9667441, 0.6720362, -1.198803, 0, 0, 0, 1, 1,
-0.9663297, -0.2913346, -1.221679, 1, 1, 1, 1, 1,
-0.9657586, 1.571835, 1.148974, 1, 1, 1, 1, 1,
-0.9585115, -0.5035636, -3.044115, 1, 1, 1, 1, 1,
-0.9582737, -0.07340758, -1.527023, 1, 1, 1, 1, 1,
-0.955909, 0.05240463, 0.6311321, 1, 1, 1, 1, 1,
-0.9514808, 0.3678842, -2.515993, 1, 1, 1, 1, 1,
-0.9497582, -1.125085, -1.064275, 1, 1, 1, 1, 1,
-0.9492177, 0.3894002, -0.3781027, 1, 1, 1, 1, 1,
-0.946184, -0.7028588, -1.620777, 1, 1, 1, 1, 1,
-0.9437238, 0.7884407, -1.771527, 1, 1, 1, 1, 1,
-0.9421687, 0.4685814, -1.489726, 1, 1, 1, 1, 1,
-0.9324212, 0.9342814, -1.20202, 1, 1, 1, 1, 1,
-0.9311816, -0.5732497, -3.5206, 1, 1, 1, 1, 1,
-0.9250124, 0.005633798, -2.717727, 1, 1, 1, 1, 1,
-0.9234825, 0.9147497, -1.372791, 1, 1, 1, 1, 1,
-0.9201697, -0.1446355, -1.424571, 0, 0, 1, 1, 1,
-0.9187126, 0.6439403, -2.165522, 1, 0, 0, 1, 1,
-0.9131035, 0.2841972, -0.9183975, 1, 0, 0, 1, 1,
-0.9113613, 1.785911, 0.3854344, 1, 0, 0, 1, 1,
-0.9058057, 0.3370509, -2.292614, 1, 0, 0, 1, 1,
-0.9048527, 1.520504, 0.445955, 1, 0, 0, 1, 1,
-0.9033347, -0.2981583, -2.784055, 0, 0, 0, 1, 1,
-0.8955055, 0.05940279, -1.497003, 0, 0, 0, 1, 1,
-0.8870442, 0.9627333, -0.1293699, 0, 0, 0, 1, 1,
-0.8795692, 1.586105, 1.122699, 0, 0, 0, 1, 1,
-0.877878, 0.5115487, -0.9221884, 0, 0, 0, 1, 1,
-0.8778477, 0.01768026, -0.4914726, 0, 0, 0, 1, 1,
-0.8746312, 1.11517, 0.3996737, 0, 0, 0, 1, 1,
-0.8739415, 0.7874696, -1.13248, 1, 1, 1, 1, 1,
-0.8694937, 2.589386, 0.2459719, 1, 1, 1, 1, 1,
-0.8637311, 1.578897, -0.2241513, 1, 1, 1, 1, 1,
-0.8615705, 0.9388112, 1.695985, 1, 1, 1, 1, 1,
-0.8552241, -0.1188839, -2.270302, 1, 1, 1, 1, 1,
-0.854996, 0.2492461, -1.293271, 1, 1, 1, 1, 1,
-0.8544464, -1.927844, -3.56145, 1, 1, 1, 1, 1,
-0.8526084, -1.395606, -1.218344, 1, 1, 1, 1, 1,
-0.8511564, 0.3671259, -1.654523, 1, 1, 1, 1, 1,
-0.8506949, 1.296164, 0.3931777, 1, 1, 1, 1, 1,
-0.8495426, -1.091273, -4.294603, 1, 1, 1, 1, 1,
-0.8465476, 1.547826, 0.5116983, 1, 1, 1, 1, 1,
-0.8391473, 2.142151, -0.419528, 1, 1, 1, 1, 1,
-0.8391386, 0.3922661, -0.6661545, 1, 1, 1, 1, 1,
-0.8282865, 1.922919, -1.944628, 1, 1, 1, 1, 1,
-0.821364, 0.7902779, -0.892463, 0, 0, 1, 1, 1,
-0.820039, -1.589769, -4.491117, 1, 0, 0, 1, 1,
-0.8198999, 0.5596532, -0.8235974, 1, 0, 0, 1, 1,
-0.8198628, 0.3932112, -2.283594, 1, 0, 0, 1, 1,
-0.8196201, -1.41726, -2.130151, 1, 0, 0, 1, 1,
-0.817116, 1.53629, 0.407801, 1, 0, 0, 1, 1,
-0.8128927, 0.6921, -1.215465, 0, 0, 0, 1, 1,
-0.809959, -1.102281, 0.2115118, 0, 0, 0, 1, 1,
-0.8065792, -1.196918, -3.876304, 0, 0, 0, 1, 1,
-0.8026645, 0.2834164, -2.147996, 0, 0, 0, 1, 1,
-0.7958452, 0.6807004, 0.118627, 0, 0, 0, 1, 1,
-0.7904235, 0.4325121, -1.175084, 0, 0, 0, 1, 1,
-0.7787797, 1.656419, -0.1331248, 0, 0, 0, 1, 1,
-0.7783172, 0.1851609, 0.1755004, 1, 1, 1, 1, 1,
-0.7710196, 1.08822, -1.616273, 1, 1, 1, 1, 1,
-0.7702459, 0.3030578, -2.520428, 1, 1, 1, 1, 1,
-0.7690611, -0.8132731, -2.760119, 1, 1, 1, 1, 1,
-0.7654155, 0.9107329, -0.3272856, 1, 1, 1, 1, 1,
-0.758858, -0.5300794, -3.649688, 1, 1, 1, 1, 1,
-0.7587976, -0.9951106, -0.4601913, 1, 1, 1, 1, 1,
-0.754617, 0.9961711, -1.437378, 1, 1, 1, 1, 1,
-0.7545662, 0.2240478, -2.372353, 1, 1, 1, 1, 1,
-0.7497228, 1.226401, 0.07321772, 1, 1, 1, 1, 1,
-0.7434314, -0.2784742, 0.03322634, 1, 1, 1, 1, 1,
-0.74283, -0.5175132, -2.843207, 1, 1, 1, 1, 1,
-0.7425202, -0.5817695, 0.1818748, 1, 1, 1, 1, 1,
-0.7420209, 0.1777509, -2.459914, 1, 1, 1, 1, 1,
-0.7409011, 0.04172124, -1.108667, 1, 1, 1, 1, 1,
-0.7404565, 0.2814588, -1.01488, 0, 0, 1, 1, 1,
-0.7356039, -0.002408984, -0.6572131, 1, 0, 0, 1, 1,
-0.7335159, 0.2917936, -0.7866915, 1, 0, 0, 1, 1,
-0.733448, -1.434261, -3.228752, 1, 0, 0, 1, 1,
-0.732634, -0.09512524, -2.008688, 1, 0, 0, 1, 1,
-0.7324029, 0.7487122, -1.564436, 1, 0, 0, 1, 1,
-0.7307701, -0.7948828, -2.295592, 0, 0, 0, 1, 1,
-0.7289886, 0.4842494, -1.094773, 0, 0, 0, 1, 1,
-0.7273983, -0.03792618, -2.376599, 0, 0, 0, 1, 1,
-0.7270293, 0.8087362, 0.6147718, 0, 0, 0, 1, 1,
-0.7233979, -0.8565629, -2.222899, 0, 0, 0, 1, 1,
-0.7228915, -0.5657316, -1.779518, 0, 0, 0, 1, 1,
-0.7218556, -1.893345, -2.072091, 0, 0, 0, 1, 1,
-0.7062694, -0.2257898, -2.001128, 1, 1, 1, 1, 1,
-0.7037686, -0.7363589, -3.46826, 1, 1, 1, 1, 1,
-0.7030039, 0.1718192, -2.445547, 1, 1, 1, 1, 1,
-0.6997656, -0.4951279, -1.766718, 1, 1, 1, 1, 1,
-0.6950359, -1.451102, -1.823071, 1, 1, 1, 1, 1,
-0.6941674, 0.8251959, -0.2952103, 1, 1, 1, 1, 1,
-0.6865657, 0.509696, -2.00907, 1, 1, 1, 1, 1,
-0.6853484, 1.10039, 0.3186226, 1, 1, 1, 1, 1,
-0.6825044, 0.6207662, -1.481004, 1, 1, 1, 1, 1,
-0.679695, 0.6432917, -0.8427628, 1, 1, 1, 1, 1,
-0.6787235, -0.1855869, -1.816271, 1, 1, 1, 1, 1,
-0.6776085, 1.205576, -0.1258198, 1, 1, 1, 1, 1,
-0.6744814, 0.4531332, -0.2653807, 1, 1, 1, 1, 1,
-0.6690284, 1.209248, -0.5405024, 1, 1, 1, 1, 1,
-0.6678023, -0.5082766, -1.958845, 1, 1, 1, 1, 1,
-0.6508964, 1.362672, -0.6118724, 0, 0, 1, 1, 1,
-0.6467656, 0.3748389, -1.093661, 1, 0, 0, 1, 1,
-0.6406425, 0.3225552, 0.005472835, 1, 0, 0, 1, 1,
-0.6400267, -1.107461, -3.630643, 1, 0, 0, 1, 1,
-0.6386053, 1.005267, -0.7401278, 1, 0, 0, 1, 1,
-0.6298056, -0.7650036, -3.738979, 1, 0, 0, 1, 1,
-0.6297485, -1.09219, -1.567455, 0, 0, 0, 1, 1,
-0.6250291, 0.9431729, 1.344016, 0, 0, 0, 1, 1,
-0.6116704, -1.724139, -1.609699, 0, 0, 0, 1, 1,
-0.6107672, 1.421589, 0.2185815, 0, 0, 0, 1, 1,
-0.6096451, 1.085616, -0.2251734, 0, 0, 0, 1, 1,
-0.6084623, -1.752657, -3.272932, 0, 0, 0, 1, 1,
-0.6084157, 1.44181, -1.285205, 0, 0, 0, 1, 1,
-0.6076027, -2.227985, -3.14022, 1, 1, 1, 1, 1,
-0.6057826, 0.181827, 0.31223, 1, 1, 1, 1, 1,
-0.6044264, 1.012131, -0.6155504, 1, 1, 1, 1, 1,
-0.6039969, -0.06194282, -2.931523, 1, 1, 1, 1, 1,
-0.6031178, -1.203786, -3.02186, 1, 1, 1, 1, 1,
-0.6014426, 0.6096485, -1.779154, 1, 1, 1, 1, 1,
-0.6008277, 0.062964, 0.02316249, 1, 1, 1, 1, 1,
-0.5997666, -0.4375957, -2.647734, 1, 1, 1, 1, 1,
-0.5959516, -1.675486, -1.573312, 1, 1, 1, 1, 1,
-0.5947278, 0.4030245, -0.4339103, 1, 1, 1, 1, 1,
-0.5910838, -1.257083, -2.078084, 1, 1, 1, 1, 1,
-0.5879685, 0.2377037, -2.550643, 1, 1, 1, 1, 1,
-0.5879212, -1.030534, -3.207014, 1, 1, 1, 1, 1,
-0.5858912, 1.175134, 0.4847709, 1, 1, 1, 1, 1,
-0.5831892, 0.1837709, -0.8341779, 1, 1, 1, 1, 1,
-0.5784437, -2.270181, -2.976223, 0, 0, 1, 1, 1,
-0.5779473, -1.788868, -2.952223, 1, 0, 0, 1, 1,
-0.5736379, -1.076573, -4.473041, 1, 0, 0, 1, 1,
-0.5696546, -0.4284263, -0.3088362, 1, 0, 0, 1, 1,
-0.5591762, 1.155906, -1.041362, 1, 0, 0, 1, 1,
-0.5505669, -0.572641, -3.392846, 1, 0, 0, 1, 1,
-0.5478308, -0.8813455, -3.422209, 0, 0, 0, 1, 1,
-0.5476331, 0.2323382, 1.172919, 0, 0, 0, 1, 1,
-0.5452886, -0.1322662, -1.758371, 0, 0, 0, 1, 1,
-0.5451527, -1.779657, -4.295817, 0, 0, 0, 1, 1,
-0.5450898, -0.6559105, -3.093447, 0, 0, 0, 1, 1,
-0.5443501, 0.4173068, -1.436024, 0, 0, 0, 1, 1,
-0.5427096, 0.2593111, 0.2816599, 0, 0, 0, 1, 1,
-0.5368416, -0.8444508, -2.262709, 1, 1, 1, 1, 1,
-0.5367623, 0.5569706, 1.291376, 1, 1, 1, 1, 1,
-0.533531, 0.5438531, -0.8586771, 1, 1, 1, 1, 1,
-0.5255356, -1.873066, -4.691894, 1, 1, 1, 1, 1,
-0.5236521, 0.3346238, -2.628449, 1, 1, 1, 1, 1,
-0.521262, -0.7014938, -2.425741, 1, 1, 1, 1, 1,
-0.5167254, 0.2883002, -2.02812, 1, 1, 1, 1, 1,
-0.5145312, -0.8899155, -0.9057728, 1, 1, 1, 1, 1,
-0.5095217, 0.7989576, 0.4581341, 1, 1, 1, 1, 1,
-0.5079, -0.1446165, -2.968222, 1, 1, 1, 1, 1,
-0.5077717, -0.369873, -3.125325, 1, 1, 1, 1, 1,
-0.5053149, -1.569183, -1.00327, 1, 1, 1, 1, 1,
-0.499865, -0.6696919, -1.730684, 1, 1, 1, 1, 1,
-0.4993725, 0.5808761, -0.5244159, 1, 1, 1, 1, 1,
-0.4982853, 0.6488979, 0.5049525, 1, 1, 1, 1, 1,
-0.482239, 1.216169, 0.6463807, 0, 0, 1, 1, 1,
-0.4811491, 0.2257815, -1.369701, 1, 0, 0, 1, 1,
-0.4803206, 0.1579719, -1.2301, 1, 0, 0, 1, 1,
-0.4802265, 1.500644, -0.02305367, 1, 0, 0, 1, 1,
-0.4793771, -0.3142325, -2.65131, 1, 0, 0, 1, 1,
-0.4753693, -0.8542275, -3.584548, 1, 0, 0, 1, 1,
-0.4689054, -0.9022102, -3.636064, 0, 0, 0, 1, 1,
-0.4662908, 0.06515539, -1.23666, 0, 0, 0, 1, 1,
-0.4627541, -0.247163, -1.922136, 0, 0, 0, 1, 1,
-0.4616354, 0.0707977, -0.6588398, 0, 0, 0, 1, 1,
-0.4580893, 0.1551282, -0.6103665, 0, 0, 0, 1, 1,
-0.4554134, 1.008098, -0.5430495, 0, 0, 0, 1, 1,
-0.4540416, 0.8896651, -0.3916818, 0, 0, 0, 1, 1,
-0.4528905, -0.07293039, -3.225399, 1, 1, 1, 1, 1,
-0.4508464, 0.2009373, -3.568537, 1, 1, 1, 1, 1,
-0.4490209, -1.565189, -1.524172, 1, 1, 1, 1, 1,
-0.4464356, 0.8515655, -1.693357, 1, 1, 1, 1, 1,
-0.4424582, 1.168964, 0.8282561, 1, 1, 1, 1, 1,
-0.4406936, -0.4041323, -2.415773, 1, 1, 1, 1, 1,
-0.4368184, 2.83837, -0.9017823, 1, 1, 1, 1, 1,
-0.4353831, -0.8458128, -4.079723, 1, 1, 1, 1, 1,
-0.4335179, 0.8806238, 0.4721372, 1, 1, 1, 1, 1,
-0.42994, 0.6787744, -1.410727, 1, 1, 1, 1, 1,
-0.4289946, -0.4282024, -3.100338, 1, 1, 1, 1, 1,
-0.4275013, -0.3510608, -1.753084, 1, 1, 1, 1, 1,
-0.4273078, -0.4024115, -1.555779, 1, 1, 1, 1, 1,
-0.4257624, 2.38324, 0.5825653, 1, 1, 1, 1, 1,
-0.4210754, -0.7148819, -1.91389, 1, 1, 1, 1, 1,
-0.4201929, -0.9906204, -1.470932, 0, 0, 1, 1, 1,
-0.4201306, -1.33705, -4.265656, 1, 0, 0, 1, 1,
-0.4096143, 0.2607383, -0.91604, 1, 0, 0, 1, 1,
-0.4071887, 1.746282, -1.14345, 1, 0, 0, 1, 1,
-0.3993712, -0.3289021, -0.5351925, 1, 0, 0, 1, 1,
-0.3974312, 0.6241074, -0.2521645, 1, 0, 0, 1, 1,
-0.3958634, -0.02937126, -2.221704, 0, 0, 0, 1, 1,
-0.3941252, -0.9098029, -3.668807, 0, 0, 0, 1, 1,
-0.391011, -1.079682, -2.03069, 0, 0, 0, 1, 1,
-0.3900346, 0.04244855, -1.733793, 0, 0, 0, 1, 1,
-0.3880723, 0.9454163, -1.849876, 0, 0, 0, 1, 1,
-0.3847432, -0.5664954, -2.062863, 0, 0, 0, 1, 1,
-0.3833682, 1.537771, 1.378855, 0, 0, 0, 1, 1,
-0.3808376, 0.05660077, -1.306649, 1, 1, 1, 1, 1,
-0.3782543, -0.7676468, -1.761449, 1, 1, 1, 1, 1,
-0.3732059, 0.5623796, 0.1680773, 1, 1, 1, 1, 1,
-0.3653982, -0.3833739, -1.887423, 1, 1, 1, 1, 1,
-0.3647084, 1.699392, -0.1054676, 1, 1, 1, 1, 1,
-0.3643503, 1.520456, 0.401243, 1, 1, 1, 1, 1,
-0.3631058, -0.2878996, -2.416481, 1, 1, 1, 1, 1,
-0.3625405, -0.1445162, -2.963086, 1, 1, 1, 1, 1,
-0.3606316, 0.8264343, 1.801706, 1, 1, 1, 1, 1,
-0.3593631, -0.2042164, -2.487754, 1, 1, 1, 1, 1,
-0.3580305, -1.294493, -2.25378, 1, 1, 1, 1, 1,
-0.3562696, -0.3469133, -0.1293181, 1, 1, 1, 1, 1,
-0.3549803, -0.6161441, 1.195289, 1, 1, 1, 1, 1,
-0.3461643, 1.307266, -0.7942858, 1, 1, 1, 1, 1,
-0.345052, 1.647686, -0.2802769, 1, 1, 1, 1, 1,
-0.3408626, 0.7220783, 0.2611385, 0, 0, 1, 1, 1,
-0.3391661, 0.4237617, -1.753717, 1, 0, 0, 1, 1,
-0.3367274, -0.1543496, -3.70627, 1, 0, 0, 1, 1,
-0.3364818, 1.127717, 0.7857106, 1, 0, 0, 1, 1,
-0.3347729, -0.5413944, -0.8252269, 1, 0, 0, 1, 1,
-0.3340865, -0.3359476, -2.200208, 1, 0, 0, 1, 1,
-0.3312264, 0.05412011, -2.177462, 0, 0, 0, 1, 1,
-0.328818, 0.8779543, 0.9410079, 0, 0, 0, 1, 1,
-0.3287168, -0.1787764, -1.244459, 0, 0, 0, 1, 1,
-0.3265748, 0.1586912, -0.2749423, 0, 0, 0, 1, 1,
-0.3256965, 0.5513791, -1.13137, 0, 0, 0, 1, 1,
-0.3242169, -0.01953362, -3.002573, 0, 0, 0, 1, 1,
-0.3226788, 0.03803083, -4.317443, 0, 0, 0, 1, 1,
-0.3177966, -0.3469424, -1.894094, 1, 1, 1, 1, 1,
-0.3174948, -0.7802073, -4.022532, 1, 1, 1, 1, 1,
-0.3133094, -2.038489, -1.611256, 1, 1, 1, 1, 1,
-0.3132244, 0.4821504, -0.4067351, 1, 1, 1, 1, 1,
-0.3128062, 0.1087518, 0.01992722, 1, 1, 1, 1, 1,
-0.3066011, 0.2434711, -0.7203373, 1, 1, 1, 1, 1,
-0.3041705, -1.740441, -1.92115, 1, 1, 1, 1, 1,
-0.2988838, -0.8676839, -3.546344, 1, 1, 1, 1, 1,
-0.2961844, -2.137689, -1.459219, 1, 1, 1, 1, 1,
-0.2840095, 1.429168, -0.3828647, 1, 1, 1, 1, 1,
-0.2830876, 0.4328184, 1.22867, 1, 1, 1, 1, 1,
-0.2829342, -0.4508771, -1.503265, 1, 1, 1, 1, 1,
-0.2824559, -0.7284822, -2.453479, 1, 1, 1, 1, 1,
-0.2823966, 0.1612948, -2.08787, 1, 1, 1, 1, 1,
-0.2823615, -2.069217, -3.587189, 1, 1, 1, 1, 1,
-0.2811071, -0.3132052, -0.833784, 0, 0, 1, 1, 1,
-0.2757908, 0.3180182, -2.109919, 1, 0, 0, 1, 1,
-0.2727381, -1.319719, -2.636337, 1, 0, 0, 1, 1,
-0.271478, 0.6162165, -0.08798926, 1, 0, 0, 1, 1,
-0.271054, -1.644474, -2.594697, 1, 0, 0, 1, 1,
-0.2687203, -0.172463, -1.787932, 1, 0, 0, 1, 1,
-0.2653353, 0.04588009, -1.155678, 0, 0, 0, 1, 1,
-0.2604779, 0.2391188, -1.709522, 0, 0, 0, 1, 1,
-0.2561894, -0.1450031, -3.077017, 0, 0, 0, 1, 1,
-0.2538001, -0.9238183, -1.514981, 0, 0, 0, 1, 1,
-0.2521662, 0.2525626, -0.848339, 0, 0, 0, 1, 1,
-0.2519698, 1.880608, -0.5790055, 0, 0, 0, 1, 1,
-0.2452137, 1.700019, -0.5849763, 0, 0, 0, 1, 1,
-0.2369679, -2.337002, -1.549684, 1, 1, 1, 1, 1,
-0.2320662, -0.1663165, -0.5789493, 1, 1, 1, 1, 1,
-0.2295866, -1.08463, -2.129556, 1, 1, 1, 1, 1,
-0.2293014, 0.2345437, 1.18245, 1, 1, 1, 1, 1,
-0.223329, 0.2115456, -1.657182, 1, 1, 1, 1, 1,
-0.2218473, 0.1786214, -0.9494434, 1, 1, 1, 1, 1,
-0.2190088, -1.633694, -3.444205, 1, 1, 1, 1, 1,
-0.2165788, -0.6669549, -4.183071, 1, 1, 1, 1, 1,
-0.2164453, 0.1496824, -1.615896, 1, 1, 1, 1, 1,
-0.2146643, 0.7214077, -0.3515224, 1, 1, 1, 1, 1,
-0.2139788, 0.1623274, -0.7843565, 1, 1, 1, 1, 1,
-0.2136561, 0.132946, -2.16849, 1, 1, 1, 1, 1,
-0.2102438, -0.4892257, -0.3757402, 1, 1, 1, 1, 1,
-0.2083283, 0.09142675, -1.198651, 1, 1, 1, 1, 1,
-0.2033378, 1.230847, 0.3566794, 1, 1, 1, 1, 1,
-0.2031902, -0.2132494, -3.950512, 0, 0, 1, 1, 1,
-0.2013866, 1.069183, 0.01893934, 1, 0, 0, 1, 1,
-0.197934, 0.6020514, -1.346524, 1, 0, 0, 1, 1,
-0.1975037, -1.448666, -3.404688, 1, 0, 0, 1, 1,
-0.1965447, -1.264845, -3.6968, 1, 0, 0, 1, 1,
-0.1941689, -0.8084197, -3.087739, 1, 0, 0, 1, 1,
-0.1922564, 0.5134947, -0.9385546, 0, 0, 0, 1, 1,
-0.1895321, -0.07473813, -1.902997, 0, 0, 0, 1, 1,
-0.1820873, 2.304567, 0.7390606, 0, 0, 0, 1, 1,
-0.1800759, -0.372972, -4.537017, 0, 0, 0, 1, 1,
-0.1795246, -0.4077227, -2.32575, 0, 0, 0, 1, 1,
-0.1761586, 0.3816867, -1.110732, 0, 0, 0, 1, 1,
-0.1752949, -0.9743665, -1.475975, 0, 0, 0, 1, 1,
-0.1721297, -0.4729764, -3.642245, 1, 1, 1, 1, 1,
-0.1679147, -0.5783652, -2.956879, 1, 1, 1, 1, 1,
-0.1643556, 0.471813, 0.4735827, 1, 1, 1, 1, 1,
-0.1639033, 1.001886, -1.132951, 1, 1, 1, 1, 1,
-0.1630051, -0.22689, -2.971518, 1, 1, 1, 1, 1,
-0.1615298, -0.4817125, -2.879164, 1, 1, 1, 1, 1,
-0.1507788, 1.341526, -0.6120549, 1, 1, 1, 1, 1,
-0.1507567, 0.8632988, 0.8563084, 1, 1, 1, 1, 1,
-0.1504052, 1.275983, 0.1535364, 1, 1, 1, 1, 1,
-0.1448689, -0.9617722, -4.110072, 1, 1, 1, 1, 1,
-0.1439756, -0.7819805, -4.458611, 1, 1, 1, 1, 1,
-0.1398336, 0.0508822, -0.4925415, 1, 1, 1, 1, 1,
-0.1278892, -0.08280323, -0.6374726, 1, 1, 1, 1, 1,
-0.1254109, 0.05992236, -0.02961272, 1, 1, 1, 1, 1,
-0.1246428, -1.664614, -1.799983, 1, 1, 1, 1, 1,
-0.1196929, 0.3509945, 0.9298446, 0, 0, 1, 1, 1,
-0.118565, -1.536467, -2.287634, 1, 0, 0, 1, 1,
-0.1180559, 1.491444, -2.210419, 1, 0, 0, 1, 1,
-0.116438, 0.2511981, 1.009211, 1, 0, 0, 1, 1,
-0.1110387, -2.505773, -2.096013, 1, 0, 0, 1, 1,
-0.1106993, -0.8486124, -2.497285, 1, 0, 0, 1, 1,
-0.1089109, 1.736079, -0.7093126, 0, 0, 0, 1, 1,
-0.108603, -0.5324461, -0.3852765, 0, 0, 0, 1, 1,
-0.10378, 0.7827681, -0.4932633, 0, 0, 0, 1, 1,
-0.1012637, 0.5715397, 0.07959811, 0, 0, 0, 1, 1,
-0.1004714, 0.6097134, -0.84364, 0, 0, 0, 1, 1,
-0.09996967, 0.04854494, -0.0482513, 0, 0, 0, 1, 1,
-0.09409752, -0.005550792, -0.7907196, 0, 0, 0, 1, 1,
-0.09165046, 0.5081953, -1.566835, 1, 1, 1, 1, 1,
-0.08568746, -0.7846527, -3.472365, 1, 1, 1, 1, 1,
-0.08559872, -1.584604, -3.54855, 1, 1, 1, 1, 1,
-0.07868143, -0.5554528, -3.131719, 1, 1, 1, 1, 1,
-0.06687648, -0.4519963, -4.555802, 1, 1, 1, 1, 1,
-0.06007873, 0.5550283, -0.5177749, 1, 1, 1, 1, 1,
-0.05648596, 0.7802647, -1.291426, 1, 1, 1, 1, 1,
-0.05621649, -1.120075, -2.788715, 1, 1, 1, 1, 1,
-0.05296693, -0.2153212, -1.832728, 1, 1, 1, 1, 1,
-0.0525259, 0.8179917, 0.9247928, 1, 1, 1, 1, 1,
-0.04578513, -0.04871885, -2.772172, 1, 1, 1, 1, 1,
-0.0417008, 0.296556, 0.3692971, 1, 1, 1, 1, 1,
-0.04080348, 2.035617, -0.1731084, 1, 1, 1, 1, 1,
-0.03791184, -0.0300424, -1.161862, 1, 1, 1, 1, 1,
-0.03645349, 1.599759, 1.227803, 1, 1, 1, 1, 1,
-0.03262851, -0.1607997, -1.311471, 0, 0, 1, 1, 1,
-0.02619318, 0.0657927, 0.3656816, 1, 0, 0, 1, 1,
-0.02524075, -1.058361, -2.244128, 1, 0, 0, 1, 1,
-0.02431172, 0.4629227, 1.842834, 1, 0, 0, 1, 1,
-0.02239302, -0.290009, -4.652281, 1, 0, 0, 1, 1,
-0.02196214, -0.6427321, -3.331914, 1, 0, 0, 1, 1,
-0.01877477, 0.1401529, 0.1496448, 0, 0, 0, 1, 1,
-0.01801808, 1.268887, -0.6558008, 0, 0, 0, 1, 1,
-0.01609138, 0.1232564, 0.6202193, 0, 0, 0, 1, 1,
-0.01593494, 1.394722, 0.1266743, 0, 0, 0, 1, 1,
-0.01552903, 0.1560193, -0.5835402, 0, 0, 0, 1, 1,
-0.01293753, 1.210806, -0.6309808, 0, 0, 0, 1, 1,
-0.008165658, 0.6577069, 0.9546522, 0, 0, 0, 1, 1,
-0.007487397, 0.308531, -0.04348065, 1, 1, 1, 1, 1,
-0.006656069, -0.3067571, -2.344139, 1, 1, 1, 1, 1,
-0.002457792, -0.5670254, -3.535623, 1, 1, 1, 1, 1,
-0.001582832, 0.9650052, 0.7470862, 1, 1, 1, 1, 1,
0.003068448, -0.1582066, 2.958644, 1, 1, 1, 1, 1,
0.006800872, -0.37762, 2.64216, 1, 1, 1, 1, 1,
0.007254759, -1.451426, 4.319294, 1, 1, 1, 1, 1,
0.008385776, 2.539009, 0.4521849, 1, 1, 1, 1, 1,
0.01305826, 1.10523, 0.1013118, 1, 1, 1, 1, 1,
0.01592943, -0.07178928, 1.901286, 1, 1, 1, 1, 1,
0.01984823, 0.9880085, 1.465915, 1, 1, 1, 1, 1,
0.02000245, -0.7939943, 2.491757, 1, 1, 1, 1, 1,
0.02193268, -0.6751462, 2.681537, 1, 1, 1, 1, 1,
0.02196174, 0.9610198, 0.8648469, 1, 1, 1, 1, 1,
0.02748228, 0.9115312, 2.33591, 1, 1, 1, 1, 1,
0.03411407, 1.761839, -0.01651872, 0, 0, 1, 1, 1,
0.03531617, -0.3157305, 3.059682, 1, 0, 0, 1, 1,
0.03869262, 1.266561, -0.224253, 1, 0, 0, 1, 1,
0.04597973, -1.249216, 2.862089, 1, 0, 0, 1, 1,
0.04828564, -0.3115959, 3.265474, 1, 0, 0, 1, 1,
0.04897556, 0.7628784, 0.5128923, 1, 0, 0, 1, 1,
0.0505855, -1.815971, 4.080431, 0, 0, 0, 1, 1,
0.05336591, 0.8872651, -1.226178, 0, 0, 0, 1, 1,
0.06252158, 1.779185, -0.6250286, 0, 0, 0, 1, 1,
0.0628773, 0.1349405, -0.2620116, 0, 0, 0, 1, 1,
0.06871285, -0.5202844, 3.133977, 0, 0, 0, 1, 1,
0.07026885, 0.3292726, 0.3071537, 0, 0, 0, 1, 1,
0.07379939, 0.0503936, 0.2043421, 0, 0, 0, 1, 1,
0.07598432, -0.8037746, 2.449513, 1, 1, 1, 1, 1,
0.07741307, 1.11479, -0.5676546, 1, 1, 1, 1, 1,
0.07884067, -1.004351, 1.666631, 1, 1, 1, 1, 1,
0.0790198, -0.6180624, 2.729007, 1, 1, 1, 1, 1,
0.08074967, -0.6057221, 3.027019, 1, 1, 1, 1, 1,
0.08190226, 1.695519, 0.9702232, 1, 1, 1, 1, 1,
0.0826993, 0.3571752, 0.01287811, 1, 1, 1, 1, 1,
0.08892822, 0.060139, 2.459543, 1, 1, 1, 1, 1,
0.09001251, 0.2284706, -1.449694, 1, 1, 1, 1, 1,
0.09664065, -0.3552988, 2.475795, 1, 1, 1, 1, 1,
0.09682757, 0.109857, 1.169994, 1, 1, 1, 1, 1,
0.09788454, -0.7944763, 1.584106, 1, 1, 1, 1, 1,
0.0992877, -1.964083, 3.222392, 1, 1, 1, 1, 1,
0.09954096, -1.097574, 3.398354, 1, 1, 1, 1, 1,
0.1005175, -0.1993812, 3.441605, 1, 1, 1, 1, 1,
0.1013681, -0.1955616, 2.369511, 0, 0, 1, 1, 1,
0.1049805, 1.169007, 1.175994, 1, 0, 0, 1, 1,
0.1050677, -0.6524354, 1.950471, 1, 0, 0, 1, 1,
0.1076707, 1.223722, 3.163427, 1, 0, 0, 1, 1,
0.1120961, -1.724981, 4.62973, 1, 0, 0, 1, 1,
0.1201297, 0.5541878, -0.4935325, 1, 0, 0, 1, 1,
0.1239644, 0.7371166, -0.2988029, 0, 0, 0, 1, 1,
0.1265199, -0.233619, 1.491687, 0, 0, 0, 1, 1,
0.1305822, -0.7791778, 2.046563, 0, 0, 0, 1, 1,
0.1336982, 1.648387, -0.6579748, 0, 0, 0, 1, 1,
0.138592, 0.5160896, 1.324365, 0, 0, 0, 1, 1,
0.1448629, -0.8351884, 3.99503, 0, 0, 0, 1, 1,
0.1451454, 0.2572584, 1.028342, 0, 0, 0, 1, 1,
0.1457186, -1.353122, 3.192346, 1, 1, 1, 1, 1,
0.1468526, 1.197679, 0.9467524, 1, 1, 1, 1, 1,
0.1473431, 0.8985781, 0.2050435, 1, 1, 1, 1, 1,
0.147579, -2.155496, 4.124398, 1, 1, 1, 1, 1,
0.1504646, -0.1734571, -0.8494372, 1, 1, 1, 1, 1,
0.1524952, -0.1805059, 1.798583, 1, 1, 1, 1, 1,
0.1539584, 0.3239673, 0.05816697, 1, 1, 1, 1, 1,
0.1613796, 0.2034108, 2.172569, 1, 1, 1, 1, 1,
0.1614926, 0.6586964, -0.3489247, 1, 1, 1, 1, 1,
0.1617065, 0.9574548, 0.7926077, 1, 1, 1, 1, 1,
0.1640476, -0.2986389, 3.637148, 1, 1, 1, 1, 1,
0.1665653, -0.3467544, 2.907077, 1, 1, 1, 1, 1,
0.1704766, 1.250656, 0.3950395, 1, 1, 1, 1, 1,
0.173077, -1.214859, 2.949294, 1, 1, 1, 1, 1,
0.1753432, 1.620997, -0.8877587, 1, 1, 1, 1, 1,
0.1761616, 0.1439896, 1.45477, 0, 0, 1, 1, 1,
0.1776487, -1.491603, 3.744674, 1, 0, 0, 1, 1,
0.1803699, 0.7041778, 0.2961117, 1, 0, 0, 1, 1,
0.1806974, -2.285243, 2.742493, 1, 0, 0, 1, 1,
0.1821249, 0.743904, 0.7991612, 1, 0, 0, 1, 1,
0.1829261, 0.6222172, -1.50227, 1, 0, 0, 1, 1,
0.1837168, 0.02384716, 2.228031, 0, 0, 0, 1, 1,
0.1862072, -1.329298, 2.332461, 0, 0, 0, 1, 1,
0.1870925, 0.2327253, 0.465084, 0, 0, 0, 1, 1,
0.1907744, 1.123469, -0.4610536, 0, 0, 0, 1, 1,
0.1933369, 1.740277, -1.127927, 0, 0, 0, 1, 1,
0.1941056, -1.079137, 1.517951, 0, 0, 0, 1, 1,
0.1975059, -0.9435195, 4.464063, 0, 0, 0, 1, 1,
0.2015264, 1.059542, 0.9261796, 1, 1, 1, 1, 1,
0.2063486, 1.959666, -0.376072, 1, 1, 1, 1, 1,
0.2106921, -0.6846211, 2.201561, 1, 1, 1, 1, 1,
0.2152461, -0.2877029, 2.486373, 1, 1, 1, 1, 1,
0.2202983, 0.02457344, 0.6281812, 1, 1, 1, 1, 1,
0.2213466, -0.2134382, 1.468599, 1, 1, 1, 1, 1,
0.2234435, -0.5142247, 0.1707812, 1, 1, 1, 1, 1,
0.2252097, -0.4689432, 3.249537, 1, 1, 1, 1, 1,
0.2256073, -1.146005, 2.274676, 1, 1, 1, 1, 1,
0.2278203, 0.3896502, -0.2808933, 1, 1, 1, 1, 1,
0.2283772, 1.39902, 0.7045567, 1, 1, 1, 1, 1,
0.2335601, -1.092621, 3.894868, 1, 1, 1, 1, 1,
0.2339938, -0.2329027, 2.792115, 1, 1, 1, 1, 1,
0.2433458, -0.9383856, 3.227844, 1, 1, 1, 1, 1,
0.2451827, -0.8505139, 5.051129, 1, 1, 1, 1, 1,
0.250024, 0.7569722, 0.06970645, 0, 0, 1, 1, 1,
0.2521796, -0.5532363, 2.132399, 1, 0, 0, 1, 1,
0.252529, -0.8814863, 2.109713, 1, 0, 0, 1, 1,
0.2533562, -1.259754, 3.873799, 1, 0, 0, 1, 1,
0.2590947, -1.216099, 1.645595, 1, 0, 0, 1, 1,
0.2629938, -0.08800901, 1.50716, 1, 0, 0, 1, 1,
0.2651398, -0.2538228, 1.55925, 0, 0, 0, 1, 1,
0.2666465, -0.4877968, 4.123301, 0, 0, 0, 1, 1,
0.2680154, -0.7210801, 1.535189, 0, 0, 0, 1, 1,
0.2700273, -0.955682, 1.973936, 0, 0, 0, 1, 1,
0.2781892, 0.03307796, 0.6904634, 0, 0, 0, 1, 1,
0.2847806, 0.7662346, -0.3786417, 0, 0, 0, 1, 1,
0.285818, 0.2307828, 0.4356838, 0, 0, 0, 1, 1,
0.2875752, -0.4750452, 3.200855, 1, 1, 1, 1, 1,
0.2880364, 0.5449449, 0.5627793, 1, 1, 1, 1, 1,
0.2894384, 0.9025226, -0.1893267, 1, 1, 1, 1, 1,
0.2940679, 0.6764886, -0.02784298, 1, 1, 1, 1, 1,
0.2944916, -1.357773, 2.796523, 1, 1, 1, 1, 1,
0.2965869, 0.5448299, 0.1480939, 1, 1, 1, 1, 1,
0.3005755, 0.1281727, 1.092513, 1, 1, 1, 1, 1,
0.3010285, -1.874669, 2.182307, 1, 1, 1, 1, 1,
0.3020583, 0.01476602, 1.238702, 1, 1, 1, 1, 1,
0.303146, -0.2285335, 1.261842, 1, 1, 1, 1, 1,
0.3043703, -0.08437367, 2.436694, 1, 1, 1, 1, 1,
0.3045637, -1.622817, 3.730353, 1, 1, 1, 1, 1,
0.3046832, 0.1735774, 1.877258, 1, 1, 1, 1, 1,
0.3075984, -0.9381695, 3.360371, 1, 1, 1, 1, 1,
0.3091446, -0.6982456, 1.258799, 1, 1, 1, 1, 1,
0.3093757, -0.7443676, 3.789839, 0, 0, 1, 1, 1,
0.3134227, -0.6149495, 1.522319, 1, 0, 0, 1, 1,
0.3150903, -0.6991475, 0.6131829, 1, 0, 0, 1, 1,
0.3173705, -1.38616, 4.037098, 1, 0, 0, 1, 1,
0.3201427, -0.3223947, 2.31681, 1, 0, 0, 1, 1,
0.3247185, 0.3203208, 1.451084, 1, 0, 0, 1, 1,
0.3285526, -0.4256144, 3.321106, 0, 0, 0, 1, 1,
0.3300276, 0.1450906, 1.31169, 0, 0, 0, 1, 1,
0.3349753, 0.7829517, -1.805526, 0, 0, 0, 1, 1,
0.3364778, 1.013914, 0.595338, 0, 0, 0, 1, 1,
0.3365414, 2.259098, 0.9504398, 0, 0, 0, 1, 1,
0.338075, 0.1350358, -0.1267908, 0, 0, 0, 1, 1,
0.3397586, 0.5353488, 1.07343, 0, 0, 0, 1, 1,
0.340894, 0.782854, 2.900054, 1, 1, 1, 1, 1,
0.3441521, 0.5145234, 0.9409377, 1, 1, 1, 1, 1,
0.344974, -1.199626, 4.149754, 1, 1, 1, 1, 1,
0.3490574, -0.1401172, 2.586169, 1, 1, 1, 1, 1,
0.3518513, -0.2129173, 1.309186, 1, 1, 1, 1, 1,
0.3586347, 0.1308452, 0.7404775, 1, 1, 1, 1, 1,
0.3596869, 0.2846909, 0.3750678, 1, 1, 1, 1, 1,
0.364839, 0.05854368, 2.883487, 1, 1, 1, 1, 1,
0.3662852, -0.6411304, 4.07844, 1, 1, 1, 1, 1,
0.3688222, 0.01380364, 1.371659, 1, 1, 1, 1, 1,
0.3707372, -1.866939, 2.07176, 1, 1, 1, 1, 1,
0.3714411, 0.370061, 0.8140193, 1, 1, 1, 1, 1,
0.3719934, -1.772724, 4.671488, 1, 1, 1, 1, 1,
0.3724517, 0.9954745, 0.1180899, 1, 1, 1, 1, 1,
0.380578, -1.103189, 2.150134, 1, 1, 1, 1, 1,
0.3806287, -1.387942, 2.651331, 0, 0, 1, 1, 1,
0.3842311, -0.07236442, 1.364477, 1, 0, 0, 1, 1,
0.3846298, 0.0243535, 0.3653894, 1, 0, 0, 1, 1,
0.3846791, 0.4759048, -1.10324, 1, 0, 0, 1, 1,
0.3852658, -0.3908485, 3.071533, 1, 0, 0, 1, 1,
0.3873051, -1.143748, 3.912059, 1, 0, 0, 1, 1,
0.388156, -0.3646924, 2.55866, 0, 0, 0, 1, 1,
0.3919424, 1.158972, 1.469779, 0, 0, 0, 1, 1,
0.3932593, 1.475313, -1.090657, 0, 0, 0, 1, 1,
0.3949805, 0.2609385, 1.24, 0, 0, 0, 1, 1,
0.4014773, 0.6216639, 1.900284, 0, 0, 0, 1, 1,
0.4026025, 0.4135416, 0.4409043, 0, 0, 0, 1, 1,
0.4027742, -1.26091, 3.33687, 0, 0, 0, 1, 1,
0.4027905, -2.027062, 2.409589, 1, 1, 1, 1, 1,
0.4124318, -1.143249, 3.712208, 1, 1, 1, 1, 1,
0.4130377, -0.2961355, 2.008659, 1, 1, 1, 1, 1,
0.4163263, -0.1355511, 0.4184619, 1, 1, 1, 1, 1,
0.4169643, -0.4207945, 1.900037, 1, 1, 1, 1, 1,
0.417875, 1.232437, 0.006421709, 1, 1, 1, 1, 1,
0.4205372, 1.719029, 0.9465787, 1, 1, 1, 1, 1,
0.4214295, 1.019803, -0.5475304, 1, 1, 1, 1, 1,
0.423933, 0.6560001, 1.013187, 1, 1, 1, 1, 1,
0.4279902, -0.443364, 2.185181, 1, 1, 1, 1, 1,
0.4345621, -1.604054, 2.495687, 1, 1, 1, 1, 1,
0.4366134, -1.20701, 3.852993, 1, 1, 1, 1, 1,
0.4374284, 0.2855522, 3.247789, 1, 1, 1, 1, 1,
0.4380462, -0.7742689, 1.787465, 1, 1, 1, 1, 1,
0.4383856, -0.04803997, 2.884046, 1, 1, 1, 1, 1,
0.4558491, -0.3287111, 2.597605, 0, 0, 1, 1, 1,
0.4560577, 0.5152561, 1.636952, 1, 0, 0, 1, 1,
0.463491, 1.396787, -0.766188, 1, 0, 0, 1, 1,
0.4717942, -0.04786919, 1.430656, 1, 0, 0, 1, 1,
0.4739277, 0.5159389, -0.05991275, 1, 0, 0, 1, 1,
0.4754313, -0.1183178, 2.833699, 1, 0, 0, 1, 1,
0.477993, 1.480024, -0.7813481, 0, 0, 0, 1, 1,
0.4813465, 0.4479858, 0.1242392, 0, 0, 0, 1, 1,
0.4825568, 0.2701974, 0.258403, 0, 0, 0, 1, 1,
0.4841267, -1.001333, 2.104405, 0, 0, 0, 1, 1,
0.484558, 1.022941, 0.0203535, 0, 0, 0, 1, 1,
0.485676, -1.112359, 2.560267, 0, 0, 0, 1, 1,
0.4896967, 0.49698, 0.4910868, 0, 0, 0, 1, 1,
0.4916253, 0.006197863, 2.370075, 1, 1, 1, 1, 1,
0.4987268, -1.445653, 3.050307, 1, 1, 1, 1, 1,
0.502822, 1.059628, 1.041376, 1, 1, 1, 1, 1,
0.5032446, 1.096603, 0.9912695, 1, 1, 1, 1, 1,
0.5045936, 0.3792125, 0.2345298, 1, 1, 1, 1, 1,
0.5115626, 0.3933656, 1.170169, 1, 1, 1, 1, 1,
0.5119193, -1.107742, 4.123554, 1, 1, 1, 1, 1,
0.5141352, 0.9310445, 1.257811, 1, 1, 1, 1, 1,
0.5158532, -0.920602, 3.38173, 1, 1, 1, 1, 1,
0.5264183, -1.522247, 3.27711, 1, 1, 1, 1, 1,
0.537568, -0.01688013, 2.480473, 1, 1, 1, 1, 1,
0.5379776, 1.435694, -0.1078714, 1, 1, 1, 1, 1,
0.5391242, -0.3344151, 1.999061, 1, 1, 1, 1, 1,
0.5438117, 0.1295507, 1.080295, 1, 1, 1, 1, 1,
0.5470876, 1.097638, 1.703752, 1, 1, 1, 1, 1,
0.547666, 1.292314, 0.8887944, 0, 0, 1, 1, 1,
0.5485201, -0.3588407, 0.9136569, 1, 0, 0, 1, 1,
0.5556294, 0.2060843, -0.2454924, 1, 0, 0, 1, 1,
0.5573171, 0.7634006, 0.5603003, 1, 0, 0, 1, 1,
0.5588009, 0.7480531, 1.574452, 1, 0, 0, 1, 1,
0.5588465, -0.02179054, 2.114711, 1, 0, 0, 1, 1,
0.5595955, -0.1200299, 3.168869, 0, 0, 0, 1, 1,
0.5639715, 1.252837, -1.658624, 0, 0, 0, 1, 1,
0.568521, 0.6984181, -0.9672285, 0, 0, 0, 1, 1,
0.5686417, -0.150128, 0.1764718, 0, 0, 0, 1, 1,
0.56881, -0.005410619, 1.462794, 0, 0, 0, 1, 1,
0.5816968, -0.4120232, 1.845751, 0, 0, 0, 1, 1,
0.5820956, 0.8366606, -0.3114031, 0, 0, 0, 1, 1,
0.5933375, 0.8395156, 0.1062944, 1, 1, 1, 1, 1,
0.5956459, 0.4560513, -0.3785239, 1, 1, 1, 1, 1,
0.5958286, 1.265503, 1.309472, 1, 1, 1, 1, 1,
0.5959023, -0.09449785, 2.522015, 1, 1, 1, 1, 1,
0.6003569, 0.1473362, 1.529093, 1, 1, 1, 1, 1,
0.6034345, 1.378599, 0.2918842, 1, 1, 1, 1, 1,
0.603621, -1.569736, 1.957923, 1, 1, 1, 1, 1,
0.611142, 0.006077376, 1.115404, 1, 1, 1, 1, 1,
0.6115493, -0.6128987, 1.969398, 1, 1, 1, 1, 1,
0.6162519, 0.9421, -0.2540428, 1, 1, 1, 1, 1,
0.6162996, -1.152707, 2.061031, 1, 1, 1, 1, 1,
0.6304027, 1.05336, 0.1765621, 1, 1, 1, 1, 1,
0.6358097, 0.3680876, 2.078619, 1, 1, 1, 1, 1,
0.6364979, -0.8548886, 3.663996, 1, 1, 1, 1, 1,
0.6385362, -1.177584, 3.348446, 1, 1, 1, 1, 1,
0.6390399, -0.7364784, 2.333615, 0, 0, 1, 1, 1,
0.6440207, -0.7173811, 3.45211, 1, 0, 0, 1, 1,
0.6480213, 0.1080325, 2.337873, 1, 0, 0, 1, 1,
0.6627011, 0.977975, 0.9705157, 1, 0, 0, 1, 1,
0.6665042, 0.743452, 0.888565, 1, 0, 0, 1, 1,
0.6677605, 0.9266129, 0.7474137, 1, 0, 0, 1, 1,
0.6691341, 0.2539656, 0.311019, 0, 0, 0, 1, 1,
0.6733835, 0.2861217, 0.9608892, 0, 0, 0, 1, 1,
0.6750517, -0.8963104, 2.595076, 0, 0, 0, 1, 1,
0.6792947, -1.983654, 2.225074, 0, 0, 0, 1, 1,
0.6800921, 1.149883, 1.283983, 0, 0, 0, 1, 1,
0.6810836, -2.301909, 4.229797, 0, 0, 0, 1, 1,
0.683497, 0.9672101, -0.4174743, 0, 0, 0, 1, 1,
0.6855404, 0.6555979, 0.3166072, 1, 1, 1, 1, 1,
0.6884537, -0.7265216, 1.328447, 1, 1, 1, 1, 1,
0.6899681, -1.037598, 3.402079, 1, 1, 1, 1, 1,
0.6921955, -0.7684478, 2.810607, 1, 1, 1, 1, 1,
0.6931271, 0.4250894, 0.8261914, 1, 1, 1, 1, 1,
0.696224, 1.163897, -1.438396, 1, 1, 1, 1, 1,
0.6982527, -0.4057845, 2.147778, 1, 1, 1, 1, 1,
0.6987736, -0.5525078, 0.4684227, 1, 1, 1, 1, 1,
0.7071229, 1.563895, 0.9650091, 1, 1, 1, 1, 1,
0.7101571, -1.010774, 1.726472, 1, 1, 1, 1, 1,
0.7174098, -1.008868, 4.338573, 1, 1, 1, 1, 1,
0.7205737, -0.1069722, 1.701237, 1, 1, 1, 1, 1,
0.722366, -0.8290819, 2.202758, 1, 1, 1, 1, 1,
0.7291643, 0.859165, 2.24874, 1, 1, 1, 1, 1,
0.7295475, 0.4017237, 0.9546286, 1, 1, 1, 1, 1,
0.7301468, 1.727392, 1.068272, 0, 0, 1, 1, 1,
0.7340131, -0.2970814, 0.6810383, 1, 0, 0, 1, 1,
0.7389045, 0.837957, 4.044395, 1, 0, 0, 1, 1,
0.7419181, 0.05000002, 2.31538, 1, 0, 0, 1, 1,
0.7524748, 1.388255, 1.69663, 1, 0, 0, 1, 1,
0.7526443, -0.952131, 0.9293705, 1, 0, 0, 1, 1,
0.7599776, 0.02955174, -1.495556, 0, 0, 0, 1, 1,
0.7719657, 0.01654521, 2.060961, 0, 0, 0, 1, 1,
0.7750496, -0.3846343, 3.502831, 0, 0, 0, 1, 1,
0.776531, -0.7843111, 2.069974, 0, 0, 0, 1, 1,
0.7793788, -1.588658, 3.307002, 0, 0, 0, 1, 1,
0.7849306, 0.4636362, 0.3556629, 0, 0, 0, 1, 1,
0.7858782, -0.1956665, 3.278331, 0, 0, 0, 1, 1,
0.7875462, 0.2544282, 1.642991, 1, 1, 1, 1, 1,
0.7881509, -0.8884567, 2.339512, 1, 1, 1, 1, 1,
0.7883398, 1.535716, 1.629177, 1, 1, 1, 1, 1,
0.7889389, 1.452965, -0.1097301, 1, 1, 1, 1, 1,
0.7907615, -0.6489459, 0.7179464, 1, 1, 1, 1, 1,
0.7982602, 0.1385595, 0.705568, 1, 1, 1, 1, 1,
0.799505, 1.107924, 1.381712, 1, 1, 1, 1, 1,
0.8052943, -0.864038, 1.970304, 1, 1, 1, 1, 1,
0.8063673, -0.8163583, 2.942692, 1, 1, 1, 1, 1,
0.8186939, -0.3186941, 1.592569, 1, 1, 1, 1, 1,
0.8210394, 0.2411652, 0.345803, 1, 1, 1, 1, 1,
0.8213375, 0.8744779, -0.3254225, 1, 1, 1, 1, 1,
0.8248596, 0.6921299, 2.197906, 1, 1, 1, 1, 1,
0.8309038, -1.401049, 1.015972, 1, 1, 1, 1, 1,
0.8311101, -0.2555158, 1.932419, 1, 1, 1, 1, 1,
0.8377603, 0.1728107, 0.7556561, 0, 0, 1, 1, 1,
0.8379397, 1.346955, -0.3749254, 1, 0, 0, 1, 1,
0.8400379, -1.566631, 2.465052, 1, 0, 0, 1, 1,
0.8401303, 0.4225008, 0.782224, 1, 0, 0, 1, 1,
0.8410701, -0.1519974, 1.408832, 1, 0, 0, 1, 1,
0.8416286, -1.001922, 2.057424, 1, 0, 0, 1, 1,
0.8451552, 1.514621, 0.7215731, 0, 0, 0, 1, 1,
0.8530059, -0.9949766, 1.685571, 0, 0, 0, 1, 1,
0.8532816, -0.3398157, 1.777431, 0, 0, 0, 1, 1,
0.8547072, -2.09, 2.422363, 0, 0, 0, 1, 1,
0.8552818, 2.014809, 2.798828, 0, 0, 0, 1, 1,
0.8554828, 0.2624927, 1.021108, 0, 0, 0, 1, 1,
0.8575949, -1.335018, 1.32253, 0, 0, 0, 1, 1,
0.859751, -0.6101881, 3.073749, 1, 1, 1, 1, 1,
0.8672647, 1.259357, 1.120614, 1, 1, 1, 1, 1,
0.8741551, -1.243137, 1.016783, 1, 1, 1, 1, 1,
0.8754063, -0.4186759, 2.347618, 1, 1, 1, 1, 1,
0.8759418, 0.2664283, 0.8652822, 1, 1, 1, 1, 1,
0.8862531, 0.5971628, 1.199867, 1, 1, 1, 1, 1,
0.8876899, -0.6036422, 0.7752328, 1, 1, 1, 1, 1,
0.8914649, 0.1532589, 1.16158, 1, 1, 1, 1, 1,
0.8967398, -2.357812, 1.357152, 1, 1, 1, 1, 1,
0.8968237, -0.6517714, 3.780882, 1, 1, 1, 1, 1,
0.9001592, 1.974763, -0.194924, 1, 1, 1, 1, 1,
0.9063528, -1.104031, 2.645257, 1, 1, 1, 1, 1,
0.9087272, -0.4461125, 1.040735, 1, 1, 1, 1, 1,
0.9148065, -1.19108, 2.700043, 1, 1, 1, 1, 1,
0.9153677, -1.852069, 2.907482, 1, 1, 1, 1, 1,
0.9157737, -0.5450208, 2.351022, 0, 0, 1, 1, 1,
0.9165446, 0.9879109, 1.212684, 1, 0, 0, 1, 1,
0.917497, -0.5139226, 4.447322, 1, 0, 0, 1, 1,
0.9196586, 0.1302864, 3.031563, 1, 0, 0, 1, 1,
0.9249689, 0.1625399, 3.156027, 1, 0, 0, 1, 1,
0.9268745, -0.4416373, 1.786987, 1, 0, 0, 1, 1,
0.9272669, -1.456512, 3.674815, 0, 0, 0, 1, 1,
0.9292336, 1.379712, 1.094201, 0, 0, 0, 1, 1,
0.9295185, -1.757017, 3.457695, 0, 0, 0, 1, 1,
0.9303461, -0.1334138, 1.310239, 0, 0, 0, 1, 1,
0.9352399, 0.8602362, 1.188141, 0, 0, 0, 1, 1,
0.937757, 0.121472, 0.9152625, 0, 0, 0, 1, 1,
0.9431357, 0.02978412, 1.061061, 0, 0, 0, 1, 1,
0.9432618, -0.263618, 2.511194, 1, 1, 1, 1, 1,
0.9458137, -0.2966715, 1.298884, 1, 1, 1, 1, 1,
0.953274, 1.16419, 1.776342, 1, 1, 1, 1, 1,
0.953895, -0.185605, 0.7740267, 1, 1, 1, 1, 1,
0.9547185, 0.512899, 2.437023, 1, 1, 1, 1, 1,
0.9581866, -1.670775, 2.435831, 1, 1, 1, 1, 1,
0.9619672, 0.5585253, 1.923847, 1, 1, 1, 1, 1,
0.9626583, 0.7276698, 0.2634411, 1, 1, 1, 1, 1,
0.9678282, 0.6053238, 0.5331299, 1, 1, 1, 1, 1,
0.9729748, -0.9870462, 1.459452, 1, 1, 1, 1, 1,
0.9745048, 0.5430848, 1.712553, 1, 1, 1, 1, 1,
0.9795653, 1.088409, 0.04073082, 1, 1, 1, 1, 1,
0.9806161, 0.9726394, 0.3692144, 1, 1, 1, 1, 1,
0.9809719, -0.1842889, 2.100075, 1, 1, 1, 1, 1,
0.9931987, -1.244739, 2.584324, 1, 1, 1, 1, 1,
0.9939881, -0.1750451, 2.090186, 0, 0, 1, 1, 1,
1.004744, -2.630352, 2.33864, 1, 0, 0, 1, 1,
1.013823, 0.7336194, 1.846064, 1, 0, 0, 1, 1,
1.013852, -1.169631, 4.162652, 1, 0, 0, 1, 1,
1.014041, 0.8555018, -0.8793157, 1, 0, 0, 1, 1,
1.01912, 0.7032109, 0.1634364, 1, 0, 0, 1, 1,
1.020467, -1.285526, 1.718007, 0, 0, 0, 1, 1,
1.022759, -0.2856569, 2.868934, 0, 0, 0, 1, 1,
1.024302, 0.615773, 1.113736, 0, 0, 0, 1, 1,
1.024463, -0.2708794, 0.4683866, 0, 0, 0, 1, 1,
1.031104, 0.08976022, 1.142465, 0, 0, 0, 1, 1,
1.032601, -0.147496, 1.216521, 0, 0, 0, 1, 1,
1.038327, 0.2175473, 1.450611, 0, 0, 0, 1, 1,
1.04598, -0.5148572, 1.440723, 1, 1, 1, 1, 1,
1.046105, 0.01820455, 1.927156, 1, 1, 1, 1, 1,
1.046343, -1.772654, 3.061487, 1, 1, 1, 1, 1,
1.046363, 0.8047995, 0.8493175, 1, 1, 1, 1, 1,
1.048784, 0.442032, 1.609596, 1, 1, 1, 1, 1,
1.057564, -1.072835, 4.150788, 1, 1, 1, 1, 1,
1.065415, 0.6217448, 1.466519, 1, 1, 1, 1, 1,
1.066728, 0.0245061, 0.8475496, 1, 1, 1, 1, 1,
1.074428, -0.3530326, 2.274059, 1, 1, 1, 1, 1,
1.075003, -0.0523735, 2.549407, 1, 1, 1, 1, 1,
1.080661, 0.4978023, 0.3200805, 1, 1, 1, 1, 1,
1.083122, -0.5952516, 2.350214, 1, 1, 1, 1, 1,
1.085585, -1.204525, 1.300054, 1, 1, 1, 1, 1,
1.093562, 0.5103105, 2.612162, 1, 1, 1, 1, 1,
1.094764, 1.093636, 1.091855, 1, 1, 1, 1, 1,
1.096059, 0.4072103, 1.239384, 0, 0, 1, 1, 1,
1.10488, -1.380807, 1.87364, 1, 0, 0, 1, 1,
1.105627, 0.3533742, 1.279642, 1, 0, 0, 1, 1,
1.107596, 1.016862, 1.935432, 1, 0, 0, 1, 1,
1.108795, 0.6118149, 2.160142, 1, 0, 0, 1, 1,
1.110408, 0.2300189, 0.6679475, 1, 0, 0, 1, 1,
1.113384, -0.2384136, 1.808555, 0, 0, 0, 1, 1,
1.115536, 1.622113, 1.42929, 0, 0, 0, 1, 1,
1.124633, -1.55538, 4.982313, 0, 0, 0, 1, 1,
1.131992, 0.268802, 1.034827, 0, 0, 0, 1, 1,
1.139013, 0.5452991, 1.697848, 0, 0, 0, 1, 1,
1.144594, 0.7573547, 1.312892, 0, 0, 0, 1, 1,
1.145545, -0.6445568, 2.107864, 0, 0, 0, 1, 1,
1.154135, 2.544483, 2.680367, 1, 1, 1, 1, 1,
1.155405, 0.7660624, 3.102105, 1, 1, 1, 1, 1,
1.156441, -1.464269, 1.311551, 1, 1, 1, 1, 1,
1.1596, 0.4047802, 2.400322, 1, 1, 1, 1, 1,
1.167014, -0.1496837, 2.086588, 1, 1, 1, 1, 1,
1.169468, 1.646472, 1.245477, 1, 1, 1, 1, 1,
1.172024, -1.032005, 2.067678, 1, 1, 1, 1, 1,
1.177601, 0.8335198, -0.3559333, 1, 1, 1, 1, 1,
1.181406, 1.98001, 2.572093, 1, 1, 1, 1, 1,
1.188564, 0.1373447, 2.090356, 1, 1, 1, 1, 1,
1.202683, -0.8752754, 2.851408, 1, 1, 1, 1, 1,
1.205496, -0.1640564, 1.88452, 1, 1, 1, 1, 1,
1.212257, 0.9671291, 1.670139, 1, 1, 1, 1, 1,
1.218983, -0.548431, 1.266036, 1, 1, 1, 1, 1,
1.233239, 0.1852026, 0.4458267, 1, 1, 1, 1, 1,
1.233409, -1.253099, 4.072537, 0, 0, 1, 1, 1,
1.268915, 0.7229607, 0.2246528, 1, 0, 0, 1, 1,
1.272277, 0.8438347, 1.78294, 1, 0, 0, 1, 1,
1.28237, 1.39606, 0.8487024, 1, 0, 0, 1, 1,
1.282601, 0.3051354, 0.8295176, 1, 0, 0, 1, 1,
1.282822, -0.0011231, 2.049743, 1, 0, 0, 1, 1,
1.298038, -0.8321795, 2.114862, 0, 0, 0, 1, 1,
1.299979, 0.149248, 0.2830026, 0, 0, 0, 1, 1,
1.31065, 1.548328, 0.5513971, 0, 0, 0, 1, 1,
1.31706, -0.165572, 1.722669, 0, 0, 0, 1, 1,
1.322113, 0.1669514, 1.647622, 0, 0, 0, 1, 1,
1.322431, -0.9783567, -0.5208318, 0, 0, 0, 1, 1,
1.330297, -1.010917, 1.207285, 0, 0, 0, 1, 1,
1.346967, -0.9646924, 2.934433, 1, 1, 1, 1, 1,
1.354743, -0.4662123, 2.849254, 1, 1, 1, 1, 1,
1.362188, 0.06655553, 1.852946, 1, 1, 1, 1, 1,
1.365693, 1.1359, -0.4685321, 1, 1, 1, 1, 1,
1.374161, -2.194624, 3.719848, 1, 1, 1, 1, 1,
1.374758, -1.176056, 3.822989, 1, 1, 1, 1, 1,
1.384646, 0.4221418, 1.906999, 1, 1, 1, 1, 1,
1.388003, 0.9189112, 2.22494, 1, 1, 1, 1, 1,
1.388782, 1.241927, 1.348639, 1, 1, 1, 1, 1,
1.420006, 1.080769, 1.265282, 1, 1, 1, 1, 1,
1.435779, 1.456968, 0.7974315, 1, 1, 1, 1, 1,
1.446239, -0.5328188, 4.039284, 1, 1, 1, 1, 1,
1.466837, -1.386347, 2.53951, 1, 1, 1, 1, 1,
1.476755, -1.526902, 2.21416, 1, 1, 1, 1, 1,
1.480422, 0.8335949, 2.17122, 1, 1, 1, 1, 1,
1.481346, -0.380212, 1.201864, 0, 0, 1, 1, 1,
1.482533, 0.7952204, -0.9507053, 1, 0, 0, 1, 1,
1.517896, -0.5852043, 3.109544, 1, 0, 0, 1, 1,
1.521054, 1.794016, -0.6469856, 1, 0, 0, 1, 1,
1.533066, 0.0163692, 2.523727, 1, 0, 0, 1, 1,
1.540298, 0.3023539, 1.305877, 1, 0, 0, 1, 1,
1.5484, -0.06573799, 0.4609584, 0, 0, 0, 1, 1,
1.549354, -0.1150989, 2.126954, 0, 0, 0, 1, 1,
1.550738, 0.02434379, 1.397652, 0, 0, 0, 1, 1,
1.551745, -0.3921797, 0.5742037, 0, 0, 0, 1, 1,
1.569892, 0.7524146, 0.135742, 0, 0, 0, 1, 1,
1.57452, -0.9518059, 1.13471, 0, 0, 0, 1, 1,
1.596907, 1.028489, -0.8939367, 0, 0, 0, 1, 1,
1.602675, -1.308128, 1.475497, 1, 1, 1, 1, 1,
1.604324, -0.2541128, 1.632915, 1, 1, 1, 1, 1,
1.611059, -0.7759746, 1.495932, 1, 1, 1, 1, 1,
1.61766, 0.5956142, 0.2700485, 1, 1, 1, 1, 1,
1.626819, -0.1067422, 1.19212, 1, 1, 1, 1, 1,
1.627248, -1.949533, 0.9483323, 1, 1, 1, 1, 1,
1.634905, 0.3847334, 1.097719, 1, 1, 1, 1, 1,
1.639708, -1.051736, 2.416245, 1, 1, 1, 1, 1,
1.652521, -1.506199, 2.163428, 1, 1, 1, 1, 1,
1.669017, -0.06833343, 1.593479, 1, 1, 1, 1, 1,
1.688553, -1.255536, 2.87717, 1, 1, 1, 1, 1,
1.688771, 1.563136, 0.8263393, 1, 1, 1, 1, 1,
1.693701, 0.5302638, 1.338251, 1, 1, 1, 1, 1,
1.718558, -1.385051, 1.951518, 1, 1, 1, 1, 1,
1.72457, -1.907291, 2.491107, 1, 1, 1, 1, 1,
1.734522, -0.421793, 2.198473, 0, 0, 1, 1, 1,
1.736199, -1.384483, 2.982586, 1, 0, 0, 1, 1,
1.739965, 0.2953778, 3.279211, 1, 0, 0, 1, 1,
1.777431, 0.3972033, 1.37941, 1, 0, 0, 1, 1,
1.784639, -1.821008, 2.61145, 1, 0, 0, 1, 1,
1.792087, 0.01134756, 1.001158, 1, 0, 0, 1, 1,
1.796299, -0.6176765, 3.360318, 0, 0, 0, 1, 1,
1.80073, -0.6997448, 2.599457, 0, 0, 0, 1, 1,
1.809096, 0.8559724, 1.808935, 0, 0, 0, 1, 1,
1.809358, 0.7820685, 1.172951, 0, 0, 0, 1, 1,
1.820166, -0.3260589, 0.7264068, 0, 0, 0, 1, 1,
1.822239, 2.205231, 2.308362, 0, 0, 0, 1, 1,
1.853848, 0.3430233, 0.4245837, 0, 0, 0, 1, 1,
1.859075, 0.9065604, 0.526146, 1, 1, 1, 1, 1,
1.864898, 0.7638789, 0.9785689, 1, 1, 1, 1, 1,
1.882376, 0.6740351, 0.8692344, 1, 1, 1, 1, 1,
1.888928, 0.08431513, 1.347719, 1, 1, 1, 1, 1,
1.894432, -0.3014944, 1.004828, 1, 1, 1, 1, 1,
1.963035, -0.9601137, 2.608263, 1, 1, 1, 1, 1,
1.978004, 0.6103014, 0.9662938, 1, 1, 1, 1, 1,
1.981207, 0.5445515, 2.998165, 1, 1, 1, 1, 1,
1.983333, 2.461073, -0.3332286, 1, 1, 1, 1, 1,
1.988633, -0.1377095, 1.562403, 1, 1, 1, 1, 1,
1.995686, -0.2851551, 2.178864, 1, 1, 1, 1, 1,
2.008512, -0.03387307, 2.460447, 1, 1, 1, 1, 1,
2.01182, 0.5082541, 2.715656, 1, 1, 1, 1, 1,
2.018186, 1.078162, -0.03651822, 1, 1, 1, 1, 1,
2.084397, 1.121339, 0.6738883, 1, 1, 1, 1, 1,
2.100578, -0.8501526, 2.69312, 0, 0, 1, 1, 1,
2.117774, -1.238781, 2.211026, 1, 0, 0, 1, 1,
2.142362, 1.778977, 2.059222, 1, 0, 0, 1, 1,
2.225715, -0.2614573, 1.748973, 1, 0, 0, 1, 1,
2.240371, 1.80842, -0.7514984, 1, 0, 0, 1, 1,
2.253917, -0.4230279, 2.999028, 1, 0, 0, 1, 1,
2.25848, -0.665024, 3.207242, 0, 0, 0, 1, 1,
2.280513, -0.2861231, 0.9033142, 0, 0, 0, 1, 1,
2.36111, 0.5552465, 0.5263882, 0, 0, 0, 1, 1,
2.374262, -1.573986, 2.418701, 0, 0, 0, 1, 1,
2.393363, -0.5797943, 0.7184, 0, 0, 0, 1, 1,
2.408211, -1.247359, 2.180754, 0, 0, 0, 1, 1,
2.418597, 1.824808, 0.8664401, 0, 0, 0, 1, 1,
2.512047, -0.3814544, 1.718033, 1, 1, 1, 1, 1,
2.535783, 0.7041138, 1.610664, 1, 1, 1, 1, 1,
2.755832, -0.8727247, 2.190055, 1, 1, 1, 1, 1,
2.780257, -0.7507127, 1.670359, 1, 1, 1, 1, 1,
2.897255, -1.081223, 1.439035, 1, 1, 1, 1, 1,
3.145692, 0.06347155, 2.014891, 1, 1, 1, 1, 1,
3.619551, -1.208541, 2.67292, 1, 1, 1, 1, 1
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
var radius = 9.198772;
var distance = 32.3103;
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
mvMatrix.translate( -0.4604189, 0.265646, -0.1796174 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.3103);
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
