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
-2.963244, 0.4198998, -1.041814, 1, 0, 0, 1,
-2.733313, -1.786805, -3.526807, 1, 0.007843138, 0, 1,
-2.690945, 0.9648029, 0.0386306, 1, 0.01176471, 0, 1,
-2.570518, 0.4259565, -0.7212073, 1, 0.01960784, 0, 1,
-2.511452, -1.822873, -1.804584, 1, 0.02352941, 0, 1,
-2.504358, 0.3989818, -0.7876014, 1, 0.03137255, 0, 1,
-2.411799, -0.2355119, -0.9881541, 1, 0.03529412, 0, 1,
-2.344727, 0.01562576, -1.290789, 1, 0.04313726, 0, 1,
-2.322706, 0.942521, -0.8105662, 1, 0.04705882, 0, 1,
-2.279243, -0.4722537, -1.79956, 1, 0.05490196, 0, 1,
-2.260298, 1.811599, -0.1852288, 1, 0.05882353, 0, 1,
-2.236365, 1.85537, -0.4426042, 1, 0.06666667, 0, 1,
-2.231962, -0.4814884, -4.136456, 1, 0.07058824, 0, 1,
-2.187596, 1.418489, -3.341767, 1, 0.07843138, 0, 1,
-2.122577, 0.827347, -2.366351, 1, 0.08235294, 0, 1,
-2.110765, 1.736574, 0.8737572, 1, 0.09019608, 0, 1,
-2.104358, -0.1237408, -1.82278, 1, 0.09411765, 0, 1,
-2.096841, 1.164842, -0.6850383, 1, 0.1019608, 0, 1,
-2.085823, 0.6298725, -2.929601, 1, 0.1098039, 0, 1,
-2.072828, 1.102251, -1.123341, 1, 0.1137255, 0, 1,
-2.043631, -0.04592107, -1.60214, 1, 0.1215686, 0, 1,
-2.02439, -1.512936, -0.4547222, 1, 0.1254902, 0, 1,
-2.022405, -1.446287, -1.537021, 1, 0.1333333, 0, 1,
-2.003422, 0.3967708, -1.510161, 1, 0.1372549, 0, 1,
-1.995143, -1.45357, -2.327094, 1, 0.145098, 0, 1,
-1.994116, -0.6473911, -2.679826, 1, 0.1490196, 0, 1,
-1.988651, 0.5270352, -0.8603635, 1, 0.1568628, 0, 1,
-1.977749, 0.7689641, -1.223785, 1, 0.1607843, 0, 1,
-1.967896, 0.2267919, -1.110082, 1, 0.1686275, 0, 1,
-1.953633, 0.01909501, -2.446184, 1, 0.172549, 0, 1,
-1.949381, -0.2663279, -2.31679, 1, 0.1803922, 0, 1,
-1.949215, 1.440998, 1.284142, 1, 0.1843137, 0, 1,
-1.938182, 0.1613974, -3.474554, 1, 0.1921569, 0, 1,
-1.922575, 0.00312419, -1.118398, 1, 0.1960784, 0, 1,
-1.914558, 1.19769, -0.3035261, 1, 0.2039216, 0, 1,
-1.89502, 0.9978247, -0.4322983, 1, 0.2117647, 0, 1,
-1.893221, 0.001252532, -0.6209829, 1, 0.2156863, 0, 1,
-1.827212, -1.637488, -2.231417, 1, 0.2235294, 0, 1,
-1.81404, 1.348224, -1.031165, 1, 0.227451, 0, 1,
-1.794412, 0.9670177, -0.9529755, 1, 0.2352941, 0, 1,
-1.783424, -1.46464, -1.379941, 1, 0.2392157, 0, 1,
-1.782912, -0.322187, -2.618171, 1, 0.2470588, 0, 1,
-1.774646, 1.151039, -1.599505, 1, 0.2509804, 0, 1,
-1.770254, -0.8916773, -1.827278, 1, 0.2588235, 0, 1,
-1.750583, 2.27211, -0.846541, 1, 0.2627451, 0, 1,
-1.729642, 0.04971917, -0.1250673, 1, 0.2705882, 0, 1,
-1.721658, 0.4710321, -0.4439137, 1, 0.2745098, 0, 1,
-1.709006, -0.7021101, -1.912181, 1, 0.282353, 0, 1,
-1.705619, 1.868755, -0.0006128888, 1, 0.2862745, 0, 1,
-1.696414, 0.5033233, -1.900889, 1, 0.2941177, 0, 1,
-1.665593, 0.8307973, -2.513797, 1, 0.3019608, 0, 1,
-1.634254, 0.4075303, -2.139161, 1, 0.3058824, 0, 1,
-1.619169, -0.6765211, -2.615546, 1, 0.3137255, 0, 1,
-1.601087, -1.759237, -2.310111, 1, 0.3176471, 0, 1,
-1.594964, -0.1467106, -1.070433, 1, 0.3254902, 0, 1,
-1.592753, 1.111699, -0.7757869, 1, 0.3294118, 0, 1,
-1.575704, 0.4088843, -0.810351, 1, 0.3372549, 0, 1,
-1.569679, 0.1842792, 1.010538, 1, 0.3411765, 0, 1,
-1.566108, 0.4580621, -1.756166, 1, 0.3490196, 0, 1,
-1.562523, 0.8229179, -0.4810358, 1, 0.3529412, 0, 1,
-1.536378, 0.5279797, -0.6481266, 1, 0.3607843, 0, 1,
-1.526557, 0.9455161, -0.7471418, 1, 0.3647059, 0, 1,
-1.524326, 1.494399, -2.60686, 1, 0.372549, 0, 1,
-1.51636, 0.01783737, -1.992381, 1, 0.3764706, 0, 1,
-1.514291, -0.2431336, -1.991017, 1, 0.3843137, 0, 1,
-1.511388, 0.1445903, -2.13488, 1, 0.3882353, 0, 1,
-1.497847, -1.173694, -1.840528, 1, 0.3960784, 0, 1,
-1.465262, 0.3950683, -1.624173, 1, 0.4039216, 0, 1,
-1.460472, 1.928507, -2.555743, 1, 0.4078431, 0, 1,
-1.453184, 2.003958, 0.2329019, 1, 0.4156863, 0, 1,
-1.44456, 0.6088351, -1.051215, 1, 0.4196078, 0, 1,
-1.441183, 2.201749, -0.2894723, 1, 0.427451, 0, 1,
-1.439932, 0.4992789, 0.4036993, 1, 0.4313726, 0, 1,
-1.437985, -0.4275496, -2.490051, 1, 0.4392157, 0, 1,
-1.435963, 0.3122743, 0.1949166, 1, 0.4431373, 0, 1,
-1.433016, -0.5141466, -1.959637, 1, 0.4509804, 0, 1,
-1.426014, -0.7485363, -2.117889, 1, 0.454902, 0, 1,
-1.422168, -0.3299109, -1.983816, 1, 0.4627451, 0, 1,
-1.42209, 0.05730966, -2.5028, 1, 0.4666667, 0, 1,
-1.415799, 0.08148553, -3.067595, 1, 0.4745098, 0, 1,
-1.414797, -2.060031, -2.913546, 1, 0.4784314, 0, 1,
-1.409176, -0.4838465, -1.402144, 1, 0.4862745, 0, 1,
-1.408582, -0.7475302, -2.178695, 1, 0.4901961, 0, 1,
-1.397435, 0.9276197, -1.23303, 1, 0.4980392, 0, 1,
-1.384575, 1.455389, -1.114378, 1, 0.5058824, 0, 1,
-1.379781, -0.6859542, -0.4865847, 1, 0.509804, 0, 1,
-1.374459, 0.7751859, -0.05181013, 1, 0.5176471, 0, 1,
-1.367453, 0.3265196, 0.07993902, 1, 0.5215687, 0, 1,
-1.357157, 0.3347344, 1.081462, 1, 0.5294118, 0, 1,
-1.349667, 1.238606, -1.065664, 1, 0.5333334, 0, 1,
-1.343348, 1.429064, -0.01829954, 1, 0.5411765, 0, 1,
-1.324214, -0.8694574, -1.375871, 1, 0.5450981, 0, 1,
-1.320567, -0.3971459, -1.876941, 1, 0.5529412, 0, 1,
-1.318675, 2.128436, -0.466091, 1, 0.5568628, 0, 1,
-1.317866, -0.4678294, 0.284381, 1, 0.5647059, 0, 1,
-1.313999, 0.5979555, -3.42218, 1, 0.5686275, 0, 1,
-1.31148, 0.5097625, -1.470319, 1, 0.5764706, 0, 1,
-1.291475, -0.2735023, -2.271207, 1, 0.5803922, 0, 1,
-1.276825, -0.8786283, -2.659602, 1, 0.5882353, 0, 1,
-1.250886, -0.03480298, -1.886769, 1, 0.5921569, 0, 1,
-1.250711, 2.043614, -2.151621, 1, 0.6, 0, 1,
-1.245041, 0.01573101, -1.420385, 1, 0.6078432, 0, 1,
-1.237926, 0.2268854, -1.691755, 1, 0.6117647, 0, 1,
-1.230458, 1.61924, -1.927732, 1, 0.6196079, 0, 1,
-1.227831, 1.010945, 0.3254842, 1, 0.6235294, 0, 1,
-1.205663, 1.85883, -1.3371, 1, 0.6313726, 0, 1,
-1.205559, 1.457378, -1.096662, 1, 0.6352941, 0, 1,
-1.198222, 0.340169, -2.33184, 1, 0.6431373, 0, 1,
-1.190835, -0.1424007, -2.614588, 1, 0.6470588, 0, 1,
-1.189707, 1.346381, -0.3718995, 1, 0.654902, 0, 1,
-1.189618, -0.4771798, -2.383226, 1, 0.6588235, 0, 1,
-1.18908, 0.7384045, -1.576756, 1, 0.6666667, 0, 1,
-1.188737, 0.3049642, -0.5716444, 1, 0.6705883, 0, 1,
-1.172191, -0.8843546, -3.795655, 1, 0.6784314, 0, 1,
-1.168771, 0.1880771, -1.352825, 1, 0.682353, 0, 1,
-1.1563, -0.5607814, -1.898164, 1, 0.6901961, 0, 1,
-1.146259, -0.2721938, -1.990855, 1, 0.6941177, 0, 1,
-1.146146, -1.830817, -1.179655, 1, 0.7019608, 0, 1,
-1.141201, -1.029851, -1.29813, 1, 0.7098039, 0, 1,
-1.137611, 1.211789, -0.9867769, 1, 0.7137255, 0, 1,
-1.133363, 1.525152, 0.1033172, 1, 0.7215686, 0, 1,
-1.118627, 2.088651, -0.9967697, 1, 0.7254902, 0, 1,
-1.116077, -0.5909964, -0.2633381, 1, 0.7333333, 0, 1,
-1.113592, 0.9648556, -0.3441678, 1, 0.7372549, 0, 1,
-1.112957, 1.903053, 0.0196909, 1, 0.7450981, 0, 1,
-1.096142, -0.2241385, -3.387829, 1, 0.7490196, 0, 1,
-1.095966, 0.9032655, -0.620331, 1, 0.7568628, 0, 1,
-1.095514, -0.323911, 0.003701063, 1, 0.7607843, 0, 1,
-1.095083, -2.711399, -4.658958, 1, 0.7686275, 0, 1,
-1.092476, 0.2357095, -0.4872915, 1, 0.772549, 0, 1,
-1.091221, -0.145149, -1.769138, 1, 0.7803922, 0, 1,
-1.087429, -2.369045, -4.248952, 1, 0.7843137, 0, 1,
-1.087003, 0.3586857, -2.326385, 1, 0.7921569, 0, 1,
-1.083508, 0.3692804, -1.995863, 1, 0.7960784, 0, 1,
-1.082, -0.2324445, -2.486846, 1, 0.8039216, 0, 1,
-1.080785, 0.8923751, -0.2565945, 1, 0.8117647, 0, 1,
-1.077623, -0.857655, -1.922535, 1, 0.8156863, 0, 1,
-1.074994, 0.3628398, -2.866087, 1, 0.8235294, 0, 1,
-1.074207, 0.4128178, -1.936302, 1, 0.827451, 0, 1,
-1.068519, 0.5490257, -1.463827, 1, 0.8352941, 0, 1,
-1.066926, 0.5211008, -1.560642, 1, 0.8392157, 0, 1,
-1.05692, -1.461488, -1.812282, 1, 0.8470588, 0, 1,
-1.055371, -1.084824, -2.350988, 1, 0.8509804, 0, 1,
-1.051125, 1.0094, -0.04084574, 1, 0.8588235, 0, 1,
-1.044401, -1.345995, -1.631574, 1, 0.8627451, 0, 1,
-1.044079, 0.8009998, 1.305017, 1, 0.8705882, 0, 1,
-1.042792, 1.953224, -0.2327765, 1, 0.8745098, 0, 1,
-1.0399, 2.183157, 1.34053, 1, 0.8823529, 0, 1,
-1.038693, -0.6413028, -2.496255, 1, 0.8862745, 0, 1,
-1.033957, -1.70637, -1.565252, 1, 0.8941177, 0, 1,
-1.032678, 1.143422, 0.5232769, 1, 0.8980392, 0, 1,
-1.032311, 0.2204939, -2.476605, 1, 0.9058824, 0, 1,
-1.028695, 1.647916, 0.654178, 1, 0.9137255, 0, 1,
-1.024308, -0.2662255, -1.661172, 1, 0.9176471, 0, 1,
-1.021467, -0.08551483, -2.800947, 1, 0.9254902, 0, 1,
-1.018961, 0.7016195, -0.8804135, 1, 0.9294118, 0, 1,
-1.01766, 0.4881299, -2.942223, 1, 0.9372549, 0, 1,
-1.011956, -1.45507, -0.9937285, 1, 0.9411765, 0, 1,
-1.003686, -0.05452373, -1.183526, 1, 0.9490196, 0, 1,
-1.002314, -0.4340174, -1.912943, 1, 0.9529412, 0, 1,
-1.001104, 1.551205, 0.1695864, 1, 0.9607843, 0, 1,
-0.9992527, 0.3822382, -0.3088849, 1, 0.9647059, 0, 1,
-0.9825971, 0.05898215, -2.539717, 1, 0.972549, 0, 1,
-0.9822786, 1.855575, -0.8226646, 1, 0.9764706, 0, 1,
-0.9814336, -1.308784, -1.962529, 1, 0.9843137, 0, 1,
-0.9703309, 0.8427141, -0.7000017, 1, 0.9882353, 0, 1,
-0.9504597, 0.3531443, -1.275818, 1, 0.9960784, 0, 1,
-0.9475279, -0.2677171, -3.976475, 0.9960784, 1, 0, 1,
-0.9447071, -0.8453678, -2.276087, 0.9921569, 1, 0, 1,
-0.9431203, 1.435551, -1.425928, 0.9843137, 1, 0, 1,
-0.9427631, 0.1062614, -0.8114015, 0.9803922, 1, 0, 1,
-0.9344914, -1.727321, -0.6155213, 0.972549, 1, 0, 1,
-0.9272795, 0.04503912, -1.600582, 0.9686275, 1, 0, 1,
-0.9268889, -0.4938318, -1.453424, 0.9607843, 1, 0, 1,
-0.9159863, -0.2791983, -2.418719, 0.9568627, 1, 0, 1,
-0.9116083, 0.7504885, -0.4020725, 0.9490196, 1, 0, 1,
-0.9058367, -0.1936411, -2.008645, 0.945098, 1, 0, 1,
-0.9035814, 0.5912835, -2.692618, 0.9372549, 1, 0, 1,
-0.880009, 1.174821, 1.072861, 0.9333333, 1, 0, 1,
-0.8771587, -0.1258694, -1.74796, 0.9254902, 1, 0, 1,
-0.8697475, 0.1030565, -2.323153, 0.9215686, 1, 0, 1,
-0.8697059, 0.9046452, -2.059047, 0.9137255, 1, 0, 1,
-0.8696007, -0.2909242, -3.100783, 0.9098039, 1, 0, 1,
-0.8667114, 1.248834, -1.767586, 0.9019608, 1, 0, 1,
-0.8644686, -1.511937, -3.625867, 0.8941177, 1, 0, 1,
-0.8626733, -1.712684, -1.469063, 0.8901961, 1, 0, 1,
-0.8625804, 0.4129163, -1.886752, 0.8823529, 1, 0, 1,
-0.8592314, 0.9322785, 0.3753406, 0.8784314, 1, 0, 1,
-0.8541928, -0.3497858, -1.190615, 0.8705882, 1, 0, 1,
-0.853279, -1.460306, -2.672946, 0.8666667, 1, 0, 1,
-0.8519456, -0.2714724, -2.049162, 0.8588235, 1, 0, 1,
-0.8512809, -0.1686205, -1.684071, 0.854902, 1, 0, 1,
-0.8397077, -0.09005634, -2.044773, 0.8470588, 1, 0, 1,
-0.8324257, 0.2669727, -2.382164, 0.8431373, 1, 0, 1,
-0.8315818, -0.6158803, -2.323581, 0.8352941, 1, 0, 1,
-0.8229746, -1.536935, -2.597499, 0.8313726, 1, 0, 1,
-0.8181186, -0.5898416, -2.016306, 0.8235294, 1, 0, 1,
-0.8139381, -0.550565, -3.309086, 0.8196079, 1, 0, 1,
-0.8119496, -0.07596377, -2.684286, 0.8117647, 1, 0, 1,
-0.8109401, -2.622908, -2.313967, 0.8078431, 1, 0, 1,
-0.8090815, -0.6182836, -3.387503, 0.8, 1, 0, 1,
-0.8086721, 0.153094, -0.414578, 0.7921569, 1, 0, 1,
-0.8076369, 0.5020832, -0.4565914, 0.7882353, 1, 0, 1,
-0.8072837, 1.032657, -0.1121949, 0.7803922, 1, 0, 1,
-0.8071209, -0.3108134, -2.607547, 0.7764706, 1, 0, 1,
-0.8037688, -1.766203, -1.601011, 0.7686275, 1, 0, 1,
-0.8036029, -1.051716, -1.852351, 0.7647059, 1, 0, 1,
-0.7969013, -1.425836, -2.017988, 0.7568628, 1, 0, 1,
-0.7956318, 1.244699, -2.811651, 0.7529412, 1, 0, 1,
-0.7955785, -0.5604621, -3.150218, 0.7450981, 1, 0, 1,
-0.7951569, 0.5480901, -1.083848, 0.7411765, 1, 0, 1,
-0.794216, -0.4767173, -2.002235, 0.7333333, 1, 0, 1,
-0.7935405, -0.4584161, -2.626192, 0.7294118, 1, 0, 1,
-0.7877272, -2.480224, -2.892414, 0.7215686, 1, 0, 1,
-0.7872331, 0.7455773, -1.583982, 0.7176471, 1, 0, 1,
-0.7871525, 0.0461925, -3.456407, 0.7098039, 1, 0, 1,
-0.7870353, -0.2164639, -1.192337, 0.7058824, 1, 0, 1,
-0.7850945, -0.917634, -2.373925, 0.6980392, 1, 0, 1,
-0.7797354, -0.1144463, -1.318846, 0.6901961, 1, 0, 1,
-0.7786433, -0.2771206, -2.001335, 0.6862745, 1, 0, 1,
-0.7674991, -0.2397388, -1.334192, 0.6784314, 1, 0, 1,
-0.766448, 0.7623086, -0.4706993, 0.6745098, 1, 0, 1,
-0.7663689, -1.201901, -2.575919, 0.6666667, 1, 0, 1,
-0.7645122, -0.5122025, -2.460616, 0.6627451, 1, 0, 1,
-0.76448, 1.148618, -0.1747125, 0.654902, 1, 0, 1,
-0.7626642, 1.661625, 0.296124, 0.6509804, 1, 0, 1,
-0.7617421, 1.232329, -0.238399, 0.6431373, 1, 0, 1,
-0.7574873, -0.9468462, -1.833624, 0.6392157, 1, 0, 1,
-0.7572351, -0.6012316, -1.722441, 0.6313726, 1, 0, 1,
-0.7538365, -2.31134, -4.11339, 0.627451, 1, 0, 1,
-0.7518012, -0.1101724, -0.7832167, 0.6196079, 1, 0, 1,
-0.7515256, -1.144422, -3.710787, 0.6156863, 1, 0, 1,
-0.7498915, -0.1092525, -1.949215, 0.6078432, 1, 0, 1,
-0.7433391, -0.756618, -2.117075, 0.6039216, 1, 0, 1,
-0.7316836, -0.4931687, -1.895624, 0.5960785, 1, 0, 1,
-0.7296146, -1.537031, -2.818987, 0.5882353, 1, 0, 1,
-0.7245101, -0.4451835, -1.190701, 0.5843138, 1, 0, 1,
-0.7069672, 0.522727, -0.8817515, 0.5764706, 1, 0, 1,
-0.7030934, 0.2914807, -1.530284, 0.572549, 1, 0, 1,
-0.7015708, -0.6570954, -2.546904, 0.5647059, 1, 0, 1,
-0.7008797, -0.9734859, -2.637734, 0.5607843, 1, 0, 1,
-0.6960678, 0.8237036, -1.200189, 0.5529412, 1, 0, 1,
-0.6913406, 0.4991574, 0.2528648, 0.5490196, 1, 0, 1,
-0.6899482, 1.318215, -0.2335884, 0.5411765, 1, 0, 1,
-0.6884509, 1.444704, -0.9107418, 0.5372549, 1, 0, 1,
-0.6869045, 0.9930094, -0.9895685, 0.5294118, 1, 0, 1,
-0.6847544, 0.5125381, -0.7837805, 0.5254902, 1, 0, 1,
-0.6845178, 0.7385705, -1.326582, 0.5176471, 1, 0, 1,
-0.6844945, 0.02086015, -1.717614, 0.5137255, 1, 0, 1,
-0.6836265, -0.6398551, -3.928208, 0.5058824, 1, 0, 1,
-0.6835167, 0.03070391, -0.9090393, 0.5019608, 1, 0, 1,
-0.6750043, 0.7577561, -0.7712725, 0.4941176, 1, 0, 1,
-0.6737158, 0.3859964, -0.2278801, 0.4862745, 1, 0, 1,
-0.6724121, 0.1243705, -1.289162, 0.4823529, 1, 0, 1,
-0.6711403, 0.8254854, -0.248916, 0.4745098, 1, 0, 1,
-0.6688979, 0.7542931, -1.94706, 0.4705882, 1, 0, 1,
-0.667061, 0.4848771, -2.284369, 0.4627451, 1, 0, 1,
-0.6612484, 0.7946954, -1.123471, 0.4588235, 1, 0, 1,
-0.6597676, -0.995439, -2.639115, 0.4509804, 1, 0, 1,
-0.6543999, 1.467147, -0.5886763, 0.4470588, 1, 0, 1,
-0.6540233, -0.1980031, -2.527588, 0.4392157, 1, 0, 1,
-0.6530522, -1.342722, -2.166792, 0.4352941, 1, 0, 1,
-0.6455274, -0.1563652, -1.923614, 0.427451, 1, 0, 1,
-0.6421204, -0.6343337, -2.156633, 0.4235294, 1, 0, 1,
-0.6418619, 0.07095999, -0.1745746, 0.4156863, 1, 0, 1,
-0.6415009, -1.0018, -3.334825, 0.4117647, 1, 0, 1,
-0.6365361, 0.523463, -1.143071, 0.4039216, 1, 0, 1,
-0.6350783, -1.743005, -3.14634, 0.3960784, 1, 0, 1,
-0.6324976, -0.4697367, -0.02720859, 0.3921569, 1, 0, 1,
-0.6315653, -1.346672, -1.698406, 0.3843137, 1, 0, 1,
-0.6233255, 0.4156462, -0.7708864, 0.3803922, 1, 0, 1,
-0.6221371, -0.3759673, -3.226744, 0.372549, 1, 0, 1,
-0.6141457, -0.4908393, -3.130763, 0.3686275, 1, 0, 1,
-0.6131848, 0.3909703, 0.8697772, 0.3607843, 1, 0, 1,
-0.6085405, 1.117541, -1.437836, 0.3568628, 1, 0, 1,
-0.6060822, -0.3274649, -2.558098, 0.3490196, 1, 0, 1,
-0.6021014, -0.4589573, -0.9164137, 0.345098, 1, 0, 1,
-0.5987251, 0.1419147, -0.5741199, 0.3372549, 1, 0, 1,
-0.596853, -0.668502, -3.31294, 0.3333333, 1, 0, 1,
-0.5959049, 0.3192064, -0.1462849, 0.3254902, 1, 0, 1,
-0.5949853, 0.4097521, -0.964763, 0.3215686, 1, 0, 1,
-0.5947096, -0.1986647, -0.8957943, 0.3137255, 1, 0, 1,
-0.5934929, -1.263662, -3.798176, 0.3098039, 1, 0, 1,
-0.5891907, -1.5535, -2.898243, 0.3019608, 1, 0, 1,
-0.5865768, -0.3288696, -2.1457, 0.2941177, 1, 0, 1,
-0.5854774, -1.162123, -2.867914, 0.2901961, 1, 0, 1,
-0.5784183, 0.3408988, -1.739019, 0.282353, 1, 0, 1,
-0.5769885, -1.003898, -2.576406, 0.2784314, 1, 0, 1,
-0.5741882, 0.8551025, -1.714754, 0.2705882, 1, 0, 1,
-0.5740411, 2.172269, -0.8755376, 0.2666667, 1, 0, 1,
-0.5728111, -0.51504, -1.461638, 0.2588235, 1, 0, 1,
-0.5711895, -0.02141171, 0.440993, 0.254902, 1, 0, 1,
-0.5703018, -0.8493714, -3.393254, 0.2470588, 1, 0, 1,
-0.5658237, -0.6552746, -3.448987, 0.2431373, 1, 0, 1,
-0.5645762, 0.3522564, -2.105234, 0.2352941, 1, 0, 1,
-0.5643169, -0.9552841, -0.9899144, 0.2313726, 1, 0, 1,
-0.5642753, 0.7162793, -1.469995, 0.2235294, 1, 0, 1,
-0.5638507, 0.9722369, -1.732003, 0.2196078, 1, 0, 1,
-0.5627018, -1.179728, -2.0696, 0.2117647, 1, 0, 1,
-0.5623235, -2.032046, -1.914845, 0.2078431, 1, 0, 1,
-0.5597413, -0.4891625, -4.269728, 0.2, 1, 0, 1,
-0.5591037, -0.2700039, -0.1063105, 0.1921569, 1, 0, 1,
-0.558873, -0.1508576, -2.074045, 0.1882353, 1, 0, 1,
-0.5569205, 1.689848, -0.849328, 0.1803922, 1, 0, 1,
-0.5551329, 0.5312946, 0.6759248, 0.1764706, 1, 0, 1,
-0.5514011, -0.819396, -3.018392, 0.1686275, 1, 0, 1,
-0.5486504, 1.011972, 0.6384377, 0.1647059, 1, 0, 1,
-0.5436803, -1.438907, -2.232183, 0.1568628, 1, 0, 1,
-0.5426424, -0.6988934, -1.438794, 0.1529412, 1, 0, 1,
-0.5376947, 0.3010544, -2.594434, 0.145098, 1, 0, 1,
-0.5318179, -0.2814174, -1.35406, 0.1411765, 1, 0, 1,
-0.5290204, -0.1399047, -2.268926, 0.1333333, 1, 0, 1,
-0.5222592, 0.9659809, 0.8249005, 0.1294118, 1, 0, 1,
-0.5196576, 0.8536266, 1.318359, 0.1215686, 1, 0, 1,
-0.5193953, 1.217549, 1.998896, 0.1176471, 1, 0, 1,
-0.5186316, -0.06342826, -2.05911, 0.1098039, 1, 0, 1,
-0.514595, -0.03419235, -1.647759, 0.1058824, 1, 0, 1,
-0.5135773, -0.8727943, -2.075078, 0.09803922, 1, 0, 1,
-0.5114726, 0.4063345, -1.549513, 0.09019608, 1, 0, 1,
-0.5041915, -0.4822277, -2.997755, 0.08627451, 1, 0, 1,
-0.5039937, -0.9352206, -1.627056, 0.07843138, 1, 0, 1,
-0.5026861, 0.172347, -2.243335, 0.07450981, 1, 0, 1,
-0.4980942, 1.835668, 0.8552308, 0.06666667, 1, 0, 1,
-0.4929389, -0.6420875, -2.373346, 0.0627451, 1, 0, 1,
-0.492626, 1.050123, 0.5589862, 0.05490196, 1, 0, 1,
-0.4919938, -0.09952513, -1.184891, 0.05098039, 1, 0, 1,
-0.4892832, -1.525894, -4.114818, 0.04313726, 1, 0, 1,
-0.4889701, -0.07666478, -2.737233, 0.03921569, 1, 0, 1,
-0.4851275, 0.6506166, 0.03051225, 0.03137255, 1, 0, 1,
-0.4834308, 1.35701, -1.396663, 0.02745098, 1, 0, 1,
-0.4790142, 1.321305, 0.6486938, 0.01960784, 1, 0, 1,
-0.4728919, 0.1560776, -1.411291, 0.01568628, 1, 0, 1,
-0.4708078, -1.022407, -2.215234, 0.007843138, 1, 0, 1,
-0.4675888, -0.2147315, -3.15332, 0.003921569, 1, 0, 1,
-0.4675118, 0.6152226, 0.05170028, 0, 1, 0.003921569, 1,
-0.4663544, -1.008356, -2.874955, 0, 1, 0.01176471, 1,
-0.4645305, 0.8869262, -0.8671159, 0, 1, 0.01568628, 1,
-0.4635977, 0.4020668, 0.209988, 0, 1, 0.02352941, 1,
-0.4604183, -0.5569472, -1.433095, 0, 1, 0.02745098, 1,
-0.4593787, 0.5854754, 0.01131258, 0, 1, 0.03529412, 1,
-0.4587804, -0.5066189, -3.891263, 0, 1, 0.03921569, 1,
-0.4575603, -0.6646563, -3.455016, 0, 1, 0.04705882, 1,
-0.4534575, -0.4124435, -1.941326, 0, 1, 0.05098039, 1,
-0.4506061, 0.5550879, -2.342914, 0, 1, 0.05882353, 1,
-0.4448433, -0.04207456, -2.230561, 0, 1, 0.0627451, 1,
-0.4448368, 0.571041, 0.2830288, 0, 1, 0.07058824, 1,
-0.4385967, -0.004301918, -2.459802, 0, 1, 0.07450981, 1,
-0.4378358, 0.2948327, -0.3240302, 0, 1, 0.08235294, 1,
-0.4368955, 1.596669, -1.494913, 0, 1, 0.08627451, 1,
-0.4353427, 0.528503, 0.2414488, 0, 1, 0.09411765, 1,
-0.4327656, -1.347271, -3.018864, 0, 1, 0.1019608, 1,
-0.4277913, 0.3831268, -0.7283447, 0, 1, 0.1058824, 1,
-0.4274056, 0.7158807, 0.6323122, 0, 1, 0.1137255, 1,
-0.4258175, 0.5671049, -0.20921, 0, 1, 0.1176471, 1,
-0.4196115, 0.09158055, -1.830571, 0, 1, 0.1254902, 1,
-0.4190316, -0.5604802, -3.370889, 0, 1, 0.1294118, 1,
-0.4189766, -0.2585517, -2.711647, 0, 1, 0.1372549, 1,
-0.4072416, -1.131652, -3.670849, 0, 1, 0.1411765, 1,
-0.4071993, 1.318388, -0.3114372, 0, 1, 0.1490196, 1,
-0.4057668, -1.191743, -2.743946, 0, 1, 0.1529412, 1,
-0.4046932, 0.7663183, -0.880583, 0, 1, 0.1607843, 1,
-0.4040733, 0.2137177, -0.9849829, 0, 1, 0.1647059, 1,
-0.403023, -0.382501, -3.124015, 0, 1, 0.172549, 1,
-0.4017729, -0.3041289, -4.003968, 0, 1, 0.1764706, 1,
-0.4004005, -1.037382, -2.244615, 0, 1, 0.1843137, 1,
-0.3958693, 0.7374761, 0.6347517, 0, 1, 0.1882353, 1,
-0.3902897, 0.3369128, -1.14518, 0, 1, 0.1960784, 1,
-0.3879333, -0.06481136, -0.8431321, 0, 1, 0.2039216, 1,
-0.3866611, 0.3154947, -2.149909, 0, 1, 0.2078431, 1,
-0.3858787, -0.5980507, -3.308159, 0, 1, 0.2156863, 1,
-0.378024, 0.2730782, -0.8462073, 0, 1, 0.2196078, 1,
-0.3770625, -0.2296945, -2.997567, 0, 1, 0.227451, 1,
-0.3754949, 0.8703161, 0.1077792, 0, 1, 0.2313726, 1,
-0.3754612, -3.793832, -2.433391, 0, 1, 0.2392157, 1,
-0.3715208, -0.3655869, -1.205642, 0, 1, 0.2431373, 1,
-0.3661588, -0.07925688, -0.2441897, 0, 1, 0.2509804, 1,
-0.3638202, -0.4236707, -4.442331, 0, 1, 0.254902, 1,
-0.3609988, -0.9732895, -4.046031, 0, 1, 0.2627451, 1,
-0.3585896, -0.8075467, -2.68208, 0, 1, 0.2666667, 1,
-0.3560523, 0.8669074, 0.4586965, 0, 1, 0.2745098, 1,
-0.3541951, -1.178923, -1.659252, 0, 1, 0.2784314, 1,
-0.3468044, 0.873961, -0.5092862, 0, 1, 0.2862745, 1,
-0.3462121, -0.3000354, -2.225649, 0, 1, 0.2901961, 1,
-0.3454992, -0.7375857, -2.417458, 0, 1, 0.2980392, 1,
-0.344997, 0.4538843, 0.1749515, 0, 1, 0.3058824, 1,
-0.3427044, 1.022838, 1.044126, 0, 1, 0.3098039, 1,
-0.3403343, 0.8347805, 0.5009928, 0, 1, 0.3176471, 1,
-0.3397206, -0.1018403, -0.6330937, 0, 1, 0.3215686, 1,
-0.338104, 0.7731342, -0.276143, 0, 1, 0.3294118, 1,
-0.3360834, -0.8118784, -3.598669, 0, 1, 0.3333333, 1,
-0.3322796, -0.1902072, -1.237827, 0, 1, 0.3411765, 1,
-0.330985, -0.4061748, -2.017291, 0, 1, 0.345098, 1,
-0.3263182, 0.4052377, -1.40652, 0, 1, 0.3529412, 1,
-0.3258696, -0.1256527, -1.156399, 0, 1, 0.3568628, 1,
-0.3255796, 1.934164, -0.838054, 0, 1, 0.3647059, 1,
-0.3250224, -1.830599, -4.451381, 0, 1, 0.3686275, 1,
-0.3222468, -1.461307, -2.703775, 0, 1, 0.3764706, 1,
-0.317981, 0.7009555, 1.631022, 0, 1, 0.3803922, 1,
-0.314118, 0.1145182, -1.670931, 0, 1, 0.3882353, 1,
-0.3038137, -1.253288, -2.192184, 0, 1, 0.3921569, 1,
-0.2994428, 1.225872, -0.2642574, 0, 1, 0.4, 1,
-0.2988344, -0.5308822, -1.501774, 0, 1, 0.4078431, 1,
-0.2983196, 0.7271738, -0.9836375, 0, 1, 0.4117647, 1,
-0.2979559, 3.239066, -1.123681, 0, 1, 0.4196078, 1,
-0.2949624, 0.8062239, -0.09402187, 0, 1, 0.4235294, 1,
-0.2920919, 0.8735082, -0.8678539, 0, 1, 0.4313726, 1,
-0.2906264, -1.804118, -2.039882, 0, 1, 0.4352941, 1,
-0.2903301, -0.1876603, -2.618513, 0, 1, 0.4431373, 1,
-0.2872294, -1.020742, -4.410931, 0, 1, 0.4470588, 1,
-0.280298, -0.04593125, -5.191755, 0, 1, 0.454902, 1,
-0.2788967, -0.0912922, -0.6611634, 0, 1, 0.4588235, 1,
-0.2756847, -0.5887898, -3.346082, 0, 1, 0.4666667, 1,
-0.2749887, 0.8068033, 2.281146, 0, 1, 0.4705882, 1,
-0.2729816, 1.089172, 1.630417, 0, 1, 0.4784314, 1,
-0.2709725, 0.572651, -0.9419561, 0, 1, 0.4823529, 1,
-0.2703826, 1.058793, 0.2685274, 0, 1, 0.4901961, 1,
-0.2673033, -1.118021, -1.943246, 0, 1, 0.4941176, 1,
-0.2672827, -0.4471304, -3.830207, 0, 1, 0.5019608, 1,
-0.2633197, 0.6861253, -0.3627982, 0, 1, 0.509804, 1,
-0.262828, 0.1151533, -0.7112778, 0, 1, 0.5137255, 1,
-0.2444142, 1.300321, -0.2008342, 0, 1, 0.5215687, 1,
-0.2398116, 0.824018, 0.2178155, 0, 1, 0.5254902, 1,
-0.2360583, -0.9334491, -3.810297, 0, 1, 0.5333334, 1,
-0.2318657, -0.9435466, -2.013676, 0, 1, 0.5372549, 1,
-0.2315641, 0.1583841, -1.156379, 0, 1, 0.5450981, 1,
-0.2194594, -0.1995044, -1.934805, 0, 1, 0.5490196, 1,
-0.2189939, 0.612254, -1.689005, 0, 1, 0.5568628, 1,
-0.2175729, 0.1919968, 0.3012737, 0, 1, 0.5607843, 1,
-0.2141595, 1.118149, 0.3143095, 0, 1, 0.5686275, 1,
-0.2118098, 2.05487, -1.686721, 0, 1, 0.572549, 1,
-0.211792, 0.7032207, -1.085052, 0, 1, 0.5803922, 1,
-0.2091304, -0.4952731, -2.889968, 0, 1, 0.5843138, 1,
-0.2079749, -1.205878, -2.532303, 0, 1, 0.5921569, 1,
-0.2068747, 0.2582019, -0.5086235, 0, 1, 0.5960785, 1,
-0.2050705, -0.1109217, -1.994529, 0, 1, 0.6039216, 1,
-0.2041861, -0.3916085, -2.793597, 0, 1, 0.6117647, 1,
-0.1925455, -1.630402, -3.067037, 0, 1, 0.6156863, 1,
-0.1917383, -2.192398, -3.599702, 0, 1, 0.6235294, 1,
-0.1892186, 1.249789, 1.004042, 0, 1, 0.627451, 1,
-0.1881806, 0.5271341, -1.742275, 0, 1, 0.6352941, 1,
-0.1831114, 0.3761583, 0.1307568, 0, 1, 0.6392157, 1,
-0.1798556, 0.03342844, -1.156292, 0, 1, 0.6470588, 1,
-0.1757145, -0.1366521, -2.245395, 0, 1, 0.6509804, 1,
-0.169495, 0.563594, -0.8686385, 0, 1, 0.6588235, 1,
-0.1680766, 0.8024504, -0.2214283, 0, 1, 0.6627451, 1,
-0.1664273, 0.8666554, -0.4948965, 0, 1, 0.6705883, 1,
-0.1620329, 0.5115432, 0.2535778, 0, 1, 0.6745098, 1,
-0.154966, -1.434014, -3.161661, 0, 1, 0.682353, 1,
-0.1520551, -0.0235347, -2.313088, 0, 1, 0.6862745, 1,
-0.1512958, 0.09115373, -0.06840075, 0, 1, 0.6941177, 1,
-0.1511904, 0.6399435, 0.2521284, 0, 1, 0.7019608, 1,
-0.1431049, 0.6952307, -2.249928, 0, 1, 0.7058824, 1,
-0.1382378, -1.710754, -4.547616, 0, 1, 0.7137255, 1,
-0.1347522, -0.118611, -1.244596, 0, 1, 0.7176471, 1,
-0.1335994, -1.481511, -3.396992, 0, 1, 0.7254902, 1,
-0.1324779, -0.4132092, -2.157616, 0, 1, 0.7294118, 1,
-0.1286486, 1.676735, 0.1675243, 0, 1, 0.7372549, 1,
-0.1251646, 1.268505, -0.9352018, 0, 1, 0.7411765, 1,
-0.1250523, 1.041691, -0.780928, 0, 1, 0.7490196, 1,
-0.1223034, -0.5474053, -2.868895, 0, 1, 0.7529412, 1,
-0.1207437, 1.938861, -0.847888, 0, 1, 0.7607843, 1,
-0.119579, -1.779351, -2.535678, 0, 1, 0.7647059, 1,
-0.117865, 0.4130917, -1.243958, 0, 1, 0.772549, 1,
-0.1146176, -0.6363394, -3.522915, 0, 1, 0.7764706, 1,
-0.1110112, -1.279069, -3.397953, 0, 1, 0.7843137, 1,
-0.1076113, 0.6348707, 0.6734394, 0, 1, 0.7882353, 1,
-0.1069627, -0.3242835, -3.085438, 0, 1, 0.7960784, 1,
-0.1054749, -0.0707892, -1.377946, 0, 1, 0.8039216, 1,
-0.105144, -0.4847254, -2.434519, 0, 1, 0.8078431, 1,
-0.1022569, -0.6440557, -4.089534, 0, 1, 0.8156863, 1,
-0.1003155, -1.257593, -4.270755, 0, 1, 0.8196079, 1,
-0.100243, 0.1067015, -0.4535003, 0, 1, 0.827451, 1,
-0.09546955, -0.6578529, -4.174563, 0, 1, 0.8313726, 1,
-0.0950965, 0.5099998, -2.08888, 0, 1, 0.8392157, 1,
-0.09294634, 0.7811646, -0.9545955, 0, 1, 0.8431373, 1,
-0.09134012, 0.6409302, 0.8265494, 0, 1, 0.8509804, 1,
-0.09091742, 1.142741, -0.6018938, 0, 1, 0.854902, 1,
-0.09019973, -0.7929746, -3.596316, 0, 1, 0.8627451, 1,
-0.0875392, 0.2714086, -0.9076034, 0, 1, 0.8666667, 1,
-0.08721144, 0.5968406, -1.430399, 0, 1, 0.8745098, 1,
-0.08664637, 1.628117, -4.120589, 0, 1, 0.8784314, 1,
-0.08634928, 0.7834459, -0.9562358, 0, 1, 0.8862745, 1,
-0.08615651, -0.0211844, -2.206559, 0, 1, 0.8901961, 1,
-0.08462334, -0.9095905, -2.567546, 0, 1, 0.8980392, 1,
-0.08237715, -1.38537, -1.644582, 0, 1, 0.9058824, 1,
-0.07610336, -0.9650252, -3.302024, 0, 1, 0.9098039, 1,
-0.07558213, 0.6156241, -0.8186447, 0, 1, 0.9176471, 1,
-0.07293375, -1.478069, -3.62615, 0, 1, 0.9215686, 1,
-0.07199821, 1.581952, -1.280784, 0, 1, 0.9294118, 1,
-0.06691585, -0.08214491, -1.725798, 0, 1, 0.9333333, 1,
-0.05970884, -2.064959, -3.047117, 0, 1, 0.9411765, 1,
-0.05185223, 0.6278018, -1.410997, 0, 1, 0.945098, 1,
-0.05134265, 0.1594871, -1.242647, 0, 1, 0.9529412, 1,
-0.04308492, -0.8402019, -3.205202, 0, 1, 0.9568627, 1,
-0.03932324, -0.3807819, -1.884108, 0, 1, 0.9647059, 1,
-0.03742519, 0.9126432, 0.3144941, 0, 1, 0.9686275, 1,
-0.03592236, 1.170005, 0.3728401, 0, 1, 0.9764706, 1,
-0.03455548, 1.526838, 1.208513, 0, 1, 0.9803922, 1,
-0.0290121, 0.7357355, 0.7453127, 0, 1, 0.9882353, 1,
-0.02886498, 0.6498668, -1.533726, 0, 1, 0.9921569, 1,
-0.02821652, 0.3331337, 1.785813, 0, 1, 1, 1,
-0.02788638, -1.466944, -3.115626, 0, 0.9921569, 1, 1,
-0.02421336, -0.03293688, -2.820447, 0, 0.9882353, 1, 1,
-0.02108883, 0.3993244, 0.7286234, 0, 0.9803922, 1, 1,
-0.02059387, -0.9637433, -1.476262, 0, 0.9764706, 1, 1,
-0.0189139, 1.055998, 0.4468979, 0, 0.9686275, 1, 1,
-0.01880978, 1.399079, -2.719419, 0, 0.9647059, 1, 1,
-0.0110893, 1.264706, -0.08173843, 0, 0.9568627, 1, 1,
-0.007608211, 0.9117552, -0.5389337, 0, 0.9529412, 1, 1,
-0.005686005, -0.3838283, -5.167208, 0, 0.945098, 1, 1,
-0.004449622, 0.239436, 1.68704, 0, 0.9411765, 1, 1,
0.001862913, 0.8667492, -0.02831566, 0, 0.9333333, 1, 1,
0.003845761, 0.7343435, 0.01860017, 0, 0.9294118, 1, 1,
0.005215527, -1.872988, 2.815232, 0, 0.9215686, 1, 1,
0.009080532, 0.7940165, 0.2442194, 0, 0.9176471, 1, 1,
0.01080291, -0.7662268, 2.921419, 0, 0.9098039, 1, 1,
0.01279233, 0.2202845, -0.8671017, 0, 0.9058824, 1, 1,
0.01566862, -2.354222, 4.009654, 0, 0.8980392, 1, 1,
0.01776873, -0.9056802, 3.777364, 0, 0.8901961, 1, 1,
0.0192883, 1.824759, 0.515083, 0, 0.8862745, 1, 1,
0.01982593, 0.9309401, -0.3077245, 0, 0.8784314, 1, 1,
0.02215715, 1.540264, 2.087236, 0, 0.8745098, 1, 1,
0.02249346, 0.5996749, -0.01594652, 0, 0.8666667, 1, 1,
0.02392264, 0.07052648, 0.1196671, 0, 0.8627451, 1, 1,
0.02992086, -1.558252, 3.105587, 0, 0.854902, 1, 1,
0.03374503, -1.243953, 3.804341, 0, 0.8509804, 1, 1,
0.03699703, -0.8939328, 4.228662, 0, 0.8431373, 1, 1,
0.03749109, -0.7049505, 3.077831, 0, 0.8392157, 1, 1,
0.03765622, 1.076032, 0.5641055, 0, 0.8313726, 1, 1,
0.03779138, 0.02130699, -0.08166187, 0, 0.827451, 1, 1,
0.03934145, -0.7009579, 3.099289, 0, 0.8196079, 1, 1,
0.04713214, -1.308144, 2.026325, 0, 0.8156863, 1, 1,
0.04781248, 0.9358199, -1.340803, 0, 0.8078431, 1, 1,
0.05222177, 0.8550733, 0.9207814, 0, 0.8039216, 1, 1,
0.06068781, 1.869278, 0.6605757, 0, 0.7960784, 1, 1,
0.06221333, 0.7154919, 0.3081654, 0, 0.7882353, 1, 1,
0.06292157, -0.3707101, 1.889092, 0, 0.7843137, 1, 1,
0.07170899, -1.423087, 5.216599, 0, 0.7764706, 1, 1,
0.07403006, -0.6122702, 2.845273, 0, 0.772549, 1, 1,
0.07416428, 0.4912605, 1.967017, 0, 0.7647059, 1, 1,
0.07765057, -0.405957, 0.6183347, 0, 0.7607843, 1, 1,
0.0783848, 1.323041, 1.618852, 0, 0.7529412, 1, 1,
0.0799, -0.7849767, 1.941658, 0, 0.7490196, 1, 1,
0.08235625, 1.170449, 2.359219, 0, 0.7411765, 1, 1,
0.08514392, -0.8860002, 2.101566, 0, 0.7372549, 1, 1,
0.08690587, -1.094265, 1.561809, 0, 0.7294118, 1, 1,
0.08780643, 0.8411052, -0.456364, 0, 0.7254902, 1, 1,
0.0892645, 0.7325383, -0.8098869, 0, 0.7176471, 1, 1,
0.08993467, 1.415731, 0.3651815, 0, 0.7137255, 1, 1,
0.09273085, 0.3178048, -0.7872494, 0, 0.7058824, 1, 1,
0.096457, 1.475406, -0.05630494, 0, 0.6980392, 1, 1,
0.09862797, 0.4831422, 0.1911271, 0, 0.6941177, 1, 1,
0.09945986, 1.341844, 1.434792, 0, 0.6862745, 1, 1,
0.1022389, 0.07697724, -0.8884811, 0, 0.682353, 1, 1,
0.1048598, 0.4940926, 0.2303311, 0, 0.6745098, 1, 1,
0.1050354, 1.806865, 0.6540592, 0, 0.6705883, 1, 1,
0.1054017, -0.2092199, 3.676271, 0, 0.6627451, 1, 1,
0.1059379, 0.7285936, 0.1965496, 0, 0.6588235, 1, 1,
0.1082261, 0.6986563, -0.9661378, 0, 0.6509804, 1, 1,
0.1141718, -0.7423004, 2.863659, 0, 0.6470588, 1, 1,
0.1167709, 1.535863, -1.19345, 0, 0.6392157, 1, 1,
0.1230593, -1.4713, 1.666687, 0, 0.6352941, 1, 1,
0.1240158, 0.2906569, 1.584485, 0, 0.627451, 1, 1,
0.1243429, 0.1676507, 0.3254292, 0, 0.6235294, 1, 1,
0.1287392, 0.2843415, 0.3188731, 0, 0.6156863, 1, 1,
0.1288008, 1.145276, -0.6199799, 0, 0.6117647, 1, 1,
0.1299937, -0.1802659, 1.984375, 0, 0.6039216, 1, 1,
0.1444172, -0.9564678, 0.04323392, 0, 0.5960785, 1, 1,
0.1463618, -1.015517, 3.741433, 0, 0.5921569, 1, 1,
0.146905, -1.271548, 3.048619, 0, 0.5843138, 1, 1,
0.148075, -1.514115, 3.00772, 0, 0.5803922, 1, 1,
0.1552407, 1.405136, 1.528816, 0, 0.572549, 1, 1,
0.1679505, -0.6932078, 4.384339, 0, 0.5686275, 1, 1,
0.1699429, 1.024714, 0.4661196, 0, 0.5607843, 1, 1,
0.1700419, 0.5399193, 1.532162, 0, 0.5568628, 1, 1,
0.171327, -1.215719, 3.910436, 0, 0.5490196, 1, 1,
0.1736883, 0.7862444, 0.2228464, 0, 0.5450981, 1, 1,
0.1747372, -0.09080469, 2.117007, 0, 0.5372549, 1, 1,
0.1748923, 0.04179836, 1.566025, 0, 0.5333334, 1, 1,
0.176886, -0.3569774, 3.68717, 0, 0.5254902, 1, 1,
0.1776651, 1.213506, -1.781536, 0, 0.5215687, 1, 1,
0.1851255, -0.758121, 1.611786, 0, 0.5137255, 1, 1,
0.1875387, 0.2439912, 2.202265, 0, 0.509804, 1, 1,
0.1875953, -1.892608, 3.226419, 0, 0.5019608, 1, 1,
0.1904324, -0.7530364, 2.957075, 0, 0.4941176, 1, 1,
0.1915979, 1.646404, 0.1832334, 0, 0.4901961, 1, 1,
0.1957285, 0.4930028, -0.3175991, 0, 0.4823529, 1, 1,
0.1971949, -0.5291284, 4.447522, 0, 0.4784314, 1, 1,
0.1981366, 1.128958, -1.108879, 0, 0.4705882, 1, 1,
0.204142, 0.820709, 1.372131, 0, 0.4666667, 1, 1,
0.2066749, 1.643079, -1.088176, 0, 0.4588235, 1, 1,
0.2109106, 1.120516, 1.074147, 0, 0.454902, 1, 1,
0.2109829, 0.5852775, -0.2457964, 0, 0.4470588, 1, 1,
0.2124216, -1.954894, 4.417569, 0, 0.4431373, 1, 1,
0.2138369, 1.69786, 0.1274683, 0, 0.4352941, 1, 1,
0.216672, -0.09831341, 1.464144, 0, 0.4313726, 1, 1,
0.2171666, 1.073567, 0.05599361, 0, 0.4235294, 1, 1,
0.2176245, 1.490332, -1.301031, 0, 0.4196078, 1, 1,
0.219955, 0.8640809, -0.966226, 0, 0.4117647, 1, 1,
0.2200643, 0.6464937, 0.936191, 0, 0.4078431, 1, 1,
0.2207129, -0.8646156, 1.764634, 0, 0.4, 1, 1,
0.2217218, 0.4770297, 0.570076, 0, 0.3921569, 1, 1,
0.223713, -1.215021, 3.036506, 0, 0.3882353, 1, 1,
0.2245116, 1.166025, 1.205042, 0, 0.3803922, 1, 1,
0.2254372, -0.4477113, 1.481431, 0, 0.3764706, 1, 1,
0.2263411, -0.2172091, -0.02362951, 0, 0.3686275, 1, 1,
0.228467, -0.5658047, 2.686194, 0, 0.3647059, 1, 1,
0.2295706, -1.040904, 3.672012, 0, 0.3568628, 1, 1,
0.236884, -0.9035831, 2.303905, 0, 0.3529412, 1, 1,
0.237291, -0.2421483, 3.285254, 0, 0.345098, 1, 1,
0.2374064, 0.4014239, -0.6161934, 0, 0.3411765, 1, 1,
0.2374804, -0.4761639, 2.913206, 0, 0.3333333, 1, 1,
0.2389572, -0.2797534, 3.424002, 0, 0.3294118, 1, 1,
0.2424673, 0.8004462, 0.8350016, 0, 0.3215686, 1, 1,
0.2431307, 0.2089574, -0.000886991, 0, 0.3176471, 1, 1,
0.2458361, 0.1527558, 0.6655744, 0, 0.3098039, 1, 1,
0.2478141, -2.577, 1.916041, 0, 0.3058824, 1, 1,
0.2482643, -0.6105139, 3.651827, 0, 0.2980392, 1, 1,
0.2484712, -0.5048018, 3.901649, 0, 0.2901961, 1, 1,
0.2492262, 0.3480058, 0.426662, 0, 0.2862745, 1, 1,
0.2492776, -0.6495512, 4.837499, 0, 0.2784314, 1, 1,
0.2519112, 0.5700554, -0.9672221, 0, 0.2745098, 1, 1,
0.2549364, -0.735785, 3.059686, 0, 0.2666667, 1, 1,
0.2596103, 1.537884, 1.604623, 0, 0.2627451, 1, 1,
0.2617191, -0.8705219, 1.865903, 0, 0.254902, 1, 1,
0.2624385, 0.2819893, -0.8881745, 0, 0.2509804, 1, 1,
0.2631672, -0.16481, 1.568659, 0, 0.2431373, 1, 1,
0.2642907, -0.6586571, 1.000952, 0, 0.2392157, 1, 1,
0.2659782, 0.1704126, 2.418299, 0, 0.2313726, 1, 1,
0.269429, 0.734709, -1.104125, 0, 0.227451, 1, 1,
0.2715518, -1.328619, 4.317684, 0, 0.2196078, 1, 1,
0.2744762, -1.975806, 2.67666, 0, 0.2156863, 1, 1,
0.2747847, -0.05240782, 2.187213, 0, 0.2078431, 1, 1,
0.2813199, 0.6593626, 1.298596, 0, 0.2039216, 1, 1,
0.2840919, -0.5215423, 1.581553, 0, 0.1960784, 1, 1,
0.2842118, -0.6458411, 0.4834697, 0, 0.1882353, 1, 1,
0.2870433, 0.4435453, 0.2616679, 0, 0.1843137, 1, 1,
0.288221, 0.7528203, 0.520649, 0, 0.1764706, 1, 1,
0.2891128, -1.351551, 3.411416, 0, 0.172549, 1, 1,
0.2899658, -0.9843288, 2.75703, 0, 0.1647059, 1, 1,
0.2955487, 0.7958952, 0.3352139, 0, 0.1607843, 1, 1,
0.3001208, 1.880787, 0.6891602, 0, 0.1529412, 1, 1,
0.3032012, 0.7021109, 0.925337, 0, 0.1490196, 1, 1,
0.3158502, 1.812626, -0.03239716, 0, 0.1411765, 1, 1,
0.3167805, -0.7573069, 2.714097, 0, 0.1372549, 1, 1,
0.3190115, -0.172971, 3.53386, 0, 0.1294118, 1, 1,
0.3213291, 1.526431, -0.7134289, 0, 0.1254902, 1, 1,
0.3215537, -0.7888859, 4.106538, 0, 0.1176471, 1, 1,
0.3236134, 0.211897, 2.647876, 0, 0.1137255, 1, 1,
0.3238308, -0.8133247, 1.033289, 0, 0.1058824, 1, 1,
0.3245802, 0.5845789, -0.5079983, 0, 0.09803922, 1, 1,
0.3291348, -1.111733, 2.638996, 0, 0.09411765, 1, 1,
0.3296912, -1.419434, 2.335806, 0, 0.08627451, 1, 1,
0.329829, 1.685588, 0.9787659, 0, 0.08235294, 1, 1,
0.3302453, 1.473227, 0.443148, 0, 0.07450981, 1, 1,
0.3304669, -2.225513, 3.098603, 0, 0.07058824, 1, 1,
0.3351941, 0.9444591, -1.126088, 0, 0.0627451, 1, 1,
0.3374053, -1.62992, 1.777279, 0, 0.05882353, 1, 1,
0.3446454, 1.773177, -0.3734212, 0, 0.05098039, 1, 1,
0.3518152, 0.7018967, 0.4937418, 0, 0.04705882, 1, 1,
0.3533852, -0.5872934, 3.056499, 0, 0.03921569, 1, 1,
0.3545597, 0.8316983, -2.46117, 0, 0.03529412, 1, 1,
0.3584543, -0.3651119, 2.492187, 0, 0.02745098, 1, 1,
0.3658084, -0.08866242, 0.7536514, 0, 0.02352941, 1, 1,
0.3677443, 0.3828334, 0.549651, 0, 0.01568628, 1, 1,
0.3704099, 0.005096798, 2.377238, 0, 0.01176471, 1, 1,
0.3712969, -0.4260427, 4.347938, 0, 0.003921569, 1, 1,
0.3761256, 0.3050442, 1.480066, 0.003921569, 0, 1, 1,
0.3856454, 0.8762593, 0.2485621, 0.007843138, 0, 1, 1,
0.3857827, 0.298057, 2.142973, 0.01568628, 0, 1, 1,
0.3859589, 0.09932613, 0.3504125, 0.01960784, 0, 1, 1,
0.389001, 0.09100848, 1.35358, 0.02745098, 0, 1, 1,
0.3938197, -1.422228, 3.636724, 0.03137255, 0, 1, 1,
0.39783, 0.6509396, -0.1535266, 0.03921569, 0, 1, 1,
0.3980682, 0.2242952, 1.078673, 0.04313726, 0, 1, 1,
0.3996135, -1.388394, 3.055268, 0.05098039, 0, 1, 1,
0.400712, -0.9976986, 0.5741119, 0.05490196, 0, 1, 1,
0.4081049, 1.178058, 0.5690831, 0.0627451, 0, 1, 1,
0.409251, 0.3213499, 1.008159, 0.06666667, 0, 1, 1,
0.4139146, -2.229701, 3.082555, 0.07450981, 0, 1, 1,
0.422688, 0.1887012, 0.5759437, 0.07843138, 0, 1, 1,
0.4239308, 0.8671037, -0.9919924, 0.08627451, 0, 1, 1,
0.4242025, 0.1681055, 1.925198, 0.09019608, 0, 1, 1,
0.4244734, -1.330554, 1.928489, 0.09803922, 0, 1, 1,
0.4263952, -1.27128, 4.262577, 0.1058824, 0, 1, 1,
0.4324873, 0.5706658, -1.078689, 0.1098039, 0, 1, 1,
0.4337058, 0.8377517, 0.126432, 0.1176471, 0, 1, 1,
0.4394101, 1.498661, 0.6842351, 0.1215686, 0, 1, 1,
0.4408376, 0.8612753, 1.337253, 0.1294118, 0, 1, 1,
0.4409946, -0.2117495, 2.63689, 0.1333333, 0, 1, 1,
0.4415421, 0.8787017, 0.9397467, 0.1411765, 0, 1, 1,
0.4436577, 2.383479, -0.5563614, 0.145098, 0, 1, 1,
0.4444264, 0.6731821, 1.038726, 0.1529412, 0, 1, 1,
0.4538888, 0.0768506, 2.333604, 0.1568628, 0, 1, 1,
0.4607903, -0.8296795, 2.524765, 0.1647059, 0, 1, 1,
0.4694761, -0.9400617, 2.583816, 0.1686275, 0, 1, 1,
0.4712128, -1.097063, 2.717472, 0.1764706, 0, 1, 1,
0.4714799, 0.7393593, -0.3681956, 0.1803922, 0, 1, 1,
0.4744018, 1.338828, 1.792501, 0.1882353, 0, 1, 1,
0.4773331, 1.362504, -1.642694, 0.1921569, 0, 1, 1,
0.4778136, -0.02998409, 2.722615, 0.2, 0, 1, 1,
0.4793518, 0.4296769, 3.911022, 0.2078431, 0, 1, 1,
0.4820177, 0.3120199, 0.7803869, 0.2117647, 0, 1, 1,
0.4826469, 0.7171125, 1.049251, 0.2196078, 0, 1, 1,
0.4891188, -0.2151947, 2.619077, 0.2235294, 0, 1, 1,
0.4900219, -0.06889252, 0.4142246, 0.2313726, 0, 1, 1,
0.4966016, 1.02237, 1.846385, 0.2352941, 0, 1, 1,
0.501085, -0.9715973, 1.766907, 0.2431373, 0, 1, 1,
0.5101945, -0.9243073, 3.151004, 0.2470588, 0, 1, 1,
0.5124046, -1.677939, 2.637808, 0.254902, 0, 1, 1,
0.5144927, -2.530124, 0.6873018, 0.2588235, 0, 1, 1,
0.5198123, -0.9188238, 3.155641, 0.2666667, 0, 1, 1,
0.5254145, 1.097831, 2.207139, 0.2705882, 0, 1, 1,
0.5265368, 0.7324095, 0.01081924, 0.2784314, 0, 1, 1,
0.5273422, 0.7635959, -0.621173, 0.282353, 0, 1, 1,
0.529952, 1.578777, -0.06883294, 0.2901961, 0, 1, 1,
0.531985, -0.2365102, 3.135741, 0.2941177, 0, 1, 1,
0.5432221, 0.240278, 1.527603, 0.3019608, 0, 1, 1,
0.5470771, -1.260007, 3.552021, 0.3098039, 0, 1, 1,
0.5471974, -0.4273522, 2.096372, 0.3137255, 0, 1, 1,
0.549772, 0.2524242, 1.106808, 0.3215686, 0, 1, 1,
0.5501298, 0.937454, 0.5767203, 0.3254902, 0, 1, 1,
0.5607726, 1.610863, 1.359697, 0.3333333, 0, 1, 1,
0.5623114, 1.512348, -1.080658, 0.3372549, 0, 1, 1,
0.5628972, 1.05431, 1.159835, 0.345098, 0, 1, 1,
0.5709876, -0.1810261, 2.069158, 0.3490196, 0, 1, 1,
0.5712448, 1.732078, -0.6494673, 0.3568628, 0, 1, 1,
0.5729219, 1.350013, 0.842159, 0.3607843, 0, 1, 1,
0.576176, -0.6076134, 3.670104, 0.3686275, 0, 1, 1,
0.5808376, 0.7361706, 1.554227, 0.372549, 0, 1, 1,
0.5810172, 0.5157828, 0.7190237, 0.3803922, 0, 1, 1,
0.5865151, -1.046984, 2.031143, 0.3843137, 0, 1, 1,
0.5903355, -1.214565, 2.257262, 0.3921569, 0, 1, 1,
0.5904295, -1.193949, 2.451585, 0.3960784, 0, 1, 1,
0.5909925, -0.3798283, 3.09816, 0.4039216, 0, 1, 1,
0.5997459, -1.290711, 3.303329, 0.4117647, 0, 1, 1,
0.607876, -0.7632369, 3.065305, 0.4156863, 0, 1, 1,
0.61082, 0.7879663, 0.165775, 0.4235294, 0, 1, 1,
0.6112071, 1.292421, -1.022395, 0.427451, 0, 1, 1,
0.6136743, 1.003001, -0.8750175, 0.4352941, 0, 1, 1,
0.6188256, -0.3176293, 1.072686, 0.4392157, 0, 1, 1,
0.6192026, -0.2552677, 0.9914111, 0.4470588, 0, 1, 1,
0.6248683, 0.2125061, 2.132921, 0.4509804, 0, 1, 1,
0.6257254, -0.7330464, 3.493828, 0.4588235, 0, 1, 1,
0.6315435, -0.08853829, 1.493462, 0.4627451, 0, 1, 1,
0.63422, 1.238054, 1.709245, 0.4705882, 0, 1, 1,
0.6352993, -1.799344, 1.527402, 0.4745098, 0, 1, 1,
0.6358313, 1.479717, 2.133001, 0.4823529, 0, 1, 1,
0.6360681, -0.7976347, 2.128537, 0.4862745, 0, 1, 1,
0.637446, -1.453131, 3.558934, 0.4941176, 0, 1, 1,
0.6480236, 1.495851, 1.678149, 0.5019608, 0, 1, 1,
0.6480712, 0.3415124, 0.1511414, 0.5058824, 0, 1, 1,
0.654918, -1.805469, 3.334936, 0.5137255, 0, 1, 1,
0.6550713, 0.4462496, 1.131169, 0.5176471, 0, 1, 1,
0.6596484, -0.8122534, 4.206954, 0.5254902, 0, 1, 1,
0.6603832, 0.1408024, 2.609762, 0.5294118, 0, 1, 1,
0.6669411, 0.3873604, -0.976781, 0.5372549, 0, 1, 1,
0.6683217, -0.101139, 1.866064, 0.5411765, 0, 1, 1,
0.6702049, -0.6734459, 0.9828523, 0.5490196, 0, 1, 1,
0.6744209, -0.8610812, 1.744483, 0.5529412, 0, 1, 1,
0.6750751, 1.023617, -0.4768744, 0.5607843, 0, 1, 1,
0.6760288, 0.6084114, 0.2077934, 0.5647059, 0, 1, 1,
0.6801023, 0.9971284, -0.6529648, 0.572549, 0, 1, 1,
0.6808053, 0.3324309, 1.918493, 0.5764706, 0, 1, 1,
0.6864054, -0.9727467, 3.597332, 0.5843138, 0, 1, 1,
0.691209, -1.190407, 1.98226, 0.5882353, 0, 1, 1,
0.6932747, -0.2554041, 1.153584, 0.5960785, 0, 1, 1,
0.7004789, 0.737391, -0.3504857, 0.6039216, 0, 1, 1,
0.7006761, -0.3169033, 3.707315, 0.6078432, 0, 1, 1,
0.7012513, -0.01625784, 1.842952, 0.6156863, 0, 1, 1,
0.7033631, 1.231547, -0.2767199, 0.6196079, 0, 1, 1,
0.7055274, -0.2985286, 1.497128, 0.627451, 0, 1, 1,
0.7100016, 0.5505424, 1.878721, 0.6313726, 0, 1, 1,
0.7107455, -1.841805, 1.680786, 0.6392157, 0, 1, 1,
0.7171928, 0.7360485, 0.3369291, 0.6431373, 0, 1, 1,
0.7223967, 1.397538, 1.068478, 0.6509804, 0, 1, 1,
0.7244453, -0.5877127, 1.877058, 0.654902, 0, 1, 1,
0.7293209, -0.9382935, 2.22142, 0.6627451, 0, 1, 1,
0.7427464, 1.539133, 0.8672539, 0.6666667, 0, 1, 1,
0.7446462, -0.01727667, 2.437492, 0.6745098, 0, 1, 1,
0.7531532, 0.8745427, -0.4402357, 0.6784314, 0, 1, 1,
0.7583821, -0.4030651, 0.4802852, 0.6862745, 0, 1, 1,
0.7590486, 0.4198202, 0.3973288, 0.6901961, 0, 1, 1,
0.7600624, -0.3289703, 1.387855, 0.6980392, 0, 1, 1,
0.7629256, 0.4420269, 0.06186959, 0.7058824, 0, 1, 1,
0.7654901, -1.62142, 2.373243, 0.7098039, 0, 1, 1,
0.7721623, -0.2577178, 1.849285, 0.7176471, 0, 1, 1,
0.777201, -0.7556715, 2.032905, 0.7215686, 0, 1, 1,
0.7843491, 0.5331533, -0.1052803, 0.7294118, 0, 1, 1,
0.8002999, -0.6949414, 1.768826, 0.7333333, 0, 1, 1,
0.8022931, 0.2883721, 1.272036, 0.7411765, 0, 1, 1,
0.8064497, -1.602297, 1.581032, 0.7450981, 0, 1, 1,
0.8069326, -0.5442517, 1.774588, 0.7529412, 0, 1, 1,
0.8111924, -0.1349481, 5.059008, 0.7568628, 0, 1, 1,
0.8147777, 0.6750315, 0.8719302, 0.7647059, 0, 1, 1,
0.8159369, -0.4963704, 1.824795, 0.7686275, 0, 1, 1,
0.8163113, 0.6323923, 0.1972422, 0.7764706, 0, 1, 1,
0.8173114, -1.477419, 2.001185, 0.7803922, 0, 1, 1,
0.8174511, 0.08631819, 1.485499, 0.7882353, 0, 1, 1,
0.8197529, 0.2605577, -1.115757, 0.7921569, 0, 1, 1,
0.8201185, -0.1702529, 2.26738, 0.8, 0, 1, 1,
0.8235734, 1.083976, 0.2088853, 0.8078431, 0, 1, 1,
0.8416471, 0.01864167, 3.255968, 0.8117647, 0, 1, 1,
0.8437889, 0.2852368, 1.18133, 0.8196079, 0, 1, 1,
0.8471879, 0.8049739, -0.35992, 0.8235294, 0, 1, 1,
0.8489552, 0.9048982, -0.9234298, 0.8313726, 0, 1, 1,
0.8542496, -2.063255, 2.3522, 0.8352941, 0, 1, 1,
0.8566051, -0.7921311, 0.8455676, 0.8431373, 0, 1, 1,
0.8675052, -0.7919537, 0.9682422, 0.8470588, 0, 1, 1,
0.8821189, -0.6495022, 3.421354, 0.854902, 0, 1, 1,
0.8871992, -2.904193, 4.538005, 0.8588235, 0, 1, 1,
0.8886583, -0.01570035, 1.805481, 0.8666667, 0, 1, 1,
0.8902895, -1.379714, 1.556195, 0.8705882, 0, 1, 1,
0.9016502, -1.04794, 2.84606, 0.8784314, 0, 1, 1,
0.9064886, -0.2471179, -0.2359192, 0.8823529, 0, 1, 1,
0.9119859, -1.445826, 1.365371, 0.8901961, 0, 1, 1,
0.9134817, -1.376323, 2.228138, 0.8941177, 0, 1, 1,
0.9200281, 1.149552, -0.2351087, 0.9019608, 0, 1, 1,
0.9204039, 0.3109573, 1.65845, 0.9098039, 0, 1, 1,
0.925954, -0.3712994, 1.004649, 0.9137255, 0, 1, 1,
0.9278447, -0.4241195, 1.411451, 0.9215686, 0, 1, 1,
0.9326399, -0.7158692, 3.466285, 0.9254902, 0, 1, 1,
0.9349348, 0.6282495, 0.08318775, 0.9333333, 0, 1, 1,
0.93707, 0.9107552, 2.401124, 0.9372549, 0, 1, 1,
0.937816, -1.000088, 2.651084, 0.945098, 0, 1, 1,
0.9401264, -0.2261747, 3.263946, 0.9490196, 0, 1, 1,
0.9469727, 0.01517869, 2.224966, 0.9568627, 0, 1, 1,
0.9743906, 0.4920082, 2.41137, 0.9607843, 0, 1, 1,
0.9758471, -1.019099, 2.697812, 0.9686275, 0, 1, 1,
0.9848133, 0.2666891, 1.071126, 0.972549, 0, 1, 1,
0.9862854, 0.2389093, 1.206999, 0.9803922, 0, 1, 1,
0.9867346, 2.130338, 0.3620727, 0.9843137, 0, 1, 1,
0.9881235, 0.2865921, 1.915479, 0.9921569, 0, 1, 1,
0.9884919, 0.5226626, 1.012645, 0.9960784, 0, 1, 1,
0.9913649, 0.4987199, 0.1219526, 1, 0, 0.9960784, 1,
0.9962711, 1.603861, 1.926348, 1, 0, 0.9882353, 1,
1.004069, 0.9361282, 1.641389, 1, 0, 0.9843137, 1,
1.005556, -1.469357, 3.722708, 1, 0, 0.9764706, 1,
1.017753, 0.3694374, 1.015646, 1, 0, 0.972549, 1,
1.022328, -0.528971, 1.069886, 1, 0, 0.9647059, 1,
1.030634, -0.09523728, 4.35294, 1, 0, 0.9607843, 1,
1.032816, -0.645761, 2.787591, 1, 0, 0.9529412, 1,
1.032999, 1.279066, 1.110659, 1, 0, 0.9490196, 1,
1.036458, 0.8000911, 0.8675983, 1, 0, 0.9411765, 1,
1.038701, 1.064557, -0.4161222, 1, 0, 0.9372549, 1,
1.048448, -0.6189494, 1.464094, 1, 0, 0.9294118, 1,
1.04993, -0.9576688, 0.9338111, 1, 0, 0.9254902, 1,
1.051064, -0.4180373, 1.275833, 1, 0, 0.9176471, 1,
1.056023, 0.6779664, 0.7923331, 1, 0, 0.9137255, 1,
1.058193, -0.9367094, 1.245512, 1, 0, 0.9058824, 1,
1.058201, -0.5480525, 2.48192, 1, 0, 0.9019608, 1,
1.059837, 1.126887, -0.7249864, 1, 0, 0.8941177, 1,
1.07937, -0.4442106, 1.649233, 1, 0, 0.8862745, 1,
1.080991, -0.2105269, 1.596386, 1, 0, 0.8823529, 1,
1.082238, 0.6881589, 0.6122218, 1, 0, 0.8745098, 1,
1.083563, 0.8460373, 0.3049634, 1, 0, 0.8705882, 1,
1.092663, -0.3322261, 3.952387, 1, 0, 0.8627451, 1,
1.093099, -1.506429, 1.29401, 1, 0, 0.8588235, 1,
1.094262, 0.4257923, 2.499993, 1, 0, 0.8509804, 1,
1.100196, -1.046038, 2.577133, 1, 0, 0.8470588, 1,
1.102469, -0.7944782, 2.188846, 1, 0, 0.8392157, 1,
1.10503, -1.035008, 2.14754, 1, 0, 0.8352941, 1,
1.111958, -0.5849979, 1.349984, 1, 0, 0.827451, 1,
1.117239, 1.288256, 2.352615, 1, 0, 0.8235294, 1,
1.117272, -0.8032092, 1.167416, 1, 0, 0.8156863, 1,
1.121848, 1.592908, 1.508555, 1, 0, 0.8117647, 1,
1.122561, 1.46056, 0.9473483, 1, 0, 0.8039216, 1,
1.127726, -0.793714, 2.875082, 1, 0, 0.7960784, 1,
1.128695, -0.1138391, 0.4669323, 1, 0, 0.7921569, 1,
1.130244, -0.32015, 2.425694, 1, 0, 0.7843137, 1,
1.138454, -0.1690391, 0.5503001, 1, 0, 0.7803922, 1,
1.140306, -0.9393734, 4.534178, 1, 0, 0.772549, 1,
1.143749, 0.4041426, 1.815361, 1, 0, 0.7686275, 1,
1.146821, -0.5838106, 3.08977, 1, 0, 0.7607843, 1,
1.147334, -0.7564071, 3.212883, 1, 0, 0.7568628, 1,
1.147393, 1.237908, -0.8728179, 1, 0, 0.7490196, 1,
1.152055, -0.5166348, 0.3640555, 1, 0, 0.7450981, 1,
1.154927, 0.2595317, 0.7169118, 1, 0, 0.7372549, 1,
1.16361, 0.5689121, 0.04831632, 1, 0, 0.7333333, 1,
1.178782, 0.4595433, 0.792529, 1, 0, 0.7254902, 1,
1.18752, 1.163835, 0.4618758, 1, 0, 0.7215686, 1,
1.193033, 0.1754619, 2.430632, 1, 0, 0.7137255, 1,
1.202953, -0.3434518, 3.038454, 1, 0, 0.7098039, 1,
1.206767, -0.5112276, 0.4745466, 1, 0, 0.7019608, 1,
1.209588, -0.1173794, 0.7235355, 1, 0, 0.6941177, 1,
1.216477, 0.02118473, -0.178853, 1, 0, 0.6901961, 1,
1.217885, -1.086576, 2.819813, 1, 0, 0.682353, 1,
1.220129, 1.07647, -0.3497184, 1, 0, 0.6784314, 1,
1.224468, 1.631861, 1.804896, 1, 0, 0.6705883, 1,
1.225945, -0.3706124, 2.678989, 1, 0, 0.6666667, 1,
1.226097, 0.07072333, 3.543885, 1, 0, 0.6588235, 1,
1.226321, 1.7305, -0.6086359, 1, 0, 0.654902, 1,
1.228587, 2.406857, 0.06793325, 1, 0, 0.6470588, 1,
1.234872, -0.05474102, 1.706265, 1, 0, 0.6431373, 1,
1.259903, -2.184391, 5.287246, 1, 0, 0.6352941, 1,
1.260335, 0.4945716, 1.069984, 1, 0, 0.6313726, 1,
1.264307, -0.009457992, 1.769002, 1, 0, 0.6235294, 1,
1.275677, -1.893967, 1.99565, 1, 0, 0.6196079, 1,
1.287991, 1.134868, -0.1220182, 1, 0, 0.6117647, 1,
1.290951, 0.1319138, 0.8664281, 1, 0, 0.6078432, 1,
1.292255, 0.2719722, 2.833436, 1, 0, 0.6, 1,
1.293506, 0.9309907, -0.4079782, 1, 0, 0.5921569, 1,
1.294, -0.2335937, 0.8524035, 1, 0, 0.5882353, 1,
1.297452, 0.07747758, 1.26724, 1, 0, 0.5803922, 1,
1.299162, -0.5968838, 1.212994, 1, 0, 0.5764706, 1,
1.319129, 1.112833, 0.5472133, 1, 0, 0.5686275, 1,
1.331895, -0.03320216, 1.106405, 1, 0, 0.5647059, 1,
1.34086, 0.2835265, 0.4294209, 1, 0, 0.5568628, 1,
1.366292, -1.251858, 3.074564, 1, 0, 0.5529412, 1,
1.373442, -0.07357003, 0.8264145, 1, 0, 0.5450981, 1,
1.375736, -1.524618, 3.42959, 1, 0, 0.5411765, 1,
1.382024, 0.4342384, 2.17887, 1, 0, 0.5333334, 1,
1.382808, 0.280607, 2.617692, 1, 0, 0.5294118, 1,
1.382963, -0.2592046, 1.636268, 1, 0, 0.5215687, 1,
1.386351, -0.8037807, 2.175688, 1, 0, 0.5176471, 1,
1.392727, 1.039764, 1.626101, 1, 0, 0.509804, 1,
1.403633, -1.176264, 4.313499, 1, 0, 0.5058824, 1,
1.404736, -0.9432918, 2.367355, 1, 0, 0.4980392, 1,
1.411901, -0.1493832, 1.174949, 1, 0, 0.4901961, 1,
1.418138, -0.5121412, 3.608796, 1, 0, 0.4862745, 1,
1.419606, 0.8450702, 1.412371, 1, 0, 0.4784314, 1,
1.419631, -0.4918872, 1.376822, 1, 0, 0.4745098, 1,
1.423645, 1.26457, -0.2583194, 1, 0, 0.4666667, 1,
1.426507, 0.745899, 1.026283, 1, 0, 0.4627451, 1,
1.440272, -1.554068, 3.334652, 1, 0, 0.454902, 1,
1.441144, 0.1934481, 0.8082459, 1, 0, 0.4509804, 1,
1.465398, 0.7066805, 0.6911026, 1, 0, 0.4431373, 1,
1.467423, 0.4550012, 0.3321126, 1, 0, 0.4392157, 1,
1.471763, 0.5263277, 1.543251, 1, 0, 0.4313726, 1,
1.476067, -0.3724348, 2.622548, 1, 0, 0.427451, 1,
1.482813, -0.609157, 2.728172, 1, 0, 0.4196078, 1,
1.483876, 0.536169, 0.8096142, 1, 0, 0.4156863, 1,
1.489815, 0.8685331, 2.047396, 1, 0, 0.4078431, 1,
1.491978, -0.5113785, 0.9130126, 1, 0, 0.4039216, 1,
1.501951, -0.9278077, 1.711434, 1, 0, 0.3960784, 1,
1.504207, -0.03953483, 3.067369, 1, 0, 0.3882353, 1,
1.505261, 0.6543339, 0.7178217, 1, 0, 0.3843137, 1,
1.505914, 0.2335139, 1.147406, 1, 0, 0.3764706, 1,
1.516495, -0.4573809, -0.4219889, 1, 0, 0.372549, 1,
1.521284, -0.7687404, 2.746362, 1, 0, 0.3647059, 1,
1.523702, -1.437338, 2.103689, 1, 0, 0.3607843, 1,
1.541649, -0.3288645, 0.7345163, 1, 0, 0.3529412, 1,
1.55027, 2.662824, 2.457699, 1, 0, 0.3490196, 1,
1.553268, -0.3338251, 3.610364, 1, 0, 0.3411765, 1,
1.589492, -0.04134331, 1.175515, 1, 0, 0.3372549, 1,
1.593372, 0.7724211, 2.119367, 1, 0, 0.3294118, 1,
1.605049, 0.4705275, 1.65381, 1, 0, 0.3254902, 1,
1.606339, 0.7642471, 2.449997, 1, 0, 0.3176471, 1,
1.611914, -0.3260976, 2.752732, 1, 0, 0.3137255, 1,
1.61274, -0.9534833, 2.57737, 1, 0, 0.3058824, 1,
1.634631, -0.6712989, 0.3825457, 1, 0, 0.2980392, 1,
1.639663, -1.079332, 3.731264, 1, 0, 0.2941177, 1,
1.657441, 0.4468118, 0.5835294, 1, 0, 0.2862745, 1,
1.670055, 0.7332774, 0.1318239, 1, 0, 0.282353, 1,
1.675062, -1.254089, 1.219883, 1, 0, 0.2745098, 1,
1.681783, 0.4441203, 2.978453, 1, 0, 0.2705882, 1,
1.685683, 1.324083, 0.04114517, 1, 0, 0.2627451, 1,
1.731503, -0.07853231, 0.006958913, 1, 0, 0.2588235, 1,
1.734979, -0.3967453, 2.14187, 1, 0, 0.2509804, 1,
1.739161, -0.7213513, 1.103083, 1, 0, 0.2470588, 1,
1.739325, -0.1013539, 0.9599395, 1, 0, 0.2392157, 1,
1.740834, 1.04224, 0.6582597, 1, 0, 0.2352941, 1,
1.746132, -0.716021, 3.062549, 1, 0, 0.227451, 1,
1.748565, -0.4743263, 1.190612, 1, 0, 0.2235294, 1,
1.753045, 0.1647936, 2.310987, 1, 0, 0.2156863, 1,
1.755257, 1.145025, 1.563562, 1, 0, 0.2117647, 1,
1.79432, -2.038998, 0.713073, 1, 0, 0.2039216, 1,
1.806925, -0.3685768, 3.395928, 1, 0, 0.1960784, 1,
1.811345, -2.414402, 0.4661643, 1, 0, 0.1921569, 1,
1.826115, 0.3337476, -0.7723994, 1, 0, 0.1843137, 1,
1.839007, -1.543815, 3.103116, 1, 0, 0.1803922, 1,
1.852371, -0.05808458, 1.747569, 1, 0, 0.172549, 1,
1.86469, -0.1528846, 1.594459, 1, 0, 0.1686275, 1,
1.872088, -1.589794, 1.436504, 1, 0, 0.1607843, 1,
1.874362, -0.1528863, 0.4635074, 1, 0, 0.1568628, 1,
1.887881, -0.5465454, 3.143947, 1, 0, 0.1490196, 1,
1.927437, -0.1689368, 0.4433896, 1, 0, 0.145098, 1,
1.930561, -1.067402, 1.474149, 1, 0, 0.1372549, 1,
1.941648, 0.2231662, 3.406141, 1, 0, 0.1333333, 1,
2.048775, 1.674701, 0.7611679, 1, 0, 0.1254902, 1,
2.083102, -0.6938328, 2.617333, 1, 0, 0.1215686, 1,
2.100641, 0.4813994, 0.8259023, 1, 0, 0.1137255, 1,
2.109254, -1.798078, 2.802269, 1, 0, 0.1098039, 1,
2.118462, -0.0718846, 0.6762686, 1, 0, 0.1019608, 1,
2.157738, -0.8504688, 3.059866, 1, 0, 0.09411765, 1,
2.158349, -0.4806299, 0.3886516, 1, 0, 0.09019608, 1,
2.193337, 1.027742, 0.3734801, 1, 0, 0.08235294, 1,
2.213636, 0.8503042, 2.88391, 1, 0, 0.07843138, 1,
2.260846, 0.3597557, 1.861684, 1, 0, 0.07058824, 1,
2.285153, 0.1321249, 2.412643, 1, 0, 0.06666667, 1,
2.316453, -0.2991145, 0.6996963, 1, 0, 0.05882353, 1,
2.376382, 1.629937, 1.125268, 1, 0, 0.05490196, 1,
2.388123, 0.3740738, 1.233325, 1, 0, 0.04705882, 1,
2.437654, 0.5671653, 1.157303, 1, 0, 0.04313726, 1,
2.633751, -0.4573535, 3.307557, 1, 0, 0.03529412, 1,
2.634657, 0.1435779, 0.5421454, 1, 0, 0.03137255, 1,
2.690566, 1.758329, 0.16897, 1, 0, 0.02352941, 1,
2.789243, -0.3915729, 3.752637, 1, 0, 0.01960784, 1,
2.807048, -0.2393908, 1.042146, 1, 0, 0.01176471, 1,
2.954747, -1.587922, 3.203301, 1, 0, 0.007843138, 1
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
-0.004248619, -4.985908, -6.967946, 0, -0.5, 0.5, 0.5,
-0.004248619, -4.985908, -6.967946, 1, -0.5, 0.5, 0.5,
-0.004248619, -4.985908, -6.967946, 1, 1.5, 0.5, 0.5,
-0.004248619, -4.985908, -6.967946, 0, 1.5, 0.5, 0.5
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
-3.966344, -0.2773831, -6.967946, 0, -0.5, 0.5, 0.5,
-3.966344, -0.2773831, -6.967946, 1, -0.5, 0.5, 0.5,
-3.966344, -0.2773831, -6.967946, 1, 1.5, 0.5, 0.5,
-3.966344, -0.2773831, -6.967946, 0, 1.5, 0.5, 0.5
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
-3.966344, -4.985908, 0.04774523, 0, -0.5, 0.5, 0.5,
-3.966344, -4.985908, 0.04774523, 1, -0.5, 0.5, 0.5,
-3.966344, -4.985908, 0.04774523, 1, 1.5, 0.5, 0.5,
-3.966344, -4.985908, 0.04774523, 0, 1.5, 0.5, 0.5
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
-2, -3.899325, -5.34894,
2, -3.899325, -5.34894,
-2, -3.899325, -5.34894,
-2, -4.080422, -5.618774,
-1, -3.899325, -5.34894,
-1, -4.080422, -5.618774,
0, -3.899325, -5.34894,
0, -4.080422, -5.618774,
1, -3.899325, -5.34894,
1, -4.080422, -5.618774,
2, -3.899325, -5.34894,
2, -4.080422, -5.618774
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
-2, -4.442616, -6.158443, 0, -0.5, 0.5, 0.5,
-2, -4.442616, -6.158443, 1, -0.5, 0.5, 0.5,
-2, -4.442616, -6.158443, 1, 1.5, 0.5, 0.5,
-2, -4.442616, -6.158443, 0, 1.5, 0.5, 0.5,
-1, -4.442616, -6.158443, 0, -0.5, 0.5, 0.5,
-1, -4.442616, -6.158443, 1, -0.5, 0.5, 0.5,
-1, -4.442616, -6.158443, 1, 1.5, 0.5, 0.5,
-1, -4.442616, -6.158443, 0, 1.5, 0.5, 0.5,
0, -4.442616, -6.158443, 0, -0.5, 0.5, 0.5,
0, -4.442616, -6.158443, 1, -0.5, 0.5, 0.5,
0, -4.442616, -6.158443, 1, 1.5, 0.5, 0.5,
0, -4.442616, -6.158443, 0, 1.5, 0.5, 0.5,
1, -4.442616, -6.158443, 0, -0.5, 0.5, 0.5,
1, -4.442616, -6.158443, 1, -0.5, 0.5, 0.5,
1, -4.442616, -6.158443, 1, 1.5, 0.5, 0.5,
1, -4.442616, -6.158443, 0, 1.5, 0.5, 0.5,
2, -4.442616, -6.158443, 0, -0.5, 0.5, 0.5,
2, -4.442616, -6.158443, 1, -0.5, 0.5, 0.5,
2, -4.442616, -6.158443, 1, 1.5, 0.5, 0.5,
2, -4.442616, -6.158443, 0, 1.5, 0.5, 0.5
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
-3.052014, -2, -5.34894,
-3.052014, 2, -5.34894,
-3.052014, -2, -5.34894,
-3.204403, -2, -5.618774,
-3.052014, 0, -5.34894,
-3.204403, 0, -5.618774,
-3.052014, 2, -5.34894,
-3.204403, 2, -5.618774
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
-3.509179, -2, -6.158443, 0, -0.5, 0.5, 0.5,
-3.509179, -2, -6.158443, 1, -0.5, 0.5, 0.5,
-3.509179, -2, -6.158443, 1, 1.5, 0.5, 0.5,
-3.509179, -2, -6.158443, 0, 1.5, 0.5, 0.5,
-3.509179, 0, -6.158443, 0, -0.5, 0.5, 0.5,
-3.509179, 0, -6.158443, 1, -0.5, 0.5, 0.5,
-3.509179, 0, -6.158443, 1, 1.5, 0.5, 0.5,
-3.509179, 0, -6.158443, 0, 1.5, 0.5, 0.5,
-3.509179, 2, -6.158443, 0, -0.5, 0.5, 0.5,
-3.509179, 2, -6.158443, 1, -0.5, 0.5, 0.5,
-3.509179, 2, -6.158443, 1, 1.5, 0.5, 0.5,
-3.509179, 2, -6.158443, 0, 1.5, 0.5, 0.5
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
-3.052014, -3.899325, -4,
-3.052014, -3.899325, 4,
-3.052014, -3.899325, -4,
-3.204403, -4.080422, -4,
-3.052014, -3.899325, -2,
-3.204403, -4.080422, -2,
-3.052014, -3.899325, 0,
-3.204403, -4.080422, 0,
-3.052014, -3.899325, 2,
-3.204403, -4.080422, 2,
-3.052014, -3.899325, 4,
-3.204403, -4.080422, 4
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
-3.509179, -4.442616, -4, 0, -0.5, 0.5, 0.5,
-3.509179, -4.442616, -4, 1, -0.5, 0.5, 0.5,
-3.509179, -4.442616, -4, 1, 1.5, 0.5, 0.5,
-3.509179, -4.442616, -4, 0, 1.5, 0.5, 0.5,
-3.509179, -4.442616, -2, 0, -0.5, 0.5, 0.5,
-3.509179, -4.442616, -2, 1, -0.5, 0.5, 0.5,
-3.509179, -4.442616, -2, 1, 1.5, 0.5, 0.5,
-3.509179, -4.442616, -2, 0, 1.5, 0.5, 0.5,
-3.509179, -4.442616, 0, 0, -0.5, 0.5, 0.5,
-3.509179, -4.442616, 0, 1, -0.5, 0.5, 0.5,
-3.509179, -4.442616, 0, 1, 1.5, 0.5, 0.5,
-3.509179, -4.442616, 0, 0, 1.5, 0.5, 0.5,
-3.509179, -4.442616, 2, 0, -0.5, 0.5, 0.5,
-3.509179, -4.442616, 2, 1, -0.5, 0.5, 0.5,
-3.509179, -4.442616, 2, 1, 1.5, 0.5, 0.5,
-3.509179, -4.442616, 2, 0, 1.5, 0.5, 0.5,
-3.509179, -4.442616, 4, 0, -0.5, 0.5, 0.5,
-3.509179, -4.442616, 4, 1, -0.5, 0.5, 0.5,
-3.509179, -4.442616, 4, 1, 1.5, 0.5, 0.5,
-3.509179, -4.442616, 4, 0, 1.5, 0.5, 0.5
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
-3.052014, -3.899325, -5.34894,
-3.052014, 3.344559, -5.34894,
-3.052014, -3.899325, 5.444431,
-3.052014, 3.344559, 5.444431,
-3.052014, -3.899325, -5.34894,
-3.052014, -3.899325, 5.444431,
-3.052014, 3.344559, -5.34894,
-3.052014, 3.344559, 5.444431,
-3.052014, -3.899325, -5.34894,
3.043517, -3.899325, -5.34894,
-3.052014, -3.899325, 5.444431,
3.043517, -3.899325, 5.444431,
-3.052014, 3.344559, -5.34894,
3.043517, 3.344559, -5.34894,
-3.052014, 3.344559, 5.444431,
3.043517, 3.344559, 5.444431,
3.043517, -3.899325, -5.34894,
3.043517, 3.344559, -5.34894,
3.043517, -3.899325, 5.444431,
3.043517, 3.344559, 5.444431,
3.043517, -3.899325, -5.34894,
3.043517, -3.899325, 5.444431,
3.043517, 3.344559, -5.34894,
3.043517, 3.344559, 5.444431
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
var radius = 7.666411;
var distance = 34.10873;
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
mvMatrix.translate( 0.004248619, 0.2773831, -0.04774523 );
mvMatrix.scale( 1.359861, 1.144286, 0.7679782 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.10873);
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
Methomyl<-read.table("Methomyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methomyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methomyl' not found
```

```r
y<-Methomyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methomyl' not found
```

```r
z<-Methomyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methomyl' not found
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
-2.963244, 0.4198998, -1.041814, 0, 0, 1, 1, 1,
-2.733313, -1.786805, -3.526807, 1, 0, 0, 1, 1,
-2.690945, 0.9648029, 0.0386306, 1, 0, 0, 1, 1,
-2.570518, 0.4259565, -0.7212073, 1, 0, 0, 1, 1,
-2.511452, -1.822873, -1.804584, 1, 0, 0, 1, 1,
-2.504358, 0.3989818, -0.7876014, 1, 0, 0, 1, 1,
-2.411799, -0.2355119, -0.9881541, 0, 0, 0, 1, 1,
-2.344727, 0.01562576, -1.290789, 0, 0, 0, 1, 1,
-2.322706, 0.942521, -0.8105662, 0, 0, 0, 1, 1,
-2.279243, -0.4722537, -1.79956, 0, 0, 0, 1, 1,
-2.260298, 1.811599, -0.1852288, 0, 0, 0, 1, 1,
-2.236365, 1.85537, -0.4426042, 0, 0, 0, 1, 1,
-2.231962, -0.4814884, -4.136456, 0, 0, 0, 1, 1,
-2.187596, 1.418489, -3.341767, 1, 1, 1, 1, 1,
-2.122577, 0.827347, -2.366351, 1, 1, 1, 1, 1,
-2.110765, 1.736574, 0.8737572, 1, 1, 1, 1, 1,
-2.104358, -0.1237408, -1.82278, 1, 1, 1, 1, 1,
-2.096841, 1.164842, -0.6850383, 1, 1, 1, 1, 1,
-2.085823, 0.6298725, -2.929601, 1, 1, 1, 1, 1,
-2.072828, 1.102251, -1.123341, 1, 1, 1, 1, 1,
-2.043631, -0.04592107, -1.60214, 1, 1, 1, 1, 1,
-2.02439, -1.512936, -0.4547222, 1, 1, 1, 1, 1,
-2.022405, -1.446287, -1.537021, 1, 1, 1, 1, 1,
-2.003422, 0.3967708, -1.510161, 1, 1, 1, 1, 1,
-1.995143, -1.45357, -2.327094, 1, 1, 1, 1, 1,
-1.994116, -0.6473911, -2.679826, 1, 1, 1, 1, 1,
-1.988651, 0.5270352, -0.8603635, 1, 1, 1, 1, 1,
-1.977749, 0.7689641, -1.223785, 1, 1, 1, 1, 1,
-1.967896, 0.2267919, -1.110082, 0, 0, 1, 1, 1,
-1.953633, 0.01909501, -2.446184, 1, 0, 0, 1, 1,
-1.949381, -0.2663279, -2.31679, 1, 0, 0, 1, 1,
-1.949215, 1.440998, 1.284142, 1, 0, 0, 1, 1,
-1.938182, 0.1613974, -3.474554, 1, 0, 0, 1, 1,
-1.922575, 0.00312419, -1.118398, 1, 0, 0, 1, 1,
-1.914558, 1.19769, -0.3035261, 0, 0, 0, 1, 1,
-1.89502, 0.9978247, -0.4322983, 0, 0, 0, 1, 1,
-1.893221, 0.001252532, -0.6209829, 0, 0, 0, 1, 1,
-1.827212, -1.637488, -2.231417, 0, 0, 0, 1, 1,
-1.81404, 1.348224, -1.031165, 0, 0, 0, 1, 1,
-1.794412, 0.9670177, -0.9529755, 0, 0, 0, 1, 1,
-1.783424, -1.46464, -1.379941, 0, 0, 0, 1, 1,
-1.782912, -0.322187, -2.618171, 1, 1, 1, 1, 1,
-1.774646, 1.151039, -1.599505, 1, 1, 1, 1, 1,
-1.770254, -0.8916773, -1.827278, 1, 1, 1, 1, 1,
-1.750583, 2.27211, -0.846541, 1, 1, 1, 1, 1,
-1.729642, 0.04971917, -0.1250673, 1, 1, 1, 1, 1,
-1.721658, 0.4710321, -0.4439137, 1, 1, 1, 1, 1,
-1.709006, -0.7021101, -1.912181, 1, 1, 1, 1, 1,
-1.705619, 1.868755, -0.0006128888, 1, 1, 1, 1, 1,
-1.696414, 0.5033233, -1.900889, 1, 1, 1, 1, 1,
-1.665593, 0.8307973, -2.513797, 1, 1, 1, 1, 1,
-1.634254, 0.4075303, -2.139161, 1, 1, 1, 1, 1,
-1.619169, -0.6765211, -2.615546, 1, 1, 1, 1, 1,
-1.601087, -1.759237, -2.310111, 1, 1, 1, 1, 1,
-1.594964, -0.1467106, -1.070433, 1, 1, 1, 1, 1,
-1.592753, 1.111699, -0.7757869, 1, 1, 1, 1, 1,
-1.575704, 0.4088843, -0.810351, 0, 0, 1, 1, 1,
-1.569679, 0.1842792, 1.010538, 1, 0, 0, 1, 1,
-1.566108, 0.4580621, -1.756166, 1, 0, 0, 1, 1,
-1.562523, 0.8229179, -0.4810358, 1, 0, 0, 1, 1,
-1.536378, 0.5279797, -0.6481266, 1, 0, 0, 1, 1,
-1.526557, 0.9455161, -0.7471418, 1, 0, 0, 1, 1,
-1.524326, 1.494399, -2.60686, 0, 0, 0, 1, 1,
-1.51636, 0.01783737, -1.992381, 0, 0, 0, 1, 1,
-1.514291, -0.2431336, -1.991017, 0, 0, 0, 1, 1,
-1.511388, 0.1445903, -2.13488, 0, 0, 0, 1, 1,
-1.497847, -1.173694, -1.840528, 0, 0, 0, 1, 1,
-1.465262, 0.3950683, -1.624173, 0, 0, 0, 1, 1,
-1.460472, 1.928507, -2.555743, 0, 0, 0, 1, 1,
-1.453184, 2.003958, 0.2329019, 1, 1, 1, 1, 1,
-1.44456, 0.6088351, -1.051215, 1, 1, 1, 1, 1,
-1.441183, 2.201749, -0.2894723, 1, 1, 1, 1, 1,
-1.439932, 0.4992789, 0.4036993, 1, 1, 1, 1, 1,
-1.437985, -0.4275496, -2.490051, 1, 1, 1, 1, 1,
-1.435963, 0.3122743, 0.1949166, 1, 1, 1, 1, 1,
-1.433016, -0.5141466, -1.959637, 1, 1, 1, 1, 1,
-1.426014, -0.7485363, -2.117889, 1, 1, 1, 1, 1,
-1.422168, -0.3299109, -1.983816, 1, 1, 1, 1, 1,
-1.42209, 0.05730966, -2.5028, 1, 1, 1, 1, 1,
-1.415799, 0.08148553, -3.067595, 1, 1, 1, 1, 1,
-1.414797, -2.060031, -2.913546, 1, 1, 1, 1, 1,
-1.409176, -0.4838465, -1.402144, 1, 1, 1, 1, 1,
-1.408582, -0.7475302, -2.178695, 1, 1, 1, 1, 1,
-1.397435, 0.9276197, -1.23303, 1, 1, 1, 1, 1,
-1.384575, 1.455389, -1.114378, 0, 0, 1, 1, 1,
-1.379781, -0.6859542, -0.4865847, 1, 0, 0, 1, 1,
-1.374459, 0.7751859, -0.05181013, 1, 0, 0, 1, 1,
-1.367453, 0.3265196, 0.07993902, 1, 0, 0, 1, 1,
-1.357157, 0.3347344, 1.081462, 1, 0, 0, 1, 1,
-1.349667, 1.238606, -1.065664, 1, 0, 0, 1, 1,
-1.343348, 1.429064, -0.01829954, 0, 0, 0, 1, 1,
-1.324214, -0.8694574, -1.375871, 0, 0, 0, 1, 1,
-1.320567, -0.3971459, -1.876941, 0, 0, 0, 1, 1,
-1.318675, 2.128436, -0.466091, 0, 0, 0, 1, 1,
-1.317866, -0.4678294, 0.284381, 0, 0, 0, 1, 1,
-1.313999, 0.5979555, -3.42218, 0, 0, 0, 1, 1,
-1.31148, 0.5097625, -1.470319, 0, 0, 0, 1, 1,
-1.291475, -0.2735023, -2.271207, 1, 1, 1, 1, 1,
-1.276825, -0.8786283, -2.659602, 1, 1, 1, 1, 1,
-1.250886, -0.03480298, -1.886769, 1, 1, 1, 1, 1,
-1.250711, 2.043614, -2.151621, 1, 1, 1, 1, 1,
-1.245041, 0.01573101, -1.420385, 1, 1, 1, 1, 1,
-1.237926, 0.2268854, -1.691755, 1, 1, 1, 1, 1,
-1.230458, 1.61924, -1.927732, 1, 1, 1, 1, 1,
-1.227831, 1.010945, 0.3254842, 1, 1, 1, 1, 1,
-1.205663, 1.85883, -1.3371, 1, 1, 1, 1, 1,
-1.205559, 1.457378, -1.096662, 1, 1, 1, 1, 1,
-1.198222, 0.340169, -2.33184, 1, 1, 1, 1, 1,
-1.190835, -0.1424007, -2.614588, 1, 1, 1, 1, 1,
-1.189707, 1.346381, -0.3718995, 1, 1, 1, 1, 1,
-1.189618, -0.4771798, -2.383226, 1, 1, 1, 1, 1,
-1.18908, 0.7384045, -1.576756, 1, 1, 1, 1, 1,
-1.188737, 0.3049642, -0.5716444, 0, 0, 1, 1, 1,
-1.172191, -0.8843546, -3.795655, 1, 0, 0, 1, 1,
-1.168771, 0.1880771, -1.352825, 1, 0, 0, 1, 1,
-1.1563, -0.5607814, -1.898164, 1, 0, 0, 1, 1,
-1.146259, -0.2721938, -1.990855, 1, 0, 0, 1, 1,
-1.146146, -1.830817, -1.179655, 1, 0, 0, 1, 1,
-1.141201, -1.029851, -1.29813, 0, 0, 0, 1, 1,
-1.137611, 1.211789, -0.9867769, 0, 0, 0, 1, 1,
-1.133363, 1.525152, 0.1033172, 0, 0, 0, 1, 1,
-1.118627, 2.088651, -0.9967697, 0, 0, 0, 1, 1,
-1.116077, -0.5909964, -0.2633381, 0, 0, 0, 1, 1,
-1.113592, 0.9648556, -0.3441678, 0, 0, 0, 1, 1,
-1.112957, 1.903053, 0.0196909, 0, 0, 0, 1, 1,
-1.096142, -0.2241385, -3.387829, 1, 1, 1, 1, 1,
-1.095966, 0.9032655, -0.620331, 1, 1, 1, 1, 1,
-1.095514, -0.323911, 0.003701063, 1, 1, 1, 1, 1,
-1.095083, -2.711399, -4.658958, 1, 1, 1, 1, 1,
-1.092476, 0.2357095, -0.4872915, 1, 1, 1, 1, 1,
-1.091221, -0.145149, -1.769138, 1, 1, 1, 1, 1,
-1.087429, -2.369045, -4.248952, 1, 1, 1, 1, 1,
-1.087003, 0.3586857, -2.326385, 1, 1, 1, 1, 1,
-1.083508, 0.3692804, -1.995863, 1, 1, 1, 1, 1,
-1.082, -0.2324445, -2.486846, 1, 1, 1, 1, 1,
-1.080785, 0.8923751, -0.2565945, 1, 1, 1, 1, 1,
-1.077623, -0.857655, -1.922535, 1, 1, 1, 1, 1,
-1.074994, 0.3628398, -2.866087, 1, 1, 1, 1, 1,
-1.074207, 0.4128178, -1.936302, 1, 1, 1, 1, 1,
-1.068519, 0.5490257, -1.463827, 1, 1, 1, 1, 1,
-1.066926, 0.5211008, -1.560642, 0, 0, 1, 1, 1,
-1.05692, -1.461488, -1.812282, 1, 0, 0, 1, 1,
-1.055371, -1.084824, -2.350988, 1, 0, 0, 1, 1,
-1.051125, 1.0094, -0.04084574, 1, 0, 0, 1, 1,
-1.044401, -1.345995, -1.631574, 1, 0, 0, 1, 1,
-1.044079, 0.8009998, 1.305017, 1, 0, 0, 1, 1,
-1.042792, 1.953224, -0.2327765, 0, 0, 0, 1, 1,
-1.0399, 2.183157, 1.34053, 0, 0, 0, 1, 1,
-1.038693, -0.6413028, -2.496255, 0, 0, 0, 1, 1,
-1.033957, -1.70637, -1.565252, 0, 0, 0, 1, 1,
-1.032678, 1.143422, 0.5232769, 0, 0, 0, 1, 1,
-1.032311, 0.2204939, -2.476605, 0, 0, 0, 1, 1,
-1.028695, 1.647916, 0.654178, 0, 0, 0, 1, 1,
-1.024308, -0.2662255, -1.661172, 1, 1, 1, 1, 1,
-1.021467, -0.08551483, -2.800947, 1, 1, 1, 1, 1,
-1.018961, 0.7016195, -0.8804135, 1, 1, 1, 1, 1,
-1.01766, 0.4881299, -2.942223, 1, 1, 1, 1, 1,
-1.011956, -1.45507, -0.9937285, 1, 1, 1, 1, 1,
-1.003686, -0.05452373, -1.183526, 1, 1, 1, 1, 1,
-1.002314, -0.4340174, -1.912943, 1, 1, 1, 1, 1,
-1.001104, 1.551205, 0.1695864, 1, 1, 1, 1, 1,
-0.9992527, 0.3822382, -0.3088849, 1, 1, 1, 1, 1,
-0.9825971, 0.05898215, -2.539717, 1, 1, 1, 1, 1,
-0.9822786, 1.855575, -0.8226646, 1, 1, 1, 1, 1,
-0.9814336, -1.308784, -1.962529, 1, 1, 1, 1, 1,
-0.9703309, 0.8427141, -0.7000017, 1, 1, 1, 1, 1,
-0.9504597, 0.3531443, -1.275818, 1, 1, 1, 1, 1,
-0.9475279, -0.2677171, -3.976475, 1, 1, 1, 1, 1,
-0.9447071, -0.8453678, -2.276087, 0, 0, 1, 1, 1,
-0.9431203, 1.435551, -1.425928, 1, 0, 0, 1, 1,
-0.9427631, 0.1062614, -0.8114015, 1, 0, 0, 1, 1,
-0.9344914, -1.727321, -0.6155213, 1, 0, 0, 1, 1,
-0.9272795, 0.04503912, -1.600582, 1, 0, 0, 1, 1,
-0.9268889, -0.4938318, -1.453424, 1, 0, 0, 1, 1,
-0.9159863, -0.2791983, -2.418719, 0, 0, 0, 1, 1,
-0.9116083, 0.7504885, -0.4020725, 0, 0, 0, 1, 1,
-0.9058367, -0.1936411, -2.008645, 0, 0, 0, 1, 1,
-0.9035814, 0.5912835, -2.692618, 0, 0, 0, 1, 1,
-0.880009, 1.174821, 1.072861, 0, 0, 0, 1, 1,
-0.8771587, -0.1258694, -1.74796, 0, 0, 0, 1, 1,
-0.8697475, 0.1030565, -2.323153, 0, 0, 0, 1, 1,
-0.8697059, 0.9046452, -2.059047, 1, 1, 1, 1, 1,
-0.8696007, -0.2909242, -3.100783, 1, 1, 1, 1, 1,
-0.8667114, 1.248834, -1.767586, 1, 1, 1, 1, 1,
-0.8644686, -1.511937, -3.625867, 1, 1, 1, 1, 1,
-0.8626733, -1.712684, -1.469063, 1, 1, 1, 1, 1,
-0.8625804, 0.4129163, -1.886752, 1, 1, 1, 1, 1,
-0.8592314, 0.9322785, 0.3753406, 1, 1, 1, 1, 1,
-0.8541928, -0.3497858, -1.190615, 1, 1, 1, 1, 1,
-0.853279, -1.460306, -2.672946, 1, 1, 1, 1, 1,
-0.8519456, -0.2714724, -2.049162, 1, 1, 1, 1, 1,
-0.8512809, -0.1686205, -1.684071, 1, 1, 1, 1, 1,
-0.8397077, -0.09005634, -2.044773, 1, 1, 1, 1, 1,
-0.8324257, 0.2669727, -2.382164, 1, 1, 1, 1, 1,
-0.8315818, -0.6158803, -2.323581, 1, 1, 1, 1, 1,
-0.8229746, -1.536935, -2.597499, 1, 1, 1, 1, 1,
-0.8181186, -0.5898416, -2.016306, 0, 0, 1, 1, 1,
-0.8139381, -0.550565, -3.309086, 1, 0, 0, 1, 1,
-0.8119496, -0.07596377, -2.684286, 1, 0, 0, 1, 1,
-0.8109401, -2.622908, -2.313967, 1, 0, 0, 1, 1,
-0.8090815, -0.6182836, -3.387503, 1, 0, 0, 1, 1,
-0.8086721, 0.153094, -0.414578, 1, 0, 0, 1, 1,
-0.8076369, 0.5020832, -0.4565914, 0, 0, 0, 1, 1,
-0.8072837, 1.032657, -0.1121949, 0, 0, 0, 1, 1,
-0.8071209, -0.3108134, -2.607547, 0, 0, 0, 1, 1,
-0.8037688, -1.766203, -1.601011, 0, 0, 0, 1, 1,
-0.8036029, -1.051716, -1.852351, 0, 0, 0, 1, 1,
-0.7969013, -1.425836, -2.017988, 0, 0, 0, 1, 1,
-0.7956318, 1.244699, -2.811651, 0, 0, 0, 1, 1,
-0.7955785, -0.5604621, -3.150218, 1, 1, 1, 1, 1,
-0.7951569, 0.5480901, -1.083848, 1, 1, 1, 1, 1,
-0.794216, -0.4767173, -2.002235, 1, 1, 1, 1, 1,
-0.7935405, -0.4584161, -2.626192, 1, 1, 1, 1, 1,
-0.7877272, -2.480224, -2.892414, 1, 1, 1, 1, 1,
-0.7872331, 0.7455773, -1.583982, 1, 1, 1, 1, 1,
-0.7871525, 0.0461925, -3.456407, 1, 1, 1, 1, 1,
-0.7870353, -0.2164639, -1.192337, 1, 1, 1, 1, 1,
-0.7850945, -0.917634, -2.373925, 1, 1, 1, 1, 1,
-0.7797354, -0.1144463, -1.318846, 1, 1, 1, 1, 1,
-0.7786433, -0.2771206, -2.001335, 1, 1, 1, 1, 1,
-0.7674991, -0.2397388, -1.334192, 1, 1, 1, 1, 1,
-0.766448, 0.7623086, -0.4706993, 1, 1, 1, 1, 1,
-0.7663689, -1.201901, -2.575919, 1, 1, 1, 1, 1,
-0.7645122, -0.5122025, -2.460616, 1, 1, 1, 1, 1,
-0.76448, 1.148618, -0.1747125, 0, 0, 1, 1, 1,
-0.7626642, 1.661625, 0.296124, 1, 0, 0, 1, 1,
-0.7617421, 1.232329, -0.238399, 1, 0, 0, 1, 1,
-0.7574873, -0.9468462, -1.833624, 1, 0, 0, 1, 1,
-0.7572351, -0.6012316, -1.722441, 1, 0, 0, 1, 1,
-0.7538365, -2.31134, -4.11339, 1, 0, 0, 1, 1,
-0.7518012, -0.1101724, -0.7832167, 0, 0, 0, 1, 1,
-0.7515256, -1.144422, -3.710787, 0, 0, 0, 1, 1,
-0.7498915, -0.1092525, -1.949215, 0, 0, 0, 1, 1,
-0.7433391, -0.756618, -2.117075, 0, 0, 0, 1, 1,
-0.7316836, -0.4931687, -1.895624, 0, 0, 0, 1, 1,
-0.7296146, -1.537031, -2.818987, 0, 0, 0, 1, 1,
-0.7245101, -0.4451835, -1.190701, 0, 0, 0, 1, 1,
-0.7069672, 0.522727, -0.8817515, 1, 1, 1, 1, 1,
-0.7030934, 0.2914807, -1.530284, 1, 1, 1, 1, 1,
-0.7015708, -0.6570954, -2.546904, 1, 1, 1, 1, 1,
-0.7008797, -0.9734859, -2.637734, 1, 1, 1, 1, 1,
-0.6960678, 0.8237036, -1.200189, 1, 1, 1, 1, 1,
-0.6913406, 0.4991574, 0.2528648, 1, 1, 1, 1, 1,
-0.6899482, 1.318215, -0.2335884, 1, 1, 1, 1, 1,
-0.6884509, 1.444704, -0.9107418, 1, 1, 1, 1, 1,
-0.6869045, 0.9930094, -0.9895685, 1, 1, 1, 1, 1,
-0.6847544, 0.5125381, -0.7837805, 1, 1, 1, 1, 1,
-0.6845178, 0.7385705, -1.326582, 1, 1, 1, 1, 1,
-0.6844945, 0.02086015, -1.717614, 1, 1, 1, 1, 1,
-0.6836265, -0.6398551, -3.928208, 1, 1, 1, 1, 1,
-0.6835167, 0.03070391, -0.9090393, 1, 1, 1, 1, 1,
-0.6750043, 0.7577561, -0.7712725, 1, 1, 1, 1, 1,
-0.6737158, 0.3859964, -0.2278801, 0, 0, 1, 1, 1,
-0.6724121, 0.1243705, -1.289162, 1, 0, 0, 1, 1,
-0.6711403, 0.8254854, -0.248916, 1, 0, 0, 1, 1,
-0.6688979, 0.7542931, -1.94706, 1, 0, 0, 1, 1,
-0.667061, 0.4848771, -2.284369, 1, 0, 0, 1, 1,
-0.6612484, 0.7946954, -1.123471, 1, 0, 0, 1, 1,
-0.6597676, -0.995439, -2.639115, 0, 0, 0, 1, 1,
-0.6543999, 1.467147, -0.5886763, 0, 0, 0, 1, 1,
-0.6540233, -0.1980031, -2.527588, 0, 0, 0, 1, 1,
-0.6530522, -1.342722, -2.166792, 0, 0, 0, 1, 1,
-0.6455274, -0.1563652, -1.923614, 0, 0, 0, 1, 1,
-0.6421204, -0.6343337, -2.156633, 0, 0, 0, 1, 1,
-0.6418619, 0.07095999, -0.1745746, 0, 0, 0, 1, 1,
-0.6415009, -1.0018, -3.334825, 1, 1, 1, 1, 1,
-0.6365361, 0.523463, -1.143071, 1, 1, 1, 1, 1,
-0.6350783, -1.743005, -3.14634, 1, 1, 1, 1, 1,
-0.6324976, -0.4697367, -0.02720859, 1, 1, 1, 1, 1,
-0.6315653, -1.346672, -1.698406, 1, 1, 1, 1, 1,
-0.6233255, 0.4156462, -0.7708864, 1, 1, 1, 1, 1,
-0.6221371, -0.3759673, -3.226744, 1, 1, 1, 1, 1,
-0.6141457, -0.4908393, -3.130763, 1, 1, 1, 1, 1,
-0.6131848, 0.3909703, 0.8697772, 1, 1, 1, 1, 1,
-0.6085405, 1.117541, -1.437836, 1, 1, 1, 1, 1,
-0.6060822, -0.3274649, -2.558098, 1, 1, 1, 1, 1,
-0.6021014, -0.4589573, -0.9164137, 1, 1, 1, 1, 1,
-0.5987251, 0.1419147, -0.5741199, 1, 1, 1, 1, 1,
-0.596853, -0.668502, -3.31294, 1, 1, 1, 1, 1,
-0.5959049, 0.3192064, -0.1462849, 1, 1, 1, 1, 1,
-0.5949853, 0.4097521, -0.964763, 0, 0, 1, 1, 1,
-0.5947096, -0.1986647, -0.8957943, 1, 0, 0, 1, 1,
-0.5934929, -1.263662, -3.798176, 1, 0, 0, 1, 1,
-0.5891907, -1.5535, -2.898243, 1, 0, 0, 1, 1,
-0.5865768, -0.3288696, -2.1457, 1, 0, 0, 1, 1,
-0.5854774, -1.162123, -2.867914, 1, 0, 0, 1, 1,
-0.5784183, 0.3408988, -1.739019, 0, 0, 0, 1, 1,
-0.5769885, -1.003898, -2.576406, 0, 0, 0, 1, 1,
-0.5741882, 0.8551025, -1.714754, 0, 0, 0, 1, 1,
-0.5740411, 2.172269, -0.8755376, 0, 0, 0, 1, 1,
-0.5728111, -0.51504, -1.461638, 0, 0, 0, 1, 1,
-0.5711895, -0.02141171, 0.440993, 0, 0, 0, 1, 1,
-0.5703018, -0.8493714, -3.393254, 0, 0, 0, 1, 1,
-0.5658237, -0.6552746, -3.448987, 1, 1, 1, 1, 1,
-0.5645762, 0.3522564, -2.105234, 1, 1, 1, 1, 1,
-0.5643169, -0.9552841, -0.9899144, 1, 1, 1, 1, 1,
-0.5642753, 0.7162793, -1.469995, 1, 1, 1, 1, 1,
-0.5638507, 0.9722369, -1.732003, 1, 1, 1, 1, 1,
-0.5627018, -1.179728, -2.0696, 1, 1, 1, 1, 1,
-0.5623235, -2.032046, -1.914845, 1, 1, 1, 1, 1,
-0.5597413, -0.4891625, -4.269728, 1, 1, 1, 1, 1,
-0.5591037, -0.2700039, -0.1063105, 1, 1, 1, 1, 1,
-0.558873, -0.1508576, -2.074045, 1, 1, 1, 1, 1,
-0.5569205, 1.689848, -0.849328, 1, 1, 1, 1, 1,
-0.5551329, 0.5312946, 0.6759248, 1, 1, 1, 1, 1,
-0.5514011, -0.819396, -3.018392, 1, 1, 1, 1, 1,
-0.5486504, 1.011972, 0.6384377, 1, 1, 1, 1, 1,
-0.5436803, -1.438907, -2.232183, 1, 1, 1, 1, 1,
-0.5426424, -0.6988934, -1.438794, 0, 0, 1, 1, 1,
-0.5376947, 0.3010544, -2.594434, 1, 0, 0, 1, 1,
-0.5318179, -0.2814174, -1.35406, 1, 0, 0, 1, 1,
-0.5290204, -0.1399047, -2.268926, 1, 0, 0, 1, 1,
-0.5222592, 0.9659809, 0.8249005, 1, 0, 0, 1, 1,
-0.5196576, 0.8536266, 1.318359, 1, 0, 0, 1, 1,
-0.5193953, 1.217549, 1.998896, 0, 0, 0, 1, 1,
-0.5186316, -0.06342826, -2.05911, 0, 0, 0, 1, 1,
-0.514595, -0.03419235, -1.647759, 0, 0, 0, 1, 1,
-0.5135773, -0.8727943, -2.075078, 0, 0, 0, 1, 1,
-0.5114726, 0.4063345, -1.549513, 0, 0, 0, 1, 1,
-0.5041915, -0.4822277, -2.997755, 0, 0, 0, 1, 1,
-0.5039937, -0.9352206, -1.627056, 0, 0, 0, 1, 1,
-0.5026861, 0.172347, -2.243335, 1, 1, 1, 1, 1,
-0.4980942, 1.835668, 0.8552308, 1, 1, 1, 1, 1,
-0.4929389, -0.6420875, -2.373346, 1, 1, 1, 1, 1,
-0.492626, 1.050123, 0.5589862, 1, 1, 1, 1, 1,
-0.4919938, -0.09952513, -1.184891, 1, 1, 1, 1, 1,
-0.4892832, -1.525894, -4.114818, 1, 1, 1, 1, 1,
-0.4889701, -0.07666478, -2.737233, 1, 1, 1, 1, 1,
-0.4851275, 0.6506166, 0.03051225, 1, 1, 1, 1, 1,
-0.4834308, 1.35701, -1.396663, 1, 1, 1, 1, 1,
-0.4790142, 1.321305, 0.6486938, 1, 1, 1, 1, 1,
-0.4728919, 0.1560776, -1.411291, 1, 1, 1, 1, 1,
-0.4708078, -1.022407, -2.215234, 1, 1, 1, 1, 1,
-0.4675888, -0.2147315, -3.15332, 1, 1, 1, 1, 1,
-0.4675118, 0.6152226, 0.05170028, 1, 1, 1, 1, 1,
-0.4663544, -1.008356, -2.874955, 1, 1, 1, 1, 1,
-0.4645305, 0.8869262, -0.8671159, 0, 0, 1, 1, 1,
-0.4635977, 0.4020668, 0.209988, 1, 0, 0, 1, 1,
-0.4604183, -0.5569472, -1.433095, 1, 0, 0, 1, 1,
-0.4593787, 0.5854754, 0.01131258, 1, 0, 0, 1, 1,
-0.4587804, -0.5066189, -3.891263, 1, 0, 0, 1, 1,
-0.4575603, -0.6646563, -3.455016, 1, 0, 0, 1, 1,
-0.4534575, -0.4124435, -1.941326, 0, 0, 0, 1, 1,
-0.4506061, 0.5550879, -2.342914, 0, 0, 0, 1, 1,
-0.4448433, -0.04207456, -2.230561, 0, 0, 0, 1, 1,
-0.4448368, 0.571041, 0.2830288, 0, 0, 0, 1, 1,
-0.4385967, -0.004301918, -2.459802, 0, 0, 0, 1, 1,
-0.4378358, 0.2948327, -0.3240302, 0, 0, 0, 1, 1,
-0.4368955, 1.596669, -1.494913, 0, 0, 0, 1, 1,
-0.4353427, 0.528503, 0.2414488, 1, 1, 1, 1, 1,
-0.4327656, -1.347271, -3.018864, 1, 1, 1, 1, 1,
-0.4277913, 0.3831268, -0.7283447, 1, 1, 1, 1, 1,
-0.4274056, 0.7158807, 0.6323122, 1, 1, 1, 1, 1,
-0.4258175, 0.5671049, -0.20921, 1, 1, 1, 1, 1,
-0.4196115, 0.09158055, -1.830571, 1, 1, 1, 1, 1,
-0.4190316, -0.5604802, -3.370889, 1, 1, 1, 1, 1,
-0.4189766, -0.2585517, -2.711647, 1, 1, 1, 1, 1,
-0.4072416, -1.131652, -3.670849, 1, 1, 1, 1, 1,
-0.4071993, 1.318388, -0.3114372, 1, 1, 1, 1, 1,
-0.4057668, -1.191743, -2.743946, 1, 1, 1, 1, 1,
-0.4046932, 0.7663183, -0.880583, 1, 1, 1, 1, 1,
-0.4040733, 0.2137177, -0.9849829, 1, 1, 1, 1, 1,
-0.403023, -0.382501, -3.124015, 1, 1, 1, 1, 1,
-0.4017729, -0.3041289, -4.003968, 1, 1, 1, 1, 1,
-0.4004005, -1.037382, -2.244615, 0, 0, 1, 1, 1,
-0.3958693, 0.7374761, 0.6347517, 1, 0, 0, 1, 1,
-0.3902897, 0.3369128, -1.14518, 1, 0, 0, 1, 1,
-0.3879333, -0.06481136, -0.8431321, 1, 0, 0, 1, 1,
-0.3866611, 0.3154947, -2.149909, 1, 0, 0, 1, 1,
-0.3858787, -0.5980507, -3.308159, 1, 0, 0, 1, 1,
-0.378024, 0.2730782, -0.8462073, 0, 0, 0, 1, 1,
-0.3770625, -0.2296945, -2.997567, 0, 0, 0, 1, 1,
-0.3754949, 0.8703161, 0.1077792, 0, 0, 0, 1, 1,
-0.3754612, -3.793832, -2.433391, 0, 0, 0, 1, 1,
-0.3715208, -0.3655869, -1.205642, 0, 0, 0, 1, 1,
-0.3661588, -0.07925688, -0.2441897, 0, 0, 0, 1, 1,
-0.3638202, -0.4236707, -4.442331, 0, 0, 0, 1, 1,
-0.3609988, -0.9732895, -4.046031, 1, 1, 1, 1, 1,
-0.3585896, -0.8075467, -2.68208, 1, 1, 1, 1, 1,
-0.3560523, 0.8669074, 0.4586965, 1, 1, 1, 1, 1,
-0.3541951, -1.178923, -1.659252, 1, 1, 1, 1, 1,
-0.3468044, 0.873961, -0.5092862, 1, 1, 1, 1, 1,
-0.3462121, -0.3000354, -2.225649, 1, 1, 1, 1, 1,
-0.3454992, -0.7375857, -2.417458, 1, 1, 1, 1, 1,
-0.344997, 0.4538843, 0.1749515, 1, 1, 1, 1, 1,
-0.3427044, 1.022838, 1.044126, 1, 1, 1, 1, 1,
-0.3403343, 0.8347805, 0.5009928, 1, 1, 1, 1, 1,
-0.3397206, -0.1018403, -0.6330937, 1, 1, 1, 1, 1,
-0.338104, 0.7731342, -0.276143, 1, 1, 1, 1, 1,
-0.3360834, -0.8118784, -3.598669, 1, 1, 1, 1, 1,
-0.3322796, -0.1902072, -1.237827, 1, 1, 1, 1, 1,
-0.330985, -0.4061748, -2.017291, 1, 1, 1, 1, 1,
-0.3263182, 0.4052377, -1.40652, 0, 0, 1, 1, 1,
-0.3258696, -0.1256527, -1.156399, 1, 0, 0, 1, 1,
-0.3255796, 1.934164, -0.838054, 1, 0, 0, 1, 1,
-0.3250224, -1.830599, -4.451381, 1, 0, 0, 1, 1,
-0.3222468, -1.461307, -2.703775, 1, 0, 0, 1, 1,
-0.317981, 0.7009555, 1.631022, 1, 0, 0, 1, 1,
-0.314118, 0.1145182, -1.670931, 0, 0, 0, 1, 1,
-0.3038137, -1.253288, -2.192184, 0, 0, 0, 1, 1,
-0.2994428, 1.225872, -0.2642574, 0, 0, 0, 1, 1,
-0.2988344, -0.5308822, -1.501774, 0, 0, 0, 1, 1,
-0.2983196, 0.7271738, -0.9836375, 0, 0, 0, 1, 1,
-0.2979559, 3.239066, -1.123681, 0, 0, 0, 1, 1,
-0.2949624, 0.8062239, -0.09402187, 0, 0, 0, 1, 1,
-0.2920919, 0.8735082, -0.8678539, 1, 1, 1, 1, 1,
-0.2906264, -1.804118, -2.039882, 1, 1, 1, 1, 1,
-0.2903301, -0.1876603, -2.618513, 1, 1, 1, 1, 1,
-0.2872294, -1.020742, -4.410931, 1, 1, 1, 1, 1,
-0.280298, -0.04593125, -5.191755, 1, 1, 1, 1, 1,
-0.2788967, -0.0912922, -0.6611634, 1, 1, 1, 1, 1,
-0.2756847, -0.5887898, -3.346082, 1, 1, 1, 1, 1,
-0.2749887, 0.8068033, 2.281146, 1, 1, 1, 1, 1,
-0.2729816, 1.089172, 1.630417, 1, 1, 1, 1, 1,
-0.2709725, 0.572651, -0.9419561, 1, 1, 1, 1, 1,
-0.2703826, 1.058793, 0.2685274, 1, 1, 1, 1, 1,
-0.2673033, -1.118021, -1.943246, 1, 1, 1, 1, 1,
-0.2672827, -0.4471304, -3.830207, 1, 1, 1, 1, 1,
-0.2633197, 0.6861253, -0.3627982, 1, 1, 1, 1, 1,
-0.262828, 0.1151533, -0.7112778, 1, 1, 1, 1, 1,
-0.2444142, 1.300321, -0.2008342, 0, 0, 1, 1, 1,
-0.2398116, 0.824018, 0.2178155, 1, 0, 0, 1, 1,
-0.2360583, -0.9334491, -3.810297, 1, 0, 0, 1, 1,
-0.2318657, -0.9435466, -2.013676, 1, 0, 0, 1, 1,
-0.2315641, 0.1583841, -1.156379, 1, 0, 0, 1, 1,
-0.2194594, -0.1995044, -1.934805, 1, 0, 0, 1, 1,
-0.2189939, 0.612254, -1.689005, 0, 0, 0, 1, 1,
-0.2175729, 0.1919968, 0.3012737, 0, 0, 0, 1, 1,
-0.2141595, 1.118149, 0.3143095, 0, 0, 0, 1, 1,
-0.2118098, 2.05487, -1.686721, 0, 0, 0, 1, 1,
-0.211792, 0.7032207, -1.085052, 0, 0, 0, 1, 1,
-0.2091304, -0.4952731, -2.889968, 0, 0, 0, 1, 1,
-0.2079749, -1.205878, -2.532303, 0, 0, 0, 1, 1,
-0.2068747, 0.2582019, -0.5086235, 1, 1, 1, 1, 1,
-0.2050705, -0.1109217, -1.994529, 1, 1, 1, 1, 1,
-0.2041861, -0.3916085, -2.793597, 1, 1, 1, 1, 1,
-0.1925455, -1.630402, -3.067037, 1, 1, 1, 1, 1,
-0.1917383, -2.192398, -3.599702, 1, 1, 1, 1, 1,
-0.1892186, 1.249789, 1.004042, 1, 1, 1, 1, 1,
-0.1881806, 0.5271341, -1.742275, 1, 1, 1, 1, 1,
-0.1831114, 0.3761583, 0.1307568, 1, 1, 1, 1, 1,
-0.1798556, 0.03342844, -1.156292, 1, 1, 1, 1, 1,
-0.1757145, -0.1366521, -2.245395, 1, 1, 1, 1, 1,
-0.169495, 0.563594, -0.8686385, 1, 1, 1, 1, 1,
-0.1680766, 0.8024504, -0.2214283, 1, 1, 1, 1, 1,
-0.1664273, 0.8666554, -0.4948965, 1, 1, 1, 1, 1,
-0.1620329, 0.5115432, 0.2535778, 1, 1, 1, 1, 1,
-0.154966, -1.434014, -3.161661, 1, 1, 1, 1, 1,
-0.1520551, -0.0235347, -2.313088, 0, 0, 1, 1, 1,
-0.1512958, 0.09115373, -0.06840075, 1, 0, 0, 1, 1,
-0.1511904, 0.6399435, 0.2521284, 1, 0, 0, 1, 1,
-0.1431049, 0.6952307, -2.249928, 1, 0, 0, 1, 1,
-0.1382378, -1.710754, -4.547616, 1, 0, 0, 1, 1,
-0.1347522, -0.118611, -1.244596, 1, 0, 0, 1, 1,
-0.1335994, -1.481511, -3.396992, 0, 0, 0, 1, 1,
-0.1324779, -0.4132092, -2.157616, 0, 0, 0, 1, 1,
-0.1286486, 1.676735, 0.1675243, 0, 0, 0, 1, 1,
-0.1251646, 1.268505, -0.9352018, 0, 0, 0, 1, 1,
-0.1250523, 1.041691, -0.780928, 0, 0, 0, 1, 1,
-0.1223034, -0.5474053, -2.868895, 0, 0, 0, 1, 1,
-0.1207437, 1.938861, -0.847888, 0, 0, 0, 1, 1,
-0.119579, -1.779351, -2.535678, 1, 1, 1, 1, 1,
-0.117865, 0.4130917, -1.243958, 1, 1, 1, 1, 1,
-0.1146176, -0.6363394, -3.522915, 1, 1, 1, 1, 1,
-0.1110112, -1.279069, -3.397953, 1, 1, 1, 1, 1,
-0.1076113, 0.6348707, 0.6734394, 1, 1, 1, 1, 1,
-0.1069627, -0.3242835, -3.085438, 1, 1, 1, 1, 1,
-0.1054749, -0.0707892, -1.377946, 1, 1, 1, 1, 1,
-0.105144, -0.4847254, -2.434519, 1, 1, 1, 1, 1,
-0.1022569, -0.6440557, -4.089534, 1, 1, 1, 1, 1,
-0.1003155, -1.257593, -4.270755, 1, 1, 1, 1, 1,
-0.100243, 0.1067015, -0.4535003, 1, 1, 1, 1, 1,
-0.09546955, -0.6578529, -4.174563, 1, 1, 1, 1, 1,
-0.0950965, 0.5099998, -2.08888, 1, 1, 1, 1, 1,
-0.09294634, 0.7811646, -0.9545955, 1, 1, 1, 1, 1,
-0.09134012, 0.6409302, 0.8265494, 1, 1, 1, 1, 1,
-0.09091742, 1.142741, -0.6018938, 0, 0, 1, 1, 1,
-0.09019973, -0.7929746, -3.596316, 1, 0, 0, 1, 1,
-0.0875392, 0.2714086, -0.9076034, 1, 0, 0, 1, 1,
-0.08721144, 0.5968406, -1.430399, 1, 0, 0, 1, 1,
-0.08664637, 1.628117, -4.120589, 1, 0, 0, 1, 1,
-0.08634928, 0.7834459, -0.9562358, 1, 0, 0, 1, 1,
-0.08615651, -0.0211844, -2.206559, 0, 0, 0, 1, 1,
-0.08462334, -0.9095905, -2.567546, 0, 0, 0, 1, 1,
-0.08237715, -1.38537, -1.644582, 0, 0, 0, 1, 1,
-0.07610336, -0.9650252, -3.302024, 0, 0, 0, 1, 1,
-0.07558213, 0.6156241, -0.8186447, 0, 0, 0, 1, 1,
-0.07293375, -1.478069, -3.62615, 0, 0, 0, 1, 1,
-0.07199821, 1.581952, -1.280784, 0, 0, 0, 1, 1,
-0.06691585, -0.08214491, -1.725798, 1, 1, 1, 1, 1,
-0.05970884, -2.064959, -3.047117, 1, 1, 1, 1, 1,
-0.05185223, 0.6278018, -1.410997, 1, 1, 1, 1, 1,
-0.05134265, 0.1594871, -1.242647, 1, 1, 1, 1, 1,
-0.04308492, -0.8402019, -3.205202, 1, 1, 1, 1, 1,
-0.03932324, -0.3807819, -1.884108, 1, 1, 1, 1, 1,
-0.03742519, 0.9126432, 0.3144941, 1, 1, 1, 1, 1,
-0.03592236, 1.170005, 0.3728401, 1, 1, 1, 1, 1,
-0.03455548, 1.526838, 1.208513, 1, 1, 1, 1, 1,
-0.0290121, 0.7357355, 0.7453127, 1, 1, 1, 1, 1,
-0.02886498, 0.6498668, -1.533726, 1, 1, 1, 1, 1,
-0.02821652, 0.3331337, 1.785813, 1, 1, 1, 1, 1,
-0.02788638, -1.466944, -3.115626, 1, 1, 1, 1, 1,
-0.02421336, -0.03293688, -2.820447, 1, 1, 1, 1, 1,
-0.02108883, 0.3993244, 0.7286234, 1, 1, 1, 1, 1,
-0.02059387, -0.9637433, -1.476262, 0, 0, 1, 1, 1,
-0.0189139, 1.055998, 0.4468979, 1, 0, 0, 1, 1,
-0.01880978, 1.399079, -2.719419, 1, 0, 0, 1, 1,
-0.0110893, 1.264706, -0.08173843, 1, 0, 0, 1, 1,
-0.007608211, 0.9117552, -0.5389337, 1, 0, 0, 1, 1,
-0.005686005, -0.3838283, -5.167208, 1, 0, 0, 1, 1,
-0.004449622, 0.239436, 1.68704, 0, 0, 0, 1, 1,
0.001862913, 0.8667492, -0.02831566, 0, 0, 0, 1, 1,
0.003845761, 0.7343435, 0.01860017, 0, 0, 0, 1, 1,
0.005215527, -1.872988, 2.815232, 0, 0, 0, 1, 1,
0.009080532, 0.7940165, 0.2442194, 0, 0, 0, 1, 1,
0.01080291, -0.7662268, 2.921419, 0, 0, 0, 1, 1,
0.01279233, 0.2202845, -0.8671017, 0, 0, 0, 1, 1,
0.01566862, -2.354222, 4.009654, 1, 1, 1, 1, 1,
0.01776873, -0.9056802, 3.777364, 1, 1, 1, 1, 1,
0.0192883, 1.824759, 0.515083, 1, 1, 1, 1, 1,
0.01982593, 0.9309401, -0.3077245, 1, 1, 1, 1, 1,
0.02215715, 1.540264, 2.087236, 1, 1, 1, 1, 1,
0.02249346, 0.5996749, -0.01594652, 1, 1, 1, 1, 1,
0.02392264, 0.07052648, 0.1196671, 1, 1, 1, 1, 1,
0.02992086, -1.558252, 3.105587, 1, 1, 1, 1, 1,
0.03374503, -1.243953, 3.804341, 1, 1, 1, 1, 1,
0.03699703, -0.8939328, 4.228662, 1, 1, 1, 1, 1,
0.03749109, -0.7049505, 3.077831, 1, 1, 1, 1, 1,
0.03765622, 1.076032, 0.5641055, 1, 1, 1, 1, 1,
0.03779138, 0.02130699, -0.08166187, 1, 1, 1, 1, 1,
0.03934145, -0.7009579, 3.099289, 1, 1, 1, 1, 1,
0.04713214, -1.308144, 2.026325, 1, 1, 1, 1, 1,
0.04781248, 0.9358199, -1.340803, 0, 0, 1, 1, 1,
0.05222177, 0.8550733, 0.9207814, 1, 0, 0, 1, 1,
0.06068781, 1.869278, 0.6605757, 1, 0, 0, 1, 1,
0.06221333, 0.7154919, 0.3081654, 1, 0, 0, 1, 1,
0.06292157, -0.3707101, 1.889092, 1, 0, 0, 1, 1,
0.07170899, -1.423087, 5.216599, 1, 0, 0, 1, 1,
0.07403006, -0.6122702, 2.845273, 0, 0, 0, 1, 1,
0.07416428, 0.4912605, 1.967017, 0, 0, 0, 1, 1,
0.07765057, -0.405957, 0.6183347, 0, 0, 0, 1, 1,
0.0783848, 1.323041, 1.618852, 0, 0, 0, 1, 1,
0.0799, -0.7849767, 1.941658, 0, 0, 0, 1, 1,
0.08235625, 1.170449, 2.359219, 0, 0, 0, 1, 1,
0.08514392, -0.8860002, 2.101566, 0, 0, 0, 1, 1,
0.08690587, -1.094265, 1.561809, 1, 1, 1, 1, 1,
0.08780643, 0.8411052, -0.456364, 1, 1, 1, 1, 1,
0.0892645, 0.7325383, -0.8098869, 1, 1, 1, 1, 1,
0.08993467, 1.415731, 0.3651815, 1, 1, 1, 1, 1,
0.09273085, 0.3178048, -0.7872494, 1, 1, 1, 1, 1,
0.096457, 1.475406, -0.05630494, 1, 1, 1, 1, 1,
0.09862797, 0.4831422, 0.1911271, 1, 1, 1, 1, 1,
0.09945986, 1.341844, 1.434792, 1, 1, 1, 1, 1,
0.1022389, 0.07697724, -0.8884811, 1, 1, 1, 1, 1,
0.1048598, 0.4940926, 0.2303311, 1, 1, 1, 1, 1,
0.1050354, 1.806865, 0.6540592, 1, 1, 1, 1, 1,
0.1054017, -0.2092199, 3.676271, 1, 1, 1, 1, 1,
0.1059379, 0.7285936, 0.1965496, 1, 1, 1, 1, 1,
0.1082261, 0.6986563, -0.9661378, 1, 1, 1, 1, 1,
0.1141718, -0.7423004, 2.863659, 1, 1, 1, 1, 1,
0.1167709, 1.535863, -1.19345, 0, 0, 1, 1, 1,
0.1230593, -1.4713, 1.666687, 1, 0, 0, 1, 1,
0.1240158, 0.2906569, 1.584485, 1, 0, 0, 1, 1,
0.1243429, 0.1676507, 0.3254292, 1, 0, 0, 1, 1,
0.1287392, 0.2843415, 0.3188731, 1, 0, 0, 1, 1,
0.1288008, 1.145276, -0.6199799, 1, 0, 0, 1, 1,
0.1299937, -0.1802659, 1.984375, 0, 0, 0, 1, 1,
0.1444172, -0.9564678, 0.04323392, 0, 0, 0, 1, 1,
0.1463618, -1.015517, 3.741433, 0, 0, 0, 1, 1,
0.146905, -1.271548, 3.048619, 0, 0, 0, 1, 1,
0.148075, -1.514115, 3.00772, 0, 0, 0, 1, 1,
0.1552407, 1.405136, 1.528816, 0, 0, 0, 1, 1,
0.1679505, -0.6932078, 4.384339, 0, 0, 0, 1, 1,
0.1699429, 1.024714, 0.4661196, 1, 1, 1, 1, 1,
0.1700419, 0.5399193, 1.532162, 1, 1, 1, 1, 1,
0.171327, -1.215719, 3.910436, 1, 1, 1, 1, 1,
0.1736883, 0.7862444, 0.2228464, 1, 1, 1, 1, 1,
0.1747372, -0.09080469, 2.117007, 1, 1, 1, 1, 1,
0.1748923, 0.04179836, 1.566025, 1, 1, 1, 1, 1,
0.176886, -0.3569774, 3.68717, 1, 1, 1, 1, 1,
0.1776651, 1.213506, -1.781536, 1, 1, 1, 1, 1,
0.1851255, -0.758121, 1.611786, 1, 1, 1, 1, 1,
0.1875387, 0.2439912, 2.202265, 1, 1, 1, 1, 1,
0.1875953, -1.892608, 3.226419, 1, 1, 1, 1, 1,
0.1904324, -0.7530364, 2.957075, 1, 1, 1, 1, 1,
0.1915979, 1.646404, 0.1832334, 1, 1, 1, 1, 1,
0.1957285, 0.4930028, -0.3175991, 1, 1, 1, 1, 1,
0.1971949, -0.5291284, 4.447522, 1, 1, 1, 1, 1,
0.1981366, 1.128958, -1.108879, 0, 0, 1, 1, 1,
0.204142, 0.820709, 1.372131, 1, 0, 0, 1, 1,
0.2066749, 1.643079, -1.088176, 1, 0, 0, 1, 1,
0.2109106, 1.120516, 1.074147, 1, 0, 0, 1, 1,
0.2109829, 0.5852775, -0.2457964, 1, 0, 0, 1, 1,
0.2124216, -1.954894, 4.417569, 1, 0, 0, 1, 1,
0.2138369, 1.69786, 0.1274683, 0, 0, 0, 1, 1,
0.216672, -0.09831341, 1.464144, 0, 0, 0, 1, 1,
0.2171666, 1.073567, 0.05599361, 0, 0, 0, 1, 1,
0.2176245, 1.490332, -1.301031, 0, 0, 0, 1, 1,
0.219955, 0.8640809, -0.966226, 0, 0, 0, 1, 1,
0.2200643, 0.6464937, 0.936191, 0, 0, 0, 1, 1,
0.2207129, -0.8646156, 1.764634, 0, 0, 0, 1, 1,
0.2217218, 0.4770297, 0.570076, 1, 1, 1, 1, 1,
0.223713, -1.215021, 3.036506, 1, 1, 1, 1, 1,
0.2245116, 1.166025, 1.205042, 1, 1, 1, 1, 1,
0.2254372, -0.4477113, 1.481431, 1, 1, 1, 1, 1,
0.2263411, -0.2172091, -0.02362951, 1, 1, 1, 1, 1,
0.228467, -0.5658047, 2.686194, 1, 1, 1, 1, 1,
0.2295706, -1.040904, 3.672012, 1, 1, 1, 1, 1,
0.236884, -0.9035831, 2.303905, 1, 1, 1, 1, 1,
0.237291, -0.2421483, 3.285254, 1, 1, 1, 1, 1,
0.2374064, 0.4014239, -0.6161934, 1, 1, 1, 1, 1,
0.2374804, -0.4761639, 2.913206, 1, 1, 1, 1, 1,
0.2389572, -0.2797534, 3.424002, 1, 1, 1, 1, 1,
0.2424673, 0.8004462, 0.8350016, 1, 1, 1, 1, 1,
0.2431307, 0.2089574, -0.000886991, 1, 1, 1, 1, 1,
0.2458361, 0.1527558, 0.6655744, 1, 1, 1, 1, 1,
0.2478141, -2.577, 1.916041, 0, 0, 1, 1, 1,
0.2482643, -0.6105139, 3.651827, 1, 0, 0, 1, 1,
0.2484712, -0.5048018, 3.901649, 1, 0, 0, 1, 1,
0.2492262, 0.3480058, 0.426662, 1, 0, 0, 1, 1,
0.2492776, -0.6495512, 4.837499, 1, 0, 0, 1, 1,
0.2519112, 0.5700554, -0.9672221, 1, 0, 0, 1, 1,
0.2549364, -0.735785, 3.059686, 0, 0, 0, 1, 1,
0.2596103, 1.537884, 1.604623, 0, 0, 0, 1, 1,
0.2617191, -0.8705219, 1.865903, 0, 0, 0, 1, 1,
0.2624385, 0.2819893, -0.8881745, 0, 0, 0, 1, 1,
0.2631672, -0.16481, 1.568659, 0, 0, 0, 1, 1,
0.2642907, -0.6586571, 1.000952, 0, 0, 0, 1, 1,
0.2659782, 0.1704126, 2.418299, 0, 0, 0, 1, 1,
0.269429, 0.734709, -1.104125, 1, 1, 1, 1, 1,
0.2715518, -1.328619, 4.317684, 1, 1, 1, 1, 1,
0.2744762, -1.975806, 2.67666, 1, 1, 1, 1, 1,
0.2747847, -0.05240782, 2.187213, 1, 1, 1, 1, 1,
0.2813199, 0.6593626, 1.298596, 1, 1, 1, 1, 1,
0.2840919, -0.5215423, 1.581553, 1, 1, 1, 1, 1,
0.2842118, -0.6458411, 0.4834697, 1, 1, 1, 1, 1,
0.2870433, 0.4435453, 0.2616679, 1, 1, 1, 1, 1,
0.288221, 0.7528203, 0.520649, 1, 1, 1, 1, 1,
0.2891128, -1.351551, 3.411416, 1, 1, 1, 1, 1,
0.2899658, -0.9843288, 2.75703, 1, 1, 1, 1, 1,
0.2955487, 0.7958952, 0.3352139, 1, 1, 1, 1, 1,
0.3001208, 1.880787, 0.6891602, 1, 1, 1, 1, 1,
0.3032012, 0.7021109, 0.925337, 1, 1, 1, 1, 1,
0.3158502, 1.812626, -0.03239716, 1, 1, 1, 1, 1,
0.3167805, -0.7573069, 2.714097, 0, 0, 1, 1, 1,
0.3190115, -0.172971, 3.53386, 1, 0, 0, 1, 1,
0.3213291, 1.526431, -0.7134289, 1, 0, 0, 1, 1,
0.3215537, -0.7888859, 4.106538, 1, 0, 0, 1, 1,
0.3236134, 0.211897, 2.647876, 1, 0, 0, 1, 1,
0.3238308, -0.8133247, 1.033289, 1, 0, 0, 1, 1,
0.3245802, 0.5845789, -0.5079983, 0, 0, 0, 1, 1,
0.3291348, -1.111733, 2.638996, 0, 0, 0, 1, 1,
0.3296912, -1.419434, 2.335806, 0, 0, 0, 1, 1,
0.329829, 1.685588, 0.9787659, 0, 0, 0, 1, 1,
0.3302453, 1.473227, 0.443148, 0, 0, 0, 1, 1,
0.3304669, -2.225513, 3.098603, 0, 0, 0, 1, 1,
0.3351941, 0.9444591, -1.126088, 0, 0, 0, 1, 1,
0.3374053, -1.62992, 1.777279, 1, 1, 1, 1, 1,
0.3446454, 1.773177, -0.3734212, 1, 1, 1, 1, 1,
0.3518152, 0.7018967, 0.4937418, 1, 1, 1, 1, 1,
0.3533852, -0.5872934, 3.056499, 1, 1, 1, 1, 1,
0.3545597, 0.8316983, -2.46117, 1, 1, 1, 1, 1,
0.3584543, -0.3651119, 2.492187, 1, 1, 1, 1, 1,
0.3658084, -0.08866242, 0.7536514, 1, 1, 1, 1, 1,
0.3677443, 0.3828334, 0.549651, 1, 1, 1, 1, 1,
0.3704099, 0.005096798, 2.377238, 1, 1, 1, 1, 1,
0.3712969, -0.4260427, 4.347938, 1, 1, 1, 1, 1,
0.3761256, 0.3050442, 1.480066, 1, 1, 1, 1, 1,
0.3856454, 0.8762593, 0.2485621, 1, 1, 1, 1, 1,
0.3857827, 0.298057, 2.142973, 1, 1, 1, 1, 1,
0.3859589, 0.09932613, 0.3504125, 1, 1, 1, 1, 1,
0.389001, 0.09100848, 1.35358, 1, 1, 1, 1, 1,
0.3938197, -1.422228, 3.636724, 0, 0, 1, 1, 1,
0.39783, 0.6509396, -0.1535266, 1, 0, 0, 1, 1,
0.3980682, 0.2242952, 1.078673, 1, 0, 0, 1, 1,
0.3996135, -1.388394, 3.055268, 1, 0, 0, 1, 1,
0.400712, -0.9976986, 0.5741119, 1, 0, 0, 1, 1,
0.4081049, 1.178058, 0.5690831, 1, 0, 0, 1, 1,
0.409251, 0.3213499, 1.008159, 0, 0, 0, 1, 1,
0.4139146, -2.229701, 3.082555, 0, 0, 0, 1, 1,
0.422688, 0.1887012, 0.5759437, 0, 0, 0, 1, 1,
0.4239308, 0.8671037, -0.9919924, 0, 0, 0, 1, 1,
0.4242025, 0.1681055, 1.925198, 0, 0, 0, 1, 1,
0.4244734, -1.330554, 1.928489, 0, 0, 0, 1, 1,
0.4263952, -1.27128, 4.262577, 0, 0, 0, 1, 1,
0.4324873, 0.5706658, -1.078689, 1, 1, 1, 1, 1,
0.4337058, 0.8377517, 0.126432, 1, 1, 1, 1, 1,
0.4394101, 1.498661, 0.6842351, 1, 1, 1, 1, 1,
0.4408376, 0.8612753, 1.337253, 1, 1, 1, 1, 1,
0.4409946, -0.2117495, 2.63689, 1, 1, 1, 1, 1,
0.4415421, 0.8787017, 0.9397467, 1, 1, 1, 1, 1,
0.4436577, 2.383479, -0.5563614, 1, 1, 1, 1, 1,
0.4444264, 0.6731821, 1.038726, 1, 1, 1, 1, 1,
0.4538888, 0.0768506, 2.333604, 1, 1, 1, 1, 1,
0.4607903, -0.8296795, 2.524765, 1, 1, 1, 1, 1,
0.4694761, -0.9400617, 2.583816, 1, 1, 1, 1, 1,
0.4712128, -1.097063, 2.717472, 1, 1, 1, 1, 1,
0.4714799, 0.7393593, -0.3681956, 1, 1, 1, 1, 1,
0.4744018, 1.338828, 1.792501, 1, 1, 1, 1, 1,
0.4773331, 1.362504, -1.642694, 1, 1, 1, 1, 1,
0.4778136, -0.02998409, 2.722615, 0, 0, 1, 1, 1,
0.4793518, 0.4296769, 3.911022, 1, 0, 0, 1, 1,
0.4820177, 0.3120199, 0.7803869, 1, 0, 0, 1, 1,
0.4826469, 0.7171125, 1.049251, 1, 0, 0, 1, 1,
0.4891188, -0.2151947, 2.619077, 1, 0, 0, 1, 1,
0.4900219, -0.06889252, 0.4142246, 1, 0, 0, 1, 1,
0.4966016, 1.02237, 1.846385, 0, 0, 0, 1, 1,
0.501085, -0.9715973, 1.766907, 0, 0, 0, 1, 1,
0.5101945, -0.9243073, 3.151004, 0, 0, 0, 1, 1,
0.5124046, -1.677939, 2.637808, 0, 0, 0, 1, 1,
0.5144927, -2.530124, 0.6873018, 0, 0, 0, 1, 1,
0.5198123, -0.9188238, 3.155641, 0, 0, 0, 1, 1,
0.5254145, 1.097831, 2.207139, 0, 0, 0, 1, 1,
0.5265368, 0.7324095, 0.01081924, 1, 1, 1, 1, 1,
0.5273422, 0.7635959, -0.621173, 1, 1, 1, 1, 1,
0.529952, 1.578777, -0.06883294, 1, 1, 1, 1, 1,
0.531985, -0.2365102, 3.135741, 1, 1, 1, 1, 1,
0.5432221, 0.240278, 1.527603, 1, 1, 1, 1, 1,
0.5470771, -1.260007, 3.552021, 1, 1, 1, 1, 1,
0.5471974, -0.4273522, 2.096372, 1, 1, 1, 1, 1,
0.549772, 0.2524242, 1.106808, 1, 1, 1, 1, 1,
0.5501298, 0.937454, 0.5767203, 1, 1, 1, 1, 1,
0.5607726, 1.610863, 1.359697, 1, 1, 1, 1, 1,
0.5623114, 1.512348, -1.080658, 1, 1, 1, 1, 1,
0.5628972, 1.05431, 1.159835, 1, 1, 1, 1, 1,
0.5709876, -0.1810261, 2.069158, 1, 1, 1, 1, 1,
0.5712448, 1.732078, -0.6494673, 1, 1, 1, 1, 1,
0.5729219, 1.350013, 0.842159, 1, 1, 1, 1, 1,
0.576176, -0.6076134, 3.670104, 0, 0, 1, 1, 1,
0.5808376, 0.7361706, 1.554227, 1, 0, 0, 1, 1,
0.5810172, 0.5157828, 0.7190237, 1, 0, 0, 1, 1,
0.5865151, -1.046984, 2.031143, 1, 0, 0, 1, 1,
0.5903355, -1.214565, 2.257262, 1, 0, 0, 1, 1,
0.5904295, -1.193949, 2.451585, 1, 0, 0, 1, 1,
0.5909925, -0.3798283, 3.09816, 0, 0, 0, 1, 1,
0.5997459, -1.290711, 3.303329, 0, 0, 0, 1, 1,
0.607876, -0.7632369, 3.065305, 0, 0, 0, 1, 1,
0.61082, 0.7879663, 0.165775, 0, 0, 0, 1, 1,
0.6112071, 1.292421, -1.022395, 0, 0, 0, 1, 1,
0.6136743, 1.003001, -0.8750175, 0, 0, 0, 1, 1,
0.6188256, -0.3176293, 1.072686, 0, 0, 0, 1, 1,
0.6192026, -0.2552677, 0.9914111, 1, 1, 1, 1, 1,
0.6248683, 0.2125061, 2.132921, 1, 1, 1, 1, 1,
0.6257254, -0.7330464, 3.493828, 1, 1, 1, 1, 1,
0.6315435, -0.08853829, 1.493462, 1, 1, 1, 1, 1,
0.63422, 1.238054, 1.709245, 1, 1, 1, 1, 1,
0.6352993, -1.799344, 1.527402, 1, 1, 1, 1, 1,
0.6358313, 1.479717, 2.133001, 1, 1, 1, 1, 1,
0.6360681, -0.7976347, 2.128537, 1, 1, 1, 1, 1,
0.637446, -1.453131, 3.558934, 1, 1, 1, 1, 1,
0.6480236, 1.495851, 1.678149, 1, 1, 1, 1, 1,
0.6480712, 0.3415124, 0.1511414, 1, 1, 1, 1, 1,
0.654918, -1.805469, 3.334936, 1, 1, 1, 1, 1,
0.6550713, 0.4462496, 1.131169, 1, 1, 1, 1, 1,
0.6596484, -0.8122534, 4.206954, 1, 1, 1, 1, 1,
0.6603832, 0.1408024, 2.609762, 1, 1, 1, 1, 1,
0.6669411, 0.3873604, -0.976781, 0, 0, 1, 1, 1,
0.6683217, -0.101139, 1.866064, 1, 0, 0, 1, 1,
0.6702049, -0.6734459, 0.9828523, 1, 0, 0, 1, 1,
0.6744209, -0.8610812, 1.744483, 1, 0, 0, 1, 1,
0.6750751, 1.023617, -0.4768744, 1, 0, 0, 1, 1,
0.6760288, 0.6084114, 0.2077934, 1, 0, 0, 1, 1,
0.6801023, 0.9971284, -0.6529648, 0, 0, 0, 1, 1,
0.6808053, 0.3324309, 1.918493, 0, 0, 0, 1, 1,
0.6864054, -0.9727467, 3.597332, 0, 0, 0, 1, 1,
0.691209, -1.190407, 1.98226, 0, 0, 0, 1, 1,
0.6932747, -0.2554041, 1.153584, 0, 0, 0, 1, 1,
0.7004789, 0.737391, -0.3504857, 0, 0, 0, 1, 1,
0.7006761, -0.3169033, 3.707315, 0, 0, 0, 1, 1,
0.7012513, -0.01625784, 1.842952, 1, 1, 1, 1, 1,
0.7033631, 1.231547, -0.2767199, 1, 1, 1, 1, 1,
0.7055274, -0.2985286, 1.497128, 1, 1, 1, 1, 1,
0.7100016, 0.5505424, 1.878721, 1, 1, 1, 1, 1,
0.7107455, -1.841805, 1.680786, 1, 1, 1, 1, 1,
0.7171928, 0.7360485, 0.3369291, 1, 1, 1, 1, 1,
0.7223967, 1.397538, 1.068478, 1, 1, 1, 1, 1,
0.7244453, -0.5877127, 1.877058, 1, 1, 1, 1, 1,
0.7293209, -0.9382935, 2.22142, 1, 1, 1, 1, 1,
0.7427464, 1.539133, 0.8672539, 1, 1, 1, 1, 1,
0.7446462, -0.01727667, 2.437492, 1, 1, 1, 1, 1,
0.7531532, 0.8745427, -0.4402357, 1, 1, 1, 1, 1,
0.7583821, -0.4030651, 0.4802852, 1, 1, 1, 1, 1,
0.7590486, 0.4198202, 0.3973288, 1, 1, 1, 1, 1,
0.7600624, -0.3289703, 1.387855, 1, 1, 1, 1, 1,
0.7629256, 0.4420269, 0.06186959, 0, 0, 1, 1, 1,
0.7654901, -1.62142, 2.373243, 1, 0, 0, 1, 1,
0.7721623, -0.2577178, 1.849285, 1, 0, 0, 1, 1,
0.777201, -0.7556715, 2.032905, 1, 0, 0, 1, 1,
0.7843491, 0.5331533, -0.1052803, 1, 0, 0, 1, 1,
0.8002999, -0.6949414, 1.768826, 1, 0, 0, 1, 1,
0.8022931, 0.2883721, 1.272036, 0, 0, 0, 1, 1,
0.8064497, -1.602297, 1.581032, 0, 0, 0, 1, 1,
0.8069326, -0.5442517, 1.774588, 0, 0, 0, 1, 1,
0.8111924, -0.1349481, 5.059008, 0, 0, 0, 1, 1,
0.8147777, 0.6750315, 0.8719302, 0, 0, 0, 1, 1,
0.8159369, -0.4963704, 1.824795, 0, 0, 0, 1, 1,
0.8163113, 0.6323923, 0.1972422, 0, 0, 0, 1, 1,
0.8173114, -1.477419, 2.001185, 1, 1, 1, 1, 1,
0.8174511, 0.08631819, 1.485499, 1, 1, 1, 1, 1,
0.8197529, 0.2605577, -1.115757, 1, 1, 1, 1, 1,
0.8201185, -0.1702529, 2.26738, 1, 1, 1, 1, 1,
0.8235734, 1.083976, 0.2088853, 1, 1, 1, 1, 1,
0.8416471, 0.01864167, 3.255968, 1, 1, 1, 1, 1,
0.8437889, 0.2852368, 1.18133, 1, 1, 1, 1, 1,
0.8471879, 0.8049739, -0.35992, 1, 1, 1, 1, 1,
0.8489552, 0.9048982, -0.9234298, 1, 1, 1, 1, 1,
0.8542496, -2.063255, 2.3522, 1, 1, 1, 1, 1,
0.8566051, -0.7921311, 0.8455676, 1, 1, 1, 1, 1,
0.8675052, -0.7919537, 0.9682422, 1, 1, 1, 1, 1,
0.8821189, -0.6495022, 3.421354, 1, 1, 1, 1, 1,
0.8871992, -2.904193, 4.538005, 1, 1, 1, 1, 1,
0.8886583, -0.01570035, 1.805481, 1, 1, 1, 1, 1,
0.8902895, -1.379714, 1.556195, 0, 0, 1, 1, 1,
0.9016502, -1.04794, 2.84606, 1, 0, 0, 1, 1,
0.9064886, -0.2471179, -0.2359192, 1, 0, 0, 1, 1,
0.9119859, -1.445826, 1.365371, 1, 0, 0, 1, 1,
0.9134817, -1.376323, 2.228138, 1, 0, 0, 1, 1,
0.9200281, 1.149552, -0.2351087, 1, 0, 0, 1, 1,
0.9204039, 0.3109573, 1.65845, 0, 0, 0, 1, 1,
0.925954, -0.3712994, 1.004649, 0, 0, 0, 1, 1,
0.9278447, -0.4241195, 1.411451, 0, 0, 0, 1, 1,
0.9326399, -0.7158692, 3.466285, 0, 0, 0, 1, 1,
0.9349348, 0.6282495, 0.08318775, 0, 0, 0, 1, 1,
0.93707, 0.9107552, 2.401124, 0, 0, 0, 1, 1,
0.937816, -1.000088, 2.651084, 0, 0, 0, 1, 1,
0.9401264, -0.2261747, 3.263946, 1, 1, 1, 1, 1,
0.9469727, 0.01517869, 2.224966, 1, 1, 1, 1, 1,
0.9743906, 0.4920082, 2.41137, 1, 1, 1, 1, 1,
0.9758471, -1.019099, 2.697812, 1, 1, 1, 1, 1,
0.9848133, 0.2666891, 1.071126, 1, 1, 1, 1, 1,
0.9862854, 0.2389093, 1.206999, 1, 1, 1, 1, 1,
0.9867346, 2.130338, 0.3620727, 1, 1, 1, 1, 1,
0.9881235, 0.2865921, 1.915479, 1, 1, 1, 1, 1,
0.9884919, 0.5226626, 1.012645, 1, 1, 1, 1, 1,
0.9913649, 0.4987199, 0.1219526, 1, 1, 1, 1, 1,
0.9962711, 1.603861, 1.926348, 1, 1, 1, 1, 1,
1.004069, 0.9361282, 1.641389, 1, 1, 1, 1, 1,
1.005556, -1.469357, 3.722708, 1, 1, 1, 1, 1,
1.017753, 0.3694374, 1.015646, 1, 1, 1, 1, 1,
1.022328, -0.528971, 1.069886, 1, 1, 1, 1, 1,
1.030634, -0.09523728, 4.35294, 0, 0, 1, 1, 1,
1.032816, -0.645761, 2.787591, 1, 0, 0, 1, 1,
1.032999, 1.279066, 1.110659, 1, 0, 0, 1, 1,
1.036458, 0.8000911, 0.8675983, 1, 0, 0, 1, 1,
1.038701, 1.064557, -0.4161222, 1, 0, 0, 1, 1,
1.048448, -0.6189494, 1.464094, 1, 0, 0, 1, 1,
1.04993, -0.9576688, 0.9338111, 0, 0, 0, 1, 1,
1.051064, -0.4180373, 1.275833, 0, 0, 0, 1, 1,
1.056023, 0.6779664, 0.7923331, 0, 0, 0, 1, 1,
1.058193, -0.9367094, 1.245512, 0, 0, 0, 1, 1,
1.058201, -0.5480525, 2.48192, 0, 0, 0, 1, 1,
1.059837, 1.126887, -0.7249864, 0, 0, 0, 1, 1,
1.07937, -0.4442106, 1.649233, 0, 0, 0, 1, 1,
1.080991, -0.2105269, 1.596386, 1, 1, 1, 1, 1,
1.082238, 0.6881589, 0.6122218, 1, 1, 1, 1, 1,
1.083563, 0.8460373, 0.3049634, 1, 1, 1, 1, 1,
1.092663, -0.3322261, 3.952387, 1, 1, 1, 1, 1,
1.093099, -1.506429, 1.29401, 1, 1, 1, 1, 1,
1.094262, 0.4257923, 2.499993, 1, 1, 1, 1, 1,
1.100196, -1.046038, 2.577133, 1, 1, 1, 1, 1,
1.102469, -0.7944782, 2.188846, 1, 1, 1, 1, 1,
1.10503, -1.035008, 2.14754, 1, 1, 1, 1, 1,
1.111958, -0.5849979, 1.349984, 1, 1, 1, 1, 1,
1.117239, 1.288256, 2.352615, 1, 1, 1, 1, 1,
1.117272, -0.8032092, 1.167416, 1, 1, 1, 1, 1,
1.121848, 1.592908, 1.508555, 1, 1, 1, 1, 1,
1.122561, 1.46056, 0.9473483, 1, 1, 1, 1, 1,
1.127726, -0.793714, 2.875082, 1, 1, 1, 1, 1,
1.128695, -0.1138391, 0.4669323, 0, 0, 1, 1, 1,
1.130244, -0.32015, 2.425694, 1, 0, 0, 1, 1,
1.138454, -0.1690391, 0.5503001, 1, 0, 0, 1, 1,
1.140306, -0.9393734, 4.534178, 1, 0, 0, 1, 1,
1.143749, 0.4041426, 1.815361, 1, 0, 0, 1, 1,
1.146821, -0.5838106, 3.08977, 1, 0, 0, 1, 1,
1.147334, -0.7564071, 3.212883, 0, 0, 0, 1, 1,
1.147393, 1.237908, -0.8728179, 0, 0, 0, 1, 1,
1.152055, -0.5166348, 0.3640555, 0, 0, 0, 1, 1,
1.154927, 0.2595317, 0.7169118, 0, 0, 0, 1, 1,
1.16361, 0.5689121, 0.04831632, 0, 0, 0, 1, 1,
1.178782, 0.4595433, 0.792529, 0, 0, 0, 1, 1,
1.18752, 1.163835, 0.4618758, 0, 0, 0, 1, 1,
1.193033, 0.1754619, 2.430632, 1, 1, 1, 1, 1,
1.202953, -0.3434518, 3.038454, 1, 1, 1, 1, 1,
1.206767, -0.5112276, 0.4745466, 1, 1, 1, 1, 1,
1.209588, -0.1173794, 0.7235355, 1, 1, 1, 1, 1,
1.216477, 0.02118473, -0.178853, 1, 1, 1, 1, 1,
1.217885, -1.086576, 2.819813, 1, 1, 1, 1, 1,
1.220129, 1.07647, -0.3497184, 1, 1, 1, 1, 1,
1.224468, 1.631861, 1.804896, 1, 1, 1, 1, 1,
1.225945, -0.3706124, 2.678989, 1, 1, 1, 1, 1,
1.226097, 0.07072333, 3.543885, 1, 1, 1, 1, 1,
1.226321, 1.7305, -0.6086359, 1, 1, 1, 1, 1,
1.228587, 2.406857, 0.06793325, 1, 1, 1, 1, 1,
1.234872, -0.05474102, 1.706265, 1, 1, 1, 1, 1,
1.259903, -2.184391, 5.287246, 1, 1, 1, 1, 1,
1.260335, 0.4945716, 1.069984, 1, 1, 1, 1, 1,
1.264307, -0.009457992, 1.769002, 0, 0, 1, 1, 1,
1.275677, -1.893967, 1.99565, 1, 0, 0, 1, 1,
1.287991, 1.134868, -0.1220182, 1, 0, 0, 1, 1,
1.290951, 0.1319138, 0.8664281, 1, 0, 0, 1, 1,
1.292255, 0.2719722, 2.833436, 1, 0, 0, 1, 1,
1.293506, 0.9309907, -0.4079782, 1, 0, 0, 1, 1,
1.294, -0.2335937, 0.8524035, 0, 0, 0, 1, 1,
1.297452, 0.07747758, 1.26724, 0, 0, 0, 1, 1,
1.299162, -0.5968838, 1.212994, 0, 0, 0, 1, 1,
1.319129, 1.112833, 0.5472133, 0, 0, 0, 1, 1,
1.331895, -0.03320216, 1.106405, 0, 0, 0, 1, 1,
1.34086, 0.2835265, 0.4294209, 0, 0, 0, 1, 1,
1.366292, -1.251858, 3.074564, 0, 0, 0, 1, 1,
1.373442, -0.07357003, 0.8264145, 1, 1, 1, 1, 1,
1.375736, -1.524618, 3.42959, 1, 1, 1, 1, 1,
1.382024, 0.4342384, 2.17887, 1, 1, 1, 1, 1,
1.382808, 0.280607, 2.617692, 1, 1, 1, 1, 1,
1.382963, -0.2592046, 1.636268, 1, 1, 1, 1, 1,
1.386351, -0.8037807, 2.175688, 1, 1, 1, 1, 1,
1.392727, 1.039764, 1.626101, 1, 1, 1, 1, 1,
1.403633, -1.176264, 4.313499, 1, 1, 1, 1, 1,
1.404736, -0.9432918, 2.367355, 1, 1, 1, 1, 1,
1.411901, -0.1493832, 1.174949, 1, 1, 1, 1, 1,
1.418138, -0.5121412, 3.608796, 1, 1, 1, 1, 1,
1.419606, 0.8450702, 1.412371, 1, 1, 1, 1, 1,
1.419631, -0.4918872, 1.376822, 1, 1, 1, 1, 1,
1.423645, 1.26457, -0.2583194, 1, 1, 1, 1, 1,
1.426507, 0.745899, 1.026283, 1, 1, 1, 1, 1,
1.440272, -1.554068, 3.334652, 0, 0, 1, 1, 1,
1.441144, 0.1934481, 0.8082459, 1, 0, 0, 1, 1,
1.465398, 0.7066805, 0.6911026, 1, 0, 0, 1, 1,
1.467423, 0.4550012, 0.3321126, 1, 0, 0, 1, 1,
1.471763, 0.5263277, 1.543251, 1, 0, 0, 1, 1,
1.476067, -0.3724348, 2.622548, 1, 0, 0, 1, 1,
1.482813, -0.609157, 2.728172, 0, 0, 0, 1, 1,
1.483876, 0.536169, 0.8096142, 0, 0, 0, 1, 1,
1.489815, 0.8685331, 2.047396, 0, 0, 0, 1, 1,
1.491978, -0.5113785, 0.9130126, 0, 0, 0, 1, 1,
1.501951, -0.9278077, 1.711434, 0, 0, 0, 1, 1,
1.504207, -0.03953483, 3.067369, 0, 0, 0, 1, 1,
1.505261, 0.6543339, 0.7178217, 0, 0, 0, 1, 1,
1.505914, 0.2335139, 1.147406, 1, 1, 1, 1, 1,
1.516495, -0.4573809, -0.4219889, 1, 1, 1, 1, 1,
1.521284, -0.7687404, 2.746362, 1, 1, 1, 1, 1,
1.523702, -1.437338, 2.103689, 1, 1, 1, 1, 1,
1.541649, -0.3288645, 0.7345163, 1, 1, 1, 1, 1,
1.55027, 2.662824, 2.457699, 1, 1, 1, 1, 1,
1.553268, -0.3338251, 3.610364, 1, 1, 1, 1, 1,
1.589492, -0.04134331, 1.175515, 1, 1, 1, 1, 1,
1.593372, 0.7724211, 2.119367, 1, 1, 1, 1, 1,
1.605049, 0.4705275, 1.65381, 1, 1, 1, 1, 1,
1.606339, 0.7642471, 2.449997, 1, 1, 1, 1, 1,
1.611914, -0.3260976, 2.752732, 1, 1, 1, 1, 1,
1.61274, -0.9534833, 2.57737, 1, 1, 1, 1, 1,
1.634631, -0.6712989, 0.3825457, 1, 1, 1, 1, 1,
1.639663, -1.079332, 3.731264, 1, 1, 1, 1, 1,
1.657441, 0.4468118, 0.5835294, 0, 0, 1, 1, 1,
1.670055, 0.7332774, 0.1318239, 1, 0, 0, 1, 1,
1.675062, -1.254089, 1.219883, 1, 0, 0, 1, 1,
1.681783, 0.4441203, 2.978453, 1, 0, 0, 1, 1,
1.685683, 1.324083, 0.04114517, 1, 0, 0, 1, 1,
1.731503, -0.07853231, 0.006958913, 1, 0, 0, 1, 1,
1.734979, -0.3967453, 2.14187, 0, 0, 0, 1, 1,
1.739161, -0.7213513, 1.103083, 0, 0, 0, 1, 1,
1.739325, -0.1013539, 0.9599395, 0, 0, 0, 1, 1,
1.740834, 1.04224, 0.6582597, 0, 0, 0, 1, 1,
1.746132, -0.716021, 3.062549, 0, 0, 0, 1, 1,
1.748565, -0.4743263, 1.190612, 0, 0, 0, 1, 1,
1.753045, 0.1647936, 2.310987, 0, 0, 0, 1, 1,
1.755257, 1.145025, 1.563562, 1, 1, 1, 1, 1,
1.79432, -2.038998, 0.713073, 1, 1, 1, 1, 1,
1.806925, -0.3685768, 3.395928, 1, 1, 1, 1, 1,
1.811345, -2.414402, 0.4661643, 1, 1, 1, 1, 1,
1.826115, 0.3337476, -0.7723994, 1, 1, 1, 1, 1,
1.839007, -1.543815, 3.103116, 1, 1, 1, 1, 1,
1.852371, -0.05808458, 1.747569, 1, 1, 1, 1, 1,
1.86469, -0.1528846, 1.594459, 1, 1, 1, 1, 1,
1.872088, -1.589794, 1.436504, 1, 1, 1, 1, 1,
1.874362, -0.1528863, 0.4635074, 1, 1, 1, 1, 1,
1.887881, -0.5465454, 3.143947, 1, 1, 1, 1, 1,
1.927437, -0.1689368, 0.4433896, 1, 1, 1, 1, 1,
1.930561, -1.067402, 1.474149, 1, 1, 1, 1, 1,
1.941648, 0.2231662, 3.406141, 1, 1, 1, 1, 1,
2.048775, 1.674701, 0.7611679, 1, 1, 1, 1, 1,
2.083102, -0.6938328, 2.617333, 0, 0, 1, 1, 1,
2.100641, 0.4813994, 0.8259023, 1, 0, 0, 1, 1,
2.109254, -1.798078, 2.802269, 1, 0, 0, 1, 1,
2.118462, -0.0718846, 0.6762686, 1, 0, 0, 1, 1,
2.157738, -0.8504688, 3.059866, 1, 0, 0, 1, 1,
2.158349, -0.4806299, 0.3886516, 1, 0, 0, 1, 1,
2.193337, 1.027742, 0.3734801, 0, 0, 0, 1, 1,
2.213636, 0.8503042, 2.88391, 0, 0, 0, 1, 1,
2.260846, 0.3597557, 1.861684, 0, 0, 0, 1, 1,
2.285153, 0.1321249, 2.412643, 0, 0, 0, 1, 1,
2.316453, -0.2991145, 0.6996963, 0, 0, 0, 1, 1,
2.376382, 1.629937, 1.125268, 0, 0, 0, 1, 1,
2.388123, 0.3740738, 1.233325, 0, 0, 0, 1, 1,
2.437654, 0.5671653, 1.157303, 1, 1, 1, 1, 1,
2.633751, -0.4573535, 3.307557, 1, 1, 1, 1, 1,
2.634657, 0.1435779, 0.5421454, 1, 1, 1, 1, 1,
2.690566, 1.758329, 0.16897, 1, 1, 1, 1, 1,
2.789243, -0.3915729, 3.752637, 1, 1, 1, 1, 1,
2.807048, -0.2393908, 1.042146, 1, 1, 1, 1, 1,
2.954747, -1.587922, 3.203301, 1, 1, 1, 1, 1
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
var radius = 9.526491;
var distance = 33.4614;
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
mvMatrix.translate( 0.004248619, 0.2773831, -0.04774523 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.4614);
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
